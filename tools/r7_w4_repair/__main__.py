from __future__ import annotations

import argparse
import json
from pathlib import Path

from .human_review import write_review_package
from .recertification import run_recertification
from .readiness import build_rerun_readiness, rerun_plan


def main() -> int:
    parser = argparse.ArgumentParser(description="Leyforge W4 measurement repair tooling")
    sub = parser.add_subparsers(dest="command", required=True)
    review = sub.add_parser("write-review-package")
    review.add_argument("--output", required=True)
    recertify = sub.add_parser("recertify")
    recertify.add_argument("--source-revision", required=True)
    recertify.add_argument("--run-root", required=True)
    recertify.add_argument("--output", required=True)
    plan = sub.add_parser("write-rerun-plan")
    plan.add_argument("--output", required=True)
    readiness = sub.add_parser("write-readiness")
    readiness.add_argument("--source-revision", required=True)
    readiness.add_argument("--recertification", required=True)
    readiness.add_argument("--output", required=True)
    args = parser.parse_args()
    if args.command == "write-review-package":
        paths = write_review_package(Path(args.output))
        print(json.dumps({"status": "PASS", "paths": [str(path) for path in paths]}, indent=2))
        return 0
    if args.command == "recertify":
        value = run_recertification(args.source_revision, Path(args.run_root))
        output = Path(args.output)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        print(json.dumps({"status": value["state"], "checks": value["check_total"], "output": str(output)}, indent=2))
        return 0 if value["state"] == "PASS" else 1
    if args.command == "write-rerun-plan":
        output = Path(args.output)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(rerun_plan(), indent=2, sort_keys=True) + "\n", encoding="utf-8")
        print(json.dumps({"status": "PASS", "output": str(output)}, indent=2))
        return 0
    if args.command == "write-readiness":
        recertification = json.loads(Path(args.recertification).read_text(encoding="utf-8-sig"))
        value = build_rerun_readiness(args.source_revision, recertification)
        output = Path(args.output)
        output.parent.mkdir(parents=True, exist_ok=True)
        output.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
        print(json.dumps({"status": value["state"], "issues": value["issues"], "output": str(output)}, indent=2))
        return 0 if value["state"].startswith("READY-") else 1
    raise AssertionError(args.command)


if __name__ == "__main__":
    raise SystemExit(main())
