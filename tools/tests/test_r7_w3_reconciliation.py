"""Regression checks for the immutable W3 post-execution reconciliation."""

from __future__ import annotations

import unittest
from unittest.mock import patch

from tools.r7_w3_reconciliation import (
    EXPECTED_JOURNAL_EVIDENCE,
    EXPECTED_JOURNAL_RUNS,
    EXPECTED_PROOF_ORDER,
    PROOF_IMPLEMENTATION_COMMIT,
    PROOF_SOURCE_TREE_IDENTITY,
    ROOT,
    _admitted_paths,
    audit_execution,
    build_terminal_readiness,
)


EXECUTED_SOURCE_REVISION = "cc61b5d7b4ee8f58c8c6bb885a2c6bcfd7026489"
EVIDENCE_COMMIT = "5605ea1157ff8129a8cdef555c81f1a14a27e021"


class R7W3ReconciliationTests(unittest.TestCase):
    def test_w3_audit_remains_strict_when_later_wave_packs_are_visible(self) -> None:
        audit = audit_execution(EXECUTED_SOURCE_REVISION, EVIDENCE_COMMIT)
        if (ROOT / "docs/rebuild/r7/w4-execution-state.json").is_file():
            self.assertEqual("FAIL", audit["status"])
            self.assertEqual(
                ["retained evidence-pack registry differs from 0001-0050 plus 0059-0065"],
                audit["issues"],
            )
            return
        self.assertEqual("PASS", audit["status"], audit["issues"])
        self.assertGreaterEqual(audit["checks"], 500)
        self.assertEqual(7, len(audit["proofs"]))
        self.assertEqual([row[1] for row in EXPECTED_PROOF_ORDER], [row["run_id"] for row in audit["proofs"]])

    def test_terminal_readiness_distinguishes_all_issued_and_successful_rerun_ids(self) -> None:
        audit = {
            "status": "PASS",
            "issues": [],
            "checks": 501,
            "proofs": [{"proof_id": row[0], "run_id": row[1], "evidence_id": row[2]} for row in EXPECTED_PROOF_ORDER],
            "exports": {"client": {}, "headless": {}},
            "registry": {"run_high_water": 65},
            "dependency_identity": {},
            "environment_hashes": {},
        }
        with patch("tools.r7_w3_reconciliation.audit_execution", return_value=audit):
            readiness = build_terminal_readiness(EXECUTED_SOURCE_REVISION, EVIDENCE_COMMIT)
        self.assertEqual("W3-EXECUTION-COMPLETE", readiness["package_state"])
        self.assertEqual("OBSERVED", readiness["proof_execution"])
        self.assertEqual("CLOSED-W3-EXECUTION-COMPLETE", readiness["execution_gate"])
        self.assertEqual(PROOF_IMPLEMENTATION_COMMIT, readiness["proof_implementation_commit"])
        self.assertEqual(PROOF_SOURCE_TREE_IDENTITY, readiness["proof_source_tree_identity"])
        self.assertEqual(list(EXPECTED_JOURNAL_RUNS), readiness["all_w3_journal_run_ids"])
        self.assertEqual(list(EXPECTED_JOURNAL_EVIDENCE), readiness["all_w3_journal_evidence_ids"])
        self.assertEqual([row[1] for row in EXPECTED_PROOF_ORDER], readiness["allocated_run_ids"])
        self.assertEqual(["PRD07-RUN-0058"], readiness["invalidated_run_ids"])
        self.assertEqual([], readiness["issues"])
        self.assertEqual("CLOSED", readiness["prd08_evaluation"])

    def test_terminal_admission_is_exact_and_excludes_invalidated_or_quarantined_packs(self) -> None:
        paths = set(_admitted_paths())
        for _, run_id, _ in EXPECTED_PROOF_ORDER:
            self.assertTrue(any(path.startswith(f"docs/rebuild/r7/execution-evidence/{run_id}/") for path in paths))
        for number in range(51, 59):
            self.assertFalse(any(path.startswith(f"docs/rebuild/r7/execution-evidence/PRD07-RUN-{number:04d}/") for path in paths))
        self.assertIn("tools/r7_w3_reconciliation.py", paths)
        self.assertIn("tools/verify_rebuild_boundary.py", paths)
        self.assertFalse(any(path.endswith((".exe", ".dll", ".pck")) for path in paths))

    def test_historical_identity_drift_is_rejected(self) -> None:
        key = "docs/rebuild/r7/w3-execution-boundary-fixture-launch-repaired.json"
        with patch.dict(
            "tools.r7_w3_reconciliation.IMMUTABLE_FILE_IDENTITIES",
            {key: ("0" * 40, "0" * 64)},
            clear=False,
        ):
            audit = audit_execution(EXECUTED_SOURCE_REVISION, EVIDENCE_COMMIT)
        self.assertEqual("FAIL", audit["status"])
        self.assertTrue(any("immutable W3 artifact" in issue for issue in audit["issues"]))


if __name__ == "__main__":
    unittest.main()
