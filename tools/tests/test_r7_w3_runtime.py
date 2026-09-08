"""Regression contracts for the governed R7 W3 readiness surface."""

from __future__ import annotations

import json
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from proofs.r7.w3.runtime.model import FluidDomain, VesselFixture
from proofs.r7.w3.runtime.runner import PROOF_DEFINITIONS, PROOF_IDS, RUNNERS
from tools.r7_w3_runtime.dependencies import ROOT, reference_issues
from tools.r7_w3_runtime.admission import admitted_paths
from tools.r7_w3_runtime.execution_plan import (
    ExecutionRegistryError,
    execution_plan_for_actual_run,
    inspect_execution_registry,
    preview_execution_plan,
)
from tools.r7_w3_runtime.execution import certification_record_issues
from tools.r7_w3_runtime.readiness import readiness_report


EXPECTED_PROOFS = (
    "PRD04-PROOF-08",
    "PRD04-PROOF-27",
    "PRD04-PROOF-28",
    "PRD04-PROOF-29",
    "PRD04-PROOF-30",
    "PRD04-PROOF-31",
    "PRD04-PROOF-32",
)
W2_PROOFS = {
    "PRD04-PROOF-07", "PRD04-PROOF-09", "PRD04-PROOF-20", "PRD04-PROOF-35",
    "PRD04-PROOF-36", "PRD04-PROOF-37", "PRD04-PROOF-38", "PRD04-PROOF-39",
    "PRD04-PROOF-40", "PRD04-PROOF-41", "PRD04-PROOF-42", "PRD04-PROOF-43",
    "PRD04-PROOF-44", "PRD04-PROOF-45", "PRD04-PROOF-46", "PRD04-PROOF-47",
    "PRD04-PROOF-48", "PRD04-PROOF-57", "PRD04-PROOF-58", "PRD04-PROOF-69",
}


class R7W3RuntimeTests(unittest.TestCase):
    def test_w3_exposes_exact_authorised_proof_set(self) -> None:
        self.assertEqual(EXPECTED_PROOFS, tuple(PROOF_IDS))
        self.assertEqual(set(EXPECTED_PROOFS), set(PROOF_DEFINITIONS))
        self.assertEqual(set(EXPECTED_PROOFS), set(RUNNERS))
        self.assertFalse(set(RUNNERS) & W2_PROOFS)

    def test_definitions_are_complete_and_use_authorised_fixtures(self) -> None:
        expected_fixtures = {
            "PRD04-PROOF-08": ("FIXTURE-06",),
            "PRD04-PROOF-27": ("FIXTURE-02", "FIXTURE-06"),
            "PRD04-PROOF-28": ("FIXTURE-02", "FIXTURE-06"),
            "PRD04-PROOF-29": ("FIXTURE-06",),
            "PRD04-PROOF-30": ("FIXTURE-06", "FIXTURE-05"),
            "PRD04-PROOF-31": ("FIXTURE-06", "FIXTURE-09"),
            "PRD04-PROOF-32": ("FIXTURE-06",),
        }
        for proof_id, definition in PROOF_DEFINITIONS.items():
            self.assertEqual(expected_fixtures[proof_id], definition.fixtures)
            self.assertTrue(definition.question)
            self.assertTrue(definition.risk_consumers)
            self.assertTrue(definition.procedure)
            self.assertTrue(definition.observables)
            self.assertTrue(definition.pass_criteria)
            self.assertTrue(definition.fail_criteria)
            self.assertTrue(definition.inconclusive_conditions)
            self.assertTrue(definition.invalidation_conditions)
            self.assertTrue(definition.evidence)

    def test_dependency_reference_is_exact_and_proof_only(self) -> None:
        self.assertEqual((), reference_issues())
        self.assertTrue((ROOT / "proofs/r7/w3/server_probe/project.godot").is_file())
        self.assertFalse((ROOT / "project.godot").exists())

    def test_export_probe_declares_only_w3_proofs_and_proof_capabilities(self) -> None:
        source = (ROOT / "proofs/r7/w3/server_probe/src/main.gd").read_text(encoding="utf-8")
        self.assertEqual(7, sum(source.count(f'"{proof_id}"') for proof_id in EXPECTED_PROOFS))
        self.assertFalse([proof_id for proof_id in W2_PROOFS if proof_id in source])
        self.assertIn('"production_runtime": false', source)
        self.assertIn('"physics_authority": "EXECUTION-EVIDENCE-ONLY"', source)

    def test_fluid_fixture_conserves_partition_exchange_and_rejects_stale_work(self) -> None:
        fluid = FluidDomain({"left": 700, "right": 300}, tolerance=0)
        token = fluid.begin_exchange("left", "right", 125)
        self.assertEqual("COMMITTED", fluid.commit_exchange(token)["state"])
        stale = fluid.begin_exchange("left", "right", 50)
        fluid.set_volume("left", fluid.volumes["left"])
        self.assertEqual("STALE-QUARANTINED", fluid.commit_exchange(stale)["state"])
        self.assertEqual(1000, fluid.accounted_total())

    def test_ocean_reservoir_is_accounted_and_active_domain_stays_bounded(self) -> None:
        fluid = FluidDomain({"cave": 0}, active_cell_limit=32, tolerance=0)
        fluid.exchange_with_reservoir("cave", 24, reservoir="ocean")
        self.assertEqual(24, fluid.volumes["cave"])
        self.assertEqual(24, fluid.reservoir_flux)
        self.assertLessEqual(fluid.active_cells, 32)

    def test_vessel_crossing_preserves_local_identity_and_rejects_old_owner(self) -> None:
        vessel = VesselFixture.basic()
        before = vessel.hull_hash()
        old_owner = vessel.owner_token()
        vessel.cross_region("region.beta")
        self.assertEqual(before, vessel.hull_hash())
        self.assertEqual("STALE-OWNER-REJECTED", vessel.publish_owner_result(old_owner))
        self.assertEqual(1, vessel.current_owner_count)

    def test_hull_edit_quarantines_stale_derived_publication(self) -> None:
        vessel = VesselFixture.basic()
        stale = vessel.begin_derived_rebuild("collision")
        vessel.edit_hull("remove", (0, 0, 0))
        self.assertEqual("STALE-QUARANTINED", vessel.publish_derived(stale))
        current = vessel.begin_derived_rebuild("collision")
        self.assertEqual("PUBLISHED", vessel.publish_derived(current))
        self.assertEqual(vessel.hull_revision, vessel.derived_revisions["collision"])

    def test_occupant_frame_projection_applies_vessel_motion_once(self) -> None:
        vessel = VesselFixture.basic()
        vessel.board("occupant.1", (2.0, 0.0, 0.0))
        before = vessel.occupant_world_position("occupant.1")
        vessel.move((10.0, 0.0, 0.0), quarter_turns=1)
        after = vessel.occupant_world_position("occupant.1")
        self.assertEqual((2.0, 0.0, 0.0), before)
        self.assertEqual((10.0, 0.0, 2.0), after)
        self.assertEqual((2.0, 0.0, 0.0), vessel.occupants["occupant.1"])

    def test_flooding_repair_stops_ingress_without_deleting_water(self) -> None:
        vessel = VesselFixture.basic()
        vessel.open_breach("breach.1", rate=8)
        vessel.advance_flooding(5)
        contained = vessel.contained_water
        vessel.repair_breach("breach.1")
        vessel.advance_flooding(5)
        self.assertEqual(40, contained)
        self.assertEqual(contained, vessel.contained_water)
        self.assertEqual(vessel.base_mass + contained, vessel.total_mass)

    def test_registry_high_water_and_preview_are_side_effect_free(self) -> None:
        before = sorted((ROOT / "docs/rebuild/r7/execution-evidence").iterdir())
        registry = inspect_execution_registry(ROOT)
        plan = preview_execution_plan(ROOT)
        after = sorted((ROOT / "docs/rebuild/r7/execution-evidence").iterdir())
        self.assertEqual(50, registry.max_run_number)
        self.assertEqual(50, registry.max_evidence_number)
        self.assertEqual("PRD07-RUN-0051", plan[0].run_id)
        self.assertEqual("PRD07-EVID-0051", plan[0].evidence_id)
        self.assertEqual(7, len({row.run_id for row in plan}))
        self.assertEqual(7, len({row.evidence_id for row in plan}))
        self.assertFalse({row.run_id for row in plan} & set(registry.run_ids))
        self.assertFalse({row.evidence_id for row in plan} & set(registry.evidence_ids))
        self.assertEqual(before, after)

    def test_actual_allocation_requires_explicit_future_execution_authority(self) -> None:
        with self.assertRaises(ExecutionRegistryError):
            execution_plan_for_actual_run(ROOT, actual_execution_authorized=False)

    def test_certification_allows_a_later_exact_admission_commit(self) -> None:
        implementation_commit = "a" * 40
        readiness = {
            "status": "PASS",
            "implementation_commit": implementation_commit,
            "implementation_commit_source_match": True,
            "allocated_run_ids": [],
            "allocated_evidence_ids": [],
            "proofs": [{"proof_id": proof_id, "state": "READY"} for proof_id in PROOF_IDS],
        }
        boundary = {
            "implementation_commit": implementation_commit,
            "proof_execution": "NOT-STARTED",
            "allocated_run_ids": [],
            "allocated_evidence_ids": [],
        }
        self.assertEqual((), certification_record_issues(readiness, boundary, dict(boundary)))
        stale_boundary = dict(boundary, implementation_commit="b" * 40)
        self.assertTrue(certification_record_issues(readiness, stale_boundary, dict(boundary)))

    def test_ambiguous_registry_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            state_dir = root / "docs/rebuild/r7"
            evidence_dir = state_dir / "execution-evidence/PRD07-RUN-0001"
            evidence_dir.mkdir(parents=True)
            (state_dir / "w0-execution-state.json").write_text(json.dumps({
                "allocated_run_ids": ["PRD07-RUN-0001"],
                "allocated_evidence_ids": ["PRD07-EVID-0001"],
                "proofs": [{"proof_id": "PRD04-PROOF-01", "run_id": "PRD07-RUN-0001", "evidence_id": "PRD07-EVID-0001"}],
            }), encoding="utf-8")
            (evidence_dir / "run.json").write_text(json.dumps({
                "run_id": "PRD07-RUN-0001", "evidence_id": "PRD07-EVID-0002", "proof_id": "PRD04-PROOF-01"
            }), encoding="utf-8")
            with self.assertRaises(ExecutionRegistryError):
                inspect_execution_registry(root)

    def test_duplicate_allocated_identity_fails_closed(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            state_dir = root / "docs/rebuild/r7"
            state_dir.mkdir(parents=True)
            (state_dir / "w0-execution-state.json").write_text(json.dumps({
                "allocated_run_ids": ["PRD07-RUN-0001", "PRD07-RUN-0001"],
                "allocated_evidence_ids": ["PRD07-EVID-0001", "PRD07-EVID-0001"],
                "proofs": [{"proof_id": "PRD04-PROOF-01", "run_id": "PRD07-RUN-0001", "evidence_id": "PRD07-EVID-0001"}],
            }), encoding="utf-8")
            with self.assertRaises(ExecutionRegistryError):
                inspect_execution_registry(root)

    def test_registry_accepts_unallocated_not_run_rows_without_consuming_ids(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            state_dir = root / "docs/rebuild/r7"
            pack_dir = state_dir / "execution-evidence/PRD07-RUN-0001"
            pack_dir.mkdir(parents=True)
            (state_dir / "w3-execution-state.json").write_text(json.dumps({
                "allocated_run_ids": ["PRD07-RUN-0001"],
                "allocated_evidence_ids": ["PRD07-EVID-0001"],
                "proofs": [
                    {"proof_id": "PRD04-PROOF-27", "run_id": "PRD07-RUN-0001", "evidence_id": "PRD07-EVID-0001", "state": "PASS-OBSERVED"},
                    {"proof_id": "PRD04-PROOF-28", "state": "NOT-RUN"},
                ],
            }), encoding="utf-8")
            (pack_dir / "run.json").write_text(json.dumps({
                "run_id": "PRD07-RUN-0001", "evidence_id": "PRD07-EVID-0001", "proof_id": "PRD04-PROOF-27"
            }), encoding="utf-8")
            registry = inspect_execution_registry(root)
            self.assertEqual(("PRD07-RUN-0001",), registry.run_ids)
            self.assertEqual(("PRD07-EVID-0001",), registry.evidence_ids)

    def test_initial_plan_fails_closed_if_any_w3_identity_already_exists(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            state_dir = root / "docs/rebuild/r7"
            pack_dir = state_dir / "execution-evidence/PRD07-RUN-0001"
            pack_dir.mkdir(parents=True)
            row = {"proof_id": "PRD04-PROOF-27", "run_id": "PRD07-RUN-0001", "evidence_id": "PRD07-EVID-0001", "state": "PASS-OBSERVED"}
            (state_dir / "w3-execution-state.json").write_text(json.dumps({
                "allocated_run_ids": [row["run_id"]],
                "allocated_evidence_ids": [row["evidence_id"]],
                "proofs": [row],
            }), encoding="utf-8")
            (pack_dir / "run.json").write_text(json.dumps(row), encoding="utf-8")
            with self.assertRaises(ExecutionRegistryError):
                preview_execution_plan(root)

    def test_readiness_verifies_definitions_mappings_and_consumes_no_ids(self) -> None:
        with patch("tools.r7_w3_runtime.readiness._commit_source_issues", return_value=[]):
            report = readiness_report("0" * 40, check_local=False)
        self.assertEqual("PASS", report["status"])
        self.assertEqual([], report["allocated_run_ids"])
        self.assertEqual([], report["allocated_evidence_ids"])
        self.assertEqual(7, len(report["proofs"]))
        for row in report["proofs"]:
            self.assertTrue(row["authoritative_definition_present"])
            self.assertTrue(row["fixture_present"])
            self.assertTrue(row["runner_mapping_present"])
            self.assertTrue(row["execution_plan_mapping_valid"])
            self.assertTrue(row["future_evidence_allocation_safe"])
            self.assertEqual("READY — MINIMUM FIXTURE ADDED", row["readiness_classification"])

    def test_readiness_rejects_an_unresolved_source_commit(self) -> None:
        report = readiness_report("0" * 40, check_local=False)
        self.assertEqual("FAIL", report["status"])
        self.assertFalse(report["implementation_commit_source_match"])

    def test_w3_admission_is_exact_and_contains_no_historical_w2_pack(self) -> None:
        paths = admitted_paths()
        allowed_exact = {
            "tools/tests/test_r7_w3_runtime.py",
            "docs/rebuild/r7/w3-readiness-corrected.json",
            "docs/rebuild/r7/w3-execution-state.json",
            "docs/rebuild/r7/w3-execution-completion-receipt.json",
        }
        self.assertTrue(paths)
        self.assertTrue(all(
            path.startswith(("proofs/r7/w3/", "tools/r7_w3_runtime/")) or path in allowed_exact
            for path in paths
        ))
        self.assertFalse(any("PRD07-RUN-003" in path or "PRD07-RUN-004" in path or "PRD07-RUN-0050" in path for path in paths))

    def test_clean_rebuild_boundary_uses_hash_pinned_w3_admission(self) -> None:
        source = (ROOT / "tools/verify_rebuild_boundary.py").read_text(encoding="utf-8")
        self.assertIn("w3-execution-boundary-corrected.json", source)
        self.assertIn("or rel in w3_admitted_paths", source)
        self.assertNotIn("or rel.startswith('proofs/r7/w3/')", source)
        self.assertNotIn("or rel.startswith('tools/r7_w3_runtime/')", source)
    def test_w3_sources_do_not_embed_w2_proof_or_issued_identity_mappings(self) -> None:
        stale_tokens = W2_PROOFS | {
            *(f"PRD07-RUN-{number:04d}" for number in range(31, 51)),
            *(f"PRD07-EVID-{number:04d}" for number in range(31, 51)),
        }
        for relative in (
            "proofs/r7/w3/runtime/runner.py",
            "tools/r7_w3_runtime/execution.py",
            "tools/r7_w3_runtime/execution_plan.py",
        ):
            source = (ROOT / relative).read_text(encoding="utf-8")
            self.assertFalse([token for token in stale_tokens if token in source], relative)

    def test_w3_python_sources_are_utf8_not_utf16(self) -> None:
        for relative in (
            "proofs/r7/w3/runtime/runner.py",
            "tools/r7_w3_runtime/execution.py",
            "tools/r7_w3_runtime/execution_plan.py",
        ):
            self.assertFalse((ROOT / relative).read_bytes().startswith((b"\xff\xfe", b"\xfe\xff")))


if __name__ == "__main__":
    unittest.main()
