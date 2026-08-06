# Leyforge agent instructions

## Godot runner safety

- Never execute Godot 4.6.3 or 4.7.1 for Leyforge automation. Godot 4.6.3 has a confirmed native GDScript-language shutdown access violation, and 4.7.1 does not contain both upstream lifetime fixes.
- Use `D:\AI\Projects\leyforge\.local\Godot_v4.8-dev-a9c94-shutdown-fixed\godot.windows.editor.x86_64.console.exe` for probes and PowerShell verification gates.
- Use the adjacent `godot.windows.editor.x86_64.exe` only when an editor or rendered run is actually required.
- Historical documents and packaged evidence that mention Godot 4.6.3 describe the historical release baseline; they are not instructions to launch that engine.
- Do not restore or execute files ending in `.exe.disabled`. They are quarantined copies of the crashing engine retained only for recoverability.
- Run PowerShell gates with `powershell -NoProfile -ExecutionPolicy Bypass -File ...`. The verification scripts default to the fixed console runner and reject the known 4.6.3 executable hashes.
- Keep automated verification in an isolated writable project/profile when it may create imports or `user://` state. Do not mutate live/shared save fixtures.

Preserve unrelated dirty-worktree changes. Do not stage or commit unless the user asks.
