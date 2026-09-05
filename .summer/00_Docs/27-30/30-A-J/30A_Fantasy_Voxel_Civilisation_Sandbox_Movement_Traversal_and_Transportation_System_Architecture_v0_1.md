# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30A - Movement, Traversal and Transportation System Architecture

**Version 0.1 - System Architecture, Ownership and Integration Foundation Draft**

A governing architecture for responsive player and NPC locomotion, voxel-aware traversal, mounts, land transportation, routes, navigation, pathfinding interfaces, simulation LOD and authoritative movement integration across Leyforge.

**Project Lead and Final Authority: Ash**

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

---

> **Movement, Traversal and Transportation Statement**
>
> Movement is the physical language through which the player reads and inhabits Leyforge. Walking across a village, climbing a ruined tower, riding a mount through a forest, hauling ore by wagon, crossing a mountain pass, travelling with a caravan and moving through a distant route network must all feel like parts of one coherent world. The system must be responsive at the controls, honest about terrain and infrastructure, scalable across living civilisations, data-driven enough for seeded worlds and content packs, and modular enough to consume economy, social and survival systems without redefining them.

| Field | Locked Direction |
| --- | --- |
| Document Set | This is Document 30A in Document Set 30: Movement, Traversal and Transportation. |
| Governing Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 is the governing ownership contract for this document and the entire set. |
| Document Scope | System identity, ownership, terminology, architecture, movement-mode framework, locomotion capabilities, traversal-query model, route and pathfinding contracts, mount/vehicle integration boundaries, simulation LOD, multiplayer authority, persistence, registry direction, validation and specialist-document handoffs. |
| Core Philosophy | Responsive movement first; believable terrain and transport constraints second; scalable simulation throughout. Movement depth must create options and infrastructure value rather than friction for its own sake. |
| World Direction | Movement operates in a fully seed-generated voxel world. No production movement rule may depend on the retired Forest Hamlet layout, fixed roads, fixed traversal test sites or hardcoded route locations. |
| Voxel Direction | Grounding, clearance, stepping, slopes, ledges, ladders, climb anchors, road surfaces, doors, bridges and traversal edits resolve from authoritative voxel/structure state rather than presentation geometry alone. |
| Route Direction | Local physical movement and long-distance travel use different fidelity bands but share the same capability, access and route evidence. Distant travel is an abstraction of valid movement, not teleportation disguised as simulation. |
| Mount Direction | Set 30 owns mounted locomotion, rider movement state, mount traversal handling and transport-facing capacity. Creature identity, taming and biological behaviour remain with their owning systems; social ownership/assignment is consumed from Set 28. |
| Vehicle Direction | Set 30 owns land-vehicle handling, cargo/passenger movement capacity, towing movement, rails/guided transport and vehicle physics. Economy, crafting, automation, building and social systems supply their owned data through interfaces. |
| Survival Boundary | Set 29 owns stamina drain rules, injuries, fatigue, physiological carry penalties and other survival modifiers. Set 30 consumes those outputs and applies their movement consequences. |
| Economy Boundary | Set 27 owns prices, cargo value, trade routes as economic relationships, caravan jobs and profitability. Set 30 owns physical route accessibility, travel time, vehicle capacity and movement execution. |
| Social Boundary | Set 28 owns companion, passenger and mount social assignment, loyalty, recruitment, formation intent and relationship logic. Set 30 executes movement and exposes spatial/transport state. |
| Maritime Boundary | Document Set 26 remains authoritative for vessel movement and its previously approved aquatic movement systems. The overlap created by the Set 27-30 register's assignment of Swimming to Set 30 is recorded as Cross-Set Interface Amendment XSI-30-001 and is not silently resolved here. |
| Engine Direction | Godot with Summer Engine. Earlier Unreal-specific implementation assumptions are obsolete; stable IDs, authoritative state, deterministic queries, simulation LOD, save safety, prediction/reconciliation and validation principles remain reusable. |
| Registry Direction | Use the Document Set 25 qualified-ID, namespace, capability, relationship, suitability, fallback and completeness contracts. Definitions remain immutable; runtime movement/transport records remain separate persistent state. |
| Production Direction | 30A establishes architecture only. Exact speed curves, stamina costs, jump heights, vehicle tuning, mount balance and final accessibility values belong to specialist Set 30 documents and owning external systems. |
| Next Deliverable | 30B - Core Player Locomotion, Controls, Camera and Movement States. |

---

# Document Purpose

Document 30A establishes the source-of-truth architecture for terrestrial movement, traversal and transportation across Leyforge. Earlier documents already prove that movement matters to survival, exploration, combat, NPC work, settlement construction, roads, logistics, creatures, animation, multiplayer and procedural world generation. They also contain partial movement rules: the proof of concept implements first-person walking, jumping, sprinting and swimming; current settlement work uses a route graph plus bounded local voxel pathfinding; Entity Forge defines locomotion animation and navigation capability metadata; settlement infrastructure defines route classes and transport corridors; world generation creates roads, bridges, caves and terrain challenges; and the maritime expansion defines a mature movement/route/authority pattern for vessels.

Those pieces are useful, but they do not yet provide one authoritative terrestrial movement owner. Document Set 30 fills that gap.

30A does not attempt to write every locomotion mechanic in one document. It defines which system owns each decision, how movement data flows between systems, how a movement attempt becomes an authoritative result, how local movement differs from distant travel, how mounts and vehicles fit the same framework without becoming reskinned characters, and which specialist documents must provide the detailed rules.

The system is intentionally modular. A road may be built and maintained by settlement systems, priced through the economy, affected by weather and survival, occupied by companions and caravans, animated through Forge assets, and traversed by player, NPC, mount or wagon. None of those systems should need to duplicate movement logic. They should provide their owned inputs to Set 30 and consume Set 30's movement outputs.

> **Locked Architecture Rule**
>
> Every consequential movement result must be explainable from an authorised mover, a declared movement capability, a current movement state, an authoritative environment/route snapshot, applicable external modifiers and a validated destination or transition. Presentation may predict or smooth that result, but it may not invent traversability, capacity, speed, position or access.

---

# Design Sources, Authority and Supersession

| Source | Relevant Direction | Treatment in 30A |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Assigns Set 30 ownership of movement, traversal, mounts, vehicles, wagons, carts, elevators, ladders, ropes, rails, pathfinding interfaces and vehicle physics; defines required inputs and exposed Movement API. | Governing ownership contract. No Set 27, 28 or 29 gameplay rule is redefined here. |
| 00 - Master Game Design Bible | Sandbox-first movement across survival, civilisation, automation and fantasy RPG play; player roles include survivor, builder, adventurer, mage-engineer, ruler and conqueror. | Movement must support all major player fantasies and remain a means of inhabiting the world rather than a narrow combat subsystem. |
| 01 - Core Gameplay Loop | Explore -> gather -> craft -> build -> interact -> automate -> defend -> upgrade -> expand; seed-generated starts and readable moment-to-moment movement. | Movement is treated as a connective layer across every loop stage. |
| 02 - Player Progression System | Stamina is primarily used by sprinting and combat; Exploration/Survival and Animal Handling/Beast Taming progression exist; mounts are a progression path. | Set 30 consumes progression unlocks and survival modifiers but does not own skill XP, perks or stamina regeneration. |
| 03 - Blocks Registry | One-metre voxel grid, stairs, slabs, slopes, ladders, roads, rails, hazards, collision and physical states. | Supplies traversable world geometry and semantic surface/block data. Set 30 interprets those states for movement. |
| 04 - Items Registry | Armour may affect movement; backpacks, tools and utility equipment exist; inventory is slot-count based rather than a default weight simulation. | Set 30 consumes equipment movement facets; it does not invent item identity or inventory rules. |
| 07 - NPC Village System | Named NPCs have jobs, schedules, locations and persistent simulation. | NPC intent remains with NPC systems; Set 30 provides navigation/path execution and movement state interfaces. |
| 08 - Automation System | Carts, logistics, routes, machines and transport networks are part of civilisation-scale supply. | Automation owns automated production/logistics logic; Set 30 owns movement of transport bodies and route traversal where vehicles physically move. |
| 09 - Magic System | Magic can support movement and infrastructure without replacing mundane systems. | Spells/rituals remain Magic-owned; Set 30 exposes traversal hooks and executes authorised movement effects. |
| 10 - Creatures and Monsters | Taming, mounts, creature locomotion and ecology exist. | Creature identity and behaviour remain creature-owned; Set 30 owns rider/mount traversal mechanics and movement execution contracts. |
| 11 - Biomes and World Generation | Roads, caves, rivers, mountains, weather and terrain influence travel; long-distance travel includes roads, mounts, carts, rails, caravans and portals. | Worldgen supplies terrain, route candidates, hazards and topology. Set 30 determines current movement accessibility and traversal cost from that state. |
| 12 - Structures | Roads, bridges, doors, ladders, gates, tunnels and dynamic damage/restoration affect access. | Structures own physical structure state; Set 30 consumes traversal sockets, openings, route elements and damage state. |
| 14 - Dimensions | Realms may change movement conditions and route logistics. | Realm systems supply environment/physical-law modifiers; Set 30 uses the same movement contract with realm-specific capability requirements. |
| 16 - Combat, Gear and Defence | First/third-person action combat includes sprint, dodge, terrain use, equipment load and movement constraints. | Combat owns attack, dodge and combat-action rules; Set 30 provides locomotion state, displacement validation and movement execution services. |
| 17 - UI/UX System | Shared controls, camera, accessibility, world-first feedback and truthful failure reasons. | Set 30 exposes authoritative movement state/reasons; UI owns presentation and user settings surfaces. |
| 18 - Technical Implementation Plan v0.1 | Voxel-aware local navigation, hierarchical road graphs, distant travel abstraction, server-authoritative movement with prediction/reconciliation. | Retain engine-neutral architecture principles only. Unreal-specific implementation is superseded by Godot/Summer direction. |
| 19 - Settlement Growth and Player Voxel Blueprint System | Roads, parcels, routes and construction must remain navigable and support NPC movement. | Set 30 supplies route/path validation interfaces; settlement systems own planning, projects and construction intent. |
| 20 / 20D v0.2 | Roads are typed infrastructure; route classes include footpath, service path, cart road, heavy freight, emergency, public street and guided routes; effective travel depends on terrain, weather, load, vehicle, condition and permissions. | Road/building infrastructure remains Document 20-owned. Set 30 becomes authoritative for mover-specific traversal eligibility, movement cost and physical execution over those infrastructure records. |
| 22F - Entity Animation, Locomotion, Combat and Visual States | Animation consumes authorised movement parameters; movement system owns world motion; locomotion modes include ground, air, swim and climb; traversal animations include step, vault, mantle, ladder, rope, crawl, mount/dismount. | Animation is presentation. Set 30 publishes movement parameters, state transitions and approved movement windows. |
| 22H - Entity Gameplay Integration | Defines movement bodies, footprints, navigation capability tags, route-clearance metadata, mount/rider/passenger/cargo anchors and capability-vs-current-state separation. | Forge owns entity metadata/anchors; Set 30 consumes them for movement validation and runtime locomotion. |
| 24 - World Content Atlas | Routes, caravan beasts, special terrain, skylands, underground spaces and world infrastructure must be procedurally coherent. | Atlas owns world context/content identity; Set 30 owns executable movement mechanics. |
| 25A-25L - Post-Atlas Production Governance | POC retirement, Godot/Summer Engine, qualified IDs, capability interfaces, suitability, fallbacks, validation, source ownership and release gates. | Governs all Set 30 registry, interface, migration and validation design. |
| 26A-26O - Maritime Expansion | Establishes aquatic movement, vessel movement, navigation, route planning, moving-frame authority, prediction, simulation LOD and Godot/Summer technical patterns. | Maritime systems retain their approved ownership. Set 30 reuses compatible architectural patterns but does not redefine vessel mechanics. |
| 99 - POC Manual Testing Guide | Current implementation proves responsive first-person walking, jumping, sprinting and swimming; current settlement agents use route graphs plus bounded local voxel paths, step/jump one-block rises, avoid unsafe terrain and recover to safe route nodes after persistent failure. | Regression evidence only. POC identities and fixed layouts are not production authority. Reusable behaviour patterns may inform acceptance tests. |

## Supersession and Compatibility Rule

Document 30A is later than the original movement fragments in Documents 02, 11, 16, 18 and 20D. Where those documents describe *movement execution, mover-specific pathfinding or vehicle handling*, Set 30 becomes the detailed gameplay owner. Their non-movement ownership remains unchanged.

This is not permission to rewrite earlier systems casually. The final integration pass must amend main documents so that they expose inputs to Set 30 instead of retaining duplicate movement algorithms.

The following older principles remain protected:

- one-metre voxel readability;
- deterministic seed-generated topology;
- data-driven definitions and stable IDs;
- exact ownership and permission checks;
- local physical simulation with distant bounded summaries;
- save-safe persistent identity;
- authoritative multiplayer state;
- controller, accessibility and split-screen foundations;
- world-first and explainable feedback;
- physical roads, bridges, ladders and infrastructure mattering to travel.

---

# Static Table of Contents

1. Locked Movement System Identity  
2. Governing Cross-Set Interface Contract  
3. Scope Boundaries and Non-Goals  
4. Core Design Principles  
5. Canonical Terminology  
6. System Architecture and Record Separation  
7. Movement Actor and Mover Profile Model  
8. Movement Modes and State Architecture  
9. Locomotion Capability Architecture  
10. Environment, Surface and Traversal Context  
11. Traversal Query and Transition Contract  
12. Voxel Collision, Grounding, Clearance and Safe Position Rules  
13. Route Infrastructure and Traversal Graph Integration  
14. Local Navigation, Pathfinding and Steering Architecture  
15. Long-Distance Travel and Route Progress Architecture  
16. Mount, Rider, Passenger, Cargo and Towing Architecture  
17. Land Vehicle and Mobile Transport Architecture  
18. Rails, Guided Routes, Lifts and Constrained Movement  
19. Movement Modifiers and External-System Consumption  
20. Movement API and Cross-System Events  
21. Simulation LOD and Promotion/Demotion  
22. Multiplayer Authority, Prediction and Reconciliation  
23. Persistence, Save Safety and Recovery  
24. Forge, Animation, Camera, UI and Accessibility Handoffs  
25. Registry, Capability and Relationship Direction  
26. Failure, Recovery and Player-Trust Rules  
27. Validation, Testing and Acceptance Evidence  
28. Production Classification and Implementation Sequencing  
29. Document Set 30 Specialist Map and Handoffs  
30. Main-Document Integration Register  
31. Cross-Set Interface Amendments  
32. Open Decisions and Deferred Questions  
Appendix A. Movement State Template  
Appendix B. Mover Profile Template  
Appendix C. Traversal Query and Result Template  
Appendix D. Route Segment and Accessibility Template  
Appendix E. Movement API Contract Summary  
Appendix F. Standard Reason-Code Catalogue  
Appendix G. Acceptance and Regression Matrix  
Appendix H. Source-of-Truth Boundary Checklist

---

# 1. Locked Movement System Identity

The Movement, Traversal and Transportation System is the authoritative physical-travel layer for terrestrial Leyforge gameplay. It answers a simple player-facing question with a deep internal contract: **Can this thing move from here to there, how does it do so, what does the world make that movement cost, and what state results?**

That question applies at many scales:

- a player stepping over a slab;
- an injured NPC walking to a clinic;
- a builder using a ladder;
- a creature climbing a wall;
- a rider mounting a beast;
- a wagon turning through a gate;
- a minecart following a guided route;
- a lift changing floors;
- a caravan crossing a damaged bridge;
- a distant traveller progressing between regions;
- an agent recovering after a voxel edit invalidates its path.

> **Locked Rule**
>
> Movement is never granted by animation, visual appearance, a straight-line distance or a destination request alone. It requires a valid mover capability, a valid current state, a traversable physical or abstract route, sufficient clearance/access and an authorised movement transition.

## 1.1 Design Promise

A player should be able to predict movement from the world. A steep cliff looks difficult. A road looks easier than tangled forest. A narrow gate visibly excludes a heavy wagon. A broken bridge blocks a route. A ladder creates vertical access. A mount makes distance easier without turning every biome into flat highway. A caravan route can be understood before the player commits valuable cargo. When movement fails, the player receives a reason that corresponds to the actual world state.

## 1.2 Identity Layers

| Layer | Meaning | Example |
| --- | --- | --- |
| Movement Definition | Immutable rules for a movement family, mode or transport class. | Humanoid ground profile; wagon handling family. |
| Mover Profile | Capability and geometry data for one entity/body configuration. | Adult humanoid, crouched humanoid, pack animal, two-axle wagon. |
| Runtime Movement Record | Current authoritative movement state. | Grounded, sprinting, velocity, current route leg, rider link. |
| Traversal Context | Read-only environment and route data relevant to the attempt. | Surface, slope, clearance, road class, hazard, weather, door state. |
| Movement Modifier Snapshot | Consumed outputs from survival, combat, magic, equipment and status systems. | Set 29 stamina modifier; injury speed modifier; spell-authorised movement effect. |
| Navigation Intent | Desired destination or route from player/AI/system. | Move to work marker; travel to settlement; follow caravan leader. |
| Movement Result | Authoritative success, partial success or failure result. | Position changed; route blocked; transition rejected; safe fallback used. |
| Presentation Snapshot | Non-authoritative state for animation, camera, UI, audio and VFX. | gait, speed_normalised, grounded, slope, mount state, warning reason. |

## 1.3 What Set 30 Ultimately Owns

Set 30 owns the executable rules for:

- terrestrial locomotion modes;
- movement-state transitions;
- movement bodies and mover-specific clearance use;
- stepping, jumping, vaulting, mantling, climbing and crawl traversal;
- ladders, ropes and traversal anchors;
- gliding and other approved non-vessel aerial traversal;
- land and flying mount riding mechanics;
- carts, wagons and land-vehicle movement;
- rail/guided movement and elevators/lifts;
- pathfinding interfaces and route execution;
- mover-specific route accessibility;
- movement-derived travel time;
- cargo/passenger movement capacity interfaces;
- vehicle condition as it affects movement;
- local movement authority and distant movement abstraction;
- movement prediction/reconciliation boundaries;
- movement-facing persistence, reason codes and validation.

## 1.4 What Set 30 Does Not Own

Set 30 does not own:

- hunger, fatigue, injury severity, body temperature, disease or stamina regeneration;
- prices, wages, cargo value, profit, supply/demand or trade contracts;
- friendship, loyalty, recruitment, social ownership or companion personality;
- item crafting recipes, materials or inventory identity;
- creature taming rules, reproduction or species AI goals;
- combat attack/dodge balance, damage or armour systems;
- road construction, settlement service definitions or building project selection;
- spell definitions, mana costs or magical progression;
- vessel buoyancy, ship propulsion or naval navigation;
- procedural terrain generation;
- animation authoring or final audiovisual presentation.

---

# 2. Governing Cross-Set Interface Contract

The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 is incorporated into this document by reference and treated as a binding contract.

## 2.1 Inputs Consumed from Set 27 - Economy, Trade and Commerce

Set 30 may consume:

- vehicle prices;
- fuel costs;
- trade cargo definitions/assignments;
- wagon ownership as an economic/legal record where Set 27 owns it;
- caravan jobs and economic route intent;
- economic route selection priorities when an economy agent requests travel.

Set 30 must not define:

- buy/sell price;
- cargo value;
- route profit;
- wages;
- merchant stock;
- taxes;
- economic supply/demand.

Movement exposes physical feasibility and time; Set 27 decides whether a feasible movement is economically worthwhile.

## 2.2 Inputs Consumed from Set 28 - Dialogue, Social Systems and Companions

Set 30 may consume:

- companion riding intent;
- formation intent and formation membership;
- passenger assignment;
- mount ownership/permission state where socially governed;
- follower travel intent;
- social/command permission to board, ride or accompany.

Set 30 must not decide:

- who is loyal;
- who agrees to ride;
- who follows whom socially;
- who is recruited;
- relationship progression;
- companion personality or refusal logic.

Set 30 validates whether an assigned rider/passenger can physically use the seat, route or formation slot and executes the movement.

## 2.3 Inputs Consumed from Set 29 - Survival, Health and Biological Systems

Set 30 may consume:

- current stamina/exertion availability and movement modifiers;
- injury movement modifiers;
- physiological carry penalty;
- fatigue movement modifier;
- temperature/exposure movement modifier;
- status restrictions such as unable_to_sprint or unable_to_climb.

Set 30 must not calculate:

- stamina regeneration;
- hunger/thirst effect curves;
- fatigue accumulation;
- injury severity;
- medical treatment;
- body temperature;
- biological encumbrance.

Set 30 translates supplied modifiers into movement behaviour according to the current locomotion or transport mode.

## 2.4 Movement API Exposed by Set 30

The governing interface requires:

- `CurrentMovementMode()`
- `MaxSpeed()`
- `CargoCapacity()`
- `TraversalCost()`
- `VehicleCondition()`
- `MountStatus()`
- `TravelTime()`
- `RouteAccessibility()`

30A expands these into stable semantic contracts in Section 20 without changing their ownership.

## 2.5 Interface Discipline

Cross-set integration uses five rules:

1. An external system supplies an owned fact, not a suggested duplicate formula.
2. Set 30 may transform that input only for movement-specific consequences.
3. Set 30 returns movement state/results rather than reaching into another system to mutate its state directly.
4. Every denial or degradation should identify which owner supplied the blocking fact where relevant.
5. New cross-set needs are recorded in Section 31 rather than silently invented.

---

# 3. Scope Boundaries and Non-Goals

## 3.1 In Scope for 30A

30A defines architecture for all Set 30 specialist documents. It may establish shared terminology, data flow, state categories, interface rules, validation philosophy and source-of-truth boundaries.

## 3.2 Explicit Non-Goals

30A does not lock:

- exact player walk/run/sprint metres per second;
- exact jump height or gravity tuning;
- exact stamina drain per movement mode;
- exact mount speeds or breed stats;
- exact wagon mass, wheel friction or suspension values;
- final flying-mount control scheme;
- final glider aerodynamics;
- exact rail gauge or rail construction costs;
- exact elevator power costs;
- public transport schedules;
- economic caravan routing;
- full pedestrian traffic simulation;
- full ragdoll locomotion;
- full wheel-by-wheel soil deformation;
- realistic horse biomechanics;
- fluid dynamics or ship physics;
- unrestricted physics vehicles as a replacement for designed transport;
- permanent navmesh rebuild of the entire infinite world after every voxel edit.

## 3.3 Anti-Micromanagement Rule

Movement depth should create readable choices, not continuous chores. The player should not need to:

- manually command every footstep of followers;
- inspect invisible path costs;
- dispatch every routine village cart;
- re-seat passengers after every save/load;
- constantly repair trivial vehicle wear;
- hold a sprint key forever when toggle/assist is preferred;
- perform precision parkour for ordinary settlement access;
- manually unstuck NPCs from routine route changes.

Expert players may inspect deeper route, vehicle and traversal information, but normal play should expose causes rather than raw solver internals.

---

# 4. Core Design Principles

## 4.1 Responsive Before Realistic

Player input must feel immediate. Physical plausibility is valuable when it improves readability, weight and world interaction, but the game is not a locomotion simulator. Starts, stops, turning, jumping and camera response may be tuned for responsiveness while preserving believable constraints.

## 4.2 Terrain Must Matter Without Becoming Tedious

Terrain influences movement through slope, clearance, footing, hazards, weather, vegetation, water, route quality and structure state. However, ordinary voxel irregularities should not trap the player or cause constant micro-jumping. Step handling, stairs, slopes and forgiving edge logic should make constructed spaces comfortable.

## 4.3 Infrastructure Must Earn Its Value

Roads, bridges, tunnels, ladders, rails, lifts and transport vehicles should materially improve travel, safety, capacity or reliability. Advanced traversal must not make all infrastructure irrelevant.

## 4.4 Capability Over Named Content

Following Set 25, traversal requirements should be expressed as capabilities rather than one required item or creature. A region may require a capability such as `traversal.vertical.basic`, `transport.freight.medium`, or `route.clearance.cart` rather than a named horse, wagon or grapple.

## 4.5 Physical Local, Abstract Distant

Near players, movement should be visible and collision-aware. Far away, travellers and caravans may advance through route records. The abstraction must preserve the same route accessibility, capacity, travel time, ownership, hazard and interruption logic.

## 4.6 No Silent Teleportation

Fast travel, portals, respawn and explicit recovery systems may relocate actors when their owning rules allow it. Ordinary distant travel may not silently skip impossible terrain or closed routes. A traveller demoted to abstract transit must have a valid route or declared off-road capability.

## 4.7 Safe Failure

When dynamic voxel edits invalidate a path or traversal target, the entity should stop, replan, retreat to a known safe point, dismount safely, wait or request intervention. Freezing mid-air, clipping through terrain or deleting the entity is not acceptable recovery.

## 4.8 One Movement Truth

Animation, UI, audio, VFX, AI and economy must observe the same movement result. A wagon cannot look passable to the UI while the movement service reports the bridge is too narrow. An NPC cannot be visually climbing a ladder while the authoritative state is walking on the ground.

---

# 5. Canonical Terminology

| Term | Definition |
| --- | --- |
| Mover | Any actor or transport body whose position/orientation may be changed by Set 30 movement. |
| Rider | An entity occupying a mount control/ride role. |
| Passenger | An entity spatially attached to a transport body without primary movement control. |
| Mount | A living or construct entity that provides rider-carried locomotion under Set 30 riding rules. |
| Vehicle | A non-vessel transport body with a persistent or transient movement definition. |
| Transport Body | Shared term for mount, cart, wagon, rail vehicle, lift platform or other Set 30 mobile carrier. |
| Movement Mode | Current broad physical locomotion mode, such as ground, air, climb, crawl, glide, ride or vehicle. |
| Movement State | More specific runtime state inside a mode, such as grounded_walk, sprint, falling, ladder_climb or wagon_grounded. |
| Traversal Action | A bounded transition requiring validation, such as vault, mantle, mount, dismount, ladder enter or rope transfer. |
| Mover Profile | Immutable capability/geometry definition used for clearance, mode support and handling. |
| Movement Record | Mutable authoritative runtime record for a mover. |
| Traversal Context | Authoritative sample of terrain, structure, route, hazard and permission information relevant to movement. |
| Route Segment | A typed traversable connection with geometry, class, condition, permissions and capacity information. |
| Route Graph | Network of route nodes and segments used for medium/long-distance planning. |
| Local Navigation | Detailed near-field pathing through voxel/structure space. |
| Travel Plan | Persistent sequence of route legs, transitions and destination intent. |
| Route Accessibility | Set 30 result stating whether a mover/transport configuration can currently use a route or route leg. |
| Traversal Cost | Relative movement cost of a local surface/segment for a particular mover and current modifiers. |
| Travel Time | Estimated or resolved duration for a valid route based on current mover/transport state and route context. |
| Safe Position | Last authoritative position known to satisfy required collision/support constraints and eligible for recovery. |
| Formation Slot | Spatial role used to place members of a group relative to a leader/path. Social ownership of formation intent remains Set 28. |
| Movement Capability | Functional traversal ability declared through Set 25 capability contracts. |
| Movement Inhibitor | External or local state that limits a capability without deleting it, such as injury, closed gate or broken wheel. |
| Moving Frame | A transport-local spatial frame that carries occupants/cargo and derives world transforms at runtime. |

---

# 6. System Architecture and Record Separation

## 6.1 Architectural Layers

| Layer | Owns | Must Not Own |
| --- | --- | --- |
| Movement Definitions | Mover profiles, movement modes, traversal action definitions, transport handling families, capability offers. | Runtime position, social ownership, economy, survival formulas. |
| Runtime Movement Service | Current movement mode/state, velocity/intent where applicable, transitions, safe positions, movement result. | Animation clips, dialogue, prices, health formulas. |
| Traversal Query Service | Clearance, support, slope, ledge/anchor, route segment and transition validation. | Terrain generation or structure construction. |
| Navigation Service | Local path queries, route graph planning, replanning, steering interface, path evidence. | NPC goals, quest logic, economic profitability. |
| Mount/Transport Service | Rider/passenger spatial links, transport-body handling, cargo movement capacity, towing movement relations. | Recruitment, taming, inventory ownership, vehicle price. |
| Travel Service | Route plan execution, ETA/travel-time evidence, distant transit, interruption and promotion/demotion. | Trade contract outcome, quest reward, social decision to travel. |
| Authority/Networking Adapter | Command validation, prediction/reconciliation boundary, relevance and state snapshots. | Duplicate gameplay movement formulas on clients. |
| Persistence Adapter | Movement records, active travel plans, mount/vehicle links, safe recovery state, migration. | Definition ownership or worldgen source. |
| Presentation Adapter | Animation parameters, camera state, UI summaries, sound/VFX hooks. | Authoritative position or traversability. |

## 6.2 Definition/Runtime Separation

Definitions are immutable and use stable IDs. Runtime records reference definitions and store only state that can change.

A wagon definition does not store the current cargo weight, position or broken wheel. A movement profile does not store the current injury modifier. A route segment definition does not store a traveller's current progress.

## 6.3 Canonical Command Flow

```text
Player / AI / Quest / Social / Economy Intent
        |
        v
Movement Command Request
        |
        v
Authority + Permission Check
        |
        v
Current Mover Profile + Runtime State
        |
        +---- consumes external modifiers (Set 29, Combat, Magic, Equipment)
        |
        +---- consumes environment/route snapshot (World, Structures, 20D, Set 26 where relevant)
        |
        v
Traversal / Path / Transport Validation
        |
        v
Authoritative Movement Result
        |
        +---- Movement Event
        +---- Updated Movement Record
        +---- Presentation Snapshot
        +---- Cross-system query outputs
```

## 6.4 No Scene-Path Authority

Godot node paths, skeleton bones, animation tracks and temporary physics nodes are runtime implementation details. Persistent movement identity uses definition IDs, runtime entity/vehicle IDs, spatial-frame IDs and stable route/anchor references.

---

# 7. Movement Actor and Mover Profile Model

A mover profile describes what a body *can physically attempt* before external state is applied.

## 7.1 Shared Mover Profile Fields

| Field | Purpose |
| --- | --- |
| profile_id | Stable qualified definition ID. |
| mover_family | humanoid, quadruped, cart, wagon, rail_vehicle, lift_platform, construct, etc. |
| movement_modes | Supported movement domains. |
| body_shape_ref | Movement-body/collision proxy from entity or vehicle definition. |
| width/footprint | Horizontal clearance. |
| standing_height | Vertical clearance. |
| alternate_clearance_profiles | Crouch, crawl, folded wing, mounted rider clearance, loaded wagon height. |
| step_capability | Ordinary step/curb negotiation class. |
| slope_capability | Stable slope/grade bands. |
| turn_radius | Space needed to redirect movement. |
| acceleration_class | Handling response band rather than final tuning. |
| braking_class | Deceleration/stop behaviour band. |
| terrain_preferences | Optional preferences used by path selection. |
| surface_restrictions | Hard exclusions or special requirements. |
| transition_capabilities | Jump, mantle, ladder, rope, mount, glide, lift, rail transfer, etc. |
| door/passage_class | Minimum opening/turning/clearance class. |
| hazard_tolerance_refs | References to owned hazard/survival capabilities. |
| transport_role | self_mover, mount, tow_source, tow_load, passenger_carrier, freight_carrier. |
| spatial_frame_profile | If the mover carries passengers/cargo in a moving local frame. |
| presentation_profile_ref | Forge animation/visual profile. |

## 7.2 Capability Versus Availability

A profile says a humanoid *can sprint*. Current runtime state may say sprinting is unavailable because Set 29 reports exhaustion, an injury state forbids it, a combat action locks movement, the terrain is unsuitable or a carrying configuration exceeds the relevant movement permission.

Capabilities therefore use three layers:

1. **Declared capability** - what the definition supports.
2. **Context eligibility** - whether environment, route and equipment allow it.
3. **Runtime availability** - whether current external and movement state permit it now.

## 7.3 Shared Profile Families

30A recognises, without fully tuning, these major profile families:

- humanoid on foot;
- small/medium/large quadruped;
- multi-legged climber;
- flying creature/mount;
- gliding mover;
- handcart;
- animal-drawn cart;
- wagon/carriage;
- heavy freight vehicle;
- guided rail vehicle;
- lift/elevator platform;
- magical/construct land transport;
- attached/towed body.

Aquatic player profiles remain subject to XSI-30-001.

---

# 8. Movement Modes and State Architecture

## 8.1 Top-Level Modes

The universal movement record supports a small number of top-level modes. Detailed specialist documents may add substates without creating competing top-level semantics.

| Mode | Purpose | Primary Detail Owner |
| --- | --- | --- |
| Ground | Walk/run/sprint/crouch/crawl and ordinary grounded movement. | 30B |
| Airborne | Jump rise/fall, launch, fall and landing. | 30B/30D |
| Traverse | Vault, mantle, ledge, ladder, rope, grapple and similar bounded transitions. | 30C |
| Glide | Controlled unpowered aerial descent/travel. | 30D |
| Mounted | Rider-controlled or assisted mount movement. | 30E |
| Vehicle | Land vehicle movement, towing and passengers. | 30F/30G |
| Guided | Rail, lift, constrained track or scripted physical guide movement. | 30G |
| Aquatic | Water-contact/swim family; ownership reconciliation pending XSI-30-001. | Set 26/Set 30 integration pending |
| Disabled/Restrained | Movement intentionally prevented or constrained. | Set 30 with owning cause system |
| Recovery | Safe fallback/reposition process after invalid movement state. | Set 30 |

## 8.2 State Transition Rules

Every transition declares:

- source mode/state;
- destination mode/state;
- capability requirement;
- environment/anchor requirement;
- clearance requirement;
- external-state permission;
- authority requirement;
- movement commitment window where applicable;
- failure result;
- safe fallback;
- presentation event.

## 8.3 State Hysteresis

Movement should avoid flickering between states at boundaries. Examples include grounded/falling near small steps, mounted/dismounting during network correction, ladder/ground at the bottom rung, and water/shore boundaries.

## 8.4 Action Locks

Combat, work, dialogue, interaction, animation or scripted world actions may request movement locks. Set 30 interprets only the movement consequence:

- none;
- directional restriction;
- speed cap;
- rotation cap;
- transition restriction;
- full movement lock.

The requesting owner remains responsible for why the lock exists.

---

# 9. Locomotion Capability Architecture

Set 30 registers movement capabilities through the Set 25 capability framework. Capability IDs are illustrative until the final registry pass freezes them.

## 9.1 Capability Families

Potential capability families include:

- `movement.ground.walk`
- `movement.ground.run`
- `movement.ground.sprint`
- `movement.ground.crawl`
- `traversal.jump.basic`
- `traversal.step`
- `traversal.vault.low`
- `traversal.mantle`
- `traversal.climb.ladder`
- `traversal.climb.rope`
- `traversal.climb.surface`
- `traversal.glide`
- `mount.ride.ground`
- `mount.ride.flight`
- `transport.handcart`
- `transport.wagon`
- `transport.freight.heavy`
- `transport.rail`
- `transport.lift`
- `route.follow.road`
- `route.offroad.<band>`

These names are semantic examples, not final IDs.

## 9.2 Capability Requirements

A traversal obstacle, route or content package may require a capability without naming one provider. A vertical ruin route might accept ladder climbing, rope climbing, a validated mantle route, gliding from a higher point, a magical traversal provider, a creature mount or an alternate ground route.

This preserves sandbox freedom and seed validity.

## 9.3 Capability Fallbacks

Movement fallback groups follow Set 25's least-intrusive repair hierarchy. If a generated required route becomes invalid, valid remedies may include:

- another route;
- another crossing;
- a compatible traversal capability;
- a road/bridge/tunnel project;
- an alternate provider obtained through trade/research/quest;
- deterministic route repair in unexplored space;
- explicit world-creation failure if no safe repair exists.

The system must never silently paste a fixed POC bridge, horse or grapple point into every seed.

---

# 10. Environment, Surface and Traversal Context

Set 30 does not generate terrain or weather. It consumes an authoritative movement-facing snapshot.

## 10.1 Environment Snapshot Fields

A local traversal context may include:

- voxel collision/support result;
- surface material and semantic tags;
- local normal/slope;
- step/ledge height;
- clearance volume;
- overhead clearance;
- footing stability;
- loose/slippery/sticky surface tags;
- water/fluid contact where relevant;
- climbable tags;
- ladder/rope/traversal-anchor data;
- door/gate/opening state;
- route segment identity/class;
- bridge/load class;
- structure condition;
- hazard tags;
- weather/exposure modifier interfaces;
- ownership/permission state;
- navigation reservations;
- dynamic obstacle snapshot.

## 10.2 Surface Meaning

A surface may change:

- traction/acceleration;
- braking;
- ordinary step reliability;
- traversal cost;
- permitted vehicle class;
- noise/track presentation hooks;
- route preference;
- fall/landing behaviour;
- need for special equipment or capability.

The exact survival or damage consequences remain with their owners.

## 10.3 World Readability

Movement-affecting terrain should be visually and audibly legible where practical. Mud, ice, deep snow, unstable rubble, steep slopes, damaged bridges and route closures should have world evidence before hidden numbers become decisive.

---

# 11. Traversal Query and Transition Contract

A traversal query asks whether a mover can perform a bounded transition from its current state.

## 11.1 Query Inputs

- mover ID and profile;
- current movement record revision;
- requested traversal action;
- source position/spatial frame;
- target position/anchor/route segment;
- equipment/carry configuration facets;
- external modifier snapshot;
- authority/permission context;
- current environment snapshot.

## 11.2 Query Result

A result returns:

- allowed / allowed_with_warning / denied;
- resolved target transform or target anchor;
- expected movement mode/state transition;
- clearance evidence;
- required capability/provider;
- cost class if Set 30 owns it;
- reason code;
- fallback candidates where safe;
- expiry/revision token so stale results are not reused after world edits.

## 11.3 Bounded Traversal Actions

Traversal actions are not free teleport windows. A mantle, vault or mount action must validate destination clearance and remain within configured reach/height/angle bands. Animation may use root motion or motion warping only inside the authorised movement window.

## 11.4 Dynamic Invalidation

If the target changes during a traversal action:

- complete if the change is irrelevant and safety remains valid;
- adjust within an authorised tolerance;
- abort to source side if safe;
- move to a validated fallback contact;
- enter recovery if neither endpoint remains valid.

The system must never resolve by clipping through newly placed blocks.

---

# 12. Voxel Collision, Grounding, Clearance and Safe Position Rules

## 12.1 Movement Body

The movement body is simpler than the visible body. Humanoid arms, hair and equipment normally do not enlarge world collision. Large cargo, unusual anatomy or transport bodies may select an alternate profile.

## 12.2 Grounding

Grounded state must derive from authoritative collision/support queries rather than animation foot placement.

Grounding considers:

- valid support surface;
- allowed ground snap distance;
- slope stability;
- movement mode;
- velocity/contact state;
- temporary one-way or moving support;
- transport-local spatial frame where standing on a moving platform/vehicle.

## 12.3 Step Handling

Ordinary small voxel rises should be handled as step movement when the profile permits it, reducing unnecessary jump input. Specialist 30B tuning will define exact thresholds.

## 12.4 Safe Position Record

For player, NPC, mount and transport bodies likely to encounter dynamic voxel edits, Set 30 keeps a recent safe position or safe route node where practical.

Safe recovery may use it when:

- terrain is removed under an unloaded/promoted actor;
- a save migration leaves an invalid contact;
- a route node is destroyed while demoted;
- a network correction places a client visual inside collision;
- a dynamic structure closes around an actor;
- a path repeatedly fails and the actor cannot resolve locally.

Recovery is a safety mechanism, not a normal fast-travel shortcut.

---

# 13. Route Infrastructure and Traversal Graph Integration

Document 20D defines physical route infrastructure; Set 30 defines mover-specific traversal over it.

## 13.1 Route Classes Consumed from Infrastructure

The current infrastructure model includes:

- footpath;
- service path;
- cart road;
- heavy freight road;
- emergency route;
- public street;
- water route;
- rail/guided route;
- portal route.

Set 30 does not redefine what makes a settlement road/project valid. It consumes the built segment's authoritative properties.

## 13.2 Movement-Facing Route Segment Facet

Each route segment should expose, directly or through an extension facet:

- stable segment ID;
- endpoints;
- route class;
- surface type/quality;
- width/clearance;
- vertical clearance;
- grade/slope band;
- turn constraints;
- supported transport classes;
- bridge/load class where relevant;
- door/gate/lock relationships;
- ownership/permissions;
- one-way or directional restrictions;
- current condition;
- closure/obstruction state;
- weather/environment modifier refs;
- danger/hazard references;
- route capacity/congestion abstraction where relevant;
- navigation revision.

## 13.3 Route Accessibility

`RouteAccessibility()` is mover-specific. The same bridge may be:

- accessible to pedestrians;
- accessible to a riding mount;
- inaccessible to a loaded wagon;
- temporarily inaccessible to an injured NPC;
- restricted by a closed gate;
- unsafe but passable under an emergency policy.

## 13.4 Roads as Choice Multipliers

Roads should not be mandatory everywhere. Off-road travel remains viable for capable movers, but roads can improve:

- reliable speed;
- stamina/exertion efficiency via Set 29 interface;
- vehicle access;
- cargo capacity utilisation;
- navigation confidence;
- safety/patrol coverage;
- weather resilience;
- distant travel predictability.

---

# 14. Local Navigation, Pathfinding and Steering Architecture

Set 30 owns pathfinding interfaces, not every AI decision.

## 14.1 Navigation Layers

| Layer | Purpose |
| --- | --- |
| Local Walkability/Traversal Layer | Detailed voxel/structure reachability near active agents. |
| Transition Links | Ladders, jumps, mantles, doors, lifts, mounts, portals and other explicit mode changes. |
| Route Graph | Roads, trails, tunnels, bridges and transport corridors for medium/long-distance movement. |
| Regional Connectivity | Coarse region/settlement/route reachability used before expensive local planning. |
| Formation/Group Layer | Shared path corridor plus member slots/spacing; social intent comes from Set 28. |
| Transport Layer | Route eligibility for mount/vehicle class, turning, towing, clearance and load. |

## 14.2 Planning Direction

Pathfinding should use hierarchy rather than one enormous A* search across the voxel world.

Typical path:

```text
Destination Intent
 -> regional/route plan
 -> route entry
 -> active route legs
 -> local approach path
 -> traversal links / doors / work marker
```

## 14.3 Dynamic Voxel Updates

Block edits, door state, bridge damage and construction should invalidate only affected navigation cells/links/segments. Rebuilds should be bounded and asynchronous where possible.

Agents using invalidated paths receive a revision mismatch and replan rather than continuing through stale geometry.

## 14.4 Local Steering

Local steering handles:

- moving around nearby bodies;
- doorway/ladder reservations;
- passing and queueing;
- formation spacing;
- short obstacle avoidance;
- stopping distance;
- mount/vehicle turning envelopes.

It must not override hard route restrictions or push actors through protected geometry.

## 14.5 Pathfinding Failure

A failed path result should distinguish:

- no route exists;
- route exists but current mover lacks capability;
- route exists but access/permission is denied;
- route temporarily blocked;
- destination currently unloaded/unresolved;
- local path budget exceeded;
- route data stale;
- transport too large/heavy;
- external movement restriction;
- no safe fallback.

---

# 15. Long-Distance Travel and Route Progress Architecture

## 15.1 Travel Is Not Fast Travel by Default

Long-distance travel may be physically represented near players and abstracted at distance. The character, mount, wagon or caravan still advances through a valid route plan with time, interruptions and state.

## 15.2 Travel Plan Fields

A travel plan may store:

- traveller/group/transport IDs;
- origin and destination;
- route legs;
- current leg/progress;
- movement/transport profile;
- departure time;
- estimated arrival band;
- route-accessibility revision;
- expected rest/resupply interfaces from owning systems;
- hazard/event hooks;
- group/formation reference;
- cargo/passenger capacity summary;
- fallback route policy;
- interruption state.

## 15.3 Travel Time

`TravelTime()` is a movement result. It may consider:

- route length;
- route class/quality;
- terrain cost;
- movement profile;
- mount/vehicle performance;
- current Set 29 movement modifiers;
- load/cargo movement effects;
- weather/environment movement facets;
- route closures/detours;
- planned movement mode changes;
- permitted travel policy.

It does not calculate lodging price, food cost, wages, trade profitability or contract penalties.

## 15.4 Distant Interruption

Distant transit may be interrupted by events owned elsewhere. Set 30 records movement consequences such as:

- stopped;
- delayed;
- rerouted;
- forced to dismount;
- vehicle disabled;
- route closed;
- traveller promoted to active simulation.

The event/combat/economy/social owner decides why the interruption occurs.

---

# 16. Mount, Rider, Passenger, Cargo and Towing Architecture

## 16.1 Mount Boundary

A mount is not merely a vehicle skin. It remains a creature/entity with anatomy, animation, condition and AI owned by its source systems. Set 30 adds a riding/movement relationship.

## 16.2 Required Mount Interfaces

A mount-compatible entity should expose:

- mount role/capability;
- rider seat/anchor;
- rider clearance profile;
- mount movement profile;
- passenger/cargo anchors if supported;
- gait/speed bands;
- turn/clearance requirements;
- environment capability bands;
- mount/dismount traversal anchors;
- equipment/harness sockets;
- towing capability if supported;
- current physical availability.

Set 28 supplies social permission/assignment. Set 29 supplies biological movement modifiers where applicable. Creature systems supply species/taming state.

## 16.3 Rider Authority

Possible control modes include:

- direct rider control;
- guided/assisted control;
- destination command with mount AI execution;
- passenger-only;
- NPC-controlled mount;
- caravan-following mount.

The final control feel is detailed in 30E.

## 16.4 Mount Status

`MountStatus()` should return a structured snapshot such as:

- mount identity;
- mounted/unmounted/transition state;
- rider/passenger occupancy;
- current movement mode;
- movement availability;
- capacity summary;
- current movement inhibitors;
- route compatibility summary;
- towing state;
- authoritative owner/permission references without redefining them.

## 16.5 Towing

Towing is a movement relation between a tow provider and a tow load. Set 30 owns geometry, combined movement envelope, turning, route clearance and movement response. Cargo ownership, economic value and social permission remain external.

---

# 17. Land Vehicle and Mobile Transport Architecture

## 17.1 Vehicle Identity

A land vehicle is a physical transport body that provides one or more of:

- passenger carrying;
- cargo carrying;
- towing;
- local hauling;
- regional travel;
- guided industrial movement;
- magical/construct transport.

## 17.2 Vehicle Definition Layers

| Layer | Meaning |
| --- | --- |
| Vehicle Definition | Stable identity, class, compatible components and movement family. |
| Movement/Handling Profile | Turning, acceleration, braking, slope, terrain, clearance and control bands. |
| Capacity Profile | Passenger/cargo/tow capacity interfaces. |
| Component State | Wheels, axle, harness, steering, brake, power/drive and damage-related movement facets. |
| Vehicle Runtime Record | Transform, velocity/state, occupants, tow links, current route, movement condition. |
| Presentation Profile | Visual body, wheel animation, audio/VFX hooks and camera anchors. |

## 17.3 Vehicle Physics Direction

Set 30 should use the least complex physics model that preserves:

- readable acceleration and braking;
- terrain/slope meaning;
- turning radius;
- collision consequence;
- load effect;
- towing effect;
- wheel/ground contact where it matters;
- stable multiplayer authority;
- recoverable save/load;
- predictable NPC use.

Full per-wheel suspension/soil simulation is not required by default.

## 17.4 Vehicle Condition

`VehicleCondition()` is movement-facing. It reports how current physical component state affects mobility. Damage ownership may involve Items, Combat, Structures or vehicle-specific definitions; Set 30 converts relevant damage into movement consequences such as speed cap, steering degradation, immobilisation or unsafe-operation warning.

---

# 18. Rails, Guided Routes, Lifts and Constrained Movement

Guided movement uses a declared path/guide instead of full free steering.

## 18.1 Guided Route Families

- minecart rail;
- freight rail;
- passenger rail;
- funicular/incline rail;
- elevator/lift shaft;
- hoist platform;
- magical guideway;
- moving platform route;
- constrained industrial carrier.

## 18.2 Shared Guided-Movement Contract

A guided route provides:

- guide/track identity;
- connected segments;
- direction rules;
- junction state;
- clearance envelope;
- supported vehicle classes;
- speed/grade constraints;
- stop/station anchors;
- ownership/permission;
- power/control interfaces when relevant;
- damage/closure state.

Automation or infrastructure systems may own power, control logic and construction. Set 30 owns movement along the valid guide.

## 18.3 Lift/Elevator Boundary

A lift is both infrastructure and a moving platform. The structure/automation owner supplies shaft, stops, power/control availability and permissions. Set 30 owns platform movement state, occupant frame transfer, collision safety and travel-time result.

---

# 19. Movement Modifiers and External-System Consumption

Set 30 uses a modifier stack but does not own every modifier source.

## 19.1 Modifier Categories

| Category | Typical Owner | Set 30 Use |
| --- | --- | --- |
| Stamina/exertion | Set 29 | Determines current ability to sustain sprint/climb/burst where the mode uses it. |
| Injury | Set 29 / Combat application | Speed, gait availability, climb/jump restrictions, mount/vehicle control effects. |
| Physiological carry penalty | Set 29 | Applies to actor locomotion without redefining inventory capacity. |
| Equipment movement facet | Items/Combat | Armour or equipment movement restrictions/bonuses. |
| Surface/terrain | World/Blocks/Structures | Traction, slope, route cost, clearance. |
| Weather/environment | World/Weather/Set 26 where relevant | Movement-specific environmental modifier. |
| Magic effect | Magic | Authorised movement bonus, force, glide, blink/teleport interface where spell rules permit. |
| Combat action lock | Combat | Restricts or caps movement during an action. |
| Social/group policy | Set 28 | Formation or follow intent, not locomotion capability. |
| Economy travel intent | Set 27 | Destination/cargo/job intent, not movement feasibility. |

## 19.2 Modifier Precedence

Recommended precedence:

1. Hard movement prohibition/invalid geometry.
2. Movement-mode capability availability.
3. Safety/permission constraint.
4. Vehicle/mount physical condition.
5. External status/injury restrictions.
6. Terrain/environment cost.
7. Equipment/load modifiers.
8. beneficial skill/perk/magic modifiers.
9. accessibility assists within allowed rules.

No beneficial modifier may override an explicitly hard invalid route unless its owning system provides a capability that makes the route valid.

---

# 20. Movement API and Cross-System Events

The Movement API is a query surface. Mutating movement occurs through validated commands, not direct setter calls from external systems.

## 20.1 Required Query Contracts

### `CurrentMovementMode(entity_or_transport_id)`
Returns current top-level mode, substate, spatial frame and authoritative revision.

### `MaxSpeed(entity_or_transport_id, context?)`
Returns current achievable speed cap/band for the requested/current mode after movement-owned and consumed modifiers. It does not reveal or recalculate hidden survival formulas.

### `CargoCapacity(transport_id, route_context?)`
Returns movement-safe cargo/passenger/tow capacity for the current transport configuration and optionally the specified route. Inventory ownership and cargo value remain external.

### `TraversalCost(mover_id, segment_or_context)`
Returns mover-specific relative cost, blockers and confidence for a surface/segment/traversal context.

### `VehicleCondition(vehicle_id)`
Returns movement-facing physical condition, operability and mobility faults.

### `MountStatus(mount_or_rider_id)`
Returns mount/rider occupancy, movement availability and relevant route/capacity state.

### `TravelTime(mover_or_group_id, route_or_destination)`
Returns estimated/resolved travel duration with assumptions, current route revision and uncertainty band where needed.

### `RouteAccessibility(mover_or_transport_id, route_or_segment)`
Returns accessible, warning, blocked or unknown with reason evidence.

## 20.2 Additional Internal/Shared Queries

Potential shared queries include:

- `CanTransitionMovementMode()`
- `FindTraversalOptions()`
- `FindNearestSafePosition()`
- `GetMovementCapabilitySnapshot()`
- `GetRouteClearanceRequirement()`
- `GetFormationMovementEnvelope()`
- `GetTransportOccupancy()`
- `GetMovementReason()`

New cross-set public interfaces require amendment review before becoming mandatory.

## 20.3 Movement Commands

Examples:

- RequestMoveVector
- RequestSprintState
- RequestJump
- RequestTraversalAction
- RequestMount
- RequestDismount
- RequestVehicleControl
- RequestRouteTravel
- RequestFollowRoute
- RequestBoardTransport
- RequestLeaveTransport
- RequestTowLink
- RequestGuidedRouteControl
- RequestMovementRecovery

## 20.4 Movement Events

Events describe committed facts:

- MovementModeChanged
- TraversalStarted
- TraversalCompleted
- TraversalFailed
- RouteEntered
- RouteExited
- RouteBlocked
- TravelPlanStarted
- TravelPlanInterrupted
- TravelPlanCompleted
- Mounted
- Dismounted
- PassengerBoarded
- PassengerDisembarked
- VehicleImmobilised
- TransportLinkChanged
- SafeRecoveryApplied

External systems subscribe to facts rather than inspecting animation state.

---

# 21. Simulation LOD and Promotion/Demotion

## 21.1 Fidelity Bands

| Band | Typical Use | Movement Treatment |
| --- | --- | --- |
| Active Player | Controlled player/rider/vehicle. | Full responsive movement, collision, traversal queries and prediction. |
| Active Local | Nearby NPCs, mounts, vehicles, combatants. | Detailed pathing, collision, local steering and visible transitions. |
| Reduced Local | Visible but non-critical travellers. | Lower-frequency path updates and simplified avoidance while preserving route/state. |
| Route Transit | Distant traveller, caravan or transport on known route. | Abstract progress along validated route legs using travel-time model. |
| Regional Summary | Inactive civilian/trade flows not individually visible. | Aggregate movement schedules where identity detail is unnecessary; named/persistent entities keep bounded records. |
| Static | Parked, stabled, stored, docked-equivalent land transport or inactive lift. | No movement integration; condition and occupancy remain persistent. |

## 21.2 Promotion

Promotion from distant transit to local simulation must place the mover at a valid route-relative position with:

- continuous identity;
- consistent elapsed time;
- current route leg;
- occupants/cargo/tow links;
- current movement condition;
- applicable interruptions;
- valid collision and safe position.

## 21.3 Demotion

Demotion requires:

- valid route or static state;
- no unresolved close collision;
- no active traversal requiring exact contact;
- no unsafe mount/dismount/boarding transition;
- no immediate combat movement requiring local resolution;
- a serialisable movement record.

## 21.4 No Outcome Inflation

Distant simulation may reduce detail, not change capability. A wagon blocked by a collapsed bridge locally remains blocked when distant unless another system repairs/reopens the route or the travel plan validly reroutes.

---

# 22. Multiplayer Authority, Prediction and Reconciliation

## 22.1 Authority Direction

Solo and multiplayer use the same authoritative movement model. In multiplayer, the world/server authority owns consequential position, movement mode, mount/vehicle occupancy, route progress and movement-validity results.

## 22.2 Client Prediction

Responsive player-controlled movement may be predicted locally. Prediction must use a compatible movement profile and recent world state, then reconcile against authoritative snapshots.

Client prediction may smooth:

- walking/running;
- sprinting;
- ordinary jumping;
- steering;
- mount control;
- vehicle control where stable enough.

High-risk transitions may require stronger confirmation:

- mounting/dismounting moving bodies;
- ledge traversal across changed voxels;
- entering lifts/guided transfers;
- towing link changes;
- route transitions across authority/streaming boundaries;
- recovery relocation.

## 22.3 Reconciliation

Correction should prefer:

1. small positional smoothing;
2. velocity/state correction;
3. movement-mode correction;
4. snap to valid authoritative contact when necessary;
5. safe recovery only when state is otherwise invalid.

The system should avoid repeated rubber-banding by identifying stale terrain/nav data, latency or prediction-rule mismatch.

## 22.4 Split-Screen

Each local player has independent input, camera, accessibility and UI presentation. Shared transports require explicit control authority and seat/passenger roles.

---

# 23. Persistence, Save Safety and Recovery

## 23.1 Persistent Movement Data

Persist only state necessary to reconstruct the mover safely:

- current mover/transport definition refs;
- authoritative transform/spatial frame;
- current movement mode/state where required;
- safe position/route fallback reference;
- mount/rider/passenger links;
- vehicle/towing links;
- active travel plan and progress;
- route revision/evidence where needed;
- persistent movement fault/disabled state;
- moving-frame relationship;
- configuration revision and migration version.

Transient animation blend, client prediction buffers and local steering samples are reconstructable and should not bloat saves.

## 23.2 Save During Travel

Saving during route transit preserves route leg, progress, timing basis, occupants and transport condition. Loading revalidates the route against saved world state before resuming.

## 23.3 Invalid Load Recovery

If a saved movement state becomes invalid because of migration, missing content or world changes:

- resolve aliases/migrations;
- revalidate current contact;
- reattach to valid moving frame if available;
- use safe position/route node when appropriate;
- quarantine the transport rather than free-simulating unknown physics;
- produce a readable recovery reason/report.

No recovery path may duplicate cargo, passengers or vehicles.

---

# 24. Forge, Animation, Camera, UI and Accessibility Handoffs

## 24.1 Forge/Entity Handoff

Entity Forge supplies:

- movement bodies/footprints;
- alternate clearance profiles;
- locomotion capability tags;
- rider/passenger/cargo anchors;
- IK/contact markers;
- animation profile refs;
- mount seats;
- towing anchors;
- interaction/traversal markers.

Set 30 consumes those definitions and reports runtime movement state back to presentation.

## 24.2 Animation Handoff

22F already establishes that animation consumes authorised movement parameters. Set 30 should expose at minimum:

- movement_mode;
- movement_state;
- speed_normalised;
- movement direction;
- grounded;
- slope/grade band;
- turn rate;
- stance/movement restriction;
- mount/vehicle state;
- traversal action/phase;
- surface/contact tags;
- movement fault state.

Animation root motion is never an independent source of world authority.

## 24.3 Camera Handoff

30B and later documents define movement-facing camera requirements; Document 17 remains UI/UX presentation authority. The system must support first- and third-person presentation, motion-reduction settings and transport/mount cameras without changing authoritative movement rules.

## 24.4 Accessibility Principles

Set 30 must support, where relevant:

- toggle sprint;
- hold/toggle crouch/crawl;
- auto-step;
- optional mantle/vault assistance;
- ledge forgiveness within safe bounds;
- simplified mount/vehicle steering;
- route assist/autopilot where appropriate;
- reduced timing pressure on traversal inputs;
- camera motion/bob reduction;
- motion sickness controls;
- controller remapping;
- non-colour route/traversal warnings;
- readable reason text;
- separate combat difficulty from traversal assistance where possible.

Accessibility assists may reduce input complexity, but they may not silently grant impossible route clearance or bypass ownership/progression unless a world/accessibility rule explicitly authorises that capability.

---

# 25. Registry, Capability and Relationship Direction

## 25.1 Qualified IDs

All production definitions follow Set 25B:

`<namespace>.<domain>.<identity_path>`

Existing registered domains should be reused where possible. Examples may include:

- `leyforge.core.vehicle.cart.handcart`
- `leyforge.core.vehicle.wagon.freight_basic`
- `leyforge.system.capability.traversal.climb.ladder`
- `leyforge.system.capability.transport.freight.medium`
- `leyforge.system.interface.movement.route_accessibility`
- `leyforge.system.interface.movement.travel_time`

New top-level domain prefixes are not created by 30A without an architecture decision.

## 25.2 Movement Facets

Movement-specific data should attach through declared schema/extension facets to entities, vehicles, items, structures and routes rather than copying definitions.

Potential facets:

- mover_profile;
- movement_capabilities;
- traversal_provider;
- route_movement;
- mount_movement;
- vehicle_handling;
- transport_capacity;
- guided_movement;
- movement_presentation;
- movement_validation.

Final schema names are subject to Set 25 integration.

## 25.3 Relationship Types

Movement-relevant relationships may include:

- provides_capability;
- requires_capability;
- compatible_with;
- traverses;
- connects_route;
- has_movement_profile;
- uses_route_class;
- has_seat;
- has_passenger_anchor;
- can_tow;
- towed_by;
- guided_by;
- blocks_route;
- bypasses_route_requirement;
- movement_modified_by;
- animation_presented_by.

Relationships must use registered Set 25 semantics rather than ad-hoc strings once production schemas are frozen.

---

# 26. Failure, Recovery and Player-Trust Rules

## 26.1 Failure Categories

- invalid input;
- unsupported movement mode;
- missing capability;
- insufficient clearance;
- slope/step limit exceeded;
- unsafe landing/support;
- blocked route;
- route too narrow/low/weak;
- transport too large/heavy;
- permission denied;
- movement externally restricted;
- mount/vehicle unavailable;
- seat/passenger conflict;
- towing geometry invalid;
- guided route disconnected;
- destination changed;
- route/path data stale;
- navigation budget exhausted;
- network authority mismatch;
- missing definition/migration;
- no safe recovery.

## 26.2 Player-Trust Rule

When a movement action fails, the same reason should be available to:

- runtime diagnostics;
- AI replanning;
- UI feedback;
- tutorial/help systems;
- accessibility narration-ready text;
- automated tests.

## 26.3 Stuck Recovery Hierarchy

Use the least disruptive valid recovery:

1. local steering correction;
2. short path replan;
3. traversal target requery;
4. return to previous valid path point;
5. return to recent safe route node;
6. dismount/unlink transport when safe and authorised;
7. apply explicit safe recovery relocation;
8. quarantine and request intervention if state cannot be repaired safely.

NPCs should not teleport through walls merely because their pathfinder failed.

---

# 27. Validation, Testing and Acceptance Evidence

## 27.1 Validation Layers

| Layer | Examples |
| --- | --- |
| Definition Validation | Missing profile, invalid capability ref, impossible clearance range, bad seat/tow anchor, duplicate ID. |
| Traversal Unit Tests | Step, slope, jump target, mantle, ladder, rope, crawl clearance, route class compatibility. |
| Dynamic Voxel Tests | Mining/placing near paths, doors, bridge damage, scaffolds, tunnels, route closures. |
| Navigation Tests | Local route, hierarchical route, replanning, reservations, group movement, stuck recovery. |
| Mount Tests | Mount/dismount, rider clearance, passenger/cargo, route compatibility, save/load. |
| Vehicle Tests | Turning, slopes, braking, load, towing, collision, gates, bridge/load class, immobilisation. |
| Guided Transport Tests | Rail junctions, stops, lift occupancy, power loss handoff, interrupted save. |
| LOD Tests | Active -> reduced -> route transit -> active with continuous identity and timing. |
| Multiplayer Tests | Prediction, correction, mount/vehicle control authority, passengers, reconnect. |
| Accessibility Tests | Toggle inputs, assist modes, camera comfort, simplified steering, readable reasons. |
| Seed Tests | Required traversal relationships reachable across representative procedural worlds. |

## 27.2 POC Regression Baseline

The current POC proves several reusable acceptance behaviours:

- first-person walking feels direct;
- jump and sprint work across voxel terrain;
- collision/streaming do not routinely break traversal;
- NPCs can follow route graphs and switch to bounded local voxel paths;
- NPCs can step/jump one-block rises;
- NPCs avoid water, pits, high walls, unloaded terrain and unsafe falls;
- persistent path failure returns agents to a safe route node.

Set 30 must preserve or deliberately improve these behaviours after the POC identities themselves are retired.

## 27.3 Release-Blocking Movement Defects

Examples include:

- repeatable falling through valid terrain;
- save/load placing player or transport in invalid collision without recovery;
- route abstraction crossing physically impossible/closed routes;
- passenger/cargo duplication during transport transitions;
- client movement authority exploit;
- vehicle/mount ownership bypass caused by movement layer;
- unrecoverable stuck state in ordinary generated terrain;
- deterministic seed route required for progression being inaccessible without declared fallback;
- severe camera/motion accessibility regression in required movement flows.

---

# 28. Production Classification and Implementation Sequencing

30A does not assign every movement feature to release by itself. Production classification must pass Set 25 package and capability completeness rules.

## 28.1 Recommended Sequence

1. Lock 30A architecture and cross-set boundaries.
2. Implement/validate 30B core player locomotion against current POC regression tests.
3. Add 30C terrestrial traversal links and dynamic voxel invalidation.
4. Add 30D falling/gliding/environmental traversal.
5. Add 30E mount/riding framework using existing Entity Forge anchors.
6. Add 30F carts/wagons/caravans with route and capacity integration.
7. Add 30G rails/lifts/powered land transport.
8. Complete 30H route accessibility and distant travel unification.
9. Complete 30I AI, multiplayer, persistence and accessibility hardening.
10. Complete 30J registries, validation, interface reconciliation and production admission.

## 28.2 Minimum Core Foundation

Before advanced mounts/vehicles, production movement needs:

- stable mover profile schema;
- ground/airborne core states;
- voxel collision/clearance;
- step/slope/jump handling;
- safe position recovery;
- local pathfinding interface;
- route graph adapter;
- authoritative multiplayer contract;
- movement API stubs/queries;
- movement reason codes;
- presentation adapter;
- save/load continuity.

---

# 29. Document Set 30 Specialist Map and Handoffs

## 30B - Core Player Locomotion, Controls, Camera and Movement States

Owns detailed walking, running, sprinting, crouching, crawling, jumping, grounded/airborne handling, turn/acceleration feel, camera-control requirements and basic state transitions.

## 30C - Climbing, Vaulting, Mantling, Ladders, Ropes and Grappling

Owns vertical/obstacle traversal actions, ledges, climb surfaces, ladder/rope movement, traversal anchors and grappling traversal mechanics. Grappling item/spell definitions remain with Items/Magic.

## 30D - Gliding, Falling, Aerial Traversal and Environmental Movement

Owns falling, landing, controlled descent, gliding and movement-facing environmental traversal. Survival consequences remain Set 29; spell definitions remain Magic.

## 30E - Mounts, Riding, Saddles, Harnesses and Mounted Traversal

Owns rider/mount movement states, control, mounted clearance, movement handling, flying-mount riding, passenger/cargo movement interfaces and mount/dismount traversal. Creature/taming/social rules remain external.

## 30F - Work Animals, Handcarts, Wagons, Carriages and Caravans

Owns terrestrial animal-drawn/manual transport movement, towing, capacity, passenger/cargo spatial handling, route requirements and convoy movement execution. Set 27 owns caravan economy; Set 28 owns companion/social assignment.

## 30G - Rails, Minecarts, Elevators and Powered Land Transportation

Owns constrained/guided transport movement, rail vehicle movement, lifts and approved powered/magical land transport handling. Automation/Magic own power generation/control definitions.

## 30H - Roads, Routes, Terrain Accessibility, Navigation and Long-Distance Travel

Owns movement-facing route accessibility, traversal cost, route planning interfaces, effective travel time, terrain/road integration and distant transit rules. Document 20D retains road infrastructure/building authority.

## 30I - NPC Navigation, Pathfinding, Formations, Multiplayer and Persistence

Owns local/hierarchical navigation interfaces, execution, group/formation spatial movement, network authority hardening, save/load, prediction/reconciliation and simulation LOD. Set 28 retains formation/social intent.

## 30J - Movement Registries, Physics Contracts, Validation and Final Integration

Owns final movement schema definitions, vehicle/mount movement registries, API freeze, validation suites, migration requirements, integration amendments and Set 30 acceptance matrix.

---

# 30. Main-Document Integration Register

The final integration pass should update earlier documents to consume Set 30 rather than duplicate it.

| Source Document | Required Integration Direction |
| --- | --- |
| 00 | Add Set 30 as the detailed owner of terrestrial movement/transport while preserving the vision-level travel fantasy. |
| 01 | Route minute-to-minute movement and long-distance travel references through Set 30. |
| 02 | Replace detailed movement-cost assumptions with progression/unlock interfaces into Set 30; keep skills/perks/stamina ownership. |
| 03 | Ensure blocks expose movement-facing collision, surface, climbable, route and hazard facets. |
| 04 | Ensure equipment exposes movement modifiers/capability providers without owning locomotion formulas. |
| 07 | Replace local movement/path execution with Set 30 navigation interfaces. |
| 08 | Distinguish automated logistics decisions from physical cart/vehicle movement. |
| 09 | Spells provide movement capabilities/effects; Set 30 executes resulting locomotion/transport changes. |
| 10 | Creature profiles expose locomotion/mount capabilities; Set 30 owns ride/traversal execution. |
| 11 | Worldgen provides terrain/route topology and movement constraints; Set 30 resolves accessibility/travel time. |
| 12 | Structures expose doors, bridges, ladders, routes, lifts and traversal anchors. |
| 14 | Realm environment profiles expose movement-law modifiers/capability requirements to Set 30. |
| 16 | Combat consumes movement state and requests authorised displacement/action locks rather than duplicating core locomotion. |
| 17 | UI consumes Set 30 movement snapshots/reasons and owns control presentation/accessibility settings surfaces. |
| 18 replacement | Implement Set 30 services in Godot/Summer with authoritative movement, navigation, networking, persistence and tests. |
| 19/20D | Keep road/transport infrastructure and settlement logistics ownership; use Set 30 for mover-specific route accessibility and transport movement. |
| 22F/22H | Keep animation/entity-authoring ownership; consume/publish Set 30 movement parameters and capability metadata. |
| 25 | Register Set 30 schemas, capabilities, interfaces, validations and production dependencies. |
| 26 | Reconcile aquatic/player movement overlap through XSI-30-001 while preserving vessel authority. |

---

# 31. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Pending review; no ownership transfer authorised.

### Conflict

The Document Sets 27-30 Cross-Set Interface Register v1.0 assigns **Swimming** to Set 30. Approved Document 26E already defines swimming, diving and underwater player interaction in depth, including water-contact states, wading, surface swimming, underwater locomotion, stamina/exertion interfaces, breath, drowning, currents, equipment, underwater interaction and rescue.

### Risk

If Set 30 independently defines swimming, Leyforge would have two authoritative implementations for:

- water locomotion states;
- swim controls;
- shore transitions;
- water-current movement;
- aquatic movement efficiency;
- underwater movement/collision;
- movement-state ownership.

That would violate both Set 25 source-of-truth rules and the cross-set rule of one owner per gameplay system.

### Recommended Reconciliation

Without changing ownership until explicitly approved:

- Set 30 owns the **universal movement-mode framework**, common movement API and cross-domain transition contract.
- Document 26E remains the detailed authority for **aquatic player locomotion and underwater interaction** already approved in Set 26.
- Set 30 represents Aquatic as a compatible movement mode and consumes the 26E aquatic state through an adapter.
- `CurrentMovementMode()` may return aquatic/swim state through the Set 30 API without Set 30 reimplementing 26E mechanics.
- Future non-maritime swimming requirements should either extend 26E's general aquatic contract or be formally transferred by approved amendment.

### Required Final Decision

Ash must explicitly approve one of the following during integration:

A. Keep detailed swimming under Set 26 and make Set 30 the universal movement facade.  
B. Transfer generic swimming to Set 30 and reduce 26E to maritime/underwater environmental specialisation, with controlled amendments to 26E.  
C. Define another explicit shared ownership boundary that still preserves one owner per field/mechanic.

Until then, specialist Set 30 documents must not overwrite 26E aquatic formulas or state transitions.

## XSI-30-002 - Set 29 Stamina Consumption Granularity

**Status:** New interface requirement proposed; no ownership transfer.

Set 30 requires a standard Set 29 query that can answer whether a movement action may begin/continue and what stamina/exertion modifier currently applies, without Set 30 calculating biological drain/regeneration.

Recommended interface shape for Set 29 review:

- current_stamina_availability;
- movement_exertion_modifier;
- hard movement restrictions;
- recovery availability;
- reason code/source status.

This extends the existing `StaminaModifier()` concept and should be reconciled with Set 29's final API.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** New interface requirement proposed; no ownership transfer.

Set 30 can execute formation spacing/path movement but needs Set 28 to expose formation intent without duplicating companion AI. Recommended data:

- group leader;
- member assignments;
- desired formation pattern/role;
- cohesion priority;
- break/hold policy request;
- passenger/mount assignment.

Set 30 remains responsible only for physical feasibility and movement execution.

---

# 32. Open Decisions and Deferred Questions

The following issues are deliberately not locked by 30A:

1. Exact movement speed bands for players, NPCs and mounts.
2. Whether sprint acceleration is immediate or ramped and how strongly direction changes at sprint speed.
3. Exact automatic step height and edge forgiveness.
4. Whether vault/mantle are fully contextual, explicit input or hybrid.
5. How much free climbing exists beyond authored climbable surfaces.
6. Grappling traversal scope and whether free-swinging rope physics is required.
7. Final glider handling and wind integration depth.
8. Flying-mount takeoff/landing control depth and minimum required air-navigation representation.
9. Whether mounted combat requires movement-specific strafing/turn modes beyond Combat's action rules.
10. Exact wagon/vehicle physics fidelity and whether wheel contact is simplified or physical per class.
11. Whether player-built custom land vehicles exist beyond predefined modular transport families.
12. Final rail switching/control UX and automated scheduling ownership boundaries.
13. Final lift/elevator power/control failure behaviour.
14. Maximum distant-travel abstraction interval and acceptable arrival uncertainty.
15. Whether named NPCs always retain individual distant movement records or may join settlement aggregate flow temporarily.
16. Exact congestion model for dense cities.
17. Final route danger interface between world events/combat/economy and Set 30.
18. Final movement effect of armour/equipment load after Set 29 encumbrance rules are complete.
19. Whether magical teleport/blink movement is executed directly by Magic or through a Set 30 movement command adapter.
20. Resolution of XSI-30-001 swimming ownership.

---

# Appendix A. Movement State Template

```yaml
movement_state:
  entity_id: <runtime entity or transport id>
  mover_profile_id: <qualified definition id>
  revision: <integer>
  spatial_frame_id: <world or moving-frame id>
  movement_mode: ground | airborne | traverse | glide | mounted | vehicle | guided | aquatic | disabled | recovery
  movement_state: <mode-specific state>
  position: <frame-local transform>
  orientation: <frame-local orientation>
  linear_state: <implementation-safe compact velocity/motion state>
  grounded: <bool or mode-appropriate support state>
  active_route_id: <optional>
  active_route_leg: <optional>
  traversal_action_id: <optional>
  mount_link_id: <optional>
  vehicle_link_id: <optional>
  safe_position_ref: <optional>
  movement_faults: []
  external_modifier_revision: <snapshot token>
  navigation_revision: <token>
```

---

# Appendix B. Mover Profile Template

```yaml
mover_profile:
  definition_id: leyforge.core.<domain>.<identity_path>
  schema_version: <version>
  mover_family: <family>
  body_shape_ref: <entity/vehicle collision profile>
  width: <band/value>
  height: <band/value>
  footprint: <profile>
  alternate_clearance_profiles: []
  movement_modes: []
  transition_capabilities: []
  step_band: <band>
  slope_band: <band>
  turn_radius_band: <band>
  acceleration_class: <class>
  braking_class: <class>
  door_passage_class: <class>
  preferred_surface_tags: []
  forbidden_surface_tags: []
  route_classes: []
  transport_roles: []
  spatial_profile_id: <optional>
  presentation_profile_ref: <optional>
```

---

# Appendix C. Traversal Query and Result Template

```yaml
traversal_query:
  mover_id: <runtime id>
  movement_revision: <revision>
  action_id: <qualified action/capability id>
  source_frame: <spatial frame>
  source_transform: <transform>
  target_ref: <anchor/position/segment>
  authority_context: <requester/permission>
  environment_revision: <token>
  modifier_revision: <token>

traversal_result:
  status: allowed | allowed_with_warning | denied | unknown
  resolved_target: <optional transform/anchor>
  resulting_mode: <optional>
  resulting_state: <optional>
  capability_used: <optional>
  traversal_cost: <optional>
  reasons: []
  warnings: []
  fallback_options: []
  valid_until_revision: <token>
```

---

# Appendix D. Route Segment and Accessibility Template

```yaml
route_segment_movement_facet:
  route_segment_id: <stable segment id>
  route_class: <foot/service/cart/heavy/etc>
  endpoint_a: <route node>
  endpoint_b: <route node>
  length: <derived>
  width_class: <class>
  vertical_clearance_class: <class>
  grade_band: <band>
  turn_band: <band>
  surface_profile: <ref>
  bridge_load_class: <optional>
  supported_transport_classes: []
  direction_rule: <two_way/one_way/etc>
  permission_ref: <external ownership/permission>
  condition_ref: <structure/route condition>
  hazard_refs: []
  environment_modifier_refs: []
  navigation_revision: <token>

route_accessibility_result:
  mover_or_transport_id: <runtime id>
  segment_id: <route segment>
  state: accessible | warning | blocked | unknown
  traversal_cost: <relative cost>
  estimated_speed_band: <band>
  blockers: []
  warnings: []
  capability_requirements: []
  evaluated_revision: <token>
```

---

# Appendix E. Movement API Contract Summary

| API | Owner | Primary Consumers | Must Not Calculate |
| --- | --- | --- | --- |
| CurrentMovementMode() | Set 30 | Set 29, Set 28, Combat, UI, animation | Survival state, social intent. |
| MaxSpeed() | Set 30 | AI, UI, travel, economy summaries | Stamina regeneration, price, wages. |
| CargoCapacity() | Set 30 | Set 27, logistics, UI | Cargo value, inventory ownership. |
| TraversalCost() | Set 30 | AI, Set 27 route planning, settlement planning | Trade profit, survival drain formula. |
| VehicleCondition() | Set 30 movement facet | Logistics, UI, repair, economy | Repair recipe/cost, damage source. |
| MountStatus() | Set 30 | Set 28, Set 29, UI, AI | Loyalty, taming, relationship. |
| TravelTime() | Set 30 | Set 27, Set 28, quests/events, UI | Contract reward/penalty, food cost. |
| RouteAccessibility() | Set 30 | Set 27, Set 28, NPC AI, settlement, quests | Road construction, economy decision. |

---

# Appendix F. Standard Reason-Code Catalogue

Illustrative reason codes; final IDs must use Set 25 naming and localisation rules.

- movement.ok
- movement.denied.unsupported_mode
- movement.denied.external_restriction
- movement.denied.permission
- movement.denied.no_clearance
- movement.denied.no_support
- movement.denied.slope_exceeded
- movement.denied.step_exceeded
- movement.denied.route_blocked
- movement.denied.route_class
- movement.denied.bridge_load
- movement.denied.turning_clearance
- movement.denied.mount_unavailable
- movement.denied.seat_occupied
- movement.denied.vehicle_immobilised
- movement.denied.tow_incompatible
- movement.denied.guided_route_disconnected
- movement.denied.stale_query
- movement.denied.no_safe_target
- movement.warning.route_hazard
- movement.warning.vehicle_degraded
- movement.warning.low_clearance
- movement.warning.route_uncertain
- movement.recovery.local_replan
- movement.recovery.safe_node
- movement.recovery.safe_position
- movement.recovery.quarantined

---

# Appendix G. Acceptance and Regression Matrix

| Area | Minimum Acceptance Evidence |
| --- | --- |
| Core locomotion | Player can move, stop, turn, step, jump and recover consistently across representative voxel terrain. |
| Dynamic edits | Placing/removing blocks near an active path invalidates only relevant navigation and does not cause clipping or permanent stuck states. |
| Doors/structures | Door/gate/bridge state changes immediately affect route accessibility with readable reason. |
| NPC pathing | Agents use hierarchical routes plus local approach and recover from persistent path failure. |
| Mounts | Rider links preserve identity, clearance, control state and save/load; invalid dismount does not place rider inside collision. |
| Wagons | Route width, grade, turn and bridge/load class affect accessibility; load/capacity remains consistent across LOD. |
| Rails/lifts | Guided bodies remain constrained to valid guide, preserve occupants and recover safely after interrupted state. |
| Distant travel | Travel duration and route blockers remain consistent when traveller is demoted and promoted. |
| Multiplayer | Prediction is responsive, authority rejects invalid movement, passenger/mount links survive reconnect. |
| Accessibility | Required movement flows can be completed with alternate input/toggle/assist options without hidden gameplay contradiction. |
| Persistence | Save/load never duplicates/deletes mover, mount, vehicle, passengers or cargo relationships. |
| Seed/worldgen | Required progression routes have at least one valid capability/provider/fallback across the approved seed suite. |

---

# Appendix H. Source-of-Truth Boundary Checklist

Before any Set 30 specialist document or implementation task is approved, verify:

- Does Set 30 actually own the mechanic?
- If Set 27 owns a price/economic decision, is Set 30 only consuming it?
- If Set 28 owns a relationship/companion decision, is Set 30 only executing movement?
- If Set 29 owns stamina/injury/fatigue, is Set 30 only applying supplied movement modifiers?
- If Document 20 owns a road/building definition, is Set 30 only determining mover-specific traversal?
- If Document 10 owns creature/taming logic, is Set 30 only handling locomotion/riding?
- If Document 16 owns a combat action, is Set 30 only validating/executing movement displacement?
- If Magic owns a spell, is Set 30 only consuming an authorised movement capability/effect?
- If Set 26 owns vessel/aquatic mechanics, has XSI-30-001 been respected?
- Are definition and runtime state separated?
- Are stable qualified IDs used?
- Are path/route results revision-bound so dynamic voxel edits invalidate stale answers?
- Is there a safe failure/recovery path?
- Is distant travel consistent with local movement capability?
- Is the result authoritative and multiplayer-safe?
- Can UI/AI explain failure using the same reason code?
- Is there validation evidence before production classification?

---

# End of Document 30A

**Next:** 30B - Core Player Locomotion, Controls, Camera and Movement States.
