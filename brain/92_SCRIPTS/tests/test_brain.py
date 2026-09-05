"""Mandatory R4 acceptance suite from LF-BRAIN-13 section 61."""

from __future__ import annotations

import importlib.util
import json
import subprocess
import sys
import unittest
from pathlib import Path


SCRIPT = Path(__file__).resolve().parents[1] / "brain.py"
SPEC = importlib.util.spec_from_file_location("leyforge_brain", SCRIPT)
assert SPEC and SPEC.loader
brain = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = brain
SPEC.loader.exec_module(brain)


def synthetic(record_id: str, **overrides):
    metadata = {
        "brain_schema": 1,
        "id": record_id,
        "type": "decision",
        "title": "Synthetic acceptance fixture",
        "status": "proposed",
        "information_class": "authored",
        "created": "2026-09-06",
        "updated": "2026-09-06",
        "authority_domain": "brain_operations",
        "authority_role": "provisional_record",
        "authority_status": "proposed",
    }
    metadata.update(overrides)
    return brain.Record(brain.BRAIN_ROOT / f"99_ARCHIVE/{record_id}.md", metadata, "# Synthetic\n")


class BrainAcceptanceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.records, cls.parse_diagnostics = brain.discover_records()
        cls.by_id = {str(record.metadata.get("id")): record for record in cls.records}
        cls.schema = brain.load_json(brain.SCHEMA_PATH)
        cls.forward, cls.reverse = brain.build_graph(cls.records)

    def test_01_BRAIN_AT_001_vault_bootstrap(self) -> None:
        manifest = brain.load_json(brain.REPO_ROOT / "docs/rebuild/r3/baseline-manifest.json")
        for folder in manifest["brain_folders"]:
            self.assertTrue((brain.BRAIN_ROOT / folder).is_dir(), folder)
        for record_id, filename in (("HOME", "HOME.md"), ("AGENTS", "AGENTS.md"), ("CURRENT-HANDOFF", "CURRENT_HANDOFF.md")):
            self.assertEqual(self.by_id[record_id].path, brain.BRAIN_ROOT / filename)
        self.assertGreaterEqual(len(list((brain.BRAIN_ROOT / "90_TEMPLATES").glob("*.md"))), 15)
        self.assertGreaterEqual(len(list((brain.BRAIN_ROOT / "80_BASES").glob("*.base"))), 10)
        self.assertGreaterEqual(len(list((brain.BRAIN_ROOT / "81_CANVAS").glob("*.canvas"))), 2)

    def test_02_BRAIN_AT_002_schema_valid_record_creation(self) -> None:
        self.assertEqual(self.schema["schema_version"], 1)
        self.assertEqual(set(brain.UNIVERSAL_FIELDS), set(self.schema["required"]))
        self.assertEqual(len(self.schema["record_types"]), 38)
        original = synthetic("DEC-9000")
        rendered = brain.render_record(original.metadata, original.body)
        metadata, body = brain.parse_frontmatter(rendered)
        recreated = brain.Record(brain.BRAIN_ROOT / "99_ARCHIVE/DEC-9000.md", metadata, body)
        self.assertEqual([], brain.validate_records([recreated], []))

    def test_03_BRAIN_AT_003_duplicate_id_rejection(self) -> None:
        first = synthetic("DEC-9001")
        second = brain.Record(brain.BRAIN_ROOT / "99_ARCHIVE/duplicate.md", dict(first.metadata), first.body)
        diagnostics = brain.validate_records([first, second], [])
        self.assertTrue(any(item["code"] == "BRAIN-E003" for item in diagnostics))

    def test_04_BRAIN_AT_004_authority_resolution(self) -> None:
        diagnostics = brain.validate_records(self.records, self.parse_diagnostics)
        blocked = {"BRAIN-E009", "BRAIN-E010", "BRAIN-E011", "BRAIN-E022"}
        self.assertEqual([], [item for item in diagnostics if item["code"] in blocked])
        self.assertEqual(self.by_id["AUTHORITY-MAP"].metadata["status"], "locked")
        proxy = self.by_id["DOC-LF-BRAIN-02"]
        self.assertEqual(proxy.metadata["authority_role"], "derived_record")
        self.assertEqual(proxy.metadata["canonical_path"].split("/")[-1][:11], "LF-BRAIN-02")

    def test_05_BRAIN_AT_005_supersession_traversal(self) -> None:
        first = synthetic("DEC-9002", status="superseded", superseded_by=["DEC-9003"])
        second = synthetic("DEC-9003", supersedes=["DEC-9002"])
        diagnostics = brain.validate_records([first, second], [])
        self.assertFalse(any(item["code"] == "BRAIN-E018" for item in diagnostics))
        forward, reverse = brain.build_graph([first, second])
        self.assertIn("DEC-9003", forward["DEC-9002"])
        self.assertIn("DEC-9002", reverse["DEC-9003"])
        del second.metadata["supersedes"]
        self.assertTrue(any(item["code"] == "BRAIN-E018" for item in brain.validate_records([first, second], [])))

    def test_06_BRAIN_AT_006_generated_file_protection(self) -> None:
        generated = [record for record in self.records if record.metadata.get("information_class") == "generated"]
        self.assertGreaterEqual(len(generated), 60)
        for record in generated:
            self.assertEqual(record.metadata.get("edit_policy"), "do_not_edit")
            self.assertTrue(record.metadata.get("generator"))
            self.assertTrue(record.metadata.get("generation_version"))
            self.assertTrue(record.metadata.get("generated_at"))
        self.assertTrue(brain.run_ingest(False)[0])

    def test_07_BRAIN_AT_007_work_record_lifecycle(self) -> None:
        self.assertEqual(self.schema["record_types"]["work"], ["planned", "active", "blocked", "complete", "cancelled"])
        work = self.by_id["WORK-20260905-004"]
        self.assertEqual(work.metadata["status"], "complete")
        self.assertIn("R4 Project Brain v0.1 is operational and certified", work.body)
        headings = ["Objective", "Starting State", "Authority Consulted", "Work Performed", "Result", "Decisions", "Verification", "Discoveries & Lessons", "Failures / Problems", "Remaining Work", "Handoff"]
        for heading in headings:
            self.assertIn(f"## {heading}", work.body)

    def test_08_BRAIN_AT_008_handoff_continuation(self) -> None:
        root = self.by_id["CURRENT-HANDOFF"]
        handoff = self.by_id[root.metadata["current_handoff"]]
        self.assertEqual(handoff.metadata["status"], "active")
        self.assertEqual(handoff.metadata["from_work"], "WORK-20260905-004")
        self.assertEqual(handoff.metadata["next_gate"], "R5")
        for heading in ("Completed State", "Start Here", "Next Gate", "Open Items", "Boundary", "Verification"):
            self.assertIn(f"## {heading}", handoff.body)

    def test_09_BRAIN_AT_009_adr_decision_lifecycle(self) -> None:
        self.assertEqual(self.schema["record_types"]["decision"], ["proposed", "accepted", "superseded", "rejected"])
        decision = self.by_id["DEC-0001"]
        self.assertEqual(decision.metadata["status"], "proposed")
        self.assertEqual(decision.metadata["authority_status"], "proposed")
        self.assertIn("agent has no delegated authority", decision.body)

    def test_10_BRAIN_AT_010_skill_validation_and_provenance(self) -> None:
        skill = self.by_id["SKILL-0001"]
        self.assertEqual(skill.metadata["status"], "candidate")
        self.assertEqual(skill.metadata["authority_status"], "proposed")
        self.assertIn("EVID-0001", skill.metadata["derived_from"])
        self.assertIn("Trigger", skill.body)
        self.assertIn("Procedure", skill.body)

    def test_11_BRAIN_AT_011_requirement_traceability(self) -> None:
        requirement = self.by_id["REQ-BRAIN-HEADLESS-001"]
        self.assertIn("DOC-LF-BRAIN-11", requirement.metadata["derived_from"])
        self.assertIn("DEC-0001", requirement.metadata["decisions"])
        self.assertIn("ARCH-BRAIN-HEADLESS-TOOLING", requirement.metadata["architecture"])
        self.assertIn("MOD-BRAIN-CLI", requirement.metadata["implemented_by"])
        self.assertIn("TEST-BRAIN-ACCEPTANCE", requirement.metadata["tested_by"])

    def test_12_BRAIN_AT_012_forward_traceability(self) -> None:
        self.assertTrue({"REQ-BRAIN-HEADLESS-001", "SYS-PROJECT-BRAIN"}.issubset(self.forward["DOC-LF-BRAIN-11"]))
        self.assertIn("ARCH-BRAIN-HEADLESS-TOOLING", self.forward["REQ-BRAIN-HEADLESS-001"])
        self.assertIn("MOD-BRAIN-CLI", self.forward["ARCH-BRAIN-HEADLESS-TOOLING"])
        self.assertIn("TEST-BRAIN-ACCEPTANCE", self.forward["MOD-BRAIN-CLI"])
        self.assertIn("EVID-0001", self.forward["TEST-BRAIN-ACCEPTANCE"])

    def test_13_BRAIN_AT_013_reverse_traceability(self) -> None:
        self.assertIn("DOC-LF-BRAIN-11", self.reverse["REQ-BRAIN-HEADLESS-001"])
        self.assertIn("ARCH-BRAIN-HEADLESS-TOOLING", self.reverse["MOD-BRAIN-CLI"])
        self.assertIn("TEST-BRAIN-ACCEPTANCE", self.reverse["EVID-0001"])
        self.assertIn("SKILL-0001", self.reverse["EVID-0001"])

    def test_14_BRAIN_AT_014_legacy_source_classification(self) -> None:
        registry, proxies = brain.build_source_inventory()
        self.assertEqual(registry["artifact_count"], 441)
        self.assertEqual(registry["markdown_count"], 402)
        historical = [item for item in registry["artifacts"] if item["declared_status"] == "historical"]
        self.assertTrue(historical)
        self.assertTrue(any("/OLD/" in item["path"] or "/ARCHIVED/" in item["path"] for item in historical))
        self.assertLess(len(proxies), registry["artifact_count"])

    def test_15_BRAIN_AT_015_conflict_surfacing(self) -> None:
        missing = self.by_id["CONFLICT-0001"]
        broader = self.by_id["CONFLICT-0002"]
        self.assertEqual(missing.metadata["status"], "detected")
        self.assertIn("PRD-05", missing.metadata["title"])
        self.assertEqual(broader.metadata["authority_status"], "unresolved")
        self.assertFalse((brain.REPO_ROOT / ".summer/00_Docs/PRD/PRD-05.md").exists())

    def test_16_BRAIN_AT_016_headless_brain_doctor(self) -> None:
        result = brain.run_doctor("full")
        self.assertEqual(result["status"], "PASS", result["items"])
        query = subprocess.run([sys.executable, str(SCRIPT), "query", "--type", "document", "--format", "json"], cwd=brain.REPO_ROOT, text=True, capture_output=True)
        self.assertEqual(query.returncode, 0, query.stderr)
        self.assertGreaterEqual(len(json.loads(query.stdout)), 45)

    def test_17_BRAIN_AT_017_deterministic_index_generation(self) -> None:
        self.assertEqual(brain.expected_index_outputs(), brain.expected_index_outputs())
        self.assertEqual(len(brain.expected_index_outputs()), 17)
        self.assertTrue(brain.run_index(False)[0])

    def test_18_BRAIN_AT_018_git_ci_validation(self) -> None:
        workflow = brain.REPO_ROOT / ".github/workflows/brain.yml"
        self.assertTrue(workflow.is_file())
        workflow_text = workflow.read_text(encoding="utf-8")
        self.assertIn("doctor --profile certification", workflow_text)
        self.assertIn("verify_rebuild_boundary.py", workflow_text)
        boundary = subprocess.run([sys.executable, "tools/verify_rebuild_boundary.py"], cwd=brain.REPO_ROOT, text=True, capture_output=True)
        self.assertEqual(boundary.returncode, 0, boundary.stderr)

    def test_19_BRAIN_AT_019_no_plugin_core_operation(self) -> None:
        self.assertEqual(brain.load_json(brain.BRAIN_ROOT / ".obsidian/community-plugins.json"), [])
        migration = subprocess.run([sys.executable, str(SCRIPT), "migrate", "--check", "--target", "1"], cwd=brain.REPO_ROOT, text=True, capture_output=True)
        self.assertEqual(migration.returncode, 0, migration.stderr)
        self.assertEqual(json.loads(migration.stdout)["status"], "PASS")

    def test_20_BRAIN_AT_020_fresh_agent_continuation(self) -> None:
        agents = self.by_id["AGENTS"].body
        sequence = ["Read this contract", "Read [[CURRENT-HANDOFF]]", "Read [[HOME]]", "Open the relevant generated index"]
        positions = [agents.index(item) for item in sequence]
        self.assertEqual(positions, sorted(positions))
        handoff = self.by_id[self.by_id["CURRENT-HANDOFF"].metadata["current_handoff"]]
        self.assertIn("R5", handoff.body)
        self.assertIn("R8 gameplay permission remains closed", handoff.body)
        for canvas in (brain.BRAIN_ROOT / "81_CANVAS").glob("*.canvas"):
            data = json.loads(canvas.read_text(encoding="utf-8"))
            for node in data["nodes"]:
                if node["type"] == "file":
                    self.assertTrue((brain.BRAIN_ROOT / node["file"]).is_file(), node["file"])


if __name__ == "__main__":
    unittest.main()
