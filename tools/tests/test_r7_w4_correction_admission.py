from __future__ import annotations

import copy
import hashlib
import json
import unittest
from contextlib import contextmanager
from typing import Iterator
from unittest.mock import patch

from tools.r7_w4_execution.contracts import PROTECTED_LOCAL_PATHS, ROOT
from tools.r7_w4_repair import correction_admission
from tools.r7_w4_repair.correction_admission import (
    DIAGNOSTIC_PATHS,
    MANIFEST_PATH,
    PACKAGE_PATHS,
    admitted_paths,
    manifest_issues,
    scanner_admits,
)


class R7W4CorrectionAdmissionTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.value = json.loads(MANIFEST_PATH.read_text(encoding="utf-8-sig"))

    @staticmethod
    def _git_blob(data: bytes) -> str:
        return hashlib.sha1(b"blob " + str(len(data)).encode("ascii") + b"\0" + data).hexdigest()

    @classmethod
    def _exact_package_snapshot(cls) -> dict[str, tuple[str, bytes]]:
        snapshot: dict[str, tuple[str, bytes]] = {}
        for relative in PACKAGE_PATHS:
            data = correction_admission._file_data(ROOT / relative)
            snapshot[relative] = (str(correction_admission._git("hash-object", "--", relative)), data)
        return snapshot

    @staticmethod
    @contextmanager
    def _base_head() -> Iterator[None]:
        actual_git = correction_admission._git

        def git_at_base(*args: str, **kwargs: object) -> bytes | str:
            if args == ("rev-parse", "HEAD"):
                return correction_admission.BASE_REVISION
            return actual_git(*args, **kwargs)

        with patch.object(correction_admission, "_git", side_effect=git_at_base):
            yield

    @classmethod
    @contextmanager
    def _preparation_context(cls, *, staged_paths: tuple[str, ...] = ()) -> Iterator[None]:
        snapshot = cls._exact_package_snapshot()
        actual_source_record = correction_admission._source_record

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
            correction_admission, "_working_changed_paths", return_value=set(PACKAGE_PATHS)
        ), patch.object(correction_admission, "_staged_paths", return_value=staged_paths), patch.object(
            correction_admission, "_source_record", side_effect=source_at_preparation_base
        ):
            yield

    @classmethod
    @contextmanager
    def _staged_context(cls, snapshot: dict[str, tuple[str, bytes]]) -> Iterator[None]:
        with cls._base_head(), patch.object(
            correction_admission, "_working_changed_paths", return_value=set()
        ), patch.object(correction_admission, "_staged_snapshot", return_value=snapshot):
            yield

    def test_preparation_mode_passes_with_empty_index(self) -> None:
        with self._preparation_context():
            self.assertEqual(
                (),
                manifest_issues(
                    self.value,
                    source_revision=correction_admission.BASE_REVISION,
                    mode="preparation",
                ),
            )

    def test_preparation_mode_fails_with_staged_content(self) -> None:
        with self._preparation_context(staged_paths=tuple(PACKAGE_PATHS)):
            issues = manifest_issues(
                self.value,
                source_revision=correction_admission.BASE_REVISION,
                mode="preparation",
            )
        self.assertTrue(any("preparation contains staged paths" in issue for issue in issues), issues)

    def test_staged_mode_passes_with_exact_governed_index(self) -> None:
        with self._staged_context(self._exact_package_snapshot()):
            self.assertEqual(
                (),
                manifest_issues(
                    self.value,
                    source_revision=correction_admission.BASE_REVISION,
                    mode="staged",
                ),
            )

    def test_staged_mode_fails_with_missing_extra_protected_or_blocked_path(self) -> None:
        cases: list[tuple[dict[str, tuple[str, bytes]], str]] = []
        missing = self._exact_package_snapshot()
        missing.pop(PACKAGE_PATHS[1])
        cases.append((missing, "missing staged paths"))
        extra = self._exact_package_snapshot()
        extra["unrelated.txt"] = (self._git_blob(b"unrelated\n"), b"unrelated\n")
        cases.append((extra, "extra staged paths"))
        protected = self._exact_package_snapshot()
        protected_path = next(iter(PROTECTED_LOCAL_PATHS))
        protected_data = (ROOT / protected_path).read_bytes()
        protected[protected_path] = (self._git_blob(protected_data), protected_data)
        cases.append((protected, "protected or blocked-diagnostic paths"))
        blocked = self._exact_package_snapshot()
        blocked_path = DIAGNOSTIC_PATHS[0]
        blocked_data = (ROOT / blocked_path).read_bytes()
        blocked[blocked_path] = (self._git_blob(blocked_data), blocked_data)
        cases.append((blocked, "protected or blocked-diagnostic paths"))
        for snapshot, expected in cases:
            with self.subTest(expected=expected), self._staged_context(snapshot):
                issues = manifest_issues(
                    self.value,
                    source_revision=correction_admission.BASE_REVISION,
                    mode="staged",
                )
            self.assertTrue(any(expected in issue for issue in issues), issues)

    def test_staged_validation_cannot_create_or_imply_execution_identity(self) -> None:
        state = ROOT / "docs/rebuild/r7/w4-execution-state.json"
        evidence = ROOT / "docs/rebuild/r7/execution-evidence"
        before_state = hashlib.sha256(state.read_bytes()).hexdigest()
        before_paths = sorted(path.relative_to(evidence).as_posix() for path in evidence.rglob("*") if path.is_file())
        with self._staged_context(self._exact_package_snapshot()):
            self.assertEqual(
                (),
                manifest_issues(
                    self.value,
                    source_revision=correction_admission.BASE_REVISION,
                    mode="staged",
                ),
            )
        self.assertEqual(before_state, hashlib.sha256(state.read_bytes()).hexdigest())
        self.assertEqual(before_paths, sorted(path.relative_to(evidence).as_posix() for path in evidence.rglob("*") if path.is_file()))
        changed = copy.deepcopy(self.value)
        changed["identity_allocation_started"] = True
        with self._staged_context(self._exact_package_snapshot()):
            issues = manifest_issues(
                changed,
                source_revision=correction_admission.BASE_REVISION,
                mode="staged",
            )
        self.assertTrue(any("execution or identity closure" in issue for issue in issues), issues)

    def test_published_mode_rejects_the_uncommitted_base(self) -> None:
        issues = manifest_issues(
            self.value,
            source_revision=correction_admission.BASE_REVISION,
            mode="published",
        )
        self.assertTrue(any("published source is not a later exact commit" in issue for issue in issues), issues)

    def test_exact_path_scanner_and_nonexecuting_state(self) -> None:
        paths = admitted_paths(self.value)
        self.assertEqual(tuple(sorted(PACKAGE_PATHS)), paths)
        for relative in PACKAGE_PATHS:
            self.assertTrue(scanner_admits(relative, paths), relative)
        for relative in (
            "tools/r7_w4_repair/future-unlisted.py",
            "proofs/r7/w4_human_review/proof-50-complete.json",
            "docs/rebuild/r7/execution-evidence/PRD07-RUN-0073/result.json",
        ):
            self.assertFalse(scanner_admits(relative, paths), relative)
        self.assertEqual([], self.value["package_allocated_run_ids"])
        self.assertEqual([], self.value["package_allocated_evidence_ids"])
        self.assertFalse(self.value["proof_execution_started"])
        self.assertFalse(self.value["proof_observation_created"])
        self.assertEqual(72, self.value["issued_run_high_water"])
        self.assertEqual(72, self.value["issued_evidence_high_water"])

    def test_artifact_or_review_state_tampering_fails_closed(self) -> None:
        artifact_changed = copy.deepcopy(self.value)
        artifact_changed["artifacts"][0]["sha256"] = "0" * 64
        review_changed = copy.deepcopy(self.value)
        review_changed["proof_execution_started"] = True
        for changed, expected in (
            (artifact_changed, "content identity differs"),
            (review_changed, "execution or identity closure"),
        ):
            with self.subTest(expected=expected), self._preparation_context():
                issues = manifest_issues(
                    changed,
                    source_revision=correction_admission.BASE_REVISION,
                    mode="preparation",
                )
            self.assertTrue(any(expected in issue for issue in issues), issues)


if __name__ == "__main__":
    unittest.main()
