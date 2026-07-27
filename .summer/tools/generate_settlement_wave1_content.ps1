param(
    [string]$CataloguePath = "data/settlement/settlement_catalogue.json",
    [string]$BlueprintPath = "data/settlement/settlement_blueprints.json",
    [string]$ProjectPath = "data/settlement/settlement_projects.json",
    [string]$PackPath = "data/settlement/settlement_packs.json",
    [string]$BehaviorPath = "data/settlement/settlement_behaviors.json"
)

$ErrorActionPreference = "Stop"

function New-Operation {
    param(
        [string]$Operation,
        [string]$Token,
        [hashtable]$Properties
    )

    $result = [ordered]@{ op = $Operation }
    foreach ($key in $Properties.Keys) { $result[$key] = $Properties[$key] }
    $result.token = $Token
    return $result
}

function New-Requirement {
    param([string]$StableId, [int]$Count)

    return [ordered]@{
        kind = "block"
        stable_id = $StableId
        count = $Count
    }
}

function New-Recipe {
    param(
        [string]$Id,
        [int]$CycleMinutes,
        [array]$Inputs,
        [array]$Outputs
    )

    return [ordered]@{
        id = $Id
        cycle_minutes = $CycleMinutes
        inputs = @($Inputs)
        outputs = @($Outputs)
        minimum_staffing = 0.5
    }
}

function New-ItemAmount {
    param([string]$StableId, [int]$Count)

    return [ordered]@{
        kind = "item"
        stable_id = $StableId
        count = $Count
    }
}

function Get-ProductionRecipes {
    param([string]$StableId)

    switch -Regex ($StableId) {
        'basic_farm_plot' {
            return @((New-Recipe "recipe.settlement.gather_berries" 360 @() @(
                (New-ItemAmount "item.food.wild_berries" 4))))
        }
        'farmhouse' {
            return @((New-Recipe "recipe.settlement.farmstead_provisions" 480 @() @(
                (New-ItemAmount "item.food.wild_berries" 3))))
        }
        'communal_kitchen' {
            return @((New-Recipe "recipe.settlement.village_meal" 180 @(
                (New-ItemAmount "item.food.wild_berries" 2)) @(
                (New-ItemAmount "item.food.village_meal_pack" 1))))
        }
        'lumber_camp' {
            return @((New-Recipe "recipe.settlement.oak_logs" 240 @() @(
                (New-ItemAmount "item.resource.log_oak" 2))))
        }
        'mine_entrance' {
            return @((New-Recipe "recipe.settlement.stone_extraction" 240 @() @(
                (New-ItemAmount "item.resource.stone_chunk" 2),
                (New-ItemAmount "item.resource.raw_iron_ore" 1))))
        }
        'carpenter_workshop' {
            return @((New-Recipe "recipe.settlement.oak_planks" 180 @(
                (New-ItemAmount "item.resource.log_oak" 1)) @(
                (New-ItemAmount "item.material.plank_oak" 4))))
        }
        'mason_yard' {
            return @((New-Recipe "recipe.settlement.stone_brick" 180 @(
                (New-ItemAmount "item.resource.stone_chunk" 2)) @(
                (New-ItemAmount "item.material.stone_brick" 1))))
        }
        'village_blacksmith' {
            return @((New-Recipe "recipe.settlement.iron_ingot" 240 @(
                (New-ItemAmount "item.resource.raw_iron_ore" 2)) @(
                (New-ItemAmount "item.material.iron_ingot" 1))))
        }
        'mage_hut_rune_workshop' {
            return @((New-Recipe "recipe.settlement.mana_dust" 360 @(
                (New-ItemAmount "item.resource.raw_mana_crystal" 1)) @(
                (New-ItemAmount "item.resource.mana_dust" 2))))
        }
        '(irrigated|terraced|automated_farm|greenhouse|fishery)' {
            return @((New-Recipe "recipe.settlement.advanced_provisions" 300 @() @(
                (New-ItemAmount "item.food.wild_berries" 6))))
        }
        '(grain_mill|millhouse|bakery|food_workshop)' {
            return @((New-Recipe "recipe.settlement.bread" 240 @(
                (New-ItemAmount "item.food.wild_berries" 2)) @(
                (New-ItemAmount "item.food.bread" 2))))
        }
        '(sawmill|managed_forestry)' {
            return @((New-Recipe "recipe.settlement.managed_timber" 180 @() @(
                (New-ItemAmount "item.resource.log_oak" 3))))
        }
        '(quarry|deep_mine|excavation)' {
            return @((New-Recipe "recipe.settlement.deep_extraction" 180 @() @(
                (New-ItemAmount "item.resource.stone_chunk" 3),
                (New-ItemAmount "item.resource.raw_iron_ore" 2))))
        }
        '(mana_extraction|leyline_observatory)' {
            return @((New-Recipe "recipe.settlement.mana_extraction" 300 @() @(
                (New-ItemAmount "item.resource.raw_mana_crystal" 1))))
        }
        '(furniture|carpenter|joiner)' {
            return @((New-Recipe "recipe.settlement.advanced_woodwork" 180 @(
                (New-ItemAmount "item.resource.log_oak" 1)) @(
                (New-ItemAmount "item.material.plank_oak" 4),
                (New-ItemAmount "item.material.beam_oak" 1))))
        }
        '(stoneworks|mason|brick|glass)' {
            return @((New-Recipe "recipe.settlement.advanced_masonry" 180 @(
                (New-ItemAmount "item.resource.stone_chunk" 2)) @(
                (New-ItemAmount "item.material.stone_brick" 2))))
        }
        '(smelter|furnace|blacksmith|metalworks)' {
            return @((New-Recipe "recipe.settlement.advanced_metalwork" 180 @(
                (New-ItemAmount "item.resource.raw_iron_ore" 2)) @(
                (New-ItemAmount "item.material.iron_ingot" 1),
                (New-ItemAmount "item.material.iron_plate" 1))))
        }
        '(machine|factory|assembly|golem_workshop)' {
            return @((New-Recipe "recipe.settlement.machine_components" 360 @(
                (New-ItemAmount "item.material.iron_ingot" 2)) @(
                (New-ItemAmount "item.component.iron_gear" 1))))
        }
    }
    return @()
}

function New-BehaviorRecord {
    param($Definition)

    $id = [string]$Definition.id
    $number = [int]$Definition.catalogue_no
    $needCapacity = [ordered]@{}
    $baseCapacity = [math]::Max(1.0, [double]$Definition.capacity.base)
    $needCapacity[[string]$Definition.primary_need] = $baseCapacity
    foreach ($secondaryNeed in @($Definition.secondary_needs)) {
        $needCapacity[[string]$secondaryNeed] = [math]::Max(
            0.25, [math]::Round($baseCapacity * 0.35, 2))
    }
    $storageCapacity = 0
    if ($id -match '(warehouse|storehouse|granary|barn|trading_post|builder_supply)') {
        $storageCapacity = [math]::Max(64, [int]($baseCapacity * 64))
    }
    $networkRoles = @()
    if ($id -match '(path|road|junction)') { $networkRoles += "road" }
    if ($id -match '(well|water)') { $networkRoles += "water" }
    if ($id -match '(palisade|gate|guard|watchtower)') { $networkRoles += "defence" }
    if ($id -match '(market|trading)') { $networkRoles += "trade" }
    if ($id -match '(hall|school)') { $networkRoles += "civic" }
    if ($id -match '(magic|mage|rune)') { $networkRoles += "mana" }
    if ($id -match '(power|generator|waterwind|steam|grid)') { $networkRoles += "power" }
    if ($id -match '(sanitation|waste|sewer|aqueduct|pump)') { $networkRoles += "utility" }
    if ($id -match '(logistics|conveyor|cart|rail|transit|portal)') { $networkRoles += "logistics" }
    if ($id -match '(school|academy|university|library)') { $networkRoles += "education" }
    if ($id -match '(health|healer|clinic|hospital|cleansing)') { $networkRoles += "health" }
    return [ordered]@{
        id = "behavior.catalogue.$('{0:d3}' -f $number)"
        definition_id = $id
        min_stage = [string]$Definition.min_stage
        need_capacity = $needCapacity
        housing_capacity = $(if ($Definition.primary_need -eq "housing") { [int][math]::Max(1, $baseCapacity) } else { 0 })
        job_slots = [math]::Max(0, @($Definition.jobs).Count)
        storage_capacity = $storageCapacity
        network_roles = @($networkRoles | Select-Object -Unique)
        capabilities = @($Definition.capabilities)
        recipes = @(Get-ProductionRecipes $id)
        required_inputs = @($Definition.inputs)
        service_outputs = @($Definition.outputs)
        failure_rules = [string]$Definition.planner.triggers_and_failures
        activation_requires_access = @($Definition.utility_requirements) -contains "road_access"
        near_far_kernel = "settlement.fixed_step.v1"
    }
}

function Merge-Requirements {
    param([array]$Requirements)

    $totals = [ordered]@{}
    foreach ($requirement in $Requirements) {
        $key = "$($requirement.kind):$($requirement.stable_id)"
        if (-not $totals.Contains($key)) {
            $totals[$key] = [ordered]@{
                kind = [string]$requirement.kind
                stable_id = [string]$requirement.stable_id
                count = 0
            }
        }
        $totals[$key].count += [int]$requirement.count
    }
    return @($totals.Values)
}

function Get-FunctionalBlock {
    param([string]$StableId)

    if ($StableId -match 'builder_supply') { return "village.supply_crate.construction" }
    if ($StableId -match 'blacksmith') { return "functional.furnace.stone" }
    if ($StableId -match '(carpenter|mason|school)') { return "functional.workbench.basic" }
    if ($StableId -match 'market_stalls') { return "village.market_stall.basic" }
    if ($StableId -match '(warehouse|trading_post)') { return "storage.chest.wood" }
    if ($StableId -match '(storage|storehouse|granary|barn)') { return "storage.crate.wood" }
    if ($StableId -match '(magic|mage|rune)') { return "magic.rune_table.basic" }
    return "light.torch.basic"
}

function Get-FootprintSize {
    param([string]$MinimumStage, [double]$Capacity)

    if ($MinimumStage -eq 'camp') { return 3 }
    if ($MinimumStage -eq 'hamlet' -or $Capacity -le 6) { return 5 }
    return 7
}

function New-Markers {
    param([array]$Types, [int]$Width, [int]$Depth)

    $markers = @()
    $index = 0
    foreach ($rawType in $Types) {
        $type = [string]$rawType
        if (-not $type) { continue }
        $x = -[math]::Floor($Width / 2) + ($index % $Width)
        $z = -[math]::Floor($Depth / 2) + ([math]::Floor($index / $Width) % $Depth)
        $markers += [ordered]@{
            id = "marker_$('{0:d2}' -f ($index + 1))"
            type = $type
            position = @([int]$x, 1, [int]$z)
        }
        $index += 1
    }
    if ($markers.Count -eq 0) {
        $markers += [ordered]@{
            id = "marker_service"
            type = "service_point"
            position = @(0, 1, 0)
        }
    }
    return @($markers)
}

function Merge-PhaseGroup {
    param([array]$Phases, [string]$Id, [string]$Name)

    $operations = @()
    $requirements = @()
    foreach ($phase in $Phases) {
        $operations += @($phase.operations)
        $requirements += @($phase.requirements)
    }
    return [ordered]@{
        id = $Id
        display_name = $Name
        operations = @($operations)
        requirements = @(Merge-Requirements $requirements)
    }
}

function Convert-PhasesToStages {
    param([array]$Phases, [int]$RequestedCount)

    $count = [math]::Max(2, [math]::Min(5, $RequestedCount))
    if ($count -eq 5) { return @($Phases) }
    if ($count -eq 4) {
        return @(
            $Phases[0],
            $Phases[1],
            (Merge-PhaseGroup @($Phases[2], $Phases[3]) "shell_weatherproofing" "Shell and Weatherproofing"),
            $Phases[4]
        )
    }
    if ($count -eq 3) {
        return @(
            $Phases[0],
            (Merge-PhaseGroup @($Phases[1], $Phases[2], $Phases[3]) "structure" "Structure and Weatherproofing"),
            $Phases[4]
        )
    }
    return @(
        (Merge-PhaseGroup @($Phases[0], $Phases[1], $Phases[2], $Phases[3]) "site_and_structure" "Site and Structure"),
        $Phases[4]
    )
}

function New-StructurePhases {
    param([int]$Width, [int]$Depth, [string]$FunctionalBlock)

    $halfWidth = [math]::Floor($Width / 2)
    $halfDepth = [math]::Floor($Depth / 2)
    $foundationCount = $Width * $Depth
    $perimeter = (2 * $Width) + (2 * $Depth) - 4
    $exclude = @()
    foreach ($x in @(-$halfWidth, $halfWidth)) {
        foreach ($z in @(-$halfDepth, $halfDepth)) {
            $exclude += ,@([int]$x, 1, [int]$z)
            $exclude += ,@([int]$x, 2, [int]$z)
        }
    }
    $exclude += ,@(0, 1, -[int]$halfDepth)
    return @(
        [ordered]@{
            id = "foundation"
            display_name = "Foundation"
            operations = @(
                (New-Operation "fill" "foundation_primary" @{
                    origin = @(-[int]$halfWidth, 0, -[int]$halfDepth)
                    size = @($Width, 1, $Depth)
                })
            )
            requirements = @(
                (New-Requirement "construction.brick.stone" $foundationCount)
            )
        },
        [ordered]@{
            id = "frame"
            display_name = "Structural Frame"
            operations = @(
                (New-Operation "pillar" "structural_beam" @{ origin = @(-[int]$halfWidth, 1, -[int]$halfDepth); height = 3 }),
                (New-Operation "pillar" "structural_beam" @{ origin = @([int]$halfWidth, 1, -[int]$halfDepth); height = 3 }),
                (New-Operation "pillar" "structural_beam" @{ origin = @(-[int]$halfWidth, 1, [int]$halfDepth); height = 3 }),
                (New-Operation "pillar" "structural_beam" @{ origin = @([int]$halfWidth, 1, [int]$halfDepth); height = 3 })
            )
            requirements = @((New-Requirement "construction.beam.oak" 12))
        },
        [ordered]@{
            id = "shell"
            display_name = "Walls and Access"
            operations = @(
                (New-Operation "perimeter" "wall_primary" @{
                    origin = @(-[int]$halfWidth, 1, -[int]$halfDepth)
                    size = @($Width, 2, $Depth)
                    exclude = $exclude
                }),
                (New-Operation "point" "door_basic" @{ position = @(0, 1, -[int]$halfDepth) })
            )
            requirements = @(
                (New-Requirement "construction.planks.oak" (($perimeter * 2) - 9)),
                (New-Requirement "construction.door.oak" 1)
            )
        },
        [ordered]@{
            id = "weatherproofing"
            display_name = "Roof and Weatherproofing"
            operations = @(
                (New-Operation "fill" "roof_primary" @{
                    origin = @(-[int]$halfWidth, 4, -[int]$halfDepth)
                    size = @($Width, 1, $Depth)
                })
            )
            requirements = @(
                (New-Requirement "construction.planks.oak" $foundationCount)
            )
        },
        [ordered]@{
            id = "activation"
            display_name = "Functional Installation and Inspection"
            operations = @(
                (New-Operation "point" "functional" @{ position = @(0, 1, 0) })
            )
            requirements = @((New-Requirement $FunctionalBlock 1))
        }
    )
}

function New-NetworkPhases {
    param([string]$StableId)

    if ($StableId -match 'palisade') {
        return @(
            [ordered]@{
                id = "footings"
                display_name = "Palisade Footings"
                operations = @((New-Operation "line" "foundation_primary" @{ origin = @(-3, 0, 0); axis = "x"; length = 7 }))
                requirements = @((New-Requirement "construction.brick.stone" 7))
            },
            [ordered]@{
                id = "barrier"
                display_name = "Timber Barrier"
                operations = @(
                    (New-Operation "line" "structural_beam" @{ origin = @(-3, 1, 0); axis = "x"; length = 7 }),
                    (New-Operation "line" "structural_beam" @{ origin = @(-3, 2, 0); axis = "x"; length = 7 }),
                    (New-Operation "line" "structural_beam" @{ origin = @(-3, 3, 0); axis = "x"; length = 7 })
                )
                requirements = @((New-Requirement "construction.beam.oak" 21))
            }
        )
    }
    return @(
        [ordered]@{
            id = "route"
            display_name = "Dirt Path and Junction"
            operations = @(
                (New-Operation "line" "path_primary" @{ origin = @(-3, 0, 0); axis = "x"; length = 7 }),
                (New-Operation "line" "path_primary" @{ origin = @(0, 0, -3); axis = "z"; length = 7 })
            )
            requirements = @((New-Requirement "road.path.dirt" 13))
        }
    )
}

$catalogue = Get-Content -LiteralPath $CataloguePath -Raw | ConvertFrom-Json
$existingBlueprintRoot = Get-Content -LiteralPath $BlueprintPath -Raw | ConvertFrom-Json
$existingProjectRoot = Get-Content -LiteralPath $ProjectPath -Raw | ConvertFrom-Json

$blueprints = [System.Collections.ArrayList]::new()
foreach ($id in @("bp.building.watchtower_wood", "bp.building.cottage_forest_small")) {
    $record = $existingBlueprintRoot.blueprints | Where-Object id -eq $id | Select-Object -First 1
    if ($null -eq $record) { throw "Missing authored Wave 0 blueprint $id." }
    [void]$blueprints.Add($record)
}
$projects = [System.Collections.ArrayList]::new()
foreach ($id in @("project.build.wooden_watchtower", "project.build.small_cottage")) {
    $record = $existingProjectRoot.projects | Where-Object id -eq $id | Select-Object -First 1
    if ($null -eq $record) { throw "Missing authored Wave 0 project $id." }
    [void]$projects.Add($record)
}
$behaviors = [System.Collections.ArrayList]::new()

$allDefinitions = @($catalogue.definitions)
$protectedDefinitions = @($allDefinitions | Where-Object scope -eq "poc_required")
foreach ($definition in $allDefinitions) {
    $number = [int]$definition.catalogue_no
    if ($number -in @(6, 72)) { continue }
    $id = [string]$definition.id
    $blueprintId = "bp.catalogue.$('{0:d3}' -f $number)"
    $projectId = "project.build.catalogue_$('{0:d3}' -f $number)"
    $capacity = [double]$definition.capacity.base
    $width = Get-FootprintSize ([string]$definition.min_stage) $capacity
    $depth = $width
    $functionalBlock = Get-FunctionalBlock $id
    $isNetwork = [string]$definition.kind -eq "project"
    if ($isNetwork) {
        $phases = @(New-NetworkPhases $id)
        $width = 7
        $depth = $(if ($id -match 'palisade') { 1 } else { 7 })
    } elseif ($id -eq "building.temporary.campfire_site") {
        $phases = @(
            [ordered]@{
                id = "cleared_site"
                display_name = "Cleared Site"
                operations = @((New-Operation "fill" "path_primary" @{ origin = @(-1, 0, -1); size = @(3, 1, 3) }))
                requirements = @((New-Requirement "road.path.dirt" 9))
            },
            [ordered]@{
                id = "hearth"
                display_name = "Hearth and Fire Ring"
                operations = @(
                    (New-Operation "perimeter" "foundation_primary" @{ origin = @(-1, 1, -1); size = @(3, 1, 3) }),
                    (New-Operation "point" "functional" @{ position = @(0, 1, 0) })
                )
                requirements = @(
                    (New-Requirement "construction.brick.stone" 8),
                    (New-Requirement $functionalBlock 1)
                )
            }
        )
        $width = 3
        $depth = 3
    } else {
        $basePhases = @(New-StructurePhases $width $depth $functionalBlock)
        $requestedStages = [int]$definition.construction.stage_count
        if ($requestedStages -le 0) { $requestedStages = 4 }
        $phases = @(Convert-PhasesToStages $basePhases $requestedStages)
    }

    $markerTypes = @($definition.required_markers)
    $markers = @(New-Markers $markerTypes $width $depth)
    $halfWidth = [math]::Floor($width / 2)
    $halfDepth = [math]::Floor($depth / 2)
    $blueprint = [ordered]@{
        id = $blueprintId
        version = 1
        building_ids = @($(if ($definition.kind -eq "building") { $id }))
        definition_ids = @($id)
        display_name = "$($definition.display_name) - Forest Neutral"
        bounds = [ordered]@{
            min = @(-[int]$halfWidth, 0, -[int]$halfDepth)
            max = @([int]$halfWidth, 5, [int]$halfDepth)
        }
        pivot = @(0, 0, 0)
        palette = [ordered]@{
            foundation_primary = "construction.brick.stone"
            structural_beam = "construction.beam.oak"
            wall_primary = "construction.planks.oak"
            roof_primary = "construction.planks.oak"
            door_basic = "construction.door.oak"
            functional = $functionalBlock
            path_primary = "road.path.dirt"
        }
        stages = @(
            $phases | ForEach-Object {
                [ordered]@{
                    id = [string]$_.id
                    operations = @($_.operations)
                }
            }
        )
        markers = $markers
        required_marker_types = @($markers | ForEach-Object { [string]$_.type } | Select-Object -Unique)
        terrain_rules = [ordered]@{
            mode = $(if ($isNetwork) { "network_fit" } else { "minor_levelling" })
            max_slope = $(if ($isNetwork) { 2 } else { 1 })
        }
        sockets = @($definition.utility_requirements)
        status = "wave$([int]$definition.release_wave)_validated_neutral"
    }
    [void]$blueprints.Add($blueprint)

    $stageIndex = 1
    $projectStages = @(
        $phases | ForEach-Object {
            $stage = [ordered]@{
                index = $stageIndex
                id = [string]$_.id
                display_name = [string]$_.display_name
                request_id = "request.settlement.$('{0:d3}' -f $number).stage.$([string]$_.id)"
                description = [string]$definition.construction.description
                reward = [math]::Max(2, [math]::Ceiling((@($_.requirements | ForEach-Object { $_.count }) | Measure-Object -Sum).Sum / 12))
                requirements = @($_.requirements)
            }
            $stageIndex += 1
            $stage
        }
    )
    $project = [ordered]@{
        id = $projectId
        aliases = @()
        catalogue_no = $number
        catalogue_definition_id = $id
        building_id = $(if ($definition.kind -eq "building") { $id } else { "" })
        blueprint_id = $blueprintId
        display_name = "$($definition.display_name) Construction"
        min_stage = [string]$definition.min_stage
        primary_need = [string]$definition.primary_need
        planner_class = [string]$definition.planner_class
        scope = [string]$definition.scope
        owner_document = [string]$definition.owner_document
        builder_job_tags = @("job.builder.basic")
        activation = [ordered]@{
            stage = [string]$phases[-1].id
            effects = @($definition.capabilities)
            partial = [bool]$definition.construction.partial_activation
        }
        stages = $projectStages
    }
    [void]$projects.Add($project)

    [void]$behaviors.Add((New-BehaviorRecord $definition))
}

foreach ($definition in $allDefinitions | Where-Object catalogue_no -in @(6, 72)) {
    [void]$behaviors.Add((New-BehaviorRecord $definition))
}

if ($blueprints.Count -ne 120 -or $projects.Count -ne 120) {
    throw "Expected 120 catalogue blueprints/projects but generated $($blueprints.Count)/$($projects.Count)."
}
if ($behaviors.Count -ne 120) {
    throw "Expected 120 behavior records but generated $($behaviors.Count)."
}

$blueprintRoot = [ordered]@{
    schema = "leyforge.settlement.blueprints"
    schema_version = 1
    blueprints = @($blueprints)
}
$projectRoot = [ordered]@{
    schema = "leyforge.settlement.projects"
    schema_version = 1
    projects = @($projects)
}
$behaviorRoot = [ordered]@{
    schema = "leyforge.settlement.behaviors"
    schema_version = 1
    fixed_step_minutes = 10
    capability_gates = [ordered]@{
        camp = @(
            "building.temporary.campfire_site",
            "building.residential.small_tent",
            "building.infrastructure.builder_supply_yard"
        )
        hamlet = @(
            "building.residential.primitive_hut",
            "building.food.basic_farm_plot",
            "building.food.communal_kitchen",
            "building.storage.small_storehouse",
            "building.utility.village_well"
        )
        village = @(
            "building.food.granary",
            "building.health.healer_hut",
            "building.governance.village_hall",
            "building.safety.wooden_watchtower",
            "building.storage.village_warehouse",
            "project.transport.dirt_path_junction_set"
        )
        fortified_village = @(
            "building.governance.blueprint_construction_office",
            "building.safety.barracks_training_yard",
            "building.safety.armoury",
            "building.storage.specialised_depot",
            "project.transport.stone_road_bridge_set",
            "project.magic.ward_stone_relay"
        )
        town = @(
            "building.residential.townhouse_shop_house",
            "building.food.preserving_house",
            "building.health.clinic_infirmary",
            "building.extraction.deep_mine_complex",
            "building.trade.covered_market_hall",
            "building.governance.town_hall",
            "project.defence.stone_wall_gatehouse",
            "building.transport.dock_harbour",
            "building.magic.ritual_circle_hall"
        )
        city = @(
            "building.residential.apartment_house",
            "building.health.hospital_complex",
            "building.education.academy_university",
            "building.governance.city_hall",
            "building.governance.embassy_diplomatic_hall",
            "building.emergency.fire_rescue_station",
            "project.utility.sanitation_waste_system",
            "building.magic.magic_academy_tower",
            "building.storage.automated_distribution_centre"
        )
        capital = @(
            "building.governance.palace_high_council",
            "building.magic.dimensional_research_containment",
            "building.power.regional_grid_control",
            "plan.complex.citadel_fortified_perimeter",
            "plan.campus.hospital_university",
            "plan.nexus.regional_logistics_transit"
        )
        magical_metropolis = @(
            "project.megaproject.city_ward_portal_nexus",
            "project.megaproject.floating_district_anchor_skyport",
            "project.wonder.culture_wonder_leyline_crown"
        )
    }
    behaviors = @($behaviors)
}
$blueprintRoot | ConvertTo-Json -Depth 30 |
    Set-Content -LiteralPath $BlueprintPath -Encoding utf8
$projectRoot | ConvertTo-Json -Depth 30 |
    Set-Content -LiteralPath $ProjectPath -Encoding utf8
$behaviorRoot | ConvertTo-Json -Depth 30 |
    Set-Content -LiteralPath $BehaviorPath -Encoding utf8
$packRoot = Get-Content -LiteralPath $PackPath -Raw | ConvertFrom-Json
$foundationPack = $packRoot.packs |
    Where-Object id -eq "pack.foundation.forest_neutral_poc" |
    Select-Object -First 1
if ($null -eq $foundationPack) {
    throw "Missing Forest Neutral POC foundation pack."
}
$foundationPack.blueprint_ids = @(
    $protectedDefinitions | ForEach-Object {
        if ([int]$_.catalogue_no -eq 6) {
            "bp.building.cottage_forest_small"
        } elseif ([int]$_.catalogue_no -eq 72) {
            "bp.building.watchtower_wood"
        } else {
            "bp.catalogue.$('{0:d3}' -f [int]$_.catalogue_no)"
        }
    }
)
$packRoot | ConvertTo-Json -Depth 30 |
    Set-Content -LiteralPath $PackPath -Encoding utf8

Write-Output "Generated shared blueprints, projects and behaviors for all 120 definitions."
