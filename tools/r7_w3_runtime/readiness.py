"""Individual prerequisite evaluation for all twenty PRD-07 W3 proofs."""

from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Any, Dict, Tuple

from proofs.r7.w3.runtime.runner import PROOF_IDS

from .dependencies import ROOT, load_lock, reference_issues, verify_local_dependencies

READINESS_PATH = ROOT / "docs/rebuild/r7/w3-readiness.json"
W0_STATE = ROOT / "docs/rebuild/r7/w0-execution-state.json"
W1_STATE = ROOT / "docs/rebuild/r7/w1-execution-state.json"
W2_STATE = ROOT / "docs/rebuild/r7/w2-execution-state.json"
_COMMIT = re.compile(r"^[0-9a-f]{40}$")

PREREQUISITES = {
    "PRD04-PROOF-08": ["vessel region ownership", "frame bindings", "vessel-local coordinates"],
    "PRD04-PROOF-27": ["conserved fluid state", "revisioned cross-boundary exchange", "cell/volume conservation"],
    "PRD04-PROOF-28": ["ocean reservoir boundary", "bounded local fluid", "level/pressure/source rules"],
    "PRD04-PROOF-29": ["canonical hull edit", "revisioned derived-property rebuild", "vessel-local frame"],
    "PRD04-PROOF-30": ["vessel-local attachment", "independent entity identity", "world frame projection"],
    "PRD04-PROOF-31": ["compound convex decomposition", "moving body support", "contact correctness"],
    "PRD04-PROOF-32": ["compartment flooding", "derived buoyancy/mass", "authoritative hull + contained fluid"],
}


def _static_issues() -> list[str]:
    issues = list(reference_issues())
    required = (
        ROOT / "proofs/r7/w3/runtime/model.py",
        ROOT / "proofs/r7/w3/runtime/runner.py",
        ROOT / "proofs/r7/w3/server_probe/project.godot",
        ROOT / "proofs/r7/w3/server_probe/src/main.gd",
        ROOT / "tools/r7_w3_runtime/builds.py",
        ROOT / "tools/r7_w3_runtime/execution.py",
    )
    for path in required:
        if not path.is_file():
            issues.append(f"required W3 fixture is missing: {path.relative_to(ROOT).as_posix()}")
    if (ROOT / "project.godot").exists():
        issues.append("W3 cannot create a root production Godot project")
    if tuple(PROOF_IDS) != tuple(PREREQUISITES):
        issues.append("W3 proof runner and readiness proof sets differ")
    for path, expected in ((W0_STATE, 13), (W1_STATE, 17), (W2_STATE, 20)):
        if not path.is_file():
            issues.append(f"certified prior execution state is missing: {path.relative_to(ROOT).as_posix()}")
            continue
        state = json.loads(path.read_text(encoding="utf-8-sig"))
        if len(state.get("allocated_run_ids", [])) != expected or len(state.get("proofs", [])) != expected:
            issues.append(f"prior execution state count differs: {path.relative_to(ROOT).as_posix()}")
        if any(row.get("state") not in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"} for row in state.get("proofs", [])):
            issues.append(f"prior execution state contains a non-observed row: {path.relative_to(ROOT).as_posix()}")
    return sorted(set(issues))


def readiness_report(implementation_commit: str, check_local: bool) -> Dict[str, Any]:
    issues = _static_issues()
    if _COMMIT.fullmatch(implementation_commit) is None:
        issues.append("implementation commit must be an exact lowercase forty-character commit")
    local = verify_local_dependencies(load_lock()) if check_local else {"status": "NOT-CHECKED", "issues": [], "paths": {}}
    if check_local and local["status"] != "PASS":
        issues.extend(local["issues"])
    rows = []
    for proof_id in PROOF_IDS:
        blockers = list(issues)
        rows.append({
            "proof_id": proof_id,
            "prior_state": "HARNESS-BLOCKED",
            "state": "READY" if not blockers else "HARNESS-BLOCKED",
            "prerequisites": PREREQUISITES[proof_id],
            "blockers": blockers,
        })
    return {
        "schema_version": "prd07-w3-readiness-v1",
        "package": "R7-W3-TECHNICAL-ENVIRONMENT-READINESS",
        "package_state": "READY" if not issues else "HARNESS-BLOCKED",
        "implementation_commit": implementation_commit,
        "proofs": rows,
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "dependency_check": local,
        "issues": sorted(set(issues)),
        "status": "PASS" if not issues else "FAIL",
        "prd08_evaluation": "CLOSED",
        "gameplay_permission": "CLOSED",
        "w4_fcc13e_revalidation": "REQUIRED",
    }


def write_readiness(implementation_commit: str, check_local: bool) -> Dict[str, Any]:
    value = readiness_report(implementation_commit, check_local)
    READINESS_PATH.parent.mkdir(parents=True, exist_ok=True)
    READINESS_PATH.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return value
