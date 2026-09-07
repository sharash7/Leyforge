"""Clean W2 proof export plus real concurrent and external-crash process control."""

from __future__ import annotations

import hashlib
import json
import os
import platform
import shutil
import subprocess
import time
from concurrent.futures import ThreadPoolExecutor
from dataclasses import dataclass
from datetime import datetime, timezone
from pathlib import Path
from typing import Any, Dict, Mapping, Optional, Sequence

from proofs.r7.w2.runtime.model import CRASH_PHASES
from tools.proof_harness.build import BuildController, CleanExportPlan
from tools.proof_harness.manifests import ArtifactManifest, BuildManifest, sha256_file
from tools.proof_harness.process import ProcessController, SmokeLane
from tools.proof_harness.state import ProofExecution

from .dependencies import ROOT, execution_components, iter_staged_voxel_files, load_lock, verify_local_dependencies

PROBE_SOURCE = ROOT / "proofs/r7/w2/server_probe"
W2_SOURCE = ROOT / "proofs/r7/w2"


class EnvironmentProcessController(ProcessController):
    def __init__(self, environment: Mapping[str, str]) -> None:
        self.environment = {str(key): str(value) for key, value in environment.items()}

    def run(self, argv: Sequence[str], timeout_seconds: float, cwd: Optional[Path] = None,
            environment: Optional[Mapping[str, str]] = None):
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
    name = "W2 Client Probe" if role == "client" else "W2 Dedicated Probe"
    dedicated = "false" if role == "client" else "true"
    feature = "client" if role == "client" else "dedicated"
    return f'''[preset.0]
name="{name}"
platform="Windows Desktop"
runnable=true
dedicated_server={dedicated}
custom_features="r7_w2_proof,{feature}"
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
        raise ValueError("unsupported W2 export role")
    lock = load_lock()
    local = verify_local_dependencies(lock)
    if local["status"] != "PASS":
        raise ValueError("local dependencies are not execution ready: " + "; ".join(local["issues"]))
    allowed = (ROOT / ".local").resolve()
    build_root = run_root.resolve() / "builds" / role
    try:
        build_root.relative_to(allowed)
    except ValueError as exc:
        raise ValueError("W2 run root must remain under repository .local") from exc
    if build_root.exists():
        raise ValueError(f"clean W2 build root already exists: {build_root}")
    workspace = build_root / "project"
    output_root = build_root / "output"
    shutil.copytree(PROBE_SOURCE, workspace)
    for source, destination in iter_staged_voxel_files(lock):
        target = workspace / destination
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(source, target)
    driver = Path(local["paths"]["godot_driver"])
    template = Path(local["paths"]["godot_template_runtime"])
    preset = "W2 Client Probe" if role == "client" else "W2 Dedicated Probe"
    artifact_path = output_root / f"leyforge-w2-{role}-probe.exe"
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
        profile="release-like-w2-network-persistence-proof",
        precision="canonical-identities-with-explicit-durability-revisions",
        platform="windows-x86_64",
        content_identity=_tree_identity(W2_SOURCE),
        schema_identity="leyforge-r7-w2-network-persistence-runtime-v1",
        clean_export=True,
        invocation=invocation,
        components=execution_components(lock),
        environment=environment,
    )
    issues = build.issues(for_execution=True)
    if issues:
        raise ValueError("W2 build manifest is invalid: " + "; ".join(issues))
    _write_json(workspace / "build_manifest.json", dict(build.to_dict(), build_identity=build.build_identity))
    (workspace / "export_presets.cfg").write_text(_export_preset(role, template), encoding="utf-8")
    profile = build_root / "profile"
    controller = EnvironmentProcessController({
        "APPDATA": str((profile / "appdata").resolve()),
        "LOCALAPPDATA": str((profile / "localappdata").resolve()),
    })
    export_result = BuildController(controller).execute(CleanExportPlan(build=build, output_root=output_root, argv=invocation), timeout_seconds=180.0)
    if export_result.process.exit_code != 0 or export_result.process.timed_out or not artifact_path.is_file():
        raise RuntimeError("W2 Godot export failed: " + json.dumps(export_result.to_dict(), ensure_ascii=True))
    artifact = ArtifactManifest.from_path(
        artifact_path, build, artifact_kind="leyforge-export", exported_runtime=True,
        synthetic_fixture=False, runtime_self_report_build_identity=build.build_identity,
    )
    argv = [str(artifact_path.resolve())]
    if role == "headless":
        argv.append("--headless")
    argv.extend(["--", "--mode", "smoke"])
    lane = SmokeLane(lane_id=f"W2-{role.upper()}-EXPORT-SMOKE", proof_id=execution.proof_id, role=role, build=build, artifact=artifact, argv=tuple(argv))
    smoke = lane.execute(controller, timeout_seconds=60.0, proof_execution=execution)
    report = _parse_prefixed_json(smoke.process.stdout, "LEYFORGE_W2_SELF_REPORT ")
    if report.get("status") != "PASS" or report.get("build_identity") != build.build_identity or report.get("role") != role:
        raise RuntimeError("W2 runtime self-report did not match its build")
    if int(report.get("crash_phase_count", 0)) != len(CRASH_PHASES) or not smoke.evidence_eligible:
        raise RuntimeError("W2 export smoke did not expose the governed crash-phase contract")
    files = [
        {"path": path.relative_to(output_root).as_posix(), "bytes": path.stat().st_size, "sha256": sha256_file(path)}
        for path in sorted(output_root.rglob("*")) if path.is_file()
    ]
    content = {
        "schema_version": "prd07-w2-role-content-manifest-v1",
        "role": role,
        "build_identity": build.build_identity,
        "files": files,
        "presentation_authority_included": False,
        "provider_runtime_included": any(item["path"].endswith("libvoxel.windows.template_release.x86_64.dll") for item in files),
    }
    return ExportedBuild(build, artifact, export_result.to_dict(), smoke.to_dict(), report, content, workspace, output_root)


def _process_environment(profile: Path) -> Dict[str, str]:
    environment = dict(os.environ)
    environment["APPDATA"] = str((profile / "appdata").resolve())
    environment["LOCALAPPDATA"] = str((profile / "localappdata").resolve())
    return environment


def _hidden_process_flags() -> int:
    return int(getattr(subprocess, "CREATE_NO_WINDOW", 0))


def run_concurrent_backup_smoke(exported: ExportedBuild, execution: ProofExecution, run_root: Path) -> Dict[str, Any]:
    root = run_root.resolve() / "real-processes" / str(execution.run_id) / "backup-pair"
    root.mkdir(parents=True, exist_ok=False)
    artifact = str(Path(exported.artifact.artifact_path).resolve())
    processes = []
    started = []
    for role in ("source", "copy"):
        data_root = root / role
        argv = [artifact, "--headless", "--", "--mode", "session-smoke", "--session-role", role, "--data-root", str(data_root.resolve())]
        start = time.time()
        process = subprocess.Popen(
            argv,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            encoding="utf-8",
            errors="replace",
            env=_process_environment(root / "profiles" / role),
            creationflags=_hidden_process_flags(),
        )
        processes.append((role, process))
        started.append(start)
    reports = []
    ended = []
    for role, process in processes:
        stdout, stderr = process.communicate(timeout=30)
        ended.append(time.time())
        report = _parse_prefixed_json(stdout, "LEYFORGE_W2_SESSION_REPORT ")
        report["exit_code"] = process.returncode
        report["stderr_sha256"] = hashlib.sha256(stderr.encode("utf-8")).hexdigest()
        reports.append(report)
    distinct = len({item.get("pid") for item in reports}) == 2 and len({item.get("session_id") for item in reports}) == 2
    semantic_same = len({item.get("world_semantic_id") for item in reports}) == 1
    overlap = max(started) < min(ended)
    passed = all(item.get("status") == "PASS" and item.get("exit_code") == 0 for item in reports) and distinct and semantic_same and overlap
    return {
        "schema_version": "prd07-w2-concurrent-backup-process-report-v1",
        "outcome": "PASS" if passed else "FAIL",
        "concurrent_processes": len(reports),
        "process_overlap": overlap,
        "distinct_runtime_sessions": distinct,
        "preserved_world_semantic_identity": semantic_same,
        "build_identity": exported.build.build_identity,
        "artifact_sha256": exported.artifact.artifact_sha256,
        "processes": reports,
    }


def _wait_for_marker(path: Path, target_phase: str, process: subprocess.Popen[str], timeout_seconds: float) -> Dict[str, Any]:
    deadline = time.monotonic() + timeout_seconds
    last_error = ""
    while time.monotonic() < deadline:
        if path.is_file():
            try:
                value = json.loads(path.read_text(encoding="utf-8-sig"))
                if value.get("phase") == target_phase and value.get("target_phase") == target_phase:
                    return value
            except (OSError, json.JSONDecodeError) as exc:
                last_error = str(exc)
        if process.poll() is not None:
            raise RuntimeError(f"crash worker exited before target marker: {process.returncode}")
        time.sleep(0.01)
    raise TimeoutError(f"timed out waiting for {target_phase} marker: {last_error}")


def _checkpoint_inventory(data_root: Path) -> list[Dict[str, Any]]:
    rows = []
    for path in sorted(data_root.rglob("*")):
        if path.is_file():
            rows.append({
                "path": path.relative_to(data_root).as_posix(),
                "bytes": path.stat().st_size,
                "sha256": sha256_file(path),
            })
    return rows


def _run_crash_case(exported: ExportedBuild, execution: ProofExecution, root: Path, phase: str, repetition: int) -> Dict[str, Any]:
    case_id = f"{phase.lower()}.{repetition:02d}"
    case_root = root / case_id
    data_root = case_root / "world"
    profile = case_root / "profile"
    case_root.mkdir(parents=True, exist_ok=False)
    artifact = str(Path(exported.artifact.artifact_path).resolve())
    argv = [
        artifact, "--headless", "--", "--mode", "crash-worker",
        "--data-root", str(data_root.resolve()), "--target-phase", phase,
        "--case-id", case_id, "--run-id", str(execution.run_id),
    ]
    started_at = datetime.now(timezone.utc).isoformat()
    process = subprocess.Popen(
        argv,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        encoding="utf-8",
        errors="replace",
        env=_process_environment(profile / "worker"),
        creationflags=_hidden_process_flags(),
    )
    marker = _wait_for_marker(data_root / "kill-ready.json", phase, process, 20.0)
    killed_at = datetime.now(timezone.utc).isoformat()
    process.kill()
    stdout, stderr = process.communicate(timeout=10)
    forced_exit_code = process.returncode
    recovery_argv = [artifact, "--headless", "--", "--mode", "recover", "--data-root", str(data_root.resolve())]
    recovery = subprocess.run(
        recovery_argv,
        text=True,
        encoding="utf-8",
        errors="replace",
        capture_output=True,
        timeout=30,
        env=_process_environment(profile / "recovery"),
        creationflags=_hidden_process_flags(),
    )
    report = _parse_prefixed_json(recovery.stdout, "LEYFORGE_W2_RECOVERY_REPORT ")
    publish_index = CRASH_PHASES.index("MANIFEST-PUBLISH")
    expected_generation = 2 if CRASH_PHASES.index(phase) >= publish_index else 1
    valid = (
        forced_exit_code not in {0, None}
        and recovery.returncode == 0
        and report.get("status") == "PASS"
        and report.get("build_identity") == exported.build.build_identity
        and int(report.get("selected_generation", 0)) == expected_generation
        and report.get("mixed_lineage") is False
    )
    return {
        "case_id": case_id,
        "phase": phase,
        "repetition": repetition,
        "expected_generation": expected_generation,
        "selected_generation": int(report.get("selected_generation", 0)),
        "valid": valid,
        "external_kill": True,
        "worker_pid": process.pid,
        "started_at": started_at,
        "killed_at": killed_at,
        "forced_exit_code": forced_exit_code,
        "worker_stdout_sha256": hashlib.sha256(stdout.encode("utf-8")).hexdigest(),
        "worker_stderr_sha256": hashlib.sha256(stderr.encode("utf-8")).hexdigest(),
        "recovery_exit_code": recovery.returncode,
        "recovery_stdout_sha256": hashlib.sha256(recovery.stdout.encode("utf-8")).hexdigest(),
        "recovery_stderr_sha256": hashlib.sha256(recovery.stderr.encode("utf-8")).hexdigest(),
        "marker": marker,
        "recovery": report,
        "checkpoint_inventory": _checkpoint_inventory(data_root),
    }


def run_real_crash_matrix(
    exported: ExportedBuild,
    execution: ProofExecution,
    run_root: Path,
    repetitions_per_phase: int = 16,
) -> Dict[str, Any]:
    if exported.build.role != "headless":
        raise ValueError("real crash matrix requires the W2 headless export")
    if repetitions_per_phase < 15:
        raise ValueError("real crash matrix must retain at least two hundred total cases")
    root = run_root.resolve() / "real-processes" / str(execution.run_id) / "crash-matrix"
    root.mkdir(parents=True, exist_ok=False)
    schedule = [(phase, repetition) for phase in CRASH_PHASES for repetition in range(repetitions_per_phase)]
    with ThreadPoolExecutor(max_workers=4, thread_name_prefix="w2-real-crash") as pool:
        cases = list(pool.map(lambda item: _run_crash_case(exported, execution, root, item[0], item[1]), schedule))
    wrong = sum(item["selected_generation"] != item["expected_generation"] for item in cases)
    mixed = sum(bool(item["recovery"].get("mixed_lineage")) for item in cases)
    restart_failures = sum(item["recovery_exit_code"] != 0 or item["recovery"].get("status") != "PASS" for item in cases)
    non_forced = sum(item["forced_exit_code"] in {0, None} for item in cases)
    unexplained = sum(not item["valid"] for item in cases)
    compact_cases = [
        {
            "case_id": item["case_id"],
            "phase": item["phase"],
            "repetition": item["repetition"],
            "expected_generation": item["expected_generation"],
            "selected_generation": item["selected_generation"],
            "external_kill": item["external_kill"],
            "valid": item["valid"],
            "state_hash": item["recovery"].get("state_hash"),
        }
        for item in cases
    ]
    process_exit = [
        {
            "case_id": item["case_id"],
            "worker_pid": item["worker_pid"],
            "started_at": item["started_at"],
            "killed_at": item["killed_at"],
            "forced_exit_code": item["forced_exit_code"],
            "recovery_exit_code": item["recovery_exit_code"],
            "worker_stdout_sha256": item["worker_stdout_sha256"],
            "worker_stderr_sha256": item["worker_stderr_sha256"],
        }
        for item in cases
    ]
    sample_indexes = [index * repetitions_per_phase for index in range(len(CRASH_PHASES))]
    passed = wrong == mixed == restart_failures == non_forced == unexplained == 0 and len(cases) >= 200
    return {
        "schema_version": "prd07-w2-real-crash-matrix-v1",
        "outcome": "PASS" if passed else "FAIL",
        "case_count": len(cases),
        "fault_phase_count": len(CRASH_PHASES),
        "repetitions_per_phase": repetitions_per_phase,
        "external_forced_termination": True,
        "build_identity": exported.build.build_identity,
        "artifact_sha256": exported.artifact.artifact_sha256,
        "wrong_generation_selections": wrong,
        "mixed_lineages": mixed,
        "restart_failures": restart_failures,
        "non_forced_exits": non_forced,
        "unexplained_recoveries": unexplained,
        "cases": compact_cases,
        "process_exit_evidence": process_exit,
        "checkpoint_samples": [cases[index]["checkpoint_inventory"] for index in sample_indexes],
        "recovery_samples": [cases[index]["recovery"] for index in sample_indexes],
    }
