[CmdletBinding()]
param(
    [string]$ProjectPath = '',
    [string]$InputPath = '',
    [string]$OutputPath = '',
    [switch]$Check
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}
if ([string]::IsNullOrWhiteSpace($InputPath)) {
    $InputPath = Join-Path $ProjectPath '.summer\requirements\production-path.json'
}
if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $ProjectPath '.summer\plans\full-game-implementation-roadmap.md'
}

if (-not (Test-Path -LiteralPath $InputPath -PathType Leaf)) {
    throw "Production path source is missing: $InputPath"
}

$sourceText = [IO.File]::ReadAllText($InputPath)
$roadmap = $sourceText | ConvertFrom-Json
$phases = @($roadmap.phases)
$statusVocabulary = @($roadmap.status_vocabulary | ForEach-Object { [string]$_ })
$expectedPhaseIds = @(0..8 | ForEach-Object { "P$_" })

if ([int]$roadmap.schema_version -ne 1) {
    throw 'Production path schema must be v1'
}
if ([string]$roadmap.strategy -ne 'core_first') {
    throw 'Production path must retain the approved core_first strategy'
}
if (@($roadmap.completion_scope).Count -ne 3 -or
        'Core Production' -notin @($roadmap.completion_scope) -or
        'Early Access' -notin @($roadmap.completion_scope) -or
        'Full Release' -notin @($roadmap.completion_scope)) {
    throw 'Completion scope must include Core Production, Early Access and Full Release'
}
if ($phases.Count -ne 9) {
    throw "Expected 9 production phases, found $($phases.Count)"
}
if ((@($phases | ForEach-Object { [string]$_.id }) -join ',') -ne
        ($expectedPhaseIds -join ',')) {
    throw 'Production phases must be ordered P0 through P8'
}

$packageById = @{}
$phaseIndexByPackage = @{}
for ($phaseIndex = 0; $phaseIndex -lt $phases.Count; $phaseIndex++) {
    $phase = $phases[$phaseIndex]
    if ([string]$phase.status -notin $statusVocabulary) {
        throw "Phase $($phase.id) has invalid status $($phase.status)"
    }
    if ([string]$phase.status -eq 'completed') {
        for ($earlierIndex = 0; $earlierIndex -lt $phaseIndex; $earlierIndex++) {
            if ([string]$phases[$earlierIndex].status -ne 'completed') {
                throw (
                    "Phase $($phase.id) cannot be completed while earlier phase " +
                    "$($phases[$earlierIndex].id) is $($phases[$earlierIndex].status)"
                )
            }
        }
    }
    if ([string]::IsNullOrWhiteSpace([string]$phase.gate) -or
            @($phase.exit_gate).Count -eq 0 -or @($phase.packages).Count -eq 0) {
        throw "Phase $($phase.id) lacks a gate, exit criteria, or packages"
    }
    foreach ($package in @($phase.packages)) {
        $packageId = [string]$package.id
        if ($packageId -notmatch '^[A-Z][A-Z0-9-]+-[0-9]{3}$') {
            throw "Invalid production package ID: $packageId"
        }
        if ($packageById.ContainsKey($packageId)) {
            throw "Duplicate production package ID: $packageId"
        }
        if ([string]$package.status -notin $statusVocabulary) {
            throw "Package $packageId has invalid status $($package.status)"
        }
        if (@($package.documents).Count -eq 0 -or
                @($package.deliverables).Count -eq 0 -or
                @($package.acceptance).Count -eq 0) {
            throw "Package $packageId lacks documents, deliverables, or acceptance criteria"
        }
        $packageById[$packageId] = $package
        $phaseIndexByPackage[$packageId] = $phaseIndex
    }
}

foreach ($phase in $phases) {
    foreach ($package in @($phase.packages)) {
        $packageId = [string]$package.id
        foreach ($dependency in @($package.depends_on)) {
            $dependencyId = [string]$dependency
            if (-not $packageById.ContainsKey($dependencyId)) {
                throw "Package $packageId has unknown dependency $dependencyId"
            }
            if ([int]$phaseIndexByPackage[$dependencyId] -gt
                    [int]$phaseIndexByPackage[$packageId]) {
                throw "Package $packageId depends on future package $dependencyId"
            }
        }
    }
}

$requiredCoverageIds = @(
    0..20 | ForEach-Object { '{0:D2}' -f $_ }
) + @('20A-20H') + @(21..30 | ForEach-Object { [string]$_ })
$representedDocuments = @(
    $phases.packages.documents | ForEach-Object { [string]$_ } | Sort-Object -Unique
)
foreach ($documentId in $requiredCoverageIds) {
    if ($documentId -notin $representedDocuments) {
        throw "Production path does not represent coverage subsystem $documentId"
    }
}

$disposition = $roadmap.requirement_disposition
if ($null -eq $disposition -or [int]$disposition.schema_version -ne 1) {
    throw 'Production path requirement disposition schema must be v1'
}
$acceptedTiers = @($disposition.accepted_tiers | ForEach-Object { [string]$_ })
$nonBlockingTiers = @(
    $disposition.non_blocking_tiers | ForEach-Object { [string]$_ }
)
if (($acceptedTiers -join '|') -ne (@($roadmap.completion_scope) -join '|')) {
    throw 'Requirement accepted tiers disagree with completion scope'
}
if (($nonBlockingTiers -join '|') -ne
        (@($roadmap.non_blocking_tiers) -join '|')) {
    throw 'Requirement non-blocking tiers disagree with production path'
}
$allDeliveryTiers = $acceptedTiers + $nonBlockingTiers
$packageTierById = @{}
foreach ($phase in $phases) {
    $phaseId = [string]$phase.id
    $tierProperty = $disposition.phase_tiers.PSObject.Properties[$phaseId]
    if ($null -eq $tierProperty) {
        throw "Requirement disposition lacks a tier for phase $phaseId"
    }
    $phaseTier = [string]$tierProperty.Value
    if ($phaseTier -notin $allDeliveryTiers) {
        throw "Requirement disposition phase $phaseId has invalid tier $phaseTier"
    }
    foreach ($package in @($phase.packages)) {
        $packageTierById[[string]$package.id] = $phaseTier
    }
}
$documentPackageMap = @{}
foreach ($property in $disposition.document_package_map.PSObject.Properties) {
    $documentPackageMap[[string]$property.Name] = [string]$property.Value
}
$companionPackageMap = @{}
foreach ($property in $disposition.companion_package_map.PSObject.Properties) {
    $companionPackageMap[[string]$property.Name] = [string]$property.Value
}
foreach ($mapping in @($documentPackageMap, $companionPackageMap)) {
    foreach ($mappedPackageId in @($mapping.Values)) {
        if (-not $packageById.ContainsKey([string]$mappedPackageId)) {
            throw "Requirement disposition refers to unknown package $mappedPackageId"
        }
    }
}

$requirementLedgerPath = Join-Path $ProjectPath (
    '.summer\requirements\leyforge-requirements.json'
)
if (-not (Test-Path -LiteralPath $requirementLedgerPath -PathType Leaf)) {
    throw "Requirement ledger is missing: $requirementLedgerPath"
}
$requirementLedger = [IO.File]::ReadAllText($requirementLedgerPath) |
    ConvertFrom-Json
if ([int]$requirementLedger.schema_version -lt 3) {
    throw 'Requirement ledger schema must be v3 or newer for package disposition'
}
$productionPathHash = (
    Get-FileHash -LiteralPath $InputPath -Algorithm SHA256
).Hash.ToLowerInvariant()
if ([string]$requirementLedger.production_package_source_sha256 -ne
        $productionPathHash) {
    throw 'Requirement ledger was generated from a different production path'
}
if ([int]$requirementLedger.requirement_count -ne
        @($requirementLedger.requirements).Count) {
    throw 'Requirement ledger count disagrees with its requirement rows'
}
$acceptedRequirementCount = 0
$nonBlockingRequirementCount = 0
foreach ($requirement in @($requirementLedger.requirements)) {
    $requirementId = [string]$requirement.id
    $documentId = [string]$requirement.document
    $packageId = [string]$requirement.production_package_id
    if ([string]::IsNullOrWhiteSpace($packageId) -or
            -not $packageById.ContainsKey($packageId)) {
        throw "Requirement $requirementId lacks one known production package"
    }
    $expectedPackageId = ''
    if ($companionPackageMap.ContainsKey($documentId)) {
        $expectedPackageId = [string]$companionPackageMap[$documentId]
    } elseif ($documentId -match '^(\d{2})') {
        $documentFamily = [string]$Matches[1]
        if ($documentPackageMap.ContainsKey($documentFamily)) {
            $expectedPackageId = [string]$documentPackageMap[$documentFamily]
        }
    }
    if ([string]::IsNullOrWhiteSpace($expectedPackageId) -or
            $packageId -ne $expectedPackageId) {
        throw (
            "Requirement $requirementId package $packageId disagrees with " +
            "declared disposition $expectedPackageId"
        )
    }
    $expectedPhase = "P$([int]$phaseIndexByPackage[$packageId])"
    if ([string]$requirement.production_package_phase -ne $expectedPhase) {
        throw "Requirement $requirementId has the wrong package phase"
    }
    $expectedTier = [string]$packageTierById[$packageId]
    if ([string]$requirement.implementation_status -eq 'deferred') {
        $expectedTier = [string]$disposition.deferred_implementation_tier
    }
    $deliveryTier = [string]$requirement.delivery_tier
    if ($deliveryTier -ne $expectedTier -or
            $deliveryTier -notin $allDeliveryTiers) {
        throw "Requirement $requirementId has an invalid delivery tier"
    }
    $expectedScope = if ($deliveryTier -in $acceptedTiers) {
        $acceptedRequirementCount += 1
        'accepted'
    } else {
        $nonBlockingRequirementCount += 1
        'non_blocking'
    }
    if ([string]$requirement.scope_disposition -ne $expectedScope) {
        throw "Requirement $requirementId has an invalid scope disposition"
    }
}
if ($acceptedRequirementCount -le 0) {
    throw 'Requirement disposition did not resolve any accepted requirements'
}
if (($acceptedRequirementCount + $nonBlockingRequirementCount) -ne
        [int]$requirementLedger.requirement_count) {
    throw 'Requirement disposition does not cover the whole ledger'
}

$coveragePath = Join-Path $ProjectPath '.summer\requirements\implementation-coverage.json'
if (Test-Path -LiteralPath $coveragePath -PathType Leaf) {
    $coverage = [IO.File]::ReadAllText($coveragePath) | ConvertFrom-Json
    $baseline = $roadmap.baseline
    if ([int]$baseline.regression_scenes -ne
            [int]$coverage.verification_baseline.scene_count -or
            [int]$baseline.regression_checks -ne
            [int]$coverage.verification_baseline.check_count) {
        throw 'Production path regression baseline disagrees with implementation coverage'
    }
}

function Join-MarkdownList {
    param([object[]]$Values)
    return (@($Values | ForEach-Object { [string]$_ }) -join '; ')
}

$sourceHash = $productionPathHash
$baseline = $roadmap.baseline
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# Leyforge Documents 00-30 Full-Implementation Production Roadmap')
$lines.Add('')
$lines.Add("**Roadmap version:** $($roadmap.roadmap_version)")
$lines.Add("**Updated:** $($roadmap.updated)")
$lines.Add("**Machine source SHA-256:** ``$sourceHash``")
$lines.Add("**Current phase:** $($roadmap.current_phase)")
$lines.Add('')
$lines.Add('## Completion contract')
$lines.Add('')
$lines.Add('The programme is Core-first. Completion covers every accepted Core Production,')
$lines.Add('Early Access and Full Release requirement across Documents 00-30. Later Expansion,')
$lines.Add('Tooling Research and Archived Validation remain governed but do not block release.')
$lines.Add('Catalogue presence, generated assets and narrow probe success are not gameplay')
$lines.Add('completion evidence.')
$lines.Add('')
$lines.Add('Package status records implementation evidence for that named owner boundary.')
$lines.Add('Phase status records ordered gate acceptance. Existing implementation may therefore')
$lines.Add(('be verified in a later phase while `current_phase` remains {0}, but no later phase is' -f $roadmap.current_phase))
$lines.Add('accepted until its earlier required gates close. This prevents vertical reconciliation')
$lines.Add('work from being reported as out-of-order programme completion.')
$lines.Add('')
$lines.Add('## Current implementation baseline')
$lines.Add('')
$lines.Add(('- Coverage: {0} Implemented, {1} Partial, {2} Stub, {3} Missing.' -f
    $baseline.coverage.implemented, $baseline.coverage.partial,
    $baseline.coverage.stub, $baseline.coverage.missing))
$lines.Add(('- Regression: {0} scenes and {1} checks; {2} worldgen seeds; {3} Forge structure seeds.' -f
    $baseline.regression_scenes, $baseline.regression_checks,
    $baseline.worldgen_seeds, $baseline.forge_structure_seeds))
$lines.Add(('- Runtime compatibility: save v{0}, worldgen v{1}.' -f
    $baseline.save_version, $baseline.worldgen_version))
$lines.Add('')
$lines.Add('## Phase map')
$lines.Add('')
$lines.Add('| Phase | Status | Outcome | Gate |')
$lines.Add('|---|---|---|---|')
foreach ($phase in $phases) {
    $displayStatus = [string]$phase.status
    if ($phase.PSObject.Properties.Name -contains 'implementation_status' -and
            $phase.PSObject.Properties.Name -contains 'gate_status' -and
            [string]$phase.implementation_status -ne [string]$phase.status) {
        $gateStatus = ([string]$phase.gate_status).Replace('_', ' ')
        $displayStatus = '{0} (implementation {1}; gate {2})' -f
            $phase.status, $phase.implementation_status, $gateStatus
    }
    $lines.Add(('| {0} - {1} | {2} | {3} | {4} |' -f
        $phase.id, $phase.name, $displayStatus, $phase.outcome, $phase.gate))
}

foreach ($phase in $phases) {
    $lines.Add('')
    $lines.Add("## $($phase.id) - $($phase.name)")
    $lines.Add('')
    $lines.Add([string]$phase.outcome)
    $lines.Add('')
    $lines.Add('| Package | Status | Documents | Depends on | Deliverables | Acceptance |')
    $lines.Add('|---|---|---|---|---|---|')
    foreach ($package in @($phase.packages)) {
        $dependencies = if (@($package.depends_on).Count -eq 0) {
            'None'
        } else {
            Join-MarkdownList @($package.depends_on)
        }
        $lines.Add(('| {0} - {1} | {2} | {3} | {4} | {5} | {6} |' -f
            $package.id, $package.title, $package.status,
            (Join-MarkdownList @($package.documents)), $dependencies,
            (Join-MarkdownList @($package.deliverables)),
            (Join-MarkdownList @($package.acceptance))))
    }
    if ([string]$phase.id -eq 'P3') {
        $lines.Add('')
        $lines.Add('EVT-001 completion covers the runtime owner boundary: stable-definition Event and')
        $lines.Add('Quest Instances, staged graphs and branches, authoritative evidence, contributions,')
        $lines.Add('transactional reward-claim state, checked consequence links, bounded Chronicle state,')
        $lines.Add('atomic commits, and v1-to-v2 migration. It does not claim the remaining authored')
        $lines.Add('Document 15 breadth or the separate Document 24K Atlas scheduler and content registry.')
    }
    $lines.Add('')
    $lines.Add("**Exit gate ($($phase.gate)):** " +
        (Join-MarkdownList @($phase.exit_gate)))
}

$lines.Add('')
$lines.Add('## Shared public contracts')
$lines.Add('')
$lines.Add('- Qualified IDs, definition envelopes, pack manifests and lockfiles, aliases, tombstones and migrations.')
$lines.Add('- WorldTimeReference, ActorPresenceState, AuthorityContext and CrossSetEvidenceEnvelope.')
$lines.Add('- Authoritative Structure, Realm, Biology, Social, Political, Movement, Economy, Event and Vessel records.')
$lines.Add('- Typed economy/transport, social/movement, biology/movement, combat/consequence and aquatic-provider boundaries.')
$lines.Add('- UI and presentation consume read models, snapshots and events; they never own gameplay truth.')
$lines.Add('')
$lines.Add('## Verification policy')
$lines.Add('')
$lines.Add('- Use the configured fixed Godot 4.8 development runner and isolated writable profiles.')
$lines.Add('- Keep current regression green after every package and run Phase 0 for document, registry, migration or coverage changes.')
$lines.Add('- Require schema/reference, determinism, conservation, progression, migration, LOD, accessibility and teardown evidence per package.')
$lines.Add('- Block parse/script/gameplay failures, dangling references, POC leakage, authority violations and RID/ObjectDB/resource/StringName leaks.')
$lines.Add('- Preserve the existing dirty worktree and do not stage or commit without instruction.')
$content = ($lines -join "`n") + "`n"

if ($Check) {
    if (-not (Test-Path -LiteralPath $OutputPath -PathType Leaf)) {
        throw "Production roadmap Markdown is missing: $OutputPath"
    }
    if ([IO.File]::ReadAllText($OutputPath) -ne $content) {
        throw 'Production roadmap Markdown is stale. Run .summer/tools/update_production_roadmap.ps1'
    }
    Write-Host (
        "PRODUCTION_ROADMAP PASS phases=$($phases.Count) " +
        "packages=$($packageById.Count) source_sha256=$sourceHash"
    )
    return
}

$parent = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Path $parent -Force | Out-Null
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($OutputPath, $content, $utf8NoBom)
Write-Host (
    "PRODUCTION_ROADMAP UPDATED phases=$($phases.Count) " +
    "packages=$($packageById.Count) source_sha256=$sourceHash path=$OutputPath"
)
