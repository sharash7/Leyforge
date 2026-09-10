"""Atomic, append-only W4 RUN/EVID allocation journal."""

from __future__ import annotations

import json
import os
import tempfile
from pathlib import Path
from typing import Any, Dict, Mapping, Optional

from tools.r7_w3_runtime.execution_plan import inspect_execution_registry

from .contracts import EXECUTION_PACKAGE, EXECUTION_ROSTER, ROOT, STATE_PATH


ACTIVE_STATES = {"PRD07-RUN-ALLOCATED", "EXECUTING", "OBSERVATION-CAPTURED"}
TERMINAL_STATES = {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE", "INVALIDATED", "ABORTED-BEFORE-PROOF-OBSERVATION"}


def _atomic_write(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    descriptor, name = tempfile.mkstemp(prefix=path.name + ".", suffix=".tmp", dir=str(path.parent))
    temporary = Path(name)
    try:
        with os.fdopen(descriptor, "w", encoding="utf-8", newline="\n") as stream:
            json.dump(value, stream, indent=2, sort_keys=True, ensure_ascii=True)
            stream.write("\n")
            stream.flush()
            os.fsync(stream.fileno())
        os.replace(str(temporary), str(path))
    finally:
        if temporary.exists():
            temporary.unlink()


class W4ExecutionJournal:
    SCHEMA = "prd07-w4-execution-state-v1"

    def __init__(self, source_revision: str, path: Path = STATE_PATH) -> None:
        self.path = path
        self.source_revision = source_revision
        if path.is_file():
            value = json.loads(path.read_text(encoding="utf-8-sig"))
            if not isinstance(value, dict) or value.get("schema_version") != self.SCHEMA:
                raise ValueError("existing W4 execution journal is missing or unsupported")
            if value.get("source_revision") != source_revision:
                raise ValueError("existing W4 execution journal names a different source revision")
            self.value: Dict[str, Any] = value
        else:
            self.value = {
                "schema_version": self.SCHEMA,
                "package": EXECUTION_PACKAGE,
                "package_state": "AUTHORIZED-PRE-ALLOCATION",
                "source_revision": source_revision,
                "prior_readiness_source": "docs/rebuild/r7/w4-readiness.json",
                "execution_admission_source": "docs/rebuild/r7/w4-governed-execution-admission.json",
                "allocated_run_ids": [],
                "allocated_evidence_ids": [],
                "allocation_history": [],
                "proofs": [
                    {"proof_id": proof_id, "readiness": "READY", "state": "NOT-RUN", "attempt_run_ids": [], "blockers": []}
                    for proof_id in EXECUTION_ROSTER
                ],
                "gameplay_permission": "CLOSED",
                "production_runtime": "ABSENT",
                "production_dependency_activation": "INACTIVE",
                "prd08_submission": "NOT-SUBMITTED",
                "w5": "CLOSED",
                "r7_final": "CLOSED",
                "prd09": "CLOSED",
                "r8": "CLOSED",
            }
        self._validate()

    @property
    def history(self) -> list:
        return self.value["allocation_history"]

    def _proof(self, proof_id: str) -> Dict[str, Any]:
        return next(row for row in self.value["proofs"] if row["proof_id"] == proof_id)

    def _attempt(self, run_id: str) -> Dict[str, Any]:
        return next(row for row in self.history if row["run_id"] == run_id)

    def _validate(self) -> None:
        history = self.value.get("allocation_history")
        runs = self.value.get("allocated_run_ids")
        evidence = self.value.get("allocated_evidence_ids")
        proofs = self.value.get("proofs")
        if not all(isinstance(value, list) for value in (history, runs, evidence, proofs)):
            raise ValueError("W4 execution journal collections are invalid")
        if [row.get("run_id") for row in history] != runs or [row.get("evidence_id") for row in history] != evidence:
            raise ValueError("W4 allocation history differs from issued identity arrays")
        if len(set(runs)) != len(runs) or len(set(evidence)) != len(evidence):
            raise ValueError("W4 journal contains duplicate issued identities")
        if [row.get("proof_id") for row in proofs] != list(EXECUTION_ROSTER):
            raise ValueError("W4 journal proof roster differs")
        if [row.get("proof_id") for row in history] != list(EXECUTION_ROSTER[: len(history)]):
            raise ValueError("W4 journal allocation order differs from certified order")
        expected_runs = ["PRD07-RUN-{0:04d}".format(66 + index) for index in range(len(history))]
        expected_evidence = ["PRD07-EVID-{0:04d}".format(66 + index) for index in range(len(history))]
        if runs != expected_runs or evidence != expected_evidence:
            raise ValueError("W4 issued identities are not the exact contiguous 0066 sequence")
        if sum(row.get("state") in ACTIVE_STATES for row in history) > 1:
            raise ValueError("W4 journal contains multiple active allocations")

    def _persist(self) -> None:
        self._validate()
        _atomic_write(self.path, self.value)

    def allocate(self, proof_id: str) -> Dict[str, str]:
        if any(row.get("state") in ACTIVE_STATES for row in self.history):
            raise ValueError("W4 journal has an unresolved active allocation")
        order = len(self.history)
        if order >= len(EXECUTION_ROSTER) or EXECUTION_ROSTER[order] != proof_id:
            raise ValueError("W4 proof allocation is out of certified order")
        registry = inspect_execution_registry(ROOT)
        expected_sequence = 66 + order
        if registry.max_run_number != expected_sequence - 1 or registry.max_evidence_number != expected_sequence - 1:
            raise ValueError("global RUN/EVID high-water differs before just-in-time allocation")
        run_id = "PRD07-RUN-{0:04d}".format(expected_sequence)
        evidence_id = "PRD07-EVID-{0:04d}".format(expected_sequence)
        if run_id in registry.run_ids or evidence_id in registry.evidence_ids:
            raise ValueError("W4 just-in-time identity collides with the authoritative registry")
        attempt = {
            "allocation_order": order + 1,
            "proof_id": proof_id,
            "run_id": run_id,
            "evidence_id": evidence_id,
            "state": "PRD07-RUN-ALLOCATED",
            "state_history": ["READY", "PRD07-RUN-ALLOCATED"],
            "allocated_before_execution": True,
            "proof_observation_produced": False,
            "evidence_pack_status": "NOT-CREATED-NO-PROOF-OBSERVATION",
            "prd07_evidence_eligible": False,
            "prd08_submission": "NOT-SUBMITTED",
            "source_revision": self.source_revision,
        }
        self.history.append(attempt)
        self.value["allocated_run_ids"].append(run_id)
        self.value["allocated_evidence_ids"].append(evidence_id)
        proof = self._proof(proof_id)
        proof["state"] = "PRD07-RUN-ALLOCATED"
        proof["current_run_id"] = run_id
        proof["attempt_run_ids"].append(run_id)
        self.value["package_state"] = "EXECUTING"
        self._persist()
        return {"proof_id": proof_id, "run_id": run_id, "evidence_id": evidence_id}

    def begin(self, run_id: str) -> None:
        attempt = self._attempt(run_id)
        if attempt["state"] != "PRD07-RUN-ALLOCATED":
            raise ValueError("W4 attempt cannot begin from its current state")
        attempt["state"] = "EXECUTING"
        attempt["state_history"].append("EXECUTING")
        self._proof(attempt["proof_id"])["state"] = "EXECUTING"
        self._persist()

    def observation_captured(self, run_id: str, outcome: str) -> None:
        if outcome not in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}:
            raise ValueError("unsupported W4 observation outcome")
        attempt = self._attempt(run_id)
        if attempt["state"] != "EXECUTING":
            raise ValueError("W4 observation cannot be captured from its current state")
        attempt["state"] = "OBSERVATION-CAPTURED"
        attempt["observed_disposition"] = outcome
        attempt["proof_observation_produced"] = True
        attempt["state_history"].append("OBSERVATION-CAPTURED")
        self._proof(attempt["proof_id"])["state"] = "OBSERVATION-CAPTURED"
        self._persist()

    def complete(self, run_id: str, outcome: str, record: Mapping[str, Any]) -> None:
        attempt = self._attempt(run_id)
        if attempt["state"] != "OBSERVATION-CAPTURED" or attempt.get("observed_disposition") != outcome:
            raise ValueError("W4 attempt cannot complete without its captured observation")
        attempt.update(dict(record))
        attempt.update({"state": outcome, "evidence_pack_status": "RETAINED", "prd07_evidence_eligible": True, "identity_retained": True})
        attempt["state_history"].append(outcome)
        proof = self._proof(attempt["proof_id"])
        attempt_ids = proof["attempt_run_ids"]
        proof.update(dict(record))
        proof.update({"state": outcome, "run_id": run_id, "evidence_id": attempt["evidence_id"], "attempt_run_ids": attempt_ids})
        terminal = all(row["state"] in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"} for row in self.value["proofs"])
        if terminal:
            nonpass = any(row["state"] != "PASS-OBSERVED" for row in self.value["proofs"])
            self.value["package_state"] = "W4-EXECUTION-COMPLETE-NONPASS-RETAINED" if nonpass else "W4-EXECUTION-COMPLETE"
        self._persist()

    def fail_transaction(self, run_id: str, phase: str, exc: BaseException, *, observation_produced: bool) -> None:
        attempt = self._attempt(run_id)
        terminal = "INVALIDATED" if observation_produced else "ABORTED-BEFORE-PROOF-OBSERVATION"
        attempt.update({
            "state": terminal,
            "terminal_disposition": terminal,
            "proof_observation_produced": observation_produced,
            "evidence_pack_status": "NOT-CREATED-OBSERVATION-NOT-RETAINED" if observation_produced else "NOT-CREATED-NO-PROOF-OBSERVATION",
            "prd07_evidence_eligible": False,
            "identity_retained": True,
            "failure": {"phase": phase, "error_type": type(exc).__name__, "error": str(exc)},
        })
        attempt["state_history"].append(terminal)
        proof = self._proof(attempt["proof_id"])
        proof["state"] = terminal
        proof["blockers"] = ["EXECUTION-TRANSACTION-FAILED:" + phase]
        self.value["package_state"] = terminal
        self._persist()
