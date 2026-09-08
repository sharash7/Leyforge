"""Side-effect-free W3 planning over the authoritative issued-identity registry."""

from __future__ import annotations

import json
import hashlib
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, Iterable, Mapping, Optional, Tuple

from proofs.r7.w3.runtime.runner import PROOF_IDS
from .dependencies import ROOT


RUN_PATTERN = re.compile(r"^PRD07-RUN-(\d{4})$")
EVIDENCE_PATTERN = re.compile(r"^PRD07-EVID-(\d{4})$")
EXECUTION_ORDER = (
    "PRD04-PROOF-27",
    "PRD04-PROOF-28",
    "PRD04-PROOF-08",
    "PRD04-PROOF-30",
    "PRD04-PROOF-29",
    "PRD04-PROOF-31",
    "PRD04-PROOF-32",
)
QUARANTINE_PATH = ROOT / "docs/rebuild/r7/w3-allocation-reconciliation.json"
PACK_REQUIRED_STATES = frozenset({
    "PASS-OBSERVED",
    "FAIL-OBSERVED",
    "INCONCLUSIVE",
    "RERUN-REQUIRED",
    "PRD-08-EVALUATION",
})
ACTIVE_STATES = frozenset({"PRD07-RUN-ALLOCATED", "EXECUTING", "OBSERVATION-CAPTURED"})
NON_PACK_STATES = frozenset({
    *ACTIVE_STATES,
    "INVALIDATED",
    "ABORTED-BEFORE-PROOF-OBSERVATION",
    "INTERRUPTED-BEFORE-PROOF-OBSERVATION",
})


class ExecutionRegistryError(ValueError):
    """Raised when issued execution identity state cannot be proved unambiguous."""


@dataclass(frozen=True)
class RegistrySnapshot:
    run_ids: Tuple[str, ...]
    evidence_ids: Tuple[str, ...]
    max_run_number: int
    max_evidence_number: int
    mappings: Mapping[str, Tuple[str, str]]
    dispositions: Mapping[str, str]
    retained_run_ids: Tuple[str, ...]
    quarantined_run_ids: Tuple[str, ...]
    state_paths: Tuple[str, ...]
    quarantine_paths: Tuple[str, ...]
    evidence_paths: Tuple[str, ...]

    def to_dict(self) -> Dict[str, object]:
        return {
            "run_ids": list(self.run_ids),
            "evidence_ids": list(self.evidence_ids),
            "max_run_number": self.max_run_number,
            "max_evidence_number": self.max_evidence_number,
            "mappings": {key: {"proof_id": value[0], "evidence_id": value[1]} for key, value in self.mappings.items()},
            "dispositions": dict(self.dispositions),
            "retained_run_ids": list(self.retained_run_ids),
            "quarantined_run_ids": list(self.quarantined_run_ids),
            "state_paths": list(self.state_paths),
            "quarantine_paths": list(self.quarantine_paths),
            "evidence_paths": list(self.evidence_paths),
        }


@dataclass(frozen=True)
class PlannedExecution:
    proof_id: str
    run_id: str
    evidence_id: str
    allocation_state: str = "PREVIEW-NOT-ALLOCATED"

    def to_dict(self) -> Dict[str, str]:
        return {
            "proof_id": self.proof_id,
            "run_id": self.run_id,
            "evidence_id": self.evidence_id,
            "allocation_state": self.allocation_state,
        }


def _load_object(path: Path) -> Dict[str, object]:
    try:
        value = json.loads(path.read_text(encoding="utf-8-sig"))
    except (OSError, UnicodeError, json.JSONDecodeError) as exc:
        raise ExecutionRegistryError(f"cannot read execution registry record {path}: {exc}") from exc
    if not isinstance(value, dict):
        raise ExecutionRegistryError(f"execution registry record is not an object: {path}")
    return value


def _parse_identity(value: object, pattern: re.Pattern[str], kind: str, source: Path) -> Tuple[str, int]:
    text = str(value)
    match = pattern.fullmatch(text)
    if match is None:
        raise ExecutionRegistryError(f"malformed {kind} identity {text!r} in {source}")
    return text, int(match.group(1))


def _sequence(values: Iterable[str], pattern: re.Pattern[str]) -> Tuple[str, ...]:
    return tuple(sorted(set(values), key=lambda value: int(pattern.fullmatch(value).group(1))))  # type: ignore[union-attr]


def inspect_execution_registry(root: Path = ROOT) -> RegistrySnapshot:
    """Reconcile state records and retained packs; fail closed on any ambiguity."""
    state_root = root / "docs/rebuild/r7"
    evidence_root = state_root / "execution-evidence"
    state_paths = tuple(sorted(state_root.glob("w*-execution-state.json")))
    if not state_paths:
        raise ExecutionRegistryError("no authoritative execution state records were found")

    mappings: Dict[str, Tuple[str, str]] = {}
    run_ids: set[str] = set()
    evidence_ids: set[str] = set()
    state_sources: Dict[str, str] = {}
    evidence_sources: Dict[str, str] = {}
    dispositions: Dict[str, str] = {}
    pack_required_runs: set[str] = set()
    pack_required_evidence: set[str] = set()
    quarantined_runs: set[str] = set()

    def register(
        row: Mapping[str, object],
        source: Path,
        row_run_ids: set[str],
        row_evidence_ids: set[str],
        *,
        quarantine: bool = False,
    ) -> None:
        raw_run_id = row.get("run_id")
        raw_evidence_id = row.get("evidence_id")
        if raw_run_id in {None, ""} and raw_evidence_id in {None, ""}:
            if row.get("state") != "NOT-RUN":
                raise ExecutionRegistryError(f"execution registry row lacks issued identities: {source}")
            return
        if raw_run_id in {None, ""} or raw_evidence_id in {None, ""}:
            raise ExecutionRegistryError(f"execution registry row has only one issued identity: {source}")
        run_id, run_number = _parse_identity(raw_run_id, RUN_PATTERN, "run", source)
        evidence_id, evidence_number = _parse_identity(raw_evidence_id, EVIDENCE_PATTERN, "evidence", source)
        proof_id = str(row.get("proof_id", ""))
        state = str(row.get("state", ""))
        if not proof_id or run_number != evidence_number or not state:
            raise ExecutionRegistryError(f"run/evidence mapping is ambiguous in {source}: {run_id}, {evidence_id}")
        if run_id in mappings and mappings[run_id] != (proof_id, evidence_id):
            raise ExecutionRegistryError(f"run identity maps to conflicting proof/evidence records: {run_id}")
        if run_id in row_run_ids or evidence_id in row_evidence_ids:
            raise ExecutionRegistryError(f"execution registry contains duplicate row identities: {source}")
        source_name = source.as_posix()
        if run_id in state_sources and state_sources[run_id] != source_name:
            raise ExecutionRegistryError(f"run identity appears in multiple registry records: {run_id}")
        if evidence_id in evidence_sources and evidence_sources[evidence_id] != source_name:
            raise ExecutionRegistryError(f"evidence identity appears in multiple registry records: {evidence_id}")
        evidence_status = str(row.get("evidence_pack_status", ""))
        evidence_eligible = row.get("prd07_evidence_eligible")
        if quarantine:
            if state not in {
                "INVALIDATED-BEFORE-PROOF-OBSERVATION",
                "QUARANTINED-PLAN-MATERIALIZED-NOT-STARTED",
            }:
                raise ExecutionRegistryError(f"unsupported quarantine disposition for {run_id}: {state}")
            if row.get("reusable") is not False or row.get("retained_pack") is not False or evidence_eligible is not False:
                raise ExecutionRegistryError(f"quarantine row could be reused or mistaken for evidence: {run_id}")
            quarantined_runs.add(run_id)
        elif state in PACK_REQUIRED_STATES or evidence_status == "RETAINED":
            pack_required_runs.add(run_id)
            pack_required_evidence.add(evidence_id)
        elif state in NON_PACK_STATES:
            if not evidence_status.startswith("NOT-CREATED") or evidence_eligible is not False:
                raise ExecutionRegistryError(f"non-observed allocated row lacks explicit non-evidence state: {run_id}")
        else:
            raise ExecutionRegistryError(f"unsupported allocated execution state for {run_id}: {state}")
        mappings[run_id] = (proof_id, evidence_id)
        dispositions[run_id] = "QUARANTINED-ABORTED-TRANSACTION" if quarantine else state
        state_sources[run_id] = source_name
        evidence_sources[evidence_id] = source_name
        row_run_ids.add(run_id)
        row_evidence_ids.add(evidence_id)

    for state_path in state_paths:
        state = _load_object(state_path)
        allocated_runs = state.get("allocated_run_ids", [])
        allocated_evidence = state.get("allocated_evidence_ids", [])
        proofs = state.get("allocation_history", state.get("proofs", []))
        if not isinstance(allocated_runs, list) or not isinstance(allocated_evidence, list) or not isinstance(proofs, list):
            raise ExecutionRegistryError(f"execution state has invalid collections: {state_path}")
        state_run_ids = {_parse_identity(value, RUN_PATTERN, "run", state_path)[0] for value in allocated_runs}
        state_evidence_ids = {_parse_identity(value, EVIDENCE_PATTERN, "evidence", state_path)[0] for value in allocated_evidence}
        if len(state_run_ids) != len(allocated_runs) or len(state_evidence_ids) != len(allocated_evidence):
            raise ExecutionRegistryError(f"execution state contains duplicate allocated identities: {state_path}")
        row_run_ids: set[str] = set()
        row_evidence_ids: set[str] = set()
        for row in proofs:
            if not isinstance(row, dict):
                raise ExecutionRegistryError(f"execution state proof row is not an object: {state_path}")
            register(row, state_path, row_run_ids, row_evidence_ids)
        if state_run_ids != row_run_ids or state_evidence_ids != row_evidence_ids:
            raise ExecutionRegistryError(f"allocated identities differ from proof rows in {state_path}")
        run_ids.update(state_run_ids)
        evidence_ids.update(state_evidence_ids)

    quarantine_path = root / QUARANTINE_PATH.relative_to(ROOT)
    quarantine_paths: Tuple[Path, ...] = (quarantine_path,) if quarantine_path.is_file() else ()
    if quarantine_paths:
        reconciliation = _load_object(quarantine_path)
        if reconciliation.get("schema_version") != "prd07-w3-allocation-reconciliation-v1":
            raise ExecutionRegistryError("unsupported W3 allocation-reconciliation schema")
        if reconciliation.get("status") != "AUTHORITATIVE-QUARANTINE":
            raise ExecutionRegistryError("W3 allocation reconciliation is not authoritative")
        allocated_runs = reconciliation.get("allocated_run_ids", [])
        allocated_evidence = reconciliation.get("allocated_evidence_ids", [])
        allocations = reconciliation.get("allocations", [])
        if not isinstance(allocated_runs, list) or not isinstance(allocated_evidence, list) or not isinstance(allocations, list):
            raise ExecutionRegistryError("W3 allocation reconciliation has invalid collections")
        quarantine_run_ids = {_parse_identity(value, RUN_PATTERN, "run", quarantine_path)[0] for value in allocated_runs}
        quarantine_evidence_ids = {
            _parse_identity(value, EVIDENCE_PATTERN, "evidence", quarantine_path)[0] for value in allocated_evidence
        }
        if len(quarantine_run_ids) != len(allocated_runs) or len(quarantine_evidence_ids) != len(allocated_evidence):
            raise ExecutionRegistryError("W3 allocation reconciliation contains duplicate identities")
        row_run_ids: set[str] = set()
        row_evidence_ids: set[str] = set()
        for row in allocations:
            if not isinstance(row, dict):
                raise ExecutionRegistryError("W3 allocation reconciliation row is not an object")
            register(row, quarantine_path, row_run_ids, row_evidence_ids, quarantine=True)
        if quarantine_run_ids != row_run_ids or quarantine_evidence_ids != row_evidence_ids:
            raise ExecutionRegistryError("W3 quarantined identities differ from reconciliation rows")
        evidence_record = reconciliation.get("source_evidence", {})
        if not isinstance(evidence_record, dict):
            raise ExecutionRegistryError("W3 allocation reconciliation lacks source evidence")
        evidence_path = root / str(evidence_record.get("path", ""))
        expected_hash = str(evidence_record.get("sha256", ""))
        if not evidence_path.is_file() or hashlib.sha256(evidence_path.read_bytes()).hexdigest() != expected_hash:
            raise ExecutionRegistryError("W3 allocation reconciliation source evidence differs")
        run_ids.update(quarantine_run_ids)
        evidence_ids.update(quarantine_evidence_ids)

    evidence_paths = tuple(sorted(path for path in evidence_root.glob("PRD07-RUN-*") if path.is_dir()))
    pack_run_ids: set[str] = set()
    pack_evidence_ids: set[str] = set()
    for pack_path in evidence_paths:
        directory_id, directory_number = _parse_identity(pack_path.name, RUN_PATTERN, "run directory", pack_path)
        record_path = pack_path / "run.json"
        if not record_path.is_file():
            raise ExecutionRegistryError(f"retained execution pack lacks run.json: {pack_path}")
        record = _load_object(record_path)
        run_id, run_number = _parse_identity(record.get("run_id"), RUN_PATTERN, "run", record_path)
        evidence_id, evidence_number = _parse_identity(record.get("evidence_id"), EVIDENCE_PATTERN, "evidence", record_path)
        proof_id = str(record.get("proof_id", ""))
        if run_id != directory_id or run_number != directory_number or run_number != evidence_number:
            raise ExecutionRegistryError(f"retained pack identity mismatch: {record_path}")
        expected = mappings.get(run_id)
        if expected is None or expected != (proof_id, evidence_id):
            raise ExecutionRegistryError(f"retained pack conflicts with execution state: {record_path}")
        pack_run_ids.add(run_id)
        pack_evidence_ids.add(evidence_id)

    if pack_run_ids != pack_required_runs or pack_evidence_ids != pack_required_evidence:
        raise ExecutionRegistryError("observed execution state and append-only retained packs do not contain the same identities")
    if pack_run_ids & quarantined_runs:
        raise ExecutionRegistryError("quarantined allocation unexpectedly has a retained proof pack")
    ordered_runs = _sequence(run_ids, RUN_PATTERN)
    ordered_evidence = _sequence(evidence_ids, EVIDENCE_PATTERN)
    run_numbers = [int(RUN_PATTERN.fullmatch(value).group(1)) for value in ordered_runs]  # type: ignore[union-attr]
    evidence_numbers = [int(EVIDENCE_PATTERN.fullmatch(value).group(1)) for value in ordered_evidence]  # type: ignore[union-attr]
    if not run_numbers or not evidence_numbers:
        raise ExecutionRegistryError("authoritative execution registry contains no issued identities")
    if run_numbers != list(range(1, max(run_numbers) + 1)):
        raise ExecutionRegistryError("issued run identities are not a complete monotonic sequence")
    if evidence_numbers != list(range(1, max(evidence_numbers) + 1)):
        raise ExecutionRegistryError("issued evidence identities are not a complete monotonic sequence")
    if run_numbers != evidence_numbers:
        raise ExecutionRegistryError("run and evidence high-water sequences differ")
    return RegistrySnapshot(
        ordered_runs,
        ordered_evidence,
        max(run_numbers),
        max(evidence_numbers),
        dict(sorted(mappings.items())),
        dict(sorted(dispositions.items())),
        _sequence(pack_run_ids, RUN_PATTERN),
        _sequence(quarantined_runs, RUN_PATTERN),
        tuple(path.relative_to(root).as_posix() for path in state_paths),
        tuple(path.relative_to(root).as_posix() for path in quarantine_paths),
        tuple(path.relative_to(root).as_posix() for path in evidence_paths),
    )


def preview_execution_plan(root: Path = ROOT) -> Tuple[PlannedExecution, ...]:
    """Compute future identities without writing, reserving, or consuming any ID."""
    if set(EXECUTION_ORDER) != set(PROOF_IDS) or len(EXECUTION_ORDER) != len(PROOF_IDS):
        raise ExecutionRegistryError("W3 execution order differs from the authoritative W3 proof set")
    registry = inspect_execution_registry(root)
    active_w3_runs = sorted(
        run_id for run_id, (proof_id, _) in registry.mappings.items()
        if proof_id in PROOF_IDS and registry.dispositions.get(run_id) in ACTIVE_STATES
    )
    if active_w3_runs:
        raise ExecutionRegistryError("W3 has an unresolved active allocation: " + ", ".join(active_w3_runs))
    observed_w3_proofs = {
        proof_id for run_id, (proof_id, _) in registry.mappings.items()
        if proof_id in PROOF_IDS and registry.dispositions.get(run_id) in PACK_REQUIRED_STATES
    }
    if registry.max_run_number != registry.max_evidence_number:
        raise ExecutionRegistryError("run/evidence high-water marks differ")
    plan = tuple(
        PlannedExecution(
            proof_id,
            f"PRD07-RUN-{registry.max_run_number + offset:04d}",
            f"PRD07-EVID-{registry.max_evidence_number + offset:04d}",
        )
        for offset, proof_id in enumerate(
            (proof_id for proof_id in EXECUTION_ORDER if proof_id not in observed_w3_proofs),
            start=1,
        )
    )
    if any(row.run_id in registry.run_ids or row.evidence_id in registry.evidence_ids for row in plan):
        raise ExecutionRegistryError("future W3 plan overlaps an issued identity")
    return plan


def execution_plan_for_actual_run(
    root: Path = ROOT,
    *,
    actual_execution_authorized: bool,
    retained_root: Optional[Path] = None,
) -> Tuple[PlannedExecution, ...]:
    """Resolve a just-in-time plan only after the future execution gate opens."""
    if not actual_execution_authorized:
        raise ExecutionRegistryError("actual W3 execution authorization is required before identity allocation")
    plan = preview_execution_plan(root)
    destination = retained_root or root / "docs/rebuild/r7/execution-evidence"
    conflicts = [row.run_id for row in plan if (destination / row.run_id).exists()]
    if conflicts:
        raise ExecutionRegistryError("append-only W3 destinations already exist: " + ", ".join(conflicts))
    return tuple(
        PlannedExecution(row.proof_id, row.run_id, row.evidence_id, "AUTHORIZED-JIT-NOT-ALLOCATED")
        for row in plan
    )


# Compatibility name: this contains only stable proof identities, never RUN/EVID IDs.
PROOF_PLAN = EXECUTION_ORDER
