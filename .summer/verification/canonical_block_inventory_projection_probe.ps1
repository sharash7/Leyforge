[CmdletBinding()]
param(
    [string]$ProjectPath = ''
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}

$expectedAliases = [ordered]@{
    'item.resource.log_oak' = @('natural.log.oak', 142)
    'item.resource.sand' = @('terrain.sand.basic', 149)
    'item.material.plank_oak' = @('construction.planks.oak', 167)
    'item.material.beam_oak' = @('construction.beam.oak', 168)
    'item.material.cobblestone' = @('construction.cobble.stone', 169)
    'item.material.stone_brick' = @('construction.brick.stone', 170)
    'item.material.roof_tile_clay' = @('construction.roof.tile_clay', 224)
}
$probeState = @{
    failures = [System.Collections.Generic.List[string]]::new()
    checks = 0
}

function Assert-Projection {
    param([bool]$Condition, [string]$Failure)
    $probeState.checks = [int]$probeState.checks + 1
    if (-not $Condition) {
        $probeState.failures.Add($Failure)
    }
}

$registryPath = Join-Path $ProjectPath 'data\registry\voxel_registry.json'
$registry = [IO.File]::ReadAllText($registryPath) | ConvertFrom-Json
Assert-Projection ($registry.Count -eq 312) `
    'registry record count changed; aliases must reserve existing identities'
Assert-Projection (
    @($registry | Where-Object { $_.type -eq 'block' }).Count -eq 143
) 'canonical block count must remain 143'
Assert-Projection (
    @($registry | Where-Object { $_.type -eq 'item' }).Count -eq 162
) 'active canonical item count must be 162 after retiring seven proxies'
Assert-Projection (
    @($registry | Where-Object { $_.type -eq 'alias' }).Count -eq 7
) 'registry must contain exactly seven retained Block projection aliases'

foreach ($legacyId in $expectedAliases.Keys) {
    $replacement = [string]($expectedAliases[$legacyId][0])
    $numericId = [int]($expectedAliases[$legacyId][1])
    $matches = @($registry | Where-Object { $_.original_id -eq $legacyId })
    Assert-Projection ($matches.Count -eq 1) `
        "legacy stable ID must remain reserved exactly once: $legacyId"
    if ($matches.Count -ne 1) { continue }
    $entry = $matches[0]
    Assert-Projection ([int]$entry.numeric_id -eq $numericId) `
        "legacy numeric ID changed for $legacyId"
    Assert-Projection ([string]$entry.type -eq 'alias') `
        "legacy proxy remains an active canonical Item: $legacyId"
    Assert-Projection ([string]$entry.lifecycle_status -eq 'retired_alias') `
        "legacy proxy lacks retired_alias lifecycle: $legacyId"
    Assert-Projection ([string]$entry.replacement_kind -eq 'block') `
        "legacy proxy replacement kind is not block: $legacyId"
    Assert-Projection ([string]$entry.replacement_stable_id -eq $replacement) `
        "legacy proxy has wrong Block replacement: $legacyId"
}

$migrationRegisterPath = Join-Path $ProjectPath (
    'content\forge\migration\registry_migration_register.json')
$migrationRegister = [IO.File]::ReadAllText($migrationRegisterPath) |
    ConvertFrom-Json
$migrationRecords = @($migrationRegister.records)
foreach ($legacyId in $expectedAliases.Keys) {
    $replacement = [string]($expectedAliases[$legacyId][0])
    $matches = @($migrationRecords | Where-Object {
        $_.gameplay_id -eq $legacyId
    })
    Assert-Projection ($matches.Count -eq 1) `
        "Forge migration alias is not reserved exactly once: $legacyId"
    if ($matches.Count -ne 1) { continue }
    $entry = $matches[0]
    Assert-Projection ([string]$entry.classification -eq 'retired_alias') `
        "Forge migration record has wrong classification: $legacyId"
    Assert-Projection ([string]$entry.current_source -eq 'registry_alias') `
        "Forge migration alias still claims an independent source: $legacyId"
    Assert-Projection (
        [string]$entry.legacy_deprecation_state -eq 'retired_alias'
    ) "Forge migration record still marks proxy active: $legacyId"
    Assert-Projection ([string]$entry.owner -eq $replacement) `
        "Forge migration alias has wrong canonical owner: $legacyId"
    Assert-Projection ([string]$entry.replacement_gameplay_id -eq $replacement) `
        "Forge migration alias has wrong replacement: $legacyId"
    Assert-Projection ([string]$entry.target_forge_mode -eq 'alias') `
        "Forge migration alias still requests independent authoring: $legacyId"
}

$scanPaths = @(
    'scripts\autoload\recipe_registry.gd',
    'scripts\autoload\combat_state.gd',
    'scripts\world\voxel_world.gd',
    'data\settlement\settlement_projects.json',
    'data\settlement\settlement_plans.json',
    'data\settlement\settlement_behaviors.json'
)
foreach ($relativePath in $scanPaths) {
    $text = [IO.File]::ReadAllText((Join-Path $ProjectPath $relativePath))
    foreach ($legacyId in $expectedAliases.Keys) {
        Assert-Projection (-not $text.Contains($legacyId)) `
            "active authored content still references $legacyId in $relativePath"
    }
}

$itemRegistryText = [IO.File]::ReadAllText((Join-Path $ProjectPath (
    'scripts\autoload\item_registry.gd')))
Assert-Projection (-not $itemRegistryText.Contains('var item_to_block')) `
    'ItemRegistry still contains the duplicate Item-to-Block placement workaround'

$mainText = [IO.File]::ReadAllText((Join-Path $ProjectPath 'scripts\main.gd'))
$worldManagerText = [IO.File]::ReadAllText((Join-Path $ProjectPath (
    'scripts\autoload\world_manager.gd')))
Assert-Projection ($mainText -match 'const SAVE_VERSION := 18\b') `
    'save format was not advanced to v18 for canonical projection migration'
Assert-Projection ($worldManagerText -match 'const CURRENT_SAVE_VERSION := 18\b') `
    'world metadata save version was not advanced to v18'

$result = [ordered]@{
    ok = $probeState.failures.Count -eq 0
    checks = $probeState.checks
    aliases = $expectedAliases.Count
    registry_records = $registry.Count
    failures = @($probeState.failures)
}
Write-Host ('CANONICAL_BLOCK_INVENTORY_PROJECTION_PROBE ' + (
    $result | ConvertTo-Json -Compress))
if ($probeState.failures.Count -gt 0) {
    exit 1
}
