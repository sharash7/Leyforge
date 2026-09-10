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
EXECUTION_ADMISSION_PATH = ROOT / "docs/rebuild/r7/w4-governed-execution-admission.json"
STATE_PATH = ROOT / "docs/rebuild/r7/w4-execution-state.json"
RETAINED_ROOT = ROOT / "docs/rebuild/r7/execution-evidence"
_COMMIT = re.compile(r"^[0-9a-f]{40}$")

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


def execution_source_paths() -> Tuple[Path, ...]:
    paths = set()
    for base in (ROOT / "tools/r7_w4_execution", ROOT / "proofs/r7/w4_execution"):
        if base.is_dir():
            paths.update(
                path for path in base.rglob("*")
                if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() != ".pyc"
            )
    for relative in (
        "tools/tests/test_r7_w4_execution.py",
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
        data = path.read_bytes()
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


def historical_readiness_issues() -> Tuple[str, ...]:
    issues: List[str] = []
    if not READINESS_PATH.is_file() or not READINESS_ADMISSION_PATH.is_file():
        return ("certified W4 readiness/admission artifact is missing",)
    stored = load_json(READINESS_PATH)
    regenerated = readiness_report(READINESS_IMPLEMENTATION_COMMIT, check_local=True)
    if stored != regenerated:
        issues.append("certified W4 readiness differs from canonical regeneration")
    if stored.get("status") != "PASS" or stored.get("proof_roster") != list(EXECUTION_ROSTER):
        issues.append("certified W4 readiness does not admit the exact roster")
    if stored.get("readiness_counts") != {"READY": 15, "BLOCKED": 0, "NOT APPLICABLE": 0}:
        issues.append("certified W4 readiness is not 15/15 READY")
    if stored.get("allocated_run_ids") != [] or stored.get("allocated_evidence_ids") != []:
        issues.append("certified W4 readiness contains allocated identities")
    admission = load_json(READINESS_ADMISSION_PATH)
    issues.extend(manifest_issues(admission, READINESS_IMPLEMENTATION_COMMIT))
    issues.extend(fixture_issues())
    return tuple(sorted(set(issues)))


def initial_authority_issues() -> Tuple[str, ...]:
    """Checks that must pass while high-water is still exactly 0065."""
    issues = list(historical_readiness_issues())
    issues.extend(protected_local_issues())
    try:
        branch = _git("branch", "--show-current")
        upstream = _git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}")
        head = _git("rev-parse", "HEAD")
        upstream_sha = _git("rev-parse", "@{u}")
        if branch != EXPECTED_BRANCH:
            issues.append("current branch differs from execution authority")
        if upstream != EXPECTED_UPSTREAM:
            issues.append("configured upstream differs from execution authority")
        if head != upstream_sha:
            issues.append("local HEAD and upstream are not synchronized")
        ancestor = subprocess.run(
            ["git", "merge-base", "--is-ancestor", READINESS_PACKAGE_COMMIT, head],
            cwd=ROOT,
            text=True,
            capture_output=True,
        )
        if ancestor.returncode:
            issues.append("certified readiness package is not an ancestor of execution HEAD")
    except RuntimeError as exc:
        issues.append(str(exc))
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
    local = local_dependency_report()
    if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
        issues.extend(str(value) for value in local.get("issues", ["local dependency identity failed"]))
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        if (ROOT / relative).exists():
            issues.append("root production boundary exists: " + relative)
    return tuple(sorted(set(issues)))


def build_execution_admission(implementation_commit: str) -> Dict[str, Any]:
    if _COMMIT.fullmatch(implementation_commit) is None:
        raise ValueError("implementation commit must be an exact lowercase commit")
    if _git("rev-parse", "HEAD") != implementation_commit:
        raise ValueError("execution admission must be generated at its exact implementation commit")
    issues = list(initial_authority_issues())
    paths = execution_source_paths()
    if not paths:
        issues.append("execution source set is empty")
    source_artifacts = artifact_records(paths, implementation_commit)
    readiness = load_json(READINESS_PATH)
    readiness_admission = load_json(READINESS_ADMISSION_PATH)
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
            "readiness": {"path": READINESS_PATH.relative_to(ROOT).as_posix(), "sha256": sha256_file(READINESS_PATH)},
            "admission": {"path": READINESS_ADMISSION_PATH.relative_to(ROOT).as_posix(), "sha256": sha256_file(READINESS_ADMISSION_PATH)},
            "source_tree_identity": readiness.get("source_tree_identity"),
            "admission_boundary_sha256": hashlib.sha256(canonical_bytes(readiness_admission)).hexdigest(),
        },
        "execution_source_artifacts": source_artifacts,
        "proof_order": list(EXECUTION_ROSTER),
        "identity_order": [
            {
                "order": index + 1,
                "proof_id": proof_id,
                "run_id": "PRD07-RUN-{0:04d}".format(66 + index),
                "evidence_id": "PRD07-EVID-{0:04d}".format(66 + index),
                "state": "AUTHORIZED-JIT-NOT-ALLOCATED",
            }
            for index, proof_id in enumerate(EXECUTION_ROSTER)
        ],
        "starting_ci": [
            {"workflow": "Brain integrity", "run_id": 34462561751, "head_sha": READINESS_PACKAGE_COMMIT, "conclusion": "success", "verification": "PUBLIC-GITHUB-ACTIONS-API"},
            {"workflow": "Engineering governance integrity", "run_id": 34462561583, "head_sha": READINESS_PACKAGE_COMMIT, "conclusion": "success", "verification": "PUBLIC-GITHUB-ACTIONS-API"},
        ],
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


def write_execution_admission(implementation_commit: str) -> Dict[str, Any]:
    value = build_execution_admission(implementation_commit)
    EXECUTION_ADMISSION_PATH.parent.mkdir(parents=True, exist_ok=True)
    EXECUTION_ADMISSION_PATH.write_bytes(canonical_bytes(value))
    return value


def execution_admission_issues(source_revision: str, *, require_initial_high_water: bool) -> Tuple[str, ...]:
    issues: List[str] = []
    if not EXECUTION_ADMISSION_PATH.is_file():
        return ("W4 governed execution admission is missing",)
    admission = load_json(EXECUTION_ADMISSION_PATH)
    if admission.get("schema_version") != "prd07-w4-governed-execution-admission-v1" or admission.get("status") != "PASS":
        issues.append("W4 governed execution admission did not pass")
    implementation = str(admission.get("execution_implementation_commit", ""))
    if _COMMIT.fullmatch(source_revision) is None or _git("rev-parse", "HEAD") != source_revision:
        issues.append("execution source revision does not equal current HEAD")
    if not implementation or subprocess.run(["git", "merge-base", "--is-ancestor", implementation, source_revision], cwd=ROOT).returncode:
        issues.append("execution implementation commit is not an ancestor of source revision")
    if _git("branch", "--show-current") != EXPECTED_BRANCH or _git("rev-parse", "--abbrev-ref", "--symbolic-full-name", "@{u}") != EXPECTED_UPSTREAM:
        issues.append("branch/upstream execution authority differs")
    if _git("rev-parse", "@{u}") != source_revision:
        issues.append("source revision is not published exactly to upstream")
    for record in admission.get("execution_source_artifacts", []):
        if not isinstance(record, dict):
            issues.append("execution admission contains a malformed artifact row")
            continue
        path = ROOT / str(record.get("path", ""))
        if not path.is_file() or path.stat().st_size != record.get("bytes") or sha256_file(path) != record.get("sha256"):
            issues.append("execution source artifact differs: " + str(record.get("path", "")))
    readiness_records = admission.get("readiness_artifacts", {})
    for key in ("readiness", "admission"):
        record = readiness_records.get(key, {}) if isinstance(readiness_records, dict) else {}
        path = ROOT / str(record.get("path", ""))
        if not path.is_file() or sha256_file(path) != record.get("sha256"):
            issues.append("certified readiness artifact differs: " + key)
    issues.extend(historical_readiness_issues())
    issues.extend(protected_local_issues())
    local = local_dependency_report()
    if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
        issues.extend(str(value) for value in local.get("issues", ["local dependency identity failed"]))
    governed_relatives = [record["path"] for record in admission.get("execution_source_artifacts", []) if isinstance(record, dict) and record.get("path")]
    governed_relatives.extend([READINESS_PATH.relative_to(ROOT).as_posix(), READINESS_ADMISSION_PATH.relative_to(ROOT).as_posix(), EXECUTION_ADMISSION_PATH.relative_to(ROOT).as_posix()])
    if _git("status", "--porcelain", "--", *governed_relatives):
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
