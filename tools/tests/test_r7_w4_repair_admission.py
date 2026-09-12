from __future__ import annotations

import copy
import json
import subprocess
import unittest

from tools.r7_w4_repair.admission import (
    CONTROL_PATHS,
    MANIFEST_PATH,
    REPAIR_COMMIT,
    REPAIR_PARENT_COMMIT,
    REPAIR_PATH_STATUS,
    STOPPED_SUPERSEDED_PATHS,
    admitted_paths,
    manifest_issues,
    scanner_admits,
)


class R7W4RepairAdmissionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.manifest = json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig"))
        cls.head = subprocess.run(
            ["git", "rev-parse", "HEAD"],
            cwd=MANIFEST_PATH.parents[3],
            text=True,
            capture_output=True,
            check=True,
        ).stdout.strip()

    def test_manifest_validates_historical_stop_and_current_repair_separately(self) -> None:
        self.assertEqual((), manifest_issues(self.manifest, self.head))
        historical = self.manifest["historical_stopped_boundary"]
        repair = self.manifest["repair_boundary"]
        self.assertEqual("IMMUTABLE-HISTORICAL-STOPPED-EXECUTION-BOUNDARY", historical["current_lifecycle_role"])
        self.assertEqual("GIT-OBJECTS-AT-ORIGINAL-LIFECYCLE-COMMIT", historical["validation_mode"])
        self.assertEqual(REPAIR_COMMIT, repair["repair_commit"])
        self.assertEqual(REPAIR_PARENT_COMMIT, repair["repair_parent_commit"])
        self.assertEqual("CURRENT-POST-REPAIR-PRE-RECERTIFICATION-ADMISSION", self.manifest["lifecycle_role"])

    def test_repair_commit_path_set_and_change_kinds_are_exact(self) -> None:
        rows = self.manifest["repair_boundary"]["artifacts"]
        actual = {row["path"]: row["change"] for row in rows}
        self.assertEqual(dict(REPAIR_PATH_STATUS), actual)
        self.assertEqual(22, len(actual))
        self.assertEqual(18, sum(change == "ADDED" for change in actual.values()))
        self.assertEqual(4, sum(change == "MODIFIED" for change in actual.values()))

    def test_scanner_admits_only_exact_manifest_paths(self) -> None:
        paths = admitted_paths(self.manifest)
        for relative in (*(path for path, _ in REPAIR_PATH_STATUS), *CONTROL_PATHS):
            self.assertTrue(scanner_admits(relative, paths), relative)
        self.assertTrue(
            scanner_admits(
                "proofs/r7/w4_execution/presentation_probe/capability_fixtures/benign_data.tres",
                paths,
            )
        )
        for relative in (
            "proofs/r7/w4_execution/presentation_probe/capability_fixtures/not-admitted.tres",
            "tools/r7_w4_repair/not_admitted.py",
            "scripts/main.gd",
        ):
            self.assertFalse(scanner_admits(relative, paths), relative)

    def test_historical_supersession_is_explicit_and_fail_closed(self) -> None:
        self.assertEqual(
            {
                "tools/r7_w4_execution/contracts.py",
                "tools/r7_w4_execution/observations.py",
                "tools/r7_w4_stop_audit.py",
                "tools/tests/test_r7_w4_execution.py",
                "tools/verify.py",
                "tools/verify_rebuild_boundary.py",
            },
            set(STOPPED_SUPERSEDED_PATHS),
        )
        changed = copy.deepcopy(self.manifest)
        changed["historical_stopped_boundary"]["lifecycle_validation_commit"] = "0" * 40
        issues = manifest_issues(changed, self.head)
        self.assertTrue(any("historical stopped" in issue for issue in issues), issues)

    def test_admission_allocates_nothing_and_executes_nothing(self) -> None:
        self.assertEqual(72, self.manifest["issued_high_water"])
        self.assertEqual("0073-NOT-ALLOCATED", self.manifest["next_possible_identity"])
        self.assertEqual([], self.manifest["allocated_run_ids"])
        self.assertEqual([], self.manifest["allocated_evidence_ids"])
        self.assertFalse(self.manifest["proof_execution_started"])
        self.assertFalse(self.manifest["identity_allocation_started"])
        self.assertEqual("CLOSED-PENDING-SEPARATE-RECERTIFICATION-AND-RERUN-AUTHORIZATION", self.manifest["execution_gate"])


if __name__ == "__main__":
    unittest.main()
