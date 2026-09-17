"""Lifecycle-explicit admission for the append-only W4 correction package."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Mapping, Sequence

from tools.r7_w4_execution.contracts import PROTECTED_LOCAL_PATHS, ROOT, protected_local_issues
from tools.r7_w4_repair.integration_admission import (
    MANIFEST_PATH as PUBLISHED_INTEGRATION_MANIFEST,
    _historical_issues,
    _identity_issues,
    manifest_issues as published_integration_issues,
)


BASE_REVISION = "11900c72c92f8869c0072907899f0899b524dc32"
MANIFEST_PATH = ROOT / "docs/rebuild/r7/w4-correction-admission-boundary.json"
ENVIRONMENT_DEFECT_PATH = "docs/rebuild/r7/w4-human-review-environment-defect-001.json"
MODE_ENV = "LEYFORGE_W4_CORRECTION_ADMISSION_MODE"
VALIDATION_MODES = ("preparation", "staged", "published")
ORCHESTRATION_MODES = (*VALIDATION_MODES, "auto")
VALIDATION_STATES = {
    "preparation": "PASS-PREPARED-NOT-STAGED",
    "staged": "PASS-STAGED-EXACT-PACKAGE",
    "published": "PASS-PUBLISHED-EXACT-COMMIT",
}
DIAGNOSTIC_PATHS = (
    "docs/rebuild/r7/w4-measurement-recertification.json",
    "docs/rebuild/r7/w4-rerun-readiness.json",
)
REVIEW_FORM_PATHS = (
    "proofs/r7/w4_human_review/proof-50-pending.json",
    "proofs/r7/w4_human_review/proof-51-origin-mapping-pending.json",
    "proofs/r7/w4_human_review/proof-51-pending.json",
    "proofs/r7/w4_human_review/proof-53-pending.json",
)
PACKAGE_PATHS = (
    "docs/rebuild/r7/w4-correction-admission-boundary.json",
    ENVIRONMENT_DEFECT_PATH,
    "proofs/r7/w4_execution/presentation_probe/src/main.gd",
    "proofs/r7/w4_human_review/README.md",
    "tools/r7_w4_execution/builds.py",
    "tools/r7_w4_repair/correction_admission.py",
    "tools/r7_w4_repair/review_presentation.py",
    "tools/tests/test_r7_w4_correction_admission.py",
    "tools/tests/test_r7_w4_integration_repair.py",
    "tools/tests/test_r7_w4_review_presentation.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
)
ARTIFACT_PATHS = tuple(path for path in PACKAGE_PATHS if path != MANIFEST_PATH.relative_to(ROOT).as_posix())
HISTORICAL_BOUNDARY_PATH = "docs/rebuild/r7/w4-stopped-execution-boundary.json"
HISTORICAL_STATE_PATH = "docs/rebuild/r7/w4-execution-state.json"
HISTORICAL_EVIDENCE_ROOT = "docs/rebuild/r7/execution-evidence"
_COMMIT = re.compile(r"[0-9a-f]{40}")
_BLOB = re.compile(r"[0-9a-f]{40}")
_HASH = re.compile(r"[0-9a-f]{64}")
_ALLOWED_SUFFIXES = {".md", ".json", ".py", ".gd"}
_ATTEMPT_ERRORS = [
    '[url]modules\\gdscript\\gdscript_resource_format.cpp:46[/url] - Failed to load script "res://src/main.gd" with error "Parse error".',
    '[url]res://src/main.gd:100[/url] - Parse Error: Cannot infer the type of "supported" variable because the value doesn\'t have a set type.',
    '[url]res://src/main.gd:87[/url] - Parse Error: Cannot infer the type of "resource_type" variable because the value doesn\'t have a set type.',
    '[url]res://src/main.gd:87[/url] - Parse Error: Static function "get_resource_type()" not found in base "GDScriptNativeClass".',
]


def _git(*args: str, binary: bool = False, check: bool = True) -> bytes | str:
    result = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=not binary)
    if check and result.returncode:
        error = result.stderr if isinstance(result.stderr, str) else result.stderr.decode("utf-8", errors="replace")
        raise RuntimeError(error.strip() or "git command failed")
    return result.stdout if binary else result.stdout.strip()


def _canonical(data: bytes) -> bytes:
    return data.replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def _file_data(path: Path) -> bytes:
    return _canonical(path.read_bytes())


def _blob_data(blob: str) -> bytes:
    return _canonical(_git("cat-file", "blob", blob, binary=True))


def _is_ancestor(ancestor: str, descendant: str) -> bool:
    return subprocess.run(
        ["git", "merge-base", "--is-ancestor", ancestor, descendant],
        cwd=ROOT,
        capture_output=True,
    ).returncode == 0


def _safe_exact_path(relative: str) -> bool:
    return (
        bool(relative)
        and not Path(relative).is_absolute()
        and ".." not in Path(relative).parts
        and not any(marker in relative for marker in "*?[]")
        and "\\" not in relative
    )


def _exists_at_base(relative: str) -> bool:
    return subprocess.run(
        ["git", "cat-file", "-e", BASE_REVISION + ":" + relative],
        cwd=ROOT,
        capture_output=True,
    ).returncode == 0


def _change_kind(relative: str) -> str:
    return "MODIFIED" if _exists_at_base(relative) else "ADDED"


def _current_record(relative: str) -> dict[str, Any]:
    data = _file_data(ROOT / relative)
    return {
        "path": relative,
        "change": _change_kind(relative),
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "git_blob": str(_git("hash-object", "--", relative)),
    }


def _revision_record(relative: str, revision: str) -> dict[str, Any]:
    blob = str(_git("rev-parse", revision + ":" + relative))
    data = _blob_data(blob)
    return {
        "path": relative,
        "revision": revision,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "git_blob": blob,
    }


def _manifest_payload_sha256(value: Mapping[str, Any]) -> str:
    payload = dict(value)
    payload.pop("manifest_payload_sha256", None)
    data = (json.dumps(payload, sort_keys=True, separators=(",", ":"), ensure_ascii=True) + "\n").encode("utf-8")
    return hashlib.sha256(data).hexdigest()


def _working_changed_paths() -> set[str]:
    tracked = str(_git("diff", "--name-only", "HEAD", "--"))
    untracked = str(_git("ls-files", "--others", "--exclude-standard"))
    return {line for line in (tracked + "\n" + untracked).splitlines() if line}


def _published_changed_paths(source_revision: str) -> set[str]:
    output = str(_git("diff", "--name-only", BASE_REVISION, source_revision, "--"))
    return {line for line in output.splitlines() if line}


def _staged_paths() -> tuple[str, ...]:
    output = str(_git("diff", "--cached", "--name-only", "--"))
    return tuple(sorted(line for line in output.splitlines() if line))


def _staged_snapshot() -> dict[str, tuple[str, bytes]]:
    snapshot: dict[str, tuple[str, bytes]] = {}
    for relative in _staged_paths():
        try:
            blob = str(_git("rev-parse", ":" + relative))
            snapshot[relative] = (blob, _blob_data(blob))
        except RuntimeError:
            snapshot[relative] = ("", b"")
    return snapshot


def _source_record(
    relative: str,
    mode: str,
    source_revision: str,
    staged_snapshot: Mapping[str, tuple[str, bytes]],
) -> tuple[str, bytes] | None:
    if mode == "staged":
        return staged_snapshot.get(relative)
    if mode == "published":
        try:
            blob = str(_git("rev-parse", source_revision + ":" + relative))
            return blob, _blob_data(blob)
        except RuntimeError:
            return None
    path = ROOT / relative
    if not path.is_file():
        return None
    return str(_git("hash-object", "--", relative)), _file_data(path)


def _canonical_manifest_bytes(value: Mapping[str, Any]) -> bytes:
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n").encode("utf-8")


def _selected_mode(mode: str, source_revision: str) -> tuple[str | None, tuple[str, ...]]:
    if mode in VALIDATION_MODES:
        return mode, ()
    if mode != "auto":
        return None, ("W4 correction validation mode is unsupported: " + mode,)
    if _staged_paths():
        return None, ("W4 correction staged content requires explicit staged-validation mode",)
    return ("published" if source_revision != BASE_REVISION else "preparation"), ()


def admitted_paths(value: Mapping[str, Any]) -> tuple[str, ...]:
    rows = value.get("artifacts", [])
    paths = [str(row.get("path", "")) for row in rows if isinstance(row, Mapping)] if isinstance(rows, list) else []
    manifest = str(value.get("manifest_path", ""))
    if manifest:
        paths.append(manifest)
    return tuple(sorted(paths))


def scanner_admits(relative: str, admitted: Sequence[str]) -> bool:
    return relative in set(admitted)


def _record_issues(
    row: Mapping[str, Any],
    relative: str,
    mode: str,
    source_revision: str,
    staged_snapshot: Mapping[str, tuple[str, bytes]],
) -> list[str]:
    issues: list[str] = []
    if row.get("path") != relative or row.get("change") != _change_kind(relative):
        issues.append("correction artifact path/change differs: " + relative)
    if Path(relative).suffix.lower() not in _ALLOWED_SUFFIXES:
        issues.append("correction artifact type is not admitted: " + relative)
    selected = _source_record(relative, mode, source_revision, staged_snapshot)
    if selected is None:
        return issues + ["correction artifact is missing from selected lifecycle source: " + relative]
    blob, data = selected
    if row.get("bytes") != len(data) or _HASH.fullmatch(str(row.get("sha256", ""))) is None or row.get("sha256") != hashlib.sha256(data).hexdigest():
        issues.append("correction artifact content identity differs: " + relative)
    if _BLOB.fullmatch(str(row.get("git_blob", ""))) is None or row.get("git_blob") != blob:
        issues.append("correction artifact Git blob differs: " + relative)
    if _exists_at_base(relative):
        base_blob = str(_git("rev-parse", BASE_REVISION + ":" + relative))
        if base_blob == blob:
            issues.append("correction artifact does not differ from the authorized base: " + relative)
    return issues


def _diagnostic_issues(
    mode: str,
    source_revision: str,
    staged_snapshot: Mapping[str, tuple[str, bytes]],
) -> list[str]:
    selected = _source_record(ENVIRONMENT_DEFECT_PATH, mode, source_revision, staged_snapshot)
    if selected is None:
        return ["W4 human-review environment defect diagnostic is missing"]
    try:
        value = json.loads(selected[1].decode("utf-8-sig"))
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        return ["W4 human-review environment defect diagnostic is malformed: " + str(exc)]
    issues: list[str] = []
    if (
        value.get("schema_version") != "prd07-w4-human-review-environment-defect-v1"
        or value.get("finding_id") != "W4-HUMAN-REVIEW-ENVIRONMENT-DEFECT-001"
        or value.get("finding_class") != "REVIEW-ENVIRONMENT-PRECONDITION-DEFECT"
        or value.get("source_revision") != BASE_REVISION
    ):
        issues.append("W4 human-review environment diagnostic identity differs")
    disposition = value.get("attempt_disposition", {})
    if (
        not isinstance(disposition, Mapping)
        or disposition.get("human_review_status") != "NOT-PERFORMED"
        or disposition.get("human_judgement_recorded") is not False
        or disposition.get("proof_observation_created") is not False
        or disposition.get("proof_execution_started") is not False
        or disposition.get("identity_allocation_started") is not False
    ):
        issues.append("W4 failed review attempt was reinterpreted as review or execution")
    review_records = value.get("review_records", {})
    if review_records != {
        "attestation": "UNSIGNED",
        "judgement": "PENDING",
        "origin_mapping": "PENDING-SEPARATE-ADJUDICATION",
        "review_purpose": "UNASSIGNED",
        "status": "PENDING-HUMAN-REVIEW",
    }:
        issues.append("W4 diagnostic review-record state differs")
    attempts = value.get("attempts", [])
    if (
        not isinstance(attempts, list)
        or len(attempts) != 2
        or not isinstance(attempts[0], Mapping)
        or not isinstance(attempts[1], Mapping)
        or attempts[0].get("status") != "NOT-A-HUMAN-REVIEW-ROUTE"
        or attempts[1].get("status") != "PARSE-FAILED-BEFORE-RUNTIME"
        or attempts[1].get("errors_exact") != _ATTEMPT_ERRORS
    ):
        issues.append("W4 diagnostic failed-attempt routes or exact errors differ")
    build = value.get("build_identity_at_attempt", {})
    renderer = value.get("renderer_at_attempt", {})
    profile = value.get("profile_at_attempt", {})
    if (
        not isinstance(build, Mapping)
        or build.get("artifact_path") is not None
        or build.get("artifact_sha256") is not None
        or build.get("build_identity") is not None
        or build.get("export_template_identity") is not None
        or not isinstance(renderer, Mapping)
        or renderer.get("runtime_session_started") is not False
        or renderer.get("actual_renderer") is not None
        or not isinstance(profile, Mapping)
        or profile.get("isolated_profile") is not False
    ):
        issues.append("W4 diagnostic invents an attempt build, renderer, or isolated profile")
    future = value.get("future_owner_route", {})
    repair = value.get("repair", {})
    verification = value.get("repair_verification", {})
    if (
        not isinstance(future, Mapping)
        or future.get("owner_retry_state")
        != "DEFERRED-PENDING-PUBLICATION-EXACT-SHA-CI-EXACT-BUILD-AND-FUTURE-REVIEW-BINDING"
        or future.get("fresh_human_review_authorization_required") is not True
        or future.get("governed_forms_modified_by_presenter") is not False
        or not isinstance(repair, Mapping)
        or repair.get("state") != "PREPARED-NOT-PUBLISHED"
        or not isinstance(verification, Mapping)
        or verification.get("classification")
        != "SYNTHETIC-REVIEW-PREFLIGHT-NOT-HUMAN-REVIEW-NOT-PROOF-OBSERVATION"
        or verification.get("forms_modified") is not False
        or verification.get("proof_execution_started") is not False
    ):
        issues.append("W4 diagnostic repair or future owner-review gate differs")
    return issues


def _predecessor_issues() -> list[str]:
    try:
        blob = str(_git("rev-parse", BASE_REVISION + ":" + PUBLISHED_INTEGRATION_MANIFEST.relative_to(ROOT).as_posix()))
        value = json.loads(_blob_data(blob).decode("utf-8-sig"))
        return ["published integration repair: " + issue for issue in published_integration_issues(value, BASE_REVISION, mode="published")]
    except (RuntimeError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        return ["published integration repair cannot be verified: " + str(exc)]


def manifest_issues(
    value: Mapping[str, Any],
    source_revision: str | None = None,
    *,
    mode: str = "preparation",
) -> tuple[str, ...]:
    issues: list[str] = []
    source_revision = source_revision or str(_git("rev-parse", "HEAD"))
    selected_mode, mode_issues = _selected_mode(mode, source_revision)
    issues.extend(mode_issues)
    if selected_mode is None:
        return tuple(sorted(set(issues)))
    staged_snapshot = _staged_snapshot() if selected_mode == "staged" else {}
    expected_modes = {
        "preparation": {"content_source": "WORKING-TREE", "index_rule": "EMPTY", "pass_state": VALIDATION_STATES["preparation"]},
        "staged": {"content_source": "GIT-INDEX-BLOBS", "index_rule": "EXACT-MANIFEST-PATH-SET", "pass_state": VALIDATION_STATES["staged"]},
        "published": {"content_source": "EXACT-COMMIT-TREE", "index_rule": "NOT-AUTHORITY", "pass_state": VALIDATION_STATES["published"]},
    }
    if (
        value.get("schema_version") != "prd07-w4-correction-admission-v1"
        or value.get("manifest_version") != 1
        or value.get("package") != "R7-W4-INTEGRATION-LIFECYCLE-AND-HUMAN-REVIEW-PRESENTATION-CORRECTION"
        or value.get("lifecycle_role") != "PREPARED-UNPUBLISHED-APPEND-ONLY-CORRECTION-ADMISSION"
        or value.get("state") != "PASS-PREPARED-NOT-STAGED"
        or value.get("base_revision") != BASE_REVISION
        or value.get("validation_law") != "EXACT-PATH-HASH-PINNED-FAIL-CLOSED"
        or value.get("validation_modes") != expected_modes
    ):
        issues.append("W4 correction admission identity/status differs")
    head = str(_git("rev-parse", "HEAD"))
    if _COMMIT.fullmatch(source_revision) is None or not _is_ancestor(BASE_REVISION, source_revision):
        issues.append("W4 correction source is not a descendant of the authorized base")
    elif selected_mode in ("preparation", "staged") and (source_revision != BASE_REVISION or head != BASE_REVISION):
        issues.append("W4 correction unpublished source does not equal the authorized base revision")
    elif selected_mode == "published":
        if source_revision == BASE_REVISION:
            issues.append("W4 correction published source is not a later exact commit")
        try:
            parents = str(_git("rev-list", "--parents", "-n", "1", source_revision)).split()
            if parents != [source_revision, BASE_REVISION]:
                issues.append("W4 correction published exact commit parent differs from the authorized base")
        except RuntimeError:
            issues.append("W4 correction published exact commit parent cannot be resolved")
    if value.get("manifest_path") != MANIFEST_PATH.relative_to(ROOT).as_posix():
        issues.append("W4 correction manifest path differs")
    if value.get("manifest_payload_sha256") != _manifest_payload_sha256(value):
        issues.append("W4 correction manifest payload identity differs")
    selected_manifest = _source_record(
        MANIFEST_PATH.relative_to(ROOT).as_posix(), selected_mode, source_revision, staged_snapshot
    )
    if selected_manifest is None:
        issues.append("W4 correction manifest is missing from the selected lifecycle source")
    else:
        manifest_blob, manifest_data = selected_manifest
        if _BLOB.fullmatch(manifest_blob) is None:
            issues.append("W4 correction manifest Git blob is invalid")
        try:
            selected_value = json.loads(manifest_data.decode("utf-8-sig"))
            if selected_value != value:
                issues.append("W4 correction manifest differs from selected lifecycle source")
        except (UnicodeDecodeError, json.JSONDecodeError):
            issues.append("W4 correction manifest is not valid JSON in selected lifecycle source")
        if manifest_data != _canonical_manifest_bytes(value):
            issues.append("W4 correction manifest encoding is not canonical in selected lifecycle source")
    if value.get("broad_prefix_exclusions") != [] or value.get("wildcard_admissions") != [] or value.get("scanner_bypasses") != []:
        issues.append("W4 correction admission contains a broad or wildcard bypass")
    if (
        value.get("issued_run_high_water") != 72
        or value.get("issued_evidence_high_water") != 72
        or value.get("package_allocated_run_ids") != []
        or value.get("package_allocated_evidence_ids") != []
        or value.get("proof_execution_started") is not False
        or value.get("identity_allocation_started") is not False
        or value.get("proof_observation_created") is not False
        or value.get("execution_gate") != "CLOSED-PENDING-SEPARATE-PUBLICATION-CI-BUILD-REVIEW-BINDING-AND-RERUN-AUTHORIZATION"
    ):
        issues.append("W4 correction crossed execution or identity closure")
    if value.get("fcc13e") != {
        "proofs": ["PRD04-PROOF-57", "PRD04-PROOF-58"],
        "proof_observations_created": 0,
        "observed_rows": {"PRD04-PROOF-57": 0, "PRD04-PROOF-58": 0},
        "future_rule": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER",
    }:
        issues.append("W4 correction FCC-13E closure differs")
    preview = value.get("rerun_preview")
    proofs = [50, 51, 53, 55, 56, 57, 58, 59, 60, 61, 62, 71]
    expected_preview = [
        {
            "proof_id": "PRD04-PROOF-%02d" % proof,
            "run_id": "PRD07-RUN-%04d" % identity,
            "evidence_id": "PRD07-EVID-%04d" % identity,
            "state": "PREVIEW-NOT-ALLOCATED",
        }
        for proof, identity in zip(proofs, range(73, 85))
    ]
    if preview != expected_preview:
        issues.append("W4 correction rerun identities are not exact preview-only rows")

    rows = value.get("artifacts")
    actual_paths = [str(row.get("path", "")) for row in rows if isinstance(row, Mapping)] if isinstance(rows, list) else []
    if not isinstance(rows, list) or actual_paths != list(ARTIFACT_PATHS) or len(actual_paths) != len(rows):
        issues.append("W4 correction artifact path set/order differs")
    else:
        for row, relative in zip(rows, ARTIFACT_PATHS):
            if not _safe_exact_path(relative):
                issues.append("W4 correction path is not exact/safe: " + relative)
            if isinstance(row, Mapping):
                issues.extend(_record_issues(row, relative, selected_mode, source_revision, staged_snapshot))
    admitted = admitted_paths(value)
    if admitted != tuple(sorted(PACKAGE_PATHS)):
        issues.append("W4 correction scanner admission does not equal exact package paths")

    expected_changed = set(admitted)
    if selected_mode == "preparation":
        changed = _working_changed_paths()
        permitted_nonpackage = set(PROTECTED_LOCAL_PATHS).union(DIAGNOSTIC_PATHS)
        package_changed = changed.difference(permitted_nonpackage)
        missing = sorted(expected_changed.difference(package_changed))
        unexpected = sorted(package_changed.difference(expected_changed))
        if missing:
            issues.append("W4 correction package paths are not all changed: " + ", ".join(missing))
        if unexpected:
            issues.append("W4 correction has unexpected changed paths: " + ", ".join(unexpected))
        staged = _staged_paths()
        if staged:
            issues.append("W4 correction preparation contains staged paths: " + ", ".join(staged))
    elif selected_mode == "staged":
        changed = set(staged_snapshot)
        missing = sorted(expected_changed.difference(changed))
        unexpected = sorted(changed.difference(expected_changed))
        if missing:
            issues.append("W4 correction is missing staged paths: " + ", ".join(missing))
        if unexpected:
            issues.append("W4 correction has extra staged paths: " + ", ".join(unexpected))
        prohibited = sorted(changed.intersection(set(PROTECTED_LOCAL_PATHS).union(DIAGNOSTIC_PATHS)))
        if prohibited:
            issues.append("W4 correction index contains protected or blocked-diagnostic paths: " + ", ".join(prohibited))
        execution_paths = sorted(
            relative
            for relative in changed
            if relative == HISTORICAL_STATE_PATH
            or relative == HISTORICAL_EVIDENCE_ROOT
            or relative.startswith(HISTORICAL_EVIDENCE_ROOT + "/")
            or re.search(r"PRD07-(?:RUN|EVID)-\d{4}", relative)
        )
        if execution_paths:
            issues.append("W4 correction index contains execution/evidence identity paths: " + ", ".join(execution_paths))
    else:
        changed = _published_changed_paths(source_revision)
        missing = sorted(expected_changed.difference(changed))
        unexpected = sorted(changed.difference(expected_changed))
        if missing:
            issues.append("W4 correction published exact commit is missing paths: " + ", ".join(missing))
        if unexpected:
            issues.append("W4 correction published exact commit has extra paths: " + ", ".join(unexpected))

    expected_predecessor = _revision_record(PUBLISHED_INTEGRATION_MANIFEST.relative_to(ROOT).as_posix(), BASE_REVISION)
    if value.get("published_integration_repair_admission") != expected_predecessor:
        issues.append("W4 correction does not bind exact published integration predecessor")
    issues.extend(_predecessor_issues())
    expected_forms = [_revision_record(relative, BASE_REVISION) for relative in REVIEW_FORM_PATHS]
    if value.get("unchanged_pending_review_forms") != expected_forms:
        issues.append("W4 correction pending review-form bindings differ")
    else:
        target = source_revision if selected_mode == "published" else BASE_REVISION
        for row, relative in zip(expected_forms, REVIEW_FORM_PATHS):
            if str(_git("rev-parse", target + ":" + relative)) != row["git_blob"]:
                issues.append("W4 correction changed a governed pending review form: " + relative)
    issues.extend(_diagnostic_issues(selected_mode, source_revision, staged_snapshot))
    dirty_protected = set(PROTECTED_LOCAL_PATHS).intersection(_working_changed_paths()) if selected_mode != "published" else set()
    if dirty_protected:
        issues.extend(protected_local_issues())
    if value.get("protected_local_path_count") != 9:
        issues.append("W4 correction protected local path count differs")
    if (
        value.get("failed_review_attempt")
        != "ENVIRONMENT-PRECONDITION-DEFECT-NOT-HUMAN-JUDGEMENT-NOT-PROOF-OBSERVATION"
        or value.get("review_route_state") != "REPAIR-PREPARED-NOT-PUBLISHED-OWNER-RETRY-DEFERRED"
        or value.get("production_runtime") != "ABSENT"
        or value.get("gameplay_permission") != "CLOSED"
        or value.get("w5") != "CLOSED-NOT-READY"
        or value.get("r7_final") != "CLOSED"
        or value.get("prd08_submission") != "NOT-SUBMITTED"
        or value.get("prd09") != "CLOSED"
        or value.get("r8") != "CLOSED"
    ):
        issues.append("W4 correction review or later-programme closure differs")
    issues.extend(_historical_issues(selected_mode, source_revision))
    issues.extend(_identity_issues(selected_mode, source_revision))
    return tuple(sorted(set(issues)))


def build_manifest() -> dict[str, Any]:
    diagnostics = []
    for relative in DIAGNOSTIC_PATHS:
        path = ROOT / relative
        row: dict[str, Any] = {
            "path": relative,
            "disposition": "EXCLUDED-UNTRACKED-BLOCKED-ATTEMPT-REVIEW-OUTPUT",
            "observed_bytes": None,
            "observed_sha256": None,
        }
        if path.is_file():
            data = _file_data(path)
            row.update({"observed_bytes": len(data), "observed_sha256": hashlib.sha256(data).hexdigest()})
        diagnostics.append(row)
    proofs = [50, 51, 53, 55, 56, 57, 58, 59, 60, 61, 62, 71]
    value: dict[str, Any] = {
        "schema_version": "prd07-w4-correction-admission-v1",
        "manifest_version": 1,
        "package": "R7-W4-INTEGRATION-LIFECYCLE-AND-HUMAN-REVIEW-PRESENTATION-CORRECTION",
        "lifecycle_role": "PREPARED-UNPUBLISHED-APPEND-ONLY-CORRECTION-ADMISSION",
        "state": "PASS-PREPARED-NOT-STAGED",
        "base_revision": BASE_REVISION,
        "manifest_path": MANIFEST_PATH.relative_to(ROOT).as_posix(),
        "validation_law": "EXACT-PATH-HASH-PINNED-FAIL-CLOSED",
        "validation_modes": {
            "preparation": {"content_source": "WORKING-TREE", "index_rule": "EMPTY", "pass_state": VALIDATION_STATES["preparation"]},
            "staged": {"content_source": "GIT-INDEX-BLOBS", "index_rule": "EXACT-MANIFEST-PATH-SET", "pass_state": VALIDATION_STATES["staged"]},
            "published": {"content_source": "EXACT-COMMIT-TREE", "index_rule": "NOT-AUTHORITY", "pass_state": VALIDATION_STATES["published"]},
        },
        "broad_prefix_exclusions": [],
        "wildcard_admissions": [],
        "scanner_bypasses": [],
        "artifacts": [_current_record(relative) for relative in ARTIFACT_PATHS],
        "published_integration_repair_admission": _revision_record(
            PUBLISHED_INTEGRATION_MANIFEST.relative_to(ROOT).as_posix(), BASE_REVISION
        ),
        "unchanged_pending_review_forms": [_revision_record(relative, BASE_REVISION) for relative in REVIEW_FORM_PATHS],
        "excluded_blocked_attempt_diagnostics": diagnostics,
        "failed_review_attempt": "ENVIRONMENT-PRECONDITION-DEFECT-NOT-HUMAN-JUDGEMENT-NOT-PROOF-OBSERVATION",
        "review_route_state": "REPAIR-PREPARED-NOT-PUBLISHED-OWNER-RETRY-DEFERRED",
        "protected_local_path_count": len(PROTECTED_LOCAL_PATHS),
        "issued_run_high_water": 72,
        "issued_evidence_high_water": 72,
        "package_allocated_run_ids": [],
        "package_allocated_evidence_ids": [],
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "proof_observation_created": False,
        "rerun_preview": [
            {
                "proof_id": "PRD04-PROOF-%02d" % proof,
                "run_id": "PRD07-RUN-%04d" % identity,
                "evidence_id": "PRD07-EVID-%04d" % identity,
                "state": "PREVIEW-NOT-ALLOCATED",
            }
            for proof, identity in zip(proofs, range(73, 85))
        ],
        "fcc13e": {
            "proofs": ["PRD04-PROOF-57", "PRD04-PROOF-58"],
            "proof_observations_created": 0,
            "observed_rows": {"PRD04-PROOF-57": 0, "PRD04-PROOF-58": 0},
            "future_rule": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER",
        },
        "execution_gate": "CLOSED-PENDING-SEPARATE-PUBLICATION-CI-BUILD-REVIEW-BINDING-AND-RERUN-AUTHORIZATION",
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
        "w5": "CLOSED-NOT-READY",
        "r7_final": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
    }
    value["manifest_payload_sha256"] = _manifest_payload_sha256(value)
    return value


def write_manifest() -> dict[str, Any]:
    staged = _staged_paths()
    if staged:
        raise ValueError("preparation build requires an empty index; staged paths: " + ", ".join(staged))
    if str(_git("rev-parse", "HEAD")) != BASE_REVISION:
        raise ValueError("preparation build requires authorized base revision " + BASE_REVISION)
    value = build_manifest()
    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST_PATH.write_bytes(_canonical_manifest_bytes(value))
    return value


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Prepare or verify the W4 correction admission")
    parser.add_argument("action", choices=("build", "verify"))
    parser.add_argument("--mode", choices=ORCHESTRATION_MODES, required=True)
    parser.add_argument("--source-revision")
    args = parser.parse_args(argv)
    try:
        value = write_manifest() if args.action == "build" else json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig"))
        issues = manifest_issues(value, args.source_revision, mode=args.mode)
        result = {
            "status": "PASS" if not issues else "FAIL",
            "state": VALIDATION_STATES.get(args.mode, value.get("state")) if not issues else "FAIL-CLOSED",
            "mode": args.mode,
            "source_revision": args.source_revision or str(_git("rev-parse", "HEAD")),
            "issues": list(issues),
            "admitted_paths": list(admitted_paths(value)),
            "issued_run_high_water": value.get("issued_run_high_water"),
            "issued_evidence_high_water": value.get("issued_evidence_high_water"),
            "proof_execution_started": value.get("proof_execution_started"),
            "identity_allocation_started": value.get("identity_allocation_started"),
        }
    except BaseException as exc:
        result = {"status": "FAIL", "state": "FAIL-CLOSED", "error_type": type(exc).__name__, "error": str(exc)}
    print(json.dumps(result, indent=2, sort_keys=True, ensure_ascii=True))
    return 0 if result.get("status") == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
