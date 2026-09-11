"""Immutable readiness consumption and fail-closed W4 execution admission."""

from __future__ import annotations

import hashlib
import json
import re
import subprocess
from pathlib import Path
from typing import Any, Dict, Iterable, List, Mapping, Sequence, Tuple

from tools.r7_w3_runtime.execution_plan import inspect_execution_registry
from tools.r7_w4_runtime.admission import MANIFEST_PATH as READINESS_ADMISSION_PATH
from tools.r7_w4_runtime.admission import manifest_issues
from tools.r7_w4_runtime.authority import W4_PROOF_IDS
from tools.r7_w4_runtime.dependencies import local_dependency_report
from tools.r7_w4_runtime.fixtures import fixture_issues
from tools.r7_w4_runtime.readiness import READINESS_PATH, readiness_report


ROOT = Path(__file__).resolve().parents[2]
EXECUTION_PACKAGE = "R7-W4-FORGE-TRUST-PRESENTATION-MIGRATION-GOVERNED-EXECUTION"
READINESS_PACKAGE_COMMIT = "26548f7561974239b8996c473f25644d61f099fa"
READINESS_IMPLEMENTATION_COMMIT = "7ff70fae0bad97287602e946deae409ac3df74b8"
EXPECTED_BRANCH = "codex/chore/brain-governance-pilot"
EXPECTED_UPSTREAM = "origin/codex/chore/brain-governance-pilot"
EXECUTION_ROSTER = tuple(W4_PROOF_IDS)
SOURCE_BOUNDARY_PATH = ROOT / "docs/rebuild/r7/w4-governed-execution-source-boundary.json"
EXECUTION_ADMISSION_PATH = ROOT / "docs/rebuild/r7/w4-governed-execution-admission.json"
STATE_PATH = ROOT / "docs/rebuild/r7/w4-execution-state.json"
STOPPED_RECONCILIATION_PATH = ROOT / "docs/rebuild/r7/w4-stopped-execution-reconciliation.json"
STOPPED_BOUNDARY_PATH = ROOT / "docs/rebuild/r7/w4-stopped-execution-boundary.json"
RETAINED_ROOT = ROOT / "docs/rebuild/r7/execution-evidence"
_COMMIT = re.compile(r"^[0-9a-f]{40}$")

READINESS_LIFECYCLE_SHARED_PATHS = {
    "tools/tests/test_r7_w4_runtime.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
}

SOURCE_BOUNDARY_FIXED_FILES = (
    "tools/tests/test_r7_w4_execution.py",
    "tools/tests/test_r7_w4_runtime.py",
    "tools/r7_w4_execution_audit.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
)
SOURCE_BOUNDARY_TREES = (
    "tools/r7_w4_execution",
    "proofs/r7/w4_execution",
)
STOPPED_LIFECYCLE_PATHS = (
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

PROTECTED_LOCAL_PATHS: Mapping[str, Tuple[int, str]] = {
    "brain/.obsidian/appearance.json": (49, "611608bbcd786679a6eba06df20cac9264d7c74bd9624acd33c6f66b616b80b4"),
    "brain/.obsidian/graph.json": (537, "d583ad29c431d687728123b84d533e884240b242e70f92bf37607e87f52ad158"),
    "brain/81_CANVAS/Document Authority Map.canvas": (1583, "9176b4a995d1942cc538607c2937b84f1828ae6341292d7ac1eeb94a2503a099"),
    "brain/90_TEMPLATES/Governance/Benchmark Record.md": (1269, "7a059ac089b8abb043c66949c3f7f8d625b1dfb224bba1bb87199d5b7da3a914"),
    "brain/98_INBOX/2026-09-09.md": (0, "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"),
    "brain/.obsidian/themes/Encore/manifest.json": (140, "b1fb3a0a1cf2dc826ec0f5c38cfdd938f754877c3275493ce9f1db24cae77123"),
    "brain/.obsidian/themes/Encore/theme.css": (90414, "65e4236200b4703c2dab136b2220558435af438de733e15adb721e32f76bbb3a"),
    "brain/.obsidian/themes/Wasp/manifest.json": (139, "2da6046b3c1c946ba86288b87c97eb3fa33f171b7f59d9819945605d5184b7b5"),
    "brain/.obsidian/themes/Wasp/theme.css": (13430, "cf84fd6cef71c04642cc8e6abd197080b3293da6d4ef8519eb4fb77ac2cdeabf"),
}

FIXTURE_PATHS: Mapping[str, Tuple[str, ...]] = {
    "FIXTURE-04": ("proofs/r7/w2/runtime/model.py", "proofs/r7/w2/runtime/runner.py"),
    "FIXTURE-05": ("proofs/r7/w2/runtime/model.py", "proofs/r7/w2/runtime/runner.py"),
    "FIXTURE-07": (
        "proofs/r7/w4/fixture-07/manifest.json",
        "proofs/r7/w4/fixture-07/source-packages.json",
        "proofs/r7/w4/fixture-07/trust-and-scale-cases.json",
        "proofs/r7/w4/fixture-07/migration-worlds.json",
        "proofs/r7/w4/fixture-07/fcc13e-expected.json",
    ),
    "FIXTURE-08": (
        "proofs/r7/w4/fixture-08/manifest.json",
        "proofs/r7/w4/fixture-08/presentation-cases.json",
        "proofs/r7/w4/presentation_probe/project.godot",
    ),
    "FIXTURE-09": (
        "proofs/r7/w0/dependencies.lock.json",
        "proofs/r7/w4/dependency-reference.json",
    ),
}


def _git(*args: str) -> str:
    completed = subprocess.run(["git", *args], cwd=ROOT, text=True, capture_output=True)
    if completed.returncode:
        raise RuntimeError(completed.stderr.strip() or "git command failed")
    return completed.stdout.strip()


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_json(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError(path.as_posix() + " must contain a JSON object")
    return value


def canonical_bytes(value: Any) -> bytes:
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n").encode("utf-8")


def canonical_file_bytes(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def canonical_file_sha256(path: Path) -> str:
    return hashlib.sha256(canonical_file_bytes(path)).hexdigest()


def _blob_bytes(blob: str) -> bytes:
    completed = subprocess.run(["git", "cat-file", "blob", blob], cwd=ROOT, capture_output=True)
    if completed.returncode:
        raise RuntimeError(completed.stderr.decode("utf-8", errors="replace").strip() or "git blob lookup failed")
    return completed.stdout


def _is_ancestor(ancestor: str, descendant: str) -> bool:
    return subprocess.run(
        ["git", "merge-base", "--is-ancestor", ancestor, descendant],
        cwd=ROOT,
        text=True,
        capture_output=True,
    ).returncode == 0


def execution_boundary_paths() -> Tuple[Path, ...]:
    paths = set()
    for relative in SOURCE_BOUNDARY_TREES:
        base = ROOT / relative
        if base.is_dir():
            paths.update(
                path for path in base.rglob("*")
                if path.is_file()
                and "__pycache__" not in path.parts
                and path.suffix.lower() not in {".pyc", ".exe", ".dll", ".pck", ".res", ".tres"}
            )
    for relative in SOURCE_BOUNDARY_FIXED_FILES:
        path = ROOT / relative
        if path.is_file():
            paths.add(path)
    return tuple(sorted(paths))


def execution_boundary_relatives_at_revision(revision: str) -> Tuple[str, ...]:
    """Enumerate the admitted execution source at its historical Git timepoint."""
    output = _git("ls-tree", "-r", "--name-only", revision)
    fixed = set(SOURCE_BOUNDARY_FIXED_FILES)
    prefixes = tuple(relative.rstrip("/") + "/" for relative in SOURCE_BOUNDARY_TREES)
    return tuple(sorted(
        relative for relative in output.splitlines()
        if relative in fixed or relative.startswith(prefixes)
    ))


def execution_source_paths() -> Tuple[Path, ...]:
    paths = set(execution_boundary_paths())
    for relative in (
        SOURCE_BOUNDARY_PATH.relative_to(ROOT).as_posix(),
        "brain/06_WORK/Task Contracts/TASK-20260910-002.md",
        "brain/06_WORK/Work Records/WORK-20260910-002.md",
    ):
        path = ROOT / relative
        if path.is_file():
            paths.add(path)
    return tuple(sorted(paths))


def artifact_records(paths: Iterable[Path], revision: str = "") -> List[Dict[str, Any]]:
    records = []
    for path in sorted(paths):
        relative = path.relative_to(ROOT).as_posix()
        data = canonical_file_bytes(path)
        record: Dict[str, Any] = {
            "path": relative,
            "bytes": len(data),
            "sha256": hashlib.sha256(data).hexdigest(),
        }
        if revision:
            record["git_blob"] = _git("rev-parse", revision + ":" + relative)
        records.append(record)
    return records


def protected_local_issues() -> Tuple[str, ...]:
    issues = []
    for relative, (expected_bytes, expected_hash) in PROTECTED_LOCAL_PATHS.items():
        path = ROOT / relative
        if not path.is_file():
            issues.append("protected user-local path is missing: " + relative)
            continue
        if path.stat().st_size != expected_bytes or sha256_file(path) != expected_hash:
            issues.append("protected user-local path changed: " + relative)
    return tuple(sorted(issues))


def _production_boundary_issues() -> List[str]:
    issues = []
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        if (ROOT / relative).exists():
            issues.append("root production boundary exists: " + relative)
    return issues


def _preexecution_registry_issues() -> List[str]:
    issues = []
    try:
        registry = inspect_execution_registry(ROOT)
        if registry.max_run_number != 65 or registry.max_evidence_number != 65:
            issues.append("pre-execution RUN/EVID high-water is not exactly 0065")
        if any(int(value.rsplit("-", 1)[1]) >= 66 for value in registry.run_ids):
            issues.append("a 0066+ RUN identity already exists")
        if any(int(value.rsplit("-", 1)[1]) >= 66 for value in registry.evidence_ids):
            issues.append("a 0066+ EVID identity already exists")
    except Exception as exc:
        issues.append("execution registry is ambiguous: " + str(exc))
    if STATE_PATH.exists():
        issues.append("W4 execution state exists before first allocation")
    for path in RETAINED_ROOT.glob("PRD07-RUN-*"):
        match = re.fullmatch(r"PRD07-RUN-(\d{4})", path.name)
        if path.is_dir() and match and int(match.group(1)) >= 66:
            issues.append("a 0066+ retained evidence path already exists: " + path.name)
    return issues


def _artifact_record_issues(
    record: Mapping[str, Any],
    *,
    require_current: bool,
    required_revision: str = "",
) -> List[str]:
    issues = []
    relative = str(record.get("path", ""))
    if not relative or Path(relative).is_absolute() or ".." in Path(relative).parts:
        return ["artifact record contains an unsafe path: " + relative]
    blob = str(record.get("git_blob", ""))
    if _COMMIT.fullmatch(blob) is None:
        return ["artifact record lacks an exact Git blob: " + relative]
    try:
        data = _blob_bytes(blob).replace(b"\r\n", b"\n").replace(b"\r", b"\n")
    except RuntimeError:
        return ["artifact record Git blob is unavailable: " + relative]
    if len(data) != record.get("bytes") or hashlib.sha256(data).hexdigest() != record.get("sha256"):
        issues.append("artifact record content identity differs: " + relative)
    if required_revision:
        try:
            if _git("rev-parse", required_revision + ":" + relative) != blob:
                issues.append("artifact record differs from its implementation commit: " + relative)
        except RuntimeError:
            issues.append("artifact record is absent from its implementation commit: " + relative)
    if require_current:
        path = ROOT / relative
        if not path.is_file():
            issues.append("admitted artifact is missing: " + relative)
        else:
            current = canonical_file_bytes(path)
            if len(current) != record.get("bytes") or hashlib.sha256(current).hexdigest() != record.get("sha256"):
                issues.append("admitted artifact differs from its certified content: " + relative)
            try:
                if _git("hash-object", "--", relative) != blob:
                    issues.append("admitted artifact Git blob differs: " + relative)
            except RuntimeError:
                issues.append("admitted artifact cannot be Git-hashed: " + relative)
    return issues


def stopped_lifecycle_issues(source_revision: str) -> Tuple[str, ...]:
    """Validate the current source that supersedes the historical run source.

    Historical execution files may differ only when this separately committed
    boundary hash-pins the current lifecycle validators and reconciliation.
    """
    issues: List[str] = []
    if not STOPPED_BOUNDARY_PATH.is_file() or not STOPPED_RECONCILIATION_PATH.is_file():
        return ("W4 stopped lifecycle boundary/reconciliation is missing",)
    boundary = load_json(STOPPED_BOUNDARY_PATH)
    if (
        boundary.get("schema_version") != "prd07-w4-stopped-execution-boundary-v1"
        or boundary.get("manifest_version") != 1
        or boundary.get("status") != "PASS"
        or boundary.get("certification_meaning") != "INTEGRITY-OF-STOPPED-PACKAGE-ONLY-NOT-W4-SUCCESS"
        or boundary.get("lifecycle_role") != "CURRENT-FAIL-CLOSED-STOPPED-EXECUTION-BOUNDARY"
        or boundary.get("package_state") != "STOPPED-AFTER-FAIL-OBSERVED"
    ):
        issues.append("W4 stopped lifecycle boundary identity/status differs")
    validation_commit = str(boundary.get("lifecycle_validation_commit", ""))
    if _COMMIT.fullmatch(validation_commit) is None or not _is_ancestor(validation_commit, source_revision):
        issues.append("W4 stopped lifecycle validation commit is invalid or not an ancestor")
    records = boundary.get("artifacts", [])
    paths = [str(row.get("path", "")) for row in records if isinstance(row, dict)] if isinstance(records, list) else []
    if not isinstance(records, list) or paths != list(STOPPED_LIFECYCLE_PATHS) or len(paths) != len(records):
        issues.append("W4 stopped lifecycle artifact set differs")
    else:
        for row in records:
            issues.extend(_artifact_record_issues(row, require_current=True, required_revision=validation_commit))
    reconciliation = boundary.get("reconciliation", {})
    if (
        not isinstance(reconciliation, dict)
        or reconciliation.get("path") != STOPPED_RECONCILIATION_PATH.relative_to(ROOT).as_posix()
        or reconciliation.get("sha256") != sha256_file(STOPPED_RECONCILIATION_PATH)
        or reconciliation.get("status") != "PASS"
    ):
        issues.append("W4 stopped reconciliation identity/status differs")
    if (
        boundary.get("issued_high_water") != 72
        or boundary.get("next_possible_identity") != "0073-NOT-ALLOCATED"
        or boundary.get("allocated_run_ids") != ["PRD07-RUN-{0:04d}".format(value) for value in range(66, 73)]
        or boundary.get("allocated_evidence_ids") != ["PRD07-EVID-{0:04d}".format(value) for value in range(66, 73)]
    ):
        issues.append("W4 stopped lifecycle identity boundary differs")
    if (
        boundary.get("gameplay_permission") != "CLOSED"
        or boundary.get("production_runtime") != "ABSENT"
        or boundary.get("production_dependency_activation") != "INACTIVE"
        or boundary.get("prd08_submission") != "NOT-SUBMITTED"
        or boundary.get("w5") != "CLOSED-NOT-READY"
        or any(boundary.get(field) != "CLOSED" for field in ("r7_final", "prd09", "r8"))
    ):
        issues.append("W4 stopped lifecycle boundary crossed a prohibited gate")
    return tuple(sorted(set(issues)))


def certified_readiness_history_issues() -> Tuple[str, ...]:
    """Validate the immutable readiness timepoint without reinterpreting it as current source."""
    issues: List[str] = []
    if not READINESS_PATH.is_file() or not READINESS_ADMISSION_PATH.is_file():
        return ("certified W4 readiness/admission artifact is missing",)
    stored = load_json(READINESS_PATH)
    if stored.get("status") != "PASS" or stored.get("proof_roster") != list(EXECUTION_ROSTER):
        issues.append("certified W4 readiness does not admit the exact roster")
    if stored.get("readiness_counts") != {"READY": 15, "BLOCKED": 0, "NOT APPLICABLE": 0}:
        issues.append("certified W4 readiness is not 15/15 READY")
    if (
        stored.get("proof_execution") != "NOT-STARTED"
        or stored.get("allocated_run_ids") != []
        or stored.get("allocated_evidence_ids") != []
    ):
        issues.append("certified W4 readiness contains allocated identities")
    admission = load_json(READINESS_ADMISSION_PATH)
    if (
        admission.get("schema_version") != "prd07-w4-readiness-admission-boundary-v1"
        or admission.get("manifest_version") != 1
        or admission.get("implementation_commit") != READINESS_IMPLEMENTATION_COMMIT
        or admission.get("proof_roster") != list(EXECUTION_ROSTER)
        or admission.get("readiness_counts") != {"READY": 15, "BLOCKED": 0, "NOT APPLICABLE": 0}
    ):
        issues.append("historical W4 readiness admission identity differs")
    if (
        admission.get("proof_execution") != "NOT-STARTED"
        or admission.get("allocated_run_ids") != []
        or admission.get("allocated_evidence_ids") != []
        or admission.get("execution_gate") != "CLOSED-PENDING-SEPARATE-OWNER-AUTHORIZATION"
    ):
        issues.append("historical W4 readiness admission no longer represents its pre-execution timepoint")
    for path in (READINESS_PATH, READINESS_ADMISSION_PATH):
        relative = path.relative_to(ROOT).as_posix()
        try:
            certified_blob = _git("rev-parse", READINESS_PACKAGE_COMMIT + ":" + relative)
            current_blob = _git("hash-object", "--", relative)
            if certified_blob != current_blob:
                issues.append("certified readiness package artifact changed: " + relative)
        except RuntimeError:
            issues.append("certified readiness package artifact cannot be resolved: " + relative)
    artifacts = admission.get("artifacts", [])
    if not isinstance(artifacts, list) or not artifacts:
        issues.append("historical W4 admission artifact list is empty")
    else:
        paths = [str(row.get("path", "")) for row in artifacts if isinstance(row, dict)]
        if len(paths) != len(artifacts) or paths != sorted(paths) or len(paths) != len(set(paths)):
            issues.append("historical W4 admission artifact paths are malformed, unordered or duplicated")
        for row in artifacts:
            if not isinstance(row, dict):
                issues.append("historical W4 admission contains a non-object artifact")
                continue
            relative = str(row.get("path", ""))
            issues.extend(
                _artifact_record_issues(
                    row,
                    require_current=relative not in READINESS_LIFECYCLE_SHARED_PATHS,
                )
            )
    expected_w3 = stored.get("registry_before_and_after_readiness", {}).get("w3_state_sha256")
    w3_state = ROOT / "docs/rebuild/r7/w3-execution-state.json"
    if not w3_state.is_file() or sha256_file(w3_state) != expected_w3:
        issues.append("immutable W3 execution state changed after W4 readiness certification")
    issues.extend(fixture_issues())
    return tuple(sorted(set(issues)))


def historical_readiness_issues() -> Tuple[str, ...]:
    if SOURCE_BOUNDARY_PATH.is_file():
        return certified_readiness_history_issues()
    issues: List[str] = []
    if not READINESS_PATH.is_file() or not READINESS_ADMISSION_PATH.is_file():
        return ("certified W4 readiness/admission artifact is missing",)
    stored = load_json(READINESS_PATH)
    regenerated = readiness_report(READINESS_IMPLEMENTATION_COMMIT, check_local=True)
    if stored != regenerated:
        issues.append("certified W4 readiness differs from canonical regeneration")
    admission = load_json(READINESS_ADMISSION_PATH)
    issues.extend(manifest_issues(admission, READINESS_IMPLEMENTATION_COMMIT))
    issues.extend(fixture_issues())
    return tuple(sorted(set(issues)))


def _identity_order(state: str) -> List[Dict[str, Any]]:
    return [
        {
            "order": index + 1,
            "proof_id": proof_id,
            "run_id": "PRD07-RUN-{0:04d}".format(66 + index),
            "evidence_id": "PRD07-EVID-{0:04d}".format(66 + index),
            "state": state,
        }
        for index, proof_id in enumerate(EXECUTION_ROSTER)
    ]


def build_source_boundary(implementation_commit: str, *, check_local: bool = True) -> Dict[str, Any]:
    if _COMMIT.fullmatch(implementation_commit) is None:
        raise ValueError("source-boundary implementation commit must be an exact lowercase commit")
    if _git("rev-parse", "HEAD") != implementation_commit:
        raise ValueError("source boundary must be generated at its exact implementation commit")
    issues = list(certified_readiness_history_issues())
    issues.extend(_preexecution_registry_issues())
    issues.extend(_production_boundary_issues())
    paths = execution_boundary_paths()
    if not paths:
        issues.append("W4 governed execution source set is empty")
    if not _is_ancestor(READINESS_PACKAGE_COMMIT, implementation_commit):
        issues.append("certified W4 readiness package is not an ancestor of execution source")
    try:
        branch = _git("branch", "--show-current")
        upstream = _git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}")
        if branch != EXPECTED_BRANCH:
            issues.append("source-boundary generation is not on the authoritative branch")
        if upstream != EXPECTED_UPSTREAM:
            issues.append("source-boundary generation has a different configured upstream")
    except RuntimeError as exc:
        issues.append(str(exc))
    if check_local:
        issues.extend(protected_local_issues())
        local = local_dependency_report()
        if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
            issues.extend(str(value) for value in local.get("issues", ["local dependency identity failed"]))
    relatives = [path.relative_to(ROOT).as_posix() for path in paths]
    if _git("status", "--porcelain", "--", *relatives):
        issues.append("W4 governed execution source has uncommitted changes")
    records = artifact_records(paths, implementation_commit)
    readiness = load_json(READINESS_PATH)
    return {
        "schema_version": "prd07-w4-governed-execution-source-boundary-v1",
        "manifest_version": 1,
        "package": EXECUTION_PACKAGE,
        "lifecycle_role": "CURRENT-PRE-EXECUTION-SOURCE-ADMISSION",
        "scope": "development-only-prd07-proof-execution-runtime",
        "status": "PASS" if not issues else "FAIL",
        "owner_authorization": "R7 W4 Governed Execution Authorization received 2026-09-10",
        "readiness_package_commit": READINESS_PACKAGE_COMMIT,
        "readiness_implementation_commit": READINESS_IMPLEMENTATION_COMMIT,
        "implementation_commit": implementation_commit,
        "required_branch": EXPECTED_BRANCH,
        "required_upstream": EXPECTED_UPSTREAM,
        "proof_roster": list(EXECUTION_ROSTER),
        "identity_order": _identity_order("AUTHORIZED-JIT-NOT-ALLOCATED"),
        "proof_execution": "NOT-STARTED",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "execution_gate": "CLOSED-PENDING-EXACT-SHA-CI-AND-GOVERNED-EXECUTION-ADMISSION",
        "readiness_artifacts": {
            "readiness": {"path": READINESS_PATH.relative_to(ROOT).as_posix(), "sha256": canonical_file_sha256(READINESS_PATH)},
            "admission": {"path": READINESS_ADMISSION_PATH.relative_to(ROOT).as_posix(), "sha256": canonical_file_sha256(READINESS_ADMISSION_PATH)},
            "source_tree_identity": readiness.get("source_tree_identity"),
        },
        "dependency_identity": readiness.get("dependency_identity"),
        "fixtures": readiness.get("fixtures"),
        "fcc13e": {
            "coverage_rule": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER",
            "proofs": ["PRD04-PROOF-57", "PRD04-PROOF-58"],
            "independent_observations_required": True,
        },
        "artifacts": records,
        "production_runtime": "ABSENT",
        "production_dependency_activation": "INACTIVE",
        "active_poc_dependencies": 0,
        "gameplay_permission": "CLOSED",
        "w5": "CLOSED",
        "r7_final": "CLOSED",
        "prd08": "CLOSED",
        "prd09": "CLOSED",
        "r8": "CLOSED",
        "issues": sorted(set(issues)),
    }


def write_source_boundary(implementation_commit: str, *, check_local: bool = True) -> Dict[str, Any]:
    value = build_source_boundary(implementation_commit, check_local=check_local)
    SOURCE_BOUNDARY_PATH.parent.mkdir(parents=True, exist_ok=True)
    SOURCE_BOUNDARY_PATH.write_bytes(canonical_bytes(value))
    return value


def source_boundary_issues(
    source_revision: str,
    *,
    require_initial_high_water: bool,
    check_local: bool,
) -> Tuple[str, ...]:
    issues: List[str] = []
    stopped_lifecycle = STATE_PATH.is_file()
    if not SOURCE_BOUNDARY_PATH.is_file():
        return ("W4 governed execution source boundary is missing",)
    boundary = load_json(SOURCE_BOUNDARY_PATH)
    implementation = str(boundary.get("implementation_commit", ""))
    if (
        boundary.get("schema_version") != "prd07-w4-governed-execution-source-boundary-v1"
        or boundary.get("manifest_version") != 1
        or boundary.get("package") != EXECUTION_PACKAGE
        or boundary.get("lifecycle_role") != "CURRENT-PRE-EXECUTION-SOURCE-ADMISSION"
        or boundary.get("scope") != "development-only-prd07-proof-execution-runtime"
        or boundary.get("status") != "PASS"
        or boundary.get("issues") != []
    ):
        issues.append("W4 governed execution source boundary identity/status differs")
    if boundary.get("readiness_package_commit") != READINESS_PACKAGE_COMMIT or boundary.get("readiness_implementation_commit") != READINESS_IMPLEMENTATION_COMMIT:
        issues.append("W4 source boundary readiness authority differs")
    if boundary.get("proof_roster") != list(EXECUTION_ROSTER) or boundary.get("identity_order") != _identity_order("AUTHORIZED-JIT-NOT-ALLOCATED"):
        issues.append("W4 source boundary proof/identity order differs")
    if (
        boundary.get("proof_execution") != "NOT-STARTED"
        or boundary.get("allocated_run_ids") != []
        or boundary.get("allocated_evidence_ids") != []
        or boundary.get("execution_gate") != "CLOSED-PENDING-EXACT-SHA-CI-AND-GOVERNED-EXECUTION-ADMISSION"
    ):
        issues.append("W4 source boundary opened execution or allocated identities")
    if (
        boundary.get("gameplay_permission") != "CLOSED"
        or boundary.get("production_runtime") != "ABSENT"
        or boundary.get("production_dependency_activation") != "INACTIVE"
        or boundary.get("active_poc_dependencies") != 0
        or any(boundary.get(field) != "CLOSED" for field in ("w5", "r7_final", "prd08", "prd09", "r8"))
    ):
        issues.append("W4 source boundary crossed a prohibited programme or production boundary")
    if _COMMIT.fullmatch(source_revision) is None:
        issues.append("W4 source verification revision is not exact")
    else:
        try:
            if _git("rev-parse", "HEAD") != source_revision:
                issues.append("W4 source verification revision does not equal current HEAD")
        except RuntimeError as exc:
            issues.append(str(exc))
    if _COMMIT.fullmatch(implementation) is None or not _is_ancestor(implementation, source_revision):
        issues.append("W4 source-boundary implementation commit is invalid or not an ancestor")
    if not _is_ancestor(READINESS_PACKAGE_COMMIT, source_revision):
        issues.append("certified W4 readiness package is not an ancestor of current source")
    if stopped_lifecycle:
        issues.extend(stopped_lifecycle_issues(source_revision))
    try:
        expected_relatives = (
            list(execution_boundary_relatives_at_revision(implementation))
            if stopped_lifecycle
            else [path.relative_to(ROOT).as_posix() for path in execution_boundary_paths()]
        )
    except RuntimeError as exc:
        expected_relatives = []
        issues.append(str(exc))
    artifacts = boundary.get("artifacts", [])
    artifact_relatives = [str(row.get("path", "")) for row in artifacts if isinstance(row, dict)] if isinstance(artifacts, list) else []
    if not isinstance(artifacts, list) or artifact_relatives != expected_relatives or len(artifact_relatives) != len(artifacts):
        issues.append("W4 source-boundary artifact path set differs")
    else:
        for row in artifacts:
            issues.extend(_artifact_record_issues(row, require_current=not stopped_lifecycle, required_revision=implementation))
    readiness_records = boundary.get("readiness_artifacts", {})
    for key, path in (("readiness", READINESS_PATH), ("admission", READINESS_ADMISSION_PATH)):
        record = readiness_records.get(key, {}) if isinstance(readiness_records, dict) else {}
        if not isinstance(record, dict) or record.get("path") != path.relative_to(ROOT).as_posix() or record.get("sha256") != canonical_file_sha256(path):
            issues.append("W4 source boundary readiness identity differs: " + key)
    issues.extend(certified_readiness_history_issues())
    issues.extend(_production_boundary_issues())
    if require_initial_high_water:
        issues.extend(_preexecution_registry_issues())
    if check_local:
        issues.extend(protected_local_issues())
        local = local_dependency_report()
        if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
            issues.extend(str(value) for value in local.get("issues", ["local dependency identity failed"]))
        try:
            if _git("branch", "--show-current") != EXPECTED_BRANCH:
                issues.append("current branch differs from execution authority")
            if _git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}") != EXPECTED_UPSTREAM:
                issues.append("configured upstream differs from execution authority")
            if _git("rev-parse", "@{u}") != source_revision:
                issues.append("current source revision is not published exactly to upstream")
        except RuntimeError as exc:
            issues.append(str(exc))
        governed = expected_relatives + [SOURCE_BOUNDARY_PATH.relative_to(ROOT).as_posix()]
        if stopped_lifecycle:
            governed = [
                SOURCE_BOUNDARY_PATH.relative_to(ROOT).as_posix(),
                STOPPED_RECONCILIATION_PATH.relative_to(ROOT).as_posix(),
                STOPPED_BOUNDARY_PATH.relative_to(ROOT).as_posix(),
                *STOPPED_LIFECYCLE_PATHS,
            ]
        if _git("status", "--porcelain", "--", *governed):
            issues.append("governed W4 source boundary has uncommitted changes")
    return tuple(sorted(set(issues)))


def initial_authority_issues() -> Tuple[str, ...]:
    """Checks that must pass while high-water is still exactly 0065."""
    if SOURCE_BOUNDARY_PATH.is_file():
        try:
            head = _git("rev-parse", "HEAD")
        except RuntimeError as exc:
            return (str(exc),)
        return source_boundary_issues(
            head,
            require_initial_high_water=True,
            check_local=True,
        )
    issues = list(historical_readiness_issues())
    issues.extend(protected_local_issues())
    issues.extend(_preexecution_registry_issues())
    issues.extend(_production_boundary_issues())
    try:
        head = _git("rev-parse", "HEAD")
        if _git("branch", "--show-current") != EXPECTED_BRANCH:
            issues.append("current branch differs from execution authority")
        if _git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}") != EXPECTED_UPSTREAM:
            issues.append("configured upstream differs from execution authority")
        if _git("rev-parse", "@{u}") != head:
            issues.append("local HEAD and upstream are not synchronized")
        if not _is_ancestor(READINESS_PACKAGE_COMMIT, head):
            issues.append("certified readiness package is not an ancestor of execution HEAD")
    except RuntimeError as exc:
        issues.append(str(exc))
    local = local_dependency_report()
    if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
        issues.extend(str(value) for value in local.get("issues", ["local dependency identity failed"]))
    return tuple(sorted(set(issues)))


def build_execution_admission(
    implementation_commit: str,
    checkpoint_ci: Sequence[Mapping[str, Any]] = (),
) -> Dict[str, Any]:
    if _COMMIT.fullmatch(implementation_commit) is None:
        raise ValueError("implementation commit must be an exact lowercase commit")
    if _git("rev-parse", "HEAD") != implementation_commit:
        raise ValueError("execution admission must be generated at its exact implementation commit")
    issues = list(initial_authority_issues())
    expected_workflows = {"Brain integrity", "Engineering governance integrity"}
    observed_workflows = {
        str(row.get("workflow")) for row in checkpoint_ci if isinstance(row, Mapping)
    }
    if len(checkpoint_ci) != 2 or observed_workflows != expected_workflows:
        issues.append("execution checkpoint requires both exact workflow results")
    for row in checkpoint_ci:
        if (
            not isinstance(row, Mapping)
            or row.get("head_sha") != implementation_commit
            or row.get("conclusion") != "success"
            or not isinstance(row.get("run_id"), int)
            or int(row.get("run_id", 0)) <= 0
        ):
            issues.append("execution checkpoint CI row is not exact successful published-SHA evidence")
    paths = execution_source_paths()
    if not paths:
        issues.append("execution source set is empty")
    source_artifacts = artifact_records(paths, implementation_commit)
    readiness = load_json(READINESS_PATH)
    readiness_admission = load_json(READINESS_ADMISSION_PATH)
    source_boundary = load_json(SOURCE_BOUNDARY_PATH) if SOURCE_BOUNDARY_PATH.is_file() else {}
    local = local_dependency_report()
    return {
        "schema_version": "prd07-w4-governed-execution-admission-v1",
        "package": EXECUTION_PACKAGE,
        "status": "PASS" if not issues else "FAIL",
        "owner_authorization": "R7 W4 Governed Execution Authorization received 2026-09-10",
        "readiness_package_commit": READINESS_PACKAGE_COMMIT,
        "readiness_implementation_commit": READINESS_IMPLEMENTATION_COMMIT,
        "execution_implementation_commit": implementation_commit,
        "required_branch": EXPECTED_BRANCH,
        "required_upstream": EXPECTED_UPSTREAM,
        "readiness_artifacts": {
            "readiness": {"path": READINESS_PATH.relative_to(ROOT).as_posix(), "sha256": canonical_file_sha256(READINESS_PATH)},
            "admission": {"path": READINESS_ADMISSION_PATH.relative_to(ROOT).as_posix(), "sha256": canonical_file_sha256(READINESS_ADMISSION_PATH)},
            "source_tree_identity": readiness.get("source_tree_identity"),
            "admission_boundary_sha256": hashlib.sha256(canonical_bytes(readiness_admission)).hexdigest(),
        },
        "source_boundary": {
            "path": SOURCE_BOUNDARY_PATH.relative_to(ROOT).as_posix(),
            "sha256": canonical_file_sha256(SOURCE_BOUNDARY_PATH) if SOURCE_BOUNDARY_PATH.is_file() else "",
            "implementation_commit": source_boundary.get("implementation_commit"),
            "lifecycle_role": source_boundary.get("lifecycle_role"),
        },
        "execution_source_artifacts": source_artifacts,
        "proof_order": list(EXECUTION_ROSTER),
        "identity_order": _identity_order("AUTHORIZED-JIT-NOT-ALLOCATED"),
        "starting_ci": [
            {"workflow": "Brain integrity", "run_id": 34462561751, "head_sha": READINESS_PACKAGE_COMMIT, "conclusion": "success", "verification": "PUBLIC-GITHUB-ACTIONS-API"},
            {"workflow": "Engineering governance integrity", "run_id": 34462561583, "head_sha": READINESS_PACKAGE_COMMIT, "conclusion": "success", "verification": "PUBLIC-GITHUB-ACTIONS-API"},
        ],
        "execution_checkpoint_ci": [dict(row) for row in checkpoint_ci],
        "dependency_identity": readiness.get("dependency_identity"),
        "local_dependency_check": local,
        "fixtures": {fixture: artifact_records(ROOT / relative for relative in paths) for fixture, paths in FIXTURE_PATHS.items()},
        "fcc13e": {"coverage_rule": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER", "proofs": ["PRD04-PROOF-57", "PRD04-PROOF-58"], "independent_observations_required": True},
        "human_judgement_rule": "A required human reviewer record may not be replaced by automation or an AI identity; absence yields INCONCLUSIVE.",
        "allocation_mode": "JUST-IN-TIME-ONE-PAIR",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "proof_execution": "NOT-STARTED",
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
        "w5": "CLOSED",
        "prd08": "CLOSED",
        "issues": sorted(set(issues)),
    }


def write_execution_admission(
    implementation_commit: str,
    checkpoint_ci: Sequence[Mapping[str, Any]] = (),
) -> Dict[str, Any]:
    value = build_execution_admission(implementation_commit, checkpoint_ci)
    EXECUTION_ADMISSION_PATH.parent.mkdir(parents=True, exist_ok=True)
    EXECUTION_ADMISSION_PATH.write_bytes(canonical_bytes(value))
    return value


def execution_admission_issues(
    source_revision: str,
    *,
    require_initial_high_water: bool,
    check_local: bool = True,
) -> Tuple[str, ...]:
    issues: List[str] = []
    if not EXECUTION_ADMISSION_PATH.is_file():
        return ("W4 governed execution admission is missing",)
    admission = load_json(EXECUTION_ADMISSION_PATH)
    if admission.get("schema_version") != "prd07-w4-governed-execution-admission-v1" or admission.get("status") != "PASS":
        issues.append("W4 governed execution admission did not pass")
    implementation = str(admission.get("execution_implementation_commit", ""))
    checkpoint_ci = admission.get("execution_checkpoint_ci", [])
    if not isinstance(checkpoint_ci, list) or len(checkpoint_ci) != 2 or {
        row.get("workflow") for row in checkpoint_ci if isinstance(row, dict)
    } != {"Brain integrity", "Engineering governance integrity"}:
        issues.append("W4 execution admission lacks both checkpoint CI results")
    elif any(
        not isinstance(row, dict)
        or row.get("head_sha") != implementation
        or row.get("conclusion") != "success"
        or not isinstance(row.get("run_id"), int)
        for row in checkpoint_ci
    ):
        issues.append("W4 execution admission checkpoint CI is not exact and successful")
    if _COMMIT.fullmatch(source_revision) is None or _git("rev-parse", "HEAD") != source_revision:
        issues.append("execution source revision does not equal current HEAD")
    if not implementation or subprocess.run(["git", "merge-base", "--is-ancestor", implementation, source_revision], cwd=ROOT).returncode:
        issues.append("execution implementation commit is not an ancestor of source revision")
    if admission.get("proof_order") != list(EXECUTION_ROSTER) or admission.get("identity_order") != _identity_order("AUTHORIZED-JIT-NOT-ALLOCATED"):
        issues.append("W4 execution admission proof/identity order differs")
    if admission.get("proof_execution") != "NOT-STARTED" or admission.get("allocated_run_ids") != [] or admission.get("allocated_evidence_ids") != []:
        issues.append("W4 execution admission executed or allocated")
    source_boundary = admission.get("source_boundary", {})
    if (
        not isinstance(source_boundary, dict)
        or source_boundary.get("path") != SOURCE_BOUNDARY_PATH.relative_to(ROOT).as_posix()
        or not SOURCE_BOUNDARY_PATH.is_file()
        or source_boundary.get("sha256") != canonical_file_sha256(SOURCE_BOUNDARY_PATH)
    ):
        issues.append("W4 execution admission source-boundary identity differs")
    issues.extend(
        source_boundary_issues(
            source_revision,
            require_initial_high_water=require_initial_high_water,
            check_local=False,
        )
    )
    for record in admission.get("execution_source_artifacts", []):
        if not isinstance(record, dict):
            issues.append("execution admission contains a malformed artifact row")
            continue
        issues.extend(_artifact_record_issues(record, require_current=True))
    expected_source_paths = [path.relative_to(ROOT).as_posix() for path in execution_source_paths()]
    actual_source_paths = [
        str(record.get("path", ""))
        for record in admission.get("execution_source_artifacts", [])
        if isinstance(record, dict)
    ]
    if actual_source_paths != expected_source_paths:
        issues.append("W4 execution admission source path set differs")
    readiness_records = admission.get("readiness_artifacts", {})
    for key in ("readiness", "admission"):
        record = readiness_records.get(key, {}) if isinstance(readiness_records, dict) else {}
        path = ROOT / str(record.get("path", ""))
        if not path.is_file() or canonical_file_sha256(path) != record.get("sha256"):
            issues.append("certified readiness artifact differs: " + key)
    issues.extend(historical_readiness_issues())
    if check_local:
        issues.extend(protected_local_issues())
        local = local_dependency_report()
        if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
            issues.extend(str(value) for value in local.get("issues", ["local dependency identity failed"]))
        try:
            if _git("branch", "--show-current") != EXPECTED_BRANCH or _git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}") != EXPECTED_UPSTREAM:
                issues.append("branch/upstream execution authority differs")
            if _git("rev-parse", "@{u}") != source_revision:
                issues.append("source revision is not published exactly to upstream")
        except RuntimeError as exc:
            issues.append(str(exc))
    governed_relatives = [record["path"] for record in admission.get("execution_source_artifacts", []) if isinstance(record, dict) and record.get("path")]
    governed_relatives.extend([READINESS_PATH.relative_to(ROOT).as_posix(), READINESS_ADMISSION_PATH.relative_to(ROOT).as_posix(), EXECUTION_ADMISSION_PATH.relative_to(ROOT).as_posix()])
    if check_local and _git("status", "--porcelain", "--", *governed_relatives):
        issues.append("governed W4 execution/admission source has uncommitted changes")
    if require_initial_high_water:
        try:
            registry = inspect_execution_registry(ROOT)
            if registry.max_run_number != 65 or registry.max_evidence_number != 65 or STATE_PATH.exists():
                issues.append("initial W4 execution high-water/state is not exactly unallocated 0065")
        except Exception as exc:
            issues.append("execution registry is ambiguous: " + str(exc))
    return tuple(sorted(set(issues)))


def proof_contracts_by_id() -> Mapping[str, Dict[str, Any]]:
    readiness = load_json(READINESS_PATH)
    rows = readiness.get("proofs", [])
    return {str(row["proof_id"]): dict(row) for row in rows if isinstance(row, dict)}


def fixture_identity(fixture_ids: Sequence[str]) -> Dict[str, Any]:
    paths: List[str] = []
    hashes: List[str] = []
    for fixture_id in fixture_ids:
        for relative in FIXTURE_PATHS[fixture_id]:
            paths.append(relative)
            hashes.append(sha256_file(ROOT / relative))
    return {"paths": paths, "sha256": hashes}
