param(
    [string]$SourcePath = ".summer/00_Docs/20-A-H/20H_Fantasy_Voxel_Civilisation_Sandbox_Detailed_Building_Catalogue_Stage_Matrix_and_Production_Backlog_v0_1.md",
    [string]$OutputPath = "data/settlement/settlement_catalogue.json"
)

$ErrorActionPreference = "Stop"

function Convert-ToKey {
    param([string]$Value)

    return ($Value.Trim().ToLowerInvariant() -replace "[^a-z0-9]+", "_").Trim("_")
}

function Convert-DocText {
    param([string]$Value)

    return ($Value -replace '\\\|', '|' -replace '\s+', ' ').Trim()
}

function Convert-ToDescriptorList {
    param([string]$Value)

    if ([string]::IsNullOrWhiteSpace($Value)) {
        return @()
    }
    $parts = @(
        (Convert-DocText $Value) -split ',|;|\.\s+' |
            ForEach-Object { $_.Trim(' ', '.') } |
            Where-Object { $_ }
    )
    return @(
        $parts | ForEach-Object {
            [ordered]@{
                tag = Convert-ToKey $_
                description = $_
                optional = $_ -match '(?i)\boptional\b'
            }
        }
    )
}

function Get-CapacityBase {
    param([string]$Value)

    $numbers = @(
        [regex]::Matches($Value, '\d+(?:\.\d+)?') |
            ForEach-Object { [double]$_.Value }
    )
    if ($numbers.Count -eq 0) {
        return 1.0
    }
    return [double](($numbers | Measure-Object -Maximum).Maximum)
}

function Get-UtilityRequirements {
    param([string]$Value)

    $requirements = @()
    $rules = [ordered]@{
        road_access = '(?i)\b(road|path|route|access|street)\b'
        water = '(?i)\bwater\b'
        sanitation = '(?i)\b(sanitation|sewer|waste|drainage)\b'
        power = '(?i)\b(power|mechanical)\b'
        mana = '(?i)\b(mana|leyline|rune)\b'
        heat = '(?i)\b(heat|heating|warmth)\b'
        fuel = '(?i)\bfuel\b'
        transport = '(?i)\b(cart|rail|port|dock|transport)\b'
    }
    foreach ($key in $rules.Keys) {
        if ($Value -match $rules[$key]) {
            $requirements += $key
        }
    }
    return $requirements
}

function Get-ReleaseWave {
    param([int]$CatalogueNumber, [string]$Scope)

    if ($Scope -eq 'poc_required') { return 1 }
    if ($CatalogueNumber -in @(4,8,12,16,17,19,20,24,26,28,32,33,34,37,38,39,44,45,46,57)) {
        return 2
    }
    if ($CatalogueNumber -in @(29,70,75,77,83,86,92,93,94,101,102,103,104,111,112,9,18,22,27,30,36,47,53,54,58)) {
        return 3
    }
    if ($CatalogueNumber -in @(40,48,49,50,55,59,60,62,63,64,65,66,67,68,76,78,79,80,84,87,89,90,95,96,97)) {
        return 4
    }
    return 5
}

function Get-Capabilities {
    param([string]$PrimaryNeed, [array]$SecondaryNeeds, [string]$StableId)

    $map = @{
        housing = 'housing_assignment'
        provisions = 'production_and_reserves'
        health = 'treatment_and_prevention'
        work = 'jobs_and_production'
        safety = 'warning_defence_and_refuge'
        infrastructure = 'storage_routes_and_utilities'
        morale = 'community_and_stability'
    }
    $result = [System.Collections.Generic.List[string]]::new()
    foreach ($need in @($PrimaryNeed) + @($SecondaryNeeds)) {
        if ($map.ContainsKey($need) -and -not $result.Contains($map[$need])) {
            $result.Add($map[$need])
        }
    }
    if ($StableId -match '(road|path|junction|bridge|gate)') { $result.Add('access_network') }
    if ($StableId -match '(storage|storehouse|warehouse|granary|barn)') { $result.Add('conserved_storage') }
    if ($StableId -match '(magic|mana|rune|leyline|portal)') { $result.Add('magic_network') }
    if ($StableId -match '(district|complex|campus|citadel|wonder|nexus)') { $result.Add('multi_component_plan') }
    return @($result | Select-Object -Unique)
}

$resolvedSource = (Resolve-Path -LiteralPath $SourcePath).Path
$sourceDirectory = Split-Path -Parent $resolvedSource
$profiles = @{}
$companionDocuments = @(
    Get-ChildItem -LiteralPath $sourceDirectory -Filter '20?_*.md' -File |
        Where-Object { $_.BaseName -match '^20[A-F]_' }
)
foreach ($document in $companionDocuments) {
    $currentStableId = ''
    foreach ($sourceLine in Get-Content -LiteralPath $document.FullName -Encoding utf8) {
        if ($sourceLine -match '^\s*((?:building|project|plan)\.[a-z0-9_.]+)\s*$') {
            $currentStableId = $Matches[1]
            if (-not $profiles.ContainsKey($currentStableId)) {
                $profiles[$currentStableId] = [ordered]@{
                    source_document = $document.BaseName.Substring(0, 3)
                }
            }
            continue
        }
        if (-not $currentStableId -or
                $sourceLine -notmatch '^\|\s*\*\*([^*]+)\*\*\s*\|\s*(.*?)\s*\|\s*$') {
            continue
        }
        $field = Convert-ToKey $Matches[1]
        $profiles[$currentStableId][$field] = Convert-DocText $Matches[2]
    }
}

$definitionsByNumber = @{}

foreach ($line in Get-Content -LiteralPath $resolvedSource -Encoding utf8) {
    if ($line -notmatch '^\|\s*(\d+)\s*\|\s*((?:building|project|plan)\.[a-z0-9_.]+)\s*\|\s*([^|]+)\|\s*([^|]+)\|\s*([^|]+)\|\s*([^|]+)\|\s*([^|]+)\|\s*([^|]+)\|\s*([^|]+)\|') {
        continue
    }

    $catalogueNumber = [int]$Matches[1]
    $stableId = $Matches[2].Trim()
    $displayName = $Matches[3].Trim()
    $minimumStage = Convert-ToKey $Matches[4]
    $primaryNeed = Convert-ToKey $Matches[5]
    $plannerClass = Convert-ToKey $Matches[7]
    $scope = Convert-ToKey $Matches[8]
    $ownerDocument = $Matches[9].Trim()
    $secondary = @(
        $Matches[6].Split(",") |
            ForEach-Object { Convert-ToKey $_ } |
            Where-Object { $_ }
    )
    $aliases = @()
    if ($catalogueNumber -eq 3) {
        $aliases += "building.construction.builder_supply_yard"
    }
    $profile = if ($profiles.ContainsKey($stableId)) {
        $profiles[$stableId]
    } else {
        @{}
    }
    $capacityText = [string]$profile.capacity_service
    $placementText = [string]$profile.placement_and_utilities
    $constructionText = [string]$profile.construction_profile
    $stageCount = 0
    if ($constructionText -match '(\d+)(?:-\d+)?\s+(?:rapid\s+)?stages?') {
        $stageCount = [int]$Matches[1]
    }
    $releaseWave = Get-ReleaseWave $catalogueNumber $scope
    $utilityRequirements = @(Get-UtilityRequirements $placementText)
    $jobs = @(Convert-ToDescriptorList ([string]$profile.jobs_and_users))
    $inputs = @(Convert-ToDescriptorList ([string]$profile.inputs))
    $outputs = @(Convert-ToDescriptorList ([string]$profile.outputs_services))
    $markerDescriptors = @(
        Convert-ToDescriptorList ([string]$profile.required_blueprint_markers)
    )
    $requiredMarkers = @(
        $markerDescriptors | ForEach-Object { [string]$_.tag }
    )
    $capabilities = @(Get-Capabilities $primaryNeed $secondary $stableId)
    $damage = [System.Collections.Generic.List[string]]::new()
    $damage.Add('structural')
    if ($placementText -match '(?i)(outdoor|weather|flood|drainage|river|water)') {
        $damage.Add('weather')
    }
    if (([string]$profile.planner_triggers_and_failure_states) -match '(?i)fire') {
        $damage.Add('fire')
    }
    if ($stableId -match '(magic|mana|rune|portal|leyline)') {
        $damage.Add('mana_disruption')
    }

    $definitionsByNumber[$catalogueNumber] = [ordered]@{
        catalogue_no = $catalogueNumber
        id = $stableId
        aliases = $aliases
        kind = $stableId.Split(".")[0]
        display_name = $displayName
        min_stage = $minimumStage
        primary_need = $primaryNeed
        secondary_needs = $secondary
        planner_class = $plannerClass
        scope = $scope
        owner_document = $ownerDocument
        release_wave = $releaseWave
        tags = @(
            (Convert-ToKey $ownerDocument),
            $scope,
            $minimumStage,
            $primaryNeed
        )
        purpose = [string]$profile.purpose
        capacity = [ordered]@{
            unit = "service"
            base = Get-CapacityBase $capacityText
            coverage = "settlement"
            description = $capacityText
        }
        jobs = [object[]]@($jobs)
        inputs = [object[]]@($inputs)
        outputs = [object[]]@($outputs)
        required_markers = [object[]]@($requiredMarkers)
        utility_requirements = [object[]]@($utilityRequirements)
        capabilities = [object[]]@($capabilities)
        construction = [ordered]@{
            description = $constructionText
            stage_count = $stageCount
            transactional = $true
            visible_npc_labour = $true
            partial_activation = $stableId -match '(project|plan|complex|district|campus|citadel|network|grid|nexus|wonder)'
        }
        planner = [ordered]@{
            class = $plannerClass
            triggers_and_failures = [string]$profile.planner_triggers_and_failure_states
            placement_and_utilities = $placementText
        }
        upgrade_from = @()
        upgrade_to = @()
        upgrade_notes = [string]$profile.upgrade_and_branch_links
        damage_profile = [object[]]@($damage | Select-Object -Unique)
        maintenance_profile = "standard"
        culture_and_style = [string]$profile.culture_and_style_variation
        player_blueprint_validation = [string]$profile.player_blueprint_validation
        implementation_status = "wave${releaseWave}_profiled"
    }
}

if ($definitionsByNumber.Count -ne 120) {
    throw "Expected 120 catalogue definitions but parsed $($definitionsByNumber.Count)."
}
if ($profiles.Count -lt 120) {
    throw "Expected at least 120 detailed companion profiles but parsed $($profiles.Count)."
}

# Explicit functional upgrade edges. These are stable-ID relationships, not
# visual substitutions; every edge is reciprocal and registry-valid.
$upgradePairs = @(
    @(2, 5), @(5, 6), @(6, 9), @(9, 10),
    @(11, 12), @(14, 84), @(15, 16), @(16, 17), @(17, 18),
    @(21, 22), @(22, 23), @(25, 30),
    @(31, 32), @(32, 33), @(35, 36), @(36, 40),
    @(41, 47), @(42, 48), @(43, 49), @(44, 50),
    @(51, 53), @(52, 54), @(54, 55), @(56, 58), @(58, 59), @(59, 60),
    @(61, 62), @(62, 63), @(63, 69),
    @(71, 72), @(73, 76), @(74, 75), @(75, 77),
    @(81, 82), @(82, 83), @(83, 84),
    @(85, 86), @(86, 87), @(88, 89), @(89, 90),
    @(91, 95), @(92, 95), @(93, 96), @(94, 97), @(95, 98),
    @(96, 99), @(99, 100),
    @(101, 102), @(102, 103), @(103, 109), @(104, 108),
    @(105, 106), @(106, 107), @(107, 108), @(109, 110)
)
foreach ($pair in $upgradePairs) {
    $from = $definitionsByNumber[[int]$pair[0]]
    $to = $definitionsByNumber[[int]$pair[1]]
    $from.upgrade_to = [object[]]@($from.upgrade_to + @([string]$to.id))
    $to.upgrade_from = [object[]]@($to.upgrade_from + @([string]$from.id))
}

$orderedDefinitions = @(
    1..120 | ForEach-Object {
        if (-not $definitionsByNumber.ContainsKey($_)) {
            throw "Missing catalogue definition $_."
        }
        $definitionsByNumber[$_]
    }
)

$scopeCounts = @{}
foreach ($definition in $orderedDefinitions) {
    $scope = [string]$definition.scope
    if (-not $scopeCounts.ContainsKey($scope)) {
        $scopeCounts[$scope] = 0
    }
    $scopeCounts[$scope] += 1
}

$catalogue = [ordered]@{
    schema = "leyforge.settlement.catalogue"
    schema_version = 1
    catalogue_version = "20H-v0.1"
    canonical_owner = "20H"
    definition_count = $orderedDefinitions.Count
    expected_scope_counts = [ordered]@{
        poc_required = 30
        alpha = 35
        beta = 49
        final = 6
    }
    parsed_scope_counts = $scopeCounts
    definitions = $orderedDefinitions
}

$resolvedOutput = [System.IO.Path]::GetFullPath(
    (Join-Path (Get-Location) $OutputPath))
$outputDirectory = Split-Path -Parent $resolvedOutput
[System.IO.Directory]::CreateDirectory($outputDirectory) | Out-Null
$catalogue | ConvertTo-Json -Depth 12 |
    Set-Content -LiteralPath $resolvedOutput -Encoding utf8

Write-Output "Generated $($orderedDefinitions.Count) definitions at $resolvedOutput"
