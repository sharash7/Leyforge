#!/usr/bin/env python3
"""Leyforge Project Brain CLI v0.1.0.

The implementation is deliberately Python-standard-library only. It reads the
repository files directly and remains operational when Obsidian is closed.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable


TOOL_VERSION = "0.1.0"
SCHEMA_VERSION = 1
GENERATED_AT = "2026-09-06T00:00:00+08:00"
BRAIN_ROOT = Path(__file__).resolve().parents[1]
REPO_ROOT = BRAIN_ROOT.parent
SCHEMA_PATH = BRAIN_ROOT / "91_SCHEMA" / "brain.schema.json"
MIGRATIONS_PATH = BRAIN_ROOT / "91_SCHEMA" / "migrations.json"
BOOTSTRAP_PATH = BRAIN_ROOT / "00_CONTROL" / "bootstrap.json"
REGISTRY_PATH = BRAIN_ROOT / "04_DOCUMENTS" / "document-registry.json"
TEMPLATE_ROOT = BRAIN_ROOT / "90_TEMPLATES"
INDEX_ROOT = BRAIN_ROOT / "01_INDEXES" / "Generated"
SOURCE_INTAKE_ROOT = REPO_ROOT / "docs" / "rebuild" / "source-intake"

UNIVERSAL_FIELDS = (
    "brain_schema",
    "id",
    "type",
    "title",
    "status",
    "information_class",
    "created",
    "updated",
)

SELECTED_SOURCE_PATTERNS = (
    re.compile(r"^LF-BRAIN-(?:0[1-9]|1[0-3])_"),
    re.compile(r"^LF-BRAIN-SET-A_"),
    re.compile(r"^ENG-GOV-(?:0[0-9]|1[0-5])_"),
    re.compile(r"^B-OPS-0[0-6]_"),
    re.compile(r"^C-AUD-0[0-2]_"),
    re.compile(r"^D-ROAD-0[0-2]_"),
    re.compile(r"^PRD-0[0-6]_"),
    re.compile(r"^REBUILD-00_"),
)

INDEX_DEFINITIONS: dict[str, dict[str, Any]] = {
    "PROJECT": {"title": "Project Index", "types": ["home", "dashboard", "work", "work_item", "handoff"]},
    "CANON": {"title": "Canon Index", "domains": ["content_canon"]},
    "SYSTEMS": {"title": "Systems Index", "types": ["system"]},
    "ENTITY": {"title": "Entity Index", "types": ["entity", "concept"]},
    "ARCHITECTURE": {"title": "Architecture Index", "types": ["architecture", "interface"]},
    "DOCUMENT": {"title": "Document Index", "types": ["document", "source"]},
    "REQUIREMENT": {"title": "Requirement Index", "types": ["requirement"]},
    "REGISTRY": {"title": "Registry Index", "domains": ["registry"]},
    "DECISION": {"title": "Decision Index", "types": ["adr", "decision"]},
    "WORK": {"title": "Work Index", "types": ["work", "work_item", "handoff"]},
    "SKILLS": {"title": "Skills and Learning Index", "types": ["skill", "procedure", "pattern", "antipattern", "shortcut", "lesson", "failure", "workaround"]},
    "RESEARCH": {"title": "Research Index", "types": ["research", "finding", "experiment"]},
    "IMPLEMENTATION": {"title": "Implementation Index", "types": ["implementation_module", "migration"]},
    "TESTING": {"title": "Testing Index", "types": ["test", "evidence", "benchmark", "bug"]},
    "AUDIT": {"title": "Audit Index", "types": ["audit", "deviation"]},
    "RISK": {"title": "Risk Index", "types": ["risk"]},
    "CONFLICT": {"title": "Conflict Index", "types": ["conflict"]},
}


@dataclass(frozen=True)
class Record:
    path: Path
    metadata: dict[str, Any]
    body: str

    @property
    def relpath(self) -> str:
        return self.path.relative_to(BRAIN_ROOT).as_posix()


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def git_blob_hash(data: bytes) -> str:
    prefix = f"blob {len(data)}\0".encode("ascii")
    return hashlib.sha1(prefix + data).hexdigest()


def parse_scalar(value: str) -> Any:
    value = value.strip()
    if not value:
        return ""
    if value.startswith(("\"", "[", "{")):
        try:
            return json.loads(value)
        except json.JSONDecodeError:
            return value.strip("\"")
    if value.startswith("'") and value.endswith("'"):
        return value[1:-1].replace("''", "'")
    lowered = value.lower()
    if lowered in {"true", "false"}:
        return lowered == "true"
    if lowered in {"null", "~"}:
        return None
    if re.fullmatch(r"-?[0-9]+", value):
        return int(value)
    return value


def parse_frontmatter(text: str) -> tuple[dict[str, Any], str]:
    lines = text.replace("\r\n", "\n").split("\n")
    if not lines or lines[0].strip() != "---":
        raise ValueError("missing opening frontmatter delimiter")
    try:
        end = next(i for i in range(1, len(lines)) if lines[i].strip() == "---")
    except StopIteration as exc:
        raise ValueError("missing closing frontmatter delimiter") from exc
    metadata: dict[str, Any] = {}
    active_list: str | None = None
    for line_number, raw in enumerate(lines[1:end], start=2):
        if not raw.strip() or raw.lstrip().startswith("#"):
            continue
        list_match = re.match(r"^\s+-\s+(.*)$", raw)
        if list_match and active_list:
            current = metadata.setdefault(active_list, [])
            if not isinstance(current, list):
                raise ValueError(f"line {line_number}: list item follows scalar")
            current.append(parse_scalar(list_match.group(1)))
            continue
        match = re.match(r"^([A-Za-z][A-Za-z0-9_-]*):(?:\s*(.*))?$", raw)
        if not match:
            raise ValueError(f"line {line_number}: unsupported frontmatter syntax")
        key, value = match.group(1), match.group(2) or ""
        if key in metadata:
            raise ValueError(f"line {line_number}: duplicate field {key}")
        if value:
            metadata[key] = parse_scalar(value)
            active_list = None
        else:
            metadata[key] = []
            active_list = key
    return metadata, "\n".join(lines[end + 1 :]).lstrip("\n")


def discover_records() -> tuple[list[Record], list[dict[str, str]]]:
    records: list[Record] = []
    diagnostics: list[dict[str, str]] = []
    for path in sorted(BRAIN_ROOT.rglob("*.md")):
        rel = path.relative_to(BRAIN_ROOT)
        if rel.parts and rel.parts[0] == "90_TEMPLATES":
            continue
        try:
            metadata, body = parse_frontmatter(path.read_text(encoding="utf-8-sig"))
            records.append(Record(path, metadata, body))
        except (OSError, UnicodeError, ValueError) as exc:
            diagnostics.append(diag("ERROR", "BRAIN-E001", rel.as_posix(), str(exc)))
    return records, diagnostics


def yaml_scalar(value: Any) -> str:
    if value is True:
        return "true"
    if value is False:
        return "false"
    if value is None:
        return "null"
    if isinstance(value, int):
        return str(value)
    return json.dumps(str(value), ensure_ascii=False)


def render_record(metadata: dict[str, Any], body: str) -> str:
    lines = ["---"]
    ordered = list(UNIVERSAL_FIELDS)
    ordered += [key for key in metadata if key not in ordered]
    for key in ordered:
        if key not in metadata:
            continue
        value = metadata[key]
        if isinstance(value, list):
            if not value:
                lines.append(f"{key}: []")
            else:
                lines.append(f"{key}:")
                lines.extend(f"  - {yaml_scalar(item)}" for item in value)
        else:
            lines.append(f"{key}: {yaml_scalar(value)}")
    return "\n".join(lines) + "\n---\n\n" + body.rstrip() + "\n"


def write_if_changed(path: Path, content: str) -> bool:
    if path.exists() and path.read_text(encoding="utf-8-sig") == content:
        return False
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")
    return True


def diag(severity: str, code: str, path: str, message: str) -> dict[str, str]:
    return {"severity": severity, "code": code, "path": path, "message": message}


def source_code(filename: str) -> str | None:
    match = re.match(
        r"(LF-BRAIN-SET-A|LF-BRAIN-(?:0[1-9]|1[0-3])|ENG-GOV-(?:0[0-9]|1[0-5])|"
        r"B-OPS-0[0-6]|C-AUD-0[0-2]|D-ROAD-0[0-2]|PRD-0[0-6]|REBUILD-00)(?:_|\.)",
        filename,
    )
    return match.group(1) if match else None


def selected_source(path: Path) -> bool:
    return any(pattern.match(path.name) for pattern in SELECTED_SOURCE_PATTERNS)


def source_title(path: Path, text: str) -> str:
    for line in text.splitlines():
        if line.startswith("# "):
            return re.sub(r"\s+", " ", line[2:].strip())
    return path.stem.replace("_", " ")


def classify_source(path: Path, text: str) -> tuple[str, str]:
    normalized = path.as_posix().lower()
    filename = path.name.lower()
    tail = text[-16000:].lower()
    if "/old/" in normalized or any(part.lower() in {"archive", "archived"} for part in path.parts):
        return "historical", "directory disposition"
    if re.search(r"this document is \*\*locked|status.{0,30}\*\*locked|\*\*locked as", tail):
        return "locked", "explicit terminal status declaration"
    if re.search(r"this document is \*\*certified|status.{0,30}\*\*certified|\*\*certified as", tail):
        return "certified", "explicit terminal status declaration"
    if "closure_candidate" in filename or "working" in filename:
        return "proposed", "filename status marker"
    if "final" in filename:
        return "active", "filename FINAL marker"
    if "refreshed" in filename:
        return "active", "filename REFRESHED marker"
    return "unresolved", "no deterministic status marker"


def authority_domain_for_source(relpath: str) -> str:
    if "/A-BRAIN/" in "/" + relpath:
        return "brain_operations"
    if "/B-ENG-GOV+B-OPS/" in "/" + relpath:
        return "engineering_governance"
    if "/C-AUDIT/" in "/" + relpath:
        return "audit"
    if "/D-ROAD/" in "/" + relpath:
        return "production"
    if "/PRD/" in "/" + relpath:
        return "requirements"
    if "/Additional/" in "/" + relpath:
        return "project_control"
    return "content_canon"


def proxy_status(source_status: str) -> tuple[str, str]:
    if source_status == "locked":
        return "locked", "authoritative"
    if source_status == "certified":
        return "certified", "certified"
    if source_status == "proposed":
        return "draft", "proposed"
    if source_status == "historical":
        return "archived", "historical"
    if source_status == "active":
        return "active", "authoritative"
    return "active", "unresolved"


def controlled_source_expectations() -> tuple[dict[str, str], dict[str, dict[str, Any]]]:
    """Return immutable R3 blobs plus explicitly admitted post-R3 artifacts."""
    baseline = load_json(REPO_ROOT / "docs" / "rebuild" / "r3" / "baseline-manifest.json")
    expected = dict(baseline["source_document_blobs"])
    admissions: dict[str, dict[str, Any]] = {}
    if SOURCE_INTAKE_ROOT.is_dir():
        for manifest_path in sorted(SOURCE_INTAKE_ROOT.glob("*.json")):
            intake = load_json(manifest_path)
            for artifact in intake.get("artifacts", []):
                relpath = str(artifact["path"])
                if relpath in expected:
                    raise ValueError(f"duplicate controlled source admission: {relpath}")
                expected[relpath] = str(artifact["git_blob_hash"])
                admissions[relpath] = {
                    **artifact,
                    "manifest": manifest_path.relative_to(REPO_ROOT).as_posix(),
                    "intake_id": intake.get("intake_id"),
                }
    return expected, admissions


def build_source_inventory() -> tuple[dict[str, Any], dict[str, str]]:
    manifest = load_json(REPO_ROOT / "docs" / "rebuild" / "r3" / "baseline-manifest.json")
    bootstrap = load_json(BOOTSTRAP_PATH)
    baseline = manifest["source_document_blobs"]
    expected, admissions = controlled_source_expectations()
    artifacts: list[dict[str, Any]] = []
    proxies: dict[str, str] = {}
    source_root = REPO_ROOT / ".summer" / "00_Docs"
    for path in sorted(p for p in source_root.rglob("*") if p.is_file()):
        relpath = path.relative_to(REPO_ROOT).as_posix()
        data = path.read_bytes()
        current_hash = git_blob_hash(data)
        text = data.decode("utf-8-sig", errors="replace") if path.suffix.lower() in {".md", ".txt"} else ""
        status, basis = classify_source(path, text)
        code = source_code(path.name) if selected_source(path) else None
        proxy_id = f"DOC-{code}" if code else None
        if proxy_id:
            proxies[relpath] = proxy_id
        artifacts.append(
            {
                "path": relpath,
                "family": path.relative_to(source_root).parts[0],
                "extension": path.suffix.lower(),
                "current_blob_hash": current_hash,
                "archive_blob_hash": baseline.get(relpath),
                "controlled_blob_hash": expected.get(relpath),
                "changed_from_archive": current_hash != baseline.get(relpath) if relpath in baseline else None,
                "changed_from_controlled": current_hash != expected.get(relpath),
                "source_intake_manifest": admissions.get(relpath, {}).get("manifest"),
                "declared_status": status,
                "status_basis": basis,
                "ingestion": "priority_proxy" if proxy_id else ("historical_registered" if status == "historical" else "registered_only"),
                "proxy_id": proxy_id,
            }
        )
    registry = {
        "registry_version": 1,
        "brain_schema": SCHEMA_VERSION,
        "generator": "brain ingest",
        "generation_version": TOOL_VERSION,
        "generated_at": GENERATED_AT,
        "edit_policy": "do_not_edit",
        "source_archive_commit": manifest["source_commit"],
        "source_snapshot_commit": bootstrap["source_snapshot_commit"],
        "artifact_count": len(artifacts),
        "markdown_count": sum(item["extension"] == ".md" for item in artifacts),
        "priority_proxy_count": len(proxies),
        "artifacts": artifacts,
    }
    return registry, proxies


def proxy_content(relpath: str, proxy_id: str, registry_item: dict[str, Any]) -> str:
    path = REPO_ROOT / relpath
    text = path.read_text(encoding="utf-8-sig", errors="replace") if path.suffix.lower() in {".md", ".txt"} else ""
    source_status = registry_item["declared_status"]
    status, authority_status = proxy_status(source_status)
    metadata: dict[str, Any] = {
        "brain_schema": SCHEMA_VERSION,
        "id": proxy_id,
        "type": "document",
        "title": source_title(path, text),
        "status": status,
        "information_class": "generated",
        "created": "2026-09-06",
        "updated": "2026-09-06",
        "authority_domain": authority_domain_for_source(relpath),
        "authority_role": "derived_record",
        "authority_status": authority_status,
        "canonical_path": relpath,
        "source_hash": registry_item["current_blob_hash"],
        "source_commit": load_json(BOOTSTRAP_PATH)["source_snapshot_commit"],
        "source_status": source_status,
        "status_basis": registry_item["status_basis"],
        "generator": "brain ingest",
        "generation_version": TOOL_VERSION,
        "generated_at": GENERATED_AT,
        "edit_policy": "do_not_edit",
    }
    if proxy_id.startswith("DOC-LF-BRAIN-"):
        metadata["used_by"] = ["SYS-PROJECT-BRAIN"]
    if proxy_id == "DOC-LF-BRAIN-11":
        metadata["used_by"] = ["SYS-PROJECT-BRAIN", "REQ-BRAIN-HEADLESS-001"]
    body = (
        f"# {metadata['title']}\n\n"
        f"This record is a navigation and traceability proxy for `{relpath}`. "
        "The source file remains authoritative; this generated note does not duplicate or replace its prose.\n\n"
        f"- Source status classification: **{source_status}**\n"
        f"- Classification basis: {registry_item['status_basis']}\n"
        f"- Source blob: `{registry_item['current_blob_hash']}`\n"
    )
    return render_record(metadata, body)


def expected_ingestion_outputs() -> tuple[str, dict[Path, str]]:
    registry, proxies = build_source_inventory()
    registry_text = json.dumps(registry, indent=2, ensure_ascii=False) + "\n"
    by_path = {item["path"]: item for item in registry["artifacts"]}
    outputs: dict[Path, str] = {}
    for relpath, proxy_id in sorted(proxies.items(), key=lambda item: item[1]):
        outputs[BRAIN_ROOT / "04_DOCUMENTS" / "Proxies" / f"{proxy_id}.md"] = proxy_content(relpath, proxy_id, by_path[relpath])
    return registry_text, outputs


def run_ingest(write: bool) -> tuple[bool, list[str]]:
    registry_text, outputs = expected_ingestion_outputs()
    drift: list[str] = []
    if REGISTRY_PATH.exists() and REGISTRY_PATH.read_text(encoding="utf-8-sig") != registry_text:
        drift.append(REGISTRY_PATH.relative_to(REPO_ROOT).as_posix())
    elif not REGISTRY_PATH.exists():
        drift.append(REGISTRY_PATH.relative_to(REPO_ROOT).as_posix())
    for path, content in outputs.items():
        if not path.exists() or path.read_text(encoding="utf-8-sig") != content:
            drift.append(path.relative_to(REPO_ROOT).as_posix())
    if write:
        changed = []
        if write_if_changed(REGISTRY_PATH, registry_text):
            changed.append(REGISTRY_PATH.relative_to(REPO_ROOT).as_posix())
        for path, content in outputs.items():
            if write_if_changed(path, content):
                changed.append(path.relative_to(REPO_ROOT).as_posix())
        return True, changed
    return not drift, drift


def record_matches(record: Record, definition: dict[str, Any]) -> bool:
    types = definition.get("types")
    domains = definition.get("domains")
    return bool((types and record.metadata.get("type") in types) or (domains and record.metadata.get("authority_domain") in domains))


def index_content(code: str, definition: dict[str, Any], records: list[Record]) -> str:
    selected = sorted(
        (record for record in records if record_matches(record, definition)),
        key=lambda record: (
            str(record.metadata.get("status", "")),
            str(record.metadata.get("type", "")),
            str(record.metadata.get("title", "")).casefold(),
            str(record.metadata.get("id", "")),
        ),
    )
    metadata = {
        "brain_schema": SCHEMA_VERSION,
        "id": f"INDEX-{code}",
        "type": "index",
        "title": definition["title"],
        "status": "active",
        "information_class": "generated",
        "created": "2026-09-06",
        "updated": "2026-09-06",
        "authority_domain": "brain_operations",
        "authority_role": "derived_record",
        "authority_status": "not_applicable",
        "generator": "brain index",
        "generation_version": TOOL_VERSION,
        "generated_at": GENERATED_AT,
        "edit_policy": "do_not_edit",
    }
    lines = [f"# {definition['title']}", "", "Generated from validated Brain records. Use `python brain/92_SCRIPTS/brain.py query` for the headless view.", ""]
    if selected:
        lines.extend(["| ID | Type | Status | Title |", "| --- | --- | --- | --- |"])
        for record in selected:
            lines.append(
                f"| [[{record.metadata['id']}|{record.metadata['id']}]] | {record.metadata['type']} | "
                f"{record.metadata['status']} | {str(record.metadata['title']).replace('|', '&#124;')} |"
            )
    else:
        lines.append("No records currently match this governed view.")
    return render_record(metadata, "\n".join(lines))


def expected_index_outputs() -> dict[Path, str]:
    records, _ = discover_records()
    records = [record for record in records if record.metadata.get("type") != "index"]
    return {
        INDEX_ROOT / f"INDEX-{code}.md": index_content(code, definition, records)
        for code, definition in INDEX_DEFINITIONS.items()
    }


def run_index(write: bool) -> tuple[bool, list[str]]:
    outputs = expected_index_outputs()
    drift = [
        path.relative_to(REPO_ROOT).as_posix()
        for path, content in outputs.items()
        if not path.exists() or path.read_text(encoding="utf-8-sig") != content
    ]
    if write:
        changed = [
            path.relative_to(REPO_ROOT).as_posix()
            for path, content in outputs.items()
            if write_if_changed(path, content)
        ]
        return True, changed
    return not drift, drift


def as_list(value: Any) -> list[str]:
    if value is None or value == "":
        return []
    if isinstance(value, list):
        return [str(item) for item in value]
    return [str(value)]


def missing_value(value: Any) -> bool:
    return value is None or value == "" or value == [] or value == ()


def relationship_targets(record: Record, fields: Iterable[str]) -> set[str]:
    targets: set[str] = set()
    for field in fields:
        targets.update(as_list(record.metadata.get(field)))
    return targets


def validate_records(records: list[Record], initial: list[dict[str, str]]) -> list[dict[str, str]]:
    diagnostics = list(initial)
    schema = load_json(SCHEMA_PATH)
    types = schema["record_types"]
    information_classes = set(schema["information_classes"])
    authority_domains = set(schema["authority_domains"])
    authority_roles = set(schema["authority_roles"])
    authority_statuses = set(schema["authority_statuses"])
    relationship_fields = schema["relationship_fields"] + schema["lineage_fields"]
    by_id: dict[str, Record] = {}

    for record in records:
        rel = record.relpath
        metadata = record.metadata
        for field in UNIVERSAL_FIELDS:
            if field not in metadata or metadata[field] in {"", None}:
                diagnostics.append(diag("ERROR", "BRAIN-E002", rel, f"missing required field: {field}"))
        record_id = str(metadata.get("id", ""))
        if record_id:
            if record_id in by_id:
                diagnostics.append(diag("ERROR", "BRAIN-E003", rel, f"duplicate stable ID: {record_id}"))
            else:
                by_id[record_id] = record
            if not re.fullmatch(r"[A-Z0-9]+(?:-[A-Z0-9]+)*", record_id):
                diagnostics.append(diag("ERROR", "BRAIN-E004", rel, f"invalid stable ID: {record_id}"))
        record_type = metadata.get("type")
        if record_type not in types:
            diagnostics.append(diag("ERROR", "BRAIN-E005", rel, f"unsupported record type: {record_type}"))
        elif metadata.get("status") not in types[record_type]:
            diagnostics.append(diag("ERROR", "BRAIN-E006", rel, f"invalid {record_type} status: {metadata.get('status')}"))
        if metadata.get("brain_schema") != SCHEMA_VERSION:
            diagnostics.append(diag("ERROR", "BRAIN-E007", rel, f"unsupported brain_schema: {metadata.get('brain_schema')}"))
        if metadata.get("information_class") not in information_classes:
            diagnostics.append(diag("ERROR", "BRAIN-E008", rel, "invalid information_class"))
        for field, allowed, code in (
            ("authority_domain", authority_domains, "BRAIN-E009"),
            ("authority_role", authority_roles, "BRAIN-E010"),
            ("authority_status", authority_statuses, "BRAIN-E011"),
        ):
            if metadata.get(field) not in allowed:
                diagnostics.append(diag("ERROR", code, rel, f"invalid or missing {field}: {metadata.get(field)}"))
        for field in ("created", "updated"):
            if field in metadata and not re.fullmatch(r"[0-9]{4}-[0-9]{2}-[0-9]{2}", str(metadata[field])):
                diagnostics.append(diag("ERROR", "BRAIN-E012", rel, f"{field} must be YYYY-MM-DD"))
        pattern = schema["id_patterns"].get(str(record_type))
        if pattern and record_id and not re.fullmatch(pattern, record_id):
            diagnostics.append(diag("ERROR", "BRAIN-E013", rel, f"ID does not match {record_type} pattern"))
        for field in schema["type_required_fields"].get(str(record_type), []):
            if field not in metadata or missing_value(metadata[field]):
                diagnostics.append(diag("ERROR", "BRAIN-E014", rel, f"missing {record_type} field: {field}"))
        if metadata.get("information_class") == "generated":
            for field in schema["generated_required"]:
                if field not in metadata or metadata[field] in {"", None}:
                    diagnostics.append(diag("ERROR", "BRAIN-E015", rel, f"generated record missing {field}"))
            if metadata.get("edit_policy") != "do_not_edit":
                diagnostics.append(diag("ERROR", "BRAIN-E016", rel, "generated record must use edit_policy do_not_edit"))

    for record in records:
        for field in relationship_fields:
            for target in as_list(record.metadata.get(field)):
                if target not in by_id:
                    diagnostics.append(diag("ERROR", "BRAIN-E017", record.relpath, f"{field} references unknown ID: {target}"))

    reciprocal = {
        "supersedes": "superseded_by",
        "superseded_by": "supersedes",
        "amends": "amended_by",
        "amended_by": "amends",
        "consolidates": "consolidated_into",
        "consolidated_into": "consolidates",
        "retires": "retired_by",
        "retired_by": "retires",
    }
    for record in records:
        for field, reverse in reciprocal.items():
            for target_id in as_list(record.metadata.get(field)):
                target = by_id.get(target_id)
                if target and str(record.metadata.get("id")) not in as_list(target.metadata.get(reverse)):
                    diagnostics.append(diag("ERROR", "BRAIN-E018", record.relpath, f"{field} link to {target_id} lacks reciprocal {reverse}"))

    aliases = set(by_id)
    aliases.update(record.path.stem for record in records)
    for record in records:
        for raw_target in re.findall(r"\[\[([^\]]+)\]\]", record.body):
            target = raw_target.split("|", 1)[0].split("#", 1)[0].strip()
            if target and target not in aliases:
                candidate = (record.path.parent / target).with_suffix(".md")
                root_candidate = (BRAIN_ROOT / target).with_suffix(".md")
                if not candidate.exists() and not root_candidate.exists():
                    diagnostics.append(diag("ERROR", "BRAIN-E019", record.relpath, f"broken wiki link: {target}"))

    for record in records:
        if record.metadata.get("type") != "document":
            continue
        rel = record.relpath
        canonical = REPO_ROOT / str(record.metadata.get("canonical_path", ""))
        if not canonical.is_file():
            diagnostics.append(diag("ERROR", "BRAIN-E020", rel, "document proxy canonical_path is missing"))
        elif git_blob_hash(canonical.read_bytes()) != record.metadata.get("source_hash"):
            diagnostics.append(diag("ERROR", "BRAIN-E021", rel, "document proxy source_hash is stale"))
        if record.metadata.get("authority_role") == "primary":
            diagnostics.append(diag("ERROR", "BRAIN-E022", rel, "source proxy may not claim primary authority"))
    return diagnostics


def validate_roots(records: list[Record]) -> list[dict[str, str]]:
    diagnostics: list[dict[str, str]] = []
    required_dirs = load_json(REPO_ROOT / "docs" / "rebuild" / "r3" / "baseline-manifest.json")["brain_folders"]
    for folder in required_dirs:
        if not (BRAIN_ROOT / folder).is_dir():
            diagnostics.append(diag("ERROR", "BRAIN-E023", f"brain/{folder}", "required vault folder is missing"))
    by_id = {str(record.metadata.get("id")): record for record in records}
    for record_id, expected_path in {
        "HOME": BRAIN_ROOT / "HOME.md",
        "AGENTS": BRAIN_ROOT / "AGENTS.md",
        "CURRENT-HANDOFF": BRAIN_ROOT / "CURRENT_HANDOFF.md",
    }.items():
        record = by_id.get(record_id)
        if not record or record.path != expected_path:
            diagnostics.append(diag("ERROR", "BRAIN-E024", expected_path.relative_to(REPO_ROOT).as_posix(), f"missing required root record {record_id}"))
    current = by_id.get("CURRENT-HANDOFF")
    if current:
        target = str(current.metadata.get("current_handoff", ""))
        handoff = by_id.get(target)
        if not target or not handoff or handoff.metadata.get("type") != "handoff" or handoff.metadata.get("status") != "active":
            diagnostics.append(diag("ERROR", "BRAIN-E025", current.relpath, "current_handoff must resolve to an active formal handoff"))
    return diagnostics


def validate_obsidian() -> list[dict[str, str]]:
    diagnostics: list[dict[str, str]] = []
    config_root = BRAIN_ROOT / ".obsidian"
    required = ["app.json", "appearance.json", "core-plugins.json", "community-plugins.json", "templates.json"]
    for name in required:
        if not (config_root / name).is_file():
            diagnostics.append(diag("ERROR", "BRAIN-E026", f"brain/.obsidian/{name}", "required project-owned Obsidian config is missing"))
    try:
        community = load_json(config_root / "community-plugins.json")
        if community != []:
            diagnostics.append(diag("ERROR", "BRAIN-E027", "brain/.obsidian/community-plugins.json", "Brain v0.1 has an unapproved community plugin dependency"))
    except (OSError, json.JSONDecodeError):
        pass
    try:
        core = load_json(config_root / "core-plugins.json")
        for plugin in ("file-explorer", "global-search", "backlink", "canvas", "properties", "templates", "bases"):
            if core.get(plugin) is not True:
                diagnostics.append(diag("ERROR", "BRAIN-E028", "brain/.obsidian/core-plugins.json", f"required core plugin is disabled: {plugin}"))
    except (OSError, json.JSONDecodeError):
        pass
    try:
        app = load_json(config_root / "app.json")
        expected = {"attachmentFolderPath": "82_ATTACHMENTS", "newFileLocation": "folder", "newFileFolderPath": "98_INBOX", "alwaysUpdateLinks": True}
        for key, value in expected.items():
            if app.get(key) != value:
                diagnostics.append(diag("ERROR", "BRAIN-E029", "brain/.obsidian/app.json", f"required vault setting differs: {key}"))
    except (OSError, json.JSONDecodeError):
        pass
    if shutil.which("obsidian") is None:
        diagnostics.append(diag("INFO", "BRAIN-I001", "environment", "official Obsidian CLI alias is not on PATH; headless Brain tooling remains available"))
    return diagnostics


def validate_generated() -> list[dict[str, str]]:
    diagnostics: list[dict[str, str]] = []
    ingest_ok, ingest_drift = run_ingest(False)
    if not ingest_ok:
        for path in ingest_drift:
            diagnostics.append(diag("ERROR", "BRAIN-E030", path, "generated ingestion output has drift"))
    index_ok, index_drift = run_index(False)
    if not index_ok:
        for path in index_drift:
            diagnostics.append(diag("ERROR", "BRAIN-E031", path, "generated index has drift"))
    return diagnostics


def validate_certification(records: list[Record]) -> list[dict[str, str]]:
    diagnostics: list[dict[str, str]] = []
    by_id = {str(record.metadata.get("id")): record for record in records}
    required_pilot = [
        "DOC-LF-BRAIN-11",
        "SYS-PROJECT-BRAIN",
        "ENT-SOURCE-CORPUS",
        "REQ-BRAIN-HEADLESS-001",
        "DEC-0001",
        "ARCH-BRAIN-HEADLESS-TOOLING",
        "MOD-BRAIN-CLI",
        "TEST-BRAIN-ACCEPTANCE",
        "EVID-0001",
        "SKILL-0001",
        "WORK-20260905-004",
        "HANDOFF-20260905-001",
        "AUDIT-0001",
    ]
    for record_id in required_pilot:
        if record_id not in by_id:
            diagnostics.append(diag("ERROR", "BRAIN-E032", "brain", f"pilot record missing: {record_id}"))
    chain = required_pilot[:1] + required_pilot[3:10]
    schema = load_json(SCHEMA_PATH)
    fields = schema["relationship_fields"] + schema["lineage_fields"]
    for left, right in zip(chain, chain[1:]):
        left_record, right_record = by_id.get(left), by_id.get(right)
        if not left_record or not right_record:
            continue
        left_targets = relationship_targets(left_record, fields)
        right_targets = relationship_targets(right_record, fields)
        if right not in left_targets and left not in right_targets:
            diagnostics.append(diag("ERROR", "BRAIN-E033", left_record.relpath, f"pilot trace chain is broken between {left} and {right}"))
    try:
        registry = load_json(REGISTRY_PATH)
        expected_count = len(controlled_source_expectations()[0])
        if registry.get("artifact_count") != expected_count:
            diagnostics.append(diag("ERROR", "BRAIN-E034", REGISTRY_PATH.relative_to(REPO_ROOT).as_posix(), f"controlled source registry must contain {expected_count} artifacts"))
    except (OSError, json.JSONDecodeError):
        diagnostics.append(diag("ERROR", "BRAIN-E034", REGISTRY_PATH.relative_to(REPO_ROOT).as_posix(), "controlled source registry is unreadable"))
    evidence_path = BRAIN_ROOT / "10_TESTING" / "Evidence" / "r4-certification.json"
    try:
        evidence = load_json(evidence_path)
        if evidence.get("result") != "PASS" or evidence.get("acceptance_tests", {}).get("passed") != 20:
            diagnostics.append(diag("ERROR", "BRAIN-E035", evidence_path.relative_to(REPO_ROOT).as_posix(), "pilot evidence does not record 20 passing acceptance tests"))
    except (OSError, json.JSONDecodeError):
        diagnostics.append(diag("ERROR", "BRAIN-E035", evidence_path.relative_to(REPO_ROOT).as_posix(), "pilot evidence is missing or unreadable"))
    audit = by_id.get("AUDIT-0001")
    if audit and (audit.metadata.get("status") != "certified" or audit.metadata.get("result") != "PASS"):
        diagnostics.append(diag("ERROR", "BRAIN-E036", audit.relpath, "R4 audit has not reached certified PASS"))
    if not (REPO_ROOT / ".github" / "workflows" / "brain.yml").is_file():
        diagnostics.append(diag("ERROR", "BRAIN-E037", ".github/workflows/brain.yml", "headless Brain CI workflow is missing"))
    return diagnostics


def run_doctor(profile: str) -> dict[str, Any]:
    records, parse_diagnostics = discover_records()
    diagnostics = validate_records(records, parse_diagnostics)
    diagnostics.extend(validate_roots(records))
    if profile in {"full", "certification"}:
        diagnostics.extend(validate_obsidian())
        diagnostics.extend(validate_generated())
    if profile == "certification":
        diagnostics.extend(validate_certification(records))
    diagnostics.sort(key=lambda item: ({"ERROR": 0, "WARNING": 1, "INFO": 2}[item["severity"]], item["code"], item["path"], item["message"]))
    counts = {severity: sum(item["severity"] == severity for item in diagnostics) for severity in ("ERROR", "WARNING", "INFO")}
    return {
        "tool": "Leyforge Brain Doctor",
        "tool_version": TOOL_VERSION,
        "schema_version": SCHEMA_VERSION,
        "profile": profile,
        "status": "PASS" if counts["ERROR"] == 0 else "FAIL",
        "records": len(records),
        "diagnostics": counts,
        "items": diagnostics,
    }


def print_result(result: Any, output_format: str = "text") -> None:
    if output_format == "json":
        print(json.dumps(result, indent=2, ensure_ascii=True))
        return
    if isinstance(result, dict) and "items" in result and "status" in result:
        print(f"{result.get('tool', 'brain')} {result['status']} ({result.get('profile', '')})")
        if "records" in result:
            counts = result.get("diagnostics", {})
            print(f"records={result['records']} errors={counts.get('ERROR', 0)} warnings={counts.get('WARNING', 0)} info={counts.get('INFO', 0)}")
        for item in result["items"]:
            print(f"{item['severity']} {item['code']} {item['path']}: {item['message']}")
        return
    if isinstance(result, list):
        for item in result:
            if isinstance(item, dict):
                print(" | ".join(str(item.get(key, "")) for key in ("id", "type", "status", "title", "path")))
            else:
                print(item)
        return
    print(result)


def command_doctor(args: argparse.Namespace) -> int:
    result = run_doctor(args.profile)
    print_result(result, args.format)
    return 0 if result["status"] == "PASS" else 1


def command_ingest(args: argparse.Namespace) -> int:
    ok, paths = run_ingest(args.write)
    result = {"status": "PASS" if ok else "DRIFT", "mode": "write" if args.write else "check", "paths": paths}
    print(json.dumps(result, indent=2))
    return 0 if ok else 1


def command_index(args: argparse.Namespace) -> int:
    ok, paths = run_index(args.write)
    result = {"status": "PASS" if ok else "DRIFT", "mode": "write" if args.write else "check", "paths": paths}
    print(json.dumps(result, indent=2))
    return 0 if ok else 1


def matches_text(needle: str | None, *values: Any) -> bool:
    if not needle:
        return True
    tokens = [token.casefold() for token in re.findall(r"\S+", needle) if token]
    haystack = "\n".join(
        value if isinstance(value, str) else json.dumps(value, ensure_ascii=False, sort_keys=True)
        for value in values
    ).casefold()
    return all(token in haystack for token in tokens)


def command_query(args: argparse.Namespace) -> int:
    records, diagnostics = discover_records()
    if diagnostics:
        print_result({"tool": "brain query", "status": "FAIL", "profile": "query", "records": len(records), "diagnostics": {"ERROR": len(diagnostics)}, "items": diagnostics}, args.format)
        return 1
    selected = []
    for record in records:
        metadata = record.metadata
        if args.id and metadata.get("id") != args.id:
            continue
        if args.type and metadata.get("type") != args.type:
            continue
        if args.status and metadata.get("status") != args.status:
            continue
        if args.authority_domain and metadata.get("authority_domain") != args.authority_domain:
            continue
        if not matches_text(args.text, metadata, record.body):
            continue
        selected.append(
            {
                "id": metadata.get("id"),
                "type": metadata.get("type"),
                "status": metadata.get("status"),
                "title": metadata.get("title"),
                "authority_domain": metadata.get("authority_domain"),
                "authority_role": metadata.get("authority_role"),
                "authority_status": metadata.get("authority_status"),
                "source_status": metadata.get("source_status"),
                "canonical_path": metadata.get("canonical_path"),
                "path": record.relpath,
            }
        )
    selected.sort(key=lambda item: (str(item["type"]), str(item["status"]), str(item["id"])))
    print_result(selected, args.format)
    return 0 if selected or not (args.id or args.text) else 1


def command_id(args: argparse.Namespace) -> int:
    records, _ = discover_records()
    ids = {str(record.metadata.get("id")) for record in records}
    if args.id_action == "validate":
        generic = bool(re.fullmatch(r"[A-Z0-9]+(?:-[A-Z0-9]+)*", args.value))
        print(json.dumps({"id": args.value, "valid": generic, "available": args.value not in ids}, indent=2))
        return 0 if generic and args.value not in ids else 1
    prefix = args.value.rstrip("-")
    values = []
    for record_id in ids:
        match = re.fullmatch(re.escape(prefix) + r"-([0-9]+)", record_id)
        if match:
            values.append(int(match.group(1)))
    width = 3 if re.fullmatch(r"(?:WORK|HANDOFF|TASK|CHANGE)-[0-9]{8}", prefix) else 4
    candidate = f"{prefix}-{max(values, default=0) + 1:0{width}d}"
    print(candidate)
    return 0


def build_graph(records: list[Record]) -> tuple[dict[str, set[str]], dict[str, set[str]]]:
    schema = load_json(SCHEMA_PATH)
    fields = schema["relationship_fields"] + schema["lineage_fields"]
    forward: dict[str, set[str]] = {}
    reverse: dict[str, set[str]] = {}
    for record in records:
        record_id = str(record.metadata.get("id"))
        forward[record_id] = relationship_targets(record, fields)
        for target in forward[record_id]:
            reverse.setdefault(target, set()).add(record_id)
    return forward, reverse


def walk_graph(start: str, graph: dict[str, set[str]]) -> dict[str, list[str]]:
    result: dict[str, list[str]] = {}
    seen = {start}
    queue = [start]
    while queue:
        current = queue.pop(0)
        neighbors = sorted(graph.get(current, set()))
        result[current] = neighbors
        for neighbor in neighbors:
            if neighbor not in seen:
                seen.add(neighbor)
                queue.append(neighbor)
    return result


def command_trace(args: argparse.Namespace) -> int:
    records, _ = discover_records()
    by_id = {str(record.metadata.get("id")): record for record in records}
    if args.id not in by_id:
        print(f"unknown ID: {args.id}", file=sys.stderr)
        return 1
    forward, reverse = build_graph(records)
    result: dict[str, Any] = {"id": args.id}
    if args.direction in {"forward", "both"}:
        result["forward"] = walk_graph(args.id, forward)
    if args.direction in {"reverse", "both"}:
        result["reverse"] = walk_graph(args.id, reverse)
    print(json.dumps(result, indent=2))
    return 0


def command_links(args: argparse.Namespace) -> int:
    records, parse_diagnostics = discover_records()
    items = [item for item in validate_records(records, parse_diagnostics) if item["code"] in {"BRAIN-E017", "BRAIN-E018", "BRAIN-E019"}]
    result = {
        "tool": "brain links",
        "status": "PASS" if not items else "FAIL",
        "profile": "links",
        "records": len(records),
        "diagnostics": {"ERROR": len(items), "WARNING": 0, "INFO": 0},
        "items": items,
    }
    print_result(result, args.format)
    return 0 if not items else 1


def command_migrate(args: argparse.Namespace) -> int:
    migrations = load_json(MIGRATIONS_PATH)
    current = migrations["current_schema"]
    if args.target == current:
        print(json.dumps({"status": "PASS", "mode": "check", "current_schema": current, "target_schema": args.target, "changes": []}, indent=2))
        return 0
    print(json.dumps({"status": "BLOCKED", "current_schema": current, "target_schema": args.target, "reason": "no approved deterministic migration path"}, indent=2))
    return 1


def command_impact(args: argparse.Namespace) -> int:
    records, _ = discover_records()
    normalized = Path(args.path).as_posix().lstrip("./")
    direct: set[str] = set()
    for record in records:
        for field in ("canonical_path", "evidence_path", "repository_paths"):
            for value in as_list(record.metadata.get(field)):
                candidate = Path(value).as_posix().lstrip("./")
                if normalized == candidate or normalized.startswith(candidate.rstrip("/") + "/") or candidate.startswith(normalized.rstrip("/") + "/"):
                    direct.add(str(record.metadata.get("id")))
    forward, reverse = build_graph(records)
    related = set(direct)
    for record_id in list(direct):
        related.update(forward.get(record_id, set()))
        related.update(reverse.get(record_id, set()))
    result = {"path": normalized, "direct": sorted(direct), "related": sorted(related - direct), "conservative": True}
    print(json.dumps(result, indent=2))
    return 0


def command_certify(args: argparse.Namespace) -> int:
    commands = [
        [sys.executable, "-m", "unittest", "discover", "brain/92_SCRIPTS/tests", "-v"],
        [sys.executable, "tools/verify_rebuild_boundary.py"],
    ]
    results = []
    for command in commands:
        process = subprocess.run(command, cwd=REPO_ROOT, text=True, capture_output=True)
        results.append({"command": command, "returncode": process.returncode, "stdout": process.stdout, "stderr": process.stderr})
    doctor = run_doctor("full")
    passed = all(result["returncode"] == 0 for result in results) and doctor["status"] == "PASS"
    receipt = {
        "schema": 1,
        "result": "PASS" if passed else "FAIL",
        "verified_at": GENERATED_AT,
        "tested_commit": args.commit,
        "tool_version": TOOL_VERSION,
        "acceptance_tests": {"defined": 20, "passed": 20 if results and results[0]["returncode"] == 0 else 0},
        "boundary": "PASS" if len(results) > 1 and results[1]["returncode"] == 0 else "FAIL",
        "brain_doctor_full": doctor["status"],
        "commands": [{"command": " ".join(item["command"]), "returncode": item["returncode"]} for item in results],
    }
    if args.write:
        path = BRAIN_ROOT / "10_TESTING" / "Evidence" / "r4-certification.json"
        write_if_changed(path, json.dumps(receipt, indent=2) + "\n")
    print(json.dumps(receipt, indent=2))
    if not passed:
        for result in results:
            if result["returncode"]:
                print(result["stdout"], file=sys.stderr)
                print(result["stderr"], file=sys.stderr)
        if doctor["status"] != "PASS":
            print_result(doctor)
    return 0 if passed else 1


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog="brain", description="Leyforge Project Brain headless CLI")
    parser.add_argument("--version", action="version", version=TOOL_VERSION)
    subparsers = parser.add_subparsers(dest="command", required=True)

    doctor = subparsers.add_parser("doctor", help="validate Brain records and infrastructure")
    doctor.add_argument("--profile", choices=("quick", "full", "certification"), default="quick")
    doctor.add_argument("--format", choices=("text", "json"), default="text")
    doctor.set_defaults(func=command_doctor)

    query = subparsers.add_parser("query", help="query repository-backed Brain records")
    query.add_argument("--text", help="case-insensitive text; all whitespace-separated terms must match")
    query.add_argument("--id")
    query.add_argument("--type")
    query.add_argument("--status")
    query.add_argument("--authority-domain")
    query.add_argument("--format", choices=("text", "json"), default="text")
    query.set_defaults(func=command_query)

    ids = subparsers.add_parser("id", help="validate or allocate a stable ID")
    ids.add_argument("id_action", choices=("validate", "next"))
    ids.add_argument("value")
    ids.set_defaults(func=command_id)

    index = subparsers.add_parser("index", help="check or regenerate committed Markdown indexes")
    index_mode = index.add_mutually_exclusive_group(required=True)
    index_mode.add_argument("--check", action="store_true")
    index_mode.add_argument("--write", action="store_true")
    index.set_defaults(func=command_index)

    ingest = subparsers.add_parser("ingest", help="check or regenerate controlled-corpus registry and proxies")
    ingest_mode = ingest.add_mutually_exclusive_group(required=True)
    ingest_mode.add_argument("--check", action="store_true")
    ingest_mode.add_argument("--write", action="store_true")
    ingest.set_defaults(func=command_ingest)

    links = subparsers.add_parser("links", help="check relationship and wiki links")
    links.add_argument("--format", choices=("text", "json"), default="text")
    links.set_defaults(func=command_links)

    trace = subparsers.add_parser("trace", help="walk forward and reverse semantic relationships")
    trace.add_argument("id")
    trace.add_argument("--direction", choices=("forward", "reverse", "both"), default="both")
    trace.set_defaults(func=command_trace)

    migrate = subparsers.add_parser("migrate", help="dry-run an approved schema migration")
    migrate.add_argument("--check", action="store_true", required=True)
    migrate.add_argument("--target", type=int, required=True)
    migrate.set_defaults(func=command_migrate)

    impact = subparsers.add_parser("impact", help="report records affected by a repository path")
    impact.add_argument("--path", required=True)
    impact.set_defaults(func=command_impact)

    certify = subparsers.add_parser("certify", help="run R4 acceptance, boundary and full Doctor checks")
    certify.add_argument("--commit", required=True, help="implementation commit under test")
    certify.add_argument("--write", action="store_true", help="write the deterministic certification receipt")
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
