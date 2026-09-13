from __future__ import annotations

import base64
import copy
import hashlib
import json
import tempfile
import unittest
from pathlib import Path
from types import SimpleNamespace
from unittest.mock import patch

from tools.r7_w4_execution.contracts import ROOT
from tools.r7_w4_repair.human_review import (
    SYNTHETIC_PURPOSE,
    all_review_templates,
    combine_observations,
    ingest_review_for_execution,
    review_issues,
    review_template,
)
from tools.r7_w4_repair.measurement import (
    classify_proof_55,
    measure_case,
    parse_case,
)
from tools.r7_w4_repair.readiness import plan_issues, rerun_plan
from tools.r7_w4_repair.recertification import calibration_cases
from tools.r7_w4_repair_audit import execution_state_identity_issues
from tools.r7_w3_runtime.execution_plan import inspect_execution_registry


class R7W4MeasurementRepairTests(unittest.TestCase):
    def test_encoded_payload_preserves_case_and_extracts_structured_request(self) -> None:
        payload = {
            "case_sensitive_token": "AbCdEfZ+/09",
            "resource_path": "res://capability_fixtures/file_canary.gd",
            "requested_capability": "script",
        }
        encoded = "b64:" + base64.b64encode(
            json.dumps(payload, separators=(",", ":")).encode("utf-8")
        ).decode("ascii")
        parsed = parse_case({"reference": encoded})
        self.assertEqual("DECODED", parsed["stages"]["decoding"]["state"])
        self.assertEqual("AbCdEfZ+/09", parsed["request"]["case_sensitive_token"])
        self.assertEqual(payload, parsed["request"])

    def test_actual_resource_type_not_marker_text_controls_capability_decision(self) -> None:
        benign = {
            "resource_path": "res://capability_fixtures/benign_data.tres",
            "requested_capability": "bounded_data",
            "description": "harmless script native editor-plugin tutorial text",
        }

        def observe(_request: dict) -> dict:
            return {
                "supported": True,
                "engine_resolution": {"state": "RESOLVED", "resource_type": "Resource", "dependencies": []},
                "capability_acquisition": {"state": "BOUNDED-DATA-ACQUIRED", "unsafe": False},
                "execution": {"state": "NOT-EXECUTED"},
                "filesystem_effect": {"state": "ABSENT"},
                "external_access_effect": {"state": "ABSENT"},
            }

        row = measure_case("FALSE-POSITIVE-CONTROL", benign, "ACCEPT-BOUNDED-DATA", observe)
        self.assertEqual("ACCEPT-BOUNDED-DATA", row["actual_disposition"])
        self.assertEqual("RESOLVED", row["stages"]["engine_resolution"]["state"])

    def test_unsupported_observation_can_only_be_inconclusive(self) -> None:
        request = {
            "resource_path": "res://capability_fixtures/not_supported.unknown",
            "requested_capability": "bounded_data",
        }

        def unsupported(_request: dict) -> dict:
            return {
                "supported": False,
                "engine_resolution": {"state": "UNSUPPORTED", "resource_type": ""},
                "capability_acquisition": {"state": "UNKNOWN", "unsafe": None},
                "execution": {"state": "UNKNOWN"},
                "filesystem_effect": {"state": "UNKNOWN"},
                "external_access_effect": {"state": "UNKNOWN"},
            }

        row = measure_case("UNSUPPORTED-CONTROL", request, "ACCEPT-BOUNDED-DATA", unsupported)
        result = classify_proof_55([row])
        self.assertEqual("INCONCLUSIVE", row["actual_disposition"])
        self.assertEqual("INCONCLUSIVE", result["outcome"])

    def test_observed_hostile_side_effect_is_a_canonical_failure(self) -> None:
        row = {
            "case_id": "CONTROLLED-ESCAPE",
            "expected_disposition": "REJECT-OR-QUARANTINE",
            "actual_disposition": "UNSAFE-CAPABILITY-EXECUTED",
            "stages": {
                "engine_resolution": {"state": "RESOLVED"},
                "capability_acquisition": {"state": "UNSAFE-CAPABILITY-ACQUIRED", "unsafe": True},
                "execution": {"state": "EXECUTED"},
                "filesystem_effect": {"state": "OBSERVED"},
                "external_access_effect": {"state": "ABSENT"},
            },
        }
        self.assertEqual("FAIL-OBSERVED", classify_proof_55([row])["outcome"])


class R7W4HumanReviewTests(unittest.TestCase):
    @staticmethod
    def _reference(reference_id: str) -> dict:
        return {
            "reference_id": reference_id,
            "kind": "synthetic-test-only",
            "scope": "RUN-ROOT",
            "path": "synthetic-validator/evidence.json",
            "sha256": "a" * 64,
        }

    def _fill_criteria(self, rows: list, judgement: str, prefix: str) -> None:
        for index, row in enumerate(rows):
            row["observed_result"] = "Synthetic validator-only observation."
            row["judgement"] = judgement
            row["evidence_references"] = [self._reference(prefix + "-%02d" % index)]

    def _complete_synthetic(self, proof_id: str, judgement: str = "PASS-OBSERVED") -> dict:
        value = review_template(proof_id)
        value["status"] = "COMPLETE"
        value["review_lifecycle_id"] = "SYNTHETIC-TEST-ONLY-" + proof_id
        value["review_purpose"] = SYNTHETIC_PURPOSE
        value["identity_binding"].update(
            {
                "source_revision": "1" * 40,
                "build_identity": "2" * 64,
                "artifact_sha256": "3" * 64,
                "environment_identity": {"test_only": True, "not_production_execution": True},
            }
        )
        value["reviewer"].update(
            {
                "reviewer_kind": "SYNTHETIC-TEST-ONLY",
                "pseudonymous_reviewer_id": "SYNTHETIC-REVIEWER-NOT-A-PERSON",
                "role_id": "VALIDATOR-TEST-ONLY",
                "independence_declaration": True,
            }
        )
        value["evidence_references"] = [self._reference("GLOBAL")]
        self._fill_criteria(value["criteria"], judgement, "OVERALL")
        value["judgement"] = judgement
        value["attestation"].update(
            {
                "signature_state": "SIGNED",
                "signed_by": "SYNTHETIC-REVIEWER-NOT-A-PERSON",
                "signed_at_utc": "2026-09-13T00:00:00Z",
            }
        )
        if proof_id == "PRD04-PROOF-50":
            for index, row in enumerate(value["asset_class_reviews"]):
                row["judgement"] = judgement
                self._fill_criteria(row["criteria"], judgement, "CLASS-%02d" % index)
        elif proof_id == "PRD04-PROOF-51":
            packages = json.loads(
                (ROOT / "proofs/r7/w4/fixture-07/source-packages.json").read_text(encoding="utf-8")
            )["packages"]
            groups = {}
            for row in packages:
                if row.get("matched_task"):
                    groups.setdefault(row["matched_task"], []).append(row["source_id"])
            for index, row in enumerate(value["paired_task_reviews"]):
                for source_index, source in enumerate(row["masked_source_reviews"]):
                    source["judgement"] = judgement
                    self._fill_criteria(source["criteria"], judgement, "PAIR-%02d-%02d" % (index, source_index))
                row["comparison_observation"] = "Synthetic validator-only comparison."
                row["comparison_evidence_references"] = [self._reference("COMPARE-%02d" % index)]
                row["comparison_judgement"] = judgement
                source_ids = sorted(groups[row["task_id"]])
                row["revealed_source_ids"] = {"SOURCE-A": source_ids[0], "SOURCE-B": source_ids[1]}
            value["origin_mapping_reference"] = {
                "reference_id": "ORIGIN-MAP",
                "kind": "origin-mapping",
                "scope": "REPOSITORY",
                "path": "proofs/r7/w4_human_review/proof-51-origin-mapping-pending.json",
                "sha256": "b" * 64,
            }
            attestation_hash = hashlib.sha256(
                (json.dumps(value["attestation"], sort_keys=True, separators=(",", ":"), ensure_ascii=True) + "\n").encode("utf-8")
            ).hexdigest()
            value["adjudication"].update(
                {
                    "status": "COMPLETE-SEPARATE-ADJUDICATION",
                    "adjudicator_role_id": "SYNTHETIC-ADJUDICATOR-TEST-ONLY",
                    "adjudicator_pseudonymous_id": "SYNTHETIC-ADJUDICATOR-NOT-A-PERSON",
                    "reviewer_attestation_sha256": attestation_hash,
                    "origin_mapping_sha256": "b" * 64,
                    "unmasked_after_review_attestation": True,
                    "unmasked_at_utc": "2026-09-13T00:01:00Z",
                    "result": judgement,
                    "evidence_references": [self._reference("ADJUDICATION")],
                }
            )
        else:
            for index, row in enumerate(value["renderer_lane_reviews"]):
                lane_judgement = judgement
                support = "CLAIMED-SUPPORTED"
                if judgement == "INCONCLUSIVE" and index == 0:
                    support = "UNDETERMINED"
                row["support_disposition"] = support
                row["judgement"] = lane_judgement
                row["evidence_references"] = [self._reference("LANE-%02d" % index)]
                self._fill_criteria(row["criteria"], lane_judgement, "LANE-%02d" % index)
        return value

    def test_pending_templates_are_unsigned_and_cannot_masquerade_as_complete(self) -> None:
        for proof_id in ("PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-53"):
            value = review_template(proof_id)
            self.assertEqual("PENDING-HUMAN-REVIEW", value["status"])
            self.assertEqual((), review_issues(value))
            value["status"] = "COMPLETE"
            self.assertIn("completed review lacks valid reviewer attestation", review_issues(value))

    def test_parity_review_is_masked_until_separate_adjudication(self) -> None:
        value = review_template("PRD04-PROOF-51")
        self.assertEqual(["SOURCE-A", "SOURCE-B"], value["masked_sources"])
        self.assertFalse(value["reviewer_can_see_source_origin"])
        self.assertEqual("SEPARATE-ADJUDICATOR-POST-ATTESTATION", value["unmasking_policy"])

    def test_deficient_complete_records_fail_each_proof_specific_law(self) -> None:
        proof_50 = self._complete_synthetic("PRD04-PROOF-50")
        proof_50["asset_class_reviews"].pop()
        self.assertIn("proof-50 asset-class review coverage differs", review_issues(proof_50))
        proof_51 = self._complete_synthetic("PRD04-PROOF-51")
        proof_51["origin_mapping_reference"] = None
        self.assertIn("proof-51 origin mapping lacks evidence references", review_issues(proof_51))
        proof_53 = self._complete_synthetic("PRD04-PROOF-53")
        proof_53["renderer_lane_reviews"][0]["evidence_references"] = []
        self.assertIn("proof-53 lane PROFILE-FORWARD-PLUS lacks evidence references", review_issues(proof_53))

    def test_complete_synthetic_records_pass_validation_but_are_not_production_reviews(self) -> None:
        for proof_id in ("PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-53"):
            value = self._complete_synthetic(proof_id)
            self.assertEqual((), review_issues(value), (proof_id, review_issues(value)))
            self.assertEqual(SYNTHETIC_PURPOSE, value["review_purpose"])
            self.assertEqual("SYNTHETIC-TEST-ONLY", value["reviewer"]["reviewer_kind"])

    def test_ingestion_rejects_synthetic_wrong_stale_and_unsigned_records(self) -> None:
        build = {
            "source_revision": "1" * 40,
            "build_identity": "2" * 64,
            "artifact_sha256": "3" * 64,
            "environment": {"test_only": True, "not_production_execution": True},
        }
        state_path = ROOT / "docs/rebuild/r7/w4-execution-state.json"
        state_before = hashlib.sha256(state_path.read_bytes()).hexdigest()
        with tempfile.TemporaryDirectory() as directory:
            review_root = Path(directory) / "review"
            run_root = Path(directory) / "run"
            review_root.mkdir()
            path = review_root / "proof-50-pending.json"
            synthetic = self._complete_synthetic("PRD04-PROOF-50")
            path.write_text(json.dumps(synthetic), encoding="utf-8")
            result = ingest_review_for_execution("PRD04-PROOF-50", "1" * 40, build, run_root, review_root=review_root)
            self.assertEqual("REJECTED", result["review_state"])
            self.assertTrue(any("rejects synthetic" in issue for issue in result["validation_issues"]))

            wrong = self._complete_synthetic("PRD04-PROOF-51")
            path.write_text(json.dumps(wrong), encoding="utf-8")
            result = ingest_review_for_execution("PRD04-PROOF-50", "1" * 40, build, run_root, review_root=review_root)
            self.assertTrue(any("does not match" in issue for issue in result["validation_issues"]))

            stale = self._complete_synthetic("PRD04-PROOF-50")
            stale["identity_binding"]["source_revision"] = "4" * 40
            path.write_text(json.dumps(stale), encoding="utf-8")
            result = ingest_review_for_execution("PRD04-PROOF-50", "1" * 40, build, run_root, review_root=review_root)
            self.assertTrue(any("binding differs" in issue for issue in result["validation_issues"]))

            unsigned = self._complete_synthetic("PRD04-PROOF-50")
            unsigned["attestation"]["signature_state"] = "UNSIGNED"
            path.write_text(json.dumps(unsigned), encoding="utf-8")
            result = ingest_review_for_execution("PRD04-PROOF-50", "1" * 40, build, run_root, review_root=review_root)
            self.assertTrue(any("attestation" in issue for issue in result["validation_issues"]))
        self.assertEqual(state_before, hashlib.sha256(state_path.read_bytes()).hexdigest())

    def test_pending_ingestion_remains_inconclusive_and_combiner_never_auto_passes(self) -> None:
        build = {
            "source_revision": "1" * 40,
            "build_identity": "2" * 64,
            "artifact_sha256": "3" * 64,
            "environment": {"test_only": True},
        }
        with tempfile.TemporaryDirectory() as directory:
            review_root = Path(directory) / "review"
            review_root.mkdir()
            (review_root / "proof-50-pending.json").write_text(json.dumps(review_template("PRD04-PROOF-50")), encoding="utf-8")
            pending = ingest_review_for_execution("PRD04-PROOF-50", "1" * 40, build, Path(directory) / "run", review_root=review_root)
        self.assertEqual("PENDING-HUMAN-REVIEW", pending["review_state"])
        self.assertEqual("INCONCLUSIVE", combine_observations(True, pending)[0])

    def test_prevalidated_human_dispositions_drive_contract_combination(self) -> None:
        for judgement, expected in (
            ("PASS-OBSERVED", "PASS-OBSERVED"),
            ("FAIL-OBSERVED", "FAIL-OBSERVED"),
            ("INCONCLUSIVE", "INCONCLUSIVE"),
        ):
            synthetic_combiner_input = {
                "review_state": "ACCEPTED-PRODUCTION-HUMAN",
                "validated_judgement": judgement,
            }
            self.assertEqual(expected, combine_observations(True, synthetic_combiner_input)[0])
        self.assertEqual("FAIL-OBSERVED", combine_observations(False, {"review_state": "PENDING-HUMAN-REVIEW"})[0])

    def test_committed_forms_equal_the_governed_pending_templates(self) -> None:
        root = ROOT / "proofs/r7/w4_human_review"
        for proof_id, expected in all_review_templates().items():
            path = root / (proof_id.lower().replace("prd04-proof-", "proof-") + "-pending.json")
            self.assertEqual(expected, json.loads(path.read_text(encoding="utf-8")))
            self.assertEqual((), review_issues(expected))


class R7W4RerunPlanTests(unittest.TestCase):
    def test_plan_classifies_all_proofs_without_allocating_an_identity(self) -> None:
        plan = rerun_plan()
        self.assertEqual(15, len(plan["proofs"]))
        self.assertEqual(72, plan["issued_high_water"])
        self.assertEqual("0073-NOT-ALLOCATED", plan["next_possible_identity"])
        previews = [row for row in plan["proofs"] if row.get("preview")]
        self.assertTrue(previews)
        self.assertTrue(all(row["preview"]["state"] == "PREVIEW-NOT-ALLOCATED" for row in previews))
        self.assertEqual([], plan["allocated_run_ids"])
        self.assertEqual([], plan["allocated_evidence_ids"])
        self.assertEqual((), plan_issues(plan))

    def test_independent_calibration_corpus_covers_required_failure_modes(self) -> None:
        cases = calibration_cases()
        self.assertEqual(15, len(cases))
        case_ids = {row["case_id"] for row in cases}
        for marker in ("BENIGN", "ENCODED", "SCRIPT", "EDITOR", "NATIVE", "URI", "TRAVERSAL", "ABSOLUTE", "MALFORMED", "UNSUPPORTED", "FILESYSTEM", "EXTERNAL"):
            self.assertTrue(any(marker in case_id for case_id in case_ids), marker)


class R7W4RepairAuditIdentityTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.state = json.loads(
            (ROOT / "docs/rebuild/r7/w4-execution-state.json").read_text(encoding="utf-8")
        )

    def test_canonical_state_derives_exact_0072_high_water_without_top_level_marker(self) -> None:
        self.assertNotIn("issued_high_water", self.state)
        self.assertNotIn("next_possible_identity", self.state)
        self.assertEqual((), execution_state_identity_issues(self.state, ROOT))

    def test_false_0073_allocation_fails_closed(self) -> None:
        changed = copy.deepcopy(self.state)
        changed["allocated_run_ids"].append("PRD07-RUN-0073")
        changed["allocated_evidence_ids"].append("PRD07-EVID-0073")
        changed["allocation_history"].append(
            {
                "run_id": "PRD07-RUN-0073",
                "evidence_id": "PRD07-EVID-0073",
                "proof_id": "PRD04-PROOF-56",
            }
        )
        issues = execution_state_identity_issues(changed, ROOT)
        self.assertTrue(any("false 0073+" in issue for issue in issues), issues)

    def test_registry_state_disagreement_fails_closed(self) -> None:
        actual = inspect_execution_registry(ROOT)
        disagreeing = SimpleNamespace(
            max_run_number=71,
            max_evidence_number=72,
            run_ids=actual.run_ids,
            evidence_ids=actual.evidence_ids,
            mappings=actual.mappings,
        )
        with patch("tools.r7_w4_repair_audit.inspect_execution_registry", return_value=disagreeing):
            issues = execution_state_identity_issues(self.state, ROOT)
        self.assertTrue(any("registry high-water" in issue for issue in issues), issues)


if __name__ == "__main__":
    unittest.main()
