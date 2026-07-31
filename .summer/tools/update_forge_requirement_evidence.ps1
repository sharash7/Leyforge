[CmdletBinding()]
param(
    [string]$ProjectPath = '',

    [string]$LedgerPath = ''
)

$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($ProjectPath)) {
    $ProjectPath = (Resolve-Path (Join-Path $PSScriptRoot '..\..')).Path
}
if ([string]::IsNullOrWhiteSpace($LedgerPath)) {
    $LedgerPath = Join-Path $ProjectPath (
        '.summer\requirements\leyforge-requirements.json'
    )
}

$focusedEvidence = @(
    '.summer/verification/forge_mvp_probe.gd',
    '.summer/verification/forge_mvp_probe.tscn',
    '.summer/requirements/FORGE_IMPLEMENTATION_COVERAGE.md'
)
$gateEvidence = @(
    '.summer/verification/run_current_regression_gate.ps1',
    '.summer/requirements/FORGE_IMPLEMENTATION_COVERAGE.md'
)
$uiEvidence = @(
    'scripts/forge/ui/forge_workspace.gd',
    'scripts/forge/ui/forge_preview_viewport.gd',
    '.summer/verification/forge_mvp_probe.gd'
)
$previewEvidence = @(
    'scripts/forge/ui/forge_preview_viewport.gd',
    'scripts/forge/ui/forge_workspace.gd',
    '.summer/verification/forge_mvp_probe.gd',
    '.summer/verification/forge_preview_capture.gd',
    '.summer/verification/forge_preview_capture.tscn'
)
$deferralEvidence = @(
    '.summer/requirements/FORGE_IMPLEMENTATION_COVERAGE.md',
    '.summer/plans/voxel-asset-forge-implementation-handover.md'
)

$updates = @{}

function Add-EvidenceUpdate {
    param(
        [string[]]$Ids,
        [string]$Status,
        [string[]]$Evidence
    )

    foreach ($id in $Ids) {
        $script:updates[$id] = @{
            status = $Status
            evidence = @($Evidence)
        }
    }
}

Add-EvidenceUpdate -Status 'verified' -Evidence $focusedEvidence -Ids @(
    'REQ-21A-00708', 'REQ-21A-00709', 'REQ-21A-00710',
    'REQ-21A-00711', 'REQ-21A-00712', 'REQ-21A-00713',
    'REQ-21A-00714', 'REQ-21A-00715', 'REQ-21A-00716',
    'REQ-21A-00717', 'REQ-21A-00718', 'REQ-21A-00719',
    'REQ-21A-00720', 'REQ-21A-00721',
    'REQ-21B-01390', 'REQ-21B-01391', 'REQ-21B-01392',
    'REQ-21B-01394', 'REQ-21B-01395', 'REQ-21B-01397',
    'REQ-21B-01403', 'REQ-21B-01405', 'REQ-21B-01406',
    'REQ-21B-01407', 'REQ-21B-01408',
    'REQ-21C-01407', 'REQ-21C-01408', 'REQ-21C-01409',
    'REQ-21C-01411', 'REQ-21C-01412', 'REQ-21C-01413',
    'REQ-21C-01415', 'REQ-21C-01416', 'REQ-21C-01422',
    'REQ-21C-01428',
    'REQ-21D-01436', 'REQ-21D-01437', 'REQ-21D-01438',
    'REQ-21D-01439', 'REQ-21D-01441', 'REQ-21D-01443',
    'REQ-21D-01445', 'REQ-21D-01446', 'REQ-21D-01447',
    'REQ-21D-01448', 'REQ-21D-01449', 'REQ-21D-01451',
    'REQ-21D-01458', 'REQ-21D-01460', 'REQ-21D-01462',
    'REQ-21F-01775', 'REQ-21F-01776', 'REQ-21F-01777',
    'REQ-21F-01778', 'REQ-21F-01779', 'REQ-21F-01780',
    'REQ-21F-01781', 'REQ-21F-01782', 'REQ-21F-01783',
    'REQ-21F-01784', 'REQ-21F-01785', 'REQ-21F-01786',
    'REQ-21F-01787',
    'REQ-21F-01982', 'REQ-21F-01983', 'REQ-21F-01984',
    'REQ-21F-01986', 'REQ-21F-01987', 'REQ-21F-01988',
    'REQ-21F-01989', 'REQ-21F-01990', 'REQ-21F-01991'
)

Add-EvidenceUpdate -Status 'implemented' -Evidence $uiEvidence -Ids @(
    'REQ-21A-00707',
    'REQ-21B-01393', 'REQ-21B-01396',
    'REQ-21C-01405', 'REQ-21C-01406',
    'REQ-21D-01440', 'REQ-21D-01444', 'REQ-21D-01459',
    'REQ-21F-01985'
)

Add-EvidenceUpdate -Status 'partial' -Evidence $focusedEvidence -Ids @(
    'REQ-21B-01404', 'REQ-21B-01409',
    'REQ-21C-01410', 'REQ-21C-01414', 'REQ-21C-01423',
    'REQ-21C-01424', 'REQ-21C-01425', 'REQ-21C-01426',
    'REQ-21C-01427',
    'REQ-21D-01442', 'REQ-21D-01457', 'REQ-21D-01461',
    'REQ-21F-01993'
)

Add-EvidenceUpdate -Status 'verified' -Evidence $uiEvidence -Ids @(
    'REQ-21E-01743', 'REQ-21E-01744', 'REQ-21E-01745',
    'REQ-21E-01746', 'REQ-21E-01747', 'REQ-21E-01748',
    'REQ-21E-01749', 'REQ-21E-01750', 'REQ-21E-01751',
    'REQ-21E-01752', 'REQ-21E-01753', 'REQ-21E-01754',
    'REQ-21E-01755', 'REQ-21E-01756', 'REQ-21E-01757',
    'REQ-21E-01758', 'REQ-21E-01759',
    'REQ-21E-01765', 'REQ-21E-01766', 'REQ-21E-01769',
    'REQ-21E-01770'
)

Add-EvidenceUpdate -Status 'partial' -Evidence $uiEvidence -Ids @(
    'REQ-21E-01767', 'REQ-21E-01768'
)

Add-EvidenceUpdate -Status 'partial' -Evidence $previewEvidence -Ids @(
    'REQ-21E-00523'
)

Add-EvidenceUpdate -Status 'verified' -Evidence $gateEvidence -Ids @(
    'REQ-21D-01450'
)

Add-EvidenceUpdate -Status 'deferred' -Evidence $deferralEvidence -Ids @(
    'REQ-21F-01791', 'REQ-21F-01792', 'REQ-21F-01793',
    'REQ-21F-01794', 'REQ-21F-01795', 'REQ-21F-01796',
    'REQ-21F-01797', 'REQ-21F-01798', 'REQ-21F-01799',
    'REQ-21F-01800'
)

$ledger = [IO.File]::ReadAllText($LedgerPath) | ConvertFrom-Json
$found = @{}
foreach ($requirement in $ledger.requirements) {
    $id = [string]$requirement.id
    if (-not $updates.ContainsKey($id)) {
        continue
    }
    $update = $updates[$id]
    $requirement.implementation_status = $update.status
    $requirement.evidence = @($update.evidence)
    $found[$id] = $true
}

$missing = @($updates.Keys | Where-Object { -not $found.ContainsKey($_) })
if ($missing.Count -gt 0) {
    throw "Forge evidence IDs are missing from the ledger: $($missing -join ', ')"
}

$statusCounts = [ordered]@{}
foreach ($requirement in $ledger.requirements) {
    $status = [string]$requirement.implementation_status
    if (-not $statusCounts.Contains($status)) {
        $statusCounts[$status] = 0
    }
    $statusCounts[$status] += 1
}
$ledger.status_counts = [pscustomobject]$statusCounts

$json = $ledger | ConvertTo-Json -Depth 8
[IO.File]::WriteAllText(
    $LedgerPath,
    $json + "`n",
    [Text.UTF8Encoding]::new($false)
)

Write-Host (
    'FORGE REQUIREMENT EVIDENCE: {0} rows updated; {1}' -f
    $updates.Count,
    (($statusCounts.GetEnumerator() | ForEach-Object {
        '{0}={1}' -f $_.Key, $_.Value
    }) -join ', ')
)
