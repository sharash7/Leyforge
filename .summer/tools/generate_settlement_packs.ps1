param(
    [string]$BlueprintPath = "data/settlement/settlement_blueprints.json",
    [string]$OutputPath = "data/settlement/settlement_packs.json"
)

$ErrorActionPreference = "Stop"

function New-Pack {
    param(
        [string]$Id,
        [string]$Layer,
        [int]$Priority,
        [array]$Dependencies,
        [hashtable]$Palette,
        [array]$BlueprintIds,
        [array]$RuntimeRequirements = @(),
        [bool]$Optional = $true
    )
    return [ordered]@{
        id = $Id
        namespace = $Id
        version = 1
        type = $Layer
        priority = $Priority
        dependencies = [object[]]@($Dependencies)
        optional = $Optional
        compatibility = [ordered]@{
            registry_schema = 1
            catalogue_version = "20H-v0.1"
        }
        runtime_requirements = [object[]]@($RuntimeRequirements)
        palette = $Palette
        blueprint_ids = [object[]]@($BlueprintIds)
        allowed_overrides = @(
            "palette",
            "blueprint_pool",
            "layout_preference",
            "ownership",
            "faith_symbols",
            "history_state"
        )
    }
}

$blueprints = (Get-Content -LiteralPath $BlueprintPath -Raw |
    ConvertFrom-Json).blueprints
$protectedNumbers = @(1,2,3,5,6,7,11,13,14,15,21,25,31,35,41,42,43,51,52,56,61,71,72,73,74,81,82,85,88,91)
$protectedBlueprintIds = @(
    foreach ($number in $protectedNumbers) {
        if ($number -eq 6) { "bp.building.cottage_forest_small" }
        elseif ($number -eq 72) { "bp.building.watchtower_wood" }
        else { "bp.catalogue.$('{0:d3}' -f $number)" }
    }
)
foreach ($blueprintId in $protectedBlueprintIds) {
    if ($blueprintId -notin $blueprints.id) {
        throw "Protected pack references missing blueprint $blueprintId."
    }
}

$neutral = @{
    foundation_primary = "construction.brick.stone"
    structural_beam = "construction.beam.oak"
    wall_primary = "construction.planks.oak"
    roof_primary = "construction.roof.thatch"
    door_basic = "construction.door.oak"
    functional = "light.torch.basic"
    path_primary = "road.path.dirt"
}
$packs = @(
    (New-Pack "pack.foundation.forest_neutral_poc" "universal" 0 @() $neutral $protectedBlueprintIds @() $false),
    (New-Pack "pack.culture.riverward_frontier" "regional_subculture" 100 @("pack.foundation.forest_neutral_poc") @{
        roof_primary = "construction.roof.thatch"
        foundation_primary = "construction.cobble.stone"
    } @()),
    (New-Pack "pack.biome.temperate_forest_river" "biome" 200 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "terrain.mossy_stone.cave"
        path_primary = "road.path.dirt"
    } @()),
    (New-Pack "pack.faction.briarhook_raiders" "faction_government_faith" 300 @("pack.foundation.forest_neutral_poc") @{
        wall_primary = "defence.barricade.wood"
        structural_beam = "defence.palisade.wood"
    } @()),
    (New-Pack "pack.faction.regional_march_authority" "faction_government_faith" 310 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "construction.brick.stone"
        wall_primary = "construction.wall.stone"
    } @()),
    (New-Pack "pack.culture.emberhold" "culture" 110 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "terrain.basalt.basic"
        wall_primary = "construction.brick.clay"
        roof_primary = "construction.roof.tile_clay"
    } @()),
    (New-Pack "pack.culture.goblin_tinker" "culture" 120 @("pack.foundation.forest_neutral_poc") @{
        functional = "magic.engine.rune"
        wall_primary = "construction.cobble.stone"
        roof_primary = "construction.planks.oak"
    } @()),
    (New-Pack "pack.culture.pastoral_mobile" "culture" 130 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "terrain.dirt.basic"
        wall_primary = "construction.roof.thatch"
        roof_primary = "construction.roof.thatch"
    } @()),
    (New-Pack "pack.culture.aquatic_wetland" "culture" 140 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "construction.pillar.stone"
        wall_primary = "construction.planks.oak"
        path_primary = "construction.planks.oak"
    } @()),
    (New-Pack "pack.biome.dryland" "biome" 210 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "terrain.sand.basic"
        wall_primary = "construction.brick.clay"
        roof_primary = "construction.roof.tile_clay"
    } @()),
    (New-Pack "pack.biome.frost" "biome" 220 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "terrain.ice.basic"
        wall_primary = "construction.wall.stone"
        roof_primary = "terrain.snow.basic"
    } @()),
    (New-Pack "pack.biome.swamp" "biome" 230 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "terrain.mossy_stone.cave"
        wall_primary = "construction.planks.oak"
        path_primary = "terrain.mud.basic"
    } @()),
    (New-Pack "pack.biome.mountain" "biome" 240 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "terrain.granite.basic"
        wall_primary = "construction.wall.stone"
        roof_primary = "construction.roof.tile_clay"
    } @()),
    (New-Pack "pack.government.village_council" "faction_government_faith" 320 @("pack.foundation.forest_neutral_poc") @{} @()),
    (New-Pack "pack.government.merchant_league" "faction_government_faith" 321 @("pack.foundation.forest_neutral_poc") @{
        functional = "village.market_stall.basic"
    } @()),
    (New-Pack "pack.faith.hearth_spirits" "faction_government_faith" 330 @("pack.foundation.forest_neutral_poc") @{
        functional = "magic.ritual_anchor.basic"
    } @()),
    (New-Pack "pack.faith.verdant_path" "faction_government_faith" 331 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "realm.fae_grass.basic"
    } @()),
    (New-Pack "pack.occupation.frontier_builders" "history_state" 500 @("pack.foundation.forest_neutral_poc") @{
        functional = "village.supply_crate.construction"
    } @()),
    (New-Pack "pack.occupation.arcane_artisans" "history_state" 510 @("pack.foundation.forest_neutral_poc") @{
        functional = "magic.rune_table.basic"
    } @()),
    (New-Pack "pack.diaspora.riverward_exiles" "history_state" 520 @("pack.culture.riverward_frontier") @{} @()),
    (New-Pack "pack.hybrid.ember_river" "history_state" 530 @("pack.culture.emberhold", "pack.culture.riverward_frontier") @{
        wall_primary = "construction.brick.clay"
        roof_primary = "construction.roof.thatch"
    } @()),
    (New-Pack "pack.realm_access.portal_network" "history_state" 540 @("pack.foundation.forest_neutral_poc") @{} @() @(
        "building.magic.portal_station_sanctum"
    )),
    (New-Pack "pack.realm.verdant_covenant" "realm" 400 @("pack.realm_access.portal_network", "pack.faith.verdant_path") @{
        foundation_primary = "realm.fae_grass.basic"
        wall_primary = "realm.celestial_stone.basic"
        functional = "magic.portal_frame.ancient"
    } @() @(
        "building.magic.portal_station_sanctum",
        "project.megaproject.city_ward_portal_nexus"
    )),
    (New-Pack "pack.history.rebuilt_after_raid" "history_state" 550 @("pack.foundation.forest_neutral_poc") @{
        wall_primary = "construction.cobble.stone"
    } @()),
    (New-Pack "pack.player_style.approved_stonewood" "player_style" 600 @("pack.foundation.forest_neutral_poc") @{
        foundation_primary = "construction.brick.stone"
        wall_primary = "construction.planks.oak"
        roof_primary = "construction.roof.tile_clay"
    } @())
)

$root = [ordered]@{
    schema = "leyforge.settlement.packs"
    schema_version = 1
    resolution_order = @(
        "universal",
        "blueprint_archetype",
        "culture",
        "regional_subculture",
        "biome",
        "faction_government_faith",
        "realm",
        "history_state",
        "player_style"
    )
    packs = $packs
}
$root | ConvertTo-Json -Depth 30 |
    Set-Content -LiteralPath $OutputPath -Encoding utf8
Write-Output "Generated $($packs.Count) deterministic settlement content packs."
