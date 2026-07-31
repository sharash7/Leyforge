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

$statusVocabulary = @(
    'unverified',
    'absent',
    'partial',
    'implemented',
    'verified',
    'deferred',
    'not_applicable'
)
$priorById = @{}
if (Test-Path -LiteralPath $OutputPath -PathType Leaf) {
    $priorLedger = [IO.File]::ReadAllText($OutputPath) | ConvertFrom-Json
    foreach ($prior in $priorLedger.requirements) {
        $priorById[[string]$prior.id] = $prior
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
        'definition of done|proof.of.concept|\bpoc\b|implementation|' +
        'milestone|production wave|backlog|post-poc|full game|' +
        'scale target|open question|defer'
    )
}

function Get-RequirementKind {
    param([string]$Section, [string]$Text)

    $combined = "$Section $Text"
    if ($combined -match '(?i)open question|defer|not part of|out of scope') {
        return 'deferral'
    }
    if ($combined -match '(?i)locked|decision') {
        return 'decision'
    }
    if (
        $combined -match
        '(?i)acceptance|success criteria|definition of done|must pass'
    ) {
        return 'acceptance'
    }
    if ($combined -match '(?i)milestone|production wave|stage|phase') {
        return 'milestone'
    }
    return 'requirement'
}

function Get-RoadmapPhase {
    param(
        [string]$DocumentCode,
        [string]$Section,
        [string]$Text,
        [string]$Kind
    )

    $combined = "$Section $Text"
    if ($Kind -eq 'decision') {
        return 'Phase 0 - Baseline and decisions'
    }
    if ($combined -match '(?i)proof.of.concept|\bpoc\b|wave 1') {
        return 'Phase 1 - POC closure'
    }
    if ($combined -match '(?i)alpha|wave 2|wave 3') {
        return 'Phase 2 - Alpha breadth'
    }
    if (
        $combined -match
        '(?i)town|city|realm simulation|wave 4|civilisation scale'
    ) {
        return 'Phase 3 - Civilisation depth'
    }
    if (
        $DocumentCode -eq '18' -or
        $combined -match (
            '(?i)security|privacy|performance|localisation|' +
            'certification|release|platform'
        )
    ) {
        return 'Phase 5 - Production readiness'
    }
    return 'Phase 4 - Full-game completion'
}

$sourceFiles = @()
$sourceFiles += Get-ChildItem -LiteralPath $docsRoot -File -Filter '*.md' |
    Where-Object { $_.Name -match '^(?:0\d|1\d|20)_' }
$supplementRoot = Join-Path $docsRoot '20-A-H'
$sourceFiles += Get-ChildItem -LiteralPath $supplementRoot -File -Filter '*.md' |
    Where-Object { $_.Name -match '^20[A-H]_' }
$forgeRoot = Join-Path $docsRoot '21-A-G'
$sourceFiles += Get-ChildItem -LiteralPath $forgeRoot -File -Filter '*.md' |
    Where-Object { $_.Name -match '^21[A-G]_' }
$sourceFiles = @($sourceFiles | Sort-Object FullName)

$items = [System.Collections.Generic.List[object]]::new()
foreach ($file in $sourceFiles) {
    $documentCode = $file.BaseName.Split('_')[0]
    $relativePath = Get-RelativePath -BasePath $ProjectPath `
        -TargetPath $file.FullName
    $lines = [IO.File]::ReadAllLines($file.FullName)
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
            '\brequired\b|\bshall\b|locked rule'
        )
        $inRequirementSection = Test-RequirementSection $section
        $include = (
            ($inRequirementSection -and ($isTableRow -or $isListItem)) -or
            $isNormative
        )
        if (
            -not $include -or
            $isTableSeparator -or
            $nextIsTableSeparator
        ) {
            continue
        }

        $text = ConvertFrom-MarkdownRequirement $trimmed
        if ($text.Length -lt 12) {
            continue
        }
        $kind = Get-RequirementKind -Section $section -Text $text
        $phase = Get-RoadmapPhase -DocumentCode $documentCode `
            -Section $section -Text $text -Kind $kind
        $lineNumber = $index + 1
        $id = ('REQ-{0}-{1:D5}' -f $documentCode, $lineNumber)
        $status = 'unverified'
        $evidence = @()
        if ($priorById.ContainsKey($id)) {
            $prior = $priorById[$id]
            if (
                [string]$prior.path -eq $relativePath -and
                [string]$prior.text -eq $text -and
                [string]$prior.implementation_status -in $statusVocabulary
            ) {
                $status = [string]$prior.implementation_status
                $evidence = @($prior.evidence)
            }
        }
        $items.Add([ordered]@{
            id = $id
            document = $documentCode
            path = $relativePath
            line = $lineNumber
            section = $section
            kind = $kind
            text = $text
            implementation_status = $status
            evidence = $evidence
            roadmap_phase = $phase
        })
    }
}

$phaseCounts = [ordered]@{}
$kindCounts = [ordered]@{}
$statusCounts = [ordered]@{}
foreach ($item in $items) {
    $phaseKey = [string]$item.roadmap_phase
    $kindKey = [string]$item.kind
    $statusKey = [string]$item.implementation_status
    if (-not $phaseCounts.Contains($phaseKey)) {
        $phaseCounts[$phaseKey] = 0
    }
    if (-not $kindCounts.Contains($kindKey)) {
        $kindCounts[$kindKey] = 0
    }
    if (-not $statusCounts.Contains($statusKey)) {
        $statusCounts[$statusKey] = 0
    }
    $phaseCounts[$phaseKey] += 1
    $kindCounts[$kindKey] += 1
    $statusCounts[$statusKey] += 1
}

$ledger = [ordered]@{
    schema_version = 1
    source = '.summer/00_Docs canonical Markdown set 00-21G'
    source_document_count = $sourceFiles.Count
    requirement_count = $items.Count
    status_vocabulary = $statusVocabulary
    phase_counts = $phaseCounts
    kind_counts = $kindCounts
    status_counts = $statusCounts
    requirements = $items
}
$content = ($ledger | ConvertTo-Json -Depth 8) + "`n"

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
        "REQUIREMENT_LEDGER PASS documents=$($sourceFiles.Count) " +
        "requirements=$($items.Count)"
    )
    return
}

$parent = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Path $parent -Force | Out-Null
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($OutputPath, $content, $utf8NoBom)
Write-Host (
    "REQUIREMENT_LEDGER UPDATED documents=$($sourceFiles.Count) " +
    "requirements=$($items.Count) path=$OutputPath"
)
