# Fantasy Voxel Civilisation Sandbox
## 21G - Voxel Asset Forge - Visual Overhaul and Cross-Forge Asset Migration Integration Plan
**Version 0.2 - Revised Detailed Design Bible and Production Integration Draft**

A structured production and integration plan for replacing Leyforge's prototype asset visuals with a coherent stylised fantasy-voxel library while coordinating the specialist entity, semantic-blueprint, audio, voxel-VFX and presentation migrations now owned by Document Sets 22 and 23.

## Visual Overhaul and Cross-Forge Migration Plan Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Asset Forge visual audit, style lock, inventory, migration order, production batches, structure-kit readiness, specialist handoffs, integrated release gates, fallback rules and completion criteria for replacing prototype asset presentation across the current game. |
| Core Goal | Make terrain, materials, buildings, machines, items, props and magical infrastructure visually coherent and production-ready while ensuring their Entity Forge, Blueprint Forge and Presentation Forge dependencies are planned, linked and validated rather than left as disconnected later work. |
| Asset Forge Authority | Document 21G remains the production and migration authority for terrain and surface families, construction blocks and generated shapes, unique block and item models, props, furniture, functional stations, machines, logistics, power assets, material source, magic-infrastructure bodies and shared visual kits. |
| Entity and Blueprint Authority | Document 22L is the specialist production and migration authority for player/NPC/creature bodies, body plans, rigs, locomotion, equipment fitting, entity gameplay markers and complete semantic Blueprint Forge migration. Document 21G supplies compatible asset families and structure-kit source but does not duplicate 22L workflows. |
| Presentation Authority | Document 23J is the specialist production and migration authority for Presentation Profiles, Event Contracts, Context Packets, spatial presentation references, voxel VFX, audio, lights, persistent surface feedback, material responses, accessibility equivalents, budgets and presentation-library release records. |
| Forge Direction | Asset Forge, Entity Forge, Blueprint Forge and Presentation Forge are specialist branches of one Unified Forge. They reuse stable IDs, project manifests, source/runtime separation, inheritance, validation, review, bake, package and migration services without collapsing specialist ownership into one document. |
| Migration Philosophy | Replace presentation non-destructively. Preserve stable gameplay identities and declared contracts wherever gameplay meaning is unchanged. Every cross-Forge dependency is linked through explicit records, versions, fallbacks and release batches before legacy source is retired. |
| Production Priority | Finish reusable material and building-kit foundations first, coordinate the matching entity/blueprint/presentation foundations, then complete Forest Hamlet buildings, functional stations, automation, magic infrastructure, equipment and remaining representations through integrated batches. |
| Building Direction | A building is not integration-ready because its visible shell is attractive. Asset-kit readiness under 21G, semantic-blueprint readiness under 22L and required presentation readiness under 23J must all pass before a complete building batch is released. |
| Variant Direction | Create a strong base asset first, then add only justified material, culture, biome, condition, magic and quality variants. Entity, blueprint and presentation variants inherit from specialist families rather than duplicating the complete asset. |
| Motion Direction | Asset Forge may author named rigid parts, pivots, material-motion parameters and voxel-frame source required by an asset. Entity animation and rig motion are owned by Set 22. Effects, lights, audio and sensory feedback are authored and migrated through Set 23. |
| Compatibility Direction | Cosmetic replacements must not silently change gameplay footprint, collision, automation ports, interaction anchors, blueprint semantics, entity attachments, event contracts or stable spatial references. Any affected contract requires the owning specialist review and an explicit migration. |
| Quality Direction | Every approved Asset Forge source must pass silhouette, palette, tiling, scale, state readability, collision, placement, performance and in-world checks. Integrated release additionally requires the applicable 22L and 23J specialist gates. |
| Legacy Direction | Placeholder and legacy assets remain available as fallbacks until their replacement and all required specialist dependencies are approved in representative worlds, saves, structures and packaged scenarios. |
| Data Direction | Track every asset through a registry-linked migration record with owner, source ID, presentation ID, specialist authority, linked entity and blueprint records, Presentation Profile and Event Contract references, contract versions, status, dependencies, review history, release batch and fallback. |
| First Integrated Slice | The first complete cross-Forge slice is the Forest Hamlet valley: terrain, construction families, village buildings, residents, equipment, watchtower, warehouse, furnace and chute chain, mana infrastructure, rune ruin, goblin camp, required semantic blueprints and coherent audio/VFX/accessibility presentation. |
| Scope Boundary | 21G coordinates combined batches and release evidence, but the canonical entity and blueprint migration source remains in 22L and the canonical presentation production and migration source remains in 23J. Coordination never authorises duplicate specialist registries or parallel source-of-truth systems. |
| Success Direction | The overhaul succeeds when approved asset families can be reused across buildings and systems, specialist dependencies resolve through stable contracts, integrated scenarios pass without major placeholders and legacy content can be retired without registry, save, blueprint, entity or presentation breakage. |

## Document Purpose

This document is the Asset Forge production bridge between Leyforge's Forge architecture and the actual game world. Documents 21A through 21F define the Voxel Asset Forge foundation. Document 21G defines how that foundation is used to replace terrain, materials, blocks, items, props, machines and magical infrastructure in a controlled production order.

Version 0.1 was written before the complete Entity/Blueprint Forge and Presentation Forge document sets existed. It correctly anticipated their need through creature boundaries, sockets, state contracts, effects and blueprint regression, but it could not yet assign complete ownership or define their production handoffs. Version 0.2 preserves the original Asset Forge plan while integrating the now-approved specialist authorities:

- **22L - Entity and Blueprint Visual Production and Migration Plan** owns entity-scale visual production and complete semantic-blueprint migration.
- **23J - Presentation Forge Asset Libraries, Registries, Production Pipeline, Testing and Migration** owns audio, voxel VFX, light, surface-presentation and sensory-library production and migration.
- **21G** owns Asset Forge visual production and coordinates the combined implementation sequence, dependency manifests and integrated Forest Hamlet release gates.

The overhaul remains more than a texture pass. Leyforge contains terrain blocks, construction shapes, unique logistics blocks, crafting stations, machines, magical infrastructure, inventory items, held tools, props, structure kits, biome variants, damaged states and runtime presentations. Set 22 adds persistent entity appearances, rigs, equipment fits and semantic structure source. Set 23 adds the complete sensory communication layer. If these are migrated independently without shared records, the project will accumulate incompatible anchors, event names, blueprint markers, materials, palettes, effects, fallbacks and release states.

The immediate production need remains to finish buildings. A visually complete building family needs terrain contact materials, foundations, walls, floors, beams, posts, slabs, stairs, roofs, doors, windows, trims, lights, furniture and functional objects. A simulation-complete building also needs semantic rooms, access, jobs, storage, utilities, construction stages, damage and world-placement rules from Blueprint Forge. A presentation-complete building needs validated event bindings, spatial references, sound, voxel VFX, lights, material response, accessibility equivalents and budget behaviour from Presentation Forge.

This document therefore treats each production batch as a coordinated package. Asset Forge source can progress before every specialist dependency is complete, but the batch may not be called fully migrated or release-ready until the declared specialist gates pass. This protects gameplay, saves and production ownership while allowing the different Forge branches to work in parallel.

## Current Engine and Source-of-Truth Note

> **Current Project Direction**  
> Leyforge is being built in Godot with Summer Engine. The current Godot/Summer technical plans and Documents 21A-21G, 22A-22L and 23A-23J are the active Forge sources of truth. Older Unreal-specific implementation wording is historical only. Canonical editable source must remain reviewable project data, generated runtime products must remain rebuildable and the shipped game must not depend on an external Summer Engine or AI service.

## Version 0.2 Controlled Amendment Summary

Version 0.2 is a controlled integration amendment rather than a replacement of the Asset Forge production philosophy. It makes the following governing changes:

1. Retains 21G authority over Asset Forge visual families and base structure-kit readiness.
2. Replaces the former open-ended creature boundary with a formal production handoff to 22L.
3. Replaces the shallow blueprint-migration checklist with a structure-kit handoff into the complete 22L semantic-blueprint workflow.
4. Replaces the standalone effect/audio migration section with a formal Presentation Forge handoff to 23J.
5. Adds cross-Forge source-of-truth, record-linking, dependency, release, rollback and legacy-removal rules.
6. Converts the original linear roadmap into coordinated Asset, Entity/Blueprint and Presentation workstreams.
7. Expands Definition of Done so specialist placeholders cannot be hidden behind an otherwise approved asset or building shell.

## Design Sources

| Source | Relevant Direction | How 21G v0.2 Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Stylised, readable, atmospheric fantasy voxel presentation and connected living-world systems. | Locks the visual target and requires integrated world-facing results rather than isolated asset previews. |
| 03 - Blocks Registry | One-metre blocks, construction shapes, states, material families, automation and magic blocks. | Creates Asset Forge migration categories, kit-completeness rules and stable block mapping. |
| 04 - Items Registry | Items, block forms, tools, resources, gear, components and multiple representations remain linked but distinct. | Defines item model, held, dropped, icon and equipment-source requirements. |
| 06 - Resource Progression | Material families retain distinct long-term identity. | Requires recognisable Material DNA and tier-readable resources across all Forge branches. |
| 07 - NPC Village System | Buildings, warehouses, projects, workers, repairs and visible settlement growth are central. | Prioritises village kits, entity roles, semantic structures and presentation scenarios. |
| 08 - Automation System | Machines, logistics, power, item flow and village supply must be physically readable. | Prioritises unique shapes, connection contracts, state source and presentation handoffs. |
| 09 - Magic System | Mana, runes, wards, conduits and magical stations are practical infrastructure. | Requires coherent magical asset families and specialist event/presentation coverage. |
| 11 - Biomes and World Generation | Biomes use readable palettes, deterministic variation and relational structures. | Defines terrain-family migration, blueprint placement regression and presentation environment contexts. |
| 12 - Structures | Structures are dynamic, repairable, culture-aware blueprints with ownership and persistent states. | Separates Asset Forge kit readiness from 22L semantic-blueprint migration and integrated structure approval. |
| 17 - UI/UX System | Presentation must remain inspectable, readable and accessible. | Extends review to icons, state cues, captions, non-colour equivalents and player-facing clarity. |
| 18 - Current Godot Technical Plan | Stable registries, deterministic data, save compatibility, performance budgets and bounded tooling. | Controls migration safety, source/runtime separation and release gating. |
| 21A-21F - Voxel Asset Forge Series | Asset authoring, material source, animation-state foundations, overrides, UI and implementation. | Supplies the canonical Asset Forge workflow and technical rules used by 21G. |
| 22A-22K - Entity and Blueprint Forge Series | Entity bodies, rigs, animation, gameplay markers, semantic blueprints, Unified Forge UI and Godot implementation. | Defines specialist contracts that 21G assets must satisfy and hand off to. |
| 22L - Entity and Blueprint Visual Production and Migration Plan | Full entity and semantic-blueprint production order, records, migration, QA and release gates. | Becomes the authoritative entity and blueprint migration plan linked by 21G batches. |
| 23A-23I - Presentation Forge Series | Shared presentation profiles, spatial references, events/context, VFX, audio, acoustics, UI and implementation. | Defines the sensory contracts and source/runtime systems required by migrated assets. |
| 23J - Presentation Forge Asset Libraries, Registries, Production Pipeline, Testing and Migration | Production libraries, lifecycle, provenance, testing, migration, packaging and release acceptance. | Becomes the authoritative presentation production and migration plan linked by 21G batches. |

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
- 25. Structure Kits, Blueprint Forge Handoff and Building Completion
- 26. Culture, Faction, Biome and Settlement Variants
- 27. Runtime States, Damage, Weather, Heat and Corruption
- 28. Animation, Presentation and Sensory Migration Handoff
- 29. Icons, Thumbnails, Codex Images and UI Presentation
- 30. Collision, Footprints, Pivots, Semantic Spatial References and Contract Review
- 31. Performance, Atlases, LOD and Repetition Budgets
- 32. Legacy Assets, Fallback, Deprecation and Removal
- 33. Forest Hamlet Integrated Slice and Priority Register
- 34. Building Completion Production Plan
- 35. Review, Feedback, Revision and Sign-Off
- 36. Integrated In-World QA and Regression Testing
- 37. Version Control, Change Logs and Migration Reporting
- 38. Risks, Redesign Triggers and Contingencies
- 39. Coordinated Cross-Forge Overhaul Roadmap
- 40. Definition of Done and Acceptance Matrix
- 41. Continuous Content Production After the Overhaul
- 42. Open Decisions for Later Planning
- 43. Cross-Forge Source-of-Truth, Handoff and Release Governance
- Appendix A. Asset Migration and Integration Record Template
- Appendix B. Initial Priority Asset Backlog
- Appendix C. Construction Kit and Cross-Forge Readiness Checklist
- Appendix D. Visual Review Scorecard
- Appendix E. Integrated Batch Release Checklist
- Appendix F. Legacy Removal Checklist
- Appendix G. Explicit Deferrals and Specialist Ownership Boundaries
- Appendix H. Source-of-Truth and Handoff Matrix
- Appendix I. Cross-Forge Batch Manifest Template
- Glossary

# 1. Locked Visual Overhaul Identity

The visual overhaul is a controlled replacement of Leyforge's prototype Asset Forge presentation source and a coordination layer for related specialist migration. It is not a separate art experiment, a one-time texture swap or permission for 21G to absorb the Entity, Blueprint or Presentation Forge registries.

## 1.1 Core Production Promise

> **Production Promise**  
> Once an Asset Forge family or structure kit is approved, the team can reuse it with confidence that its scale, palette, shapes, states, collision and registry mapping are solved. Once the linked 22L and 23J gates also pass, the complete entity, semantic-blueprint and sensory result can be released without hidden placeholder dependencies or duplicate sources of truth.

## 1.2 Overhaul Pillars

| Pillar | Meaning |
| --- | --- |
| Asset Foundations | Terrain, Material DNA, construction families, items, props, machines and magic infrastructure are produced as reusable systems rather than isolated art. |
| Specialist Ownership | Entity and semantic-blueprint migration remains under 22L; presentation-library migration remains under 23J. |
| Stable Contracts | Gameplay IDs, blueprint semantics, entity attachments, event contracts and spatial references remain stable or migrate explicitly. |
| Parallel Production | Specialist workstreams may advance in parallel through declared readiness handoffs rather than waiting for one completely linear pipeline. |
| Integrated Evidence | Final approval uses representative worlds, saves and scenarios that prove all declared specialist dependencies together. |
| Reversible Migration | Legacy source, aliases, wrappers and known-good packages remain available until integrated release and rollback gates pass. |

## 1.3 What the Overhaul Is Not

- It is not a duplicate Entity Forge or Blueprint Forge production plan.
- It is not an Audio Forge or VFX Forge production library.
- It is not a permission to move gameplay truth into visual or presentation assets.
- It is not a requirement that every specialist asset be finished before Asset Forge source work begins.
- It is not approval to call an integrated building or feature complete while declared entity, blueprint or presentation dependencies remain placeholders.
- It is not a mass deletion of legacy source at the start of production.
- It is not a final-game content catalogue for every culture, biome, dimension, entity or effect.

# 2. Player Decision and Direction Summary

| Area | Locked Decision |
| --- | --- |
| Main Need | Finish the visual foundations so the team can complete buildings and connected gameplay scenarios confidently. |
| Asset Forge Role | 21G owns terrain, materials, construction families, items, props, machines, magic-infrastructure bodies and shared visual-kit production. |
| Entity Role | Entity bodies, rigs, locomotion, equipment fitting, entity variants and entity gameplay-marker migration are owned by 22L. |
| Blueprint Role | Complete semantic building, structure and world-blueprint production and migration are owned by 22L. 21G supplies approved physical asset families and kit-readiness evidence. |
| Presentation Role | Audio, voxel VFX, lights, surface presentation, Presentation Profiles, Event Contracts, spatial presentation definitions, accessibility and sensory migration are owned by 23J. |
| Creator Role | Developer Forge workspaces may override existing source non-destructively within their declared authority and contract rules. |
| Unique Blocks | Asset Forge Voxel Model Mode includes chutes, pipes, directional components, workstations and machine bodies. |
| Complex Machines | Compound Asset Mode is used for named rigid parts, pivots and source attachment declarations; presentation output is resolved through Set 23. |
| Animation | Use efficient readable source motion. Asset rigid motion remains under 21G/21C, entity rig animation under Set 22 and sensory output under Set 23. |
| Surface Resolution | Standard blocks use 32 x 32 face surfaces unless an explicitly approved profile differs. |
| Runtime Geometry | Editor microvoxels bake into efficient runtime products; they are not individual runtime nodes. |
| Stable Identity | Keep gameplay definitions and stable IDs unless the object is intentionally redesigned as new gameplay content. |
| Migration Order | Shared contracts and Material DNA first; Asset, Entity/Blueprint and Presentation foundations then progress in coordinated workstreams. |
| First Slice | Forest Hamlet valley, buildings, residents, watchtower loop, furnace/chute chain, iron equipment, mana infrastructure, rune ruin, goblin camp and complete sensory presentation. |
| Review | In-world context, day/night, weather, state, accessibility, save, packaged-build and performance checks are mandatory at the applicable specialist gates. |
| Fallback | Legacy presentation remains available until integrated replacement approval and regression completion. |
| Completion Rule | Specialist asset approval and integrated feature approval are distinct. A strong block model does not automatically approve its blueprint semantics, entity interactions or sensory presentation. |

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

## 3.3 Explicit Non-Goals for Version 0.2

- Final art and presentation for every dimension and culture.
- Reproducing or replacing the detailed entity, rig, animation and blueprint production workflows owned by 22L.
- Reproducing or replacing the VFX, audio, spatial, accessibility and presentation-library workflows owned by 23J.
- Full dialogue, voice, music, cinematics or haptic-production suites.
- Full marketplace-ready mod packs.
- Final platform-specific optimisation beyond the current target and declared test tiers.
- Rebuilding gameplay logic during the visual migration.
- Replacing every UI screen; only asset-facing icons, thumbnails and presentation required by the current slice are included.
- Perfect final balancing of every emissive, particle, acoustic or mix value before the representative integrated scene is playable.
- Treating specialist handoffs as permission to postpone required integration indefinitely.

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

## 4.4 Cross-Forge Source-of-Truth Rule

| Domain | Canonical Authority | 21G Relationship |
| --- | --- | --- |
| Gameplay function and state truth | Owning gameplay registries and systems | Must preserve or explicitly migrate their contracts. |
| Asset geometry, surfaces, Material DNA, item/block/machine source | 21A-21G | Direct production authority. |
| Entity bodies, rigs, animation families, equipment fits and entity markers | 22A-22L | Supplies compatible materials/items and links the specialist records. |
| Semantic building, structure and world-blueprint source | 22I-22L | Supplies physical kits and verifies that asset families satisfy blueprint needs. |
| Presentation events, profiles, spatial references, VFX, audio, lights, surfaces and accessibility | 23A-23J | Declares source states and attachment needs, then links 23J production records. |
| Godot runtime implementation | 21F, 22K and 23I within the wider technical plan | Uses shared manifests and adapters; no specialist module creates a parallel stable-ID system. |

> **Conflict Rule**  
> When two documents appear to own the same production field, the most specific specialist source owns that field. 21G coordinates the integrated outcome but does not edit canonical 22L or 23J records through an undocumented duplicate.

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

## 6.2 Required Migration and Integration Record Fields

| Field | Purpose |
| --- | --- |
| Gameplay ID | Stable block, item, machine or structure-facing identity. |
| Asset Presentation ID | Stable Asset Forge presentation identity. |
| Display Name | Human-readable production name. |
| Asset Family | Material or functional family. |
| Kit Membership | Buildings, structures or gameplay kits that depend on it. |
| Current Source | Legacy file, scene or presentation reference. |
| Current Classification | Retain, Polish, Rebuild, Split, Merge, Defer or Remove Later. |
| Target Asset Forge Mode | Surface, Voxel, Compound or hybrid. |
| Required Representations | Placed, inventory, held, dropped, icon, preview or structure use. |
| Required Asset States | Active, damaged, wet, powered, heated, corrupted and other source states. |
| Contract Impact | None, cosmetic-safe, specialist revalidation, cross-Forge contract change or gameplay redesign. |
| Asset Dependencies | Materials, palettes, parts, shaders and other Asset Forge source. |
| Linked Entity Records | Entity templates, equipment fits, body markers or 22L migration records affected by the asset. |
| Linked Blueprint Records | Structure kits, semantic blueprints, project records or 22L migration records affected by the asset. |
| Linked Presentation Profiles | 23J profile IDs that communicate the asset's events and states. |
| Event Contracts and State Fields | Validated events/state channels consumed by Presentation Forge. |
| Semantic Spatial References | Anchors, sockets, regions, paths, masks, zones or portals required by the asset. |
| Material Response IDs | Presentation material profiles or response families linked to Material DNA. |
| Contract/Schema Versions | Version baseline used for the handoff and migration. |
| Specialist Authority | 21G, 22L, 23J or owning gameplay system for each linked deliverable. |
| Specialist Status | Not Required, Planned, In Production, Candidate, Approved, Migrated, Verified or Blocked. |
| Integrated Release Batch | Batch or milestone that joins the specialist records. |
| Priority | Critical, High, Medium, Low or Deferred. |
| Asset Status | 21G lifecycle state. |
| Owner | Responsible Asset Forge creator or reviewer. |
| Specialist Owners | Named Entity/Blueprint and Presentation owners where required. |
| Review Scenarios | Contexts required for local and integrated approval. |
| Fallbacks | Legacy asset and specialist fallback profiles or mappings. |
| Rollback Reference | Known-good package, commit or migration reversal. |
| Notes and Decisions | Reasoning, exceptions and accepted limitations. |

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

## 7.3 Approval Is Representation- and Authority-Specific

An Asset Forge source may be approved as a placed block but still need revision as an inventory icon, held item or repeated structure component. It may also be locally approved while its linked semantic blueprint or Presentation Profile remains incomplete.

Migration records therefore track at least three independent readiness groups where applicable:

- **Asset readiness:** geometry, surface, states, collision and local representations under 21G.
- **Entity/Blueprint readiness:** body fit, entity markers, semantic blueprint, construction/state deltas and world placement under 22L.
- **Presentation readiness:** event bindings, spatial references, sound, voxel VFX, lights, surfaces, accessibility and budgets under 23J.

Only the integrated batch gate may declare the combined feature release-ready.

# 8. Priority, Dependency and Batch Planning

## 8.1 Priority Levels

| Priority | Definition | Example |
| --- | --- | --- |
| Critical | Blocks current building completion or the core POC loop. | Oak roof kit, stone foundations, furnace, chute. |
| High | Needed to make the slice coherent or readable. | Doors, windows, village props, mana conduit. |
| Medium | Adds breadth, polish or a secondary building. | Extra furniture, alternate stone trim. |
| Low | Valuable but not needed for current milestone. | Rare decorative variants. |
| Deferred | Explicitly outside this overhaul stage. | Final dimensional megastructure kit. |

## 8.2 Coordinated Dependency Order

```text
gameplay contracts, registries and current-state audit
    -> shared art direction, scale, Material DNA and stable semantic names
    -> Asset Forge golden materials and model foundations
    -> Entity/Blueprint golden templates and semantic contract baselines
    -> Presentation Event Contracts, spatial catalogues and foundation profiles
    -> construction kits, equipment source and functional asset families
    -> semantic blueprint migration, entity fitting and presentation authoring
    -> integrated Forest Hamlet scenario validation
    -> specialist release records and combined batch approval
    -> fallback window, dependency proof and legacy retirement
```

This is a dependency graph rather than a single-person conveyor belt. Asset, Entity/Blueprint and Presentation work may proceed in parallel once their required inputs are stable. A downstream branch must not guess a missing contract silently; it records a blocker or uses an approved fallback.

## 8.3 Batch Rules

A production batch should:

- Be small enough to review coherently.
- Contain its Asset Forge dependencies or reference approved ones.
- Declare whether Entity/Blueprint and Presentation work is required, optional or deferred.
- Reserve stable IDs and contract versions before specialist authoring begins.
- Have a named gameplay, building or scenario outcome.
- Include migration, save and regression tasks, not only authoring tasks.
- Avoid mixing unrelated style experiments.
- Produce separate specialist evidence plus one integrated result.
- End with a usable improvement in the game.

Recommended batch size is determined by complexity rather than a fixed asset count. A small integrated machine batch may be more work than dozens of simple surfaces.

## 8.4 Cross-Forge Handoff States

| Handoff State | Meaning |
| --- | --- |
| Not Required | The specialist domain is genuinely irrelevant to the batch. |
| Input Needed | The receiving specialist has identified missing source or contract information. |
| Ready for Specialist | Stable IDs, source revision, contracts and test scenarios are supplied. |
| Specialist In Progress | Canonical work is active under 22L or 23J. |
| Specialist Candidate | Local specialist checks pass; integrated review remains. |
| Integrated Candidate | All declared specialist candidates are joined in a representative scenario. |
| Integrated Verified | Save, package, accessibility and performance gates pass. |
| Blocked | A contract, source, rights, performance or gameplay issue prevents progression. |

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

# 25. Structure Kits, Blueprint Forge Handoff and Building Completion

## 25.1 Structure-Kit Model

An Asset Forge structure kit contains:

- Required material families.
- Required shape families.
- Doors, windows and roof solution.
- Functional blocks and physical machine bodies.
- Core props and lighting fixtures.
- Damage/repair source states.
- Culture or biome material rules.
- Declared semantic-marker and presentation attachment needs.
- Blueprint references and linked 22L migration records.
- Presentation references and linked 23J profiles.
- Validation scenes and handoff manifest.

The kit defines the approved physical and visual vocabulary. It does not replace the semantic blueprint that says how NPCs, construction, utilities, rooms and world generation understand the structure.

## 25.2 First Structure Kits

| Kit | Core Outcome | Critical Asset Dependencies | Specialist Dependencies |
| --- | --- | --- | --- |
| Forest Hamlet House | Finished residence with warm interior. | Timber, stone foundation, roof, door, window, bed, light. | 22L housing/access semantics; 23J doors, hearth, footsteps, ambience and shelter response. |
| Village Warehouse | Storage and automated delivery endpoint. | Timber/stone, crates/barrels, warehouse interface, signs. | 22L storage/routes/projects; 23J transfer, blocked/full and work-loop presentation. |
| Watchtower | Defence project and raid outcome. | Stone/timber, stairs, railings, roof, guard props, damage states. | 22L guard/navigation/damage blueprint; 23J warning, impacts, raid telegraphs and aftermath. |
| Blacksmith/Forge | Iron chain and specialist building. | Stone, timber, furnace, anvil, tools, heat fixtures. | 22L work markers and project stages; 23J heat, hammering, smoke, sparks and acoustics. |
| Farm Building | Food and village-life presentation. | Timber, fencing, crops, baskets, trough, storage. | 22L jobs/routes/animal markers; 23J foliage, tools, animals and ambience. |
| Mage Workspace | Mana/rune teaching and infrastructure. | Rune table, mana materials, lantern/conduit, books/props. | 22L work/utilities; 23J mana flow, rune activation, hum and accessibility cues. |
| Old Rune Ruin | Exploration and magic discovery. | Ancient stone, runes, damage, dormant/active source. | 22L world placement/state deltas; 23J environmental, activation and corruption presentation. |
| Goblin Camp | Visible raid source and threat identity. | Scrap timber, stolen crates, banners, fire, traps and dressing. | 22L camp blueprint/entities; 23J fire, ambience, telegraphs and raid-state presentation. |

## 25.3 Asset Forge Structure-Kit Handoff

Before 21G marks a kit **Ready for Blueprint Forge**, it supplies:

1. Stable asset and family IDs.
2. Approved source revisions and deterministic bake signatures.
3. Material-role mapping and permitted substitutions.
4. Shape, orientation, footprint and collision baselines.
5. Required source states and state-layer compatibility.
6. Named physical parts, pivots and gameplay interaction anchors owned by the asset.
7. Proposed semantic needs without inventing Blueprint Forge ownership.
8. Proposed presentation attachment needs without inventing Presentation Forge IDs.
9. Performance and repetition evidence.
10. Legacy mappings and rollback reference.

## 25.4 Authoritative Semantic Blueprint Migration

Complete blueprint migration is performed through 22L and includes, where applicable:

- editable voxel and modular source;
- semantic rooms, zones, jobs, storage, beds, guard points and access;
- NPC navigation and interaction markers;
- logistics, power, mana and utility networks;
- construction stages, project recipes and upgrade deltas;
- damage, occupation, corruption, repair and restoration states;
- terrain adaptation and world-generation placement;
- thumbnails, map products and capture records;
- save, village, project, raid and worldgen regression.

21G may detect and report missing semantic requirements but may not create a hidden alternate blueprint schema to bypass 22L.

## 25.5 Combined Building Readiness Gate

A building may be described at three levels:

| Level | Required Authority | Meaning |
| --- | --- | --- |
| Asset-Kit Ready | 21G | Physical visual family can build and dress the structure coherently. |
| Simulation Ready | 22L | Semantic blueprint, construction, navigation, utilities and persistent states pass. |
| Presentation Ready | 23J | Required events, spatial references, audio, VFX, lights, surfaces, accessibility and budgets pass. |
| Integrated Release Ready | Combined batch approval | All declared levels work together in representative game, save and packaged scenarios. |

A missing specialist layer must be shown as a declared placeholder or blocker. It cannot be hidden by calling the shell complete.

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

# 28. Animation, Presentation and Sensory Migration Handoff

## 28.1 Authority Boundaries

| Production Area | Authority | 21G Responsibility |
| --- | --- | --- |
| Rigid named-part motion, pivots, material-motion parameters and voxel-frame source on blocks/items/machines | 21C and 21G | Author asset-local source and expose stable state/part contracts. |
| Entity skeletons, rig clips, locomotion, combat animation and semantic animation events | 22E, 22F and 22L | Supply compatible equipment/assets and consume approved attachment/fit requirements. |
| Presentation Profiles, voxel VFX, particles, trails, lights, persistent surfaces, Sound Events, ambience and acoustics | 23A-23J, with production authority in 23J | Declare the gameplay state and attachment need, then link canonical 23J records. |

Asset source must never hard-code a sound file, particle scene or unmanaged callback merely to make a preview appear complete. Temporary adapters must be registered for migration and removed through the 23J process.

## 28.2 Asset-Local Motion Priority

Asset-local motion is prioritised where it communicates:

- processing;
- power transmission;
- flow direction;
- opening or interaction;
- heat or pressure;
- mana activity;
- damage or instability.

Static decorative assets do not need motion merely to appear polished.

## 28.3 First Integrated Presentation Set

The first Asset-to-Presentation handoff should cover:

- furnace ignition, work loop, smoke, heat and blocked/damaged states;
- furnace doors or hatches where used;
- rotating gear and hand-crank timing;
- chute or conveyor flow direction and blockage;
- mana conduit paths and pulse timing;
- rune-table activation;
- ward idle, warning and breach states;
- water, rain contact, shelter transition and restrained foliage motion;
- goblin camp fire, smoke, threat ambience and raid telegraphs;
- construction, placement, repair and damage feedback;
- material footsteps, mining, impacts and break responses for the foundation families.

Each result is authored as or linked to a 23J family/profile rather than duplicated per asset when context resolution can provide the variation.

## 28.4 Required Presentation Handoff Data

- owning gameplay event or readable state field;
- event contract and version;
- source/target material context;
- semantic spatial reference or required reference type;
- timing origin, lifecycle and stop/reconstruction rule;
- intensity and importance class;
- expected family/profile reuse;
- accessibility importance and required equivalents;
- quality/LOD/budget expectations;
- save, multiplayer or late-join reconstruction requirement;
- temporary legacy callback or source to migrate.

## 28.5 Accessibility

- Do not rely on colour alone for critical machine, magic or threat states.
- Avoid rapid uncontrolled flashing and preserve reduced-flash meaning.
- Provide reduced-motion behaviour that retains functional direction and severity.
- Important audio cues require captions, visual/directional or other approved equivalents.
- Critical information must survive low-quality and muted-audio conditions.
- Accessibility evidence is approved under 23J and linked to the integrated batch.

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

# 30. Collision, Footprints, Pivots, Semantic Spatial References and Contract Review

## 30.1 Contract Impact Classes

| Class | Meaning | Approval |
| --- | --- | --- |
| Cosmetic Safe | No gameplay-facing or specialist contract changes. | Normal 21G visual review. |
| Cosmetic With Revalidation | Intended contract is unchanged, but generated bounds, pivots or mappings require proof. | 21G technical review and affected specialist smoke test. |
| Cross-Forge Contract Change | Blueprint semantics, entity attachments, Event Contracts or stable spatial references change. | Owning 22L/23J specialist migration and integrated approval required. |
| Gameplay Contract Change | Collision, footprint, ports, interaction or function changes. | Owning gameplay-system approval plus specialist migration. |
| New Gameplay Asset | Presentation represents a new function or identity. | New gameplay registry entry and full system review. |

## 30.2 Required Contract Checks

- Placement footprint.
- Collision and selection bounds.
- Occlusion and face culling for block neighbours.
- Rotation and directional masks.
- Automation input/output ports.
- Power and mana sockets owned by gameplay systems.
- NPC work and interaction anchors.
- Held grip, equipment fit and item pivot links to 22L where applicable.
- Structure blueprint occupancy and semantic-marker compatibility.
- Presentation anchors, sockets, regions, paths, masks, zones and portals linked to Set 23.
- Event Contract and state-field availability.
- Mirroring, variant remapping and fallback mappings.
- Save and LOD reconstruction of persistent states.

## 30.3 Semantic Spatial Reference Rule

A physical point may move when an asset is rebuilt, but its stable semantic meaning should remain when possible. Examples include `chimney_opening`, `blade_contact_edge`, `mana_flow_path`, `door_portal` and `work_surface`.

Asset Forge may author or expose the physical geometry required to resolve the reference. Entity/Blueprint Forge owns body and structure semantics. Presentation Forge owns presentation attachment definitions, remapping and fallback. Raw scene paths or fragile pixel coordinates must not become undeclared long-term contracts.

## 30.4 Collision Principle

Collision follows gameplay need, not every microvoxel contour. A detailed furnace can use a simplified solid body and interaction volumes. A chute needs collision that does not falsely block visible flow or player movement. Presentation geometry and effects do not silently alter collision or authoritative interaction.

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

# 33. Forest Hamlet Integrated Slice and Priority Register

The Forest Hamlet is the first cross-Forge proof because it combines terrain, buildings, residents, equipment, workspaces, automation, magic, damage, weather and a raid outcome in one bounded area.

## 33.1 Integrated Critical Groups

| Group | 21G Asset Forge Deliverable | 22L Entity/Blueprint Deliverable | 23J Presentation Deliverable |
| --- | --- | --- | --- |
| Terrain and Weather Context | Grass, dirt, stone, water, paths and foundation materials. | Structure placement/terrain adaptation references. | Material responses, rain, roof contact, wetness, shelter and ambience. |
| Starter Timber | Logs, planks, beams, posts, shapes, openings and roof support. | House/warehouse/watchtower semantic blueprint use. | Footsteps, impacts, break, construction, door and creak families. |
| Common Stone | Natural, cobble, cut, shapes, rubble and furnace-compatible source. | Foundations, ruin, tower and damage/restoration semantics. | Footsteps, mining, impact, debris, room acoustics and weather response. |
| Village Buildings | Physical kits, props, fixtures and work blocks. | Rooms, beds, jobs, storage, routes, utilities, stages and persistent state. | Work loops, interiors, ambience, doors, hearths, warnings and accessibility. |
| Residents and Equipment | Tools, weapons, clothing/gear source materials and held-item models. | Humanoid bodies, rigs, job variants, fits, locomotion and persistent appearance. | Foot contacts, work sounds, voices/cues in scope, impacts and state profiles. |
| Automation | Chutes, crank, mechanisms, processor and storage interfaces. | Blueprint/network markers and worker interaction. | Active, blocked, damaged, flow, loops, aggregation and warning cues. |
| Magic | Mana resources, rune table, furnace, conduit and ward bodies. | Utility paths, work markers and structure state. | Mana flow, rune activation, ward boundary/warning/breach and hum families. |
| Threat and Raid | Goblin camp props, traps, banners and damage-ready assets. | Goblin entities, camp/watchtower blueprints and raid-state integration. | Camp ambience, attack telegraphs, impacts, warnings, critical equivalents and aftermath. |
| Rune Ruin | Ancient material family, glyph source and dormant/active geometry states. | World placement, access, state deltas and restoration semantics. | Environmental ambience, rune activation, corruption and discovery cues. |

## 33.2 Slice Acceptance

The slice is integration-ready when a player can move from wilderness to village, identify residents and workspaces, follow production, understand machine and mana states, experience the watchtower and raid sequence, and reload the world without encountering major unintended asset, entity, blueprint or presentation placeholders along the intended route.

Any deliberate placeholder must be listed in the batch manifest with owner, fallback, risk and removal milestone.

# 34. Building Completion Production Plan

## 34.1 Building Order

Recommended integrated order:

1. Test hut and material/presentation showcase.
2. Forest Hamlet house.
3. Warehouse.
4. Watchtower.
5. Blacksmith/forge.
6. Farm building.
7. Mage workspace.
8. Rune ruin.
9. Goblin camp.

This order grows the reusable asset kit, semantic blueprint library and presentation foundation while proving increasingly complex functional requirements.

## 34.2 Building Readiness Gate

Before a building enters final integrated construction, confirm:

### 21G Asset-Kit Gate

- Foundation, wall, floor and roof families approved.
- Door, window, trim and lighting fixtures approved.
- Primary functional block and core props available.
- Damage/repair asset states understood.
- Collision, footprint and repetition pass.

### 22L Simulation Gate

- Semantic blueprint source approved for the milestone.
- Rooms, access, routes, jobs, storage, utilities and interaction markers pass.
- Construction stages, project resources and state deltas pass.
- Terrain/worldgen and existing-save requirements pass where applicable.

### 23J Presentation Gate

- Required Event Contracts and spatial references resolve.
- Critical state profiles, sound, voxel VFX, light and surface feedback pass.
- Interior/exterior acoustics and ambience pass where in scope.
- Accessibility and budget evidence pass.

### Combined Gate

- The building works in day/night, weather, active/inactive, damage/repair and save/reload contexts required by its brief.
- No specialist source is duplicated or bypassed through direct scene references.
- Fallback and rollback paths are recorded.

## 34.3 No One-Off Rescue Assets

When a building exposes a missing piece, first determine whether it belongs to an Asset Forge family, a reusable Blueprint Forge module or a Presentation Forge family/profile. One-off rescue assets are allowed for genuinely unique features, not to bypass incomplete shared foundations.

# 35. Review, Feedback, Revision and Sign-Off

## 35.1 Review Roles

| Role | Main Responsibility |
| --- | --- |
| Asset Creator | Produces 21G source, self-checks and responds to feedback. |
| Visual Reviewer | Style, silhouette, Material DNA, palette and world context. |
| Asset/System Reviewer | Registry identity, collision, states, ports and gameplay-facing contracts. |
| Entity Reviewer | Body/equipment fit and entity marker compatibility under 22L. |
| Blueprint Reviewer | Semantic structure, construction, navigation and persistent-state compatibility under 22L. |
| Presentation Reviewer | Event, spatial, VFX, audio, surface, accessibility and budget compatibility under 23J. |
| Performance Reviewer | Repetition, meshes, materials, animation, effects, audio density and LOD. |
| QA/World Reviewer | Integrated scenarios, saves, packages, regressions and evidence. |
| Final Approver | Confirms milestone scope, specialist approvals and accepted limitations. |

One person may fill several roles in a small team, but each review question and authority remains explicit.

## 35.2 Feedback Format

Useful feedback includes:

- problem;
- evidence and context;
- owning authority;
- severity;
- required outcome;
- suggested direction when helpful;
- whether the issue blocks local or integrated approval.

Avoid vague notes such as "make it nicer" or cross-Forge feedback that edits another specialist's source without naming the contract problem.

## 35.3 Revision Control

Revisions should not erase the candidate under review. Compare canonical source and baked results, retain review notes and record why a major direction changed. A specialist revision that invalidates another branch must update the dependency graph and identify which evidence requires rerun.

# 36. Integrated In-World QA and Regression Testing

## 36.1 Required Review Scenes

- Neutral Asset Forge turntable or preview.
- Material wall and shape gallery.
- Terrain tiling field.
- Entity/equipment fit gallery where applicable.
- Semantic blueprint validation plot.
- Presentation Forge deterministic preview.
- Forest Hamlet daylight.
- Forest Hamlet night.
- Interior lighting and acoustic scene.
- Automation chain.
- Mana infrastructure scene.
- Damage/repair and construction scene.
- Inventory, held-item and equipment scene.
- Raid warning, combat and aftermath scene.
- Dense performance and accessibility stress scene.

## 36.2 Integrated Regression Matrix

| Test | 21G Asset Forge | 22L Entity/Blueprint | 23J Presentation | Combined Scenario |
| --- | --- | --- | --- | --- |
| Stable registry resolution | Required | Required where linked | Required where linked | Required |
| Existing save load | Required where placed/stored | Entity, structure and project records | Persistent/reconstructed state | Required |
| Rotation/placement | Required | Blueprint/world placement | Spatial remapping | Required |
| Collision/selection | Required | Navigation, hit/interaction regions | Presentation remains non-authoritative | Required |
| State contracts | Source states declared | Semantic/entity state exposed | Profiles and bindings resolve | Required |
| Day/night/weather | Asset readability | Blueprint/entity context | Light, sound, VFX, acoustics | Required |
| Construction/damage/repair | Asset states | Stage and state deltas | Event and persistent presentation | Required |
| Accessibility | Non-colour source readability | Semantic importance exposed | Equivalents and comfort variants | Required |
| Performance | Geometry/material repetition | Crowd/structure LOD | Pools, voices, aggregation, virtualisation | Stress pass |
| Multiplayer/late join | No divergent asset identity | Authoritative entity/blueprint state | Prediction/reconstruction where required | As milestone requires |
| Packaged build | Asset products load | Specialist products load | Audio/VFX/profile products load | Required |

## 36.3 Existing-World Copies

Never test destructive migration first on the only active development save. Use copied saves with known structures, residents, inventories, machines, projects, damage and persistent presentation states. Record the exact source revisions and migration manifests used for each result.

# 37. Version Control, Change Logs and Migration Reporting

## 37.1 Commit Boundaries

Prefer commits that contain one coherent source family or specialist change. Cross-Forge batches may use several linked commits rather than one mixed unreviewable dump. Each commit should identify:

- owning document and specialist branch;
- canonical source changed;
- generated products if policy stores them;
- stable IDs and contract versions affected;
- migration record updates;
- tests or evidence references;
- integration batch ID.

## 37.2 Integrated Migration Report

Each 21G batch report includes:

- scope and gameplay/building outcome;
- Asset Forge assets added, replaced, deferred and deprecated;
- stable IDs affected;
- gameplay or cross-Forge contract changes;
- linked 22L entity and blueprint migration records;
- linked 23J presentation migration and library records;
- specialist status and blockers;
- structures, saves and packages retested;
- accessibility and performance results;
- known issues and deliberate placeholders;
- rollback point and fallback window;
- next dependencies.

The report links specialist records rather than copying their complete canonical content into 21G.

## 37.3 Generated Data Policy

Generated output must remain reproducible from canonical source. If generated assets are committed for build convenience, CI or tooling should detect drift from the approved source. Generated Asset, Entity/Blueprint and Presentation products must identify compatible manifest and schema versions before a combined package is published.

# 38. Risks, Redesign Triggers and Contingencies

## 38.1 Risk Register

| Risk | Effect | Mitigation | Redesign Trigger |
| --- | --- | --- | --- |
| Style drift | Assets look unrelated. | Golden assets, family review and change control. | Approved kits require contradictory rules. |
| Endless polish | Buildings remain unfinished. | Quality tiers, bounded batches and milestone gates. | Critical batch expands repeatedly without a new gameplay outcome. |
| Variant explosion | Content and review become unmanageable. | Base-first, inheritance, compatibility tags and layer budgets. | A family cannot be tested combinatorially. |
| Registry breakage | Saves or blueprints fail. | Stable IDs, aliases, validation and copied-save tests. | Cosmetic swaps require frequent manual repair. |
| Contract drift | Collision, semantics, events or spatial references no longer match. | Versioned contracts and owning-specialist review. | Cross-Forge changes repeatedly bypass migration. |
| Duplicate authority | Two branches create conflicting canonical records. | Source-of-truth matrix and dependency graph. | The same semantic object resolves from more than one registry without declared override. |
| Hidden specialist placeholders | A building appears complete but lacks entity, blueprint or sensory production. | Three-level readiness and integrated gate. | Milestone reports call features complete while required specialist records are unresolved. |
| Cross-Forge schedule deadlock | One branch waits indefinitely for another. | Readiness handoffs, approved fallbacks and parallel planning. | More than one milestone is blocked by unspecified dependencies. |
| Presentation mismatch | Audio/VFX use wrong timing, material or attachment. | Event Contracts, Context Packets and semantic spatial references. | One-off callbacks become common. |
| Performance regression | Villages, factories or raids become expensive. | Shared stress scenes, LOD, aggregation and budgets. | Integrated slice misses agreed budgets after optimisation. |
| Tooling delay | Forge development blocks production. | Controlled minimal tools using canonical contracts. | Basic tasks remain slower than manual alternatives after MVP. |
| Incomplete kits | Every building needs one-off fixes. | Asset, blueprint and presentation family readiness checklists. | More than a small minority of pieces or cues are exceptions. |
| Legacy removal too early | Rollback and compatibility are lost. | Specialist dependency proof and fallback window. | Replacement causes unresolved world, entity, blueprint or presentation failures. |

## 38.2 Contingency Rules

- If a specialist UI is delayed, canonical source may be produced through a controlled minimal tool using the same schemas and IDs.
- If a complex asset misses performance targets, simplify runtime products without destroying rich canonical source.
- If a kit cannot support a building cleanly, revise the appropriate shared family before producing one-off patches.
- If a cosmetic replacement requires gameplay or cross-Forge contract changes, split it into a separately owned migration task.
- If one branch is not ready, an approved placeholder may remain only when it is declared in the batch manifest with fallback, owner and removal milestone.
- If final-quality work slows core proof, use declared POC Candidate quality for secondary content while keeping critical contracts and accessibility intact.
- If source-of-truth ownership is ambiguous, stop integration and resolve authority before authoring more dependent content.

# 39. Coordinated Cross-Forge Overhaul Roadmap

The roadmap uses parallel workstreams with shared exit gates. A stage may contain independent 21G, 22L and 23J deliverables, but it exits only when the declared integration evidence exists.

## Stage 0 - Shared Audit, Contracts and Style Lock

**21G:** registry-derived asset inventory, current-state captures, Material DNA and asset classification.  
**22L:** entity and blueprint inventory, template baselines and semantic-contract audit.  
**23J:** temporary presentation inventory, Event Contract/spatial audit and Golden Core plan.

**Exit gate:** ownership, stable IDs, contract versions, target style, fallbacks and first batch manifests are known.

## Stage 1 - Golden Materials, Templates and Presentation Core

**21G:** grass/dirt/stone/water, oak and common-stone golden assets, material wall and tiling scenes.  
**22L:** golden humanoid/entity and blueprint templates required by the slice.  
**23J:** Golden Core contact, furnace, mana, weather and critical-cue families plus foundation material responses.

**Exit gate:** the same materials and semantic names resolve consistently across asset, blueprint/entity and presentation previews.

## Stage 2 - Core Construction and Structure Foundations

**21G:** timber and stone construction families, roof/opening solution and first physical house kit.  
**22L:** house/warehouse blueprint modules, rooms, access, construction stages and terrain adaptation.  
**23J:** construction, doors, shelter, room acoustics, footsteps and material impact profiles.

**Exit gate:** one complete house can be built, occupied, presented and reloaded without core placeholders.

## Stage 3 - Living Village Buildings and Residents

**21G:** furniture, storage, lighting, work props, workbench, furnace, anvil and warehouse interface.  
**22L:** player/NPC humanoid foundation, Forest Hamlet roles, equipment fits and house/warehouse/forge blueprints.  
**23J:** resident movement/work feedback, village ambience, furnace and workspace profiles.

**Exit gate:** village buildings read as inhabited, functional and audibly/visually coherent.

## Stage 4 - Watchtower, Damage, Defence and Raid

**21G:** watchtower kit, guard props, damage, burnt and repair asset states.  
**22L:** watchtower construction, guard/goblin entities, camp blueprint and raid-relevant semantics.  
**23J:** warning hierarchy, telegraphs, impacts, ward/raid cues, critical accessibility and aftermath presentation.

**Exit gate:** watchtower construction, raid preparation, attack and aftermath pass integrated save and package scenarios.

## Stage 5 - Automation Chain

**21G:** wooden chute family, crank, mechanisms, processor, storage and state-ready machine bodies.  
**22L:** worker interaction and blueprint/network marker integration.  
**23J:** processing loops, flow, blocked/full, damage, aggregation and material response.

**Exit gate:** factory-to-warehouse supply is readable, bounded and reconstructs correctly after reload.

## Stage 6 - Magic Infrastructure and Rune Ruin

**21G:** mana resource family, rune table, mana furnace, conduit, ward and rune-ruin asset source.  
**22L:** mage workspace/rune-ruin semantic source, utility paths and persistent states.  
**23J:** mana-flow paths, rune activation, ward boundary/warning/breach, ambience and reduced-setting equivalents.

**Exit gate:** magic reads as practical infrastructure and exploration content across day/night and save/load.

## Stage 7 - Items, Equipment and Interaction Polish

**21G:** starter/iron tools, weapons, resources, components, icons and held/dropped source.  
**22L:** equipment fits, grips, attachment remapping and entity-use validation.  
**23J:** swing/release/contact, material impacts, inventory-use and critical equipment cues where required.

**Exit gate:** visible equipment, entity use and sensory feedback match world quality and contracts.

## Stage 8 - Full Forest Hamlet Integration and Legacy Deprecation

**All branches:** complete intended route, goblin camp, weather, accessibility, save, multiplayer scope, package and stress regressions; produce linked migration reports and deprecation map.

**Exit gate:** the integrated slice becomes the new baseline, all deliberate placeholders are tracked and legacy removal begins only for dependencies proven safe.

## Stage 9 - Continuous Pack Expansion

After the baseline, new biome, culture, faction, creature, automation, magic, dungeon and dimension packs reuse the same three-branch intake, handoff and release model.

# 40. Definition of Done and Acceptance Matrix

## 40.1 Asset Forge Acceptance

| Requirement | Surface Block | Unique Block | Compound Machine | Item | Structure Kit |
| --- | --- | --- | --- | --- | --- |
| Stable registry mapping | Required | Required | Required | Required | Required |
| Approved source and bake | Required | Required | Required | Required | All members required for kit scope |
| Style and Material DNA | Required | Required | Required | Required | Coherent set |
| Scale and silhouette | Required | Required | Required | Required | Full structure readability |
| Required variants/states | As briefed | As briefed | Required | As briefed | Damage/repair as briefed |
| Collision/contract | Block contract | Full review | Full review | Held/dropped | Physical kit and blueprint handoff |
| Context review | Tiling/terrain | Placement/repetition | Connected chain | Inventory/held | Day/night/interior |
| Performance | Repetition | Repetition | Asset-local motion/source | Dropped/icon | Full structure stress |
| Specialist links | As required | As required | Usually required | Equipment/presentation as required | 22L and 23J records required |
| Fallback | Required during migration | Required | Required | Required | Legacy source/blueprint/profile path |
| Documentation | Integration record | Integration record | Integration record | Integration record | Kit checklist and handoff manifest |

## 40.2 Integrated Batch Acceptance

| Area | Acceptance Requirement |
| --- | --- |
| Gameplay truth | Owning gameplay systems remain authoritative and validated. |
| Asset source | 21G source, states, contracts, products and fallbacks pass. |
| Entity/Blueprint | Required 22L records, semantic source, fits, markers and migration evidence pass. |
| Presentation | Required 23J profiles, events, spatial references, audio/VFX/surface products and migration evidence pass. |
| Accessibility | Critical equivalents and reduced-setting evidence pass. |
| Performance | Geometry, crowd/structure, VFX and audio budgets pass in integrated stress scenes. |
| Persistence | Save/load and LOD reconstruction preserve current state without replaying obsolete events. |
| Multiplayer | Authority, prediction/confirmation and late join pass where required by the milestone. |
| Packaging | Clean package loads compatible products and manifests from every specialist branch. |
| Migration | Supported old IDs, paths, schemas, saves and packs migrate or report clearly. |
| Evidence | Specialist reviews and integrated captures match released revisions. |
| Rollback | Previous known-good package and migration reversal remain available. |

## 40.3 Overhaul Acceptance

The 21G v0.2 overhaul stage is complete when:

- The Forest Hamlet route contains no major unintended Asset Forge placeholder families.
- House, warehouse, watchtower, blacksmith/forge, farm and mage workspace use approved physical kits.
- Required semantic blueprint and entity work is approved through linked 22L records.
- Required audio, voxel VFX, lights, surfaces, accessibility and sensory work is approved through linked 23J records.
- The first automation chain is readable in idle, active, blocked and damaged conditions.
- Mana discovery and ward infrastructure use coherent asset and presentation languages.
- Critical items have approved icon, held, dropped and equipment-fit forms where applicable.
- Existing representative saves, entities, structures, projects and persistent presentation states load correctly.
- Integrated performance remains within current project budgets.
- Every replaced source has migration, fallback, rollback and ownership records.
- The developer can reopen canonical Forge source in the owning specialist workspace and refine it without losing gameplay identity or creating parallel source truth.

# 41. Continuous Content Production After the Overhaul

The visual overhaul establishes the baseline; it does not end content production. Future assets and features enter the same specialist lifecycles and integrated release model.

## 41.1 New Asset Intake

Every new Asset Forge asset receives:

- registry identity or planned identity;
- family and kit membership;
- Asset Forge mode;
- Material DNA and scale profile;
- required representations and source states;
- gameplay and cross-Forge contract expectations;
- declared 22L and 23J dependencies;
- review scenarios;
- fallback and approval record.

If the asset changes an entity, semantic blueprint or sensory result, the corresponding specialist brief is created before integrated release planning.

## 41.2 Family Expansion

New culture, biome and dimensional families reuse the production system while creating intentional identity. They begin with a small golden set and a structure or gameplay outcome, plus linked Entity/Blueprint and Presentation packs where required, rather than an exhaustive uncontrolled variant matrix.

## 41.3 Periodic Cross-Forge Health Review

At milestones, review:

- incomplete Asset Forge families;
- unresolved 22L or 23J dependencies;
- unused or duplicated materials and semantic roles;
- direct file/scene references bypassing registries;
- legacy fallback still active;
- mismatched contract/schema versions;
- performance-heavy asset, effect or audio families;
- style or presentation drift;
- missing icons, fits, markers, profiles or state presentation;
- buildings that still require frequent one-off exceptions;
- assets claimed complete without integrated evidence.

# 42. Open Decisions for Later Planning

- Final name and branding of each specialist Forge workspace inside the developer section.
- Exact first-pass performance budgets after the current Godot build is profiled across integrated scenes.
- Whether approved generated products are committed or rebuilt in CI for each milestone.
- Final culture identity of the Forest Hamlet and how strongly it differs from the starter player kit.
- Primary starter roof system: worked timber, shingles, fired clay or hybrid.
- Exact farm crops, livestock and plant stages required by the first village slice.
- Whether the first automation processor is a miner, crusher or another bounded device.
- Which item and equipment tiers are visible in the first public-facing slice.
- How much environmental weathering is automatic versus authored state/variant source.
- When public mod/content-pack creation becomes available and which override fields remain restricted.
- Exact compatibility window for legacy Asset, Entity/Blueprint and Presentation aliases before removal.
- Which integrated scenarios become permanent release gates after the Forest Hamlet baseline.
- Whether a separate art-direction bible is created after golden families are approved, or 21G remains the active Asset Forge style source.
- Which future dialogue, music, cinematic and haptic modules attach to the Presentation Forge first.

# 43. Cross-Forge Source-of-Truth, Handoff and Release Governance

## 43.1 Governing Rule

> **No Duplicate Canonical Source**  
> 21G may coordinate, reference, validate and block integrated release, but it may not create substitute entity, blueprint or presentation records when 22L or 23J owns the canonical production field.

## 43.2 Handoff Sequence

```text
owning gameplay system declares truth and contract
    -> 21G produces or migrates compatible asset source
    -> 22L produces entity/semantic-blueprint source where required
    -> 23J produces sensory presentation source where required
    -> specialist packages publish compatible manifests
    -> integrated scenario joins products by stable IDs and versions
    -> combined release gate records evidence and rollback
```

The sequence may overlap in time, but every handoff must identify the exact source revision, stable IDs, schema versions and assumptions received.

## 43.3 Change Propagation

A change to one branch triggers targeted impact review:

| Change | Required Review |
| --- | --- |
| Asset dimensions, pivot, shape or material role | Blueprint placement, entity fit and presentation remapping as applicable. |
| Entity body/rig/animation event | Equipment fit and Presentation Forge spatial/timing bindings. |
| Blueprint module, room, route or state delta | Asset-kit completeness and Presentation Forge zones/paths/portals. |
| Event Contract or Context Packet | All Presentation Profiles and owning gameplay adapters. |
| Spatial reference remap | Asset/entity/blueprint source compatibility and presentation fallback. |
| Material DNA change | Asset style, Blueprint palette roles and Presentation material responses. |
| Budget or accessibility policy | Integrated scenario evidence and fallback chains. |

## 43.4 Release Authority

- **21G approval** authorises the Asset Forge source and its migration mapping.
- **22L approval** authorises the linked entity and semantic-blueprint source and migrations.
- **23J approval** authorises linked presentation libraries and migrations.
- **Integrated release approval** authorises the combined milestone package after compatibility, save, package, performance, accessibility and rollback gates pass.

No individual specialist approval automatically grants the others.

## 43.5 Legacy Retirement Authority

Legacy content can be removed only when:

1. all owning specialist replacements are approved;
2. active registry and scene references resolve through stable IDs or declared aliases;
3. supported saves and packs migrate;
4. integrated scenarios pass without the legacy source;
5. rollback exists;
6. the compatibility window has passed;
7. removal is recorded in each affected specialist migration registry.

# Appendix A. Asset Migration and Integration Record Template

| Field | Entry |
| --- | --- |
| Gameplay ID |  |
| Asset Presentation ID |  |
| Display Name |  |
| Asset Family |  |
| Kit Membership |  |
| Current Source |  |
| Classification |  |
| Priority |  |
| Target Asset Forge Mode |  |
| Required Representations |  |
| Required Asset States |  |
| Contract Impact |  |
| Asset Dependencies |  |
| Linked 22L Entity Record IDs |  |
| Linked 22L Blueprint Record IDs |  |
| Linked 23J Presentation Profile IDs |  |
| Event Contract IDs and Versions |  |
| Spatial Reference IDs |  |
| Material Response IDs |  |
| Gameplay/Schema Version Baseline |  |
| Specialist Authority Map |  |
| 21G Status |  |
| 22L Status |  |
| 23J Status |  |
| Integrated Batch ID |  |
| Asset Owner |  |
| Specialist Owners |  |
| Local Review Scenes |  |
| Integrated Test Scenarios |  |
| Legacy Fallbacks |  |
| Rollback Reference |  |
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

# Appendix C. Construction Kit and Cross-Forge Readiness Checklist

## C.1 Asset-Kit Readiness - 21G

- [ ] Building purpose and culture are defined.
- [ ] Foundation material approved.
- [ ] Primary wall and floor materials approved.
- [ ] Beams/posts and generated shapes approved.
- [ ] Roof slopes, corners and ridge solution approved.
- [ ] Door, window, glass and shutter solution approved.
- [ ] Trim, arch, fence, railing and balcony solution approved where required.
- [ ] Primary functional blocks and storage approved.
- [ ] Lighting fixtures, furniture and work props approved.
- [ ] Damage, repair, burnt, wet or corrupted source states approved where required.
- [ ] Collision, footprint, pivots and physical anchors tested.
- [ ] Material roles and substitutions documented.
- [ ] Repetition and asset performance reviewed.

## C.2 Semantic Blueprint Readiness - 22L

- [ ] Stable blueprint and module IDs linked.
- [ ] Rooms, access, doors, routes and navigation validated.
- [ ] Beds, jobs, storage, guard and interaction markers validated.
- [ ] Utilities, power, mana and logistics paths validated where applicable.
- [ ] Construction stages and project recipes mapped.
- [ ] Upgrade, damage, repair and restoration deltas validated.
- [ ] Terrain adaptation and world-placement requirements pass.
- [ ] Existing settlement/project/save regression passes.

## C.3 Presentation Readiness - 23J

- [ ] Required Event Contracts and state fields exist.
- [ ] Spatial anchors, sockets, paths, masks, zones and portals resolve.
- [ ] Required Presentation Profiles are linked.
- [ ] Sound, voxel VFX, light and surface feedback pass.
- [ ] Material response and environment context pass.
- [ ] Critical accessibility equivalents pass.
- [ ] Quality, LOD, aggregation and virtualisation profiles pass.
- [ ] Save/late-join reconstruction passes where required.

## C.4 Integrated Readiness

- [ ] Full building reviewed from exterior and interior.
- [ ] NPC use, construction and damage/repair scenarios pass.
- [ ] Day/night, weather and acoustic contexts pass.
- [ ] No direct legacy scene/file reference bypasses registries.
- [ ] Compatible manifest and schema versions are recorded.
- [ ] Existing representative saves load.
- [ ] Packaged build and integrated performance pass.
- [ ] Fallback, rollback and migration reports are linked.

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
| Entity/equipment compatibility |  |  |
| Semantic blueprint readiness |  |  |
| Presentation handoff readiness |  |  |
| Accessibility dependency |  |  |
| Cross-Forge contract/version compatibility |  |  |

A numeric score supports review but does not override a blocking contract, save, accessibility or performance defect.

# Appendix E. Integrated Batch Release Checklist

- [ ] Batch outcome, owners and dependencies are defined.
- [ ] All Asset Forge assets have integration records.
- [ ] Required 22L entity and blueprint records are linked.
- [ ] Required 23J presentation and migration records are linked.
- [ ] Stable IDs, contracts, schemas and manifest versions are compatible.
- [ ] Canonical source is saved in each owning workspace.
- [ ] Validation passes without unresolved blocking errors.
- [ ] Deterministic bakes complete.
- [ ] Registries, overrides and dependency graph resolve.
- [ ] Legacy comparison is captured.
- [ ] Required day/night, weather, interior and scenario tests pass.
- [ ] Tiling, repetition, collision, footprint and navigation pass.
- [ ] Required states, animation events and presentation profiles pass.
- [ ] Icons, held/dropped forms and equipment fits pass where applicable.
- [ ] Semantic structure blueprints pass where referenced.
- [ ] Accessibility equivalents and reduced-setting evidence pass.
- [ ] Existing save copies load and reconstruct correctly.
- [ ] Multiplayer/late-join tests pass where required.
- [ ] Integrated performance and stress samples pass.
- [ ] Clean packaged build loads all specialist products.
- [ ] Fallbacks remain available.
- [ ] Review notes are resolved or explicitly accepted.
- [ ] Migration reports and rollback point are recorded.
- [ ] Deliberate placeholders have owners and removal milestones.

# Appendix F. Legacy Removal Checklist

- [ ] Replacement Asset Forge source is Approved and Verified In World.
- [ ] Required linked 22L replacements are approved.
- [ ] Required linked 23J replacements are release-ready.
- [ ] Legacy source is marked Deprecated in every affected registry.
- [ ] No active gameplay registry resolves directly to the legacy path.
- [ ] No active entity, blueprint, profile, binding or test references the legacy path unexpectedly.
- [ ] Supported representative saves and packs load without it in a test branch.
- [ ] Aliases, wrappers or migrations cover old IDs and schemas where needed.
- [ ] Integrated scenarios and clean packaged build pass without the legacy source.
- [ ] Rollback package or version-control point exists.
- [ ] The required fallback/compatibility window has passed.
- [ ] Final cross-Forge dependency scan is clean.
- [ ] Removal is recorded in all affected migration reports.

# Appendix G. Explicit Deferrals and Specialist Ownership Boundaries

The following are outside the first integrated 21G overhaul unless a Forest Hamlet dependency proves otherwise:

- Final-game entity, creature, monster, boss and titan catalogue breadth. Their production system and migration authority remain in 22L rather than being deferred without ownership.
- Final-game structure, district, megaproject and world-blueprint catalogue breadth. Semantic production remains in 22L.
- Complete culture libraries for every race and faction.
- Full dimensional terrain, entity, blueprint and presentation packs.
- Endgame automation, golems, portals and civilisation-scale machines.
- Every final weapon, armour set and cosmetic.
- Final audio and VFX content for all systems. Production authority remains in 23J.
- Dialogue, voice, adaptive music, cinematics and full haptic-production modules.
- Marketplace packaging and public user-generated-content moderation.
- Networked collaborative Forge editing.
- Final console-specific optimisation and certification.

> **Boundary Rule**  
> "Deferred" means the content volume is outside the first milestone. It does not mean ownership is unknown. Entity and semantic-blueprint work remains governed by Set 22; presentation work remains governed by Set 23.

# Appendix H. Source-of-Truth and Handoff Matrix

| Deliverable | Canonical Owner | 21G Input | 21G Output/Link |
| --- | --- | --- | --- |
| Terrain/block/item/machine source | 21G | Gameplay definitions and Material DNA | Approved source, bake, migration and fallback. |
| Entity body/rig/animation | 22L | Materials, equipment source, attachment requirements | Linked entity record and fit/contract status. |
| Semantic blueprint | 22L | Structure kit, asset IDs, physical constraints | Linked blueprint migration and readiness status. |
| Event Contract and Context Packet | Owning gameplay system with Set 23 registry | Asset states and timing needs | Linked contract/version; no duplicate local event. |
| Spatial presentation reference | Set 23, based on asset/entity/blueprint semantics | Physical source and proposed semantic need | Linked anchor/socket/path/mask/zone/portal record. |
| VFX/audio/light/surface profile | 23J | Event, material, state and spatial requirements | Linked Presentation Profile and migration record. |
| Accessibility equivalent | 23J | Importance and critical-state meaning | Linked accessibility profile and evidence. |
| Integrated package | Combined release authority | Compatible specialist manifests | Batch manifest, evidence, rollback and release decision. |

# Appendix I. Cross-Forge Batch Manifest Template

```text
CrossForgeMigrationBatch
{
    batch_id:
    title:
    gameplay_outcome:
    target_milestone:

    gameplay_contract_versions[]
    asset_forge_source_revisions[]
    entity_blueprint_source_revisions[]
    presentation_source_revisions[]

    asset_ids[]
    entity_record_ids[]
    blueprint_record_ids[]
    presentation_profile_ids[]
    event_contract_ids[]
    spatial_reference_ids[]
    material_response_ids[]

    required_test_scenarios[]
    required_accessibility_evidence[]
    required_performance_profiles[]

    specialist_status:
      asset_forge:
      entity_forge:
      blueprint_forge:
      presentation_forge:

    deliberate_placeholders[]
    legacy_aliases[]
    fallback_package:
    rollback_reference:

    compatibility_report:
    approval_records[]
    release_state:
}
```

# Glossary

| Term | Meaning |
| --- | --- |
| Asset | One registry-linked Asset Forge visual object or representation. |
| Family | Related source sharing material, function, shape or production language. |
| Kit | Cross-family set required to construct and dress a structure type. |
| Golden Asset | Approved example that practically locks a style or implementation rule. |
| Material DNA | Shared palette, pattern, physical identity and state behaviour for a material family. |
| Legacy Asset | Existing source retained during migration or fallback. |
| Migration Record | Registry-linked status, mapping and decision record for an owned production object. |
| Integration Record | 21G record linking Asset Forge source to required 22L and 23J specialist records. |
| Specialist Authority | Document or system that owns canonical source and approval for a production field. |
| Cosmetic Safe | Presentation change that preserves gameplay and specialist-facing contracts. |
| Cross-Forge Contract Change | Change affecting entity attachments, blueprint semantics, Event Contracts or stable spatial references. |
| Semantic Blueprint | Blueprint Forge source that combines physical voxels/modules with rooms, access, jobs, utilities, construction, states and world-placement meaning. |
| Presentation Profile | Set 23 bundle that resolves related sound, voxel VFX, light, surface and accessibility feedback for a semantic event/state. |
| Event Contract | Validated declaration of an event and its legal payload; gameplay owns truth and Presentation Forge consumes it. |
| Context Packet | Bounded material, intensity, environment, state and spatial context used by Presentation Forge resolution. |
| Semantic Spatial Reference | Stable named anchor, socket, region, path, mask, zone or portal whose physical mapping may migrate explicitly. |
| Integrated Release Batch | Coordinated package linking compatible Asset, Entity/Blueprint and Presentation source, products, evidence and rollback. |
| POC Candidate | Representative quality suitable for the current proof slice with declared gaps. |
| Production Asset | Approved reusable Asset Forge source with required representations and tests. |
| Project Override | Non-destructive project-level replacement of base fields under declared authority. |
| Verified In World | Migrated source has passed representative gameplay, save, structure and performance checks. |
| Deprecation | State where legacy content remains supported but is no longer preferred. |
| Forest Hamlet Integrated Slice | First bounded result proving terrain, buildings, residents, automation, magic, threat and sensory presentation together. |
