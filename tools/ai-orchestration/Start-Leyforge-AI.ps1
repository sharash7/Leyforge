param(
    [string]$LeyforgePath = "D:\AI\Projects\leyforge-rebuild"
)

$ErrorActionPreference = "Continue"

if (-not (Test-Path $LeyforgePath)) {
    $LeyforgePath = Read-Host "Paste the Leyforge repository folder"
}

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$watcher = Join-Path $here "Leyforge-Shadow-Checkpoint.ps1"

Write-Host "Starting Leyforge AI..." -ForegroundColor Cyan

if (Test-Path $watcher) {
    Start-Process powershell.exe -ArgumentList @(
        "-NoExit", "-NoProfile", "-ExecutionPolicy", "Bypass",
        "-File", "`"$watcher`"",
        "-RepoPath", "`"$LeyforgePath`""
    )
}

$ollamaUp = $false
try {
    $r = Invoke-WebRequest -UseBasicParsing -Uri "http://127.0.0.1:11434/api/tags" -TimeoutSec 1
    if ($r.StatusCode -eq 200) { $ollamaUp = $true }
} catch {}

if (-not $ollamaUp -and (Get-Command ollama -ErrorAction SilentlyContinue)) {
    Start-Process -WindowStyle Hidden -FilePath "ollama" -ArgumentList "serve"
}

if (Get-Command agent-canvas -ErrorAction SilentlyContinue) {
    Start-Process powershell.exe -ArgumentList @(
        "-NoExit", "-NoProfile", "-Command", "agent-canvas"
    )
    Start-Sleep -Seconds 6
    Start-Process "http://localhost:8000"
} else {
    Write-Warning "Agent Canvas is not installed/on PATH."
}

Write-Host ""
Write-Host "Agent Canvas + recovery + local Qwen service started." -ForegroundColor Green
Write-Host "Use Codex as primary."
Write-Host "When Codex is capped, open your normal Trae app on the SAME Leyforge repo."
Write-Host "Summer Engine is available to Codex and Trae through MCP."
