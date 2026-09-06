"""REBUILD-00 R6 Brain-to-governance pilot acceptance suite."""

from __future__ import annotations

import importlib.util
import sys
import unittest
from pathlib import Path


SCRIPT = Path(__file__).resolve().parents[1] / "r6_pilot.py"
SPEC = importlib.util.spec_from_file_location("leyforge_r6_pilot", SCRIPT)
assert SPEC and SPEC.loader
pilot = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = pilot
SPEC.loader.exec_module(pilot)


class R6PilotAcceptanceTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.receipt = pilot.evaluate()
        cls.tasks = {item["code"]: item for item in cls.receipt["tasks"]}

    def assert_task(self, code: str) -> dict:
        task = self.tasks[code]
        self.assertEqual(task["status"], "PASS", task["details"])
        return task["details"]

    def test_01_R6_AT_001_authority_lookup(self) -> None:
        details = self.assert_task("A")
        self.assertEqual(details["owning_source"], "ENG-GOV-11")
        self.assertEqual(details["owning_status"], "theoretically_locked")
        self.assertEqual(details["historical_status"], "historical")
        self.assertEqual(details["supersession"], "reciprocal")

    def test_02_R6_AT_002_work_logging(self) -> None:
        details = self.assert_task("B")
        self.assertEqual(details["work"], "WORK-20260906-002")
        self.assertEqual(details["task"], "TASK-20260906-002")
        self.assertEqual(details["undated_prefix"], "REJECTED")
        self.assertEqual(details["next_ids"]["brain_task"], details["next_ids"]["governance_task"])
        self.assertRegex(details["next_ids"]["governance_work"], r"WORK-20260906-\d{3}")
        self.assertRegex(details["next_ids"]["governance_change"], r"CHANGE-20260906-\d{3}")

    def test_03_R6_AT_003_adr_trigger(self) -> None:
        details = self.assert_task("C")
        self.assertEqual(details["synthetic_scenario"], "ADR_REQUIRED")
        self.assertEqual(details["synthetic_exit_code"], 2)
        self.assertEqual(details["actual_change"], "ADR_NOT_REQUIRED")
        self.assertEqual(details["actual_exit_code"], 0)
        self.assertFalse(details["accepted_adr_created"])

    def test_04_R6_AT_004_violation_and_waiver(self) -> None:
        details = self.assert_task("D")
        self.assertEqual(details["violation_diagnostic"], "GOV-E024")
        self.assertEqual(details["unbounded_waiver_diagnostic"], "GOV-E033")
        self.assertEqual(details["bounded_waiver"], "PASS")

    def test_05_R6_AT_005_reusable_procedure(self) -> None:
        details = self.assert_task("E")
        self.assertEqual(details["procedure"], "PROC-BRAIN-GOVERNANCE-PILOT")
        self.assertNotEqual(details["authority_role"], "primary")

    def test_06_R6_AT_006_stale_summary_repair(self) -> None:
        details = self.assert_task("F")
        self.assertTrue(details["stale_detected"])
        self.assertEqual(details["repair"], "PASS")

    def test_07_R6_AT_007_legacy_boundary(self) -> None:
        details = self.assert_task("G")
        self.assertEqual(details["classification"], "historical")
        self.assertEqual(details["current_authority"], "DOC-REBUILD-00")
        self.assertEqual(details["automatic_copy_forward"], "REJECTED")
        self.assertEqual(details["gameplay_permission"], "CLOSED")
        self.assertEqual(self.receipt["pass_count"], 7)


if __name__ == "__main__":
    unittest.main()
