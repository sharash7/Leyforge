Set-StrictMode -Version Latest

function Resolve-LeyforgeGodotConsole {
    [CmdletBinding()]
    param(
        [AllowEmptyString()]
        [string]$GodotConsole = ''
    )

    $defaultRunner = Join-Path $PSScriptRoot (
        '..\..\.local\Godot_v4.8-dev-a9c94-shutdown-fixed\' +
        'godot.windows.editor.x86_64.console.exe'
    )
    $candidate = if ([string]::IsNullOrWhiteSpace($GodotConsole)) {
        $defaultRunner
    } else {
        $GodotConsole
    }

    if (-not (Test-Path -LiteralPath $candidate -PathType Leaf)) {
        throw (
            "Safe Godot console executable not found: $candidate. " +
            'Use the tested a9c94 shutdown-fixed runner documented in AGENTS.md.'
        )
    }

    $resolved = (Resolve-Path -LiteralPath $candidate).Path
    $sha256 = (Get-FileHash -LiteralPath $resolved -Algorithm SHA256).Hash
    $blockedGodot463Hashes = @(
        'EF90E929BA1A6A4322860285D97F40F4AA349C90329A91B0E8B55B8DF0F4CB00',
        '63B3B2208819714C9677FBFDD8217C5B7DEE8ECF5F383502E826BC9E2227FF5A'
    )
    if ($sha256 -in $blockedGodot463Hashes) {
        throw (
            'Refusing to launch the known-crashing official Godot 4.6.3 ' +
            "binary: $resolved"
        )
    }

    return $resolved
}
