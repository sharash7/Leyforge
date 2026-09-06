"""Read-only clean-rebuild boundary validation; Python standard library only."""
import hashlib
import json
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
    'tools/tests/test_r7_w0_runtime.py', 'tools/verify.py', 'tools/verify_rebuild_boundary.py',
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
for path in sorted(root.rglob('*')):
    rel = path.relative_to(root).as_posix()
    if rel.startswith(('.git/','.local/','__pycache__/')) or '__pycache__' in path.parts:
        continue
    if path.is_dir():
        continue
    check(not path.is_symlink(), 'Unexpected filesystem link: '+rel)
    allowed = rel in root_files or rel == '.summer/AGENTS.md' or rel in expected_docs or rel.startswith(('docs/rebuild/','brain/')) or rel in w0_admitted_paths or rel in r7_admitted_paths or rel in {'tools/verify_rebuild_boundary.py', 'tools/verify.py', '.github/workflows/brain.yml', '.github/workflows/governance.yml'}
    check(allowed, 'Unadmitted active path: '+rel)
    executable = path.suffix.lower() in {'.gd','.gdshader','.tscn','.tres','.res','.exe','.dll','.pck','.ps1','.bat','.cmd','.py'}
    brain_tool = rel.startswith('brain/92_SCRIPTS/') and path.suffix.lower() == '.py'
    check(not executable or rel in {'tools/verify_rebuild_boundary.py', 'tools/verify.py'} or brain_tool or rel in w0_admitted_paths or rel in r7_admitted_paths, 'Legacy executable/resource admitted: '+rel)
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
print(json.dumps(dict(status='PASS' if not failures else 'FAIL',checks=checks,failures=failures,source_documents=len(expected_docs),r3_source_documents=len(baseline_docs),post_r3_intake_documents=len(intake_docs),source_intake_manifests=intake_manifests,unchanged_source_documents=len(unchanged),approved_document_updates=manifest['approved_document_updates'],retired_paths=len(manifest['retired_paths']),archived_validation_admitted=[],w0_harness_manifest=w0_manifest_path.relative_to(root).as_posix(),w0_harness_paths=len(w0_admitted_paths),w0_proof_run_ids=w0_manifest.get('allocated_run_ids', []),w0_proof_evidence_ids=w0_manifest.get('allocated_evidence_ids', []),r7_w0_manifest=r7_manifest_path.relative_to(root).as_posix(),r7_w0_paths=len(r7_admitted_paths),r7_w0_proof_run_ids=r7_manifest.get('allocated_run_ids', []),r7_w0_proof_evidence_ids=r7_manifest.get('allocated_evidence_ids', []),active_poc_dependencies=0 if not failures else None,reference_classifications=matches),indent=2))
sys.exit(1 if failures else 0)
