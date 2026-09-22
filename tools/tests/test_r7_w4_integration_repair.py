from __future__ import annotations

import copy
import hashlib
import json
import unittest
from contextlib import contextmanager
from typing import Iterator
from unittest.mock import patch

from tools.r7_w4_execution.contracts import PROTECTED_LOCAL_PATHS, ROOT
from tools.r7_w4_repair import integration_admission
from tools.r7_w4_repair.integration_admission import (
    DIAGNOSTIC_PATHS,
    MANIFEST_PATH,
    PACKAGE_PATHS,
    admitted_paths,
    manifest_issues,
    scanner_admits,
)

PUBLISHED_REVISION = "11900c72c92f8869c0072907899f0899b524dc32"


class R7W4IntegrationRepairAdmissionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.value = json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig"))

    @staticmethod
    def _git_blob(data: bytes) -> str:
        return hashlib.sha1(b"blob " + str(len(data)).encode("ascii") + b"\0" + data).hexdigest()

    @classmethod
    def _exact_staged_snapshot(cls) -> dict[str, tuple[str, bytes]]:
        snapshot: dict[str, tuple[str, bytes]] = {}
        for relative in PACKAGE_PATHS:
            blob = str(integration_admission._git("rev-parse", PUBLISHED_REVISION + ":" + relative))
            snapshot[relative] = (blob, integration_admission._blob_data(blob))
        return snapshot

    @staticmethod
    @contextmanager
    def _base_head() -> Iterator[None]:
        actual_git = integration_admission._git

        def git_at_base(*args: str, **kwargs: object) -> bytes | str:
            if args == ("rev-parse", "HEAD"):
                return integration_admission.BASE_REVISION
            return actual_git(*args, **kwargs)

        with patch.object(integration_admission, "_git", side_effect=git_at_base):
            yield

    @classmethod
    @contextmanager
    def _preparation_context(cls, *, staged_paths: tuple[str, ...] = ()) -> Iterator[None]:
        snapshot = cls._exact_staged_snapshot()
        actual_source_record = integration_admission._source_record

        def source_at_preparation_base(
            relative: str,
            mode: str,
            source_revision: str,
            staged_snapshot: dict[str, tuple[str, bytes]],
        ) -> tuple[str, bytes] | None:
            if mode == "preparation":
                return snapshot.get(relative)
            return actual_source_record(relative, mode, source_revision, staged_snapshot)

        with cls._base_head(), patch.object(
            integration_admission, "_working_changed_paths", return_value=set(PACKAGE_PATHS)
        ), patch.object(integration_admission, "_staged_paths", return_value=staged_paths), patch.object(
            integration_admission, "_source_record", side_effect=source_at_preparation_base
        ):
            yield

    @classmethod
    @contextmanager
    def _staged_context(cls, snapshot: dict[str, tuple[str, bytes]]) -> Iterator[None]:
        with cls._base_head(), patch.object(
            integration_admission, "_working_changed_paths", return_value=set()
        ), patch.object(integration_admission, "_staged_snapshot", return_value=snapshot):
            yield

    def test_preparation_mode_passes_with_empty_index(self) -> None:
        with self._preparation_context():
            self.assertEqual(
                (),
                manifest_issues(
                    self.value,
                    source_revision=integration_admission.BASE_REVISION,
                    mode="preparation",
                ),
            )
        self.assertEqual("EXACT-PATH-HASH-PINNED-FAIL-CLOSED", self.value["validation_law"])
        self.assertEqual([], self.value["package_allocated_run_ids"])
        self.assertEqual([], self.value["package_allocated_evidence_ids"])
        self.assertFalse(self.value["proof_execution_started"])
        self.assertFalse(self.value["identity_allocation_started"])
        self.assertEqual(72, self.value["issued_run_high_water"])
        self.assertEqual(72, self.value["issued_evidence_high_water"])

    def test_preparation_mode_fails_with_staged_content(self) -> None:
        with self._preparation_context(staged_paths=tuple(PACKAGE_PATHS)):
            issues = manifest_issues(
                self.value,
                source_revision=integration_admission.BASE_REVISION,
                mode="preparation",
            )
        self.assertTrue(any("preparation contains staged paths" in issue for issue in issues), issues)

    def test_staged_mode_passes_with_exact_governed_index(self) -> None:
        with self._staged_context(self._exact_staged_snapshot()):
            self.assertEqual(
                (),
                manifest_issues(
                    self.value,
                    source_revision=integration_admission.BASE_REVISION,
                    mode="staged",
                ),
            )

    def test_staged_mode_fails_with_one_authorized_path_missing(self) -> None:
        snapshot = self._exact_staged_snapshot()
        snapshot.pop(PACKAGE_PATHS[1])
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any("missing staged paths" in issue for issue in issues), issues)

    def test_staged_mode_fails_with_extra_unrelated_path(self) -> None:
        snapshot = self._exact_staged_snapshot()
        data = b"unrelated\n"
        snapshot["unrelated.txt"] = (self._git_blob(data), data)
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any("extra staged paths" in issue for issue in issues), issues)

    def test_staged_mode_fails_with_protected_path(self) -> None:
        snapshot = self._exact_staged_snapshot()
        relative = next(iter(PROTECTED_LOCAL_PATHS))
        data = (ROOT / relative).read_bytes()
        snapshot[relative] = (self._git_blob(data), data)
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any("protected paths" in issue for issue in issues), issues)

    def test_staged_mode_fails_with_blocked_diagnostic(self) -> None:
        snapshot = self._exact_staged_snapshot()
        relative = DIAGNOSTIC_PATHS[0]
        data = b'{"fixture":"blocked-diagnostic"}\n'
        snapshot[relative] = (self._git_blob(data), data)
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any("blocked diagnostics" in issue for issue in issues), issues)

    def test_staged_mode_fails_when_staged_blob_differs(self) -> None:
        snapshot = self._exact_staged_snapshot()
        relative = self.value["artifacts"][0]["path"]
        data = snapshot[relative][1] + b"tampered\n"
        snapshot[relative] = (self._git_blob(data), data)
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any("content identity differs" in issue for issue in issues), issues)

    def test_staged_mode_fails_when_manifest_blob_differs(self) -> None:
        snapshot = self._exact_staged_snapshot()
        data = snapshot[PACKAGE_PATHS[0]][1] + b" \n"
        snapshot[PACKAGE_PATHS[0]] = (self._git_blob(data), data)
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any("manifest" in issue and "selected lifecycle source" in issue for issue in issues), issues)

    def test_staged_mode_fails_with_execution_identity_path(self) -> None:
        snapshot = self._exact_staged_snapshot()
        relative = "docs/rebuild/r7/execution-evidence/PRD07-RUN-0073/result.json"
        data = b"{}\n"
        snapshot[relative] = (self._git_blob(data), data)
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any("execution/evidence identity paths" in issue for issue in issues), issues)

    def test_staged_mode_fails_on_unlisted_superseded_lookalike(self) -> None:
        snapshot = self._exact_staged_snapshot()
        relative = "tools/r7_w4_execution/superseded-looking-but-unlisted.py"
        data = b"# lookalike\n"
        snapshot[relative] = (self._git_blob(data), data)
        with self._staged_context(snapshot):
            issues = manifest_issues(self.value, source_revision=integration_admission.BASE_REVISION, mode="staged")
        self.assertTrue(any(relative in issue for issue in issues), issues)

    def test_scanner_admits_only_the_exact_package_paths(self) -> None:
        paths = admitted_paths(self.value)
        self.assertEqual(tuple(sorted(PACKAGE_PATHS)), paths)
        for relative in PACKAGE_PATHS:
            self.assertTrue(scanner_admits(relative, paths), relative)
        for relative in (
            "tools/r7_w4_repair/future-unlisted.py",
            "tools/r7_w4_execution/superseded-looking-but-unlisted.py",
            "proofs/r7/w4_human_review/unlisted-complete.json",
        ):
            self.assertFalse(scanner_admits(relative, paths), relative)

    def test_artifact_tampering_fails_closed(self) -> None:
        changed = copy.deepcopy(self.value)
        changed["artifacts"][0]["sha256"] = "0" * 64
        with self._preparation_context():
            issues = manifest_issues(
                changed,
                source_revision=integration_admission.BASE_REVISION,
                mode="preparation",
            )
        self.assertTrue(any("content identity differs" in issue for issue in issues), issues)

    def test_preview_and_fcc_rows_are_nonexecuting_only(self) -> None:
        self.assertEqual(list(range(73, 85)), [int(row["run_id"].rsplit("-", 1)[1]) for row in self.value["rerun_preview"]])
        self.assertTrue(all(row["state"] == "PREVIEW-NOT-ALLOCATED" for row in self.value["rerun_preview"]))
        self.assertEqual(0, self.value["fcc13e"]["proof_observations_created"])

    def test_staged_validation_cannot_create_or_imply_execution_identity(self) -> None:
        state = ROOT / "docs/rebuild/r7/w4-execution-state.json"
        before = hashlib.sha256(state.read_bytes()).hexdigest()
        evidence = ROOT / "docs/rebuild/r7/execution-evidence"
        before_paths = sorted(path.relative_to(evidence).as_posix() for path in evidence.rglob("*") if path.is_file())
        with self._staged_context(self._exact_staged_snapshot()):
            self.assertEqual(
                (),
                manifest_issues(
                    self.value,
                    source_revision=integration_admission.BASE_REVISION,
                    mode="staged",
                ),
            )
        self.assertEqual(before, hashlib.sha256(state.read_bytes()).hexdigest())
        self.assertEqual(before_paths, sorted(path.relative_to(evidence).as_posix() for path in evidence.rglob("*") if path.is_file()))

        changed = copy.deepcopy(self.value)
        changed["identity_allocation_started"] = True
        with self._staged_context(self._exact_staged_snapshot()):
            issues = manifest_issues(
                changed,
                source_revision=integration_admission.BASE_REVISION,
                mode="staged",
            )
        self.assertTrue(any("execution or identity closure" in issue for issue in issues), issues)

    def test_published_mode_does_not_reinterpret_the_uncommitted_base(self) -> None:
        self.assertEqual(
            (),
            manifest_issues(self.value, source_revision=PUBLISHED_REVISION, mode="published"),
        )
        issues = manifest_issues(
            self.value,
            source_revision=integration_admission.BASE_REVISION,
            mode="published",
        )
        self.assertTrue(any("published source is not a later exact commit" in issue for issue in issues), issues)

        actual_git = integration_admission._git

        def wrong_parent(*args: str, **kwargs: object) -> bytes | str:
            if args == ("rev-parse", PUBLISHED_REVISION + "^"):
                return "0" * 40
            return actual_git(*args, **kwargs)

        with patch.object(integration_admission, "_git", side_effect=wrong_parent):
            issues = manifest_issues(self.value, source_revision=PUBLISHED_REVISION, mode="published")
        self.assertIn(
            "W4 integration repair published exact commit parent differs from the authorized base",
            issues,
        )


if __name__ == "__main__":
    unittest.main()
