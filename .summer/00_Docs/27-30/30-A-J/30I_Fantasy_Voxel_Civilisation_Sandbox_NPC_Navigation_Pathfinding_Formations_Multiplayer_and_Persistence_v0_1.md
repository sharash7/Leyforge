# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30I - NPC Navigation, Pathfinding, Formations, Multiplayer and Persistence

Version 0.1 - Detailed AI Movement Execution, Navigation Runtime, Group Motion, Network Authority and Save-State Design Draft

A production-oriented specification for authoritative non-player movement execution in Leyforge, covering navigation profiles, local voxel navigation, hierarchical pathfinding, traversal-link use, doors and gates, dynamic world edits, obstacle avoidance, group and formation execution, companion following, herd/flock/convoy movement interfaces, work-site navigation, route-plan consumption, stuck recovery, simulation level of detail, multiplayer replication, passenger synchronisation, persistence, deterministic reconstruction, Godot/Summer Engine implementation and final movement-system integration.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **NPC Navigation Statement**
>
> NPCs and creatures should move as though they inhabit the same voxel world as the player. They may know more or less than the player, choose different goals, use different locomotion capabilities and be simulated at different levels of detail, but they must not gain invisible movement privileges merely because they are AI. Navigation therefore separates decision intent from physical route execution, uses the same movement capabilities and traversal contracts defined across Set 30, and permits abstraction only when it preserves identity, route truth and persistent consequence.

# Document Purpose

Document 30I defines how non-player movers execute movement through Leyforge once another system has decided **where they want to go and why**.

That distinction is the governing boundary of this document.

NPC Village, Creature, Combat, Quest, Social/Companion, Economy, Automation and Settlement systems may all create movement intent. A villager may need to reach a workstation. A guard may need to intercept a threat. A companion may be instructed to follow the player. A spider may hunt across a cave wall. A merchant caravan may need to reach another settlement. A passenger may be assigned to a wagon seat. None of those intentions gives the owning system permission to teleport or independently simulate movement.

Document 30I receives the authoritative movement goal, actor/mover profile, group/formation intent where applicable and route-policy constraints. It then uses the movement systems defined in Documents 30B through 30H to determine a physically valid path, select required traversal transitions, reserve constrained spaces, steer the mover, react to dynamic voxel changes, move between local and distant simulation and publish truthful arrival/failure results.

The document also owns the Set 30 networking and persistence integration that must remain common across player, NPC, mount and vehicle movement. Individual specialist movement documents define their local physics; 30I defines how authoritative movement records are replicated, interpolated, saved, reconstructed and coordinated when many movers exist at once.

# Governing Source and Dependency Register

| Source | Existing Direction Relevant to 30I | 30I Treatment |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Set 30 owns pathfinding interfaces and movement execution; Set 28 owns companion/social AI and formation behaviour intent; Set 29 owns survival/biological state. | Binding ownership contract. |
| 00 - Master Game Design Bible | Living civilisations, persistent NPCs, voxel construction, exploration, automation and multiplayer require a readable shared world. | NPC movers obey world geometry and persistent state rather than becoming detached simulation tokens near the player. |
| 01 - Core Gameplay Loop | NPC civilisation and world response should remain visible and systemic. | Movement turns jobs, projects, patrols and quests into physical activity where simulation fidelity allows. |
| 02 - Player Progression | Movement capability may depend on skills, equipment, knowledge and progression. | 30I consumes capability snapshots and does not own unlock progression. |
| 03 - Blocks Registry | One-metre voxel geometry, stairs, slopes, doors, hazards and dynamic block edits alter navigation. | Navigation evidence is generated from authoritative world geometry/state. |
| 07 - NPC Village System | Named NPCs have homes, jobs, schedules, projects, inventories and persistent consequences; near simulation is detailed and far simulation abstract. | NPC AI supplies destinations/tasks; 30I owns path/movement execution and movement LOD. |
| 08 - Automation System | NPC labour, haulers, golems and logistics need bounded route execution and near/far processing. | Dispatch/work ownership remains external; 30I executes mobile entities and route transitions. |
| 10 - Creatures and Monsters | Creatures have ecological AI, raids, group behaviour, senses, taming and diverse locomotion. | Creature AI supplies intent; 30I resolves routes using body/navigation capabilities. |
| 11 - Biomes and World Generation | Seed-generated terrain, caves, roads, rivers and dynamic environmental state form navigation topology. | 30I consumes local nav data and 30H route corridors; worldgen does not move actors. |
| 12 / 19 / 20 | Structures and blueprints expose doors, work markers, roads, beds, guard points, construction sites and navigation products. | 30I uses semantic access points and invalidates paths when structures change. |
| 15 - Quest and Event System | Escort, rescue, patrol and travel objectives bind to persistent actors and world changes. | Quest system consumes authoritative movement progress/results. |
| 16 - Combat, Gear and Defence | Combat AI needs pursuit, cover approach, retreat, flanking and movement locks; server authority is required. | Combat owns tactical intent/action choices; 30I executes requested movement and reports physical feasibility. |
| 17 - UI/UX System | UI consumes authoritative view models, never invents state; accessibility and multiplayer feedback must remain consistent. | 30I exposes movement/formation/debug reason data; 17 owns presentation. |
| 18 - Technical Architecture | NPC/creature AI, navigation, simulation LOD, networking, persistence, command sequencing and reconstruction are foundational concerns. | General architecture is retained while legacy Unreal specifics are superseded by Godot/Summer direction. |
| 20C | Patrol, evacuation, emergency routes and gate state use navigation and bounded simulation. | 30I executes route movement; governance/emergency services own response intent. |
| 20D | Roads are network graphs with physical route classes and effective-distance semantics. | 30I consumes 30H route legs and executes local movement at either end. |
| 22H - Entity Gameplay Integration | Navigation profiles describe locomotion capability, footprint, height, step, slope, turning, climbing, swimming, burrowing, flying, perching and formation needs; movement validation remains gameplay-owned. | Primary mover-profile input. Forge remains marker/profile author, not navigation authority. |
| 22I/K | Blueprint Forge bakes semantic structure markers, paths and navigation products. | 30I consumes validated bake products and revision events. |
| 25 - Production Governance | Stable IDs, capability contracts, validation, migrations and fallbacks are required. | Navigation definitions, runtime records and save data follow registry governance. |
| 26 - Maritime Expansion | Swimming/vessel movement and water route execution remain Set 26-owned pending XSI-30-001. | 30I can hand AI movers to aquatic/vessel providers but does not redefine them. |
| 27 | Economy creates merchant/caravan/trade travel intent and consumes arrival evidence. | 30I never chooses economically profitable destinations. |
| 28 | Social/Companion system owns companion intent, social following, ride/passenger assignment and formation behaviour. | 30I converts authorised intent/formation output into spatially valid movement. |
| 29 | Survival owns injury, fatigue, stamina, carry penalties and physiological movement restrictions. | 30I consumes the resulting movement modifiers/capability restrictions. |
| 30A | Defines mover profiles, movement modes, pathfinding interfaces, safe positions, authority and Movement API. | Binding parent architecture. |
| 30B | Ground locomotion, collision, posture, jump and player movement states. | Supplies generic ground-movement execution concepts used by NPC movers where profile-compatible. |
| 30C | Vault, mantle, climb, ladder, rope, grapple and traversal transition links. | Provides specialist navigation transitions and reservation requirements. |
| 30D | Falling, gliding, environmental fields and aerial movement. | Provides airborne/aerial transition execution and environment integration. |
| 30E | Mount/rider movement, seat IDs and flying mounts. | Provides mounted mover and passenger attachment states. |
| 30F | Carts, wagons, draft teams and physical convoy movement. | Provides unpowered-vehicle navigation constraints and convoy execution. |
| 30G | Rails, minecarts, lifts, elevators and powered/guided vehicles. | Provides guided movement services and transport transition states. |
| 30H | Hierarchical route graph, mover-specific accessibility, multimodal route plans, effective distance and long-distance journey state. | Direct high-level planner input; 30I owns local path execution. |

# Governing Ownership Contract

Document 30I owns:

- non-player local navigation path generation;
- path execution and steering;
- navigation-world representation consumed by Set 30 movers;
- path validation against mover profiles;
- local use of 30C traversal links;
- dynamic-obstacle and local-avoidance movement;
- constrained-space reservations used by movement;
- stuck detection and movement recovery;
- formation **spatial execution**;
- companion-follow movement execution;
- group corridor and slot validation;
- vehicle/mount passenger movement synchronisation;
- local movement handoff from 30H route plans;
- near/medium/far movement simulation transitions;
- movement persistence and reconstruction;
- Set 30 movement networking integration;
- authoritative movement command/snapshot contracts for NPCs and shared vehicles;
- movement debugging, budgets and deterministic test contracts.

Document 30I does **not** own:

- NPC goals, schedules or job selection;
- creature hunting, ecology or target choice;
- companion loyalty, willingness or social follow decisions;
- formation style/intent selection where owned by Set 28;
- combat tactics, threat evaluation or attack choice;
- merchant/trade destination selection;
- survival/biological movement penalties;
- settlement planning;
- world generation;
- road/bridge construction;
- movement physics already owned by 30B-30G;
- route economics;
- animation authorship.

# Static Table of Contents

1. Locked NPC Navigation Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Navigation Design Principles  
4. Navigation Runtime Architecture  
5. Canonical Terminology  
6. AI Intent Versus Movement Execution  
7. Navigation Profile Consumption from Entity Forge  
8. Navigation World Representations  
9. Local Voxel Navigation Surface  
10. Walkable Cells, Polygons and Hybrid Navigation  
11. Local Path Query Lifecycle  
12. Hierarchical Pathfinding and 30H Route Consumption  
13. Path Cost and Local Movement Cost  
14. Movement-Mode and Traversal-Link Expansion  
15. Doors, Gates and Interactive Navigation Links  
16. Ladders, Ropes, Climb Links and Vertical Access  
17. Moving Platforms, Elevators and Guided Transport Links  
18. Mount and Vehicle Navigation  
19. Flying Navigation and Perch/Landing Interfaces  
20. Aquatic Navigation Boundary  
21. Goal Resolution and Arrival Contracts  
22. Steering, Acceleration and Path Following  
23. Dynamic Obstacles and Local Avoidance  
24. Crowds, Queues and Dense Settlement Movement  
25. Reservation Architecture  
26. Narrow Passages, Doors, Bridges and Single-Lane Resources  
27. Deadlock Detection and Resolution  
28. Stuck Detection and Recovery  
29. Dynamic Voxel Edits and Path Invalidation  
30. Path Replanning and Fallback Policies  
31. Formation Intent Boundary with Set 28  
32. Formation Spatial Execution  
33. Companion Following  
34. Parties, Escorts and Group Corridor Movement  
35. Herds, Flocks, Packs and Creature Groups  
36. Convoys, Wagons and Mixed-Mover Groups  
37. Passenger, Rider and Seat Synchronisation  
38. Work, Construction and Settlement Navigation  
39. Patrol, Emergency and Combat-Movement Handoffs  
40. Navigation Knowledge and Route Information Boundary  
41. Near Simulation Navigation  
42. Medium-Range Reduced Navigation  
43. Far/Abstract Movement Simulation  
44. Promotion and Demotion Between LODs  
45. Persistent Entity Location Model  
46. Save/Load and Movement Reconstruction  
47. Multiplayer Authority Model  
48. NPC Movement Replication and Interpolation  
49. Prediction, Reconciliation and Player-Controlled Shared Movers  
50. Relevance, Network LOD and Bandwidth Budgets  
51. Reconnection and Ownership Transfer  
52. Determinism, Seeds and Replayable Movement Evidence  
53. Navigation Performance Budgets and Scheduling  
54. Failure Containment and Safe Recovery  
55. UI, Debugging and Developer Visibility  
56. Accessibility and Companion-Movement Assistance  
57. Registry and Data Definitions  
58. Balance-Draft Navigation Budgets and Thresholds  
59. Godot/Summer Engine Implementation Direction  
60. Prototype Laboratories and Acceptance Tests  
61. Handoff to 30J  
62. Main-Document Integration Register  
63. Cross-Set Interface Amendments  
64. Open Decisions and Deferred Questions  
Appendix A. Movement Intent Contract  
Appendix B. Navigation Profile Runtime Snapshot  
Appendix C. Local Path Request and Result  
Appendix D. Traversal Link Runtime Record  
Appendix E. Formation Intent and Spatial Plan  
Appendix F. Movement Reservation Template  
Appendix G. Persistent Entity Movement Record  
Appendix H. Network Movement Snapshot  
Appendix I. Reason-Code Catalogue  
Appendix J. Acceptance and Regression Matrix  

# 1. Locked NPC Navigation Identity

NPC navigation is the physical execution layer between AI intent and the world.

> **Locked Rule**
>
> An AI system may decide that an actor should reach a target, but it may not decide that the actor has reached it. Set 30 validates the route, executes the mover's actual locomotion and publishes authoritative arrival or failure evidence.

## 1.1 Player-Facing Promise

NPCs should not routinely:

- walk through walls;
- ignore closed gates;
- cross gaps they cannot jump;
- climb smooth walls without capability;
- squeeze wagons through footpaths;
- teleport to a workstation because the player looked away;
- occupy the same ladder rung impossibly;
- snap through the player in crowds;
- disappear from a route and reappear at a destination without a valid LOD journey.

When abstraction is used, the underlying route and movement result remain valid.

# 2. Scope, Ownership and Explicit Non-Goals

30I answers:

- how a mover turns a destination into a local path;
- how that path uses the movement capabilities from Set 30;
- how many movers share constrained spaces;
- how groups/formations remain physically plausible;
- how movement remains authoritative online;
- how movement survives unloading/saving/reloading;
- how navigation scales to living settlements and creatures.

30I is not a behaviour tree, utility-AI system, GOAP planner, social AI system or combat tactical brain.

# 3. Navigation Design Principles

## 3.1 Same World Rules, Different Capabilities

An NPC can use a route unavailable to the player only when its body/capability profile genuinely supports it.

Examples:

- spider climbs tagged wall;
- bird flies to perch;
- small creature fits narrow gap;
- heavy golem cannot use fragile bridge;
- miner uses ladder;
- mounted guard requires mounted clearance.

## 3.2 Intent Is Not Motion

The AI asks:

> Move to workstation A.

Set 30 may answer:

- route found;
- route requires door;
- route requires ladder;
- route temporarily blocked;
- target inaccessible;
- route changed;
- mover stuck;
- arrived.

## 3.3 Movement Abstraction Must Preserve Truth

Distant actors may stop using local steering, but they retain:

- identity;
- route;
- travel time;
- location summary;
- movement mode;
- important attachments;
- interruptions.

## 3.4 Navigation Data Is Disposable; Authoritative State Is Not

Navigation meshes/caches may be rebuilt.

Persistent actor position, route progress and world changes cannot be inferred only from regenerated navigation data.

# 4. Navigation Runtime Architecture

```text
External AI / Job / Combat / Social Intent
                    |
                    v
             Movement Intent Adapter
                    |
                    v
              Goal Resolver
                    |
          +---------+----------+
          |                    |
          v                    v
      30H Route Plan       Local Goal Only
          |                    |
          +---------+----------+
                    v
             Local Path Planner
                    |
             Navigation Profile
                    |
       +------------+-------------+
       |            |             |
       v            v             v
  Ground Edges  Traversal Links  Transport Links
       |            |             |
       +------------+-------------+
                    v
             Reservation Filter
                    |
                    v
              Path Executor
                    |
           Steering / Avoidance
                    |
                    v
      Specialist Movement Controller
          (30B / 30C / 30D /
           30E / 30F / 30G)
                    |
                    v
           Authoritative Result
```

# 5. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Movement Intent | External request describing desired movement outcome, not a path or teleport. |
| Navigation Goal | Spatial/semantic destination resolved for pathfinding. |
| Navigation Profile | Mover capability/footprint/clearance definition consumed from Forge/gameplay data. |
| Local Navigation Surface | Active navigation representation for loaded terrain/structures. |
| Navigation Cell | Bounded traversable unit used by the local navigation system. |
| Path | Ordered local navigation result for one mover/profile. |
| Corridor | Wider spatial region through which local steering may choose exact motion. |
| Traversal Link | Specialist transition invoking 30C or other movement mode. |
| Transport Link | Transition into/out of mount, vehicle, lift, rail, vessel or portal provider. |
| Reservation | Temporary movement claim on a constrained resource/space. |
| Avoidance | Short-range movement adjustment that does not change the high-level goal. |
| Replan | Building a new path because current route evidence became invalid/unsuitable. |
| Arrival Volume | Spatial/semantic condition defining successful goal completion. |
| Formation Intent | Set 28/social/group-owned desired relative arrangement. |
| Formation Spatial Plan | Set-30-owned physically valid slot/corridor realisation. |
| Follow Anchor | Dynamic movement target derived from another entity plus spacing/slot rules. |
| Movement LOD | Fidelity of movement execution independent of rendering/animation LOD. |
| Location Summary | Persistent coarse location record used when no physical actor is loaded. |
| Promotion | Reconstructing a more detailed movement representation. |
| Demotion | Replacing detailed movement with a lower-cost authoritative summary. |

# 6. AI Intent Versus Movement Execution

## 6.1 External Intent Examples

NPC Village:

```text
goal_type = ReachWorkstation
target_ref = workstation.smithy_anvil_02
urgency = Normal
```

Combat:

```text
goal_type = ReachCombatPosition
target_region = cover_region_14
urgency = High
```

Companion/Social:

```text
goal_type = FollowEntity
leader_ref = player:<id>
formation_intent_ref = formation.party.wedge
```

Economy:

```text
goal_type = ExecuteJourney
route_plan_ref = <30H plan>
```

## 6.2 Set 30 Response

Set 30 returns:

- Accepted;
- Pathing;
- Moving;
- Waiting;
- Replanning;
- Arrived;
- Failed;
- Cancelled;
- SuspendedByLOD.

Reason codes explain failure without transferring decision ownership.

# 7. Navigation Profile Consumption from Entity Forge

22H remains the source of navigation-profile authoring metadata.

30I consumes:

- mover footprint;
- body height;
- step height;
- stable slope;
- turning requirement;
- stance/clearance classes;
- ground locomotion classes;
- climb capability;
- ladder capability;
- swimming capability;
- flying capability;
- perching capability;
- burrowing/special capability where approved;
- formation footprint;
- door/gate compatibility;
- traversal transition classes.

30I does not hard-code species-specific movement into the pathfinder.

# 8. Navigation World Representations

Leyforge should use multiple navigation representations rather than one enormous global navmesh.

## 8.1 Layers

- active voxel/local geometry navigation;
- structure/room navigation;
- road/settlement corridor graph;
- specialist traversal links;
- transport/transfer links;
- 30H regional/world route graph.

## 8.2 Hybrid Direction

Godot's navigation regions may be useful for broad walkable surfaces, but the voxel world needs project-owned overlays for:

- dynamic block edits;
- exact door/gate state;
- one-metre step logic;
- ladders/climb links;
- mover-size filters;
- vehicle turns;
- destructible structures;
- generated caves.

# 9. Local Voxel Navigation Surface

The local navigation layer is derived from authoritative collision/world state.

A local navigable area records:

- support geometry;
- clearance;
- slope;
- step transitions;
- hazard/surface tag;
- dynamic obstruction;
- structure/room membership;
- route/road association;
- navigation revision.

## 9.1 Bounded Rebuilds

Changing one voxel should invalidate the smallest practical navigation region rather than rebuild an entire settlement.

# 10. Walkable Cells, Polygons and Hybrid Navigation

30I does not require a single representation for every body type.

Possible runtime representations:

- navigation polygons/regions for ordinary humanoids;
- voxel-column/cell graph for highly dynamic caves/building edits;
- lane/corridor graph for roads/vehicles;
- volume graph for flying movers;
- transition graph for ladders/climbing;
- water navigation delegated to aquatic owner.

The public path API hides the implementation choice.

# 11. Local Path Query Lifecycle

```text
Requested
-> GoalResolved
-> ProfileResolved
-> NavRevisionCaptured
-> SearchQueued
-> Searching
-> Validating
-> Ready
-> Executing
-> Completed
```

Failure branches:

- NoGoal;
- NoNavData;
- NoPath;
- CapabilityBlocked;
- PermissionBlocked;
- DynamicBlocker;
- BudgetDeferred;
- Cancelled.

# 12. Hierarchical Pathfinding and 30H Route Consumption

For nearby goals, 30I can plan locally.

For distant goals:

1. 30H supplies a route plan/corridor.
2. 30I resolves the local path to the next route/transfer node.
3. Movement executes through the specialist controller.
4. 30I advances to the next leg.
5. If the actor demotes to distant LOD, 30H/Journey state becomes the movement truth.
6. On promotion, 30I reconstructs at a valid local route position.

30I does not independently choose a different regional route unless it requests a replan from 30H.

# 13. Path Cost and Local Movement Cost

Local path cost may include:

- surface;
- slope;
- step;
- crowd;
- hazard;
- door wait;
- traversal action duration;
- narrow-space penalty;
- formation incompatibility;
- local danger input;
- mover condition modifier.

This cost refines 30H's corridor rather than replacing global route economics.

# 14. Movement-Mode and Traversal-Link Expansion

A local path can include transitions:

```text
Ground
-> Ladder
-> Ground
-> Lift
-> Ground
```

or:

```text
Ground
-> SurfaceClimb
-> LedgeMantle
-> Ground
```

Each link declares required capabilities and invokes the owning specialist controller.

The pathfinder never treats a traversal link as a free graph edge.

# 15. Doors, Gates and Interactive Navigation Links

A door/gate link may have states:

- Open;
- ClosedUsable;
- ClosedPermissioned;
- Locked;
- Blocked;
- DestroyedOpen;
- DestroyedBlocked;
- Reserved;
- InTransition.

The structure/permission owner controls the state.

30I can:

- approach;
- reserve;
- request open;
- wait;
- pass;
- release reservation.

It cannot unlock a door because a path requires it.

# 16. Ladders, Ropes, Climb Links and Vertical Access

30C provides traversal links.

30I uses them when:

- mover capability supports the link;
- link active;
- reservation capacity available;
- entry path valid;
- exit remains valid;
- current external movement state permits use.

Path cost includes expected transition duration and wait.

# 17. Moving Platforms, Elevators and Guided Transport Links

30G provides moving transport infrastructure.

A navigation transition may require:

- wait for elevator;
- reserve capacity;
- board;
- attach passenger;
- travel;
- disembark;
- continue local path.

30I owns the path handoff, not the lift control/power system.

# 18. Mount and Vehicle Navigation

Mounts and vehicles are movers with their own profiles.

## 18.1 Mount

30E supplies:

- mount footprint;
- clearance;
- turn;
- gait/surface capability;
- rider state.

30I pathing uses the mount profile while mounted.

## 18.2 Wagons/Vehicles

30F/30G supply:

- footprint;
- swept turn;
- route class;
- reverse;
- grade;
- condition.

Vehicle pathing uses lane/corridor/route constraints rather than humanoid navmesh assumptions.

# 19. Flying Navigation and Perch/Landing Interfaces

Flying creatures and flying mounts may use a volumetric navigation layer.

Inputs include:

- flight capability;
- body radius/clearance;
- altitude band;
- no-fly hazards;
- gravity/environment field;
- perch/landing markers;
- flight corridor/route;
- current flight condition.

30I finds the flight path; 30D/30E execute flight movement.

## 19.1 Perch/Landing

Perch markers are semantic targets.

A bird cannot "arrive" at a perch until:

- approach volume valid;
- perch free/reserved;
- landing profile valid;
- physical movement controller completes landing.

# 20. Aquatic Navigation Boundary

Set 26 remains aquatic movement owner pending XSI-30-001.

30I may request an aquatic path provider for a swimmer/amphibious mover, but it must not implement a duplicate swim/current solver.

Mixed land/water movers use explicit transfer boundaries.

# 21. Goal Resolution and Arrival Contracts

## 21.1 Semantic Goals

Targets may be:

- exact transform;
- room;
- workstation use point;
- bed;
- guard post;
- storage access point;
- dialogue approach;
- combat region;
- route node;
- vehicle seat;
- loading bay;
- structure perimeter;
- follow anchor.

## 21.2 Arrival

Arrival is not centre-point equality.

An arrival profile specifies:

- accepted radius/volume;
- facing requirement;
- stance;
- line of sight if required by owner;
- interaction marker;
- reservation state;
- movement mode;
- velocity tolerance.

# 22. Steering, Acceleration and Path Following

The path executor converts path/corridor into desired movement.

It must respect the mover controller's acceleration/turning physics.

## 22.1 No Path-Spline Teleport

The AI cannot set its transform directly to the next path point.

It sends movement intent to the specialist controller.

## 22.2 Look-Ahead

Use short path look-ahead to:

- smooth corners;
- reduce zig-zag;
- anticipate doors;
- slow for turns;
- align to ladder/lift entries.

# 23. Dynamic Obstacles and Local Avoidance

Local avoidance handles short-lived obstacles:

- NPCs;
- players;
- creatures;
- movable carts;
- construction workers;
- temporary debris.

Avoidance may alter the local line within the valid corridor.

It cannot cross an inaccessible wall to avoid another NPC.

# 24. Crowds, Queues and Dense Settlement Movement

Large settlements need scalable crowd behaviour.

## 24.1 Crowd Rules

- avoid perfect personal-space simulation for every NPC;
- use local separation and corridor flow;
- use queues for single-use interaction points;
- reserve narrow doors/ladders;
- reduce update frequency for low-priority movers;
- allow cosmetic animation LOD independently.

## 24.2 Queue Providers

Examples:

- market counter;
- gate;
- ladder;
- lift;
- workstation;
- healer;
- ferry/rail boarding;
- warehouse loading point.

The service owner decides queue priority; 30I owns physical queue positions.

# 25. Reservation Architecture

Reservations prevent impossible simultaneous use.

Reservation targets include:

- ladder path;
- rope;
- narrow door;
- one-person ledge;
- elevator capacity;
- vehicle seat;
- driver seat;
- mount seat;
- loading bay;
- single-lane bridge;
- workstation interaction point;
- perch.

## 25.1 Reservation Lifecycle

```text
Requested
-> Granted / Queued / Denied
-> Approaching
-> Occupied
-> Releasing
-> Released
```

Reservations have timeouts and owner death/unload cleanup.

# 26. Narrow Passages, Doors, Bridges and Single-Lane Resources

Movement conflicts use:

- direction;
- priority;
- queue;
- available pull-off;
- reservation age;
- emergency policy;
- mover size.

A heavy wagon already committed to a narrow bridge should not meet another heavy wagon halfway unless the bridge profile explicitly permits passing.

# 27. Deadlock Detection and Resolution

Deadlock examples:

- two NPC groups meet in one-tile corridor;
- wagon and pedestrian crowd block gate;
- two vehicles wait for each other to reverse;
- companion blocks player's doorway;
- work queue blocks path.

Resolution ladder:

1. local yield;
2. temporary priority;
3. step to pull-off/wait point;
4. reverse/reposition;
5. release/re-request reservation;
6. local replan;
7. group-level replan;
8. escalate movement failure to intent owner.

No deadlock resolution teleports actors through each other.

# 28. Stuck Detection and Recovery

A mover is potentially stuck when:

- path progress remains below threshold;
- movement intent exists;
- controller reports repeated obstruction;
- target has not changed;
- no valid wait reason exists.

## 28.1 Recovery Ladder

1. refresh immediate obstacle;
2. recompute short corridor;
3. adjust avoidance;
4. retry interaction link;
5. local replan;
6. return to last valid node;
7. request high-level replan;
8. fail intent with reason.

Safe-position teleport is an exceptional recovery, not routine AI navigation.

# 29. Dynamic Voxel Edits and Path Invalidation

Examples:

- player places wall across path;
- door is built;
- bridge collapses;
- mine tunnel opens;
- ladder removed;
- construction stage changes room access.

Nav revisions mark affected data dirty.

Active movers:

- validate next corridor section;
- continue unaffected portion;
- replan before reaching invalid section.

# 30. Path Replanning and Fallback Policies

Replan policy may be supplied by the intent owner:

- immediate;
- wait-first;
- retry-after-delay;
- alternative route;
- abandon task;
- ask for help;
- emergency override.

30I decides physical path validity; the caller decides whether the task remains worth pursuing.

# 31. Formation Intent Boundary with Set 28

Set 28 owns formation **behavioural intent** where companions/social groups are involved.

Examples:

- Follow loosely;
- Tight party;
- Wedge;
- Column;
- Protect leader;
- Stay behind;
- Spread out;
- Passenger grouping.

30I does not choose these for social reasons.

It receives a formation-intent record and determines whether/how it can be physically realised.

# 32. Formation Spatial Execution

## 32.1 Formation Slot Plan

30I converts formation intent into dynamic spatial slots relative to:

- leader;
- route direction;
- corridor width;
- mover sizes;
- terrain;
- combat/action constraints.

## 32.2 Compression

When a corridor is narrow:

- wedge may compress to two columns;
- two columns may compress to single file;
- formation returns toward intent when space widens.

This changes spatial execution, not the Set 28 formation preference.

## 32.3 Invalid Slots

A slot may be temporarily invalid due to:

- wall;
- cliff;
- vehicle;
- hazard;
- water;
- another mover.

30I resolves to nearest valid slot or falls back to follow corridor.

# 33. Companion Following

Companion follow movement needs to feel useful rather than fragile.

## 33.1 Follow Anchor

A dynamic follow target is computed from:

- leader position;
- leader movement direction;
- formation slot;
- route corridor;
- interaction state;
- companion footprint.

## 33.2 Follow Distance Bands

Suggested:

- Close;
- Normal;
- Loose;
- Regroup.

Exact social preference comes from Set 28.

## 33.3 Regroup

If a companion falls behind:

- use route/path catch-up;
- select valid traversal links;
- wait for lift/door;
- request 30H replan if separated regionally.

No routine teleport to player.

## 33.4 Exceptional Recovery

A game/world setting may allow companion-safe relocation after extreme unrecoverable separation, but this must be an explicit recovery rule with visible safeguards against bypassing locked areas.

# 34. Parties, Escorts and Group Corridor Movement

Group movement may use a shared corridor with individual local paths.

Benefits:

- fewer duplicate long-distance searches;
- better formation coherence;
- shared route invalidation;
- controlled regrouping.

Individual movers still validate:

- body size;
- capability;
- permission;
- current state.

# 35. Herds, Flocks, Packs and Creature Groups

Creature AI owns herd/flock/pack intent.

30I owns physical group motion.

## 35.1 Herd/Packs

Use:

- leader/centroid corridor;
- separation;
- cohesion;
- local obstacle avoidance;
- individual capability checks.

## 35.2 Flocks

Flying groups may use:

- shared volume corridor;
- local separation;
- altitude band;
- perch/landing capacity.

## 35.3 Large Creatures

A dragon flock and bird flock should not share identical avoidance radii.

Profiles remain data-driven.

# 36. Convoys, Wagons and Mixed-Mover Groups

30F owns physical convoy vehicle execution.

30I supplies navigation support:

- corridor/path to next route node;
- reservations;
- local turn feasibility;
- mixed pedestrian/mount/vehicle group coordination;
- gate/bridge queues.

The convoy controller remains the vehicle-group mover.

# 37. Passenger, Rider and Seat Synchronisation

Seat/attachment positions are authoritative semantic anchors.

## 37.1 Attached Passenger

While attached:

- passenger movement controller is suspended/redirected;
- passenger transform derives from authoritative seat frame plus allowed local presentation offset;
- passenger does not independently collide as a walking mover unless the vehicle profile requires it;
- dismount returns to a validated movement state.

## 37.2 Network

Server owns:

- seat occupancy;
- attach/detach;
- vehicle/mount transform;
- passenger movement state.

Clients interpolate presentation.

## 37.3 Set 28 Boundary

Set 28 supplies who is assigned/permitted.

30I/30E/30F validate attachment and synchronise movement.

# 38. Work, Construction and Settlement Navigation

Work AI may request semantic destinations:

- workstation;
- construction cell/batch;
- warehouse bay;
- farm plot;
- mine face;
- bed;
- home;
- guard post.

30I resolves valid use points.

## 38.1 Work Marker Occupancy

A job marker can expose:

- worker capacity;
- approach slots;
- tool stance;
- item-transfer point;
- reservation profile.

Job system owns task progress.

# 39. Patrol, Emergency and Combat-Movement Handoffs

## 39.1 Patrol

Governance/AI supplies patrol route/region.

30I executes it and reports blocked sections.

## 39.2 Emergency

Emergency systems may request high-priority movement using emergency routes/reservations.

They do not gain collision immunity.

## 39.3 Combat

Combat AI supplies tactical movement goals such as:

- approach;
- retreat;
- flank region;
- hold position;
- pursue;
- reach cover.

30I finds/executes physical path.

Combat owns target evaluation, cover value and attack choice.

# 40. Navigation Knowledge and Route Information Boundary

Local pathfinding may know loaded physical geometry even if the player does not.

However, high-level destination selection and route knowledge must respect the owning actor's knowledge model.

A wild animal can know its home range.

A villager can know settlement roads.

A companion may inherit shared party route knowledge through Set 28.

30I consumes authorised route-plan/knowledge inputs and does not manufacture omniscient social knowledge.

# 41. Near Simulation Navigation

Near players:

- full path execution;
- collision;
- traversal links;
- doors/gates;
- avoidance;
- reservations;
- visible movement;
- specialist physics.

Priority is highest for:

- combat;
- companions;
- bosses;
- current interaction;
- important work/event actors.

# 42. Medium-Range Reduced Navigation

At medium range:

- corridor/path following;
- lower steering update rate;
- simplified avoidance;
- fewer IK/animation updates;
- preserved movement state;
- event-driven door/transition handling.

A mover still cannot cross invalid geometry.

# 43. Far/Abstract Movement Simulation

Far movers use:

- 30H route/journey records;
- settlement/local route summaries;
- scheduled movement transitions;
- coarse location nodes;
- deterministic time progression.

No per-frame steering.

## 43.1 Far Local Tasks

A villager moving between home and workplace inside an unloaded settlement may resolve as a scheduled location transition if:

- route remains valid;
- job/simulation owner authorises the task;
- no event requires promotion.

# 44. Promotion and Demotion Between LODs

## 44.1 Demotion

Capture:

- stable entity ID;
- current semantic location;
- route/journey reference;
- current leg/node;
- movement mode;
- attachments;
- important reservation state;
- last valid physical transform if retained;
- velocity band where consequential.

## 44.2 Promotion

Reconstruct:

- local navigation region;
- valid position on current route/location;
- mover profile;
- attachments;
- movement target;
- animation/presentation state.

Do not reconstruct inside new blocks or closed doors.

# 45. Persistent Entity Location Model

Persistent location should support:

- exact transform when loaded/recent;
- structure/room marker;
- route node/segment progress;
- settlement location;
- region;
- realm;
- vehicle/mount attachment;
- journey.

A named NPC is not "nowhere" because its actor is unloaded.

# 46. Save/Load and Movement Reconstruction

Save movement records include only consequential state.

Persist:

- entity ID;
- movement profile;
- semantic location;
- exact transform where useful;
- route/path/journey reference;
- movement mode;
- attachment;
- current goal reference if owner persists it;
- last valid safe position/node;
- LOD state;
- movement revision.

Do not persist:

- transient avoidance vector;
- individual navmesh polygon handles;
- animation foot phase;
- raw physics contacts;
- stale local path arrays if cheaper/safer to rebuild.

# 47. Multiplayer Authority Model

Server/host is authoritative for:

- NPC movement goal acceptance;
- path/traversal commit;
- movement controller state;
- position/velocity;
- door/traversal reservations;
- mount/vehicle attachment;
- formation spatial plan where consequential;
- LOD state;
- arrival/failure result.

Clients do not run authoritative AI movement.

# 48. NPC Movement Replication and Interpolation

NPC replication sends state appropriate to relevance.

Near:

- transform;
- velocity;
- movement mode;
- stance/gait;
- current traversal action;
- attachment;
- key action/reason state.

Farther:

- lower-rate transform;
- simplified movement intent;
- semantic animation state.

Very far:

- no actor replication; world/journey summaries only where UI requires them.

# 49. Prediction, Reconciliation and Player-Controlled Shared Movers

AI-controlled NPCs generally use interpolation rather than client prediction.

Prediction is required when a local player controls:

- mount;
- wagon;
- powered vehicle;
- shared movement body.

30E/F/G define local controller prediction; 30I supplies common sequence/reconciliation infrastructure.

# 50. Relevance, Network LOD and Bandwidth Budgets

Movement replication priority considers:

- distance;
- visibility;
- combat relevance;
- companion status;
- boss/event pin;
- player-controlled mover;
- passenger attachment;
- interaction;
- high-speed movement.

Not every villager requires 20+ movement updates per second at all times.

# 51. Reconnection and Ownership Transfer

On client reconnect:

- server sends current authoritative mover/attachment state;
- local interpolation history resets safely;
- controlled mount/vehicle authority is re-established only after permission validation.

On driver/controller transfer:

- old controller input stops;
- server changes control owner;
- prediction sequence resets;
- vehicle physical state remains continuous.

# 52. Determinism, Seeds and Replayable Movement Evidence

Navigation should be reproducible enough for tests and distant simulation.

Deterministic inputs include:

- navigation revision;
- mover profile;
- route plan;
- goal;
- world state;
- reservation state;
- simulation tick.

Local avoidance may have bounded deterministic tie-breakers to avoid chaotic network divergence.

# 53. Navigation Performance Budgets and Scheduling

## 53.1 Budget Classes

- Critical: player-adjacent combat/companion/boss.
- High: visible work/interaction.
- Normal: ordinary local NPCs.
- Low: distant/occluded background movers.
- Abstract: no local pathfinding.

## 53.2 Search Scheduling

Path requests use:

- priority queues;
- per-frame/per-tick budgets;
- request coalescing;
- corridor sharing;
- cache by mover-profile/revision;
- cancellation of stale requests.

## 53.3 Repath Rate

AI should not recompute full paths every frame.

Repath on:

- meaningful goal movement;
- invalidation;
- stuck state;
- significant corridor obstruction;
- timed refresh for dynamic targets.

# 54. Failure Containment and Safe Recovery

Navigation failure must not corrupt save/world state.

Possible outcomes:

- wait;
- retry;
- local replan;
- return to valid node;
- high-level replan;
- notify caller;
- safe recovery under explicit exceptional rule.

A failed worker path should block/delay its task rather than mark the work complete.

# 55. UI, Debugging and Developer Visibility

Player-facing UI is minimal.

Developer tooling should expose:

- movement goal;
- route plan;
- local path/corridor;
- mover profile;
- path cost;
- active reservation;
- avoidance vector;
- stuck timer;
- nav revision;
- formation slot;
- LOD state;
- network relevance;
- last movement failure.

# 56. Accessibility and Companion-Movement Assistance

Set 28/17 may offer player-facing companion assistance options such as:

- wider follow distance;
- avoid traversal-heavy routes;
- prefer stairs/lifts over climbing;
- stronger regroup behaviour;
- prevent companion body-blocking near player;
- companion wait command;
- accessible route preference.

30I executes these as route/formation constraints.

It does not change social willingness or physical capability.

# 57. Registry and Data Definitions

## 57.1 NavigationProfile Runtime Reference

Qualified examples:

- `navigation.profile.humanoid.standard`
- `navigation.profile.quadruped.medium`
- `navigation.profile.spider.climber`
- `navigation.profile.bird.small_flight`
- `navigation.profile.wagon.standard`
- `navigation.profile.mount.ground_large`

## 57.2 Core Definition Families

- `NavigationProfileDefinition`
- `PathCostProfile`
- `ArrivalProfile`
- `ReservationProfile`
- `FormationSpatialProfile`
- `AvoidanceProfile`
- `NavigationLODProfile`
- `NetworkMovementProfile`
- `StuckRecoveryProfile`

# 58. Balance-Draft Navigation Budgets and Thresholds

These are starting targets for profiling, not final production locks.

## 58.1 Local Path Search

| Class | Initial Target |
| --- | ---: |
| Critical mover path response | normally < 1-2 physics frames for short local query |
| High-priority path result | target < 100 ms wall time through queued async work |
| Normal background request | may queue across several frames |
| Full path recompute cadence | event-driven; avoid < 0.25 s repeated full searches except critical cases |
| Dynamic-target micro-correction | 5-10 Hz steering target refresh where needed |
| Near avoidance | 10-20 Hz logical update, presentation every frame |
| Medium avoidance | 2-5 Hz or corridor-only |
| Far | no local avoidance |

## 58.2 Stuck Detection Starting Bands

| Mover | Potential Stuck Window |
| --- | ---: |
| Humanoid/companion | ~1.0-1.5 s without expected progress |
| Large creature | ~1.5-2.0 s |
| Mount | ~1.5-2.0 s |
| Cart/wagon | ~2.0-3.0 s |
| Guided transport | provider-specific; usually explicit blocked state |

Do not classify legitimate queue/wait states as stuck.

## 58.3 Formation

| Parameter | Starting Target |
| --- | --- |
| Formation slot update | ~5-10 Hz near players |
| Corridor compression | event-driven by width/obstacle |
| Companion route replan | after meaningful leader separation/corridor invalidation |
| Regroup threshold | profile/intention driven; initial common band ~8-15 m local separation |
| Emergency separation | request 30H replan after region/route disconnect, not immediate teleport |

# 59. Godot/Summer Engine Implementation Direction

## 59.1 Recommended Services

```text
NavigationWorldService
NavigationProfileResolver
LocalPathService
TraversalLinkRegistry
InteractiveNavLinkService
ReservationService
MovementIntentAdapter
PathExecutionService
SteeringAvoidanceService
FormationSpatialService
CompanionFollowAdapter
NavigationLODService
MovementPersistenceService
MovementNetworkService
NavigationDebugService
```

## 59.2 Godot Navigation Use

Godot `NavigationServer3D` / navigation regions may be used where appropriate for ordinary traversable surfaces.

Project-owned services remain responsible for:

- dynamic voxel invalidation;
- navigation-profile filtering;
- traversal links;
- exact interactive door/gate state;
- vehicle corridors;
- formation/reservation rules;
- route-plan handoff;
- persistence;
- LOD.

Do not allow an engine navmesh to become the source of truth for whether a dynamic voxel doorway exists.

## 59.3 Asynchronous Pathing

Path searches should run through bounded async/job queues where thread-safe.

Main-thread commit validates:

- navigation revision;
- mover profile revision;
- goal revision;
- world state.

A completed stale search is discarded/requeued.

## 59.4 Chunk/Region Integration

Each active chunk/structure can contribute navigation products.

Products register/unregister through stable region IDs.

Cross-chunk paths use boundary portals/links rather than merging the whole world into one giant mesh.

## 59.5 Movement Execution

Path executor drives the specialist movement controller through desired movement/transition requests.

It never directly edits the mover transform except explicit safe-recovery operations.

# 60. Prototype Laboratories and Acceptance Tests

## 60.1 Humanoid Voxel Lab

Test:

- flat ground;
- stairs;
- slabs;
- doors;
- narrow corridor;
- one-block jump requirement;
- unreachable two-block wall.

NPC and player-capability expectations should agree.

## 60.2 Dynamic Build Lab

While NPC path active:

- place wall;
- remove wall;
- build door;
- destroy bridge;
- place ladder.

Verify bounded invalidation and replan.

## 60.3 Traversal-Link Lab

NPC profiles with/without:

- ladder;
- climb;
- rope;
- mantle.

Verify path availability changes by capability.

## 60.4 Diverse Body Lab

Use:

- humanoid;
- pig;
- spider;
- centipede;
- bird;
- dragon.

Verify no shared humanoid-only assumptions.

## 60.5 Worksite Lab

Workers reach:

- warehouse;
- construction stage;
- workstation;
- bed.

Occupancy/reservations prevent stacking.

## 60.6 Crowd Lab

Populate a market/street with:

- 20;
- 50;
- 100+ background movers.

Verify budget degradation without broken authority.

## 60.7 Formation Lab

Companions follow player through:

- open field;
- gate;
- corridor;
- stairs;
- bridge;
- ladder transition.

Formation compresses and restores.

## 60.8 Companion Separation Lab

Close gate behind player, destroy bridge, take elevator.

Companion:

- waits/replans;
- uses available route;
- reports separation;
- does not teleport through locked geometry.

## 60.9 Vehicle/Convoy Lab

Mixed wagon/pedestrian convoy passes:

- road;
- single-lane bridge;
- settlement gate;
- loading yard.

Verify reservation/queue coordination.

## 60.10 Flying Lab

Bird and flying mount navigate:

- trees;
- towers;
- cave opening;
- perch;
- landing field.

Local flight path remains separate from ground nav.

## 60.11 LOD Lab

Named NPC:

- visible physical movement;
- medium reduced movement;
- far journey/settlement movement;
- save;
- time advance;
- reload;
- promotion.

Identity/location/task truth must survive.

## 60.12 Multiplayer Lab

Two clients observe:

- 20+ NPCs;
- companion party;
- vehicle passengers;
- player-driven wagon;
- mount.

Verify server authority and smooth relevance-scaled replication.

## 60.13 Deadlock Lab

Create:

- opposite-direction narrow corridor;
- ladder queue;
- wagon gate conflict;
- crowded workstation queue.

Verify deterministic recovery.

## 60.14 Performance Lab

Profile:

- path requests per frame;
- nav rebuilds after voxel edit;
- avoidance cost;
- formation cost;
- replication bandwidth;
- promotion/demotion spikes.

# 61. Handoff to 30J

30J receives the completed runtime contracts for:

- movement intent;
- navigation profile;
- local path query/result;
- traversal/transport link use;
- reservation;
- formation spatial plan;
- movement LOD;
- persistent movement state;
- multiplayer movement snapshots;
- failure/reason codes;
- performance budgets;
- cross-set amendments.

30J will reconcile these with the full Set 30 registries and validation matrices.

# 62. Main-Document Integration Register

| Existing Document | Required Integration |
| --- | --- |
| 07 | NPC jobs/schedules submit movement intent and consume arrival/failure; no direct teleport movement. |
| 08 | Hauler/golem/logistics intent uses navigation execution and LOD route evidence. |
| 10 | Creature AI retains behavioural intent; navigation profile + Set 30 movement execute it. |
| 11 | Worldgen supplies topology/nav products and invalidation signals. |
| 12/19/20 | Structure/Blueprint markers supply doors, work points, paths, vertical links and route revisions. |
| 15 | Escort/travel objectives consume authoritative mover/journey state. |
| 16 | Combat requests tactical destinations/movement locks; Set 30 executes physical motion. |
| 17 | UI consumes movement/companion/route reasons; no client-invented movement state. |
| 18/current technical plan | General AI/navigation/network/persistence architecture points to 30I as movement execution owner. |
| 20C | Patrol/emergency intents consume route/navigation execution. |
| 22H | Navigation profiles remain Forge-authored capability/footprint data; 30I owns route generation/validation. |
| 25 | Navigation IDs, schemas, validation and migration enter governance. |
| 26 | Aquatic/vessel movement remains delegated through explicit providers. |
| 27 | Trade/economy actors submit travel missions and consume movement evidence. |
| 28 | Social/companion/formation intent is external; 30I owns spatial execution. |
| 29 | Movement modifiers/restrictions are external; 30I consumes them. |
| 30B-H | Specialist movement and high-level route services are consumed, not duplicated. |

# 63. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward; pending explicit approval.

30I delegates aquatic path execution to the aquatic owner and does not duplicate swimming/current movement.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Carried forward.

NPC path execution consumes Set 29 movement restrictions/modifiers exactly as player/mount movement does where biological actors are covered. Navigation can use the non-mutating estimate mode from 30H for route scoring.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** Refined in 30I; no ownership transfer.

Set 28 should expose an explicit formation-intent record:

```text
formation_intent_id
group_id
leader_ref
member_refs[]

formation_style
spacing_preference
leader_position_preference
role_slot_preferences{}
compression_allowed
split_allowed
regroup_policy
follow_distance_band
priority/urgency
social_reason_ref?

revision
```

Set 30 returns a physical spatial result:

```text
formation_spatial_plan_id
formation_intent_id
assigned_slots{}
current_shape
compression_state
corridor_width_required
separated_member_refs[]
blocked_member_refs[]
regroup_target?
reason_codes[]
navigation_revision
```

Set 28 owns **why** the formation was chosen and whether a member participates. Set 30 owns whether the requested arrangement can fit and how it moves through the world.

## XSI-30-004 - Environmental Movement Field Contract

**Status:** Carried forward.

Navigation may incorporate authoritative wind/gravity/environment fields into flying, gliding and other movement route execution.

## XSI-30-005 - Set 29 Fall Impact Consequence Contract

**Status:** Carried forward; no new change.

## XSI-30-006 - Set 28 Ride Permission and Seat Assignment Contract

**Status:** Carried forward and consumed by passenger synchronisation.

Set 30 validates/executes seat attachment only after Set 28 or the appropriate permission owner supplies an authorised assignment.

## XSI-30-007 - Aquatic Mount Riding Boundary

**Status:** Carried forward.

## XSI-30-008 - Set 27 Terrestrial Caravan Movement Execution Contract

**Status:** Carried forward.

30I executes local portions of route/convoy movement and consumes 30H/30F plans; Set 27 retains mission economics.

## XSI-30-009 - Automation Power, Control and Transport Readiness Contract

**Status:** Carried forward.

Navigation uses lift/rail/powered-service readiness when resolving transport links.

## XSI-30-010 - Set 27 Guided Freight and Passenger Service Interface

**Status:** Carried forward.

No change.

## XSI-30-011 - Universal Route Knowledge and Confidence Interface

**Status:** Carried forward.

30I consumes only authorised route knowledge appropriate to the actor/group and does not manufacture social/world knowledge.

## XSI-30-012 - External AI Movement Intent Contract

**Status:** New interface requirement; no ownership transfer.

**Reason:** NPC Village, Creatures, Combat, Quests, Automation and Social systems need one stable way to request movement without each implementing its own pathfinding or writing transforms.

### External Owner -> Set 30

```text
movement_intent_id
request_owner
requester_entity_or_group_ref

goal_type
goal_ref_or_region
arrival_profile_id

urgency
route_policy_ref?
formation_intent_ref?
allowed_movement_modes[]
forbidden_movement_modes[]

wait_policy
replan_policy
failure_policy
expiry_or_cancel_condition

knowledge_context_ref?
permission_context_ref?
task_or_action_ref?

revision
```

### Set 30 -> External Owner

```text
movement_intent_id
movement_status
resolved_goal_ref
route_plan_ref?
local_path_ref?

current_movement_mode
current_location_summary
estimated_arrival?
arrival_confidence?

waiting_reason?
failure_reason_codes[]
blocked_resource_refs[]
replan_state

authoritative_revision
```

### Constraint

The request owner determines the goal, urgency and task meaning. Set 30 determines physical reachability and movement execution. A movement failure must be returned to the caller rather than silently completed.

## XSI-30-013 - Movement LOD Promotion/Demotion Contract

**Status:** New interface requirement for technical/simulation integration; no gameplay ownership transfer.

**Reason:** Persistent NPC and transport systems already use near/medium/far simulation, but Set 30 needs one shared movement-specific payload so actors can promote/demote without teleporting or losing attachments.

### Detailed -> Reduced/Far

```text
entity_or_group_ref
movement_profile_ref
semantic_location
route_or_journey_ref?
current_leg_or_node?
movement_mode
velocity_band?
attachment_refs[]
reservation_refs_to_preserve[]
last_valid_transform?
safe_position_ref?
movement_goal_ref?
navigation_revision
timestamp
```

### Reduced/Far -> Detailed

```text
requested_spawn_or_route_position
required_navigation_region
movement_profile_ref
movement_goal_ref?
attachment_state
expected_movement_mode
environment_context_ref?
route_revision
```

Set 30 validates a physical reconstruction position before promotion. The Simulation/Persistence owner remains responsible for when promotion/demotion occurs globally and for non-movement simulation state.

# 64. Open Decisions and Deferred Questions

1. Final balance between Godot navmesh and project-owned voxel/cell navigation for destructible terrain.
2. Whether humanoid local navigation uses one shared profile graph with clearance filtering or several baked size classes.
3. Final chunk navigation tile size and rebuild granularity.
4. Whether stair/slab traversal is encoded directly in nav surfaces or through explicit micro-links.
5. Final local-path cache policy across different mover profiles.
6. How much route sharing is safe between companions with different capabilities.
7. Final avoidance implementation: Godot avoidance, project RVO-like solver or hybrid.
8. Final crowd density at which individuals switch from full avoidance to corridor flow.
9. Whether ordinary NPCs can temporarily pass through one another at very low-priority distant visual LOD; recommendation is no near players, possibly tightly controlled presentation overlap at low fidelity.
10. Final door reservation queue policy.
11. Whether NPCs can open player-built doors automatically based on permissions or require explicit structure interaction capability.
12. Final ladder/rope queue capacity.
13. Whether climbing companions can use grapple-created temporary links.
14. Final behaviour when one formation member lacks a traversal capability the leader uses.
15. Whether formation splitting is permitted by default or only when Set 28 intent allows it.
16. Exact companion regroup distances.
17. Whether exceptional companion-safe relocation exists at all; recommendation is setting-controlled and heavily constrained if implemented.
18. Final creature flock/herd solver complexity.
19. Whether large boss movers pin navigation regions/LOD beyond normal budgets.
20. Final flying navigation volume representation.
21. Final integration of burrowing movers if player-visible burrowing becomes production content.
22. Final aquatic navigation provider interface after XSI-30-001 resolution.
23. Final path search thread/job architecture in Godot.
24. Final authoritative tick rates for different movement-LOD classes.
25. Final network snapshot rates per relevance class.
26. Whether remote clients simulate cosmetic local avoidance between authoritative snapshots.
27. Final save rule for actors currently in traversal/transport links.
28. Whether local path arrays are ever persisted for deterministic debugging or always rebuilt.
29. Final deterministic tie-break strategy for queues/deadlocks.
30. Whether settlement crowd routing needs district-level flow fields at city/metropolis scale.
31. Final implementation of emergency priority through crowded gates/roads.
32. Approval/finalisation of XSI-30-003.
33. Approval/finalisation of XSI-30-012.
34. Approval/finalisation of XSI-30-013.
35. Final simulation ownership boundary for draft-animal biological availability with Set 29/creature systems.

# Appendix A. Movement Intent Contract

```text
MovementIntent
movement_intent_id
request_owner
requester_ref

goal_type
goal_ref_or_region
arrival_profile_id

urgency
route_policy_ref?
formation_intent_ref?
allowed_movement_modes[]
forbidden_movement_modes[]

wait_policy
replan_policy
failure_policy
expiry_or_cancel_condition

knowledge_context_ref?
permission_context_ref?
task_or_action_ref?

created_tick
revision
```

# Appendix B. Navigation Profile Runtime Snapshot

```text
NavigationProfileSnapshot
entity_or_mover_ref
navigation_profile_id

footprint
height
clearance_class
turn_radius_or_turn_class
step_height
stable_slope

ground_capabilities[]
traversal_capabilities[]
flight_capabilities[]
transport_capabilities[]

door_gate_classes[]
bridge_classes[]
formation_footprint

current_speed_band
current_movement_modifiers[]
hard_restrictions[]

source_definition_revision
external_state_revision
```

# Appendix C. Local Path Request and Result

```text
LocalPathRequest
request_id
mover_ref
navigation_profile_snapshot_id

origin
goal
arrival_profile_id
route_corridor_ref?

allowed_transition_classes[]
route_policy_ref?
urgency

navigation_revision
permission_context_ref?
knowledge_context_ref?
```

```text
LocalPathResult
request_id
status

corridor_ref
ordered_path_points_or_cells[]
transition_link_refs[]
interactive_link_refs[]
reservation_requirements[]

estimated_local_time
local_cost
confidence

hard_blockers[]
reason_codes[]

navigation_revision
profile_revision
```

# Appendix D. Traversal Link Runtime Record

```text
NavigationTransitionLink
link_id
link_type
provider_ref

entry_anchor
exit_anchor
directionality

required_capabilities[]
supported_navigation_profiles[]
reservation_profile_id?

expected_duration
expected_cost
current_state
permission_ref?

provider_revision
navigation_revision
```

# Appendix E. Formation Intent and Spatial Plan

```text
FormationIntent
formation_intent_id
group_id
leader_ref
member_refs[]
formation_style
spacing_preference
role_slot_preferences{}
compression_allowed
split_allowed
regroup_policy
follow_distance_band
revision
```

```text
FormationSpatialPlan
formation_spatial_plan_id
formation_intent_id
leader_ref
slot_assignments{}
current_shape
compression_state
corridor_width_required
group_bounds

separated_member_refs[]
blocked_member_refs[]
regroup_target?

navigation_revision
revision
```

# Appendix F. Movement Reservation Template

```text
MovementReservation
reservation_id
resource_ref
resource_type

requester_ref
group_ref?
priority
direction?

requested_time
granted_time?
expiry_time
state

capacity_units
occupied_units
queue_position?

reason_codes[]
revision
```

# Appendix G. Persistent Entity Movement Record

```text
PersistentMovementRecord
entity_ref
movement_profile_ref

semantic_location
exact_transform?
velocity_band?

movement_mode
movement_state_summary

route_plan_ref?
journey_ref?
current_route_leg?
current_route_node?
segment_progress?

attachment_refs[]
important_reservation_refs[]

movement_goal_ref?
last_valid_transform?
safe_position_ref?

lod_state
navigation_revision
movement_revision
last_simulation_time
```

# Appendix H. Network Movement Snapshot

```text
MovementNetworkSnapshot
server_tick
entity_ref

position
rotation
velocity

movement_mode
movement_state
gait_or_speed_band
stance?

active_transition_link?
attachment_ref?
seat_ref?

formation_spatial_plan_ref?
movement_goal_status?

network_lod_class
movement_revision
reason_codes[]
```

# Appendix I. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| navigation.goal.invalid | Requested movement goal cannot be resolved. | Set 30 |
| navigation.no_data | Required local navigation data unavailable/not ready. | Set 30 |
| navigation.no_path | No valid physical path found. | Set 30 |
| navigation.capability.blocked | Mover lacks required locomotion capability. | Set 30/profile |
| navigation.permission.blocked | Route requires permission not granted. | Permission owner |
| navigation.route.invalidated | Active route/path evidence changed. | Set 30 |
| navigation.wait.reservation | Waiting for constrained movement resource. | Set 30 |
| navigation.wait.service | Waiting for door/lift/transport provider. | Provider + Set 30 |
| navigation.stuck | Mover failed to make expected progress. | Set 30 |
| navigation.deadlock | Multiple movers/resources are mutually blocking. | Set 30 |
| navigation.replan | Current path replaced by new valid path. | Set 30 |
| navigation.arrived | Arrival profile satisfied. | Set 30 |
| navigation.intent.cancelled | Request owner cancelled movement. | External owner |
| formation.slot.blocked | Desired formation slot currently invalid. | Set 30 |
| formation.compressed | Formation spatially compressed by corridor. | Set 30 |
| formation.member.separated | Member no longer on shared local corridor. | Set 30 |
| companion.regroup.required | Companion requires route/follow recovery. | Set 30 + Set 28 intent |
| movement.lod.demoted | Detailed mover converted to reduced/far representation. | Set 30/Simulation |
| movement.lod.promoted | Detailed mover reconstructed. | Set 30/Simulation |
| movement.recovery.safe_position | Exceptional safe recovery applied. | Set 30 |
| movement.network.corrected | Client presentation reconciled to authority. | Set 30 networking |

# Appendix J. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Intent Boundary | AI chooses destination/task; Set 30 alone validates and executes movement. |
| Shared World Rules | NPC cannot traverse geometry/capability barriers the same profile would reject for a player-controlled mover. |
| Forge Boundary | Navigation profiles/markers are consumed; Forge does not own route generation. |
| Dynamic Voxels | Build/break edits invalidate bounded nav regions and active paths replan safely. |
| Traversal | NPCs use only capability-valid ladder/climb/rope links with reservations. |
| Doors/Gates | Permission/state remains external; movement waits/requests rather than bypassing. |
| Diverse Bodies | Humanoid, quadruped, spider, segmented creature and flyer use data-driven navigation profiles. |
| Formation Boundary | Set 28 chooses formation intent; 30I compresses/realises it physically. |
| Companion Follow | Companions route/regroup without routine teleport through locked geometry. |
| Work Navigation | Jobs complete only after authoritative arrival/use-point access. |
| Crowds | Dense settlement movement degrades through budgets rather than authority failure. |
| Deadlocks | Narrow-space conflicts resolve through deterministic yield/replan/failure ladder. |
| Route Handoff | 30H handles regional route; 30I handles local execution. |
| Vehicle Handoff | 30F/30G control vehicle physics; 30I supplies navigation corridors/reservations. |
| Aquatic Boundary | 30I delegates aquatic movement to Set 26 provider. |
| LOD | Near/medium/far movement preserve identity, route truth and attachments. |
| Persistence | Save/unload/time advance/reload reconstructs valid movement position/state. |
| Multiplayer | Server owns AI movement; clients interpolate/relevance-scale rather than author state. |
| Passenger Sync | Riders/passengers remain attached to authoritative seat frames across network/save transitions. |
| Performance | Pathing, avoidance, formation and nav rebuilds respect priority/budget classes. |
| Seed Independence | Navigation operates across procedural worlds without fixed POC geometry. |

# END OF DOCUMENT 30I
