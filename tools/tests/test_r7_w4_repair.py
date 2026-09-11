from __future__ import annotations

import base64
import json
import unittest

from tools.r7_w4_execution.contracts import ROOT
from tools.r7_w4_repair.human_review import all_review_templates, review_issues, review_template
from tools.r7_w4_repair.measurement import (
    classify_proof_55,
    measure_case,
    parse_case,
)
from tools.r7_w4_repair.readiness import plan_issues, rerun_plan
from tools.r7_w4_repair.recertification import calibration_cases


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
    def test_pending_templates_are_unsigned_and_cannot_masquerade_as_complete(self) -> None:
        for proof_id in ("PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-53"):
            value = review_template(proof_id)
            self.assertEqual("PENDING-HUMAN-REVIEW", value["status"])
            self.assertEqual((), review_issues(value))
            value["status"] = "COMPLETE"
            self.assertIn("completed review lacks reviewer attestation", review_issues(value))

    def test_parity_review_is_masked_until_separate_adjudication(self) -> None:
        value = review_template("PRD04-PROOF-51")
        self.assertEqual(["SOURCE-A", "SOURCE-B"], value["masked_sources"])
        self.assertFalse(value["reviewer_can_see_source_origin"])
        self.assertEqual("SEPARATE-ADJUDICATOR-REQUIRED", value["unmasking_policy"])

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


if __name__ == "__main__":
    unittest.main()
