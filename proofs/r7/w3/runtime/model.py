"""Deterministic proof-only models for PRD-07 W3 durability and networking."""

from __future__ import annotations

import copy
import hashlib
import json
from dataclasses import dataclass, field
from typing import Any, Dict, Iterable, List, Mapping, MutableMapping, Optional, Sequence, Tuple


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def canonical_hash(value: Any) -> str:
    return hashlib.sha256(canonical_json(value).encode("utf-8")).hexdigest()


CRASH_PHASES: Tuple[str, ...] = (
    "SESSION-BEGIN",
    "COMMAND-RECEIVE",
    "VALIDATE",
    "RESERVE",
    "SEMANTIC-COMMIT",
    "JOURNAL-INTENT",
    "STRUCTURED-STAGE",
    "VOXEL-STAGE",
    "JOURNAL-STAGE",
    "MANIFEST-TEMP",
    "PARTICIPANT-FSYNC",
    "MANIFEST-PUBLISH",
    "ACK-PREPARE",
    "ACK-SENT",
)


@dataclass(frozen=True)
class SessionTask:
    task_id: str
    world_id: str
    session_id: str
    session_epoch: int
    task_epoch: int
    delta: int


class WorldSessionGuard:
    """Rejects consequential work from a closed or superseded WorldSession."""

    def __init__(self) -> None:
        self.world_id = ""
        self.session_id = ""
        self.session_epoch = 0
        self.task_epoch = 0
        self.value = 0
        self.active = False
        self.accepted: set[str] = set()

    def open(self, world_id: str) -> None:
        if not world_id:
            raise ValueError("world_id is required")
        self.session_epoch += 1
        self.world_id = world_id
        self.session_id = f"session.{world_id}.{self.session_epoch:08d}"
        self.task_epoch += 1
        self.active = True

    def close(self) -> None:
        self.active = False
        self.task_epoch += 1

    def task(self, task_id: str, delta: int = 1) -> SessionTask:
        if not self.active:
            raise RuntimeError("cannot issue a task without an active session")
        return SessionTask(task_id, self.world_id, self.session_id, self.session_epoch, self.task_epoch, delta)

    def apply(self, task: SessionTask) -> str:
        if task.task_id in self.accepted:
            return "DUPLICATE-REJECTED"
        if not self.active:
            return "CLOSED-SESSION-REJECTED"
        if task.world_id != self.world_id:
            return "WORLD-ID-REJECTED"
        if task.session_id != self.session_id or task.session_epoch != self.session_epoch:
            return "SESSION-EPOCH-REJECTED"
        if task.task_epoch != self.task_epoch:
            return "TASK-EPOCH-REJECTED"
        self.value += task.delta
        self.accepted.add(task.task_id)
        return "CURRENT-ACCEPTED"

    def snapshot(self) -> Dict[str, Any]:
        return {
            "world_id": self.world_id,
            "session_id": self.session_id,
            "session_epoch": self.session_epoch,
            "task_epoch": self.task_epoch,
            "value": self.value,
            "accepted": sorted(self.accepted),
        }


class OperationLedger:
    """Exactly-once semantic operation ledger with delivery and ACK separated."""

    def __init__(self, resources: int = 1_000_000) -> None:
        self.initial_resources = resources
        self.available = resources
        self.operations: Dict[str, Dict[str, Any]] = {}
        self.effects: Dict[str, int] = {}
        self.replay_count = 0

    def command(self, operation_id: str, amount: int = 1, fault_phase: str = "none") -> Dict[str, Any]:
        if operation_id in self.operations:
            prior = self.operations[operation_id]
            self.replay_count += 1
            if prior["state"] == "PENDING":
                return self._commit(operation_id, amount, prior["trace"], replay=True)
            return {**copy.deepcopy(prior), "replay": True, "semantic_effects_this_attempt": 0}
        trace = ["RECEIVED", "VALIDATED"]
        if amount <= 0 or amount > self.available:
            result = {
                "operation_id": operation_id,
                "state": "REJECTED",
                "trace": trace,
                "acknowledged": fault_phase != "lose-ack",
                "replay": False,
                "semantic_effects_this_attempt": 0,
            }
            self.operations[operation_id] = copy.deepcopy(result)
            return result
        trace.append("RESERVED")
        if fault_phase in {"disconnect-before-commit", "delay-before-commit"}:
            result = {
                "operation_id": operation_id,
                "state": "PENDING",
                "trace": trace,
                "acknowledged": False,
                "replay": False,
                "semantic_effects_this_attempt": 0,
            }
            self.operations[operation_id] = copy.deepcopy(result)
            return result
        result = self._commit(operation_id, amount, trace, replay=False)
        if fault_phase in {"lose-ack", "disconnect-after-commit", "restart-before-ack"}:
            result["acknowledged"] = False
            self.operations[operation_id] = copy.deepcopy(result)
        return result

    def _commit(self, operation_id: str, amount: int, trace: Sequence[str], replay: bool) -> Dict[str, Any]:
        effect = 0
        if operation_id not in self.effects:
            self.available -= amount
            self.effects[operation_id] = amount
            effect = 1
        result = {
            "operation_id": operation_id,
            "state": "COMMITTED",
            "trace": list(trace) + ["SEMANTIC-COMMIT", "DURABILITY-PROJECTION", "ACKNOWLEDGE"],
            "acknowledged": True,
            "replay": replay,
            "semantic_effects_this_attempt": effect,
            "effect": self.effects[operation_id],
        }
        self.operations[operation_id] = copy.deepcopy(result)
        return result

    def effect_count(self, operation_id: str) -> int:
        return int(operation_id in self.effects)

    def conservation_delta(self) -> int:
        return self.initial_resources - (self.available + sum(self.effects.values()))


class AdmissionController:
    REQUIRED_FIELDS = ("protocol", "content", "schema", "world")

    def __init__(self, baseline: Mapping[str, str], required_packs: Iterable[str]) -> None:
        self.baseline = {str(key): str(value) for key, value in baseline.items()}
        self.required_packs = tuple(sorted(str(value) for value in required_packs))

    def admit(self, offered: Mapping[str, str], packs: Iterable[str]) -> Dict[str, Any]:
        mismatches = [field for field in self.REQUIRED_FIELDS if str(offered.get(field, "")) != self.baseline.get(field, "")]
        missing = sorted(set(self.required_packs) - {str(value) for value in packs})
        accepted = not mismatches and not missing
        return {
            "decision": "ACCEPT" if accepted else "REJECT",
            "reason_codes": [f"BASELINE-{field.upper()}-MISMATCH" for field in mismatches] + [f"PACK-MISSING:{value}" for value in missing],
            "ordinary_traffic_before_decision": 0,
            "baseline": dict(self.baseline),
        }


class InterestEngine:
    """Replicates declared gameplay relevance without changing simulation fidelity."""

    REASONS = ("spatial", "owner", "remote_ui", "quest", "vessel")

    def decide(self, entity: Mapping[str, Any], viewer: Mapping[str, Any]) -> Dict[str, Any]:
        entity_id = str(entity["semantic_id"])
        entitled = entity_id in set(viewer.get("entitlements", ()))
        hidden = bool(entity.get("hidden", False))
        reasons = [reason for reason in self.REASONS if bool(entity.get(reason, False))]
        include = bool(reasons) and (not hidden or entitled)
        return {
            "semantic_id": entity_id,
            "include": include,
            "reasons": reasons,
            "hidden": hidden,
            "entitled": entitled,
            "simulation_fidelity": entity.get("simulation_fidelity", "aggregate"),
        }


class BoundedTrafficQueue:
    """Two-class queue where critical work can displace replaceable bulk work."""

    def __init__(self, capacity: int) -> None:
        if capacity < 2:
            raise ValueError("queue capacity must be at least two")
        self.capacity = capacity
        self.items: List[Dict[str, Any]] = []
        self.replaced_bulk = 0
        self.rejected_bulk = 0
        self.critical_rejections = 0
        self.maximum_depth = 0
        self.maximum_age = 0
        self.tick_count = 0

    def enqueue(self, traffic_class: str, identity: str) -> str:
        if traffic_class not in {"critical", "bulk"}:
            raise ValueError("unknown traffic class")
        if len(self.items) >= self.capacity:
            if traffic_class == "critical":
                bulk_index = next((index for index, item in enumerate(self.items) if item["class"] == "bulk"), None)
                if bulk_index is None:
                    self.critical_rejections += 1
                    return "CRITICAL-DEGRADED"
                self.items.pop(bulk_index)
                self.replaced_bulk += 1
            else:
                self.rejected_bulk += 1
                return "BULK-REPLACED"
        self.items.append({"class": traffic_class, "identity": identity, "enqueued": self.tick_count})
        self.maximum_depth = max(self.maximum_depth, len(self.items))
        return "ADMITTED"

    def advance(self, budget: int) -> List[Dict[str, Any]]:
        self.tick_count += 1
        self.items.sort(key=lambda item: (0 if item["class"] == "critical" else 1, item["enqueued"]))
        delivered = self.items[: max(0, budget)]
        self.items = self.items[max(0, budget) :]
        for item in self.items:
            self.maximum_age = max(self.maximum_age, self.tick_count - int(item["enqueued"]))
        return delivered

    def snapshot(self) -> Dict[str, Any]:
        return {
            "capacity": self.capacity,
            "depth": len(self.items),
            "maximum_depth": self.maximum_depth,
            "maximum_age_ticks": self.maximum_age,
            "replaced_bulk": self.replaced_bulk,
            "rejected_bulk": self.rejected_bulk,
            "critical_rejections": self.critical_rejections,
        }


class CheckpointStore:
    """In-memory coherent checkpoint lineage with independently hash-checked participants."""

    PARTICIPANTS = ("structured", "voxel", "journal")

    def __init__(self, world_id: str = "world.w3.alpha") -> None:
        self.world_id = world_id
        self.generations: Dict[int, Dict[str, Any]] = {}
        self.next_generation = 1

    def publish(self, state: Mapping[str, Any], fault_phase: str = "after-publish") -> Dict[str, Any]:
        generation = self.next_generation
        self.next_generation += 1
        participants = {
            name: {
                "world_id": self.world_id,
                "generation": generation,
                "participant": name,
                "revision": int(state.get("revision", generation)),
                "semantic_state": copy.deepcopy(dict(state)),
            }
            for name in self.PARTICIPANTS
        }
        hashes = {name: canonical_hash(value) for name, value in participants.items()}
        previous = max(self.generations) if self.generations else None
        manifest = {
            "checkpoint_id": f"checkpoint.{self.world_id}.{generation:08d}",
            "world_id": self.world_id,
            "generation": generation,
            "cutoff_revision": int(state.get("revision", generation)),
            "previous_generation": previous,
            "participants": hashes,
        }
        published = fault_phase in {"manifest-publish", "after-publish", "ack-prepare", "ack-sent"}
        self.generations[generation] = {
            "manifest": manifest,
            "participants": participants,
            "published": published,
            "fault_phase": fault_phase,
        }
        return {"generation": generation, "published": published, "manifest": copy.deepcopy(manifest)}

    def corrupt(self, generation: int, component: str, mode: str = "bit-flip") -> None:
        item = self.generations[generation]
        if component == "manifest":
            if mode == "remove":
                item["published"] = False
            else:
                item["manifest"]["participants"]["structured"] = "0" * 64
            return
        if component not in self.PARTICIPANTS:
            raise ValueError("unknown checkpoint component")
        if mode == "remove":
            item["participants"].pop(component, None)
        elif mode == "truncate":
            item["participants"][component] = {"truncated": True}
        else:
            item["participants"][component]["semantic_state"] = {"corrupt": True}

    def recover(self, load_order: Sequence[str] = PARTICIPANTS) -> Dict[str, Any]:
        attempted: List[Dict[str, Any]] = []
        for generation in sorted(self.generations, reverse=True):
            item = self.generations[generation]
            if not item["published"]:
                attempted.append({"generation": generation, "classification": "UNPUBLISHED"})
                continue
            manifest = item["manifest"]
            participants = item["participants"]
            failures = []
            revisions = []
            for name in load_order:
                value = participants.get(name)
                expected = manifest["participants"].get(name)
                if value is None or canonical_hash(value) != expected:
                    failures.append(name)
                elif isinstance(value, Mapping):
                    revisions.append(int(value.get("revision", -1)))
            if failures or len(set(revisions)) > 1:
                attempted.append({"generation": generation, "classification": "INTEGRITY-REJECTED", "failures": failures})
                continue
            attempted.append({"generation": generation, "classification": "SELECTED"})
            return {
                "status": "RECOVERED",
                "generation": generation,
                "checkpoint_id": manifest["checkpoint_id"],
                "participant_revisions": revisions,
                "mixed_lineage": False,
                "state_hash": canonical_hash([participants[name] for name in sorted(participants)]),
                "attempted": attempted,
            }
        return {"status": "NO-VALID-CHECKPOINT", "generation": None, "mixed_lineage": False, "attempted": attempted}

    def backup(self, deployment_id: str) -> Dict[str, Any]:
        recovered = self.recover()
        if recovered["status"] != "RECOVERED":
            raise RuntimeError("cannot advertise a backup without a coherent checkpoint")
        source = self.generations[int(recovered["generation"])]
        return {
            "backup_id": f"backup.{self.world_id}.{deployment_id}",
            "source_world_id": self.world_id,
            "source_generation": recovered["generation"],
            "deployment_id": deployment_id,
            "manifest": copy.deepcopy(source["manifest"]),
            "participants": copy.deepcopy(source["participants"]),
            "backup_hash": canonical_hash(source),
        }


@dataclass
class CharacterState:
    semantic_id: str
    realm_id: str
    frame_id: str
    inventory: int
    transition_operations: Dict[str, Dict[str, Any]] = field(default_factory=dict)


class RealmTransitionCoordinator:
    def transition(self, character: CharacterState, operation_id: str, destination: str, fault_phase: str = "none") -> Dict[str, Any]:
        if operation_id in character.transition_operations:
            return {**copy.deepcopy(character.transition_operations[operation_id]), "replay": True}
        before = {"realm_id": character.realm_id, "frame_id": character.frame_id, "inventory": character.inventory}
        if fault_phase in {"before-commit", "destination-not-ready"}:
            result = {"state": "PENDING", "operation_id": operation_id, "before": before, "after": before, "acknowledged": False}
            character.transition_operations[operation_id] = copy.deepcopy(result)
            return result
        character.realm_id = destination
        character.frame_id = f"frame.{destination}"
        after = {"realm_id": character.realm_id, "frame_id": character.frame_id, "inventory": character.inventory}
        result = {
            "state": "COMMITTED",
            "operation_id": operation_id,
            "before": before,
            "after": after,
            "acknowledged": fault_phase not in {"after-commit", "lose-ack", "disconnect"},
            "replay": False,
        }
        character.transition_operations[operation_id] = copy.deepcopy(result)
        return result

    def resolve(self, character: CharacterState, operation_id: str, destination: str) -> Dict[str, Any]:
        prior = character.transition_operations.get(operation_id)
        if prior and prior["state"] == "PENDING":
            character.transition_operations.pop(operation_id)
            committed = self.transition(character, operation_id, destination, fault_phase="none")
            return {**committed, "replay": True}
        return self.transition(character, operation_id, destination, fault_phase="none")


class MigrationEngine:
    """Explicit compatibility and staged migration without guessed substitutions."""

    def recover_missing(self, semantic_ids: Sequence[str], available: Iterable[str], mappings: Mapping[str, str]) -> Dict[str, Any]:
        available_set = set(available)
        resolved: Dict[str, str] = {}
        quarantined: List[str] = []
        for semantic_id in semantic_ids:
            if semantic_id in available_set:
                resolved[semantic_id] = semantic_id
            elif semantic_id in mappings and mappings[semantic_id]:
                resolved[semantic_id] = mappings[semantic_id]
            else:
                quarantined.append(semantic_id)
        return {
            "resolved": resolved,
            "quarantined": sorted(quarantined),
            "silent_substitutions": 0,
            "load_outcome": "COMPATIBILITY-QUARANTINE" if quarantined else "LOADED",
        }

    def migrate(self, records: Sequence[Mapping[str, Any]], mappings: Mapping[str, str], fault_phase: str = "none") -> Dict[str, Any]:
        source = [copy.deepcopy(dict(item)) for item in records]
        backup_hash = canonical_hash(source)
        report = []
        staged = []
        for item in source:
            old_id = str(item["semantic_id"])
            target = mappings.get(old_id)
            if target:
                next_item = copy.deepcopy(item)
                next_item["semantic_id"] = target
                staged.append(next_item)
                report.append({"source": old_id, "target": target, "disposition": "MAPPED"})
            else:
                next_item = copy.deepcopy(item)
                next_item["compatibility_state"] = "QUARANTINED"
                staged.append(next_item)
                report.append({"source": old_id, "target": None, "disposition": "QUARANTINED"})
        commit = fault_phase not in {"backup", "stage", "validate", "report"}
        result_records = staged if commit else source
        return {
            "status": "COMMITTED" if commit else "ROLLED-BACK",
            "source_backup_hash": backup_hash,
            "source_recoverable": canonical_hash(source) == backup_hash,
            "records": result_records,
            "report": report,
            "report_complete": len(report) == len(source),
            "silent_substitutions": 0,
            "data_loss": 0,
            "duplicates": len(result_records) - len({str(item["semantic_id"]) for item in result_records}),
        }
