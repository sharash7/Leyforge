"""Lifecycle-explicit exact-path admission for the W4 integration repair.

Preparation reads working-tree content and requires an empty index.  Staged
validation reads only exact index blobs.  Published validation reads only an
exact commit tree.  No mode opens proof execution or allocates an identity.
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
from tools.r7_w4_execution.contracts import PROTECTED_LOCAL_PATHS, ROOT, protected_local_issues
from tools.r7_w4_repair.admission import (
    MANIFEST_PATH as PUBLISHED_REPAIR_MANIFEST,
    PUBLISHED_ADMISSION_COMMIT,
    published_superseded_paths,
)


BASE_REVISION = PUBLISHED_ADMISSION_COMMIT
MANIFEST_PATH = ROOT / "docs/rebuild/r7/w4-integration-repair-admission-boundary.json"
MODE_ENV = "LEYFORGE_W4_INTEGRATION_ADMISSION_MODE"
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
PACKAGE_PATHS = (
    "docs/rebuild/r7/w4-integration-repair-admission-boundary.json",
    "proofs/r7/w4_human_review/README.md",
    "proofs/r7/w4_human_review/human-review.schema.json",
    "proofs/r7/w4_human_review/proof-50-pending.json",
    "proofs/r7/w4_human_review/proof-51-origin-mapping-pending.json",
    "proofs/r7/w4_human_review/proof-51-pending.json",
    "proofs/r7/w4_human_review/proof-53-pending.json",
    "tools/r7_w4_execution/contracts.py",
    "tools/r7_w4_execution/evidence.py",
    "tools/r7_w4_execution/observations.py",
    "tools/r7_w4_repair/admission.py",
    "tools/r7_w4_repair/human_review.py",
    "tools/r7_w4_repair/integration_admission.py",
    "tools/r7_w4_repair/readiness.py",
    "tools/r7_w4_repair_audit.py",
    "tools/r7_w4_stop_audit.py",
    "tools/tests/test_r7_w4_execution.py",
    "tools/tests/test_r7_w4_integration_repair.py",
    "tools/tests/test_r7_w4_repair.py",
    "tools/tests/test_r7_w4_repair_admission.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
)
ARTIFACT_PATHS = tuple(path for path in PACKAGE_PATHS if path != MANIFEST_PATH.relative_to(ROOT).as_posix())
EXPECTED_SUPERSEDED_COUNT = 6
_COMMIT = re.compile(r"[0-9a-f]{40}")
_BLOB = re.compile(r"[0-9a-f]{40}")
_HASH = re.compile(r"[0-9a-f]{64}")
_ALLOWED_SUFFIXES = {".md", ".json", ".py"}
HISTORICAL_BOUNDARY_PATH = "docs/rebuild/r7/w4-stopped-execution-boundary.json"
HISTORICAL_STATE_PATH = "docs/rebuild/r7/w4-execution-state.json"
HISTORICAL_EVIDENCE_ROOT = "docs/rebuild/r7/execution-evidence"
HISTORICAL_PATHS = (
    HISTORICAL_BOUNDARY_PATH,
    HISTORICAL_STATE_PATH,
    HISTORICAL_EVIDENCE_ROOT,
)


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
    path = ROOT / relative
    data = _file_data(path)
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
        return None, ("W4 integration repair validation mode is unsupported: " + mode,)
    if _staged_paths():
        return None, (
            "W4 integration repair staged content requires explicit staged-validation mode",
        )
    return ("published" if source_revision != BASE_REVISION else "preparation"), ()


def admitted_paths(value: Mapping[str, Any]) -> tuple[str, ...]:
    rows = value.get("artifacts", [])
    paths = [str(row.get("path", "")) for row in rows if isinstance(row, Mapping)] if isinstance(rows, list) else []
    manifest_path = str(value.get("manifest_path", ""))
    if manifest_path:
        paths.append(manifest_path)
    return tuple(sorted(set(paths)))


def scanner_admits(relative: str, paths: Iterable[str]) -> bool:
    return relative in frozenset(paths)


def _record_issues(
    row: Mapping[str, Any],
    relative: str,
    mode: str,
    source_revision: str,
    staged_snapshot: Mapping[str, tuple[str, bytes]],
) -> list[str]:
    issues: list[str] = []
    if row.get("path") != relative or row.get("change") != _change_kind(relative):
        issues.append("integration artifact path/change differs: " + relative)
    if Path(relative).suffix.lower() not in _ALLOWED_SUFFIXES:
        issues.append("integration artifact type is not admitted: " + relative)
    selected = _source_record(relative, mode, source_revision, staged_snapshot)
    if selected is None:
        return issues + ["integration artifact is missing: " + relative]
    blob, data = selected
    if len(data) != row.get("bytes") or hashlib.sha256(data).hexdigest() != row.get("sha256"):
        issues.append("integration artifact content identity differs: " + relative)
    if _BLOB.fullmatch(str(row.get("git_blob", ""))) is None or blob != row.get("git_blob"):
        issues.append("integration artifact Git blob differs: " + relative)
    if _exists_at_base(relative):
        base_blob = str(_git("rev-parse", BASE_REVISION + ":" + relative))
        if base_blob == blob:
            issues.append("integration artifact does not differ from the published base: " + relative)
    return issues


def _historical_issues(mode: str, source_revision: str) -> list[str]:
    issues: list[str] = []
    try:
        predecessor_blob = str(_git("rev-parse", BASE_REVISION + ":" + PUBLISHED_REPAIR_MANIFEST.relative_to(ROOT).as_posix()))
        predecessor = json.loads(_blob_data(predecessor_blob).decode("utf-8-sig"))
        historical = predecessor.get("historical_evidence", {})
        observation_commit = str(historical.get("observation_commit", "")) if isinstance(historical, Mapping) else ""
        expected_state_blob = str(historical.get("state_blob", "")) if isinstance(historical, Mapping) else ""
        expected_evidence_tree = str(historical.get("evidence_tree", "")) if isinstance(historical, Mapping) else ""
        if (
            _COMMIT.fullmatch(observation_commit) is None
            or _BLOB.fullmatch(expected_state_blob) is None
            or _BLOB.fullmatch(expected_evidence_tree) is None
        ):
            return ["W4 integration repair published historical evidence authority is malformed"]
        if str(_git("rev-parse", observation_commit + ":" + HISTORICAL_STATE_PATH)) != expected_state_blob:
            issues.append("W4 integration repair historical stopped state differs at its observation authority")
        if str(_git("rev-parse", observation_commit + ":" + HISTORICAL_EVIDENCE_ROOT)) != expected_evidence_tree:
            issues.append("W4 integration repair historical evidence tree differs at its observation authority")

        target_revision = source_revision if mode == "published" else "HEAD"
        if str(_git("rev-parse", target_revision + ":" + HISTORICAL_STATE_PATH)) != expected_state_blob:
            issues.append("W4 integration repair historical stopped state changed in the selected lifecycle source")
        if str(_git("rev-parse", target_revision + ":" + HISTORICAL_EVIDENCE_ROOT)) != expected_evidence_tree:
            issues.append("W4 integration repair historical evidence changed in the selected lifecycle source")
        expected_boundary_blob = str(_git("rev-parse", BASE_REVISION + ":" + HISTORICAL_BOUNDARY_PATH))
        if str(_git("rev-parse", target_revision + ":" + HISTORICAL_BOUNDARY_PATH)) != expected_boundary_blob:
            issues.append("W4 integration repair historical stopped boundary changed in the selected lifecycle source")

        if mode == "published":
            difference = subprocess.run(
                ["git", "diff", "--quiet", BASE_REVISION, source_revision, "--", *HISTORICAL_PATHS],
                cwd=ROOT,
                capture_output=True,
            )
            if difference.returncode != 0:
                issues.append("W4 integration repair published commit changes historical stopped evidence")
        else:
            status = str(_git("status", "--porcelain=v1", "--untracked-files=all", "--", *HISTORICAL_PATHS))
            if status:
                issues.append("W4 integration repair working/index state changes historical stopped evidence")
    except (RuntimeError, UnicodeDecodeError, json.JSONDecodeError) as exc:
        issues.append("W4 integration repair historical stopped evidence is ambiguous: " + str(exc))
    return issues


def _identity_issues(mode: str, source_revision: str) -> list[str]:
    issues: list[str] = []
    try:
        if mode == "published":
            state_blob = str(_git("rev-parse", source_revision + ":" + HISTORICAL_STATE_PATH))
            state = json.loads(_blob_data(state_blob).decode("utf-8-sig"))
        else:
            registry = inspect_execution_registry(ROOT)
            if registry.max_run_number != 72 or registry.max_evidence_number != 72:
                issues.append("integration repair registry high-water is not RUN/EVID 0072")
            if any(int(value.rsplit("-", 1)[1]) >= 73 for value in (*registry.run_ids, *registry.evidence_ids)):
                issues.append("integration repair observed a 0073+ issued identity")
            state = json.loads((ROOT / HISTORICAL_STATE_PATH).read_text(encoding="utf-8-sig"))
        expected_runs = ["PRD07-RUN-%04d" % value for value in range(66, 73)]
        expected_evidence = ["PRD07-EVID-%04d" % value for value in range(66, 73)]
        if state.get("allocated_run_ids") != expected_runs or state.get("allocated_evidence_ids") != expected_evidence:
            issues.append("integration repair canonical W4 allocated arrays differ from 0066-0072")
    except (OSError, RuntimeError, UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        issues.append("integration repair canonical W4 state cannot be read: " + str(exc))
    suffix: list[str] = []
    if mode == "published":
        try:
            listing = str(_git("ls-tree", "-r", "--name-only", source_revision, "--", HISTORICAL_EVIDENCE_ROOT))
            for relative in listing.splitlines():
                for part in Path(relative).parts:
                    match = re.fullmatch(r"PRD07-RUN-(\d{4})", part)
                    if match and int(match.group(1)) >= 73:
                        suffix.append(part)
        except RuntimeError as exc:
            issues.append("integration repair published evidence tree cannot be inspected: " + str(exc))
    else:
        for path in (ROOT / HISTORICAL_EVIDENCE_ROOT).glob("PRD07-RUN-*"):
            match = re.fullmatch(r"PRD07-RUN-(\d{4})", path.name)
            if path.is_dir() and match and int(match.group(1)) >= 73:
                suffix.append(path.name)
    if suffix:
        issues.append("integration repair observed 0073+ evidence paths: " + ", ".join(sorted(suffix)))
    return issues


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
        value.get("schema_version") != "prd07-w4-integration-repair-admission-v1"
        or value.get("manifest_version") != 1
        or value.get("package") != "R7-W4-READINESS-AUDIT-HUMAN-REVIEW-INTEGRATION-REPAIR"
        or value.get("lifecycle_role") != "PREPARED-UNPUBLISHED-APPEND-ONLY-REPAIR-ADMISSION"
        or value.get("state") != "PASS-PREPARED-NOT-STAGED"
        or value.get("base_revision") != BASE_REVISION
        or value.get("validation_law") != "EXACT-PATH-HASH-PINNED-FAIL-CLOSED"
        or value.get("validation_modes") != expected_modes
    ):
        issues.append("W4 integration repair admission identity/status differs")
    head = str(_git("rev-parse", "HEAD"))
    if _COMMIT.fullmatch(source_revision) is None or not _is_ancestor(BASE_REVISION, source_revision):
        issues.append("W4 integration repair source is not a descendant of the published base")
    elif selected_mode in ("preparation", "staged") and (source_revision != BASE_REVISION or head != BASE_REVISION):
        issues.append("W4 integration repair unpublished source does not equal the authorized base revision")
    elif selected_mode == "published":
        if source_revision == BASE_REVISION:
            issues.append("W4 integration repair published source is not a later exact commit")
        try:
            if str(_git("rev-parse", source_revision + "^")) != BASE_REVISION:
                issues.append("W4 integration repair published exact commit parent differs from the authorized base")
        except RuntimeError:
            issues.append("W4 integration repair published exact commit parent cannot be resolved")
    if value.get("manifest_path") != MANIFEST_PATH.relative_to(ROOT).as_posix():
        issues.append("W4 integration repair manifest path differs")
    if value.get("manifest_payload_sha256") != _manifest_payload_sha256(value):
        issues.append("W4 integration repair manifest payload identity differs")
    selected_manifest = _source_record(
        MANIFEST_PATH.relative_to(ROOT).as_posix(),
        selected_mode,
        source_revision,
        staged_snapshot,
    )
    if selected_manifest is None:
        issues.append("W4 integration repair manifest is missing from the selected lifecycle source")
    else:
        manifest_blob, manifest_data = selected_manifest
        if _BLOB.fullmatch(manifest_blob) is None:
            issues.append("W4 integration repair manifest Git blob is invalid")
        try:
            selected_value = json.loads(manifest_data.decode("utf-8-sig"))
            if selected_value != value:
                issues.append("W4 integration repair manifest differs from the selected lifecycle source")
        except (UnicodeDecodeError, json.JSONDecodeError):
            issues.append("W4 integration repair manifest is not valid JSON in the selected lifecycle source")
        if manifest_data != _canonical_manifest_bytes(value):
            issues.append("W4 integration repair manifest encoding is not canonical in the selected lifecycle source")
    if value.get("broad_prefix_exclusions") != [] or value.get("wildcard_admissions") != [] or value.get("scanner_bypasses") != []:
        issues.append("W4 integration repair admission contains a broad or wildcard bypass")
    if (
        value.get("issued_run_high_water") != 72
        or value.get("issued_evidence_high_water") != 72
        or value.get("package_allocated_run_ids") != []
        or value.get("package_allocated_evidence_ids") != []
        or value.get("proof_execution_started") is not False
        or value.get("identity_allocation_started") is not False
        or value.get("execution_gate") != "CLOSED-PENDING-SEPARATE-PUBLICATION-CI-AND-RERUN-AUTHORIZATION"
    ):
        issues.append("W4 integration repair crossed execution or identity closure")
    fcc = value.get("fcc13e", {})
    if not isinstance(fcc, Mapping) or fcc.get("proof_observations_created") != 0 or fcc.get("future_rule") != "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER":
        issues.append("W4 integration repair FCC-13E closure differs")
    preview = value.get("rerun_preview")
    if not isinstance(preview, list) or len(preview) != 12 or any(
        not isinstance(row, Mapping) or row.get("state") != "PREVIEW-NOT-ALLOCATED"
        for row in preview
    ):
        issues.append("W4 integration repair rerun identities are not exact preview-only rows")

    rows = value.get("artifacts")
    actual_paths = [str(row.get("path", "")) for row in rows if isinstance(row, Mapping)] if isinstance(rows, list) else []
    if not isinstance(rows, list) or actual_paths != list(ARTIFACT_PATHS) or len(actual_paths) != len(rows):
        issues.append("W4 integration repair artifact path set/order differs")
    else:
        for row, relative in zip(rows, ARTIFACT_PATHS):
            if not _safe_exact_path(relative):
                issues.append("W4 integration repair path is not exact/safe: " + relative)
            if isinstance(row, Mapping):
                issues.extend(_record_issues(row, relative, selected_mode, source_revision, staged_snapshot))
    admitted = admitted_paths(value)
    if admitted != tuple(sorted(PACKAGE_PATHS)):
        issues.append("W4 integration scanner admission does not equal the exact package paths")

    expected_changed = set(admitted)
    changed: set[str]
    if selected_mode == "preparation":
        changed = _working_changed_paths()
        permitted_nonpackage = set(PROTECTED_LOCAL_PATHS).union(DIAGNOSTIC_PATHS)
        package_changed = changed.difference(permitted_nonpackage)
        if package_changed != expected_changed:
            missing = sorted(expected_changed.difference(package_changed))
            unexpected = sorted(package_changed.difference(expected_changed))
            if missing:
                issues.append("W4 integration package paths are not all changed: " + ", ".join(missing))
            if unexpected:
                issues.append("W4 integration repair has unexpected changed paths: " + ", ".join(unexpected))
        staged = _staged_paths()
        if staged:
            issues.append("W4 integration repair preparation contains staged paths: " + ", ".join(staged))
    elif selected_mode == "staged":
        changed = set(staged_snapshot)
        missing = sorted(expected_changed.difference(changed))
        unexpected = sorted(changed.difference(expected_changed))
        if missing:
            issues.append("W4 integration repair is missing staged paths: " + ", ".join(missing))
        if unexpected:
            issues.append("W4 integration repair has extra staged paths: " + ", ".join(unexpected))
        protected_staged = sorted(changed.intersection(PROTECTED_LOCAL_PATHS))
        if protected_staged:
            issues.append("W4 integration repair index contains protected paths: " + ", ".join(protected_staged))
        diagnostics_staged = sorted(changed.intersection(DIAGNOSTIC_PATHS))
        if diagnostics_staged:
            issues.append("W4 integration repair index contains blocked diagnostics: " + ", ".join(diagnostics_staged))
        execution_staged = sorted(
            relative
            for relative in changed
            if relative == HISTORICAL_STATE_PATH
            or relative == HISTORICAL_EVIDENCE_ROOT
            or relative.startswith(HISTORICAL_EVIDENCE_ROOT + "/")
            or re.search(r"PRD07-(?:RUN|EVID)-\d{4}", relative)
        )
        if execution_staged:
            issues.append("W4 integration repair index contains execution/evidence identity paths: " + ", ".join(execution_staged))
        historical_staged = sorted(
            relative
            for relative in changed
            if relative == HISTORICAL_BOUNDARY_PATH
            or relative == HISTORICAL_STATE_PATH
            or relative == HISTORICAL_EVIDENCE_ROOT
            or relative.startswith(HISTORICAL_EVIDENCE_ROOT + "/")
        )
        if historical_staged:
            issues.append("W4 integration repair index changes historical stopped evidence: " + ", ".join(historical_staged))
    else:
        changed = _published_changed_paths(source_revision)
        missing = sorted(expected_changed.difference(changed))
        unexpected = sorted(changed.difference(expected_changed))
        if missing:
            issues.append("W4 integration repair published exact commit is missing paths: " + ", ".join(missing))
        if unexpected:
            issues.append("W4 integration repair published exact commit has extra paths: " + ", ".join(unexpected))

    published = value.get("published_repair_admission", {})
    expected_published = _revision_record(PUBLISHED_REPAIR_MANIFEST.relative_to(ROOT).as_posix(), BASE_REVISION)
    if published != expected_published:
        issues.append("W4 integration repair does not bind the exact published predecessor admission")
    superseded, supersession_issues = published_superseded_paths(source_revision)
    issues.extend("published repair admission: " + issue for issue in supersession_issues)
    if len(superseded) != EXPECTED_SUPERSEDED_COUNT or list(superseded) != value.get("published_superseded_stopped_paths"):
        issues.append("W4 integration repair does not consume the canonical six-path supersession set")

    diagnostics = value.get("excluded_blocked_attempt_diagnostics")
    if not isinstance(diagnostics, list) or [row.get("path") for row in diagnostics if isinstance(row, Mapping)] != list(DIAGNOSTIC_PATHS):
        issues.append("W4 integration repair diagnostic exclusion records differ")
    else:
        for row, relative in zip(diagnostics, DIAGNOSTIC_PATHS):
            if row.get("disposition") != "EXCLUDED-UNTRACKED-BLOCKED-ATTEMPT-REVIEW-OUTPUT":
                issues.append("W4 integration diagnostic disposition differs: " + relative)
            if selected_mode == "published":
                tracked = subprocess.run(["git", "cat-file", "-e", source_revision + ":" + relative], cwd=ROOT, capture_output=True)
                if tracked.returncode == 0:
                    issues.append("W4 integration excluded diagnostic entered the published exact commit: " + relative)
            else:
                path = ROOT / relative
                if path.is_file():
                    data = _file_data(path)
                    if len(data) != row.get("observed_bytes") or hashlib.sha256(data).hexdigest() != row.get("observed_sha256"):
                        issues.append("W4 integration excluded diagnostic changed since preparation: " + relative)
                    tracked = subprocess.run(["git", "ls-files", "--error-unmatch", "--", relative], cwd=ROOT, capture_output=True)
                    if tracked.returncode == 0:
                        issues.append("W4 integration excluded diagnostic became tracked: " + relative)

    dirty_protected = set(PROTECTED_LOCAL_PATHS).intersection(_working_changed_paths()) if selected_mode != "published" else set()
    if dirty_protected and selected_mode in ("preparation", "staged"):
        issues.extend(protected_local_issues())
    if value.get("protected_local_path_count") != 9:
        issues.append("W4 integration protected local path count differs")
    issues.extend(_historical_issues(selected_mode, source_revision))
    issues.extend(_identity_issues(selected_mode, source_revision))
    return tuple(sorted(set(issues)))


def build_manifest() -> dict[str, Any]:
    head = str(_git("rev-parse", "HEAD"))
    superseded, supersession_issues = published_superseded_paths(head)
    if supersession_issues:
        raise ValueError("published predecessor admission is invalid: " + "; ".join(supersession_issues))
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
        "schema_version": "prd07-w4-integration-repair-admission-v1",
        "manifest_version": 1,
        "package": "R7-W4-READINESS-AUDIT-HUMAN-REVIEW-INTEGRATION-REPAIR",
        "lifecycle_role": "PREPARED-UNPUBLISHED-APPEND-ONLY-REPAIR-ADMISSION",
        "state": "PASS-PREPARED-NOT-STAGED",
        "base_revision": BASE_REVISION,
        "manifest_path": MANIFEST_PATH.relative_to(ROOT).as_posix(),
        "validation_law": "EXACT-PATH-HASH-PINNED-FAIL-CLOSED",
        "validation_modes": {
            "preparation": {
                "content_source": "WORKING-TREE",
                "index_rule": "EMPTY",
                "pass_state": VALIDATION_STATES["preparation"],
            },
            "staged": {
                "content_source": "GIT-INDEX-BLOBS",
                "index_rule": "EXACT-MANIFEST-PATH-SET",
                "pass_state": VALIDATION_STATES["staged"],
            },
            "published": {
                "content_source": "EXACT-COMMIT-TREE",
                "index_rule": "NOT-AUTHORITY",
                "pass_state": VALIDATION_STATES["published"],
            },
        },
        "broad_prefix_exclusions": [],
        "wildcard_admissions": [],
        "scanner_bypasses": [],
        "artifacts": [_current_record(relative) for relative in ARTIFACT_PATHS],
        "published_repair_admission": _revision_record(PUBLISHED_REPAIR_MANIFEST.relative_to(ROOT).as_posix(), BASE_REVISION),
        "published_superseded_stopped_paths": list(superseded),
        "excluded_blocked_attempt_diagnostics": diagnostics,
        "protected_local_path_count": len(PROTECTED_LOCAL_PATHS),
        "issued_run_high_water": 72,
        "issued_evidence_high_water": 72,
        "package_allocated_run_ids": [],
        "package_allocated_evidence_ids": [],
        "proof_execution_started": False,
        "identity_allocation_started": False,
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
            "future_rule": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER",
        },
        "measurement_recertification": "RETAINED-105-OF-105-DIAGNOSTIC-NOT-FINAL-PUBLICATION",
        "execution_gate": "CLOSED-PENDING-SEPARATE-PUBLICATION-CI-AND-RERUN-AUTHORIZATION",
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
        raise ValueError("preparation build requires the authorized base revision " + BASE_REVISION)
    value = build_manifest()
    MANIFEST_PATH.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST_PATH.write_bytes((json.dumps(value, indent=2, sort_keys=True) + "\n").encode("utf-8"))
    return value


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Prepare or verify the W4 integration repair admission")
    parser.add_argument("action", choices=("build", "verify"))
    parser.add_argument("--mode", choices=ORCHESTRATION_MODES, required=True)
    parser.add_argument("--source-revision")
    parser.add_argument("--format", choices=("text", "json"), default="text")
    args = parser.parse_args(argv)
    if args.action == "build" and args.mode != "preparation":
        parser.error("build requires --mode preparation")
    value = write_manifest() if args.action == "build" else json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig"))
    source_revision = args.source_revision or str(_git("rev-parse", "HEAD"))
    selected_mode, _ = _selected_mode(args.mode, source_revision)
    issues = manifest_issues(value, source_revision, mode=args.mode)
    report = {
        "status": "PASS" if not issues else "FAIL",
        "validation_mode": selected_mode or args.mode,
        "validation_state": VALIDATION_STATES.get(selected_mode or "", "FAIL-CLOSED"),
        "checks": len(ARTIFACT_PATHS) + 22,
        "paths": len(PACKAGE_PATHS),
        "issues": list(issues),
        "issued_run_high_water": 72,
        "issued_evidence_high_water": 72,
        "proof_execution_started": False,
        "identity_allocation_started": False,
    }
    if args.format == "json":
        print(json.dumps(report, indent=2))
    else:
        print("R7 W4 integration repair admission {0} ({1}; {2} exact paths)".format(report["status"], report["validation_mode"], report["paths"]))
        for issue in issues:
            print("FAIL " + issue)
    return 0 if not issues else 1


if __name__ == "__main__":
    raise SystemExit(main())
