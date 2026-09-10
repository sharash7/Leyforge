"""Fail-closed W4 readiness/admission determination for all 15 canonical proofs."""

from __future__ import annotations

import hashlib
import json
import platform
import re
import subprocess
from collections import Counter
from pathlib import Path
from typing import Any, Dict, List, Mapping, Tuple

from .authority import ROOT, W4_PROOF_IDS, authority_issues, proof_contracts, source_identities
from .dependencies import load_reference, local_dependency_report, reference_issues
from .execution_plan import allocation_issues, future_rule_issues, preview_execution_plan, registry_snapshot
from .fixtures import FIXTURE_VALIDATION_PATH, fixture_issues, fixture_source_identity


READINESS_PATH = ROOT / "docs/rebuild/r7/w4-readiness.json"
W3_RECEIPT_PATH = ROOT / "docs/rebuild/r7/w3-execution-completion-receipt.json"
W3_BOUNDARY_PATH = ROOT / "docs/rebuild/r7/w3-execution-boundary-execution-complete.json"
W3_STATE_PATH = ROOT / "docs/rebuild/r7/w3-execution-state.json"
_COMMIT = re.compile(r"^[0-9a-f]{40}$")

ROUTES = {
    "PRD04-PROOF-49": ("fixture07-source-validate-bake-manifest-equivalence", ["forge-ci"], False),
    "PRD04-PROOF-50": ("fixture07-art09-handoff-to-fixture08-runtime-context", ["forge-ci", "client"], True),
    "PRD04-PROOF-51": ("fixture07-common-ai-human-validator-parity", ["forge-ci"], True),
    "PRD04-PROOF-52": ("fixture07-generated-material-form-state-family", ["forge-ci", "client"], False),
    "PRD04-PROOF-53": ("fixture08-renderer-profile-semantic-task-matrix", ["client"], True),
    "PRD04-PROOF-54": ("fixture07-logical-pack-client-server-role-split", ["client", "dedicated-server"], False),
    "PRD04-PROOF-55": ("fixture07-hostile-capability-smuggling-corpus", ["forge-ci"], False),
    "PRD04-PROOF-56": ("fixture07-declarative-resource-budget-corpus", ["forge-ci", "client", "dedicated-server"], False),
    "PRD04-PROOF-57": ("w2-missing-pack-recovery-plus-fixture07-full-fcc13e-corpus", ["forge-ci", "dedicated-server"], False),
    "PRD04-PROOF-58": ("w2-pack-upgrade-migration-plus-fixture07-full-fcc13e-corpus", ["forge-ci", "dedicated-server"], False),
    "PRD04-PROOF-59": ("fixture08-settings-scope-isolation", ["client", "dedicated-server"], False),
    "PRD04-PROOF-60": ("fixture08-invalid-graphics-safe-recovery", ["client"], False),
    "PRD04-PROOF-61": ("fixture08-accessibility-semantic-task-torture", ["client"], True),
    "PRD04-PROOF-62": ("fixture07-clean-forge-ci-rebuild-validation", ["forge-ci"], False),
    "PRD04-PROOF-71": ("fixture08-renderer-hardware-semantic-task-lane", ["client"], True),
}


def governed_source_paths() -> Tuple[Path, ...]:
    paths = set()
    for base in (ROOT / "proofs/r7/w4", ROOT / "tools/r7_w4_runtime"):
        if base.is_dir():
            paths.update(path for path in base.rglob("*") if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() != ".pyc")
    for relative in ("tools/tests/test_r7_w4_runtime.py", "tools/r7_w4_audit.py", "tools/r7_w3_reconciliation.py", "tools/verify.py", "tools/verify_rebuild_boundary.py"):
        path = ROOT / relative
        if path.is_file():
            paths.add(path)
    return tuple(sorted(paths))


def _commit_source_issues(implementation_commit: str) -> List[str]:
    if _COMMIT.fullmatch(implementation_commit) is None:
        return ["implementation commit must be an exact lowercase forty-character commit"]
    exists = subprocess.run(["git", "cat-file", "-e", implementation_commit + "^{commit}"], cwd=ROOT, text=True, capture_output=True)
    if exists.returncode:
        return ["implementation commit does not resolve"]
    relatives = [path.relative_to(ROOT).as_posix() for path in governed_source_paths()]
    if not relatives:
        return ["governed W4 source set is empty"]
    worktree = subprocess.run(["git", "hash-object", "--stdin-paths"], cwd=ROOT, input="\n".join(relatives) + "\n", text=True, capture_output=True)
    if worktree.returncode or len(worktree.stdout.splitlines()) != len(relatives):
        return ["current governed W4 source could not be hashed"]
    mismatches = []
    for relative, blob in zip(relatives, worktree.stdout.splitlines()):
        committed = subprocess.run(["git", "rev-parse", implementation_commit + ":" + relative], cwd=ROOT, text=True, capture_output=True)
        if committed.returncode or committed.stdout.strip() != blob:
            mismatches.append(relative)
    return ["implementation commit does not contain current governed W4 source: " + ", ".join(mismatches)] if mismatches else []


def _w3_terminal_issues() -> Tuple[str, ...]:
    issues = []
    for path in (W3_STATE_PATH, W3_BOUNDARY_PATH, W3_RECEIPT_PATH):
        if not path.is_file():
            issues.append("missing W3 terminal artifact: " + path.relative_to(ROOT).as_posix())
    if issues:
        return tuple(sorted(set(issues)))
    state = json.loads(W3_STATE_PATH.read_text(encoding="utf-8-sig"))
    receipt = json.loads(W3_RECEIPT_PATH.read_text(encoding="utf-8-sig"))
    boundary = json.loads(W3_BOUNDARY_PATH.read_text(encoding="utf-8-sig"))
    if state.get("package_state") != "W3-EXECUTION-COMPLETE":
        issues.append("W3 execution state is not terminal complete")
    if receipt.get("status") != "COMPLETE-CERTIFIED" or receipt.get("w3_state") != "COMPLETE":
        issues.append("W3 completion receipt is not certified complete")
    if boundary.get("execution_gate") != "CLOSED-W3-EXECUTION-COMPLETE" or boundary.get("w3_state") != "COMPLETE":
        issues.append("W3 terminal boundary is not closed complete")
    expected_runs = ["PRD07-RUN-0058"] + ["PRD07-RUN-{0:04d}".format(number) for number in range(59, 66)]
    expected_evidence = ["PRD07-EVID-0058"] + ["PRD07-EVID-{0:04d}".format(number) for number in range(59, 66)]
    if state.get("allocated_run_ids") != expected_runs or state.get("allocated_evidence_ids") != expected_evidence:
        issues.append("W3 terminal issued journal differs from 0058-0065")
    result = subprocess.run(["python", "tools/r7_w3_reconciliation.py", "verify", "--format", "json"], cwd=ROOT, text=True, capture_output=True)
    if result.returncode:
        issues.append("independent W3 terminal reconciliation failed")
    return tuple(sorted(set(issues)))


def _fixture_receipt_issues(implementation_commit: str) -> Tuple[str, ...]:
    if not FIXTURE_VALIDATION_PATH.is_file():
        return ("W4 fixture readiness validation receipt is missing",)
    value = json.loads(FIXTURE_VALIDATION_PATH.read_text(encoding="utf-8-sig"))
    issues = []
    if value.get("schema_version") != "prd07-w4-fixture-readiness-validation-v1" or value.get("status") != "PASS":
        issues.append("W4 fixture readiness validation did not pass")
    if value.get("implementation_commit") != implementation_commit:
        issues.append("W4 fixture readiness validation names a different implementation commit")
    dynamic = value.get("dynamic_readiness_self_report", {})
    if dynamic.get("performed") is not True or dynamic.get("status") != "PASS":
        issues.append("FIXTURE-08 dynamic proof-free readiness self-report did not pass")
    if value.get("before_execution_authority") != value.get("after_execution_authority"):
        issues.append("W4 fixture readiness validation changed execution authority")
    if value.get("proof_execution") != "NOT-STARTED" or value.get("allocated_run_ids") != [] or value.get("allocated_evidence_ids") != []:
        issues.append("W4 fixture readiness validation executed or allocated")
    if value.get("fcc13e", {}).get("coverage") != "312/312":
        issues.append("W4 fixture readiness validation lacks full FCC-13E coverage")
    return tuple(sorted(set(issues)))


def _proof_requirement(contract: Mapping[str, Any]) -> Dict[str, Any]:
    proof_id = str(contract["proof_id"])
    route, roles, human = ROUTES[proof_id]
    source_authorities = ["PRD-04", "PRD-05", "PRD-06", "PRD-07"]
    if proof_id in {"PRD04-PROOF-49", "PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-52", "PRD04-PROOF-62"}:
        source_authorities.extend(["ART-09", "ART-10"])
    if proof_id in {"PRD04-PROOF-53", "PRD04-PROOF-59", "PRD04-PROOF-60", "PRD04-PROOF-61", "PRD04-PROOF-71"}:
        source_authorities.extend(["ART-10", "MAP-00"])
    if proof_id in {"PRD04-PROOF-57", "PRD04-PROOF-58"}:
        source_authorities.extend(["FCC-13E-CSV", "FCC-13E-AUDIT"])
    environment = ["exact-published-source-revision", "isolated-APPDATA-and-LOCALAPPDATA", "clean-proof-output-root", "no-shared-save-or-cache-state"]
    if "client" in roles:
        environment.extend(["exact-renderer-profile", "exact-resolution-and-settings", "exact-GPU-device-and-driver-captured-at-execution"])
    if "dedicated-server" in roles:
        environment.append("headless-role-artifact-with-presentation-assets-absent")
    if "forge-ci" in roles:
        environment.append("clean-CI-worker-or-controlled-second-environment")
    return {
        "tooling_route": route,
        "tooling_contract": "future separately authorized executor must consume this canonical observation contract and standard evidence schema; readiness exposes no execute command",
        "runtime_roles": roles,
        "dependency_identity": ["godot_build_driver", "godot_export_template", "voxel_tools", "NO-LOCAL-PATCH"],
        "fixture_identities": list(contract["principal_fixtures"]),
        "source_authorities": sorted(set(source_authorities)),
        "environment_requirements": environment,
        "human_judgement_required": human,
        "human_judgement_fields": ["observer_ids", "task_scores", "capture_refs", "disagreements", "adjudication"] if human else [],
        "fcc13e_rows_required": 312 if proof_id in {"PRD04-PROOF-57", "PRD04-PROOF-58"} else 0,
        "observation_contract": {
            "question": contract["question"],
            "measurements": contract["measurement"],
            "required_repetition": contract["required_repetition"],
            "required_evidence_artifacts": contract["required_evidence_artifacts"],
            "pass": contract["success_criterion"],
            "fail": contract["failure_criterion"],
            "inconclusive": contract["inconclusive_conditions"],
            "no_result_by_assumption": True,
        },
    }


def readiness_report(implementation_commit: str, check_local: bool = False) -> Dict[str, Any]:
    contracts = proof_contracts()
    global_issues = []
    global_issues.extend(authority_issues(contracts))
    global_issues.extend(reference_issues())
    global_issues.extend(fixture_issues())
    global_issues.extend(future_rule_issues())
    global_issues.extend(allocation_issues())
    global_issues.extend(_w3_terminal_issues())
    global_issues.extend(_commit_source_issues(implementation_commit))
    global_issues.extend(_fixture_receipt_issues(implementation_commit))
    local = local_dependency_report() if check_local else {"status": "NOT-CHECKED-IN-REGENERATION", "issues": [], "paths": {}}
    if check_local and local.get("status") != "PASS":
        global_issues.extend(local.get("issues", []))
    try:
        previews = preview_execution_plan()
    except ValueError as exc:
        previews = []
        global_issues.append(str(exc))
    preview_by_proof = {row["proof_id"]: row for row in previews}
    fixture_paths = {
        "FIXTURE-04": ["proofs/r7/w2/runtime/model.py", "proofs/r7/w2/runtime/runner.py"],
        "FIXTURE-05": ["proofs/r7/w2/runtime/model.py", "proofs/r7/w2/runtime/runner.py"],
        "FIXTURE-07": ["proofs/r7/w4/fixture-07/manifest.json", "proofs/r7/w4/fixture-07/fcc13e-expected.json"],
        "FIXTURE-08": ["proofs/r7/w4/fixture-08/manifest.json", "proofs/r7/w4/presentation_probe/project.godot"],
        "FIXTURE-09": ["proofs/r7/w0/dependencies.lock.json", "proofs/r7/w4/dependency-reference.json"],
    }
    proof_rows = []
    for contract in contracts:
        proof_issues = list(global_issues)
        for fixture_id in contract["principal_fixtures"]:
            paths = fixture_paths.get(fixture_id, [])
            if not paths or any(not (ROOT / path).is_file() for path in paths):
                proof_issues.append(contract["proof_id"] + " fixture is absent or unmapped: " + fixture_id)
        requirement = _proof_requirement(contract)
        preview = preview_by_proof.get(contract["proof_id"])
        if not preview:
            proof_issues.append(contract["proof_id"] + " has no safe future identity preview")
        proof_rows.append({
            **contract,
            "requirements": requirement,
            "readiness_disposition": "READY" if not proof_issues else "BLOCKED",
            "blockers": sorted(set(proof_issues)),
            "proof_observation": "NOT-EXECUTED",
            "future_identity_preview": preview,
            "execution_authorized": False,
        })
    counts = Counter(row["readiness_disposition"] for row in proof_rows)
    identity = fixture_source_identity()
    reference = load_reference()
    registry = registry_snapshot()
    issues = sorted(set(global_issues + [item for row in proof_rows for item in row["blockers"]]))
    return {
        "schema_version": "prd07-w4-readiness-admission-v1",
        "package": "R7-W4-FORGE-TRUST-PRESENTATION-MIGRATION-READINESS-AND-ADMISSION",
        "status": "PASS" if not issues and counts.get("READY", 0) == 15 else "FAIL",
        "implementation_commit": implementation_commit,
        "implementation_commit_source_match": not _commit_source_issues(implementation_commit),
        "source_tree_identity": identity["sha256"],
        "source_tree_artifacts": identity["artifacts"],
        "authority": source_identities(),
        "task": "TASK-20260910-001",
        "work": "WORK-20260910-001",
        "starting_handoff": "HANDOFF-20260910-001",
        "w3_terminal": {"state": "W3-EXECUTION-COMPLETE", "reconciliation": "PASS" if not _w3_terminal_issues() else "FAIL", "issued_high_water": 65},
        "proof_roster": list(W4_PROOF_IDS),
        "proof_count": 15,
        "proofs": proof_rows,
        "readiness_counts": {"READY": counts.get("READY", 0), "BLOCKED": counts.get("BLOCKED", 0), "NOT APPLICABLE": counts.get("NOT APPLICABLE", 0)},
        "fixtures": {"FIXTURE-07": "READY" if not fixture_issues() else "BLOCKED", "FIXTURE-08": "READY" if not fixture_issues() else "BLOCKED", "validation_receipt": FIXTURE_VALIDATION_PATH.relative_to(ROOT).as_posix()},
        "fcc13e": {"required_rows": 312, "covered_rows": 312 if not fixture_issues() else 0, "coverage_rule": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER", "disposition": "READY" if not fixture_issues() else "BLOCKED", "observation_status": "NOT-EXECUTED"},
        "dependency_identity": reference,
        "local_dependency_check": local,
        "execution_environment_contract": {"host_lane": reference["host_lane"], "roles": reference["roles"], "renderers": reference["renderer_candidates"], "isolation": reference["isolation_requirements"], "hardware_identity_rule": reference["hardware_identity_rule"], "current_host_snapshot": {"os": platform.system(), "os_release": platform.release(), "machine": platform.machine(), "python": platform.python_version()}},
        "registry_before_and_after_readiness": registry,
        "next_identity_previews": previews,
        "preview_state": "PREVIEW-NOT-ALLOCATED",
        "proof_execution": "NOT-STARTED",
        "execution_gate": "CLOSED-PENDING-SEPARATE-OWNER-AUTHORIZATION",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "evidence_pack_schema": "proofs/r7/w4/future-evidence-pack.schema.json",
        "future_execution_rules": "proofs/r7/w4/future-execution-rules.json",
        "issues": issues,
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "prd08_evaluation": "CLOSED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
    }


def write_readiness(implementation_commit: str, check_local: bool = True) -> Dict[str, Any]:
    value = readiness_report(implementation_commit, check_local=check_local)
    READINESS_PATH.parent.mkdir(parents=True, exist_ok=True)
    READINESS_PATH.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n", encoding="utf-8")
    return value
