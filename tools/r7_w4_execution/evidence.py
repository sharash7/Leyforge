"""Standard W4 evidence-pack construction and validation."""

from __future__ import annotations

import hashlib
import json
import os
import re
import shutil
import tempfile
from pathlib import Path
from typing import Any, Dict, List, Mapping, Sequence, Tuple

from tools.r7_w4_runtime.dependencies import load_reference

from .contracts import (
    EXECUTION_ADMISSION_PATH,
    EXECUTION_PACKAGE,
    READINESS_ADMISSION_PATH,
    ROOT,
    canonical_bytes,
    fixture_identity,
    load_json,
    proof_contracts_by_id,
    sha256_file,
)


def _safe(value: str) -> str:
    return re.sub(r"[^a-z0-9-]+", "-", value.lower()).strip("-") or "artifact"


def _gpu_identity(build: Mapping[str, Any]) -> Tuple[str, str, str]:
    host = build.get("environment", {})
    hardware = host.get("hardware", {}) if isinstance(host, dict) else {}
    gpu = hardware.get("gpu", []) if isinstance(hardware, dict) else []
    if isinstance(gpu, dict):
        gpu = [gpu]
    first = gpu[0] if isinstance(gpu, list) and gpu and isinstance(gpu[0], dict) else {}
    device = str(first.get("Name", "UNAVAILABLE"))
    driver = str(first.get("DriverVersion", "UNAVAILABLE"))
    resolution = "{0}x{1}".format(first.get("CurrentHorizontalResolution", "UNAVAILABLE"), first.get("CurrentVerticalResolution", "UNAVAILABLE"))
    return device, driver, resolution


def environment_identity(build: Mapping[str, Any], role: str) -> Dict[str, Any]:
    host = build.get("environment", {})
    smoke = build.get("smoke_process", {}).get("report", {}) if isinstance(build.get("smoke_process"), dict) else {}
    gpu, driver, resolution = _gpu_identity(build)
    return {
        "os": str(host.get("os", "UNAVAILABLE")),
        "machine": str(host.get("machine", "UNAVAILABLE")),
        "python": str(host.get("python", "UNAVAILABLE")),
        "role": role,
        "isolated_profile": True,
        "artifact_identity": str(build["artifact_sha256"]),
        "renderer": str(smoke.get("renderer", "UNAVAILABLE")),
        "gpu_device": gpu,
        "gpu_driver": driver,
        "resolution": resolution,
        "display_identity": build.get("environment", {}).get("hardware", {}).get("display", []),
        "settings_identity": hashlib.sha256((ROOT / "proofs/r7/w4/fixture-08/presentation-cases.json").read_bytes()).hexdigest(),
        "cpu_identity": build.get("environment", {}).get("hardware", {}).get("cpu", {}),
        "build_identity": build["build_identity"],
        "isolation": ["clean-export-root", "clean-import-cache", "isolated-APPDATA", "isolated-LOCALAPPDATA", "no-shared-user-state"],
    }


def evidence_issues(value: Mapping[str, Any]) -> Tuple[str, ...]:
    issues: List[str] = []
    allowed = {
        "schema_version", "run_id", "evidence_id", "proof_id", "source_revision",
        "admission_boundary_sha256", "fixture_identities", "dependency_identity",
        "environment_identity", "observation", "evaluation", "human_judgement",
        "lifecycle",
    }
    unexpected = sorted(set(value) - allowed)
    if unexpected:
        issues.append("standard evidence has unexpected top-level fields: " + ", ".join(unexpected))
    required = ("schema_version", "run_id", "evidence_id", "proof_id", "source_revision", "admission_boundary_sha256", "fixture_identities", "dependency_identity", "environment_identity", "observation", "evaluation", "lifecycle")
    for field in required:
        if field not in value:
            issues.append("standard evidence missing field: " + field)
    if value.get("schema_version") != "prd07-w4-standard-evidence-pack-v1":
        issues.append("standard evidence schema differs")
    run_id = str(value.get("run_id", ""))
    evidence_id = str(value.get("evidence_id", ""))
    if re.fullmatch(r"PRD07-RUN-\d{4}", run_id) is None or re.fullmatch(r"PRD07-EVID-\d{4}", evidence_id) is None:
        issues.append("standard evidence identity format differs")
    elif run_id.rsplit("-", 1)[1] != evidence_id.rsplit("-", 1)[1]:
        issues.append("standard RUN/EVID sequence differs")
    proof_id = str(value.get("proof_id", ""))
    contracts = proof_contracts_by_id()
    if proof_id not in contracts:
        issues.append("standard evidence proof is not in W4 roster")
    else:
        expected_number = 66 + list(contracts).index(proof_id)
        if run_id != "PRD07-RUN-{0:04d}".format(expected_number) or evidence_id != "PRD07-EVID-{0:04d}".format(expected_number):
            issues.append("standard evidence identity does not match the certified proof order")
    source_revision = str(value.get("source_revision", ""))
    if re.fullmatch(r"[0-9a-f]{40}", source_revision) is None:
        issues.append("standard evidence source revision is not an exact commit")
    admission_hash = str(value.get("admission_boundary_sha256", ""))
    if re.fullmatch(r"[0-9a-f]{64}", admission_hash) is None:
        issues.append("standard evidence admission boundary hash is invalid")
    elif READINESS_ADMISSION_PATH.is_file():
        expected_admission_hash = hashlib.sha256(canonical_bytes(load_json(READINESS_ADMISSION_PATH))).hexdigest()
        if admission_hash != expected_admission_hash:
            issues.append("standard evidence admission boundary differs from certified readiness")
    contract = contracts.get(proof_id, {})
    if isinstance(contract, dict):
        expected_fixtures = fixture_identity(contract.get("requirements", {}).get("fixture_identities", []))
        if value.get("fixture_identities") != expected_fixtures:
            issues.append("standard evidence fixture identities differ from certified inputs")
    if value.get("dependency_identity") != load_reference():
        issues.append("standard evidence dependency identity differs from the certified reference")
    environment = value.get("environment_identity", {})
    required_environment = ("os", "machine", "python", "role", "isolated_profile", "artifact_identity")
    if not isinstance(environment, dict) or any(field not in environment for field in required_environment):
        issues.append("standard evidence environment identity is incomplete")
    elif environment.get("role") not in {"client", "dedicated-server", "forge-ci"} or environment.get("isolated_profile") is not True:
        issues.append("standard evidence environment role/isolation differs")
    elif EXECUTION_ADMISSION_PATH.is_file() and environment.get("execution_admission_sha256") != sha256_file(EXECUTION_ADMISSION_PATH):
        issues.append("standard evidence execution admission identity differs")
    observation = value.get("observation", {})
    evaluation = value.get("evaluation", {})
    outcome = observation.get("state") if isinstance(observation, dict) else None
    if outcome not in {"PASS-OBSERVED", "FAIL-OBSERVED", "INCONCLUSIVE"} or not isinstance(evaluation, dict) or evaluation.get("actual_disposition") != outcome:
        issues.append("standard evidence disposition is missing or inconsistent")
    if isinstance(observation, dict):
        if not observation.get("raw_artifacts") or not isinstance(observation.get("measurements"), dict) or not isinstance(observation.get("repetitions"), dict):
            issues.append("standard evidence observation payload is incomplete")
        else:
            for artifact in observation.get("raw_artifacts", []):
                if not isinstance(artifact, dict) or not {"kind", "path", "sha256", "bytes"}.issubset(artifact):
                    issues.append("standard evidence raw artifact row is incomplete")
                    continue
                artifact_path = str(artifact.get("path", ""))
                if not artifact_path.startswith("artifacts/") or ".." in Path(artifact_path).parts:
                    issues.append("standard evidence raw artifact path escapes its pack")
                if re.fullmatch(r"[0-9a-f]{64}", str(artifact.get("sha256", ""))) is None or not isinstance(artifact.get("bytes"), int) or artifact.get("bytes", -1) < 0:
                    issues.append("standard evidence raw artifact identity is invalid")
        rows = observation.get("fcc13e_rows", [])
        required_rows = 312 if proof_id in {"PRD04-PROOF-57", "PRD04-PROOF-58"} else 0
        if not isinstance(rows, list) or len(rows) != required_rows:
            issues.append("standard evidence FCC-13E row count differs")
        if required_rows:
            numeric = [row.get("numeric_id") for row in rows if isinstance(row, dict)]
            unique = [row.get("unique_id") for row in rows if isinstance(row, dict)]
            if numeric != list(range(1, 313)) or len(set(unique)) != 312:
                issues.append("standard evidence FCC-13E identities are omitted, reordered or duplicated")
            identities = [row.get("observation_identity") for row in rows if isinstance(row, dict)]
            if len(set(identities)) != 312 or any(re.fullmatch(r"[0-9a-f]{64}", str(identity)) is None for identity in identities):
                issues.append("standard evidence FCC-13E observation identities are missing or duplicated")
            if outcome == "PASS-OBSERVED" and any(row.get("observed_state") != "PASS-OBSERVED" for row in rows if isinstance(row, dict)):
                issues.append("standard evidence PASS contains a non-PASS FCC-13E row")
    human_required = bool(contract.get("requirements", {}).get("human_judgement_required")) if isinstance(contract, dict) else False
    human = value.get("human_judgement")
    schema_human_required = proof_id in {
        "PRD04-PROOF-53", "PRD04-PROOF-59", "PRD04-PROOF-60",
        "PRD04-PROOF-61", "PRD04-PROOF-71",
    }
    if (human_required or schema_human_required) and not isinstance(human, dict):
        issues.append("standard evidence lacks required human judgement section")
    if isinstance(human, dict):
        human_fields = {"required", "observer_ids", "task_scores", "capture_refs", "disagreements", "adjudication"}
        if not human_fields.issubset(human):
            issues.append("standard evidence human judgement section is incomplete")
        if human.get("required") is not human_required:
            issues.append("standard evidence human judgement requirement differs from certified readiness")
    if human_required and outcome == "PASS-OBSERVED" and (
        not isinstance(human, dict)
        or not human.get("observer_ids")
        or not human.get("task_scores")
        or not human.get("capture_refs")
    ):
        issues.append("PASS-OBSERVED is not allowed without a complete human reviewer record")
    lifecycle = value.get("lifecycle", {})
    expected_lifecycle = {"allocated_before_execution": True, "identity_retained": True, "registry_reconciled": True, "prd07_evidence_eligible": True, "prd08_submission": "NOT-SUBMITTED", "gameplay_permission": "CLOSED", "production_runtime": "ABSENT"}
    if not isinstance(lifecycle, dict) or any(lifecycle.get(key) != expected for key, expected in expected_lifecycle.items()):
        issues.append("standard evidence lifecycle boundary differs")
    return tuple(sorted(set(issues)))


def retain_evidence(
    allocation: Mapping[str, str],
    source_revision: str,
    build: Mapping[str, Any],
    observed: Mapping[str, Any],
    started_at: str,
    finished_at: str,
    retained_root: Path,
) -> Dict[str, Any]:
    proof_id = allocation["proof_id"]
    run_id = allocation["run_id"]
    evidence_id = allocation["evidence_id"]
    contract = proof_contracts_by_id()[proof_id]
    destination = retained_root / run_id
    if destination.exists():
        raise ValueError("append-only W4 evidence destination already exists: " + str(destination))
    retained_root.mkdir(parents=True, exist_ok=True)
    temporary = Path(tempfile.mkdtemp(prefix=run_id + ".", dir=str(retained_root)))
    try:
        artifact_root = temporary / "artifacts"
        artifact_root.mkdir()
        raw_artifacts = []
        used = set()
        for kind, payload in observed.get("artifacts", {}).items():
            stem = _safe(str(kind))
            if stem in used:
                raise ValueError("W4 observation artifact names collide after normalization: " + stem)
            used.add(stem)
            path = artifact_root / (stem + ".json")
            path.write_bytes(canonical_bytes(payload))
            raw_artifacts.append({"kind": kind, "path": path.relative_to(temporary).as_posix(), "sha256": sha256_file(path), "bytes": path.stat().st_size})
        for row in observed.get("extra_files", []):
            source = Path(str(row.get("path", "")))
            if not source.is_file():
                continue
            stem = _safe(str(row.get("kind", source.stem)))
            suffix = source.suffix.lower() or ".bin"
            path = artifact_root / (stem + suffix)
            shutil.copy2(source, path)
            raw_artifacts.append({"kind": row.get("kind", stem), "path": path.relative_to(temporary).as_posix(), "sha256": sha256_file(path), "bytes": path.stat().st_size})
        readiness_admission = load_json(READINESS_ADMISSION_PATH)
        admission_sha = hashlib.sha256(canonical_bytes(readiness_admission)).hexdigest()
        role = str(contract["requirements"]["runtime_roles"][0])
        standard: Dict[str, Any] = {
            "schema_version": "prd07-w4-standard-evidence-pack-v1",
            "run_id": run_id,
            "evidence_id": evidence_id,
            "proof_id": proof_id,
            "source_revision": source_revision,
            "admission_boundary_sha256": admission_sha,
            "fixture_identities": fixture_identity(contract["requirements"]["fixture_identities"]),
            "dependency_identity": load_reference(),
            "environment_identity": environment_identity(build, role),
            "observation": {
                "state": observed["outcome"],
                "started_at": started_at,
                "finished_at": finished_at,
                "raw_artifacts": raw_artifacts,
                "measurements": observed["measurements"],
                "repetitions": observed["repetitions"],
                "fcc13e_rows": observed.get("fcc13e_rows", []),
            },
            "evaluation": {
                "canonical_success_criterion": contract["success_criterion"],
                "canonical_failure_criterion": contract["failure_criterion"],
                "canonical_inconclusive_conditions": contract["inconclusive_conditions"],
                "actual_disposition": observed["outcome"],
                "reason": observed["reason"],
                "blockers": observed.get("blockers", []),
                "limitations": observed.get("limitations", []),
            },
            "lifecycle": {
                "allocated_before_execution": True,
                "identity_retained": True,
                "registry_reconciled": True,
                "prd07_evidence_eligible": True,
                "prd08_submission": "NOT-SUBMITTED",
                "gameplay_permission": "CLOSED",
                "production_runtime": "ABSENT",
            },
        }
        standard["environment_identity"]["execution_admission_sha256"] = sha256_file(EXECUTION_ADMISSION_PATH)
        if "human_judgement" in observed:
            standard["human_judgement"] = observed["human_judgement"]
        issues = evidence_issues(standard)
        if issues:
            raise ValueError("W4 standard evidence failed validation: " + "; ".join(issues))
        standard_path = temporary / "standard-evidence.json"
        standard_path.write_bytes(canonical_bytes(standard))
        run_record = {
            "schema_version": "prd07-portable-run-record-v1",
            "package": EXECUTION_PACKAGE,
            "run_id": run_id,
            "proof_id": proof_id,
            "outcome": observed["outcome"],
            "execution_kind": "ACTUAL",
            "evidence_id": evidence_id,
            "evidence_sha256": sha256_file(standard_path),
            "evidence_artifacts": raw_artifacts,
            "build_identity": build["build_identity"],
            "artifact_sha256": build["artifact_sha256"],
            "artifact_size_bytes": build["artifact_size_bytes"],
            "source_revision": source_revision,
            "prd07_evidence_eligible": True,
            "prd08_submission": "NOT-SUBMITTED",
            "gameplay_permission": "CLOSED",
            "production_runtime": "ABSENT",
        }
        (temporary / "run.json").write_bytes(canonical_bytes(run_record))
        (temporary / "build-manifest.json").write_bytes(canonical_bytes(build))
        (temporary / "artifact-manifest.json").write_bytes(canonical_bytes({"artifact_path": "ignored-local-proof-build", "artifact_sha256": build["artifact_sha256"], "artifact_size_bytes": build["artifact_size_bytes"], "build_identity": build["build_identity"], "reproducer": "python -m tools.r7_w4_execution execute --actual-execution-authorized ..."}))
        (temporary / "observed-result.json").write_bytes(canonical_bytes(observed))
        (temporary / "summary.md").write_text(
            "# {0} — {1}\n\nObserved outcome: **{2}**\n\nEvidence: `{3}`. {4}\n\nThis result is retained as PRD-07 evidence only. It does not submit to PRD-08, open W5/R8, grant gameplay permission or activate a production runtime.\n".format(run_id, proof_id, observed["outcome"], evidence_id, observed["reason"]),
            encoding="utf-8",
        )
        os.replace(str(temporary), str(destination))
        return {"portable_path": destination.relative_to(ROOT).as_posix(), "standard_evidence_sha256": sha256_file(destination / "standard-evidence.json"), "run_record": run_record}
    finally:
        if temporary.exists():
            shutil.rmtree(temporary)
