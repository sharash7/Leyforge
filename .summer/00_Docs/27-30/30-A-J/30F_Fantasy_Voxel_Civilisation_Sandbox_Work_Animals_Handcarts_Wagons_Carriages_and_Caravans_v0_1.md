# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30F - Work Animals, Handcarts, Wagons, Carriages and Caravans

Version 0.1 - Detailed Draft Transport, Unpowered Vehicle and Physical Caravan Movement Design Draft

A production-oriented specification for terrestrial freight and passenger movement in Leyforge, covering work animals, draft teams, handcarts, travois and sleds, carts, wagons, carriages, hitches, harnesses, wheels, steering, braking, cargo capacity, loading alignment, convoy movement, physical caravan execution, road and bridge compatibility, local vehicle simulation, distant travel abstraction, multiplayer authority, persistence and Godot/Summer Engine implementation.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Draft Transport Statement**
>
> Leyforge's carts, wagons and caravans must feel like physical infrastructure rather than animated inventory menus. A wagon should care whether the road is wide enough, whether the bridge can carry it, whether its draft team can pull the current load, whether the wheels can negotiate the slope and whether the gate can actually be turned through. At the same time, the game should avoid turning every delivery into a rigid-body engineering exercise. The system therefore uses readable vehicle profiles, bounded wheel-and-hitch physics, real cargo transactions and scalable convoy movement.

# Document Purpose

Document 30F defines the physical terrestrial transport layer between individual mounts and later powered/guided vehicles. It covers human- and animal-powered mobile cargo/passenger bodies: handcarts, barrows, travois, sleds, two-wheel carts, four-wheel wagons, passenger carriages and physical caravan/convoy movement.

Document 30F does **not** own caravan economics. Document Set 27 - especially 27H - owns trade-route economics, freight value, profit, contracts, imports/exports, caravan business decisions and regional commerce. Set 30 receives an authorised movement mission or destination and determines whether the assigned transport can physically make the journey, how much cargo it can move, how long movement takes under the actual route state and what movement incidents occur.

The document also preserves the earlier settlement/logistics direction that roads are real graph infrastructure with cart-road and heavy-freight classes, that distant deliveries conserve physical stock, and that full cart physics were deliberately deferred until a dedicated movement owner existed. 30F is that movement owner. It turns those earlier interfaces into executable transport rules without taking ownership of storage policy, NPC jobs, animal biology, trade pricing, contracts or settlement planning.

# Governing Source and Dependency Register

| Source | Existing Direction Relevant to 30F | 30F Treatment |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Set 30 owns wagons, carts, vehicles, cargo capacity, route accessibility and travel time; Set 27 owns caravan economy; Set 28 owns social/passenger assignment; Set 29 owns biological stamina/injury. | Binding ownership contract. |
| 00 - Master Game Design Bible | Living civilisations, trade, physical resources, player freedom and scalable settlement growth. | Draft transport becomes a visible link between resources, roads, settlements and trade. |
| 01 - Core Gameplay Loop | Explore -> gather -> craft -> build -> interact -> automate -> defend -> upgrade -> expand. | Transport scales manual carrying into settlement/logistics play without becoming mandatory for every player. |
| 02 - Player Progression | Trade/exploration/settlement paths include caravans, mounts and movement progression. | Progression may unlock transport capability/efficiency; 30F does not own skills/perks. |
| 03 - Blocks Registry | Roads affect movement/trade; carts and cart rails are transport concepts; voxel gates, bridges, slopes and hazards are physical. | 30F consumes route geometry, surface state, openings and collision. |
| 04 - Items Registry | Physical cargo, harness/tack, tools and containers remain item-owned; inventory is slot/count based rather than a universal weight simulator. | 30F consumes cargo/load facets without replacing inventory rules. |
| 05 - Crafting and Recipe Registry | Vehicle components, wheels, harnesses and repairs require real recipes where approved. | 30F never defines recipe ingredients or costs. |
| 06 - Resource Progression | Wood supports carts; leather/hide supports straps/saddles; iron/steel support fittings, axles and later heavy transport. | Material identity informs vehicle content but not movement ownership. |
| 07 - NPC Village System | Haulers, merchants, workers, named NPCs, schedules and persistent assignments exist. | NPC job/intent remains external; 30F executes assigned transport movement. |
| 08 - Automation System | Carts/logistics/routes participate in civilisation-scale supply; authoritative transactions conserve goods. | Automation/logistics owns production/dispatch logic; 30F owns physical cart/wagon movement. |
| 11 - Biomes and World Generation | Roads, mud, snow, slope, bridges, terrain and weather influence travel. | 30F consumes surface and route state; 30H owns route planning/long-distance accessibility architecture. |
| 12 / 19 / 20D | Roads are functional networks; cart roads require width/turning/slope/bridge compatibility; settlements expose loading points, gates and routes. | 30F defines the mover requirements those networks must validate. |
| 15 - Quest and Event System | Escort/transport objectives can move caravans, actors and cargo under route constraints. | Quests request outcomes; 30F reports physical progress/failure. |
| 16 - Combat, Gear and Defence | Ambushes, raids, collision, damage and mounted/vehicle combat need shared movement state. | Combat owns attacks/damage; 30F owns vehicle movement response and incident state. |
| 17 - UI/UX System | Logistics/route overlays, permissions, controller/accessibility and contextual feedback are required. | 30F exposes transport state/reason codes; 17 owns final UI. |
| 18 / technical architecture | Distant caravans and route transport are abstract LOD records; physical goods must remain conserved. | 30F defines promotion/demotion and movement records; current Godot/Summer direction supersedes old engine specifics. |
| 20D - Storage, Roads, Transport, Logistics and Utilities | Foot/service/cart/heavy-freight route classes, effective travel cost, loading points and distant deliveries are already established. | Primary infrastructure dependency and regression contract. |
| 20G - Culture/Faction/Biome/Realm Building Packs | Pastoral/mobile cultures use caravan camps, herd routes, wagon-ring systems and wide freight routes. | Cultural forms can vary while movement uses shared vehicle/draft contracts. |
| 25 - Production Governance | Stable IDs, capability contracts, registry validation, migration and one source of truth. | All vehicle, hitch, route and convoy records are registry-driven. |
| 27A-C/E | Economy owns prices, procurement, contracts, expected arrivals and trade-route economics; expected arrivals never create destination stock before physical delivery. | 30F returns movement facts only. |
| 27H | Terrestrial route economics and caravan missions are the intended economic owner. | 30F exposes a physical caravan execution contract for 27H. |
| 30A | Movement architecture owns land vehicles, towing, cargo capacity, movement state, route accessibility and simulation LOD. | Binding parent architecture. |
| 30E | Mounts, tack, seats and towing-harness boundary; work-animal towing explicitly hands off to 30F. | Direct parent interface for draft creatures and harness compatibility. |
| 30H | Roads, terrain accessibility, navigation and distant travel will own full route planning. | 30F executes vehicle route segments and supplies mover-specific constraints/costs. |
| 30I | NPC navigation, formations, multiplayer and persistence integration. | 30F exposes driver/convoy movement interfaces and vehicle reservations. |

# Governing Ownership Contract

Document 30F owns the physical movement rules for:

- human-pushed and human-pulled handcarts;
- wheelbarrow/barrow-class cargo movers;
- travois and unpowered drag sleds;
- animal-drawn carts;
- animal-drawn wagons;
- passenger carriages/coaches;
- draft teams and hitch geometry;
- towing-harness movement integration from 30E;
- vehicle wheel/axle/chassis movement profiles;
- steering, turning, reversing and braking;
- vehicle clearance and swept-envelope tests;
- cargo movement capacity interfaces;
- vehicle load bands as they affect movement;
- hitch/detach movement procedures;
- parking, docking and loading-position alignment;
- physical convoy/caravan spacing and route execution;
- vehicle state/condition as it affects locomotion;
- local vehicle simulation and distant transport LOD;
- multiplayer authority for terrestrial unpowered vehicles.

Document 30F does **not** own:

- caravan profit, freight price, route profitability or market demand;
- trade contracts, insurance, taxes, toll pricing or wages;
- ownership/social permission decisions;
- NPC employment and merchant AI;
- animal taming, loyalty, fear or biological needs;
- animal/player stamina regeneration or injury calculation;
- inventory ownership, item value or recipe cost;
- automated dispatch/business planning;
- rail-guided vehicles, powered land vehicles or elevators (30G);
- mount riding mechanics (30E);
- general pathfinding/route planner architecture (30H/30I);
- vessel movement (Set 26).

# Static Table of Contents

1. Locked Draft Transport Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Design Principles  
4. System Architecture and Record Separation  
5. Canonical Terminology  
6. Transport Family Taxonomy  
7. Vehicle Capability and Movement Profile Model  
8. Cargo Capacity, Load State and Inventory Boundary  
9. Vehicle Body, Footprint and Swept Envelope  
10. Wheel, Runner and Ground-Contact Model  
11. Rolling/Dragging Resistance and Surface Response  
12. Slope, Grade and Side-Slope Rules  
13. Steering, Turning Radius and Articulation  
14. Braking, Stopping and Reverse Movement  
15. Handcarts, Barrows and Human-Powered Transport  
16. Travois, Sleds and Drag Transport  
17. Work Animals and Draft Availability  
18. Harnesses, Hitches, Yokes and Trace Geometry  
19. Draft Team Composition and Multi-Animal Teams  
20. Hitching and Unhitching Lifecycle  
21. Animal-Drawn Carts  
22. Wagons and Heavy Freight Vehicles  
23. Passenger Carriages and Coaches  
24. Driver, Passenger and Crew Positions  
25. Cargo Containers, Tie-Downs and Load Security  
26. Loading, Unloading, Docking and Warehouse Alignment  
27. Vehicle Condition, Damage-State Movement and Field Repair Boundary  
28. Collision, Obstacle Contact, Stuck and Recovery States  
29. Tipping, Rollover and Unsafe Terrain  
30. Roads, Gates, Bridges and Infrastructure Compatibility  
31. Off-Road Movement and Terrain Degradation Inputs  
32. Weather, Mud, Snow, Ice and Environmental Modifiers  
33. Physical Caravan and Convoy Architecture  
34. Convoy Order, Spacing, Following and Regrouping  
35. Stops, Camps, Parking and Route Checkpoints  
36. Caravan Cargo and Passenger Movement State  
37. Economic/Contract Interfaces to Set 27 and 27H  
38. Quest, Escort and Event Integration  
39. Combat, Ambush, Flee and Defence Integration  
40. Automation, Warehouses and Logistics Integration  
41. NPC Drivers, Haulers and AI Intent Boundary  
42. First-Person and Third-Person Vehicle Interaction  
43. UI, Inspection, Route Warnings and Reason Codes  
44. Accessibility and Driving Assistance  
45. Multiplayer Authority, Prediction and Reservations  
46. Persistence, Save/Load and Recovery  
47. Simulation LOD and Distant Caravan Movement  
48. Registry and Data Definitions  
49. Balance-Draft Baseline Values  
50. Godot/Summer Engine Implementation Direction  
51. Prototype Laboratories and Acceptance Tests  
52. Handoff to 30G, 30H, 30I and 30J  
53. Main-Document Integration Register  
54. Cross-Set Interface Amendments  
55. Open Decisions and Deferred Questions  
Appendix A. Transport State Transition Matrix  
Appendix B. Unpowered Vehicle Movement Profile Template  
Appendix C. Draft Team and Hitch Template  
Appendix D. Cargo/Load Movement Snapshot Template  
Appendix E. Convoy Movement Plan Template  
Appendix F. Caravan Movement Result Template  
Appendix G. Vehicle Runtime Record  
Appendix H. Reason-Code Catalogue  
Appendix I. Multiplayer Transport Contract  
Appendix J. Acceptance and Regression Matrix  

# 1. Locked Draft Transport Identity

Draft transport is the first civilisation-scale movement layer where the world must accommodate a mover larger than a person or mount. A road may be walkable but not cart-accessible. A gate may admit a rider but reject a wagon. A bridge may exist but be too narrow for two vehicles to pass. A steep forest track may be technically traversable but too costly for a heavy load.

> **Locked Rule**
>
> A cart or wagon is not an inventory that teleports between endpoints. Nearby transport uses an authoritative mobile body with real clearance, route, hitch and cargo state. Distant transport may be abstracted, but it must preserve the same route requirements, capacity, time, cargo conservation and incident outcomes.

## 1.1 Player-Facing Promise

Players should be able to predict:

- whether the road is wide enough;
- whether a wagon can turn through a gate;
- whether a draft team can pull the load;
- whether a slope is too steep;
- whether snow/mud makes a route unsuitable;
- whether a bridge is compatible;
- whether an overloaded vehicle will be slow or unable to move;
- how much cargo space remains;
- why a caravan is waiting;
- whether a damaged wheel/axle is limiting movement;
- when a vehicle needs to be unloaded or recovered.

## 1.2 Civilisation Role

Draft transport connects:

- farms to granaries;
- mines to smelters;
- forests to sawmills;
- warehouses to construction sites;
- settlements to markets;
- guards to supply depots;
- caravans to regional roads;
- pastoral cultures to seasonal movement;
- players to large-scale building/logistics.

Automation may reduce repetitive hauling, but carts/wagons remain useful because they:

- carry mixed physical cargo;
- traverse flexible road networks;
- serve settlements without fixed machine infrastructure;
- support NPC labour and trade;
- remain useful during power/mana failures;
- provide visible civilisation activity.

# 2. Scope, Ownership and Explicit Non-Goals

## 2.1 30F Owns

- physical unpowered vehicle movement;
- mover geometry and route compatibility;
- input-to-steering/braking response;
- towing relationship between draft entity and vehicle;
- movement effect of cargo/load;
- physical convoy execution;
- vehicle movement condition;
- near/far movement equivalence;
- transport reason codes;
- movement-facing vehicle registries.

## 2.2 Explicit Non-Goals

30F is not:

- a universal rigid-body vehicle simulator;
- a caravan economy;
- a merchant/business AI;
- an inventory replacement;
- a horse biology simulator;
- a road-construction system;
- a traffic-city simulator;
- a powered-car engine system;
- a rail system;
- a vehicle crafting catalogue;
- a damage/health authority.

# 3. Design Principles

## 3.1 Bigger Movers Need Bigger Infrastructure

Route compatibility scales with:

- width;
- height;
- turning envelope;
- grade;
- surface;
- bridge/gate capacity;
- clearance at corners;
- passing space;
- load;
- draft configuration.

## 3.2 Physical Enough, Not Tedious

The system should model enough to make route choice matter but avoid:

- individual wheel suspension tuning by the player;
- manual rein tension;
- continuous axle lubrication minigames;
- realistic animal gait micromanagement;
- per-crate weight spreadsheets;
- frequent random wheel breakage.

## 3.3 Cargo Remains Real

A wagon's cargo is an authoritative container/collection of containers.

A distant caravan cannot deliver items that were never reserved/loaded.

## 3.4 Roads Have Economic Meaning Through Movement

Set 27 may value a route economically, but that value must be grounded in movement facts such as:

- accessibility;
- capacity;
- speed;
- delay;
- incident state.

## 3.5 Failure Must Be Recoverable

Most blocked states should create:

- stop;
- unload;
- reverse;
- unhitch;
- repair;
- reroute;
- add draft capacity;
- wait for conditions;
- request assistance.

Not instant destruction.

# 4. System Architecture and Record Separation

```text
Transport Intent / Route Segment
          |
          v
Vehicle + Draft + Cargo Resolver
          |
    +-----+------+----------------+
    |            |                |
    v            v                v
Vehicle Profile  Draft Snapshot   Cargo Load Snapshot
    |            |                |
    +------------+----------------+
                 |
                 v
        Route Compatibility Query
                 |
                 v
      Local Vehicle Motion Solver
      /                         \
 Hand/Push                     Draft Team
      \                         /
       +---- Hitch Constraint --+
                 |
                 v
   Authoritative Transport Runtime
                 |
        +--------+--------+
        |                 |
        v                 v
Movement API        Economic/Quest Facts
```

## 4.1 Record Separation

| Record | Responsibility |
| --- | --- |
| VehicleDefinition | Immutable transport family/body configuration. |
| VehicleMovementProfile | Handling, footprint, wheels/runners, grade/turning limits and movement capability. |
| VehicleInstance | Persistent world object, components, containers, condition, owner references. |
| HitchDefinition | Compatible towing geometry/capabilities. |
| DraftTeamRuntime | Current assigned draft entities and towing state. |
| CargoLoadSnapshot | Movement-facing load/container state supplied by inventory/logistics. |
| ConvoyMovementPlan | Ordered physical movement assignment supplied by a caller. |
| TransportRuntimeRecord | Current local/far movement state. |
| MovementResult | Capacity, accessibility, time/progress, incident and reason outputs. |

# 5. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Handcart | Small wheeled transport directly pushed/pulled by a humanoid mover. |
| Barrow | One/two-wheel hand transport where the operator supports part of the load. |
| Travois | Drag frame pulled by a person/animal without conventional wheels. |
| Sled | Runner-based vehicle intended for low-resistance snow/ice or prepared surfaces. |
| Cart | Light animal-drawn wheeled vehicle, typically one axle/two wheels. |
| Wagon | Larger freight vehicle with greater cargo/body size, normally multi-axle/four-wheel. |
| Carriage/Coach | Passenger-focused wagon family with seats/enclosure/comfort features. |
| Draft Animal | Creature assigned to provide towing force through a valid harness/hitch. |
| Draft Team | One or more draft animals assigned to the same vehicle. |
| Hitch | Authoritative connection between towing mover/team and vehicle. |
| Yoke/Trace | Equipment/geometry family distributing pull between animals and vehicle. |
| Tongue/Pole | Vehicle-side hitch member connecting to draft team. |
| Gross Load Band | Movement-facing load class derived from vehicle, cargo and passenger state; not a universal kilogram inventory system. |
| Tractive Capacity | Movement-facing towing capability available from the current draft team. |
| Rolling Resistance | Surface/vehicle opposition to wheeled motion. |
| Drag Resistance | Surface/vehicle opposition to sled/travois motion. |
| Swept Envelope | Space required by the complete vehicle/team through a movement/turn. |
| Articulation | Relative rotation between connected vehicle sections/hitch elements. |
| Route Compatibility | Whether mover/profile can physically use a route segment now. |
| Convoy | Ordered group of movers/vehicles physically travelling together. |
| Caravan | A convoy whose broader mission is supplied by economic/quest/social owners; 30F owns only physical execution. |

# 6. Transport Family Taxonomy

## 6.1 Core Families

| Family | Primary Role | Propulsion |
| --- | --- | --- |
| Barrow | Local construction/farm hauling | Human |
| Handcart | Local mixed cargo | Human |
| Travois | Early/simple rough-route cargo | Human/animal |
| Sled | Snow/ice/winter freight | Human/animal |
| Light Cart | Farm/local trade | 1 draft animal or small team |
| Freight Cart | Heavier local bulk | draft animal/team |
| Standard Wagon | Regional freight/settlement supply | draft team |
| Heavy Wagon | Heavy construction/military/bulk | larger team |
| Carriage | Passenger travel | draft team |
| Coach | Multi-passenger/longer passenger travel | draft team |
| Caravan Wagon Variant | Freight/combined travel package | draft team |

## 6.2 Excluded Families

The following belong primarily to 30G:

- powered automobiles;
- self-propelled magitech carts;
- steam land engines;
- rail minecarts;
- trams;
- elevators/lifts.

# 7. Vehicle Capability and Movement Profile Model

Every vehicle resolves through a movement profile.

Required capability concepts include:

- `transport.handcart`;
- `transport.cart.light`;
- `transport.wagon.standard`;
- `transport.wagon.heavy`;
- `transport.carriage`;
- `transport.sled`;
- `transport.travois`;
- `transport.reverse`;
- `transport.offroad`;
- `transport.bridge.light`;
- `transport.bridge.heavy`;
- `transport.gate.standard`;
- `transport.convoy`.

A vehicle may be visually culture-specific while reusing a common movement family.

# 8. Cargo Capacity, Load State and Inventory Boundary

Leyforge's inventory foundation remains slot/container based. 30F does not introduce a universal kilogram inventory simulation.

## 8.1 Cargo Capacity Layers

A vehicle may expose:

- cargo slots;
- container sockets;
- bulk-item sockets;
- passenger seats;
- external tie-down points;
- protected/covered storage;
- special goods compatibility;
- movement load capacity band.

## 8.2 Gross Load Band

The inventory/logistics layer resolves a movement-facing `GrossLoadBand`, for example:

- Empty;
- Light;
- Moderate;
- Heavy;
- NearLimit;
- OverLimit.

Inputs may include:

- occupied cargo capacity;
- item bulk/transport-class tags;
- attached containers;
- passengers;
- special oversized objects.

30F consumes the band and any centre/distribution warnings.

## 8.3 Overload Rule

An overloaded vehicle is not automatically allowed to move slowly forever.

Profiles may define:

- reduced acceleration;
- reduced grade limit;
- reduced braking;
- no movement above a hard overload band;
- increased stuck/tipping risk;
- required extra draft capacity.

The economic system may value the load, but 30F only sees movement state.

# 9. Vehicle Body, Footprint and Swept Envelope

## 9.1 Body Geometry

A movement profile exposes:

- body width;
- body length;
- body height;
- wheel/runner contact positions;
- hitch reach;
- articulation points;
- cargo overhang allowance;
- passenger/driver clearance;
- turn-swept envelope.

## 9.2 Route Query

Route compatibility checks the full vehicle/team envelope, not only the centre point.

A wagon may fail a route because:

- the body clips a wall;
- the rear corner cannot turn;
- the draft team cannot align;
- the overhead load hits an arch;
- a gate is wide enough straight-on but not through the approach turn.

# 10. Wheel, Runner and Ground-Contact Model

30F uses a bounded locomotion model.

## 10.1 Wheels

Each axle/contact group supplies:

- contact position;
- effective wheel radius class;
- terrain contact;
- suspension/clearance class;
- steering/fixed status;
- damage/condition contribution.

The vehicle does not require a fully simulated rigid wheel collider per visible wheel if a simpler deterministic solver passes the labs.

## 10.2 Runners

Sled/travois profiles use:

- runner/drag footprint;
- surface compatibility;
- drag resistance;
- lateral slip band;
- snow/ice benefit;
- bare-ground penalty.

## 10.3 Presentation

Wheel rotation, suspension bounce and dust are presentation derived from authoritative travel.

# 11. Rolling/Dragging Resistance and Surface Response

The route/environment owner supplies surface movement context.

30F computes a movement demand from:

- surface resistance;
- slope;
- load band;
- vehicle condition;
- turning;
- start-from-rest;
- weather surface modifier.

The resulting demand is compared against:

- human push/pull capability;
- draft-team tractive capacity.

## 11.1 Surface Examples

| Surface | Wheeled Vehicle | Sled/Travois |
| --- | --- | --- |
| Paved/stone road | Very good | Poor/acceptable by profile |
| Packed dirt road | Good | Moderate |
| Grass | Moderate | Moderate |
| Mud | Poor | Poor/variable |
| Deep snow | Poor | Excellent for sled |
| Ice | Low rolling resistance but braking/steering risk | Good but slippery |
| Loose sand | Poor | Poor |
| Rubble | Poor / damage risk | Variable |
| Rail | Not applicable to free vehicles | Not applicable |

# 12. Slope, Grade and Side-Slope Rules

## 12.1 Grade

Each vehicle profile declares:

- preferred grade;
- maximum loaded grade;
- maximum empty grade;
- downhill braking limit;
- emergency/no-go grade.

Draft capacity and surface condition modify effective grade capability.

## 12.2 Side Slope

Side-slope limits matter for wagons/carriages because tipping becomes possible.

A road can be walkable and still be wagon-unsafe.

## 12.3 Crest/Breakover

Long vehicles also validate:

- sharp crests;
- ditch crossings;
- bottoming-out;
- hitch angle.

No full suspension engineering is required, but obviously impossible geometry must be rejected.

# 13. Steering, Turning Radius and Articulation

## 13.1 Turning

Vehicles use profile-driven steering rather than rotating in place.

Important values:

- minimum forward turning radius;
- reverse turning response;
- articulation limit;
- steering speed;
- low-speed manoeuvre multiplier;
- high-speed steering reduction.

## 13.2 Two-Wheel Cart

A light cart may pivot more tightly around the animal/axle.

## 13.3 Four-Wheel Wagon

A wagon requires a larger swept envelope and may use a steerable front axle.

## 13.4 Reversing

Reverse is slower and more difficult.

Accessibility may provide steering assist, but the route must still fit.

# 14. Braking, Stopping and Reverse Movement

Braking sources include:

- driver brake;
- vehicle brake mechanism;
- draft-team resisting force;
- terrain/surface resistance;
- parking brake/chock state.

## 14.1 Downhill Safety

A vehicle cannot rely on the draft animal alone if the profile/load requires mechanical braking.

A steep downhill may be:

- safe;
- slow-only;
- brake-required;
- unload-required;
- inaccessible.

## 14.2 Parking

A stationary vehicle can enter:

- parked;
- brake/chocked;
- hitched-idle;
- unhitched;
- loading-aligned.

Parking state matters on slopes.

# 15. Handcarts, Barrows and Human-Powered Transport

## 15.1 Movement Relationship

The operator and handcart form one constrained movement group while engaged.

The player/NPC remains the locomotor; the cart supplies:

- additional collision body;
- handling resistance;
- load state;
- turn/reverse limits.

## 15.2 Entry/Exit

To engage a handcart:

- handle interaction valid;
- correct approach/clearance;
- no conflicting two-hand action;
- permission valid;
- cart not locked/braked;
- Set 29 movement/exertion response permits the action.

## 15.3 Handcart Benefits

Handcarts should:

- move more cargo than carried inventory alone;
- be useful in settlements/construction;
- fit service paths unavailable to large wagons;
- remain viable before animal transport.

## 15.4 Limits

Handcarts:

- move slower when heavily loaded;
- perform poorly on steep slopes/mud;
- require wider turns than the player alone;
- prevent some combat/tool actions;
- may require unloading to cross stairs or narrow interiors.

# 16. Travois, Sleds and Drag Transport

## 16.1 Travois

Travois provide:

- simple early construction;
- rough-ground flexibility;
- low mechanical complexity;
- worse efficiency on good roads than wheels.

## 16.2 Sleds

Sleds are specialised for:

- snow;
- ice;
- packed winter roads;
- some magical slick surfaces.

They are intentionally poor on ordinary rough dry terrain unless the profile says otherwise.

## 16.3 Seasonal Value

A winter settlement may switch freight strategy from wagon to sled because the same route's surface state changes.

30F reports movement suitability; economy/logistics decides whether switching is worthwhile.

# 17. Work Animals and Draft Availability

Work animals remain living creatures, not engines.

30F consumes:

- creature identity/body profile;
- draft compatibility;
- current physical availability;
- movement capability;
- external injury/fatigue restriction;
- harness compatibility.

30F does not calculate:

- hunger;
- thirst;
- fatigue regeneration;
- fear;
- loyalty;
- taming;
- disease;
- injury severity.

## 17.1 Draft Availability Snapshot

The 30E/creature interface is extended for towing use:

```text
entity_id
draft_allowed
available_tractive_band
max_safe_speed_band
movement_modifier
grade_modifier
hard_restrictions[]
current_gait_capabilities[]
harness_compatibility[]
reason_codes[]
state_revision
```

The owner of creature/biological state produces the values.

# 18. Harnesses, Hitches, Yokes and Trace Geometry

Harness identity remains item/tack-owned.

30F consumes a movement-facing hitch facet.

## 18.1 Hitch Roles

Suggested semantic roles:

- `vehicle.hitch.front_center`;
- `vehicle.hitch.pole_left`;
- `vehicle.hitch.pole_right`;
- `vehicle.hitch.team_lead`;
- `vehicle.hitch.team_pair`;
- `vehicle.hitch.rear_tow`;
- `draft.harness.trace_left`;
- `draft.harness.trace_right`.

## 18.2 Compatibility

A hitch requires compatible:

- body size;
- harness family;
- vehicle pole/yoke;
- team layout;
- clearance;
- direction;
- towing capability.

# 19. Draft Team Composition and Multi-Animal Teams

30F supports:

- single animal;
- paired animals;
- tandem line;
- two-pair team;
- larger specialist teams through data.

## 19.1 Team Capacity

Combined tractive capacity is not a simple linear sum.

Profile factors may include:

- harness efficiency;
- team arrangement;
- creature compatibility;
- synchronisation;
- route width;
- leader/driver control.

A four-animal team may pull substantially more than one, but not necessarily exactly four times as much.

## 19.2 Mismatched Teams

Different creature families may be allowed only if a team profile supports them.

Set 30 does not decide whether the animals socially tolerate one another; the creature/social owner can deny assignment.

# 20. Hitching and Unhitching Lifecycle

```text
Available
-> Alignment
-> Harness Validation
-> Hitch Reservation
-> Hitch Commit
-> Hitched Idle
-> Moving
-> Stop
-> Unhitch Validation
-> Detached
```

## 20.1 Default Hitch Rule

Hitching normally requires:

- vehicle stationary/parked;
- animal controlled/available;
- valid harness;
- clear hitch volume;
- permission;
- compatible team slot.

## 20.2 Emergency Unhitch

Some events may allow forced separation:

- overturned wagon;
- fire;
- creature panic;
- broken pole;
- combat release.

The cause comes from the owning system; 30F executes the physical detach result.

# 21. Animal-Drawn Carts

Light carts should be the first animal-drawn transport tier.

Identity:

- one axle;
- small cargo;
- relatively tight turning;
- moderate off-road capability;
- accessible farm/local-road use;
- low bridge/gate demand.

Typical uses:

- harvest;
- firewood;
- ore;
- market deliveries;
- construction supplies;
- small merchant transport.

# 22. Wagons and Heavy Freight Vehicles

Wagons scale cargo but demand infrastructure.

## 22.1 Wagon Identity

- larger footprint;
- multiple axles;
- more cargo/container slots;
- larger draft team;
- wider road/gate needs;
- stronger bridge requirements;
- better regional freight efficiency.

## 22.2 Heavy Wagon

Heavy freight profiles may require:

- reinforced road;
- heavy bridge;
- broad turning radius;
- multiple draft pairs;
- dedicated loading bay;
- reduced off-road access.

This creates real reasons for settlement infrastructure investment.

# 23. Passenger Carriages and Coaches

Carriages are passenger-focused vehicle profiles.

They may add:

- enclosed seating;
- suspension/comfort class;
- luggage compartments;
- step/door access;
- multiple passenger seats;
- driver position;
- roof cargo;
- culture-specific body variants.

30F owns seating geometry and movement; Set 28/NPC systems own who is assigned/allowed to ride.

# 24. Driver, Passenger and Crew Positions

## 24.1 Driver

Driver position exposes:

- control authority role;
- seat/standing anchor;
- reins/handle interaction;
- camera anchor;
- dismount exits;
- action restrictions.

## 24.2 Passengers

Passengers use stable seat IDs.

Vehicle movement does not depend on passenger social identity.

## 24.3 Crew

A larger caravan wagon may expose:

- driver;
- assistant;
- guard seat;
- passenger seats.

Combat/social systems decide occupant roles; 30F validates seat/clearance and movement attachment.

# 25. Cargo Containers, Tie-Downs and Load Security

## 25.1 Cargo Modes

- internal vehicle inventory;
- attached chest/crate/barrel sockets;
- bulk bin;
- external tie-down;
- oversized-object mount;
- passenger luggage.

## 25.2 Load Security

Movement-facing cargo state may expose:

- secured;
- partially secured;
- unsecured;
- incompatible.

30F can use this state to determine:

- speed cap;
- rough-terrain restriction;
- rollover/spill susceptibility.

Inventory/ownership systems decide item loss/transfer.

## 25.3 No Decorative Cargo Authority

Visible sacks/crates are presentation unless linked to authoritative cargo records.

# 26. Loading, Unloading, Docking and Warehouse Alignment

30F owns positioning, not the item transaction.

## 26.1 Loading Marker

Warehouses/markets/worksites may expose:

- approach direction;
- vehicle class;
- clear loading rectangle;
- stop anchor;
- hitch/animal waiting area;
- transfer endpoint.

## 26.2 Docking

The vehicle may use low-speed alignment assistance to reach a valid loading marker.

Once parked:

- logistics/inventory owner moves goods through validated transactions;
- 30F reports available capacity and vehicle state;
- visual loading follows transaction state.

## 26.3 No Teleport Loading

A wagon cannot receive distant warehouse cargo while physically elsewhere unless the logistics system is explicitly resolving a far-LOD shipment using the same conserved record.

# 27. Vehicle Condition, Damage-State Movement and Field Repair Boundary

Set 30 exposes `VehicleCondition()` as movement-facing state.

## 27.1 Condition Categories

- Operational;
- Worn;
- Degraded;
- Damaged;
- Immobilised;
- Destroyed/NonMover.

## 27.2 Component Movement Effects

Possible sources:

- wheel damaged/missing;
- axle damaged;
- hitch/pole damaged;
- brake damaged;
- runner damaged;
- chassis collision deformation.

Damage source/severity is Combat/Item/Structure-owned as applicable.

30F determines what the resulting component state means for movement.

## 27.3 Field Repair

30F may report:

- required movement component category;
- whether safe to move;
- whether unload is required.

Recipes/items own actual repair transactions.

# 28. Collision, Obstacle Contact, Stuck and Recovery States

## 28.1 Contact

Minor collision:

- stops/slides;
- reduces speed;
- reports contact.

Major collision consequence belongs to Combat/condition owners.

## 28.2 Stuck State

A vehicle may become `Stuck` when:

- wheel/runner cannot progress;
- clearance cannot resolve;
- deep mud/snow exceeds profile;
- articulation locks;
- obstacle traps the body.

## 28.3 Recovery Options

- reverse;
- unload;
- add draft animals;
- improve road/terrain;
- use player/NPC push assistance;
- repair;
- tow with another vehicle/mount profile;
- dismantle/reassemble where item/structure rules permit;
- use external magic/automation assist.

30F owns recovery movement validation, not the cost of the solution.

# 29. Tipping, Rollover and Unsafe Terrain

30F uses a simplified stability model based on:

- vehicle width;
- centre/load distribution band;
- side slope;
- turn speed;
- obstacle contact;
- lateral acceleration;
- surface slip.

## 29.1 Stability States

- Stable;
- Caution;
- Unstable;
- Tipping;
- Rolled/Overturned.

## 29.2 Rollover

Rollover is an authoritative movement state, not necessarily full rigid-body chaos.

A deterministic/bounded overturn motion is acceptable for gameplay and multiplayer.

Cargo spill/damage consequences are requested through owning systems.

# 30. Roads, Gates, Bridges and Infrastructure Compatibility

20D route classes remain authoritative infrastructure semantics.

30F maps vehicle profiles onto them.

## 30.1 Suggested Compatibility

| Vehicle | Footpath | Service Path | Cart Road | Heavy Freight Road |
| --- | --- | --- | --- | --- |
| Barrow | Conditional | Yes | Yes | Yes |
| Handcart | Usually no/conditional | Yes | Yes | Yes |
| Travois | Conditional | Yes | Yes | Yes |
| Light Cart | No | Conditional | Yes | Yes |
| Standard Wagon | No | No/conditional | Yes if profile permits | Yes |
| Heavy Wagon | No | No | Conditional | Yes |
| Carriage | No | Conditional | Yes | Yes |

Route geometry can override the nominal class.

## 30.2 Gates

Gate checks include:

- clear width;
- clear height;
- approach alignment;
- turning envelope;
- door/open state;
- queue capacity.

## 30.3 Bridges

Bridge interfaces expose:

- usable width;
- clearance;
- route class;
- current damage state;
- movement capacity class;
- one-way/passing restrictions.

30F does not calculate structural engineering.

# 31. Off-Road Movement and Terrain Degradation Inputs

Some vehicles can leave roads.

Off-road movement is profile-driven.

## 31.1 Off-Road Penalties

Possible:

- lower speed;
- higher tractive demand;
- reduced turning;
- greater stuck risk;
- harsher slope limit;
- reduced cargo-safe band.

## 31.2 Terrain Damage

30F may emit movement facts such as:

- heavy vehicle passage;
- repeated traffic;
- wheel rut event;
- skid/drag event.

The terrain/environment system decides whether mud/ruts/erosion actually change blocks/state.

# 32. Weather, Mud, Snow, Ice and Environmental Modifiers

30F consumes the movement-facing environment/surface snapshot.

Examples:

- wet road -> reduced traction;
- mud -> increased rolling resistance/stuck risk;
- deep snow -> wagon penalty, sled bonus;
- ice -> low resistance but weak steering/braking;
- high wind -> carriage/wagon side-force if environment owner marks significant;
- extreme heat/cold -> biological effects remain external.

XSI-30-004 remains the shared environment-field contract where atmospheric force matters.

# 33. Physical Caravan and Convoy Architecture

A caravan is represented physically as an ordered convoy when nearby.

30F does not decide why the caravan exists.

## 33.1 Convoy Members

Possible members:

- mounted scout;
- lead wagon;
- freight wagons;
- passenger carriage;
- pack animals;
- guards;
- rear wagon.

The mission/economic/social systems supply assigned members.

## 33.2 Convoy Movement Controller

The physical convoy controller coordinates:

- shared route leg;
- order;
- spacing;
- speed target;
- stop/regroup;
- obstruction propagation;
- passing policy;
- checkpoint state.

Each vehicle remains authoritative; the convoy controller does not teleport followers.

# 34. Convoy Order, Spacing, Following and Regrouping

## 34.1 Spacing

Spacing depends on:

- speed;
- braking distance;
- vehicle length;
- slope;
- visibility;
- road width;
- danger state;
- route/culture policy supplied externally.

30F owns physical minimum/safe spacing.

## 34.2 Leader

The leader may be:

- lead rider;
- lead wagon;
- route guide.

30F consumes the assigned leader.

## 34.3 Regroup

If a member is delayed:

- trailing vehicles stop or slow;
- convoy may split if caller policy permits;
- regroup point may be selected from valid route/checkpoint markers.

Economic mission policy decides whether to wait, abandon or reroute; 30F reports movement state.

# 35. Stops, Camps, Parking and Route Checkpoints

30F supports movement-facing stop markers:

- roadside pull-off;
- caravan yard;
- inn/stable;
- warehouse;
- customs/checkpoint;
- bridge queue;
- camp clearing;
- emergency stop.

## 35.1 Stop Validity

Requires:

- sufficient parking area;
- route connection;
- vehicle class support;
- safe slope;
- turning/exit path;
- draft-animal standing area where required.

Rest, feeding, trade and social activity remain external.

# 36. Caravan Cargo and Passenger Movement State

The convoy exposes:

- total physical cargo capacity;
- used capacity;
- per-vehicle cargo state;
- passenger capacity;
- movement-ready vehicles;
- immobilised vehicles;
- route-segment progress;
- expected arrival from movement;
- actual arrival;
- cargo movement incident facts.

It does not expose economic value as movement truth.

# 37. Economic/Contract Interfaces to Set 27 and 27H

Set 27/27H supplies movement requests such as:

```text
caravan_mission_id
assigned_vehicle_refs[]
assigned_draft_entity_refs[]
assigned_driver_refs[]
cargo_commitment_refs[]
origin
destination
departure_window
arrival_window
route_policy
allowed_stop_policy
risk/escort policy refs
```

30F/30H returns:

```text
movement_plan_id
route_accessibility
capacity_available
capacity_used
estimated_travel_time
actual_departure
movement_progress
delay_state
arrival_time
physical_delivery_readiness
vehicle_incidents[]
cargo_movement_incidents[]
reason_codes[]
```

Set 27 calculates:

- price;
- profit;
- contract value;
- wages;
- taxes;
- insurance;
- economic loss;
- market consequence.

# 38. Quest, Escort and Event Integration

A quest/event may bind to:

- specific caravan;
- convoy;
- wagon;
- passenger;
- cargo lot;
- route checkpoint;
- delivery state.

30F reports:

- departed;
- stopped;
- delayed;
- route blocked;
- member separated;
- vehicle immobilised;
- arrived;
- physical handover ready.

Quest logic owns success/failure conditions.

# 39. Combat, Ambush, Flee and Defence Integration

## 39.1 Threat Response Requests

Combat/AI may request:

- stop;
- accelerate/flee;
- turn around;
- scatter;
- form wagon ring;
- dismount occupants;
- release draft animals;
- block road.

30F validates movement feasibility.

## 39.2 Wagon Ring

A pastoral/military group may intentionally park wagons in a defensive ring.

30F owns:

- vehicle positioning validity;
- turn/clearance;
- parking/locking state.

Combat owns:

- cover;
- defence bonuses;
- attack behaviour;
- damage.

## 39.3 Vehicle Collision in Combat

30F reports physical collision velocity/contact.

Combat owns damage to:

- creature;
- player;
- vehicle;
- cargo.

# 40. Automation, Warehouses and Logistics Integration

Automation/logistics may create transport intents.

Examples:

- move ore from mine store to settlement warehouse;
- move construction stock to project;
- deliver farm produce;
- replenish market.

30F executes physical cart/wagon motion if the job uses mobile transport.

## 40.1 Transaction Boundary

Loading/unloading follows authoritative resource transactions.

Vehicle visuals never create/delete stock.

## 40.2 Dispatch Boundary

Automation/NPC logistics decide:

- what to move;
- when;
- from where;
- to where;
- priority.

30F decides:

- can this vehicle make the route;
- current movement capacity;
- travel progress;
- arrival/blockage.

# 41. NPC Drivers, Haulers and AI Intent Boundary

NPC/Set 28/30I systems supply:

- driver assignment;
- navigation destination;
- caravan role;
- behavioural response;
- willingness/permission.

30F supplies:

- control interface;
- vehicle state;
- steering targets;
- route constraints;
- hitch state;
- movement reasons.

A driver does not become economically "smart" because the wagon controller can move.

# 42. First-Person and Third-Person Vehicle Interaction

## 42.1 Driving View

For player-driven carts/wagons:

- third person is generally the most readable default;
- first person remains supported where the driver seat/rig allows;
- camera movement cannot alter vehicle authority;
- camera must show route/turn clearance sufficiently.

## 42.2 Handcart View

Handcart interaction should preserve normal player camera as much as practical.

## 42.3 Passenger View

Passengers retain camera control within seat/body constraints.

# 43. UI, Inspection, Route Warnings and Reason Codes

Minimal transport UI should communicate:

- current vehicle condition;
- cargo capacity/use;
- draft team availability;
- current speed/gait;
- brake/park state;
- route blocker;
- overload state;
- stuck state;
- convoy wait/regroup state.

## 43.1 Player-Readable Reasons

Examples:

- `Road too narrow for wagon`;
- `Gate turn cannot clear`;
- `Bridge unsuitable for heavy wagon`;
- `Load exceeds current draft capacity`;
- `Too steep`;
- `Deep mud - wagon stuck`;
- `Wheel damaged`;
- `No driver`;
- `Draft animal unavailable`;
- `Cargo not secured`;
- `Loading bay occupied`;
- `Convoy waiting for separated vehicle`.

# 44. Accessibility and Driving Assistance

Supported assistance may include:

- steering sensitivity;
- reverse steering assist;
- wider low-speed steering correction;
- automatic centring on roads;
- braking assist;
- hill-hold;
- obstacle/turn warning;
- projected swept-envelope overlay;
- route compatibility preview;
- simplified hitch alignment;
- loading-bay auto-align;
- convoy follow assist;
- reduced camera sway;
- motion comfort options;
- hold/toggle brake/drive controls.

Assistance cannot:

- fit a heavy wagon through a narrow gate;
- remove cargo/load;
- ignore a broken bridge;
- create draft capacity;
- phase through another vehicle.

# 45. Multiplayer Authority, Prediction and Reservations

## 45.1 Authority

Server/host owns:

- vehicle transform;
- velocity;
- steering state;
- hitch links;
- draft team assignment movement state;
- driver control authority;
- cargo-capacity snapshot reference;
- vehicle condition;
- route compatibility;
- collision/stuck/rollover state;
- convoy progress.

## 45.2 Client Prediction

Player-driven nearby vehicles may predict:

- throttle/pull request;
- steering;
- braking;
- low-speed reverse.

Prediction is more conservative than player on-foot locomotion because large collision envelopes affect other players/world objects.

## 45.3 Reservations

Reservations may cover:

- driver seat;
- passenger seat;
- hitch slot;
- loading bay;
- narrow bridge;
- single-lane gate;
- caravan parking slot.

# 46. Persistence, Save/Load and Recovery

Persist:

- vehicle instance ID/definition/profile;
- transform;
- velocity if meaningful;
- cargo/container references;
- condition/component state refs;
- hitch links;
- draft team refs;
- driver/passenger refs;
- parking/brake state;
- current route/convoy refs;
- movement progress;
- last valid recovery location.

## 46.1 Load Validation

On load:

1. validate vehicle geometry;
2. validate cargo refs;
3. validate hitch entities;
4. validate route/support;
5. validate driver/passenger attachments;
6. restore local/far movement state;
7. recover to last valid route node/parking area only if world edits made the saved placement invalid.

# 47. Simulation LOD and Distant Caravan Movement

## 47.1 Near - Physical

- full vehicle bodies;
- visible draft animals;
- wheel/run presentation;
- collision;
- real road/gate/bridge traversal;
- loading-point positioning;
- convoy spacing.

## 47.2 Medium - Reduced Local

- simplified vehicle steering;
- route-node following;
- reduced collision frequency;
- preserved vehicle/animal/cargo identity;
- bounded convoy spacing.

## 47.3 Far - Route Progress

Use a `TransportJourneyRecord`:

- current route segment;
- segment start/end time;
- vehicle/draft capability;
- cargo refs;
- movement condition;
- expected arrival;
- scheduled blocker/incident checks;
- convoy membership.

No hidden vehicle ticks are required.

## 47.4 Promotion/Demotion

Demotion records exact cargo/hitch/condition state.

Promotion reconstructs:

- vehicle positions along route;
- ordered convoy;
- draft team;
- cargo;
- blocker/incident state.

If detailed reconstruction cannot satisfy route geometry, the convoy stops at the nearest valid route node rather than clipping through terrain.

# 48. Registry and Data Definitions

## 48.1 VehicleDefinition

Suggested IDs:

- `transport.vehicle.handcart.basic`
- `transport.vehicle.cart.light`
- `transport.vehicle.wagon.standard`
- `transport.vehicle.wagon.heavy`
- `transport.vehicle.carriage.standard`
- `transport.vehicle.sled.freight`

Fields:

- movement profile;
- body model/Forge ref;
- cargo profile;
- seat profile;
- hitch profile;
- wheel/runner profile;
- required route classes;
- repair/component refs;
- presentation refs;
- lifecycle/version.

## 48.2 VehicleMovementProfile

Fields include:

- body dimensions;
- swept envelope;
- turning radius;
- steering response;
- reverse support;
- wheel/runner contact profile;
- grade limits;
- side-slope limits;
- braking;
- off-road class;
- load-band multipliers;
- draft-demand profile;
- road/bridge/gate classes;
- stuck/recovery policy;
- prediction class.

# 49. Balance-Draft Baseline Values

These are starting targets for prototyping, not immutable shipped balance.

## 49.1 Vehicle Speeds

| Family | Typical Clear-Road Target |
| --- | ---: |
| Loaded barrow | ~1.4-2.0 m/s |
| Handcart | ~1.8-2.8 m/s |
| Travois | ~1.5-2.5 m/s |
| Freight sled on good snow | ~2.5-4.0 m/s |
| Light cart | ~4.0-6.0 m/s |
| Standard wagon | ~3.5-5.0 m/s |
| Heavy wagon | ~2.5-4.0 m/s |
| Passenger carriage | ~5.0-7.0 m/s on suitable road |

Animal/biological owners may reduce effective speed.

## 49.2 Approximate Infrastructure Targets

| Profile | Starting Target |
| --- | --- |
| Handcart minimum clear width | ~1.25-1.5 m |
| Light cart minimum clear width | ~2.0-2.4 m |
| Standard wagon minimum clear width | ~2.5-3.0 m |
| Heavy wagon minimum clear width | ~3.0-3.5 m |
| Light cart minimum turning radius | ~3-4 m |
| Standard wagon minimum turning radius | ~5-7 m |
| Heavy wagon minimum turning radius | ~7-10 m |
| Comfortable standard-wagon road grade | ~8-10% |
| Challenging loaded wagon grade | ~12-15% depending on team/surface |
| Extreme/no-go loaded grade | profile-specific, generally above ~18-20% |

## 49.3 Load Bands

Rather than kilograms:

- Empty: 0-10% movement capacity;
- Light: 10-35%;
- Moderate: 35-65%;
- Heavy: 65-85%;
- NearLimit: 85-100%;
- OverLimit: >100%.

Item/container systems determine how cargo maps into these bands.

# 50. Godot/Summer Engine Implementation Direction

## 50.1 Recommended Runtime Services

```text
UnpoweredVehicleController
VehicleCollisionResolver
WheelRunnerContactResolver
VehicleSteeringSolver
DraftTeamResolver
HitchConstraintService
VehicleLoadAdapter
TransportRouteAdapter
ConvoyMovementController
TransportReservationService
TransportLODService
TransportNetworkAdapter
TransportDebugService
```

## 50.2 Local Physics Direction

Prefer a deterministic vehicle controller over unconstrained rigid-body simulation.

Recommended:

- authoritative chassis transform/velocity;
- sampled wheel/runner contacts;
- constrained hitch geometry;
- profile-driven steering;
- swept body/envelope collision;
- bounded rollover state;
- presentation wheels/suspension derived from contacts.

Rigid-body components may be used internally if they remain stable, deterministic enough and subordinate to project-owned authority.

## 50.3 Hitch Solver

The hitch constraint should preserve:

- maximum/minimum connection distance;
- articulation angle;
- towing direction;
- team/vehicle alignment.

It should not simulate every leather trace as a physics rope.

## 50.4 Debug Views

Expose developer overlays for:

- vehicle footprint/swept turn;
- wheel/runner contacts;
- route width/grade;
- hitch forces/capacity bands;
- load band;
- tractive demand vs capacity;
- bridge/gate compatibility;
- convoy spacing;
- LOD route progress.

# 51. Prototype Laboratories and Acceptance Tests

## 51.1 Handcart Lab

Test:

- empty/light/heavy;
- narrow path;
- ramp;
- mud;
- reverse;
- one-block obstruction;
- loading marker.

Verify movement remains responsive but constrained.

## 51.2 Cart/Wagon Turning Lab

Construct:

- straight road;
- 90-degree village corner;
- narrow gate;
- wide gate;
- switchback;
- courtyard.

Verify swept-envelope truth.

## 51.3 Grade Lab

Use standard wagon at:

- 5%;
- 10%;
- 15%;
- 20%;

with different load/team snapshots.

Verify demand/capacity gates and downhill braking.

## 51.4 Surface Lab

Compare:

- paved;
- dirt;
- grass;
- mud;
- sand;
- deep snow;
- ice.

Verify wagon versus sled identity.

## 51.5 Hitch Lab

Test:

- single;
- pair;
- tandem;
- invalid harness;
- wrong-size animal;
- blocked hitch volume;
- emergency detach.

## 51.6 Bridge/Gate Lab

Test multiple vehicle widths and turning approaches.

A valid centreline alone must not permit clipped rear corners.

## 51.7 Cargo Lab

Load:

- internal slots;
- attached crates;
- oversized cargo;
- passengers;
- over-limit load.

Verify movement load band and capacity.

## 51.8 Stuck/Rollover Lab

Test:

- deep mud;
- ditch;
- side slope;
- sharp turn;
- collision;
- recovery through unloading/additional team.

## 51.9 Warehouse Lab

Align wagon to loading bay.

Verify:

- capacity exposed;
- transaction owner moves cargo;
- no duplication;
- departure only sees committed cargo.

## 51.10 Convoy Lab

Use 3-8 mixed members.

Verify:

- spacing;
- braking propagation;
- narrow bridge queue;
- blocked member;
- regroup;
- route split policy input;
- no teleport catch-up.

## 51.11 Distant Caravan Lab

Demote convoy to route record, advance time, alter route/bridge state, promote.

Verify:

- goods conserved;
- expected arrival updates;
- invalid route stops/delays;
- vehicle/animal identity reconstructs.

## 51.12 Multiplayer Lab

Two players:

- drive/passenger;
- hitch animal;
- load wagon;
- pass through narrow gate;
- collide;
- hand off driver control.

Server remains authoritative.

# 52. Handoff to 30G, 30H, 30I and 30J

## 52.1 30G - Powered and Guided Transport

30G receives:

- vehicle body/condition/cargo vocabulary;
- passenger/seat conventions;
- route/clearance interfaces;
- vehicle runtime separation;
- loading markers;
- reservation patterns.

30G adds:

- powered propulsion;
- rail/guided movement;
- minecarts;
- elevators/lifts;
- advanced powered land vehicles.

## 52.2 30H - Roads, Routes and Long-Distance Travel

30H receives:

- mover footprint;
- turning requirement;
- grade limit;
- surface compatibility;
- bridge/gate class;
- load/draft modifiers;
- convoy width/length;
- local travel-cost results.

30H owns route planning and long-distance route selection.

## 52.3 30I - NPC and Multiplayer Integration

30I receives:

- driver control interface;
- convoy transition/reservation needs;
- vehicle navigation constraints;
- stuck/recovery hooks;
- promotion/demotion contracts.

## 52.4 30J - Final Registry Integration

30J freezes:

- vehicle families;
- movement profiles;
- hitch profiles;
- draft interfaces;
- cargo/load facets;
- convoy schemas;
- reason codes;
- validators.

# 53. Main-Document Integration Register

| Existing Document | Required Integration |
| --- | --- |
| 02 | Trade/exploration progression may unlock transport capability; no duplicate vehicle physics. |
| 03 | Road/gate/bridge/block definitions expose Set 30 movement facets. |
| 04 | Add approved vehicle, harness, wheel, container and transport item families/facets. |
| 05 | Add approved vehicle/harness/repair recipes without movement logic. |
| 06 | Material families feed vehicle construction/repair identity. |
| 07 | NPC jobs supply driver/hauler intents; Set 30 executes movement. |
| 08 | Logistics dispatch consumes Set 30 capacity/travel outputs and preserves transactions. |
| 11 | Terrain/environment supplies road/off-road surface state. |
| 12/19/20D | Structure/settlement routes validate vehicle footprint, turn, gate, bridge and loading markers. |
| 15 | Escort/transport objectives consume physical caravan state. |
| 16 | Combat consumes vehicle velocity/state and supplies damage/forced movement outcomes. |
| 17 | UI exposes cargo, route, hitch, condition and blocker information. |
| 20G | Culture packs may define wagon/caravan variants and settlement route preferences. |
| 25 | Registry/capability/migration governance applies to transport records. |
| 27C/E/H | Economy/contract/caravan mission systems consume Set 30 movement facts. |
| 30A/E | Parent movement/mount/towing architecture remains binding. |

# 54. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward; not directly modified by 30F.

Ordinary carts/wagons are terrestrial. Amphibious/water transport requires explicit future integration and may not silently use Set 26 vessel rules.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Carried forward and applied to human-powered transport.

30F may send:

```text
movement_action_family = transport.push_pull
intensity_band
is_sustained = true
elapsed_duration
terrain_resistance_band
grade_band
gross_load_band
assist_band
```

Set 29 returns the existing movement/exertion result. 30F does not calculate player/NPC biological stamina.

Draft-animal biological availability is consumed through the creature/30E draft snapshot and may later be reconciled with Set 29's final biological scope.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** Carried forward.

30F does not use Set 28 to define vehicle steering. Where companions/passengers are socially assigned to convoy roles, Set 28 supplies assignment/formation intent and 30F executes the physical arrangement.

## XSI-30-004 - Environmental Movement Field Contract

**Status:** Carried forward.

30F consumes wind/extraordinary force only where the environment field is strong enough to affect terrestrial transport. Surface mud/snow/ice state remains environment/world-owned.

## XSI-30-005 - Set 29 Fall Impact Consequence Contract

**Status:** Carried forward; only relevant if a passenger/driver is physically thrown/falls and 30D/Set 29 receives the impact.

## XSI-30-006 - Set 28 Ride Permission and Seat Assignment Contract

**Status:** Carried forward and extended to carriage/wagon seats.

Set 28 supplies social/permission assignment where applicable. 30F validates seat/vehicle clearance and attachment.

## XSI-30-007 - Aquatic Mount Riding Boundary

**Status:** Carried forward; no change.

## XSI-30-008 - Set 27 Terrestrial Caravan Movement Execution Contract

**Status:** New refinement for 27H final integration; no ownership transfer.

**Reason:** 27H owns caravan economics and route missions, while 30F/30H own physical terrestrial transport. A single execution contract prevents caravan economy from reimplementing vehicle movement.

### Set 27 / 27H -> Set 30

- caravan/transport mission ID;
- authorised vehicle and draft-entity references;
- cargo commitment/lot references;
- origin/destination;
- departure/arrival windows;
- route policy constraints;
- authorised stop/checkpoint policy;
- escort/risk handling policy references;
- cancellation/abort state.

### Set 30 -> Set 27 / 27H

- movement plan/reference;
- `CargoCapacity()` and used capacity;
- `RouteAccessibility()`;
- `TravelTime()` estimate and actual;
- departure/progress/arrival state;
- vehicle/draft readiness;
- route blocker/delay facts;
- physical cargo incident/delivery-readiness facts;
- movement confidence/reason codes.

### Constraint

Set 30 does not calculate freight rates, route profit, market demand, wages, insurance, tax or economic loss. Set 27 does not move vehicles, grant impossible capacity or create physical destination stock before a validated delivery transaction.

This amendment aligns with existing 27C expected-arrival and 27E terrestrial-delivery interfaces rather than replacing them.

# 55. Open Decisions and Deferred Questions

1. Final first implementation family: handcart, light cart or standard wagon.
2. Exact number of transport item/vehicle families admitted to Core Production.
3. Whether wheelbarrows and two-wheel handcarts remain separate gameplay families.
4. Whether travois are common early-game tools or culture/biome-specific.
5. Whether sleds are Core because snow/season travel needs them, or later content.
6. Final load-band derivation from slot inventory and bulk tags.
7. Whether cargo distribution/centre-of-load materially affects ordinary wagons or only special oversized loads.
8. Final draft-team capacity combination curve.
9. Whether single-player hitching uses a brief animation/time or near-instant validated interaction.
10. Whether animals can be switched between ridden and draft roles without changing tack at low tier.
11. Final requirement for reins/driver equipment.
12. Whether carts can be pulled backward by the player/animal or only pushed/reversed through steering.
13. Final hill-hold/brake defaults for accessibility.
14. Whether downhill runaway can occur on normal difficulty or only after brake failure/extreme overload.
15. Final rollover frequency/severity; avoid physics-comedy behaviour.
16. Whether vehicles leave persistent ruts/mud deformation under harsh world settings.
17. Whether cargo spills physically into world item batches on rollover or remains secured unless damage system authorises spill.
18. Whether carriages have meaningful comfort state for Set 29/social systems; if so those systems own consequences.
19. Whether passenger caravans and freight caravans use one common convoy controller.
20. Final vehicle passing rules on narrow roads.
21. Whether NPC traffic can dynamically reserve one-lane bridges/gates at scale without congestion problems.
22. Whether caravan camps require dedicated Blueprint/structure markers or generic parking areas.
23. Final distant-caravan incident cadence and probability ownership between 27H/events/Set 30.
24. Whether Set 30 reports route-incident *risk* or only current movement feasibility; recommendation is current feasibility plus physical risk factors, with 27H owning economic risk interpretation.
25. Final local-to-far promotion spacing along roads.
26. Final client-prediction model for player-driven wagons.
27. Whether player-built custom vehicle bodies are ever supported through Forge; likely later specialist authoring.
28. Final component-damage/repair adapter with Items/Combat.
29. Approval/finalisation of XSI-30-006 for carriage/wagon passengers.
30. Approval/finalisation of XSI-30-008.
31. Final XSI-30-002/XSI-30-004 interfaces after Sets 29/environment reconciliation.

# Appendix A. Transport State Transition Matrix

| From | Trigger | To | Validation | Failure |
| --- | --- | --- | --- | --- |
| Parked/Unhitched | hitch request | Hitching | team/harness/clearance/permission | remain parked |
| Hitching | commit | HitchedIdle | reservation valid | abort |
| HitchedIdle | movement intent | Moving | route/draft/load/condition | remain stopped; reason |
| Moving | brake/stop | Stopping | braking support | slower/unsafe downhill |
| Stopping | speed zero | HitchedIdle/Parked | support valid | rollback/stuck |
| Moving | route blocked | Blocked | blocker authoritative | stop/reroute request |
| Moving | insufficient tractive capacity | Stalled | demand > capacity | unload/add team |
| Moving | terrain trap | Stuck | wheel/runner progress fails | recovery required |
| Moving | unstable threshold | Tipping | stability state | slow/stop/recover |
| Tipping | rollover complete | Overturned | bounded motion | external damage hooks |
| Any | component immobilised | Immobilised | condition state | repair/tow |
| HitchedIdle | unhitch | Unhitching | stationary/clear | remain hitched |
| ConvoyMoving | member blocked | ConvoyWait/Split | caller policy | continue valid members if authorised |
| FarJourney | promoted | LocalConvoy | route reconstruction | stop at valid route node |

# Appendix B. Unpowered Vehicle Movement Profile Template

```text
vehicle_movement_profile_id
vehicle_family
body_profile_ref
wheel_runner_profile_ref
hitch_profile_ref

body_width
body_length
body_height
clearance_height
turning_swept_envelope
minimum_turn_radius
reverse_supported
reverse_speed_multiplier

preferred_route_classes[]
offroad_class
surface_response_profile

preferred_grade
max_loaded_grade
max_empty_grade
side_slope_limits
breakover_profile

braking_profile
parking_profile

load_band_multipliers{}
draft_demand_profile
condition_movement_profile

gate_classes[]
bridge_classes[]

prediction_class
lod_profile_id
version
```

# Appendix C. Draft Team and Hitch Template

```text
draft_team_runtime_id
vehicle_instance_id
hitch_definition_id

team_slot_definitions[]
assigned_entity_ids[]
assigned_harness_refs[]

team_arrangement
available_tractive_band
max_safe_speed_band
grade_modifier
team_efficiency_band

hitch_state
articulation_state
hard_restrictions[]
reason_codes[]
source_revisions{}
```

# Appendix D. Cargo/Load Movement Snapshot Template

```text
vehicle_instance_id
snapshot_id
tick

cargo_capacity_slots
cargo_slots_used
container_socket_capacity
container_sockets_used
passenger_capacity
passenger_count

bulk_load_class
gross_load_band
load_distribution_band
oversized_load_refs[]
load_security_state

hard_overload
movement_load_modifier
turning_modifier
braking_modifier
grade_modifier

inventory_state_revision
reason_codes[]
```

# Appendix E. Convoy Movement Plan Template

```text
convoy_movement_plan_id
caller_owner_type
caller_mission_ref

leader_ref
ordered_member_refs[]
vehicle_refs[]
mount_refs[]
pedestrian_refs[]

route_plan_ref
current_route_leg
target_speed_policy
spacing_profile
passing_policy
regroup_policy
stop_checkpoint_refs[]
single_lane_reservation_policy

departure_window
arrival_window
abort/cancel_state

revision
```

# Appendix F. Caravan Movement Result Template

```text
caravan_mission_ref
movement_plan_ref
tick

route_accessibility
capacity_total
capacity_used

estimated_travel_time
actual_departure
journey_progress
current_route_leg
current_location_ref

delay_state
blocker_reason_codes[]
separated_member_refs[]
immobilised_vehicle_refs[]
physical_cargo_incidents[]

arrival_state
arrival_time?
delivery_readiness
movement_confidence

revision
```

# Appendix G. Vehicle Runtime Record

```text
vehicle_instance_id
vehicle_definition_id
movement_profile_id

position
rotation
velocity
steering_state
brake_state
parking_state

condition_state
component_state_refs[]

cargo_snapshot_id
seat_occupants{}
driver_ref?

hitch_state
draft_team_runtime_id?

route_ref?
convoy_plan_ref?
movement_state

stuck_state?
rollover_state?
last_valid_route_position

lod_state
authoritative_tick
prediction_sequence
```

# Appendix H. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| transport.route.too_narrow | Swept envelope cannot clear route. | Set 30 |
| transport.route.turn_blocked | Vehicle cannot complete turn. | Set 30 |
| transport.route.grade | Grade exceeds current capability. | Set 30 |
| transport.route.surface | Surface incompatible/too resistant. | Set 30 + environment input |
| transport.bridge.incompatible | Bridge movement class/width invalid. | Structure + Set 30 |
| transport.gate.incompatible | Gate/approach clearance invalid. | Structure + Set 30 |
| transport.load.overlimit | Cargo snapshot exceeds movement limit. | Inventory snapshot + Set 30 |
| transport.draft.insufficient | Current tractive capacity below demand. | Creature snapshot + Set 30 |
| transport.draft.unavailable | Assigned draft entity cannot currently work. | Creature/Set 29 owner |
| transport.hitch.invalid | Hitch/harness geometry or compatibility invalid. | Set 30 |
| transport.driver.missing | No authorised driver/control source. | External assignment + Set 30 |
| transport.condition.degraded | Vehicle condition reduces movement. | Set 30 response to component state |
| transport.condition.immobilised | Vehicle cannot move. | Set 30 |
| transport.stuck | Vehicle has insufficient progress due to terrain/geometry. | Set 30 |
| transport.rollover | Vehicle entered overturned state. | Set 30 |
| transport.loading.position_invalid | Vehicle not aligned to transfer point. | Set 30 |
| transport.loading.bay_reserved | Another mover holds the bay. | Set 30 reservation |
| convoy.wait.member | Convoy waiting for member. | Set 30 |
| convoy.route.blocked | Shared route cannot continue. | Set 30/30H |
| caravan.mission.cancelled | Economic/quest caller cancelled movement. | External owner |
| transport.recovery.safe_route | Invalid saved/local state recovered to valid route position. | Set 30 |

# Appendix I. Multiplayer Transport Contract

## Client -> Authority

```text
player_id
input_sequence
client_tick

vehicle_instance_id
control_request
steering_input
drive_input
brake_input
reverse_input

hitch_request?
unhitch_request?
seat_request?
parking_request?

local_route_revision
local_vehicle_condition_revision
local_cargo_snapshot_revision
predicted_state_hash
```

## Authority -> Client

```text
server_tick
ack_input_sequence

vehicle_instance_id
position
rotation
velocity
steering_state
movement_state

condition_state
cargo_snapshot_id
hitch_state
draft_team_runtime_id?
driver_ref
seat_occupants{}

route_accessibility
stuck_state?
rollover_state?
reason_codes[]
```

# Appendix J. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Handcart | Physical additional footprint/load matters; operator remains responsive; Set 29 owns exertion. |
| Draft Team | Team capacity comes from external availability; 30F does not simulate hunger/fatigue. |
| Hitch | Compatible geometry/team required; no visual-only attachment. |
| Load | Cargo capacity/state affects movement without replacing slot inventory. |
| Turning | Full swept envelope blocks impossible gate/corner turns. |
| Roads | Cart/heavy-freight classes provide real movement benefit. |
| Slope | Loaded vehicle/team may fail a grade that empty/stronger team can climb. |
| Surface | Wagon/sled respond differently to mud/snow/ice/road. |
| Braking | Downhill braking and stopping distance are movement facts. |
| Condition | Damaged wheel/axle/hitch changes movement through condition interface. |
| Stuck/Rollover | Failure states are deterministic/readable and offer recovery paths. |
| Warehouse | Loading uses real positioning and authoritative transactions. |
| Convoy | Members maintain spacing/order without teleport catch-up; blockers propagate. |
| Economy Boundary | 27H supplies mission/economics; 30F supplies capacity/access/time/progress only. |
| Quest Boundary | Escort/transport objectives consume physical state rather than bypassing it. |
| Combat Boundary | Damage/attacks remain Combat-owned; 30F owns vehicle motion response. |
| LOD | Distant journeys conserve exact cargo and reconstruct valid local convoy state. |
| Multiplayer | Server controls vehicle/hitch/cargo movement state; clients cannot spoof capacity/speed. |
| 30E Regression | Draft use does not redefine ridden-mount controls; towing harness handoff remains clean. |
| 20D Regression | Existing cart-road/heavy-freight route semantics remain authoritative infrastructure inputs. |

# END OF DOCUMENT 30F
