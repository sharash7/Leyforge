# Fantasy Voxel Civilisation Sandbox
## 23F - Presentation Forge
### Sound Forge: Core Authoring and Sound Event System
**Version 0.1 - Detailed Design Bible Draft**

*A detailed creator-facing audio-authoring specification for Leyforge, covering source import, recording, provenance, layered sound construction, non-destructive processing, Sound Events, reusable audio families, variation, sequencing, loops, state and parameter control, material response, system integration, accessibility, validation, runtime products and Forest Hamlet proof-of-concept content.*

*Working design document - Sound Forge project model, authoring workflow, Sound Event containers, audio-family grammar, runtime lifecycle and Godot-facing content contract*

# Sound Forge System Statement

| Field | Locked Direction |
|---|---|
| Document Scope | Defines the core Sound Forge authoring system, including source audio, recording and import, provenance, layer construction, non-destructive processing, Sound Event containers, event modes, reusable audio families, parameter control, variation, looping, lifecycle, validation, baking, preview and MVP content. |
| Core Philosophy | Sound communicates authoritative gameplay and world state. Sound Forge resources may consume validated events, read declared parameters and resolve context, but may not decide combat success, machine output, AI behaviour, resource transactions or persistent world truth. |
| Audio Identity | Leyforge audio is stylised, tactile, layered, readable and spatially meaningful. Real recordings, procedural sources and approved generated material may be used, but no universal 8-bit treatment is required. |
| Shared Foundation | Sound Forge is a specialist workspace inside Presentation Forge and reuses 23A shared profiles, 23B spatial references, 23C event contracts and bindings, Forge manifests, stable IDs, inheritance, review, validation, baking and packaging. |
| Source Direction | Imported and recorded sources remain traceable through provenance, licence, creator, origin, edit history, quality, channel and approval metadata. Destructive source replacement is never the default workflow. |
| Construction Direction | Sounds are assembled from named layers such as transient, body, texture, tail, sweetener and environment response, with reusable layer roles and family templates. |
| Event Direction | A Sound Event is the runtime-ready audio definition. It may select, randomise, sequence, blend, loop or switch layers in response to a Presentation Context Packet and declared state parameters. |
| Variation Direction | Repetition is controlled through round robins, weighted selectors, shuffle bags, cooldowns, history-aware repeat avoidance, bounded pitch and gain ranges, start offsets and optional layer probability. |
| Loop Direction | Continuous audio uses explicit start, sustain, update, stop and tail behaviour. Phase continuity, crossfades and virtualisation prevent machine, ambience and magic loops from restarting unnaturally. |
| Spatial Boundary | Sound Forge authors source-relative spatial metadata and consumes anchors, sockets, regions and zones from 23B. Detailed attenuation, acoustics, sound portals and runtime mixing are expanded in 23G. |
| Mix Boundary | Sound Events declare routing, priority, concurrency and send intents. Complete bus hierarchy, snapshots, acoustic-zone behaviour and final runtime mix rules are defined in 23G. |
| Accessibility Direction | Important sound cues require caption labels, visual or haptic equivalents where appropriate, frequency-safe alternatives and priority rules that survive mix and performance reduction. |
| Performance Direction | Every Sound Event declares a budget class, maximum voices, concurrency behaviour, streaming policy, virtualisation behaviour and fallback path. Dense villages and factories use clustering and aggregation rather than unbounded voices. |
| Runtime Direction | Editable Sound Forge projects compile into compact Godot-facing resources, referenced audio files, lookup tables and deterministic event plans. Generated products are replaceable outputs, not canonical source. |
| MVP Direction | Prove footsteps and block contacts, mining and construction, player combat, goblin and wisp cues, furnace and mana-furnace lifecycle, village ambience, rain and cave ambience, ward warnings and critical accessibility cues. |
| Deferred Scope | Full music composition, adaptive score authoring, dialogue recording, lip-sync production, voice localisation and advanced mastering suites are deferred, while their buses, contracts and attachment points remain reserved. |

# Document Purpose

Document 23A establishes Presentation Forge as Leyforge's shared sensory communication layer. Document 23B defines stable spatial anchors, sockets, regions, paths, Surface Masks and runtime contact points. Document 23C defines Event Contracts, Presentation Context Packets, bindings, parameter maps, lifecycle ownership and profile dispatch. Documents 23D and 23E define the VFX Forge and its bounded voxel effect language. This document turns the audio half of that architecture into a practical Sound Forge authoring system.

The goal is not merely to import sound files and attach them to objects. Leyforge requires a scalable audio language capable of expressing material, weight, movement, work, danger, magic, culture, weather, distance, damage and world state without creating a unique hard-coded script for every combination. A pickaxe striking stone, a goblin warning cry, a mana furnace approaching overload and rain hitting a timber roof should each feel distinctive, yet they should be produced through reusable systems that remain editable, traceable and performant.

The Sound Forge must support creators with different experience levels. A developer should be able to choose a guided footstep family, assign source recordings, preview several surfaces and obtain a valid Sound Event without building a complex graph. Advanced users should be able to construct layered events, parameter-controlled blends, multi-stage machine loops, context-sensitive material responses and culture variants while remaining inside bounded, validated authoring rules.

This document defines the canonical authoring model. Document 23G will expand material audio resolution, spatial sound, attenuation, acoustic zones, sound portals, ambience systems and runtime mixing. Document 23H will unify the creator-facing UI and Test Laboratory. Document 23I will define Godot and Summer Engine implementation in technical depth. Document 23J will define production libraries, registry governance, testing, migration and release acceptance.

# Engine and Forge Status Note

Leyforge is being developed in Godot with Summer Engine used as the AI-native development environment. Sound Forge is not a separate runtime dependency and should not require an external service to ship the game. Canonical projects, source references, event definitions, processing settings and manifests remain reviewable project data. Baking generates Godot-facing resources and optimised audio products that can be regenerated.

Godot implementation may use AudioStream resources, buses, custom resources, pooled players, stream playback, import settings and purpose-built runtime services. The authoring contract in this document should remain engine-aware but not tightly coupled to a single scene layout. Summer Engine may assist with source organisation, loop detection, classification, validation, variation suggestions and first-pass templates, but human review and explicit approval remain mandatory.

# Design Sources

| Source | Relevant Direction | How 23F Uses It |
|---|---|---|
| 00 - Master Game Design Bible | The world is stylised, readable, atmospheric, magical and civilisation-focused. | Audio reinforces cosy settlement life, dangerous exploration, ancient mystery, practical magic and world consequence. |
| 01 - Core Gameplay Loop | Players explore, gather, craft, build, interact, automate, defend, upgrade and expand. | Sound families are organised around actions and responses within the core loop rather than as unrelated clips. |
| 03 - Blocks Registry | Blocks expose material families, faces, states, damage, placement, mining and functional behaviour. | Supplies material and state context for footsteps, impacts, breakage, placement, machines and environmental contact. |
| 04 - Items Registry | Items expose material, equipment, use, quality, durability, charge and ownership. | Supports held-tool, weapon, armour, consumable, inventory and magical-item sound families. |
| 05 - Crafting and Recipe Registry | Crafting includes timed stations, fuel, power, by-products, risk and completion. | Requires start, work, contact, completion, fault, blocked and shutdown audio lifecycle. |
| 07 - NPC Village System | Villages contain jobs, schedules, work, trade, construction, danger, morale and events. | Requires readable job activity, village ambience, alarms, construction, crowds and simulation-LOD behaviour. |
| 08 - Automation System | Machines use visible power, moving parts, throughput, warnings, faults and mana. | Requires phase-continuous loops, parameter maps, machine families, aggregation and critical fault priority. |
| 09 - Magic System | Magic is physical infrastructure with mana, runes, wards, rituals, portals and corruption. | Requires school identities, charge-release sequences, mana hums, ward states, ritual layers and forbidden variants. |
| 10 - Creatures and Monsters | Creatures are identified through silhouette, movement, habitat, behaviour and sound. | Requires voice families, body movement, threat telegraphs, ecology cues, boss phases and variation. |
| 11 - Biomes and World Generation | Biomes, caves, weather, water, leylines and structures shape exploration. | Requires ambience beds, local emitters, weather contact, biome identity and environment-aware response. |
| 12 - Structures | Structures expose rooms, materials, openings, ownership, damage and dynamic state. | Supplies attachment points and future acoustic-zone generation for interiors, workshops, ruins and portals. |
| 16 - Combat, Gear and Defence | Combat requires readable attacks, impacts, blocks, armour, threats and accessibility. | Requires event-confirmed attack audio, material contact, telegraph priority, impact intensity and feedback layering. |
| 17 - UI/UX System | Feedback must be accessible, configurable, controller-ready and trustworthy. | Requires captions, critical-cue alternatives, category controls, preview and non-audio equivalents. |
| 18 - Technical Implementation Plan | Runtime systems are data-driven, authoritative, modular, persistent and performance-budgeted. | Sound assets use stable IDs, compact runtime products, bounded playback, validated events and explicit ownership. |
| 23A - Shared Presentation Foundation | Presentation Forge consumes truth and produces scalable audio/VFX feedback. | Provides identity, profiles, composition, accessibility, inheritance, budgets and shared-service rules. |
| 23B - Spatial Attachments | Assets expose anchors, sockets, regions, paths, zones and fallbacks. | Sound Events bind to stable semantic origins rather than fragile scene-node paths. |
| 23C - Events and Bindings | Events, context packets, state channels, lifecycle and parameter maps are versioned. | Defines legal Sound Event inputs, loop ownership, context resolution and profile dispatch. |
| 23D - VFX Core Authoring | Presentation profiles coordinate sound and visual feedback without owning gameplay. | Keeps paired sound/VFX events synchronised while retaining independent asset ownership. |
| 23E - Voxel Particle Graph | Effects use bounded simulation, lifecycle and virtualisation. | Establishes parallel lifecycle and budget concepts so audio and VFX degrade coherently. |

# Static Table of Contents

1. Locked Sound Forge Identity  
2. Approved Direction Summary  
3. Sound Forge Architecture and Workspace Boundaries  
4. Audio Asset Taxonomy, Stable IDs and Registry Roles  
5. Sound Projects, Manifests and Source-to-Runtime Separation  
6. Source Audio, Recording, Import, Provenance and Rights  
7. Layered Sound Construction Model  
8. Non-Destructive Processing Chains and Audio Operations  
9. Sound Event Containers and Runtime Event Modes  
10. Audio Families, Grammars, Templates and Presets  
11. Variation, Round Robins, Weighted Selection and Repeat Avoidance  
12. Timing, Sequencing, Loop Construction and Phase Continuity  
13. State, Parameters, Curves, Smoothing and Context Control  
14. Material and Contact Audio Foundation  
15. Player, Equipment, Movement and Combat Audio  
16. Creature, NPC, Voice-Family and Body Audio  
17. Machines, Automation, Crafting, Construction and Village Industry  
18. Magic, Mana, Wards, Rituals, Portals and Corruption Audio  
19. Environment, Weather, Fluids, Biomes and Ambient Content  
20. Spatial References, Attachments and Source Geometry Interface  
21. Routing, Bus Intent, Sends and Mix Metadata Interface  
22. Concurrency, Priority, Voice Ownership and Virtualisation Interface  
23. Accessibility, Captions, Critical Cues and Sensory Equivalence  
24. Inheritance, Overrides, Culture, Dimension and State Variants  
25. Multiplayer, Prediction, Reconciliation and Replay  
26. Persistence, Unloaded-World Reconstruction and Save Boundaries  
27. Performance Budgets, Compression, Streaming and Memory  
28. Validation, Diagnostics, Review and Quality Assurance  
29. Creator Workflow, Preview, Test Laboratory and Approval  
30. Summer Engine-Assisted Authoring and Automation Boundaries  
31. Minimum Viable Sound Forge and Initial Library  
32. Forest Hamlet Integrated Audio Scenario  
33. Balancing and Authoring Rules  
34. Explicit Deferrals and Open Questions  
Appendix A. Sound Event Data Template  
Appendix B. Audio Family and Layer Templates  
Appendix C. Core Processing Operation Catalogue  
Appendix D. Initial Sound Library Catalogue  
Appendix E. Validation Code Register  
Appendix F. MVP Acceptance Matrix  
Appendix G. Cross-Document Integration Matrix  

# 1. Locked Sound Forge Identity

The Sound Forge is Leyforge's creator-facing audio construction system. It turns approved source material, procedural components, reusable family rules, event contracts, context and state into runtime-ready Sound Events. A Sound Event may be a single one-shot, a layered impact, a parameter-driven machine loop, a creature call family, an ambience assembly or a multi-stage magical sequence. Every result remains traceable, bounded and connected to authoritative presentation contracts.

## 1.1 Locked Rule

> Sound Forge communicates what authoritative systems have declared. It may select, layer, vary, spatialise, route, virtualise and caption audio, but it may not decide that an attack hit, a machine completed work, a creature noticed the player, a ward failed or a structure changed state.

## 1.2 Sound Forge Promise

A creator should be able to answer the following questions for every Sound Event:

- What authoritative event, loop owner or state causes it to exist?
- Which asset, socket, contact point, region or zone emits it?
- Which layers and source assets form the sound?
- Which material, action, intensity, environment or culture parameters affect it?
- How does it start, vary, sustain, stop and tail?
- How does it avoid obvious repetition?
- Which bus, priority and concurrency group does it request?
- What happens when it is distant, inaudible, over budget or virtualised?
- Which caption, indicator or haptic equivalent communicates its important meaning?
- Which source, licence, creator, revision and approval records justify its inclusion?

## 1.3 Identity Layers

| Identity Layer | Design Meaning | Player-Facing Result |
|---|---|---|
| Tactile action feedback | Impacts, movement, placement, tools and interaction have material weight. | Mining, building, combat and crafting feel responsive. |
| Living-world audio | Wildlife, NPCs, work, trade, weather and structures produce coherent local activity. | Villages and biomes feel inhabited rather than visually animated but silent. |
| State communication | Machines, wards, creatures and hazards expose readable states through sound. | Players can recognise danger, progress, blockage and failure without staring at UI. |
| Fantasy identity | Mana, runes, dimensions, corruption and cultures have controlled audio vocabularies. | Magic sounds like a practical part of the world rather than generic stock effects. |
| Reusable systemic construction | Families resolve action, material, intensity and environment. | Large content libraries remain consistent and scalable. |
| Performance-aware playback | Voice counts, streaming, aggregation and virtualisation are explicit. | Dense settlements and factories remain audible without becoming noisy or expensive. |
| Accessible communication | Captions and alternative cues are authored with the sound. | Important information is not locked to one sensory channel. |

## 1.4 What Sound Forge Is Not

- It is not an unrestricted audio scripting language.
- It is not the owner of combat, AI, recipes, machines, weather or quest state.
- It is not a replacement for 23C Event Contracts and bindings.
- It is not a replacement for 23B anchors, sockets or acoustic geometry.
- It is not a digital audio workstation intended to replace specialised recording, restoration or mastering software.
- It is not a full dialogue, localisation, lip-sync or music-composition suite in this phase.
- It is not permission to play every possible sound simultaneously.
- It is not a universal retro or 8-bit filter applied to all audio.
- It is not a requirement that every decorative world action produce a unique saved event.

# 2. Approved Direction Summary

| Area | Locked Decision |
|---|---|
| Umbrella | Sound Forge operates as the core audio-authoring workspace inside Presentation Forge. |
| Runtime unit | Sound Event is the principal runtime-ready audio definition. |
| Source model | Preserve original sources and provenance; author edits non-destructively. |
| Layer model | Use semantic roles: transient, body, texture, tail, sweetener, environment response and optional state overlays. |
| Construction depth | Guided templates for common work; advanced layered event authoring for specialist cases. |
| Event modes | Support one-shot, random set, shuffle set, sequence, layered composite, switch, blend, loop, multi-stage lifecycle and ambient assembly. |
| Family model | Use reusable Audio Families for footsteps, impacts, breakage, creatures, machines, magic, weather and ambience. |
| Context | Consume 23C context fields such as materials, action, intensity, environment, speed, wetness, temperature, school and state. |
| Material response | Use family and matrix resolution rather than unique hard-coded events for every contact pair. |
| Variation | Use bounded randomisation, weighted selection, shuffle bags, history and cooldowns. |
| Loops | Require explicit lifecycle ownership, seamless loop validation, crossfades, phase continuity and stop/tail rules. |
| Procedural sources | Allow bounded noise, oscillator and transient generators for support layers; do not make procedural synthesis mandatory. |
| Spatial integration | Reference 23B semantic spatial IDs; detailed runtime spatialisation belongs to 23G. |
| Mixing integration | Declare bus, priority, concurrency and send intent; detailed mixing belongs to 23G. |
| Inheritance | Families and events support base definitions, child variants, culture packs, dimension packs, state overlays and deterministic overrides. |
| Accessibility | Important cues include captions and alternatives; reduced-frequency and reduced-intensity variants are supported. |
| Determinism | Selection may use event seed where replay or multiplayer consistency matters; purely decorative ambience may vary locally. |
| AI assistance | Summer Engine may suggest layers, trim points, loop points, family matches and warnings, but may not approve content or invent rights metadata. |
| MVP | Prioritise core actions, the Forest Hamlet machine/village loop, magic infrastructure, raid warnings, rain, cave ambience and goblin threats. |

# 3. Sound Forge Architecture and Workspace Boundaries

## 3.1 Workspace Structure

```text
Presentation Forge
├── Shared Contract Browser
├── Shared Spatial Browser
├── Shared Presentation Profile Editor
├── VFX Forge
└── Audio Forge
    ├── Sound Forge
    │   ├── Source Library
    │   ├── Layer and Waveform Editor
    │   ├── Sound Event Editor
    │   ├── Audio Family Editor
    │   ├── Processing Chain Editor
    │   ├── Variation and Sequence Editor
    │   ├── Loop and Lifecycle Editor
    │   ├── Parameter and State Preview
    │   └── Validation and Bake Panel
    └── 23G Runtime Audio Workspaces
        ├── Material Response Matrix
        ├── Spatial Audio and Attenuation
        ├── Acoustic Zones and Sound Portals
        ├── Ambience System
        └── Runtime Mix and Bus Editor
```

Sound Forge owns the construction of audio content. It does not own the final physical model for sound propagation through rooms, the complete runtime bus mix or the world ambience scheduling system. It nevertheless records the metadata those later systems require.

## 3.2 Shared Services

| Shared Service | Sound Forge Use |
|---|---|
| Project manifest | Stores identity, dependencies, source references, versions and production status. |
| Stable ID service | Generates namespaced IDs for events, families, sources, layers, chains and presets. |
| Contract browser | Selects legal 23C events, state channels, context fields and lifecycle owners. |
| Spatial browser | Selects 23B anchors, sockets, regions, zones and fallback mappings. |
| Material DNA | Resolves material families, resonance, debris and contact-audio defaults. |
| Presentation Profiles | Bundles Sound Event references with VFX, light, haptic and accessibility cues. |
| Override service | Applies content-pack, culture, dimension and state variants deterministically. |
| Review service | Tracks draft, review, approved, deprecated and blocked status. |
| Bake service | Produces compact runtime definitions and validates referenced audio products. |
| Test Laboratory | Replays events, contexts, states and dense-scene scenarios. |

## 3.3 Responsibility Boundaries

| System | Owns | Does Not Own |
|---|---|---|
| Gameplay and simulation | Action truth, hits, resource flow, machine state, AI, weather, quest state. | Audio file selection, layering and presentation variation. |
| 23C resolver | Contract validation, context packet, binding and profile dispatch. | Source editing or final Sound Event construction. |
| Sound Forge | Sound sources, layers, event logic, family rules, variations and bake metadata. | Gameplay mutation, unrestricted callbacks or final acoustic simulation. |
| 23G runtime audio | Spatialisation, buses, mix, acoustics, ambience scheduling and voice policy. | Canonical source editing or gameplay truth. |
| Godot runtime | Playback, pooling, streaming, routing and real-time parameter updates. | Editing canonical Forge project data. |
| Summer Engine | Assisted authoring, analysis and generation suggestions. | Final approval, rights decisions or hidden runtime dependency. |

## 3.4 Authoring Complexity Tiers

| Tier | Intended User | Available Controls |
|---|---|---|
| Guided | General content creator | Template, source slots, intensity, variation, routing intent and preview. |
| Standard | Audio-capable developer | Layers, selectors, loops, envelopes, processing, parameter maps and variants. |
| Advanced | Specialist | Nested event containers, blend logic, lifecycle transitions, procedural support layers and family grammar. |
| Technical | Audio/engine developer | Runtime diagnostics, compiled plan inspection, streaming policy, voice budgets and validation configuration. |

# 4. Audio Asset Taxonomy, Stable IDs and Registry Roles

## 4.1 Core Asset Types

| Asset Type | Purpose | Example ID |
|---|---|---|
| Audio Source | Immutable or versioned source recording/file reference. | audio.source.stone_impact_01 |
| Procedural Source | Bounded generated signal or noise recipe. | audio.proc.spark_transient_light |
| Processing Chain | Reusable non-destructive operations. | audio.chain.machine_metal_small |
| Audio Layer | Named source plus gain, timing, processing and role. | audio.layer.pickaxe_stone.body |
| Sound Event | Runtime-ready playback definition. | sound.event.mining.pickaxe_stone_medium |
| Audio Family | Reusable construction and resolution rules. | audio.family.mining_impact |
| Variation Set | Weighted or shuffle-based source/event selection. | audio.variation.footstep_stone_boot |
| Sequence | Ordered or timed event stages. | audio.sequence.portal_open_basic |
| Loop Definition | Loop region, transitions, phase and ownership metadata. | audio.loop.furnace_work_basic |
| Parameter Preset | Curves, ranges and smoothing for an input. | audio.param.machine_speed_pitch |
| Routing Intent | Requested bus, priority, send and concurrency metadata. | audio.route.machine_standard |
| Caption Definition | Localisable semantic caption and importance. | caption.machine.output_blocked |
| Preview Scenario | Context/state trace for author testing. | preview.sound.furnace_blocked |

## 4.2 Stable ID Rules

IDs use lowercase namespaces with semantic, durable naming. Filenames and human display names may change without changing IDs.

```text
sound.event.<domain>.<family>.<variant>
audio.family.<domain>.<name>
audio.source.<library_or_pack>.<name>
audio.layer.<owner>.<role>
audio.chain.<domain>.<name>
audio.sequence.<domain>.<name>
audio.loop.<domain>.<name>
audio.route.<category>.<name>
caption.<domain>.<meaning>
```

Good examples:

```text
sound.event.footstep.boot_stone_walk
sound.event.machine.furnace_work
sound.event.magic.ward_breach
sound.event.creature.goblin_alert
sound.event.weather.rain_roof_timber
```

Avoid IDs based on temporary filenames, actor paths, personal initials, date stamps or implementation details.

## 4.3 Registry Roles

A source registry tracks files and rights. A Sound Event registry tracks runtime-facing definitions. An Audio Family registry tracks reusable resolution. These remain separate so a source file may be used in several approved events without duplicating provenance, and an event may change source composition without breaking its gameplay-facing ID.

## 4.4 Status and Lifecycle

| Status | Meaning |
|---|---|
| Concept | Placeholder idea; may be incomplete and cannot ship. |
| Draft | Authoring in progress; preview allowed. |
| Review | Content complete enough for technical and creative review. |
| Approved | Valid for baking and release candidates. |
| Deprecated | Retained for migration but not for new references. |
| Blocked | Cannot bake due to rights, missing source, validation or dependency issue. |
| Replaced | Superseded by another stable ID through explicit migration. |

# 5. Sound Projects, Manifests and Source-to-Runtime Separation

## 5.1 Sound Project

A Sound Project is the canonical editable package for one coherent audio asset or family. It may contain one Sound Event or a related set, such as furnace start, sustain, blocked, damaged and shutdown definitions.

```text
SoundProject
├── project manifest
├── source references
├── layer definitions
├── processing chains
├── Sound Events
├── family membership
├── parameter maps
├── routing intents
├── captions and accessibility
├── preview scenarios
├── validation records
└── bake outputs
```

## 5.2 Manifest Fields

| Field | Purpose |
|---|---|
| project_id | Stable project identity. |
| display_name_key | Localisable creator-facing name. |
| owner_namespace | Core game or content-pack ownership. |
| asset_type | Event, family, sequence, loop, chain or mixed project. |
| dependencies | Sources, contracts, anchors, materials, profiles and presets. |
| source_provenance | Creator, origin, licence and acquisition data. |
| revision | Semantic version and content revision. |
| compatibility | Minimum Forge schema and runtime version. |
| production_status | Draft, review, approved, deprecated or blocked. |
| quality_target | MVP, production, cinematic or placeholder. |
| budget_class | Expected runtime cost and voice policy. |
| review_history | Author, reviewer, findings and approvals. |

## 5.3 Canonical Source Versus Generated Product

Canonical project data includes source references, edits, layers, event logic and metadata. Generated products include resampled audio, encoded streams, peak data, compiled selectors, normalised loop regions and runtime lookup tables. Generated products may be deleted and rebuilt without losing authoring intent.

## 5.4 Dependency Integrity

A project cannot become Approved when it references:

- Missing source files.
- Unresolved licences or prohibited usage.
- Deprecated Event Contracts without migration.
- Missing captions for critical cues.
- Invalid loop regions.
- Non-existent routing intents.
- Anchors that fail required spatial validation.
- Parameter maps outside declared context ranges.

## 5.5 Versioning

Minor source replacement that preserves timing, meaning and behaviour may increment the project revision. Changes to event meaning, lifecycle, required context or external contract require a versioned schema change and migration review.

# 6. Source Audio, Recording, Import, Provenance and Rights

## 6.1 Approved Source Categories

- Original recordings produced for Leyforge.
- Properly licensed third-party libraries.
- Public-domain sources with documented status.
- Procedural sources generated inside Sound Forge.
- AI-generated audio with permitted rights, recorded provenance and human review.
- Existing project assets whose ownership and terms are verified.

## 6.2 Required Provenance

| Field | Required Information |
|---|---|
| source_id | Stable source identity. |
| origin_type | Original recording, library, procedural, generated or inherited. |
| creator/provider | Person, team, service or library. |
| licence | Licence name, agreement reference or internal ownership. |
| permitted_use | Commercial use, modification, redistribution and attribution obligations. |
| acquisition_date | When the source entered the project. |
| original_filename | Original file name retained for traceability. |
| checksum | Integrity and duplicate detection. |
| modifications | Trim, cleanup, restoration and derived-source history. |
| approval | Rights and creative approval status. |

Unknown provenance blocks production approval. The Forge must never invent rights metadata to remove a warning.

## 6.3 Recording Profiles

Sound Forge may store recommended recording profiles without replacing specialist recording software.

| Profile | Typical Use | Guidance |
|---|---|---|
| Close Foley | Footsteps, tools, cloth, leather and small impacts. | Dry recording, controlled room, several intensity passes. |
| Impact | Stone, wood, metal, debris and combat layers. | Protect transient headroom; record multiple perspectives and strengths. |
| Mechanical | Gears, motors, chains, doors and machinery. | Capture start, sustain, stop, strain and faults separately. |
| Environment | Forest, cave, rain, wind, water and village beds. | Record long clean takes with notes on location and intrusions. |
| Creature Source | Vocalisations, breaths, movement and body textures. | Record isolated components suitable for layered transformation. |
| Magic Source | Crystals, resonances, bows, glass, metal and synthetic support. | Capture tonal material with sufficient variation and clean decay. |

## 6.4 Import Analysis

On import, Sound Forge records:

- Sample rate and bit depth.
- Channel layout.
- Duration.
- Peak and integrated loudness estimate.
- DC offset and clipping warnings.
- Leading and trailing silence.
- Potential loop regions.
- Noise-floor estimate.
- Duplicate or near-duplicate matches.
- Embedded metadata.
- File integrity.

Analysis informs the creator but does not destructively change the source without an explicit derived-source operation.

## 6.5 Derived Sources

A creator may generate a cleaned or edited derivative. The derivative stores its parent source, operations and revision. Source chains must remain understandable; endlessly nesting opaque derivatives is discouraged.

## 6.6 Source Quality Rules

- Do not normalise every source blindly; preserve useful dynamic relationships.
- Avoid irreversible heavy processing in the source when it belongs in an event layer.
- Remove clicks, clipping and unusable noise before approval.
- Preserve enough tail for natural decay unless the event intentionally replaces it.
- Record several performances for repeated actions whenever practical.
- Mono sources are preferred for most point emitters; stereo and multichannel sources require a declared purpose.

# 7. Layered Sound Construction Model

## 7.1 Semantic Layer Roles

| Layer Role | Purpose | Examples |
|---|---|---|
| Transient | Immediate onset and action readability. | Pick strike, sword contact, switch click, ignition snap. |
| Body | Main weight, material and duration. | Stone thud, machine rotation, creature chest tone. |
| Texture | Surface detail and complexity. | Gravel scatter, leather creak, sparks, grit, cloth. |
| Tail | Decay and aftermath. | Ring, rubble, reverberant tail, falling fragments. |
| Sweetener | Controlled fantasy or dramatic identity. | Mana shimmer, corruption whisper, faction motif. |
| Environment Response | Contextual reflection or local response. | Cave slap, timber-room resonance, underwater filter layer. |
| State Overlay | Continuous or temporary condition. | Damage grind, low-fuel sputter, wetness, corruption pulse. |
| Accessibility Layer | Alternative or reinforced cue. | Low-frequency warning, distinct alert chirp, spoken/caption-linked cue. |

Not every Sound Event needs every role. The roles create a shared language for families, templates, mixing and validation.

## 7.2 Layer Definition

A layer contains:

- Source or procedural-source reference.
- Semantic role.
- Start offset and trim.
- Gain and pan intent.
- Pitch and time settings.
- Envelope.
- Processing-chain reference.
- Probability and selection conditions.
- Parameter mappings.
- Loop region where applicable.
- Routing override where justified.
- Caption contribution flag.
- Debug label and colour.

## 7.3 Example: Iron Pickaxe on Stone

```text
sound.event.mining.pickaxe_iron_stone_medium
├── transient: metal_pick_contact_medium
├── body: stone_impact_dense_medium
├── texture: rock_chip_scatter_02..05
├── tail: short_metal_ring_01..03
├── environment response: selected by 23G acoustic context
└── variation: event-seeded, history-aware
```

The gameplay event provides confirmed contact, tool material, target material, strength and contact position. Sound Forge resolves the construction; it does not determine whether the block was damaged.

## 7.4 Layer Grouping

Related layers may be grouped for shared processing, gain, probability or parameter control. Groups cannot create arbitrary recursive graphs. Maximum nesting depth is declared and validated.

## 7.5 Layer Coherence

Layers should reinforce one perceived action. An event should not become larger merely because more source files are available. Every layer needs a clear role, audible contribution and reason to remain.

# 8. Non-Destructive Processing Chains and Audio Operations

## 8.1 Processing Philosophy

Sound Forge provides common production operations sufficient for game-ready construction and variation. It is not intended to replace a full digital audio workstation. Operations remain non-destructive and parameterised until baking.

## 8.2 Core Operation Families

| Family | Operations |
|---|---|
| Editing | Trim, start offset, fade, crossfade, reverse and channel selection. |
| Level | Gain, envelope, compressor, limiter and transient control. |
| Spectral | High-pass, low-pass, band-pass, notch, equalisation and tilt. |
| Time | Time stretch, delay, pre-delay and gated duration. |
| Pitch | Static pitch, bounded random pitch, pitch envelope and parameter mapping. |
| Character | Saturation, distortion, bit reduction and controlled noise. |
| Space intent | Early reflection send, reverb send and dry/wet intent; final acoustic result belongs to 23G. |
| Utility | DC removal, phase invert, mono fold, channel swap and silence gate. |
| Procedural | Noise, oscillator, impulse, envelope and transient generator. |

## 8.3 Processing Chains

Chains are reusable assets. An event may reference a chain and override exposed safe parameters. This avoids copying identical filter and dynamics settings across hundreds of layers.

```text
audio.chain.magic.crystal_small
├── high-pass
├── resonant EQ
├── light saturation
├── short pitch shimmer
└── reverb-send intent
```

## 8.4 Real-Time Versus Baked Operations

| Operation Type | Preferred Handling |
|---|---|
| Fixed trim, cleanup and channel conversion | Bake. |
| Fixed EQ or compression with no runtime value | Usually bake. |
| Runtime speed-to-pitch mapping | Real-time. |
| State-controlled filter or gain | Real-time. |
| Random source selection | Runtime event plan. |
| Heavy time stretching | Bake variants where possible. |
| Long convolution or expensive processing | Managed by 23G mix/acoustic system, not per-event duplication. |

## 8.5 Safety Limits

- Processing chains have a maximum operation count.
- Feedback delays cannot create unstable gain.
- Pitch ranges are clamped to family-approved limits.
- Real-time processing cost is estimated during validation.
- Critical warning cues cannot be filtered into inaudibility by a state parameter.
- Extreme high-frequency content requires accessibility review.

# 9. Sound Event Containers and Runtime Event Modes

## 9.1 Sound Event Definition

A Sound Event is a stable runtime-facing asset that converts one invocation or managed lifecycle into one or more audio playback instructions. It references sources, layers, selectors, parameters, routing intents, captions and budget metadata.

## 9.2 Event Modes

| Mode | Behaviour | Typical Use |
|---|---|---|
| Single | Plays one defined layer or source. | UI click, simple interaction. |
| Layered Composite | Plays several synchronised semantic layers. | Weapon impact, block break, magic hit. |
| Random Set | Selects one weighted option. | Creature call, footstep variation. |
| Shuffle Set | Cycles through all eligible choices before reset. | Frequent repeated work sounds. |
| Sequence | Plays ordered stages with timing. | Portal activation, crafting completion. |
| Switch | Selects branch by discrete context/state. | Dry/wet, material, culture, damage class. |
| Blend | Crossfades or mixes by continuous parameter. | Machine speed, mana intensity, wind strength. |
| Managed Loop | Start, sustain, update, stop and tail. | Furnace, rain bed, magical conduit. |
| Multi-Stage Lifecycle | Transitions among several owned states. | Machine idle/start/work/blocked/stop. |
| Ambient Assembly | Selects beds and local details under ambience rules. | Village, cave, forest. |
| Stinger | High-priority one-shot coordinated with a state or event. | Raid warning, ward breach, boss phase. |

## 9.3 Event Node Model

The authoring view may display bounded containers and links, but Sound Event logic is not a general-purpose script graph. Legal nodes include source, layer group, selector, sequence, switch, blend, loop, delay, gate, parameter map, route and caption. Arbitrary code, scene-tree traversal and gameplay mutation are prohibited.

## 9.4 Nested Events

A Sound Event may reference child events for reuse, provided:

- Maximum depth is bounded.
- Circular references are impossible.
- Child voice cost is included in budget validation.
- Lifecycle ownership remains unambiguous.
- Captions do not duplicate unless explicitly intended.

## 9.5 Event Invocation Result

A compiled event returns a playback plan containing:

- Selected layers or child events.
- Start times.
- Initial parameters.
- Spatial source reference.
- Routing and priority metadata.
- Loop handle where applicable.
- Caption request.
- Deterministic selection seed where needed.
- Expected voice cost and fallback level.

# 10. Audio Families, Grammars, Templates and Presets

## 10.1 Audio Family

An Audio Family is a reusable design contract for a class of sounds. It defines required roles, eligible parameters, selection rules, expected variation, routing intent, caption behaviour, budgets and validation.

## 10.2 Initial Family Catalogue

```text
audio.family.footstep
audio.family.landing
audio.family.block_place
audio.family.block_break
audio.family.mining_impact
audio.family.tool_contact
audio.family.weapon_attack
audio.family.weapon_impact
audio.family.armour_contact
audio.family.machine_lifecycle
audio.family.machine_warning
audio.family.magic_charge_release
audio.family.ward_state
audio.family.creature_voice
audio.family.creature_body
audio.family.weather_contact
audio.family.ambient_bed
audio.family.ambient_detail
audio.family.structure_state
```

## 10.3 Family Grammar Example: Footstep

| Grammar Element | Rule |
|---|---|
| Required context | Foot socket/contact, surface material, movement mode and intensity. |
| Optional context | Footwear, wetness, snow depth, creature weight and culture equipment. |
| Required roles | Contact/body. |
| Optional roles | Texture, gear, splash, tail. |
| Variation | Minimum recommended performance count and repeat avoidance. |
| Timing | Contact-aligned; small random timing only for non-critical secondary layers. |
| Routing | Player or creature movement category. |
| Caption | Normally none; threat-important footsteps may request contextual captions. |
| Budget | One primary event per confirmed contact, with crowd aggregation at distance. |

## 10.4 Family Grammar Example: Machine Lifecycle

```text
idle
→ start one-shot
→ operating loop
→ optional strain/damage overlays
→ blocked or fault transition
→ resume or stop transition
→ shutdown one-shot and tail
```

The family requires lifecycle events, a loop owner, speed/load parameters, stop policy, virtualisation behaviour and warning-priority metadata.

## 10.5 Templates

Templates provide guided starting points:

- Simple one-shot.
- Layered impact.
- Material contact.
- Footstep family.
- Creature vocal set.
- Machine lifecycle.
- Magic charge and release.
- Environmental loop.
- Ambient bed plus details.
- Critical warning stinger.

Converting a template to advanced mode retains the same stable IDs, sources and parameters.

## 10.6 Presets

Presets store reusable operation settings, parameter curves, variation ranges and routing intents. Presets are not hidden global magic; their use is visible in the project and versioned.

# 11. Variation, Round Robins, Weighted Selection and Repeat Avoidance

## 11.1 Variation Goals

Variation should prevent obvious repetition while preserving identity. A footstep family must still sound like the same boot and surface. A goblin's alert call should remain recognisable even when performance changes.

## 11.2 Selection Strategies

| Strategy | Behaviour |
|---|---|
| Round Robin | Advances through ordered entries. |
| Shuffle Bag | Randomises the set and uses every eligible entry before refill. |
| Weighted Random | Selects based on explicit probabilities. |
| History Avoidance | Excludes the most recent entries for a defined history length. |
| Cooldown Gate | Temporarily prevents an entry or event from repeating. |
| Context Filter | Removes entries invalid for current material, state or intensity. |
| Seeded Selection | Uses event seed for deterministic replay or network consistency. |
| Local Decorative Selection | Allows client-local variation for non-authoritative ambience. |

## 11.3 Micro-Variation

Approved bounded micro-variation includes:

- Gain range.
- Pitch range.
- Start offset range.
- Pan or spread range where spatially valid.
- Layer probability.
- Tail selection.
- Small timing variation on decorative layers.
- Processing-preset variation.

Every range is authored and clamped. Randomisation cannot make a warning inaudible, shift a contact far from its animation or turn a material family into another identity.

## 11.4 Variation Memory

Playback history can be stored per event instance, emitter, entity, family or local cluster depending on the sound. Player footsteps should avoid repetition per player. Village hammer sounds may use a local-cluster history rather than one global sequence.

## 11.5 Deterministic Rules

Use deterministic selection for:

- Replay traces requiring repeatable review.
- Multiplayer events where audible variation affects timing or shared recognition.
- Authored sequences.
- Debug comparison.

Local-only decorative ambience may use independent seeds when exact agreement provides no gameplay value.

## 11.6 Variation Validation

Warnings include:

- Too few sources for expected repetition rate.
- Pitch range exceeding family identity.
- Weight set not summing or containing unreachable entries.
- Recent-history length greater than eligible set.
- Random offset crossing a loop boundary.
- Variation causing clipping or inconsistent loudness.

# 12. Timing, Sequencing, Loop Construction and Phase Continuity

## 12.1 Timing Units

Sound Forge stores time in seconds at authoring level and samples or normalised positions where precision is required. Event markers may be aligned to animation frames, machine-cycle normalised time or 23C event timestamps.

## 12.2 Sequence Stages

A sequence stage may contain:

- Start time or trigger relation.
- Sound Event or layer reference.
- Required condition.
- Optional cancellation policy.
- Transition to next stage.
- Caption and priority rule.

## 12.3 Loop Anatomy

| Region | Purpose |
|---|---|
| Start | One-time lead-in or ignition. |
| Loop In | Crossfade or transition into repeatable body. |
| Sustain | Seamless repeated region or continuous generated layer. |
| Update | Parameter changes while ownership remains active. |
| Loop Out | Exit aligned to phase or immediate crossfade. |
| Stop | One-time shutdown or release. |
| Tail | Natural decay after ownership ends. |

## 12.4 Seamless Loop Requirements

- Loop boundaries must avoid clicks and abrupt phase discontinuities.
- Crossfade length is explicit.
- Tonal loops require pitch and phase review.
- Random layers cannot create a new voice every update tick.
- Start and stop stages must not overlap indefinitely.
- Loop ownership must specify what happens when the owner is destroyed, unloaded, paused or virtualised.

## 12.5 Phase Continuity

Continuous machines, mana conduits, weather beds and ambience maintain logical phase separately from audible playback. When virtualised, phase may advance analytically. On promotion, the loop resumes at the correct state and an acceptable phase rather than always replaying ignition.

## 12.6 Synchronisation

Sound may synchronise with:

- Animation markers.
- Recipe-cycle phases.
- Machine rotations.
- Spell charge progress.
- Portal sequence stages.
- Boss phase timelines.
- VFX effect markers.

Synchronisation is driven by shared event or parameter contracts rather than by one presentation asset directly controlling another.

## 12.7 Cancellation

| Policy | Behaviour |
|---|---|
| Immediate Stop | Ends at once; use only for short or invalidated sounds. |
| Short Fade | Prevents click while ending quickly. |
| Finish Current Stage | Completes a short stage before stopping. |
| Phase-Aligned Exit | Waits for a safe loop boundary. |
| Convert to Stop Event | Plays shutdown or interrupted variant. |
| Persist Tail | Stops source but allows natural tail. |

# 13. State, Parameters, Curves, Smoothing and Context Control

## 13.1 Legal Inputs

Sound Events may consume fields declared by 23C, including:

```text
param.speed
param.load_ratio
param.heat_ratio
param.power_ratio
param.mana_ratio
param.damage_ratio
param.flow_ratio
param.distance
param.intensity
param.wetness
param.temperature
state.active
state.blocked
state.damaged
state.corrupted
state.underwater
```

They may also consume semantic IDs such as source material, target material, action, movement mode, magic school, biome and environment class.

## 13.2 Parameter Targets

Parameters may control:

- Gain.
- Pitch.
- Filter cutoff.
- Layer blend.
- Selection branch.
- Loop rate.
- Distortion or saturation amount.
- Reverb-send intent.
- Warning pulse rate.
- Probability of decorative layers.
- Crossfade between safe and strained states.

## 13.3 Curves

Parameter mappings use explicit curves rather than assuming linear behaviour. Curves have input range, output range, clamp policy, interpolation and preview graph.

Example:

```text
machine speed 0.0–1.0
→ pitch 0.85–1.18
→ body gain -8 dB–0 dB
→ gear texture blend 0.1–1.0
```

## 13.4 Smoothing and Hysteresis

State and parameter changes may be noisy. Sound Forge supports:

- Attack and release smoothing.
- Minimum hold time.
- Hysteresis thresholds.
- Rate limiting.
- Quantised bands.
- Transition cooldowns.

A furnace should not rapidly switch between blocked and unblocked audio because one item slot fluctuated for a single frame.

## 13.5 Parameter Authority

Sound Forge cannot read arbitrary properties from scene nodes. Every field must come from a declared contract, context packet, loop update or runtime audio service.

## 13.6 Critical-Cue Protection

Parameter mappings cannot reduce a critical alarm below its minimum audibility or remove its caption. Priority channels defined in 23C override decorative state layers where necessary.

# 14. Material and Contact Audio Foundation

## 14.1 Material Context

Blocks, items, armour, tools and creature surfaces expose Material DNA or compatible material-family tags. Contact events provide source material, target material, action, intensity, speed and surface state.

## 14.2 Contact Resolution Order

```text
specific authored override
→ source-target pair family
→ target material action family
→ source material action family
→ generic action fallback
→ critical semantic fallback or silence, depending on event
```

## 14.3 Contact Actions

- Footstep.
- Landing.
- Slide.
- Scrape.
- Mining impact.
- Tool strike.
- Weapon hit.
- Weapon block or parry.
- Projectile impact.
- Block placement.
- Block break.
- Object drop.
- Door or hinge movement.
- Fluid contact.
- Debris fall.

## 14.4 Material Properties Relevant to Audio

| Property | Influence |
|---|---|
| Density | Perceived weight and low-frequency body. |
| Hardness | Transient sharpness and contact duration. |
| Resonance | Ring, tone and tail. |
| Granularity | Debris and texture layers. |
| Flexibility | Creak, bend and damping. |
| Wetness response | Splash, damping and reduced dust. |
| Magic affinity | Optional tonal or energy layer. |
| Corruption state | Distortion, whisper, unstable pulse or altered resonance. |

## 14.5 Pair Explosion Control

The system must not require every possible source-target material pair to be authored manually. Families use target-dominant, source-dominant and action-dominant rules, with explicit overrides for important pairs.

## 14.6 Runtime Contact Packet

```text
contact_position
surface_normal
source_material_id
target_material_id
action_id
intensity
relative_speed
source_mass_class
target_state
wetness
environment_id
event_seed
```

The packet is presentation context, not damage authority.

# 15. Player, Equipment, Movement and Combat Audio

## 15.1 Player Movement

Movement audio includes footsteps, landings, jumps, slides, climbing, swimming, equipment rattle, breathing and status overlays. Events use confirmed movement contacts and local-player priority rules.

| Movement Mode | Required Context |
|---|---|
| Walk/Run/Sprint | Foot, surface, footwear, speed and weight. |
| Crouch | Reduced intensity and alternate gear layer. |
| Jump/Land | Take-off or contact, fall intensity and surface. |
| Climb | Hand/foot contact material and movement cadence. |
| Swim/Wade | Depth, speed, fluid type and equipment. |
| Glide/Grapple | Device state, tension, wind and movement speed. |

## 15.2 Equipment Audio

Equipment may contribute:

- Draw and holster.
- Grip and handling.
- Armour movement.
- Inventory interaction.
- Durability or damage rattle.
- Enchantment hum.
- Charge and cooldown.
- Tool activation.

Equipment layers should not overwhelm action readability. Repeated minor rattle uses strict concurrency and local-player controls.

## 15.3 Combat Lifecycle

```text
attack preparation
→ release or swing
→ confirmed contact, block, parry or miss
→ aftermath/tail
```

Attack audio must distinguish intention from confirmed outcome. A swing event may play before impact; the impact sound requires a contact or hit contract.

## 15.4 Combat Priorities

Critical telegraphs, parries, guard breaks, player damage and nearby heavy impacts receive higher priority than decorative distant combat. The mix system in 23G enforces final relationships.

## 15.5 Weapon Families

- Blunt.
- Blade.
- Axe.
- Spear/polearm.
- Bow/crossbow.
- Thrown.
- Shield.
- Tool-as-weapon.
- Magical focus.

Each family defines handling, attack, contact and material-response expectations.

## 15.6 Damage and Status

Sound may communicate damage, burning, freezing, poison, corruption, stun and armour failure. Gameplay owns the status and duration. Sound Events own readable overlays and end transitions.

# 16. Creature, NPC, Voice-Family and Body Audio

## 16.1 Creature Audio Identity

Creatures should be recognisable by vocal family, body movement, scale, habitat and behaviour. Sound should communicate more than aggression; it can indicate curiosity, fear, feeding, sleep, social calls, injury, magic and territorial warning.

## 16.2 Voice Families

A voice family defines performance categories rather than one generic call:

```text
idle
social
alert
search
attack_prepare
attack_release
hurt_light
hurt_heavy
flee
death
special_ability
boss_phase
```

Not every creature needs every category. Missing required categories produce a production warning based on AI/combat role.

## 16.3 Body Audio

- Footfalls by body mass and gait.
- Wing beats.
- Cloth, armour or equipment.
- Chitin clicks.
- Breathing.
- Tail, horn or claw contacts.
- Burrowing or crawling.
- Magical body hum.
- Environmental interaction.

## 16.4 Vocal Variation

Variation may use recorded performances, pitch bands, formant-safe processing, layer selection and intensity. Random pitch alone is insufficient for frequently heard intelligent creatures.

## 16.5 NPC Speech Boundary

Sound Forge may author non-verbal NPC efforts, reactions, crowd murmur, greeting stingers and placeholder voice-family events. Full spoken dialogue, recording direction, localisation, lip sync and subtitle timing are deferred to a future dialogue module.

## 16.6 Threat Readability

An off-screen creature that is about to perform a dangerous attack requires an audible or alternative telegraph when gameplay design expects reaction. The event contract defines timing and importance; the Sound Event provides voice and body layers.

## 16.7 Crowd and Village NPC Activity

Nearby named NPCs may emit distinct job actions and reactions. Distant groups aggregate into activity beds or cluster emitters. The system avoids one full voice for every simulated person.

# 17. Machines, Automation, Crafting, Construction and Village Industry

## 17.1 Machine Audio Contract

Machines expose lifecycle events and parameters rather than allowing Sound Forge to poll internal nodes.

```text
state.mode
param.speed
param.load_ratio
param.heat_ratio
param.damage_ratio
param.power_ratio
state.blocked
state.low_input
state.overloaded
```

## 17.2 Standard Machine Lifecycle

| State | Audio Behaviour |
|---|---|
| Idle | Quiet room tone or no voice depending on machine. |
| Starting | Ignition, latch, lever or energy ramp. |
| Operating | Phase-continuous mechanical or magical loop. |
| Processing Contact | Optional timed strikes, cuts, crushes or pulses. |
| Low Input/Fuel | Reduced loop, sputter or semantic warning. |
| Blocked | Strain transition, reduced cycle and warning cue. |
| Damaged | Additive grind, knock, arc or leak overlay. |
| Overloaded | Escalating critical warning with protected priority. |
| Stopping | Loop-out and shutdown one-shot. |

## 17.3 Machine Layer Roles

- Motor or power body.
- Gear/shaft/chain texture.
- Process contact.
- Material output.
- Exhaust or steam.
- Mana or rune layer.
- Damage overlay.
- Warning layer.
- Room/environment response.

## 17.4 Automation Networks

Long conveyor, pipe, mana and mechanical networks should not emit a voice from every segment. 23G will define clustering, but events should expose aggregation eligibility and semantic junctions such as motors, pumps, outputs and faults.

## 17.5 Crafting Stations

Crafting audio may use:

- Interaction start.
- Repeating work contacts.
- Fuel or ingredient addition.
- Process loop.
- Completion.
- Failure or unstable result.
- Output collection.

## 17.6 Construction

Construction sounds bind to actual project stages and worker actions. Distant construction may resolve to a grouped work bed. Completion stingers should be reserved for meaningful player-visible milestones.

## 17.7 Village Industry

Blacksmiths, sawmills, farms, markets, warehouses and workshops contribute to settlement identity. Sound Forge provides event families; 23G ambience rules decide when and how the settlement assembles them.

# 18. Magic, Mana, Wards, Rituals, Portals and Corruption Audio

## 18.1 Magic Audio Language

Magic should sound physical, cultural and functional. It may use tonal, crystalline, elemental, organic, mechanical and spatial components. A school or culture defines a vocabulary rather than one universal magical shimmer.

## 18.2 Magic Lifecycle

```text
ready or ambient state
→ charge
→ commit
→ release
→ travel or sustain
→ impact/result
→ residue or cooldown
```

The commit event is authoritative. Cancelling before commit may produce a different release or fizzle sequence.

## 18.3 School Identity Fields

- Tonal centre or interval family.
- Material source vocabulary.
- Attack/decay character.
- Noise and texture profile.
- Pulse rhythm.
- Distortion or purity.
- Spatial width intent.
- Associated creature/culture motifs.
- Forbidden/corrupted alteration.

These are design descriptors, not a requirement that every Sound Event become musical.

## 18.4 Mana Infrastructure

Mana conduits, batteries, furnaces and rune machines use continuous energy layers driven by flow, charge, purity and stability. Low-level decorative hums aggregate; critical instability and ward warnings remain distinct.

## 18.5 Wards

Ward events include:

- Idle protected field.
- Contact ripple.
- Heavy impact.
- Low power.
- Breach warning.
- Collapse.
- Recharge.
- Cleansing or corruption.

## 18.6 Rituals

Rituals use multi-stage sequences tied to authoritative stages and participant state. Sound may build intensity and react to interruption, but cannot decide ritual success.

## 18.7 Portals

Portals require open, stable, transit, unstable and close states. Sound portals used for acoustics are a separate 23G concept and must not be confused with gameplay dimensional portals.

## 18.8 Corruption and Forbidden Magic

Corruption variants may introduce unstable pitch, reversed textures, pulse irregularity, whispers, subharmonics or damaged-material layers. Accessibility review prevents discomfort from becoming the only way to communicate danger.

# 19. Environment, Weather, Fluids, Biomes and Ambient Content

## 19.1 Environment Categories

- Forest.
- Meadow.
- Mountain.
- Cave.
- Mine.
- River/lake/coast.
- Village.
- Workshop/factory.
- Ruin.
- Dungeon.
- Magical biome.
- Corrupted region.
- Dimension-specific environment.

## 19.2 Ambient Components

| Component | Role |
|---|---|
| Bed | Broad continuous environmental identity. |
| Detail | Intermittent local sound such as bird, branch, drip or distant work. |
| Emitter | Positioned source such as waterfall, fire, machine or creature. |
| Event Stinger | Weather change, distant threat or landmark reveal. |
| Transition | Entering cave, shelter, water or magic field. |
| State Overlay | Storm, night, corruption, festival, raid or disaster. |

Sound Forge authors these components. 23G defines their spatial scheduling, density, zone blending and mix.

## 19.3 Weather

Weather audio can include:

- Air and wind bed.
- Vegetation response.
- Rain or hail contact by surface family.
- Roof and shelter response.
- Water accumulation and runoff.
- Thunder distance bands.
- Magical storm layers.

Rain should not spawn one independent voice for every block contact. It uses zone and surface-family aggregation.

## 19.4 Fluids

Fluid sounds distinguish flow, drip, splash, immersion, pressure, boil and magical fluid behaviour. Runtime events provide fluid type, speed, volume class and contact context.

## 19.5 Day, Night and Season

Ambient families may expose variants or probabilities by time and season. These remain content rules consumed by the future ambience scheduler, not direct time-of-day polling inside individual Sound Events.

## 19.6 Environmental Restraint

Silence and space are valid. Every visible object does not require constant audio. Ambient detail density should preserve important threats, dialogue and player actions.

# 20. Spatial References, Attachments and Source Geometry Interface

## 20.1 Spatial Reference Types

Sound Events may bind through 23B references:

- Asset origin.
- Named audio socket.
- Exact voxel or free anchor.
- Surface mask or region.
- Path or network node.
- Blueprint marker.
- Acoustic zone.
- Sound portal.
- Temporary runtime contact point.

## 20.2 Common Audio Sockets

```text
socket.audio.origin
socket.audio.head
socket.audio.mouth
socket.audio.chest
socket.audio.feet
socket.audio.weapon
socket.audio.machine_body
socket.audio.gearbox
socket.audio.output
socket.audio.warning
socket.audio.chimney
socket.audio.mana_core
```

## 20.3 Source Shape Intent

Sound Forge may declare point, area, line, path, region or zone source intent. Detailed rendering and attenuation are handled in 23G.

## 20.4 Fallbacks

A required sound origin uses 23B remapping and fallback chains. For example, a creature mouth socket may fall back to head, chest and entity origin by LOD. Critical cues may permit approximation; precise diegetic contact may require a valid runtime point.

## 20.5 Listener Relation

Events declare whether they are world-relative, local-player-relative, UI-relative or non-spatial. This is metadata, not a bypass around the audio runtime service.

## 20.6 Moving Sources

Looping moving sources follow stable emitters and use smoothing. One-shots may detach to preserve a natural tail when the source is destroyed, depending on event policy.

# 21. Routing, Bus Intent, Sends and Mix Metadata Interface

## 21.1 Routing Intent

Sound Events request a routing intent rather than directly manipulating the final bus graph.

```text
audio.route.player.action
audio.route.combat.impact
audio.route.creature.voice
audio.route.machine.loop
audio.route.magic.infrastructure
audio.route.environment.ambience
audio.route.weather
audio.route.ui
```

## 21.2 Metadata

| Field | Purpose |
|---|---|
| primary_category | High-level player volume control and routing. |
| bus_intent | Requested 23G bus path. |
| priority | Relative survival under voice pressure. |
| concurrency_group | Which similar sounds compete. |
| ducking_role | May request duck or be protected from ducking. |
| reverb_send_intent | Dry, normal, strong or custom send. |
| low_frequency_role | Accessibility and mix management. |
| caption_role | Caption category and priority. |
| distance_class | Expected near, local, regional or global use. |

## 21.3 Reserved Future Buses

Dialogue and Music categories are reserved now even though full authoring is deferred. Machine, magic and ambience events must not occupy those buses merely because they are unused in the MVP.

## 21.4 No Local Mix Hacks

An event cannot globally lower unrelated audio, reconfigure buses or create persistent bus effects without an approved mix snapshot or routing contract in 23G.

# 22. Concurrency, Priority, Voice Ownership and Virtualisation Interface

## 22.1 Voice Ownership

Every playing voice belongs to an event instance, loop owner, ambience system, UI system or managed cluster. Orphaned voices are validation and runtime errors.

## 22.2 Concurrency Scope

- Per emitter.
- Per entity.
- Per event.
- Per family.
- Per local cluster.
- Per listener.
- Global critical cue.

## 22.3 Resolution Policies

| Policy | Behaviour |
|---|---|
| Reject New | Existing voices continue. |
| Stop Oldest | New sound replaces oldest eligible voice. |
| Stop Quietest | Replaces least audible eligible voice. |
| Stop Farthest | Replaces most distant voice. |
| Retrigger Existing | Restarts or reinforces one voice. |
| Merge/Cluster | Converts several sources into grouped playback. |
| Virtualise | Keeps logical phase without audible voice. |
| Promote Critical | Removes lower-priority decorative voice. |

## 22.4 Priority Classes

1. Safety-critical and accessibility-critical warnings.
2. Local player damage, parry, interaction and immediate threats.
3. Nearby combat and important NPC/creature telegraphs.
4. Active machine faults, ward breaches and quest/world-event cues.
5. Normal world actions and local ambience details.
6. Distant decorative loops and crowd texture.

Final arbitration belongs to 23G, but events must declare an honest class.

## 22.5 Virtualisation

A virtualised loop retains logical state, phase and parameter snapshot while consuming little or no audio voice cost. On promotion it resumes without replaying start unless the lifecycle contract requires a re-entry cue.

## 22.6 Aggregation Eligibility

Events declare whether they can be clustered. Individual named NPC dialogue cannot be merged like machine hum. Hundreds of similar distant furnaces can produce a regional industrial bed.

# 23. Accessibility, Captions, Critical Cues and Sensory Equivalence

## 23.1 Caption Definition

Important Sound Events may reference a localisable caption definition containing:

- Semantic text, not source filename.
- Category.
- Directional eligibility.
- Importance.
- Duration.
- Speaker/source identity rules.
- Repetition suppression.
- Accessibility-only or default-display status.

Examples:

```text
[Ward weakening]
[Goblin war horn in the distance]
[Furnace output blocked]
[Heavy footsteps approaching]
[Portal destabilising]
```

## 23.2 Sensory Equivalence

| Audio Meaning | Alternative Presentation |
|---|---|
| Machine warning | Voxel warning light, UI indicator and optional haptic pulse. |
| Off-screen attack telegraph | Directional indicator, reduced-flash VFX or controller cue. |
| Ward breach | Boundary pulse, caption and settlement alert. |
| Quiet nearby creature | Ground movement effect or directional threat cue where required. |
| High-frequency magic cue | Lower-frequency alternate layer and caption. |

## 23.3 Frequency and Comfort

Sound Forge supports:

- High-frequency-safe variants.
- Reduced bass-impact variants.
- Reduced startling-transient profiles.
- Tinnitus-sensitive alternatives where practical.
- Independent category levels.
- Mono compatibility checks.
- Caption and directional-audio options.

## 23.4 Critical Cue Validation

A critical cue must remain detectable after:

- User category-volume changes within supported bounds.
- Dense-scene voice pressure.
- Distance and occlusion rules.
- Reduced-effects settings.
- Low-quality audio settings.
- Virtualisation and clustering.

If the cue cannot remain audible, its alternative channel must remain present.

## 23.5 Caption Restraint

Decorative audio should not flood captions. Ambient beds, repeated footsteps and ordinary machine loops normally remain uncaptioned unless they carry threat or required state information.

# 24. Inheritance, Overrides, Culture, Dimension and State Variants

## 24.1 Inheritance

A child Sound Event may inherit:

- Family membership.
- Layer roles.
- Processing chains.
- Variation rules.
- Parameter maps.
- Routing intent.
- Captions.
- Budget class.
- Accessibility alternatives.

The child overrides only declared fields.

## 24.2 Example Family

```text
sound.event.machine.furnace_base
├── furnace_wood_fired
├── furnace_coal
├── furnace_mana
├── furnace_dwarven
├── furnace_fae
└── furnace_corrupted
```

Shared lifecycle remains stable. Variants may replace body, texture, magical layer and routing sends while preserving event contracts.

## 24.3 Culture Variants

Cultures may alter instruments, construction materials, work rhythms, bells, ritual tones, creature handling and settlement ambience. Culture variants should express identity without requiring every common action to be completely rebuilt.

## 24.4 Dimension Variants

Dimension packs may supply environment, portal, material and magical-family overrides. Overworld fallbacks remain available unless the content intentionally requires dimension-specific audio.

## 24.5 State Overlays

Wet, damaged, corrupted, enchanted, overheated and low-power audio should usually compose as overlays or parameter states rather than replacing the entire event. 23C channel and priority rules govern conflicts.

## 24.6 Override Safety

Overrides are deterministic, inspectable and provenance-aware. Missing overrides fall back through declared parent chains. A content pack cannot silently replace safety-critical captions or warnings without validation.

# 25. Multiplayer, Prediction, Reconciliation and Replay

## 25.1 Authority

The authoritative simulation decides which gameplay events occurred. Clients receive validated presentation events or state updates and locally render Sound Events according to shared definitions and user settings.

## 25.2 Prediction

Low-risk local actions may predict audio for responsiveness, such as player swings or UI interactions. Confirmed impacts, resource completion and high-consequence events require authoritative confirmation.

## 25.3 Reconciliation

If a predicted event is rejected:

- Short non-critical audio may be allowed to finish.
- Loops must stop or transition safely.
- Incorrect impact follow-ups must not play.
- Duplicate confirmed audio must be suppressed.
- Debug traces record prediction and reconciliation.

## 25.4 Network Payload

Prefer sending event ID, emitter identity, timestamp, seed, spatial/contact data and required context rather than raw audio choices. Clients resolve the same family where consistency matters.

## 25.5 Late Joining

Late joiners reconstruct managed loops and meaningful persistent ambience from current authoritative state. They do not replay every historical one-shot.

## 25.6 Replay

Recorded Presentation Context Packets and lifecycle updates allow deterministic laboratory replay. Audio files and event versions used by the trace are recorded for compatibility diagnostics.

## 25.7 Local User Settings

Volume, accessibility variants and decorative-density settings remain local. They do not alter authoritative gameplay or other players' events.

# 26. Persistence, Unloaded-World Reconstruction and Save Boundaries

## 26.1 What Persists

Sound itself is not saved as raw playback state for ordinary one-shots. Persist or reconstruct only:

- Managed loop owner state.
- Important phase or parameter snapshot when required.
- Active world event or ritual stage.
- Persistent structure or machine condition.
- Ambience-driving biome, weather and settlement state.
- User audio/accessibility settings.

## 26.2 What Does Not Persist

- Decorative one-shot history across sessions.
- Every footstep or impact.
- Individual distant crowd voices.
- Fully mixed audio buffers.
- Temporary processing state with no audible reconstruction value.

## 26.3 Load Reconstruction

On load, current machine, magic, weather and world states produce their present loops. Start one-shots do not replay unless the gameplay state indicates a fresh start.

## 26.4 Unloaded Regions

Distant simulation may track that a factory operates or a storm continues, but it does not simulate audible voices. When promoted, 23G constructs appropriate cluster or local events from current state.

## 26.5 Migration

If a Sound Event ID changes or is deprecated, migration maps saved loop-owner references and replay traces. Missing non-critical decorative events may fall back; missing critical events block compatibility approval.

# 27. Performance Budgets, Compression, Streaming and Memory

## 27.1 Budget Classes

| Budget Class | Typical Use | Expected Behaviour |
|---|---|---|
| audio.ui.critical | Menus and safety-critical UI. | Protected, short, non-spatial. |
| audio.player.action | Local movement, combat and interaction. | High priority, low latency. |
| audio.creature.voice | Nearby creature communication. | Limited per entity/family, distance-managed. |
| audio.machine.loop | Repeating industry. | Virtualised, clustered and phase-continuous. |
| audio.magic.infrastructure | Mana, wards and portals. | Parameter-driven, aggregation-aware. |
| audio.environment.detail | Birds, drips and local details. | Strict density and concurrency. |
| audio.ambience.bed | Long environmental layers. | Streamed, few simultaneous beds. |
| audio.world.stinger | Raid, boss, portal or major event. | Priority and caption protection. |

## 27.2 Compression and Import Profiles

- Short latency-sensitive one-shots may be preloaded and compressed for quick decode.
- Long ambience and music-like beds should stream.
- Loops require codec and seek behaviour compatible with seamless playback.
- Source quality and platform target determine final encoding.
- One import profile does not fit all sounds.

Exact codec and bitrate values remain implementation and platform decisions in 23I/23J.

## 27.3 Memory Estimation

The Forge estimates:

- Decoded/preloaded memory.
- Stream buffer memory.
- Source count and duplication.
- Runtime processing cost.
- Maximum simultaneous child voices.
- Preview and editor cache.

## 27.4 Cost Reduction Order

```text
remove inaudible decorative layers
→ reduce variation memory and secondary tails
→ cluster eligible emitters
→ virtualise loops
→ lower processing quality
→ use fallback event
→ preserve critical semantic cue only
```

## 27.5 Dense Scene Tests

- Busy market.
- Blacksmith and sawmill district.
- Rain during a village raid.
- Multiple mana machines and wards.
- Cave combat with many creatures.
- Split-screen players in different audio environments.
- Portal activation near operating machinery.

# 28. Validation, Diagnostics, Review and Quality Assurance

## 28.1 Validation Categories

| Category | Example Checks |
|---|---|
| Identity | Valid stable IDs, namespace and status. |
| Source | File exists, supported format, provenance and rights approved. |
| Signal | No unintended clipping, DC offset, clicks or unusable silence. |
| Layers | Roles valid, gain ranges safe, no unreachable layers. |
| Event | No cycles, bounded nesting, legal modes and conditions. |
| Variation | Valid weights, history, cooldown and loudness consistency. |
| Loop | Seamless region, transition, owner and stop policy. |
| Contract | Legal events, fields, ranges and lifecycle. |
| Spatial | Valid anchor/socket and fallback where required. |
| Routing | Existing intent, honest priority and concurrency. |
| Accessibility | Required caption and alternative cues exist. |
| Performance | Voice cost, memory, streaming and processing within budget. |
| Packaging | All dependencies and generated products included. |

## 28.2 Severity

- Info: authoring suggestion.
- Warning: review required but preview may continue.
- Error: cannot approve or bake production output.
- Blocker: rights, corruption, schema or safety issue preventing project use.

## 28.3 Diagnostics

The inspector should show:

- Current selected sources and history state.
- Layer start/stop times.
- Parameter values and curve outputs.
- Event lifecycle and owner.
- Voice/concurrency decision.
- Routing intent and priority.
- Virtualisation state.
- Caption decision.
- Source provenance.
- Compiled event-plan cost.

## 28.4 Listening Review

Review modes include:

- Solo layer.
- Full event.
- Variation audition.
- Rapid repetition stress test.
- Loop-boundary test.
- Parameter sweep.
- Distance/acoustic context preview.
- Dense-scene mix preview.
- Accessibility variant comparison.
- Mono and low-quality preview.

## 28.5 Approval Roles

A project may require creative audio review, technical validation, rights review and gameplay-readability review. One automated pass cannot replace these responsibilities.

# 29. Creator Workflow, Preview, Test Laboratory and Approval

## 29.1 Standard Workflow

1. Create or select an Audio Family/template.
2. Import or record sources with provenance.
3. Trim and classify source candidates.
4. Assign semantic layers.
5. Build event mode and variation.
6. Bind legal event/state/context inputs.
7. Set timing, loop and lifecycle.
8. Assign routing, priority, concurrency and caption metadata.
9. Select spatial reference or runtime-contact rule.
10. Preview across contexts and parameters.
11. Run validation and dense-scene tests.
12. Submit for review.
13. Approve and bake runtime products.

## 29.2 Preview Environments

- Open field.
- Forest.
- Cave.
- Timber cottage.
- Stone hall.
- Village street.
- Workshop.
- Machine hall.
- Mana chamber.
- Dungeon.
- Underwater.
- Portal space.

23G defines acoustic behaviour, but Sound Forge must be able to audition its event in those contexts.

## 29.3 Context Simulator

Creators can set source/target material, action, intensity, speed, wetness, damage, magic school, machine load, environment, weather and distance. The simulator displays which branch and layers resolve.

## 29.4 Runtime Capture and Replay

A captured trace from the game can replay:

```text
00.00 machine.processing_started
00.10 state.active = true
04.40 param.output_fill = 1.0
04.42 state.blocked = true
06.80 state.blocked = false
06.90 processing resumed
```

Creators adjust loops, warning timing and transitions without reproducing the situation manually.

## 29.5 A/B Comparison

The Forge supports revision comparison for source selection, layer balance, variation, loop transitions and accessibility variants. Loudness-matched comparison is preferred where applicable.

# 30. Summer Engine-Assisted Authoring and Automation Boundaries

## 30.1 Approved Assistance

Summer Engine may assist with:

- Source classification and tagging.
- Duplicate detection.
- Suggested trim and fade points.
- Loop-region candidates.
- Click and clipping detection.
- Layer-role suggestions.
- Family/template recommendations.
- Pitch and gain variation suggestions.
- Parameter-curve first passes.
- Caption draft labels.
- Missing-contract and missing-variant detection.
- Budget and concurrency warnings.
- Test scenario generation.
- Accessibility alternative suggestions.

## 30.2 Required Human Decisions

Humans approve:

- Creative identity.
- Rights and provenance.
- Final source use.
- Captions and semantic meaning.
- Critical priority.
- Cultural interpretation.
- Comfort and accessibility.
- Production approval.

## 30.3 Prohibited Automation

- Inventing licence rights or creator attribution.
- Uploading private sources to unapproved external services.
- Replacing approved assets without review.
- Creating unrestricted runtime code from an event.
- Changing gameplay event contracts silently.
- Marking generated content Approved automatically.

## 30.4 Provenance for Generated Audio

Generated audio records tool/service, model or method where known, prompt or generation settings when permitted, creation date, human editor, licence terms and approval status.

# 31. Minimum Viable Sound Forge and Initial Library

## 31.1 MVP Authoring Features

- Source import and provenance records.
- Waveform, trim, fade and loop editing.
- Semantic layers.
- Basic processing chains.
- Single, layered, random, shuffle, sequence, switch, blend and managed-loop events.
- Bounded gain/pitch/start variation.
- Event Contract and context binding.
- Parameter curves and smoothing.
- Routing intent, priority and concurrency metadata.
- Caption and accessibility references.
- Preview scenarios, validation and baking.

## 31.2 MVP Audio Families

| Domain | Required Families |
|---|---|
| Movement | Footsteps, landing, jump, wade and equipment movement. |
| Blocks | Place, break, mine and debris contact for core materials. |
| Combat | Swing, projectile release, impact, block, parry and damage. |
| Creatures | Passive wildlife, night monster, cave threats, goblin and wisp. |
| Machines | Furnace, mana furnace, chute/transport and warning lifecycle. |
| Magic | Mana pickup, rune interaction, ward idle/contact/breach and simple spells. |
| Village | Construction, blacksmith/work, warehouse, bell/raid warning and ambience details. |
| Environment | Forest day/night, cave, river, rain, thunder and fire. |
| UI | Core confirm, cancel, inventory, crafting and warning cues. |

## 31.3 MVP Material Families

- Soil/dirt.
- Grass/foliage.
- Sand/gravel.
- Stone.
- Wood.
- Leaves/fibre.
- Copper.
- Iron/steel.
- Glass/crystal.
- Mana crystal.
- Cloth/leather.
- Flesh/chitin.
- Water.

## 31.4 MVP Success Criteria

- No required event uses an unverified source.
- Repeated footsteps and mining contacts avoid obvious immediate repetition.
- Furnace and mana-furnace loops start, update, block, resume, stop and virtualise correctly.
- Goblin attack telegraphs remain readable during rain and village activity.
- Ward low-power and breach cues have captions and visual alternatives.
- Dense village audio remains within voice and memory budgets.
- Saved/reloaded machines resume current loops without replaying incorrect starts.

# 32. Forest Hamlet Integrated Audio Scenario

## 32.1 Morning Village

The player approaches the Forest Hamlet. A broad forest bed and sparse birds establish the biome. The river is a positioned emitter. Nearby villagers contribute bounded job actions: a farmer works soil, a builder hammers the watchtower scaffold, a blacksmith produces occasional metal contacts and the warehouse door opens as supplies arrive. Distant work aggregates rather than producing one voice per NPC.

## 32.2 Mining and Supply

The player enters a cave. The ambience transitions to a cave bed with drips and spatial details. Iron pickaxe contacts resolve against stone and ore materials, using event-seeded variation. Crystal crawler movement and cave-spider cues occupy creature categories with threat priority. Block break and item pickup events are confirmed by gameplay before audio dispatch.

## 32.3 Furnace Chain

At the automation site:

```text
fuel added
→ furnace ignition
→ operating loop follows processing speed
→ timed metal/stone process contacts
→ output completes
→ item moves through chute
→ warehouse delivery cue
```

When output is blocked, the normal process contact stops, a strain overlay enters, the operating loop reduces and a warning event plays. Clearing the output transitions back without replaying ignition.

## 32.4 Mana Infrastructure

The player refines Mana Crystal, activates a basic rune and powers a mana furnace. Crystal, energy and mechanical layers form a hybrid event. Mana flow controls tonal intensity. The ward lantern produces a subtle local hum, contact ripples when struck and a protected low-power warning when supply falls.

## 32.5 Rain and Shelter

A storm begins. Wind and rain beds increase. Surface contact resolves by exposed ground, foliage, water and roof materials through aggregated weather families. Entering a timber building changes the acoustic context and roof response without spawning a sound for every rain voxel.

## 32.6 Goblin Raid

A distant goblin war horn and village bell announce the raid. Captions identify direction and meaning. Goblin voices use alert, attack and hurt families with repeat avoidance. Footsteps vary by ground and equipment. Combat events separate swings from confirmed impacts. The completed watchtower contributes bow releases, guard calls and ward responses.

## 32.7 Aftermath

If the village succeeds, combat layers stop, remaining fire and damage loops persist according to world state, villagers react, repair actions begin and the village ambience gradually returns. If structures burn or the ward collapses, current state reconstructs correctly after save/load.

## 32.8 Scenario Validation

The laboratory tests:

- Local action clarity over rain and machines.
- Raid warning priority.
- Caption density.
- Machine loop lifecycle.
- Material contact accuracy.
- Creature voice repetition.
- Indoor/outdoor transition.
- Virtualisation and promotion.
- Save/load reconstruction.
- Split-screen listener separation.

# 33. Balancing and Authoring Rules

1. Every Sound Event must communicate an action, state, place, identity or atmosphere worth hearing.
2. Gameplay truth always precedes outcome audio.
3. Frequently repeated actions require purposeful variation.
4. Layer count is justified by role, not by maximum fullness.
5. Critical cues survive decorative density and performance reduction.
6. Loops have owners, start/stop policies and phase-continuity rules.
7. Material families use scalable grammar and explicit overrides, not exhaustive pair duplication.
8. Sources retain provenance and rights records.
9. Runtime processing is used only where real-time control adds value.
10. Distant machines, crowds and weather aggregate rather than creating unbounded voices.
11. Captions describe meaning, not filenames or production notes.
12. Culture and dimension variants inherit common contracts where possible.
13. Important audio has non-audio alternatives.
14. Silence is preferable to meaningless noise.
15. The Forge warns early when an event cannot meet budget, accessibility or contract requirements.

# 34. Explicit Deferrals and Open Questions

## 34.1 Deferred to 23G

- Full material response matrix authoring.
- Attenuation curves and distance models.
- Occlusion and obstruction.
- Acoustic zones, sound portals and generated room profiles.
- Ambience scheduling and biome-zone blending.
- Final bus hierarchy, snapshots, ducking and mastering rules.
- Detailed voice manager and cluster renderer.

## 34.2 Deferred to 23H

- Final unified UI layout.
- Detailed keyboard/controller workflows.
- Multi-monitor and waveform workspace customisation.
- Complete Test Laboratory scene catalogue.
- User onboarding and tutorial design.

## 34.3 Deferred to 23I

- Godot class architecture.
- Import plugin implementation.
- Runtime event evaluator.
- Threading, pooling, streaming and platform abstraction.
- Network transport and replay storage.
- Build pipeline and hot reload.

## 34.4 Deferred to Future Audio Modules

- Full dialogue recording and editorial workflow.
- Voice casting and performance management.
- Lip-sync generation and facial animation links.
- Voice localisation and dubbing.
- Music composition and adaptive score graph.
- Stem management and interactive musical transitions.
- Advanced restoration, spectral repair and mastering suite.

## 34.5 Open Questions for Production

- Final target loudness and metering standards by platform.
- Exact codec, bitrate and preload thresholds.
- Maximum simultaneous voices by hardware tier.
- Whether selected creature vocal families require formant-preserving runtime control or baked variants.
- The scale of original Foley recording versus licensed library use.
- Which cultures require dedicated sonic-language design during first production phase.
- Whether user-generated content may import arbitrary audio and under which moderation/security rules.

# Appendix A. Sound Event Data Template

```text
SoundEventDefinition
{
    event_id
    display_name_key
    family_id
    event_mode
    project_id
    production_status

    contract_inputs[]
    context_requirements[]
    state_requirements[]
    spatial_reference_policy

    layers[]
    child_events[]
    selectors[]
    sequence_stages[]
    loop_definition
    parameter_maps[]

    routing_intent
    priority_class
    concurrency_group
    max_voices
    aggregation_policy
    virtualisation_policy
    streaming_policy
    budget_class

    caption_id
    accessibility_profile_id
    fallback_event_id

    deterministic_policy
    revision
    dependencies[]
    validation_status
}
```

# Appendix B. Audio Family and Layer Templates

## B.1 Audio Family Template

```text
AudioFamilyDefinition
{
    family_id
    display_name_key
    domain
    required_context[]
    optional_context[]
    required_layer_roles[]
    optional_layer_roles[]
    allowed_event_modes[]
    variation_requirements
    parameter_contracts[]
    routing_default
    priority_default
    concurrency_default
    budget_default
    caption_policy
    accessibility_requirements[]
    parent_family_id
    variant_dimensions[]
    validation_rules[]
}
```

## B.2 Audio Layer Template

```text
AudioLayerDefinition
{
    layer_id
    role
    source_or_procedural_id
    start_offset
    trim_start
    trim_end
    gain
    pitch
    envelope
    processing_chain_id
    probability
    selector_conditions[]
    parameter_maps[]
    loop_region
    routing_override
    debug_label
}
```

# Appendix C. Core Processing Operation Catalogue

| Operation ID | Purpose | Runtime/Bake Guidance |
|---|---|---|
| audio.op.trim | Define active source range. | Bake metadata/product. |
| audio.op.fade | Prevent abrupt start/end. | Bake unless parameterised. |
| audio.op.gain | Set layer level. | Runtime-safe. |
| audio.op.envelope | Shape attack, sustain and release. | Runtime or bake. |
| audio.op.eq | Correct or shape tone. | Bake fixed settings; runtime for state control. |
| audio.op.high_pass | Remove low content or drive state filter. | Both. |
| audio.op.low_pass | Distance, occlusion or state tone. | Runtime when contextual. |
| audio.op.compressor | Control dynamics. | Prefer bake for fixed source; bus use in 23G. |
| audio.op.limiter | Prevent overflow. | Bake/event safety; mastering in 23G. |
| audio.op.pitch | Static or parameter pitch. | Runtime within approved range. |
| audio.op.time_stretch | Change duration. | Prefer baked variants. |
| audio.op.saturation | Add character. | Bake fixed; runtime sparingly. |
| audio.op.distortion | Damage/corruption/machine strain. | Runtime sparingly. |
| audio.op.bit_reduce | Specific magical/ancient style. | Not a universal treatment. |
| audio.op.delay | Echo or rhythmic support. | Bounded; environment use in 23G. |
| audio.op.noise | Procedural texture. | Runtime bounded or baked. |
| audio.op.oscillator | Tonal support layer. | Runtime bounded. |
| audio.op.crossfade | Blend sources or loop stages. | Runtime/bake. |
| audio.op.reverse | Stylised source use. | Bake. |
| audio.op.channel_mix | Mono/stereo utility. | Bake. |

# Appendix D. Initial Sound Library Catalogue

| Category | Initial Event Examples |
|---|---|
| Footsteps | boot_dirt_walk, boot_stone_run, bare_wood_walk, goblin_gravel_run, spider_stone_crawl |
| Blocks | dirt_place, stone_break, wood_place, glass_break, mana_crystal_mine |
| Tools | crude_pick_stone, iron_pick_ore, axe_wood, hammer_construction, wrench_machine |
| Combat | sword_swing_light, sword_stone_impact, shield_block, bow_release, arrow_wood_impact |
| Player | jump, landing_light/heavy, hurt, eat, drink, inventory_interact |
| Goblin | idle, alert, attack_prepare, attack_release, hurt, death, war_horn |
| Cave creatures | spider_alert, spider_attack, crawler_crystal_move, crawler_hit |
| Wisp | idle_mote, notice, mana_interact, ward_contact |
| Furnace | fuel_add, ignite, work_loop, blocked, damage_overlay, output_complete, shutdown |
| Mana furnace | charge, work_loop, unstable, output_complete, shutdown |
| Automation | chute_item, crate_receive, gear_small_loop, warning_bell |
| Magic | mana_pickup, rune_carve, spell_charge, spell_release, ward_idle, ward_breach |
| Village | builder_hammer, blacksmith_anvil, warehouse_door, village_bell, crowd_light |
| Environment | forest_day, forest_night, cave_bed, river_medium, fire_small, rain_open, rain_roof_wood, thunder |
| UI | confirm, cancel, error, inventory_open, craft_complete, quest_update, critical_warning |

# Appendix E. Validation Code Register

| Code | Severity | Meaning |
|---|---|---|
| SND-001 | Error | Sound Event has no stable ID or invalid namespace. |
| SND-002 | Blocker | Source provenance or rights are unresolved. |
| SND-003 | Error | Referenced source file is missing or corrupt. |
| SND-004 | Warning | Source contains clipping, DC offset or excessive silence. |
| SND-005 | Error | Event graph contains a cycle or exceeds nesting depth. |
| SND-006 | Error | Managed loop has no lifecycle owner or stop policy. |
| SND-007 | Warning | Loop boundary may click or drift. |
| SND-008 | Warning | Repeated family has insufficient variation. |
| SND-009 | Error | Parameter reads undeclared contract field. |
| SND-010 | Error | Required spatial reference has no valid fallback. |
| SND-011 | Error | Critical cue has no caption or approved alternative. |
| SND-012 | Warning | Event voice cost exceeds recommended budget. |
| SND-013 | Error | Concurrency policy can create unbounded voices. |
| SND-014 | Warning | Variation creates inconsistent loudness or identity. |
| SND-015 | Error | Routing intent or family reference is missing. |
| SND-016 | Warning | Real-time processing should be baked or simplified. |
| SND-017 | Error | Override removes protected critical behaviour. |
| SND-018 | Warning | Caption repeats too frequently or lacks semantic text. |
| SND-019 | Error | Generated audio lacks required provenance. |
| SND-020 | Warning | Event has no tested low-quality or virtualised fallback. |

# Appendix F. MVP Acceptance Matrix

| Requirement | Acceptance Test |
|---|---|
| Source governance | All MVP sources expose complete provenance and approval. |
| Layer authoring | Creators can build and audition layered impacts and machine events. |
| Variation | Footsteps, mining and goblin calls pass rapid repetition tests. |
| Events | All MVP event modes compile and play through validated contracts. |
| Loops | Furnace and mana-furnace loops transition, stop and resume correctly. |
| Parameters | Machine speed, load, heat and mana control approved curves. |
| Material contact | Core materials resolve correct footsteps, mining and impact families. |
| Spatial references | Sockets and runtime contacts resolve with LOD fallbacks. |
| Accessibility | Ward breach, raid horn and machine blockage have captions/alternatives. |
| Performance | Dense Forest Hamlet scenario remains within target voice and memory budgets. |
| Multiplayer | Predicted and confirmed events avoid duplication; late join reconstructs loops. |
| Persistence | Save/load restores current managed loops without replaying false starts. |
| Validation | Blocking defects prevent approval and bake. |
| Runtime products | Godot-facing event definitions and audio products regenerate from canonical source. |

# Appendix G. Cross-Document Integration Matrix

| Document/System | Sound Forge Dependency | Sound Forge Output |
|---|---|---|
| 23A | Profiles, channels, budgets, accessibility and shared identity. | Sound Event components for Presentation Profiles. |
| 23B | Anchors, sockets, regions, zones and fallbacks. | Source-reference requirements and attachment metadata. |
| 23C | Events, states, context, lifecycle and resolver. | Compiled event plans and legal parameter consumers. |
| 23D/23E | Coordinated VFX timing and profile composition. | Shared event timing and optional audio markers. |
| 23G | Spatialisation, acoustics, material matrix, ambience and mix. | Routing intents, source shapes, families, budgets and event content. |
| 23H | Unified UI and Test Laboratory. | Authoring panels, diagnostics and preview requirements. |
| 23I | Godot implementation and runtime architecture. | Canonical data schemas and behaviour contracts. |
| 23J | Libraries, production, testing and migration. | Initial catalogue, governance and acceptance criteria. |
| Blocks/Items | Materials, states and actions. | Contact, place, break, equipment and use events. |
| Automation | Machine states and parameters. | Lifecycle loops, contacts, warnings and aggregation metadata. |
| Magic | Mana, runes, wards and spell contracts. | School/family audio, sequences and infrastructure loops. |
| Creatures/NPCs | Behaviour, movement and threat events. | Voice families, body audio, job actions and captions. |
| World/Structures | Biomes, weather, rooms, openings and state. | Ambient components, source intents and future acoustic metadata. |
