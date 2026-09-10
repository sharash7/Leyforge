"""Exact fixed-Godot export and isolated W4 presentation/runtime observations."""

from __future__ import annotations

import hashlib
import json
import os
import platform
import shutil
import subprocess
import time
from pathlib import Path
from typing import Any, Dict, Mapping, Optional, Sequence, Tuple

from tools.r7_w4_runtime.dependencies import load_reference, local_dependency_report

from .contracts import ROOT, canonical_bytes, sha256_file


PROBE_SOURCE = ROOT / "proofs/r7/w4_execution/presentation_probe"
REPORT_PREFIX = "LEYFORGE_W4_EXECUTION_REPORT "


def _tree_identity(root: Path) -> str:
    digest = hashlib.sha256()
    for path in sorted(item for item in root.rglob("*") if item.is_file() and ".godot" not in item.parts):
        relative = path.relative_to(root).as_posix()
        digest.update(relative.encode("utf-8") + b"\0" + path.read_bytes() + b"\0")
    return digest.hexdigest()


def _process(argv: Sequence[str], cwd: Path, environment: Mapping[str, str], timeout: float) -> Dict[str, Any]:
    started = time.time()
    try:
        completed = subprocess.run(
            list(argv), cwd=cwd, env=dict(environment), text=True, capture_output=True, timeout=timeout
        )
        return {
            "argv": list(argv),
            "cwd": str(cwd.resolve()),
            "exit_code": completed.returncode,
            "timed_out": False,
            "duration_seconds": time.time() - started,
            "stdout": completed.stdout,
            "stderr": completed.stderr,
            "stdout_sha256": hashlib.sha256(completed.stdout.encode("utf-8")).hexdigest(),
            "stderr_sha256": hashlib.sha256(completed.stderr.encode("utf-8")).hexdigest(),
        }
    except subprocess.TimeoutExpired as exc:
        stdout = exc.stdout if isinstance(exc.stdout, str) else ""
        stderr = exc.stderr if isinstance(exc.stderr, str) else ""
        return {
            "argv": list(argv),
            "cwd": str(cwd.resolve()),
            "exit_code": None,
            "timed_out": True,
            "duration_seconds": time.time() - started,
            "stdout": stdout,
            "stderr": stderr,
            "stdout_sha256": hashlib.sha256(stdout.encode("utf-8")).hexdigest(),
            "stderr_sha256": hashlib.sha256(stderr.encode("utf-8")).hexdigest(),
        }


def _parse_report(stdout: str) -> Dict[str, Any]:
    rows = [line[len(REPORT_PREFIX):] for line in stdout.splitlines() if line.startswith(REPORT_PREFIX)]
    if len(rows) != 1:
        raise ValueError("expected exactly one W4 execution probe report")
    value = json.loads(rows[0])
    if not isinstance(value, dict):
        raise ValueError("W4 execution probe report is not an object")
    return value


def _export_preset(template: Path) -> str:
    custom = str(template.resolve()).replace("\\", "/")
    return f'''[preset.0]

name="W4 Client Probe"
platform="Windows Desktop"
runnable=true
advanced_options=false
dedicated_server=false
custom_features=""
export_filter="all_resources"
include_filter=""
exclude_filter=""
export_path=""
patches=PackedStringArray()
encryption_include_filters=""
encryption_exclude_filters=""
encrypt_pck=false
encrypt_directory=false
script_export_mode=2

[preset.0.options]

custom_template/debug="{custom}"
custom_template/release="{custom}"
debug/export_console_wrapper=1
binary_format/embed_pck=true
texture_format/s3tc_bptc=true
texture_format/etc2_astc=false
texture_format/no_bptc_fallbacks=true
'''


def host_environment_snapshot() -> Dict[str, Any]:
    script = (
        "$cpu=Get-CimInstance Win32_Processor | Select-Object -First 1 Name,Manufacturer,NumberOfCores,NumberOfLogicalProcessors;"
        "$gpu=@(Get-CimInstance Win32_VideoController | Select-Object Name,DriverVersion,VideoProcessor,AdapterRAM,CurrentHorizontalResolution,CurrentVerticalResolution);"
        "$display=@(Get-CimInstance Win32_DesktopMonitor | Select-Object Name,MonitorManufacturer,ScreenWidth,ScreenHeight,Status);"
        "[pscustomobject]@{cpu=$cpu;gpu=$gpu;display=$display}|ConvertTo-Json -Depth 6 -Compress"
    )
    result = subprocess.run(
        ["powershell", "-NoProfile", "-ExecutionPolicy", "Bypass", "-Command", script],
        cwd=ROOT,
        text=True,
        capture_output=True,
    )
    hardware: Dict[str, Any]
    try:
        parsed = json.loads(result.stdout) if result.returncode == 0 and result.stdout.strip() else {}
        hardware = parsed if isinstance(parsed, dict) else {"value": parsed}
    except json.JSONDecodeError:
        hardware = {"capture_error": result.stderr.strip() or "invalid hardware JSON"}
    return {
        "os": platform.platform(),
        "os_system": platform.system(),
        "os_release": platform.release(),
        "machine": platform.machine(),
        "python": platform.python_version(),
        "processor": platform.processor(),
        "hardware": hardware,
        "hardware_capture_exit_code": result.returncode,
        "hardware_capture_stderr_sha256": hashlib.sha256(result.stderr.encode("utf-8")).hexdigest(),
    }


def build_probe(source_revision: str, run_root: Path) -> Dict[str, Any]:
    """Build and smoke-test one exact proof-only artifact before any RUN allocation."""
    local = local_dependency_report()
    if local.get("status") != "PASS" or local.get("local_patch_status") != "NO-LOCAL-PATCH":
        raise RuntimeError("W4 exact local dependencies are unavailable: " + "; ".join(local.get("issues", [])))
    if run_root.exists():
        raise ValueError("W4 execution root must be absent before preflight")
    workspace = run_root / "build/workspace"
    output_root = run_root / "build/output"
    profile = run_root / "build/profile"
    workspace.parent.mkdir(parents=True)
    shutil.copytree(PROBE_SOURCE, workspace)
    input_root = workspace / "fixture-inputs"
    input_root.mkdir()
    for relative in (
        "proofs/r7/w4/fixture-07/source-packages.json",
        "proofs/r7/w4/fixture-07/trust-and-scale-cases.json",
        "proofs/r7/w4/fixture-08/presentation-cases.json",
    ):
        shutil.copy2(ROOT / relative, input_root / Path(relative).name)
    template = Path(str(local["paths"]["godot_template_runtime"]))
    driver = Path(str(local["paths"]["godot_driver"]))
    (workspace / "export_presets.cfg").write_text(_export_preset(template), encoding="utf-8")
    output_root.mkdir(parents=True)
    profile.mkdir(parents=True)
    environment = os.environ.copy()
    environment["APPDATA"] = str((profile / "appdata").resolve())
    environment["LOCALAPPDATA"] = str((profile / "localappdata").resolve())
    parse = _process(
        [str(driver), "--headless", "--path", str(workspace.resolve()), "--editor", "--quit"],
        workspace,
        environment,
        120.0,
    )
    if parse["exit_code"] != 0 or parse["timed_out"]:
        raise RuntimeError("W4 fixed-Godot parse/load preflight failed: " + json.dumps(parse, ensure_ascii=True))
    artifact = output_root / "leyforge-w4-proof.exe"
    export = _process(
        [str(driver), "--headless", "--path", str(workspace.resolve()), "--export-release", "W4 Client Probe", str(artifact.resolve())],
        workspace,
        environment,
        240.0,
    )
    if export["exit_code"] != 0 or export["timed_out"] or not artifact.is_file():
        raise RuntimeError("W4 fixed-Godot export preflight failed: " + json.dumps(export, ensure_ascii=True))
    probe_identity = _tree_identity(PROBE_SOURCE)
    dependency_identity = load_reference()
    build_material = {
        "source_revision": source_revision,
        "probe_source_identity": probe_identity,
        "godot_driver_sha256": sha256_file(driver),
        "godot_template_sha256": sha256_file(template),
        "voxel_tools_sha256": dependency_identity.get("component_hashes", {}).get("voxel_tools_package_sha256", "") if isinstance(dependency_identity.get("component_hashes"), dict) else "",
        "role": "client",
    }
    build_identity = hashlib.sha256(canonical_bytes(build_material)).hexdigest()
    smoke_dir = run_root / "build/smoke"
    smoke_dir.mkdir(parents=True)
    smoke = run_probe_process(
        artifact,
        run_root,
        "SMOKE",
        "NONE",
        "BASELINE",
        renderer="gl_compatibility",
        capture=False,
        profile_key="preallocation-smoke",
    )
    report = smoke.get("report", {})
    if (
        smoke.get("process", {}).get("exit_code") != 0
        or report.get("status") != "PASS"
        or report.get("proof_execution_started") is not False
        or report.get("production_runtime") is not False
        or report.get("gameplay_permission") != "CLOSED"
    ):
        raise RuntimeError("W4 exported probe smoke preflight failed: " + json.dumps(smoke, ensure_ascii=True))
    rendered_smokes: Dict[str, Any] = {}
    for renderer in ("forward_plus", "mobile", "gl_compatibility"):
        rendered = run_probe_process(
            artifact,
            run_root,
            "PREALLOCATION-RENDERED-" + renderer.upper(),
            "NONE",
            "BASELINE",
            renderer=renderer,
            capture=True,
            profile_key="preallocation-rendered-" + renderer,
        )
        rendered_report = rendered.get("report", {})
        if (
            rendered.get("process", {}).get("exit_code") != 0
            or rendered_report.get("status") != "PASS"
            or rendered_report.get("proof_execution_started") is not False
            or rendered_report.get("production_runtime") is not False
            or rendered_report.get("gameplay_permission") != "CLOSED"
            or not rendered.get("capture_path")
            or rendered_report.get("renderer") != renderer
        ):
            raise RuntimeError(
                "W4 rendered/capture preallocation smoke failed for {0}: {1}".format(
                    renderer, json.dumps(rendered, ensure_ascii=True)
                )
            )
        rendered_smokes[renderer] = rendered
    return {
        "schema_version": "prd07-w4-proof-build-v1",
        "source_revision": source_revision,
        "role": "client",
        "build_identity": build_identity,
        "probe_source_identity": probe_identity,
        "artifact_path": str(artifact.resolve()),
        "artifact_sha256": sha256_file(artifact),
        "artifact_size_bytes": artifact.stat().st_size,
        "parse_process": parse,
        "export_process": export,
        "smoke_process": smoke,
        "rendered_smoke_processes": rendered_smokes,
        "dependency_check": local,
        "environment": host_environment_snapshot(),
        "proof_execution_started": False,
        "identity_allocation_started": False,
        "production_runtime": "ABSENT",
        "gameplay_permission": "CLOSED",
    }


def run_probe_process(
    artifact: Path,
    run_root: Path,
    invocation_id: str,
    proof_id: str,
    case_id: str,
    *,
    renderer: str = "gl_compatibility",
    capture: bool = True,
    profile_key: Optional[str] = None,
) -> Dict[str, Any]:
    invocation_root = run_root / "runtime" / invocation_id
    invocation_root.mkdir(parents=True, exist_ok=False)
    profile = run_root / "profiles" / (profile_key or invocation_id)
    profile.mkdir(parents=True, exist_ok=True)
    environment = os.environ.copy()
    environment["APPDATA"] = str((profile / "appdata").resolve())
    environment["LOCALAPPDATA"] = str((profile / "localappdata").resolve())
    capture_path = invocation_root / "capture.png"
    argv = [str(artifact.resolve())]
    if not capture:
        argv.append("--headless")
    argv.extend(["--rendering-method", renderer, "--", "--mode", "smoke" if proof_id == "NONE" else "proof", "--proof-id", proof_id, "--case-id", case_id])
    if capture:
        argv.extend(["--capture-path", str(capture_path.resolve())])
    process = _process(argv, invocation_root, environment, 120.0)
    report: Dict[str, Any] = {}
    parse_error = ""
    try:
        report = _parse_report(str(process.get("stdout", "")))
    except Exception as exc:
        parse_error = str(exc)
    return {
        "invocation_id": invocation_id,
        "proof_id": proof_id,
        "case_id": case_id,
        "renderer_argument": renderer,
        "isolated_profile": str(profile.resolve()),
        "process": process,
        "report": report,
        "parse_error": parse_error,
        "capture_path": str(capture_path.resolve()) if capture_path.is_file() else "",
        "capture_sha256": sha256_file(capture_path) if capture_path.is_file() else "",
    }
