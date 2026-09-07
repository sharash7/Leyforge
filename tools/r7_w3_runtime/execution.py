"""Guarded W3 execution and append-only evidence retention."""

from __future__ import annotations

import csv
import json
import platform
import re
import subprocess
import time
from pathlib import Path
from typing import Any, Dict, Mapping, Tuple

from proofs.r7.w3.runtime.runner import run_proof
from tools.proof_harness.evidence import EvidenceFile, EvidencePack
from tools.proof_harness.manifests import sha256_file
from tools.proof_harness.state import ExecutionKind, ProofExecution, ProofState

from .builds import ExportedBuild, export_one, run_concurrent_backup_smoke, run_real_crash_matrix
from .dependencies import ROOT, load_lock, reference_issues, verify_local_dependencies
from .execution_plan import PROOF_PLAN
from .readiness import READINESS_PATH, readiness_report

_SOURCE_REVISION = re.compile(r"^[0-9a-f]{40}$")
_FCC13E = ROOT / ".summer/00_Docs/FCC-01-14/FCC13/Leyforge_FCC-13_Definitive_Registry_LOCKED/FCC-13E_Final_312-Row_Legacy_Migration_Matrix_v0_1.csv"


def _write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n", encoding="utf-8")


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
        "proofs/r7/w3", "tools/r7_w3_runtime", "tools/tests/test_r7_w3_runtime.py",
        "docs/rebuild/r7/w3-readiness.json", "docs/rebuild/r7/w3-execution-boundary.json",
        "tools/verify.py", "tools/verify_rebuild_boundary.py",
    )
    if _git("status", "--porcelain", "--", *governed):
        issues.append("governed W3 proof source has uncommitted changes")
    return tuple(issues)


def preflight_report(implementation_commit: str, check_local: bool) -> Dict[str, Any]:
    issues = list(reference_issues())
    readiness = readiness_report(implementation_commit, check_local=False)
    if readiness["status"] != "PASS":
        issues.extend(readiness["issues"])
    local = verify_local_dependencies(load_lock()) if check_local else {"status": "NOT-CHECKED", "issues": [], "paths": {}}
    if check_local and local["status"] != "PASS":
        issues.extend(local["issues"])
    return {
        "schema_version": "leyforge-r7-w3-preflight-v1",
        "status": "PASS" if not issues else "FAIL",
        "implementation_commit": implementation_commit,
        "readiness": readiness,
        "local_dependencies": local,
        "issues": sorted(set(issues)),
        "gameplay_permission": "CLOSED",
        "prd08_evaluation": "CLOSED",
    }


def _new_execution(proof_id: str, run_id: str) -> ProofExecution:
    execution = ProofExecution(proof_id)
    execution.evaluate_prerequisites([])
    execution.allocate_run(run_id, ExecutionKind.ACTUAL, actual_execution_authorized=True)
    execution.begin()
    return execution


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
    evidence_file = EvidenceFile.from_path(evidence_id, "observed-w3-proof-result", raw_source)
    pack = EvidencePack(
        run_id=str(execution.run_id),
        proof_id=execution.proof_id,
        outcome=execution.state,
        execution_kind=ExecutionKind.ACTUAL,
        build=exported.build,
        artifact=exported.artifact,
        scenario={
            "package": "R7-W3-NETWORK-PERSISTENCE-RECOVERY-MIGRATION-READINESS",
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
        "The proof-only export remains in ignored local storage; its exact hash, process identity, structured diagnostics, fixture data and reproducer are retained. "
        "This result has not been evaluated by PRD-08 and does not open R8.\n",
        encoding="utf-8",
    )
    return {"portable_path": str(portable), "local_pack": str(local_pack), "run": run_record}


def _load_migration_cases() -> tuple[list[Dict[str, Any]], Dict[str, Any]]:
    with _FCC13E.open("r", encoding="utf-8-sig", newline="") as stream:
        rows = list(csv.DictReader(stream))
    if len(rows) != 312:
        raise ValueError(f"FCC-13E source row count differs from 312: {len(rows)}")
    indexes = sorted({(index * len(rows)) // 24 for index in range(24)})
    selected = []
    for index in indexes:
        row = rows[index]
        selected.append({
            "numeric_id": row["numeric_id"],
            "unique_id": row["unique_id"],
            "original_id": row["original_id"],
            "stable_row_identity": row["unique_id"],
            "disposition": row["disposition"],
            "target": row["target"],
            "final_status": row["final_fcc13e_status"],
            "final_action": row["final_action"],
        })
    return selected, {
        "source": _FCC13E.relative_to(ROOT).as_posix(),
        "source_rows": len(rows),
        "sample_rows": len(selected),
        "sample_indexes_zero_based": indexes,
        "source_sha256": sha256_file(_FCC13E),
        "w4_full_revalidation": "REQUIRED",
    }


def _write_state(path: Path, source_revision: str, rows: list[Dict[str, Any]], builds: Mapping[str, ExportedBuild]) -> None:
    complete = {row["proof_id"] for row in rows}
    pending = [proof_id for proof_id, _, _ in PROOF_PLAN if proof_id not in complete]
    value = {
        "schema_version": "prd07-w3-execution-state-v1",
        "package": "R7-W3-NETWORK-PERSISTENCE-RECOVERY-MIGRATION-READINESS",
        "package_state": "EXECUTING" if pending else "W3-EXECUTION-COMPLETE",
        "source_revision": source_revision,
        "gameplay_permission": "CLOSED",
        "prd08_evaluation": "CLOSED",
        "w4_fcc13e_revalidation": "REQUIRED",
        "prior_readiness_source": "docs/rebuild/r7/w3-readiness.json",
        "allocated_run_ids": [row["run_id"] for row in rows],
        "allocated_evidence_ids": [row["evidence_id"] for row in rows],
        "proofs": rows + [
            {"proof_id": proof_id, "prior_state": "HARNESS-BLOCKED", "readiness": "READY", "state": "NOT-RUN", "blockers": []}
            for proof_id in pending
        ],
        "export_lanes": {
            role: {
                "state": "PASS",
                "build_identity": item.build.build_identity,
                "artifact_sha256": item.artifact.artifact_sha256,
                "artifact_size_bytes": item.artifact.size_bytes,
                "runtime_self_report": item.self_report,
            }
            for role, item in builds.items()
        },
    }
    _write_json(path, value)


def execute_w3(
    source_revision: str,
    run_root: Path,
    retained_root: Path,
    state_path: Path,
    actual_execution_authorized: bool,
) -> Dict[str, Any]:
    if not actual_execution_authorized:
        raise ValueError("actual W3 proof execution requires the explicit authorization flag")
    source_issues = source_execution_issues(source_revision)
    if source_issues:
        raise ValueError("W3 source is not execution ready: " + "; ".join(source_issues))
    tracked_readiness = json.loads(READINESS_PATH.read_text(encoding="utf-8-sig"))
    if tracked_readiness.get("status") != "PASS" or any(row.get("state") != "READY" for row in tracked_readiness.get("proofs", [])):
        raise ValueError("tracked W3 readiness does not make all twenty proofs individually READY")
    preflight = preflight_report(str(tracked_readiness["implementation_commit"]), check_local=True)
    if preflight["status"] != "PASS":
        raise ValueError("W3 preflight failed: " + "; ".join(preflight["issues"]))
    run_root = run_root.resolve()
    retained_root = retained_root.resolve()
    state_path = state_path.resolve()
    if run_root.exists():
        raise ValueError("W3 run root must be absent for append-only execution")
    run_root.mkdir(parents=True)
    first = _new_execution(PROOF_PLAN[0][0], PROOF_PLAN[0][1])
    builds = {
        "client": export_one(source_revision, "client", run_root, first),
        "headless": export_one(source_revision, "headless", run_root, first),
    }
    migration_cases, migration_source = _load_migration_cases()
    rows: list[Dict[str, Any]] = []
    started = time.time()
    headless_proofs = {
        "PRD04-PROOF-07", "PRD04-PROOF-09", "PRD04-PROOF-20", "PRD04-PROOF-39",
        "PRD04-PROOF-40", "PRD04-PROOF-41", "PRD04-PROOF-42", "PRD04-PROOF-43",
        "PRD04-PROOF-45", "PRD04-PROOF-47", "PRD04-PROOF-48", "PRD04-PROOF-57",
        "PRD04-PROOF-58", "PRD04-PROOF-69",
    }
    for index, (proof_id, run_id, evidence_id) in enumerate(PROOF_PLAN):
        execution = first if index == 0 else _new_execution(proof_id, run_id)
        context: Dict[str, Any] = {
            "exports": {
                role: {
                    "smoke_pass": item.self_report.get("status") == "PASS",
                    "build_identity": item.build.build_identity,
                    "artifact_sha256": item.artifact.artifact_sha256,
                    "runtime_self_report": item.self_report,
                }
                for role, item in builds.items()
            },
            "migration_cases": migration_cases,
            "migration_source": migration_source,
        }
        if proof_id == "PRD04-PROOF-48":
            context["real_backup_process_report"] = run_concurrent_backup_smoke(builds["headless"], execution, run_root)
        if proof_id == "PRD04-PROOF-69":
            context["real_crash_report"] = run_real_crash_matrix(builds["headless"], execution, run_root, repetitions_per_phase=16)
        observed = run_proof(proof_id, context)
        exported = builds["headless"] if proof_id in headless_proofs else builds["client"]
        observed.update(
            run_id=run_id,
            evidence_id=evidence_id,
            source_revision=source_revision,
            build_identity=exported.build.build_identity,
            migration_source=migration_source if proof_id in {"PRD04-PROOF-57", "PRD04-PROOF-58"} else None,
        )
        execution.observe(_observed_state(str(observed.get("outcome", "FAIL"))))
        retained = _retain(execution, evidence_id, exported, observed, run_root, retained_root)
        row = {
            "proof_id": proof_id,
            "prior_state": "HARNESS-BLOCKED",
            "readiness": "READY",
            "state": execution.state.value,
            "run_id": run_id,
            "evidence_id": evidence_id,
            "build_identity": exported.build.build_identity,
            "artifact_sha256": exported.artifact.artifact_sha256,
            "key_metrics": observed["metrics"],
            "acceptance_reason": observed["acceptance_reason"],
            "limitations": observed.get("limitations", []),
            "portable_path": retained["portable_path"],
            "prd08_submission": "NOT-SUBMITTED",
            "blockers": [],
        }
        rows.append(row)
        _write_state(state_path, source_revision, rows, builds)
    result_counts = {state: sum(row["state"] == state for row in rows) for state in ("PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE", "INVALIDATED")}
    return {
        "schema_version": "prd07-w3-execution-result-v1",
        "status": "COMPLETE",
        "package": "R7-W3-NETWORK-PERSISTENCE-RECOVERY-MIGRATION-READINESS",
        "source_revision": source_revision,
        "duration_seconds": time.time() - started,
        "proofs": rows,
        "result_counts": result_counts,
        "allocated_run_ids": [row["run_id"] for row in rows],
        "allocated_evidence_ids": [row["evidence_id"] for row in rows],
        "exports": {role: item.to_dict() for role, item in builds.items()},
        "migration_source": migration_source,
        "prd08_submission": "NOT-SUBMITTED",
        "gameplay_permission": "CLOSED",
        "w4_fcc13e_revalidation": "REQUIRED",
    }
