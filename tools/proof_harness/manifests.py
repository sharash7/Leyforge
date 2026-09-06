"""FIXTURE-09 build, dependency and artifact identity controls."""

from __future__ import annotations

import hashlib
import json
import re
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, List, Optional, Sequence


SOURCE_REVISION = re.compile(r"^[0-9a-f]{40}(?:[0-9a-f]{24})?$")
ROLES = frozenset({"client", "headless", "dedicated"})


def _required_bool(value: Any, field_name: str) -> bool:
    if not isinstance(value, bool):
        raise ValueError("%s must be a JSON boolean" % field_name)
    return value


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


@dataclass(frozen=True)
class ComponentIdentity:
    name: str
    source: str
    revision: str
    edition: str
    installation_status: str
    provenance_status: str
    licence_status: str
    local_patch: str = "NO-LOCAL-PATCH"

    def issues(self, for_execution: bool = False) -> List[str]:
        issues: List[str] = []
        for field_name in ("name", "source", "revision", "edition", "local_patch"):
            if not str(getattr(self, field_name)).strip():
                issues.append("component.%s is required" % field_name)
        if for_execution:
            if self.installation_status != "installed":
                issues.append("component.%s is not installed" % self.name)
            if self.provenance_status != "verified":
                issues.append("component.%s provenance is not verified" % self.name)
            if self.licence_status != "resolved":
                issues.append("component.%s licence is not resolved" % self.name)
            if self.revision.lower() in {"unknown", "unresolved", "planned"}:
                issues.append("component.%s revision is not exact" % self.name)
        return issues

    def to_dict(self) -> Dict[str, str]:
        return {
            "name": self.name,
            "source": self.source,
            "revision": self.revision,
            "edition": self.edition,
            "installation_status": self.installation_status,
            "provenance_status": self.provenance_status,
            "licence_status": self.licence_status,
            "local_patch": self.local_patch,
        }

    @classmethod
    def from_dict(cls, value: Dict[str, Any]) -> "ComponentIdentity":
        keys = (
            "name", "source", "revision", "edition", "installation_status",
            "provenance_status", "licence_status", "local_patch",
        )
        return cls(**{key: str(value[key]) for key in keys})


@dataclass(frozen=True)
class BuildManifest:
    source_revision: str
    role: str
    profile: str
    precision: str
    platform: str
    content_identity: str
    schema_identity: str
    clean_export: bool
    invocation: Sequence[str]
    components: Sequence[ComponentIdentity]
    environment: Dict[str, str] = field(default_factory=dict)
    manifest_schema: str = "prd07-build-manifest-v1"

    def issues(self, for_execution: bool = False) -> List[str]:
        issues: List[str] = []
        if self.manifest_schema != "prd07-build-manifest-v1":
            issues.append("unsupported build manifest schema")
        if not SOURCE_REVISION.fullmatch(self.source_revision):
            issues.append("source_revision must be an exact 40- or 64-character lowercase hash")
        if self.role not in ROLES:
            issues.append("unsupported build role")
        for name, value in (
            ("profile", self.profile), ("precision", self.precision),
            ("platform", self.platform), ("content_identity", self.content_identity),
            ("schema_identity", self.schema_identity),
        ):
            if not value.strip():
                issues.append("%s is required" % name)
        if not self.clean_export:
            issues.append("clean_export must be true")
        if not self.invocation or any(not str(part) for part in self.invocation):
            issues.append("exact clean build/export invocation is required")
        names = [component.name for component in self.components]
        if len(names) != len(set(names)):
            issues.append("component identities must be unique")
        for component in self.components:
            issues.extend(component.issues(for_execution=for_execution))
        if for_execution:
            for required in ("godot", "voxel-tools"):
                if required not in names:
                    issues.append("required execution component is missing: %s" % required)
        return issues

    def to_dict(self) -> Dict[str, Any]:
        return {
            "manifest_schema": self.manifest_schema,
            "source_revision": self.source_revision,
            "role": self.role,
            "profile": self.profile,
            "precision": self.precision,
            "platform": self.platform,
            "content_identity": self.content_identity,
            "schema_identity": self.schema_identity,
            "clean_export": self.clean_export,
            "invocation": list(self.invocation),
            "components": [item.to_dict() for item in sorted(self.components, key=lambda value: value.name)],
            "environment": dict(sorted(self.environment.items())),
        }

    @property
    def build_identity(self) -> str:
        return hashlib.sha256(canonical_json(self.to_dict()).encode("utf-8")).hexdigest()

    @classmethod
    def from_dict(cls, value: Dict[str, Any]) -> "BuildManifest":
        return cls(
            source_revision=str(value["source_revision"]),
            role=str(value["role"]), profile=str(value["profile"]),
            precision=str(value["precision"]), platform=str(value["platform"]),
            content_identity=str(value["content_identity"]),
            schema_identity=str(value["schema_identity"]),
            clean_export=_required_bool(value["clean_export"], "clean_export"),
            invocation=tuple(str(item) for item in value["invocation"]),
            components=tuple(ComponentIdentity.from_dict(item) for item in value["components"]),
            environment={str(key): str(item) for key, item in value.get("environment", {}).items()},
            manifest_schema=str(value.get("manifest_schema", "")),
        )


@dataclass(frozen=True)
class ArtifactManifest:
    build_identity: str
    role: str
    artifact_path: str
    artifact_sha256: str
    size_bytes: int
    artifact_kind: str
    exported_runtime: bool
    synthetic_fixture: bool
    runtime_self_report_build_identity: Optional[str]
    symbol_sha256: Optional[str] = None
    manifest_schema: str = "prd07-artifact-manifest-v1"

    @classmethod
    def from_path(
        cls, path: Path, build: BuildManifest, artifact_kind: str,
        exported_runtime: bool, synthetic_fixture: bool,
        runtime_self_report_build_identity: Optional[str],
        symbol_path: Optional[Path] = None,
    ) -> "ArtifactManifest":
        resolved = path.resolve()
        if not resolved.is_file():
            raise ValueError("artifact path does not name a file")
        return cls(
            build_identity=build.build_identity, role=build.role,
            artifact_path=str(resolved), artifact_sha256=sha256_file(resolved),
            size_bytes=resolved.stat().st_size, artifact_kind=artifact_kind,
            exported_runtime=exported_runtime, synthetic_fixture=synthetic_fixture,
            runtime_self_report_build_identity=runtime_self_report_build_identity,
            symbol_sha256=sha256_file(symbol_path.resolve()) if symbol_path is not None else None,
        )

    def integrity_issues(self, build: BuildManifest) -> List[str]:
        issues: List[str] = []
        if self.manifest_schema != "prd07-artifact-manifest-v1":
            issues.append("unsupported artifact manifest schema")
        if self.build_identity != build.build_identity:
            issues.append("artifact build_identity does not match build manifest")
        if self.role != build.role:
            issues.append("artifact role does not match build role")
        path = Path(self.artifact_path)
        if not path.is_file():
            issues.append("artifact file is missing")
            return issues
        if path.stat().st_size != self.size_bytes:
            issues.append("artifact size has changed")
        if sha256_file(path) != self.artifact_sha256:
            issues.append("artifact hash has changed")
        return issues

    def evidence_eligibility_issues(self, build: BuildManifest) -> List[str]:
        issues = build.issues(for_execution=True) + self.integrity_issues(build)
        if self.artifact_kind != "leyforge-export":
            issues.append("artifact_kind must be leyforge-export")
        if not self.exported_runtime:
            issues.append("artifact is not a real exported runtime")
        if self.synthetic_fixture:
            issues.append("synthetic fixtures are never PRD-07 evidence eligible")
        if self.runtime_self_report_build_identity != self.build_identity:
            issues.append("runtime self-report does not match build identity")
        return issues

    def to_dict(self) -> Dict[str, Any]:
        return {
            "manifest_schema": self.manifest_schema,
            "build_identity": self.build_identity, "role": self.role,
            "artifact_path": self.artifact_path, "artifact_sha256": self.artifact_sha256,
            "size_bytes": self.size_bytes, "artifact_kind": self.artifact_kind,
            "exported_runtime": self.exported_runtime, "synthetic_fixture": self.synthetic_fixture,
            "runtime_self_report_build_identity": self.runtime_self_report_build_identity,
            "symbol_sha256": self.symbol_sha256,
        }

    @classmethod
    def from_dict(cls, value: Dict[str, Any]) -> "ArtifactManifest":
        return cls(
            build_identity=str(value["build_identity"]), role=str(value["role"]),
            artifact_path=str(value["artifact_path"]), artifact_sha256=str(value["artifact_sha256"]),
            size_bytes=int(value["size_bytes"]), artifact_kind=str(value["artifact_kind"]),
            exported_runtime=_required_bool(value["exported_runtime"], "exported_runtime"),
            synthetic_fixture=_required_bool(value["synthetic_fixture"], "synthetic_fixture"),
            runtime_self_report_build_identity=value.get("runtime_self_report_build_identity"),
            symbol_sha256=value.get("symbol_sha256"),
            manifest_schema=str(value.get("manifest_schema", "")),
        )
