# Fantasy Voxel Civilisation Sandbox
## 22L - Entity and Blueprint Visual Production and Migration Plan
**Version 0.1 - Detailed Design Bible and Production Foundation Draft**

A staged production and migration plan for replacing placeholder and legacy humanoids, NPCs, animals, mobs, monsters, bosses and structure blueprints with approved voxel-authored Forge content, while preserving stable gameplay identities, save compatibility, semantic markers, construction logic, world-generation relationships and the readable fantasy-voxel art direction of Leyforge.

## Entity and Blueprint Visual Production and Migration Plan Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the audit, prioritisation, production, migration, review, approval, packaging and regression process for Entity Forge content and Blueprint Forge content established by Documents 22A through 22K. |
| Forge Relationship | Entity and structure production occurs inside the unified Leyforge Forge. The editable voxel source is authoritative; baked meshes, rigs, animation products, icons, thumbnails and runtime scenes are replaceable generated outputs. |
| Voxel Direction | All visible authored geometry for humanoids, creatures, equipment, props and structure modules originates from editable voxel source, voxel-generating tools or approved Forge voxel assets. Smooth imported models are not the art source of truth. |
| Migration Direction | Preserve stable entity IDs, structure IDs and gameplay contracts whenever possible. Replace presentation through explicit Forge source and registry mappings. Spatial or semantic changes require classified migrations rather than silent visual overrides. |
| Entity Direction | Produce reusable body-plan templates, shared rigs, animation families, equipment fit profiles and material families before attempting large content volume. Individual creatures should inherit from proven foundations wherever practical. |
| Blueprint Direction | Merge all structure and building blueprint authoring into Blueprint Forge. Migrate physical blocks, nested modules, semantic markers, construction stages, upgrade deltas, damage states and world-generation placement rules as one validated package. |
| Icon Direction | Any block, item, equipment piece, entity, boss or blueprint requiring an icon, portrait, codex image or thumbnail uses deterministic live Forge capture profiles. Manually painted UI art may be added later but is not required for the first migration. |
| NPC Direction | Persistent named NPCs retain identity, appearance seeds, culture, profession and equipment links across visual migration. Population variety must remain deterministic and save-safe. |
| Creature Direction | The production plan explicitly supports bipeds, quadrupeds, four-armed or multi-armed humanoids, six- and eight-legged creatures, repeated-segment crawlers, serpents, birds, bats, flying monsters, dragons, aquatic bodies, amorphous beings and colossal bosses. |
| Blueprint Production Direction | Complete functional building kits and reusable modules before producing many one-off structures. A building is not approved until its access, NPC markers, networks, construction stages and state variants pass Forge validation. |
| Quality Direction | Prioritise silhouette, scale, movement readability and gameplay function before micro-detail. Assets must be reviewed in the live world, at gameplay distance and under representative lighting. |
| Performance Direction | Every production batch includes LOD, animation, rig, collision, marker and blueprint complexity review. High authoring detail must not imply full runtime detail at every distance. |
| Approval Direction | Approval is representation-specific. A model can be approved while its animation, equipment fit, icon or LOD remains incomplete. An entity or blueprint becomes release-ready only when all required representations pass. |
| Legacy Direction | Legacy and placeholder assets remain available as explicit fallbacks until their replacements pass migration, runtime and save compatibility tests. Removal is a final controlled step, never the first step. |
| Audio and VFX Direction | Dedicated Audio Forge and VFX/Particle Forge production remain deferred. This plan migrates only named event hooks, sockets, light/emission references and placeholder effect bindings needed to avoid future redesign. |
| POC Direction | First prove one complete player humanoid family, core Forest Hamlet NPC roles, pig, spider, giant centipede, bird, goblin raider family, dragon test boss and a functional Forest Hamlet blueprint set including cottage, warehouse, watchtower, bridge, workshop, goblin camp and rune ruin. |

## Document Purpose

This document converts the expanded Forge design into an actionable content-production programme. Documents 22A through 22K define how voxel entities and semantic structure blueprints are authored, rigged, animated, integrated, validated and implemented. Document 22L defines how the actual game content moves through that system without losing gameplay identity or becoming an unmanageable collection of isolated models.

The production challenge is broader than making attractive models. A pig needs a voxel body, materials, a quadruped rig, locomotion, interaction anchors, collision, icons, LOD and deterministic variants. A dragon needs a compatible body graph, wings, neck and tail chains, attack anchors, boss regions, phase states, flight validation and performance controls. A village watchtower needs physical blocks, material roles, construction stages, guard positions, access routes, damage states, world-generation anchors and a blueprint thumbnail. These are integrated content packages rather than standalone art files.

The plan therefore establishes:

1. A complete audit and migration record for every current entity and blueprint.
2. Shared foundations that must be produced before content volume increases.
3. Ordered production batches tied to the Forest Hamlet proof-of-concept.
4. Clear approval gates for source, presentation, gameplay contracts and runtime products.
5. Safe replacement, fallback, migration and deprecation procedures.
6. A continuous post-overhaul pipeline for future races, cultures, creatures, dimensions and settlements.

## Current Engine and Source-of-Truth Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. The unified Forge is the content-authoring environment. Editable voxel source, semantic definitions and versioned registry records are authoritative. Older Unreal-specific planning is historical and must not dictate current production tooling or migration decisions.

## Design and Production Sources

| Source | Relevant Direction | How 22L Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Stylised, readable, atmospheric fantasy voxel presentation with living NPCs, creatures, machines and structures. | Locks the visual identity and the requirement that production supports a living world. |
| 07 - NPC Village System | Persistent named NPCs, jobs, homes, culture, schedules, equipment and construction projects. | Defines NPC appearance persistence and blueprint marker requirements. |
| 10 - Creatures and Monsters | Wildlife, livestock, monsters, raid factions, bosses, ecology, readable silhouettes and LOD. | Establishes the entity production categories and creature acceptance needs. |
| 11 - Biomes and World Generation | Biomes, roads, structures, villages and relational world-generation placement. | Defines blueprint placement and environmental variant review. |
| 12 - Structures | Blueprints, modules, stages, damage, repair, ownership, world states and generation rules. | Establishes structure migration completeness. |
| 13 - Races, Peoples, Cultures and Factions | Layered ancestry, culture, faction and settlement identity. | Guides humanoid, equipment, palette and blueprint variants. |
| 16 - Combat, Gear and Defence | Equipment, body regions, attacks, defensive structures, raids and boss mechanics. | Requires hit-region, equipment and breakable-part contract review. |
| 21A-21G - Voxel Asset Forge | Voxel source, modelling, animation states, overrides, UI, implementation and visual overhaul. | Supplies the shared block, item, machine and material production foundation. |
| 22A - Expansion Core | Unified Entity Forge and Blueprint Forge vision. | Supplies this plan's scope and locked Forge-wide rules. |
| 22B-22D - Entity Creation | Body taxonomy, humanoid creation and creature/boss creation. | Defines production template families and asset requirements. |
| 22E-22H - Rigging and Integration | Rigs, animation, equipment, hitboxes, AI markers and simulation LOD. | Defines non-visual representations required for approval. |
| 22I - Blueprint Forge | Semantic blueprint authoring for buildings, structures and world content. | Defines blueprint migration records, layers and validation. |
| 22J - Unified UI/UX | Shared workflows, browser, testing, capture, revision and approval. | Defines the actual production workflow used by this plan. |
| 22K - Technical Implementation | Godot source schemas, baking, runtime contracts, validation and migration architecture. | Supplies implementation constraints, generated products and compatibility boundaries. |

## Static Table of Contents

1. Locked Production and Migration Identity
2. Locked Direction Summary
3. Production Goals, Principles and Non-Goals
4. Source of Truth, Contract Boundaries and Migration Classes
5. Current-State Audit and Evidence Capture
6. Entity and Blueprint Inventory Records
7. Asset Lifecycle, Readiness and Approval States
8. Priority, Dependencies and Production Batch Planning
9. Quality Tiers and Completion Definitions
10. Voxel Scale, Density, Silhouette and Readability Standards
11. Golden Templates, Example Library and Reference Packs
12. Shared Material DNA and Surface Production
13. Body-Plan Template Production Order
14. Player Humanoid Foundation
15. NPC Population and Profession Production
16. Humanoid Enemies, Multi-Armed Bodies and Humanoid Bosses
17. Quadrupeds, Livestock, Mounts and Heavy Beasts
18. Arthropods, Spiders, Hexapods and Crustaceans
19. Segmented Crawlers, Serpents and Flexible Bodies
20. Birds, Bats and Other Flying Creatures
21. Dragons, Wyverns and Colossal Flying Bosses
22. Aquatic, Amorphous, Plant and Constructed Entities
23. Skeleton, Rig and Retarget Library Production
24. Animation, Gait and Runtime State Production
25. Clothing, Armour, Equipment and Creature Fittings
26. Variants, Damage, Age, Corruption and Boss Phases
27. Gameplay Markers, Collision, Hit Regions and Contract Review
28. Icons, Portraits, Codex Images and Blueprint Thumbnails
29. Entity Performance, LOD and Crowd Readiness
30. Blueprint Audit and Migration Scope
31. Blueprint Modules, Semantic Layers and Material Roles
32. Construction Stages, Upgrades and Project Migration
33. Culture, Biome and Settlement Blueprint Variants
34. Damage, Occupation, Corruption, Repair and Restoration
35. World-Generation Placement and Terrain Adaptation
36. Structure Production Batches and Building Completion
37. Forest Hamlet Vertical Slice Production Register
38. End-to-End Entity Migration Workflow
39. End-to-End Blueprint Migration Workflow
40. Forge Test Laboratory and In-World QA
41. Review, Feedback, Approval and Revision Control
42. Version Control, Packaging, Provenance and Release Records
43. Legacy Fallback, Deprecation and Removal
44. Risks, Redesign Triggers and Contingencies
45. Staged Production and Migration Roadmap
46. Definition of Done and Acceptance Matrix
47. Continuous Production After the Initial Migration
48. Open Decisions for Later Planning
Appendix A. Entity Migration Record Template
Appendix B. Blueprint Migration Record Template
Appendix C. Initial Entity Production Backlog
Appendix D. Initial Blueprint Production Backlog
Appendix E. Template and Family Readiness Checklists
Appendix F. Entity Review Scorecard
Appendix G. Blueprint Review Scorecard
Appendix H. Batch Release Checklist
Appendix I. Legacy Removal Checklist
Appendix J. Explicit Deferrals
Glossary

# 1. Locked Production and Migration Identity

Entity and blueprint production is the process of turning the Forge's reusable voxel systems into complete, approved game content. It is not a simple model replacement pass. Every migrated entity or structure must retain a clear identity, remain compatible with gameplay, and provide all required representations for the contexts in which it appears.

> **Locked Rule**  
> No entity or blueprint is considered migrated merely because a new voxel model looks better. Migration is complete only when the editable voxel source, registry identity, required runtime products, gameplay contracts, live previews, icons or thumbnails, performance profiles and compatibility checks all pass their defined acceptance gates.

## 1.1 Production Promise

The production pipeline should make it straightforward to create one high-quality foundation and reuse it safely. A humanoid rig should support many compatible characters. A quadruped gait should support multiple livestock families. A building module should support multiple cultural palettes. Reuse should accelerate production without making every entity or structure feel identical.

## 1.2 Production Pillars

| Pillar | Production Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel authenticity | Editable source is visibly and structurally voxel-based. | Every entity and building belongs to the same world. |
| Readable silhouette | Shape, stance and movement are clear before small details. | Creatures, NPCs and structures remain recognisable in play. |
| Shared foundations | Templates, rigs, materials, animations and modules are reused intentionally. | Large content volume remains consistent and maintainable. |
| Stable identity | Gameplay IDs and persistent records survive visual replacement. | Saves, quests, inventories, villages and world state remain trustworthy. |
| Semantic completeness | Markers, hit regions, stages and networks migrate with visuals. | NPCs, combat, construction and automation continue to function. |
| Contextual approval | Content is reviewed in live environments, not only studio view. | Assets work under real lighting, scale, terrain and gameplay conditions. |
| Performance awareness | LOD and runtime cost are planned with authoring. | Detailed content does not destroy world scale or simulation performance. |
| Reversible migration | Old content remains recoverable until replacements are proven. | Failed migrations do not corrupt production or existing worlds. |

## 1.3 What This Plan Is Not

- It is not permission to rebuild gameplay systems while doing visual work.
- It is not a requirement to create the final game's entire content catalogue before the proof-of-concept.
- It is not a one-off art sprint without registries, review records or source preservation.
- It is not a smooth-model import pipeline disguised as voxel production.
- It is not a full Audio Forge or VFX/Particle Forge production plan.
- It is not a mandate to make every entity use unique rigs and animations.
- It is not a reason to delete functional placeholders before replacements are approved.

# 2. Locked Direction Summary

| Area | Locked Direction |
| --- | --- |
| Production structure | Use shared foundations, family batches and vertical-slice priorities before broad catalogue expansion. |
| Entity source | Editable voxel source plus semantic body, rig, animation, marker and customisation definitions. |
| Blueprint source | Semantic voxel blueprint containing physical composition, nested modules, layers, stages, states and placement rules. |
| Migration key | Stable entity ID or blueprint ID remains the primary identity. Presentation revisions are versioned beneath it. |
| Contract classes | Cosmetic, presentation-spatial, gameplay-spatial and semantic changes use different review and migration rules. |
| Player priority | Produce a complete standard player humanoid and one equipment family early because it validates many shared systems. |
| NPC priority | Produce Forest Hamlet professions and deterministic variation before creating many distant cultures. |
| Creature priority | Pig, spider, giant centipede, bird, goblin family and dragon test rig provide body-plan coverage. |
| Boss priority | Use one dragon test boss and one humanoid or goblin mini-boss to validate phases, regions and large-scale presentation. |
| Blueprint priority | Cottage, warehouse, workshop, watchtower, bridge, goblin camp and rune ruin form the first complete structure set. |
| Variant strategy | Build bounded variants from parent families. Avoid unreviewed combinatorial generation. |
| Rig strategy | Produce reusable semantic rig families and explicit retarget compatibility maps. |
| Animation strategy | Produce capability-based animation libraries with procedural gait support and named event markers. |
| Icon strategy | Generate inventory icons, portraits, codex images, boss cards and blueprint thumbnails from live deterministic capture profiles. |
| Review strategy | Studio preview, silhouette review, Test Laboratory scenarios and live-world review are all required. |
| Approval strategy | Approve source, model, rig, animation, gameplay contract, icon, LOD and package separately, then grant release readiness. |
| Legacy strategy | Keep aliases and fallback presentation until production, migration and existing-save tests pass. |
| Packaging | Every batch exports source references, runtime products, manifests, validation reports, change logs and migration records. |
| Deferrals | Full audio authoring, particle authoring, final cinematic tooling and broad public mod publishing remain later work. |

# 3. Production Goals, Principles and Non-Goals

## 3.1 Primary Goals

- Establish a cohesive voxel visual language for all living entities and structures.
- Replace placeholder player, NPC, creature and building content without breaking gameplay identity.
- Produce reusable foundations that reduce later content cost.
- Complete the Forest Hamlet visual and functional slice before attempting broad final-game coverage.
- Make migration measurable through records, validation and acceptance gates.
- Ensure every approved asset is editable, reproducible and portable.
- Keep future races, dimensions and factions expandable through templates and inheritance.

## 3.2 Production Principles

### Foundations Before Volume

A high-quality humanoid base, pig template, spider rig or cottage module is more valuable than many disconnected one-off assets. Production should pause when foundations are unstable rather than multiplying defects.

### Silhouette Before Surface Detail

The model must read at normal gameplay distance before materials, small accessories and surface noise are added. A spider should not be mistaken for a crab. A guard should not be mistaken for a farmer. A watchtower should read as a defensive vertical landmark.

### Motion Before Ornament

For creatures, body proportions must be validated in motion before decorative detail is finalised. Wings, leg spacing, neck length and segment counts often appear acceptable in a static pose but fail during locomotion.

### Function Before Decoration

Blueprints must pass doors, paths, workstations, storage, networks and construction tests before decorative dressing. Decoration should not hide inaccessible or broken functionality.

### Reuse Before Duplication

Use material roles, body templates, rig families, animation libraries and nested blueprint modules. Create local overrides only where identity or function requires them.

### Determinism Before Randomness

Procedural variation must store seeds and parameter sets. Persistent NPCs, generated creatures and decorated structures must reconstruct consistently.

### Compatibility Before Convenience

A visual edit that changes collision, reach, marker locations, blueprint footprint or world placement is not cosmetic. It must be reviewed as a contract migration.

## 3.3 Explicit Non-Goals for Version 0.1

- Every final playable race.
- Every biome-specific animal.
- Every boss and raid faction.
- Full facial speech animation.
- Physically simulated feathers, fur or cloth.
- Destructible anatomy for every creature.
- Full cinematic boss presentation.
- Final audio or particle authoring.
- Player-facing public creature creation and blueprint publishing.
- Unlimited procedural generation of unreviewed entity combinations.

# 4. Source of Truth, Contract Boundaries and Migration Classes

## 4.1 Source Hierarchy

| Layer | Role | Authority |
| --- | --- | --- |
| Forge editable source | Voxel volumes, parts, body graph, rig, animation source, materials, blueprint layers and authored metadata. | Primary creative source of truth. |
| Approved presentation definition | Resolved versioned record for a stable entity or blueprint ID. | Primary presentation contract. |
| Generated runtime products | Meshes, skeletons, animations, scenes, collisions, icons, LOD and compact manifests. | Replaceable build output. |
| Gameplay definition | Stats, AI, inventory, recipes, jobs, construction costs, worldgen rules and authoritative behaviour. | Owned by gameplay registries. |
| Save/runtime state | Current identity, equipment, damage, project progress, ownership, location and simulation state. | Owned by save and runtime systems. |

## 4.2 Migration Classes

| Class | Example | Required Process |
| --- | --- | --- |
| Cosmetic | Repaint pig material or change roof palette. | Presentation review and icon refresh. |
| Presentation-spatial | Move a backpack socket or widen a decorative wing membrane. | Fit, clipping and animation review. |
| Gameplay-spatial | Change player collision size, dragon breath origin or watchtower footprint. | Explicit contract migration and gameplay validation. |
| Semantic | Remove a bed marker, rename a hit region or change warehouse input role. | Registry migration, dependent-system review and save compatibility test. |
| Identity replacement | Split one legacy monster into two new entity IDs. | Alias, spawn, loot, quest and save mapping plan. |

## 4.3 No Silent Contract Changes

The Forge must display contract-impact warnings before approval. A model can be freely sculpted while in draft, but promotion to approved status must compare the new spatial and semantic contract against the currently approved revision.

# 5. Current-State Audit and Evidence Capture

Production begins with evidence, not assumptions. The audit must identify what exists, how it is used and what is missing.

## 5.1 Entity Audit Capture Set

For each current player, NPC, animal, monster or boss, capture:

- Stable ID and display name.
- Current model source and runtime scene.
- Front, side, rear and three-quarter studio views.
- Normal gameplay-distance screenshot.
- Idle and movement clip recording.
- Equipment or carried-item view where relevant.
- Collision, hit-region and marker overlay.
- Icon, portrait or codex image.
- Current variants and material dependencies.
- AI, combat, village, spawn and save references.
- Known defects, placeholders and temporary assumptions.

## 5.2 Blueprint Audit Capture Set

For each current structure or building blueprint, capture:

- Stable blueprint ID and category.
- Current physical block volume and placed assets.
- Top, side and perspective views.
- Entrance, navigation, job, storage and guard markers.
- Automation, power and mana networks where present.
- Construction or upgrade stages if implemented.
- Damage, ruin, occupation or repaired states.
- World-generation placement profile and relational anchors.
- Thumbnail or map presentation.
- Dependent village, quest, raid, structure and worldgen records.

## 5.3 Audit Classification

| Classification | Meaning | Default Action |
| --- | --- | --- |
| Retain | Meets style and functional requirements. | Preserve and register as approved/golden. |
| Polish | Sound foundation with local defects. | Edit as a Forge override or source revision. |
| Rebuild | Shape, rig, animation or blueprint structure is unsuitable. | Recreate while preserving stable identity where possible. |
| Split | One legacy definition represents multiple distinct roles. | Create new child IDs and explicit migration aliases. |
| Merge | Multiple definitions duplicate one role. | Consolidate under a parent family and map legacy aliases. |
| Defer | Not required for current slice. | Preserve functional fallback and schedule later. |
| Remove | Unused, duplicate or harmful content. | Prove no references, then deprecate and remove. |

## 5.4 Audit Deliverables

The audit produces:

1. Entity migration inventory.
2. Blueprint migration inventory.
3. Dependency graph snapshot.
4. Current-state screenshot/contact-sheet library.
5. Known-contract baseline.
6. Prioritised production backlog.
7. Legacy fallback register.

# 6. Entity and Blueprint Inventory Records

## 6.1 Inventory Units

Entity inventory is tracked at several levels:

- Species or creature family.
- Presentation definition.
- Body template.
- Rig family.
- Animation family.
- Equipment fit family.
- Variant profile.
- Individual persistent appearance record where required.

Blueprint inventory is tracked as:

- Blueprint family.
- Base blueprint.
- Nested module.
- Material-role palette.
- Upgrade delta.
- Construction profile.
- Dynamic-state profile.
- Placement profile.

## 6.2 Required Record Fields

Every record should include:

- Stable ID.
- Display name.
- Category and family.
- Current lifecycle state.
- Current source location.
- Approved revision.
- Replacement strategy.
- Dependencies and dependents.
- Contract version.
- Required representations.
- Quality target.
- POC/final priority.
- Assigned owner.
- Review history.
- Migration notes.
- Legacy fallback.
- Removal gate.

## 6.3 Discovery and Reconciliation

The Forge should compare manifests, registries and project files to identify:

- IDs with no source asset.
- source assets with no registry entry.
- runtime products with no valid source revision.
- duplicate stable IDs.
- stale icons or thumbnails.
- blueprints referencing deprecated blocks or props.
- entities referencing missing rigs or animation sets.
- migration aliases with no destination.

# 7. Asset Lifecycle, Readiness and Approval States

## 7.1 Lifecycle

```text
Concept
  -> Draft
  -> Functional
  -> Visual Review
  -> Gameplay Contract Review
  -> Performance Review
  -> Approved
  -> Release Ready
  -> Deprecated
  -> Legacy Fallback
  -> Removed
```

## 7.2 State Definitions

| State | Meaning |
| --- | --- |
| Concept | Intent recorded; source may not yet exist. |
| Draft | Editable source exists but is incomplete. |
| Functional | Core model/blueprint works in preview and required references resolve. |
| Visual Review | Silhouette, scale, materials and presentation are ready for art review. |
| Gameplay Contract Review | Markers, regions, sockets, paths, stages and networks are validated. |
| Performance Review | LOD, complexity, animation, collision and repeated-use budgets pass. |
| Approved | Source and required representations meet project standards. |
| Release Ready | Approved, packaged, migrated, tested in build and included in release manifest. |
| Deprecated | Still supported but no longer selected for new content. |
| Legacy Fallback | Retained only for rollback or old-save recovery. |
| Removed | References migrated and asset deleted from active content. |

## 7.3 Representation Readiness

An entity may track separate readiness for:

- Voxel model.
- Materials.
- Rig.
- Animation.
- Equipment compatibility.
- Gameplay markers.
- Icons/portraits.
- LOD and performance.
- Runtime package.

A blueprint may track:

- Physical composition.
- Material roles.
- Semantic markers.
- Networks.
- Construction stages.
- Dynamic states.
- Placement rules.
- Thumbnail.
- Performance/streaming.

# 8. Priority, Dependencies and Production Batch Planning

## 8.1 Priority Levels

| Priority | Meaning | Example |
| --- | --- | --- |
| P0 | Blocks development or core vertical slice. | Player humanoid, pig, Forest Hamlet watchtower. |
| P1 | Required for complete Forest Hamlet experience. | Villager professions, spider, warehouse, goblin camp. |
| P2 | Expands test coverage or polish. | Centipede, bird, dragon test boss, workshop interior set. |
| P3 | Post-POC regional content. | Additional animals, factions and settlement styles. |
| P4 | Final-game or distant future. | Dimension-specific titans and capital-scale megastructures. |

## 8.2 Dependency Order

Recommended production order:

1. Material DNA and voxel-density standards.
2. Golden body templates and blueprint modules.
3. Shared rigs and marker catalogues.
4. Shared animation and gait libraries.
5. Player humanoid and core equipment.
6. NPC profession variants.
7. POC creatures and hostile family.
8. POC blueprints and construction stages.
9. Icons, portraits and thumbnails.
10. LOD, package and existing-save migration.

## 8.3 Batch Rules

A production batch should:

- Have one clear family or vertical-slice purpose.
- Use approved shared foundations.
- Contain no untracked one-off assets.
- Define migration targets before modelling starts.
- Include live test scenarios.
- Produce one batch validation report.
- Avoid mixing unrelated contract changes.
- Be small enough to review and roll back.

# 9. Quality Tiers and Completion Definitions

## 9.1 Quality Tiers

| Tier | Purpose | Minimum Expectation |
| --- | --- | --- |
| Prototype | Proves workflow and contract. | Basic voxel source, collision, simple state and temporary icon. |
| POC Approved | Supports Forest Hamlet proof. | Cohesive visual, required animations/markers, live capture and performance pass. |
| Production | Ready for broader alpha content. | Complete family integration, variants, LOD, migration and regression coverage. |
| Showcase | Hero asset or marketing-facing. | Additional polish, presentation states and stricter visual review. |

## 9.2 Entity Completion Dimensions

| Dimension | Completion Question |
| --- | --- |
| Identity | Does the stable entity ID resolve correctly? |
| Silhouette | Is the entity recognisable at gameplay distance? |
| Scale | Does it fit doors, terrain, equipment and combat contexts? |
| Movement | Does locomotion suit the body plan and terrain? |
| Materials | Are surfaces coherent with Leyforge material DNA? |
| Gameplay contract | Are collision, regions, sensors and anchors correct? |
| Variants | Are required population, damage and state variants bounded and deterministic? |
| UI | Are icons, portraits or codex captures correct? |
| Performance | Do LOD and repetition budgets pass? |
| Migration | Do saves, spawns, equipment and references remain valid? |

## 9.3 Blueprint Completion Dimensions

- Physical composition complete.
- Material roles resolve.
- Doors and entrances function.
- NPC and creature paths validate.
- Job, household, guard and storage markers are reachable.
- Required networks connect.
- Construction and upgrade stages are coherent.
- Damage and repair states resolve.
- Placement profile succeeds with fallback.
- Thumbnail and map presentation exist.
- Streaming and repeated-placement budgets pass.

# 10. Voxel Scale, Density, Silhouette and Readability Standards

## 10.1 Shared World Scale

All entities and blueprints use the same world scale as the block grid. A standard full terrain block remains the one-metre reference. Entity authoring density may vary, but final physical scale must remain explicit and comparable in Forge previews.

## 10.2 Suggested Density Bands

| Content | Suggested Source Density | Notes |
| --- | --- | --- |
| Humanoid body part | 16-32 voxels across a major dimension | Modular and equipment-compatible. |
| Small livestock | 32-48 voxel working envelope | Preserve readable body mass. |
| Spider or insect | 32-64 voxel envelope | Prioritise leg separation and silhouette. |
| Bird | 32-64 voxel envelope | Wings may use modular parts. |
| Large creature | Modular 32-64 voxel parts | Avoid one enormous source volume. |
| Dragon or colossal boss | Modular body graph with repeated chains | LOD designed from the beginning. |
| Building blueprint | One-metre blocks plus Forge props/modules | Do not replace structure blocks with microvoxels. |

## 10.3 Silhouette Tests

Every entity should be reviewed:

- As a black silhouette.
- At icon size.
- At normal combat distance.
- At medium LOD distance.
- In daylight and night.
- Against similar-coloured terrain.
- During idle and primary locomotion.

Every blueprint should be reviewed:

- From ground approach.
- From road or village entrance.
- From elevated overview.
- At map-thumbnail size.
- During construction and damaged states.

# 11. Golden Templates, Example Library and Reference Packs

## 11.1 Golden Entity Templates

The first golden templates should be:

- Standard humanoid.
- Four-armed humanoid extension.
- Pig/quadruped.
- Spider/eight-legged arthropod.
- Giant centipede/repeated segment.
- Bird/avian.
- Dragon/large flying boss.
- Floating construct.

## 11.2 Golden Blueprint Templates

- Small cottage.
- Village warehouse.
- Workshop.
- Watchtower.
- Bridge/crossing.
- Enemy camp.
- Rune ruin.

## 11.3 Golden Template Requirements

A golden template must:

- Be approved at POC quality or above.
- Demonstrate correct source organisation.
- Use stable semantic roles.
- Include required validation scenarios.
- Include icon or thumbnail capture.
- Be safe to duplicate as a new family.
- Have documented extension points.
- Be protected from accidental direct mutation.

# 12. Shared Material DNA and Surface Production

## 12.1 Entity Material Families

Initial shared families should include:

- Skin tones.
- Hair and fur.
- Feathers.
- Hide and leather.
- Bone and horn.
- Chitin and shell.
- Scales.
- Cloth.
- Iron, steel and bronze.
- Wood and living wood.
- Stone and carved stone.
- Mana crystal and magical emission.
- Corruption and void influence.

## 12.2 Blueprint Material Roles

Structures should prefer semantic roles:

```text
foundation_material
wall_primary
wall_secondary
frame_material
floor_material
roof_material
trim_material
door_material
window_material
metal_fittings
magic_accent
```

## 12.3 Material Approval

A material family is not approved until it has been tested on:

- A close-up asset.
- A gameplay-distance asset.
- An icon or thumbnail.
- Day and night lighting.
- Wet or damaged state where relevant.
- At least one repeated-use scene.

# 13. Body-Plan Template Production Order

## 13.1 Required Order

1. Standard humanoid.
2. Four-armed humanoid extension.
3. Quadruped.
4. Eight-legged arthropod.
5. Repeated-segment crawler.
6. Avian.
7. Dragon.
8. Floating/amorphous or construct body.

## 13.2 Template Deliverables

Each body-plan template should provide:

- Semantic body graph.
- Editable voxel part placeholders.
- Scale range.
- Default pivots and joints.
- Required rig roles.
- Default collision envelope.
- Suggested gameplay regions and anchors.
- Compatible gait or animation families.
- LOD grouping.
- Example child asset.

## 13.3 Template Change Control

Changes to approved templates must state whether child assets:

- Inherit automatically.
- Require rebake only.
- Require fit/animation review.
- Require contract migration.
- Remain pinned to the prior version.

# 14. Player Humanoid Foundation

The player humanoid is a P0 foundation because it validates character scale, equipment, animation, first-person and third-person presentation, collision, interaction, inventory icons and save persistence.

## 14.1 Required Base Deliverables

- Standard voxel body.
- Modular head and face system.
- Deterministic body-frame controls within safe ranges.
- Standard humanoid semantic rig.
- First- and third-person representation profiles.
- Equipment sockets and fit profiles.
- Core locomotion and interaction set.
- Damage and temporary status overlays.
- Character portrait and save-thumbnail capture.
- LOD and multiplayer presentation profile.

## 14.2 POC Customisation Scope

POC customisation should support:

- Several body frames.
- Multiple skin palettes.
- Several heads, eyes, hair and facial-hair options.
- Basic cultural clothing palette.
- One starter armour/equipment family.
- Optional ears, horns or other bounded extensions if required by the first playable peoples.

## 14.3 Player Acceptance

The base player must pass:

- Doorway and stair tests.
- Jump, fall, swim and crouch tests.
- Tool and weapon grip tests.
- Armour clipping matrix.
- First-person hand/tool framing.
- Third-person camera readability.
- Network replication preview.
- Save/reload appearance reconstruction.

# 15. NPC Population and Profession Production

## 15.1 Forest Hamlet Core Roles

Initial NPC production should cover:

- Elder.
- Builder.
- Farmer.
- Guard.
- Merchant.
- Mage.
- Miner.
- Lumberjack.

## 15.2 Shared and Unique Layers

Shared:

- Base humanoid family.
- Core rig and locomotion.
- Common body frames.
- Shared clothing fit profiles.
- Dialogue and interaction anchors.

Unique or role-specific:

- Profession clothing and tools.
- Culture/faction palette.
- Carrying and work animations.
- Role silhouette.
- Portrait capture profile.

## 15.3 Persistent Appearance Rules

Named NPCs store:

- Appearance seed channels.
- Selected body-frame ID.
- Face/hair component IDs.
- Culture and profession presentation IDs.
- Current equipment references.
- Scar, age or persistent condition layers.
- Approved fallback presentation version.

A distant simulation transition must never reroll a named NPC's appearance.

# 16. Humanoid Enemies, Multi-Armed Bodies and Humanoid Bosses

## 16.1 Goblin Raider Family

The initial hostile humanoid family should include:

- Goblin scout or light raider.
- Goblin melee raider.
- Goblin ranged raider.
- Goblin brute.
- Goblin raid captain mini-boss.

Shared family work should include body scale, rig, weapon sockets, equipment palette and animation inheritance.

## 16.2 Multi-Armed Bodies

The four-armed extension must prove:

- Additional limb-pair body graph.
- Independent sockets and equipment slots.
- Collision and self-intersection limits.
- Shared locomotion compatibility.
- Coordinated work/combat animation layers.
- LOD reduction strategy.

## 16.3 Humanoid Bosses

Humanoid bosses may add:

- Enlarged scale profile.
- Custom armour regions.
- Additional animation events.
- Phase-specific equipment or body overlays.
- Boss-card capture.
- Breakable or disabled presentation regions.

# 17. Quadrupeds, Livestock, Mounts and Heavy Beasts

## 17.1 Pig Family First

The pig is the first quadruped proof asset because it validates livestock scale, quadruped gait, village interaction, feeding, fleeing and simple family variants.

Required variants:

- Domestic pig.
- Wild boar.
- Optional corrupted or oversized test variant.

## 17.2 Quadruped Production Kit

The quadruped kit should include:

- Base body and leg graph.
- Walk, trot and run gaits.
- Turn, idle, eat, sleep, flee, damage and death states.
- Head, mouth and back anchors.
- Terrain-aware foot placement.
- Basic mount extension hooks.
- LOD grouping.

## 17.3 Mount and Heavy Beast Readiness

Mount production adds:

- Saddle and rider anchors.
- Cargo and towing anchors.
- Rider clearance validation.
- Mount locomotion blending.
- Passenger replication.

Heavy beasts add:

- Wider navigation footprint.
- Terrain and doorway exclusions.
- Stronger motion and impact readability.
- Reduced distant animation profile.

# 18. Arthropods, Spiders, Hexapods and Crustaceans

## 18.1 Spider Family

The initial spider should validate:

- Eight-leg body plan.
- Leg bank naming.
- Procedural alternating gait.
- Slope and wall-climb test.
- Bite and web/spinneret anchors.
- Compact hit-region grouping.
- Medium-distance animation reduction.

## 18.2 Hexapod Family

A six-legged template should support:

- Tripod gait.
- Insect body segmentation.
- Wing extension where needed.
- Shell/chitin material family.
- Optional worker/soldier variants.

## 18.3 Crab and Scorpion Extensions

These may be P2/P3 extensions but should be anticipated through:

- Lateral gait profile.
- Claw sockets.
- Tail/stinger chain.
- Shell break regions.
- Water/shore navigation capability.

# 19. Segmented Crawlers, Serpents and Flexible Bodies

## 19.1 Giant Centipede

The giant centipede is the repeated-segment proof asset.

Required production features:

- Configurable segment count.
- One leg pair per selected segment.
- Taper toward tail.
- Segment material and armour variation.
- Travelling-wave gait.
- Region grouping to avoid one hitbox per segment.
- LOD segment reduction or simplified distant body.
- Deterministic regeneration from source parameters.

## 19.2 Serpents and Worms

A serpent family should support:

- Head, flexible chain and tail.
- Ground slither.
- Swim variant.
- Optional burrow entry/exit.
- Coil or strike pose.
- Simplified collision chain.

## 19.3 Long Dragon Chains

Dragon necks and tails should reuse chain technology while retaining authored hero motion where required.

# 20. Birds, Bats and Other Flying Creatures

## 20.1 Bird Family

Required bird states:

- Ground idle.
- Hop or walk.
- Take-off.
- Flap flight.
- Glide.
- Bank/turn.
- Landing.
- Perch.
- Flee.

## 20.2 Wing Readability

Wing models must be reviewed:

- Fully folded.
- Partially open.
- Full extension.
- Downstroke and upstroke.
- At medium LOD distance.
- Against sky and terrain.

## 20.3 Bat and Multi-Wing Extensions

The body-plan system should allow:

- Bat wing-arm topology.
- Four-winged magical creatures.
- Winged humanoids.
- Hovering or insect-flight profiles.

# 21. Dragons, Wyverns and Colossal Flying Bosses

## 21.1 Dragon Test Boss

The dragon test boss should prove the maximum complexity expected in the initial Forge without becoming final-game content.

Required source:

- Modular torso, head, jaw, neck chain, four legs, two wings and tail chain.
- Horn, claw, scale and membrane materials.
- Breath and projectile anchors.
- Rider/attachment hooks even if unused in POC.
- Target regions for head, chest, wings and tail.
- Phase-state overlays.

## 21.2 Required Motion

- Ground idle and turn.
- Walk or heavy run.
- Take-off.
- Flap and glide.
- Air turn or bank.
- Landing.
- Bite.
- Claw or stomp.
- Tail attack.
- Wing attack.
- Breath charge and release events.
- Damage, stagger and phase transition.

## 21.3 Large-Boss Performance

The dragon must define:

- Full close model.
- Medium simplified mesh and animation.
- Long-distance flight representation.
- Reduced collision regions at distance.
- Phase and damage state budgets.
- Deterministic boss-card capture.

# 22. Aquatic, Amorphous, Plant and Constructed Entities

These categories are not all POC-critical, but the production plan should preserve their needs.

## 22.1 Aquatic

- Fish and simple swimming body.
- Large aquatic serpent.
- Amphibious creature.
- Waterline and surface-breach preview.

## 22.2 Amorphous

- Slime or blob using rigid parts, voxel frames or bounded deformation.
- Floating eye or orb.
- Living flame placeholder hooks.

## 22.3 Plant and Fungal

- Animated tree or root creature.
- Mushroom creature.
- Vine or tendril chains.

## 22.4 Constructs and Golems

- Rigid-part body assembly.
- Mechanical or magical core socket.
- Replaceable limb modules.
- Clear powered/unpowered state.
- Damage and broken-part presentation.

# 23. Skeleton, Rig and Retarget Library Production

## 23.1 Initial Rig Families

- Standard humanoid.
- Small humanoid/goblin.
- Four-armed humanoid.
- Quadruped.
- Large quadruped.
- Spider.
- Hexapod.
- Segmented crawler.
- Serpent.
- Bird.
- Dragon.
- Floating entity.
- Construct/golem.

## 23.2 Rig Approval Requirements

- Semantic roles complete.
- Rest pose documented.
- Joint limits reviewed.
- Required sockets included.
- Retarget compatibility declared.
- Test clips pass.
- LOD strategy included.
- Child templates resolve without broken bindings.

## 23.3 Retarget Maps

Retarget compatibility should be classified:

| Level | Meaning |
| --- | --- |
| Exact | Same semantic skeleton and proportions within tested range. |
| Compatible | Same roles with proportion adjustment. |
| Partial | Core locomotion works; custom limbs or clips require local work. |
| Incompatible | Separate animation family required. |

# 24. Animation, Gait and Runtime State Production

## 24.1 Shared Animation Libraries

Animation libraries should be capability-based rather than tied to one named creature where possible.

Examples:

- Humanoid locomotion core.
- Humanoid work and social actions.
- One-handed melee.
- Ranged weapon use.
- Quadruped basic gait.
- Spider procedural gait.
- Centipede wave gait.
- Bird flight core.
- Dragon ground/flight core.

## 24.2 Animation Events

Named events should include only stable presentation/gameplay hooks:

```text
foot_contact.left
foot_contact.right
attack_window.begin
attack_window.end
projectile.release
breath_charge.begin
breath_release
work_contact
construction_contact
land_impact
phase_transition.commit
```

The animation does not own the authoritative gameplay result.

## 24.3 Runtime Visual States

Required reusable states may include:

- Wet.
- Burning.
- Frozen.
- Poisoned.
- Corrupted.
- Empowered.
- Injured.
- Dead.
- Sleeping.
- Alert.

## 24.4 Animation Approval

Clips must be reviewed at:

- Intended playback speed.
- Different body-frame extremes.
- Slow and fast movement rates.
- Network interpolation preview.
- Reduced animation LOD.
- Relevant terrain or flight environment.

# 25. Clothing, Armour, Equipment and Creature Fittings

## 25.1 Humanoid Equipment Production Order

1. Basic clothing.
2. Starter tool set.
3. Starter weapon and shield.
4. Basic guard armour.
5. Profession tools.
6. Mage focus and robe elements.
7. Goblin equipment family.

## 25.2 Fit Profiles

Every equipment family should define:

- Compatible body frames.
- Coverage regions.
- Attachment sockets.
- Grip profiles.
- Hide/replace body-part rules where required.
- Clipping exceptions.
- First-person representation if needed.
- Icon capture profile.

## 25.3 Creature Fittings

Future creature equipment may include:

- Saddles.
- Harnesses.
- Barding.
- Cargo frames.
- Decorative collars.
- Faction armour.
- Boss armour plates.

# 26. Variants, Damage, Age, Corruption and Boss Phases

## 26.1 Variant Layer Order

```text
Base species or blueprint
  -> body or structure family
  -> culture/biome/faction variant
  -> profession or role
  -> deterministic individual/decorative variation
  -> equipment or functional state
  -> persistent damage/age/history
  -> temporary runtime state
```

## 26.2 Variant Limits

A variant system must define:

- Allowed combinations.
- Seed channels.
- Exclusion rules.
- Required fallback.
- Icon or portrait policy.
- Runtime memory impact.
- Save persistence requirements.

## 26.3 Damage and Age

Entity damage may use:

- Material overlays.
- Voxel damage layers.
- Disabled part presentation.
- Broken equipment.
- Scars or persistent markings.

Blueprint damage may use:

- Removed or replaced blocks.
- Rubble modules.
- Burnt or cracked material states.
- Disabled doors, markers or networks.
- Repair scaffolds.

## 26.4 Boss Phases

Boss phases should prefer deltas and overlays over completely duplicated assets unless the form truly changes.

# 27. Gameplay Markers, Collision, Hit Regions and Contract Review

## 27.1 Entity Contract Checklist

- Movement collision.
- Hurt regions.
- Attack origins.
- Weak points.
- Interaction anchors.
- Vision/hearing/magic sensor origins.
- Equipment, mount and cargo sockets.
- Nameplate and health-bar anchors.
- Loot and death origins.
- Navigation capabilities.

## 27.2 Blueprint Contract Checklist

- Entrances and exits.
- Door clearance.
- NPC path anchors.
- Beds and household roles.
- Job stations.
- Guard posts.
- Storage and warehouse access.
- Item, power, fluid and mana network ports.
- Construction staging areas.
- Worldgen relational anchors.

## 27.3 Contract Baseline

Before replacing an approved asset, export the current contract baseline. The Forge should report added, moved, removed or renamed roles. Critical differences block approval until explicitly classified.

# 28. Icons, Portraits, Codex Images and Blueprint Thumbnails

## 28.1 Capture Products

| Content | Required Capture |
| --- | --- |
| Player/NPC | Character portrait and optional full-body preview. |
| Equipment | Inventory icon and optional equipped preview. |
| Creature | Codex portrait or full-body icon. |
| Boss | Boss card and codex image. |
| Blueprint | Elevated miniature thumbnail and optional construction-state thumbnail. |
| Structure marker | Map/icon representation where needed. |

## 28.2 Capture Rules

- Use deterministic camera and lighting profiles.
- Support transparent backgrounds.
- Frame by semantic focus anchors.
- Select approved animation pose or runtime state.
- Regenerate live-linked captures after source changes.
- Flag locked captures that no longer match the source.
- Validate readability at final UI size.

## 28.3 Batch Generation

Production batches should regenerate all affected captures after:

- Model changes.
- Material changes.
- Proportion changes.
- Blueprint footprint changes.
- Major state or phase changes.

# 29. Entity Performance, LOD and Crowd Readiness

## 29.1 Review Categories

- Visible voxel surface count.
- Material count.
- Animated part/bone count.
- Procedural solver cost.
- Collision and hit-region count.
- Transparent/emissive surface count.
- Variant memory cost.
- Crowd repetition count.
- Capture render cost.

## 29.2 LOD Expectations

Entities should define independent levels for:

- Render mesh.
- Rig/bone complexity.
- Animation update rate.
- Procedural IK/gait.
- Hit-region detail.
- Marker/sensor detail.
- Shadow complexity.

## 29.3 Crowd Tests

NPC and common-creature families must be tested in representative groups, not only one at a time. The POC should test:

- Forest Hamlet resident group.
- Goblin raid group.
- Livestock pen.
- Multiple spiders in a cave.
- One large boss plus support creatures if relevant.

# 30. Blueprint Audit and Migration Scope

## 30.1 Blueprint Categories

- Player building.
- NPC home.
- Village service building.
- Village project.
- Road and bridge.
- Farm and field.
- Workshop and factory.
- Defence structure.
- Magic structure.
- Ruin.
- Dungeon or mine.
- Enemy camp.
- Creature nest.
- Portal or realm gate.
- Boss arena.
- Megastructure.

## 30.2 Migration Completeness

A blueprint migration must include more than the visible blocks. It must reconcile:

- Physical composition.
- Nested modules.
- Material roles.
- Semantic markers.
- Networks.
- Construction stages.
- Upgrade paths.
- Damage/repair states.
- Placement profile.
- Thumbnail and map representation.
- Dependent project recipes and village logic.

## 30.3 Blueprint Identity

Where a legacy structure has a stable blueprint ID, the new Forge blueprint should normally replace its presentation and semantic source under the same ID. A new ID is required when function, footprint or identity materially differs.

# 31. Blueprint Modules, Semantic Layers and Material Roles

## 31.1 Early Reusable Modules

- Door assembly.
- Window assembly.
- Roof corner and ridge set.
- Stair and railing set.
- Bed and household cluster.
- Workstation cluster.
- Storage cluster.
- Guard-post cluster.
- Wall and gate segment.
- Bridge span and support.
- Construction scaffold set.
- Damage/rubble modules.

## 31.2 Semantic Layers

```text
Physical Blocks
Forge Asset Placements
Navigation
Household and NPC
Jobs and Work
Storage and Inventory
Automation and Logistics
Power
Mana and Wards
Construction Stages
Damage and Repair
World Generation
Decoration
```

## 31.3 Material Roles

Blueprints should avoid hard-coding every material when a functional role is sufficient. Culture and biome palettes can replace roles without changing marker or stage logic.

# 32. Construction Stages, Upgrades and Project Migration

## 32.1 Standard Construction Stages

```text
Stage 0 - Site and foundation preparation
Stage 1 - Foundation
Stage 2 - Structural frame
Stage 3 - Walls and primary access
Stage 4 - Roof and enclosure
Stage 5 - Interior function
Stage 6 - Equipment and networks
Stage 7 - Decoration and completion
```

Blueprints may use fewer or more stages, but each stage must be reachable, valid and visually meaningful.

## 32.2 Project Recipe Mapping

Each construction profile should map:

- Required resource/project recipe.
- Elements activated or placed.
- Builder access points.
- Temporary scaffolds or supply crates.
- Functional markers enabled.
- Collision/navigation updates.
- Completion events.

## 32.3 Upgrade Deltas

An upgrade should store the difference from its parent where practical:

- Added/removed blocks.
- Material replacements.
- New rooms or modules.
- Moved markers.
- New storage or jobs.
- New automation/mana connections.
- New defence positions.

# 33. Culture, Biome and Settlement Blueprint Variants

## 33.1 Initial Variant Priority

For the POC, prioritise one Forest Hamlet human/culture palette and only those biome adaptations needed for the valley. Additional culture sets should follow after the base structure kit is complete.

## 33.2 Variant Layers

- Material-role palette.
- Roof profile.
- Decorative trim.
- Door/window modules.
- Culture markers or banners.
- Heating/weather adaptation.
- Foundation/terrain adaptation.
- Magical infrastructure variant.

## 33.3 Functional Consistency

Culture variants may change appearance and some specialised function, but shared jobs, beds, doors and network roles must remain semantically compatible unless a distinct blueprint family is intentionally created.

# 34. Damage, Occupation, Corruption, Repair and Restoration

## 34.1 Required POC Structure States

- Intact.
- Under construction.
- Lightly damaged.
- Heavily damaged or partially ruined.
- Repaired.
- Optional goblin occupied/corrupted state where relevant.

## 34.2 State Delta Rules

Dynamic states should define:

- Physical element changes.
- Marker availability.
- Network availability.
- Navigation changes.
- Visual overlays.
- Repair resources.
- Save-state mapping.

## 34.3 Restoration

Restoration is not simply loading the pristine blueprint. It may preserve historical evidence, repaired materials, memorial elements or changed ownership depending on gameplay design.

# 35. World-Generation Placement and Terrain Adaptation

## 35.1 Placement Review

Each worldgen blueprint should validate:

- Biome and region tags.
- Slope and elevation range.
- Water requirements.
- Road, river, village or ruin relations.
- Orientation rules.
- Clearance volume.
- Terrain adaptation mode.
- Retry and fallback policy.
- Seed channels.

## 35.2 Terrain Adaptation

Allowed approaches include:

- Fixed foundation cut/fill.
- Pillar or stilt supports.
- Adjustable foundation modules.
- Terrain-following paths.
- Bridge span selection.
- Entrance elevation adjustment.

## 35.3 Required Structure Guarantees

Progression-critical structures need validated fallback generation rather than hoping random placement succeeds.

# 36. Structure Production Batches and Building Completion

## 36.1 POC Batch Order

1. Shared construction materials and modules.
2. Cottage.
3. Warehouse.
4. Workshop.
5. Watchtower.
6. Bridge/crossing.
7. Goblin camp.
8. Rune ruin.
9. Roads, paths and environment dressing integration.

## 36.2 Building Readiness Gate

A building is ready to use in settlement production only when:

- Exterior kit is complete.
- Interior access is functional.
- Required props exist.
- Markers validate.
- Construction stages validate.
- Damage state exists if required.
- Thumbnail exists.
- Material role substitutions pass.
- NPC use is tested.
- No one-off emergency placeholder is hiding a missing family asset.

## 36.3 No One-Off Rescue Assets

If a building requires a new door, window, roof or storage piece, determine whether it belongs in a reusable family before creating it only inside that blueprint.

# 37. Forest Hamlet Vertical Slice Production Register

## 37.1 Critical Entity Groups

| Group | Required Content | Priority |
| --- | --- | --- |
| Player | Standard humanoid, starter clothing, tools and weapon. | P0 |
| Villagers | Elder, builder, farmer, guard, merchant, mage, miner, lumberjack. | P0/P1 |
| Livestock | Domestic pig and simple pen population. | P1 |
| Cave threat | Spider and optional crystal crawler extension. | P1 |
| Segmented test | Giant centipede test creature. | P2 |
| Flying ecology | Small bird. | P2 |
| Raid faction | Goblin scout, raider, brute and captain. | P1 |
| Magic ecology | Wisp or simple floating magical entity. | P1/P2 |
| Boss test | Dragon test rig and presentation scenario. | P2 |

## 37.2 Critical Blueprint Groups

| Group | Required Content | Priority |
| --- | --- | --- |
| Village homes | Cottage and household markers. | P0 |
| Supply | Warehouse and delivery/storage roles. | P0 |
| Production | Workshop and workstation roles. | P1 |
| Defence | Watchtower with stages, guard posts and damage. | P0 |
| Route | Bridge/crossing and path anchors. | P1 |
| Threat source | Goblin camp with raid-source markers. | P1 |
| Magic discovery | Rune ruin with mana/interaction markers. | P1 |
| Village composition | Roads, paths, signs and limited dressing. | P1 |

## 37.3 Slice Acceptance

The slice is accepted when the player can:

- Spawn with the approved humanoid presentation.
- Meet visually distinct persistent villagers.
- See livestock and wildlife move believably.
- Encounter cave and raid threats with readable silhouettes.
- Supply a warehouse.
- Watch the watchtower progress through visible stages.
- See NPCs use doors, jobs, storage and guard positions.
- Experience a raid outcome affected by completed structures.
- Discover a rune ruin and magical entity.
- Reload the world with identities, stages and appearances preserved.

# 38. End-to-End Entity Migration Workflow

## 38.1 Standard Workflow

1. Select stable entity ID from the migration inventory.
2. Capture current source, runtime presentation and contract baseline.
3. Classify retain, polish, rebuild, split, merge or defer.
4. Select or create approved body-plan template.
5. Create editable voxel model and materials.
6. Assign rig, joints, sockets and semantic roles.
7. Add required animation/gait and runtime states.
8. Map equipment, customisation and deterministic variants.
9. Validate collision, hit regions, anchors and navigation capabilities.
10. Generate icons, portraits or codex captures.
11. Bake runtime products and LODs.
12. Run Test Laboratory scenarios.
13. Compare contract against legacy baseline.
14. Create migration/alias record if required.
15. Test in a copy of an existing save or representative runtime state.
16. Approve and package.
17. Keep legacy fallback until batch release passes.

## 38.2 Fast Polish Workflow

For assets classified as Polish:

1. Edit as visual source override.
2. Preserve body graph, rig and contract.
3. Revalidate material, silhouette and icon.
4. Rebake affected products.
5. Run targeted regression tests.

## 38.3 Family Workflow

Create the parent template and one golden child first. Only after approval should the rest of the family be generated or duplicated.

# 39. End-to-End Blueprint Migration Workflow

1. Select stable blueprint ID.
2. Capture current physical volume, markers, networks and placement rules.
3. Import or reconstruct the physical structure in Blueprint Forge.
4. Replace legacy assets with approved Forge blocks, props and modules.
5. Convert hard-coded materials to roles where appropriate.
6. Add or verify semantic layers.
7. Rebuild construction and upgrade stages as deltas.
8. Add damage, repair and occupation states.
9. Validate doors, paths, jobs, storage and networks.
10. Validate terrain adaptation and worldgen fallback.
11. Generate thumbnail/map capture.
12. Compare footprint and semantic contract.
13. Test village/project/worldgen integrations.
14. Package and approve.
15. Retain legacy blueprint as fallback until release migration passes.

# 40. Forge Test Laboratory and In-World QA

## 40.1 Entity Scenarios

- Neutral studio and silhouette.
- Day/night environment.
- Doorway/stair/obstacle course.
- Uneven terrain and slopes.
- Water/swim test.
- Flight volume and landing/perch test.
- Combat target and attack-anchor test.
- Equipment combination matrix.
- Crowd/repetition test.
- LOD transition test.

## 40.2 Blueprint Scenarios

- NPC entrance and room access.
- Bed and workstation reachability.
- Guard route and defensive-position access.
- Storage delivery route.
- Item, power and mana network validation.
- Construction stage scrub and builder access.
- Damage/repair transition.
- Terrain and water placement.
- Worldgen relational placement.
- Streaming and repeated-placement test.

## 40.3 In-World Review Scenes

At minimum:

- Forest Hamlet daylight.
- Forest Hamlet night and lantern lighting.
- Cave.
- Goblin raid.
- Watchtower construction.
- Rune ruin/mana lighting.
- Creature flight area.
- Existing-save migration copy.

# 41. Review, Feedback, Approval and Revision Control

## 41.1 Review Roles

| Role | Responsibility |
| --- | --- |
| Creative owner | Confirms identity, style and priority. |
| Forge/content author | Creates and documents source. |
| Gameplay reviewer | Reviews contracts, markers and system integration. |
| Technical reviewer | Reviews source integrity, bake, performance and migration. |
| QA reviewer | Runs scenarios and regression tests. |
| Final approver | Promotes content to Approved or Release Ready. |

## 41.2 Feedback Format

Feedback should identify:

- Asset/blueprint ID and revision.
- Context and screenshot or scenario.
- Category: silhouette, material, animation, contract, performance, migration or UI.
- Severity.
- Expected result.
- Whether approval is blocked.

## 41.3 Revision History

The Forge should retain:

- Approved revision.
- Current draft revision.
- Change summary.
- Before/after previews.
- Contract diff.
- Review notes.
- Revert point.

# 42. Version Control, Packaging, Provenance and Release Records

## 42.1 Commit Boundaries

Prefer commits that contain one family or one blueprint batch. Avoid combining unrelated model, rig, animation and gameplay changes unless required by one migration.

## 42.2 Package Contents

A release package should contain:

```text
Source references and revision hashes
Approved presentation definitions
Generated runtime products
Icons, portraits and thumbnails
Dependency manifest
Contract versions
Migration and alias records
Validation report
Performance report
Change log
Credits/licence metadata
Rollback instructions
```

## 42.3 Provenance

Every source should record:

- Author or generating tool.
- Creation date/revision.
- Parent template.
- Imported source references if any.
- AI-assisted changes requiring review.
- Licence or ownership notes.

# 43. Legacy Fallback, Deprecation and Removal

## 43.1 Legacy Strategy

Legacy content remains available through explicit aliases or fallback packages until:

- Replacement is approved.
- New runtime products load correctly.
- Existing save migration passes.
- Dependent references resolve.
- Rollback has been tested.

## 43.2 Deprecation Sequence

1. Mark legacy asset deprecated.
2. Stop creating new references.
3. Redirect new content to replacement.
4. Migrate existing definitions and test saves.
5. Retain fallback for at least one controlled release cycle.
6. Confirm no active references.
7. Archive or remove.

## 43.3 Removal Blockers

Do not remove legacy content while any of the following remain:

- Unmigrated save references.
- Quest, spawn or village references.
- Blueprint dependencies.
- Missing replacement LOD or icon.
- Unresolved contract migration.
- Failed rollback test.

# 44. Risks, Redesign Triggers and Contingencies

## 44.1 Risk Register

| Risk | Warning Signal | Response |
| --- | --- | --- |
| Too many one-off rigs | Every creature needs custom animation. | Improve semantic template or retarget strategy. |
| Voxel density inconsistency | Assets look from different games. | Enforce density bands and golden references. |
| Procedural gait instability | Feet slide or explode on terrain. | Reduce solver scope, add limits and fallback clips. |
| Variant explosion | Too many combinations to test. | Bound variant channels and approve curated sets. |
| Contract drift | Visual edits break hitboxes or paths. | Require baseline diff before approval. |
| Blueprint one-off growth | Every building needs custom modules. | Expand reusable kit before more buildings. |
| Icon inconsistency | Inventory/codex views use different framing. | Centralise capture profiles and batch regeneration. |
| Performance regression | Crowds or large bosses exceed budgets. | Introduce LOD earlier and profile representative groups. |
| Save migration failure | Named NPCs or structures lose identity. | Keep fallback, improve aliases and add migration tests. |
| Forge workflow too slow | Content authors bypass source system. | Improve templates, batch tools and preview speed. |

## 44.2 Redesign Triggers

Redesign a foundation when:

- More than a small minority of child assets require the same workaround.
- A semantic role cannot represent common content cleanly.
- A template change repeatedly breaks dependent assets.
- Production requires manual steps that cannot be validated or reproduced.
- Runtime cost scales badly with common crowds or structures.
- Existing-save migration cannot be made reliable.

## 44.3 Contingency Rules

- Preserve source and last approved products.
- Allow rollback to legacy fallback.
- Freeze new child production while a shared foundation is repaired.
- Prefer local compatibility adapters over rewriting unrelated systems.
- Record architecture decisions and migration consequences.

# 45. Staged Production and Migration Roadmap

## Stage 0 - Audit, Registries and Visual Baselines

Deliverables:

- Complete entity and blueprint inventory.
- Current-state captures.
- Contract baselines.
- Priority/backlog classification.
- Legacy fallback register.
- Golden reference boards.

Exit gate:

- Every P0/P1 entity and blueprint has a migration record.

## Stage 1 - Shared Materials, Density Standards and Golden Templates

Deliverables:

- Entity material DNA families.
- Blueprint material-role library.
- Standard voxel density profiles.
- Golden humanoid, quadruped and cottage templates.
- Shared semantic role catalogue.

Exit gate:

- Templates can be duplicated and validated without manual repair.

## Stage 2 - Player Humanoid and Starter Equipment

Deliverables:

- Player base body and head system.
- Standard humanoid rig and locomotion.
- Starter clothing, tools and weapon.
- First/third-person profiles.
- Character icon/portrait capture.

Exit gate:

- Player passes movement, equipment, camera, save and network preview tests.

## Stage 3 - Forest Hamlet NPC Population

Deliverables:

- Core eight professions.
- Deterministic appearance generation.
- Profession equipment and work animations.
- Dialogue portraits.
- Crowd LOD profile.

Exit gate:

- Named NPCs persist correctly and remain visually distinct in village scenes.

## Stage 4 - Core Creatures and Raid Family

Deliverables:

- Pig.
- Spider.
- Goblin family and captain.
- Wisp or floating magical entity.
- Shared quadruped, spider and small-humanoid foundations.

Exit gate:

- Livestock, cave and raid scenarios pass.

## Stage 5 - Advanced Body-Plan Proofs

Deliverables:

- Giant centipede.
- Bird.
- Four-armed humanoid extension.
- Dragon test boss.

Exit gate:

- Repeated segments, flight, extra limbs, boss regions and LOD pass.

## Stage 6 - Blueprint Forge Core Buildings

Deliverables:

- Cottage.
- Warehouse.
- Workshop.
- Shared door, roof, household, storage and work modules.
- Material roles and thumbnails.

Exit gate:

- NPCs can live, work and deliver through migrated blueprints.

## Stage 7 - Watchtower, Bridge, Camp and Rune Ruin

Deliverables:

- Watchtower stages and damage states.
- Bridge terrain adaptation.
- Goblin camp raid-source roles.
- Rune ruin mana/interaction roles.

Exit gate:

- Project, raid, worldgen and magic-discovery scenarios pass.

## Stage 8 - Full Slice Integration and Legacy Deprecation

Deliverables:

- Complete Forest Hamlet scene.
- Icon/codex/thumbnail refresh.
- Crowd and performance passes.
- Existing-save migration.
- Release package and rollback package.

Exit gate:

- POC acceptance matrix passes and legacy P0/P1 content can be deprecated safely.

## Stage 9 - Post-POC Family Expansion

Deliverables:

- Additional cultures, animals, monsters and structures.
- Improved variant families.
- Extended equipment and blueprint kits.
- Production health metrics.

# 46. Definition of Done and Acceptance Matrix

## 46.1 Entity Acceptance

| Requirement | POC Approved | Production |
| --- | --- | --- |
| Editable voxel source | Required | Required |
| Stable ID and contract version | Required | Required |
| Approved model/material | Required | Required |
| Required rig/animation | Required | Required |
| Gameplay markers/regions | Required | Required |
| Icon/portrait/codex capture | Required where used | Required where used |
| LOD/performance profile | Basic required | Full required |
| Migration/fallback record | Required for replacement | Required |
| Test Laboratory pass | Required | Required |
| Existing-save test | Required for persistent content | Required |

## 46.2 Blueprint Acceptance

| Requirement | POC Approved | Production |
| --- | --- | --- |
| Editable semantic voxel blueprint | Required | Required |
| Physical and material-role completeness | Required | Required |
| Required markers and networks | Required | Required |
| Construction stages | Required for projects | Required where applicable |
| Damage/repair state | Watchtower/camp required | Required where applicable |
| Placement profile | Worldgen structures required | Required |
| Thumbnail/map capture | Required | Required |
| NPC/navigation validation | Required | Required |
| Performance/streaming profile | Basic required | Full required |
| Migration/fallback record | Required for replacement | Required |

## 46.3 Set 22 Migration Acceptance

Document Set 22 migration is successful when:

- The unified Forge is the authoritative authoring route for entity and blueprint content.
- All P0/P1 Forest Hamlet entities and blueprints are approved or have explicit deferred fallbacks.
- Player, NPC, livestock, raid, cave, magic and boss test body plans are proven.
- Buildings are authored with semantic layers and construction-aware blueprints.
- Live capture produces consistent icons, portraits and thumbnails.
- Existing saves retain persistent NPC and structure identity.
- Performance targets pass in representative crowds, raids and village scenes.
- Legacy content can be rolled back and later removed safely.

# 47. Continuous Production After the Initial Migration

## 47.1 New Entity Intake

Every new entity should begin with:

- Gameplay purpose.
- Body-plan family.
- Required capabilities.
- Variant scope.
- Contract needs.
- POC/final priority.
- Reuse analysis.

## 47.2 New Blueprint Intake

Every new blueprint should begin with:

- Structure purpose.
- Blueprint family.
- Module reuse plan.
- Material roles.
- Required semantic layers.
- Construction/damage/worldgen requirements.
- Production priority.

## 47.3 Family Expansion

Before adding a child asset, review whether the parent template, rig, animation or module needs a general improvement. Improvements should not be pushed into one child if they will recur elsewhere.

## 47.4 Periodic Health Review

At milestones, review:

- Unapproved drafts.
- Missing icons/thumbnails.
- Stale generated products.
- Broken dependencies.
- Overused fallback assets.
- Variant counts.
- Performance regressions.
- Legacy content still present.
- Template workarounds.

# 48. Open Decisions for Later Planning

- Final playable humanoid peoples included in the first public release.
- Exact player body-frame range and character-creation options.
- Final facial-expression depth.
- Whether individual boss limbs can be severed or only disabled.
- Full mount and vehicle scope.
- Public player-facing Entity Forge restrictions.
- Public blueprint sharing and moderation.
- Final Audio Forge architecture.
- Final VFX/Particle Forge architecture.
- Cinematic and promotional render pipeline.
- Long-distance impostor strategy for very large flying creatures.
- Final content budgets for target hardware after POC profiling.

# Appendix A. Entity Migration Record Template

```text
Entity ID:
Display Name:
Category:
Family/Parent:
Priority:
Lifecycle State:
Current Source:
Current Runtime Product:
Current Contract Version:
Current Icon/Portrait:

Audit Classification:
- Retain / Polish / Rebuild / Split / Merge / Defer / Remove

Required Representations:
- Model:
- Materials:
- Rig:
- Animation:
- Equipment Fit:
- Gameplay Contract:
- Icons/Codex:
- LOD:

Migration Class:
- Cosmetic / Presentation-Spatial / Gameplay-Spatial / Semantic / Identity

Dependencies:
Dependents:
Legacy Fallback:
Replacement Source:
Alias/Migration Rule:
Existing-Save Test:
Validation Scenarios:
Performance Target:
Review Notes:
Approved Revision:
Removal Gate:
```

# Appendix B. Blueprint Migration Record Template

```text
Blueprint ID:
Display Name:
Category:
Family/Parent:
Priority:
Lifecycle State:
Current Source:
Current Footprint:
Current Contract Version:
Current Thumbnail:

Audit Classification:
- Retain / Polish / Rebuild / Split / Merge / Defer / Remove

Required Layers:
- Physical:
- Forge Assets:
- Navigation:
- NPC/Household/Jobs:
- Storage:
- Automation/Power/Mana:
- Construction:
- Damage/Repair:
- World Generation:

Material Roles:
Nested Modules:
Construction Profile:
Upgrade Profiles:
Dynamic State Profiles:
Placement Profile:
Dependencies:
Dependents:
Legacy Fallback:
Migration/Alias Rule:
Existing-Save Test:
Validation Scenarios:
Performance Target:
Review Notes:
Approved Revision:
Removal Gate:
```

# Appendix C. Initial Entity Production Backlog

## C.1 P0 Foundations

| Asset | Required Proof |
| --- | --- |
| Standard player humanoid | Body, rig, locomotion, equipment, first/third person, portrait. |
| Starter clothing set | Fit, coverage, palette and icon. |
| Starter tool/weapon set | Grip, swing/release events and icons. |
| Standard NPC humanoid | Persistent appearance and profession layering. |
| Goblin small humanoid | Retarget compatibility and hostile equipment. |

## C.2 P1 Forest Hamlet Entities

| Asset | Required Proof |
| --- | --- |
| Elder | Distinct silhouette, portrait and dialogue anchor. |
| Builder | Tool, carry and construction action. |
| Farmer | Farm tool and work silhouette. |
| Guard | Armour, weapon, patrol and combat. |
| Merchant | Trade silhouette and carrying props. |
| Mage | Focus, magical state and portrait. |
| Miner | Pickaxe, helmet/light and mining action. |
| Lumberjack | Axe and chopping action. |
| Domestic pig | Quadruped gait, eat, flee, pen crowd. |
| Spider | Eight-leg gait, climb, bite and cave LOD. |
| Goblin raider family | Scout, melee, ranged, brute and captain. |
| Wisp | Floating motion, mana material and codex capture. |

## C.3 P2 Body-Plan Proofs

| Asset | Required Proof |
| --- | --- |
| Giant centipede | Segment generation, wave gait, grouped regions and LOD. |
| Bird | Take-off, flight, landing and perch. |
| Four-armed humanoid | Extra limbs, sockets and animation layering. |
| Dragon test boss | Ground/flight, regions, phases, boss card and performance. |

# Appendix D. Initial Blueprint Production Backlog

| Blueprint | Required Proof | Priority |
| --- | --- | --- |
| Forest cottage | Household, door, bed, material roles and thumbnail. | P0 |
| Village warehouse | Storage access, delivery, reservation and automation hooks. | P0 |
| Watchtower | Construction stages, guard posts, damage and raid readiness. | P0 |
| Workshop | Workstation markers, storage and interior access. | P1 |
| Bridge/crossing | Terrain adaptation, pathing and worldgen relation. | P1 |
| Goblin camp | Spawn, patrol, storage and raid-source markers. | P1 |
| Rune ruin | Mana, interaction, damage and relational placement. | P1 |
| Road/path module | Connectors, terrain follow and village integration. | P1 |
| Farm/pen module | Livestock access, fence/gate and work markers. | P1/P2 |

# Appendix E. Template and Family Readiness Checklists

## E.1 Entity Template

- [ ] Stable template ID.
- [ ] Voxel density profile.
- [ ] Body-plan graph.
- [ ] Scale range.
- [ ] Rig roles.
- [ ] Default joints and limits.
- [ ] Required sockets.
- [ ] Collision/region suggestions.
- [ ] Compatible animation/gait families.
- [ ] LOD grouping.
- [ ] Golden child asset.
- [ ] Validation scenarios.
- [ ] Extension guide.

## E.2 Blueprint Family

- [ ] Stable family ID.
- [ ] Shared bounds/origin rules.
- [ ] Material roles.
- [ ] Nested module catalogue.
- [ ] Required semantic layers.
- [ ] Construction-stage convention.
- [ ] Upgrade-delta convention.
- [ ] Damage/repair state convention.
- [ ] Placement profile convention.
- [ ] Golden blueprint.
- [ ] Validation scenarios.
- [ ] Culture/biome extension guide.

# Appendix F. Entity Review Scorecard

| Category | 1 - Fails | 3 - Acceptable | 5 - Excellent |
| --- | --- | --- | --- |
| Voxel identity | Looks imported or inconsistent. | Clearly voxel and coherent. | Strong distinctive voxel language. |
| Silhouette | Unclear at gameplay distance. | Recognisable. | Immediately readable in pose and motion. |
| Scale | Conflicts with world or function. | Fits expected contexts. | Feels natural across all tested contexts. |
| Materials | Noisy or unrelated. | Coherent with shared material DNA. | Rich, readable and state-aware. |
| Motion | Sliding, clipping or wrong body feel. | Functional and believable. | Expressive, distinctive and robust. |
| Contract | Missing or inaccurate roles. | Required roles resolve. | Roles are clear, well-positioned and reusable. |
| Variants | Random, repetitive or unstable. | Bounded and deterministic. | Distinct without losing family identity. |
| UI capture | Poor framing/readability. | Clear at UI size. | Strong, consistent and iconic. |
| Performance | Exceeds budget. | Meets target. | Efficient with graceful LOD. |
| Migration | Breaks references or saves. | Compatible. | Clean aliases, rollback and evidence. |

# Appendix G. Blueprint Review Scorecard

| Category | 1 - Fails | 3 - Acceptable | 5 - Excellent |
| --- | --- | --- | --- |
| Silhouette | No clear purpose or identity. | Reads correctly. | Strong landmark and cultural identity. |
| Kit coherence | One-off and inconsistent. | Uses shared kit. | Reuses kit while remaining distinctive. |
| Access/pathing | NPCs cannot use it. | Required paths work. | Routes are natural, redundant and clear. |
| Semantic layers | Missing or invalid markers. | Required roles resolve. | Layers are organised and extensible. |
| Construction | Stages are broken or meaningless. | Stages function. | Stages are readable and narratively satisfying. |
| Networks | Broken or hidden connections. | Required networks connect. | Connections are readable and maintainable. |
| Dynamic states | Duplicated or incomplete. | Required states work. | Damage, repair and occupation tell history. |
| Placement | Fails on common terrain. | Valid with fallback. | Adapts naturally across intended contexts. |
| Thumbnail | Unclear or inconsistent. | Clear at UI size. | Distinctive and informative. |
| Performance | Too expensive or dense. | Meets target. | Efficient modules and streaming behaviour. |

# Appendix H. Batch Release Checklist

- [ ] Batch purpose and scope recorded.
- [ ] All stable IDs validated.
- [ ] Source revisions committed.
- [ ] Dependency graph clean.
- [ ] Required representations approved.
- [ ] Contract diffs reviewed.
- [ ] Icons/portraits/thumbnails regenerated.
- [ ] Runtime products baked and hash-verified.
- [ ] Test Laboratory scenarios pass.
- [ ] In-world review passes.
- [ ] Performance/crowd/streaming tests pass.
- [ ] Existing-save migration passes where applicable.
- [ ] Legacy fallback package exists.
- [ ] Rollback procedure tested.
- [ ] Validation and migration reports attached.
- [ ] Release manifest updated.

# Appendix I. Legacy Removal Checklist

- [ ] Replacement is Release Ready.
- [ ] No new references target legacy ID/source.
- [ ] All dependent definitions migrated.
- [ ] Existing saves tested.
- [ ] Alias/migration record approved.
- [ ] Fallback retained through required release window.
- [ ] Rollback test completed.
- [ ] No active blueprint, quest, spawn or equipment references.
- [ ] Generated products and icons no longer required.
- [ ] Archive policy applied.
- [ ] Removal recorded in change log.

# Appendix J. Explicit Deferrals

The following are intentionally outside Document Set 22 version 0.1:

- Full Audio Forge authoring and mixing.
- Full VFX/Particle Forge authoring.
- Final cinematic sequencer and trailer capture tools.
- Advanced facial speech/lip-sync production.
- Full cloth, hair, fur and feather physics.
- Public player-facing unrestricted entity authoring.
- Public blueprint marketplace, moderation and distribution.
- Final console-specific performance budgets.
- All final races, dimensions, bosses and culture packs.
- Destructible anatomy for every creature.
- Realm-scale megastructure production.

The current Forge should retain only stable named event hooks, sockets, emission/light references and packaging fields required for those future modules to attach without redesigning existing source.

# Glossary

| Term | Meaning |
| --- | --- |
| Migration Record | Versioned document tracking how a stable entity or blueprint moves from current content to Forge content. |
| Contract Baseline | Snapshot of collision, regions, anchors, markers, networks or placement semantics before replacement. |
| Golden Template | Approved reusable source demonstrating correct scale, roles, workflow and validation. |
| Entity Family | Related presentation definitions sharing body plan, rig, material or animation foundations. |
| Blueprint Family | Related structures sharing modules, roles, stages or upgrade lineage. |
| Representation Readiness | Separate approval status for model, rig, animation, icon, LOD or other required output. |
| Material DNA | Reusable voxel surface identity controlling palette, pattern and state behaviour. |
| Material Role | Semantic blueprint slot resolved to a culture/biome-specific material. |
| Construction Delta | Changes that transform one blueprint construction or upgrade stage into another. |
| Contract Migration | Explicit compatibility mapping required after gameplay-spatial or semantic changes. |
| Legacy Fallback | Prior approved presentation retained for rollback or old-save recovery. |
| Release Ready | Approved, packaged, migrated and tested content included in a release manifest. |
| Live Capture | Deterministic icon, portrait or thumbnail rendered directly from a Forge preview. |
| Family Batch | Reviewable production unit containing related assets and shared foundations. |
| Forest Hamlet Slice | First integrated vertical slice used to prove Leyforge's player, NPC, creature, village, automation, magic and raid presentation. |
