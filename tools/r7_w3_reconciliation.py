"""Terminal reconciliation for the governed R7 W3 execution rerun.

The execution runtime deliberately remains pinned to its certified pre-execution
admission.  This module certifies the later timepoint without rewriting that
historical admission or the earlier invalidated 0058 journal snapshot.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, Iterable, Mapping, Optional, Sequence, Tuple


ROOT = Path(__file__).resolve().parents[1]
STATE_PATH = ROOT / "docs/rebuild/r7/w3-execution-state.json"
PRE_EXECUTION_BOUNDARY_PATH = ROOT / "docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json"
PRE_EXECUTION_READINESS_PATH = ROOT / "docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json"
TERMINAL_READINESS_PATH = ROOT / "docs/rebuild/r7/w3-readiness-execution-complete.json"
TERMINAL_BOUNDARY_PATH = ROOT / "docs/rebuild/r7/w3-execution-boundary-execution-complete.json"
COMPLETION_RECEIPT_PATH = ROOT / "docs/rebuild/r7/w3-execution-completion-receipt.json"
EVIDENCE_ROOT = ROOT / "docs/rebuild/r7/execution-evidence"
DEPENDENCY_LOCK_PATH = ROOT / "proofs/r7/w0/dependencies.lock.json"
DEPENDENCY_REFERENCE_PATH = ROOT / "proofs/r7/w3/dependency-reference.json"

PROOF_IMPLEMENTATION_COMMIT = "05f5e8934cc0e99044117e1af4166bb424272e2f"
PROOF_SOURCE_TREE_IDENTITY = "ae78f07192fc7f1aa1e32d238c90303297426002556735e1c2aaacec56f93bd2"
EXPECTED_PROOF_ORDER: Tuple[Tuple[str, str, str], ...] = (
    ("PRD04-PROOF-27", "PRD07-RUN-0059", "PRD07-EVID-0059"),
    ("PRD04-PROOF-28", "PRD07-RUN-0060", "PRD07-EVID-0060"),
    ("PRD04-PROOF-08", "PRD07-RUN-0061", "PRD07-EVID-0061"),
    ("PRD04-PROOF-30", "PRD07-RUN-0062", "PRD07-EVID-0062"),
    ("PRD04-PROOF-29", "PRD07-RUN-0063", "PRD07-EVID-0063"),
    ("PRD04-PROOF-31", "PRD07-RUN-0064", "PRD07-EVID-0064"),
    ("PRD04-PROOF-32", "PRD07-RUN-0065", "PRD07-EVID-0065"),
)
EXPECTED_CANONICAL_PROOFS = (
    "PRD04-PROOF-08",
    "PRD04-PROOF-27",
    "PRD04-PROOF-28",
    "PRD04-PROOF-29",
    "PRD04-PROOF-30",
    "PRD04-PROOF-31",
    "PRD04-PROOF-32",
)
EXPECTED_QUARANTINE_RUNS = tuple(f"PRD07-RUN-{number:04d}" for number in range(51, 58))
EXPECTED_QUARANTINE_EVIDENCE = tuple(f"PRD07-EVID-{number:04d}" for number in range(51, 58))
EXPECTED_JOURNAL_RUNS = ("PRD07-RUN-0058",) + tuple(row[1] for row in EXPECTED_PROOF_ORDER)
EXPECTED_JOURNAL_EVIDENCE = ("PRD07-EVID-0058",) + tuple(row[2] for row in EXPECTED_PROOF_ORDER)

EXPECTED_DEPENDENCIES = {
    "godot_build_driver": "a9c94cd21fc1e95c56a17aca0b310c346e6c41fa",
    "godot_export_template": "4.8.dev4.official.b56a91878",
    "voxel_tools": "75d3c6d996ed2331c80edcd8c3ebc947afc0f041",
}
EXPECTED_ENVIRONMENT_HASHES = {
    "godot_build_driver_sha256": "06e7be7ed0298e81be421076a4a3166a7ae0e6b72c8a948d6faefd5823b3ee1a",
    "godot_export_template_sha256": "d66dd49185e7d6bc27594f755347ca68f8e3828f074742b1788a98950491ac3f",
    "voxel_tools_package_sha256": "600737572a5e25541ba6f503e842a3717ba19afafa5474510a6ceff995a1d2d8",
}

# These are immutable, previously certified timepoints.  The live execution
# journal is intentionally not in this table because its append-only value
# advanced from the 0058 abort to the 0059-0065 observations.
IMMUTABLE_FILE_IDENTITIES: Mapping[str, Tuple[str, str]] = {
    "docs/rebuild/r7/w3-readiness-corrected.json": (
        "1d0ff29bb87bc98583ce57b2d612bb0a0a351b93",
        "9747c51ab5733a4aec5b5ed06f08bc29bc8b4e4ad7c51140209f0496c0a15b9b",
    ),
    "docs/rebuild/r7/w3-execution-boundary-corrected.json": (
        "c20ce6472c62a15f50cde470f9209a3f6131b25b",
        "1cf0af9d514c1b6f342e524dc162172eab36444ce78fccbbaadcfd61cb378407",
    ),
    "docs/rebuild/r7/w3-readiness-repaired.json": (
        "46410e3808d7e840e773a594f5471e04f313d1d1",
        "795c260812bcbd9362d089594b601551714b88d52816a78a32794349bd68b258",
    ),
    "docs/rebuild/r7/w3-execution-boundary-repaired.json": (
        "9ecc03d0f8a6cff278de537a81f4b3bc60018bac",
        "90af508c949a9039d6a147331417140c18c88a2ca475c5438c0a0c03cc14c799",
    ),
    "docs/rebuild/r7/w3-pinned-engine-validation.json": (
        "cd407485ee3ff40d27207dbccc004d90716ea015",
        "73988e7fe0d12f6dde6ac0a12e147915007d0378e88be8ffcec952eb13e39650",
    ),
    "docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json": (
        "c43eb6065f29fe95c0f56394e14c6788f6e0c12a",
        "ec3ad1decbc406110312f06160fa0d983996980859c34c251de42eba5b9c7d59",
    ),
    "docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json": (
        "482d8939faaab917fca74986e935b20915656475",
        "998a26443e5475cb1ab99113fb8f5ef8e232897d4be4a1dfd4d08e3ddca2bedf",
    ),
    "docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json": (
        "6d3e864e0e9886f3ff3a259b5477d50947c00f4e",
        "cb1d788f5fe58069799f02506c73f5da03fdae37281b41693f5ba271b42af613",
    ),
    "docs/rebuild/r7/w3-fixture-launch-integration.json": (
        "e36a19c9a259a2ce6525a1720f7bcfb4bc020390",
        "3346e9177ab9e5d4a1f6d506a4b77d8516f521f041f5241d561913608b28840d",
    ),
    "brain/10_TESTING/Evidence/r7-w3-execution-rerun-abort-20260909.json": (
        "b25f34bac8e853a0c29c52d70169db3c26d81dfd",
        "d7aa315ff7da6aafec0cebade181420c1e6d45a6db6135cfcab8a5fb59a69517",
    ),
    "brain/10_TESTING/Evidence/r7-w3-execution-rerun-abort-20260909-error.txt": (
        "6f6cb4838f9e74843fef0001250deaf945cd007d",
        "8a04efaa1b78a8d09cdbc7567ad6b132501855d4baa2a5b6e791955536714675",
    ),
    "brain/10_TESTING/Evidence/EVID-0011.md": (
        "219e9582371a4c5bca7d0f74ca05feab283a664b",
        "a8a9aeeddd0ad0caf735499bd014d64567530c27632bbfeaaa0f1743aa949df2",
    ),
    "brain/11_AUDIT/Reports/AUDIT-0011.md": (
        "dd8606f27862f57c20dc6eeacfee7a566f059098",
        "cdffe557584eeb4a2aeae4ed67fd6035fb98529280c18d5a4e5eb48cb620bdcd",
    ),
}
ABORT_STATE_IDENTITY = {
    "git_blob": "b2c53bdb5d7a8563e7dc1b925f4b2ad7827c7fac",
    "sha256": "09d8ea9d47d3fedc074d9426b8a6602e5c471b58c898e0c3dcace8ace881d4a1",
    "bytes": 6505,
}

FIXED_ADMISSION_FILES = (
    "tools/r7_w3_reconciliation.py",
    "tools/tests/test_r7_w3_reconciliation.py",
    "tools/tests/test_r7_w3_runtime.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
    "docs/rebuild/r7/w3-allocation-reconciliation.json",
    "docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json",
    "docs/rebuild/r7/w3-fixture-launch-integration.json",
    "docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json",
    "docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json",
    "docs/rebuild/r7/w3-readiness-execution-complete.json",
    "docs/rebuild/r7/w3-execution-state.json",
)
FIXED_ADMISSION_TREES = ("proofs/r7/w3", "tools/r7_w3_runtime")


def _canonical_bytes(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def _load(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError(f"JSON record is not an object: {path}")
    return value


def _git(*args: str, binary: bool = False) -> Any:
    completed = subprocess.run(
        ["git", *args],
        cwd=ROOT,
        text=not binary,
        capture_output=True,
    )
    if completed.returncode:
        error = completed.stderr.decode(errors="replace") if binary else completed.stderr
        raise RuntimeError((error or "git command failed").strip())
    return completed.stdout if binary else completed.stdout.strip()


def _git_blob(path: Path) -> str:
    return str(_git("hash-object", "--", path.relative_to(ROOT).as_posix()))


def _blob_at(commit: str, relative: str) -> str:
    return str(_git("rev-parse", f"{commit}:{relative}"))


def _artifact_identity(path: Path) -> Dict[str, Any]:
    data = _canonical_bytes(path)
    return {
        "path": path.relative_to(ROOT).as_posix(),
        "git_blob": _git_blob(path),
        "sha256": hashlib.sha256(data).hexdigest(),
        "bytes": len(data),
    }


def _commit_exists(commit: str) -> bool:
    if re.fullmatch(r"[0-9a-f]{40}", commit) is None:
        return False
    return subprocess.run(
        ["git", "cat-file", "-e", commit + "^{commit}"],
        cwd=ROOT,
        text=True,
        capture_output=True,
    ).returncode == 0


def _component_map(build: Mapping[str, Any]) -> Dict[str, Mapping[str, Any]]:
    return {
        str(row.get("name")): row
        for row in build.get("components", [])
        if isinstance(row, dict)
    }


def _admitted_paths(root: Path = ROOT) -> Tuple[str, ...]:
    paths = {relative for relative in FIXED_ADMISSION_FILES if (root / relative).is_file()}
    for relative in FIXED_ADMISSION_TREES:
        base = root / relative
        if base.is_dir():
            paths.update(
                path.relative_to(root).as_posix()
                for path in base.rglob("*")
                if path.is_file()
                and "__pycache__" not in path.parts
                and path.suffix.lower() not in {".pyc", ".exe", ".dll", ".pck"}
            )
    for _, run_id, _ in EXPECTED_PROOF_ORDER:
        base = root / "docs/rebuild/r7/execution-evidence" / run_id
        if base.is_dir():
            paths.update(
                path.relative_to(root).as_posix()
                for path in base.rglob("*")
                if path.is_file() and path.suffix.lower() not in {".exe", ".dll", ".pck"}
            )
    paths.discard(TERMINAL_BOUNDARY_PATH.relative_to(root).as_posix())
    paths.discard(COMPLETION_RECEIPT_PATH.relative_to(root).as_posix())
    return tuple(sorted(paths))


def _registry_summary() -> Dict[str, Any]:
    return {
        "run_high_water": 65,
        "evidence_high_water": 65,
        "issued_identity_count": 65,
        "retained_identity_count": 57,
        "quarantined_identity_count": 7,
        "invalidated_identity_count": 1,
        "next_future_sequence": 66,
        "retained_ranges": ["0001-0050", "0059-0065"],
        "quarantined_range": "0051-0057",
        "invalidated_identities": ["PRD07-RUN-0058", "PRD07-EVID-0058"],
        "state_paths": [
            "docs/rebuild/r7/w0-execution-state.json",
            "docs/rebuild/r7/w1-execution-state.json",
            "docs/rebuild/r7/w2-execution-state.json",
            "docs/rebuild/r7/w3-execution-state.json",
        ],
        "quarantine_paths": ["docs/rebuild/r7/w3-allocation-reconciliation.json"],
    }


def audit_execution(
    executed_source_revision: str,
    evidence_commit: str,
    *,
    root: Path = ROOT,
) -> Dict[str, Any]:
    """Return detailed, fail-closed checks over the terminal execution evidence."""
    issues = []
    checks = 0

    def check(condition: bool, message: str) -> None:
        nonlocal checks
        checks += 1
        if not condition:
            issues.append(message)

    check(_commit_exists(executed_source_revision), "executed source revision is not an exact repository commit")
    check(_commit_exists(evidence_commit), "execution evidence commit is not an exact repository commit")
    if _commit_exists(evidence_commit):
        ancestor = subprocess.run(
            ["git", "merge-base", "--is-ancestor", evidence_commit, "HEAD"],
            cwd=root,
            text=True,
            capture_output=True,
        )
        check(ancestor.returncode == 0, "execution evidence commit is not an ancestor of current HEAD")

    for relative, (expected_blob, expected_sha256) in IMMUTABLE_FILE_IDENTITIES.items():
        path = root / relative
        check(path.is_file(), "immutable W3 artifact is missing: " + relative)
        if path.is_file():
            check(_git_blob(path) == expected_blob, "immutable W3 artifact Git blob changed: " + relative)
            check(
                hashlib.sha256(_canonical_bytes(path)).hexdigest() == expected_sha256,
                "immutable W3 artifact canonical SHA-256 changed: " + relative,
            )

    abort_blob_exists = subprocess.run(
        ["git", "cat-file", "-e", ABORT_STATE_IDENTITY["git_blob"] + "^{blob}"],
        cwd=root,
        text=True,
        capture_output=True,
    )
    check(abort_blob_exists.returncode == 0, "immutable 0058 abort-state blob is missing")
    if abort_blob_exists.returncode == 0:
        data = _git("cat-file", "blob", ABORT_STATE_IDENTITY["git_blob"], binary=True)
        canonical = data.replace(b"\r\n", b"\n").replace(b"\r", b"\n")
        check(len(canonical) == ABORT_STATE_IDENTITY["bytes"], "immutable 0058 abort-state byte count changed")
        check(
            hashlib.sha256(canonical).hexdigest() == ABORT_STATE_IDENTITY["sha256"],
            "immutable 0058 abort-state SHA-256 changed",
        )

    state = _load(root / STATE_PATH.relative_to(ROOT)) if (root / STATE_PATH.relative_to(ROOT)).is_file() else {}
    check(bool(state), "terminal W3 execution state is missing")
    check(state.get("schema_version") == "prd07-w3-execution-state-v2", "terminal W3 execution schema changed")
    check(state.get("package_state") == "W3-EXECUTION-COMPLETE", "W3 execution journal is not complete")
    check(state.get("latest_source_revision") == executed_source_revision, "W3 journal latest source revision differs")
    check(state.get("gameplay_permission") == "CLOSED", "W3 journal opened gameplay permission")
    check(state.get("prd08_evaluation") == "CLOSED", "W3 journal opened PRD-08 evaluation")
    state_runs = state.get("allocated_run_ids", [])
    state_evidence = state.get("allocated_evidence_ids", [])
    history = state.get("allocation_history", [])
    proofs = state.get("proofs", [])
    check(state_runs == list(EXPECTED_JOURNAL_RUNS), "W3 journal RUN allocation order differs from 0058-0065")
    check(state_evidence == list(EXPECTED_JOURNAL_EVIDENCE), "W3 journal EVID allocation order differs from 0058-0065")
    check(isinstance(history, list) and len(history) == 8, "W3 allocation history does not contain exactly eight issued attempts")
    if isinstance(history, list):
        check([row.get("run_id") for row in history if isinstance(row, dict)] == list(EXPECTED_JOURNAL_RUNS), "W3 history RUN order differs")
        check([row.get("evidence_id") for row in history if isinstance(row, dict)] == list(EXPECTED_JOURNAL_EVIDENCE), "W3 history EVID order differs")
        check(all(isinstance(row, dict) for row in history), "W3 allocation history contains a non-object row")
    history_rows = [row for row in history if isinstance(row, dict)] if isinstance(history, list) else []
    if history_rows:
        invalidated = history_rows[0]
        check(invalidated.get("allocation_order") == 1, "invalidated 0058 allocation order changed")
        check(invalidated.get("proof_id") == "PRD04-PROOF-27", "invalidated 0058 proof mapping changed")
        check(invalidated.get("run_id") == "PRD07-RUN-0058" and invalidated.get("evidence_id") == "PRD07-EVID-0058", "invalidated 0058 identity changed")
        check(invalidated.get("state") == "INVALIDATED", "0058 is no longer invalidated")
        check(invalidated.get("terminal_disposition") == "ABORTED-BEFORE-PROOF-OBSERVATION", "0058 abort disposition changed")
        check(invalidated.get("proof_observation_produced") is False, "0058 claims a proof observation")
        check(invalidated.get("evidence_pack_status") == "NOT-CREATED-NO-PROOF-OBSERVATION", "0058 claims a retained pack")
        check(invalidated.get("prd07_evidence_eligible") is False, "0058 became evidence-eligible")
    for offset, expected in enumerate(EXPECTED_PROOF_ORDER, start=2):
        row = history_rows[offset - 1] if len(history_rows) >= offset else {}
        proof_id, run_id, evidence_id = expected
        check(row.get("allocation_order") == offset, f"{run_id} allocation order changed")
        check((row.get("proof_id"), row.get("run_id"), row.get("evidence_id")) == expected, f"{run_id} proof/RUN/EVID mapping changed")
        check(row.get("state") == "PASS-OBSERVED", f"{run_id} is not PASS-OBSERVED")
        check(row.get("proof_observation_produced") is True, f"{run_id} lacks an actual proof observation")
        check(row.get("evidence_pack_status") == "RETAINED", f"{run_id} pack is not retained")
        check(row.get("prd07_evidence_eligible") is True, f"{run_id} is not PRD-07 evidence-eligible")
        check(row.get("prd08_submission") == "NOT-SUBMITTED", f"{run_id} was submitted to PRD-08")
        check(row.get("blockers") == [] and row.get("limitations") == [], f"{run_id} contains a blocker or limitation")

    check(isinstance(proofs, list) and [row.get("proof_id") for row in proofs if isinstance(row, dict)] == list(EXPECTED_CANONICAL_PROOFS), "W3 proof summary set/order changed")
    proof_map = {row.get("proof_id"): row for row in proofs if isinstance(row, dict)} if isinstance(proofs, list) else {}
    for proof_id, run_id, evidence_id in EXPECTED_PROOF_ORDER:
        row = proof_map.get(proof_id, {})
        check((row.get("run_id"), row.get("evidence_id"), row.get("state")) == (run_id, evidence_id, "PASS-OBSERVED"), f"terminal proof summary differs for {proof_id}")
        check(row.get("prd08_submission") == "NOT-SUBMITTED", f"terminal proof summary submitted {proof_id} to PRD-08")

    quarantine_path = root / "docs/rebuild/r7/w3-allocation-reconciliation.json"
    quarantine = _load(quarantine_path) if quarantine_path.is_file() else {}
    check(quarantine.get("schema_version") == "prd07-w3-allocation-reconciliation-v1", "W3 quarantine schema changed")
    check(quarantine.get("status") == "AUTHORITATIVE-QUARANTINE", "W3 quarantine is not authoritative")
    check(quarantine.get("allocated_run_ids") == list(EXPECTED_QUARANTINE_RUNS), "quarantined RUN range differs from 0051-0057")
    check(quarantine.get("allocated_evidence_ids") == list(EXPECTED_QUARANTINE_EVIDENCE), "quarantined EVID range differs from 0051-0057")
    allocations = quarantine.get("allocations", [])
    check(isinstance(allocations, list) and len(allocations) == 7, "W3 quarantine allocation count changed")
    for index, row in enumerate(allocations if isinstance(allocations, list) else []):
        check(isinstance(row, dict), "W3 quarantine contains a non-object row")
        if not isinstance(row, dict):
            continue
        check(row.get("run_id") == EXPECTED_QUARANTINE_RUNS[index], "W3 quarantine RUN order changed")
        check(row.get("evidence_id") == EXPECTED_QUARANTINE_EVIDENCE[index], "W3 quarantine EVID order changed")
        check(row.get("prd07_evidence_eligible") is False and row.get("retained_pack") is False and row.get("reusable") is False, "W3 quarantine identity became reusable or evidence-eligible")

    expected_pack_ids = {f"PRD07-RUN-{number:04d}" for number in range(1, 51)} | {row[1] for row in EXPECTED_PROOF_ORDER}
    actual_pack_ids = {path.name for path in EVIDENCE_ROOT.iterdir() if path.is_dir() and re.fullmatch(r"PRD07-RUN-\d{4}", path.name)} if EVIDENCE_ROOT.is_dir() else set()
    check(actual_pack_ids == expected_pack_ids, "retained evidence-pack registry differs from 0001-0050 plus 0059-0065")
    check(not (EVIDENCE_ROOT / "PRD07-RUN-0058").exists(), "invalidated 0058 unexpectedly has a retained pack")
    for run_id in EXPECTED_QUARANTINE_RUNS:
        check(not (EVIDENCE_ROOT / run_id).exists(), f"quarantined identity unexpectedly has a retained pack: {run_id}")

    reference = _load(root / DEPENDENCY_REFERENCE_PATH.relative_to(ROOT)) if (root / DEPENDENCY_REFERENCE_PATH.relative_to(ROOT)).is_file() else {}
    lock = _load(root / DEPENDENCY_LOCK_PATH.relative_to(ROOT)) if (root / DEPENDENCY_LOCK_PATH.relative_to(ROOT)).is_file() else {}
    check(reference.get("component_revisions") == EXPECTED_DEPENDENCIES, "W3 dependency reference revisions changed")
    check(reference.get("local_patch_status") == "NO-LOCAL-PATCH", "W3 dependency reference acquired a local patch")
    check(lock.get("local_patch_status") == "NO-LOCAL-PATCH", "W3 dependency lock acquired a local patch")
    state_exports = state.get("export_lanes", {}) if isinstance(state, dict) else {}
    check(isinstance(state_exports, dict) and set(state_exports) == {"client", "headless"}, "W3 execution export lanes differ")
    role_by_proof = {
        "PRD04-PROOF-27": "headless",
        "PRD04-PROOF-28": "headless",
        "PRD04-PROOF-08": "headless",
        "PRD04-PROOF-29": "headless",
        "PRD04-PROOF-30": "client",
        "PRD04-PROOF-31": "client",
        "PRD04-PROOF-32": "client",
    }
    pack_rows = []
    evidence_paths = []
    for proof_id, run_id, evidence_id in EXPECTED_PROOF_ORDER:
        pack = EVIDENCE_ROOT / run_id
        required = {"run.json", "build-manifest.json", "artifact-manifest.json", "observed-result.json", "summary.md"}
        check(pack.is_dir(), f"retained W3 pack is missing: {run_id}")
        if not pack.is_dir():
            continue
        check(required.issubset({path.name for path in pack.iterdir() if path.is_file()}), f"retained W3 pack core files are incomplete: {run_id}")
        run = _load(pack / "run.json")
        build = _load(pack / "build-manifest.json")
        artifact = _load(pack / "artifact-manifest.json")
        observed = _load(pack / "observed-result.json")
        check((run.get("proof_id"), run.get("run_id"), run.get("evidence_id")) == (proof_id, run_id, evidence_id), f"portable pack identity differs: {run_id}")
        check(run.get("outcome") == "PASS-OBSERVED" and run.get("execution_kind") == "actual-governed-execution", f"portable pack outcome/kind differs: {run_id}")
        check(run.get("prd07_evidence_eligible") is True and run.get("prd08_submission") == "NOT-SUBMITTED", f"portable pack eligibility/submission differs: {run_id}")
        check(run.get("gameplay_permission") == "CLOSED", f"portable pack opened gameplay permission: {run_id}")
        check(run.get("source_revision") == executed_source_revision and build.get("source_revision") == executed_source_revision, f"portable pack source revision differs: {run_id}")
        check(hashlib.sha256((pack / "observed-result.json").read_bytes()).hexdigest() == run.get("evidence_sha256"), f"portable observed-result hash differs: {run_id}")
        check(observed.get("outcome") == "PASS", f"structured W3 observation is not PASS: {run_id}")
        check(observed.get("run_id") == run_id and observed.get("evidence_id") == evidence_id, f"structured W3 observation identity differs: {run_id}")
        check(artifact.get("manifest_schema") == "prd07-artifact-manifest-v1" and artifact.get("artifact_kind") == "leyforge-export", f"artifact manifest schema/kind differs: {run_id}")
        check(artifact.get("artifact_sha256") == run.get("artifact_sha256") and artifact.get("build_identity") == run.get("build_identity"), f"artifact/run identity differs: {run_id}")
        check(build.get("manifest_schema") == "prd07-build-manifest-v1" and build.get("build_identity") == run.get("build_identity"), f"build/run identity differs: {run_id}")
        components = _component_map(build)
        check(components.get("godot-build-driver", {}).get("revision") == EXPECTED_DEPENDENCIES["godot_build_driver"], f"Godot build-driver revision differs: {run_id}")
        check(components.get("godot", {}).get("revision") == EXPECTED_DEPENDENCIES["godot_export_template"], f"Godot export-template revision differs: {run_id}")
        check(components.get("voxel-tools", {}).get("revision") == EXPECTED_DEPENDENCIES["voxel_tools"], f"Voxel Tools revision differs: {run_id}")
        check(all(str(row.get("local_patch", "")).startswith("NO-LOCAL-PATCH") for row in components.values()), f"portable pack contains a locally patched dependency: {run_id}")
        environment = build.get("environment", {}) if isinstance(build.get("environment"), dict) else {}
        for key, expected_hash in EXPECTED_ENVIRONMENT_HASHES.items():
            check(environment.get(key) == expected_hash, f"environment hash differs for {key}: {run_id}")
        check(environment.get("local_patch_status") == "NO-LOCAL-PATCH", f"environment local-patch status differs: {run_id}")
        role = role_by_proof[proof_id]
        export = state_exports.get(role, {}) if isinstance(state_exports, dict) else {}
        check(run.get("build_identity") == export.get("build_identity") and run.get("artifact_sha256") == export.get("artifact_sha256"), f"proof pack does not match its {role} export: {run_id}")
        report = export.get("runtime_self_report", {}) if isinstance(export, dict) else {}
        check(report.get("status") == "PASS" and report.get("production_runtime") is False, f"{role} runtime self-report differs")
        check(report.get("provider_ready") is True and report.get("provider_errors") == 0, f"{role} provider self-report differs")
        check(report.get("contact_errors") == 0 and report.get("frame_round_trip_errors") == 0, f"{role} physics/frame self-report differs")
        for item in run.get("evidence_artifacts", []):
            check(isinstance(item, dict), f"portable evidence-artifact row is invalid: {run_id}")
            if not isinstance(item, dict):
                continue
            relative = str(item.get("path", ""))
            artifact_path = pack / relative
            check(".." not in Path(relative).parts and not Path(relative).is_absolute(), f"portable evidence-artifact path escapes its pack: {run_id}")
            check(artifact_path.is_file(), f"portable evidence artifact is missing: {run_id}/{relative}")
            if artifact_path.is_file():
                check(artifact_path.stat().st_size == item.get("bytes"), f"portable evidence-artifact byte count differs: {run_id}/{relative}")
                check(hashlib.sha256(artifact_path.read_bytes()).hexdigest() == item.get("sha256"), f"portable evidence-artifact hash differs: {run_id}/{relative}")
        pack_rows.append({
            "proof_id": proof_id,
            "run_id": run_id,
            "evidence_id": evidence_id,
            "state": "PASS-OBSERVED",
            "build_identity": run.get("build_identity"),
            "artifact_sha256": run.get("artifact_sha256"),
            "artifact_size_bytes": run.get("artifact_size_bytes"),
            "evidence_sha256": run.get("evidence_sha256"),
            "key_metrics": proof_map.get(proof_id, {}).get("key_metrics", {}),
            "acceptance_reason": proof_map.get(proof_id, {}).get("acceptance_reason", ""),
            "limitations": proof_map.get(proof_id, {}).get("limitations", []),
            "blockers": proof_map.get(proof_id, {}).get("blockers", []),
            "retained_pack": pack.relative_to(root).as_posix(),
            "prd08_submission": "NOT-SUBMITTED",
        })
        evidence_paths.extend(path.relative_to(root).as_posix() for path in sorted(pack.rglob("*")) if path.is_file())

    pre_boundary = _load(root / PRE_EXECUTION_BOUNDARY_PATH.relative_to(ROOT)) if (root / PRE_EXECUTION_BOUNDARY_PATH.relative_to(ROOT)).is_file() else {}
    check(pre_boundary.get("manifest_version") == 3, "certified pre-execution W3 boundary schema changed")
    check(pre_boundary.get("implementation_commit") == PROOF_IMPLEMENTATION_COMMIT, "certified W3 proof implementation commit changed")
    check(pre_boundary.get("source_tree_identity") == PROOF_SOURCE_TREE_IDENTITY, "certified W3 proof source-tree identity changed")
    check(pre_boundary.get("proof_execution") == "NOT-STARTED-FOR-NEXT-RERUN", "pre-execution W3 boundary no longer describes its timepoint")
    check(pre_boundary.get("allocated_run_ids") == [] and pre_boundary.get("allocated_evidence_ids") == [], "pre-execution W3 boundary was rewritten with later allocations")
    if _commit_exists(executed_source_revision):
        check(_blob_at(executed_source_revision, PRE_EXECUTION_BOUNDARY_PATH.relative_to(ROOT).as_posix()) == IMMUTABLE_FILE_IDENTITIES[PRE_EXECUTION_BOUNDARY_PATH.relative_to(ROOT).as_posix()][0], "executed source revision does not contain the certified pre-execution boundary")
        for artifact in pre_boundary.get("artifacts", []):
            check(isinstance(artifact, dict), "pre-execution admission contains a non-object artifact")
            if not isinstance(artifact, dict):
                continue
            relative = str(artifact.get("path", ""))
            try:
                source_blob = _blob_at(executed_source_revision, relative)
            except RuntimeError:
                source_blob = ""
            check(source_blob == artifact.get("git_blob"), "executed source revision differs from admitted artifact: " + relative)

    evidence_relatives = [STATE_PATH.relative_to(ROOT).as_posix(), *evidence_paths]
    if _commit_exists(evidence_commit):
        for relative in evidence_relatives:
            path = root / relative
            try:
                committed_blob = _blob_at(evidence_commit, relative)
            except RuntimeError:
                committed_blob = ""
            check(path.is_file() and committed_blob == _git_blob(path), "execution evidence differs from its immutable evidence commit: " + relative)

    for forbidden in ("project.godot", "addons", "scripts", "src", "development"):
        check(not (root / forbidden).exists(), "W3 reconciliation found forbidden production path: " + forbidden)

    return {
        "status": "PASS" if not issues else "FAIL",
        "checks": checks,
        "issues": sorted(set(issues)),
        "state": state,
        "proofs": pack_rows,
        "exports": state_exports,
        "registry": _registry_summary(),
        "dependency_identity": EXPECTED_DEPENDENCIES,
        "environment_hashes": EXPECTED_ENVIRONMENT_HASHES,
        "executed_source_revision": executed_source_revision,
        "execution_evidence_commit": evidence_commit,
    }


def build_terminal_readiness(executed_source_revision: str, evidence_commit: str) -> Dict[str, Any]:
    audit = audit_execution(executed_source_revision, evidence_commit)
    if audit["status"] != "PASS":
        raise RuntimeError("W3 execution cannot be reconciled: " + "; ".join(audit["issues"]))
    return {
        "schema_version": "prd07-w3-post-execution-readiness-v1",
        "package": "R7-W3-TECHNICAL-ENVIRONMENT-EXECUTION-RERUN",
        "package_state": "W3-EXECUTION-COMPLETE",
        "lifecycle_role": "CURRENT-POST-EXECUTION-RECONCILIATION",
        "status": "PASS",
        "proof_execution": "OBSERVED",
        "execution_gate": "CLOSED-W3-EXECUTION-COMPLETE",
        "proof_implementation_commit": PROOF_IMPLEMENTATION_COMMIT,
        "proof_source_tree_identity": PROOF_SOURCE_TREE_IDENTITY,
        "executed_source_revision": executed_source_revision,
        "execution_evidence_commit": evidence_commit,
        "allocated_run_ids": [row[1] for row in EXPECTED_PROOF_ORDER],
        "allocated_evidence_ids": [row[2] for row in EXPECTED_PROOF_ORDER],
        "all_w3_journal_run_ids": list(EXPECTED_JOURNAL_RUNS),
        "all_w3_journal_evidence_ids": list(EXPECTED_JOURNAL_EVIDENCE),
        "invalidated_run_ids": ["PRD07-RUN-0058"],
        "invalidated_evidence_ids": ["PRD07-EVID-0058"],
        "quarantined_run_ids": list(EXPECTED_QUARANTINE_RUNS),
        "quarantined_evidence_ids": list(EXPECTED_QUARANTINE_EVIDENCE),
        "proofs": audit["proofs"],
        "result_counts": {
            "PASS-OBSERVED": 7,
            "FAIL-OBSERVED": 0,
            "INCONCLUSIVE": 0,
            "INVALIDATED-IN-THIS-RERUN": 0,
            "HISTORICAL-INVALIDATED": 1,
        },
        "registry": audit["registry"],
        "dependency_identity": audit["dependency_identity"],
        "environment_hashes": audit["environment_hashes"],
        "exports": audit["exports"],
        "pre_execution_readiness": _artifact_identity(PRE_EXECUTION_READINESS_PATH),
        "prior_readiness_disposition": {
            "path": PRE_EXECUTION_READINESS_PATH.relative_to(ROOT).as_posix(),
            "state": "SUPERSEDED-BY-W3-EXECUTION-COMPLETION",
            "reason": "The certified seven-READY timepoint remains immutable; the governed rerun subsequently retained seven terminal observations.",
        },
        "historical_abort": {
            "run_id": "PRD07-RUN-0058",
            "evidence_id": "PRD07-EVID-0058",
            "state": "INVALIDATED",
            "terminal_disposition": "ABORTED-BEFORE-PROOF-OBSERVATION",
            "proof_observation_produced": False,
            "evidence_pack_status": "NOT-CREATED-NO-PROOF-OBSERVATION",
            "prd07_evidence_eligible": False,
            "journal_blob_identity": ABORT_STATE_IDENTITY,
        },
        "w3_state": "COMPLETE",
        "w4_transition": "TECHNICAL-SEQUENCE-READY; OPENING-AND-EXECUTION-REQUIRE-SEPARATE-AUTHORITY",
        "r7_state": "ACTIVE-AWAITING-W4-GOVERNED-ACTION",
        "prd08_evaluation": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
        "production_dependencies": "PLANNED-UNINSTALLED",
        "active_poc_dependencies": 0,
        "audit_checks": audit["checks"],
        "issues": [],
    }


def _write_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n", encoding="utf-8")


def write_terminal_readiness(executed_source_revision: str, evidence_commit: str) -> Dict[str, Any]:
    value = build_terminal_readiness(executed_source_revision, evidence_commit)
    _write_json(TERMINAL_READINESS_PATH, value)
    return value


def build_terminal_boundary(
    executed_source_revision: str,
    evidence_commit: str,
    reconciliation_commit: str,
) -> Dict[str, Any]:
    if not _commit_exists(reconciliation_commit):
        raise RuntimeError("reconciliation commit must be an exact repository commit")
    if str(_git("rev-parse", "HEAD")) != reconciliation_commit:
        raise RuntimeError("reconciliation commit must equal current HEAD while the terminal boundary is generated")
    if not TERMINAL_READINESS_PATH.is_file():
        raise RuntimeError("terminal W3 readiness must be generated before the terminal boundary")
    readiness = _load(TERMINAL_READINESS_PATH)
    expected_readiness = build_terminal_readiness(executed_source_revision, evidence_commit)
    if readiness != expected_readiness:
        raise RuntimeError("terminal W3 readiness is stale or differs from independent regeneration")
    paths = _admitted_paths()
    artifacts = [_artifact_identity(ROOT / relative) for relative in paths]
    for relative in paths:
        if relative.startswith(("proofs/r7/w3/", "tools/r7_w3_runtime/")) or relative in {
            "tools/r7_w3_reconciliation.py",
            "tools/tests/test_r7_w3_reconciliation.py",
            "tools/tests/test_r7_w3_runtime.py",
            "tools/verify.py",
            "tools/verify_rebuild_boundary.py",
        }:
            if _blob_at(reconciliation_commit, relative) != _git_blob(ROOT / relative):
                raise RuntimeError("reconciliation source is not committed exactly: " + relative)
    state = _load(STATE_PATH)
    pre_boundary = _load(PRE_EXECUTION_BOUNDARY_PATH)
    history = [row for row in state.get("allocation_history", []) if isinstance(row, dict)]
    successful = history[1:]
    return {
        "schema_version": "prd07-w3-post-execution-boundary-v1",
        "manifest_version": 4,
        "package": "R7-W3-TECHNICAL-ENVIRONMENT-EXECUTION-RERUN",
        "lifecycle_role": "CURRENT-POST-EXECUTION-CERTIFICATION",
        "scope": "development-only-prd07-proof-runtime",
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
        "production_dependencies": "PLANNED-UNINSTALLED",
        "active_poc_dependencies": 0,
        "proof_execution": "OBSERVED",
        "execution_gate": "CLOSED-W3-EXECUTION-COMPLETE",
        "proof_implementation_commit": PROOF_IMPLEMENTATION_COMMIT,
        "proof_source_tree_identity": PROOF_SOURCE_TREE_IDENTITY,
        "executed_source_revision": executed_source_revision,
        "execution_evidence_commit": evidence_commit,
        "reconciliation_commit": reconciliation_commit,
        "allocated_run_ids": list(EXPECTED_JOURNAL_RUNS),
        "allocated_evidence_ids": list(EXPECTED_JOURNAL_EVIDENCE),
        "successful_rerun_run_ids": [row[1] for row in EXPECTED_PROOF_ORDER],
        "successful_rerun_evidence_ids": [row[2] for row in EXPECTED_PROOF_ORDER],
        "invalidated_run_ids": ["PRD07-RUN-0058"],
        "invalidated_evidence_ids": ["PRD07-EVID-0058"],
        "quarantined_run_ids": list(EXPECTED_QUARANTINE_RUNS),
        "quarantined_evidence_ids": list(EXPECTED_QUARANTINE_EVIDENCE),
        "proof_results": [
            {
                "allocation_order": row.get("allocation_order"),
                "proof_id": row.get("proof_id"),
                "run_id": row.get("run_id"),
                "evidence_id": row.get("evidence_id"),
                "state": row.get("state"),
                "evidence_pack_status": row.get("evidence_pack_status"),
                "prd07_evidence_eligible": row.get("prd07_evidence_eligible"),
                "prd08_submission": row.get("prd08_submission"),
            }
            for row in successful
        ],
        "result_counts": readiness["result_counts"],
        "registry": readiness["registry"],
        "dependency_identity": readiness["dependency_identity"],
        "environment_hashes": readiness["environment_hashes"],
        "exports": readiness["exports"],
        "authority": [
            "TASK-20260909-003",
            "WORK-20260909-003",
            "HANDOFF-20260909-002",
            "TASK-20260909-002",
            "WORK-20260909-002",
            "EVID-0012",
            "AUDIT-0012",
            "DOC-PRD-07",
        ],
        "pre_execution_boundary": {
            **_artifact_identity(PRE_EXECUTION_BOUNDARY_PATH),
            "lifecycle_role": pre_boundary.get("lifecycle_role"),
            "proof_execution": pre_boundary.get("proof_execution"),
            "allocated_run_ids": pre_boundary.get("allocated_run_ids", []),
            "allocated_evidence_ids": pre_boundary.get("allocated_evidence_ids", []),
            "implementation_commit": pre_boundary.get("implementation_commit"),
            "source_tree_identity": pre_boundary.get("source_tree_identity"),
        },
        "historical_abort_execution": {
            "path": STATE_PATH.relative_to(ROOT).as_posix(),
            **ABORT_STATE_IDENTITY,
            "lifecycle_role": "IMMUTABLE-PRIOR-ABORT-JOURNAL-SNAPSHOT",
            "source_revision": "f92445e2b432b568327cd16685b6c6fceaf355b4",
            "package_state": "ABORTED-BEFORE-PROOF-OBSERVATION",
            "allocated_run_ids": ["PRD07-RUN-0058"],
            "allocated_evidence_ids": ["PRD07-EVID-0058"],
            "proof_observation_count": 0,
        },
        "execution_journal": {
            **_artifact_identity(STATE_PATH),
            "lifecycle_role": "IMMUTABLE-COMPLETE-EXECUTION-JOURNAL",
            "original_source_revision": state.get("source_revision"),
            "latest_source_revision": state.get("latest_source_revision"),
            "package_state": state.get("package_state"),
            "allocated_run_ids": state.get("allocated_run_ids", []),
            "allocated_evidence_ids": state.get("allocated_evidence_ids", []),
            "proof_observation_count": len(successful),
        },
        "terminal_readiness": _artifact_identity(TERMINAL_READINESS_PATH),
        "prior_boundary_disposition": {
            "path": PRE_EXECUTION_BOUNDARY_PATH.relative_to(ROOT).as_posix(),
            "state": "SUPERSEDED-BY-W3-EXECUTION-COMPLETION",
            "reason": "The certified allocation-free boundary remains immutable for its pre-execution timepoint; this boundary reconciles the later append-only execution journal and retained observations.",
        },
        "next_identity_previews": [],
        "w3_state": "COMPLETE",
        "w4_transition": "TECHNICAL-SEQUENCE-READY; OPENING-AND-EXECUTION-REQUIRE-SEPARATE-AUTHORITY",
        "r7_state": "ACTIVE-AWAITING-W4-GOVERNED-ACTION",
        "prd08_evaluation": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "artifacts": artifacts,
    }


def write_terminal_boundary(
    executed_source_revision: str,
    evidence_commit: str,
    reconciliation_commit: str,
) -> Dict[str, Any]:
    value = build_terminal_boundary(executed_source_revision, evidence_commit, reconciliation_commit)
    _write_json(TERMINAL_BOUNDARY_PATH, value)
    return value


def terminal_reconciliation_issues(root: Path = ROOT) -> Tuple[str, ...]:
    issues = []
    if not TERMINAL_BOUNDARY_PATH.is_file() or not TERMINAL_READINESS_PATH.is_file():
        return ("terminal W3 readiness or boundary is missing",)
    boundary = _load(root / TERMINAL_BOUNDARY_PATH.relative_to(ROOT))
    readiness = _load(root / TERMINAL_READINESS_PATH.relative_to(ROOT))
    executed = str(boundary.get("executed_source_revision", ""))
    evidence_commit = str(boundary.get("execution_evidence_commit", ""))
    audit = audit_execution(executed, evidence_commit, root=root)
    issues.extend(audit["issues"])
    if boundary.get("schema_version") != "prd07-w3-post-execution-boundary-v1" or boundary.get("manifest_version") != 4:
        issues.append("terminal W3 boundary schema is missing or unsupported")
    if boundary.get("package") != "R7-W3-TECHNICAL-ENVIRONMENT-EXECUTION-RERUN" or boundary.get("lifecycle_role") != "CURRENT-POST-EXECUTION-CERTIFICATION":
        issues.append("terminal W3 boundary package/lifecycle identity differs")
    if boundary.get("proof_execution") != "OBSERVED" or boundary.get("execution_gate") != "CLOSED-W3-EXECUTION-COMPLETE":
        issues.append("terminal W3 boundary execution state/gate differs")
    if boundary.get("allocated_run_ids") != list(EXPECTED_JOURNAL_RUNS) or boundary.get("allocated_evidence_ids") != list(EXPECTED_JOURNAL_EVIDENCE):
        issues.append("terminal W3 boundary issued identities differ from the journal")
    if boundary.get("successful_rerun_run_ids") != [row[1] for row in EXPECTED_PROOF_ORDER] or boundary.get("successful_rerun_evidence_ids") != [row[2] for row in EXPECTED_PROOF_ORDER]:
        issues.append("terminal W3 boundary successful rerun identities differ")
    if boundary.get("next_identity_previews") != []:
        issues.append("terminal W3 boundary retains an execution preview")
    if readiness.get("schema_version") != "prd07-w3-post-execution-readiness-v1" or readiness.get("status") != "PASS":
        issues.append("terminal W3 readiness is missing or does not pass")
    if readiness.get("proof_execution") != "OBSERVED" or readiness.get("w3_state") != "COMPLETE":
        issues.append("terminal W3 readiness does not certify completed observations")
    if readiness.get("allocated_run_ids") != [row[1] for row in EXPECTED_PROOF_ORDER] or readiness.get("allocated_evidence_ids") != [row[2] for row in EXPECTED_PROOF_ORDER]:
        issues.append("terminal W3 readiness rerun allocations differ")
    if readiness.get("proofs") != audit.get("proofs"):
        issues.append("terminal W3 readiness proof summaries differ from retained packs")
    for value, label in ((boundary, "boundary"), (readiness, "readiness")):
        if value.get("prd08_evaluation") != "CLOSED" or value.get("gameplay_permission") != "CLOSED":
            issues.append(f"terminal W3 {label} opened PRD-08 or gameplay")
        if value.get("production_runtime") != "ABSENT" or value.get("active_poc_dependencies") != 0:
            issues.append(f"terminal W3 {label} crossed the production/POC boundary")
    reconciliation_commit = str(boundary.get("reconciliation_commit", ""))
    if not _commit_exists(reconciliation_commit):
        issues.append("terminal W3 boundary reconciliation commit is invalid")
    artifacts = boundary.get("artifacts", [])
    admitted = set()
    if not isinstance(artifacts, list):
        issues.append("terminal W3 boundary artifacts are invalid")
        artifacts = []
    for artifact in artifacts:
        if not isinstance(artifact, dict):
            issues.append("terminal W3 boundary contains a non-object artifact")
            continue
        relative = str(artifact.get("path", ""))
        path = root / relative
        if relative in admitted:
            issues.append("terminal W3 boundary contains a duplicate artifact: " + relative)
        admitted.add(relative)
        if ".." in Path(relative).parts or Path(relative).is_absolute():
            issues.append("terminal W3 boundary contains an unsafe path: " + relative)
            continue
        if not path.is_file():
            issues.append("terminal W3 admitted path is missing: " + relative)
            continue
        identity = _artifact_identity(path)
        if any(identity.get(key) != artifact.get(key) for key in ("git_blob", "sha256", "bytes")):
            issues.append("terminal W3 admitted identity differs: " + relative)
    expected_admitted = set(_admitted_paths(root))
    if admitted != expected_admitted:
        issues.append("terminal W3 admission path set is incomplete or over-broad")
    for field, path in (
        ("pre_execution_boundary", PRE_EXECUTION_BOUNDARY_PATH),
        ("execution_journal", STATE_PATH),
        ("terminal_readiness", TERMINAL_READINESS_PATH),
    ):
        record = boundary.get(field, {})
        if not isinstance(record, dict) or any(record.get(key) != _artifact_identity(root / path.relative_to(ROOT)).get(key) for key in ("path", "git_blob", "sha256", "bytes")):
            issues.append("terminal W3 boundary identity differs for " + field)
    historical_abort = boundary.get("historical_abort_execution", {})
    if not isinstance(historical_abort, dict) or any(historical_abort.get(key) != value for key, value in ABORT_STATE_IDENTITY.items()):
        issues.append("terminal W3 boundary changed the immutable 0058 abort snapshot")
    return tuple(sorted(set(issues)))


def build_completion_receipt(
    certification_commit: str,
    brain_ci: Mapping[str, Any],
    governance_ci: Mapping[str, Any],
    local_verification: Mapping[str, Any],
) -> Dict[str, Any]:
    boundary = _load(TERMINAL_BOUNDARY_PATH)
    readiness = _load(TERMINAL_READINESS_PATH)
    issues = terminal_reconciliation_issues()
    if issues:
        raise RuntimeError("terminal W3 reconciliation is not valid: " + "; ".join(issues))
    if not _commit_exists(certification_commit):
        raise RuntimeError("certification commit must be an exact repository commit")
    return {
        "schema_version": "r7-w3-execution-completion-v1",
        "package": "R7-W3-TECHNICAL-ENVIRONMENT-EXECUTION-RERUN",
        "status": "COMPLETE-CERTIFIED",
        "task": "TASK-20260909-003",
        "work": "WORK-20260909-003",
        "starting_commit": "7fe5881374d9704ff23f1a4408cb4c0afbc48f9c",
        "proof_implementation_commit": PROOF_IMPLEMENTATION_COMMIT,
        "executed_source_revision": boundary["executed_source_revision"],
        "execution_evidence_commit": boundary["execution_evidence_commit"],
        "reconciliation_commit": boundary["reconciliation_commit"],
        "certification_commit": certification_commit,
        "execution": {
            "result_counts": readiness["result_counts"],
            "proofs": readiness["proofs"],
            "allocated_run_ids": readiness["allocated_run_ids"],
            "allocated_evidence_ids": readiness["allocated_evidence_ids"],
            "historical_invalidated_run_ids": readiness["invalidated_run_ids"],
            "historical_invalidated_evidence_ids": readiness["invalidated_evidence_ids"],
        },
        "registry": readiness["registry"],
        "dependencies": readiness["dependency_identity"],
        "environment_hashes": readiness["environment_hashes"],
        "exports": readiness["exports"],
        "verification": dict(local_verification),
        "ci": {"brain_integrity": dict(brain_ci), "engineering_governance_integrity": dict(governance_ci)},
        "w3_state": "COMPLETE",
        "w4_transition": "TECHNICAL-SEQUENCE-READY; OPENING-AND-EXECUTION-REQUIRE-SEPARATE-AUTHORITY",
        "r7_state": "ACTIVE-AWAITING-W4-GOVERNED-ACTION",
        "prd08_evaluation": "CLOSED",
        "prd08_submission": "NOT-SUBMITTED",
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
        "next_handoff": "PENDING-FORMAL-CLOSEOUT-HANDOFF",
    }


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest="command", required=True)
    write = sub.add_parser("write", help="write terminal readiness and boundary")
    write.add_argument("--executed-source-revision", required=True)
    write.add_argument("--evidence-commit", required=True)
    write.add_argument("--reconciliation-commit", required=True)
    verify = sub.add_parser("verify", help="verify terminal reconciliation")
    verify.add_argument("--format", choices=("json", "text"), default="text")
    receipt = sub.add_parser("write-receipt", help="write the lifecycle completion receipt")
    receipt.add_argument("--certification-commit", required=True)
    receipt.add_argument("--brain-ci-json", required=True)
    receipt.add_argument("--governance-ci-json", required=True)
    receipt.add_argument("--local-verification-json", required=True)
    return parser


def main(argv: Optional[Sequence[str]] = None) -> int:
    args = _parser().parse_args(argv)
    if args.command == "write":
        readiness = write_terminal_readiness(args.executed_source_revision, args.evidence_commit)
        boundary = write_terminal_boundary(args.executed_source_revision, args.evidence_commit, args.reconciliation_commit)
        print(json.dumps({
            "status": "PASS",
            "readiness": TERMINAL_READINESS_PATH.relative_to(ROOT).as_posix(),
            "boundary": TERMINAL_BOUNDARY_PATH.relative_to(ROOT).as_posix(),
            "proofs": len(readiness["proofs"]),
            "artifacts": len(boundary["artifacts"]),
        }, indent=2))
        return 0
    if args.command == "verify":
        issues = terminal_reconciliation_issues()
        value = {"status": "PASS" if not issues else "FAIL", "issues": list(issues)}
        print(json.dumps(value, indent=2) if args.format == "json" else ("PASS" if not issues else "FAIL: " + "; ".join(issues)))
        return 0 if not issues else 1
    brain_ci = json.loads(args.brain_ci_json)
    governance_ci = json.loads(args.governance_ci_json)
    local_verification = json.loads(args.local_verification_json)
    receipt = build_completion_receipt(args.certification_commit, brain_ci, governance_ci, local_verification)
    _write_json(COMPLETION_RECEIPT_PATH, receipt)
    print(json.dumps({"status": "PASS", "receipt": COMPLETION_RECEIPT_PATH.relative_to(ROOT).as_posix()}, indent=2))
    return 0


if __name__ == "__main__":
    sys.exit(main())
