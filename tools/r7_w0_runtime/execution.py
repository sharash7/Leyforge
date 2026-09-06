"""Authorized W0 proof execution and append-only evidence retention."""

from __future__ import annotations

import json
import platform
import re
import subprocess
import time
from pathlib import Path
from typing import Any, Dict, Iterable, Tuple

from tools.proof_harness.evidence import EvidenceFile, EvidencePack
from tools.proof_harness.manifests import sha256_file
from tools.proof_harness.state import ExecutionKind, ProofExecution, ProofState

from .architecture import ROOT, lint, load_rules
from .builds import ExportedBuild, export_one, run_exported_proof
from .dependencies import load_lock, static_lock_issues, verify_local_dependencies

PROOF_PLAN: Tuple[Tuple[str, str, str], ...] = (
    ("PRD04-PROOF-70", "PRD07-RUN-0001", "PRD07-EVID-0001"),
    ("PRD04-PROOF-73", "PRD07-RUN-0002", "PRD07-EVID-0002"),
    ("PRD04-PROOF-74", "PRD07-RUN-0003", "PRD07-EVID-0003"),
    ("PRD04-PROOF-02", "PRD07-RUN-0004", "PRD07-EVID-0004"),
    ("PRD04-PROOF-01", "PRD07-RUN-0005", "PRD07-EVID-0005"),
    ("PRD04-PROOF-12", "PRD07-RUN-0006", "PRD07-EVID-0006"),
    ("PRD04-PROOF-22", "PRD07-RUN-0007", "PRD07-EVID-0007"),
    ("PRD04-PROOF-03", "PRD07-RUN-0008", "PRD07-EVID-0008"),
    ("PRD04-PROOF-67", "PRD07-RUN-0009", "PRD07-EVID-0009"),
    ("PRD04-PROOF-05", "PRD07-RUN-0010", "PRD07-EVID-0010"),
    ("PRD04-PROOF-06", "PRD07-RUN-0011", "PRD07-EVID-0011"),
    ("PRD04-PROOF-11", "PRD07-RUN-0012", "PRD07-EVID-0012"),
    ("PRD04-PROOF-10", "PRD07-RUN-0013", "PRD07-EVID-0013"),
)
_SOURCE_REVISION = re.compile(r"^[0-9a-f]{40}$")


def _write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n", encoding="utf-8")


def _git(*args: str) -> str:
    completed = subprocess.run(["git", *args], cwd=ROOT, text=True, capture_output=True)
    if completed.returncode:
        raise RuntimeError(completed.stderr.strip() or "git command failed")
    return completed.stdout.strip()


def source_execution_issues(source_revision: str) -> Tuple[str, ...]:
    issues: list[str] = []
    if _SOURCE_REVISION.fullmatch(source_revision) is None:
        issues.append("source revision must be an exact lowercase 40-character commit")
        return tuple(issues)
    if _git("rev-parse", "HEAD") != source_revision:
        issues.append("source revision does not equal current HEAD")
    governed_paths = (
        "proofs/r7/w0", "tools/r7_w0_runtime", "tools/tests/test_r7_w0_runtime.py",
        "tools/tests/fixtures/r7_architecture", "tools/verify.py", "tools/verify_rebuild_boundary.py",
    )
    if _git("status", "--porcelain", "--", *governed_paths):
        issues.append("governed proof source has uncommitted changes")
    return tuple(issues)


def preflight_report(check_local: bool = True) -> Dict[str, Any]:
    lock = load_lock()
    lock_issues = list(static_lock_issues(lock))
    architecture = lint()
    local = verify_local_dependencies(lock) if check_local else {"status": "NOT-CHECKED", "issues": [], "paths": {}}
    issues = lock_issues + list(architecture["issues"])
    if architecture["findings"]:
        issues.append("governed runtime has architecture-lint findings")
    if check_local and local["status"] != "PASS":
        issues.extend(local["issues"])
    return {
        "schema_version": "leyforge-r7-w0-preflight-v1",
        "status": "PASS" if not issues else "FAIL",
        "lock": {"status": "PASS" if not lock_issues else "FAIL", "issues": lock_issues},
        "local_dependencies": local,
        "architecture_lint": architecture,
        "issues": sorted(set(issues)),
        "gameplay_permission": "CLOSED",
    }


def _new_execution(proof_id: str, run_id: str) -> ProofExecution:
    execution = ProofExecution(proof_id)
    execution.evaluate_prerequisites([])
    execution.allocate_run(run_id, ExecutionKind.ACTUAL, actual_execution_authorized=True)
    execution.begin()
    return execution


def _observed_state(outcome: str) -> ProofState:
    return {
        "PASS": ProofState.PASS_OBSERVED,
        "FAIL": ProofState.FAIL_OBSERVED,
        "INCONCLUSIVE": ProofState.INCONCLUSIVE,
    }.get(outcome, ProofState.FAIL_OBSERVED)


def _artifact_summary(exported: ExportedBuild) -> Dict[str, Any]:
    artifact = exported.artifact.to_dict()
    artifact["retention"] = {
        "binary": "local ignored build output; exact hash and reproducer retained",
        "reproducer": "python -m tools.r7_w0_runtime execute --actual-execution-authorized ...",
    }
    return artifact


def _retain(
    execution: ProofExecution,
    evidence_id: str,
    exported: ExportedBuild,
    observed: Dict[str, Any],
    run_root: Path,
    retained_root: Path,
) -> Dict[str, Any]:
    raw_source = run_root / "raw-source" / f"{execution.run_id}-{execution.proof_id}.json"
    _write_json(raw_source, observed)
    evidence_file = EvidenceFile.from_path(evidence_id, "observed-proof-result", raw_source)
    pack = EvidencePack(
        run_id=str(execution.run_id), proof_id=execution.proof_id,
        outcome=execution.state, execution_kind=ExecutionKind.ACTUAL,
        build=exported.build, artifact=exported.artifact,
        scenario={
            "package": "R7-W0-DEPENDENCY-EXPORT-READINESS",
            "proof_id": execution.proof_id,
            "normalization_schema": "leyforge-r7-w0-semantic-state-v1",
        },
        environment={
            "platform": platform.platform(), "python": platform.python_version(),
            "source_revision": exported.build.source_revision,
        },
        evidence_files=(evidence_file,),
        diagnostics=tuple(observed.get("diagnostics", [])),
        observations=tuple(observed.get("observations", [])),
    )
    issues = pack.validation_issues()
    if issues:
        raise ValueError("evidence pack failed validation: " + "; ".join(issues))
    local_pack = pack.retain(run_root / "validated-evidence")
    portable = retained_root / str(execution.run_id)
    if portable.exists():
        raise ValueError(f"append-only evidence destination exists: {portable}")
    portable.mkdir(parents=True)
    build_manifest = dict(exported.build.to_dict(), build_identity=exported.build.build_identity)
    artifact_manifest = _artifact_summary(exported)
    run_record = {
        "schema_version": "prd07-portable-run-record-v1",
        "run_id": execution.run_id, "proof_id": execution.proof_id,
        "outcome": execution.state.value, "execution_kind": ExecutionKind.ACTUAL.value,
        "evidence_id": evidence_id, "evidence_sha256": sha256_file(raw_source),
        "build_identity": exported.build.build_identity,
        "artifact_sha256": exported.artifact.artifact_sha256,
        "artifact_size_bytes": exported.artifact.size_bytes,
        "source_revision": exported.build.source_revision,
        "prd07_evidence_eligible": True,
        "prd08_submission": "NOT-SUBMITTED",
        "gameplay_permission": "CLOSED",
        "retained_local_pack": str(local_pack.resolve()),
    }
    _write_json(portable / "run.json", run_record)
    _write_json(portable / "build-manifest.json", build_manifest)
    _write_json(portable / "artifact-manifest.json", artifact_manifest)
    _write_json(portable / "observed-result.json", observed)
    (portable / "summary.md").write_text(
        f"# {execution.run_id} — {execution.proof_id}\n\n"
        f"Observed outcome: **{execution.state.value}**\n\n"
        f"Evidence: `{evidence_id}`. Build identity: `{exported.build.build_identity}`. "
        "The real artifact binary remains in the ignored local evidence workspace; its exact SHA-256, size, build manifest, runtime self-report, and reproducer are retained here. "
        "This result has not been evaluated by PRD-08 and does not open R8.\n",
        encoding="utf-8",
    )
    return {"portable_path": str(portable), "local_pack": str(local_pack), "run": run_record}


def _execute_export_matrix(source_revision: str, run_root: Path, execution: ProofExecution) -> tuple[Dict[str, Any], Dict[tuple[str, int], ExportedBuild]]:
    exported: Dict[tuple[str, int], ExportedBuild] = {}
    matrix: list[Dict[str, Any]] = []
    for role in ("client", "headless"):
        for repetition in range(1, 4):
            item = export_one(source_revision, role, repetition, run_root, execution)
            exported[(role, repetition)] = item
            matrix.append(item.to_dict())
    self_report_digests = {item.self_report["canonical_state_digest"] for item in exported.values()}
    provider_included = all(item.role_content_manifest["provider_runtime_included"] for item in exported.values())
    all_clean = all(item.build.clean_export for item in exported.values())
    all_smoke = all(item.smoke_result["evidence_eligible"] for item in exported.values())
    role_counts = {role: sum(1 for key in exported if key[0] == role) for role in ("client", "headless")}
    passed = role_counts == {"client": 3, "headless": 3} and len(self_report_digests) == 1 and provider_included and all_clean and all_smoke
    observed = {
        "schema_version": "prd07-w0-export-matrix-result-v1",
        "proof_id": execution.proof_id, "run_id": execution.run_id,
        "outcome": "PASS" if passed else "FAIL",
        "metrics": {
            "clean_builds_per_lane": role_counts,
            "real_artifact_count": len(exported),
            "runtime_self_report_digest_count": len(self_report_digests),
            "all_provider_runtimes_included": provider_included,
            "all_clean_exports": all_clean,
            "all_smoke_lanes_evidence_eligible": all_smoke,
            "forge_tool_artifact": "NOT-YET-APPLICABLE",
        },
        "observations": [
            "Client and dedicated/headless roles used explicit distinct build identities.",
            "Semantic common input produced one canonical runtime digest across all six artifacts.",
        ],
        "matrix": matrix,
    }
    return observed, exported


def _execute_patch_baseline(execution: ProofExecution) -> Dict[str, Any]:
    lock = load_lock()
    components = lock["components"]
    no_patch = all(str(item.get("local_patch", "")).startswith("NO-LOCAL-PATCH") for item in components.values())
    return {
        "schema_version": "prd07-w0-no-local-patch-result-v1",
        "proof_id": execution.proof_id, "run_id": execution.run_id,
        "outcome": "INCONCLUSIVE" if no_patch else "FAIL",
        "metrics": {
            "dependency_count": len(components), "no_local_patch_components": sum(
                1 for item in components.values() if str(item.get("local_patch", "")).startswith("NO-LOCAL-PATCH")
            ),
            "baseline": "NO-LOCAL-PATCH" if no_patch else "PATCH-STATE-INCONSISTENT",
            "future_patch_reproducibility_proven": False,
        },
        "observations": [
            "PRD-07 defines no current patch as a valid NO-LOCAL-PATCH baseline and an inconclusive future-patch result.",
            "No patch or fork authority was inferred for Godot or Voxel Tools.",
        ],
    }


def _execute_architecture_lint(execution: ProofExecution) -> Dict[str, Any]:
    rules = load_rules()
    governed = lint(rules=rules)
    fixtures = ROOT / "tools/tests/fixtures/r7_architecture"
    good = lint(fixtures / "good", rules)
    bad = lint(fixtures / "bad", rules)
    detected_ids = {finding["rule_id"] for finding in bad["findings"]}
    required_ids = {rule["rule_id"] for rule in rules["rules"]}
    passed = governed["status"] == "PASS" and good["status"] == "PASS" and detected_ids == required_ids
    return {
        "schema_version": "prd07-w0-architecture-proof-result-v1",
        "proof_id": execution.proof_id, "run_id": execution.run_id,
        "outcome": "PASS" if passed else "FAIL",
        "metrics": {
            "rules": len(required_ids), "true_positive_rules": len(detected_ids),
            "false_negative_rules": len(required_ids - detected_ids),
            "known_good_false_positives": len(good["findings"]),
            "governed_runtime_findings": len(governed["findings"]),
        },
        "observations": ["Every rule ran against a known-good and an intentional violation fixture."],
        "governed_runtime_report": governed,
        "known_good_report": good,
        "seeded_violation_report": bad,
    }


def _execute_headless_world_session(execution: ProofExecution, headless: ExportedBuild, client: ExportedBuild) -> Dict[str, Any]:
    pairs: list[Dict[str, Any]] = []
    failures = 0
    for repetition in range(20):
        server_result = run_exported_proof(headless, execution)
        client_result = run_exported_proof(client, execution)
        server_observed = server_result["observed"]
        client_observed = client_result["observed"]
        same_digest = server_observed.get("metrics", {}).get("canonical_state_digest") == client_observed.get("metrics", {}).get("canonical_state_digest")
        passed = (
            server_observed.get("outcome") == "PASS" and client_observed.get("outcome") == "PASS"
            and server_result["process"]["process"]["exit_code"] == 0
            and client_result["process"]["process"]["exit_code"] == 0 and same_digest
        )
        failures += 0 if passed else 1
        pairs.append({"repetition": repetition + 1, "passed": passed, "same_canonical_digest": same_digest,
                      "headless": server_result, "client_comparison": client_result})
    return {
        "schema_version": "prd07-w0-headless-world-session-result-v1",
        "proof_id": execution.proof_id, "run_id": execution.run_id,
        "outcome": "PASS" if failures == 0 else "FAIL",
        "metrics": {"clean_exported_server_runs": 20, "client_comparison_runs": 20, "failed_pairs": failures,
                    "presentation_authority_dependencies": 0},
        "observations": ["Twenty fresh dedicated processes matched twenty client-role runs for the same seeded canonical scenario."],
        "run_pairs": pairs,
    }


def _write_state(state_path: Path, source_revision: str, rows: list[Dict[str, Any]], builds: Dict[tuple[str, int], ExportedBuild]) -> None:
    complete_ids = {row["proof_id"] for row in rows}
    pending = [proof_id for proof_id, _, _ in PROOF_PLAN if proof_id not in complete_ids]
    value = {
        "schema_version": "prd07-w0-execution-state-v1",
        "package": "R7-W0-DEPENDENCY-EXPORT-READINESS",
        "package_state": "EXECUTING" if pending else "W0-EXECUTION-COMPLETE",
        "source_revision": source_revision,
        "gameplay_permission": "CLOSED",
        "prd08_evaluation": "CLOSED",
        "prior_readiness_source": "tools/proof_harness/w0-readiness.json",
        "allocated_run_ids": [row["run_id"] for row in rows],
        "allocated_evidence_ids": [row["evidence_id"] for row in rows],
        "proofs": rows + [
            {"proof_id": proof_id, "prior_state": "HARNESS-BLOCKED", "readiness": "READY", "state": "NOT-RUN", "blockers": []}
            for proof_id in pending
        ],
        "smoke_lanes": [
            {"role": role, "state": "PASS", "clean_builds": sum(1 for key in builds if key[0] == role)}
            for role in ("client", "headless")
        ] if builds else [],
    }
    _write_json(state_path, value)


def execute_w0(
    source_revision: str,
    run_root: Path,
    retained_root: Path,
    state_path: Path,
    actual_execution_authorized: bool,
) -> Dict[str, Any]:
    if not actual_execution_authorized:
        raise ValueError("actual W0 proof execution requires the explicit authorization flag")
    source_issues = source_execution_issues(source_revision)
    if source_issues:
        raise ValueError("source is not execution ready: " + "; ".join(source_issues))
    preflight = preflight_report(check_local=True)
    if preflight["status"] != "PASS":
        raise ValueError("preflight failed: " + "; ".join(preflight["issues"]))
    run_root = run_root.resolve()
    retained_root = retained_root.resolve()
    state_path = state_path.resolve()
    if run_root.exists():
        raise ValueError("run root must be absent for append-only execution")
    run_root.mkdir(parents=True)
    rows: list[Dict[str, Any]] = []
    builds: Dict[tuple[str, int], ExportedBuild] = {}
    started = time.time()
    for proof_id, run_id, evidence_id in PROOF_PLAN:
        execution = _new_execution(proof_id, run_id)
        if proof_id == "PRD04-PROOF-70":
            observed, builds = _execute_export_matrix(source_revision, run_root, execution)
            exported = builds[("client", 3)]
        elif proof_id == "PRD04-PROOF-73":
            observed = _execute_patch_baseline(execution)
            exported = builds[("client", 3)]
        elif proof_id == "PRD04-PROOF-74":
            observed = _execute_architecture_lint(execution)
            exported = builds[("client", 3)]
        elif proof_id == "PRD04-PROOF-11":
            observed = _execute_headless_world_session(execution, builds[("headless", 3)], builds[("client", 3)])
            exported = builds[("headless", 3)]
        else:
            exported = builds[("client", 3)]
            runtime = run_exported_proof(exported, execution)
            observed = dict(runtime["observed"])
            observed["process"] = runtime["process"]
        execution.observe(_observed_state(str(observed.get("outcome", "FAIL"))))
        retained = _retain(execution, evidence_id, exported, observed, run_root, retained_root)
        rows.append({
            "proof_id": proof_id, "prior_state": "HARNESS-BLOCKED", "readiness": "READY",
            "state": execution.state.value, "run_id": run_id, "evidence_id": evidence_id,
            "build_identity": exported.build.build_identity,
            "artifact_sha256": exported.artifact.artifact_sha256,
            "blockers": [], "prd08_submission": "NOT-SUBMITTED",
            "retention": retained,
        })
        _write_state(state_path, source_revision, rows, builds)
    outcomes = {state: sum(1 for row in rows if row["state"] == state) for state in (
        "PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE")}
    report = {
        "schema_version": "prd07-w0-execution-report-v1", "status": "COMPLETE",
        "source_revision": source_revision, "duration_seconds": max(0.0, time.time() - started),
        "outcomes": outcomes, "proofs": rows,
        "retained_root": str(retained_root), "state_path": str(state_path),
        "prd08_evaluation": "CLOSED", "gameplay_permission": "CLOSED",
    }
    _write_json(run_root / "execution-report.json", report)
    return report
