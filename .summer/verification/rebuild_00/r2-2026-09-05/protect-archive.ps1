$ErrorActionPreference = 'Stop'
$env:GIT_TERMINAL_PROMPT = '0'
$env:GCM_INTERACTIVE = 'Never'
$auth = @{}
$authLines = @("protocol=https`nhost=github.com`n`n" | git credential fill)
if ($LASTEXITCODE -ne 0) { throw 'Stored GitHub authentication unavailable' }
foreach ($line in $authLines) {
    $pair = $line -split '=', 2
    if ($pair.Count -eq 2) { $auth[$pair[0]] = $pair[1] }
}
$headers = @{ Authorization = ('Bearer ' + $auth.password); Accept = 'application/vnd.github+json'; 'X-GitHub-Api-Version' = '2022-11-28' }
$endpoint = 'https://api.github.com/repos/sharash7/Leyforge/rulesets'
$specs = @(
    @{ name = 'REBUILD-00 frozen legacy POC tag'; target = 'tag'; ref = 'refs/tags/legacy-poc-2026-09-05' },
    @{ name = 'REBUILD-00 frozen legacy POC branch'; target = 'branch'; ref = 'refs/heads/codex/chore/rebuild-00-archive' }
)
$records = @()
foreach ($spec in $specs) {
    $existing = Invoke-RestMethod -Uri $endpoint -Headers $headers
    $matches = @($existing | Where-Object name -EQ $spec.name)
    if ($matches.Count -gt 1) { throw 'Ambiguous existing archive rulesets' }
    if ($matches.Count -eq 0) {
        $body = @{
            name = $spec.name; target = $spec.target; enforcement = 'active'; bypass_actors = @()
            conditions = @{ ref_name = @{ include = @($spec.ref); exclude = @() } }
            rules = @(@{ type = 'update'; parameters = @{ update_allows_fetch_and_merge = $false } }, @{ type = 'deletion' })
        } | ConvertTo-Json -Depth 10
        $created = Invoke-RestMethod -Method Post -Uri $endpoint -Headers $headers -ContentType 'application/json' -Body $body
        $id = $created.id
    } else { $id = $matches[0].id }
    $verified = Invoke-RestMethod -Uri "$endpoint/$id" -Headers $headers
    if ($verified.enforcement -ne 'active' -or $verified.target -ne $spec.target -or
        @($verified.bypass_actors).Count -ne 0 -or
        @($verified.conditions.ref_name.include).Count -ne 1 -or $verified.conditions.ref_name.include[0] -ne $spec.ref -or
        @($verified.conditions.ref_name.exclude).Count -ne 0 -or
        'update' -notin $verified.rules.type -or 'deletion' -notin $verified.rules.type) { throw "Protection verification failed: $id" }
    $records += $verified
    $records | ConvertTo-Json -Depth 25 | Set-Content -LiteralPath '.local/r02-20260905/remote-protection.json' -Encoding utf8
    Write-Output "Verified $($spec.target) protection: ruleset $id"
}
$branchRules = Invoke-RestMethod -Uri 'https://api.github.com/repos/sharash7/Leyforge/rules/branches/codex%2Fchore%2Frebuild-00-archive' -Headers $headers
if ('update' -notin $branchRules.type -or 'deletion' -notin $branchRules.type) { throw 'Effective branch rules missing' }
$branchRules | ConvertTo-Json -Depth 15 | Set-Content -LiteralPath '.local/r02-20260905/effective-branch-rules.json' -Encoding utf8
