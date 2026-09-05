"""Summarize existing REBUILD-00 evidence and propose, never stage, freeze paths."""

import collections
import csv
import hashlib
import json
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[3]
HERE = Path(__file__).resolve().parent
EVIDENCE = HERE / "2026-09-05"
REBUILD = ".summer/00_Docs/Additional/REBUILD-00_Leyforge_Legacy_POC_Archive_Clean_Rebuild_and_Brain_Governance_Bootstrap_Handoff_v0.1.md"


def read(name):
    return json.loads((EVIDENCE / name).read_text(encoding="utf-8-sig"))


def write(name, value):
    (EVIDENCE / name).write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def payloads(text):
    values = []
    for line in text.splitlines():
        start = line.find("{")
        if start < 0:
            continue
        try:
            value = json.loads(line[start:])
        except ValueError:
            continue
        if isinstance(value, dict) and "checks" in value:
            values.append(value)
    return values


def main():
    if read("remaining-probes-result.json")["completed"] != 56:
        raise RuntimeError("Do not finalize before all remaining probes have a result")
    official = (EVIDENCE / "current-regression.log").read_text(encoding="utf-8-sig")
    records = []
    for scene, expected, segment in re.findall(r"Running (res://[^\r\n ]+) \(expected checks=(\d+)\)(.*?)(?=\nRunning res://|\Z)", official, re.S):
        values = payloads(segment)
        if len(values) != 1:
            raise RuntimeError("Unexpected official-gate result shape: " + scene)
        value = values[0]
        records.append({"scene": scene, "expected_checks": int(expected), "actual_checks": value["checks"],
                        "exit_code": 0 if value["ok"] else 1, "pass": bool(value["ok"]) and value["checks"] == int(expected),
                        "blocking_diagnostics": [], "payloads": values, "log": "current-regression.log"})
    if len(records) != 2:
        raise RuntimeError("Review changed official-gate stop point")
    for row in read("remaining-probes.json"):
        # Parse raw JSON independent of key order; NPC diagnostics precede checks.
        row["payloads"] = payloads((EVIDENCE / row["log"]).read_text(encoding="utf-8-sig"))
        records.append(row)
    for row in records:
        row["assertion_failures"] = [failure for value in row["payloads"] for failure in value.get("failures", [])]
        reasons = []
        if row["assertion_failures"] or any(not v.get("ok", False) for v in row["payloads"]):
            reasons.append("probe_assertion_failure")
        if row["actual_checks"] is not None and row["actual_checks"] != row["expected_checks"]:
            reasons.append("pinned_check_count_mismatch")
        if row["blocking_diagnostics"]:
            reasons.append("blocking_engine_content_or_teardown_diagnostic")
        if row["exit_code"] != 0:
            reasons.append("nonzero_process_exit")
        if not row["payloads"]:
            reasons.append("missing_structured_payload")
        row["failure_classes"] = reasons
    summary = {
        "official_current_regression_gate": "FAIL",
        "diagnostic_scene_count": len(records), "strict_gate_passes": sum(r["pass"] for r in records),
        "strict_gate_failures": sum(not r["pass"] for r in records),
        "reported_checks": sum(r["actual_checks"] or 0 for r in records),
        "pinned_expected_checks": sum(r["expected_checks"] for r in records),
        "assertion_failure_scenes": sum(bool(r["assertion_failures"]) for r in records),
        "count_mismatch_scenes": sum("pinned_check_count_mismatch" in r["failure_classes"] for r in records),
        "blocking_diagnostic_scenes": sum(bool(r["blocking_diagnostics"]) for r in records),
        "static_checks": read("static-checks.json"), "scenes": records,
        "qualification": "Observed dirty working-state snapshot only; no final-commit or manual acceptance claim.",
    }
    write("verification-summary.json", summary)
    inv = read("file-inventory.json")
    drift, candidate = [], []
    for row in inv:
        path = ROOT / row["path"]
        actual = hashlib.sha256(path.read_bytes()).hexdigest() if path.is_file() else None
        if row["exists"]:
            if actual != row["sha256"] and row["path"] != REBUILD:
                drift.append(row["path"])
        elif path.exists():
            drift.append(row["path"])
        if row["git_status"] == "  ":
            continue
        action = "propose_stage"
        rationale = "preserve_current_poc_source_or_supplied_source_corpus"
        if row["git_status"] == " D":
            action, rationale = "propose_stage_deletion", "content_relocation_verified_original_blob_preserved"
        elif not row["tracked"] and row["path"].startswith(".trae/"):
            action, rationale = "supplement_only", "historical_planning_copied_not_current_authority"
        elif not row["tracked"] and row["path"].endswith(".TMP"):
            action, rationale = "supplement_only", "atomic_recovery_file_in_working_state_zip"
        elif row["path"].startswith(".vscode/"):
            action, rationale = "inventory_only", "machine_local_editor_setting"
        candidate.append({"path": row["path"], "initial_git_status": row["git_status"], "action": action,
                          "rationale": rationale, "current_sha256": actual, "captured_sha256": row.get("sha256"),
                          "original_git_blob": row.get("git_blob")})
    write("freeze-candidate.json", {
        "status": "PROPOSED_NOT_STAGED", "base_commit": read("baseline.json")["head"],
        "suggested_task_branch": "codex/chore/rebuild-00-freeze",
        "suggested_commit_message": "chore(archive): capture final legacy POC state and rebuild preflight evidence",
        "preexisting_path_actions": dict(collections.Counter(r["action"] for r in candidate)),
        "paths": candidate,
        "assessment_evidence_scope": ".summer/verification/rebuild_00/ (inspect evidence manifest; excludes .local captures and player-state bytes)",
        "allowed_post_capture_change": {"path": REBUILD, "purpose": "execution-record/checklist annotation only; captured original retained"},
        "other_preexisting_source_drift": drift,
        "permission": "No staging, commit, tag, push or branch mutation performed by this script.",
    })
    with (EVIDENCE / "freeze-candidate.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(candidate[0]))
        writer.writeheader()
        writer.writerows(candidate)
    print(json.dumps({k: summary[k] for k in ("diagnostic_scene_count", "strict_gate_passes", "strict_gate_failures", "reported_checks", "pinned_expected_checks", "assertion_failure_scenes", "count_mismatch_scenes", "blocking_diagnostic_scenes")}, indent=2))
    print(json.dumps({"freeze_actions": dict(collections.Counter(r["action"] for r in candidate)), "unexpected_source_drift": drift}, indent=2))
    if drift:
        raise RuntimeError("Unexpected source drift must be reconciled before final freeze review")


if __name__ == "__main__":
    main()
