"""Create and verify the R2 non-Git recovery payload; never alter sources."""
import hashlib
import json
import shutil
import zipfile
from pathlib import Path

project = Path(r'D:\AI\Projects\leyforge')
capture = project / '.local/r01-20260905'
archive = Path(r'D:\AI\Archives\Leyforge\legacy-poc-2026-09-05')
payload = archive / 'preservation'
payload.mkdir(parents=True, exist_ok=True)

def sha(path):
    h = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            h.update(block)
    return h.hexdigest()

records = []
for source in sorted(capture.iterdir()):
    if not source.is_file() or source.name == '.gdignore':
        continue
    target = payload / source.name
    if target.exists():
        raise RuntimeError(f'Refusing overwrite: {target}')
    original = sha(source)
    shutil.copy2(source, target)
    assert sha(target) == original == sha(source), source
    records.append(dict(path=target.relative_to(archive).as_posix(), bytes=target.stat().st_size, sha256=original))

supplements = capture / 'supplements'
entries = []
target = payload / 'supplements.zip'
with zipfile.ZipFile(target, 'x', zipfile.ZIP_DEFLATED, compresslevel=3) as z:
    for source in sorted(supplements.rglob('*')):
        if not source.is_file():
            continue
        relative = source.relative_to(supplements).as_posix()
        digest = sha(source)
        z.write(source, relative)
        assert sha(source) == digest, source
        entries.append(dict(path=relative, bytes=source.stat().st_size, sha256=digest))
with zipfile.ZipFile(target) as z:
    assert z.testzip() is None
    for entry in entries:
        assert hashlib.sha256(z.read(entry['path'])).hexdigest() == entry['sha256'], entry['path']

# Reconcile every previously captured player/toolchain file with R1 evidence.
entry_map = {e['path']: e for e in entries}
player = json.loads((project / '.summer/verification/rebuild_00/2026-09-05/player-state-inventory.json').read_text(encoding='utf-8-sig'))
for item in player['files']:
    if item['captured']:
        key = 'player-state/' + item['path'].replace('\\', '/')
        assert entry_map[key]['sha256'] == item['source_sha256'], key
workspace = json.loads((project / '.summer/verification/rebuild_00/2026-09-05/workspace-supplements.json').read_text(encoding='utf-8-sig'))
for item in workspace:
    key = 'workspace/' + item['source'].replace('\\', '/')
    assert entry_map[key]['sha256'] == item['sha256'], key
records.append(dict(path=target.relative_to(archive).as_posix(), bytes=target.stat().st_size, sha256=sha(target)))
bundle = archive / 'leyforge-history.bundle'
records.append(dict(path=bundle.name, bytes=bundle.stat().st_size, sha256=sha(bundle)))
manifest = dict(final_poc_sha='799305859bb0ba4230ef87d934e961cc21220afa', tag='legacy-poc-2026-09-05', files=records, supplement_entries=entries, note='Original byte-preserving captures; local only, includes player state. Git text checkout uses LF; original R1 SHA256SUMS records working-copy bytes.')
(archive / 'recovery-manifest.json').write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')
records.append(dict(path='recovery-manifest.json', sha256=sha(archive / 'recovery-manifest.json')))
(archive / 'SHA256SUMS.txt').write_text(''.join(e['sha256'] + '  ' + e['path'] + '\n' for e in records), encoding='utf-8')
print(json.dumps(dict(payload_files=len(records), supplement_entries=len(entries), total_bytes=sum(e.get('bytes', 0) for e in records), bundle_sha256=sha(bundle))))
