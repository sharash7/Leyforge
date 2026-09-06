"""Shell-free external process and exported smoke-lane control."""

from __future__ import annotations

import os
import subprocess
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Mapping, Optional, Sequence, Tuple

from .manifests import ArtifactManifest, BuildManifest
from .state import ExecutionKind, ProofExecution, ProofState


@dataclass(frozen=True)
class ProcessResult:
    argv: Tuple[str, ...]
    exit_code: int
    stdout: str
    stderr: str
    timed_out: bool
    duration_seconds: float
    terminated_externally: bool

    def to_dict(self) -> Dict[str, Any]:
        return {
            "argv": list(self.argv), "exit_code": self.exit_code,
            "stdout": self.stdout, "stderr": self.stderr,
            "timed_out": self.timed_out, "duration_seconds": self.duration_seconds,
            "terminated_externally": self.terminated_externally,
        }


class ManagedProcess:
    def __init__(self, process: subprocess.Popen, argv: Sequence[str], started_at: float) -> None:
        self._process = process
        self._argv = tuple(argv)
        self._started_at = started_at
        self._terminated_externally = False

    @property
    def pid(self) -> int:
        return self._process.pid

    @property
    def running(self) -> bool:
        return self._process.poll() is None

    def terminate(self, force: bool = False) -> None:
        if not self.running:
            return
        self._terminated_externally = True
        self._process.kill() if force else self._process.terminate()

    def collect(self, timeout_seconds: float) -> ProcessResult:
        timed_out = False
        try:
            stdout, stderr = self._process.communicate(timeout=timeout_seconds)
        except subprocess.TimeoutExpired:
            timed_out = True
            self._terminated_externally = True
            self._process.kill()
            stdout, stderr = self._process.communicate()
        return ProcessResult(
            argv=self._argv, exit_code=int(self._process.returncode), stdout=stdout, stderr=stderr,
            timed_out=timed_out, duration_seconds=max(0.0, time.perf_counter() - self._started_at),
            terminated_externally=self._terminated_externally,
        )


class ProcessController:
    def start(self, argv: Sequence[str], cwd: Optional[Path] = None,
              environment: Optional[Mapping[str, str]] = None) -> ManagedProcess:
        if not argv or any(not isinstance(item, str) or not item for item in argv):
            raise ValueError("argv must be a nonempty sequence of strings")
        env = os.environ.copy()
        if environment:
            env.update({str(key): str(value) for key, value in environment.items()})
        started_at = time.perf_counter()
        process = subprocess.Popen(
            list(argv), cwd=str(cwd) if cwd is not None else None, env=env,
            stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, shell=False,
        )
        return ManagedProcess(process=process, argv=argv, started_at=started_at)

    def run(self, argv: Sequence[str], timeout_seconds: float, cwd: Optional[Path] = None,
            environment: Optional[Mapping[str, str]] = None) -> ProcessResult:
        if timeout_seconds <= 0:
            raise ValueError("timeout_seconds must be positive")
        return self.start(argv, cwd=cwd, environment=environment).collect(timeout_seconds)

    def restart(self, prior: ManagedProcess, argv: Sequence[str], timeout_seconds: float,
                cwd: Optional[Path] = None,
                environment: Optional[Mapping[str, str]] = None) -> ProcessResult:
        if prior.running:
            prior.terminate(force=True)
            prior.collect(timeout_seconds)
        return self.run(argv, timeout_seconds, cwd=cwd, environment=environment)


@dataclass(frozen=True)
class SmokeLane:
    lane_id: str
    proof_id: str
    role: str
    build: BuildManifest
    artifact: ArtifactManifest
    argv: Sequence[str]

    def contract_issues(self) -> Tuple[str, ...]:
        issues = self.artifact.integrity_issues(self.build)
        if self.role != self.build.role or self.role != self.artifact.role:
            issues.append("smoke lane role does not match manifest role")
        if not self.argv:
            issues.append("smoke lane argv is empty")
        elif not self.artifact.synthetic_fixture:
            try:
                if Path(self.argv[0]).resolve() != Path(self.artifact.artifact_path).resolve():
                    issues.append("real exported lane must execute its recorded artifact directly")
            except OSError:
                issues.append("smoke lane executable path cannot be resolved")
        return tuple(issues)

    def execute(
        self,
        controller: ProcessController,
        timeout_seconds: float,
        controller_test: bool = False,
        proof_execution: Optional[ProofExecution] = None,
    ) -> "SmokeResult":
        issues = list(self.contract_issues())
        if self.artifact.synthetic_fixture:
            if not controller_test:
                issues.append("synthetic smoke lanes may run only as controller tests")
        else:
            if controller_test:
                issues.append("real exported lanes cannot be labelled controller tests")
            issues.extend(self.artifact.evidence_eligibility_issues(self.build))
            if proof_execution is None:
                issues.append("real exported lane requires an allocated execution context")
            else:
                if proof_execution.proof_id != self.proof_id:
                    issues.append("smoke lane proof does not match execution context")
                if proof_execution.execution_kind != ExecutionKind.ACTUAL:
                    issues.append("real exported lane requires actual governed execution")
                if proof_execution.state != ProofState.EXECUTING:
                    issues.append("real exported lane requires an EXECUTING proof state")
        if issues:
            raise ValueError("smoke lane is not executable: %s" % "; ".join(sorted(set(issues))))
        result = controller.run(self.argv, timeout_seconds=timeout_seconds)
        eligibility_issues = self.artifact.evidence_eligibility_issues(self.build)
        state_eligible = (
            proof_execution is not None
            and proof_execution.proof_id == self.proof_id
            and proof_execution.execution_kind == ExecutionKind.ACTUAL
            and proof_execution.state == ProofState.EXECUTING
        )
        return SmokeResult(
            lane_id=self.lane_id,
            proof_id=self.proof_id,
            run_id=proof_execution.run_id if proof_execution is not None else None,
            role=self.role,
            process=result,
            evidence_eligible=(
                state_eligible
                and not eligibility_issues
                and result.exit_code == 0
                and not result.timed_out
            ),
            eligibility_issues=tuple(sorted(set(eligibility_issues))),
        )


@dataclass(frozen=True)
class SmokeResult:
    lane_id: str
    proof_id: str
    run_id: Optional[str]
    role: str
    process: ProcessResult
    evidence_eligible: bool
    eligibility_issues: Tuple[str, ...]

    def to_dict(self) -> Dict[str, Any]:
        return {
            "lane_id": self.lane_id,
            "proof_id": self.proof_id,
            "run_id": self.run_id,
            "role": self.role,
            "process": self.process.to_dict(),
            "evidence_eligible": self.evidence_eligible,
            "eligibility_issues": list(self.eligibility_issues),
        }
