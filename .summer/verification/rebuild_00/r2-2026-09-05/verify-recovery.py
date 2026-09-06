"""Cold recovery from the independent archive, with no live project fixtures."""
import hashlib
import json
import subprocess
import sys
import zipfile
from datetime import datetime, timezone
from pathlib import Path

archive = Path(r'D:\AI\Archives\Leyforge\legacy-poc-2026-09-05')
restore = Path(r'D:\AI\Archives\Leyforge\restore-test-20260905')
evidence = archive / 'verification'
evidence.mkdir(exist_ok=True)
expected = '799305859bb0ba4230ef87d934e961cc21220afa'
expected_tree = 'e78d6567ed38986fe06bd090420461d2509ba605'

def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

def run(name, args, cwd=None):
    result = subprocess.run(args, cwd=cwd, capture_output=True, encoding='utf-8', errors='replace')
    (evidence / (name + '.log')).write_text(result.stdout + result.stderr, encoding='utf-8')
    if result.returncode != 0:
        raise RuntimeError(f'{name} failed ({result.returncode}); inspect {evidence / (name + ".log")}')
    return result.stdout.strip()

resume = '--resume' in sys.argv
if restore.exists() and not resume:
    raise RuntimeError('Restore target already exists; inspect before reuse')
for line in (archive / 'SHA256SUMS.txt').read_text().splitlines():
    digest, relative = line.split('  ', 1)
    assert sha(archive / relative) == digest, relative
manifest = json.loads((archive / 'recovery-manifest.json').read_text())
with zipfile.ZipFile(archive / 'preservation/working-state.zip') as z:
    assert z.testzip() is None
    source_entries = len(z.infolist())
if not resume:
    run('clone', ['git', 'clone', '--quiet', '--no-checkout', str(archive / 'leyforge-history.bundle'), str(restore / 'project')])
project = restore / 'project'
if resume:
    assert run('resume-head', ['git', 'rev-parse', 'HEAD'], project) == expected
    initial = evidence / 'tracked-diff.log'
    if initial.exists() and not (evidence / 'tracked-diff-before-longpaths.log').exists():
        (evidence / 'tracked-diff-before-longpaths.log').write_bytes(initial.read_bytes())
run('longpaths-config', ['git', 'config', '--local', 'core.longpaths', 'true'], project)
run('bundle-verify', ['git', 'bundle', 'verify', str(archive / 'leyforge-history.bundle')], project)
run('checkout', ['git', '-c', 'core.longpaths=true', 'checkout', '--quiet', '--detach', 'legacy-poc-2026-09-05'], project)
assert run('head', ['git', 'rev-parse', 'HEAD'], project) == expected
assert run('tree', ['git', 'rev-parse', 'HEAD^{tree}'], project) == expected_tree
assert run('tag-type', ['git', 'cat-file', '-t', 'refs/tags/legacy-poc-2026-09-05'], project) == 'tag'
run('fsck', ['git', 'fsck', '--full'], project)
assert not (project / '.git/objects/info/alternates').exists()
run('tracked-diff', ['git', 'diff', '--exit-code', 'HEAD'], project)
representatives = ['project.godot', 'scripts/main.gd', 'scripts/autoload/world_manager.gd', '.summer/verification/phase4_save_probe.gd', '.summer/verification/rebuild_00/ASSESSMENT.md', '.summer/00_Docs/Additional/REBUILD-00_Leyforge_Legacy_POC_Archive_Clean_Rebuild_and_Brain_Governance_Bootstrap_Handoff_v0.1.md']
for relative in representatives:
    assert (project / relative).is_file(), relative
checks = []
for name in ['poc_archive_isolation_probe', 'canonical_block_inventory_projection_probe']:
    output = run(name, ['powershell', '-NoProfile', '-ExecutionPolicy', 'Bypass', '-File', str(project / '.summer/verification' / (name + '.ps1')), '-ProjectPath', str(project)], project)
    checks.append(dict(name=name, exit_code=0, output=output))

supplement_root = restore / 'supplements'
with zipfile.ZipFile(archive / 'preservation/supplements.zip') as z:
    assert z.testzip() is None
    for entry in manifest['supplement_entries']:
        target = (supplement_root / entry['path']).resolve()
        assert supplement_root.resolve() in target.parents
        target.parent.mkdir(parents=True, exist_ok=True)
        target.write_bytes(z.read(entry['path']))
        assert sha(target) == entry['sha256'], entry['path']
run('summer-bundle-verify', ['git', 'bundle', 'verify', str(supplement_root / 'summer-local-history.bundle')], project)
assert run('final-status', ['git', 'status', '--porcelain', '--untracked-files=all'], project) == ''
record = dict(status='PASS', verified_at=datetime.now(timezone.utc).isoformat(), archive=str(archive), restore=str(restore), final_poc_sha=expected, tree=expected_tree, tag='legacy-poc-2026-09-05', bundle_sha256=sha(archive / 'leyforge-history.bundle'), bundle_complete=True, git_fsck_exit=0, original_zip_entries=source_entries, recovered_supplements=len(manifest['supplement_entries']), representative_files=representatives, checks=checks, clean_restored_worktree=True, validation_scope='Cold bundle clone, exact commit/tree, complete Git object integrity, original ZIP CRC, all supplemental SHA256 values, and two lightweight repository gates. No historical executable or Godot process launched. Prior runtime results remain 48 pass / 10 fail.', remote_status='BLOCKED_PENDING_EXPLICIT_PUBLICATION_AND_PROTECTION_APPROVAL', storage_limitation='Outside active working copy on the same D: drive; not an off-device backup.')
(evidence / 'recovery-result.json').write_text(json.dumps(record, indent=2) + '\n', encoding='utf-8')
print(json.dumps({key: record[key] for key in ['status', 'final_poc_sha', 'original_zip_entries', 'recovered_supplements', 'clean_restored_worktree']}))
