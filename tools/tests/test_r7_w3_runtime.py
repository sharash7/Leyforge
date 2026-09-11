"""Regression contracts for the governed R7 W3 readiness surface."""

from __future__ import annotations

import json
import shutil
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from proofs.r7.w3.runtime.model import FluidDomain, VesselFixture
from proofs.r7.w3.runtime.runner import PROOF_DEFINITIONS, PROOF_IDS, RUNNERS
from tools.r7_w3_runtime.builds import (
    ExportedBuild,
    PROBE_SOURCE,
    fixture_launch_validation_issues,
    fixture_launch_validation_report,
    pinned_engine_validation_issues,
    pinned_engine_validation_report,
    run_fixture_probe,
)
from tools.r7_w3_runtime.dependencies import ROOT, load_lock, reference_issues, verify_local_dependencies
from tools.r7_w3_runtime.admission import admitted_paths, temporal_reconciliation_issues
from tools.r7_w3_runtime.execution_plan import (
    ExecutionRegistryError,
    PlannedExecution,
    execution_plan_for_actual_run,
    inspect_execution_registry,
    preview_execution_plan,
)
from tools.r7_w3_runtime.execution import (
    W3ExecutionJournal,
    _execute_plan,
    certification_record_issues,
    preflight_report,
    recover_interrupted_transaction,
)
from tools.r7_w3_runtime.readiness import readiness_report
from tools.proof_harness.manifests import ArtifactManifest, BuildManifest
from tools.proof_harness.state import ExecutionKind, ProofExecution


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
    @staticmethod
    def _single_plan(number: int = 1) -> tuple[PlannedExecution, ...]:
        return (
            PlannedExecution(
                "PRD04-PROOF-27",
                f"PRD07-RUN-{number:04d}",
                f"PRD07-EVID-{number:04d}",
                "AUTHORIZED-JIT-NOT-ALLOCATED",
            ),
        )

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
        self.assertIn("PhysicsDirectSpaceState3D.collide_shape", source)
        self.assertNotIn("PhysicsServer3D.shape_collide(", source)

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

    def test_fixture_launcher_consumes_authoritative_artifact_path_for_both_roles(self) -> None:
        for index, role in enumerate(("client", "headless"), start=1):
            with self.subTest(role=role), tempfile.TemporaryDirectory() as raw:
                root = Path(raw)
                artifact_path = root / f"w3-{role}.exe"
                artifact_path.write_bytes(b"real-export-placeholder")
                build = BuildManifest(
                    source_revision="a" * 40,
                    role=role,
                    profile="fixture-launch-regression",
                    precision="exact",
                    platform="windows-x86_64",
                    content_identity="fixture-launch-regression",
                    schema_identity="fixture-launch-regression-v1",
                    clean_export=True,
                    invocation=(str(artifact_path),),
                    components=(),
                )
                artifact = ArtifactManifest.from_path(
                    artifact_path,
                    build,
                    artifact_kind="leyforge-export",
                    exported_runtime=True,
                    synthetic_fixture=False,
                    runtime_self_report_build_identity=build.build_identity,
                )
                exported = ExportedBuild(build, artifact, {}, {}, {}, {}, root / "project", root / "output")
                execution = ProofExecution("PRD04-PROOF-27")
                execution.evaluate_prerequisites([])
                execution.allocate_run(f"PRD07-RUN-{index:04d}", ExecutionKind.ACTUAL, actual_execution_authorized=True)
                execution.begin()
                payload = {
                    "proof_id": execution.proof_id,
                    "run_id": execution.run_id,
                    "build_identity": build.build_identity,
                    "status": "PASS",
                }
                result = SimpleNamespace(
                    process=SimpleNamespace(stdout="LEYFORGE_W3_FIXTURE_REPORT " + json.dumps(payload) + "\n"),
                    to_dict=lambda: {"process": "captured"},
                )
                with patch("tools.r7_w3_runtime.builds.SmokeLane.execute", autospec=True, return_value=result) as execute:
                    report = run_fixture_probe(exported, execution, iterations=1)
                lane = execute.call_args.args[0]
                self.assertFalse(hasattr(artifact, "path"))
                self.assertEqual(str(Path(artifact.artifact_path).resolve()), lane.argv[0])
                self.assertEqual(role == "headless", "--headless" in lane.argv)
                self.assertTrue(report["external_process"])

    def test_registry_high_water_and_preview_are_side_effect_free(self) -> None:
        before = sorted((ROOT / "docs/rebuild/r7/execution-evidence").iterdir())
        registry = inspect_execution_registry(ROOT)
        plan = preview_execution_plan(ROOT)
        after = sorted((ROOT / "docs/rebuild/r7/execution-evidence").iterdir())
        stopped_w4 = ROOT / "docs/rebuild/r7/w4-stopped-execution-boundary.json"
        if stopped_w4.is_file():
            self.assertEqual(72, registry.max_run_number)
            self.assertEqual(72, registry.max_evidence_number)
            self.assertEqual(64, len(registry.retained_run_ids))
            self.assertEqual(tuple(f"PRD07-RUN-{number:04d}" for number in range(66, 73)), registry.retained_run_ids[-7:])
        else:
            self.assertEqual(65, registry.max_run_number)
            self.assertEqual(65, registry.max_evidence_number)
            self.assertEqual(57, len(registry.retained_run_ids))
            self.assertEqual(tuple(f"PRD07-RUN-{number:04d}" for number in range(59, 66)), registry.retained_run_ids[-7:])
        self.assertEqual(tuple(f"PRD07-RUN-{number:04d}" for number in range(51, 58)), registry.quarantined_run_ids)
        invalidated = tuple(run_id for run_id in registry.run_ids if registry.dispositions[run_id] == "INVALIDATED")
        self.assertEqual(("PRD07-RUN-0058",), invalidated)
        self.assertEqual((), plan)
        self.assertEqual(before, after)

    def test_actual_allocation_requires_explicit_future_execution_authority(self) -> None:
        with self.assertRaises(ExecutionRegistryError):
            execution_plan_for_actual_run(ROOT, actual_execution_authorized=False)

    def test_completed_w3_has_no_further_authorized_plan_or_side_effect(self) -> None:
        state_path = ROOT / "docs/rebuild/r7/w3-execution-state.json"
        before = state_path.read_bytes()
        plan = execution_plan_for_actual_run(ROOT, actual_execution_authorized=True)
        self.assertEqual((), plan)
        self.assertEqual(before, state_path.read_bytes())

    def test_certification_allows_a_later_exact_admission_commit(self) -> None:
        implementation_commit = "a" * 40
        passing_checks = {
            "source_hash_identity_valid": True,
            "pinned_engine_identity_valid": True,
            "script_parse_load_valid": True,
            "controlled_entrypoint_reached": True,
            "export_prerequisites_valid": True,
            "export_completed": True,
            "exported_runtime_validation_valid": True,
            "proof_execution_started": False,
        }
        readiness = {
            "schema_version": "prd07-w3-readiness-v4",
            "package": "R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION",
            "status": "PASS",
            "implementation_commit": implementation_commit,
            "implementation_commit_source_match": True,
            "allocated_run_ids": [],
            "allocated_evidence_ids": [],
            "quarantined_run_ids": [f"PRD07-RUN-{index:04d}" for index in range(51, 58)],
            "quarantined_evidence_ids": [f"PRD07-EVID-{index:04d}" for index in range(51, 58)],
            "invalidated_run_ids": ["PRD07-RUN-0058"],
            "invalidated_evidence_ids": ["PRD07-EVID-0058"],
            "pinned_engine_validation": {
                "schema_version": "prd07-w3-pinned-engine-validation-v1",
                "status": "PASS",
                "implementation_commit": implementation_commit,
                "source_identity": {"probe_tree_sha256": "b" * 64},
                "dependency_identity": {"godot_build_driver_revision": "pinned"},
                "checks": passing_checks,
                "proof_execution": "NOT-STARTED",
                "allocated_run_ids": [],
                "allocated_evidence_ids": [],
                "gameplay_permission": "CLOSED",
                "production_runtime": "ABSENT",
            },
            "fixture_launch_validation": {"status": "PASS"},
            "proofs": [{"proof_id": proof_id, "state": "READY"} for proof_id in PROOF_IDS],
        }
        boundary = {
            "manifest_version": 3,
            "package": "R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION",
            "implementation_commit": implementation_commit,
            "proof_execution": "NOT-STARTED-FOR-NEXT-RERUN",
            "allocated_run_ids": [],
            "allocated_evidence_ids": [],
        }
        with patch("tools.r7_w3_runtime.execution.fixture_launch_validation_issues", return_value=()):
            self.assertEqual((), certification_record_issues(readiness, boundary, dict(boundary)))
            stale_boundary = dict(boundary, implementation_commit="b" * 40)
            self.assertTrue(certification_record_issues(readiness, stale_boundary, dict(boundary)))

    def test_temporal_reconciliation_accepts_certified_pre_execution_to_invalidated_0058(self) -> None:
        historical = {"proof_execution": "NOT-STARTED", "allocated_run_ids": [], "allocated_evidence_ids": []}
        attempt = {
            "proof_id": "PRD04-PROOF-27",
            "run_id": "PRD07-RUN-0058",
            "evidence_id": "PRD07-EVID-0058",
            "state": "INVALIDATED",
            "terminal_disposition": "ABORTED-BEFORE-PROOF-OBSERVATION",
            "proof_observation_produced": False,
            "evidence_pack_status": "NOT-CREATED-NO-PROOF-OBSERVATION",
            "prd07_evidence_eligible": False,
        }
        state = {
            "source_revision": "a" * 40,
            "package_state": "ABORTED-BEFORE-PROOF-OBSERVATION",
            "allocated_run_ids": [attempt["run_id"]],
            "allocated_evidence_ids": [attempt["evidence_id"]],
            "allocation_history": [attempt],
        }
        boundary = {
            "manifest_version": 3,
            "lifecycle_role": "CURRENT-POST-ATTEMPT-RECERTIFICATION",
            "proof_execution": "NOT-STARTED-FOR-NEXT-RERUN",
            "allocated_run_ids": [],
            "allocated_evidence_ids": [],
            "invalidated_run_ids": [attempt["run_id"]],
            "invalidated_evidence_ids": [attempt["evidence_id"]],
            "historical_execution": {
                "source_revision": state["source_revision"],
                "package_state": state["package_state"],
                "allocated_run_ids": state["allocated_run_ids"],
                "allocated_evidence_ids": state["allocated_evidence_ids"],
                "allocation_history_run_ids": [attempt["run_id"]],
                "allocation_history_evidence_ids": [attempt["evidence_id"]],
                "proof_observation_count": 0,
                "invalidated_run_ids": [attempt["run_id"]],
                "invalidated_evidence_ids": [attempt["evidence_id"]],
            },
        }
        self.assertEqual((), temporal_reconciliation_issues(boundary, state, historical))

    def test_temporal_reconciliation_rejects_ungoverned_identity_and_disposition_drift(self) -> None:
        historical = {"proof_execution": "NOT-STARTED", "allocated_run_ids": [], "allocated_evidence_ids": []}
        state = {
            "source_revision": "a" * 40,
            "package_state": "ABORTED-BEFORE-PROOF-OBSERVATION",
            "allocated_run_ids": ["PRD07-RUN-0059"],
            "allocated_evidence_ids": ["PRD07-EVID-0059"],
            "allocation_history": [{
                "proof_id": "PRD04-PROOF-27",
                "run_id": "PRD07-RUN-0058",
                "evidence_id": "PRD07-EVID-0058",
                "state": "PASS-OBSERVED",
            }],
        }
        boundary = {
            "manifest_version": 3,
            "lifecycle_role": "CURRENT-POST-ATTEMPT-RECERTIFICATION",
            "proof_execution": "NOT-STARTED-FOR-NEXT-RERUN",
            "allocated_run_ids": [],
            "allocated_evidence_ids": [],
            "invalidated_run_ids": ["PRD07-RUN-0058"],
            "invalidated_evidence_ids": ["PRD07-EVID-0058"],
            "historical_execution": {},
        }
        issues = temporal_reconciliation_issues(boundary, state, historical)
        self.assertTrue(any("RUN order differs" in issue for issue in issues))
        self.assertTrue(any("exactly one unobserved invalidation" in issue for issue in issues))

    def test_live_preflight_keeps_the_live_pinned_engine_gate_enabled(self) -> None:
        readiness = {
            "status": "PASS",
            "issues": [],
            "dependency_check": {"status": "PASS", "issues": [], "paths": {}},
        }
        with patch("tools.r7_w3_runtime.execution.readiness_report", return_value=readiness) as regenerate, patch(
            "tools.r7_w3_runtime.execution.verify_local_dependencies",
            return_value={"status": "PASS", "issues": [], "paths": {}},
        ):
            report = preflight_report("a" * 40, check_local=True)
        self.assertEqual("PASS", report["status"])
        regenerate.assert_called_once_with("a" * 40, check_local=True)

    def test_allocation_is_atomically_persisted_before_execution_begins(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            state_path = Path(raw) / "w3-execution-state.json"
            journal = W3ExecutionJournal(state_path, "a" * 40)
            execution = journal.allocate(self._single_plan()[0])
            state = json.loads(state_path.read_text(encoding="utf-8"))
            self.assertEqual("PRD07-RUN-ALLOCATED", execution.state.value)
            self.assertEqual(["PRD07-RUN-0001"], state["allocated_run_ids"])
            self.assertEqual("PRD07-RUN-ALLOCATED", state["allocation_history"][0]["state"])
            self.assertEqual("NOT-CREATED-NO-PROOF-OBSERVATION", state["allocation_history"][0]["evidence_pack_status"])

    def test_execution_transition_is_durably_persisted(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            state_path = Path(raw) / "w3-execution-state.json"
            journal = W3ExecutionJournal(state_path, "a" * 40)
            execution = journal.allocate(self._single_plan()[0])
            journal.begin(execution)
            state = json.loads(state_path.read_text(encoding="utf-8"))
            self.assertEqual("EXECUTING", state["allocation_history"][0]["state"])
            self.assertEqual("EXECUTING", state["proofs"][1]["state"])

    def test_failure_immediately_after_allocation_is_retained_without_pack(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            with self.assertRaisesRegex(RuntimeError, "injected after allocation"):
                _execute_plan(
                    "a" * 40,
                    root / "run",
                    root / "evidence",
                    root / "w3-execution-state.json",
                    self._single_plan(),
                    failure_injector=lambda phase: (_ for _ in ()).throw(RuntimeError("injected after allocation"))
                    if phase == "after-allocation" else None,
                )
            state = json.loads((root / "w3-execution-state.json").read_text(encoding="utf-8"))
            attempt = state["allocation_history"][0]
            self.assertEqual("INVALIDATED", attempt["state"])
            self.assertEqual("after-allocation", attempt["failure"]["phase"])
            self.assertFalse(attempt["proof_observation_produced"])
            self.assertFalse((root / "evidence").exists())

    def test_failure_after_execution_transition_is_retained(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            def inject(phase: str) -> None:
                if phase == "after-execution-start":
                    raise RuntimeError("injected after begin")
            with self.assertRaisesRegex(RuntimeError, "injected after begin"):
                _execute_plan(
                    "a" * 40,
                    root / "run",
                    root / "evidence",
                    root / "w3-execution-state.json",
                    self._single_plan(),
                    failure_injector=inject,
                )
            state = json.loads((root / "w3-execution-state.json").read_text(encoding="utf-8"))
            attempt = state["allocation_history"][0]
            self.assertEqual("after-execution-start", attempt["failure"]["phase"])
            self.assertTrue(any(item["to"] == "EXECUTING" for item in attempt["state_history"]))

    def test_export_failure_is_retained_before_any_proof_observation(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            def fail_export(*_args: object) -> object:
                raise RuntimeError("injected export failure")
            with self.assertRaisesRegex(RuntimeError, "injected export failure"):
                _execute_plan(
                    "a" * 40,
                    root / "run",
                    root / "evidence",
                    root / "w3-execution-state.json",
                    self._single_plan(),
                    exporter=fail_export,  # type: ignore[arg-type]
                )
            state = json.loads((root / "w3-execution-state.json").read_text(encoding="utf-8"))
            attempt = state["allocation_history"][0]
            self.assertEqual("client-export-build-self-report", attempt["failure"]["phase"])
            self.assertEqual("ABORTED-BEFORE-PROOF-OBSERVATION", attempt["terminal_disposition"])

    def test_missing_runtime_self_report_is_retained_as_export_phase_failure(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            def missing_report(*_args: object) -> object:
                raise ValueError("expected exactly one LEYFORGE_W3_SELF_REPORT line; found 0")
            with self.assertRaisesRegex(ValueError, "found 0"):
                _execute_plan(
                    "a" * 40,
                    root / "run",
                    root / "evidence",
                    root / "w3-execution-state.json",
                    self._single_plan(),
                    exporter=missing_report,  # type: ignore[arg-type]
                )
            state = json.loads((root / "w3-execution-state.json").read_text(encoding="utf-8"))
            failure = state["allocation_history"][0]["failure"]
            self.assertEqual("ValueError", failure["error_type"])
            self.assertIn("LEYFORGE_W3_SELF_REPORT", failure["error"])

    def test_process_interrupt_is_retained_and_recovery_plans_fresh_identity(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            state_path = root / "docs/rebuild/r7/w3-execution-state.json"
            journal = W3ExecutionJournal(state_path, "a" * 40)
            execution = journal.allocate(self._single_plan()[0])
            journal.begin(execution)
            self.assertTrue(recover_interrupted_transaction(state_path, "a" * 40))
            state = json.loads(state_path.read_text(encoding="utf-8"))
            attempt = state["allocation_history"][0]
            self.assertEqual("INTERRUPTED-BEFORE-PROOF-OBSERVATION", attempt["terminal_disposition"])
            self.assertTrue(attempt["failure"]["interrupted"])
            plan = preview_execution_plan(root)
            self.assertEqual("PRD04-PROOF-27", plan[0].proof_id)
            self.assertEqual("PRD07-RUN-0002", plan[0].run_id)

    def test_terminal_journal_allows_only_explicit_fresh_source_transition_without_reuse(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            state_path = Path(raw) / "w3-execution-state.json"
            journal = W3ExecutionJournal(state_path, "a" * 40)
            first = journal.allocate(self._single_plan(1)[0])
            journal.begin(first)
            journal.fail(first, "fixture-runtime-self-report", RuntimeError("historical abort"))
            before = state_path.read_bytes()
            with self.assertRaisesRegex(ValueError, "different source revision"):
                W3ExecutionJournal(state_path, "b" * 40)
            successor = W3ExecutionJournal(
                state_path,
                "b" * 40,
                allow_terminal_source_transition=True,
            )
            self.assertEqual(before, state_path.read_bytes())
            second = successor.allocate(self._single_plan(2)[0])
            state = json.loads(state_path.read_text(encoding="utf-8"))
            self.assertEqual("PRD07-RUN-0002", second.run_id)
            self.assertEqual(["PRD07-RUN-0001", "PRD07-RUN-0002"], state["allocated_run_ids"])
            self.assertEqual("b" * 40, state["latest_source_revision"])
            self.assertEqual("b" * 40, state["allocation_history"][1]["source_revision"])

    def test_keyboard_interrupt_during_export_is_durably_invalidated(self) -> None:
        with tempfile.TemporaryDirectory() as raw:
            root = Path(raw)
            def interrupt(*_args: object) -> object:
                raise KeyboardInterrupt()
            with self.assertRaises(KeyboardInterrupt):
                _execute_plan(
                    "a" * 40,
                    root / "run",
                    root / "evidence",
                    root / "w3-execution-state.json",
                    self._single_plan(),
                    exporter=interrupt,  # type: ignore[arg-type]
                )
            state = json.loads((root / "w3-execution-state.json").read_text(encoding="utf-8"))
            self.assertTrue(state["allocation_history"][0]["failure"]["interrupted"])

    def test_pinned_engine_receipt_validator_fails_closed(self) -> None:
        issues = pinned_engine_validation_issues({}, "a" * 40)
        self.assertIn("pinned-engine validation does not pass", issues)
        self.assertTrue(any("check did not pass" in issue for issue in issues))

    def test_fixture_launch_receipt_validator_fails_closed(self) -> None:
        issues = fixture_launch_validation_issues({}, "a" * 40)
        self.assertIn("fixture-launch integration does not pass", issues)
        self.assertTrue(any("check" in issue for issue in issues))

    def test_fixture_launch_integration_surfaces_export_failure_without_allocating(self) -> None:
        before = inspect_execution_registry(ROOT)
        with tempfile.TemporaryDirectory() as raw, patch(
                "tools.r7_w3_runtime.builds.verify_local_dependencies",
                return_value={"status": "PASS", "issues": [], "paths": {}},
            ), patch(
                "tools.r7_w3_runtime.builds._export_artifact",
                side_effect=RuntimeError("injected fixture export failure"),
            ) as export:
            report = fixture_launch_validation_report("a" * 40, validation_parent=Path(raw))
        after = inspect_execution_registry(ROOT)
        self.assertEqual("FAIL", report["status"])
        self.assertEqual([], report["allocated_run_ids"])
        self.assertEqual([], report["allocated_evidence_ids"])
        self.assertFalse(report["checks"]["identity_allocation_started"])
        self.assertTrue(any("injected fixture export failure" in issue for issue in report["issues"]))
        self.assertEqual(before, after)
        self.assertEqual(2, export.call_count)
        self.assertTrue(all(call.kwargs["verified_local"]["status"] == "PASS" for call in export.call_args_list))

    def test_real_fixture_launch_integration_builds_and_launches_without_proof_or_allocation(self) -> None:
        local = verify_local_dependencies(load_lock())
        if local["status"] != "PASS":
            self.skipTest("exact pinned Godot/dependency environment is unavailable")
        state_path = ROOT / "docs/rebuild/r7/w3-execution-state.json"
        state_before = state_path.read_bytes()
        registry_before = inspect_execution_registry(ROOT)
        report = fixture_launch_validation_report("a" * 40)
        registry_after = inspect_execution_registry(ROOT)
        self.assertEqual("PASS", report["status"], report["issues"])
        self.assertEqual({"client", "headless"}, set(report["roles"]))
        self.assertTrue(report["checks"]["authoritative_manifest_contract_valid"])
        self.assertTrue(report["checks"]["client_artifact_launch_valid"])
        self.assertTrue(report["checks"]["headless_artifact_launch_valid"])
        self.assertFalse(report["checks"]["proof_execution_started"])
        self.assertFalse(report["checks"]["identity_allocation_started"])
        self.assertEqual([], report["allocated_run_ids"])
        self.assertEqual([], report["allocated_evidence_ids"])
        self.assertEqual(state_before, state_path.read_bytes())
        self.assertEqual(registry_before, registry_after)

    def test_real_pinned_engine_rejects_invalid_godot_api_before_ready(self) -> None:
        local = verify_local_dependencies(load_lock())
        if local["status"] != "PASS":
            self.skipTest("exact pinned Godot/dependency environment is unavailable")
        with tempfile.TemporaryDirectory() as raw:
            probe = Path(raw) / "server_probe"
            shutil.copytree(PROBE_SOURCE, probe)
            script = probe / "src/main.gd"
            source = script.read_text(encoding="utf-8")
            invalid = source.replace(
                "get_viewport().world_3d.direct_space_state.collide_shape(query, 8)",
                "PhysicsServer3D.shape_collide()",
            )
            self.assertNotEqual(source, invalid)
            script.write_text(invalid, encoding="utf-8")
            report = pinned_engine_validation_report("a" * 40, probe_source=probe, perform_export=False)
        self.assertEqual("FAIL", report["status"])
        self.assertFalse(report["checks"]["script_parse_load_valid"])
        self.assertFalse(report["checks"]["controlled_entrypoint_reached"])

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

    def test_plan_skips_retained_w3_result_and_continues_without_collision(self) -> None:
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
            plan = preview_execution_plan(root)
            self.assertEqual(6, len(plan))
            self.assertEqual("PRD04-PROOF-28", plan[0].proof_id)
            self.assertEqual("PRD07-RUN-0002", plan[0].run_id)

    def test_readiness_verifies_definitions_mappings_and_consumes_no_ids(self) -> None:
        with patch("tools.r7_w3_runtime.readiness._commit_source_issues", return_value=[]), patch(
            "tools.r7_w3_runtime.readiness._engine_validation_context", return_value=({"status": "PASS"}, [])
        ), patch(
            "tools.r7_w3_runtime.readiness._fixture_launch_validation_context", return_value=({"status": "PASS"}, [])
        ):
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
            self.assertEqual("OBSERVED — RETAINED", row["readiness_classification"])

    def test_readiness_rejects_an_unresolved_source_commit(self) -> None:
        report = readiness_report("0" * 40, check_local=False)
        self.assertEqual("FAIL", report["status"])
        self.assertFalse(report["implementation_commit_source_match"])

    def test_w3_admission_is_exact_and_contains_no_historical_w2_pack(self) -> None:
        paths = admitted_paths()
        allowed_exact = {
            "tools/tests/test_r7_w3_runtime.py",
            "tools/verify.py",
            "tools/verify_rebuild_boundary.py",
            "docs/rebuild/r7/w3-allocation-reconciliation.json",
            "docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json",
            "docs/rebuild/r7/w3-fixture-launch-integration.json",
            "docs/rebuild/r7/w3-readiness-fixture-launch-repaired.json",
            "docs/rebuild/r7/w3-execution-state.json",
            "docs/rebuild/r7/w3-execution-completion-receipt.json",
        }
        self.assertTrue(paths)
        self.assertTrue(all(
            path.startswith((
                "proofs/r7/w3/",
                "tools/r7_w3_runtime/",
                "docs/rebuild/r7/execution-evidence/PRD07-RUN-0059/",
                "docs/rebuild/r7/execution-evidence/PRD07-RUN-0060/",
                "docs/rebuild/r7/execution-evidence/PRD07-RUN-0061/",
                "docs/rebuild/r7/execution-evidence/PRD07-RUN-0062/",
                "docs/rebuild/r7/execution-evidence/PRD07-RUN-0063/",
                "docs/rebuild/r7/execution-evidence/PRD07-RUN-0064/",
                "docs/rebuild/r7/execution-evidence/PRD07-RUN-0065/",
            )) or path in allowed_exact
            for path in paths
        ))
        self.assertFalse(any("PRD07-RUN-003" in path or "PRD07-RUN-004" in path or "PRD07-RUN-0050" in path for path in paths))

    def test_clean_rebuild_boundary_uses_hash_pinned_w3_admission(self) -> None:
        source = (ROOT / "tools/verify_rebuild_boundary.py").read_text(encoding="utf-8")
        self.assertIn("w3-execution-boundary-execution-complete.json", source)
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
