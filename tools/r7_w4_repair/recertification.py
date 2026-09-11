"""Independent, allocation-free real-engine calibration of proof-55 measurement."""

from __future__ import annotations

import base64
import json
import re
from pathlib import Path
from typing import Any, Dict, List, Mapping, Tuple

from tools.r7_w4_execution.builds import build_probe, run_capability_process

from .measurement import measure_case


def _encoded(request: Mapping[str, Any]) -> Dict[str, str]:
    raw = json.dumps(dict(request), sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode("utf-8")
    return {"reference": "b64:" + base64.b64encode(raw).decode("ascii")}


def calibration_cases() -> Tuple[Dict[str, Any], ...]:
    benign = {
        "resource_path": "res://capability_fixtures/benign_data.tres",
        "requested_capability": "bounded_data",
        "case_sensitive_token": "AbCdEfZ+/09",
        "description": "harmless script native editor-plugin external-uri marker text",
    }
    script = {
        "resource_path": "res://capability_fixtures/file_canary.gd",
        "requested_capability": "script",
        "case_sensitive_token": "QrStUvZ+/09",
    }
    return (
        {"case_id": "BENIGN-MARKER-FALSE-POSITIVE", "value": benign, "expected_policy": "ACCEPT-BOUNDED-DATA", "expected_actual": "ACCEPT-BOUNDED-DATA", "engine": True},
        {"case_id": "BENIGN-ENCODED-CASE-SENSITIVE", "value": _encoded(benign), "expected_policy": "ACCEPT-BOUNDED-DATA", "expected_actual": "ACCEPT-BOUNDED-DATA", "engine": True, "decoded": True},
        {"case_id": "SCRIPT-CAPABILITY-DENIED", "value": script, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": True},
        {"case_id": "SCRIPT-ENCODED-FALSE-NEGATIVE", "value": _encoded(script), "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": True, "decoded": True},
        {"case_id": "EDITOR-CAPABILITY-DENIED", "value": {"resource_path": "res://capability_fixtures/editor_plugin_canary.gd", "requested_capability": "editor_plugin"}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": True},
        {"case_id": "NATIVE-CAPABILITY-ADMISSION-DENIED", "value": {"resource_path": "res://capability_fixtures/benign_data.tres", "requested_capability": "native_extension"}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": False},
        {"case_id": "EXTERNAL-URI-ADMISSION-DENIED", "value": {"resource_path": "https://127.0.0.1/denied", "requested_capability": "bounded_data"}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": False},
        {"case_id": "TRAVERSAL-ADMISSION-DENIED", "value": {"resource_path": "res://capability_fixtures/../src/main.gd", "requested_capability": "bounded_data"}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": False},
        {"case_id": "ABSOLUTE-PATH-ADMISSION-DENIED", "value": {"resource_path": "C:/leyforge-w4-denied/resource.tres", "requested_capability": "bounded_data"}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": False},
        {"case_id": "MALFORMED-BASE64-DENIED", "value": {"reference": "b64:not*valid*base64"}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": False},
        {"case_id": "MALFORMED-JSON-DENIED", "value": {"container": [None, 3, "not-a-request"]}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": False},
        {"case_id": "UNKNOWN-CAPABILITY-DENIED", "value": {"resource_path": "res://capability_fixtures/benign_data.tres", "requested_capability": "unruled_capability"}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "REJECT-OR-QUARANTINE", "engine": False},
        {"case_id": "UNSUPPORTED-OBSERVATION-INCONCLUSIVE", "value": {"resource_path": "res://capability_fixtures/missing.unknown", "requested_capability": "bounded_data"}, "expected_policy": "ACCEPT-BOUNDED-DATA", "expected_actual": "INCONCLUSIVE", "engine": True},
        {"case_id": "CONTROLLED-FILESYSTEM-SIDE-EFFECT", "value": {"resource_path": "res://capability_fixtures/file_canary.gd", "requested_capability": "filesystem", "calibration_authority": True, "intentional_execution": True}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "UNSAFE-CAPABILITY-EXECUTED", "engine": True, "filesystem": "OBSERVED"},
        {"case_id": "CONTROLLED-EXTERNAL-ACCESS", "value": {"resource_path": "res://capability_fixtures/network_canary.gd", "requested_capability": "external_network", "calibration_authority": True, "intentional_execution": True}, "expected_policy": "REJECT-OR-QUARANTINE", "expected_actual": "UNSAFE-CAPABILITY-EXECUTED", "engine": True, "external": "OBSERVED"},
    )


def _compact_row(row: Mapping[str, Any]) -> Dict[str, Any]:
    value = dict(row)
    raw = value.get("raw_engine_observation")
    if isinstance(raw, Mapping):
        process = raw.get("process", {}) if isinstance(raw.get("process"), Mapping) else {}
        report = raw.get("report", {}) if isinstance(raw.get("report"), Mapping) else {}
        value["raw_engine_observation"] = {
            "supported": raw.get("supported"),
            "proof_execution_started": raw.get("proof_execution_started"),
            "identity_allocation_started": raw.get("identity_allocation_started"),
            "calibration": raw.get("calibration"),
            "process": {
                "exit_code": process.get("exit_code"),
                "timed_out": process.get("timed_out"),
                "stdout_sha256": process.get("stdout_sha256"),
                "stderr_sha256": process.get("stderr_sha256"),
            },
            "report_schema": report.get("schema_version"),
            "report_mode": report.get("mode"),
            "report_production_runtime": report.get("production_runtime"),
            "report_gameplay_permission": report.get("gameplay_permission"),
        }
    return value


def run_recertification(source_revision: str, run_root: Path) -> Dict[str, Any]:
    if re.fullmatch(r"[0-9a-f]{40}", source_revision) is None:
        raise ValueError("recertification source revision must be an exact commit")
    build = build_probe(source_revision, run_root)
    artifact = Path(str(build["artifact_path"]))
    rows: List[Dict[str, Any]] = []
    checks: List[Dict[str, Any]] = []
    for spec in calibration_cases():
        invoked = {"value": False}

        def observe(request: Dict[str, Any], case_id: str = str(spec["case_id"])) -> Mapping[str, Any]:
            invoked["value"] = True
            return run_capability_process(artifact, run_root, "RECERT-" + case_id, request, calibration=True)

        row = measure_case(str(spec["case_id"]), spec["value"], str(spec["expected_policy"]), observe)
        row["calibration_expected_actual"] = spec["expected_actual"]
        row["engine_observer_invoked"] = invoked["value"]
        rows.append(_compact_row(row))
        case_checks = {
            "actual_disposition": row.get("actual_disposition") == spec["expected_actual"],
            "engine_invocation": invoked["value"] is spec["engine"],
            "proof_execution_closed": row.get("raw_engine_observation", {}).get("proof_execution_started") is False if invoked["value"] else True,
            "identity_allocation_closed": row.get("raw_engine_observation", {}).get("identity_allocation_started") is False if invoked["value"] else True,
            "decoded_case_preserved": row["stages"]["decoding"].get("state") == "DECODED" and row["stages"]["decoding"].get("case_preserved") is True if spec.get("decoded") else True,
            "filesystem_monitor": row["stages"]["filesystem_effect"].get("state") == spec.get("filesystem", "ABSENT"),
            "external_monitor": row["stages"]["external_access_effect"].get("state") == spec.get("external", "ABSENT"),
        }
        for name, passed in case_checks.items():
            checks.append({"case_id": spec["case_id"], "check": name, "passed": bool(passed)})
    failures = [check for check in checks if not check["passed"]]
    build_summary = {
        key: build[key]
        for key in (
            "schema_version", "source_revision", "role", "build_identity", "probe_source_identity",
            "artifact_sha256", "artifact_size_bytes", "dependency_check", "environment",
            "proof_execution_started", "identity_allocation_started", "production_runtime", "gameplay_permission",
        )
    }
    return {
        "schema_version": "prd07-w4-measurement-recertification-v1",
        "state": "PASS" if not failures else "FAIL",
        "scope": "HARNESS-RECERTIFICATION-NOT-PROOF-OBSERVATION",
        "source_revision": source_revision,
        "build": build_summary,
        "cases": rows,
        "checks": checks,
        "check_total": len(checks),
        "check_failures": failures,
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "standard_evidence_pack_created": False,
        "prd07_run_or_evidence_identity_created": False,
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
    }
