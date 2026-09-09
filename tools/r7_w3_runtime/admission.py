"""Git-clean admission for the bounded W3 proof and evidence surface."""

from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path
from typing import Any, Dict, Mapping, Tuple

from .dependencies import ROOT, load_reference
from .execution_plan import inspect_execution_registry
from .readiness import READINESS_PATH, readiness_report
MANIFEST_PATH = ROOT / "docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json"
SUPERSEDED_MANIFEST_PATH = ROOT / "docs/rebuild/r7/w3-execution-boundary-repaired.json"
FIXED_FILES = (
    "tools/tests/test_r7_w3_runtime.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
    "docs/rebuild/r7/w3-allocation-reconciliation.json",
    "docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json",
    "docs/rebuild/r7/w3-fixture-launch-integration.json",
    "docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json",
    "docs/rebuild/r7/w3-execution-state.json",
)
FIXED_TREES = ("proofs/r7/w3", "tools/r7_w3_runtime")
OPTIONAL_FILES = ("docs/rebuild/r7/w3-execution-completion-receipt.json",)


def _canonical_bytes(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def _artifact_identity(path: Path) -> Dict[str, Any]:
    relative = path.relative_to(ROOT).as_posix()
    result = subprocess.run(["git", "hash-object", "--", relative], cwd=ROOT, text=True, capture_output=True)
    if result.returncode:
        raise RuntimeError(result.stderr.strip() or f"cannot hash {relative}")
    data = _canonical_bytes(path)
    return {
        "path": relative,
        "git_blob": result.stdout.strip(),
        "sha256": hashlib.sha256(data).hexdigest(),
        "bytes": len(data),
    }


def temporal_reconciliation_issues(
    boundary: Mapping[str, Any],
    execution_state: Mapping[str, Any],
    historical_admission: Mapping[str, Any],
) -> Tuple[str, ...]:
    """Distinguish a frozen admission timepoint from later governed execution truth."""
    issues = []
    if boundary.get("manifest_version") != 3 or boundary.get("lifecycle_role") != "CURRENT-POST-ATTEMPT-RECERTIFICATION":
        issues.append("current W3 boundary lifecycle role is missing or unsupported")
    if boundary.get("proof_execution") != "NOT-STARTED-FOR-NEXT-RERUN":
        issues.append("current W3 boundary does not keep the next rerun unstarted")
    if boundary.get("allocated_run_ids") != [] or boundary.get("allocated_evidence_ids") != []:
        issues.append("current W3 boundary allocated identities for the next rerun")
    if (
        historical_admission.get("proof_execution") != "NOT-STARTED"
        or historical_admission.get("allocated_run_ids") != []
        or historical_admission.get("allocated_evidence_ids") != []
    ):
        issues.append("historical W3 admission no longer represents its pre-execution timepoint")
    state_runs = execution_state.get("allocated_run_ids", [])
    state_evidence = execution_state.get("allocated_evidence_ids", [])
    history = execution_state.get("allocation_history", [])
    if not isinstance(state_runs, list) or not isinstance(state_evidence, list) or not isinstance(history, list):
        issues.append("terminal W3 execution state collections are invalid")
        return tuple(sorted(set(issues)))
    history_runs = [row.get("run_id") for row in history if isinstance(row, dict)]
    history_evidence = [row.get("evidence_id") for row in history if isinstance(row, dict)]
    if history_runs != state_runs:
        issues.append("terminal W3 allocation-history RUN order differs")
    if history_evidence != state_evidence:
        issues.append("terminal W3 allocation-history EVID order differs")
    if any(not isinstance(row, dict) for row in history):
        issues.append("terminal W3 allocation history contains a non-object row")
    active = [
        row for row in history if isinstance(row, dict)
        and row.get("state") in {"PRD07-RUN-ALLOCATED", "EXECUTING", "OBSERVATION-CAPTURED"}
    ]
    if active:
        issues.append("terminal W3 execution state contains an unresolved active allocation")
    invalidated = [row for row in history if isinstance(row, dict) and row.get("state") == "INVALIDATED"]
    observed = [
        row for row in history if isinstance(row, dict)
        and row.get("state") in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}
    ]
    if execution_state.get("package_state") != "ABORTED-BEFORE-PROOF-OBSERVATION":
        issues.append("terminal W3 execution disposition is not the certified pre-observation abort")
    if len(invalidated) != 1 or observed:
        issues.append("terminal W3 execution history does not contain exactly one unobserved invalidation")
    elif (
        invalidated[0].get("run_id") != "PRD07-RUN-0058"
        or invalidated[0].get("evidence_id") != "PRD07-EVID-0058"
        or invalidated[0].get("terminal_disposition") != "ABORTED-BEFORE-PROOF-OBSERVATION"
        or invalidated[0].get("proof_observation_produced") is not False
        or invalidated[0].get("evidence_pack_status") != "NOT-CREATED-NO-PROOF-OBSERVATION"
        or invalidated[0].get("prd07_evidence_eligible") is not False
    ):
        issues.append("invalidated W3 attempt 0058 semantics differ")
    reconciliation = boundary.get("historical_execution", {})
    if not isinstance(reconciliation, dict):
        issues.append("current W3 boundary lacks historical execution reconciliation")
    else:
        expected = {
            "source_revision": execution_state.get("source_revision"),
            "package_state": execution_state.get("package_state"),
            "allocated_run_ids": state_runs,
            "allocated_evidence_ids": state_evidence,
            "allocation_history_run_ids": history_runs,
            "allocation_history_evidence_ids": history_evidence,
            "proof_observation_count": len(observed),
            "invalidated_run_ids": [row.get("run_id") for row in invalidated],
            "invalidated_evidence_ids": [row.get("evidence_id") for row in invalidated],
        }
        if any(reconciliation.get(key) != value for key, value in expected.items()):
            issues.append("current W3 boundary historical execution reconciliation differs from its journal")
    if boundary.get("invalidated_run_ids") != [row.get("run_id") for row in invalidated]:
        issues.append("current W3 boundary invalidated RUN identities differ")
    if boundary.get("invalidated_evidence_ids") != [row.get("evidence_id") for row in invalidated]:
        issues.append("current W3 boundary invalidated EVID identities differ")
    return tuple(sorted(set(issues)))


def admitted_paths() -> list[str]:
    paths: set[str] = set()
    for relative in FIXED_FILES + OPTIONAL_FILES:
        if (ROOT / relative).is_file():
            paths.add(relative)
    for relative in FIXED_TREES:
        base = ROOT / relative
        if base.is_dir():
            for path in base.rglob("*"):
                if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() not in {".pyc", ".exe", ".dll", ".pck"}:
                    paths.add(path.relative_to(ROOT).as_posix())
    state_path = ROOT / "docs/rebuild/r7/w3-execution-state.json"
    state = json.loads(state_path.read_text(encoding="utf-8-sig")) if state_path.is_file() else {}
    for run_id in state.get("allocated_run_ids", []):
        base = ROOT / "docs/rebuild/r7/execution-evidence" / run_id
        if base.is_dir():
            for path in base.rglob("*"):
                if path.is_file() and path.suffix.lower() not in {".exe", ".dll", ".pck"}:
                    paths.add(path.relative_to(ROOT).as_posix())
    paths.discard(MANIFEST_PATH.relative_to(ROOT).as_posix())
    return sorted(paths)


def build_manifest(implementation_commit: str) -> Dict[str, Any]:
    if not READINESS_PATH.is_file():
        raise RuntimeError("repaired W3 readiness must exist before admission")
    readiness = json.loads(READINESS_PATH.read_text(encoding="utf-8-sig"))
    if (
        readiness.get("status") != "PASS"
        or readiness.get("implementation_commit") != implementation_commit
        or readiness.get("implementation_commit_source_match") is not True
        or readiness.get("allocated_run_ids") != []
        or readiness.get("allocated_evidence_ids") != []
    ):
        raise RuntimeError("repaired W3 readiness does not certify this exact source commit without rerun allocations")
    current_readiness = readiness_report(implementation_commit, check_local=False)
    if (
        current_readiness.get("status") != "PASS"
        or current_readiness != readiness
    ):
        raise RuntimeError("repaired W3 readiness is stale or differs from independent regeneration")
    paths = admitted_paths()
    result = subprocess.run(["git", "hash-object", "--stdin-paths"], cwd=ROOT, input="\n".join(paths) + "\n", text=True, capture_output=True)
    if result.returncode:
        raise RuntimeError(result.stderr.strip() or "W3 Git-clean hashing failed")
    blobs = result.stdout.splitlines()
    if len(blobs) != len(paths):
        raise RuntimeError("W3 Git-clean hashing returned a different path count")
    artifacts = []
    for relative, blob in zip(paths, blobs):
        data = _canonical_bytes(ROOT / relative)
        artifacts.append({"path": relative, "bytes": len(data), "sha256": hashlib.sha256(data).hexdigest(), "git_blob": blob})
    state_path = ROOT / "docs/rebuild/r7/w3-execution-state.json"
    if not state_path.is_file():
        raise RuntimeError("terminal W3 execution state is required for post-attempt recertification")
    state = json.loads(state_path.read_text(encoding="utf-8-sig"))
    if not SUPERSEDED_MANIFEST_PATH.is_file():
        raise RuntimeError("historical pre-execution W3 admission is missing")
    historical_admission = json.loads(SUPERSEDED_MANIFEST_PATH.read_text(encoding="utf-8-sig"))
    reference = load_reference()
    registry = inspect_execution_registry(ROOT)
    allocation_history = state.get("allocation_history", state.get("proofs", [])) if isinstance(state, dict) else []
    observed_rows = [
        row for row in allocation_history
        if isinstance(row, dict) and row.get("state") in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}
    ]
    invalidated_rows = [row for row in allocation_history if isinstance(row, dict) and row.get("state") == "INVALIDATED"]
    previews = [
        row.get("future_identity_preview") for row in readiness.get("proofs", [])
        if isinstance(row, dict) and isinstance(row.get("future_identity_preview"), dict)
    ]
    manifest = {
        "manifest_version": 3,
        "package": "R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION",
        "lifecycle_role": "CURRENT-POST-ATTEMPT-RECERTIFICATION",
        "scope": "development-only-prd07-proof-runtime",
        "gameplay_permission": "CLOSED",
        "implementation_commit": implementation_commit,
        "source_tree_identity": readiness.get("source_tree_identity", ""),
        "proof_execution": "NOT-STARTED-FOR-NEXT-RERUN",
        "execution_gate": "OPEN-FOR-FUTURE-SEPARATELY-AUTHORIZED-W3-RERUN",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "quarantined_run_ids": list(registry.quarantined_run_ids),
        "quarantined_evidence_ids": [registry.mappings[run_id][1] for run_id in registry.quarantined_run_ids],
        "invalidated_run_ids": [row.get("run_id") for row in invalidated_rows],
        "invalidated_evidence_ids": [row.get("evidence_id") for row in invalidated_rows],
        "next_identity_previews": previews,
        "registry": {
            "run_high_water": registry.max_run_number,
            "evidence_high_water": registry.max_evidence_number,
            "issued_identity_count": len(registry.run_ids),
            "retained_identity_count": len(registry.retained_run_ids),
            "quarantined_identity_count": len(registry.quarantined_run_ids),
            "invalidated_identity_count": len(invalidated_rows),
            "next_future_sequence": registry.max_run_number + 1,
            "state_paths": list(registry.state_paths),
            "quarantine_paths": list(registry.quarantine_paths),
        },
        "pinned_engine_validation": readiness.get("pinned_engine_validation", {}),
        "fixture_launch_validation": readiness.get("fixture_launch_validation", {}),
        "authority": [
            "TASK-20260909-002",
            "WORK-20260909-002",
            "HANDOFF-20260909-001",
            "EVID-0011",
            "AUDIT-0011",
            "DOC-PRD-07",
        ],
        "dependency_identity": reference["component_revisions"],
        "historical_admission": {
            **_artifact_identity(SUPERSEDED_MANIFEST_PATH),
            "lifecycle_role": "IMMUTABLE-PRE-EXECUTION-ADMISSION",
            "proof_execution": historical_admission.get("proof_execution"),
            "allocated_run_ids": historical_admission.get("allocated_run_ids", []),
            "allocated_evidence_ids": historical_admission.get("allocated_evidence_ids", []),
            "implementation_commit": historical_admission.get("implementation_commit"),
        },
        "historical_execution": {
            **_artifact_identity(state_path),
            "lifecycle_role": "IMMUTABLE-TERMINAL-EXECUTION-JOURNAL",
            "source_revision": state.get("source_revision"),
            "package_state": state.get("package_state"),
            "allocated_run_ids": state.get("allocated_run_ids", []),
            "allocated_evidence_ids": state.get("allocated_evidence_ids", []),
            "allocation_history_run_ids": [row.get("run_id") for row in allocation_history if isinstance(row, dict)],
            "allocation_history_evidence_ids": [row.get("evidence_id") for row in allocation_history if isinstance(row, dict)],
            "proof_observation_count": len(observed_rows),
            "invalidated_run_ids": [row.get("run_id") for row in invalidated_rows],
            "invalidated_evidence_ids": [row.get("evidence_id") for row in invalidated_rows],
        },
        "prior_boundary_disposition": {
            "path": SUPERSEDED_MANIFEST_PATH.relative_to(ROOT).as_posix(),
            "state": "SUPERSEDED-BY-POST-ATTEMPT-RECERTIFICATION",
            "reason": "The immutable admission remains valid for its pre-execution timepoint; this boundary additionally reconciles terminal invalidated attempt 0058 and certifies a distinct unstarted next-rerun boundary.",
        },
        "artifacts": artifacts,
    }
    issues = temporal_reconciliation_issues(manifest, state, historical_admission)
    if issues:
        raise RuntimeError("W3 temporal reconciliation failed: " + "; ".join(issues))
    return manifest


def write_manifest(implementation_commit: str) -> Dict[str, Any]:
    value = build_manifest(implementation_commit)
    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST_PATH.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return value
