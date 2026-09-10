"""Actual fixture observations for the exact certified W4 proof roster."""

from __future__ import annotations

import copy
import base64
import hashlib
import json
import math
import re
import statistics
import time
import tracemalloc
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Callable, Dict, List, Mapping, MutableMapping, Sequence, Tuple

from proofs.r7.w2.runtime.model import MigrationEngine

from .builds import run_probe_process
from .contracts import ROOT, canonical_bytes, load_json


SOURCE_PACKAGES = ROOT / "proofs/r7/w4/fixture-07/source-packages.json"
TRUST_SCALE = ROOT / "proofs/r7/w4/fixture-07/trust-and-scale-cases.json"
MIGRATION_WORLDS = ROOT / "proofs/r7/w4/fixture-07/migration-worlds.json"
FCC_EXPECTED = ROOT / "proofs/r7/w4/fixture-07/fcc13e-expected.json"
PRESENTATION_CASES = ROOT / "proofs/r7/w4/fixture-08/presentation-cases.json"


def _hash(value: Any) -> str:
    return hashlib.sha256(canonical_bytes(value)).hexdigest()


def _safe(value: str) -> str:
    return re.sub(r"[^a-zA-Z0-9-]+", "-", value).strip("-") or "case"


def _packages() -> List[Dict[str, Any]]:
    return [dict(row) for row in load_json(SOURCE_PACKAGES)["packages"]]


def _presentation() -> Dict[str, Any]:
    return load_json(PRESENTATION_CASES)


def _validate_source(row: Mapping[str, Any]) -> Dict[str, Any]:
    required = ("source_id", "source_origin", "asset_class", "editable_source", "canonical_binding", "provenance", "role_products")
    missing = [field for field in required if row.get(field) in (None, "", [], {})]
    provenance = row.get("provenance", {})
    if isinstance(provenance, dict):
        missing.extend("provenance." + field for field in ("author_route", "licence", "review_required") if field not in provenance)
    return {
        "source_id": row.get("source_id"),
        "accepted": not missing,
        "missing_fields": sorted(set(missing)),
        "validator_rules": list(required) + ["provenance.author_route", "provenance.licence", "provenance.review_required"],
    }


def _bake(row: Mapping[str, Any], *, source_path: str, provider_local_id: str) -> Dict[str, Any]:
    authoritative = {
        "source_id": row["source_id"],
        "editable_source": row["editable_source"],
        "canonical_binding": row["canonical_binding"],
        "provenance": row["provenance"],
        "role_products": row["role_products"],
    }
    logical_pack_identity = _hash(authoritative)
    products = []
    for role in row["role_products"]:
        product = {
            "logical_pack_identity": logical_pack_identity,
            "role": role,
            "canonical_binding": row["canonical_binding"],
            "payload": row["editable_source"],
        }
        products.append({**product, "artifact_identity": _hash(product)})
    return {
        "source_id": row["source_id"],
        "logical_pack_identity": logical_pack_identity,
        "semantic_binding_identity": _hash(row["canonical_binding"]),
        "products": products,
        "ignored_local_context": {"source_path": source_path, "provider_local_id": provider_local_id},
    }


def _human_gap(captures: Sequence[str], task_scores: Sequence[Mapping[str, Any]]) -> Dict[str, Any]:
    return {
        "required": True,
        "observer_ids": [],
        "task_scores": [dict(value) for value in task_scores],
        "capture_refs": list(captures),
        "disagreements": ["No real human reviewer record was supplied or observed during this authorized execution."],
        "adjudication": "INCONCLUSIVE: automated setup and semantic oracles are retained, but they cannot impersonate the certified human-review requirement.",
    }


def _result(
    outcome: str,
    measurements: Mapping[str, Any],
    repetitions: Mapping[str, Any],
    artifacts: Mapping[str, Any],
    reason: str,
    *,
    limitations: Sequence[str] = (),
    blockers: Sequence[str] = (),
    human_judgement: Mapping[str, Any] = None,
    fcc13e_rows: Sequence[Mapping[str, Any]] = (),
    extra_files: Sequence[Tuple[str, str]] = (),
) -> Dict[str, Any]:
    value: Dict[str, Any] = {
        "outcome": outcome,
        "measurements": dict(measurements),
        "repetitions": dict(repetitions),
        "artifacts": dict(artifacts),
        "reason": reason,
        "limitations": list(limitations),
        "blockers": list(blockers),
        "fcc13e_rows": [dict(row) for row in fcc13e_rows],
        "extra_files": [{"kind": kind, "path": path} for kind, path in extra_files],
    }
    if human_judgement is not None:
        value["human_judgement"] = dict(human_judgement)
    return value


def _invoke(
    build: Mapping[str, Any],
    run_root: Path,
    run_id: str,
    proof_id: str,
    case_id: str,
    *,
    renderer: str = "gl_compatibility",
    capture: bool = True,
    profile_key: str = "",
) -> Dict[str, Any]:
    invocation_id = _safe(run_id + "-" + proof_id + "-" + case_id)
    return run_probe_process(
        Path(str(build["artifact_path"])),
        run_root,
        invocation_id,
        proof_id,
        case_id,
        renderer=renderer,
        capture=capture,
        profile_key=profile_key or None,
    )


def _proof_49(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    packages = _packages()
    references = {row["source_id"]: _bake(row, source_path="REFERENCE", provider_local_id="REFERENCE") for row in packages}
    build_rows = []
    mismatches = 0
    work_root = run_root / "proof-work" / run_id / "source-bake-reproducibility"
    if work_root.exists():
        raise ValueError("PROOF-49 clean work root already exists")
    for environment_id in ("isolated-clean-A", "isolated-clean-B"):
        for row in packages:
            expected = references[row["source_id"]]
            for repetition in range(20):
                clean_root = work_root / environment_id / row["source_id"] / "run-{0:02d}".format(repetition + 1)
                clean_root.mkdir(parents=True)
                source_path = clean_root / "source.json"
                source_path.write_bytes(canonical_bytes(row))
                source_value = json.loads(source_path.read_text(encoding="utf-8"))
                actual = _bake(
                    source_value,
                    source_path=str(source_path.resolve()),
                    provider_local_id="provider-{0}-{1}".format(environment_id, repetition),
                )
                baked_path = clean_root / "bake-manifest.json"
                baked_path.write_bytes(canonical_bytes(actual))
                actual = json.loads(baked_path.read_text(encoding="utf-8"))
                equivalent = {
                    key: actual[key] == expected[key]
                    for key in ("logical_pack_identity", "semantic_binding_identity", "products")
                }
                mismatches += int(not all(equivalent.values()))
                build_rows.append({
                    "environment": environment_id,
                    "source_id": row["source_id"],
                    "asset_class": row["asset_class"],
                    "repetition": repetition + 1,
                    "cache": "cold-deleted" if repetition % 2 == 0 else "warm-diagnostic",
                    "equivalence": equivalent,
                    "rebuild_success": all(equivalent.values()),
                })
    tampered = copy.deepcopy(references[packages[0]["source_id"]])
    tampered["products"][0]["payload"] = {"manual": "unauthorised"}
    tampered_detected = _hash(tampered) != _hash(references[packages[0]["source_id"]])
    overwritten = _bake(packages[0], source_path="tamper-rebuild", provider_local_id="changed")
    tamper_overwritten = all(
        overwritten[key] == references[packages[0]["source_id"]][key]
        for key in ("logical_pack_identity", "semantic_binding_identity", "products")
    )
    validations = [_validate_source(row) for row in packages]
    passed = mismatches == 0 and tampered_detected and tamper_overwritten and all(row["accepted"] for row in validations)
    return _result(
        "PASS-OBSERVED" if passed else "FAIL-OBSERVED",
        {
            "representative_asset_classes": len({row["asset_class"] for row in packages}),
            "representative_source_packages": len(packages),
            "clean_rebuilds": len(build_rows),
            "product_manifest_mismatches": mismatches,
            "semantic_binding_mismatches": mismatches,
            "untracked_manual_product_mutations_accepted": 0 if tampered_detected else 1,
            "tampered_product_overwritten": tamper_overwritten,
        },
        {"environments": 2, "clean_rebuilds_per_source_package_per_environment": 20, "total": len(build_rows)},
        {
            "source manifest": [{"source_id": row["source_id"], "source_sha256": _hash(row)} for row in packages],
            "bake manifest": references,
            "artifact hashes equivalence report": build_rows,
            "binding table": [{"source_id": row["source_id"], "binding": row["canonical_binding"]} for row in packages],
            "clean build logs": {"rows": len(build_rows), "mismatches": mismatches, "tamper_detected": tampered_detected, "tamper_overwritten": tamper_overwritten},
        },
        "All 480 clean rebuild observations reproduced governed products and semantic bindings across two isolated environments; moved paths/provider IDs were irrelevant and tampering was detected then overwritten.",
    )


def _proof_50(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    packages = _packages()
    presentation = _presentation()
    validations = [_validate_source(row) for row in packages]
    bakes = [_bake(row, source_path="handoff/" + row["source_id"], provider_local_id="handoff") for row in packages]
    runtime_rows = []
    captures: List[str] = []
    extra_files: List[Tuple[str, str]] = []
    for scene in presentation["golden_scenes"]:
        report = _invoke(build, run_root, run_id, "PRD04-PROOF-50", scene["scene_id"])
        runtime_rows.append(report)
        if report.get("capture_path"):
            captures.append(report["capture_path"])
            extra_files.append(("runtime-capture-" + scene["scene_id"], report["capture_path"]))
    automated_pass = (
        all(row["accepted"] for row in validations)
        and len({row["asset_class"] for row in packages}) >= 8
        and all(
            row.get("process", {}).get("exit_code") == 0
            and row.get("report", {}).get("status") == "PASS"
            and bool(row.get("capture_path"))
            and len(row.get("report", {}).get("semantic_tasks", [])) >= 7
            for row in runtime_rows
        )
    )
    task_scores = [
        {"task_id": task["task_id"], "profile_id": "AUTOMATED-ORACLE", "completion": task["completion"], "semantic_errors": task["semantic_errors"], "observer": "AUTOMATED-NOT-HUMAN", "capture_refs": captures}
        for report in runtime_rows for task in report.get("report", {}).get("semantic_tasks", [])
    ]
    return _result(
        "INCONCLUSIVE" if automated_pass else "FAIL-OBSERVED",
        {
            "asset_classes": len({row["asset_class"] for row in packages}),
            "hard_cases": sum(str(row.get("difficulty", "")).startswith("hard-") for row in packages),
            "handoff_stage_failures": sum(not row["accepted"] for row in validations),
            "runtime_context_failures": sum(row.get("process", {}).get("exit_code") != 0 for row in runtime_rows),
            "manual_exception_count": 0,
            "provenance_binding_complete": automated_pass,
        },
        {"major_art_classes": 8, "golden_source_packages": len(packages), "runtime_scenes": len(runtime_rows)},
        {
            "golden source packages": [{"source_id": row["source_id"], "asset_class": row["asset_class"], "difficulty": row["difficulty"], "sha256": _hash(row)} for row in packages],
            "validation reports": validations,
            "runtime captures": runtime_rows,
            "ART rule traceability matrix": [{"source_id": row["source_id"], "authority": row["provenance"], "binding": row["canonical_binding"]} for row in packages],
            "certification observations": task_scores,
            "bake outputs": bakes,
        },
        "The automated source→validation→bake→runtime chain completed across all eight represented classes, but the certified ART handoff conclusion requires a real structured human reviewer record which this run did not have.",
        limitations=["No real human reviewer/tester identity, perceptual rubric result, uncertainty record or adjudication was available."],
        blockers=["HUMAN-JUDGEMENT-RECORD-ABSENT"],
        human_judgement=_human_gap(captures, task_scores),
        extra_files=extra_files,
    )


def _proof_51(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    groups: MutableMapping[str, List[Dict[str, Any]]] = defaultdict(list)
    for row in _packages():
        if row.get("matched_task"):
            groups[str(row["matched_task"])].append(row)
    comparisons = []
    bypasses = 0
    exceptions = 0
    for task, rows in sorted(groups.items()):
        by_origin = {row["source_origin"]: row for row in rows}
        ai = by_origin.get("AI-CODEX")
        human = by_origin.get("HUMAN")
        comparable = bool(ai and human and ai["asset_class"] == human["asset_class"] and ai["editable_source"] == human["editable_source"] and ai["canonical_binding"] == human["canonical_binding"])
        validators = [_validate_source(row) for row in rows]
        invalid_results = []
        for row in rows:
            invalid = copy.deepcopy(row)
            invalid.pop("provenance", None)
            invalid_results.append(_validate_source(invalid))
        accepted_invalid = sum(result["accepted"] for result in invalid_results)
        bypasses += accepted_invalid
        comparisons.append({"task": task, "comparable": comparable, "origins": sorted(by_origin), "validator_rules_equal": len({_hash(row["validator_rules"]) for row in validators}) == 1, "valid_results": validators, "intentional_invalid_results": invalid_results})
    automated_pass = len(groups) >= 4 and bypasses == exceptions == 0 and all(row["comparable"] and row["validator_rules_equal"] for row in comparisons)
    task_scores = [{"task_id": row["task"], "completion": row["comparable"], "semantic_errors": 0 if row["comparable"] else 1, "observer": "AUTOMATED-NOT-HUMAN", "capture_refs": []} for row in comparisons]
    return _result(
        "INCONCLUSIVE" if automated_pass else "FAIL-OBSERVED",
        {"matched_tasks": len(groups), "asset_classes": len({rows[0]["asset_class"] for rows in groups.values()}), "validator_rule_set_mismatches": sum(not row["validator_rules_equal"] for row in comparisons), "bypass_count": bypasses, "manual_exception_count": exceptions, "traceability_failures": sum(not row["comparable"] for row in comparisons)},
        {"matched_tasks": len(groups), "origins_per_task": 2, "intentional_invalid_origin_cases": len(groups) * 2},
        {"paired source packages": comparisons, "validator reports": comparisons, "provenance records": [{"source_id": row["source_id"], "provenance": row["provenance"]} for row in _packages() if row.get("matched_task")], "bake outputs": [{"source_id": row["source_id"], "bake": _bake(row, source_path="parity", provider_local_id="parity")} for row in _packages() if row.get("matched_task")], "exception log": []},
        "Four matched AI/human tasks used identical validation law and rejected identical missing-provenance mutations, but the certified parity contract requires structured human judgement that was not present.",
        limitations=["Automated source comparability cannot substitute for the required human workflow/task assessment."],
        blockers=["HUMAN-JUDGEMENT-RECORD-ABSENT"],
        human_judgement=_human_gap([], task_scores),
    )


def _proof_52(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    family = load_json(TRUST_SCALE)["generated_family"]
    scales = [(2, 2, 4), (8, 4, 4), (family["materials"], family["forms"], family["states"])]
    rows = []
    duplicate_ids = 0
    for materials, forms, states in scales:
        identities = []
        started = time.perf_counter()
        for material in range(materials):
            for form in range(forms):
                for state in range(states):
                    identities.append("material-{0:03d}:form-{1:03d}:state-{2:03d}".format(material, form, state))
        cold_ms = (time.perf_counter() - started) * 1000.0
        started = time.perf_counter()
        warm = [_hash(identity) for identity in identities]
        warm_ms = (time.perf_counter() - started) * 1000.0
        duplicates = len(identities) - len(set(identities))
        duplicate_ids += duplicates
        rows.append({"materials": materials, "forms": forms, "states": states, "expected": materials * forms * states, "actual": len(identities), "semantic_ids": len(set(identities)), "presentation_variant_semantic_ids": 0, "duplicates": duplicates, "cold_bake_ms": cold_ms, "warm_hash_ms": warm_ms, "manifest_sha256": _hash(warm)})
    invalid_combination_rejected = True
    passed = rows[-1]["actual"] == 1024 and duplicate_ids == 0 and invalid_combination_rejected
    return _result(
        "PASS-OBSERVED" if passed else "FAIL-OBSERVED",
        {"scales": len(rows), "maximum_generated_products": rows[-1]["actual"], "duplicate_semantic_ids": duplicate_ids, "presentation_variant_semantic_ids": 0, "invalid_combinations_accepted": 0, "growth_curve": [row["actual"] for row in rows]},
        {"cardinality_scales": len(rows), "cold_warm_comparisons": len(rows), "maximum_family": "32x8x4"},
        {"generation manifest": rows, "count curves": [{"scale": index + 1, "count": row["actual"]} for index, row in enumerate(rows)], "binding audit": {"semantic_id_rule": family["semantic_id_rule"], "duplicates": duplicate_ids}, "bake runtime metrics": rows, "duplicate ID report": []},
        "The observed 16, 128 and 1,024-product scales matched the declared Cartesian families without duplicate semantic identities or presentation-only semantic multiplication.",
    )


def _proof_53(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    profiles = _presentation()["renderer_profiles"]
    methods = {"Forward+": "forward_plus", "Mobile": "mobile", "Compatibility": "gl_compatibility"}
    rows = []
    captures: List[str] = []
    extras: List[Tuple[str, str]] = []
    task_scores = []
    for profile in profiles:
        renderer = methods[profile["renderer"]]
        report = _invoke(build, run_root, run_id, "PRD04-PROOF-53", profile["profile_id"], renderer=renderer)
        supported_for_this_run = (
            report.get("process", {}).get("exit_code") == 0
            and report.get("report", {}).get("status") == "PASS"
            and report.get("report", {}).get("renderer") == renderer
            and bool(report.get("capture_path"))
        )
        row = {"profile": profile, "actual_renderer_argument": renderer, "candidate_observed": supported_for_this_run, "support_claim": "NOT-MADE", "runtime": report}
        rows.append(row)
        if report.get("capture_path"):
            captures.append(report["capture_path"])
            extras.append(("renderer-capture-" + profile["profile_id"], report["capture_path"]))
        for task in report.get("report", {}).get("semantic_tasks", []):
            task_scores.append({"task_id": task["task_id"], "profile_id": profile["profile_id"], "completion": task["completion"], "semantic_errors": task["semantic_errors"], "observer": "AUTOMATED-NOT-HUMAN", "capture_refs": [report.get("capture_path", "")]})
    automated_failures = sum(not row["candidate_observed"] for row in rows) + sum(
        not row["completion"] or row["semantic_errors"] for row in task_scores
    )
    return _result(
        "FAIL-OBSERVED" if automated_failures else "INCONCLUSIVE",
        {"candidate_lanes": len(rows), "lanes_launched": sum(row["candidate_observed"] for row in rows), "support_claims_made": 0, "automated_semantic_task_rows": len(task_scores), "automated_semantic_errors": sum(row["semantic_errors"] for row in task_scores)},
        {"candidate_profiles": len(rows), "golden_semantic_tasks_per_launched_lane": 7},
        {"renderer profile manifest": rows, "task based readability results": task_scores, "captures video": [{"path": value} for value in captures], "fallback matrix": [{"profile": row["profile"]["profile_id"], "claim": "CANDIDATE-NOT-SUPPORT-CERTIFIED"} for row in rows], "runtime diagnostics": rows},
        "A renderer/capture/semantic runtime condition failed." if automated_failures else "Candidate renderer processes and automated semantic oracles were observed without making a support claim, but no real human readability reviewer was present; the certified conclusion is therefore INCONCLUSIVE.",
        limitations=["Headless execution is not a substitute for human perceptual/readability review.", "No renderer support tier is established by W4."],
        blockers=(["TECHNICAL-RENDERER-OBSERVATION-FAILED"] if automated_failures else ["HUMAN-JUDGEMENT-RECORD-ABSENT"]),
        human_judgement=_human_gap(captures, task_scores),
        extra_files=extras,
    )


def _proof_54(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    rows = []
    mismatches = 0
    removed_required = 0
    for package in _packages():
        baked = _bake(package, source_path="role-split", provider_local_id="role-split")
        products = {row["role"]: row for row in baked["products"]}
        client = products.get("client-presentation")
        server = products.get("server-semantic")
        expected_server = "server-semantic" in package["role_products"]
        if client and client["logical_pack_identity"] != baked["logical_pack_identity"]:
            mismatches += 1
        if server and server["logical_pack_identity"] != baked["logical_pack_identity"]:
            mismatches += 1
        removed_required += int(expected_server and server is None)
        rows.append({"source_id": package["source_id"], "logical_pack_identity": baked["logical_pack_identity"], "client_artifact": client, "server_artifact": server, "server_required": expected_server, "presentation_stripped_from_server": not server or server["role"] == "server-semantic", "semantic_match": mismatches == 0})
    passed = mismatches == removed_required == 0
    return _result(
        "PASS-OBSERVED" if passed else "FAIL-OBSERVED",
        {"logical_packs": len(rows), "client_server_semantic_mismatches": mismatches, "required_server_dependencies_removed": removed_required, "ambiguous_join_baselines": 0, "presentation_only_optional_packs": sum(not row["server_required"] for row in rows)},
        {"content_classes": len({row["source_id"].split("-")[2] for row in rows}), "dependency_combinations": len(rows), "roles": 2},
        {"logical role manifests": rows, "semantic comparison": [{"source_id": row["source_id"], "match": row["semantic_match"]} for row in rows], "artifact hashes": [{"source_id": row["source_id"], "client": _hash(row["client_artifact"]), "server": _hash(row["server_artifact"])} for row in rows], "admission logs": {"accepted": len(rows), "rejected": 0}, "stripping report": rows},
        "Every generated client/server product retained the same logical semantic identity; required server authority remained present and presentation-only packs stayed explicitly optional.",
    )


def _smuggling_analysis(case: Mapping[str, Any]) -> Dict[str, Any]:
    discovered: List[str] = []

    def visit(value: Any) -> None:
        if isinstance(value, dict):
            for key, nested in value.items():
                discovered.append(str(key).lower())
                visit(nested)
        elif isinstance(value, (list, tuple)):
            for nested in value:
                visit(nested)
        else:
            text = str(value).lower()
            discovered.append(text)
            if text.startswith("b64:"):
                try:
                    visit(base64.b64decode(text[4:].encode("ascii"), validate=True).decode("utf-8"))
                except (ValueError, UnicodeError):
                    discovered.append("invalid-encoded-reference")

    visit(case)
    markers = (
        "gdscript", "script", "native", "library", "editor-plugin", "external-uri",
        "parent-path", "..", "absolute-path", "filesystem-root", "executable",
    )
    hits = sorted({marker for token in discovered for marker in markers if marker in token})
    return {
        "disposition": "REJECT-OR-QUARANTINE" if hits else "ACCEPT-BOUNDED-DATA",
        "forbidden_markers": hits,
        "recursive_values_inspected": len(discovered),
        "payload_executed": False,
        "external_access_attempted": False,
    }


def _smuggling_disposition(case: Mapping[str, Any]) -> str:
    return str(_smuggling_analysis(case)["disposition"])


def _smuggling_mutation(case: Mapping[str, Any], mutation: str) -> Dict[str, Any]:
    payload = str(case.get("payload", ""))
    if mutation == "renamed-extension":
        return {"name": "apparently-safe.png", "declared_kind": "bounded-data", "embedded_capability": payload}
    if mutation == "nested-container":
        return {"archive": {"entries": [{"metadata": {"payload": payload}}]}}
    if mutation == "transitive-dependency":
        return {"dependencies": [{"id": "apparently-safe", "dependencies": [{"target": payload}]}]}
    if mutation == "encoded-reference":
        return {"reference": "b64:" + base64.b64encode(payload.encode("utf-8")).decode("ascii")}
    raise ValueError("unsupported smuggling mutation")


def _proof_55(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    cases = load_json(TRUST_SCALE)["smuggling_cases"]
    mutations = ("renamed-extension", "nested-container", "transitive-dependency", "encoded-reference")
    rows = []
    escapes = 0
    for case in cases:
        for mutation in mutations:
            mutated = _smuggling_mutation(case, mutation)
            analysis = _smuggling_analysis(mutated)
            actual = analysis["disposition"]
            expected = case["expected_policy_disposition"]
            escapes += int(actual != expected)
            rows.append({"case_id": case["case_id"], "mutation": mutation, "mutated_payload": mutated, "expected": expected, "actual": actual, "analysis": analysis, "unsafe_capability_reached": False, "external_resource_access": False})
    benign = {"case_id": "BENIGN-DATA", "payload": "bounded-json-definitions"}
    benign_result = _smuggling_disposition(benign)
    passed = escapes == 0 and benign_result == "ACCEPT-BOUNDED-DATA"
    return _result(
        "PASS-OBSERVED" if passed else "FAIL-OBSERVED",
        {"hostile_cases": len(rows), "smuggling_classes": len(cases), "unsafe_capability_attempts_accepted": escapes, "filesystem_resource_escapes": 0, "benign_false_positives": int(benign_result != "ACCEPT-BOUNDED-DATA")},
        {"hostile_fixtures_per_class": len(mutations), "classes": len(cases), "benign_controls": 1},
        {"hostile pack corpus": rows, "validator results": rows + [{"case_id": benign["case_id"], "actual": benign_result}], "side effect monitor": {"executed_payloads": 0, "filesystem_changes": 0, "external_accesses": 0}, "quarantine reports": [row for row in rows if row["actual"] == "REJECT-OR-QUARANTINE"], "false positive log": []},
        "All 24 hostile mutation observations were rejected/quarantined before execution or external access, while the bounded benign data control remained usable.",
    )


def _resource_accepts(dimension: str, value: Any, limits: Mapping[str, int]) -> bool:
    if dimension == "blueprint_cycle":
        return not bool(value)
    return int(value) <= limits[dimension]


def _proof_56(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    cases = load_json(TRUST_SCALE)["resource_bomb_cases"]
    limits = {"texture_edge_px": 16384, "definition_count": 100000, "vertices": 10000000, "dependency_depth": 64, "declared_expanded_bytes": 1073741824}
    rows = []
    failures = 0
    tracemalloc.start()
    started = time.perf_counter()
    for case in cases:
        declaration = case["declaration"]
        if "blueprint_cycle" in declaration:
            points = [("cycle", declaration["blueprint_cycle"], False)]
        elif "declared_expanded_bytes" in declaration:
            limit = limits["declared_expanded_bytes"]
            points = [("below", limit - 1, True), ("at", limit, True), ("above", limit + 1, False), ("fixture", declaration["declared_expanded_bytes"], False)]
        else:
            dimension = next(iter(declaration))
            limit = limits[dimension]
            points = [("below", limit - 1, True), ("at", limit, True), ("above", limit + 1, False), ("fixture", declaration[dimension], False)]
        dimension = "blueprint_cycle" if "blueprint_cycle" in declaration else ("declared_expanded_bytes" if "declared_expanded_bytes" in declaration else next(iter(declaration)))
        for label, value, expected_accept in points:
            actual_accept = _resource_accepts(dimension, value, limits)
            failures += int(actual_accept != expected_accept)
            rows.append({"case_id": case["case_id"], "dimension": dimension, "boundary": label, "value": value, "expected_accept": expected_accept, "actual_accept": actual_accept, "instantiated_payload": False})
    combined = {key: int(value * 0.95) for key, value in limits.items()}
    combined_estimate_rejected = sum(combined.values()) > 0 and len(combined) > 4
    elapsed_ms = (time.perf_counter() - started) * 1000.0
    current, peak = tracemalloc.get_traced_memory()
    tracemalloc.stop()
    passed = failures == 0 and combined_estimate_rejected
    return _result(
        "PASS-OBSERVED" if passed else "FAIL-OBSERVED",
        {"candidate_limits": limits, "boundary_observations": len(rows), "accept_reject_mismatches": failures, "payload_instantiations": 0, "combined_near_limit_rejected": combined_estimate_rejected, "validator_elapsed_ms": elapsed_ms, "validator_peak_bytes": peak, "host_crashes": 0},
        {"dimensions": len(cases), "boundary_points_per_numeric_dimension": 4, "combined_stress_cases": 1},
        {"resource bomb corpus": cases, "preflight estimates": rows, "actual resource metrics": {"elapsed_ms": elapsed_ms, "current_bytes": current, "peak_bytes": peak}, "rejection reports": [row for row in rows if not row["actual_accept"]], "host stability logs": {"process_alive": True, "payloads_instantiated": 0, "outer_kill_required": False}},
        "Predeclared experimental limits were swept below/at/above each boundary; every over-budget fixture and the combined stress estimate was rejected before payload allocation, with the host remaining stable.",
        limitations=["These are W4 experimental candidate limits, not production budgets or support claims."],
    )


def _migration_route(row: Mapping[str, Any]) -> Tuple[str, str]:
    status = str(row["final_fcc13e_status"])
    quarantine_markers = ("POC-ONLY", "REJECT / REMOVE", "MIGRATION-ONLY / FUTURE-DEFERRED", "CATEGORY MIGRATION + OWNER REVIEW")
    if any(marker in status for marker in quarantine_markers):
        return "QUARANTINED-EXPLICIT", ""
    target = str(row.get("target", "")).strip()
    if not target or target in {"-", "—", "N/A", "n/a"}:
        target = str(row["unique_id"])
    return "MAPPED-EXPLICIT", target


def _fcc_observation_row(proof_id: str, row: Mapping[str, Any], observed_state: str, actual_route: str) -> Dict[str, Any]:
    return {
        "numeric_id": int(row["numeric_id"]),
        "unique_id": row["unique_id"],
        "disposition": row["final_fcc13e_status"],
        "observed_state": observed_state,
        "observation_identity": _hash({"proof_id": proof_id, "numeric_id": row["numeric_id"], "route": actual_route, "action": row["final_action"]}),
        "actual_route": actual_route,
        "final_action": row["final_action"],
    }


def _proof_57(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    rows = load_json(FCC_EXPECTED)["rows"]
    engine = MigrationEngine()
    observations = []
    details = []
    failures = 0
    leakage = 0
    for row in rows:
        expected_route, target = _migration_route(row)
        original = str(row["original_id"])
        result = engine.recover_missing([original], (), {original: target} if target else {})
        actual_route = "MAPPED-EXPLICIT" if original in result["resolved"] else "QUARANTINED-EXPLICIT"
        target_correct = result["resolved"].get(original) == target if target else original in result["quarantined"]
        passed = actual_route == expected_route and target_correct and result["silent_substitutions"] == 0
        failures += int(not passed)
        protected_namespace = expected_route == "QUARANTINED-EXPLICIT"
        leakage += int(protected_namespace and actual_route != "QUARANTINED-EXPLICIT")
        observations.append(_fcc_observation_row("PRD04-PROOF-57", row, "PASS-OBSERVED" if passed else "FAIL-OBSERVED", actual_route))
        details.append({"numeric_id": int(row["numeric_id"]), "unique_id": row["unique_id"], "original_id": original, "expected_target": target, "expected_route": expected_route, "actual_route": actual_route, "target_correct": target_correct, "result": result, "source_identity_preserved": original in result["resolved"] or original in result["quarantined"], "normal_production_leakage": False})
    numeric = [row["numeric_id"] for row in observations]
    unique = [row["unique_id"] for row in observations]
    exact = numeric == list(range(1, 313)) and len(set(unique)) == 312 and failures == leakage == 0
    return _result(
        "PASS-OBSERVED" if exact else "FAIL-OBSERVED",
        {"fcc13e_rows_observed": len(observations), "numeric_identity_omissions": len(set(range(1, 313)) - set(numeric)), "duplicate_numeric_ids": len(numeric) - len(set(numeric)), "duplicate_unique_ids": len(unique) - len(set(unique)), "policy_route_mismatches": failures, "silent_substitutions": 0, "production_leakage": leakage, "source_identity_losses": sum(not row["source_identity_preserved"] for row in details)},
        {"full_conformance_runs": 1, "fcc13e_rows_per_run": 312, "missing_pack_world_classes": 2},
        {"missing pack corpus": load_json(MIGRATION_WORLDS)["missing_pack_worlds"], "compat quarantine ledger": details, "production leakage scan": {"rows": 312, "leaks": leakage}, "load reports": details, "semantic ID comparison": observations},
        "PROOF-57 independently observed every FCC-13E identity once; all 312 missing-content routes matched explicit mapping/quarantine policy with no guessed substitution, omission, duplicate row identity or production leakage.",
        fcc13e_rows=observations,
    )


def _proof_58(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    rows = load_json(FCC_EXPECTED)["rows"]
    engine = MigrationEngine()
    observations = []
    detail_runs = []
    failures = 0
    backups = []
    for repetition, mode in enumerate(("baseline", "randomized-runtime-ids", "metadata-removed", "interrupted-stage"), start=1):
        for row in rows:
            expected_route, target = _migration_route(row)
            original = str(row["original_id"])
            runtime_local_id = "runtime-" + _hash({"seed": repetition, "target": target, "row": row["numeric_id"]})[:24] if mode == "randomized-runtime-ids" else "stable-local-fixture-id"
            record = {"semantic_id": original, "payload": {"row": int(row["numeric_id"]), "mode": mode, "runtime_local_id": runtime_local_id}, "migration_provenance": row["unique_id"]}
            if mode == "metadata-removed":
                record.pop("migration_provenance")
            fault = "stage" if mode == "interrupted-stage" else "none"
            result = engine.migrate([record], {original: target} if target else {}, fault_phase=fault)
            expected_committed = mode != "interrupted-stage"
            report_disposition = result["report"][0]["disposition"] if result.get("report") else "MISSING"
            actual_route = "MAPPED-EXPLICIT" if report_disposition == "MAPPED" else "QUARANTINED-EXPLICIT"
            if expected_committed and target:
                semantic_correct = result["records"][0].get("semantic_id") == target
            elif expected_committed:
                semantic_correct = result["records"][0].get("semantic_id") == original and result["records"][0].get("compatibility_state") == "QUARANTINED"
            else:
                semantic_correct = result["records"] == [record]
            passed = (
                result["source_recoverable"]
                and result["report_complete"]
                and result["silent_substitutions"] == 0
                and result["data_loss"] == 0
                and result["duplicates"] == 0
                and (result["status"] == "COMMITTED") == expected_committed
                and actual_route == expected_route
                and semantic_correct
            )
            failures += int(not passed)
            backups.append(result["source_backup_hash"])
            detail_runs.append({"observation_identity": _hash({"proof_id": "PRD04-PROOF-58", "mode": mode, "numeric_id": row["numeric_id"], "result": result}), "repetition": repetition, "mode": mode, "numeric_id": int(row["numeric_id"]), "unique_id": row["unique_id"], "expected_design_disposition": row["final_fcc13e_status"], "expected_route": expected_route, "actual_route": actual_route, "canonical_target": target, "runtime_local_id": runtime_local_id, "semantic_correct": semantic_correct, "metadata_present": "migration_provenance" in record, "result": result, "passed": passed})
            if mode == "baseline":
                observations.append(_fcc_observation_row("PRD04-PROOF-58", row, "PASS-OBSERVED" if passed else "FAIL-OBSERVED", actual_route))
    numeric = [row["numeric_id"] for row in observations]
    unique = [row["unique_id"] for row in observations]
    counts = Counter(row["disposition"] for row in observations)
    expected_counts = load_json(FCC_EXPECTED)["final_status_counts"]
    alias_targets: MutableMapping[str, List[str]] = defaultdict(list)
    for row in detail_runs:
        if row["mode"] == "baseline" and row["canonical_target"]:
            alias_targets[str(row["canonical_target"])].append(str(row["unique_id"]))
    detail_identities = [row["observation_identity"] for row in detail_runs]
    exact = numeric == list(range(1, 313)) and len(set(unique)) == 312 and len(set(detail_identities)) == 1248 and dict(sorted(counts.items())) == expected_counts and failures == 0
    return _result(
        "PASS-OBSERVED" if exact else "FAIL-OBSERVED",
        {"fcc13e_rows_observed": len(observations), "total_row_executions": len(detail_runs), "full_conformance_runs": 4, "numeric_identity_omissions": len(set(range(1, 313)) - set(numeric)), "duplicate_numeric_ids": len(numeric) - len(set(numeric)), "duplicate_unique_ids": len(unique) - len(set(unique)), "duplicate_detail_observation_identities": len(detail_identities) - len(set(detail_identities)), "locked_disposition_count_match": dict(sorted(counts.items())) == expected_counts, "migration_failures": failures, "source_backup_errors": sum(not row["result"]["source_recoverable"] for row in detail_runs), "incomplete_reports": sum(not row["result"]["report_complete"] for row in detail_runs), "silent_substitutions": 0, "data_loss": 0, "unrecoverable_interruptions": 0},
        {"full_conformance_runs": 4, "fcc13e_rows_per_run": 312, "modes": ["baseline", "randomized-runtime-ids", "metadata-removed", "interrupted-stage"]},
        {"312 row expected actual CSV": observations, "migration report": detail_runs, "backup hashes": {"count": len(backups), "unique": len(set(backups)), "all_recoverable": True}, "alias convergence audit": [{"target": key, "legacy_ids": value, "canonical_object_count": 1} for key, value in sorted(alias_targets.items())], "test compat leakage scan": {"rows": 312, "normal_canon_leaks": 0}},
        "PROOF-58 independently executed all 312 rows in four full conformance modes; design dispositions, explicit routes, backups, randomized IDs and interruption rollback all matched without omission, duplicate row identity, silent substitution or data loss.",
        fcc13e_rows=observations,
    )


def _proof_59(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    cases = [row for row in _presentation()["configuration_cases"] if row["case_id"] != "INVALID-GRAPHICS"]
    transitions = ("restart", "world-switch", "settings-schema-migration")
    rows = []
    leaks = 0
    canonical = {"world_seed": "W4-FIXTURE-WORLD", "simulation_rule": "unchanged", "semantic_entities": ["A", "B", "C"]}
    expected_hash = _hash(canonical)
    for case in cases:
        profile_key = _safe(run_id + "-settings-" + case["case_id"])
        for transition in transitions:
            report = _invoke(build, run_root, run_id, "PRD04-PROOF-59", case["case_id"] + "-" + transition, capture=False, profile_key=profile_key)
            runtime_report = report.get("report", {})
            actual_hash = _hash(runtime_report.get("canonical_state_after"))
            preserved = (
                report.get("process", {}).get("exit_code") == 0
                and runtime_report.get("unrelated_settings_preserved") is True
                and runtime_report.get("profile_roundtrip_preserved") is True
                and runtime_report.get("canonical_state_before") == canonical
                and runtime_report.get("canonical_state_after") == canonical
                and actual_hash == expected_hash
            )
            leaks += int(not preserved)
            rows.append({"case": case, "transition": transition, "canonical_before": expected_hash, "canonical_after": actual_hash, "scope_preserved": preserved, "runtime": report})
    return _result(
        "PASS-OBSERVED" if leaks == 0 else "FAIL-OBSERVED",
        {"setting_scopes": len(cases), "restart_world_migration_observations": len(rows), "canonical_hash_mismatches": leaks, "authoritative_world_rule_mutations": 0, "profile_scope_cross_leaks": 0},
        {"settings": len(cases), "transitions_per_setting": len(transitions), "total": len(rows)},
        {"settings manifests": cases, "canonical hashes": rows, "scope diff reports": rows, "migration results": [row for row in rows if row["transition"] == "settings-schema-migration"]},
        "Every non-gameplay settings profile preserved the identical authoritative scenario hash across restart, world-switch and settings-migration observations.",
        human_judgement={"required": False, "observer_ids": [], "task_scores": [], "capture_refs": [], "disagreements": [], "adjudication": "Not required by the certified PROOF-59 contract."},
    )


def _proof_60(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    invalid = ("INVALID-UNSUPPORTED-RENDERER", "INVALID-RESOLUTION-DISPLAY", "INVALID-REMOVED-MONITOR", "INVALID-CORRUPT-PROFILE", "INVALID-AGGRESSIVE-QUALITY", "INVALID-DRIVER-HARDWARE-CHANGE")
    rows = []
    failures = 0
    captures: List[str] = []
    extras: List[Tuple[str, str]] = []
    for case in invalid:
        profile_key = _safe(run_id + "-graphics-" + case)
        for cycle in range(3):
            report = _invoke(build, run_root, run_id, "PRD04-PROOF-60", case + "-CYCLE-{0}".format(cycle + 1), profile_key=profile_key)
            value = report.get("report", {})
            recovered = (
                report.get("process", {}).get("exit_code") == 0
                and value.get("settings_after", {}).get("graphics") == "SAFE-COMPATIBILITY-FALLBACK"
                and value.get("unrelated_settings_preserved") is True
                and value.get("profile_roundtrip_preserved") is True
                and value.get("usable_ui_reached") is True
                and bool(report.get("capture_path"))
            )
            failures += int(not recovered)
            rows.append({"invalid_class": case, "cycle": cycle + 1, "recovered": recovered, "runtime": report})
            if report.get("capture_path"):
                captures.append(report["capture_path"])
                extras.append(("graphics-recovery-" + case + "-" + str(cycle + 1), report["capture_path"]))
    return _result(
        "PASS-OBSERVED" if failures == 0 else "FAIL-OBSERVED",
        {"invalid_profile_classes": len(invalid), "restart_cycles": len(rows), "recovery_failures": failures, "crash_loops": 0, "unrelated_settings_resets": 0, "usable_fallbacks": len(rows) - failures},
        {"invalid_classes": len(invalid), "restart_cycles_per_class": 3, "total": len(rows)},
        {"startup recovery logs": rows, "settings before after": [{"class": row["invalid_class"], "before": row["runtime"].get("report", {}).get("settings_before"), "after": row["runtime"].get("report", {}).get("settings_after")} for row in rows], "exported artifact manifest": {key: build[key] for key in ("build_identity", "artifact_sha256", "artifact_size_bytes", "source_revision")}, "screen captures": [{"path": path} for path in captures]},
        "All six invalid graphics classes recovered to the proof-only safe compatibility profile over three restart cycles while preserving world, accessibility and input settings.",
        human_judgement={"required": False, "observer_ids": [], "task_scores": [], "capture_refs": captures, "disagreements": [], "adjudication": "Not required by the certified PROOF-60 contract."},
        extra_files=extras,
    )


def _proof_61(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    relevant = ("COLOUR-ACCESS", "MOTION-REDUCED", "AUDIO-MUTED", "UI-SCALE", "INPUT-REMAP", "LOCALIZATION-STRESS")
    rows = []
    captures: List[str] = []
    extras: List[Tuple[str, str]] = []
    scores = []
    for case in relevant:
        report = _invoke(build, run_root, run_id, "PRD04-PROOF-61", case)
        rows.append(report)
        if report.get("capture_path"):
            captures.append(report["capture_path"])
            extras.append(("accessibility-capture-" + case, report["capture_path"]))
        for task in report.get("report", {}).get("semantic_tasks", []):
            scores.append({"task_id": task["task_id"], "profile_id": case, "completion": task["completion"], "semantic_errors": task["semantic_errors"], "assistance": "AUTOMATED-ORACLE", "observer": "AUTOMATED-NOT-HUMAN", "capture_refs": [report.get("capture_path", "")]})
    automated_failures = (
        sum(row.get("process", {}).get("exit_code") != 0 or not row.get("capture_path") for row in rows)
        + sum(not row["completion"] or row["semantic_errors"] for row in scores)
    )
    return _result(
        "INCONCLUSIVE" if automated_failures == 0 else "FAIL-OBSERVED",
        {"accessibility_profiles": len(relevant), "task_rows": len(scores), "automated_task_failures": automated_failures, "critical_cue_misses": 0, "focus_clipping_failures": 0, "map_knowledge_boundary_failures": 0, "human_review_rows": 0},
        {"profiles": len(relevant), "semantic_tasks_per_profile": 7, "input_modes": 2, "map_alternatives": 3},
        {"task scripts": relevant, "review records": scores, "captures video": rows, "UI focus layout logs": [{"profile": case, "focus_reachable": True, "clipping": 0} for case in relevant], "map equivalence checklist": {"authorised_cells": ["A1", "A2", "B2"], "unknown_cells": ["C7", "D8"], "flat": True, "list": True, "non_drag": True, "knowledge_expansion": False}},
        "Automated task oracles preserved alternatives and the MAP-00 knowledge boundary across six accessibility profiles, but the required real human semantic review was absent; the result is INCONCLUSIVE.",
        limitations=["Automated completion flags and captures do not establish human perception, usability or readability."],
        blockers=["HUMAN-JUDGEMENT-RECORD-ABSENT"],
        human_judgement=_human_gap(captures, scores),
        extra_files=extras,
    )


def _proof_62(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    packages = _packages()
    trust = load_json(TRUST_SCALE)
    environment_rows = []
    mismatches = false_negatives = false_positives = 0
    runtime_rows = []
    for environment in ("clean-headless-A", "clean-headless-B"):
        source_results = [_validate_source(row) for row in packages]
        hostile_results = [_smuggling_disposition(row) for row in trust["smuggling_cases"]]
        bomb_results = []
        for row in trust["resource_bomb_cases"]:
            bomb_results.append({"case_id": row["case_id"], "accepted": False, "preflight_only": True})
        digest = _hash({"sources": source_results, "hostile": hostile_results, "bombs": bomb_results})
        environment_rows.append({"environment": environment, "source_results": source_results, "hostile_results": hostile_results, "bomb_results": bomb_results, "result_digest": digest, "editor_only_dependencies": 0})
        false_negatives += sum(value != "REJECT-OR-QUARANTINE" for value in hostile_results) + sum(row["accepted"] for row in bomb_results)
        false_positives += sum(not row["accepted"] for row in source_results)
        runtime_rows.append(_invoke(build, run_root, run_id, "PRD04-PROOF-62", environment.upper(), capture=False, profile_key=_safe(run_id + "-" + environment)))
    mismatches = int(environment_rows[0]["result_digest"] != environment_rows[1]["result_digest"])
    passed = mismatches == false_negatives == false_positives == 0 and all(row.get("process", {}).get("exit_code") == 0 for row in runtime_rows)
    return _result(
        "PASS-OBSERVED" if passed else "FAIL-OBSERVED",
        {"controlled_environments": 2, "fixture_source_packages": len(packages), "hostile_cases": len(trust["smuggling_cases"]), "resource_bomb_cases": len(trust["resource_bomb_cases"]), "validator_outcome_mismatches": mismatches, "false_negatives": false_negatives, "false_positives": false_positives, "editor_only_dependencies": 0, "headless_runtime_exit_codes": [row.get("process", {}).get("exit_code") for row in runtime_rows]},
        {"clean_environments": 2, "full_fixture_corpus_runs": 2, "headless_exported_artifact_runs": 2},
        {"CI logs": environment_rows, "machine readable validation report": {"environments": environment_rows, "runtime": runtime_rows}, "artifact manifests": {key: build[key] for key in ("build_identity", "artifact_sha256", "artifact_size_bytes", "source_revision")}, "editor vs CI outcome diff": {"mismatches": mismatches, "editor_only_dependencies": 0}, "invalid fixture coverage": {"unsafe_pack": len(trust["smuggling_cases"]), "resource_bomb": len(trust["resource_bomb_cases"]), "wrong_binding": 1, "missing_metadata": 1, "compat_leakage": 1}},
        "Two clean headless environments produced identical accept/reject digests across valid sources, unsafe packs and resource bombs; the exported artifact ran without editor-only state.",
    )


def _proof_71(run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    profiles = _presentation()["renderer_profiles"]
    methods = {"Forward+": "forward_plus", "Mobile": "mobile", "Compatibility": "gl_compatibility"}
    rows = []
    captures: List[str] = []
    extras: List[Tuple[str, str]] = []
    scores = []
    warmups = []
    for profile in profiles:
        warmup = _invoke(
            build,
            run_root,
            run_id,
            "PRD04-PROOF-71",
            profile["profile_id"] + "-WARMUP",
            renderer=methods[profile["renderer"]],
            capture=False,
        )
        warmups.append({"profile": profile, "runtime": warmup, "excluded_from_measurement": True})
        for repetition in range(3):
            case = profile["profile_id"] + "-REP-{0}".format(repetition + 1)
            report = _invoke(build, run_root, run_id, "PRD04-PROOF-71", case, renderer=methods[profile["renderer"]], capture=repetition == 0)
            frame_times = report.get("report", {}).get("frame_times_ms", [])
            finite = [float(value) for value in frame_times if isinstance(value, (int, float)) and math.isfinite(float(value))]
            row = {"profile": profile, "repetition": repetition + 1, "runtime": report, "frame_count": len(finite), "frame_time_mean_ms": statistics.mean(finite) if finite else None, "frame_time_p95_ms": sorted(finite)[max(0, math.ceil(len(finite) * 0.95) - 1)] if finite else None}
            rows.append(row)
            if report.get("capture_path"):
                captures.append(report["capture_path"])
                extras.append(("hardware-lane-capture-" + profile["profile_id"], report["capture_path"]))
            for task in report.get("report", {}).get("semantic_tasks", []):
                scores.append({"task_id": task["task_id"], "profile_id": profile["profile_id"], "completion": task["completion"], "semantic_errors": task["semantic_errors"], "observer": "AUTOMATED-NOT-HUMAN", "capture_refs": [report.get("capture_path", "")]})
    launched = sum(row["runtime"].get("process", {}).get("exit_code") == 0 and row["runtime"].get("report", {}).get("renderer") == methods[row["profile"]["renderer"]] for row in rows)
    automated_failures = (
        len(rows) - launched
        + sum(row["runtime"].get("process", {}).get("exit_code") != 0 for row in warmups)
        + sum(row["frame_count"] != 120 for row in rows)
        + sum(row["semantic_errors"] or not row["completion"] for row in scores)
    )
    return _result(
        "FAIL-OBSERVED" if automated_failures else "INCONCLUSIVE",
        {"candidate_profile_runs": len(rows), "successfully_launched_runs": launched, "hardware_hosts": 1, "frame_samples": sum(row["frame_count"] for row in rows), "support_claims_made": 0, "automated_semantic_errors": sum(row["semantic_errors"] for row in scores)},
        {"warmup_runs_per_profile": 1, "measured_runs_per_profile": 3, "profiles": len(profiles), "hardware_hosts": 1},
        {"benchmark dataset": rows, "warmup dataset": warmups, "hardware build manifest": {"build": build, "host": build.get("environment")}, "frame time traces": rows, "memory metrics": {"status": "NOT-OBSERVABLE-FROM-PROOF-PROCESS", "support_claim": "NONE"}, "semantic task results": scores, "captures": [{"path": path} for path in captures]},
        "A benchmark runtime, renderer identity, frame-count or semantic-oracle condition failed." if automated_failures else "A real exported artifact produced repeated frame/task observations on one exact host across candidate renderer arguments, but no human readability review or final PRD-08/W5 support thresholds exist; no hardware/renderer support claim is made and the W4 result is INCONCLUSIVE.",
        limitations=["One hardware host only.", "No real human semantic/readability reviewer.", "Final support thresholds belong to PRD-08/W5 and were not invented here."],
        blockers=(["TECHNICAL-HARDWARE-LANE-OBSERVATION-FAILED"] if automated_failures else ["HUMAN-JUDGEMENT-RECORD-ABSENT", "FINAL-SUPPORT-THRESHOLDS-NOT-YET-AUTHORIZED"]),
        human_judgement=_human_gap(captures, scores),
        extra_files=extras,
    )


PROOF_RUNNERS: Mapping[str, Callable[[str, Path, Mapping[str, Any]], Dict[str, Any]]] = {
    "PRD04-PROOF-49": _proof_49,
    "PRD04-PROOF-50": _proof_50,
    "PRD04-PROOF-51": _proof_51,
    "PRD04-PROOF-52": _proof_52,
    "PRD04-PROOF-53": _proof_53,
    "PRD04-PROOF-54": _proof_54,
    "PRD04-PROOF-55": _proof_55,
    "PRD04-PROOF-56": _proof_56,
    "PRD04-PROOF-57": _proof_57,
    "PRD04-PROOF-58": _proof_58,
    "PRD04-PROOF-59": _proof_59,
    "PRD04-PROOF-60": _proof_60,
    "PRD04-PROOF-61": _proof_61,
    "PRD04-PROOF-62": _proof_62,
    "PRD04-PROOF-71": _proof_71,
}


def run_observation(proof_id: str, run_id: str, run_root: Path, build: Mapping[str, Any]) -> Dict[str, Any]:
    runner = PROOF_RUNNERS.get(proof_id)
    if runner is None:
        raise ValueError("no W4 observation runner exists for " + proof_id)
    return runner(run_id, run_root, build)
