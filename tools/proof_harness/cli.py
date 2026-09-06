"""Command-line inspection and validation surfaces for the W0 harness."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any, Dict, Sequence

from .architecture import load_config, scan
from .manifests import ArtifactManifest, BuildManifest
from .readiness import load as load_readiness
from .readiness import report as readiness_report

ROOT = Path(__file__).resolve().parents[2]
PACKAGE_ROOT = Path(__file__).resolve().parent
DEFAULT_RULES = PACKAGE_ROOT / "architecture-rules.json"
DEFAULT_READINESS = PACKAGE_ROOT / "w0-readiness.json"


def _load_json(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(value, dict):
        raise ValueError("manifest root must be an object")
    return value


def _emit(value: Dict[str, Any], output_format: str) -> None:
    if output_format == "json":
        print(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True))
        return
    print("%s: %s" % (value.get("tool", "proof harness"), value.get("status", "UNKNOWN")))
    for issue in value.get("issues", []):
        print("- %s" % issue)
    for violation in value.get("violations", []):
        print("- {file}:{line} {rule_id}: {reason}".format(**violation))


def command_self_check(args: argparse.Namespace) -> int:
    lint = scan(ROOT / "tools", load_config(DEFAULT_RULES))
    readiness = readiness_report(load_readiness(DEFAULT_READINESS))
    issues = []
    if lint["status"] != "PASS":
        issues.append("architecture lint failed")
    if readiness["status"] != "PASS":
        issues.append("W0 readiness manifest failed validation")
    if readiness["allocated_run_ids"] or readiness["allocated_evidence_ids"]:
        issues.append("bootstrap unexpectedly allocated proof identities")
    result = {
        "tool": "Leyforge R7 W0 harness self-check",
        "status": "PASS" if not issues else "FAIL",
        "gameplay_permission": "CLOSED",
        "proof_execution": "NOT-STARTED",
        "issues": issues,
        "architecture": lint,
        "readiness": readiness,
    }
    _emit(result, args.format)
    return 0 if result["status"] == "PASS" else 1


def command_lint(args: argparse.Namespace) -> int:
    result = scan(Path(args.source_root), load_config(Path(args.rules)))
    _emit(result, args.format)
    return 0 if result["status"] == "PASS" else 1


def command_readiness(args: argparse.Namespace) -> int:
    result = readiness_report(load_readiness(Path(args.manifest)))
    _emit(result, args.format)
    return 0 if result["status"] == "PASS" else 1


def command_build(args: argparse.Namespace) -> int:
    manifest = BuildManifest.from_dict(_load_json(Path(args.manifest)))
    issues = manifest.issues(for_execution=args.for_execution)
    result = {
        "tool": "Leyforge W0 build manifest validation",
        "status": "PASS" if not issues else "FAIL",
        "build_identity": manifest.build_identity,
        "for_execution": args.for_execution,
        "issues": issues,
    }
    _emit(result, args.format)
    return 0 if not issues else 1


def command_artifact(args: argparse.Namespace) -> int:
    build = BuildManifest.from_dict(_load_json(Path(args.build)))
    artifact = ArtifactManifest.from_dict(_load_json(Path(args.artifact)))
    issues = artifact.evidence_eligibility_issues(build) if args.for_execution else artifact.integrity_issues(build)
    result = {
        "tool": "Leyforge W0 artifact manifest validation",
        "status": "PASS" if not issues else "FAIL",
        "build_identity": build.build_identity,
        "artifact_sha256": artifact.artifact_sha256,
        "for_execution": args.for_execution,
        "issues": issues,
    }
    _emit(result, args.format)
    return 0 if not issues else 1


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Leyforge PRD-07 W0 proof harness")
    sub = parser.add_subparsers(dest="command", required=True)

    self_check = sub.add_parser("self-check", help="validate bootstrap contracts without executing a proof")
    self_check.add_argument("--format", choices=("text", "json"), default="text")
    self_check.set_defaults(func=command_self_check)

    lint = sub.add_parser("lint", help="run read-only dependency lint")
    lint.add_argument("--rules", default=str(DEFAULT_RULES))
    lint.add_argument("--source-root", default=str(ROOT / "tools"))
    lint.add_argument("--format", choices=("text", "json"), default="text")
    lint.set_defaults(func=command_lint)

    readiness = sub.add_parser("readiness", help="validate and display W0 prerequisite state")
    readiness.add_argument("--manifest", default=str(DEFAULT_READINESS))
    readiness.add_argument("--format", choices=("text", "json"), default="text")
    readiness.set_defaults(func=command_readiness)

    build = sub.add_parser("validate-build", help="validate a build manifest")
    build.add_argument("--manifest", required=True)
    build.add_argument("--for-execution", action="store_true")
    build.add_argument("--format", choices=("text", "json"), default="text")
    build.set_defaults(func=command_build)

    artifact = sub.add_parser("validate-artifact", help="validate artifact integrity or execution eligibility")
    artifact.add_argument("--build", required=True)
    artifact.add_argument("--artifact", required=True)
    artifact.add_argument("--for-execution", action="store_true")
    artifact.add_argument("--format", choices=("text", "json"), default="text")
    artifact.set_defaults(func=command_artifact)
    return parser


def main(argv: Sequence[str] = None) -> int:
    args = build_parser().parse_args(argv)
    try:
        return int(args.func(args))
    except (OSError, ValueError, KeyError, json.JSONDecodeError) as exc:
        result = {"tool": "Leyforge R7 W0 proof harness", "status": "FAIL", "issues": [str(exc)]}
        _emit(result, getattr(args, "format", "text"))
        return 1
