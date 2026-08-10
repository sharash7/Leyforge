# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30G - Rails, Minecarts, Elevators and Powered Land Transportation

Version 0.1 - Detailed Guided Transport, Lift and Powered Vehicle Movement Design Draft

A production-oriented specification for constrained and powered terrestrial transport in Leyforge, covering minecart rail, freight rail, passenger rail, rail junctions, couplings, trains, funiculars, cable haulage, elevators, hoists, moving platforms, magical guideways, self-propelled land vehicles, power/fuel readiness interfaces, stations, loading and passenger movement, collision safety, route reservations, simulation LOD, multiplayer authority, persistence and Godot/Summer Engine implementation.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Guided and Powered Transport Statement**
>
> Guided and powered transport is civilisation infrastructure with a physical movement layer. A minecart does not move because a rail texture exists, an elevator does not function because a shaft has a decorative platform, and a powered hauler does not gain infinite range because a battery icon is visible. Infrastructure, power, control, vehicle condition, route state, loading capacity and physical clearance must all agree. Set 30 owns movement along the valid guide or through the valid terrain; Automation, Magic, Items, Structures, Economy and social systems retain ownership of the resources, control policies, construction, costs and assignments that make that movement possible.

# Document Purpose

Document 30G defines the final specialist vehicle class before Set 30 moves into route planning and global navigation. Documents 30E and 30F established living mounts, draft animals, handcarts, carts, wagons, carriages and physical caravans. 30G adds transport whose movement is constrained by built guidance infrastructure or driven by non-animal power: minecarts, freight/passenger rail, cable haulage, funiculars, elevators, hoists, moving platforms, magical guideways and self-propelled powered land vehicles.

The document follows the architecture already locked in 30A: guided movement uses a declared guide rather than unrestricted steering, while lifts are simultaneously infrastructure and moving platforms. Structure and automation systems provide track, shaft, stops, power, control availability, ownership and damage state. Set 30 owns the vehicle/platform motion, passenger/cargo frame transfer, guide-following, collision safety, speed/braking envelope and travel-time result.

This separation is especially important because Document 08 already owns automation gameplay, transport-network definitions, power allocation, machine/control behaviour and resource-conserving transactions. Document 20D owns public route infrastructure and loading interfaces. Document 20E owns settlement-scale automation, power and logistics facilities. 30G consumes those systems rather than duplicating them.

The design also preserves Leyforge's progression ladder. Minecarts and durable industrial transport enter around iron settlement automation; steam and high-volume freight expand during steel/industrial progression; mana and magitech can later add specialist guideways and powered vehicles. Earlier carts, wagons, roads and manual movement remain useful because rail requires fixed infrastructure and powered vehicles require real energy, maintenance and suitable routes.

# Governing Source and Dependency Register

| Source | Existing Direction Relevant to 30G | 30G Treatment |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Set 30 owns vehicles, rails, elevators, pathfinding interfaces and vehicle physics; Set 27 owns prices/trade; Set 28 owns social/passenger assignment; Set 29 owns biological state. | Binding ownership contract. |
| 00 - Master Game Design Bible | Automation, settlement growth, exploration and fantasy technology remain connected to a physical voxel world. | Powered/guided transport expands civilisation without becoming free teleportation. |
| 01 - Core Gameplay Loop | Automation and expansion should reduce grind and create visible world capability. | Rail/lifts/powered transport scale freight and access after earlier movement tiers. |
| 02 - Player Progression | Automation, exploration, settlement and magic progression can unlock transport capability. | 30G consumes unlocks; it does not own skill/perk progression. |
| 03 - Blocks Registry | Automation transport includes cart rail; power includes engines; rails, gates, hazards and voxel collision are physical. | Track/guide pieces and route geometry are authoritative infrastructure inputs. |
| 04 - Items Registry | Machine parts, fuel, batteries, tools, containers and equipment are item-owned. | 30G consumes vehicle-energy and component facets without defining items/costs. |
| 05 - Crafting and Recipe Registry | Minecarts, engines, rails, control parts and repair components require real recipes. | 30G does not define recipes. |
| 06 - Resource Progression | Iron supports durable transport; steel/steam supports high-volume industry; mana/magitech supports advanced infrastructure. | Used as progression context, not movement authority. |
| 07 - NPC Village System | Operators, drivers, miners, engineers, haulers and passengers remain persistent NPC roles. | NPC assignment/intent remains external. |
| 08 - Automation System v0.2 | Automation owns runtime factory behaviour, transport definitions, power allocation, control/logic, minecart freight and resource-conserving transactions. | 30G consumes power/control/dispatch readiness and owns physical motion of transport bodies. |
| 09 - Magic System | Mana, runes, leyline power and magitech effects remain Magic-owned. | Magical guideways/power providers expose movement-ready state; 30G executes motion. |
| 11 - Biomes and World Generation | Terrain, tunnels, slopes, roads and hazards constrain route construction and movement. | 30G consumes track/road/environment geometry and state. |
| 12 / 19 / 20 | Structures/Blueprint Forge create persistent structures, shafts, stations, stops, routes and semantic markers. | Infrastructure creation remains outside Set 30; 30G validates movement compatibility. |
| 16 - Combat, Gear and Defence | Infrastructure may be damaged/sabotaged; collisions/vehicle incidents may interact with combat. | Combat owns damage; 30G owns movement consequence. |
| 17 - UI/UX | Machine panels, vehicle state, controls, accessibility and truthful reason feedback are established. | 30G exposes movement state/reasons; 17 owns presentation/settings UI. |
| 20B v0.2 | Deep mines explicitly depend on lifts, rails, loading, maintenance and throughput. | Primary mine/lift gameplay integration source. |
| 20D | Rail/guided route is an infrastructure route class; stations/corridors and loading are public-logistics concerns. | 30G consumes route/station definitions and owns guided movement. |
| 20E | Conveyor/cart logistics hubs and power plants connect roads, carts, rails, power/control and freight interfaces. | 30G consumes operational/power/control readiness. |
| 20F | Regional transit nexus may include rail terminals and vertical transit. | 30G supplies movement contracts to multimodal hubs. |
| 25 | Stable IDs, capabilities, registry validation, migrations and source-of-truth governance. | All transport definitions and runtime records follow Set 25 architecture. |
| 27 / 27H | Economy owns freight/passenger prices, contracts, trade profitability and regional economic use of transport. | 30G exposes capacity/access/time/arrival facts only. |
| 30A | Guided movement families and lift/elevator boundary are already locked. | Binding parent architecture. |
| 30F | Unpowered vehicles established shared vehicle/cargo/seat/condition/LOD vocabulary. | Reused where appropriate; 30G adds power and guide systems. |
| 30H | Future owner for roads/routes/terrain accessibility and long-distance travel planning. | 30G exposes track/vehicle segment accessibility and travel costs. |
| 30I | Future owner for NPC navigation/formations/multiplayer integration. | 30G exposes reservation/driver/operator interfaces. |

# Governing Ownership Contract

Document 30G owns detailed movement for:

- minecarts;
- minecart consists and coupled cart groups;
- freight rail vehicles/trains;
- passenger rail vehicles/trains;
- rail-guided industrial carriers;
- funicular and incline-rail vehicles;
- cable-hauled carts/platforms;
- elevators and lifts;
- freight hoists;
- moving platforms on authored routes;
- magical guideway vehicles;
- self-propelled powered land vehicles that steer freely over terrain/roads;
- powered vehicle propulsion response once power/fuel availability is authorised;
- track following, junction traversal, braking, coupling and route occupancy;
- moving-frame passenger/cargo attachment and safe entry/exit;
- guided/powered vehicle collision safety;
- vehicle movement-condition effects;
- near/far movement simulation and persistence.

Document 30G does **not** own:

- power generation, fuel production or mana generation;
- energy allocation priority or grid control;
- automated dispatch/scheduling policy;
- signal-program logic or factory routing policy;
- item/cargo transactions;
- construction recipes or rail/shaft building projects;
- ticket prices, fares, freight rates, taxes, wages or profitability;
- NPC employment, passenger willingness or social assignment;
- injury/health consequences;
- combat damage;
- freeform vessel movement;
- portals/teleportation;
- flying mounts or player gliders;
- general regional route planning.

# Static Table of Contents

1. Locked Guided and Powered Transport Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Design Principles  
4. System Architecture and Record Separation  
5. Canonical Terminology  
6. Transport Family Taxonomy  
7. Guided Route Graph and Movement Contract  
8. Track/Guide Segment Geometry and Continuity  
9. Junctions, Switches and Route Selection  
10. Route Occupancy, Reservations and Safe Separation  
11. Speed Profiles, Acceleration and Braking  
12. Gradient, Curvature and Clearance  
13. Minecart Core Movement  
14. Manual and Gravity Minecarts  
15. Powered Minecart Haulage  
16. Minecart Loading, Unloading and Buffers  
17. Couplings, Consists and Train Formation  
18. Freight Rail  
19. Passenger Rail  
20. Stations, Platforms and Dwell State  
21. Freight Depots, Loaders and Transfer Interfaces  
22. Rail Signals and Automation-Control Boundary  
23. Funiculars, Incline Rail and Cable Haulage  
24. Elevator/Lift Architecture  
25. Elevator Shaft, Stop and Door Interlocks  
26. Elevator Platform Movement and Passenger Frame Transfer  
27. Freight Hoists and Industrial Lifts  
28. Moving Platforms and Constrained Industrial Carriers  
29. Magical Guideways  
30. Powered Free-Steering Land Vehicles  
31. Powered Vehicle Propulsion Profiles  
32. Fuel, Power and Mana Readiness Interface  
33. Powered Vehicle Road/Terrain Handling  
34. Powered Vehicle Cargo and Passenger Integration  
35. Vehicle Condition, Failure and Degraded Movement  
36. Collision, Derailment, Overspeed and Emergency Stop  
37. Track/Guide Damage, Blockage and Recovery  
38. Maintenance and Repair Boundary  
39. Automation, Logistics and Warehouse Integration  
40. Economy and Contract Integration  
41. NPC Operators, Drivers and Passenger Assignment Boundary  
42. Combat, Sabotage and Emergency Integration  
43. First-Person and Third-Person Interaction  
44. UI, Inspection, Route State and Reason Codes  
45. Accessibility and Assisted Transport Controls  
46. Multiplayer Authority, Prediction and Reservation  
47. Persistence, Save/Load and Recovery  
48. Simulation LOD and Distant Guided Transport  
49. Registry and Data Definitions  
50. Balance-Draft Baseline Values  
51. Godot/Summer Engine Implementation Direction  
52. Prototype Laboratories and Acceptance Tests  
53. Handoff to 30H, 30I and 30J  
54. Main-Document Integration Register  
55. Cross-Set Interface Amendments  
56. Open Decisions and Deferred Questions  
Appendix A. Guided Transport State Transition Matrix  
Appendix B. Guided Route Definition Template  
Appendix C. Rail Vehicle Movement Profile Template  
Appendix D. Lift/Elevator Definition Template  
Appendix E. Powered Vehicle Drive Profile Template  
Appendix F. Transport Power Readiness Snapshot  
Appendix G. Train/Consist Runtime Record  
Appendix H. Reason-Code Catalogue  
Appendix I. Multiplayer Guided Transport Contract  
Appendix J. Acceptance and Regression Matrix

# 1. Locked Guided and Powered Transport Identity

Guided transport trades route flexibility for capacity, reliability and automation. Powered transport trades animal/human propulsion for real energy infrastructure. Both should create visible civilisation progression.

> **Locked Rule**
>
> A guided vehicle may move only on a currently continuous, compatible and authorised guide. A powered vehicle may accelerate only when its owning energy/power system reports movement-ready energy. Set 30 can limit or stop movement because of geometry, condition or safety; it cannot invent power, fuel, mana, cargo, ownership or economic purpose.

## 1.1 Player-Facing Promise

Players should be able to understand:

- whether rail segments are connected;
- which way a switch is set;
- whether a block/section is occupied;
- whether a minecart is manual, gravity-fed or powered;
- whether a powered vehicle has movement-ready energy;
- whether an elevator is available and which stops are reachable;
- why an elevator door will not close;
- why a train is waiting;
- whether track damage has closed a route;
- whether a vehicle is too large for a curve/tunnel/platform;
- whether a freight loader actually transferred cargo;
- whether a transport service is stopped because of movement, power, control, ownership or cargo reasons.

## 1.2 Infrastructure Value

Guided/powered transport should reward:

- mines with stable shafts and haulage routes;
- industrial settlements with power;
- regional logistics hubs;
- reliable maintenance;
- protected route corridors;
- stations/loading depots;
- planned vertical circulation;
- city-scale transit investment.

It should not erase:

- hand hauling;
- carts/wagons;
- roads;
- pack animals;
- caravans;
- ladders/stairs;
- portals;
- vessels;
- flying transport.

# 2. Scope, Ownership and Explicit Non-Goals

## 2.1 30G Owns

- guide-constrained vehicle motion;
- track/shaft/path compatibility checks;
- guided route following;
- speed/acceleration/braking along guides;
- train/cart coupling motion;
- occupancy and minimum safe separation;
- physical reaction to switch/signal/stop state;
- elevator platform motion and interlocks relevant to movement;
- moving-frame transfer of occupants;
- powered vehicle locomotion response to authorised energy;
- movement impact of vehicle condition;
- local transport collision safety;
- movement-facing simulation LOD.

## 2.2 Explicit Non-Goals

30G is not:

- a railway company/economy simulator;
- a signal-programming automation document;
- a power-grid simulation;
- a fuel-production system;
- a locomotive crafting catalogue;
- a realistic rail-wheel contact engineering simulator;
- a public-transport timetable economy;
- a universal traffic simulator;
- a portal/teleporter system;
- a replacement for 30F road freight.

# 3. Design Principles

## 3.1 Fixed Infrastructure Must Matter

Rail should outperform wagons in sustained high-volume corridors only after the player/civilisation invests in:

- track;
- grades/curves;
- bridges/tunnels;
- stations/loaders;
- power/traction where required;
- maintenance;
- route protection.

## 3.2 Movement Truth and Control Policy Are Separate

Automation may decide that Cart A should go to Loader B.

30G decides whether:

- the track is connected;
- the route is reserved;
- the switch permits passage;
- the cart can fit;
- braking distance is safe;
- the vehicle physically arrives.

## 3.3 Failure Should Stop Safely Before Catastrophe

Normal automation should prefer:

- stop;
- wait;
- reserve;
- reroute;
- hold doors;
- shut traction power;
- apply brake;

before derailment, crushing or catastrophic lift failure.

Severe failures require damage, sabotage, ignored warnings, unsafe design or harsh settings.

## 3.4 Manual and Automated Use Share One Movement Model

A player-pushed minecart, an NPC-driven train and an automation-dispatched freight cart use the same track truth and vehicle movement definitions.

# 4. System Architecture and Record Separation

```text
Transport Caller / Driver / Automation Intent
                 |
                 v
       Guide / Vehicle Resolver
       /         |          \
      v          v           v
Guide State   Vehicle State  Power/Control Readiness
      \          |           /
       +---------+----------+
                 |
                 v
        Movement Reservation
                 |
                 v
       Guided / Powered Solver
                 |
      Collision + Speed Safety
                 |
                 v
      Authoritative Vehicle State
       /          |             \
      v           v              v
Movement API   Passengers/Cargo   Automation/Economy Facts
```

## 4.1 Immutable Definitions Versus Runtime State

| Record | Role |
| --- | --- |
| GuidedRouteDefinition | Segment/junction/guide rules. |
| GuidedRouteInstance | Persistent built guide network state. |
| VehicleDefinition | Identity/capabilities of transport body. |
| VehicleMovementProfile | Speed, clearance, guide compatibility and handling. |
| PowerReadinessSnapshot | External authoritative energy/control state. |
| ConsistDefinition/Runtime | Ordered coupled vehicle group. |
| LiftDefinition/Runtime | Shaft/stops/platform movement state. |
| TransportReservation | Temporary occupancy/safe-route claim. |
| GuidedMovementRuntime | Current position along route/path plus speed/state. |

# 5. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Guide | Infrastructure constraining vehicle/platform motion to a declared path. |
| Track Segment | Connected rail/guide element with direction, curve, grade and clearance. |
| Junction | Point where one guide may connect to multiple exits. |
| Switch | Junction state choosing currently active physical alignment. |
| Route Block | Reservation/occupancy unit used for safe separation. |
| Consist | Ordered coupled group of rail vehicles/carts. |
| Lead Vehicle | Vehicle providing primary control/traction request for a consist. |
| Traction | Authorised propulsion applied along a guide or to a powered vehicle. |
| Coasting | Motion without active positive traction. |
| Dynamic/Service Brake | Normal controlled deceleration system. |
| Emergency Brake | High-priority movement stop request with stronger deceleration/risk. |
| Station | Stop area with platform/loading/access semantics. |
| Dwell | Time/state while a transport remains stopped for loading/passengers/control. |
| Shaft | Constrained vertical/angled path for a lift/hoist. |
| Landing/Stop | Valid elevator/lift access level. |
| Interlock | Movement safety condition such as doors closed before motion. |
| Powered Vehicle | Self-propelled land vehicle using external energy/fuel rather than animal/human traction. |
| Power Readiness | External authoritative answer that propulsion energy/control is available now. |
| Derailment | Guided vehicle no longer validly constrained to its guide. |

# 6. Transport Family Taxonomy

## 6.1 Guided Families

| Family | Typical Role | Propulsion |
| --- | --- | --- |
| Manual Minecart | Mine/local freight | human push/gravity |
| Gravity Minecart | Downhill ore transfer | gravity/brake |
| Powered Minecart | Mine/industrial freight | mechanical/electric-like/mana |
| Freight Train | High-volume regional/industrial freight | locomotive/traction unit |
| Passenger Train/Tram | Settlement/regional passengers | powered traction |
| Funicular | Steep slope passenger/freight | cable/counterweight/power |
| Incline Freight Rail | Quarry/mine steep haul | cable/power |
| Elevator/Lift | Vertical passenger/freight | powered/counterweighted |
| Hoist Platform | Industrial shaft freight | powered winch |
| Moving Platform | Fixed-route access/industrial movement | structure/automation/magic |
| Magical Guideway | Advanced guided transport | mana/leyline/magitech |

## 6.2 Free-Steering Powered Families

Potential families include:

- powered industrial hauler;
- steam/engine tractor;
- self-propelled freight cart;
- magitech utility cart;
- powered construction carrier;
- culture-specific land engine.

These remain optional content families. The architecture supports them without declaring modern automobiles as a core aesthetic requirement.

# 7. Guided Route Graph and Movement Contract

A guided route exposes:

- route/network ID;
- connected segment IDs;
- segment directionality;
- switch/junction state;
- vehicle class support;
- clearance envelope;
- curve/grade limits;
- route-block/reservation partition;
- station/stop anchors;
- power/control interface refs;
- damage/closure state;
- ownership/permission refs;
- revision.

30G uses this data to determine `RouteAccessibility()` for guided movers.

# 8. Track/Guide Segment Geometry and Continuity

## 8.1 Segment Requirements

Each segment includes:

- entry/exit connection transforms;
- centreline/path curve;
- guide orientation;
- gauge/class if used;
- curve radius;
- grade;
- clearance corridor;
- supported speeds/classes;
- neighbour references;
- support/damage state;
- route-block ID.

## 8.2 Continuity Validation

A route is invalid when:

- endpoints do not connect within tolerance;
- switch points disagree;
- track is missing/broken;
- grade/curve exceeds vehicle profile;
- clearance corridor intersects invalid geometry;
- structure support closes the segment;
- ownership/permission denies traversal.

## 8.3 Voxel Construction

Track visuals may follow voxel pieces, slopes, bridges and tunnels. The movement solver uses baked/validated guide data derived from those authoritative structures, not visual mesh edges alone.

# 9. Junctions, Switches and Route Selection

## 9.1 Switch State

Automation/structure/control owns **why** a switch is set.

30G owns the physical effect:

- which branch is currently connected;
- whether a vehicle may enter;
- whether a switch may change under a vehicle;
- transition geometry through the junction.

## 9.2 Switch Lock

A switch normally locks while:

- occupied;
- reserved for an approaching vehicle inside safety distance;
- mechanically damaged;
- manually locked.

Automation cannot change the visual switch and expect movement to take the new branch if the authoritative route state remains locked.

## 9.3 Manual Switching

Player/NPC interaction may request a switch state through the owning control system. 30G consumes the resulting state.

# 10. Route Occupancy, Reservations and Safe Separation

## 10.1 Route Blocks

Guided routes are partitioned into reservation/occupancy blocks suitable for scale.

A vehicle/consist reserves enough route to cover:

- current occupied length;
- braking distance;
- junction protection;
- safety margin.

## 10.2 Collision Safety

Normal operation must prevent two authorised trains from receiving conflicting reservations.

This is movement safety, not economic scheduling.

## 10.3 Congestion

If a block cannot be reserved:

- vehicle stops/waits;
- automation receives blockage reason;
- passenger/economy systems receive delay facts;
- no teleport-through or overlap occurs.

# 11. Speed Profiles, Acceleration and Braking

Each guided vehicle declares:

- maximum design speed;
- acceleration profile;
- service brake profile;
- emergency brake profile;
- curve-speed sensitivity;
- grade sensitivity;
- load modifiers;
- power-readiness modifiers;
- degraded-condition caps.

## 11.1 Speed Limit Sources

Effective speed is the minimum of:

- vehicle limit;
- current guide segment limit;
- consist limit;
- curve/grade limit;
- condition limit;
- power/control limit;
- movement safety/reservation requirement;
- external restriction.

# 12. Gradient, Curvature and Clearance

## 12.1 Rail Grade

Rail generally demands shallower grades than roads.

Steep routes should use:

- switchbacks;
- funiculars;
- cable haulage;
- lift/hoist;
- specialist magitech.

## 12.2 Curve Radius

Long consists require larger curves.

A vehicle may fit a straight tunnel but fail a tight curve due to:

- body overhang;
- coupling geometry;
- swept envelope.

## 12.3 Vertical Clearance

Clearance validates:

- vehicle body;
- cargo overheight;
- passenger-safe envelope;
- overhead power/guide structures where relevant;
- tunnel/bridge geometry.

# 13. Minecart Core Movement

Minecarts are Leyforge's first dedicated guided freight vehicle family.

## 13.1 Identity

Minecarts should be:

- compact;
- inspectable;
- easy to integrate into mines/workshops;
- useful manually before full power automation;
- later compatible with loaders, powered haulage and coupled consists.

## 13.2 Core States

- Parked;
- ManualPush;
- GravityRoll;
- Powered;
- Coasting;
- Braking;
- Loading;
- Unloading;
- WaitingReservation;
- Coupled;
- Blocked;
- Derail/Disabled.

# 14. Manual and Gravity Minecarts

## 14.1 Manual Push

The player/NPC may push/pull a minecart when:

- interaction is valid;
- cart is uncoupled/allowed;
- brake released;
- track connected;
- Set 29 exertion response permits actor effort.

30G constrains the player/cart group to the guide.

## 14.2 Gravity Roll

A minecart may coast downhill using guide grade and drag/brake profile.

Gravity systems must not create perpetual-motion loops. Uphill return requires:

- player/animal effort;
- powered haulage;
- cable system;
- lift;
- another energy source.

## 14.3 Hand Brake

Manual carts support a readable brake control.

# 15. Powered Minecart Haulage

Powered haulage may use:

- powered cart motor;
- traction rail;
- cable/winch;
- locomotive unit;
- mana drive;
- golem/construct tow where defined elsewhere.

The specific power technology comes from Automation/Magic/Items.

30G receives a propulsion readiness snapshot and applies authorised traction.

# 16. Minecart Loading, Unloading and Buffers

Minecart cargo remains an authoritative container/lot.

Loading may occur through:

- manual player/NPC transfer;
- hopper/chute;
- loader machine;
- warehouse/depot transfer;
- mine ore bin;
- sorting yard.

30G owns:

- cart alignment;
- stop state;
- capacity exposure;
- movement lock during required transfer.

Automation/inventory owns the transaction.

# 17. Couplings, Consists and Train Formation

## 17.1 Coupling

Vehicles may expose front/rear coupling roles.

A coupling requires:

- compatible coupler class;
- aligned vehicles;
- low relative speed;
- valid clearance;
- no conflicting reservation;
- ownership/control permission from external systems.

## 17.2 Consist

A consist records:

- ordered vehicles;
- lead/control unit;
- total length;
- effective braking;
- effective speed limit;
- cargo/passenger state refs;
- coupling condition;
- route class requirements.

## 17.3 No Rubber-Band Train

Coupled carts do not teleport to maintain spacing. A bounded coupling solver preserves spacing/curve behaviour.

# 18. Freight Rail

Freight rail provides high-capacity corridor transport after sufficient infrastructure.

## 18.1 Freight Identity

Best for:

- mines -> processing;
- industrial district -> warehouse;
- regional bulk materials;
- construction supply;
- settlement distribution hubs;
- military/emergency supply where authorised.

## 18.2 Trade-Offs

Freight rail requires:

- fixed route;
- stations/loaders;
- power/traction;
- maintenance;
- route control;
- larger construction investment.

Wagons remain better for flexible last-mile routes.

# 19. Passenger Rail

Passenger rail uses the same physical guide system but adds:

- passenger seats/standing capacity;
- platform boarding zones;
- doors/gates;
- dwell state;
- safe boarding rules;
- stop information;
- social/economic service interfaces.

Set 28 owns passenger assignment/willingness where social logic matters.

Set 27 owns fares/economic operation if used.

# 20. Stations, Platforms and Dwell State

A station exposes:

- arrival stop anchor;
- platform side(s);
- vehicle class;
- passenger access zones;
- loading/freight zones;
- departure direction;
- route reservation interface;
- ownership/security;
- emergency egress.

## 20.1 Dwell

Dwell may be triggered by:

- passenger boarding;
- freight transaction;
- route clearance;
- manual operator command;
- automation schedule;
- quest/event hold.

30G owns the stopped movement state, not the economic/service policy.

# 21. Freight Depots, Loaders and Transfer Interfaces

Freight depots may expose:

- loading tracks;
- buffer inventories;
- loader/unloader machines;
- warehouse sockets;
- cart/wagon transfer bays;
- maintenance siding;
- route-control point.

A regional transit nexus may combine rail with roads, water, air or portals, but each mode retains separate physical movement and inventory state.

# 22. Rail Signals and Automation-Control Boundary

## 22.1 Movement Safety Versus Signal Logic

30G owns:

- occupancy/reservation truth;
- required braking distance;
- safe/unsafe route state;
- actual vehicle response.

Automation/control owns:

- schedule;
- dispatch priority;
- chosen destination;
- switch-command logic;
- signal display/control program;
- routing policy.

## 22.2 Signal State Interface

Automation may expose:

- Proceed;
- Caution;
- Stop;
- Shunt/LowSpeed;
- ManualAuthority;
- Fault.

30G validates that the movement authority is compatible with actual occupancy/reservation.

A green decorative light cannot override an occupied route block.

# 23. Funiculars, Incline Rail and Cable Haulage

Steep terrain uses guided/cable movement rather than forcing ordinary rail up unrealistic grades.

## 23.1 Funicular

May use:

- paired counterbalanced vehicles;
- powered winch;
- cable drive;
- magitech equivalent.

30G owns vehicle motion along the incline.

Automation/structure owns:

- winch/power;
- station/control state;
- cable machinery definition.

## 23.2 Incline Freight

Quarries/mines may use platform/carts on steep haulage tracks.

## 23.3 Cable Condition

The owning component system reports cable/drive readiness. 30G converts failure to:

- movement lock;
- emergency brake;
- safe coast where profile permits;
- failure event requiring external consequence handling.

# 24. Elevator/Lift Architecture

An elevator is a moving platform on a constrained shaft/path.

## 24.1 Required Inputs

- shaft/path definition;
- stop definitions;
- platform definition;
- door/gate state;
- power readiness;
- control request;
- passenger/cargo capacity;
- condition state;
- emergency system state.

## 24.2 Set 30 Ownership

30G owns:

- platform transform/velocity;
- acceleration/deceleration;
- stop alignment;
- occupant moving-frame transfer;
- platform collision;
- travel time;
- movement safety interlocks.

# 25. Elevator Shaft, Stop and Door Interlocks

## 25.1 Stop Definition

Each stop includes:

- stop ID;
- shaft position/path parameter;
- access side;
- landing door/gate;
- clear boarding zone;
- allowed users/cargo class;
- route/structure connection;
- emergency exit reference.

## 25.2 Interlocks

Normal lift motion requires:

- platform door/gate closed where fitted;
- landing doors closed except aligned stop;
- no obstruction in door zone;
- shaft path clear;
- platform not overloaded;
- power/control ready;
- no emergency stop.

## 25.3 Door Ownership

Structures/automation own door control state. 30G consumes interlock truth and refuses movement when unsafe.

# 26. Elevator Platform Movement and Passenger Frame Transfer

## 26.1 Moving Frame

Occupants standing on a lift inherit platform motion through the Set 30 moving-frame contract.

They do not need to be parented visually in a way that breaks networking/collision.

## 26.2 Entry/Exit

Players/NPCs may enter/leave only when:

- platform is aligned within tolerance;
- doors/gates permit;
- clearance is valid;
- reservation/permission allows.

## 26.3 Jumping on Lift

Normal player locomotion may jump while riding a lift where clearance permits. The movement body combines platform velocity with player motion consistently.

# 27. Freight Hoists and Industrial Lifts

Freight hoists may prioritise cargo over passengers.

Profiles can specify:

- cargo-only;
- passenger-capable;
- platform/open cage;
- bucket/skip hoist;
- ore lift;
- construction hoist.

A deep mine can therefore model real lift throughput without simulating every rope fibre.

# 28. Moving Platforms and Constrained Industrial Carriers

Examples:

- workshop transfer platform;
- forge trolley;
- warehouse carrier;
- quarry platform;
- rotating/linear service platform;
- puzzle/dungeon moving platform;
- magical floating platform on fixed guide.

30G owns path-constrained motion and occupant frame transfer.

# 29. Magical Guideways

Magical guideways are advanced guided routes, not teleportation.

Possible forms:

- rune rail;
- levitation track;
- crystal guideway;
- leyline carrier;
- enchanted platform corridor.

Magic/Automation owns:

- mana cost;
- rune/control logic;
- corruption/instability;
- progression;
- magical failure cause.

30G owns:

- path following;
- speed;
- clearance;
- reservations;
- occupant/cargo movement;
- response to authorised failure state.

# 30. Powered Free-Steering Land Vehicles

30G supports self-propelled vehicles that are not guide-constrained.

## 30.1 Aesthetic Boundary

The architecture permits fantasy industrial vehicles without requiring a modern-car technology tree.

Examples:

- steam traction wagon;
- powered quarry hauler;
- magitech freight cart;
- arcane utility carrier;
- construction tractor;
- faction/culture specialist engine.

## 30.2 Shared Ground Vehicle Model

Powered free-steering vehicles reuse 30F concepts:

- body footprint;
- wheel/runner contacts;
- turning radius;
- braking;
- slope;
- cargo load;
- condition;
- road compatibility.

They replace draft/human propulsion with a drive profile plus power-readiness input.

# 31. Powered Vehicle Propulsion Profiles

A drive profile declares:

- propulsion family;
- torque/tractive capacity band;
- acceleration curve;
- maximum speed;
- reverse capability;
- grade capability;
- braking/engine-brake interaction;
- wheel/track/runner drive class;
- energy-readiness interface;
- overheating/fault movement interface;
- low/high-speed steering response.

Examples:

- steam/mechanical drive;
- fuel engine;
- electric-like battery/motor;
- mana motor;
- rune/leyline drive;
- hybrid magitech.

30G does not define how the energy is generated.

# 32. Fuel, Power and Mana Readiness Interface

This document introduces a shared movement-facing readiness snapshot refined in XSI-30-009.

30G needs only enough information to answer:

- may propulsion begin?;
- may it continue?;
- what movement power band is available?;
- is speed/acceleration capped?;
- is regenerative/braking support available if applicable?;
- what fault/shutdown reason applies?;

30G does not query raw fuel recipes or mana metaphysics.

# 33. Powered Vehicle Road/Terrain Handling

Powered vehicles still depend on infrastructure.

A stronger engine does not allow:

- impossible clearance;
- infinite slope climbing;
- crossing a broken bridge;
- ignoring deep mud;
- turning through a narrow alley;
- surviving unsupported terrain automatically.

30F/30H surface/route contracts remain applicable.

# 34. Powered Vehicle Cargo and Passenger Integration

Cargo/seat rules reuse 30F:

- cargo containers;
- bulk slots;
- passenger seats;
- driver/operator seat;
- load bands;
- loading markers;
- transaction boundary.

Set 28 supplies social passenger assignment where required.

# 35. Vehicle Condition, Failure and Degraded Movement

`VehicleCondition()` remains movement-facing.

## 35.1 Guided Vehicle Failures

Possible movement consequences:

- brake degraded;
- wheel/guide assembly degraded;
- coupler damaged;
- traction unit offline;
- door interlock failed;
- lift brake fault;
- switch/junction fault;
- guideway instability.

## 35.2 Powered Vehicle Failures

- power unavailable;
- propulsion reduced;
- steering degraded;
- brake degraded;
- overheat/fault shutdown;
- immobilised.

Damage/fault source remains external.

# 36. Collision, Derailment, Overspeed and Emergency Stop

## 36.1 Collision

30G detects/handles physical movement collision.

Combat/health/item systems own damage consequences.

## 36.2 Derailment

Derailment should be uncommon under normal valid operation.

Potential causes:

- track destroyed;
- extreme overspeed into curve;
- collision;
- sabotage;
- invalid world edit;
- severe component failure.

A derailment transitions the vehicle to a bounded disabled/physics-recovery state, not uncontrolled simulation chaos by default.

## 36.3 Emergency Stop

Emergency brake:

- overrides normal traction;
- attempts maximum safe deceleration;
- may create component/passenger consequence facts;
- does not guarantee zero stopping distance.

# 37. Track/Guide Damage, Blockage and Recovery

A route may be blocked by:

- missing track;
- rubble;
- damaged bridge/tunnel;
- closed gate;
- flooded/collapsed mine;
- hostile obstruction;
- broken switch;
- lift shaft obstruction;
- power/control failure.

Recovery options are external-project dependent:

- repair;
- clear;
- reroute;
- reverse;
- unload;
- transfer cargo;
- use wagon/cart;
- use alternate lift/shaft;
- wait for restoration.

# 38. Maintenance and Repair Boundary

30G exposes:

- movement-critical component states;
- maintenance-needed movement warnings;
- immobilising components;
- required safe maintenance position/state.

Items/Recipes/Automation/Structures own:

- maintenance parts;
- labour;
- repair recipe;
- cost;
- workshop/service logic.

# 39. Automation, Logistics and Warehouse Integration

Document 08 remains authoritative for automation dispatch, power and transfer networks.

## 39.1 Automation Can Request

- destination;
- departure;
- load/unload task;
- route preference;
- switch command;
- service stop;
- park/hold;
- reverse/shunt;
- emergency shutdown.

## 39.2 30G Returns

- actual movement state;
- current segment/block;
- route reservation;
- ETA/travel time;
- vehicle capacity;
- power-readiness movement cap;
- arrival alignment;
- blocked/fault reason.

## 39.3 Transaction Rule

Visual minecarts/trains never own item quantity. Loading/unloading uses authoritative transactions exactly as the automation architecture requires.

# 40. Economy and Contract Integration

Set 27 may consume:

- freight capacity;
- passenger capacity;
- route accessibility;
- travel time;
- delay;
- actual arrival;
- service availability;
- physical cargo readiness.

Set 27 owns:

- fares;
- freight rate;
- profitability;
- contract pricing;
- insurance;
- taxes;
- wages;
- economic demand.

A passenger train does not become economically viable because 30G can move it.

# 41. NPC Operators, Drivers and Passenger Assignment Boundary

NPC/Set 28/30I systems supply:

- operator assignment;
- driver/conductor role;
- passenger assignment;
- willingness/permissions;
- companion following intent;
- station-use intent.

30G supplies:

- controls;
- seat/position validity;
- transport state;
- route occupancy;
- movement reason codes.

# 42. Combat, Sabotage and Emergency Integration

Combat/Quest/Event systems may create:

- track sabotage;
- switch tampering;
- train ambush;
- lift outage;
- bridge collapse;
- hijack/control conflict;
- derailment event;
- emergency evacuation.

30G owns movement response, not story or damage rules.

## 42.1 Emergency Evacuation

A lift/train may expose:

- safe stop;
- emergency brake;
- nearest station;
- door release eligibility;
- alternate exit marker.

Structures/quests decide evacuation goals.

# 43. First-Person and Third-Person Interaction

## 43.1 Minecart/Vehicle Control

Player-driven powered vehicles should support third-person by default and first-person where the seat/body layout is valid.

## 43.2 Rail Passenger

Passengers retain camera control from stable seat/standing frames.

## 43.3 Elevator

Camera remains player-controlled while the platform moves. Camera effects do not fake motion outside the authoritative frame.

# 44. UI, Inspection, Route State and Reason Codes

Useful transport UI may expose:

- current speed;
- route/destination;
- next station/stop;
- switch/route state;
- reservation/wait reason;
- power readiness;
- vehicle condition;
- cargo/passenger capacity;
- brake/emergency state;
- lift floor/stop;
- blocked door;
- derailment/fault status.

## 44.1 Truthful Reason Examples

- `Track disconnected`;
- `Switch locked by occupied route`;
- `Waiting for route clearance`;
- `Curve speed exceeded`;
- `Vehicle too large for tunnel`;
- `Power unavailable`;
- `Traction limited`;
- `Lift door obstructed`;
- `Lift overloaded`;
- `Stop unavailable`;
- `Freight loader blocked`;
- `Vehicle immobilised`.

# 45. Accessibility and Assisted Transport Controls

Supported assistance can include:

- simplified accelerate/brake controls;
- auto-speed-limit compliance;
- automatic station stopping;
- switch target preview;
- route reservation preview;
- powered vehicle steering assist;
- reverse camera/steering assist;
- lift auto-call/auto-door timing;
- boarding assistance;
- high-contrast track/switch state cues;
- non-colour signal state;
- reduced camera sway/shake;
- motion-comfort settings;
- hold/toggle control variants;
- text/audio station announcements through UI/Presentation owners.

Assistance cannot:

- create power;
- clear occupied track;
- pass through a closed door;
- ignore a broken guide;
- exceed clearance;
- invent cargo capacity.

# 46. Multiplayer Authority, Prediction and Reservation

## 46.1 Authority

Server/host owns:

- guided vehicle position/path parameter;
- speed/acceleration;
- route reservations;
- switch occupancy locks;
- coupling state;
- passenger/cargo attachment;
- lift platform state;
- powered vehicle transform/velocity;
- power readiness revision;
- collision/derailment state;
- emergency stop.

## 46.2 Prediction

Player-driven powered vehicles may use conservative prediction similar to 30F.

Guided vehicles can predict along a replicated path/route state, but authoritative reservations/switch state remain server-owned.

## 46.3 Boarding Reservations

Stable reservations apply to:

- driver/operator seats;
- passenger seats;
- standing passenger zones if used;
- freight loading bay;
- lift capacity slots;
- coupling operation;
- maintenance lockout.

# 47. Persistence, Save/Load and Recovery

Persist as applicable:

- vehicle instance/profile;
- route network/segment position;
- path parameter;
- speed/state;
- consist/couplings;
- cargo/passenger refs;
- power-readiness source refs;
- current station/stop;
- reservation state if safe to reconstruct;
- lift shaft/stop/platform position;
- condition/fault refs;
- last valid guided position;
- LOD journey state.

## 47.1 Load Validation

On load:

1. resolve vehicle/profile;
2. resolve guide network/segment revision;
3. resolve couplings;
4. validate clearance;
5. resolve power/control readiness;
6. validate passengers/cargo;
7. restore route/shaft position;
8. rebuild reservations;
9. stop safely at nearest valid segment/stop if topology changed.

A train does not respawn on a deleted track segment.

# 48. Simulation LOD and Distant Guided Transport

## 48.1 Near - Physical

- full vehicles/platforms;
- collision;
- visible track movement;
- station boarding/loading;
- switch traversal;
- moving-frame occupants.

## 48.2 Medium - Reduced

- path-parameter movement;
- simplified collision;
- route-block reservation;
- preserved consist/cargo/passenger identity;
- bounded station events.

## 48.3 Far - Scheduled Route Progress

A `GuidedTransportJourneyRecord` stores:

- service/mission ref;
- route path;
- vehicle/consist refs;
- cargo/passenger refs;
- current leg;
- expected arrival;
- power/control availability summaries;
- blockages/incidents;
- station stops;
- condition.

No per-wheel/per-cart distant ticks are required.

## 48.4 Lift LOD

Distant lifts may process scheduled platform moves between valid stops rather than continuous transforms, while preserving:

- occupant identity;
- cargo;
- stop;
- direction;
- time-to-arrival;
- fault state.

# 49. Registry and Data Definitions

## 49.1 GuidedRouteDefinition

Suggested IDs:

- `movement.guide.rail.mine_basic`
- `movement.guide.rail.freight_standard`
- `movement.guide.rail.passenger_standard`
- `movement.guide.funicular.standard`
- `movement.guide.lift.vertical_standard`
- `movement.guide.magitech.standard`

Fields:

- guide class;
- segment schema;
- supported vehicle classes;
- directionality;
- curve/grade bands;
- clearance;
- block/reservation profile;
- switch/junction profile;
- station/stop profile;
- power/control interface;
- damage/closure interface;
- LOD profile;
- version.

## 49.2 RailVehicleDefinition

Suggested IDs:

- `transport.rail.minecart.basic`
- `transport.rail.minecart.powered`
- `transport.rail.freight_car.basic`
- `transport.rail.passenger_car.basic`
- `transport.rail.locomotive.steam_basic`
- `transport.rail.traction.magitech_basic`

# 50. Balance-Draft Baseline Values

These values are implementation starting targets only.

## 50.1 Minecart and Rail Speeds

| Family | Initial Target Band |
| --- | ---: |
| Manual minecart | ~2-4 m/s |
| Gravity minecart normal | ~3-7 m/s, grade/brake dependent |
| Powered minecart | ~5-9 m/s |
| Mine/industrial freight consist | ~6-12 m/s |
| Regional freight rail | ~10-18 m/s |
| Settlement passenger tram/train | ~8-16 m/s |
| Regional passenger rail | ~14-24 m/s if world scale supports it |
| Funicular | ~2-5 m/s |
| Freight hoist/lift | ~1.5-3.5 m/s |
| Passenger elevator | ~2-4 m/s normal urban/industrial target |

## 50.2 Geometry Starting Targets

| Parameter | Starting Direction |
| --- | --- |
| Basic mine rail grade | Prefer <= ~8-10%; stronger grade needs haulage/special profile. |
| Freight rail grade | Prefer shallow <= ~4-6%; steeper route uses specialist traction/cable. |
| Tight minecart curve radius | ~2-3 m for compact cart class where geometry permits. |
| Freight consist curve radius | much larger; initial ~8-15 m+ depending vehicle length. |
| Route reservation | vehicle/consist length + braking distance + junction safety margin. |
| Elevator stop alignment tolerance | centimetre-scale gameplay tolerance; visually exact via presentation. |
| Normal lift acceleration | comfortable bounded profile; avoid instant starts/stops. |

## 50.3 Powered Land Vehicle Starting Targets

| Family | Clear-Road Target |
| --- | ---: |
| Powered utility cart | ~5-8 m/s |
| Industrial hauler | ~4-7 m/s |
| Steam/magitech tractor | ~5-9 m/s |
| Fast specialist powered carrier | profile-specific; keep below mount/passenger route balance unless progression justifies it. |

# 51. Godot/Summer Engine Implementation Direction

## 51.1 Recommended Runtime Services

```text
GuidedRouteRegistry
GuidedRouteGraphService
TrackSegmentValidator
RouteReservationService
RailVehicleController
ConsistCouplingSolver
RailStationService
LiftPlatformController
MovingFrameService
PoweredVehicleController
TransportPowerAdapter
TransportLODService
GuidedTransportNetworkAdapter
TransportDebugService
```

## 51.2 Rail Motion

Preferred authoritative representation:

- route/path parameter;
- forward speed;
- segment/junction ID;
- vehicle/consist length;
- orientation from guide tangent;
- swept clearance;
- coupling offsets.

Avoid full rigid-body wheel/rail simulation as the only truth.

## 51.3 Consist Solver

Use deterministic coupling spacing/angle constraints suitable for curves and save/network replay.

Visual wheelsets/bogies may independently align to rails.

## 51.4 Lift Motion

Use path/shaft parameter with controlled acceleration/deceleration and moving-frame occupant integration.

Do not animate the platform visually while leaving the authoritative collision behind.

## 51.5 Powered Vehicle Motion

Reuse project-owned chassis/ground-contact architecture from 30F with an external drive-force readiness input.

## 51.6 Debug Views

Developer overlays should show:

- guide network/segment IDs;
- connection errors;
- switch state;
- reservation blocks;
- braking distance;
- current speed limit;
- consist length;
- power readiness;
- station/stop alignment;
- lift interlock state;
- moving-frame occupants;
- LOD journey state.

# 52. Prototype Laboratories and Acceptance Tests

## 52.1 Minecart Loop Lab

Build:

- flat loop;
- slope;
- manual cart;
- powered cart;
- brake zone.

Verify:

- no free uphill energy;
- continuous track movement;
- proper braking;
- disconnected segment stops/derails by policy.

## 52.2 Switch Lab

Test:

- manual switch;
- automation command;
- occupied switch lock;
- conflicting routes;
- switch damage.

No vehicle may take a branch that was not authoritatively connected.

## 52.3 Reservation Lab

Two/three consists approach:

- single-track block;
- junction;
- station;
- passing siding.

Verify safe separation and waiting.

## 52.4 Coupling Lab

Test:

- two carts;
- 5-cart consist;
- mixed freight/passenger where allowed;
- coupling on curve;
- break/uncouple;
- reverse.

No rubber-band teleport spacing.

## 52.5 Loader Lab

Minecart aligns to loader/unloader.

Verify exact inventory transaction and no visual duplication.

## 52.6 Freight Rail Lab

Move ore from mine depot to industrial warehouse.

Verify:

- capacity;
- track route;
- power readiness;
- station loading;
- LOD demotion/promotion;
- actual arrival before destination stock changes.

## 52.7 Passenger Station Lab

Verify:

- platform alignment;
- doors;
- seat/standing assignments;
- dwell;
- departure block;
- multiplayer boarding.

## 52.8 Funicular Lab

Test steep slope where normal rail is invalid.

Verify cable/power readiness and bounded motion.

## 52.9 Elevator Lab

Multi-stop shaft with:

- passenger;
- cargo;
- blocked door;
- overload;
- power outage;
- emergency stop;
- player jumping on moving platform.

Verify frame transfer and safe interlocks.

## 52.10 Deep Mine Integration Lab

Mine shaft uses:

- lift;
- ore loading;
- minecart level;
- surface depot.

Verify throughput reflects actual lift/rail movement and no abstract teleport ore.

## 52.11 Powered Land Vehicle Lab

Test utility/industrial vehicle on:

- road;
- slope;
- mud;
- narrow gate;
- power reduction;
- power loss;
- heavy load.

Verify drive response without bypassing 30F route geometry.

## 52.12 Damage/Sabotage Lab

Break:

- track;
- switch;
- coupling;
- lift door/interlock;
- propulsion unit.

Verify safe movement outcome and external damage ownership.

## 52.13 Multiplayer Lab

Two players:

- drive powered vehicle;
- ride train;
- operate switch;
- board elevator;
- load freight;
- attempt conflicting control.

Server remains authoritative.

## 52.14 Distant Rail Lab

Demote active freight/passenger service, advance time, damage route, promote.

Verify:

- identity preserved;
- cargo/passengers conserved;
- route closure stops progress;
- no phantom arrival.

# 53. Handoff to 30H, 30I and 30J

## 53.1 30H - Roads, Routes and Long-Distance Travel

30H receives:

- guide-network accessibility;
- vehicle class;
- speed/grade/curve limits;
- station/stop nodes;
- transfer time;
- route closures;
- power readiness summaries;
- multimodal transfer interfaces.

30H owns route choice, long-distance cost and travel planning.

## 53.2 30I - NPC Navigation, Formations, Multiplayer and Persistence

30I consumes:

- operator/driver control interface;
- station boarding points;
- route reservations;
- moving-frame passenger behaviour;
- NPC transport transition links;
- transport LOD promotion/demotion.

## 53.3 30J - Registries and Final Integration

30J freezes:

- rail/guide definitions;
- vehicle profiles;
- power readiness schema;
- lift schemas;
- reason codes;
- validators;
- cross-set compatibility.

# 54. Main-Document Integration Register

| Existing Document | Required Integration |
| --- | --- |
| 03 | Final rail/guide/shaft/stop block families expose movement-facing guide facets. |
| 04 | Final minecart, rail vehicle, propulsion, lift component and powered-vehicle item families/facets. |
| 05 | Recipes for approved transport components/infrastructure; no movement logic. |
| 06 | Material progression informs transport construction and maintenance tiers. |
| 07 | NPC operators/drivers/haulers supply intent and jobs. |
| 08 | Automation retains power/control/dispatch/transactions; consume XSI-30-009. |
| 09 | Magical guideway/drive providers expose authorised power/movement state. |
| 11 | Terrain/worldgen reserves viable rail/shaft corridors where generated content requires them. |
| 12/19/20 | Structures/Blueprints expose track, station, shaft, stop, loading and maintenance markers. |
| 15 | Events/quests consume physical transport state. |
| 16 | Damage/sabotage/collision consequence remains Combat-owned. |
| 17 | UI exposes route, stop, power, fault and boarding state. |
| 20B | Deep mine throughput consumes lift/rail capacity rather than abstract hauling. |
| 20D | Rail/guided route infrastructure remains settlement route class. |
| 20E | Logistics hubs/power plants connect through power/control/loading contracts. |
| 20F | Regional transit nexus consumes mode-specific rail/lift services. |
| 25 | Registry/capability/migration governance applies. |
| 27H | Economic freight/passenger missions consume physical service facts. |
| 30A/F | Parent guided/vehicle architecture remains binding. |

# 55. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward; not directly modified by 30G.

No guided land transport in this document assumes vessel or aquatic ownership.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Carried forward.

Used only where a person physically pushes/pulls a manual minecart, operates manual haulage or performs another exertion-based movement action.

Powered traction does not consume player stamina merely because the player is driving.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** Carried forward.

Relevant to companion/passenger movement into stations/vehicles, not rail physics.

## XSI-30-004 - Environmental Movement Field Contract

**Status:** Carried forward.

Powered/guided land vehicles may consume severe environmental force where relevant, but normal rail movement is dominated by guide state.

## XSI-30-005 - Set 29 Fall Impact Consequence Contract

**Status:** Carried forward.

Relevant only when a transport incident creates a fall/impact handoff.

## XSI-30-006 - Set 28 Ride Permission and Seat Assignment Contract

**Status:** Carried forward and applied to passenger rail/lifts where social assignment is needed.

Set 28 supplies passenger/companion permission/assignment. 30G validates physical capacity and attachment.

## XSI-30-007 - Aquatic Mount Riding Boundary

**Status:** Carried forward; no change.

## XSI-30-008 - Set 27 Terrestrial Caravan Movement Execution Contract

**Status:** Carried forward; applies to 30F caravan movement only and is not expanded into rail economics here.

## XSI-30-009 - Automation Power, Control and Transport Readiness Contract

**Status:** New interface requirement for final integration; no ownership transfer.

**Reason:** Document 08 owns automation power allocation, transport-network control, routing logic, machine faults and energy/resource transactions, while 30G owns powered/guided vehicle movement. A single readiness contract prevents duplicate power or control simulation.

### Automation / Magic / Infrastructure -> Set 30

```text
transport_power_snapshot_id
source_owner_type
source_network_ids[]
source_revision

propulsion_allowed_to_begin
propulsion_allowed_to_continue
available_traction_band
max_speed_modifier
acceleration_modifier
braking_assist_band

control_authority_state
requested_destination_or_route_ref?
switch_signal_authority_refs[]
emergency_stop_requested
shutdown_requested

power_fault_codes[]
control_fault_codes[]
energy_state_band
provider_tags[]
```

### Set 30 -> Automation / Infrastructure

```text
transport_instance_id
movement_state
actual_speed_band
actual_traction_use_band
current_route_segment
current_reservation_refs[]
arrival_alignment_state
blocked_state
emergency_brake_state
vehicle_condition_band
movement_reason_codes[]
```

### Constraint

Set 30 does not deduct fuel, mana or electricity-like units, schedule production, choose economic destinations or reprogram switches. It reports movement demand/state and obeys the authoritative readiness/control result.

## XSI-30-010 - Set 27 Guided Freight and Passenger Service Interface

**Status:** New optional/refinement interface for Set 27 review; no ownership transfer.

Set 27 may define economic services using rail/passenger/powered transport. To avoid economic code assuming impossible service, Set 30 exposes:

```text
transport_service_ref
vehicle_or_consist_class
passenger_capacity
cargo_capacity
route_accessibility
service_ready
estimated_travel_time
actual_departure
journey_progress
actual_arrival
physical_delivery_or_boarding_state
delay_reason_codes[]
```

Set 27 owns:

- ticket/fare price;
- freight price;
- subsidies;
- wages;
- profitability;
- demand;
- contracts;
- insurance;
- taxes;
- market effects.

No Set 27 rule may create destination cargo or passenger arrival before the physical transport result confirms it.

# 56. Open Decisions and Deferred Questions

1. Whether minecarts are the first 30G implementation target before elevators.
2. Whether manual minecart pushing is player-first, NPC-first or both in Core Production.
3. Final rail gauge/visual standard: abstract family rather than real-world gauge is recommended.
4. Whether rails are full voxel blocks, surface overlays, modular pieces or hybrid in final Core Production.
5. Final curve-generation/editing UX in Blueprint Forge/in-world building.
6. Whether players can place automatic junctions early or only manual switches initially.
7. Whether route-block signaling is visible through physical signal posts, UI overlay or both.
8. Final maximum minecart consist length in local mines.
9. Whether basic freight trains use a dedicated locomotive or powered individual carts at first.
10. Whether steam locomotive content is Core, Beta or culture-specific.
11. Whether passenger rail appears at Town, City or later depending settlement size.
12. Whether urban tram/street-running rail is supported or deferred.
13. Final freight/passenger speeds after world-scale testing.
14. Whether rail can be built on steep switchbacks or steep grades always require cable/funicular.
15. Whether coupling breakage is a routine wear failure or only damage/event-driven.
16. Whether automated coupling/uncoupling is a dedicated machine function.
17. Final lift/elevator acceleration and door timing for gameplay comfort.
18. Whether ordinary passenger lifts require operators at early tech tiers.
19. Whether counterweight physics is explicitly simulated or represented by readiness/efficiency data.
20. Whether open mine cages permit player jumping off between stops; recommended restricted by shaft geometry/safety, not arbitrary invisible walls.
21. Whether construction hoists can move unfinished project materials/players during staged building.
22. Whether magical guideways levitate above the guide or use visible rails; content/style decision.
23. Whether magitech guideways can branch/reconfigure dynamically; Automation/Magic must own control logic.
24. Which powered free-steering vehicles are appropriate to Leyforge's fantasy visual identity.
25. Whether powered vehicles use road-legal speed caps in settlements via law/AI systems.
26. Final energy-state granularity exposed through XSI-30-009.
27. Whether rail regeneration/dynamic braking returns energy; Automation owns accounting if included.
28. Whether collision can trigger derailment at normal difficulty or only severe incidents.
29. Final route-reservation granularity for performance at city/regional scale.
30. Whether multiple trains may occupy one long block in low-speed shunting yards through specialised reservation rules.
31. Final multiplayer prediction model for long trains and elevators.
32. Final far-LOD passenger service representation.
33. Final rail/lift integration with player-created Blueprints and validation.
34. Approval/finalisation of XSI-30-009.
35. Approval/finalisation of XSI-30-010.

# Appendix A. Guided Transport State Transition Matrix

| From | Trigger | To | Validation | Failure |
| --- | --- | --- | --- | --- |
| Parked | manual push | ManualMove | guide connected + exertion allowed | remain parked |
| Parked | propulsion request | PoweredMove | XSI-30-009 ready + route reserved | remain/wait |
| PoweredMove | traction released | Coasting | guide valid | Brake/Stop if needed |
| AnyMove | service brake | Braking | brake available | degraded braking reason |
| AnyMove | emergency request | EmergencyBrake | movement authority | collision/incident if insufficient distance |
| AnyMove | reservation unavailable | Waiting/Braking | safe stopping distance | emergency response |
| AnyMove | track invalid | Stop/Derail | current speed/path state | bounded derailment |
| Minecart | loader aligned | Loading | stop + transaction endpoint | remain waiting |
| Coupled | uncouple request | Uncoupling | speed near zero + permission | remain coupled |
| Train | station stop | Dwell | platform alignment | hold/overshoot recovery |
| LiftIdle | call/request | LiftMoving | interlocks + power + destination | remain idle |
| LiftMoving | target reached | LiftAligning | shaft/stop clear | stop fault |
| LiftAligning | alignment valid | LiftDwell | door interlock | remain closed |
| PoweredVehicle | power lost | Coast/Stop | drive profile | immobilised if needed |
| FarJourney | promoted | LocalGuided | route reconstruction | stop at nearest valid node |

# Appendix B. Guided Route Definition Template

```text
guided_route_definition_id
guide_class
supported_vehicle_classes[]

segment_schema_id
junction_schema_id
reservation_profile_id
station_stop_profile_id

directionality
curve_radius_bands
grade_bands
clearance_profile
speed_limit_profile

power_interface_type?
control_interface_type?
damage_closure_interface
ownership_permission_interface
lod_profile_id

version
```

# Appendix C. Rail Vehicle Movement Profile Template

```text
rail_vehicle_profile_id
vehicle_class
body_profile_ref
supported_guide_classes[]

vehicle_length
vehicle_width
vehicle_height
swept_overhang_profile

max_speed
acceleration_profile
service_brake_profile
emergency_brake_profile
curve_speed_profile
grade_response_profile

cargo_profile_ref?
seat_profile_ref?
coupler_front_class?
coupler_rear_class?

propulsion_mode
power_readiness_interface?
condition_movement_profile
prediction_class
lod_profile_id
version
```

# Appendix D. Lift/Elevator Definition Template

```text
lift_definition_id
shaft_guide_profile_id
platform_body_profile_id

stop_definitions[]
max_passenger_capacity
cargo_capacity_profile

max_speed
acceleration_profile
braking_profile
alignment_tolerance

door_interlock_profile
obstruction_profile
overload_policy
emergency_brake_profile
power_readiness_interface

moving_frame_profile
ownership_permission_ref
condition_profile
lod_profile_id
version
```

# Appendix E. Powered Vehicle Drive Profile Template

```text
powered_drive_profile_id
vehicle_family
propulsion_family

max_speed
forward_tractive_band
reverse_tractive_band
acceleration_curve
engine_brake_profile

road_surface_response_profile
slope_response_profile
load_response_profile
steering_response_profile

power_readiness_interface
fault_response_profile
condition_movement_profile

prediction_class
lod_profile_id
version
```

# Appendix F. Transport Power Readiness Snapshot

```text
transport_power_snapshot_id
transport_instance_id
source_owner_type
source_network_ids[]
source_revision

tick
propulsion_allowed_to_begin
propulsion_allowed_to_continue
available_traction_band
max_speed_modifier
acceleration_modifier
braking_assist_band

control_authority_state
requested_destination_or_route_ref?
emergency_stop_requested
shutdown_requested

energy_state_band
power_fault_codes[]
control_fault_codes[]
provider_tags[]
```

# Appendix G. Train/Consist Runtime Record

```text
consist_runtime_id
vehicle_ids_ordered[]
lead_vehicle_id
control_owner_ref?

current_route_network_id
current_segment_id
path_parameter
speed
movement_state

consist_length
max_speed_effective
service_brake_effective
emergency_brake_effective

reservation_refs[]
station_or_stop_ref?
dwell_state?

cargo_snapshot_refs[]
passenger_refs[]
power_snapshot_id?

coupling_state_refs[]
condition_state
lod_state
authoritative_tick
prediction_sequence
```

# Appendix H. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| guided.route.disconnected | Guide topology is not continuous. | Set 30 / infrastructure source |
| guided.route.incompatible | Vehicle class/curve/grade/clearance invalid. | Set 30 |
| guided.route.occupied | Required route block unavailable. | Set 30 |
| guided.switch.locked | Junction cannot change or route branch unavailable. | Set 30 + control state |
| guided.speed.curve_limit | Current curve limits safe speed. | Set 30 |
| guided.speed.grade_limit | Grade/profile limits movement. | Set 30 |
| guided.brake.degraded | Vehicle condition reduces braking. | Set 30 response to component state |
| guided.power.unavailable | External readiness denies propulsion. | Automation/Magic owner |
| guided.control.stop | External control authority requires stop. | Automation/control owner |
| guided.vehicle.immobilised | Vehicle cannot move. | Set 30 response to condition |
| rail.coupling.invalid | Coupling alignment/class/state invalid. | Set 30 |
| rail.loading.not_aligned | Vehicle not aligned to transfer point. | Set 30 |
| rail.derailed | Vehicle left valid guide constraint. | Set 30 |
| lift.interlock.door | Door/gate state prevents movement. | Structure/control + Set 30 |
| lift.interlock.obstruction | Door/shaft/platform obstruction prevents movement. | Set 30 |
| lift.overload | Capacity snapshot exceeds lift movement limit. | Capacity owner + Set 30 |
| lift.stop.invalid | Requested stop unavailable/incompatible. | Structure + Set 30 |
| lift.power.unavailable | External power readiness denies motion. | Automation/Magic owner |
| powered.route.blocked | Free-steering powered vehicle route/clearance invalid. | Set 30 |
| powered.energy.limited | Power readiness caps movement. | External owner |
| transport.recovery.safe_guide | Saved/invalid state restored to valid guide point. | Set 30 |

# Appendix I. Multiplayer Guided Transport Contract

## Client -> Authority

```text
player_id
input_sequence
client_tick

transport_instance_id
control_request
throttle_or_traction_input
brake_input
reverse_input?

requested_switch_or_route_ref?
station_stop_request?
lift_stop_request?
boarding_or_seat_request?
coupling_request?

local_route_revision
local_power_snapshot_revision
local_vehicle_condition_revision
predicted_state_hash
```

## Authority -> Client

```text
server_tick
ack_input_sequence

transport_instance_id
position_or_path_parameter
rotation
speed
movement_state

route_network_id?
segment_id?
reservation_refs[]
switch_route_state?

station_stop_ref?
lift_stop_ref?
interlock_state?

power_snapshot_id?
condition_state
passenger_seat_state{}
cargo_snapshot_refs[]
reason_codes[]
```

# Appendix J. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Rail Topology | Disconnected/broken track blocks movement; valid guide follows deterministic path. |
| Switches | Occupied/reserved junction cannot silently switch under vehicle. |
| Reservations | Two vehicles cannot occupy conflicting route blocks under normal authority. |
| Minecart | Manual/gravity/powered modes share one guide truth; no free uphill energy. |
| Coupling | Consists preserve ordered spacing/curve behaviour without teleport rubber-banding. |
| Freight | Exact cargo transactions occur only at aligned loader/depot endpoints. |
| Passenger | Seats/platform/dwell are physical; Set 28/27 retain social/economic ownership. |
| Signals/Automation | Automation controls route policy; Set 30 validates actual movement safety. |
| Funicular | Steep guided haulage uses cable/power readiness and bounded movement. |
| Elevator | Doors/obstructions/overload/power interlock actual movement; occupant frame transfer is stable. |
| Deep Mine | Ore must physically traverse lift/rail capacity before surface stock exists. |
| Magical Guideway | Magic owns mana/runes; Set 30 owns guide movement only. |
| Powered Vehicles | Drive force depends on XSI-30-009 and still respects 30F geometry/surface rules. |
| Condition | Damage/fault changes speed/brake/immobilisation without Set 30 owning damage source. |
| Derailment | Severe invalid state produces bounded recoverable derailment rather than uncontrolled chaos. |
| LOD | Distant rail/lift transport conserves cargo/passengers and respects route closures. |
| Multiplayer | Server owns route reservation, power revision, lift state and vehicle position. |
| Economy Boundary | Set 27 consumes capacity/time/arrival; 30G never calculates fares/profit. |
| 30F Regression | Roads/wagons remain useful last-mile/flexible freight rather than being replaced universally by rail. |
| 30A Regression | Guided-route and lift/elevator boundary remains exactly as parent architecture requires. |

# END OF DOCUMENT 30G
