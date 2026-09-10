"""Exact W4 proof-only dependency reference validation."""

from __future__ import annotations

import hashlib
import json
import subprocess
from typing import Any, Dict, Tuple

from tools.r7_w0_runtime.dependencies import load_lock, static_lock_issues, verify_local_dependencies

from .authority import ROOT


REFERENCE_PATH = ROOT / "proofs/r7/w4/dependency-reference.json"


def load_reference() -> Dict[str, Any]:
    value = json.loads(REFERENCE_PATH.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError("W4 dependency reference must be an object")
    return value


def reference_issues() -> Tuple[str, ...]:
    issues = []
    reference = load_reference()
    if reference.get("schema_version") != "leyforge-r7-w4-dependency-reference-v1":
        issues.append("unsupported W4 dependency reference schema")
    if reference.get("scope") != "development-only-prd07-proof-runtime":
        issues.append("W4 dependency scope is not proof-only")
    if reference.get("gameplay_permission") != "CLOSED":
        issues.append("W4 dependency reference opened gameplay permission")
    if reference.get("production_dependency_state") != "UNCHANGED-PLANNED-UNINSTALLED":
        issues.append("W4 dependency reference changed production dependency state")
    lock_path = ROOT / str(reference.get("source_lock", ""))
    if lock_path != ROOT / "proofs/r7/w0/dependencies.lock.json" or not lock_path.is_file():
        issues.append("W4 must reference the governed W0 dependency lock")
        return tuple(sorted(set(issues)))
    if hashlib.sha256(lock_path.read_bytes()).hexdigest() != reference.get("source_lock_sha256"):
        issues.append("W0 dependency lock SHA-256 differs from W4 reference")
    result = subprocess.run(["git", "hash-object", str(lock_path.relative_to(ROOT))], cwd=ROOT, text=True, capture_output=True)
    if result.returncode or result.stdout.strip() != reference.get("source_lock_git_blob"):
        issues.append("W0 dependency lock Git blob differs from W4 reference")
    lock = load_lock()
    issues.extend(static_lock_issues(lock))
    components = lock.get("components", {})
    for name, revision in reference.get("component_revisions", {}).items():
        if components.get(name, {}).get("revision") != revision:
            issues.append("W4 dependency revision differs for " + name)
    expected_hashes = {
        "godot_build_driver_sha256": components.get("godot_build_driver", {}).get("sha256"),
        "godot_export_template_runtime_sha256": components.get("godot_export_template", {}).get("runtime_sha256"),
        "voxel_tools_package_sha256": components.get("voxel_tools", {}).get("package_sha256"),
    }
    if reference.get("component_hashes") != expected_hashes:
        issues.append("W4 dependency component hashes differ from governed lock")
    if reference.get("local_patch_status") != lock.get("local_patch_status"):
        issues.append("W4 local patch status differs from governed lock")
    if reference.get("host_lane") != "windows-x86_64":
        issues.append("W4 admitted host lane differs")
    if set(reference.get("roles", [])) != {"client", "dedicated-server", "forge-ci"}:
        issues.append("W4 future execution roles differ")
    return tuple(sorted(set(issues)))


def local_dependency_report() -> Dict[str, Any]:
    return verify_local_dependencies(load_lock())
