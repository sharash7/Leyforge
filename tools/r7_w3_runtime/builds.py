"""Clean W3 fluid/vessel fixture export and exact external-process probes."""

from __future__ import annotations

import hashlib
import json
import platform
import re
import shutil
import tempfile
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Mapping, Optional, Sequence

from proofs.r7.w3.runtime.runner import PROOF_IDS
from tools.proof_harness.build import BuildController, CleanExportPlan
from tools.proof_harness.manifests import ArtifactManifest, BuildManifest, sha256_file
from tools.proof_harness.process import ProcessController, SmokeLane
from tools.proof_harness.state import ProofExecution

from .dependencies import ROOT, execution_components, iter_staged_voxel_files, load_lock, verify_local_dependencies


PROBE_SOURCE = ROOT / "proofs/r7/w3/server_probe"
W3_SOURCE = ROOT / "proofs/r7/w3"
PREVIOUS_PINNED_ENGINE_VALIDATION_PATH = ROOT / "docs/rebuild/r7/w3-pinned-engine-validation.json"
PINNED_ENGINE_VALIDATION_PATH = ROOT / "docs/rebuild/r7/w3-pinned-engine-validation-fixture-launch-repaired.json"
FIXTURE_LAUNCH_VALIDATION_PATH = ROOT / "docs/rebuild/r7/w3-fixture-launch-integration.json"
REQUIRED_CAPABILITIES = {
    "stable-vessel-semantic-id",
    "vessel-local-frame",
    "world-vessel-frame-conversion",
    "owner-region-epochs",
    "editable-local-hull",
    "revisioned-derived-properties",
    "bounded-local-fluid",
    "explicit-ocean-reservoir",
    "breach-repair-pump",
    "contained-water-mass",
    "buoyancy-diagnostic",
    "controlled-motion",
    "board-disembark",
    "physics-shape-collision-corpus",
    "stale-result-quarantine",
}


class EnvironmentProcessController(ProcessController):
    def __init__(self, environment: Mapping[str, str]) -> None:
        self.environment = {str(key): str(value) for key, value in environment.items()}

    def run(
        self,
        argv: Sequence[str],
        timeout_seconds: float,
        cwd: Optional[Path] = None,
        environment: Optional[Mapping[str, str]] = None,
    ):
        merged = dict(self.environment)
        if environment:
            merged.update({str(key): str(value) for key, value in environment.items()})
        return super().run(argv, timeout_seconds=timeout_seconds, cwd=cwd, environment=merged)


class ValidationTemporaryDirectory(tempfile.TemporaryDirectory):
    """Best-effort cleanup; a still-closing Godot log may remain only below ignored .local."""

    def cleanup(self) -> None:
        try:
            super().cleanup()
        except OSError:
            self._finalizer.detach()


@dataclass(frozen=True)
class ExportedBuild:
    build: BuildManifest
    artifact: ArtifactManifest
    export_result: Dict[str, Any]
    smoke_result: Dict[str, Any]
    self_report: Dict[str, Any]
    role_content_manifest: Dict[str, Any]
    workspace: Path
    output_root: Path

    def to_dict(self) -> Dict[str, Any]:
        return {
            "build_manifest": dict(self.build.to_dict(), build_identity=self.build.build_identity),
            "artifact_manifest": self.artifact.to_dict(),
            "export_result": self.export_result,
            "smoke_result": self.smoke_result,
            "runtime_self_report": self.self_report,
            "role_content_manifest": self.role_content_manifest,
            "workspace": str(self.workspace.resolve()),
            "output_root": str(self.output_root.resolve()),
        }


def _tree_identity(root: Path) -> str:
    digest = hashlib.sha256()
    for path in sorted(item for item in root.rglob("*") if item.is_file() and "__pycache__" not in item.parts):
        digest.update(path.relative_to(root).as_posix().encode("utf-8"))
        digest.update(b"\0")
        digest.update(path.read_bytes())
        digest.update(b"\0")
    return digest.hexdigest()


def _write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True, ensure_ascii=True) + "\n", encoding="utf-8")


def _process_summary(result: Any) -> Dict[str, Any]:
    return {
        "exit_code": result.exit_code,
        "timed_out": result.timed_out,
        "terminated_externally": result.terminated_externally,
        "stdout_sha256": hashlib.sha256(result.stdout.encode("utf-8")).hexdigest(),
        "stderr_sha256": hashlib.sha256(result.stderr.encode("utf-8")).hexdigest(),
        "stdout_line_count": len(result.stdout.splitlines()),
        "stderr_line_count": len(result.stderr.splitlines()),
    }


def _governed_execution_snapshot() -> Dict[str, Any]:
    """Capture allocation authority without changing or normalising it."""
    from .execution_plan import inspect_execution_registry

    state_path = ROOT / "docs/rebuild/r7/w3-execution-state.json"
    state_bytes = state_path.read_bytes() if state_path.is_file() else b""
    return {
        "state_path": state_path.relative_to(ROOT).as_posix(),
        "state_present": state_path.is_file(),
        "state_bytes": len(state_bytes),
        "state_sha256": hashlib.sha256(state_bytes).hexdigest() if state_bytes else None,
        "registry": inspect_execution_registry(ROOT).to_dict(),
    }


def _parse_prefixed_json(stdout: str, prefix: str) -> Dict[str, Any]:
    matches = [line[len(prefix):] for line in stdout.splitlines() if line.startswith(prefix)]
    if len(matches) != 1:
        raise ValueError(f"expected exactly one {prefix.strip()} line; found {len(matches)}")
    value = json.loads(matches[0])
    if not isinstance(value, dict):
        raise ValueError("runtime report is not an object")
    return value


def _stage_probe(source: Path, workspace: Path, lock: Mapping[str, Any]) -> None:
    if not (source / "project.godot").is_file() or not (source / "main.tscn").is_file() or not (source / "src/main.gd").is_file():
        raise ValueError("W3 pinned-engine validation source is incomplete")
    shutil.copytree(source, workspace)
    for dependency_source, destination in iter_staged_voxel_files(dict(lock)):
        target = workspace / destination
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(dependency_source, target)


def _validation_build_identity(source_revision: str, source: Path, lock: Mapping[str, Any]) -> str:
    components = lock["components"]
    value = {
        "schema_version": "prd07-w3-pinned-engine-validation-build-v1",
        "source_revision": source_revision,
        "probe_tree_sha256": _tree_identity(source),
        "godot_build_driver_sha256": components["godot_build_driver"]["sha256"],
        "godot_export_template_sha256": components["godot_export_template"]["runtime_sha256"],
        "voxel_tools_package_sha256": components["voxel_tools"]["package_sha256"],
    }
    return hashlib.sha256(json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")).hexdigest()


def validation_source_identity(source: Path = PROBE_SOURCE) -> Dict[str, Any]:
    source = source.resolve()
    main_path = source / "src/main.gd"
    return {
        "probe_tree_sha256": _tree_identity(source) if source.is_dir() else "",
        "main_gd_sha256": sha256_file(main_path) if main_path.is_file() else "",
        "main_gd_bytes": main_path.stat().st_size if main_path.is_file() else 0,
    }


def pinned_engine_validation_issues(value: Mapping[str, Any], source_revision: str) -> tuple[str, ...]:
    lock = load_lock()
    components = lock["components"]
    expected_dependencies = {
        "godot_build_driver_revision": components["godot_build_driver"]["revision"],
        "godot_build_driver_sha256": components["godot_build_driver"]["sha256"],
        "godot_export_template_revision": components["godot_export_template"]["revision"],
        "godot_export_template_sha256": components["godot_export_template"]["runtime_sha256"],
        "voxel_tools_revision": components["voxel_tools"]["revision"],
        "voxel_tools_package_sha256": components["voxel_tools"]["package_sha256"],
        "local_patch_status": lock["local_patch_status"],
    }
    issues = []
    if value.get("schema_version") != "prd07-w3-pinned-engine-validation-v1":
        issues.append("pinned-engine validation schema is missing or unsupported")
    if value.get("status") != "PASS":
        issues.append("pinned-engine validation does not pass")
    if value.get("implementation_commit") != source_revision:
        issues.append("pinned-engine validation names a different implementation commit")
    if value.get("source_identity") != validation_source_identity():
        issues.append("pinned-engine validation source identity is stale")
    if value.get("dependency_identity") != expected_dependencies:
        issues.append("pinned-engine validation dependency identity differs")
    checks = value.get("checks", {})
    if not isinstance(checks, dict):
        issues.append("pinned-engine validation checks are missing")
    else:
        for key in (
            "source_hash_identity_valid",
            "pinned_engine_identity_valid",
            "script_parse_load_valid",
            "controlled_entrypoint_reached",
            "export_prerequisites_valid",
            "export_completed",
            "exported_runtime_validation_valid",
        ):
            if checks.get(key) is not True:
                issues.append(f"pinned-engine validation check did not pass: {key}")
        if checks.get("proof_execution_started") is not False:
            issues.append("pinned-engine validation entered proof execution")
    if value.get("proof_execution") != "NOT-STARTED":
        issues.append("pinned-engine validation claims proof execution")
    if value.get("allocated_run_ids") != [] or value.get("allocated_evidence_ids") != []:
        issues.append("pinned-engine validation allocated PRD-07 identities")
    if value.get("gameplay_permission") != "CLOSED" or value.get("production_runtime") != "ABSENT":
        issues.append("pinned-engine validation crossed the rebuild boundary")
    return tuple(sorted(set(issues)))


def pinned_engine_validation_report(
    source_revision: str,
    *,
    probe_source: Path = PROBE_SOURCE,
    perform_export: bool = True,
) -> Dict[str, Any]:
    """Exercise the exact probe with the pinned engine; no proof or PRD identity is created."""
    lock = load_lock()
    local = verify_local_dependencies(lock)
    components = lock.get("components", {})
    source = probe_source.resolve()
    main_path = source / "src/main.gd"
    issues = list(local.get("issues", []))
    checks = {
        "source_hash_identity_valid": main_path.is_file(),
        "pinned_engine_identity_valid": local.get("status") == "PASS",
        "script_parse_load_valid": False,
        "controlled_entrypoint_reached": False,
        "export_prerequisites_valid": local.get("status") == "PASS",
        "export_completed": False,
        "exported_runtime_validation_valid": False,
        "proof_execution_started": False,
    }
    if not main_path.is_file():
        issues.append("W3 pinned-engine validation main script is missing")
    source_identity = validation_source_identity(source)
    dependency_identity = {
        "godot_build_driver_revision": components.get("godot_build_driver", {}).get("revision", ""),
        "godot_build_driver_sha256": components.get("godot_build_driver", {}).get("sha256", ""),
        "godot_export_template_revision": components.get("godot_export_template", {}).get("revision", ""),
        "godot_export_template_sha256": components.get("godot_export_template", {}).get("runtime_sha256", ""),
        "voxel_tools_revision": components.get("voxel_tools", {}).get("revision", ""),
        "voxel_tools_package_sha256": components.get("voxel_tools", {}).get("package_sha256", ""),
        "local_patch_status": lock.get("local_patch_status", ""),
    }
    report: Dict[str, Any] = {
        "schema_version": "prd07-w3-pinned-engine-validation-v1",
        "status": "FAIL",
        "implementation_commit": source_revision,
        "source_identity": source_identity,
        "dependency_identity": dependency_identity,
        "checks": checks,
        "source_process": None,
        "export_process": None,
        "export_artifact": None,
        "exported_runtime_process": None,
        "source_runtime_report": None,
        "exported_runtime_report": None,
        "runtime_report": None,
        "issues": [],
        "proof_execution": "NOT-STARTED",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "gameplay_permission": "CLOSED",
        "prd08_evaluation": "CLOSED",
        "production_runtime": "ABSENT",
    }
    if issues:
        report["issues"] = sorted(set(issues))
        return report

    validation_parent = ROOT / ".local" / "r7-w3-pinned-engine-validation"
    validation_parent.mkdir(parents=True, exist_ok=True)
    with ValidationTemporaryDirectory(prefix="validation-", dir=str(validation_parent)) as raw:
        validation_root = Path(raw)
        workspace = validation_root / "project"
        output_root = validation_root / "output"
        profile = validation_root / "profile"
        _stage_probe(source, workspace, lock)
        build_identity = _validation_build_identity(source_revision, source, lock)
        _write_json(workspace / "build_manifest.json", {
            "schema_version": "prd07-w3-pinned-engine-validation-build-v1",
            "role": "validation",
            "build_identity": build_identity,
            "source_revision": source_revision,
            "proof_execution": "NOT-STARTED",
            "gameplay_permission": "CLOSED",
        })
        controller = EnvironmentProcessController({
            "APPDATA": str((profile / "appdata").resolve()),
            "LOCALAPPDATA": str((profile / "localappdata").resolve()),
        })
        driver = Path(local["paths"]["godot_driver"])
        source_argv = [
            str(driver), "--headless", "--path", str(workspace.resolve()), "--quit-after", "120",
            "--", "--mode", "validate",
        ]
        source_result = controller.run(source_argv, timeout_seconds=90.0, cwd=workspace)
        report["source_process"] = _process_summary(source_result)
        source_runtime: Dict[str, Any] = {}
        try:
            source_runtime = _parse_prefixed_json(source_result.stdout, "LEYFORGE_W3_VALIDATION_REPORT ")
        except (ValueError, json.JSONDecodeError) as exc:
            issues.append(f"pinned engine did not reach the W3 validation entrypoint: {exc}")
        source_valid = bool(
            source_result.exit_code == 0
            and not source_result.timed_out
            and source_runtime.get("script_parse_load_valid") is True
            and source_runtime.get("controlled_entrypoint_reached") is True
            and source_runtime.get("proof_execution_started") is False
            and source_runtime.get("build_identity") == build_identity
            and source_runtime.get("physics_query_api") == "PhysicsDirectSpaceState3D.collide_shape"
        )
        checks["script_parse_load_valid"] = source_valid
        checks["controlled_entrypoint_reached"] = source_valid
        report["source_runtime_report"] = source_runtime or None
        report["runtime_report"] = source_runtime or None
        if not source_valid:
            issues.append("pinned engine source parse/load validation failed")

        if perform_export and source_valid:
            template = Path(local["paths"]["godot_template_runtime"])
            (workspace / "export_presets.cfg").write_text(_export_preset("client", template), encoding="utf-8")
            output_root.mkdir(parents=True)
            artifact_path = output_root / "leyforge-w3-validation.exe"
            export_argv = [
                str(driver), "--headless", "--path", str(workspace.resolve()),
                "--export-release", "W3 Client Probe", str(artifact_path.resolve()),
            ]
            export_result = controller.run(export_argv, timeout_seconds=180.0, cwd=output_root)
            report["export_process"] = _process_summary(export_result)
            export_valid = bool(
                export_result.exit_code == 0
                and not export_result.timed_out
                and artifact_path.is_file()
                and artifact_path.stat().st_size > 0
            )
            checks["export_completed"] = export_valid
            if export_valid:
                report["export_artifact"] = {
                    "bytes": artifact_path.stat().st_size,
                    "sha256": sha256_file(artifact_path),
                }
                runtime_argv = [str(artifact_path), "--headless", "--quit-after", "120", "--", "--mode", "validate"]
                runtime_result = controller.run(runtime_argv, timeout_seconds=90.0, cwd=output_root)
                report["exported_runtime_process"] = _process_summary(runtime_result)
                exported_runtime: Dict[str, Any] = {}
                try:
                    exported_runtime = _parse_prefixed_json(runtime_result.stdout, "LEYFORGE_W3_VALIDATION_REPORT ")
                except (ValueError, json.JSONDecodeError) as exc:
                    issues.append(f"exported W3 validation entrypoint was not reached: {exc}")
                runtime_valid = bool(
                    runtime_result.exit_code == 0
                    and not runtime_result.timed_out
                    and exported_runtime.get("status") == "PASS"
                    and exported_runtime.get("script_parse_load_valid") is True
                    and exported_runtime.get("controlled_entrypoint_reached") is True
                    and exported_runtime.get("proof_execution_started") is False
                    and exported_runtime.get("build_identity") == build_identity
                    and exported_runtime.get("physics_query_api") == "PhysicsDirectSpaceState3D.collide_shape"
                    and exported_runtime.get("provider_ready") is True
                    and int(exported_runtime.get("provider_errors", 1)) == 0
                )
                checks["exported_runtime_validation_valid"] = runtime_valid
                report["exported_runtime_report"] = exported_runtime or None
                report["runtime_report"] = exported_runtime or source_runtime or None
                if not runtime_valid:
                    issues.append("exported W3 pinned-runtime validation failed")
            else:
                issues.append("pinned-engine W3 validation export failed")
        elif not perform_export:
            checks["export_completed"] = False
            checks["exported_runtime_validation_valid"] = False

    required_checks = (
        "source_hash_identity_valid",
        "pinned_engine_identity_valid",
        "script_parse_load_valid",
        "controlled_entrypoint_reached",
        "export_prerequisites_valid",
    )
    if perform_export:
        required_checks += ("export_completed", "exported_runtime_validation_valid")
    if checks["proof_execution_started"]:
        issues.append("pinned-engine validation entered proof execution")
    report["issues"] = sorted(set(issues))
    report["status"] = "PASS" if all(checks[key] for key in required_checks) and not issues else "FAIL"
    return report


def write_pinned_engine_validation(source_revision: str) -> Dict[str, Any]:
    value = pinned_engine_validation_report(source_revision, perform_export=True)
    _write_json(PINNED_ENGINE_VALIDATION_PATH, value)
    return value


def _export_preset(role: str, template_path: Path) -> str:
    name = "W3 Client Probe" if role == "client" else "W3 Dedicated Probe"
    dedicated = "false" if role == "client" else "true"
    feature = "client" if role == "client" else "dedicated"
    return f'''[preset.0]
name="{name}"
platform="Windows Desktop"
runnable=true
dedicated_server={dedicated}
custom_features="r7_w3_proof,{feature}"
export_filter="all_resources"
include_filter=""
exclude_filter=""
export_path=""
encryption_include_filters=""
encryption_exclude_filters=""
encrypt_pck=false
encrypt_directory=false
script_export_mode=2

[preset.0.options]
custom_template/debug=""
custom_template/release="{template_path.resolve().as_posix()}"
debug/export_console_wrapper=1
binary_format/embed_pck=true
texture_format/s3tc_bptc=true
texture_format/etc2_astc=false
'''


def _export_artifact(
    source_revision: str,
    role: str,
    run_root: Path,
    *,
    verified_local: Optional[Mapping[str, Any]] = None,
) -> ExportedBuild:
    """Build one real proof fixture export without entering proof execution."""
    if role not in {"client", "headless"}:
        raise ValueError("unsupported W3 export role")
    lock = load_lock()
    local = dict(verified_local) if verified_local is not None else verify_local_dependencies(lock)
    if local["status"] != "PASS":
        raise ValueError("local dependencies are not execution ready: " + "; ".join(local["issues"]))
    allowed = (ROOT / ".local").resolve()
    build_root = run_root.resolve() / "builds" / role
    try:
        build_root.relative_to(allowed)
    except ValueError as exc:
        raise ValueError("W3 run root must remain under repository .local") from exc
    if build_root.exists():
        raise ValueError(f"clean W3 build root already exists: {build_root}")
    workspace = build_root / "project"
    output_root = build_root / "output"
    shutil.copytree(PROBE_SOURCE, workspace)
    for source, destination in iter_staged_voxel_files(lock):
        target = workspace / destination
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
    driver = Path(local["paths"]["godot_driver"])
    template = Path(local["paths"]["godot_template_runtime"])
    preset = "W3 Client Probe" if role == "client" else "W3 Dedicated Probe"
    artifact_path = output_root / f"leyforge-w3-{role}-probe.exe"
    invocation = (str(driver), "--headless", "--path", str(workspace.resolve()), "--export-release", preset, str(artifact_path.resolve()))
    environment = {
        "os": platform.system(),
        "os_release": platform.release(),
        "machine": platform.machine(),
        "python": platform.python_version(),
        "role": role,
        "godot_build_driver_sha256": lock["components"]["godot_build_driver"]["sha256"],
        "godot_export_template_sha256": lock["components"]["godot_export_template"]["runtime_sha256"],
        "voxel_tools_package_sha256": lock["components"]["voxel_tools"]["package_sha256"],
        "local_patch_status": lock["local_patch_status"],
    }
    build = BuildManifest(
        source_revision=source_revision,
        role=role,
        profile="release-like-w3-fluid-vessel-proof",
        precision="integer-fluid-units-with-explicit-hull-fluid-derived-revisions",
        platform="windows-x86_64",
        content_identity=_tree_identity(W3_SOURCE),
        schema_identity="leyforge-r7-w3-fluid-vessel-runtime-v1",
        clean_export=True,
        invocation=invocation,
        components=execution_components(lock),
        environment=environment,
    )
    issues = build.issues(for_execution=True)
    if issues:
        raise ValueError("W3 build manifest is invalid: " + "; ".join(issues))
    _write_json(workspace / "build_manifest.json", dict(build.to_dict(), build_identity=build.build_identity))
    (workspace / "export_presets.cfg").write_text(_export_preset(role, template), encoding="utf-8")
    profile = build_root / "profile"
    controller = EnvironmentProcessController({
        "APPDATA": str((profile / "appdata").resolve()),
        "LOCALAPPDATA": str((profile / "localappdata").resolve()),
    })
    export_result = BuildController(controller).execute(
        CleanExportPlan(build=build, output_root=output_root, argv=invocation), timeout_seconds=180.0
    )
    if export_result.process.exit_code != 0 or export_result.process.timed_out or not artifact_path.is_file():
        raise RuntimeError("W3 Godot export failed: " + json.dumps(export_result.to_dict(), ensure_ascii=True))
    artifact = ArtifactManifest.from_path(
        artifact_path,
        build,
        artifact_kind="leyforge-export",
        exported_runtime=True,
        synthetic_fixture=False,
        runtime_self_report_build_identity=build.build_identity,
    )
    files = [
        {"path": path.relative_to(output_root).as_posix(), "bytes": path.stat().st_size, "sha256": sha256_file(path)}
        for path in sorted(output_root.rglob("*")) if path.is_file()
    ]
    content = {
        "schema_version": "prd07-w3-role-content-manifest-v1",
        "role": role,
        "build_identity": build.build_identity,
        "files": files,
        "presentation_authority_included": False,
        "provider_runtime_included": any(item["path"].endswith("libvoxel.windows.template_release.x86_64.dll") for item in files),
    }
    return ExportedBuild(build, artifact, export_result.to_dict(), {}, {}, content, workspace, output_root)


def _artifact_launch_argv(exported: ExportedBuild, arguments: Sequence[str]) -> tuple[str, ...]:
    """Resolve every exported W3 launch through the authoritative manifest field."""
    artifact_path = Path(exported.artifact.artifact_path)
    argv = [str(artifact_path.resolve())]
    if exported.build.role == "headless":
        argv.append("--headless")
    argv.append("--")
    argv.extend(str(value) for value in arguments)
    return tuple(argv)


def export_one(source_revision: str, role: str, run_root: Path, execution: ProofExecution) -> ExportedBuild:
    exported = _export_artifact(source_revision, role, run_root)
    profile = exported.output_root.parent / "profile"
    controller = EnvironmentProcessController({
        "APPDATA": str((profile / "appdata").resolve()),
        "LOCALAPPDATA": str((profile / "localappdata").resolve()),
    })
    argv = _artifact_launch_argv(exported, ("--mode", "smoke"))
    lane = SmokeLane(
        lane_id=f"W3-{role.upper()}-EXPORT-SMOKE",
        proof_id=execution.proof_id,
        role=role,
        build=exported.build,
        artifact=exported.artifact,
        argv=argv,
    )
    smoke = lane.execute(controller, timeout_seconds=60.0, proof_execution=execution)
    report = _parse_prefixed_json(smoke.process.stdout, "LEYFORGE_W3_SELF_REPORT ")
    capabilities = set(report.get("fixture_capabilities", []))
    if (
        report.get("status") != "PASS"
        or report.get("build_identity") != exported.build.build_identity
        or report.get("role") != role
        or not REQUIRED_CAPABILITIES.issubset(capabilities)
        or not smoke.evidence_eligible
    ):
        raise RuntimeError("W3 runtime self-report did not match its build and fixture contract")
    return ExportedBuild(
        exported.build,
        exported.artifact,
        exported.export_result,
        smoke.to_dict(),
        report,
        exported.role_content_manifest,
        exported.workspace,
        exported.output_root,
    )


def run_fixture_probe(exported: ExportedBuild, execution: ProofExecution, iterations: int = 512) -> Dict[str, Any]:
    profile = exported.output_root.parent / "runtime-profile" / str(execution.run_id)
    controller = EnvironmentProcessController({
        "APPDATA": str((profile / "appdata").resolve()),
        "LOCALAPPDATA": str((profile / "localappdata").resolve()),
    })
    argv = _artifact_launch_argv(exported, [
        "--mode", "fixture", "--proof-id", execution.proof_id,
        "--run-id", str(execution.run_id), "--iterations", str(iterations),
    ])
    lane = SmokeLane(
        lane_id=f"{execution.proof_id}-W3-FLUID-VESSEL-FIXTURE",
        proof_id=execution.proof_id,
        role=exported.build.role,
        build=exported.build,
        artifact=exported.artifact,
        argv=argv,
    )
    result = lane.execute(controller, timeout_seconds=120.0, proof_execution=execution)
    report = _parse_prefixed_json(result.process.stdout, "LEYFORGE_W3_FIXTURE_REPORT ")
    if report.get("proof_id") != execution.proof_id or report.get("run_id") != execution.run_id:
        raise RuntimeError("W3 fixture report execution identity differs")
    if report.get("build_identity") != exported.build.build_identity:
        raise RuntimeError("W3 fixture report build identity differs")
    report["external_process"] = True
    report["process"] = result.to_dict()
    return report


def fixture_launch_validation_issues(value: Mapping[str, Any], source_revision: str) -> tuple[str, ...]:
    """Validate a retained certification-only build/launch receipt fail-closed."""
    lock = load_lock()
    expected_dependencies = {
        "godot_build_driver_revision": lock.get("components", {}).get("godot_build_driver", {}).get("revision", ""),
        "godot_export_template_revision": lock.get("components", {}).get("godot_export_template", {}).get("revision", ""),
        "voxel_tools_revision": lock.get("components", {}).get("voxel_tools", {}).get("revision", ""),
        "local_patch_status": lock.get("local_patch_status", ""),
    }
    issues = []
    if value.get("schema_version") != "prd07-w3-fixture-launch-integration-v1":
        issues.append("fixture-launch integration schema is missing or unsupported")
    if value.get("status") != "PASS":
        issues.append("fixture-launch integration does not pass")
    if value.get("implementation_commit") != source_revision:
        issues.append("fixture-launch integration names a different implementation commit")
    if value.get("source_identity") != validation_source_identity():
        issues.append("fixture-launch integration source identity is stale")
    if value.get("dependency_identity") != expected_dependencies:
        issues.append("fixture-launch integration dependency identity differs")
    checks = value.get("checks", {})
    required_checks = (
        "pinned_dependencies_valid",
        "client_export_completed",
        "headless_export_completed",
        "authoritative_manifest_contract_valid",
        "client_artifact_launch_valid",
        "headless_artifact_launch_valid",
        "client_runtime_self_report_valid",
        "headless_runtime_self_report_valid",
        "build_identity_round_trip_valid",
        "execution_state_unchanged",
        "registry_unchanged",
        "proof_execution_started",
        "identity_allocation_started",
        "production_runtime_present",
    )
    if not isinstance(checks, dict):
        issues.append("fixture-launch integration checks are missing")
    else:
        for key in required_checks[:11]:
            if checks.get(key) is not True:
                issues.append(f"fixture-launch integration check did not pass: {key}")
        for key in required_checks[11:]:
            if checks.get(key) is not False:
                issues.append(f"fixture-launch integration crossed a forbidden boundary: {key}")
    roles = value.get("roles", {})
    if not isinstance(roles, dict) or set(roles) != {"client", "headless"}:
        issues.append("fixture-launch integration lacks the exact client/headless role set")
    else:
        for role in ("client", "headless"):
            row = roles.get(role, {})
            artifact = row.get("artifact_manifest", {}) if isinstance(row, dict) else {}
            report = row.get("runtime_self_report", {}) if isinstance(row, dict) else {}
            if (
                not isinstance(row, dict)
                or row.get("role") != role
                or re.fullmatch(r"[0-9a-f]{64}", str(row.get("build_identity", ""))) is None
                or not isinstance(artifact, dict)
                or artifact.get("manifest_schema") != "prd07-artifact-manifest-v1"
                or artifact.get("authoritative_path_field") != "artifact_path"
                or artifact.get("path_resolved_during_validation") is not True
                or artifact.get("manifest_contract_valid") is not True
                or artifact.get("build_identity_round_trip_valid") is not True
                or artifact.get("build_identity") != row.get("build_identity")
                or re.fullmatch(r"[0-9a-f]{64}", str(artifact.get("artifact_sha256", ""))) is None
                or int(artifact.get("size_bytes", 0)) <= 0
                or artifact.get("exported_runtime") is not True
                or artifact.get("synthetic_fixture") is not False
                or not isinstance(report, dict)
                or report.get("status") != "PASS"
                or report.get("role") != role
                or report.get("build_identity") != row.get("build_identity")
                or report.get("proof_execution_started") is not False
                or report.get("production_runtime") is not False
                or report.get("stable_proof_ids") != list(PROOF_IDS)
                or report.get("provider_ready") is not True
                or int(report.get("provider_errors", 1)) != 0
                or int(report.get("frame_round_trip_errors", 1)) != 0
                or int(report.get("contact_errors", 1)) != 0
                or not REQUIRED_CAPABILITIES.issubset(set(report.get("fixture_capabilities", [])))
            ):
                issues.append(f"fixture-launch integration role contract differs: {role}")
    if value.get("proof_execution") != "NOT-STARTED" or value.get("allocated_run_ids") != [] or value.get("allocated_evidence_ids") != []:
        issues.append("fixture-launch integration claims proof execution or allocation")
    if value.get("gameplay_permission") != "CLOSED" or value.get("production_runtime") != "ABSENT":
        issues.append("fixture-launch integration crossed the rebuild boundary")
    if "before_execution_authority" in value or "after_execution_authority" in value:
        before = value.get("before_execution_authority")
        after = value.get("after_execution_authority")
        if not isinstance(before, dict) or before != after:
            issues.append("fixture-launch integration changed execution authority")
    return tuple(sorted(set(issues)))


def fixture_launch_validation_report(
    source_revision: str,
    *,
    validation_parent: Optional[Path] = None,
) -> Dict[str, Any]:
    """Build and launch both real artifacts without allocating or observing a proof."""
    lock = load_lock()
    local = verify_local_dependencies(lock)
    before = _governed_execution_snapshot()
    checks = {
        "pinned_dependencies_valid": local.get("status") == "PASS",
        "client_export_completed": False,
        "headless_export_completed": False,
        "authoritative_manifest_contract_valid": False,
        "client_artifact_launch_valid": False,
        "headless_artifact_launch_valid": False,
        "client_runtime_self_report_valid": False,
        "headless_runtime_self_report_valid": False,
        "build_identity_round_trip_valid": False,
        "execution_state_unchanged": False,
        "registry_unchanged": False,
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "production_runtime_present": False,
    }
    report: Dict[str, Any] = {
        "schema_version": "prd07-w3-fixture-launch-integration-v1",
        "status": "FAIL",
        "package": "R7-W3-FIXTURE-LAUNCH-REPAIR-AND-RECERTIFICATION",
        "implementation_commit": source_revision,
        "source_identity": validation_source_identity(),
        "dependency_identity": {
            "godot_build_driver_revision": lock.get("components", {}).get("godot_build_driver", {}).get("revision", ""),
            "godot_export_template_revision": lock.get("components", {}).get("godot_export_template", {}).get("revision", ""),
            "voxel_tools_revision": lock.get("components", {}).get("voxel_tools", {}).get("revision", ""),
            "local_patch_status": lock.get("local_patch_status", ""),
        },
        "checks": checks,
        "roles": {},
        "before_execution_authority": before,
        "after_execution_authority": None,
        "issues": list(local.get("issues", [])),
        "proof_execution": "NOT-STARTED",
        "allocated_run_ids": [],
        "allocated_evidence_ids": [],
        "gameplay_permission": "CLOSED",
        "prd08_evaluation": "CLOSED",
        "production_runtime": "ABSENT",
    }
    issues = list(local.get("issues", []))
    validation_parent = validation_parent or ROOT / ".local" / "r7-w3-fixture-launch-validation"
    validation_parent.mkdir(parents=True, exist_ok=True)
    if not issues:
        with ValidationTemporaryDirectory(prefix="integration-", dir=str(validation_parent)) as raw:
            run_root = Path(raw) / "run"
            for role in ("client", "headless"):
                try:
                    exported = _export_artifact(source_revision, role, run_root, verified_local=local)
                    checks[f"{role}_export_completed"] = True
                    argv = _artifact_launch_argv(exported, ("--mode", "smoke"))
                    manifest_path = Path(exported.artifact.artifact_path).resolve()
                    path_valid = Path(argv[0]).resolve() == manifest_path and manifest_path.is_file()
                    role_flag_valid = (role == "headless") == ("--headless" in argv)
                    integrity_valid = not exported.artifact.integrity_issues(exported.build)
                    round_trip_valid = BuildManifest.from_dict(exported.build.to_dict()).build_identity == exported.build.build_identity
                    profile = exported.output_root.parent / "fixture-launch-profile"
                    controller = EnvironmentProcessController({
                        "APPDATA": str((profile / "appdata").resolve()),
                        "LOCALAPPDATA": str((profile / "localappdata").resolve()),
                    })
                    process = controller.run(argv, timeout_seconds=90.0, cwd=exported.output_root)
                    runtime = _parse_prefixed_json(process.stdout, "LEYFORGE_W3_SELF_REPORT ")
                    capabilities = set(runtime.get("fixture_capabilities", []))
                    runtime_valid = bool(
                        process.exit_code == 0
                        and not process.timed_out
                        and runtime.get("status") == "PASS"
                        and runtime.get("role") == role
                        and runtime.get("build_identity") == exported.build.build_identity
                        and runtime.get("proof_execution_started") is False
                        and runtime.get("production_runtime") is False
                        and runtime.get("stable_proof_ids") == list(PROOF_IDS)
                        and REQUIRED_CAPABILITIES.issubset(capabilities)
                        and runtime.get("provider_ready") is True
                        and int(runtime.get("provider_errors", 1)) == 0
                        and int(runtime.get("frame_round_trip_errors", 1)) == 0
                        and int(runtime.get("contact_errors", 1)) == 0
                    )
                    checks[f"{role}_artifact_launch_valid"] = path_valid and role_flag_valid and integrity_valid and process.exit_code == 0 and not process.timed_out
                    checks[f"{role}_runtime_self_report_valid"] = runtime_valid
                    checks["authoritative_manifest_contract_valid"] = checks["authoritative_manifest_contract_valid"] or path_valid and integrity_valid
                    checks["build_identity_round_trip_valid"] = checks["build_identity_round_trip_valid"] or round_trip_valid
                    checks["proof_execution_started"] = checks["proof_execution_started"] or runtime.get("proof_execution_started") is not False
                    checks["production_runtime_present"] = checks["production_runtime_present"] or runtime.get("production_runtime") is not False
                    report["roles"][role] = {
                        "role": role,
                        "build_identity": exported.build.build_identity,
                        "artifact_manifest": {
                            "manifest_schema": exported.artifact.manifest_schema,
                            "authoritative_path_field": "artifact_path",
                            "path_resolved_during_validation": path_valid,
                            "manifest_contract_valid": path_valid and role_flag_valid and integrity_valid,
                            "build_identity_round_trip_valid": round_trip_valid,
                            "build_identity": exported.artifact.build_identity,
                            "artifact_sha256": exported.artifact.artifact_sha256,
                            "size_bytes": exported.artifact.size_bytes,
                            "artifact_kind": exported.artifact.artifact_kind,
                            "exported_runtime": exported.artifact.exported_runtime,
                            "synthetic_fixture": exported.artifact.synthetic_fixture,
                        },
                        "export_process": {
                            key: exported.export_result.get("process", {}).get(key)
                            for key in ("exit_code", "timed_out", "terminated_externally", "duration_seconds")
                        },
                        "launch_process": _process_summary(process),
                        "runtime_self_report": runtime,
                    }
                except Exception as exc:
                    issues.append(f"{role} fixture-launch integration failed: {type(exc).__name__}: {exc}")
    checks["authoritative_manifest_contract_valid"] = set(report["roles"]) == {"client", "headless"} and all(
        row.get("artifact_manifest", {}).get("manifest_contract_valid") is True
        for row in report["roles"].values()
    )
    checks["build_identity_round_trip_valid"] = set(report["roles"]) == {"client", "headless"} and all(
        row.get("artifact_manifest", {}).get("build_identity_round_trip_valid") is True
        for row in report["roles"].values()
    )
    after = _governed_execution_snapshot()
    report["after_execution_authority"] = after
    checks["execution_state_unchanged"] = before["state_sha256"] == after["state_sha256"] and before["state_bytes"] == after["state_bytes"]
    checks["registry_unchanged"] = before["registry"] == after["registry"]
    checks["identity_allocation_started"] = before["registry"]["run_ids"] != after["registry"]["run_ids"] or before["registry"]["evidence_ids"] != after["registry"]["evidence_ids"]
    required_true = tuple(key for key in checks if key not in {"proof_execution_started", "identity_allocation_started", "production_runtime_present"})
    report["issues"] = sorted(set(issues))
    report["status"] = "PASS" if all(checks[key] for key in required_true) and not any(checks[key] for key in ("proof_execution_started", "identity_allocation_started", "production_runtime_present")) and not issues else "FAIL"
    return report


def write_fixture_launch_validation(source_revision: str) -> Dict[str, Any]:
    value = fixture_launch_validation_report(source_revision)
    _write_json(FIXTURE_LAUNCH_VALIDATION_PATH, value)
    return value
