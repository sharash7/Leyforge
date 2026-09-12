"""Fail-closed admission for the published W4 measurement-harness repair.

The historical stopped boundary remains authoritative for its original Git
timepoint.  This module separately admits the exact repair commit and the
small set of controls that teach current validation about that new timepoint.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence

from tools.r7_w3_runtime.execution_plan import inspect_execution_registry


ROOT = Path(__file__).resolve().parents[2]
MANIFEST_PATH = ROOT / "docs/rebuild/r7/w4-repair-admission-boundary.json"
STOPPED_BOUNDARY_PATH = ROOT / "docs/rebuild/r7/w4-stopped-execution-boundary.json"
STATE_PATH = ROOT / "docs/rebuild/r7/w4-execution-state.json"
EVIDENCE_ROOT = ROOT / "docs/rebuild/r7/execution-evidence"

REPAIR_COMMIT = "861b721a8be8bdfb298b626c0ed141cb082d8b28"
REPAIR_PARENT_COMMIT = "17865d7d52ad4e90778888d191ebdb5644aa4014"
REPAIR_PATH_STATUS = (
    ("proofs/r7/w4_execution/presentation_probe/capability_fixtures/benign_data.tres", "ADDED"),
    ("proofs/r7/w4_execution/presentation_probe/capability_fixtures/editor_plugin_canary.gd", "ADDED"),
    ("proofs/r7/w4_execution/presentation_probe/capability_fixtures/file_canary.gd", "ADDED"),
    ("proofs/r7/w4_execution/presentation_probe/capability_fixtures/network_canary.gd", "ADDED"),
    ("proofs/r7/w4_execution/presentation_probe/src/main.gd", "MODIFIED"),
    ("proofs/r7/w4_human_review/README.md", "ADDED"),
    ("proofs/r7/w4_human_review/human-review.schema.json", "ADDED"),
    ("proofs/r7/w4_human_review/proof-50-pending.json", "ADDED"),
    ("proofs/r7/w4_human_review/proof-51-origin-mapping-pending.json", "ADDED"),
    ("proofs/r7/w4_human_review/proof-51-pending.json", "ADDED"),
    ("proofs/r7/w4_human_review/proof-53-pending.json", "ADDED"),
    ("tools/r7_w4_execution/builds.py", "MODIFIED"),
    ("tools/r7_w4_execution/observations.py", "MODIFIED"),
    ("tools/r7_w4_repair/__init__.py", "ADDED"),
    ("tools/r7_w4_repair/__main__.py", "ADDED"),
    ("tools/r7_w4_repair/human_review.py", "ADDED"),
    ("tools/r7_w4_repair/measurement.py", "ADDED"),
    ("tools/r7_w4_repair/readiness.py", "ADDED"),
    ("tools/r7_w4_repair/recertification.py", "ADDED"),
    ("tools/r7_w4_repair_audit.py", "ADDED"),
    ("tools/tests/test_r7_w4_execution.py", "MODIFIED"),
    ("tools/tests/test_r7_w4_repair.py", "ADDED"),
)

CONTROL_PATHS = (
    "tools/r7_w4_execution/contracts.py",
    "tools/r7_w4_repair/admission.py",
    "tools/r7_w4_stop_audit.py",
    "tools/tests/test_r7_w4_repair_admission.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
)

STOPPED_LIFECYCLE_PATHS = (
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

STOPPED_SUPERSEDED_PATHS = tuple(
    relative
    for relative in STOPPED_LIFECYCLE_PATHS
    if relative in dict(REPAIR_PATH_STATUS) or relative in CONTROL_PATHS
)

RETAINED_RUNS = tuple("PRD07-RUN-{0:04d}".format(value) for value in range(66, 73))
RETAINED_EVIDENCE = tuple("PRD07-EVID-{0:04d}".format(value) for value in range(66, 73))
_COMMIT = re.compile(r"^[0-9a-f]{40}$")
_ALLOWED_SUFFIXES = {".py", ".json", ".md", ".gd", ".tscn", ".godot", ".tres"}
_FORBIDDEN_SUFFIXES = {".exe", ".dll", ".pck", ".res"}


def _git(*args: str, binary: bool = False) -> bytes | str:
    result = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=not binary)
    if result.returncode:
        error = result.stderr if isinstance(result.stderr, str) else result.stderr.decode("utf-8", errors="replace")
        raise RuntimeError(error.strip() or "git command failed")
    return result.stdout if binary else result.stdout.strip()


def _is_ancestor(ancestor: str, descendant: str) -> bool:
    return subprocess.run(
        ["git", "merge-base", "--is-ancestor", ancestor, descendant],
        cwd=ROOT,
        capture_output=True,
    ).returncode == 0


def _canonical(data: bytes) -> bytes:
    return data.replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def _canonical_file(path: Path) -> bytes:
    return _canonical(path.read_bytes())


def _blob_bytes(blob: str) -> bytes:
    return _canonical(_git("cat-file", "blob", blob, binary=True))


def _record_at_revision(relative: str, revision: str, **extra: Any) -> dict[str, Any]:
    blob = str(_git("rev-parse", revision + ":" + relative))
    data = _blob_bytes(blob)
    return {
        "path": relative,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "git_blob": blob,
        **extra,
    }


def _record_current(relative: str, **extra: Any) -> dict[str, Any]:
    path = ROOT / relative
    data = _canonical_file(path)
    return {
        "path": relative,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "git_blob": str(_git("hash-object", "--", relative)),
        **extra,
    }


def _record_issues(
    row: Mapping[str, Any],
    *,
    label: str,
    revision: str = "",
    require_current: bool,
) -> list[str]:
    issues: list[str] = []
    relative = str(row.get("path", ""))
    blob = str(row.get("git_blob", ""))
    if not relative or Path(relative).is_absolute() or ".." in Path(relative).parts:
        return [label + " has an unsafe path: " + relative]
    if _COMMIT.fullmatch(blob) is None:
        return [label + " lacks an exact Git blob: " + relative]
    path = ROOT / relative
    if revision:
        try:
            data = _blob_bytes(blob)
        except RuntimeError:
            return [label + " Git blob is unavailable: " + relative]
    elif require_current and path.is_file():
        data = _canonical_file(path)
    else:
        try:
            data = _blob_bytes(blob)
        except RuntimeError:
            return [label + " Git blob is unavailable: " + relative]
    if len(data) != row.get("bytes") or hashlib.sha256(data).hexdigest() != row.get("sha256"):
        issues.append(label + " content identity differs: " + relative)
    if revision:
        try:
            if _git("rev-parse", revision + ":" + relative) != blob:
                issues.append(label + " differs from its governing commit: " + relative)
        except RuntimeError:
            issues.append(label + " is absent from its governing commit: " + relative)
    if require_current:
        if not path.is_file():
            issues.append(label + " current path is missing: " + relative)
        else:
            current = _canonical_file(path)
            if len(current) != row.get("bytes") or hashlib.sha256(current).hexdigest() != row.get("sha256"):
                issues.append(label + " current content differs: " + relative)
            try:
                if _git("hash-object", "--", relative) != blob:
                    issues.append(label + " current Git blob differs: " + relative)
            except RuntimeError:
                issues.append(label + " current path cannot be Git-hashed: " + relative)
    return issues


def _repair_change_map() -> dict[str, str]:
    output = str(_git("diff-tree", "--no-commit-id", "--name-status", "--no-renames", "-r", REPAIR_COMMIT))
    result: dict[str, str] = {}
    names = {"A": "ADDED", "M": "MODIFIED"}
    for line in output.splitlines():
        status, relative = line.split("\t", 1)
        result[relative] = names.get(status, status)
    return result


def _historical_evidence_worktree_issues() -> list[str]:
    governed = [
        STATE_PATH.relative_to(ROOT).as_posix(),
        *("docs/rebuild/r7/execution-evidence/" + run_id for run_id in RETAINED_RUNS),
    ]
    try:
        output = str(_git("ls-tree", "-r", "--name-only", REPAIR_COMMIT, "--", *governed))
    except RuntimeError:
        return ["historical W4 state/evidence tree cannot be enumerated"]
    expected = tuple(sorted(line for line in output.splitlines() if line))
    actual_paths = {STATE_PATH.relative_to(ROOT).as_posix()} if STATE_PATH.is_file() else set()
    for run_id in RETAINED_RUNS:
        base = EVIDENCE_ROOT / run_id
        if base.is_dir():
            actual_paths.update(path.relative_to(ROOT).as_posix() for path in base.rglob("*") if path.is_file())
    actual = tuple(sorted(actual_paths))
    issues: list[str] = []
    if actual != expected:
        issues.append("historical W4 state/evidence current path set differs from the repair commit")
        return issues
    for relative in expected:
        try:
            if _git("hash-object", "--", relative) != _git("rev-parse", REPAIR_COMMIT + ":" + relative):
                issues.append("historical W4 state/evidence current Git blob differs: " + relative)
        except RuntimeError:
            issues.append("historical W4 state/evidence current path cannot be resolved: " + relative)
    return issues


def admitted_paths(value: Mapping[str, Any]) -> tuple[str, ...]:
    repair = value.get("repair_boundary", {})
    controls = value.get("admission_controls", {})
    rows: list[Any] = []
    if isinstance(repair, Mapping) and isinstance(repair.get("artifacts"), list):
        rows.extend(repair["artifacts"])
    if isinstance(controls, Mapping) and isinstance(controls.get("artifacts"), list):
        rows.extend(controls["artifacts"])
    paths = [str(row.get("path", "")) for row in rows if isinstance(row, Mapping)]
    return tuple(sorted(set(paths)))


def scanner_admits(relative: str, paths: Iterable[str]) -> bool:
    """Return true only for an exact path in the validated repair admission."""
    return relative in frozenset(paths)


def manifest_issues(value: Mapping[str, Any], source_revision: str) -> tuple[str, ...]:
    issues: list[str] = []
    if (
        value.get("schema_version") != "prd07-w4-repair-admission-boundary-v1"
        or value.get("manifest_version") != 1
        or value.get("package") != "R7-W4-MEASUREMENT-HARNESS-REPAIR-ADMISSION"
        or value.get("lifecycle_role") != "CURRENT-POST-REPAIR-PRE-RECERTIFICATION-ADMISSION"
        or value.get("scope") != "DEVELOPMENT-ONLY-W4-REPAIR-AND-READINESS-INFRASTRUCTURE"
        or value.get("status") != "PASS"
    ):
        issues.append("W4 repair admission identity/status differs")
    if (
        value.get("issued_high_water") != 72
        or value.get("next_possible_identity") != "0073-NOT-ALLOCATED"
        or value.get("allocated_run_ids") != []
        or value.get("allocated_evidence_ids") != []
        or value.get("proof_execution_started") is not False
        or value.get("identity_allocation_started") is not False
        or value.get("execution_gate") != "CLOSED-PENDING-SEPARATE-RECERTIFICATION-AND-RERUN-AUTHORIZATION"
    ):
        issues.append("W4 repair admission crossed the execution/identity boundary")
    if any(value.get(field) != expected for field, expected in {
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "gameplay_permission": "CLOSED",
        "w5": "CLOSED-NOT-READY",
        "r7_final": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
    }.items()):
        issues.append("W4 repair admission crossed a prohibited programme boundary")

    if _COMMIT.fullmatch(source_revision) is None:
        issues.append("W4 repair admission source revision is not exact")
    elif not _is_ancestor(REPAIR_COMMIT, source_revision):
        issues.append("W4 repair commit is not an ancestor of the validation source")
    try:
        if _git("rev-parse", REPAIR_COMMIT + "^") != REPAIR_PARENT_COMMIT:
            issues.append("W4 repair parent commit differs")
    except RuntimeError:
        issues.append("W4 repair commit/parent cannot be resolved")

    repair = value.get("repair_boundary", {})
    repair_rows = repair.get("artifacts", []) if isinstance(repair, Mapping) else []
    repair_paths = [str(row.get("path", "")) for row in repair_rows if isinstance(row, Mapping)] if isinstance(repair_rows, list) else []
    expected_repair = dict(REPAIR_PATH_STATUS)
    if (
        not isinstance(repair, Mapping)
        or repair.get("repair_commit") != REPAIR_COMMIT
        or repair.get("repair_parent_commit") != REPAIR_PARENT_COMMIT
        or not isinstance(repair_rows, list)
        or repair_paths != list(expected_repair)
        or len(repair_paths) != len(repair_rows)
        or _repair_change_map() != expected_repair
    ):
        issues.append("W4 repair boundary path/change set differs from the published repair commit")
    else:
        for row in repair_rows:
            if not isinstance(row, Mapping):
                issues.append("W4 repair boundary contains a non-object artifact")
                continue
            relative = str(row.get("path", ""))
            if row.get("change") != expected_repair.get(relative):
                issues.append("W4 repair change kind differs: " + relative)
            if Path(relative).suffix.lower() not in _ALLOWED_SUFFIXES or Path(relative).suffix.lower() in _FORBIDDEN_SUFFIXES:
                issues.append("W4 repair artifact type is not admitted: " + relative)
            issues.extend(_record_issues(row, label="W4 repair artifact", revision=REPAIR_COMMIT, require_current=True))

    controls = value.get("admission_controls", {})
    control_rows = controls.get("artifacts", []) if isinstance(controls, Mapping) else []
    control_paths = [str(row.get("path", "")) for row in control_rows if isinstance(row, Mapping)] if isinstance(control_rows, list) else []
    if (
        not isinstance(controls, Mapping)
        or controls.get("validation_law") != "EXACT-PATH-HASH-PINNED-FAIL-CLOSED"
        or not isinstance(control_rows, list)
        or control_paths != list(CONTROL_PATHS)
        or len(control_paths) != len(control_rows)
    ):
        issues.append("W4 repair admission control path set differs")
    else:
        for row in control_rows:
            if not isinstance(row, Mapping):
                issues.append("W4 repair admission contains a non-object control")
                continue
            relative = str(row.get("path", ""))
            if Path(relative).suffix.lower() not in _ALLOWED_SUFFIXES:
                issues.append("W4 repair admission control type is unsupported: " + relative)
            issues.extend(_record_issues(row, label="W4 repair admission control", require_current=True))

    historical = value.get("historical_stopped_boundary", {})
    boundary = json.loads(STOPPED_BOUNDARY_PATH.read_text(encoding="utf-8-sig")) if STOPPED_BOUNDARY_PATH.is_file() else {}
    validation_commit = str(boundary.get("lifecycle_validation_commit", ""))
    historical_record = historical.get("boundary_artifact", {}) if isinstance(historical, Mapping) else {}
    declared_superseded = historical.get("superseded_current_paths", []) if isinstance(historical, Mapping) else []
    if (
        not isinstance(historical, Mapping)
        or historical.get("path") != STOPPED_BOUNDARY_PATH.relative_to(ROOT).as_posix()
        or historical.get("original_lifecycle_role") != "CURRENT-FAIL-CLOSED-STOPPED-EXECUTION-BOUNDARY"
        or historical.get("current_lifecycle_role") != "IMMUTABLE-HISTORICAL-STOPPED-EXECUTION-BOUNDARY"
        or historical.get("validation_mode") != "GIT-OBJECTS-AT-ORIGINAL-LIFECYCLE-COMMIT"
        or historical.get("lifecycle_validation_commit") != validation_commit
        or declared_superseded != list(STOPPED_SUPERSEDED_PATHS)
    ):
        issues.append("historical stopped W4 boundary disposition differs")
    if not STOPPED_BOUNDARY_PATH.is_file():
        issues.append("historical stopped W4 boundary is missing")
    else:
        issues.extend(_record_issues(historical_record, label="historical stopped W4 boundary", revision=REPAIR_COMMIT, require_current=True))
    if (
        boundary.get("schema_version") != "prd07-w4-stopped-execution-boundary-v1"
        or boundary.get("manifest_version") != 1
        or boundary.get("status") != "PASS"
        or boundary.get("package_state") != "STOPPED-AFTER-FAIL-OBSERVED"
        or boundary.get("issued_high_water") != 72
        or boundary.get("next_possible_identity") != "0073-NOT-ALLOCATED"
        or boundary.get("allocated_run_ids") != list(RETAINED_RUNS)
        or boundary.get("allocated_evidence_ids") != list(RETAINED_EVIDENCE)
    ):
        issues.append("historical stopped W4 boundary facts differ")
    if _COMMIT.fullmatch(validation_commit) is None or not _is_ancestor(validation_commit, REPAIR_COMMIT):
        issues.append("historical stopped W4 lifecycle commit is invalid or not before repair")
    stopped_rows = boundary.get("artifacts", [])
    stopped_paths = [str(row.get("path", "")) for row in stopped_rows if isinstance(row, Mapping)] if isinstance(stopped_rows, list) else []
    if not isinstance(stopped_rows, list) or stopped_paths != list(STOPPED_LIFECYCLE_PATHS) or len(stopped_paths) != len(stopped_rows):
        issues.append("historical stopped W4 artifact set differs")
    else:
        for row in stopped_rows:
            if not isinstance(row, Mapping):
                issues.append("historical stopped W4 boundary contains a non-object artifact")
                continue
            relative = str(row.get("path", ""))
            issues.extend(
                _record_issues(
                    row,
                    label="historical stopped W4 artifact",
                    revision=validation_commit,
                    require_current=relative not in STOPPED_SUPERSEDED_PATHS,
                )
            )

    evidence = value.get("historical_evidence", {})
    observation_commit = str(boundary.get("observation_commit", ""))
    if (
        not isinstance(evidence, Mapping)
        or evidence.get("observation_commit") != observation_commit
        or evidence.get("state_blob") != boundary.get("observation_state", {}).get("state_blob")
        or evidence.get("evidence_tree") != boundary.get("observation_state", {}).get("evidence_tree")
        or evidence.get("retained_run_ids") != list(RETAINED_RUNS)
        or evidence.get("retained_evidence_ids") != list(RETAINED_EVIDENCE)
        or evidence.get("integrity_rule") != "UNCHANGED-FROM-OBSERVATION-COMMIT-THROUGH-REPAIR"
    ):
        issues.append("historical W4 evidence identity declaration differs")
    try:
        if _git("rev-parse", REPAIR_COMMIT + ":" + STATE_PATH.relative_to(ROOT).as_posix()) != boundary.get("observation_state", {}).get("state_blob"):
            issues.append("historical W4 state changed before the repair boundary")
        if _git("rev-parse", REPAIR_COMMIT + ":docs/rebuild/r7/execution-evidence") != boundary.get("observation_state", {}).get("evidence_tree"):
            issues.append("historical W4 evidence tree changed before the repair boundary")
    except RuntimeError:
        issues.append("historical W4 state/evidence cannot be resolved")
    issues.extend(_historical_evidence_worktree_issues())

    state = json.loads(STATE_PATH.read_text(encoding="utf-8-sig")) if STATE_PATH.is_file() else {}
    if (
        state.get("allocated_run_ids") != list(RETAINED_RUNS)
        or state.get("allocated_evidence_ids") != list(RETAINED_EVIDENCE)
    ):
        issues.append("current W4 execution-state issued identities differ")
    try:
        registry = inspect_execution_registry(ROOT)
        if registry.max_run_number != 72 or registry.max_evidence_number != 72:
            issues.append("current RUN/EVID registry high-water is not exactly 0072")
    except Exception as exc:
        issues.append("current RUN/EVID registry is ambiguous: " + str(exc))
    suffix = []
    for path in EVIDENCE_ROOT.glob("PRD07-RUN-*") if EVIDENCE_ROOT.is_dir() else []:
        match = re.fullmatch(r"PRD07-RUN-(\d{4})", path.name)
        if path.is_dir() and match and int(match.group(1)) >= 73:
            suffix.append(path.name)
    if suffix:
        issues.append("0073+ execution-evidence paths exist: " + ", ".join(sorted(suffix)))
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        if (ROOT / relative).exists():
            issues.append("root production boundary exists: " + relative)
    return tuple(sorted(set(issues)))


def build_manifest() -> dict[str, Any]:
    if _git("rev-parse", "HEAD") != REPAIR_COMMIT:
        raise ValueError("W4 repair admission must be prepared directly above the published repair commit")
    boundary = json.loads(STOPPED_BOUNDARY_PATH.read_text(encoding="utf-8-sig"))
    repair_rows = [
        _record_at_revision(relative, REPAIR_COMMIT, change=change)
        for relative, change in REPAIR_PATH_STATUS
    ]
    control_rows = [_record_current(relative) for relative in CONTROL_PATHS]
    return {
        "schema_version": "prd07-w4-repair-admission-boundary-v1",
        "manifest_version": 1,
        "package": "R7-W4-MEASUREMENT-HARNESS-REPAIR-ADMISSION",
        "lifecycle_role": "CURRENT-POST-REPAIR-PRE-RECERTIFICATION-ADMISSION",
        "scope": "DEVELOPMENT-ONLY-W4-REPAIR-AND-READINESS-INFRASTRUCTURE",
        "status": "PASS",
        "historical_stopped_boundary": {
            "path": STOPPED_BOUNDARY_PATH.relative_to(ROOT).as_posix(),
            "boundary_artifact": _record_at_revision(STOPPED_BOUNDARY_PATH.relative_to(ROOT).as_posix(), REPAIR_COMMIT),
            "original_lifecycle_role": "CURRENT-FAIL-CLOSED-STOPPED-EXECUTION-BOUNDARY",
            "current_lifecycle_role": "IMMUTABLE-HISTORICAL-STOPPED-EXECUTION-BOUNDARY",
            "lifecycle_validation_commit": boundary["lifecycle_validation_commit"],
            "validation_mode": "GIT-OBJECTS-AT-ORIGINAL-LIFECYCLE-COMMIT",
            "superseded_current_paths": list(STOPPED_SUPERSEDED_PATHS),
        },
        "repair_boundary": {
            "repair_commit": REPAIR_COMMIT,
            "repair_parent_commit": REPAIR_PARENT_COMMIT,
            "commit_subject": "fix(rebuild): repair W4 measurement harness",
            "path_count": len(repair_rows),
            "added_paths": sum(row["change"] == "ADDED" for row in repair_rows),
            "modified_paths": sum(row["change"] == "MODIFIED" for row in repair_rows),
            "artifacts": repair_rows,
        },
        "admission_controls": {
            "validation_law": "EXACT-PATH-HASH-PINNED-FAIL-CLOSED",
            "broad_prefix_exclusions": [],
            "blanket_scanner_bypasses": [],
            "artifacts": control_rows,
        },
        "historical_evidence": {
            "observation_commit": boundary["observation_commit"],
            "state_blob": boundary["observation_state"]["state_blob"],
            "evidence_tree": boundary["observation_state"]["evidence_tree"],
            "retained_run_ids": list(RETAINED_RUNS),
            "retained_evidence_ids": list(RETAINED_EVIDENCE),
            "integrity_rule": "UNCHANGED-FROM-OBSERVATION-COMMIT-THROUGH-REPAIR",
        },
        "issued_high_water": 72,
        "next_possible_identity": "0073-NOT-ALLOCATED",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "recertification_state": "NOT-GENERATED-BY-THIS-ADMISSION-PACKAGE",
        "execution_gate": "CLOSED-PENDING-SEPARATE-RECERTIFICATION-AND-RERUN-AUTHORIZATION",
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "gameplay_permission": "CLOSED",
        "w5": "CLOSED-NOT-READY",
        "r7_final": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
    }


def write_manifest() -> dict[str, Any]:
    value = build_manifest()
    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST_PATH.write_text(
        json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n",
        encoding="utf-8",
    )
    return value


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("build", "write", "verify"))
    parser.add_argument("--source-revision")
    parser.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args(argv)
    if args.action == "build":
        value = build_manifest()
        report: Mapping[str, Any] = value
        status = "PASS"
    elif args.action == "write":
        value = write_manifest()
        report = value
        status = "PASS"
    else:
        value = json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig")) if MANIFEST_PATH.is_file() else {}
        source_revision = args.source_revision or str(_git("rev-parse", "HEAD"))
        issues = manifest_issues(value, source_revision)
        status = "PASS" if not issues else "FAIL"
        report = {
            "schema_version": "prd07-w4-repair-admission-audit-v1",
            "status": status,
            "checks": 1,
            "source_revision": source_revision,
            "repair_commit": REPAIR_COMMIT,
            "admitted_paths": len(admitted_paths(value)),
            "issued_high_water": value.get("issued_high_water"),
            "proof_execution_started": value.get("proof_execution_started"),
            "identity_allocation_started": value.get("identity_allocation_started"),
            "issues": list(issues),
        }
    if args.format == "json":
        print(json.dumps(report, indent=2, sort_keys=True, ensure_ascii=True))
    else:
        print(status if status == "PASS" else "FAIL: " + "; ".join(report.get("issues", [])))
    return 0 if status == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
