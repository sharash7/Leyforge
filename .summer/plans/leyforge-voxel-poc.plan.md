---
name: leyforge-voxel-poc
overview: >-
  Godot-adapted Forest Hamlet POC: Stage 8 -- End-to-End UI and Learning is
  implemented on the deterministic Controlled POC Valley; the automated gate is
  complete and the representative-player manual exit test remains
createdAt: '2026-07-21T08:48:53.746Z'
todos:
  - id: voxel-chunk-system
    content: >-
      Build chunk-based voxel terrain system with ArrayMesh generation, flat
      terrain with grass/dirt/stone layers, and chunk management
    status: completed
  - id: first-person-controller
    content: >-
      Build first-person controller with WASD movement, mouse look, jump, and
      Escape to release cursor
    status: completed
  - id: block-interaction
    content: >-
      Add block breaking (left-click) and placement (right-click) via raycast
      with highlight outline on targeted block
    status: completed
  - id: inventory-hotbar
    content: >-
      Build simple inventory system with hotbar UI, item switching, and block
      placement from selected slot
    status: completed
  - id: basic-crafting
    content: >-
      Add basic crafting recipes (wood -> planks, planks -> crafting table) with
      simple crafting UI
    status: completed
  - id: stage1-playtest
    content: >-
      Verify Stage 1 runs: player can move, break/place blocks, switch items,
      and craft basics
    status: completed

  - id: stage1-foundation-hardening
    content: >-
      Separate block/item registries, use stable save identities, make mining
      and crafting transactional, rotate atomic saves, and budget mesh rebuilds
    status: completed
  - id: stage2-valley-plan
    content: >-
      Add versioned named sub-seeds, stable valley anchors, relation graph,
      route records, deterministic plan identity, and validated fallbacks
    status: completed
  - id: stage2-terrain-relations
    content: >-
      Adapt terrain for buildable sites, a guaranteed river, cave entrance,
      shallow coal/copper/iron, mana pocket, and connected road/trail grades
    status: completed
  - id: stage2-structure-anchors
    content: >-
      Stamp visible hamlet warehouse, watchtower project, base site, rune ruin,
      goblin camp, cave arch, and mana clues without adding later-stage NPC AI
    status: completed
  - id: stage2-multiseed-validation
    content: >-
      Validate determinism, placement relationships, buildability, cave/water,
      resources, and route connectivity across multiple seeds
    status: completed
  - id: stage2-visual-playtest
    content: >-
      Inspect the valley in Summer for route readability, landmark silhouettes,
      cave access, river banks, streaming seams, and traversal comfort
    status: completed
  - id: stage2-traversal-polish
    content: >-
      Repair embedded players into the closest safe local 2x2x2 air volume,
      correct registry colour-space handling, and confirm biome readability
    status: completed
  - id: stage3-tools-harvesting
    content: >-
      Add POC tool instances, tool-aware harvesting, drops, durability, and
      progression-safe inventory persistence
    status: completed
  - id: stage3-station-crafting
    content: >-
      Replace placeholder workbench/furnace blocks with data-driven station
      interactions, recipes, iron refining, and persistent processing state
    status: completed
  - id: stage3-shapes-materials
    content: >-
      Add required POC block shapes and the documented shared 32x32 material
      variation path without creating one material per block
    status: completed
  - id: stage4-persistent-hamlet
    content: >-
      Add persistent NPC records/actors, jobs and schedules, authoritative
      warehouse/request state, dialogue, reputation, permissions, and village
      project persistence without starting Stage 5 automation
    status: completed
  - id: stage5-resource-conserving-automation
    content: >-
      Add powered miner/logistics machines, item batches, ports and topology,
      warehouse transactions, project reservations, fault reporting, and
      near/far simulation without duplication or loss
    status: completed
  - id: stage6-mana-runes-wards
    content: >-
      Add the mana resource chain, rune table, mana furnace or upgrade,
      conduits and storage, one utility spell, one combat spell, ward coverage,
      magical feedback, persistence/LOD, and readable magical faults
    status: completed
  - id: stage7-combat-goblin-raid
    content: >-
      Add combat actions and damage, guards and goblin camp pressure, a
      deterministic raid planner, tower and ward defense contributions,
      persistent damage/repair, injury/death settings, and reproducible raid
      aftermath outcomes
    status: completed
  - id: stage8-end-to-end-ui-learning
    content: >-
      Consolidate the HUD, inventory, crafting, dialogue, village, machine,
      mana, map, raid, combat, aftermath, settings, input, controller, and
      accessibility learning paths into a first-time-player flow
    status: completed
---
## Scene Structure
- `res://main.tscn` -- World root
  - `WorldEnvironment` with basic sky and directional light
  - `VoxelWorld` (Node3D) -- generates, streams, edits, and journals chunks
  - `HamletRuntime` (Node3D) -- promotes/demotes nearby persistent NPC actors
  - `RaidRuntime` (Node3D) -- promotes persistent raid enemies and materialises aftermath damage
  - `Player` (CharacterBody3D) -- first-person controller
    - `Head/Camera3D` -- mouse-look camera
    - `Head/Camera3D/RayCast3D` -- block targeting
  - `HighlightBox` (MeshInstance3D) -- targeted-block outline
  - `HUD` (CanvasLayer) -- hotbar, status, crosshair, and crafting panel

## Scripts
- `res://scripts/world/chunk.gd` -- 16-cubed section storage, greedy mesh, and collision
- `res://scripts/world/chunk_mesher.gd` -- worker-safe greedy geometry builder for streamed sections
- `res://scripts/world/voxel_world.gd` -- generation, streaming queues, edits, and stable journal
- `res://scripts/world/valley_plan.gd` -- deterministic Phase 2 anchors, routes, sub-seeds, and relation validation
- `res://scripts/world/worldgen_validator.gd` -- reusable multi-seed Phase 2 acceptance checks
- `res://scripts/world/hamlet_runtime.gd` -- local NPC actor streaming and project visualisation
- `res://scripts/world/hamlet_npc_actor.gd` -- named nearby villager movement, labels, and RMB targeting
- `res://scripts/world/world_item_drop.gd` -- persistent physical mined stacks with terrain settling and proximity pickup
- `res://scripts/world/automation_system.gd` -- persistent machines, typed item topology, conserved batches, faults, and near/far simulation
- `res://scripts/world/magic_system.gd` -- persistent mana networks, batteries, conduits, ward coverage, magical consumers, faults, and ruin teaser state
- `res://scripts/world/raid_runtime.gd` -- local goblin promotion, preparation snapshot, and raid damage/repair bridge
- `res://scripts/world/goblin_actor.gd` -- humanoid raider/brute/captain movement, targeting, attack, and damage presentation
- `res://scripts/autoload/block_registry.gd` -- block-only stable definitions
- `res://scripts/autoload/item_registry.gd` -- item-only stable definitions
- `res://scripts/autoload/recipe_registry.gd` -- stable-ID hand, workbench, and furnace recipes
- `res://scripts/autoload/progression_state.gd` -- discovered content, known recipes, and production counters
- `res://scripts/autoload/inventory.gd` -- unified block/item stacks, item instances, hotbar, backpack, and transactions
- `res://scripts/autoload/hamlet_state.gd` -- authoritative NPC, schedule, need, warehouse, request, trust, permission, and project state
- `res://scripts/autoload/magic_state.gd` -- personal mana, regeneration, spell knowledge, cooldowns, casts, and save state
- `res://scripts/autoload/combat_state.gd` -- player health, raid planner, enemy records, outcome, injury, theft, structure damage, repair, history, and save state
- `res://scripts/autoload/ui_state.gd` -- persistent UI settings, tutorial/objective progress, discovered map anchors, input defaults, and rebinding
- `res://scripts/visual/humanoid_visual.gd` -- shared articulated player, villager, and goblin body/animation presentation
- `res://scripts/visual/item_model_factory.gd` -- shared low-poly held/drop model silhouettes selected by stable content identity
- `res://scripts/player/player.gd` -- movement, swimming, timed tool-aware harvesting, and placement
- `res://scripts/ui/hud.gd` -- contextual objective, inventory, crafting, village, map, raid, aftermath, settings, controls, help, and status presentation
- `res://scripts/ui/local_map_view.gd` -- discovered-landmark map, routes, objective marker, player orientation, and custom pin
- `res://scripts/ui/stack_icon_renderer.gd` -- cached static isometric thumbnails for registered blocks and items
- `res://scripts/main.gd` -- startup plus atomic versioned save/recovery

## Input Map
- move_forward/back/left/right: WASD
- jump: Space
- ui_cancel: Escape (releases mouse)
- break_block: Hold Left Mouse Button
- place_block: Right Mouse Button (place or contextually interact)
- toggle_craft: E (open/close hand crafting)
- toggle_creative: C (open/close the testing catalogue)
- cast_utility: Z (cast Stone Sense when known and funded)
- cast_combat: X (cast Spark Bolt when known, funded, and off cooldown)
- attack: F (attack a combat target with the selected item or empty hand)
- open_guide/inventory/map/village/raid/pause: controller-aware Stage 8 global routes with keyboard shortcuts
- look_left/right/up/down: right-stick camera look with a dead zone
- hotbar_1 through hotbar_9: Number keys
- Every Stage 8 rebindable action retains separate keyboard/mouse and controller bindings, and duplicate assignments are reported as explicit conflicts

## Chunk System
- 16x16x16 logical sections, with three vertical sections in the current world
- Compact numeric IDs at runtime; stable `original_id` strings in saves and recipes
- Greedy face meshing with separate opaque/water surfaces and correctly wound generated collision
- Three-column render radius, one bounded synchronous section load per eligible frame, and one background geometry build at a time
- Main-thread mesh/collision commits are isolated from section generation; generation pauses at a 12-section rebuild backlog

## Terrain Generation
- Deterministic seed-derived height, hills, temperature, moisture, rivers, and biomes
- Caves, ore fields, sea-floor patches, water, and streaming-safe trees
- Versioned Controlled POC Valley profile with independent named sub-seeds
- Guaranteed spawn, hamlet, water, cave, mana, ruin, camp, raid, base, warehouse, and watchtower anchors
- Ten connected roads/trails with terrain grading and tree clearance
- Visible Stage 2 placeholder sites; the base site now includes public bootstrap workbench/furnace stations
- The authored warehouse voxel and request-board marker now open authoritative Stage 4 interfaces

## Inventory
- Nine-slot hotbar plus 27-slot backpack
- Unified stacks retain separate block/item namespaces; tools are unstackable runtime instances with durability
- Block and item stacks serialize through their respective stable registry identities
- Resource items explicitly map to placeable block forms where supported
- Default hotbar: grass, dirt, stone, and oak logs
- Hotbar, backpack, crafting, storage, furnace, and catalogue slots show cached static isometric content thumbnails with count or durability overlays
- The C-key creative testing catalogue exposes every usable registered block and item, with search and an arbitrary 1-9999 grant amount while preserving normal stack and inventory-capacity rules
- The creative catalogue includes a red trash target that deletes an entire hotbar or backpack stack when it is dragged onto it

## Physical Item Drops
- Successful harvesting commits the world edit into a small 3D dropped block/item rather than inserting directly into inventory
- Drops settle against voxel collision, remain present when inventory is full, and automatically transfer any available amount inside the pickup radius
- Drop stacks retain stable block/item identities, tool instances, position, motion, and age through atomic version 12 saves

## Crafting
- E opens the 2x2 hand grid; RMB opens aimed workbench, rune table, furnace, mana furnace, chest, magical device, village, or NPC interactions
- Hand and workbench crafting use shaped/shapeless 2x2 and 3x3 ingredient grids rather than a recipe list
- The 3x3 workbench accepts every known 2x2 hand recipe in addition to its own recipes; native workbench recipes take precedence when both layouts match
- Data-driven stable-ID recipes cover bootstrap planks/sticks, crude and stone tools, wood/stone building pieces, stations, glass/clay, copper, iron, runes, and mana-network components
- POC manual iron rods, plates, nails, and torches close the watchtower supply chain before specialist hammer/forge stations
- Copper wire/plate/gears, wooden/copper frames, machine core, chute segments, wrench, miner head, crate, crank, mechanical miner, and warehouse-hatch recipes form the Stage 5 assembly chain
- Two reduced-yield hand recipes explicitly close the source design's stick/plank bootstrap loops
- Furnace state has three inputs, fuel, output, burn time, recipe progress, and persistent contents; the mana furnace uses the same conserved processing contract while drawing external network mana
- All craft/refine outputs commit transactionally only when destination capacity exists
- Hotbar, backpack, craft grid, furnace input/fuel/output, chest, and permitted warehouse endpoints support click transfers and conserved drag/drop

## Shapes and Materials
- Full cubes continue through the worker-safe greedy mesher
- Oak slabs and fixed north-facing oak stairs use partial rendered and collision geometry
- Opaque blocks share one procedurally seeded 32x32 Texture2DArray and one shader material
- UVs tile across greedy faces; UV2 carries the stable runtime material layer
- Floor snapping plus bounded step-up movement crosses slabs and the low side of stairs
- A second oak slab placed on the first creates a full-height block that returns two slabs when mined
- Timber detail is axis-balanced so rotated voxel faces no longer show a conspicuously inverted grain line
- Furnace, chest/crate, chute, door, workbench/rune-table, and post blocks use compound authored silhouettes instead of full placeholder cubes
- Glass uses the transparent surface with a reduced alpha while retaining generated collision
- Familiar stone, wood, metal, magic, and glass presentation colours replace misleading registry placeholder colours for the first priority model set

## Persistent Forest Hamlet
- Eight stable named NPC records cover elder, builder, farmer, guard, merchant, mage, miner, and lumberjack jobs
- Nearby villagers promote into labelled moving actors; distant villagers demote back into saved records
- Villagers share an articulated humanoid with separate head, torso, arms, and legs; opposite limbs swing while walking, job tools are visible, and work/combat activities drive basic poses
- Schedule waypoints now include changing local destinations; NPCs collide with terrain but not one another, preventing actor-on-actor vibration
- Needs-lite food/safety/morale state continues independently of actor streaming
- The 54-slot warehouse is authoritative and uses the same stable stack transactions as player storage
- The request board tracks exact masonry, timber, hardware, lighting, and pantry deliveries
- Elder dialogue unlocks Helpful Outsider request delivery; completed work unlocks Trusted Supplier/Ally permissions
- Direct warehouse deposits, withdrawals, and future automation import are independently trust-gated
- Foundation, timber frame, guard platform, and lighting/inspection supplies are requested and reserved independently, so each stage can begin without later-stage components
- Talia places every stage voxel individually while present at the work site; block-count progress cannot outrun visible construction
- Completed projects persist and display 100 percent rather than resetting to an ambiguous zero-percent complete state

## Resource-Conserving Automation
- The Basic Mechanical Miner consumes finite ore voxels within a seven-block radius; automatic mode chooses the closest coal, copper, iron, or mana-crystal ore while excluding stone/common blocks, and a Basic Wrench can lock it to one ore family
- An adjacent Manual Crank stores visible mechanical charge, and each miner cycle consumes six exact power-seconds
- Miner output first enters a 64-item internal buffer; full or unreachable output pauses with a readable fault instead of spilling or deleting
- Basic Item Chutes auto-connect on all six faces and form stable item-network IDs with explicit cross-chunk connector records
- Transport commits source quantity into persistent item batches; nearby batches have visible item cubes while distant/unloaded chains use the same authoritative batch records without visuals
- A Basic Wrench cycles automatic, processing-first, and storage-first chute priorities
- Stone Furnaces accept automated ore/fuel input and expose their output buffer; Wooden Crates provide 27-slot automation storage
- Village Warehouse Input Hatches support donation or active-project mode and reject imports until Trusted Supplier permission is earned
- Warehouse imports are idempotent by correlation ID and log contributor, ownership mode, stable content identity, category, exact count, source, time, and reservation destination
- Project-mode deliveries accept only current-stage missing goods and then use the same exact warehouse reservation transaction as manual deliveries
- Blocked batches survive permission changes, full storage, topology persistence, save/load, and bounded offline catch-up without duplicating or losing ownership
- RMB opens a machine inspection panel showing state, fault, input/output or charge, network, routing, permission, and recent warehouse deliveries

## Mana, Runes, and Wards
- Raw Mana Crystal refines through Mana Crystal Shards into Mana Dust; the Rune Table combines that chain with copper and stone components into Basic Runes, Mana Coils, Ward Cores, batteries, conduits, and Ward Lanterns
- Mana Batteries hold 256 external mana and accept crystal, shard, or dust fuel at conserved stable-ID yields
- Basic Mana Conduits form persistent network IDs with explicit cross-chunk connector records; consumers report unlinked, no-mana, invalid-input, and output-blocked faults
- The Mana Furnace processes the Stage 6 material set faster without combustible fuel and charges the exact recipe mana cost only when a cycle commits
- Ward Lanterns cover a 12-block radius, drain network mana while active, expose coverage feedback, and contribute a persistent defense bonus for later raid resolution
- Personal mana regenerates independently; Stone Sense is the utility spell and Spark Bolt is the non-terrain-damaging combat spell
- The rune ruin contains a persistent broken-portal teaser and grants one Rune Note without implementing travel
- Near/far simulation, bounded offline catch-up, save/load, and visual promotion use the same authoritative magic records

## Combat and Goblin Raid
- The player has persistent health and F-key held-item attacks; empty hands, tools, axes, pickaxes, and swords use readable damage types while Spark Bolt shares the enemy damage contract
- The first-person view always shows an arm and displays the selected stable-ID block, resource, tool, weapon, or component; the complete player body uses the same articulated humanoid as villagers
- A warning phase promotes persistent Goblin Raider, Brute, and Captain records into local humanoid actors with role health, damage, weapons, morale, targeting, and guard combat
- The deterministic raid planner scores watchtower stages, powered ward coverage, guard readiness, food, lighting, and player defeats against camp pressure
- Prepared Victory, Costly Victory, Partial Loss, and Village Defeat outcomes persist with injuries, conserved warehouse theft, reputation change, event history, and captain memory
- Non-perfect outcomes remove exact warehouse voxels; each repair restores the saved original block and transactionally consumes one Oak Beam
- NPC death and structure damage are explicit world settings; the POC defaults to recoverable injuries rather than silently deleting named villagers
- Elric's conversation exposes the manual raid trigger, aftermath status, one-at-a-time repair action, and test reset
- The living manual acceptance guide is `20_Leyforge_POC_Manual_Testing_Guide_v0_1.md` and must be updated with every future phase

## End-to-End UI and Learning
- The normal HUD is player-facing: debug seed, coordinates, and FPS are absent, while mana stays hidden until the player discovers it
- One contextual objective card teaches the representative loop through gather, craft, elder request, supply, automation delivery, mana, raid preparation, defense, repair, and completion using authoritative progression state
- Guide, inventory, crafting, village, local map, raid/aftermath, pause, settings, controls, and help screens share focus-first keyboard/controller navigation and one-step back behaviour
- Inventory search/details, crafting batch controls, recipe knowledge hints, village permission text, project stock/reserves, machine flow/faults, raid readiness, and aftermath cause/consequence/follow-up make system effects explicit
- The local map reveals visited landmarks and routes, shows player orientation and the current objective, and supports one persistent custom pin
- Settings persist HUD/tutorial/notification presets, UI scale, captions, high contrast, reduced motion, reduced flashes, toggle sprint, and aim assist; control rebinding persists separately for keyboard/mouse and controller
- Atomic save version 12 stores UI learning, discovery, custom pin, settings, and binding overrides alongside the established world state
- The Stage 8 manual exit gate is the representative-player script in the living testing guide; Stage 9 hardening must not begin until that observed run passes

## Later-Stage Design Alignment
- Document 19, `19_Fantasy_Voxel_Civilisation_Sandbox_Settlement_Growth_and_Player_Voxel_Blueprint_System_v0_1.md`, is now a design source for later settlement-growth and player-voxel-blueprint phases
- Its blueprint definitions/runtime records, stable identity, reservations, repair, and settlement progression requirements should extend the existing conserved resource, project, and persistence foundations
- Stage 8 does not pull those later settlement/blueprint systems forward; Stage 9 remains gated by the representative-player Stage 8 manual acceptance run

## Current Verification
- Headless Godot 4.6.3 probe: 143 blocks and 167 items load in separate registries
- Legacy Oak Log item ID 142 migrates to block ID 9
- Final-batch crafting, full-inventory mining/crafting, stable edit saves, and craft-grid saves pass
- Version 12 saves preserve unified inventory, tool durability, progression, personal magic, mana networks/consumers/connectors, player health, raid phases, authoritative enemies, preparation, outcomes, injuries, theft, damage/repair/history, functional blocks, physical item drops, automation machines/batches/connectors, delivery ledger, hamlet records, warehouse, requests, reputation, permissions, project state, UI learning/settings/bindings/map state, edits, and the world-generation manifest
- Rebuild probe processed 1 of 10 queued chunks under the declared budget
- Player collision holds at terrain Y=15; saved underground positions repair to a clear surface position
- Embedded or below-world players recover to the closest loaded flat 2x2 floor with a 2x2x2 air volume; spawn is fallback-only
- Planned spawn samples its 9x9 landing area and starts four blocks above the highest terrain column
- Render and collision triangles share outward-facing Godot winding; a rendered Summer capture confirms solid exterior voxel faces
- Registry sRGB colours are converted to linear material values; rendered sand is tan and visually distinct from snow and stone
- Streamed background meshes produced 28 non-spawn collision shapes and a successful terrain ray hit
- Cached valley calculations keep the measured section generation near 28-30 ms
- Background meshing and separated commits keep the measured worst streaming physics frame at 32 ms in the current probe
- Phase 2 validator passed 64 seeds with unique deterministic plan IDs, zero fallbacks, and zero placement failures
- Runtime checks found water, cave air, gravel route, warehouse crate, watchtower marker, camp marker, rune clue, and mana clue
- Phase 3 core probe passes bootstrap recipes, durable tool instances, iron harvest gates, iron refining, furnace save/restore, recipe knowledge, stable item saves, slab/stair collision, and 32x32 material-array checks
- Rendered Phase 3 captures pass at 58-60 FPS; the shared material variation is visible and desert sand remains tan/yellow and distinct
- Minecraft-grid interaction probe passes 15 checks for hand/workbench shapes, output delivery, drag conservation, chest state, and double slabs
- Exhaustive recipe probe passes 67 checks across all 45 crafting-grid recipes and all 11 furnace/mana-furnace recipes, including every hand recipe in the 3x3 workbench, shaped-before-shapeless precedence, block/material ingredient equivalence, and the complete automation and magic assembly chains
- Creative-menu probe passes 11 checks with all 310 usable registered entries, catalogue search, arbitrary multi-stack grants, separate durable tool instances, generated HUD thumbnails, stack deletion, and 3x3 stick crafting
- Request delivery accepts placeable Oak Plank stacks as the same conserved content as Oak Plank material items
- Traversal probe crosses a half-slab and a north-facing stair with the real player collision body
- Stage 4 authority probe passes 41 checks for the eight-NPC roster, stable local waypoints/collision and interaction targeting, sequential supply gates, per-block builder labour, 100-percent completion, save restore, RMB stations, and actor promotion/demotion
- Physical-item probe passes 9 checks for full-inventory mining, 3D world visuals, preserved leftovers, proximity pickup, and stable-ID restore
- Full save/UI probe passes 26 checks through the atomic `main.gd` version 12 path, including version-11 and legacy migration plus UI settings, discovery, custom pin, personal magic, raid phase, and authoritative enemy health
- Phase 5 automation probe passes 61 checks for stable content/recipes, nearest-valuable and selected-ore extraction, conserved furnace fuel drag/drop, crank power, wrench configuration, cross-chunk graph connectors, ore-to-ingot transport, trust-gated delivery, blockage, in-flight save/restore, far simulation, save-persistent idempotent retries, audit ledger facts, exact project reservations, and simultaneous furnace routing where fuel and one compatible ore enter while an incompatible ore continues to storage
- Phase 6 magic probe passes 48 checks for the mana resource chain, rune-table and mana-furnace recipes, network storage/topology, cross-chunk connectors, exact mana consumption, faults, ward coverage/drain/defense, both spells, ruin teaser, persistence, visual promotion, and bounded far/offline simulation
- Phase 7 combat/visual probe passes 33 checks for the articulated player/eight-villager roster, six job-held items, priority held/block silhouettes, translucent collidable glass, four enemy profiles, warning/assault promotion, authoritative player/enemy damage, three forced outcome matrices, visible structure damage, exact repair cost, and combat/aftermath restore
- Phase 8 UI/learning probe passes 104 checks for objective sequencing, authoritative automation/mana/raid gates, adaptive disclosure, keyboard/controller defaults, per-device rebinding persistence and conflict reporting, accessibility preview, screen focus/back behaviour, map discovery/pinning, village non-colour permission cues, aftermath cause/effect, help, and version-12 UI state restore
- Real-renderer Stage 8 captures cover the representative guide, discovered-landmark map, and settings/control presentation
- Summer rendered captures confirm the humanoid/held-item lineup, recognizable furnace/chest/chute/door silhouettes, see-through glass, and an unobstructed first-person arm/pickaxe view
- Manual Stage 1 movement, editing, crafting, swimming, and cursor behaviour passed
- Manual Phase 2 water, routes, landmarks, tundra, desert, streaming, and traversal checks passed
- Stage 8 implementation and automated acceptance are complete; its representative-player manual exit test remains before Stage 9 hardening begins
