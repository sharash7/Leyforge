"""Contract tests for the governed R7 W1 proof runtime."""

from __future__ import annotations

import json
import unittest

from proofs.r7.w1.runtime.model import OwnerPartition, Proposal, SpatialState, TransactionEngine
from proofs.r7.w1.runtime.runner import PROOF_IDS
from tools.r7_w1_runtime.dependencies import ROOT, reference_issues
from tools.r7_w1_runtime.execution_plan import PROOF_PLAN


class R7W1RuntimeTests(unittest.TestCase):
    def test_dependency_reference_is_exact_and_proof_only(self) -> None:
        self.assertEqual((), reference_issues())

    def test_w1_runtime_is_nested_and_root_project_remains_absent(self) -> None:
        self.assertTrue((ROOT / "proofs/r7/w1/provider_probe/project.godot").is_file())
        self.assertTrue((ROOT / "proofs/r7/w1/runtime/runner.py").is_file())
        self.assertFalse((ROOT / "project.godot").exists())

    def test_proof_plan_allocates_exact_contiguous_w1_identities(self) -> None:
        self.assertEqual(17, len(PROOF_PLAN))
        self.assertEqual(set(PROOF_IDS), {row[0] for row in PROOF_PLAN})
        self.assertEqual([f"PRD07-RUN-{index:04d}" for index in range(14, 31)], [row[1] for row in PROOF_PLAN])
        self.assertEqual([f"PRD07-EVID-{index:04d}" for index in range(14, 31)], [row[2] for row in PROOF_PLAN])

    def test_owner_revision_and_epoch_guards_reject_stale_work(self) -> None:
        owner = OwnerPartition("partition-a")
        token = owner.token()
        owner.authoritative_mutation()
        self.assertEqual("STALE-REJECTED", owner.apply(Proposal("stale", token, 1)))
        token = owner.token()
        owner.transfer("owner-b")
        self.assertEqual("OWNER-EPOCH-REJECTED", owner.apply(Proposal("old-owner", token, 1)))

    def test_transaction_is_conserved_and_retry_is_idempotent(self) -> None:
        engine = TransactionEngine(100)
        first = engine.execute("op-1", 7, mode="failure-after-commit", target="cell-1")
        retry = engine.execute("op-1", 7, target="cell-1")
        self.assertEqual("COMMITTED", first["state"])
        self.assertEqual(0, retry["semantic_effects_this_attempt"])
        self.assertEqual(0, engine.conservation_delta())

    def test_spatial_readiness_quarantines_stale_derived_state(self) -> None:
        spatial = SpatialState()
        change = spatial.edit((0, 0, 0), 1, "edit-1")
        revision = change["revision"]
        self.assertEqual("STALE-REJECTED", spatial.publish_derived("collision", (0, 0, 0), revision - 1))
        self.assertEqual("QUARANTINED", spatial.authorize_interaction("collision", (0, 0, 0)))
        self.assertEqual("CURRENT-ACCEPTED", spatial.publish_derived("collision", (0, 0, 0), revision))
        self.assertEqual("ACCEPTED", spatial.authorize_interaction("collision", (0, 0, 0)))

    def test_execution_state_is_valid_when_present(self) -> None:
        path = ROOT / "docs/rebuild/r7/w1-execution-state.json"
        if not path.exists():
            self.skipTest("W1 execution state is created only by actual governed execution")
        state = json.loads(path.read_text(encoding="utf-8-sig"))
        self.assertEqual("prd07-w1-execution-state-v1", state["schema_version"])
        self.assertEqual("CLOSED", state["gameplay_permission"])
        self.assertEqual("CLOSED", state["prd08_evaluation"])
        self.assertEqual(17, len(state["proofs"]))
        self.assertEqual(17, len(state["allocated_run_ids"]))
        self.assertEqual(17, len(state["allocated_evidence_ids"]))
        for row in state["proofs"]:
            self.assertIn(row["state"], {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"})


if __name__ == "__main__":
    unittest.main()
