# Leyforge Stage 9 Release Candidate

Build identity: `0.9.0-rc1`  
Godot baseline: `4.6.3-stable`  
Current save format: version 13  
Release target: Windows x86_64 POC

## Scope and Status

Stage 9 is the technical hardening stage defined by document 18. It confirms
the existing POC rather than adding the later village-project content described
by the separate core-gameplay roadmap.

Implemented:

- SHA-256 save integrity, bounded save validation, atomic rotation, and ordered
  final/previous/backup/temp recovery with a player-safe health report.
- Representative version-12 to version-13 migration fixtures and legacy
  version migration coverage.
- Performance, balanced, and quality scalability profiles that change
  streaming and presentation budgets without changing authoritative
  automation, magic, raid, or NPC state.
- Bounded frame profiling, world/system counters, build/content identity, and
  privacy-limited local diagnostics.
- Clean-session markers and next-launch unclean-session reporting without
  remote telemetry or personal/free-form data.
- NPC promotion/demotion soak, automation conservation regression, controller
  parity, 150 percent UI scale, reflow, focus, and English-locale readiness
  gates.
- An official-template Windows export preset and packaged-build traversal
  benchmark.

The automated release-candidate gate passes. The remaining owner action is the
short packaged manual sign-off in the living manual testing guide.

## Release Gates

A build is blocked if any of these conditions is true:

- a save is corrupted without detection, a valid backup cannot be recovered,
  or a supported save cannot migrate;
- a resource transaction duplicates, deletes, or loses authoritative content;
- the packaged build omits the 143-block/167-item runtime registry or uses its
  fallback registry;
- any of the 489 automated checks fails or emits a script/parse/content error;
- the packaged 1920x1080 balanced-profile benchmark exceeds 33.34 ms p95;
- the core POC loop crashes or fails the packaged manual smoke test.

The target guard is 16.67 ms p95 at 1920x1080. The 33.34 ms guard is the
documented fallback release floor, not the normal target.

## Reproducing the Automated Gate

Run all probes with an isolated user-data root:

```powershell
& ".\.summer\verification\run_stage9_release_gate.ps1" `
  -GodotConsole "C:\path\to\Godot_v4.6.3-stable_win64_console.exe"
```

Install the official Godot 4.6.3 standard export templates, then export:

```powershell
& "C:\path\to\Godot_v4.6.3-stable_win64_console.exe" `
  --headless `
  --path . `
  --export-release "Windows Desktop" "build\Leyforge.exe"
```

Run the packaged traversal at the target resolution:

```powershell
& ".\build\Leyforge.exe" `
  --rendering-method gl_compatibility `
  --resolution 1920x1080 `
  --audio-driver Dummy `
  -- `
  --stage9-benchmark
```

The package writes `leyforge_release_report.json` beneath the normal Leyforge
Godot user-data directory. The Pause menu also exposes **Write Release
Diagnostics** for an ordinary play session.

## Captured Reference Result

The official Windows x86_64 release-template package loaded 143 blocks and 167
items and completed 900 measured real-renderer frames after 180 warm-up frames
on:

- Windows 10 Home 10.0.19045;
- Intel Core i5-9600K, 6 logical processors;
- 16 GB system memory;
- NVIDIA GeForce RTX 2080 Ti, driver 32.0.16.1074;
- OpenGL compatibility renderer at 1920x1080.

Balanced-profile result:

- p95 frame time: 4.438 ms;
- maximum measured frame: 16.902 ms;
- 60 fps target guard: pass;
- 30 fps fallback guard: pass;
- package exit code and clean-session marker: pass.

The machine-readable package hashes and benchmark facts are stored in
`res://.summer/verification/stage9_packaged_benchmark_report.json`.

## Boundaries

- `main.tscn` remains owned by the Summer scene-hookup workflow and was not
  modified for Stage 9.
- The committed `build/` exclusion keeps local binaries and PCK files out of
  source control; the export preset and reproducible evidence are committed.
- This POC candidate does not add an installer, code signing, remote crash
  upload, analytics, or distribution-channel integration.
- There is no documented technical Stage 10. After packaged manual sign-off,
  new feature work needs a newly approved stage boundary rather than silently
  pulling later roadmap content into this release candidate.
