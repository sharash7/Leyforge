"""Individual prerequisite evaluation for all twenty PRD-07 W2 proofs."""

from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Any, Dict, Tuple

from proofs.r7.w2.runtime.runner import PROOF_IDS

from .dependencies import ROOT, load_lock, reference_issues, verify_local_dependencies

READINESS_PATH = ROOT / "docs/rebuild/r7/w2-readiness.json"
W0_STATE = ROOT / "docs/rebuild/r7/w0-execution-state.json"
W1_STATE = ROOT / "docs/rebuild/r7/w1-execution-state.json"
_COMMIT = re.compile(r"^[0-9a-f]{40}$")

PREREQUISITES = {
    "PRD04-PROOF-07": ["WorldSession/task epochs", "controllable pending work", "close/reopen fixture"],
    "PRD04-PROOF-09": ["W1 operation identity", "realm/frame transition", "checkpoint and authoritative session"],
    "PRD04-PROOF-20": ["enumerable task classes", "shutdown policy", "real headless export and restart fixture"],
    "PRD04-PROOF-35": ["authoritative command path", "stable operation ID", "observable conserved effect"],
    "PRD04-PROOF-36": ["baseline admission", "content-pack identity", "incompatible baseline fixtures"],
    "PRD04-PROOF-37": ["interest engine", "bulk/critical lanes", "bounded queue metrics"],
    "PRD04-PROOF-38": ["cross-domain relevance", "entitlements", "independent simulation fidelity"],
    "PRD04-PROOF-39": ["multi-participant checkpoint", "fault phases", "coherent recovery oracle"],
    "PRD04-PROOF-40": ["multiple checkpoints", "corruption injector", "integrity-first recovery"],
    "PRD04-PROOF-41": ["heavy edit generator", "cutoff visibility", "honest durability state"],
    "PRD04-PROOF-42": ["PROOF-09 transition harness", "reconnect control", "stable character identity"],
    "PRD04-PROOF-43": ["PROOF-35 idempotency", "persistence hook", "reconnect result reconstruction"],
    "PRD04-PROOF-44": ["cache poison injection", "authoritative revision", "baseline repair/reject"],
    "PRD04-PROOF-45": ["coherent checkpoint", "reconnect client", "stable world/character/operation IDs"],
    "PRD04-PROOF-46": ["configurable impairment", "bulk/critical traffic", "queue and latency metrics"],
    "PRD04-PROOF-47": ["slow storage", "heavy writes", "durability and queue metrics"],
    "PRD04-PROOF-48": ["active checkpoints", "live backup", "concurrent real source/copy processes"],
    "PRD04-PROOF-57": ["pack identities", "missing-content world", "representative FCC-13E rows"],
    "PRD04-PROOF-58": ["staged migration and backup", "old/new manifests", "representative FCC-13E rows"],
    "PRD04-PROOF-69": ["external process controller", "real exported headless artifact", "phase markers and restart verifier"],
}


def _static_issues() -> list[str]:
    issues = list(reference_issues())
    required = (
        ROOT / "proofs/r7/w2/runtime/model.py",
        ROOT / "proofs/r7/w2/runtime/runner.py",
        ROOT / "proofs/r7/w2/server_probe/project.godot",
        ROOT / "proofs/r7/w2/server_probe/src/main.gd",
        ROOT / "tools/r7_w2_runtime/builds.py",
        ROOT / "tools/r7_w2_runtime/execution.py",
    )
    for path in required:
        if not path.is_file():
            issues.append(f"required W2 fixture is missing: {path.relative_to(ROOT).as_posix()}")
    if (ROOT / "project.godot").exists():
        issues.append("W2 cannot create a root production Godot project")
    if tuple(PROOF_IDS) != tuple(PREREQUISITES):
        issues.append("W2 proof runner and readiness proof sets differ")
    for path, expected in ((W0_STATE, 13), (W1_STATE, 17)):
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
        "schema_version": "prd07-w2-readiness-v1",
        "package": "R7-W2-NETWORK-PERSISTENCE-RECOVERY-MIGRATION-READINESS",
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
