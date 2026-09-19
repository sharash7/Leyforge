"""Exact, append-only admission for the W4 layered-audit wiring correction."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Mapping, Sequence

from tools.r7_w4_execution.contracts import PROTECTED_LOCAL_PATHS, ROOT, protected_local_issues
from tools.r7_w4_execution.execution import reconcile_w4
from tools.r7_w4_repair import correction_admission, integration_admission


REPAIR_REVISION = integration_admission.BASE_REVISION
INTEGRATION_REVISION = correction_admission.BASE_REVISION
CORRECTION_REVISION = "a32f433eb693a43a47ea1f09d33d8bebb9ffc24f"
BASE_REVISION = CORRECTION_REVISION
MANIFEST_PATH = ROOT / "docs/rebuild/r7/w4-audit-wiring-admission-boundary.json"
MODE_ENV = "LEYFORGE_W4_AUDIT_WIRING_ADMISSION_MODE"
MODES = ("preparation", "staged", "published", "auto")
PACKAGE_PATHS = (
    "docs/rebuild/r7/w4-audit-wiring-admission-boundary.json",
    "tools/r7_w4_repair/audit_wiring_admission.py",
    "tools/r7_w4_repair_audit.py",
    "tools/r7_w4_stop_audit.py",
    "tools/tests/test_r7_w4_audit_wiring.py",
    "tools/tests/test_r7_w4_correction_admission.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
)
ARTIFACT_PATHS = tuple(path for path in PACKAGE_PATHS if path != MANIFEST_PATH.relative_to(ROOT).as_posix())
HISTORICAL_STATE = "docs/rebuild/r7/w4-execution-state.json"
HISTORICAL_EVIDENCE = "docs/rebuild/r7/execution-evidence"
DIAGNOSTIC_PATHS = correction_admission.DIAGNOSTIC_PATHS
REVIEW_FORM_PATHS = correction_admission.REVIEW_FORM_PATHS
_SHA40 = re.compile(r"[0-9a-f]{40}")
_SHA64 = re.compile(r"[0-9a-f]{64}")
EXPECTED_KEYS = {
    "schema_version", "manifest_version", "package", "lifecycle_role", "state",
    "base_revision", "integration_revision", "correction_revision", "manifest_path",
    "validation_law", "broad_prefix_exclusions", "wildcard_admissions", "scanner_bypasses",
    "artifacts", "published_integration_admission", "published_correction_admission",
    "historical_state", "historical_evidence_tree", "unchanged_pending_review_forms",
    "protected_local_path_count", "issued_run_high_water", "issued_evidence_high_water",
    "next_possible_identity", "package_allocated_run_ids", "package_allocated_evidence_ids",
    "proof_execution_started", "identity_allocation_started", "proof_observation_created",
    "fcc13e_observed_rows", "rerun_preview", "execution_gate", "production_runtime",
    "gameplay_permission", "manifest_payload_sha256",
}


def _git(*args: str, binary: bool = False) -> bytes | str:
    return correction_admission._git(*args, binary=binary)


def _parent(revision: str) -> str | None:
    try:
        row = str(_git("rev-list", "--parents", "-n", "1", revision)).split()
    except RuntimeError:
        return None
    return row[1] if len(row) == 2 and row[0] == revision else None


def _commit_exists(revision: str) -> bool:
    if _SHA40.fullmatch(revision) is None:
        return False
    result = subprocess.run(
        ["git", "rev-parse", "--verify", revision + "^{commit}"],
        cwd=ROOT, text=True, capture_output=True,
    )
    return result.returncode == 0 and result.stdout.strip() == revision


def _load(path: Path) -> dict[str, Any] | None:
    try:
        value = json.loads(path.read_text(encoding="utf-8-sig"))
    except (OSError, json.JSONDecodeError, UnicodeDecodeError):
        return None
    return value if isinstance(value, dict) else None


def published_chain_issues() -> tuple[str, ...]:
    """Validate each published predecessor at its own exact commit."""
    issues: list[str] = []
    if not all(_commit_exists(rev) for rev in (REPAIR_REVISION, INTEGRATION_REVISION, CORRECTION_REVISION)):
        issues.append("published W4 admission chain has a missing commit")
        return tuple(issues)
    if _parent(INTEGRATION_REVISION) != REPAIR_REVISION:
        issues.append("published W4 integration parent differs")
    if _parent(CORRECTION_REVISION) != INTEGRATION_REVISION:
        issues.append("published W4 correction parent differs")
    integration = _load(integration_admission.MANIFEST_PATH)
    correction = _load(correction_admission.MANIFEST_PATH)
    if integration is None:
        issues.append("published W4 integration manifest is missing or malformed")
    else:
        issues.extend(
            "integration: " + item
            for item in integration_admission.manifest_issues(
                integration, INTEGRATION_REVISION, mode="published"
            )
        )
    if correction is None:
        issues.append("published W4 correction manifest is missing or malformed")
    else:
        issues.extend(
            "correction: " + item
            for item in correction_admission.manifest_issues(
                correction, CORRECTION_REVISION, mode="published"
            )
        )
    return tuple(sorted(set(issues)))


def _selected_mode(mode: str, source_revision: str) -> tuple[str | None, tuple[str, ...]]:
    if mode in MODES[:-1]:
        return mode, ()
    if mode != "auto":
        return None, ("W4 audit-wiring admission mode is unsupported",)
    if correction_admission._staged_paths():
        return None, ("W4 audit-wiring staged content requires explicit staged mode",)
    return ("preparation" if source_revision == BASE_REVISION else "published"), ()


def admitted_paths(value: Mapping[str, Any]) -> tuple[str, ...]:
    rows = value.get("artifacts")
    paths = [str(row.get("path", "")) for row in rows if isinstance(row, Mapping)] if isinstance(rows, list) else []
    manifest = value.get("manifest_path")
    if isinstance(manifest, str):
        paths.append(manifest)
    return tuple(sorted(paths))


def scanner_admits(relative: str, admitted: Sequence[str]) -> bool:
    return relative in set(admitted)


def _revision_record(relative: str, revision: str) -> dict[str, Any]:
    return correction_admission._revision_record(relative, revision)


def _record(relative: str) -> dict[str, Any]:
    data = correction_admission._file_data(ROOT / relative)
    exists_at_base = subprocess.run(
        ["git", "cat-file", "-e", BASE_REVISION + ":" + relative],
        cwd=ROOT, capture_output=True,
    ).returncode == 0
    return {
        "path": relative,
        "change": "MODIFIED" if exists_at_base else "ADDED",
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "git_blob": str(_git("hash-object", "--", relative)),
    }


def _preview() -> list[dict[str, str]]:
    proofs = (50, 51, 53, 55, 56, 57, 58, 59, 60, 61, 62, 71)
    return [
        {
            "proof_id": "PRD04-PROOF-%02d" % proof,
            "run_id": "PRD07-RUN-%04d" % identity,
            "evidence_id": "PRD07-EVID-%04d" % identity,
            "state": "PREVIEW-NOT-ALLOCATED",
        }
        for proof, identity in zip(proofs, range(73, 85))
    ]


def build_manifest() -> dict[str, Any]:
    value: dict[str, Any] = {
        "schema_version": "prd07-w4-audit-wiring-admission-v1",
        "manifest_version": 1,
        "package": "R7-W4-LAYERED-AUDIT-WIRING-CORRECTION",
        "lifecycle_role": "PREPARED-UNPUBLISHED-APPEND-ONLY-ADMISSION",
        "state": "PASS-PREPARED-NOT-STAGED",
        "base_revision": BASE_REVISION,
        "integration_revision": INTEGRATION_REVISION,
        "correction_revision": CORRECTION_REVISION,
        "manifest_path": MANIFEST_PATH.relative_to(ROOT).as_posix(),
        "validation_law": "EXACT-PATH-HASH-PINNED-FAIL-CLOSED",
        "broad_prefix_exclusions": [],
        "wildcard_admissions": [],
        "scanner_bypasses": [],
        "artifacts": [_record(relative) for relative in ARTIFACT_PATHS],
        "published_integration_admission": _revision_record(
            integration_admission.MANIFEST_PATH.relative_to(ROOT).as_posix(), INTEGRATION_REVISION
        ),
        "published_correction_admission": _revision_record(
            correction_admission.MANIFEST_PATH.relative_to(ROOT).as_posix(), CORRECTION_REVISION
        ),
        "historical_state": _revision_record(HISTORICAL_STATE, BASE_REVISION),
        "historical_evidence_tree": str(_git("rev-parse", BASE_REVISION + ":" + HISTORICAL_EVIDENCE)),
        "unchanged_pending_review_forms": [
            _revision_record(relative, BASE_REVISION) for relative in REVIEW_FORM_PATHS
        ],
        "protected_local_path_count": len(PROTECTED_LOCAL_PATHS),
        "issued_run_high_water": 72,
        "issued_evidence_high_water": 72,
        "next_possible_identity": "0073-NOT-ALLOCATED",
        "package_allocated_run_ids": [],
        "package_allocated_evidence_ids": [],
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "proof_observation_created": False,
        "fcc13e_observed_rows": {"PRD04-PROOF-57": 0, "PRD04-PROOF-58": 0},
        "rerun_preview": _preview(),
        "execution_gate": "CLOSED-PENDING-SEPARATE-PUBLICATION-AND-RERUN-AUTHORIZATION",
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
    }
    value["manifest_payload_sha256"] = correction_admission._manifest_payload_sha256(value)
    return value


def manifest_issues(
    value: Mapping[str, Any],
    source_revision: str | None = None,
    *,
    mode: str = "auto",
) -> tuple[str, ...]:
    source_revision = source_revision or str(_git("rev-parse", "HEAD"))
    selected, mode_issues = _selected_mode(mode, source_revision)
    issues = list(mode_issues)
    issues.extend(published_chain_issues())
    if selected is None:
        return tuple(sorted(set(issues)))
    if set(value) != EXPECTED_KEYS:
        issues.append("W4 audit-wiring manifest field set differs")
    if (
        value.get("schema_version") != "prd07-w4-audit-wiring-admission-v1"
        or value.get("manifest_version") != 1
        or value.get("package") != "R7-W4-LAYERED-AUDIT-WIRING-CORRECTION"
        or value.get("lifecycle_role") != "PREPARED-UNPUBLISHED-APPEND-ONLY-ADMISSION"
        or value.get("state") != "PASS-PREPARED-NOT-STAGED"
        or value.get("base_revision") != BASE_REVISION
        or value.get("integration_revision") != INTEGRATION_REVISION
        or value.get("correction_revision") != CORRECTION_REVISION
        or value.get("manifest_path") != MANIFEST_PATH.relative_to(ROOT).as_posix()
        or value.get("validation_law") != "EXACT-PATH-HASH-PINNED-FAIL-CLOSED"
    ):
        issues.append("W4 audit-wiring admission identity differs")
    if any(value.get(key) != [] for key in ("broad_prefix_exclusions", "wildcard_admissions", "scanner_bypasses")):
        issues.append("W4 audit-wiring admission contains a broad scanner bypass")
    if value.get("manifest_payload_sha256") != correction_admission._manifest_payload_sha256(value):
        issues.append("W4 audit-wiring manifest payload identity differs")
    if not _commit_exists(source_revision):
        issues.append("W4 audit-wiring source is not an exact commit")
    if selected in ("preparation", "staged"):
        if source_revision != BASE_REVISION or str(_git("rev-parse", "HEAD")) != BASE_REVISION:
            issues.append("W4 audit-wiring unpublished source differs from the authorized base")
    elif _parent(source_revision) != BASE_REVISION:
        issues.append("W4 audit-wiring published exact commit parent differs")
    staged_snapshot = correction_admission._staged_snapshot() if selected == "staged" else {}
    source_record = correction_admission._source_record(
        MANIFEST_PATH.relative_to(ROOT).as_posix(), selected, source_revision, staged_snapshot
    )
    if source_record is None:
        issues.append("W4 audit-wiring manifest is missing from selected source")
    else:
        try:
            selected_value = json.loads(source_record[1].decode("utf-8-sig"))
            if selected_value != value or source_record[1] != correction_admission._canonical_manifest_bytes(value):
                issues.append("W4 audit-wiring manifest differs from selected source")
        except (UnicodeDecodeError, json.JSONDecodeError):
            issues.append("W4 audit-wiring manifest is malformed in selected source")
    rows = value.get("artifacts")
    if not isinstance(rows, list) or [row.get("path") for row in rows if isinstance(row, Mapping)] != list(ARTIFACT_PATHS) or len(rows) != len(ARTIFACT_PATHS):
        issues.append("W4 audit-wiring artifact path set differs")
    else:
        for row, relative in zip(rows, ARTIFACT_PATHS):
            if not isinstance(row, Mapping):
                issues.append("W4 audit-wiring artifact row is malformed")
                continue
            if not correction_admission._safe_exact_path(relative) or Path(relative).suffix != ".py":
                issues.append("W4 audit-wiring artifact path/type is unsafe: " + relative)
            selected_record = correction_admission._source_record(relative, selected, source_revision, staged_snapshot)
            if selected_record is None:
                issues.append("W4 audit-wiring artifact is missing: " + relative)
                continue
            blob, data = selected_record
            base_exists = subprocess.run(
                ["git", "cat-file", "-e", BASE_REVISION + ":" + relative],
                cwd=ROOT, capture_output=True,
            ).returncode == 0
            if row.get("change") != ("MODIFIED" if base_exists else "ADDED") or row.get("path") != relative:
                issues.append("W4 audit-wiring artifact change differs: " + relative)
            if row.get("bytes") != len(data) or row.get("sha256") != hashlib.sha256(data).hexdigest() or _SHA64.fullmatch(str(row.get("sha256", ""))) is None:
                issues.append("W4 audit-wiring artifact content identity differs: " + relative)
            if row.get("git_blob") != blob or _SHA40.fullmatch(str(row.get("git_blob", ""))) is None:
                issues.append("W4 audit-wiring artifact Git blob differs: " + relative)
            if base_exists and blob == str(_git("rev-parse", BASE_REVISION + ":" + relative)):
                issues.append("W4 audit-wiring artifact does not differ from base: " + relative)
    admitted = admitted_paths(value)
    if admitted != tuple(sorted(PACKAGE_PATHS)):
        issues.append("W4 audit-wiring scanner admission differs from exact package")
    if selected == "preparation":
        changed = correction_admission._working_changed_paths().difference(
            set(PROTECTED_LOCAL_PATHS).union(DIAGNOSTIC_PATHS)
        )
        if changed != set(PACKAGE_PATHS):
            issues.append("W4 audit-wiring preparation changed-path set differs")
        if correction_admission._staged_paths():
            issues.append("W4 audit-wiring preparation contains staged paths")
    elif selected == "staged":
        if set(staged_snapshot) != set(PACKAGE_PATHS):
            issues.append("W4 audit-wiring staged exact path set differs")
        unstaged = set(str(_git("diff", "--name-only", "--")).splitlines())
        if set(PACKAGE_PATHS).intersection(unstaged):
            issues.append("W4 audit-wiring staged package has unstaged changes")
        unexpected_local = correction_admission._working_changed_paths().difference(
            set(PACKAGE_PATHS).union(PROTECTED_LOCAL_PATHS).union(DIAGNOSTIC_PATHS)
        )
        if unexpected_local:
            issues.append("W4 audit-wiring staged source has unadmitted local paths")
    else:
        changed = set(str(_git("diff", "--name-only", BASE_REVISION, source_revision, "--")).splitlines())
        if changed != set(PACKAGE_PATHS):
            issues.append("W4 audit-wiring published exact commit path set differs")
        unexpected_local = correction_admission._working_changed_paths().difference(
            set(PROTECTED_LOCAL_PATHS).union(DIAGNOSTIC_PATHS)
        )
        if unexpected_local:
            issues.append("W4 audit-wiring published source has unadmitted local paths")
    for key, relative, revision in (
        ("published_integration_admission", integration_admission.MANIFEST_PATH.relative_to(ROOT).as_posix(), INTEGRATION_REVISION),
        ("published_correction_admission", correction_admission.MANIFEST_PATH.relative_to(ROOT).as_posix(), CORRECTION_REVISION),
        ("historical_state", HISTORICAL_STATE, BASE_REVISION),
    ):
        if value.get(key) != _revision_record(relative, revision):
            issues.append("W4 audit-wiring predecessor/historical binding differs: " + key)
    expected_tree = str(_git("rev-parse", BASE_REVISION + ":" + HISTORICAL_EVIDENCE))
    if value.get("historical_evidence_tree") != expected_tree:
        issues.append("W4 audit-wiring historical evidence tree binding differs")
    target = source_revision if selected == "published" else BASE_REVISION
    for relative in (HISTORICAL_STATE, HISTORICAL_EVIDENCE, *REVIEW_FORM_PATHS):
        if str(_git("rev-parse", target + ":" + relative)) != str(_git("rev-parse", BASE_REVISION + ":" + relative)):
            issues.append("W4 audit-wiring historical/review source changed: " + relative)
    if value.get("unchanged_pending_review_forms") != [
        _revision_record(relative, BASE_REVISION) for relative in REVIEW_FORM_PATHS
    ]:
        issues.append("W4 audit-wiring pending review-form binding differs")
    for relative in DIAGNOSTIC_PATHS:
        if subprocess.run(["git", "ls-files", "--error-unmatch", "--", relative], cwd=ROOT, capture_output=True).returncode == 0:
            issues.append("W4 blocked diagnostic became tracked: " + relative)
    if value.get("protected_local_path_count") != len(PROTECTED_LOCAL_PATHS) or protected_local_issues():
        issues.append("W4 audit-wiring protected local paths differ")
    if (
        value.get("issued_run_high_water") != 72
        or value.get("issued_evidence_high_water") != 72
        or value.get("next_possible_identity") != "0073-NOT-ALLOCATED"
        or value.get("package_allocated_run_ids") != []
        or value.get("package_allocated_evidence_ids") != []
        or value.get("proof_execution_started") is not False
        or value.get("identity_allocation_started") is not False
        or value.get("proof_observation_created") is not False
        or value.get("fcc13e_observed_rows") != {"PRD04-PROOF-57": 0, "PRD04-PROOF-58": 0}
        or value.get("rerun_preview") != _preview()
        or value.get("execution_gate") != "CLOSED-PENDING-SEPARATE-PUBLICATION-AND-RERUN-AUTHORIZATION"
        or value.get("production_runtime") != "ABSENT"
        or value.get("gameplay_permission") != "CLOSED"
    ):
        issues.append("W4 audit-wiring execution or identity closure differs")
    reconciliation = reconcile_w4(check_local=False)
    if reconciliation.get("status") != "PASS" or reconciliation.get("issued_high_water") != 72:
        issues.append("W4 audit-wiring stopped reconciliation differs")
    return tuple(sorted(set(issues)))


def layered_issues(source_revision: str | None = None, *, mode: str = "auto") -> tuple[str, ...]:
    source_revision = source_revision or str(_git("rev-parse", "HEAD"))
    issues: list[str] = []
    if source_revision != str(_git("rev-parse", "HEAD")):
        issues.append("W4 layered audit source does not equal HEAD")
    value = _load(MANIFEST_PATH)
    if value is None:
        issues.append("W4 audit-wiring admission manifest is missing or malformed")
        issues.extend(published_chain_issues())
    else:
        try:
            issues.extend(manifest_issues(value, source_revision, mode=mode))
        except (RuntimeError, ValueError, OSError, KeyError) as exc:
            issues.append("W4 layered admission could not validate exact authority: " + str(exc))
    return tuple(sorted(set(issues)))


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=("verify",))
    parser.add_argument("--source-revision")
    parser.add_argument("--mode", choices=MODES, default="auto")
    args = parser.parse_args(argv)
    source_revision = args.source_revision or str(_git("rev-parse", "HEAD"))
    value = _load(MANIFEST_PATH)
    issues = layered_issues(source_revision, mode=args.mode)
    success_state = (
        "PASS-STAGED-EXACT-PACKAGE" if args.mode == "staged"
        else "PASS-PUBLISHED-EXACT-COMMIT" if source_revision != BASE_REVISION
        else "PASS-PREPARED-NOT-STAGED"
    )
    result = {
        "status": "PASS" if not issues else "FAIL",
        "state": success_state if not issues else "FAIL-CLOSED",
        "source_revision": source_revision,
        "integration_revision": INTEGRATION_REVISION,
        "correction_revision": CORRECTION_REVISION,
        "mode": args.mode,
        "admitted_paths": list(admitted_paths(value)) if value else [],
        "issues": list(issues),
        "proof_execution_started": False,
        "identity_allocation_started": False,
    }
    print(json.dumps(result, indent=2, sort_keys=True, ensure_ascii=True))
    return 0 if not issues else 1


if __name__ == "__main__":
    raise SystemExit(main())
