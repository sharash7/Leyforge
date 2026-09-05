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

## Startup and authority

Start with `brain/AGENTS.md`, `brain/CURRENT_HANDOFF.md`, `brain/HOME.md`, and `brain/00_CONTROL/DASH-GOVERNANCE.md`. Query before scanning the whole corpus.

Apply authority in this order:

1. Accepted canon and product authority.
2. `ENG-GOV-00`.
3. `ENG-GOV-01` through `ENG-GOV-15`.
4. Current architecture and accepted ADRs.
5. Root and path-specific `AGENTS.md` files.
6. Implementation, tests, tools and CI.

The Project Brain provides navigation, status, work memory and evidence. It does not replace the canonical files under `.summer/00_Docs`. `brain/00_CONTROL/governance-manifest.json` hash-pins the installed Branch B baseline and `brain/92_SCRIPTS/governance.py` validates its operational records.

## Task contract

Before nontrivial work, establish a durable or clearly stated Task contract containing: Objective, Scope, Out of Scope, Authority, Risk, Permissions, Acceptance Criteria, Verification, and Required Records. Classify risk as A (local), B (system), C (architectural), D (persistence/identity), or E (critical foundation). Escalate the verification and record burden with the risk.

Treat edit, commit, push, PR, merge, tag, and release as distinct permissions. Preserve unrelated dirty-worktree changes. Do not stage or commit unless the user asks. Do not accept a proposed ADR, approve a waiver, or promote source status without the owning authority.

## Records and exceptions

Use the source-derived templates under `brain/90_TEMPLATES/Governance/`. Allocate stable IDs and place records in their existing Brain domain: ADRs in `brain/05_DECISIONS/ADRs/`, Work and Task contracts in `brain/06_WORK/`, skills/procedures in `brain/07_KNOWHOW/`, dependencies in `brain/09_IMPLEMENTATION/Dependencies/`, and waivers, deprecations and governance debt in `brain/11_AUDIT/`.

Any exception to ENG-GOV requires a governed waiver with an exact rule link, bounded scope, risk, compensating controls, expiry or reconsideration condition, exit plan and approval. Do not use an expired waiver as active suppression. Missing automation belongs in a `GOV-DEBT-XXXX` record with current protection, desired mechanism, owner and activation milestone.

## Verification entrypoints

Run from the repository root:

```powershell
python tools/verify.py --tier build
python tools/verify.py --tier focused
python tools/verify.py --tier full
```

For narrowed diagnosis use `python brain/92_SCRIPTS/governance.py doctor --profile quick`, `rules --check`, `waivers --check`, `references --check`, or `impact --path <path>`. Run `python brain/92_SCRIPTS/brain.py doctor --profile certification` for Brain integrity and `python tools/verify_rebuild_boundary.py` for the clean-rebuild boundary.

## Rebuild phase boundary

The old implementation remains retired. Do not import it, execute historical tools, infer active dependency versions from it, or create a Godot runtime without the later governing authorization. Supplied documents retain their owning statuses, including closure-candidate PRDs. R6 is the bounded Brain-to-governance pilot after R5 certification. R8 gameplay permission remains closed.
