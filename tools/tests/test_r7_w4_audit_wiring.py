"""Fail-closed tests for the exact W4 published chain and follow-up admission."""

from __future__ import annotations

import copy
import hashlib
import json
import unittest
from contextlib import contextmanager, redirect_stdout
from io import StringIO
from subprocess import CompletedProcess
from typing import Iterator
from unittest.mock import patch

from tools.r7_w4_execution.contracts import ROOT
from tools.r7_w4_repair import audit_wiring_admission as wiring
from tools.r7_w4_repair import correction_admission, integration_admission
from tools.verify import w4_verification_commands


class R7W4AuditWiringTests(unittest.TestCase):
    # Immutable fixture timepoint, not an assumption about the checkout's HEAD.
    PUBLISHED_REVISION = "3634e42eac65df9e01b6168b0c6de429bbefd299"

    @classmethod
    def setUpClass(cls) -> None:
        cls.historical_manifests = {
            path: json.loads(str(wiring._git("show", revision + ":" + path.relative_to(ROOT).as_posix())))
            for path, revision in (
                (wiring.MANIFEST_PATH, cls.PUBLISHED_REVISION),
                (integration_admission.MANIFEST_PATH, wiring.INTEGRATION_REVISION),
                (correction_admission.MANIFEST_PATH, wiring.CORRECTION_REVISION),
            )
        }
        cls.value = copy.deepcopy(cls.historical_manifests[wiring.MANIFEST_PATH])
        # Keep fixture bytes at the admitted timepoint, independent of local edits.
        cls.snapshot = {
            row["path"]: (row["git_blob"], correction_admission._blob_data(row["git_blob"]))
            for row in cls.value["artifacts"]
        }
        data = correction_admission._canonical_manifest_bytes(cls.value)
        blob = hashlib.sha1(b"blob " + str(len(data)).encode("ascii") + b"\0" + data).hexdigest()
        cls.snapshot[cls.value["manifest_path"]] = (blob, data)

    @classmethod
    def _historical_manifest(cls, path):
        # Unknown paths fail instead of silently escaping to the live checkout.
        return copy.deepcopy(cls.historical_manifests[path])

    def setUp(self) -> None:
        # Pin only the loading boundary; all admission checks still execute.
        loader = patch.object(wiring, "_load", side_effect=self._historical_manifest)
        loader.start()
        self.addCleanup(loader.stop)

    @staticmethod
    @contextmanager
    def _fixture_head(revision: str) -> Iterator[None]:
        actual_git = wiring._git

        def git_at_fixture_head(*args: str, **kwargs: object) -> bytes | str:
            if args == ("rev-parse", "HEAD"):
                return revision
            return actual_git(*args, **kwargs)

        with patch.object(wiring, "_git", side_effect=git_at_fixture_head):
            yield

    @classmethod
    @contextmanager
    def _preparation_context(
        cls,
        *,
        staged_paths: tuple[str, ...] = (),
        extra_local_paths: tuple[str, ...] = (),
        head_revision: str | None = None,
    ) -> Iterator[None]:
        actual_source_record = correction_admission._source_record

        def preparation_source(relative, mode, source_revision, staged_snapshot):
            if mode == "preparation":
                return cls.snapshot.get(relative)
            return actual_source_record(relative, mode, source_revision, staged_snapshot)

        with cls._fixture_head(head_revision or cls.value["base_revision"]), patch.object(
            correction_admission, "_source_record", side_effect=preparation_source
        ), patch.object(
            correction_admission, "_working_changed_paths",
            return_value=set(wiring.PACKAGE_PATHS).union(extra_local_paths),
        ), patch.object(correction_admission, "_staged_paths", return_value=staged_paths):
            yield

    @classmethod
    @contextmanager
    def _staged_context(
        cls,
        snapshot: dict[str, tuple[str, bytes]],
        *,
        unstaged_paths: tuple[str, ...] = (),
        extra_local_paths: tuple[str, ...] = (),
        head_revision: str | None = None,
    ) -> Iterator[None]:
        actual_git = wiring._git

        def staged_git(*args: str, **kwargs: object) -> bytes | str:
            if args == ("rev-parse", "HEAD"):
                return head_revision or cls.value["base_revision"]
            if args == ("diff", "--name-only", "--"):
                return "\n".join(unstaged_paths)
            return actual_git(*args, **kwargs)

        with patch.object(
            correction_admission, "_staged_snapshot", return_value=snapshot
        ), patch.object(
            correction_admission, "_working_changed_paths",
            return_value=set(wiring.PACKAGE_PATHS).union(extra_local_paths),
        ), patch.object(wiring, "_git", side_effect=staged_git):
            yield

    @classmethod
    @contextmanager
    def _published_context(cls, *, extra_local_paths: tuple[str, ...] = ()) -> Iterator[None]:
        # Model a clean committed checkout; source blobs and ancestry stay real.
        # This fixture is not a live-worktree admission result.
        with cls._fixture_head(cls.PUBLISHED_REVISION), patch.object(
            correction_admission, "_working_changed_paths", return_value=set(extra_local_paths)
        ), patch.object(correction_admission, "_staged_paths", return_value=()):
            yield

    def _assert_cli_state(
        self, mode: str, revision: str, expected: str, *, issues: tuple[str, ...] = ()
    ) -> None:
        output = StringIO()
        # Exercise reporting only; this synthetic result is not live admission.
        with patch.object(wiring, "layered_issues", return_value=issues) as validate, redirect_stdout(output):
            exit_code = wiring.main(["verify", "--mode", mode, "--source-revision", revision])
        validate.assert_called_once_with(revision, mode=mode)
        report = json.loads(output.getvalue())
        self.assertEqual(1 if issues else 0, exit_code)
        self.assertEqual("FAIL" if issues else "PASS", report["status"])
        self.assertEqual(expected, report["state"])
        self.assertEqual(list(issues), report["issues"])

    def test_integration_published_at_its_own_commit(self) -> None:
        value = self._historical_manifest(integration_admission.MANIFEST_PATH)
        self.assertEqual(
            (), integration_admission.manifest_issues(
                value, wiring.INTEGRATION_REVISION, mode="published"
            ),
        )

    def test_correction_published_at_its_own_commit(self) -> None:
        value = self._historical_manifest(correction_admission.MANIFEST_PATH)
        self.assertEqual(
            (), correction_admission.manifest_issues(
                value, wiring.CORRECTION_REVISION, mode="published"
            ),
        )

    def test_exact_published_chain_and_unpublished_followup_pass(self) -> None:
        self.assertEqual((), wiring.published_chain_issues())
        self.assertEqual(wiring.BASE_REVISION, self.value["base_revision"])
        self.assertEqual(wiring.BASE_REVISION, wiring._parent(self.PUBLISHED_REVISION))
        self.assertNotEqual(wiring.BASE_REVISION, self.PUBLISHED_REVISION)
        with self._published_context():
            for mode in ("published", "auto"):
                with self.subTest(mode=mode):
                    self.assertEqual((), wiring.layered_issues(self.PUBLISHED_REVISION, mode=mode))
        # Model a later prepared package without reading current index/worktree bytes.
        mixed = copy.deepcopy(self.value)
        relative = "tools/tests/test_r7_w4_audit_wiring.py"
        data = self.snapshot[relative][1] + b"\n# Later fixture revision.\n"
        row = next(row for row in mixed["artifacts"] if row["path"] == relative)
        row.update(
            bytes=len(data),
            sha256=hashlib.sha256(data).hexdigest(),
            git_blob=hashlib.sha1(b"blob " + str(len(data)).encode("ascii") + b"\0" + data).hexdigest(),
        )
        mixed["manifest_payload_sha256"] = correction_admission._manifest_payload_sha256(mixed)
        wrong_manifest = copy.deepcopy(self.value)
        wrong_manifest["manifest_version"] = 2
        wrong_manifest["manifest_payload_sha256"] = correction_admission._manifest_payload_sha256(wrong_manifest)
        for label, manifest, expected in (
            ("mixed-source", mixed, (
                "W4 audit-wiring artifact Git blob differs: " + relative,
                "W4 audit-wiring artifact content identity differs: " + relative,
                "W4 audit-wiring manifest differs from selected source",
            )),
            ("wrong-manifest", wrong_manifest, (
                "W4 audit-wiring admission identity differs",
                "W4 audit-wiring manifest differs from selected source",
            )),
        ):
            for mode in ("published", "auto"):
                with self.subTest(manifest=label, mode=mode), self._published_context(), patch.object(
                    wiring, "_load",
                    side_effect=lambda path: copy.deepcopy(manifest) if path == wiring.MANIFEST_PATH else self._historical_manifest(path),
                ):
                    self.assertEqual(expected, wiring.layered_issues(self.PUBLISHED_REVISION, mode=mode))
        with self._preparation_context():
            self.assertEqual(
                (), wiring.manifest_issues(
                    self.value, wiring.BASE_REVISION, mode="preparation"
                ),
            )
        with self._preparation_context(staged_paths=tuple(wiring.PACKAGE_PATHS)):
            issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="preparation")
        self.assertIn("W4 audit-wiring preparation contains staged paths", issues)
        for head, source in (
            (self.PUBLISHED_REVISION, wiring.BASE_REVISION),
            (wiring.BASE_REVISION, self.PUBLISHED_REVISION),
        ):
            with self.subTest(head=head, source=source), self._preparation_context(head_revision=head):
                issues = wiring.manifest_issues(self.value, source, mode="preparation")
            self.assertEqual(
                ("W4 audit-wiring unpublished source differs from the authorized base",), issues
            )
        for mode, revision, expected in (
            ("preparation", wiring.BASE_REVISION, "PASS-PREPARED-NOT-STAGED"),
            ("staged", wiring.BASE_REVISION, "PASS-STAGED-EXACT-PACKAGE"),
            ("published", "1" * 40, "PASS-PUBLISHED-EXACT-COMMIT"),
            ("auto", wiring.BASE_REVISION, "PASS-PREPARED-NOT-STAGED"),
            ("auto", "1" * 40, "PASS-PUBLISHED-EXACT-COMMIT"),
        ):
            with self.subTest(mode=mode, revision=revision):
                self._assert_cli_state(mode, revision, expected)
        self._assert_cli_state(
            "staged", wiring.BASE_REVISION, "FAIL-CLOSED", issues=("synthetic admission failure",)
        )

    def test_stable_verifier_routes_predecessors_to_distinct_commits(self) -> None:
        for head in (self.value["base_revision"], self.PUBLISHED_REVISION):
            with self.subTest(head=head), patch(
                "tools.verify.subprocess.run",
                return_value=CompletedProcess(["git", "rev-parse", "HEAD"], 0, head + "\n", ""),
            ) as read_head:
                commands = w4_verification_commands("python")
            read_head.assert_called_once_with(
                ["git", "rev-parse", "HEAD"], cwd=ROOT, text=True, capture_output=True
            )
            integration = next(row for row in commands if "tools.r7_w4_repair.integration_admission" in row)
            correction = next(row for row in commands if "tools.r7_w4_repair.correction_admission" in row)
            wiring_command = next(row for row in commands if "tools.r7_w4_repair.audit_wiring_admission" in row)
            self.assertEqual(wiring.INTEGRATION_REVISION, integration[integration.index("--source-revision") + 1])
            self.assertEqual(wiring.CORRECTION_REVISION, correction[correction.index("--source-revision") + 1])
            self.assertEqual(head, wiring_command[wiring_command.index("--source-revision") + 1])
            self.assertNotEqual(wiring.CORRECTION_REVISION, integration[integration.index("--source-revision") + 1])

    def test_wrong_integration_parent_fails(self) -> None:
        actual_parent = wiring._parent
        with patch.object(integration_admission, "manifest_issues", return_value=()), patch.object(
            correction_admission, "manifest_issues", return_value=()
        ), patch.object(
            wiring, "_parent",
            side_effect=lambda rev: "0" * 40 if rev == wiring.INTEGRATION_REVISION else actual_parent(rev),
        ):
            self.assertIn("published W4 integration parent differs", wiring.published_chain_issues())

    def test_wrong_correction_parent_fails(self) -> None:
        actual_parent = wiring._parent
        with patch.object(integration_admission, "manifest_issues", return_value=()), patch.object(
            correction_admission, "manifest_issues", return_value=()
        ), patch.object(
            wiring, "_parent",
            side_effect=lambda rev: "0" * 40 if rev == wiring.CORRECTION_REVISION else actual_parent(rev),
        ):
            self.assertIn("published W4 correction parent differs", wiring.published_chain_issues())

    def test_missing_intermediate_commit_fails(self) -> None:
        actual_exists = wiring._commit_exists
        with patch.object(
            wiring, "_commit_exists",
            side_effect=lambda rev: False if rev == wiring.INTEGRATION_REVISION else actual_exists(rev),
        ):
            self.assertIn("published W4 admission chain has a missing commit", wiring.published_chain_issues())

    def test_altered_integration_manifest_path_or_hash_fails(self) -> None:
        original = self._historical_manifest(integration_admission.MANIFEST_PATH)
        for field, value in (("path", "tools/lookalike.py"), ("sha256", "0" * 64)):
            changed = copy.deepcopy(original)
            changed["artifacts"][0][field] = value
            with self.subTest(field=field), patch.object(wiring, "_load", side_effect=lambda path: changed if path == integration_admission.MANIFEST_PATH else self._historical_manifest(path)):
                self.assertTrue(any("integration:" in issue for issue in wiring.published_chain_issues()))

    def test_altered_correction_manifest_path_or_hash_fails(self) -> None:
        original = self._historical_manifest(correction_admission.MANIFEST_PATH)
        for field, value in (("path", "tools/lookalike.py"), ("sha256", "0" * 64)):
            changed = copy.deepcopy(original)
            changed["artifacts"][0][field] = value
            with self.subTest(field=field), patch.object(wiring, "_load", side_effect=lambda path: changed if path == correction_admission.MANIFEST_PATH else self._historical_manifest(path)):
                self.assertTrue(any("correction:" in issue for issue in wiring.published_chain_issues()))

    def test_extra_current_path_fails_preparation(self) -> None:
        for extra in (
            "tools/r7_w4_repair/unlisted.py",
            "docs/rebuild/r7/unlisted-lookalike.json",
        ):
            with self.subTest(extra=extra), patch.object(
                wiring, "published_chain_issues", return_value=()
            ), self._preparation_context(extra_local_paths=(extra,)):
                issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="preparation")
            self.assertIn("W4 audit-wiring preparation changed-path set differs", issues)

    def test_scanner_admits_only_exact_paths(self) -> None:
        admitted = wiring.admitted_paths(self.value)
        self.assertEqual(tuple(sorted(wiring.PACKAGE_PATHS)), admitted)
        self.assertFalse(wiring.scanner_admits("tools/r7_w4_repair/unlisted.py", admitted))
        self.assertFalse(wiring.scanner_admits("tools/r7_w4_repair/audit_wiring_admission.py.bak", admitted))
        self.assertFalse(wiring.scanner_admits("docs/rebuild/r7/execution-evidence/PRD07-RUN-0073/result.json", admitted))

    def test_staged_fixture_requires_exact_index_and_no_unstaged_package_edit(self) -> None:
        snapshot = dict(self.snapshot)
        with patch.object(wiring, "published_chain_issues", return_value=()), self._staged_context(snapshot):
            self.assertEqual((), wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="staged"))
        tampered = dict(snapshot)
        relative = wiring.ARTIFACT_PATHS[0]
        data = snapshot[relative][1] + b"\n# Unadmitted artifact change.\n"
        tampered[relative] = (
            hashlib.sha1(b"blob " + str(len(data)).encode("ascii") + b"\0" + data).hexdigest(), data
        )
        with self._staged_context(tampered):
            issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="staged")
        self.assertIn("W4 audit-wiring artifact content identity differs: " + relative, issues)
        self.assertIn("W4 audit-wiring artifact Git blob differs: " + relative, issues)
        with patch.object(wiring, "published_chain_issues", return_value=()), self._staged_context(
            snapshot, head_revision=self.PUBLISHED_REVISION
        ):
            issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="staged")
        self.assertEqual(
            ("W4 audit-wiring unpublished source differs from the authorized base",), issues
        )
        missing = dict(snapshot)
        missing.pop(wiring.ARTIFACT_PATHS[0])
        with patch.object(wiring, "published_chain_issues", return_value=()), self._staged_context(missing):
            issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="staged")
        self.assertIn("W4 audit-wiring staged exact path set differs", issues)
        extra = dict(snapshot)
        extra["docs/rebuild/r7/unlisted-lookalike.json"] = ("0" * 40, b"{}\n")
        with patch.object(wiring, "published_chain_issues", return_value=()), self._staged_context(extra):
            issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="staged")
        self.assertIn("W4 audit-wiring staged exact path set differs", issues)
        with patch.object(wiring, "published_chain_issues", return_value=()), self._staged_context(
            snapshot, unstaged_paths=("tools/r7_w4_repair/audit_wiring_admission.py",)
        ):
            issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="staged")
        self.assertIn("W4 audit-wiring staged package has unstaged changes", issues)
        with patch.object(wiring, "published_chain_issues", return_value=()), self._staged_context(
            snapshot, extra_local_paths=("unrelated.txt",)
        ):
            issues = wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="staged")
        self.assertIn("W4 audit-wiring staged source has unadmitted local paths", issues)

    def test_historical_state_and_evidence_are_immutable(self) -> None:
        state = ROOT / wiring.HISTORICAL_STATE
        evidence = ROOT / wiring.HISTORICAL_EVIDENCE
        before_state = state.read_bytes()
        before_files = sorted(path.relative_to(evidence).as_posix() for path in evidence.rglob("*") if path.is_file())
        with patch.object(wiring, "published_chain_issues", return_value=()), self._preparation_context():
            self.assertEqual((), wiring.manifest_issues(self.value, wiring.BASE_REVISION, mode="preparation"))
        self.assertEqual(before_state, state.read_bytes())
        self.assertEqual(before_files, sorted(path.relative_to(evidence).as_posix() for path in evidence.rglob("*") if path.is_file()))
        changed = copy.deepcopy(self.value)
        changed["historical_state"]["sha256"] = "0" * 64
        with patch.object(wiring, "published_chain_issues", return_value=()), self._preparation_context():
            issues = wiring.manifest_issues(changed, wiring.BASE_REVISION, mode="preparation")
        self.assertTrue(any("historical binding differs" in issue for issue in issues))

    def test_no_execution_identity_can_be_implied(self) -> None:
        with patch.object(wiring, "published_chain_issues", return_value=()), self._preparation_context():
            for key, value in (
                ("proof_execution_started", True),
                ("identity_allocation_started", True),
                ("proof_observation_created", True),
                ("issued_run_high_water", 73),
                ("package_allocated_run_ids", ["PRD07-RUN-0073"]),
            ):
                changed = copy.deepcopy(self.value)
                changed[key] = value
                with self.subTest(key=key):
                    issues = wiring.manifest_issues(changed, wiring.BASE_REVISION, mode="preparation")
                    self.assertIn("W4 audit-wiring execution or identity closure differs", issues)

    def test_wrong_followup_parent_and_extra_published_path_fail(self) -> None:
        with self._published_context(), patch.object(wiring, "published_chain_issues", return_value=()), patch.object(
            wiring, "_parent", return_value="0" * 40
        ):
            issues = wiring.manifest_issues(self.value, self.PUBLISHED_REVISION, mode="published")
        self.assertIn("W4 audit-wiring published exact commit parent differs", issues)
        actual_git = wiring._git

        def extra_path(*args: str, **kwargs: object) -> bytes | str:
            if args == ("diff", "--name-only", wiring.BASE_REVISION, self.PUBLISHED_REVISION, "--"):
                return "\n".join((*wiring.PACKAGE_PATHS, "tools/r7_w4_repair/unlisted.py"))
            return actual_git(*args, **kwargs)

        with self._published_context(), patch.object(wiring, "published_chain_issues", return_value=()), patch.object(
            wiring, "_git", side_effect=extra_path
        ):
            issues = wiring.manifest_issues(self.value, self.PUBLISHED_REVISION, mode="published")
        self.assertIn("W4 audit-wiring published exact commit path set differs", issues)
        with self._published_context(extra_local_paths=("tools/tests/test_r7_w4_audit_wiring.py",)):
            issues = wiring.manifest_issues(self.value, self.PUBLISHED_REVISION, mode="published")
        self.assertEqual(("W4 audit-wiring published source has unadmitted local paths",), issues)


if __name__ == "__main__":
    unittest.main()
