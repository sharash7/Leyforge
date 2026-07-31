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
$docsRoot = Join-Path $ProjectPath '.summer\00_Docs'
if ([string]::IsNullOrWhiteSpace($OutputPath)) {
    $OutputPath = Join-Path $docsRoot 'SHA256SUMS.txt'
}
if (-not (Test-Path -LiteralPath $docsRoot -PathType Container)) {
    throw "Canonical document directory not found: $docsRoot"
}

$files = @(
    Get-ChildItem -LiteralPath $docsRoot -File |
        Where-Object {
            $_.Name -ne 'SHA256SUMS.txt' -and
            $_.Extension -in @('.md', '.json')
        }
    Get-ChildItem -LiteralPath (Join-Path $docsRoot '20-A-H') `
        -File -Filter '*.md'
    Get-ChildItem -LiteralPath (Join-Path $docsRoot 'docx') `
        -File -Filter '*.docx'
)

$baseUri = [Uri]::new(($docsRoot.TrimEnd('\') + '\'))
$entries = foreach ($file in $files) {
    $relative = [Uri]::UnescapeDataString(
        $baseUri.MakeRelativeUri([Uri]::new($file.FullName)).ToString()
    )
    [ordered]@{
        Path = $relative
        Hash = (Get-FileHash -LiteralPath $file.FullName -Algorithm SHA256).
            Hash.ToLowerInvariant()
    }
}
$lines = @(
    $entries |
        Sort-Object Path |
        ForEach-Object { "$($_.Hash)  $($_.Path)" }
)
$content = ($lines -join "`n") + "`n"

if ($Check) {
    if (-not (Test-Path -LiteralPath $OutputPath -PathType Leaf)) {
        throw "Document checksum manifest is missing: $OutputPath"
    }
    $current = [IO.File]::ReadAllText($OutputPath)
    if ($current -ne $content) {
        throw (
            'Document checksum manifest is stale. Run ' +
            '.summer/tools/update_document_checksums.ps1'
        )
    }
    Write-Host "DOCUMENT_CHECKSUMS PASS files=$($entries.Count)"
    return
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[IO.File]::WriteAllText($OutputPath, $content, $utf8NoBom)
Write-Host (
    "DOCUMENT_CHECKSUMS UPDATED files=$($entries.Count) path=$OutputPath"
)
