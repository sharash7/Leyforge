"""Read-only Python dependency lint for declared proof-harness boundaries."""

from __future__ import annotations

import ast
import fnmatch
import json
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Iterable, List, Tuple


@dataclass(frozen=True)
class DependencyRule:
    rule_id: str
    source_prefix: str
    forbidden_prefix: str
    reason: str

    @classmethod
    def from_dict(cls, value: Dict[str, Any]) -> "DependencyRule":
        return cls(str(value["rule_id"]), str(value["source_prefix"]),
                   str(value["forbidden_prefix"]), str(value["reason"]))


def _matches(module: str, prefix: str) -> bool:
    return module == prefix or module.startswith(prefix + ".")


def _module_for(path: Path, source_root: Path) -> Tuple[str, bool]:
    relative = path.relative_to(source_root).with_suffix("")
    parts = list(relative.parts)
    is_package = bool(parts and parts[-1] == "__init__")
    if is_package:
        parts.pop()
    return ".".join(parts), is_package


def _import_targets(tree: ast.AST, importer: str, is_package: bool) -> Iterable[Tuple[int, str]]:
    for node in ast.walk(tree):
        if isinstance(node, ast.Import):
            for alias in node.names:
                yield node.lineno, alias.name
        elif isinstance(node, ast.ImportFrom):
            if node.level:
                package = importer.split(".") if is_package else importer.split(".")[:-1]
                up = node.level - 1
                if up > len(package):
                    target = node.module or ""
                else:
                    base = package[: len(package) - up]
                    suffix = (node.module or "").split(".") if node.module else []
                    target = ".".join(base + suffix)
            else:
                target = node.module or ""
            if target:
                yield node.lineno, target


def load_config(path: Path) -> Dict[str, Any]:
    data = json.loads(path.read_text(encoding="utf-8"))
    if data.get("schema_version") != "prd07-architecture-rules-v1":
        raise ValueError("unsupported architecture rule schema")
    if not data.get("scan_roots") or not data.get("rules"):
        raise ValueError("architecture config requires scan_roots and rules")
    rules = [DependencyRule.from_dict(item) for item in data["rules"]]
    ids = [rule.rule_id for rule in rules]
    if len(ids) != len(set(ids)) or any(
        not value.strip()
        for rule in rules
        for value in (rule.rule_id, rule.source_prefix, rule.forbidden_prefix, rule.reason)
    ):
        raise ValueError("architecture rules require unique IDs and nonempty fields")
    return data


def scan(source_root: Path, config: Dict[str, Any]) -> Dict[str, Any]:
    source_root = source_root.resolve()
    rules = [DependencyRule.from_dict(item) for item in config["rules"]]
    exclude = tuple(str(item) for item in config.get("exclude", []))
    files: List[Path] = []
    for scan_root in config["scan_roots"]:
        candidate_root = (source_root / str(scan_root)).resolve()
        try:
            candidate_root.relative_to(source_root)
        except ValueError as exc:
            raise ValueError("scan root escapes source root") from exc
        if candidate_root.is_dir():
            files.extend(candidate_root.rglob("*.py"))
    violations: List[Dict[str, Any]] = []
    scanned = 0
    for path in sorted(set(files)):
        relative_text = path.relative_to(source_root).as_posix()
        if any(fnmatch.fnmatch(relative_text, pattern) for pattern in exclude):
            continue
        scanned += 1
        importer, is_package = _module_for(path, source_root)
        try:
            tree = ast.parse(path.read_text(encoding="utf-8"), filename=relative_text)
        except SyntaxError as exc:
            violations.append({
                "rule_id": "W0-ARCH-PARSE", "file": relative_text,
                "line": exc.lineno or 1, "importer": importer,
                "imported": "<parse-error>", "reason": exc.msg,
            })
            continue
        for line, imported in _import_targets(tree, importer, is_package):
            for rule in rules:
                if _matches(importer, rule.source_prefix) and _matches(imported, rule.forbidden_prefix):
                    violations.append({
                        "rule_id": rule.rule_id, "file": relative_text, "line": line,
                        "importer": importer, "imported": imported, "reason": rule.reason,
                    })
    return {
        "tool": "Leyforge W0 architecture lint",
        "schema_version": "prd07-architecture-report-v1",
        "status": "PASS" if not violations else "FAIL",
        "scanned_files": scanned, "rule_count": len(rules),
        "violations": violations, "read_only": True,
    }
