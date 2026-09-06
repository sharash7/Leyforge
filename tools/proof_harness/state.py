"""PRD-07 proof/run state machine with guarded identity allocation."""

from __future__ import annotations

import re
from dataclasses import dataclass, field
from enum import Enum
from typing import Any, Dict, List, Optional, Sequence, Tuple


PRD_RUN_ID = re.compile(r"^PRD07-RUN-[0-9]{4}$")
TEST_RUN_ID = re.compile(r"^TEST-RUN-[0-9]{4}$")
PRD_EVID_ID = re.compile(r"^PRD07-EVID-[0-9]{4}$")
PROOF_ID = re.compile(r"^PRD04-PROOF-[0-9]{2}$")


class ProofState(str, Enum):
    SPECIFIED = "SPECIFIED"
    HARNESS_BLOCKED = "HARNESS-BLOCKED"
    READY = "READY"
    RUN_ALLOCATED = "PRD07-RUN-ALLOCATED"
    EXECUTING = "EXECUTING"
    PASS_OBSERVED = "PASS-OBSERVED"
    FAIL_OBSERVED = "FAIL-OBSERVED"
    INCONCLUSIVE = "INCONCLUSIVE"
    INVALIDATED = "INVALIDATED"
    RERUN_REQUIRED = "RERUN-REQUIRED"
    PRD08_EVALUATION = "PRD-08-EVALUATION"


class ExecutionKind(str, Enum):
    SYNTHETIC = "synthetic-controller-test"
    ACTUAL = "actual-governed-execution"


OBSERVED_STATES = frozenset({ProofState.PASS_OBSERVED, ProofState.FAIL_OBSERVED, ProofState.INCONCLUSIVE})


@dataclass
class ProofExecution:
    proof_id: str
    state: ProofState = ProofState.SPECIFIED
    missing_prerequisites: Tuple[str, ...] = field(default_factory=tuple)
    run_id: Optional[str] = None
    execution_kind: Optional[ExecutionKind] = None
    evidence_ids: Tuple[str, ...] = field(default_factory=tuple)
    history: List[Dict[str, Any]] = field(default_factory=list)

    def __post_init__(self) -> None:
        if not PROOF_ID.fullmatch(self.proof_id):
            raise ValueError("proof identity must match PRD04-PROOF-XX")

    def _set_state(self, target: ProofState, reason: str) -> None:
        self.history.append({"from": self.state.value, "to": target.value, "reason": reason})
        self.state = target

    def evaluate_prerequisites(self, missing: Sequence[str]) -> ProofState:
        allowed = {ProofState.SPECIFIED, ProofState.HARNESS_BLOCKED, ProofState.READY, ProofState.RERUN_REQUIRED}
        if self.state not in allowed:
            raise ValueError("prerequisites cannot be changed after run allocation")
        self.missing_prerequisites = tuple(sorted(set(str(item) for item in missing if str(item))))
        target = ProofState.HARNESS_BLOCKED if self.missing_prerequisites else ProofState.READY
        self._set_state(target, "prerequisites evaluated")
        return self.state

    def allocate_run(self, run_id: str, execution_kind: ExecutionKind,
                     actual_execution_authorized: bool = False) -> None:
        if self.state != ProofState.READY or self.missing_prerequisites:
            raise ValueError("run identity may be allocated only when the proof is READY")
        if execution_kind == ExecutionKind.ACTUAL:
            if not actual_execution_authorized:
                raise ValueError("actual PRD-07 run allocation requires execution authorization")
            if not PRD_RUN_ID.fullmatch(run_id):
                raise ValueError("actual run identity must match PRD07-RUN-XXXX")
        else:
            if actual_execution_authorized:
                raise ValueError("synthetic controller tests cannot claim actual execution")
            if not TEST_RUN_ID.fullmatch(run_id):
                raise ValueError("synthetic run identity must match TEST-RUN-XXXX")
        self.run_id = run_id
        self.execution_kind = execution_kind
        self._set_state(ProofState.RUN_ALLOCATED, "run identity allocated")

    def begin(self) -> None:
        if self.state != ProofState.RUN_ALLOCATED:
            raise ValueError("execution may begin only after run allocation")
        self._set_state(ProofState.EXECUTING, "execution started")

    def observe(self, outcome: ProofState) -> None:
        if self.state != ProofState.EXECUTING:
            raise ValueError("an outcome may be observed only while EXECUTING")
        if outcome not in OBSERVED_STATES:
            raise ValueError("outcome must be PASS-OBSERVED, FAIL-OBSERVED or INCONCLUSIVE")
        self._set_state(outcome, "execution outcome retained")

    def invalidate(self, reason: str) -> None:
        allowed = {ProofState.RUN_ALLOCATED, ProofState.EXECUTING} | set(OBSERVED_STATES)
        if self.state not in allowed:
            raise ValueError("there is no current allocated execution to invalidate")
        self._set_state(ProofState.INVALIDATED, reason)

    def require_rerun(self, reason: str) -> None:
        if self.state not in OBSERVED_STATES | {ProofState.INVALIDATED}:
            raise ValueError("rerun may be required only after an observed or invalidated run")
        self._set_state(ProofState.RERUN_REQUIRED, reason)
        self.run_id = None
        self.execution_kind = None
        self.evidence_ids = tuple()

    def send_to_prd08(self, evidence_ids: Sequence[str]) -> None:
        if self.state not in OBSERVED_STATES:
            raise ValueError("PRD-08 may receive only an observed run outcome")
        if self.execution_kind != ExecutionKind.ACTUAL:
            raise ValueError("synthetic controller results cannot enter PRD-08")
        unique = tuple(sorted(set(evidence_ids)))
        if not unique or any(not PRD_EVID_ID.fullmatch(value) for value in unique):
            raise ValueError("PRD-08 handoff requires PRD07-EVID-XXXX identities")
        self.evidence_ids = unique
        self._set_state(ProofState.PRD08_EVALUATION, "actual retained evidence submitted")

    @property
    def prd07_evidence_eligible(self) -> bool:
        return self.execution_kind == ExecutionKind.ACTUAL and self.state in OBSERVED_STATES
