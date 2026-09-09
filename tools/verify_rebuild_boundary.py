"""Read-only clean-rebuild boundary validation; Python standard library only."""
import hashlib
import json
import os
import re
import subprocess
import sys
from pathlib import Path

root = Path(__file__).resolve().parents[1]
manifest = json.loads((root / 'docs/rebuild/r3/baseline-manifest.json').read_text(encoding='utf-8'))
failures = []
checks = 0
def check(condition, message):
    global checks
    checks += 1
    if not condition:
        failures.append(message)

w0_manifest_path = root / 'docs/rebuild/r7/w0-harness-boundary.json'
w0_manifest = json.loads(w0_manifest_path.read_text(encoding='utf-8')) if w0_manifest_path.is_file() else {}
check(w0_manifest.get('manifest_version') == 1, 'W0 harness boundary manifest is missing or unsupported')
check(w0_manifest.get('package') == 'R7-W0-HARNESS', 'W0 harness package identity changed')
check(w0_manifest.get('scope') == 'development-only', 'W0 harness scope must remain development-only')
check(w0_manifest.get('gameplay_permission') == 'CLOSED', 'W0 harness cannot open gameplay permission')
check(w0_manifest.get('proof_execution') == 'NOT-STARTED', 'W0 bootstrap cannot claim proof execution')
check(w0_manifest.get('allocated_run_ids') == [], 'W0 bootstrap allocated PRD07-RUN identities')
check(w0_manifest.get('allocated_evidence_ids') == [], 'W0 bootstrap allocated PRD07-EVID identities')
w0_admitted_paths = set()
w0_admitted_artifacts = []
for artifact in w0_manifest.get('artifacts', []):
    rel = artifact.get('path')
    valid_path = (
        isinstance(rel, str)
        and rel.startswith(('tools/proof_harness/', 'tools/tests/'))
        and '..' not in Path(rel).parts
        and not Path(rel).is_absolute()
    )
    check(valid_path, 'Invalid W0 harness admission path: ' + str(rel))
    if not valid_path:
        continue
    check(rel not in w0_admitted_paths, 'Duplicate W0 harness admission path: ' + rel)
    w0_admitted_paths.add(rel)
    candidate = root / rel
    check(candidate.is_file(), 'Admitted W0 harness path is missing: ' + rel)
    check(candidate.suffix.lower() in {'.py', '.json', '.md'}, 'Unsupported W0 harness file type: ' + rel)
    check(candidate.suffix.lower() not in {'.gd', '.gdshader', '.tscn', '.tres', '.res', '.exe', '.dll', '.pck'}, 'Runtime artifact admitted through W0 harness: ' + rel)
    if candidate.is_file():
        w0_admitted_artifacts.append((rel, candidate, artifact))

w0_hash_result = subprocess.run(
    ['git', 'hash-object', '--stdin-paths'],
    cwd=root,
    input=chr(10).join(rel for rel, _, _ in w0_admitted_artifacts) + chr(10),
    text=True,
    capture_output=True,
)
check(w0_hash_result.returncode == 0, 'W0 harness Git-clean blob hashing failed')
w0_blob_hashes = w0_hash_result.stdout.splitlines() if w0_hash_result.returncode == 0 else []
check(len(w0_blob_hashes) == len(w0_admitted_artifacts), 'W0 harness Git-clean blob count differs')
for index, (rel, candidate, artifact) in enumerate(w0_admitted_artifacts):
    expected_blob = artifact.get('git_blob')
    actual_blob = w0_blob_hashes[index] if index < len(w0_blob_hashes) else ''
    check(
        isinstance(expected_blob, str) and re.fullmatch(r'[0-9a-f]{40}', expected_blob) is not None,
        'Admitted W0 harness Git blob is missing or invalid: ' + rel,
    )
    check(actual_blob == expected_blob, 'Admitted W0 harness Git-clean blob changed: ' + rel)
    raw_data = candidate.read_bytes()
    canonical_data = raw_data.replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    check(len(canonical_data) == artifact.get('bytes'), 'Admitted W0 harness canonical size changed: ' + rel)
    check(hashlib.sha256(canonical_data).hexdigest() == artifact.get('sha256'), 'Admitted W0 harness canonical SHA-256 changed: ' + rel)

r7_manifest_path = root / 'docs/rebuild/r7/w0-dependency-export-boundary.json'
r7_manifest = json.loads(r7_manifest_path.read_text(encoding='utf-8')) if r7_manifest_path.is_file() else {}
check(r7_manifest.get('manifest_version') == 1, 'R7 W0 dependency/export boundary manifest is missing or unsupported')
check(r7_manifest.get('package') == 'R7-W0-DEPENDENCY-EXPORT-READINESS', 'R7 W0 dependency/export package identity changed')
check(r7_manifest.get('scope') == 'development-only-prd07-proof-runtime', 'R7 W0 runtime scope must remain proof-only')
check(r7_manifest.get('gameplay_permission') == 'CLOSED', 'R7 W0 runtime cannot open gameplay permission')
check(re.fullmatch(r'[0-9a-f]{40}', str(r7_manifest.get('implementation_commit', ''))) is not None, 'R7 W0 implementation commit is not exact')
check(r7_manifest.get('proof_execution') in {'NOT-STARTED', 'OBSERVED'}, 'R7 W0 proof execution state is invalid')
r7_admitted_paths = set()
r7_admitted_artifacts = []
r7_prefixes = (
    'proofs/r7/w0/', 'tools/r7_w0_runtime/', 'tools/tests/fixtures/r7_architecture/',
    'docs/rebuild/r7/execution-evidence/',
)
r7_exact_paths = {
    'tools/tests/test_r7_w0_runtime.py',
    'docs/rebuild/r7/w0-execution-state.json',
    'docs/rebuild/r7/w0-dependency-export-completion-receipt.json',
}
for artifact in r7_manifest.get('artifacts', []):
    rel = artifact.get('path')
    valid_path = (
        isinstance(rel, str)
        and (rel.startswith(r7_prefixes) or rel in r7_exact_paths)
        and '..' not in Path(rel).parts
        and not Path(rel).is_absolute()
    )
    check(valid_path, 'Invalid R7 W0 admission path: ' + str(rel))
    if not valid_path:
        continue
    check(rel not in r7_admitted_paths, 'Duplicate R7 W0 admission path: ' + rel)
    r7_admitted_paths.add(rel)
    candidate = root / rel
    check(candidate.is_file(), 'Admitted R7 W0 path is missing: ' + rel)
    check(candidate.suffix.lower() in {'.py', '.json', '.md', '.gd', '.tscn', '.godot'}, 'Unsupported R7 W0 file type: ' + rel)
    check(candidate.suffix.lower() not in {'.exe', '.dll', '.pck', '.res', '.tres'}, 'Binary or production resource admitted through R7 W0: ' + rel)
    if candidate.is_file():
        r7_admitted_artifacts.append((rel, candidate, artifact))
r7_hash_result = subprocess.run(
    ['git', 'hash-object', '--stdin-paths'], cwd=root,
    input=chr(10).join(rel for rel, _, _ in r7_admitted_artifacts) + chr(10),
    text=True, capture_output=True,
)
check(r7_hash_result.returncode == 0, 'R7 W0 Git-clean blob hashing failed')
r7_blob_hashes = r7_hash_result.stdout.splitlines() if r7_hash_result.returncode == 0 else []
check(len(r7_blob_hashes) == len(r7_admitted_artifacts), 'R7 W0 Git-clean blob count differs')
for index, (rel, candidate, artifact) in enumerate(r7_admitted_artifacts):
    expected_blob = artifact.get('git_blob')
    actual_blob = r7_blob_hashes[index] if index < len(r7_blob_hashes) else ''
    check(isinstance(expected_blob, str) and re.fullmatch(r'[0-9a-f]{40}', expected_blob) is not None, 'Admitted R7 W0 Git blob is missing or invalid: ' + rel)
    check(actual_blob == expected_blob, 'Admitted R7 W0 Git-clean blob changed: ' + rel)
    raw_data = candidate.read_bytes()
    canonical_data = raw_data.replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    check(len(canonical_data) == artifact.get('bytes'), 'Admitted R7 W0 canonical size changed: ' + rel)
    check(hashlib.sha256(canonical_data).hexdigest() == artifact.get('sha256'), 'Admitted R7 W0 canonical SHA-256 changed: ' + rel)
check(not any(path.endswith(('.exe', '.dll', '.pck')) for path in r7_admitted_paths), 'R7 W0 boundary admitted dependency/runtime binaries')

w1_manifest_path = root / 'docs/rebuild/r7/w1-execution-boundary.json'
w1_manifest = json.loads(w1_manifest_path.read_text(encoding='utf-8')) if w1_manifest_path.is_file() else {}
check(w1_manifest.get('manifest_version') == 1, 'R7 W1 boundary manifest is missing or unsupported')
check(w1_manifest.get('package') == 'R7-W1-OWNER-SPATIAL-PROOFS', 'R7 W1 package identity changed')
check(w1_manifest.get('scope') == 'development-only-prd07-proof-runtime', 'R7 W1 scope must remain proof-only')
check(w1_manifest.get('gameplay_permission') == 'CLOSED', 'R7 W1 cannot open gameplay permission')
check(re.fullmatch(r'[0-9a-f]{40}', str(w1_manifest.get('implementation_commit', ''))) is not None, 'R7 W1 implementation commit is not exact')
check(w1_manifest.get('proof_execution') in {'NOT-STARTED', 'OBSERVED'}, 'R7 W1 proof execution state is invalid')
w1_admitted_paths = set()
w1_admitted_artifacts = []
w1_prefixes = (
    'proofs/r7/w1/',
    'tools/r7_w1_runtime/',
)
w1_exact_paths = {
    'tools/tests/test_r7_w1_runtime.py',
    'docs/rebuild/r7/w1-readiness.json',
    'docs/rebuild/r7/w1-execution-state.json',
    'docs/rebuild/r7/w1-execution-completion-receipt.json',
}
expected_w1_runs = {f'docs/rebuild/r7/execution-evidence/PRD07-RUN-{index:04d}/' for index in range(14, 31)}
for artifact in w1_manifest.get('artifacts', []):
    rel = artifact.get('path')
    valid_path = (
        isinstance(rel, str)
        and (
            rel.startswith(w1_prefixes)
            or rel in w1_exact_paths
            or any(rel.startswith(prefix) for prefix in expected_w1_runs)
        )
        and '..' not in Path(rel).parts
        and not Path(rel).is_absolute()
    )
    check(valid_path, 'Invalid R7 W1 admission path: ' + str(rel))
    if not valid_path:
        continue
    check(rel not in w1_admitted_paths, 'Duplicate R7 W1 admission path: ' + rel)
    w1_admitted_paths.add(rel)
    candidate = root / rel
    check(candidate.is_file(), 'Admitted R7 W1 path is missing: ' + rel)
    check(candidate.suffix.lower() in {'.py', '.json', '.md', '.gd', '.tscn', '.godot'}, 'Unsupported R7 W1 file type: ' + rel)
    check(candidate.suffix.lower() not in {'.exe', '.dll', '.pck', '.res', '.tres'}, 'Binary or production resource admitted through R7 W1: ' + rel)
    if candidate.is_file():
        w1_admitted_artifacts.append((rel, candidate, artifact))
w1_hash_result = subprocess.run(
    ['git', 'hash-object', '--stdin-paths'], cwd=root,
    input=chr(10).join(rel for rel, _, _ in w1_admitted_artifacts) + chr(10),
    text=True, capture_output=True,
)
check(w1_hash_result.returncode == 0, 'R7 W1 Git-clean blob hashing failed')
w1_blob_hashes = w1_hash_result.stdout.splitlines() if w1_hash_result.returncode == 0 else []
check(len(w1_blob_hashes) == len(w1_admitted_artifacts), 'R7 W1 Git-clean blob count differs')
for index, (rel, candidate, artifact) in enumerate(w1_admitted_artifacts):
    expected_blob = artifact.get('git_blob')
    actual_blob = w1_blob_hashes[index] if index < len(w1_blob_hashes) else ''
    check(isinstance(expected_blob, str) and re.fullmatch(r'[0-9a-f]{40}', expected_blob) is not None, 'Admitted R7 W1 Git blob is missing or invalid: ' + rel)
    check(actual_blob == expected_blob, 'Admitted R7 W1 Git-clean blob changed: ' + rel)
    raw_data = candidate.read_bytes()
    canonical_data = raw_data.replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    check(len(canonical_data) == artifact.get('bytes'), 'Admitted R7 W1 canonical size changed: ' + rel)
    check(hashlib.sha256(canonical_data).hexdigest() == artifact.get('sha256'), 'Admitted R7 W1 canonical SHA-256 changed: ' + rel)
check(not any(path.endswith(('.exe', '.dll', '.pck')) for path in w1_admitted_paths), 'R7 W1 boundary admitted dependency/runtime binaries')
w1_run_ids = w1_manifest.get('allocated_run_ids', [])
w1_evidence_ids = w1_manifest.get('allocated_evidence_ids', [])
check(len(w1_run_ids) == len(set(w1_run_ids)), 'R7 W1 contains duplicate run identities')
check(len(w1_evidence_ids) == len(set(w1_evidence_ids)), 'R7 W1 contains duplicate evidence identities')
check(len(w1_run_ids) == len(w1_evidence_ids), 'R7 W1 run/evidence identity counts differ')
check(
    w1_run_ids in ([], [f'PRD07-RUN-{index:04d}' for index in range(14, 31)]),
    'R7 W1 run identities are not empty or the complete append-only W1 range',
)
check(
    w1_evidence_ids in ([], [f'PRD07-EVID-{index:04d}' for index in range(14, 31)]),
    'R7 W1 evidence identities are not empty or the complete append-only W1 range',
)

w2_manifest_path = root / 'docs/rebuild/r7/w2-execution-boundary.json'
w2_manifest = json.loads(w2_manifest_path.read_text(encoding='utf-8')) if w2_manifest_path.is_file() else {}
check(w2_manifest.get('manifest_version') == 1, 'R7 W2 boundary manifest is missing or unsupported')
check(w2_manifest.get('package') == 'R7-W2-NETWORK-PERSISTENCE-RECOVERY-MIGRATION-READINESS', 'R7 W2 package identity changed')
check(w2_manifest.get('scope') == 'development-only-prd07-proof-runtime', 'R7 W2 scope must remain proof-only')
check(w2_manifest.get('gameplay_permission') == 'CLOSED', 'R7 W2 cannot open gameplay permission')
check(re.fullmatch(r'[0-9a-f]{40}', str(w2_manifest.get('implementation_commit', ''))) is not None, 'R7 W2 implementation commit is not exact')
check(w2_manifest.get('proof_execution') in {'NOT-STARTED', 'OBSERVED'}, 'R7 W2 proof execution state is invalid')
w2_admitted_paths = set()
w2_admitted_artifacts = []
w2_prefixes = (
    'proofs/r7/w2/',
    'tools/r7_w2_runtime/',
)
w2_exact_paths = {
    'tools/tests/test_r7_w2_runtime.py',
    'docs/rebuild/r7/w2-readiness.json',
    'docs/rebuild/r7/w2-execution-state.json',
    'docs/rebuild/r7/w2-execution-completion-receipt.json',
}
expected_w2_runs = {f'docs/rebuild/r7/execution-evidence/PRD07-RUN-{index:04d}/' for index in range(31, 51)}
for artifact in w2_manifest.get('artifacts', []):
    rel = artifact.get('path')
    valid_path = (
        isinstance(rel, str)
        and (
            rel.startswith(w2_prefixes)
            or rel in w2_exact_paths
            or any(rel.startswith(prefix) for prefix in expected_w2_runs)
        )
        and '..' not in Path(rel).parts
        and not Path(rel).is_absolute()
    )
    check(valid_path, 'Invalid R7 W2 admission path: ' + str(rel))
    if not valid_path:
        continue
    check(rel not in w2_admitted_paths, 'Duplicate R7 W2 admission path: ' + rel)
    w2_admitted_paths.add(rel)
    candidate = root / rel
    check(candidate.is_file(), 'Admitted R7 W2 path is missing: ' + rel)
    check(candidate.suffix.lower() in {'.py', '.json', '.md', '.gd', '.tscn', '.godot'}, 'Unsupported R7 W2 file type: ' + rel)
    check(candidate.suffix.lower() not in {'.exe', '.dll', '.pck', '.res', '.tres'}, 'Binary or production resource admitted through R7 W2: ' + rel)
    if candidate.is_file():
        w2_admitted_artifacts.append((rel, candidate, artifact))
w2_hash_result = subprocess.run(
    ['git', 'hash-object', '--stdin-paths'], cwd=root,
    input=chr(10).join(rel for rel, _, _ in w2_admitted_artifacts) + chr(10),
    text=True, capture_output=True,
)
check(w2_hash_result.returncode == 0, 'R7 W2 Git-clean blob hashing failed')
w2_blob_hashes = w2_hash_result.stdout.splitlines() if w2_hash_result.returncode == 0 else []
check(len(w2_blob_hashes) == len(w2_admitted_artifacts), 'R7 W2 Git-clean blob count differs')
for index, (rel, candidate, artifact) in enumerate(w2_admitted_artifacts):
    expected_blob = artifact.get('git_blob')
    actual_blob = w2_blob_hashes[index] if index < len(w2_blob_hashes) else ''
    check(isinstance(expected_blob, str) and re.fullmatch(r'[0-9a-f]{40}', expected_blob) is not None, 'Admitted R7 W2 Git blob is missing or invalid: ' + rel)
    check(actual_blob == expected_blob, 'Admitted R7 W2 Git-clean blob changed: ' + rel)
    raw_data = candidate.read_bytes()
    canonical_data = raw_data.replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    check(len(canonical_data) == artifact.get('bytes'), 'Admitted R7 W2 canonical size changed: ' + rel)
    check(hashlib.sha256(canonical_data).hexdigest() == artifact.get('sha256'), 'Admitted R7 W2 canonical SHA-256 changed: ' + rel)
check(not any(path.endswith(('.exe', '.dll', '.pck')) for path in w2_admitted_paths), 'R7 W2 boundary admitted dependency/runtime binaries')
w2_run_ids = w2_manifest.get('allocated_run_ids', [])
w2_evidence_ids = w2_manifest.get('allocated_evidence_ids', [])
check(len(w2_run_ids) == len(set(w2_run_ids)), 'R7 W2 contains duplicate run identities')
check(len(w2_evidence_ids) == len(set(w2_evidence_ids)), 'R7 W2 contains duplicate evidence identities')
check(len(w2_run_ids) == len(w2_evidence_ids), 'R7 W2 run/evidence identity counts differ')
check(
    w2_run_ids in ([], [f'PRD07-RUN-{index:04d}' for index in range(31, 51)]),
    'R7 W2 run identities are not empty or the complete append-only W2 range',
)
check(
    w2_evidence_ids in ([], [f'PRD07-EVID-{index:04d}' for index in range(31, 51)]),
    'R7 W2 evidence identities are not empty or the complete append-only W2 range',
)

# The block below validates the immutable post-attempt/pre-execution timepoint.
# It remains in source as the historical contract, but its failures are not the
# current conclusion after an observed execution.  A dedicated terminal
# reconciliation supersedes it immediately below and re-establishes the exact
# admission set used by the rest of this clean-rebuild walk.
w3_historical_check_start = checks
w3_historical_failure_start = len(failures)
w3_manifest_path = root / 'docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json'
w3_manifest = json.loads(w3_manifest_path.read_text(encoding='utf-8')) if w3_manifest_path.is_file() else {}
check(w3_manifest.get('manifest_version') == 3, 'Current R7 W3 boundary manifest is missing or unsupported')
check(w3_manifest.get('package') == 'R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION', 'Current R7 W3 package identity changed')
check(w3_manifest.get('lifecycle_role') == 'CURRENT-POST-ATTEMPT-RECERTIFICATION', 'Current R7 W3 boundary lifecycle role changed')
check(w3_manifest.get('scope') == 'development-only-prd07-proof-runtime', 'R7 W3 scope must remain proof-only')
check(w3_manifest.get('gameplay_permission') == 'CLOSED', 'R7 W3 cannot open gameplay permission')
check(re.fullmatch(r'[0-9a-f]{40}', str(w3_manifest.get('implementation_commit', ''))) is not None, 'R7 W3 implementation commit is not exact')
check(re.fullmatch(r'[0-9a-f]{64}', str(w3_manifest.get('source_tree_identity', ''))) is not None, 'R7 W3 source-tree identity is not exact')
check(w3_manifest.get('proof_execution') == 'NOT-STARTED-FOR-NEXT-RERUN', 'R7 W3 next-rerun execution state is not closed at NOT-STARTED')
check(w3_manifest.get('execution_gate') == 'OPEN-FOR-FUTURE-SEPARATELY-AUTHORIZED-W3-RERUN', 'R7 W3 execution gate changed')
w3_authority = set(w3_manifest.get('authority', []))
check({'TASK-20260909-002', 'WORK-20260909-002', 'HANDOFF-20260909-001', 'EVID-0011', 'AUDIT-0011', 'DOC-PRD-07'}.issubset(w3_authority), 'Current R7 W3 authority set is incomplete')
w3_readiness_path = root / 'docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json'
w3_readiness = json.loads(w3_readiness_path.read_text(encoding='utf-8')) if w3_readiness_path.is_file() else {}
expected_w3_proofs = [
    'PRD04-PROOF-08', 'PRD04-PROOF-27', 'PRD04-PROOF-28', 'PRD04-PROOF-29',
    'PRD04-PROOF-30', 'PRD04-PROOF-31', 'PRD04-PROOF-32',
]
check(w3_readiness.get('schema_version') == 'prd07-w3-readiness-v4', 'Current R7 W3 readiness is missing or unsupported')
check(w3_readiness.get('package') == 'R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION', 'Current R7 W3 readiness package identity changed')
check(w3_readiness.get('status') == 'PASS', 'Current R7 W3 readiness does not pass')
check(w3_readiness.get('implementation_commit_source_match') is True, 'Current R7 W3 readiness does not match its implementation commit')
check(w3_readiness.get('gameplay_permission') == 'CLOSED', 'Current R7 W3 readiness opened gameplay permission')
check(w3_readiness.get('actual_w3_execution') == 'NOT-AUTHORIZED-BY-THIS-REPAIR-TASK', 'Current R7 W3 readiness claims actual execution authority')
check(w3_readiness.get('allocated_run_ids') == [], 'R7 W3 readiness consumed run identities')
check(w3_readiness.get('allocated_evidence_ids') == [], 'R7 W3 readiness consumed evidence identities')
check([row.get('proof_id') for row in w3_readiness.get('proofs', [])] == expected_w3_proofs, 'Repaired R7 W3 readiness proof set or order changed')
check(all(row.get('state') == 'READY' for row in w3_readiness.get('proofs', [])), 'Current R7 W3 readiness contains a blocked or observed proof')
check(w3_readiness.get('proof_execution') == 'NOT-STARTED-FOR-NEXT-RERUN', 'Current R7 W3 readiness claims next-rerun proof execution')
check(w3_readiness.get('prior_readiness_disposition', {}).get('state') == 'SUPERSEDED-BY-FIXTURE-LAUNCH-REPAIR', 'Pre-attempt R7 W3 readiness role was not preserved and superseded precisely')
check(w3_manifest.get('source_tree_identity') == w3_readiness.get('source_tree_identity'), 'R7 W3 boundary and readiness source-tree identities differ')
check(w3_manifest.get('implementation_commit') == w3_readiness.get('implementation_commit'), 'R7 W3 boundary and readiness implementation commits differ')
check(w3_manifest.get('prior_boundary_disposition', {}).get('state') == 'SUPERSEDED-BY-POST-ATTEMPT-RECERTIFICATION', 'Pre-attempt R7 W3 boundary role was not preserved and superseded precisely')
w3_reference_path = root / 'proofs/r7/w3/dependency-reference.json'
w3_reference = json.loads(w3_reference_path.read_text(encoding='utf-8')) if w3_reference_path.is_file() else {}
check(w3_manifest.get('dependency_identity') == w3_reference.get('component_revisions'), 'R7 W3 admitted dependency identity differs from its governed reference')

w3_superseded_artifacts = {
    'docs/rebuild/r7/w3-readiness-corrected.json': (
        '1d0ff29bb87bc98583ce57b2d612bb0a0a351b93',
        '9747c51ab5733a4aec5b5ed06f08bc29bc8b4e4ad7c51140209f0496c0a15b9b',
    ),
    'docs/rebuild/r7/w3-execution-boundary-corrected.json': (
        'c20ce6472c62a15f50cde470f9209a3f6131b25b',
        '1cf0af9d514c1b6f342e524dc162172eab36444ce78fccbbaadcfd61cb378407',
    ),
    'docs/rebuild/r7/w3-readiness-repaired.json': (
        '46410e3808d7e840e773a594f5471e04f313d1d1',
        '795c260812bcbd9362d089594b601551714b88d52816a78a32794349bd68b258',
    ),
    'docs/rebuild/r7/w3-execution-boundary-repaired.json': (
        '9ecc03d0f8a6cff278de537a81f4b3bc60018bac',
        '90af508c949a9039d6a147331417140c18c88a2ca475c5438c0a0c03cc14c799',
    ),
    'docs/rebuild/r7/w3-pinned-engine-validation.json': (
        'cd407485ee3ff40d27207dbccc004d90716ea015',
        '73988e7fe0d12f6dde6ac0a12e147915007d0378e88be8ffcec952eb13e39650',
    ),
}
for rel, (expected_blob, expected_sha256) in w3_superseded_artifacts.items():
    candidate = root / rel
    check(candidate.is_file(), 'Superseded certified W3 artifact is missing: ' + rel)
    if candidate.is_file():
        hash_result = subprocess.run(['git', 'hash-object', '--', rel], cwd=root, text=True, capture_output=True)
        check(hash_result.returncode == 0 and hash_result.stdout.strip() == expected_blob, 'Superseded certified W3 Git blob changed: ' + rel)
        canonical_data = candidate.read_bytes().replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
        check(hashlib.sha256(canonical_data).hexdigest() == expected_sha256, 'Superseded certified W3 canonical SHA-256 changed: ' + rel)

w3_abort_artifacts = {
    'docs/rebuild/r7/w3-execution-state.json': (
        'b2c53bdb5d7a8563e7dc1b925f4b2ad7827c7fac',
        '09d8ea9d47d3fedc074d9426b8a6602e5c471b58c898e0c3dcace8ace881d4a1',
    ),
    'brain/10_TESTING/Evidence/r7-w3-execution-rerun-abort-20260909.json': (
        'b25f34bac8e853a0c29c52d70169db3c26d81dfd',
        'd7aa315ff7da6aafec0cebade181420c1e6d45a6db6135cfcab8a5fb59a69517',
    ),
    'brain/10_TESTING/Evidence/r7-w3-execution-rerun-abort-20260909-error.txt': (
        '6f6cb4838f9e74843fef0001250deaf945cd007d',
        '8a04efaa1b78a8d09cdbc7567ad6b132501855d4baa2a5b6e791955536714675',
    ),
    'brain/10_TESTING/Evidence/EVID-0011.md': (
        '219e9582371a4c5bca7d0f74ca05feab283a664b',
        'a8a9aeeddd0ad0caf735499bd014d64567530c27632bbfeaaa0f1743aa949df2',
    ),
    'brain/11_AUDIT/Reports/AUDIT-0011.md': (
        'dd8606f27862f57c20dc6eeacfee7a566f059098',
        'cdffe557584eeb4a2aeae4ed67fd6035fb98529280c18d5a4e5eb48cb620bdcd',
    ),
}
for rel, (expected_blob, expected_sha256) in w3_abort_artifacts.items():
    candidate = root / rel
    check(candidate.is_file(), 'Certified W3 rerun-abort artifact is missing: ' + rel)
    if candidate.is_file():
        hash_result = subprocess.run(['git', 'hash-object', '--', rel], cwd=root, text=True, capture_output=True)
        check(hash_result.returncode == 0 and hash_result.stdout.strip() == expected_blob, 'Certified W3 rerun-abort Git blob changed: ' + rel)
        canonical_data = candidate.read_bytes().replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
        check(hashlib.sha256(canonical_data).hexdigest() == expected_sha256, 'Certified W3 rerun-abort canonical SHA-256 changed: ' + rel)

expected_quarantine_runs = [f'PRD07-RUN-{index:04d}' for index in range(51, 58)]
expected_quarantine_evidence = [f'PRD07-EVID-{index:04d}' for index in range(51, 58)]
w3_quarantine_path = root / 'docs/rebuild/r7/w3-allocation-reconciliation.json'
w3_quarantine = json.loads(w3_quarantine_path.read_text(encoding='utf-8')) if w3_quarantine_path.is_file() else {}
check(w3_quarantine.get('schema_version') == 'prd07-w3-allocation-reconciliation-v1', 'W3 allocation reconciliation is missing or unsupported')
check(w3_quarantine.get('status') == 'AUTHORITATIVE-QUARANTINE', 'W3 allocation reconciliation is not authoritative')
check(w3_quarantine.get('allocated_run_ids') == expected_quarantine_runs, 'W3 quarantined RUN range differs from 0051-0057')
check(w3_quarantine.get('allocated_evidence_ids') == expected_quarantine_evidence, 'W3 quarantined EVID range differs from 0051-0057')
expected_quarantine_proofs = [
    'PRD04-PROOF-27', 'PRD04-PROOF-28', 'PRD04-PROOF-08', 'PRD04-PROOF-30',
    'PRD04-PROOF-29', 'PRD04-PROOF-31', 'PRD04-PROOF-32',
]
w3_quarantine_rows = w3_quarantine.get('allocations', [])
check(isinstance(w3_quarantine_rows, list) and len(w3_quarantine_rows) == 7, 'W3 allocation reconciliation must contain exactly seven rows')
if isinstance(w3_quarantine_rows, list):
    for index, row in enumerate(w3_quarantine_rows):
        check(isinstance(row, dict), 'W3 quarantine allocation row is not an object')
        if not isinstance(row, dict):
            continue
        check(row.get('allocation_order') == index + 1, 'W3 quarantine allocation order changed')
        check(row.get('proof_id') == expected_quarantine_proofs[index], 'W3 quarantine proof mapping changed')
        check(row.get('run_id') == expected_quarantine_runs[index], 'W3 quarantine RUN mapping changed')
        check(row.get('evidence_id') == expected_quarantine_evidence[index], 'W3 quarantine EVID mapping changed')
        expected_state = 'INVALIDATED-BEFORE-PROOF-OBSERVATION' if index == 0 else 'QUARANTINED-PLAN-MATERIALIZED-NOT-STARTED'
        check(row.get('state') == expected_state, 'W3 quarantine disposition changed for ' + expected_quarantine_runs[index])
        check(row.get('evidence_pack_status') == 'NOT-CREATED-NO-PROOF-OBSERVATION', 'W3 quarantine row claims an evidence pack')
        check(row.get('prd07_evidence_eligible') is False and row.get('retained_pack') is False and row.get('reusable') is False, 'W3 quarantine row can be reused or mistaken for evidence')
check(w3_quarantine.get('proof_execution') == 'NOT-STARTED', 'W3 quarantine reconciliation claims proof execution')
check(w3_quarantine.get('reconciliation_basis', {}).get('evidence_commit') == 'e1458eb3589ca2ee844e9b5848e0226f6cdc56b5', 'W3 quarantine evidence commit changed')
check(w3_quarantine.get('failed_transaction', {}).get('proof_observations') == 0, 'W3 failed transaction claims a proof observation')
check(w3_quarantine.get('failed_transaction', {}).get('portable_prd07_packs') == 0, 'W3 failed transaction claims a portable evidence pack')
for key, expected_hash in (
    ('source_evidence', '48829ae029cdbed6ab299b96d8671aac41dc5fb69f44d4f72c19ca77d92a86aa'),
    ('source_engine_log', 'e2d999e906862b9a6a36d9143b03edb3ac90d8b555128e5fa894337d973a84f4'),
):
    source_record = w3_quarantine.get(key, {})
    source_path = root / str(source_record.get('path', ''))
    check(source_record.get('sha256') == expected_hash, 'W3 quarantine source hash declaration changed: ' + key)
    check(source_path.is_file(), 'W3 quarantine source is missing: ' + key)
    if source_path.is_file():
        check(hashlib.sha256(source_path.read_bytes()).hexdigest() == expected_hash, 'W3 quarantine source content changed: ' + key)
for run_id in expected_quarantine_runs:
    check(not (root / 'docs/rebuild/r7/execution-evidence' / run_id).exists(), 'Quarantined W3 identity unexpectedly has a retained pack: ' + run_id)
check(w3_manifest.get('quarantined_run_ids') == expected_quarantine_runs, 'Repaired W3 boundary does not preserve the exact quarantined RUN range')
check(w3_manifest.get('quarantined_evidence_ids') == expected_quarantine_evidence, 'Repaired W3 boundary does not preserve the exact quarantined EVID range')
check(w3_readiness.get('quarantined_run_ids') == expected_quarantine_runs, 'Repaired W3 readiness does not preserve the exact quarantined RUN range')
check(w3_readiness.get('quarantined_evidence_ids') == expected_quarantine_evidence, 'Repaired W3 readiness does not preserve the exact quarantined EVID range')

w3_engine_path = root / 'docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json'
w3_engine = json.loads(w3_engine_path.read_text(encoding='utf-8')) if w3_engine_path.is_file() else {}
check(w3_engine.get('schema_version') == 'prd07-w3-pinned-engine-validation-v1', 'W3 pinned-engine validation receipt is missing or unsupported')
check(w3_engine.get('status') == 'PASS', 'W3 pinned-engine validation did not pass')
check(w3_engine.get('implementation_commit') == w3_manifest.get('implementation_commit'), 'W3 pinned-engine receipt names a different implementation commit')
w3_engine_checks = w3_engine.get('checks', {})
for key in (
    'source_hash_identity_valid', 'pinned_engine_identity_valid', 'script_parse_load_valid',
    'controlled_entrypoint_reached', 'export_prerequisites_valid', 'export_completed',
    'exported_runtime_validation_valid',
):
    check(isinstance(w3_engine_checks, dict) and w3_engine_checks.get(key) is True, 'W3 pinned-engine validation check did not pass: ' + key)
check(isinstance(w3_engine_checks, dict) and w3_engine_checks.get('proof_execution_started') is False, 'W3 pinned-engine validation entered proof execution')
check(w3_engine.get('proof_execution') == 'NOT-STARTED', 'W3 pinned-engine validation claims proof execution')
check(w3_engine.get('allocated_run_ids') == [] and w3_engine.get('allocated_evidence_ids') == [], 'W3 pinned-engine validation allocated PRD-07 identities')
check(w3_engine.get('gameplay_permission') == 'CLOSED' and w3_engine.get('production_runtime') == 'ABSENT', 'W3 pinned-engine validation crossed the rebuild boundary')
w3_engine_summary_keys = (
    'schema_version', 'status', 'implementation_commit', 'source_identity', 'dependency_identity',
    'checks', 'source_process', 'export_process', 'export_artifact', 'exported_runtime_process',
    'source_runtime_report', 'exported_runtime_report', 'proof_execution', 'allocated_run_ids',
    'allocated_evidence_ids', 'gameplay_permission', 'production_runtime',
)
w3_engine_summary = {key: w3_engine.get(key) for key in w3_engine_summary_keys if key in w3_engine}
check(w3_readiness.get('pinned_engine_validation') == w3_engine_summary, 'W3 readiness does not pin the exact engine-validation summary')
check(w3_manifest.get('pinned_engine_validation') == w3_engine_summary, 'W3 boundary does not pin the exact engine-validation summary')

w3_fixture_launch_path = root / 'docs/rebuild/r7/w3-fixture-launch-integration.json'
w3_fixture_launch = json.loads(w3_fixture_launch_path.read_text(encoding='utf-8')) if w3_fixture_launch_path.is_file() else {}
check(w3_fixture_launch.get('schema_version') == 'prd07-w3-fixture-launch-integration-v1', 'W3 fixture-launch integration receipt is missing or unsupported')
check(w3_fixture_launch.get('status') == 'PASS', 'W3 fixture-launch integration did not pass')
check(w3_fixture_launch.get('implementation_commit') == w3_manifest.get('implementation_commit'), 'W3 fixture-launch receipt names a different implementation commit')
check(w3_fixture_launch.get('source_identity') == w3_engine.get('source_identity'), 'W3 fixture-launch source identity differs from pinned-engine validation')
check(w3_fixture_launch.get('dependency_identity') == {
    'godot_build_driver_revision': w3_reference.get('component_revisions', {}).get('godot_build_driver'),
    'godot_export_template_revision': w3_reference.get('component_revisions', {}).get('godot_export_template'),
    'voxel_tools_revision': w3_reference.get('component_revisions', {}).get('voxel_tools'),
    'local_patch_status': 'NO-LOCAL-PATCH',
}, 'W3 fixture-launch dependency identity differs')
w3_fixture_checks = w3_fixture_launch.get('checks', {})
for key in (
    'pinned_dependencies_valid', 'client_export_completed', 'headless_export_completed',
    'authoritative_manifest_contract_valid', 'client_artifact_launch_valid',
    'headless_artifact_launch_valid', 'client_runtime_self_report_valid',
    'headless_runtime_self_report_valid', 'build_identity_round_trip_valid',
    'execution_state_unchanged', 'registry_unchanged',
):
    check(isinstance(w3_fixture_checks, dict) and w3_fixture_checks.get(key) is True, 'W3 fixture-launch integration check did not pass: ' + key)
for key in ('proof_execution_started', 'identity_allocation_started', 'production_runtime_present'):
    check(isinstance(w3_fixture_checks, dict) and w3_fixture_checks.get(key) is False, 'W3 fixture-launch integration crossed a forbidden boundary: ' + key)
check(w3_fixture_launch.get('proof_execution') == 'NOT-STARTED', 'W3 fixture-launch integration claims proof execution')
check(w3_fixture_launch.get('allocated_run_ids') == [] and w3_fixture_launch.get('allocated_evidence_ids') == [], 'W3 fixture-launch integration allocated PRD-07 identities')
check(w3_fixture_launch.get('gameplay_permission') == 'CLOSED' and w3_fixture_launch.get('production_runtime') == 'ABSENT', 'W3 fixture-launch integration crossed the rebuild boundary')
w3_fixture_before = w3_fixture_launch.get('before_execution_authority', {})
w3_fixture_after = w3_fixture_launch.get('after_execution_authority', {})
check(isinstance(w3_fixture_before, dict) and w3_fixture_before == w3_fixture_after, 'W3 fixture-launch integration changed execution authority')
if isinstance(w3_fixture_before, dict):
    check(w3_fixture_before.get('state_sha256') == hashlib.sha256((root / 'docs/rebuild/r7/w3-execution-state.json').read_bytes()).hexdigest(), 'W3 fixture-launch integration state snapshot differs')
    fixture_registry = w3_fixture_before.get('registry', {})
    check(isinstance(fixture_registry, dict) and fixture_registry.get('max_run_number') == 58 and fixture_registry.get('max_evidence_number') == 58, 'W3 fixture-launch integration registry high-water differs')
w3_fixture_roles = w3_fixture_launch.get('roles', {})
check(isinstance(w3_fixture_roles, dict) and set(w3_fixture_roles) == {'client', 'headless'}, 'W3 fixture-launch integration role set differs')
if isinstance(w3_fixture_roles, dict):
    for role in ('client', 'headless'):
        row = w3_fixture_roles.get(role, {})
        artifact = row.get('artifact_manifest', {}) if isinstance(row, dict) else {}
        runtime_report = row.get('runtime_self_report', {}) if isinstance(row, dict) else {}
        check(isinstance(row, dict) and row.get('role') == role, 'W3 fixture-launch role identity differs: ' + role)
        check(isinstance(row, dict) and re.fullmatch(r'[0-9a-f]{64}', str(row.get('build_identity', ''))) is not None, 'W3 fixture-launch build identity is invalid: ' + role)
        check(isinstance(artifact, dict) and artifact.get('manifest_schema') == 'prd07-artifact-manifest-v1', 'W3 fixture-launch artifact schema differs: ' + role)
        check(isinstance(artifact, dict) and artifact.get('authoritative_path_field') == 'artifact_path', 'W3 fixture-launch artifact path contract differs: ' + role)
        check(isinstance(artifact, dict) and artifact.get('path_resolved_during_validation') is True, 'W3 fixture-launch artifact path did not resolve: ' + role)
        check(isinstance(artifact, dict) and artifact.get('manifest_contract_valid') is True, 'W3 fixture-launch artifact manifest contract failed: ' + role)
        check(isinstance(artifact, dict) and artifact.get('build_identity_round_trip_valid') is True, 'W3 fixture-launch build identity did not round trip: ' + role)
        check(isinstance(artifact, dict) and artifact.get('build_identity') == row.get('build_identity'), 'W3 fixture-launch artifact/build identities differ: ' + role)
        check(isinstance(artifact, dict) and re.fullmatch(r'[0-9a-f]{64}', str(artifact.get('artifact_sha256', ''))) is not None and int(artifact.get('size_bytes', 0)) > 0, 'W3 fixture-launch artifact identity is invalid: ' + role)
        check(isinstance(artifact, dict) and artifact.get('exported_runtime') is True and artifact.get('synthetic_fixture') is False, 'W3 fixture-launch artifact is not a real export: ' + role)
        check(isinstance(runtime_report, dict) and runtime_report.get('status') == 'PASS', 'W3 fixture-launch runtime self-report did not pass: ' + role)
        check(isinstance(runtime_report, dict) and runtime_report.get('proof_execution_started') is False, 'W3 fixture-launch runtime entered proof execution: ' + role)
        check(isinstance(runtime_report, dict) and runtime_report.get('production_runtime') is False, 'W3 fixture-launch runtime crossed into production: ' + role)
        check(isinstance(runtime_report, dict) and runtime_report.get('stable_proof_ids') == expected_w3_proofs, 'W3 fixture-launch stable proof identities differ: ' + role)
        check(isinstance(runtime_report, dict) and runtime_report.get('provider_ready') is True and int(runtime_report.get('provider_errors', 1)) == 0, 'W3 fixture-launch provider self-report failed: ' + role)
        check(isinstance(runtime_report, dict) and int(runtime_report.get('frame_round_trip_errors', 1)) == 0 and int(runtime_report.get('contact_errors', 1)) == 0, 'W3 fixture-launch frame/contact self-report failed: ' + role)
w3_fixture_summary_keys = (
    'schema_version', 'status', 'package', 'implementation_commit', 'source_identity',
    'dependency_identity', 'checks', 'roles', 'proof_execution', 'allocated_run_ids',
    'allocated_evidence_ids', 'gameplay_permission', 'production_runtime',
)
w3_fixture_summary = {key: w3_fixture_launch.get(key) for key in w3_fixture_summary_keys if key in w3_fixture_launch}
check(w3_readiness.get('fixture_launch_validation') == w3_fixture_summary, 'W3 readiness does not pin the exact fixture-launch integration summary')
check(w3_manifest.get('fixture_launch_validation') == w3_fixture_summary, 'W3 boundary does not pin the exact fixture-launch integration summary')

w3_run_ids = w3_manifest.get('allocated_run_ids', [])
w3_evidence_ids = w3_manifest.get('allocated_evidence_ids', [])
check(isinstance(w3_run_ids, list), 'R7 W3 run identities are not a list')
check(isinstance(w3_evidence_ids, list), 'R7 W3 evidence identities are not a list')
w3_run_ids = w3_run_ids if isinstance(w3_run_ids, list) else []
w3_evidence_ids = w3_evidence_ids if isinstance(w3_evidence_ids, list) else []
check(len(w3_run_ids) == len(set(w3_run_ids)), 'R7 W3 contains duplicate run identities')
check(len(w3_evidence_ids) == len(set(w3_evidence_ids)), 'R7 W3 contains duplicate evidence identities')
check(len(w3_run_ids) == len(w3_evidence_ids), 'R7 W3 run/evidence identity counts differ')
check(w3_run_ids == [] and w3_evidence_ids == [], 'R7 W3 next-rerun boundary allocated execution identities')
prior_run_ids = list(r7_manifest.get('allocated_run_ids', [])) + list(w1_run_ids) + list(w2_run_ids) + expected_quarantine_runs
prior_evidence_ids = list(r7_manifest.get('allocated_evidence_ids', [])) + list(w1_evidence_ids) + list(w2_evidence_ids) + expected_quarantine_evidence
prior_run_numbers = [int(match.group(1)) for value in prior_run_ids for match in [re.fullmatch(r'PRD07-RUN-(\d{4})', str(value))] if match]
prior_evidence_numbers = [int(match.group(1)) for value in prior_evidence_ids for match in [re.fullmatch(r'PRD07-EVID-(\d{4})', str(value))] if match]
check(len(prior_run_numbers) == len(prior_run_ids), 'Prior R7 run registry contains a malformed identity')
check(len(prior_evidence_numbers) == len(prior_evidence_ids), 'Prior R7 evidence registry contains a malformed identity')
prior_run_max = max(prior_run_numbers, default=0)
prior_evidence_max = max(prior_evidence_numbers, default=0)
check(prior_run_max == prior_evidence_max, 'Prior R7 run/evidence registry high-water marks differ')

w3_state_path = root / 'docs/rebuild/r7/w3-execution-state.json'
w3_state = json.loads(w3_state_path.read_text(encoding='utf-8')) if w3_state_path.is_file() else {}
w3_state_runs = w3_state.get('allocated_run_ids', [])
w3_state_evidence = w3_state.get('allocated_evidence_ids', [])
check(w3_state_runs == ['PRD07-RUN-0058'], 'R7 W3 terminal state does not preserve invalidated RUN 0058')
check(w3_state_evidence == ['PRD07-EVID-0058'], 'R7 W3 terminal state does not preserve invalidated EVID 0058')
check(w3_manifest.get('invalidated_run_ids') == w3_state_runs, 'R7 W3 current boundary invalidated RUN identities differ from execution state')
check(w3_manifest.get('invalidated_evidence_ids') == w3_state_evidence, 'R7 W3 current boundary invalidated EVID identities differ from execution state')
check(w3_readiness.get('invalidated_run_ids') == w3_state_runs, 'R7 W3 readiness invalidated RUN identities differ from execution state')
check(w3_readiness.get('invalidated_evidence_ids') == w3_state_evidence, 'R7 W3 readiness invalidated EVID identities differ from execution state')
w3_allocation_history = w3_state.get('allocation_history', []) if isinstance(w3_state, dict) else []
check(isinstance(w3_allocation_history, list), 'R7 W3 execution allocation history is invalid')
if isinstance(w3_allocation_history, list):
    w3_history_runs = [row.get('run_id') for row in w3_allocation_history if isinstance(row, dict)]
    w3_history_evidence = [row.get('evidence_id') for row in w3_allocation_history if isinstance(row, dict)]
    check(w3_history_runs == w3_state_runs, 'R7 W3 allocation-history RUN order differs from terminal state')
    check(w3_history_evidence == w3_state_evidence, 'R7 W3 allocation-history EVID order differs from terminal state')
    check(all(row.get('proof_id') in expected_w3_proofs for row in w3_allocation_history if isinstance(row, dict)), 'R7 W3 allocation history names an unauthorized proof')
    check(not any(row.get('state') in {'PRD07-RUN-ALLOCATED', 'EXECUTING', 'OBSERVATION-CAPTURED'} for row in w3_allocation_history if isinstance(row, dict)), 'R7 W3 execution state contains an unresolved active allocation')
    w3_observed_rows = [row for row in w3_allocation_history if isinstance(row, dict) and row.get('state') in {'PASS-OBSERVED', 'FAIL-OBSERVED', 'INCONCLUSIVE'}]
    w3_invalidated_rows = [row for row in w3_allocation_history if isinstance(row, dict) and row.get('state') == 'INVALIDATED']
else:
    w3_history_runs = []
    w3_history_evidence = []
    w3_observed_rows = []
    w3_invalidated_rows = []
check(w3_state.get('package_state') == 'ABORTED-BEFORE-PROOF-OBSERVATION', 'R7 W3 terminal execution disposition changed')
check(len(w3_observed_rows) == 0, 'R7 W3 aborted execution state claims a proof observation')
check(len(w3_invalidated_rows) == 1, 'R7 W3 terminal execution state does not contain exactly one invalidated attempt')
if len(w3_invalidated_rows) == 1:
    w3_attempt = w3_invalidated_rows[0]
    check(w3_attempt.get('run_id') == 'PRD07-RUN-0058' and w3_attempt.get('evidence_id') == 'PRD07-EVID-0058', 'R7 W3 invalidated attempt identity changed')
    check(w3_attempt.get('terminal_disposition') == 'ABORTED-BEFORE-PROOF-OBSERVATION', 'R7 W3 invalidated attempt terminal disposition changed')
    check(w3_attempt.get('proof_observation_produced') is False, 'R7 W3 invalidated attempt claims a proof observation')
    check(w3_attempt.get('evidence_pack_status') == 'NOT-CREATED-NO-PROOF-OBSERVATION' and w3_attempt.get('prd07_evidence_eligible') is False, 'R7 W3 invalidated attempt can be mistaken for retained evidence')
check(not (root / 'docs/rebuild/r7/execution-evidence/PRD07-RUN-0058').exists(), 'Invalidated W3 identity 0058 unexpectedly has a retained proof pack')

w3_historical_admission = w3_manifest.get('historical_admission', {})
w3_pre_execution_path = root / 'docs/rebuild/r7/w3-execution-boundary-repaired.json'
w3_pre_execution = json.loads(w3_pre_execution_path.read_text(encoding='utf-8')) if w3_pre_execution_path.is_file() else {}
check(isinstance(w3_historical_admission, dict) and w3_historical_admission.get('lifecycle_role') == 'IMMUTABLE-PRE-EXECUTION-ADMISSION', 'R7 W3 historical admission role is missing')
check(w3_pre_execution.get('proof_execution') == 'NOT-STARTED', 'R7 W3 historical admission no longer describes its pre-execution timepoint')
check(w3_pre_execution.get('allocated_run_ids') == [] and w3_pre_execution.get('allocated_evidence_ids') == [], 'R7 W3 historical admission was mutated with later allocations')
if w3_pre_execution_path.is_file() and isinstance(w3_historical_admission, dict):
    w3_pre_data = w3_pre_execution_path.read_bytes().replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    w3_pre_blob = subprocess.run(['git', 'hash-object', '--', w3_pre_execution_path.relative_to(root).as_posix()], cwd=root, text=True, capture_output=True)
    check(w3_historical_admission.get('git_blob') == w3_pre_blob.stdout.strip(), 'R7 W3 historical admission Git blob identity differs')
    check(w3_historical_admission.get('sha256') == hashlib.sha256(w3_pre_data).hexdigest(), 'R7 W3 historical admission canonical SHA-256 differs')
    check(w3_historical_admission.get('bytes') == len(w3_pre_data), 'R7 W3 historical admission canonical byte count differs')

w3_historical_execution = w3_manifest.get('historical_execution', {})
check(isinstance(w3_historical_execution, dict) and w3_historical_execution.get('lifecycle_role') == 'IMMUTABLE-TERMINAL-EXECUTION-JOURNAL', 'R7 W3 historical execution role is missing')
if w3_state_path.is_file() and isinstance(w3_historical_execution, dict):
    w3_state_data = w3_state_path.read_bytes().replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    w3_state_blob = subprocess.run(['git', 'hash-object', '--', w3_state_path.relative_to(root).as_posix()], cwd=root, text=True, capture_output=True)
    check(w3_historical_execution.get('git_blob') == w3_state_blob.stdout.strip(), 'R7 W3 historical execution Git blob identity differs')
    check(w3_historical_execution.get('sha256') == hashlib.sha256(w3_state_data).hexdigest(), 'R7 W3 historical execution canonical SHA-256 differs')
    check(w3_historical_execution.get('bytes') == len(w3_state_data), 'R7 W3 historical execution canonical byte count differs')
    check(w3_historical_execution.get('source_revision') == w3_state.get('source_revision'), 'R7 W3 historical execution source revision differs')
    check(w3_historical_execution.get('package_state') == w3_state.get('package_state'), 'R7 W3 historical execution package disposition differs')
    check(w3_historical_execution.get('allocated_run_ids') == w3_state_runs, 'R7 W3 historical execution RUN reconciliation differs')
    check(w3_historical_execution.get('allocated_evidence_ids') == w3_state_evidence, 'R7 W3 historical execution EVID reconciliation differs')
    check(w3_historical_execution.get('allocation_history_run_ids') == w3_history_runs, 'R7 W3 historical execution RUN order reconciliation differs')
    check(w3_historical_execution.get('allocation_history_evidence_ids') == w3_history_evidence, 'R7 W3 historical execution EVID order reconciliation differs')
    check(w3_historical_execution.get('proof_observation_count') == len(w3_observed_rows), 'R7 W3 historical execution proof-observation count differs')

w3_registry = w3_manifest.get('registry', {})
check(w3_registry.get('run_high_water') == 58, 'R7 W3 registry RUN high-water differs')
check(w3_registry.get('evidence_high_water') == 58, 'R7 W3 registry EVID high-water differs')
check(w3_registry.get('issued_identity_count') == 58, 'R7 W3 registry issued-identity count differs')
check(w3_registry.get('retained_identity_count') == 50, 'R7 W3 registry retained-identity count differs')
check(w3_registry.get('quarantined_identity_count') == 7, 'R7 W3 registry quarantine count differs')
check(w3_registry.get('invalidated_identity_count') == 1, 'R7 W3 registry invalidated-identity count differs')
check(w3_registry.get('next_future_sequence') == 59, 'R7 W3 registry next identity differs')
check(w3_registry.get('quarantine_paths') == ['docs/rebuild/r7/w3-allocation-reconciliation.json'], 'R7 W3 registry quarantine source differs')
w3_previews = w3_manifest.get('next_identity_previews', [])
check(isinstance(w3_previews, list) and len(w3_previews) == 7, 'R7 W3 next-rerun preview set differs')
if isinstance(w3_previews, list):
    expected_w3_preview_runs = [f'PRD07-RUN-{index:04d}' for index in range(59, 66)]
    expected_w3_preview_evidence = [f'PRD07-EVID-{index:04d}' for index in range(59, 66)]
    check([row.get('run_id') for row in w3_previews if isinstance(row, dict)] == expected_w3_preview_runs, 'R7 W3 next RUN previews are not the exact allocation order 0059-0065')
    check([row.get('evidence_id') for row in w3_previews if isinstance(row, dict)] == expected_w3_preview_evidence, 'R7 W3 next EVID previews are not the exact allocation order 0059-0065')
    check(all(row.get('allocation_state') == 'PREVIEW-NOT-ALLOCATED' for row in w3_previews if isinstance(row, dict)), 'R7 W3 next identity previews claim allocation')

w3_admitted_paths = set()
w3_admitted_artifacts = []
w3_prefixes = ('proofs/r7/w3/', 'tools/r7_w3_runtime/')
w3_exact_paths = {
    'tools/tests/test_r7_w3_runtime.py',
    'tools/verify.py',
    'tools/verify_rebuild_boundary.py',
    'docs/rebuild/r7/w3-allocation-reconciliation.json',
    'docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json',
    'docs/rebuild/r7/w3-fixture-launch-integration.json',
    'docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json',
    'docs/rebuild/r7/w3-execution-state.json',
    'docs/rebuild/r7/w3-execution-completion-receipt.json',
}
expected_w3_runs = {f'docs/rebuild/r7/execution-evidence/{run_id}/' for run_id in w3_run_ids}
for artifact in w3_manifest.get('artifacts', []):
    rel = artifact.get('path')
    valid_path = (
        isinstance(rel, str)
        and (
            rel.startswith(w3_prefixes)
            or rel in w3_exact_paths
            or any(rel.startswith(prefix) for prefix in expected_w3_runs)
        )
        and '..' not in Path(rel).parts
        and not Path(rel).is_absolute()
    )
    check(valid_path, 'Invalid R7 W3 admission path: ' + str(rel))
    if not valid_path:
        continue
    check(rel not in w3_admitted_paths, 'Duplicate R7 W3 admission path: ' + rel)
    w3_admitted_paths.add(rel)
    candidate = root / rel
    check(candidate.is_file(), 'Admitted R7 W3 path is missing: ' + rel)
    check(candidate.suffix.lower() in {'.py', '.json', '.md', '.gd', '.tscn', '.godot'}, 'Unsupported R7 W3 file type: ' + rel)
    check(candidate.suffix.lower() not in {'.exe', '.dll', '.pck', '.res', '.tres'}, 'Binary or production resource admitted through R7 W3: ' + rel)
    if candidate.is_file():
        w3_admitted_artifacts.append((rel, candidate, artifact))
w3_hash_result = subprocess.run(
    ['git', 'hash-object', '--stdin-paths'], cwd=root,
    input=chr(10).join(rel for rel, _, _ in w3_admitted_artifacts) + chr(10),
    text=True, capture_output=True,
)
check(w3_hash_result.returncode == 0, 'R7 W3 Git-clean blob hashing failed')
w3_blob_hashes = w3_hash_result.stdout.splitlines() if w3_hash_result.returncode == 0 else []
check(len(w3_blob_hashes) == len(w3_admitted_artifacts), 'R7 W3 Git-clean blob count differs')
for index, (rel, candidate, artifact) in enumerate(w3_admitted_artifacts):
    expected_blob = artifact.get('git_blob')
    actual_blob = w3_blob_hashes[index] if index < len(w3_blob_hashes) else ''
    check(isinstance(expected_blob, str) and re.fullmatch(r'[0-9a-f]{40}', expected_blob) is not None, 'Admitted R7 W3 Git blob is missing or invalid: ' + rel)
    check(actual_blob == expected_blob, 'Admitted R7 W3 Git-clean blob changed: ' + rel)
    raw_data = candidate.read_bytes()
    canonical_data = raw_data.replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    check(len(canonical_data) == artifact.get('bytes'), 'Admitted R7 W3 canonical size changed: ' + rel)
    check(hashlib.sha256(canonical_data).hexdigest() == artifact.get('sha256'), 'Admitted R7 W3 canonical SHA-256 changed: ' + rel)
check(not any(path.endswith(('.exe', '.dll', '.pck')) for path in w3_admitted_paths), 'R7 W3 boundary admitted dependency/runtime binaries')
for required_path in {
    'tools/verify.py',
    'tools/verify_rebuild_boundary.py',
    'docs/rebuild/r7/w3-allocation-reconciliation.json',
    'docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json',
    'docs/rebuild/r7/w3-fixture-launch-integration.json',
    'docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json',
    'docs/rebuild/r7/w3-execution-state.json',
}:
    check(required_path in w3_admitted_paths, 'Current R7 W3 boundary does not hash-pin: ' + required_path)

# Discard conclusions from the preserved pre-execution validator and replace
# them with the fail-closed terminal reconciliation.  This does not waive any
# check: tools/r7_w3_reconciliation.py revalidates the immutable timepoint,
# executed source commit, append-only journal, packs, identities, dependencies,
# environment, production boundary and the superseding manifest together.
del failures[w3_historical_failure_start:]
checks = w3_historical_check_start

w3_manifest_path = root / 'docs/rebuild/r7/w3-execution-boundary-execution-complete.json'
w3_manifest = json.loads(w3_manifest_path.read_text(encoding='utf-8')) if w3_manifest_path.is_file() else {}
w3_readiness_path = root / 'docs/rebuild/r7/w3-readiness-execution-complete.json'
w3_readiness = json.loads(w3_readiness_path.read_text(encoding='utf-8')) if w3_readiness_path.is_file() else {}
check(w3_manifest.get('schema_version') == 'prd07-w3-post-execution-boundary-v1', 'Terminal R7 W3 boundary is missing or unsupported')
check(w3_manifest.get('manifest_version') == 4, 'Terminal R7 W3 manifest version differs')
check(w3_manifest.get('package') == 'R7-W3-TECHNICAL-ENVIRONMENT-EXECUTION-RERUN', 'Terminal R7 W3 package identity changed')
check(w3_manifest.get('lifecycle_role') == 'CURRENT-POST-EXECUTION-CERTIFICATION', 'Terminal R7 W3 lifecycle role changed')
check(w3_manifest.get('scope') == 'development-only-prd07-proof-runtime', 'Terminal R7 W3 scope changed')
check(w3_manifest.get('proof_execution') == 'OBSERVED', 'Terminal R7 W3 boundary does not retain observed execution')
check(w3_manifest.get('execution_gate') == 'CLOSED-W3-EXECUTION-COMPLETE', 'Terminal R7 W3 execution gate is not closed')
check(w3_manifest.get('gameplay_permission') == 'CLOSED', 'Terminal R7 W3 boundary opened gameplay permission')
check(w3_manifest.get('production_runtime') == 'ABSENT', 'Terminal R7 W3 boundary admitted production runtime')
check(w3_manifest.get('active_poc_dependencies') == 0, 'Terminal R7 W3 boundary admitted an active POC dependency')
check(w3_manifest.get('prd08_evaluation') == 'CLOSED' and w3_manifest.get('prd08_submission') == 'NOT-SUBMITTED', 'Terminal R7 W3 boundary opened or submitted PRD-08')
check(w3_manifest.get('w3_state') == 'COMPLETE', 'Terminal R7 W3 boundary does not mark W3 complete')
check(w3_manifest.get('r7_state') == 'ACTIVE-AWAITING-W4-GOVERNED-ACTION', 'Terminal R7 W3 boundary changed the R7 continuation state')
check(w3_manifest.get('next_identity_previews') == [], 'Terminal R7 W3 boundary retains stale identity previews')
check(w3_readiness.get('schema_version') == 'prd07-w3-post-execution-readiness-v1', 'Terminal R7 W3 readiness is missing or unsupported')
check(w3_readiness.get('status') == 'PASS' and w3_readiness.get('w3_state') == 'COMPLETE', 'Terminal R7 W3 readiness does not pass as complete')
check(w3_readiness.get('proof_execution') == 'OBSERVED', 'Terminal R7 W3 readiness does not retain observed execution')
check(w3_readiness.get('gameplay_permission') == 'CLOSED' and w3_readiness.get('prd08_evaluation') == 'CLOSED', 'Terminal R7 W3 readiness crossed the gameplay/PRD-08 boundary')

w3_terminal_process = subprocess.run(
    [sys.executable, str(root / 'tools/r7_w3_reconciliation.py'), 'verify', '--format', 'json'],
    cwd=root, text=True, capture_output=True,
)
try:
    w3_terminal_report = json.loads(w3_terminal_process.stdout) if w3_terminal_process.stdout else {}
except json.JSONDecodeError:
    w3_terminal_report = {}
check(w3_terminal_process.returncode == 0, 'Terminal R7 W3 reconciliation process failed: ' + (w3_terminal_process.stderr.strip() or '; '.join(w3_terminal_report.get('issues', []))))
check(w3_terminal_report.get('status') == 'PASS', 'Terminal R7 W3 reconciliation did not pass')
for issue in w3_terminal_report.get('issues', []):
    check(False, 'Terminal R7 W3 reconciliation issue: ' + str(issue))

w3_run_ids = w3_manifest.get('successful_rerun_run_ids', [])
w3_evidence_ids = w3_manifest.get('successful_rerun_evidence_ids', [])
expected_w3_success_runs = [f'PRD07-RUN-{index:04d}' for index in range(59, 66)]
expected_w3_success_evidence = [f'PRD07-EVID-{index:04d}' for index in range(59, 66)]
check(w3_run_ids == expected_w3_success_runs, 'Terminal R7 W3 successful RUN identities differ from 0059-0065')
check(w3_evidence_ids == expected_w3_success_evidence, 'Terminal R7 W3 successful EVID identities differ from 0059-0065')
check(w3_manifest.get('allocated_run_ids') == ['PRD07-RUN-0058', *expected_w3_success_runs], 'Terminal R7 W3 issued RUN journal differs from 0058-0065')
check(w3_manifest.get('allocated_evidence_ids') == ['PRD07-EVID-0058', *expected_w3_success_evidence], 'Terminal R7 W3 issued EVID journal differs from 0058-0065')
check(w3_manifest.get('invalidated_run_ids') == ['PRD07-RUN-0058'], 'Terminal R7 W3 invalidated RUN identity changed')
check(w3_manifest.get('invalidated_evidence_ids') == ['PRD07-EVID-0058'], 'Terminal R7 W3 invalidated EVID identity changed')

w3_admitted_paths = set()
w3_admitted_artifacts = []
w3_prefixes = ('proofs/r7/w3/', 'tools/r7_w3_runtime/')
w3_exact_paths = {
    'tools/r7_w3_reconciliation.py',
    'tools/tests/test_r7_w3_reconciliation.py',
    'tools/tests/test_r7_w3_runtime.py',
    'tools/verify.py',
    'tools/verify_rebuild_boundary.py',
    'docs/rebuild/r7/w3-allocation-reconciliation.json',
    'docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json',
    'docs/rebuild/r7/w3-fixture-launch-integration.json',
    'docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json',
    'docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json',
    'docs/rebuild/r7/w3-readiness-execution-complete.json',
    'docs/rebuild/r7/w3-execution-state.json',
}
expected_w3_runs = {f'docs/rebuild/r7/execution-evidence/{run_id}/' for run_id in expected_w3_success_runs}
for artifact in w3_manifest.get('artifacts', []):
    rel = artifact.get('path')
    valid_path = (
        isinstance(rel, str)
        and (rel.startswith(w3_prefixes) or rel in w3_exact_paths or any(rel.startswith(prefix) for prefix in expected_w3_runs))
        and '..' not in Path(rel).parts
        and not Path(rel).is_absolute()
    )
    check(valid_path, 'Invalid terminal R7 W3 admission path: ' + str(rel))
    if not valid_path:
        continue
    check(rel not in w3_admitted_paths, 'Duplicate terminal R7 W3 admission path: ' + rel)
    w3_admitted_paths.add(rel)
    candidate = root / rel
    check(candidate.is_file(), 'Admitted terminal R7 W3 path is missing: ' + rel)
    check(candidate.suffix.lower() in {'.py', '.json', '.md', '.gd', '.tscn', '.godot'}, 'Unsupported terminal R7 W3 file type: ' + rel)
    check(candidate.suffix.lower() not in {'.exe', '.dll', '.pck', '.res', '.tres'}, 'Binary or production resource admitted through terminal R7 W3: ' + rel)
    if candidate.is_file():
        w3_admitted_artifacts.append((rel, candidate, artifact))
w3_hash_result = subprocess.run(
    ['git', 'hash-object', '--stdin-paths'], cwd=root,
    input=chr(10).join(rel for rel, _, _ in w3_admitted_artifacts) + chr(10),
    text=True, capture_output=True,
)
check(w3_hash_result.returncode == 0, 'Terminal R7 W3 Git-clean blob hashing failed')
w3_blob_hashes = w3_hash_result.stdout.splitlines() if w3_hash_result.returncode == 0 else []
check(len(w3_blob_hashes) == len(w3_admitted_artifacts), 'Terminal R7 W3 Git-clean blob count differs')
for index, (rel, candidate, artifact) in enumerate(w3_admitted_artifacts):
    actual_blob = w3_blob_hashes[index] if index < len(w3_blob_hashes) else ''
    check(actual_blob == artifact.get('git_blob'), 'Admitted terminal R7 W3 Git-clean blob changed: ' + rel)
    canonical_data = candidate.read_bytes().replace(bytes([13, 10]), bytes([10])).replace(bytes([13]), bytes([10]))
    check(len(canonical_data) == artifact.get('bytes'), 'Admitted terminal R7 W3 canonical size changed: ' + rel)
    check(hashlib.sha256(canonical_data).hexdigest() == artifact.get('sha256'), 'Admitted terminal R7 W3 canonical SHA-256 changed: ' + rel)
check(not any(path.endswith(('.exe', '.dll', '.pck')) for path in w3_admitted_paths), 'Terminal R7 W3 boundary admitted dependency/runtime binaries')
for required_path in w3_exact_paths:
    check(required_path in w3_admitted_paths, 'Terminal R7 W3 boundary does not hash-pin: ' + required_path)

baseline_docs = manifest['source_document_blobs']
intake_docs = {}
intake_manifests = []
intake_root = root / 'docs/rebuild/source-intake'
for intake_path in sorted(intake_root.glob('*.json')) if intake_root.is_dir() else []:
    intake = json.loads(intake_path.read_text(encoding='utf-8'))
    intake_manifests.append(intake_path.relative_to(root).as_posix())
    check(intake.get('manifest_version') == 1, 'Unsupported source-intake manifest: ' + intake_path.name)
    for artifact in intake.get('artifacts', []):
        path = artifact.get('path')
        check(isinstance(path, str) and path.startswith('.summer/00_Docs/'), 'Invalid admitted source path in ' + intake_path.name)
        check(path not in baseline_docs and path not in intake_docs, 'Duplicate admitted source path: ' + str(path))
        if isinstance(path, str):
            intake_docs[path] = artifact
expected_docs = dict(baseline_docs)
expected_docs.update({path: item['git_blob_hash'] for path, item in intake_docs.items()})
actual_docs = {p.relative_to(root).as_posix() for p in (root / '.summer/00_Docs').rglob('*') if p.is_file()}
check(actual_docs == set(expected_docs), 'Supplied source document set changed')
unchanged = sorted(set(baseline_docs) - set(manifest['approved_document_updates']))
result = subprocess.run(['git','hash-object','--stdin-paths'],cwd=root,input='\n'.join(unchanged)+'\n',text=True,capture_output=True)
check(result.returncode == 0, 'Source blob hashing failed')
blobs = result.stdout.splitlines()
check(len(blobs) == len(unchanged), 'Source blob count differs')
for path,blob in zip(unchanged,blobs):
    check(blob == baseline_docs[path], 'Source content changed: '+path)
for path, artifact in sorted(intake_docs.items()):
    source = root / path
    check(source.is_file(), 'Admitted source is missing: ' + path)
    if source.is_file():
        data = source.read_bytes()
        check(len(data) == artifact.get('bytes'), 'Admitted source size changed: ' + path)
        check(hashlib.sha256(data).hexdigest() == artifact.get('sha256'), 'Admitted source SHA-256 changed: ' + path)
        prefix = f'blob {len(data)}\0'.encode('ascii')
        check(hashlib.sha1(prefix + data).hexdigest() == artifact.get('git_blob_hash'), 'Admitted source Git blob changed: ' + path)
check(manifest['archived_validation_admitted'] == [], 'Unexpected fixture admission')
for folder in manifest['brain_folders']:
    check((root/'brain'/folder/'.gitkeep').is_file(), 'Missing canonical Brain placeholder: '+folder)
check((root/'brain/91_SCHEMA/brain.schema.json').is_file(), 'Brain schema is missing')
check((root/'brain/92_SCRIPTS/brain.py').is_file(), 'Brain CLI is missing')
check('Project Brain' in (root/'brain/HOME.md').read_text(), 'Brain home is not operational')

root_files = {'.git','.gitignore','.gitattributes','.editorconfig','AGENTS.md','README.md'}
patterns = {
    'retired_identity': r'controlled[ _.-]+poc|poc[ _.-]+valley|retired.{0,30}(identity|identities)',
    'old_resource_paths': r'res://|main_menu\.tscn|main\.tscn|project\.godot|scripts/(autoload|world|forge)',
    'fixed_world_logic': r'fixed.{0,25}(seed|coordinate|portal|quest)|hardcoded.{0,25}(world|quest|tutorial)',
    'save_registry_identity': r'leyforge\.poc\.save|SAVE_FORMAT|save.{0,12}v1[378]|world\.profile\.|item\.resource\.|voxel_registry',
    'archive_or_generator': r'archive/|archive-evidence|generate_settlement|update_production_roadmap|legacy-poc',
}
matches = []
ignored_walk_dirs = {'.git', '.local', '__pycache__'}
for directory, dirnames, filenames in os.walk(root, topdown=True):
    dirnames[:] = sorted(name for name in dirnames if name not in ignored_walk_dirs)
    for filename in sorted(filenames):
        path = Path(directory) / filename
        rel = path.relative_to(root).as_posix()
        check(not path.is_symlink(), 'Unexpected filesystem link: '+rel)
        allowed = rel in root_files or rel == '.summer/AGENTS.md' or rel in expected_docs or rel.startswith(('docs/rebuild/','brain/')) or rel in w0_admitted_paths or rel in r7_admitted_paths or rel in w1_admitted_paths or rel in w2_admitted_paths or rel in w3_admitted_paths or rel in {'tools/verify_rebuild_boundary.py', 'tools/verify.py', '.github/workflows/brain.yml', '.github/workflows/governance.yml'} or rel.startswith('.trae/') or rel.startswith('.vscode/') or rel.startswith('Leyforge-AI-Minimal-Setup-Qwen/') or rel.startswith('tools/ai-orchestration/')
        check(allowed, 'Unadmitted active path: '+rel)
        executable = path.suffix.lower() in {'.gd','.gdshader','.tscn','.tres','.res','.exe','.dll','.pck','.ps1','.bat','.cmd','.py'}
        brain_tool = rel.startswith('brain/92_SCRIPTS/') and path.suffix.lower() == '.py'
        check(not executable or rel in {'tools/verify_rebuild_boundary.py', 'tools/verify.py'} or brain_tool or rel in w0_admitted_paths or rel in r7_admitted_paths or rel in w1_admitted_paths or rel in w2_admitted_paths or rel in w3_admitted_paths or rel.startswith('Leyforge-AI-Minimal-Setup-Qwen/') or rel.startswith('tools/ai-orchestration/'), 'Legacy executable/resource admitted: '+rel)
        if path.suffix.lower() not in {'.md','.json','.txt','.csv','.py'} or rel.endswith('leakage-result.json'):
            continue
        content = path.read_text(encoding='utf-8-sig',errors='replace')
        hits = {name:len(re.findall(pattern,content,re.I)) for name,pattern in patterns.items()}
        hits = {name:count for name,count in hits.items() if count}
        if hits:
            classification = 'current_authority_or_historical_source_citation' if rel in expected_docs else 'historical_archive_evidence' if rel.startswith('docs/rebuild/archive-evidence/') else 'bootstrap_retirement_record_or_boundary_enforcement'
            matches.append(dict(path=rel, classification=classification, categories=hits, runtime_inclusion=False))
check(not (root/'project.godot').exists(), 'Unexpected Godot runtime entry point')
for name in ['addons','assets','content','data','generated','scripts','development','.profiles','.tmp']:
    check(not (root/name).exists(), 'Retired root remains: '+name)
check((root/'tools/verify_rebuild_boundary.py').is_file(), 'Controlled validator missing')
print(json.dumps(dict(status='PASS' if not failures else 'FAIL',checks=checks,failures=failures,source_documents=len(expected_docs),r3_source_documents=len(baseline_docs),post_r3_intake_documents=len(intake_docs),source_intake_manifests=intake_manifests,unchanged_source_documents=len(unchanged),approved_document_updates=manifest['approved_document_updates'],retired_paths=len(manifest['retired_paths']),archived_validation_admitted=[],w0_harness_manifest=w0_manifest_path.relative_to(root).as_posix(),w0_harness_paths=len(w0_admitted_paths),w0_proof_run_ids=w0_manifest.get('allocated_run_ids', []),w0_proof_evidence_ids=w0_manifest.get('allocated_evidence_ids', []),r7_w0_manifest=r7_manifest_path.relative_to(root).as_posix(),r7_w0_paths=len(r7_admitted_paths),r7_w0_proof_run_ids=r7_manifest.get('allocated_run_ids', []),r7_w0_proof_evidence_ids=r7_manifest.get('allocated_evidence_ids', []),r7_w1_manifest=w1_manifest_path.relative_to(root).as_posix(),r7_w1_paths=len(w1_admitted_paths),r7_w1_proof_run_ids=w1_run_ids,r7_w1_proof_evidence_ids=w1_evidence_ids,r7_w2_manifest=w2_manifest_path.relative_to(root).as_posix(),r7_w2_paths=len(w2_admitted_paths),r7_w2_proof_run_ids=w2_run_ids,r7_w2_proof_evidence_ids=w2_evidence_ids,r7_w3_manifest=w3_manifest_path.relative_to(root).as_posix(),r7_w3_paths=len(w3_admitted_paths),r7_w3_proof_run_ids=w3_run_ids,r7_w3_proof_evidence_ids=w3_evidence_ids,active_poc_dependencies=0 if not failures else None,reference_classifications=matches),indent=2))
sys.exit(1 if failures else 0)
