[CmdletBinding()]
param(
    [string]$ProjectPath = ''
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}

$requirementsPath = Join-Path $ProjectPath (
    '.summer\requirements\leyforge-requirements.json'
)
$coveragePath = Join-Path $ProjectPath (
    '.summer\requirements\implementation-coverage.json'
)
$coverageMarkdownPath = Join-Path $ProjectPath (
    '.summer\requirements\IMPLEMENTATION_COVERAGE.md'
)

$failures = [System.Collections.Generic.List[string]]::new()
$checks = 0

function Assert-Governance {
    param(
        [bool]$Condition,
        [string]$Failure
    )

    $script:checks += 1
    if (-not $Condition) {
        $script:failures.Add($Failure)
    }
}

function Add-CodeRange {
    param(
        [System.Collections.Generic.List[string]]$Target,
        [int]$Start,
        [int]$End,
        [string]$Prefix = '',
        [string[]]$Suffixes = @('')
    )

    for ($number = $Start; $number -le $End; $number++) {
        foreach ($suffix in $Suffixes) {
            $Target.Add(('{0}{1:D2}{2}' -f $Prefix, $number, $suffix))
        }
    }
}

$requiredPrimaryIds = [System.Collections.Generic.List[string]]::new()
Add-CodeRange -Target $requiredPrimaryIds -Start 0 -End 20
foreach ($suffix in 'ABCDEFGH'.ToCharArray()) {
    $requiredPrimaryIds.Add("20$suffix")
}
foreach ($suffix in 'ABCDEFG'.ToCharArray()) {
    $requiredPrimaryIds.Add("21$suffix")
}
foreach ($suffix in 'ABCDEFGHIJKL'.ToCharArray()) {
    $requiredPrimaryIds.Add("22$suffix")
}
foreach ($suffix in 'ABCDEFGHIJ'.ToCharArray()) {
    $requiredPrimaryIds.Add("23$suffix")
}
foreach ($suffix in 'ABCDEFGHIJKL'.ToCharArray()) {
    $requiredPrimaryIds.Add("24$suffix")
}
foreach ($suffix in 'ABCDEFGHIJKL'.ToCharArray()) {
    $requiredPrimaryIds.Add("25$suffix")
}
foreach ($suffix in 'ABCDEFGHIJKLMNO'.ToCharArray()) {
    $requiredPrimaryIds.Add("26$suffix")
}
foreach ($set in 27..30) {
    foreach ($suffix in 'ABCDEFGHIJ'.ToCharArray()) {
        $requiredPrimaryIds.Add("$set$suffix")
    }
}

Assert-Governance -Condition (
    Test-Path -LiteralPath $requirementsPath -PathType Leaf
) -Failure 'requirement ledger is missing'
Assert-Governance -Condition (
    Test-Path -LiteralPath $coveragePath -PathType Leaf
) -Failure 'machine-readable implementation coverage register is missing'
Assert-Governance -Condition (
    Test-Path -LiteralPath $coverageMarkdownPath -PathType Leaf
) -Failure 'implementation coverage Markdown is missing'

$requirements = if (Test-Path -LiteralPath $requirementsPath -PathType Leaf) {
    [IO.File]::ReadAllText($requirementsPath) | ConvertFrom-Json
} else {
    [pscustomobject]@{}
}
$coverage = if (Test-Path -LiteralPath $coveragePath -PathType Leaf) {
    [IO.File]::ReadAllText($coveragePath) | ConvertFrom-Json
} else {
    [pscustomobject]@{}
}

Assert-Governance -Condition (
    [int]$requirements.schema_version -ge 2
) -Failure 'requirement ledger schema must be v2 or newer'
Assert-Governance -Condition (
    [int]$requirements.primary_document_count -eq 137
) -Failure 'requirement ledger must contain exactly 137 primary Documents 00-30'
Assert-Governance -Condition (
    [string]$requirements.source_scope -eq 'Leyforge Documents 00-30 governed specification'
) -Failure 'requirement ledger source scope is not Documents 00-30'

$manifest = @($requirements.document_manifest | Where-Object { $null -ne $_ })
$primaryManifest = @($manifest | Where-Object { $_.role -eq 'primary' })
$primaryIds = @($primaryManifest | ForEach-Object { [string]$_.document_id })
foreach ($documentId in $requiredPrimaryIds) {
    Assert-Governance -Condition ($documentId -in $primaryIds) `
        -Failure "primary document is absent from manifest: $documentId"
}
Assert-Governance -Condition (
    @($primaryIds | Sort-Object -Unique).Count -eq $requiredPrimaryIds.Count
) -Failure 'primary document manifest contains duplicate or unexpected identities'

foreach ($entry in $manifest) {
    $path = [string]$entry.path
    Assert-Governance -Condition (
        $path -notmatch '(?i)(?:^|/)OLD(?:/|$)'
    ) -Failure "OLD document entered active manifest: $path"
    Assert-Governance -Condition (
        -not [string]::IsNullOrWhiteSpace([string]$entry.content_sha256)
    ) -Failure "document manifest entry lacks SHA-256: $path"
}

foreach ($governanceId in @(
    'FOUNDATION-00-20-RECONCILIATION',
    'XSET-27-30-INTERFACE-REGISTER',
    'XSET-27-30-RECONCILIATION-REPORT'
)) {
    Assert-Governance -Condition (
        @($manifest | Where-Object { $_.document_id -eq $governanceId }).Count -eq 1
    ) -Failure "binding governance document is not canonical exactly once: $governanceId"
}

$coverageStatuses = @(
    'Implemented',
    'Partial',
    'Stub',
    'Missing',
    'Legacy / superseded',
    'Cannot determine'
)
$requiredCoverageIds = [System.Collections.Generic.List[string]]::new()
foreach ($number in 0..20) {
    $requiredCoverageIds.Add(('{0:D2}' -f $number))
}
$requiredCoverageIds.Add('20A-20H')
foreach ($number in 21..30) {
    $requiredCoverageIds.Add([string]$number)
}
$coverageEntries = @($coverage.entries)
Assert-Governance -Condition (
    [int]$coverage.schema_version -eq 1
) -Failure 'implementation coverage schema must be v1'
Assert-Governance -Condition (
    $coverageEntries.Count -eq $requiredCoverageIds.Count
) -Failure 'implementation coverage must contain one row per major Document 00-30 subsystem'
foreach ($coverageId in $requiredCoverageIds) {
    $matches = @($coverageEntries | Where-Object { $_.document_set -eq $coverageId })
    Assert-Governance -Condition ($matches.Count -eq 1) `
        -Failure "coverage row is not canonical exactly once: $coverageId"
    if ($matches.Count -ne 1) {
        continue
    }
    $entry = $matches[0]
    Assert-Governance -Condition (
        [string]$entry.status -in $coverageStatuses
    ) -Failure "coverage row has invalid status: $coverageId"
    foreach ($field in @(
        'requirement_section',
        'authoritative_owner',
        'dependencies_interfaces',
        'expected_implementation_area',
        'actual_repository_location',
        'evidence',
        'tests_present',
        'risks_conflicts',
        'next_action'
    )) {
        Assert-Governance -Condition (
            $entry.PSObject.Properties.Name -contains $field
        ) -Failure "coverage row $coverageId lacks field $field"
    }
}

if (Test-Path -LiteralPath $coverageMarkdownPath -PathType Leaf) {
    $coverageMarkdown = [IO.File]::ReadAllText($coverageMarkdownPath)
    Assert-Governance -Condition (
        $coverageMarkdown -match 'Godot_v4\.8-dev-a9c94-shutdown-fixed'
    ) -Failure 'coverage Markdown does not pin the safe Godot runner'
    Assert-Governance -Condition (
        $coverageMarkdown -match 'Documents 00-30'
    ) -Failure 'coverage Markdown does not declare Documents 00-30 scope'
}

$result = [ordered]@{
    ok = $failures.Count -eq 0
    checks = $checks
    primary_documents = $primaryManifest.Count
    manifest_documents = $manifest.Count
    coverage_entries = $coverageEntries.Count
    failures = @($failures)
}
$json = $result | ConvertTo-Json -Compress
Write-Host "DOCUMENT_GOVERNANCE_PROBE $json"
if ($failures.Count -gt 0) {
    exit 1
}
