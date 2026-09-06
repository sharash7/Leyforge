"""Machine-readable W0 proof prerequisite and bootstrap status."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Any, Dict, Tuple

W0_PROOFS = (
    "PRD04-PROOF-01", "PRD04-PROOF-02", "PRD04-PROOF-03", "PRD04-PROOF-05",
    "PRD04-PROOF-06", "PRD04-PROOF-10", "PRD04-PROOF-11", "PRD04-PROOF-12",
    "PRD04-PROOF-22", "PRD04-PROOF-67", "PRD04-PROOF-70", "PRD04-PROOF-73",
    "PRD04-PROOF-74",
)
ALLOWED_STATES = frozenset({"SPECIFIED", "HARNESS-BLOCKED", "READY"})


def load(path: Path) -> Dict[str, Any]:
    data = json.loads(path.read_text(encoding="utf-8"))
    if data.get("schema_version") != "prd07-w0-readiness-v1":
        raise ValueError("unsupported W0 readiness schema")
    return data


def validate(data: Dict[str, Any]) -> Tuple[str, ...]:
    issues = []
    if data.get("package_state") not in {"BOOTSTRAP-IMPLEMENTING", "BOOTSTRAP-COMPLETE"}:
        issues.append("invalid W0 bootstrap package state")
    rows = data.get("proofs")
    if not isinstance(rows, list):
        return ("proofs must be a list",)
    ids = [row.get("proof_id") for row in rows if isinstance(row, dict)]
    if tuple(ids) != W0_PROOFS:
        issues.append("proof list must contain the 13 W0 proof IDs in canonical order")
    for row in rows:
        if not isinstance(row, dict):
            issues.append("every proof row must be an object")
            continue
        state = row.get("state")
        blockers = row.get("blockers")
        if state not in ALLOWED_STATES:
            issues.append("%s has invalid state" % row.get("proof_id", "<missing>"))
        if state == "READY" and blockers:
            issues.append("%s is READY while blockers remain" % row.get("proof_id", "<missing>"))
        if state == "HARNESS-BLOCKED" and not blockers:
            issues.append("%s is HARNESS-BLOCKED without an explicit blocker" % row.get("proof_id", "<missing>"))
    lanes = data.get("smoke_lanes")
    if not isinstance(lanes, list) or tuple(lane.get("role") for lane in lanes) != ("client", "headless"):
        issues.append("client and headless smoke lanes must both be declared")
    else:
        for lane in lanes:
            if lane.get("state") == "READY" and lane.get("blockers"):
                issues.append("%s is READY while blockers remain" % lane.get("lane_id", "<missing>"))
            if lane.get("state") == "HARNESS-BLOCKED" and not lane.get("blockers"):
                issues.append("%s lacks an explicit blocker" % lane.get("lane_id", "<missing>"))
    if data.get("allocated_run_ids") != []:
        issues.append("bootstrap readiness manifest must not allocate PRD07-RUN IDs")
    if data.get("allocated_evidence_ids") != []:
        issues.append("bootstrap readiness manifest must not allocate PRD07-EVID IDs")
    return tuple(issues)


def report(data: Dict[str, Any]) -> Dict[str, Any]:
    issues = validate(data)
    rows = data.get("proofs", [])
    counts = {state: sum(1 for row in rows if row.get("state") == state) for state in sorted(ALLOWED_STATES)}
    return {
        "tool": "Leyforge PRD-07 W0 readiness", "status": "PASS" if not issues else "FAIL",
        "package_state": data.get("package_state"), "counts": counts,
        "allocated_run_ids": list(data.get("allocated_run_ids", [])),
        "allocated_evidence_ids": list(data.get("allocated_evidence_ids", [])),
        "issues": list(issues), "proofs": rows,
        "smoke_lanes": list(data.get("smoke_lanes", [])),
    }
