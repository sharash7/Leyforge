#!/usr/bin/env python3
"""Independent standard-library audit for the governed R7 W4 execution boundary."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
from pathlib import Path
from typing import Any, Dict, Iterable, Mapping, Sequence


ROOT = Path(__file__).resolve().parents[1]
SOURCE_BOUNDARY = ROOT / "docs/rebuild/r7/w4-governed-execution-source-boundary.json"
EXECUTION_ADMISSION = ROOT / "docs/rebuild/r7/w4-governed-execution-admission.json"
STATE = ROOT / "docs/rebuild/r7/w4-execution-state.json"
READINESS = ROOT / "docs/rebuild/r7/w4-readiness.json"
READINESS_ADMISSION = ROOT / "docs/rebuild/r7/w4-readiness-admission-boundary.json"
EVIDENCE_ROOT = ROOT / "docs/rebuild/r7/execution-evidence"
PACKAGE = "R7-W4-FORGE-TRUST-PRESENTATION-MIGRATION-GOVERNED-EXECUTION"
READINESS_COMMIT = "26548f7561974239b8996c473f25644d61f099fa"
ROSTER = tuple("PRD04-PROOF-{0:02d}".format(number) for number in (49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 71))
RUNS = tuple("PRD07-RUN-{0:04d}".format(number) for number in range(66, 81))
EVIDENCE = tuple("PRD07-EVID-{0:04d}".format(number) for number in range(66, 81))
TERMINAL = {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"}
SOURCE_FIXED = {
    "tools/tests/test_r7_w4_execution.py",
    "tools/tests/test_r7_w4_runtime.py",
    "tools/r7_w4_execution_audit.py",
    "tools/verify.py",
    "tools/verify_rebuild_boundary.py",
}
SOURCE_PREFIXES = ("tools/r7_w4_execution/", "proofs/r7/w4_execution/")
PROTECTED = {
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


class Audit:
    def __init__(self) -> None:
        self.checks = 0
        self.failures: list[str] = []

    def check(self, condition: bool, message: str) -> None:
        self.checks += 1
        if not condition:
            self.failures.append(message)


def _load(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError(path.as_posix() + " must contain a JSON object")
    return value


def _canonical(path: Path) -> bytes:
    return path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")


def _sha(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _canonical_sha(path: Path) -> str:
    return hashlib.sha256(_canonical(path)).hexdigest()


def _git(*args: str, binary: bool = False) -> Any:
    result = subprocess.run(["git", *args], cwd=ROOT, capture_output=True, text=not binary)
    if result.returncode:
        error = result.stderr if isinstance(result.stderr, str) else result.stderr.decode("utf-8", errors="replace")
        raise RuntimeError(error.strip() or "git command failed")
    return result.stdout if binary else result.stdout.strip()


def _source_paths() -> list[str]:
    paths = set(SOURCE_FIXED)
    for prefix in SOURCE_PREFIXES:
        base = ROOT / prefix
        if base.is_dir():
            for path in base.rglob("*"):
                if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() not in {".pyc", ".exe", ".dll", ".pck", ".res", ".tres"}:
                    paths.add(path.relative_to(ROOT).as_posix())
    return sorted(paths)


def _identity_rows(state: str) -> list[dict[str, Any]]:
    return [
        {"order": index + 1, "proof_id": proof, "run_id": run, "evidence_id": evidence, "state": state}
        for index, (proof, run, evidence) in enumerate(zip(ROSTER, RUNS, EVIDENCE))
    ]


def audit_source(source_revision: str, *, require_unallocated: bool, check_protected: bool) -> Dict[str, Any]:
    audit = Audit()
    audit.check(SOURCE_BOUNDARY.is_file(), "governed W4 execution source boundary is missing")
    if not SOURCE_BOUNDARY.is_file():
        return {"status": "FAIL", "phase": "source", "checks": audit.checks, "failures": audit.failures}
    boundary = _load(SOURCE_BOUNDARY)
    implementation = str(boundary.get("implementation_commit", ""))
    audit.check(boundary.get("schema_version") == "prd07-w4-governed-execution-source-boundary-v1", "source-boundary schema differs")
    audit.check(boundary.get("manifest_version") == 1, "source-boundary manifest version differs")
    audit.check(boundary.get("package") == PACKAGE, "source-boundary package differs")
    audit.check(boundary.get("lifecycle_role") == "CURRENT-PRE-EXECUTION-SOURCE-ADMISSION", "source-boundary lifecycle role differs")
    audit.check(boundary.get("scope") == "development-only-prd07-proof-execution-runtime", "source-boundary scope differs")
    audit.check(boundary.get("status") == "PASS" and boundary.get("issues") == [], "source-boundary status is not clean PASS")
    audit.check(boundary.get("readiness_package_commit") == READINESS_COMMIT, "source-boundary readiness commit differs")
    audit.check(boundary.get("proof_roster") == list(ROSTER), "source-boundary proof roster/order differs")
    audit.check(boundary.get("identity_order") == _identity_rows("AUTHORIZED-JIT-NOT-ALLOCATED"), "source-boundary identity order differs")
    audit.check(boundary.get("proof_execution") == "NOT-STARTED", "source-boundary claims proof execution")
    audit.check(boundary.get("allocated_run_ids") == [] and boundary.get("allocated_evidence_ids") == [], "source-boundary allocated identities")
    audit.check(boundary.get("execution_gate") == "CLOSED-PENDING-EXACT-SHA-CI-AND-GOVERNED-EXECUTION-ADMISSION", "source-boundary execution gate differs")
    audit.check(boundary.get("fcc13e", {}).get("coverage_rule") == "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER", "source-boundary FCC-13E rule differs")
    audit.check(boundary.get("fcc13e", {}).get("proofs") == ["PRD04-PROOF-57", "PRD04-PROOF-58"], "source-boundary FCC-13E proofs differ")
    audit.check(boundary.get("gameplay_permission") == "CLOSED" and boundary.get("production_runtime") == "ABSENT", "source boundary crossed gameplay/production")
    audit.check(all(boundary.get(name) == "CLOSED" for name in ("w5", "r7_final", "prd08", "prd09", "r8")), "source boundary opened a later programme gate")
    audit.check(re.fullmatch(r"[0-9a-f]{40}", source_revision) is not None, "source revision is not exact")
    audit.check(re.fullmatch(r"[0-9a-f]{40}", implementation) is not None, "source implementation commit is not exact")
    try:
        audit.check(_git("rev-parse", "HEAD") == source_revision, "source revision does not equal HEAD")
        ancestor = subprocess.run(["git", "merge-base", "--is-ancestor", implementation, source_revision], cwd=ROOT).returncode == 0
        audit.check(ancestor, "source implementation is not an ancestor of HEAD")
        readiness_ancestor = subprocess.run(["git", "merge-base", "--is-ancestor", READINESS_COMMIT, source_revision], cwd=ROOT).returncode == 0
        audit.check(readiness_ancestor, "readiness package is not an ancestor of HEAD")
    except RuntimeError as exc:
        audit.check(False, str(exc))
    artifacts = boundary.get("artifacts", [])
    rows = artifacts if isinstance(artifacts, list) else []
    paths = [str(row.get("path", "")) for row in rows if isinstance(row, dict)]
    audit.check(len(rows) == len(paths) and paths == _source_paths(), "source-boundary artifact path set differs")
    for row in rows:
        if not isinstance(row, dict):
            audit.check(False, "source-boundary contains a non-object artifact")
            continue
        relative = str(row.get("path", ""))
        path = ROOT / relative
        allowed = relative in SOURCE_FIXED or relative.startswith(SOURCE_PREFIXES)
        audit.check(allowed and not Path(relative).is_absolute() and ".." not in Path(relative).parts, "unsafe or over-broad source path: " + relative)
        audit.check(path.is_file(), "source-boundary artifact is missing: " + relative)
        if not path.is_file():
            continue
        data = _canonical(path)
        audit.check(len(data) == row.get("bytes") and hashlib.sha256(data).hexdigest() == row.get("sha256"), "source-boundary content identity differs: " + relative)
        try:
            current_blob = _git("hash-object", "--", relative)
            implementation_blob = _git("rev-parse", implementation + ":" + relative)
            audit.check(current_blob == row.get("git_blob") == implementation_blob, "source-boundary Git identity differs: " + relative)
        except RuntimeError:
            audit.check(False, "source-boundary Git identity cannot be resolved: " + relative)
    audit.check("tools/r7_w4_execution_audit.py" in paths, "independent audit is not source-admitted")
    for path, label in ((READINESS, "readiness"), (READINESS_ADMISSION, "readiness admission")):
        audit.check(path.is_file(), label + " is missing")
        if path.is_file():
            record = boundary.get("readiness_artifacts", {}).get("readiness" if path == READINESS else "admission", {})
            audit.check(record.get("sha256") == _canonical_sha(path), label + " hash differs from source boundary")
    if READINESS.is_file():
        readiness = _load(READINESS)
        audit.check(readiness.get("status") == "PASS" and readiness.get("readiness_counts") == {"READY": 15, "BLOCKED": 0, "NOT APPLICABLE": 0}, "certified readiness is not 15/15 PASS")
        audit.check(readiness.get("proof_execution") == "NOT-STARTED" and readiness.get("allocated_run_ids") == [] and readiness.get("allocated_evidence_ids") == [], "certified readiness timepoint changed")
        expected_w3 = readiness.get("registry_before_and_after_readiness", {}).get("w3_state_sha256")
        w3 = ROOT / "docs/rebuild/r7/w3-execution-state.json"
        audit.check(w3.is_file() and _sha(w3) == expected_w3, "immutable W3 execution state changed")
    if require_unallocated:
        audit.check(not STATE.exists(), "W4 execution state exists before allocation")
        issued = [path.name for path in EVIDENCE_ROOT.glob("PRD07-RUN-*") if path.is_dir() and path.name >= "PRD07-RUN-0066"]
        audit.check(issued == [], "0066+ retained evidence exists before allocation")
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        audit.check(not (ROOT / relative).exists(), "root production boundary exists: " + relative)
    if check_protected:
        for relative, (expected_bytes, expected_sha) in PROTECTED.items():
            path = ROOT / relative
            audit.check(path.is_file() and path.stat().st_size == expected_bytes and _sha(path) == expected_sha, "protected user-local path changed: " + relative)
    return {
        "status": "PASS" if not audit.failures else "FAIL",
        "phase": "source",
        "checks": audit.checks,
        "source_revision": source_revision,
        "implementation_commit": implementation,
        "artifacts": len(rows),
        "proof_execution": "NOT-STARTED" if require_unallocated else "LIFECYCLE-AWARE",
        "failures": sorted(set(audit.failures)),
    }


def _raw_artifact_issues(root: Path, rows: Iterable[Mapping[str, Any]]) -> list[str]:
    failures = []
    for row in rows:
        relative = str(row.get("path", ""))
        path = root / relative
        if not path.is_file() or path.stat().st_size != row.get("bytes") or _sha(path) != row.get("sha256"):
            failures.append("retained raw artifact differs: " + root.name + "/" + relative)
    return failures


def audit_terminal(source_revision: str, *, check_protected: bool) -> Dict[str, Any]:
    source = audit_source(source_revision, require_unallocated=False, check_protected=check_protected)
    audit = Audit()
    audit.check(source.get("status") == "PASS", "source-boundary audit failed during terminal audit")
    audit.check(EXECUTION_ADMISSION.is_file(), "governed execution admission is missing")
    audit.check(STATE.is_file(), "W4 execution state is missing")
    if not STATE.is_file():
        return {"status": "FAIL", "phase": "terminal", "checks": audit.checks + int(source.get("checks", 0)), "failures": sorted(set(audit.failures + list(source.get("failures", []))))}
    state = _load(STATE)
    audit.check(state.get("schema_version") == "prd07-w4-execution-state-v1", "execution-state schema differs")
    audit.check(state.get("package") == PACKAGE, "execution-state package differs")
    audit.check(state.get("allocated_run_ids") == list(RUNS), "terminal RUN order differs")
    audit.check(state.get("allocated_evidence_ids") == list(EVIDENCE), "terminal EVID order differs")
    proofs = state.get("proofs", [])
    proof_rows = proofs if isinstance(proofs, list) else []
    audit.check([row.get("proof_id") for row in proof_rows if isinstance(row, dict)] == list(ROSTER), "terminal proof order differs")
    audit.check(len(proof_rows) == 15 and all(isinstance(row, dict) and row.get("state") in TERMINAL for row in proof_rows), "terminal proof set is incomplete or nonterminal")
    audit.check(state.get("package_state") in {"W4-EXECUTION-COMPLETE", "W4-EXECUTION-COMPLETE-NONPASS-RETAINED"}, "terminal package state differs")
    proof_by_id = {str(row.get("proof_id")): row for row in proof_rows if isinstance(row, dict)}
    fcc: dict[str, list[dict[str, Any]]] = {}
    packs = []
    for proof_id, run_id, evidence_id in zip(ROSTER, RUNS, EVIDENCE):
        pack = EVIDENCE_ROOT / run_id
        required = ("run.json", "standard-evidence.json", "build-manifest.json", "artifact-manifest.json", "observed-result.json", "summary.md")
        audit.check(pack.is_dir() and all((pack / name).is_file() for name in required), "retained pack is incomplete: " + run_id)
        if not pack.is_dir() or not all((pack / name).is_file() for name in required):
            continue
        run = _load(pack / "run.json")
        standard = _load(pack / "standard-evidence.json")
        observed = _load(pack / "observed-result.json")
        expected_state = proof_by_id.get(proof_id, {}).get("state")
        audit.check(run.get("run_id") == run_id and run.get("evidence_id") == evidence_id and run.get("proof_id") == proof_id, "portable run identity differs: " + run_id)
        audit.check(standard.get("run_id") == run_id and standard.get("evidence_id") == evidence_id and standard.get("proof_id") == proof_id, "standard evidence identity differs: " + run_id)
        audit.check(run.get("outcome") == standard.get("observation", {}).get("state") == observed.get("outcome") == expected_state, "retained disposition differs: " + run_id)
        audit.check(run.get("source_revision") == standard.get("source_revision") == state.get("source_revision"), "retained source revision differs: " + run_id)
        audit.check(_sha(pack / "standard-evidence.json") == run.get("evidence_sha256"), "standard evidence hash differs: " + run_id)
        lifecycle = standard.get("lifecycle", {})
        audit.check(lifecycle.get("allocated_before_execution") is True and lifecycle.get("identity_retained") is True and lifecycle.get("prd08_submission") == "NOT-SUBMITTED", "evidence lifecycle differs: " + run_id)
        raw = standard.get("observation", {}).get("raw_artifacts", [])
        raw_rows = raw if isinstance(raw, list) else []
        for failure in _raw_artifact_issues(pack, [row for row in raw_rows if isinstance(row, dict)]):
            audit.check(False, failure)
        if proof_id in {"PRD04-PROOF-57", "PRD04-PROOF-58"}:
            rows = standard.get("observation", {}).get("fcc13e_rows", [])
            fcc[proof_id] = rows if isinstance(rows, list) else []
        packs.append({"proof_id": proof_id, "run_id": run_id, "evidence_id": evidence_id, "state": expected_state, "path": pack.relative_to(ROOT).as_posix()})
    audit.check(set(fcc) == {"PRD04-PROOF-57", "PRD04-PROOF-58"}, "both independent FCC-13E ledgers are not retained")
    for proof_id in ("PRD04-PROOF-57", "PRD04-PROOF-58"):
        rows = fcc.get(proof_id, [])
        numeric = [row.get("numeric_id") for row in rows if isinstance(row, dict)]
        unique = [row.get("unique_id") for row in rows if isinstance(row, dict)]
        observations = [row.get("observation_identity") for row in rows if isinstance(row, dict)]
        audit.check(len(rows) == 312 and numeric == list(range(1, 313)), proof_id + " does not retain the ordered 312-row boundary")
        audit.check(len(set(unique)) == 312, proof_id + " contains omitted or duplicate stable row identities")
        audit.check(len(set(observations)) == 312 and all(re.fullmatch(r"[0-9a-f]{64}", str(value)) for value in observations), proof_id + " contains missing or duplicate observation identities")
        audit.check(all(row.get("observed_state") in TERMINAL for row in rows if isinstance(row, dict)), proof_id + " contains a non-observed FCC disposition")
    first = {row.get("observation_identity") for row in fcc.get("PRD04-PROOF-57", []) if isinstance(row, dict)}
    second = {row.get("observation_identity") for row in fcc.get("PRD04-PROOF-58", []) if isinstance(row, dict)}
    audit.check(not (first & second), "PROOF-57 and PROOF-58 reused FCC observation identities")
    for relative in ("project.godot", "addons", "scripts", "src", "development"):
        audit.check(not (ROOT / relative).exists(), "terminal package crossed root production boundary: " + relative)
    failures = sorted(set(list(source.get("failures", [])) + audit.failures))
    counts = {name: sum(row.get("state") == name for row in proof_rows if isinstance(row, dict)) for name in sorted(TERMINAL)}
    return {
        "status": "PASS" if not failures else "FAIL",
        "phase": "terminal",
        "checks": int(source.get("checks", 0)) + audit.checks,
        "source_revision": source_revision,
        "proofs": len(proof_rows),
        "result_counts": counts,
        "retained_packs": packs,
        "fcc13e": {"PRD04-PROOF-57": len(fcc.get("PRD04-PROOF-57", [])), "PRD04-PROOF-58": len(fcc.get("PRD04-PROOF-58", [])), "independent": not bool(first & second)},
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
        "w5": "CLOSED",
        "failures": failures,
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--phase", choices=("auto", "source", "terminal"), default="auto")
    parser.add_argument("--source-revision")
    parser.add_argument("--check-protected-local", action="store_true")
    parser.add_argument("--format", choices=("json", "text"), default="text")
    args = parser.parse_args(argv)
    source_revision = args.source_revision or str(_git("rev-parse", "HEAD"))
    phase = "terminal" if args.phase == "auto" and STATE.is_file() else ("source" if args.phase == "auto" else args.phase)
    result = audit_terminal(source_revision, check_protected=args.check_protected_local) if phase == "terminal" else audit_source(source_revision, require_unallocated=True, check_protected=args.check_protected_local)
    if args.format == "json":
        print(json.dumps(result, indent=2, sort_keys=True, ensure_ascii=True))
    else:
        print("PASS" if result.get("status") == "PASS" else "FAIL: " + "; ".join(result.get("failures", [])))
    return 0 if result.get("status") == "PASS" else 1


if __name__ == "__main__":
    sys.exit(main())
