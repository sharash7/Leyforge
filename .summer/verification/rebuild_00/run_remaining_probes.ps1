[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$ProjectPath,
    [Parameter(Mandatory = $true)][string]$EvidenceRoot,
    [Parameter(Mandatory = $true)][string]$ProfileRoot,
    [Parameter(Mandatory = $true)][string]$GodotConsole
)

$ErrorActionPreference = 'Stop'
. (Join-Path $ProjectPath '.summer\verification\godot_runner.ps1')
$GodotConsole = Resolve-LeyforgeGodotConsole -GodotConsole $GodotConsole
$env:APPDATA = $ProfileRoot
$env:LOCALAPPDATA = $ProfileRoot
New-Item -ItemType Directory -Path $ProfileRoot -Force | Out-Null
$gate = Get-Content -LiteralPath (Join-Path $ProjectPath '.summer\verification\run_current_regression_gate.ps1') -Raw
$entries = [regex]::Matches($gate, "(?m)^\s*'(res://[^']+\.tscn)'\s*=\s*(\d+)\s*$")
if ($entries.Count -ne 58) { throw 'Captured gate scene inventory changed; review before diagnostic continuation.' }
$results = @()
$blocking = 'SCRIPT ERROR|Parse Error|registry file not found|using fallback block set|RID allocations.*were leaked at exit|Leaked instance:|ObjectDB instances were leaked at exit|Resource still in use:|resources? still in use at exit|Orphan StringName:|unclaimed string names at exit'
$index = 0
foreach ($entry in $entries) {
    $index++
    # The official gate already ran these unchanged, with results in its log.
    if ($index -le 2) { continue }
    $scene = $entry.Groups[1].Value
    $expected = [int]$entry.Groups[2].Value
    $name = [IO.Path]::GetFileNameWithoutExtension($scene)
    Write-Host "Diagnostic $index/58 $name expected=$expected"
    $started = Get-Date
    $prior = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    $output = & $GodotConsole --headless --rendering-method gl_compatibility --path $ProjectPath --scene $scene --quit-after 1200 2>&1
    $sceneExit = $LASTEXITCODE
    $ErrorActionPreference = $prior
    $combined = ($output | ForEach-Object { $_.ToString() }) -join "`n"
    [IO.File]::WriteAllText((Join-Path $EvidenceRoot ($name + '.log')), $combined + "`n", (New-Object Text.UTF8Encoding($false)))
    $checkCounts = [regex]::Matches($combined, '"checks":(\d+)')
    $actual = if ($checkCounts.Count -eq 1) { [int]$checkCounts[0].Groups[1].Value } else { $null }
    $errors = @([regex]::Matches($combined, $blocking) | ForEach-Object { $_.Value } | Select-Object -Unique)
    $pass = $sceneExit -eq 0 -and $checkCounts.Count -eq 1 -and $actual -eq $expected -and $combined -match '"ok":true' -and $combined -match '"failures":\[\]' -and $errors.Count -eq 0
    $payloads = @()
    foreach ($line in ($combined -split "`n")) {
        $payloadMatch = [regex]::Match($line, '(\{.*"checks":.*\})')
        if ($payloadMatch.Success) {
            try { $payloads += ($payloadMatch.Groups[1].Value | ConvertFrom-Json) } catch { }
        }
    }
    $results += [ordered]@{
        scene=$scene; expected_checks=$expected; actual_checks=$actual; exit_code=$sceneExit;
        pass=$pass; blocking_diagnostics=$errors; payloads=$payloads;
        elapsed_seconds=[Math]::Round(((Get-Date) - $started).TotalSeconds, 2);
        log=($name + '.log')
    }
    $results | ConvertTo-Json -Depth 12 | Set-Content -LiteralPath (Join-Path $EvidenceRoot 'remaining-probes.json') -Encoding UTF8
    Write-Host "Result $name pass=$pass checks=$actual exit=$sceneExit"
}
[ordered]@{
    purpose='Diagnostic continuation after the unchanged official gate failed; does not change its FAIL result';
    completed=$results.Count; passed=@($results | Where-Object { $_.pass }).Count;
    failed=@($results | Where-Object { -not $_.pass }).Count;
    finished_at=(Get-Date -Format o); original_gate_result='FAIL'
} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $EvidenceRoot 'remaining-probes-result.json') -Encoding UTF8
Write-Host ('Diagnostic continuation finished: {0} passed, {1} failed.' -f @($results | Where-Object { $_.pass }).Count,@($results | Where-Object { -not $_.pass }).Count)
