"""Exact Git-clean W4 readiness/admission boundary generation and validation."""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Dict, List, Mapping, Tuple

from .authority import ROOT, W4_PROOF_IDS, source_identities
from .dependencies import load_reference
from .execution_plan import allocation_issues, preview_execution_plan, registry_snapshot
from .readiness import READINESS_PATH, readiness_report


MANIFEST_PATH = ROOT / "docs/rebuild/r7/w4-readiness-admission-boundary.json"
FIXED_FILES = (
    "tools/tests/test_r7_w4_runtime.py",
    "tools/r7_w4_audit.py",
    "tools/r7_w3_reconciliation.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
    "docs/rebuild/r7/w4-fixture-readiness-validation.json",
    "docs/rebuild/r7/w4-readiness.json",
)
FIXED_TREES = ("proofs/r7/w4", "tools/r7_w4_runtime")


def _canonical_bytes(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def admitted_paths() -> List[str]:
    paths = set()
    for relative in FIXED_FILES:
        if (ROOT / relative).is_file():
            paths.add(relative)
    for relative in FIXED_TREES:
        base = ROOT / relative
        if base.is_dir():
            for path in base.rglob("*"):
                if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() not in {".pyc", ".exe", ".dll", ".pck", ".res", ".tres"}:
                    paths.add(path.relative_to(ROOT).as_posix())
    paths.discard(MANIFEST_PATH.relative_to(ROOT).as_posix())
    return sorted(paths)


def _artifacts(paths: List[str]) -> List[Dict[str, Any]]:
    result = subprocess.run(["git", "hash-object", "--stdin-paths"], cwd=ROOT, input="\n".join(paths) + "\n", text=True, capture_output=True)
    if result.returncode or len(result.stdout.splitlines()) != len(paths):
        raise RuntimeError("W4 Git-clean hashing failed")
    artifacts = []
    for relative, blob in zip(paths, result.stdout.splitlines()):
        data = _canonical_bytes(ROOT / relative)
        artifacts.append({"path": relative, "git_blob": blob, "bytes": len(data), "sha256": hashlib.sha256(data).hexdigest()})
    return artifacts


def build_manifest(implementation_commit: str) -> Dict[str, Any]:
    if not READINESS_PATH.is_file():
        raise RuntimeError("W4 readiness must exist before admission")
    readiness = json.loads(READINESS_PATH.read_text(encoding="utf-8-sig"))
    regenerated = readiness_report(implementation_commit, check_local=False)
    stored_for_equality = dict(readiness)
    regenerated_for_equality = dict(regenerated)
    stored_for_equality["local_dependency_check"] = regenerated_for_equality["local_dependency_check"]
    if readiness.get("status") != "PASS" or stored_for_equality != regenerated_for_equality:
        raise RuntimeError("W4 readiness is not PASS or differs from canonical regeneration")
    if readiness.get("allocated_run_ids") != [] or readiness.get("allocated_evidence_ids") != [] or readiness.get("proof_execution") != "NOT-STARTED":
        raise RuntimeError("W4 readiness allocated or executed")
    paths = admitted_paths()
    previews = preview_execution_plan()
    return {
        "schema_version": "prd07-w4-readiness-admission-boundary-v1",
        "manifest_version": 1,
        "package": "R7-W4-FORGE-TRUST-PRESENTATION-MIGRATION-READINESS-AND-ADMISSION",
        "lifecycle_role": "CURRENT-PRE-EXECUTION-ADMISSION",
        "scope": "development-only-prd07-proof-readiness-runtime",
        "implementation_commit": implementation_commit,
        "source_tree_identity": readiness["source_tree_identity"],
        "readiness_path": READINESS_PATH.relative_to(ROOT).as_posix(),
        "readiness_sha256": hashlib.sha256(_canonical_bytes(READINESS_PATH)).hexdigest(),
        "authority_sources": source_identities(),
        "proof_roster": list(W4_PROOF_IDS),
        "readiness_counts": readiness["readiness_counts"],
        "proof_execution": "NOT-STARTED",
        "execution_gate": "CLOSED-PENDING-SEPARATE-OWNER-AUTHORIZATION",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "next_identity_previews": previews,
        "registry": registry_snapshot(),
        "dependency_identity": load_reference(),
        "fixture_identity": readiness["fixtures"],
        "fcc13e": readiness["fcc13e"],
        "evidence_pack_schema": readiness["evidence_pack_schema"],
        "future_execution_rules": readiness["future_execution_rules"],
        "w3_terminal": readiness["w3_terminal"],
        "artifacts": _artifacts(paths),
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "active_poc_dependencies": 0,
        "w5": "CLOSED",
        "prd08_evaluation": "CLOSED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
    }


def manifest_issues(value: Mapping[str, Any], implementation_commit: str) -> Tuple[str, ...]:
    issues = []
    if value.get("schema_version") != "prd07-w4-readiness-admission-boundary-v1" or value.get("manifest_version") != 1:
        issues.append("W4 admission schema/version differs")
    if value.get("implementation_commit") != implementation_commit:
        issues.append("W4 admission implementation commit differs")
    if value.get("proof_roster") != list(W4_PROOF_IDS) or value.get("readiness_counts") != {"READY": 15, "BLOCKED": 0, "NOT APPLICABLE": 0}:
        issues.append("W4 admission proof roster/readiness differs")
    if value.get("proof_execution") != "NOT-STARTED" or value.get("allocated_run_ids") != [] or value.get("allocated_evidence_ids") != []:
        issues.append("W4 admission executed or allocated")
    previews = value.get("next_identity_previews", [])
    if previews != preview_execution_plan() or any(row.get("identity_state") != "PREVIEW-NOT-ALLOCATED" for row in previews if isinstance(row, dict)):
        issues.append("W4 admission preview identity set differs")
    issues.extend(allocation_issues())
    artifacts = value.get("artifacts", [])
    if not isinstance(artifacts, list) or not artifacts:
        issues.append("W4 admission artifact list is empty")
    else:
        paths = [row.get("path") for row in artifacts if isinstance(row, dict)]
        if paths != admitted_paths():
            issues.append("W4 admission paths differ from governed path enumeration")
        for row in artifacts:
            if not isinstance(row, dict):
                issues.append("W4 admission contains non-object artifact")
                continue
            relative = row.get("path")
            path = ROOT / str(relative)
            if not path.is_file():
                issues.append("W4 admitted path is missing: " + str(relative))
                continue
            data = _canonical_bytes(path)
            if len(data) != row.get("bytes") or hashlib.sha256(data).hexdigest() != row.get("sha256"):
                issues.append("W4 admitted file identity differs: " + str(relative))
            result = subprocess.run(["git", "hash-object", "--", str(relative)], cwd=ROOT, text=True, capture_output=True)
            if result.returncode or result.stdout.strip() != row.get("git_blob"):
                issues.append("W4 admitted Git blob differs: " + str(relative))
    if value.get("fcc13e", {}).get("covered_rows") != 312:
        issues.append("W4 admission does not cover 312 FCC-13E rows")
    if value.get("gameplay_permission") != "CLOSED" or value.get("production_runtime") != "ABSENT" or value.get("active_poc_dependencies") != 0:
        issues.append("W4 admission crossed gameplay/production boundary")
    return tuple(sorted(set(issues)))


def write_manifest(implementation_commit: str) -> Dict[str, Any]:
    value = build_manifest(implementation_commit)
    MANIFEST_PATH.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n", encoding="utf-8")
    return value
