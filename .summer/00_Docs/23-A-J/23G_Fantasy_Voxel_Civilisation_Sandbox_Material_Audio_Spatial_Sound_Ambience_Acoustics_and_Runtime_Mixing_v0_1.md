# Fantasy Voxel Civilisation Sandbox
## 23G - Presentation Forge
### Material Audio, Spatial Sound, Ambience, Acoustics and Runtime Mixing
**Version 0.1 - Detailed Design Bible Draft**

*A detailed world-audio specification for Leyforge, covering material-response resolution, spatial emitters, attenuation, occlusion, acoustic voxel spaces, sound portals, ambience systems, buses, snapshots, ducking, voice management, clustering, virtualisation, accessibility, multiplayer listeners and Forest Hamlet proof-of-concept mixing.*

*Working design document - Material Response Matrix, spatial-audio contracts, generated acoustic-zone graphs, world ambience, runtime mix policy and Godot-facing sound presentation rules*

# Material Audio and Runtime Sound System Statement

| Field | Locked Direction |
|---|---|
| Document Scope | Defines the runtime-facing material audio, spatial sound, ambience, acoustic-zone and mixing systems that consume Sound Events authored in 23F. It covers contact resolution, source geometry, attenuation, directionality, occlusion, obstruction, acoustic voxel spaces, sound portals, environmental sends, ambience scheduling, bus hierarchy, snapshots, ducking, loudness, concurrency, clustering, virtualisation, listeners, accessibility, validation and MVP content. |
| Core Philosophy | Audio must make Leyforge's voxel world readable, physical and alive without becoming noisy or computationally unbounded. The system resolves authoritative events and world state into clear sound while preserving gameplay truth, player comfort, accessibility and performance. |
| Material Direction | Material audio uses a layered Material Response Matrix rather than a unique hard-coded sound for every pair. Source material, target material, action, intensity, tool or body family, environment and state resolve to reusable Audio Families with predictable fallback. |
| Spatial Direction | Sound sources use semantic anchors, sockets, regions, paths, volumes and runtime contact points from 23B. Spatial behaviour is authored through reusable profiles describing source shape, distance, directionality, movement, occlusion, priority and fallback. |
| Acoustic Direction | Voxel structures may be analysed into bounded Acoustic Zones connected by Sound Portals. The system approximates enclosure, dominant material, opening area, damping, reverb and leakage without tracing every voxel for every voice every frame. |
| Ambience Direction | Ambience is assembled from beds, local emitters, intermittent details, weather layers, civilisation activity and state overlays. It responds to biome, time, season, weather, structures, danger, magic and settlement activity while leaving room for important gameplay cues. |
| Mixing Direction | A stable bus hierarchy, mix snapshots, priority rules, ducking and user controls manage the complete soundscape. Local Sound Events may request routing and sends but may not bypass global mix policy through uncontrolled gain or bus creation. |
| Voice Direction | Concurrency, ownership, aggregation, clustering and virtualisation are mandatory foundations. Dense villages, machine halls, storms and raids are represented through bounded voices and importance-aware fallbacks rather than one audible player per source. |
| Accessibility Direction | Critical information remains perceivable when audio is reduced or disabled. Captions, visual indicators, haptics, frequency-safe alternatives, reduced-intensity mixes and sensory-equivalent cues are authored as part of the Presentation Profile. |
| Multiplayer Direction | Gameplay events remain authoritative, but cosmetic ambience and non-critical variation may resolve locally. Split-screen and multiple listeners use explicit arbitration instead of multiplying all voices without limit. |
| Runtime Direction | Canonical data compiles into Godot-facing material tables, spatial profiles, zone graphs, portal records, bus and snapshot resources, ambience plans and voice-manager policies. Generated runtime products remain replaceable outputs. |
| MVP Direction | Prove readable footsteps and impacts, cave and shelter acoustics, rain on different surfaces, furnace and mana-furnace mixing, village ambience, door and window leakage, ward warnings, goblin raid priority and bounded dense-scene behaviour. |
| Deferred Scope | Full dialogue production, adaptive music composition, cinematic mastering, platform certification values and advanced physically based acoustics remain outside this document, while routing and integration contracts are preserved. |

# Document Purpose

Document 23F defines how creators import, record, layer, process, vary and package runtime-ready Sound Events. This document defines how those events are selected for physical contacts, positioned in a three-dimensional voxel world, propagated through spaces, combined into ambience and managed inside the final runtime mix.

Leyforge cannot rely on a flat list of audio clips attached directly to objects. The same pickaxe strike should respond to stone, ore, crystal, wood, metal or corrupted material. Rain should sound different on leaves, roof tiles, open water and armour. A furnace should remain readable when one machine is nearby but should merge into a believable industrial bed when hundreds operate across a settlement. A goblin horn must cut through rain and village activity without requiring every other source to be silenced.

The system must therefore solve several connected problems: material classification, contextual event selection, spatial placement, distance and direction, room and opening behaviour, environmental ambience, bus routing, dynamic mix priorities, voice budgets and accessibility. These systems must remain authorable by creators, reviewable as data, deterministic where required and scalable from a single campfire to a capital city.

This document provides those rules. It does not replace 23F Sound Event authoring, 23B spatial anchors, 23C Event Contracts or the future Godot implementation document. Instead, it defines the world-audio contract that those systems must satisfy together.

# Engine and Forge Status Note

Leyforge is being developed in Godot with Summer Engine used as the AI-native development environment. The runtime may use Godot audio buses, AudioStream resources, pooled AudioStreamPlayer variants, area and custom-resource data, listeners, effects and purpose-built services. The design should not assume that every desired feature exists as a single built-in Godot node; bounded custom services may be required for material resolution, zone graphs, clustering and multi-listener arbitration.

Summer Engine may assist with material classification, response-table coverage, attenuation suggestions, zone analysis, portal detection, ambience tagging, loudness checks, budget simulation and regression reports. It must not fabricate source rights, approve final mixes, create hidden gameplay dependencies or replace human listening review.

# Design Sources

| Source | Relevant Direction | How 23G Uses It |
|---|---|---|
| 00 - Master Game Design Bible | The world is stylised, readable, atmospheric, voxel-based and built around living civilisations, magic and automation. | Audio reinforces physical materials, cosy settlement life, dangerous wilderness, magical infrastructure and world consequence. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Material and ambience systems provide readable feedback for every loop stage without requiring isolated hard-coded clips. |
| 03 - Blocks Registry | Blocks expose material families, faces, states, damage, shape, fluid and functional behaviour. | Supplies target material, surface family, block state, enclosure material and contact context. |
| 04 - Items Registry | Items expose material, quality, equipment, durability, charge and use roles. | Supplies source material and tool, weapon, armour, container and held-object audio context. |
| 05 - Crafting and Recipe Registry | Stations and machines have timed work, fuel, power, outputs, by-products and failure. | Drives lifecycle loops, contact layers, completion cues, blocked warnings and mix priority. |
| 07 - NPC Village System | Villages contain jobs, schedules, buildings, crowds, alarms, projects and simulation LOD. | Requires settlement ambience, job clustering, alarm priority and near/far aggregation. |
| 08 - Automation System | Machines, logistics, power and mana networks remain physical and readable, with detailed local and abstract distant simulation. | Requires machine source profiles, network clustering, phase continuity, warning protection and distant industrial summaries. |
| 09 - Magic System | Mana, runes, wards, rituals, portals and corruption form practical infrastructure. | Requires spatial hums, flow paths, ward boundaries, magical acoustic overlays and critical breach cues. |
| 10 - Creatures and Monsters | Creatures should be identifiable by sound, habitat, movement and behaviour. | Requires spatial voice priority, threat-distance rules, occlusion policy, ecology ambience and boss mix states. |
| 11 - Biomes and World Generation | Biomes, caves, weather, rivers, leylines and dynamic states shape exploration. | Provides biome ambience, weather exposure, cave acoustics, water sources and region-scale ambience inputs. |
| 12 - Structures | Structures expose rooms, doors, windows, passages, materials, damage and states. | Supplies Acoustic Zones, Sound Portals, enclosure analysis, leakage and structure-specific ambience. |
| 16 - Combat, Gear and Defence | Combat depends on readable attacks, materials, defence, impacts, warnings and aftermath. | Requires impact resolution, priority classes, transient protection and accessibility equivalents. |
| 17 - UI/UX System | UI must remain readable, accessible, localisable, controller-ready and world-first. | Provides captions, direction cues, audio settings, critical alerts and user mix controls. |
| 18 - Technical Implementation Plan | Systems use stable IDs, data registries, event-driven architecture, performance budgets, simulation LOD and authoritative state. | Audio resources compile into validated registries and bounded runtime services rather than uncontrolled scene logic. |
| 23A - Presentation Forge Foundation | Presentation consumes gameplay truth through profiles, budgets, channels and accessibility equivalents. | Supplies shared identity, Presentation Profiles, composition channels and critical-cue rules. |
| 23B - Spatial Attachment System | Defines anchors, sockets, regions, paths, zones, Surface Masks and runtime contacts. | Supplies every stable and dynamic spatial reference used by sources, portals and ambience. |
| 23C - Events and Bindings | Defines Event Contracts, Context Packets, parameters, lifecycle and deterministic resolution. | Supplies legal event and state inputs for contact, ambience, snapshots and priority. |
| 23F - Sound Forge | Defines Sound Events, Audio Families, processing, variation, loops, routing intent and budget metadata. | Supplies the content consumed and resolved by the systems defined in 23G. |

# Static Table of Contents

1. Locked Material Audio and Runtime Sound Identity
2. Approved Direction Summary
3. System Architecture and Workspace Boundaries
4. Runtime Audio Resource Taxonomy, Stable IDs and Registries
5. Material Response Matrix
6. Acoustic Material DNA and Contact Properties
7. Contact Context, Resolution and Fallback
8. Footsteps, Movement, Body and Equipment Contact
9. Mining, Placement, Breakage and Construction Audio
10. Combat, Armour, Projectile and Damage Contact
11. Machine, Automation, Crafting and Mana Contact
12. Spatial Source Model and Emitter Geometry
13. Anchors, Sockets, Regions, Paths and Runtime Contacts
14. Attenuation, Distance Curves and Audible Range
15. Directionality, Orientation and Cone Behaviour
16. Obstruction, Occlusion, Shielding and Line of Sound
17. Acoustic Voxel Spaces and Generated Zone Graphs
18. Sound Portals, Openings, Leakage and Transitions
19. Reverb, Reflection, Diffusion and Environment Sends
20. Ambience Architecture and Component Model
21. Biome, Weather, Time and Seasonal Ambience
22. Village, Structure, Dungeon and Factory Ambience
23. Fluids, Wind and Environmental Contact Systems
24. Bus Hierarchy, Routing and User Controls
25. Mix Snapshots, State Transitions and Ducking
26. Loudness, Dynamic Range, Frequency and Mastering Intent
27. Voice Manager, Concurrency, Priority and Stealing
28. Aggregation, Clustering, Virtualisation and Audio LOD
29. Listener Model, Camera Perspective and Split-Screen
30. Multiplayer Authority, Prediction and Local Variation
31. Accessibility, Captions, Sensory Equivalence and Comfort
32. Persistence, Save Boundaries, Reconstruction and Replay
33. Creator Workflow, Preview and Test Laboratory
34. Validation, Diagnostics, Review and Quality Assurance
35. Summer Engine-Assisted Authoring and Automation Boundaries
36. Minimum Viable 23G System and Initial Library
37. Forest Hamlet Integrated Runtime Audio Scenario
38. Balancing and Authoring Rules
39. Explicit Deferrals and Open Questions
Appendix A. Material Audio Data Templates
Appendix B. Spatial Audio Profile Template
Appendix C. Acoustic Zone and Sound Portal Templates
Appendix D. Bus, Snapshot and Priority Catalogue
Appendix E. Validation Code Register
Appendix F. MVP Acceptance Matrix
Appendix G. Cross-System Integration Matrix

# 1. Locked Material Audio and Runtime Sound Identity

Material audio, spatial sound, ambience, acoustics and runtime mixing form the world-listening layer of Presentation Forge. Sound Forge creates the audio content; 23G decides how the world chooses, places, shapes, groups and prioritises that content for the player.

## 1.1 Locked Rule

> Every audible result must be traceable to a validated Sound Event, a legal Presentation Context, a spatial reference or ambience source and a bounded runtime policy. Audio may communicate gameplay truth, but it may not invent that truth or bypass global accessibility, mix and performance rules.

## 1.2 Runtime Sound Promise

A player should be able to make useful judgements by listening:

- Which material is underfoot or being struck.
- Whether a sound is near, far, above, below, indoors or outdoors.
- Whether a machine is idle, operating, blocked, damaged or dangerous.
- Whether rain is falling in the open, on a roof or beyond a closed door.
- Whether a creature is approaching, retreating, hidden or obstructed.
- Whether a ward is stable, weakening or breached.
- Whether a village is peaceful, working, threatened, celebrating or damaged.
- Whether the player crossed from a forest into a cave, hall, factory or magical zone.

The system should provide this information naturally rather than turning the world into constant warning tones.

## 1.3 Identity Layers

| Identity Layer | Design Meaning | Player-Facing Result |
|---|---|---|
| Material Readability | Contacts derive from material families, action and intensity. | Stone, timber, metal, mud, crystal and magical materials sound physically distinct. |
| Spatial Readability | Sources use position, shape, direction, distance and movement. | Players can locate threats, machines, water, NPC activity and objectives. |
| Environmental Belonging | Rooms, openings, biomes, weather and structures shape sound. | Caves, cottages, halls, forests and factories sound like different places. |
| Civilisation Activity | Jobs, crowds, machines, bells, trade and construction combine into bounded settlement ambience. | Villages sound alive without every worker producing an independent full-volume loop. |
| Magical Infrastructure | Mana, wards, conduits, rituals and portals have spatial and state-driven identities. | Magic feels built into the world rather than added as detached effects. |
| Dynamic Priority | Threats, interaction feedback and critical warnings survive dense mixes. | Important information remains audible during storms, raids and industry. |
| Scalable Simulation | Voices cluster, virtualise and reconstruct from state. | One campfire and a capital city can use the same architecture at different budgets. |
| Accessible Communication | Critical meaning has captions and sensory equivalents. | Players are not excluded by hearing, frequency sensitivity or mix preference. |

## 1.4 What the System Is Not

- It is not a physically exact acoustic simulator tracing every voxel for every sound.
- It is not a licence for every block, machine and NPC to produce a continuous audible loop.
- It is not a replacement for authored Sound Events or human mix judgement.
- It is not a flat global reverb attached to every sound in a biome.
- It is not an excuse to increase loudness whenever a cue feels unclear.
- It is not a hidden gameplay system that changes AI awareness, damage or machine output.
- It is not a POC requirement to solve concert-hall acoustics, cinematic music or full dialogue production.

# 2. Approved Direction Summary

| Area | Approved Direction |
|---|---|
| Runtime role | Consume Sound Events and authoritative context; resolve material, space, ambience and mix. |
| Material resolution | Use families, tags, properties and fallback tiers rather than exhaustive pair-specific assets. |
| Contact dimensions | Source material, target material, action, intensity, source family, target state, environment and optional magic context. |
| Spatial references | Use 23B anchors, sockets, regions, paths, zones and runtime contacts. |
| Source geometry | Point, oriented point, line, path, surface, region, volume, area bed and clustered source. |
| Distance | Reusable attenuation profiles with minimum/maximum range, rolloff, filters and priority-aware culling. |
| Occlusion | Bounded obstruction and zone/portal reasoning; do not raycast every voice at full frequency. |
| Acoustics | Generate reviewable zone graphs from voxel structures, then allow creator override. |
| Portals | Doors, windows, arches, tunnels, vents, chimneys and magical openings control leakage. |
| Ambience | Beds plus intermittent details, local sources, weather contact, settlement activity and state overlays. |
| Mix hierarchy | Stable global buses with category buses, sends, snapshots, side-chain rules and user sliders. |
| Critical cues | Protected by priority, frequency space, captions and non-audio alternatives rather than raw loudness alone. |
| Dense scenes | Cluster, aggregate, virtualise and summarise. Decorative voices yield before gameplay-critical voices. |
| Listener policy | One primary listener in normal play; explicit arbitration for split-screen, local co-op and special cameras. |
| Multiplayer | Server or authority confirms gameplay events; clients may vary non-critical local ambience and rendering. |
| Accessibility | Author caption IDs, criticality, directional assistance, comfort variants and reduced-audio equivalents. |
| Runtime products | Compile matrices, profiles, zone graphs, ambience plans and mix resources into Godot-facing data. |
| MVP | Forest Hamlet, cave, rain shelter, machine chain, mana infrastructure and raid priority. |

# 3. System Architecture and Workspace Boundaries

## 3.1 Architecture Overview

```text
Authoritative Gameplay and World State
                |
                v
      23C Presentation Context
                |
      +---------+---------+
      |                   |
      v                   v
Material Response      Ambience Resolver
      |                   |
      +---------+---------+
                v
          Sound Event Plan
                |
                v
        Spatial Audio Resolver
                |
        Acoustic Zone Graph
                |
                v
       Bus / Snapshot / Voice Manager
                |
                v
        Godot Playback Resources
```

## 3.2 Workspace Structure

```text
Audio Forge
├── 23F Sound Forge
│   ├── Source Library
│   ├── Sound Event Editor
│   ├── Audio Family Editor
│   └── Loop and Layer Tools
└── 23G World Audio
    ├── Material Response Matrix Editor
    ├── Spatial Profile Editor
    ├── Acoustic Zone and Portal Editor
    ├── Ambience Composer
    ├── Bus and Snapshot Editor
    ├── Voice Budget Simulator
    ├── Multi-Listener Preview
    └── Runtime Mix Diagnostics
```

## 3.3 Shared Services

| Shared Service | 23G Use |
|---|---|
| Stable ID Registry | Resolves materials, Sound Events, spatial profiles, zones, portals, buses and snapshots. |
| Presentation Context | Supplies source, target, material, action, intensity, environment, state and authority. |
| Spatial Registry | Resolves anchors, regions, paths, volumes, zone IDs and fallback mappings. |
| Material DNA | Supplies physical and semantic properties for contact resolution and acoustics. |
| Presentation Profiles | Bundles Sound Events with VFX, captions, haptics and accessibility equivalents. |
| Budget Service | Supplies hardware-tier voice, CPU, memory and streaming limits. |
| Validation Service | Detects missing mappings, unsafe loudness, broken portals, unbounded voices and inaccessible critical cues. |
| Runtime Capture | Records event, zone, bus, snapshot and voice decisions for replay. |

## 3.4 Responsibility Boundaries

| System | Owns | Does Not Own |
|---|---|---|
| Gameplay | Truth of hits, movement, weather, machine state, danger and world state. | Audio source selection, attenuation or final mix. |
| 23F Sound Forge | Audio sources, layers, variations, event lifecycle and routing intent. | Final material matrix, room propagation or bus arbitration. |
| 23G World Audio | Context resolution, spatialisation, acoustics, ambience, routing policy and voice management. | Gameplay success, source rights or detailed waveform editing. |
| 23B Spatial System | Stable spatial identity and mapping. | Sound Event content or mix priority. |
| 23H UI/Test Lab | Creator workflow, visualisation and testing experience. | Runtime sound rules. |
| 23I Implementation | Godot services, data structures, threading and platform integration. | Creative policy or content approval. |

## 3.5 Complexity Tiers

| Tier | Intended User | Features |
|---|---|---|
| Guided | General content creator | Choose material family, spatial preset, ambience template and bus intent. |
| Standard | Audio or technical designer | Edit matrix rules, curves, zones, portals, snapshots, concurrency and clustering. |
| Advanced | Senior audio/technical designer | Custom resolver rules, generated zone review, complex ambience states and multi-listener policy. |
| Protected | Engine/system owner | Core bus topology, authority policy, global safety limits and runtime contracts. |

# 4. Runtime Audio Resource Taxonomy, Stable IDs and Registries

## 4.1 Core Resource Types

| Resource | Purpose | Example ID |
|---|---|---|
| Material Audio Profile | Declares a material family's acoustic and contact properties. | `audio.material.stone.common` |
| Material Response Rule | Maps context to a Sound Event or family. | `audio.response.pickaxe_iron.on_stone.heavy` |
| Contact Action Profile | Defines default context and fallback for an action. | `audio.action.mining_impact` |
| Spatial Audio Profile | Defines source geometry, attenuation, directionality and occlusion policy. | `audio.spatial.machine_medium` |
| Attenuation Profile | Reusable distance and filtering behaviour. | `audio.attenuation.creature_call_long` |
| Occlusion Profile | Defines tests, update rate and filter/gain response. | `audio.occlusion.standard_world` |
| Acoustic Zone | Bounded space with acoustic properties and state. | `audio.zone.blacksmith.interior` |
| Sound Portal | Connection between zones or zone and exterior. | `audio.portal.blacksmith.front_door` |
| Ambience Plan | Defines beds, details, emitters and state layers. | `audio.ambience.biome.forest_temperate` |
| Mix Bus | Stable routing category. | `audio.bus.machine` |
| Mix Snapshot | Coordinated temporary bus and effect state. | `audio.snapshot.raid` |
| Concurrency Group | Defines voice ownership and limits. | `audio.concurrency.footsteps.local` |
| Cluster Profile | Defines how many sources combine spatially. | `audio.cluster.machine_furnace` |
| Listener Policy | Defines perspective and multi-listener arbitration. | `audio.listener.split_screen_two_player` |

## 4.2 Stable ID Rules

- IDs use lowercase namespaces separated by periods.
- IDs describe semantic purpose rather than file path.
- Runtime resource IDs remain stable when implementation assets are regenerated.
- Culture, dimension and state variants extend a base ID or declare a parent.
- Deprecated IDs remain as aliases during migration when safe.
- Protected bus and priority IDs cannot be silently overridden by content packs.

## 4.3 Registry Separation

The runtime should maintain separate registries for:

- Material audio profiles.
- Response rules and fallback chains.
- Spatial and attenuation profiles.
- Acoustic zones and portals.
- Ambience plans.
- Bus and snapshot definitions.
- Concurrency and cluster policies.
- Listener policies.
- Validation and migration metadata.

Definitions remain immutable at runtime. Instance state belongs to voices, zones, ambience controllers and listeners.

## 4.4 Production Lifecycle

```text
Draft
-> Context Complete
-> Spatially Valid
-> Acoustically Valid
-> Mix Valid
-> Accessibility Valid
-> Performance Valid
-> Approved
-> Baked
-> Released
```

# 5. Material Response Matrix

## 5.1 Purpose

The Material Response Matrix prevents two failure modes: creating a bespoke Sound Event for every possible combination, and using one generic impact regardless of material. It resolves context through increasingly broad rules until it finds a valid response.

## 5.2 Resolution Dimensions

```text
Source Material
x Target Material
x Action
x Intensity
x Source Family
x Target State
x Environment
x Optional Magic Context
= Sound Event or Audio Family
```

Not every dimension must be authored for every rule. A rule may match `any_metal` against `stone_family`, while a more specific rule handles `mythril` striking `mana_crystal`.

## 5.3 Resolution Order

1. Exact source material + exact target material + exact action + intensity.
2. Exact source material + target family + action.
3. Source family + exact target material + action.
4. Source family + target family + action.
5. Action + target family default.
6. Action global default.
7. Approved silent fallback with diagnostic, only for non-critical content.

## 5.4 Rule Example

```text
rule_id: audio.response.mining.iron_pick.on_stone.heavy
source_material: material.metal.iron
source_family: tool.pickaxe
source_action: action.mining_impact
target_material: material.stone.common
intensity_band: heavy
conditions:
  - target_state != submerged
result_event: sound.mining.iron_pick_stone_heavy
spatial_profile: audio.spatial.contact_small
priority: interaction_standard
fallback_rule: audio.response.mining.any_pick.on_stone
```

## 5.5 Weighted Alternatives

A response may choose among approved variants:

- A primary family selected every time.
- A rare sweetener such as a spark ring.
- State overlays such as wetness or corruption.
- Environment tails supplied by the zone rather than baked into the contact.
- Culture or dimension variants inherited from the object or region.

## 5.6 Matrix Authoring Views

The editor should support:

- Spreadsheet matrix by source and target family.
- Filtered list by action.
- Coverage heatmap.
- Fallback-chain preview.
- Conflict and ambiguity warnings.
- Rapid audition across materials and intensities.
- Runtime-trace lookup showing which rule won and why.

## 5.7 Pair Explosion Control

Creators should add a specific pair only when it produces meaningful identity or gameplay readability. Shared material families, property-driven overlays and target defaults should cover ordinary combinations.

# 6. Acoustic Material DNA and Contact Properties

## 6.1 Material Audio Profile

A material's presentation profile may include:

| Property | Meaning |
|---|---|
| Density Class | Light, medium, heavy or massive perceived weight. |
| Hardness | Soft, yielding, firm, hard, brittle or crystalline. |
| Resonance | Dead, short, ringing, hollow, metallic, glassy or magical. |
| Surface Texture | Smooth, rough, granular, fibrous, wet, sticky or jagged. |
| Absorption | Relative damping contribution to acoustic zones. |
| Reflection | Relative high-frequency reflection in a space. |
| Transmission | Tendency for sound to leak through the material. |
| Break Character | Crumble, splinter, crack, shatter, tear, deform or dissolve. |
| Footstep Family | Default movement response. |
| Impact Family | Default collision response. |
| Debris Family | Optional associated audio/VFX material family. |
| Wet Variant | How water changes gain, resonance and texture. |
| Frozen Variant | How frost or ice changes contact. |
| Corrupted Variant | Additional tonal, noise or instability behaviour. |
| Magic Affinity | Optional response to mana, runes or specific schools. |

## 6.2 Material Families

Initial broad families:

- Soil and dirt.
- Mud and wet ground.
- Sand and loose gravel.
- Stone and deepstone.
- Brick and masonry.
- Timber and plank.
- Leaves and vegetation.
- Fibre, cloth and leather.
- Bone, shell and chitin.
- Copper, bronze, iron and steel.
- Mythril and arcane alloy.
- Glass and ceramic.
- Ice and snow.
- Water, lava and viscous fluids.
- Crystal and mana crystal.
- Corruption, void and unstable realm materials.
- Celestial and high-order magical materials.

## 6.3 Surface Versus Core Material

A block or item may expose different surface and core materials. A timber door with iron bands can resolve:

- Foot or hand contact from the timber surface.
- Weapon hit on the iron band from a Surface Mask or runtime face tag.
- Breakage using both timber splinter and metal hardware layers.

## 6.4 Shape and Construction Influence

Material alone is not always sufficient. Optional construction tags include:

- Solid block.
- Hollow container.
- Thin plate.
- Beam or post.
- Tensioned surface.
- Loose pile.
- Filled vessel.
- Empty vessel.
- Reinforced assembly.

These tags may select a resonance overlay without duplicating the entire material family.

## 6.5 Acoustic Contribution to Zones

When a voxel structure is analysed, exposed material faces contribute approximate absorption, reflection and diffusion. The generated profile uses weighted dominant materials rather than retaining every individual face in the runtime graph.

# 7. Contact Context, Resolution and Fallback

## 7.1 Contact Context Packet

```text
AudioContactContext
{
    event_id
    source_entity_id
    target_entity_id
    source_material_id
    target_material_id
    source_family_id
    target_surface_tag
    action_id
    intensity_value
    intensity_band
    world_position
    surface_normal
    relative_velocity
    source_mass_class
    target_state_tags[]
    biome_id
    acoustic_zone_id
    wetness
    temperature
    magic_school_id
    authority_state
    deterministic_seed
}
```

## 7.2 Intensity Bands

Recommended default bands:

| Band | Typical Use |
|---|---|
| Micro | Tiny debris, soft brush, cloth movement. |
| Light | Walk step, small item place, glancing impact. |
| Medium | Normal mining, tool use, ordinary melee contact. |
| Heavy | Sprint landing, heavy weapon, block collapse. |
| Extreme | Siege impact, boss strike, explosion-scale contact. |

The resolver may use a continuous intensity value for gain, pitch or layer blends while selecting a discrete authored band.

## 7.3 Contact Lifecycle

Some contacts are one-shots. Others require lifecycle ownership:

- Scraping across a surface.
- Rolling wheels.
- Dragging a crate.
- Water flowing along a path.
- Tool sawing or grinding.
- Continuous shield pressure.

Lifecycle contacts use begin, update and end contracts to prevent repeated restarts.

## 7.4 Environmental Overlays

The contact event should not contain a baked cave echo for every cave. The spatial and acoustic system may add:

- Zone reverb send.
- Open-air tail reduction.
- Underwater filtering.
- Wet-material overlay.
- Snow muffling.
- Corruption or mana-zone coloration.

## 7.5 Missing Context

When context is incomplete:

1. Use semantic family tags.
2. Use the target's default material.
3. Use the action default.
4. Log the missing field in development builds.
5. Never guess a critical cue from an unrelated family.

## 7.6 Determinism

Gameplay-confirmed impacts may use the event seed for variant selection. Local decorative texture, such as an extra pebble tick, may vary without affecting replay meaning.

# 8. Footsteps, Movement, Body and Equipment Contact

## 8.1 Footstep Resolution

Footsteps resolve from:

```text
Footwear or Body Contact
x Ground Material
x Movement Mode
x Speed / Weight
x Wetness / Snow Depth
x Acoustic Zone
```

## 8.2 Movement Modes

- Walk.
- Run.
- Sprint.
- Crouch.
- Sneak.
- Jump take-off.
- Light landing.
- Heavy landing.
- Slide.
- Climb.
- Crawl.
- Swim entry and exit.
- Mount movement.
- Large-creature gait.

## 8.3 Footwear and Body Families

- Bare foot or paw.
- Soft shoe.
- Leather boot.
- Heavy boot.
- Metal sabaton.
- Hoof.
- Claw.
- Chitin limb.
- Golem foot.
- Wheel.
- Track or mechanical leg.

## 8.4 Equipment Movement

Equipment may add bounded secondary layers:

- Armour plate movement.
- Buckles and leather.
- Backpack contents.
- Weapon sheath.
- Tool belt.
- Mana focus hum.
- Wet clothing.

Secondary equipment must not produce a full loud event on every step. The family defines probability, cadence and concurrency.

## 8.5 Surface Depth and State

Mud, snow, leaves, ash and shallow water may expose a depth value. The resolver blends:

- Base ground contact.
- Surface-layer contact.
- Displacement or splash layer.
- Foot extraction layer for deep yielding surfaces.

## 8.6 First- and Third-Person Balance

The local player's body audio may use a near-field profile with reduced distance loss and tighter concurrency. Remote characters use world-spatial profiles. Perspective changes should not restart managed movement loops.

## 8.7 NPC and Crowd Footsteps

Nearby important NPCs can use full footsteps. Groups use density-aware limits, cadence thinning and cluster summaries. Critical approaching threats remain exempt from purely decorative crowd reduction.

# 9. Mining, Placement, Breakage and Construction Audio

## 9.1 Mining Contact

Mining combines:

- Tool transient.
- Target material body.
- Tool resonance.
- Optional debris detail.
- Progress or fracture layer.
- Environment response.

Repeated mining requires variation and timing aligned with authoritative tool contacts.

## 9.2 Mining Progress

The block damage state may adjust sound across stages:

| Damage Stage | Audio Change |
|---|---|
| Intact | Clean material response. |
| Cracked | Added fracture and loosened debris. |
| Near break | Shorter body, more rubble and instability. |
| Break | Dedicated destruction event and debris result. |

## 9.3 Block Placement

Placement resolution considers:

- Placed block material.
- Supporting surface.
- Placement size and shape.
- Construction mode.
- Whether the action completes a structure stage.

A light decorative item should not use the same weight as a full stone block.

## 9.4 Breakage

Break events use the target's break character and construction tags. A reinforced window may produce glass shatter plus frame deformation, while a mana crystal may produce crystalline fragments and a magical release.

## 9.5 Construction Work

Construction uses managed work families:

- Hammering.
- Sawing.
- Chiselling.
- Mortar or stone placement.
- Scaffold movement.
- Rope and pulley.
- Magical assembly.
- Repair and cleansing.

Multiple builders cluster by worksite, tool family and distance.

## 9.6 Collapse

Structural collapse is presented through staged events:

1. Stress warning.
2. Initial fracture.
3. Major block movement.
4. Impacts and rubble.
5. Settling tail.

The actual collapse is owned by gameplay or structure simulation.

# 10. Combat, Armour, Projectile and Damage Contact

## 10.1 Combat Resolution

Combat audio may resolve:

```text
Weapon Material and Family
x Target Material or Armour
x Result Type
x Intensity
x Damage Type
x Environment
```

## 10.2 Result Types

- Miss or air pass.
- Glancing contact.
- Confirmed hit.
- Armour hit.
- Shield block.
- Parry.
- Deflection.
- Critical or heavy hit.
- Structure hit.
- Creature-body hit.
- Magical absorption.
- Ward block or breach.

## 10.3 Priority

Local combat confirmation, incoming threat telegraphs, parries, shield breaks and critical damage belong to protected priority classes. Decorative armour movement and distant minor skirmishes yield first.

## 10.4 Projectile Audio

Projectile systems may use:

- Launch event.
- Flight pass-by near the listener.
- Impact resolution.
- Embed or ricochet state.
- Persistent attached source where relevant.

Pass-by cues require listener-relative geometry and strict cooldowns to prevent spam.

## 10.5 Armour Layers

Armour can contribute an overlay based on:

- Material family.
- Coverage region.
- Damage state.
- Blocked or penetrated result.
- Enchantment or corruption state.

## 10.6 Damage Comfort and Content Settings

Creature-body or injury audio should support intensity settings and family-friendly alternatives without changing authoritative damage. Accessibility and comfort variants are selected through presentation settings.

# 11. Machine, Automation, Crafting and Mana Contact

## 11.1 Machine Source Structure

A machine may expose separate sources:

- Motor or drive.
- Gearbox.
- Processing chamber.
- Input contact.
- Output contact.
- Chimney or exhaust.
- Warning source.
- Mana core.
- Fluid or steam port.

Each uses a stable socket or region and may share one lifecycle controller.

## 11.2 Material Contact in Machines

Machine processing can use the same response system with controlled action IDs:

- Crushing.
- Grinding.
- Cutting.
- Hammering.
- Smelting charge.
- Item drop into container.
- Conveyor or chute contact.
- Valve movement.
- Gear engagement.

## 11.3 Network Summaries

Belts, chutes, pipes and conduits should not create a voice for every item segment. The system may represent:

- Local contact at visible junctions.
- A path or region hum.
- Throughput-controlled texture.
- Occasional item details.
- Clustered network activity.

## 11.4 Power and Load

Runtime parameters may control:

- Loop rate.
- Mechanical rhythm.
- Gain within bounded range.
- Strain overlay.
- Low-pass or distortion.
- Warning cadence.
- Mana pulse density.

Normal machines warn and shut down before destructive failure unless gameplay explicitly confirms a risky state.

## 11.5 Crafting Stations

Stations combine interaction, work, completion, output and failure audio. Nearby multiple stations cluster by family while interaction confirmation remains local and protected.

## 11.6 Mana Infrastructure

Mana conduits, batteries, furnaces and wards may use paths, regions and state parameters. The system should communicate flow, charge, instability and protection coverage without filling the entire settlement with constant high-frequency hum.

# 12. Spatial Source Model and Emitter Geometry

## 12.1 Source Shapes

| Shape | Use |
|---|---|
| Point | Small item, bell clapper, impact or creature mouth. |
| Oriented Point | Directional mouth, horn, exhaust or spell origin. |
| Line | Water edge, crack, narrow machine belt or beam. |
| Path | River segment, conveyor, mana conduit or moving trail. |
| Surface | Waterfall face, roof rain, ward wall or large machine panel. |
| Region | Campfire, workshop bench, crowd group or damaged area. |
| Volume | Cave ambience, fog sound bed, portal interior or machine hall. |
| Area Bed | Non-localised biome or weather ambience around the listener. |
| Cluster | Runtime-combined group of similar physical sources. |

## 12.2 Source Transform

Every spatial source resolves:

- Position.
- Orientation.
- Optional velocity.
- Source shape dimensions.
- Owning entity or zone.
- Spatial profile.
- Fallback transform.
- LOD and virtualisation mapping.

## 12.3 Extended Sources

Large sources should not be represented by a single centre point when that creates incorrect localisation. A river can resolve the nearest point on a path or line. A waterfall can use a surface or several bounded clusters. A ward perimeter can use the nearest point on a boundary.

## 12.4 Source Motion

Moving sources update at a rate appropriate to their importance and speed. Doppler or pitch effects should be restrained and stylised; extreme simulation is not required for normal movement.

## 12.5 Source Teleportation

Portals, fast travel and LOD promotion may move sources abruptly. The runtime should crossfade, restart or preserve phase according to the event's movement policy rather than producing a sweeping pan through the world.

# 13. Anchors, Sockets, Regions, Paths and Runtime Contacts

## 13.1 23B Integration

All static spatial references use stable semantic IDs from 23B. Examples:

```text
socket.audio.mouth
socket.audio.gearbox
socket.audio.warning
region.audio.worksite
path.audio.river_edge
zone.audio.blacksmith_interior
portal.audio.blacksmith_front_door
```

## 13.2 Runtime Contact Points

Impacts, footsteps, projectile hits and fluid contacts use temporary runtime anchors containing position, surface normal, material and struck face or region.

## 13.3 Fallback Order

1. Exact requested anchor.
2. Variant or LOD remapping.
3. Declared semantic fallback.
4. Owner origin or nearest valid region.
5. Non-spatial local fallback for critical UI-like cues only.
6. Diagnostic and silence for non-critical invalid content.

## 13.4 Path Sources

Paths may expose:

- Nearest audible segment.
- Active flow intervals.
- Junction anchors.
- Direction of travel.
- Density or throughput.
- Virtualised phase.

## 13.5 Region Sampling

A region source may resolve one or more bounded emitters based on size and listener position. Sampling is deterministic where replay consistency matters.

## 13.6 Anchor Loss

Removing a protected warning or creature-mouth anchor is a compatibility change. Validation must catch missing mappings before bake.

# 14. Attenuation, Distance Curves and Audible Range

## 14.1 Attenuation Profile

A profile includes:

- Near-field distance.
- Reference distance.
- Maximum audible distance.
- Gain rolloff curve.
- Optional low-pass and high-frequency loss.
- Optional stereo spread change.
- Priority modifier by distance.
- Culling and virtualisation thresholds.
- Indoor/outdoor adjustments.

## 14.2 Distance Classes

| Class | Examples |
|---|---|
| Interface-Local | Inventory, direct interaction confirmation. |
| Very Near | Cloth, hand tools, small item contacts. |
| Near | Footsteps, melee, small machines. |
| Medium | NPC work, furnaces, creatures, doors. |
| Long | Bells, horns, large waterfalls, boss calls. |
| Landmark | Major portal, siege event, world-scale ritual. |

## 14.3 Curve Principles

- The source remains stable at very close range.
- Distance loss should feel natural but preserve identity.
- High-frequency detail may reduce before complete silence.
- Important threats may retain a distinct protected component at distance.
- Decorative ambience may transition into a bed rather than remain a point source.
- Maximum range must be bounded and testable.

## 14.4 Scale and Source Size

Larger sources can have broader near fields. A machine hall cluster should not sound like a pin-sized point at its centre. Extended-source geometry and cluster spread handle this before simply increasing volume.

## 14.5 Distance Crossfades

Events may provide near, mid and far representations. Crossfades should avoid duplicate transients and maintain loop phase where possible.

# 15. Directionality, Orientation and Cone Behaviour

## 15.1 Directional Sources

Directional sources include:

- Creature mouths and roars.
- Horns and bells with openings.
- Machine exhausts.
- Speaker-like magical runes.
- Waterfalls and vents.
- Portals with front and back sides.

## 15.2 Cone Model

A directional profile may define:

- Inner cone.
- Outer cone.
- Rear gain.
- Rear filter.
- Transition curve.
- Orientation anchor.
- Whether direction affects reverb send.

## 15.3 Readability Rules

Directionality should reinforce form, not hide critical information. A raid horn may be quieter behind the source but must remain discoverable within its gameplay range.

## 15.4 Surface and Path Direction

A surface source uses its normal. A path can use local tangent or flow direction. Runtime contact uses the surface normal and source velocity.

## 15.5 Mirroring and Variants

Mirrored models inherit semantic orientation from anchor mappings rather than manually reversing curves in each Sound Event.

# 16. Obstruction, Occlusion, Shielding and Line of Sound

## 16.1 Definitions

| Term | Meaning |
|---|---|
| Obstruction | A partial object or surface lies between source and listener but does not fully separate acoustic spaces. |
| Occlusion | The source and listener are substantially separated by solid material or different zones. |
| Shielding | A listener or source is protected by directional cover, equipment or a bounded barrier. |
| Transmission | A reduced portion of sound passes through a material or structure. |
| Diffraction Approximation | Sound remains partly audible around openings or edges through a bounded simplified rule. |

## 16.2 Evaluation Strategy

The runtime should not raycast every voice every frame. It should use a tiered strategy:

1. Zone and portal relationship for sources assigned to Acoustic Zones.
2. Cached obstruction results for important moving sources.
3. Low-frequency line tests for selected near or critical voices.
4. Simplified distance-only behaviour for decorative or virtualised voices.
5. No test for non-spatial interface audio.

## 16.3 Occlusion Response

An Occlusion Profile may control:

- Gain reduction.
- Low-pass amount.
- High-frequency damping.
- Reverb-send increase or reduction.
- Transient preservation.
- Update rate.
- Attack and release smoothing.
- Maximum obstruction count.
- Whether a critical component remains unfiltered.

## 16.4 Material Transmission

Thin timber, cloth, glass, stone, metal and magical barriers have different transmission classes. Runtime evaluation uses the dominant separating material or portal state, not an expensive exact wave solution.

## 16.5 Door and Wall Behaviour

A closed timber door between two zones should reduce and filter sound but not make the adjacent room silent. A thick stone wall without openings should produce stronger attenuation. Damage, holes and open windows modify portal area or zone connection.

## 16.6 Threat Protection

Important incoming threats may retain a protected low-band or caption indicator when fully occluded, provided the gameplay design intends awareness. The audio system cannot reveal hidden enemies beyond approved perception rules.

## 16.7 Smoothing

Occlusion must transition smoothly when a listener crosses a doorway, moves behind a pillar or rapidly changes camera position. Hard filter jumps are validation warnings unless deliberately stylised.

# 17. Acoustic Voxel Spaces and Generated Zone Graphs

## 17.1 Acoustic Zone Purpose

An Acoustic Zone is a bounded runtime summary of a space. It describes how sounds within or across that space are coloured, reverberated and transmitted. It is not a second collision mesh and does not replace the voxel structure.

## 17.2 Zone Sources

Zones may be:

- Authored directly in Blueprint Forge.
- Generated from enclosed voxel volumes.
- Generated from cave regions.
- Attached to structure templates.
- Created dynamically for temporary magical fields.
- Simplified from large open settlements into subzones.

## 17.3 Generated Analysis Inputs

The Forge may analyse:

- Approximate enclosed volume.
- Surface area.
- Dominant exposed material families.
- Ceiling height.
- Shape complexity.
- Opening count and area.
- Furnishing or foliage density tags.
- Water presence.
- Magic or corruption overlays.
- Connection to exterior.

## 17.4 Generated Acoustic Properties

| Property | Use |
|---|---|
| Enclosure | Influences wetness, leakage and exterior bleed. |
| Size Class | Selects small, medium, large or cavernous response. |
| Reflection Class | Influences brightness and early reflections. |
| Damping | Influences decay and high-frequency loss. |
| Diffusion | Influences smooth versus distinct reflection character. |
| Reverb Profile | Base environmental effect selection. |
| Exterior Bleed | Amount of world ambience entering the zone. |
| Interior Bleed | Amount of zone activity heard outside. |
| Noise Floor | Optional stable bed such as furnace room or cave wind. |
| Magic Overlay | Optional mana, void, warded or dream-space treatment. |

## 17.5 Zone Graph

```text
Exterior Forest
├── portal: cottage_front_door
│   └── Cottage Main Room
│       ├── portal: interior_arch
│       │   └── Cottage Back Room
│       └── portal: chimney
│           └── Exterior Above Roof
└── portal: mine_entrance
    └── Mine Entry
        └── portal: narrow_tunnel
            └── Crystal Cave
```

The graph allows the runtime to estimate path cost, leakage and transition without tracing through every block.

## 17.6 Zone Promotion and Demotion

Nearby active structures use full zone relationships. Distant or unloaded structures reduce to a summary ambience source. Promotion reconstructs active loops and local emitters from state without replaying false starts.

## 17.7 Dynamic Voxel Edits

Player building and destruction can change enclosure. The system should not rebuild every zone after every block edit. Instead:

- Minor edits mark a zone dirty.
- Threshold changes schedule bounded recomputation.
- Doors and windows update through portal state immediately.
- Major breaches may split, merge or invalidate zones.
- Temporary fallback uses the last valid zone plus an openness modifier.

## 17.8 Author Override

Generated results are suggestions. Creators can split, merge, rename, reshape or override properties, but validation should show divergence from current geometry.

# 18. Sound Portals, Openings, Leakage and Transitions

## 18.1 Sound Portal Definition

A Sound Portal connects two Acoustic Zones or a zone and the exterior. It represents an opening through which sound and ambience can travel.

## 18.2 Portal Types

- Door.
- Window.
- Archway.
- Tunnel mouth.
- Cave opening.
- Vent.
- Chimney.
- Drain.
- Broken wall.
- Magical portal.
- Ward opening.
- Water boundary.

## 18.3 Portal State

A portal may expose:

- Open fraction.
- Blocked state.
- Cover material.
- Damage state.
- Seal or ward strength.
- One-way or directional behaviour.
- Area and orientation.
- Transmission profile.
- Active magic state.

## 18.4 Leakage Calculation

The runtime may combine:

```text
Portal Area
x Open Fraction
x Material Transmission
x Zone Difference
x Distance Through Graph
x Source Priority
= Leakage Amount and Filtering
```

This is a bounded approximation. It should be stable and predictable rather than physically exact.

## 18.5 Door Transitions

Opening a door should affect:

- Interior ambience bleed.
- Exterior weather bleed.
- Source audibility across zones.
- Reverb balance near the threshold.
- Occlusion smoothing.

The door's own movement and latch Sound Events remain authored in 23F.

## 18.6 Portal Chains

Sound passing through several portals accumulates cost. The runtime caps path search depth and ignores negligible paths. Critical nearby sources may receive a higher-quality evaluation tier.

## 18.7 Magical Portals

A magical portal can connect distant spaces or dimensions. It may transmit selected source classes, apply a stylised filter, or use a paired emitter instead of simulating direct geometric propagation. Gameplay owns whether the portal is active and what information may pass through it.

# 19. Reverb, Reflection, Diffusion and Environment Sends

## 19.1 Environmental Treatment Philosophy

Reverb should establish place and scale without washing out material detail or threat cues. Leyforge's stylised world benefits from clear authored character rather than extreme realism.

## 19.2 Reverb Components

- Early-reflection impression.
- Decay time.
- High-frequency damping.
- Low-frequency persistence.
- Predelay.
- Diffusion.
- Wet/dry range.
- Optional modulation for magic spaces.
- Transition time.

## 19.3 Profile Families

Initial profile families:

- Exterior open.
- Exterior forest.
- Exterior mountain or ravine.
- Small timber room.
- Small stone room.
- Medium mixed-material hall.
- Large stone hall.
- Workshop or machine room.
- Mine tunnel.
- Small cave.
- Large cavern.
- Underwater.
- Ward chamber.
- Portal chamber.
- Corrupted or void space.

## 19.4 Source Sends

Sound Events declare send intent, such as dry contact, ordinary world source, ambience bed, creature call or major landmark. The zone and mix system decides final send amount.

## 19.5 Threshold Blending

At a doorway, the listener may hear a blend of interior and exterior responses. The system uses listener position, portal proximity and dominant zone rather than abrupt binary switching.

## 19.6 Reflection Restraint

Rapid footsteps, machine transients and combat impacts can become muddy if every hit produces a long tail. Profiles should shorten or reduce dense repeated material while preserving occasional large events.

## 19.7 Magical Acoustic Overlays

Mana-rich, warded, dream, void or corrupted spaces may add a bounded overlay such as subtle modulation, spectral tilt or delayed tonal response. The base physical space remains audible unless the dimension's rules explicitly override it.

# 20. Ambience Architecture and Component Model

## 20.1 Ambience Plan

An Ambience Plan is a data-driven composition of world audio components. It does not contain one giant loop for an entire biome.

## 20.2 Component Types

| Component | Purpose |
|---|---|
| Base Bed | Continuous low-detail identity such as forest air or cave tone. |
| Local Emitter | Positioned source such as river, campfire, insect nest or machine hall. |
| Intermittent Detail | Occasional bird, branch, distant creature, tool strike or magical pulse. |
| Weather Layer | Rain, wind, thunder, hail, snow or magical weather. |
| Surface Contact Layer | Weather or debris contacting roofs, foliage, water, armour or ground. |
| Civilisation Layer | NPC work, crowd murmur, carts, bells, animals and trade activity. |
| Threat Layer | Raid pressure, corruption, nearby nest or danger-state ambience. |
| Magic Layer | Leyline, ward, ritual, portal or dimension identity. |
| Transition Layer | Biome boundary, day/night change, weather onset or zone entry. |
| Event Stinger | Short world-state response such as ward breach or village celebration. |

## 20.3 Ambience State Inputs

- Biome and sub-biome.
- Region and culture.
- Time of day.
- Season.
- Weather and intensity.
- Temperature and wind.
- Nearby water.
- Settlement size and activity.
- Danger and raid state.
- Corruption, blessing and mana density.
- Structure or zone occupancy.
- Player shelter and exposure.

## 20.4 Ambience Density

Ambience Plans declare density budgets. Intermittent details use cooldowns, probability, spatial separation and repeat avoidance. Silence and low activity are valid outcomes.

## 20.5 Local Versus Non-Local Components

A forest bed may be listener-relative and non-localised. A river remains world-positioned. Distant animal calls may be selected around the listener from valid habitat regions without representing a persistent creature unless gameplay provides one.

## 20.6 State Composition

Ambience uses channels:

```text
Base Biome
+ Time and Season
+ Weather
+ Civilisation
+ Magic
+ Threat
+ Local Structure
+ Temporary Event
```

Each channel has priority and blend rules. A raid does not delete the forest; it changes density and adds threat layers while reducing decorative details.

# 21. Biome, Weather, Time and Seasonal Ambience

## 21.1 Biome Identity

Each major biome should define:

- Base bed family.
- Common local emitters.
- Intermittent ecology details.
- Wind behaviour.
- Water behaviour.
- Day and night variants.
- Seasonal variants.
- Danger overlays.
- Magic or leyline overlays.
- Maximum density and fallback.

## 21.2 Example Biomes

| Biome | Audio Identity |
|---|---|
| Temperate Forest | Layered leaves, birds, insects, distant wildlife, variable wind and streams. |
| Meadow | Open wind, grass movement, insects, livestock or distant settlement activity. |
| Swamp | Wet ground, insects, bubbles, frogs, dense low vegetation and hidden movement. |
| Mountain | Broad wind, rock movement, ravine echoes and sparse distant calls. |
| Snowfield | Wind, soft movement, snow contact, reduced high-frequency ecology and ice stress. |
| Corrupted Region | Reduced natural detail, unstable pulses, altered creature calls and material creaks. |
| Mana-Rich Grove | Natural forest plus sparse motes, crystal tones and leyline movement. |

## 21.3 Weather Layers

Weather uses separate components for:

- Air movement.
- Falling precipitation.
- Surface contacts.
- Distant thunder or magical events.
- Shelter bleed.
- Clothing or armour contact.
- Water accumulation.

## 21.4 Rain Exposure

The listener's exposure value blends:

- Open rain bed.
- Nearby roof or foliage contact.
- Interior leakage.
- Door and window portal transmission.
- Player-body contact.
- Water and puddle response.

## 21.5 Wind

Wind may respond to:

- Biome.
- Altitude.
- Weather intensity.
- Shelter.
- Foliage density.
- Openings and tunnels.
- Structure creak families.
- Mana or corruption storms.

## 21.6 Day and Night

Transitions should be gradual. Ecology details, NPC activity, danger layers and settlement bells may change through scheduled state rather than crossfading between two enormous loops.

## 21.7 Seasons

Seasonal changes affect wildlife density, wind, snow, rain, water, foliage and settlement activity. Seasonal identity should be audible but not require an entirely separate library for every biome.

# 22. Village, Structure, Dungeon and Factory Ambience

## 22.1 Settlement Ambience

Village ambience derives from real simulation state:

- Population band.
- Active jobs.
- Open shops.
- Construction projects.
- Animals and carts.
- Machine count and activity.
- Bells, wards and alarms.
- Morale and event state.
- Damage and repair.

## 22.2 Activity Clusters

Instead of one voice per NPC, the system may form clusters:

- Market crowd.
- Blacksmith worksite.
- Construction site.
- Farm activity.
- Guard training.
- Tavern interior.
- Warehouse handling.

Important named NPC actions near the player can remain individual.

## 22.3 Structure Templates

Structures may provide an ambience template with:

- Interior bed.
- Exterior signature emitters.
- Zone and portal expectations.
- Job or machine cluster sockets.
- State overlays.
- Damage and abandonment variants.
- Culture variants.

## 22.4 Dungeons and Ruins

Dungeon ambience should communicate space, occupancy and danger through:

- Air and structural beds.
- Water or machinery.
- Creature habitat details.
- Trap or magical infrastructure cues.
- Occupied, dormant, corrupted or cleansed states.
- Zone-specific reverb and leakage.

## 22.5 Factories and Machine Halls

Machine-hall ambience uses cluster profiles and bus management. It preserves:

- Nearby machine identity.
- Interaction confirmation.
- Fault and overload warnings.
- Moving logistics.
- Room resonance.

It suppresses or merges redundant identical loops.

## 22.6 Abandoned and Damaged States

An abandoned structure reduces civilisation activity and may add wind, loose materials, drips, vermin or corruption. A damaged settlement may add repair work, alarms, fire, rubble and quiet gaps where normal activity ceased.

## 22.7 Culture Identity

Culture variants may change bells, work rhythms, instruments used as signals, machine construction, magical tones and crowd texture while inheriting common state and priority contracts.

# 23. Fluids, Wind and Environmental Contact Systems

## 23.1 Water Sources

Water can be represented by:

- River path source.
- Waterfall surface source.
- Shoreline line source.
- Drip emitter set.
- Pipe or channel path.
- Rain accumulation area.
- Underwater listener bed.

## 23.2 Flow Parameters

Flow audio may respond to:

- Speed.
- Volume class.
- Turbulence.
- Drop height.
- Surface material.
- Enclosure.
- Obstruction.
- Magic or contamination state.

## 23.3 Waterfalls

Large waterfalls use extended geometry and distance representations. Near layers include impact and spray; far layers preserve broad noise and landmark identity with lower detail.

## 23.4 Drips

Drips are intermittent details driven by valid surfaces, moisture and zone density. They should not spawn independently from every wet voxel.

## 23.5 Lava and Hazardous Fluids

Lava, acid, corruption pools and magical fluids use separate families with clear danger identity. The audio system communicates hazard state but does not apply damage.

## 23.6 Weather Contact Matrix

Weather contact may resolve:

```text
Weather Type
x Surface Material
x Exposure
x Intensity
x Source Shape
= Contact Layer
```

Examples include rain on timber roof, stone roof, leaves, water, metal armour and tent cloth.

## 23.7 Environmental Debris

Wind-blown leaves, sand, ash, snow and loose objects may contribute intermittent contact. Density is budgeted at region level rather than per particle.

# 24. Bus Hierarchy, Routing and User Controls

## 24.1 Locked Bus Hierarchy

```text
Master
├── UI
├── Player
│   ├── Player Movement
│   ├── Player Equipment
│   └── Player Status
├── Combat
│   ├── Local Combat
│   ├── Remote Combat
│   └── Threat Telegraphs
├── Creatures
│   ├── Voices
│   ├── Body and Movement
│   └── Bosses
├── NPC Activity
│   ├── Individual NPC
│   ├── Crowd
│   └── Worksites
├── Machines
│   ├── Mechanical
│   ├── Processing
│   ├── Logistics
│   └── Warnings
├── Magic
│   ├── Spells
│   ├── Mana Infrastructure
│   ├── Wards and Rituals
│   └── Portals and Corruption
├── Environment
│   ├── Biome Beds
│   ├── Local Emitters
│   ├── Fluids
│   └── Structures
├── Weather
├── Dialogue - Reserved
└── Music - Reserved
```

## 24.2 Bus Rules

- Sound Events route through stable approved buses.
- Content packs may add child buses only under allowed extension points.
- Critical warning buses cannot be rerouted into decorative ambience.
- User sliders operate on understandable categories.
- Reverb and environment effects use sends or dedicated effect buses.
- Local one-off gain hacks are validation warnings.

## 24.3 User Controls

Recommended controls:

- Master volume.
- UI.
- Dialogue, reserved.
- Music, reserved.
- Combat and threats.
- Creatures.
- Machines and automation.
- Magic.
- Environment and weather.
- NPC and settlement activity.
- Dynamic range mode.
- Reduced high-frequency effects.
- Critical cue emphasis.
- Captions and directional audio indicators.

## 24.4 User-Control Safety

If a user mutes a category containing a critical cue, the game should provide the declared visual, caption or haptic equivalent. It must not secretly override the user's volume setting.

## 24.5 Routing Inheritance

Audio Families provide defaults. Sound Events can request approved overrides. Global mix policy remains authoritative.

# 25. Mix Snapshots, State Transitions and Ducking

## 25.1 Mix Snapshot

A snapshot is a coordinated set of temporary bus, effect and priority changes triggered by validated state.

## 25.2 Initial Snapshots

| Snapshot | Purpose |
|---|---|
| Exploration | Balanced default world mix. |
| Combat | Emphasise local combat and threats; reduce decorative ambience modestly. |
| Raid | Preserve horns, alarms, enemy telegraphs and village defence. |
| Dialogue Focus | Reserved for future dialogue; lower selected world categories without silencing danger. |
| Underwater | Filter world sources, add underwater bed and preserve critical indicators. |
| Indoor Small | Increase interior response and reduce exterior bed according to portals. |
| Cave | Apply cave acoustics and ecology balance. |
| Machine Hall | Cluster machines and preserve warnings and interactions. |
| Portal Transition | Manage major portal activation and travel. |
| Low Health | Optional comfort-aware emphasis for player status. |
| Peaceful Celebration | Increase village event and culture layers while preserving user controls. |

## 25.3 Snapshot Ownership

Snapshots use explicit owners and priorities. A cave snapshot, raid snapshot and low-health snapshot may combine through declared channels rather than replacing one another unpredictably.

## 25.4 Ducking

Ducking may be used for:

- Dialogue focus.
- Critical warning.
- Major boss telegraph.
- Player interaction confirmation in dense machinery.
- Cinematic event where gameplay permits.

Ducking should be modest, smoothed and frequency-aware. It is not a substitute for good arrangement or voice limits.

## 25.5 Transition Curves

Snapshots define attack, hold and release. Rapid state changes use hysteresis to avoid pumping.

## 25.6 Critical Cue Emphasis

Critical cue emphasis may combine:

- Priority protection.
- Temporary narrow ducking of competing bands.
- Dedicated caption.
- Direction indicator.
- Haptic reference.
- Distinct rhythmic pattern.

## 25.7 Failure States

If snapshot resources are missing, the system uses the base mix and logs a diagnostic rather than blocking sound playback.

# 26. Loudness, Dynamic Range, Frequency and Mastering Intent

## 26.1 Loudness Philosophy

Leyforge should feel powerful without relying on constant maximum loudness. Material weight, transient shape, spatial scale and arrangement are preferred over simple gain increases.

## 26.2 Relative Hierarchy

A first-pass hierarchy:

1. Accessibility-critical and immediate danger cues.
2. Local player action confirmation and incoming combat.
3. Important nearby creatures, NPC speech placeholders and machine warnings.
4. Nearby world interactions and ordinary machines.
5. Local ambience details.
6. Distant or decorative sources.

## 26.3 Dynamic Range Modes

Recommended modes:

- Wide: greater contrast for quiet environments and powerful events.
- Standard: balanced default.
- Reduced: narrower range for late-night or small-speaker play.
- Accessibility Focus: emphasises critical cues and reduces masking.

## 26.4 Frequency Management

Dense categories should occupy complementary ranges. Machine hums, rain, magic tones and creature calls must not all compete in the same band. Runtime EQ or filtering should remain restrained and profile-driven.

## 26.5 Headroom

Buses and snapshots require reserved headroom for raids, bosses and layered weather. Validation should detect mixes that clip or depend on limiting every moment.

## 26.6 Platform Values

Exact target loudness, limiter ceiling, codec and certification standards are deferred to technical and platform planning. The Forge should expose metering and relative consistency now.

## 26.7 Listening Conditions

Review should include:

- Headphones.
- Stereo speakers.
- Small laptop or handheld speakers.
- Low-volume playback.
- Noisy-room simulation.
- Reduced dynamic range.
- Split-screen dense scenes.

# 27. Voice Manager, Concurrency, Priority and Stealing

## 27.1 Voice Ownership

Every active voice has:

- Owning Sound Event or ambience component.
- Source and spatial profile.
- Bus.
- Priority class.
- Concurrency group.
- Lifecycle state.
- Virtualisation state.
- Estimated cost.
- Listener relevance.

## 27.2 Concurrency Scopes

- Per source.
- Per entity.
- Per material action.
- Per worksite.
- Per machine family.
- Per cluster.
- Per zone.
- Per listener.
- Global category.

## 27.3 Priority Classes

| Class | Examples |
|---|---|
| Critical | Ward breach, raid horn, lethal telegraph, machine overload. |
| Player Immediate | Local attack, parry, tool contact, interaction confirmation. |
| Threat | Nearby hostile voice, projectile pass, boss phase cue. |
| Important World | Bell, portal, structure collapse, quest-relevant sound. |
| Standard World | Footsteps, machines, doors, ordinary NPC work. |
| Ambient Detail | Birds, drips, distant hammer, decorative magic motes. |
| Disposable | Very distant or redundant texture. |

## 27.4 Voice Stealing Order

When the budget is exceeded:

1. Cull inaudible or invalid voices.
2. Virtualise phase-preserving loops.
3. Merge eligible clusters.
4. Remove disposable voices.
5. Remove distant ambient details.
6. Reduce standard-world duplicates.
7. Preserve threat, player and critical classes.
8. If still over budget, use critical-cue-only fallbacks and report the scene.

## 27.5 Transient Protection

Short important transients should not be stolen immediately by a long low-priority loop. The manager considers age, attack phase and semantic importance.

## 27.6 Voice Admission

A new voice may be rejected, virtualised or routed to a cluster before playback. Admission decisions should be visible in diagnostics.

## 27.7 Per-Hardware Budgets

Budgets scale by quality tier and platform. Content authors target named budget profiles rather than embedding hardware numbers in each event.

# 28. Aggregation, Clustering, Virtualisation and Audio LOD

## 28.1 Aggregation Purpose

Aggregation represents many similar sources through fewer voices while preserving location, density and state.

## 28.2 Cluster Examples

- Furnaces in a workshop.
- Conveyor or chute network.
- Crowd in a market.
- Builders at one construction project.
- Livestock pen.
- Rain on a large roof.
- Insects in a biome patch.
- Mana conduits in one network.

## 28.3 Cluster Inputs

A cluster may consider:

- Source family.
- Spatial proximity.
- Zone.
- Shared state.
- Phase or rhythm compatibility.
- Listener distance.
- Priority.
- Ownership and permissions where relevant.

## 28.4 Cluster Output

The result may include:

- One centroid source.
- Several spatial representatives.
- Density parameter.
- Activity parameter.
- Spread or size.
- Occasional individual details.
- Warning exceptions.

## 28.5 Virtualisation

A virtualised managed event retains enough state to resume:

- Loop phase.
- Lifecycle stage.
- Parameter values.
- Owner.
- Start time or simulation time.
- Cluster membership.

It consumes little or no audible voice budget.

## 28.6 Audio LOD Chain

```text
Full Individual
-> Reduced Individual
-> Clustered
-> Ambience Summary
-> Virtual State Only
-> Hidden
```

Critical events may use a separate chain ending in a protected cue rather than Hidden.

## 28.7 Distant Settlements

A distant simulated village may emit one regional ambience summary only when relevant to the listener or map view. It does not instantiate every resident and machine.

## 28.8 Promotion

Approaching a cluster promotes nearby important sources gradually. Phase and state continuity prevent a wall of loops from starting simultaneously.

## 28.9 Debugging

The Forge should visualise cluster membership, promoted sources, virtual voices, rejected voices and estimated saved cost.

# 29. Listener Model, Camera Perspective and Split-Screen

## 29.1 Primary Listener

Normal solo play uses one primary listener associated with the active local player and camera policy. First-person and third-person views may use different near-field offsets but share one world position model.

## 29.2 Listener Inputs

- Position and orientation.
- Velocity.
- Camera mode.
- Player body position.
- Current Acoustic Zone.
- Exposure and underwater state.
- Accessibility profile.
- User mix settings.
- Split-screen identity.

## 29.3 Camera Versus Body

For ordinary gameplay, localisation should follow the camera enough to feel intuitive while avoiding impossible separation from the player body. Very distant spectator or photo cameras require an explicit policy.

## 29.4 First-Person Near Field

Local equipment, breathing, footsteps and held tools may use near-field treatment to avoid unstable panning. World contacts still resolve at their physical positions.

## 29.5 Split-Screen

Multiple local players cannot simply multiply every audible voice. Supported policies may include:

- One shared mixed listener at a calculated position.
- Priority to the active or focused player.
- Dual-listener rendering for critical local cues with shared world ambience.
- Per-player near-field/UI audio combined with one bounded world mix.

The final policy may vary by platform and player count but must be testable and predictable.

## 29.6 Local Player Separation

Player-local cues such as inventory, low health and interaction confirmation remain associated with the correct local player, including controller and caption routing.

## 29.7 Special Cameras

Map, cinematic, possession and remote-view cameras declare whether they move the listener, create a secondary listener or preserve the player listener.

# 30. Multiplayer Authority, Prediction and Local Variation

## 30.1 Authority

The authoritative simulation confirms gameplay-relevant events and state. Clients resolve audio presentation through approved context and local spatial conditions.

## 30.2 Predicted Audio

Local responsive actions may predict:

- Player attack swing.
- Footstep.
- Tool contact timing.
- Local interaction.

Confirmed impacts, damage, machine output and world-state changes use authoritative confirmation. Reconciliation should prevent duplicate playback.

## 30.3 Local Acoustics

Acoustic Zones, portals, listener position and user mix are local presentation concerns derived from replicated world state. The server does not need to stream final gain and filter values for every voice.

## 30.4 Decorative Variation

Bird calls, distant ambience details and cluster texture may vary locally. Critical warnings, sequence timing and replay-relevant selections use deterministic seeds where required.

## 30.5 Network Payload

A compact presentation payload may include:

- Event contract ID.
- Source entity or runtime position.
- Context subset.
- Lifecycle command.
- Seed.
- Authority sequence.
- Persistent owner ID for managed loops.

## 30.6 Late Joining

A late-joining client reconstructs managed loops, ambience states, zones and snapshots from current authoritative state. It does not replay historical one-shots.

## 30.7 Ownership and Privacy

Voice chat is outside this document. User-generated microphone audio must not route through world ambience or Sound Forge content systems.

# 31. Accessibility, Captions, Sensory Equivalence and Comfort

## 31.1 Critical Meaning

Critical cues include:

- Incoming high-damage attacks.
- Raid horns and village alarms.
- Ward breach.
- Machine overload or dangerous fault.
- Portal instability.
- Player low-health or status warning.
- Important quest or interaction confirmation where no other channel exists.

## 31.2 Caption Data

Captions may include:

- Localised label.
- Source category.
- Direction or relative position.
- Distance band.
- Criticality.
- Repeat suppression policy.
- Optional icon.
- Whether off-screen display is allowed.

Examples:

```text
[Heavy footsteps approaching from behind]
[Village alarm bell - east]
[Ward cracking nearby]
[Furnace output blocked]
```

## 31.3 Sensory Equivalence

| Audio Meaning | Alternative |
|---|---|
| Directional threat | Screen-edge indicator, caption direction and haptic pattern. |
| Machine warning | Flashing machine state, UI warning and caption. |
| Material contact | VFX debris, animation response or controller feedback. |
| Portal charge | Voxel pulses, light progression and optional haptic buildup. |
| Rain shelter transition | Visible exposure indicator and environmental VFX. |
| Quiet creature cue | Ground disturbance, directional indicator or accessibility reveal allowed by gameplay. |

## 31.4 Frequency Comfort

Options may include:

- Reduced high-frequency magic.
- Reduced tinnitus-like ringing.
- Reduced repetitive warning sharpness.
- Alternative low-frequency critical cue.
- Limited dynamic range.
- Reduced bass impact.
- Machine-hum reduction.

## 31.5 Spatial Accessibility

Players who cannot localise stereo or surround audio can enable stronger directional captions, minimap indicators or simplified left/right/front/back labels.

## 31.6 User Control Respect

The system never secretly raises muted categories. It activates approved alternatives.

## 31.7 Caption Restraint

Ambient captions are optional and density-limited. Critical labels take priority over decorative birds, wind and crowds.

# 32. Persistence, Save Boundaries, Reconstruction and Replay

## 32.1 Persistent Audio-Relevant State

The save may retain or reconstruct from existing systems:

- Machine lifecycle state and process phase.
- Portal and ward state.
- Weather, time and season.
- Structure damage and door/window state.
- Acoustic zone revisions where generated data is cached.
- Persistent ambience state such as corruption or celebration.
- Managed ritual or world event state.

## 32.2 Non-Persistent Audio State

Do not save:

- Ordinary one-shot voice instances.
- Exact decorative ambience selections.
- Temporary reverb tails.
- Short footstep history.
- Rejected or stolen voices.
- Local user mix state inside the world save.

## 32.3 Load Reconstruction

On load:

1. Restore world and entity state.
2. Resolve current zones and portals.
3. Rebuild ambience controllers.
4. Recreate managed loops at current phase where appropriate.
5. Apply active snapshots.
6. Do not replay start events unless the state actually transitions.

## 32.4 Zone Cache

Generated zone graphs may be cached with structure revision and checksum. Changed geometry invalidates affected zones and schedules rebuild.

## 32.5 Replay

Runtime capture records:

- Event selection.
- Material rule chosen.
- Spatial profile.
- Zone and portal path.
- Bus and snapshot state.
- Voice admission, cluster or virtualisation decision.

Replay can reproduce deterministic decisions while allowing local output-device differences.

## 32.6 Migration

Renamed buses, material profiles, portals and snapshots require aliases or migration rules. Protected critical cues cannot silently lose routing or alternatives.

# 33. Creator Workflow, Preview and Test Laboratory

## 33.1 Standard Workflow

1. Select or create Material Audio Profiles.
2. Define contact actions and response rules.
3. Assign spatial profiles to Sound Events or families.
4. Analyse or author Acoustic Zones and Sound Portals.
5. Compose ambience plans.
6. Route categories through approved buses.
7. Define snapshots, ducking and concurrency.
8. Test listeners, distance, occlusion and transitions.
9. Run dense-scene budget simulation.
10. Validate accessibility and captions.
11. Review with multiple playback conditions.
12. Approve and bake runtime products.

## 33.2 Material Audition Grid

The editor should allow rapid playback of one action across many targets and intensities. It should display the exact fallback rule and Sound Event used.

## 33.3 Spatial Preview

Preview tools include:

- Move listener around source.
- Draw attenuation range.
- Display source shape and direction cone.
- Toggle obstruction materials.
- Preview near/mid/far representations.
- Inspect current gain, filter and priority.

## 33.4 Acoustic Zone Preview

The viewport should show:

- Zone boundaries.
- Dominant material summary.
- Portals and open fraction.
- Calculated path to listener.
- Reverb and leakage values.
- Dirty or invalid geometry.
- Generated versus overridden properties.

## 33.5 Ambience Composer

Creators can audition:

- Time and season.
- Weather intensity.
- Settlement activity.
- Danger state.
- Magic and corruption.
- Shelter and exposure.
- Density and repeat statistics.

## 33.6 Mix Test Scenes

Required scenes:

- Open forest.
- Cottage with opening door and window.
- Mine tunnel into crystal cave.
- Blacksmith workshop.
- Dense machine hall.
- Village market.
- Heavy rain and thunder.
- Goblin raid.
- Ward and mana network.
- Split-screen players in different spaces.

## 33.7 Runtime Capture and Replay

A trace can be loaded into the Forge to repeat a furnace blockage, rain transition, raid or portal event while adjusting mix and acoustics.

## 33.8 A/B Review

Compare:

- Two attenuation profiles.
- Generated versus authored zone.
- Full versus clustered machine scene.
- Standard versus reduced dynamic range.
- Default versus accessibility mix.
- Door open versus closed.

# 34. Validation, Diagnostics, Review and Quality Assurance

## 34.1 Validation Categories

- Stable ID and registry integrity.
- Material matrix coverage and ambiguity.
- Missing fallback.
- Invalid spatial reference.
- Unsafe attenuation or unlimited range.
- Excessive occlusion test rate.
- Broken or cyclic zone graph.
- Portal without valid connected zones.
- Unbounded ambience density.
- Missing bus or snapshot.
- Concurrency and voice-budget failure.
- Loudness inconsistency or clipping risk.
- Missing critical caption or alternative.
- Split-screen incompatibility.
- Migration or alias failure.

## 34.2 Severity

| Severity | Meaning |
|---|---|
| Info | Suggestion or production note. |
| Warning | Content may ship only with explicit review. |
| Error | Resource cannot be approved or baked. |
| Blocker | Project release or protected system is unsafe. |

## 34.3 Runtime Diagnostics

The audio debug overlay should expose:

- Active and virtual voices.
- Bus meters.
- Snapshot stack.
- Listener zone.
- Source zone and portal path.
- Material rule selection.
- Attenuation and occlusion values.
- Cluster membership.
- Rejected or stolen voices.
- Caption and alternative dispatch.
- Estimated CPU, memory and streaming cost.

## 34.4 Automated Tests

- Matrix coverage tests.
- Deterministic fallback tests.
- Door open/closed leakage tests.
- Zone graph connectivity tests.
- Snapshot transition tests.
- Voice-budget stress tests.
- Critical-cue survival tests.
- Save/load managed-loop tests.
- Split-screen routing tests.
- Accessibility configuration tests.

## 34.5 Listening Review

Automated analysis cannot approve the final mix. Human review checks:

- Material identity.
- Spatial plausibility.
- Room transition quality.
- Ambience restraint.
- Threat readability.
- Fatigue and repetition.
- Culture and magic identity.
- Comfort and accessibility.

## 34.6 Regression

Approved benchmark traces and rendered audio captures should be retained for comparison when buses, zones, profiles or runtime code change.

# 35. Summer Engine-Assisted Authoring and Automation Boundaries

## 35.1 Approved Assistance

Summer Engine may:

- Suggest material-family mappings from block and item metadata.
- Find uncovered response-matrix combinations.
- Suggest fallback families.
- Estimate attenuation from source type and scale.
- Detect likely room volumes and openings.
- Propose Acoustic Zone splits and Sound Portals.
- Identify inconsistent bus routing.
- Detect loudness outliers and masking.
- Generate test contexts and dense-scene scenarios.
- Suggest cluster policies from source density.
- Find missing captions and alternatives.
- Summarise runtime traces and regression differences.

## 35.2 Required Human Decisions

Humans approve:

- Material identity and exceptions.
- Final attenuation and spatial feel.
- Zone and portal correctness.
- Ambience taste and density.
- Snapshot and ducking strength.
- Critical priority.
- Accessibility quality.
- Production loudness and release readiness.

## 35.3 Prohibited Automation

Summer Engine may not:

- Invent gameplay events or perception rules.
- Mark rights or provenance as approved without evidence.
- Add hidden buses or uncontrolled gain boosts.
- Remove critical cues to satisfy budgets.
- Change authoritative machine, combat or AI state.
- Approve a final mix without human listening review.
- silently replace missing context with unrelated assets.

## 35.4 Explainable Suggestions

Every suggestion should state:

- Input evidence.
- Proposed change.
- Expected benefit.
- Risk.
- Affected resources.
- Whether the result changes runtime compatibility.

# 36. Minimum Viable 23G System and Initial Library

## 36.1 MVP Features

- Material Response Matrix with fallback preview.
- Core Material Audio Profiles.
- Point, oriented point, path, surface, region and volume sources.
- Reusable attenuation and occlusion profiles.
- Authored and generated Acoustic Zones.
- Door, window, cave entrance and magical Sound Portals.
- Exterior, timber-room, stone-room, mine and cave reverb profiles.
- Biome, weather, village and machine ambience plans.
- Locked bus hierarchy and user category controls.
- Exploration, combat, raid, indoor, cave and machine-hall snapshots.
- Concurrency, clustering and virtualisation.
- One primary listener plus two-player split-screen test policy.
- Captions and sensory equivalents for critical cues.
- Runtime capture, diagnostics and validation.

## 36.2 MVP Material Profiles

- Dirt.
- Mud.
- Grass and leaves.
- Sand and gravel.
- Common stone.
- Deepstone.
- Timber and plank.
- Cloth and leather.
- Copper.
- Iron and steel.
- Glass.
- Crystal and mana crystal.
- Water.
- Ice and snow.
- Flesh/creature-body comfort variants.
- Chitin.
- Corruption material.

## 36.3 MVP Spatial Profiles

| Profile | Intended Use |
|---|---|
| contact_tiny | Small item and debris contact. |
| contact_standard | Footstep, mining and ordinary impact. |
| player_nearfield | Local body and equipment. |
| creature_voice_medium | Goblin and common creature voice. |
| creature_call_long | Raid horn, boss call and landmark cry. |
| machine_small | Workbench and light mechanism. |
| machine_medium | Furnace and processing machine. |
| machine_warning | Protected directional warning. |
| water_path | River and channel. |
| waterfall_surface | Extended falling water. |
| ambience_local | Campfire, insects and worksite detail. |
| portal_major | Large portal and ritual structure. |

## 36.4 MVP Acoustic Content

- Forest exterior.
- Open meadow exterior.
- Small timber cottage.
- Small stone room.
- Blacksmith workshop.
- Mine tunnel.
- Crystal cave.
- Village street.
- Machine area.
- Warded area.

## 36.5 MVP Mix Content

- Complete stable bus hierarchy.
- Standard and reduced dynamic range.
- Critical cue emphasis option.
- Exploration, combat, raid, indoor, cave, underwater-lite, machine hall and portal snapshots.
- Footstep, machine, crowd, weather and creature concurrency groups.
- Furnace, worksite, market and rain-roof cluster profiles.

## 36.6 MVP Success Criteria

- Core contacts resolve correctly with visible fallback reasoning.
- Door and cave transitions sound stable and readable.
- Rain changes across open ground, timber roof, foliage and water.
- Ten or more furnaces remain readable without ten full independent loops.
- Ward breach and goblin horn survive the raid mix.
- Captions and alternatives remain correct when categories are muted.
- Save/load reconstructs active machine and ambience state without false start cues.
- Split-screen does not double the entire world mix.
- All content remains within named budget profiles.

# 37. Forest Hamlet Integrated Runtime Audio Scenario

## 37.1 Morning Exterior

The player begins near the forest hamlet. The listener is in the temperate-forest exterior zone. The ambience resolver combines:

- Forest day bed.
- Light wind.
- Nearby river path.
- Sparse birds and insects.
- Village activity at low-to-medium density.
- Distant blacksmith worksite cluster.

The mix remains open enough for footsteps, NPC greetings and creature cues.

## 37.2 Entering a Cottage

The player opens a timber door:

1. Door movement event plays at the hinge/latch sockets.
2. The portal open fraction rises.
3. Exterior forest and village bleed increase briefly through the opening.
4. The listener crosses into the small timber room zone.
5. Interior reverb and damping blend in.
6. Exterior rain or wind reduces according to the portal.
7. Closing the door smooths the leakage down without abrupt silence.

## 37.3 Mining Route

The player travels into a mine:

- Footsteps move from grass to dirt, gravel and stone.
- The mine entrance portal reduces forest ambience.
- Mine tunnel acoustics add short reflections and drips.
- Iron pickaxe contacts resolve against stone, iron ore and mana crystal.
- Damage stages change fracture layers.
- Cave spider movement remains spatially readable behind a bend without revealing it beyond approved perception.

## 37.4 Furnace Chain

At the village industry area:

- One nearby furnace uses its full spatial machine profile.
- Additional furnaces join a cluster with activity and density parameters.
- Chute and crate contacts use material responses at visible junctions.
- Entering the blacksmith workshop adds room response and machine-hall snapshot behaviour.
- The player's interaction confirmation remains clear.
- A blocked output raises the warning bus and modestly ducks redundant machine texture.

## 37.5 Mana Furnace and Ward

The mana furnace adds a restrained mana-core layer and conduit-path activity. The ward boundary uses an extended path source. Normal operation remains subtle. When ward strength falls:

- The instability layer increases.
- A protected warning cue appears.
- Caption and visual equivalent dispatch.
- On authoritative breach, the raid snapshot protects the breach cue and goblin horn.

## 37.6 Heavy Rain

A storm begins:

- Wind and open-rain beds rise.
- Rain contacts resolve on leaves, timber roof, stone path, water and player equipment.
- Inside the cottage, weather is heard through door, window and roof transmission.
- Thunder uses long-distance landmark treatment.
- Decorative birds and insects reduce.
- Machine warnings and hostile telegraphs retain priority.

## 37.7 Goblin Raid

During the raid:

- Village alarm and goblin horn use critical/threat priority.
- Crowd ambience shifts to fleeing and guard activity clusters.
- Local combat remains protected.
- Distant minor combat aggregates.
- Rain and machine beds reduce modestly but remain present.
- The watchtower bell or guard cue is spatially discoverable.
- Captions show direction for horn, alarm and ward breach.

## 37.8 Aftermath

After the raid:

- Snapshot releases gradually.
- Damage, fire, repair and mourning states alter settlement ambience.
- Destroyed machines stop their managed loops based on gameplay state.
- Repair worksites create clusters.
- The environment does not instantly return to the untouched morning mix.

## 37.9 Scenario Validation

The scenario passes when:

- Every transition is traceable through diagnostics.
- No critical cue is masked.
- Door and zone transitions are smooth.
- Material contacts remain distinct.
- Dense machines and NPCs stay within voice budgets.
- Rain does not overwhelm the mix.
- Split-screen test players receive correct local cues.
- Save/load reconstructs the current aftermath state.

# 38. Balancing and Authoring Rules

1. Material identity should come from family, transient, body and resonance before raw loudness.
2. Add pair-specific responses only when they create meaningful distinction.
3. Every material action requires a safe fallback.
4. Large sources use extended geometry or clustering instead of exaggerated centre-point volume.
5. Occlusion updates are importance-aware and smoothed.
6. Acoustic zones are bounded summaries, not exact wave simulations.
7. Doors, windows and cave mouths use Sound Portals rather than bespoke scripts.
8. Ambience is layered and state-driven; silence remains valid.
9. Decorative ambience yields before player, threat and critical cues.
10. Critical cues use priority, arrangement and alternatives rather than uncontrolled loudness.
11. Every continuous source has lifecycle, concurrency and virtualisation policy.
12. Dense machines, crowds, weather and ecology aggregate.
13. User mix controls are respected.
14. Captions describe meaning and direction, not asset filenames.
15. Split-screen and multiple listeners require explicit budgets.
16. Reverb supports place but must not destroy action readability.
17. Runtime EQ and ducking remain modest and profile-driven.
18. Save games store world state, not ordinary voice instances.
19. Generated acoustic data is reviewable and overridable.
20. Final approval requires human listening under several playback conditions.

# 39. Explicit Deferrals and Open Questions

## 39.1 Deferred to 23H

- Final unified window layout and interaction design.
- Complete keyboard, controller and touch workflows.
- Detailed visual design for matrix, zone and mix editors.
- Tutorial sequence and onboarding.
- Full Test Laboratory scene UX.

## 39.2 Deferred to 23I

- Exact Godot class architecture.
- Threading and update scheduling.
- AudioStreamPlayer pooling strategy.
- DSP implementation and platform abstraction.
- Zone-generation algorithm implementation.
- Multi-listener renderer implementation.
- Streaming, memory and codec thresholds.
- Network and replay code.

## 39.3 Deferred to 23J

- Final production library counts.
- Naming governance and content-pack policy.
- Complete regression suite and release gates.
- Migration plans from temporary POC assets.
- Licensing and source audit workflow.

## 39.4 Deferred to Future Audio Modules

- Full dialogue editorial, recording and localisation.
- Voice casting, dubbing and lip-sync.
- Adaptive music composition and score graphs.
- Cinematic mix automation and mastering.
- Voice chat.
- Advanced physically based acoustic simulation.
- Platform-specific certification and final loudness standards.

## 39.5 Open Questions for Production

- Exact voice budgets by minimum, recommended and high hardware tiers.
- Whether split-screen uses one shared world listener or bounded dual world listeners on target platforms.
- Final dynamic-range presets and loudness targets.
- How frequently player-built structures trigger acoustic-zone rebuilds.
- Which material families need bespoke impulse or contact recording.
- Whether very large caves require hierarchical subzones.
- How much environment detail is generated procedurally versus placed by worldgen templates.
- Whether user content packs may add buses or only approved child categories.
- Final policy for creature awareness versus accessibility direction indicators.

# Appendix A. Material Audio Data Templates

## A.1 Material Audio Profile

```text
MaterialAudioProfile
{
    material_audio_id
    display_name_key
    parent_profile_id
    material_tags[]

    density_class
    hardness_class
    resonance_class
    surface_texture_class
    absorption_value
    reflection_value
    transmission_value
    diffusion_value

    footstep_family_id
    impact_family_id
    break_family_id
    placement_family_id
    scrape_family_id
    debris_family_id

    wet_variant_id
    frozen_variant_id
    corrupted_variant_id
    magic_affinity_tags[]

    acoustic_zone_contribution
    revision
    dependencies[]
    validation_status
}
```

## A.2 Material Response Rule

```text
MaterialResponseRule
{
    rule_id
    action_id
    source_material_id
    source_material_tags[]
    source_family_id
    target_material_id
    target_material_tags[]
    target_surface_tags[]
    intensity_min
    intensity_max
    required_state_tags[]
    excluded_state_tags[]
    environment_conditions[]
    magic_conditions[]

    sound_event_id
    overlay_event_ids[]
    spatial_profile_id
    priority_override
    deterministic_policy
    fallback_rule_id

    revision
    validation_status
}
```

# Appendix B. Spatial Audio Profile Template

```text
SpatialAudioProfile
{
    spatial_profile_id
    display_name_key
    source_shape
    source_dimensions
    orientation_policy

    attenuation_profile_id
    near_field_distance
    reference_distance
    maximum_distance
    gain_curve
    distance_filter_curve

    directionality_enabled
    inner_cone
    outer_cone
    rear_gain
    rear_filter

    occlusion_profile_id
    zone_participation
    portal_participation
    reverb_send_intent

    doppler_policy
    movement_update_rate
    teleport_policy
    lod_chain[]
    fallback_profile_id

    priority_default
    budget_class
    revision
    validation_status
}
```

# Appendix C. Acoustic Zone and Sound Portal Templates

## C.1 Acoustic Zone

```text
AcousticZoneDefinition
{
    zone_id
    owner_structure_id
    zone_shape_reference
    generation_mode
    geometry_revision

    volume_class
    enclosure_value
    dominant_material_profiles[]
    absorption_value
    reflection_value
    diffusion_value
    damping_value

    reverb_profile_id
    exterior_bleed
    interior_bleed
    noise_floor_event_id
    magic_overlay_id

    connected_portal_ids[]
    parent_zone_id
    fallback_zone_id
    dynamic_rebuild_policy

    revision
    validation_status
}
```

## C.2 Sound Portal

```text
SoundPortalDefinition
{
    portal_id
    zone_a_id
    zone_b_id
    spatial_reference_id
    portal_type

    area
    orientation
    open_fraction_parameter
    cover_material_audio_id
    transmission_profile_id
    directional_policy
    maximum_path_cost

    state_contract_id
    damage_mapping
    magic_mapping
    fallback_policy

    revision
    validation_status
}
```

# Appendix D. Bus, Snapshot and Priority Catalogue

## D.1 Core Bus Catalogue

| Bus ID | Role | User Control |
|---|---|---|
| audio.bus.master | Final game output. | Master volume. |
| audio.bus.ui | Interface and menu cues. | UI volume. |
| audio.bus.player | Local body, equipment and status. | Player effects. |
| audio.bus.combat | Attacks, impacts and defence. | Combat and threats. |
| audio.bus.threat | Protected warnings and telegraphs. | Critical cue emphasis, not full mute without alternatives. |
| audio.bus.creature | Creature voices and body audio. | Creatures. |
| audio.bus.npc | NPC activity and crowds. | Settlement activity. |
| audio.bus.machine | Machines, logistics and processing. | Machines. |
| audio.bus.machine_warning | Protected faults and overloads. | Critical alternatives required. |
| audio.bus.magic | Spells and magical infrastructure. | Magic. |
| audio.bus.environment | Biomes, structures and fluids. | Environment. |
| audio.bus.weather | Rain, wind, thunder and storms. | Weather. |
| audio.bus.dialogue | Reserved future dialogue. | Dialogue. |
| audio.bus.music | Reserved future music. | Music. |

## D.2 Snapshot Catalogue

| Snapshot ID | Main Changes |
|---|---|
| audio.snapshot.exploration | Default balanced routing and ambience. |
| audio.snapshot.combat | Protect local combat and threat; reduce decorative detail. |
| audio.snapshot.raid | Protect alarm, horn, ward and hostile telegraphs. |
| audio.snapshot.indoor_small | Apply interior response and exterior portal bleed. |
| audio.snapshot.cave | Cave ambience, reverb and ecology balance. |
| audio.snapshot.machine_hall | Cluster machines, protect interaction and warnings. |
| audio.snapshot.underwater | Filter world, add underwater bed and alternatives. |
| audio.snapshot.portal_transition | Manage major portal buildup and transition. |
| audio.snapshot.dialogue_focus | Reserved future dialogue focus. |
| audio.snapshot.low_health | Optional player-status emphasis. |

## D.3 Priority Catalogue

| Priority ID | Protected From | Typical Sources |
|---|---|---|
| audio.priority.critical | Ordinary stealing, ambience ducking and clustering. | Ward breach, lethal telegraph, overload. |
| audio.priority.player_immediate | Decorative and standard world voices. | Local attack, parry, interaction. |
| audio.priority.threat | Ambience and distant world voices. | Hostile call, projectile pass. |
| audio.priority.important_world | Decorative detail. | Bell, portal, collapse. |
| audio.priority.standard_world | Disposable and ambient detail. | Footsteps, ordinary machines. |
| audio.priority.ambient_detail | Disposable voices only. | Birds, drips, distant work. |
| audio.priority.disposable | Nothing. | Redundant or far texture. |

# Appendix E. Validation Code Register

| Code | Severity | Meaning |
|---|---|---|
| AUD-001 | Error | Runtime audio resource has invalid or missing stable ID. |
| AUD-002 | Error | Material response rule references missing material or Sound Event. |
| AUD-003 | Warning | Material-action combination has no specific or family-level coverage. |
| AUD-004 | Error | Fallback chain is cyclic or terminates without valid policy. |
| AUD-005 | Warning | Two response rules have ambiguous equal specificity. |
| AUD-006 | Error | Spatial profile has invalid source shape or dimensions. |
| AUD-007 | Warning | Audible range exceeds approved budget class. |
| AUD-008 | Error | Required spatial reference has no valid fallback. |
| AUD-009 | Warning | Occlusion update rate is excessive for priority class. |
| AUD-010 | Error | Acoustic Zone has invalid geometry or missing owner. |
| AUD-011 | Error | Sound Portal connects missing or identical invalid zones. |
| AUD-012 | Warning | Zone graph contains unreachable or negligible portal path. |
| AUD-013 | Warning | Generated zone differs substantially from current voxel geometry. |
| AUD-014 | Error | Ambience Plan can create unbounded concurrent details. |
| AUD-015 | Warning | Ambience density exceeds biome or zone budget. |
| AUD-016 | Error | Sound Event routes to missing or prohibited bus. |
| AUD-017 | Warning | Snapshot transition may pump or change abruptly. |
| AUD-018 | Error | Concurrency policy permits unbounded voices. |
| AUD-019 | Warning | Cluster profile cannot preserve required warning exceptions. |
| AUD-020 | Error | Critical cue can be muted without approved alternative. |
| AUD-021 | Warning | Caption frequency or density exceeds comfort guidance. |
| AUD-022 | Error | Split-screen policy duplicates protected global voices incorrectly. |
| AUD-023 | Warning | Mix test exceeds headroom or clips in benchmark scene. |
| AUD-024 | Error | Save/load reconstruction would replay false start event. |
| AUD-025 | Error | Migration removes protected bus, portal, cue or fallback. |
| AUD-026 | Warning | User category routing is unclear or inconsistent. |
| AUD-027 | Warning | Reverb or environment send masks repeated gameplay contacts. |
| AUD-028 | Error | Runtime profile reads undeclared context or state field. |
| AUD-029 | Warning | Distant source lacks reduced, clustered or virtualised representation. |
| AUD-030 | Blocker | Critical-cue survival test fails in MVP raid benchmark. |

# Appendix F. MVP Acceptance Matrix

| Requirement | Acceptance Test |
|---|---|
| Material resolution | Core actions resolve correct families across all MVP materials and show fallback reasoning. |
| Footsteps | Walk, run, crouch and landing remain varied and readable across dirt, stone, wood, mud, water and crystal. |
| Mining | Tool, target, intensity and damage stage produce coherent contact and break audio. |
| Spatial profiles | Point, path, surface, region and volume sources localise and attenuate correctly. |
| Occlusion | Pillar, wall and closed-door tests transition smoothly without full silence or abrupt filtering. |
| Acoustic zones | Cottage, blacksmith, mine and cave use valid generated or authored zones. |
| Sound portals | Door, window, mine entrance and magical portal modify leakage correctly. |
| Ambience | Forest, village, rain, cave and machine ambience compose from bounded components. |
| Weather contact | Rain differs across open air, foliage, timber roof, stone, water and equipment. |
| Routing | All MVP content routes through approved buses and user controls. |
| Snapshots | Exploration, combat, raid, cave, indoor and machine-hall transitions remain stable. |
| Voice budget | Dense village, ten-furnace and heavy-rain tests remain within target tier. |
| Clustering | Furnaces, worksite, crowd and rain-roof clusters preserve density and warning exceptions. |
| Virtualisation | Managed loops resume at correct state and phase after distance or budget virtualisation. |
| Accessibility | Critical cues retain captions and sensory equivalents under muted categories. |
| Split-screen | Two local players receive correct local cues without duplicating the entire world mix. |
| Persistence | Save/load reconstructs ambience and managed loops without replaying historical one-shots. |
| Diagnostics | Runtime trace explains material, spatial, zone, mix and voice decisions. |
| Validation | All blockers and errors prevent approval and bake. |

# Appendix G. Cross-System Integration Matrix

| Document/System | 23G Dependency | 23G Output |
|---|---|---|
| 23A | Presentation Profiles, channels, budgets and accessibility identity. | Runtime audio component resolution, mix and alternatives. |
| 23B | Anchors, sockets, regions, paths, zones, portals and fallbacks. | Spatial profile use, generated zone metadata and runtime contact placement. |
| 23C | Event Contracts, Context Packets, parameters and lifecycle. | Material selection, ambience state, snapshot and voice decisions. |
| 23F | Sound Events, Audio Families, loops, routing intent and source content. | Final material, spatial, acoustic and mix application. |
| 23H | Unified creator UI and Test Laboratory. | Matrix, zone, ambience, mix and diagnostics requirements. |
| 23I | Godot runtime architecture and platform implementation. | Data contracts, algorithms, budgets and service responsibilities. |
| 23J | Libraries, governance, testing and migration. | Initial catalogues, validation codes and acceptance criteria. |
| Blocks/Items | Material, surface, shape, state and equipment metadata. | Contact and acoustic Material Audio Profiles. |
| Recipes/Automation | Machine state, process, load, throughput and faults. | Managed loops, cluster sources, warnings and mix priority. |
| NPC Villages | Jobs, crowds, structures, alarms, growth and damage. | Settlement ambience, worksites, bells and simulation LOD. |
| Magic | Mana, wards, rituals, portals, corruption and dimension state. | Spatial magical infrastructure, overlays and critical cues. |
| Creatures/Combat | Movement, voice, threat, impact and result context. | Spatial voices, contact resolution, telegraphs and priority. |
| Biomes/Worldgen | Biome, weather, water, caves, structures and dynamic state. | Ambience plans, Acoustic Zones, environmental sources and weather contact. |
| Structures | Rooms, openings, materials, damage and blueprint semantics. | Generated zone graphs, portals, leakage and structure ambience. |
| UI/Accessibility | User settings, captions, indicators and local player routing. | Bus controls, caption dispatch and sensory equivalents. |
