[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$GodotConsole,

    [string]$ProjectPath = (
        Resolve-Path (Join-Path $PSScriptRoot '..\..')
    ).Path,

    [string]$ProfileRoot = (
        Join-Path ([System.IO.Path]::GetTempPath()) (
            'leyforge-stage9-gate-' + [guid]::NewGuid().ToString('N')
        )
    )
)

$ErrorActionPreference = 'Stop'
$expectedChecks = 489

if (-not (Test-Path -LiteralPath $GodotConsole -PathType Leaf)) {
    throw "Godot console executable not found: $GodotConsole"
}
if (-not (Test-Path -LiteralPath $ProjectPath -PathType Container)) {
    throw "Leyforge project not found: $ProjectPath"
}

New-Item -ItemType Directory -Path $ProfileRoot -Force | Out-Null
$env:APPDATA = $ProfileRoot
$env:LOCALAPPDATA = $ProfileRoot

$scenes = @(
    'res://.summer/verification/stage9_release_candidate_probe.tscn',
    'res://.summer/verification/phase8_ui_learning_probe.tscn',
    'res://.summer/verification/phase7_stabilization_probe.tscn',
    'res://.summer/verification/phase7_combat_visual_probe.tscn',
    'res://.summer/verification/phase4_save_probe.tscn',
    'res://.summer/verification/phase5_automation_probe.tscn',
    'res://.summer/verification/phase6_magic_probe.tscn',
    'res://.summer/verification/all_recipes_probe.tscn',
    'res://.summer/verification/creative_menu_probe.tscn',
    'res://.summer/verification/item_drop_probe.tscn',
    'res://.summer/verification/phase3_interaction_probe.tscn',
    'res://.summer/verification/phase3_traversal_probe.tscn',
    'res://.summer/verification/phase4_hamlet_probe.tscn'
)

$totalChecks = 0
foreach ($scene in $scenes) {
    Write-Host "Running $scene"
    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $output = & $GodotConsole `
        --headless `
        --rendering-method gl_compatibility `
        --path $ProjectPath `
        --scene $scene `
        --quit-after 6000 2>&1
    $sceneExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorAction
    $output | ForEach-Object { Write-Host $_ }
    $combined = $output | Out-String

    if ($sceneExit -ne 0) {
        throw "Probe failed with exit code ${sceneExit}: $scene"
    }
    if ($combined -match 'SCRIPT ERROR|Parse Error|registry file not found|using fallback block set') {
        throw "Probe emitted a release-blocking engine or content error: $scene"
    }
    $matches = [regex]::Matches($combined, '"checks":(\d+)')
    if ($matches.Count -ne 1) {
        throw "Probe did not emit exactly one machine-readable check count: $scene"
    }
    $totalChecks += [int]$matches[0].Groups[1].Value
}

if ($totalChecks -ne $expectedChecks) {
    throw "Expected $expectedChecks checks but observed $totalChecks"
}

Write-Host "STAGE9_RELEASE_GATE PASS checks=$totalChecks profile=$ProfileRoot"
