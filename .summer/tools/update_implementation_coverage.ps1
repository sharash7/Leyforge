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
    $InputPath = Join-Path $ProjectPath (
        '.summer\requirements\implementation-coverage.json'
    )
}
if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $ProjectPath (
        '.summer\requirements\IMPLEMENTATION_COVERAGE.md'
    )
}

if (-not (Test-Path -LiteralPath $InputPath -PathType Leaf)) {
    throw "Implementation coverage source is missing: $InputPath"
}

$sourceText = [IO.File]::ReadAllText($InputPath)
$coverage = $sourceText | ConvertFrom-Json
$entries = @($coverage.entries)
$statusVocabulary = @(
    'Implemented',
    'Partial',
    'Stub',
    'Missing',
    'Legacy / superseded',
    'Cannot determine'
)
$requiredFields = @(
    'document_set',
    'requirement_section',
    'authoritative_owner',
    'dependencies_interfaces',
    'expected_implementation_area',
    'actual_repository_location',
    'status',
    'evidence',
    'tests_present',
    'risks_conflicts',
    'next_action'
)

if ([int]$coverage.schema_version -ne 1) {
    throw 'Implementation coverage schema must be v1'
}
if ($entries.Count -ne 32) {
    throw "Expected 32 major coverage entries, found $($entries.Count)"
}
$seen = @{}
foreach ($entry in $entries) {
    $documentSet = [string]$entry.document_set
    if ([string]::IsNullOrWhiteSpace($documentSet)) {
        throw 'Coverage entry has an empty document_set'
    }
    if ($seen.ContainsKey($documentSet)) {
        throw "Duplicate implementation coverage entry: $documentSet"
    }
    $seen[$documentSet] = $true
    foreach ($field in $requiredFields) {
        if ($entry.PSObject.Properties.Name -notcontains $field) {
            throw "Coverage entry $documentSet lacks required field $field"
        }
    }
    if ([string]$entry.status -notin $statusVocabulary) {
        throw "Coverage entry $documentSet has invalid status $($entry.status)"
    }
}

function ConvertTo-MarkdownCell {
    param([object]$Value)

    $values = if ($Value -is [Array]) { @($Value) } else { @($Value) }
    $text = ($values | ForEach-Object { [string]$_ }) -join '<br>'
    return $text.Replace('|', '\|').Replace("`r", '').Replace("`n", '<br>')
}

$sourceHash = (Get-FileHash -LiteralPath $InputPath -Algorithm SHA256).
    Hash.ToLowerInvariant()
$statusCounts = [ordered]@{}
foreach ($status in $statusVocabulary) {
    $statusCounts[$status] = @(
        $entries | Where-Object { [string]$_.status -eq $status }
    ).Count
}

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# Leyforge Implementation Coverage Register')
$lines.Add('')
$lines.Add("**Audit date:** $($coverage.audit_date)")
$lines.Add("**Scope:** Documents 00-30 governed specification")
$lines.Add("**Machine source SHA-256:** ``$sourceHash``")
$lines.Add((
    '**Safe runner:** ``Godot_v4.8-dev-a9c94-shutdown-fixed/' +
    'godot.windows.editor.x86_64.console.exe``'
))
$lines.Add('')
$lines.Add('This register records implementation evidence, not design importance or')
$lines.Add('catalogue presence. `Partial` means a working subset exists but the full')
$lines.Add('governed document scope is not complete.')
$lines.Add('')
$lines.Add('## Verification baseline')
$lines.Add('')
$baseline = $coverage.verification_baseline
$lines.Add(('- {0} scenes and {1} checks passed.' -f
    $baseline.scene_count, $baseline.check_count))
$lines.Add(('- Deterministic worldgen: {0} seeds.' -f $baseline.worldgen_seeds))
$lines.Add(('- Forge procedural structure stress: {0} seeds.' -f
    $baseline.forge_structure_stress_seeds))
$lines.Add("- Result: $($baseline.result).")
$lines.Add('')
$lines.Add('## Status counts')
$lines.Add('')
foreach ($status in $statusVocabulary) {
    $lines.Add("- ${status}: $($statusCounts[$status])")
}
$lines.Add('')
$lines.Add('## Coverage by major subsystem')
$lines.Add('')
$lines.Add('| Document/set | Requirement/section | Owner | Dependencies/interfaces | Expected area | Actual repository location | Status | Evidence | Tests | Risks/conflicts | Next action |')
$lines.Add('|---|---|---|---|---|---|---|---|---|---|---|')
foreach ($entry in $entries) {
    $cells = @(
        $entry.document_set,
        $entry.requirement_section,
        $entry.authoritative_owner,
        $entry.dependencies_interfaces,
        $entry.expected_implementation_area,
        $entry.actual_repository_location,
        $entry.status,
        $entry.evidence,
        $entry.tests_present,
        $entry.risks_conflicts,
        $entry.next_action
    ) | ForEach-Object { ConvertTo-MarkdownCell $_ }
    $lines.Add('| ' + ($cells -join ' | ') + ' |')
}
$content = ($lines -join "`n") + "`n"

if ($Check) {
    if (-not (Test-Path -LiteralPath $OutputPath -PathType Leaf)) {
        throw "Implementation coverage Markdown is missing: $OutputPath"
    }
    $current = [IO.File]::ReadAllText($OutputPath)
    if ($current -ne $content) {
        throw (
            'Implementation coverage Markdown is stale. Run ' +
            '.summer/tools/update_implementation_coverage.ps1'
        )
    }
    Write-Host (
        "IMPLEMENTATION_COVERAGE PASS entries=$($entries.Count) " +
        "source_sha256=$sourceHash"
    )
    return
}

$parent = Split-Path -Parent $OutputPath
New-Item -ItemType Directory -Path $parent -Force | Out-Null
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($OutputPath, $content, $utf8NoBom)
Write-Host (
    "IMPLEMENTATION_COVERAGE UPDATED entries=$($entries.Count) " +
    "source_sha256=$sourceHash path=$OutputPath"
)
