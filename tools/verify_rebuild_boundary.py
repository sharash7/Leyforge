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
    allowed = rel in root_files or rel == '.summer/AGENTS.md' or rel in expected_docs or rel.startswith(('docs/rebuild/','brain/')) or rel in {'tools/verify_rebuild_boundary.py', 'tools/verify.py', '.github/workflows/brain.yml', '.github/workflows/governance.yml'}
    check(allowed, 'Unadmitted active path: '+rel)
    executable = path.suffix.lower() in {'.gd','.gdshader','.tscn','.tres','.res','.exe','.dll','.pck','.ps1','.bat','.cmd','.py'}
    brain_tool = rel.startswith('brain/92_SCRIPTS/') and path.suffix.lower() == '.py'
    check(not executable or rel in {'tools/verify_rebuild_boundary.py', 'tools/verify.py'} or brain_tool, 'Legacy executable/resource admitted: '+rel)
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
print(json.dumps(dict(status='PASS' if not failures else 'FAIL',checks=checks,failures=failures,source_documents=len(expected_docs),r3_source_documents=len(baseline_docs),post_r3_intake_documents=len(intake_docs),source_intake_manifests=intake_manifests,unchanged_source_documents=len(unchanged),approved_document_updates=manifest['approved_document_updates'],retired_paths=len(manifest['retired_paths']),archived_validation_admitted=[],active_poc_dependencies=0 if not failures else None,reference_classifications=matches),indent=2))
sys.exit(1 if failures else 0)
