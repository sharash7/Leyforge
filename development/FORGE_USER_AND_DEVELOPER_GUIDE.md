# Use and Verify the Leyforge Forge

This guide explains how to create, validate, bake, publish, test, recover and troubleshoot assets with the unified Leyforge Forge. It covers the original Voxel Asset Forge from Document Set 21 and the entity, blueprint and Presentation Forge additions from Sets 22 and 23.

The Forge changes presentation. It must not silently change recipes, inventory rules, machine simulation, damage, settlement logic, world identity or other gameplay authority.

## Who this guide is for

- New creators should follow **Start here** and the four task walkthroughs.
- Experienced creators can use the workflow and diagnostic reference sections.
- Engineers can use the acceptance fixtures, automated gates and source map.
- Reviewers should use the approval and evidence checklist.

## Start here

1. Run a development build and open **Developer Tools > Leyforge Forge** from the main menu.
2. In the Godot editor, enable the **Leyforge Forge** plugin and select its main-screen tab if you prefer the editor host.
3. Open **Forge Home** and read the indexed, approved, draft and legacy-fallback totals.
4. Open **Asset Browser** and search by display name, stable gameplay ID, category or status.
5. Open an existing Forge source, or select a live gameplay definition in **New Asset Wizard**.
6. Choose the authoring mode that matches the shape:
   - **Block Surface** for a full cube with six painted faces.
   - **Voxel Model** for a sculpted item or non-cubic block.
   - **Compound** for named machine parts, pivots, sockets and animation.
7. Save a draft, validate it, inspect Bake Preview, and test its real runtime contexts.
8. Use **Approve & Bake** only after validation and required human review. Saving a draft never publishes it.

## The eight studios

Leyforge Forge uses one shared shell with eight task-oriented studios. The normal path is **Home -> Library & Create -> a specialist studio -> Test & Delivery -> Approve & Bake**.

| Studio | Use it for |
| --- | --- |
| Home | Dashboard, guidance, recovery and continuing work. |
| Library & Create | Asset Browser, source creation and the migration register. |
| Items & Blocks | Surface, voxel, compound, Material DNA, collision, icon, animation, variants and world preview. |
| Structures & Buildings | Read-only blueprint catalogue and canonical settlement handoff; specialist composition editing is planned. |
| Characters & Creatures | Read-only entity, body-plan, rig, equipment and variant catalogues; specialist modelling is planned. |
| VFX | Effect, form and graph inspection; live graph editing is planned. |
| Audio | Sound Event, source, family, ambience and acoustic inspection; audio never autoplays from a hub. |
| Test & Delivery | Shared contracts, spatial roles, accessibility, capture, laboratory tests, validation and hot reload. |

`[AUTHOR]`, `[INSPECT]` and `[PLANNED]` labels state the real capability of every workflow. Switching studios preserves the open asset, dirty state, undo history and preview camera. The context ribbon keeps the stable ID, source state, validation and bake state visible.

> Warning: Never edit files under `generated/forge` by hand. They are replaceable bake products. Edit canonical source under `content/forge` and bake again.

## Core concepts

### Stable identity

A gameplay ID such as `functional.furnace.stone` identifies the real block or item. A Forge source such as `forge_asset.functional.furnace.stone` owns editable presentation data. A presentation ID such as `presentation.functional.furnace.stone` resolves the baked runtime package.

Recipes, saves and blueprints keep the stable gameplay or canonical blueprint identity. Generated scene and resource paths are outputs, never identity.

### Source, product and approval

- **Canonical source** is editable and can reconstruct the presentation.
- **Draft** is saved work that is not an approved runtime replacement.
- **Bake Preview** creates testable products without claiming human approval.
- **Approved source** has a matching approved manifest and runtime package.
- **Stale approved product** becomes draft when its canonical source hash changes.
- **Legacy fallback** remains active when no safe approved replacement exists.

Automated validation does not prove artistic quality, accessibility quality, audio rights or release readiness. Those review gates stay open until a person supplies the corresponding evidence.

### One shared Forge

Voxel assets, entities, blueprints and presentation systems share the same project manifest, schema registry, semantic registry, asset index, migration records, dependency graph, diagnostics and workspace. Do not add a parallel registry or a second source of truth.

## The development acceptance family

Search Asset Browser for **Forge Acceptance**. These four sources are intentionally development-only and are not added to the 143-block/169-item gameplay registry.

| Fixture | Stable test link | What must work |
| --- | --- | --- |
| Forge Acceptance Mosaic Block | `test.forge.block.acceptance_surface` | Six 32 x 32 faces, palette roles, Material DNA, surface bake, collision, footprint, icon and world package. |
| Forge Acceptance Relay Block | `test.forge.block.acceptance_relay` | Non-cubic voxel geometry, input/output sockets, powered state, emission, collision, variants and scene instantiation. |
| Forge Acceptance State Machine | `test.forge.block.acceptance_machine` | Compound parts, pivots, animation, voxel frames, smoke/audio sockets, processing/blocked/damaged bindings and accessibility fallback. |
| Forge Acceptance Tuning Tool | `test.forge.item.acceptance_tool` | Voxel item, grip socket, held/dropped/icon representations, package loading and stable tool presentation. |

The disabled-by-default `pack.test.forge.acceptance` groups these fixtures. The weathered Mosaic Block override tests field replacement, array append, provenance and revert behavior.

These assets are test evidence, not production content. Their visual, listening and owner approvals remain open.

## Create a standard surface block

1. Open **New Asset Wizard**.
2. Select a registered cube block and choose **Block Surface**.
3. Confirm the stable gameplay and presentation IDs before creation.
4. Open **Palette Roles & Material DNA**. Name roles by purpose, such as `stone_base`, `stone_shadow` and `mortar`.
5. Bind each role to an existing Material DNA definition, or create a namespaced `material.*` definition.
6. Open **Block Surface Editor** and paint Top, Bottom, North, South, East and West.
7. Use copied faces, mirroring, rotation, patterns and controlled randomisation to reduce repetition without creating unstable runtime randomness.
8. Enable 2 x 2 tiling preview and check seams.
9. Open **Collision & Placement Footprint** and confirm the anchor, occupied cells, rotations, placement faces and support rules.
10. Save Draft, Validate, Bake Preview and inspect icon, single-block, repeated-block and Blueprint contexts.

The Mosaic Block is the reference acceptance fixture for this workflow.

## Create a unique voxel block

1. Choose **Voxel Model** in New Asset Wizard.
2. Work in X, Y and Z slices. Use small pencil strokes until the silhouette is established.
3. Use symmetry for deliberate mirrored geometry and copy layers only between compatible dimensions.
4. Orbit Live Preview frequently to find missing depth, internal voxels and unintended solid areas.
5. Add typed sockets for connections, effects, audio or interaction.
6. Author collision boxes that preserve holes and clearance rather than using a full cube.
7. Add explicit deterministic variants when material or culture changes are needed.
8. Bind authoritative state fields to visual actions. State bindings are read-only presentation rules.
9. Validate direction, input/output connections, footprint rotations and fallback behavior.
10. Bake and test one instance, connected neighbours, repeated instances and a reconstruction cycle.

The Relay Block exercises this workflow. The approved wooden chute and mana conduit remain production examples.

## Create an animated compound machine

1. Choose **Compound** and create stable named parts such as `body`, `gear` and `flame`.
2. Place the body near the asset origin.
3. Place each pivot at the physical hinge or axle before animation.
4. Mark only moving parts as animated so static parts can be combined during baking.
5. Add required typed sockets, for example item input/output, smoke, work audio and interaction.
6. Create transform, material or visibility clips. Use voxel-frame clips only for small bounded shape changes.
7. Bind authoritative fields such as processing, blocked and damaged to presentation actions.
8. Test combined state layers and their priority. Critical states must remain readable over ordinary activity.
9. Test reduced-motion and reduced-flash behavior.
10. Validate against the presentation contract. Removing a required part or socket must block approval.
11. Bake and test idle, ignition, active, blocked, damaged, fault, cooling and stop transitions as applicable.
12. Confirm animation, effects and audio stop when their stable owner stops or disappears.

The Acceptance State Machine is the full contract fixture. The stone furnace and crusher are gameplay-connected golden examples.

## Create an item or tool

1. Choose **Voxel Model** and an item gameplay definition.
2. Model the object at its canonical neutral scale.
3. Add a `grip` socket or the required equipment contract role.
4. Configure representation transforms for held, dropped, icon and preview forms.
5. Inspect the held form in first person and on the canonical humanoid grip.
6. Inspect the dropped form above the ground from several angles.
7. Inspect the icon at actual HUD size; prefer a readable silhouette over tiny detail.
8. Validate, bake, load through the item model factory and render through the stack icon renderer.

The Acceptance Tuning Tool covers these representations without adding a shippable item definition.

## Override or vary an existing presentation

1. Keep the existing gameplay and presentation IDs.
2. Use an override for a deliberate project, pack, biome, culture or accessibility change.
3. Store only changed fields using inherit, replace, clear or stable-key merge operations.
4. Use variants for deterministic choices inside an approved family.
5. Set explicit source layer, priority, dependencies and contract requirement.
6. Compare base, resolved and draft values and inspect field provenance.
7. Validate conflicts and contract-sensitive collision, footprint or socket changes.
8. Revert one field and confirm unrelated fields remain; then test whole-override revert.
9. Disable or break the override and confirm a valid base or legacy fallback still resolves.

## Validate, bake and publish safely

1. Run **Validation Centre** after geometry, palette, part, socket, collision, footprint, animation, state, dependency or contract changes.
2. Fix Critical, Blocker, Critical Release Blocker and Error diagnostics before baking.
3. Review warnings for intentional exceptions.
4. Use Bake Preview first.
5. Confirm the source hash, product hash, package, manifest and every product path.
6. Run the relevant context tests.
7. Approve and bake only with the necessary human authority and evidence.
8. Save the approved source so its canonical hash matches the approved manifest.
9. Rebuild the index and confirm the runtime resolves the same stable ID.
10. Keep the last valid package and legacy fallback until the replacement gate passes.

Tests can call `ForgeBakeService.set_output_root("user://...")` to run a real isolated bake without modifying approved products.

## Blueprint and construction integration

1. Reference canonical blueprint, module, material-role and stable presentation IDs.
2. Define footprint, anchor, rotation, marker, socket and network roles.
3. Compile modules into a deterministic runtime product.
4. Validate placement against slope, clearance, biome, progression and fallback rules.
5. Instantiate construction stages and state transitions.
6. Save the instance snapshot and reconstruct it without scene-path identity.
7. Re-bake an asset and confirm the existing blueprint resolves the new approved presentation without changing its gameplay references.

## Entity, rig and equipment integration

1. Create an entity definition, body plan and body parts with stable semantic roles.
2. Map joints and parts through a rig profile and semantic skeleton adapter.
3. Add an assembly profile and spatial map.
4. Bind an animation library, retarget map, contacts and foot-placement profile.
5. Fit equipment through semantic hand and attachment roles.
6. Create an actor by stable ID, play semantic actions and inspect contact markers.
7. Save the deterministic appearance/pose snapshot and reconstruct the actor.
8. Keep gameplay proxies authoritative and presentation-only geometry non-authoritative.

## Spatial roles

Use canonical namespaces such as `anchor.*`, `socket.*`, `region.*`, `path.*`, `mask.*`, `zone.*`, `portal.audio.*` and `runtime_anchor.*`. Set 23 alternate spellings are import aliases only when an explicit unambiguous mapping exists.

Spatial resolution must handle owner-local identity, variants, LOD remapping, mirroring, declared fallback quality and runtime contacts. Missing owners, ambiguous aliases, invalid paths and undeclared fallbacks must produce diagnostics.

## Events, contexts and presentation profiles

1. Define an event contract for one-shot facts or a state contract for continuous truth.
2. Declare permitted payload fields and authority rules.
3. Build a context packet from stable owner, material, environment, intensity and spatial values.
4. Resolve bindings and presentation profiles through the shared registry.
5. Issue keyed `play`, `update` and `stop` commands.
6. Record the contract, payload, timestamp, deterministic seed, sequence and stable IDs.
7. Replay the trace and compare hashes.
8. For multiplayer, encode only contract data, quantise spatial values, reconcile predictions and reconstruct continuous late-join state.

Presentation code must never mutate gameplay authority.

## VFX, sound, materials and acoustics

### VFX

- Keep graph nodes, spawns, lifetimes, lights and updates bounded.
- Compile editable graphs into immutable runtime products.
- Use pooling, LOD, aggregation and virtualisation.
- Reject cycles and unbounded limits.
- Stop or expire every owner-keyed effect.

### Sound

- Use sound events, layers, seeded variation and managed loops.
- Set voice and concurrency limits.
- Route through declared buses and spatial profiles.
- Provide captions and accessible equivalents for critical cues.
- Keep unverified sources on explicit legacy fallback and never claim rights without evidence.

### Materials and surfaces

- Resolve by action, intensity, material family, wetness, environment and state.
- Use safe fallback profiles for unknown combinations.
- Bound persistent wetness, soot, scorch and corruption records with expiry or merge policies.

### Acoustics

- Author zones and portals by stable ID.
- Test indoor/outdoor routing and open/closed portal transmission.
- Aggregate rain and ambience rather than creating unbounded per-block emitters.

## Accessibility preview

Run reduced-motion, reduced-flash, caption and critical-cue-equivalence modes across every declared quality tier. A deterministic automated pass proves contract behavior, not the human quality of the rendered or audible result.

Important state must never rely on colour, flashing, motion or sound alone.

## Capture, replay and Test Laboratory

Capture contracts and inputs rather than rendered instances. Each capture should record its scenario, registry generation, owner, stable IDs, timestamp, seed and trace hash.

Run:

- normal and fallback cases;
- every accessibility/quality matrix cell;
- malformed payload and missing-dependency cases;
- save/reconstruction;
- hot reload and rollback;
- multiplayer authority and late join;
- split listeners;
- dense-scene bounded degradation.

Every deterministic test must produce the same hash on repeat runs.

## Hot reload, repair and rollback

1. Stage a complete candidate registry generation.
2. Review added, modified, removed and contract-changed records.
3. Reject duplicate IDs, ambiguous aliases, cycles, missing dependencies and unclassified contract changes.
4. Publish atomically only after the complete candidate validates.
5. Refresh consumers by stable ID.
6. Roll back to the previous known-good generation if a post-publication test fails.
7. Treat repair plans as non-destructive suggestions requiring deliberate application.

## Recovery and source safety

- Use Ctrl+Z/Ctrl+Y for the current session.
- Autosaves are recovery candidates, not approved source.
- Compare a recovered draft before saving it over canonical source.
- Atomic saves read back a temporary resource before promotion.
- Previous-source backups recover completed saves.
- Failed bakes must leave the last approved package available.

## Document Set 21 implementation status

| Document | Implemented Forge scope | Explicitly still open |
| --- | --- | --- |
| 21A Core System | Developer/editor hosts, asset browser/wizard, surface/voxel/compound sources, stable IDs, contracts, validation, bake, runtime packages, override/fallback and Blueprint handoff. | Public creator, marketplace and collaborative editing remain deferred. |
| 21B Modelling/Materials | 32 x 32 surfaces, voxel slices, paint tools, symmetry, copy/paste, patterns, palette roles, Material DNA, compound parts, sockets, collision, footprints, icons and deterministic mesh/surface baking. | General sculpting, advanced UV/shader graphs and automatic artistic judgement remain deferred. |
| 21C Animation/States | Named-part clips, voxel-frame clips, pre-baked frames, material/visibility actions, state adapter, effect/audio sockets, reduced motion, bounded VFX/audio and reconstruction. | Cinematics, facial/lip-sync and unrestricted shader scripting remain deferred. Skeletal/entity work is implemented through Set 22's separate semantic pipeline. |
| 21D Overrides/Registry | Field operations, deterministic variants, provenance, conflicts, packs, aliases, dependencies, fallback, migrations, hot reload and rollback. | Marketplace distribution, arbitrary scripts, signing and entitlement systems remain deferred. |
| 21E UI/UX | Shared workspace, main-menu and editor entry points, progressive pages, preview, status, validation, save/bake, recovery and 25 in-app guided sections. | Touch-first UI, real-time co-editing and production waveform/particle editors remain deferred. |
| 21F Technical Plan | GDScript Resources/services, manifest/index/schema architecture, deterministic bake products, consumers, tests, migrations, runtime registry and isolated test output. | Export/package certification and final packaged-build profiling remain outside the current milestone. |
| 21G Migration Plan | Migration inventories, fallback registers, golden assets, Set 20/22/23 production libraries and evidence artifacts exist. | The full visual-overhaul acceptance is not complete: Forest Hamlet art, listening, accessibility, rights, performance-tier and owner sign-off remain open. |

Set 21's relevant technical/MVP Forge foundation is implemented and testable. Document 21G's full artistic production overhaul is intentionally not claimed complete.

## What changed after the original Set 21 MVP

- Set 20 added canonical settlement IDs, schema migration and save-v17 restore canonicalisation.
- Set 22 added entity/body/rig/animation/equipment and Blueprint Forge foundations plus runtime assembly.
- Set 23 added spatial roles, events, contexts, VFX, sound, material response, acoustics, accessibility, capture/replay, budgets, runtime publication and Test Laboratory systems.
- The common manifest/index/schema/semantic services now cover all these domains.
- Approved source staleness is detected by canonical source hash versus baked manifest hash.
- Bake output can be redirected to an isolated `user://` root for deterministic end-to-end tests.
- The four development acceptance fixtures now require the complete original source-to-runtime pipeline to work.

## Automated verification

Use the fixed project runner required by `AGENTS.md`:

```powershell
$godot = 'D:\AI\Projects\leyforge\.local\Godot_v4.8-dev-a9c94-shutdown-fixed\godot.windows.editor.x86_64.console.exe'
& $godot --headless --rendering-method gl_compatibility --path 'D:\AI\Projects\leyforge' --scene 'res://.summer/verification/forge_end_to_end_probe.tscn'
powershell -NoProfile -ExecutionPolicy Bypass -File 'D:\AI\Projects\leyforge\.summer\verification\run_current_regression_gate.ps1' -ProjectPath 'D:\AI\Projects\leyforge'
git -C 'D:\AI\Projects\leyforge' diff --check
```

The end-to-end probe must be run twice with independent profile roots and identical deterministic hashes.

## Diagnostic quick reference

| Family | Meaning | First action |
| --- | --- | --- |
| `FORGE-ID`, `EFB-ID`, `REG` | Invalid or duplicate stable identity/alias | Inspect canonical ID and alias direction. |
| `FORGE-SCHEMA`, `EFB-SCHEMA` | Unsupported or malformed source schema | Run the registered migration and validate again. |
| `FORGE-GEO`, `FORGE-MAT` | Empty/unsafe geometry or material source | Fix the named authoring source and preview it. |
| `FORGE-PART`, `FORGE-CONTRACT` | Missing part, pivot, socket or contract mapping | Restore or explicitly remap the required contract role. |
| `FORGE-FOOT`, `FORGE-COLL` | Unsafe footprint or collision | Repair occupied cells, anchor, clearance or boxes. |
| `EVT`, `SPT` | Invalid presentation event/context/spatial record | Fix payload fields, ownership or semantic mapping. |
| `VFX`, `SND` | Unsafe graph, source, loop or runtime limit | Bound the source and provide lifecycle/fallback. |
| `ACU`, `ACC`, `BUD` | Acoustic, accessibility or budget failure | Repair zones/equivalence/limits before publication. |
| `MIG`, `PAK` | Unclassified compatibility or pack change | Add migration/replacement/fallback evidence. |

## Approval checklist

Before calling a production asset complete, confirm:

1. Stable identity and aliases are correct.
2. Source and product hashes match.
3. Validation has no blocking severity.
4. Required parts, sockets, states, representations and footprints exist.
5. Runtime and Blueprint consumers resolve by stable ID.
6. Save/load and reconstruction pass.
7. Effects, voices, lights, loops, surfaces and updates are bounded.
8. Fallback remains available until replacement acceptance.
9. Visual, listening, accessibility, rights, performance and owner evidence are recorded where applicable.
10. Focused probes, full regression and `git diff --check` pass.

## Related source locations

- Shared workspace: `scripts/forge/ui/forge_workspace.gd`
- In-Forge guidance: `scripts/forge/ui/forge_section_guides.gd`
- Asset index: `scripts/forge/application/forge_asset_index.gd`
- Document persistence: `scripts/forge/application/forge_document_service.gd`
- Validation facade: `scripts/forge/application/forge_validation_service.gd`
- Bake service: `scripts/forge/bake/forge_bake_service.gd`
- Runtime resolver: `scripts/forge/runtime/forge_runtime.gd`
- Acceptance generator: `scripts/forge/tools/generate_forge_acceptance_suite.gd`
- Acceptance probe: `.summer/verification/forge_end_to_end_probe.gd`
- Aggregate gate: `.summer/verification/run_current_regression_gate.ps1`
