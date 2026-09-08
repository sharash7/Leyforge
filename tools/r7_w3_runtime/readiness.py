"""Individual W3 definition, fixture, runner, and allocation-safety readiness."""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Dict, Tuple

from proofs.r7.w3.runtime.runner import PROOF_DEFINITIONS, PROOF_IDS, PRD07_SOURCE, RUNNERS

from .dependencies import ROOT, load_lock, reference_issues, verify_local_dependencies
from .execution_plan import ExecutionRegistryError, inspect_execution_registry, preview_execution_plan


READINESS_PATH = ROOT / "docs/rebuild/r7/w3-readiness-corrected.json"
SUPERSEDED_READINESS_PATH = ROOT / "docs/rebuild/r7/w3-readiness.json"
W0_STATE = ROOT / "docs/rebuild/r7/w0-execution-state.json"
W1_STATE = ROOT / "docs/rebuild/r7/w1-execution-state.json"
W2_STATE = ROOT / "docs/rebuild/r7/w2-execution-state.json"
_COMMIT = re.compile(r"^[0-9a-f]{40}$")


FIXTURE_PATHS = {
    "FIXTURE-02": (
        ROOT / "proofs/r7/w1/runtime/model.py",
        ROOT / "proofs/r7/w1/runtime/runner.py",
    ),
    "FIXTURE-05": (
        ROOT / "proofs/r7/w2/runtime/model.py",
        ROOT / "proofs/r7/w2/runtime/runner.py",
    ),
    "FIXTURE-06": (
        ROOT / "proofs/r7/w3/runtime/model.py",
        ROOT / "proofs/r7/w3/runtime/runner.py",
        ROOT / "proofs/r7/w3/server_probe/project.godot",
        ROOT / "proofs/r7/w3/server_probe/src/main.gd",
    ),
    "FIXTURE-09": (
        ROOT / "proofs/r7/w0/dependencies.lock.json",
        ROOT / "tools/r7_w3_runtime/builds.py",
    ),
}


def _source_identity(paths: Tuple[Path, ...]) -> str:
    digest = hashlib.sha256()
    for path in sorted(paths):
        digest.update(path.relative_to(ROOT).as_posix().encode("utf-8"))
        digest.update(b"\0")
        digest.update(path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n"))
        digest.update(b"\0")
    return digest.hexdigest()


def _governed_source_paths(required: Tuple[Path, ...]) -> Tuple[Path, ...]:
    paths = set(path for fixture_paths in FIXTURE_PATHS.values() for path in fixture_paths)
    paths.update(required)
    for base in (ROOT / "proofs/r7/w3", ROOT / "tools/r7_w3_runtime"):
        if base.is_dir():
            paths.update(
                path for path in base.rglob("*")
                if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() != ".pyc"
            )
    return tuple(sorted(paths))


def _commit_source_issues(implementation_commit: str, paths: Tuple[Path, ...]) -> list[str]:
    if _COMMIT.fullmatch(implementation_commit) is None:
        return ["implementation commit must be an exact lowercase forty-character commit"]
    exists = subprocess.run(
        ["git", "cat-file", "-e", implementation_commit + "^{commit}"],
        cwd=ROOT,
        text=True,
        capture_output=True,
    )
    if exists.returncode:
        return ["implementation commit does not resolve to a repository commit"]
    relatives = [path.relative_to(ROOT).as_posix() for path in paths]
    worktree = subprocess.run(
        ["git", "hash-object", "--stdin-paths"],
        cwd=ROOT,
        input="\n".join(relatives) + "\n",
        text=True,
        capture_output=True,
    )
    if worktree.returncode or len(worktree.stdout.splitlines()) != len(relatives):
        return ["current governed W3 source could not be hashed exactly"]
    mismatches = []
    for relative, worktree_blob in zip(relatives, worktree.stdout.splitlines()):
        committed = subprocess.run(
            ["git", "rev-parse", f"{implementation_commit}:{relative}"],
            cwd=ROOT,
            text=True,
            capture_output=True,
        )
        if committed.returncode or committed.stdout.strip() != worktree_blob:
            mismatches.append(relative)
    if mismatches:
        return ["implementation commit does not contain current governed W3 source: " + ", ".join(mismatches)]
    return []


def _definition_present(proof_id: str, source_text: str) -> bool:
    definition = PROOF_DEFINITIONS.get(proof_id)
    return bool(
        definition
        and proof_id in source_text
        and definition.question in source_text
        and definition.pass_criteria in source_text
        and definition.fail_criteria in source_text
        and definition.inconclusive_conditions in source_text
        and all(risk in source_text for risk in definition.risk_consumers)
        and all(evidence in source_text for evidence in definition.evidence)
    )


def _fixture_issues(fixtures: Tuple[str, ...]) -> list[str]:
    issues = []
    for fixture in fixtures:
        paths = FIXTURE_PATHS.get(fixture)
        if not paths:
            issues.append(f"no readiness route is declared for {fixture}")
            continue
        for path in paths:
            if not path.is_file():
                issues.append(f"{fixture} capability path is missing: {path.relative_to(ROOT).as_posix()}")
    return issues


def _static_context() -> Dict[str, Any]:
    issues = list(reference_issues())
    required = (
        ROOT / PRD07_SOURCE,
        ROOT / "tools/r7_w3_runtime/execution.py",
        ROOT / "tools/r7_w3_runtime/execution_plan.py",
        ROOT / "tools/tests/test_r7_w3_runtime.py",
        ROOT / "tools/verify.py",
        ROOT / "tools/verify_rebuild_boundary.py",
    )
    for path in required:
        if not path.is_file():
            issues.append(f"required W3 readiness source is missing: {path.relative_to(ROOT).as_posix()}")
    if (ROOT / "project.godot").exists():
        issues.append("W3 cannot create a root production Godot project")
    if tuple(PROOF_IDS) != tuple(PROOF_DEFINITIONS) or set(PROOF_IDS) != set(RUNNERS):
        issues.append("W3 definitions, stable proof IDs and runner mappings differ")
    prior_counts = ((W0_STATE, 13), (W1_STATE, 17), (W2_STATE, 20))
    for path, expected in prior_counts:
        if not path.is_file():
            issues.append(f"certified prior execution state is missing: {path.relative_to(ROOT).as_posix()}")
            continue
        try:
            state = json.loads(path.read_text(encoding="utf-8-sig"))
        except (OSError, UnicodeError, json.JSONDecodeError) as exc:
            issues.append(f"cannot read certified prior execution state {path.relative_to(ROOT).as_posix()}: {exc}")
            continue
        if len(state.get("allocated_run_ids", [])) != expected or len(state.get("proofs", [])) != expected:
            issues.append(f"prior execution state count differs: {path.relative_to(ROOT).as_posix()}")
        if any(row.get("state") not in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE", "INVALIDATED", "RERUN-REQUIRED"} for row in state.get("proofs", [])):
            issues.append(f"prior execution state contains a non-observed row: {path.relative_to(ROOT).as_posix()}")
    try:
        registry = inspect_execution_registry(ROOT)
        plan = preview_execution_plan(ROOT)
    except ExecutionRegistryError as exc:
        issues.append(str(exc))
        registry = None
        plan = ()
    source_text = (ROOT / PRD07_SOURCE).read_text(encoding="utf-8-sig") if (ROOT / PRD07_SOURCE).is_file() else ""
    governed_sources = _governed_source_paths(required)
    return {
        "issues": sorted(set(issues)),
        "registry": registry,
        "plan": plan,
        "source_text": source_text,
        "governed_sources": governed_sources,
        "source_identity": _source_identity(tuple(dict.fromkeys(governed_sources))) if all(path.is_file() for path in governed_sources) else "",
    }


def readiness_report(implementation_commit: str, check_local: bool) -> Dict[str, Any]:
    context = _static_context()
    technical_common_issues = list(context["issues"])
    source_commit_issues = _commit_source_issues(implementation_commit, context["governed_sources"])
    local = verify_local_dependencies(load_lock()) if check_local else {"status": "NOT-CHECKED", "issues": [], "paths": {}}
    if check_local and local["status"] != "PASS":
        technical_common_issues.extend(local["issues"])
    plan_by_proof = {row.proof_id: row for row in context["plan"]}
    registry = context["registry"]
    rows = []
    for proof_id in PROOF_IDS:
        definition = PROOF_DEFINITIONS[proof_id]
        blockers = list(technical_common_issues)
        authoritative_definition_present = _definition_present(proof_id, context["source_text"])
        if not authoritative_definition_present:
            blockers.append(f"authoritative W3 definition does not match PRD-07 for {proof_id}")
        fixture_problems = _fixture_issues(definition.fixtures)
        blockers.extend(fixture_problems)
        runner_mapping_present = proof_id in RUNNERS and callable(RUNNERS[proof_id])
        if not runner_mapping_present:
            blockers.append(f"W3 runner mapping is missing for {proof_id}")
        planned = plan_by_proof.get(proof_id)
        execution_plan_mapping_valid = planned is not None and planned.allocation_state == "PREVIEW-NOT-ALLOCATED"
        if not execution_plan_mapping_valid:
            blockers.append(f"future W3 execution-plan mapping is invalid for {proof_id}")
        future_safe = bool(
            registry
            and planned
            and planned.run_id not in registry.run_ids
            and planned.evidence_id not in registry.evidence_ids
        )
        if not future_safe:
            blockers.append(f"future RUN/EVID allocation is not proven safe for {proof_id}")
        blockers = sorted(set(blockers))
        rows.append({
            "proof_id": proof_id,
            "title": definition.title,
            "area": definition.area,
            "authoritative_sources": list(definition.authority),
            "risk_consumers": list(definition.risk_consumers),
            "fixtures": list(definition.fixtures),
            "authoritative_definition_present": authoritative_definition_present,
            "fixture_present": not fixture_problems,
            "runner_mapping_present": runner_mapping_present,
            "execution_plan_mapping_valid": execution_plan_mapping_valid,
            "future_evidence_allocation_safe": future_safe,
            "future_identity_preview": planned.to_dict() if planned else None,
            "prior_state": "HARNESS-BLOCKED",
            "state": "READY" if not blockers else "HARNESS-BLOCKED",
            "readiness_classification": "READY — MINIMUM FIXTURE ADDED" if not blockers else "BLOCKED",
            "blockers": blockers,
        })
    technical_issues = sorted({issue for row in rows for issue in row["blockers"]})
    issues = sorted(set(technical_issues + source_commit_issues))
    counts = {
        "READY": sum(row["state"] == "READY" for row in rows),
        "BLOCKED": sum(row["state"] != "READY" for row in rows),
        "NOT_APPLICABLE": 0,
    }
    registry_summary = None
    if registry:
        registry_summary = {
            "max_run_number": registry.max_run_number,
            "max_evidence_number": registry.max_evidence_number,
            "issued_run_count": len(registry.run_ids),
            "issued_evidence_count": len(registry.evidence_ids),
            "state_paths": list(registry.state_paths),
            "retained_pack_count": len(registry.evidence_paths),
            "next_future_sequence": registry.max_run_number + 1,
        }
    return {
        "schema_version": "prd07-w3-readiness-v2",
        "package": "R7-W3-TECHNICAL-ENVIRONMENT-READINESS",
        "package_state": "READY" if not issues else "READY-PENDING-SOURCE-COMMIT" if not technical_issues else "HARNESS-BLOCKED",
        "implementation_commit": implementation_commit,
        "implementation_commit_source_match": not source_commit_issues,
        "source_tree_identity": context["source_identity"],
        "proofs": rows,
        "readiness_counts": counts,
        "certification_blockers": source_commit_issues,
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "registry": registry_summary,
        "dependency_check": local,
        "issues": issues,
        "status": "PASS" if not issues else "FAIL",
        "prior_readiness_disposition": {
            "path": SUPERSEDED_READINESS_PATH.relative_to(ROOT).as_posix(),
            "state": "SUPERSEDED-INVALID",
            "reason": "It certified READY from file presence while W2 handlers and issued W2 identities remained mapped beneath W3 labels.",
        },
        "prd08_evaluation": "CLOSED",
        "gameplay_permission": "CLOSED",
        "actual_w3_execution": "NOT-AUTHORIZED-BY-THIS-READINESS-TASK",
        "execution_gate": "OPEN-FOR-FUTURE-AUTHORIZED-W3" if not issues else "CLOSED",
        "w4_fcc13e_revalidation": "REQUIRED",
    }


def write_readiness(implementation_commit: str, check_local: bool) -> Dict[str, Any]:
    value = readiness_report(implementation_commit, check_local)
    READINESS_PATH.parent.mkdir(parents=True, exist_ok=True)
    READINESS_PATH.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=False) + "\n", encoding="utf-8")
    return value
