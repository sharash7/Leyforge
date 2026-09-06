#!/usr/bin/env python3
"""REBUILD-00 R6 Brain-to-governance operating pilot."""

from __future__ import annotations

import argparse
import importlib.util
import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path
from typing import Any, Callable
from unittest import mock


SCRIPT_PATH = Path(__file__).resolve()
_governance_spec = importlib.util.spec_from_file_location("leyforge_governance_r6_adapter", SCRIPT_PATH.with_name("governance.py"))
assert _governance_spec and _governance_spec.loader
governance = importlib.util.module_from_spec(_governance_spec)
sys.modules[_governance_spec.name] = governance
_governance_spec.loader.exec_module(governance)
brain = governance.brain


REPO_ROOT = SCRIPT_PATH.parents[2]
EVIDENCE_PATH = REPO_ROOT / "brain/10_TESTING/Evidence/r6-brain-governance-pilot.json"
GENERATED_AT = "2026-09-06T00:00:00+08:00"
PENDING_COMMIT = "WORKTREE-PENDING-PUBLICATION"


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def run_json(command: list[str], allowed_codes: set[int] | None = None) -> tuple[int, Any]:
    completed = subprocess.run(command, cwd=REPO_ROOT, text=True, capture_output=True)
    allowed = {0} if allowed_codes is None else allowed_codes
    require(completed.returncode in allowed, completed.stderr or completed.stdout)
    try:
        payload = json.loads(completed.stdout)
    except json.JSONDecodeError as exc:
        raise AssertionError(f"command did not return JSON: {command}") from exc
    return completed.returncode, payload


def record_map() -> dict[str, Any]:
    records, diagnostics = governance.brain.discover_records()
    require(not diagnostics, f"Brain parse diagnostics: {diagnostics}")
    return {str(record.metadata.get("id")): record for record in records}


def task_a_authority_lookup() -> dict[str, Any]:
    _, authority = run_json(
        [sys.executable, "brain/92_SCRIPTS/governance.py", "query", "--text", "architecture decision", "--format", "json"]
    )
    owner = next((item for item in authority if item.get("id") == "ENG-GOV-11"), None)
    require(owner is not None, "ENG-GOV-11 was not found")
    require(owner["kind"] == "authority_source", "ENG-GOV-11 was not identified as source authority")
    require(owner["authority_role"] == "primary", "ENG-GOV-11 did not retain primary authority")
    require(owner["status"] == "theoretically_locked", "ENG-GOV-11 status was not reported from the manifest")

    _, historical = run_json(
        [sys.executable, "brain/92_SCRIPTS/brain.py", "query", "--text", "legacy POC", "--type", "source", "--format", "json"]
    )
    legacy = next((item for item in historical if item.get("id") == "SRC-LEGACY-POC-ARCHIVE"), None)
    require(legacy is not None and legacy["status"] == "historical", "legacy POC history was not returned as historical")

    records = record_map()
    old_handoff = records["HANDOFF-20260905-001"].metadata
    current_handoff = records["HANDOFF-20260906-001"].metadata
    require(old_handoff.get("superseded_by") == "HANDOFF-20260906-001", "handoff forward supersession is missing")
    require(current_handoff.get("supersedes") == "HANDOFF-20260905-001", "handoff reverse supersession is missing")
    return {
        "owning_source": owner["id"],
        "owning_status": owner["status"],
        "historical_source": legacy["id"],
        "historical_status": legacy["status"],
        "supersession": "reciprocal",
    }


def task_b_work_logging() -> dict[str, Any]:
    records = record_map()
    work = records["WORK-20260906-002"]
    task = records["TASK-20260906-002"]
    require(work.metadata.get("status") in {"active", "complete"}, "R6 Work record is not live")
    require(task.metadata.get("status") in {"active", "complete"}, "R6 Task contract is not live")
    require(task.metadata.get("risk_class") == "B", "Task risk is missing")
    require(work.metadata.get("owner"), "Work owner is missing")
    require("TASK-20260906-002" in work.metadata.get("related_to", []), "Work-to-Task link is missing")
    for heading in ("Objective", "Starting State", "Baseline Failures Reproduced", "Authority Consulted", "Work Performed", "Result", "Verification", "Remaining Work", "Handoff"):
        require(f"## {heading}" in work.body, f"Work record is missing {heading}")

    brain_next = subprocess.run(
        [sys.executable, "brain/92_SCRIPTS/brain.py", "id", "next", "TASK-20260906"],
        cwd=REPO_ROOT,
        text=True,
        capture_output=True,
    )
    require(brain_next.returncode == 0, brain_next.stderr or brain_next.stdout)
    brain_task_id = brain_next.stdout.strip()
    _, governance_task = run_json(
        [sys.executable, "brain/92_SCRIPTS/governance.py", "id", "next", "agent_task_contract", "TASK-20260906"]
    )
    _, governance_work = run_json(
        [sys.executable, "brain/92_SCRIPTS/governance.py", "id", "next", "engineering_work_log", "WORK-20260906"]
    )
    _, governance_change = run_json(
        [sys.executable, "brain/92_SCRIPTS/governance.py", "id", "next", "engineering_completion", "CHANGE-20260906"]
    )
    _, invalid_prefix = run_json(
        [sys.executable, "brain/92_SCRIPTS/governance.py", "id", "next", "agent_task_contract", "TASK"],
        allowed_codes={1},
    )
    next_ids = {
        "brain_task": brain_task_id,
        "governance_task": governance_task.get("id", ""),
        "governance_work": governance_work.get("id", ""),
        "governance_change": governance_change.get("id", ""),
    }
    patterns = {
        "brain_task": r"TASK-20260906-\d{3}",
        "governance_task": r"TASK-20260906-\d{3}",
        "governance_work": r"WORK-20260906-\d{3}",
        "governance_change": r"CHANGE-20260906-\d{3}",
    }
    for name, value in next_ids.items():
        require(bool(re.fullmatch(patterns[name], value)), f"{name} returned invalid dated ID: {value}")
    require(next_ids["brain_task"] == next_ids["governance_task"], "Brain and governance Task allocators disagree")
    require(invalid_prefix.get("status") == "FAIL", "undated governance prefix was not rejected")
    return {
        "work": "WORK-20260906-002",
        "task": "TASK-20260906-002",
        "risk_class": "B",
        "next_ids": next_ids,
        "undated_prefix": "REJECTED",
    }


def task_c_adr_trigger() -> dict[str, Any]:
    architectural_code, architectural = run_json(
        [
            sys.executable,
            "brain/92_SCRIPTS/governance.py",
            "adr-trigger",
            "--subject",
            "Replace stable record IDs with random UUIDs",
            "--risk",
            "C",
            "--architecture-impact",
            "--format",
            "json",
        ],
        allowed_codes={2},
    )
    routine_code, routine = run_json(
        [
            sys.executable,
            "brain/92_SCRIPTS/governance.py",
            "adr-trigger",
            "--subject",
            "Add backward-compatible query flag",
            "--risk",
            "B",
            "--format",
            "json",
        ]
    )
    require(architectural_code == 2 and architectural["status"] == "ADR_REQUIRED", "Class C architecture did not trigger an ADR")
    require(architectural["implementation_disposition"] == "BLOCKED_PENDING_PROPOSED_ADR", "architecture was not blocked")
    require(architectural["acceptance_authority"] != "NOT_APPLICABLE", "ADR acceptance authority was not preserved")
    require(routine_code == 0 and routine["status"] == "ADR_NOT_REQUIRED", "bounded compatibility fix was over-classified")
    return {
        "synthetic_scenario": architectural["status"],
        "synthetic_disposition": architectural["implementation_disposition"],
        "synthetic_exit_code": architectural_code,
        "actual_change": routine["status"],
        "actual_exit_code": routine_code,
        "accepted_adr_created": False,
    }


def synthetic_metadata(record_id: str, record_type: str, brain_type: str, status: str) -> dict[str, Any]:
    return {
        "brain_schema": 1,
        "id": record_id,
        "type": brain_type,
        "title": "R6 disposable pilot fixture",
        "status": status,
        "information_class": "temporary",
        "created": "2026-09-06",
        "updated": "2026-09-06",
        "authority_domain": "engineering_governance",
        "authority_role": "provisional_record",
        "authority_status": "proposed",
        "record_type": record_type,
        "governance_status": status,
        "domain": "r6_pilot",
        "risk_class": "B",
        "template_version": 1,
    }


def task_d_violation_and_waiver() -> dict[str, Any]:
    invalid_meta = synthetic_metadata("ADR-9008", "architecture_decision", "adr", "buried")
    invalid_meta["reconstructed"] = False
    invalid = governance.brain.Record(
        governance.BRAIN_ROOT / "99_ARCHIVE/ADR-9008.md", invalid_meta, "# Disposable invalid ADR\n"
    )
    violation_codes = {item["code"] for item in governance.validate_records([invalid])}
    require("GOV-E024" in violation_codes, "invalid governance status was not detected")

    waiver_meta = synthetic_metadata("WAIVER-9008", "waiver", "deviation", "active")
    waiver_meta["governing_rules"] = ["EG14-001"]
    invalid_waiver = governance.brain.Record(
        governance.BRAIN_ROOT / "99_ARCHIVE/WAIVER-9008.md", waiver_meta, "# Disposable invalid waiver\n"
    )
    invalid_waiver_codes = {item["code"] for item in governance.validate_records([invalid_waiver])}
    require("GOV-E033" in invalid_waiver_codes, "unbounded active waiver was not rejected")

    valid_meta = dict(waiver_meta)
    valid_meta["expires"] = "reconsider-at-R7"
    valid_meta["exit_condition"] = "Remove the simulated exception after the pilot"
    valid_waiver = governance.brain.Record(
        governance.BRAIN_ROOT / "99_ARCHIVE/WAIVER-9008-valid.md", valid_meta, "# Disposable valid waiver\n"
    )
    valid_waiver_codes = {item["code"] for item in governance.validate_records([valid_waiver])}
    require("GOV-E033" not in valid_waiver_codes and "GOV-E034" not in valid_waiver_codes, "bounded waiver route failed")

    debt = record_map()["GOV-DEBT-0007"].metadata
    require(debt.get("governance_status") in {"active_verifying", "closed"}, "operator gap is not governance debt")
    return {
        "violation_diagnostic": "GOV-E024",
        "unbounded_waiver_diagnostic": "GOV-E033",
        "bounded_waiver": "PASS",
        "gap_record": "GOV-DEBT-0007",
    }


def task_e_reusable_procedure() -> dict[str, Any]:
    procedure = record_map()["PROC-BRAIN-GOVERNANCE-PILOT"]
    require(procedure.metadata.get("type") == "procedure", "pilot knowledge was not stored as a Procedure")
    require(procedure.metadata.get("authority_role") == "implementation_record", "Procedure claimed source authority")
    require(procedure.metadata.get("status") in {"testing", "validated"}, "Procedure lifecycle is invalid")
    require("WORK-20260906-002" in procedure.metadata.get("related_to", []), "Procedure is not linked to its Work discovery")
    return {"procedure": "PROC-BRAIN-GOVERNANCE-PILOT", "authority_role": "implementation_record"}


def task_f_stale_summary() -> dict[str, Any]:
    with tempfile.TemporaryDirectory(prefix=".r6-index-pilot-", dir=REPO_ROOT) as temporary:
        temp_root = Path(temporary)
        with mock.patch.object(brain, "INDEX_ROOT", temp_root):
            outputs = brain.expected_index_outputs()
            stale_path = sorted(outputs)[0]
            stale_path.parent.mkdir(parents=True, exist_ok=True)
            stale_path.write_text("R6 STALE SUMMARY FIXTURE\n", encoding="utf-8")
            clean_before, drift = brain.run_index(False)
            require(not clean_before and stale_path.relative_to(REPO_ROOT).as_posix() in drift, "stale summary was not detected")
            write_ok, changed = brain.run_index(True)
            require(write_ok and changed, "index regeneration did not run")
            clean_after, remaining = brain.run_index(False)
            require(clean_after and not remaining, "generated summaries were not repaired")
            require(stale_path.read_text(encoding="utf-8-sig") == outputs[stale_path], "owning records did not win")
    return {"stale_detected": True, "repair": "PASS", "source_of_truth": "validated Brain records"}


def task_g_legacy_boundary() -> dict[str, Any]:
    legacy = record_map()["SRC-LEGACY-POC-ARCHIVE"]
    require(legacy.metadata.get("status") == "historical", "legacy archive is not historical")
    require((REPO_ROOT / legacy.metadata["evidence_path"]).is_file(), "archive evidence is missing")
    require(legacy.metadata.get("source_commit") == "799305859bb0ba4230ef87d934e961cc21220afa", "legacy commit drifted")
    require("must not be copied forward automatically" in legacy.body, "copy-forward prohibition is missing")
    require("legacy reintroduction gate" in legacy.body, "legacy reuse was not routed through its gate")

    _, current = run_json(
        [sys.executable, "brain/92_SCRIPTS/brain.py", "query", "--id", "DOC-REBUILD-00", "--format", "json"]
    )
    require(len(current) == 1, "current legacy-boundary authority was not resolved")
    authority = current[0]
    require(authority.get("authority_domain") == "project_control", "legacy gate owner is not project control")
    canonical_path = str(authority.get("canonical_path", ""))
    require(canonical_path.endswith("REBUILD-00_Leyforge_Legacy_POC_Archive_Clean_Rebuild_and_Brain_Governance_Bootstrap_Handoff_v0.1.md"), "legacy gate canonical source is missing")
    require((REPO_ROOT / canonical_path).is_file(), "legacy gate canonical source cannot be opened")
    require(not (REPO_ROOT / "project.godot").exists(), "a gameplay runtime appeared")
    return {
        "legacy_source": "SRC-LEGACY-POC-ARCHIVE",
        "classification": "historical",
        "current_authority": authority["id"],
        "current_authority_status": authority.get("source_status"),
        "automatic_copy_forward": "REJECTED",
        "gameplay_permission": "CLOSED",
    }


PILOT_TASKS: list[tuple[str, str, Callable[[], dict[str, Any]]]] = [
    ("A", "Authority lookup", task_a_authority_lookup),
    ("B", "Work logging", task_b_work_logging),
    ("C", "ADR trigger recognition", task_c_adr_trigger),
    ("D", "Governance violation and waiver routing", task_d_violation_and_waiver),
    ("E", "Reusable Procedure promotion", task_e_reusable_procedure),
    ("F", "Stale Brain summary repair", task_f_stale_summary),
    ("G", "Legacy boundary", task_g_legacy_boundary),
]


def current_head() -> str:
    completed = subprocess.run(["git", "rev-parse", "HEAD"], cwd=REPO_ROOT, text=True, capture_output=True)
    return completed.stdout.strip() if completed.returncode == 0 else ""


def parsed_command_output(
    payload: dict[str, Any], script: str, required_tokens: tuple[str, ...] = ()
) -> dict[str, Any]:
    for run in payload.get("commands", []):
        command = run.get("command", [])
        if script not in command or not all(token in command for token in required_tokens):
            continue
        try:
            return json.loads(str(run.get("stdout", "")))
        except json.JSONDecodeError:
            continue
    return {}


def run_full_verification() -> dict[str, Any]:
    command = [sys.executable, "tools/verify.py", "--tier", "full", "--format", "json"]
    completed = subprocess.run(command, cwd=REPO_ROOT, text=True, capture_output=True)
    try:
        payload = json.loads(completed.stdout)
    except json.JSONDecodeError:
        return {
            "status": "FAIL",
            "command": " ".join(command),
            "exit_code": completed.returncode,
            "error": completed.stderr.strip() or completed.stdout.strip() or "verification returned no JSON",
        }

    test_run = next(
        (run for run in payload.get("commands", []) if "unittest" in run.get("command", [])),
        {},
    )
    test_match = re.search(r"Ran\s+(\d+)\s+tests", str(test_run.get("stderr", "")))
    brain_doctor = parsed_command_output(payload, "brain/92_SCRIPTS/brain.py", ("doctor", "certification"))
    governance_doctor = parsed_command_output(payload, "brain/92_SCRIPTS/governance.py", ("doctor", "certification"))
    boundary = parsed_command_output(payload, "tools/verify_rebuild_boundary.py")
    return {
        "status": payload.get("status", "FAIL"),
        "command": " ".join(command),
        "exit_code": completed.returncode,
        "command_count": len(payload.get("commands", [])),
        "acceptance_tests": int(test_match.group(1)) if test_match else 0,
        "brain_doctor": {
            "status": brain_doctor.get("status", "UNKNOWN"),
            "records": brain_doctor.get("records", 0),
            "diagnostics": brain_doctor.get("diagnostics", {}),
        },
        "governance_doctor": {
            "status": governance_doctor.get("status", "UNKNOWN"),
            "authority_sources": governance_doctor.get("authority_sources", 0),
            "records": governance_doctor.get("records", 0),
            "templates": governance_doctor.get("templates", 0),
            "diagnostics": governance_doctor.get("diagnostics", {}),
        },
        "clean_rebuild_boundary": {
            "status": boundary.get("status", "UNKNOWN"),
            "checks": boundary.get("checks", 0),
            "controlled_sources": boundary.get("source_documents", 0),
            "active_poc_dependencies": boundary.get("active_poc_dependencies", -1),
        },
    }


def evaluate(commit: str = PENDING_COMMIT) -> dict[str, Any]:
    tasks = []
    for code, title, function in PILOT_TASKS:
        try:
            details = function()
            tasks.append({"code": code, "title": title, "status": "PASS", "details": details})
        except Exception as exc:
            tasks.append({"code": code, "title": title, "status": "FAIL", "details": {"error": str(exc)}})
    head = current_head()
    commit_matches_head = None if commit == PENDING_COMMIT else commit == head
    passed = all(item["status"] == "PASS" for item in tasks) and commit_matches_head is not False
    return {
        "receipt_version": 1,
        "gate": "R6",
        "profile": "brain_governance_operating_pilot",
        "generated_at": GENERATED_AT,
        "commit": commit,
        "head_commit": head,
        "commit_matches_head": commit_matches_head,
        "result": "PASS" if passed else "FAIL",
        "tasks": tasks,
        "pass_count": sum(item["status"] == "PASS" for item in tasks),
        "task_count": len(tasks),
        "governance_debt": "GOV-DEBT-0007",
        "procedure": "PROC-BRAIN-GOVERNANCE-PILOT",
        "gameplay_permission": "CLOSED",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Run the REBUILD-00 R6 Brain-to-governance pilot")
    mode = parser.add_mutually_exclusive_group(required=True)
    mode.add_argument("--check", action="store_true")
    mode.add_argument("--write", action="store_true")
    parser.add_argument("--commit", default=PENDING_COMMIT)
    args = parser.parse_args()
    receipt = evaluate(args.commit)
    if args.write:
        receipt["full_verification"] = run_full_verification()
        if receipt["full_verification"]["status"] != "PASS":
            receipt["result"] = "FAIL"
        governance.write_if_changed(EVIDENCE_PATH, json.dumps(receipt, indent=2, ensure_ascii=False) + "\n")
    print(json.dumps(receipt, indent=2, ensure_ascii=True))
    return 0 if receipt["result"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
