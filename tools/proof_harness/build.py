"""Non-destructive clean build/export orchestration for FIXTURE-09."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Sequence, Tuple

from .manifests import BuildManifest
from .process import ProcessController, ProcessResult


@dataclass(frozen=True)
class CleanExportPlan:
    build: BuildManifest
    output_root: Path
    argv: Sequence[str]

    def issues(self, controller_test: bool = False) -> Tuple[str, ...]:
        issues = self.build.issues(for_execution=not controller_test)
        if tuple(self.argv) != tuple(self.build.invocation):
            issues.append("export command does not match the build manifest invocation")
        resolved = self.output_root.resolve()
        if resolved.exists() and (not resolved.is_dir() or any(resolved.iterdir())):
            issues.append("clean export output root must be absent or empty")
        return tuple(sorted(set(issues)))


@dataclass(frozen=True)
class BuildResult:
    build_identity: str
    output_root: str
    process: ProcessResult
    artifact_candidates: Tuple[str, ...]
    controller_test: bool

    def to_dict(self) -> Dict[str, Any]:
        return {
            "build_identity": self.build_identity,
            "output_root": self.output_root,
            "process": self.process.to_dict(),
            "artifact_candidates": list(self.artifact_candidates),
            "controller_test": self.controller_test,
        }


class BuildController:
    """Runs only into a caller-supplied clean directory and never deletes output."""

    def __init__(self, processes: ProcessController = None) -> None:
        self.processes = processes or ProcessController()

    def execute(self, plan: CleanExportPlan, timeout_seconds: float,
                controller_test: bool = False) -> BuildResult:
        issues = plan.issues(controller_test=controller_test)
        if issues:
            raise ValueError("clean export plan is invalid: %s" % "; ".join(issues))
        output_root = plan.output_root.resolve()
        output_root.mkdir(parents=True, exist_ok=True)
        process = self.processes.run(plan.argv, timeout_seconds=timeout_seconds, cwd=output_root)
        candidates = tuple(
            path.relative_to(output_root).as_posix()
            for path in sorted(output_root.rglob("*"))
            if path.is_file()
        )
        return BuildResult(
            build_identity=plan.build.build_identity,
            output_root=str(output_root),
            process=process,
            artifact_candidates=candidates,
            controller_test=controller_test,
        )
