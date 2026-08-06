[CmdletBinding()]
param(
    [string]$GodotConsole = '',

    [string]$ProjectPath = '',

    [string]$ProfileRoot = (
        Join-Path ([System.IO.Path]::GetTempPath()) (
            'leyforge-current-gate-' + [guid]::NewGuid().ToString('N')
        )
    ),

    [ValidateRange(0, 100000)]
    [int]$ExtendedWorldgenSeeds = 0
)

$ErrorActionPreference = 'Stop'

. (Join-Path $PSScriptRoot 'godot_runner.ps1')
$GodotConsole = Resolve-LeyforgeGodotConsole -GodotConsole $GodotConsole

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}
if (-not (Test-Path -LiteralPath $GodotConsole -PathType Leaf)) {
    throw "Godot console executable not found: $GodotConsole"
}
if (-not (Test-Path -LiteralPath $ProjectPath -PathType Container)) {
    throw "Leyforge project not found: $ProjectPath"
}

New-Item -ItemType Directory -Path $ProfileRoot -Force | Out-Null
$env:APPDATA = $ProfileRoot
$env:LOCALAPPDATA = $ProfileRoot

# A source-only verification copy has no Godot import cache. Bootstrap it once
# so global class_name declarations are available before any scene is parsed.
$classCache = Join-Path $ProjectPath '.godot\global_script_class_cache.cfg'
if (-not (Test-Path -LiteralPath $classCache -PathType Leaf)) {
    Write-Host 'Bootstrapping clean project import cache'
    $bootstrapArguments = @(
        '--editor',
        '--headless',
        '--rendering-method', 'gl_compatibility',
        '--path', $ProjectPath,
        '--quit'
    )
    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $bootstrapOutput = & $GodotConsole $bootstrapArguments 2>&1
    $bootstrapExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorAction
    $bootstrapOutput | ForEach-Object { Write-Host $_ }
    $bootstrapCombined = $bootstrapOutput | Out-String
    if ($bootstrapExit -ne 0) {
        throw "Godot import bootstrap failed with exit code $bootstrapExit"
    }
    if ($bootstrapCombined -match 'SCRIPT ERROR|Parse Error') {
        throw 'Godot import bootstrap emitted a script or parse error'
    }
    if (-not (Test-Path -LiteralPath $classCache -PathType Leaf)) {
        throw "Godot import bootstrap did not create the class cache: $classCache"
    }
}

# Every pre-Stage-A probe remains pinned, including all Document 20 settlement
# content. New feature probes are additive and do not replace the 489-check
# historical Stage 9 matrix.
$sceneExpectations = [ordered]@{
    'res://.summer/verification/stage9_release_candidate_probe.tscn' = 39
    'res://.summer/verification/phase8_ui_learning_probe.tscn' = 104
    'res://.summer/verification/phase7_stabilization_probe.tscn' = 30
    'res://.summer/verification/phase7_combat_visual_probe.tscn' = 33
    'res://.summer/verification/phase4_save_probe.tscn' = 27
    'res://.summer/verification/phase5_automation_probe.tscn' = 61
    'res://.summer/verification/phase6_magic_probe.tscn' = 48
    'res://.summer/verification/all_recipes_probe.tscn' = 67
    'res://.summer/verification/creative_menu_probe.tscn' = 11
    'res://.summer/verification/item_drop_probe.tscn' = 9
    'res://.summer/verification/phase3_interaction_probe.tscn' = 15
    'res://.summer/verification/phase3_traversal_probe.tscn' = 4
    'res://.summer/verification/phase4_hamlet_probe.tscn' = 41
    'res://.summer/verification/settlement_project_probe.tscn' = 49
    'res://.summer/verification/settlement_registry_probe.tscn' = 47
    'res://.summer/verification/settlement_wave1_probe.tscn' = 169
    'res://.summer/verification/settlement_waves2_5_probe.tscn' = 155
    'res://.summer/verification/settlement_wave6_pack_probe.tscn' = 22
    'res://.summer/verification/current_worldgen_fast_probe.tscn' = 3335
    'res://.summer/verification/current_worldgen_runtime_probe.tscn' = 51
    'res://.summer/verification/regional_settlement_isolation_probe.tscn' = 30
    'res://.summer/verification/world_lifecycle_probe.tscn' = 41
    'res://.summer/verification/legacy_import_probe.tscn' = 14
    'res://.summer/verification/main_menu_probe.tscn' = 23
    'res://.summer/verification/forge_mvp_probe.tscn' = 960
    'res://.summer/verification/forge_end_to_end_probe.tscn' = 250
    'res://.summer/verification/village_progression_lab_probe.tscn' = 63
    'res://.summer/verification/stageb_living_settlement_probe.tscn' = 534
    'res://.summer/verification/set20_v02_set22_foundation_probe.tscn' = 1168
    'res://.summer/verification/set22_stage1_golden_templates_probe.tscn' = 481
    'res://.summer/verification/set23_foundation_probe.tscn' = 1816
    'res://.summer/verification/set22_stage2_set23_spatial_probe.tscn' = 218
    'res://.summer/verification/set22_stage3_set23_events_probe.tscn' = 676
    'res://.summer/verification/set23_stage4_runtime_presentation_probe.tscn' = 436
    'res://.summer/verification/set22_stage5_set23_world_presentation_probe.tscn' = 564
    'res://.summer/verification/set22_stage6_set23_production_probe.tscn' = 6113
}

if ($ExtendedWorldgenSeeds -gt 0) {
    $sceneExpectations[
        'res://.summer/verification/current_worldgen_fast_probe.tscn'
    ] = 13 * $ExtendedWorldgenSeeds + 7
}

$totalChecks = 0
$recoveredShutdownCrashes = 0
# The Codex Windows sandbox denies the system ROOT-store read while Godot's
# built-in CA bundle remains available, so that exact environment warning is
# intentionally excluded. Engine, content, and teardown leakage remain fatal.
$releaseBlockingPattern = (
    'SCRIPT ERROR|Parse Error|registry file not found|' +
    'using fallback block set|' +
    'RID allocations.*were leaked at exit|' +
    'Leaked instance:|ObjectDB instances were leaked at exit|' +
    'Resource still in use:|resources? still in use at exit|' +
    'Orphan StringName:|unclaimed string names at exit'
)
foreach ($entry in $sceneExpectations.GetEnumerator()) {
    $scene = [string]$entry.Key
    $expected = [int]$entry.Value
    Write-Host "Running $scene (expected checks=$expected)"
    $arguments = @(
        '--headless',
        '--rendering-method', 'gl_compatibility',
        '--path', $ProjectPath,
        '--scene', $scene,
        '--quit-after', '1200'
    )
    if (
        $scene -eq 'res://.summer/verification/current_worldgen_fast_probe.tscn' -and
        $ExtendedWorldgenSeeds -gt 0
    ) {
        $arguments += @('--', "--worldgen-seeds=$ExtendedWorldgenSeeds")
    }

    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $output = & $GodotConsole $arguments 2>&1
    $sceneExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorAction
    $output | ForEach-Object { Write-Host $_ }
    $combined = $output | Out-String

    # Legacy defensive fallback for an unrecognized engine that reproduces the
    # native teardown fault after a complete clean result. The runner resolver
    # blocks official Godot 4.6.3 hashes; this retry is not permission to use it.
    $preRetryMatches = [regex]::Matches($combined, '"checks":(\d+)')
    $cleanResultBeforeShutdown = (
        $combined -match '"ok":true' -and
        $combined -match '"failures":\[\]' -and
        $combined -notmatch $releaseBlockingPattern -and
        $preRetryMatches.Count -eq 1 -and
        [int]$preRetryMatches[0].Groups[1].Value -eq $expected
    )
    if (
        $sceneExit -eq -1073741819 -and
        $cleanResultBeforeShutdown
    ) {
        Write-Warning (
            "Godot access-violated during clean probe teardown; " +
            "retrying once: $scene"
        )
        $ErrorActionPreference = 'Continue'
        $output = & $GodotConsole $arguments 2>&1
        $sceneExit = $LASTEXITCODE
        $ErrorActionPreference = $previousErrorAction
        $output | ForEach-Object { Write-Host $_ }
        $combined = $output | Out-String
        if ($sceneExit -eq 0) {
            $recoveredShutdownCrashes += 1
        }
    }

    if ($sceneExit -ne 0) {
        throw "Probe failed with exit code ${sceneExit}: $scene"
    }
    if ($combined -match $releaseBlockingPattern) {
        throw (
            'Probe emitted a release-blocking engine, content, or teardown ' +
            "error: $scene"
        )
    }
    if ($combined -notmatch '"ok":true' -or $combined -notmatch '"failures":\[\]') {
        throw "Probe did not report a clean machine-readable result: $scene"
    }
    $matches = [regex]::Matches($combined, '"checks":(\d+)')
    if ($matches.Count -ne 1) {
        throw "Probe did not emit exactly one machine-readable check count: $scene"
    }
    $actual = [int]$matches[0].Groups[1].Value
    if ($actual -ne $expected) {
        throw "Expected $expected checks but observed $actual in $scene"
    }
    $totalChecks += $actual
}

$worldgenSeedCount = if ($ExtendedWorldgenSeeds -gt 0) {
    $ExtendedWorldgenSeeds
} else {
    256
}
Write-Host (
    "CURRENT_REGRESSION_GATE PASS checks=$totalChecks " +
    "worldgen_seeds=$worldgenSeedCount " +
    "recovered_shutdown_crashes=$recoveredShutdownCrashes " +
    "profile=$ProfileRoot"
)
