"""Fail-closed, allocation-free presentation support for future W4 human review.

The module prepares and validates an exact presentation context.  It never
allocates RUN/EVID identity, executes a W4 proof, derives a judgement, signs a
review, or edits the governed pending forms.  A rendered session may save only
an explicitly unsigned response draft for later human-controlled completion.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
from pathlib import Path, PurePosixPath
from typing import Any, Mapping, Sequence

from tools.r7_w4_execution.contracts import (
    FIXTURE_PATHS,
    ROOT,
    fixture_identity,
    proof_contracts_by_id,
    sha256_file,
)
from tools.r7_w4_repair.human_review import (
    PRODUCTION_PURPOSE,
    REVIEW_FILENAMES,
    SYNTHETIC_PURPOSE,
    review_template,
)


CONTEXT_SCHEMA_VERSION = "prd07-w4-review-presentation-context-v1"
DRAFT_SCHEMA_VERSION = "prd07-w4-human-review-response-draft-v1"
REPORT_PREFIX = "LEYFORGE_W4_REVIEW_PRESENTATION "
REVIEW_PROOFS = ("PRD04-PROOF-50", "PRD04-PROOF-51", "PRD04-PROOF-53")
GOVERNED_REVIEW_ROOT = ROOT / "proofs/r7/w4_human_review"
PURPOSES = (PRODUCTION_PURPOSE, SYNTHETIC_PURPOSE)
SOURCE_LIFECYCLES = ("PUBLISHED-EXACT-COMMIT", "SYNTHETIC-PREFLIGHT")
ORIGIN_VISIBILITY = {
    "PRD04-PROOF-50": "NOT-APPLICABLE",
    "PRD04-PROOF-51": "MASKED-SOURCE-LABELS-ONLY",
    "PRD04-PROOF-53": "NOT-APPLICABLE",
}
EXPECTED_KEYS = {
    "schema_version",
    "presentation_purpose",
    "proof_id",
    "review_lifecycle_id",
    "source_revision",
    "source_lifecycle",
    "source_content_identity",
    "build_identity",
    "presentation_artifact_path",
    "artifact_sha256",
    "environment_identity",
    "fixture_identities",
    "renderer_argument",
    "evidence_items",
    "review_units",
    "origin_visibility",
    "review_record_state",
    "issued_run_high_water",
    "issued_evidence_high_water",
    "allocated_run_ids",
    "allocated_evidence_ids",
    "proof_execution_started",
    "identity_allocation_started",
    "proof_observation_created",
}
_SHA40 = re.compile(r"[0-9a-f]{40}")
_SHA64 = re.compile(r"[0-9a-f]{64}")
_FORBIDDEN_MASKED_TEXT = re.compile(r"AI-CODEX|source_origin|human-created|ai-created", re.IGNORECASE)


def canonical_bytes(value: Mapping[str, Any]) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=True) + "\n").encode("utf-8")


def fixture_identity_at_revision(fixture_ids: Sequence[str], source_revision: str) -> dict[str, Any]:
    """Resolve fixture identity only from the named exact commit tree."""
    if _SHA40.fullmatch(source_revision) is None:
        raise ValueError("fixture identity requires an exact source revision")
    resolved = subprocess.run(
        ["git", "rev-parse", "--verify", source_revision + "^{commit}"],
        cwd=ROOT,
        text=True,
        capture_output=True,
    )
    if resolved.returncode or resolved.stdout.strip() != source_revision:
        raise ValueError("fixture identity source does not resolve to the named exact commit")
    paths: list[str] = []
    hashes: list[str] = []
    for fixture_id in fixture_ids:
        if fixture_id not in FIXTURE_PATHS:
            raise ValueError("unknown fixture identity: " + fixture_id)
        for relative in FIXTURE_PATHS[fixture_id]:
            blob = subprocess.run(
                ["git", "show", source_revision + ":" + relative],
                cwd=ROOT,
                capture_output=True,
            )
            if blob.returncode:
                raise ValueError("fixture path is absent from exact source: " + relative)
            paths.append(relative)
            hashes.append(hashlib.sha256(blob.stdout).hexdigest())
    return {"paths": paths, "sha256": hashes}


def _review_template_at_revision(proof_id: str, source_revision: str) -> dict[str, Any]:
    relative = "proofs/r7/w4_human_review/" + REVIEW_FILENAMES[proof_id]
    result = subprocess.run(
        ["git", "show", source_revision + ":" + relative],
        cwd=ROOT,
        capture_output=True,
    )
    if result.returncode:
        raise ValueError("pending review template is absent from exact source: " + relative)
    try:
        value = json.loads(result.stdout.decode("utf-8-sig"))
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise ValueError("pending review template is malformed at exact source: " + str(exc)) from exc
    if not isinstance(value, dict) or value.get("proof_id") != proof_id:
        raise ValueError("pending review template identity differs at exact source")
    if (
        value.get("status") != "PENDING-HUMAN-REVIEW"
        or value.get("judgement") != "PENDING"
        or value.get("review_purpose") != "UNASSIGNED"
        or value.get("proof_observation_created") is not False
        or value.get("identity_allocation_started") is not False
        or value.get("attestation", {}).get("signature_state") != "UNSIGNED"
    ):
        raise ValueError("exact-source review template is not pending, unsigned, and nonexecuting")
    if proof_id == "PRD04-PROOF-51":
        adjudication = value.get("adjudication", {})
        if (
            not isinstance(adjudication, Mapping)
            or adjudication.get("status") != "PENDING-SEPARATE-ADJUDICATION"
            or adjudication.get("result") is not None
            or adjudication.get("unmasked_after_review_attestation") is not False
        ):
            raise ValueError("exact-source proof-51 origin adjudication is not pending and masked")
    stack: list[Any] = [value]
    while stack:
        current = stack.pop()
        if isinstance(current, Mapping):
            if "judgement" in current and current.get("judgement") != "PENDING":
                raise ValueError("exact-source review template contains a pre-answered judgement")
            if "observed_result" in current and current.get("observed_result") is not None:
                raise ValueError("exact-source review template contains a pre-filled observation")
            stack.extend(current.values())
        elif isinstance(current, list):
            stack.extend(current)
    return value


def _review_fixture_identity_at_revision(
    proof_id: str,
    source_revision: str,
    template: Mapping[str, Any],
) -> dict[str, Any]:
    binding = template.get("identity_binding", {})
    identity = binding.get("fixture_identities", {}) if isinstance(binding, Mapping) else {}
    paths = identity.get("paths", []) if isinstance(identity, Mapping) else []
    hashes = identity.get("sha256", []) if isinstance(identity, Mapping) else []
    if (
        not isinstance(paths, list)
        or not isinstance(hashes, list)
        or not paths
        or len(paths) != len(hashes)
        or any(not isinstance(path, str) for path in paths)
    ):
        raise ValueError("exact-source review template fixture binding is malformed for " + proof_id)
    actual: list[str] = []
    for relative in paths:
        result = subprocess.run(
            ["git", "show", source_revision + ":" + relative],
            cwd=ROOT,
            capture_output=True,
        )
        if result.returncode:
            raise ValueError("review fixture path is absent from exact source: " + relative)
        actual.append(hashlib.sha256(result.stdout).hexdigest())
    if actual != hashes:
        raise ValueError("exact-source review template fixture hashes differ for " + proof_id)
    return {"paths": list(paths), "sha256": list(hashes)}


def _safe_relative(value: Any) -> bool:
    if not isinstance(value, str) or not value or "\\" in value or ":" in value:
        return False
    path = PurePosixPath(value)
    return not path.is_absolute() and ".." not in path.parts and "." not in path.parts and path.as_posix() == value


def _is_within(path: Path, parent: Path) -> bool:
    try:
        path.resolve().relative_to(parent.resolve())
        return True
    except ValueError:
        return False


def _reference_path(reference: Mapping[str, Any], run_root: Path) -> Path | None:
    relative = reference.get("path")
    if not _safe_relative(relative):
        return None
    if reference.get("scope") == "REPOSITORY":
        return ROOT / str(relative)
    if reference.get("scope") == "RUN-ROOT":
        return run_root / str(relative)
    return None


def _criterion_view(row: Mapping[str, Any], evidence_ids: Sequence[str]) -> dict[str, Any]:
    return {
        "criterion_id": str(row["criterion_id"]),
        "prompt": str(row["prompt"]),
        "evidence_reference_ids": list(evidence_ids),
    }


def review_units(
    proof_id: str,
    evidence_ids: Sequence[str],
    *,
    template: Mapping[str, Any] | None = None,
) -> list[dict[str, Any]]:
    """Return the canonical, judgement-free review prompts for one proof."""
    template = template or review_template(proof_id)
    units: list[dict[str, Any]] = []
    if proof_id == "PRD04-PROOF-50":
        for row in template["asset_class_reviews"]:
            units.append(
                {
                    "unit_id": str(row["asset_class"]),
                    "label": "Asset class: " + str(row["asset_class"]),
                    "criteria": [_criterion_view(item, evidence_ids) for item in row["criteria"]],
                }
            )
    elif proof_id == "PRD04-PROOF-51":
        parity = template["criteria"][-1]
        for task in template["paired_task_reviews"]:
            task_id = str(task["task_id"])
            for source in task["masked_source_reviews"]:
                label = str(source["source_label"])
                units.append(
                    {
                        "unit_id": task_id + ":" + label,
                        "label": task_id + " / " + label,
                        "criteria": [_criterion_view(item, evidence_ids) for item in source["criteria"]],
                    }
                )
            units.append(
                {
                    "unit_id": task_id + ":MASKED-COMPARISON",
                    "label": task_id + " / masked comparison",
                    "criteria": [_criterion_view(parity, evidence_ids)],
                }
            )
    elif proof_id == "PRD04-PROOF-53":
        for row in template["renderer_lane_reviews"]:
            units.append(
                {
                    "unit_id": str(row["profile_id"]),
                    "label": str(row["profile_id"]) + " / " + str(row["renderer"]),
                    "criteria": [_criterion_view(item, evidence_ids) for item in row["criteria"]],
                }
            )
    else:
        raise ValueError("review presentation is not governed for " + proof_id)
    return units


def build_context(
    proof_id: str,
    source_revision: str,
    build: Mapping[str, Any],
    review_lifecycle_id: str,
    evidence_references: Sequence[Mapping[str, Any]],
    run_root: Path,
    *,
    purpose: str = PRODUCTION_PURPOSE,
    renderer_argument: str = "gl_compatibility",
) -> dict[str, Any]:
    """Build an exact, judgement-free context from already existing evidence."""
    if proof_id not in REVIEW_PROOFS:
        raise ValueError("review presentation is not governed for " + proof_id)
    if purpose not in PURPOSES:
        raise ValueError("unsupported review presentation purpose")
    if purpose == PRODUCTION_PURPOSE and build.get("source_revision") != source_revision:
        raise ValueError("production review build source differs from the exact review source")
    evidence_items: list[dict[str, Any]] = []
    for reference in evidence_references:
        resolved = _reference_path(reference, run_root)
        row = dict(reference)
        row["resolved_path"] = str(resolved.resolve()) if resolved is not None else ""
        evidence_items.append(row)
    evidence_ids = [str(row.get("reference_id", "")) for row in evidence_items]
    artifact_path = Path(str(build.get("artifact_path", "")))
    exact_template = (
        _review_template_at_revision(proof_id, source_revision)
        if purpose == PRODUCTION_PURPOSE
        else None
    )
    if exact_template is not None:
        exact_fixtures = _review_fixture_identity_at_revision(proof_id, source_revision, exact_template)
    else:
        fixture_ids = proof_contracts_by_id()[proof_id]["requirements"]["fixture_identities"]
        exact_fixtures = fixture_identity(fixture_ids)
    context: dict[str, Any] = {
        "schema_version": CONTEXT_SCHEMA_VERSION,
        "presentation_purpose": purpose,
        "proof_id": proof_id,
        "review_lifecycle_id": review_lifecycle_id,
        "source_revision": source_revision,
        "source_lifecycle": "PUBLISHED-EXACT-COMMIT" if purpose == PRODUCTION_PURPOSE else "SYNTHETIC-PREFLIGHT",
        "source_content_identity": build.get("probe_source_identity"),
        "build_identity": build.get("build_identity"),
        "presentation_artifact_path": str(artifact_path.resolve()) if str(build.get("artifact_path", "")) else "",
        "artifact_sha256": build.get("artifact_sha256"),
        "environment_identity": build.get("environment"),
        "fixture_identities": exact_fixtures,
        "renderer_argument": renderer_argument,
        "evidence_items": evidence_items,
        "review_units": review_units(proof_id, evidence_ids, template=exact_template),
        "origin_visibility": ORIGIN_VISIBILITY[proof_id],
        "review_record_state": {
            "status": "PENDING-HUMAN-REVIEW",
            "judgement": "PENDING",
            "review_purpose": "UNASSIGNED",
            "attestation": "UNSIGNED",
            "forms_modified": False,
            "human_judgement_recorded": False,
        },
        "issued_run_high_water": 72,
        "issued_evidence_high_water": 72,
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "proof_observation_created": False,
    }
    issues = context_issues(context, run_root)
    if issues:
        raise ValueError("invalid review presentation context: " + "; ".join(issues))
    return context


def context_issues(value: Mapping[str, Any], run_root: Path) -> tuple[str, ...]:
    issues: list[str] = []
    if set(value) != EXPECTED_KEYS:
        issues.append("review presentation context field set differs")
    proof_id = str(value.get("proof_id", ""))
    purpose = str(value.get("presentation_purpose", ""))
    if value.get("schema_version") != CONTEXT_SCHEMA_VERSION or proof_id not in REVIEW_PROOFS or purpose not in PURPOSES:
        issues.append("review presentation identity differs")
        return tuple(sorted(set(issues)))
    if _SHA40.fullmatch(str(value.get("source_revision", ""))) is None:
        issues.append("review presentation lacks exact source revision")
    elif purpose == PRODUCTION_PURPOSE:
        source_revision = str(value["source_revision"])
        resolved_source = subprocess.run(
            ["git", "rev-parse", "--verify", source_revision + "^{commit}"],
            cwd=ROOT,
            text=True,
            capture_output=True,
        )
        if resolved_source.returncode or resolved_source.stdout.strip() != source_revision:
            issues.append("production review source is not the named exact published commit")
    if _SHA64.fullmatch(str(value.get("source_content_identity", ""))) is None:
        issues.append("review presentation lacks exact source content identity")
    if _SHA64.fullmatch(str(value.get("build_identity", ""))) is None:
        issues.append("review presentation lacks exact build identity")
    artifact_path = Path(str(value.get("presentation_artifact_path", "")))
    if _SHA64.fullmatch(str(value.get("artifact_sha256", ""))) is None:
        issues.append("review presentation lacks exact artifact identity")
    elif not artifact_path.is_file() or sha256_file(artifact_path) != value.get("artifact_sha256"):
        issues.append("review presentation artifact is missing or differs")
    expected_lifecycle = "PUBLISHED-EXACT-COMMIT" if purpose == PRODUCTION_PURPOSE else "SYNTHETIC-PREFLIGHT"
    if value.get("source_lifecycle") != expected_lifecycle:
        issues.append("review presentation source lifecycle differs")
    lifecycle_id = value.get("review_lifecycle_id")
    if (
        not isinstance(lifecycle_id, str)
        or not lifecycle_id
        or re.search(r"PRD07-(?:RUN|EVID)-", lifecycle_id)
    ):
        issues.append("review presentation lacks a non-execution lifecycle identity")
    if not isinstance(value.get("environment_identity"), Mapping) or not value.get("environment_identity"):
        issues.append("review presentation lacks environment identity")
    try:
        if purpose == PRODUCTION_PURPOSE:
            exact_template = _review_template_at_revision(proof_id, str(value.get("source_revision", "")))
            expected_fixtures = _review_fixture_identity_at_revision(
                proof_id,
                str(value.get("source_revision", "")),
                exact_template,
            )
        else:
            exact_template = None
            fixture_ids = proof_contracts_by_id()[proof_id]["requirements"]["fixture_identities"]
            expected_fixtures = fixture_identity(fixture_ids)
    except ValueError as exc:
        exact_template = None
        expected_fixtures = None
        issues.append("review presentation fixture source cannot be resolved: " + str(exc))
    if expected_fixtures is not None and value.get("fixture_identities") != expected_fixtures:
        issues.append("review presentation fixture identities differ")
    if value.get("renderer_argument") not in {"forward_plus", "mobile", "gl_compatibility"}:
        issues.append("review presentation renderer argument is unsupported")
    rows = value.get("evidence_items")
    evidence_ids: list[str] = []
    if not isinstance(rows, list) or not rows:
        issues.append("review presentation lacks evidence items")
        rows = []
    for index, row in enumerate(rows):
        label = "review presentation evidence[%d]" % index
        if not isinstance(row, Mapping):
            issues.append(label + " is malformed")
            continue
        reference_id = row.get("reference_id")
        if not isinstance(reference_id, str) or not reference_id or reference_id in evidence_ids:
            issues.append(label + " has invalid or duplicate reference identity")
        else:
            evidence_ids.append(reference_id)
        resolved = _reference_path(row, run_root)
        if resolved is None or str(resolved.resolve()) != row.get("resolved_path"):
            issues.append(label + " has unsafe or mismatched path binding")
            continue
        if not isinstance(row.get("kind"), str) or not row.get("kind"):
            issues.append(label + " lacks evidence kind")
        if _SHA64.fullmatch(str(row.get("sha256", ""))) is None:
            issues.append(label + " lacks exact SHA-256")
        elif not resolved.is_file() or sha256_file(resolved) != row.get("sha256"):
            issues.append(label + " is missing or differs")
        if proof_id == "PRD04-PROOF-51" and resolved.is_file():
            content = resolved.read_text(encoding="utf-8-sig", errors="replace")
            if _FORBIDDEN_MASKED_TEXT.search(content) or _FORBIDDEN_MASKED_TEXT.search(json.dumps(dict(row))):
                issues.append(label + " exposes masked source origin")
    expected_units = review_units(proof_id, evidence_ids, template=exact_template)
    if value.get("review_units") != expected_units:
        issues.append("review presentation criteria or unit identity differs")
    if value.get("origin_visibility") != ORIGIN_VISIBILITY[proof_id]:
        issues.append("review presentation origin-visibility law differs")
    expected_state = {
        "status": "PENDING-HUMAN-REVIEW",
        "judgement": "PENDING",
        "review_purpose": "UNASSIGNED",
        "attestation": "UNSIGNED",
        "forms_modified": False,
        "human_judgement_recorded": False,
    }
    if value.get("review_record_state") != expected_state:
        issues.append("review presentation altered pending human-review state")
    if (
        value.get("issued_run_high_water") != 72
        or value.get("issued_evidence_high_water") != 72
        or value.get("allocated_run_ids") != []
        or value.get("allocated_evidence_ids") != []
        or value.get("proof_execution_started") is not False
        or value.get("identity_allocation_started") is not False
        or value.get("proof_observation_created") is not False
    ):
        issues.append("review presentation crossed execution or identity closure")
    return tuple(sorted(set(issues)))


def write_context(value: Mapping[str, Any], path: Path, run_root: Path) -> None:
    issues = context_issues(value, run_root)
    if issues:
        raise ValueError("invalid review presentation context: " + "; ".join(issues))
    if path.exists():
        raise ValueError("review presentation context output must be a new file")
    if _is_within(path, GOVERNED_REVIEW_ROOT):
        raise ValueError("review presentation context cannot replace a governed review form")
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes((json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n").encode("utf-8"))


def _report(stdout: str) -> dict[str, Any]:
    rows = [line[len(REPORT_PREFIX):] for line in stdout.splitlines() if line.startswith(REPORT_PREFIX)]
    if len(rows) != 1:
        raise ValueError("expected exactly one W4 review-presentation report")
    value = json.loads(rows[0])
    if not isinstance(value, dict):
        raise ValueError("W4 review-presentation report is not an object")
    return value


def run_presentation(
    context_path: Path,
    run_root: Path,
    profile_root: Path,
    *,
    preflight: bool,
    draft_output: Path | None = None,
    actual_human_review_authorized: bool = False,
) -> dict[str, Any]:
    """Launch an exact exported artifact in isolated review-only mode."""
    value = json.loads(context_path.read_text(encoding="utf-8-sig"))
    issues = context_issues(value, run_root)
    if issues:
        raise ValueError("invalid review presentation context: " + "; ".join(issues))
    if not preflight and not actual_human_review_authorized:
        raise ValueError("interactive human review requires fresh explicit authorization")
    if preflight and draft_output is not None:
        raise ValueError("review preflight cannot write a response draft")
    if not preflight:
        if draft_output is None:
            raise ValueError("interactive human review requires an explicit unsigned-draft output")
        if draft_output.suffix.lower() != ".json":
            raise ValueError("unsigned review draft output must be JSON")
        if draft_output.exists():
            raise ValueError("unsigned review draft output must be a new file")
        if _is_within(draft_output, ROOT):
            raise ValueError("unsigned review draft output must remain outside the repository")
        if not draft_output.parent.is_dir():
            raise ValueError("unsigned review draft output parent must already exist")
    if profile_root.exists():
        raise ValueError("review presentation profile root must be absent")
    governed_before = {
        relative: sha256_file(GOVERNED_REVIEW_ROOT / relative)
        for relative in (*REVIEW_FILENAMES.values(), "proof-51-origin-mapping-pending.json")
    }
    profile_root.mkdir(parents=True)
    environment = os.environ.copy()
    environment["APPDATA"] = str((profile_root / "appdata").resolve())
    environment["LOCALAPPDATA"] = str((profile_root / "localappdata").resolve())
    artifact = Path(str(value["presentation_artifact_path"]))
    argv = [str(artifact.resolve())]
    if preflight:
        argv.append("--headless")
    argv.extend(
        [
            "--rendering-method",
            str(value["renderer_argument"]),
            "--",
            "--mode",
            "review-preflight" if preflight else "human-review",
            "--review-context",
            str(context_path.resolve()),
        ]
    )
    if draft_output is not None:
        argv.extend(["--draft-output", str(draft_output.resolve())])
    completed = subprocess.run(argv, cwd=run_root, env=environment, text=True, capture_output=True, timeout=120.0 if preflight else None)
    governed_after = {
        relative: sha256_file(GOVERNED_REVIEW_ROOT / relative)
        for relative in governed_before
    }
    governed_forms_unchanged = governed_before == governed_after
    report: dict[str, Any] = {}
    parse_error = ""
    try:
        report = _report(completed.stdout)
    except (ValueError, json.JSONDecodeError) as exc:
        parse_error = str(exc)
    passed = (
        completed.returncode == 0
        and not parse_error
        and report.get("status") == "PASS"
        and report.get("proof_execution_started") is False
        and report.get("identity_allocation_started") is False
        and report.get("human_judgement_recorded") is False
        and report.get("governed_forms_modified") is False
        and governed_forms_unchanged
    )
    return {
        "status": "PASS" if passed else "FAIL",
        "preflight": preflight,
        "process": {
            "argv": argv,
            "cwd": str(run_root.resolve()),
            "exit_code": completed.returncode,
            "stdout": completed.stdout,
            "stderr": completed.stderr,
        },
        "report": report,
        "parse_error": parse_error,
        "governed_forms_unchanged": governed_forms_unchanged,
        "proof_execution_started": False,
        "identity_allocation_started": False,
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description="Validate or launch a governed W4 review presentation")
    sub = parser.add_subparsers(dest="command", required=True)
    validate = sub.add_parser("validate")
    preflight = sub.add_parser("preflight")
    present = sub.add_parser("present")
    for command in (validate, preflight, present):
        command.add_argument("--context", type=Path, required=True)
        command.add_argument("--run-root", type=Path, required=True)
    for command in (preflight, present):
        command.add_argument("--profile-root", type=Path, required=True)
    present.add_argument("--draft-output", type=Path, required=True)
    present.add_argument("--actual-human-review-authorized", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.command == "validate":
            value = json.loads(args.context.read_text(encoding="utf-8-sig"))
            issues = context_issues(value, args.run_root)
            result = {"status": "PASS" if not issues else "FAIL", "issues": list(issues)}
        else:
            result = run_presentation(
                args.context,
                args.run_root,
                args.profile_root,
                preflight=args.command == "preflight",
                draft_output=getattr(args, "draft_output", None),
                actual_human_review_authorized=getattr(args, "actual_human_review_authorized", False),
            )
    except BaseException as exc:
        result = {"status": "FAIL", "error_type": type(exc).__name__, "error": str(exc)}
    print(json.dumps(result, indent=2, sort_keys=True, ensure_ascii=True))
    return 0 if result.get("status") == "PASS" else 1


if __name__ == "__main__":
    raise SystemExit(main())
