#!/usr/bin/env python3
"""Independent audit of W4 measurement recertification and rerun readiness."""

from __future__ import annotations

import argparse
import json
import os
import re
import sys
from pathlib import Path
from typing import Any, Dict, Mapping, Sequence

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from tools.r7_w3_runtime.execution_plan import inspect_execution_registry
from tools.r7_w4_repair.integration_admission import (
    MODE_ENV as INTEGRATION_ADMISSION_MODE_ENV,
    ORCHESTRATION_MODES as INTEGRATION_ADMISSION_MODES,
)
from tools.r7_w4_repair.audit_wiring_admission import (
    MODE_ENV as AUDIT_WIRING_ADMISSION_MODE_ENV,
    MODES as AUDIT_WIRING_ADMISSION_MODES,
    layered_issues,
)


RECERTIFICATION_PATH = ROOT / "docs/rebuild/r7/w4-measurement-recertification.json"
READINESS_PATH = ROOT / "docs/rebuild/r7/w4-rerun-readiness.json"

EXPECTED_CASES = {
    "BENIGN-MARKER-FALSE-POSITIVE": ("ACCEPT-BOUNDED-DATA", True),
    "BENIGN-ENCODED-CASE-SENSITIVE": ("ACCEPT-BOUNDED-DATA", True),
    "SCRIPT-CAPABILITY-DENIED": ("REJECT-OR-QUARANTINE", True),
    "SCRIPT-ENCODED-FALSE-NEGATIVE": ("REJECT-OR-QUARANTINE", True),
    "EDITOR-CAPABILITY-DENIED": ("REJECT-OR-QUARANTINE", True),
    "NATIVE-CAPABILITY-ADMISSION-DENIED": ("REJECT-OR-QUARANTINE", False),
    "EXTERNAL-URI-ADMISSION-DENIED": ("REJECT-OR-QUARANTINE", False),
    "TRAVERSAL-ADMISSION-DENIED": ("REJECT-OR-QUARANTINE", False),
    "ABSOLUTE-PATH-ADMISSION-DENIED": ("REJECT-OR-QUARANTINE", False),
    "MALFORMED-BASE64-DENIED": ("REJECT-OR-QUARANTINE", False),
    "MALFORMED-JSON-DENIED": ("REJECT-OR-QUARANTINE", False),
    "UNKNOWN-CAPABILITY-DENIED": ("REJECT-OR-QUARANTINE", False),
    "UNSUPPORTED-OBSERVATION-INCONCLUSIVE": ("INCONCLUSIVE", True),
    "CONTROLLED-FILESYSTEM-SIDE-EFFECT": ("UNSAFE-CAPABILITY-EXECUTED", True),
    "CONTROLLED-EXTERNAL-ACCESS": ("UNSAFE-CAPABILITY-EXECUTED", True),
}

EXPECTED_RERUN_ORDER = [
    "PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-53", "PRD04-PROOF-55",
    "PRD04-PROOF-56", "PRD04-PROOF-57", "PRD04-PROOF-58", "PRD04-PROOF-59",
    "PRD04-PROOF-60", "PRD04-PROOF-61", "PRD04-PROOF-62", "PRD04-PROOF-71",
]


class Audit:
    def __init__(self) -> None:
        self.checks = 0
        self.failures = []

    def check(self, condition: bool, message: str) -> None:
        self.checks += 1
        if not condition:
            self.failures.append(message)


def execution_state_identity_issues(state: Mapping[str, Any], root: Path = ROOT) -> Sequence[str]:
    """Derive issued W4 identity facts from state, packs, and the global registry."""
    issues = []
    run_pattern = re.compile(r"PRD07-RUN-(\d{4})")
    evidence_pattern = re.compile(r"PRD07-EVID-(\d{4})")
    runs = state.get("allocated_run_ids")
    evidence = state.get("allocated_evidence_ids")
    history = state.get("allocation_history")
    if not isinstance(runs, list) or not isinstance(evidence, list) or not isinstance(history, list):
        return ["canonical stopped state allocation arrays/history are malformed"]
    if len(runs) != len(set(runs)) or len(evidence) != len(set(evidence)):
        issues.append("canonical stopped state duplicates an allocated identity")
    run_numbers = [int(match.group(1)) for value in runs if isinstance(value, str) and (match := run_pattern.fullmatch(value))]
    evidence_numbers = [int(match.group(1)) for value in evidence if isinstance(value, str) and (match := evidence_pattern.fullmatch(value))]
    if len(run_numbers) != len(runs) or len(evidence_numbers) != len(evidence):
        issues.append("canonical stopped state contains a malformed allocated identity")
    if run_numbers != list(range(66, 73)) or evidence_numbers != list(range(66, 73)):
        issues.append("canonical stopped W4 allocated arrays are not exactly the issued 0066-0072 prefix")
    history_runs = [row.get("run_id") for row in history if isinstance(row, Mapping)]
    history_evidence = [row.get("evidence_id") for row in history if isinstance(row, Mapping)]
    if len(history_runs) != len(history) or history_runs != runs or history_evidence != evidence:
        issues.append("canonical stopped state allocation arrays disagree with allocation history")
    if any(number >= 73 for number in run_numbers + evidence_numbers):
        issues.append("canonical stopped state contains a false 0073+ allocation")

    proof_rows = state.get("proofs")
    if not isinstance(proof_rows, list):
        issues.append("canonical stopped state proof rows are malformed")
    else:
        issued_proofs = [row for row in proof_rows if isinstance(row, Mapping) and row.get("run_id")]
        if [row.get("run_id") for row in issued_proofs] != runs or [row.get("evidence_id") for row in issued_proofs] != evidence:
            issues.append("canonical stopped state proof rows disagree with allocated arrays")

    evidence_root = root / "docs/rebuild/r7/execution-evidence"
    suffix = []
    for path in evidence_root.glob("PRD07-RUN-*"):
        match = run_pattern.fullmatch(path.name)
        if path.is_dir() and match and int(match.group(1)) >= 73:
            suffix.append(path.name)
    if suffix:
        issues.append("0073+ execution-evidence directories exist: " + ", ".join(sorted(suffix)))

    try:
        registry = inspect_execution_registry(root)
        if registry.max_run_number != 72 or registry.max_evidence_number != 72:
            issues.append("global execution registry high-water is not RUN/EVID 0072")
        if tuple(runs) != tuple(value for value in registry.run_ids if int(value.rsplit("-", 1)[1]) >= 66):
            issues.append("W4 allocated run array disagrees with the global registry")
        if tuple(evidence) != tuple(value for value in registry.evidence_ids if int(value.rsplit("-", 1)[1]) >= 66):
            issues.append("W4 allocated evidence array disagrees with the global registry")
        for row in history:
            if not isinstance(row, Mapping):
                continue
            expected = registry.mappings.get(str(row.get("run_id")))
            if expected != (str(row.get("proof_id")), str(row.get("evidence_id"))):
                issues.append("state/registry proof identity mapping disagrees: " + str(row.get("run_id")))
    except Exception as exc:
        issues.append("global execution registry is ambiguous: " + str(exc))

    readiness_relative = state.get("prior_readiness_source")
    if isinstance(readiness_relative, str) and readiness_relative:
        readiness_path = root / readiness_relative
        try:
            prior = json.loads(readiness_path.read_text(encoding="utf-8-sig"))
            if prior.get("allocated_run_ids") != [] or prior.get("allocated_evidence_ids") != []:
                issues.append("historical readiness represents preview labels as allocated identities")
            for row in prior.get("proofs", []):
                preview = row.get("future_identity_preview") if isinstance(row, Mapping) else None
                if isinstance(preview, Mapping) and preview.get("identity_state") != "PREVIEW-NOT-ALLOCATED":
                    issues.append("historical readiness identity label is not preview-only")
        except (OSError, json.JSONDecodeError) as exc:
            issues.append("historical readiness preview source cannot be validated: " + str(exc))
    return tuple(sorted(set(issues)))


def audit_values(
    recertification: Mapping[str, Any],
    readiness: Mapping[str, Any],
    root: Path = ROOT,
    *,
    integration_admission_mode: str = "auto",
    audit_wiring_admission_mode: str = "auto",
) -> Dict[str, Any]:
    audit = Audit()
    if root.resolve() == ROOT.resolve():
        audit.check(integration_admission_mode in ("auto", "published"), "published integration layer requires auto or published mode")
        admission_issues = layered_issues(mode=audit_wiring_admission_mode)
        audit.check(not admission_issues, "layered W4 admission failed: " + "; ".join(admission_issues))
    audit.check(recertification.get("schema_version") == "prd07-w4-measurement-recertification-v1", "recertification schema differs")
    audit.check(recertification.get("state") == "PASS", "recertification is not PASS")
    audit.check(recertification.get("scope") == "HARNESS-RECERTIFICATION-NOT-PROOF-OBSERVATION", "recertification scope differs")
    audit.check(re.fullmatch(r"[0-9a-f]{40}", str(recertification.get("source_revision", ""))) is not None, "recertification source revision is invalid")
    for key in ("proof_execution_started", "identity_allocation_started", "standard_evidence_pack_created", "prd07_run_or_evidence_identity_created"):
        audit.check(recertification.get(key) is False, "recertification must keep %s false" % key)
    build = recertification.get("build", {})
    audit.check(isinstance(build, Mapping), "recertification build is absent")
    if isinstance(build, Mapping):
        audit.check(build.get("source_revision") == recertification.get("source_revision"), "build/source revision differs")
        audit.check(re.fullmatch(r"[0-9a-f]{64}", str(build.get("build_identity", ""))) is not None, "build identity is invalid")
        audit.check(re.fullmatch(r"[0-9a-f]{64}", str(build.get("artifact_sha256", ""))) is not None, "artifact hash is invalid")
        audit.check(build.get("proof_execution_started") is False and build.get("identity_allocation_started") is False, "build preflight crossed proof/allocation boundary")
        audit.check(build.get("production_runtime") == "ABSENT" and build.get("gameplay_permission") == "CLOSED", "build crossed production/gameplay boundary")
        dependency = build.get("dependency_check", {})
        audit.check(isinstance(dependency, Mapping) and dependency.get("status") == "PASS" and dependency.get("local_patch_status") == "NO-LOCAL-PATCH", "exact dependency check is not clean")

    rows = recertification.get("cases")
    audit.check(isinstance(rows, list) and [row.get("case_id") for row in rows if isinstance(row, Mapping)] == list(EXPECTED_CASES), "calibration case roster/order differs")
    by_id = {str(row.get("case_id")): row for row in rows if isinstance(row, Mapping)} if isinstance(rows, list) else {}
    for case_id, (expected_actual, engine_expected) in EXPECTED_CASES.items():
        row = by_id.get(case_id, {})
        audit.check(row.get("actual_disposition") == expected_actual, case_id + " disposition differs")
        audit.check(row.get("engine_observer_invoked") is engine_expected, case_id + " engine invocation differs")
        stages = row.get("stages", {}) if isinstance(row.get("stages"), Mapping) else {}
        audit.check(
            all(isinstance(stages.get(name), Mapping) and isinstance(stages[name].get("state"), str) for name in (
                "parsing", "decoding", "admission", "engine_resolution", "capability_acquisition", "execution", "filesystem_effect", "external_access_effect"
            )),
            case_id + " staged observation is incomplete",
        )
        raw = row.get("raw_engine_observation")
        if engine_expected:
            audit.check(isinstance(raw, Mapping), case_id + " raw engine observation is absent")
            if isinstance(raw, Mapping):
                audit.check(raw.get("proof_execution_started") is False and raw.get("identity_allocation_started") is False, case_id + " crossed proof/allocation boundary")
                audit.check(raw.get("calibration") is True and raw.get("report_mode") == "capability-calibration", case_id + " is not calibration mode")
                audit.check(raw.get("report_production_runtime") is False and raw.get("report_gameplay_permission") == "CLOSED", case_id + " crossed production/gameplay boundary")
        else:
            audit.check(raw is None, case_id + " should have stopped before engine invocation")

    for case_id in ("BENIGN-ENCODED-CASE-SENSITIVE", "SCRIPT-ENCODED-FALSE-NEGATIVE"):
        decoding = by_id.get(case_id, {}).get("stages", {}).get("decoding", {})
        audit.check(decoding.get("state") == "DECODED" and decoding.get("case_preserved") is True, case_id + " did not preserve exact encoding")
    for case_id in ("SCRIPT-CAPABILITY-DENIED", "SCRIPT-ENCODED-FALSE-NEGATIVE", "EDITOR-CAPABILITY-DENIED"):
        stages = by_id.get(case_id, {}).get("stages", {})
        audit.check(stages.get("engine_resolution", {}).get("resource_type") == "GDScript", case_id + " did not observe the actual GDScript type")
        audit.check(stages.get("capability_acquisition", {}).get("state") == "DENIED-AFTER-ENGINE-PREFLIGHT", case_id + " was not denied after engine preflight")
        audit.check(stages.get("execution", {}).get("state") == "NOT-EXECUTED", case_id + " unexpectedly executed")
    unsupported = by_id.get("UNSUPPORTED-OBSERVATION-INCONCLUSIVE", {})
    audit.check(unsupported.get("actual_disposition") == "INCONCLUSIVE" and unsupported.get("stages", {}).get("engine_resolution", {}).get("state") == "UNSUPPORTED", "unsupported observation was not fail-closed")
    filesystem = by_id.get("CONTROLLED-FILESYSTEM-SIDE-EFFECT", {}).get("stages", {})
    audit.check(filesystem.get("execution", {}).get("state") == "EXECUTED" and filesystem.get("filesystem_effect", {}).get("state") == "OBSERVED", "filesystem side-effect monitor failed its positive control")
    external = by_id.get("CONTROLLED-EXTERNAL-ACCESS", {}).get("stages", {})
    audit.check(external.get("execution", {}).get("state") == "EXECUTED" and external.get("external_access_effect", {}).get("state") == "OBSERVED", "external-access monitor failed its positive control")
    audit.check(recertification.get("check_failures") == [], "author recertification contains failed checks")

    audit.check(readiness.get("schema_version") == "prd07-w4-rerun-readiness-v1", "rerun readiness schema differs")
    audit.check(readiness.get("state") == "READY-FOR-SEPARATE-OWNER-AUTHORIZED-RERUN", "rerun readiness is not ready")
    audit.check(readiness.get("issued_high_water") == 72 and readiness.get("next_possible_identity") == "0073-NOT-ALLOCATED", "readiness identity boundary differs")
    audit.check(readiness.get("allocated_run_ids") == [] and readiness.get("allocated_evidence_ids") == [], "readiness contains allocated identities")
    audit.check(readiness.get("proof_execution_started") is False and readiness.get("identity_allocation_started") is False, "readiness crossed proof/allocation boundary")
    audit.check(readiness.get("rerun_proof_order") == EXPECTED_RERUN_ORDER, "future rerun order differs")
    proofs = readiness.get("proofs")
    audit.check(isinstance(proofs, list) and len(proofs) == 15, "readiness does not classify all 15 W4 proofs")
    previews = [row.get("preview") for row in proofs if isinstance(row, Mapping) and row.get("preview")] if isinstance(proofs, list) else []
    audit.check(len(previews) == 12, "readiness preview count differs")
    for index, preview in enumerate(previews, start=73):
        audit.check(preview.get("state") == "PREVIEW-NOT-ALLOCATED", "future identity is not explicitly preview-only")
        audit.check(preview.get("run_id") == "PRD07-RUN-%04d" % index and preview.get("evidence_id") == "PRD07-EVID-%04d" % index, "future preview sequence differs")
    for proof_id in ("PRD04-PROOF-57", "PRD04-PROOF-58"):
        fcc = readiness.get("fcc13e", {}).get(proof_id, {})
        audit.check(fcc.get("observed_rows") == 0 and fcc.get("future_requirement") == "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER", proof_id + " FCC-13E boundary differs")

    state = json.loads((root / "docs/rebuild/r7/w4-execution-state.json").read_text(encoding="utf-8-sig"))
    identity_issues = execution_state_identity_issues(state, root)
    audit.check(not identity_issues, "canonical stopped identity derivation failed: " + "; ".join(identity_issues))
    return {
        "status": "PASS" if not audit.failures else "FAIL",
        "checks": audit.checks,
        "integration_admission_mode": integration_admission_mode,
        "audit_wiring_admission_mode": audit_wiring_admission_mode,
        "failures": audit.failures,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit W4 repair/recertification readiness")
    parser.add_argument("--recertification", default=str(RECERTIFICATION_PATH))
    parser.add_argument("--readiness", default=str(READINESS_PATH))
    parser.add_argument(
        "--integration-admission-mode",
        choices=INTEGRATION_ADMISSION_MODES,
        default=os.environ.get(INTEGRATION_ADMISSION_MODE_ENV, "auto"),
    )
    parser.add_argument(
        "--audit-wiring-admission-mode",
        choices=AUDIT_WIRING_ADMISSION_MODES,
        default=os.environ.get(AUDIT_WIRING_ADMISSION_MODE_ENV, "auto"),
    )
    parser.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args()
    recertification = json.loads(Path(args.recertification).read_text(encoding="utf-8-sig"))
    readiness = json.loads(Path(args.readiness).read_text(encoding="utf-8-sig"))
    report = audit_values(
        recertification,
        readiness,
        integration_admission_mode=args.integration_admission_mode,
        audit_wiring_admission_mode=args.audit_wiring_admission_mode,
    )
    if args.format == "json":
        print(json.dumps(report, indent=2))
    else:
        print("R7 W4 repair audit {0} ({1}/{1})".format(report["status"], report["checks"]))
        for failure in report["failures"]:
            print("FAIL " + failure)
    return 0 if report["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
