"""Governed W4 human-review templates, completion law, and execution ingestion.

The validator deliberately separates structural test fixtures from production
human reviews.  A synthetic record may exercise completion law, but the
execution ingestor accepts only an exact, signed production-human record at the
one governed path for the entered proof.
"""

from __future__ import annotations

import copy
import hashlib
import json
import re
from datetime import datetime
from pathlib import Path, PurePosixPath
from typing import Any, Dict, Iterable, List, Mapping, Sequence, Tuple

from tools.r7_w4_execution.contracts import ROOT, fixture_identity, proof_contracts_by_id


SCHEMA_VERSION = "prd07-w4-human-review-v2"
ORIGIN_SCHEMA_VERSION = "prd07-w4-proof-51-origin-mapping-v2"
REVIEW_ROOT = ROOT / "proofs/r7/w4_human_review"
REVIEW_FILENAMES = {
    "PRD04-PROOF-50": "proof-50-pending.json",
    "PRD04-PROOF-51": "proof-51-pending.json",
    "PRD04-PROOF-53": "proof-53-pending.json",
}
ORIGIN_MAPPING_FILENAME = "proof-51-origin-mapping-pending.json"

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

JUDGEMENTS = {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}
PRODUCTION_PURPOSE = "PRODUCTION-HUMAN-REVIEW"
SYNTHETIC_PURPOSE = "SYNTHETIC-VALIDATOR-TEST"
ATTESTATION_STATEMENT = (
    "I performed the recorded human review against the bound sources, build, "
    "fixtures, environment, criteria, and evidence."
)


def _canonical(value: Any) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True) + "\n").encode("utf-8")


def _digest(value: Any) -> str:
    return hashlib.sha256(_canonical(value)).hexdigest()


def _load(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError("record is not a JSON object")
    return value


def _source_packages() -> List[Dict[str, Any]]:
    path = ROOT / "proofs/r7/w4/fixture-07/source-packages.json"
    return [dict(row) for row in _load(path)["packages"]]


def required_asset_classes() -> Tuple[str, ...]:
    return tuple(sorted({str(row["asset_class"]) for row in _source_packages()}))


def _asset_sources() -> Dict[str, List[str]]:
    result: Dict[str, List[str]] = {}
    for row in _source_packages():
        result.setdefault(str(row["asset_class"]), []).append(str(row["source_id"]))
    return {key: sorted(value) for key, value in sorted(result.items())}


def _asset_class_identity() -> str:
    return _digest({"required_asset_classes": list(required_asset_classes()), "source_ids": _asset_sources()})


def _paired_tasks() -> List[Dict[str, Any]]:
    groups: Dict[str, List[Dict[str, Any]]] = {}
    for row in _source_packages():
        if row.get("matched_task"):
            groups.setdefault(str(row["matched_task"]), []).append(row)
    result = []
    for task_id, rows in sorted(groups.items()):
        ordered = sorted(rows, key=lambda row: str(row["source_id"]))
        result.append(
            {
                "task_id": task_id,
                "asset_class": str(ordered[0]["asset_class"]),
                "source_mapping": {
                    "SOURCE-A": str(ordered[0]["source_id"]),
                    "SOURCE-B": str(ordered[1]["source_id"]),
                },
            }
        )
    return result


def _paired_task_identity() -> str:
    return _digest(_paired_tasks())


def _renderer_lanes() -> List[Dict[str, str]]:
    presentation = _load(ROOT / "proofs/r7/w4/fixture-08/presentation-cases.json")
    methods = {"Forward+": "forward_plus", "Mobile": "mobile", "Compatibility": "gl_compatibility"}
    return [
        {
            "profile_id": str(row["profile_id"]),
            "renderer": str(row["renderer"]),
            "renderer_argument": methods[str(row["renderer"])],
            "candidate_claim_state": str(row["claim_state"]),
        }
        for row in presentation["renderer_profiles"]
    ]


def _renderer_lane_identity() -> str:
    return _digest(_renderer_lanes())


def _criteria_template(proof_id: str, *, include_parity: bool = True) -> List[Dict[str, Any]]:
    rows = CRITERIA[proof_id]
    if proof_id == "PRD04-PROOF-51" and not include_parity:
        rows = rows[:-1]
    return [
        {
            "criterion_id": criterion_id,
            "prompt": prompt,
            "observed_result": None,
            "judgement": "PENDING",
            "evidence_references": [],
            "defects_or_ambiguities": [],
        }
        for criterion_id, prompt in rows
    ]


def _common_template(proof_id: str) -> Dict[str, Any]:
    contract = proof_contracts_by_id()[proof_id]
    return {
        "schema_version": SCHEMA_VERSION,
        "proof_id": proof_id,
        "status": "PENDING-HUMAN-REVIEW",
        "review_lifecycle_id": None,
        "review_purpose": "UNASSIGNED",
        "identity_binding": {
            "source_revision": None,
            "build_identity": None,
            "artifact_sha256": None,
            "fixture_identities": fixture_identity(contract["requirements"]["fixture_identities"]),
            "environment_identity": None,
        },
        "reviewer": {
            "reviewer_kind": None,
            "pseudonymous_reviewer_id": None,
            "role_id": None,
            "unnecessary_personal_data": "NOT-COLLECTED",
            "independence_declaration": None,
        },
        "evidence_references": [],
        "criteria": _criteria_template(proof_id),
        "overall_defects_or_ambiguities": [],
        "judgement": "PENDING",
        "attestation": {
            "statement": ATTESTATION_STATEMENT,
            "signature_state": "UNSIGNED",
            "signed_by": None,
            "signed_at_utc": None,
        },
        "proof_observation_created": False,
        "identity_allocation_started": False,
    }


def review_template(proof_id: str) -> Dict[str, Any]:
    if proof_id not in CRITERIA:
        raise ValueError("human-review template is not governed for " + proof_id)
    value = _common_template(proof_id)
    if proof_id == "PRD04-PROOF-50":
        sources = _asset_sources()
        value.update(
            {
                "asset_class_identity": _asset_class_identity(),
                "required_asset_classes": list(required_asset_classes()),
                "asset_class_reviews": [
                    {
                        "asset_class": asset_class,
                        "source_ids": source_ids,
                        "criteria": _criteria_template(proof_id),
                        "defects_or_ambiguities": [],
                        "judgement": "PENDING",
                    }
                    for asset_class, source_ids in sources.items()
                ],
            }
        )
    elif proof_id == "PRD04-PROOF-51":
        value.update(
            {
                "paired_task_identity": _paired_task_identity(),
                "masked_sources": ["SOURCE-A", "SOURCE-B"],
                "reviewer_can_see_source_origin": False,
                "unmasking_policy": "SEPARATE-ADJUDICATOR-POST-ATTESTATION",
                "origin_mapping_reference": None,
                "paired_task_reviews": [
                    {
                        "task_id": row["task_id"],
                        "asset_class": row["asset_class"],
                        "masked_source_reviews": [
                            {
                                "source_label": label,
                                "criteria": _criteria_template(proof_id, include_parity=False),
                                "defects_or_ambiguities": [],
                                "judgement": "PENDING",
                            }
                            for label in ("SOURCE-A", "SOURCE-B")
                        ],
                        "comparison_observation": None,
                        "comparison_evidence_references": [],
                        "comparison_judgement": "PENDING",
                        "revealed_source_ids": None,
                    }
                    for row in _paired_tasks()
                ],
                "adjudication": {
                    "status": "PENDING-SEPARATE-ADJUDICATION",
                    "adjudicator_role_id": None,
                    "adjudicator_pseudonymous_id": None,
                    "reviewer_attestation_sha256": None,
                    "origin_mapping_sha256": None,
                    "unmasked_after_review_attestation": False,
                    "unmasked_at_utc": None,
                    "result": None,
                    "evidence_references": [],
                },
            }
        )
    else:
        value.update(
            {
                "renderer_lane_identity": _renderer_lane_identity(),
                "required_renderer_lanes": _renderer_lanes(),
                "renderer_lane_reviews": [
                    {
                        **row,
                        "criteria": _criteria_template(proof_id),
                        "evidence_references": [],
                        "defects_or_ambiguities": [],
                        "support_disposition": "UNDETERMINED",
                        "judgement": "PENDING",
                    }
                    for row in _renderer_lanes()
                ],
            }
        )
    return value


def origin_mapping_template() -> Dict[str, Any]:
    return {
        "schema_version": ORIGIN_SCHEMA_VERSION,
        "proof_id": "PRD04-PROOF-51",
        "status": "PENDING-SEPARATE-ADJUDICATION",
        "reviewer_blinded_during_review": True,
        "unmasked_after_review_attestation": False,
        "review_attestation_sha256": None,
        "mappings": [
            {"task_id": row["task_id"], "SOURCE-A": None, "SOURCE-B": None}
            for row in _paired_tasks()
        ],
        "adjudicator": {
            "pseudonymous_adjudicator_id": None,
            "role_id": None,
            "signature_state": "UNSIGNED",
            "signed_at_utc": None,
        },
        "proof_observation_created": False,
        "identity_allocation_started": False,
    }


def _is_sha(value: Any, length: int) -> bool:
    return isinstance(value, str) and re.fullmatch(r"[0-9a-f]{%d}" % length, value) is not None


def _is_utc(value: Any) -> bool:
    if not isinstance(value, str) or not value.endswith("Z"):
        return False
    try:
        datetime.fromisoformat(value[:-1] + "+00:00")
        return True
    except ValueError:
        return False


def _safe_relative(value: Any) -> bool:
    if not isinstance(value, str) or not value or "\\" in value or ":" in value:
        return False
    path = PurePosixPath(value)
    return not path.is_absolute() and ".." not in path.parts and "." not in path.parts and path.as_posix() == value


def _reference_issues(rows: Any, label: str, *, required: bool = True) -> List[str]:
    issues: List[str] = []
    if not isinstance(rows, list) or (required and not rows):
        return [label + " lacks evidence references"]
    seen = set()
    for index, row in enumerate(rows):
        prefix = "%s[%d]" % (label, index)
        if not isinstance(row, Mapping):
            issues.append(prefix + " is not an object")
            continue
        reference_id = row.get("reference_id")
        if not isinstance(reference_id, str) or not reference_id:
            issues.append(prefix + " lacks reference_id")
        elif reference_id in seen:
            issues.append(label + " duplicates reference_id " + reference_id)
        else:
            seen.add(reference_id)
        if row.get("scope") not in {"RUN-ROOT", "REPOSITORY"}:
            issues.append(prefix + " has invalid scope")
        if not isinstance(row.get("kind"), str) or not row.get("kind"):
            issues.append(prefix + " lacks kind")
        if not _safe_relative(row.get("path")):
            issues.append(prefix + " has unsafe path")
        if not _is_sha(row.get("sha256"), 64):
            issues.append(prefix + " lacks exact SHA-256")
    return issues


def _criteria_issues(rows: Any, proof_id: str, label: str, *, include_parity: bool = True, complete: bool) -> List[str]:
    expected = list(CRITERIA[proof_id])
    if proof_id == "PRD04-PROOF-51" and not include_parity:
        expected = expected[:-1]
    if not isinstance(rows, list) or not all(isinstance(row, Mapping) for row in rows):
        return [label + " criteria are absent or malformed"]
    actual = [(row.get("criterion_id"), row.get("prompt")) for row in rows]
    issues: List[str] = []
    if actual != expected:
        issues.append(label + " criteria differ from the canonical template")
        return issues
    for row in rows:
        criterion = str(row["criterion_id"])
        if not isinstance(row.get("defects_or_ambiguities"), list):
            issues.append(label + " " + criterion + " defects/ambiguities are malformed")
        if complete:
            if not isinstance(row.get("observed_result"), str) or not row.get("observed_result").strip():
                issues.append(label + " " + criterion + " lacks an observed result")
            if row.get("judgement") not in JUDGEMENTS:
                issues.append(label + " " + criterion + " lacks an explicit judgement")
            issues.extend(_reference_issues(row.get("evidence_references"), label + " " + criterion))
        elif row.get("judgement") != "PENDING":
            issues.append(label + " pending criterion has a non-PENDING judgement: " + criterion)
    return issues


def _worst(judgements: Iterable[str]) -> str:
    values = list(judgements)
    if any(value == "FAIL-OBSERVED" for value in values):
        return "FAIL-OBSERVED"
    if any(value == "INCONCLUSIVE" for value in values):
        return "INCONCLUSIVE"
    return "PASS-OBSERVED"


def _criteria_judgement(rows: Any) -> str:
    if not isinstance(rows, list):
        return "INCONCLUSIVE"
    values = [str(row.get("judgement")) for row in rows if isinstance(row, Mapping)]
    return _worst(values) if len(values) == len(rows) and all(value in JUDGEMENTS for value in values) else "INCONCLUSIVE"


def _proof_50_issues(value: Mapping[str, Any], complete: bool) -> Tuple[List[str], str]:
    issues: List[str] = []
    expected_classes = list(required_asset_classes())
    if value.get("asset_class_identity") != _asset_class_identity():
        issues.append("proof-50 asset-class identity differs")
    if value.get("required_asset_classes") != expected_classes:
        issues.append("proof-50 required asset-class coverage differs")
    rows = value.get("asset_class_reviews")
    expected_sources = _asset_sources()
    if not isinstance(rows, list) or [row.get("asset_class") for row in rows if isinstance(row, Mapping)] != expected_classes:
        return issues + ["proof-50 asset-class review coverage differs"], "INCONCLUSIVE"
    judgements = []
    for row in rows:
        asset_class = str(row.get("asset_class"))
        label = "proof-50 asset class " + asset_class
        if row.get("source_ids") != expected_sources[asset_class]:
            issues.append(label + " source identity differs")
        if not isinstance(row.get("defects_or_ambiguities"), list):
            issues.append(label + " defects/ambiguities are malformed")
        issues.extend(_criteria_issues(row.get("criteria"), "PRD04-PROOF-50", label, complete=complete))
        if complete:
            if row.get("judgement") not in JUDGEMENTS:
                issues.append(label + " lacks an explicit judgement")
            else:
                if row.get("judgement") != _criteria_judgement(row.get("criteria")):
                    issues.append(label + " judgement is not derived from its criteria")
                judgements.append(str(row["judgement"]))
        elif row.get("judgement") != "PENDING":
            issues.append(label + " pending judgement differs")
    return issues, _worst(judgements) if complete and len(judgements) == len(rows) else "INCONCLUSIVE"


def _proof_51_issues(value: Mapping[str, Any], complete: bool) -> Tuple[List[str], str]:
    issues: List[str] = []
    if value.get("paired_task_identity") != _paired_task_identity():
        issues.append("proof-51 paired task identity differs")
    if value.get("masked_sources") != ["SOURCE-A", "SOURCE-B"] or value.get("reviewer_can_see_source_origin") is not False:
        issues.append("proof-51 review is not masked")
    if value.get("unmasking_policy") != "SEPARATE-ADJUDICATOR-POST-ATTESTATION":
        issues.append("proof-51 unmasking policy differs")
    rows = value.get("paired_task_reviews")
    expected = _paired_tasks()
    if not isinstance(rows, list) or [row.get("task_id") for row in rows if isinstance(row, Mapping)] != [row["task_id"] for row in expected]:
        return issues + ["proof-51 paired task coverage differs"], "INCONCLUSIVE"
    judgements = []
    for row, expected_row in zip(rows, expected):
        label = "proof-51 task " + expected_row["task_id"]
        if row.get("asset_class") != expected_row["asset_class"]:
            issues.append(label + " asset-class identity differs")
        sources = row.get("masked_source_reviews")
        if not isinstance(sources, list) or [source.get("source_label") for source in sources if isinstance(source, Mapping)] != ["SOURCE-A", "SOURCE-B"]:
            issues.append(label + " masked-source coverage differs")
            continue
        source_judgements = []
        for source in sources:
            source_label = label + " " + str(source.get("source_label"))
            if not isinstance(source.get("defects_or_ambiguities"), list):
                issues.append(source_label + " defects/ambiguities are malformed")
            issues.extend(_criteria_issues(source.get("criteria"), "PRD04-PROOF-51", source_label, include_parity=False, complete=complete))
            if complete and source.get("judgement") not in JUDGEMENTS:
                issues.append(source_label + " lacks an explicit judgement")
            elif complete:
                if source.get("judgement") != _criteria_judgement(source.get("criteria")):
                    issues.append(source_label + " judgement is not derived from its criteria")
                source_judgements.append(str(source["judgement"]))
            elif not complete and source.get("judgement") != "PENDING":
                issues.append(source_label + " pending judgement differs")
        if complete:
            if not isinstance(row.get("comparison_observation"), str) or not row.get("comparison_observation").strip():
                issues.append(label + " lacks comparison observation")
            issues.extend(_reference_issues(row.get("comparison_evidence_references"), label + " comparison"))
            if row.get("comparison_judgement") not in JUDGEMENTS:
                issues.append(label + " lacks comparison judgement")
            else:
                judgements.append(_worst([*source_judgements, str(row["comparison_judgement"])]))
            if row.get("revealed_source_ids") != expected_row["source_mapping"]:
                issues.append(label + " post-attestation source reveal differs")
        elif row.get("comparison_judgement") != "PENDING" or row.get("revealed_source_ids") is not None:
            issues.append(label + " pending comparison/reveal differs")
    if complete:
        origin = value.get("origin_mapping_reference")
        issues.extend(_reference_issues([origin] if isinstance(origin, Mapping) else [], "proof-51 origin mapping"))
        if isinstance(origin, Mapping) and (
            origin.get("scope") != "REPOSITORY" or origin.get("path") != "proofs/r7/w4_human_review/" + ORIGIN_MAPPING_FILENAME
        ):
            issues.append("proof-51 origin mapping reference is not the governed exact path")
        adjudication = value.get("adjudication")
        attestation = value.get("attestation")
        if not isinstance(adjudication, Mapping):
            issues.append("proof-51 adjudication is absent")
        else:
            if adjudication.get("status") != "COMPLETE-SEPARATE-ADJUDICATION":
                issues.append("proof-51 separate adjudication is incomplete")
            if not adjudication.get("adjudicator_role_id") or not adjudication.get("adjudicator_pseudonymous_id"):
                issues.append("proof-51 adjudicator identity/role is absent")
            if adjudication.get("unmasked_after_review_attestation") is not True or not _is_utc(adjudication.get("unmasked_at_utc")):
                issues.append("proof-51 lawful post-attestation unmasking is absent")
            if not isinstance(attestation, Mapping) or adjudication.get("reviewer_attestation_sha256") != _digest(attestation):
                issues.append("proof-51 adjudication is not bound to reviewer attestation")
            if not isinstance(origin, Mapping) or adjudication.get("origin_mapping_sha256") != origin.get("sha256"):
                issues.append("proof-51 adjudication is not bound to origin mapping")
            if adjudication.get("result") not in JUDGEMENTS:
                issues.append("proof-51 adjudication lacks explicit result")
            issues.extend(_reference_issues(adjudication.get("evidence_references"), "proof-51 adjudication"))
            signed = attestation.get("signed_at_utc") if isinstance(attestation, Mapping) else None
            unmasked = adjudication.get("unmasked_at_utc")
            if _is_utc(signed) and _is_utc(unmasked) and str(unmasked) < str(signed):
                issues.append("proof-51 origin reveal predates reviewer attestation")
    else:
        if value.get("origin_mapping_reference") is not None:
            issues.append("pending proof-51 review must not bind an origin mapping")
        adjudication = value.get("adjudication", {})
        if not isinstance(adjudication, Mapping) or adjudication.get("status") != "PENDING-SEPARATE-ADJUDICATION" or adjudication.get("unmasked_after_review_attestation") is not False:
            issues.append("pending proof-51 adjudication state differs")
    derived = _worst(judgements) if complete and len(judgements) == len(rows) else "INCONCLUSIVE"
    if complete and isinstance(value.get("adjudication"), Mapping) and value["adjudication"].get("result") != derived:
        issues.append("proof-51 adjudication result is not derived from paired source/task reviews")
    return issues, derived


def _proof_53_issues(value: Mapping[str, Any], complete: bool) -> Tuple[List[str], str]:
    issues: List[str] = []
    expected = _renderer_lanes()
    if value.get("renderer_lane_identity") != _renderer_lane_identity():
        issues.append("proof-53 renderer-lane identity differs")
    if value.get("required_renderer_lanes") != expected:
        issues.append("proof-53 required renderer-lane set differs")
    rows = value.get("renderer_lane_reviews")
    if not isinstance(rows, list) or [row.get("profile_id") for row in rows if isinstance(row, Mapping)] != [row["profile_id"] for row in expected]:
        return issues + ["proof-53 renderer-lane review coverage differs"], "INCONCLUSIVE"
    claimed_pass = 0
    claimed_failure = False
    inconclusive = False
    for row, expected_row in zip(rows, expected):
        label = "proof-53 lane " + expected_row["profile_id"]
        for key, expected_value in expected_row.items():
            if row.get(key) != expected_value:
                issues.append(label + " " + key + " differs")
        issues.extend(_criteria_issues(row.get("criteria"), "PRD04-PROOF-53", label, complete=complete))
        if not isinstance(row.get("defects_or_ambiguities"), list):
            issues.append(label + " defects/ambiguities are malformed")
        if complete:
            issues.extend(_reference_issues(row.get("evidence_references"), label))
            support = row.get("support_disposition")
            judgement = row.get("judgement")
            if support not in {"CLAIMED-SUPPORTED", "CLAIMED-SUPPORTED-WITH-APPROVED-FALLBACK", "UNSUPPORTED-EXPLICIT", "UNDETERMINED"}:
                issues.append(label + " support disposition is invalid")
            if judgement not in JUDGEMENTS:
                issues.append(label + " lacks an explicit judgement")
            elif judgement != _criteria_judgement(row.get("criteria")):
                issues.append(label + " judgement is not derived from lane criteria")
            elif support == "UNSUPPORTED-EXPLICIT" and judgement != "FAIL-OBSERVED":
                issues.append(label + " explicit unsupported disposition is inconsistent")
            elif support == "UNDETERMINED" and judgement != "INCONCLUSIVE":
                issues.append(label + " undetermined support disposition is inconsistent")
            elif support in {"CLAIMED-SUPPORTED", "CLAIMED-SUPPORTED-WITH-APPROVED-FALLBACK"}:
                if judgement == "PASS-OBSERVED":
                    claimed_pass += 1
                elif judgement == "FAIL-OBSERVED":
                    claimed_failure = True
                else:
                    inconclusive = True
            if judgement == "INCONCLUSIVE":
                inconclusive = True
        elif row.get("support_disposition") != "UNDETERMINED" or row.get("judgement") != "PENDING":
            issues.append(label + " pending support/judgement differs")
    if not complete:
        derived = "INCONCLUSIVE"
    elif claimed_failure or (claimed_pass == 0 and not inconclusive):
        derived = "FAIL-OBSERVED"
    elif inconclusive:
        derived = "INCONCLUSIVE"
    else:
        derived = "PASS-OBSERVED"
    return issues, derived


def review_issues(value: Mapping[str, Any]) -> Tuple[str, ...]:
    issues: List[str] = []
    proof_id = value.get("proof_id")
    if value.get("schema_version") != SCHEMA_VERSION:
        issues.append("review schema version differs")
    if proof_id not in CRITERIA:
        issues.append("review proof is not governed")
        return tuple(sorted(set(issues)))
    proof_id = str(proof_id)
    if value.get("proof_observation_created") is not False:
        issues.append("review record must not create a proof observation")
    if value.get("identity_allocation_started") is not False:
        issues.append("review record must not start identity allocation")
    if not isinstance(value.get("overall_defects_or_ambiguities"), list):
        issues.append("review overall defects/ambiguities are malformed")

    status = value.get("status")
    complete = status == "COMPLETE"
    if status not in {"PENDING-HUMAN-REVIEW", "COMPLETE"}:
        issues.append("review status is invalid")
    issues.extend(_criteria_issues(value.get("criteria"), proof_id, proof_id + " overall", complete=complete))
    if proof_id == "PRD04-PROOF-50":
        specific, derived = _proof_50_issues(value, complete)
    elif proof_id == "PRD04-PROOF-51":
        specific, derived = _proof_51_issues(value, complete)
    else:
        specific, derived = _proof_53_issues(value, complete)
    issues.extend(specific)

    attestation = value.get("attestation")
    reviewer = value.get("reviewer")
    if not complete:
        if value.get("judgement") != "PENDING":
            issues.append("pending review must have PENDING judgement")
        if value.get("review_lifecycle_id") is not None or value.get("review_purpose") != "UNASSIGNED":
            issues.append("pending review must not claim lifecycle/purpose completion")
        if not isinstance(attestation, Mapping) or attestation.get("signature_state") != "UNSIGNED" or attestation.get("signed_by") is not None or attestation.get("signed_at_utc") is not None:
            issues.append("pending review must remain unsigned")
        return tuple(sorted(set(issues)))

    identity = value.get("identity_binding")
    contract = proof_contracts_by_id()[proof_id]
    expected_fixtures = fixture_identity(contract["requirements"]["fixture_identities"])
    if not isinstance(identity, Mapping):
        issues.append("completed review lacks identity binding")
    else:
        if not _is_sha(identity.get("source_revision"), 40):
            issues.append("completed review lacks exact source revision")
        if not _is_sha(identity.get("build_identity"), 64) or not _is_sha(identity.get("artifact_sha256"), 64):
            issues.append("completed review lacks exact build/artifact identity")
        if identity.get("fixture_identities") != expected_fixtures:
            issues.append("completed review fixture identities differ from canonical contract")
        if not isinstance(identity.get("environment_identity"), Mapping) or not identity.get("environment_identity"):
            issues.append("completed review lacks exact environment identity")
    if not isinstance(value.get("review_lifecycle_id"), str) or not value.get("review_lifecycle_id") or re.search(r"PRD07-(?:RUN|EVID)-", str(value.get("review_lifecycle_id"))):
        issues.append("completed review lacks a non-execution review lifecycle identity")
    purpose = value.get("review_purpose")
    expected_kind = "HUMAN" if purpose == PRODUCTION_PURPOSE else "SYNTHETIC-TEST-ONLY" if purpose == SYNTHETIC_PURPOSE else None
    if expected_kind is None:
        issues.append("completed review purpose is invalid")
    if not isinstance(reviewer, Mapping) or reviewer.get("reviewer_kind") != expected_kind:
        issues.append("completed review reviewer kind differs from purpose")
    elif (
        not reviewer.get("pseudonymous_reviewer_id")
        or not reviewer.get("role_id")
        or reviewer.get("independence_declaration") is not True
        or reviewer.get("unnecessary_personal_data") != "NOT-COLLECTED"
    ):
        issues.append("completed review lacks auditable reviewer identity/role/independence")
    issues.extend(_reference_issues(value.get("evidence_references"), "completed review"))
    overall_criteria_derived = _criteria_judgement(value.get("criteria"))
    fully_derived = _worst((derived, overall_criteria_derived))
    if value.get("judgement") not in JUDGEMENTS:
        issues.append("completed review lacks canonical judgement")
    elif value.get("judgement") != fully_derived:
        issues.append("completed review overall judgement is not lawfully derived from proof-specific reviews")
    if not isinstance(attestation, Mapping):
        issues.append("completed review lacks reviewer attestation")
    else:
        signed_by = reviewer.get("pseudonymous_reviewer_id") if isinstance(reviewer, Mapping) else None
        if (
            attestation.get("statement") != ATTESTATION_STATEMENT
            or attestation.get("signature_state") != "SIGNED"
            or attestation.get("signed_by") != signed_by
            or not _is_utc(attestation.get("signed_at_utc"))
        ):
            issues.append("completed review lacks valid reviewer attestation")
    return tuple(sorted(set(issues)))


def origin_mapping_issues(value: Mapping[str, Any], review: Mapping[str, Any]) -> Tuple[str, ...]:
    issues: List[str] = []
    if value.get("schema_version") != ORIGIN_SCHEMA_VERSION or value.get("proof_id") != "PRD04-PROOF-51":
        issues.append("proof-51 origin mapping schema/proof differs")
    if value.get("proof_observation_created") is not False or value.get("identity_allocation_started") is not False:
        issues.append("proof-51 origin mapping crossed proof/allocation boundary")
    if value.get("status") != "COMPLETE-SEPARATE-ADJUDICATION":
        issues.append("proof-51 origin mapping is not complete")
    if value.get("reviewer_blinded_during_review") is not True or value.get("unmasked_after_review_attestation") is not True:
        issues.append("proof-51 origin mapping does not preserve blinded post-attestation reveal")
    attestation = review.get("attestation")
    if not isinstance(attestation, Mapping) or value.get("review_attestation_sha256") != _digest(attestation):
        issues.append("proof-51 origin mapping is not bound to reviewer attestation")
    expected = [
        {"task_id": row["task_id"], **row["source_mapping"]}
        for row in _paired_tasks()
    ]
    if value.get("mappings") != expected:
        issues.append("proof-51 origin mapping task/source identities differ")
    adjudicator = value.get("adjudicator")
    if not isinstance(adjudicator, Mapping) or (
        not adjudicator.get("pseudonymous_adjudicator_id")
        or not adjudicator.get("role_id")
        or adjudicator.get("signature_state") != "SIGNED"
        or not _is_utc(adjudicator.get("signed_at_utc"))
    ):
        issues.append("proof-51 origin mapping lacks separate adjudicator attestation")
    reviewer = review.get("reviewer", {})
    if isinstance(adjudicator, Mapping) and isinstance(reviewer, Mapping) and adjudicator.get("pseudonymous_adjudicator_id") == reviewer.get("pseudonymous_reviewer_id"):
        issues.append("proof-51 reviewer and adjudicator are not separate")
    return tuple(sorted(set(issues)))


def _all_references(value: Mapping[str, Any]) -> List[Mapping[str, Any]]:
    rows: List[Mapping[str, Any]] = []

    def add(candidate: Any) -> None:
        if isinstance(candidate, list):
            rows.extend(row for row in candidate if isinstance(row, Mapping))

    add(value.get("evidence_references"))
    for criterion in value.get("criteria", []) if isinstance(value.get("criteria"), list) else []:
        if isinstance(criterion, Mapping):
            add(criterion.get("evidence_references"))
    proof_id = value.get("proof_id")
    if proof_id == "PRD04-PROOF-50":
        for unit in value.get("asset_class_reviews", []) if isinstance(value.get("asset_class_reviews"), list) else []:
            if isinstance(unit, Mapping):
                for criterion in unit.get("criteria", []) if isinstance(unit.get("criteria"), list) else []:
                    if isinstance(criterion, Mapping):
                        add(criterion.get("evidence_references"))
    elif proof_id == "PRD04-PROOF-51":
        origin = value.get("origin_mapping_reference")
        if isinstance(origin, Mapping):
            rows.append(origin)
        for task in value.get("paired_task_reviews", []) if isinstance(value.get("paired_task_reviews"), list) else []:
            if not isinstance(task, Mapping):
                continue
            add(task.get("comparison_evidence_references"))
            for source in task.get("masked_source_reviews", []) if isinstance(task.get("masked_source_reviews"), list) else []:
                if isinstance(source, Mapping):
                    for criterion in source.get("criteria", []) if isinstance(source.get("criteria"), list) else []:
                        if isinstance(criterion, Mapping):
                            add(criterion.get("evidence_references"))
        adjudication = value.get("adjudication")
        if isinstance(adjudication, Mapping):
            add(adjudication.get("evidence_references"))
    elif proof_id == "PRD04-PROOF-53":
        for lane in value.get("renderer_lane_reviews", []) if isinstance(value.get("renderer_lane_reviews"), list) else []:
            if isinstance(lane, Mapping):
                add(lane.get("evidence_references"))
                for criterion in lane.get("criteria", []) if isinstance(lane.get("criteria"), list) else []:
                    if isinstance(criterion, Mapping):
                        add(criterion.get("evidence_references"))
    return rows


def _verify_reference(row: Mapping[str, Any], run_root: Path, repository_root: Path) -> str | None:
    base = run_root if row.get("scope") == "RUN-ROOT" else repository_root
    try:
        base = base.resolve()
        path = (base / str(row.get("path", ""))).resolve()
        path.relative_to(base)
    except (OSError, ValueError):
        return "evidence reference escapes its governed root: " + str(row.get("path", ""))
    if not path.is_file():
        return "evidence reference is missing: " + str(row.get("path", ""))
    if hashlib.sha256(path.read_bytes()).hexdigest() != row.get("sha256"):
        return "evidence reference hash differs: " + str(row.get("path", ""))
    return None


def _human_evidence_view(value: Mapping[str, Any], path: Path, state: str, issues: Sequence[str]) -> Dict[str, Any]:
    reviewer = value.get("reviewer", {})
    observer = reviewer.get("pseudonymous_reviewer_id") if isinstance(reviewer, Mapping) else None
    references = _all_references(value)
    task_scores = []
    if value.get("proof_id") == "PRD04-PROOF-50":
        task_scores = [
            {"task_id": row.get("asset_class"), "judgement": row.get("judgement")}
            for row in value.get("asset_class_reviews", []) if isinstance(row, Mapping)
        ]
    elif value.get("proof_id") == "PRD04-PROOF-51":
        task_scores = [
            {"task_id": row.get("task_id"), "judgement": row.get("comparison_judgement")}
            for row in value.get("paired_task_reviews", []) if isinstance(row, Mapping)
        ]
    elif value.get("proof_id") == "PRD04-PROOF-53":
        task_scores = [
            {"task_id": row.get("profile_id"), "judgement": row.get("judgement"), "support_disposition": row.get("support_disposition")}
            for row in value.get("renderer_lane_reviews", []) if isinstance(row, Mapping)
        ]
    capture_refs = [str(row.get("path")) for row in references if str(row.get("kind", "")).lower() in {"capture", "screenshot", "video", "runtime-capture"}]
    return {
        "required": True,
        "review_state": state,
        "validated_judgement": value.get("judgement") if state == "ACCEPTED-PRODUCTION-HUMAN" else "INCONCLUSIVE",
        "observer_ids": [observer] if observer else [],
        "task_scores": task_scores,
        "capture_refs": capture_refs,
        "disagreements": list(value.get("overall_defects_or_ambiguities", [])) if isinstance(value.get("overall_defects_or_ambiguities"), list) else [],
        "adjudication": value.get("adjudication", "NOT-APPLICABLE"),
        "review_record_identity": {
            "path": path.relative_to(ROOT).as_posix() if path.is_relative_to(ROOT) else path.name,
            "sha256": hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else None,
        },
        "review_record": copy.deepcopy(dict(value)),
        "validation_issues": list(issues),
    }


def ingest_review_for_execution(
    proof_id: str,
    source_revision: str,
    build: Mapping[str, Any],
    run_root: Path,
    *,
    review_root: Path = REVIEW_ROOT,
) -> Dict[str, Any]:
    """Load and bind one exact production-human review, or return a fail-closed gap."""
    if proof_id not in REVIEW_FILENAMES:
        raise ValueError("human-review ingestion is not governed for " + proof_id)
    path = review_root / REVIEW_FILENAMES[proof_id]
    if not path.is_file():
        return _human_evidence_view({"proof_id": proof_id}, path, "MISSING", ["governed review record is missing"])
    try:
        value = _load(path)
    except (OSError, ValueError, json.JSONDecodeError) as exc:
        return _human_evidence_view({"proof_id": proof_id}, path, "REJECTED", ["governed review record is malformed: " + str(exc)])
    structural = list(review_issues(value))
    if value.get("status") == "PENDING-HUMAN-REVIEW" and not structural:
        return _human_evidence_view(value, path, "PENDING-HUMAN-REVIEW", [])
    issues = list(structural)
    if value.get("proof_id") != proof_id:
        issues.append("review proof does not match the entered proof")
    if value.get("review_purpose") != PRODUCTION_PURPOSE or value.get("reviewer", {}).get("reviewer_kind") != "HUMAN":
        issues.append("execution ingestion rejects synthetic or non-human review records")
    identity = value.get("identity_binding", {})
    contract = proof_contracts_by_id()[proof_id]
    expected = {
        "source_revision": source_revision,
        "build_identity": build.get("build_identity"),
        "artifact_sha256": build.get("artifact_sha256"),
        "fixture_identities": fixture_identity(contract["requirements"]["fixture_identities"]),
        "environment_identity": build.get("environment"),
    }
    if not isinstance(identity, Mapping) or any(identity.get(key) != expected_value for key, expected_value in expected.items()):
        issues.append("review source/build/artifact/fixture/environment binding differs from this execution")
    for row in _all_references(value):
        issue = _verify_reference(row, run_root, ROOT)
        if issue:
            issues.append(issue)
    if proof_id == "PRD04-PROOF-51":
        origin = value.get("origin_mapping_reference")
        if isinstance(origin, Mapping) and origin.get("scope") == "REPOSITORY" and _safe_relative(origin.get("path")):
            origin_path = ROOT / str(origin["path"])
            try:
                origin_value = _load(origin_path)
                issues.extend(origin_mapping_issues(origin_value, value))
            except (OSError, ValueError, json.JSONDecodeError) as exc:
                issues.append("proof-51 origin mapping is malformed: " + str(exc))
    state = "ACCEPTED-PRODUCTION-HUMAN" if not issues else "REJECTED"
    return _human_evidence_view(value, path, state, sorted(set(issues)))


def combine_observations(automated_pass: bool, human: Mapping[str, Any]) -> Tuple[str, str, List[str]]:
    """Apply canonical precedence without letting file presence auto-pass a proof."""
    if not automated_pass:
        return "FAIL-OBSERVED", "The automated proof contract observed a candidate failure.", ["AUTOMATED-CONTRACT-FAILURE"]
    if human.get("review_state") != "ACCEPTED-PRODUCTION-HUMAN":
        return "INCONCLUSIVE", "Automated conditions passed, but no admissible production-human review was ingested.", ["HUMAN-JUDGEMENT-NOT-ADMISSIBLE"]
    judgement = human.get("validated_judgement")
    if judgement == "PASS-OBSERVED":
        return "PASS-OBSERVED", "Automated conditions and the exact bound production-human review both passed.", []
    if judgement == "FAIL-OBSERVED":
        return "FAIL-OBSERVED", "The exact bound production-human review observed a canonical candidate failure.", ["HUMAN-REVIEW-FAIL-OBSERVED"]
    return "INCONCLUSIVE", "The exact bound production-human review remained inconclusive.", ["HUMAN-REVIEW-INCONCLUSIVE"]


def all_review_templates() -> Dict[str, Dict[str, Any]]:
    return {proof_id: copy.deepcopy(review_template(proof_id)) for proof_id in CRITERIA}


def review_schema() -> Dict[str, Any]:
    return {
        "$schema": "https://json-schema.org/draft/2020-12/schema",
        "$id": "https://leyforge.local/schemas/prd07-w4-human-review-v2.json",
        "title": "Leyforge W4 governed human review",
        "type": "object",
        "required": [
            "schema_version", "proof_id", "status", "review_purpose", "identity_binding",
            "reviewer", "evidence_references", "criteria", "judgement", "attestation",
            "proof_observation_created", "identity_allocation_started",
        ],
        "properties": {
            "schema_version": {"const": SCHEMA_VERSION},
            "proof_id": {"enum": sorted(CRITERIA)},
            "status": {"enum": ["PENDING-HUMAN-REVIEW", "COMPLETE"]},
            "review_purpose": {"enum": ["UNASSIGNED", PRODUCTION_PURPOSE, SYNTHETIC_PURPOSE]},
            "judgement": {"enum": ["PENDING", *sorted(JUDGEMENTS)]},
            "proof_observation_created": {"const": False},
            "identity_allocation_started": {"const": False},
            "identity_binding": {"type": "object"},
            "reviewer": {"type": "object"},
            "evidence_references": {"type": "array"},
            "criteria": {"type": "array", "minItems": 1},
            "attestation": {"type": "object"},
        },
        "additionalProperties": True,
        "$comment": "Proof-specific completion, derivation, attestation, identity, evidence, masked adjudication, renderer support, and production-ingestion law is enforced by tools.r7_w4_repair.human_review.",
    }


def write_review_package(root: Path) -> Tuple[Path, ...]:
    root.mkdir(parents=True, exist_ok=True)
    paths = []
    schema_path = root / "human-review.schema.json"
    schema_path.write_bytes((json.dumps(review_schema(), indent=2, sort_keys=True) + "\n").encode("utf-8"))
    paths.append(schema_path)
    for proof_id, value in all_review_templates().items():
        path = root / REVIEW_FILENAMES[proof_id]
        path.write_bytes((json.dumps(value, indent=2, sort_keys=True) + "\n").encode("utf-8"))
        paths.append(path)
    origin_path = root / ORIGIN_MAPPING_FILENAME
    origin_path.write_bytes((json.dumps(origin_mapping_template(), indent=2, sort_keys=True) + "\n").encode("utf-8"))
    paths.append(origin_path)
    return tuple(paths)
