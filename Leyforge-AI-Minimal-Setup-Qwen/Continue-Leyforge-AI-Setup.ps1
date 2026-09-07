param(
    [string]$LeyforgePath = "D:\AI\Projects\leyforge-rebuild"
)

$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"
$QwenModel = "qwen2.5-coder:14b-instruct-q4_K_M"

function Step([string]$Message) {
    Write-Host ""
    Write-Host "============================================================" -ForegroundColor DarkCyan
    Write-Host $Message -ForegroundColor Cyan
    Write-Host "============================================================" -ForegroundColor DarkCyan
}

function Has-Command([string]$Name) {
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Refresh-Path {
    $machine = [Environment]::GetEnvironmentVariable("Path", "Machine")
    $user = [Environment]::GetEnvironmentVariable("Path", "User")
    $env:Path = "$machine;$user"
}

function Configure-TraeSummerMcp([string]$Repo) {
    $traeDir = Join-Path $Repo ".trae"
    $mcpPath = Join-Path $traeDir "mcp.json"
    New-Item -ItemType Directory -Force -Path $traeDir | Out-Null

    if (Test-Path $mcpPath) {
        try {
            $cfg = Get-Content -Raw $mcpPath | ConvertFrom-Json
        } catch {
            $backup = "$mcpPath.backup-" + (Get-Date -Format "yyyyMMdd-HHmmss")
            Copy-Item $mcpPath $backup
            Write-Warning "Existing .trae/mcp.json was invalid JSON. Backed it up to $backup."
            $cfg = [pscustomobject]@{}
        }
    } else {
        $cfg = [pscustomobject]@{}
    }

    if (-not ($cfg.PSObject.Properties.Name -contains "mcpServers")) {
        $cfg | Add-Member -NotePropertyName "mcpServers" -NotePropertyValue ([pscustomobject]@{})
    }

    $summer = [pscustomobject]@{
        command = "npx"
        args = @("-y", "summer-engine@latest", "mcp")
    }

    if ($cfg.mcpServers.PSObject.Properties.Name -contains "summer-engine") {
        $cfg.mcpServers."summer-engine" = $summer
    } else {
        $cfg.mcpServers | Add-Member -NotePropertyName "summer-engine" -NotePropertyValue $summer
    }

    $cfg | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 $mcpPath
    Write-Host "Summer Engine MCP configured for the Trae IDE at:" -ForegroundColor Green
    Write-Host "  $mcpPath"
}

function Ensure-Ollama {
    if (Has-Command "ollama") {
        Write-Host "Ollama already installed." -ForegroundColor Green
        return
    }

    if (-not (Has-Command "winget")) {
        throw "winget is unavailable, so Ollama cannot be installed automatically."
    }

    Write-Host "Installing Ollama..."
    & winget install --id Ollama.Ollama -e --accept-package-agreements --accept-source-agreements
    if ($LASTEXITCODE -ne 0) {
        throw "Ollama installation failed."
    }
    Refresh-Path

    if (-not (Has-Command "ollama")) {
        $p = Join-Path $env:LOCALAPPDATA "Programs\Ollama"
        if (Test-Path $p) { $env:Path = "$p;$env:Path" }
    }

    if (-not (Has-Command "ollama")) {
        throw "Ollama installed, but Windows has not exposed it to this terminal yet. Close this window and run CONTINUE-SETUP.cmd again."
    }
}

function Ensure-Qwen {
    $listed = ""
    try { $listed = (& ollama list) -join "`n" } catch {}

    if ($listed -match [regex]::Escape($QwenModel)) {
        Write-Host "$QwenModel already downloaded." -ForegroundColor Green
        return
    }

    Write-Host ""
    Write-Host "Downloading local Qwen coding model (~9.0 GB):" -ForegroundColor Yellow
    Write-Host "  $QwenModel" -ForegroundColor Yellow
    Write-Host ""
    & ollama pull $QwenModel
    if ($LASTEXITCODE -ne 0) {
        throw "Qwen model download did not complete. Running this setup again is safe."
    }
}

Write-Host ""
Write-Host "LEYFORGE AI - CONTINUE SETUP" -ForegroundColor Magenta
Write-Host "This resumes AFTER the Trae CLI 403 error."
Write-Host "It does NOT attempt to install TraeCode CLI."
Write-Host ""

if (-not (Test-Path $LeyforgePath)) {
    $entered = Read-Host "Paste the Leyforge repository folder"
    if ([string]::IsNullOrWhiteSpace($entered) -or -not (Test-Path $entered)) {
        throw "A valid Leyforge repository folder is required."
    }
    $LeyforgePath = (Resolve-Path $entered).Path
} else {
    $LeyforgePath = (Resolve-Path $LeyforgePath).Path
}

if (-not (Test-Path (Join-Path $LeyforgePath ".git"))) {
    throw "$LeyforgePath is not a Git repository."
}

Step "1 of 4 - Check the successful pieces"
if (Has-Command "agent-canvas") {
    Write-Host "Agent Canvas is installed." -ForegroundColor Green
} else {
    Write-Host "Agent Canvas is missing; installing it now..."
    & npm install -g @openhands/agent-canvas
    if ($LASTEXITCODE -ne 0) { throw "Agent Canvas installation failed." }
}

if (Has-Command "codex") {
    Write-Host "Codex CLI is installed." -ForegroundColor Green
} else {
    Write-Host "Codex CLI is missing; installing it now..."
    & npm install -g @openai/codex@latest
    if ($LASTEXITCODE -ne 0) { throw "Codex CLI installation failed." }
}

Step "2 of 4 - Summer Engine"
Write-Host "Configuring Summer MCP for Codex..."
& npx -y summer-engine@latest setup codex --yes
if ($LASTEXITCODE -ne 0) {
    Write-Warning "Summer's automatic Codex setup returned an error. We can fix that later without repeating the rest."
}
Configure-TraeSummerMcp -Repo $LeyforgePath

Step "3 of 4 - Local Qwen"
Ensure-Ollama
Ensure-Qwen

Step "4 of 4 - Recovery watcher + daily launcher"
$target = Join-Path $LeyforgePath "tools\ai-orchestration"
New-Item -ItemType Directory -Force -Path $target | Out-Null

$sourceDir = Split-Path -Parent $MyInvocation.MyCommand.Path
foreach ($name in @(
    "Leyforge-Shadow-Checkpoint.ps1",
    "Start-Leyforge-AI.ps1",
    "START-LEYFORGE-AI.cmd",
    "START-LOCAL-QWEN.cmd"
)) {
    $src = Join-Path $sourceDir $name
    if (Test-Path $src) {
        Copy-Item -Force $src (Join-Path $target $name)
    }
}

@{
    leyforge_path = $LeyforgePath
    recovery_ref = "refs/leyforge-recovery/latest"
    checkpoint_seconds = 300
    canvas_url = "http://localhost:8000"
    local_model = $QwenModel
    ollama_url = "http://127.0.0.1:11434"
    trae_mode = "desktop_manual_fallback"
} | ConvertTo-Json | Set-Content -Encoding UTF8 (Join-Path $target "leyforge-ai-config.json")

Write-Host ""
Write-Host "============================================================" -ForegroundColor Green
Write-Host "SETUP COMPLETE" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your simple setup is now:"
Write-Host "  Agent Canvas -> Codex + local Qwen"
Write-Host "  Trae desktop -> manual fallback on the same Leyforge repo"
Write-Host "  Summer Engine -> MCP for Codex + Trae"
Write-Host "  Recovery watcher -> local snapshots every five minutes"
Write-Host ""
Write-Host "Daily button:"
Write-Host "  $target\START-LEYFORGE-AI.cmd" -ForegroundColor Yellow
Write-Host ""
Write-Host "Next time, we will only do the two one-time UI connections:"
Write-Host "  1. Sign Codex into Agent Canvas"
Write-Host "  2. Add Ollama/Qwen as the local model in Agent Canvas"
Write-Host ""
Read-Host "Press Enter to close"
