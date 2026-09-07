param(
    [string]$RepoPath = "D:\AI\Projects\leyforge-rebuild",
    [int]$IntervalSeconds = 300
)

$ErrorActionPreference = "Stop"
$RecoveryRef = "refs/leyforge-recovery/latest"

function Snapshot-Recovery {
    Push-Location $RepoPath
    $tempIndex = Join-Path $env:TEMP ("leyforge-recovery-" + [guid]::NewGuid().ToString("N") + ".index")

    $oldIndex = $env:GIT_INDEX_FILE
    $oldAuthorName = $env:GIT_AUTHOR_NAME
    $oldAuthorEmail = $env:GIT_AUTHOR_EMAIL
    $oldCommitterName = $env:GIT_COMMITTER_NAME
    $oldCommitterEmail = $env:GIT_COMMITTER_EMAIL

    try {
        $env:GIT_INDEX_FILE = $tempIndex
        $env:GIT_AUTHOR_NAME = "Leyforge Recovery Watcher"
        $env:GIT_AUTHOR_EMAIL = "recovery@leyforge.local"
        $env:GIT_COMMITTER_NAME = "Leyforge Recovery Watcher"
        $env:GIT_COMMITTER_EMAIL = "recovery@leyforge.local"

        & git read-tree HEAD
        if ($LASTEXITCODE -ne 0) { throw "git read-tree failed" }

        & git add -A
        if ($LASTEXITCODE -ne 0) { throw "temporary git add failed" }

        $tree = (& git write-tree).Trim()
        if (-not $tree) { throw "git write-tree failed" }

        $previousCommit = $null
        $previousTree = $null
        & git show-ref --verify --quiet $RecoveryRef
        if ($LASTEXITCODE -eq 0) {
            $previousCommit = (& git rev-parse $RecoveryRef).Trim()
            $previousTree = (& git rev-parse "$RecoveryRef^{tree}").Trim()
        }

        if ($tree -eq $previousTree) { return }

        $baseHead = (& git rev-parse HEAD).Trim()
        $message = "Leyforge local recovery snapshot`n`nBase HEAD: $baseHead`nTime: $((Get-Date).ToString('o'))"

        if ($previousCommit) {
            $commit = ($message | & git commit-tree $tree -p $previousCommit).Trim()
        } else {
            $commit = ($message | & git commit-tree $tree -p $baseHead).Trim()
        }

        if (-not $commit) { throw "git commit-tree failed" }

        & git update-ref $RecoveryRef $commit
        if ($LASTEXITCODE -ne 0) { throw "git update-ref failed" }

        Write-Host ("[{0}] Protected local snapshot: {1}" -f (Get-Date -Format "HH:mm:ss"), $commit.Substring(0,12)) -ForegroundColor Green
    }
    finally {
        if ($null -eq $oldIndex) { Remove-Item Env:\GIT_INDEX_FILE -ErrorAction SilentlyContinue } else { $env:GIT_INDEX_FILE = $oldIndex }
        if ($null -eq $oldAuthorName) { Remove-Item Env:\GIT_AUTHOR_NAME -ErrorAction SilentlyContinue } else { $env:GIT_AUTHOR_NAME = $oldAuthorName }
        if ($null -eq $oldAuthorEmail) { Remove-Item Env:\GIT_AUTHOR_EMAIL -ErrorAction SilentlyContinue } else { $env:GIT_AUTHOR_EMAIL = $oldAuthorEmail }
        if ($null -eq $oldCommitterName) { Remove-Item Env:\GIT_COMMITTER_NAME -ErrorAction SilentlyContinue } else { $env:GIT_COMMITTER_NAME = $oldCommitterName }
        if ($null -eq $oldCommitterEmail) { Remove-Item Env:\GIT_COMMITTER_EMAIL -ErrorAction SilentlyContinue } else { $env:GIT_COMMITTER_EMAIL = $oldCommitterEmail }

        Remove-Item -Force $tempIndex -ErrorAction SilentlyContinue
        Pop-Location
    }
}

if (-not (Test-Path (Join-Path $RepoPath ".git"))) {
    throw "Leyforge repository not found at '$RepoPath'."
}

Write-Host "Leyforge recovery watcher is running." -ForegroundColor Cyan
Write-Host "Snapshots every $IntervalSeconds seconds to $RecoveryRef"
Write-Host "It does NOT change your branch, HEAD, staging area, or GitHub."
Write-Host "Leave this window open while agents are working."
Write-Host ""

while ($true) {
    try { Snapshot-Recovery }
    catch { Write-Warning $_.Exception.Message }
    Start-Sleep -Seconds $IntervalSeconds
}
