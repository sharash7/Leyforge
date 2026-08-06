# Fantasy Voxel Civilisation Sandbox
## 23D - Presentation Forge
### Particle and VFX Forge - Core Authoring System
**Version 0.1 - Detailed Design Bible Draft**

A creator-facing authoring foundation for genuine three-dimensional voxel effects, reusable VFX families, effect templates, materials, palettes, timing, spatial bindings, persistent surface presentation, runtime baking, accessibility and scalable deployment across Leyforge's living voxel world.

*Working design document - VFX identity, asset taxonomy, source model, effect families, authoring workflow, inheritance, validation, runtime products and Forest Hamlet MVP foundation*
## Particle and VFX Forge System Statement
| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Particle and VFX Forge workspace, approved effect forms, VFX asset taxonomy, source records, effect projects, templates, families, palettes, voxel clusters, timing, graph boundaries, spatial and event integration, persistent surface presentation, lifecycle, validation, baking, performance policy and MVP library. |
| Core Philosophy | Visual effects must communicate authoritative world state through readable three-dimensional voxel forms. Effects are authored as reusable data and geometry systems, not as hidden gameplay logic or disposable one-off scene scripts. |
| Fixed Style | Approved authored effect geometry uses cubes, cuboids, voxel shards, voxel clusters, voxel-frame sequences, voxel paths, voxel surface cells and other clearly voxel-derived forms. Conventional camera-facing particle sprites, soft billboard smoke, smooth ribbon trails and unrelated smooth-mesh particles are not approved source forms. |
| Authoring Direction | Use a guided effect-project workflow combining templates, family inheritance, voxel-form editing, palette and material roles, timing tracks, bounded graph composition, spatial bindings and context-driven parameters. |
| Asset Direction | Separate editable canonical VFX source from generated runtime products. Every effect has a stable ID, manifest, dependencies, provenance, lifecycle state, compatibility version, budget profile, accessibility variants and validation status. |
| Family Direction | Create reusable families and procedural grammars for smoke, fire, debris, splashes, weather contact, trails, beams, rune effects, mana flow, corruption, construction and other recurring presentation needs. |
| Spatial Direction | Consume anchors, sockets, regions, paths, boundaries, Surface Masks, zones and runtime contact packets defined by Document 23B. The VFX Forge does not create a second incompatible attachment system. |
| Event Direction | Consume Presentation Profiles, event contracts, state parameters, context packets, bindings, composition channels and lifecycle rules defined by Document 23C. |
| Material Direction | Material DNA supplies default debris forms, colours, spark rules, residue, heat response, magic response and surface behaviour. Specific assets inherit those defaults and override only meaningful differences. |
| Lighting Direction | Effects may emit or reference voxel-compatible light profiles, but lights remain bounded components with explicit intensity, radius, shadow, flicker, accessibility and LOD policies. |
| Persistent Direction | Long-lived wetness, frost, soot, scorch, mud, residue, corruption, footprints and similar changes use Surface Presentation Layers rather than unbounded particles or destructive texture duplication. |
| Accessibility Direction | Every informationally important effect declares reduced-motion, reduced-flash, colour-independent and critical-cue fallback behaviour. Decorative density may be reduced before critical form or timing is removed. |
| Performance Direction | Every effect declares cost class, budget profile, LOD chain, aggregation policy, virtualisation behaviour, fallback form and worst-case concurrency assumptions. |
| Runtime Direction | Godot runtime products use compact baked definitions, pooled emitters, shared geometry and material resources, bounded update work, deterministic variation where required and semantic replication rather than editor graphs running unrestricted in shipped builds. |
| Summer Engine Direction | Summer Engine may suggest templates, socket usage, palettes, effect variants, optimisation and tests, but generated work remains reviewable, provenance-tracked and subject to human approval and validation. |
| MVP Direction | Prove voxel fire and smoke, mining debris, block break and placement effects, footsteps and weather contact, a machine loop, mana flow and ward response, creature attack telegraph and impact, construction dust, persistent scorch or wetness, accessibility variants and dense-scene budget behaviour. |
| Relationship to 23E | 23D defines the authoring product, data architecture and creator workflow. Document 23E defines the detailed Voxel Particle Graph node catalogue, emitters, trails, volumes, lighting simulation, collision and runtime evaluation rules. |

## Document Purpose

Documents 23A through 23C establish the Presentation Forge identity, its spatial reference language and the contract-driven communication boundary between gameplay and presentation. This document turns those foundations into a practical creator-facing VFX authoring system. It defines what an effect asset is, how it is created, how voxel forms are built and reused, how families inherit, how presentation profiles call effects, how variants are selected, how content is validated and how the result is baked for Godot.

Leyforge requires more than a collection of isolated particle scenes. The same visual language must support a dirt footstep, iron mining impact, furnace chimney, mana conduit, ward breach, goblin attack, village construction stage, rainstorm, corruption spread and dimensional portal. Those effects must remain recognisably cubic, readable at gameplay distance, inexpensive enough for dense villages and compatible with variants, content packs, multiplayer and accessibility settings.

The Particle and VFX Forge therefore treats effects as structured projects. A project references one or more effect definitions, voxel forms, material and palette roles, timing data, spatial inputs, parameter mappings, child effects, surface layers, light references, budget profiles and fallback variants. The creator can begin from a template, edit visually, preview context, validate dependencies and approve a compact runtime product without writing a bespoke script for every effect.

This document intentionally does not enumerate every graph node or prescribe final low-level Godot classes. Those details belong to 23E and 23I. It defines the stable authoring contract those later documents must implement.
## Engine and Forge Status Note

Leyforge currently targets Godot with Summer Engine as the AI-native development environment. The VFX Forge should produce ordinary reviewable project data and generated Godot resources. Shipped effects must not require an online AI service. Summer Engine may inspect existing assets, generate candidates and assist with repetitive authoring, but it cannot silently alter approved effects, event contracts, budget classes or runtime authority.

The system must preserve the project's fixed voxel direction and 32 x 32 material language while allowing effect geometry at multiple practical scales. A one-metre world block remains the primary spatial reference; effect cells and voxel clusters may use smaller canonical units so sparks, embers, motes and debris remain readable without pretending the world is made only of one-metre cubes.
## Design Sources
| Source | Relevant Direction | How 23D Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | The game is a stylised high-fidelity fantasy voxel world where lighting, magic, machines, creatures and civilisation consequences must remain readable. | Locks the atmospheric but non-realistic effect identity and requires VFX to serve survival, villages, automation, magic and world change. |
| 03 - Blocks Registry | Blocks have materials, faces, states, damage, fluids, automation roles, magic roles and visible world-state evidence. | Defines material-driven debris, face effects, break/placement families, damage presentation and persistent surface layers. |
| 07 - NPC Village System | NPC work, construction, repairs, raids, shortages, celebration, damage and village growth must be visible. | Requires construction dust, work effects, alarms, ward responses, damage aftermath and scalable dense-settlement presentation. |
| 08 - Automation System | Machines use visible item flow, power, heat, faults, mana, logistics and village supply. | Requires state-driven loops, path effects, exhaust, sparks, steam, warnings, aggregation and phase-continuous LOD. |
| 09 - Magic System | Magic uses mana, runes, conduits, wards, rituals, portals, corruption and practical infrastructure. | Requires rune families, mana flow, ward boundaries, spell stages, ritual composition, corruption and material-purity variants. |
| 10 - Creatures and Monsters | Creatures must be recognised by silhouette, movement, sound, attacks, habitat and phase. | Requires body-socket effects, telegraphs, breath origins, footprints, status regions, boss-scale effects and readable counterplay. |
| 11 - Biomes and World Generation | Weather, ambience, leylines, water, corruption, seasons and civilisation alter the world. | Requires environmental families, biome palettes, weather contact, ambient volumes and regional state presentation. |
| 12 - Structures | Structures are dynamic, damaged, restored, occupied, warded and connected through roads, portals and projects. | Requires blueprint emitters, construction stages, zone effects, path presentation and persistent structure aftermath. |
| 16 - Combat, Gear and Defence | Combat, equipment, armour, attacks, damage, guards and raids require readable action feedback. | Requires trails, impacts, blocks, parries, armour-material response, telegraphs and accessibility-safe critical cues. |
| 23A - Shared Presentation Foundation | Presentation Forge owns scalable audio/VFX feedback but not gameplay truth; VFX uses genuine 3D voxel forms. | Provides the fixed VFX identity, profiles, material response, accessibility, performance and shared-service boundaries. |
| 23B - Spatial Attachment System | Defines anchors, sockets, regions, paths, masks, zones, portals and runtime contact references. | All VFX placement and movement consumes the shared semantic spatial system. |
| 23C - Events and Bindings | Defines event/state contracts, context packets, bindings, resolution, composition and multiplayer lifecycle. | Effects are dispatched and parameterised through declared contracts rather than direct gameplay calls. |

## Static Table of Contents
- 1. Locked Particle and VFX Forge Identity
- 2. Approved Direction Summary
- 3. VFX Forge Architecture and Workspace Boundaries
- 4. VFX Asset Taxonomy and Stable IDs
- 5. Canonical Source, Manifests and Runtime Products
- 6. Fixed Three-Dimensional Voxel Effect Language
- 7. Effect Scale, Density, Orientation and Readability
- 8. Voxel Forms, Clusters, Shards and Frame Sequences
- 9. Effect Definitions, Projects and Composition
- 10. Effect Families, Templates, Grammars and Inheritance
- 11. Palette, Material DNA, Emission and Light Roles
- 12. Timing, Lifecycle, Loops and Sequencing
- 13. VFX Graph Boundary and Authoring Domains
- 14. Spatial Attachment and Surface Mask Integration
- 15. Event, Context, Parameter and Binding Integration
- 16. Child Effects, Layering, Channels and Composition
- 17. Trails, Beams, Paths, Boundaries and Flow Presentation
- 18. Persistent Surface Presentation and Residue
- 19. Environmental, Weather, Fluid and Ambient VFX
- 20. Blocks, Mining, Construction and Destruction VFX
- 21. Machines, Automation, Power and Village Industry VFX
- 22. Magic, Runes, Wards, Portals and Corruption VFX
- 23. Combat, Equipment, Creatures and Boss VFX
- 24. Culture, Biome, Dimension, Variant and Content-Pack Rules
- 25. Creator Workspace, Editing Tools and Workflow
- 26. Preview Laboratory, Runtime Capture and Comparison
- 27. Accessibility, Safety and Equivalent Feedback
- 28. Performance, LOD, Aggregation and Virtualisation
- 29. Determinism, Multiplayer, Replay, Saving and Unloaded World
- 30. Validation, Diagnostics, Testing, Migration and Repair
- 31. Summer Engine and AI-Assisted VFX Authoring
- 32. Minimum Viable VFX Forge and Forest Hamlet Tests
- 33. Balancing Rules and Explicit Non-Goals
- 34. Open Questions for Later Documents
- Appendix A. VFX Data Templates
- Appendix B. Recommended VFX Family Catalogue
- Appendix C. Voxel Effect Style Register
- Appendix D. Cross-System VFX Matrix
- Appendix E. Validation and Acceptance Checklist
- Appendix F. Worked Examples

## 1. Locked Particle and VFX Forge Identity
The Particle and VFX Forge is the visual-effect authoring layer of the unified Leyforge Forge. It creates reusable voxel effect assets that communicate movement, contact, material response, weather, machine activity, magic, damage, danger, construction and world-state change. It does not own the gameplay event, the authoritative state or the spatial truth that caused an effect.
| Locked Rule |
| --- |
| A VFX asset must remain recognisably three-dimensional and voxel-derived, consume only approved presentation contracts and spatial references, declare bounded runtime behaviour, preserve critical readability and remain editable as canonical Forge source. |

### 1.1 VFX Promise
- A creator can begin with a semantic goal such as stone impact, chimney smoke, mana flow or ward breach and reach a validated runtime effect without building a bespoke scene script.
- A player can read the effect at intended camera distance and understand what material, action, state, direction or danger it represents.
- A developer can trace every effect instance back to an event or state contract, binding, Presentation Profile, spatial reference, source asset, variant and budget decision.
- A content pack can replace or extend an effect family through stable IDs and declared overrides without modifying gameplay code.
- A dense village or raid can reduce decorative cost while retaining warnings, telegraphs and important state evidence.

### 1.2 Identity Layers
| Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel form | Reusable cube, cuboid, shard, cluster, frame sequence or path-segment geometry. | Effects share a coherent physical visual language. |
| Effect definition | Authoring record describing spawn, timing, motion, appearance, children, surface and light behaviour. | The effect is reusable across assets and contexts. |
| Effect project | Creator workspace package containing source, previews, notes, dependencies and validation state. | Complex effects can be iterated and reviewed safely. |
| Effect family | Inheritance and grammar layer for related effects. | Stone impacts, fires or rune bursts remain consistent without duplication. |
| Presentation binding | Contract-driven link selecting an effect and its parameters. | Gameplay facts choose the correct visual response. |
| Runtime product | Compact baked definition, shared geometry/material resources and fallback chain. | Effects run efficiently in Godot. |
| Trace and diagnostics | Record of selected effect, variant, spatial mapping, budget and lifecycle. | Visual problems can be reproduced and repaired. |

### 1.3 What the VFX Forge Is Not
- It is not a general-purpose smooth-mesh particle package with a voxel skin applied at export.
- It is not a gameplay scripting environment for damage, healing, machine processing, AI or resource transactions.
- It is not permission to use camera-facing smoke sheets because they are cheaper or familiar.
- It is not a requirement that every effect simulate real fluid, fire or physics behaviour.
- It is not a reason to create a unique effect for every item when families and context resolution can express the variation.
- It is not the final detailed graph-node catalogue; that belongs to 23E.
- It is not a replacement for Material DNA, animation, spatial anchors, Presentation Profiles or the runtime budget manager.

## 2. Approved Direction Summary
| Area | Locked Decision |
| --- | --- |
| Top-level name | Use VFX Forge as the specialist presentation workspace. Particle Forge is a major internal toolset, not the name of every visual-effect feature. |
| Geometry | Use actual 3D cubes, cuboids, voxel shards, voxel clusters, frame-based clusters, segmented paths and surface cells. |
| Billboards | Do not approve conventional billboard particles, soft smoke sprites or unrelated smooth particle meshes as authored source. |
| Trails | Use segmented voxel trails or path-based voxel forms rather than smooth ribbons. |
| Beams | Use cuboid chains, stepped segments, voxel rings, orbiting cells and bounded light references. |
| Fog and mist | Use sparse 3D voxel cells or authored voxel volumes with aggressive LOD; do not replace the source style with full-screen soft sheets. |
| Templates | Ship guided templates for common families while preserving a bounded advanced authoring path. |
| Inheritance | Families inherit timing, roles, grammar and budget defaults. Variants override palette, forms, density or child layers without copying the whole effect. |
| Source separation | Canonical Forge source remains editable. Godot runtime resources are generated and can be rebuilt. |
| Spatial inputs | Use 23B anchors, masks, regions, paths, zones and runtime contacts. |
| Contract inputs | Use 23C contracts, context and parameter mappings. |
| Material response | Material DNA is the default source for debris, sparks, residue, colour and interaction traits. |
| Persistent effects | Use persistent surface layers or authoritative state-driven presentation rather than immortal particle instances. |
| Lights | Effects may reference bounded light profiles with LOD and accessibility policy. |
| Randomness | Store seeds or deterministic selection keys where replay, multiplayer or review consistency matters. |
| Editor/runtime separation | Complex authoring metadata does not ship unless required. Runtime graphs are compiled or flattened into bounded products. |
| MVP | Prioritise representative cross-system effects and tooling quality over a huge effect catalogue. |

## 3. VFX Forge Architecture and Workspace Boundaries
### 3.1 Workspace Structure
```text
Presentation Forge
  VFX Forge
    Effect Project Browser
    Template and Family Library
    Voxel Form Editor
    Effect Timeline
    Bounded Graph Editor
    Spatial and Binding Panel
    Material and Palette Panel
    Surface Presentation Editor
    Preview Laboratory
    Validation and Cost Inspector
    Bake and Registry Tools
```

### 3.2 Shared Services
| Service | VFX Forge Use |
| --- | --- |
| Stable ID and namespace service | Creates effect, family, form, material role, template, surface layer and runtime-product IDs. |
| Manifest and dependency service | Tracks forms, materials, palettes, profiles, anchors, contracts, child effects and content-pack provenance. |
| Inheritance and override service | Resolves family defaults, variants, culture packs, accessibility forms and project overrides. |
| Spatial reference service | Displays and validates 23B anchors, regions, masks, paths, zones and runtime-anchor expectations. |
| Contract and binding service | Browses 23C contracts, context fields, parameter maps and Presentation Profile consumers. |
| Validation service | Runs style, dependency, lifecycle, performance, accessibility and compatibility rules. |
| Bake service | Compiles authoring source into compact Godot-ready resources. |
| Preview and replay service | Replays event traces, state curves and spatial movement in controlled environments. |
| Production lifecycle service | Tracks concept, draft, review, approved, deprecated and replacement states. |

### 3.3 Responsibility Boundaries
| System | Owns | Does Not Own |
| --- | --- | --- |
| VFX Forge | Effect source, forms, timing, appearance, child composition, surface presentation, light references and fallbacks. | Damage, hits, movement authority, machine progress, mana transfer, weather truth or NPC decisions. |
| 23B Spatial System | Semantic locations, regions, paths, masks, zones and mappings. | Effect timing or appearance. |
| 23C Integration System | Contracts, context, bindings, parameter maps, lifecycle and composition channels. | Internal effect authoring details. |
| Material DNA | Material identity and default response roles. | The final effect instance or its gameplay trigger. |
| 23E Graph System | Detailed emitters, node behaviours, simulation and graph compilation. | Overall asset governance or cross-document architecture. |
| 23I Runtime | Pools, dispatch, update, LOD, replication integration and Godot classes. | Creative approval and source intent. |

## 4. VFX Asset Taxonomy and Stable IDs
### 4.1 Core Asset Types
| Asset Type | Purpose | Example ID |
| --- | --- | --- |
| VFX Effect | Reusable complete visual effect. | vfx.effect.fire.campfire_basic |
| Effect Family | Inheritance and response family. | vfx.family.impact.stone |
| Effect Template | Guided starting configuration. | vfx.template.machine.exhaust_loop |
| Voxel Form | Reusable geometry unit or cluster. | vfx.form.ember.small_cube |
| Voxel Frame Sequence | Discrete geometry sequence. | vfx.frames.flame.basic_04 |
| Palette Role Set | Semantic colours and emission roles. | vfx.palette.fire.standard |
| VFX Material Profile | Surface, transparency, emission and shading rules. | vfx.material.smoke.opaque_fade |
| Surface Presentation Layer | Persistent or long-lived face/region change. | vfx.surface.scorch.medium |
| Light Profile Reference | Bounded light response used by an effect. | light.profile.fire.small |
| Budget Profile | Cost, LOD, aggregation and fallback limits. | budget.vfx.machine.standard |
| Preview Scenario | Saved context, camera, environment and event trace. | preview.vfx.furnace.blocked |
| Generated Runtime Product | Compiled shipped resource. | runtime.vfx.effect.fire.campfire_basic |

### 4.2 Naming Rules
- IDs describe semantic identity rather than a current Godot node name.
- Use lowercase namespace segments separated by periods.
- Keep family and specific-effect IDs separate.
- Use material, culture, biome or intensity suffixes only when they represent durable distinctions.
- Do not encode temporary revision numbers in stable IDs; use manifest versions.
- Do not use visual colour alone as the semantic identity when the same effect may receive palette variants.
- Deprecated IDs remain resolvable through aliases or migration records until compatibility policy permits removal.

### 4.3 Categories
| Category | Representative Content |
| --- | --- |
| Contact | Footsteps, impacts, mining, placement, landing, splash and surface response. |
| Ambient | Leaves, pollen, spores, ash, fireflies, dust, mana motes and biome life. |
| Environmental | Rain, snow, hail, wind debris, storms, waterfalls, fog and heat. |
| Machine | Smoke, steam, sparks, exhaust, flow, blocked output, overload and repair. |
| Magic | Cast, charge, release, rune, ward, conduit, ritual, portal, corruption and cleansing. |
| Combat | Trails, blocks, parries, impacts, status, telegraphs, projectiles and aftermath. |
| Creature | Breath, venom, footprints, wings, scales, phases, death and magical anatomy. |
| Construction | Placement dust, hammer contact, cutting debris, scaffolds, completion and collapse. |
| Persistent Surface | Wetness, frost, scorch, soot, mud, residue, corruption and footprints. |
| World Event | Raid warnings, leyline storms, dimensional breaches, settlement celebration and disaster. |

## 5. Canonical Source, Manifests and Runtime Products
### 5.1 Canonical Source Rule
The editable Effect Project is the canonical source. It stores semantic intent, dependency references, editable voxel forms or links to shared forms, timing, graph source, palette roles, spatial expectations, context mappings, preview scenarios, notes and validation history. Generated Godot resources are products of this source and may be deleted and rebuilt.
```text
EffectProject
  project_manifest
  effect_definitions
  shared_or_local_voxel_forms
  frame_sequences
  palette_and_material_roles
  timing_and_graph_source
  spatial_requirements
  context_parameter_expectations
  child_effect_links
  persistent_surface_links
  accessibility_variants
  budget_and_lod_profiles
  preview_scenarios
  validation_results
  bake_records
```

### 5.2 Manifest Requirements
| Field Group | Required Content |
| --- | --- |
| Identity | Stable ID, display name, category, family, owner pack, version and lifecycle state. |
| Dependencies | Forms, palettes, VFX materials, light profiles, surface layers, spatial roles, contracts, profiles and child effects. |
| Compatibility | Minimum Forge schema, runtime product version, supported body plans or block families and migration links. |
| Performance | Budget profile, cost estimate, LOD chain, fallback chain, aggregation and virtualisation rules. |
| Accessibility | Information importance, reduced-motion form, reduced-flash form, colour-independent cues and critical fallback. |
| Provenance | Creator, source assets, imported references, AI assistance, licences and modification history. |
| Approval | Reviewers, validation status, unresolved warnings and approval date. |

### 5.3 Runtime Product Separation
| Authoring Data | Runtime Product |
| --- | --- |
| Editable graph and notes | Compiled execution plan and parameter slots. |
| Named voxel forms and frame sources | Shared mesh buffers, multimesh data or compact voxel-form records. |
| Human-readable dependencies | Resolved registry handles or compact stable IDs. |
| All preview scenarios | Only required runtime fallbacks and metadata. |
| Editor-only annotations | Removed. |
| Full validation history | Build signature and compatibility version. |
| Unbounded curves or helpers | Sampled, simplified or compiled bounded equivalents. |

### 5.4 Lifecycle States
| State | Meaning |
| --- | --- |
| Concept | Intent exists; source may be incomplete and cannot ship. |
| Draft | Effect can preview but may contain placeholders or unresolved warnings. |
| Review | Dependencies and MVP behaviour are complete enough for formal review. |
| Approved | Passes style, accessibility, performance and compatibility gates. |
| Deprecated | Still resolves for compatibility but should not be newly referenced. |
| Replaced | Has an explicit successor and migration rule. |
| Blocked | Cannot progress because a required contract, spatial reference, source or licence is missing. |

## 6. Fixed Three-Dimensional Voxel Effect Language
### 6.1 Approved Forms
- Single cubes and cuboids.
- Thin cuboid shards and stepped streaks.
- Authored voxel clusters.
- Procedurally assembled clusters from approved forms.
- Voxel-frame sequences where silhouette genuinely changes.
- Segmented voxel trails, rings, boundaries and path chains.
- Voxel surface cells, face overlays and selected-region geometry.
- Voxelised volumetric cells for fog, smoke and ambient fields.
- Clearly voxel-derived projectile, impact and debris chunks.

### 6.2 Disallowed Source Forms
- Camera-facing 2D particle sprites used as the visible effect body.
- Soft-edged smoke or fire sheets that obscure the absence of voxel geometry.
- Smooth ribbon trails with no visible segment structure.
- Round metaballs or fluid blobs that abandon the cubic style.
- Photorealistic fire, fluid or explosion simulations imported as flat animations.
- Unrelated smooth meshes used merely because they are efficient.
- Post-processing that makes the effect unreadably blurry and hides voxel edges.

### 6.3 Supporting Post-Processing
Bloom, colour grading, refraction, depth fog, heat shimmer and screen-space effects may support an authored voxel effect, but they cannot become the sole visible form. A player who disables bloom, motion blur or distortion must still see a coherent cubic effect and understand the event.
### 6.4 Shape Language
| Intent | Preferred Shape Language |
| --- | --- |
| Heat or flame | Upward-biased asymmetric clusters, narrowing shards, stepped scale and ember separation. |
| Smoke | Expanding clusters, cell removal, sparse outer shapes and slow rotation. |
| Magic precision | Rings, ordered segments, mirrored patterns, runic cells and controlled pulses. |
| Corruption | Fractured cubes, discontinuous growth, inward void gaps and unstable offsets. |
| Mechanical force | Directional sparks, rigid shards, repeated pulses and port-aligned exhaust. |
| Water | Falling cuboids, clustered splashes, droplets and surface-cell spread. |
| Impact | Outward cone or hemisphere, target-material shards, short lifetime and clear normal direction. |
| Healing or growth | Ascending cells, organised spirals, expanding leaf/crystal clusters and calm timing. |

## 7. Effect Scale, Density, Orientation and Readability
### 7.1 Effect Cell Concept
An effect cell is an authoring unit used to describe small visual forms relative to the one-metre voxel world grid. The recommended default is one thirty-second of a world block, matching the project's 32 x 32 surface language, but effects may use coarser cells where readability or performance requires it. The cell is a style and authoring reference, not a promise that every particle is physically 3.125 centimetres.
| Scale Band | Typical Use | Guidance |
| --- | --- | --- |
| Micro | Tiny sparks, dust and surface motes. | Use sparingly; must survive intended camera distance or collapse into a coarser fallback. |
| Small | Embers, droplets, chips, spell motes and footprints. | Default close-range particle scale. |
| Medium | Smoke cells, debris chunks, spell segments and machine exhaust. | Primary gameplay-readable scale. |
| Large | Boss telegraphs, portal fragments, ward cells and collapse chunks. | Use strong silhouettes and bounded counts. |
| Structural | Ward boundaries, ritual paths, large flow networks and environmental fields. | Treat as paths, regions or volumes rather than thousands of independent cells. |

### 7.2 Density Rules
- Density must be judged at intended gameplay camera distance, not only in close editor view.
- Prefer fewer readable cells over many tiny cells.
- Do not use dense transparency to imitate soft volume.
- Use shape, direction, rhythm and palette contrast to communicate intensity before raw particle count.
- Distant LOD should reduce cell count and update rate while retaining the effect family silhouette.
- Critical telegraphs must not become thinner or more transparent than their readability threshold.

### 7.3 Orientation Sources
| Source | Use |
| --- | --- |
| Spatial normal | Impacts, face emissions, drips and decals. |
| Anchor forward axis | Breath, exhaust, projectile release and cast origin. |
| Path tangent | Trails, beams, mana flow and pipe effects. |
| World gravity | Debris, rain, snow and falling residue. |
| Wind vector | Smoke, leaves, ash and weather. |
| Target direction | Seeking motes, beams and telegraphs. |
| Camera-independent world axes | Rings, ritual grids and structural boundaries. |

### 7.4 Readability Tests
- Silhouette test with emission and bloom disabled.
- Greyscale or colour-blind simulation test.
- Gameplay-distance test at intended field of view.
- Bright daylight, dark cave, snow, forest and stone-background tests.
- Reduced-particle and reduced-motion tests.
- Dense-scene overlap test.
- Split-screen viewport-size test where applicable.

## 8. Voxel Forms, Clusters, Shards and Frame Sequences
### 8.1 Voxel Form Record
```text
VFXVoxelForm
{
    form_id
    display_name
    canonical_cell_size
    occupied_cells_or_cuboids
    pivot
    forward_axis
    material_role_slots
    optional_surface_mask_slots
    bounds
    collision_class
    lod_forms
    provenance
}
```

### 8.2 Form Sources
| Source | Use | Rule |
| --- | --- | --- |
| Primitive generator | Cube, cuboid, plate, shard, cross, ring segment. | Parameterised and reusable. |
| Voxel Form Editor | Hand-authored cluster. | Stores editable cell data. |
| Asset-region extraction | Debris or fragment from a block/item/model region. | Must record source and remapping rule. |
| Frame generator | Discrete form variants for flame, portal or magical pulse. | Seeded and bounded. |
| Imported voxel model | Approved external source. | Must meet scale, style, licence and provenance rules. |

### 8.3 Cluster Authoring
- Use occupancy editing, cuboid brushes, symmetry, randomised preview and form variants.
- Allow semantic material-role painting rather than hard-coded colours.
- Support exposed-face detection for debris and emissive edges.
- Support pivot and forward-axis editing.
- Support a compact bounds preview and LOD comparison.
- Prevent accidental hidden internal cells from bloating runtime products unless the form requires them.

### 8.4 Voxel Frame Sequences
Voxel-frame sequences are appropriate when the visible topology changes: flame clusters split, a rune assembles, a crystal grows, a portal fractures or smoke loses cells. Simple motion, rotation, scale or colour changes should use transforms and material parameters rather than storing many nearly identical frames.
| Field | Purpose |
| --- | --- |
| frames | Ordered voxel forms or deltas. |
| frame_duration | Fixed or per-frame timing. |
| play_mode | Once, loop, ping-pong, random walk or context-selected. |
| interpolation | Usually none or stepped; transform interpolation may be allowed. |
| seed_policy | Controls deterministic frame selection. |
| lod_sequence | Reduced frame or form set. |

### 8.5 Destruction Fragments
- Fragments may derive from the struck voxel, material family, block shape or authored break region.
- Gameplay block removal remains authoritative; VFX fragments are presentation copies.
- Fragments must have lifetime, collision and pool limits.
- Large collapse chunks require explicit budget and safety classification.
- Persistent dropped items or salvage are not VFX fragments.

## 9. Effect Definitions, Projects and Composition
### 9.1 Effect Definition
```text
VFXEffectDefinition
{
    effect_id
    family_id
    category
    lifecycle_mode
    authoring_graph_id
    timeline_id
    spatial_input_contract
    context_input_contract
    palette_and_material_roles
    child_effects
    surface_layers
    light_profile_references
    budget_profile
    lod_chain
    accessibility_variants
    runtime_product_id
}
```

### 9.2 Lifecycle Modes
| Mode | Use |
| --- | --- |
| One-shot | Impact, burst, placement, break, cast release and completion. |
| Loop | Smoke, machine exhaust, fire, ambient motes and weather. |
| State layer | Wetness, corruption glow, damage sparks and charged state. |
| Sequence | Charge to release to impact to aftermath. |
| Path effect | Trail, beam, flow, boundary or network pulse. |
| Surface layer | Scorch, frost, mud, soot or residue. |
| Zone effect | Fog, pollen, magical field or environmental volume. |

### 9.3 Project Composition
A project may contain several effect definitions when they are reviewed as one coherent package, such as furnace start, operating loop, blocked warning, damage sparks and shutdown. Each definition still receives its own stable ID and can be referenced independently. Shared forms, palettes and parameter curves remain local dependencies until promoted to the global library.
### 9.4 Local Versus Shared Resources
| Keep Local When | Promote to Shared When |
| --- | --- |
| The form is unique to one boss or relic. | The form appears across a material, magic or machine family. |
| The curve expresses one sequence. | The curve is a standard fade, pulse or warning rhythm. |
| The palette is story-specific. | The palette represents a standard material or school role. |
| The child effect has no independent meaning. | The child effect can be reused and budgeted independently. |

## 10. Effect Families, Templates, Grammars and Inheritance
### 10.1 Family Hierarchy
```text
vfx.family.impact
  vfx.family.impact.stone
    vfx.effect.impact.stone.light
    vfx.effect.impact.stone.medium
    vfx.effect.impact.stone.heavy
  vfx.family.impact.wood
  vfx.family.impact.metal
  vfx.family.impact.crystal
```

### 10.2 Inheritable Fields
- Approved voxel-form set.
- Base timing and lifecycle.
- Material and palette role mappings.
- Emission shape and normal behaviour.
- Child-effect family links.
- Budget and LOD defaults.
- Accessibility fallback family.
- Context parameter names and ranges.
- Validation rules and required previews.

### 10.3 Override Rules
- Override the smallest meaningful field set.
- Do not copy a complete parent effect merely to change colour or density.
- Contract, spatial-input and lifecycle changes are compatibility-sensitive.
- Content-pack overrides must declare precedence and fallback.
- An override may not silently raise cost class above the binding or profile budget.
- An accessibility variant may simplify appearance but must preserve critical timing and direction.

### 10.4 Effect Grammars
| Grammar | Inputs | Generated Behaviour |
| --- | --- | --- |
| grammar.debris.material | Target material, intensity, normal, wetness. | Selects shards/cubes, palette, velocity cone, bounce, lifetime and residue chance. |
| grammar.smoke.voxel | Fuel/material, heat, airflow, enclosure. | Chooses cluster forms, rise, expansion, sparsity, drift and LOD. |
| grammar.fire.voxel | Fuel, heat, wind, scale, magic modifier. | Builds flame frames, embers, smoke child and light reference. |
| grammar.fluid.splash | Fluid, velocity, surface normal, depth. | Produces droplets, splash cells, foam or residue. |
| grammar.weather.contact | Precipitation, target surface, shelter and intensity. | Creates rain/snow/hail contact and surface response. |
| grammar.magic.rune | School, tier, stability, culture and charge. | Selects runic shapes, palette, pulse and orbiting cells. |
| grammar.corruption.spread | Corruption family, intensity, host material and direction. | Produces fractures, surface growth, leakage and cleansing inverse. |
| grammar.weapon.trail | Weapon path, material, enchantment and speed. | Produces segmented trail form, spacing, lifetime and impact handoff. |

### 10.5 Template Philosophy
Templates are guided authoring starting points, not locked black boxes. A template should explain its required inputs, recommended spatial role, expected context, cost class and common failure modes. The creator may graduate to the advanced graph while retaining template-origin metadata for maintainability.
## 11. Palette, Material DNA, Emission and Light Roles
### 11.1 Semantic Palette Roles
| Role | Example Use |
| --- | --- |
| core | Dense central flame, spell or energy. |
| mid | Primary body colour. |
| edge | Contrasting outer cells or exposed faces. |
| spark | Short-lived bright accents. |
| smoke_light | Early smoke or mist. |
| smoke_dark | Late dense smoke. |
| residue | Scorch, ash, wetness or corruption surface. |
| warning | Critical hazard cue independent from decorative palette. |

### 11.2 Material DNA VFX Fields
```text
MaterialVFXResponse
{
    material_id
    debris_form_family
    debris_palette_roles
    spark_probability_and_family
    dust_or_mist_family
    break_residue
    heat_response
    wet_response
    frost_response
    magic_affinity_response
    corruption_response
    transparency_policy
    default_budget_class
}
```

### 11.3 Emission Rules
- Emission is a semantic role and intensity, not an excuse to over-bloom the effect.
- Cells must remain visible with emission disabled in accessibility or low-quality modes where practical.
- Warning colours require colour-independent form or rhythm.
- Animated emission must respect reduced-flash thresholds.
- Distant LOD may collapse several emissive cells into fewer larger cells, not a soft sprite.

### 11.4 Light Profiles
| Field | Rule |
| --- | --- |
| radius | Bounded by effect scale and budget. |
| intensity | Driven by approved parameter map; clamped. |
| colour | References semantic palette role or light profile. |
| shadow | Off by default for small particles; explicit for major effects. |
| flicker | Uses safe frequency and reduced-flash alternative. |
| lifecycle | Owned by effect start/update/stop sequence. |
| LOD | Can reduce updates, radius or disable decorative light while retaining effect geometry. |

## 12. Timing, Lifecycle, Loops and Sequencing
### 12.1 Timing Model
| Timing Element | Purpose |
| --- | --- |
| pre-roll | Optional anticipation before visible start when contract permits. |
| spawn window | When new cells may appear. |
| active window | Primary effect behaviour. |
| tail window | Residual motion, smoke, embers or fade. |
| surface aftermath | Optional persistent layer created by confirmed context. |
| loop cycle | Repeatable phase for continuous effects. |
| child cue | Timed child effect or Presentation Profile handoff. |

### 12.2 Start, Update and Stop
- One-shot effects own their complete bounded lifetime.
- Loop effects require explicit start, update and stop handling from 23C lifecycle contracts.
- Stopping should use authored shutdown or tail behaviour rather than abruptly deleting visible cells unless safety requires it.
- Virtualised loops preserve phase where re-entry would otherwise visibly restart.
- Effect instances must release pooled resources after tail completion.
- Interrupted sequences declare cancellation behaviour and whether confirmed aftermath remains.

### 12.3 Sequence Example
```text
ward_breach sequence
  phase 1: boundary tension pulse
  phase 2: fracture cells appear at runtime contact
  phase 3: outward voxel burst and warning light
  phase 4: residual unstable boundary
  phase 5: persistent damaged-ward state derives from authoritative state
```

### 12.4 Time Scaling
- Effects follow game time, unscaled local time or a declared hybrid according to use.
- UI previews and editor scrubbing must not change canonical timing data.
- Paused worlds may keep selected ambient or UI presentation only through explicit policy.
- Multiplayer slow-motion or local accessibility settings cannot alter authoritative event timing.

## 13. VFX Graph Boundary and Authoring Domains
Document 23E defines the detailed Voxel Particle Graph. This document locks the graph's responsibility boundary so effect projects remain portable and safe.
### 13.1 Approved Graph Domains
| Domain | Responsibility |
| --- | --- |
| Spawn | When, where and how many approved forms begin. |
| Initialise | Initial transform, velocity, palette, lifetime and deterministic seed. |
| Update | Bounded motion, scale, rotation, material parameters and state mapping. |
| Collision response | Presentation-only bounce, stop, slide, stick or child effect. |
| Render preparation | Form, material, visibility, LOD and aggregation choice. |
| Child dispatch | Bounded visual child effects or profile references. |
| Surface output | Request an approved surface presentation layer. |
| Diagnostic output | Cost, event trace and authoring preview data. |

### 13.2 Prohibited Graph Behaviour
- Modifying health, inventory, machine progress, mana, block state or AI state.
- Performing unbounded world searches.
- Loading arbitrary files or executing editor code in runtime builds.
- Spawning unrestricted scene trees outside the dispatcher and pool manager.
- Reading private gameplay objects not declared by contract.
- Creating recursive child effects without depth and count limits.
- Depending on frame rate for authoritative timing or deterministic selection.

### 13.3 Template and Advanced Modes
Most creators should author through guided template controls. Advanced graph mode exposes bounded domains and typed ports. Converting a template effect to advanced mode retains a readable generated structure and a reversible snapshot where practical. The editor should never hide substantial runtime cost behind a single vague quality slider.
## 14. Spatial Attachment and Surface Mask Integration
### 14.1 Supported Spatial Inputs
| 23B Reference | VFX Use |
| --- | --- |
| Anchor | Single origin, orbit centre, light origin or target. |
| Socket | Moving entity, equipment, machine or modular attachment origin. |
| Region | Distributed spawning, damage area, burning section or crystal cluster. |
| Path | Trail, beam, conduit flow, river spray, ward edge or corruption route. |
| Boundary | Perimeter warning, ward wall or ritual ring. |
| Surface Mask | Texel/cell-weighted face emission such as vent, rune, crack or wet area. |
| Zone | Fog, pollen, ambient motes or magical field. |
| Sound portal/portal geometry | May coordinate visual leakage or portal-edge effects; audio behaviour remains in Audio Forge. |
| Runtime anchor | Exact impact, struck voxel, surface normal, projectile collision or lightning contact. |

### 14.2 Spatial Requirement Declaration
```text
VFXSpatialRequirement
{
    role_id
    accepted_reference_types
    required_or_optional
    orientation_source
    scale_policy
    fallback_role
    approximation_allowed
    multiplicity
}
```

### 14.3 Missing Reference Behaviour
| Importance | Behaviour |
| --- | --- |
| Critical telegraph | Use approved asset-centre or body-role fallback; log warning; never silently hide if a fallback exists. |
| Important state | Use fallback region/anchor and reduced form. |
| Decorative | May suppress after a traceable diagnostic. |
| Persistent surface | Do not write to an unrelated face; defer or use explicit generic mapping. |

### 14.4 Surface Mask Sampling
- Sample eligible texels or surface cells according to mask weights.
- Resolve orientation from face normal plus optional mask flow direction.
- Support exposed-only sampling where covered cells should not emit.
- Use deterministic seeds for review and replicated important effects.
- Validate that texture or model revisions preserve required masks or supply remapping.

## 15. Event, Context, Parameter and Binding Integration
### 15.1 Effect Input Contract
| Input | Example |
| --- | --- |
| Event lifecycle | impact_confirmed, machine_started, cast_released. |
| State values | speed, heat, damage ratio, charge, wetness. |
| Context materials | source steel, target stone. |
| Action | mining, footstep, block, parry, repair. |
| Intensity | light, medium, heavy or normalised value. |
| Environment | cave, underwater, forest, rain, sheltered. |
| Spatial data | runtime contact, path, mask, region or socket. |
| Culture/biome/dimension | variant selection. |
| Accessibility | reduced motion, reduced flash and colour-independence requirements. |
| Budget/relevance | distance, importance and scene pressure. |

### 15.2 Parameter Declaration
```text
VFXParameterSlot
{
    parameter_id
    type
    expected_range
    default
    clamping
    smoothing_permission
    quantisation_hint
    authoring_preview_values
}
```

### 15.3 Resolver Separation
The effect definition does not decide whether iron-on-stone, iron-on-wood or mana-on-crystal is appropriate. The 23C resolver selects the effect or family and supplies typed parameters. The VFX asset interprets those parameters only within its declared slots.
### 15.4 Context Example
```text
event.block.mining_contact
  action = mining
  source_material = iron
  target_material = stone
  intensity = 0.72
  wetness = 0.10
  world_position = runtime contact
  surface_normal = struck face normal
  selected effect = vfx.effect.impact.stone.medium
  parameters:
    shard_count_scale = 0.72
    spark_probability = material response
    dust_scale = 0.90
```

## 16. Child Effects, Layering, Channels and Composition
### 16.1 Child Effect Rules
- Child links use stable effect or family IDs.
- Every child link declares trigger time, condition, maximum count and inheritance of context/spatial data.
- Recursion is prohibited unless a specially approved bounded depth exists.
- Children may receive reduced context packets rather than unrestricted parent access.
- Budget policy may suppress decorative children before the parent critical cue.
- Child failure must not leak the parent lifecycle.

### 16.2 VFX Channels
| Channel | Examples | Composition |
| --- | --- | --- |
| Base operation | Machine smoke, active fire, ambient magic. | Persistent additive base. |
| Environment | Wetness mist, snow contact, wind drift. | Modifies or adds according to environment. |
| Damage | Sparks, smoke leak, cracks, debris. | Adds with capped layers. |
| Magic | Enchantment, mana flow, corruption. | Adds or replaces family-defined portions. |
| Warning | Overheat pulse, ward breach, boss telegraph. | High priority; protected. |
| Temporary event | Impact, release, completion. | One-shot overlay. |
| Accessibility | Reduced motion/flash and critical shape. | May replace unsafe forms. |

### 16.3 Conflict Examples
| Situation | Rule |
| --- | --- |
| Wet furnace smoke | Environment may darken/condense smoke but does not suppress blocked warning. |
| Corrupted enchanted weapon | Corruption and enchantment use separate role slots; priority profile resolves colour/form conflicts. |
| Burning frozen surface | Authoritative state decides coexistence; VFX composes steam, melt or exclusive state according to binding. |
| Boss telegraph during dense raid | Critical warning reserves cells and light budget before decorative impacts. |

## 17. Trails, Beams, Paths, Boundaries and Flow Presentation
### 17.1 Segmented Trail Rule
Trails are constructed from discrete voxel segments sampled along a 23B path or between named trail origins. The segment spacing, lifetime, form, rotation and palette may vary with speed, but the trail must remain visibly segmented and three-dimensional.
| Path Effect | Inputs | Typical Output |
| --- | --- | --- |
| Weapon trail | Root/tip path, speed, weapon material, enchantment. | Short cuboid chain with stepped fade. |
| Projectile trail | Projectile transform history, element, velocity. | Sparse shards, motes or smoke cells. |
| Beam | Origin, target/path, charge, stability. | Central cuboid chain, rings, orbiting cells and impact endpoint. |
| Mana flow | Conduit path, flow ratio, purity. | Pulsing cells at bounded intervals and junction highlights. |
| Ward boundary | Boundary path, strength, breach location. | Sparse wall cells, pulses and local fracture. |
| Corruption spread | Surface/world path, intensity, host material. | Fractured cells and surface growth advancing in steps. |

### 17.2 Long Network Rules
- Do not spawn one independent particle per path unit across an entire settlement.
- Use player-proximate pulses, junction highlights, aggregate flow indicators and distance-based sampling.
- Preserve logical flow phase through virtualisation.
- Critical blockages or breaches receive local priority.
- Network truth remains owned by automation or magic systems.

### 17.3 Boundary Effects
- Boundary geometry must remain readable from both sides where gameplay requires it.
- Use regular voxel spacing, corner handling and controlled vertical segments.
- Breach or disabled sections derive from authoritative state or context.
- Distant boundaries may reduce density but must not misrepresent whether protection exists.

## 18. Persistent Surface Presentation and Residue
### 18.1 Surface Layer Types
| Layer | Typical Source | Persistence |
| --- | --- | --- |
| Wetness | Rain, splash, fluid leak. | Short to medium; state-driven or timed. |
| Frost | Cold weather, ice magic. | State-driven or cleansed by heat. |
| Scorch | Fire impact, explosion, furnace fault. | Medium or saved if meaningful. |
| Soot | Long-running fire or chimney. | Accumulating cosmetic/meaningful. |
| Mud | Footstep, rain and soil contact. | Short; may transfer to entities. |
| Mana residue | Spell, conduit leak, ritual. | Timed or quest/world-state linked. |
| Corruption | Forbidden magic, biome spread. | Often saved authoritative state. |
| Footprint/track | Entity contact. | Timed, clue-based or abstracted. |
| Construction dust | Active build or demolition. | Short and stage-driven. |

### 18.2 Surface Layer Record
```text
SurfacePresentationLayer
{
    layer_id
    eligible_surface_types
    mask_or_region_rule
    material_role_set
    intensity_parameter
    composition_channel
    age_and_decay
    cleaning_or_reversal
    save_policy
    lod_representation
    maximum_density
}
```

### 18.3 Persistence Rules
- Temporary decoration is not individually saved.
- Meaningful persistent state derives from an authoritative saved record or approved compact surface-state record.
- Layers use density caps and merging to avoid save bloat.
- Cleaning, repair, weathering and state replacement use explicit transitions.
- LOD may merge many small marks into a regional or block-face summary.
- No surface layer may permanently alter gameplay collision or block identity.

### 18.4 Surface Composition
| Conflict | Resolution |
| --- | --- |
| Wetness over scorch | Wetness can add sheen/darken without deleting scorch. |
| Frost over corruption | Use channel priority and material support; both may coexist if gameplay state permits. |
| Repair over crack/scorch | Repair event removes or replaces only layers declared repairable. |
| New footprint over dense mud | Aggregate or suppress according to density budget. |

## 19. Environmental, Weather, Fluid and Ambient VFX
### 19.1 Weather Families
| Weather | World Cells | Contact Effects | State Layers |
| --- | --- | --- | --- |
| Rain | Falling cuboids or sparse streak-cuboids. | Splash cells, drips and roof contact. | Wetness. |
| Snow | Voxel flakes with wind drift. | Small puffs or accumulation hints. | Snow/frost state. |
| Hail | Fast small cubes. | Bounce and impact chips. | Possible ice/wetness. |
| Ash | Slow dark cells. | Soft landing motes. | Soot/ash residue where meaningful. |
| Mana storm | Pulses, shards and leyline-aligned cells. | Rune flicker, ward contact. | Charged or unstable state. |
| Corruption storm | Fractured motes and directional waves. | Surface leakage and ward impact. | Corruption exposure. |

### 19.2 Shelter and Contact
- World weather system owns precipitation and shelter truth.
- VFX queries approved shelter/contact context rather than raycasting every cell independently.
- Roof contact may aggregate across structure surfaces.
- Indoor transitions reduce exterior cell spawning and enable drips/leaks only at declared locations.
- Player-built structures use generated or runtime-updated exposure summaries.

### 19.3 Fluids
| Use | VFX Approach |
| --- | --- |
| Droplet | Small cuboid with gravity and splash child. |
| Leak | Socket or mask-aligned intermittent droplets and wetness layer. |
| Pipe flow | Path pulse or visible contained cells near transparent sections. |
| Waterfall spray | Zone-based sparse droplets and mist cells with distance LOD. |
| Lava | Emissive voxel surface pops, heat cells and smoke child. |
| Potion/alchemical fluid | Palette/material family with controlled magical child effects. |

### 19.4 Ambient Fields
- Use zones for pollen, spores, fireflies, dust and mana motes.
- Spawn near the listener/player within bounded cells rather than filling an entire biome.
- Use biome, time, weather and world-state context.
- Aggregate or virtualise when not directly observed.
- Never allow ambience to obscure navigation, combat telegraphs or accessibility indicators.

## 20. Blocks, Mining, Construction and Destruction VFX
### 20.1 Block Interaction Family
| Action | VFX Inputs | Output |
| --- | --- | --- |
| Placement | Block material, face, shape, support and placement speed. | Small dust/chip burst, settling cells and optional surface response. |
| Mining contact | Tool material, target material, intensity, struck face. | Target debris, dust, spark chance and crack-region accent. |
| Break | Block shape, material, damage state and drop confirmation. | Larger bounded fragments and residue. |
| Repair | Repair material, target state and stage. | Reverse debris, dust, sparks or rune stitching. |
| Shape change | Old/new shape and affected face. | Small transition fragments; gameplay geometry changes independently. |

### 20.2 Mining Readability
- Debris must match target material more strongly than tool material.
- Spark behaviour depends on the material pair and action.
- Rich ore or magical purity may add subtle family-specific cells without hiding the base stone response.
- Critical feedback such as wrong tool tier should use a distinct protected profile, not simply fewer particles.
- Repeated mining uses cooldown and aggregation to avoid visual spam.

### 20.3 Construction Stages
| Stage | Effect Examples |
| --- | --- |
| Resource delivery | Crate dust, carrying contact and supply marker. |
| Foundation | Soil/stone dust and placement puffs. |
| Frame | Wood chips, hammer impacts and sawdust cells. |
| Roofing | Tile chips, dust and completion sweep. |
| Magic installation | Rune cells, conduit pulses and stabilisation effect. |
| Completion | Short structure-scale profile, lights or banner particles; bounded and optional. |
| Damage/collapse | Authoritative structure state plus staged debris and dust. |

### 20.4 Collapse Safety
- Large collapse VFX uses authored chunks and dust zones rather than simulating every block.
- Gameplay block changes and damage remain authoritative.
- Debris collision is presentation-only and bounded.
- Camera, motion and flash accessibility variants are required for major collapse profiles.
- Distant collapse can use a simplified structural plume and persistent damage state.

## 21. Machines, Automation, Power and Village Industry VFX
### 21.1 Machine Presentation Components
| Machine State | VFX |
| --- | --- |
| Idle | Minimal or no effect; occasional ambient cell if appropriate. |
| Starting | Ignition, first movement sparks, smoke or mana pulse. |
| Operating | Looping exhaust, flow, heat, particles or rotating visible cells. |
| High load | Increased but clamped density, brighter heat or stronger flow pulse. |
| Blocked | Protected warning pulse, strain smoke, jammed output effect. |
| Low input/fuel | Reduced loop and readable low-state cue. |
| Damaged | Sparks, leaks, smoke and damaged-surface layer. |
| Overload | Critical telegraph, pressure cells, warning light and controlled failure sequence. |
| Stopping | Tail smoke, pressure release or mana fade. |

### 21.2 Port and Path Integration
- Exhaust uses named machine sockets or Surface Masks.
- Visible item or fluid flow uses automation-owned paths and throughput context.
- Mana and power effects use network paths, junctions and local load values.
- Blocked ports receive local effects rather than increasing the entire machine effect.
- Advanced machines may expose multiple semantic effect roles without creating child scene dependencies.

### 21.3 Dense Industry Aggregation
| Problem | Rule |
| --- | --- |
| Many identical smoke loops | Cluster by area and visibility; preserve nearest distinct chimneys. |
| Hundreds of sparks | Suppress decorative sparks and retain warnings/near interactions. |
| Long conveyors | Display local movement, junctions and congestion rather than every item trail at distance. |
| Factory mana grid | Sample pulses near player and important nodes; preserve fault locations. |
| Distant village industry | Use regional chimney/industry summary effects where visible. |

### 21.4 NPC Work Integration
- NPC tool contacts use animation events and material context.
- Work effects attach to tool/target runtime contacts, not generic NPC centres.
- Construction and crafting loops use cooldowns and local aggregation.
- Effects do not prove that work completed; completion comes from the project or recipe system.

## 22. Magic, Runes, Wards, Portals and Corruption VFX
### 22.1 Magic School Roles
| School/Role | Voxel VFX Language |
| --- | --- |
| Elemental fire | Flame clusters, embers, heat cells and scorch. |
| Water/ice | Droplets, cuboid streams, frost cells and crystalline shards. |
| Nature | Leaf/seed clusters, growth sequences and soil motes. |
| Arcane | Ordered rings, precise cubes, runic paths and stable pulses. |
| Light | Bright structured cells, clean boundaries and reduced-flash variants. |
| Shadow | Sparse dark cells, occluding gaps and fractured silhouettes without unreadable full-screen darkness. |
| Blood/forbidden | Controlled symbolic cells and alternative family-friendly presentation options. |
| Space/portal | Frame-aligned cells, depth layers, transit paths and edge fracture. |
| Rune | Grid-aligned glyph cells, assembly sequences and control pulses. |
| Corruption/void | Fractures, missing-volume shapes, unstable offsets and leakage residue. |

### 22.2 Spell Lifecycle
| Phase | VFX Responsibility |
| --- | --- |
| Prepare | Subtle focus/socket effect. |
| Charge | Parameter-driven growth and clear telegraph. |
| Commit/release | Animation-event aligned burst or projectile origin. |
| Travel | Projectile/trail/path presentation. |
| Impact | Runtime contact and material response. |
| Aftermath | Surface layer, field or state-driven effect. |
| Cancel/fizzle | Distinct bounded cancellation form. |

### 22.3 Runes and Conduits
- Runes use Surface Masks or authored voxel glyph forms.
- Conduits use path pulses and local junction effects.
- Purity, stability and school are parameterised context, not separate gameplay logic.
- Broken conduits expose local leakage and warning effects.
- Distant networks simplify to sparse pulses or critical faults.

### 22.4 Wards
- Ward presence uses a sparse readable boundary or anchor network rather than an opaque wall.
- Contact and breach effects localise to runtime or mapped boundary positions.
- Strength can alter pulse spacing, thickness or frequency within accessibility limits.
- Ward failure state derives from authoritative magic/village state.
- Reduced-motion mode may use static segmented boundaries and discrete contact flashes.

### 22.5 Portals
- Portal effects align to portal frame, plane, boundary and transit path references.
- Entry/exit timing follows authoritative portal events.
- Interior visual treatment remains voxel-derived even when distortion or depth effects support it.
- Closed, charging, stable, unstable and collapsing states have distinct profiles.
- Portal destination or realm identity may select palette/form variants without changing the stable portal family.

## 23. Combat, Equipment, Creatures and Boss VFX
### 23.1 Combat VFX Principles
- Effects reinforce timing, direction, material and threat; they do not confirm damage before authority.
- Weapon trails begin and end on animation contracts and use named paths.
- Impacts use exact runtime contact, target material and attack intensity.
- Blocks and parries require distinct profiles from unblocked hits.
- Critical telegraphs reserve budget and remain visible with reduced particles.
- Effects should not cover enemy silhouettes or hide counterplay.

### 23.2 Equipment Regions
| Region/Path | Use |
| --- | --- |
| blade edge | Trail or enchantment cells. |
| weapon tip | Thrust trail, projectile origin or magic focus. |
| shield face | Block impact and ward overlay. |
| armour region | Material impact and damage status. |
| focus/crystal region | Charge and cast effect. |
| projectile socket | Launch and residual effect. |

### 23.3 Creature Roles
| Role | Examples |
| --- | --- |
| Foot/contact | Dust, mud, snow, water and heavy landing. |
| Mouth/breath | Fire, frost, poison, roar mist and cast origin. |
| Wing/tail path | Trail, wind cells and attack telegraph. |
| Damage region | Sparks, blood alternatives, scales, corruption leak. |
| Phase anchor | Boss transformation or shield core. |
| Death/defeat | Bounded collapse, essence release or residue. |

### 23.4 Boss Effects
- Boss effects use staged profiles and explicit critical importance.
- Arena-scale effects use boundaries, paths and zones rather than unbounded particle counts.
- Telegraphs must remain readable against the boss and environment.
- Reduced-motion and reduced-flash variants are mandatory.
- Distant spectators or split-screen players may receive simplified but directionally accurate forms.
- Phase changes are authoritative events; VFX does not decide phase progression.

## 24. Culture, Biome, Dimension, Variant and Content-Pack Rules
### 24.1 Variant Axes
| Axis | Possible Changes | Stable Elements |
| --- | --- | --- |
| Material | Debris form, palette, sparks, residue. | Action timing and event contract. |
| Culture | Rune geometry, craft sparks, decorative motifs. | Gameplay function and spatial role. |
| Biome | Ambient cells, wetness, dust and palette tuning. | Effect family identity. |
| Dimension | Realm particles, portal form, gravity/drift modifiers. | Contract and profile purpose. |
| Damage state | Leak location, density, smoke and fragments. | Machine or entity identity. |
| Quality tier | Cell count, precision, palette or child layers. | Critical cue and budget limit. |
| Corruption | Fracture, offset, residue and colour/form roles. | Underlying effect lifecycle unless explicitly replaced. |

### 24.2 Variant Selection
- Use 23C resolver specificity rather than branching inside every graph.
- Prefer family overrides for durable cultural or realm styles.
- Use parameter slots for continuous intensity, purity, heat and similar values.
- Use separate effects when topology, lifecycle or critical readability changes substantially.
- Every variant inherits or declares accessibility and LOD forms.

### 24.3 Content Packs
| Rule | Requirement |
| --- | --- |
| Namespace | Pack-owned IDs and declared override targets. |
| Dependencies | Minimum base pack and schema versions. |
| Replacement | Explicit full or partial override fields. |
| Fallback | Base effect remains available if pack is missing or incompatible. |
| Budgets | Pack cannot silently exceed project budget class. |
| Style | Voxel-style validator applies equally to official and mod content. |
| Provenance | Source and licence metadata required. |

## 25. Creator Workspace, Editing Tools and Workflow
### 25.1 Workspace Layout
```text
Left: Project / Family / Template / Dependency Browser
Centre: 3D Preview Viewport with spatial overlays
Bottom: Timeline and bounded graph
Right: Effect Inspector, parameters, palette, budget and validation
Tabs: Voxel Form Editor | Surface Layer Editor | Preview Laboratory | Cost Inspector
```

### 25.2 Standard Workflow
1. Define the semantic purpose and target contract or state.
2. Choose an existing effect family or approved template.
3. Declare spatial requirements and parameter inputs.
4. Select or create voxel forms, frame sequences and material-role mappings.
5. Author timing and bounded graph behaviour.
6. Add child effects, surface layers and light references only where needed.
7. Create accessibility and LOD/fallback variants.
8. Preview against representative assets, environments and distances.
9. Run style, dependency, lifecycle, accessibility and cost validation.
10. Review resolution through a Presentation Profile and binding trace.
11. Approve, bake and register the runtime product.

### 25.3 Voxel Form Editor Tools
- Cell and cuboid brushes.
- Add, remove, move, rotate, mirror and scale tools.
- Symmetry and radial placement.
- Palette-role painting.
- Pivot and forward-axis editing.
- Frame-sequence onion skinning.
- Exposed-face and hidden-cell visualisation.
- Automatic LOD suggestions with manual review.
- Import, extraction and provenance panel.

### 25.4 Effect Inspector
| Panel | Content |
| --- | --- |
| Identity | ID, family, category, lifecycle and lifecycle state. |
| Inputs | Contracts, context fields, parameters and spatial roles. |
| Appearance | Forms, palettes, materials, emission and light. |
| Timing | Spawn, active, tail, loops, sequences and cancellation. |
| Composition | Children, channels, masks and priority. |
| Performance | Cost, budgets, LOD, aggregation and virtualisation. |
| Accessibility | Reduced motion, flash, colour-independent and critical fallback. |
| Dependencies | Profiles, forms, materials, packs and replacement links. |
| Validation | Errors, warnings, previews and approval status. |

### 25.5 Authoring Safeguards
- Warn before changing a stable effect ID or required parameter.
- Show all consumers before deleting a form, effect or surface layer.
- Prevent approval with unresolved critical spatial or contract dependencies.
- Display estimated worst-case cell, light and update counts continuously.
- Highlight non-voxel source forms and excessive transparency immediately.
- Keep AI-generated changes in a reviewable diff.

## 26. Preview Laboratory, Runtime Capture and Comparison
### 26.1 Required Preview Contexts
| Context | Purpose |
| --- | --- |
| Open field daylight | Baseline contrast and scale. |
| Forest shade | Foliage overlap and green/brown palette contrast. |
| Stone cave | Dark reflective environment and enclosed visibility. |
| Snow or bright terrain | High-value background test. |
| Village street | NPC and structure density. |
| Machine workshop | Multiple loops, smoke, sparks and occlusion. |
| Mana workshop | Emissive and magic overlap. |
| Raid scene | Combat, weather and warnings together. |
| Split-screen | Reduced viewport and multiple relevance centres. |

### 26.2 Preview Controls
- Camera distance, field of view and motion.
- Environment, time of day, weather and biome.
- Event injection and state-parameter curves.
- Spatial reference selection and runtime-contact placement.
- Accessibility settings.
- Graphics quality and VFX budget pressure.
- Multiplayer relevance and prediction/confirmation timing.
- Loop duration, cancellation and virtualisation.

### 26.3 Runtime Capture and Replay
A captured 23C trace can be loaded into the VFX Forge. The creator may scrub event timing, inspect supplied context, compare resolver choices and replay the selected effect repeatedly. The replay stores semantic events and state, not a video or particle dump, so revised effects can be tested against the same gameplay facts.
### 26.4 Comparison Modes
| Mode | Use |
| --- | --- |
| Side-by-side variants | Compare material, culture, accessibility or LOD forms. |
| Overlay bounds | Check spatial alignment and excessive spread. |
| Heat map | Show cell density, transparency overlap, light cost and update work. |
| Ghost previous revision | Compare timing and shape after edits. |
| Worst-case multiplier | Preview many concurrent instances. |
| Background sweep | Cycle common environment palettes. |

## 27. Accessibility, Safety and Equivalent Feedback
### 27.1 Accessibility Variant Requirements
| Need | VFX Response |
| --- | --- |
| Reduced motion | Lower drift/orbit, stepped transitions, static boundary forms and fewer moving cells. |
| Reduced flash | Clamp rapid emission changes, replace strobe with slow pulse or shape change. |
| Colour vision difference | Use shape, rhythm, segmentation, icons or contrast independent from hue. |
| Photosensitivity | Validate flash frequency, luminance contrast and full-screen coverage. |
| Visual clutter reduction | Reduce decorative children and ambience while preserving critical cues. |
| Low vision | Provide scalable high-contrast critical form and UI/directional equivalent where required. |

### 27.2 Importance Classes
| Class | Examples | Suppression Rule |
| --- | --- | --- |
| Critical | Boss telegraph, ward breach, machine overload, lethal area. | Must retain a safe visible equivalent or approved UI/sound alternative. |
| Important | Impact confirmation, blocked machine, spell charge. | May simplify but should remain perceivable. |
| Supportive | Material debris, construction contact, weather splash. | May reduce or aggregate. |
| Decorative | Ambient motes, distant sparks, minor dust. | First to suppress. |

### 27.3 Safety Validation
- Flash-frequency and luminance-change analysis.
- Full-screen coverage and repeated-impact testing.
- Rapid camera-proximate particle motion test.
- Colour-independent critical-cue check.
- Reduced-motion functional comparison.
- Dense-scene clutter test.
- Player-setting fallback completeness.

## 28. Performance, LOD, Aggregation and Virtualisation
### 28.1 Cost Dimensions
| Cost | Examples |
| --- | --- |
| Active cells | Particles, path segments, surface cells. |
| Spawn/update work | Graph evaluation, motion and parameter updates. |
| Geometry/material changes | Unique forms, materials and frame swaps. |
| Transparency/overdraw | Smoke, fog and overlapping translucent cells. |
| Lights | Dynamic lights, shadows and update frequency. |
| Collision | Presentation collision checks and child responses. |
| Memory | Forms, frame sequences, curves, pools and surface-state records. |
| Network/replay | Semantic event traffic and trace data. |

### 28.2 Standard Fallback Chain
```text
Full
  -> Reduced
      -> Minimal
          -> Critical Cue Only
              -> Hidden only when purely decorative
```

### 28.3 LOD Axes
- Cell count and spawn rate.
- Voxel-form complexity and frame count.
- Update rate and curve sampling.
- Collision and child-effect use.
- Transparency and light use.
- Path sampling interval.
- Surface-layer detail.
- Aggregation radius.
- Visibility/relevance and player importance.

### 28.4 Aggregation
| Family | Aggregation Strategy |
| --- | --- |
| Machine smoke | Area cluster plus nearest distinct emitters. |
| Footsteps | Local per-entity; suppress inaudible/hidden decorative VFX at distance. |
| Rain contact | Surface/zone aggregation rather than per-drop collisions. |
| Mining impacts | Per local action with cooldown; distant NPC work aggregates. |
| Mana network | Sparse flow pulses and highlighted faults. |
| Fire | Individual important fires; distant adjacent cells merge into a cluster effect. |
| Crowd celebration | Area confetti/motes with representative emitters. |

### 28.5 Virtualisation
- Virtualised effects keep minimal phase and lifecycle state without rendering cells.
- When promoted, a loop resumes at the correct phase and current parameter values.
- One-shots outside relevance may be discarded, summarised or replaced by a critical cue according to class.
- Persistent surface state remains in compact records even when not rendered.
- Virtualisation decisions are traceable in the cost inspector.

### 28.6 Budget Profiles
| Profile | Typical Use |
| --- | --- |
| budget.vfx.decorative.micro | Ambient dust, pollen and minor sparks. |
| budget.vfx.contact.standard | Footsteps, mining and small impacts. |
| budget.vfx.machine.standard | Furnace, sawmill and workshop loops. |
| budget.vfx.magic.standard | Spells, runes and conduits. |
| budget.vfx.warning.critical | Overload, breach and telegraph. |
| budget.vfx.boss.major | Arena-scale critical sequence with reserved budget. |
| budget.vfx.village.dense | Aggregated multi-source settlement presentation. |

## 29. Determinism, Multiplayer, Replay, Saving and Unloaded World
### 29.1 Deterministic Variation
- Use event or instance seed for important repeated selection.
- Determinism applies to semantic variant choice and review reproduction, not necessarily every decorative cell transform.
- Client-local decoration may vary when it does not affect readability or replay comparison.
- Random generators must be bounded and independent from authoritative gameplay RNG.
- Captured traces store relevant seeds and selected runtime-product versions.

### 29.2 Multiplayer
| Concern | Rule |
| --- | --- |
| Authority | Server/host confirms meaningful gameplay events; VFX consumes replicated semantics. |
| Prediction | Low-risk local release/footstep feedback may predict through 23C policy. |
| Reconciliation | Do not duplicate confirmed effect; update or cancel predicted sequence safely. |
| Relevance | Replicate semantic events only to relevant clients. |
| Asset mismatch | Use compatibility fallback if a client lacks a non-critical content-pack variant. |
| Split-screen | Each local view has independent visibility/LOD while shared instance lifecycle remains coherent. |

### 29.3 Saving
- Temporary one-shot particles are never saved.
- Loop effects reconstruct from authoritative saved state and current bindings.
- Persistent surface layers save only when policy marks them meaningful.
- Long sequences save a compact authoritative sequence state only when gameplay itself persists them.
- Effect-project source never enters the save file.

### 29.4 Unloaded World
- Distant simulation records machine, fire, ward, weather and structure state, not individual VFX cells.
- On load, presentation reconstructs current loops and meaningful aftermath.
- Elapsed time can age or remove surface layers according to policy.
- Events that occurred while unloaded may produce a summary state rather than replaying every one-shot.

## 30. Validation, Diagnostics, Testing, Migration and Repair
### 30.1 Validation Classes
| Class | Checks |
| --- | --- |
| Identity | Stable IDs, family, category, owner and lifecycle. |
| Style | Approved voxel forms, edge readability, transparency and post-processing dependence. |
| Dependencies | Forms, materials, profiles, spatial roles, contracts, children and packs. |
| Lifecycle | Start/update/stop, cancellation, tails, pooling and recursion limits. |
| Spatial | Required roles, orientation, fallback and variant mappings. |
| Parameters | Types, ranges, defaults, clamps and missing context. |
| Accessibility | Importance, safe variants and equivalent critical cues. |
| Performance | Cost class, LOD, lights, collision, worst-case concurrency and aggregation. |
| Runtime | Bake compatibility, product signature and pool support. |
| Provenance | Source, licence and AI-assistance record. |

### 30.2 Severity Levels
| Severity | Meaning |
| --- | --- |
| Blocker | Cannot bake or ship: invalid style source, missing required contract/spatial role, unbounded recursion, licence failure or no critical fallback. |
| Error | Effect is invalid in a supported use case and must be fixed before approval. |
| Warning | May ship only with explicit review, such as high cost or optional missing variant. |
| Advisory | Optimisation or consistency suggestion. |

### 30.3 Diagnostics
- Resolution trace showing selected effect and variant.
- Spatial overlay showing actual origin, normal, region or path.
- Live active-cell, light, collision and child counts.
- Graph domain timing and expensive-node report.
- LOD transition and virtualisation log.
- Missing parameter/default usage.
- Surface-layer density and save impact.
- Content-pack override and fallback chain.
- Accessibility variant comparison.

### 30.4 Migration
| Change | Migration Requirement |
| --- | --- |
| Rename stable effect ID | Alias plus consumer update plan. |
| Change required parameter | Schema version and default/mapping migration. |
| Change spatial role | 23B remap and compatibility review. |
| Replace form library | Rebake consumers and visual diff. |
| Change family parent | Inheritance diff and approval review. |
| Change budget class | Performance review and profile consumer audit. |
| Deprecate effect | Successor ID and fallback duration. |

### 30.5 Repair Tools
- Relink missing forms or materials.
- Remap spatial roles.
- Generate safe default LOD and accessibility candidates.
- Flatten accidental duplicate local resources into shared library references.
- Convert disallowed billboard source into a review task, not an automatic approval.
- Rebuild runtime products from canonical source.
- Compare revisions through captured traces.

## 31. Summer Engine and AI-Assisted VFX Authoring
### 31.1 Approved Assistance
- Suggest effect family and template from a semantic brief.
- Detect likely emitters such as mouth, chimney, vent, blade edge or crack mask.
- Generate first-pass voxel forms or frame sequences.
- Suggest palette roles from Material DNA and culture context.
- Propose parameter ranges and preview values from contract schemas.
- Generate LOD candidates and cost reductions.
- Identify missing accessibility variants.
- Create worst-case preview scenarios and replay tests.
- Find duplicated forms or effects that should inherit from a family.
- Explain validation errors and propose repair steps.

### 31.2 Prohibited Autonomous Changes
- Approving or publishing an effect without human review.
- Changing event or state contracts silently.
- Changing gameplay authority or outcomes.
- Importing unlicensed source assets.
- Replacing the voxel style with a familiar non-voxel particle solution.
- Raising budgets or removing accessibility fallbacks to make a preview look better.
- Deleting stable IDs or consumers without migration.

### 31.3 Provenance
| Field | Requirement |
| --- | --- |
| assistance_type | Suggestion, generated form, generated graph, optimisation or test. |
| model/tool | Recorded tool/version where available. |
| input_sources | Referenced assets, prompts and material families. |
| human_changes | Creator edits after generation. |
| approval | Named reviewer and date. |
| licence | Any imported or generated-source obligations. |

## 32. Minimum Viable VFX Forge and Forest Hamlet Tests
### 32.1 MVP Tooling
- Effect Project Browser and manifest editor.
- Voxel Form Editor with primitive, cluster, pivot and palette-role tools.
- Guided templates for burst, loop, trail, path, zone and surface layer.
- Basic bounded graph and timeline.
- 23B spatial reference browser and viewport overlays.
- 23C contract, context and parameter preview.
- Palette/material panel and light-profile references.
- LOD, accessibility and budget inspectors.
- Preview Laboratory with trace replay.
- Validation and Godot runtime bake.

### 32.2 MVP Effect Library
| Family | Required Effects |
| --- | --- |
| Fire/smoke | Campfire, furnace chimney, damaged smoke and extinguish. |
| Contact/debris | Stone, dirt, wood, iron and mana-crystal light/medium impacts. |
| Block | Placement, break and repair effects. |
| Foot/weather | Dry dirt, stone, mud/water, rain contact and shelter transition. |
| Machine | Furnace start, work loop, blocked warning, damage sparks and stop. |
| Magic | Mana mote, rune activation, conduit flow, ward contact/breach and simple spell impact. |
| Creature/combat | Goblin weapon trail/impact, wisp effect and captain telegraph. |
| Construction | Watchtower stage dust, hammer contact and completion profile. |
| Persistent surface | Wetness plus scorch or corruption sample. |
| Ambient | Forest pollen/leaves and cave dust/mana hint. |

### 32.3 Forest Hamlet Integrated Scenario
1. Rain begins over the valley; exterior cells and roof-contact effects appear while sheltered interiors suppress direct rain.
2. The player mines stone and iron; exact runtime contacts produce material-correct debris and controlled sparks.
3. The player places and breaks blocks; effects use block faces and Material DNA.
4. A furnace starts, runs, receives heat-driven smoke, becomes blocked and displays a protected warning effect.
5. A mana conduit activates and pulses along its path to a ward stone.
6. A goblin raid begins; captain and attack telegraphs remain visible during weather and machine activity.
7. The ward receives impacts and breaches at a local boundary position if authoritative state permits.
8. NPC builders complete a watchtower stage with construction dust and a bounded completion profile.
9. Scorch or wetness remains as a compact surface layer and reconstructs after save/load where policy requires.
10. Quality settings, reduced motion, reduced flash and dense-scene budget pressure are toggled during the same replay.
11. A captured event trace reproduces the scenario in the VFX Forge for revision comparison.

### 32.4 MVP Acceptance
- Every visible source form is genuinely 3D and voxel-derived.
- No MVP effect contains gameplay mutation logic.
- Every effect resolves through stable IDs and declared contracts/spatial roles.
- Critical raid, ward and machine warnings survive reduced budgets and accessibility settings.
- Machine and ambient loops virtualise and resume correctly.
- Runtime products rebuild from canonical source.
- Worst-case village replay remains within first-pass budget targets.
- All MVP effects have provenance, validation and lifecycle status.

### 32.5 Explicit MVP Deferrals
- Full node catalogue and advanced graph simulation beyond 23E MVP.
- Complete ocean, volumetric cloud and advanced fluid systems.
- All magic schools, dimensions, bosses and creature families.
- Large-scale destruction for entire cities.
- Full dialogue, cinematic and music-synchronised VFX tooling.
- User-generated mod publishing portal.
- Automatic final-quality AI effect generation without review.

## 33. Balancing Rules and Explicit Non-Goals
### 33.1 Authoring Rules
- Create the smallest effect that clearly communicates the event.
- Use families and context before creating a new one-off asset.
- Judge readability in gameplay context, not only isolated close-up preview.
- Preserve voxel geometry when reducing quality.
- Reserve heavy lights, transparency and collision for effects that justify them.
- Protect critical telegraphs before decoration.
- Use persistent surface layers only where state or meaningful aftermath requires them.
- Do not allow effects to become noisier merely because progression tier is higher; increase precision, identity and structure as alternatives.
- Older material and culture families remain useful and visually coherent throughout progression.

### 33.2 Complexity Limits
| Area | Limit Principle |
| --- | --- |
| Graph | Bounded node count, recursion depth and execution domains. |
| Children | Explicit maximum simultaneous children. |
| Forms | Shared and instanced where practical. |
| Frames | Use topology frames only when needed. |
| Lights | Few bounded lights; shadows exceptional. |
| Collision | Presentation-only and distance-limited. |
| Surface layers | Merge and cap density. |
| Variants | Use inheritance and parameters; avoid combinatorial copies. |
| Preview | Every approved effect has representative and worst-case scenarios. |

### 33.3 Explicit Non-Goals
- Photorealistic particle simulation.
- Universal physically accurate fluids or combustion.
- Runtime AI dependency.
- Gameplay scripting inside effect assets.
- One bespoke effect per block/item combination.
- Unlimited effect counts in player-built factories.
- Using VFX to hide unclear gameplay state or poor animation.
- Approving non-voxel source because post-processing makes it appear blocky.

## 34. Open Questions for Later Documents
- Exact first-pass active-cell and light budgets per hardware quality tier belong to 23I and performance profiling.
- The detailed Voxel Particle Graph node list, typed ports, simulation order and collision modes belong to 23E.
- Final Godot resource classes, pooling strategy, multimesh implementation and threading belong to 23I.
- The complete production effect registry, naming catalogue and library size belong to 23J.
- Advanced fluid rendering and world weather integration may require later specialist documents after the MVP.
- Final content-pack security and publishing rules depend on the broader modding plan.
- Camera and haptic authoring remain referenced profiles rather than VFX Forge-owned editors.

## Appendix A. VFX Data Templates
### A.1 Effect Project Manifest
```text
VFXEffectProjectManifest
{
    project_id
    display_name
    owner_pack
    schema_version
    lifecycle_state
    category
    family_id
    effect_ids[]
    local_forms[]
    shared_dependencies[]
    contract_dependencies[]
    spatial_dependencies[]
    budget_profiles[]
    accessibility_requirements
    provenance
    validation_summary
    bake_signature
}
```

### A.2 Effect Definition
```text
VFXEffectDefinition
{
    effect_id
    family_id
    lifecycle_mode
    graph_source
    timeline_source
    spatial_requirements[]
    parameters[]
    palette_roles
    material_profile
    forms_and_sequences[]
    child_links[]
    surface_output_links[]
    light_links[]
    composition_channel
    importance_class
    budget_profile
    lod_chain[]
    accessibility_variants
    runtime_product
}
```

### A.3 Child Effect Link
```text
VFXChildLink
{
    child_effect_or_family_id
    trigger_phase_or_condition
    delay
    inherit_context_fields[]
    spatial_mapping
    parameter_mappings[]
    maximum_count
    budget_priority
    cancellation_policy
}
```

### A.4 LOD Entry
```text
VFXLODEntry
{
    lod_id
    activation_rule
    spawn_scale
    cell_scale
    form_override
    update_rate
    collision_policy
    child_policy
    light_policy
    path_sampling
    transparency_policy
    fallback_next
}
```

### A.5 Surface Layer
```text
SurfacePresentationLayer
{
    layer_id
    channel
    compatible_material_tags[]
    spatial_mode
    material_role_set
    intensity_range
    age_decay
    merge_rule
    cleaning_rule
    save_policy
    lod_policy
    density_budget
}
```

## Appendix B. Recommended VFX Family Catalogue
| Family Group | Initial Subfamilies |
| --- | --- |
| Contact | footstep, landing, mining, melee impact, projectile impact, block placement, block break |
| Material debris | soil, stone, wood, foliage, metal, glass, crystal, bone, chitin, ice, mana crystal |
| Fire and heat | campfire, furnace, torch, wildfire, magical fire, ember, smoke, steam, scorch |
| Fluid | droplet, splash, leak, spray, foam, lava pop, potion, poison |
| Weather | rain, snow, hail, ash, wind debris, lightning contact, mana storm |
| Machine | start, operating, exhaust, blocked, low input, damage, overload, shutdown |
| Power and flow | mechanical pulse, wire spark, steam pressure, fluid path, mana conduit, portal flow |
| Magic | charge, release, projectile, impact, rune, ward, ritual, enchantment, cleansing |
| Corruption | leak, growth, fracture, storm, cleanse, void collapse |
| Creature | foot, breath, wing, venom, roar, damage, phase, death, essence |
| Construction | hammer, saw, placement dust, delivery, stage complete, repair, collapse |
| Ambient | pollen, leaves, dust, spores, fireflies, cave motes, mana hints, dimension motes |
| Persistent surface | wetness, frost, soot, scorch, mud, footprint, mana residue, corruption, repair patch |
| Critical warning | overload, breach, boss telegraph, lethal area, raid alarm visual |

## Appendix C. Voxel Effect Style Register
| Rule ID | Rule | Approval Test |
| --- | --- | --- |
| VFX-STYLE-001 | Visible effect body is genuinely three-dimensional and voxel-derived. | Disable post-processing and inspect from multiple angles. |
| VFX-STYLE-002 | No conventional billboard particle is used as the authored visible body. | Asset/source audit. |
| VFX-STYLE-003 | Trails and beams remain visibly segmented. | Close and gameplay-distance preview. |
| VFX-STYLE-004 | Effect remains readable at intended distance. | Distance and FOV matrix. |
| VFX-STYLE-005 | Transparency does not hide absent geometry or create excessive overdraw. | Overdraw heat map. |
| VFX-STYLE-006 | Palette roles preserve material/event identity. | Background and colour-vision tests. |
| VFX-STYLE-007 | Bloom, refraction and distortion are supporting layers only. | Disable each post-process feature. |
| VFX-STYLE-008 | LOD reductions preserve family silhouette and critical timing. | Side-by-side LOD comparison. |
| VFX-STYLE-009 | Critical cues have reduced-motion and reduced-flash equivalents. | Accessibility preview suite. |
| VFX-STYLE-010 | Dense-scene behaviour is bounded and traceable. | Worst-case multiplier test. |

## Appendix D. Cross-System VFX Matrix
| System | Primary Spatial/Contract Inputs | VFX Responsibilities |
| --- | --- | --- |
| Blocks | faces, regions, masks, runtime contacts | placement, mining, break, repair, wetness, scorch |
| Items/equipment | sockets, edge paths, material regions | trails, enchantment, use, impact, damage |
| Animation | event markers, bone/body sockets | footsteps, release, contact, land, phase |
| Combat | confirmed/predicted contact context | impact, block, parry, projectile, telegraph |
| Creatures | body-plan roles, paths, regions | breath, footsteps, wings, venom, phases |
| NPC/village | job contacts, structures, zones | work, construction, alarms, celebration, damage |
| Automation | ports, paths, machine states | flow, exhaust, blocked, overload, repair |
| Magic | runes, conduits, wards, portals | charge, cast, flow, breach, ritual, corruption |
| World/weather | zones, surface exposure, wind | rain, snow, fog cells, ambience, storms |
| Structures | blueprint cells, stages, boundaries | build, collapse, shrine, portal, ward |
| UI/accessibility | importance and equivalent profiles | directional cues, reduced motion/flash |
| Multiplayer | semantic event/context replication | local dispatch, prediction, reconciliation |

## Appendix E. Validation and Acceptance Checklist
### E.1 Identity and Source
- Stable IDs and namespaces are valid.
- Canonical source exists and runtime product can be rebuilt.
- Family, category, lifecycle and owner pack are declared.
- Provenance and licence information are complete.
- AI assistance is recorded where used.

### E.2 Style
- All visible forms are approved voxel-derived geometry.
- No billboard or smooth ribbon dependency exists.
- Effect survives post-processing disable test.
- Gameplay-distance silhouette is readable.
- Transparency and bloom remain bounded.

### E.3 Integration
- Contracts and context inputs exist and match expected types.
- Required spatial references and fallbacks resolve.
- Parameters have ranges, defaults and clamps.
- Children are bounded and dependency-safe.
- Profile and binding consumers are known.

### E.4 Accessibility and Performance
- Importance class is declared.
- Reduced-motion and reduced-flash variants exist where required.
- Colour-independent critical form exists.
- Budget, LOD, aggregation and virtualisation policies are complete.
- Worst-case preview passes target budgets.
- Critical cues survive budget pressure.

### E.5 Runtime and Migration
- Start/update/stop and cancellation behave correctly.
- Loops resume phase after virtualisation.
- No gameplay mutation is present.
- Multiplayer prediction/confirmation does not duplicate output.
- Persistent surface save policy is bounded.
- Deprecated/replaced resources include migration and fallback.

## Appendix F. Worked Examples
### F.1 Stone Mining Impact
```text
Contract: event.block.mining_contact
Context: iron pickaxe -> stone, medium intensity, dry cave
Spatial: runtime contact + surface normal
Resolver: vfx.family.impact.stone.medium
Effect:
  stone shard cluster burst
  small dust child
  low spark probability from material pair
  no persistent surface layer
Budget:
  contact.standard
Accessibility:
  reduced cell count retains directional burst
```

### F.2 Furnace Blocked State
```text
Contracts: state.machine.active, state.machine.blocked, state.machine.heat_ratio
Spatial:
  chimney mask
  gearbox spark socket
  warning anchor
Composition:
  base smoke loop
  blocked strain smoke
  protected warning pulse
  optional damage sparks
Virtualisation:
  phase retained while distant
Fallback:
  critical warning only under severe budget pressure
```

### F.3 Mana Conduit and Ward
```text
State: flow_ratio, purity, ward_strength
Spatial: conduit path + ward boundary
VFX:
  sparse path pulses
  junction highlights
  boundary cells
Contact event:
  local fracture at runtime boundary point
Breach event:
  protected outward burst and damaged boundary state
LOD:
  player-proximate pulses + fault points only
```

### F.4 Goblin Captain Telegraph
```text
Contract: event.creature.attack_telegraph_started
Spatial: weapon path + target direction
Effect:
  segmented warning trail
  ground boundary cells at affected area
  short charge motes
Importance: critical
Accessibility:
  reduced-motion static segmented arc
  reduced-flash slow intensity pulse
  colour-independent shape
```

### F.5 Rain on Watchtower
```text
Weather: rain heavy
Structure context: exposed roof, sheltered interior, two leak masks
World VFX: bounded rain cells, aggregated roof splashes and drips at leak masks
Surface: wetness layer on exposed faces
Indoor: no direct rain cells; only leak drips and exterior view
Save: wetness ages from weather state; no per-drop persistence
```
