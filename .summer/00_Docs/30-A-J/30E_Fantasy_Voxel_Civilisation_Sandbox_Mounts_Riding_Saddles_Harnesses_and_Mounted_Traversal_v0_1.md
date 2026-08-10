# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30E - Mounts, Riding, Saddles, Harnesses and Mounted Traversal

Version 0.1 - Detailed Mount Movement, Rider Control and Mounted Traversal Design Draft

A production-oriented specification for rideable creatures in Leyforge, covering mount compatibility, rider and passenger seats, saddles and harnesses, mount/dismount traversal, rider control modes, ground-mount gaits, terrain clearance, mount jumping, mounted cargo interfaces, flying-mount take-off and landing, wind/gravity integration, mounted combat movement handoffs, accessibility, multiplayer authority, persistence, simulation LOD and Godot/Summer Engine implementation.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Mounted Traversal Statement**
>
> A Leyforge mount is a living creature first and a transport relationship second. Riding must make distance, terrain and cultural creature partnerships meaningful without turning the creature into a vehicle skin or letting the movement system decide taming, loyalty, health, ownership or personality. Set 30 therefore owns how a permitted rider physically mounts, controls, travels on and dismounts a mount, while creature, social, survival, equipment, combat and economy systems continue to own why the relationship exists and what it costs.

# Document Purpose

Document 30E defines the ride relationship between a player or other rider and a mount-compatible creature. It is the Set 30 authority for rider/mount movement states, mounting and dismounting, direct or assisted rider control, mounted clearance, gait selection, terrain handling, mount jumping, rider and passenger attachment, mount-carried cargo movement interfaces, flying-mount riding and movement-facing saddle/harness effects.

The document does not make creatures tameable. Document 10 and the creature/ecology systems remain responsible for creature identity, domestication, taming, species behaviour and mount candidacy. Set 28 provides social ownership, passenger assignment and riding permission. Set 29 provides rider survival/physiological modifiers and the movement-exertion response where riding is strenuous. Item and Recipe systems own the physical tack items, recipes, durability, price and repair. Forge Documents 22E/22F/22H own rider seats, hand/foot targets, saddle-fit metadata, rigging, animation and spatial markers. Combat owns mounted attacks, hits, knock-off causes and damage. Set 30 consumes these interfaces and owns only movement execution.

Document 30E also defines flying-mount riding without redefining Document 30D's environmental movement fields. Winged, gliding and magical flying mounts use their own mount-flight movement profiles while sampling the same authoritative gravity, wind, gust and extraordinary-field information established by 30D. A flying mount is not treated as a player glider, and its biological capability remains creature-owned.

# Governing Source and Dependency Register

| Source | Existing Direction Relevant to 30E | 30E Treatment |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Set 30 owns land/flying mounts, riding, vehicles and movement execution. Set 28 supplies mount ownership/passenger assignment; Set 29 supplies biological movement modifiers; Set 27 owns economic values. | Binding cross-set ownership contract. |
| 00 - Master Game Design Bible | Multiple playstyles, living NPC civilisations, exploration, transport, high-fidelity voxel presentation and culture identity. | Mounts support exploration/civilisation without becoming mandatory or universal. |
| 01 - Core Gameplay Loop | Exploration, gathering, village interaction and expansion occur across a large seed-generated world. | Mounts accelerate and diversify travel while preserving roads, terrain and route planning. |
| 02 - Player Progression | Exploration/survival progression may unlock mobility, knowledge and equipment; one player can eventually master many systems. | Progression may grant riding/tack capabilities, but 30E does not own skills/perks. |
| 04 - Items Registry | Equipment can include specialised mount tack; item identity, inventory and durability remain data-driven. | 30E defines movement-facing tack facets only. |
| 05 - Crafting and Recipe Registry | Saddles, harnesses and related equipment must use physical crafting/repair rules where approved. | No recipes or costs are authored in 30E. |
| 06 - Resource Progression | Leather/hide remains useful for saddles, straps and culture goods. | Material identity is consumed through item definitions, not redefined. |
| 10 - Creatures and Monsters | Taming supports pets, mounts, livestock, familiars and work beasts; mount progression includes land, pack, flying, magical and culture-specific mounts; villages use work animals. | Creature systems own species, taming, AI, needs and mount candidacy. 30E owns ridden movement. |
| 11 - Biomes and World Generation | Terrain, routes, slopes, hazards, weather and realm context affect travel. | Mount movement consumes terrain/environment snapshots and route constraints. |
| 12 / 19 / 20 | Structures and settlements expose roads, gates, stables, doors, yards, route markers and functional access. | Mount clearances and mount/dismount zones become structure/blueprint contracts. |
| 14 / 24D | Realms can alter gravity, movement laws and mount/vehicle compatibility. | 30E consumes generic realm/environment movement fields. |
| 16 - Combat, Gear and Defence | Mounted combat is deferred from the original combat core; specialised mount tack exists; combat owns damage/actions. | 30E supplies mounted movement state and physical facts to Combat without owning attacks. |
| 17 - UI/UX System | First/third-person camera, full remapping, controller support, accessibility and contextual prompts are established. | 30E defines movement-facing controls/status; 17 owns final UI/settings presentation. |
| 22E - Skeletons, Rigging, IK and Attachments | Mounts define rider seat, mount direction, dismount markers, hand targets, saddle fit, camera anchors and optional passenger/cargo seats. | Directly consumed; gameplay remains movement authority. |
| 22F - Entity Animation | Mount state set includes mount-ready idle, rider mount, seated idle, ridden walk/run/fly, rider lean/aim, dismount and knock-off; seats remain stable across LOD. | Animation follows authoritative mount states; it never moves the world body independently. |
| 22H - Entity Gameplay Integration | Mount-compatible entities expose stable semantic seat/cargo roles; mount system owns permission, movement control, seat reservation and dismount validation. | 30E implements the movement-side responsibilities and consumes Forge markers. |
| 24F - Wildlife, Creatures, Monsters and Ecology Atlas | Mounts are traversal partners adapted to terrain/water/air/realm law/cargo; examples include Reedrunner, Skybridle Glider, Cinder Ram and Gravewind Steed; equipment includes harness, saddle, armour and packs. | Atlas supplies content identity/examples; 30E provides reusable mechanics. |
| 25 - Production Governance | Stable IDs, capability contracts, qualified references, validation, migration and production admission are required. | Mount profiles/tack facets/interfaces are registry-driven and validated. |
| 26 - Maritime Expansion | Water/aquatic movement remains specialist-owned; vessel passenger/cargo rules remain vessel-owned. | 30E avoids redefining aquatic mounts or vessels; interfaces are recorded where needed. |
| 30A - Movement Architecture | Mount/rider/passenger/cargo architecture, MountStatus(), rider authority modes and towing boundary are established. | Binding parent architecture. |
| 30B - Core Player Locomotion | Player ground states, input intent, collision, cameras and safe-position recovery are established. | Supplies mount/dismount entry/exit and rider body recovery. |
| 30C - Climbing and Grappling | Traversal anchors, bounded actions and dynamic validation are established. | Mount/dismount uses the same bounded traversal philosophy. |
| 30D - Airborne and Environmental Movement | Gravity, wind, aerial environment fields, falling and landing consequence handoffs are established. | Flying mounts consume the same field contract; forced dismounts hand off to 30D. |

# Governing Ownership Contract

Document 30E owns:

- mount-compatible movement definitions used while ridden;
- `Mounted` movement mode and rider/mount relationship state;
- rider control translation into mount movement intent;
- direct, assisted, destination-guided, passenger-only and NPC-controlled riding modes;
- mount/dismount target selection, clearance and bounded transition movement;
- seat occupancy/reservation from the movement side;
- ground-mount gait selection, acceleration, braking, steering and terrain response;
- mounted jump and other mount-specific traversal capabilities where explicitly defined;
- mounted body/clearance envelopes;
- mount-carried passenger and cargo movement interfaces;
- flying-mount ridden take-off, cruise, turn, climb, descend and landing movement;
- mounted camera requirements;
- movement-facing tack/saddle/harness compatibility and modifiers;
- movement-facing mount route suitability and travel performance;
- mounted multiplayer prediction/authority, persistence and LOD handoff;
- `MountStatus()` and mount-facing contributions to `MaxSpeed()`, `CargoCapacity()`, `TraversalCost()`, `TravelTime()` and `RouteAccessibility()`.

Document 30E does not own:

- taming, domestication or bond progression;
- mount personality, fear, loyalty, affection or relationship simulation;
- ownership economics, purchase price, wages or trade;
- mount hunger, disease, injury severity, healing or breeding;
- rider hunger, fatigue, injury or stamina regeneration;
- item recipes, prices, rarity or final durability calculations;
- mounted attack definitions or damage;
- work-animal towing/cart physics (30F);
- swimming/diving physics (Set 26 boundary);
- vessel passenger systems;
- animation authoring, saddle meshes or rig creation.

# Static Table of Contents

1. Locked Mount and Riding Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Mount Design Principles  
4. Runtime Architecture and State Ownership  
5. Canonical Mount Terminology  
6. Mount Capability and Compatibility Model  
7. Mount Physical-Availability Interface  
8. Ride Permission, Ownership and Seat Assignment  
9. Mount Equipment, Tack and Harness Architecture  
10. Saddle Fit, Reins, Stirrups and Rider Support  
11. Mount Movement Profiles and Gait Vocabulary  
12. Mounted State Machine  
13. Rider Control Modes and Input Intent  
14. Rider Intent, Mount Autonomy and Safety Constraints  
15. Mount Candidate Query and Interaction  
16. Mounting Action Lifecycle  
17. Standard Dismount and Safe Exit Selection  
18. Emergency Dismount, Knock-Off and Rider Separation  
19. Ground-Mount Locomotion Model  
20. Gait Selection, Speed Bands and Transitions  
21. Acceleration, Braking, Steering and Turn Envelope  
22. Voxel Step, Jump and Obstacle Traversal  
23. Slopes, Footing, Traction and Terrain Suitability  
24. Clearance, Doors, Bridges, Roads and Narrow Routes  
25. Rider Posture, Body Collision and Seated Attachment  
26. Passenger Seats and Multi-Rider Mounts  
27. Pack Cargo, Cargo Anchors and Load-Band Movement  
28. Mounted Traversal Abilities and Capability Providers  
29. Mounted Long-Distance Travel and Route Integration  
30. Flying-Mount Identity and Flight Families  
31. Flying-Mount Take-Off  
32. Ridden Flight Movement Model  
33. Climb, Cruise, Turn, Dive, Glide and Hover Capabilities  
34. Wind, Gravity, Updraft and Realm Integration  
35. Flying-Mount Landing and Ground Transition  
36. Flight Failure, Wing/Capability Loss and Emergency Descent  
37. Rider Exertion and Set 29 Consumption  
38. Mount Biology, Injury and Condition Boundary  
39. Mounted Combat Movement Integration  
40. Tack Damage, Equipment Failure and Movement Response  
41. Work Animals, Towing and 30F Handoff  
42. Structures, Stables, Hitching and Blueprint Integration  
43. NPC, Companion and Formation Integration  
44. UI, Prompts, Feedback and Mount Knowledge  
45. Accessibility and Riding Assistance  
46. Multiplayer Authority, Prediction and Seat Reservations  
47. Persistence, Save/Load and Simulation LOD  
48. Registry and Data Definitions  
49. Balance-Draft Baseline Values  
50. Godot/Summer Engine Implementation Direction  
51. Prototype Laboratories and Acceptance Tests  
52. Handoff to 30F, 30H, 30I and 30J  
53. Main-Document Integration Register  
54. Cross-Set Interface Amendments  
55. Open Decisions and Deferred Questions  
Appendix A. Mounted State Transition Matrix  
Appendix B. Mount Movement Profile Template  
Appendix C. Rider Seat and Mount Compatibility Template  
Appendix D. Tack Movement Facet Template  
Appendix E. Mount Physical Availability Snapshot  
Appendix F. Ride Permission and Seat Assignment Contract  
Appendix G. Flying Mount Profile Template  
Appendix H. Mounted Runtime Record  
Appendix I. Reason-Code Catalogue  
Appendix J. Multiplayer Mounted-Movement Contract  
Appendix K. Acceptance and Regression Matrix

# 1. Locked Mount and Riding Identity

A mount is a persistent creature/entity that temporarily becomes the primary movement body for an authorised rider. Its creature identity never disappears because someone sits on it.

> **Locked Rule**
>
> Mounting creates a movement-control relationship; it does not transfer ownership of the creature's biology, personality, AI, inventory, equipment or social state to Set 30. The mount remains the physical mover. The rider becomes an attached controller/passenger whose movement intent is filtered through mount capability, current availability, terrain and external permissions.

## 1.1 Player-Facing Promise

The player should experience mounts as distinct traversal partners:

- a fast ground mount should make roads and open terrain feel different from walking;
- a heavy mount should feel powerful but require wider routes and stronger bridges;
- a sure-footed mount should handle slopes or rough terrain better than a road sprinter;
- a pack mount should trade some performance for carried supplies;
- a flying mount should make altitude, wind and landing sites meaningful;
- culture-specific mounts should retain their own movement identity without requiring unique hard-coded controllers;
- an injured, frightened, overloaded or socially unavailable mount should explain why its movement changed through the owning system's reason codes;
- mounting and dismounting should occur in the world through validated space rather than teleporting the rider into the seat.

## 1.2 Mounts Are Not Universal Upgrades

A mount can be worse than walking for:

- tight caves;
- ladders;
- narrow houses;
- dense ruins;
- steep cliffs;
- crawlspaces;
- fragile bridges;
- highly vertical dungeon interiors.

Mounts become valuable because they are good at specific travel problems, not because the game assumes every destination should be ridden to.

# 2. Scope, Ownership and Explicit Non-Goals

## 2.1 30E Owns Detailed Movement Rules For

- ground riding;
- flying-mount riding;
- mounting/dismounting;
- rider control translation;
- mount gait switching;
- mounted turning/clearance;
- mount jump/traversal capability execution;
- rider/passenger attachment;
- movement impact of external load bands;
- flying-mount take-off/landing;
- mounted route/travel outputs.

## 2.2 30E Is Not

- a horse-breeding simulation;
- a taming minigame;
- a pet affection system;
- a creature hunger system;
- an economy for buying mounts;
- a full mounted-combat design;
- a wagon/towing system;
- an aquatic mount system;
- a universal assumption that all mounts use horse gaits;
- a rigid-body vehicle controller disguised as an animal;
- a system where player input always overrides creature safety/condition constraints.

# 3. Mount Design Principles

## 3.1 Creature First

The mount's:

- anatomy;
- body dimensions;
- locomotion family;
- animation;
- species capabilities;
- injuries;
- tame/bond state;
- AI;
- needs;

come from creature/entity owners.

Set 30 asks what movement is physically available now.

## 3.2 Data-Driven Movement Identity

A Reedrunner, Cinder Ram, Gravewind Steed and Skybridle Glider should not be implemented as separate movement code classes merely because their fiction differs.

They should compose reusable movement capabilities and profiles such as:

- medium quadruped ground runner;
- wetland sure-foot profile;
- heat-realm terrain compatibility;
- spectral/realm route compatibility;
- winged short-range flight profile.

## 3.3 Roads Still Matter

A mount gains meaningful advantages from:

- roads;
- trails;
- bridges;
- gates;
- stable yards;
- route maintenance;
- rest infrastructure.

Off-road riding is possible where the mount permits it, but good roads should materially improve speed, safety and predictability.

## 3.4 No Seat Teleport

Mounting/dismounting uses bounded traversal and clearance checks. The player's body does not vanish from one side of a creature and appear on the saddle through a wall.

## 3.5 One Physical Mover

While mounted, the mount is the primary world-collision mover. The rider remains a distinct gameplay entity for inventory, combat, social state and damage targeting, but does not run a second ground locomotion solver against the mount.

# 4. Runtime Architecture and State Ownership

```text
Player/Rider Input
      |
      v
Ride Permission + Seat Assignment (Set 28 / creature state)
      |
      v
Mount Capability + Tack + Physical Availability Resolver
      |
      v
Mounted Input Translator
      |
      +--> Direct Control
      +--> Assisted Control
      +--> Destination Guidance
      +--> Passenger Only
      |
      v
Mount Movement Controller
      |
      +--> Ground Mount Solver
      +--> Flying Mount Solver
      +--> Terrain / Route / Environment Snapshot
      +--> External Condition Constraints
      |
      v
Authoritative Mount Transform / Velocity
      |
      +--> Rider/Passenger Seat Attachment
      +--> Camera / Animation Snapshot
      +--> Movement API / Travel / Route Outputs
```

## 4.1 Authoritative Records

Separate records should exist for:

- creature/mount persistent identity (Creature owner);
- ride permission/assignment (Set 28 / creature/social owner);
- immutable mount movement definition (Set 30 registry);
- runtime mounted relationship (Set 30);
- tack/equipment instances (Item owner);
- route/travel plan (Set 30/30H);
- combat state (Document 16);
- rider biological state (Set 29).

No single `HorseComponent` should become the hidden source of truth for all of these systems.

# 5. Canonical Mount Terminology

| Term | Meaning |
| --- | --- |
| Mount Candidate | Creature/entity that currently exposes a valid mount role. |
| Rider | Entity assigned to a controlling or riding seat. |
| Passenger | Seated entity with no primary movement-control authority. |
| Seat Role | Stable semantic seat ID such as primary rider or passenger. |
| Mount Tack | Equipment used to support riding, handling, cargo or safety. |
| Saddle Fit | Forge/entity compatibility profile determining spatial fit. |
| Riding Harness | Tack that secures rider or provides specialised control/support. |
| Reins / Control Tack | Optional equipment facet enabling or improving certain rider-control modes. |
| Gait Band | Semantic movement-speed/locomotion band defined by the mount profile. |
| Ground Mount | Mount whose ridden primary movement is supported ground locomotion. |
| Flying Mount | Mount whose ridden movement profile supports sustained air movement. |
| Mount Clearance Envelope | Combined physical space required by mount plus attached rider/passengers/cargo. |
| Mount Availability | Current physical ability of the creature to enter/continue a ridden state. |
| Ride Permission | External social/ownership result permitting a rider and possibly a control level. |
| Mount Control Mode | Direct, assisted, destination-guided, passenger-only or NPC-controlled relationship. |
| Emergency Dismount | Rider separation without a normal safe stationary exit. |
| Mounted Traversal | Non-basic mount movement such as jump, leap, flight take-off or specialist terrain crossing. |
| Pack Cargo | Inventory/container load carried directly by a mount rather than a towed vehicle. |
| Towing Interface | Movement handoff to 30F for carts/wagons; not executed by 30E. |

# 6. Mount Capability and Compatibility Model

A mount-compatible creature exposes capabilities rather than requiring special-case species code.

## 6.1 Example Capability Families

- `mount.role.rider_primary`
- `mount.role.passenger`
- `mount.role.pack_cargo`
- `mount.ride.ground`
- `mount.ride.flight`
- `mount.control.direct`
- `mount.control.assisted`
- `mount.control.destination`
- `mount.traversal.step`
- `mount.traversal.jump`
- `mount.traversal.rough_ground`
- `mount.traversal.steep_slope`
- `mount.flight.run_takeoff`
- `mount.flight.leap_takeoff`
- `mount.flight.cliff_launch`
- `mount.flight.hover`
- `mount.flight.glide`
- `mount.equipment.saddle`
- `mount.equipment.pack`
- `mount.equipment.harness`
- `mount.towing.provider` (execution owned by 30F)

These are illustrative semantic families until 30J freezes final IDs.

## 6.2 Rider Compatibility

Compatibility may consider:

- rider body profile;
- mount seat scale;
- saddle fit profile;
- species/body size range;
- rider posture availability;
- equipment conflicts;
- passenger/cargo occupancy;
- current mount injury/availability;
- current tack state;
- realm/environment restrictions.

30E does not decide whether a culture socially permits the pairing.

# 7. Mount Physical-Availability Interface

Creature systems remain authoritative for the mount's living condition.

30E requires a movement-facing snapshot such as:

```text
mount_entity_id
mount_definition_id
available_for_riding
available_for_primary_control
allowed_gait_bands[]
movement_speed_modifier
acceleration_modifier
turn_modifier
jump_allowed
flight_allowed
takeoff_allowed
landing_allowed
current_locomotion_restrictions[]
current_environment_restrictions[]
forced_behaviour_state?
reason_codes[]
source_revision
```

Possible external causes include:

- injury;
- exhaustion;
- fear/panic;
- illness;
- age/size state;
- taming/bond state;
- magical suppression;
- creature AI decision.

30E applies the supplied movement result. It does not calculate those causes.

# 8. Ride Permission, Ownership and Seat Assignment

Set 28 is the cross-set provider for mount ownership/passenger assignment under the governing register.

## 8.1 Movement Requirement

Before mounting, Set 30 requires an authoritative permission result that answers:

- may this rider use this mount now?;
- which seat may they occupy?;
- may they control movement or ride only as passenger?;
- does the assignment expire?;
- are there permission reasons the UI may show?;
- which revision/token prevents stale use after ownership changes?

30E never derives permission from `Trust() > X` or similar social formulas.

## 8.2 Wild / Untamed Mount Candidates

A creature may expose mount-compatible anatomy while permission denies normal riding.

Special quests, creature systems or temporary magical effects may grant an explicit ride token. Set 30 accepts the token; it does not decide that a wild creature became tame.

# 9. Mount Equipment, Tack and Harness Architecture

Mount tack is physical item/equipment state with a movement-facing facet.

## 9.1 Tack Families

| Family | Movement-Facing Purpose | Ownership Boundary |
| --- | --- | --- |
| Saddle | Rider support, seat compatibility, control stability, optional storage/modules. | Item owns item; Forge owns fit/socket; 30E consumes movement facet. |
| Bridle / Reins | May enable/improve direct steering on compatible mounts. | Item/Creature defines compatibility; 30E applies control mode. |
| Stirrups / Foot Supports | Rider stability/pose and selected control benefits. | Item/Forge defines attachment; Combat may consume stability. |
| Rider Safety Harness | Secures rider in specialised flight/rough travel profiles. | Item owns equipment; 30E uses seat-security facet. |
| Pack Harness | Enables cargo container anchors. | Item/Inventory owns contents; 30E uses load/clearance. |
| Flying Saddle / Flight Harness | Supports high bank/flight posture and specialised rider anchors. | Same ownership split. |
| Mount Armour | Protection and possible movement/load modifiers. | Combat/Item owns defence; 30E consumes movement modifier. |
| Towing Harness | Provides compatible tow attachment. | 30F owns towing movement. |

## 9.2 Saddle Is Not Universally Mandatory

Each mount definition declares one of:

- bareback permitted;
- saddle recommended;
- saddle required;
- specialised platform/seat required;
- no conventional saddle supported.

A magical steed, giant bird and ram do not need identical tack logic.

# 10. Saddle Fit, Reins, Stirrups and Rider Support

Forge supplies:

- rider seat socket;
- saddle attachment socket;
- rider hand targets;
- rider foot/stirrup targets;
- mount direction;
- dismount clearance markers;
- camera anchors;
- passenger/cargo anchors;
- saddle fit profile.

30E validates that the equipped tack and rider are compatible with these semantic roles.

## 10.1 Fit Failure

A saddle may fail to equip/use for movement if:

- wrong fit family;
- seat obstructed;
- required attachment role missing;
- rider body outside supported range;
- mount variant changed anatomy incompatibly;
- equipment is broken/inactive;
- required harness component is absent.

Movement UI surfaces the authoritative reason rather than snapping equipment into an invalid pose.

# 11. Mount Movement Profiles and Gait Vocabulary

Not every mount trots or gallops. The runtime uses semantic gait bands while content provides culture/species-facing labels.

## 11.1 Generic Gait Bands

| Internal Band | Meaning | Horse-Like Example | Other Possibilities |
| --- | --- | --- | --- |
| Gait 0 | Idle / stationary | Stand | Perch, hover-idle, crouch. |
| Gait 1 | Slow precise travel | Walk | Stalk, amble, careful step. |
| Gait 2 | Normal route travel | Trot | Lope, bound, glide-run. |
| Gait 3 | Fast travel | Canter | Rush, extended stride. |
| Gait 4 | Maximum exertion / burst | Gallop | Charge, sprint, wingbeat burst. |

A mount profile may omit bands or use different transition rules.

## 11.2 Movement Profile Inputs

- speed per gait band;
- acceleration/braking;
- turn response/radius;
- strafe availability;
- reverse behaviour;
- step height;
- jump profile;
- slope limits;
- terrain suitability;
- body clearance;
- rider/cargo load response;
- flight profile if supported;
- external condition channels.

# 12. Mounted State Machine

Top-level movement mode:

```text
Mounted
├── Mounting
├── SeatedIdle
├── GroundRiding
│   ├── Gait1
│   ├── Gait2
│   ├── Gait3
│   └── Gait4
├── MountedJump
├── Flying
│   ├── Takeoff
│   ├── Climb
│   ├── Cruise
│   ├── Turn
│   ├── Dive
│   ├── Glide
│   ├── Hover? 
│   └── Landing
├── Passenger
├── Dismounting
└── ForcedSeparation
```

The mount itself may continue to use its creature locomotion/animation state in parallel. The Set 30 mounted record connects rider authority to that physical mover.

# 13. Rider Control Modes and Input Intent

## 13.1 Control Modes

| Mode | Meaning |
| --- | --- |
| Direct Rider Control | Rider intent directly drives the approved mount movement controller. |
| Assisted Rider Control | Rider sets direction/gait; mount safety/local steering contributes. |
| Destination-Guided | Rider selects destination/route; mount AI/navigation executes through Set 30 path interfaces. |
| Passenger Only | Rider is seated but has no movement authority. |
| NPC-Controlled | Another actor/AI owns movement intent. |
| Convoy/Caravan Follow | Mount follows group/route movement intent; detailed group ownership is handled by 30I/30F. |

## 13.2 Mounted Input Intents

Possible intents:

- forward/back movement;
- steering/turn;
- gait increase;
- gait decrease;
- burst/gallop request;
- mount jump;
- takeoff/land;
- ascend/descend;
- flight pitch/turn where profile uses them;
- dismount;
- look/aim;
- interact.

Platform bindings remain Document 17-owned.

## 13.3 Non-Strafing Mounts

For most quadruped ground mounts, lateral stick/key input primarily steers rather than strafes.

A creature only strafes if its movement profile exposes lateral locomotion capability.

# 14. Rider Intent, Mount Autonomy and Safety Constraints

Rider input does not automatically force every physical action.

## 14.1 External Intent Constraint

Creature/AI/social systems may report:

- obey;
- obey with speed cap;
- avoid hazard;
- refuse direction;
- panic/flee intent;
- stop;
- buck/force separation request;
- destination override from authoritative event/AI.

30E converts that into movement while preserving movement physics.

## 14.2 Safety Assist

Assisted control may avoid:

- obvious cliff edges;
- solid walls;
- impossible doorways;
- route segments below mount clearance;
- unsupported bridge/load class;
- invalid flying-mount landing sites.

This is movement safety/local steering, not personality.

## 14.3 Deliberate Override

World/settings/creature profiles may allow a rider to override some soft safety constraints.

Hard collision, permission, missing capability and owner-system refusal are never overridden by steering input alone.

# 15. Mount Candidate Query and Interaction

A mount interaction query resolves nearby valid mount roles.

Inputs:

- rider ID/profile;
- candidate mount entity;
- approach position;
- requested seat/control role;
- tack state;
- permission token;
- current mount movement state;
- geometry/clearance;
- current occupancy.

Result:

- allowed / denied / allowed with warning;
- selected seat;
- mount-side entry anchor;
- rider approach anchor;
- required posture;
- expected action;
- reason code;
- revision token.

# 16. Mounting Action Lifecycle

```text
Candidate
-> Permission Validated
-> Seat Reserved
-> Approach Validated
-> Mount Action Requested
-> Mounting
-> Seat Attachment Confirmed
-> Mounted Control Activated
```

## 16.1 Standard Mounting

Default mounting generally requires the mount to be:

- stationary or moving very slowly;
- on valid support/flight perch state;
- not in a hard combat/behaviour restriction;
- physically available;
- in sufficient side/seat clearance.

## 16.2 Moving Mount-On Capability

Advanced mounting while a mount is moving is not universal.

It requires an explicit capability/action profile and may be limited to low speed. The action is bounded and collision-validated like 30C traversal.

## 16.3 Seat Reservation

Reservation begins before the mounting animation reaches the seat so two riders cannot both commit to the same seat.

If mounting fails, reservation releases safely.

# 17. Standard Dismount and Safe Exit Selection

Dismounting selects a valid exit candidate rather than using a fixed left/right offset.

## 17.1 Exit Candidate Sources

- Forge-authored dismount markers;
- geometry-derived side positions;
- rear/front exit if mount profile permits;
- structure stable platform;
- flying mount landing/perch exit;
- emergency fallback.

## 17.2 Exit Validation

A valid exit needs:

- rider body clearance;
- support/airborne state compatible with requested dismount;
- no blocking voxel/entity;
- no invalid slope/hazard under ordinary dismount policy;
- no protected/permissioned space conflict;
- current mount speed inside normal-dismount band.

## 17.3 No Safe Exit

If no safe normal exit exists:

- keep rider mounted;
- report why;
- allow an explicit emergency dismount if the profile/world rules permit it.

# 18. Emergency Dismount, Knock-Off and Rider Separation

Forced separation can result from:

- rider request at speed;
- mount buck/behaviour result;
- combat knock-off result;
- mount death/incapacitation from external owner;
- saddle/harness failure;
- flight failure;
- collision/structure failure;
- teleport/realm transition rules owned elsewhere.

30E determines separation transform/velocity and hands the rider to 30B Ground or 30D Airborne.

## 18.1 Separation Facts

Possible outputs:

- rider world transform;
- mount velocity contribution;
- launch/throw impulse supplied by cause owner;
- rider posture;
- last safe position;
- fall context;
- mount-relative source direction.

Set 29/Combat decide health/injury consequences.

# 19. Ground-Mount Locomotion Model

Ground mounts use their own movement profile rather than multiplying player run speed.

## 19.1 Required Behaviour

- mount body collision is authoritative;
- rider input selects desired gait/direction;
- acceleration reaches gait target gradually;
- turn response depends on speed/body profile;
- stopping distance grows with speed;
- terrain/slope changes modify allowed gait;
- narrow spaces reduce/deny higher gaits;
- external creature state may reduce performance;
- rider remains attached to stable semantic seat.

## 19.2 Body Facing

Ground mounts normally travel primarily forward.

Camera can rotate independently, while steering intent determines desired body heading.

# 20. Gait Selection, Speed Bands and Transitions

## 20.1 Manual and Automatic Options

Supported control styles:

- explicit gait-up/gait-down;
- hold burst/gallop above normal travel gait;
- analogue automatic gait selection;
- accessibility auto-gait;
- destination-guided gait chosen by route controller.

## 20.2 Transition Rules

A gait transition considers:

- input intent;
- current speed;
- terrain suitability;
- route width/clearance;
- external availability;
- cargo/load band;
- turn angle;
- combat/action cap;
- world/accessibility settings.

## 20.3 No Instant Gallop

A mount should not move from standstill to top speed in one frame.

Likewise, reversing direction from maximum gait requires braking/turning rather than immediate negative top speed.

# 21. Acceleration, Braking, Steering and Turn Envelope

## 21.1 Steering Philosophy

Mount steering is responsive enough for a voxel game but retains a stronger forward-motion identity than the player on foot.

## 21.2 Turn Envelope

Turn ability may depend on:

- gait;
- body length;
- body width;
- rider control profile;
- footing;
- slope;
- cargo/load;
- injury/condition modifier;
- flying/ground state.

High-speed tight turns should naturally require more space.

## 21.3 Braking

Player intent may request deceleration, but maximum braking is profile-limited.

An accessibility assist may begin braking earlier when approaching a known obstacle without changing the physical stopping envelope.

# 22. Voxel Step, Jump and Obstacle Traversal

## 22.1 Auto-Step

Mount profiles define step height.

A medium ground mount should traverse ordinary small route unevenness without repeatedly jumping, but not climb a full wall through auto-step.

## 22.2 Mount Jump

Jump is capability-gated.

A valid jump may require:

- minimum approach state;
- adequate head/body clearance;
- landing candidate;
- current gait/speed band;
- external physical availability;
- cargo/load compatibility.

Mount jump physics are profile-defined and do not reuse the player's jump arc automatically.

## 22.3 Refusal / Blocked Jump

If the mount's external state refuses or cannot jump, 30E reports the owner-supplied reason and maintains normal ground movement.

## 22.4 No Mantling/Ladder Use by Default

A ridden ground mount does not use humanoid mantle, ladder or rope actions unless a specific creature movement capability explicitly supports an equivalent route.

# 23. Slopes, Footing, Traction and Terrain Suitability

Terrain context comes from the Set 30 environment/surface contract.

A mount profile may define suitability for:

- road;
- firm soil;
- grass;
- mud;
- snow;
- sand;
- loose rubble;
- steep rock;
- shallow water edge (movement handoff only; aquatic rules external);
- magical/realm surfaces.

## 23.1 Sure-Footed Identity

A sure-footed mount can retain higher gait or stability on rough/steep ground through profile data.

It does not ignore collision or walk up a wall.

## 23.2 Slippery/Unstable Surfaces

Surface owner exposes traction/stability. 30E applies:

- speed cap;
- acceleration/braking modifier;
- turn modifier;
- route denial if below minimum suitability.

# 24. Clearance, Doors, Bridges, Roads and Narrow Routes

Mounted clearance uses the **combined mount/rider/cargo envelope**.

## 24.1 Clearance Inputs

- mount body profile;
- rider seated envelope;
- passenger seats;
- cargo presentation envelopes;
- horns/wings/tail collision policy;
- saddle/platform geometry;
- current posture/gait;
- dynamic structure opening.

## 24.2 Doors and Gates

A door that fits a player may not fit a mount.

Route queries should report:

- too narrow;
- too low;
- turn impossible;
- gate closed;
- bridge/load class incompatible;
- mount prohibited by local route rules;
- alternate dismount route available.

## 24.3 Roads

Roads may improve:

- maximum safe gait;
- acceleration/braking confidence;
- route cost;
- passing opportunities;
- distant travel speed.

Road construction remains Document 20/30H integrated, not 30E-owned.

# 25. Rider Posture, Body Collision and Seated Attachment

While seated:

- mount body is primary movement collision;
- rider uses the seat transform and mount-relative posture;
- rider hurtboxes/combat targets may remain active;
- rider does not collide separately with the mount every physics step;
- rider's world interaction origin follows the mounted camera/seat policy;
- rider cannot stand/crouch freely unless the seat/action profile supports it.

## 25.1 Rider Envelope

The rider still contributes to clearance where geometry could strike the rider.

Examples:

- low tree branch;
- low tunnel ceiling;
- doorway lintel;
- flying through a narrow arch.

The combined clearance solver prevents the mount from passing through a gap that would clip the rider.

# 26. Passenger Seats and Multi-Rider Mounts

Large creatures may support more than one seat.

## 26.1 Seat Requirements

Every seat has:

- stable seat ID;
- semantic role;
- occupant class;
- control authority level;
- entry/dismount markers;
- local transform;
- rider/passenger envelope;
- camera profile;
- action restrictions;
- occupancy state.

## 26.2 Primary Controller

Exactly one seat/controller owns rider movement intent at a time unless a specialist shared-control profile explicitly exists.

Passengers cannot send competing steering commands by default.

## 26.3 Seat Swap

Seat swapping is a bounded action and may require:

- low speed;
- sufficient creature/platform space;
- vacant destination seat;
- permission;
- compatible body profile.

# 27. Pack Cargo, Cargo Anchors and Load-Band Movement

Pack cargo carried directly by a mount belongs to the mount relationship, while inventory contents remain Inventory/Item-owned.

## 27.1 Capacity Representation

Avoid forcing a universal kilogram simulation into Leyforge's slot-based inventory foundation.

A mount may expose:

- pack-container slots;
- cargo-anchor count;
- container compatibility;
- bulky-item class;
- load band;
- left/right balance requirement where visually/physically important.

## 27.2 Movement Load Bands

Example semantic bands:

- Empty;
- Light;
- Moderate;
- Heavy;
- Overloaded / movement-denied.

The inventory/creature owner resolves current load band. 30E applies the returned movement modifier.

## 27.3 Cargo Effects

Potential movement effects:

- reduced high gait;
- lower acceleration;
- longer braking;
- reduced jump availability;
- increased turn radius;
- flight take-off restriction;
- reduced climb rate;
- larger clearance envelope.

## 27.4 `CargoCapacity()`

For a mounted creature, `CargoCapacity()` returns a structured movement/logistics summary such as:

- available container/pack roles;
- slot/capacity references;
- bulky cargo compatibility;
- passenger/cargo conflicts;
- current load band;
- movement capacity state.

It does not calculate cargo value.

# 28. Mounted Traversal Abilities and Capability Providers

Mounts may support specialist traversal capabilities beyond basic ground movement.

Examples:

- long jump;
- sure-foot steep route;
- high step;
- burrow-route transition (future/content-specific);
- flight;
- glide-like flight;
- hover;
- magical phase route supplied by Magic.

Each capability has:

- entry conditions;
- route/environment requirements;
- clearance;
- external state requirements;
- exit state;
- route cost/time class.

The route can require `mount.ride.flight` without naming one specific creature.

# 29. Mounted Long-Distance Travel and Route Integration

30H owns long-distance route planning and effective travel time.

30E exposes mount performance facts:

- gait speed bands;
- sustained travel gait;
- terrain suitability;
- road preference;
- mount clearance class;
- bridge/load class;
- flight route capability;
- cargo/load movement modifier;
- current physical availability;
- expected rest interface from creature system;
- passenger/cargo capacity summary.

## 29.1 Distant Travel

At distance, the simulation need not animate every stride.

A mounted travel record can advance through route legs using:

- route distance;
- mount travel profile;
- route quality;
- environmental conditions;
- external rest/condition results;
- event interruptions.

Creature systems remain responsible for biological needs and mount condition during distant travel.

# 30. Flying-Mount Identity and Flight Families

Flying mounts are creature movers with rider-control relationships. They are not glider items and are not air vehicles.

## 30.1 Flight Families

Possible reusable movement families:

| Family | Movement Identity |
| --- | --- |
| Winged Powered Flight | Active flapping/climb, forward flight, turn/bank, landing requirements. |
| Winged Glide-Dominant | Limited powered climb, strong dependence on height/wind, efficient glide. |
| Hover-Capable Creature | Can maintain position within profile limits; biological/magical cost external. |
| Magical/Spectral Flight | Movement capability supplied by creature/magic definition; may ignore ordinary wing aerodynamics but still obey declared field/route rules. |
| Leaping/Short-Hop Flyer | Short aerial bursts rather than sustained long-range flight. |

## 30.2 Content Examples

The Atlas's **Skybridle Glider** can use a glide-dominant short-range aerial mount profile, while other future flying creatures may use powered or hover profiles.

The content record chooses the family; 30E supplies movement mechanics.

# 31. Flying-Mount Take-Off

Take-off is capability-profiled.

## 31.1 Take-Off Types

- standing/leap take-off;
- running take-off;
- cliff/perch launch;
- vertical hover lift;
- magical transition.

## 31.2 Validation

Take-off checks:

- flight physically available;
- rider/passenger/cargo compatible;
- overhead/wing clearance;
- route corridor clear;
- required ground speed if applicable;
- environment/gravity field;
- external creature-state permission;
- no hard combat/status lock.

## 31.3 Failed Take-Off

Failure does not teleport the mount upward.

It remains GroundRiding or enters a short jump/fall only if a physically valid leap already occurred.

# 32. Ridden Flight Movement Model

Flying mounts use a reduced-order deterministic movement model appropriate to their flight family.

## 32.1 Shared Inputs

- rider intent;
- mount flight profile;
- current air-relative/world velocity;
- gravity/local-up;
- wind/gust/updraft field from XSI-30-004;
- creature physical availability;
- cargo/load movement modifier;
- tack/harness movement modifier;
- combat/action caps.

## 32.2 Powered Winged Flight

May use:

- target airspeed band;
- forward thrust/lift profile;
- climb-rate limit;
- bank/turn response;
- stall/minimum-flight speed if species profile requires it;
- glide fallback.

## 32.3 Hover Flight

Hover capability is explicit.

A non-hovering winged mount cannot stop in mid-air because the rider released input.

## 32.4 Creature Movement Difference

Wing animation is presentation. The flight controller owns physical velocity; creature biology/AI owns whether the animal can continue powering flight.

# 33. Climb, Cruise, Turn, Dive, Glide and Hover Capabilities

## 33.1 Climb

Climb rate is profile-limited and may be reduced by:

- heavy load;
- strong downdraft;
- injury/condition result;
- high gravity;
- low atmosphere/realm suitability.

## 33.2 Cruise

Cruise is the efficient sustained travel state used by route/time calculation.

## 33.3 Turn

Turn radius depends on:

- speed;
- bank authority;
- body size;
- flight family;
- wind;
- current climb/dive state.

## 33.4 Dive

A dive trades altitude for speed where the flight family permits.

Combat may consume dive speed for an attack, but 30E does not calculate damage.

## 33.5 Glide

A powered winged mount may glide when not actively climbing/thrusting if its profile permits.

It can reuse 30D environmental sampling but not the player glider equipment profile.

## 33.6 Hover

Hover is profile/capability-gated and may still drift under strong environmental force depending on the mount definition.

# 34. Wind, Gravity, Updraft and Realm Integration

Flying mounts consume XSI-30-004 Environmental Movement Field Contract.

30E never creates weather or realm gravity.

## 34.1 Wind

Wind influences:

- ground track;
- take-off/landing approach;
- cruise speed over ground;
- turn planning;
- glide performance;
- rider camera/presentation cues.

## 34.2 Updrafts / Windways

Eligible flying mounts may use updrafts and windways for:

- reduced biological effort (meaning owned externally);
- improved climb;
- route efficiency;
- skyland navigation.

30H uses the resulting route segment performance.

## 34.3 Realm Compatibility

Mount profiles can declare compatibility with:

- gravity bands;
- atmosphere classes;
- realm movement laws;
- special field categories.

An incompatible realm should deny or degrade flight through authoritative content data rather than hidden hard-coded realm names.

# 35. Flying-Mount Landing and Ground Transition

Landing is a planned transition from Flying to GroundRiding/SeatedIdle.

## 35.1 Landing Candidate

A valid landing site needs:

- sufficient footprint;
- wing/body/rider clearance;
- acceptable slope;
- supported surface;
- compatible terrain;
- no blocking entity/structure;
- route/permission compatibility where applicable.

## 35.2 Landing Styles

Profiles may support:

- running landing;
- short flare/step landing;
- perch landing;
- vertical hover landing;
- glide-style landing.

## 35.3 Auto-Landing Assist

Accessibility may provide landing-site selection/approach assistance among already valid candidates.

It does not create a landing platform or ignore collision.

# 36. Flight Failure, Wing/Capability Loss and Emergency Descent

External creature/combat state may remove or reduce flight capability.

30E receives the updated physical-availability snapshot.

Possible movement response:

- continue powered flight at reduced performance;
- transition to glide;
- forced descent;
- uncontrolled Airborne/fall using 30D environmental/gravity solver;
- emergency landing request;
- forced rider separation if an external result requires it.

The creature system/Combat decides the injury or failure cause.

## 36.1 Mounted Falling

Where the rider remains attached to a falling mount:

- mount remains primary mover;
- 30D gravity/environment facts apply to the mount movement profile;
- landing/impact consequences are sent to the appropriate biological/combat owners for mount and rider;
- 30E handles only the movement relationship and separation state.

# 37. Rider Exertion and Set 29 Consumption

Riding does not automatically drain rider stamina every second.

30E may submit XSI-30-002 movement-exertion requests for actions such as:

- difficult bareback riding;
- high-speed riding without proper support;
- strenuous mount control under harsh conditions;
- repeated mounted jump support;
- unstable flying-mount handling;
- hanging/standing specialist saddle actions if later approved.

Set 29 decides stamina/fatigue effects.

A comfortable ordinary travel gait with suitable tack may require negligible rider exertion.

# 38. Mount Biology, Injury and Condition Boundary

30E does not define mount health bars, food, disease, wounds, fear or exhaustion formulas.

The creature/biological owner supplies:

- movement modifier;
- allowed gait;
- jump/flight availability;
- forced behaviour;
- current ride availability;
- rest requirement interface;
- reason codes.

## 38.1 Rider Injury

Set 29 may restrict:

- mounting action;
- ability to remain seated;
- direct-control effectiveness;
- emergency dismount;
- use of certain tack;
- mounted combat posture.

30E consumes those movement restrictions.

# 39. Mounted Combat Movement Integration

Combat owns:

- mounted attack definitions;
- aim/weapon restrictions;
- charge attacks;
- hit detection;
- damage;
- stagger;
- mount/rider targeting;
- knock-off cause;
- rider defensive actions.

30E exposes:

- mount speed/gait;
- velocity;
- facing;
- turn rate;
- airborne/flying state;
- seat role;
- stability/movement state;
- jump/landing state;
- forced separation result;
- movement caps/locks.

## 39.1 Combat Movement Locks

Combat may request:

- gait cap;
- turn cap;
- no jump;
- no take-off;
- no dismount;
- forced stop;
- movement impulse;
- forced separation.

30E applies the movement consequence without defining the attack.

## 39.2 No Automatic Charge Damage

High mount speed alone does not automatically damage anything.

A valid Combat action/collision rule must authorise damage or knockback.

# 40. Tack Damage, Equipment Failure and Movement Response

Item/Combat systems own tack durability and breakage.

30E consumes resolved tack state.

Possible movement consequences:

- direct control downgraded to assisted;
- high gait unavailable;
- passenger seat disabled;
- cargo anchor disabled;
- rider stability reduced through a movement-facing modifier;
- flying mount take-off denied without flight harness;
- forced dismount requested by equipment owner if the seat is no longer valid.

The movement system does not subtract durability per kilometre by itself.

# 41. Work Animals, Towing and 30F Handoff

A rideable creature may also be a work/towing animal, but towing movement belongs to 30F.

30E exposes:

- mount/tow provider identity;
- ground movement profile;
- hitch/towing capability;
- current physical availability;
- harness compatibility;
- rider occupancy;
- pack cargo state;
- route compatibility.

30F owns:

- hitching to carts/wagons;
- combined tow geometry;
- tow load movement;
- wagon turning;
- draft formation;
- cart/wagon passengers/cargo;
- convoy execution.

A towing harness item may be visible in 30E's tack schema but its towing physics are not defined here.

# 42. Structures, Stables, Hitching and Blueprint Integration

Buildings/Blueprints may expose mount-facing markers:

- stable stall;
- mount bed/rest point;
- feeding/water point (function owned elsewhere);
- mounting platform;
- safe dismount zone;
- hitch post;
- pack loading zone;
- flying-mount perch;
- flight launch platform;
- landing yard;
- gate/door clearance class;
- mount route connector.

## 42.1 Blueprint Validation

Validate:

- mount path reaches marker;
- stall/yard fits mount body profile;
- rider can mount/dismount;
- gate route fits combined envelope;
- flight launch/landing has corridor clearance;
- hitch marker connects to 30F-compatible route if towing is intended.

# 43. NPC, Companion and Formation Integration

Set 28 decides social/companion intent. 30I owns broader pathfinding/formations.

30E provides movement execution for:

- NPC rider controlling mount;
- companion mounted passenger;
- companion on own mount;
- mounted formation slot;
- mount following rider on foot;
- convoy transition handoff.

## 43.1 Formation Boundary

Set 28/30I may request:

- follow leader;
- flank left/right;
- trail distance;
- passenger assignment;
- mount assignment.

30E uses the mount's physical turn/clearance/speed limits to realise the request.

A formation cannot force two large mounts through a one-mount gate simultaneously.

# 44. UI, Prompts, Feedback and Mount Knowledge

Normal mounted HUD should remain minimal.

## 44.1 Contextual Information

Potential elements:

- current mount name/identity where known;
- current gait;
- movement restriction icon/reason;
- seat/passenger state;
- pack capacity summary;
- take-off/landing availability;
- mount route incompatibility;
- flying-mount wind/landing warning;
- external condition warning from creature owner;
- dismount blocked reason.

## 44.2 Mount Interaction Prompt

Prompt should distinguish:

- Ride;
- Passenger;
- Mount unavailable;
- Seat occupied;
- Permission denied;
- Saddle/tack required;
- Too injured/exhausted (owner-supplied reason);
- No room to mount/dismount.

## 44.3 Knowledge

Unknown creatures should not reveal full hidden capabilities merely because they are technically mount-compatible. Codex/knowledge state controls player-facing disclosure.

# 45. Accessibility and Riding Assistance

## 45.1 Supported Assists

- toggle/hold gait burst;
- auto-gait;
- steering sensitivity;
- stronger obstacle avoidance;
- automatic early braking;
- easier mount candidate selection;
- larger safe mount/dismount alignment tolerance within valid geometry;
- auto-select valid dismount side;
- flying-mount take-off assist;
- flying-mount landing assist;
- auto-level flight assist;
- reduced camera bob/sway/bank;
- stable horizon;
- camera distance options;
- stronger route/clearance warnings;
- controller aim assistance while mounted where Combat permits;
- no rapid-tap riding inputs.

## 45.2 Assistance Boundary

Assistance may automate a **valid** riding decision.

It may not:

- grant permission to another player's mount;
- create a missing saddle;
- fit a mount through a smaller doorway;
- ignore a broken wing;
- enable flight on a non-flying mount;
- eliminate a hard route restriction.

# 46. Multiplayer Authority, Prediction and Seat Reservations

## 46.1 Authority

Server/host owns:

- mount transform/velocity;
- mounted relationship;
- seat reservations/occupancy;
- ride permission token validation;
- rider control mode;
- gait state;
- mount/dismount commit;
- jump/take-off/landing acceptance;
- flying-mount movement;
- cargo/load movement state;
- forced separation;
- current route/travel state.

## 46.2 Client Prediction

The controlling rider may predict:

- steering;
- acceleration;
- gait changes;
- ground jump;
- flight control;

using the current replicated mount profile and external-state revision.

Passengers do not predict authority-changing movement inputs.

## 46.3 Seat Reservation

Server validates seat reservation before mounting.

Reservation record includes:

- mount ID;
- seat ID;
- requester;
- permission token revision;
- reservation state;
- expiry;
- action sequence.

## 46.4 Anti-Cheat

Reject:

- mount control without permission;
- impossible speed/turn;
- unauthorised gait/flight capability;
- mounting occupied seat;
- dismount through collision;
- flight without valid current capability;
- client-only cargo/load reduction;
- ignoring authoritative external movement restrictions.

# 47. Persistence, Save/Load and Simulation LOD

## 47.1 Persistent Ownership Split

Creature owner persists:

- mount identity;
- tame/domestic state;
- condition/health;
- creature inventory/state;
- social/ownership references where appropriate.

Set 30 persists:

- current rider/passenger attachment;
- seat occupancy;
- mounted movement mode/state;
- mount movement profile revision;
- active route/travel plan reference;
- current gait;
- flying-mount flight state needed for reconstruction;
- safe dismount/safe-position references;
- 30F towing relation reference only when applicable.

## 47.2 Save While Mounted

On load:

1. resolve mount entity;
2. resolve rider entity;
3. validate permission/assignment revision or safe fallback policy;
4. validate seat/Forge marker;
5. validate mount movement profile;
6. restore tack references;
7. validate collision and mounted envelope;
8. restore Ground/Flying state if safe;
9. otherwise dismount to a validated safe position or restore rider independently without deleting the mount.

## 47.3 Simulation LOD

Nearby mounted travel uses full bodies/animation/collision.

Distant mounted travel uses route progress and compact movement records while preserving:

- mount identity;
- rider/passengers;
- cargo references;
- external mount condition;
- route leg;
- interruption/event hooks;
- ownership/permission references.

# 48. Registry and Data Definitions

## 48.1 MountMovementProfile

Suggested fields:

```text
mount_movement_profile_id
supported_body_profiles[]
mount_role_capabilities[]
control_modes[]

ground_gait_profiles[]
ground_acceleration_profile
braking_profile
turn_profile
reverse_policy
strafe_policy
step_profile
jump_profile?
slope_profile
terrain_suitability_profile
clearance_profile

flight_profile_id?

rider_seat_requirements[]
passenger_capabilities[]
cargo_movement_profile?
towing_capability_ref?

environment_response_profile
external_condition_channels[]
route_cost_profile
camera_profile
prediction_profile
version
```

## 48.2 MountedRelationshipRecord

```text
mount_entity_id
primary_rider_id?
seat_occupants{}
control_mode
control_authority_entity_id?
mount_movement_profile_id
current_mounted_state
current_gait_or_flight_state
permission_token_ref
mount_availability_revision
tack_state_revision
cargo_load_band
route_plan_ref?
safe_exit_ref?
authoritative_tick
```

## 48.3 SeatDefinition

```text
seat_id
semantic_role
seat_socket_role
supported_rider_profiles[]
control_authority_level
entry_markers[]
dismount_markers[]
clearance_profile
camera_profile
pose_profile
required_tack_capabilities[]
passenger_actions[]
reservation_profile
```

# 49. Balance-Draft Baseline Values

These values are implementation starting targets for **one medium riding-mount prototype**, not universal species balance.

## 49.1 Medium Ground Riding Mount

| Parameter | Starting Target |
| --- | ---: |
| Gait 1 / precise travel | ~3.0 m/s |
| Gait 2 / normal route travel | ~5.5 m/s |
| Gait 3 / fast travel | ~8.0 m/s |
| Gait 4 / burst | ~10.5-11.5 m/s |
| Ground acceleration | ~7-10 m/s² by gait |
| Strong braking | ~9-13 m/s² by gait |
| Auto-step target | ~0.55-0.65 m |
| Stable ordinary slope | ~38-42 degrees profile target |
| High-gait turn rate | intentionally reduced versus low gait |
| Normal mount/dismount speed | stationary to ~1.0 m/s |
| Advanced moving-mount action | capability-gated; initial test <= ~3 m/s |
| Standard mounted jump | profile should clear a normal one-metre voxel obstacle when approach/landing are valid |

## 49.2 Pack Load Effects - Prototype Bands

| Load Band | Example Movement Starting Effect |
| --- | --- |
| Empty | 1.00 speed / 1.00 acceleration |
| Light | ~0.98 / 0.98 |
| Moderate | ~0.92 / 0.90; highest gait may remain available |
| Heavy | ~0.80 / 0.75; jump/high gait may be restricted |
| Overloaded | movement denied or lowest gait only, according to external owner result |

These are Set 30 movement multipliers only after Inventory/Creature resolves the load band.

## 49.3 Medium Flying Mount Prototype

| Parameter | Starting Target |
| --- | ---: |
| Ground run before take-off (run-launch family) | ~7-9 m/s |
| Cruise airspeed | ~14-17 m/s |
| Fast flight | ~20-23 m/s |
| Sustainable climb | ~3.5-5.0 m/s |
| Controlled descent | ~4-7 m/s |
| Glide fallback ratio | profile-specific, initial ~4:1 to 6:1 |
| Bank limit | ~45-55 degrees normal riding |
| Hover | unavailable unless explicit capability |
| Landing approach | profile-specific, generally below normal cruise band |

Biological endurance is not defined by these values.

# 50. Godot/Summer Engine Implementation Direction

## 50.1 Recommended Runtime Services

```text
MountCompatibilityResolver
RidePermissionAdapter
MountSeatReservationService
MountInteractionQuery
MountedRelationshipController
MountedInputTranslator
GroundMountMovementController
FlyingMountMovementController
MountClearanceSolver
MountTackMovementAdapter
MountedCameraAdapter
MountedNetworkAdapter
MountedTravelAdapter
MountDebugService
```

## 50.2 Entity/Movement Composition

A mount should retain the same core entity body used when unmounted.

Recommended composition concept:

```text
MountEntityRoot
├── CreatureGameplayRecordAdapter
├── MovementBody / CharacterBody3D wrapper
├── MountMovementController
├── MountSeatProvider
├── Equipment/Tack Provider
├── Visual Rig
└── Interaction/AI Adapters

RiderEntityRoot
├── Rider gameplay state
├── MountedRelationship Adapter
├── Visual rig attached to resolved seat presentation
└── Camera / interaction adapter
```

## 50.3 Do Not Reparent Gameplay Authority Blindly

The rider visual may follow the mount seat transform, but persistent identity, inventory, combat ownership and network entity identity remain separate.

Avoid making the rider a purely decorative child node whose gameplay state disappears while mounted.

## 50.4 Collision

During mounted travel:

- mount movement body owns primary collision;
- combined rider/cargo clearance is queried before entering restricted spaces;
- rider hurtboxes may remain active for Combat;
- seat attachments use semantic transforms;
- dismount restores the rider's own movement body after clearance validation.

## 50.5 Flying Mount Solver

Reuse 30D's environmental sampler and gravity conventions, but use `FlyingMountProfile` rather than the player glider model.

The solver should remain deterministic and kinematic enough for multiplayer prediction.

## 50.6 Summer Engine Workflows

Summer Engine can assist with:

- mount profile generation;
- seat-fit tests;
- collision/clearance fixtures;
- rider pose preview;
- route capability tests;
- flying-mount wind/gravity matrices;
- network prediction regression;
- registry validation.

AI-generated movement changes require normal review and Set 30 contract tests.

# 51. Prototype Laboratories and Acceptance Tests

## 51.1 Mount Fit Lab

Use multiple rider/mount body profiles to verify:

- seat alignment;
- saddle fit;
- hand/foot targets;
- camera anchor;
- rider clearance;
- dismount markers;
- invalid-size rejection.

## 51.2 Mount/Dismount Lab

Test:

- left/right side;
- narrow wall side;
- low ceiling;
- slope;
- moving slowly;
- seat already reserved;
- no safe exit;
- emergency dismount.

No teleport through geometry.

## 51.3 Ground Gait Lab

Verify:

- acceleration through gaits;
- braking;
- turn radius;
- reverse;
- steering on keyboard/controller;
- high-speed obstacle approach;
- camera parity first/third person.

## 51.4 Voxel Route Lab

Build:

- half-step unevenness;
- one-block jump obstacle;
- narrow gate;
- low arch;
- steep road;
- mud/snow/sand bands;
- bridge with clearance/load tags.

Verify truthful route acceptance/denial.

## 51.5 Pack Cargo Lab

Test Empty/Light/Moderate/Heavy/Overloaded snapshots.

Verify movement applies external load band without calculating inventory weight/value.

## 51.6 Multi-Rider Lab

Use a large creature with:

- rider seat;
- two passenger seats;
- cargo seat conflict.

Verify stable seat IDs, reservation, cameras and dismount.

## 51.7 Flying Mount Lab

Profiles:

- run take-off;
- leap take-off;
- glide-dominant Skybridle-style mount;
- hover-capable synthetic test mount.

Verify:

- take-off clearance;
- cruise/turn/climb;
- wind response;
- landing;
- failed flight capability;
- rider separation.

## 51.8 Environment Lab

Use XSI-30-004 synthetic fields:

- still air;
- crosswind;
- updraft;
- downdraft;
- low gravity;
- high gravity;
- side gravity test realm.

Flying mount movement must remain profile-driven and field-consistent.

## 51.9 External State Lab

Synthetic creature snapshots:

- healthy;
- gait-limited;
- no jump;
- no flight;
- panic/flee request;
- ride unavailable.

30E must obey without recalculating the cause.

## 51.10 Combat Boundary Lab

Combat requests:

- gait cap;
- charge action;
- knock-off;
- mount hit causing flight loss;
- rider hit while passenger.

Verify movement changes while damage remains outside 30E.

## 51.11 Multiplayer Lab

Under latency:

- two players mount same seat simultaneously;
- rider + passenger;
- gait changes;
- mount jump;
- flying turn;
- dismount;
- ownership/permission change while mounted.

Server authority must remain deterministic.

# 52. Handoff to 30F, 30H, 30I and 30J

## 52.1 30F - Work Animals, Handcarts, Wagons, Carriages and Caravans

30F receives:

- mount/tow provider identity;
- ground movement profile;
- physical availability;
- towing capability;
- towing-harness compatibility;
- rider occupancy;
- route suitability;
- body/turn envelope.

30F owns combined draft/tow movement and wagon/cart behaviour.

## 52.2 30H - Roads, Routes and Travel

30H receives:

- mount route compatibility;
- travel gait;
- clearance/load class;
- terrain suitability;
- flight route profile;
- current availability;
- expected mounted travel speed.

## 52.3 30I - Navigation, Formations, Multiplayer and Persistence

30I consumes:

- mounted mover profiles;
- seat/formation occupancy;
- local steering envelope;
- mounted transition links;
- group speed constraints;
- simulation-LOD mounted records.

## 52.4 30J - Registries and Final Integration

30J freezes:

- mount movement schemas;
- seat definitions;
- tack facets;
- flight profiles;
- reason codes;
- APIs;
- validators;
- migration rules.

# 53. Main-Document Integration Register

| Existing Document | Required Integration |
| --- | --- |
| 02 | Riding/flying-mount progression grants capabilities/knowledge; no duplicate movement formulas. |
| 04 | Add canonical saddle, harness, pack and mount-tack families with 30E movement facets. |
| 05 | Crafting owns approved tack recipes/repair. |
| 07 | NPC village uses Set 30 mounted movement/path execution for riders/work animals. |
| 10 | Creature definitions expose mount capabilities, taming state and physical availability; 30E owns ridden execution. |
| 11 | Terrain/worldgen exposes route/surface/environment constraints for mounts. |
| 12 / 19 / 20 | Structures/blueprints expose stable, hitch, mount, launch, landing and clearance markers. |
| 14 / 24D | Realm movement laws expose mount compatibility through environmental/capability contracts. |
| 16 | Combat consumes mounted state and requests movement caps/knock-off; it owns attack/damage. |
| 17 | UI owns mounted controls, prompts, HUD and accessibility settings presentation. |
| 22E/F/H | Forge owns rider seats, saddle fit, rigs, IK and mount animations; Set 30 remains movement authority. |
| 24F | Atlas creature content maps to reusable Set 30 mount movement profiles. |
| 25 | Canonical registries/capabilities validate mount/tack/seat references. |
| 26 | Aquatic/vessel movement remains expansion-owned; use explicit boundaries. |
| 30A-D | Parent architecture, player handoff, bounded traversal and environmental fields remain binding. |

# 54. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward; pending explicit approval.

30E does not redefine player swimming/diving. Water-capable mounted movement is not silently assigned in this document.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Carried forward.

30E may send rider-exertion contexts for strenuous riding actions. Set 29 remains sole owner of rider stamina/fatigue/biological state.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** Carried forward and consumed by mounted group movement through 30I.

No ownership change.

## XSI-30-004 - Environmental Movement Field Contract

**Status:** Carried forward from 30D.

Flying mounts consume the same authoritative gravity/wind/airfield snapshot. 30E does not create weather or realm laws.

## XSI-30-005 - Set 29 Fall Impact Consequence Contract

**Status:** Carried forward.

Used when a rider is forcibly separated into a fall or when mounted aerial failure creates rider impact. Set 29 owns biological consequences.

## XSI-30-006 - Set 28 Ride Permission and Seat Assignment Contract

**Status:** New formal interface requirement; no ownership transfer.

The governing register already assigns mount ownership and passenger assignment inputs to Set 28. 30E requires a stable read-only contract so movement never calculates social permission itself.

Recommended response:

```text
ride_permission_result_id
requester_entity_id
mount_entity_id
requested_seat_role

allowed
assigned_seat_id?
control_authority = direct | assisted | destination | passenger_only | none
mount_owner_ref?
assignment_scope
expires_at_or_condition?
permission_token
reason_codes[]
source_state_revision
```

Set 28 remains owner of the social/relationship/companion logic that produces this result.

## XSI-30-007 - Aquatic Mount Riding Boundary

**Status:** New integration issue recorded for final review; no ownership transfer.

Set 30 owns the mounted relationship, rider seat and mount movement framework, while Set 26 owns aquatic movement/fluid-current rules. Some Atlas/content families may eventually be rideable in water or transition between land and water.

Recommended boundary:

- 30E owns mounting, rider/passenger seat state and control relationship;
- Set 26/aquatic movement owner supplies water movement forces, immersion/drag/current rules and aquatic route state;
- creature systems supply whether the mount species can swim/aquatically travel;
- 30E consumes the resolved aquatic-mount movement provider rather than inventing a second water solver;
- rider survival consequences remain Set 29/Set 26 interfaces as already defined.

This boundary requires explicit integration approval before an aquatic ridden-mount production feature is implemented.

No new Set 27 interface is required by 30E.

# 55. Open Decisions and Deferred Questions

1. Final canonical Core mount roster after post-Atlas production classification.
2. Which mount family is the first production teaching mount.
3. Whether early mounts require saddles or one introductory bareback-compatible mount exists.
4. Final gait labels shown to players for non-horse-like species.
5. Whether explicit gait-up/down is default or analogue/auto gait is the main control scheme.
6. Final medium-mount speed targets after world-scale and streaming tests.
7. Final mount jump distance/height after creature rig testing.
8. Whether high-speed automatic obstacle avoidance is always on, accessibility-only or profile-specific.
9. Whether player input can deliberately override soft cliff avoidance on all mounts.
10. Final rules for mount fear/refusal presentation; cause remains creature/social-owned.
11. Whether a saddle can provide inventory directly or only enable attached pack containers.
12. Final slot/cargo-capacity representation for pack mounts after Item/Inventory production integration.
13. Whether side-to-side cargo imbalance materially affects movement or remains presentation except for special loads.
14. Whether rider weapons can be drawn during mounting/dismounting; Combat owns action rules.
15. Final moving-mount mounting speed/capability.
16. Whether player can stand on very large mount platforms outside seats; potentially future specialist movement.
17. Which large creatures support multiple riders.
18. Whether flying mounts are Core Production, post-Core progression or a later content milestone.
19. Whether Skybridle Glider is selected as the first aerial mount implementation target.
20. Final take-off/landing families for dragon/wyvern/bird-style mounts.
21. Whether powered winged mounts use an explicit stall model for all species or only profiles that need it.
22. Whether hover-capable mounts are rare magical content only.
23. Final camera default for first-person mounted riding, especially very large/winged mounts.
24. Whether motion comfort defaults automatically reduce camera bob more strongly while mounted.
25. Final mounted-client prediction ownership for shared/NPC-controlled mounts.
26. How public multiplayer handles temporary permission to another player's mount; Set 28/Multiplayer governance owns permission policy.
27. Final persistence rule when a ride permission expires while both entities are offline.
28. Final relationship between creature rest/feed schedules and 30H distant mounted travel.
29. Final towing-harness overlap between 30E tack facets and 30F draft system.
30. Approval of XSI-30-006.
31. Approval/resolution of XSI-30-007.
32. Resolution of XSI-30-001 and final XSI-30-002/XSI-30-004/XSI-30-005 schemas.

# Appendix A. Mounted State Transition Matrix

| From | Trigger | To | Required Validation | Failure / Alternative |
| --- | --- | --- | --- | --- |
| Ground player | Ride request | Mounted/Mounting | permission, seat, fit, clearance, mount availability | remain Ground; reason |
| Mounted/Mounting | seat reached | Mounted/SeatedIdle | seat still reserved/valid | safe abort to Ground |
| SeatedIdle | movement intent | GroundRiding/Gait | control authority, mount availability | remain idle/passenger |
| GroundRiding | jump request | MountedJump | mount jump capability, clearance, route | remain GroundRiding |
| GroundRiding | take-off request | Flying/Takeoff | flight capability, profile, clearance, availability | remain ground |
| Flying | land request/candidate | Flying/Landing | landing candidate valid | remain Flying |
| Flying/Landing | ground contact | GroundRiding/SeatedIdle | support/clearance | bounce/flying/fall according to profile |
| Any Mounted | normal dismount | Dismounting | safe exit candidate, speed | remain mounted |
| Any Mounted | forced separation | ForcedSeparation | cause authoritative | Ground or 30D Airborne |
| Passenger | seat swap | Mounted/Passenger or Rider | permission, vacant seat, bounded path | remain seat |
| Mounted | mount unavailable | appropriate fallback | creature-state result | stop/dismount/fall as profile requires |

# Appendix B. Mount Movement Profile Template

```text
mount_movement_profile_id
mount_class
supported_body_profiles[]
mount_capabilities[]
control_modes[]

seat_profile_refs[]
required_tack_capabilities[]

gait_profiles[]
acceleration_profile
braking_profile
turn_profile
reverse_policy
strafe_policy
step_profile
jump_profile?
slope_profile
terrain_suitability_profile
clearance_profile

flight_profile_id?

passenger_profile?
cargo_movement_profile?
towing_capability_ref?

external_condition_channels[]
environment_response_profile
route_cost_profile
camera_profile
prediction_profile
version
```

# Appendix C. Rider Seat and Mount Compatibility Template

```text
mount_definition_id
seat_id
seat_role
seat_socket_role
saddle_fit_profile_id?

supported_rider_body_profiles[]
supported_rider_size_band
required_tack_capabilities[]
control_authority_supported[]

rider_hand_target_roles[]
rider_foot_target_roles[]
entry_marker_roles[]
dismount_marker_roles[]
combined_clearance_profile_id
camera_profile_id
pose_profile_id
reservation_profile_id
```

# Appendix D. Tack Movement Facet Template

```text
item_definition_id
tack_family
compatible_mount_fit_profiles[]
provided_mount_capabilities[]
provided_seat_capabilities[]
control_mode_modifiers[]
movement_speed_modifier?
acceleration_modifier?
turn_modifier?
rider_stability_modifier?
pack_container_roles[]
cargo_anchor_roles[]
flight_harness_capability?
towing_harness_capability?
movement_failure_state_binding
presentation_socket_role
version
```

# Appendix E. Mount Physical Availability Snapshot

```text
mount_entity_id
snapshot_tick
source_revision

available_for_riding
available_for_primary_control
allowed_gait_bands[]
movement_speed_modifier
acceleration_modifier
turn_modifier
jump_allowed
flight_allowed
takeoff_allowed
landing_allowed

locomotion_restrictions[]
environment_restrictions[]
forced_behaviour_state?
reason_codes[]
```

# Appendix F. Ride Permission and Seat Assignment Contract

```text
ride_permission_result_id
requester_entity_id
mount_entity_id
requested_seat_role

allowed
assigned_seat_id?
control_authority
mount_owner_ref?
assignment_scope
permission_token
expires_at_or_condition?
reason_codes[]
source_state_revision
```

# Appendix G. Flying Mount Profile Template

```text
flying_mount_profile_id
flight_family
required_mount_capabilities[]

takeoff_types[]
minimum_takeoff_speed?
takeoff_clearance_profile

cruise_airspeed_band
fast_airspeed_band
minimum_flight_speed?
climb_rate_limit
descent_rate_band
glide_ratio?
hover_supported

pitch_response
bank_response
turn_response
thrust_lift_profile
wind_response_profile
gravity_response_profile
updraft_response_profile
stall_profile?

landing_types[]
landing_approach_profile
landing_clearance_profile
emergency_descent_policy

cargo_load_response
external_condition_channels[]
camera_profile_id
prediction_profile_id
version
```

# Appendix H. Mounted Runtime Record

```text
mounted_relationship_id
mount_entity_id
seat_occupants{}
primary_rider_id?
control_authority_entity_id?
control_mode

movement_profile_id
movement_mode = Mounted
mounted_state
gait_or_flight_state
position
rotation
velocity

permission_token_ref
mount_availability_revision
tack_state_revision
cargo_load_band
environment_snapshot_id?
route_plan_ref?

safe_dismount_ref?
prediction_sequence
authoritative_tick
```

# Appendix I. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| mount.permission.denied | Rider lacks current ride permission. | Set 28 |
| mount.seat.occupied | Requested seat already reserved/occupied. | Set 30 |
| mount.seat.incompatible | Rider/seat/tack fit invalid. | Set 30 + Forge/Item data |
| mount.tack.required | Required movement tack capability missing. | Item/Creature data surfaced by Set 30 |
| mount.unavailable | Creature owner reports mount unavailable. | Creature owner |
| mount.control.passenger_only | Assignment permits passenger but not control. | Set 28 |
| mount.mounting.blocked | Mounting path/clearance invalid. | Set 30 |
| mount.dismount.blocked | No safe normal dismount candidate. | Set 30 |
| mount.route.too_narrow | Combined envelope cannot use route. | Set 30 |
| mount.route.slope | Mount profile cannot use slope. | Set 30/environment data |
| mount.route.bridge_class | Route/bridge incompatible with mount profile. | Route/structure + Set 30 |
| mount.jump.unavailable | Current mount state/capability denies jump. | Set 30 + external snapshot |
| mount.flight.unavailable | Flight capability/state unavailable. | Creature/Set 30 |
| mount.takeoff.blocked | Take-off clearance/profile invalid. | Set 30 |
| mount.landing.invalid | No valid landing candidate. | Set 30 |
| mount.flight.environment | Environment/realm incompatible. | Environment/creature data |
| mount.cargo.overloaded | External load result restricts movement. | Inventory/Creature owner |
| mount.forced_separation | External or movement event removed rider. | Cause owner + Set 30 execution |
| mount.recovery.safe_exit | Invalid mounted state recovered through safe exit. | Set 30 |

# Appendix J. Multiplayer Mounted-Movement Contract

## Rider Client -> Authority

```text
player_id
mount_entity_id
seat_id
input_sequence
client_tick

move_intent
steering_intent
gait_change_request
burst_request
jump_request
takeoff_land_request
flight_pitch_turn_input
dismount_request

permission_token_revision
mount_availability_revision
tack_state_revision
environment_revision?
predicted_state_hash
```

## Authority -> Clients

```text
server_tick
ack_input_sequence
mount_entity_id
seat_occupants{}
control_mode

position
rotation
velocity
mounted_state
gait_or_flight_state

mount_availability_revision
tack_state_revision
cargo_load_band
environment_revision?
route_state?
reason_codes[]
```

# Appendix K. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Ownership Boundary | Mount remains a creature; 30E never calculates tame/bond/health/economy. |
| Permission | Set 28 permission token required; seat/control assignment remains authoritative. |
| Mount/Dismount | Bounded actions respect world clearance and safe exit. |
| Ground Riding | Distinct gait, acceleration, turn and braking profiles; no player-speed multiplier shortcut. |
| Terrain | Slope/road/mud/snow/bridge constraints produce truthful reasons. |
| Jump | Only capable mounts jump; one-metre voxel test works for prototype profile without universalising it. |
| Tack | Saddle/harness fit uses Item/Forge facets; missing/broken tack changes movement without 30E owning durability. |
| Passenger | Stable seat IDs/reservations; passenger cannot issue unauthorised steering. |
| Cargo | External load band modifies movement; no cargo-value/economy calculation. |
| Flying Mount | Take-off, cruise, wind, gravity and landing use mount flight profile plus XSI-30-004. |
| Flight Failure | External capability loss transitions safely to glide/fall/landing without 30E inventing injury. |
| Combat | Mounted attacks/damage remain Combat-owned; knock-off supplies movement result only. |
| 30F Boundary | Towing harness/provider interfaces exist but wagon/cart physics remain 30F. |
| Accessibility | Assistance improves valid steering/landing/mounting without creating invalid capability. |
| Multiplayer | Server owns mount transform, seat, permission, control mode and flight state. |
| Persistence | Mounted save/load preserves rider/mount identity and fails safely if seat/profile becomes invalid. |
| 30B Regression | Dismount returns to valid player locomotion profile. |
| 30D Regression | Forced aerial separation and flying-mount environment fields use existing airborne contracts. |
| Atlas Compatibility | Land, pack, magical and flying mount content can be expressed through profiles without species hard-code. |

# END OF DOCUMENT 30E
