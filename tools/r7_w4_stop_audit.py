#!/usr/bin/env python3
"""Audit and boundary generation for the fail-closed W4 stopped package.

The historical execution source, immutable observations, and post-stop lifecycle
validators are three distinct Git timepoints.  This audit verifies all three and
never turns stopped-package integrity into a W4 success claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, Iterable, Mapping, Sequence

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from tools.r7_w4_execution.contracts import PROTECTED_LOCAL_PATHS
from tools.r7_w4_execution.execution import RECONCILIATION_PATH, reconcile_w4
from tools.r7_w4_repair.admission import (
    MANIFEST_PATH as REPAIR_ADMISSION,
    STOPPED_SUPERSEDED_PATHS,
    manifest_issues as repair_admission_issues,
)


BOUNDARY = ROOT / "docs/rebuild/r7/w4-stopped-execution-boundary.json"
STATE = ROOT / "docs/rebuild/r7/w4-execution-state.json"
SOURCE_BOUNDARY = ROOT / "docs/rebuild/r7/w4-governed-execution-source-boundary.json"
EXECUTION_ADMISSION = ROOT / "docs/rebuild/r7/w4-governed-execution-admission.json"
READINESS_COMMIT = "26548f7561974239b8996c473f25644d61f099fa"
EXECUTION_SOURCE_REVISION = "b5a52ca8411aa4712e1c2bad5917455867f61b70"
PACKAGE = "R7-W4-FORGE-TRUST-PRESENTATION-MIGRATION-GOVERNED-EXECUTION"
ROSTER = tuple("PRD04-PROOF-{0:02d}".format(value) for value in (49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 71))
RUNS = tuple("PRD07-RUN-{0:04d}".format(value) for value in range(66, 73))
EVIDENCE = tuple("PRD07-EVID-{0:04d}".format(value) for value in range(66, 73))
LIFECYCLE_PATHS = (
    "tools/tests/test_r7_w3_reconciliation.py",
    "tools/tests/test_r7_w3_runtime.py",
    "tools/r7_w4_execution/cli.py",
    "tools/r7_w4_execution/contracts.py",
    "tools/r7_w4_execution/execution.py",
    "tools/r7_w4_execution/observations.py",
    "tools/r7_w4_execution_audit.py",
    "tools/r7_w4_stop_audit.py",
    "tools/tests/test_r7_w4_execution.py",
    "tools/tests/test_r7_w4_runtime.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
    "docs/rebuild/r7/w4-stopped-execution-reconciliation.json",
)
OBSERVATION_PATHS = (
    "docs/rebuild/r7/w4-execution-state.json",
    *("docs/rebuild/r7/execution-evidence/" + run_id for run_id in RUNS),
)


class Audit:
    def __init__(self) -> None:
        self.checks = 0
        self.failures: list[str] = []

    def check(self, condition: bool, message: str) -> None:
        self.checks += 1
        if not condition:
            self.failures.append(message)


def _git(*args: str, binary: bool = False) -> Any:
    result = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=not binary)
    if result.returncode:
        error = result.stderr if isinstance(result.stderr, str) else result.stderr.decode("utf-8", errors="replace")
        raise RuntimeError(error.strip() or "git command failed")
    return result.stdout if binary else result.stdout.strip()


def _load(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError(path.as_posix() + " must contain a JSON object")
    return value


def _canonical_bytes(value: Any) -> bytes:
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n").encode("utf-8")


def _canonical_file(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def _sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _is_ancestor(ancestor: str, descendant: str) -> bool:
    return subprocess.run(["git", "merge-base", "--is-ancestor", ancestor, descendant], cwd=ROOT, capture_output=True).returncode == 0


def _blob_bytes(blob: str) -> bytes:
    return _git("cat-file", "blob", blob, binary=True)


def _record(path: str, revision: str) -> Dict[str, Any]:
    data = _canonical_file(ROOT / path)
    return {
        "path": path,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "git_blob": _git("rev-parse", revision + ":" + path),
    }


def _historical_records_issues(records: Iterable[Mapping[str, Any]], revision: str, label: str) -> list[str]:
    failures: list[str] = []
    for row in records:
        relative = str(row.get("path", ""))
        blob = str(row.get("git_blob", ""))
        if not relative or Path(relative).is_absolute() or ".." in Path(relative).parts or re.fullmatch(r"[0-9a-f]{40}", blob) is None:
            failures.append(label + " contains an unsafe or malformed artifact row: " + relative)
            continue
        try:
            data = _blob_bytes(blob).replace(b"\r\n", b"\n").replace(b"\r", b"\n")
            if _git("rev-parse", revision + ":" + relative) != blob:
                failures.append(label + " artifact differs from its historical revision: " + relative)
            if len(data) != row.get("bytes") or hashlib.sha256(data).hexdigest() != row.get("sha256"):
                failures.append(label + " artifact content identity differs: " + relative)
        except RuntimeError:
            failures.append(label + " artifact cannot be resolved: " + relative)
    return failures


def build_boundary(validation_commit: str) -> Dict[str, Any]:
    if re.fullmatch(r"[0-9a-f]{40}", validation_commit) is None or _git("rev-parse", "HEAD") != validation_commit:
        raise ValueError("stopped boundary must be generated at its exact validation commit")
    reconciliation = reconcile_w4(check_local=False)
    if reconciliation.get("status") != "PASS":
        raise ValueError("stopped reconciliation is not clean: " + "; ".join(reconciliation.get("failures", [])))
    if not RECONCILIATION_PATH.is_file() or RECONCILIATION_PATH.read_bytes() != _canonical_bytes(reconciliation):
        raise ValueError("stored stopped reconciliation is missing or not canonical-equal")
    observation_commit = _git("log", "-1", "--format=%H", "--", STATE.relative_to(ROOT).as_posix())
    return {
        "schema_version": "prd07-w4-stopped-execution-boundary-v1",
        "manifest_version": 1,
        "status": "PASS",
        "certification_meaning": "INTEGRITY-OF-STOPPED-PACKAGE-ONLY-NOT-W4-SUCCESS",
        "package": PACKAGE,
        "lifecycle_role": "CURRENT-FAIL-CLOSED-STOPPED-EXECUTION-BOUNDARY",
        "execution_source_revision": EXECUTION_SOURCE_REVISION,
        "readiness_package_commit": READINESS_COMMIT,
        "observation_commit": observation_commit,
        "lifecycle_validation_commit": validation_commit,
        "proof_roster": list(ROSTER),
        "allocated_run_ids": list(RUNS),
        "allocated_evidence_ids": list(EVIDENCE),
        "issued_high_water": 72,
        "next_possible_identity": "0073-NOT-ALLOCATED",
        "package_state": "STOPPED-AFTER-FAIL-OBSERVED",
        "w4_lifecycle_state": "INCOMPLETE-REPAIR-RECERTIFICATION-AND-FRESH-RERUN-AUTHORIZATION-REQUIRED",
        "observation_state": {
            "state_blob": _git("rev-parse", observation_commit + ":" + STATE.relative_to(ROOT).as_posix()),
            "evidence_tree": _git("rev-parse", observation_commit + ":docs/rebuild/r7/execution-evidence"),
            "paths": list(OBSERVATION_PATHS),
        },
        "historical_admission": {
            "path": EXECUTION_ADMISSION.relative_to(ROOT).as_posix(),
            "sha256": _sha(EXECUTION_ADMISSION),
            "source_boundary_path": SOURCE_BOUNDARY.relative_to(ROOT).as_posix(),
            "source_boundary_sha256": _sha(SOURCE_BOUNDARY),
        },
        "reconciliation": {
            "path": RECONCILIATION_PATH.relative_to(ROOT).as_posix(),
            "sha256": _sha(RECONCILIATION_PATH),
            "checks": reconciliation["checks"],
            "status": reconciliation["status"],
        },
        "artifacts": [_record(path, validation_commit) for path in LIFECYCLE_PATHS],
        "measurement_defect": reconciliation["measurement_defect"],
        "fcc13e": reconciliation["fcc13e"],
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "prd08_submission": "NOT-SUBMITTED",
        "w5": "CLOSED-NOT-READY",
        "r7_final": "CLOSED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
    }


def write_boundary(validation_commit: str) -> Dict[str, Any]:
    value = build_boundary(validation_commit)
    BOUNDARY.write_bytes(_canonical_bytes(value))
    return value


def audit(source_revision: str, *, check_protected: bool) -> Dict[str, Any]:
    audit = Audit()
    audit.check(re.fullmatch(r"[0-9a-f]{40}", source_revision) is not None, "audit source revision is not exact")
    try:
        head = _git("rev-parse", "HEAD")
        audit.check(head == source_revision, "audit source revision does not equal HEAD")
    except RuntimeError as exc:
        head = ""
        audit.check(False, str(exc))
    audit.check(BOUNDARY.is_file(), "W4 stopped execution boundary is missing")
    audit.check(RECONCILIATION_PATH.is_file(), "W4 stopped reconciliation is missing")
    if not BOUNDARY.is_file() or not RECONCILIATION_PATH.is_file():
        return {"status": "FAIL", "checks": audit.checks, "failures": audit.failures}

    boundary = _load(BOUNDARY)
    repair_admission = _load(REPAIR_ADMISSION) if REPAIR_ADMISSION.is_file() else {}
    repair_failures = repair_admission_issues(repair_admission, source_revision)
    for failure in repair_failures:
        audit.check(False, "repair admission: " + failure)
    superseded_paths = set(STOPPED_SUPERSEDED_PATHS) if not repair_failures else set()
    reconciliation = reconcile_w4(check_local=False)
    stored_reconciliation = _load(RECONCILIATION_PATH)
    audit.check(reconciliation.get("status") == "PASS", "dynamic stopped reconciliation failed")
    audit.check(stored_reconciliation == reconciliation, "stored stopped reconciliation is not canonical-equal to regeneration")
    audit.check(boundary.get("schema_version") == "prd07-w4-stopped-execution-boundary-v1" and boundary.get("manifest_version") == 1, "stopped boundary schema/version differs")
    audit.check(boundary.get("status") == "PASS" and boundary.get("certification_meaning") == "INTEGRITY-OF-STOPPED-PACKAGE-ONLY-NOT-W4-SUCCESS", "stopped boundary overclaims or did not pass")
    audit.check(boundary.get("package") == PACKAGE and boundary.get("lifecycle_role") == "CURRENT-FAIL-CLOSED-STOPPED-EXECUTION-BOUNDARY", "stopped boundary package/lifecycle differs")
    audit.check(boundary.get("execution_source_revision") == EXECUTION_SOURCE_REVISION and reconciliation.get("source_revision") == EXECUTION_SOURCE_REVISION, "executed source revision differs")
    audit.check(boundary.get("readiness_package_commit") == READINESS_COMMIT, "readiness authority differs")
    audit.check(boundary.get("proof_roster") == list(ROSTER), "stopped boundary proof roster differs")
    audit.check(boundary.get("allocated_run_ids") == list(RUNS) and boundary.get("allocated_evidence_ids") == list(EVIDENCE), "stopped boundary issued identity prefix differs")
    audit.check(boundary.get("issued_high_water") == 72 and boundary.get("next_possible_identity") == "0073-NOT-ALLOCATED", "stopped boundary high-water/next identity differs")
    audit.check(boundary.get("package_state") == "STOPPED-AFTER-FAIL-OBSERVED", "stopped boundary package state differs")
    audit.check(boundary.get("w4_lifecycle_state") == "INCOMPLETE-REPAIR-RECERTIFICATION-AND-FRESH-RERUN-AUTHORIZATION-REQUIRED", "stopped boundary lifecycle consequence differs")
    validation_commit = str(boundary.get("lifecycle_validation_commit", ""))
    observation_commit = str(boundary.get("observation_commit", ""))
    audit.check(re.fullmatch(r"[0-9a-f]{40}", validation_commit) is not None and _is_ancestor(validation_commit, head), "lifecycle validation commit is invalid or not an ancestor")
    audit.check(re.fullmatch(r"[0-9a-f]{40}", observation_commit) is not None and _is_ancestor(observation_commit, validation_commit), "observation commit is invalid or not before lifecycle validation")
    audit.check(_is_ancestor(READINESS_COMMIT, EXECUTION_SOURCE_REVISION) and _is_ancestor(EXECUTION_SOURCE_REVISION, observation_commit), "readiness/source/observation ancestry differs")

    artifact_rows = boundary.get("artifacts", [])
    rows = artifact_rows if isinstance(artifact_rows, list) else []
    audit.check([row.get("path") for row in rows if isinstance(row, dict)] == list(LIFECYCLE_PATHS), "stopped boundary lifecycle artifact set differs")
    for row in rows:
        if not isinstance(row, dict):
            audit.check(False, "stopped boundary contains a malformed artifact row")
            continue
        relative = str(row.get("path", ""))
        candidate = ROOT / relative
        audit.check(candidate.is_file(), "stopped-boundary artifact is missing: " + relative)
        if not candidate.is_file():
            continue
        try:
            historical = _blob_bytes(str(row.get("git_blob", ""))).replace(b"\r\n", b"\n").replace(b"\r", b"\n")
            audit.check(len(historical) == row.get("bytes") and hashlib.sha256(historical).hexdigest() == row.get("sha256"), "stopped-boundary historical content differs: " + relative)
            audit.check(row.get("git_blob") == _git("rev-parse", validation_commit + ":" + relative), "stopped-boundary historical Git identity differs: " + relative)
            if relative not in superseded_paths:
                current = _canonical_file(candidate)
                audit.check(len(current) == row.get("bytes") and hashlib.sha256(current).hexdigest() == row.get("sha256"), "stopped-boundary current content differs: " + relative)
                audit.check(_git("hash-object", "--", relative) == row.get("git_blob"), "stopped-boundary current Git identity differs: " + relative)
        except RuntimeError:
            audit.check(False, "stopped-boundary Git identity cannot be resolved: " + relative)

    audit.check(boundary.get("reconciliation", {}).get("sha256") == _sha(RECONCILIATION_PATH), "stopped reconciliation hash differs from boundary")
    audit.check(boundary.get("reconciliation", {}).get("checks") == reconciliation.get("checks"), "stopped reconciliation check total differs")
    observation = boundary.get("observation_state", {})
    try:
        audit.check(observation.get("state_blob") == _git("rev-parse", observation_commit + ":" + STATE.relative_to(ROOT).as_posix()), "historical W4 state blob differs")
        audit.check(observation.get("evidence_tree") == _git("rev-parse", observation_commit + ":docs/rebuild/r7/execution-evidence"), "historical evidence tree differs")
        difference = subprocess.run(["git", "diff", "--quiet", observation_commit, "--", *OBSERVATION_PATHS], cwd=ROOT).returncode
        audit.check(difference == 0, "retained stopped state/evidence differs from observation commit")
    except RuntimeError as exc:
        audit.check(False, str(exc))

    admission = _load(EXECUTION_ADMISSION)
    source_boundary = _load(SOURCE_BOUNDARY)
    audit.check(admission.get("schema_version") == "prd07-w4-governed-execution-admission-v1" and admission.get("status") == "PASS", "historical execution admission differs")
    audit.check(admission.get("proof_order") == list(ROSTER) and admission.get("proof_execution") == "NOT-STARTED", "historical execution admission proof state differs")
    audit.check(admission.get("allocated_run_ids") == [] and admission.get("allocated_evidence_ids") == [], "historical execution admission allocated identities")
    checkpoint_ci = admission.get("execution_checkpoint_ci", [])
    audit.check(isinstance(checkpoint_ci, list) and len(checkpoint_ci) == 2 and all(isinstance(row, dict) and row.get("conclusion") == "success" for row in checkpoint_ci), "historical execution checkpoint CI differs")
    audit.check(boundary.get("historical_admission", {}).get("sha256") == _sha(EXECUTION_ADMISSION), "historical execution-admission hash differs")
    audit.check(admission.get("source_boundary", {}).get("sha256") == _sha(SOURCE_BOUNDARY) == boundary.get("historical_admission", {}).get("source_boundary_sha256"), "historical source-boundary hash differs")
    historical_source_implementation = str(source_boundary.get("implementation_commit", ""))
    admission_implementation = str(admission.get("execution_implementation_commit", ""))
    for failure in _historical_records_issues(source_boundary.get("artifacts", []), historical_source_implementation, "historical source boundary"):
        audit.check(False, failure)
    for failure in _historical_records_issues(admission.get("execution_source_artifacts", []), admission_implementation, "historical execution admission"):
        audit.check(False, failure)

    for sequence in range(73, 81):
        audit.check(not (ROOT / "docs/rebuild/r7/execution-evidence/PRD07-RUN-{0:04d}".format(sequence)).exists(), "unissued retained evidence path exists: PRD07-RUN-{0:04d}".format(sequence))
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        audit.check(not (ROOT / relative).exists(), "root production boundary exists: " + relative)
    audit.check(boundary.get("w5") == "CLOSED-NOT-READY" and all(boundary.get(name) == "CLOSED" for name in ("r7_final", "prd09", "r8")), "stopped boundary opened a later programme gate")
    audit.check(boundary.get("prd08_submission") == "NOT-SUBMITTED" and boundary.get("gameplay_permission") == "CLOSED", "stopped boundary opened PRD-08 or gameplay")
    audit.check(boundary.get("production_runtime") == "ABSENT" and boundary.get("production_dependency_activation") == "INACTIVE", "stopped boundary crossed production")

    if check_protected:
        for relative, (expected_bytes, expected_sha) in PROTECTED_LOCAL_PATHS.items():
            candidate = ROOT / relative
            audit.check(candidate.is_file() and candidate.stat().st_size == expected_bytes and _sha(candidate) == expected_sha, "protected user-local path changed: " + relative)
        try:
            audit.check(_git("branch", "--show-current") == "codex/chore/brain-governance-pilot", "current branch differs")
            audit.check(_git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}") == "origin/codex/chore/brain-governance-pilot", "configured upstream differs")
            audit.check(_git("rev-parse", "@{u}") == head, "local HEAD and upstream are not synchronized")
        except RuntimeError as exc:
            audit.check(False, str(exc))
    failures = sorted(set(audit.failures))
    return {
        "schema_version": "prd07-w4-stopped-execution-audit-v1",
        "status": "PASS" if not failures else "FAIL",
        "certification_meaning": "INTEGRITY-OF-STOPPED-PACKAGE-ONLY-NOT-W4-SUCCESS",
        "checks": audit.checks,
        "source_revision": source_revision,
        "execution_source_revision": EXECUTION_SOURCE_REVISION,
        "observation_commit": observation_commit,
        "lifecycle_validation_commit": validation_commit,
        "result_counts": reconciliation.get("result_counts", {}),
        "issued_high_water": 72 if not failures else None,
        "next_possible_identity": "0073-NOT-ALLOCATED",
        "fcc13e": reconciliation.get("fcc13e", {}),
        "measurement_defect": reconciliation.get("measurement_defect", {}),
        "protected_local_paths": "UNCHANGED" if check_protected and not failures else "NOT-CHECKED" if not check_protected else "CHECK-FAILED",
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
        "w5": "CLOSED-NOT-READY",
        "failures": failures,
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source-revision")
    parser.add_argument("--check-protected-local", action="store_true")
    parser.add_argument("--write-boundary", action="store_true")
    parser.add_argument("--validation-commit")
    parser.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args(argv)
    if args.write_boundary:
        if not args.validation_commit:
            raise ValueError("--validation-commit is required with --write-boundary")
        result = write_boundary(args.validation_commit)
    else:
        result = audit(args.source_revision or str(_git("rev-parse", "HEAD")), check_protected=args.check_protected_local)
    if args.format == "json":
        print(json.dumps(result, indent=2, sort_keys=True, ensure_ascii=True))
    else:
        print("PASS" if result.get("status") == "PASS" else "FAIL: " + "; ".join(result.get("failures", [])))
    return 0 if result.get("status") == "PASS" else 1


if __name__ == "__main__":
    sys.exit(main())
