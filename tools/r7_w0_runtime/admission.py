"""Exact Git-clean admission manifest generation for the bounded R7 W0 runtime."""

from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path
from typing import Any, Dict, Iterable

from .dependencies import ROOT, load_lock

MANIFEST_PATH = ROOT / "docs/rebuild/r7/w0-dependency-export-boundary.json"
FIXED_FILES = (
    "tools/tests/test_r7_w0_runtime.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
)
FIXED_TREES = (
    "proofs/r7/w0",
    "tools/r7_w0_runtime",
    "tools/tests/fixtures/r7_architecture",
)
OPTIONAL_TREES = ("docs/rebuild/r7/execution-evidence",)
OPTIONAL_FILES = (
    "docs/rebuild/r7/w0-execution-state.json",
    "docs/rebuild/r7/w0-dependency-export-completion-receipt.json",
)


def _canonical_bytes(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def admitted_paths() -> list[str]:
    paths: set[str] = set()
    for value in FIXED_FILES:
        if (ROOT / value).is_file():
            paths.add(value)
    for value in FIXED_TREES + OPTIONAL_TREES:
        base = ROOT / value
        if base.is_dir():
            for path in base.rglob("*"):
                if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() not in {".pyc", ".exe", ".dll", ".pck"}:
                    paths.add(path.relative_to(ROOT).as_posix())
    for value in OPTIONAL_FILES:
        if (ROOT / value).is_file():
            paths.add(value)
    paths.discard(MANIFEST_PATH.relative_to(ROOT).as_posix())
    return sorted(paths)


def build_manifest(implementation_commit: str) -> Dict[str, Any]:
    paths = admitted_paths()
    result = subprocess.run(
        ["git", "hash-object", "--stdin-paths"], cwd=ROOT,
        input="\n".join(paths) + "\n", text=True, capture_output=True,
    )
    if result.returncode:
        raise RuntimeError(result.stderr.strip() or "Git-clean hashing failed")
    blobs = result.stdout.splitlines()
    if len(blobs) != len(paths):
        raise RuntimeError("Git-clean hashing returned a different path count")
    artifacts = []
    for relative, blob in zip(paths, blobs):
        data = _canonical_bytes(ROOT / relative)
        artifacts.append({
            "path": relative, "bytes": len(data),
            "sha256": hashlib.sha256(data).hexdigest(), "git_blob": blob,
        })
    state_path = ROOT / "docs/rebuild/r7/w0-execution-state.json"
    state = json.loads(state_path.read_text(encoding="utf-8-sig")) if state_path.is_file() else {}
    lock = load_lock()
    return {
        "manifest_version": 1,
        "package": "R7-W0-DEPENDENCY-EXPORT-READINESS",
        "scope": "development-only-prd07-proof-runtime",
        "gameplay_permission": "CLOSED",
        "implementation_commit": implementation_commit,
        "proof_execution": "OBSERVED" if state else "NOT-STARTED",
        "allocated_run_ids": state.get("allocated_run_ids", []),
        "allocated_evidence_ids": state.get("allocated_evidence_ids", []),
        "authority": ["TASK-20260906-005", "WORK-20260906-005", "ADR-0008", "DOC-PRD-07"],
        "dependency_identity": {
            "godot_build_driver": lock["components"]["godot_build_driver"]["revision"],
            "godot_export_template": lock["components"]["godot_export_template"]["revision"],
            "voxel_tools": lock["components"]["voxel_tools"]["revision"],
            "local_patch_status": lock["local_patch_status"],
        },
        "artifacts": artifacts,
    }


def write_manifest(implementation_commit: str) -> Dict[str, Any]:
    value = build_manifest(implementation_commit)
    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST_PATH.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return value
