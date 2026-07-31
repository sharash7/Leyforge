# Leyforge Implementation Coverage Baseline

**Baseline date:** 30 July 2026  
**Active development version:** `0.10.0-dev`  
**Reference engine:** Godot 4.6.3  
**Assessment boundary:** canonical Documents 00-21 and 20A-20H / 21A-21G

## Executive finding

Leyforge has a mature, automated Forest Hamlet vertical slice and a strong
data-driven settlement foundation. It is not yet the full game described by
the document pack.

No canonical design document can honestly be marked complete at its full-game
scope. The current implementation proves the POC loop and selected extensions;
most Alpha, civilisation-scale, realm, multiplayer, content-scale, and
production requirements remain partial or absent. A directional feature-breadth
assessment places the current build at roughly **20-25% of the documented full
game**, with **75-80% still requiring implementation or explicit deferral**.
This is a planning estimate, not a fabricated requirement pass rate.

The generated ledger contains 6,442 traceable candidate rows from 36 documents.
They begin as `unverified`: decisions, deferrals, milestones, and repeated
requirements are included, so the row count must not be interpreted as 5,049
missing features. Phase 1 will attach implementation evidence and disposition
to the POC subset first.

## Confirmed implementation baseline

- 143 blocks and 169 items load through separate stable registries.
- All 45 crafting-grid recipes and 11 furnace/mana-furnace recipes are covered
  by exhaustive automation.
- The Forest Hamlet loop includes terrain streaming, editing, survival
  progression, inventory, crafting, refining, eight named NPCs, settlement
  construction, automation, magic, combat/raid aftermath, UI learning, and
  versioned atomic saves.
- Post-POC Stage A adds a main-menu world list, isolated multi-world saves,
  legacy import, save schema v17, regional worldgen v4, ID-scoped settlements,
  and an editor-only village progression lab. Worldgen v2/v3 saves retain their
  original algorithms.
- Document 20 has data foundations for 120 definitions, 120 projects,
  120 official blueprints, 120 behaviour profiles, 25 content packs, and
  13 settlement plans. Their presence is not equivalent to complete in-world
  art, simulation, balance, or player-facing workflows.
- Documents 21A-21F now have a development-only Voxel Asset Forge MVP:
  shared in-menu and EditorPlugin hosts, canonical source resources, 32 x 32
  surface and voxel authoring, compound parts/sockets, deterministic baking,
  animation/state/voxel-frame products, overrides/variants, validation,
  recovery, runtime registry consumers, and seven approved golden assets.
  Document 21G bulk visual migration remains deliberately paused.
- The official Godot 4.6.3 current gate passes 5,861 automated checks across
  the historical POC, Document 20 data, regional planner/runtime worlds,
  settlement isolation, lifecycle, legacy import, main menu, the Voxel Asset
  Forge and the progression-lab/Stage B contracts. The historical extended
  regional planner suite
  passes 130,007 checks across 10,000 seeds with 9,998 unique starter layouts
  (99.98%).
- The historical packaged POC benchmark remains evidence for `0.9.0-rc1`;
  active source development now proceeds as `0.10.0-dev`.

## Document-area assessment

| Docs | Area | Current status | Principal remaining work |
|---|---|---|---|
| 00-01 | Vision and core loop | Partial, POC-verified | Full sandbox breadth, long-term loop, systemic variety, endgame |
| 02, 06 | Progression and resources | Partial | Full tier tree, skills/perks, steel and later materials, balancing |
| 03-05 | Blocks, items, recipes | Partial, registry-verified | Full documented catalogue, art/variants, balance, production recipes |
| 07 | NPCs and villages | Partial | Population scale, households, deeper jobs/needs, migration and governance |
| 08 | Automation | Partial, POC-verified | Larger networks, advanced machines, maintenance, scale simulation |
| 09 | Magic | Partial, POC-verified | Schools, research depth, rituals, corruption, late-game networks |
| 10 | Creatures and monsters | Minimal | Broad ecology, behaviour families, spawning, drops, bosses and balance |
| 11 | Biomes and worldgen | Partial | World-scale regions, biome breadth, structures, ecology and production tuning |
| 12 | Structures | Partial | Broad authored/procedural set, ownership states, damage/restoration and LOD |
| 13 | Races, cultures, factions | Minimal | Culture packs, diplomacy, territory, law, reputation depth and conflict |
| 14 | Dimensions | Absent | Realm architecture, portals, generation, persistence, travel consequences |
| 15 | Quests and events | Minimal/partial | General quest graphs, systemic events, contribution, failure and recovery |
| 16 | Combat, gear and defence | Partial | Gear breadth, status systems, encounter variety, defences and balance |
| 17 | UI/UX | Partial, POC-verified | Full screen set, localisation, multiplayer UI, final accessibility polish |
| 18 | Technical plan | Partial | Scale architecture, networking decision, tools, profiling and release systems |
| 19 | Growth and player blueprints | Foundation/partial | Blueprint Workshop, validation UX, sharing/versioning, planner integration |
| 20A-H | Building registry | Data-rich/partial | In-world visual coverage, functional simulation, balance, upgrades and wonders |
| 21A-F | Voxel Asset Forge | MVP implemented/automated | Human visual review, packaged-development-build acceptance, advanced/final authoring breadth |
| 21G | Visual overhaul and migration | Readiness only/deferred | Bulk catalogue migration, art approval waves, manual visual acceptance and legacy retirement |

## Status model

Every ledger row must eventually end in one of these states:

- `verified`: implemented and backed by an automated or signed manual test.
- `implemented`: present but not yet adequately verified.
- `partial`: some acceptance conditions exist; remaining conditions are named.
- `absent`: accepted scope with no meaningful implementation.
- `deferred`: intentionally postponed with a recorded phase or decision.
- `not_applicable`: superseded, duplicate, or rejected with rationale.
- `unverified`: not yet traced; the Phase 0 default.

"100% implemented" means there are no `unverified`, `absent`, or `partial`
accepted requirements, every `implemented` row has verification, and every
deferral or non-applicable decision has an explicit rationale.

## Phase 0 technical exit record

- [x] Preserve the committed Document 20 baseline and the in-progress Stage A
  working tree.
- [x] Prove the current gate from a source-only isolated copy.
- [x] Make clean-copy Godot import bootstrapping part of the gate.
- [x] Generate the canonical document checksum manifest.
- [x] Generate the source-linked requirements ledger.
- [x] Move active metadata from historical `0.9.0-rc1` to `0.10.0-dev`.
- [x] Re-run the complete Phase 0 gate after these changes: 2,327 checks in
  the normal gate and 51,047 in the 10,000-seed extended gate.
- [ ] Obtain the remaining owner/manual packaged-build sign-off.

One normal-gate run recovered a Godot 4.6.3 Windows access violation that
occurred after a probe had already emitted its complete clean result. The gate
allows one retry only for that exact exit and only after validating the clean
machine result. The extended gate completed with zero retries.

The manual sign-off is intentionally not converted into an automated claim.
