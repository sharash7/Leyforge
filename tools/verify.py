#!/usr/bin/env python3
"""Stable build, focused-test and full-validation entrypoints for the rebuild."""

from __future__ import annotations

import argparse
import json
import os
import subprocess
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
W4_INTEGRATION_ADMISSION_MODE_ENV = "LEYFORGE_W4_INTEGRATION_ADMISSION_MODE"
W4_INTEGRATION_ADMISSION_MODES = ("preparation", "staged", "published", "auto")
W4_CORRECTION_ADMISSION_MODE_ENV = "LEYFORGE_W4_CORRECTION_ADMISSION_MODE"
W4_CORRECTION_ADMISSION_MODES = ("preparation", "staged", "published", "auto")
PROOF_HARNESS_PYTHON = sorted(
    str(path.relative_to(ROOT))
    for base in (
        ROOT / "tools" / "proof_harness",
        ROOT / "tools" / "r7_w0_runtime",
        ROOT / "tools" / "r7_w1_runtime",
        ROOT / "tools" / "r7_w2_runtime",
        ROOT / "tools" / "r7_w3_runtime",
        ROOT / "tools" / "r7_w4_runtime",
        ROOT / "tools" / "r7_w4_execution",
        ROOT / "tools" / "r7_w4_repair",
        ROOT / "tools" / "tests",
        ROOT / "proofs" / "r7" / "w1" / "runtime",
        ROOT / "proofs" / "r7" / "w2" / "runtime",
        ROOT / "proofs" / "r7" / "w3" / "runtime",
        ROOT / "proofs" / "r7" / "w4_execution",
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


def w3_implementation_commit() -> str:
    path = ROOT / "docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json"
    if path.is_file():
        value = json.loads(path.read_text(encoding="utf-8-sig"))
        commit = str(value.get("implementation_commit", ""))
        if len(commit) == 40:
            return commit
    result = subprocess.run(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True, capture_output=True)
    return result.stdout.strip()


def w3_verification_command(python: str) -> list[str]:
    state_path = ROOT / "docs/rebuild/r7/w3-execution-state.json"
    terminal_boundary = ROOT / "docs/rebuild/r7/w3-execution-boundary-execution-complete.json"
    w4_state_path = ROOT / "docs/rebuild/r7/w4-execution-state.json"
    w4_stopped_boundary = ROOT / "docs/rebuild/r7/w4-stopped-execution-boundary.json"
    if w4_state_path.is_file() and w4_stopped_boundary.is_file():
        # The clean-rebuild validator checks W3 at its exact certified snapshot
        # and W4 at the later fail-closed lifecycle timepoint.  Running the W3
        # terminal reconciler directly against a later wave's packs would
        # incorrectly reinterpret lawful subsequent evidence as W3 drift.
        return [python, "tools/verify_rebuild_boundary.py"]
    if state_path.is_file() and terminal_boundary.is_file():
        state = json.loads(state_path.read_text(encoding="utf-8-sig"))
        if state.get("package_state") == "W3-EXECUTION-COMPLETE":
            return [python, "tools/r7_w3_reconciliation.py", "verify", "--format", "json"]
    return [
        python,
        "-m",
        "tools.r7_w3_runtime",
        "preflight",
        "--implementation-commit",
        w3_implementation_commit(),
        "--static-only",
        "--format",
        "json",
    ]


def w4_implementation_commit() -> str:
    path = ROOT / "docs/rebuild/r7/w4-readiness.json"
    if path.is_file():
        value = json.loads(path.read_text(encoding="utf-8-sig"))
        commit = str(value.get("implementation_commit", ""))
        if len(commit) == 40:
            return commit
    result = subprocess.run(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True, capture_output=True)
    return result.stdout.strip()


def w4_verification_commands(
    python: str,
    integration_admission_mode: str = "auto",
    correction_admission_mode: str = "auto",
) -> list[list[str]]:
    source_boundary = ROOT / "docs/rebuild/r7/w4-governed-execution-source-boundary.json"
    execution_admission = ROOT / "docs/rebuild/r7/w4-governed-execution-admission.json"
    repair_admission = ROOT / "docs/rebuild/r7/w4-repair-admission-boundary.json"
    integration_repair_admission = ROOT / "docs/rebuild/r7/w4-integration-repair-admission-boundary.json"
    correction_admission = ROOT / "docs/rebuild/r7/w4-correction-admission-boundary.json"
    state = ROOT / "docs/rebuild/r7/w4-execution-state.json"
    head = subprocess.run(["git", "rev-parse", "HEAD"], cwd=ROOT, text=True, capture_output=True).stdout.strip()
    if source_boundary.is_file():
        source_command = [
            python, "-m", "tools.r7_w4_execution", "source-boundary",
            "--source-revision", head, "--static-only", "--format", "json",
        ]
        if not state.is_file():
            source_command.insert(-2, "--require-initial-high-water")
        commands = []
        if integration_repair_admission.is_file():
            commands.append([
                python, "-m", "tools.r7_w4_repair.integration_admission", "verify",
                "--mode", integration_admission_mode,
                "--format", "json",
            ])
        elif repair_admission.is_file():
            commands.append([
                python, "-m", "tools.r7_w4_repair.admission", "verify",
                "--source-revision", head, "--format", "json",
            ])
        if correction_admission.is_file():
            commands.append([
                python, "-m", "tools.r7_w4_repair.correction_admission", "verify",
                "--mode", correction_admission_mode,
            ])
        commands.append(source_command)
        if state.is_file():
            commands.extend([
                [python, "-m", "tools.r7_w4_execution", "reconcile", "--static-only", "--format", "json"],
                [python, "tools/r7_w4_execution_audit.py", "--phase", "terminal", "--source-revision", head, "--format", "json"],
            ])
        else:
            if execution_admission.is_file():
                commands.append([
                    python, "-m", "tools.r7_w4_execution", "preflight",
                    "--source-revision", head, "--static-only", "--format", "json",
                ])
            commands.append([
                python, "tools/r7_w4_execution_audit.py", "--phase", "source",
                "--source-revision", head, "--format", "json",
            ])
        return commands
    commit = w4_implementation_commit()
    return [
        [python, "-m", "tools.r7_w4_runtime", "verify", "--implementation-commit", commit, "--format", "json"],
        [python, "tools/r7_w4_audit.py", "--implementation-commit", commit, "--format", "json"],
    ]


def run(
    command: list[str],
    *,
    integration_admission_mode: str = "auto",
    correction_admission_mode: str = "auto",
) -> dict[str, object]:
    environment = dict(os.environ)
    environment[W4_INTEGRATION_ADMISSION_MODE_ENV] = integration_admission_mode
    environment[W4_CORRECTION_ADMISSION_MODE_ENV] = correction_admission_mode
    completed = subprocess.run(command, cwd=ROOT, text=True, capture_output=True, env=environment)
    return {
        "command": command,
        "exit_code": completed.returncode,
        "stdout": completed.stdout,
        "stderr": completed.stderr,
    }


def commands_for(
    tier: str,
    integration_admission_mode: str = "auto",
    correction_admission_mode: str = "auto",
) -> list[list[str]]:
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
        "tools/r7_w4_audit.py",
        "tools/r7_w4_execution_audit.py",
        "tools/r7_w4_repair_audit.py",
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
            w3_verification_command(python),
            *w4_verification_commands(python, integration_admission_mode, correction_admission_mode),
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
        w3_verification_command(python),
        *w4_verification_commands(python, integration_admission_mode, correction_admission_mode),
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
    parser.add_argument(
        "--w4-integration-admission-mode",
        choices=W4_INTEGRATION_ADMISSION_MODES,
        default=os.environ.get(W4_INTEGRATION_ADMISSION_MODE_ENV, "auto"),
    )
    parser.add_argument(
        "--w4-correction-admission-mode",
        choices=W4_CORRECTION_ADMISSION_MODES,
        default=os.environ.get(W4_CORRECTION_ADMISSION_MODE_ENV, "auto"),
    )
    parser.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args()
    commands = commands_for(
        args.tier,
        args.w4_integration_admission_mode,
        args.w4_correction_admission_mode,
    )
    runs = []
    for command in commands:
        result = run(
            command,
            integration_admission_mode=args.w4_integration_admission_mode,
            correction_admission_mode=args.w4_correction_admission_mode,
        )
        runs.append(result)
        if result["exit_code"] != 0:
            break
    status = "PASS" if len(runs) == len(commands) and all(item["exit_code"] == 0 for item in runs) else "FAIL"
    summary = {
        "tool": "Leyforge rebuild verification",
        "tier": args.tier,
        "status": status,
        "w4_integration_admission_mode": args.w4_integration_admission_mode,
        "w4_correction_admission_mode": args.w4_correction_admission_mode,
        "commands": runs,
        "gameplay_permission": "CLOSED",
    }
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
