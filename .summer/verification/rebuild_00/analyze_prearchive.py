"""Read-only source reconciliation and local recovery supplement for REBUILD-00."""

import collections
import hashlib
import json
import os
from pathlib import Path
import re
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[3]
EVIDENCE = Path(__file__).resolve().parent / "2026-09-05"
CAPTURE = ROOT / ".local/r01-20260905"


def native(path):
    if os.name == "nt" and not str(path).startswith("\\\\?\\"):
        return Path("\\\\?\\" + str(path))
    return path


def sha(path):
    return hashlib.sha256(native(path).read_bytes()).hexdigest()


def git(*args):
    return subprocess.check_output(["git", "-C", str(ROOT), *args])


def write(name, value):
    (EVIDENCE / name).write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def main():
    inventory = json.loads((EVIDENCE / "file-inventory.json").read_text(encoding="utf-8"))
    normalized = collections.defaultdict(list)
    for record in inventory:
        if record.get("lf_normalized_sha256"):
            normalized[record["lf_normalized_sha256"]].append(record["path"])
    deleted = []
    for record in inventory:
        if not record["exists"]:
            original = git("cat-file", "blob", record["git_blob"])
            match = hashlib.sha256(original.replace(b"\r\n", b"\n")).hexdigest()
            deleted.append({"deleted_path": record["path"], "original_git_blob": record["git_blob"],
                            "matching_current_paths_ignoring_crlf": normalized.get(match, []),
                            "original_bytes": len(original)})
    write("deleted-document-reconciliation.json", deleted)
    docs = ROOT / ".summer/00_Docs"
    checks = []
    for family in ("A-BRAIN", "PRD", "C-AUDIT"):
        sums = docs / family / "SHA256SUMS.txt"
        if not sums.exists():
            continue
        for line in sums.read_text(encoding="utf-8-sig").splitlines():
            found = re.match(r"([0-9a-fA-F]{64})\s+\*?(.+)", line)
            if found:
                expected, name = found.groups()
                path = sums.parent / name
                actual = sha(path) if path.is_file() else None
                checks.append({"family": family, "path": path.relative_to(ROOT).as_posix(),
                               "expected": expected.lower(), "actual": actual, "pass": actual == expected.lower()})
    gov = docs / "B-ENG-GOV+B-OPS"
    manifest = gov / "B-OPS/Leyforge_Branch_B_Engineering_Governance_Baseline_v1.0_MANIFEST.md"
    for doc_id, expected in re.findall(r"\| ((?:ENG-GOV|B-OPS)-\d+) \|[^\n]*?`([0-9a-f]{64})`", manifest.read_text(encoding="utf-8")):
        matches = list(gov.rglob(doc_id + "_*.md"))
        if len(matches) != 1:
            raise RuntimeError("Ambiguous certified source: " + doc_id)
        actual = sha(matches[0])
        checks.append({"family": "B-ENG-GOV+B-OPS", "path": matches[0].relative_to(ROOT).as_posix(),
                       "expected": expected, "actual": actual, "pass": actual == expected})
    write("source-bundle-integrity.json", checks)
    # Copy only deliberately selected ignored recovery material. Nothing is
    # admitted to normal Git or the future active rebuild by this operation.
    selected = [ROOT / "build/Leyforge.exe", ROOT / "build/Leyforge.pck"]
    selected += list((ROOT / ".local/Godot_v4.8-dev-a9c94-shutdown-fixed").iterdir())
    selected += list((ROOT / ".local/diagnostics/godot-shutdown-019fbb51").glob("*.patch"))
    for area in (".verification/stageb-live-profile", ".verification/stageb-final-profile",
                 ".local/diagnostics/godot-shutdown-019fbb51/profile-enforced-default-20260806"):
        selected += [Path(str(p).removeprefix("\\\\?\\")) for p in native(ROOT / area).rglob("*") if p.is_file()]
    for area in ("content/forge", "generated/forge"):
        selected += list((ROOT / area).rglob("*.previous.bak"))
    supplements = []
    for source in selected:
        if not source.is_file():
            continue
        relative = source.relative_to(ROOT).as_posix()
        dest = CAPTURE / "supplements/workspace" / relative
        native(dest.parent).mkdir(parents=True, exist_ok=True)
        before = sha(source)
        if dest.exists() and sha(dest) != before:
            raise FileExistsError("Refusing to replace differing prior supplement: " + str(dest))
        if not dest.exists():
            shutil.copyfile(native(source), native(dest))
        if sha(source) != before or sha(dest) != before:
            raise RuntimeError("Supplement copy/source hash changed: " + relative)
        supplements.append({"source": relative, "copy": str(dest), "bytes": source.stat().st_size,
                            "sha256": before, "copy_verified": True,
                            "execution": "not_executed"})
    write("workspace-supplements.json", supplements)
    # Bound this enumeration to named ignored areas and never follow junctions.
    ignored = []
    for area in (".godot", ".local", ".verification", ".summer/local", "build", "SummerEngine"):
        base = native(ROOT / area)
        buckets = collections.defaultdict(lambda: {"files": 0, "bytes": 0})
        for current, dirs, files in os.walk(base, followlinks=False):
            dirs[:] = [d for d in dirs if not (Path(current) / d).is_symlink()
                       and not (area == ".local" and Path(current) == base and d in ("r01-20260905", "rebuild-r01-20260905"))]
            for name in files:
                path = Path(current) / name
                relative = path.relative_to(base)
                bucket = relative.parts[0] if len(relative.parts) > 1 else "(root files)"
                try:
                    size = path.stat().st_size
                    buckets[bucket]["files"] += 1
                    buckets[bucket]["bytes"] += size
                except OSError:
                    buckets[bucket]["unreadable_files"] = buckets[bucket].get("unreadable_files", 0) + 1
        ignored += [{"area": area, "group": name, **values} for name, values in sorted(buckets.items())]
    write("ignored-area-inventory.json", ignored)
    registries = []
    for path in sorted((ROOT / "data").rglob("*.json")):
        data = json.loads(path.read_text(encoding="utf-8-sig"))
        record = {"path": path.relative_to(ROOT).as_posix(), "sha256": sha(path)}
        if isinstance(data, dict):
            record["version_fields"] = {k: v for k, v in data.items() if "version" in k and isinstance(v, (str, int, float))}
            record["collection_counts"] = {k: len(v) for k, v in data.items() if isinstance(v, (list, dict))}
        else:
            record["records"] = len(data)
        registries.append(record)
    write("registry-snapshots.json", registries)
    print(json.dumps({"deleted_paths": len(deleted), "with_current_content_match": sum(bool(r["matching_current_paths_ignoring_crlf"]) for r in deleted),
                      "bundle_checks": len(checks), "bundle_mismatches": [r["path"] for r in checks if not r["pass"]],
                      "supplements": len(supplements), "ignored_groups": len(ignored), "registries": len(registries)}, indent=2))


if __name__ == "__main__":
    main()
