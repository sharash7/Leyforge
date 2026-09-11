from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from tools.r7_w4_runtime.admission import admitted_paths, manifest_issues
from tools.r7_w4_runtime.authority import ROOT, W4_PROOF_IDS, authority_issues, proof_contracts
from tools.r7_w4_runtime.execution_plan import allocation_issues, preview_execution_plan, registry_snapshot
from tools.r7_w4_runtime.fixtures import EXPECTED_FCC_OUTCOMES, build_fcc_expected, fixture_issues
from tools.r7_w4_runtime.readiness import ROUTES, readiness_report


class R7W4ReadinessTests(unittest.TestCase):
    def test_canonical_roster_and_prd04_mappings_are_exact(self) -> None:
        contracts = proof_contracts()
        self.assertEqual(15, len(contracts))
        self.assertEqual(W4_PROOF_IDS, tuple(row["proof_id"] for row in contracts))
        self.assertTrue(all(row["title_match"] for row in contracts))
        self.assertEqual((), authority_issues(contracts))

    def test_every_proof_has_complete_observation_contract(self) -> None:
        for row in proof_contracts():
            self.assertTrue(row["question"])
            self.assertTrue(row["measurement"])
            self.assertTrue(row["success_criterion"])
            self.assertTrue(row["failure_criterion"])
            self.assertTrue(row["inconclusive_conditions"])
            self.assertTrue(row["required_repetition"])
            self.assertTrue(row["required_evidence_artifacts"])
            self.assertEqual(row["prd06_consumer_count_declared"], len(row["prd06_consumers"]))

    def test_fixture_expansions_are_complete_and_nonproduction(self) -> None:
        self.assertEqual((), fixture_issues())
        for relative in ("proofs/r7/w4/fixture-07/manifest.json", "proofs/r7/w4/fixture-08/manifest.json"):
            value = json.loads((ROOT / relative).read_text(encoding="utf-8"))
            self.assertFalse(value["production_runtime"])
            self.assertEqual("CLOSED", value["gameplay_permission"])
            self.assertEqual("NOT-STARTED", value["proof_execution"])

    def test_fcc13e_boundary_is_full_exact_and_unobserved(self) -> None:
        value = build_fcc_expected()
        self.assertEqual(312, value["row_count"])
        self.assertEqual(list(range(1, 313)), value["numeric_id_sequence"])
        self.assertEqual(dict(sorted(EXPECTED_FCC_OUTCOMES.items())), value["final_status_counts"])
        self.assertEqual(312, len({row["unique_id"] for row in value["rows"]}))
        self.assertTrue(all(row["observation_status"] == "NOT-EXECUTED" for row in value["rows"]))

    def test_preview_is_exact_and_side_effect_free(self) -> None:
        state_path = ROOT / "docs/rebuild/r7/w4-execution-state.json"
        if state_path.is_file():
            state = json.loads(state_path.read_text(encoding="utf-8-sig"))
            self.assertEqual(
                ["PRD07-RUN-{0:04d}".format(number) for number in range(66, 81)],
                state.get("allocated_run_ids"),
            )
            self.assertEqual(
                ["PRD07-EVID-{0:04d}".format(number) for number in range(66, 81)],
                state.get("allocated_evidence_ids"),
            )
            self.assertTrue(
                all(row.get("state") in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"} for row in state.get("proofs", []))
            )
            return
        before = registry_snapshot()
        plan = preview_execution_plan()
        after = registry_snapshot()
        self.assertEqual(before, after)
        self.assertEqual(15, len(plan))
        self.assertEqual(list(W4_PROOF_IDS), [row["proof_id"] for row in plan])
        self.assertEqual(["PRD07-RUN-{0:04d}".format(number) for number in range(66,81)], [row["run_id"] for row in plan])
        self.assertTrue(all(row["identity_state"] == "PREVIEW-NOT-ALLOCATED" for row in plan))
        self.assertEqual((), allocation_issues())

    def test_readiness_runtime_cannot_execute_and_governed_executor_is_separate(self) -> None:
        cli = (ROOT / "tools/r7_w4_runtime/cli.py").read_text(encoding="utf-8")
        self.assertNotIn('add_parser("execute")', cli)
        self.assertFalse((ROOT / "tools/r7_w4_runtime/execution.py").exists())
        executor = ROOT / "tools/r7_w4_execution/execution.py"
        if (ROOT / "docs/rebuild/r7/w4-execution-state.json").exists():
            self.assertTrue(executor.is_file())
            self.assertTrue((ROOT / "docs/rebuild/r7/w4-governed-execution-source-boundary.json").is_file())

    def test_fixture08_readiness_script_refuses_normal_execution(self) -> None:
        source = (ROOT / "proofs/r7/w4/presentation_probe/src/main.gd").read_text(encoding="utf-8")
        self.assertIn('"proof_execution_started": false', source)
        self.assertIn('"identity_allocation_started": false', source)
        self.assertIn('"production_runtime": false', source)
        self.assertIn("REFUSED", source)

    def test_all_proofs_have_explicit_tooling_routes(self) -> None:
        self.assertEqual(set(W4_PROOF_IDS), set(ROUTES))
        self.assertTrue(all(route and roles for route, roles, _human in ROUTES.values()))

    def test_readiness_can_only_pass_all_fifteen_without_allocation(self) -> None:
        if (ROOT / "docs/rebuild/r7/w4-execution-state.json").is_file():
            stored = json.loads((ROOT / "docs/rebuild/r7/w4-readiness.json").read_text(encoding="utf-8-sig"))
            self.assertEqual("PASS", stored.get("status"))
            self.assertEqual("NOT-STARTED", stored.get("proof_execution"))
            self.assertEqual([], stored.get("allocated_run_ids"))
            self.assertEqual([], stored.get("allocated_evidence_ids"))
            return
        receipt = {
            "schema_version":"prd07-w4-fixture-readiness-validation-v1", "status":"PASS",
            "implementation_commit":"0"*40, "dynamic_readiness_self_report":{"performed":True,"status":"PASS"},
            "before_execution_authority":{}, "after_execution_authority":{}, "proof_execution":"NOT-STARTED",
            "allocated_run_ids":[], "allocated_evidence_ids":[], "fcc13e":{"coverage":"312/312"},
        }
        with patch("tools.r7_w4_runtime.readiness._commit_source_issues", return_value=[]), patch(
            "tools.r7_w4_runtime.readiness._w3_terminal_issues", return_value=()
        ), patch("tools.r7_w4_runtime.readiness._fixture_receipt_issues", return_value=()), patch(
            "tools.r7_w4_runtime.readiness.local_dependency_report", return_value={"status":"PASS","issues":[],"paths":{}}
        ):
            value = readiness_report("0"*40, check_local=False)
        self.assertEqual("PASS", value["status"])
        self.assertEqual({"READY":15,"BLOCKED":0,"NOT APPLICABLE":0}, value["readiness_counts"])
        self.assertEqual("NOT-STARTED", value["proof_execution"])
        self.assertEqual([], value["allocated_run_ids"])
        self.assertEqual([], value["allocated_evidence_ids"])

    def test_future_evidence_schema_requires_observed_terminal_state(self) -> None:
        schema = json.loads((ROOT / "proofs/r7/w4/future-evidence-pack.schema.json").read_text(encoding="utf-8"))
        states = schema["properties"]["observation"]["properties"]["state"]["enum"]
        self.assertEqual(["PASS-OBSERVED","FAIL-OBSERVED","INCONCLUSIVE"], states)
        self.assertNotIn("READY", states)

    def test_admission_path_enumeration_is_narrow(self) -> None:
        paths = admitted_paths()
        self.assertTrue(paths)
        allowed = {"tools/tests/test_r7_w4_runtime.py","tools/r7_w4_audit.py","tools/r7_w3_reconciliation.py","tools/verify.py","tools/verify_rebuild_boundary.py","docs/rebuild/r7/w4-fixture-readiness-validation.json","docs/rebuild/r7/w4-readiness.json"}
        self.assertTrue(all(path.startswith(("proofs/r7/w4/","tools/r7_w4_runtime/")) or path in allowed for path in paths))
        self.assertFalse(any(path.startswith("docs/rebuild/r7/execution-evidence/PRD07-RUN-006") for path in paths))


if __name__ == "__main__":
    unittest.main()
