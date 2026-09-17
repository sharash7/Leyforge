from __future__ import annotations

import copy
import hashlib
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from tools.r7_w4_execution import builds
from tools.r7_w4_execution.contracts import ROOT, proof_contracts_by_id, sha256_file
from tools.r7_w4_repair.human_review import PRODUCTION_PURPOSE, REVIEW_FILENAMES, review_template
from tools.r7_w4_repair.review_presentation import (
    REVIEW_PROOFS,
    SYNTHETIC_PURPOSE,
    build_context,
    context_issues,
    fixture_identity_at_revision,
    run_presentation,
    write_context,
)

PUBLISHED_INTEGRATION_REVISION = "11900c72c92f8869c0072907899f0899b524dc32"


class R7W4ReviewPresentationTests(unittest.TestCase):
    @staticmethod
    def _fixture(directory: str, proof_id: str) -> tuple[dict, Path, Path]:
        run_root = Path(directory) / "run"
        evidence = run_root / "evidence/material.txt"
        evidence.parent.mkdir(parents=True)
        evidence.write_text("Masked or non-origin review material.\n", encoding="utf-8")
        artifact = Path(directory) / "review-presenter.exe"
        artifact.write_bytes(b"synthetic-review-presenter")
        build = {
            "source_revision": "1" * 40,
            "probe_source_identity": hashlib.sha256(b"synthetic-probe-source").hexdigest(),
            "build_identity": hashlib.sha256(b"synthetic-build").hexdigest(),
            "artifact_path": str(artifact),
            "artifact_sha256": sha256_file(artifact),
            "environment": {"role": "synthetic-review-preflight", "isolated_profile": True},
        }
        reference = {
            "reference_id": "MASKED-MATERIAL-001" if proof_id == "PRD04-PROOF-51" else "MATERIAL-001",
            "scope": "RUN-ROOT",
            "kind": "review-material",
            "path": "evidence/material.txt",
            "sha256": sha256_file(evidence),
        }
        context = build_context(
            proof_id,
            "1" * 40,
            build,
            "SYNTHETIC-REVIEW-PREFLIGHT-" + proof_id.rsplit("-", 1)[1],
            [reference],
            run_root,
            purpose=SYNTHETIC_PURPOSE,
        )
        return context, run_root, artifact

    def test_all_three_routes_build_exact_pending_judgement_free_contexts(self) -> None:
        for proof_id in REVIEW_PROOFS:
            with self.subTest(proof_id=proof_id), tempfile.TemporaryDirectory() as directory:
                before = (ROOT / "proofs/r7/w4_human_review" / REVIEW_FILENAMES[proof_id]).read_bytes()
                context, run_root, _artifact = self._fixture(directory, proof_id)
                self.assertEqual((), context_issues(context, run_root))
                self.assertEqual("PENDING-HUMAN-REVIEW", context["review_record_state"]["status"])
                self.assertEqual("PENDING", context["review_record_state"]["judgement"])
                self.assertEqual("UNASSIGNED", context["review_record_state"]["review_purpose"])
                self.assertEqual("UNSIGNED", context["review_record_state"]["attestation"])
                self.assertFalse(context["proof_execution_started"])
                self.assertFalse(context["identity_allocation_started"])
                self.assertFalse(context["proof_observation_created"])
                self.assertEqual(
                    before,
                    (ROOT / "proofs/r7/w4_human_review" / REVIEW_FILENAMES[proof_id]).read_bytes(),
                )

    def test_context_fails_closed_when_evidence_content_or_hash_differs(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            context, run_root, _artifact = self._fixture(directory, "PRD04-PROOF-50")
            (run_root / "evidence/material.txt").write_text("tampered\n", encoding="utf-8")
            self.assertTrue(any("missing or differs" in issue for issue in context_issues(context, run_root)))

    def test_context_fails_closed_when_a_criterion_is_preanswered(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            context, run_root, _artifact = self._fixture(directory, "PRD04-PROOF-53")
            changed = copy.deepcopy(context)
            changed["review_units"][0]["criteria"][0]["judgement"] = "PASS-OBSERVED"
            self.assertIn("review presentation criteria or unit identity differs", context_issues(changed, run_root))

    def test_proof_51_context_rejects_origin_revealing_material(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            run_root = Path(directory) / "run"
            evidence = run_root / "evidence/material.txt"
            evidence.parent.mkdir(parents=True)
            evidence.write_text("source_origin=AI-CODEX\n", encoding="utf-8")
            artifact = Path(directory) / "review-presenter.exe"
            artifact.write_bytes(b"synthetic-review-presenter")
            build = {
                "probe_source_identity": "2" * 64,
                "build_identity": "3" * 64,
                "artifact_path": str(artifact),
                "artifact_sha256": sha256_file(artifact),
                "environment": {"role": "synthetic-review-preflight", "isolated_profile": True},
            }
            reference = {
                "reference_id": "MASKED-MATERIAL-001",
                "scope": "RUN-ROOT",
                "kind": "review-material",
                "path": "evidence/material.txt",
                "sha256": sha256_file(evidence),
            }
            with self.assertRaisesRegex(ValueError, "exposes masked source origin"):
                build_context(
                    "PRD04-PROOF-51",
                    "1" * 40,
                    build,
                    "SYNTHETIC-REVIEW-PREFLIGHT-51",
                    [reference],
                    run_root,
                    purpose=SYNTHETIC_PURPOSE,
                )

    def test_interactive_launch_requires_fresh_human_review_authority(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            context, run_root, _artifact = self._fixture(directory, "PRD04-PROOF-50")
            context_path = Path(directory) / "context.json"
            context_path.write_text(__import__("json").dumps(context), encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "fresh explicit authorization"):
                run_presentation(context_path, run_root, Path(directory) / "profile", preflight=False)

    def test_context_and_draft_outputs_cannot_overwrite_or_enter_governed_paths(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            context, run_root, _artifact = self._fixture(directory, "PRD04-PROOF-50")
            existing = Path(directory) / "existing-context.json"
            existing.write_text("{}\n", encoding="utf-8")
            with self.assertRaisesRegex(ValueError, "must be a new file"):
                write_context(context, existing, run_root)
            with self.assertRaisesRegex(ValueError, "cannot replace a governed review form"):
                write_context(
                    context,
                    ROOT / "proofs/r7/w4_human_review/forbidden-context.json",
                    run_root,
                )
            context_path = Path(directory) / "context.json"
            write_context(context, context_path, run_root)
            with self.assertRaisesRegex(ValueError, "must remain outside the repository"):
                run_presentation(
                    context_path,
                    run_root,
                    Path(directory) / "profile",
                    preflight=False,
                    draft_output=ROOT / ".local/forbidden-review-draft.json",
                    actual_human_review_authorized=True,
                )
            with self.assertRaisesRegex(ValueError, "preflight cannot write"):
                run_presentation(
                    context_path,
                    run_root,
                    Path(directory) / "profile",
                    preflight=True,
                    draft_output=Path(directory) / "preflight-draft.json",
                )

    def test_build_materialization_uses_only_exact_commit_tree_paths(self) -> None:
        committed = builds._exact_probe_tree(PUBLISHED_INTEGRATION_REVISION)
        self.assertEqual(builds.PROBE_SOURCE_FILES, tuple(committed))
        self.assertNotIn(".godot/editor/project_metadata.cfg", committed)
        self.assertNotIn(".summer/local/.project_id", committed)
        self.assertNotIn("project.godot.bak", committed)
        self.assertNotIn("src/main.gd.uid", committed)
        self.assertEqual(builds._tree_identity(committed), builds._tree_identity(dict(committed)))
        fixture_inputs = builds._exact_fixture_input_tree(PUBLISHED_INTEGRATION_REVISION)
        self.assertEqual(builds.FIXTURE_INPUT_FILES, tuple(fixture_inputs))
        with tempfile.TemporaryDirectory() as directory:
            probe_tree, copied_inputs = builds._materialize_exact_source(
                PUBLISHED_INTEGRATION_REVISION,
                Path(directory) / "workspace",
            )
            self.assertEqual(committed, probe_tree)
            self.assertEqual(fixture_inputs, copied_inputs)
            for relative, data in fixture_inputs.items():
                self.assertEqual(data, (Path(directory) / "workspace/fixture-inputs" / Path(relative).name).read_bytes())

    def test_production_context_derives_fixture_hashes_from_exact_commit_not_live_tree(self) -> None:
        with tempfile.TemporaryDirectory() as directory:
            run_root = Path(directory) / "run"
            evidence = run_root / "evidence/material.txt"
            evidence.parent.mkdir(parents=True)
            evidence.write_text("Exact review material.\n", encoding="utf-8")
            artifact = Path(directory) / "review-presenter.exe"
            artifact.write_bytes(b"exact-published-review-presenter")
            build = {
                "source_revision": PUBLISHED_INTEGRATION_REVISION,
                "probe_source_identity": "2" * 64,
                "build_identity": "3" * 64,
                "artifact_path": str(artifact),
                "artifact_sha256": sha256_file(artifact),
                "environment": {"role": "production-review", "isolated_profile": True},
            }
            reference = {
                "reference_id": "MATERIAL-001",
                "scope": "RUN-ROOT",
                "kind": "review-material",
                "path": "evidence/material.txt",
                "sha256": sha256_file(evidence),
            }
            fixture_ids = proof_contracts_by_id()["PRD04-PROOF-50"]["requirements"]["fixture_identities"]
            with patch(
                "tools.r7_w4_repair.review_presentation.fixture_identity",
                side_effect=AssertionError("live fixture identity must not be used"),
            ), patch(
                "tools.r7_w4_repair.review_presentation.review_template",
                side_effect=AssertionError("live review template must not be used"),
            ):
                context = build_context(
                    "PRD04-PROOF-50",
                    PUBLISHED_INTEGRATION_REVISION,
                    build,
                    "PUBLISHED-REVIEW-BINDING-TEST-50",
                    [reference],
                    run_root,
                    purpose=PRODUCTION_PURPOSE,
                )
            self.assertEqual(
                fixture_identity_at_revision(fixture_ids, PUBLISHED_INTEGRATION_REVISION),
                context["fixture_identities"],
            )
            self.assertEqual("PUBLISHED-EXACT-COMMIT", context["source_lifecycle"])

    def test_repaired_script_avoids_failed_api_and_keeps_review_nonexecuting(self) -> None:
        source = (ROOT / "proofs/r7/w4_execution/presentation_probe/src/main.gd").read_text(encoding="utf-8")
        self.assertNotIn("ResourceLoader.get_resource_type", source)
        self.assertIn("var resource_type: String", source)
        self.assertIn("var supported: bool", source)
        self.assertIn('mode == "review-preflight" or mode == "human-review"', source)
        self.assertIn('"DRAFT-UNSIGNED-NOT-PROOF-EVIDENCE"', source)
        self.assertIn('"proof_execution_started":false', source)
        self.assertIn('"identity_allocation_started":false', source)

    def test_real_forms_still_equal_canonical_pending_templates(self) -> None:
        for proof_id in REVIEW_PROOFS:
            path = ROOT / "proofs/r7/w4_human_review" / REVIEW_FILENAMES[proof_id]
            self.assertEqual(review_template(proof_id), __import__("json").loads(path.read_text(encoding="utf-8-sig")))


if __name__ == "__main__":
    unittest.main()
