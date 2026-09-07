"""Individual readiness evaluation for all seventeen PRD-07 W1 proofs."""

from __future__ import annotations

import json
import re
from pathlib import Path
from typing import Any, Dict, Tuple

from proofs.r7.w1.runtime.runner import PROOF_IDS

from .dependencies import ROOT, load_lock, reference_issues, verify_local_dependencies

READINESS_PATH = ROOT / "docs/rebuild/r7/w1-readiness.json"
W0_STATE = ROOT / "docs/rebuild/r7/w0-execution-state.json"
_COMMIT = re.compile(r"^[0-9a-f]{40}$")

PREREQUISITES = {
    "PRD04-PROOF-04": ["owner/revision fixture", "idempotent transaction engine", "fault matrix"],
    "PRD04-PROOF-13": ["versioned proposals", "controllable completion order", "classification vocabulary"],
    "PRD04-PROOF-14": ["ownership epochs", "stable partition identity", "in-flight command fixture"],
    "PRD04-PROOF-15": ["zero-Node domain records", "governed clock", "promotion projection"],
    "PRD04-PROOF-16": ["fidelity tiers", "declared conservation invariants", "transition control"],
    "PRD04-PROOF-17": ["transaction engine", "canonical spatial edit", "resource and permission owner"],
    "PRD04-PROOF-18": ["independent bounded worker queues", "CPU/time-series diagnostics", "realistic W1 workload profile"],
    "PRD04-PROOF-19": ["pure-domain scheduler", "variable cadence profiles", "real client/headless exports"],
    "PRD04-PROOF-21": ["explicit RNG context", "canonical hashing", "worker order control"],
    "PRD04-PROOF-23": ["canonical edit API", "independent dirty-region oracle", "revisioned consumers"],
    "PRD04-PROOF-24": ["delayed generation proposal", "canonical edit revision", "reload representation"],
    "PRD04-PROOF-25": ["collision readiness revisions", "authoritative interaction query", "real provider probe"],
    "PRD04-PROOF-26": ["nav dirty bridge", "path readiness query", "real provider probe"],
    "PRD04-PROOF-33": ["structure integrity trigger", "owner-mediated collapse transaction", "derived readiness"],
    "PRD04-PROOF-34": ["injectable provider adapter failures", "canonical/provider separation", "real provider probe"],
    "PRD04-PROOF-63": ["structured correlation graph", "minimal persistence/network projections", "real external provider process"],
    "PRD04-PROOF-68": ["randomized completion control", "owner/revision invariants", "conservation oracle"],
}


def _static_issues() -> list[str]:
    issues = list(reference_issues())
    required = (
        ROOT / "proofs/r7/w1/runtime/model.py",
        ROOT / "proofs/r7/w1/runtime/runner.py",
        ROOT / "proofs/r7/w1/provider_probe/project.godot",
        ROOT / "proofs/r7/w1/provider_probe/src/provider_probe.gd",
    )
    for path in required:
        if not path.is_file():
            issues.append(f"required W1 fixture is missing: {path.relative_to(ROOT).as_posix()}")
    if (ROOT / "project.godot").exists():
        issues.append("W1 cannot create a root production Godot project")
    if tuple(PROOF_IDS) != tuple(PREREQUISITES):
        issues.append("W1 proof runner and readiness proof sets differ")
    if not W0_STATE.is_file():
        issues.append("certified W0 execution state is missing")
    else:
        state = json.loads(W0_STATE.read_text(encoding="utf-8-sig"))
        if len(state.get("allocated_run_ids", [])) != 13 or len(state.get("proofs", [])) != 13:
            issues.append("W0 execution state does not contain all thirteen retained results")
        if any(row.get("state") not in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"} for row in state.get("proofs", [])):
            issues.append("W0 execution state contains a non-observed result")
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
        "schema_version": "prd07-w1-readiness-v1",
        "package": "R7-W1-OWNER-SPATIAL-PROOFS",
        "package_state": "READY" if not issues else "HARNESS-BLOCKED",
        "implementation_commit": implementation_commit,
        "gameplay_permission": "CLOSED",
        "prd08_evaluation": "CLOSED",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "proofs": rows,
        "dependency_check": local,
        "issues": sorted(set(issues)),
        "status": "PASS" if not issues else "FAIL",
    }


def write_readiness(implementation_commit: str, check_local: bool = True) -> Dict[str, Any]:
    value = readiness_report(implementation_commit, check_local)
    if value["status"] != "PASS":
        raise ValueError("W1 readiness failed: " + "; ".join(value["issues"]))
    READINESS_PATH.parent.mkdir(parents=True, exist_ok=True)
    READINESS_PATH.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return value
