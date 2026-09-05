#!/usr/bin/env python3
"""Leyforge Branch B engineering-governance CLI.

This is a Python-standard-library implementation layer for ENG-GOV and B-OPS.
The canonical source documents remain authoritative; this tool validates their
installation, the operational records that apply them, and their Brain links.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import subprocess
import sys
from datetime import date
from pathlib import Path
from typing import Any


TOOL_VERSION = "0.1.0"
GENERATED_AT = "2026-09-06T00:00:00+08:00"
SCRIPT_PATH = Path(__file__).resolve()
BRAIN_ROOT = SCRIPT_PATH.parents[1]
REPO_ROOT = BRAIN_ROOT.parent
SCHEMA_PATH = BRAIN_ROOT / "91_SCHEMA" / "governance.schema.json"
MANIFEST_PATH = BRAIN_ROOT / "00_CONTROL" / "governance-manifest.json"
TEMPLATE_ROOT = BRAIN_ROOT / "90_TEMPLATES" / "Governance"
SOURCE_ROOT = REPO_ROOT / ".summer" / "00_Docs" / "B-ENG-GOV+B-OPS"
TEMPLATE_SOURCE = SOURCE_ROOT / "B-OPS" / "B-OPS-03_Leyforge_Engineering_Governance_Templates_Pack_v0.1.md"

_brain_spec = importlib.util.spec_from_file_location("leyforge_brain_governance_adapter", SCRIPT_PATH.with_name("brain.py"))
assert _brain_spec and _brain_spec.loader
brain = importlib.util.module_from_spec(_brain_spec)
sys.modules[_brain_spec.name] = brain
_brain_spec.loader.exec_module(brain)


TEMPLATE_NAMES = {
    "01": "Architecture Decision Record.md",
    "02": "Waiver Exception.md",
    "03": "Deprecation.md",
    "04": "Temporary Constraint Quarantine.md",
    "05": "Dependency Record.md",
    "06": "Benchmark Record.md",
    "07": "Engineering Work Log.md",
    "08": "Skill Procedure Shortcut.md",
    "09": "Failure Antipattern.md",
    "10": "Governance Debt Record.md",
    "11": "Engineering Change Completion Report.md",
    "12": "Agent Task Contract.md",
}

SOURCE_STATUS = {
    **{f"ENG-GOV-{number:02d}": "theoretically_locked" for number in range(16)},
    **{f"B-OPS-{number:02d}": "operational_baseline" for number in range(6)},
    "B-OPS-06": "certified",
}


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def write_if_changed(path: Path, content: str) -> bool:
    if path.exists() and path.read_text(encoding="utf-8-sig") == content:
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    return True


def diagnostic(severity: str, code: str, path: str, message: str) -> dict[str, str]:
    return {"severity": severity, "code": code, "path": path, "message": message}


def as_list(value: Any) -> list[str]:
    if value is None:
        return []
    if isinstance(value, list):
        return [str(item) for item in value]
    return [str(value)]


def missing(value: Any) -> bool:
    return value is None or value == "" or value == [] or value == ()


def source_id(path: Path) -> str | None:
    match = re.match(r"(ENG-GOV-(?:0[0-9]|1[0-5])|B-OPS-0[0-6])_", path.name)
    return match.group(1) if match else None


def first_heading(text: str, fallback: str) -> str:
    for line in text.splitlines():
        if line.startswith("# "):
            return re.sub(r"\s+", " ", line[2:].strip())
    return fallback


def rule_ids(text: str) -> list[str]:
    return sorted(set(re.findall(r"\b(?:EG\d{2}|BOP\d{2})-\d{3}\b", text)))


def authority_sources() -> list[dict[str, Any]]:
    found: list[dict[str, Any]] = []
    for path in sorted(SOURCE_ROOT.rglob("*.md")):
        code = source_id(path)
        if not code:
            continue
        data = path.read_bytes()
        text = data.decode("utf-8-sig", errors="replace")
        found.append(
            {
                "id": code,
                "title": first_heading(text, path.stem),
                "path": path.relative_to(REPO_ROOT).as_posix(),
                "source_status": SOURCE_STATUS[code],
                "authority_role": "primary",
                "sha256": hashlib.sha256(data).hexdigest(),
                "bytes": len(data),
                "rule_count": len(rule_ids(text)),
                "brain_proxy": f"DOC-{code}",
            }
        )
    return sorted(found, key=lambda item: item["id"])


def expected_manifest() -> dict[str, Any]:
    sources = authority_sources()
    return {
        "manifest_version": 1,
        "governance_baseline": "Leyforge Engineering Governance Baseline v1.0",
        "installed_at": GENERATED_AT,
        "authority_order": [
            "CANON_AND_PRODUCT",
            "ENG-GOV-00",
            "ENG-GOV-01_THROUGH_15",
            "CURRENT_ARCHITECTURE_AND_ACCEPTED_ADRS",
            "ROOT_AND_PATH_AGENTS",
            "IMPLEMENTATION_TESTS_TOOLS_AND_CI",
        ],
        "source_root": SOURCE_ROOT.relative_to(REPO_ROOT).as_posix(),
        "source_count": len(sources),
        "sources": sources,
        "record_root": "brain",
        "schema": SCHEMA_PATH.relative_to(REPO_ROOT).as_posix(),
        "templates": [f"brain/90_TEMPLATES/Governance/{TEMPLATE_NAMES[number]}" for number in sorted(TEMPLATE_NAMES)],
        "entrypoints": {
            "governance": "python brain/92_SCRIPTS/governance.py doctor --profile certification",
            "build": "python tools/verify.py --tier build",
            "focused_test": "python tools/verify.py --tier focused",
            "full_validation": "python tools/verify.py --tier full",
        },
        "activation": {"milestone": "G0", "gameplay_permission": "CLOSED"},
        "authority_statement": "ENG-GOV and B-OPS source files remain authoritative. This manifest, its validators and Brain records are implementation and navigation artifacts.",
    }


def manifest_text() -> str:
    return json.dumps(expected_manifest(), indent=2, ensure_ascii=False) + "\n"


def validate_manifest() -> list[dict[str, str]]:
    diagnostics: list[dict[str, str]] = []
    rel = MANIFEST_PATH.relative_to(REPO_ROOT).as_posix()
    if not MANIFEST_PATH.is_file():
        return [diagnostic("ERROR", "GOV-E001", rel, "governance manifest is missing")]
    try:
        manifest = load_json(MANIFEST_PATH)
    except (OSError, json.JSONDecodeError) as exc:
        return [diagnostic("ERROR", "GOV-E002", rel, f"governance manifest is unreadable: {exc}")]
    expected_ids = set(load_json(SCHEMA_PATH)["authority_source_ids"])
    entries = manifest.get("sources", [])
    actual_ids = [str(item.get("id")) for item in entries]
    if len(entries) != 23 or manifest.get("source_count") != 23:
        diagnostics.append(diagnostic("ERROR", "GOV-E003", rel, "manifest must install exactly 23 Branch B sources"))
    if len(actual_ids) != len(set(actual_ids)) or set(actual_ids) != expected_ids:
        diagnostics.append(diagnostic("ERROR", "GOV-E004", rel, "manifest source IDs are incomplete or duplicated"))
    for item in entries:
        path = REPO_ROOT / str(item.get("path", ""))
        code = str(item.get("id", ""))
        if not path.is_file():
            diagnostics.append(diagnostic("ERROR", "GOV-E005", str(item.get("path")), "authority source is missing"))
            continue
        data = path.read_bytes()
        if hashlib.sha256(data).hexdigest() != item.get("sha256") or len(data) != item.get("bytes"):
            diagnostics.append(diagnostic("ERROR", "GOV-E006", item["path"], "authority source differs from installed manifest"))
        if item.get("source_status") != SOURCE_STATUS.get(code):
            diagnostics.append(diagnostic("ERROR", "GOV-E007", item["path"], "source status differs from certified Branch B disposition"))
        if item.get("authority_role") != "primary":
            diagnostics.append(diagnostic("ERROR", "GOV-E008", item["path"], "canonical source must retain primary authority"))
        text = data.decode("utf-8-sig", errors="replace")
        if item.get("rule_count") != len(rule_ids(text)):
            diagnostics.append(diagnostic("ERROR", "GOV-E009", item["path"], "rule inventory count is stale"))
    if manifest.get("record_root") != "brain" or "remain authoritative" not in str(manifest.get("authority_statement", "")):
        diagnostics.append(diagnostic("ERROR", "GOV-E010", rel, "manifest does not preserve the Branch B to Brain authority boundary"))
    return diagnostics


def extract_templates() -> dict[Path, str]:
    text = TEMPLATE_SOURCE.read_text(encoding="utf-8-sig")
    outputs: dict[Path, str] = {}
    for number, filename in TEMPLATE_NAMES.items():
        heading = re.search(rf"^# TEMPLATE-{number}\b.*$", text, flags=re.MULTILINE)
        if not heading:
            raise ValueError(f"TEMPLATE-{number} heading not found")
        start = text.find("```markdown", heading.end())
        end = text.find("```", start + len("```markdown"))
        if start < 0 or end < 0:
            raise ValueError(f"TEMPLATE-{number} body not found")
        content = text[start + len("```markdown"):end].lstrip("\r\n").rstrip() + "\n"
        outputs[TEMPLATE_ROOT / filename] = content
    return outputs


def template_drift() -> list[str]:
    drift: list[str] = []
    for path, expected in extract_templates().items():
        if not path.is_file() or path.read_text(encoding="utf-8-sig") != expected:
            drift.append(path.relative_to(REPO_ROOT).as_posix())
    actual = {path for path in TEMPLATE_ROOT.glob("*.md")} if TEMPLATE_ROOT.is_dir() else set()
    stale = actual - set(extract_templates())
    drift.extend(path.relative_to(REPO_ROOT).as_posix() for path in sorted(stale))
    return sorted(set(drift))


def write_templates() -> list[str]:
    changed = []
    for path, content in extract_templates().items():
        if write_if_changed(path, content):
            changed.append(path.relative_to(REPO_ROOT).as_posix())
    return changed


def governance_records() -> tuple[list[Any], list[dict[str, str]]]:
    records, parse_diagnostics = brain.discover_records()
    return [record for record in records if record.metadata.get("record_type")], parse_diagnostics


def available_rule_ids() -> set[str]:
    values: set[str] = set()
    for source in authority_sources():
        values.update(rule_ids((REPO_ROOT / source["path"]).read_text(encoding="utf-8-sig", errors="replace")))
    return values


def governance_status(metadata: dict[str, Any]) -> str:
    return str(metadata.get("governance_status", metadata.get("status", "")))


def validate_records(records: list[Any] | None = None) -> list[dict[str, str]]:
    if records is None:
        records, _ = governance_records()
    schema = load_json(SCHEMA_PATH)
    definitions = schema["record_types"]
    risks = set(schema["risk_classes"])
    milestones = set(schema["activation_milestones"])
    all_brain_records, _ = brain.discover_records()
    ids: dict[str, Any] = {}
    diagnostics: list[dict[str, str]] = []
    for record in all_brain_records:
        record_id = str(record.metadata.get("id", ""))
        if record_id in ids:
            diagnostics.append(diagnostic("ERROR", "GOV-E020", record.relpath, f"duplicate stable ID: {record_id}"))
        ids[record_id] = record
    rules = available_rule_ids()
    for record in records:
        metadata = record.metadata
        rel = record.relpath
        kind = str(metadata.get("record_type", ""))
        record_id = str(metadata.get("id", ""))
        existing = ids.get(record_id)
        if existing is not None and existing.path != record.path:
            diagnostics.append(diagnostic("ERROR", "GOV-E020", rel, f"duplicate stable ID: {record_id}"))
        elif existing is None:
            ids[record_id] = record
        definition = definitions.get(kind)
        if not definition:
            diagnostics.append(diagnostic("ERROR", "GOV-E021", rel, f"unsupported governance record type: {kind}"))
            continue
        if not re.fullmatch(definition["id_pattern"], record_id):
            diagnostics.append(diagnostic("ERROR", "GOV-E022", rel, f"ID does not match {kind} pattern"))
        if metadata.get("type") not in definition["brain_types"]:
            diagnostics.append(diagnostic("ERROR", "GOV-E023", rel, f"{kind} is not mapped to an allowed Brain type"))
        status = governance_status(metadata)
        if status not in definition["statuses"]:
            diagnostics.append(diagnostic("ERROR", "GOV-E024", rel, f"invalid {kind} governance status: {status}"))
        if metadata.get("template_version") != schema["template_version"]:
            diagnostics.append(diagnostic("ERROR", "GOV-E025", rel, "unsupported template_version"))
        for field in definition.get("required", []):
            if missing(metadata.get(field)):
                diagnostics.append(diagnostic("ERROR", "GOV-E026", rel, f"missing governance field: {field}"))
        if "risk_class" in definition.get("required", []) and metadata.get("risk_class") not in risks:
            diagnostics.append(diagnostic("ERROR", "GOV-E027", rel, f"malformed risk_class: {metadata.get('risk_class')}"))
        if kind == "governance_debt" and metadata.get("activation_milestone") not in milestones:
            diagnostics.append(diagnostic("ERROR", "GOV-E028", rel, "invalid governance debt activation milestone"))
        for field in schema["rule_reference_fields"]:
            for rule in as_list(metadata.get(field)):
                if rule not in rules:
                    diagnostics.append(diagnostic("ERROR", "GOV-E029", rel, f"unknown governing rule: {rule}"))
        for field in schema["reference_fields"]:
            for target in as_list(metadata.get(field)):
                if target not in ids:
                    diagnostics.append(diagnostic("ERROR", "GOV-E030", rel, f"{field} references unknown record: {target}"))
        if metadata.get("authority_role") == "primary":
            diagnostics.append(diagnostic("ERROR", "GOV-E031", rel, "operational governance record may not claim primary source authority"))
        if kind == "architecture_decision" and status == "accepted":
            if missing(metadata.get("accepted")) or "<TODO" in record.body:
                diagnostics.append(diagnostic("ERROR", "GOV-E032", rel, "accepted ADR lacks acceptance evidence or retains a placeholder"))
        if kind == "waiver" and status in {"approved", "active"}:
            expiry = str(metadata.get("expires", ""))
            if missing(expiry) or missing(metadata.get("exit_condition")):
                diagnostics.append(diagnostic("ERROR", "GOV-E033", rel, "active waiver requires expiry/reconsideration and exit condition"))
            elif re.fullmatch(r"\d{4}-\d{2}-\d{2}", expiry) and date.fromisoformat(expiry) < date.today():
                diagnostics.append(diagnostic("ERROR", "GOV-E034", rel, f"active waiver expired on {expiry}"))
        if kind == "dependency" and status == "active":
            if metadata.get("licence_status") != "verified" or metadata.get("provenance_status") != "verified":
                diagnostics.append(diagnostic("ERROR", "GOV-E035", rel, "active dependency requires verified licence and provenance"))
        if kind == "benchmark" and status in {"active", "pass", "fail"}:
            if missing(metadata.get("scenario")) or missing(metadata.get("method")):
                diagnostics.append(diagnostic("ERROR", "GOV-E036", rel, "active benchmark requires scenario and method"))
        if kind == "governance_debt" and status == "closed" and missing(metadata.get("closure_evidence")):
            diagnostics.append(diagnostic("ERROR", "GOV-E037", rel, "closed governance debt requires closure evidence"))
        if kind in {"engineering_work_log", "engineering_completion"} and status == "complete" and missing(metadata.get("closure_evidence")):
            diagnostics.append(diagnostic("ERROR", "GOV-E038", rel, "completed engineering record requires closure evidence"))
    return diagnostics


def validate_entrypoints(records: list[Any]) -> list[dict[str, str]]:
    diagnostics: list[dict[str, str]] = []
    required_paths = [
        SCHEMA_PATH,
        MANIFEST_PATH,
        REPO_ROOT / "AGENTS.md",
        REPO_ROOT / "tools" / "verify.py",
        REPO_ROOT / ".github" / "workflows" / "governance.yml",
        BRAIN_ROOT / "11_AUDIT" / "Governance Debt",
        BRAIN_ROOT / "11_AUDIT" / "Waivers",
        BRAIN_ROOT / "11_AUDIT" / "Deprecations",
        BRAIN_ROOT / "05_DECISIONS" / "ADRs",
        BRAIN_ROOT / "09_IMPLEMENTATION" / "Dependencies",
    ]
    for path in required_paths:
        if not path.exists():
            diagnostics.append(diagnostic("ERROR", "GOV-E040", path.relative_to(REPO_ROOT).as_posix(), "required governance surface is missing"))
    agents = (REPO_ROOT / "AGENTS.md").read_text(encoding="utf-8-sig") if (REPO_ROOT / "AGENTS.md").is_file() else ""
    for pointer in ("brain/AGENTS.md", "governance.py", "tools/verify.py", "Task contract", "R8 gameplay permission remains closed"):
        if pointer not in agents:
            diagnostics.append(diagnostic("ERROR", "GOV-E041", "AGENTS.md", f"coding-agent bootstrap pointer is missing: {pointer}"))
    workflow = REPO_ROOT / ".github" / "workflows" / "governance.yml"
    workflow_text = workflow.read_text(encoding="utf-8-sig") if workflow.is_file() else ""
    for command in ("governance.py doctor --profile certification", "tools/verify.py --tier full"):
        if command not in workflow_text:
            diagnostics.append(diagnostic("ERROR", "GOV-E042", workflow.relative_to(REPO_ROOT).as_posix(), f"CI command is missing: {command}"))
    all_records, _ = brain.discover_records()
    ids = {str(record.metadata.get("id")) for record in all_records}
    for record_id in {f"ADR-{number:04d}" for number in range(1, 8)} | {"DEP-GODOT", "DEP-ZYLANN", "SYS-ENGINEERING-GOVERNANCE", "PROC-GOVERNANCE-VALIDATION", "PROC-PARALLEL-WORKTREES"}:
        if record_id not in ids:
            diagnostics.append(diagnostic("ERROR", "GOV-E043", "brain", f"required bootstrap record is missing: {record_id}"))
    debt = [record for record in records if record.metadata.get("record_type") == "governance_debt"]
    if not debt or not {"G0", "G1", "G2", "G3", "G4", "G5"}.issubset({str(item.metadata.get("activation_milestone")) for item in debt}):
        diagnostics.append(diagnostic("ERROR", "GOV-E044", "brain/11_AUDIT/Governance Debt", "governance debt does not cover G0 through G5"))
    all_ids = ids
    for source in load_json(MANIFEST_PATH).get("sources", []) if MANIFEST_PATH.is_file() else []:
        if source.get("brain_proxy") not in all_ids:
            diagnostics.append(diagnostic("ERROR", "GOV-E045", "brain/04_DOCUMENTS/Proxies", f"Branch B proxy is missing: {source.get('brain_proxy')}"))
    if (REPO_ROOT / "project.godot").exists():
        diagnostics.append(diagnostic("ERROR", "GOV-E046", "project.godot", "gameplay runtime appeared while R8 permission is closed"))
    return diagnostics


def validate_references(records: list[Any] | None = None) -> list[dict[str, str]]:
    if records is None:
        records, _ = governance_records()
    return [item for item in validate_records(records) if item["code"] in {"GOV-E029", "GOV-E030"}]


def validate_waivers(records: list[Any] | None = None) -> list[dict[str, str]]:
    if records is None:
        records, _ = governance_records()
    waivers = [record for record in records if record.metadata.get("record_type") == "waiver"]
    return [item for item in validate_records(waivers) if item["code"] in {"GOV-E026", "GOV-E027", "GOV-E029", "GOV-E033", "GOV-E034"}]


def run_doctor(profile: str) -> dict[str, Any]:
    records, parse_diagnostics = governance_records()
    diagnostics = list(parse_diagnostics)
    diagnostics.extend(validate_records(records))
    if profile in {"full", "certification"}:
        diagnostics.extend(validate_manifest())
        diagnostics.extend(diagnostic("ERROR", "GOV-E011", path, "source-derived template has drift") for path in template_drift())
        diagnostics.extend(validate_entrypoints(records))
    unique = {(item["severity"], item["code"], item["path"], item["message"]): item for item in diagnostics}
    diagnostics = sorted(unique.values(), key=lambda item: (item["severity"] != "ERROR", item["code"], item["path"]))
    counts = {severity: sum(item["severity"] == severity for item in diagnostics) for severity in ("ERROR", "WARNING", "INFO")}
    return {
        "tool": "Leyforge Engineering Governance Doctor",
        "tool_version": TOOL_VERSION,
        "profile": profile,
        "status": "PASS" if counts["ERROR"] == 0 else "FAIL",
        "authority_sources": len(authority_sources()),
        "records": len(records),
        "templates": len(extract_templates()),
        "diagnostics": counts,
        "items": diagnostics,
    }


def print_result(result: Any, output_format: str = "text") -> None:
    if output_format == "json":
        print(json.dumps(result, indent=2, ensure_ascii=True))
        return
    if isinstance(result, dict) and "items" in result:
        print(f"{result.get('tool', 'governance')} {result['status']} ({result.get('profile', '')})")
        print(f"sources={result.get('authority_sources', 0)} records={result.get('records', 0)} templates={result.get('templates', 0)} errors={result.get('diagnostics', {}).get('ERROR', 0)}")
        for item in result["items"]:
            print(f"{item['severity']} {item['code']} {item['path']}: {item['message']}")
        return
    print(json.dumps(result, indent=2, ensure_ascii=True))


def command_doctor(args: argparse.Namespace) -> int:
    result = run_doctor(args.profile)
    print_result(result, args.format)
    return 0 if result["status"] == "PASS" else 1


def command_manifest(args: argparse.Namespace) -> int:
    if args.write:
        changed = write_if_changed(MANIFEST_PATH, manifest_text())
        print(json.dumps({"status": "PASS", "changed": [MANIFEST_PATH.relative_to(REPO_ROOT).as_posix()] if changed else []}, indent=2))
        return 0
    diagnostics = validate_manifest()
    result = {"status": "PASS" if not diagnostics else "FAIL", "items": diagnostics}
    print_result(result, args.format)
    return 0 if not diagnostics else 1


def command_templates(args: argparse.Namespace) -> int:
    if args.write:
        print(json.dumps({"status": "PASS", "changed": write_templates()}, indent=2))
        return 0
    drift = template_drift()
    result = {"status": "PASS" if not drift else "FAIL", "items": [diagnostic("ERROR", "GOV-E011", path, "source-derived template has drift") for path in drift]}
    print_result(result, args.format)
    return 0 if not drift else 1


def command_query(args: argparse.Namespace) -> int:
    records, _ = governance_records()
    selected = []
    for record in records:
        metadata = record.metadata
        if args.id and metadata.get("id") != args.id:
            continue
        if args.record_type and metadata.get("record_type") != args.record_type:
            continue
        if args.status and governance_status(metadata) != args.status:
            continue
        selected.append({"id": metadata.get("id"), "record_type": metadata.get("record_type"), "status": governance_status(metadata), "title": metadata.get("title"), "path": record.relpath})
    if args.format == "json":
        print(json.dumps(selected, indent=2, ensure_ascii=True))
    else:
        for item in selected:
            print(" | ".join(str(item[key]) for key in ("id", "record_type", "status", "title", "path")))
    return 0 if selected or not args.id else 1


def command_id(args: argparse.Namespace) -> int:
    schema = load_json(SCHEMA_PATH)
    definition = schema["record_types"].get(args.record_type)
    if not definition:
        print(json.dumps({"status": "FAIL", "error": "unsupported record type"}, indent=2))
        return 1
    if args.id_action == "validate":
        valid = bool(re.fullmatch(definition["id_pattern"], args.value))
        print(json.dumps({"status": "PASS" if valid else "FAIL", "id": args.value, "record_type": args.record_type}, indent=2))
        return 0 if valid else 1
    records, _ = brain.discover_records()
    prefix = args.value.upper()
    used = {str(record.metadata.get("id")) for record in records}
    width = 4
    number = 1
    while f"{prefix}-{number:0{width}d}" in used:
        number += 1
    candidate = f"{prefix}-{number:0{width}d}"
    valid = bool(re.fullmatch(definition["id_pattern"], candidate))
    print(json.dumps({"status": "PASS" if valid else "FAIL", "id": candidate, "record_type": args.record_type}, indent=2))
    return 0 if valid else 1


def check_command(kind: str, args: argparse.Namespace) -> int:
    records, _ = governance_records()
    if kind == "rules":
        diagnostics = validate_manifest() + [item for item in validate_records(records) if item["code"] == "GOV-E029"]
    elif kind == "waivers":
        diagnostics = validate_waivers(records)
    else:
        diagnostics = validate_references(records)
    result = {"status": "PASS" if not diagnostics else "FAIL", "items": diagnostics}
    print_result(result, args.format)
    return 0 if not diagnostics else 1


def command_impact(args: argparse.Namespace) -> int:
    needle = args.path.replace("\\", "/").lower()
    records, _ = governance_records()
    matches = []
    for record in records:
        haystack = json.dumps(record.metadata, ensure_ascii=False).lower() + "\n" + record.body.lower()
        if needle in haystack:
            matches.append({"id": record.metadata.get("id"), "record_type": record.metadata.get("record_type"), "path": record.relpath})
    print(json.dumps({"status": "PASS", "query": needle, "matches": matches}, indent=2))
    return 0


def command_gate(args: argparse.Namespace) -> int:
    if args.tier == "release":
        result = {"status": "BLOCKED", "tier": "release", "reason": "G5 and R8 gameplay/release permission are closed"}
        print(json.dumps(result, indent=2))
        return 2
    profile = "quick" if args.tier == "fast" else "full"
    result = run_doctor(profile)
    result["tier"] = args.tier
    print_result(result, args.format)
    return 0 if result["status"] == "PASS" else 1


def run_command(command: list[str]) -> dict[str, Any]:
    completed = subprocess.run(command, cwd=REPO_ROOT, text=True, capture_output=True)
    return {"command": command, "exit_code": completed.returncode, "stdout": completed.stdout, "stderr": completed.stderr}


def command_certify(args: argparse.Namespace) -> int:
    commands = [
        [sys.executable, "-m", "unittest", "discover", "brain/92_SCRIPTS/tests", "-v"],
        [sys.executable, "brain/92_SCRIPTS/brain.py", "doctor", "--profile", "certification", "--format", "json"],
        [sys.executable, "brain/92_SCRIPTS/governance.py", "doctor", "--profile", "certification", "--format", "json"],
        [sys.executable, "tools/verify_rebuild_boundary.py"],
    ]
    runs = [run_command(command) for command in commands]
    passed = all(run["exit_code"] == 0 for run in runs)
    receipt = {
        "receipt_version": 1,
        "gate": "R5",
        "profile": "certification",
        "commit": args.commit,
        "generated_at": GENERATED_AT,
        "result": "PASS" if passed else "FAIL",
        "authority_sources": len(authority_sources()),
        "templates": len(extract_templates()),
        "commands": runs,
        "gameplay_permission": "CLOSED",
    }
    receipt_path = BRAIN_ROOT / "10_TESTING" / "Evidence" / "r5-governance-certification.json"
    if args.write:
        write_if_changed(receipt_path, json.dumps(receipt, indent=2, ensure_ascii=False) + "\n")
    print(json.dumps({"status": receipt["result"], "receipt": receipt_path.relative_to(REPO_ROOT).as_posix(), "written": bool(args.write)}, indent=2))
    return 0 if passed else 1


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog="governance", description="Leyforge Branch B engineering-governance CLI")
    parser.add_argument("--version", action="version", version=TOOL_VERSION)
    sub = parser.add_subparsers(dest="command", required=True)
    doctor = sub.add_parser("doctor")
    doctor.add_argument("--profile", choices=("quick", "full", "certification"), default="quick")
    doctor.add_argument("--format", choices=("text", "json"), default="text")
    doctor.set_defaults(func=command_doctor)
    for name, handler in (("manifest", command_manifest), ("templates", command_templates)):
        command = sub.add_parser(name)
        mode = command.add_mutually_exclusive_group(required=True)
        mode.add_argument("--check", action="store_true")
        mode.add_argument("--write", action="store_true")
        command.add_argument("--format", choices=("text", "json"), default="text")
        command.set_defaults(func=handler)
    query = sub.add_parser("query")
    query.add_argument("--id")
    query.add_argument("--record-type")
    query.add_argument("--status")
    query.add_argument("--format", choices=("text", "json"), default="text")
    query.set_defaults(func=command_query)
    ids = sub.add_parser("id")
    ids.add_argument("id_action", choices=("validate", "next"))
    ids.add_argument("record_type")
    ids.add_argument("value")
    ids.set_defaults(func=command_id)
    for name in ("rules", "waivers", "references"):
        command = sub.add_parser(name)
        command.add_argument("--check", action="store_true", required=True)
        command.add_argument("--format", choices=("text", "json"), default="text")
        command.set_defaults(func=lambda args, selected=name: check_command(selected, args))
    impact = sub.add_parser("impact")
    impact.add_argument("--path", required=True)
    impact.set_defaults(func=command_impact)
    gate = sub.add_parser("gate")
    gate.add_argument("--tier", choices=("fast", "integration", "deep", "release"), required=True)
    gate.add_argument("--format", choices=("text", "json"), default="text")
    gate.set_defaults(func=command_gate)
    certify = sub.add_parser("certify")
    certify.add_argument("--commit", required=True)
    certify.add_argument("--write", action="store_true")
    certify.set_defaults(func=command_certify)
    return parser


def main(argv: list[str] | None = None) -> int:
    if hasattr(sys.stdout, "reconfigure"):
        sys.stdout.reconfigure(errors="backslashreplace")
    if hasattr(sys.stderr, "reconfigure"):
        sys.stderr.reconfigure(errors="backslashreplace")
    args = build_parser().parse_args(argv)
    return int(args.func(args))


if __name__ == "__main__":
    raise SystemExit(main())
