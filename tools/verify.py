#!/usr/bin/env python3
"""Stable build, focused-test and full-validation entrypoints for the rebuild."""

from __future__ import annotations

import argparse
import json
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
PROOF_HARNESS_PYTHON = sorted(
    str(path.relative_to(ROOT))
    for base in (
        ROOT / "tools" / "proof_harness",
        ROOT / "tools" / "r7_w0_runtime",
        ROOT / "tools" / "r7_w1_runtime",
        ROOT / "tools" / "r7_w2_runtime",
        ROOT / "tools" / "tests",
        ROOT / "proofs" / "r7" / "w1" / "runtime",
        ROOT / "proofs" / "r7" / "w2" / "runtime",
    )
    for path in base.rglob("*.py")
)


def w1_implementation_commit() -> str:
    path = ROOT / "docs/rebuild/r7/w1-readiness.json"
    if path.is_file():
        value = json.loads(path.read_text(encoding="utf-8-sig"))
        commit = str(value.get("implementation_commit", ""))
        if len(commit) == 40:
            return commit
    result = subprocess.run(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True, capture_output=True)
    return result.stdout.strip()


def w2_implementation_commit() -> str:
    path = ROOT / "docs/rebuild/r7/w2-readiness.json"
    if path.is_file():
        value = json.loads(path.read_text(encoding="utf-8-sig"))
        commit = str(value.get("implementation_commit", ""))
        if len(commit) == 40:
            return commit
    result = subprocess.run(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True, capture_output=True)
    return result.stdout.strip()


def run(command: list[str]) -> dict[str, object]:
    completed = subprocess.run(command, cwd=ROOT, text=True, capture_output=True)
    return {
        "command": command,
        "exit_code": completed.returncode,
        "stdout": completed.stdout,
        "stderr": completed.stderr,
    }


def commands_for(tier: str) -> list[list[str]]:
    python = sys.executable
    compile_command = [
        python,
        "-m",
        "py_compile",
        "brain/92_SCRIPTS/brain.py",
        "brain/92_SCRIPTS/governance.py",
        "brain/92_SCRIPTS/r6_pilot.py",
        "brain/92_SCRIPTS/tests/test_brain.py",
        "brain/92_SCRIPTS/tests/test_governance.py",
        "brain/92_SCRIPTS/tests/test_r6_pilot.py",
        "tools/verify.py",
        "tools/verify_rebuild_boundary.py",
    ] + PROOF_HARNESS_PYTHON
    if tier == "build":
        return [compile_command]
    if tier == "focused":
        return [
            compile_command,
            [python, "brain/92_SCRIPTS/tests/test_governance.py", "-v"],
            [python, "brain/92_SCRIPTS/tests/test_r6_pilot.py", "-v"],
            [python, "-m", "unittest", "discover", "tools/tests", "-v"],
            [python, "-m", "tools.proof_harness", "self-check", "--format", "json"],
            [python, "-m", "tools.r7_w0_runtime", "preflight", "--static-only", "--format", "json"],
            [python, "-m", "tools.r7_w1_runtime", "preflight", "--implementation-commit", w1_implementation_commit(), "--static-only", "--format", "json"],
            [python, "-m", "tools.r7_w2_runtime", "preflight", "--implementation-commit", w2_implementation_commit(), "--static-only", "--format", "json"],
            [python, "brain/92_SCRIPTS/governance.py", "doctor", "--profile", "full", "--format", "json"],
        ]
    return [
        compile_command,
        [python, "-m", "unittest", "discover", "brain/92_SCRIPTS/tests", "-v"],
        [python, "-m", "unittest", "discover", "tools/tests", "-v"],
        [python, "-m", "tools.proof_harness", "self-check", "--format", "json"],
        [python, "-m", "tools.r7_w0_runtime", "preflight", "--static-only", "--format", "json"],
        [python, "-m", "tools.r7_w1_runtime", "preflight", "--implementation-commit", w1_implementation_commit(), "--static-only", "--format", "json"],
        [python, "-m", "tools.r7_w2_runtime", "preflight", "--implementation-commit", w2_implementation_commit(), "--static-only", "--format", "json"],
        [python, "brain/92_SCRIPTS/brain.py", "ingest", "--check"],
        [python, "brain/92_SCRIPTS/brain.py", "index", "--check"],
        [python, "brain/92_SCRIPTS/brain.py", "links", "--format", "json"],
        [python, "brain/92_SCRIPTS/brain.py", "doctor", "--profile", "certification", "--format", "json"],
        [python, "brain/92_SCRIPTS/governance.py", "doctor", "--profile", "certification", "--format", "json"],
        [python, "brain/92_SCRIPTS/r6_pilot.py", "--check"],
        [python, "tools/verify_rebuild_boundary.py"],
    ]


def main() -> int:
    parser = argparse.ArgumentParser(description="Leyforge rebuild verification")
    parser.add_argument("--tier", choices=("build", "focused", "full"), required=True)
    parser.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args()
    runs = []
    for command in commands_for(args.tier):
        result = run(command)
        runs.append(result)
        if result["exit_code"] != 0:
            break
    status = "PASS" if len(runs) == len(commands_for(args.tier)) and all(item["exit_code"] == 0 for item in runs) else "FAIL"
    summary = {"tool": "Leyforge rebuild verification", "tier": args.tier, "status": status, "commands": runs, "gameplay_permission": "CLOSED"}
    if args.format == "json":
        print(json.dumps(summary, indent=2, ensure_ascii=True))
    else:
        print(f"Leyforge rebuild verification {status} ({args.tier})")
        for result in runs:
            print(f"[{result['exit_code']}] {' '.join(result['command'])}")
            if result["stdout"]:
                print(str(result["stdout"]).rstrip())
            if result["stderr"]:
                print(str(result["stderr"]).rstrip(), file=sys.stderr)
    return 0 if status == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
