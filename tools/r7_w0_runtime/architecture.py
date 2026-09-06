"""Static architecture rules for the nested R7 W0 proof runtime."""

from __future__ import annotations

import fnmatch
import json
import re
import time
from pathlib import Path
from typing import Any, Dict, Tuple

ROOT = Path(__file__).resolve().parents[2]
RULES_PATH = Path(__file__).with_name("architecture-rules.json")


def load_rules(path: Path = RULES_PATH) -> Dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def validate_rules(data: Dict[str, Any]) -> Tuple[str, ...]:
    issues: list[str] = []
    if data.get("schema_version") != "leyforge-r7-w0-architecture-rules-v1":
        issues.append("unsupported architecture-rule schema")
    rules = data.get("rules")
    if not isinstance(rules, list) or not rules:
        return tuple(issues + ["architecture rules must be nonempty"])
    ids: set[str] = set()
    for rule in rules:
        rule_id = rule.get("rule_id")
        if not isinstance(rule_id, str) or not rule_id:
            issues.append("architecture rule_id is required")
        elif rule_id in ids:
            issues.append(f"duplicate architecture rule: {rule_id}")
        else:
            ids.add(rule_id)
        try:
            re.compile(str(rule.get("forbidden_regex", "")))
        except re.error:
            issues.append(f"{rule_id} has an invalid regular expression")
        if not rule.get("scope") or not rule.get("reason"):
            issues.append(f"{rule_id} lacks scope or reason")
    return tuple(sorted(set(issues)))


def lint(scan_root: Path | None = None, rules: Dict[str, Any] | None = None) -> Dict[str, Any]:
    started = time.perf_counter()
    rules = rules or load_rules()
    issues = list(validate_rules(rules))
    root = scan_root or ROOT / rules.get("scan_root", "")
    findings: list[Dict[str, Any]] = []
    files = sorted(path for path in root.rglob("*.gd") if path.is_file()) if root.is_dir() else []
    if not files:
        issues.append(f"architecture scan root has no GDScript files: {root}")
    for path in files:
        relative = path.relative_to(root).as_posix()
        content = path.read_text(encoding="utf-8-sig")
        for rule in rules.get("rules", []):
            if not fnmatch.fnmatch(relative, rule["scope"]):
                continue
            pattern = re.compile(rule["forbidden_regex"])
            for line_number, line in enumerate(content.splitlines(), 1):
                match = pattern.search(line)
                if match:
                    findings.append({
                        "rule_id": rule["rule_id"], "path": relative,
                        "line": line_number, "match": match.group(0), "reason": rule["reason"],
                    })
    return {
        "schema_version": "leyforge-r7-w0-architecture-lint-report-v1",
        "status": "PASS" if not issues and not findings else "FAIL",
        "scan_root": str(root.resolve()), "files_scanned": len(files),
        "rules_executed": len(rules.get("rules", [])), "issues": sorted(set(issues)),
        "findings": findings, "duration_seconds": max(0.0, time.perf_counter() - started),
    }
