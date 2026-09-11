#!/usr/bin/env python3
"""Independent audit of W4 measurement recertification and rerun readiness."""

from __future__ import annotations

import argparse
import json
import re
from pathlib import Path
from typing import Any, Dict, Mapping, Sequence


ROOT = Path(__file__).resolve().parents[1]
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


def audit_values(recertification: Mapping[str, Any], readiness: Mapping[str, Any], root: Path = ROOT) -> Dict[str, Any]:
    audit = Audit()
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

    evidence_root = root / "docs/rebuild/r7/execution-evidence"
    allocated_suffix = [path.name for path in evidence_root.glob("PRD07-RUN-*") if path.is_dir() and int(path.name.rsplit("-", 1)[-1]) >= 73]
    audit.check(allocated_suffix == [], "0073+ execution-evidence directories exist")
    state = json.loads((root / "docs/rebuild/r7/w4-execution-state.json").read_text(encoding="utf-8-sig"))
    audit.check(state.get("next_possible_identity") == "0073-NOT-ALLOCATED", "canonical stopped state no longer says 0073 is unallocated")
    audit.check(state.get("issued_high_water") == 72, "canonical stopped high-water differs")
    return {"status": "PASS" if not audit.failures else "FAIL", "checks": audit.checks, "failures": audit.failures}


def main() -> int:
    parser = argparse.ArgumentParser(description="Audit W4 repair/recertification readiness")
    parser.add_argument("--recertification", default=str(RECERTIFICATION_PATH))
    parser.add_argument("--readiness", default=str(READINESS_PATH))
    parser.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args()
    recertification = json.loads(Path(args.recertification).read_text(encoding="utf-8-sig"))
    readiness = json.loads(Path(args.readiness).read_text(encoding="utf-8-sig"))
    report = audit_values(recertification, readiness)
    if args.format == "json":
        print(json.dumps(report, indent=2))
    else:
        print("R7 W4 repair audit {0} ({1}/{1})".format(report["status"], report["checks"]))
        for failure in report["failures"]:
            print("FAIL " + failure)
    return 0 if report["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
