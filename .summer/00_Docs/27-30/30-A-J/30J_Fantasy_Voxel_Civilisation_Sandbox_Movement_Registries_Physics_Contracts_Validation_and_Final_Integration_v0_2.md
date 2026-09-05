# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30J - Movement Registries, Physics Contracts, Validation and Final Integration

Version 0.2 - Final Set Integration, Canonical Schema, API, Validation and Production Governance Draft

A production-oriented consolidation document for Leyforge Document Set 30, freezing the movement-facing data model, runtime contracts, registries, physics boundaries, Movement API semantics, cross-document interfaces, validation suites, multiplayer and persistence contracts, migration strategy, performance budgets, developer tooling, release gates and final cross-set reconciliation requirements for Documents 30A through 30I.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Final Integration Statement**
>
> Document Set 30 is complete only when every mover - player, NPC, creature, mount, cart, wagon, rail vehicle, lift, glider and distant journey - can be described through the same movement vocabulary without erasing the specialist systems that make each mover distinct. 30J therefore freezes shared interfaces and validation rules, not one universal movement implementation. The final system must preserve one authoritative movement truth while allowing different locomotion solvers, world contexts and simulation fidelity levels to coexist safely.

# Document Purpose

Document 30J is the final consolidation and production-governance document for Document Set 30 - Movement, Traversal and Transportation.

Documents 30A through 30I define the movement architecture and specialist domains:

- 30A establishes the movement-system architecture, ownership boundaries, canonical modes, Movement API and simulation principles.
- 30B defines core player locomotion.
- 30C defines climbing, vaulting, mantling, ladders, ropes and grappling.
- 30D defines falling, gliding and environmental aerial movement.
- 30E defines mounts, riding, saddles, harnesses and mounted traversal.
- 30F defines work animals, handcarts, wagons, carriages and physical caravan movement.
- 30G defines rails, minecarts, elevators and powered/guided land transportation.
- 30H defines roads, routes, terrain accessibility and long-distance travel.
- 30I defines NPC navigation, pathfinding, formations, movement networking and movement persistence.

30J does not replace those specialist documents. It provides the final shared contracts that implementations, registries, tools, validation pipelines and future document sets must rely upon. When a specialist rule differs from a shared default because that specialist owns the domain, the specialist remains authoritative. When two documents accidentally duplicate or conflict over a shared field, this document identifies the conflict and assigns a reconciliation action rather than silently selecting a winner.

The governing **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** remains binding. The one-owner-per-gameplay-system rule remains non-negotiable.

# Governing Source and Dependency Register

| Source | Relevant Direction | 30J Treatment |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | One owner per gameplay system; other sets consume interfaces; Set 30 owns movement/traversal/transport but not trade, social AI or survival simulation. | Governing ownership contract for final integration. |
| 25 - Production Governance, Registry Kernel and Capability Contracts | Stable qualified IDs, immutable definitions, generated instances separate from definitions, migration/versioning, capability-based suitability and validation. | Governing registry model for Set 30. |
| 20D - Storage, Roads, Transport, Logistics and Utilities | Physical route infrastructure, route classes, road services, bridges, crossings and logistics infrastructure are structure/settlement-owned. | 30J freezes movement-facing route facets while keeping infrastructure ownership external. |
| 22F / 22H | Animation consumes authorised movement; movement profiles/body plans and semantic contacts are Forge-authored data. | 30J freezes presentation/runtime handoff fields without transferring movement authority to Forge/animation. |
| 26E / 26G | Aquatic movement and vessel systems already own detailed water movement and vessels. | 30J preserves unresolved swimming ownership amendment and explicit maritime handoffs. |
| 27 | Economy/trade/contract systems consume capacity/time/arrival evidence and own prices/profit/contracts. | 30J freezes Set 27 movement interfaces without allowing movement to calculate economics. |
| 28 | Social/companion systems own formation intent, ride/passenger assignment and social permission. | 30J freezes Set 28 intent/permission interfaces while Set 30 owns physical execution. |
| 29 | Survival owns stamina, fatigue, injury, temperature and biological carrying effects. | 30J freezes movement modifier/exertion/impact interfaces while Set 29 remains biological authority. |
| 30A-30I | Complete specialist movement architecture and runtime contracts. | Primary source set consolidated by this document. |

# Static Table of Contents

1. Final Set 30 Identity and Completion Criteria  
2. Ownership Freeze and Non-Transfer Rules  
3. Document 30A-30I Authority Map  
4. Canonical Shared Terminology Freeze  
5. Canonical Movement Modes and State Families  
6. Shared Entity/Mover Identity Model  
7. Immutable Definition Versus Runtime-State Contract  
8. Registry ID Grammar and Namespace Rules  
9. Registry Domain Map for Set 30  
10. Core Movement Definition Registry  
11. Mover Profile Registry  
12. Movement Capability Registry  
13. Stance and Body-Clearance Registry  
14. Traversal Action Registry  
15. Surface, Route and Environment Movement Facets  
16. Mount and Seat Registries  
17. Vehicle and Transport Registries  
18. Hitch, Draft and Convoy Registries  
19. Guided Route, Rail and Lift Registries  
20. Route Planning and Journey Registries  
21. Navigation and Formation Registries  
22. Movement Reason-Code Registry  
23. Movement Event Registry  
24. Movement Command Registry  
25. Movement API Freeze  
26. Shared Query Semantics  
27. Physics Contract: Authoritative Transform and Velocity  
28. Physics Contract: Collision and Clearance  
29. Physics Contract: Grounding, Support and Moving Frames  
30. Physics Contract: Forces, Gravity and Environment  
31. Physics Contract: Traversal Motion  
32. Physics Contract: Mounts, Vehicles and Towing  
33. Physics Contract: Guided Transport and Lifts  
34. Local-to-Distant Simulation Contract  
35. Navigation and Route Contract  
36. Passenger, Rider and Attachment Contract  
37. External Modifier Resolution Contract  
38. Animation, IK, Camera, Audio and VFX Handoff  
39. UI and Accessibility Handoff  
40. Multiplayer Authority Contract  
41. Client Prediction and Reconciliation Contract  
42. Persistence and Reconstruction Contract  
43. Migration and Versioning Rules  
44. Determinism and Seed Independence  
45. Validation Architecture  
46. Definition and Schema Validation  
47. Movement Unit and Physics Tests  
48. Traversal Validation  
49. Mount and Vehicle Validation  
50. Route and Navigation Validation  
51. Multiplayer and Persistence Validation  
52. LOD and Distant Travel Validation  
53. Accessibility and Control Validation  
54. Performance and Scalability Validation  
55. Cross-System Integration Validation  
56. Release-Blocking Defect Catalogue  
57. Production Maturity and Lifecycle States  
58. Debugging, Telemetry and Developer Tooling  
59. Godot/Summer Engine Reference Architecture  
60. Implementation Sequencing and Dependency Gates  
61. POC Regression Protection  
62. Cross-Set Interface Reconciliation Register  
63. Cross-Set Interface Amendments  
64. Final Integration Decisions Still Requiring Approval  
65. Main-Document Amendment Register  
66. Document Set 30 Acceptance Checklist  
67. Final Set 30 Handoff  
Appendix A. Canonical Registry Index  
Appendix B. Canonical Movement API Contract  
Appendix C. Shared Runtime Movement Record  
Appendix D. Mover Profile Schema  
Appendix E. Movement Capability Schema  
Appendix F. Vehicle/Transport Schema  
Appendix G. Route and Journey Schema  
Appendix H. Navigation/Formation Schema  
Appendix I. Physics and Authority Invariants  
Appendix J. Validation Matrix  
Appendix K. Performance Budget Matrix  
Appendix L. Cross-Set Interface Matrix  
Appendix M. Reason-Code Namespace Catalogue  
Appendix N. Release Gate Checklist  

# 1. Final Set 30 Identity and Completion Criteria

Set 30 owns the physical truth of terrestrial/aerial movement, traversal, mounts, land transport, route accessibility, pathfinding interfaces and vehicle physics.

Set 30 is considered architecturally complete when:

- every movement-capable entity can resolve a `MoverProfile`;
- every local movement mode has one owning specialist system;
- external systems can request movement without writing transforms;
- Movement API outputs are queryable without recalculating another system's gameplay rules;
- route and travel planning use physical/movement evidence rather than straight-line teleport assumptions;
- distant movement preserves route truth, identity and cargo/passenger state;
- movement state survives save/load and multiplayer correction;
- dynamic voxel edits invalidate only relevant navigation/route evidence;
- animation and camera remain presentation consumers;
- cross-set interfaces are explicit;
- unresolved ownership conflicts remain visible until approved;
- validation can detect impossible geometry, stale routes, illegal mode transitions, unsupported movement and persistence corruption.

# 2. Ownership Freeze and Non-Transfer Rules

## 2.1 Set 30 Owns

- walking;
- running;
- sprinting;
- crawling;
- climbing;
- vaulting;
- jumping;
- gliding;
- flying mounts;
- land mounts;
- land vehicles;
- wagons;
- carts;
- elevators;
- ladders;
- rope systems;
- rails;
- traversal abilities;
- pathfinding interfaces;
- vehicle physics;
- movement-facing route accessibility;
- movement-facing travel time;
- movement LOD;
- movement networking/persistence integration.

Swimming remains under explicit reconciliation because of the conflict between the Set 27-30 register and approved Document 26E.

## 2.2 Set 30 Never Owns Merely Because Movement Uses It

- trade or pricing;
- caravan profitability;
- social AI;
- loyalty;
- companion willingness;
- passenger social assignment;
- survival simulation;
- stamina regeneration;
- injury severity;
- hunger/thirst;
- weather generation;
- spell costs/meaning;
- animation authorship;
- road construction;
- vehicle crafting recipes;
- inventory ownership.

## 2.3 Interface Rule

When Set 30 requires information from another owner:

1. consume an explicit immutable/read-only snapshot where possible;
2. send movement facts to the owner when consequence must be calculated externally;
3. receive the owner's decision/result;
4. apply only the movement consequence;
5. preserve the external reason/source code.

# 3. Document 30A-30I Authority Map

| Document | Specialist Authority |
| --- | --- |
| 30A | Overall movement architecture, shared mode model, Movement API, common state and LOD principles. |
| 30B | Core player ground locomotion, stance, jump and basic airborne entry. |
| 30C | Traversal actions: vault, mantle, ledge, climb, ladders, ropes and grappling. |
| 30D | Falling, landing physical classification, controlled descent, gliding and environmental aerial movement. |
| 30E | Riding, mounts, seat attachment, tack-facing movement and flying mounts. |
| 30F | Human/draft-powered carts, wagons, carriages, towing and physical convoy movement. |
| 30G | Rails, minecarts, lifts/elevators and powered/guided terrestrial movement. |
| 30H | Route accessibility, effective travel cost, hierarchical route planning and long-distance terrestrial travel. |
| 30I | NPC local pathfinding, movement execution, spatial formations, movement networking and persistence integration. |
| 30J | Shared registry/API/physics contracts, validation, migration and final integration. |

No later Set 30 document may silently override a specialist owner listed above.

# 4. Canonical Shared Terminology Freeze

The following terms are frozen for Set 30 and should be used consistently in code, schemas and later documentation:

- Mover
- Rider
- Passenger
- Mount
- Vehicle
- Transport Body
- Movement Mode
- Movement State
- Traversal Action
- Mover Profile
- Movement Capability
- Movement Inhibitor
- Movement Record
- Traversal Context
- Traversal Candidate
- Traversal Anchor
- Traversal Link
- Route Segment
- Route Node
- Route Graph
- Regional Connectivity
- Route Accessibility
- Traversal Cost
- Effective Distance
- Travel Plan
- Journey
- Travel Time
- Safe Position
- Formation Intent
- Formation Spatial Plan
- Formation Slot
- Reservation
- Moving Frame
- Attachment
- Movement LOD
- Navigation Revision
- Environment Movement Field

Aliases may exist in UI localisation but internal schemas use the canonical term.

# 5. Canonical Movement Modes and State Families

Top-level Movement Mode families are:

- Ground
- Airborne
- Traverse
- Glide
- Mounted
- Vehicle
- Guided
- Aquatic
- Disabled/Restrained
- Recovery

Aquatic is present in the universal movement vocabulary while detailed swimming ownership remains unresolved under XSI-30-001.

## 5.1 State Ownership

Each specialist document owns its substate catalogue.

Examples:

Ground:
- Idle
- Walk
- Run
- Sprint
- CrouchMove
- CrawlMove

Traverse:
- Vault
- Mantle
- LedgeHang
- SurfaceClimb
- Ladder
- Rope
- Grapple

Glide:
- Deploying
- Stable
- Turning
- Diving
- Stall
- Recovering
- LandingApproach

Vehicle:
- Parked
- Moving
- Braking
- Stuck
- Tipping
- Immobilised

Guided:
- Docked
- Boarding
- InTransit
- Waiting
- EmergencyStop
- ServiceUnavailable

# 6. Shared Entity/Mover Identity Model

Every mover has:

- stable entity/instance ID;
- mover definition reference;
- mover profile reference;
- authoritative current Movement Mode;
- current specialist state;
- current world/spatial-frame location;
- capability snapshot;
- movement modifier snapshot;
- owner/control authority;
- persistence revision;
- movement revision.

The mover ID is never:

- a scene-tree path;
- a node name;
- an animation-bone name;
- a transient network object handle.

# 7. Immutable Definition Versus Runtime-State Contract

## 7.1 Immutable Definitions

Examples:

- movement profiles;
- capability definitions;
- traversal actions;
- glider profiles;
- mount profiles;
- vehicle profiles;
- route classes;
- reservation profiles;
- navigation profiles.

Definitions are versioned and never mutated as per-instance gameplay state.

## 7.2 Runtime State

Examples:

- current velocity;
- current stance;
- active traversal action;
- occupied seat;
- hitch state;
- route progress;
- current route blocker;
- current movement LOD;
- current navigation revision.

Runtime state references definitions by stable ID/version.

# 8. Registry ID Grammar and Namespace Rules

Set 30 follows the canonical registry grammar:

```text
<namespace>.<domain>.<identity_path>
```

Official namespaces:

- `leyforge.core`
- `leyforge.system`

Illustrative IDs:

```text
leyforge.core.vehicle.cart.handcart
leyforge.core.vehicle.wagon.freight_basic
leyforge.core.movement.profile.humanoid_standard
leyforge.core.movement.traversal.vault.low
leyforge.system.capability.traversal.ladder
leyforge.system.interface.movement.route_accessibility
leyforge.system.interface.movement.travel_time
```

No new top-level registry domain is introduced without registry-governance approval.

# 9. Registry Domain Map for Set 30

Recommended Set 30 registry domains/subdomains:

- movement.profile
- movement.state
- movement.stance
- movement.capability
- movement.traversal
- movement.airborne
- movement.glider
- movement.mount
- movement.vehicle
- movement.guided
- movement.route
- movement.navigation
- movement.formation
- movement.reservation
- movement.reason
- movement.event
- movement.command
- interface.movement

Where the canonical Set 25 domain grammar already provides a broader domain such as `vehicle`, `route`, `capability` or `interface`, final implementation should map these logical categories into the approved registry tree rather than inventing an incompatible prefix.

# 10. Core Movement Definition Registry

A minimum canonical registry index should include:

- `MovementModeDefinition`
- `MovementStateDefinition`
- `MoverProfileDefinition`
- `MovementCapabilityDefinition`
- `StanceDefinition`
- `GroundMovementProfile`
- `JumpProfile`
- `AirborneMovementProfile`
- `TraversalActionDefinition`
- `TraversalSurfaceDefinition`
- `GliderProfile`
- `ControlledDescentProfile`
- `MountMovementProfile`
- `SeatProfile`
- `VehicleDefinition`
- `VehicleMovementProfile`
- `HitchDefinition`
- `DraftTeamProfile`
- `GuidedTransportProfile`
- `LiftMovementProfile`
- `RouteClassDefinition`
- `RouteQualityDefinition`
- `RoutePolicyDefinition`
- `NavigationProfileDefinition`
- `ArrivalProfile`
- `ReservationProfile`
- `FormationSpatialProfile`
- `NavigationLODProfile`
- `NetworkMovementProfile`
- `MovementReasonDefinition`

# 11. Mover Profile Registry

A Mover Profile is the shared movement-facing description of a body/transport.

Required core fields:

```text
mover_profile_id
mover_family
body_shape_ref
footprint
width
height
clearance_profiles[]
step_capability
slope_capability
turn_radius_or_class
acceleration_class
braking_class

supported_movement_modes[]
movement_capability_ids[]

surface_preferences[]
surface_restrictions[]
door_passage_classes[]
bridge_load_classes[]

transport_role?
spatial_frame_profile
navigation_profile_ref
presentation_profile_ref

version
lifecycle_state
```

# 12. Movement Capability Registry

Capabilities describe what a mover can potentially do.

Examples:

```text
movement.ground.walk
movement.ground.sprint
movement.jump.basic
traversal.vault.low
traversal.mantle.low
traversal.climb.rough_surface
traversal.ladder.use
traversal.rope.climb
traversal.grapple.swing
movement.glide.basic
movement.mount.ride
movement.transport.drive
movement.transport.tow
movement.guided.board
navigation.follow_road
navigation.form_convoy
```

Capability ownership remains separate from runtime availability.

# 13. Stance and Body-Clearance Registry

Canonical humanoid stance definitions:

- Stand
- Crouch
- Crawl

Each stance definition includes:

- body profile;
- movement speed modifier;
- acceleration/braking modifier;
- jump policy;
- sprint policy;
- step-height policy;
- ledge-guard policy;
- allowed action tags;
- camera requirement;
- transition rules.

Standing up always requires clearance validation.

# 14. Traversal Action Registry

30C owns action semantics.

Required registry fields:

- action family;
- entry modes/states;
- required capability;
- geometry/provider requirements;
- range/height/depth bands;
- movement solver;
- exit policy;
- interruption/failure policy;
- exertion request profile;
- reservation profile;
- camera/presentation references;
- prediction class;
- reason codes.

# 15. Surface, Route and Environment Movement Facets

## 15.1 Surface Facet

World/block/environment systems may expose:

```text
surface_type
support_validity
slope
speed_modifier
traction_modifier
braking_modifier
slip_band
step_override?
noise_tags[]
hazard_tags[]
climb_surface_category?
grapple_surface_category?
landing_response_class?
reason/source_ref
revision
```

## 15.2 Route Facet

Infrastructure owner exposes:

```text
route_segment_id
route_class
surface
quality
width
vertical_clearance
grade
turn_constraints
supported_transport_classes[]
bridge_load_class?
gate_dependencies[]
permission_ref?
condition
closure
capacity_band
congestion_band
navigation_revision
```

## 15.3 Environment Movement Field

XSI-30-004 supplies:

```text
gravity_vector
local_up_vector
air_velocity
gust_vector
vertical_air_component
turbulence_band
atmosphere_density_band
external_force_vectors[]
buoyancy_modifier
drag_modifier
priority
blend_policy
revision
```

# 16. Mount and Seat Registries

30E owns the detailed semantics.

Shared registry families:

- `MountMovementProfile`
- `MountCompatibilityProfile`
- `MountSeatProfile`
- `TackMovementFacet`
- `MountPhysicalAvailabilitySnapshot`

Seat IDs are stable semantic IDs within the mount/vehicle definition.

A passenger/rider relationship always references:

- mover/transport ID;
- seat ID;
- occupant entity ID;
- attachment state;
- control role;
- authority revision.

# 17. Vehicle and Transport Registries

Vehicles require separation between:

- definition;
- movement profile;
- persistent instance;
- current condition;
- cargo snapshot;
- occupants;
- propulsion/control readiness.

Required shared vehicle classes:

- hand-powered;
- draft-powered;
- powered free-steering;
- guided;
- rail;
- lift/platform.

Vessels remain Set 26-owned even if they consume related attachment/cargo semantics.

# 18. Hitch, Draft and Convoy Registries

30F owns:

- hitch definitions;
- draft-team runtime;
- towing constraints;
- convoy movement state.

Shared hitch fields:

- vehicle-side anchor roles;
- draft-side anchor roles;
- compatible mover/body classes;
- team arrangement;
- articulation limit;
- clearance requirement;
- reservation state;
- current active/failed state.

# 19. Guided Route, Rail and Lift Registries

30G owns movement on guided infrastructure.

Canonical registry families:

- `GuidedTransportProfile`
- `GuideSegmentDefinition`
- `RailVehicleMovementProfile`
- `RailConsistProfile`
- `StationStopProfile`
- `LiftMovementProfile`
- `GuidedReservationProfile`
- `TransportReadinessAdapter`

Automation/infrastructure owns switches, signals, power logic and service meaning where assigned; 30G owns resulting movement.

# 20. Route Planning and Journey Registries

30H owns:

- `RoutePolicyDefinition`
- `RoutePlanRecord`
- `RouteEdgeCostResult`
- `LongDistanceJourneyRecord`
- `RouteKnowledgeRecord`
- `RouteInvalidationEvent`

A Journey Record is consequential runtime state and must be persistent.

A route-plan cache is disposable and may be regenerated when evidence changes.

# 21. Navigation and Formation Registries

30I owns:

- `NavigationProfileDefinition`
- `LocalPathRequest`
- `LocalPathResult`
- `NavigationTransitionLink`
- `ReservationProfile`
- `MovementReservation`
- `FormationSpatialProfile`
- `FormationSpatialPlan`
- `NavigationLODProfile`
- `NetworkMovementProfile`
- `StuckRecoveryProfile`

Set 28 owns `FormationIntent`; 30I owns the physical Formation Spatial Plan.

# 22. Movement Reason-Code Registry

Reason codes are machine-readable, localisable and source-aware.

Namespace families:

- `movement.*`
- `traversal.*`
- `airborne.*`
- `glide.*`
- `mount.*`
- `transport.*`
- `guided.*`
- `route.*`
- `journey.*`
- `navigation.*`
- `formation.*`
- `reservation.*`
- `movement.network.*`
- `movement.persistence.*`

External reasons preserve their owner prefix where possible.

Examples:

```text
survival.injury.leg_major
structure.gate.locked
automation.power.unavailable
movement.stand.obstructed
route.geometry.turn
navigation.no_path
```

# 23. Movement Event Registry

Shared event families:

- MovementModeChanged
- MovementStateChanged
- GroundedChanged
- TraversalStarted
- TraversalCompleted
- TraversalFailed
- JumpStarted
- LandingClassified
- GlideStarted
- GlideEnded
- Mounted
- Dismounted
- PassengerBoarded
- PassengerDisembarked
- VehicleImmobilised
- TransportLinkChanged
- RouteEntered
- RouteExited
- RouteBlocked
- TravelPlanStarted
- TravelPlanInterrupted
- TravelPlanCompleted
- NavigationPathStarted
- NavigationPathFailed
- FormationChanged
- MovementLODDemoted
- MovementLODPromoted
- SafeRecoveryApplied

Events describe authoritative facts; presentation systems may subscribe.

# 24. Movement Command Registry

Mutation occurs through commands/requests.

Canonical command families:

- RequestMoveVector
- RequestSprintState
- RequestStance
- RequestJump
- RequestTraversalAction
- RequestGlideDeploy
- RequestGlideRetract
- RequestMount
- RequestDismount
- RequestSeatChange
- RequestVehicleControl
- RequestBoardTransport
- RequestLeaveTransport
- RequestTowLink
- RequestGuidedRouteControl
- RequestRouteTravel
- RequestFollowRoute
- RequestMovementIntent
- RequestMovementRecovery

Commands are validated against authority and current movement revision.

# 25. Movement API Freeze

The Cross-Set Register requires:

- `CurrentMovementMode()`
- `MaxSpeed()`
- `CargoCapacity()`
- `TraversalCost()`
- `VehicleCondition()`
- `MountStatus()`
- `TravelTime()`
- `RouteAccessibility()`

30J freezes their semantic intent.

# 26. Shared Query Semantics

## 26.1 CurrentMovementMode

Returns:

```text
movement_mode
movement_state
spatial_frame
attachment_ref?
authoritative_revision
```

## 26.2 MaxSpeed

Returns current achievable movement speed for the requested context after:

- Set 30 movement profile;
- route/surface;
- vehicle/mount condition;
- consumed external modifiers.

It does not recalculate hunger, stamina or injury.

## 26.3 CargoCapacity

Returns movement-safe capacity state for a mount/vehicle/transport.

It does not return economic value or inventory ownership.

## 26.4 TraversalCost

Returns mover-specific movement cost and blockers for an edge/context.

## 26.5 VehicleCondition

Returns movement-facing operability/condition/fault state.

## 26.6 MountStatus

Returns mount/rider/seat/availability/movement-facing status.

## 26.7 TravelTime

Returns:

- route plan reference;
- expected time;
- likely range;
- confidence;
- assumptions/revisions.

## 26.8 RouteAccessibility

Returns:

- accessibility class;
- blockers;
- transition requirements;
- confidence;
- revision.

# 27. Physics Contract: Authoritative Transform and Velocity

Every physically instantiated mover has exactly one authoritative transform and movement velocity source.

Rules:

- animation never owns world transform;
- camera never owns body transform;
- client prediction never becomes persistent truth without server/host acceptance;
- child visual rigs may use local offsets;
- passenger local presentation offsets do not replace attachment truth;
- movement through a moving frame preserves a declared frame relationship;
- safe recovery is explicit and logged.

# 28. Physics Contract: Collision and Clearance

All consequential movement requires valid collision/clearance.

Shared invariants:

- mover body profile is resolved before movement;
- posture/profile expansion requires clearance;
- traversal sweeps continuously validate body path;
- vehicle swept envelope includes turn/corner volume;
- passenger/seat does not create invisible body duplication;
- navigation path does not override collision;
- world edits invalidate stale geometry evidence.

# 29. Physics Contract: Grounding, Support and Moving Frames

A support relationship includes:

- support entity/world reference;
- contact/support transform;
- relative frame;
- support validity;
- slope/support class;
- revision.

Moving frames include:

- lifts;
- rail platforms;
- vehicles;
- mounts where passengers attach;
- vessels through Set 26;
- moving structures where approved.

When support disappears:

- transition to Airborne or specialist state;
- never remain artificially Grounded.

# 30. Physics Contract: Forces, Gravity and Environment

30D owns shared airborne environmental response.

Rules:

- every movement force has a source;
- gravity is a vector, not always hard-coded world-down;
- environmental fields are externally authored;
- Set 30 converts authoritative field state into movement response;
- no visual-only wind force;
- no spell-owned transform writes outside movement-provider contracts.

# 31. Physics Contract: Traversal Motion

Traversal actions may use:

- bounded kinematic curves;
- constrained paths;
- surface-plane movement;
- rope parameters;
- tether constraints.

Invariants:

- target validated before commit;
- path swept for collision;
- dynamic target revision checked;
- animation warping remains within tolerance;
- invalid target exits safely;
- action completion is gameplay-owned.

# 32. Physics Contract: Mounts, Vehicles and Towing

## 32.1 Mount

The mount is the physical mover while ridden.

The rider:

- remains a separate entity;
- attaches to seat/frame;
- does not run a competing world locomotion solver.

## 32.2 Vehicle

The vehicle is the authoritative transport body.

Driver/passengers:

- attach to semantic seat frames;
- send control intent if authorised;
- do not author vehicle transform.

## 32.3 Towing

A towing link has one authoritative connection and bounded articulation.

No visible rope/trace mesh is authoritative unless explicitly declared.

# 33. Physics Contract: Guided Transport and Lifts

Guided movement:

- follows a declared guide/path;
- validates continuity;
- respects reservations;
- consumes external readiness/control state;
- owns movement along the path;
- transitions occupants through moving-frame attachment.

A lift does not teleport passengers between stops.

# 34. Local-to-Distant Simulation Contract

Movement fidelity bands:

- Active Player
- Active Local
- Reduced Local
- Route Transit
- Regional Summary
- Static

Demotion cannot discard:

- entity identity;
- route/journey;
- occupant/cargo/tow links;
- movement condition;
- interruption state;
- last valid location;
- persistent attachment.

Promotion validates a physical spawn/reconstruction point before creating detailed collision.

# 35. Navigation and Route Contract

Hierarchy:

```text
World/Regional Connectivity
-> Route Plan
-> Route Leg
-> Local Navigation Corridor
-> Traversal/Transport Links
-> Specialist Movement Execution
```

No layer may skip a hard blocker owned by a lower layer.

A distant route cannot cross a bridge that local simulation would declare destroyed/closed.

# 36. Passenger, Rider and Attachment Contract

Attachment record:

```text
attachment_id
host_mover_ref
attachment_role
seat_or_socket_id
occupant_ref
control_role
local_transform_policy
collision_policy
boarding_state
authoritative_revision
```

Attachment does not imply social permission; permission is consumed before attachment.

# 37. External Modifier Resolution Contract

Set 30 consumes modifiers from:

- Set 29 survival;
- equipment/items;
- combat/action locks;
- magic/effects;
- environment;
- permissions;
- mount/creature availability;
- vehicle condition.

Recommended precedence:

1. invalid geometry/hard prohibition;
2. movement capability availability;
3. safety/access/permission;
4. vehicle/mount operability;
5. external hard status restrictions;
6. terrain/environment;
7. equipment/load;
8. beneficial skill/perk/magic;
9. accessibility assistance within allowed rules.

# 38. Animation, IK, Camera, Audio and VFX Handoff

Movement publishes presentation snapshots.

Common fields:

```text
movement_mode
movement_state
speed_normalised
velocity_local
movement_direction_local
grounded
surface_tags
slope_band
turn_rate
stance
traversal_action
traversal_phase
attachment_state
vehicle_or_mount_state
fault_state
```

Rules:

- animation is consumer;
- IK is consumer;
- root motion is bounded/authorised;
- camera effects never move authoritative body;
- sound/VFX never create movement state.

# 39. UI and Accessibility Handoff

Document 17 owns UI/settings presentation.

Set 30 exposes:

- movement state;
- route state;
- blocker reason;
- estimated time/confidence;
- capacity/condition;
- movement-assist availability;
- movement warnings.

Accessibility may:

- simplify input;
- extend timing windows;
- reduce camera motion;
- select among valid traversal/routes;
- assist steering/alignment.

Accessibility may not silently:

- phase through collision;
- ignore route permission;
- grant absent movement capability;
- bypass hard external restrictions unless explicitly authorised by the owning system/world setting.

# 40. Multiplayer Authority Contract

Server/host is authoritative for:

- consequential transform/velocity;
- movement mode/state;
- mount/vehicle control;
- seat/attachment;
- traversal commit;
- route/journey progress;
- path/traversal reservations;
- collision;
- safe recovery;
- movement LOD;
- authoritative arrival.

# 41. Client Prediction and Reconciliation Contract

Prediction classes:

- High Prediction: ordinary player ground locomotion.
- Medium Prediction: mounts, simple vehicles, gliders where deterministic.
- Conservative Prediction: large wagons, powered vehicles.
- Confirmation-Dominant: mount/dismount moving bodies, traversal on dynamic voxels, guided transfers, recovery relocation.
- Interpolation Only: AI-controlled NPCs.

Correction ladder:

1. presentation smoothing;
2. velocity correction;
3. movement-state correction;
4. authoritative transform correction;
5. safe recovery where collision invalid.

# 42. Persistence and Reconstruction Contract

Persist consequential movement state only.

Required shared fields:

- entity/transport ID;
- definition/profile refs;
- transform/location summary;
- movement mode/state summary;
- route/journey progress;
- safe position/node;
- attachment links;
- seat/hitch/tow links;
- condition/fault state;
- LOD state;
- schema/migration version.

Never rely on persistent:

- navmesh polygon IDs;
- scene-tree paths;
- animation phase;
- prediction buffers;
- raw contact manifolds.

# 43. Migration and Versioning Rules

Every persisted Set 30 record includes:

- schema version;
- definition version where required;
- migration history/result;
- last validation version.

## 43.1 Migration Principles

- preserve stable IDs;
- map renamed definitions explicitly;
- reject ambiguous migrations rather than guessing;
- rebuild disposable path/nav caches;
- revalidate collision after body-profile changes;
- revalidate routes after route-profile changes;
- revalidate seat/hitch attachments after transport schema changes;
- keep backup/safe fallback data during destructive migration.

# 44. Determinism and Seed Independence

Set 30 must not depend on:

- fixed POC settlement names;
- fixed road positions;
- fixed spawn geography;
- hard-coded dungeon layouts;
- one biome arrangement;
- one route topology.

Deterministic evidence should be reproducible from:

- world seed;
- persistent world deltas;
- definition versions;
- movement command stream;
- environment revisions;
- route/navigation revisions.

# 45. Validation Architecture

Validation layers:

1. Schema validation.
2. Definition relationship validation.
3. Capability reachability validation.
4. Physics-laboratory validation.
5. Dynamic-world validation.
6. Route/navigation validation.
7. Multiplayer validation.
8. Persistence/migration validation.
9. LOD consistency validation.
10. Accessibility validation.
11. Performance validation.
12. Cross-set ownership/interface validation.

A definition is not production-ready merely because it parses.

# 46. Definition and Schema Validation

Examples:

- unique stable ID;
- supported schema version;
- required references resolve;
- no duplicate ownership field;
- body dimensions valid;
- speed/acceleration non-negative;
- route class exists;
- seat IDs unique;
- hitch roles resolve;
- capability references valid;
- transition modes compatible;
- prediction profile valid;
- reason codes registered;
- migration path exists when schema changes.

# 47. Movement Unit and Physics Tests

Core tests include:

- walk/run/sprint speed;
- stance clearance;
- jump arc;
- ground snap;
- step/slab/stair handling;
- slope limit;
- air control;
- gravity variation;
- landing contact;
- moving platform support;
- external force application;
- collision and world-edit response.

All run at multiple fixed-step rates/configurations where supported.

# 48. Traversal Validation

30C test matrix must cover:

- vault height/depth;
- mantle destination;
- ledge capture;
- shimmy;
- climb surfaces;
- ladders;
- ropes;
- grapples;
- dynamic anchor destruction;
- multiplayer candidate hash;
- safe interruption.

No traversal action may use animation success as its gameplay acceptance criterion.

# 49. Mount and Vehicle Validation

## 49.1 Mount

- mount/dismount clearance;
- seat alignment;
- ground movement;
- terrain compatibility;
- flying mount takeoff/landing;
- passenger attachment;
- availability snapshot;
- control ownership.

## 49.2 Draft Transport

- hitch;
- team capacity;
- wagon turning;
- gates;
- bridges;
- grade;
- load;
- stuck;
- rollover;
- convoy.

## 49.3 Powered/Guided

- guide continuity;
- switch/junction;
- station stop;
- lift stops;
- emergency stop;
- service readiness;
- power loss;
- passenger movement frame.

# 50. Route and Navigation Validation

Required tests:

- effective distance;
- mover-specific route accessibility;
- route-quality effects;
- off-road routing;
- multimodal transfers;
- route knowledge;
- dynamic bridge/gate invalidation;
- route cache revision;
- NPC local path;
- dynamic voxel replan;
- traversal link use;
- queue/reservation;
- formation compression;
- deadlock recovery.

# 51. Multiplayer and Persistence Validation

Test:

- local player movement prediction;
- mount control;
- vehicle control;
- traversal correction;
- seat boarding;
- passenger attachment;
- NPC interpolation;
- route/journey progress replication;
- reconnect;
- control transfer;
- save during traversal;
- save during vehicle movement;
- save during distant journey;
- definition migration;
- corrupted/invalid saved position recovery.

# 52. LOD and Distant Travel Validation

Regression scenarios:

- physical NPC -> reduced local -> far journey -> physical NPC;
- caravan with exact cargo;
- rider/mount attachment;
- vehicle/passenger attachment;
- route blocked while distant;
- environment change while distant;
- encounter interruption;
- save/load while far;
- promotion after route geometry changed.

No duplicated/lost passengers or cargo.

# 53. Accessibility and Control Validation

Validate:

- hold/toggle sprint;
- crouch/crawl;
- traversal assist;
- ledge guard;
- simplified grapple;
- glider auto-level/flare assist;
- vehicle steering/braking assist;
- route accessible-mode preference;
- reduced camera motion;
- controller remapping;
- split-screen independent settings.

Assist settings must not create multiplayer authority divergence.

# 54. Performance and Scalability Validation

Test profiles:

- low-end machine;
- recommended machine;
- high-end machine;
- dense settlement;
- large creature encounter;
- convoy;
- rail station;
- many distant journeys;
- large world route graph.

Metrics include:

- physics time;
- navigation job time;
- route search time;
- nav rebuild spikes;
- avoidance cost;
- formation cost;
- network bandwidth;
- movement snapshot count;
- LOD promotion spike;
- save/reconstruction time.

# 55. Cross-System Integration Validation

Each integration requires owner/consumer tests.

Examples:

Set 29:
- sprint denial;
- injury speed modifier;
- fall impact consequence;
- route exertion estimate.

Set 28:
- formation intent;
- ride permission;
- passenger assignment.

Set 27:
- caravan mission;
- guided freight/passenger service;
- physical arrival before economic settlement.

Automation:
- rail/lift power readiness;
- route/service unavailable.

Magic:
- authorised movement provider;
- portal transition;
- environmental/gravity field.

# 56. Release-Blocking Defect Catalogue

Set 30 release-blocking defects include:

- player/NPC falling through valid terrain;
- persistent stuck state in ordinary generated terrain without recovery;
- incorrect standing clearance causing clipping;
- movement speed exploit;
- client-authoritative teleport exploit;
- traversal through solid voxels;
- mount/vehicle passenger duplication;
- cargo duplication/loss from movement LOD;
- distant journey crossing a physically closed/impossible route;
- invalid route granting inaccessible progression;
- destroyed bridge ignored by distant travel;
- seat/hitch attachment corruption;
- save/load spawning inside terrain without recovery;
- network correction placing player through locked geometry;
- unrecoverable movement deadlock for critical quest/companion actor;
- movement layer calculating another owner's economic/survival/social state;
- severe accessibility regression preventing ordinary play.

# 57. Production Maturity and Lifecycle States

Definitions/doc features use:

- Draft
- Prototype
- Validated
- Alpha
- ProductionCandidate
- Production
- Deprecated
- Removed

A feature cannot become `Production` until:

- schema validates;
- owning document implemented;
- integration interfaces resolve;
- minimum test suite passes;
- migration path exists;
- performance budget passes;
- multiplayer/persistence requirements pass where applicable.

# 58. Debugging, Telemetry and Developer Tooling

Required developer views:

- movement mode/state inspector;
- body/clearance shape;
- ground/support contacts;
- velocity/acceleration;
- environmental force vectors;
- traversal candidates/anchors;
- mount seats;
- vehicle footprint/turn sweep;
- hitch/draft demand;
- guide/rail path;
- route graph;
- route edge cost breakdown;
- local navigation path/corridor;
- reservations/queues;
- formation slots;
- movement LOD;
- journey progress;
- network authority/reconciliation;
- persistent movement record;
- reason-code history.

Production telemetry should aggregate anonymised gameplay/system metrics where permitted, not player-identifying movement traces.

# 59. Godot/Summer Engine Reference Architecture

Recommended top-level service graph:

```text
MovementRegistryService
MovementDefinitionValidator
MovementAuthorityService

PlayerMovementService
TraversalService
AirborneMovementService
MountMovementService
VehicleMovementService
GuidedTransportService

RouteGraphService
RoutePlanner
JourneyService

NavigationWorldService
LocalPathService
ReservationService
FormationSpatialService

MovementLODService
MovementPersistenceService
MovementNetworkService

MovementPresentationAdapter
MovementDebugService
```

## 59.1 Core Engineering Rule

Specialist controllers may use different Godot nodes/algorithms, but all consequential state enters/exits through common records/interfaces.

## 59.2 Summer Engine Role

Summer Engine may assist:

- implementation;
- registry generation;
- schema validation;
- test generation;
- test execution;
- regression comparison;
- debug visualisation;
- migration scripting.

AI-generated changes may not alter ownership or frozen public APIs without a reviewed schema/interface change.

# 60. Implementation Sequencing and Dependency Gates

Recommended implementation order:

1. Registry kernel and shared Movement API.
2. Common mover/runtime record.
3. Ground locomotion.
4. Traversal.
5. Airborne/glider.
6. Navigation profile/local path foundation.
7. Mounts.
8. Draft transport.
9. Guided/powered transport.
10. Route graph/long-distance journey.
11. Formation/group movement.
12. Movement LOD.
13. Multiplayer integration.
14. Persistence/migrations.
15. Full validation/performance pass.

Some work can proceed in parallel once shared schemas are stable.

# 61. POC Regression Protection

The existing POC proves several movement fundamentals.

Production must retain or improve:

- responsive first-person movement;
- WASD/controller support;
- jumping;
- sprinting;
- current swimming capability until ownership reconciliation changes implementation;
- slabs/stairs usability;
- connected first-person body/head-anchor camera;
- local NPC route following;
- one-block-rise movement behaviour where profile permits;
- avoidance of obvious water/pits/two-block walls/unloaded unsafe terrain under current POC profile;
- safe route-node recovery after persistent path failure.

The POC's exact numbers/geography are not canonical.

# 62. Cross-Set Interface Reconciliation Register

| ID | Interface | Owner(s) Involved | Status at 30J v0.2 |
| --- | --- | --- | --- |
| XSI-30-001 | Water Locomotion Ownership Reconciliation | Set 26 / Set 30 | **Pending explicit user approval. No transfer authorised.** |
| XSI-30-002 | Set 29 Movement Exertion Decision Contract | Set 29 / Set 30 | Defined in Set 30; requires Set 29 integration review. |
| XSI-30-003 | Set 28 Formation Intent Contract | Set 28 / Set 30 | Defined/refined; requires Set 28 integration review. |
| XSI-30-004 | Environmental Movement Field Contract | Environment/26D/Realm/Magic / Set 30 | Defined; requires final environment-owner mapping. |
| XSI-30-005 | Set 29 Fall Impact Consequence Contract | Set 29 / Set 30 | Defined; requires Set 29 integration review. |
| XSI-30-006 | Set 28 Ride Permission and Seat Assignment Contract | Set 28 / Set 30 | Defined; requires Set 28 integration review. |
| XSI-30-007 | Aquatic Mount Riding Boundary | Set 26 / Set 30 / Creature systems | Boundary recorded; future content integration required. |
| XSI-30-008 | Set 27 Terrestrial Caravan Movement Execution Contract | Set 27 / Set 30 | Defined across 30F/30H; ready for 27H reconciliation. |
| XSI-30-009 | Automation Power, Control and Transport Readiness Contract | Automation/Magic / Set 30 | Defined by 30G; requires Automation integration. |
| XSI-30-010 | Set 27 Guided Freight and Passenger Service Interface | Set 27 / Set 30 | Defined by 30G/30H; requires Set 27 reconciliation. |
| XSI-30-011 | Universal Route Knowledge and Confidence Interface | Map/Quest/Social/Faction / Set 30 | Defined by 30H; owner mapping required. |
| XSI-30-012 | External AI Movement Intent Contract | NPC/Creature/Combat/Quest/Automation/Social / Set 30 | Defined by 30I; ready for broad integration. |
| XSI-30-013 | Movement LOD Promotion/Demotion Contract | Simulation/Persistence / Set 30 | Defined by 30I; requires technical integration. |

# 63. Cross-Set Interface Amendments

This section is mandatory under the governing Cross-Set Interface Register.

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Pending explicit approval.

Conflict:

- Cross-Set Interface Register v1.0 lists Swimming under Set 30.
- Approved Document 26E already deeply owns Swimming, Diving and Underwater Player Interaction.

30J does not silently resolve the conflict.

### Current Safe Integration

Until user approval:

- Set 30 owns the universal Movement Mode/API facade.
- `CurrentMovementMode()` may report `Aquatic`.
- 26E remains detailed aquatic locomotion implementation owner.
- Set 30 consumes the aquatic state through an adapter.
- 30B/30D/30E/30I only own terrestrial/aerial entry/exit boundaries.

### Approval Options

A. Keep detailed swimming under Set 26 and Set 30 as universal movement facade.

B. Transfer generic swimming to Set 30 and narrow 26E to maritime/underwater specialisation.

C. Approve another explicit field-level one-owner boundary.

No transfer occurs until approved.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Defined; pending Set 29 integration.

Runtime decision:

```text
allowed_to_begin
allowed_to_continue
stamina_availability_band
movement_exertion_modifier
recovery_modifier
hard_movement_restrictions[]
reason_codes[]
source_state_revision
```

Movement request context may include:

```text
movement_action_family
intensity_band
is_sustained
elapsed_duration
vertical_gain
terrain_resistance_band
grade_band
load_band
support_mode
hand_arm_requirement
equipment_assist_band
```

Route estimation also requires a non-mutating estimate mode.

Set 29 remains sole owner of stamina/fatigue/injury biological calculations.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** Defined; pending Set 28 integration.

Set 28 sends Formation Intent.

Set 30 returns Formation Spatial Plan.

Set 28 owns behavioural/social choice.

Set 30 owns physical placement/compression/movement.

## XSI-30-004 - Environmental Movement Field Contract

**Status:** Defined; owner mapping pending.

Environment/realm/maritime/magic owners supply authoritative fields.

Set 30 owns physical movement response.

No second weather system is created.

## XSI-30-005 - Set 29 Fall Impact Consequence Contract

**Status:** Defined; pending Set 29 integration.

Set 30 sends physical impact facts.

Set 29 returns biological consequence and movement restrictions.

Set 30 never calculates injury severity.

## XSI-30-006 - Set 28 Ride Permission and Seat Assignment Contract

**Status:** Defined; pending Set 28 integration.

Set 28/permission owner decides:

- mount/rider permission;
- passenger assignment;
- control authority;
- seat assignment intent.

Set 30 validates physical seat/clearance/attachment.

## XSI-30-007 - Aquatic Mount Riding Boundary

**Status:** Boundary recorded; not fully implementable until aquatic ownership integration is resolved.

30E retains rider/mount relationship.

Set 26 retains aquatic-fluid movement.

No duplicate swimming mount solver is authorised.

## XSI-30-008 - Set 27 Terrestrial Caravan Movement Execution Contract

**Status:** Defined; ready for 27H reconciliation.

Set 27 owns mission/economics.

Set 30 owns capacity/accessibility/time/progress/physical arrival.

## XSI-30-009 - Automation Power, Control and Transport Readiness Contract

**Status:** Defined; pending Automation integration.

Automation/Magic supplies:

- power availability;
- propulsion/traction readiness;
- requested control/route state;
- shutdown/fault state.

Set 30 owns resulting movement.

## XSI-30-010 - Set 27 Guided Freight and Passenger Service Interface

**Status:** Defined; pending Set 27 reconciliation.

Set 30 supplies physical service capacity/readiness/travel time/arrival.

Set 27 owns fare/freight value, wages, taxes, profit and demand.

## XSI-30-011 - Universal Route Knowledge and Confidence Interface

**Status:** Defined; owner mapping pending.

External knowledge systems supply authorised route knowledge/confidence.

Set 30 uses it for route planning visibility/uncertainty.

Set 30 does not decide truthfulness/social credibility.

## XSI-30-012 - External AI Movement Intent Contract

**Status:** Defined; broad integration required.

All AI/gameplay owners should request movement through one intent contract rather than writing movement state directly.

## XSI-30-013 - Movement LOD Promotion/Demotion Contract

**Status:** Defined; technical integration required.

Movement-specific location/attachment/route state is transferred between detailed and reduced simulation without losing identity or enabling teleportation.

# 64. Final Integration Decisions Still Requiring Approval

The following are intentionally not silently resolved in 30J:

1. XSI-30-001 swimming ownership between Set 26 and Set 30.
2. Exact Set 29 schema naming for XSI-30-002.
3. Exact Set 28 formation-intent fields for XSI-30-003.
4. Final owner service for terrestrial environment movement fields under XSI-30-004.
5. Exact Set 29 injury/impact response schema for XSI-30-005.
6. Exact social/permission ownership split for ride/passenger assignment under XSI-30-006.
7. Future aquatic mount implementation owner details under XSI-30-007.
8. Final 27H field names/schema version for XSI-30-008.
9. Final Automation/Magic transport-readiness adapter schema for XSI-30-009.
10. Final Set 27 guided-service contract names for XSI-30-010.
11. Final route-knowledge owner mapping for XSI-30-011.
12. Adoption of XSI-30-012 by every AI/gameplay movement requester.
13. Final technical simulation owner and field mapping for XSI-30-013.

These are **integration approvals**, not missing Set 30 gameplay design.

# 65. Main-Document Amendment Register

A final post-Set-30 integration pass should update earlier documents so they reference Set 30 rather than retain duplicate movement logic.

Priority amendment targets:

| Document | Required Change |
| --- | --- |
| 00 / 01 | Reference Set 30 as canonical movement/traversal/transport owner. |
| 02 | Remove duplicate movement/stamina calculations; consume Set 29/30 interfaces. |
| 03 | Add/confirm movement-facing block/surface/route facets. |
| 04 / 05 / 06 | Add approved movement equipment/vehicle parts/recipes without embedding movement physics. |
| 07 | NPC jobs/schedules submit movement intents rather than directly moving actors. |
| 08 | Automation dispatch/control consumes Set 30 transport interfaces. |
| 09 | Magic movement effects expose providers rather than writing transforms. |
| 10 | Creature AI uses navigation/movement profiles and Set 30 execution. |
| 11 | World/weather exposes movement-facing environment/terrain snapshots. |
| 12 / 19 / 20 | Structures/blueprints expose movement anchors, routes, doors, loading points and navigation revisions. |
| 15 | Quests consume authoritative movement/journey evidence. |
| 16 | Combat requests movement locks/impulses and consumes movement states. |
| 17 | UI/settings consume movement view models and reasons. |
| 18 | Current technical plan points to Godot/Summer Set 30 runtime services. |
| 22 | Forge definitions/animation consume Set 30 interfaces; no movement authority. |
| 25 | Register Set 30 schemas, capabilities, validators, migrations and lifecycle. |
| 26 | Reconcile XSI-30-001 and other maritime transfer interfaces. |
| 27 | Reconcile caravan/guided service interfaces. |
| 28 | Reconcile formation/ride/passenger interfaces. |
| 29 | Reconcile exertion/fall-impact/movement modifier interfaces. |

# 66. Document Set 30 Acceptance Checklist

## Architecture

- [ ] One movement owner per rule.
- [ ] Specialist ownership boundaries preserved.
- [ ] Shared Movement API implemented.
- [ ] No animation/camera authority leakage.
- [ ] No external-system formula duplication.

## Registries

- [ ] All movement definitions have stable IDs.
- [ ] Definitions/runtime state separated.
- [ ] Schema validation passes.
- [ ] Migration paths exist.
- [ ] Reason codes registered.

## Player Movement

- [ ] Ground locomotion validated.
- [ ] Crouch/crawl clearance validated.
- [ ] Jump/air handling validated.
- [ ] Traversal validated.
- [ ] Gliding/falling validated.
- [ ] Aquatic handoff protected.

## Mounts/Transport

- [ ] Mount riding validated.
- [ ] Flying mounts validated.
- [ ] Handcart/wagon validated.
- [ ] Draft team/hitch validated.
- [ ] Convoys validated.
- [ ] Guided/powered transport validated.
- [ ] Lifts/elevators validated.

## Routes/Navigation

- [ ] Effective-distance routing validated.
- [ ] Multimodal route plans validated.
- [ ] Route knowledge/confidence validated.
- [ ] NPC local navigation validated.
- [ ] Dynamic voxel invalidation validated.
- [ ] Formation spatial execution validated.
- [ ] Stuck/deadlock recovery validated.

## Multiplayer/Persistence

- [ ] Player prediction validated.
- [ ] Vehicle/mount prediction validated.
- [ ] NPC interpolation validated.
- [ ] Passenger attachments validated.
- [ ] LOD promotion/demotion validated.
- [ ] Save/load reconstruction validated.
- [ ] Migration validated.

## Performance/Accessibility

- [ ] Low-end profile validated.
- [ ] Dense settlement profile validated.
- [ ] Large world route profile validated.
- [ ] Accessibility assists validated.
- [ ] Motion comfort validated.
- [ ] Controller/remapping validated.

## Cross-Set

- [ ] XSI-30-001 explicitly approved/reconciled before final canonical freeze.
- [ ] Set 29 interfaces reconciled.
- [ ] Set 28 interfaces reconciled.
- [ ] Set 27 interfaces reconciled.
- [ ] Automation/environment interfaces reconciled.
- [ ] Main-document amendment pass complete.

# 67. Final Set 30 Handoff

With Document 30J, the gameplay-design scope of **Document Set 30 - Movement, Traversal and Transportation** is complete at v0.1.

The set now provides:

- universal movement architecture;
- core player locomotion;
- traversal;
- falling/gliding;
- mounts;
- draft transport;
- rail/lifts/powered transport;
- roads/routes/long-distance travel;
- NPC navigation/formations;
- movement networking/persistence;
- final schemas/APIs/validation/integration rules.

The next project phase should not expand Set 30 by default.

Instead:

1. complete the final Sets 27-30 interface reconciliation;
2. amend older main documents to consume the approved interfaces;
3. register final schemas in the production-governance registry;
4. implement and validate in Godot/Summer Engine;
5. only reopen Set 30 for controlled versioned changes or newly approved specialist expansions.

# Appendix A. Canonical Registry Index

```text
Movement
- MovementModeDefinition
- MovementStateDefinition
- MoverProfileDefinition
- MovementCapabilityDefinition
- StanceDefinition
- GroundMovementProfile
- JumpProfile
- AirborneMovementProfile
- ControlledDescentProfile
- GliderProfile

Traversal
- TraversalActionDefinition
- TraversalSurfaceDefinition
- TraversalProviderDefinition
- TraversalPathDefinition
- GrappleProfile

Mount
- MountMovementProfile
- MountCompatibilityProfile
- MountSeatProfile
- TackMovementFacet
- MountAvailabilitySnapshot

Vehicle
- VehicleDefinition
- VehicleMovementProfile
- WheelRunnerProfile
- HitchDefinition
- DraftTeamProfile
- SeatProfile
- CargoMovementProfile
- VehicleConditionProfile

Guided
- GuidedTransportProfile
- GuideSegmentDefinition
- RailVehicleMovementProfile
- RailConsistProfile
- StationStopProfile
- LiftMovementProfile
- TransportReadinessAdapter

Route
- RouteClassDefinition
- RouteQualityDefinition
- RoutePolicyDefinition
- RouteSegmentFacet
- RoutePlanRecord
- RouteKnowledgeRecord
- LongDistanceJourneyRecord

Navigation
- NavigationProfileDefinition
- PathCostProfile
- ArrivalProfile
- NavigationTransitionLink
- ReservationProfile
- FormationSpatialProfile
- NavigationLODProfile
- NetworkMovementProfile
- StuckRecoveryProfile

Interfaces
- Movement API
- Environment Movement Field
- Movement Exertion
- Fall Impact Consequence
- Formation Intent
- Ride/Seat Permission
- Caravan Movement Execution
- Transport Readiness
- Route Knowledge
- External AI Movement Intent
- Movement LOD Promotion/Demotion
```

# Appendix B. Canonical Movement API Contract

```text
CurrentMovementMode(entity_or_transport_id)
-> {
    movement_mode,
    movement_state,
    spatial_frame,
    attachment_ref?,
    authoritative_revision
}
```

```text
MaxSpeed(entity_or_transport_id, context?)
-> {
    achievable_speed,
    speed_band,
    applied_modifier_refs[],
    restrictions[],
    reason_codes[],
    revision
}
```

```text
CargoCapacity(transport_id, route_context?)
-> {
    capacity_total,
    capacity_used,
    capacity_available,
    movement_load_band,
    hard_overload,
    route_capacity_modifier?,
    reason_codes[],
    revision
}
```

```text
TraversalCost(mover_id, segment_or_context)
-> {
    accessibility_state,
    cost,
    estimated_time,
    required_transitions[],
    blockers[],
    confidence,
    revision
}
```

```text
VehicleCondition(vehicle_id)
-> {
    operability_state,
    movement_faults[],
    speed_modifier,
    braking_modifier,
    steering_modifier,
    immobilised,
    reason_codes[],
    revision
}
```

```text
MountStatus(mount_or_rider_id)
-> {
    mount_ref,
    rider_ref?,
    seat_state,
    movement_mode,
    physical_availability,
    movement_modifier,
    route_restrictions[],
    reason_codes[],
    revision
}
```

```text
TravelTime(mover_or_group_id, route_or_destination)
-> {
    route_plan_id,
    expected_time,
    likely_time_range,
    confidence,
    required_modes[],
    known_blockers[],
    revision
}
```

```text
RouteAccessibility(mover_or_transport_id, route_or_segment)
-> {
    accessibility_state,
    required_transitions[],
    estimated_time?,
    traversal_cost?,
    blockers[],
    reason_codes[],
    confidence,
    revision
}
```

# Appendix C. Shared Runtime Movement Record

```text
MovementRuntimeRecord
entity_or_transport_ref
mover_profile_ref

position
rotation
velocity

movement_mode
movement_state
stance_or_body_profile?

support_ref?
spatial_frame_ref?
attachment_refs[]

active_movement_capabilities[]
movement_modifier_snapshot_ref
external_lock_flags[]

route_plan_ref?
journey_ref?
local_path_ref?
current_route_leg_or_node?

safe_position_ref
lod_state

network_authority_ref
prediction_sequence?
authoritative_tick

movement_revision
schema_version
```

# Appendix D. Mover Profile Schema

```text
MoverProfileDefinition
mover_profile_id
mover_family

body_shape_ref
footprint
width
standing_height
alternate_clearance_profiles[]

step_capability
slope_capability
turn_radius_or_class
acceleration_class
braking_class

supported_movement_modes[]
movement_capability_ids[]

terrain_preferences[]
surface_restrictions[]
door_passage_classes[]
bridge_load_classes[]

transport_role?
spatial_frame_profile
navigation_profile_ref
presentation_profile_ref

version
lifecycle_state
```

# Appendix E. Movement Capability Schema

```text
MovementCapabilityDefinition
capability_id
capability_family

supported_movement_modes[]
required_body_features[]
required_provider_types[]
allowed_surface_categories[]
allowed_route_classes[]

runtime_eligibility_channels[]
hard_restriction_channels[]

default_cost_profile?
navigation_transition_class?
presentation_requirements[]

version
lifecycle_state
```

# Appendix F. Vehicle/Transport Schema

```text
VehicleDefinition
vehicle_definition_id
vehicle_family
movement_profile_id

body_profile_ref
cargo_profile_id
seat_profile_id
hitch_profile_id?
propulsion_profile_ref?
guided_profile_ref?

component_refs[]
presentation_profile_ref
network_profile_id
lod_profile_id

version
lifecycle_state
```

```text
TransportRuntimeRecord
vehicle_instance_id
position
rotation
velocity

movement_state
condition_state

driver_ref?
seat_occupants{}
cargo_snapshot_ref

hitch_state?
draft_team_ref?
power_readiness_ref?
guide_segment_ref?

route_ref?
journey_ref?
convoy_ref?

last_valid_position
authoritative_tick
revision
```

# Appendix G. Route and Journey Schema

```text
RoutePlanRecord
route_plan_id
origin
destination

mover_profile_refs[]
route_policy_id
ordered_leg_records[]
transfer_node_refs[]

effective_cost
estimated_travel_time
estimated_time_range
confidence

known_blockers[]
required_permissions[]
required_transport_services[]

route_graph_revision
knowledge_revision
environment_revision
```

```text
LongDistanceJourneyRecord
journey_id
route_plan_id
traveller_or_convoy_refs[]

departure_time
expected_arrival
current_leg_index
current_segment_ref
segment_progress

movement_mode
mover_snapshot_refs[]
cargo_refs[]
passenger_refs[]

last_valid_route_node
interruption_state?
lod_state

route_revision
service_revision
environment_revision
last_simulation_time
```

# Appendix H. Navigation/Formation Schema

```text
LocalPathRequest
request_id
mover_ref
navigation_profile_snapshot_ref
origin
goal
arrival_profile_id
route_corridor_ref?
allowed_transition_classes[]
urgency
navigation_revision
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
separated_member_refs[]
blocked_member_refs[]
regroup_target?
navigation_revision
revision
```

# Appendix I. Physics and Authority Invariants

1. Exactly one authoritative transform per mover.
2. Movement occurs in fixed simulation steps.
3. Animation cannot author world displacement by default.
4. Camera cannot move collision body.
5. Navigation cannot bypass collision.
6. Route abstraction cannot bypass local hard blockers.
7. Persistent identity never uses engine scene paths.
8. Seat attachment does not create a second locomotion authority.
9. External gameplay modifiers retain external ownership.
10. Dynamic voxel edits invalidate affected movement evidence.
11. Client prediction is provisional.
12. Safe recovery is explicit and auditable.
13. Definitions are immutable; runtime state is mutable.
14. Distant movement preserves consequential identity/state.
15. Movement failure never silently completes the caller's task.

# Appendix J. Validation Matrix

| Domain | Definition | Physics | Dynamic World | Multiplayer | Persistence | LOD | Accessibility |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Ground Locomotion | Required | Required | Required | Required | Required | N/A | Required |
| Traversal | Required | Required | Required | Required | Required | Partial | Required |
| Airborne/Glide | Required | Required | Required | Required | Required | Partial | Required |
| Mounts | Required | Required | Required | Required | Required | Required | Required |
| Draft Vehicles | Required | Required | Required | Required | Required | Required | Required |
| Guided Transport | Required | Required | Required | Required | Required | Required | Required |
| Routes/Journeys | Required | Indirect | Required | Required | Required | Required | Required |
| NPC Navigation | Required | Indirect | Required | Required | Required | Required | Required |
| Formation | Required | Indirect | Required | Required | Partial | Required | Required |

# Appendix K. Performance Budget Matrix

Initial targets require profiling, not blind enforcement.

| System | Near | Medium | Far |
| --- | --- | --- | --- |
| Player movement | every physics tick | N/A | N/A |
| Critical NPC movement | every/most physics ticks | reduced steering | route summary |
| Background NPC movement | bounded physics/path ticks | corridor updates | scheduled location |
| Avoidance | 10-20 Hz logical | 2-5 Hz | none |
| Formation | 5-10 Hz | 1-3 Hz | summary |
| Route planning | async/on demand | cached | cached/scheduled |
| Vehicle physics | every physics tick when relevant | reduced solver | journey record |
| Journey | local physical | segment update | scheduled progression |
| Network snapshots | high relevance rate | lower rate | none/summary |
| Navigation rebuild | bounded dirty regions | queued | no local nav |

# Appendix L. Cross-Set Interface Matrix

| Consumer | Required Interface | Owner |
| --- | --- | --- |
| Set 30 | Movement exertion/restrictions | Set 29 |
| Set 30 | Fall biological consequence | Set 29 |
| Set 30 | Formation intent | Set 28 |
| Set 30 | Ride/passenger permission | Set 28 |
| Set 30 | Caravan mission/economic constraints | Set 27 |
| Set 30 | Transport power/control readiness | Automation/Magic |
| Set 30 | Environment movement field | Environment/Realm/26D/Magic |
| Set 30 | Route knowledge | Map/Quest/Social/Faction owner |
| Set 27 | Cargo capacity/travel time/accessibility/arrival | Set 30 |
| Set 28 | Spatial formation result | Set 30 |
| Set 29 | Movement exertion facts/fall impact facts | Set 30 |
| NPC/Combat/Quest/Automation | Movement status/arrival/failure | Set 30 |
| UI | Movement/route/condition/reason view data | Set 30 |
| Animation | Authorised movement snapshot | Set 30 |

# Appendix M. Reason-Code Namespace Catalogue

```text
movement.*
movement.blocked.*
movement.stance.*
movement.jump.*
movement.network.*
movement.persistence.*
movement.recovery.*

traversal.*
traversal.surface.*
traversal.anchor.*
traversal.grapple.*

airborne.*
airborne.landing.*
glide.*
descent.*

mount.*
mount.seat.*
mount.permission.*

transport.*
transport.route.*
transport.draft.*
transport.hitch.*
transport.condition.*
convoy.*

guided.*
guided.route.*
guided.service.*
lift.*
rail.*

route.*
route.geometry.*
route.environment.*
route.permission.*
journey.*

navigation.*
navigation.wait.*
navigation.route.*
formation.*
companion.*
reservation.*
```

# Appendix N. Release Gate Checklist

A Set 30 implementation cannot be declared Production until:

- [ ] All public Movement API queries are implemented and versioned.
- [ ] Registry IDs validate.
- [ ] No unresolved missing definition references.
- [ ] All specialist movement controllers obey shared authority invariants.
- [ ] Dynamic voxel collision/path invalidation passes.
- [ ] Multiplayer exploit tests pass.
- [ ] Save/load/migration tests pass.
- [ ] Distant journey and cargo/passenger conservation tests pass.
- [ ] Low-end performance profile passes agreed targets.
- [ ] Accessibility regression suite passes.
- [ ] Cross-set ownership review passes.
- [ ] XSI-30-001 has explicit approved resolution before final canonical production freeze.
- [ ] Other XSI interfaces have owners and implemented adapters.
- [ ] Main-document integration amendments are completed or formally scheduled.
- [ ] No release-blocking movement defect remains open.

# Final Cross-Set Reconciliation Addendum - v0.2

**Governing contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.1 - Final Reconciled Contract.

This addendum **supersedes the provisional status wording in Sections 62-64 and any "pending final reconciliation" notes in Documents 30A-30I.** The specialist gameplay rules remain unchanged; only interface status/signatures are consolidated.

## Final XSI Status

| XSI | Final Status | Canonical Contract |
| --- | --- | --- |
| XSI-30-001 | **RESOLVED** | XSET-011 - detailed swimming stays in 26E; Set 30 is universal movement facade/cross-medium coordinator. |
| XSI-30-002 | **RESOLVED** | XSET-008 - Movement Exertion and Biological Mobility. |
| XSI-30-003 | **RESOLVED** | XSET-006 - Formation Intent -> Formation Spatial Plan. |
| XSI-30-004 | Confirmed external dependency | Environment Movement Field semantics retained; owner mapping external to Sets 27-30. |
| XSI-30-005 | **RESOLVED** | XSET-009 - Physical Impact -> Biological Consequence. |
| XSI-30-006 | **RESOLVED** | XSET-006 - social ride/passenger authorisation -> physical seat/attachment validation. |
| XSI-30-007 | **RESOLVED** | XSET-011 aquatic mount provider boundary. |
| XSI-30-008 | **RESOLVED** | XSET-004 transport mission/execution. |
| XSI-30-009 | Confirmed external dependency | Automation/Magic transport-readiness interface retained. |
| XSI-30-010 | **RESOLVED** | XSET-004 guided freight/passenger extension. |
| XSI-30-011 | **RESOLVED** | XSET-007 route truth/knowledge split. |
| XSI-30-012 | **RESOLVED for Sets 27-30** | XSET-006 generic `ExternalMovementIntent`. |
| XSI-30-013 | **RESOLVED** | XSET-010 domain-safe promotion/demotion. |

## XSI-30-001 Final Decision

**Option A is adopted.**

Document 26E already owns the detailed aquatic locomotion system. Recreating that system in Set 30 would create duplicate movement truth. Therefore:

- 26E owns wading/aquatic response, surface swimming, diving, underwater locomotion, buoyancy/current/wave character response and aquatic-provider execution;
- Set 30 owns the universal `Aquatic` mode facade, common Movement API, land/air/traversal entry and re-entry coordination, route/navigation provider integration and common movement authority envelopes;
- `CurrentMovementMode()` may return `Aquatic` with `movement_provider_ref = set26.aquatic`;
- 30H/30I consume aquatic-provider accessibility/path results rather than implement swimming;
- 30E retains rider/seat relationship for aquatic mounts while 26E owns the water-medium locomotion provider.

## Set 29 Integration Freeze

XSI-30-002 now uses `MovementExertionRequest` / `MovementExertionDecision` plus `BiologicalMobilityModifierSnapshot`. Set 29 owns actual Stamina/Fatigue/biological calculation; Set 30 owns the physical action and applies the returned movement result.

XSI-30-005 now uses `PhysicalImpactEvent` / `BiologicalImpactResult`.

## Set 28 Integration Freeze

Formation behaviour remains Set 28 intent; physical formation remains Set 30 spatial execution. Passenger/ride social permission remains Set 28; seat/attachment/vehicle movement remains Set 30. Companion/delegated travel uses the generic Set 30 movement-intent contract.

## Set 27 Integration Freeze

Terrestrial caravan, delivery and guided freight/passenger movement uses `TransportMissionRequest` / `TransportExecutionSnapshot`. Set 27 never derives physical capacity, route access or arrival merely from economic desirability.

## Final Release-Gate Update

The original release-gate item requiring XSI-30-001 resolution is now satisfied at the design-contract level. Production admission still requires implemented adapters, Set 25 registration and validation evidence.

## Final Status

There is no unresolved Sets 27-30 gameplay-ownership conflict remaining in Document Set 30 v0.2.


---

# END OF DOCUMENT 30J
