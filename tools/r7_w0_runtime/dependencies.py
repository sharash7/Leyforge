"""Immutable dependency lock validation for the R7 W0 proof-only runtime."""

from __future__ import annotations

import hashlib
import json
import os
import re
from pathlib import Path
from typing import Any, Dict, Iterable, Tuple

from tools.proof_harness.manifests import ComponentIdentity

ROOT = Path(__file__).resolve().parents[2]
LOCK_PATH = ROOT / "proofs/r7/w0/dependencies.lock.json"
_SHA256 = re.compile(r"^[0-9a-f]{64}$")
_REVISION = re.compile(r"^[0-9a-f]{40}$")


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def load_lock(path: Path = LOCK_PATH) -> Dict[str, Any]:
    return json.loads(path.read_text(encoding="utf-8-sig"))


def _file_identity_issues(item: Dict[str, Any], prefix: str, path_key: str, bytes_key: str, hash_key: str) -> list[str]:
    issues: list[str] = []
    if not isinstance(item.get(path_key), str) or not item[path_key]:
        issues.append(f"{prefix}.{path_key} is required")
    if not isinstance(item.get(bytes_key), int) or item[bytes_key] <= 0:
        issues.append(f"{prefix}.{bytes_key} must be positive")
    if not isinstance(item.get(hash_key), str) or _SHA256.fullmatch(item[hash_key]) is None:
        issues.append(f"{prefix}.{hash_key} must be a lowercase SHA-256")
    return issues


def static_lock_issues(data: Dict[str, Any]) -> Tuple[str, ...]:
    issues: list[str] = []
    if data.get("schema_version") != "leyforge-r7-w0-dependency-lock-v1":
        issues.append("unsupported dependency lock schema")
    if data.get("scope") != "development-only-prd07-proof-runtime":
        issues.append("dependency lock scope changed")
    if data.get("gameplay_permission") != "CLOSED":
        issues.append("dependency lock cannot open gameplay permission")
    if data.get("local_patch_status") != "NO-LOCAL-PATCH":
        issues.append("dependency lock must record the explicit no-patch baseline")
    components = data.get("components")
    if not isinstance(components, dict):
        return tuple(issues + ["components must be an object"])
    if set(components) != {"godot_build_driver", "godot_export_template", "voxel_tools"}:
        issues.append("dependency lock must contain exactly the three governed components")
        return tuple(sorted(set(issues)))
    driver = components["godot_build_driver"]
    template = components["godot_export_template"]
    voxel = components["voxel_tools"]
    for name, item in components.items():
        if item.get("licence") != "MIT" or item.get("licence_status") != "resolved":
            issues.append(f"{name} licence is unresolved")
        if item.get("provenance_status") != "verified":
            issues.append(f"{name} provenance is not verified")
        if not str(item.get("local_patch", "")).startswith("NO-LOCAL-PATCH"):
            issues.append(f"{name} local patch state is not explicit")
        if not str(item.get("source", "")).startswith("https://"):
            issues.append(f"{name} source must be an HTTPS upstream identity")
    if _REVISION.fullmatch(str(driver.get("revision", ""))) is None:
        issues.append("Godot build-driver revision must be an exact commit")
    if _REVISION.fullmatch(str(voxel.get("revision", ""))) is None:
        issues.append("Voxel Tools revision must be an exact commit")
    issues.extend(_file_identity_issues(driver, "godot_build_driver", "default_local_path", "bytes", "sha256"))
    issues.extend(_file_identity_issues(template, "godot_export_template", "package_path", "package_bytes", "package_sha256"))
    issues.extend(_file_identity_issues(template, "godot_export_template", "runtime_path", "runtime_bytes", "runtime_sha256"))
    issues.extend(_file_identity_issues(voxel, "voxel_tools", "package_path", "package_bytes", "package_sha256"))
    staged = voxel.get("staged_files")
    if not isinstance(staged, list) or not staged:
        issues.append("Voxel Tools staged_files must be nonempty")
    else:
        destinations: set[str] = set()
        for index, item in enumerate(staged):
            prefix = f"voxel_tools.staged_files[{index}]"
            issues.extend(_file_identity_issues(item, prefix, "source", "bytes", "sha256"))
            destination = item.get("destination")
            if not isinstance(destination, str) or not destination.startswith("addons/zylann.voxel/"):
                issues.append(f"{prefix}.destination leaves the proof provider boundary")
            elif destination in destinations:
                issues.append(f"{prefix}.destination is duplicated")
            else:
                destinations.add(destination)
    return tuple(sorted(set(issues)))


def _resolved_root_path(value: str) -> Path:
    path = Path(value)
    return path if path.is_absolute() else ROOT / path


def _verify(path: Path, expected_bytes: int, expected_hash: str, label: str, issues: list[str]) -> None:
    if not path.is_file():
        issues.append(f"{label} is missing: {path}")
        return
    if path.stat().st_size != expected_bytes:
        issues.append(f"{label} byte size differs")
    if sha256_file(path) != expected_hash:
        issues.append(f"{label} SHA-256 differs")


def verify_local_dependencies(data: Dict[str, Any] | None = None) -> Dict[str, Any]:
    data = data or load_lock()
    issues = list(static_lock_issues(data))
    components = data.get("components", {})
    if issues and not components:
        return {"status": "FAIL", "issues": sorted(set(issues)), "paths": {}}
    driver = components["godot_build_driver"]
    template = components["godot_export_template"]
    voxel = components["voxel_tools"]
    driver_path = Path(os.environ.get("LEYFORGE_GODOT_DRIVER", driver["default_local_path"]))
    template_package = _resolved_root_path(template["package_path"])
    template_runtime = _resolved_root_path(template["runtime_path"])
    voxel_package = _resolved_root_path(voxel["package_path"])
    voxel_root = _resolved_root_path(voxel["extracted_root"])
    _verify(driver_path, driver["bytes"], driver["sha256"], "Godot build driver", issues)
    _verify(template_package, template["package_bytes"], template["package_sha256"], "Godot export-template package", issues)
    _verify(template_runtime, template["runtime_bytes"], template["runtime_sha256"], "Godot export template", issues)
    _verify(voxel_package, voxel["package_bytes"], voxel["package_sha256"], "Voxel Tools release package", issues)
    for item in voxel.get("staged_files", []):
        _verify(voxel_root / item["source"], item["bytes"], item["sha256"], f"Voxel Tools staged file {item['source']}", issues)
    return {
        "schema_version": "leyforge-r7-w0-local-dependency-verification-v1",
        "status": "PASS" if not issues else "FAIL",
        "issues": sorted(set(issues)),
        "paths": {
            "godot_driver": str(driver_path.resolve()),
            "godot_template_package": str(template_package.resolve()),
            "godot_template_runtime": str(template_runtime.resolve()),
            "voxel_package": str(voxel_package.resolve()),
            "voxel_root": str(voxel_root.resolve()),
        },
        "local_patch_status": data.get("local_patch_status"),
    }


def execution_components(data: Dict[str, Any]) -> Tuple[ComponentIdentity, ...]:
    components = data["components"]
    driver = components["godot_build_driver"]
    template = components["godot_export_template"]
    voxel = components["voxel_tools"]
    return (
        ComponentIdentity(
            name="godot", source=template["source"], revision=template["revision"],
            edition="official-windows-release-template-x86_64", installation_status="installed",
            provenance_status="verified", licence_status="resolved", local_patch=template["local_patch"],
        ),
        ComponentIdentity(
            name="godot-build-driver", source=driver["source"], revision=driver["revision"],
            edition=driver["version"], installation_status="installed",
            provenance_status="verified", licence_status="resolved", local_patch=driver["local_patch"],
        ),
        ComponentIdentity(
            name="voxel-tools", source=voxel["source"], revision=voxel["revision"],
            edition=voxel["edition"], installation_status="installed",
            provenance_status="verified", licence_status="resolved", local_patch=voxel["local_patch"],
        ),
    )


def iter_staged_voxel_files(data: Dict[str, Any]) -> Iterable[tuple[Path, Path]]:
    voxel = data["components"]["voxel_tools"]
    source_root = _resolved_root_path(voxel["extracted_root"])
    for item in voxel["staged_files"]:
        yield source_root / item["source"], Path(item["destination"])
