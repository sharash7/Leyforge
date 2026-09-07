"""Deterministic proof-only models for PRD-07 W1 owner and spatial contracts."""

from __future__ import annotations

import hashlib
import json
from dataclasses import dataclass, field
from typing import Any, Dict, Iterable, List, Mapping, MutableMapping, Optional, Sequence, Tuple


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def canonical_hash(value: Any) -> str:
    return hashlib.sha256(canonical_json(value).encode("utf-8")).hexdigest()


@dataclass(frozen=True)
class OwnerToken:
    owner_id: str
    owner_epoch: int
    session_epoch: int
    revision: int

    def to_dict(self) -> Dict[str, Any]:
        return {
            "owner_id": self.owner_id,
            "owner_epoch": self.owner_epoch,
            "session_epoch": self.session_epoch,
            "revision": self.revision,
        }


@dataclass(frozen=True)
class Proposal:
    operation_id: str
    token: OwnerToken
    delta: int
    valid: bool = True


@dataclass
class OwnerPartition:
    partition_id: str
    owner_id: str = "owner-a"
    owner_epoch: int = 1
    session_epoch: int = 1
    revision: int = 0
    value: int = 0
    accepted_operations: set[str] = field(default_factory=set)

    def token(self) -> OwnerToken:
        return OwnerToken(self.owner_id, self.owner_epoch, self.session_epoch, self.revision)

    def transfer(self, new_owner: str) -> OwnerToken:
        if not new_owner or new_owner == self.owner_id:
            raise ValueError("ownership transfer requires a different non-empty owner")
        self.owner_id = new_owner
        self.owner_epoch += 1
        self.revision += 1
        return self.token()

    def restart_session(self) -> OwnerToken:
        self.session_epoch += 1
        self.revision += 1
        return self.token()

    def authoritative_mutation(self, delta: int = 1) -> OwnerToken:
        self.value += delta
        self.revision += 1
        return self.token()

    def apply(self, proposal: Proposal) -> str:
        token = proposal.token
        if proposal.operation_id in self.accepted_operations:
            return "SUPERSEDED-REJECTED"
        if token.session_epoch != self.session_epoch:
            return "SESSION-EPOCH-REJECTED"
        if token.owner_id != self.owner_id or token.owner_epoch != self.owner_epoch:
            return "OWNER-EPOCH-REJECTED"
        if token.revision != self.revision:
            return "STALE-REJECTED"
        if not proposal.valid:
            return "VALIDATION-REJECTED"
        self.value += proposal.delta
        self.revision += 1
        self.accepted_operations.add(proposal.operation_id)
        return "CURRENT-ACCEPTED"

    def snapshot(self) -> Dict[str, Any]:
        return {
            "partition_id": self.partition_id,
            "owner": self.token().to_dict(),
            "value": self.value,
            "accepted_operations": sorted(self.accepted_operations),
        }


class TransactionEngine:
    """Small idempotent owner-mediated commit protocol used only by W1 proofs."""

    def __init__(self, resources: int = 1_000_000) -> None:
        self.initial_resources = resources
        self.resources = resources
        self.reservations: Dict[str, int] = {}
        self.effects: Dict[str, Dict[str, Any]] = {}
        self.operations: Dict[str, Dict[str, Any]] = {}
        self.targets: set[str] = set()
        self.semantic_commit_count = 0

    def execute(
        self,
        operation_id: str,
        amount: int,
        mode: str = "success",
        target: Optional[str] = None,
        permitted: bool = True,
    ) -> Dict[str, Any]:
        if operation_id in self.operations:
            prior = dict(self.operations[operation_id])
            return {
                **prior,
                "retry": True,
                "classification": "SUPERSEDED-REJECTED",
                "semantic_effects_this_attempt": 0,
            }
        trace: List[str] = ["COMMAND", "VALIDATE"]
        result: Dict[str, Any] = {
            "operation_id": operation_id,
            "mode": mode,
            "target": target,
            "retry": False,
            "semantic_effects_this_attempt": 0,
        }
        invalid = mode == "validation-rejection" or not permitted or amount <= 0
        if target is not None and target in self.targets:
            invalid = True
        if invalid or self.resources < amount:
            result.update(state="REJECTED", classification="VALIDATION-REJECTED", trace=trace)
            self.operations[operation_id] = dict(result)
            return result
        trace.append("RESERVE")
        self.resources -= amount
        self.reservations[operation_id] = amount
        if mode in {"failure-before-commit", "cancel-before-prepare"}:
            self.resources += self.reservations.pop(operation_id)
            trace.append("COMPENSATE/RELEASE/QUARANTINE")
            result.update(state="COMPENSATED", classification="PROVIDER-FAILED" if mode.startswith("failure") else "VALIDATION-REJECTED", trace=trace)
            self.operations[operation_id] = dict(result)
            return result
        trace.append("PREPARE")
        if mode == "cancel-after-prepare":
            self.resources += self.reservations.pop(operation_id)
            trace.append("COMPENSATE/RELEASE/QUARANTINE")
            result.update(state="COMPENSATED", classification="VALIDATION-REJECTED", trace=trace)
            self.operations[operation_id] = dict(result)
            return result
        amount_reserved = self.reservations.pop(operation_id)
        effect = {"amount": amount_reserved, "target": target, "revision": self.semantic_commit_count + 1}
        self.effects[operation_id] = effect
        if target is not None:
            self.targets.add(target)
        self.semantic_commit_count += 1
        trace.extend(["SEMANTIC-COMMIT", "DERIVED-FANOUT"])
        if mode == "failure-after-commit":
            trace.append("COMPENSATE/RELEASE/QUARANTINE")
            classification = "PROVIDER-FAILED"
            derived = "DEGRADED"
        else:
            trace.extend(["DURABILITY/REPLICATION-PROJECTION", "ACKNOWLEDGE"])
            classification = "CURRENT-ACCEPTED"
            derived = "READY"
        result.update(
            state="COMMITTED",
            classification=classification,
            trace=trace,
            derived_readiness=derived,
            semantic_effects_this_attempt=1,
            commit_revision=self.semantic_commit_count,
        )
        self.operations[operation_id] = dict(result)
        return result

    def conservation_delta(self) -> int:
        committed = sum(item["amount"] for item in self.effects.values())
        reserved = sum(self.reservations.values())
        return self.initial_resources - (self.resources + committed + reserved)


@dataclass
class DomainRecord:
    semantic_id: str
    resources: int
    timer: int
    obligations: int
    fidelity: str = "aggregate"
    revision: int = 0

    def canonical(self) -> Dict[str, Any]:
        return {
            "semantic_id": self.semantic_id,
            "resources": self.resources,
            "timer": self.timer,
            "obligations": self.obligations,
            "revision": self.revision,
        }


class DistantSimulation:
    def __init__(self, population: int, seed: int) -> None:
        self.seed = seed
        self.records = [
            DomainRecord(
                semantic_id=f"actor.w1.{seed:08x}.{index:06d}",
                resources=100 + ((seed * 17 + index * 31) % 101),
                timer=(seed + index) % 24,
                obligations=(seed * 3 + index) % 5,
            )
            for index in range(population)
        ]
        self.world_ticks = 0
        self.node_count = 0

    def advance(self, ticks: int) -> None:
        self.world_ticks += ticks
        for record in self.records:
            cycles, record.timer = divmod(record.timer + ticks, 24)
            produced = cycles * (1 + record.obligations)
            record.resources += produced
            record.revision += ticks

    def transition(self, index: int, fidelity: str) -> Tuple[Dict[str, Any], Dict[str, Any]]:
        record = self.records[index]
        before = record.canonical()
        record.fidelity = fidelity
        after = record.canonical()
        return before, after

    def digest(self) -> str:
        return canonical_hash({"world_ticks": self.world_ticks, "records": [item.canonical() for item in self.records]})


Coord = Tuple[int, int, int]


class SpatialState:
    CONSUMER_RADIUS: Mapping[str, int] = {
        "mesh": 1,
        "collision": 1,
        "nav": 2,
        "fluid": 1,
        "structure": 2,
        "read-model": 0,
    }

    def __init__(self) -> None:
        self.revision = 0
        self.cells: Dict[Coord, Dict[str, Any]] = {}
        self.derived: Dict[Tuple[str, Coord], Dict[str, Any]] = {}
        self.provider_health: Dict[str, str] = {name: "READY" for name in self.CONSUMER_RADIUS}

    @staticmethod
    def dirty_region(coord: Coord, radius: int) -> Dict[str, List[int]]:
        return {
            "minimum": [coord[0] - radius, coord[1] - radius, coord[2] - radius],
            "maximum": [coord[0] + radius, coord[1] + radius, coord[2] + radius],
        }

    def edit(self, coord: Coord, value: int, operation_id: str) -> Dict[str, Any]:
        self.revision += 1
        self.cells[coord] = {
            "value": value,
            "revision": self.revision,
            "edited": True,
            "operation_id": operation_id,
        }
        consumers = {
            name: {"revision": self.revision, "dirty_region": self.dirty_region(coord, radius)}
            for name, radius in self.CONSUMER_RADIUS.items()
        }
        return {
            "operation_id": operation_id,
            "coordinate": list(coord),
            "revision": self.revision,
            "consumers": consumers,
        }

    def generation_proposal(self, coord: Coord, expected_revision: int, value: int) -> str:
        current = self.cells.get(coord)
        actual = 0 if current is None else int(current["revision"])
        if actual != expected_revision or (current is not None and bool(current.get("edited"))):
            return "STALE-REJECTED"
        self.revision += 1
        self.cells[coord] = {"value": value, "revision": self.revision, "edited": False, "operation_id": "generation"}
        return "CURRENT-ACCEPTED"

    def publish_derived(self, provider: str, coord: Coord, revision: int, failed: bool = False) -> str:
        current = self.cells.get(coord)
        if failed:
            self.provider_health[provider] = "DEGRADED"
            return "PROVIDER-FAILED"
        if current is None or int(current["revision"]) != revision:
            return "STALE-REJECTED"
        self.derived[(provider, coord)] = {"revision": revision, "status": "READY"}
        self.provider_health[provider] = "READY"
        return "CURRENT-ACCEPTED"

    def readiness(self, provider: str, coord: Coord) -> str:
        current = self.cells.get(coord)
        derived = self.derived.get((provider, coord))
        if self.provider_health.get(provider) != "READY":
            return "DEGRADED"
        if current is None or derived is None or int(derived["revision"]) != int(current["revision"]):
            return "STALE-QUARANTINED"
        return "READY"

    def authorize_interaction(self, provider: str, coord: Coord) -> str:
        return "ACCEPTED" if self.readiness(provider, coord) == "READY" else "QUARANTINED"

    def canonical_digest(self) -> str:
        rows = [
            {"coordinate": list(coord), **value}
            for coord, value in sorted(self.cells.items())
        ]
        return canonical_hash({"revision": self.revision, "cells": rows})


def trace_event(
    operation_id: str,
    event_id: str,
    phase: str,
    parent_id: Optional[str],
    classification: str,
    revision: int,
) -> Dict[str, Any]:
    return {
        "operation_id": operation_id,
        "correlation_id": operation_id,
        "event_id": event_id,
        "parent_id": parent_id,
        "phase": phase,
        "classification": classification,
        "owner_id": "owner-world",
        "owner_epoch": 1,
        "session_epoch": 1,
        "revision": revision,
    }
