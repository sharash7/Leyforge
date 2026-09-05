[CmdletBinding()]
param(
    [string]$ProjectPath = '',

    [string]$OutputPath = '',

    [switch]$Check
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}
if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $ProjectPath (
        '.summer\requirements\leyforge-requirements.json'
    )
}

$docsRoot = Join-Path $ProjectPath '.summer\00_Docs'
if (-not (Test-Path -LiteralPath $docsRoot -PathType Container)) {
    throw "Canonical document directory not found: $docsRoot"
}

$productionPath = Join-Path $ProjectPath (
    '.summer\requirements\production-path.json'
)
if (-not (Test-Path -LiteralPath $productionPath -PathType Leaf)) {
    throw "Production path not found: $productionPath"
}
$productionPathText = [IO.File]::ReadAllText($productionPath)
$productionRoadmap = $productionPathText | ConvertFrom-Json
$disposition = $productionRoadmap.requirement_disposition
if ($null -eq $disposition -or [int]$disposition.schema_version -ne 1) {
    throw 'Production path requirement disposition schema must be v1'
}
$acceptedTiers = @($disposition.accepted_tiers | ForEach-Object { [string]$_ })
$nonBlockingTiers = @(
    $disposition.non_blocking_tiers | ForEach-Object { [string]$_ }
)
if (($acceptedTiers -join '|') -ne
        (@($productionRoadmap.completion_scope) -join '|')) {
    throw 'Requirement accepted tiers disagree with production completion scope'
}
if (($nonBlockingTiers -join '|') -ne
        (@($productionRoadmap.non_blocking_tiers) -join '|')) {
    throw 'Requirement non-blocking tiers disagree with production path'
}

$packageById = @{}
$packagePhaseById = @{}
$packageTierById = @{}
foreach ($phase in @($productionRoadmap.phases)) {
    $phaseId = [string]$phase.id
    $tierProperty = $disposition.phase_tiers.PSObject.Properties[$phaseId]
    if ($null -eq $tierProperty) {
        throw "Requirement disposition lacks a tier for phase $phaseId"
    }
    $phaseTier = [string]$tierProperty.Value
    if ($phaseTier -notin ($acceptedTiers + $nonBlockingTiers)) {
        throw "Requirement disposition phase $phaseId has invalid tier $phaseTier"
    }
    foreach ($package in @($phase.packages)) {
        $packageId = [string]$package.id
        if ($packageById.ContainsKey($packageId)) {
            throw "Duplicate production package ID: $packageId"
        }
        $packageById[$packageId] = $package
        $packagePhaseById[$packageId] = $phaseId
        $packageTierById[$packageId] = $phaseTier
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
    foreach ($packageId in @($mapping.Values)) {
        if (-not $packageById.ContainsKey([string]$packageId)) {
            throw "Requirement disposition refers to unknown package $packageId"
        }
    }
}

$statusVocabulary = @(
    'unverified',
    'absent',
    'partial',
    'implemented',
    'verified',
    'deferred',
    'not_applicable',
    'stub',
    'missing',
    'legacy_superseded',
    'cannot_determine'
)
$priorBySignature = @{}
if (Test-Path -LiteralPath $OutputPath -PathType Leaf) {
    $priorLedger = [IO.File]::ReadAllText($OutputPath) | ConvertFrom-Json
    foreach ($prior in @($priorLedger.requirements)) {
        $signature = '{0}|{1}|{2}' -f (
            [string]$prior.document,
            [string]$prior.line,
            [string]$prior.text
        )
        $priorBySignature[$signature] = $prior
    }
}

function Get-RelativePath {
    param([string]$BasePath, [string]$TargetPath)

    $baseUri = [Uri]::new(($BasePath.TrimEnd('\') + '\'))
    $targetUri = [Uri]::new($TargetPath)
    return [Uri]::UnescapeDataString(
        $baseUri.MakeRelativeUri($targetUri).ToString()
    )
}

function ConvertFrom-MarkdownRequirement {
    param([string]$Text)

    $value = $Text.Trim()
    $value = [regex]::Replace($value, '^\s*(?:[-*+]|\d+[.)])\s+', '')
    $value = [regex]::Replace($value, '^\s*\|\s*|\s*\|\s*$', '')
    $value = [regex]::Replace($value, '\s*\|\s*', ' | ')
    $value = [regex]::Replace($value, '\[([^\]]+)\]\([^)]+\)', '$1')
    $value = [regex]::Replace($value, '<[^>]+>', '')
    $value = $value -replace '[`*_]', ''
    $value = [regex]::Replace($value, '\s+', ' ').Trim()
    return $value
}

function Test-RequirementSection {
    param([string]$Heading)

    return $Heading -match (
        '(?i)locked|decision|required|requirement|acceptance|success criteria|' +
        'definition of done|implementation|milestone|production wave|backlog|' +
        'full game|scale target|open question|defer|contract|interface|authority|' +
        'migration|validation|invariant|rule'
    )
}

function Get-RequirementKind {
    param([string]$Section, [string]$Text)

    $combined = "$Section $Text"
    if ($combined -match '(?i)open question|defer|not part of|out of scope') {
        return 'deferral'
    }
    if ($combined -match '(?i)locked|decision|authority|ownership') {
        return 'decision'
    }
    if ($combined -match '(?i)interface|contract|snapshot|request|result') {
        return 'interface'
    }
    if (
        $combined -match
        '(?i)acceptance|success criteria|definition of done|must pass|validation'
    ) {
        return 'acceptance'
    }
    if ($combined -match '(?i)milestone|production wave|stage|phase') {
        return 'milestone'
    }
    if ($combined -match '(?i)migration|legacy|supersed') {
        return 'migration'
    }
    return 'requirement'
}

function Get-DocumentOwner {
    param([string]$DocumentId)

    $number = if ($DocumentId -match '^(\d{2})') { $Matches[1] } else { '' }
    return [string](@{
        '00' = 'Project governance and product direction'
        '01' = 'Core gameplay loop integration'
        '02' = 'Player progression'
        '03' = 'Canonical Block registry'
        '04' = 'Canonical Item, inventory and equipment registry'
        '05' = 'Recipe and transformation registry'
        '06' = 'Resource progression and material ecology'
        '07' = 'Persistent people, households, jobs and settlement operations'
        '08' = 'Automation and machine/network execution'
        '09' = 'Magic and magical networks'
        '10' = 'Creature and ecology runtime'
        '11' = 'World generation and biome assembly'
        '12' = 'Persistent structures and physical structure history'
        '13' = 'Government, law, territory and civilisation identity'
        '14' = 'Dimensions, realms and realm truth'
        '15' = 'Quests, events, history and world consequence'
        '16' = 'Combat resolution'
        '17' = 'UI, UX, accessibility and player configuration'
        '18' = 'Godot and Summer Engine technical architecture'
        '19' = 'Settlement planning, districts and player blueprint workflows'
        '20' = 'Buildings, services and authoritative ConstructionProjects'
        '21' = 'Voxel Asset Forge'
        '22' = 'Entity and Blueprint Forge'
        '23' = 'Presentation Forge'
        '24' = 'World Content Atlas'
        '25' = 'Registries, lifecycle, packs, migration and governance'
        '26' = 'Maritime, vessels and naval systems'
        '27' = 'Economy, markets, contracts, trade and public finance'
        '28' = 'Dialogue, social systems, relationships, knowledge and companions'
        '29' = 'Survival, health and biological systems'
        '30' = 'Movement, travel, navigation and mover accessibility'
    }.GetEnumerator() | Where-Object { $_.Key -eq $number } |
        ForEach-Object { $_.Value })
}

function Get-RoadmapPhase {
    param(
        [string]$DocumentId,
        [string]$Section,
        [string]$Text,
        [string]$Kind
    )

    $combined = "$Section $Text"
    if (
        $DocumentId -match '^25' -or
        $combined -match '(?i)registry|stable id|migration|governance|checksum'
    ) {
        return 'Phase 0 - Governance and integrity'
    }
    if (
        $DocumentId -match '^(03|04|05|06|20)' -or
        $combined -match '(?i)conservation|block inventory projection|provenance'
    ) {
        return 'Phase 1 - Canonical identities and conservation'
    }
    if (
        $DocumentId -match '^(11|12|14|18)' -or
        $combined -match '(?i)persistence|save|journal|determin|promotion|demotion'
    ) {
        return 'Phase 2 - Persistence and deterministic state'
    }
    if (
        $DocumentId -match '^(07|08|09|13|15|16|27|28|29|30)' -or
        $Kind -eq 'interface'
    ) {
        return 'Phase 3 - Ownership reconciliation'
    }
    if ($DocumentId -match '^(10|19|20|24|26)') {
        return 'Phase 4 - Missing governed systems'
    }
    return 'Phase 5 - Optimisation and presentation'
}

function Get-PrimaryDocumentId {
    param([IO.FileInfo]$File)

    $relative = Get-RelativePath -BasePath $docsRoot -TargetPath $File.FullName
    $name = $File.Name
    if (
        $relative -match '^00-20/' -and
        $name -match '^((?:0\d|1\d|20))_.*_v1_0\.md$'
    ) {
        return $Matches[1]
    }
    if (
        $relative -match '^20-A-H/' -and
        $name -match '^(20[A-H])_.*_v1_0\.md$'
    ) {
        return $Matches[1]
    }
    if ($relative -match '^21-A-G/' -and $name -match '^(21[A-G])_.*\.md$') {
        return $Matches[1]
    }
    if ($relative -match '^22-A-L/' -and $name -match '^(22[A-L])_.*\.md$') {
        return $Matches[1]
    }
    if ($relative -match '^23-A-J/' -and $name -match '^(23[A-J])_.*\.md$') {
        return $Matches[1]
    }
    if ($relative -match '^24-A-L/' -and $name -match '^(24[A-L])\s+-.*\.md$') {
        return $Matches[1]
    }
    if ($relative -match '^25-A-L/' -and $name -match '^(25[A-L])_.*\.md$') {
        return $Matches[1]
    }
    if ($relative -match '^26-A-O/' -and $name -match '^(26[A-O])_.*\.md$') {
        return $Matches[1]
    }
    foreach ($set in 27..30) {
        if (
            $relative -match "^$set-A-J/" -and
            $name -match "^($set[A-J])_.*\.md$"
        ) {
            return $Matches[1]
        }
    }
    return ''
}

function Get-CompanionIdentity {
    param([IO.FileInfo]$File)

    $relative = Get-RelativePath -BasePath $docsRoot -TargetPath $File.FullName
    $name = $File.Name
    if ($relative -eq '00-20/Governance/Leyforge_Foundation_00-20_POC_to_Production_Reconciliation_Register_v0_2.md') {
        return @('FOUNDATION-00-20-RECONCILIATION', 'governance', $true)
    }
    if ($name -eq 'Leyforge_Document_Sets_27-30_Cross-Set_Interface_Register_v1_1_Final_Reconciled.md') {
        return @('XSET-27-30-INTERFACE-REGISTER', 'interface_register', $true)
    }
    if ($name -eq 'Leyforge_Document_Sets_27-30_Final_Cross-Set_Reconciliation_and_Integration_Report_v1_1.md') {
        return @('XSET-27-30-RECONCILIATION-REPORT', 'reconciliation', $true)
    }
    if ($relative -match '^(27|28|29|30)-A-J/FINAL_RECONCILIATION_NOTICE_v0_2\.md$') {
        return @("XSET-27-30-FINAL-NOTICE-$($Matches[1])", 'amendment', $true)
    }
    if ($relative -eq '24-A-L/00%20-%20Document%20Set%2024%20Index.md' -or
            $relative -eq '24-A-L/00 - Document Set 24 Index.md') {
        return @('SET24-INDEX', 'index', $true)
    }
    if ($relative -eq '26-A-O/DOCUMENT_SET_INDEX.md') {
        return @('SET26-INDEX', 'index', $true)
    }
    if ($relative -eq '99_Leyforge_POC_Manual_Testing_Guide_v0_1.md') {
        return @('DOC99-ARCHIVED-VALIDATION', 'archived_validation', $false)
    }
    if ($relative -eq 'VoxelRegistry.json') {
        return @('FOUNDATION-LEGACY-VOXEL-REGISTRY', 'reference_registry', $false)
    }
    if ($name -match '^README(?:_.*)?\.(?:md|txt)$') {
        $package = ($relative -split '/')[0].ToUpperInvariant()
        $slug = [regex]::Replace($File.BaseName.ToUpperInvariant(), '[^A-Z0-9]+', '-')
        return @("PACKAGE-$package-$slug", 'package_governance', $true)
    }
    if ($name -eq 'MANIFEST.txt') {
        $package = ($relative -split '/')[0].ToUpperInvariant()
        return @("PACKAGE-$package-MANIFEST", 'package_manifest', $false)
    }
    return @()
}

function Get-ReferencedDocuments {
    param([string]$Text)

    $references = [System.Collections.Generic.HashSet[string]]::new()
    foreach ($match in [regex]::Matches(
            $Text,
            '(?i)\b(?:Document|Doc|Set)\s+(\d{2}[A-Z]?)\b')) {
        [void]$references.Add($match.Groups[1].Value.ToUpperInvariant())
    }
    return @($references | Sort-Object)
}

function Get-RequirementDisposition {
    param(
        [string]$DocumentId,
        [string]$ImplementationStatus
    )

    $packageId = ''
    if ($companionPackageMap.ContainsKey($DocumentId)) {
        $packageId = [string]$companionPackageMap[$DocumentId]
    } elseif ($DocumentId -match '^(\d{2})') {
        $documentFamily = [string]$Matches[1]
        if ($documentPackageMap.ContainsKey($documentFamily)) {
            $packageId = [string]$documentPackageMap[$documentFamily]
        }
    }
    if ([string]::IsNullOrWhiteSpace($packageId)) {
        throw "Requirement document $DocumentId has no production package disposition"
    }
    if (-not $packageById.ContainsKey($packageId)) {
        throw "Requirement document $DocumentId resolves to unknown package $packageId"
    }

    $deliveryTier = [string]$packageTierById[$packageId]
    if ($ImplementationStatus -eq 'deferred') {
        $deliveryTier = [string]$disposition.deferred_implementation_tier
    }
    if ($deliveryTier -notin ($acceptedTiers + $nonBlockingTiers)) {
        throw "Requirement document $DocumentId resolves to invalid tier $deliveryTier"
    }
    $scopeDisposition = if ($deliveryTier -in $acceptedTiers) {
        'accepted'
    } else {
        'non_blocking'
    }
    return [ordered]@{
        production_package_id = $packageId
        production_package_phase = [string]$packagePhaseById[$packageId]
        delivery_tier = $deliveryTier
        scope_disposition = $scopeDisposition
    }
}

$candidateFiles = @(
    Get-ChildItem -LiteralPath $docsRoot -Recurse -File |
        Where-Object {
            $_.Extension -in @('.md', '.txt', '.json') -and
            $_.Name -ne 'SHA256SUMS.txt' -and
            $_.FullName -notmatch '(?i)\\OLD\\'
        }
)
$manifestById = [ordered]@{}
foreach ($file in $candidateFiles) {
    $primaryId = Get-PrimaryDocumentId -File $file
    $role = 'primary'
    $parseRequirements = $true
    $documentId = $primaryId
    if ([string]::IsNullOrWhiteSpace($documentId)) {
        $companion = @(Get-CompanionIdentity -File $file)
        if ($companion.Count -eq 0) {
            continue
        }
        $documentId = [string]$companion[0]
        $role = [string]$companion[1]
        $parseRequirements = [bool]$companion[2]
    }
    $relativePath = Get-RelativePath -BasePath $ProjectPath `
        -TargetPath $file.FullName
    $hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).
        Hash.ToLowerInvariant()
    if ($manifestById.Contains($documentId)) {
        $existing = $manifestById[$documentId]
        if ([string]$existing.content_sha256 -ne $hash) {
            throw "Conflicting canonical document identity $documentId"
        }
        $existing.mirror_paths += $relativePath
        $existing.mirror_paths = @($existing.mirror_paths | Sort-Object -Unique)
        $manifestById[$documentId] = $existing
        continue
    }
    $manifestById[$documentId] = [ordered]@{
        document_id = $documentId
        role = $role
        path = $relativePath
        mirror_paths = @()
        content_sha256 = $hash
        authoritative_owner = if ($role -eq 'primary') {
            Get-DocumentOwner -DocumentId $documentId
        } else {
            'Cross-set documentation governance'
        }
        parse_requirements = $parseRequirements
    }
}

$documentManifest = @(
    $manifestById.Values | Sort-Object document_id
)
$primaryManifest = @(
    $documentManifest | Where-Object { $_.role -eq 'primary' }
)
if ($primaryManifest.Count -ne 137) {
    throw "Expected 137 primary Documents 00-30, found $($primaryManifest.Count)"
}

$items = [System.Collections.Generic.List[object]]::new()
foreach ($document in $documentManifest) {
    if (-not [bool]$document.parse_requirements) {
        continue
    }
    $filePath = Join-Path $ProjectPath ([string]$document.path).Replace('/', '\')
    $lines = [IO.File]::ReadAllLines($filePath)
    $section = 'Document'
    $inCodeFence = $false
    for ($index = 0; $index -lt $lines.Length; $index++) {
        $raw = $lines[$index]
        if ($raw.TrimStart().StartsWith('```')) {
            $inCodeFence = -not $inCodeFence
            continue
        }
        if ($inCodeFence) {
            continue
        }
        if ($raw -match '^\s*#{1,6}\s+(.+?)\s*$') {
            $section = ConvertFrom-MarkdownRequirement $Matches[1]
            continue
        }
        $trimmed = $raw.Trim()
        if ([string]::IsNullOrWhiteSpace($trimmed)) {
            continue
        }
        $isTableRow = $trimmed -match '^\|.*\|$'
        $isTableSeparator = $trimmed -match '^\|[\s:|\-]+\|$'
        $nextIsTableSeparator = (
            $index + 1 -lt $lines.Length -and
            $lines[$index + 1].Trim() -match '^\|[\s:|\-]+\|$'
        )
        $isListItem = $trimmed -match '^(?:[-*+]|\d+[.)])\s+'
        $isNormative = $trimmed -match (
            '(?i)\bmust\b|\bmust not\b|\bshould\b|\bshould not\b|' +
            '\brequired\b|\bshall\b|locked rule|authoritative owner'
        )
        $include = (
            ((Test-RequirementSection $section) -and
                ($isTableRow -or $isListItem)) -or
            $isNormative
        )
        if (-not $include -or $isTableSeparator -or $nextIsTableSeparator) {
            continue
        }
        $text = ConvertFrom-MarkdownRequirement $trimmed
        if ($text.Length -lt 12) {
            continue
        }
        $kind = Get-RequirementKind -Section $section -Text $text
        $documentId = [string]$document.document_id
        $lineNumber = $index + 1
        $safeDocumentId = [regex]::Replace($documentId, '[^A-Z0-9]+', '-')
        $id = ('REQ-{0}-{1:D5}' -f $safeDocumentId, $lineNumber)
        $status = 'unverified'
        $evidence = @()
        $priorSignature = '{0}|{1}|{2}' -f (
            $documentId,
            $lineNumber,
            $text
        )
        if ($priorBySignature.ContainsKey($priorSignature)) {
            $prior = $priorBySignature[$priorSignature]
            if ([string]$prior.implementation_status -in $statusVocabulary) {
                $status = [string]$prior.implementation_status
                $evidence = @($prior.evidence)
            }
        }
        $requirementDisposition = Get-RequirementDisposition `
            -DocumentId $documentId -ImplementationStatus $status
        $items.Add([ordered]@{
            id = $id
            document = $documentId
            path = [string]$document.path
            line = $lineNumber
            section = $section
            kind = $kind
            authoritative_owner = [string]$document.authoritative_owner
            dependencies_interfaces = @(Get-ReferencedDocuments -Text $text)
            text = $text
            implementation_status = $status
            evidence = $evidence
            roadmap_phase = Get-RoadmapPhase -DocumentId $documentId `
                -Section $section -Text $text -Kind $kind
            production_package_id = [string](
                $requirementDisposition.production_package_id
            )
            production_package_phase = [string](
                $requirementDisposition.production_package_phase
            )
            delivery_tier = [string]$requirementDisposition.delivery_tier
            scope_disposition = [string](
                $requirementDisposition.scope_disposition
            )
        })
    }
}

$phaseCounts = [ordered]@{}
$kindCounts = [ordered]@{}
$statusCounts = [ordered]@{}
$packageCounts = [ordered]@{}
$tierCounts = [ordered]@{}
$scopeDispositionCounts = [ordered]@{}
foreach ($item in $items) {
    foreach ($pair in @(
        @($phaseCounts, [string]$item.roadmap_phase),
        @($kindCounts, [string]$item.kind),
        @($statusCounts, [string]$item.implementation_status),
        @($packageCounts, [string]$item.production_package_id),
        @($tierCounts, [string]$item.delivery_tier),
        @($scopeDispositionCounts, [string]$item.scope_disposition)
    )) {
        $target = $pair[0]
        $key = [string]$pair[1]
        if (-not $target.Contains($key)) {
            $target[$key] = 0
        }
        $target[$key] += 1
    }
}

$ledger = [ordered]@{
    schema_version = 3
    source_scope = 'Leyforge Documents 00-30 governed specification'
    source_root = '.summer/00_Docs'
    production_package_source = '.summer/requirements/production-path.json'
    production_package_source_sha256 = (
        Get-FileHash -LiteralPath $productionPath -Algorithm SHA256
    ).Hash.ToLowerInvariant()
    primary_document_count = $primaryManifest.Count
    source_document_count = $documentManifest.Count
    requirement_count = $items.Count
    status_vocabulary = $statusVocabulary
    accepted_delivery_tiers = $acceptedTiers
    non_blocking_delivery_tiers = $nonBlockingTiers
    phase_counts = $phaseCounts
    kind_counts = $kindCounts
    status_counts = $statusCounts
    package_counts = $packageCounts
    delivery_tier_counts = $tierCounts
    scope_disposition_counts = $scopeDispositionCounts
    document_manifest = $documentManifest
    requirements = $items
}
$content = ($ledger | ConvertTo-Json -Depth 10) + "`n"

if ($Check) {
    if (-not (Test-Path -LiteralPath $OutputPath -PathType Leaf)) {
        throw "Requirement ledger is missing: $OutputPath"
    }
    $current = [IO.File]::ReadAllText($OutputPath)
    if ($current -ne $content) {
        throw (
            'Requirement ledger is stale. Run ' +
            '.summer/tools/generate_requirement_ledger.ps1'
        )
    }
    Write-Host (
        "REQUIREMENT_LEDGER PASS primary_documents=$($primaryManifest.Count) " +
        "documents=$($documentManifest.Count) requirements=$($items.Count)"
    )
    return
}

$parent = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Path $parent -Force | Out-Null
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($OutputPath, $content, $utf8NoBom)
Write-Host (
    "REQUIREMENT_LEDGER UPDATED primary_documents=$($primaryManifest.Count) " +
    "documents=$($documentManifest.Count) requirements=$($items.Count) " +
    "path=$OutputPath"
)
