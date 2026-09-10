"""Canonical W4 source parsing and exact authority identities."""

from __future__ import annotations

import hashlib
import re
from pathlib import Path
from typing import Any, Dict, Iterable, List, Mapping, Tuple


ROOT = Path(__file__).resolve().parents[2]
W4_NUMBERS = (49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 71)
W4_PROOF_IDS = tuple("PRD04-PROOF-{0:02d}".format(number) for number in W4_NUMBERS)
REVALIDATED_FROM_W2 = ("PRD04-PROOF-57", "PRD04-PROOF-58")

SOURCE_PATHS = {
    "PRD-04": ".summer/00_Docs/PRD/PRD-04_Leyforge_Architecture_Boundary_Study_v0_8_CLOSURE_CANDIDATE.md",
    "PRD-05": ".summer/00_Docs/PRD/PRD-05_Leyforge_Research_Evidence_Crosswalk_v1_0_CLOSURE_CANDIDATE_Round10.md",
    "PRD-06": ".summer/00_Docs/PRD/PRD-06_Leyforge_Technical_Risk_and_Proof_Register_v1_0_CLOSURE_CANDIDATE_Round10.md",
    "PRD-07": ".summer/00_Docs/PRD/PRD-07_Leyforge_Prototype_Benchmark_and_Proof_Execution_Programme_v1_0_CLOSURE_CANDIDATE_Round10.md",
    "ART-09": ".summer/00_Docs/ART/ART-09_Leyforge_Codex_and_The_Forge_Asset_Production_Execution_Contract_v0.1.md",
    "ART-10": ".summer/00_Docs/ART/ART-10_Leyforge_Golden_References_Visual_Audio_QA_and_Production_Certification_v0.1.md",
    "MAP-00": ".summer/00_Docs/Additional/MAP-00_Leyforge_In-World_Cartography_Surveying_and_Magical_Relief_Map_System_v0.1.md",
    "FCC-13E-CSV": ".summer/00_Docs/FCC-01-14/FCC13/Leyforge_FCC-13_Definitive_Registry_LOCKED/FCC-13E_Final_312-Row_Legacy_Migration_Matrix_v0_1.csv",
    "FCC-13E-AUDIT": ".summer/00_Docs/FCC-01-14/FCC13/Leyforge_FCC-13_Definitive_Registry_LOCKED/FCC-13E_Legacy_Migration_Matrix_Completeness_Audit_and_FCC-14_Handoff_v0_1.md",
}

EXPECTED_SOURCE_IDENTITIES = {
    "PRD-04": (345494, "747c6681d521dc0483e9b8c1c622bb705aa3fbaff7f2a9b494965835f191e2b4"),
    "PRD-05": (1312444, "30af0861a801158459820d1756fb49cdf223015b682de8df5f7acbb89add766e"),
    "PRD-06": (574732, "001f748875e63760d22fda5e4fa8fb71f9a7f9cf465f285f019a3ba5a8ba3fba"),
    "PRD-07": (393546, "c36296278d0c9f09c78931c0bfeaa7a2b2a5aa4b71c741c17fcd7b473259b88e"),
    "ART-09": (55932, "6a229ff749bc0013911471df34f5352d63928224ac81f16f15c7d4a11b3fed8d"),
    "ART-10": (45354, "06f39cab47a7ced4bb3b32bc8d6671ad37f9104e53a2413fe493b1fcf1f39854"),
    "MAP-00": (42019, "a1b18ae01a8cc63ff06cf0297b0ae25fee165116f3a30d05b051c0c41480edad"),
    "FCC-13E-CSV": (161890, "8ecd4f8ec4a78e7e651de295a337a02e435852cdddea036040a0f69d1cc58036"),
    "FCC-13E-AUDIT": (119408, "aa334414ab509e3e7674336f3d62767d3064f29ea1292ccea2ab9a452c6a5610"),
}

SECTION_FIELDS = (
    "Question",
    "Hypotheses",
    "Candidate implementations under test",
    "Prerequisites",
    "Build/configuration matrix",
    "Workload / state",
    "Fault / hostility matrix",
    "Measurement",
    "Success criterion",
    "Failure criterion",
    "Inconclusive conditions",
    "Required repetition",
    "Required evidence artifacts",
    "PRD-08 decision relevance",
)


def canonical_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def source_identity(name: str) -> Dict[str, Any]:
    path = ROOT / SOURCE_PATHS[name]
    return {
        "authority": name,
        "path": SOURCE_PATHS[name],
        "bytes": path.stat().st_size if path.is_file() else 0,
        "sha256": canonical_sha256(path) if path.is_file() else "",
    }


def source_identities() -> List[Dict[str, Any]]:
    return [source_identity(name) for name in SOURCE_PATHS]


def _normalise_text(value: str) -> str:
    return re.sub(r"\s+", " ", value.strip())


def _section_value(section: str, field: str) -> str:
    pattern = r"^### " + re.escape(field) + r"\s*$\n(.*?)(?=^### |\Z)"
    match = re.search(pattern, section, flags=re.MULTILINE | re.DOTALL)
    return match.group(1).strip() if match else ""


def _items(value: str) -> List[str]:
    items = []
    for raw in value.splitlines():
        line = raw.strip()
        if line.startswith("- "):
            items.append(_normalise_text(line[2:]))
        elif line and not line.startswith("|"):
            if items:
                items[-1] = _normalise_text(items[-1] + " " + line)
            else:
                items.append(_normalise_text(line))
    return items


def _parse_prd04_titles(text: str) -> Dict[str, str]:
    return {
        match.group(1): _normalise_text(match.group(2))
        for match in re.finditer(r"^## (PRD04-PROOF-\d{2}) — (.+?)\s*$", text, flags=re.MULTILINE)
    }


def proof_contracts() -> List[Dict[str, Any]]:
    prd07 = (ROOT / SOURCE_PATHS["PRD-07"]).read_text(encoding="utf-8-sig")
    prd04 = (ROOT / SOURCE_PATHS["PRD-04"]).read_text(encoding="utf-8-sig")
    prd04_titles = _parse_prd04_titles(prd04)
    heading = re.compile(r"^## 89\.\d+ (PRD04-PROOF-\d{2}) — (.+?)\s*$", flags=re.MULTILINE)
    matches = list(heading.finditer(prd07))
    contracts = []
    for index, match in enumerate(matches):
        proof_id = match.group(1)
        if proof_id not in W4_PROOF_IDS:
            continue
        end = matches[index + 1].start() if index + 1 < len(matches) else prd07.find("\n# 90.", match.end())
        section = prd07[match.start():end if end >= 0 else len(prd07)]
        fixture_match = re.search(r"\*\*Principal fixture\(s\):\*\*\s*(.+?)\s{2,}$", section, flags=re.MULTILINE)
        consumer_match = re.search(r"\*\*Detailed PRD-06 consumers \((\d+)\):\*\*\s*(.+?)\s*$", section, flags=re.MULTILINE)
        values = {field: _section_value(section, field) for field in SECTION_FIELDS}
        contracts.append({
            "proof_id": proof_id,
            "proof_number": int(proof_id[-2:]),
            "title": _normalise_text(match.group(2)),
            "prd04_title": prd04_titles.get(proof_id, ""),
            "title_match": _normalise_text(match.group(2)) == prd04_titles.get(proof_id, ""),
            "wave": "W4",
            "revalidated_from_w2": proof_id in REVALIDATED_FROM_W2,
            "principal_fixtures": re.findall(r"FIXTURE-\d{2}", fixture_match.group(1) if fixture_match else ""),
            "prd06_consumer_count_declared": int(consumer_match.group(1)) if consumer_match else -1,
            "prd06_consumers": re.findall(r"PRD06-RISK-[A-Z]\d{2}", consumer_match.group(2) if consumer_match else ""),
            "question": _normalise_text(values["Question"]),
            "hypotheses": _items(values["Hypotheses"]),
            "candidate_implementations": _items(values["Candidate implementations under test"]),
            "prerequisites": _items(values["Prerequisites"]),
            "build_configuration_matrix": _items(values["Build/configuration matrix"]),
            "workload_state": _normalise_text(values["Workload / state"]),
            "fault_hostility_matrix": _items(values["Fault / hostility matrix"]),
            "measurement": _items(values["Measurement"]),
            "success_criterion": _normalise_text(values["Success criterion"]),
            "failure_criterion": _normalise_text(values["Failure criterion"]),
            "inconclusive_conditions": _normalise_text(values["Inconclusive conditions"]),
            "required_repetition": _normalise_text(values["Required repetition"]),
            "required_evidence_artifacts": _items(values["Required evidence artifacts"]),
            "prd08_decision_relevance": _normalise_text(values["PRD-08 decision relevance"]),
            "canonical_source": {
                "prd04": SOURCE_PATHS["PRD-04"],
                "prd07": SOURCE_PATHS["PRD-07"],
                "prd07_section": section.splitlines()[0].lstrip("# "),
            },
        })
    return contracts


def authority_issues(contracts: Iterable[Mapping[str, Any]] = ()) -> Tuple[str, ...]:
    issues = []
    for name, (expected_bytes, expected_sha256) in EXPECTED_SOURCE_IDENTITIES.items():
        path = ROOT / SOURCE_PATHS[name]
        if not path.is_file():
            issues.append("missing canonical authority: " + name)
            continue
        if path.stat().st_size != expected_bytes:
            issues.append("canonical byte identity differs: " + name)
        if canonical_sha256(path) != expected_sha256:
            issues.append("canonical SHA-256 differs: " + name)
    rows = list(contracts) if contracts else proof_contracts()
    if tuple(row.get("proof_id") for row in rows) != W4_PROOF_IDS:
        issues.append("W4 proof roster/order differs from canonical 15-proof sequence")
    for row in rows:
        proof_id = str(row.get("proof_id", "unknown"))
        if row.get("title_match") is not True:
            issues.append(proof_id + " PRD-04/PRD-07 title mapping differs")
        if not row.get("principal_fixtures"):
            issues.append(proof_id + " has no canonical principal fixture")
        if row.get("prd06_consumer_count_declared") != len(row.get("prd06_consumers", [])):
            issues.append(proof_id + " PRD-06 consumer count differs")
        for key in (
            "question", "hypotheses", "candidate_implementations", "prerequisites",
            "build_configuration_matrix", "workload_state", "fault_hostility_matrix",
            "measurement", "success_criterion", "failure_criterion", "inconclusive_conditions",
            "required_repetition", "required_evidence_artifacts", "prd08_decision_relevance",
        ):
            if not row.get(key):
                issues.append(proof_id + " lacks canonical " + key)
    for source_name in ("PRD-05", "PRD-06"):
        text = (ROOT / SOURCE_PATHS[source_name]).read_text(encoding="utf-8-sig")
        for proof_id in W4_PROOF_IDS:
            if proof_id not in text:
                issues.append(source_name + " does not bind " + proof_id)
    return tuple(sorted(set(issues)))
