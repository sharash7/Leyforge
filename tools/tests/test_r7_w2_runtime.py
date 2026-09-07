"""Contract tests for the governed R7 W2 proof runtime."""

from __future__ import annotations

import json
import unittest

from proofs.r7.w2.runtime.model import (
    AdmissionController,
    BoundedTrafficQueue,
    CRASH_PHASES,
    CheckpointStore,
    MigrationEngine,
    OperationLedger,
    WorldSessionGuard,
)
from proofs.r7.w2.runtime.runner import PROOF_IDS
from tools.r7_w2_runtime.dependencies import ROOT, reference_issues
from tools.r7_w2_runtime.execution_plan import PROOF_PLAN


class R7W2RuntimeTests(unittest.TestCase):
    def test_dependency_reference_is_exact_and_proof_only(self) -> None:
        self.assertEqual((), reference_issues())

    def test_w2_runtime_is_nested_and_root_project_remains_absent(self) -> None:
        self.assertTrue((ROOT / "proofs/r7/w2/server_probe/project.godot").is_file())
        self.assertTrue((ROOT / "proofs/r7/w2/runtime/runner.py").is_file())
        self.assertFalse((ROOT / "project.godot").exists())

    def test_proof_plan_allocates_exact_contiguous_w2_identities(self) -> None:
        self.assertEqual(20, len(PROOF_PLAN))
        self.assertEqual(set(PROOF_IDS), {row[0] for row in PROOF_PLAN})
        self.assertEqual([f"PRD07-RUN-{index:04d}" for index in range(31, 51)], [row[1] for row in PROOF_PLAN])
        self.assertEqual([f"PRD07-EVID-{index:04d}" for index in range(31, 51)], [row[2] for row in PROOF_PLAN])

    def test_world_session_guard_rejects_superseded_task(self) -> None:
        guard = WorldSessionGuard()
        guard.open("world.a")
        stale = guard.task("old")
        guard.close()
        guard.open("world.a")
        self.assertEqual("SESSION-EPOCH-REJECTED", guard.apply(stale))
        self.assertEqual("CURRENT-ACCEPTED", guard.apply(guard.task("current")))

    def test_operation_ledger_separates_commit_from_lost_ack(self) -> None:
        ledger = OperationLedger(100)
        first = ledger.command("operation.1", 7, "lose-ack")
        retry = ledger.command("operation.1", 7)
        self.assertEqual("COMMITTED", first["state"])
        self.assertFalse(first["acknowledged"])
        self.assertEqual(0, retry["semantic_effects_this_attempt"])
        self.assertEqual(1, ledger.effect_count("operation.1"))
        self.assertEqual(0, ledger.conservation_delta())

    def test_checkpoint_recovery_rejects_corrupt_newest_generation(self) -> None:
        store = CheckpointStore("world.test")
        store.publish({"revision": 1, "value": "safe"})
        store.publish({"revision": 2, "value": "new"})
        store.corrupt(2, "voxel", "bit-flip")
        recovered = store.recover(("journal", "voxel", "structured"))
        self.assertEqual("RECOVERED", recovered["status"])
        self.assertEqual(1, recovered["generation"])
        self.assertFalse(recovered["mixed_lineage"])

    def test_admission_rejects_mismatch_before_ordinary_traffic(self) -> None:
        baseline = {"protocol": "p1", "content": "c1", "schema": "s1", "world": "w1"}
        result = AdmissionController(baseline, ("core",)).admit({**baseline, "schema": "s0"}, ("core",))
        self.assertEqual("REJECT", result["decision"])
        self.assertEqual(0, result["ordinary_traffic_before_decision"])
        self.assertIn("BASELINE-SCHEMA-MISMATCH", result["reason_codes"])

    def test_bounded_queue_preserves_capacity_and_critical_progress(self) -> None:
        queue = BoundedTrafficQueue(8)
        for index in range(20):
            queue.enqueue("bulk", f"bulk.{index}")
        self.assertEqual("ADMITTED", queue.enqueue("critical", "critical.1"))
        delivered = queue.advance(1)
        self.assertEqual("critical", delivered[0]["class"])
        self.assertLessEqual(queue.snapshot()["maximum_depth"], 8)

    def test_migration_retains_unknown_identity_explicitly(self) -> None:
        result = MigrationEngine().recover_missing(("pack.unknown",), (), {})
        self.assertEqual(["pack.unknown"], result["quarantined"])
        self.assertEqual(0, result["silent_substitutions"])

    def test_real_crash_fixture_has_fourteen_exact_phase_classes(self) -> None:
        self.assertEqual(14, len(CRASH_PHASES))
        self.assertEqual(len(CRASH_PHASES), len(set(CRASH_PHASES)))
        self.assertIn("MANIFEST-PUBLISH", CRASH_PHASES)
        source = (ROOT / "proofs/r7/w2/server_probe/src/main.gd").read_text(encoding="utf-8")
        self.assertIn("crash-worker", source)
        self.assertIn("kill-ready.json", source)

    def test_execution_state_is_valid_when_present(self) -> None:
        path = ROOT / "docs/rebuild/r7/w2-execution-state.json"
        if not path.exists():
            self.skipTest("W2 execution state is created only by actual governed execution")
        state = json.loads(path.read_text(encoding="utf-8-sig"))
        self.assertEqual("prd07-w2-execution-state-v1", state["schema_version"])
        self.assertEqual("CLOSED", state["gameplay_permission"])
        self.assertEqual("CLOSED", state["prd08_evaluation"])
        self.assertEqual(20, len(state["proofs"]))
        self.assertEqual(20, len(state["allocated_run_ids"]))
        self.assertEqual(20, len(state["allocated_evidence_ids"]))
        for row in state["proofs"]:
            self.assertIn(row["state"], {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"})


if __name__ == "__main__":
    unittest.main()
