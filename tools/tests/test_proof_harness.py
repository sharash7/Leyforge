#!/usr/bin/env python3
"""Focused contract and integration evidence for the PRD-07 W0 harness."""

from __future__ import annotations

import json
import subprocess
import sys
import tempfile
import unittest
from dataclasses import replace
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from tools.proof_harness.architecture import load_config, scan
from tools.proof_harness.build import BuildController, CleanExportPlan
from tools.proof_harness.diagnostics import DiagnosticCollector
from tools.proof_harness.evidence import EvidenceFile, EvidencePack
from tools.proof_harness.identity import (
    CanonicalCoordinate, ProjectionStore, ReadModel, RuntimeBindingTable,
    SemanticFixture, SemanticId, SemanticObject, SpatialFrame,
    WorldDefinition, WorldSession,
)
from tools.proof_harness.manifests import ArtifactManifest, BuildManifest, ComponentIdentity
from tools.proof_harness.metrics import MetricsCollector
from tools.proof_harness.oracle import compare_canonical_hashes, compare_result_sets
from tools.proof_harness.process import ProcessController, SmokeLane
from tools.proof_harness.readiness import load as load_readiness
from tools.proof_harness.readiness import report as readiness_report
from tools.proof_harness.scenario import FaultAction, ScenarioSpec
from tools.proof_harness.state import ExecutionKind, ProofExecution, ProofState


class HarnessFixtures:
    @staticmethod
    def semantic_fixture(session="session:alpha"):
        world_id = SemanticId("world:alpha")
        owner = SemanticId("system:world-owner")
        frame = SpatialFrame(
            frame_id=SemanticId("frame:alpha"), epoch=3,
            origin=CanonicalCoordinate(10**15, -10**15, 77),
        )
        definition = WorldDefinition(world_id, "content:test-v1", "schema:test-v1")
        world_session = WorldSession(SemanticId(session), world_id, frame, owner, revision=9)
        specs = (
            ("block:granite", "block", (10**15 + 2, -10**15 + 3, 80), {"damage": 2}),
            ("entity:worker", "actor", (10**15 + 4, -10**15 + 5, 81), {"health": 91}),
            ("item:hammer", "item", (10**15 + 6, -10**15 + 7, 82), {"quality": 4}),
            ("machine:forge", "machine", (10**15 + 8, -10**15 + 9, 83), {"heat": 12}),
            ("actor:visitor", "actor", (10**15 + 10, -10**15 + 11, 84), {"mood": "calm"}),
        )
        objects = {}
        for revision, (identifier, kind, coordinate, state) in enumerate(specs, 1):
            semantic_id = SemanticId(identifier)
            objects[semantic_id] = SemanticObject(
                semantic_id=semantic_id, kind=kind,
                coordinate=CanonicalCoordinate(*coordinate), owner_id=owner,
                revision=revision, state=state,
            )
        return SemanticFixture(
            definition=definition, session=world_session, objects=objects,
            seed=7341, configuration={"profile": "w0-controller-test"},
        )

    @staticmethod
    def component(name, installed=True):
        return ComponentIdentity(
            name=name, source="synthetic://controller-fixture/%s" % name,
            revision="fixture-revision-%s" % name, edition="controller-test",
            installation_status="installed" if installed else "uninstalled",
            provenance_status="verified" if installed else "unresolved",
            licence_status="resolved" if installed else "unresolved",
            local_patch="NO-LOCAL-PATCH",
        )

    @classmethod
    def build(cls, role="headless", installed=True):
        return BuildManifest(
            source_revision="a" * 40, role=role, profile="controller-test",
            precision="double", platform=sys.platform,
            content_identity="content:test-v1", schema_identity="schema:test-v1",
            clean_export=True, invocation=("synthetic-controller-build", "--clean"),
            components=(cls.component("godot", installed), cls.component("voxel-tools", installed)),
            environment={"purpose": "unit-contract"},
        )

    @classmethod
    def artifact(cls, path, role="headless"):
        build = cls.build(role=role)
        artifact = ArtifactManifest.from_path(
            Path(path), build, artifact_kind="controller-fixture",
            exported_runtime=False, synthetic_fixture=True,
            runtime_self_report_build_identity=None,
        )
        return build, artifact


class IdentityContractTests(unittest.TestCase):
    def test_semantic_state_is_invariant_across_runtime_id_permutations(self):
        fixture = HarnessFixtures.semantic_fixture()
        first = RuntimeBindingTable.randomized(fixture.objects, seed=11)
        second = RuntimeBindingTable.randomized(fixture.objects, seed=29)
        self.assertNotEqual(first.manifest(), second.manifest())
        self.assertEqual(fixture.canonical_hash(), fixture.canonical_hash())
        for semantic_id in fixture.objects:
            self.assertEqual(first.resolve(first.project(semantic_id)), semantic_id)
            self.assertEqual(second.resolve(second.project(semantic_id)), semantic_id)

    def test_runtime_binding_rejects_duplicate_semantic_identity(self):
        duplicate = SemanticId("item:duplicate")
        with self.assertRaises(ValueError):
            RuntimeBindingTable.randomized((duplicate, duplicate), seed=1)

    def test_projection_destroy_evict_and_recreate_preserve_canonical_truth(self):
        fixture = HarnessFixtures.semantic_fixture()
        before = fixture.canonical_hash()
        bindings = RuntimeBindingTable.randomized(fixture.objects, seed=19)
        store = ProjectionStore(fixture.objects, bindings)
        for semantic_id in fixture.objects:
            projection = store.create(semantic_id)
            self.assertEqual(projection.source_revision, fixture.objects[semantic_id].revision)
        target = next(iter(fixture.objects))
        store.destroy(target)
        recreated = store.create(target)
        self.assertEqual(recreated.semantic_id, target)
        store.evict_all()
        self.assertEqual(store.active(), ())
        self.assertEqual(fixture.canonical_hash(), before)

    def test_read_model_can_be_destroyed_and_rebuilt(self):
        fixture = HarnessFixtures.semantic_fixture()
        model = ReadModel()
        model.rebuild(fixture.objects)
        expected = tuple(item.canonical_record() for _, item in sorted(fixture.objects.items(), key=lambda pair: str(pair[0])))
        self.assertTrue(compare_result_sets(expected, model.query()).passed)
        digest = model.digest()
        model.clear()
        self.assertEqual(model.query(), ())
        model.rebuild(fixture.objects)
        self.assertEqual(model.digest(), digest)

    def test_save_reload_preserves_semantic_identity_with_new_session(self):
        fixture = HarnessFixtures.semantic_fixture()
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "fixture.json"
            fixture.save(path)
            loaded = SemanticFixture.load(path, SemanticId("session:reload"), SemanticId("system:world-owner"))
        self.assertTrue(compare_canonical_hashes(fixture, loaded).passed)
        self.assertNotEqual(fixture.session.session_id, loaded.session.session_id)
        self.assertEqual(fixture.definition.world_id, loaded.definition.world_id)

    def test_extreme_coordinate_frame_round_trip_is_exact(self):
        fixture = HarnessFixtures.semantic_fixture()
        coordinate = CanonicalCoordinate(10**15 + 123, -10**15 - 456, 999)
        active = fixture.session.frame.to_active(coordinate)
        self.assertEqual(fixture.session.frame.to_canonical(active), coordinate)
        rebased = fixture.session.frame.rebased(
            SemanticId("frame:beta"), CanonicalCoordinate(10**15 + 100, -10**15 - 400, 900)
        )
        self.assertEqual(rebased.epoch, fixture.session.frame.epoch + 1)
        self.assertEqual(rebased.to_canonical(rebased.to_active(coordinate)), coordinate)


class SharedServiceContractTests(unittest.TestCase):
    def test_diagnostics_are_structured_and_correlated(self):
        collector = DiagnosticCollector("TEST-RUN-CORRELATION")
        event = collector.emit(
            "W0-IDENTITY-REBIND", "INFO", "proof_harness.identity", "projection rebound",
            {"semantic_id": "entity:worker", "revision": 2},
        )
        self.assertEqual(event.to_dict()["correlation_id"], "TEST-RUN-CORRELATION")
        self.assertEqual(collector.to_records()[0]["context"]["revision"], 2)

    def test_scenario_seed_phase_and_fault_manifest_is_reproducible(self):
        scenario = ScenarioSpec(
            scenario_id="TEST-SCENARIO-W0", seed=88, configuration={"workers": 3},
            phases=("setup", "fault", "observe"),
            faults=(FaultAction("fault", "async-reorder", {"release_order": [2, 1]}),),
        )
        self.assertEqual(scenario.rng().random(), scenario.rng().random())
        self.assertEqual(scenario.manifest()["faults"][0]["kind"], "async-reorder")

    def test_fault_must_target_declared_phase(self):
        with self.assertRaises(ValueError):
            ScenarioSpec("TEST", 1, {}, ("setup",), (FaultAction("missing", "provider-failure"),))

    def test_metrics_are_diagnostic_summaries(self):
        metrics = MetricsCollector()
        metrics.record("queue.age", "ms", 5, "observe")
        metrics.record("queue.age", "ms", 15, "observe")
        self.assertEqual(metrics.summary("queue.age"), {"count": 2.0, "min": 5.0, "max": 15.0, "mean": 10.0})


class ManifestAndProcessTests(unittest.TestCase):
    def test_build_manifest_round_trip_has_stable_composite_identity(self):
        build = HarnessFixtures.build()
        restored = BuildManifest.from_dict(build.to_dict())
        self.assertEqual(build.build_identity, restored.build_identity)
        self.assertEqual(restored.issues(for_execution=True), [])

    def test_json_manifest_booleans_are_strict(self):
        data = HarnessFixtures.build().to_dict()
        data["clean_export"] = "false"
        with self.assertRaises(ValueError):
            BuildManifest.from_dict(data)

    def test_uninstalled_dependency_blocks_execution_manifest(self):
        issues = HarnessFixtures.build(installed=False).issues(for_execution=True)
        self.assertTrue(any("not installed" in issue for issue in issues))
        self.assertTrue(any("provenance" in issue for issue in issues))

    def test_artifact_integrity_detects_changed_bytes(self):
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "artifact.bin"
            path.write_bytes(b"before")
            build, artifact = HarnessFixtures.artifact(path)
            self.assertEqual(artifact.integrity_issues(build), [])
            path.write_bytes(b"after-with-different-size")
            issues = artifact.integrity_issues(build)
            self.assertTrue(any("hash" in issue for issue in issues))
            self.assertTrue(any("size" in issue for issue in issues))

    def test_synthetic_client_and_headless_smokes_are_never_evidence_eligible(self):
        for role, proof_id in (("client", "PRD04-PROOF-70"), ("headless", "PRD04-PROOF-11")):
            with self.subTest(role=role):
                build, artifact = HarnessFixtures.artifact(Path(sys.executable), role=role)
                lane = SmokeLane(
                    "TEST-LANE-" + role.upper(), proof_id, role, build, artifact,
                    (sys.executable, "-c", "import sys;print('lane-out');print('lane-err', file=sys.stderr)"),
                )
                result = lane.execute(ProcessController(), timeout_seconds=5, controller_test=True)
                self.assertEqual(result.process.exit_code, 0)
                self.assertIn("lane-out", result.process.stdout)
                self.assertIn("lane-err", result.process.stderr)
                self.assertFalse(result.evidence_eligible)
                self.assertTrue(any("synthetic" in issue for issue in result.eligibility_issues))

    def test_real_lane_requires_allocated_executing_context_before_launch(self):
        build, synthetic = HarnessFixtures.artifact(Path(sys.executable))
        artifact = replace(
            synthetic, artifact_kind="leyforge-export", exported_runtime=True,
            synthetic_fixture=False,
            runtime_self_report_build_identity=build.build_identity,
        )
        lane = SmokeLane(
            "TEST-LANE-GUARD", "PRD04-PROOF-11", "headless", build, artifact,
            (sys.executable, "-c", "print('must-not-launch')"),
        )
        with self.assertRaisesRegex(ValueError, "allocated execution context"):
            lane.execute(ProcessController(), timeout_seconds=5)

    def test_clean_export_controller_refuses_reused_output(self):
        with tempfile.TemporaryDirectory() as directory:
            output = Path(directory) / "export"
            argv = (
                sys.executable, "-c",
                "from pathlib import Path; Path('artifact.bin').write_bytes(b'fixture')",
            )
            build = replace(HarnessFixtures.build(), invocation=argv)
            plan = CleanExportPlan(build=build, output_root=output, argv=argv)
            result = BuildController().execute(plan, timeout_seconds=5, controller_test=True)
            self.assertEqual(result.process.exit_code, 0)
            self.assertEqual(result.artifact_candidates, ("artifact.bin",))
            with self.assertRaisesRegex(ValueError, "absent or empty"):
                BuildController().execute(plan, timeout_seconds=5, controller_test=True)

    def test_process_timeout_is_external_termination(self):
        result = ProcessController().run(
            (sys.executable, "-c", "import time; time.sleep(5)"), timeout_seconds=0.05
        )
        self.assertTrue(result.timed_out)
        self.assertTrue(result.terminated_externally)
        self.assertNotEqual(result.exit_code, 0)


class ArchitectureLintTests(unittest.TestCase):
    FIXTURES = ROOT / "tools" / "tests" / "fixtures" / "architecture"

    def test_known_good_harness_and_seeded_good_fixture_pass(self):
        harness = scan(ROOT / "tools", load_config(ROOT / "tools/proof_harness/architecture-rules.json"))
        seeded = scan(self.FIXTURES, load_config(self.FIXTURES / "good-rules.json"))
        self.assertEqual(harness["status"], "PASS")
        self.assertEqual(seeded["status"], "PASS")
        self.assertTrue(harness["read_only"])

    def test_seeded_forbidden_import_has_file_line_and_rule_context(self):
        result = scan(self.FIXTURES, load_config(self.FIXTURES / "seeded-violation-rules.json"))
        self.assertEqual(result["status"], "FAIL")
        violation = result["violations"][0]
        self.assertEqual(violation["rule_id"], "TEST-ARCH-001")
        self.assertEqual(violation["file"], "bad/domain/model.py")
        self.assertEqual(violation["line"], 1)
        self.assertEqual(violation["imported"], "provider.internal")


class StateAndEvidenceTests(unittest.TestCase):
    def test_run_allocation_is_blocked_until_ready_and_actual_authorized(self):
        proof = ProofExecution("PRD04-PROOF-01")
        proof.evaluate_prerequisites(("runtime fixture absent",))
        with self.assertRaises(ValueError):
            proof.allocate_run("TEST-RUN-0001", ExecutionKind.SYNTHETIC)
        proof.evaluate_prerequisites(())
        actual_id = "PRD07-" + "RUN-9999"
        with self.assertRaises(ValueError):
            proof.allocate_run(actual_id, ExecutionKind.ACTUAL, actual_execution_authorized=False)

    def test_invalid_proof_identity_and_double_invalidation_are_rejected(self):
        with self.assertRaises(ValueError):
            ProofExecution("PROOF-UNKNOWN")
        proof = ProofExecution("PRD04-PROOF-74")
        proof.evaluate_prerequisites(())
        proof.allocate_run("TEST-RUN-0088", ExecutionKind.SYNTHETIC)
        proof.invalidate("fixture invalid")
        with self.assertRaises(ValueError):
            proof.invalidate("cannot invalidate twice")

    def test_synthetic_state_flow_retains_failure_but_cannot_enter_prd08(self):
        proof = ProofExecution("PRD04-PROOF-74")
        proof.evaluate_prerequisites(())
        proof.allocate_run("TEST-RUN-0001", ExecutionKind.SYNTHETIC)
        proof.begin()
        proof.observe(ProofState.FAIL_OBSERVED)
        self.assertEqual(proof.state, ProofState.FAIL_OBSERVED)
        self.assertFalse(proof.prd07_evidence_eligible)
        with self.assertRaises(ValueError):
            proof.send_to_prd08(("PRD07-" + "EVID-9999",))
        proof.require_rerun("controller fixture changed")
        self.assertEqual(proof.state, ProofState.RERUN_REQUIRED)
        self.assertIsNone(proof.run_id)

    def test_failed_and_inconclusive_synthetic_packs_are_append_only(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            artifact_path = root / "controller.bin"
            artifact_path.write_bytes(b"controller")
            log_path = root / "output.log"
            log_path.write_text("observed failure\n", encoding="utf-8")
            build, artifact = HarnessFixtures.artifact(artifact_path)
            for index, outcome in enumerate((ProofState.FAIL_OBSERVED, ProofState.INCONCLUSIVE), 1):
                with self.subTest(outcome=outcome):
                    evidence = EvidenceFile.from_path("TEST-EVID-%04d" % index, "log", log_path)
                    pack = EvidencePack(
                        run_id="TEST-RUN-%04d" % index, proof_id="PRD04-PROOF-74",
                        outcome=outcome, execution_kind=ExecutionKind.SYNTHETIC,
                        build=build, artifact=artifact,
                        scenario={"scenario_id": "TEST-SCENARIO", "seed": 1},
                        environment={"platform": sys.platform}, evidence_files=(evidence,),
                        observations=({"outcome": outcome.value},),
                    )
                    destination = pack.retain(root / "packs")
                    self.assertTrue((destination / "run.json").is_file())
                    self.assertFalse(json.loads((destination / "run.json").read_text())["prd07_evidence_eligible"])
                    with self.assertRaises(FileExistsError):
                        pack.retain(root / "packs")

    def test_invalidated_actual_pack_is_retainable_but_not_evaluation_eligible(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            artifact_path = root / "artifact.bin"
            artifact_path.write_bytes(b"fixture-export")
            build, synthetic = HarnessFixtures.artifact(artifact_path)
            artifact = replace(
                synthetic, artifact_kind="leyforge-export", exported_runtime=True,
                synthetic_fixture=False,
                runtime_self_report_build_identity=build.build_identity,
            )
            log_path = root / "invalidated.log"
            log_path.write_text("invalidated environment\n", encoding="utf-8")
            evidence = EvidenceFile.from_path("PRD07-" + "EVID-9999", "log", log_path)
            pack = EvidencePack(
                run_id="PRD07-" + "RUN-9999", proof_id="PRD04-PROOF-70",
                outcome=ProofState.INVALIDATED, execution_kind=ExecutionKind.ACTUAL,
                build=build, artifact=artifact,
                scenario={"scenario_id": "TEST-ONLY", "seed": 1},
                environment={"platform": sys.platform}, evidence_files=(evidence,),
            )
            self.assertEqual(pack.validation_issues(), ())
            self.assertFalse(pack.prd07_evidence_eligible)

    def test_duplicate_evidence_identity_is_rejected(self):
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            artifact_path = root / "controller.bin"
            artifact_path.write_bytes(b"controller")
            log_path = root / "output.log"
            log_path.write_text("failure\n", encoding="utf-8")
            build, artifact = HarnessFixtures.artifact(artifact_path)
            evidence = EvidenceFile.from_path("TEST-EVID-0001", "log", log_path)
            pack = EvidencePack(
                run_id="TEST-RUN-0001", proof_id="PRD04-PROOF-74",
                outcome=ProofState.FAIL_OBSERVED, execution_kind=ExecutionKind.SYNTHETIC,
                build=build, artifact=artifact,
                scenario={"scenario_id": "TEST", "seed": 1},
                environment={"platform": sys.platform}, evidence_files=(evidence, evidence),
            )
            self.assertIn("evidence identities must be unique within a pack", pack.validation_issues())

    def test_w0_readiness_has_exactly_thirteen_blocked_proofs_and_zero_ids(self):
        data = load_readiness(ROOT / "tools/proof_harness/w0-readiness.json")
        result = readiness_report(data)
        self.assertEqual(result["status"], "PASS")
        self.assertEqual(result["counts"]["HARNESS-BLOCKED"], 13)
        self.assertEqual(result["counts"]["READY"], 0)
        self.assertEqual(result["allocated_run_ids"], [])
        self.assertEqual(result["allocated_evidence_ids"], [])
        self.assertEqual([lane["role"] for lane in result["smoke_lanes"]], ["client", "headless"])
        self.assertTrue(all(lane["state"] == "HARNESS-BLOCKED" for lane in result["smoke_lanes"]))

    def test_module_self_check_is_no_execution_and_passes(self):
        completed = subprocess.run(
            [sys.executable, "-m", "tools.proof_harness", "self-check", "--format", "json"],
            cwd=ROOT, text=True, capture_output=True,
        )
        self.assertEqual(completed.returncode, 0, completed.stderr)
        result = json.loads(completed.stdout)
        self.assertEqual(result["status"], "PASS")
        self.assertEqual(result["proof_execution"], "NOT-STARTED")
        self.assertEqual(result["gameplay_permission"], "CLOSED")


if __name__ == "__main__":
    unittest.main()
