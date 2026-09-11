"""Governed pending human-review records for W4 proofs 50, 51, and 53."""

from __future__ import annotations

import copy
import json
import re
from pathlib import Path
from typing import Any, Dict, Mapping, Tuple


CRITERIA = {
    "PRD04-PROOF-50": (
        ("HANDOFF-EDITABILITY", "Can the governed editable source be continued without an undocumented manual exception?"),
        ("RUNTIME-SEMANTICS", "Does the baked artifact communicate the intended semantic role in the runtime capture?"),
        ("PROVENANCE-BINDING", "Are source provenance and canonical binding understandable and traceable?"),
        ("DEFECT-AMBIGUITY", "Are visible defects, ambiguities, or handoff blockers completely recorded?"),
    ),
    "PRD04-PROOF-51": (
        ("TASK-COMPLETION", "Does each masked source complete the same assigned task?"),
        ("EDITABILITY", "Can each masked source be edited under the same canonical workflow?"),
        ("SEMANTIC-ERRORS", "What semantic errors are present in each masked source and its baked result?"),
        ("EXCEPTION-BURDEN", "What manual exceptions or bypasses are required for each masked source?"),
        ("PARITY-JUDGEMENT", "Are the masked sources equivalent, materially different, or not judgeable on the canonical dimensions?"),
    ),
    "PRD04-PROOF-53": (
        ("READABILITY", "Are required labels, state cues, and text readable in this renderer/profile lane?"),
        ("PRESENTATION-INTEGRITY", "Are required presentation semantics visible without clipping, corruption, or misleading substitution?"),
        ("TASK-USABILITY", "Can the canonical review tasks be completed from the presented lane?"),
        ("SUPPORT-BLOCKERS", "Are all lane-specific defects and support blockers recorded?"),
    ),
}


def review_template(proof_id: str) -> Dict[str, Any]:
    if proof_id not in CRITERIA:
        raise ValueError("human-review template is not governed for " + proof_id)
    value: Dict[str, Any] = {
        "schema_version": "prd07-w4-human-review-v1",
        "proof_id": proof_id,
        "status": "PENDING-HUMAN-REVIEW",
        "review_lifecycle_id": None,
        "identity_binding": {"source_revision": None, "build_identity": None, "fixture_identities": []},
        "reviewer": {
            "pseudonymous_reviewer_id": None,
            "role_id": None,
            "unnecessary_personal_data": "NOT-COLLECTED",
            "independence_declaration": None,
        },
        "asset_class": None,
        "evidence_references": [],
        "criteria": [
            {
                "criterion_id": criterion_id,
                "prompt": prompt,
                "observed_result": None,
                "evidence_references": [],
                "defects_or_ambiguities": [],
            }
            for criterion_id, prompt in CRITERIA[proof_id]
        ],
        "overall_defects_or_ambiguities": [],
        "judgement": "PENDING",
        "attestation": {
            "statement": "I performed the recorded human review against the bound sources, build, fixtures, criteria, and evidence.",
            "signed_by": None,
            "signed_at_utc": None,
        },
        "proof_observation_created": False,
        "identity_allocation_started": False,
    }
    if proof_id == "PRD04-PROOF-51":
        value.update(
            {
                "masked_sources": ["SOURCE-A", "SOURCE-B"],
                "reviewer_can_see_source_origin": False,
                "unmasking_policy": "SEPARATE-ADJUDICATOR-REQUIRED",
                "origin_mapping_reference": None,
                "adjudication": {
                    "status": "PENDING-SEPARATE-ADJUDICATION",
                    "adjudicator_role_id": None,
                    "unmasked_after_review_attestation": False,
                    "result": None,
                },
            }
        )
    if proof_id == "PRD04-PROOF-53":
        value["renderer_lanes"] = [
            {"profile_id": "profile-forward-plus", "renderer": "forward_plus", "status": "PENDING-HUMAN-REVIEW", "support_claim": "NOT-MADE"},
            {"profile_id": "profile-mobile", "renderer": "mobile", "status": "PENDING-HUMAN-REVIEW", "support_claim": "NOT-MADE"},
            {"profile_id": "profile-compat", "renderer": "gl_compatibility", "status": "PENDING-HUMAN-REVIEW", "support_claim": "NOT-MADE"},
        ]
    return value


def _is_sha(value: Any, length: int) -> bool:
    return isinstance(value, str) and re.fullmatch(r"[0-9a-f]{%d}" % length, value) is not None


def review_issues(value: Mapping[str, Any]) -> Tuple[str, ...]:
    issues = []
    proof_id = value.get("proof_id")
    if value.get("schema_version") != "prd07-w4-human-review-v1":
        issues.append("review schema version differs")
    if proof_id not in CRITERIA:
        issues.append("review proof is not governed")
        return tuple(issues)
    criteria = value.get("criteria")
    expected_ids = [row[0] for row in CRITERIA[str(proof_id)]]
    actual_ids = [row.get("criterion_id") for row in criteria] if isinstance(criteria, list) and all(isinstance(row, Mapping) for row in criteria) else []
    if actual_ids != expected_ids:
        issues.append("review criteria differ from canonical template")
    if value.get("proof_observation_created") is not False:
        issues.append("review template must not create a proof observation")
    if value.get("identity_allocation_started") is not False:
        issues.append("review template must not start identity allocation")
    if proof_id == "PRD04-PROOF-51":
        if value.get("masked_sources") != ["SOURCE-A", "SOURCE-B"] or value.get("reviewer_can_see_source_origin") is not False:
            issues.append("parity review is not masked")
        if value.get("unmasking_policy") != "SEPARATE-ADJUDICATOR-REQUIRED":
            issues.append("parity review lacks separate adjudication")
    if proof_id == "PRD04-PROOF-53":
        lanes = value.get("renderer_lanes")
        if not isinstance(lanes, list) or len(lanes) != 3 or any(row.get("support_claim") != "NOT-MADE" for row in lanes if isinstance(row, Mapping)):
            issues.append("renderer review lanes may not make a pending support claim")

    status = value.get("status")
    if status == "PENDING-HUMAN-REVIEW":
        if value.get("judgement") != "PENDING":
            issues.append("pending review must have PENDING judgement")
        attestation = value.get("attestation", {})
        if not isinstance(attestation, Mapping) or attestation.get("signed_by") is not None or attestation.get("signed_at_utc") is not None:
            issues.append("pending review must remain unsigned")
        return tuple(issues)
    if status != "COMPLETE":
        issues.append("review status is invalid")
        return tuple(issues)

    identity = value.get("identity_binding", {})
    if not isinstance(identity, Mapping) or not _is_sha(identity.get("source_revision"), 40) or not _is_sha(identity.get("build_identity"), 64):
        issues.append("completed review lacks exact source/build identity")
    fixtures = identity.get("fixture_identities", []) if isinstance(identity, Mapping) else []
    if not isinstance(fixtures, list) or not fixtures or any(not isinstance(row, Mapping) or not _is_sha(row.get("sha256"), 64) for row in fixtures):
        issues.append("completed review lacks exact fixture identities")
    reviewer = value.get("reviewer", {})
    if not isinstance(reviewer, Mapping) or not reviewer.get("pseudonymous_reviewer_id") or not reviewer.get("role_id") or reviewer.get("independence_declaration") is not True:
        issues.append("completed review lacks auditable reviewer role/identity")
    if not value.get("review_lifecycle_id"):
        issues.append("completed review lacks governed lifecycle identity")
    if not isinstance(value.get("evidence_references"), list) or not value.get("evidence_references"):
        issues.append("completed review lacks evidence references")
    if not isinstance(criteria, list) or any(row.get("observed_result") in (None, "") for row in criteria if isinstance(row, Mapping)):
        issues.append("completed review lacks per-criterion observations")
    if value.get("judgement") not in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}:
        issues.append("completed review lacks canonical judgement")
    attestation = value.get("attestation", {})
    if not isinstance(attestation, Mapping) or not attestation.get("signed_by") or not attestation.get("signed_at_utc"):
        issues.append("completed review lacks reviewer attestation")
    return tuple(issues)


def all_review_templates() -> Dict[str, Dict[str, Any]]:
    return {proof_id: copy.deepcopy(review_template(proof_id)) for proof_id in CRITERIA}


def review_schema() -> Dict[str, Any]:
    """Return the portable record schema; completion law is enforced by review_issues."""
    return {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$id": "https://leyforge.local/schemas/prd07-w4-human-review-v1.json",
        "title": "Leyforge W4 governed human review",
        "type": "object",
        "required": [
            "schema_version", "proof_id", "status", "identity_binding", "reviewer",
            "criteria", "judgement", "attestation", "proof_observation_created",
            "identity_allocation_started",
        ],
        "properties": {
            "schema_version": {"const": "prd07-w4-human-review-v1"},
            "proof_id": {"enum": sorted(CRITERIA)},
            "status": {"enum": ["PENDING-HUMAN-REVIEW", "COMPLETE"]},
            "judgement": {"enum": ["PENDING", "PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"]},
            "proof_observation_created": {"const": False},
            "identity_allocation_started": {"const": False},
            "identity_binding": {
                "type": "object",
                "required": ["source_revision", "build_identity", "fixture_identities"],
            },
            "reviewer": {
                "type": "object",
                "required": ["pseudonymous_reviewer_id", "role_id", "unnecessary_personal_data", "independence_declaration"],
            },
            "criteria": {"type": "array", "minItems": 1},
            "attestation": {"type": "object", "required": ["statement", "signed_by", "signed_at_utc"]},
        },
        "additionalProperties": True,
        "$comment": "Conditional completion/attestation, masked parity, exact identity and renderer support-claim law is enforced by tools.r7_w4_repair.human_review.review_issues.",
    }


def write_review_package(root: Path) -> Tuple[Path, ...]:
    root.mkdir(parents=True, exist_ok=True)
    paths = []
    schema_path = root / "human-review.schema.json"
    schema_path.write_text(json.dumps(review_schema(), indent=2, sort_keys=True) + "\n", encoding="utf-8")
    paths.append(schema_path)
    for proof_id, value in all_review_templates().items():
        path = root / (proof_id.lower().replace("prd04-proof-", "proof-") + "-pending.json")
        path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        paths.append(path)
    return tuple(paths)
