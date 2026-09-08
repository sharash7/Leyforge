"""Git-clean admission for the bounded W3 proof and evidence surface."""

from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path
from typing import Any, Dict

from .dependencies import ROOT, load_reference
from .execution_plan import inspect_execution_registry
from .readiness import READINESS_PATH, readiness_report
MANIFEST_PATH = ROOT / "docs/rebuild/r7/w3-execution-boundary-repaired.json"
SUPERSEDED_MANIFEST_PATH = ROOT / "docs/rebuild/r7/w3-execution-boundary-corrected.json"
FIXED_FILES = (
    "tools/tests/test_r7_w3_runtime.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
    "docs/rebuild/r7/w3-allocation-reconciliation.json",
    "docs/rebuild/r7/w3-pinned-engine-validation.json",
    "docs/rebuild/r7/w3-readiness-repaired.json",
)
FIXED_TREES = ("proofs/r7/w3", "tools/r7_w3_runtime")
OPTIONAL_FILES = ("docs/rebuild/r7/w3-execution-state.json", "docs/rebuild/r7/w3-execution-completion-receipt.json")


def _canonical_bytes(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


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
    state = json.loads(state_path.read_text(encoding="utf-8-sig")) if state_path.is_file() else {}
    reference = load_reference()
    registry = inspect_execution_registry(ROOT)
    allocation_history = state.get("allocation_history", state.get("proofs", [])) if isinstance(state, dict) else []
    observed = any(
        isinstance(row, dict) and row.get("state") in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}
        for row in allocation_history
    )
    execution_state = "OBSERVED" if observed else "ABORTED" if state else "NOT-STARTED"
    return {
        "manifest_version": 2,
        "package": "R7-W3-TECHNICAL-ENVIRONMENT-REPAIR-AND-RECERTIFICATION",
        "scope": "development-only-prd07-proof-runtime",
        "gameplay_permission": "CLOSED",
        "implementation_commit": implementation_commit,
        "source_tree_identity": readiness.get("source_tree_identity", ""),
        "proof_execution": execution_state,
        "allocated_run_ids": state.get("allocated_run_ids", []),
        "allocated_evidence_ids": state.get("allocated_evidence_ids", []),
        "quarantined_run_ids": list(registry.quarantined_run_ids),
        "quarantined_evidence_ids": [registry.mappings[run_id][1] for run_id in registry.quarantined_run_ids],
        "registry": {
            "run_high_water": registry.max_run_number,
            "evidence_high_water": registry.max_evidence_number,
            "issued_identity_count": len(registry.run_ids),
            "retained_identity_count": len(registry.retained_run_ids),
            "quarantined_identity_count": len(registry.quarantined_run_ids),
            "next_future_sequence": registry.max_run_number + 1,
            "state_paths": list(registry.state_paths),
            "quarantine_paths": list(registry.quarantine_paths),
        },
        "pinned_engine_validation": readiness.get("pinned_engine_validation", {}),
        "authority": [
            "TASK-20260908-002",
            "WORK-20260908-002",
            "HANDOFF-20260908-002",
            "EVID-0009",
            "AUDIT-0009",
            "DOC-PRD-07",
        ],
        "dependency_identity": reference["component_revisions"],
        "prior_boundary_disposition": {
            "path": SUPERSEDED_MANIFEST_PATH.relative_to(ROOT).as_posix(),
            "state": "SUPERSEDED-INSUFFICIENT",
            "reason": "It admitted source without a real pinned-engine parse/load/export gate and predates authoritative 0051-0057 quarantine reconciliation.",
        },
        "artifacts": artifacts,
    }


def write_manifest(implementation_commit: str) -> Dict[str, Any]:
    value = build_manifest(implementation_commit)
    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST_PATH.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return value
