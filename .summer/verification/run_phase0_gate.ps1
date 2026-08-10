[CmdletBinding()]
param(
    [string]$GodotConsole = '',

    [string]$ProjectPath = '',

    [string]$ProfileRoot = (
        Join-Path ([System.IO.Path]::GetTempPath()) (
            'leyforge-phase0-gate-' + [guid]::NewGuid().ToString('N')
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

& (Join-Path $ProjectPath (
    '.summer\tools\generate_requirement_ledger.ps1'
)) -ProjectPath $ProjectPath -Check
if (-not $?) {
    throw 'Requirement-ledger validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\tools\update_implementation_coverage.ps1'
)) -ProjectPath $ProjectPath -Check
if (-not $?) {
    throw 'Implementation-coverage validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\tools\update_production_roadmap.ps1'
)) -ProjectPath $ProjectPath -Check
if (-not $?) {
    throw 'Production-roadmap validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\tools\update_document_checksums.ps1'
)) -ProjectPath $ProjectPath -Check
if (-not $?) {
    throw 'Document-checksum validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\verification\document_governance_probe.ps1'
)) -ProjectPath $ProjectPath
if (-not $?) {
    throw 'Document-governance validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\verification\poc_archive_isolation_probe.ps1'
)) -ProjectPath $ProjectPath
if (-not $?) {
    throw 'POC archive-isolation validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\verification\canonical_block_inventory_projection_probe.ps1'
)) -ProjectPath $ProjectPath
if (-not $?) {
    throw 'Canonical Block Inventory Projection validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\verification\run_current_regression_gate.ps1'
)) -GodotConsole $GodotConsole `
    -ProjectPath $ProjectPath `
    -ProfileRoot $ProfileRoot `
    -ExtendedWorldgenSeeds $ExtendedWorldgenSeeds
if (-not $?) {
    throw 'Current regression gate failed'
}

if (Test-Path -LiteralPath (Join-Path $ProjectPath '.git')) {
    $previousErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $diffCheck = & git -C $ProjectPath diff --check 2>&1
    $diffExit = $LASTEXITCODE
    $ErrorActionPreference = $previousErrorAction
    if ($diffExit -ne 0) {
        $diffCheck | ForEach-Object { Write-Host $_ }
        throw 'git diff --check failed'
    }
}

Write-Host (
    "PHASE0_GATE PASS profile=$ProfileRoot " +
    "extended_worldgen_seeds=$ExtendedWorldgenSeeds"
)
