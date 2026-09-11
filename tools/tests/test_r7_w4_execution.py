from __future__ import annotations

import hashlib
import json
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from tools.r7_w4_execution.contracts import (
    EXECUTION_ADMISSION_PATH,
    EXECUTION_ROSTER,
    READINESS_ADMISSION_PATH,
    ROOT,
    canonical_bytes,
    fixture_identity,
    proof_contracts_by_id,
    sha256_file,
)
from tools.r7_w4_execution.evidence import evidence_issues
from tools.r7_w4_execution.execution import reconcile_w4
from tools.r7_w4_execution.journal import W4ExecutionJournal
from tools.r7_w4_execution.observations import _fcc_observation_row, _proof_55, _smuggling_analysis
from tools.r7_w4_runtime.dependencies import load_reference


class R7W4ExecutionTests(unittest.TestCase):
    def _evidence(self, proof_id: str, sequence: int, outcome: str = "PASS-OBSERVED") -> dict:
        contract = proof_contracts_by_id()[proof_id]
        environment = {
            "os": "test-os",
            "machine": "x86_64",
            "python": "3.11",
            "role": contract["requirements"]["runtime_roles"][0],
            "isolated_profile": True,
            "artifact_identity": "a" * 64,
        }
        if EXECUTION_ADMISSION_PATH.is_file():
            environment["execution_admission_sha256"] = sha256_file(EXECUTION_ADMISSION_PATH)
        value = {
            "schema_version": "prd07-w4-standard-evidence-pack-v1",
            "run_id": "PRD07-RUN-{0:04d}".format(sequence),
            "evidence_id": "PRD07-EVID-{0:04d}".format(sequence),
            "proof_id": proof_id,
            "source_revision": "1" * 40,
            "admission_boundary_sha256": hashlib.sha256(canonical_bytes(json.loads(READINESS_ADMISSION_PATH.read_text(encoding="utf-8-sig")))).hexdigest(),
            "fixture_identities": fixture_identity(contract["requirements"]["fixture_identities"]),
            "dependency_identity": load_reference(),
            "environment_identity": environment,
            "observation": {
                "state": outcome,
                "started_at": "2026-09-10T00:00:00Z",
                "finished_at": "2026-09-10T00:00:01Z",
                "raw_artifacts": [{"kind": "test", "path": "artifacts/test.json", "sha256": "2" * 64, "bytes": 1}],
                "measurements": {"rows": 1},
                "repetitions": {"count": 1},
                "fcc13e_rows": [],
            },
            "evaluation": {
                "canonical_success_criterion": contract["success_criterion"],
                "canonical_failure_criterion": contract["failure_criterion"],
                "canonical_inconclusive_conditions": contract["inconclusive_conditions"],
                "actual_disposition": outcome,
                "reason": "test",
                "blockers": [],
                "limitations": [],
            },
            "lifecycle": {
                "allocated_before_execution": True,
                "identity_retained": True,
                "registry_reconciled": True,
                "prd07_evidence_eligible": True,
                "prd08_submission": "NOT-SUBMITTED",
                "gameplay_permission": "CLOSED",
                "production_runtime": "ABSENT",
            },
        }
        return value

    def test_exact_authorized_roster_and_identity_order(self) -> None:
        self.assertEqual(
            (
                "PRD04-PROOF-49", "PRD04-PROOF-50", "PRD04-PROOF-51",
                "PRD04-PROOF-52", "PRD04-PROOF-53", "PRD04-PROOF-54",
                "PRD04-PROOF-55", "PRD04-PROOF-56", "PRD04-PROOF-57",
                "PRD04-PROOF-58", "PRD04-PROOF-59", "PRD04-PROOF-60",
                "PRD04-PROOF-61", "PRD04-PROOF-62", "PRD04-PROOF-71",
            ),
            EXECUTION_ROSTER,
        )

    def test_standard_evidence_accepts_exact_nonhuman_contract(self) -> None:
        self.assertEqual((), evidence_issues(self._evidence("PRD04-PROOF-49", 66)))

    def test_required_human_judgement_cannot_be_omitted_or_faked_for_pass(self) -> None:
        value = self._evidence("PRD04-PROOF-50", 67)
        issues = evidence_issues(value)
        self.assertIn("standard evidence lacks required human judgement section", issues)
        value["human_judgement"] = {
            "required": True,
            "observer_ids": [],
            "task_scores": [],
            "capture_refs": [],
            "disagreements": ["No real human reviewer."],
            "adjudication": "INCONCLUSIVE",
        }
        self.assertIn("PASS-OBSERVED is not allowed without a complete human reviewer record", evidence_issues(value))
        value["observation"]["state"] = "INCONCLUSIVE"
        value["evaluation"]["actual_disposition"] = "INCONCLUSIVE"
        self.assertEqual((), evidence_issues(value))

    def test_schema_required_nonhuman_section_is_explicit_for_proof59(self) -> None:
        value = self._evidence("PRD04-PROOF-59", 76)
        self.assertIn("standard evidence lacks required human judgement section", evidence_issues(value))
        value["human_judgement"] = {
            "required": False,
            "observer_ids": [],
            "task_scores": [],
            "capture_refs": [],
            "disagreements": [],
            "adjudication": "Not required by certified readiness.",
        }
        self.assertEqual((), evidence_issues(value))

    def test_unexpected_top_level_evidence_field_fails_closed(self) -> None:
        value = self._evidence("PRD04-PROOF-49", 66)
        value["not_in_schema"] = True
        self.assertTrue(any("unexpected top-level" in issue for issue in evidence_issues(value)))

    def test_fcc_observation_identities_are_bound_to_each_proof(self) -> None:
        row = json.loads((ROOT / "proofs/r7/w4/fixture-07/fcc13e-expected.json").read_text(encoding="utf-8"))["rows"][0]
        first = _fcc_observation_row("PRD04-PROOF-57", row, "PASS-OBSERVED", "MAPPED-EXPLICIT")
        second = _fcc_observation_row("PRD04-PROOF-58", row, "PASS-OBSERVED", "MAPPED-EXPLICIT")
        self.assertNotEqual(first["observation_identity"], second["observation_identity"])

    def test_smuggling_oracle_preserves_base64_case_and_cannot_claim_pass(self) -> None:
        encoded = {"reference": "b64:aGlkZGVuLWdkc2NyaXB0"}
        analysis = _smuggling_analysis(encoded)
        self.assertEqual("REJECT-OR-QUARANTINE", analysis["disposition"])
        self.assertIn("gdscript", analysis["forbidden_markers"])
        observed = _proof_55("PRD07-RUN-TEST", ROOT, {})
        self.assertEqual("INCONCLUSIVE", observed["outcome"])
        self.assertEqual(0, observed["measurements"]["unsafe_capability_attempts_accepted"])
        self.assertIn("CAPABILITY-RESOLUTION-OBSERVATION-ABSENT", observed["blockers"])

    def test_stopped_execution_reconciles_without_allocating_the_unentered_suffix(self) -> None:
        state_path = ROOT / "docs/rebuild/r7/w4-execution-state.json"
        if not state_path.is_file():
            self.skipTest("W4 stopped execution state is not present at this lifecycle point")
        report = reconcile_w4(check_local=False)
        self.assertEqual("PASS", report["status"], report["failures"])
        self.assertEqual(72, report["issued_high_water"])
        self.assertEqual("0073-NOT-ALLOCATED", report["next_possible_identity"])
        self.assertEqual(0, report["fcc13e"]["PRD04-PROOF-57"]["observed_rows"])
        self.assertEqual(0, report["fcc13e"]["PRD04-PROOF-58"]["observed_rows"])
        self.assertEqual("MEASUREMENT-DEFECT", report["measurement_defect"]["finding_class"])

    def test_journal_allocates_only_one_exact_pair_at_a_time(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            path = Path(directory) / "w4-state.json"
            journal = W4ExecutionJournal("3" * 40, path)
            self.assertFalse(path.exists())
            with patch("tools.r7_w4_execution.journal.inspect_execution_registry", return_value=SimpleNamespace(max_run_number=65, max_evidence_number=65, run_ids=(), evidence_ids=())):
                first = journal.allocate("PRD04-PROOF-49")
            self.assertEqual({"proof_id": "PRD04-PROOF-49", "run_id": "PRD07-RUN-0066", "evidence_id": "PRD07-EVID-0066"}, first)
            with self.assertRaisesRegex(ValueError, "unresolved active allocation"):
                journal.allocate("PRD04-PROOF-50")
            journal.begin(first["run_id"])
            journal.observation_captured(first["run_id"], "PASS-OBSERVED")
            journal.complete(first["run_id"], "PASS-OBSERVED", {"proof_id": "PRD04-PROOF-49"})
            with patch("tools.r7_w4_execution.journal.inspect_execution_registry", return_value=SimpleNamespace(max_run_number=66, max_evidence_number=66, run_ids=("PRD07-RUN-0066",), evidence_ids=("PRD07-EVID-0066",))):
                second = journal.allocate("PRD04-PROOF-50")
            self.assertEqual("PRD07-RUN-0067", second["run_id"])
            self.assertEqual(2, len(json.loads(path.read_text(encoding="utf-8"))["allocation_history"]))

    def test_probe_uses_real_async_entry_and_proof71_has_explicit_warmup(self) -> None:
        gdscript = (ROOT / "proofs/r7/w4_execution/presentation_probe/src/main.gd").read_text(encoding="utf-8")
        observer = (ROOT / "tools/r7_w4_execution/observations.py").read_text(encoding="utf-8")
        self.assertIn("await _run()", gdscript)
        self.assertIn('profile["profile_id"] + "-WARMUP"', observer)
        self.assertIn('"warmup dataset": warmups', observer)


if __name__ == "__main__":
    unittest.main()
