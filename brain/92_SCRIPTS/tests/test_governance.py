"""R5 G0 engineering-governance acceptance suite."""

from __future__ import annotations

import hashlib
import importlib.util
import json
import subprocess
import sys
import unittest
from pathlib import Path


SCRIPT = Path(__file__).resolve().parents[1] / "governance.py"
SPEC = importlib.util.spec_from_file_location("leyforge_governance", SCRIPT)
assert SPEC and SPEC.loader
governance = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = governance
SPEC.loader.exec_module(governance)


def synthetic(record_id: str, record_type: str, brain_type: str, status: str, **overrides):
    metadata = {
        "brain_schema": 1,
        "id": record_id,
        "type": brain_type,
        "title": "Synthetic governance fixture",
        "status": status,
        "information_class": "temporary",
        "created": "2026-09-06",
        "updated": "2026-09-06",
        "authority_domain": "engineering_governance",
        "authority_role": "provisional_record",
        "authority_status": "proposed",
        "record_type": record_type,
        "template_version": 1,
    }
    metadata.update(overrides)
    return governance.brain.Record(governance.BRAIN_ROOT / f"99_ARCHIVE/{record_id}.md", metadata, "# Synthetic\n")


class GovernanceAcceptanceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.records, cls.parse_diagnostics = governance.governance_records()
        cls.by_id = {str(record.metadata.get("id")): record for record in cls.records}
        cls.manifest = governance.load_json(governance.MANIFEST_PATH)

    def test_01_GOV_AT_001_branch_b_manifest(self) -> None:
        self.assertEqual(self.manifest["source_count"], 23)
        self.assertEqual(len(self.manifest["sources"]), 23)
        self.assertEqual(set(governance.load_json(governance.SCHEMA_PATH)["authority_source_ids"]), {item["id"] for item in self.manifest["sources"]})
        self.assertEqual([], governance.validate_manifest())

    def test_02_GOV_AT_002_authority_statuses(self) -> None:
        statuses = {item["id"]: item["source_status"] for item in self.manifest["sources"]}
        self.assertTrue(all(statuses[f"ENG-GOV-{number:02d}"] == "theoretically_locked" for number in range(16)))
        self.assertTrue(all(statuses[f"B-OPS-{number:02d}"] == "operational_baseline" for number in range(6)))
        self.assertEqual(statuses["B-OPS-06"], "certified")

    def test_03_GOV_AT_003_source_derived_templates(self) -> None:
        self.assertEqual(len(governance.extract_templates()), 12)
        self.assertEqual([], governance.template_drift())
        self.assertTrue(all(path.is_file() for path in governance.extract_templates()))

    def test_04_GOV_AT_004_operational_records_validate(self) -> None:
        self.assertEqual([], self.parse_diagnostics)
        self.assertEqual([], governance.validate_records(self.records))

    def test_05_GOV_AT_005_duplicate_id_detection(self) -> None:
        first = synthetic("ADR-9000", "architecture_decision", "adr", "proposed", domain="test", risk_class="A", reconstructed=False)
        second = governance.brain.Record(governance.BRAIN_ROOT / "99_ARCHIVE/duplicate.md", dict(first.metadata), first.body)
        diagnostics = governance.validate_records([first, second])
        self.assertTrue(any(item["code"] == "GOV-E020" for item in diagnostics))

    def test_06_GOV_AT_006_invalid_status_detection(self) -> None:
        record = synthetic("ADR-9001", "architecture_decision", "adr", "active", domain="test", risk_class="A", reconstructed=False)
        self.assertTrue(any(item["code"] == "GOV-E024" for item in governance.validate_records([record])))

    def test_07_GOV_AT_007_risk_class_detection(self) -> None:
        record = synthetic("ADR-9002", "architecture_decision", "adr", "proposed", domain="test", risk_class="Z", reconstructed=False)
        self.assertTrue(any(item["code"] == "GOV-E027" for item in governance.validate_records([record])))

    def test_08_GOV_AT_008_template_version_detection(self) -> None:
        record = synthetic("ADR-9003", "architecture_decision", "adr", "proposed", domain="test", risk_class="A", reconstructed=False, template_version=99)
        self.assertTrue(any(item["code"] == "GOV-E025" for item in governance.validate_records([record])))

    def test_09_GOV_AT_009_adr_backlog_and_supersession(self) -> None:
        for number in range(1, 8):
            record = self.by_id[f"ADR-{number:04d}"]
            self.assertEqual(record.metadata["status"], "proposed")
            self.assertTrue(record.metadata["reconstructed"])
            self.assertIsNone(record.metadata["accepted"])
        self.assertEqual([], governance.validate_references(self.records))

    def test_10_GOV_AT_010_waiver_expiry_detection(self) -> None:
        waiver = synthetic("WAIVER-9000", "waiver", "deviation", "active", domain="test", risk_class="B", governing_rules=["BOP05-033"], expires="2000-01-01", exit_condition="Remove suppression")
        diagnostics = governance.validate_waivers([waiver])
        self.assertTrue(any(item["code"] == "GOV-E034" for item in diagnostics))

    def test_11_GOV_AT_011_debt_rule_links(self) -> None:
        debts = [record for record in self.records if record.metadata.get("record_type") == "governance_debt"]
        self.assertEqual({"G0", "G1", "G2", "G3", "G4", "G5"}, {record.metadata["activation_milestone"] for record in debts})
        self.assertTrue(all(record.metadata["rules"] for record in debts))
        self.assertFalse(any(item["code"] == "GOV-E029" for item in governance.validate_records(debts)))
        g0 = self.by_id["GOV-DEBT-0001"]
        self.assertEqual(g0.metadata["governance_status"], "closed")
        self.assertEqual(g0.metadata["closure_evidence"], "EVID-0002")
        completion = self.by_id["CHANGE-20260906-001"]
        self.assertEqual(completion.metadata["governance_status"], "complete")
        self.assertEqual(completion.metadata["closure_evidence"], "EVID-0002")

    def test_12_GOV_AT_012_dependency_adr_links(self) -> None:
        for record_id in ("DEP-GODOT", "DEP-ZYLANN"):
            record = self.by_id[record_id]
            self.assertEqual(record.metadata["governance_status"], "planned")
            self.assertTrue(record.metadata["related_adrs"])
            self.assertEqual(record.metadata["repository_paths"], ["UNINSTALLED"])

    def test_13_GOV_AT_013_agent_bootstrap(self) -> None:
        text = (governance.REPO_ROOT / "AGENTS.md").read_text(encoding="utf-8-sig")
        for term in ("Task contract", "Risk", "Permissions", "Acceptance Criteria", "Verification", "governance.py", "R8 gameplay permission remains closed"):
            self.assertIn(term, text)

    def test_14_GOV_AT_014_stable_entrypoints(self) -> None:
        entrypoints = self.manifest["entrypoints"]
        self.assertEqual(set(entrypoints), {"governance", "build", "focused_test", "full_validation"})
        self.assertTrue((governance.REPO_ROOT / "tools/verify.py").is_file())

    def test_15_GOV_AT_015_initial_ci(self) -> None:
        workflow = (governance.REPO_ROOT / ".github/workflows/governance.yml").read_text(encoding="utf-8-sig")
        self.assertIn("governance.py doctor --profile certification", workflow)
        self.assertIn("tools/verify.py --tier full", workflow)

    def test_16_GOV_AT_016_brain_integration_without_duplicate_authority(self) -> None:
        self.assertTrue(all(record.metadata.get("authority_role") != "primary" for record in self.records))
        all_records, _ = governance.brain.discover_records()
        all_ids = {str(record.metadata.get("id")) for record in all_records}
        self.assertIn("SYS-ENGINEERING-GOVERNANCE", all_ids)
        self.assertTrue({item["brain_proxy"] for item in self.manifest["sources"]}.issubset(all_ids))

    def test_17_GOV_AT_017_controlled_prd_intake(self) -> None:
        intake = governance.load_json(governance.REPO_ROOT / "docs/rebuild/source-intake/r5-prd-05-06.json")
        self.assertEqual(len(intake["artifacts"]), 3)
        for artifact in intake["artifacts"]:
            data = (governance.REPO_ROOT / artifact["path"]).read_bytes()
            self.assertEqual(len(data), artifact["bytes"])
            self.assertEqual(hashlib.sha256(data).hexdigest(), artifact["sha256"])

    def test_18_GOV_AT_018_closed_release_and_gameplay_gate(self) -> None:
        self.assertFalse((governance.REPO_ROOT / "project.godot").exists())
        result = subprocess.run([sys.executable, str(SCRIPT), "gate", "--tier", "release", "--format", "json"], cwd=governance.REPO_ROOT, text=True, capture_output=True)
        self.assertEqual(result.returncode, 2)
        self.assertEqual(json.loads(result.stdout)["status"], "BLOCKED")


if __name__ == "__main__":
    unittest.main()
