param(
    [string]$CataloguePath = "data/settlement/settlement_catalogue.json",
    [string]$ProjectPath = "data/settlement/settlement_projects.json",
    [string]$OutputPath = "data/settlement/settlement_plans.json"
)

$ErrorActionPreference = "Stop"

function New-Amount {
    param([string]$StableId, [int]$Count)
    return [ordered]@{
        kind = "item"
        stable_id = $StableId
        count = $Count
    }
}

function New-Component {
    param(
        [string]$PlanId,
        [string]$Role,
        [string]$ProjectTemplateId,
        [array]$Prerequisites,
        [array]$Requirements,
        [double]$ActivationContribution
    )
    return [ordered]@{
        id = "$PlanId.component.$Role"
        role = $Role
        project_template_id = $ProjectTemplateId
        prerequisites = [object[]]@($Prerequisites)
        requirements = [object[]]@($Requirements)
        activation_contribution = $ActivationContribution
        capacity_mode = "source"
        independently_persisted = $true
        supports_damage_and_restoration = $true
    }
}

$catalogue = Get-Content -LiteralPath $CataloguePath -Raw | ConvertFrom-Json
$projectRoot = Get-Content -LiteralPath $ProjectPath -Raw | ConvertFrom-Json
$projectByDefinition = @{}
foreach ($project in $projectRoot.projects) {
    $target = [string]$project.catalogue_definition_id
    if (-not $target) { $target = [string]$project.building_id }
    $projectByDefinition[$target] = [string]$project.id
}

$planTargets = @(
    $catalogue.definitions | Where-Object {
        $_.kind -eq "plan" -or [int]$_.catalogue_no -in @(69, 100, 110, 118, 119, 120)
    }
)
$plans = @()
foreach ($definition in $planTargets) {
    $id = [string]$definition.id
    $projectTemplate = [string]$projectByDefinition[$id]
    if (-not $projectTemplate) {
        throw "No construction project template for plan target $id."
    }
    $scale = [math]::Max(1, [int]$definition.release_wave)
    $enablingId = "$id.component.enabling_works"
    $coreId = "$id.component.core"
    $supportId = "$id.component.workforce_support"
    $networkId = "$id.component.network_integration"
    $components = @(
        (New-Component $id "enabling_works" $projectTemplate @() @(
            (New-Amount "item.material.stone_brick" (16 * $scale)),
            (New-Amount "item.material.beam_oak" (8 * $scale))
        ) 0.10),
        (New-Component $id "core" $projectTemplate @($enablingId) @(
            (New-Amount "item.material.stone_brick" (32 * $scale)),
            (New-Amount "item.material.iron_plate" (8 * $scale))
        ) 0.35),
        (New-Component $id "workforce_support" $projectTemplate @($enablingId) @(
            (New-Amount "item.material.plank_oak" (16 * $scale)),
            (New-Amount "item.food.village_meal_pack" (4 * $scale))
        ) 0.15),
        (New-Component $id "network_integration" $projectTemplate @($coreId, $supportId) @(
            (New-Amount "item.component.iron_gear" (4 * $scale)),
            (New-Amount "item.component.mana_coil" (2 * $scale))
        ) 0.20),
        (New-Component $id "commissioning" $projectTemplate @($networkId) @(
            (New-Amount "item.material.iron_nails" (8 * $scale))
        ) 0.20)
    )
    $requiredRoles = @(
        [ordered]@{
            role = [string]$definition.primary_need
            minimum = 1
            substitutions = [object[]]@($definition.secondary_needs)
        },
        [ordered]@{
            role = "builder_workforce"
            minimum = [math]::Max(2, 2 * $scale)
            substitutions = @("engineer", "mage_builder", "golem_builder")
        }
    )
    $plans += [ordered]@{
        id = $id
        catalogue_no = [int]$definition.catalogue_no
        display_name = [string]$definition.display_name
        min_stage = [string]$definition.min_stage
        primary_need = [string]$definition.primary_need
        planner_class = [string]$definition.planner_class
        scope = [string]$definition.scope
        owner_document = [string]$definition.owner_document
        graph_kind = $(if ([int]$definition.catalogue_no -in @(69, 100, 110, 118, 119, 120)) { "megaproject" } else { "district_plan" })
        required_roles = $requiredRoles
        optional_roles = @(
            [ordered]@{
                role = "culture_signature"
                substitutions = @("neutral_landmark", "public_space", "faith_service")
            }
        )
        substitutions = @(
            [ordered]@{
                role = "material_palette"
                allowed = @("culture", "regional_subculture", "biome", "realm")
                preserves_functional_capacity = $true
            }
        )
        roads = @(
            [ordered]@{ role = "primary_access"; required = $true; minimum_connections = 1 }
        )
        utilities = @(
            [ordered]@{ role = "water"; required = $definition.min_stage -notin @("camp", "hamlet") },
            [ordered]@{ role = "power_or_mana"; required = [int]$definition.release_wave -ge 4 }
        )
        network_requirements = [object[]]@($definition.utility_requirements)
        phases = @(
            [ordered]@{ index = 0; id = "enabling"; component_ids = @($enablingId) },
            [ordered]@{ index = 1; id = "core_and_support"; component_ids = @($coreId, $supportId) },
            [ordered]@{ index = 2; id = "integration"; component_ids = @($networkId) },
            [ordered]@{ index = 3; id = "commissioning"; component_ids = @("$id.component.commissioning") }
        )
        components = $components
        partial_activation_threshold = 0.45
        full_activation_threshold = 1.0
        bounded_effects = [ordered]@{
            maximum_regional_radius = 4096
            maximum_capacity_multiplier = 2.0
            requires_completed_components = $true
        }
        repair = [ordered]@{
            damaged_components_disable_only_their_effects = $true
            restoration_is_transactional = $true
        }
    }
}

if ($plans.Count -ne 13) {
    throw "Expected 13 district/megaproject plan graphs but generated $($plans.Count)."
}

$root = [ordered]@{
    schema = "leyforge.settlement.plans"
    schema_version = 1
    plan_count = $plans.Count
    plans = $plans
}
$root | ConvertTo-Json -Depth 30 |
    Set-Content -LiteralPath $OutputPath -Encoding utf8
Write-Output "Generated 13 district and megaproject plan graphs."
