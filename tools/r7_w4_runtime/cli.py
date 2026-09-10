"""Command-line interface for W4 readiness only. There is intentionally no execute command."""

from __future__ import annotations

import argparse
import json
from typing import Any

from .admission import MANIFEST_PATH, manifest_issues, write_manifest
from .execution_plan import preview_execution_plan
from .fixtures import build_fcc_expected, fixture_issues, write_fcc_expected, write_fixture_validation
from .readiness import READINESS_PATH, readiness_report, write_readiness


def _emit(value: Any, output_format: str) -> None:
    if output_format == "json":
        print(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True))
    else:
        print(json.dumps(value, sort_keys=True, ensure_ascii=True))


def main() -> int:
    parser = argparse.ArgumentParser(description="Leyforge R7 W4 readiness/admission tooling (no proof executor)")
    sub = parser.add_subparsers(dest="command", required=True)
    fixtures = sub.add_parser("fixtures")
    fixtures.add_argument("--write", action="store_true")
    fixtures.add_argument("--implementation-commit")
    fixtures.add_argument("--dynamic", action="store_true")
    readiness = sub.add_parser("readiness")
    readiness.add_argument("--implementation-commit", required=True)
    readiness.add_argument("--check-local", action="store_true")
    readiness.add_argument("--write", action="store_true")
    admission = sub.add_parser("admission")
    admission.add_argument("--implementation-commit", required=True)
    admission.add_argument("--write", action="store_true")
    verify = sub.add_parser("verify")
    verify.add_argument("--implementation-commit", required=True)
    preview = sub.add_parser("preview")
    for command in (fixtures, readiness, admission, verify, preview):
        command.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args()
    if args.command == "fixtures":
        if args.dynamic and (not args.write or not args.implementation_commit):
            parser.error("dynamic fixture validation requires --write and --implementation-commit")
        if args.write:
            write_fcc_expected()
        value = {"status": "PASS" if not fixture_issues() else "FAIL", "issues": list(fixture_issues()), "fcc13e": build_fcc_expected() if not fixture_issues() else None, "proof_execution": "NOT-STARTED", "allocated_run_ids": [], "allocated_evidence_ids": []}
        if args.dynamic:
            value["fixture_validation"] = write_fixture_validation(args.implementation_commit)
            value["status"] = value["fixture_validation"]["status"]
        _emit(value, args.format)
        return 0 if value["status"] == "PASS" else 1
    if args.command == "readiness":
        value = write_readiness(args.implementation_commit, args.check_local) if args.write else readiness_report(args.implementation_commit, args.check_local)
        _emit(value, args.format)
        return 0 if value["status"] == "PASS" else 1
    if args.command == "admission":
        if args.write:
            value = write_manifest(args.implementation_commit)
            issues = manifest_issues(value, args.implementation_commit)
        else:
            value = json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig"))
            issues = manifest_issues(value, args.implementation_commit)
        result = {"status": "PASS" if not issues else "FAIL", "issues": list(issues), "manifest": value}
        _emit(result, args.format)
        return 0 if not issues else 1
    if args.command == "verify":
        readiness_value = readiness_report(args.implementation_commit, check_local=False)
        stored_readiness = json.loads(READINESS_PATH.read_text(encoding="utf-8-sig")) if READINESS_PATH.is_file() else {}
        if stored_readiness:
            stored_readiness["local_dependency_check"] = readiness_value["local_dependency_check"]
        admission_value = json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig")) if MANIFEST_PATH.is_file() else {}
        issues = []
        if stored_readiness != readiness_value:
            issues.append("stored readiness differs from canonical regeneration")
        if admission_value:
            issues.extend(manifest_issues(admission_value, args.implementation_commit))
        else:
            issues.append("W4 admission manifest is missing")
        result = {"status": "PASS" if not issues else "FAIL", "issues": sorted(set(issues)), "readiness_counts": readiness_value.get("readiness_counts"), "proof_execution": "NOT-STARTED", "allocated_run_ids": [], "allocated_evidence_ids": []}
        _emit(result, args.format)
        return 0 if not issues else 1
    value = {"status": "PASS", "identity_previews": preview_execution_plan(), "proof_execution": "NOT-STARTED", "allocated_run_ids": [], "allocated_evidence_ids": []}
    _emit(value, args.format)
    return 0
