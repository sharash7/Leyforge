"""Deterministic FIXTURE-07/FIXTURE-08 readiness validation; never runs a proof."""

from __future__ import annotations

import csv
import hashlib
import json
import os
import shutil
import subprocess
import tempfile
from collections import Counter
from pathlib import Path
from typing import Any, Dict, List, Mapping, Tuple

from .authority import EXPECTED_SOURCE_IDENTITIES, ROOT, SOURCE_PATHS, W4_PROOF_IDS
from .dependencies import local_dependency_report
from .execution_plan import registry_snapshot


FIXTURE_07 = ROOT / "proofs/r7/w4/fixture-07/manifest.json"
FIXTURE_08 = ROOT / "proofs/r7/w4/fixture-08/manifest.json"
SOURCE_PACKAGES = ROOT / "proofs/r7/w4/fixture-07/source-packages.json"
TRUST_SCALE = ROOT / "proofs/r7/w4/fixture-07/trust-and-scale-cases.json"
MIGRATION_WORLDS = ROOT / "proofs/r7/w4/fixture-07/migration-worlds.json"
FCC_EXPECTED = ROOT / "proofs/r7/w4/fixture-07/fcc13e-expected.json"
PRESENTATION_CASES = ROOT / "proofs/r7/w4/fixture-08/presentation-cases.json"
PRESENTATION_PROBE = ROOT / "proofs/r7/w4/presentation_probe"
FIXTURE_VALIDATION_PATH = ROOT / "docs/rebuild/r7/w4-fixture-readiness-validation.json"

FCC_FIELDS = (
    "numeric_id", "unique_id", "original_id", "display_name", "type", "category",
    "disposition", "target", "authority", "note", "final_fcc13e_status", "final_action",
)
EXPECTED_FCC_OUTCOMES = {
    "POC-ONLY / NOT PROMOTED": 168,
    "CANONICAL REBIND / GENERATED FORM / STATE": 107,
    "CANONICAL SYSTEM ARCHETYPE REBIND": 13,
    "CANONICAL CONTEXTUAL MIGRATION": 7,
    "CANONICAL TOOL ARCHETYPE REBIND": 4,
    "CANONICAL NON-MATERIAL REBIND": 3,
    "LEGACY ECONOMY OBJECT — NOT UNIVERSAL CURRENCY": 3,
    "CATEGORY MIGRATION + OWNER REVIEW": 2,
    "MIGRATION-ONLY / FUTURE-DEFERRED": 2,
    "RETIRED / ALIAS OR CONTEXTUAL MIGRATION": 2,
    "REJECT / REMOVE FROM NORMAL CANON": 1,
}
FIXTURE_07_CAPABILITIES = {
    "governed-editable-source-packages", "canonical-registry-source-bindings",
    "source-provenance-metadata", "deterministic-reproducible-bake-manifest",
    "client-server-logical-pack-role-artifact-identity", "dependency-trust-graph",
    "leyforge-test-compat-isolation", "hostile-capability-smuggling-fixtures",
    "declarative-resource-bomb-fixtures", "generated-material-form-state-families",
    "ai-human-matched-authoring-tasks", "art-golden-reference-source-packages",
    "clean-cache-clean-environment-bake", "missing-pack-world-fixtures",
    "fcc13e-full-312-row-migration-corpus", "machine-readable-validator-results",
}
FIXTURE_08_CAPABILITIES = {
    "representative-art-golden-runtime-scenes", "candidate-renderer-profile-lanes",
    "reduced-quality-effects", "colour-accessibility-cases",
    "reduced-motion-flash-particle-cases", "muted-audio-caption-alternatives",
    "large-ui-text-scale", "controller-keyboard-input-remap",
    "long-localization-layout-stress", "split-screen-per-view-variants",
    "invalid-saved-graphics-configurations", "map00-field-surveyed-magical-relief-modes",
    "authorised-map-knowledge-separated-from-live-truth", "flat-nondrag-list-map-alternatives",
    "task-based-semantic-readability-scoring",
}


def _load(path: Path) -> Dict[str, Any]:
    value = json.loads(path.read_text(encoding="utf-8-sig"))
    if not isinstance(value, dict):
        raise ValueError(path.relative_to(ROOT).as_posix() + " must contain an object")
    return value


def _canonical_json_bytes(value: Any) -> bytes:
    return (json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n").encode("utf-8")


def canonical_fcc_rows() -> List[Dict[str, str]]:
    path = ROOT / SOURCE_PATHS["FCC-13E-CSV"]
    with path.open("r", encoding="utf-8-sig", newline="") as stream:
        reader = csv.DictReader(stream)
        if tuple(reader.fieldnames or ()) != FCC_FIELDS:
            raise ValueError("FCC-13E column contract differs")
        return [{field: str(row.get(field, "")) for field in FCC_FIELDS} for row in reader]


def build_fcc_expected() -> Dict[str, Any]:
    rows = canonical_fcc_rows()
    counts = Counter(row["final_fcc13e_status"] for row in rows)
    return {
        "schema_version": "prd07-w4-fcc13e-expected-ledger-v1",
        "state": "EXPECTED-REVALIDATION-INPUT-NOT-OBSERVED",
        "canonical_source": SOURCE_PATHS["FCC-13E-CSV"],
        "canonical_source_bytes": EXPECTED_SOURCE_IDENTITIES["FCC-13E-CSV"][0],
        "canonical_source_sha256": EXPECTED_SOURCE_IDENTITIES["FCC-13E-CSV"][1],
        "prd07_fcc13e_anchor": {
            "path": SOURCE_PATHS["FCC-13E-AUDIT"],
            "sha256": EXPECTED_SOURCE_IDENTITIES["FCC-13E-AUDIT"][1],
            "note": "PRD-07's published FCC-13E anchor identifies the locked completeness-audit/handoff artifact; the CSV has its own exact identity above.",
        },
        "required_for_proofs": ["PRD04-PROOF-57", "PRD04-PROOF-58"],
        "coverage_rule": "312/312-REQUIRED-NO-SAMPLING-NO-WAIVER",
        "row_count": len(rows),
        "numeric_id_sequence": [int(row["numeric_id"]) for row in rows],
        "final_status_counts": dict(sorted(counts.items())),
        "rows": [
            dict(
                row,
                expected_row_index=index + 1,
                required_revalidation_state="REQUIRED-NOT-OBSERVED",
                observation_status="NOT-EXECUTED",
            )
            for index, row in enumerate(rows)
        ],
        "proof_execution": "NOT-STARTED",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
    }


def write_fcc_expected() -> Dict[str, Any]:
    value = build_fcc_expected()
    FCC_EXPECTED.write_bytes(_canonical_json_bytes(value))
    return value


def fixture_issues() -> Tuple[str, ...]:
    issues = []
    required = (FIXTURE_07, FIXTURE_08, SOURCE_PACKAGES, TRUST_SCALE, MIGRATION_WORLDS, FCC_EXPECTED, PRESENTATION_CASES,
                PRESENTATION_PROBE / "project.godot", PRESENTATION_PROBE / "main.tscn", PRESENTATION_PROBE / "src/main.gd")
    for path in required:
        if not path.is_file():
            issues.append("missing W4 fixture path: " + path.relative_to(ROOT).as_posix())
    if issues:
        return tuple(sorted(set(issues)))
    fixture07 = _load(FIXTURE_07)
    fixture08 = _load(FIXTURE_08)
    if fixture07.get("fixture_id") != "FIXTURE-07" or fixture07.get("fixture_revision") != "W4-R1":
        issues.append("FIXTURE-07 identity differs")
    if fixture08.get("fixture_id") != "FIXTURE-08" or fixture08.get("fixture_revision") != "W4-R1":
        issues.append("FIXTURE-08 identity differs")
    for name, value, expected in (("FIXTURE-07", fixture07, FIXTURE_07_CAPABILITIES), ("FIXTURE-08", fixture08, FIXTURE_08_CAPABILITIES)):
        if set(value.get("capabilities", [])) != expected:
            issues.append(name + " capability set differs")
        if value.get("scope") != "non-production-proof-readiness-infrastructure" or value.get("production_runtime") is not False:
            issues.append(name + " crossed the production boundary")
        if value.get("gameplay_permission") != "CLOSED" or value.get("proof_execution") != "NOT-STARTED":
            issues.append(name + " opened gameplay or proof execution")
    sources = _load(SOURCE_PACKAGES)
    packages = sources.get("packages", [])
    if not isinstance(packages, list) or len(packages) < 12:
        issues.append("FIXTURE-07 lacks representative governed source packages")
    else:
        source_ids = [row.get("source_id") for row in packages if isinstance(row, dict)]
        if len(source_ids) != len(set(source_ids)):
            issues.append("FIXTURE-07 source package IDs are not unique")
        required_classes = {"block-material", "item-machine-structure", "character-creature-animation", "ui-icon-cartography", "vessel-part", "vfx-magic-weather", "audio-cue", "item-tool-form"}
        if not required_classes.issubset({row.get("asset_class") for row in packages if isinstance(row, dict)}):
            issues.append("FIXTURE-07 source packages do not cover every required ART class")
        matched = {}
        for row in packages:
            if isinstance(row, dict) and row.get("matched_task"):
                matched.setdefault(row["matched_task"], set()).add(row.get("source_origin"))
            if not all(row.get(key) for key in ("source_id", "asset_class", "editable_source", "canonical_binding", "provenance", "role_products")):
                issues.append("FIXTURE-07 source package is incomplete: " + str(row.get("source_id")))
        if len(matched) < 4 or any(origins != {"AI-CODEX", "HUMAN"} for origins in matched.values()):
            issues.append("FIXTURE-07 AI/human matched tasks are incomplete")
    trust = _load(TRUST_SCALE)
    if len(trust.get("smuggling_cases", [])) < 6 or len(trust.get("resource_bomb_cases", [])) != 6:
        issues.append("FIXTURE-07 trust/resource hostility corpus is incomplete")
    family = trust.get("generated_family", {})
    if family.get("materials", 0) * family.get("forms", 0) * family.get("states", 0) != family.get("expected_combination_count"):
        issues.append("FIXTURE-07 generated family cardinality differs")
    migration = _load(MIGRATION_WORLDS)
    if len(migration.get("missing_pack_worlds", [])) < 2 or {row.get("change_class") for row in migration.get("upgrade_cases", [])} != {"additive", "compatible-art-only", "deprecated-definition", "breaking-schema"}:
        issues.append("FIXTURE-07 missing-pack/upgrade corpus is incomplete")
    expected = build_fcc_expected()
    actual = _load(FCC_EXPECTED)
    if actual != expected:
        issues.append("FCC-13E expected ledger differs from canonical regeneration")
    if expected.get("row_count") != 312 or expected.get("numeric_id_sequence") != list(range(1, 313)):
        issues.append("FCC-13E coverage is not the exact contiguous 312-row boundary")
    if expected.get("final_status_counts") != dict(sorted(EXPECTED_FCC_OUTCOMES.items())):
        issues.append("FCC-13E final disposition counts differ")
    for key in ("numeric_id", "unique_id", "original_id"):
        values = [row[key] for row in expected.get("rows", [])]
        if len(values) != len(set(values)) or any(not value for value in values):
            issues.append("FCC-13E " + key + " coverage is empty or ambiguous")
    presentation = _load(PRESENTATION_CASES)
    if len(presentation.get("golden_scenes", [])) < 7 or len(presentation.get("configuration_cases", [])) != 9:
        issues.append("FIXTURE-08 scene/configuration corpus is incomplete")
    if set(presentation.get("map_modes", [])) != {"field", "surveyed", "magical-relief", "flat", "non-drag", "list"}:
        issues.append("FIXTURE-08 MAP-00 mode/alternative set differs")
    knowledge = presentation.get("knowledge_fixture", {})
    if not knowledge.get("authorised_cells") or not knowledge.get("unknown_live_truth_cells"):
        issues.append("FIXTURE-08 authorised knowledge/live truth separation is incomplete")
    source = (PRESENTATION_PROBE / "src/main.gd").read_text(encoding="utf-8-sig")
    if not all(proof_id in source for proof_id in W4_PROOF_IDS) or '"proof_execution_started": false' not in source or '"identity_allocation_started": false' not in source:
        issues.append("FIXTURE-08 readiness self-report does not keep execution/allocation closed")
    return tuple(sorted(set(issues)))


def fixture_source_identity() -> Dict[str, Any]:
    paths = sorted(
        path for base in (ROOT / "proofs/r7/w4", ROOT / "tools/r7_w4_runtime")
        for path in base.rglob("*") if path.is_file() and "__pycache__" not in path.parts and path.suffix.lower() != ".pyc"
    )
    digest = hashlib.sha256()
    artifacts = []
    for path in paths:
        relative = path.relative_to(ROOT).as_posix()
        data = path.read_bytes().replace(b"\r\n", b"\n").replace(b"\r", b"\n")
        sha = hashlib.sha256(data).hexdigest()
        digest.update(relative.encode("utf-8") + b"\0" + data + b"\0")
        artifacts.append({"path": relative, "bytes": len(data), "sha256": sha})
    return {"sha256": digest.hexdigest(), "artifacts": artifacts}


def _parse_report(stdout: str) -> Dict[str, Any]:
    prefix = "LEYFORGE_W4_READINESS_SELF_REPORT "
    rows = [line[len(prefix):] for line in stdout.splitlines() if line.startswith(prefix)]
    if len(rows) != 1:
        raise ValueError("expected exactly one W4 readiness self-report")
    value = json.loads(rows[0])
    if not isinstance(value, dict):
        raise ValueError("W4 readiness self-report is not an object")
    return value


def fixture_validation_report(implementation_commit: str, run_dynamic: bool = False) -> Dict[str, Any]:
    before = registry_snapshot()
    issues = list(fixture_issues())
    dynamic = {"performed": False, "status": "NOT-RUN", "reason": "dynamic readiness self-report not requested"}
    if run_dynamic and not issues:
        local = local_dependency_report()
        if local.get("status") != "PASS":
            issues.extend(local.get("issues", []))
            dynamic = {"performed": False, "status": "BLOCKED", "reason": "exact local Godot dependency unavailable"}
        else:
            parent = ROOT / ".local/r7-w4-readiness-validation"
            parent.mkdir(parents=True, exist_ok=True)
            with tempfile.TemporaryDirectory(prefix="fixture-", dir=str(parent)) as raw:
                workspace = Path(raw) / "presentation_probe"
                shutil.copytree(PRESENTATION_PROBE, workspace)
                profile = Path(raw) / "profile"
                environment = os.environ.copy()
                environment["APPDATA"] = str((profile / "appdata").resolve())
                environment["LOCALAPPDATA"] = str((profile / "localappdata").resolve())
                command = [str(local["paths"]["godot_driver"]), "--headless", "--path", str(workspace), "--", "--readiness-self-report"]
                completed = subprocess.run(command, cwd=workspace, text=True, capture_output=True, timeout=90, env=environment)
                try:
                    report = _parse_report(completed.stdout)
                except Exception as exc:
                    report = {}
                    issues.append("FIXTURE-08 dynamic readiness self-report failed: " + str(exc))
                valid = bool(
                    completed.returncode == 0
                    and report.get("status") == "PASS"
                    and report.get("fixture_id") == "FIXTURE-08"
                    and report.get("stable_proof_ids") == list(W4_PROOF_IDS)
                    and report.get("proof_execution_started") is False
                    and report.get("identity_allocation_started") is False
                    and report.get("production_runtime") is False
                    and report.get("gameplay_permission") == "CLOSED"
                )
                if not valid:
                    issues.append("FIXTURE-08 dynamic readiness self-report contract differs")
                dynamic = {
                    "performed": True,
                    "status": "PASS" if valid else "FAIL",
                    "command_role": "proof-free-fixture-readiness-self-report",
                    "exit_code": completed.returncode,
                    "stdout_sha256": hashlib.sha256(completed.stdout.encode("utf-8")).hexdigest(),
                    "stderr_sha256": hashlib.sha256(completed.stderr.encode("utf-8")).hexdigest(),
                    "report": report,
                }
    after = registry_snapshot()
    if before != after:
        issues.append("fixture readiness validation changed registry or W3 execution state")
    return {
        "schema_version": "prd07-w4-fixture-readiness-validation-v1",
        "package": "R7-W4-FORGE-TRUST-PRESENTATION-MIGRATION-READINESS-AND-ADMISSION",
        "implementation_commit": implementation_commit,
        "status": "PASS" if not issues and (not run_dynamic or dynamic.get("status") == "PASS") else "FAIL",
        "fixture_07": {"fixture_id": "FIXTURE-07", "revision": "W4-R1", "capabilities": sorted(FIXTURE_07_CAPABILITIES), "status": "READY" if not fixture_issues() else "BLOCKED"},
        "fixture_08": {"fixture_id": "FIXTURE-08", "revision": "W4-R1", "capabilities": sorted(FIXTURE_08_CAPABILITIES), "status": "READY" if not fixture_issues() else "BLOCKED"},
        "fcc13e": {"rows_required": 312, "rows_present": len(canonical_fcc_rows()), "coverage": "312/312" if not any("FCC-13E" in issue for issue in issues) else "BLOCKED", "observation_status": "NOT-EXECUTED"},
        "dynamic_readiness_self_report": dynamic,
        "before_execution_authority": before,
        "after_execution_authority": after,
        "issues": sorted(set(issues)),
        "proof_execution": "NOT-STARTED",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "gameplay_permission": "CLOSED",
        "production_runtime": "ABSENT",
    }


def write_fixture_validation(implementation_commit: str) -> Dict[str, Any]:
    value = fixture_validation_report(implementation_commit, run_dynamic=True)
    FIXTURE_VALIDATION_PATH.parent.mkdir(parents=True, exist_ok=True)
    FIXTURE_VALIDATION_PATH.write_bytes(_canonical_json_bytes(value))
    return value
