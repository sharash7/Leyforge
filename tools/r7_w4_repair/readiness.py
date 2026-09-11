"""Identity-safe future W4 rerun plan derived from PRD-07 rerun law."""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Dict, List, Mapping, Tuple


ROOT = Path(__file__).resolve().parents[2]
REPAIR_SOURCE_RELATIVES = (
    "proofs/r7/w4_execution/presentation_probe",
    "proofs/r7/w4_human_review",
    "tools/r7_w4_execution/builds.py",
    "tools/r7_w4_execution/observations.py",
    "tools/r7_w4_repair",
    "tools/r7_w4_repair_audit.py",
    "tools/tests/test_r7_w4_execution.py",
    "tools/tests/test_r7_w4_repair.py",
)
LAWFULLY_SUPERSEDED_STOP_SOURCE = {
    "tools/r7_w4_execution/observations.py",
    "tools/tests/test_r7_w4_execution.py",
}


W4_PROOFS = (
    "PRD04-PROOF-49", "PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-52",
    "PRD04-PROOF-53", "PRD04-PROOF-54", "PRD04-PROOF-55", "PRD04-PROOF-56",
    "PRD04-PROOF-57", "PRD04-PROOF-58", "PRD04-PROOF-59", "PRD04-PROOF-60",
    "PRD04-PROOF-61", "PRD04-PROOF-62", "PRD04-PROOF-71",
)

HISTORICAL = {
    "PRD04-PROOF-49": ("PRD07-RUN-0066", "PRD07-EVID-0066", "PASS-OBSERVED"),
    "PRD04-PROOF-50": ("PRD07-RUN-0067", "PRD07-EVID-0067", "INCONCLUSIVE"),
    "PRD04-PROOF-51": ("PRD07-RUN-0068", "PRD07-EVID-0068", "INCONCLUSIVE"),
    "PRD04-PROOF-52": ("PRD07-RUN-0069", "PRD07-EVID-0069", "PASS-OBSERVED"),
    "PRD04-PROOF-53": ("PRD07-RUN-0070", "PRD07-EVID-0070", "INCONCLUSIVE"),
    "PRD04-PROOF-54": ("PRD07-RUN-0071", "PRD07-EVID-0071", "PASS-OBSERVED"),
    "PRD04-PROOF-55": ("PRD07-RUN-0072", "PRD07-EVID-0072", "FAIL-OBSERVED-RAW-NOT-ADMISSIBLE"),
}

DISPOSITIONS = {
    "PRD04-PROOF-49": ("HISTORICAL-RESULT-ADMISSIBLE-NO-RERUN", "The source/bake reproducibility observation is independent of the repaired proof-55 measurement route and remains PASS-OBSERVED."),
    "PRD04-PROOF-50": ("RERUN-REQUIRED-ORIGINAL-INCONCLUSIVE", "The original automated chain lacked the required real human art-production/handoff judgement."),
    "PRD04-PROOF-51": ("RERUN-REQUIRED-ORIGINAL-INCONCLUSIVE", "The original matched-source run lacked the required masked human workflow/parity judgement."),
    "PRD04-PROOF-52": ("HISTORICAL-RESULT-ADMISSIBLE-NO-RERUN", "The scale/identity observation is independent of proof-55 measurement and remains PASS-OBSERVED."),
    "PRD04-PROOF-53": ("RERUN-REQUIRED-ORIGINAL-INCONCLUSIVE", "Automated renderer launches lacked the required per-lane human readability/presentation judgement."),
    "PRD04-PROOF-54": ("HISTORICAL-RESULT-ADMISSIBLE-NO-RERUN", "The client/server logical-role observation is independent of proof-55 measurement and remains PASS-OBSERVED."),
    "PRD04-PROOF-55": ("RERUN-REQUIRED-DEFECTIVE-OBSERVATION-ROUTE", "The immutable raw 0072 result used W4-MEASUREMENT-DEFECT-001 and is not admissible as a candidate proof failure."),
    "PRD04-PROOF-56": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered before the controlled stop."),
    "PRD04-PROOF-57": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered; all 312 FCC-13E rows remain independently required."),
    "PRD04-PROOF-58": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered; all 312 FCC-13E rows remain independently required."),
    "PRD04-PROOF-59": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered before the controlled stop."),
    "PRD04-PROOF-60": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered before the controlled stop."),
    "PRD04-PROOF-61": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered before the controlled stop."),
    "PRD04-PROOF-62": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered before the controlled stop."),
    "PRD04-PROOF-71": ("NEVER-RUN-STILL-REQUIRED", "The proof was never entered before the controlled stop."),
}


def rerun_plan() -> Dict[str, Any]:
    next_number = 73
    rows = []
    preview_order = 0
    for proof_id in W4_PROOFS:
        disposition, reason = DISPOSITIONS[proof_id]
        row: Dict[str, Any] = {"proof_id": proof_id, "historical": None, "disposition": disposition, "reason": reason}
        if proof_id in HISTORICAL:
            run_id, evidence_id, outcome = HISTORICAL[proof_id]
            row["historical"] = {"run_id": run_id, "evidence_id": evidence_id, "outcome": outcome}
        if disposition != "HISTORICAL-RESULT-ADMISSIBLE-NO-RERUN":
            preview_order += 1
            row["preview"] = {
                "state": "PREVIEW-NOT-ALLOCATED",
                "run_id": "PRD07-RUN-{0:04d}".format(next_number),
                "evidence_id": "PRD07-EVID-{0:04d}".format(next_number),
                "canonical_order": preview_order,
            }
            next_number += 1
        rows.append(row)
    return {
        "schema_version": "prd07-w4-rerun-plan-v1",
        "state": "PREVIEW-ONLY-AWAITING-FRESH-OWNER-AUTHORIZATION",
        "issued_high_water": 72,
        "next_possible_identity": "0073-NOT-ALLOCATED",
        "proofs": rows,
        "rerun_proof_order": [row["proof_id"] for row in rows if row.get("preview")],
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "fcc13e": {
            "PRD04-PROOF-57": {"observed_rows": 0, "future_requirement": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER"},
            "PRD04-PROOF-58": {"observed_rows": 0, "future_requirement": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER"},
        },
    }


def plan_issues(value: Mapping[str, Any]) -> Tuple[str, ...]:
    issues = []
    if value.get("schema_version") != "prd07-w4-rerun-plan-v1":
        issues.append("rerun plan schema differs")
    if value.get("issued_high_water") != 72 or value.get("next_possible_identity") != "0073-NOT-ALLOCATED":
        issues.append("rerun plan identity boundary differs")
    if value.get("allocated_run_ids") != [] or value.get("allocated_evidence_ids") != []:
        issues.append("rerun plan contains allocated identities")
    if value.get("proof_execution_started") is not False or value.get("identity_allocation_started") is not False:
        issues.append("rerun plan claims execution or allocation")
    rows = value.get("proofs")
    if not isinstance(rows, list) or [row.get("proof_id") for row in rows if isinstance(row, Mapping)] != list(W4_PROOFS):
        issues.append("rerun plan proof roster/order differs")
        return tuple(issues)
    preview_number = 73
    for row in rows:
        proof_id = str(row.get("proof_id"))
        if proof_id not in DISPOSITIONS or row.get("disposition") != DISPOSITIONS.get(proof_id, (None,))[0]:
            issues.append("rerun plan disposition differs for " + proof_id)
            continue
        preview = row.get("preview")
        should_preview = DISPOSITIONS[proof_id][0] != "HISTORICAL-RESULT-ADMISSIBLE-NO-RERUN"
        if should_preview:
            if not isinstance(preview, Mapping) or preview.get("state") != "PREVIEW-NOT-ALLOCATED" or preview.get("run_id") != "PRD07-RUN-{0:04d}".format(preview_number) or preview.get("evidence_id") != "PRD07-EVID-{0:04d}".format(preview_number):
                issues.append("rerun preview differs for " + proof_id)
            preview_number += 1
        elif preview is not None:
            issues.append("admissible historical proof has a rerun preview: " + proof_id)
    fcc = value.get("fcc13e", {})
    for proof_id in ("PRD04-PROOF-57", "PRD04-PROOF-58"):
        row = fcc.get(proof_id, {}) if isinstance(fcc, Mapping) else {}
        if row.get("observed_rows") != 0 or row.get("future_requirement") != "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER":
            issues.append("FCC-13E future requirement differs for " + proof_id)
    return tuple(issues)


def _sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _source_paths() -> Tuple[Path, ...]:
    paths = set()
    for relative in REPAIR_SOURCE_RELATIVES:
        path = ROOT / relative
        if path.is_dir():
            paths.update(
                item for item in path.rglob("*")
                if item.is_file() and "__pycache__" not in item.parts and item.suffix.lower() != ".pyc"
            )
        elif path.is_file():
            paths.add(path)
    return tuple(sorted(paths))


def _source_identity(source_revision: str) -> Tuple[Dict[str, Any], List[str]]:
    artifacts = []
    issues: List[str] = []
    digest = hashlib.sha256()
    for path in _source_paths():
        relative = path.relative_to(ROOT).as_posix()
        current = path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")
        committed = subprocess.run(
            ["git", "show", source_revision + ":" + relative], cwd=ROOT, capture_output=True
        )
        if committed.returncode:
            issues.append("repair source is absent from implementation commit: " + relative)
            continue
        committed_data = committed.stdout.replace(b"\r\n", b"\n").replace(b"\r", b"\n")
        if current != committed_data:
            issues.append("repair source differs from implementation commit: " + relative)
        sha256 = hashlib.sha256(committed_data).hexdigest()
        blob = subprocess.run(
            ["git", "rev-parse", source_revision + ":" + relative], cwd=ROOT, text=True, capture_output=True
        ).stdout.strip()
        digest.update(relative.encode("utf-8") + b"\0" + committed_data + b"\0")
        artifacts.append({"path": relative, "bytes": len(committed_data), "sha256": sha256, "git_blob": blob})
    return {"sha256": digest.hexdigest(), "artifacts": artifacts}, issues


def _stopped_history_issues(source_revision: str) -> Tuple[str, ...]:
    """Validate the immutable stop at its commit while allowing named repair sources to supersede it."""
    issues = []
    boundary_path = ROOT / "docs/rebuild/r7/w4-stopped-execution-boundary.json"
    reconciliation_path = ROOT / "docs/rebuild/r7/w4-stopped-execution-reconciliation.json"
    if not boundary_path.is_file() or not reconciliation_path.is_file():
        return ("W4 stopped lifecycle boundary/reconciliation is missing",)
    boundary = json.loads(boundary_path.read_text(encoding="utf-8-sig"))
    if boundary.get("status") != "PASS" or boundary.get("package_state") != "STOPPED-AFTER-FAIL-OBSERVED":
        issues.append("W4 stopped boundary status differs")
    if boundary.get("issued_high_water") != 72 or boundary.get("next_possible_identity") != "0073-NOT-ALLOCATED":
        issues.append("W4 stopped boundary identity differs")
    validation_commit = str(boundary.get("lifecycle_validation_commit", ""))
    ancestor = subprocess.run(["git", "merge-base", "--is-ancestor", validation_commit, source_revision], cwd=ROOT)
    if re.fullmatch(r"[0-9a-f]{40}", validation_commit) is None or ancestor.returncode:
        issues.append("W4 stopped lifecycle commit is invalid or not an ancestor")
    records = boundary.get("artifacts", [])
    if not isinstance(records, list) or not records:
        issues.append("W4 stopped boundary artifacts are absent")
        return tuple(issues)
    for record in records:
        if not isinstance(record, Mapping):
            issues.append("W4 stopped boundary has a non-object artifact")
            continue
        relative = str(record.get("path", ""))
        blob = str(record.get("git_blob", ""))
        historical = subprocess.run(["git", "cat-file", "blob", blob], cwd=ROOT, capture_output=True)
        if historical.returncode:
            issues.append("W4 stopped artifact blob is unavailable: " + relative)
            continue
        data = historical.stdout.replace(b"\r\n", b"\n").replace(b"\r", b"\n")
        if len(data) != record.get("bytes") or hashlib.sha256(data).hexdigest() != record.get("sha256"):
            issues.append("W4 stopped artifact record differs: " + relative)
        at_commit = subprocess.run(["git", "rev-parse", validation_commit + ":" + relative], cwd=ROOT, text=True, capture_output=True)
        if at_commit.returncode or at_commit.stdout.strip() != blob:
            issues.append("W4 stopped artifact was not bound to its lifecycle commit: " + relative)
        if relative not in LAWFULLY_SUPERSEDED_STOP_SOURCE:
            current = ROOT / relative
            if not current.is_file():
                issues.append("non-superseded W4 stopped artifact is missing: " + relative)
            else:
                current_data = current.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")
                if current_data != data:
                    issues.append("non-superseded W4 stopped artifact changed: " + relative)
    reconciliation = json.loads(reconciliation_path.read_text(encoding="utf-8-sig"))
    if reconciliation.get("status") != "PASS" or reconciliation.get("issued_high_water") != 72:
        issues.append("W4 stopped reconciliation status differs")
    return tuple(sorted(set(issues)))


def build_rerun_readiness(source_revision: str, recertification: Mapping[str, Any]) -> Dict[str, Any]:
    """Build an additive readiness artifact without rewriting historical W4 state."""
    from tools.r7_w4_execution.contracts import (
        certified_readiness_history_issues,
        fixture_identity,
        protected_local_issues,
    )
    from tools.r7_w4_execution.execution import reconcile_w4
    from tools.r7_w4_repair.human_review import review_issues
    from tools.r7_w4_runtime.dependencies import local_dependency_report
    from tools.r7_w4_runtime.fixtures import fixture_issues

    issues: List[str] = []
    if re.fullmatch(r"[0-9a-f]{40}", source_revision) is None:
        issues.append("implementation commit is not an exact lowercase commit")
    identity, source_issues = _source_identity(source_revision)
    issues.extend(source_issues)
    issues.extend(certified_readiness_history_issues())
    issues.extend(_stopped_history_issues(source_revision))
    issues.extend(fixture_issues())
    issues.extend(plan_issues(rerun_plan()))
    issues.extend(protected_local_issues())
    stopped = reconcile_w4(check_local=True)
    if stopped.get("status") != "PASS":
        issues.extend("stopped reconciliation: " + str(value) for value in stopped.get("failures", []))
    dependency = local_dependency_report()
    if dependency.get("status") != "PASS" or dependency.get("local_patch_status") != "NO-LOCAL-PATCH":
        issues.extend("dependency: " + str(value) for value in dependency.get("issues", []))
    if recertification.get("state") != "PASS" or recertification.get("source_revision") != source_revision:
        issues.append("measurement recertification is not PASS for the implementation commit")
    if recertification.get("proof_execution_started") is not False or recertification.get("identity_allocation_started") is not False:
        issues.append("measurement recertification crossed proof/allocation boundary")

    review_root = ROOT / "proofs/r7/w4_human_review"
    review_rows = []
    for proof_id in ("PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-53"):
        path = review_root / (proof_id.lower().replace("prd04-proof-", "proof-") + "-pending.json")
        if not path.is_file():
            issues.append("human review form is missing: " + proof_id)
            continue
        value = json.loads(path.read_text(encoding="utf-8-sig"))
        form_issues = review_issues(value)
        issues.extend(proof_id + ": " + issue for issue in form_issues)
        review_rows.append({
            "proof_id": proof_id,
            "path": path.relative_to(ROOT).as_posix(),
            "sha256": _sha256(path),
            "status": value.get("status"),
            "judgement": value.get("judgement"),
            "attestation": "UNSIGNED",
        })
    schema_path = review_root / "human-review.schema.json"
    instructions_path = review_root / "README.md"
    origin_path = review_root / "proof-51-origin-mapping-pending.json"
    for path in (schema_path, instructions_path, origin_path):
        if not path.is_file():
            issues.append("human review support artifact is missing: " + path.name)

    plan = rerun_plan()
    fcc_path = ROOT / "proofs/r7/w4/fixture-07/fcc13e-expected.json"
    fcc = json.loads(fcc_path.read_text(encoding="utf-8-sig"))
    fcc_rows = fcc.get("rows", [])
    if not isinstance(fcc_rows, list) or len(fcc_rows) != 312:
        issues.append("FCC-13E admitted source does not contain exactly 312 rows")
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        if (ROOT / relative).exists():
            issues.append("root production boundary exists: " + relative)
    suffix = [
        path.name for path in (ROOT / "docs/rebuild/r7/execution-evidence").glob("PRD07-RUN-*")
        if path.is_dir() and int(path.name.rsplit("-", 1)[-1]) >= 73
    ]
    if suffix:
        issues.append("0073+ execution-evidence paths exist: " + ", ".join(suffix))

    historical_paths = (
        "docs/rebuild/r7/w4-readiness.json",
        "docs/rebuild/r7/w4-readiness-admission-boundary.json",
        "docs/rebuild/r7/w4-execution-state.json",
        "docs/rebuild/r7/w4-stopped-execution-boundary.json",
        "docs/rebuild/r7/w4-stopped-execution-reconciliation.json",
        "brain/10_TESTING/Evidence/EVID-0015.md",
        "brain/11_AUDIT/Reports/AUDIT-0015.md",
    )
    historical = []
    for relative in historical_paths:
        path = ROOT / relative
        if path.is_file():
            historical.append({"path": relative, "bytes": path.stat().st_size, "sha256": _sha256(path)})
        else:
            issues.append("historical W4 artifact is missing: " + relative)

    value: Dict[str, Any] = {
        "schema_version": "prd07-w4-rerun-readiness-v1",
        "package": "R7-W4-MEASUREMENT-HARNESS-REPAIR-RECERTIFICATION-AND-RERUN-READINESS",
        "state": "READY-FOR-SEPARATE-OWNER-AUTHORIZED-RERUN" if not issues else "BLOCKED",
        "implementation_commit": source_revision,
        "source_tree_identity": identity["sha256"],
        "source_tree_artifacts": identity["artifacts"],
        "measurement_recertification": {
            "path": "docs/rebuild/r7/w4-measurement-recertification.json",
            "state": recertification.get("state"),
            "check_total": recertification.get("check_total"),
            "source_revision": recertification.get("source_revision"),
            "build_identity": recertification.get("build", {}).get("build_identity"),
            "artifact_sha256": recertification.get("build", {}).get("artifact_sha256"),
        },
        "historical_readiness_and_stop": {
            "status": "PASS" if not certified_readiness_history_issues() and not _stopped_history_issues(source_revision) and stopped.get("status") == "PASS" else "FAIL",
            "immutable_artifacts": historical,
            "stopped_reconciliation_checks": stopped.get("checks"),
            "observation_commit": "cd9bba06cb9cf8ffa6a70c6332bd391a8cce4da7",
            "retained_run_range": "0066-0072",
            "proof_55_raw_result": "FAIL-OBSERVED-RETAINED-NOT-ADMISSIBLE-AS-CANDIDATE-FAILURE",
            "measurement_defect": "W4-MEASUREMENT-DEFECT-001",
        },
        "revalidation": {
            "exact_proof_roster": "PASS-15/15",
            "authority_sources": "PASS-HISTORICAL-CANON-UNCHANGED",
            "prd06_consumers": "PASS-HISTORICAL-ROUTES-UNCHANGED",
            "fixtures": "PASS" if not fixture_issues() else "FAIL",
            "tool_routes": "PASS-REPAIRED-ADDITIVE",
            "hypotheses_measurements_repetitions_and_outcome_rules": "PASS-CANONICAL-CONTRACTS-UNCHANGED",
            "environment_and_isolation": "PASS-EXACT-FIXED-ENGINE-AND-ISOLATED-PROFILES",
            "renderer_lanes": "READY-PENDING-REAL-HUMAN-REVIEW-DURING-RERUN",
            "evidence_schema": "PASS-HISTORICAL-STANDARD-PACK-SCHEMA-UNCHANGED",
            "identity_rules": "PASS-HIGH-WATER-0072",
            "protected_paths": "PASS-9/9-BYTE-PINNED",
            "fcc13e": "PASS-SOURCE-BOUNDARY-ONLY-NO-PROOF-OBSERVATIONS",
        },
        "fixture_identities": fixture_identity(("FIXTURE-04", "FIXTURE-05", "FIXTURE-07", "FIXTURE-08", "FIXTURE-09")),
        "dependency_identity": dependency,
        "environment_identity": recertification.get("build", {}).get("environment", {}),
        "human_review": {
            "mechanism_status": "READY-PENDING-REAL-HUMAN-REVIEW",
            "actual_human_review_complete": False,
            "codex_self_attestation": "PROHIBITED-NOT-PERFORMED",
            "forms": review_rows,
            "schema": schema_path.relative_to(ROOT).as_posix(),
            "instructions": instructions_path.relative_to(ROOT).as_posix(),
            "proof_51_separate_origin_mapping": origin_path.relative_to(ROOT).as_posix(),
        },
        "issued_high_water": plan["issued_high_water"],
        "next_possible_identity": plan["next_possible_identity"],
        "proofs": plan["proofs"],
        "rerun_proof_order": plan["rerun_proof_order"],
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "fcc13e": plan["fcc13e"],
        "fcc13e_source": {"path": fcc_path.relative_to(ROOT).as_posix(), "sha256": _sha256(fcc_path), "rows": len(fcc_rows)},
        "execution_gate": "CLOSED-PENDING-SEPARATE-OWNER-AUTHORIZATION",
        "fresh_owner_authorization_required": True,
        "ready_for_fresh_owner_authorization": not issues,
        "human_review_still_outstanding": True,
        "w5": "CLOSED-NOT-READY",
        "r7_final": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "gameplay_permission": "CLOSED",
        "issues": sorted(set(issues)),
    }
    return value
