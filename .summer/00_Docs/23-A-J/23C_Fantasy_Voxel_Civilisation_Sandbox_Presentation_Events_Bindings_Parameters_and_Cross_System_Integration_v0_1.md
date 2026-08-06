# Fantasy Voxel Civilisation Sandbox
## 23C - Presentation Forge
### Presentation Events, Bindings, Parameters and Cross-System Integration
**Version 0.1 - Detailed Design Bible Draft**

A contract-driven integration system that lets authoritative gameplay, animation, automation, magic, creature, structure, weather and world systems request consistent audio, three-dimensional voxel VFX, lights, trails, persistent surface presentation and accessibility feedback without placing gameplay logic inside presentation assets.

*Working design document - event contracts, state parameters, context packets, binding resolution, composition, cross-system interfaces, multiplayer authority and replay foundation*

## Presentation Event and Binding System Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Event Contract Registry, State and Parameter Contract Registry, Presentation Context Packet, trigger lifecycle, presentation bindings, profile dispatch, material and contact resolution, parameter mapping, composition, temporal controls, cross-system integration, multiplayer authority, replay, validation and Forest Hamlet MVP tests. |
| Core Philosophy | Authoritative systems publish declared events and read-only state through versioned contracts. The Presentation Forge resolves and communicates those facts; it does not decide whether gameplay actions succeed or mutate authoritative state. |
| Event Identity | Every reusable event has a stable ID, owner, schema version, payload definition, authority policy, expected frequency, replication policy, replay policy, persistence class and accessibility importance. |
| State Identity | Continuous presentation reads only approved typed parameters with declared ranges, units, update rates, smoothing rules, privacy rules and fallback values. Presentation graphs cannot inspect arbitrary game objects. |
| Context Direction | A Presentation Context Packet carries source, target, action, intensity, materials, environment, spatial contact, state snapshot, player relevance, accessibility and network information required for resolution. |
| Binding Direction | Bindings connect event or state contracts to Presentation Profiles, audio events, voxel effects, light profiles, surface layers, captions, direction indicators, camera references and haptic references through semantic spatial references from Document 23B. |
| Resolution Direction | Resolution follows deterministic specificity rules: explicit binding, asset or family override, action/material response, culture or biome variant, content-pack override, accessibility variant, budget fallback and safe default. |
| Parameter Direction | Parameters are typed and normalised where practical. Mapping curves, dead zones, quantisation, hysteresis, smoothing and thresholds convert raw state into readable presentation without changing the source state. |
| Composition Direction | Presentation combines channels for base operation, environment, damage, magic, warning, temporary events and accessibility. Priority, exclusivity, additive rules, masks and critical-cue protection prevent destructive conflicts. |
| Temporal Direction | Cooldowns, repeat suppression, aggregation windows, sequence IDs, loop ownership, phase continuity and event de-duplication prevent spam and preserve correct start/loop/stop behaviour. |
| Cross-System Direction | Combat, blocks, items, animation, NPCs, creatures, automation, magic, structures, weather, quests, villages, world generation and UI integrate through explicit adapters and contract catalogues rather than bespoke one-off callbacks. |
| Multiplayer Direction | The authoritative simulation confirms meaningful events and state. Clients resolve local presentation from replicated compact context, with controlled prediction for low-risk feedback and reconciliation for confirmed outcomes. |
| Replay Direction | Presentation-relevant event traces can be captured, versioned and replayed in the Forge laboratory. Replays store contract IDs, timestamps and compact payloads rather than rendered particles or mixed audio. |
| Accessibility Direction | Event contracts mark information importance and required equivalents. Bindings must preserve critical cues through captions, visual indicators, sound alternatives, reduced-motion variants and reduced-flash variants. |
| Runtime Direction | Runtime services use compact registries, cached resolution plans, bounded event queues, pooled component dispatch, aggregation, virtualisation and simulation LOD. |
| Implementation Context | Godot with Summer Engine remains the target. Contracts and bindings bake into reviewable project resources. Summer Engine may suggest bindings, adapters and tests, but cannot silently redefine authoritative schemas. |
| MVP Direction | Prove footsteps, mining impacts, a furnace state cycle, mana conduit or ward behaviour, creature attack timing, rain and shelter response, structure completion, raid warnings, accessibility equivalents, multiplayer-safe event handling and runtime capture/replay. |
| Relationship to Later Documents | 23D-23G author the VFX and audio assets dispatched by this system; 23H defines the unified editor; 23I implements runtime services; 23J supplies production registries, libraries, tests and migration content. |

## Document Purpose

Documents 23A and 23B establish the Presentation Forge identity and its stable spatial language. This document defines the communication layer between authoritative gameplay and authored presentation. It explains how the game announces that a foot touched wet stone, a pickaxe struck iron ore, a furnace became blocked, a ward was breached, a goblin captain began an attack, a structure stage completed or rain entered an exposed room, and how those facts are converted into consistent sensory feedback.

The system must replace fragile direct calls such as `play_smoke_here`, scene-node path lookups and hard-coded sound names with versioned contracts and data-driven bindings. A source system should publish a meaningful event or expose an approved state parameter. The Presentation Forge should then resolve the correct profile from context, find the required spatial references, compose it with current persistent states, apply accessibility and budget rules, and dispatch bounded runtime components.

The design must serve simple and complex content equally. A basic footstep should be cheap to declare and inherit from material families. A boss ability may use charge, release, impact and aftermath contracts with animation markers, target context, spatial paths and accessibility obligations. A machine loop may bind continuously to speed, heat, fuel and blocked state while preserving loop phase through LOD transitions. These cases use the same core architecture rather than separate presentation logic.

This document does not define the internal node catalogue of the VFX graph, every audio processor, the final mixer, or all Godot classes. Those are assigned to Documents 23D through 23I. It defines the contracts those systems must obey.

## Engine and Forge Status Note

Leyforge currently targets Godot with Summer Engine as the AI-native development environment. Event contracts, state contracts, context schemas, binding records and resolution tables must remain ordinary versioned project data. Runtime systems must operate without an online AI dependency. Summer Engine may inspect source code and registries, propose event adapters, generate binding candidates, identify missing payloads and create replay tests, but every schema change remains reviewable and migration-controlled.

## Design Sources

| Source | Relevant Direction | How 23C Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Visual effects, sound, lighting, animation, magic, machines, villages and danger must remain readable and interconnected. | Contracts communicate system truth consistently across survival, civilisation, automation and fantasy RPG presentation. |
| 01 - Core Gameplay Loop | Explore, gather, craft, build, interact, automate, defend, upgrade and expand form the main loop. | The event catalogue covers immediate tactile feedback and longer world-state transitions across the complete loop. |
| 03 - Blocks Registry | Blocks have materials, faces, states, damage, interactions, automation roles, magic roles and world-state evidence. | Block events expose contact material, struck face, state transitions, break stages and semantic spatial references. |
| 04 - Items Registry | Items carry material, quality, durability, charge, ownership and equipment state. | Item context contributes source material, quality, condition, equipment family and presentation overrides. |
| 07 - NPC Village System | NPCs and villages use schedules, jobs, construction, needs, warnings, raids, damage and reputation. | NPC and village adapters publish work, movement, construction, warning, celebration, mourning and threat contracts without presentation owning simulation. |
| 08 - Automation System | Machines use visible power, states, throughput, faults, mana, logistics and village supply. | Machine contracts support start, loop, stop, blocked, low-input, overload, damage, repair and network-flow presentation. |
| 09 - Magic System | Mana, runes, wards, spells, rituals, portals and corruption are practical infrastructure with risk. | Magic contracts carry school, element, charge, stability, purity, corruption and spatial-path context. |
| 10 - Creatures and Monsters | Creatures must be readable by movement, sound, behaviour, habitat, attacks and phases. | Creature adapters expose voice, locomotion, telegraph, release, impact, phase and death events with body-plan spatial roles. |
| 11 - Biomes and World Generation | Weather, ambience, caves, leylines, water, corruption and civilisation alter regional presentation. | Environment contracts supply biome, weather, shelter, acoustic-zone, mana-density and regional-state context. |
| 12 - Structures | Structures have construction stages, ownership, damage, restoration, activation and dynamic state. | Structure contracts support stage transitions, collapse, repair, door/portal state, zone changes and persistent presentation. |
| 15 - Quest and Event System | Authored and simulation-driven events have stages, objectives, persistent consequences and ownership. | Presentation event contracts remain distinct from quest logic while allowing quest and world events to request profiles. |
| 16 - Combat, Gear and Defence | Combat requires readable attacks, impacts, blocks, parries, damage types, status, defences and aftermath. | Combat adapters publish confirmed outcomes and contextual contacts; presentation never determines damage or hit success. |
| 17 - UI/UX System | UI is world-first, accessible, localisable and driven by authoritative view models. | Critical event contracts may request captions, directional indicators, UI warnings and controller feedback through stable references. |
| 18 - Technical Implementation Plan | Systems use stable IDs, event-driven modules, authority, validation, simulation LOD and data-driven registries. | 23C formalises a bounded presentation event bus, typed schemas, compact replication and versioned migration. |
| 23A - Presentation Forge Foundation | Gameplay owns truth; presentation uses profiles, context packets, material families, composition, accessibility and scaling. | 23C turns those principles into concrete contracts and resolution behaviour. |
| 23B - Spatial Attachment System | Presentation attaches through anchors, sockets, regions, paths, masks, zones, portals and runtime contacts. | Every binding resolves through stable semantic spatial references rather than raw node paths. |

## Static Table of Contents

- 1. Locked Presentation Event and Binding Identity
- 2. Approved Direction Summary
- 3. Event-Driven Presentation Architecture
- 4. Event Contract Registry
- 5. State and Parameter Contract Registry
- 6. Presentation Context Packet
- 7. Trigger Sources, Timing and Lifecycle
- 8. Presentation Binding Definitions
- 9. Resolver Pipeline and Selection Rules
- 10. Presentation Profiles and Component Dispatch
- 11. Parameter Mapping, Curves, Smoothing and Quantisation
- 12. Material, Surface and Contact Response Integration
- 13. State Composition, Channels, Priority and Conflict
- 14. Temporal Controls, De-duplication, Cooldowns and Sequences
- 15. Animation, Rig, Entity and Equipment Integration
- 16. Blocks, Items, Combat, Damage and Construction Integration
- 17. Automation, Power, Mana and Magic Integration
- 18. NPC, Creature, Village, Quest and Faction Integration
- 19. Structures, Blueprints, Worldgen, Weather and Environment Integration
- 20. UI, Accessibility, Captions, Directionality, Camera and Haptics
- 21. Multiplayer Authority, Replication, Prediction and Reconciliation
- 22. Persistence, Late Join, Unloaded World and Replay
- 23. Editor Workflow, Contract Browser, Debugger and Runtime Capture
- 24. Validation, Diagnostics, Testing and Migration
- 25. Performance, Event Budgets, Aggregation and Virtualisation
- 26. Minimum Viable Integration and Forest Hamlet Tests
- 27. Balancing Rules and Explicit Non-Goals
- 28. Open Questions for Later Documents
- Appendix A. Event Contract Data Template
- Appendix B. State and Parameter Contract Templates
- Appendix C. Presentation Context Packet Template
- Appendix D. Binding and Resolution Templates
- Appendix E. Recommended Contract Catalogue
- Appendix F. Cross-System Integration Matrix
- Appendix G. Validation and Acceptance Checklist
- Appendix H. Worked Examples

## 1. Locked Presentation Event and Binding Identity

The Presentation Event and Binding System is the declared communication boundary between authoritative simulation and sensory feedback. It converts meaningful game facts into presentation requests without allowing effects, sounds or editor-authored graphs to become hidden gameplay scripts.

| Locked Rule | A Presentation Forge resource may react only to registered event contracts, approved read-only state contracts, deterministic context resolution and stable spatial references. It may not call arbitrary gameplay methods, search unrestricted scene hierarchies or infer authoritative outcomes from visual proximity. |
| --- | --- |

### 1.1 Integration Promise

A developer should be able to inspect any event contract and answer:

- Which system owns and publishes it?
- What exactly happened?
- Which payload fields are guaranteed?
- Which fields are optional?
- Is the event authoritative, predicted, local-only or derived?
- How often can it occur?
- Does it replicate or replay?
- Which bindings consume it?
- Which critical accessibility equivalents are required?
- What happens when no specialised binding exists?

A content author should then be able to bind the contract without editing source code, select a Presentation Profile, map context parameters, choose spatial roles and preview every relevant state.

### 1.2 Identity Layers

| Layer | Meaning | Result |
| --- | --- | --- |
| Event contract | Stable declaration of a discrete occurrence. | Start, impact, completion, breach and similar moments have clear timing and payloads. |
| State contract | Stable declaration of readable continuous or categorical state. | Speed, heat, charge, damage and environment can drive loops and persistent layers. |
| Context packet | Immutable event-time snapshot assembled from source, target, world and spatial data. | Resolution is reproducible and does not perform uncontrolled object queries later. |
| Binding | Data record connecting a contract and conditions to one or more Presentation Profiles. | Content authors control presentation without changing gameplay code. |
| Resolver | Deterministic service that selects bindings, variants, fallbacks and accessibility/budget forms. | Equivalent situations produce coherent results across content families. |
| Dispatcher | Runtime service that starts, updates, aggregates, virtualises and stops presentation components. | Audio and VFX remain bounded and lifecycle-safe. |
| Trace record | Compact record of contracts, context and resolution decisions. | Debugging and replay can reproduce presentation problems. |

### 1.3 What This System Is Not

- It is not the gameplay event system for quests, AI decisions, combat damage or resource transactions.
- It is not a global unrestricted reflection layer over all runtime objects.
- It is not permission for VFX graphs or sound events to change health, inventories, machine progress or faction state.
- It is not a requirement to replicate every decorative event to every client.
- It is not a replacement for animation state machines, although animation may publish and consume declared presentation markers.
- It is not a substitute for spatial references defined in 23B.
- It is not a guarantee that every event creates visible or audible output; accessibility, relevance, distance, budgets and player settings may select alternatives or suppress decoration.

## 2. Approved Direction Summary

| Area | Locked Decision |
| --- | --- |
| Contract ownership | Each contract has one authoritative owner module and optional adapter producers. Ownership cannot be ambiguous. |
| Stable IDs | IDs describe semantic occurrences or state, not current implementation classes or scene nodes. |
| Event schemas | Event payloads are typed, versioned and forward-migrated. Required and optional fields are explicit. |
| State schemas | State parameters declare type, unit, valid range, update rate, fallback and whether smoothing is permitted. |
| Event categories | Use animation, interaction, contact, combat, machine, magic, creature, NPC, structure, environment, world, UI and lifecycle categories. |
| Context packet | Build a compact immutable packet at dispatch time. Optional context providers may enrich it within bounded rules. |
| Spatial resolution | Bindings reference 23B semantic anchors, sockets, regions, paths, zones, masks, portals or runtime anchors. |
| Profiles | Bind to Presentation Profiles wherever practical rather than wiring sound and VFX separately at every use site. |
| Resolver specificity | Prefer explicit asset binding, then family/template, action-material matrix, culture/biome variant and project default. |
| Material response | Source and target material, action and intensity are first-class resolver inputs. |
| Parameters | Use typed mapping functions with clamping, dead zones, quantisation, smoothing and hysteresis. |
| Composition | Use named channels and priority. Critical warnings cannot be hidden by decorative layers. |
| Temporal controls | Use sequence IDs, cooldowns, concurrency groups, repeat avoidance and aggregation windows. |
| Event frequency | Contracts declare expected maximum frequency and cost class so producers and consumers can be validated. |
| Prediction | Predict only low-risk local feedback. Confirmed gameplay outcomes wait for authority or reconcile safely. |
| Replay | Capture contract ID, time, source/target references, compact context and resolver result. Do not record rendered particles. |
| Persistence | Discrete temporary events are not saved. Persistent presentation derives from saved authoritative state or an approved persistent surface record. |
| Accessibility | Contracts classify informational importance and required equivalent channels. |
| Validation | Validate missing payload fields, invalid state reads, unresolved spatial roles, cycles, contradictory bindings and unbounded frequency. |
| MVP | Prove a representative event from every major pillar and at least one continuous state-driven presentation chain. |

## 3. Event-Driven Presentation Architecture

### 3.1 High-Level Flow

```text
authoritative system or animation marker
    -> Event/State Adapter
        -> Contract validation
            -> Context Packet assembly
                -> Binding Resolver
                    -> Presentation Profile selection
                        -> Spatial resolution
                            -> Composition and budget policy
                                -> Component Dispatcher
                                    -> VFX / audio / light / surface / accessibility output
                                        -> trace and diagnostics
```

The authoritative producer should not choose a low-level particle asset when a semantic contract and profile family can express the intent. For example, combat publishes `event.combat.impact_confirmed` with contact context. The resolver decides whether the result uses iron-on-stone sparks, wood splinters, mana-crystal shards or a reduced accessibility form.

### 3.2 Runtime Services

| Service | Responsibility |
| --- | --- |
| Contract Registry | Stores event, state and parameter schemas, versions, owners and policy. |
| Adapter Layer | Converts system-specific callbacks, animation markers and state records into registered contracts. |
| Context Builder | Collects bounded source, target, material, environment and spatial data. |
| Binding Registry | Stores contract-to-profile rules, conditions, overrides and fallback links. |
| Resolver | Selects the most specific valid binding and parameter set. |
| Composition Manager | Combines persistent channels and temporary events according to priority and masks. |
| Dispatcher | Starts, updates and stops runtime presentation components. |
| Budget Manager | Applies LOD, aggregation, concurrency, virtualisation and suppression. |
| Trace Recorder | Records contract dispatch, context, resolution and component lifecycle for debugging/replay. |
| Diagnostics Service | Reports missing contracts, payload mismatches, unresolved references, spam and lifecycle leaks. |

### 3.3 Source and Consumer Separation

A source system knows only the contract it owns and the data it promises. It does not require knowledge of which content pack currently supplies the sound or effect. A presentation asset knows only the declared payload, context fields and spatial roles it consumes. It does not depend on a concrete gameplay class.

This allows:

- gameplay code to change internally without renaming semantic contracts;
- presentation packs to replace profiles without forking gameplay code;
- multiple assets to share one contract family;
- validation to detect missing integration before runtime;
- replay traces to remain meaningful across visual revisions;
- multiplayer to replicate compact semantic events rather than asset-specific commands.

### 3.4 Adapter Boundaries

Adapters may:

- translate a system callback into a contract;
- copy declared authoritative fields into a payload;
- request approved context providers;
- resolve stable source and target IDs;
- attach a sequence or correlation ID;
- mark prediction or confirmation state.

Adapters may not:

- invent a hit result;
- modify gameplay state;
- perform expensive world scans;
- silently downgrade a required payload;
- select arbitrary presentation assets outside the binding resolver;
- expose private simulation data not declared by contract.

## 4. Event Contract Registry

The Event Contract Registry is the source of truth for discrete presentation-readable occurrences.

### 4.1 Event Contract Record

```text
PresentationEventContract
{
    event_id
    display_name
    owner_module
    schema_version
    category
    description
    authority_class
    timing_class
    persistence_class
    replication_policy
    replay_policy
    prediction_policy
    expected_frequency
    burst_limit
    importance_class
    required_payload_fields[]
    optional_payload_fields[]
    required_context_fields[]
    allowed_spatial_roles[]
    default_profile_family_id?
    accessibility_requirements[]
    deprecation_state
    migration_rules[]
    test_fixtures[]
}
```

### 4.2 Event Categories

| Category | Examples |
| --- | --- |
| Animation | foot contact, weapon release, tool contact, breath release, landing, loop marker. |
| Interaction | use, open, close, place, remove, harvest, pickup, equip, consume. |
| Contact | impact, scrape, roll, splash, enter surface, exit surface. |
| Combat | attack telegraph, impact confirmed, block, parry, guard break, damage applied, defeat. |
| Machine | start, active cycle, recipe step, output produced, blocked, fault, overload, shutdown. |
| Magic | cast start, charge threshold, commit, release, impact, ward breach, ritual stage, portal state. |
| Creature | voice, step, wing beat, attack phase, roar, stagger, phase transition, death. |
| NPC/Village | work action, construction stage, warning, celebration, mourning, market open, raid alarm. |
| Structure | door state, project stage, collapse, repair, activation, ownership change, restoration. |
| Environment | rain contact, shelter transition, lightning contact, wind gust, underwater transition. |
| World | biome state changed, corruption spread, leyline pulse, world event began or ended. |
| UI/Accessibility | tutorial cue, directional warning, objective update, caption-only informational event. |
| Lifecycle | spawned, promoted to detailed simulation, demoted, unloaded, restored from save. |

### 4.3 Authority Classes

| Class | Meaning | Example |
| --- | --- | --- |
| Server/host authoritative | Outcome is confirmed by the authoritative world simulation. | damage applied, machine output produced, village project completed. |
| Owner authoritative | Owning entity or subsystem confirms an internal state transition. | spell cast committed, creature phase changed. |
| Animation-authored marker | Marker is part of an approved animation clip and occurs within a confirmed action. | foot contact, weapon trail begin, breath release timing. |
| Client-predicted | Local client may present immediately, then reconcile. | local footstep, swing whoosh, UI interaction. |
| Client-local | Purely local and never affects shared state. | menu click, camera-local ambience transition. |
| Derived presentation event | Presentation service derives a secondary cue from an approved primary contract. | debris sub-impact, echo tail, secondary ember burst. |

Derived presentation events must remain inside presentation scope and cannot become authoritative evidence for gameplay.

### 4.4 Timing Classes

- **Instant:** one timestamp, such as an impact.
- **Begin:** starts a sustained sequence or state ownership.
- **Update:** optional bounded updates for an active sequence.
- **End:** stops or resolves a sustained sequence.
- **Threshold:** emitted when a typed state crosses a declared boundary.
- **Stage:** identifies a numbered or semantic step in a larger process.
- **Batch:** represents aggregated repeated occurrences within a time window.

Begin and End contracts should share a `sequence_id` or stable owner-state key so loops cannot become orphaned.

### 4.5 Payload Field Rules

Every field declares:

- stable field name;
- type;
- unit or enumeration;
- required or optional status;
- valid range;
- default only where semantically safe;
- privacy or replication restriction;
- deterministic serialisation form;
- schema introduction version;
- deprecation and migration rules.

A missing required field is an integration error. An optional field may alter specificity but must not make the event invalid.

### 4.6 Frequency and Cost Declaration

Contracts declare expected frequency:

| Frequency Class | Intended Use |
| --- | --- |
| Rare | boss phase, structure completion, portal opening. |
| Low | weapon impacts, machine faults, creature roars. |
| Moderate | footsteps, mining impacts, work actions. |
| High | rain contacts, debris ticks, dense machine pulses. |
| Aggregated | many equivalent occurrences represented as a batch or density value. |

A high-frequency contract cannot require heavyweight context queries or guaranteed network replication per occurrence. The registry must reject combinations that cannot meet budget.

### 4.7 Contract Versioning

Contract IDs remain stable across compatible schema revisions. Additive optional fields increment the schema version without creating a new semantic event. Breaking meaning changes require a new ID or an explicit migration adapter.

Deprecated contracts remain readable for migration and replay for a defined support window. The editor should show all consumers and producers before removal.

## 5. State and Parameter Contract Registry

Discrete events are insufficient for machine hum, mana flow, weather intensity, damage glow and similar continuous presentation. State contracts expose bounded read-only values.

### 5.1 State Contract Record

```text
PresentationStateContract
{
    state_id
    owner_module
    schema_version
    value_type
    unit
    valid_range
    default_value
    update_policy
    maximum_update_rate
    interpolation_policy
    quantisation_policy
    authority_class
    replication_policy
    privacy_class
    persistence_source
    fallback_policy
    allowed_consumers[]
    test_values[]
}
```

### 5.2 Approved Value Types

- Boolean.
- Integer.
- Normalised scalar.
- Bounded scalar with unit.
- Enumeration.
- Bit flags.
- Colour role or palette role ID.
- Vector or direction where justified.
- Stable resource ID.
- Small fixed-size array for declared cases.

Arbitrary object references, dictionaries of unknown shape and direct script instances are not approved contract values.

### 5.3 Common Parameter Families

| Family | Example State IDs |
| --- | --- |
| Motion | `state.motion.speed`, `state.motion.grounded`, `state.motion.surface_contact`. |
| Condition | `state.condition.damage_ratio`, `state.condition.wetness`, `state.condition.temperature`. |
| Machine | `state.machine.active`, `state.machine.speed_ratio`, `state.machine.heat_ratio`, `state.machine.blocked`. |
| Power | `state.power.load_ratio`, `state.power.available_ratio`, `state.power.flow_direction`. |
| Magic | `state.magic.charge_ratio`, `state.magic.stability_ratio`, `state.magic.corruption_ratio`, `state.magic.school`. |
| Creature | `state.creature.alertness`, `state.creature.phase`, `state.creature.health_band`. |
| Structure | `state.structure.damage_band`, `state.structure.construction_stage`, `state.structure.occupied`. |
| Environment | `state.environment.rain_intensity`, `state.environment.wind_speed`, `state.environment.shelter_ratio`. |
| Player relevance | `state.presentation.local_importance`, `state.presentation.camera_visibility`. |

### 5.4 Update Policies

| Policy | Behaviour |
| --- | --- |
| Event-on-change | Publish only when value changes meaningfully. |
| Fixed low-rate sample | Sample at a declared bounded rate such as 2-10 Hz. |
| Per-frame local | Allowed only for cheap local animation-linked values. |
| Threshold events plus current value | Use threshold contracts for important transitions and state reads for interpolation. |
| On-demand query | Resolver reads once at event time from an approved provider. |
| Virtualised summary | Distant systems expose an aggregate state rather than individual values. |

### 5.5 State Snapshot Rule

A discrete event should capture the state values required for its presentation when timing matters. A projectile impact should not resolve wetness or material several frames later if the surface may change. Continuous bindings may read current state through approved handles.

### 5.6 State Ownership and Privacy

Presentation may not expose hidden information to a client simply because a state is useful for an effect. Stealth, fog-of-war, unrevealed quest state and private inventories require privacy classification. The server or local authority decides which presentation-safe state is available to each observer.

## 6. Presentation Context Packet

The Presentation Context Packet is an immutable, compact description of the situation at the moment a contract is dispatched.

### 6.1 Context Structure

```text
PresentationContext
{
    context_version
    event_id
    event_timestamp
    sequence_id?
    authority_state

    source_entity_id?
    source_asset_id?
    source_family_id?
    source_faction_id?
    source_culture_id?
    source_material_id?
    source_quality?
    source_condition?

    target_entity_id?
    target_asset_id?
    target_family_id?
    target_material_id?
    target_condition?

    action_type?
    interaction_type?
    damage_type?
    magic_school?
    intensity?
    speed?
    mass_class?

    spatial_reference_id?
    runtime_anchor?
    world_position?
    surface_normal?
    struck_voxel?
    struck_face?
    region_hint?
    path_hint?

    biome_id?
    dimension_id?
    acoustic_zone_id?
    weather_state?
    shelter_ratio?
    wetness?
    temperature?
    mana_density?
    corruption_ratio?

    local_player_relevance?
    visibility_class?
    distance_band?
    accessibility_importance?
    deterministic_seed?

    custom_payload
}
```

### 6.2 Context Providers

Context may be assembled from bounded providers:

- source definition and runtime record;
- target definition and runtime record;
- material resolver;
- contact or collision result;
- 23B spatial reference resolver;
- environment and acoustic-zone service;
- weather service;
- magic and power network summary;
- local-player relevance service;
- accessibility settings;
- network authority metadata.

Providers declare cost and availability. A high-frequency event may use cached or reduced context rather than expensive live queries.

### 6.3 Required Versus Optional Context

A contract lists required context fields. A mining impact may require target material and runtime contact. Biome and wetness may be optional. A ward-breach contract may require ward family, breach position and severity. Failure to provide required context should produce a visible diagnostic and a safe fallback profile, not silent absence.

### 6.4 Context Immutability

Once dispatched, event-time context does not change. This ensures:

- deterministic replay;
- consistent material response;
- stable multiplayer reconciliation;
- no accidental dependence on later state;
- easier debugging of why a binding resolved.

Continuous state bindings use separate state handles and do not mutate the original packet.

### 6.5 Context Size Classes

| Class | Use |
| --- | --- |
| Tiny | ID, position, intensity and material tags for dense repeated events. |
| Standard | Typical combat, interaction, machine and magic event. |
| Extended | Rare boss, portal, structure or world event with additional semantic fields. |
| Aggregate | Count, density, bounds, dominant materials and time window for batched events. |

Extended context is not permitted on high-frequency replication paths without explicit approval.

## 7. Trigger Sources, Timing and Lifecycle

### 7.1 Trigger Sources

| Source | Contract Use |
| --- | --- |
| Gameplay system | Confirms interactions, combat outcomes, crafting, machine transitions and world events. |
| Animation marker | Supplies exact timing inside an already authorised action. |
| State threshold adapter | Converts meaningful threshold crossings into discrete contracts. |
| Spatial zone transition | Emits entry, exit or blend-boundary events. |
| Blueprint/structure state | Emits construction, activation, damage and restoration stages. |
| Environment service | Emits weather, shelter, water, biome and acoustic transitions. |
| Presentation sub-event | Generates bounded secondary presentation only, such as debris impact or echo tail. |
| Editor/replay fixture | Emits test contracts with known payloads. |

### 7.2 Animation Marker Rule

Animation markers may determine *when* a foot contact, breath release or tool strike is presented, but they do not prove the gameplay outcome. A marker can publish `event.animation.weapon_contact_window`, while combat publishes `event.combat.impact_confirmed` with the actual target contact. Bindings may use one or both depending on the effect.

### 7.3 Start, Update and Stop Ownership

Sustained presentation requires one owner key:

```text
owner_key = source stable ID + contract family + sequence ID or state slot
```

The owner key prevents duplicate loops and lets stop events terminate the correct instance. When the source unloads or changes LOD, the lifecycle manager virtualises or transfers ownership rather than leaving an orphan.

### 7.4 Event Ordering

Events from one sequence carry monotonically increasing sequence order or timestamps. Required ordering examples:

- charge start before charge threshold;
- release before projectile impact;
- machine start before active loop;
- blocked state before blocked warning;
- construction stage started before stage completed.

Out-of-order network arrival is buffered only within a small declared window. Late obsolete events are discarded with diagnostics where appropriate.

### 7.5 Cancellation

A sequence may end through:

- normal completion;
- interruption;
- source destruction;
- state invalidation;
- authority correction;
- LOD suppression;
- world unload.

Cancellation reasons may select different tails or stop behaviour but cannot fabricate gameplay aftermath.

### 7.6 Threshold Events

Threshold adapters should use hysteresis to avoid rapid toggling:

```text
enter_overheat at heat_ratio >= 0.85
exit_overheat at heat_ratio <= 0.75
```

Thresholds are defined by the owning gameplay system or an approved presentation adapter when purely presentational. Presentation thresholds must never change machine rules or damage.

## 8. Presentation Binding Definitions

A binding connects contracts and context to one or more profiles.

### 8.1 Binding Record

```text
PresentationBinding
{
    binding_id
    source_contract_id
    source_contract_version_range
    binding_scope
    owner_asset_or_family_id?
    conditions[]
    exclusion_conditions[]
    spatial_rules[]
    profile_id
    parameter_mappings[]
    composition_channel
    priority
    concurrency_group?
    cooldown_profile?
    accessibility_variant_rules[]
    lod_profile_id?
    replication_visibility_policy?
    fallback_binding_id?
    content_pack_priority
    validation_state
}
```

### 8.2 Binding Scopes

| Scope | Example |
| --- | --- |
| Global default | Generic heavy impact fallback. |
| Contract family | All footsteps or all machine warnings. |
| Material family | Stone footsteps, wood break, mana-crystal impact. |
| Asset family | All furnaces, all humanoids, all goblin weapons. |
| Specific asset | Unique ancient portal or boss. |
| Culture/faction | Dwarven forge rhythm, fae ward tone, goblin machinery. |
| Biome/dimension | Frost realm impacts, cavern ambience, void corruption. |
| Player setting | Reduced motion, reduced flash, audio description, family-friendly damage presentation. |
| Content pack override | Replacement presentation while preserving contract identity. |

### 8.3 Condition Types

Bindings may test declared context only:

- exact stable ID;
- family or tag membership;
- enum equality;
- scalar range or threshold;
- presence/absence of optional field;
- material pair;
- biome, dimension, culture or faction;
- source/target condition band;
- local relevance or distance band;
- accessibility mode;
- authority/prediction state;
- content-pack namespace.

Arbitrary script expressions are not approved shipped binding conditions.

### 8.4 Spatial Rules

A binding may specify:

- source anchor or socket;
- target anchor or socket;
- runtime contact point;
- region or surface mask;
- path or boundary;
- zone or sound portal;
- orientation source;
- fallback reference;
- exactness requirement;
- attachment and detachment policy.

The binding must not duplicate the physical coordinates stored in 23B.

### 8.5 Binding Bundles

A bundle may group related lifecycle bindings:

```text
bundle.machine.operation
    start -> profile.machine.start
    loop  -> profile.machine.active
    stop  -> profile.machine.stop
    fault -> profile.machine.fault
```

Bundles improve validation and ensure every required stop or fallback path exists.

### 8.6 Local Overrides

An asset may override:

- profile ID;
- spatial role;
- parameter mapping;
- palette or sound family;
- priority within allowed bounds;
- accessibility equivalent;
- LOD profile.

It may not change the meaning, authority or required payload of the source contract.

## 9. Resolver Pipeline and Selection Rules

### 9.1 Resolution Order

Recommended resolution order:

1. Validate contract and schema version.
2. Build or accept immutable context.
3. Resolve source and target families/tags.
4. Find explicit specific-asset binding.
5. Find asset-family or template binding.
6. Resolve action-material response matrix.
7. Apply culture, faction, biome or dimension variant.
8. Apply content-pack override priority.
9. Select accessibility variant.
10. Resolve semantic spatial references and fallbacks.
11. Apply composition and concurrency rules.
12. Apply budget/LOD form.
13. Dispatch components and record trace.

### 9.2 Specificity Scoring

Bindings receive deterministic specificity scores based on matched dimensions. Exact asset and explicit action/material matches outrank broad tag defaults. Ties are resolved by declared pack priority and stable ID ordering, never by load timing.

Example weighting concept:

| Match | Relative Weight |
| --- | --- |
| Specific asset | Highest |
| Exact source-target material pair | Very high |
| Asset family and action | High |
| Culture/biome/dimension variant | Medium |
| Generic contract family | Low |
| Safe project default | Lowest |

Final numeric weights belong to implementation but must remain deterministic and inspectable.

### 9.3 No-Match Behaviour

No match should resolve to:

1. declared contract default profile family;
2. project-wide safe fallback profile;
3. critical accessibility-only cue if the event is important;
4. diagnostic placeholder in development builds;
5. silent suppression only for explicitly decorative contracts.

A missing boss telegraph or machine danger warning is an approval-blocking error.

### 9.4 Material-Pair Resolution

Material response uses:

```text
source material family
x target material family
x action
x intensity band
x environment modifiers
x source/target condition
```

The resolver first seeks exact response, then family response, then action default. Wetness, temperature, enchantment and corruption modify rather than replace the core material identity unless a specialised binding exists.

### 9.5 Deterministic Variation

A binding may choose weighted variants using a deterministic seed from context. Networked observers can share major timing and identity while allowing non-critical local tails to vary where policy permits.

### 9.6 Resolution Cache

Common combinations should cache a resolution plan keyed by relevant context dimensions. Cache keys must exclude fields that do not influence binding choice. Invalidations occur when registries, content packs, accessibility settings or relevant asset definitions change.

## 10. Presentation Profiles and Component Dispatch

Presentation Profiles are reusable bundles of feedback selected by bindings.

### 10.1 Profile Components

| Component | Responsibility |
| --- | --- |
| Audio event | One-shot, loop, sequence, layer or ambience request. |
| Voxel VFX | Burst, continuous effect, trail, beam, volume or grammar instance. |
| Light profile | Flash, sustained light, pulse or emissive-role request. |
| Surface presentation | Scorch, wetness, frost, residue, crack or other persistent/temporary layer. |
| Caption | Localisable label, intensity and direction. |
| Directional indicator | World or screen-space cue for important off-screen events. |
| Camera reference | Stable impulse or shake profile ID. |
| Haptic reference | Stable controller feedback profile ID. |
| UI reference | Warning icon, meter pulse or notification view-model request. |
| Child presentation events | Bounded secondary presentation-only sequence. |

### 10.2 Dispatch Contract

Each component receives only its approved subset of context and mapped parameters. An audio event should not receive combat internals it does not consume. A VFX graph should receive palette, intensity, direction and spatial data, not the entire source object.

### 10.3 Component Lifecycle

Components declare:

- one-shot, loop, persistent or sequence lifecycle;
- owner key;
- start and stop behaviour;
- virtualisation policy;
- LOD forms;
- concurrency group;
- criticality;
- save policy;
- detachment behaviour;
- completion callback limited to presentation diagnostics or chaining.

### 10.4 Partial Profile Availability

A profile may be valid with some optional components absent. However, required components depend on contract importance. A machine fault may require audio-or-visual equivalence. A decorative ember profile may use VFX only.

### 10.5 Child Events

Profiles may emit bounded presentation-only child events for:

- debris impacts;
- spark branching;
- echo tails;
- secondary droplets;
- trail termination;
- delayed rune pulses.

Child depth, count and frequency are budgeted. Child events cannot publish gameplay contracts.

## 11. Parameter Mapping, Curves, Smoothing and Quantisation

### 11.1 Mapping Record

```text
ParameterMapping
{
    source_field_or_state_id
    target_parameter
    input_range
    output_range
    clamp_policy
    curve_type_or_curve_id
    dead_zone
    quantisation_steps?
    smoothing_policy
    hysteresis?
    fallback_value
    update_rate
}
```

### 11.2 Mapping Examples

| Source | Target | Mapping |
| --- | --- | --- |
| `state.machine.speed_ratio` | audio loop pitch | 0.85-1.15 with smoothing. |
| `state.machine.heat_ratio` | smoke density | low below 0.3, stepped increase, warning form above 0.85. |
| impact intensity | debris count | quantised light/medium/heavy bands. |
| movement speed | footstep volume | bounded curve with sprint cap. |
| mana charge | rune emission | stepped voxel brightness and pulse rate. |
| rain intensity | roof contact density | aggregate rate, capped by area and audio concurrency. |

### 11.3 Smoothing Policies

- None for instant impacts.
- Linear interpolation.
- Exponential approach.
- Attack/release smoothing with different rise and fall rates.
- Critically damped smoothing for stable machine motion.
- Stepped/quantised changes for intentional voxel style.
- Hold-and-release for warnings.

Smoothing affects presentation only. It must not feed back into gameplay state.

### 11.4 Hysteresis

Hysteresis is required where noisy state may switch profiles repeatedly, including:

- blocked/unblocked near capacity;
- wet/dry thresholds;
- indoor/outdoor blend boundaries;
- low fuel warnings;
- overheat states;
- corruption visibility bands.

### 11.5 Quantisation and Voxel Readability

Voxel VFX may quantise scale, brightness, trail density or movement steps to preserve style. Audio mappings may remain smooth where stepping would sound artificial. Each target declares whether quantisation is appropriate.

### 11.6 Parameter Safety

Mapped values are clamped before dispatch. Invalid, NaN or out-of-range state produces fallback and diagnostics. A profile cannot allocate unbounded particles or voices by passing an extreme parameter.

## 12. Material, Surface and Contact Response Integration

### 12.1 Contact Context

A contact presentation should know, where available:

- source material family;
- target material family;
- source tool or action family;
- target block/item/entity family;
- intensity or impulse band;
- contact position and normal;
- struck voxel and face;
- wetness, frost, heat or corruption;
- environment/acoustic zone;
- movement direction;
- whether the event is scrape, impact, roll, slide, splash or break.

### 12.2 Material Response Rule

Material DNA supplies defaults for:

- impact audio family;
- debris voxel material and shapes;
- break and placement presentation;
- friction/scrape response;
- spark probability and colour role;
- liquid splash behaviour;
- heat, frost and mana reaction;
- resonance and acoustic body;
- persistent residue compatibility.

Specific items or blocks override only unique behaviour.

### 12.3 Surface Masks

Bindings may target named 23B Surface Masks such as:

- `surface_mask.rune_glow`;
- `surface_mask.vent_opening`;
- `surface_mask.crack_area`;
- `surface_mask.blade_edge`;
- `surface_mask.water_drip`.

Raw texel coordinates remain inside the mask mapping and do not appear in event contracts.

### 12.4 Contact Aggregation

Dense contacts such as rain, rolling debris, crowds or conveyor items should batch by:

- area or zone;
- material family;
- intensity band;
- time window;
- local relevance.

The aggregate contract may carry count, density, bounds and dominant material rather than one event per contact.

### 12.5 Damage and Family-Friendly Alternatives

Damage context may resolve to blood, sparks, dust, magical motes, cracked armour or family-friendly alternatives based on world and accessibility settings. The gameplay damage type remains unchanged; only the Presentation Profile varies.

## 13. State Composition, Channels, Priority and Conflict

### 13.1 Standard Channels

```text
Base/Identity
Operation
Environment
Damage
Magic/Enchanting
Corruption/Forbidden
Warning/Critical
Temporary Event
Accessibility
```

### 13.2 Composition Modes

| Mode | Meaning |
| --- | --- |
| Additive | Layer contributes without replacing compatible layers. |
| Replace within channel | Highest-priority layer replaces another in the same channel. |
| Mask | One layer limits where another may appear. |
| Modulate | Layer changes palette, intensity, rate or filtering of another. |
| Suspend | Temporarily pauses lower-priority presentation while preserving phase. |
| Exclusive | Prevents incompatible profiles from running simultaneously. |
| Accessibility substitute | Replaces or supplements a cue to meet settings or requirements. |

### 13.3 Priority Rules

Recommended priority direction:

1. life/safety-critical warning;
2. gameplay telegraph and accessibility equivalent;
3. immediate confirmed interaction;
4. damage/fault state;
5. operation state;
6. environment;
7. cosmetic ambient detail.

High priority does not always mean visually larger. It means protected from suppression and conflict.

### 13.4 Conflict Examples

- A wet furnace can show wet environmental response while active smoke continues.
- Overheat warning may modulate smoke and add a warning sound without deleting the active loop.
- Corruption may recolour or fracture mana effects while preserving the ward-breach telegraph.
- Reduced-motion mode may replace orbiting motes with a stable pulsing voxel ring.
- A damaged weapon trail may shorten and add sparks while the base swing timing remains unchanged.

### 13.5 Maximum Layer Rules

Profiles declare maximum concurrent layers per channel and per owner. When exceeded, the composition manager uses priority and aggregation rather than starting unlimited components.

### 13.6 Critical-Cue Protection

A contract marked critical must define at least one output that survives:

- low VFX quality;
- muted non-essential audio;
- reduced motion;
- reduced flash;
- distance aggregation;
- split-screen constraints;
- colour-vision variation.

## 14. Temporal Controls, De-duplication, Cooldowns and Sequences

### 14.1 De-duplication Keys

Events may de-duplicate by:

- event ID and sequence ID;
- source ID and timestamp window;
- runtime contact ID;
- owner key and lifecycle state;
- network packet ID;
- aggregate cell and time window.

### 14.2 Cooldown Profiles

Cooldowns may be:

- per source;
- per listener;
- per spatial cell;
- per material-action pair;
- per concurrency group;
- global for rare announcements.

Cooldowns should suppress repetition, not hide unique dangerous events.

### 14.3 Repeat Avoidance

Sound and VFX families may avoid recently selected variants. Deterministic repeat history can be local for cosmetic variation and shared where synchronisation matters.

### 14.4 Sequence State

A sequence record tracks:

```text
sequence_id
owner_key
current_stage
start_time
last_event_time
active_profiles[]
virtualised_state
predicted_or_confirmed
cancellation_reason?
```

This supports attack telegraphs, rituals, portal activation, machine cycles and construction stages.

### 14.5 Loop Phase Continuity

When a loop is culled, virtualised or aggregated, its logical phase may continue. Re-entry should resume naturally instead of restarting every machine or mana pulse simultaneously.

### 14.6 Event Storm Protection

The event bus applies:

- per-contract queue limits;
- burst caps;
- aggregation fallback;
- priority dropping for decoration;
- diagnostics for producers exceeding declared frequency;
- protection for critical events.

## 15. Animation, Rig, Entity and Equipment Integration

### 15.1 Animation Contract Catalogue

Recommended animation contracts:

```text
event.animation.foot_contact
event.animation.hand_contact
event.animation.tool_contact
event.animation.weapon_trail_begin
event.animation.weapon_trail_end
event.animation.projectile_release
event.animation.breath_release
event.animation.cast_commit
event.animation.land
event.animation.loop_marker
```

### 15.2 Marker Payload

Markers may supply:

- semantic limb or tool role;
- local animation time;
- normalised clip phase;
- sequence ID;
- expected spatial socket;
- contact strength band;
- authored direction hint.

Runtime contact systems may enrich with actual surface material and position.

### 15.3 Rig and Body-Plan Mapping

Bindings use 23B semantic roles such as `socket.foot.left`, `socket.audio.mouth`, `socket.vfx.breath_origin` and `path.vfx.weapon_trail`. Body-plan templates map those roles to bones or voxel regions.

### 15.4 Equipment Composition

An entity attack may combine:

- entity animation event;
- equipped item material and family;
- weapon trail path from the item;
- grip socket from the rig;
- target contact from combat;
- enchantment state from the item;
- environment context.

The resolver receives these as stable context rather than direct scene hierarchy traversal.

### 15.5 Locomotion

Footstep resolution uses:

```text
foot-contact marker
+ actual or predicted contact surface
+ movement speed
+ entity mass class
+ footwear material
+ wetness/snow depth
+ acoustic zone
```

Remote distant NPC crowds may publish aggregated locomotion density instead of individual footsteps.

### 15.6 Voxel-Frame Animation

When an asset swaps voxel frames, the event keeps semantic spatial roles. 23B remapping determines the current physical point. A missing required breath origin or weapon path blocks approval.

## 16. Blocks, Items, Combat, Damage and Construction Integration

### 16.1 Block Contracts

Recommended block contracts include:

- `event.block.placed`;
- `event.block.removed`;
- `event.block.mining_impact`;
- `event.block.break_stage_changed`;
- `event.block.broken`;
- `event.block.activated`;
- `event.block.state_changed`;
- `event.block.fluid_contact`;
- `event.block.repaired`.

Block payload should reference stable block and material IDs, position, face, state band and source action where relevant.

### 16.2 Item Contracts

Items may publish or contribute context for:

- equip/unequip;
- use or consume;
- durability band changed;
- charge started/completed;
- repair completed;
- enchantment state changed;
- container opened/closed;
- projectile launched.

Inventory changes themselves do not require world presentation unless a defined UI or world event consumes them.

### 16.3 Combat Separation

Combat owns:

- attack permission;
- hit detection;
- damage calculation;
- block/parry outcome;
- status application;
- death and knockback.

Presentation consumes confirmed contracts such as:

```text
event.combat.attack_started
event.combat.telegraph_started
event.combat.impact_confirmed
event.combat.block_confirmed
event.combat.parry_confirmed
event.combat.guard_broken
event.combat.damage_applied
event.combat.entity_defeated
```

### 16.4 Predicted Combat Feedback

The local client may predict swing sounds, trail start and non-outcome contact anticipation. Damage bursts, target reactions and confirmed impact profiles should follow authority or be reconciled if predicted.

### 16.5 Damage State Integration

Damage state is continuous or banded authoritative state. Temporary impact events layer over it. Persistent cracks, scorch or corruption use approved surface presentation records tied to saved state or explicit persistence policy.

### 16.6 Construction

Construction contracts may include:

- supply delivered;
- stage started;
- work action;
- block batch placed;
- stage completed;
- project completed;
- repair stage completed;
- collapse stage.

Nearby construction may show individual work impacts; distant construction uses stage-level or aggregate presentation.

## 17. Automation, Power, Mana and Magic Integration

### 17.1 Machine State Family

Recommended states:

```text
state.machine.active
state.machine.speed_ratio
state.machine.progress_ratio
state.machine.heat_ratio
state.machine.input_ratio
state.machine.output_ratio
state.machine.blocked
state.machine.damage_ratio
state.machine.maintenance_due
```

Recommended events:

```text
event.machine.started
event.machine.recipe_cycle_started
event.machine.output_produced
event.machine.blocked
event.machine.unblocked
event.machine.faulted
event.machine.overload_warning
event.machine.overloaded
event.machine.shutdown
event.machine.repaired
```

### 17.2 Machine Loop Example

```text
state.machine.active = true
    -> start/own active Presentation Profile
state.machine.speed_ratio
    -> motor rhythm and moving voxel cadence
state.machine.heat_ratio
    -> smoke/steam and light modulation
state.machine.blocked = true
    -> warning channel plus strained loop layer
state.machine.damage_ratio
    -> damage channel sparks/grinding
```

### 17.3 Power Networks

Power presentation reads network summaries such as:

- active/inactive;
- load ratio;
- flow direction;
- overload risk;
- junction pulse phase;
- network family;
- local segment relevance.

Gameplay owns power transfer. Presentation may display pulses along 23B paths but cannot treat a visual pulse as evidence of delivered power.

### 17.4 Mana and Rune Networks

Mana context may include:

- school or element;
- purity;
- charge ratio;
- stability;
- corruption;
- flow direction;
- ward status;
- rune role;
- conduit family.

Visual, audio and light profiles inherit the same semantic flow while maintaining voxel forms.

### 17.5 Spell Lifecycle

Recommended spell contracts:

```text
event.magic.cast_started
event.magic.charge_threshold
event.magic.cast_committed
event.magic.released
event.magic.impact_confirmed
event.magic.channel_started
event.magic.channel_stopped
event.magic.cast_interrupted
```

Animation markers may align release timing, while the magic system owns resource cost and successful cast commitment.

### 17.6 Wards and Rituals

Wards and rituals use stage and threshold contracts. A ward breach is critical and must provide equivalent warning. Ritual cancellation, instability and completion have distinct sequence endings.

## 18. NPC, Creature, Village, Quest and Faction Integration

### 18.1 NPC Activity

NPC presentation should derive from real jobs and schedules:

- footsteps and locomotion;
- tool work contacts;
- carrying effort;
- conversation start/stop;
- trade interaction;
- sleep/rest ambience;
- flee and defend states;
- celebration and mourning;
- construction activity.

The presentation layer does not decide an NPC's task or emotion.

### 18.2 Creature Contract Families

```text
event.creature.voice
event.creature.step
event.creature.wingbeat
event.creature.attack_telegraph
event.creature.attack_release
event.creature.staggered
event.creature.phase_changed
event.creature.defeated
```

Body-plan roles and creature family profiles supply spatial and stylistic defaults.

### 18.3 Creature Readability

Attack telegraphs marked important must remain readable under reduced effects. A creature may use a voxel posture change, stable warning shape, caption/directional cue and sound family rather than relying only on colour or flash.

### 18.4 Village Events

Village-level contracts may include:

- workday began/ended;
- market opened;
- project stage completed;
- shortage warning;
- raid warning;
- ward failed;
- festival or celebration;
- mourning or disaster;
- settlement stage changed.

Distant villages normally use summary presentation when observed through map/UI or when the player approaches after an event.

### 18.5 Quest and World Events

Quest logic may request presentation through contracts such as objective updated, discovery revealed or event stage entered. Presentation does not complete objectives. Localisation keys and importance are supplied by the quest/event system.

### 18.6 Faction and Culture Variants

Culture and faction IDs may select profile variants for:

- horns, bells and raid alarms;
- workshop rhythms;
- ritual tones;
- colour/palette roles;
- construction feedback;
- celebration and mourning;
- machine and weapon presentation.

Variants cannot obscure shared gameplay meaning.

## 19. Structures, Blueprints, Worldgen, Weather and Environment Integration

### 19.1 Structure Contracts

Recommended contracts:

```text
event.structure.discovered
event.structure.activated
event.structure.door_state_changed
event.structure.project_stage_changed
event.structure.damaged
event.structure.collapsed
event.structure.repaired
event.structure.restored
event.structure.ownership_changed
```

### 19.2 Blueprint Semantic Layers

Blueprint bindings may reference:

- audio emitter markers;
- VFX emitter markers;
- ambient zones;
- acoustic zones and sound portals;
- mana or automation paths;
- ward boundaries;
- construction regions;
- damage/collapse regions;
- portal centres and boundaries.

### 19.3 Player-Built Structures

Procedural analysis may generate acoustic zones, roof exposure, chimney points and weather-contact surfaces. Generated context must be bounded and cacheable. Manual overrides remain possible.

### 19.4 Weather Contracts

```text
state.environment.rain_intensity
state.environment.wind_speed
state.environment.snow_intensity
state.environment.storm_charge
state.environment.shelter_ratio

event.environment.lightning_contact
event.environment.gust
event.environment.shelter_entered
event.environment.shelter_exited
```

Rain-on-surface contacts should aggregate by exposed area and material family rather than emit per raindrop.

### 19.5 Acoustic Zone Transitions

Crossing a 23B sound portal or zone boundary updates ambience and mix state. Door state may alter portal transmission. The environment service owns zone membership; Audio Forge consumes the transition and continuous blend values.

### 19.6 Biome and Dimension Context

Biome, dimension, leyline density and corruption state may select ambient and effect variants. Important interactions remain recognisable across regions.

### 19.7 World-State Changes

Persistent world transformation should derive from saved authoritative state. Presentation may play transition events and maintain surface layers, but the worldgen or structure system owns the transformation record.

## 20. UI, Accessibility, Captions, Directionality, Camera and Haptics

### 20.1 UI Boundary

Presentation Profiles may reference stable UI feedback IDs. UI systems receive view-model requests and authoritative context; they do not inspect VFX instances to determine state.

### 20.2 Importance Classes

| Class | Requirement |
| --- | --- |
| Cosmetic | May be suppressed freely. |
| Informational | Should preserve at least one channel when practical. |
| Action-relevant | Must remain perceivable through configured primary or equivalent channel. |
| Warning | Requires protected visual/audio/caption/directional alternative. |
| Critical | Cannot be entirely suppressed by ordinary budget or accessibility settings. |

### 20.3 Captions

Caption references include:

- localisation key;
- sound/event label;
- source display name where revealed;
- direction;
- distance band;
- intensity;
- duration;
- repetition policy;
- importance.

Captions should describe meaningful sounds, not every decorative audio event.

### 20.4 Directional Indicators

Off-screen creature telegraphs, raid horns, machine warnings and structure collapses may request directional indicators. Visibility and knowledge rules prevent revealing hidden sources.

### 20.5 Reduced Motion and Reduced Flash

Bindings supply variant rules:

- replace orbit or swirl with stable pulse;
- reduce trail length and particle velocity;
- replace rapid flicker with slow stepped emission;
- cap luminance and flash frequency;
- preserve silhouette and timing;
- use captions or haptics where needed.

### 20.6 Camera and Haptics

Presentation Profiles reference stable camera and haptic profiles. They do not author arbitrary camera scripts or controller logic. Local-player relevance and intensity determine application.

### 20.7 Split-Screen

Each local player receives listener-relative audio, captions, indicators, camera and haptics independently. Shared world VFX can be rendered once where possible but accessibility overlays remain per viewport.

## 21. Multiplayer Authority, Replication, Prediction and Reconciliation

### 21.1 Replication Classes

| Class | Use |
| --- | --- |
| Replicate to relevant observers | Confirmed combat, major machine fault, spell release, structure event. |
| Replicate owner only | Private UI or inventory presentation. |
| Replicate area aggregate | rain, crowd, factory density, distant battle. |
| Derive locally from replicated state | continuous machine hum, mana flow, weather ambience. |
| Local prediction then reconcile | footsteps, attack wind-up, immediate interaction feedback. |
| Local-only | menu, camera-local ambience and non-shared accessibility cues. |

### 21.2 Semantic Replication

Network messages should carry contract ID, schema version, compact payload, source/target stable network references, spatial contact and deterministic seed. They should not require remote clients to know a concrete particle scene path chosen by the sender.

### 21.3 Relevance

The server or host applies relevance by:

- distance and zone;
- visibility and knowledge;
- owning player;
- event importance;
- team/faction relevance;
- world partition or chunk;
- aggregate policy.

### 21.4 Prediction

Prediction is allowed when incorrect early feedback can be cancelled without misleading gameplay. Examples:

- local foot contact;
- weapon whoosh;
- button interaction;
- cast charge start before commitment.

Confirmed target damage, item creation, structure completion and ward breach require authority.

### 21.5 Reconciliation

Predicted instances carry a prediction key. Authority may:

- confirm and continue;
- correct context or target;
- replace predicted profile;
- cancel with a bounded tail;
- suppress duplicate confirmed playback.

### 21.6 Late Join

Late joiners do not replay old one-shots. They reconstruct sustained presentation from current authoritative state and active sequence summaries. Major ongoing rituals, fires, portals and alarms provide active sequence records.

### 21.7 Anti-Cheat and Trust

Clients cannot publish server-authoritative presentation events as proof of gameplay. Presentation traces are diagnostics, not authority logs. Server validation remains separate.

## 22. Persistence, Late Join, Unloaded World and Replay

### 22.1 Persistence Classes

| Class | Save Behaviour |
| --- | --- |
| Transient one-shot | Never saved. |
| Active loop derived from state | Reconstructed from saved state. |
| Long sequence | Save compact stage, phase and owner if gameplay sequence persists. |
| Persistent surface presentation | Save approved surface record or derive from world state. |
| Ambient zone | Derived from blueprint/world definition. |
| Decorative random ambience | Seeded or regenerated; not individually saved. |

### 22.2 Unloaded World

Distant simulation may record semantic outcomes such as structure damaged or village project completed. When the area loads, presentation reconstructs current state and may play an arrival summary only if appropriate. It does not replay every unseen hammer strike.

### 22.3 Replay Trace Format

```text
PresentationTrace
{
    trace_version
    registry_snapshot_id
    start_time
    events[]
    state_samples[]
    context_packets[]
    resolver_results[]
    lifecycle_actions[]
    diagnostics[]
}
```

Traces may omit full state samples when events contain sufficient snapshots.

### 22.4 Replay Modes

- Exact contract replay against current assets.
- Registry-pinned replay against archived compatible definitions.
- Context override testing.
- Accessibility-mode comparison.
- LOD and budget stress replay.
- Multiplayer latency and reordering simulation.

### 22.5 Determinism Boundaries

Major selected profile identity, timing and spatial origin should be reproducible from trace. Minor local audio variation, particle turbulence and decorative tails may differ when marked non-deterministic.

## 23. Editor Workflow, Contract Browser, Debugger and Runtime Capture

### 23.1 Contract Browser

The unified Forge should provide:

- search by ID, owner, category and tag;
- schema field inspection;
- producer and consumer lists;
- version/deprecation history;
- frequency and importance class;
- required spatial roles;
- test fixtures;
- missing-binding warnings;
- content-pack override view.

### 23.2 Binding Editor

Standard workflow:

1. Select an event or state contract.
2. Choose binding scope.
3. Add declared context conditions.
4. Select Presentation Profile.
5. Map parameters.
6. choose semantic spatial roles.
7. assign composition channel, priority and concurrency.
8. preview accessibility and LOD variants.
9. run fixtures and validation.
10. approve and bake.

### 23.3 Context Inspector

The inspector shows:

- actual field values;
- source of each value;
- required/optional status;
- privacy and replication class;
- which fields affected resolution;
- which fields were ignored;
- missing or fallback fields.

### 23.4 Resolver Debugger

The debugger displays all candidate bindings, specificity scores, rejected conditions, selected override, fallback steps, spatial mappings, accessibility variant and budget form.

### 23.5 Live Runtime Capture

Godot runtime can stream or save presentation traces for selected entities, chunks, contracts or time windows. Capture includes enough context to reproduce a problem without storing raw gameplay object graphs.

### 23.6 Event Injection

Development builds may inject fixture contracts. Injection is clearly marked, isolated from authoritative saves and unavailable in release multiplayer unless a developer permission is active.

### 23.7 Dependency View

Changing a contract schema, state ID, spatial role or profile shows all dependent bindings and content packs before approval.

### 23.8 AI-Assisted Workflow

Summer Engine may:

- suggest event contracts from existing callbacks;
- generate adapter skeletons;
- identify duplicate semantic events;
- propose parameter mappings;
- find missing stop events;
- suggest material response bindings;
- generate fixtures and replay scenarios;
- detect unbounded frequency or context cost.

Suggestions remain reviewable and cannot silently publish registry changes.

## 24. Validation, Diagnostics, Testing and Migration

### 24.1 Validation Classes

| Class | Examples |
| --- | --- |
| Schema | Missing required field, invalid type, unknown enum, incompatible version. |
| Ownership | Duplicate owner, unauthorised producer, ambiguous contract namespace. |
| Binding | No profile, impossible conditions, duplicate tie, fallback cycle. |
| Spatial | Missing required anchor, incompatible socket, invalid runtime-contact requirement. |
| Lifecycle | Begin without stop, orphan loop, reused sequence ID, cancellation leak. |
| Performance | Frequency exceeds class, heavy context on high-rate event, unbounded child events. |
| Multiplayer | Private state replicated, predicted outcome not reconcilable, non-deterministic required cue. |
| Accessibility | Critical contract lacks equivalent cue or reduced-flash form. |
| Migration | Removed field still consumed, replay fixture incompatible, content-pack override stale. |

### 24.2 Severity Levels

- **Info:** recommendation or unused optional field.
- **Warning:** fallback available but quality or maintainability reduced.
- **Error:** binding or contract cannot function correctly.
- **Approval Blocker:** missing critical cue, authority violation, unbounded event storm, broken required spatial role or incompatible schema.

### 24.3 Automated Contract Tests

Every contract should have fixtures for:

- minimum required payload;
- full payload;
- absent optional fields;
- boundary values;
- invalid values;
- prediction/confirmation where applicable;
- network serialisation;
- replay serialisation;
- fallback binding;
- accessibility mode.

### 24.4 Integration Tests

Required integrated tests include:

- animation marker plus runtime surface contact;
- material pair resolution;
- start/loop/stop sequence;
- state threshold hysteresis;
- content-pack override determinism;
- missing spatial mapping fallback;
- event burst aggregation;
- late join reconstruction;
- registry migration;
- reduced-motion/flash and caption equivalents.

### 24.5 Migration Rules

Schema migration should:

1. identify old contract and version;
2. transform fields deterministically;
3. preserve semantic identity where meaning remains compatible;
4. flag removed or ambiguous data for review;
5. update binding field references;
6. validate replay fixtures and content packs;
7. retain audit history.

### 24.6 Contract Diff

A contract diff should show:

- added/removed/renamed fields;
- type or range changes;
- authority/replication changes;
- importance changes;
- producer/consumer impact;
- migration availability;
- replay compatibility.

## 25. Performance, Event Budgets, Aggregation and Virtualisation

### 25.1 Cost Model

Presentation event cost includes:

- producer dispatch;
- payload serialisation;
- context provider queries;
- binding lookup;
- spatial resolution;
- profile dispatch;
- audio voices and VFX instances;
- network replication;
- trace recording.

### 25.2 Event Budget Profiles

Recommended budget classes:

| Budget | Typical Events |
| --- | --- |
| Critical rare | ward breach, boss telegraph, structure collapse. |
| Important low-rate | combat impacts, machine faults, spell release. |
| Standard moderate | footsteps, mining, NPC work contacts. |
| Dense aggregate | rain, crowds, conveyors, fire debris. |
| Ambient virtualised | forests, distant factories, village beds, insect life. |

### 25.3 Aggregation

Events can aggregate when equivalent meaning is preserved:

- footsteps become crowd movement bed;
- furnaces become factory cluster hum and smoke density;
- rain contacts become roof/material zone emitter;
- distant combat becomes battle ambience and occasional major flashes;
- mana conduit pulses become junction/segment summaries.

### 25.4 Virtualisation

Virtualised sequences retain:

- owner key;
- phase or stage;
- current mapped parameters;
- expected resume state;
- critical warning status.

They do not keep full active particles or voices.

### 25.5 Context Provider Budgets

Each provider declares cost. High-frequency contracts may use cached material, zone and relevance data. Expensive world scans are prohibited in event dispatch.

### 25.6 Trace Budgets

Full traces are development-only and bounded by time, event filter and memory. Release diagnostics use counters and sampled records unless explicitly enabled.

### 25.7 Failure Priority

Under pressure, suppress in this order:

1. decorative child events;
2. distant cosmetic variants;
3. redundant standard events through aggregation;
4. non-critical ambience detail;
5. never remove the final critical equivalent cue.

## 26. Minimum Viable Integration and Forest Hamlet Tests

### 26.1 MVP Contract Set

The first implementation should include:

- animation foot contact;
- block mining impact and break;
- block placement;
- combat impact confirmed;
- machine started, active state, blocked, unblocked and stopped;
- mana flow active and ward breach;
- creature attack telegraph and release;
- rain intensity and shelter transition;
- structure construction stage completed;
- village raid warning;
- accessibility caption/directional cue;
- lifecycle unload/reload reconstruction.

### 26.2 MVP State Set

- movement speed and grounded state;
- machine speed, heat, active and blocked;
- mana flow and ward stability;
- rain intensity and shelter ratio;
- damage ratio;
- local relevance/distance band.

### 26.3 Forest Hamlet Integrated Scenario

```text
Player mines iron ore in a damp cave
    -> animation tool-contact marker
    -> confirmed block mining-impact contract
    -> runtime contact and stone/iron-ore material context
    -> sound, voxel chips and cave acoustic response

Iron enters the furnace supply chain
    -> furnace start contract and active state
    -> loop pitch follows speed; smoke follows heat
    -> output becomes blocked
    -> warning channel, strained audio and denser smoke
    -> unblocked contract restores normal operation without restarting phase

Village watchtower stage completes
    -> structure stage-completed contract
    -> construction dust, hammer finish, bell cue and project UI update

Rain begins during the raid
    -> aggregate rain/material contracts
    -> shelter transitions alter roof audio and outdoor ambience

Goblin captain attacks the ward
    -> creature telegraph contract
    -> animation release marker
    -> magic impact confirmed
    -> ward stability threshold and breach warning
    -> protected caption/directional cue and reduced-flash variant
```

### 26.4 MVP Acceptance

The MVP passes when:

- every event resolves through a registered contract;
- no presentation graph calls gameplay mutation methods;
- missing optional context degrades safely;
- missing required context is diagnosed;
- material and environment variants resolve correctly;
- start/loop/stop ownership has no leaks;
- state composition preserves warning visibility;
- aggregation prevents rain and crowd event storms;
- prediction does not duplicate confirmed events;
- late join reconstructs active furnace, rain and ward state;
- runtime capture replays the scenario in the Forge;
- accessibility equivalents remain functional at minimum quality.

### 26.5 Explicit MVP Deferrals

- Full dialogue and music event systems.
- Complete final-game contract catalogue.
- Advanced cinematic timeline integration.
- Full procedural acoustic simulation.
- Cross-dimension remote presentation.
- Every culture and material response family.
- Final console haptic implementation.

## 27. Balancing Rules and Explicit Non-Goals

### 27.1 Contract Design Rules

- Publish semantic events, not presentation asset names.
- Keep payloads minimal and typed.
- Capture timing-sensitive context at event time.
- Prefer state-on-change over per-frame event spam.
- Use aggregation for dense equivalent occurrences.
- Require sequence ownership for sustained presentation.
- Mark information importance explicitly.
- Preserve stable IDs through compatible implementation changes.
- Treat authority, privacy and replication as part of the contract, not later optimisation.

### 27.2 Binding Rules

- Prefer reusable profiles and families.
- Keep conditions inspectable and deterministic.
- Do not duplicate 23B coordinates in bindings.
- Use material response matrices before one-off asset combinations.
- Define safe fallback and accessibility alternatives.
- Keep content-pack override order deterministic.
- Use composition channels rather than destructive replacement.

### 27.3 Complexity Limits

A single binding should not become an unrestricted rule engine. Complex multi-stage behaviour belongs in an approved sequence profile with bounded states and explicit contracts. If a binding requires arbitrary code, the design should be reconsidered or implemented as a reviewed adapter.

### 27.4 Explicit Non-Goals

This document does not:

- define combat, machine, magic, NPC or quest rules;
- replace the authoritative game event bus;
- specify every VFX node or audio processor;
- permit presentation to create items, damage, power or reputation;
- require network replication of every cosmetic event;
- guarantee identical decorative particles on every client;
- define final numeric performance budgets;
- author full music, dialogue or cinematic systems.

## 28. Open Questions for Later Documents

The following are intentionally deferred for specialist definition:

- exact Godot resource classes and threading model in 23I;
- full VFX input parameter catalogue in 23D and 23E;
- full audio event parameter and bus catalogue in 23F and 23G;
- editor layouts and interaction details in 23H;
- final production naming catalogue and default binding library in 23J;
- final network packet sizes and event-rate budgets after profiling;
- exact content-pack compatibility support window;
- final replay archival policy;
- degree of acoustic context included in replicated packets versus resolved locally;
- final camera/haptic profile ownership documents.

## Appendix A. Event Contract Data Template

```text
Event ID:
Display Name:
Owner Module:
Schema Version:
Category:
Description:
Authority Class:
Timing Class:
Persistence Class:
Replication Policy:
Replay Policy:
Prediction Policy:
Expected Frequency:
Burst Limit:
Importance Class:
Required Payload Fields:
Optional Payload Fields:
Required Context Fields:
Allowed Spatial Roles:
Default Profile Family:
Accessibility Requirements:
Deprecation State:
Migration Rules:
Test Fixtures:
Planning Status:
```

## Appendix B. State and Parameter Contract Templates

### B.1 State Contract

```text
State ID:
Owner Module:
Schema Version:
Value Type:
Unit:
Valid Range:
Default Value:
Update Policy:
Maximum Update Rate:
Interpolation Policy:
Quantisation Policy:
Authority Class:
Replication Policy:
Privacy Class:
Persistence Source:
Fallback Policy:
Allowed Consumers:
Test Values:
```

### B.2 Parameter Mapping

```text
Source Field/State ID:
Target Parameter:
Input Range:
Output Range:
Clamp Policy:
Curve ID/Type:
Dead Zone:
Quantisation Steps:
Smoothing Policy:
Hysteresis:
Fallback Value:
Update Rate:
```

## Appendix C. Presentation Context Packet Template

```text
Context Version:
Event ID:
Timestamp:
Sequence ID:
Authority State:
Source Entity/Asset/Family:
Source Culture/Faction:
Source Material/Quality/Condition:
Target Entity/Asset/Family:
Target Material/Condition:
Action/Interaction/Damage/Magic Type:
Intensity/Speed/Mass:
Spatial Reference:
Runtime Anchor:
World Position/Normal:
Struck Voxel/Face/Region/Path:
Biome/Dimension/Acoustic Zone:
Weather/Shelter/Wetness/Temperature:
Mana Density/Corruption:
Local Relevance/Visibility/Distance:
Accessibility Importance:
Deterministic Seed:
Custom Payload:
```

## Appendix D. Binding and Resolution Templates

### D.1 Presentation Binding

```text
Binding ID:
Source Contract ID:
Supported Contract Versions:
Binding Scope:
Owner Asset/Family:
Conditions:
Exclusions:
Spatial Rules:
Profile ID:
Parameter Mappings:
Composition Channel:
Priority:
Concurrency Group:
Cooldown Profile:
Accessibility Variants:
LOD Profile:
Replication Visibility:
Fallback Binding:
Content-Pack Priority:
Validation State:
```

### D.2 Resolution Trace

```text
Event/State Contract:
Schema Version:
Context Packet ID:
Candidate Bindings:
Rejected Conditions:
Specificity Scores:
Selected Binding:
Selected Profile:
Applied Overrides:
Accessibility Variant:
Spatial Resolution/Fallback:
Composition Decision:
Budget/LOD Form:
Dispatched Components:
Diagnostics:
```

## Appendix E. Recommended Contract Catalogue

### E.1 Animation and Interaction

- `event.animation.foot_contact`
- `event.animation.tool_contact`
- `event.animation.weapon_trail_begin`
- `event.animation.weapon_trail_end`
- `event.animation.projectile_release`
- `event.animation.breath_release`
- `event.animation.cast_commit`
- `event.animation.land`
- `event.interaction.use`
- `event.interaction.opened`
- `event.interaction.closed`
- `event.interaction.pickup`

### E.2 Blocks, Items and Combat

- `event.block.placed`
- `event.block.mining_impact`
- `event.block.break_stage_changed`
- `event.block.broken`
- `event.block.repaired`
- `event.item.equipped`
- `event.item.durability_band_changed`
- `event.combat.attack_started`
- `event.combat.telegraph_started`
- `event.combat.impact_confirmed`
- `event.combat.block_confirmed`
- `event.combat.parry_confirmed`
- `event.combat.guard_broken`
- `event.combat.entity_defeated`

### E.3 Automation and Magic

- `event.machine.started`
- `event.machine.output_produced`
- `event.machine.blocked`
- `event.machine.unblocked`
- `event.machine.faulted`
- `event.machine.overload_warning`
- `event.machine.shutdown`
- `event.magic.cast_started`
- `event.magic.cast_committed`
- `event.magic.released`
- `event.magic.impact_confirmed`
- `event.magic.ward_breached`
- `event.magic.ritual_stage_changed`
- `event.magic.portal_state_changed`

### E.4 Creature, Village, Structure and Environment

- `event.creature.voice`
- `event.creature.attack_telegraph`
- `event.creature.attack_release`
- `event.creature.phase_changed`
- `event.village.raid_warning`
- `event.village.project_stage_completed`
- `event.village.settlement_stage_changed`
- `event.structure.discovered`
- `event.structure.activated`
- `event.structure.damaged`
- `event.structure.collapsed`
- `event.structure.restored`
- `event.environment.lightning_contact`
- `event.environment.shelter_entered`
- `event.environment.shelter_exited`

## Appendix F. Cross-System Integration Matrix

| System | Produces | Context Contributions | Presentation Consumers |
| --- | --- | --- | --- |
| Animation | contact/release/phase markers | limb, clip phase, socket role | footsteps, trails, whooshes, release effects. |
| Blocks | impacts, break, place, state | block/material, face, voxel, state | audio, debris, cracks, residue, UI. |
| Items | equip, use, condition | material, quality, enchantment | equipment audio/VFX, UI, trails. |
| Combat | confirmed outcomes | source/target, contact, damage type | impact, reactions, warnings, captions. |
| Automation | machine lifecycle/state | speed, heat, blocked, ports | loops, smoke, warning, lights. |
| Magic | cast/ward/ritual events | school, charge, stability, path | rune VFX, audio, lights, alerts. |
| NPC | jobs, schedules, social events | role, action, culture | work sounds, movement, celebration. |
| Creatures | voice, attacks, phases | family, body role, threat | telegraphs, breath, footsteps, roars. |
| Villages | projects, warnings, growth | settlement, culture, importance | bells, crowds, construction, UI. |
| Structures | stages, damage, doors | blueprint roles, zones, portals | ambience, collapse, repair, acoustics. |
| World/Weather | regional/environment state | biome, weather, shelter, zone | ambience, rain, wind, fog, mix. |
| UI/Accessibility | local settings and view needs | listener, viewport, modes | captions, indicators, reduced variants. |

## Appendix G. Validation and Acceptance Checklist

### G.1 Contracts

- Stable semantic ID and single owner exist.
- Required and optional payload fields are typed.
- Authority, replication, prediction and replay policies are declared.
- Expected frequency and burst limit are realistic.
- Importance and accessibility requirements are classified.
- Schema migration exists for breaking revisions.

### G.2 Bindings

- Binding conditions use declared context only.
- Profile and fallback are valid.
- Spatial references resolve through 23B.
- Parameter mappings clamp and provide fallback.
- Composition channel and priority are declared.
- Concurrency and cooldown prevent spam.
- Accessibility and LOD variants are present where required.

### G.3 Runtime

- Begin/update/end lifecycle cannot leak.
- Predicted and confirmed events de-duplicate.
- High-frequency events aggregate.
- Late join reconstructs sustained state.
- Persistent presentation derives from approved saved data.
- Critical cues survive minimum quality and accessibility modes.
- Trace replay reproduces resolution decisions.

## Appendix H. Worked Examples

### H.1 Mining Impact

```text
Producer: Block interaction system
Contract: event.block.mining_impact
Required payload: source tool ID, target block ID, intensity
Context: runtime contact, source/target materials, wetness, cave zone
Resolver: iron pickaxe x iron-ore-in-stone x mining x medium
Spatial: runtime contact normal
Profile: stone/ore chips + metal/stone impact + cave tail
Authority: confirmed block interaction
Aggregation: none at normal player rate
```

### H.2 Furnace Blocked State

```text
Producer: Automation system
Events: machine.started, machine.blocked, machine.unblocked, machine.shutdown
States: active, speed_ratio, heat_ratio, damage_ratio
Owner key: furnace entity + operation slot
Composition:
    Operation -> motor/fire loop
    Environment -> rain/wet response
    Damage -> sparks/grinding
    Warning -> blocked cue
Result: blocked warning layers over active state; unblocked removes warning without restarting loop phase
```

### H.3 Creature Breath Attack

```text
Creature AI confirms attack sequence
    -> event.creature.attack_telegraph
Animation marker
    -> event.animation.breath_release
Magic/combat system
    -> event.magic.released
Impact system
    -> event.magic.impact_confirmed
Spatial roles
    -> socket.vfx.breath_origin, path.vfx.breath_direction, runtime impact
Accessibility
    -> reduced-flash stream, stable telegraph shape, caption and directional warning
```

### H.4 Rain on Player-Built Roof

```text
Environment state: rain_intensity
Blueprint/world analysis: exposed roof faces grouped by material and acoustic zone
Aggregate contract: rain contact density by roof zone
Resolver: heavy rain x timber roof x small interior
Output: exterior voxel droplets, roof audio bed, interior damped impacts, doorway sound-portal transition
No per-drop gameplay event is created
```

### H.5 Village Raid Warning

```text
Producer: Village threat system
Contract: event.village.raid_warning
Payload: settlement ID, threat direction, severity, estimated arrival band
Importance: Critical
Bindings:
    bell/horn profile by culture
    ward beacon VFX
    directional UI indicator
    localised caption
    haptic warning for local player
Privacy: only information the village/player has detected may be shown
```
