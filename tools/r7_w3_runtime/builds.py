"""Clean W3 fluid/vessel fixture export and exact external-process probes."""

from __future__ import annotations

import hashlib
import json
import platform
import shutil
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Dict, Mapping, Optional, Sequence

from tools.proof_harness.build import BuildController, CleanExportPlan
from tools.proof_harness.manifests import ArtifactManifest, BuildManifest, sha256_file
from tools.proof_harness.process import ProcessController, SmokeLane
from tools.proof_harness.state import ProofExecution

from .dependencies import ROOT, execution_components, iter_staged_voxel_files, load_lock, verify_local_dependencies


PROBE_SOURCE = ROOT / "proofs/r7/w3/server_probe"
W3_SOURCE = ROOT / "proofs/r7/w3"
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


def _parse_prefixed_json(stdout: str, prefix: str) -> Dict[str, Any]:
    matches = [line[len(prefix):] for line in stdout.splitlines() if line.startswith(prefix)]
    if len(matches) != 1:
        raise ValueError(f"expected exactly one {prefix.strip()} line; found {len(matches)}")
    value = json.loads(matches[0])
    if not isinstance(value, dict):
        raise ValueError("runtime report is not an object")
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


def export_one(source_revision: str, role: str, run_root: Path, execution: ProofExecution) -> ExportedBuild:
    if role not in {"client", "headless"}:
        raise ValueError("unsupported W3 export role")
    lock = load_lock()
    local = verify_local_dependencies(lock)
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
    argv = [str(artifact_path.resolve())]
    if role == "headless":
        argv.append("--headless")
    argv.extend(["--", "--mode", "smoke"])
    lane = SmokeLane(
        lane_id=f"W3-{role.upper()}-EXPORT-SMOKE",
        proof_id=execution.proof_id,
        role=role,
        build=build,
        artifact=artifact,
        argv=tuple(argv),
    )
    smoke = lane.execute(controller, timeout_seconds=60.0, proof_execution=execution)
    report = _parse_prefixed_json(smoke.process.stdout, "LEYFORGE_W3_SELF_REPORT ")
    capabilities = set(report.get("fixture_capabilities", []))
    if (
        report.get("status") != "PASS"
        or report.get("build_identity") != build.build_identity
        or report.get("role") != role
        or not REQUIRED_CAPABILITIES.issubset(capabilities)
        or not smoke.evidence_eligible
    ):
        raise RuntimeError("W3 runtime self-report did not match its build and fixture contract")
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
    return ExportedBuild(build, artifact, export_result.to_dict(), smoke.to_dict(), report, content, workspace, output_root)


def run_fixture_probe(exported: ExportedBuild, execution: ProofExecution, iterations: int = 512) -> Dict[str, Any]:
    profile = exported.output_root.parent / "runtime-profile" / str(execution.run_id)
    controller = EnvironmentProcessController({
        "APPDATA": str((profile / "appdata").resolve()),
        "LOCALAPPDATA": str((profile / "localappdata").resolve()),
    })
    artifact_path = Path(exported.artifact.path)
    argv = [str(artifact_path.resolve())]
    if exported.build.role == "headless":
        argv.append("--headless")
    argv.extend([
        "--", "--mode", "fixture", "--proof-id", execution.proof_id,
        "--run-id", str(execution.run_id), "--iterations", str(iterations),
    ])
    lane = SmokeLane(
        lane_id=f"{execution.proof_id}-W3-FLUID-VESSEL-FIXTURE",
        proof_id=execution.proof_id,
        role=exported.build.role,
        build=exported.build,
        artifact=exported.artifact,
        argv=tuple(argv),
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
