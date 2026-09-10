"""Command-line boundary for governed W4 admission, execution and reconciliation."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from .contracts import build_execution_admission, execution_admission_issues, initial_authority_issues, write_execution_admission
from .execution import execute_w4, reconcile_w4


def _emit(value: Any, output_format: str) -> None:
    print(json.dumps(value, indent=2 if output_format == "json" else None, sort_keys=True, ensure_ascii=True))


def main() -> int:
    parser = argparse.ArgumentParser(description="Leyforge R7 W4 governed execution controller")
    sub = parser.add_subparsers(dest="command", required=True)
    authority = sub.add_parser("initial-authority")
    admission = sub.add_parser("admission")
    admission.add_argument("--implementation-commit", required=True)
    admission.add_argument("--brain-run-id", type=int, required=True)
    admission.add_argument("--governance-run-id", type=int, required=True)
    admission.add_argument("--write", action="store_true")
    preflight = sub.add_parser("preflight")
    preflight.add_argument("--source-revision", required=True)
    execute = sub.add_parser("execute")
    execute.add_argument("--source-revision", required=True)
    execute.add_argument("--run-root", type=Path, required=True)
    execute.add_argument("--actual-execution-authorized", action="store_true")
    reconcile = sub.add_parser("reconcile")
    for command in (authority, admission, preflight, execute, reconcile):
        command.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args()
    try:
        if args.command == "initial-authority":
            issues = initial_authority_issues()
            value = {"status": "PASS" if not issues else "FAIL", "issues": list(issues), "proof_execution": "NOT-STARTED", "allocated_run_ids": [], "allocated_evidence_ids": []}
        elif args.command == "admission":
            checkpoint_ci = [
                {"workflow": "Brain integrity", "run_id": args.brain_run_id, "head_sha": args.implementation_commit, "conclusion": "success", "verification": "PUBLIC-GITHUB-ACTIONS-API", "url": "https://github.com/sharash7/Leyforge/actions/runs/" + str(args.brain_run_id)},
                {"workflow": "Engineering governance integrity", "run_id": args.governance_run_id, "head_sha": args.implementation_commit, "conclusion": "success", "verification": "PUBLIC-GITHUB-ACTIONS-API", "url": "https://github.com/sharash7/Leyforge/actions/runs/" + str(args.governance_run_id)},
            ]
            value = write_execution_admission(args.implementation_commit, checkpoint_ci) if args.write else build_execution_admission(args.implementation_commit, checkpoint_ci)
        elif args.command == "preflight":
            issues = execution_admission_issues(args.source_revision, require_initial_high_water=True)
            value = {"status": "PASS" if not issues else "FAIL", "issues": list(issues), "source_revision": args.source_revision, "proof_execution": "NOT-STARTED", "allocated_run_ids": [], "allocated_evidence_ids": []}
        elif args.command == "execute":
            value = execute_w4(args.source_revision, args.run_root, actual_execution_authorized=args.actual_execution_authorized)
        else:
            value = reconcile_w4()
        _emit(value, args.format)
        return 0 if value.get("status") in {"PASS", "COMPLETE"} else 1
    except BaseException as exc:
        value = {"status": "FAIL", "command": args.command, "error_type": type(exc).__name__, "error": str(exc)}
        _emit(value, getattr(args, "format", "text"))
        return 1
