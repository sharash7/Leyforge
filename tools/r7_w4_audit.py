#!/usr/bin/env python3
"""Independent stdlib-only audit of the materialized W4 admission package."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import re
import subprocess
import sys
from collections import Counter
from pathlib import Path
from typing import Any, Dict, List


ROOT = Path(__file__).resolve().parents[1]
READINESS = ROOT / "docs/rebuild/r7/w4-readiness.json"
BOUNDARY = ROOT / "docs/rebuild/r7/w4-readiness-admission-boundary.json"
FIXTURE_RECEIPT = ROOT / "docs/rebuild/r7/w4-fixture-readiness-validation.json"
FCC_CSV = ROOT / ".summer/00_Docs/FCC-01-14/FCC13/Leyforge_FCC-13_Definitive_Registry_LOCKED/FCC-13E_Final_312-Row_Legacy_Migration_Matrix_v0_1.csv"
FCC_LEDGER = ROOT / "proofs/r7/w4/fixture-07/fcc13e-expected.json"
W3_STATE = ROOT / "docs/rebuild/r7/w3-execution-state.json"
W4_STATE = ROOT / "docs/rebuild/r7/w4-execution-state.json"
PROOFS = ["PRD04-PROOF-{0:02d}".format(number) for number in (49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 71)]
FCC_FIELDS = ["numeric_id","unique_id","original_id","display_name","type","category","disposition","target","authority","note","final_fcc13e_status","final_action"]


def _load(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError(path.name + " is not an object")
    return value


def audit(implementation_commit: str) -> Dict[str, Any]:
    failures: List[str] = []
    checks = 0

    def check(condition: bool, message: str) -> None:
        nonlocal checks
        checks += 1
        if not condition:
            failures.append(message)

    for path in (READINESS, BOUNDARY, FIXTURE_RECEIPT, FCC_CSV, FCC_LEDGER, W3_STATE):
        check(path.is_file(), "missing required audit path: " + path.relative_to(ROOT).as_posix())
    if failures:
        return {"status":"FAIL","checks":checks,"failures":failures}
    readiness = _load(READINESS)
    boundary = _load(BOUNDARY)
    fixture = _load(FIXTURE_RECEIPT)
    w3 = _load(W3_STATE)
    check(readiness.get("implementation_commit") == implementation_commit, "readiness implementation commit differs")
    check(boundary.get("implementation_commit") == implementation_commit, "boundary implementation commit differs")
    check(readiness.get("status") == "PASS", "readiness status is not PASS")
    check(readiness.get("proof_roster") == PROOFS, "readiness roster/order differs")
    check([row.get("proof_id") for row in readiness.get("proofs", [])] == PROOFS, "proof detail roster/order differs")
    check(readiness.get("readiness_counts") == {"READY":15,"BLOCKED":0,"NOT APPLICABLE":0}, "readiness dispositions differ")
    check(all(row.get("readiness_disposition") == "READY" for row in readiness.get("proofs", [])), "one or more W4 proofs are not READY")
    check(all(row.get("proof_observation") == "NOT-EXECUTED" and row.get("execution_authorized") is False for row in readiness.get("proofs", [])), "readiness claims proof execution or authority")
    check(readiness.get("proof_execution") == "NOT-STARTED", "readiness proof state differs")
    check(readiness.get("allocated_run_ids") == [] and readiness.get("allocated_evidence_ids") == [], "readiness allocated identities")
    check(boundary.get("proof_execution") == "NOT-STARTED", "boundary proof state differs")
    check(boundary.get("allocated_run_ids") == [] and boundary.get("allocated_evidence_ids") == [], "boundary allocated identities")
    previews = readiness.get("next_identity_previews", [])
    check(len(previews) == 15, "preview count differs")
    check([row.get("run_id") for row in previews] == ["PRD07-RUN-{0:04d}".format(number) for number in range(66,81)], "RUN previews differ")
    check([row.get("evidence_id") for row in previews] == ["PRD07-EVID-{0:04d}".format(number) for number in range(66,81)], "EVID previews differ")
    check(all(row.get("identity_state") == "PREVIEW-NOT-ALLOCATED" and row.get("reserved") is False and row.get("registry_entry_created") is False for row in previews), "a preview is not non-allocated")
    check(boundary.get("next_identity_previews") == previews, "boundary/readiness previews differ")
    check(fixture.get("status") == "PASS", "fixture validation receipt did not pass")
    check(fixture.get("before_execution_authority") == fixture.get("after_execution_authority"), "fixture validation changed execution authority")
    check(fixture.get("proof_execution") == "NOT-STARTED" and fixture.get("allocated_run_ids") == [] and fixture.get("allocated_evidence_ids") == [], "fixture validation executed or allocated")
    dynamic = fixture.get("dynamic_readiness_self_report", {})
    check(dynamic.get("performed") is True and dynamic.get("status") == "PASS", "dynamic fixture readiness self-report did not pass")
    with FCC_CSV.open("r", encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream)
        csv_rows = [{field: str(row.get(field, "")) for field in FCC_FIELDS} for row in reader]
        check(list(reader.fieldnames or []) == FCC_FIELDS, "FCC-13E columns differ")
    ledger = _load(FCC_LEDGER)
    ledger_rows = ledger.get("rows", [])
    check(len(csv_rows) == 312 and ledger.get("row_count") == 312 and len(ledger_rows) == 312, "FCC-13E row count is not 312/312")
    check(ledger.get("numeric_id_sequence") == list(range(1,313)), "FCC-13E numeric sequence differs")
    check(all({field: row.get(field) for field in FCC_FIELDS} == csv_row for row, csv_row in zip(ledger_rows, csv_rows)), "FCC-13E ledger rows differ from canonical CSV")
    check(all(row.get("required_revalidation_state") == "REQUIRED-NOT-OBSERVED" and row.get("observation_status") == "NOT-EXECUTED" for row in ledger_rows), "FCC-13E ledger claims observations")
    check(len({row["numeric_id"] for row in csv_rows}) == 312 and len({row["unique_id"] for row in csv_rows}) == 312 and len({row["original_id"] for row in csv_rows}) == 312, "FCC-13E identity columns are ambiguous")
    check(ledger.get("final_status_counts") == dict(sorted(Counter(row["final_fcc13e_status"] for row in csv_rows).items())), "FCC-13E dispositions differ")
    check(w3.get("package_state") == "W3-EXECUTION-COMPLETE", "W3 terminal state differs")
    check(w3.get("allocated_run_ids", [])[-1:] == ["PRD07-RUN-0065"] and w3.get("allocated_evidence_ids", [])[-1:] == ["PRD07-EVID-0065"], "W3 high-water differs")
    check(not W4_STATE.exists(), "W4 execution state exists")
    evidence_root = ROOT / "docs/rebuild/r7/execution-evidence"
    post_65 = [path.name for path in evidence_root.iterdir() if path.is_dir() and re.fullmatch(r"PRD07-RUN-(?:006[6-9]|007\d|0080)", path.name)]
    check(not post_65, "post-0065 standard evidence-pack path exists")
    result = subprocess.run(["git","cat-file","-e",implementation_commit+"^{commit}"], cwd=ROOT, text=True, capture_output=True)
    check(result.returncode == 0, "implementation commit does not resolve")
    for row in boundary.get("artifacts", []):
        relative = row.get("path")
        path = ROOT / str(relative)
        check(path.is_file(), "admitted path missing: " + str(relative))
        if not path.is_file():
            continue
        data = path.read_bytes().replace(b"\r\n",b"\n").replace(b"\r",b"\n")
        check(len(data) == row.get("bytes") and hashlib.sha256(data).hexdigest() == row.get("sha256"), "admitted canonical identity differs: " + str(relative))
        blob = subprocess.run(["git","hash-object","--",str(relative)], cwd=ROOT, text=True, capture_output=True)
        check(blob.returncode == 0 and blob.stdout.strip() == row.get("git_blob"), "admitted Git blob differs: " + str(relative))
    check(boundary.get("gameplay_permission") == "CLOSED" and boundary.get("production_runtime") == "ABSENT" and boundary.get("active_poc_dependencies") == 0, "admission crossed gameplay/production boundary")
    check(not (ROOT / "project.godot").exists(), "root production project.godot exists")
    check(all(not (ROOT / name).exists() for name in ("addons","scripts","src")), "root production runtime path exists")
    return {
        "schema_version":"prd07-w4-independent-admission-audit-v1",
        "status":"PASS" if not failures else "FAIL",
        "checks":checks,
        "failures":sorted(set(failures)),
        "proofs":len(PROOFS),
        "readiness_counts":readiness.get("readiness_counts"),
        "fcc13e_rows":len(ledger_rows),
        "fcc13e_dispositions":ledger.get("final_status_counts"),
        "preview_range":"0066-0080",
        "preview_state":"PREVIEW-NOT-ALLOCATED",
        "proof_execution":"NOT-STARTED",
        "allocated_run_ids":[],
        "allocated_evidence_ids":[],
        "w3_high_water":65,
        "gameplay_permission":"CLOSED",
        "production_runtime":"ABSENT",
    }


def main() -> int:
    parser = argparse.ArgumentParser(description="Independent W4 readiness/admission audit")
    parser.add_argument("--implementation-commit", required=True)
    parser.add_argument("--format", choices=("text","json"), default="text")
    args = parser.parse_args()
    value = audit(args.implementation_commit)
    print(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True))
    return 0 if value["status"] == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
