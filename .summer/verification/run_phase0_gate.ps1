[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$GodotConsole,

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

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}

& (Join-Path $ProjectPath (
    '.summer\tools\generate_requirement_ledger.ps1'
)) -ProjectPath $ProjectPath -Check
if ($LASTEXITCODE -notin @(0, $null)) {
    throw 'Requirement-ledger validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\tools\update_document_checksums.ps1'
)) -ProjectPath $ProjectPath -Check
if ($LASTEXITCODE -notin @(0, $null)) {
    throw 'Document-checksum validation failed'
}

& (Join-Path $ProjectPath (
    '.summer\verification\run_current_regression_gate.ps1'
)) -GodotConsole $GodotConsole `
    -ProjectPath $ProjectPath `
    -ProfileRoot $ProfileRoot `
    -ExtendedWorldgenSeeds $ExtendedWorldgenSeeds
if ($LASTEXITCODE -notin @(0, $null)) {
    throw 'Current regression gate failed'
}

if (Test-Path -LiteralPath (Join-Path $ProjectPath '.git')) {
    $diffCheck = & git -C $ProjectPath diff --check 2>&1
    if ($LASTEXITCODE -ne 0) {
        $diffCheck | ForEach-Object { Write-Host $_ }
        throw 'git diff --check failed'
    }
}

Write-Host (
    "PHASE0_GATE PASS profile=$ProfileRoot " +
    "extended_worldgen_seeds=$ExtendedWorldgenSeeds"
)
