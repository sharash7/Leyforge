"""Tests for the governed R7 W0 dependency/export proof runtime."""

from __future__ import annotations

import json
import re
import unittest
from pathlib import Path

from tools.r7_w0_runtime.architecture import ROOT, lint, load_rules, validate_rules
from tools.r7_w0_runtime.dependencies import load_lock, static_lock_issues
from tools.r7_w0_runtime.execution import PROOF_PLAN


class R7W0RuntimeTests(unittest.TestCase):
    def test_dependency_lock_is_exact_and_proof_only(self) -> None:
        lock = load_lock()
        self.assertEqual((), static_lock_issues(lock))
        self.assertEqual("CLOSED", lock["gameplay_permission"])
        self.assertEqual("NO-LOCAL-PATCH", lock["local_patch_status"])
        self.assertEqual("v1.7x", lock["components"]["voxel_tools"]["tag"])

    def test_runtime_is_nested_and_root_game_project_remains_absent(self) -> None:
        runtime = ROOT / "proofs/r7/w0/runtime"
        self.assertTrue((runtime / "project.godot").is_file())
        self.assertTrue((runtime / "main.tscn").is_file())
        self.assertFalse((ROOT / "project.godot").exists())

    def test_governed_runtime_passes_architecture_lint(self) -> None:
        report = lint()
        self.assertEqual("PASS", report["status"], report)
        self.assertEqual([], report["findings"])

    def test_every_architecture_rule_has_positive_and_negative_fixture(self) -> None:
        rules = load_rules()
        self.assertEqual((), validate_rules(rules))
        fixture_root = ROOT / "tools/tests/fixtures/r7_architecture"
        good = lint(fixture_root / "good", rules)
        bad = lint(fixture_root / "bad", rules)
        expected = {item["rule_id"] for item in rules["rules"]}
        observed = {item["rule_id"] for item in bad["findings"]}
        self.assertEqual("PASS", good["status"], good)
        self.assertEqual(expected, observed, bad)

    def test_proof_plan_allocates_all_w0_ids_once_in_execution_order(self) -> None:
        self.assertEqual(13, len(PROOF_PLAN))
        proofs = [row[0] for row in PROOF_PLAN]
        runs = [row[1] for row in PROOF_PLAN]
        evidence = [row[2] for row in PROOF_PLAN]
        self.assertEqual(13, len(set(proofs)))
        self.assertEqual(13, len(set(runs)))
        self.assertEqual(13, len(set(evidence)))
        self.assertEqual([f"PRD07-RUN-{index:04d}" for index in range(1, 14)], runs)
        self.assertEqual([f"PRD07-EVID-{index:04d}" for index in range(1, 14)], evidence)

    def test_execution_state_is_valid_when_present(self) -> None:
        path = ROOT / "docs/rebuild/r7/w0-execution-state.json"
        if not path.exists():
            self.skipTest("execution state is created only by actual governed execution")
        state = json.loads(path.read_text(encoding="utf-8-sig"))
        self.assertEqual("prd07-w0-execution-state-v1", state["schema_version"])
        self.assertEqual("CLOSED", state["gameplay_permission"])
        self.assertEqual("CLOSED", state["prd08_evaluation"])
        self.assertEqual(13, len(state["proofs"]))
        self.assertEqual(13, len(state["allocated_run_ids"]))
        self.assertEqual(13, len(state["allocated_evidence_ids"]))
        for row in state["proofs"]:
            self.assertIn(row["state"], {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"})
            self.assertRegex(row["run_id"], r"^PRD07-RUN-[0-9]{4}$")
            self.assertRegex(row["evidence_id"], r"^PRD07-EVID-[0-9]{4}$")


if __name__ == "__main__":
    unittest.main()
