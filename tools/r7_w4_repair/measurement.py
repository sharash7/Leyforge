"""Staged PRD04-PROOF-55 capability measurement.

This module deliberately keeps parsing, admission, engine resolution,
capability acquisition, execution, and externally observed effects separate.
Text markers are never a capability oracle.
"""

from __future__ import annotations

import base64
import binascii
import hashlib
import json
from typing import Any, Callable, Dict, List, Mapping, Optional, Sequence, Tuple


EXPECTED_DISPOSITIONS = ("ACCEPT-BOUNDED-DATA", "REJECT-OR-QUARANTINE")
UNSAFE_CAPABILITIES = {
    "script",
    "editor_plugin",
    "native_extension",
    "filesystem",
    "external_network",
}
ENGINE_PREFLIGHT_CAPABILITIES = {"bounded_data", "script", "editor_plugin"}
CALIBRATION_EXECUTION_CAPABILITIES = {"filesystem", "external_network"}
ALLOWED_RESOURCE_PREFIX = "res://capability_fixtures/"


def _sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def _empty_stages() -> Dict[str, Dict[str, Any]]:
    return {
        "parsing": {"state": "NOT-ATTEMPTED"},
        "decoding": {"state": "NOT-REQUIRED"},
        "admission": {"state": "NOT-ATTEMPTED"},
        "engine_resolution": {"state": "NOT-ATTEMPTED"},
        "capability_acquisition": {"state": "NOT-ATTEMPTED", "unsafe": False},
        "execution": {"state": "NOT-EXECUTED"},
        "filesystem_effect": {"state": "ABSENT"},
        "external_access_effect": {"state": "ABSENT"},
    }


def _find_request(value: Any, stages: Dict[str, Dict[str, Any]]) -> Optional[Dict[str, Any]]:
    if isinstance(value, Mapping):
        if "resource_path" in value or "requested_capability" in value:
            return dict(value)
        for nested in value.values():
            found = _find_request(nested, stages)
            if found is not None:
                return found
        return None
    if isinstance(value, (list, tuple)):
        for nested in value:
            found = _find_request(nested, stages)
            if found is not None:
                return found
        return None
    if isinstance(value, str) and value.startswith("b64:"):
        token = value[4:]
        stages["decoding"] = {
            "state": "ATTEMPTED",
            "encoded_token_sha256": _sha256(token.encode("ascii", errors="replace")),
            "case_preserved": True,
        }
        try:
            decoded = base64.b64decode(token.encode("ascii"), validate=True)
            text = decoded.decode("utf-8")
            parsed = json.loads(text)
        except (UnicodeEncodeError, UnicodeDecodeError, binascii.Error, json.JSONDecodeError, ValueError) as exc:
            stages["decoding"].update({"state": "FAILED", "error_class": type(exc).__name__})
            return None
        stages["decoding"].update(
            {
                "state": "DECODED",
                "decoded_sha256": _sha256(decoded),
                "decoded_bytes": len(decoded),
            }
        )
        return _find_request(parsed, stages)
    return None


def parse_case(value: Any) -> Dict[str, Any]:
    """Parse one nested or encoded case without normalising case-sensitive data."""
    stages = _empty_stages()
    request = _find_request(value, stages)
    if request is None:
        stages["parsing"] = {
            "state": "MALFORMED",
            "reason": "no structured resource/capability request was recoverable",
        }
        return {"request": None, "stages": stages}
    stages["parsing"] = {
        "state": "PARSED",
        "request_sha256": _sha256(
            json.dumps(request, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode("utf-8")
        ),
    }
    return {"request": request, "stages": stages}


def admission_decision(request: Mapping[str, Any]) -> Dict[str, Any]:
    path = request.get("resource_path")
    capability = request.get("requested_capability")
    if not isinstance(path, str) or not path:
        return {"state": "REJECTED-MALFORMED", "reason": "resource_path is required"}
    if not isinstance(capability, str) or not capability:
        return {"state": "REJECTED-MALFORMED", "reason": "requested_capability is required"}
    if capability not in ENGINE_PREFLIGHT_CAPABILITIES | UNSAFE_CAPABILITIES:
        return {"state": "REJECTED-UNKNOWN-CAPABILITY", "reason": "requested capability is not governed"}
    lowered_path = path.lower()
    if lowered_path.startswith(("http://", "https://", "file://")):
        return {"state": "REJECTED-EXTERNAL-URI", "reason": "external URI is outside the safe data tier"}
    if path.startswith(("/", "\\")) or (len(path) >= 3 and path[1:3] in (":\\", ":/")):
        return {"state": "REJECTED-ABSOLUTE-PATH", "reason": "absolute paths are outside the proof fixture root"}
    if ".." in path.replace("\\", "/").split("/"):
        return {"state": "REJECTED-PARENT-TRAVERSAL", "reason": "parent traversal is outside the proof fixture root"}
    if not path.startswith(ALLOWED_RESOURCE_PREFIX):
        return {"state": "REJECTED-OUTSIDE-FIXTURE", "reason": "resource is outside the proof-only fixture root"}
    if capability == "native_extension":
        return {"state": "REJECTED-FORBIDDEN-CAPABILITY", "reason": "native extension capability is never admitted"}
    if capability in CALIBRATION_EXECUTION_CAPABILITIES:
        if request.get("calibration_authority") is True and request.get("intentional_execution") is True:
            return {"state": "ADMITTED-CALIBRATION-EXECUTION", "reason": "controlled non-proof calibration"}
        return {"state": "REJECTED-FORBIDDEN-CAPABILITY", "reason": "side-effect capability lacks calibration authority"}
    return {"state": "ADMITTED-TO-ENGINE-PREFLIGHT", "reason": "bounded engine preflight required"}


def _normalise_engine_observation(value: Any) -> Tuple[bool, Dict[str, Dict[str, Any]], str]:
    if not isinstance(value, Mapping):
        return False, {}, "engine observer did not return an object"
    names = (
        "engine_resolution",
        "capability_acquisition",
        "execution",
        "filesystem_effect",
        "external_access_effect",
    )
    stages: Dict[str, Dict[str, Any]] = {}
    for name in names:
        item = value.get(name)
        if not isinstance(item, Mapping) or not isinstance(item.get("state"), str):
            return False, stages, "engine observer lacks " + name
        stages[name] = dict(item)
    supported = value.get("supported") is True
    return supported, stages, str(value.get("limitation", ""))


def measure_case(
    case_id: str,
    value: Any,
    expected_disposition: str,
    observer: Callable[[Dict[str, Any]], Mapping[str, Any]],
) -> Dict[str, Any]:
    if expected_disposition not in EXPECTED_DISPOSITIONS:
        raise ValueError("unsupported expected proof-55 disposition")
    parsed = parse_case(value)
    stages = parsed["stages"]
    request = parsed["request"]
    row: Dict[str, Any] = {
        "case_id": case_id,
        "expected_disposition": expected_disposition,
        "request": request,
        "stages": stages,
        "limitations": [],
    }
    if request is None:
        stages["admission"] = {"state": "REJECTED-MALFORMED"}
        row["actual_disposition"] = "REJECT-OR-QUARANTINE"
        return row

    admission = admission_decision(request)
    stages["admission"] = admission
    if admission["state"].startswith("REJECTED-"):
        stages["capability_acquisition"] = {"state": "DENIED-AT-ADMISSION", "unsafe": False}
        row["actual_disposition"] = "REJECT-OR-QUARANTINE"
        return row

    try:
        raw_observation = observer(dict(request))
    except Exception as exc:  # The proof must fail closed when the observer is unavailable.
        row["actual_disposition"] = "INCONCLUSIVE"
        row["limitations"].append("engine observer failed: " + type(exc).__name__)
        stages["engine_resolution"] = {"state": "UNSUPPORTED"}
        stages["capability_acquisition"] = {"state": "UNKNOWN", "unsafe": None}
        stages["execution"] = {"state": "UNKNOWN"}
        stages["filesystem_effect"] = {"state": "UNKNOWN"}
        stages["external_access_effect"] = {"state": "UNKNOWN"}
        return row

    supported, engine_stages, limitation = _normalise_engine_observation(raw_observation)
    stages.update(engine_stages)
    row["raw_engine_observation"] = dict(raw_observation) if isinstance(raw_observation, Mapping) else raw_observation
    if limitation:
        row["limitations"].append(limitation)

    unknown = any(
        str(stages[name].get("state", "UNKNOWN")) in {"UNKNOWN", "UNSUPPORTED", "NOT-OBSERVED"}
        for name in ("engine_resolution", "capability_acquisition", "execution", "filesystem_effect", "external_access_effect")
    )
    unsafe = stages["capability_acquisition"].get("unsafe") is True
    executed = stages["execution"].get("state") == "EXECUTED"
    side_effect = stages["filesystem_effect"].get("state") == "OBSERVED" or stages["external_access_effect"].get("state") == "OBSERVED"
    capability = str(request.get("requested_capability"))

    if unsafe or executed or side_effect:
        row["actual_disposition"] = "UNSAFE-CAPABILITY-EXECUTED"
    elif not supported or unknown:
        row["actual_disposition"] = "INCONCLUSIVE"
    elif capability in {"script", "editor_plugin"} and stages["capability_acquisition"].get("state") == "DENIED-AFTER-ENGINE-PREFLIGHT":
        row["actual_disposition"] = "REJECT-OR-QUARANTINE"
    elif capability == "bounded_data" and stages["capability_acquisition"].get("state") == "BOUNDED-DATA-ACQUIRED":
        row["actual_disposition"] = "ACCEPT-BOUNDED-DATA"
    else:
        row["actual_disposition"] = "INCONCLUSIVE"
    return row


def classify_proof_55(rows: Sequence[Mapping[str, Any]]) -> Dict[str, Any]:
    failures: List[str] = []
    inconclusive: List[str] = []
    false_positives: List[str] = []
    false_negatives: List[str] = []
    for row in rows:
        case_id = str(row.get("case_id", "UNKNOWN"))
        expected = row.get("expected_disposition")
        actual = row.get("actual_disposition")
        stages = row.get("stages", {}) if isinstance(row.get("stages"), Mapping) else {}
        capability = stages.get("capability_acquisition", {}) if isinstance(stages.get("capability_acquisition"), Mapping) else {}
        execution = stages.get("execution", {}) if isinstance(stages.get("execution"), Mapping) else {}
        filesystem = stages.get("filesystem_effect", {}) if isinstance(stages.get("filesystem_effect"), Mapping) else {}
        external = stages.get("external_access_effect", {}) if isinstance(stages.get("external_access_effect"), Mapping) else {}
        unsafe_observed = (
            capability.get("unsafe") is True
            or execution.get("state") == "EXECUTED"
            or filesystem.get("state") == "OBSERVED"
            or external.get("state") == "OBSERVED"
        )
        if unsafe_observed or actual == "UNSAFE-CAPABILITY-EXECUTED":
            failures.append(case_id)
            continue
        if actual == "INCONCLUSIVE":
            inconclusive.append(case_id)
            continue
        if expected == "REJECT-OR-QUARANTINE" and actual != expected:
            false_negatives.append(case_id)
            failures.append(case_id)
        elif expected == "ACCEPT-BOUNDED-DATA" and actual != expected:
            false_positives.append(case_id)
            failures.append(case_id)
    if failures:
        outcome = "FAIL-OBSERVED"
    elif inconclusive or not rows:
        outcome = "INCONCLUSIVE"
    else:
        outcome = "PASS-OBSERVED"
    return {
        "outcome": outcome,
        "row_count": len(rows),
        "failure_cases": failures,
        "inconclusive_cases": inconclusive,
        "false_positive_cases": false_positives,
        "false_negative_cases": false_negatives,
    }
