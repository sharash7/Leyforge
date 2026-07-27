# Document 20–20H Implementation Handover

Date: 2026-07-27  
Runtime target: Godot 4.6.3  
Save contract: version 14

## Delivered

The Document 20 catalogue is implemented as a data-driven settlement runtime:

- 120 canonical building definitions with the authoritative 20H scope split:
  30 POC, 35 Alpha, 49 Beta and 6 Final.
- 120 deterministic blueprints, 120 construction projects and 120 behavior
  definitions.
- 13 persisted district, complex and megaproject component graphs.
- 25 deterministic culture, region, biome, faction, realm, history and
  player-style packs using the documented nine-layer order.
- A validated `SettlementContentRegistry` autoload with stable-ID aliases,
  cross-reference validation, immutable read APIs and deterministic blueprint
  compilation.
- Typed definition and runtime records for buildings, projects, blueprints,
  plans, behaviors, packs and mutable settlement instances.
- Generic transactional project creation, resource reservation, staged voxel
  commits, NPC construction, activation, cancellation, damage, repair and
  persistence.
- A single seven-needs model covering Housing, Provisions, Health, Work,
  Safety, Infrastructure and Morale.
- Deterministic near/far settlement simulation, transactional production,
  capability progression and resource-zone enforcement.
- A prerequisite-aware project planner and independently persisted
  megaproject subprojects with partial activation and bounded effects.
- Version-13 to version-14 migration preserving watchtower progress, warehouse
  stock, NPC state and raid state. `project.watchtower.basic` remains an alias.

The canonical conflict resolutions are:

- `building.infrastructure.builder_supply_yard` is canonical;
  `building.construction.builder_supply_yard` is a migration alias.
- `building.storage.village_warehouse` is canonical.
- The watchtower is `building.safety.wooden_watchtower`, built by
  `project.build.wooden_watchtower` from `bp.building.watchtower_wood`.

`main.tscn` was not modified. The new registry is registered through
`project.godot`, and the existing watchtower gameplay enters the generic
pipeline through compatibility wrappers.

## Source Layout

- Editable catalogue data: `data/settlement/`
- Deterministic catalogue generators: `.summer/tools/`
- Registry autoload: `scripts/autoload/settlement_content_registry.gd`
- Mutable state and migration: `scripts/autoload/hamlet_state.gd`
- Typed records and simulation: `scripts/settlement/`
- Blueprint voxel integration: `scripts/world/voxel_world.gd`
- NPC construction integration: `scripts/world/hamlet_runtime.gd`
- Automated acceptance probes: `.summer/verification/settlement_*_probe.*`

## Verification

All verification used an isolated writable project copy and the official
portable Godot 4.6.3 executable.

- Document 20 gate: 442 checks passed.
- Existing Stage 9 regression gate: exactly 489 checks passed.
- Additional version-13 migration checks: 3 passed.
- Total automated assertions: 934 passed with no failures.
- Clean `main.tscn` startup: passed.
- `git diff --check`: passed.
- Existing packaged Stage 9 benchmark: 900 samples, 16.682 ms p95,
  30 fps guard passed at 1920x1080 OpenGL compatibility.

The Windows root-certificate-store warning remains environment-only and did
not accompany any failed probe.

## Remaining Human Sign-off

The automated controller/accessibility UI probe passed. A live Computer Use
launch was attempted, but its app approval timed out before a game window was
opened. The final human-visible controller/accessibility and cause-and-effect
walkthrough therefore remains an explicit manual sign-off item.

The generated blueprints are validated functional archetypes, not a bespoke
art pass for every late-game structure. Workshop sharing, executable mod
scripts and a new export remain deferred as required by Document 20.
