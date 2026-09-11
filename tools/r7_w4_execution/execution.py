"""Guarded W4 execution orchestration and terminal reconciliation."""

from __future__ import annotations

import hashlib
import json
import time
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, List, Mapping, Tuple

from tools.r7_w3_runtime.execution_plan import inspect_execution_registry
from tools.r7_w4_runtime.dependencies import local_dependency_report

from .builds import build_probe
from .contracts import (
    EXECUTION_PACKAGE,
    EXECUTION_ROSTER,
    RETAINED_ROOT,
    ROOT,
    STATE_PATH,
    canonical_bytes,
    execution_admission_issues,
    load_json,
    protected_local_issues,
    sha256_file,
)
from .evidence import evidence_issues, retain_evidence
from .journal import W4ExecutionJournal
from .observations import run_observation


def _timestamp() -> str:
    return datetime.now(timezone.utc).isoformat().replace("+00:00", "Z")


def _continuing_issues(journal: W4ExecutionJournal) -> Tuple[str, ...]:
    issues = list(protected_local_issues())
    local = local_dependency_report()
    if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
        issues.extend(str(value) for value in local.get("issues", ["local dependency drift"]))
    try:
        registry = inspect_execution_registry(ROOT)
        expected = 65 + len(journal.history)
        if registry.max_run_number != expected or registry.max_evidence_number != expected:
            issues.append("global RUN/EVID high-water differs from W4 journal")
    except Exception as exc:
        issues.append("global execution registry is ambiguous: " + str(exc))
    return tuple(sorted(set(issues)))


def execute_w4(source_revision: str, run_root: Path, *, actual_execution_authorized: bool) -> Dict[str, Any]:
    if not actual_execution_authorized:
        raise ValueError("actual W4 proof execution requires the explicit authorization flag")
    issues = execution_admission_issues(source_revision, require_initial_high_water=True)
    if issues:
        raise ValueError("W4 governed execution preflight failed: " + "; ".join(issues))
    run_root = run_root.resolve()
    build = build_probe(source_revision, run_root)
    issues = execution_admission_issues(source_revision, require_initial_high_water=True)
    if issues:
        raise ValueError("W4 post-build preallocation revalidation failed: " + "; ".join(issues))
    journal = W4ExecutionJournal(source_revision)
    completed = []
    package_started = time.time()
    for proof_id in EXECUTION_ROSTER:
        continuing = _continuing_issues(journal)
        if continuing:
            raise ValueError("W4 just-in-time allocation refused before {0}: {1}".format(proof_id, "; ".join(continuing)))
        allocation = journal.allocate(proof_id)
        run_id = allocation["run_id"]
        observation_produced = False
        phase = "after-allocation"
        try:
            journal.begin(run_id)
            phase = "proof-observation"
            started_at = _timestamp()
            observed = run_observation(proof_id, run_id, run_root, build)
            finished_at = _timestamp()
            observation_produced = True
            journal.observation_captured(run_id, str(observed["outcome"]))
            phase = "evidence-retention"
            retained = retain_evidence(allocation, source_revision, build, observed, started_at, finished_at, RETAINED_ROOT)
            phase = "journal-reconciliation"
            record = {
                "proof_id": proof_id,
                "run_id": run_id,
                "evidence_id": allocation["evidence_id"],
                "state": observed["outcome"],
                "build_identity": build["build_identity"],
                "artifact_sha256": build["artifact_sha256"],
                "key_metrics": observed["measurements"],
                "acceptance_reason": observed["reason"],
                "limitations": observed.get("limitations", []),
                "blockers": observed.get("blockers", []),
                "portable_path": retained["portable_path"],
                "standard_evidence_sha256": retained["standard_evidence_sha256"],
                "prd08_submission": "NOT-SUBMITTED",
            }
            journal.complete(run_id, str(observed["outcome"]), record)
            completed.append(record)
            if observed["outcome"] == "FAIL-OBSERVED":
                journal.value["package_state"] = "STOPPED-AFTER-FAIL-OBSERVED"
                journal._persist()
                break
        except BaseException as exc:
            journal.fail_transaction(run_id, phase, exc, observation_produced=observation_produced)
            raise
    counts = {state: sum(row["state"] == state for row in journal.value["proofs"]) for state in ("PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE", "NOT-RUN", "INVALIDATED")}
    return {
        "schema_version": "prd07-w4-execution-result-v1",
        "status": "COMPLETE" if len(completed) == len(EXECUTION_ROSTER) else "STOPPED",
        "package": EXECUTION_PACKAGE,
        "source_revision": source_revision,
        "duration_seconds": time.time() - package_started,
        "result_counts": counts,
        "proofs": journal.value["proofs"],
        "allocated_run_ids": journal.value["allocated_run_ids"],
        "allocated_evidence_ids": journal.value["allocated_evidence_ids"],
        "build": build,
        "prd08_submission": "NOT-SUBMITTED",
        "w5": "CLOSED",
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
    }


RECONCILIATION_PATH = ROOT / "docs/rebuild/r7/w4-stopped-execution-reconciliation.json"
STOPPED_STATES = (
    "PASS-OBSERVED",
    "INCONCLUSIVE",
    "INCONCLUSIVE",
    "PASS-OBSERVED",
    "INCONCLUSIVE",
    "PASS-OBSERVED",
    "FAIL-OBSERVED",
    "NOT-RUN",
    "NOT-RUN",
    "NOT-RUN",
    "NOT-RUN",
    "NOT-RUN",
    "NOT-RUN",
    "NOT-RUN",
    "NOT-RUN",
)


def _measurement_defect(state: Mapping[str, Any]) -> Dict[str, Any]:
    proof = next((row for row in state.get("proofs", []) if row.get("proof_id") == "PRD04-PROOF-55"), {})
    root = RETAINED_ROOT / "PRD07-RUN-0072"
    rows_path = root / "artifacts/validator-results.json"
    rows = json.loads(rows_path.read_text(encoding="utf-8-sig")) if rows_path.is_file() else []
    hostile = [row for row in rows if isinstance(row, dict) and row.get("case_id") != "BENIGN-DATA"]
    accepted = [row for row in hostile if row.get("actual") == "ACCEPT-BOUNDED-DATA"]
    encoded = [row for row in hostile if row.get("mutation") == "encoded-reference"]
    accepted_encoded = [row for row in encoded if row.get("actual") == "ACCEPT-BOUNDED-DATA"]
    reason = str(proof.get("acceptance_reason", ""))
    return {
        "finding_id": "W4-MEASUREMENT-DEFECT-001",
        "proof_id": "PRD04-PROOF-55",
        "run_id": "PRD07-RUN-0072",
        "evidence_id": "PRD07-EVID-0072",
        "finding_class": "MEASUREMENT-DEFECT",
        "original_observation_state": "FAIL-OBSERVED",
        "original_observation_retained_immutable": True,
        "retained_pack_sha256": proof.get("standard_evidence_sha256"),
        "observed_hostile_rows": len(hostile),
        "observed_encoded_rows": len(encoded),
        "observed_accepted_rows": len(accepted),
        "observed_accepted_encoded_rows": len(accepted_encoded),
        "observed_side_effects": {
            "payload_executions": 0,
            "filesystem_changes": 0,
            "external_accesses": 0,
        },
        "reason_contradicts_raw_measurement": bool(accepted) and "All 24 hostile mutation observations were rejected" in reason,
        "root_cause": "The proof-only oracle lowercased the case-sensitive base64 token before decoding, corrupting every encoded reference; it also used marker inspection rather than actual engine resource/capability resolution.",
        "canonical_failure_criterion_observed": False,
        "canonical_inconclusive_condition_applies": True,
        "evidence_admission_disposition": "RETAINED-NOT-ADMISSIBLE-AS-CANDIDATE-FAILURE",
        "prd07_followup": "RERUN-REQUIRED-AFTER-HARNESS-REPAIR-AND-RECERTIFICATION",
        "repair_state": "SOURCE-SAFEGUARD-IMPLEMENTED-NOT-RERUN",
    }


def reconcile_w4(*, check_local: bool = True, write: bool = False) -> Dict[str, Any]:
    failures: List[str] = []
    checks = 0

    def check(condition: bool, message: str) -> None:
        nonlocal checks
        checks += 1
        if not condition:
            failures.append(message)

    if not STATE_PATH.is_file():
        return {"status": "FAIL", "checks": 1, "failures": ["W4 execution state is missing"]}
    state = load_json(STATE_PATH)
    proofs = state.get("proofs", [])
    issued_runs = ["PRD07-RUN-{0:04d}".format(value) for value in range(66, 73)]
    issued_evidence = ["PRD07-EVID-{0:04d}".format(value) for value in range(66, 73)]
    check(state.get("schema_version") == "prd07-w4-execution-state-v1", "W4 execution state schema differs")
    check(state.get("package") == EXECUTION_PACKAGE, "W4 execution package identity differs")
    check(state.get("package_state") == "STOPPED-AFTER-FAIL-OBSERVED", "W4 package did not retain the required fail-closed stop")
    check(state.get("allocated_run_ids") == issued_runs, "W4 issued RUN identities differ from exact 0066-0072 prefix")
    check(state.get("allocated_evidence_ids") == issued_evidence, "W4 issued EVID identities differ from exact 0066-0072 prefix")
    check(isinstance(proofs, list) and len(proofs) == 15, "W4 proof roster is incomplete")
    if isinstance(proofs, list):
        check([row.get("proof_id") for row in proofs] == list(EXECUTION_ROSTER), "W4 proof roster/order differs")
        check(tuple(row.get("state") for row in proofs) == STOPPED_STATES, "W4 stopped proof dispositions differ")
    history = state.get("allocation_history", [])
    check(isinstance(history, list) and len(history) == 7, "W4 allocation history is not the exact seven issued attempts")
    if isinstance(history, list):
        check([row.get("run_id") for row in history] == issued_runs, "W4 allocation-history RUN order differs")
        check([row.get("evidence_id") for row in history] == issued_evidence, "W4 allocation-history EVID order differs")
        check([row.get("proof_id") for row in history] == list(EXECUTION_ROSTER[:7]), "W4 allocation-history proof order differs")
        check(tuple(row.get("state") for row in history) == STOPPED_STATES[:7], "W4 allocation-history dispositions differ")
        check(all(row.get("identity_retained") is True and row.get("evidence_pack_status") == "RETAINED" for row in history), "W4 issued identities are not atomically retained")

    packs: List[Dict[str, Any]] = []
    for run_id, evidence_id, proof_id, expected_state in zip(issued_runs, issued_evidence, EXECUTION_ROSTER[:7], STOPPED_STATES[:7]):
        root = RETAINED_ROOT / run_id
        required = ("run.json", "standard-evidence.json", "build-manifest.json", "artifact-manifest.json", "observed-result.json", "summary.md")
        check(root.is_dir() and all((root / name).is_file() for name in required), "W4 retained pack is incomplete: " + run_id)
        if not root.is_dir() or any(not (root / name).is_file() for name in required):
            continue
        run = load_json(root / "run.json")
        standard = load_json(root / "standard-evidence.json")
        observed = load_json(root / "observed-result.json")
        check(run.get("run_id") == run_id and run.get("evidence_id") == evidence_id and run.get("proof_id") == proof_id, "W4 retained run identity differs: " + run_id)
        check(standard.get("run_id") == run_id and standard.get("evidence_id") == evidence_id and standard.get("proof_id") == proof_id, "W4 standard-evidence identity differs: " + run_id)
        check(run.get("outcome") == standard.get("observation", {}).get("state") == observed.get("outcome") == expected_state, "W4 retained disposition differs: " + run_id)
        evidence_failures = evidence_issues(standard)
        check(not evidence_failures, run_id + ": " + "; ".join(evidence_failures))
        check(sha256_file(root / "standard-evidence.json") == run.get("evidence_sha256"), "W4 retained standard evidence hash differs: " + run_id)
        for artifact in standard.get("observation", {}).get("raw_artifacts", []):
            path = root / str(artifact.get("path", ""))
            check(path.is_file() and path.stat().st_size == artifact.get("bytes") and sha256_file(path) == artifact.get("sha256"), "W4 retained raw artifact differs: {0}/{1}".format(run_id, artifact.get("path", "")))
        packs.append({
            "run_id": run_id,
            "evidence_id": evidence_id,
            "proof_id": proof_id,
            "state": expected_state,
            "path": root.relative_to(ROOT).as_posix(),
            "sha256": sha256_file(root / "standard-evidence.json"),
            "evidence_admission": "RETAINED-NOT-ADMISSIBLE-AS-CANDIDATE-FAILURE" if run_id == "PRD07-RUN-0072" else "RETAINED-RAW-OBSERVATION",
        })
    for sequence in range(73, 81):
        check(not (RETAINED_ROOT / "PRD07-RUN-{0:04d}".format(sequence)).exists(), "unissued W4 evidence path exists: PRD07-RUN-{0:04d}".format(sequence))

    try:
        registry = inspect_execution_registry(ROOT)
        check(registry.max_run_number == 72 and registry.max_evidence_number == 72, "global RUN/EVID high-water is not exactly 0072")
        check(tuple(registry.run_ids[-7:]) == tuple(issued_runs) and tuple(registry.evidence_ids[-7:]) == tuple(issued_evidence), "global registry W4 suffix differs from exact 0066-0072 sequence")
    except Exception as exc:
        check(False, "global execution registry reconciliation failed: " + str(exc))

    defect = _measurement_defect(state)
    check(defect["observed_hostile_rows"] == 24 and defect["observed_encoded_rows"] == 6, "PROOF-55 retained hostile/encoded row totals differ")
    check(defect["observed_accepted_rows"] == defect["observed_accepted_encoded_rows"] == 6, "PROOF-55 retained accepted encoded-row result differs")
    check(defect["reason_contradicts_raw_measurement"] is True, "PROOF-55 retained reason/measurement contradiction is not detected")
    check(defect["canonical_failure_criterion_observed"] is False and defect["canonical_inconclusive_condition_applies"] is True, "PROOF-55 defect consequence differs from canonical criteria")

    protected = protected_local_issues() if check_local else ()
    if check_local:
        check(not protected, "; ".join(protected) or "protected local paths changed")
    w3 = ROOT / "docs/rebuild/r7/w3-execution-state.json"
    readiness = load_json(ROOT / "docs/rebuild/r7/w4-readiness.json")
    expected_w3 = readiness.get("registry_before_and_after_readiness", {}).get("w3_state_sha256")
    w3_unchanged = w3.is_file() and sha256_file(w3) == expected_w3
    check(w3_unchanged, "immutable W3 execution state changed")
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        check(not (ROOT / relative).exists(), "root production boundary crossed: " + relative)
    check(all(state.get(name) == "CLOSED" for name in ("w5", "r7_final", "prd09", "r8")), "W4 stopped state opened a prohibited later gate")
    check(state.get("prd08_submission") == "NOT-SUBMITTED", "W4 stopped state entered PRD-08")
    check(state.get("production_runtime") == "ABSENT" and state.get("production_dependency_activation") == "INACTIVE" and state.get("gameplay_permission") == "CLOSED", "W4 stopped state crossed production/gameplay boundary")

    dispositions = []
    for index, (proof_id, disposition) in enumerate(zip(EXECUTION_ROSTER, STOPPED_STATES)):
        issued = index < 7
        dispositions.append({
            "order": index + 1,
            "proof_id": proof_id,
            "execution_disposition": disposition,
            "run_id": issued_runs[index] if issued else None,
            "evidence_id": issued_evidence[index] if issued else None,
            "identity_state": "ALLOCATED-AND-RETAINED" if issued else "NOT-ALLOCATED",
            "evidence_admission": (
                "RETAINED-NOT-ADMISSIBLE-AS-CANDIDATE-FAILURE"
                if proof_id == "PRD04-PROOF-55"
                else "RETAINED-RAW-OBSERVATION"
                if issued
                else "NONE-FAIL-CLOSED-BEFORE-ENTRY"
            ),
        })
    counts = {name: STOPPED_STATES.count(name) for name in ("PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE", "NOT-RUN")}
    result = {
        "schema_version": "prd07-w4-stopped-execution-reconciliation-v1",
        "status": "PASS" if not failures else "FAIL",
        "certification_meaning": "INTEGRITY-OF-STOPPED-PACKAGE-ONLY-NOT-W4-SUCCESS",
        "package": EXECUTION_PACKAGE,
        "package_state": "STOPPED-AFTER-FAIL-OBSERVED",
        "w4_lifecycle_state": "INCOMPLETE-REPAIR-RECERTIFICATION-AND-FRESH-RERUN-AUTHORIZATION-REQUIRED",
        "source_revision": state.get("source_revision"),
        "checks": checks,
        "proofs_authorized": 15,
        "proofs_entered": 7,
        "proofs_not_run": 8,
        "result_counts": counts,
        "proof_dispositions": dispositions,
        "allocated_run_ids": state.get("allocated_run_ids", []),
        "allocated_evidence_ids": state.get("allocated_evidence_ids", []),
        "issued_high_water": 72 if not failures else None,
        "next_possible_identity": "0073-NOT-ALLOCATED",
        "future_identity_authority": "CLOSED",
        "retained_packs": packs,
        "measurement_defect": defect,
        "fcc13e": {
            "PRD04-PROOF-57": {"observed_rows": 0, "required_rows": 312, "state": "NOT-RUN-DUE-PRIOR-FAIL-CLOSED"},
            "PRD04-PROOF-58": {"observed_rows": 0, "required_rows": 312, "state": "NOT-RUN-DUE-PRIOR-FAIL-CLOSED"},
            "sampling_or_waiver": False,
            "coverage_claim": "NONE",
        },
        "protected_local_paths": "UNCHANGED" if check_local and not protected else "NOT-CHECKED-STATIC-RECONCILIATION" if not check_local else "CHANGED",
        "w3_history": "UNCHANGED" if w3_unchanged else "CHANGED",
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "gameplay_permission": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "w5": "CLOSED-NOT-READY",
        "r7_final": "CLOSED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
        "failures": sorted(set(failures)),
    }
    if write:
        if failures:
            raise ValueError("cannot write failed W4 stopped reconciliation: " + "; ".join(sorted(set(failures))))
        RECONCILIATION_PATH.write_bytes(canonical_bytes(result))
    return result
