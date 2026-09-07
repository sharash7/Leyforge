"""Command line interface for W2 readiness, admission and actual execution."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from .admission import build_manifest, write_manifest
from .execution import execute_w2, preflight_report
from .readiness import readiness_report, write_readiness


def _emit(value: object, output_format: str) -> None:
    if output_format == "json":
        print(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True))
    elif isinstance(value, dict):
        print(f"Leyforge R7 W2 {value.get('status', 'UNKNOWN')}")
        for issue in value.get("issues", []):
            print(f"- {issue}")
    else:
        print(value)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Leyforge governed R7 W2 durability/network proof runner")
    commands = parser.add_subparsers(dest="command", required=True)
    preflight = commands.add_parser("preflight")
    preflight.add_argument("--implementation-commit", required=True)
    preflight.add_argument("--static-only", action="store_true")
    preflight.add_argument("--format", choices=("text", "json"), default="text")
    readiness = commands.add_parser("readiness")
    readiness.add_argument("--implementation-commit", required=True)
    readiness.add_argument("--static-only", action="store_true")
    readiness.add_argument("--write", action="store_true")
    readiness.add_argument("--format", choices=("text", "json"), default="text")
    admission = commands.add_parser("admission")
    admission.add_argument("--implementation-commit", required=True)
    admission.add_argument("--write", action="store_true")
    admission.add_argument("--format", choices=("text", "json"), default="text")
    execute = commands.add_parser("execute")
    execute.add_argument("--source-revision", required=True)
    execute.add_argument("--run-root", type=Path, required=True)
    execute.add_argument("--retained-root", type=Path, default=Path("docs/rebuild/r7/execution-evidence"))
    execute.add_argument("--state-path", type=Path, default=Path("docs/rebuild/r7/w2-execution-state.json"))
    execute.add_argument("--actual-execution-authorized", action="store_true")
    execute.add_argument("--format", choices=("text", "json"), default="text")
    return parser


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()
    try:
        if args.command == "preflight":
            result = preflight_report(args.implementation_commit, check_local=not args.static_only)
        elif args.command == "readiness":
            result = write_readiness(args.implementation_commit, check_local=not args.static_only) if args.write else readiness_report(args.implementation_commit, check_local=not args.static_only)
        elif args.command == "admission":
            result = write_manifest(args.implementation_commit) if args.write else build_manifest(args.implementation_commit)
            result["status"] = "PASS"
        else:
            result = execute_w2(args.source_revision, args.run_root, args.retained_root, args.state_path, args.actual_execution_authorized)
        _emit(result, args.format)
        return 0 if isinstance(result, dict) and result.get("status") in {"PASS", "COMPLETE"} else 1
    except Exception as exc:
        failure = {"status": "FAIL", "command": args.command, "error": str(exc), "error_type": type(exc).__name__}
        _emit(failure, getattr(args, "format", "text"))
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
