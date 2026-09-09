"""Guarded future W3 execution with just-in-time, append-only identities."""

from __future__ import annotations

import json
import os
import platform
import re
import subprocess
import tempfile
import time
from pathlib import Path
from typing import Any, Callable, Dict, Mapping, Optional, Tuple

from proofs.r7.w3.runtime.runner import PROOF_IDS, run_proof
from tools.proof_harness.evidence import EvidenceFile, EvidencePack
from tools.proof_harness.manifests import sha256_file
from tools.proof_harness.state import ExecutionKind, ProofExecution, ProofState

from .admission import MANIFEST_PATH, build_manifest
from .builds import ExportedBuild, export_one, fixture_launch_validation_issues, run_fixture_probe
from .dependencies import ROOT, load_lock, reference_issues, verify_local_dependencies
from .execution_plan import PlannedExecution, execution_plan_for_actual_run
from .readiness import READINESS_PATH, readiness_report


_SOURCE_REVISION = re.compile(r"^[0-9a-f]{40}$")


def _write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n", encoding="utf-8")


def _atomic_write_json(path: Path, value: Any) -> None:
    """Durably replace one journal value without exposing a partial JSON document."""
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(prefix=path.name + ".", suffix=".tmp", dir=str(path.parent))
    temporary_path = Path(temporary_name)
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8", newline="\n") as handle:
            json.dump(value, handle, indent=2, sort_keys=True, ensure_ascii=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(str(temporary_path), str(path))
    finally:
        if temporary_path.exists():
            temporary_path.unlink()


def _git(*args: str) -> str:
    completed = subprocess.run(["git", *args], cwd=ROOT, text=True, capture_output=True)
    if completed.returncode:
        raise RuntimeError(completed.stderr.strip() or "git command failed")
    return completed.stdout.strip()


def source_execution_issues(source_revision: str) -> Tuple[str, ...]:
    issues = []
    if _SOURCE_REVISION.fullmatch(source_revision) is None:
        return ("source revision must be an exact lowercase forty-character commit",)
    if _git("rev-parse", "HEAD") != source_revision:
        issues.append("source revision does not equal current HEAD")
    governed = (
        "proofs/r7/w3",
        "tools/r7_w3_runtime",
        "tools/tests/test_r7_w3_runtime.py",
        "docs/rebuild/r7/w3-allocation-reconciliation.json",
        "docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json",
        "docs/rebuild/r7/w3-fixture-launch-integration.json",
        "docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json",
        "docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json",
        "tools/verify.py",
        "tools/verify_rebuild_boundary.py",
    )
    if _git("status", "--porcelain", "--", *governed):
        issues.append("governed W3 proof source has uncommitted changes")
    return tuple(issues)


def preflight_report(implementation_commit: str, check_local: bool) -> Dict[str, Any]:
    issues = list(reference_issues())
    readiness = readiness_report(implementation_commit, check_local=check_local)
    if readiness["status"] != "PASS":
        issues.extend(readiness["issues"])
    local = verify_local_dependencies(load_lock()) if check_local else {"status": "NOT-CHECKED", "issues": [], "paths": {}}
    if check_local and local["status"] != "PASS":
        issues.extend(local["issues"])
    return {
        "schema_version": "leyforge-r7-w3-preflight-v2",
        "status": "PASS" if not issues else "FAIL",
        "implementation_commit": implementation_commit,
        "readiness": readiness,
        "local_dependencies": local,
        "issues": sorted(set(issues)),
        "gameplay_permission": "CLOSED",
        "prd08_evaluation": "CLOSED",
    }


def certification_record_issues(
    readiness: Mapping[str, Any],
    boundary: Mapping[str, Any],
    expected_boundary: Mapping[str, Any],
) -> Tuple[str, ...]:
    issues = []
    proof_ids = tuple(row.get("proof_id") for row in readiness.get("proofs", []))
    if (
        readiness.get("schema_version") != "prd07-w3-readiness-v4"
        or readiness.get("package") != "R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION"
        or readiness.get("status") != "PASS"
        or readiness.get("implementation_commit_source_match") is not True
    ):
        issues.append("repaired W3 readiness is not commit-certified")
    if proof_ids != tuple(PROOF_IDS) or any(row.get("state") != "READY" for row in readiness.get("proofs", [])):
        issues.append("repaired W3 readiness does not certify the exact seven-proof set")
    if readiness.get("allocated_run_ids") != [] or readiness.get("allocated_evidence_ids") != []:
        issues.append("W3 readiness allocated execution identities")
    expected_quarantined_runs = [f"PRD07-RUN-{index:04d}" for index in range(51, 58)]
    expected_quarantined_evidence = [f"PRD07-EVID-{index:04d}" for index in range(51, 58)]
    if readiness.get("quarantined_run_ids") != expected_quarantined_runs:
        issues.append("repaired W3 readiness does not preserve the exact quarantined RUN range")
    if readiness.get("quarantined_evidence_ids") != expected_quarantined_evidence:
        issues.append("repaired W3 readiness does not preserve the exact quarantined EVID range")
    if readiness.get("invalidated_run_ids") != ["PRD07-RUN-0058"]:
        issues.append("repaired W3 readiness does not preserve invalidated RUN 0058")
    if readiness.get("invalidated_evidence_ids") != ["PRD07-EVID-0058"]:
        issues.append("repaired W3 readiness does not preserve invalidated EVID 0058")
    engine = readiness.get("pinned_engine_validation", {})
    checks = engine.get("checks", {}) if isinstance(engine, dict) else {}
    required_engine_checks = (
        "source_hash_identity_valid",
        "pinned_engine_identity_valid",
        "script_parse_load_valid",
        "controlled_entrypoint_reached",
        "export_prerequisites_valid",
        "export_completed",
        "exported_runtime_validation_valid",
    )
    if (
        not isinstance(engine, dict)
        or engine.get("schema_version") != "prd07-w3-pinned-engine-validation-v1"
        or engine.get("status") != "PASS"
        or engine.get("implementation_commit") != readiness.get("implementation_commit")
        or not isinstance(engine.get("source_identity"), dict)
        or not isinstance(engine.get("dependency_identity"), dict)
        or not isinstance(checks, dict)
        or any(checks.get(key) is not True for key in required_engine_checks)
        or checks.get("proof_execution_started") is not False
        or engine.get("proof_execution") != "NOT-STARTED"
        or engine.get("allocated_run_ids") != []
        or engine.get("allocated_evidence_ids") != []
        or engine.get("gameplay_permission") != "CLOSED"
        or engine.get("production_runtime") != "ABSENT"
    ):
        issues.append("repaired W3 readiness lacks a passing non-proof pinned-engine validation")
    fixture_launch = readiness.get("fixture_launch_validation", {})
    if not isinstance(fixture_launch, dict) or fixture_launch_validation_issues(
        fixture_launch, str(readiness.get("implementation_commit", ""))
    ):
        issues.append("repaired W3 readiness lacks a passing real fixture-launch integration")
    if boundary != expected_boundary:
        issues.append("repaired W3 admission boundary is missing, stale or not exact")
    if (
        boundary.get("manifest_version") != 3
        or boundary.get("package") != "R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION"
    ):
        issues.append("repaired W3 admission identity is missing or unsupported")
    if boundary.get("implementation_commit") != readiness.get("implementation_commit"):
        issues.append("W3 readiness and admission name different implementation commits")
    if boundary.get("proof_execution") != "NOT-STARTED-FOR-NEXT-RERUN":
        issues.append("W3 admission does not keep the next rerun unstarted")
    if boundary.get("allocated_run_ids") != [] or boundary.get("allocated_evidence_ids") != []:
        issues.append("W3 admission allocated execution identities before actual execution")
    return tuple(sorted(set(issues)))


def _allocated_execution(plan: PlannedExecution) -> ProofExecution:
    execution = ProofExecution(plan.proof_id)
    execution.evaluate_prerequisites([])
    execution.allocate_run(plan.run_id, ExecutionKind.ACTUAL, actual_execution_authorized=True)
    return execution


class W3ExecutionJournal:
    """Append-only allocation history with atomic state transitions."""

    SCHEMA = "prd07-w3-execution-state-v2"

    def __init__(self, path: Path, source_revision: str, *, allow_terminal_source_transition: bool = False) -> None:
        self.path = path
        self.source_revision = source_revision
        self.prior_source_revision: Optional[str] = None
        if path.is_file():
            value = json.loads(path.read_text(encoding="utf-8-sig"))
            if not isinstance(value, dict) or value.get("schema_version") != self.SCHEMA:
                raise ValueError("existing W3 execution journal is missing or unsupported")
            journal_source = str(value.get("latest_source_revision", value.get("source_revision", "")))
            if journal_source != source_revision:
                active = any(
                    isinstance(row, dict) and row.get("state") in {ProofState.RUN_ALLOCATED.value, ProofState.EXECUTING.value}
                    for row in value.get("allocation_history", [])
                )
                if not allow_terminal_source_transition or active:
                    raise ValueError("existing W3 execution journal names a different source revision")
                self.prior_source_revision = journal_source
            self.value = value
        else:
            self.value = {
                "schema_version": self.SCHEMA,
                "package": "R7-W3-FLUID-VESSEL-MOVING-FRAME-PROOFS",
                "package_state": "READY-FOR-AUTHORIZED-EXECUTION",
                "source_revision": source_revision,
                "gameplay_permission": "CLOSED",
                "prd08_evaluation": "CLOSED",
                "prior_readiness_source": READINESS_PATH.relative_to(ROOT).as_posix(),
                "allocated_run_ids": [],
                "allocated_evidence_ids": [],
                "allocation_history": [],
                "proofs": [
                    {
                        "proof_id": proof_id,
                        "prior_state": "HARNESS-BLOCKED",
                        "readiness": "READY",
                        "state": "NOT-RUN",
                        "attempt_run_ids": [],
                        "blockers": [],
                    }
                    for proof_id in PROOF_IDS
                ],
                "export_lanes": {},
            }
        self._validate()

    @property
    def allocation_history(self) -> list[Dict[str, Any]]:
        return self.value["allocation_history"]

    def _validate(self) -> None:
        allocated_runs = self.value.get("allocated_run_ids")
        allocated_evidence = self.value.get("allocated_evidence_ids")
        history = self.value.get("allocation_history")
        proofs = self.value.get("proofs")
        if not all(isinstance(item, list) for item in (allocated_runs, allocated_evidence, history, proofs)):
            raise ValueError("W3 execution journal collections are invalid")
        history_runs = [row.get("run_id") for row in history if isinstance(row, dict)]
        history_evidence = [row.get("evidence_id") for row in history if isinstance(row, dict)]
        if history_runs != allocated_runs or history_evidence != allocated_evidence:
            raise ValueError("W3 execution journal allocation history differs from allocated identities")
        if len(set(history_runs)) != len(history_runs) or len(set(history_evidence)) != len(history_evidence):
            raise ValueError("W3 execution journal contains duplicate allocated identities")
        if [row.get("proof_id") for row in proofs if isinstance(row, dict)] != list(PROOF_IDS):
            raise ValueError("W3 execution journal proof summary differs from the authorised proof set")

    def _persist(self) -> None:
        self._validate()
        _atomic_write_json(self.path, self.value)

    def _proof(self, proof_id: str) -> Dict[str, Any]:
        return next(row for row in self.value["proofs"] if row["proof_id"] == proof_id)

    def _attempt(self, run_id: str) -> Dict[str, Any]:
        return next(row for row in self.allocation_history if row["run_id"] == run_id)

    def allocate(self, planned: PlannedExecution) -> ProofExecution:
        if any(row.get("state") in {ProofState.RUN_ALLOCATED.value, ProofState.EXECUTING.value} for row in self.allocation_history):
            raise ValueError("W3 execution journal has an unresolved active allocation")
        if planned.run_id in self.value["allocated_run_ids"] or planned.evidence_id in self.value["allocated_evidence_ids"]:
            raise ValueError("W3 execution journal allocation collides with its history")
        execution = _allocated_execution(planned)
        attempt = {
            "allocation_order": len(self.allocation_history) + 1,
            "attempt_number_for_proof": 1 + sum(row.get("proof_id") == planned.proof_id for row in self.allocation_history),
            "proof_id": planned.proof_id,
            "run_id": planned.run_id,
            "evidence_id": planned.evidence_id,
            "state": execution.state.value,
            "state_history": list(execution.history),
            "proof_observation_produced": False,
            "evidence_pack_status": "NOT-CREATED-NO-PROOF-OBSERVATION",
            "prd07_evidence_eligible": False,
            "prd08_submission": "NOT-SUBMITTED",
            "source_revision": self.source_revision,
        }
        self.allocation_history.append(attempt)
        self.value["allocated_run_ids"].append(planned.run_id)
        self.value["allocated_evidence_ids"].append(planned.evidence_id)
        proof = self._proof(planned.proof_id)
        proof["state"] = execution.state.value
        proof["current_run_id"] = planned.run_id
        proof["attempt_run_ids"].append(planned.run_id)
        self.value["package_state"] = "EXECUTING"
        self.value["latest_source_revision"] = self.source_revision
        self._persist()
        return execution

    def begin(self, execution: ProofExecution) -> None:
        execution.begin()
        attempt = self._attempt(str(execution.run_id))
        attempt["state"] = execution.state.value
        attempt["state_history"] = list(execution.history)
        self._proof(execution.proof_id)["state"] = execution.state.value
        self._persist()

    def record_export(self, role: str, exported: ExportedBuild) -> None:
        self.value["export_lanes"][role] = {
            "state": "PASS",
            "build_identity": exported.build.build_identity,
            "artifact_sha256": exported.artifact.artifact_sha256,
            "artifact_size_bytes": exported.artifact.size_bytes,
            "runtime_self_report": exported.self_report,
        }
        self._persist()

    def fail(self, execution: ProofExecution, phase: str, exc: BaseException, *, observation_produced: bool = False) -> None:
        if execution.state in {ProofState.RUN_ALLOCATED, ProofState.EXECUTING} or execution.state in {
            ProofState.PASS_OBSERVED,
            ProofState.FAIL_OBSERVED,
            ProofState.INCONCLUSIVE,
        }:
            execution.invalidate(f"failure during {phase}")
        attempt = self._attempt(str(execution.run_id))
        attempt.update({
            "state": execution.state.value,
            "state_history": list(execution.history),
            "terminal_disposition": (
                "INVALIDATED-UNRETAINED-PROOF-OBSERVATION"
                if observation_produced else "ABORTED-BEFORE-PROOF-OBSERVATION"
            ),
            "failure": {
                "phase": phase,
                "error_type": type(exc).__name__,
                "error": str(exc),
                "interrupted": isinstance(exc, KeyboardInterrupt),
            },
            "proof_observation_produced": observation_produced,
            "evidence_pack_status": (
                "NOT-CREATED-OBSERVATION-NOT-RETAINED"
                if observation_produced else "NOT-CREATED-NO-PROOF-OBSERVATION"
            ),
            "prd07_evidence_eligible": False,
        })
        proof = self._proof(execution.proof_id)
        proof["state"] = "NOT-RUN" if not observation_produced else ProofState.RERUN_REQUIRED.value
        proof.pop("current_run_id", None)
        self.value["package_state"] = (
            "INVALIDATED-UNRETAINED-PROOF-OBSERVATION"
            if observation_produced else "ABORTED-BEFORE-PROOF-OBSERVATION"
        )
        self._persist()

    def complete(self, execution: ProofExecution, row: Dict[str, Any]) -> None:
        attempt = self._attempt(str(execution.run_id))
        attempt.update(row)
        attempt.update({
            "state": execution.state.value,
            "state_history": list(execution.history),
            "proof_observation_produced": True,
            "evidence_pack_status": "RETAINED",
            "prd07_evidence_eligible": True,
        })
        proof = self._proof(execution.proof_id)
        attempt_run_ids = proof["attempt_run_ids"]
        proof.update(row)
        proof["attempt_run_ids"] = attempt_run_ids
        proof["current_run_id"] = execution.run_id
        complete = all(item["state"] in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"} for item in self.value["proofs"])
        self.value["package_state"] = "W3-EXECUTION-COMPLETE" if complete else "EXECUTING"
        self._persist()


def recover_interrupted_transaction(path: Path, source_revision: str) -> bool:
    """Convert a hard-stop active row into an explicit non-evidence interruption."""
    if not path.is_file():
        return False
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    journal_source = str(value.get("latest_source_revision", value.get("source_revision", source_revision)))
    journal = W3ExecutionJournal(path, journal_source)
    active = [
        row for row in journal.allocation_history
        if row.get("state") in {ProofState.RUN_ALLOCATED.value, ProofState.EXECUTING.value}
    ]
    if not active:
        return False
    if len(active) != 1:
        raise ValueError("W3 execution journal contains multiple active allocations")
    row = active[0]
    execution = ProofExecution(str(row["proof_id"]))
    execution.evaluate_prerequisites([])
    execution.allocate_run(str(row["run_id"]), ExecutionKind.ACTUAL, actual_execution_authorized=True)
    if row["state"] == ProofState.EXECUTING.value:
        execution.begin()
    journal.fail(execution, "process-interruption-recovery", KeyboardInterrupt())
    attempt = journal._attempt(str(row["run_id"]))
    attempt["terminal_disposition"] = "INTERRUPTED-BEFORE-PROOF-OBSERVATION"
    journal.value["package_state"] = "INTERRUPTED-BEFORE-PROOF-OBSERVATION"
    journal._persist()
    return True


def _observed_state(outcome: str) -> ProofState:
    return {
        "PASS": ProofState.PASS_OBSERVED,
        "FAIL": ProofState.FAIL_OBSERVED,
        "INCONCLUSIVE": ProofState.INCONCLUSIVE,
    }.get(outcome, ProofState.FAIL_OBSERVED)


def _artifact_summary(exported: ExportedBuild) -> Dict[str, Any]:
    artifact = exported.artifact.to_dict()
    artifact["retention"] = {
        "binary": "local ignored build output; exact hash and reproducer retained",
        "reproducer": "python -m tools.r7_w3_runtime execute --actual-execution-authorized ...",
    }
    return artifact


def _retain(
    execution: ProofExecution,
    evidence_id: str,
    exported: ExportedBuild,
    observed: Dict[str, Any],
    run_root: Path,
    retained_root: Path,
) -> Dict[str, Any]:
    raw_source = run_root / "raw-source" / f"{execution.run_id}-{execution.proof_id}.json"
    _write_json(raw_source, observed)
    evidence_file = EvidenceFile.from_path(evidence_id, "observed-w3-fluid-vessel-result", raw_source)
    pack = EvidencePack(
        run_id=str(execution.run_id),
        proof_id=execution.proof_id,
        outcome=execution.state,
        execution_kind=ExecutionKind.ACTUAL,
        build=exported.build,
        artifact=exported.artifact,
        scenario={
            "package": "R7-W3-FLUID-VESSEL-MOVING-FRAME-PROOFS",
            "proof_id": execution.proof_id,
            "fixture_schema": observed["fixture_schema"],
        },
        environment={
            "platform": platform.platform(),
            "python": platform.python_version(),
            "source_revision": exported.build.source_revision,
            "godot_build_identity": exported.build.build_identity,
        },
        evidence_files=(evidence_file,),
        diagnostics=tuple(observed.get("diagnostics", [])),
        observations=tuple({"message": value} for value in observed.get("observations", [])),
    )
    issues = pack.validation_issues()
    if issues:
        raise ValueError("W3 evidence pack failed validation: " + "; ".join(issues))
    local_pack = pack.retain(run_root / "validated-evidence")
    portable = retained_root / str(execution.run_id)
    if portable.exists():
        raise ValueError(f"append-only W3 evidence destination exists: {portable}")
    portable.mkdir(parents=True)
    artifact_files = []
    for name, value in sorted(observed.get("artifacts", {}).items()):
        safe = re.sub(r"[^a-z0-9-]+", "-", str(name).lower()).strip("-") or "artifact"
        path = portable / "artifacts" / f"{safe}.json"
        _write_json(path, value)
        artifact_files.append({
            "kind": name,
            "path": path.relative_to(portable).as_posix(),
            "sha256": sha256_file(path),
            "bytes": path.stat().st_size,
        })
    run_record = {
        "schema_version": "prd07-portable-run-record-v1",
        "run_id": execution.run_id,
        "proof_id": execution.proof_id,
        "outcome": execution.state.value,
        "execution_kind": ExecutionKind.ACTUAL.value,
        "evidence_id": evidence_id,
        "evidence_sha256": sha256_file(raw_source),
        "evidence_artifacts": artifact_files,
        "build_identity": exported.build.build_identity,
        "artifact_sha256": exported.artifact.artifact_sha256,
        "artifact_size_bytes": exported.artifact.size_bytes,
        "source_revision": exported.build.source_revision,
        "prd07_evidence_eligible": True,
        "prd08_submission": "NOT-SUBMITTED",
        "gameplay_permission": "CLOSED",
        "retained_local_pack": str(local_pack.resolve()),
    }
    _write_json(portable / "run.json", run_record)
    _write_json(portable / "build-manifest.json", dict(exported.build.to_dict(), build_identity=exported.build.build_identity))
    _write_json(portable / "artifact-manifest.json", _artifact_summary(exported))
    _write_json(portable / "observed-result.json", observed)
    (portable / "summary.md").write_text(
        f"# {execution.run_id} — {execution.proof_id}\n\n"
        f"Observed outcome: **{execution.state.value}**\n\n"
        f"Evidence: `{evidence_id}`. Build identity: `{exported.build.build_identity}`. "
        "The proof-only export remains in ignored local storage; its exact hash, structured fixture report and reproducer are retained. "
        "This result has not been evaluated by PRD-08 and does not open R8.\n",
        encoding="utf-8",
    )
    return {"portable_path": str(portable), "local_pack": str(local_pack), "run": run_record}


def _execute_plan(
    source_revision: str,
    run_root: Path,
    retained_root: Path,
    state_path: Path,
    plan: Tuple[PlannedExecution, ...],
    *,
    failure_injector: Optional[Callable[[str], None]] = None,
    exporter: Callable[[str, str, Path, ProofExecution], ExportedBuild] = export_one,
    fixture_probe: Callable[[ExportedBuild, ProofExecution, int], Dict[str, Any]] = run_fixture_probe,
    proof_runner: Callable[[str, Dict[str, Any]], Dict[str, Any]] = run_proof,
    retainer: Callable[[ProofExecution, str, ExportedBuild, Dict[str, Any], Path, Path], Dict[str, Any]] = _retain,
) -> Dict[str, Any]:
    if run_root.exists():
        raise ValueError("W3 run root must be absent for append-only execution")
    if not plan:
        raise ValueError("W3 execution plan contains no proof requiring execution")
    run_root.mkdir(parents=True)
    journal = W3ExecutionJournal(state_path, source_revision, allow_terminal_source_transition=True)
    builds: Dict[str, ExportedBuild] = {}
    completed_rows: list[Dict[str, Any]] = []
    newly_allocated_runs: list[str] = []
    newly_allocated_evidence: list[str] = []
    started = time.time()

    def inject(phase: str) -> None:
        if failure_injector is not None:
            failure_injector(phase)

    for planned in plan:
        execution = journal.allocate(planned)
        newly_allocated_runs.append(planned.run_id)
        newly_allocated_evidence.append(planned.evidence_id)
        phase = "after-allocation"
        observation_produced = False
        try:
            inject(phase)
            journal.begin(execution)
            phase = "after-execution-start"
            inject(phase)
            if not builds:
                for role in ("client", "headless"):
                    phase = f"{role}-export-build-self-report"
                    inject(f"before-{role}-export")
                    exported = exporter(source_revision, role, run_root, execution)
                    builds[role] = exported
                    journal.record_export(role, exported)
                    inject(f"after-{role}-export")
            exported = (
                builds["client"]
                if planned.proof_id in {"PRD04-PROOF-30", "PRD04-PROOF-31", "PRD04-PROOF-32"}
                else builds["headless"]
            )
            phase = "fixture-runtime-self-report"
            fixture_report = fixture_probe(exported, execution, 512)
            phase = "proof-observation"
            observed = proof_runner(planned.proof_id, {"physics_report": fixture_report})
            observed.update(
                run_id=planned.run_id,
                evidence_id=planned.evidence_id,
                source_revision=source_revision,
                build_identity=exported.build.build_identity,
            )
            execution.observe(_observed_state(str(observed.get("outcome", "FAIL"))))
            observation_produced = True
            phase = "evidence-retention"
            retained = retainer(execution, planned.evidence_id, exported, observed, run_root, retained_root)
            row = {
                "proof_id": planned.proof_id,
                "prior_state": "HARNESS-BLOCKED",
                "readiness": "READY",
                "state": execution.state.value,
                "run_id": planned.run_id,
                "evidence_id": planned.evidence_id,
                "build_identity": exported.build.build_identity,
                "artifact_sha256": exported.artifact.artifact_sha256,
                "key_metrics": observed["metrics"],
                "acceptance_reason": observed["acceptance_reason"],
                "limitations": observed.get("limitations", []),
                "portable_path": retained["portable_path"],
                "prd08_submission": "NOT-SUBMITTED",
                "blockers": [],
            }
            journal.complete(execution, row)
            completed_rows.append(row)
        except BaseException as exc:
            journal.fail(execution, phase, exc, observation_produced=observation_produced)
            raise

    proofs = journal.value["proofs"]
    result_counts = {
        state: sum(row["state"] == state for row in proofs)
        for state in ("PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE", "INVALIDATED")
    }
    return {
        "schema_version": "prd07-w3-execution-result-v2",
        "status": "COMPLETE",
        "package": "R7-W3-FLUID-VESSEL-MOVING-FRAME-PROOFS",
        "source_revision": source_revision,
        "duration_seconds": time.time() - started,
        "proofs": proofs,
        "completed_in_this_invocation": completed_rows,
        "result_counts": result_counts,
        "allocated_run_ids": list(journal.value["allocated_run_ids"]),
        "allocated_evidence_ids": list(journal.value["allocated_evidence_ids"]),
        "newly_allocated_run_ids": newly_allocated_runs,
        "newly_allocated_evidence_ids": newly_allocated_evidence,
        "exports": {role: item.to_dict() for role, item in builds.items()},
        "prd08_submission": "NOT-SUBMITTED",
        "gameplay_permission": "CLOSED",
    }


def execute_w3(
    source_revision: str,
    run_root: Path,
    retained_root: Path,
    state_path: Path,
    actual_execution_authorized: bool,
    *,
    failure_injector: Optional[Callable[[str], None]] = None,
) -> Dict[str, Any]:
    if not actual_execution_authorized:
        raise ValueError("actual W3 proof execution requires the explicit authorization flag")
    source_issues = source_execution_issues(source_revision)
    if source_issues:
        raise ValueError("W3 source is not execution ready: " + "; ".join(source_issues))
    if not READINESS_PATH.is_file():
        raise ValueError("repaired W3 readiness evidence is missing")
    tracked_readiness = json.loads(READINESS_PATH.read_text(encoding="utf-8-sig"))
    if not MANIFEST_PATH.is_file():
        raise ValueError("repaired W3 admission boundary is missing")
    tracked_boundary = json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig"))
    implementation_commit = str(tracked_readiness.get("implementation_commit", ""))
    expected_boundary = build_manifest(implementation_commit)
    certification_issues = certification_record_issues(tracked_readiness, tracked_boundary, expected_boundary)
    if certification_issues:
        raise ValueError("W3 certification records are not execution ready: " + "; ".join(certification_issues))
    preflight = preflight_report(implementation_commit, check_local=True)
    if preflight["status"] != "PASS":
        raise ValueError("W3 preflight failed: " + "; ".join(preflight["issues"]))
    run_root = run_root.resolve()
    retained_root = retained_root.resolve()
    state_path = state_path.resolve()
    if run_root.exists():
        raise ValueError("W3 run root must be absent for append-only execution")
    recover_interrupted_transaction(state_path, source_revision)
    plan = execution_plan_for_actual_run(
        ROOT,
        actual_execution_authorized=True,
        retained_root=retained_root,
    )
    return _execute_plan(
        source_revision,
        run_root,
        retained_root,
        state_path,
        plan,
        failure_injector=failure_injector,
    )
