# Fantasy Voxel Civilisation Sandbox
## 21G - Voxel Asset Forge - Visual Overhaul and Asset Migration Plan
**Version 0.1 - Detailed Design Bible and Production Planning Draft**

A structured production plan for replacing Leyforge's prototype visuals with a coherent stylised fantasy-voxel asset library, using the Voxel Asset Forge to rebuild terrain, construction families, unique-shaped blocks, items, props, machines, magical infrastructure, animation, effects and structure kits without breaking gameplay definitions or existing world data.

## Visual Overhaul and Asset Migration Plan Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the visual audit, style lock, asset inventory, migration order, production batches, review gates, fallback rules and completion criteria for replacing prototype and placeholder visuals across the current game. |
| Core Goal | Make the world, buildings, machines, items and magical infrastructure visually coherent and production-ready enough that the Forest Hamlet buildings can be completed without repeatedly rebuilding their art foundations. |
| Visual Target | Stylised, readable, atmospheric fantasy voxel art with strong silhouettes, 32 x 32 standard block surfaces, richer unique-shaped assets, deliberate material identity, restrained detail and clear runtime states. |
| Forge Direction | The Voxel Asset Forge is the primary authoring and migration tool. Standard blocks use Block Surface Mode; unique blocks and items use Voxel Model Mode; machines and complex stations use Compound Asset Mode. |
| Migration Philosophy | Replace presentation non-destructively. Preserve stable block, item, recipe, structure and machine IDs wherever gameplay identity is unchanged. Rebuild visuals through project override layers before retiring legacy assets. |
| Production Priority | Finish the reusable material and building-kit foundations first, then complete the Forest Hamlet structure set, functional stations, automation, magic assets and remaining item presentations. |
| Building Direction | Buildings are completed from approved kits rather than one-off blocks. A kit is not ready until its walls, floors, beams, roof pieces, openings, trims, props and required state variants pass the same visual and technical review. |
| Variant Direction | Create a strong base asset first, then add only justified material, culture, biome, condition, magic and quality variants. Avoid uncontrolled variant multiplication. |
| Animation Direction | Add motion only where it communicates function or atmosphere. Use named-part transforms for rigid motion, material animation for glow and flow, voxel frames for true shape changes and sockets for effects, lights and sound. |
| Compatibility Direction | Cosmetic replacements must not silently change gameplay footprint, collision, automation ports, interaction anchors, save identity or structure blueprint contracts. Contract changes require explicit review and migration. |
| Quality Direction | Every approved asset must pass silhouette, palette, tiling, scale, state readability, animation, collision, placement, performance and in-world context checks. Beautiful editor previews alone are not approval. |
| Legacy Direction | Placeholder assets remain available as fallbacks until their replacement is approved in representative worlds and existing structures. No mass deletion occurs at the start of the overhaul. |
| Data Direction | Track every asset through a registry-linked migration record with owner, source ID, presentation ID, status, priority, dependencies, Forge mode, required states, review history and fallback. |
| POC Direction | The first complete visual slice is the Forest Hamlet valley: terrain, one coherent wood family, one coherent stone family, village buildings, watchtower, warehouse, furnace chain, wooden chute, basic iron items, mana infrastructure, rune ruin and goblin camp dressing. |
| Creature Boundary | NPC, creature and monster body creation is deferred to a later Forge series. This plan includes only environmental, equipment, prop and structure visuals needed to present them in the POC. |
| Success Direction | The overhaul succeeds when approved assets can be placed repeatedly across buildings and systems without visual mismatch, registry breakage, excessive one-off work or the need to postpone structures because a basic asset family is incomplete. |

## Document Purpose

This document is the production bridge between the Voxel Asset Forge system and the actual game world. Documents 21A through 21F define what the Forge is, how assets are modelled, how animations and visual states work, how overrides resolve, how the creator interface behaves and how the system is implemented in Godot. Document 21G defines how the team uses that foundation to replace Leyforge's current prototype visuals in a controlled order.

The overhaul is not a single texture pass. Leyforge contains terrain blocks, construction shapes, unique logistics blocks, crafting stations, machines, magical infrastructure, inventory items, held tools, props, structure kits, biome variants, damaged states and animated runtime presentations. If these are replaced randomly, the game will accumulate incompatible palettes, scale drift, missing shape families and buildings that cannot be completed consistently. The migration must therefore be organised around reusable visual systems and construction kits rather than individual attractive assets.

The immediate production need is to finish buildings. That requires more than walls. A visually complete building family needs terrain contact materials, foundation pieces, walls, floors, beams, posts, slabs, stairs, roofs, doors, windows, trims, lights, furniture and the functional objects that explain the building's purpose. The plan prioritises those dependencies so a hamlet house, warehouse, watchtower, blacksmith, farm building and mage workspace can all be finished from approved components.

This document also protects gameplay and saves during the visual transition. The Forge may replace a furnace's model, palette, animation and effects while the furnace keeps the same gameplay definition, recipes, inventory, fuel logic and machine state. Any proposed change that affects collision, footprint, sockets or automation ports is classified separately and cannot be treated as a cosmetic swap. That distinction allows the visual team to move quickly without turning an art pass into an uncontrolled technical rewrite.

## Current Engine and Source-of-Truth Note

> **Current Project Direction**  
> Leyforge is being built in Godot with Summer Engine. The current Godot/Summer revision of the project technical plan and Documents 21A through 21F are the active Forge sources of truth. Any older Unreal-specific implementation wording is historical only. The visual overhaul must produce normal Godot-compatible source and runtime assets, preserve stable registry identity and remain usable without a hidden Summer Engine runtime dependency.

## Design Sources

| Source | Relevant Direction | How 21G Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Stylised, readable, atmospheric fantasy voxel presentation; richer than a basic block sandbox without chasing realism. | Locks the visual target, material readability and world-first presentation standard. |
| 03 - Blocks Registry | One-metre default blocks, broad construction shapes, states, material families, functional blocks, automation and magic blocks. | Creates the migration categories, kit-completeness rules and stable block mapping. |
| 04 - Items Registry | Items, block item forms, tools, resources, gear, components and multiple representations remain linked but distinct. | Defines item, held, dropped and icon migration requirements. |
| 06 - Resource Progression | Wood, stone, copper, iron, steel, mana and later resources retain distinct identities. | Requires recognisable visual Material DNA and tier-readable resources. |
| 07 - NPC Village System | Buildings, warehouses, projects, repairs and visible settlement growth are central. | Prioritises village kits, structure states, work props and repair-ready visuals. |
| 08 - Automation System | Machines, chutes, power, item flow and village supply must be physically readable. | Prioritises unique-shaped logistics, active states and animation. |
| 09 - Magic System | Mana, runes, wards, conduits and magical stations are practical infrastructure. | Requires coherent magical material language and state-driven presentation. |
| 11 - Biomes and World Generation | Biomes use readable palettes, variation, world-state evidence and construction practicality. | Defines biome review scenes, terrain-family migration and restrained environmental variants. |
| 12 - Structures | Structures are dynamic, repairable, culture-aware blueprints made from tagged blocks and props. | Makes structure-kit readiness and blueprint regression testing core approval gates. |
| 17 - UI/UX System | Presentation must remain inspectable, readable and accessible. | Extends review to icons, state cues, contrast and non-colour-only information. |
| 18 - Current Godot Technical Plan | Stable registries, deterministic data, save compatibility, performance budgets and bounded tooling. | Controls migration safety, runtime integration and release gating. |
| 21A-21F - Voxel Asset Forge Series | Defines Forge identity, authoring, animation, overrides, UI and implementation. | Supplies the workflow and technical rules used by every migration batch. |

## Static Table of Contents

- 1. Locked Visual Overhaul Identity
- 2. Player Decision and Direction Summary
- 3. Overhaul Goals, Principles and Non-Goals
- 4. Visual Source of Truth and Art-Direction Lock
- 5. Current-State Audit and Evidence Capture
- 6. Asset Inventory, Registry Mapping and Migration Records
- 7. Asset Status Lifecycle and Approval States
- 8. Priority, Dependency and Batch Planning
- 9. Visual Quality Tiers and Completion Definitions
- 10. Naming, Ownership, Provenance and File Organisation
- 11. End-to-End Forge Migration Workflow
- 12. Reference Boards, Style Kits and Golden Assets
- 13. Palette, Material DNA and Shared Surface Library
- 14. Scale, Resolution, Density and Silhouette Rules
- 15. Standard Terrain and Surface Block Migration
- 16. Natural Materials, Plants, Fluids and Biome Presentation
- 17. Construction Material Families and Kit Completeness
- 18. Generated Shapes, Modular Pieces and Custom Overrides
- 19. Unique-Shaped Blocks, Logistics and Directional Assets
- 20. Functional Stations, Storage and Village Work Blocks
- 21. Automation Machines, Power and Production Chains
- 22. Magic Infrastructure, Runes, Mana and Ward Assets
- 23. Items, Tools, Weapons, Components and Resource Forms
- 24. Props, Furniture, Lighting and Environmental Dressing
- 25. Structure Kits, Blueprint Migration and Building Completion
- 26. Culture, Faction, Biome and Settlement Variants
- 27. Runtime States, Damage, Weather, Heat and Corruption
- 28. Animation, Effects, Light and Audio Migration
- 29. Icons, Thumbnails, Codex Images and UI Presentation
- 30. Collision, Footprints, Pivots, Sockets and Contract Review
- 31. Performance, Atlases, LOD and Repetition Budgets
- 32. Legacy Assets, Fallback, Deprecation and Removal
- 33. Forest Hamlet Visual Slice and Priority Asset Register
- 34. Building Completion Production Plan
- 35. Review, Feedback, Revision and Sign-Off
- 36. In-World Visual QA and Regression Testing
- 37. Version Control, Change Logs and Migration Reporting
- 38. Risks, Redesign Triggers and Contingencies
- 39. Staged Overhaul Roadmap
- 40. Definition of Done and Acceptance Matrix
- 41. Continuous Content Production After the Overhaul
- 42. Open Decisions for Later Planning
- Appendix A. Asset Migration Record Template
- Appendix B. Initial Priority Asset Backlog
- Appendix C. Construction Kit Readiness Checklist
- Appendix D. Visual Review Scorecard
- Appendix E. Batch Release Checklist
- Appendix F. Legacy Removal Checklist
- Appendix G. Explicit Deferrals
- Glossary

# 1. Locked Visual Overhaul Identity

The visual overhaul is a controlled replacement of Leyforge's prototype presentation layer. It is not a separate art experiment and it is not a one-time texture folder swap. Its purpose is to establish a reusable visual language and production pipeline that supports the game's actual building, automation, magic, village and world systems.

## 1.1 Core Production Promise

> **Production Promise**  
> Once a material family or structure kit is approved, the team can use it repeatedly across buildings and systems with confidence that its scale, palette, shapes, states, collision, animation, registry links and performance behaviour are already solved.

## 1.2 Overhaul Pillars

| Pillar | Production Meaning | Required Result |
| --- | --- | --- |
| Coherent | Materials and forms follow shared art-direction rules. | Assets look like one game rather than unrelated prototypes. |
| Reusable | Asset families are designed as kits and libraries. | New buildings do not require a fresh wall, beam or roof solution every time. |
| Readable | Silhouette, colour value, state and function remain clear during play. | The player can distinguish terrain, resources, machines, magic and hazards quickly. |
| Data-Safe | Visual replacement preserves stable identity and validates contracts. | Existing worlds, recipes and blueprints continue to resolve. |
| Forge-Authored | Editable source remains available and overrides are reversible. | The developer can manually refine any model, texture or clip later. |
| Performance-Aware | Repeated assets use efficient baked products and shared materials. | Villages and factories remain affordable at gameplay scale. |
| Reviewable | Approval uses documented evidence and representative scenes. | A polished isolated preview cannot hide tiling, scale or state problems. |
| Finish-Oriented | Work is prioritised by what unlocks complete buildings and the POC loop. | The overhaul creates visible production progress rather than an endless art sandbox. |

## 1.3 What the Overhaul Is Not

- It is not a move toward photorealism.
- It is not permission to replace stable IDs casually.
- It is not a requirement to finish every final-game asset before the Forest Hamlet slice.
- It is not a reason to produce every possible variant immediately.
- It is not a full NPC, creature or monster modelling project.
- It is not a collection of one-off building assets that cannot be recombined.
- It is not complete when assets only look good in the Forge viewport.
- It is not a mass deletion of legacy files before fallbacks and regression tests exist.

# 2. Player Decision and Direction Summary

| Area | Locked Decision |
| --- | --- |
| Main Need | Finish the visual foundations so the team can complete buildings confidently. |
| Creator Role | The developer Forge is allowed to override existing block and item models, textures, materials and animations manually. |
| Unique Blocks | Voxel Model Mode includes chutes, pipes, directional components, workstations and some machine bodies. |
| Complex Machines | Compound Asset Mode is used for named moving parts, pivots, sockets and state-driven effects. |
| Animation | Use the most efficient readable method: transform clips, material animation, voxel frames or effect sockets. |
| Surface Resolution | Standard blocks use 32 x 32 face surfaces unless an explicitly approved profile differs. |
| Runtime Geometry | Editor microvoxels are baked into efficient meshes; they are not individual runtime nodes. |
| Visual Replacement | Keep gameplay definitions and stable IDs unless the asset is intentionally redesigned as a new gameplay object. |
| Migration Order | Material language and building kits first; structure completion before broad decorative expansion. |
| First Slice | Forest Hamlet valley, buildings, watchtower loop, furnace/chute chain, basic iron items, mana infrastructure and goblin camp. |
| Review | In-world context, tiling, multiple copies, day/night, weather, state and performance checks are mandatory. |
| Fallback | Legacy presentation remains available until replacement approval and regression completion. |

# 3. Overhaul Goals, Principles and Non-Goals

## 3.1 Primary Goals

- Lock a recognisable Leyforge visual language.
- Replace inconsistent prototype materials with approved Material DNA families.
- Complete the minimum construction kits needed for finished village buildings.
- Create the first production-quality unique-shaped automation and magic assets.
- Establish repeatable migration records and quality gates.
- Preserve gameplay identity, structures and saves while visuals change.
- Make future content faster to produce through templates, stamps, palettes and reusable parts.
- Produce a representative POC scene that demonstrates final-direction quality without requiring final-game breadth.

## 3.2 Production Principles

### Foundations Before Volume

One complete wood kit is more valuable than six unrelated plank textures. One complete furnace presentation is more valuable than five unfinished machine concepts. Production must solve dependencies in an order that unlocks usable combinations.

### Silhouette Before Surface Detail

Unique shapes, items and props must read at gameplay distance before detailed pixel work is added. A chute must read as a directional transport object. A pickaxe must read as a pickaxe in hand and inventory. A mana conduit must read as magical infrastructure even when its emission is reduced.

### Context Before Approval

Every candidate asset must be reviewed in the environment where it will be used: tiled terrain, walls in a house, roof pieces across a full roof, chutes in a supply line, machines beside storage, mana objects at night and icons in the real inventory scale.

### Stable Identity Before Convenience

Renaming a file is easy; changing a stable gameplay ID is expensive. Migration records must distinguish human-readable labels, presentation IDs, registry IDs and file paths.

### Reuse Before Duplication

A new asset should reuse an approved palette, Material DNA, hinge, gear, trim, window frame, crate family or effect profile when that reuse strengthens consistency. Reuse is not mandatory when it harms culture identity or silhouette.

### Bounded Variants

Variants are added to solve visible repetition, biome fit, culture identity or state communication. They are not created merely because the Forge can create them.

## 3.3 Explicit Non-Goals for Version 0.1

- Final art for every dimension and culture.
- Complete character, NPC and creature replacement.
- Cinematic animation or skeletal authoring.
- Full marketplace-ready mod packs.
- Final platform-specific optimisation beyond the Windows-first target.
- Rebuilding gameplay logic during the art pass.
- Replacing every UI screen; only asset-facing icons and presentation required by the slice are included.
- Perfect final balancing of every emissive, particle and sound value before the representative scene is playable.

# 4. Visual Source of Truth and Art-Direction Lock

## 4.1 Source Hierarchy

| Source Layer | Purpose | Authority |
| --- | --- | --- |
| Master Visual Principles | Overall tone, readability and stylisation. | Highest creative authority. |
| 21G Style Lock | Production-specific palette, scale, kit and review rules. | Active overhaul authority. |
| Material DNA Library | Shared physical and visual identity for materials. | Asset-family authority. |
| Golden Assets | Approved examples that demonstrate the rules. | Practical comparison authority. |
| Asset Brief | Requirements for one asset or family. | Local production authority. |
| Forge Source | Editable model, texture, material, clip and override data. | Canonical authored source. |
| Baked Product | Runtime mesh, texture, scene, icon and manifest. | Generated runtime product, not source. |

When two assets disagree, the team does not choose the more detailed asset automatically. The asset that better follows the locked style, gameplay readability and kit requirements is preferred.

## 4.2 Locked Style Pillars

| Pillar | Direction | Avoid |
| --- | --- | --- |
| Shape | Chunky, deliberate, readable voxel silhouettes with selective bevel-like stepping. | Noisy surfaces that dissolve the form. |
| Detail | High enough to feel crafted and fantastical, restrained enough to read at normal camera distance. | Micro-detail that only appears in extreme close-up. |
| Colour | Material-led palettes with clear value ranges and controlled accent colours. | Random hue shifts between related assets. |
| Fantasy | Magic appears through material, rune, emission, motion and atmosphere. | Generic neon overlays applied to every magical object. |
| Wear | Damage and age tell a story but preserve function and silhouette. | Uniform grunge on every asset. |
| Lighting | Warm villages, readable workspaces, dangerous caves and distinct magical light. | Emission so strong that textures and shapes disappear. |
| Scale | One-metre block world with consistent sub-voxel density and human-readable proportions. | Props that change apparent scale from asset to asset. |
| Construction | Reusable families with visible load, join and trim logic. | Walls, roofs and beams that appear unrelated. |

## 4.3 Art-Direction Change Control

A proposed change to the locked style requires:

1. A written problem statement.
2. Comparison images in at least two representative contexts.
3. Impact assessment for approved assets and kits.
4. Decision on whether existing assets must migrate.
5. A recorded approval or rejection.

This prevents gradual style drift caused by solving each new asset independently.

# 5. Current-State Audit and Evidence Capture

The overhaul begins with evidence, not assumptions. Current assets may be placeholders, partially usable, technically broken, stylistically inconsistent or already strong enough to retain.

## 5.1 Audit Capture Set

For every asset family, capture:

- Forge or editor preview.
- In-world daylight view.
- In-world night view when light or emission matters.
- Tiled or repeated view.
- Building-context view.
- Inventory icon and held view for items.
- Active, inactive and damaged views when supported.
- Collision and footprint overlay for unique blocks.
- Performance sample when the asset will repeat heavily.

## 5.2 Audit Classification

| Classification | Meaning | Default Action |
| --- | --- | --- |
| Retain | Meets direction and technical requirements. | Preserve; document as approved or golden. |
| Polish | Core asset is sound but needs limited changes. | Create a targeted override or source revision. |
| Rebuild | Shape, texture or structure is unsuitable. | Recreate in the Forge while preserving gameplay ID where possible. |
| Split | One legacy asset is doing multiple incompatible jobs. | Create separate presentation assets and map intentionally. |
| Merge | Multiple legacy assets duplicate one role. | Consolidate under a shared family with aliases or fallback. |
| Defer | Not required for the current slice or dependencies. | Keep legacy or placeholder presentation. |
| Remove Later | Unused or superseded, but unsafe to delete immediately. | Deprecate and remove only after dependency proof. |

## 5.3 Audit Questions

- Does the asset match the intended material family?
- Is its scale consistent with neighbouring assets?
- Does its silhouette communicate its gameplay role?
- Does it tile or repeat acceptably?
- Does it have the states the game already exposes?
- Does it use the correct collision, footprint and sockets?
- Is it referenced by structures, items, recipes, saves or tests?
- Can it be migrated cosmetically, or does it require a contract change?
- Is it a useful golden example or a warning example?

## 5.4 Audit Deliverable

The audit produces a migration register, not only screenshots. Each record receives a classification, priority, dependency list, Forge mode, target kit, required review scenes and fallback.

# 6. Asset Inventory, Registry Mapping and Migration Records

## 6.1 Inventory Units

The inventory is organised at three levels:

| Level | Example | Use |
| --- | --- | --- |
| Asset | `block.terrain.grass` | One registry-linked object. |
| Family | Oak construction family | Shared material and shape set. |
| Kit | Forest Hamlet building kit | Cross-family set required to complete structures. |

An individual asset can be approved while its family or kit remains incomplete. This distinction prevents a finished plank texture from being mistaken for a finished timber building system.

## 6.2 Required Migration Record Fields

| Field | Purpose |
| --- | --- |
| Gameplay ID | Stable block, item, machine or structure-facing identity. |
| Presentation ID | Stable Forge presentation identity. |
| Display Name | Human-readable name. |
| Asset Family | Material or functional family. |
| Kit Membership | Building or structure kits that depend on it. |
| Current Source | Legacy file, scene or presentation reference. |
| Current Classification | Retain, Polish, Rebuild, Split, Merge, Defer or Remove Later. |
| Target Forge Mode | Surface, Voxel, Compound or hybrid. |
| Required Representations | Placed, inventory, held, dropped, icon or preview. |
| Required States | Active, damaged, wet, powered and other states. |
| Contract Impact | None, cosmetic-safe, review-required or gameplay redesign. |
| Dependencies | Materials, palettes, parts, effects, shaders, sockets or other assets. |
| Priority | Critical, High, Medium, Low or Deferred. |
| Status | Lifecycle state. |
| Owner | Responsible creator or reviewer. |
| Review Scenes | Contexts required for approval. |
| Fallback | Legacy or safe default presentation. |
| Notes and Decisions | Reasoning and exceptions. |

## 6.3 Registry Export and Discovery

The preferred first inventory is generated from the actual registries and structure definitions. Manual spreadsheets may supplement it, but they must not become a disconnected alternate truth. The export should identify:

- Registered blocks without presentations.
- Presentations without registered users.
- Structure blueprints referencing deprecated assets.
- Items missing held, dropped or icon forms.
- Machines missing state bindings or sockets.
- Families with incomplete shape coverage.
- Legacy file paths used directly instead of presentation IDs.

# 7. Asset Status Lifecycle and Approval States

## 7.1 Lifecycle

```text
Unreviewed
    -> Audited
    -> Briefed
    -> In Authoring
    -> Internal Review
    -> Revision
    -> Candidate
    -> Approved
    -> Migrated
    -> Verified In World
    -> Released
```

An asset can move backward when a regression or style issue is found.

## 7.2 Status Definitions

| Status | Meaning | May Ship? |
| --- | --- | --- |
| Unreviewed | Exists but has not been classified. | Legacy only. |
| Audited | Current state and references are understood. | Legacy only. |
| Briefed | Target, dependencies and acceptance criteria are defined. | No. |
| In Authoring | Source is actively being created or edited. | No. |
| Internal Review | Creator believes the first pass is complete. | No. |
| Revision | Changes are required. | No. |
| Candidate | Passes local checks and is ready for full review. | Development builds only. |
| Approved | Creative and technical reviewers accept the source and bake. | Controlled integration. |
| Migrated | Registry and override mapping now resolve to the candidate. | Development builds. |
| Verified In World | Existing structures, states and representative scenes pass. | Yes for the slice. |
| Released | Included in a milestone or content pack. | Yes. |
| Deprecated | Replaced but retained for fallback or compatibility. | Fallback only. |
| Removed | Dependency proof complete and source retired according to policy. | No. |

## 7.3 Approval Is Representation-Specific

An asset may be approved as a placed block but still need revision as an inventory icon or held item. Migration records must record representation-level status where the distinction matters.

# 8. Priority, Dependency and Batch Planning

## 8.1 Priority Levels

| Priority | Definition | Example |
| --- | --- | --- |
| Critical | Blocks current building completion or the core POC loop. | Oak roof kit, stone foundations, furnace, chute. |
| High | Needed to make the slice coherent or readable. | Doors, windows, village props, mana conduit. |
| Medium | Adds breadth, polish or a secondary building. | Extra furniture, alternate stone trim. |
| Low | Valuable but not needed for current milestone. | Rare decorative variants. |
| Deferred | Explicitly outside this overhaul stage. | Final dimensional megastructure kit. |

## 8.2 Dependency Order

```text
Style lock
    -> palettes and Material DNA
    -> golden materials
    -> standard block surfaces
    -> generated shapes
    -> unique shapes and functional blocks
    -> structure kits
    -> animated states and effects
    -> variants and polish
    -> legacy retirement
```

## 8.3 Batch Rules

A production batch should:

- Be small enough to review coherently.
- Contain its required dependencies or reference approved ones.
- Have a named gameplay or building outcome.
- Include migration and regression tasks, not only authoring tasks.
- Avoid mixing unrelated style experiments.
- End with a usable improvement in the game.

Recommended batch size is determined by complexity rather than a fixed asset count. Ten simple terrain surfaces may be one batch; one compound machine with states and effects may be its own batch.

# 9. Visual Quality Tiers and Completion Definitions

## 9.1 Quality Tiers

| Tier | Purpose | Required Standard |
| --- | --- | --- |
| Placeholder | Functional development only. | Correct identity and basic footprint. |
| Blockout | Shape and scale review. | Readable silhouette and proportions. |
| POC Candidate | Representative vertical slice. | Coherent style, materials, states and acceptable performance. |
| Production | Approved reusable game asset. | Full required representations, review scenes, metadata and fallback. |
| Hero | Rare focal asset or landmark. | Additional uniqueness and polish within the same style boundaries. |

Not every object needs Hero quality. A barrel used hundreds of times should be production-quality, efficient and consistent rather than over-detailed.

## 9.2 Completion Dimensions

An asset is only complete when all applicable dimensions pass:

- Visual form.
- Surface and material.
- Scale and placement.
- Required representations.
- Runtime states.
- Animation and effects.
- Collision and contract.
- Registry and dependencies.
- Performance.
- In-world context.
- Documentation and fallback.

# 10. Naming, Ownership, Provenance and File Organisation

## 10.1 Identity Layers

| Identity | Example | Stability |
| --- | --- | --- |
| Gameplay ID | `block.machine.basic_furnace` | Stable save and gameplay identity. |
| Presentation ID | `presentation.machine.basic_furnace` | Stable visual resolution identity. |
| Forge Source Path | `res://content/forge/machines/basic_furnace/` | Organisational, may move through controlled refactor. |
| Baked Product Path | `res://generated/forge/...` | Generated and disposable. |
| Display Name | Basic Furnace | Localisable and editable. |

## 10.2 Ownership

Every family and kit should have a clear owner responsible for coherence. Individual assets can be authored by different contributors, but family approval belongs to someone reviewing the set together.

## 10.3 Provenance

Record whether a field comes from:

- Built-in base presentation.
- Project visual override.
- Shared family template.
- Content pack.
- World override where permitted.
- Generated default.

This is essential when a material, clip or collision appears wrong after several override layers.

# 11. End-to-End Forge Migration Workflow

## 11.1 Standard Workflow

1. Export or locate the registered asset and its references.
2. Audit the current presentation in representative scenes.
3. Classify the asset and assign priority.
4. Write the asset or family brief.
5. Select Surface, Voxel, Compound or hybrid authoring.
6. Create or apply the approved palette and Material DNA.
7. Build the base form before optional variants.
8. Add required collision, pivots, sockets and footprints.
9. Add required runtime states, animation and effects.
10. Generate icons and secondary representations.
11. Validate and bake.
12. Review in isolation and context.
13. Create the project override or approved registry mapping.
14. Run structure, save and performance regression tests.
15. Mark the asset Migrated and Verified In World.
16. Deprecate legacy presentation only after fallback proof.

## 11.2 Fast Polish Workflow

For a Retain or Polish classification:

1. Open the existing asset as an override.
2. Change only the necessary fields.
3. Compare with the original.
4. Bake and review the affected contexts.
5. Preserve untouched base fields and fallback.

## 11.3 Family Workflow

A family begins with one golden base material and a shape coverage plan. The team does not create every variant in parallel before the base is approved. The recommended sequence is:

```text
Material DNA
    -> full cube
    -> plank/brick or primary construction form
    -> slab and stair
    -> beam/post and wall
    -> roof/opening/trim where applicable
    -> state layers
    -> controlled variants
```

# 12. Reference Boards, Style Kits and Golden Assets

## 12.1 Required Reference Boards

- Overall Leyforge mood and value range.
- Natural materials: soil, stone, wood, foliage, water.
- Village construction: timber framing, stone foundations, roofing and openings.
- Automation: readable medieval-mechanical and early industrial forms.
- Magic: mana crystals, runes, conduits, wards and ancient infrastructure.
- Damage and weathering.
- Lighting: day, interior, night, cave and magical scenes.
- Item silhouettes and inventory presentation.

Reference boards guide direction; they are not licences to copy another game's assets.

## 12.2 Golden Assets

The first golden set should include:

| Golden Asset | What It Locks |
| --- | --- |
| Grass/Dirt Block | Terrain pixel density, soil palette and top-to-side transition. |
| Basic Stone | Stone value range, noise restraint and mining readability. |
| Oak Log and Plank | Wood grain, end grain, construction palette and warmth. |
| Oak Beam/Post | Structural thickness and building silhouette. |
| Roof Piece | Roof rhythm, trim and readable slope. |
| Basic Furnace | Machine mass, opening, heat, active state and effect restraint. |
| Wooden Chute | Unique-shape density, direction and connection language. |
| Iron Pickaxe | Item scale, silhouette, metal and handle relationship. |
| Mana Crystal/Conduit | Magic colour hierarchy, emission and rune restraint. |
| Village Lantern | Warm light, prop scale and day/night readability. |

Golden assets are versioned. Replacing one triggers an impact review for dependent families.

# 13. Palette, Material DNA and Shared Surface Library

## 13.1 Material DNA First

Every major material family defines:

- Base hue and value range.
- Shadow and highlight roles.
- Pattern frequency and direction.
- Roughness and metallic behaviour.
- Emission policy.
- Edge and wear behaviour.
- Damage response.
- Wet, burnt, frosted or corrupted response where needed.
- Compatible construction and cultural accents.

## 13.2 Initial Shared Material Families

| Family | Core Identity | Early Uses |
| --- | --- | --- |
| Soil | Warm earth, fertility and moisture readability. | Dirt, grass side, farmland, mud. |
| Common Stone | Cool-neutral mass with controlled variation. | Terrain, cobble, foundations, bricks. |
| Oak/Starter Timber | Warm, practical, readable grain. | Logs, planks, beams, roofs, furniture. |
| Copper | Warm metallic accent with early mechanical identity. | Gears, plates, fittings, chutes or machines. |
| Iron | Darker, stronger functional metal. | Tools, bands, furnace parts, guard supply. |
| Coal/Char | Deep matte material with fuel identity. | Ore, item, furnace contents and soot. |
| Glass | Readable transparency with stylised edges. | Windows, bottles, machine gauges. |
| Mana Crystal | Cool magical core with controlled emission. | Resource, conduit, rune table, ward objects. |
| Cloth/Leather | Soft and flexible surfaces with restrained folds. | Bags, banners, beds, handles and props. |
| Clay/Roof Tile | Warm fired construction material. | Roofing, pots, furnace details. |

## 13.3 Palette Governance

- Related assets use named palette roles rather than copying arbitrary colour values.
- A family palette can branch for culture or biome, but the value hierarchy remains recognisable.
- Emissive colours are separate roles and are tested with emission disabled.
- Palette expansion requires a reason: new material behaviour, readability need or cultural identity.
- Near-duplicate palette entries are consolidated during review.

# 14. Scale, Resolution, Density and Silhouette Rules

## 14.1 World Scale

The default world block remains one cubic metre. Standard 32 x 32 surfaces represent that metre at the chosen pixel density. Unique models may use different canvas bounds, but their world dimensions and sub-voxel density must be explicit.

## 14.2 Density Profiles

| Profile | Typical Use | Rule |
| --- | --- | --- |
| Surface 32 | Standard terrain and construction faces. | Exact 32 x 32 face source. |
| Small Voxel | Items, small props and narrow mechanisms. | Enough cells for silhouette; do not chase invisible detail. |
| Standard Voxel | Unique blocks, chutes and workstations. | Matches standard material density where surfaces meet. |
| Compound | Machines or multi-part stations. | Each part uses an approved density and shared scale. |
| Hero Exception | Rare landmark object. | Requires explicit approval and performance review. |

## 14.3 Silhouette Tests

Every unique asset is reviewed:

- Untextured.
- In flat lighting.
- At normal gameplay distance.
- At inventory icon scale if applicable.
- Against light and dark backgrounds.
- Beside a one-metre block and player proxy.

If the object is not recognisable in these tests, texture detail will not solve the underlying problem.

# 15. Standard Terrain and Surface Block Migration

## 15.1 Terrain First-Pass Order

1. Grass top.
2. Dirt.
3. Grass side transition.
4. Common stone.
5. Cobblestone or broken stone.
6. Sand.
7. Gravel.
8. Clay.
9. Water presentation.
10. Snow or frost only if required by the active POC biome.

## 15.2 Terrain Review

Terrain assets must be tested in:

- Large flat areas.
- Slopes and cliffs.
- Mixed block transitions.
- Shadows and bright sunlight.
- Wet or water edges.
- Near buildings and roads.
- Mining damage or exposed faces where implemented.

## 15.3 Terrain Variation

The first pass uses restrained deterministic variation:

- A small number of pattern variants.
- Optional rotation or mirroring where it does not break direction.
- Sparse details rather than high-frequency noise.
- Transition rules for grass, dirt and path edges.

Variation is added only after the base tile remains clean when repeated.

# 16. Natural Materials, Plants, Fluids and Biome Presentation

## 16.1 Starter Natural Set

- Oak or starter-tree log side and end.
- Leaves with readable cut-out or stylised volume.
- Sticks, branches or ground litter if required.
- Basic grass plant.
- Small flower or herb set.
- Farmland and crop stages required by the hamlet.
- River/lake water.
- Reeds or waterside plant if used in the valley.
- Mana clue plant or crystal growth near the ruin.

## 16.2 Foliage Rules

- Foliage must remain readable without excessive alpha noise.
- Leaf masses should form coherent volumes at distance.
- Plant silhouettes should differ by gameplay role.
- Wind animation is subtle and bounded.
- Dense foliage must be reviewed for overdraw and village visibility.

## 16.3 Fluid Rules

Water should communicate flow, depth and edge contact without breaking the voxel style. The POC prioritises one coherent water solution over multiple biome-specific water variants.

# 17. Construction Material Families and Kit Completeness

## 17.1 Family Completeness Matrix

| Shape/Role | Starter Timber | Common Stone | Roof/Clay | Glass | Iron Detail |
| --- | --- | --- | --- | --- | --- |
| Full Block | Required | Required | Optional | Required | Optional |
| Slab | Required | Required | Required where used | No | Optional |
| Stair/Slope | Required | Required | Required | No | Optional |
| Beam | Required | Optional | No | No | Optional |
| Post/Pillar | Required | Required | No | No | Optional |
| Wall/Fence | Required | Required | No | No | Optional |
| Roof Piece | Required or clay kit | Optional | Required | No | No |
| Door/Gate | Required | Optional frame | No | Window insert | Required fittings |
| Window | Required frame | Optional frame | No | Required pane | Optional fittings |
| Trim/Arch | Required | Required | Optional | No | Optional |
| Damaged Variant | High priority | High priority | Medium | Low | Medium |

## 17.2 Starter Timber Family

The starter timber family is the first complete construction family because it supports houses, warehouse, watchtower, farm buildings and interiors. It should include:

- Log side and end.
- Stripped or worked timber if visually justified.
- Plank block and floor.
- Beam and post.
- Slab and stair.
- Wall, fence and railing.
- Roof structure or compatible roof family.
- Door, trapdoor, window frame and shutters.
- Basic trim, braces and balcony pieces.
- Damaged, burnt or repair-state presentation as required by raids.

## 17.3 Common Stone Family

The stone family supports foundations, paths, walls, furnaces, watchtower base and ruin integration. It should include natural stone, cobble, cut stone or brick, slab, stair, wall, pillar, arch/trim and damaged/rubble states.

## 17.4 Kit Completion Rule

A family is not marked Production Complete until every shape required by its current structure kits exists or has an approved substitute. The backlog may contain future shapes without blocking the current kit.

# 18. Generated Shapes, Modular Pieces and Custom Overrides

## 18.1 Generated Shape Migration

Generated shapes inherit the approved material family, UV or face mapping, collision profile and state layers. They are reviewed as a family because automatic generation can expose seams or stretched patterns not visible on the full block.

## 18.2 Required Early Generated Shapes

- Slabs.
- Stairs or slopes.
- Walls.
- Fences and railings.
- Posts and pillars.
- Beams.
- Roof slopes and corners.
- Arches or lintels.
- Window and door frame pieces.

## 18.3 Custom Overrides

Use a custom Voxel Model override when generated geometry cannot provide the required silhouette, connection, trim or culture identity. The custom shape still follows the same gameplay footprint and contract unless explicitly redesigned.

# 19. Unique-Shaped Blocks, Logistics and Directional Assets

## 19.1 Early Unique Asset Set

- Wooden chute straight.
- Wooden chute slope or vertical transition.
- Chute corner.
- Chute junction or output piece only if required by the POC chain.
- Basic copper gear or mechanism.
- Hand crank.
- Shaft or axle segment.
- Warehouse input or delivery interface.
- Simple pipe or mana conduit segment.

## 19.2 Directional Readability

Directional assets must show:

- Input and output direction.
- Connection face.
- Flow orientation.
- Blocked or disconnected state where needed.
- Rotation in placement preview.
- Consistent socket naming and alignment.

The direction should remain understandable without relying only on animated items or coloured arrows.

## 19.3 Connection Family Review

Review every connection mask used by the current gameplay system. Straight pieces may look excellent while corners, T-junctions or end caps fail. The family is approved only for the masks actually shipped or used in the slice.

# 20. Functional Stations, Storage and Village Work Blocks

## 20.1 Priority Functional Blocks

| Block | Visual Role | Required States |
| --- | --- | --- |
| Workbench | Early crafting identity. | Idle; optional occupied/tool variation. |
| Basic Furnace | Smelting and heat source. | Off, lit, processing, blocked if visible, damaged. |
| Anvil/Forge Surface | Metalworking role. | Idle; optional strike marker or heat context. |
| Chest | Personal storage. | Closed, open, locked if supported, damaged. |
| Crate | Village supply and visual dressing. | Empty/full variants where useful. |
| Barrel | Food, liquid or general storage family. | Closed/open or labelled variants. |
| Village Warehouse Interface | Delivery and project supply endpoint. | Available, receiving, full/blocked, reserved marker. |
| Rune Table | Basic magical crafting. | Dormant, active, insufficient mana, damaged. |
| Cooking Station | Village and survival support. | Off, active, smoke/steam where required. |

## 20.2 Functional Readability

A station should communicate its purpose through shape, work surface, openings, stored tools, sockets and animation. Labels and UI can support it but should not be the only distinction.

## 20.3 Storage Family Reuse

Crates, barrels and chests should share useful part libraries and palette relationships while retaining functional differences. Recolouring one identical box is not sufficient when the interaction and storage role differ.

# 21. Automation Machines, Power and Production Chains

## 21.1 Migration Order

1. Wooden chute family.
2. Hand crank or basic mechanical power source.
3. Basic furnace and mana-furnace presentation.
4. Copper mechanism and gear library.
5. Input/output storage interfaces.
6. First extraction or processing machine required by the POC.
7. Warning, blocked and damage states.
8. Additional conveyors, pipes or machines after the first chain is complete.

## 21.2 Machine Visual Grammar

| Element | Meaning |
| --- | --- |
| Heavy Body | Main process or containment. |
| Visible Input | Where raw material enters. |
| Visible Output | Where processed material leaves. |
| Power Element | Crank, shaft, fuel opening, mana socket or conduit. |
| Moving Part | Shows active work. |
| Status Cue | Light, rune, gauge, motion or sound. |
| Maintenance Detail | Access plate, band, bolts or tool point. |
| Risk Cue | Heat, instability, overload or blockage presentation. |

## 21.3 Production-Chain Review

Machines are reviewed in a connected line rather than only individually:

```text
resource input
    -> transport
    -> processing
    -> output storage
    -> village warehouse/project supply
```

The chain should remain readable from several metres away and during active item flow.

# 22. Magic Infrastructure, Runes, Mana and Ward Assets

## 22.1 Initial Magic Set

- Raw mana crystal block or growth.
- Mana crystal item, shard and dust presentation.
- Basic rune item or tile.
- Rune table.
- Mana furnace.
- Mana conduit straight and corner/connection masks required by the POC.
- Ward lantern or ward stone.
- Old rune ruin blocks, glyphs and dormant/active state.

## 22.2 Magic Visual Hierarchy

Magic presentation uses a hierarchy:

1. Material form remains readable without emission.
2. Rune or conduit path communicates function.
3. Controlled emission shows energy state.
4. Motion or particles communicate activity or instability.
5. Strong effects are reserved for activation, overload or major events.

## 22.3 Avoiding Generic Magic

Not every magical asset should be a dark block with bright cyan lines. Mana crystal, rune-carved stone, enchanted wood, ward lanterns and magitech machinery should share an energy language while retaining distinct materials and functions.

# 23. Items, Tools, Weapons, Components and Resource Forms

## 23.1 First Item Migration Set

- Stick and plant fibre bundle.
- Coal and charcoal.
- Raw copper/iron ore and ingots.
- Mana crystal, shard, dust and basic rune.
- Wood, stone, copper and iron pickaxes as required by current progression.
- Wood, stone and iron axes as required.
- Basic sword or weapon used in the raid loop.
- Hammer.
- Wrench or automation tool.
- Rune chisel/tuner if present in the slice.
- Torch or lantern item.
- Village supply crate or project bundle.

## 23.2 Representation Requirements

| Item Type | Inventory Icon | Held Form | Dropped Form | Placed Form |
| --- | --- | --- | --- | --- |
| Tool/Weapon | Required | Required | Required | Optional display. |
| Resource | Required | Optional inspect | Required | Block form only where registered. |
| Block Item Form | Required | Placement preview | Required | References placed block presentation. |
| Component | Required | Rarely | Required or simplified | Used inside machine visuals only when justified. |
| Book/Map | Required | Required if read | Required | Optional prop form. |

## 23.3 Item Family Consistency

Tool tiers should communicate material progression while preserving the same tool class silhouette. A new material does not justify completely unrelated proportions unless the design intentionally changes function.

# 24. Props, Furniture, Lighting and Environmental Dressing

## 24.1 Priority Village Props

- Bed and bedding.
- Table and chair/stool.
- Shelves and cupboards.
- Crates, sacks and barrels.
- Lantern and wall light.
- Signs and notice/request board.
- Market table or stall pieces.
- Tool racks.
- Fireplace or hearth.
- Farm baskets, troughs and fencing.
- Blacksmith props.
- Mage desk, books, crystal stand and rune props.
- Guard rack or weapon stand.

## 24.2 Prop Production Rules

- Props use reusable part and material libraries.
- Repeated props receive low-cost variants or placement rotation where useful.
- Decorative clutter must not obstruct navigation or interaction accidentally.
- Props used by NPC animations require explicit interaction anchors.
- Lighting props are reviewed in day and night conditions.

## 24.3 Dressing Density

Buildings need enough dressing to communicate purpose, but not so much that voxel readability and NPC navigation are lost. Each structure kit defines low, standard and rich dressing targets.

# 25. Structure Kits, Blueprint Migration and Building Completion

## 25.1 Structure-Kit Model

A structure kit contains:

- Required material families.
- Required shape families.
- Doors, windows and roof solution.
- Functional blocks.
- Core props and lighting.
- Damage/repair states.
- Culture or biome rules.
- Blueprint references.
- Validation scenes.

## 25.2 First Structure Kits

| Kit | Core Outcome | Critical Dependencies |
| --- | --- | --- |
| Forest Hamlet House | Finished residence with warm interior. | Timber, stone foundation, roof, door, window, bed, light. |
| Village Warehouse | Storage and automated delivery endpoint. | Timber/stone, crates/barrels, warehouse interface, signs. |
| Watchtower | POC defence project and raid outcome. | Stone/timber, stairs, railings, roof, guard props, damage states. |
| Blacksmith/Forge | Iron chain and specialist building. | Stone, timber, furnace, anvil, tools, heat/light. |
| Farm Building | Food and village-life presentation. | Timber, fencing, crops, baskets, trough, storage. |
| Mage Workspace | Mana/rune teaching and infrastructure. | Rune table, mana materials, lantern/conduit, books/props. |
| Old Rune Ruin | Exploration and magic discovery. | Ancient stone, runes, damage, dormant/active state. |
| Goblin Camp | Visible raid source and threat identity. | Scrap timber, stolen crates, banners, fire, traps and dressing. |

## 25.3 Blueprint Migration

For every existing blueprint:

1. Resolve all stable block and presentation IDs.
2. Replace direct legacy file references.
3. Test rotations and shape variants.
4. Confirm footprint and collision compatibility.
5. Load the blueprint in a clean world and an existing save copy.
6. Test damage, repair and construction stages.
7. Compare resource requirements and gameplay markers.
8. Approve the migrated blueprint only after the full structure reads correctly.

# 26. Culture, Faction, Biome and Settlement Variants

## 26.1 Variant Priority

The first slice uses a restrained Forest Hamlet identity. Broad culture expansion is deferred until the base kits are strong. Early variants may include:

- Fresh vs aged timber.
- Village-maintained vs ruined stone.
- Forest moss or dampness.
- Goblin scrap and stolen-material treatment.
- Ancient rune ruin treatment.
- Mana-infused state.

## 26.2 Culture Variant Rules

A culture variant should change more than one arbitrary colour. It may alter trim, joinery, roof rhythm, symbols, prop selection, palette accents and material treatment while preserving compatible gameplay contracts.

## 26.3 Settlement State Variants

Settlement growth and damage can alter dressing density, repairs, banners, lighting and maintenance. These are composed from controlled state and variant layers rather than duplicated full asset libraries where possible.

# 27. Runtime States, Damage, Weather, Heat and Corruption

## 27.1 Required State Review

| State | Typical Assets | Review Need |
| --- | --- | --- |
| Active/Inactive | Machines, furnaces, rune devices. | Clear functional difference. |
| Powered/Unpowered | Automation and magic infrastructure. | Readable without UI. |
| Damaged | Buildings, machines, doors, defence blocks. | Preserve recognition and collision contract. |
| Repairing | Village projects and structures. | Scaffolds, supplies or partial restoration. |
| Wet/Snow/Frost | Terrain and exterior construction. | Controlled overlay, not total material replacement. |
| Heated/Overheated | Furnaces, metalwork and risky machines. | Escalating warning hierarchy. |
| Burning/Burnt | Timber, props and structures. | Effects during burn; stable burnt result where supported. |
| Corrupted | Terrain, magic infrastructure and structures. | Distinct state with gameplay-readable severity. |
| Blocked/Full | Chutes, machines and storage interfaces. | Clear status cue without excessive flashing. |

## 27.2 State Layer Order

A recommended composition order is:

```text
base material and geometry
    -> deterministic asset variant
    -> culture/biome treatment
    -> persistent condition or damage
    -> runtime functional state
    -> temporary event effect
```

Critical warnings can override cosmetic state channels.

# 28. Animation, Effects, Light and Audio Migration

## 28.1 Animation Priority

Motion is prioritised where it communicates:

- Processing.
- Power transmission.
- Flow direction.
- Opening or interaction.
- Heat or pressure.
- Mana activity.
- Damage or instability.

Static decorative assets do not need animation merely to appear polished.

## 28.2 First Animation Set

- Furnace flame and heat glow.
- Furnace door or hatch if used.
- Rotating gear on a machine.
- Hand crank rotation.
- Chute/conveyor flow cue where needed.
- Mana conduit pulse or flow.
- Rune table activation.
- Ward lantern active state.
- Water and subtle foliage motion.
- Goblin camp fire and smoke.

## 28.3 Effect and Audio Reuse

Create reusable profiles for:

- Small flame.
- Furnace flame.
- Smoke and soot.
- Sparks.
- Steam.
- Dust.
- Mana motes.
- Rune activation.
- Warning blink and sound.
- Mechanical loop.
- Magical hum.

Profiles can be tuned per asset without duplicating entire systems.

## 28.4 Accessibility

- Do not rely on colour alone for critical machine states.
- Avoid rapid uncontrolled flashing.
- Provide motion reduction or simplified effects where required.
- Keep audio cues informative but not mandatory for understanding.

# 29. Icons, Thumbnails, Codex Images and UI Presentation

## 29.1 Icon Migration

Icons should be generated or framed from the approved asset source with consistent camera, lighting, background, padding and scale. Manual icon overrides are allowed when automatic results fail readability.

## 29.2 Icon Checks

- Recognisable at actual inventory size.
- Distinguishable from neighbouring tiers and families.
- Correct orientation.
- No clipping.
- Rarity or quality borders do not hide the item.
- Emission remains controlled.
- Transparent background edges remain clean.

## 29.3 Thumbnails and Codex

Forge thumbnails support browsing and review. Codex images may use a richer presentation, but they should still resolve from approved assets or documented illustrations rather than becoming a second inconsistent visual source.

# 30. Collision, Footprints, Pivots, Sockets and Contract Review

## 30.1 Contract Impact Classes

| Class | Meaning | Approval |
| --- | --- | --- |
| Cosmetic Safe | No gameplay-facing contract changes. | Normal visual review. |
| Cosmetic With Revalidation | Same intended contract, but generated bounds or sockets need proof. | Technical review required. |
| Contract Change | Collision, footprint, port, pivot or interaction changes. | Gameplay and migration approval required. |
| New Gameplay Asset | Presentation represents a new function or identity. | New registry entry and full system review. |

## 30.2 Required Contract Checks

- Placement footprint.
- Collision and selection bounds.
- Occlusion and face culling for block neighbours.
- Rotation and directional masks.
- Automation input/output ports.
- Power and mana sockets.
- Particle, light and audio sockets.
- NPC work and interaction anchors.
- Held grip and item pivot.
- Structure blueprint occupancy.

## 30.3 Collision Principle

Collision follows gameplay need, not every microvoxel contour. A detailed furnace can use a simplified solid body and interaction volumes. A chute needs collision that does not falsely block visible flow or player movement.

# 31. Performance, Atlases, LOD and Repetition Budgets

## 31.1 Performance Review Categories

| Category | Main Risk | Control |
| --- | --- | --- |
| Terrain | Massive repetition and draw/atlas pressure. | Chunk path, shared materials, compact variation. |
| Construction | Large repeated surfaces. | Generated shapes, batching and family atlases. |
| Props | Node count and overdraw. | Instancing, simple collision, density limits. |
| Machines | Part count, animation and effects. | Combine static parts, bounded animated parts, distance LOD. |
| Foliage | Transparency and overdraw. | Controlled cut-outs, density and LOD. |
| Magic | Emission, particles and lights. | Shared shaders, effect budgets, reduced distant presentation. |
| Icons | Cache and generation cost. | Deterministic generation and thumbnail cache. |

## 31.2 Repetition Tests

Review one asset, a small group and a stress group. A lantern that is affordable alone may be expensive across a village. A machine effect that looks subtle once may become overwhelming in a factory.

## 31.3 LOD Direction

- Full nearby model and states.
- Reduced particles, lights and animation at medium range.
- Static or simplified presentation at distance.
- Structure or regional summary beyond active visual range.

LOD should preserve silhouette and critical warnings.

# 32. Legacy Assets, Fallback, Deprecation and Removal

## 32.1 Legacy Strategy

Legacy assets are retained during migration because they provide:

- Safe fallback.
- Existing save compatibility.
- Comparison evidence.
- Emergency rollback.
- Reference for missing states or sockets.

## 32.2 Deprecation Sequence

1. Approve the replacement source.
2. Bake deterministic runtime products.
3. Map the project override or registry presentation.
4. Verify representative new and existing worlds.
5. Confirm no direct path references remain.
6. Mark the legacy asset Deprecated.
7. Retain through at least the defined milestone fallback window.
8. Remove only after dependency scans and rollback policy permit it.

## 32.3 Alias and Replacement Rules

A renamed presentation can use an alias. A gameplay object that remains the same should not receive a new gameplay ID only because its appearance changed. A genuinely split or redesigned object requires explicit registry migration.

# 33. Forest Hamlet Visual Slice and Priority Asset Register

The Forest Hamlet is the first visual proof because it combines terrain, buildings, NPC workspaces, automation, magic, structures, props, damage and a raid outcome in one bounded area.

## 33.1 Critical Asset Groups

| Group | Critical Contents | Outcome |
| --- | --- | --- |
| Terrain | Grass, dirt, stone, water, path, sand/gravel/clay as used. | Coherent valley floor and build context. |
| Starter Timber | Log, plank, beam, post, slab, stair, fence, roof support, openings. | Houses, warehouse, watchtower and farm buildings. |
| Common Stone | Natural, cobble, brick/cut, slab, stair, wall, pillar, rubble. | Foundations, paths, watchtower, furnace and ruin. |
| Roof/Openings | Roof slopes/corners, door, window, shutters, glass, trim. | Buildings can be visually finished. |
| Village Props | Bed, table, chair, crates, barrels, shelves, lantern, request board. | Interiors and settlement identity. |
| Work Blocks | Workbench, furnace, anvil, chest, warehouse interface, cooking station. | Functional buildings read correctly. |
| Automation | Wooden chute, crank, gear/mechanism, first processor and connection states. | Visible supply chain. |
| Magic | Mana resource forms, rune table, mana furnace, conduit, ward lantern/stone. | Magical infrastructure and defence loop. |
| Items | Starter tools, iron tools/weapon, ingots, coal, mana components, delivery bundle. | Inventory and held presentation. |
| Threat Dressing | Goblin camp materials, fire, stolen crates, traps and banner. | Raid source and contrast with village. |
| Rune Ruin | Ancient stone, rune glyphs, damage, dormant/active state. | Magic discovery and exploration anchor. |

## 33.2 Slice Acceptance

The slice is visually ready when a player can move from wilderness to village, inspect buildings, follow the production chain, enter workspaces, discover mana infrastructure and identify the goblin threat without encountering major placeholder families in the intended route.

# 34. Building Completion Production Plan

## 34.1 Building Order

Recommended order:

1. Test hut or material showcase.
2. Forest Hamlet house.
3. Warehouse.
4. Watchtower.
5. Blacksmith/forge.
6. Farm building.
7. Mage workspace.
8. Rune ruin.
9. Goblin camp.

This order grows the reusable kit while proving increasingly complex functional requirements.

## 34.2 Building Readiness Gate

Before a building enters final construction, confirm:

- Foundation family approved.
- Wall and floor family approved.
- Roof solution approved.
- Door and window solution approved.
- Lighting approved.
- Primary functional block approved.
- Core props available.
- Damage/repair needs understood.
- Blueprint contract passes.
- NPC navigation and work anchors pass where required.

## 34.3 No One-Off Rescue Assets

When a building exposes a missing piece, first ask whether the piece belongs in a reusable family. One-off rescue assets are allowed for genuinely unique architectural features, not to bypass incomplete kits.

# 35. Review, Feedback, Revision and Sign-Off

## 35.1 Review Roles

| Role | Main Responsibility |
| --- | --- |
| Creator | Produces source, self-checks and responds to feedback. |
| Visual Reviewer | Style, silhouette, material, palette and context. |
| System Reviewer | Registry identity, states, sockets and gameplay-facing contracts. |
| Performance Reviewer | Repetition, effects, materials, node count and LOD. |
| Building/World Reviewer | Kit usefulness, blueprint integration and environment fit. |
| Final Approver | Confirms milestone scope and acceptance evidence. |

One person may fill several roles in a small team, but the review questions remain distinct.

## 35.2 Feedback Format

Useful feedback includes:

- Problem.
- Evidence and context.
- Severity.
- Required outcome.
- Suggested direction when helpful.
- Whether the issue blocks approval.

Avoid vague notes such as "make it nicer" or "more fantasy" without identifying the visual or gameplay problem.

## 35.3 Revision Control

Revisions should not erase the candidate under review. Compare source and baked results, retain review notes and record why a major direction changed.

# 36. In-World Visual QA and Regression Testing

## 36.1 Required Review Scenes

- Neutral turntable or Forge preview.
- Material wall and shape gallery.
- Terrain tiling field.
- Forest Hamlet daylight.
- Forest Hamlet night.
- Interior lighting scene.
- Automation chain.
- Mana infrastructure scene.
- Damage/repair scene.
- Inventory and held-item scene.
- Performance repetition scene.

## 36.2 Regression Matrix

| Test | Standard Blocks | Unique Blocks | Machines | Items | Structure Kits |
| --- | --- | --- | --- | --- | --- |
| Registry resolution | Required | Required | Required | Required | Required |
| Existing save load | Required where placed | Required where placed | Required | Required if stored | Required |
| Rotation/placement | Shape-specific | Required | Required | Placement preview | Required |
| Collision/selection | Required | Required | Required | Held/dropped bounds | Required |
| State bindings | As applicable | As applicable | Required | Quality/charge as applicable | Damage/repair |
| Day/night | Surface review | Required | Required | Icon/held | Required |
| Repetition/performance | Required | Required | Required | Dropped stress | Required |
| Blueprint build | Generated shapes | As referenced | As referenced | Project supplies | Required |

## 36.3 Existing-World Copies

Never test destructive migration first on the only active development save. Use copied saves with known structures, inventories, machines and damage states.

# 37. Version Control, Change Logs and Migration Reporting

## 37.1 Commit Boundaries

Prefer commits that contain:

- One coherent asset family or machine.
- Its Forge source.
- Approved generated products if the project policy stores them.
- Registry or override updates.
- Migration record changes.
- Tests or review evidence references.

Avoid large unrelated visual dumps that make regression and rollback difficult.

## 37.2 Migration Report

Each batch report includes:

- Scope and outcome.
- Assets added, replaced, deferred and deprecated.
- Stable IDs affected.
- Contract changes.
- Structure blueprints retested.
- Known issues.
- Performance notes.
- Rollback point.
- Next dependencies.

## 37.3 Generated Data Policy

Generated output must remain reproducible from canonical source. If generated assets are committed for build convenience, CI or tooling should still detect drift from the approved source.

# 38. Risks, Redesign Triggers and Contingencies

## 38.1 Risk Register

| Risk | Effect | Mitigation | Redesign Trigger |
| --- | --- | --- | --- |
| Style drift | Assets look unrelated. | Golden assets, family review, change control. | Multiple approved kits require contradictory rules. |
| Endless polish | Buildings remain unfinished. | Quality tiers, batch outcomes, milestone gates. | Critical batch repeatedly expands without new gameplay outcome. |
| Variant explosion | Content and review become unmanageable. | Base-first, compatibility tags, layer budgets. | A family cannot be tested combinatorially. |
| Registry breakage | Saves or blueprints fail. | Stable IDs, aliases, validation, copied-save tests. | Cosmetic swaps require frequent manual save repair. |
| Contract drift | Collision, ports or anchors no longer match. | Contract impact classes and overlays. | Visual freedom is consistently blocked by current contracts. |
| Performance regression | Villages/factories become expensive. | Stress scenes, LOD, shared materials, effect budgets. | Representative slice misses agreed budgets after optimisation. |
| Tooling delay | Forge development blocks all art. | Permit controlled external placeholders and import, keep MVP narrow. | Basic authoring tasks remain slower than manual alternatives after the MVP. |
| Overly generic magic | Fantasy assets feel interchangeable. | Material-first hierarchy and distinct functional families. | Players cannot identify magic infrastructure types without UI. |
| Incomplete kits | Every building needs one-off fixes. | Kit readiness checklist and dependency planning. | More than a small minority of building pieces are exceptions. |
| Legacy removal too early | Rollback and save safety lost. | Deprecation window and dependency proof. | A replacement causes unresolved world or blueprint failures. |

## 38.2 Contingency Rules

- If the full Forge UI is delayed, source may be produced through a controlled minimal tool using the same data contracts.
- If a complex asset misses performance targets, simplify runtime products without destroying rich source.
- If a kit cannot support a building cleanly, revise the family before producing many one-off patches.
- If a cosmetic replacement requires gameplay changes, split it into a separate design and migration task.
- If final-quality work is slowing core gameplay proof, use POC Candidate quality for non-critical secondary assets and record the gap.

# 39. Staged Overhaul Roadmap

## Stage 0 - Audit and Style Lock

Deliverables:

- Registry-derived asset inventory.
- Current-state screenshots.
- Classification and priorities.
- Golden reference boards.
- Locked palette and Material DNA starting set.
- Migration record template and review scenes.

Exit gate: the team knows what exists, what blocks buildings and what the target looks like.

## Stage 1 - Terrain and Golden Materials

Deliverables:

- Grass/dirt/stone/water starter environment.
- Oak and common stone golden assets.
- Material wall and tiling scene.
- First deterministic variation rules.

Exit gate: the valley has coherent ground and the main building materials are approved.

## Stage 2 - Core Construction Kits

Deliverables:

- Starter timber family.
- Common stone family.
- Roof, door, window and glass solution.
- Generated shape validation.
- First finished house.

Exit gate: a complete building can be made without placeholders in its core shell.

## Stage 3 - Village Props and Functional Buildings

Deliverables:

- Furniture, storage, lighting and work props.
- Workbench, furnace, anvil, cooking and warehouse interface.
- House, warehouse and blacksmith/forge completion.

Exit gate: village buildings read as inhabited and functional.

## Stage 4 - Watchtower, Damage and Defence

Deliverables:

- Watchtower kit completion.
- Guard props.
- Damage, burnt and repair visuals required by the raid loop.
- Blueprint and construction-stage regression.

Exit gate: the watchtower project and raid aftermath can be shown coherently.

## Stage 5 - Automation Chain

Deliverables:

- Wooden chute family.
- Mechanical parts and power cue.
- Processing machine/furnace connection.
- Storage and warehouse delivery context.
- Active, blocked and damaged presentation.

Exit gate: the first factory-to-village supply line is visually understandable.

## Stage 6 - Magic Infrastructure and Rune Ruin

Deliverables:

- Mana resource family.
- Rune table and mana furnace.
- Conduit and ward family.
- Rune ruin dormant/active presentation.
- Magical night and effect review.

Exit gate: magic reads as practical infrastructure and discovery.

## Stage 7 - Items and Interaction Polish

Deliverables:

- Starter and iron tool/weapon set.
- Resource and component icons.
- Held/dropped presentations.
- Inventory readability pass.

Exit gate: the player's visible equipment matches the world quality.

## Stage 8 - Slice Integration and Legacy Deprecation

Deliverables:

- Full Forest Hamlet route pass.
- Goblin camp dressing.
- Existing-save and blueprint regression.
- Performance stress pass.
- Approved replacements and deprecated legacy map.

Exit gate: the visual slice can be presented as the new baseline and remaining legacy assets are clearly tracked.

# 40. Definition of Done and Acceptance Matrix

## 40.1 Asset Acceptance

| Requirement | Surface Block | Unique Block | Compound Machine | Item | Structure Kit |
| --- | --- | --- | --- | --- | --- |
| Stable registry mapping | Required | Required | Required | Required | Required |
| Approved source and bake | Required | Required | Required | Required | All members required for kit scope |
| Style and Material DNA | Required | Required | Required | Required | Coherent set |
| Scale and silhouette | Required | Required | Required | Required | Full structure readability |
| Required variants/states | As briefed | As briefed | Required | As briefed | Damage/repair as briefed |
| Collision/contract | Block contract | Full review | Full review | Held/dropped | Blueprint and navigation |
| Context review | Tiling/terrain | Placement/repetition | Connected chain | Inventory/held | Day/night/interior |
| Performance | Repetition | Repetition | Animation/effects | Dropped/icon | Full structure stress |
| Fallback | Required during migration | Required | Required | Required | Legacy blueprint/presentation path |
| Documentation | Migration record | Migration record | Migration record | Migration record | Kit checklist and blueprint report |

## 40.2 Overhaul Acceptance

The 21G overhaul stage is complete when:

- The Forest Hamlet visual route contains no major unintended placeholder families.
- The house, warehouse, watchtower, blacksmith/forge, farm and mage workspace use approved kits.
- The first automation chain is visually readable in idle, active and blocked conditions.
- Mana discovery and village ward infrastructure use a coherent approved language.
- Critical items have approved icon, held and dropped forms.
- Existing representative saves and blueprints load correctly.
- Performance remains within the current project budgets in the representative slice.
- All replaced assets have migration records and fallback status.
- The developer can reopen approved Forge source and manually refine the presentation without losing gameplay identity.

# 41. Continuous Content Production After the Overhaul

The visual overhaul establishes the baseline; it does not end asset production. Future assets should enter the same lifecycle rather than bypassing it.

## 41.1 New Asset Intake

Every new asset receives:

- Registry identity or planned identity.
- Family and kit membership.
- Forge mode.
- Material and scale profile.
- Required representations and states.
- Contract and performance expectations.
- Review scenes.
- Approval record.

## 41.2 Family Expansion

New culture, biome and dimensional families should reuse the production system while creating intentional identity. They begin with a small golden set and a structure or gameplay outcome, not an exhaustive variant matrix.

## 41.3 Periodic Visual Health Review

At milestones, review:

- Incomplete families.
- Unused or duplicated materials.
- Direct file references bypassing registries.
- Legacy fallback still in active scenes.
- Performance-heavy effects.
- Style drift in recent content.
- Missing icons or state presentations.
- Building kits that still require frequent exceptions.

# 42. Open Decisions for Later Planning

- Final name and branding of the Forge inside the developer section.
- Exact first-pass performance budgets after the current Godot POC is profiled.
- Whether approved generated products are committed or always rebuilt in CI for each milestone.
- Final culture identity of the Forest Hamlet and how strongly it differs from the starter player kit.
- Which roof system is the primary starter solution: worked timber, shingles, fired clay or a hybrid.
- Exact set of farm crops and plant stages required by the first village slice.
- Whether the first automation processor is a miner, crusher or another bounded extraction device.
- Which item tiers are visible in the first public-facing slice.
- How much environmental weathering is automatic versus authored as explicit variants.
- When public mod/content-pack creation becomes available and which override fields remain restricted.
- How the later NPC and Creature Forge reuses palettes, materials, animation concepts and override infrastructure.
- Whether a dedicated visual-art bible is created after the golden set is approved, or whether 21G remains the active style source.

# Appendix A. Asset Migration Record Template

| Field | Entry |
| --- | --- |
| Gameplay ID |  |
| Presentation ID |  |
| Display Name |  |
| Family |  |
| Kit Membership |  |
| Current Source |  |
| Classification |  |
| Priority |  |
| Target Forge Mode |  |
| Required Representations |  |
| Required States |  |
| Contract Impact |  |
| Dependencies |  |
| Owner |  |
| Status |  |
| Review Scenes |  |
| Fallback |  |
| Review Notes |  |
| Approval Date/Milestone |  |
| Legacy Deprecation State |  |

# Appendix B. Initial Priority Asset Backlog

## B.1 Critical Terrain and Materials

- Grass top.
- Dirt.
- Grass side.
- Common stone.
- Cobblestone/broken stone.
- Sand.
- Gravel.
- Clay.
- Water.
- Oak log side and end.
- Oak leaves.
- Oak planks.
- Common stone brick/cut stone.
- Roof material.
- Glass.
- Copper.
- Iron.
- Coal/charcoal.
- Mana crystal.

## B.2 Critical Construction Shapes

- Timber slab and stair.
- Timber beam and post.
- Timber wall/fence/railing.
- Timber roof slopes and corners.
- Door and trapdoor.
- Window frame, glass and shutters.
- Stone slab and stair.
- Stone wall and pillar.
- Stone arch/lintel or trim.
- Rubble and damaged stone.
- Foundation transition pieces.

## B.3 Critical Functional and Automation Assets

- Workbench.
- Furnace.
- Anvil.
- Chest.
- Crate.
- Barrel.
- Village warehouse interface.
- Wooden chute straight/slope/corner as required.
- Hand crank.
- Copper gear/mechanism.
- First processor or extraction machine.
- Rune table.
- Mana furnace.
- Mana conduit.
- Ward lantern/stone.

## B.4 Critical Items

- Starter pickaxe/axe.
- Iron pickaxe/axe.
- Basic sword.
- Hammer.
- Wrench.
- Torch/lantern.
- Raw ore and ingots.
- Coal/charcoal.
- Mana crystal/shard/dust.
- Basic rune.
- Village delivery bundle/crate.

## B.5 Critical Village and Structure Props

- Bed.
- Table.
- Chair/stool.
- Shelves.
- Lantern.
- Request board/sign.
- Tool rack.
- Fireplace/hearth.
- Farm basket/trough.
- Blacksmith props.
- Mage books/crystal stands.
- Guard rack.
- Goblin camp fire, banner, stolen crate and trap.
- Rune ruin glyph and debris set.

# Appendix C. Construction Kit Readiness Checklist

- [ ] Building purpose and culture are defined.
- [ ] Foundation material approved.
- [ ] Primary wall material approved.
- [ ] Floor material approved.
- [ ] Beams/posts approved.
- [ ] Stairs/slabs approved.
- [ ] Roof slopes, corners and ridge solution approved.
- [ ] Door solution approved.
- [ ] Window/glass/shutter solution approved.
- [ ] Trim, arch or lintel solution approved.
- [ ] Fence, railing or balcony solution approved where required.
- [ ] Primary functional block approved.
- [ ] Core storage approved.
- [ ] Lighting approved in day and night.
- [ ] Required furniture and work props approved.
- [ ] Damage, repair or burnt states approved where required.
- [ ] Collision and NPC navigation tested.
- [ ] Blueprint stable IDs validated.
- [ ] Resource/project recipe references unchanged or migrated.
- [ ] Full building reviewed from exterior and interior.
- [ ] Repetition and performance reviewed.

# Appendix D. Visual Review Scorecard

Score each applicable area from 0 to 3:

| Score | Meaning |
| --- | --- |
| 0 | Missing or unacceptable. |
| 1 | Functional but visibly below target. |
| 2 | Meets POC candidate standard with minor polish possible. |
| 3 | Meets production standard and supports reuse. |

| Review Area | Score | Blocking Notes |
| --- | --- | --- |
| Silhouette and recognition |  |  |
| Scale and proportion |  |  |
| Palette and value hierarchy |  |  |
| Material identity |  |  |
| Pixel density and detail restraint |  |  |
| Tiling/repetition |  |  |
| Connection and shape family consistency |  |  |
| State readability |  |  |
| Animation/effect restraint |  |  |
| Collision/contract |  |  |
| Day/night/environment fit |  |  |
| Inventory/held presentation |  |  |
| Performance and LOD |  |  |
| Registry/migration safety |  |  |
| Kit usefulness |  |  |

A numeric score supports review but does not override a blocking contract, save, accessibility or performance defect.

# Appendix E. Batch Release Checklist

- [ ] Batch outcome and dependencies are defined.
- [ ] All assets have migration records.
- [ ] Canonical Forge source is saved.
- [ ] Validation passes without unresolved blocking errors.
- [ ] Deterministic bake completes.
- [ ] Registry and override mapping resolves.
- [ ] Comparison with legacy presentation is captured.
- [ ] Required day/night and context scenes pass.
- [ ] Tiling and repetition pass.
- [ ] Collision, footprint, ports and sockets pass.
- [ ] Required states and animation pass.
- [ ] Icons and item representations pass where applicable.
- [ ] Structure blueprints pass where referenced.
- [ ] Existing save copies load and resolve.
- [ ] Performance sample passes.
- [ ] Fallback remains available.
- [ ] Review notes are resolved or explicitly accepted.
- [ ] Migration report and rollback point are recorded.

# Appendix F. Legacy Removal Checklist

- [ ] Replacement is Approved and Verified In World.
- [ ] Legacy asset is marked Deprecated.
- [ ] No active registry entry resolves directly to the legacy path.
- [ ] No current structure blueprint references the legacy path.
- [ ] No recipe, item, icon or preview depends on it unexpectedly.
- [ ] Existing representative saves load without it in a test branch.
- [ ] Aliases or migrations cover old IDs where needed.
- [ ] Rollback package or version-control point exists.
- [ ] The required fallback window has passed.
- [ ] Final dependency scan is clean.
- [ ] Removal is recorded in the migration report.

# Appendix G. Explicit Deferrals

The following are outside the first 21G overhaul unless a POC dependency proves otherwise:

- Full NPC body and clothing creator.
- Full creature and monster modeller.
- Boss and titan visual production.
- Complete culture libraries for every race.
- Full dimensional terrain and structure families.
- Endgame automation, golems, portals and civilisation-scale machines.
- Every final weapon, armour set and cosmetic.
- Final particle and audio library for all systems.
- Marketplace packaging and public user-generated-content moderation.
- Networked collaborative Forge editing.
- Cinematic and skeletal animation tools.
- Final console-specific visual optimisation.

# Glossary

| Term | Meaning |
| --- | --- |
| Asset | One registry-linked visual object or representation. |
| Family | Related assets sharing material, function or shape language. |
| Kit | Cross-family set required to construct and dress a structure type. |
| Golden Asset | Approved example that practically locks a style rule. |
| Material DNA | Shared palette, pattern, surface and state behaviour for a material family. |
| Legacy Asset | Existing presentation retained during migration or fallback. |
| Migration Record | Registry-linked status and decision record for an asset. |
| Cosmetic Safe | Presentation change that preserves gameplay-facing contracts. |
| Contract Change | Change to collision, footprint, ports, sockets, pivots or other gameplay-facing presentation data. |
| POC Candidate | Representative visual quality suitable for the proof-of-concept slice. |
| Production Asset | Approved reusable asset with all required representations and tests. |
| Project Override | Non-destructive project-level replacement of base presentation fields. |
| Verified In World | Migrated asset has passed representative gameplay, save, structure and performance checks. |
| Deprecation | State where legacy content remains available but is no longer the active presentation. |
| Forest Hamlet Slice | First bounded visual target proving terrain, buildings, automation, magic and threat dressing together. |
