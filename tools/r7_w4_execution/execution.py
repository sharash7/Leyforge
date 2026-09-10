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


def reconcile_w4() -> Dict[str, Any]:
    failures: List[str] = []
    if not STATE_PATH.is_file():
        return {"status": "FAIL", "failures": ["W4 execution state is missing"]}
    state = load_json(STATE_PATH)
    if state.get("schema_version") != "prd07-w4-execution-state-v1":
        failures.append("W4 execution state schema differs")
    expected_runs = ["PRD07-RUN-{0:04d}".format(value) for value in range(66, 81)]
    expected_evidence = ["PRD07-EVID-{0:04d}".format(value) for value in range(66, 81)]
    if state.get("allocated_run_ids") != expected_runs or state.get("allocated_evidence_ids") != expected_evidence:
        failures.append("W4 allocated identity arrays differ from exact 0066-0080 order")
    proofs = state.get("proofs", [])
    if [row.get("proof_id") for row in proofs] != list(EXECUTION_ROSTER):
        failures.append("W4 proof roster/order differs")
    allowed = {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}
    if len(proofs) != 15 or any(row.get("state") not in allowed for row in proofs):
        failures.append("W4 proof set is not fully terminal observed")
    packs = []
    fcc_rows: Dict[str, list] = {}
    for run_id, evidence_id, proof_id in zip(expected_runs, expected_evidence, EXECUTION_ROSTER):
        root = RETAINED_ROOT / run_id
        required = ("run.json", "standard-evidence.json", "build-manifest.json", "artifact-manifest.json", "observed-result.json", "summary.md")
        if not root.is_dir() or any(not (root / name).is_file() for name in required):
            failures.append("W4 retained pack is incomplete: " + run_id)
            continue
        run = load_json(root / "run.json")
        standard = load_json(root / "standard-evidence.json")
        if run.get("run_id") != run_id or run.get("evidence_id") != evidence_id or run.get("proof_id") != proof_id:
            failures.append("W4 retained pack identity differs: " + run_id)
        failures.extend(run_id + ": " + issue for issue in evidence_issues(standard))
        if sha256_file(root / "standard-evidence.json") != run.get("evidence_sha256"):
            failures.append("W4 retained standard evidence hash differs: " + run_id)
        for artifact in standard.get("observation", {}).get("raw_artifacts", []):
            path = root / str(artifact.get("path", ""))
            if not path.is_file() or path.stat().st_size != artifact.get("bytes") or sha256_file(path) != artifact.get("sha256"):
                failures.append("W4 retained raw artifact differs: {0}/{1}".format(run_id, artifact.get("path", "")))
        if proof_id in {"PRD04-PROOF-57", "PRD04-PROOF-58"}:
            fcc_rows[proof_id] = standard.get("observation", {}).get("fcc13e_rows", [])
        packs.append({"run_id": run_id, "evidence_id": evidence_id, "proof_id": proof_id, "state": standard.get("observation", {}).get("state"), "path": root.relative_to(ROOT).as_posix(), "sha256": sha256_file(root / "standard-evidence.json")})
    if set(fcc_rows) != {"PRD04-PROOF-57", "PRD04-PROOF-58"}:
        failures.append("both independent FCC-13E evidence ledgers are not retained")
    else:
        for proof_id, rows in fcc_rows.items():
            numeric = [row.get("numeric_id") for row in rows]
            unique = [row.get("unique_id") for row in rows]
            if numeric != list(range(1, 313)) or len(set(unique)) != 312 or any(row.get("observed_state") != "PASS-OBSERVED" for row in rows):
                failures.append(proof_id + " FCC-13E ledger is incomplete, duplicated, reordered or non-PASS")
        first = {row.get("observation_identity") for row in fcc_rows["PRD04-PROOF-57"]}
        second = {row.get("observation_identity") for row in fcc_rows["PRD04-PROOF-58"]}
        if first & second:
            failures.append("PROOF-57 and PROOF-58 reused FCC-13E observation identities")
    try:
        registry = inspect_execution_registry(ROOT)
        if registry.max_run_number != 80 or registry.max_evidence_number != 80:
            failures.append("global RUN/EVID high-water is not exactly 0080")
        if tuple(registry.run_ids[-15:]) != tuple(expected_runs) or tuple(registry.evidence_ids[-15:]) != tuple(expected_evidence):
            failures.append("global registry W4 suffix differs from exact sequence")
    except Exception as exc:
        failures.append("global execution registry reconciliation failed: " + str(exc))
    failures.extend(protected_local_issues())
    w3 = ROOT / "docs/rebuild/r7/w3-execution-state.json"
    readiness = load_json(ROOT / "docs/rebuild/r7/w4-readiness.json")
    expected_w3 = readiness.get("registry_before_and_after_readiness", {}).get("w3_state_sha256")
    if not w3.is_file() or sha256_file(w3) != expected_w3:
        failures.append("immutable W3 execution state changed")
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        if (ROOT / relative).exists():
            failures.append("root production boundary crossed: " + relative)
    counts = {state_name: sum(row.get("state") == state_name for row in proofs) for state_name in ("PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE")}
    return {
        "schema_version": "prd07-w4-terminal-reconciliation-v1",
        "status": "PASS" if not failures else "FAIL",
        "package": EXECUTION_PACKAGE,
        "checks": 15 + len(packs) * 6 + 624,
        "proofs": len(proofs),
        "result_counts": counts,
        "allocated_run_ids": state.get("allocated_run_ids", []),
        "allocated_evidence_ids": state.get("allocated_evidence_ids", []),
        "retained_packs": packs,
        "fcc13e": {"PRD04-PROOF-57": len(fcc_rows.get("PRD04-PROOF-57", [])), "PRD04-PROOF-58": len(fcc_rows.get("PRD04-PROOF-58", [])), "independent_observation_identities": not bool(failures)},
        "issued_high_water": 80 if not failures else None,
        "protected_local_paths": "UNCHANGED" if not protected_local_issues() else "CHANGED",
        "w3_history": "UNCHANGED" if w3.is_file() and sha256_file(w3) == expected_w3 else "CHANGED",
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "w5": "CLOSED",
        "failures": sorted(set(failures)),
    }
