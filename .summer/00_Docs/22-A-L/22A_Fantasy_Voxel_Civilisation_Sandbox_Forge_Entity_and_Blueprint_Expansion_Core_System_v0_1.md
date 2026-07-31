# Fantasy Voxel Civilisation Sandbox
## 22A - Forge Entity and Blueprint Expansion
### Vision, Scope and Core Rules
**Version 0.1 - Detailed Design Bible Draft**

A voxel-only expansion of the Leyforge Forge for creating, editing, overriding, validating and baking player characters, humanoid NPCs, animals, multi-limbed creatures, flying creatures, monsters, bosses and semantic building or structure blueprints from editable voxel source data.

## Forge Entity and Blueprint Expansion System Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the vision, identity, boundaries and governing rules for the Entity Forge and Blueprint Forge, including voxel-only source requirements, supported body plans, icon capture, blueprint integration, manifests, dependencies, lifecycle, validation, packaging and MVP scope. |
| Core Philosophy | Extend the existing Voxel Asset Forge into a unified voxel-development environment without turning it into an unrestricted conventional 3D modeller or allowing presentation tools to own gameplay truth. |
| Forge Structure | The Forge contains three connected workspaces: Asset Forge, Entity Forge and Blueprint Forge. They share voxel materials, stable IDs, overrides, icons, animation data, validation and packaging. |
| Voxel Direction | Every model authored in the Forge is voxel-based. Source geometry remains editable voxel data even when runtime outputs are merged, simplified, instanced or baked into conventional render meshes for performance. |
| Entity Direction | Support player characters, humanoid NPCs, animals, livestock, quadrupeds, arthropods, segmented crawlers, serpents, birds, bats, flying creatures, dragons, constructed beings, monsters and bosses. |
| Body Architecture | Use reusable templates backed by flexible body-plan graphs, configurable limb and segment counts, named body parts, sockets, damage regions and custom rigs. |
| Animation Direction | Use a hybrid stack of rigid-part or skeletal animation, procedural gait and terrain adaptation, optional voxel-frame changes, animated materials and named animation events. |
| Blueprint Direction | Merge the existing building and structure Blueprint Designer into the Forge as a semantic authoring workspace for blocks, props, machines, NPC markers, navigation, construction stages, variants, damage, world generation and upgrades. |
| Icon Direction | Any asset requiring an icon may generate it from a live Forge preview using saved camera, lighting, background, state and variant settings. |
| Override Direction | Authorised developers may replace entity models, rigs, materials, icons, animations, blueprint visuals and presentation bindings while retaining stable gameplay identities unless explicitly creating a new definition. |
| Registry Direction | Every asset, body plan, rig, animation set, material, icon profile and blueprint resolves through stable IDs and explicit dependencies recorded in a Forge Project Manifest. |
| Validation Direction | Assets must pass voxel integrity, scale, readability, dependency, collision, animation, marker, blueprint-use and performance validation before approval and baking. |
| Deferred Boundary | Full audio production, music authoring and particle/VFX design software are deferred. This set preserves only lightweight named events, sockets and references so later Audio Forge and VFX Forge modules can connect without redesign. |
| Implementation Context | Godot with Summer Engine is the current implementation target. Editable source resources and baked runtime products remain separated. |
| MVP Direction | Prove one humanoid, one quadruped, one eight-legged creature, one segmented crawler, one flying creature, one dragon-scale test, one semantic building blueprint and one complete icon/validation/override pipeline. |

## Document Purpose

This document establishes the master vision and governing rules for the second major Forge expansion. Documents 21A through 21G define the Voxel Asset Forge for blocks, items, props, materials, machines, animations, overrides and visual migration. Document set 22 extends that foundation to living entities and to the structure Blueprint Designer previously planned elsewhere in Leyforge.

The purpose of this document is to lock the expanded Forge before specialised design begins. It defines what must remain voxel-based, which entity body plans the system must support, how humanoids differ from animals and monsters, how animation and procedural locomotion fit together, how blueprint authoring becomes part of the same environment, and which data remains owned by gameplay systems.

It also locks the production safeguards needed for a project of this scale: project manifests, dependency graphs, lifecycle states, revision history, reproducible procedural tools, icon capture, testing laboratories, packaging, performance limits and approval gates.

This document does not specify every modelling brush, rigging operation, procedural gait equation, Blueprint Forge panel or Godot class. Those details belong in Documents 22B through 22L. It establishes the constraints those documents must follow.

## Engine and Existing Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Documents 21A through 21G remain the active foundation for Forge-wide voxel modelling, texturing, material authoring, animation, overrides, user experience, technical implementation and visual migration. The 22-series expands those systems rather than replacing them.

## Design Sources

| Source Document | Relevant Direction | How 22A Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Leyforge uses a stylised, readable, high-fidelity fantasy voxel style. Characters, creatures, tools and machines may be more detailed than terrain without pursuing full realism. | Locks a voxel-only but visually rich entity direction and requires silhouettes, animation and materials to remain readable in the same world. |
| 03 - Blocks Registry | World blocks use stable IDs, material families, variants, states, one-metre placement and broad shape families. | Provides the physical building vocabulary consumed by Blueprint Forge and the scale anchor used by entity previews. |
| 04 - Items Registry | Items, block item forms, held objects, equipment, icons and runtime state remain separate but linked. | Requires icon capture, equipment attachment, held presentation and stable visual overrides without collapsing gameplay definitions. |
| 07 - NPC Village System | NPCs are persistent named people with jobs, homes, schedules, inventories, skills, memories and construction responsibilities. | Requires reusable humanoid templates, visible profession and culture variation, work animations, interaction markers and semantic village blueprints. |
| 10 - Creatures and Monsters | Creatures must be identifiable by silhouette, movement, habitat and behaviour, and include animals, livestock, monsters, magical beings, constructed beings and bosses. | Defines the broad entity taxonomy, readability requirements, body-plan diversity and boss presentation expectations. |
| 12 - Structures | Structures use blocks, markers, sockets, variants, ownership, damage, restoration, construction stages and world-generation rules. | Blueprint Forge becomes the official authoring environment for these semantic structure definitions. |
| 16 - Combat, Gear and Defence | Combat entities require equipment, hit regions, attack origins, defensive states, readable telegraphs and persistent aftermath. | Requires hitbox markers, equipment sockets, breakable regions, animation events and boss-part support. |
| 17 - UI/UX System | Complex tools must remain inspectable, recoverable, accessible and consistent. | Guides the unified Forge workspace, clear lifecycle states, comparison views, warnings and validation feedback. |
| 21A - Voxel Asset Forge Core System | The Forge is the code-preserving visual authoring layer and editor voxels are baked into efficient runtime outputs. | Remains the umbrella foundation for all new entity and blueprint capabilities. |
| 21B - Voxel Modelling, Texturing and Materials | Defines voxel source, material DNA, palettes, compound parts, sockets, scale and baking rules. | Supplies the shared modelling and material language for bodies, wings, limbs, props and structure assets. |
| 21C - Animation, Effects and Runtime Visual States | Defines transform animation, voxel-frame animation, material animation and state-driven presentation. | Expands this into skeletal rigs, procedural gaits, entity locomotion and animation-event timelines. |
| 21D - Overrides, Variants and Registry Integration | Defines inheritance, visual overrides, fallbacks, stable IDs and content-pack resolution. | Extends these rules to entity models, rigs, animation families, appearance variants and blueprint inheritance. |
| 21E - Forge UI/UX and Creator Workflow | Defines the Forge workspace, browsers, previews, validation and recovery. | Becomes the base interface expanded by Entity Forge, Blueprint Forge, Icon Capture Studio and Test Laboratory. |
| 21F - Forge Technical Implementation Plan | Defines editable Resources, deterministic baking, runtime products, validation and Godot implementation boundaries. | Provides the technical foundation that 22K will extend for entity rigs, animation graphs, blueprints and packaging. |
| 21G - Visual Overhaul and Asset Migration Plan | Defines production states, visual migration and review across blocks, items, props and machines. | Connects to the future entity and blueprint production backlog in 22L. |

## Static Table of Contents

- 1. Locked Forge Expansion Identity
- 2. Locked Direction Summary
- 3. Expanded Forge Architecture
- 4. Voxel-Only Source and Visual Rules
- 5. Scope and Supported Entity Families
- 6. Body Plans, Anatomy and Modular Architecture
- 7. Humanoid Player Character and NPC Direction
- 8. Creature, Mob, Monster and Boss Direction
- 9. Rigging, Animation and Locomotion Foundation
- 10. Equipment, Variants and Visual Inheritance
- 11. Gameplay and Presentation Separation
- 12. Blueprint Forge Integration
- 13. Blueprint Semantics, Construction and World States
- 14. Integrated Icon Capture Studio
- 15. Forge Project Manifest, Registries and Dependency Graph
- 16. Asset Lifecycle, Review, Revision and Approval
- 17. Procedural Tools, Seeds and Reproducibility
- 18. Forge Test Laboratory and Readability Validation
- 19. Packaging, Portability, Performance and Safety Limits
- 20. Developer Overrides, Migration and Compatibility
- 21. Deferred Audio and VFX Production Boundary
- 22. Minimum Viable Expansion Scope and Phasing
- 23. Success Criteria and Acceptance Rules
- 24. Relationships With Documents 22B-22L
- Appendix A. Unified Forge Workspace Map
- Appendix B. Entity Body-Plan Matrix
- Appendix C. Blueprint Category and Semantic-Layer Matrix
- Appendix D. Core Rule Register
- Appendix E. MVP Checklist
- Appendix F. Glossary

# 1. Locked Forge Expansion Identity

The expanded Forge is Leyforge's unified voxel-development environment. It is responsible for authoring the visual and spatial source data used by blocks, items, machines, player characters, NPCs, creatures, monsters, bosses, buildings, structures and world-generation blueprints.

It contains specialised workspaces, but those workspaces share one project manifest, one stable-ID system, one material library, one override model, one validation language and one packaging pipeline. An oak material created in Asset Forge may appear on a sword, a villager's tool, a boar pen, a watchtower and a culture-specific structure blueprint without being copied into unrelated systems.

> **Locked Rule**  
> Every visual model created by the Forge must originate from editable voxel source data. Runtime baking may merge or simplify that source, but it must not replace the voxel source of truth with an uneditable conventional mesh.

## 1.1 Core Vision

A developer should be able to create a complete content chain without leaving the Forge:

```text
Create voxel materials and parts
        -> build an entity or structure
        -> rig or configure semantic markers
        -> create animations and states
        -> capture icons and previews
        -> validate scale, readability and dependencies
        -> bake runtime products
        -> register or override
        -> test in a live Leyforge scenario
```

The Forge should make simple tasks quick and complex tasks possible. Creating a pig should begin from a quadruped template and require proportion, material and animation choices rather than a completely blank rig. Creating a dragon should allow a flexible body-plan graph, multiple limb chains, wings, tail segments, attack sockets, breakable regions and boss phases without forcing the dragon into a humanoid skeleton.

## 1.2 Forge Promise

The expanded Forge promises five things:

| Promise | Meaning |
| --- | --- |
| Voxel Authenticity | All source models remain voxel-built and editable. |
| Shared Foundations | Blocks, items, entities and blueprints reuse materials, icons, animations, sockets, registries and overrides where appropriate. |
| Behaviour Safety | Visual authoring does not silently rewrite AI, combat, recipes, village logic or world-generation truth. |
| Production Scalability | Templates, inheritance, procedural assistance, dependency tracking and packaging make large content libraries manageable. |
| Readable Results | Assets remain identifiable and functional at gameplay distances, icon sizes, lighting conditions and performance levels. |

## 1.3 What This Expansion Is Not

- It is not a conventional smooth-sculpting package with voxel styling applied afterward.
- It is not a replacement for dedicated gameplay registries, AI systems, combat systems or world generation.
- It is not an unrestricted procedural generator that produces results which cannot be reproduced or edited.
- It is not one universal skeleton forced onto every entity.
- It is not a requirement that every creature use expensive full-body simulation.
- It is not a full sound studio, music workstation or particle/VFX authoring suite.
- It is not initially a public player character modding service or online asset marketplace.
- It is not permission to bypass stable IDs, validation, migration or performance limits.

## 1.4 Expanded Design Pillars

| Pillar | Design Meaning | Result |
| --- | --- | --- |
| Voxel-Only Source | Geometry begins as voxels, voxel parts, voxel modifiers or Forge-generated voxel primitives. | Every asset remains visually coherent with Leyforge and editable inside the Forge. |
| Body-Plan Flexibility | Entity anatomy is represented by templates and configurable graphs rather than a humanoid-only hierarchy. | Pigs, spiders, centipedes, birds, dragons and unusual monsters can use appropriate structures. |
| Semantic Blueprints | Buildings contain function, markers, stages, networks and world rules rather than only a copied block volume. | NPCs, villages, automation and world generation can use authored structures reliably. |
| Non-Destructive Authoring | Source layers, modifiers, inheritance and revision history preserve editability. | Developers can iterate without destroying approved bases or manually rebuilding variants. |
| Live Validation | Assets are tested in realistic scenarios before approval. | Problems with scale, gait, navigation, icons, collisions or structure access are found early. |
| Registry Integrity | Stable IDs and dependency graphs connect all authored content. | Overrides and migrations remain predictable across saves and content packs. |

# 2. Locked Direction Summary

The following decisions are locked from the design discussion leading to this document set.

| Area | Locked Decision |
| --- | --- |
| Forge Expansion | Entity creation and the prior Blueprint Designer become official Forge workspaces rather than disconnected tools. |
| Voxel Identity | Player characters, NPCs, mobs, animals, monsters, bosses and blueprint assets are all voxel-based like the rest of Leyforge. |
| Entity Coverage | Support humanoids, quadrupeds, creatures with four or more arms, creatures with four or more legs, segmented crawlers, serpents, birds, flying creatures, dragons and unconventional bodies. |
| Developer Control | Developers may open existing assets and override models, materials, rigs, animations, icons and blueprint presentation while retaining stable gameplay identities. |
| Icon Capture | Items, blocks, entities, blueprint previews and other icon-bearing assets may capture icons from their live three-dimensional Forge view. |
| Animation Method | Use hybrid animation rather than frame animation alone: skeletal or rigid-part transforms, procedural motion, voxel-frame changes and material animation. |
| Multi-Legged Creatures | Provide gait presets and terrain-aware procedural foot placement so spiders and centipedes do not require every footstep to be hand-authored. |
| Segmented Creatures | Provide repeated-segment construction with controlled taper, limb repetition, collision grouping and LOD support. |
| Blueprint Merge | Blueprint Forge must cover buildings, structures, village projects, ruins, dungeons, camps, roads, bridges, factories and world-generation sites. |
| Blueprint Depth | Blueprints include semantic layers, construction stages, upgrade inheritance, culture/material substitutions, damage states and validation. |
| Project Governance | Use a Forge Project Manifest, dependency graph, lifecycle states, validation reports, revision history and approval gates. |
| Procedural Reproducibility | Every procedural result records a seed and parameters and remains editable or bakeable. |
| Audio/VFX Boundary | Do not build full audio or particle design software yet. Preserve only event and socket contracts for later modules. |
| Document Set | Create Documents 22A through 22L covering the master system, anatomy, humanoids, creatures, rigging, animation, variants, gameplay integration, blueprints, UI/UX, technical implementation and production migration. |

# 3. Expanded Forge Architecture

## 3.1 Three Primary Workspaces

```text
Leyforge Forge
|-- Asset Forge
|   |-- Blocks and block surfaces
|   |-- Items and equipment models
|   |-- Props and furniture
|   |-- Machines and automation parts
|   |-- Materials and palettes
|   `-- Runtime visual states
|
|-- Entity Forge
|   |-- Player characters
|   |-- Humanoid NPCs
|   |-- Animals and livestock
|   |-- Mobs and monsters
|   |-- Bosses and constructed beings
|   |-- Body plans and rigs
|   |-- Animation and locomotion
|   `-- Entity icons and previews
|
`-- Blueprint Forge
    |-- Player buildings
    |-- NPC and village buildings
    |-- Village construction projects
    |-- Roads, bridges and infrastructure
    |-- Factories and magic structures
    |-- Ruins, dungeons and camps
    |-- Creature nests and boss arenas
    `-- World-generation structures
```

The separation is organisational rather than absolute. A machine created in Asset Forge can be placed inside a factory blueprint. A humanoid created in Entity Forge can preview a weapon from Asset Forge. A structure blueprint can contain entity spawn markers, work poses and animation-event references.

## 3.2 Shared Forge Services

All workspaces use shared services for:

- Stable IDs and namespaces.
- Project manifests and dependency resolution.
- Voxel material and palette libraries.
- Asset search, tags and filters.
- Source and baked-product storage.
- Overrides and inheritance.
- Icon capture profiles.
- Revision history and comparison.
- Validation and approval states.
- Test Laboratory scenarios.
- Packaging and migration.
- Content-pack export and import.

## 3.3 Specialist Documents

The 22-series divides complexity by responsibility:

- 22B defines body-plan taxonomy and anatomy.
- 22C defines humanoid creation.
- 22D defines creatures, monsters and bosses.
- 22E defines skeletons, rigging, joints, IK and attachments.
- 22F defines locomotion, combat animation and runtime states.
- 22G defines customisation, equipment, variants and inheritance.
- 22H defines hitboxes, AI markers, simulation LOD and gameplay contracts.
- 22I defines Blueprint Forge.
- 22J defines the unified user experience.
- 22K defines implementation.
- 22L defines production and migration.

# 4. Voxel-Only Source and Visual Rules

## 4.1 Source-of-Truth Rule

All Forge-authored visual geometry must originate from one or more of the following:

- Individual voxel cells.
- Voxel brushes and selections.
- Forge-generated voxel primitives.
- Repeated voxel segments.
- Voxel-authored named parts.
- Voxel modifiers that produce deterministic voxel results.
- Reused Forge voxel assets.

Imported smooth meshes may be used as temporary tracing or scale references only if the project permits them, but they cannot become the approved editable source for a Forge asset.

## 4.2 Runtime Baking Does Not Break Voxel Identity

The runtime representation may use:

- Hidden-face removal.
- Greedy meshing.
- Coplanar merging.
- Palette or atlas materials.
- Mesh simplification.
- Instancing of repeated parts.
- Reduced collision hulls.
- LOD meshes.
- Impostors at extreme distance.

These are output optimisations. The source remains voxel data so the asset can be reopened, changed and rebaked.

## 4.3 Voxel-Generating Primitives

The Forge may provide convenient primitives such as:

- Cubes, cuboids and wedges.
- Cylinders and pipes.
- Spheres and domes.
- Cones, horns and spikes.
- Arches and rings.
- Gears and toothed wheels.
- Wing membranes and feather arrays.
- Chains and repeated links.
- Curves that place voxels along a guide.
- Segmented bodies and tails.

A primitive is acceptable only when it produces an editable voxel result or remains a deterministic non-destructive modifier over voxel source.

## 4.4 Standard Scale and Density Bands

The project should use approved density bands to maintain visual consistency.

| Asset Family | Default Authoring Guidance |
| --- | --- |
| Standard block face | 32 x 32 pixels per one-metre face. |
| Small item | 16-cubed or 24-cubed working volume where readable. |
| Standard item or prop | Approximately 32-cubed working volume. |
| Long tool or weapon | Approximately 32 x 32 x 64, adjusted to world scale. |
| Humanoid | Modular body-part grids aligned to a shared humanoid scale profile. |
| Small animal | 32 to 64 voxel working scale across its longest practical body dimension. |
| Medium creature | Modular body parts and shared density rather than one excessive monolithic volume. |
| Large creature or boss | Multiple voxel parts, repeated segments and LOD-ready modules. |
| Structure | One-metre world blocks plus Forge-authored props, machines and sub-block assets. |

These are guidance rather than hard creative limits. The Forge should warn when density is inconsistent with the asset family or causes avoidable cost.

## 4.5 Readability Rules

An approved entity should be recognisable through several signals:

- Silhouette.
- Proportion.
- Major colour or material regions.
- Locomotion style.
- Head, limb and tail placement.
- Animation timing.
- Scale relative to world blocks and characters.

Fine voxel detail may enrich the model but cannot be the only way to identify it.

## 4.6 Material Coherence

Entities and structures should reuse the Material DNA system from 21B. A material such as iron, mana crystal, bone, chitin, fur, feather or living wood should maintain a recognisable visual identity across blocks, items, creatures and blueprints while allowing controlled local overrides.

# 5. Scope and Supported Entity Families

## 5.1 Humanoid Families

The Forge must support:

- Standard two-arm, two-leg humanoids.
- Short, tall, broad and slender humanoid proportions.
- Four-arm or multi-arm humanoids.
- Winged humanoids.
- Tailed humanoids.
- Horned or unusual-headed humanoids.
- Undead humanoids.
- Constructed humanoids and golems.
- Hybrid forms such as centaur-like bodies where supported by a composite body plan.

## 5.2 Quadrupeds

Examples include:

- Pigs and boars.
- Cattle, sheep and goats.
- Horses and deer.
- Wolves and large cats.
- Bears.
- Fantasy livestock.
- Armoured beasts.
- Four-legged magical constructs.

Quadruped templates should support different shoulder and hip heights, neck lengths, foot types, tails, horns, ears and body mass.

## 5.3 Arthropods and Multi-Legged Creatures

Examples include:

- Spiders.
- Scorpions.
- Beetles.
- Crabs.
- Six-legged magical creatures.
- Crystal crawlers.
- Creatures with eight or more walking limbs.

The body plan must allow configurable limb pairs, mirrored or asymmetric limbs, climbing profiles and procedural gait groups.

## 5.4 Segmented Crawlers and Serpentine Bodies

Examples include:

- Giant centipedes.
- Millipedes.
- Worms.
- Snakes.
- Bone serpents.
- Long-bodied dragons.
- Serpentine machines.

These entities should be assembled from repeated or varied segments with controlled taper, joint limits, leg repetition, damage grouping and LOD reduction.

## 5.5 Avian and Flying Bodies

Examples include:

- Birds.
- Bats.
- Insect fliers.
- Griffins.
- Wyverns.
- Floating magical creatures.
- Multi-winged beings.

Flying entities require ground, take-off, flight, glide, hover, bank, dive, landing and perch considerations. Wings may be rigid voxel parts, segmented skeletal chains or hybrid structures.

## 5.6 Dragons and Large Flying Bosses

Dragon templates should support:

- Four legs plus two wings.
- Two legs plus two wings for wyvern-like forms.
- Long neck and tail chains.
- Configurable head, jaw, horn and crest structures.
- Breath and projectile sockets.
- Rider or saddle sockets where applicable.
- Multiple damage regions and breakable parts.
- Ground and flight locomotion.
- Boss phases and state variants.

## 5.7 Amorphous and Unusual Forms

The system should also allow:

- Slimes.
- Floating eyes or crystals.
- Living flames.
- Animated plants and trees.
- Mimics.
- Tentacled beings.
- Multi-headed monsters.
- Detached floating parts.
- Shape-changing magical entities.

These may rely more heavily on voxel-frame changes, bone chains, shader/material animation or controlled procedural movement.

## 5.8 Entity Category Rule

> **Entity Rule**  
> The Forge should provide enough templates to make common bodies fast, but no template may become a hard limit that prevents a custom voxel body plan.

# 6. Body Plans, Anatomy and Modular Architecture

## 6.1 Body-Plan Graph

Each entity should be represented by a graph of named parts and relationships.

```text
root
|-- central_body
|   |-- neck_chain
|   |   `-- head
|   |-- front_limb_pair
|   |-- rear_limb_pair
|   |-- wing_pair
|   `-- optional_extra_arm_pair
`-- tail_chain
```

Each graph connection may define:

- Parent and child part.
- Joint type.
- Pivot and rest orientation.
- Mirroring rules.
- Limb or segment count.
- Movement limits.
- Animation role.
- Damage region.
- Collision grouping.
- Socket inheritance.
- Optional or required status.

## 6.2 Template and Custom Modes

The Forge should offer two creation approaches:

### Template Start

Choose a known body family such as humanoid, pig-like quadruped, spider, bird or dragon. The Forge creates a valid initial graph, rig, scale profile and recommended animation roles.

### Custom Body Plan

Build a graph from named body components, add arbitrary limb chains, define mirrored groups, assign roles and create a custom rig.

Templates accelerate common work; custom mode preserves creative freedom.

## 6.3 Modular Body Parts

Reusable parts may include:

- Heads and jaws.
- Torsos and abdomens.
- Arms, legs and feet.
- Wings.
- Tails.
- Horns, antlers and crests.
- Shells and armour plates.
- Eyes and mouth components.
- Feathers or fins.
- Tentacles.

Parts may be inherited, duplicated, mirrored, procedurally repeated or locally overridden.

## 6.4 Repeated-Segment Generator

A dedicated repeated-segment tool should support:

```text
Base segment: centipede_body_A
Repeat count: 36
Taper: 100% at head -> 55% at tail
Leg pair: enabled per segment
Armour variation: alternate A/B every second segment
Collision grouping: 6 regional groups
Animation phase offset: automatic travelling wave
LOD rule: merge or omit secondary detail at distance
```

The generator must store its seed and parameters, allow local segment overrides and bake into a predictable body graph.

## 6.5 Symmetry and Asymmetry

The Forge should make symmetry easy but not mandatory.

- Mirror limbs and materials.
- Break symmetry for scars, missing limbs, armour or mutations.
- Preserve named left and right roles after mirroring.
- Allow radial symmetry for insect limbs, tentacles or flower-like creatures.
- Allow controlled asymmetry in boss phases or corruption variants.

## 6.6 Anatomy Metadata

Body parts may carry presentation and gameplay-facing metadata such as:

- Head, torso, limb, tail, wing or shell role.
- Primary and secondary locomotion role.
- Equipment eligibility.
- Targetable region.
- Breakable or severable presentation state.
- Weak-point marker.
- Interaction or rider marker.

The Forge stores and validates the markers; gameplay systems decide their rules.

# 7. Humanoid Player Character and NPC Direction

## 7.1 Shared Humanoid Foundation

Player characters and humanoid NPCs should use compatible body-role standards wherever practical so they can share animation families, equipment sockets and clothing rules.

Shared compatibility does not require identical bodies. Race, culture, age, role and individual variation may change proportions, head shapes, limbs, tails, horns, wings and materials within defined compatibility profiles.

## 7.2 Humanoid Authoring Layers

```text
Humanoid Definition
|-- body plan and proportions
|-- body voxel parts
|-- head and face components
|-- hair, facial hair and adornments
|-- optional horns, ears, tail or wings
|-- clothing layers
|-- armour layers
|-- equipment sockets
|-- material and palette profile
|-- rig and animation family
|-- expressions and runtime states
`-- icon or portrait capture profile
```

## 7.3 Proportion Controls

The Forge should provide safe controls for:

- Overall height.
- Shoulder width.
- Torso length and depth.
- Arm and leg length.
- Head scale.
- Hand and foot scale.
- Body build.
- Posture.
- Race-specific ranges.

Equipment compatibility warnings should appear when proportions exceed the range supported by an equipment family.

## 7.4 Faces and Expressions

Voxel faces should remain stylised and readable. The system may combine:

- Swappable eye components.
- Mouth voxel frames.
- Brows and eyelids.
- Jaw movement.
- Emissive eye states.
- Small expression overlays.
- Head material changes.

Expression sets may include neutral, happy, angry, afraid, injured, sleeping, talking, casting, corrupted and dead.

## 7.5 NPC Visual Identity

Persistent NPCs should be visually distinguishable through controlled combinations of:

- Body and face variation.
- Hair and adornments.
- Culture palette.
- Profession clothing.
- Equipment and carried tools.
- Age and wear.
- Scars or life-history details.
- Current condition, damage or corruption.

The visual generator should never make an NPC's appearance the only record of their job, identity or culture. Those remain stable gameplay records.

## 7.6 Player Character Scope

The player-character creator should eventually support:

- Body and race selection.
- Appearance editing.
- Clothing and armour preview.
- Held-item and equipment fit testing.
- First-person and third-person presentation checks.
- Animation compatibility.
- Icon, portrait and save-thumbnail capture.

Public player-facing customisation can use a restricted interface derived from the developer Forge, but that is not the initial implementation target.

# 8. Creature, Mob, Monster and Boss Direction

## 8.1 Creature Creation Workflow

```text
Choose body template or custom graph
        -> set scale and proportions
        -> add, remove or repeat limbs and segments
        -> sculpt voxel body parts
        -> assign materials and variants
        -> create or select rig
        -> configure gait and animation family
        -> place sockets, hit regions and markers
        -> test in environment
        -> capture icon and approve
```

## 8.2 Example: Pig

| Field | Example Direction |
| --- | --- |
| Body Plan | Quadruped. |
| Shape | Short, wide torso with low neck and large head. |
| Limbs | Four short legs. |
| Special Parts | Ears, snout and curled tail. |
| Locomotion | Walk, trot, run, turn, lie down and rise. |
| Behaviour Presentation | Eat, root, idle, flee, damaged and death. |
| Variants | Domestic pig, wild boar, snow boar, corrupted boar and giant boss boar. |

## 8.3 Example: Spider

| Field | Example Direction |
| --- | --- |
| Body Plan | Two main body sections with eight legs. |
| Rig | Named limb chains grouped into procedural gait sets. |
| Locomotion | Walk, skitter, climb, leap and turn. |
| Special Parts | Fangs, spinneret, optional abdomen patterns. |
| Procedural Support | Terrain-aware foot placement and alternating gait preset. |
| Combat Presentation | Bite, web release, leap attack, stagger and death. |

## 8.4 Example: Giant Centipede

| Field | Example Direction |
| --- | --- |
| Body Plan | Repeated segmented crawler. |
| Segment Count | Configurable, potentially dozens of sections. |
| Limbs | One or more leg pairs per body segment. |
| Procedural Support | Travelling-wave gait and follow-chain body motion. |
| Performance | Regional collision and damage grouping; simplified distal leg animation at distance. |
| Combat Presentation | Mandible strike, coil, body sweep and tail action. |

## 8.5 Example: Bird

| Field | Example Direction |
| --- | --- |
| Body Plan | Avian with two legs, two wings and feathered tail. |
| Locomotion | Hop, walk, take-off, flap, glide, bank, dive, land and perch. |
| Rig | Wing chains, neck/head control and tail steering. |
| Variants | Size, beak, feather arrangement, palette and wing profile. |
| Icon | Full-body or head portrait captured from a live pose. |

## 8.6 Example: Dragon

| Field | Example Direction |
| --- | --- |
| Body Plan | Four legs, two wings, neck chain and tail chain, with wyvern alternative. |
| Rig | Large modular rig with jaw, wings, claws, neck, torso and tail roles. |
| Locomotion | Walk, run, turn, climb, take-off, fly, glide, hover where appropriate and land. |
| Combat | Bite, claw, tail sweep, wing strike, roar, breath attack and phase actions. |
| Sockets | Mouth, eyes, claws, wings, tail, rider position, camera points and effect origins. |
| Boss Support | Targetable regions, damaged wing state, broken armour, phase variants and arena markers. |

## 8.7 Boss-Specific Requirements

Boss authoring may include:

- Multiple targetable regions.
- Breakable armour or limbs.
- Phase-specific voxel variants.
- Animation-event windows for attacks.
- Multiple projectile or breath origins.
- Arena interaction markers.
- Climbable or mountable surfaces where designed.
- Cinematic camera anchors.
- Readability previews at extreme scale.

The Forge must not own boss logic or damage rules. It provides validated presentation and marker data for those systems.

# 9. Rigging, Animation and Locomotion Foundation

## 9.1 Hybrid Animation Stack

The preferred animation model is layered:

```text
Base pose
    + skeletal or rigid-part transform animation
    + procedural gait and foot placement
    + optional voxel-frame component changes
    + material animation
    + runtime state and damage overlays
    + named animation events
```

No single method is sufficient for all entities.

## 9.2 Skeletal and Rigid-Part Animation

Use transform animation for:

- Humanoid limbs.
- Quadruped legs.
- Wings.
- Jaws and heads.
- Tails and neck chains.
- Spider legs.
- Centipede segments.
- Tentacles.
- Constructed entity mechanisms.

Voxel parts may deform through supported skinning or remain rigid depending on the visual style and performance target.

## 9.3 Voxel-Frame Animation

Voxel-frame changes are appropriate for:

- Blinking or mouth expressions.
- Magical flames.
- Shape-changing entities.
- Slime deformation.
- Destruction or transformation frames.
- Boss phase metamorphosis.
- Temporary spikes, shields or growths.

Frames should store changes efficiently and bake into predictable runtime products.

## 9.4 Procedural Gait Designer

The Forge should provide gait presets for:

- Humanoid walking and running.
- Quadruped walk, trot and gallop.
- Bird hop and landing.
- Spider alternating gait.
- Six-legged tripod gait.
- Centipede travelling wave.
- Crab sideways gait.
- Heavy dragon ground movement.
- Injured or damaged variants.

Adjustable controls should include:

- Step order.
- Leg grouping.
- Stride length.
- Foot lift.
- Step duration.
- Ground detection.
- Body sway.
- Turning behaviour.
- Climbing behaviour.
- Speed scaling.

## 9.5 Terrain-Aware Movement

Test and procedural support should consider:

- Flat terrain.
- Slopes.
- Stairs.
- Uneven voxel surfaces.
- Water depth.
- Narrow passages.
- Low ceilings.
- Wall or ceiling climbing where supported.
- Flight clearance.

## 9.6 Animation Retargeting

Compatible body-plan families should reuse animations through named roles.

Examples:

- Human, elf and orc humanoids share a humanoid family.
- Pig and boar variants share a quadruped family.
- Multiple spider species share eight-leg gait logic.
- Dragon variants share standard role mappings while allowing local clip correction.

Retargeting should never silently distort an incompatible body. The Forge should report proportion or role mismatches.

## 9.7 Animation Event Markers

Animation timelines may contain named events such as:

```text
foot_left_contact
weapon_damage_window_open
weapon_damage_window_close
dragon_breath_charge
breath_release
wing_downstroke
npc_hammer_impact
item_release
land_impact
```

The Forge stores and previews these events. Gameplay code or later Audio/VFX modules decide what authoritative action or presentation resource responds.

# 10. Equipment, Variants and Visual Inheritance

## 10.1 Entity Inheritance Chain

```text
Base species or construct
        -> body variant
        -> culture or faction style
        -> profession or combat role
        -> individual generated variation
        -> equipped clothing, armour and tools
        -> damage, magic and runtime state
        -> project or content-pack override
```

Each layer should override only the fields it owns.

## 10.2 Equipment Compatibility

Equipment definitions may include:

- Compatible body-plan families.
- Required sockets.
- Fit profiles.
- Body regions hidden or replaced.
- Material and dye channels.
- Alternate voxel models by body size.
- Animation restrictions.
- First-person and third-person presentations.

The Forge should preview clipping and attachment problems before approval.

## 10.3 Variant Categories

Entity presentation may vary by:

- Species or race.
- Body shape.
- Age.
- Sex or equivalent body variant where relevant.
- Culture.
- Faction.
- Profession.
- Biome.
- Seasonal coat or plumage.
- Rarity.
- Damage.
- Disease.
- Corruption.
- Elemental or magical infusion.
- Undead state.
- Boss phase.

## 10.4 Asset Family Generation

A base family may produce controlled variants:

```text
Base Pig
|-- Domestic Pig
|-- Wild Boar
|-- Snow Boar
|-- Corrupted Boar
|-- Armoured War Boar
`-- Giant Boss Boar
```

Family generation should rely on inheritance and reproducible parameter sets rather than duplicated independent assets.

## 10.5 Developer Override Rule

> **Override Rule**  
> A developer may replace a model, body part, rig, animation set, material, icon or blueprint presentation while preserving the stable entity or structure ID. Gameplay changes require explicit edits in the relevant gameplay definition or registry.

# 11. Gameplay and Presentation Separation

## 11.1 Ownership Boundaries

| Forge Owns | Gameplay Systems Own |
| --- | --- |
| Voxel model, materials and palettes. | Health, damage, defence and stats. |
| Rig, clips, gait settings and visual states. | AI decisions, navigation goals and behaviour logic. |
| Sockets, hit-region markers and event names. | Authoritative hit detection rules and damage application. |
| Equipment fit and presentation. | Inventory, durability, crafting and item ownership. |
| Blueprint blocks, markers and previews. | Village project scheduling, resource consumption and world-generation selection. |
| Icon images and capture profiles. | Whether an asset appears in UI, codex or recipes. |
| Damage and phase presentation variants. | When a damage state or phase becomes active. |

## 11.2 State Binding Contract

The Forge may bind an authoritative state name to presentation:

```text
state: entity.injured
presentation:
  play locomotion set injured
  enable damaged_leg material layer
  reduce left_front_leg procedural weight
```

The Forge does not decide whether the entity is injured. It describes how an injury state appears after the gameplay system activates it.

## 11.3 Marker Validation

Sockets and markers must use stable semantic names and validated roles. A dragon mouth socket may be called `attack_origin.breath`, while the combat system decides which attack uses it.

# 12. Blueprint Forge Integration

## 12.1 Official Blueprint Workspace

The previously planned Blueprint Designer becomes Blueprint Forge, a first-class workspace inside the Leyforge Forge.

It should author:

- Player buildings.
- NPC village buildings.
- Village project stages.
- Roads and bridges.
- Farms and workshops.
- Factories and automation layouts.
- Magic structures.
- Defences.
- Ruins and restoration sites.
- Dungeons.
- Enemy camps.
- Creature nests.
- Portal sites.
- Boss arenas.
- World-generation landmarks and megastructures.

## 12.2 Blueprint Content

A blueprint may contain:

- Standard voxel blocks.
- Generated construction shapes.
- Forge-created props and furniture.
- Machines and animated assets.
- Doors, gates and windows.
- Storage and inventory endpoints.
- NPC workstations and beds.
- Navigation and path markers.
- Guard, spawn and interaction positions.
- Loot and reward markers.
- Power, mana and automation networks.
- Entrances and structure bounds.
- Construction anchors and stages.
- Damage, ruin and restoration variants.
- Culture and biome material roles.
- World-generation placement rules.

## 12.3 Semantic Layers

Blueprint Forge should organise content into toggleable layers:

```text
Physical Blocks
Props and Functional Assets
NPC Jobs and Household Markers
Navigation and Access
Storage and Inventory
Automation and Logistics
Power
Mana and Wards
Construction Stages
Upgrade and Variant Data
World Generation
Damage, Ruin and Repair
Decoration
Validation Notes
```

Layers make complex structures understandable and allow specialists or AI tools to edit only relevant responsibilities.

## 12.4 Blueprint and Asset Dependency

When a Forge asset changes, Blueprint Forge should show every affected structure. A replacement door model should identify which buildings use it and whether its new clearance remains valid.

# 13. Blueprint Semantics, Construction and World States

## 13.1 Construction Stages

A blueprint may define visible construction stages:

```text
Stage 0 - Site preparation
Stage 1 - Foundations
Stage 2 - Structural frame
Stage 3 - Walls and primary access
Stage 4 - Roof and weatherproofing
Stage 5 - Interior and job sites
Stage 6 - Functional assets and networks
Stage 7 - Decoration and completion
```

Each stage may contain:

- Required blocks and items.
- Added, removed or replaced elements.
- Builder access points.
- Scaffolds and supply markers.
- Completion rules.
- Preview thumbnail.
- Safe fallback if construction is interrupted.

## 13.2 Upgrade Inheritance

Buildings should inherit upgrades rather than storing unrelated full copies.

```text
Small Blacksmith
        -> Expanded Blacksmith
        -> Industrial Forge
        -> Runic Forge
```

An upgrade records only changed blocks, new assets, moved markers, capacity changes and added networks where practical.

## 13.3 Material Roles and Cultural Substitution

Blueprints should use semantic material roles:

- Foundation material.
- Wall material.
- Frame material.
- Roof material.
- Trim material.
- Window material.
- Decorative material.

Culture, biome or faction profiles resolve those roles to actual block families while preserving functional markers.

## 13.4 World-State Variants

Blueprint Forge should preview and author:

- Complete.
- Under construction.
- Upgraded.
- Damaged.
- Burned.
- Abandoned.
- Ruined.
- Occupied.
- Corrupted.
- Cleansed.
- Repaired.
- Culture-converted.

## 13.5 Blueprint Validation Simulation

Before approval, the Forge should test:

- Doors and gates can open.
- NPCs can reach beds and workstations.
- Guards can reach defence positions.
- Storage access is unobstructed.
- Machines have required clearance.
- Chutes, pipes and conduits connect.
- Power and mana networks resolve.
- Construction stages remain reachable.
- Entrances remain usable across variants.
- World-generation footprint and terrain requirements are valid.
- Entity and prop counts remain within budgets.

# 14. Integrated Icon Capture Studio

## 14.1 Icon Capture Rule

Any asset requiring an icon, portrait, codex image, blueprint thumbnail or preview may generate it from the live Forge view.

> **Locked Icon Rule**  
> The Forge should never require a developer to recreate an asset's appearance manually in a separate image editor merely to produce a consistent game icon.

## 14.2 Capture Sources

Icons may be captured from:

- A block or shaped block.
- An item or weapon.
- A prop or machine.
- A humanoid.
- An animal or monster.
- A boss body or head portrait.
- A completed building blueprint.
- A construction, ruined or upgraded blueprint state.

## 14.3 Capture Controls

The Icon Capture Studio should support:

- Orthographic or perspective camera.
- Automatic framing and centring.
- Manual camera position and rotation.
- Saved asset-family presets.
- Transparent, solid or gradient background.
- Lighting presets.
- Shadow and outline options.
- Rarity, magic or corruption presentation.
- Selected animation frame or pose.
- Selected runtime state.
- Selected variant.
- Padding and crop control.
- Multiple output resolutions.

## 14.4 Default View Presets

| Asset Type | Suggested Default View |
| --- | --- |
| Full block | Isometric three-quarter view. |
| Thin construction piece | Angled view showing thickness and connection. |
| Tool or weapon | Diagonal presentation with readable silhouette. |
| Machine | Three-quarter front view, optionally active. |
| Humanoid | Full-body pose or head-and-shoulders portrait. |
| Creature | Full-body side/three-quarter view or codex portrait. |
| Blueprint | Elevated miniature view of completed structure. |

## 14.5 Linked and Locked Icons

### Live-Linked

Regenerates when the asset, chosen state or selected variant changes.

### Locked

Preserves an approved render. The Forge warns if the source asset has changed since capture.

## 14.6 Batch Capture

Batch tools should support:

- Every asset missing an icon.
- Every changed asset in the current review batch.
- All variants in a family.
- All blueprint states requiring thumbnails.
- A content pack or migration group.

# 15. Forge Project Manifest, Registries and Dependency Graph

## 15.1 Forge Project Manifest

Each Forge project should have one authoritative manifest containing:

- Forge format version.
- Target Leyforge game version.
- Registry schema versions.
- Project namespace.
- Enabled content packs.
- Dependency list and version rules.
- Override priority.
- Asset roots and output locations.
- Validation profile.
- Last successful full validation.
- Last successful bake.
- Migration requirements.
- Packaging metadata.

## 15.2 Stable IDs

Every significant definition should have a stable ID, including:

- Voxel source asset.
- Entity definition.
- Body-plan template.
- Rig and skeleton family.
- Animation set and clip.
- Material and palette.
- Icon capture profile and output.
- Blueprint and blueprint stage.
- Semantic marker profile.
- Override package.

## 15.3 Dependency Graph

The Forge should show direct and indirect dependencies.

```text
Oak Plank Material
|-- Oak Plank Block
|-- Oak Stair Family
|-- Village Bed
|-- Wooden Chute
|-- Forest House Blueprint
`-- Forest Hamlet Watchtower
```

Before replacing, renaming, deprecating or deleting an asset, the developer should see:

- Which assets depend on it.
- Whether the dependency is hard or optional.
- Which approved blueprints use it.
- Which icons or baked products are stale.
- Whether a fallback exists.
- Which saves or content packs may require migration.

## 15.4 Registry and Manifest Validation

Hard errors should include:

- Duplicate stable IDs.
- Missing hard dependencies.
- Cyclic inheritance that cannot resolve.
- Incompatible schema version.
- Invalid override target.
- Missing required body role or blueprint marker.
- Baked output generated from a different source revision without acknowledgement.

# 16. Asset Lifecycle, Review, Revision and Approval

## 16.1 Lifecycle States

```text
Concept
    -> Draft
    -> Functional
    -> Visual Review
    -> Approved
    -> Deprecated
    -> Legacy Fallback
```

### Concept

Idea or rough prototype. May be incomplete and excluded from normal builds.

### Draft

Editable asset with enough data to continue work, but not trusted for production.

### Functional

Required model, collision, markers, animation or blueprint logic exists and passes basic validation.

### Visual Review

Ready for style, readability, animation, icon and integration review.

### Approved

Accepted for the defined production scope and permitted in release content.

### Deprecated

No longer recommended for new content but retained for migration or compatibility.

### Legacy Fallback

Preserved as a safe visual or blueprint fallback for older saves, missing overrides or failed migration.

## 16.2 Status Flags

Flags may include:

- Placeholder.
- Missing icon.
- Missing animation.
- Missing collision.
- Missing LOD.
- Missing gameplay binding.
- Missing blueprint marker.
- Needs scale review.
- Needs migration.
- Approved for POC only.
- Approved for final production.
- Performance exception approved.

## 16.3 Revision History

Each source asset should record lightweight history:

- Revision identifier.
- Date and authoring source.
- Changed fields or source layers.
- Validation results.
- Approval notes.
- Derived outputs.
- Dependencies affected.

The Forge should support:

- Compare current and approved versions.
- Compare an override with its parent.
- Visual before-and-after preview.
- Restore an earlier revision.
- Revert selected fields.
- Identify which blueprints or entities were affected.

## 16.4 Human Review of AI-Assisted Changes

When Summer Engine or another AI changes an asset, the revision should clearly show:

- What was requested.
- What files or source layers changed.
- What validation ran.
- What remains uncertain.
- Whether approval is still required.

AI-assisted work does not bypass approval gates.

# 17. Procedural Tools, Seeds and Reproducibility

## 17.1 Reproducibility Rule

> **Procedural Rule**  
> Every procedural Forge operation must record its seed and parameters or bake to an explicitly accepted fixed result. No approved asset should depend on an unrecoverable random outcome.

## 17.2 Procedural Uses

Procedural assistance may include:

- Material noise and wear.
- Fur, feather, scale or chitin pattern variation.
- Horn and antler variation.
- Body-proportion variation.
- Repeated segments and limbs.
- Damage and rubble generation.
- Corruption spread.
- Blueprint decoration and clutter.
- Cultural material substitution.
- Icon pose selection assistance.

## 17.3 Non-Destructive Modifier Stack

Useful modifiers include:

- Mirror.
- Radial symmetry.
- Array and repeat.
- Segment generation.
- Taper.
- Bend.
- Twist.
- Hollow.
- Thicken.
- Material replacement.
- Noise.
- Weathering.
- Damage scatter.
- Corruption growth.

Modifiers should be reorderable, disableable and bakeable.

## 17.4 Local Overrides

Generated results should allow local edits. A centipede may use 30 generated segments while one damaged segment and the final tail are manually overridden.

# 18. Forge Test Laboratory and Readability Validation

## 18.1 Test Laboratory Purpose

The Test Laboratory is a controlled live preview environment where assets and blueprints are tested under relevant gameplay conditions before approval.

## 18.2 Environment Presets

- Neutral studio.
- Daylight forest.
- Night forest.
- Cave.
- Village interior.
- Outdoor village.
- Factory.
- Mana-lit ruin.
- Rain.
- Snow.
- Combat arena.
- Construction site.
- Flight volume.
- Water and shoreline.

## 18.3 Entity Test Features

- Flat terrain and slopes.
- Stairs and uneven blocks.
- Narrow doors and corridors.
- Low ceilings.
- Water depths.
- Climbing surfaces.
- Flight clearance and landing zones.
- Combat target dummies.
- Mount and rider preview.
- Equipment fitting.
- State and animation controls.
- Performance counters.

## 18.4 Blueprint Test Features

- NPC pathing preview.
- Bed and job-site access.
- Door and gate clearance.
- Storage access.
- Machine clearance.
- Power, mana and logistics networks.
- Construction-stage simulation.
- Damage and repair scrubbing.
- Culture and biome variant swaps.
- World-generation terrain fit.

## 18.5 Silhouette and Readability Tests

Assets should be previewed at:

- Inventory icon size.
- Normal gameplay distance.
- Medium LOD distance.
- Long LOD distance.
- Bright daylight.
- Night lighting.
- Against similar-coloured terrain.
- With and without accessibility outlines where supported.

## 18.6 Run Validation Scenario

Each asset family may define a standard scenario. A spider scenario might test standing, walking, turning, climbing, attacking and damaged gait. A house scenario might test entrances, beds, job sites, roof enclosure, construction stages and culture swaps.

# 19. Packaging, Portability, Performance and Safety Limits

## 19.1 Forge Package Contents

A portable package may contain:

```text
Manifest
Source voxel assets
Body plans and rigs
Materials and palettes
Animations and event data
Icons and capture profiles
Blueprints and stages
Registry entries
Dependencies
Migration rules
Credits and licence metadata
Validation report
Baked runtime outputs, when requested
```

## 19.2 Packaging Uses

- Project backups.
- Moving content between branches.
- Sharing approved asset libraries.
- Content packs.
- Future modding.
- Independent recovery from save data.
- Production handoff.

## 19.3 Performance Warnings

The Forge should warn about:

- Excessive voxel count.
- Too many named or animated parts.
- Excessive skeleton or segment complexity.
- Too many procedural legs at full detail.
- Too many collision shapes or physics bodies.
- Excessive transparency or overdraw.
- Missing LODs.
- Oversized textures or icons.
- Too many entities or functional assets in a blueprint.
- Expensive material combinations.
- Excessive animation-event density.

## 19.4 Hard Errors Versus Warnings

### Hard Errors

- Corrupt source data.
- Invalid stable IDs.
- Missing required dependency.
- Unresolvable inheritance.
- Invalid rig hierarchy.
- Required blueprint entrance or marker missing.
- Output path conflict that risks data loss.

### Warnings

- High cost.
- Unusual density.
- Missing optional LOD.
- Silhouette concern.
- Non-standard scale.
- Excessive detail.
- Unapproved performance exception.

Authorised developers may override warnings with recorded justification. Hard errors must be resolved.

# 20. Developer Overrides, Migration and Compatibility

## 20.1 Overrideable Entity Fields

Developers may override:

- Complete voxel model.
- Individual body parts.
- Proportion profile.
- Materials and palettes.
- Rig and skeleton mapping.
- Animation clips and gait settings.
- Visual states and damage variants.
- Equipment presentations.
- Sockets and icon profiles.
- LOD presentation.

## 20.2 Overrideable Blueprint Fields

Developers may override:

- Blocks and assets.
- Materials or culture palette.
- Construction stages.
- Upgrade differences.
- Damage and ruin presentation.
- Semantic markers where compatibility rules permit.
- Preview camera and icon.
- World-generation presentation data.

## 20.3 Compatibility Rules

A visual override should preserve:

- Stable entity or blueprint ID.
- Gameplay definition links.
- Save identity.
- Required semantic roles.
- Required sockets and markers.
- Registry compatibility.

If an override removes a required role, the Forge should reject or quarantine it until repaired.

## 20.4 Migration

Migrations may be required when:

- A body-plan schema changes.
- A required socket is renamed.
- A rig family is replaced.
- A blueprint stage structure changes.
- Material roles are renamed.
- Baked-output format changes.
- A deprecated asset is replaced.

Migrations should be versioned, reversible where practical and tested against representative saves and content packs.

# 21. Deferred Audio and VFX Production Boundary

## 21.1 Deferred Systems

The following are explicitly outside this document set:

- Full sound-effect authoring.
- Music production.
- Voice editing.
- Sound mixing and mastering.
- Particle graph authoring.
- Advanced VFX simulation.
- Dedicated trail, decal or volumetric-effect editors.

These may later become:

```text
Future Forge Modules
|-- Audio and Sound Forge
`-- VFX and Particle Forge
```

## 21.2 Required Integration Points

The current Forge should still support lightweight references such as:

- Named animation events.
- Sound sockets.
- Effect sockets.
- Trail origins.
- Impact markers.
- Light and emission anchors.
- External resource IDs.

The Entity and Blueprint Forge may preview existing approved sound or effect resources, but they should not attempt to author those resources in this phase.

## 21.3 Boundary Rule

> **Deferred Production Rule**  
> Preserve the contracts needed by later audio and VFX systems, but do not allow those future systems to expand the 22-series implementation scope before the core entity and blueprint pipeline works.

# 22. Minimum Viable Expansion Scope and Phasing

## 22.1 Phase 0 - Shared Foundation Check

Confirm that the 21-series supports:

- Editable voxel source and baked outputs.
- Stable IDs.
- Material libraries.
- Overrides.
- Animation clips and states.
- Icon outputs.
- Validation and hot reload.

## 22.2 Phase 1 - Entity Body Foundation

Deliver:

- Body-plan graph.
- Standard humanoid template.
- Quadruped template.
- Eight-legged template.
- Segmented crawler template.
- Avian template.
- Basic dragon template.
- Named body parts and pivots.

## 22.3 Phase 2 - Rigging and Animation Proof

Deliver:

- Reusable skeleton roles.
- Basic humanoid locomotion.
- Quadruped locomotion.
- Spider gait.
- Centipede segment and gait proof.
- Bird take-off/flight/landing proof.
- Dragon ground and simple flight proof.
- Animation event markers.

## 22.4 Phase 3 - Entity Presentation and Gameplay Markers

Deliver:

- Materials and variants.
- Equipment sockets.
- Hit regions and interaction markers.
- State presentation.
- Icon capture.
- Test Laboratory scenarios.
- LOD proof.

## 22.5 Phase 4 - Blueprint Forge Proof

Deliver:

- Semantic layers.
- Block and prop placement.
- NPC and navigation markers.
- Construction stages.
- Culture/material role swap.
- Damage and repair preview.
- Dependency tracking.
- Validation scenario.

## 22.6 Phase 5 - Governance and Packaging

Deliver:

- Project manifest.
- Dependency graph.
- Lifecycle states.
- Revision comparison.
- Validation report.
- Portable package export/import.
- Migration test.

## 22.7 MVP Test Assets

The first acceptance set should include:

- One standard humanoid player/NPC body.
- One four-armed humanoid test.
- One pig or boar quadruped.
- One spider.
- One giant centipede.
- One bird.
- One dragon or dragon-scale technical test.
- One humanoid equipment set.
- One village house blueprint.
- One staged watchtower or workshop blueprint.
- Icons for every applicable test asset.

# 23. Success Criteria and Acceptance Rules

The expansion is successful when:

1. Every approved model remains editable as voxel source data.
2. Common body templates can be created without rebuilding rig foundations manually.
3. Custom limb and segment counts are supported.
4. A four-armed humanoid can share compatible humanoid animation roles where intended.
5. A quadruped can walk and turn on uneven voxel terrain.
6. A spider can use procedural eight-leg gait support.
7. A giant centipede can use repeated segments without unmanageable source duplication.
8. A bird can transition between ground, take-off, flight and landing states.
9. A dragon test can combine legs, wings, neck, tail, sockets and damage regions.
10. Entity icons can be captured and regenerated from live previews.
11. Blueprint Forge can author physical blocks and semantic layers in one asset.
12. A building can preview construction, damage, repair and culture variants.
13. The dependency graph identifies which blueprints use a changed asset.
14. The Project Manifest resolves versions and content dependencies deterministically.
15. Procedural tools reproduce the same result from seed and parameters.
16. Revision history can compare and restore asset versions.
17. Test Laboratory scenarios catch scale, collision, gait, access and readability problems.
18. Approved packages include source, dependencies, validation and migration metadata.
19. Developer overrides preserve stable gameplay identities and required roles.
20. Full audio and VFX authoring remains deferred without blocking later integration.

# 24. Relationships With Documents 22B-22L

| Document | Primary Responsibility | Must Follow From 22A |
| --- | --- | --- |
| 22B - Entity Model Taxonomy, Anatomy and Body Architecture | Detailed body plans, graphs, segment systems and anatomy roles. | Voxel-only source, flexible body plans, reusable templates and custom graphs. |
| 22C - Humanoid Player Character and NPC Creator | Player/NPC bodies, faces, hair, proportions, clothing and modular assembly. | Shared humanoid roles, equipment compatibility, visual identity and code-preserving overrides. |
| 22D - Creature, Mob, Monster and Boss Model Creator | Animals, arthropods, crawlers, flying creatures, dragons, monsters and bosses. | Full taxonomy coverage, repeated segments, boss regions and readable silhouettes. |
| 22E - Skeletons, Rigging, Joints, IK and Attachment Systems | Rig construction, joints, IK, sockets, skinning and procedural support. | Body-plan graph contracts, semantic roles and stable attachment names. |
| 22F - Entity Animation, Locomotion, Combat and Visual States | Clips, gait designer, terrain adaptation, combat events and state layers. | Hybrid animation stack, event markers and gameplay/presentation separation. |
| 22G - Character Customisation, Equipment, Variants and Visual Inheritance | Appearance layers, equipment fit, family variants and runtime visual states. | Inheritance chain, material DNA, reproducibility and override rules. |
| 22H - Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD | Hit regions, AI origins, mounts, interactions, LOD and multiplayer presentation. | Marker boundaries, validation, performance warnings and gameplay ownership. |
| 22I - Blueprint Forge | Structure authoring, semantic layers, stages, variants, upgrades and worldgen rules. | Official blueprint integration, dependency graph and validation simulation. |
| 22J - Unified Forge UI/UX and Creator Workflow | Combined workspaces, browsers, Icon Studio, Test Laboratory and review workflow. | Shared services, lifecycle, recoverability and clear specialist boundaries. |
| 22K - Forge Entity and Blueprint Technical Implementation Plan | Godot resources, editor tools, baking, manifests, packaging and runtime integration. | Source/runtime separation, deterministic data, validation and deferred audio/VFX boundary. |
| 22L - Entity and Blueprint Visual Production and Migration Plan | Asset backlog, migration sequence, review gates and production priorities. | Lifecycle states, template library, MVP set and packaging requirements. |

# Appendix A. Unified Forge Workspace Map

```text
Forge Home
|-- Project Manifest
|-- Asset Browser
|-- Dependency Graph
|-- Review Queue
|-- Validation Dashboard
|-- Package Manager
|
|-- Asset Forge
|   |-- Block Surface Editor
|   |-- Voxel Model Editor
|   |-- Compound Model Editor
|   |-- Material and Palette Editor
|   `-- Runtime State Editor
|
|-- Entity Forge
|   |-- Entity Creation Wizard
|   |-- Body-Plan Graph
|   |-- Voxel Body Editor
|   |-- Rig and Joint Editor
|   |-- Animation and Gait Editor
|   |-- Equipment and Variant Editor
|   |-- Marker and Hit-Region Editor
|   `-- Entity Preview
|
|-- Blueprint Forge
|   |-- Structure Canvas
|   |-- Semantic Layer Manager
|   |-- Construction and Upgrade Editor
|   |-- Material Role Resolver
|   |-- World-State Variant Editor
|   `-- Blueprint Validation Preview
|
|-- Shared Studios
|   |-- Icon Capture Studio
|   |-- Forge Test Laboratory
|   |-- Revision Comparison
|   `-- Bake and Export
```

# Appendix B. Entity Body-Plan Matrix

| Body Plan | Example | Key Requirements |
| --- | --- | --- |
| Humanoid | Player, villager, goblin | Shared roles, equipment, expressions, work and combat animation. |
| Multi-Arm Humanoid | Four-armed warrior | Additional arm pairs, weapon sockets, retargeting rules. |
| Quadruped | Pig, wolf, horse | Four-leg gait, neck/head, tail, slope adaptation. |
| Arthropod | Spider, scorpion | Configurable leg pairs, climbing, procedural gait. |
| Segmented Crawler | Giant centipede | Repeated segments, leg wave, collision and LOD grouping. |
| Serpent | Snake, bone serpent | Long follow chain, ground contact, coil and strike. |
| Avian | Bird | Wings, legs, take-off, flight, glide, landing and perch. |
| Bat-Like | Bat, demon flyer | Membrane wings, hanging/perch state, flight. |
| Wyvern | Two-leg dragon | Leg pair, wing pair, tail, ground and flight combat. |
| Dragon | Four-leg dragon | Four legs, wings, neck/tail chains, breath sockets, boss regions. |
| Floating Entity | Wisp, floating eye | Hover motion, detached parts, effect anchors. |
| Amorphous | Slime | Voxel-frame or deformation support, simple collision. |
| Construct | Golem | Rigid parts, machinery, material states, damage sections. |
| Custom Graph | Unique monster | Arbitrary parts, named roles, custom rig and validation. |

# Appendix C. Blueprint Category and Semantic-Layer Matrix

| Blueprint Category | Common Semantic Layers |
| --- | --- |
| Player House | Physical, doors, storage, decoration, upgrade. |
| NPC Home | Physical, household, beds, access, culture, damage. |
| Workshop | Physical, job sites, storage, machine clearance, power. |
| Factory | Physical, automation, logistics, power, storage, safety. |
| Magic Structure | Physical, mana, wards, ritual markers, corruption states. |
| Village Project | Physical, construction stages, supplies, builders, completion. |
| Road or Bridge | Physical, navigation, terrain fit, repair, route connections. |
| Defence Structure | Physical, guard positions, sight lines, gates, damage. |
| Ruin | Physical, damage, loot, restoration, occupation, worldgen. |
| Dungeon | Physical, navigation, encounters, locks, loot, worldgen. |
| Enemy Camp | Physical, spawn markers, patrols, loot, raid supply. |
| Creature Nest | Physical, creature markers, ecology, loot, threat. |
| Boss Arena | Physical, boss markers, cameras, phases, hazards, exits. |
| Portal Site | Physical, mana, portal anchors, safety, worldgen. |

# Appendix D. Core Rule Register

1. All approved Forge models originate from editable voxel source data.
2. Baked meshes are runtime products, not the editable source of truth.
3. Entity templates accelerate creation but do not restrict custom body plans.
4. Limb and segment counts are configurable.
5. Hybrid animation is preferred over frame animation alone.
6. Procedural gaits must remain deterministic and editable.
7. Gameplay systems activate states; the Forge defines their presentation.
8. Blueprint Forge stores semantic structure data, not only blocks.
9. Icons may be generated from live Forge views.
10. Stable IDs and the Project Manifest govern all dependencies.
11. Dependency impacts must be visible before destructive changes.
12. Every asset uses a formal lifecycle and approval state.
13. Revision history and comparison must support recovery.
14. Procedural operations store seed and parameters.
15. Test Laboratory validation occurs before approval.
16. Warnings may be overridden with justification; hard integrity errors may not.
17. Packages include source, dependencies, validation and migration metadata.
18. Developer visual overrides preserve gameplay identity by default.
19. Full audio and VFX production software is deferred.
20. Later Audio Forge and VFX Forge modules connect through named events, sockets and resource IDs.

# Appendix E. MVP Checklist

## Shared Foundation

- [ ] Project Manifest created and validated.
- [ ] Stable namespace and ID rules active.
- [ ] Source and baked-output separation confirmed.
- [ ] Dependency graph operational.
- [ ] Lifecycle and revision states operational.

## Entity Forge

- [ ] Humanoid template.
- [ ] Four-arm humanoid test.
- [ ] Quadruped template and pig/boar asset.
- [ ] Eight-leg template and spider asset.
- [ ] Segmented crawler and centipede asset.
- [ ] Avian template and bird asset.
- [ ] Dragon or dragon-scale technical asset.
- [ ] Rig and animation-role validation.
- [ ] Procedural gait proof.
- [ ] Equipment and socket proof.
- [ ] Icon capture proof.
- [ ] Entity Test Laboratory scenario.

## Blueprint Forge

- [ ] Physical block and prop placement.
- [ ] Semantic layer management.
- [ ] NPC and navigation markers.
- [ ] Construction stages.
- [ ] Upgrade inheritance.
- [ ] Culture/material role substitution.
- [ ] Damage and repair preview.
- [ ] Dependency impact preview.
- [ ] Blueprint icon capture.
- [ ] Blueprint validation scenario.

## Governance and Delivery

- [ ] Validation report generated.
- [ ] Performance warnings displayed.
- [ ] Approved revision captured.
- [ ] Portable package exported and re-imported.
- [ ] Migration test completed.
- [ ] Audio/VFX scope boundary confirmed.

# Appendix F. Glossary

| Term | Definition |
| --- | --- |
| Asset Forge | Existing Forge workspace for blocks, items, props, machines and materials. |
| Entity Forge | Workspace for voxel characters, creatures, rigs, animation and entity markers. |
| Blueprint Forge | Workspace for semantic building and structure blueprints. |
| Body-Plan Graph | Named hierarchy of voxel body parts, limb chains, joints and roles. |
| Rig | Joint and control structure used to animate an entity. |
| Gait | Ordered movement pattern for legs or locomotion limbs. |
| Retargeting | Reusing an animation on another compatible body by mapping semantic roles. |
| Semantic Layer | Blueprint data layer describing function such as navigation, jobs, storage or power. |
| Icon Capture Profile | Saved camera, lighting, state, pose and output settings used to render an icon. |
| Forge Project Manifest | Authoritative project record for versions, namespaces, packs, dependencies and outputs. |
| Dependency Graph | View of which assets, blueprints and products rely on one another. |
| Lifecycle State | Production status such as Draft, Functional, Review or Approved. |
| Procedural Seed | Stored value allowing a procedural operation to reproduce the same result. |
| Test Laboratory | Live preview environment used to validate assets and blueprints in context. |
| Baked Runtime Product | Optimised mesh, collision, material, animation, icon or blueprint data generated from editable source. |
| Legacy Fallback | Preserved compatible asset used when newer content is unavailable or migration fails safely. |
