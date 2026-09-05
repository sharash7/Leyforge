"""Capture REBUILD-00 R0/R1 evidence without changing Git or source files.

This is a local working-state capture, not the independent R2 history archive.
Run with Python 3.9+; only standard-library modules are used.
"""

import argparse
import collections
import csv
import datetime
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import zipfile


def digest(data):
    return hashlib.sha256(data).hexdigest()


def git(root, *args):
    return subprocess.check_output(["git", "-C", str(root), *args])


def write_json(path, value):
    path.write_text(json.dumps(value, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")


def checked_child(root, relative):
    path = (root / relative).resolve()
    if os.path.commonpath([str(root), str(path)]) != str(root):
        raise ValueError("Path escapes declared root: " + relative)
    # Imported document filenames can exceed the legacy Windows MAX_PATH limit
    # after the verification prefix is added. Keep the containment check above
    # on ordinary absolute paths, then use the native extended-length form.
    if os.name == "nt" and not str(path).startswith("\\\\?\\"):
        return Path("\\\\?\\" + str(path))
    return path


def disposition(path, status):
    if path.startswith((".trae/", ".vscode/")):
        return "inventory_only_local_agent_or_editor_configuration"
    if re.search(r"(^|/)(\.env(?:\..*)?|credentials[^/]*|id_rsa|id_ed25519)$", path, re.I):
        return "inventory_only_sensitive_filename_review"
    if status == " D":
        return "preserve_deletion_and_original_git_blob"
    if path.startswith(".summer/00_Docs/ARCHIVED/"):
        return "preserve_historical_documentation"
    if path.startswith(".summer/00_Docs/"):
        return "preserve_source_document_authority_requires_register"
    if path.startswith((".profiles/", ".tmp/")) or "/Godot/app_userdata/" in path:
        return "preserve_historical_test_profile"
    if path.endswith((".TMP", ".bak")):
        return "preserve_recovery_supplement_review_before_git_admission"
    if path.startswith(".summer/verification/"):
        return "preserve_verification_source_or_evidence"
    if path.startswith("generated/"):
        return "preserve_generated_poc_products"
    return "preserve_poc_source_or_project_evidence"


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project", required=True)
    parser.add_argument("--capture-root", required=True)
    parser.add_argument("--evidence-root", required=True)
    args = parser.parse_args()
    root = Path(args.project).resolve()
    capture = Path(args.capture_root).resolve()
    evidence = Path(args.evidence_root).resolve()
    for target in (capture, evidence):
        if target == root or os.path.commonpath([str(root), str(target)]) != str(root):
            raise ValueError("Output must be a child of the project workspace")
    if capture.exists():
        raise FileExistsError("Capture roots are immutable; choose a new empty destination")
    evidence.mkdir(parents=True, exist_ok=True)
    capture.mkdir(parents=True)
    (capture / ".gdignore").write_text("", encoding="utf-8")
    replica = capture / "p"
    replica.mkdir()
    excluded_prefix = ".summer/verification/rebuild_00/"
    started = datetime.datetime.now(datetime.timezone.utc).isoformat()
    head = git(root, "rev-parse", "HEAD").decode().strip()
    status_raw = git(root, "status", "--porcelain=v1", "-z", "--untracked-files=all")
    status = {}
    parts = iter(status_raw.decode("utf-8").split("\0"))
    for entry in parts:
        if not entry:
            continue
        code, path = entry[:2], entry[3:]
        if "R" in code or "C" in code:
            raise ValueError("Rename/copy index entries require an explicit preservation plan")
        if not path.startswith(excluded_prefix):
            status[path] = code
    tracked = {}
    for entry in git(root, "ls-files", "--stage", "-z").decode().split("\0"):
        if entry:
            meta, path = entry.split("\t", 1)
            mode, blob, stage = meta.split()
            if stage != "0":
                raise ValueError("Unmerged Git index requires explicit handling")
            tracked[path] = {"mode": mode, "blob": blob}
    untracked = set(filter(None, git(root, "ls-files", "--others", "--exclude-standard", "-z").decode().split("\0")))
    paths = sorted(p for p in set(tracked) | untracked if not p.startswith(excluded_prefix))
    records, scan_findings = [], []
    secret_patterns = [
        ("private_key", re.compile(rb"-----BEGIN (?:RSA |EC |OPENSSH )?PRIVATE KEY-----")),
        ("github_token", re.compile(rb"\bgh[pousr]_[A-Za-z0-9]{30,}\b")),
        ("openai_token", re.compile(rb"\bsk-(?:proj-)?[A-Za-z0-9_-]{40,}\b")),
        ("aws_access_key", re.compile(rb"\bAKIA[A-Z0-9]{16}\b")),
    ]
    with zipfile.ZipFile(capture / "working-state.zip", "x", zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        for relative in paths:
            source = checked_child(root, relative)
            code = status.get(relative, "  ")
            record = {"path": relative, "git_status": code, "tracked": relative in tracked,
                      "git_blob": tracked.get(relative, {}).get("blob"),
                      "disposition": disposition(relative, code), "captured": False}
            if not source.exists():
                record["exists"] = False
                records.append(record)
                continue
            if not source.is_file():
                raise ValueError("Non-file Git path requires explicit treatment: " + relative)
            data = source.read_bytes()
            record.update(exists=True, bytes=len(data), sha256=digest(data))
            is_text = b"\0" not in data[:4096]
            if is_text:
                record["lf_normalized_sha256"] = digest(data.replace(b"\r\n", b"\n"))
                for rule, pattern in secret_patterns:
                    if pattern.search(data):
                        scan_findings.append({"path": relative, "rule": rule, "value": "WITHHELD"})
                        record["disposition"] = "inventory_only_secret_pattern_review"
            if not record["disposition"].startswith("inventory_only"):
                archive.writestr(relative, data)
                dest = checked_child(replica, relative)
                dest.parent.mkdir(parents=True, exist_ok=True)
                dest.write_bytes(data)
                if digest(dest.read_bytes()) != record["sha256"]:
                    raise RuntimeError("Replica hash mismatch: " + relative)
                record["captured"] = True
            records.append(record)
    # Verify the closed archive independently of its write stream.
    by_path = {r["path"]: r for r in records}
    with zipfile.ZipFile(capture / "working-state.zip") as archive:
        if archive.testzip() is not None:
            raise RuntimeError("ZIP CRC verification failed")
        for name in archive.namelist():
            if digest(archive.read(name)) != by_path[name]["sha256"]:
                raise RuntimeError("ZIP SHA-256 verification failed: " + name)
    drift = []
    for record in records:
        source = root / record["path"]
        if record["exists"]:
            if not source.is_file() or digest(source.read_bytes()) != record["sha256"]:
                drift.append(record["path"])
        elif source.exists():
            drift.append(record["path"])
    if git(root, "rev-parse", "HEAD").decode().strip() != head:
        drift.append("GIT_HEAD_CHANGED")
    # Patch bytes are written without shell redirection or newline conversion.
    for name, extra in (("unstaged.patch", []), ("staged.patch", ["--cached"])):
        (capture / name).write_bytes(git(root, "diff", *extra, "--binary", "--full-index", "--", ".", ":(exclude)" + excluded_prefix + "**"))
    (evidence / "initial-git-status.txt").write_text("".join(code + " " + path + "\n" for path, code in sorted(status.items())), encoding="utf-8")
    write_json(evidence / "file-inventory.json", records)
    with (evidence / "file-inventory.csv").open("w", newline="", encoding="utf-8") as handle:
        columns = ["path", "git_status", "tracked", "exists", "bytes", "sha256", "git_blob", "disposition", "captured"]
        writer = csv.DictWriter(handle, fieldnames=columns, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(records)
    remotes = []
    for name in git(root, "remote").decode().splitlines():
        url = git(root, "remote", "get-url", name).decode().strip()
        url = re.sub(r"(https?://)[^/@]+@", r"\1[redacted]@", url)
        url = url.split("?", 1)[0]
        remotes.append({"name": name, "url": url, "live_remote_verification": "not_performed"})
    archive_path = capture / "working-state.zip"
    manifest = {
        "record": "REBUILD-00-R0-R1-20260905", "started_at_utc": started,
        "finished_at_utc": datetime.datetime.now(datetime.timezone.utc).isoformat(),
        "repository": str(root), "branch": git(root, "branch", "--show-current").decode().strip(),
        "head": head, "commit": git(root, "log", "-1", "--format=%aI%n%s").decode().strip().splitlines(),
        "remotes": remotes, "local_branches": git(root, "branch", "--format=%(refname:short)").decode().splitlines(),
        "local_tags": git(root, "tag", "--list").decode().splitlines(),
        "shallow": git(root, "rev-parse", "--is-shallow-repository").decode().strip() == "true",
        "tracked_paths": len(tracked), "initial_status_counts": dict(collections.Counter(status.values())),
        "files_in_inventory": len(records), "captured_files": sum(r["captured"] for r in records),
        "captured_bytes": sum(r.get("bytes", 0) for r in records if r["captured"]),
        "inventory_only": [r["path"] for r in records if r["exists"] and not r["captured"]],
        "deleted_tracked_paths": [r["path"] for r in records if not r["exists"]],
        "working_state_archive": {"path": str(archive_path), "sha256": digest(archive_path.read_bytes()),
                                  "bytes": archive_path.stat().st_size, "crc_and_all_entry_sha256": "PASS"},
        "verification_project": str(replica), "source_drift_during_capture": drift,
        "secret_pattern_scan": {"scope": "present Git-visible text files; high-confidence patterns only, not exhaustive", "findings": scan_findings},
        "git_mutations": [], "r2_archive_verified": False,
        "limitation": "Local working-state capture only. No complete Git history, remote reference, independent cold backup, or final commit is asserted.",
        "excluded_from_capture": [excluded_prefix, ".git/", "ignored files (separate inventory/supplement required)"],
    }
    write_json(evidence / "baseline.json", manifest)
    print(json.dumps({k: manifest[k] for k in ("head", "initial_status_counts", "files_in_inventory", "captured_files", "captured_bytes", "inventory_only", "source_drift_during_capture", "secret_pattern_scan", "verification_project")}, indent=2))
    if drift:
        raise RuntimeError("Source drift requires a new capture before claiming an exact baseline")


if __name__ == "__main__":
    main()
