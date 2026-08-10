# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30H - Roads, Routes, Terrain Accessibility, Navigation and Long-Distance Travel

Version 0.1 - Detailed Route Graph, Effective Travel Cost and Distant Transit Design Draft

A production-oriented specification for mover-specific route accessibility in Leyforge, covering roads, trails, bridges, tunnels, gates, terrain and surface traversal cost, route quality, off-road movement, hierarchical route planning, movement-mode transitions, regional connectivity, known versus unknown routes, route confidence, travel-time estimation, path invalidation, distant journey progression, encounter/checkpoint handoffs, convoy travel, settlement integration, multiplayer authority, persistence and Godot/Summer Engine implementation.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Route and Travel Statement**
>
> Leyforge should never treat distance as a straight-line number. A destination five hundred metres away across a river, damaged bridge, steep ridge, hostile gate and deep snow may be meaningfully farther than a settlement two kilometres away along a protected road. Roads therefore act as movement infrastructure, terrain remains traversable where capabilities allow, and long-distance travel is an abstraction of the same valid routes the player or NPC would physically use rather than teleportation hidden behind a timer.

# Document Purpose

Document 30H defines the movement-facing route layer that connects local locomotion to world-scale travel. Documents 30B through 30G already define how individual movers behave once they are physically executing movement: people walk and jump, climbers use traversal links, gliders use aerial fields, mounts move under rider control, wagons obey clearance and draft limits, and guided/powered transport follows its infrastructure. 30H answers the next question:

**Which sequence of terrain, routes, crossings and movement modes can this mover use to reach that destination, what will it cost in travel time, and how does that journey remain truthful when the destination is far outside active simulation?**

Document 20D remains the authority for what physical roads, paths, bridges, crossings, stations and infrastructure are, how settlements build them and what services they provide. Document 11/world generation remains the authority for terrain, biomes and generated world topology. Set 27 owns trade-route economics and route profitability. Set 28 owns social/formation intent. Set 29 owns biological stamina, fatigue and survival consequences. Set 26 owns vessel/maritime route execution. 30H consumes these systems and owns only the movement-facing accessibility, path cost, route selection and distant terrestrial transit rules assigned to Document Set 30.

This document also protects Leyforge's fully seed-generated world direction. No route rule may assume a fixed Forest Hamlet road, a guaranteed road from spawn, a static test valley or any other retired POC geography.

# Governing Source and Dependency Register

| Source | Existing Direction Relevant to 30H | 30H Treatment |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Set 30 owns route accessibility, terrain traversal cost, travel speed and journey duration. Set 27 owns route economics; Set 29 owns survival state. | Binding ownership contract. |
| 00 - Master Game Design Bible | Seed-generated voxel world, living civilisations, exploration freedom and meaningful infrastructure. | Routes remain physical, editable and world-state dependent. |
| 01 - Core Gameplay Loop | Exploration should be curiosity-driven and the world should support roads, villages, ruins, caves, routes and multiple player goals. | Route planning aids movement without forcing waypoint-following or a linear travel loop. |
| 02 - Player Progression | Exploration and survival progression may improve route capability, movement and map knowledge. | 30H consumes mover capabilities/knowledge; it does not own progression. |
| 03 - Blocks Registry | Terrain, stairs, slabs, roads, hazards, doors, bridges and block states determine physical traversal. | Local route facets resolve from authoritative voxel/structure state. |
| 07 - NPC Village System | Named NPCs have schedules, work, travel and bounded near/far simulation. | 30H supplies route/travel evidence; 30I owns NPC navigation execution. |
| 08 - Automation System | Logistics and resource movement depend on real routes and authoritative transactions. | 30H provides movement feasibility/time, not dispatch or transaction ownership. |
| 11 - Biomes and World Generation | Terrain, climate, roads, rivers, caves, settlements and procedural structures are generated from seed. | 30H consumes topology and movement-facing terrain state; worldgen does not own mover-specific route cost. |
| 12 / 19 / 20 | Structures, settlement plans, road networks, entrances, gates, bridges and construction dynamically change access. | Infrastructure creates/changes route graph evidence; 30H resolves mover-specific accessibility. |
| 15 - Quest and Event System | Travel, escort, delivery and event objectives depend on real world state and may persist at distance. | Quests consume journey progress/outcomes and may contribute route goals/constraints. |
| 16 - Combat, Gear and Defence | Threat, patrols, danger, gates and fortifications influence route choice. | 30H consumes danger/access signals but does not own combat threat simulation. |
| 17 - UI/UX System | Maps should reflect earned knowledge, route confidence, warnings and accessibility. | 30H exposes route plans/confidence/reasons; 17 owns presentation. |
| 18 - Technical Architecture | Hierarchical pathfinding, simulation LOD, deterministic scheduling, save safety and authoritative multiplayer are foundations. | 30H formalises route graph and distant journey records under Godot/Summer. |
| 20D - Storage, Roads, Transport, Logistics and Utilities | Roads are network graphs; route classes are Footpath, Service Path, Cart Road, Heavy Freight Road, Emergency Route, Public Street, Water Route, Rail/Guided Route and Portal Route; effective distance is not straight-line distance. | Primary infrastructure contract. 30H does not redefine route-building function. |
| 20G - Culture/Faction/Biome/Realm Packs | Cultures and environments vary road form, caravan camps, paths and terrain adaptation. | Appearance and culture vary while route semantics remain stable. |
| 22I/K/L - Blueprint Forge | Structure/road blueprints expose semantic paths, markers, damage states and navigation changes. | 30H consumes baked route facets and revision updates. |
| 24 - World Content Atlas | Regions, skylands, realms, settlements and travel geography can be highly varied. | Route architecture must support mixed terrain and realm contexts without hard-coded exceptions. |
| 25 - Production Governance | Stable IDs, capabilities, suitability, fallbacks, validation and migration are mandatory. | All route facets, plan records and journey records follow registry governance. |
| 26 - Maritime and Naval Expansion | Maritime movement, ports and vessel routes are separately owned. | 30H may plan to/from maritime transfer nodes but never re-simulates vessels. |
| 27H - Trade Routes and Regional Exchange | Owns economic trade-route relationships, freight demand, caravan opportunity and profitability. | 30H supplies physical route accessibility/time and current travel evidence only. |
| 28 - Social/Companion Systems | Owns passenger/companion assignment, formations and willingness. | 30H consumes route intent or assignment where relevant but not social decision-making. |
| 29 - Survival/Health | Owns stamina drain, fatigue, temperature, injury and physiological carry penalties. | 30H uses movement modifiers and estimated exertion outputs but never calculates survival state. |
| 30A - Movement Architecture | Defines route segment facet, hierarchical navigation layers, route graph, regional connectivity, movement API and distant travel principles. | Binding parent architecture. |
| 30B-D | Own local human traversal, climbing, gliding, falling and environment response. | 30H uses their capability/cost interfaces as route edges/transitions. |
| 30E | Owns mount movement and movement-facing mount availability/capacity. | 30H uses mount route suitability. |
| 30F | Owns work animals, carts, wagons and physical caravan/convoy movement. | 30H supplies route plans and mover-specific segment accessibility. |
| 30G | Owns rails, minecarts, lifts and powered/guided terrestrial transport. | 30H integrates guided segments and transfer nodes into multimodal routes. |
| 30I | Owns NPC navigation execution, formation spatial movement, networking hardening and movement persistence integration. | 30H defines route planning/effective-distance evidence consumed by 30I. |

# Governing Ownership Contract

Document 30H owns:

- movement-facing route-segment interpretation;
- `RouteAccessibility()` evaluation;
- `TraversalCost()` for route planning;
- terrain and route cost composition;
- movement-mode transition cost at route level;
- mover-specific route compatibility;
- route quality as a movement factor;
- hierarchical medium/long-distance route planning;
- regional connectivity representation;
- off-road route generation and cost;
- multimodal route plans;
- path/route confidence and uncertainty;
- travel-time estimation;
- journey progress and distant terrestrial travel rules;
- route invalidation and replan triggers;
- travel interruption and blocker states;
- route-plan persistence;
- travel evidence exposed to Set 27, quests, logistics and UI;
- route-debug and validation contracts.

Document 30H does **not** own:

- construction cost or maintenance of roads/bridges;
- economic route profitability;
- taxes, toll prices or trade contracts;
- NPC destination intent or social willingness;
- stamina/fatigue/injury formulas;
- weather generation;
- combat danger generation;
- map UI layout;
- vehicle/mount handling;
- rail/minecart/elevator physics;
- maritime vessel route execution;
- portal/magic mechanics;
- detailed local steering/pathfinding execution, owned by 30I.

# Static Table of Contents

1. Locked Route and Long-Distance Travel Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Core Design Principles  
4. Route Architecture and Hierarchy  
5. Canonical Terminology  
6. Route Infrastructure Versus Movement Interpretation  
7. Route Segment Movement Facet  
8. Route Classes Consumed from Document 20D  
9. Route Quality Bands and Movement Effects  
10. Route Node, Junction and Transfer-Node Model  
11. Regional Connectivity Graph  
12. Local-to-Route and Route-to-Local Handoffs  
13. Mover Profile and Capability Resolution  
14. Route Accessibility Evaluation  
15. Hard Accessibility Gates  
16. Soft Suitability and Unsafe-but-Passable Routes  
17. Traversal Cost Model  
18. Effective Distance  
19. Terrain and Surface Cost  
20. Slope, Elevation and Vertical Cost  
21. Weather and Dynamic Environment Modifiers  
22. Gates, Doors, Permissions and Opening State  
23. Bridges, Crossings, Fords, Ferries and Tunnels  
24. Congestion and Route Capacity Abstraction  
25. Danger, Patrol and Emergency Access Inputs  
26. Off-Road Navigation and Natural Terrain Corridors  
27. Trails, Desire Paths and Route Emergence Interface  
28. Roads as Choice Multipliers and Infrastructure Value  
29. Mover-Specific Route Profiles  
30. Pedestrian and Carrying Routes  
31. Mount Routes  
32. Cart, Wagon and Caravan Routes  
33. Guided and Powered Transport Routes  
34. Aerial and Glider Route Segments  
35. Maritime and Portal Transfer Boundaries  
36. Multimodal Route Planning  
37. Route-Plan Scoring and Policy  
38. Route Preferences and Caller-Supplied Constraints  
39. Unknown, Rumoured and Partially Known Routes  
40. Navigation Confidence and Map Knowledge  
41. Travel-Time Estimation  
42. Journey Preparation and Departure Validation  
43. Long-Distance Journey Record  
44. Near, Medium and Far Travel Fidelity  
45. Distant Transit Progression  
46. Checkpoints, Stops, Camps and Transfer Hubs  
47. Events, Encounters and Travel Interruptions  
48. Dynamic Route Invalidation and Replanning  
49. World Edits, Construction and Damage Updates  
50. Settlement, Warehouse and Logistics Integration  
51. Economic and Trade-Route Integration  
52. Quest, Escort and Event Integration  
53. NPC Navigation and Group-Movement Handoff  
54. Player Route Planning, Autotravel and Fast-Travel Boundary  
55. UI, Maps, Warnings and Reason Codes  
56. Accessibility and Route-Assistance Options  
57. Multiplayer Authority and Shared Route Plans  
58. Persistence, Save/Load and Journey Recovery  
59. Simulation LOD and Performance  
60. Registry and Data Definitions  
61. Balance-Draft Cost and Travel-Time Framework  
62. Godot/Summer Engine Implementation Direction  
63. Prototype Laboratories and Acceptance Tests  
64. Handoff to 30I and 30J  
65. Main-Document Integration Register  
66. Cross-Set Interface Amendments  
67. Open Decisions and Deferred Questions  
Appendix A. Route Accessibility Decision Matrix  
Appendix B. Movement-Facing Route Segment Facet  
Appendix C. Route Edge Cost Breakdown  
Appendix D. Route Plan Template  
Appendix E. Long-Distance Journey Record  
Appendix F. Route Knowledge and Confidence Record  
Appendix G. Route Invalidation Event Template  
Appendix H. Movement API Route Result Template  
Appendix I. Reason-Code Catalogue  
Appendix J. Acceptance and Regression Matrix  

# 1. Locked Route and Long-Distance Travel Identity

Routes are the movement interpretation of world connectivity. A road, bridge, mountain pass, tunnel or trail exists physically because world generation or civilisation built it. 30H decides whether a particular mover can use it now and how it compares with alternatives.

> **Locked Rule**
>
> Route accessibility is mover-specific and state-specific. No route is globally "open" merely because a graph edge exists. The same segment can be suitable for a pedestrian, difficult for an injured NPC, excellent for a riding mount, impossible for a loaded wagon and unavailable to a powered vehicle whose energy/control system is offline.

## 1.1 Player-Facing Promise

A player should be able to understand why the game recommends or rejects a route through readable causes such as:

- `No connected route`;
- `Foot access only`;
- `Mount cannot clear this passage`;
- `Cart road blocked`;
- `Bridge unsuitable for heavy wagon`;
- `Gate closed`;
- `Road flooded`;
- `Rail service unavailable`;
- `Route unknown`;
- `Unsafe but passable`;
- `Shorter route is much slower`;
- `Weather delay likely`;
- `Route changed since last visit`.

The player should not need to interpret raw A* costs.

# 2. Scope, Ownership and Explicit Non-Goals

30H is the route planner and long-distance movement-cost authority, not the detailed movement controller.

It answers:

- what route segments exist;
- which of them this mover can use;
- which movement modes are required;
- which route is preferred under caller constraints;
- expected movement time;
- whether the journey remains physically valid as world state changes;
- how a valid local movement route becomes a distant journey record;
- how a distant journey returns to physical simulation.

It does not decide **why** an NPC wants to travel, **why** a merchant expects profit, **why** a storm exists or **how** a wagon turns through a corner.

# 3. Core Design Principles

## 3.1 Effective Distance Beats Straight-Line Distance

The planner optimises movement cost, not Euclidean distance.

A long protected road can beat a short swamp route.

## 3.2 Roads Are Valuable, Not Mandatory

Capable movers can travel off-road. Roads improve reliability, speed, access, weather resilience and planning confidence.

## 3.3 One Journey, Multiple Fidelity Levels

A route planned while distant should remain the same conceptual route when the traveller becomes visible.

## 3.4 Unknown Information Stays Unknown

The planner does not give the player perfect route information from undiscovered terrain.

NPCs/factions may know more or less than the player.

## 3.5 World Changes Matter

Mining a tunnel, building a bridge, destroying a gate or flooding a ford can alter connectivity.

## 3.6 Multimodal Travel Is First-Class

A valid journey can combine:

```text
Walk
-> Mount
-> Wagon
-> Rail
-> Walk
```

or:

```text
Walk
-> Climb
-> Glide
-> Walk
```

without making every system part of one giant movement controller.

# 4. Route Architecture and Hierarchy

30H uses hierarchical planning.

```text
Destination / Travel Intent
        |
        v
Regional Connectivity Query
        |
        v
High-Level Route Corridor
        |
        v
Route / Transport Graph Plan
        |
        v
Movement-Mode Segments
        |
        v
Local Entry / Transfer Nodes
        |
        v
30I Local Navigation Execution
```

## 4.1 Why Hierarchical Planning

A very large voxel world cannot run a full detailed voxel path search from one region to another.

Hierarchy allows:

- cheap reachability rejection;
- regional path choice;
- road/transport preference;
- local detailed routing only where needed;
- bounded replans after world edits.

# 5. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Route Segment | Stable infrastructure/natural corridor edge between route nodes. |
| Route Node | Junction, endpoint, gate, crossing, station, settlement entrance or transfer point. |
| Route Graph | Medium/long-distance graph of known movement corridors. |
| Regional Connectivity | Coarse graph saying which regions/settlements/corridors can potentially connect. |
| Terrain Corridor | Non-built natural route candidate such as valley floor, ridge path or pass. |
| Route Facet | Movement-facing state exported by infrastructure/world systems. |
| Accessibility | Whether a mover can legally/physically use a route now. |
| Suitability | How good the route is for this mover when it is accessible. |
| Traversal Cost | Normalised planning cost of moving through a route/transition. |
| Effective Distance | Sum of route/traversal costs rather than geometric distance. |
| Route Policy | Caller-supplied preferences/constraints such as safest, fastest, wagon-only or avoid toll gates. |
| Transfer Node | Node where movement mode/vehicle changes. |
| Journey | Time-progressing execution of an accepted route plan. |
| Travel Confidence | Reliability of route/time estimate given knowledge and dynamic state. |
| Navigation Revision | Version stamp invalidating stale route evidence. |
| Closure | Current route state preventing ordinary use. |
| Unsafe-but-Passable | Accessible under policy but carrying elevated physical/danger cost. |
| Autotravel | Player-authorised automatic execution along a real route, not teleportation. |
| Fast Travel | Instant/near-instant relocation abstraction; not assumed by 30H. |

# 6. Route Infrastructure Versus Movement Interpretation

Document 20D owns:

- road/building project identity;
- construction;
- maintenance;
- road service;
- crossings;
- route infrastructure capacity;
- settlement planning.

30H consumes the completed/damaged segment and asks:

> Can mover X use this segment now, and at what cost?

A stone road does not become a Set 30 definition merely because it affects speed.

# 7. Route Segment Movement Facet

Each route segment should expose:

- stable segment ID;
- route class;
- endpoints;
- world/polyline/spline reference;
- surface type and quality;
- route quality band;
- width;
- vertical clearance;
- grade/slope band;
- turn constraints;
- one-way direction;
- current condition;
- closure/obstruction;
- supported movement/transport classes;
- bridge/load class;
- gate/door dependencies;
- permissions/access policy reference;
- environment modifier references;
- danger/patrol references;
- route capacity band;
- congestion band;
- navigation revision;
- confidence/source metadata.

This extends the 30A route facet without transferring infrastructure ownership.

# 8. Route Classes Consumed from Document 20D

30H preserves these infrastructure route classes:

| Route Class | Primary Movement Interpretation |
| --- | --- |
| Footpath | Pedestrian-scale low-capacity access. |
| Service Path | Workers, haulers, animals, maintenance and small cargo movers. |
| Cart Road | Handcarts, carts, wagons and bulk/local freight where geometry permits. |
| Heavy Freight Road | Large wagons, machinery and high-capacity terrestrial freight. |
| Emergency Route | Priority movement corridor with special access/reservation policy. |
| Public Street | Settlement movement corridor serving public destinations. |
| Water Route | Transfer to Set 26 maritime/aquatic navigation. |
| Rail / Guided Route | Transfer to 30G guided transport execution. |
| Portal Route | Transfer to the owning Magic/Dimension travel system. |

Route class is an infrastructure semantic, not a guarantee that every matching mover can use every segment.

# 9. Route Quality Bands and Movement Effects

20D route quality bands remain:

- Informal;
- Basic;
- Reliable;
- Durable;
- High-capacity;
- Protected;
- Advanced or magical.

30H converts quality into movement-facing factors such as:

- base speed reliability;
- surface consistency;
- weather resilience;
- congestion capacity;
- route confidence;
- breakdown/stuck exposure inputs;
- traveller guidance confidence.

A Protected route may have lower danger uncertainty but is not automatically physically faster than every Durable road.

# 10. Route Node, Junction and Transfer-Node Model

Route nodes represent places where a route decision can change.

Examples:

- intersection;
- fork;
- settlement gate;
- bridge approach;
- tunnel entrance;
- mountain pass;
- ford;
- station;
- lift landing;
- stable/caravan yard;
- dock/port transfer;
- portal threshold;
- glider launch point;
- trailhead.

## 10.1 Node Requirements

A node records:

- stable ID;
- connected segment IDs;
- spatial anchor;
- supported mover classes;
- transfer opportunities;
- wait/queue capability;
- current closure;
- local-nav entry references;
- navigation revision.

# 11. Regional Connectivity Graph

The coarse regional graph stores relationships such as:

```text
region.forest_vale
 -> pass.north_ridge
 -> region.highland_basin
 -> road.trade_east
 -> settlement.stoneford
```

It does not store every voxel.

## 11.1 Regional Edge Evidence

- region adjacency;
- major road;
- pass;
- river crossing;
- tunnel;
- portal;
- rail corridor;
- maritime port transfer;
- known aerial corridor.

## 11.2 Seed Determinism

Regional connectivity derives from seed/world state plus persistent deltas.

A saved bridge repair can upgrade connectivity without changing the original seed.

# 12. Local-to-Route and Route-to-Local Handoffs

At route entry:

1. 30H selects an entry route node.
2. 30I finds a local path from current position to the node.
3. Specialist movement links are used if needed.
4. The mover enters route execution.
5. On exit, 30I resolves the final local approach to the exact destination.

30H never assumes a route endpoint is directly reachable just because two graph IDs connect.

# 13. Mover Profile and Capability Resolution

A planning query references a resolved mover/transport capability snapshot.

Examples:

- pedestrian;
- injured pedestrian;
- climbing-equipped player;
- rider + ground mount;
- flying mount;
- handcart;
- standard loaded wagon;
- heavy wagon convoy;
- minecart consist;
- powered traction vehicle;
- glider-capable player.

The route planner does not inspect raw item names or creature species strings.

# 14. Route Accessibility Evaluation

`RouteAccessibility()` returns more than boolean.

Suggested states:

- Accessible;
- AccessibleWithPenalty;
- AccessibleWithTransition;
- UnsafeButPassable;
- TemporarilyBlocked;
- PermissionBlocked;
- CapabilityBlocked;
- GeometryBlocked;
- EnvironmentBlocked;
- ServiceUnavailable;
- Unknown;
- NoConnection.

## 14.1 Query Inputs

- mover profile;
- load/cargo state;
- movement capabilities;
- current external movement restrictions;
- caller route policy;
- route facet;
- environment state;
- permission result;
- time/opening state;
- known route information;
- transport service readiness where applicable.

# 15. Hard Accessibility Gates

Hard gates include:

- width/height/turn clearance;
- unsupported route class;
- impassable grade;
- collapsed bridge;
- closed locked gate with no permission/alternative;
- missing rail continuity;
- lift unavailable where route requires it;
- flooded tunnel;
- realm/magic barrier;
- movement capability absent;
- damaged route marked closed;
- one-way violation where not overridable.

Hard failures are not softened by a lower path cost.

# 16. Soft Suitability and Unsafe-but-Passable Routes

A route may remain physically possible but undesirable due to:

- deep mud;
- rough terrain;
- steep but legal grade;
- darkness;
- hostile territory;
- high wind;
- poor road condition;
- congestion;
- unprotected wilderness;
- long climbing section;
- uncertain route knowledge;
- unreliable transport service.

Caller policy decides how much those penalties matter.

# 17. Traversal Cost Model

The planning cost is composed from movement evidence rather than one arbitrary number.

Suggested conceptual model:

```text
SegmentCost =
    BaseTimeCost
  x SurfaceModifier
  x GradeModifier
  x MoverModifier
  x LoadModifier
  x EnvironmentModifier
  x ConditionModifier
  x CongestionModifier
  x PolicyRiskModifier
  + TransitionCost
  + WaitCost
  + UncertaintyPenalty
```

Not every factor applies to every movement mode.

## 17.1 Separation from Survival

Set 29 may provide an exertion/physiological movement modifier.

30H may include it in expected travel cost.

30H does not compute hunger, fatigue or injury.

# 18. Effective Distance

Effective distance is the route-planning measure of effort/time/access.

Example:

- 600 m swamp/off-road route: cost 1,050;
- 1,500 m reliable cart road: cost 720.

The longer road can be the better route.

## 18.1 Use Cases

- NPC workplace selection;
- settlement service reach;
- warehouse accessibility;
- caravan planning;
- quest travel estimates;
- patrol assignment;
- evacuation planning;
- player map route suggestions.

# 19. Terrain and Surface Cost

Natural terrain exposes movement-facing surface information.

Possible categories:

- firm soil;
- grass;
- loose sand;
- gravel;
- mud;
- shallow snow;
- deep snow;
- ice;
- scree;
- rubble;
- marsh;
- dense undergrowth;
- corruption growth;
- ash;
- magical slick/slow field.

30H uses specialist mover suitability rather than universal terrain cost.

A sled and wagon may rank snow oppositely.

# 20. Slope, Elevation and Vertical Cost

Cost includes:

- total ascent;
- total descent;
- grade;
- switchbacks;
- stairs;
- climbing links;
- lift/elevator transitions;
- glider launch/landing requirements.

A steep direct route can be slower than a longer switchback.

## 20.1 Downhill Is Not Always Cheap

Heavy wagons may incur braking/safety penalties downhill.

Mounts may descend slower than they climb on certain terrain.

Gliders may prefer a high launch but require altitude reserve.

# 21. Weather and Dynamic Environment Modifiers

30H consumes environment state.

Examples:

- rain slows dirt roads;
- snow closes or slows passes;
- ice changes wheel/mount suitability;
- flood closes ford;
- wind affects aerial route;
- sandstorm reduces route confidence;
- magical storm disables a route;
- drought opens a seasonal crossing.

30H never predicts weather unless a forecast/knowledge provider supplies that information.

# 22. Gates, Doors, Permissions and Opening State

Route edges may depend on dynamic access.

Examples:

- settlement gate;
- mine gate;
- dungeon door;
- drawbridge;
- customs barrier;
- private road;
- faction checkpoint.

The owning permission/social/faction system returns access result.

30H incorporates:

- open now;
- expected wait;
- permission denied;
- alternate route required.

It does not invent permission from reputation.

# 23. Bridges, Crossings, Fords, Ferries and Tunnels

## 23.1 Crossings

Route planning can represent:

- footbridge;
- cart bridge;
- heavy bridge;
- ford;
- stepping stones;
- causeway;
- ferry transfer;
- drawbridge;
- tunnel;
- underground passage.

## 23.2 Bridge Validation

Movement-facing fields include:

- width;
- height;
- route class;
- damage;
- movement capacity class;
- one-way/passing restriction;
- surface state;
- current closure.

Structural engineering remains with the structure system.

## 23.3 Ford

Accessibility depends on:

- water depth/current state from aquatic/environment owner;
- mover type;
- vehicle profile;
- season/weather.

30H treats the ford as a conditional route edge.

# 24. Congestion and Route Capacity Abstraction

Dense settlements and shared infrastructure need bounded congestion.

30H uses route-capacity bands instead of simulating every crowd interaction at planning level.

Possible bands:

- Free;
- Light;
- Busy;
- Congested;
- Saturated;
- Closed/Reserved.

30I handles local avoidance/queuing.

## 24.1 Single-Lane Infrastructure

Narrow bridges, gates, tunnels and rail blocks may require reservations.

The route plan can include expected wait cost.

# 25. Danger, Patrol and Emergency Access Inputs

Danger is an external signal.

30H may receive:

- threat band;
- patrol/protection band;
- known hostile territory;
- active raid/event closure;
- night danger;
- route warning confidence.

The caller policy may choose:

- fastest;
- safest;
- balanced;
- emergency;
- stealth;
- avoid-hostile-territory.

30H never calculates combat difficulty.

# 26. Off-Road Navigation and Natural Terrain Corridors

Off-road travel remains valid when the mover profile supports it.

## 26.1 Natural Corridor Generation

Regional/world systems may expose coarse terrain corridors based on:

- valleys;
- ridgelines;
- passes;
- riverbanks;
- coastlines;
- clear forest bands;
- cave networks;
- open plains.

30H can also build bounded temporary corridor candidates from terrain summaries.

## 26.2 Off-Road Cost

Off-road route cost considers:

- surface;
- slope;
- vegetation;
- crossing requirements;
- mover clearance;
- navigation confidence;
- weather;
- traversal capability.

No road object is required.

# 27. Trails, Desire Paths and Route Emergence Interface

Repeated movement may create evidence for a future trail/path system.

30H can emit:

- traffic count band;
- repeated corridor use;
- heavy mover passage;
- seasonal route use.

The terrain/settlement system decides whether a visible/functional trail emerges or is upgraded.

Set 30 does not place road blocks by itself.

# 28. Roads as Choice Multipliers and Infrastructure Value

Road benefits can include:

- lower average travel time;
- less variance;
- better vehicle access;
- improved cargo utilisation;
- reduced stuck risk;
- better weather resilience;
- better navigation confidence;
- greater route capacity;
- safer/patrolled corridor;
- more predictable distant transit.

Older informal/basic roads remain useful locally even after high-capacity roads exist.

# 29. Mover-Specific Route Profiles

The same route graph is filtered through mover profiles.

A route query should never duplicate the graph for every mover species/vehicle.

Instead:

```text
Shared Route Graph
+ Route Facet
+ Mover Profile
+ Current State
= Accessibility + Cost
```

# 30. Pedestrian and Carrying Routes

Pedestrian route planning may use:

- footpaths;
- service paths;
- public streets;
- stairs;
- traversal links;
- tunnels;
- off-road corridors;
- lifts/portals where permitted.

Carried-object/load state can:

- increase cost;
- disable climb links;
- reject narrow clearance;
- favour service paths.

Set 29 owns physiological carry penalty.

# 31. Mount Routes

Mount planning considers:

- mount footprint;
- slope;
- step/jump capability;
- terrain suitability;
- gates/bridges;
- overhead clearance;
- flying capability if relevant;
- current mount availability.

A pedestrian path is not automatically mount-compatible.

# 32. Cart, Wagon and Caravan Routes

30F supplies:

- footprint/swept envelope;
- turning radius;
- grade limit;
- surface suitability;
- load band;
- bridge/gate class;
- convoy dimensions.

30H uses these to plan vehicle/convoy corridors.

A route can be locally blocked by one tight corner even if its nominal class is Cart Road.

# 33. Guided and Powered Transport Routes

30G guided segments include:

- minecart rail;
- freight/passenger rail;
- funicular;
- lift/elevator;
- powered guideway.

30H treats them as route edges with:

- station/entry nodes;
- service readiness;
- direction;
- travel time;
- wait/dwell cost;
- capacity/permission;
- transfer cost.

30H does not move the train/elevator.

# 34. Aerial and Glider Route Segments

30D can expose:

- launch node;
- landing node;
- minimum altitude;
- glider capability;
- windway;
- expected glide band;
- environment confidence.

A glider route is a conditional edge.

If wind changes beyond tolerance, 30H invalidates or increases uncertainty.

# 35. Maritime and Portal Transfer Boundaries

## 35.1 Maritime

30H may route:

```text
Road
-> Port Transfer Node
-> Set 26 Voyage
-> Port Transfer Node
-> Road
```

Set 26 owns the voyage.

## 35.2 Portal

Portal route edges are available only when the owning system reports:

- active;
- permitted;
- destination valid;
- usable by mover/cargo class.

30H applies transfer/time cost and mode change.

It never defines portal fuel or ritual rules.

# 36. Multimodal Route Planning

A route plan contains legs.

Example:

```text
Leg 1: Walk to stable
Leg 2: Mount to regional station
Leg 3: Passenger rail
Leg 4: Walk from station to destination
```

or:

```text
Leg 1: Wagon to river port
Leg 2: Maritime vessel
Leg 3: Cart to market
```

## 36.1 Transfer Cost

Transfers may include:

- boarding time;
- loading/unloading;
- parking;
- waiting;
- hitch/unhitch;
- seat/passenger change;
- service availability.

Owning systems supply detailed readiness.

# 37. Route-Plan Scoring and Policy

A route planner evaluates valid candidate plans.

Possible policy objectives:

- fastest;
- shortest;
- safest;
- lowest exertion;
- lowest vehicle stress;
- highest reliability;
- avoid toll/customs;
- avoid hostile territory;
- accessible-only;
- emergency priority;
- scenic/exploration;
- trade/economic policy supplied by Set 27.

30H calculates movement evidence only.

# 38. Route Preferences and Caller-Supplied Constraints

The caller can provide constraints such as:

- must use assigned wagon;
- must include rail;
- avoid portals;
- no climbing;
- accessible for injured traveller;
- keep convoy together;
- arrive before time;
- use known routes only;
- avoid faction territory;
- use emergency route if authorised.

Caller preferences cannot force an impossible route.

# 39. Unknown, Rumoured and Partially Known Routes

A route may be:

- Unknown;
- Rumoured;
- Approximate;
- Known;
- Surveyed;
- Recently Verified;
- Outdated.

## 39.1 Knowledge Rule

Route planning for the player uses known information.

An unexplored shortcut can exist in the world without appearing in the route planner.

## 39.2 Rumours

Set 28/quest/social systems may provide a rumoured route.

30H stores:

- source confidence;
- approximate endpoints;
- uncertainty;
- last verification.

It does not decide whether the rumour is socially trustworthy.

# 40. Navigation Confidence and Map Knowledge

Travel-time estimates expose confidence.

Suggested bands:

- Exact/Local;
- High;
- Moderate;
- Low;
- Rumoured;
- Unknown.

Confidence decreases with:

- stale route data;
- volatile weather;
- active war/event;
- unexplored terrain;
- unreliable transport service;
- damaged infrastructure.

# 41. Travel-Time Estimation

`TravelTime()` returns an estimate and confidence.

## 41.1 Components

```text
EstimatedTravelTime =
  Sum(segment expected movement times)
+ Sum(transition times)
+ Expected waits
+ Policy-adjusted delay allowance
```

The displayed estimate should not pretend to exact seconds for a multi-day uncertain journey.

## 41.2 Time Range

For long routes:

```text
expected = 7h 20m
likely range = 6h 50m - 8h 40m
confidence = Moderate
```

where UI chooses appropriate presentation.

# 42. Journey Preparation and Departure Validation

Before distant journey activation:

- route plan exists;
- origin local position can reach first route node;
- required mover/vehicle is available;
- cargo/passenger assignments are valid;
- required transfer/service is currently available or scheduled;
- permissions are resolved;
- route is not immediately invalid;
- caller has authorised departure.

Set 27/quests/social systems own mission readiness beyond movement.

# 43. Long-Distance Journey Record

A journey record includes:

- journey ID;
- traveller/convoy refs;
- route plan ID/version;
- current leg;
- current segment;
- segment progress;
- departure time;
- expected arrival;
- route confidence;
- movement mode;
- mover profile snapshot refs;
- cargo/passenger refs where relevant;
- external condition refs;
- pending checkpoints;
- interruption state;
- last valid route node;
- navigation revisions.

# 44. Near, Medium and Far Travel Fidelity

## 44.1 Near

- physical bodies;
- local collision/pathing;
- specialist movement controllers;
- visible traffic.

## 44.2 Medium

- corridor/path following;
- simplified avoidance;
- lower-frequency steering;
- preserved identity and route state.

## 44.3 Far

- route-segment progress;
- scheduled transitions;
- deterministic travel-time advancement;
- bounded incident/event checks;
- no per-frame actor movement.

The conceptual route remains identical.

# 45. Distant Transit Progression

Far travel advances using:

- current segment;
- mover/profile expected speed;
- segment cost;
- current environment/route state;
- scheduled waits/transfers;
- externally generated interruption events.

## 45.1 No Teleport Stock/Passengers

A traveller/cargo lot remains in transit until journey progress reaches a valid destination/transfer.

The destination does not gain physical goods because the ETA has passed if the route became blocked.

## 45.2 Distant Recalculation

When route state changes:

- update remaining ETA;
- stop if hard blocked;
- replan if caller policy allows;
- preserve completed legs.

# 46. Checkpoints, Stops, Camps and Transfer Hubs

Route nodes may support:

- settlement gate;
- caravan yard;
- stable;
- inn;
- camp;
- station;
- freight depot;
- lift landing;
- port;
- customs checkpoint;
- bridge queue;
- portal hub.

30H uses movement-facing stop capacity and transfer readiness.

Rest, trading, feeding and social interaction remain external.

# 47. Events, Encounters and Travel Interruptions

30H does not generate combat encounters itself.

It exposes journey position/time so event/threat systems can trigger appropriate content.

Possible interruption classes:

- route closure;
- ambush/event;
- weather delay;
- vehicle breakdown;
- mount unavailable;
- border closure;
- bridge damage;
- transport service outage;
- passenger/cargo mission cancellation.

30H receives the resulting movement impact.

# 48. Dynamic Route Invalidation and Replanning

A route plan stores revisions.

Replan triggers include:

- route segment removed;
- bridge destroyed;
- gate closed;
- rail service disabled;
- flood;
- landslide;
- new road completed;
- new tunnel opened;
- portal disabled;
- current mover state changes;
- load/vehicle changes;
- permission revoked.

## 48.1 Replan Scope

Prefer bounded replan from the current node/segment rather than rebuilding the whole world graph.

# 49. World Edits, Construction and Damage Updates

Dynamic voxel edits should invalidate only affected navigation evidence.

Example:

- player mines tunnel through ridge;
- local navigation validates it;
- world/structure system promotes it into a route connection if appropriate;
- regional graph revision updates;
- future travel may use it.

A random hole in terrain does not automatically become a stable world route.

# 50. Settlement, Warehouse and Logistics Integration

Settlement systems use effective distance for:

- building service reach;
- worker access;
- storage reach;
- project supply;
- emergency response;
- market accessibility.

Logistics may query:

- `RouteAccessibility()`;
- `TravelTime()`;
- mover/vehicle requirements;
- blocker reason;
- confidence.

30H never creates/consumes inventory stock.

# 51. Economic and Trade-Route Integration

Set 27 consumes physical movement evidence.

30H exposes:

- accessible route candidates;
- travel time;
- route condition;
- mover/vehicle class requirements;
- capacity-related movement constraints;
- current closures;
- reliability/confidence.

Set 27 owns:

- route profit;
- freight rate;
- merchant decision;
- taxes/tolls;
- insurance;
- supply/demand;
- route economic risk.

XSI-30-008 remains the terrestrial caravan execution boundary.

# 52. Quest, Escort and Event Integration

Quests/events may request:

- reach destination;
- escort convoy;
- discover route;
- reopen bridge;
- survey pass;
- avoid territory;
- arrive before deadline.

30H exposes:

- route plan;
- current location/leg;
- ETA;
- closure;
- actual arrival.

Quest system owns objective completion/failure.

# 53. NPC Navigation and Group-Movement Handoff

30I owns local execution.

30H supplies:

- regional corridor;
- route legs;
- transfer nodes;
- permitted movement modes;
- segment costs;
- replan triggers.

For groups/formations:

- Set 28 supplies formation/social intent;
- 30I handles local spatial formation;
- 30H ensures the route corridor is compatible with the group/convoy.

# 54. Player Route Planning, Autotravel and Fast-Travel Boundary

## 54.1 Manual Route Planning

The map may allow the player to:

- select destination;
- compare routes;
- set avoidance/preferences;
- pin stops;
- inspect warnings.

UI belongs to Document 17.

## 54.2 Autotravel

Autotravel is permitted only along a valid physical route plan.

Default recommendation:

- player remains in-world;
- simulation time progresses normally;
- interruptions can stop travel;
- local physical movement may be used while nearby;
- distant abstraction can be used for long safe legs if the design allows.

## 54.3 Fast Travel

Instant destination teleportation is **not defined by 30H**.

If the project later includes:

- magical waypoint teleport;
- portal travel;
- special accessibility fast travel;

the owning system must declare it explicitly.

Autotravel must never be mislabeled as fast travel.

# 55. UI, Maps, Warnings and Reason Codes

Route UI should expose decisions, not raw graph internals.

Useful outputs:

- fastest route;
- safer alternative;
- movement modes;
- route quality;
- estimated time;
- confidence;
- known blockers;
- weather warning;
- vehicle incompatibility;
- required transfer;
- unknown section.

Reason codes drive localisation.

# 56. Accessibility and Route-Assistance Options

Possible options:

- simplified route choices;
- always show accessible route;
- avoid climbing automatically;
- avoid gliding automatically;
- minimise transfers;
- avoid severe terrain;
- stronger hazard warnings;
- wheelchair/mobility-profile route support where relevant to character design;
- reduced timing pressure for transfers;
- route preview with slope/clearance summary;
- autotravel assistance.

Accessibility may change route preference, not physical truth.

# 57. Multiplayer Authority and Shared Route Plans

Server/host owns:

- authoritative route graph revisions;
- access state;
- journey progress;
- shared vehicle/convoy route plans;
- transport service availability;
- actual arrival.

Clients may locally preview routes from replicated/known data.

## 57.1 Shared Party Route

A party route can be shared as intent.

Each member still requires physical/movement compatibility.

Set 28 decides party/social membership.

# 58. Persistence, Save/Load and Journey Recovery

Persist:

- route graph persistent deltas;
- route knowledge;
- active route plan;
- journey record;
- current leg/segment/progress;
- traveller/vehicle refs;
- last valid route node;
- relevant revisions.

## 58.1 Load Revalidation

On load:

1. resolve current world graph revision;
2. validate current segment;
3. resolve mover profile;
4. validate transport/service;
5. resume if valid;
6. stop/replan if blocked;
7. reconstruct local actors at a valid route position if promoted.

No journey is teleported past a newly destroyed bridge.

# 59. Simulation LOD and Performance

## 59.1 Graph Levels

- local nav cells/links: active chunks;
- settlement/local route graph;
- regional route graph;
- world connectivity graph.

## 59.2 Update Strategy

- dynamic edits invalidate bounded areas;
- stable roads reuse cached facets;
- region graphs update asynchronously;
- travel queries use coarse rejection before detailed evaluation;
- frequent movers may cache route profiles keyed by revision.

## 59.3 No Giant World A*

Never run one detailed voxel A* across the entire world for ordinary long-distance travel.

# 60. Registry and Data Definitions

## 60.1 RouteSegmentDefinition/Facet

Suggested qualified IDs:

- `route.segment:<ULID>`;
- `route.class.footpath`;
- `route.class.service_path`;
- `route.class.cart_road`;
- `route.class.heavy_freight`;
- `route.class.emergency`;
- `route.class.public_street`;
- `route.class.rail_guided`.

Runtime generated/natural corridors use stable save-scoped IDs.

## 60.2 RoutePolicyDefinition

Fields:

- policy ID;
- optimisation priorities;
- prohibited route classes;
- movement-mode preferences;
- danger tolerance;
- unknown-route tolerance;
- transfer tolerance;
- wait tolerance;
- emergency overrides;
- caller owner.

## 60.3 RoutePlanRecord

Contains ordered legs, costs, constraints and revision evidence.

# 61. Balance-Draft Cost and Travel-Time Framework

Values below are initial planning bands, not final production balance.

## 61.1 Route Quality Base Multipliers

| Quality | Suggested Base Time Multiplier |
| --- | ---: |
| Informal | 1.15-1.35 |
| Basic | 1.05-1.20 |
| Reliable | 1.00 |
| Durable | 0.95-1.00 |
| High-capacity | 0.90-0.98 |
| Protected | 0.95-1.05 movement time, lower risk/variance |
| Advanced/Magical | profile-specific |

These are applied only where the mover benefits from the route.

## 61.2 Example Terrain Multipliers for a Standard Pedestrian

| Terrain | Starting Multiplier |
| --- | ---: |
| Reliable road | 1.00 |
| Basic dirt path | 1.10 |
| Open grass | 1.15 |
| Light forest off-road | 1.25 |
| Loose sand | 1.35 |
| Mud | 1.40-1.75 |
| Shallow snow | 1.25-1.45 |
| Deep snow | 1.60-2.20 |
| Scree/rubble | 1.35-1.80 |
| Marsh | 1.60-2.50 |
| Dense obstruction | may become capability blocked |

Vehicle/mount profiles use their own multipliers.

## 61.3 Planning Transition Costs

| Transition | Starting Cost Concept |
| --- | --- |
| Open ordinary gate | negligible/small |
| Ladder/climb link | local action duration + exertion cost |
| Mount/dismount | 30E duration + readiness |
| Hitch/unhitch | 30F duration/readiness |
| Passenger rail boarding | wait + board + dwell |
| Lift/elevator | call/wait + travel |
| Port/vessel transfer | Set 26 readiness + transfer time |
| Portal | owning system transition cost |

# 62. Godot/Summer Engine Implementation Direction

## 62.1 Recommended Services

```text
RouteGraphService
RegionalConnectivityService
RouteFacetAdapter
RouteAccessibilityResolver
TraversalCostResolver
RoutePlanner
MultimodalRoutePlanner
RouteKnowledgeService
JourneyService
JourneyLODService
RouteInvalidationService
RouteNetworkReplicator
RouteDebugService
```

## 62.2 Data Separation

Immutable/config definitions:

- route class definitions;
- route quality definitions;
- cost profiles;
- mover route profiles;
- route policy definitions.

Persistent runtime:

- route segment state;
- graph revisions;
- route knowledge;
- journey records;
- closures;
- congestion/reservations.

## 62.3 Planner Algorithm Direction

Recommended approach:

1. coarse regional reachability;
2. route-corridor candidate search;
3. mode/transport filter;
4. detailed edge-cost scoring;
5. multimodal transfer expansion;
6. local-entry verification;
7. final route plan.

A* / Dijkstra / multi-criteria variants are acceptable behind project interfaces.

## 62.4 Dynamic Updates

Use dirty-region queues keyed by:

- voxel/structure revision;
- bridge/gate state;
- route construction state;
- environment closure;
- transport service state.

## 62.5 Debug Tools

Developer overlay should show:

- route graph nodes/edges;
- route class/quality;
- mover accessibility;
- per-edge cost breakdown;
- hard blocker;
- current route revisions;
- selected plan;
- alternatives;
- confidence;
- journey progress;
- local/far LOD boundary.

# 63. Prototype Laboratories and Acceptance Tests

## 63.1 Effective Distance Lab

Create two destinations:

- short swamp/off-road;
- long reliable road.

Verify route policy can prefer the longer road.

## 63.2 Mover Compatibility Lab

Same network queried by:

- pedestrian;
- mount;
- handcart;
- loaded wagon;
- heavy wagon.

Verify different accessibility/cost without duplicate graphs.

## 63.3 Gate/Bridge Lab

Change:

- gate open/closed;
- bridge damage;
- width/load class.

Verify bounded route invalidation and replan.

## 63.4 Terrain/Weather Lab

Change:

- dry -> mud;
- clear -> snow;
- ford open -> flooded;
- pass clear -> blizzard closure.

Verify ETA/access changes from external environment state.

## 63.5 Multimodal Lab

Plan:

```text
walk -> mount -> rail -> walk
```

and:

```text
wagon -> port transfer -> maritime -> cart
```

Verify ownership handoffs.

## 63.6 Unknown Route Lab

Player knowledge lacks a shortcut.

Verify player route planner does not use it until discovered/rumoured/surveyed according to policy.

## 63.7 Construction Lab

Build a new bridge/road.

Verify route graph revision creates a valid alternative without full-world rebuild.

## 63.8 Destruction Lab

Destroy a bridge while a distant caravan is approaching.

Verify journey stops/replans and destination does not receive cargo.

## 63.9 Journey LOD Lab

Run a 3-hour route:

- local departure;
- far abstraction;
- dynamic delay;
- promotion near player;
- final physical arrival.

Identity and progress must remain coherent.

## 63.10 Congestion Lab

Single-lane bridge with:

- pedestrians;
- wagon convoy;
- emergency route user.

Verify reservation/wait cost and priority-policy integration.

## 63.11 Multiplayer Route Lab

Two players share route preview but have different movement capability.

Verify client-specific compatibility while authoritative world route state remains shared.

## 63.12 Seed-Variation Lab

Generate multiple worlds with radically different roads/rivers/passes.

Verify no route logic assumes fixed geography.

# 64. Handoff to 30I and 30J

## 64.1 30I - NPC Navigation, Pathfinding, Formations, Multiplayer and Persistence

30I receives:

- route plan;
- current route leg;
- local entry/exit nodes;
- traversal/movement mode requirements;
- route reservations;
- replan triggers;
- mover/group corridor constraints;
- journey LOD state.

30I owns local execution/steering/pathfinding and formation spatial movement.

## 64.2 30J - Final Integration

30J freezes:

- route-segment schema;
- route policy schema;
- cost interfaces;
- route API;
- journey records;
- reason codes;
- validation rules;
- cross-set amendments.

# 65. Main-Document Integration Register

| Existing Document | Required Integration |
| --- | --- |
| 02 | Exploration/progression may grant route capabilities/knowledge; no duplicate route solver. |
| 03 | Terrain/block state exposes movement surface/collision data used by route facets. |
| 07 | NPC schedules/jobs query effective distance and route availability. |
| 08 | Logistics dispatch queries 30H travel feasibility/time. |
| 11 | Worldgen supplies terrain/road/river/pass topology and environment state. |
| 12/19/20D | Road/bridge/gate/settlement infrastructure exposes stable movement-facing route facets. |
| 15 | Quest/escort/travel objectives consume journey state. |
| 16 | Danger/war/combat closures feed route policy without moving ownership. |
| 17 | Map/UI presents route alternatives, confidence and blocker reasons. |
| 18/current technical plan | Replace broad route notes with Set 30 interfaces; retain hierarchy/LOD principles. |
| 22I/K/L | Blueprint/nav bake pipeline emits route/transition revisions. |
| 25 | Route IDs, capabilities, migration and validation enter production governance. |
| 26 | Maritime transfer nodes hand off to Set 26. |
| 27H | Economic trade-route simulation consumes physical travel evidence. |
| 28 | Social/group intent remains external. |
| 29 | Travel/exertion biological modifiers remain external. |
| 30B-G | Specialist movement profiles feed route accessibility/cost. |
| 30I/J | Local execution and final schema freeze consume 30H outputs. |

# 66. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward.

30H may include water transfer/ford/maritime nodes but does not redefine swimming or vessel movement.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Carried forward and extended to route estimation.

30H needs a **non-mutating estimate mode** so route planning can estimate exertion-related travel cost without consuming stamina.

Recommended extension:

### Set 30 -> Set 29

```text
query_mode = estimate
movement_mode
movement_action_family
duration_band
terrain_resistance_band
grade_band
load_band
environment_band
rest_policy_ref?
```

### Set 29 -> Set 30

```text
estimated_movement_modifier
estimated_rest_frequency_band
hard_route_restrictions[]
confidence
reason_codes[]
state_revision
```

This is an estimate only. Actual survival state changes remain Set 29 runtime authority.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** Carried forward.

30H can evaluate corridor/group compatibility but does not decide formation/social intent.

## XSI-30-004 - Environmental Movement Field Contract

**Status:** Carried forward.

30H consumes movement-facing wind/gravity/environment state for route availability and expected cost.

## XSI-30-005 - Set 29 Fall Impact Consequence Contract

**Status:** Carried forward; no new change.

## XSI-30-006 - Set 28 Ride Permission and Seat Assignment Contract

**Status:** Carried forward; used only for multimodal travel assignment readiness.

## XSI-30-007 - Aquatic Mount Riding Boundary

**Status:** Carried forward.

## XSI-30-008 - Set 27 Terrestrial Caravan Movement Execution Contract

**Status:** Carried forward and completed on the route-planning side.

30H supplies the route plan, accessibility, ETA, route confidence, dynamic blockers and replans consumed by 30F/27H.

## XSI-30-009 - Automation Power, Control and Transport Readiness Contract

**Status:** Carried forward from 30G.

30H treats guided/powered service readiness as an external input to route accessibility and wait cost.

## XSI-30-010 - Set 27 Guided Freight and Passenger Service Interface

**Status:** Carried forward.

30H can provide the physical route/time portion of guided service; Set 27 retains fares, freight pricing and economics.

## XSI-30-011 - Universal Route Knowledge and Confidence Interface

**Status:** New interface requirement for integration; no ownership transfer.

**Reason:** Movement planning needs route knowledge from maps, exploration, NPC reports, factions, quests and infrastructure without allowing Set 30 to own social knowledge or world discovery.

### External Knowledge Owners -> Set 30

```text
observer_or_group_id
route_or_region_ref
knowledge_state
confidence
last_verified_time
known_closures[]
known_hazards[]
known_transfers[]
source_refs[]
staleness_band
permission_to_reveal
revision
```

### Set 30 Uses It For

- route discovery visibility;
- uncertainty penalties;
- ETA confidence;
- route-warning presentation;
- whether an undiscovered shortcut may be selected.

### Constraint

Set 30 does not determine whether an NPC lied, whether a rumour is socially credible or whether the player has earned a map. It consumes the authorised knowledge state.

# 67. Open Decisions and Deferred Questions

1. Final number of route-graph hierarchy levels after world-scale performance tests.
2. Whether route quality bands alter base speed directly or primarily reduce variance/weather disruption.
3. Exact cost formula weighting for speed versus danger/uncertainty.
4. Default player route policy: fastest or balanced.
5. Whether players can request "scenic" routes in Core Production.
6. Whether settlement service calculations use the exact same route-cost profile as NPC travel or a bounded service approximation.
7. Final congestion abstraction granularity in large cities.
8. Whether routine pedestrian congestion meaningfully changes route cost or is mostly visual.
9. Whether repeated travel automatically creates trails under a future terrain/settlement system.
10. Whether trails can decay when unused.
11. Final mechanics for natural off-road corridor generation at regional scale.
12. Whether discovered caves/tunnels automatically become route graph edges or require a stable entrance/path validation.
13. Final rule for player-made tunnels becoming regional routes.
14. Whether player-built temporary bridges count as stable distant-route edges.
15. Final ford movement interface with Set 26/environment state.
16. Whether ferry routes are represented as Set 26 vessels, infrastructure services or a lightweight transfer provider depending on scale.
17. Final route knowledge states and how quickly information becomes stale.
18. Whether NPC/faction maps can share surveyed routes with the player.
19. Whether route confidence is a hidden planner property or visible as approximate language only.
20. Final long-distance travel-time rounding for player UI.
21. Whether player autotravel is included in Core Production.
22. Whether autotravel can abstract the player's physical movement while no nearby danger/interaction exists.
23. Exact interruption rules for autotravel.
24. Whether instant conventional fast travel exists at all; recommendation remains no unless explicitly added by another owner.
25. Final expected wait-cost modelling for rail/lifts.
26. Final multimodal route candidate limit to prevent combinatorial explosion.
27. Whether Set 27 may supply an economic route policy that prefers cheaper monetary cost over movement time; movement planner can consume a caller score but should not own prices.
28. Final group-corridor width aggregation for convoys/parties.
29. Final route-cache invalidation thresholds after large-scale voxel edits.
30. Final storage format for generated natural corridors.
31. Approval/finalisation of XSI-30-011.
32. Final estimate-mode schema for XSI-30-002.
33. Final integration of terrestrial weather/world-environment owner with XSI-30-004.

# Appendix A. Route Accessibility Decision Matrix

| Condition | Example Result |
| --- | --- |
| Route absent | NoConnection |
| Route known but closed | TemporarilyBlocked |
| Gate permission denied | PermissionBlocked |
| Mover too large | GeometryBlocked |
| Missing climb ability | CapabilityBlocked |
| Bridge cannot support mover class | Geometry/InfrastructureBlocked |
| Mud slows but does not stop | AccessibleWithPenalty |
| Hostile territory allowed by policy | UnsafeButPassable |
| Rail route exists but power/service offline | ServiceUnavailable |
| Route undiscovered to observer | Unknown |
| Glider leg wind outside safe band | EnvironmentBlocked |
| Route requires valid mode transfer | AccessibleWithTransition |
| All checks pass | Accessible |

# Appendix B. Movement-Facing Route Segment Facet

```text
route_segment_id
route_class
endpoint_node_ids[]
geometry_or_path_ref

surface_type
route_quality_band
width
vertical_clearance
grade_band
turn_constraint_profile

supported_movement_classes[]
bridge_or_load_class?
gate_door_dependencies[]
directionality

condition_state
closure_state
permission_ref?
environment_modifier_refs[]
danger_ref?
capacity_band
congestion_band

navigation_revision
knowledge_visibility_class
source_owner_ref
```

# Appendix C. Route Edge Cost Breakdown

```text
route_edge_cost_result
route_segment_id
mover_profile_id
query_tick

accessible_state

base_time_cost
surface_multiplier
grade_multiplier
mover_multiplier
load_multiplier
environment_multiplier
condition_multiplier
congestion_multiplier
risk_policy_multiplier

transition_cost
wait_cost
uncertainty_penalty

effective_cost
estimated_time
confidence

hard_blockers[]
reason_codes[]
input_revisions{}
```

# Appendix D. Route Plan Template

```text
route_plan_id
request_owner
request_ref
observer_or_group_id

origin
destination
mover_profile_refs[]
route_policy_id

regional_corridor_refs[]
ordered_leg_records[]
transfer_node_refs[]

total_effective_cost
estimated_travel_time
estimated_time_range
confidence

known_blockers[]
known_hazards[]
required_permissions[]
required_transport_services[]

route_graph_revision
knowledge_revision
environment_revision
created_tick
expiry/revalidation_policy
```

# Appendix E. Long-Distance Journey Record

```text
journey_id
route_plan_id
traveller_or_convoy_refs[]

departure_time
expected_arrival
actual_arrival?

current_leg_index
current_segment_id
segment_progress
movement_mode
mover_profile_snapshot_refs[]

cargo_refs[]
passenger_refs[]

last_valid_route_node
pending_checkpoint_refs[]
interruption_state?
replan_policy

route_revision
environment_revision
service_revision
knowledge_revision

lod_state
last_simulation_time
```

# Appendix F. Route Knowledge and Confidence Record

```text
route_knowledge_record_id
observer_or_group_id
route_or_region_ref

knowledge_state
confidence
last_verified_time
staleness_band

known_access_state?
known_closures[]
known_hazards[]
known_transfers[]
known_route_quality?

source_refs[]
permission_to_reveal
revision
```

# Appendix G. Route Invalidation Event Template

```text
route_invalidation_event_id
source_owner
source_event_ref

affected_route_segment_ids[]
affected_route_node_ids[]
affected_region_ids[]

invalidation_type
new_revision
effective_time

hard_closure
requires_replan
knowledge_update_policy
reason_codes[]
```

# Appendix H. Movement API Route Result Template

```text
RouteAccessibility(mover_ref, route_ref, policy_ref)
-> {
    accessibility_state,
    required_transition_modes[],
    estimated_segment_time,
    traversal_cost,
    confidence,
    blockers[],
    reason_codes[],
    revision
}

TravelTime(origin, destination, mover_ref, policy_ref)
-> {
    route_plan_id,
    expected_time,
    likely_time_range,
    confidence,
    movement_modes[],
    blockers[],
    revision
}
```

# Appendix I. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| route.none | No connected route currently known/available. | Set 30 |
| route.unknown | Route exists only as unknown/unavailable knowledge. | Knowledge owner + Set 30 |
| route.geometry.width | Mover cannot fit route width. | Set 30 |
| route.geometry.height | Vertical clearance insufficient. | Set 30 |
| route.geometry.turn | Mover cannot negotiate turn. | Set 30 |
| route.grade.blocked | Slope exceeds mover capability. | Set 30 |
| route.surface.penalty | Surface increases movement cost. | Environment/route input + Set 30 |
| route.environment.blocked | Weather/environment makes route unavailable. | Environment owner + Set 30 |
| route.permission.denied | Access denied. | Permission owner |
| route.gate.closed | Required gate currently closed. | Structure/access owner |
| route.bridge.blocked | Bridge currently unavailable/unsuitable. | Structure + Set 30 |
| route.service.unavailable | Required lift/rail/transport service unavailable. | 30G/external service owner |
| route.capacity.congested | Route has expected queue/wait. | Set 30/30I capacity |
| route.danger.high | External danger input raises route cost/warning. | Threat owner |
| route.transfer.required | Movement-mode/service transfer required. | Set 30 |
| route.replan.required | Current plan invalidated. | Set 30 |
| journey.blocked | Active journey cannot continue. | Set 30 |
| journey.delayed | Active route remains valid but ETA increased. | Set 30 |
| journey.arrived | Movement reached valid destination transfer/endpoint. | Set 30 |
| journey.recovery.route_node | Invalid promoted state recovered to last valid route node. | Set 30 |

# Appendix J. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Route Ownership | 20D remains road/infrastructure owner; 30H only interprets movement accessibility/cost. |
| Effective Distance | Longer good road can beat shorter bad terrain. |
| Mover Specificity | Same segment yields different result for pedestrian, mount, wagon and heavy vehicle. |
| Off-Road | Capable movers can route without roads; infrastructure still provides measurable advantage. |
| Dynamic World | Bridge/gate/road edits invalidate bounded graph areas and replan correctly. |
| Weather | Environment changes route cost/access without 30H generating weather. |
| Permissions | Closed/private routes consume external access decisions. |
| Multimodal | Walk/mount/rail/wagon/maritime/portal transfers can coexist without ownership bleed. |
| Knowledge | Player planner does not exploit undiscovered route truth. |
| Travel Time | ETA derives from segment/transition/wait evidence and exposes confidence. |
| Long Distance | Far journey progresses on valid route and does not become teleportation. |
| Cargo | Distant caravan cannot deliver before physical journey/transaction completion. |
| Economy Boundary | Set 27 uses time/access evidence but retains route profit/pricing. |
| Survival Boundary | Set 29 modifiers can affect estimated travel; 30H does not calculate fatigue/hunger/injury. |
| NPC Boundary | 30I executes local pathing; 30H supplies route legs/corridors. |
| Multiplayer | Shared route state authoritative; individual mover compatibility remains specific. |
| Persistence | Route/journey survives save/load and revalidates against changed world state. |
| Seed Independence | Multiple procedural worlds route correctly without fixed POC assumptions. |
| 30F Regression | Wagon/convoy route constraints remain intact. |
| 30G Regression | Rail/lift/powered services remain externally controlled and physically executed by 30G. |

# END OF DOCUMENT 30H
