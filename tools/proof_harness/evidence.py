"""Append-only evidence-pack validation and retention."""

from __future__ import annotations

import json
import re
import shutil
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Mapping, Sequence, Tuple

from .manifests import ArtifactManifest, BuildManifest, sha256_file
from .state import ExecutionKind, OBSERVED_STATES, PRD_EVID_ID, PRD_RUN_ID, ProofState, TEST_RUN_ID


TEST_EVID_ID = re.compile(r"^TEST-EVID-[0-9]{4}$")
PROOF_ID = re.compile(r"^PRD04-PROOF-[0-9]{2}$")


@dataclass(frozen=True)
class EvidenceFile:
    evidence_id: str
    kind: str
    path: str
    sha256: str

    @classmethod
    def from_path(cls, evidence_id: str, kind: str, path: Path) -> "EvidenceFile":
        resolved = path.resolve()
        if not resolved.is_file():
            raise ValueError("evidence path does not name a file")
        return cls(evidence_id=evidence_id, kind=kind, path=str(resolved), sha256=sha256_file(resolved))

    def issues(self, execution_kind: ExecutionKind) -> Tuple[str, ...]:
        issues = []
        pattern = PRD_EVID_ID if execution_kind == ExecutionKind.ACTUAL else TEST_EVID_ID
        if not pattern.fullmatch(self.evidence_id):
            issues.append("evidence identity does not match execution kind")
        if not self.kind:
            issues.append("evidence kind is required")
        path = Path(self.path)
        if not path.is_file():
            issues.append("evidence file is missing")
        elif sha256_file(path) != self.sha256:
            issues.append("evidence file hash has changed")
        return tuple(issues)


@dataclass(frozen=True)
class EvidencePack:
    run_id: str
    proof_id: str
    outcome: ProofState
    execution_kind: ExecutionKind
    build: BuildManifest
    artifact: ArtifactManifest
    scenario: Mapping[str, Any]
    environment: Mapping[str, Any]
    evidence_files: Sequence[EvidenceFile]
    diagnostics: Sequence[Mapping[str, Any]] = field(default_factory=tuple)
    observations: Sequence[Mapping[str, Any]] = field(default_factory=tuple)
    schema_version: str = "prd07-evidence-pack-v1"

    def validation_issues(self) -> Tuple[str, ...]:
        issues = []
        if self.schema_version != "prd07-evidence-pack-v1":
            issues.append("unsupported evidence pack schema")
        if not PROOF_ID.fullmatch(self.proof_id):
            issues.append("proof identity must match PRD04-PROOF-XX")
        if self.outcome not in OBSERVED_STATES | {ProofState.INVALIDATED}:
            issues.append("evidence pack outcome is not retainable")
        run_pattern = PRD_RUN_ID if self.execution_kind == ExecutionKind.ACTUAL else TEST_RUN_ID
        if not run_pattern.fullmatch(self.run_id):
            issues.append("run identity does not match execution kind")
        if not self.scenario:
            issues.append("scenario/configuration identity is required")
        if not self.environment:
            issues.append("execution environment is required")
        if not self.evidence_files:
            issues.append("at least one evidence file is required")
        evidence_ids = [item.evidence_id for item in self.evidence_files]
        if len(evidence_ids) != len(set(evidence_ids)):
            issues.append("evidence identities must be unique within a pack")
        for item in self.evidence_files:
            issues.extend(item.issues(self.execution_kind))
        issues.extend(self.artifact.integrity_issues(self.build))
        if self.execution_kind == ExecutionKind.ACTUAL:
            issues.extend(self.artifact.evidence_eligibility_issues(self.build))
        return tuple(sorted(set(issues)))

    @property
    def prd07_evidence_eligible(self) -> bool:
        return (
            self.execution_kind == ExecutionKind.ACTUAL
            and self.outcome in OBSERVED_STATES
            and not self.validation_issues()
        )

    def retain(self, root: Path) -> Path:
        issues = self.validation_issues()
        if issues:
            raise ValueError("evidence pack is invalid: %s" % "; ".join(issues))
        destination = root.resolve() / self.run_id
        destination.mkdir(parents=True, exist_ok=False)
        manifests = destination / "manifests"
        raw = destination / "raw"
        manifests.mkdir()
        raw.mkdir()
        (manifests / "build.json").write_text(
            json.dumps(self.build.to_dict(), indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        (manifests / "artifact.json").write_text(
            json.dumps(self.artifact.to_dict(), indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        copied = []
        used_names = set()
        for item in self.evidence_files:
            source = Path(item.path)
            name = source.name
            if name in used_names:
                name = "%s-%s" % (item.evidence_id, name)
            used_names.add(name)
            target = raw / name
            shutil.copy2(str(source), str(target))
            copied.append({
                "evidence_id": item.evidence_id, "kind": item.kind,
                "path": "raw/%s" % name, "sha256": item.sha256,
            })
        run_record = {
            "schema_version": self.schema_version, "run_id": self.run_id,
            "proof_id": self.proof_id, "outcome": self.outcome.value,
            "execution_kind": self.execution_kind.value,
            "build_identity": self.build.build_identity,
            "scenario": dict(self.scenario), "environment": dict(self.environment),
            "evidence_files": copied,
            "prd07_evidence_eligible": self.prd07_evidence_eligible,
        }
        for name, value in (
            ("run.json", run_record),
            ("diagnostics.json", list(self.diagnostics)),
            ("observations.json", list(self.observations)),
        ):
            (destination / name).write_text(
                json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8"
            )
        return destination
