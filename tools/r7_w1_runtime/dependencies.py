"""W1 dependency reference validation without duplicating W0 authority."""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Dict, Tuple

from tools.r7_w0_runtime.dependencies import (
    ROOT,
    execution_components,
    iter_staged_voxel_files,
    load_lock,
    static_lock_issues,
    verify_local_dependencies,
)

REFERENCE_PATH = ROOT / "proofs/r7/w1/dependency-reference.json"


def load_reference() -> Dict[str, Any]:
    value = json.loads(REFERENCE_PATH.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError("W1 dependency reference must be an object")
    return value


def reference_issues() -> Tuple[str, ...]:
    reference = load_reference()
    issues = []
    if reference.get("schema_version") != "leyforge-r7-w1-dependency-reference-v1":
        issues.append("unsupported W1 dependency-reference schema")
    if reference.get("gameplay_permission") != "CLOSED":
        issues.append("W1 dependency reference cannot open gameplay")
    if reference.get("production_dependency_state") != "UNCHANGED-PLANNED-UNINSTALLED":
        issues.append("W1 proof dependency reference changed production dependency state")
    lock_path = ROOT / str(reference.get("source_lock", ""))
    if lock_path != ROOT / "proofs/r7/w0/dependencies.lock.json" or not lock_path.is_file():
        issues.append("W1 must reference the governed W0 dependency lock")
        return tuple(issues)
    raw = lock_path.read_bytes()
    if hashlib.sha256(raw).hexdigest() != reference.get("source_lock_sha256"):
        issues.append("W0 dependency lock SHA-256 differs from W1 reference")
    result = subprocess.run(["git", "hash-object", str(lock_path.relative_to(ROOT))], cwd=ROOT, text=True, capture_output=True)
    if result.returncode or result.stdout.strip() != reference.get("source_lock_git_blob"):
        issues.append("W0 dependency lock Git blob differs from W1 reference")
    lock = load_lock()
    issues.extend(static_lock_issues(lock))
    revisions = reference.get("component_revisions", {})
    for name, revision in revisions.items():
        if str(lock.get("components", {}).get(name, {}).get("revision")) != str(revision):
            issues.append(f"W1 dependency revision differs for {name}")
    if reference.get("local_patch_status") != lock.get("local_patch_status"):
        issues.append("W1 local patch status differs from the governed lock")
    return tuple(sorted(set(issues)))
