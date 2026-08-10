[CmdletBinding()]
param([string]$ProjectPath = '')

$ErrorActionPreference = 'Stop'
if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}

$checks = 0
$failures = [System.Collections.Generic.List[string]]::new()

function Assert-ArchiveIsolation {
    param([bool]$Condition, [string]$Failure)
    $script:checks += 1
    if (-not $Condition) {
        $script:failures.Add($Failure)
    }
}

function Read-ProjectText {
    param([string]$RelativePath)
    $path = Join-Path $ProjectPath $RelativePath
    Assert-ArchiveIsolation (Test-Path -LiteralPath $path -PathType Leaf) `
        "archive-isolation input is missing: $RelativePath"
    if (-not (Test-Path -LiteralPath $path -PathType Leaf)) {
        return ''
    }
    return [IO.File]::ReadAllText($path)
}

$worldManager = Read-ProjectText 'scripts\autoload\world_manager.gd'
$planner = Read-ProjectText 'scripts\world\world_structure_planner.gd'
$menu = Read-ProjectText 'scripts\ui\main_menu.gd'
$main = Read-ProjectText 'scripts\main.gd'
$release = Read-ProjectText 'scripts\autoload\release_quality.gd'
$placements = Read-ProjectText 'data\worldgen\structure_placement.json'

Assert-ArchiveIsolation ($worldManager -match
    'const PROFILE_ID := "world\.profile\.living_frontier_regional"') `
    'new worlds do not use the production Living Frontier profile ID'
Assert-ArchiveIsolation ($worldManager -match
    'const LEGACY_PROFILE_ID := "world\.profile\.controlled_poc_valley"') `
    'legacy valley profile alias was removed'
Assert-ArchiveIsolation ($planner -match
    'const PROFILE_ID := "world\.profile\.living_frontier_regional"') `
    'regional planner does not emit the production Living Frontier profile ID'
Assert-ArchiveIsolation ($planner -match
    'const LEGACY_REGIONAL_PROFILE_ID := "world\.profile\.controlled_poc_regional"') `
    'regional plan-v3 compatibility identity was removed'
Assert-ArchiveIsolation ($planner -match
    'plan_version == LEGACY_VERSION and LEGACY_CONTENT_TEMPLATES\.has\(type_id\)') `
    'plan-v3 archived template reconstruction is not explicitly version-gated'
Assert-ArchiveIsolation ($menu -notmatch 'Controlled POC Valley') `
    'main menu exposes a retired POC world identity'
Assert-ArchiveIsolation ($menu -match 'Seeded Living Frontier') `
    'main menu does not describe the production generated-world profile'
Assert-ArchiveIsolation ($main -match
    'const SAVE_FORMAT := "leyforge\.world\.save"') `
    'new saves retain the retired leyforge.poc.save format label'
Assert-ArchiveIsolation ($release -match
    'const BUILD_STAGE := "production_foundation"') `
    'build metadata retains the post-POC development label'
Assert-ArchiveIsolation ($placements -notmatch
    '"content_template"\s*:\s*"[^"]*\.poc"') `
    'production placement rules reference a .poc content template'
Assert-ArchiveIsolation ($placements -match
    '"content_template"\s*:\s*"world\.structure\.raider_camp\.frontier"') `
    'production raider-camp content template is absent'

$result = [ordered]@{
    ok = $failures.Count -eq 0
    checks = $checks
    failures = @($failures)
}
Write-Host "POC_ARCHIVE_ISOLATION_PROBE $($result | ConvertTo-Json -Compress)"
if ($failures.Count -gt 0) {
    exit 1
}
