"""Command-line interface for the governed R7 W0 proof-only runtime."""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

from .architecture import lint
from .admission import build_manifest, write_manifest
from .execution import execute_w0, preflight_report


def _emit(value: object, output_format: str) -> None:
    if output_format == "json":
        print(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True))
    else:
        if isinstance(value, dict):
            print(f"Leyforge R7 W0 {value.get('status', 'UNKNOWN')}")
            for issue in value.get("issues", []):
                print(f"- {issue}")
        else:
            print(value)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Leyforge governed R7 W0 dependency/export proof runner")
    subparsers = parser.add_subparsers(dest="command", required=True)
    preflight = subparsers.add_parser("preflight", help="validate dependency lock and proof-runtime boundaries")
    preflight.add_argument("--static-only", action="store_true", help="do not require ignored local dependency artifacts")
    preflight.add_argument("--format", choices=("text", "json"), default="text")
    architecture = subparsers.add_parser("architecture-lint", help="run the governed proof-runtime architecture lint")
    architecture.add_argument("--format", choices=("text", "json"), default="text")
    admission = subparsers.add_parser("admission", help="write the exact bounded admission manifest")
    admission.add_argument("--implementation-commit", required=True)
    admission.add_argument("--write", action="store_true")
    admission.add_argument("--format", choices=("text", "json"), default="text")
    execute = subparsers.add_parser("execute", help="run and retain the real thirteen-proof W0 programme")
    execute.add_argument("--source-revision", required=True)
    execute.add_argument("--run-root", type=Path, required=True)
    execute.add_argument("--retained-root", type=Path, default=Path("docs/rebuild/r7/execution-evidence"))
    execute.add_argument("--state-path", type=Path, default=Path("docs/rebuild/r7/w0-execution-state.json"))
    execute.add_argument("--actual-execution-authorized", action="store_true")
    execute.add_argument("--format", choices=("text", "json"), default="text")
    return parser


def main() -> int:
    parser = build_parser()
    args = parser.parse_args()
    try:
        if args.command == "preflight":
            result = preflight_report(check_local=not args.static_only)
        elif args.command == "architecture-lint":
            result = lint()
        elif args.command == "admission":
            result = (
                write_manifest(args.implementation_commit)
                if args.write
                else build_manifest(args.implementation_commit)
            )
            result["status"] = "PASS"
        else:
            result = execute_w0(
                source_revision=args.source_revision,
                run_root=args.run_root,
                retained_root=args.retained_root,
                state_path=args.state_path,
                actual_execution_authorized=args.actual_execution_authorized,
            )
        _emit(result, args.format)
        status = result.get("status") if isinstance(result, dict) else None
        return 0 if status in {"PASS", "COMPLETE"} else 1
    except Exception as exc:
        failure = {"status": "FAIL", "command": args.command, "error": str(exc), "error_type": type(exc).__name__}
        _emit(failure, getattr(args, "format", "text"))
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
