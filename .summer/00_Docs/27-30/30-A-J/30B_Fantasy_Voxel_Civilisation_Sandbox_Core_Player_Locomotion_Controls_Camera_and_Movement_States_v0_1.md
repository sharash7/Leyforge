# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30B - Core Player Locomotion, Controls, Camera and Movement States

Version 0.1 - Detailed Ground Locomotion and Player Controller Design Draft

A production-oriented specification for responsive first-person and third-person terrestrial locomotion in Leyforge, covering walking, standard running, sprinting, crouching, crawling, jumping, grounded and airborne state transitions, acceleration, voxel step handling, collision, camera requirements, external modifiers, multiplayer authority, accessibility, persistence and Godot/Summer Engine implementation boundaries.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Core Player Locomotion Statement**
>
> Leyforge movement must feel immediate enough that placing a block, crossing a village, dodging around a creature or exploring a cave never feels like fighting the controller, while remaining honest enough that terrain, posture, injury, stamina, equipment, roads and physical clearance still matter. Ground locomotion is therefore responsive rather than weightless, forgiving rather than automatic, and data-driven rather than hard-coded to one humanoid body or camera.

# Document Purpose

Document 30B is the first specialist document under the architecture established by Document 30A. It defines the player-facing locomotion foundation that every later traversal, mount and transport system must be able to enter and leave cleanly.

The document owns detailed ordinary terrestrial locomotion for the player: standing, walking, standard running, sprinting, crouching, crawling, jumping, basic airborne control, grounded detection, ordinary step handling, movement acceleration and braking, posture clearance, movement-facing camera requirements and the authoritative state transitions that connect those behaviours.

It deliberately does **not** absorb systems owned elsewhere. Set 29 remains the authority for stamina availability, fatigue, injury severity, body temperature, physiological carrying penalties and other biological state. Document 16 remains the authority for combat actions such as dodge attacks and attack commitment. Document 17 remains the UI/UX and settings authority. Entity Forge remains the source of movement-body metadata, rigs, sockets and presentation profiles. Document 26E remains the approved detailed aquatic movement owner unless XSI-30-001 is explicitly resolved differently. Set 30 consumes those outputs and decides only what they mean to locomotion.

The current Leyforge POC already proves first-person WASD movement, mouse look, jumping and sprinting, a connected full-body first-person rig with the camera on the head anchor, controller movement, toggle sprint and basic water entry. Those behaviours are valuable regression evidence, but this document replaces POC-specific assumptions with a production-ready, seed-independent controller contract.

# Governing Source and Dependency Register

| Source | Relevant Existing Direction | 30B Use |
| --- | --- | --- |
| 00 - Master Game Design Bible | Voxel readability, survival/building freedom, first/third-person quality expectations, configurable cosy-to-harsh play. | Locomotion must serve exploration, building, combat and civilisation without becoming a simulation burden. |
| 01 - Core Gameplay Loop | Minute-to-minute play depends on moving, gathering, placing, interacting and exploring; world start must work under varied seeds. | Ground movement must be immediately understandable and remain useful in every loop stage. |
| 02 - Player Progression | Stamina is mainly used for sprinting and combat; no classic attributes; movement-related skill/perk improvements may exist. | 30B consumes progression modifiers but does not turn movement into an attribute system. |
| 03 - Blocks Registry | One-metre voxel grid, slabs, stairs, slopes, doors, hazards and physical collision. | Step, grounding and clearance rules are tuned for readable voxel geometry. |
| 11 - Biomes and World Generation | Terrain, slope, mud, snow, roads and procedural spaces shape travel. | 30B consumes local surface/terrain context; 30H owns detailed route and terrain-cost rules. |
| 16 - Combat, Gear and Defence | Shared first/third-person simulation; stamina, movement commitment, attack movement, crouch/jump actions, aim/lock-on and configurable assistance. | Combat may request movement locks/caps. 30B owns locomotion response, not attack balance. |
| 17 - UI/UX System | First/third person, remapping, hold/toggle sprint/crouch, independent FOV/bob/shake/motion settings, controller support and accessibility. | 30B defines movement-facing camera/control requirements; 17 owns their final presentation/settings UI. |
| 19/20 - Settlement and Buildings | Doors, routes, stairs, safe construction and player-edited voxel spaces must remain traversable. | Locomotion validates physical clearance and exposes truthful blockers. |
| 22F - Entity Animation | Animation consumes authorised movement parameters; root motion is not world authority. | 30B publishes gait, speed, direction, grounded state, stance and transition events. |
| 22H - Entity Gameplay Integration | One efficient movement body, posture profiles, step/slope fields, capability tags and movement/navigation separation. | 30B consumes Forge movement profiles and switches validated standing/crouch/crawl profiles. |
| 25 - Production Governance | Qualified IDs, schemas, capabilities, validation, migration, one source of truth and Godot/Summer direction. | All 30B definitions and runtime records follow registry-driven ownership and validation. |
| 26E - Swimming, Diving and Underwater Interaction | Detailed water-contact, wading, surface swimming, underwater locomotion and aquatic camera/comfort rules. | 30B owns only the terrestrial-to-aquatic transition facade until XSI-30-001 is resolved. |
| 30A - Movement System Architecture | Top-level movement modes, mover profiles, safe positions, modifier precedence, Movement API and Set 30 handoffs. | Binding parent architecture for every rule in this document. |
| 99 - POC Manual Testing Guide | Working first-person movement, sprint, jump, controller baseline, connected-body head-anchor camera and one-block NPC path behaviour. | Regression baseline, not production ownership. |

# Governing Cross-Set Interface Contract

The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** remains binding.

Document 30B therefore:

- consumes Set 27 economic information only where an external job or ownership rule affects access; it never calculates prices, wages, cargo value or trade;
- consumes Set 28 social/companion intent only where another actor influences following or interaction; it never determines loyalty, relationships or companion decisions;
- consumes Set 29 `StaminaModifier()`, `CarryPenalty()`, injury/fatigue restrictions and the proposed movement-exertion decision contract; it never calculates hunger, fatigue, stamina regeneration or injury severity;
- owns the physical response of the player controller to those inputs;
- records interface additions in **Cross-Set Interface Amendments** rather than silently expanding another set's scope.

# Static Table of Contents

1. Locked Core Locomotion Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Core Experience Targets  
4. Player Controller Architecture  
5. Canonical Locomotion Terminology  
6. Input Intent and Command Model  
7. Core Movement State Machine  
8. Standing and Idle State  
9. Walking and Precision Movement  
10. Standard Running and Everyday Traversal  
11. Sprinting  
12. Crouching  
13. Crawling  
14. Jumping  
15. Basic Airborne Handling  
16. Grounding, Ground Snap and Contact Stability  
17. Voxel Step Handling, Slabs, Stairs and Small Obstacles  
18. Slopes, Traction and Local Surface Context  
19. Acceleration, Braking, Direction Changes and Momentum  
20. Edge Behaviour, Coyote Time and Input Buffering  
21. Collision, Clearance and Posture Switching  
22. Ledge Guard and Building-Safe Movement  
23. External Modifiers and Set 29 Consumption  
24. Combat, Interaction, Building and Work Integration  
25. First-Person Camera Requirements  
26. Third-Person Camera Requirements  
27. Camera Comfort, FOV and Motion Accessibility  
28. Aquatic Transition Adapter and XSI-30-001 Protection  
29. Animation, IK, Audio and VFX Handoff  
30. UI, Feedback and Reason Codes  
31. Accessibility and Control Variants  
32. Multiplayer Authority, Prediction and Reconciliation  
33. Persistence, Save/Load and Safe Recovery  
34. Registry and Data Definitions  
35. Balance-Draft Baseline Values  
36. Godot/Summer Engine Implementation Direction  
37. Prototype Laboratories and Acceptance Tests  
38. Handoff to Documents 30C and 30D  
39. Main-Document Integration Register  
40. Cross-Set Interface Amendments  
41. Open Decisions and Deferred Questions  
Appendix A. Player Movement State Transition Matrix  
Appendix B. Input Intent Record Template  
Appendix C. Ground Movement Profile Template  
Appendix D. Movement Modifier Snapshot Template  
Appendix E. Camera Requirement Template  
Appendix F. Reason-Code Catalogue  
Appendix G. Multiplayer Input/Snapshot Contract  
Appendix H. Acceptance and Regression Matrix  

# 1. Locked Core Locomotion Identity

Core locomotion is the player's continuous physical relationship with the voxel world. It should be the least surprising system in Leyforge: when the player presses a movement input, the character should respond immediately; when the world blocks movement, the obstruction should be physically understandable; when another system reduces capability, the reason should be inspectable; and when the player changes posture or jumps, the transition should not depend on presentation timing.

> **Locked Rule**
>
> Ordinary player locomotion is input-led, collision-authoritative and presentation-independent. Animation, camera effects and audiovisual polish may make movement feel richer, but none of them may create, extend or cancel authoritative world displacement by themselves.

## 1.1 Player-Facing Promise

The default controller should feel familiar to players of modern first-person and third-person survival sandboxes:

- standard movement is quick and predictable;
- walking exists for precision, roleplay and quiet movement but is not the forced default;
- ordinary running is the default keyboard movement pace;
- sprint is meaningfully faster and depends on Set 29's exertion decision;
- half-block-like stairs/slabs and small terrain changes do not require constant jumping;
- a full one-metre voxel rise normally requires a jump or a later traversal action;
- crouching is useful for low clearance, precision, stealth-facing posture and safe building;
- crawling is deliberate and only used when space or player intent requires it;
- jumps are forgiving enough for voxel exploration without becoming floaty platforming;
- airborne steering exists, but momentum still matters;
- first-person and third-person use one world simulation;
- accessibility can reduce input/timing burden without granting impossible geometry.

## 1.2 Locomotion Layers

| Layer | Owns | Example |
| --- | --- | --- |
| Input Intent | What the local player is asking to do. | Move forward, sprint requested, jump pressed. |
| Movement Eligibility | Whether the current state permits the request. | Not crawling, no hard movement restriction, clearance valid. |
| Motion Target | Desired speed/direction/posture for the fixed simulation step. | Standard run at 4.35 m/s camera-relative. |
| Collision Resolution | What displacement is physically valid. | Sweep, step attempt, slope validation, wall slide. |
| Authoritative State | Resulting mode, velocity, position, grounded/posture state. | Ground/Run, 4.1 m/s, grounded. |
| External Consequence Request | Facts other systems may consume. | Sprint exertion active, landing velocity, movement noise band. |
| Presentation | Camera, animation, footstep, particles, HUD cue. | Run cycle, subtle bob, gravel footstep. |

# 2. Scope, Ownership and Explicit Non-Goals

## 2.1 30B Owns

- player standing, walking, standard running and sprint execution;
- crouching and crawling movement states;
- jump initiation and basic airborne steering;
- ordinary landing-state return to ground;
- local acceleration, braking and direction change rules;
- grounded detection, ground snap and small-step resolution;
- player posture profile switching and clearance validation;
- camera-relative movement basis for first/third person;
- movement-facing first/third-person camera requirements;
- local movement input buffering and forgiveness;
- movement-side consumption of Set 29 and other external modifiers;
- movement events and reason codes used by UI, animation and multiplayer;
- prediction/authority rules for ordinary player locomotion;
- movement-safe save/load and recovery.

## 2.2 30B Does Not Own

- vaulting, mantling, ledge climbing, ladders, ropes or grapples: 30C;
- detailed falling, fall damage, controlled descent or gliding: 30D plus Set 29 consequences;
- mounts: 30E;
- wagons/caravans: 30F;
- rails/lifts/powered land transport: 30G;
- regional route planning: 30H;
- NPC pathfinding/group navigation: 30I;
- final registry freeze and complete validation suite: 30J;
- stamina drain/regeneration, injury, fatigue, temperature or physiological encumbrance: Set 29;
- combat dodge/attack action definitions: Document 16;
- stealth detection: Combat/AI owners;
- input binding UI, FOV menu, motion settings UI or HUD layout: Document 17;
- animation authoring, foot IK or root-motion clips: Forge/22F;
- swimming formulas or underwater controls while XSI-30-001 remains unresolved: Document 26E;
- terrain generation, road construction or surface content definitions.

# 3. Core Experience Targets

The controller is tuned around a one-metre voxel world but should not feel locked to grid motion.

| Target | Required Result |
| --- | --- |
| Response | Direction input begins visible movement within the next fixed simulation step; no animation-start delay. |
| Precision | The player can align to block edges, doors, workstations and placement targets without oscillation or forced overrun. |
| Readability | A blocked movement attempt corresponds to visible collision, insufficient clearance, a known state restriction or a reported external modifier. |
| Voxel Comfort | Slabs, stairs and small unevenness are traversed automatically when the movement profile permits them. |
| Jump Readability | Default jump cleanly clears a normal one-metre obstacle when horizontal approach and headroom are valid. |
| Momentum | Running and sprinting have acceleration, but inputs never feel like steering a vehicle. |
| Camera Trust | Camera effects never alter collision truth or move the authoritative body. |
| Builder Trust | Crouch/ledge-guard options prevent common accidental falls during precise voxel placement. |
| Accessibility | Timing windows, sprint/crouch modes and camera motion can be adjusted independently. |
| Multiplayer | Normal locomotion remains client-responsive while the server/host remains authoritative. |
| Recovery | Invalid save/collision states resolve to a recent safe position rather than trapping the player inside voxels. |

# 4. Player Controller Architecture

## 4.1 Core Runtime Components

```text
Player Input Adapter
    -> Movement Intent Buffer
        -> Player Movement Controller
            -> External Modifier Resolver
            -> Posture / Capability Resolver
            -> Ground / Collision Resolver
            -> State Transition Resolver
            -> Authoritative Movement Record
                -> Movement Events
                -> Animation Snapshot
                -> Camera Snapshot
                -> UI / Audio / VFX Snapshot
```

## 4.2 Separation of Concerns

The controller should never read hunger, injury, armour, spells or dialogue state directly from unrelated objects. It consumes a resolved modifier snapshot or movement lock from the owning service.

The camera does not move the body by transform parenting tricks. It contributes a look basis and consumes presentation state.

The animation graph does not write final position. It receives speed, gait and action state.

The collision solver does not decide whether sprinting should consume stamina. It reports locomotion facts; Set 29 owns biological cost.

## 4.3 Fixed-Step Requirement

Authoritative movement runs in the physics/fixed simulation loop. Variable-frame input and camera sampling may occur every rendered frame, but movement is applied through fixed-step commands so:

- speed does not change with frame rate;
- collision is reproducible;
- client prediction can replay commands;
- save/replay/test harnesses can reproduce movement cases;
- Summer Engine automation can exercise deterministic movement laboratories.

# 5. Canonical Locomotion Terminology

| Term | Meaning |
| --- | --- |
| Walk | Deliberately slow precision locomotion. |
| Standard Run | Default everyday ground travel pace; not an exertion sprint. |
| Sprint | Explicit high-speed locomotion that requests Set 29 exertion support. |
| Stance | Standing, crouched or crawling posture family. |
| Grounded | Authoritative valid support contact under the movement body. |
| Airborne | No valid grounded support; rising or falling substate. |
| Desired Velocity | Movement target before collision resolution. |
| Actual Velocity | Authoritative post-collision velocity. |
| Movement Basis | Camera-relative or other approved orientation used to interpret input. |
| Ground Snap | Small downward support reconciliation used to avoid micro-bouncing. |
| Step | Automatic small rise resolved without a jump action. |
| Full Voxel Rise | Approximately one metre vertical obstacle; normally not auto-stepped. |
| Ledge Guard | Grounded safety rule preventing an unintentional walk-off while precision posture is active. |
| Coyote Window | Short grace after support loss in which a jump press is still treated as grounded. |
| Jump Buffer | Short pre-landing window in which a queued jump fires when ground becomes valid. |
| Movement Lock | External request that limits or disables locomotion without transferring ownership of the cause. |
| Safe Position | Recently validated fallback transform or route node for recovery. |

# 6. Input Intent and Command Model

30B defines **input intents**, not platform-specific final key bindings. Document 17 owns the player-facing bindings/settings layer.

## 6.1 Required Input Intents

| Intent | Type | Notes |
| --- | --- | --- |
| move_vector | 2D analogue | Camera-relative horizontal intent; keyboard resolves to digital values. |
| look_vector | 2D analogue | Camera/aim input; presentation/input owner may scale it. |
| sprint | hold/toggle state | Explicit high-speed request. |
| walk_precision | hold/toggle state | Optional slow-movement request; analogue sticks may enter walk by magnitude. |
| crouch | hold/toggle state | Standing <-> crouch request. |
| crawl | hold/toggle/context | Explicit crawl request or allowed context transition. |
| jump | press/buffer | Jump request; may buffer through short invalid windows. |
| interact_modifier | state | Optional precision or use modifier; does not itself move the player. |

Current POC defaults such as WASD, Space and Shift remain acceptable input presets, but they are not gameplay authority.

## 6.2 Analogue Movement

Controller magnitude should matter:

- very small input remains a dead zone;
- low magnitude naturally produces walking/precision speed;
- medium/full input reaches standard-run speed;
- sprint is still explicit by default rather than triggered only by stick magnitude;
- accessibility may enable auto-sprint or simplified sprint rules.

## 6.3 Command Priority

Within one fixed step:

1. hard movement locks and invalid-state recovery;
2. posture transition requests;
3. jump request;
4. sprint/walk intent;
5. movement vector;
6. external forces or moving-support contribution;
7. collision resolution;
8. state/result publication.

A jump is never lost merely because sprint or stance changed in the same rendered frame. The intent buffer timestamps each discrete request.

# 7. Core Movement State Machine

## 7.1 Top-Level States Used by 30B

```text
Ground
├── Idle
├── Walk
├── Run
├── Sprint
├── CrouchIdle
├── CrouchMove
├── CrawlIdle
└── CrawlMove

Airborne
├── Rising
└── Falling

Recovery
└── Repositioning
```

Transitions to `Traverse`, `Glide`, `Mounted`, `Vehicle`, `Guided` and `Aquatic` use the interfaces established in 30A and specialist documents.

## 7.2 State Rule

The state machine selects the smallest state that truthfully describes authoritative movement. Presentation may layer a combat stance, tool-use animation, injured gait or look direction on top without creating duplicate movement states.

## 7.3 Transition Validation

Every transition checks:

- current top-level mode;
- requested stance/action;
- movement capability tags;
- profile clearance;
- ground or support state;
- hard external restrictions;
- Set 29 movement eligibility where exertion applies;
- special action lock;
- authority;
- specialist-system handoff where leaving 30B scope.

# 8. Standing and Idle State

Standing idle is not a zero-information state. The controller still maintains:

- grounded truth;
- surface/contact tag;
- stance profile;
- look basis;
- moving-support contribution;
- safe-position eligibility;
- external movement locks;
- transition readiness.

The player may turn the camera freely while idle. Body-facing presentation can gradually follow camera yaw, but no body-animation follow rule is permitted to rotate the authoritative movement basis incorrectly.

A player standing on a moving support owned by another Set 30 transport system inherits that support's approved movement delta through the shared moving-frame contract. 30B does not re-simulate the platform.

# 9. Walking and Precision Movement

Walking exists for exact positioning, roleplay, stealth-facing posture and controller analogue control.

## 9.1 Behaviour

- walking uses the standing posture unless crouch is requested;
- full directional movement is permitted;
- acceleration is responsive;
- stopping distance is short;
- step handling remains enabled;
- jump remains available;
- interaction/building is fully available unless another system restricts it;
- movement noise information may be lower than standard running, but sound/detection owners decide its consequences.

## 9.2 Precision Rule

Keyboard players receive an optional `walk_precision` intent because digital WASD otherwise jumps directly to standard running. Controller players can achieve the same result naturally with analogue magnitude.

Walking must not become a mandatory prerequisite for entering doors or aligning to blocks. Standard running should still be controllable enough for ordinary play.

# 10. Standard Running and Everyday Traversal

Standard running is Leyforge's default ground movement pace.

It represents the familiar survival-sandbox state used for:

- moving around a base;
- crossing a village;
- gathering resources;
- ordinary exploration;
- repositioning during non-committed combat;
- following roads;
- approaching workstations;
- building and mining while mobile.

It is intentionally **not** treated as strenuous sprinting by Set 30. Set 29 may still apply general fatigue/injury modifiers to all motion, but standard run does not create the dedicated sprint-exertion request.

## 10.1 Directional Freedom

Standard run supports forward, sideways, diagonal and backward movement. Backward speed is reduced modestly for readability and combat positioning, but the controller never becomes tank-like.

Camera-relative movement is the default for player control. First- and third-person therefore share the same directional interpretation unless an accessibility or lock-on mode explicitly requests another basis.

# 11. Sprinting

Sprint is an explicit movement state and a Set 29 exertion consumer.

## 11.1 Sprint Eligibility

30B may enter Sprint only when:

- standing posture is active;
- current top-level mode is Ground;
- the movement vector is above the minimum input threshold;
- local surface/clearance permits ground movement;
- no hard movement lock forbids sprint;
- Set 29's exertion decision allows sprint to begin;
- combat/action state has not requested a lower cap;
- equipment/condition modifiers do not hard-disable sprint.

## 11.2 Sprint Direction

Default sprint preserves player control but emphasises forward travel:

- full sprint target is available primarily within the forward movement cone;
- diagonal input smoothly reduces toward standard-run speed rather than snapping states;
- pure backward movement does not use full sprint speed;
- the player can release/re-press direction without being trapped in a long sprint animation;
- accessibility may enable simplified omnidirectional sprint, but the setting must be explicit.

## 11.3 Sprint Continuation

Each fixed step publishes a sprint-exertion request. Set 29 returns whether sprint remains available and any movement modifier.

If Set 29 denies continuation, 30B:

1. exits Sprint cleanly;
2. falls back to Standard Run if movement remains valid;
3. emits `movement.sprint.ended.external_limit`;
4. exposes the owning reason code where permitted;
5. does not calculate or refill stamina.

## 11.4 Sprint and Jump

Jumping from sprint preserves horizontal momentum within the airborne controller limits. Sprint state itself ends when airborne, but the launch remembers its approved horizontal velocity. Landing may return to sprint if:

- sprint input remains active;
- Set 29 still permits sprint;
- surface/state permits it;
- no specialist landing state prevents immediate continuation.

# 12. Crouching

Crouch is a validated alternate movement profile, not merely an animation.

## 12.1 Crouch Functions

Crouch supports:

- lower vertical clearance;
- slower, more precise movement;
- stealth-facing posture;
- safer voxel-edge building through ledge guard;
- movement under low ceilings;
- combat-facing low stance where Document 16 allows;
- transition preparation into crawl or later traversal actions.

## 12.2 Entering Crouch

A standing player may crouch when the crouch profile itself fits the current position. Because crouch reduces rather than increases occupied height, this normally succeeds unless a special carried object or external attachment prevents it.

## 12.3 Leaving Crouch

Standing up requires a clearance sweep using the standing movement profile.

If blocked:

- the player remains crouched;
- input is not consumed as a hidden failure;
- optional UI text may report `Cannot Stand - Obstructed`;
- movement continues normally in crouch;
- repeated attempts are debounced to prevent message spam.

This prevents head clipping and the common error where the camera rises into a ceiling while the body remains blocked.

## 12.4 Crouch and Sprint

Default sprint is incompatible with crouch. Requesting crouch while sprinting transitions to crouched movement through normal braking rather than creating an automatic slide. A dedicated slide mechanic is not part of 30B unless later approved.

# 13. Crawling

Crawl is the lowest ordinary player posture and is designed for deliberately constrained spaces rather than everyday locomotion.

## 13.1 Entry

Crawl may begin through:

- explicit crawl input;
- a configured crouch-to-crawl command;
- an accessibility-assisted transition when the player intentionally enters a crawl-only passage.

Low clearance alone does not forcibly collapse a standing player into crawl. The controller requires player intent unless a safety/recovery rule is active.

## 13.2 Crawl Rules

- crawl uses an alternate Forge movement profile;
- movement speed is low;
- sprint is unavailable;
- ordinary jump is unavailable;
- turning remains responsive enough to escape confined spaces;
- step height is reduced;
- full-body combat actions may be restricted by Document 16;
- crawling may transition into 30C traversal anchors where defined;
- camera height changes through the presentation system after the collision profile is authorised.

## 13.3 Leaving Crawl

The controller tests crouch clearance first, then standing clearance. If crouch fits but standing does not, the player may rise only to crouch.

This creates predictable low-space behaviour:

`Crawl -> Crouch -> Stand`

rather than teleporting between incompatible capsules.

# 14. Jumping

Jumping is the ordinary solution for a full one-metre voxel rise, gaps and small vertical exploration.

## 14.1 Jump Eligibility

A standard jump requires:

- standing or crouched ground state;
- valid jump capability;
- grounded state or active coyote window;
- no hard jump restriction from injury/equipment/action state;
- valid local headroom for the initial launch;
- no specialist state that owns the transition.

Set 29 may influence jump capability through an external modifier or hard restriction but does not author the movement arc.

## 14.2 Variable Jump Height

Default jumping supports a moderate variable-height arc:

- pressing jump initiates the same minimum launch;
- continuing to hold jump briefly preserves upward velocity toward the full target apex;
- releasing early shortens the jump;
- the variable window is intentionally small so the system remains predictable rather than platformer-heavy.

## 14.3 No Default Double Jump

30B provides no universal second jump while airborne. Magic, equipment or specialist traversal may explicitly grant an airborne capability through their own authoritative definition and a Set 30 transition interface.

## 14.4 Crouch Jump

Crouched jumping is allowed only when the resulting standing/launch envelope is valid or the movement profile explicitly supports a crouch jump. The default humanoid target uses a reduced launch from crouch and does not bypass low ceilings.

Crawl has no ordinary jump.

# 15. Basic Airborne Handling

Detailed falling and landing consequences belong to 30D and Set 29, but 30B owns the basic jump-to-airborne control envelope.

## 15.1 Rising and Falling

The controller enters:

- `Airborne/Rising` while vertical velocity is positive beyond the apex tolerance;
- `Airborne/Falling` when vertical velocity reaches/enters downward motion.

Grounded is not reacquired from animation timing. It requires valid support.

## 15.2 Air Control

Air control is intentionally moderate:

- the player can correct a poor jump;
- existing horizontal momentum is preserved;
- mid-air input accelerates toward a new horizontal target more slowly than on ground;
- abrupt 180-degree reversal cannot instantly cancel full sprint momentum;
- external impulses remain visible rather than being immediately erased by input.

## 15.3 Wall Contact

Ordinary wall contact while airborne may slide horizontal velocity along the wall. It does not become wall-running or wall-climbing. Those capabilities require explicit later traversal definitions.

# 16. Grounding, Ground Snap and Contact Stability

## 16.1 Authoritative Grounded Test

Grounded state considers:

- downward support sweep/contact;
- support surface validity;
- slope limit;
- current posture profile;
- vertical velocity;
- ground-snap allowance;
- moving-support frame;
- temporary one-way platform policy if ever used.

## 16.2 Ground Snap

Ground snap exists to keep the body attached to shallow downward steps and slopes without micro-jumping.

It must not:

- pull the player through a drop;
- cancel a legitimate jump;
- glue the player to a moving object that no longer supports them;
- cross invalid gaps;
- defeat 30D falling rules.

## 16.3 Ground Hysteresis

A short support tolerance prevents flicker at block seams and stair edges. The controller distinguishes:

- truly unsupported;
- temporarily losing a contact sample while still within snap/support tolerance;
- intentionally jumping;
- being externally launched.

# 17. Voxel Step Handling, Slabs, Stairs and Small Obstacles

The one-metre voxel grid makes step policy a critical feel decision.

## 17.1 Default Step Philosophy

> **Locked Rule**
>
> Slabs, stairs and ordinary small voxel unevenness should not demand a jump. A full one-metre block normally should.

The default player movement profile therefore targets an automatic step height around a half block, subject to final Forge geometry and balance testing.

## 17.2 Step Attempt

When horizontal motion hits a low obstacle:

1. test obstacle height against the current posture's step limit;
2. sweep upward by the candidate step;
3. sweep horizontally across the obstacle;
4. sweep down to valid support;
5. validate headroom and slope;
6. commit the stepped position only if all checks succeed.

No visual stair animation is permitted to bypass these checks.

## 17.3 Stairs and Slabs

Official stair/slab collision should be authored to cooperate with the same step solver. The player should not "catch" on every voxel seam.

## 17.4 One-Metre Rise

A one-metre vertical face is intentionally above the standard auto-step target. The player should jump, use a staircase, use 30C traversal or reshape the voxel world.

This preserves the meaning of building stairs, ramps and paths.

# 18. Slopes, Traction and Local Surface Context

30B consumes a local movement-surface result. It does not define every biome or material's traction values.

## 18.1 Surface Input Contract

The local environment may expose:

- support validity;
- slope angle/normal;
- speed multiplier;
- acceleration/traction multiplier;
- braking multiplier;
- slip tendency;
- step allowance override;
- noise/contact tags;
- movement hazard flag;
- reason/source ID.

## 18.2 Stable Slope

The movement profile declares a maximum stable slope. At or below that value, ground locomotion is allowed if the support surface is valid.

Above the stable limit:

- the player is not treated as securely grounded;
- 30D/environmental movement may apply slide/fall behaviour;
- pressing forward does not magically climb a near-vertical face.

## 18.3 Terrain Modifiers

Mud, ice, snow, sand, magical surfaces and damaged floors should influence locomotion through the environment snapshot. 30B applies the supplied physical modifier; it does not decide whether a biome is muddy or how weather created the state.

# 19. Acceleration, Braking, Direction Changes and Momentum

Leyforge should feel responsive but not instantaneously massless.

## 19.1 Ground Acceleration

- walking reaches target speed quickly;
- standard run reaches target speed in roughly a quarter second or less under ordinary conditions;
- sprint ramps slightly more slowly than standard run;
- strong external penalties may lengthen acceleration but should remain readable.

## 19.2 Braking

Releasing input uses stronger braking than acceleration so precise voxel positioning remains comfortable.

This is especially important near:

- cliffs;
- construction edges;
- doors;
- workstations;
- storage blocks;
- ladders/traversal anchors;
- NPC interaction positions.

## 19.3 Direction Reversal

At walking/standard run, direction changes are quick.

At sprint speed:

- sharp reversal first sheds forward momentum;
- diagonal changes are smoother than full reversal;
- camera rotation does not instantly rotate world velocity;
- the player never enters a tank-steering turn radius.

## 19.4 External Forces

Knockback, moving platforms, currents, wind or magical forces are additive external movement contributions owned by their source system. 30B combines them with player control according to the active mode but never silently erases a valid authoritative force.

# 20. Edge Behaviour, Coyote Time and Input Buffering

Small forgiveness windows make voxel traversal feel intentional rather than brittle.

## 20.1 Coyote Time

A short coyote window is active after ordinary support is lost from an edge.

It exists so a jump pressed just after visually leaving the edge still succeeds.

It does not apply when:

- the player was forcibly launched;
- jump capability is disabled;
- the player intentionally walked off while crawling under a special restriction;
- a specialist traversal state owns the transition.

## 20.2 Jump Buffer

A jump press shortly before landing is remembered for a short window. If valid ground is acquired during the buffer, the jump fires immediately.

## 20.3 Input Debounce

Repeated blocked stance/jump attempts are debounced for UI/audio feedback. The game may keep testing the request, but it does not spam identical errors every physics tick.

# 21. Collision, Clearance and Posture Switching

## 21.1 Forge-Owned Geometry

Entity Forge/22H supplies the movement profile geometry:

- body shape;
- radius/width;
- standing height;
- crouch profile;
- crawl/fold profile;
- step height;
- slope limit;
- ground snap;
- door/pass-through class.

30B consumes those fields.

## 21.2 Profile Switch Rule

A posture switch is an authoritative collision change.

When reducing size, the controller validates the destination profile and recentres/anchors it according to the approved profile policy.

When increasing size, a clearance sweep must succeed before the change.

## 21.3 Camera Ordering

Collision posture changes first. Camera easing follows second.

This avoids:

- camera clipping into ceilings;
- a visual stand state while the body remains crouched;
- local-player head/body mismatches;
- multiplayer clients seeing impossible posture.

# 22. Ledge Guard and Building-Safe Movement

Voxel building benefits from a grounded safety behaviour similar to familiar crouch-edge protection.

## 22.1 Default Ledge Guard

While crouched and grounded, the default player profile enables ledge guard unless disabled by world/accessibility/input settings.

When a requested horizontal move would leave no valid support under the allowed ledge margin, the movement is constrained at the edge.

## 22.2 What Ledge Guard Does Not Do

It does not:

- prevent a deliberate jump;
- create invisible support;
- stop external knockback;
- allow standing in mid-air;
- operate while falling;
- defeat specialist traversal;
- protect carts, mounts or vehicles.

## 22.3 Build Precision

Ledge guard combines with short crouch stopping distance to make block placement on roofs, walls and scaffolds safer without converting building mode into a separate movement controller.

# 23. External Modifiers and Set 29 Consumption

Set 29 remains authoritative for biological simulation.

## 23.1 Required Set 29 Inputs

30B expects:

- `StaminaModifier()`;
- `CarryPenalty()`;
- injury movement restrictions/modifiers;
- fatigue movement restrictions/modifiers;
- temperature-related movement modifiers;
- the proposed movement-exertion decision from XSI-30-002.

## 23.2 Movement Modifier Snapshot

30B resolves external inputs into an immutable per-step snapshot:

| Field | Example |
| --- | --- |
| max_speed_multiplier | 0.82 |
| acceleration_multiplier | 0.90 |
| jump_multiplier | 0.75 |
| sprint_allowed | false |
| crouch_allowed | true |
| crawl_allowed | true |
| hard_restrictions | `["no_sprint"]` |
| external_reason_codes | `["survival.injury.leg_major"]` |
| source_revision | Set 29 snapshot version |

30B does not decide that a leg injury should be 0.82. It applies the value it receives.

## 23.3 Modifier Precedence

30A precedence remains binding:

1. invalid geometry/hard prohibition;
2. capability availability;
3. safety/permission restriction;
4. external hard status restrictions;
5. terrain/environment;
6. equipment/load;
7. beneficial progression/magic;
8. accessibility assistance within permitted rules.

No speed buff grants clearance through a wall.

# 24. Combat, Interaction, Building and Work Integration

## 24.1 Combat

Document 16 may request:

- speed cap;
- directional restriction;
- rotation restriction;
- sprint prohibition;
- jump prohibition;
- full movement lock;
- movement impulse.

30B executes the movement consequence only.

A dodge/roll is not implemented as "sprint faster for a moment." Combat owns the action; Set 30 provides the authorised displacement interface where required.

## 24.2 Mining and Tool Use

Ordinary mining, chopping and tool use may coexist with walking/standard movement unless the action definition requests a movement cap or lock.

The controller should not silently freeze the player just because an animation plays.

## 24.3 Block Placement

Block placement is allowed during ordinary locomotion. Placement authority remains with the world/block system.

The movement system provides:

- current authoritative transform;
- camera/interaction origin;
- stance;
- movement state;
- whether ledge guard is active.

## 24.4 Dialogue and UI

Dialogue or menus may request a movement lock through the UI/social systems. 30B applies the lock, but it does not decide when dialogue should pause or whether an NPC permits the interaction.

# 25. First-Person Camera Requirements

The current POC's connected-body first-person camera is retained as the production direction.

## 25.1 Head-Anchor Rule

The camera attaches to a semantic head/eye camera anchor supplied by Entity Forge.

The pivot must be located so:

- yaw/pitch rotates from the player's head/eye point;
- the camera does not orbit behind an offset torso;
- the local player's own head can be hidden without hiding the body;
- looking down reveals the connected torso, arms/hands and legs where geometry permits;
- first-person held items use the same character rig rather than a completely disconnected duplicate arm system by default.

## 25.2 Simulation Separation

The first-person camera may pitch independently of locomotion. Horizontal movement uses the approved camera yaw basis, not pitch, so looking up/down does not move the player vertically.

The camera may visually follow small locomotion motion but never changes authoritative collision.

## 25.3 Body Facing

The visual torso/head may use a comfort/follow cone before the body turns to camera yaw, but movement direction remains driven by movement intent and approved movement basis.

Full body-facing behaviour is presentation/animation logic and must not introduce locomotion latency.

# 26. Third-Person Camera Requirements

Third-person uses the same movement simulation as first-person.

## 26.1 Default Behaviour

- camera orbits a semantic character focus point;
- movement is camera-relative;
- optional shoulder offset is supported;
- shoulder swap is supported;
- camera collision retracts smoothly toward the player;
- camera collision never pushes the authoritative player body;
- camera may centre when space becomes too tight;
- automatic first-person transition in tight spaces is optional, not mandatory;
- reticle/interaction ray adapts to perspective without changing reach rules.

## 26.2 Character Rotation

Under free exploration:

- movement intent determines desired travel direction;
- visual body rotates toward movement with responsive interpolation;
- camera can orbit independently while idle or moving, depending on user setting;
- lock-on/combat may request a different facing policy through Document 16.

## 26.3 Tight Voxel Spaces

Third-person must remain usable in:

- one- to two-block corridors;
- small houses;
- mines;
- towers;
- staircases.

When obstruction forces the camera inward, the system prioritises readable aim/interaction over preserving a fixed boom distance.

# 27. Camera Comfort, FOV and Motion Accessibility

Document 17 owns settings UI; 30B defines the locomotion signals/settings requirements.

## 27.1 FOV

Balance-draft defaults:

- first-person base FOV target: 75 degrees vertical;
- third-person base FOV target: 70 degrees vertical;
- sprint FOV increase: subtle, approximately +3 degrees by default;
- user may set sprint FOV shift to zero;
- final supported ranges are UI/platform decisions but should be broad enough for comfort.

## 27.2 Head Bob

Head bob is presentation only.

30B exposes:

- gait;
- speed normalised;
- step phase/contact;
- landing event.

Camera presentation may create a subtle bob from those values. Bob can be reduced to zero without changing speed or animation.

## 27.3 Motion Reduction

The movement system must support camera presentation that independently disables/reduces:

- head bob;
- sprint FOV shift;
- landing dip;
- movement shake;
- acceleration sway;
- strafe roll;
- motion blur;
- abrupt third-person collision zoom.

Disabling these effects never changes collision or movement physics.

# 28. Aquatic Transition Adapter and XSI-30-001 Protection

Document 26E currently owns detailed aquatic locomotion.

30B therefore defines only the terrestrial side of water entry/exit.

## 28.1 Land-to-Aquatic Handoff

When water/liquid contact crosses the aquatic-entry threshold supplied by 26B/26E:

1. 30B reports current position, velocity, stance and movement intent;
2. the aquatic owner validates the transition;
3. Set 30 top-level `CurrentMovementMode()` changes to Aquatic through the shared facade;
4. 26E owns wading/swim/dive control thereafter;
5. 30B does not continue applying land acceleration beneath the aquatic controller.

## 28.2 Aquatic-to-Land Handoff

26E returns a validated terrestrial exit state with:

- exit transform;
- velocity;
- grounded/support candidate;
- desired posture;
- reason/state flags.

30B revalidates local land clearance before resuming Ground.

## 28.3 No Duplicate Swimming

No speed table, breath rule, surface-swim acceleration, diving control, current response or underwater camera formula in 30B supersedes 26E while XSI-30-001 remains pending.

# 29. Animation, IK, Audio and VFX Handoff

## 29.1 Animation Snapshot

30B publishes:

```text
movement_mode
movement_state
stance
desired_velocity_local
actual_velocity_local
speed_normalised
grounded
ground_normal
slope_band
turn_rate
is_accelerating
is_braking
jump_phase
surface_tags
movement_restriction_tags
external_force_band
```

22F consumes these values.

## 29.2 Root Motion

Locomotion root motion is presentation by default. It may be used to align visual feet/hips, but it does not own world displacement.

Special traversal actions in 30C may use tightly bounded authored movement windows through an explicit authoritative action contract.

## 29.3 Foot IK

Foot IK aligns to ground after authoritative grounding. IK does not decide whether the character is grounded.

## 29.4 Audio

30B emits semantic events such as:

- `movement.footstep`;
- `movement.jump.start`;
- `movement.land`;
- `movement.sprint.start`;
- `movement.sprint.stop`;
- `movement.stance.crouch`;
- `movement.stance.crawl`;
- `movement.blocked`.

Audio selects sounds from surface/material and presentation data. Rendered audio does not affect movement truth.

# 30. UI, Feedback and Reason Codes

Normal movement should require almost no HUD.

Feedback appears when the player needs to understand a change.

## 30.1 Contextual Feedback

Examples:

- sprint request denied: "Too exhausted to sprint" using Set 29 reason text;
- stand request denied: "Cannot stand - obstructed";
- jump denied by hard injury: reason from Set 29;
- movement blocked by locked door: structure/permission reason;
- movement restored from invalid save: brief recovery message only when useful;
- aquatic transition unavailable: 26E reason;
- third-person camera collision: normally no text, only smooth camera behaviour.

## 30.2 Truthful Ownership

30B does not rewrite an external reason into a misleading locomotion cause.

If Set 29 says sprint is unavailable due to `survival.fatigue.critical`, the UI may localise that reason. 30B should not report "terrain blocked" merely because sprint fell back to running.

# 31. Accessibility and Control Variants

Accessibility is implemented as controlled input/comfort assistance rather than a separate movement simulation.

## 31.1 Supported Options

- hold or toggle sprint;
- hold or toggle crouch;
- dedicated or contextual crawl;
- auto-sprint;
- analogue auto-walk;
- reduced requirement for repeated sprint presses;
- jump buffer extension;
- coyote-window extension within safe limits;
- optional auto-step assist for eligible small steps;
- ledge-guard strength/options;
- camera bob reduction/disable;
- sprint FOV shift disable;
- third-person collision smoothing;
- controller look acceleration/dead-zone options through Document 17;
- input remapping;
- reduced traversal timing pressure.

## 31.2 Accessibility Boundary

Assistance may:

- extend timing windows;
- automate a permitted input;
- reduce camera motion;
- preserve sprint toggle state;
- select a valid safe posture automatically.

Assistance may not:

- phase through collision;
- ignore a locked door;
- create a jump capability the mover does not possess;
- bypass a hard injury restriction unless Set 29/world settings explicitly permit it;
- turn a non-climbable wall into a climbable surface.

# 32. Multiplayer Authority, Prediction and Reconciliation

## 32.1 Authority Model

The authoritative host/server owns:

- player position;
- velocity;
- grounded state;
- stance;
- sprint eligibility result;
- jump acceptance;
- collision result;
- top-level movement mode;
- safe position;
- externally consequential movement events.

Clients predict ordinary local locomotion for responsiveness.

## 32.2 Predicted Input Command

A command includes:

```text
sequence
client_tick
move_vector
look_yaw_basis
sprint_state
walk_state
crouch_state
crawl_state
jump_pressed
local_context_flags
```

The client does not send "I moved 4 metres." It sends intent.

## 32.3 Server Validation

The server validates:

- speed and acceleration against resolved movement profile/modifiers;
- stance clearance;
- grounded/jump validity;
- collision/step result;
- external movement locks;
- current authoritative mode;
- impossible position deltas;
- command sequencing.

## 32.4 Reconciliation

Small prediction errors should be smoothed without moving the camera through walls.

Large or invalid errors may hard-correct to the authoritative transform or safe position.

Presentation smoothing is not allowed to leave the interaction ray, hit registration or block placement using a different authoritative position for consequential actions.

## 32.5 Split-Screen

Each local player has:

- independent input intent buffer;
- independent camera;
- independent movement controller;
- independent accessibility settings where supported;
- shared authoritative world state.

# 33. Persistence, Save/Load and Safe Recovery

Ordinary movement is mostly transient. Saves should persist only what is necessary.

## 33.1 Persist

- authoritative world position;
- body/world rotation required for reconstruction;
- current top-level movement mode if needed for safe restoration;
- stance when meaningful;
- moving-support/transport attachment reference where safe and owned by another Set 30 system;
- recent safe position;
- movement profile ID/version;
- relevant persistent movement restriction references if owned elsewhere.

## 33.2 Do Not Persist by Default

- footstep phase;
- camera bob phase;
- tiny acceleration state;
- input buffer;
- local prediction history;
- raw collision contacts;
- transient grounded hysteresis timer.

## 33.3 Load Validation

On load:

1. resolve movement profile;
2. validate current collision;
3. validate stance;
4. validate support or expected airborne state;
5. validate attached moving frame;
6. recover to recent safe position if invalid;
7. emit a diagnostic reason if recovery occurred.

Recovery never becomes a player fast-travel exploit.

# 34. Registry and Data Definitions

## 34.1 Ground Movement Definition

Suggested stable ID:

`movement.profile.player.humanoid_standard`

Required fields include:

- base speed bands;
- acceleration/braking bands;
- jump target profile;
- air-control profile;
- stance profile references;
- step/slope/ground-snap references;
- coyote and input-buffer profile;
- sprint direction policy;
- ledge-guard policy;
- external modifier channels;
- animation profile ref;
- camera requirement ref;
- accessibility profile ref;
- network prediction profile ref.

## 34.2 Movement Stance Definition

Suggested IDs:

- `movement.stance.stand`
- `movement.stance.crouch`
- `movement.stance.crawl`

Fields:

- movement-body profile reference;
- speed multiplier;
- acceleration multiplier;
- step-height multiplier/override;
- jump policy;
- sprint policy;
- ledge-guard policy;
- camera-anchor presentation offset;
- supported action tags;
- transition reason codes.

## 34.3 Movement State Record

```text
entity_id
movement_mode
movement_state
stance_id
position
rotation
actual_velocity
desired_velocity
grounded
support_ref
surface_tags
safe_position_ref
active_modifier_snapshot_id
external_lock_flags
prediction_sequence
last_authoritative_tick
```

# 35. Balance-Draft Baseline Values

These values are **production starting targets**, not immutable shipped balance. They exist so implementation and testing can converge on one shared feel instead of each developer inventing different numbers.

## 35.1 Speed Targets

| State | Base Target | Notes |
| --- | ---: | --- |
| Precision Walk | 2.30 m/s | Keyboard walk modifier or low analogue magnitude. |
| Standard Run | 4.35 m/s | Default everyday player pace. |
| Sprint | 6.10 m/s | Requires Set 29 exertion approval. |
| Backward Standard Run | ~3.70 m/s | About 85% of standard run target. |
| Crouch Move | 1.85 m/s | Precision/low-clearance movement. |
| Crawl Move | 1.00 m/s | Deliberately constrained. |

External modifiers multiply these targets after hard capability checks.

## 35.2 Responsiveness Targets

| Parameter | Balance-Draft Target |
| --- | --- |
| Ground run acceleration | ~22-24 m/s² |
| Ground braking | ~28-32 m/s² |
| Sprint acceleration | ~17-19 m/s² |
| Air steering acceleration | ~45-55% of ordinary ground steering |
| Standard auto-step | ~0.55 m maximum target |
| Ground snap | ~0.20-0.25 m |
| Stable slope | ~45-46 degrees for standard humanoid profile |
| Coyote window | ~0.12 s |
| Jump input buffer | ~0.15 s |
| Full jump apex above launch | ~1.20-1.30 m |
| Time to jump apex | ~0.36-0.40 s |
| Early-release jump | approximately 55-65% of full apex target |

## 35.3 Interpretation Rule

The one-metre voxel world is the main calibration reference:

- half-block structures should feel smooth;
- a one-block wall is jumpable;
- a two-block wall is not ordinarily jumpable without terrain/traversal assistance;
- standard doors/passages must fit the validated standing profile;
- crouch/crawl provide meaningful clearance differences.

# 36. Godot/Summer Engine Implementation Direction

Godot is the runtime and editor host. Unreal-specific controller assumptions from legacy Document 18 are not authoritative.

## 36.1 Recommended Runtime Composition

```text
PlayerEntityRoot
├── CharacterBody3D / project movement-body wrapper
├── PlayerMovementController
├── MovementCollisionResolver
├── MovementModifierAdapter
├── MovementStateReplicator
├── PlayerPresentationRoot
│   ├── Entity visual rig
│   ├── FirstPersonCameraRig
│   └── ThirdPersonCameraRig
└── InteractionOriginProvider
```

## 36.2 CharacterBody3D Direction

A `CharacterBody3D`-style kinematic movement body is appropriate for the default humanoid player because the controller needs:

- explicit velocity;
- deterministic fixed-step intent;
- controlled slope/ground behaviour;
- sweep-based collision;
- client prediction replay;
- authoritative posture switching.

Godot's default `move_and_slide()` behaviour may be used where it passes the voxel laboratories, but step-up, ground-snap and posture transitions should be wrapped behind project-owned services so engine-version changes do not become gameplay rules.

## 36.3 Data Resources

Use versioned Godot `Resource` definitions or equivalent validated registry records for:

- movement profile;
- stance profile;
- jump profile;
- camera requirement profile;
- accessibility profile;
- prediction profile;
- reason-code localisation key.

Runtime state is not stored inside immutable Resources.

## 36.4 Summer Engine Controls

Summer Engine may assist with:

- controller implementation;
- automated movement labs;
- state-machine generation;
- data validation;
- regression tests;
- visual debugging tools.

Changes to speed rules, collision ownership, movement APIs or cross-set boundaries require normal review. AI-generated code must not silently make animation, camera or client prediction authoritative.

# 37. Prototype Laboratories and Acceptance Tests

## 37.1 Ground Feel Lab

A flat test area containing distance markers verifies:

- walk/run/sprint target speed;
- acceleration;
- braking;
- diagonal input;
- backward movement;
- analogue scaling;
- first/third-person parity.

## 37.2 Voxel Step Lab

Include:

- full blocks;
- slabs;
- stairs;
- 0.25/0.5/0.75/1.0 m test ledges;
- narrow doorways;
- low ceilings;
- slopes around the stable-angle threshold.

Acceptance:

- half-height steps traverse without jump;
- one-metre rise requires jump;
- no snagging on block seams;
- invalid headroom prevents step/jump commit.

## 37.3 Stance Lab

Verify:

- stand -> crouch -> crawl;
- crawl -> crouch -> stand;
- blocked stand-up;
- camera follows authorised profile;
- no collision pop;
- network observers receive correct posture.

## 37.4 Jump Lab

Verify:

- full and early-release jump;
- coyote time;
- jump buffer;
- sprint momentum;
- air correction;
- head collision;
- landing handoff to 30D.

## 37.5 Builder Edge Lab

Verify:

- crouch ledge guard;
- block placement while guarded;
- deliberate jump off edge;
- external knockback still works;
- no invisible support created.

## 37.6 Camera Lab

First person:

- exact head-anchor pivot;
- local head hidden only;
- body visible while looking down;
- no detached/orbiting torso.

Third person:

- camera collision in one/two-block corridors;
- shoulder swap;
- interaction alignment;
- no body displacement from camera correction.

## 37.7 Set 29 Adapter Lab

With synthetic modifier snapshots:

- sprint allowed/denied;
- speed multiplier;
- jump restriction;
- carry penalty;
- fatigue penalty;
- reason-code propagation.

30B must apply every snapshot without recalculating its biological cause.

## 37.8 Network Lab

Simulate latency, packet loss and correction while:

- running;
- sprinting;
- crouching under a ceiling;
- jumping onto a slab;
- walking along a ledge;
- changing first/third person.

No client may gain persistent speed or clearance from prediction.

# 38. Handoff to Documents 30C and 30D

## 38.1 Handoff to 30C

30C receives:

- Ground/Idle/Walk/Run/Sprint/Crouch/Crawl states;
- standing/crouch/crawl movement profiles;
- jump and airborne entry facts;
- collision and clearance query;
- movement intent buffer;
- camera basis;
- external modifier snapshot;
- safe-position record.

30C owns transitions into `Traverse` for:

- vault;
- mantle;
- ledge hang/climb;
- ladder;
- rope;
- grapple;
- other bounded traversal actions.

When 30C finishes a traversal action, it returns a validated Ground or Airborne state to 30B/30D.

## 38.2 Handoff to 30D

30D receives:

- airborne velocity;
- fall start position/time;
- current movement modifiers;
- surface/environment context;
- camera/accessibility requirements;
- eventual landing contact.

30D owns:

- detailed fall behaviour;
- landing severity classification;
- controlled descent;
- gliding;
- environmental aerial movement;
- fall consequence interfaces to Set 29.

30B retains the ordinary jump launch and basic airborne steering envelope.

# 39. Main-Document Integration Register

Future integration should update older documents to consume 30B rather than preserve duplicate player-locomotion rules.

| Document | Required Integration |
| --- | --- |
| 00/01 | Reference Set 30 for detailed movement execution; retain high-level sandbox promises. |
| 02 | Keep progression/perk unlocks; remove any duplicate stamina drain or locomotion formulas once Set 29/30 interfaces are final. |
| 03 | Keep block collision/material identity; expose movement-facing surface/shape data. |
| 11 | Keep terrain/worldgen authority; expose local terrain/surface context consumed by 30B/30H. |
| 16 | Keep combat actions and movement locks; consume 30B movement states and authorised displacement. |
| 17 | Keep controls/settings/UI ownership; expose input intents and consume movement reason/state. |
| 19/20 | Keep building/door/stair/route infrastructure; validate against Set 30 movement profiles. |
| 22F/22H | Keep animation, rig, body and marker definitions; consume/publish through Set 30 contracts. |
| 26E | Preserve aquatic authority pending XSI-30-001; use explicit land/aquatic handoff. |
| 99 | Update manual tests after production controller implementation without treating POC values as canonical. |

# 40. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward from 30A; pending explicit approval.

30B does not redefine swimming. It implements only the terrestrial side of the land/aquatic handoff and consumes Document 26E while the ownership conflict remains unresolved.

No ownership transfer occurs in this document.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Refined requirement for Set 29 review; no ownership transfer.

30B requires more than a single speed multiplier to implement sprint and other future exertion-based movement consistently.

Recommended Set 29 movement-exertion response:

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

Set 29 remains the sole owner of how stamina, fatigue, hunger, injury, temperature and recovery create those values.

30B owns only the physical locomotion response.

No additional Set 27 or Set 28 interface is required by 30B.

# 41. Open Decisions and Deferred Questions

The following remain deliberately open for later testing/integration:

1. Final shipped speed values after packaged-build playtesting.
2. Final first-person and third-person FOV ranges exposed by Document 17.
3. Whether keyboard `walk_precision` receives a default binding or remains optional.
4. Whether simplified omnidirectional sprint is accessibility-only or a general movement option.
5. Whether a dedicated ground slide is desired later; it is not part of 30B v0.1.
6. Exact crouch-jump multiplier after collision and animation testing.
7. Whether crawl can auto-enter by default when a player intentionally pushes into a crawl-only gap.
8. Final support for one-way platforms, if any.
9. Final moving-platform correction behaviour once 30G transport/lifts are complete.
10. Final external impulse combination rules during combat-heavy actions.
11. Exact network correction thresholds after multiplayer prototype measurement.
12. Resolution of XSI-30-001.
13. Final Set 29 response schema for XSI-30-002.

# Appendix A. Player Movement State Transition Matrix

| From | Request/Condition | To | Required Checks | Failure |
| --- | --- | --- | --- | --- |
| Idle/Walk/Run | sprint requested | Sprint | Set 29 allows, standing, ground, movement input | Remain/fall back to Run; reason |
| Sprint | sprint released/denied | Run | Ground movement valid | Idle if no input |
| Stand | crouch | Crouch | Crouch profile valid | Remain Stand |
| Crouch | stand | Stand | Standing clearance | Remain Crouch; obstructed reason |
| Crouch | crawl | Crawl | Crawl profile valid | Remain Crouch |
| Crawl | rise | Crouch/Stand | Clearance in sequence | Remain Crawl |
| Ground | jump | Airborne/Rising | Ground/coyote, capability, headroom | Stay Ground; reason |
| Airborne/Rising | apex | Airborne/Falling | Velocity state | N/A |
| Airborne/Falling | support | Ground | Valid support | Remain Falling |
| Ground | traverse anchor | Traverse | 30C validates | Stay Ground |
| Ground/Airborne | aquatic threshold | Aquatic | 26E validates | Remain prior state |
| Any | invalid collision | Recovery | safe position available | escalate diagnostic |

# Appendix B. Input Intent Record Template

```text
input_intent_id
local_player_id
sample_time
physics_target_tick
move_vector
look_vector
sprint_state
walk_precision_state
crouch_state
crawl_state
jump_pressed
interaction_modifier_state
input_device_class
accessibility_profile_id
sequence
```

# Appendix C. Ground Movement Profile Template

```text
profile_id
display_name
standing_body_profile_id
crouch_body_profile_id
crawl_body_profile_id

walk_speed
run_speed
sprint_speed
backward_speed_multiplier
crouch_speed
crawl_speed

ground_acceleration
ground_braking
sprint_acceleration
air_control_profile_id

jump_profile_id
step_profile_id
slope_profile_id
ground_snap_profile_id
ledge_guard_profile_id

sprint_direction_policy
external_modifier_channels[]
animation_profile_id
camera_requirement_id
prediction_profile_id

version
lifecycle_state
```

# Appendix D. Movement Modifier Snapshot Template

```text
snapshot_id
entity_id
tick

max_speed_multiplier
acceleration_multiplier
braking_multiplier
jump_multiplier
air_control_multiplier

sprint_allowed
jump_allowed
crouch_allowed
crawl_allowed

carry_penalty
stamina_modifier
injury_modifier
fatigue_modifier
temperature_modifier
equipment_modifier
magic_modifier

hard_restrictions[]
reason_codes[]
source_revisions{}
```

# Appendix E. Camera Requirement Template

```text
camera_requirement_id
supported_perspectives[]

first_person_anchor_role
first_person_hide_local_roles[]
first_person_body_visibility_policy

third_person_focus_role
default_distance
distance_range
shoulder_offset
shoulder_swap_supported
collision_policy

base_fov_target
sprint_fov_delta_target
head_bob_signal_policy
landing_signal_policy
motion_reduction_channels[]

interaction_origin_policy
aim_basis_policy
version
```

# Appendix F. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| movement.blocked.collision | World collision prevents movement. | Set 30 |
| movement.blocked.clearance | Current posture/profile does not fit. | Set 30 |
| movement.blocked.slope | Support exceeds stable profile. | Set 30/terrain context |
| movement.stand.obstructed | Standing profile cannot fit. | Set 30 |
| movement.jump.no_ground | Jump outside grounded/coyote window. | Set 30 |
| movement.jump.restricted | External owner prevents jump. | Owning source surfaced through 30B |
| movement.sprint.external_limit | Set 29 or action owner prevents sprint continuation. | External owner + Set 30 wrapper |
| movement.recovery.safe_position | Invalid position restored to recent safe point. | Set 30 |
| movement.transition.aquatic_pending | Aquatic owner has not accepted transition. | 26E adapter |
| movement.lock.external | Another system has applied movement restriction. | External owner |

# Appendix G. Multiplayer Input/Snapshot Contract

## Client -> Authority

```text
player_id
input_sequence
client_tick
move_vector
look_yaw_basis
sprint_state
walk_state
crouch_state
crawl_state
jump_pressed
predicted_state_hash
```

## Authority -> Client

```text
server_tick
ack_input_sequence
position
rotation
velocity
movement_mode
movement_state
stance
grounded
surface_class
modifier_revision
external_lock_flags
safe_position_revision
reason_codes[]
```

# Appendix H. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Responsiveness | Input-to-motion begins next fixed step; no animation delay. |
| Voxel Steps | Slabs/stairs/small rises traverse; one-metre face normally requires jump. |
| Jump | Full one-block clear, variable height, coyote and buffer verified. |
| Crouch | Enters reliably; cannot stand into ceiling; ledge guard works. |
| Crawl | Low profile validates; cannot sprint/jump; staged rise works. |
| Camera | First-person pivots at head anchor; connected body visible; third-person collision behaves in tight voxels. |
| Set 29 Boundary | Synthetic stamina/injury/fatigue snapshots modify movement with no biological calculation inside 30B. |
| Combat Boundary | Movement caps/locks are consumed without duplicating attack or dodge logic. |
| Aquatic Boundary | Land controller hands off to 26E without duplicate swim formulas. |
| Multiplayer | Client prediction responsive; server rejects impossible speed, jump or clearance. |
| Save Safety | Invalid loaded position recovers to safe position with diagnostic reason. |
| Accessibility | Toggle/hold and motion-reduction options alter input/presentation only, not impossible geometry. |
| POC Regression | Existing WASD/controller, jump, sprint and connected first-person body remain possible under the new architecture. |

# END OF DOCUMENT 30B
