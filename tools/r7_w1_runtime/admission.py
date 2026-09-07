"""Git-clean exact admission for the bounded W1 proof and evidence surface."""

from __future__ import annotations

import hashlib
import json
import subprocess
from pathlib import Path
from typing import Any, Dict

from .dependencies import ROOT, load_reference
from .execution_plan import PROOF_PLAN

MANIFEST_PATH = ROOT / "docs/rebuild/r7/w1-execution-boundary.json"
FIXED_FILES = ("tools/tests/test_r7_w1_runtime.py", "docs/rebuild/r7/w1-readiness.json")
FIXED_TREES = ("proofs/r7/w1", "tools/r7_w1_runtime")
OPTIONAL_FILES = ("docs/rebuild/r7/w1-execution-state.json", "docs/rebuild/r7/w1-execution-completion-receipt.json")


def _canonical_bytes(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def admitted_paths() -> list[str]:
    paths: set[str] = set()
    for relative in FIXED_FILES + OPTIONAL_FILES:
        if (ROOT / relative).is_file():
            paths.add(relative)
    for relative in FIXED_TREES:
        base = ROOT / relative
        if base.is_dir():
            for path in base.rglob("*"):
                if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() not in {".pyc", ".exe", ".dll", ".pck"}:
                    paths.add(path.relative_to(ROOT).as_posix())
    for _, run_id, _ in PROOF_PLAN:
        base = ROOT / "docs/rebuild/r7/execution-evidence" / run_id
        if base.is_dir():
            for path in base.rglob("*"):
                if path.is_file() and path.suffix.lower() not in {".exe", ".dll", ".pck"}:
                    paths.add(path.relative_to(ROOT).as_posix())
    paths.discard(MANIFEST_PATH.relative_to(ROOT).as_posix())
    return sorted(paths)


def build_manifest(implementation_commit: str) -> Dict[str, Any]:
    paths = admitted_paths()
    result = subprocess.run(["git", "hash-object", "--stdin-paths"], cwd=ROOT, input="\n".join(paths) + "\n", text=True, capture_output=True)
    if result.returncode:
        raise RuntimeError(result.stderr.strip() or "W1 Git-clean hashing failed")
    blobs = result.stdout.splitlines()
    if len(blobs) != len(paths):
        raise RuntimeError("W1 Git-clean hashing returned a different path count")
    artifacts = []
    for relative, blob in zip(paths, blobs):
        data = _canonical_bytes(ROOT / relative)
        artifacts.append({"path": relative, "bytes": len(data), "sha256": hashlib.sha256(data).hexdigest(), "git_blob": blob})
    state_path = ROOT / "docs/rebuild/r7/w1-execution-state.json"
    state = json.loads(state_path.read_text(encoding="utf-8-sig")) if state_path.is_file() else {}
    reference = load_reference()
    return {
        "manifest_version": 1,
        "package": "R7-W1-OWNER-SPATIAL-PROOFS",
        "scope": "development-only-prd07-proof-runtime",
        "gameplay_permission": "CLOSED",
        "implementation_commit": implementation_commit,
        "proof_execution": "OBSERVED" if state else "NOT-STARTED",
        "allocated_run_ids": state.get("allocated_run_ids", []),
        "allocated_evidence_ids": state.get("allocated_evidence_ids", []),
        "authority": ["TASK-20260906-006", "WORK-20260906-006", "DOC-PRD-07"],
        "dependency_identity": reference["component_revisions"],
        "artifacts": artifacts,
    }


def write_manifest(implementation_commit: str) -> Dict[str, Any]:
    value = build_manifest(implementation_commit)
    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST_PATH.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return value
