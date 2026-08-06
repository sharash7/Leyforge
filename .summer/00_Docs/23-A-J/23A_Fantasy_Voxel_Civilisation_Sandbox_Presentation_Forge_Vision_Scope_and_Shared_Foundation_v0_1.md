# Fantasy Voxel Civilisation Sandbox
## 23A - Presentation Forge
### Audio, VFX and Shared Presentation Foundation
**Version 0.1 - Detailed Design Bible Draft**

A unified voxel-first authoring expansion for audio, three-dimensional voxel effects, lights, trails, surface presentation, ambience and related feedback, connected through semantic anchors, authoritative events, material families, scalable runtime profiles and the existing Leyforge Forge services.

*Working design document - Presentation Forge vision lock, boundaries, shared architecture and document-set foundation*

## Presentation Forge System Statement
| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the vision, identity, boundaries and governing rules for the Presentation Forge, including the VFX Forge, Audio Forge, shared presentation profiles, event contracts, context resolution, spatial attachment foundations, material response, overrides, accessibility, runtime scaling, validation, packaging and MVP scope. |
| Core Philosophy | Gameplay and simulation systems own truth. The Presentation Forge consumes declared events and read-only state, then communicates that truth through sound, voxel VFX, light, surface presentation and related feedback. |
| Forge Structure | Presentation Forge becomes a specialist branch of the unified Leyforge Forge. It contains VFX Forge and Audio Forge workspaces while reusing the existing project manifest, stable IDs, materials, source/runtime separation, inheritance, validation, review, baking and packaging systems. |
| Visual Direction | Approved visual effects use genuine three-dimensional cubes, cuboids, voxel shards, voxel clusters, voxel paths and voxel-authored surface cells. Conventional billboard particles, smooth ribbons and unrelated smooth-mesh particle forms are not approved source geometry. |
| Audio Direction | Audio is stylised, tactile, spatially readable and layered. It may use recordings, procedural sources and approved generated material, but it is not forced into a universal 8-bit style. |
| Spatial Direction | Presentation may attach to assets, exact voxels, voxel faces, edges, vertices, named surface masks, bones, sockets, body regions, paths, blueprint cells, volumes, network routes and temporary runtime contact points. |
| Event Direction | A validated Event Contract Registry and Presentation Context Packet provide timing, source, target, materials, intensity, environment and spatial information without exposing unrestricted gameplay scripting. |
| Material Direction | Material DNA supplies reusable sound, debris, impact, break, placement, heat, mana, corruption and environment response families. A material response resolver selects presentation from context rather than requiring one-off wiring for every combination. |
| Composition Direction | Presentation uses explicit channels, priorities, masks, additive layers, replacement rules and fallbacks so active, wet, damaged, corrupted, overheated and temporary-event feedback can coexist safely. |
| Override Direction | Developers may replace presentation profiles, sound events, effect graphs, spatial mappings, surface masks, material responses and accessibility alternatives while preserving stable gameplay identities and declared contracts. |
| Runtime Direction | Editable source definitions bake into bounded Godot runtime products using pooling, aggregation, LOD, update throttling, voice management, virtualisation and deterministic reconstruction where required. |
| Accessibility Direction | Important cues must support equivalent alternatives across visual, audio, caption, directional and controller-feedback channels. Reduced-motion and reduced-flash modes must preserve essential state readability. |
| Implementation Context | Godot with Summer Engine is the current target. Summer Engine may assist authoring and implementation, but approved resources remain reviewable project data and runtime systems do not depend on an external AI service. |
| MVP Direction | Prove one shared presentation core across a furnace cycle, mining impact, footsteps on several materials, a mana conduit or ward, one creature or boss ability, rain/environment response, state layering, LOD, accessibility and runtime capture/replay. |
| Document Set | Create Documents 23A through 23J covering the master system, spatial attachments, event and context integration, VFX authoring, voxel effect simulation, audio authoring, spatial audio and mixing, unified UI/UX, technical implementation, and production libraries/migration. |

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the vision, identity, boundaries and governing rules for the Presentation Forge, including the VFX Forge, Audio Forge, shared presentation profiles, event contracts, context resolution, spatial attachment foundations, material response, overrides, accessibility, runtime scaling, validation, packaging and MVP scope. |
| Core Philosophy | Gameplay and simulation systems own truth. The Presentation Forge consumes declared events and read-only state, then communicates that truth through sound, voxel VFX, light, surface presentation and related feedback. |
| Forge Structure | Presentation Forge becomes a specialist branch of the unified Leyforge Forge. It contains VFX Forge and Audio Forge workspaces while reusing the existing project manifest, stable IDs, materials, source/runtime separation, inheritance, validation, review, baking and packaging systems. |
| Visual Direction | Approved visual effects use genuine three-dimensional cubes, cuboids, voxel shards, voxel clusters, voxel paths and voxel-authored surface cells. Conventional billboard particles, smooth ribbons and unrelated smooth-mesh particle forms are not approved source geometry. |
| Audio Direction | Audio is stylised, tactile, spatially readable and layered. It may use recordings, procedural sources and approved generated material, but it is not forced into a universal 8-bit style. |
| Spatial Direction | Presentation may attach to assets, exact voxels, voxel faces, edges, vertices, named surface masks, bones, sockets, body regions, paths, blueprint cells, volumes, network routes and temporary runtime contact points. |
| Event Direction | A validated Event Contract Registry and Presentation Context Packet provide timing, source, target, materials, intensity, environment and spatial information without exposing unrestricted gameplay scripting. |
| Material Direction | Material DNA supplies reusable sound, debris, impact, break, placement, heat, mana, corruption and environment response families. A material response resolver selects presentation from context rather than requiring one-off wiring for every combination. |
| Composition Direction | Presentation uses explicit channels, priorities, masks, additive layers, replacement rules and fallbacks so active, wet, damaged, corrupted, overheated and temporary-event feedback can coexist safely. |
| Override Direction | Developers may replace presentation profiles, sound events, effect graphs, spatial mappings, surface masks, material responses and accessibility alternatives while preserving stable gameplay identities and declared contracts. |
| Runtime Direction | Editable source definitions bake into bounded Godot runtime products using pooling, aggregation, LOD, update throttling, voice management, virtualisation and deterministic reconstruction where required. |
| Accessibility Direction | Important cues must support equivalent alternatives across visual, audio, caption, directional and controller-feedback channels. Reduced-motion and reduced-flash modes must preserve essential state readability. |
| Implementation Context | Godot with Summer Engine is the current target. Summer Engine may assist authoring and implementation, but approved resources remain reviewable project data and runtime systems do not depend on an external AI service. |
| MVP Direction | Prove one shared presentation core across a furnace cycle, mining impact, footsteps on several materials, a mana conduit or ward, one creature or boss ability, rain/environment response, state layering, LOD, accessibility and runtime capture/replay. |
| Document Set | Create Documents 23A through 23J covering the master system, spatial attachments, event and context integration, VFX authoring, voxel effect simulation, audio authoring, spatial audio and mixing, unified UI/UX, technical implementation, and production libraries/migration. |

## Document Purpose

This document establishes the master vision and governing rules for the third major Leyforge Forge expansion. Documents 21A through 21G define the Voxel Asset Forge. Documents 22A through 22L extend it into entity, rigging, animation and semantic blueprint creation. Document set 23 activates the dedicated presentation systems that those earlier documents deliberately prepared for but deferred: complete voxel VFX authoring, sound-event authoring, spatial audio, ambient soundscapes, persistent surface feedback, context-sensitive material response and shared presentation resolution.

The Presentation Forge must make simple feedback quick to author while allowing deep cross-system behaviour. A developer should be able to add a believable footstep to an NPC, smoke to a chimney or sparks to a machine without building a custom graph from nothing. The same foundation must also support a dragon breath sequence, a multi-stage portal, a corrupted mana network, a storm over a village, a boss arena and a dense factory without abandoning voxel style, performance limits or authoritative gameplay boundaries.

This document does not define every graph node, audio processor, acoustic calculation, Godot class or production-library entry. Those responsibilities are divided across Documents 23B through 23J. Its purpose is to lock the shared language, architecture, style rules and success conditions so the later specialist documents remain compatible.

## Engine and Forge Status Note

| Current Project Direction Leyforge is being developed in Godot with Summer Engine. The Presentation Forge is a specialist branch of the unified Leyforge Forge, not a separate application with incompatible resources. Editable presentation source remains reviewable project data; baked runtime products remain replaceable outputs. Summer Engine may assist development and authoring, but the shipped game must not depend on an external AI service. |
| --- |

## Design Sources

| Source Document | Relevant Direction | How 23A Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Locks the stylised high-fidelity fantasy voxel direction, readable magic, atmospheric lighting and living-world presentation. | Keeps all feedback voxel-consistent, readable and connected to world systems rather than decorative only. |
| 03 - Blocks Registry | Blocks have materials, states, faces, shapes, damage, fluids, magic, automation and world-facing interactions. | Provides block faces, material families, state regions and exact voxel surfaces that presentation can reference. |
| 07 - NPC Village System | Named NPCs, work, needs, construction, raids, warnings and persistent consequences make settlements feel alive. | Requires layered work sounds, settlement ambience, construction effects, warnings and scalable dense-village presentation. |
| 08 - Automation System | Machines expose power, throughput, blocked, damaged, mana and risk states with visible infrastructure. | Provides high-value state contracts, network paths, machine sockets, loops, alarms and aggregation requirements. |
| 09 - Magic System | Magic is physical infrastructure using mana, runes, wards, rituals, conduits, portals and corruption. | Requires voxel-authored magical effects, mana-flow paths, ritual presentation, ward boundaries and distinctive audio families. |
| 10 - Creatures and Monsters | Creatures should be identifiable by silhouette, movement, sound, habitat and behaviour. | Requires voice families, locomotion contacts, attack origins, body-region effects, boss phases and ecology ambience. |
| 11 - Biomes and World Generation | Biomes, weather, caves, leylines and dynamic world state create readable places and atmosphere. | Provides ambient regions, weather contacts, acoustic environments, leyline presentation and world-scale LOD needs. |
| 12 - Structures | Structures contain semantic markers, damage states, ownership, magic infrastructure, roads and dynamic transformations. | Provides blueprint cells, volumes, rooms, sound portals, emitters, network paths and persistent surface presentation. |
| 21B - Voxel Modelling, Texturing and Material Authoring | Defines editable voxels, 32 x 32 surfaces, Material DNA, named parts, pivots and sockets. | Supplies the physical and material source data extended by surface masks, anchors and material response families. |
| 21C - Animation, Effects and Runtime Visual States | Locks the authority boundary, state contracts, effect sockets, audio cues, layering, LOD and accessibility. | Becomes the immediate presentation foundation expanded into complete Audio Forge and VFX Forge authoring. |
| 21D - Overrides, Variants and Registry Integration | Defines stable identities, inheritance, fallbacks, content packs, migration and contract-sensitive overrides. | Governs presentation-profile inheritance, spatial remapping, provenance, fallback and safe replacement. |
| 21E - Forge UI/UX and Creator Workflow | Defines one shared Forge shell, viewport-led editing, state preview, diagnostics and lifecycle workflows. | Provides the UI foundation extended with graph editors, sound preview, anchor painting, context replay and stress testing. |
| 22A - Forge Entity and Blueprint Expansion | Extends the Forge to entities and semantic blueprints while deferring full audio/VFX authoring but preserving hooks. | Activates those deferred hooks as a shared Presentation Forge without breaking existing entities or blueprints. |
| 22E/22F - Rigging and Animation | Define semantic attachment points, body roles and named animation events such as foot contact, release and impact. | Provide stable moving origins and timing contracts for sound, effects, trails, lights and surface response. |
| 22H - Entity Gameplay Integration | Separates gameplay authority from semantic mouth, hand, damage, rider and ability markers. | Ensures Presentation Forge can use validated spatial contracts without owning attacks, damage, AI or state truth. |
| 22I/22J/22K - Blueprint, UI and Technical Plans | Define semantic blueprint layers, unified workflows, deterministic source/bake separation, validation and runtime services. | Supply blueprint presentation zones, editor integration, Godot resource boundaries, hot reload, testing and packaging. |

## Static Table of Contents

- 1. Locked Presentation Forge Identity

- 2. Approved Direction Summary

- 3. Expanded Unified Forge Architecture

- 4. Scope, Boundaries and Non-Goals

- 5. Fixed Three-Dimensional Voxel VFX Direction

- 6. Audio Style and Sound Identity

- 7. Shared Presentation Conceptual Model

- 8. Presentation Profiles and Feedback Bundles

- 9. Event Contract Registry

- 10. Presentation Context Packet and Resolution

- 11. Spatial Attachment Foundation

- 12. Material DNA and Response Families

- 13. State Binding, Composition and Conflict Rules

- 14. Inheritance, Variants, Overrides and Migration

- 15. Cross-System Integration Requirements

- 16. Blueprint, Structure and World-Space Presentation

- 17. Runtime Authority, Determinism, Saving and Multiplayer

- 18. Performance, LOD, Aggregation and Virtualisation

- 19. Accessibility and Equivalent Feedback

- 20. Creator Workflow, Preview and Test Laboratory

- 21. Summer Engine and AI-Assisted Authoring Boundaries

- 22. Registries, Manifests, Packaging and Production States

- 23. Minimum Viable Presentation Forge and Phasing

- 24. Success Criteria and Relationships With Documents 23B-23J

- Appendix A. Unified Forge Workspace Map

- Appendix B. Core Presentation Rule Register

- Appendix C. Presentation Asset-Type Matrix

- Appendix D. MVP and Acceptance Checklist

- Appendix E. Glossary

## 1. Locked Presentation Forge Identity

The Presentation Forge is Leyforge's shared sensory communication layer. It authors how authoritative world state is seen and heard through three-dimensional voxel effects, sound, light, surface presentation, trails, ambience and related feedback. It does not create gameplay truth; it translates gameplay truth into readable, atmospheric and scalable presentation.

| Locked Rule Gameplay, simulation, combat, AI, inventory, magic, automation, weather and world-state systems own what happened. Presentation Forge resources may read declared state and consume validated events, but they may not apply damage, create items, change machine output, move NPC decisions, alter quest truth or silently mutate persistent world state. |
| --- |

### 1.1 Presentation Promise

A developer should be able to select a block, item, entity, machine, animation, structure or world-space region and understand every presentation dependency attached to it: which event triggers the feedback, where the feedback originates, which material and environment influence it, which sound and VFX assets resolve, how layers combine, how accessibility changes the result and what happens at each performance tier.

A player should be able to read important world behaviour without opening a debug screen. A furnace should sound and look active, blocked, damaged or cooling. A sword impact should communicate weight and target material. A wet stone floor should change footsteps and debris. A mana conduit should reveal flow direction. A nearby monster should be identifiable through movement, sound and habitat cues. Dense presentation should enhance understanding rather than bury it.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel VFX | Effects remain visibly constructed from cubes, cuboids, voxel shards, voxel clusters, voxel paths and surface cells. | Magic, impacts, weather and machines remain consistent with Leyforge's world instead of looking imported from a different art style. |
| Audio Feedback | Layered sound events communicate material, weight, action, environment, state and distance. | Players identify footsteps, impacts, creatures, machines, magic, weather and danger by sound. |
| Spatial Meaning | Semantic anchors, sockets, regions, paths and masks define where presentation originates and how it follows an asset. | Smoke emerges from the chimney, breath from the mouth, trails from the blade and alarms from the correct machine body. |
| Context Resolution | Events provide material, intensity, environment and state context to reusable resolvers. | One impact system can produce appropriate stone, wood, metal, crystal, wet, cave and outdoor results. |
| Layered State | Operation, damage, environment, magic, warning and temporary-event channels combine through explicit rules. | Active machinery can also look wet, damaged, corrupted or overheated without losing its primary state. |
| Scalable Runtime | Budgets, pooling, aggregation, LOD and virtualisation preserve essential cues while reducing decorative cost. | Villages, raids and factories stay readable and performant across distance and hardware settings. |
| Accessible Communication | Important cues define visual, audio, caption, directional and comfort alternatives. | Players do not lose critical information because one sensory channel or effect style is reduced. |

### 1.2 What the Presentation Forge Is Not

- It is not an unrestricted visual-scripting environment that can rewrite gameplay or persistent state.

- It is not a conventional smooth-particle package with a voxel skin placed over billboard effects.

- It is not a digital audio workstation intended to replace full music production, mastering or dialogue recording software.

- It is not a requirement that every sound be retro, bit-crushed or synthetic.

- It is not a guarantee that every authored particle, light or audio voice remains active at full quality at every distance.

- It is not a reason to duplicate stable IDs, manifests, overrides, approval states or packaging systems already owned by the Forge.

- It is not a public player scripting system in the first implementation.

## 2. Approved Direction Summary

| Area | Locked Decision |
| --- | --- |
| Document Set | Create ten documents, 23A through 23J, separating shared architecture, spatial attachment, event/context resolution, VFX authoring, voxel effect simulation, audio authoring, spatial audio/mixing, UI/UX, technical implementation and production libraries. |
| Umbrella Architecture | Use Presentation Forge as the shared parent, with VFX Forge and Audio Forge specialist workspaces. |
| VFX Source Rule | Approved authored effect geometry is genuinely three-dimensional and voxel-based. No conventional billboard sprites or smooth ribbon trails as the approved source form. |
| Audio Style | Use stylised, tactile and readable audio. Real recordings, procedural sources and approved generated assets are allowed; a universal 8-bit treatment is not required. |
| Spatial Precision | Support whole-asset, voxel, face, edge, vertex, free local point, bone, socket, region, path, surface-mask, blueprint-cell, volume and runtime-contact attachment. |
| Surface Masks | Prefer named masks over fragile raw texture coordinates. A mask may still contain one exact pixel when that precision is required. |
| Anchor Stability | Semantic anchor IDs remain stable while their physical mappings may change by variant, damage state, LOD or replacement asset. Required fallbacks and remapping rules are explicit. |
| Event Contracts | Presentation consumes a validated catalogue of events and read-only state contracts with declared payloads, frequency and replication rules. |
| Context Packet | Use one shared context packet for source, target, materials, action, intensity, environment, position, normal, weather, magic and other relevant factors. |
| Presentation Profiles | Bundle sound, VFX, light, surface, camera, haptic and accessibility references into reusable profiles rather than wiring every channel separately. |
| Material Response | Use Material DNA and response matrices to resolve footsteps, impacts, mining, breakage, debris, sparks, heat, mana and environment changes. |
| Procedural Families | Use reproducible VFX grammars and audio families so large libraries remain coherent and editable. |
| Composition | Use explicit channels, priorities, masks, additive/replacing behaviour and maximum layer rules. |
| Acoustics | Use bounded acoustic zones and sound portals derived from or placed within voxel blueprints instead of relying on expensive per-voxel simulation everywhere. |
| Persistent Surfaces | Support wetness, frost, soot, scorch, residue, corruption, footprints and similar face/region layers with save and expiry policies. |
| Performance | Author reusable budget profiles, fallback chains, aggregation and virtualisation for effects, lights and audio voices. |
| Accessibility | Every important presentation profile includes reduced-motion, reduced-flash, colour-independent and sensory-equivalence options. |
| AI Assistance | Summer Engine may suggest anchors, loops, graphs, variants, LOD and accessibility alternatives, but generated work requires provenance, validation and human approval. |
| Future Audio | Reserve buses and contracts for dialogue and music, but defer full dialogue, voice and music authoring modules until the core Presentation Forge is working. |
| POC | Prove the shared foundation through representative assets and one integrated Forest Hamlet presentation scenario. |

## 3. Expanded Unified Forge Architecture

### 3.1 Workspace Structure

```text
Leyforge Forge
|-- Asset Forge
|   |-- Blocks and surfaces
|   |-- Items and equipment
|   |-- Props, machines and materials
|   `-- Runtime visual-state source
|
|-- Entity Forge
|   |-- Humanoids and NPCs
|   |-- Creatures, monsters and bosses
|   |-- Rigs, animation and body regions
|   `-- Equipment and appearance variants
|
|-- Blueprint Forge
|   |-- Buildings and structures
|   |-- Networks, construction and damage states
|   |-- NPC, creature and worldgen markers
|   `-- Rooms, zones, paths and presentation regions
|
`-- Presentation Forge
    |-- Shared Presentation Core
    |   |-- Event Contract Registry
    |   |-- Presentation Context Resolver
    |   |-- Anchors, sockets, regions, paths and masks
    |   |-- Presentation profiles and composition
    |   `-- Budgets, accessibility, validation and baking
    |
    |-- VFX Forge
    |   |-- Particle and voxel-cluster authoring
    |   |-- Trails, beams and network flows
    |   |-- Surface presentation and persistent residue
    |   |-- Environmental volumes and weather
    |   `-- Light integration
    |
    `-- Audio Forge
        |-- Sound-effect and event authoring
        |-- Material audio and variation families
        |-- Spatial audio, ambience and acoustic zones
        |-- Runtime buses, snapshots and mixing
        |-- Dialogue/voice contracts - future
        `-- Music contracts - future
```

### 3.2 Shared Forge Services

Presentation Forge must reuse the same services already established for Assets, Entities and Blueprints. New specialist data may extend those services, but it must not create incompatible project files or hidden scene-path wiring.

- Stable IDs, namespaces and aliases.

- Forge Project Manifest and dependency graph.

- Editable source versus baked runtime products.

- Material and palette libraries.

- Asset browser, tags, search and provenance.

- Parent definitions, inheritance, variants and project overrides.

- Revision history, comparison, reversion and approval states.

- Validation, diagnostics and release gates.

- Test Laboratory scenarios and representative runtime previews.

- Content-pack export/import, packaging and migration.

- Hot reload, cache invalidation and controlled fallback.

### 3.3 Presentation Forge as a Cross-Workspace Layer

Presentation authoring is organised as a specialist workspace, but presentation data is visible wherever its owner is edited. Asset Forge can show a block's material response and face masks. Entity Forge can show a creature's breath origin and vocal sockets. Animation Forge can show event markers and trail windows. Blueprint Forge can show rooms, ambient zones, sound portals, chimneys, ward paths and weather volumes. Presentation Forge provides the deepest authoring tools, while the other workspaces expose context-appropriate inspection and linking.

## 4. Scope, Boundaries and Non-Goals

### 4.1 Included Responsibilities

| Area | Responsibility |
| --- | --- |
| Shared Core | Presentation profiles, event contracts, context resolution, semantic references, state binding, composition, accessibility, budgets, validation and baking. |
| VFX | Voxel particles, voxel clusters, debris, smoke, fire, magic, trails, beams, splashes, environmental volumes, weather contacts, surface layers and light references. |
| Audio | Sound sources, layered sound events, variation, looping, material response, machine states, creature sounds, ambience, attenuation, occlusion, acoustic zones, buses, snapshots and voice management. |
| Spatial Integration | Anchors, sockets, regions, paths, masks, zones, sound portals and runtime contact anchors linked to assets, entities, animations, blueprints and world state. |
| Production | Libraries, provenance, licensing records, templates, procedural families, review, migration and representative testing. |

### 4.2 Explicit Deferrals and Boundaries

| Deferred Area | Boundary |
| --- | --- |
| Full Music Production | Composition, notation, arrangement, recording, mastering and adaptive music-authoring tools remain outside the initial set. Runtime bus and event contracts are preserved. |
| Full Dialogue/Voice Production | Recording sessions, lip-sync pipelines, phoneme editing, localisation voice management and dialogue mastering remain future Audio Forge modules. |
| General-Purpose Video Editing | Cinematics and non-linear video editing are not Presentation Forge responsibilities. |
| Unrestricted Shader Coding | Custom shader source may be implemented by developers, but the first Forge exposes validated parameters and approved templates rather than an unrestricted public shader editor. |
| Gameplay Scripting | Presentation graphs cannot create damage, rewards, AI goals, recipes, machine transactions or quest progression. |
| Full Physical Simulation | The Forge may author visual collision and response approximations; it does not replace fluid, destruction, cloth or rigid-body gameplay simulation. |

### 4.3 Authority Examples

| Example | Authoritative Owner | Presentation Forge Role |
| --- | --- | --- |
| Dragon breath | Ability/combat code decides when breath begins, its hit volume, damage and targets. | Presentation plays charge, release, stream, light, audio and impact feedback from declared events and sockets. |
| Furnace blocked | Automation code owns buffer state, recipe progress and shutdown rules. | Presentation changes loop, smoke, strain sound and warning cue from read-only state. |
| Wet footsteps | World and movement systems determine contact point, surface material and wetness. | Presentation resolves sound, splash and footprint profile. |
| Ward breach | Magic/defence systems decide whether a ward failed and what crossed it. | Presentation creates fracture, pulse, alarm and residue feedback. |

## 5. Fixed Three-Dimensional Voxel VFX Direction

| Fixed Style Rule Every approved authored effect must preserve a readable three-dimensional voxel construction. Cubes, cuboids, voxel shards, voxel clusters, voxel paths, stepped rings and voxel-authored surface cells are the source language. Post-processing may support the result, but it may not conceal that source language or replace it with a conventional smooth particle effect. |
| --- |

### 5.1 Approved Effect Geometry

- Single cubes and cuboids at declared effect-cell scales.

- Thin voxel shards, plates and stepped streaks.

- Multi-cell voxel clusters and reusable cluster frames.

- Voxel rings, arcs, runes and segmented shockwaves.

- Chains of cuboids for beams, trails, lightning and network pulses.

- Voxel-authored surface cells and face overlays for scorch, frost, soot, residue or corruption.

- Voxel volumes made from sparse three-dimensional cells for fog, dust, smoke and magical atmosphere.

- Pre-baked voxel-frame sequences when the effect silhouette genuinely changes.

### 5.2 Disallowed Source Forms

- Camera-facing smoke, flame or magic sprites used as the approved primary effect form.

- Smooth ribbon trails without visible segmented voxel construction.

- Photorealistic fluid or volumetric effects that no longer read as part of the voxel world.

- Unrelated smooth meshes used as particle primitives without voxel conversion or approved exception.

- Texture filtering, excessive bloom or motion blur that dissolves the voxel edges into an indistinct glow.

### 5.3 Effect Scale and Density

The VFX Forge may provide multiple effect-cell presets. A common standard is one thirty-second of a one-metre block, matching the standard voxel/material density, but effects may use larger cells for readability or approved finer cells for hero content. The source records density and world scale so particles remain consistent with the owning asset. The exact preset catalogue and budgets are defined in 23E.

Distance reduction should remove cells, shorten paths, simplify cluster frames and reduce update frequency before replacing a voxel effect with a visually unrelated representation. Extreme-distance impostors may be permitted as generated runtime products when necessary, but they are not the editable source of truth and must preserve the effect's broad cubic silhouette.

### 5.4 Post-Processing

Bloom, colour grading, distortion, depth fog, screen-space light response and similar post-processing may support the voxel effect. They must remain restrained enough that the player can still perceive the effect's shape, direction and source. Critical hazards cannot depend only on bloom or colour intensity.

## 6. Audio Style and Sound Identity

Audio should make the voxel world feel tactile, inhabited and magical without becoming muddy or overly realistic. Sounds use strong transients, clear material identity, readable loops, controlled layering and purposeful spatial placement. A stone impact should feel mineral and heavy; a wooden mechanism should feel hollow and rhythmic; a mana conduit should feel energetic and directional; a corrupted machine should remain recognisable as the base machine while adding unstable layers.

### 6.1 Audio Construction Principles

- Use layered construction: transient, body, texture, tail, sweetener and environment response where useful.

- Keep repeated actions varied through round robin, weighted selection, controlled pitch/volume variation and repeat avoidance.

- Prioritise recognisable source and state over cinematic loudness.

- Keep machine loops phase-stable and capable of smooth start, state transition, virtualisation and resume.

- Use culture, biome, material, magic and corruption overlays without duplicating the complete base family.

- Record source, licence, provenance, processing and approval data for every imported or generated source.

### 6.2 Source Types

| Source Type | Rule |
| --- | --- |
| Imported recordings | Foley, field recordings, libraries and commissioned assets with recorded licence/provenance. |
| Procedural sources | Noise, oscillators, envelopes, generated transients and parameter-driven layers authored in the Forge. |
| Layered Forge assets | Reusable source clips and families combined into runtime sound events. |
| AI-generated sources | Permitted only with project approval, provenance, licence review, validation and human acceptance. |

### 6.3 Style Boundaries

Voxel style does not mean every sound must be low fidelity. Selective bit reduction, stepped modulation or synthetic texture may suit magic, UI, ancient machines or specific cultures, but it is an artistic choice rather than a universal rule. Dialogue and music need compatible buses and ducking contracts now, but full authoring remains deferred.

## 7. Shared Presentation Conceptual Model

Presentation Forge data is divided into reusable definitions, owner bindings and runtime resolution. Reusable definitions describe what a sound, effect, light or surface layer can do. Owner bindings declare which event/state and spatial reference use those definitions. Runtime resolution combines authoritative context, material response, variants, accessibility and budgets to produce the final bounded playback request.

```text
Authoritative event or state
        -> Event Contract validation
        -> Presentation Context Packet
        -> Owner binding and semantic anchor
        -> Presentation Profile
        -> Material/environment resolver
        -> Composition and priority rules
        -> Accessibility and quality profile
        -> Runtime budget/virtualisation
        -> Audio, voxel VFX, light, surface and related outputs
```

| Definition | Purpose |
| --- | --- |
| Presentation Profile | Reusable bundle of sound, VFX, light, surface, camera/haptic references and accessibility alternatives. |
| Sound Event | Runtime-ready audio container with layers, variation, looping, transitions, spatial settings and bus routing. |
| VFX Effect | Voxel-first graph or template describing emitters, forms, motion, appearance, interaction, LOD and sub-effects. |
| Surface Presentation | Persistent or temporary face/region layer such as wetness, frost, soot, scorch, residue or corruption. |
| Light Profile | Bounded light/emission reference with range, pulse, shadow and quality rules. |
| Event Contract | Declared event name, owner, payload, frequency, replication, replay and allowed presentation use. |
| State Contract | Read-only booleans, enums, normalised parameters, vectors, counts and tags exposed by an authoritative system. |
| Presentation Binding | Connects one event/state condition, spatial reference and presentation profile to an owning asset or blueprint. |
| Context Resolver | Selects variants from material, action, intensity, environment, wetness, magic and other packet fields. |
| Budget Profile | Defines maximum particles, lights, voices, updates and fallback levels for one class of feedback. |

### 7.1 Source and Runtime Separation

Graphs, layers, sources, masks and profile definitions remain editable Forge source. Runtime builds use baked Godot resources, compact lookup tables, precomputed variation sets, mesh/cluster caches, pools, buses, zones and resolver manifests. Runtime products may be regenerated and replaced without discarding the source definitions that produced them.

## 8. Presentation Profiles and Feedback Bundles

A Presentation Profile is the primary reusable package for one meaningful feedback event or state. It prevents sound, VFX, light, surface, camera, haptic and accessibility references from being independently wired across hundreds of assets. An owner may inherit a profile and override only the components that differ.

```text
presentation.weapon.iron_sword.heavy_impact
|-- sound_event: audio.weapon.metal_heavy_impact
|-- vfx_effect: vfx.impact.metal_heavy
|-- debris_profile: debris.iron.small
|-- light_profile: light.impact.spark_short
|-- surface_profile: surface.scuff.metal
|-- camera_profile: camera_impulse.heavy_contact
|-- haptic_profile: haptic.heavy_contact
`-- accessibility_profile: access.impact.heavy
```

### 8.1 Profile Components

| Component | Required Direction |
| --- | --- |
| Identity | Stable profile ID, display name, family, parent, category, tags and lifecycle state. |
| Trigger Compatibility | Allowed event contracts, state contracts, action types and required context fields. |
| Outputs | Sound, VFX, light, surface, decal, trail, camera, haptic, UI/caption and directional references. |
| Spatial Rules | Required anchor types, orientation, scale, attachment/follow mode and runtime-contact support. |
| Variation | Material/culture/biome/magic/quality variants, procedural seed rules and repeat avoidance. |
| Composition | Layer, priority, mask, conflict, cooldown, maximum instances and interruption behaviour. |
| Scaling | Budget profile, LOD chain, aggregation, virtualisation and critical-cue policy. |
| Accessibility | Reduced motion, reduced flash, colour-independent form, audio/visual substitutes and caption labels. |
| Dependencies | Source assets, materials, event contracts, anchors, buses, zones and runtime products. |

### 8.2 Profile Families

- Footsteps and locomotion contacts.

- Mining, chopping, digging and harvesting impacts.

- Weapon contact, block, parry, armour and shield response.

- Block placement, damage, breaking, rubble and repair.

- Machine start, work, blocked, fault, damage and shutdown.

- Magic charge, cast, travel, impact, ward, ritual and corruption.

- Creature voice, breath, movement, attack and boss phase.

- Weather, ambience, water, fire and environmental contact.

- Construction, settlement warning, alarms and world events.

## 9. Event Contract Registry

The Event Contract Registry is the approved catalogue of transient events that presentation may consume. It prevents fragile free-text hooks and unrestricted script calls. Every event declares who owns it, what payload it contains, how frequently it can occur, whether it is replicated, whether it can be replayed and which presentation categories may respond.

| Contract Example | Owner | Payload Summary | Allowed Presentation |
| --- | --- | --- | --- |
| event.animation.foot_contact | Animation/movement | Foot side, anchor, speed, weight, optional surface query request. | Footstep sound, contact VFX, footprint/surface response. |
| event.combat.impact_confirmed | Combat | Source, target, hit position, normal, materials, action, intensity, damage type. | Impact profile only; damage is already resolved. |
| event.machine.processing_started | Automation | Machine ID, recipe family, power mode, speed/throughput parameters. | Start cue and transition into work loop. |
| event.machine.output_blocked | Automation | Machine ID, blocked port, fill ratio, severity. | Strain layer, warning light/effect/audio and accessibility warning. |
| event.magic.cast_committed | Magic/ability | Caster, school, spell family, origin anchor, target context, charge ratio. | Release sound/VFX/light/trail; cannot decide cast success. |
| event.structure.stage_completed | Construction | Structure, stage, affected region, material summary. | Completion dust, work sound, celebration or UI feedback. |
| event.weather.lightning_contact | Weather/world | World position, normal, struck material, intensity, wetness. | Lightning impact, thunder timing, debris, scorch and flash alternative. |

### 9.1 Contract Requirements

- Stable event ID and owning system.

- Required and optional payload fields with types and valid ranges.

- Expected maximum frequency and burst behaviour.

- Local, authoritative, replicated or cosmetic-only classification.

- Replay, reconnection and late-join policy.

- Permitted presentation outputs and criticality.

- Fallback when optional context is absent.

- Deprecation, alias and migration rules.

### 9.2 State Contracts

Long-running presentation uses read-only state contracts rather than repeated start events. A furnace may expose mode, powered, process progress, heat ratio, damage ratio, wet, corrupted and blocked fields. Presentation binds to those fields and reconstructs the current result after loading or late joining without replaying obsolete ignition events.

## 10. Presentation Context Packet and Resolution

A Presentation Context Packet carries the shared runtime facts needed to choose an appropriate profile variation. It prevents every resolver from inventing its own incompatible payload and reduces the number of one-off event names.

| Packet Group | Typical Fields |
| --- | --- |
| Identity | Event ID, source entity/asset, target entity/asset, owning world and optional instigator. |
| Action | Action type, tool/weapon/ability family, intensity, speed, weight and direction. |
| Materials | Source material, target material, surface family, quality, condition and optional armour/shield layer. |
| Spatial | World position, surface normal, struck voxel, face, anchor, region, path position and scale. |
| Environment | Biome, indoor/outdoor, acoustic zone, weather, wetness, temperature, water depth and wind. |
| Magic/State | Magic school, mana family, corruption/blessing, heat, damage, power, phase and tags. |
| Presentation | Listener distance, local-player relation, quality tier, accessibility settings and budget pressure. |

### 10.1 Resolver Example

```text
event.combat.impact_confirmed
source_material = steel
target_material = stone
action_type = heavy_melee
intensity = 0.82
environment = cave
wetness = 0.30
position = runtime hit point
normal = struck surface normal

Resolver output:
- heavy steel-on-stone sound variation
- compact stone debris voxel grammar
- low-probability metal spark cluster
- cave acoustic response
- reduced dust because the surface is wet
- heavy-contact camera/haptic references
- accessibility-equivalent directional cue if required
```

### 10.2 Resolution Order

1.  Validate the event or state contract and required payload.

2.  Resolve the owning binding and semantic spatial reference.

3.  Load the base Presentation Profile and inherited variants.

4.  Apply context-based material, environment, culture, magic and condition resolution.

5.  Compose active state layers and temporary-event channels.

6.  Apply accessibility and user presentation settings.

7.  Apply quality, budget, LOD, aggregation and virtualisation policy.

8.  Submit bounded playback commands to runtime audio, VFX, light and surface services.

## 11. Spatial Attachment Foundation

Presentation must attach through stable semantic references rather than fragile scene paths. Document 23B defines the complete data model and editor. This document locks the categories and responsibilities that every later subsystem must honour.

| Spatial Concept | Purpose |
| --- | --- |
| Anchor | Persistent named point or transform used as a stable origin, target or reference. |
| Socket | Anchor intended for attachment or follow behaviour, commonly linked to a part, bone, machine component or blueprint element. |
| Region | Named group of voxels, body area, faces or bounded volume used for distributed spawning, masking or state application. |
| Path | Ordered points or semantic route used by trails, beams, fluids, mana, power, wards or movement effects. |
| Surface Mask | Named weighted selection on a voxel face or texture surface, resilient to normal texture editing and capable of exact-pixel precision. |
| Zone | Bounded world/blueprint volume for ambience, acoustics, weather, fog, danger or environmental response. |
| Sound Portal | Opening connecting acoustic zones, such as a door, window, cave mouth, archway, vent or magical portal. |
| Runtime Anchor | Temporary position, normal, struck voxel/face and context supplied by an authoritative runtime event. |

### 11.1 Exact Placement

The editor may create anchors from an exact voxel, one voxel face, an edge, a vertex, a free local-space position, a selected body role, a rig bone, a blueprint cell or a painted surface mask. Orientation may derive from the selected face normal, path tangent, bone transform or manually edited local axes.

### 11.2 Semantic Mapping and Fallback

The semantic ID is stable; the physical mapping may vary. A dragon's breath origin can map to different head voxels for juvenile, armoured, damaged and LOD variants while remaining socket.vfx.breath_origin. Each mapping declares whether approximation is allowed, which fallback anchor is used and whether loss of the anchor blocks approval.

### 11.3 Mirroring and Families

Paired anchors and regions may declare mirror relationships, such as left/right feet, hands, wings, eyes and weapon trails. Templates may supply default anchors for a body plan, block family, machine family or blueprint module, while individual assets override only their physical mapping.

## 12. Material DNA and Response Families

Material DNA already defines palette, rendering and environmental behaviour. Presentation Forge extends it with reusable audio and VFX response families. The material record should not contain every final sound or effect instance; it references families that the context resolver combines with action, intensity, environment and state.

| Material Presentation Field | Role |
| --- | --- |
| Footstep family | Bare foot, boot, hoof, claw, wheel or creature contact variants by gait and intensity. |
| Impact family | Weapon, tool, projectile, falling object and collision responses. |
| Mining/harvest family | Pickaxe, axe, shovel, sickle, hammer and magical gathering response. |
| Placement/break family | Placement, support, crack, break, collapse, rubble and repair feedback. |
| Debris grammar | Voxel form, palette, shard proportions, bounce, gravity, lifetime and surface residue. |
| Spark/fragment rules | Probability and form for metal, crystal, magic, ember, ice or corruption fragments. |
| Environment response | Wet, snow, frost, heat, soot, moss, corrosion, mana and corruption overlays. |
| Resonance/acoustics | Ring, damping, hollowness, density and contact-tail behaviour. |

### 12.1 Response Matrix

```text
Source material
x Target material
x Action family
x Intensity band
x Environment
x Runtime state
= Presentation Profile or profile variation
```

The matrix should use broad reusable families and safe fallbacks. It must not require a unique authored asset for every possible combination. Unsupported pairings fall back through target family, generic hard/soft/organic categories and finally a visible/audible default rather than failing silently.

### 12.2 Procedural Grammars and Audio Families

VFX grammars describe bounded generation rules for smoke, debris, fire, splashes, rune rings, conduit flow, corruption spread, trails and construction dust. Audio families describe required layers, intensity bands, pitch ranges, variation, concurrency and environment response for footsteps, impacts, machines, magic, creatures and weather. Every generated result records seed, parameters, source family and tool version for reproducibility.

## 13. State Binding, Composition and Conflict Rules

One object may be active, wet, damaged, corrupted and temporarily struck at the same time. Presentation must compose those facts rather than forcing every combination into a unique complete asset. The channel system extends the layered-state rules established by the existing Forge.

| Channel | Typical Responsibility |
| --- | --- |
| Base identity | Model/material family, culture, biome and quality presentation. |
| Operation | Idle, starting, active, processing, blocked, stopping and fault modes. |
| Environment | Wet, snow, frost, mud, wind, underwater, soot and temperature response. |
| Damage/repair | Cracks, sparks, leaks, rubble, broken regions, scaffolds and repair progress. |
| Magic/world state | Powered, mana flow, blessed, corrupted, cursed, dimensional and boss-phase layers. |
| Warning/critical | Overload, danger, low resource, ward breach, raid alarm and interaction errors. |
| Temporary event | Impact, foot contact, completion, release, flash, burst and short-lived residue. |
| Accessibility | Alternative shape, flash, motion, sound, caption and directional presentation. |

### 13.1 Required Composition Fields

- Priority and channel ownership.

- Additive, replacing, masking or suppressing behaviour.

- Allowed simultaneous instances and maximum layer count.

- Entry, exit, interruption and cooldown rules.

- Spatial mask or affected region.

- Parameter ownership and clamp ranges.

- Accessibility substitution and budget fallback.

- Safe default when a referenced layer is missing.

### 13.2 Critical-Cue Protection

Decorative ambience, minor sparks and cosmetic residue may be dropped under budget pressure. Critical warnings, dangerous attacks, interaction confirmations and accessibility substitutes receive protected priority. A system must not mute a nearby overload alarm because a decorative machine hall has exhausted the audio voice budget.

## 14. Inheritance, Variants, Overrides and Migration

Presentation Forge uses the same deterministic inheritance and override model as the rest of the Forge. Families define common timing, state behaviour, material response and accessibility. Culture, biome, dimension, quality, enchantment, damage or corruption variants override only the fields that differ.

```text
presentation.machine.furnace.base
|-- presentation.machine.furnace.wood_fired
|-- presentation.machine.furnace.coal
|-- presentation.machine.furnace.mana
|-- presentation.machine.furnace.culture_dwarven
`-- presentation.machine.furnace.corrupted
```

### 14.1 Contract-Sensitive Changes

Changes to effect colour, sound layer or decorative cell count are usually cosmetic. Changes to required sockets, surface masks, orientation, path meaning, zone boundaries, event payload or gameplay-observed markers are contract-sensitive. They require dependency review and may require remapping or migration rather than a silent override.

### 14.2 Fallback and Remapping

- Missing specialised profile falls back to parent family.

- Missing variant anchor falls back to declared semantic parent or approved approximation.

- Missing material pairing falls back through material-category hierarchy.

- Invalid override is disabled while the last valid base presentation remains available.

- Renamed events, anchors and profiles use aliases or explicit migration records.

- Legacy sound/effect assets remain available until the replacement passes runtime, save and dependency tests.

### 14.3 Content Packs

Content packs may add or replace presentation profiles, sound families, effect grammars, materials and variants through manifest-declared dependencies. Conflicts resolve through the existing load-order and provenance rules. Packs cannot bypass event-contract validation or introduce unrestricted gameplay scripting.

## 15. Cross-System Integration Requirements

| Connected System | Presentation Requirement |
| --- | --- |
| Blocks and Items | Faces, materials, placement/break response, exact voxels, surface masks, held/dropped states, trails and runtime contacts. |
| Entity Forge | Mouth, feet, hands, wings, tails, damage regions, equipment sockets, voice points, breath origins and state layers. |
| Animation | Named events, trail windows, contact timing, release timing, phase, clip parameters and replay-safe markers. |
| Combat and Gear | Confirmed hit context, target material, block/parry state, armour layer, intensity and impact point. Presentation never confirms damage itself. |
| Creatures and Bosses | Voice families, movement contacts, habitat ambience, attack origins, body-region effects, phase transitions and scale-aware budgets. |
| NPC Villages | Work loops, construction, markets, alarms, celebrations, mourning, festivals, dense crowd aggregation and culturally varied ambience. |
| Automation | Machine modes, speed, throughput, blocked/fault/damage states, power paths, mana paths, exhausts, ports and cluster virtualisation. |
| Magic | Schools, mana families, runes, wards, rituals, conduits, corruption, portals, casting events and accessibility-safe hazard cues. |
| Worldgen/Biomes | Ambient zones, caves, forests, weather, leylines, water, terrain materials, acoustic profiles and distant environmental LOD. |
| Structures/Blueprints | Rooms, doors, sound portals, chimneys, emitters, effect volumes, construction stages, damage regions, roads and network paths. |
| Fluids and Weather | Flow paths, outlets, drips, splashes, rainfall contacts, shelter transitions, wind and material wetness. |
| UI and Accessibility | Captions, directional cues, warning indicators, reduced motion/flash, volume categories and user presentation settings. |
| Multiplayer | Authoritative event source, deterministic variation where needed, local listener context, late join and content compatibility. |

### 15.1 System-Owned Queries

Some presentation requires runtime queries, such as the material beneath a foot, the struck voxel, whether a point is indoors, the acoustic zone containing a listener or the current mana-flow direction. The owning gameplay/world service performs the query or provides a safe read-only interface. Presentation definitions do not scan or mutate the world through arbitrary code.

## 16. Blueprint, Structure and World-Space Presentation

Blueprint Forge is the authoring source for presentation that belongs to spaces rather than one portable asset. A building, cave, village street, dungeon, forest pocket or portal chamber may contain audio emitters, ambient regions, effect volumes, sound portals, ward paths and environmental presentation rules as semantic layers.

| Blueprint Layer | Use |
| --- | --- |
| Audio Emitters | Point or area sources such as bell, waterfall, forge, portal, insects or machinery. |
| Ambient Regions | Layered soundscape and environmental VFX zones with time, weather, culture and danger conditions. |
| Acoustic Zones | Bounded rooms/caves with enclosure, material, reverb, damping and priority. |
| Sound Portals | Openings that control leakage and transitions between zones. |
| VFX Emitters | Chimney smoke, campfire embers, waterfall spray, dust vents and magical sources. |
| VFX Volumes | Fog, spores, pollen, snow pockets, corruption haze, underwater cells and ritual fields. |
| Presentation Paths | Ward perimeters, mana conduits, portal routes, item-flow previews and corruption spread guides. |
| Surface Regions | Persistent soot, moss, frost, scorch, wetness, construction dust and damage residue. |
| Presentation Events | Stage completion, door/gate movement, alarm, ritual activation, collapse and restoration hooks. |

### 16.1 Acoustic Zones and Sound Portals

The system should use a bounded zone graph rather than tracing through every voxel continuously. Blueprint analysis may estimate room volume, enclosure, dominant materials, openings and damping, then generate a reviewable acoustic profile. Doors, windows, arches, cave mouths, vents, chimneys and magical portals become sound portals whose open/closed or active state affects leakage and transition.

### 16.2 Procedural and Player-Built Structures

Generated and player-built structures cannot rely only on hand-authored room layouts. The technical implementation should support automatic zone suggestion and incremental rebaking for bounded local areas, with conservative fallbacks when a space cannot be classified. The exact runtime strategy is defined in 23G and 23I.

## 17. Runtime Authority, Determinism, Saving and Multiplayer

### 17.1 Authority

The authoritative local world or server emits gameplay events and publishes state. Clients may select local listener-dependent variation, attenuation and accessibility, but cannot invent authoritative impacts, machine transitions, spell releases or world-state changes. Cosmetic ambience may be locally seeded where exact synchronisation has no gameplay meaning.

### 17.2 Determinism

- Procedural effect and sound variation records deterministic seeds when visual consistency, replay or multiplayer review requires it.

- Purely decorative ambient variation may use local seeds if it cannot misrepresent gameplay state.

- State-driven loops reconstruct from current state and phase rather than replaying obsolete entry events after load or late join.

- Network-path effects derive direction and phase from authoritative flow summaries or declared presentation clocks.

### 17.3 Persistence

Most particles and one-shot sounds are transient and do not enter saves. Persistent surface presentation, active long-running rituals, fire state, corruption, construction residue or other meaningful layers may save compact state such as profile ID, owner, region, intensity, age, seed and expiry policy. Tiny cosmetic marks should be discardable or reproducible to avoid save bloat.

### 17.4 Content Compatibility

Multiplayer sessions validate required presentation content packs and contract versions. A client missing optional cosmetic variants may fall back to an approved base profile. A client missing a critical event contract, anchor mapping or required hazard presentation cannot silently continue with misleading feedback.

## 18. Performance, LOD, Aggregation and Virtualisation

High-detail authoring does not imply full-detail playback everywhere. Every presentation family must define a bounded cost and fallback chain. Runtime systems preserve meaning first, then reduce density, secondary layers, collision, lights, voices and update frequency.

| Budget Area | Profile Controls |
| --- | --- |
| VFX cells/particles | Maximum active cells, spawn rate, cluster complexity, transparent overlap and secondary emitters. |
| Trails and paths | Maximum segments, history length, sample frequency and distant simplification. |
| Lights | Dynamic-light count, range, shadow policy, pulse rate and merge rules. |
| Audio voices | Per-family and global concurrency, priority, cluster aggregation and virtualisation. |
| Updates | Graph tick rate, collision/query frequency, zone updates and staggered processing. |
| Memory | Source preload, baked variants, cached clusters, source clips and streaming policy. |
| Network | Replicated event frequency, coalescing, context compression and critical-event protection. |

### 18.1 Standard Fallback Chain

```text
Full -> Reduced -> Minimal -> Critical cue only -> Hidden or virtualised
```

The final step depends on importance. A decorative pollen effect may become hidden. A dangerous boss attack must retain a critical shape, sound or directional warning even at the lowest approved tier.

### 18.2 Aggregation

- Many identical furnaces may become a small number of spatial factory-hum emitters at distance.

- Long conveyor or mana networks may show pulses only near visible junctions and the listener.

- Dense rain contacts may be represented by local listener cells and broad surface response rather than one particle per drop.

- Crowd work sounds may group by job/area while preserving nearby individuals and important dialogue/warnings.

### 18.3 Virtualisation and Phase Continuity

A virtualised loop or effect may stop rendering or producing a voice while retaining compact logical phase and state. When it becomes relevant again, it resumes from the current authoritative presentation state rather than restarting visibly or audibly from the beginning.

## 19. Accessibility and Equivalent Feedback

Accessibility is authored with the Presentation Profile rather than added after asset production. Important information should survive reductions in motion, flash, colour dependence, high-frequency sound, particle density or audio output.

| Accessibility Need | Authoring Direction |
| --- | --- |
| Reduced motion | Lower travel distance, slower or stepped motion, shorter trails, fewer orbiting cells and static alternatives where safe. |
| Reduced flash | Replace rapid bright pulses with bounded expansion, emissive hold, shape change or slower luminance curves. |
| Colour independence | Use silhouette, pattern, direction, timing and sound differences in addition to colour. |
| Visual substitute for sound | Warning light, voxel pulse, caption, directional indicator or UI state for alarms and threats. |
| Audio substitute for visual | Distinct cue, stereo direction, rhythm or controller response for visually subtle warnings. |
| Captions | Localisable labels for meaningful non-speech sounds, source category and optional direction/distance. |
| Frequency comfort | Alternative versions for piercing, high-frequency, low-frequency or repetitive sounds where practical. |
| Particle density | Simplified profile retaining source, direction, impact and hazard boundary. |

### 19.1 Critical Information Test

Every critical profile should be tested with audio muted, particles reduced, reduced flash enabled and colour filters applied. The result is acceptable only when the player can still identify the source, broad meaning, urgency and required response through at least one enabled channel.

## 20. Creator Workflow, Preview and Test Laboratory

### 20.1 Standard Workflow

1.  Open or create the owning asset, entity, animation, blueprint or standalone presentation family.

2.  Select or create the required semantic anchor, socket, region, path, mask or zone.

3.  Choose an approved event/state contract or create a contract request for the owning gameplay system.

4.  Select a Presentation Profile template or build a new profile from VFX, audio, light and surface components.

5.  Map context fields, material responses, intensity bands and variant rules.

6.  Preview entry, loop, exit, interruption and layered state combinations.

7.  Test accessibility, quality tiers, LOD, aggregation and budget pressure.

8.  Run validation, dependency review, provenance and licence checks.

9.  Approve editable source and bake deterministic runtime products.

10.  Test in a representative Leyforge scenario before release or migration.

### 20.2 Runtime Capture and Replay

The Test Laboratory should capture a compact presentation trace from gameplay: events, state changes, parameters, anchors, listener movement and timing. A developer can replay that trace while editing sound, effect timing, loop transitions, sockets, budgets and accessibility without repeatedly reproducing the gameplay situation.

```text
Capture: Furnace_Blockage_Test
0.00 event.machine.processing_started
0.05 state.mode = active
4.40 param.output_fill = 1.00
4.42 event.machine.output_blocked
4.45 state.mode = blocked
6.80 param.output_fill = 0.25
6.82 state.mode = active
6.90 work loop resumes
```

### 20.3 Required Preview Contexts

- Day, night, cave, interior, rain, fog, mana-lit and corrupted lighting.

- Stationary and moving listener tests at multiple distances and directions.

- Single asset, repeated row, dense factory, busy village and raid/boss stress scenes.

- First person, third person, top-down/icon and split-screen views where relevant.

- Open/closed doors, acoustic-zone transitions and indoor/outdoor leakage.

- Base, variant, damage, accessibility and LOD comparison views.

## 21. Summer Engine and AI-Assisted Authoring Boundaries

Summer Engine may accelerate development and authoring, especially for repetitive setup, first-pass suggestions and diagnostics. It must remain an assistant rather than the unreviewed authority over style, contracts, licences or release approval.

| Assistance Area | Permitted Use |
| --- | --- |
| Spatial suggestions | Detect likely mouth, foot, hand, chimney, exhaust, blade edge, trail or room regions for developer review. |
| VFX assistance | Generate first-pass voxel grammars, cluster variants, LOD reductions and colour/shape accessibility alternatives. |
| Audio assistance | Suggest layer families, loop points, click removal, variation ranges, source matching and mix conflicts. |
| Contract diagnostics | Find missing event payloads, unresolved anchors, unsafe frequency, duplicate profiles or unavailable context fields. |
| Performance assistance | Estimate budgets, identify dense overlap, suggest aggregation and generate worst-case test layouts. |
| Production assistance | Create registry drafts, dependency lists, provenance forms, test matrices and migration checklists. |

### 21.1 Mandatory Controls

- AI changes are reviewable suggestions with diff, source and tool-version history.

- Generated/imported media requires provenance and licensing metadata.

- AI cannot approve assets, change authoritative event contracts or bypass validation.

- Developers can revert, replace or manually edit every generated result.

- Runtime content does not depend on a remote AI service.

## 22. Registries, Manifests, Packaging and Production States

Every presentation definition resolves through stable IDs and explicit dependencies recorded in the Forge Project Manifest. File paths are implementation details rather than public identity. The resolver should be able to explain which base profile, variant, override, source assets, spatial mapping, accessibility alternative and runtime product produced the current result.

| Registry | Purpose |
| --- | --- |
| Presentation Profile Registry | Bundles and family inheritance. |
| Sound Event Registry | Audio events, layers, variation, buses, spatial profiles and source provenance. |
| VFX Registry | Effects, grammars, clusters, trails, volumes, surfaces, lights and LOD. |
| Event/State Contract Registry | Allowed authoritative inputs and payload versions. |
| Spatial Reference Registry | Anchors, sockets, regions, paths, masks, zones and portals. |
| Material Response Registry | Material-family presentation defaults and response matrices. |
| Budget/Accessibility Registry | Reusable performance and equivalent-feedback profiles. |
| Acoustic Registry | Zones, portals, environment profiles, buses and mix snapshots. |

### 22.1 Lifecycle States

```text
Draft -> In Review -> Approved Source -> Baked -> Verified In Context -> Release Ready -> Deprecated
```

Approval is representation-specific. A Presentation Profile may be approved while one culture variant, one accessibility alternative or one distant LOD remains incomplete. Release-ready status requires every mandatory representation for the target scope to pass.

### 22.2 Packaging

- Package only required baked products and declared source dependencies for the target build/content pack.

- Retain editable source in project storage even when not shipped.

- Include event/anchor contract versions and aliases.

- Include provenance/licence manifests for source audio and generated media.

- Preserve safe fallback profiles during migration windows.

- Generate dependency, budget and accessibility reports as release artefacts.

## 23. Minimum Viable Presentation Forge and Phasing

The MVP must prove one shared system rather than isolated audio and particle demos. It should use the Forest Hamlet slice and representative Forge assets so spatial attachments, context resolution, state layering, accessibility, LOD, capture/replay and runtime products are exercised together.

| MVP Test | What It Proves |
| --- | --- |
| Basic furnace | Ignition, work loop, heat, flame/smoke, chimney anchor, blocked warning, damage layer, shutdown, audio virtualisation and state reconstruction. |
| Mining impact set | Iron pickaxe against stone, ore and wood-equivalent test targets using material context, runtime hit point, sound variation, voxel debris and wet/cave variants. |
| Footstep set | Humanoid or creature contacts on grass, dirt, stone, wood and shallow water using animation events, surface query and accessibility captions. |
| Mana conduit/ward | Path-based mana pulse, hum, powered/unpowered state, corruption layer, ward breach event and reduced-flash alternative. |
| Creature or boss ability | Charge, release, trail/stream, sound, light and impact from semantic mouth/ability socket with LOD and protected hazard cue. |
| Rain/environment | Weather volume, local contact effects, roof/ground material sound response, indoor transition and performance aggregation. |
| Persistent surface | Scorch, wetness or mana residue attached to voxel faces with age, expiry, cleaning/override and save policy. |
| Blueprint acoustic test | One cottage, cave or workshop with acoustic zones, door sound portal, interior/exterior transition and source leakage. |

### 23.1 Delivery Phases

| Phase | Outcome |
| --- | --- |
| Phase 1 - Shared contracts | Presentation Profile schema, event/state contracts, context packet, registries and authority rules. |
| Phase 2 - Spatial foundation | Anchors, sockets, regions, paths, masks, zones, remapping and fallback. |
| Phase 3 - VFX authoring | Voxel effect templates, graphs, clusters, trails, surface layers, lights and preview. |
| Phase 4 - Audio authoring | Sound sources, layering, events, variation, loops, material families and buses. |
| Phase 5 - Spatial audio/world | Attenuation, occlusion, acoustic zones, sound portals, ambience and mix snapshots. |
| Phase 6 - Unified workflow | Editor integration, runtime capture/replay, diagnostics, accessibility and review. |
| Phase 7 - Runtime implementation | Godot resources, pools, resolver, baking, hot reload, networking, budgets and tests. |
| Phase 8 - Production library | Golden effects/sounds, migration, provenance and Forest Hamlet acceptance. |

### 23.2 Explicit MVP Deferrals

- Full adaptive music composition system.

- Full dialogue recording, lip-sync and localisation voice pipeline.

- Every final biome, creature, spell, weapon and machine sound/effect family.

- Public user scripting and marketplace distribution.

- High-cost real-time per-voxel acoustic simulation across whole cities.

- Film-quality destruction, fluid, cloth and volumetric simulation.

- Final platform-specific optimisation for every future console.

## 24. Success Criteria and Relationships With Documents 23B-23J

### 24.1 Presentation Forge Acceptance

- VFX source remains visibly three-dimensional and voxel-authored through editing, preview and runtime baking.

- Audio and VFX share event, context, spatial, inheritance, accessibility and budget foundations rather than duplicating incompatible systems.

- A developer can attach sound/effects to an exact voxel, face, named mask, socket, region, path, blueprint cell or runtime impact without fragile manual scene wiring.

- Material response resolves useful footsteps, impacts, mining, break and environment variants from shared context.

- State-driven presentation reconstructs correctly after reload, late join or LOD promotion without replaying obsolete events.

- Active, wet, damaged, corrupted, warning and temporary-event feedback combine through explicit channels and fallbacks.

- Dense villages, factories, weather and boss scenes remain within reusable budgets through aggregation and virtualisation.

- Critical cues survive low quality, reduced motion, reduced flash, colour filtering and muted audio through authored alternatives.

- Overrides and content packs preserve stable gameplay IDs, event contracts and semantic spatial references or require explicit migration.

- Runtime capture/replay, validation and representative in-world tests support efficient iteration.

- Summer Engine assistance remains reviewable, reversible and non-authoritative.

- The Forest Hamlet MVP demonstrates a coherent presentation layer across assets, entities, animation, blueprints, automation, magic and weather.

| Acceptance Rule The 23A foundation is not complete because the Forge can play one sound and emit one particle effect. It is complete when audio, voxel VFX, lights, surfaces and related feedback resolve from the same authoritative contracts, spatial language, material context, override model, accessibility rules and bounded runtime architecture. |
| --- |

### 24.2 Document Set Responsibilities

| Document | Responsibility |
| --- | --- |
| 23A - Presentation Forge: Vision, Scope and Shared Foundation | Master identity, architecture, rules, boundaries, MVP and success criteria. |
| 23B - Spatial Anchors, Sockets, Regions, Paths and Attachment System | Exact voxel/face/edge/vertex/mask placement, remapping, mirroring, zones, portals and runtime anchors. |
| 23C - Presentation Events, Bindings, Parameters and Cross-System Integration | Event Contract Registry, Context Packet, state binding, profile composition and system contracts. |
| 23D - VFX Forge Core Authoring System | Effect library, voxel forms, templates, graph identity, inheritance, workflow and validation. |
| 23E - Voxel Particle Graph, Emitters, Trails, Volumes, Lighting and Simulation | Detailed nodes, motion, collisions, paths, surface layers, weather, LOD, pooling and runtime patterns. |
| 23F - Audio Forge Core Authoring and Sound Event System | Sources, layers, processing, variation, loops, events, families, provenance and workflow. |
| 23G - Material Audio, Spatial Sound, Ambience, Acoustics and Runtime Mixing | Response matrices, attenuation, occlusion, zones, portals, buses, snapshots, aggregation and accessibility. |
| 23H - Unified Presentation Forge UI/UX, Workflow and Test Laboratory | Workspace, editors, previews, runtime capture/replay, diagnostics, collaboration and comfort. |
| 23I - Godot and Summer Engine Technical Implementation Plan | Resources, services, baking, resolver, pools, audio runtime, networking, saves, performance and tests. |
| 23J - Presentation Libraries, Production Pipeline, Testing and Migration Plan | Golden content, registries, naming, provenance, batches, migration, release gates and acceptance matrix. |

## Appendix A. Unified Forge Workspace Map

```text
Shared Project Areas
|-- Home / Project Dashboard
|-- Library / Search / Dependencies
|-- Test Laboratory / Runtime Capture
|-- Review / Compare / Approval
`-- Package / Migration / Reports

Specialist Workspaces
|-- Asset Forge
|-- Entity Forge
|-- Blueprint Forge
`-- Presentation Forge
    |-- Presentation Profile Editor
    |-- Event and State Contract Browser
    |-- Anchor / Socket / Region / Path / Mask Editor
    |-- VFX Forge
    |   |-- Effect Library
    |   |-- Voxel Cluster Editor
    |   |-- Effect Graph and Timeline
    |   `-- Surface / Volume / Light Editors
    `-- Audio Forge
        |-- Source and Layer Library
        |-- Waveform / Event / Loop Editor
        |-- Spatial / Acoustic Preview
        `-- Bus / Snapshot / Mix Inspector
```

## Appendix B. Core Presentation Rule Register

| Rule ID | Locked Rule |
| --- | --- |
| PRES-001 | Gameplay systems own truth; presentation reads declared truth. |
| PRES-002 | Approved VFX source is genuinely three-dimensional and voxel-authored. |
| PRES-003 | Audio is stylised and readable but not universally 8-bit. |
| PRES-004 | Semantic spatial IDs are stable; physical mappings may vary through explicit remapping. |
| PRES-005 | Named surface masks are preferred over fragile raw pixel coordinates. |
| PRES-006 | Events and state fields must exist in validated contracts. |
| PRES-007 | Context, material and environment resolution should replace uncontrolled one-off duplication. |
| PRES-008 | Presentation Profiles bundle related feedback and accessibility alternatives. |
| PRES-009 | Compatible states combine through explicit composition channels. |
| PRES-010 | Critical cues receive protected budget and accessibility treatment. |
| PRES-011 | Editable source and baked runtime products remain separate. |
| PRES-012 | Overrides preserve stable identity and contracts or require migration. |
| PRES-013 | Generated/procedural results record seed, parameters and provenance. |
| PRES-014 | Dense presentation uses LOD, aggregation, pooling and virtualisation. |
| PRES-015 | AI assistance cannot approve assets or redefine gameplay contracts. |

## Appendix C. Presentation Asset-Type Matrix

| Owner Type | Typical Presentation | Spatial References |
| --- | --- | --- |
| Block | Material response, face masks, break/placement, persistent surface | Whole block, face, voxel, mask, runtime contact |
| Item/Weapon | Swing trail, impact, enchantment, held/drop sound | Grip, edge, tip, path, runtime contact |
| Machine | Start/loop/blocked/fault/damage, smoke, sparks, alarms | Motor, gearbox, output, chimney, warning, network path |
| Humanoid/NPC | Footsteps, tools, voice, work, status, equipment | Feet, hands, mouth, chest, equipment, body regions |
| Creature/Boss | Voice, movement, breath, attack, phase, damage | Mouth, limbs, wings, tail, weak regions, ability paths |
| Structure | Ambience, rooms, doors, construction, damage, weather | Emitters, zones, sound portals, paths, volumes, surfaces |
| Magic Network | Flow, hum, pulse, overload, ward, corruption | Conduit path, junction, core, perimeter, breach runtime anchor |
| Biome/Weather | Ambience, rain, wind, fog, water, insects, leylines | World zones, surfaces, listener cells, generated paths |

## Appendix D. MVP and Acceptance Checklist

- [ ] Presentation Profile, Event Contract and Context Packet schemas are approved.

- [ ] Anchor/socket/region/path/mask references resolve through stable IDs.

- [ ] Furnace scenario passes idle, ignition, active, blocked, damaged, cooling and reload tests.

- [ ] Mining impacts resolve at runtime contact points for at least three target materials.

- [ ] Footsteps use animation contacts and surface context across at least five surfaces.

- [ ] Mana conduit/ward uses path presentation, state layering and reduced-flash fallback.

- [ ] Creature/boss ability uses semantic socket, timing event, LOD and critical hazard cue.

- [ ] Rain/environment test passes outdoor, roof, ground, indoor and budget stress cases.

- [ ] One persistent surface layer saves or expires according to policy.

- [ ] One blueprint acoustic-zone and sound-portal test passes.

- [ ] Audio buses, priority and virtualisation preserve warnings under dense load.

- [ ] VFX style validator rejects non-approved smooth/billboard source effects.

- [ ] Reduced motion, reduced flash, colour filters and audio-muted tests retain critical information.

- [ ] Runtime capture/replay can reproduce at least one machine and one combat/magic trace.

- [ ] Overrides, fallback, content-pack conflict and migration tests pass.

- [ ] Baked Godot resources load without editable source at runtime.

- [ ] Forest Hamlet representative scene passes target performance budgets.

## Appendix E. Glossary

| Term | Meaning |
| --- | --- |
| Presentation Forge | Unified authoring branch for Audio Forge, VFX Forge and shared sensory-feedback systems. |
| Presentation Profile | Reusable bundle linking sound, VFX, light, surface and related feedback to one meaning. |
| Event Contract | Validated transient-event definition with owner, payload and runtime policy. |
| State Contract | Read-only long-running values exposed by an authoritative system. |
| Presentation Context Packet | Shared runtime facts used to resolve material, environment and intensity variation. |
| Anchor | Stable named point or transform. |
| Socket | Anchor intended for attachment or follow behaviour. |
| Region | Named voxel, face, body or volume group. |
| Path | Ordered semantic route used by trails, flows, beams or boundaries. |
| Surface Mask | Named weighted selection on a face or texture surface. |
| Runtime Anchor | Temporary contact/impact position and normal supplied by gameplay. |
| Acoustic Zone | Bounded space with a reviewed sound-environment profile. |
| Sound Portal | Opening connecting acoustic zones and controlling leakage. |
| VFX Grammar | Reproducible procedural rules for a family of voxel effects. |
| Audio Family | Reusable construction and variation rules for related sound events. |
| Virtualisation | Suspending costly playback while preserving compact state/phase for later resume. |
| Aggregation | Replacing many similar sources with a bounded grouped representation. |
| Persistent Surface Presentation | Face/region feedback that survives longer than a transient particle and may have save/expiry rules. |
