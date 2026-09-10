"""Side-effect-free W4 identity previews and future fail-closed order checks."""

from __future__ import annotations

import hashlib
import json
import re
from pathlib import Path
from typing import Any, Dict, List, Tuple

from tools.r7_w3_runtime.execution_plan import inspect_execution_registry

from .authority import ROOT, W4_PROOF_IDS


W4_STATE_PATH = ROOT / "docs/rebuild/r7/w4-execution-state.json"
RULES_PATH = ROOT / "proofs/r7/w4/future-execution-rules.json"


def registry_snapshot(root: Path = ROOT) -> Dict[str, Any]:
    registry = inspect_execution_registry(root)
    state = root / "docs/rebuild/r7/w3-execution-state.json"
    state_bytes = state.read_bytes() if state.is_file() else b""
    value = registry.to_dict()
    return {
        "registry": value,
        "registry_sha256": hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")).hexdigest(),
        "w3_state_path": state.relative_to(root).as_posix(),
        "w3_state_bytes": len(state_bytes),
        "w3_state_sha256": hashlib.sha256(state_bytes).hexdigest() if state_bytes else "",
    }


def allocation_issues(root: Path = ROOT) -> Tuple[str, ...]:
    issues = []
    registry = inspect_execution_registry(root)
    if registry.max_run_number != 65 or registry.max_evidence_number != 65:
        issues.append("issued RUN/EVID high-water is not exactly 0065")
    if len(registry.run_ids) != 65 or len(registry.evidence_ids) != 65:
        issues.append("issued RUN/EVID identity count is not exactly 65")
    state_path = root / "docs/rebuild/r7/w4-execution-state.json"
    if state_path.is_file():
        issues.append("W4 execution state exists before execution authorization")
    for run_id in registry.run_ids:
        match = re.fullmatch(r"PRD07-RUN-(\d{4})", run_id)
        if match and int(match.group(1)) >= 66:
            issues.append("post-0065 RUN identity is already issued: " + run_id)
    for evidence_id in registry.evidence_ids:
        match = re.fullmatch(r"PRD07-EVID-(\d{4})", evidence_id)
        if match and int(match.group(1)) >= 66:
            issues.append("post-0065 EVID identity is already issued: " + evidence_id)
    evidence_root = root / "docs/rebuild/r7/execution-evidence"
    if evidence_root.is_dir():
        for path in evidence_root.iterdir():
            match = re.fullmatch(r"PRD07-RUN-(\d{4})", path.name)
            if path.is_dir() and match and int(match.group(1)) >= 66:
                issues.append("post-0065 evidence-pack path exists: " + path.name)
    return tuple(sorted(set(issues)))


def preview_execution_plan(root: Path = ROOT) -> List[Dict[str, Any]]:
    issues = allocation_issues(root)
    if issues:
        raise ValueError("W4 identity preview refused: " + "; ".join(issues))
    return [
        {
            "order": index + 1,
            "proof_id": proof_id,
            "run_id": "PRD07-RUN-{0:04d}".format(66 + index),
            "evidence_id": "PRD07-EVID-{0:04d}".format(66 + index),
            "identity_state": "PREVIEW-NOT-ALLOCATED",
            "reserved": False,
            "burned": False,
            "registry_entry_created": False,
            "evidence_pack_created": False,
            "execution_timestamp_created": False,
        }
        for index, proof_id in enumerate(W4_PROOF_IDS)
    ]


def future_rules() -> Dict[str, Any]:
    value = json.loads(RULES_PATH.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError("future W4 allocation rules must be an object")
    return value


def future_rule_issues() -> Tuple[str, ...]:
    issues = []
    value = future_rules()
    if value.get("schema_version") != "prd07-w4-future-execution-rules-v1":
        issues.append("future execution rules schema differs")
    if value.get("proof_order") != list(W4_PROOF_IDS):
        issues.append("future execution proof order differs")
    if value.get("first_possible_sequence") != 66:
        issues.append("future first sequence is not 0066")
    if value.get("current_authorization") != "READINESS-ONLY-NO-EXECUTION-NO-ALLOCATION":
        issues.append("current rules authorization is not closed")
    if value.get("allocation_mode") != "JUST-IN-TIME-ONE-PAIR-AFTER-FULL-REVALIDATION":
        issues.append("future allocation mode is not fail-closed just-in-time")
    if value.get("preview_state") != "PREVIEW-NOT-ALLOCATED":
        issues.append("future preview label differs")
    if value.get("batch_reservation_permitted") is not False:
        issues.append("future rules permit batch reservation")
    if value.get("identity_reuse_permitted") is not False:
        issues.append("future rules permit identity reuse")
    return tuple(sorted(set(issues)))
