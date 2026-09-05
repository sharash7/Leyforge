# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30C - Climbing, Vaulting, Mantling, Ladders, Ropes and Grappling

Version 0.1 - Detailed Traversal Action, Vertical Access and Traversal Tool Design Draft

A production-oriented specification for bounded terrestrial traversal in Leyforge, covering vaulting, mantling, ledge capture and hanging, climbable surfaces, ladders, ropes, traversal anchors, grappling tools, traversal-query selection, authoritative action execution, voxel geometry validation, stamina-interface consumption, animation alignment, accessibility, multiplayer, persistence, navigation links and Godot/Summer Engine implementation.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Traversal Statement**
>
> Leyforge should let the player read a cliff, wall, ruin, scaffold, ladder, rope or grappling point and understand what is physically possible before committing. Traversal expands exploration and building freedom, but it must not erase the value of stairs, roads, bridges, doors, mounts or deliberate fortification. The system therefore uses contextual vaults and mantles, explicit climbable surfaces, authored traversal anchors and capability-based tools rather than treating every vertical surface as universally climbable.

# Document Purpose

Document 30C defines the bounded traversal actions that sit between ordinary locomotion and large-scale transportation. It begins where Document 30B stops: the player can already stand, walk, run, sprint, crouch, crawl and jump. 30C adds the systems that allow that mover to cross low obstacles efficiently, pull onto valid ledges, hang and reposition on approved edges, climb designated terrain, use ladders and ropes, deploy traversal lines and use grappling equipment.

This document is intentionally broader than a parkour move list. In a voxel civilisation sandbox, traversal affects building design, settlement accessibility, dungeon layouts, ruins, caves, scaffolding, fortifications, rescue routes, work sites, navigation graphs, NPC route planning, multiplayer safety and the long-term value of constructed infrastructure. A ladder placed by a builder should become a real navigation transition. A destroyed rope should remove a route. A grapple should require a valid anchor or supported surface rather than attaching to empty air. A wall intended to protect a settlement should remain meaningful unless it has climbable features, a breached route, a traversal tool counter or an explicitly permitted magical solution.

30C does not own stamina drain, fatigue, injuries, item recipes, crafting costs, equipment identity, magic-spell definitions, structure ownership, NPC social intent or animation authoring. It consumes those systems through the interfaces established by 30A, 30B and the Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0.

# Governing Source and Dependency Register

| Source | Existing Direction Relevant to 30C | Treatment in 30C |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Set 30 owns climbing, ladders, ropes and traversal abilities; Set 29 owns stamina/injury/fatigue; Set 28 owns companion/social behaviour. | Governing ownership contract. No economy, social or biological rule is redefined. |
| 00 - Master Game Design Bible | Sandbox freedom, voxel readability, exploration, ruins, settlement construction and multiple progression/playstyle paths. | Traversal expands world use without making infrastructure or construction irrelevant. |
| 01 - Core Gameplay Loop | Exploration, building and world interaction are continuous player activities in varied seed-generated terrain. | Traversal is contextual, readable and optional rather than a separate minigame. |
| 02 - Player Progression | Exploration/Survival skills and perks may improve capability; stamina is primarily used for sprinting/combat and later strenuous actions. | Progression may grant/modify traversal capabilities, but 30C does not award XP or own perk trees. |
| 03 - Blocks Registry | One-metre blocks, slabs, stairs, ladders, structural pieces, terrain states, collision and climbable world content. | Physical voxel state and semantic traversal tags are authoritative inputs. |
| 04 - Items Registry | Tools/equipment are data-driven and may expose movement impact, utility interaction and progression tier. | Rope/grapple item identity remains Item-owned; 30C defines the movement-facing capability facet those items must expose. |
| 05 - Crafting and Recipe Registry | Equipment and traversal-support items must be produced through physical recipes and stations where applicable. | 30C never defines recipe ingredients or costs. |
| 11 - Biomes and World Generation | Cliffs, caves, ruins, roads and vertical terrain shape exploration. | Worldgen may generate climbable surfaces and traversal anchors but does not own traversal execution. |
| 12 / 19 / 20 | Structures, player blueprints, scaffolds, ladders, doors and routes require valid navigation/access contracts. | Traversal links become semantic structure/blueprint requirements and runtime route transitions. |
| 16 - Combat, Gear and Defence | Combat owns attack, dodge and combat movement commitments; fortifications and terrain must remain readable. | 30C exposes traversal state and accepts combat locks; it does not turn vaults/mantles into attacks by default. |
| 17 - UI/UX System | Contextual interaction, camera comfort, hold/toggle alternatives, stamina visibility during climbing and accessibility are established. | 30C defines traversal-facing prompts/signals; 17 owns final UI and settings presentation. |
| 22E - Rigging, IK and Attachments | Stable hand/foot/contact roles, camera anchors and IK attachment semantics. | Traversal uses semantic contacts rather than hard-coded bones. |
| 22F - Entity Animation | Existing traversal presentation families include step-up, vault, mantle, ladder climb, rope/vine climb and crawl; invalid targets must return to safe locomotion. | Animation consumes authorised traversal actions and may use bounded motion warping. |
| 22H - Entity Gameplay Integration | Navigation profiles expose climbing capability, transition markers, footprint, body clearance and safe fallback; movement/navigation remain authoritative outside Forge. | 30C consumes movement body and capability metadata while owning the gameplay traversal decision. |
| 25C - Capabilities and Completeness Contracts | Exploration capabilities include traversal, climbing and route access; reachability includes cost, permission and route validity. | 30C traversal is capability-driven and registry-validatable. |
| 25K - Asset/Event Manifest Contract | Humanoid locomotion includes approved traversal; semantic spatial anchors/paths and EV-ACTOR-MOVEMENT are required. | Traversal events/anchors use the shared presentation manifest model. |
| 26E - Swimming, Diving and Underwater Interaction | Aquatic movement owns water-specific climbing/exit behaviour where defined. | 30C may provide land-side ledge/rope exits, but does not redefine aquatic locomotion. |
| 30A - Movement, Traversal and Transportation Architecture | Traversal mode, capability model, transition links, pathfinding contracts, safe-position handling and authoritative Movement API. | Binding parent architecture. |
| 30B - Core Player Locomotion | Ground/air states, jump, ledge guard, collision profiles, movement intent, camera basis and handoff into Traverse. | Immediate parent and entry/exit contract for 30C. |
| 99 - POC Manual Testing Guide | Current POC verifies a responsive voxel controller and safe local movement behaviour. | Regression foundation only; no fixed POC site is canonical. |

# Governing Ownership Contract

Document 30C owns the **physical traversal mechanics** for:

- contextual vaults;
- mantles and pull-ups;
- ledge capture, hang, lateral ledge movement and drop;
- explicitly climbable walls/surfaces;
- ladder use;
- climbable rope/vine use;
- deployable traversal-line movement;
- grappling attachment, tether movement and grapple-specific traversal states;
- traversal candidate query and selection;
- traversal target validation;
- transition-link representation used by navigation/pathfinding;
- traversal action authority, cancellation and safe fallback.

Document 30C consumes but does not redefine:

- Set 29 stamina, fatigue, injury, temperature and physiological carry effects;
- Set 28 companion/social intent;
- item identity, durability and crafting;
- block/structure ownership and permissions;
- Magic-owned spells or magical movement unlocks;
- Combat-owned attacks, damage and dodge actions;
- Forge-owned rigs, sockets, animations and IK;
- Document 17 UI layouts, binding menus and accessibility settings screens.

# Static Table of Contents

1. Locked Traversal Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Traversal Design Principles  
4. Traversal Runtime Architecture  
5. Canonical Traversal Terminology  
6. Traversal Capability Model  
7. Traversal Candidate Query Pipeline  
8. Candidate Scoring, Intent and Ambiguity Resolution  
9. Traversal Action Lifecycle  
10. Authoritative Traversal Motion Contract  
11. Traversal Anchors, Paths, Volumes and Surface Tags  
12. Voxel Geometry and Dynamic-World Validation  
13. Vaulting  
14. Mantling and Pull-Ups  
15. Ledge Capture and Hanging  
16. Ledge Shimmy, Corner Handling and Drop  
17. Free Climbing on Approved Surfaces  
18. Climb Surface Permission and Fortification Integrity  
19. Ladders  
20. Ropes and Vines  
21. Deployable Ropes, Descenders and Traversal Lines  
22. Grappling Tool Architecture  
23. Grapple Targeting and Attachment Validation  
24. Grapple Tether Modes: Climb, Reel, Swing and Traverse  
25. Rope and Grapple Physics Simplification  
26. Traversal Equipment and Item-System Handoff  
27. External Modifiers and Set 29 Exertion Consumption  
28. Injury, Load and Capability Restrictions  
29. Combat and Threat Integration  
30. Building, Structures and Blueprint Forge Integration  
31. NPC, Creature and Pathfinding Transition Interfaces  
32. First-Person Camera and Body Presentation  
33. Third-Person Camera and Traversal Framing  
34. Animation, IK, Motion Warping, Audio and VFX Handoff  
35. UI, Prompting, Failure Reasons and Knowledge  
36. Accessibility and Traversal Assistance  
37. Multiplayer Authority, Prediction and Traversal Reservations  
38. Persistence, Save/Load and Destroyed-Route Recovery  
39. Registry and Data Definitions  
40. Balance-Draft Baseline Values  
41. Godot/Summer Engine Implementation Direction  
42. Prototype Laboratories and Acceptance Tests  
43. Handoff to 30D and Later Set 30 Documents  
44. Main-Document Integration Register  
45. Cross-Set Interface Amendments  
46. Open Decisions and Deferred Questions  
Appendix A. Traversal Action Transition Matrix  
Appendix B. Traversal Query and Candidate Templates  
Appendix C. Traversal Action Definition Template  
Appendix D. Climb Surface and Anchor Template  
Appendix E. Ladder/Rope Path Template  
Appendix F. Grapple Profile Template  
Appendix G. Exertion Request Template  
Appendix H. Reason-Code Catalogue  
Appendix I. Multiplayer Traversal Contract  
Appendix J. Acceptance and Regression Matrix  

# 1. Locked Traversal Identity

Traversal is an explicit capability layer between ordinary locomotion and transportation. It exists to make voxel exploration expressive while preserving the meaning of terrain and infrastructure.

> **Locked Rule**
>
> Leyforge does not use universal "climb anything" movement by default. Ordinary voxel walls are obstacles unless their geometry, surface tags, structure markers, traversal equipment, approved magic or authored traversal link makes them valid. Vaulting and mantling are contextual conveniences over reachable geometry; sustained climbing requires an explicit capability and valid climb surface or traversal path.

## 1.1 Player-Facing Promise

The player should be able to:

- vault a low fence without an awkward jump;
- mantle a reachable ledge when a normal jump reaches the lip;
- catch an eligible ledge after a near-successful jump;
- climb a rough rock face, vine wall or authored climbing route when permitted;
- place/use a ladder to make a vertical route reliable;
- deploy or climb a rope where an anchor supports it;
- use grappling equipment to create traversal opportunities according to that tool's capabilities;
- understand why a surface or anchor is invalid;
- cancel or drop from traversal predictably;
- survive dynamic world edits without freezing inside an animation;
- use the same routes in first or third person;
- see constructed traversal infrastructure become meaningful to NPC navigation.

## 1.2 Infrastructure Preservation

Traversal must not invalidate:

- defensive walls;
- gates;
- bridges;
- stairs;
- roads;
- ladders;
- scaffolds;
- lifts;
- mounts;
- portals;
- terrain shaping;
- settlement route planning.

A generic two-block wall should not automatically become meaningless because the player owns a jump button. Stronger traversal comes from explicit capabilities, tools, progression, architecture counters and world knowledge.

# 2. Scope, Ownership and Explicit Non-Goals

## 2.1 30C Owns

- entry from 30B Ground/Airborne states into `Traverse`;
- traversal target query and scoring;
- vault, mantle and ledge actions;
- surface-climb action execution;
- ladder/rope path traversal;
- grapple attachment and tether traversal;
- traversal-line path position;
- traversal action progress and cancellation;
- safe return to Ground/Airborne;
- movement-facing capability/clearance checks;
- traversal transition links for pathfinding;
- traversal action prediction/authority;
- movement-facing traversal registries.

## 2.2 30C Does Not Own

- health or stamina values;
- stamina drain/regeneration;
- injury creation/severity;
- item recipes or materials;
- rope/grapple item durability formulas;
- grappling-hook economic value;
- social permission to command a companion to climb;
- whether a faction considers grappling trespass;
- damage dealt by a vault, grapple or fall;
- spell definitions that grant wall-walk, teleport or magical grapple;
- climbing animation creation;
- voxel block ownership or structural integrity;
- general gliding or long-fall handling;
- mount/vehicle movement;
- NPC path planning beyond transition-link interfaces.

# 3. Traversal Design Principles

## 3.1 Read the World First

Traversal opportunities should be communicated through geometry and world language:

- ledges;
- beams;
- ladders;
- ropes;
- vines;
- rough rock;
- scaffold rungs;
- grappling rings;
- tree limbs;
- broken walls;
- climbing holds;
- marked magical anchors.

The UI may confirm a target but should not be the only way the player knows it exists.

## 3.2 Physical Validity Before Animation

A traversal animation never proves a route is valid.

Before commit, the authoritative system validates:

- approach side;
- reach;
- body clearance;
- destination clearance;
- obstacle depth;
- anchor/path state;
- current permissions where movement access is restricted;
- capability;
- external movement restrictions;
- moving/dynamic geometry revision.

## 3.3 Contextual, Not Magnetic

The player should not be dragged toward every nearby ledge. Traversal assistance only activates when intent, geometry and approach direction agree.

## 3.4 Bounded Motion, Not Teleportation

Vaults and mantles may use authored curves or bounded motion warping, but the world path is continuously collision-validated.

## 3.5 Multiple Solutions

A vertical obstacle may be solved by:

- jumping;
- finding terrain;
- stairs;
- ladder;
- rope;
- climbing route;
- grapple;
- structure construction;
- later magic;
- mount/vehicle route;
- going around.

No single traversal capability should erase all others.

# 4. Traversal Runtime Architecture

```text
30B Movement State + Input Intent
        |
        v
Traversal Query Service
        |
        +--> Geometry Candidates
        +--> Structure / Blueprint Anchors
        +--> Climb Surface Candidates
        +--> Ladder / Rope Paths
        +--> Grapple Candidates
        |
        v
Capability + External Modifier Filter
        |
        v
Intent / Candidate Scoring
        |
        v
Traversal Preview / Prompt
        |
        v
Authoritative Action Commit
        |
        v
Traversal Motion Solver
        |
        +--> Collision / Clearance Revalidation
        +--> Exertion Request to Set 29
        +--> Dynamic Anchor Revision Check
        +--> Animation / Camera Snapshot
        |
        v
Complete -> 30B Ground
Cancel/Fail -> 30B or 30D Airborne / Safe Fallback
```

## 4.1 One Traversal Authority

The traversal action record is the single mutable truth for a committed action. Animation graphs, cameras, rope visuals and prompts consume that state.

## 4.2 Action Versus Route Link

A traversal action is the runtime execution.

A traversal transition link is navigation data saying that a route can transition between two movement nodes if a mover satisfies its requirements.

One ladder may expose many path queries over time, but its transition definition is stable until the ladder changes.

# 5. Canonical Traversal Terminology

| Term | Meaning |
| --- | --- |
| Traversal Candidate | Potential action discovered by the query system but not yet committed. |
| Traversal Anchor | Stable semantic transform/role used as an entry, contact, exit or attachment reference. |
| Traversal Path | Ordered spatial path, spline, segment or constrained axis used during an action. |
| Traversal Volume | Bounded region used to detect/validate candidate movement. |
| Climb Surface | Surface explicitly permitted for sustained climbing. |
| Grab Ledge | Edge permitted for ledge capture/hang. |
| Entry Anchor | Authoritative start alignment target. |
| Exit Anchor | Authoritative destination/final alignment target. |
| Hand Contact | Presentation/IK semantic contact; not itself movement authority. |
| Vault | Bounded crossing over a low obstacle with an immediately valid destination. |
| Mantle | Pulling the body onto a reachable higher surface. |
| Ledge Hang | Suspended state attached to a valid ledge rather than grounded support. |
| Shimmy | Lateral movement along a currently valid ledge route. |
| Surface Climb | Sustained movement across an approved climb surface. |
| Ladder Path | Explicit constrained climb route generated by a ladder/structure. |
| Rope Path | Explicit line/spline path used for climbing or descending. |
| Grapple Anchor | Valid target resolved for a grappling/tether profile. |
| Tether | Authoritative relationship constraining the player to a grapple/rope anchor. |
| Motion Warp | Bounded presentation alignment to an already authorised target. |
| Traversal Reservation | Temporary occupancy/access claim for narrow transition infrastructure. |

# 6. Traversal Capability Model

30C uses capabilities rather than item-name checks.

## 6.1 Baseline Player Capabilities

The default humanoid player may expose:

- `traversal.vault.low`;
- `traversal.mantle.low`;
- `traversal.ledge.grab_basic`;
- `traversal.ladder.use`;
- `traversal.rope.climb_basic`.

The following are **not** assumed universally:

- sustained natural-surface climb;
- high mantle;
- ceiling climb;
- rope swing;
- grapple;
- grapple reel;
- grapple swing;
- zipline;
- wall run.

Those capabilities must be granted by body profile, progression, equipment, world rule or Magic-owned effect.

## 6.2 Capability Record

A capability can define:

- eligibility tag;
- minimum/maximum obstacle band;
- required stance;
- allowed movement modes;
- body/hand requirements;
- clearance profile;
- allowed anchor/surface categories;
- external restriction channels;
- traversal action definition reference;
- route-cost class;
- AI/navigation eligibility;
- accessibility alternatives;
- presentation requirements.

## 6.3 Capability Versus Availability

The player may possess `traversal.climb.rough_surface` but be unable to use it because Set 29 reports a severe hand/arm restriction.

Capability answers "can this entity normally do this?"

Availability answers "can this entity do it now?"

# 7. Traversal Candidate Query Pipeline

Traversal queries are short-range, directional and layered.

## 7.1 Query Sources

Candidates may come from:

1. direct voxel geometry;
2. semantic block/structure anchors;
3. Blueprint Forge traversal markers;
4. climb-surface fields;
5. ladder/rope path providers;
6. grappling-target queries;
7. future specialist providers through a registered interface.

## 7.2 Query Inputs

- authoritative player transform;
- standing/crouch/crawl profile;
- current velocity;
- camera yaw/aim basis;
- movement intent;
- jump/traverse input;
- current top-level movement mode;
- reachable hand/reach envelope;
- external modifier snapshot;
- local collision revision;
- current interaction/building mode.

## 7.3 Query Bands

Queries should use small bounded volumes instead of scanning arbitrary world distances every frame.

Typical bands:

- low obstacle/vault probe;
- forward wall/ledge probe;
- overhead/headroom probe;
- ledge-top destination probe;
- near climb-surface probe;
- ladder/rope provider lookup;
- explicit grapple target query only while a grapple tool/ability is active.

# 8. Candidate Scoring, Intent and Ambiguity Resolution

## 8.1 Candidate Score Inputs

- input direction alignment;
- camera/aim alignment;
- distance;
- vertical reach;
- current velocity;
- player stance;
- action input type;
- candidate type priority;
- destination safety;
- required capability confidence;
- persistence/stability of target;
- building precision mode;
- recent rejected candidate cooldown.

## 8.2 Default Priority

When the player presses Jump/Traverse:

1. committed specialist traversal continuation;
2. safe mantle on a clearly intended reachable ledge;
3. contextual vault over a low obstacle;
4. ledge capture if already airborne;
5. standard jump.

A ladder/rope is normally entered through forward movement plus context/interact or Jump/Traverse near its entry volume, depending on control preset.

Grapple uses its own equipment/ability input context.

## 8.3 Builder Protection

When crouch ledge-guard or explicit precision-building mode is active:

- auto-vault is suppressed;
- auto-mantle is suppressed unless Jump/Traverse is pressed;
- ledge auto-grab remains configurable;
- a player is never pulled off a roof because a nearby scaffold marker scored highly.

# 9. Traversal Action Lifecycle

```text
Candidate
-> Previewable
-> Requested
-> Validating
-> Committed
-> Aligning
-> Traversing
-> ExitValidating
-> Completing
-> Completed
```

Failure branches:

```text
Requested/Validating -> Rejected
Committed/Aligning/Traversing -> Interrupted
Interrupted -> Ground Fallback | Ledge Fallback | Airborne Fallback | Safe Recovery
```

## 9.1 Commit Rule

Resources or exertion consequences may begin only after authoritative commit.

A client-side candidate highlight cannot consume stamina or move the body.

## 9.2 Continuous Revalidation

During action, validate:

- target exists;
- collision revision is compatible;
- anchor has not broken;
- path remains clear;
- moving target stays within action tolerance;
- Set 29 allows continuation where sustained exertion applies;
- hard combat/status restriction has not invalidated action.

# 10. Authoritative Traversal Motion Contract

## 10.1 Motion Types

Traversal definitions may use:

- bounded kinematic curve;
- constrained path parameter;
- climb-plane movement;
- rope-line parameter;
- tether constraint;
- external moving-frame transform.

## 10.2 Swept Motion

Every authoritative translation step uses collision sweeps/shape tests appropriate to the body profile.

A motion curve never allows the player to pass through a block simply because the endpoint is clear.

## 10.3 Motion Warping Limit

Animation may warp toward authorised contact/exit anchors only inside a configured tolerance.

If the required warp exceeds tolerance:

- animation adapts through a different clip/profile;
- or the action is rejected;
- or the gameplay body leads and presentation catches up.

No traversal action silently stretches a one-metre animation over a three-metre gap.

# 11. Traversal Anchors, Paths, Volumes and Surface Tags

## 11.1 Semantic Anchor Roles

Recommended roles include:

- `traversal.entry`;
- `traversal.exit`;
- `traversal.ledge.grab`;
- `traversal.ledge.corner`;
- `traversal.ladder.bottom`;
- `traversal.ladder.top`;
- `traversal.rope.anchor`;
- `traversal.rope.end`;
- `traversal.grapple.hardpoint`;
- `traversal.safe_drop`;
- `traversal.rescue`.

## 11.2 Anchor Source

Anchors may be:

- generated from voxel geometry at runtime;
- authored in a structure/Blueprint Forge;
- supplied by a block/entity definition;
- created by a player-deployed rope/grapple object;
- supplied temporarily by an authorised spell/effect.

## 11.3 Stable IDs

Persistent authored/deployed anchors require stable identity so:

- saves can restore them;
- pathfinding can invalidate them;
- quests can reference them;
- multiplayer can replicate them;
- destroyed infrastructure can remove the route.

# 12. Voxel Geometry and Dynamic-World Validation

Leyforge's world can be mined, placed, damaged and repaired during traversal.

## 12.1 Geometry-Derived Ledges

A geometry ledge candidate requires:

- solid lower face or wall;
- grabbable top edge according to current rules;
- sufficient horizontal lip;
- destination support;
- destination clearance;
- no forbidden surface tag;
- no protected traversal denial;
- valid reach.

## 12.2 Revision Stamp

Committed geometry-derived actions store a small world/collision revision stamp for the involved cells/structure.

If relevant voxels change:

- revalidate action immediately;
- continue only if path remains valid;
- otherwise select safe interruption.

## 12.3 Destruction While Traversing

Examples:

- ledge block mined: player drops to 30D;
- ladder block destroyed: player may catch adjacent valid ladder/ledge if available, otherwise fall;
- rope anchor removed: tether detaches unless a secondary anchor remains;
- top landing filled by another block: mantle exits back to ledge hang or drop, never clips into the new voxel.

# 13. Vaulting

Vaulting is a fast bounded crossing over a low obstacle.

## 13.1 Intended Use

Examples:

- fence;
- low wall;
- crate;
- fallen beam;
- one-block-deep obstruction with a safe landing;
- low ruin sill.

Vaulting is not used for:

- large gaps;
- high walls;
- long table rows;
- blocked destinations;
- climbable walls without a valid far-side landing;
- automatic entry into another player's protected space where access is denied.

## 13.2 Entry

Typical default:

- player is Ground;
- standing or approved crouch posture;
- forward input exists;
- obstacle is inside vault height/depth band;
- far-side destination is valid;
- Jump/Traverse is pressed, or contextual auto-vault is enabled under a suitable high-confidence condition.

## 13.3 Vault Types

| Type | Purpose |
| --- | --- |
| Step Vault | Very low obstacle just above auto-step. |
| Low Vault | Ordinary fence/crate crossing. |
| Speed Vault | Faster sprint-context presentation using same valid motion envelope. |
| Side Vault | Optional later presentation for angled approach; same gameplay validity. |

30C v0.1 does not require a complex trick-vault system.

## 13.4 Vault Exit

Vault completion returns to:

- Run/Sprint if movement intent continues and Set 29 permits;
- Walk/Idle if not;
- Airborne if landing support was lost during dynamic revalidation.

# 14. Mantling and Pull-Ups

Mantling moves the player from a lower position to a valid upper support surface.

## 14.1 Default Mantle Philosophy

A normal player should mantle **reachable** ledges but should not automatically scale every fortification.

Use two practical bands:

- low mantle: common reachable ledges and one-block-ish elevation;
- high/reach mantle: only when explicit capability and/or eligible grabbable ledge supports it.

## 14.2 Low Mantle

Suitable for:

- a one-metre block top after a jump or close standing approach;
- slab/stair combinations;
- low windows;
- small ruin ledges.

## 14.3 High Mantle

High mantle is not baseline universal wall-climbing. It requires a capability such as:

- `traversal.mantle.high`;
- a marked handhold/ledge;
- a climbing perk/equipment;
- an approved magical movement capability.

This preserves two-block walls and designed fortifications as meaningful obstacles unless they contain climbable features.

## 14.4 Destination Check

Before pull-up:

- destination support must be stable;
- standing or crouch landing profile must fit;
- headroom must be valid;
- no blocking actor occupies the required space;
- route permission must be valid if the structure enforces it.

# 15. Ledge Capture and Hanging

Ledge capture is the safety/continuation state between Airborne and Mantle/Climb.

## 15.1 Capture Conditions

- player is Airborne;
- eligible ledge enters reach envelope;
- movement/aim is generally toward it;
- vertical relative speed is within capture tolerance;
- hands/body are not hard-restricted;
- ledge is grabbable;
- capture clearance exists;
- auto-grab setting or explicit input allows capture.

## 15.2 Auto-Grab

Default recommendation: **contextual auto-grab enabled**.

It only captures when the player's trajectory and input indicate an attempt to reach the ledge.

It does not:

- reverse a deliberate fall away from the wall;
- grab a ledge behind the player;
- pull the player around a solid corner;
- override a hard Set 29 restriction;
- grab through another actor.

## 15.3 Hang State

While hanging:

- the player is in `Traverse/LedgeHang`;
- normal Ground acceleration stops;
- position is constrained to ledge contact;
- camera remains player-controlled inside comfort limits;
- lateral shimmy may be allowed;
- mantle, drop and limited jump-away inputs are available;
- Set 29 receives sustained-exertion facts.

# 16. Ledge Shimmy, Corner Handling and Drop

## 16.1 Shimmy

Lateral input moves along the ledge if:

- continuous grabbable edge exists;
- body clearance remains valid;
- hand/contact path is not blocked;
- current capability allows shimmy;
- Set 29 permits continuation.

## 16.2 Corners

Default v0.1 supports:

- shallow convex corner transition when a neighbouring ledge candidate is valid;
- no blind 180-degree wrap around arbitrary geometry;
- no automatic inside-corner teleport.

Complex corner traversal can be added later through explicit corner anchors.

## 16.3 Drop

Releasing/drop input returns to 30D Airborne with current constrained velocity plus any defined release contribution.

A player may intentionally drop to:

- lower ledge;
- rope;
- ground;
- water;
- free fall.

Specialist downstream systems validate the resulting transition.

# 17. Free Climbing on Approved Surfaces

Sustained surface climbing is permitted only on approved surfaces/capabilities.

## 17.1 Default Player Climbable Categories

Potential categories include:

- rough natural rock;
- carved climbing wall;
- roots/vines;
- scaffold lattice;
- damaged masonry with holds;
- giant tree bark where explicitly tagged;
- dungeon climbing panels;
- magical climbing surfaces.

Smooth ordinary construction blocks are not automatically climbable.

## 17.2 Climb Plane

The runtime may resolve a local climb plane/field from surface samples.

Player motion maps input onto:

- local up/down;
- local lateral axis;
- optional diagonal combination.

The body remains offset from the wall by the approved movement-profile clearance.

## 17.3 Contact Sampling

Authoritative movement does not require every hand/foot to find a physics hold. It validates the climb surface and body envelope.

Animation/IK samples presentation contacts from the surface.

## 17.4 Climb Exit

Possible exits:

- mantle to valid top ledge;
- transition to ground at bottom;
- transfer to ladder/rope;
- transfer across explicit corner/transition anchor;
- drop to 30D.

# 18. Climb Surface Permission and Fortification Integrity

## 18.1 Surface Tags

Suggested tags:

- `surface.climb.none`;
- `surface.climb.rough`;
- `surface.climb.vine`;
- `surface.climb.scaffold`;
- `surface.climb.holds`;
- `surface.climb.magic`;
- `surface.climb.creature_only`;
- `surface.grapple.soft`;
- `surface.grapple.hard`.

## 18.2 Construction Rules

A player-built wall only becomes climbable when:

- its block/material definition permits it;
- a climbable overlay such as vine/rope/scaffold exists;
- a traversal module/marker was deliberately included;
- damage state creates an approved breach/holds;
- a tool/magic capability explicitly counters the surface.

This allows builders to reason about defensive architecture.

## 18.3 Dynamic State

Wet, iced, burning, corrupted or damaged states may alter climb suitability through the owning environment/block system.

30C consumes the resulting surface suitability. It does not determine weather or structural damage.

# 19. Ladders

Ladders are reliable explicit vertical infrastructure.

## 19.1 Ladder Requirements

A valid ladder provider exposes:

- bottom entry;
- top entry/exit;
- climb axis/path;
- facing;
- width/clearance;
- occupancy/reservation class;
- connected segment continuity;
- damage/active state;
- supported mover classes.

## 19.2 Entry

The player may attach from:

- bottom approach;
- mid-ladder approach where reachable;
- top-down entry;
- airborne catch where allowed.

Input/prompt policy remains configurable.

## 19.3 Ladder Motion

While attached:

- vertical input moves along the ladder path;
- lateral input may allow dismount when an exit is valid;
- sprint does not increase ladder speed by default;
- jump may perform a controlled detach/jump-away where safe;
- Set 29 receives ladder-climb exertion facts;
- camera can look freely within comfort constraints.

## 19.4 Top Exit

The top exit uses a short mantle/step action only after destination clearance succeeds.

A ladder top blocked by a newly placed voxel is reported as blocked rather than pushing the player through the ceiling.

## 19.5 Ladder Continuity

Stacked ladder segments resolve as one logical traversal path where aligned/connected.

Removing a middle section splits the path and invalidates routes through the gap.

# 20. Ropes and Vines

Rope/vine climbing uses an explicit path similar to ladders but allows a more flexible line.

## 20.1 Rope Path Types

- vertical hanging rope;
- angled climb rope;
- vine line;
- suspended short rope;
- structure-integrated rigging line.

## 20.2 Rope Climb

Player position is constrained to the rope path plus a small presentation sway envelope.

Authoritative movement uses path progress, not simulated hand-over-hand rigid-body physics.

## 20.3 Rope Rotation

A hanging rope may visually rotate/sway modestly. The player can remain aligned to the rope path without the gameplay body becoming a free rigid body.

## 20.4 Vine Surfaces Versus Vine Lines

- vine **surface**: handled by Surface Climb;
- vine **line**: handled by Rope Path.

The content definition decides which representation applies.

# 21. Deployable Ropes, Descenders and Traversal Lines

30C defines movement behaviour; items/recipes own how equipment is obtained.

## 21.1 Deployable Rope

A valid deployable rope action:

1. selects an approved anchor;
2. validates rope length/range;
3. checks line clearance;
4. creates an authoritative traversal-line instance;
5. consumes/changes item state only through the item/transaction owner;
6. registers a temporary/persistent traversal link;
7. exposes the line to local movement and pathfinding.

## 21.2 Descending

A player may descend a valid rope from the top without jumping into free fall.

Fast descent may be supported as a movement option, but biological exertion/hand injury restrictions remain Set 29-owned.

## 21.3 Tension Line / Zipline

An optional tensioned traversal line may support one-direction or bidirectional slide travel if its profile grants `traversal.rope.slide`.

This remains a traversal action, not a vehicle.

The line definition must specify:

- valid slope;
- clearance corridor;
- rider spacing/reservation;
- speed cap;
- braking/dismount rules.

# 22. Grappling Tool Architecture

Grappling is a **capability family**, not one hard-coded item.

## 22.1 Grapple Profile Families

| Family | Movement Result |
| --- | --- |
| Hook-and-Climb | Deploy tether/rope; player climbs line manually. |
| Reel Assist | Motor/mechanical/magical reel shortens tether at controlled speed. |
| Swing Grapple | Player hangs beneath anchor and swings under a tether constraint. |
| Traverse Line | Grapple establishes a temporary line between valid anchors. |
| Arcane Tether | Magic-owned effect supplies an attachment capability; 30C executes approved tether movement. |

An item or spell may support one or several profiles.

## 22.2 No Universal Grapple Behaviour

Owning a grappling item does not automatically mean:

- every surface is valid;
- infinite range;
- instant pull;
- swing;
- reel;
- enemy attachment;
- moving-object attachment.

Those are explicit capability fields.

# 23. Grapple Targeting and Attachment Validation

## 23.1 Target Sources

A grapple may target:

- explicit hardpoint anchor;
- valid material/surface category;
- creature/vehicle anchor only if the profile explicitly supports dynamic anchors;
- temporary magic anchor;
- structure rigging point.

## 23.2 Validation

Before attachment:

- target in profile range;
- line of sight/trajectory valid;
- surface/anchor supports grapple type;
- anchor state active;
- no forbidden layer;
- tether path not blocked by hard geometry;
- permission rules allow use where applicable;
- target can support mover/profile if strength/suitability is modeled;
- multiplayer authority accepts the hit.

## 23.3 Projectile Versus Trace

30C supports both through profile data.

### Ballistic Hook

- authoritative projectile/trajectory;
- visible travel time;
- collision hit chooses target;
- better for physical rope/grappling-hook fantasy.

### Instant/Beam Tether

- authoritative line/shape query;
- immediate attachment if valid;
- appropriate for magical/advanced tools.

The equipment/magic owner chooses which profile it uses.

# 24. Grapple Tether Modes: Climb, Reel, Swing and Traverse

## 24.1 Tether Climb

The tether becomes a Rope Path. Player manually moves toward/away from the anchor along the line.

## 24.2 Reel

Reel capability shortens tether length at an authorised rate.

It is not a teleport:

- movement is continuously swept;
- the player can collide with geometry;
- the tether may stop shortening when blocked;
- Set 29 receives exertion facts if the reel requires physical effort;
- equipment/energy consumption remains with its owner.

## 24.3 Swing

Swing mode uses a pendulum-like tether constraint:

- gravity remains authoritative;
- rope length constrains distance from anchor;
- player input may add limited tangential control;
- input cannot inject unbounded energy;
- collision remains active;
- detach passes velocity to 30D.

## 24.4 Traversal Line

Where supported, a grapple can create a line between two valid anchors.

It may then become:

- climb rope;
- tension-line slide;
- hand-over-hand traverse;
- infrastructure link for eligible movers.

## 24.5 Moving Anchors

Dynamic anchors are advanced and profile-gated.

The anchor provider must expose:

- authoritative transform;
- velocity/moving-frame data;
- stable attachment role;
- detach conditions;
- destruction state.

30C never attaches to a purely visual bone without an authoritative semantic anchor.

# 25. Rope and Grapple Physics Simplification

Full per-segment rigid-body rope simulation is **not required** for gameplay authority.

## 25.1 Authoritative Rope Representation

Preferred:

- endpoints;
- rope length;
- path/constraint representation;
- optional obstruction wrap points if later approved;
- occupancy;
- tension state band;
- durability/state reference from owning item/structure;
- visual-simulation parameters.

## 25.2 Presentation Rope

Visual rope may use:

- procedural segmented mesh;
- curve/spline;
- limited verlet/secondary motion;
- catenary approximation;
- contact VFX/audio.

Visual rope cannot change authoritative length or attachment.

## 25.3 Rope Wrapping

Complex arbitrary rope wrapping around every voxel is deferred by default.

v0.1 tether policy should use one of:

- clear direct line required;
- small approved contact deflection;
- explicit pulley/guide anchors.

This keeps multiplayer and save behaviour deterministic.

# 26. Traversal Equipment and Item-System Handoff

30C defines a `TraversalEquipmentFacet` interface for Item definitions.

## 26.1 Suggested Fields

```text
equipment_definition_id
traversal_capability_ids[]
grapple_profile_id?
rope_deploy_profile_id?
allowed_anchor_categories[]
max_range
line_length_class
reel_capability
swing_capability
dynamic_anchor_capability
movement_restriction_while_equipped
item_state_binding
presentation_socket_role
```

Actual:

- item name;
- recipe;
- material;
- rarity;
- durability;
- repair cost;
- price;
- ownership;

remain with their owning documents.

## 26.2 Content Gap Note

Earlier Item documentation supports utility tools and movement-affecting equipment but does not yet provide a final canonical rope/grapple item family. 30C therefore defines the required movement facet and leaves concrete production items to the post-Set-30 registry/integration pass.

# 27. External Modifiers and Set 29 Exertion Consumption

Set 29 owns biological cost and capability restriction.

## 27.1 Traversal Exertion Facts

30C can send facts such as:

- action family;
- intensity band;
- sustained/instantaneous;
- vertical gain;
- current body/load band;
- support type;
- hand/arm use requirement;
- duration;
- current movement state.

Set 29 returns the authorised movement/exertion response through XSI-30-002.

## 27.2 Examples

Vault:
- usually brief/low exertion;
- no sustained hang.

Mantle:
- brief moderate exertion;
- may be denied by severe upper-body restriction.

Ledge hang:
- sustained exertion;
- continuation may end when Set 29 reports inability.

Ladder:
- sustained low/moderate exertion based on climb rate and load.

Surface climb:
- sustained moderate/high exertion.

Grapple reel:
- depends on tool profile; physical winch may impose little player exertion while hand-over-hand rope climb does.

30C does not calculate stamina numbers.

# 28. Injury, Load and Capability Restrictions

30C consumes external restrictions.

Possible movement-facing restrictions include:

- no vault;
- no mantle;
- no ledge hang;
- no two-hand climb;
- climb speed multiplier;
- maximum sustained hang unavailable;
- no fast ladder descent;
- no grapple swing;
- reduced air/ledge capture tolerance.

The source owner decides why those restrictions exist.

## 28.1 Carrying Large Objects

When the player is carrying a large object through another system, the resulting movement profile may remove:

- vault;
- mantle;
- ladder;
- rope;
- grapple;
- ledge hang.

30C consumes capability/hand-availability results. It does not decide inventory or labour rules.

# 29. Combat and Threat Integration

## 29.1 Traversal During Combat

Traversal remains physically available unless Combat or an external state restricts it.

Potential tactical uses:

- vault a low barrier;
- mantle cover;
- climb ladder to tower;
- grapple escape route;
- pursue across a climb route.

## 29.2 No Automatic Traversal Attacks

A vault does not damage enemies by default.

A grapple does not pull enemies by default.

A mantle does not become an invulnerable animation.

Combat may define specialist actions that request Set 30 displacement, but those are Combat-owned.

## 29.3 Vulnerability

Combat may consume traversal state to determine:

- attack availability;
- defence options;
- hit reactions;
- knock-off possibility;
- weapon restrictions.

30C does not calculate damage.

## 29.4 Interruption

If authoritative combat/status impact invalidates traversal:

- ledge/rope/ladder may retain grip if capability remains;
- otherwise transition to 30D Airborne;
- a blocked mantle can fall back to ledge hang where valid;
- no animation lock keeps the player suspended after the gameplay state ends.

# 30. Building, Structures and Blueprint Forge Integration

Traversal infrastructure must be authorable and testable.

## 30.1 Structure Traversal Markers

Blueprints may contain:

- ladder path;
- climb surface;
- ledge route;
- rope anchor;
- grapple hardpoint;
- safe top exit;
- safe bottom exit;
- traversal reservation zone;
- drop zone;
- emergency access route.

## 30.2 Validation

Blueprint validation should confirm:

- required entry/exit clearance;
- path continuity;
- expected mover profile;
- no blocked top ladder exit;
- no rope through solid geometry;
- grapple hardpoint has valid open tether corridor;
- traversal route remains connected to a real walkable/nav region.

## 30.3 Damage and Repair

Structure damage may:

- remove traversal link;
- create new breach/ledge;
- expose climbable rubble;
- disable ladder;
- destroy rope anchor.

Repair can restore the original route.

## 30.4 Player-Modified Voxels

Player edits can create geometry-derived mantles/ledges dynamically without requiring every ledge to be pre-authored.

Sustained climb surfaces remain governed by material/surface permission.

# 31. NPC, Creature and Pathfinding Transition Interfaces

30I owns broader NPC pathfinding/navigation execution. 30C exposes specialist traversal links.

## 31.1 Transition Link Record

A link includes:

- entry node/anchor;
- exit node/anchor;
- traversal type;
- directionality;
- mover capability requirements;
- body/clearance class;
- cost/duration estimate;
- exertion class;
- reservation/occupancy class;
- dynamic provider state;
- fallback;
- danger/noise tags where relevant.

## 31.2 NPC Use

NPC movement systems may choose a 30C link only if:

- navigation profile supports the capability;
- current runtime state permits it;
- route intent allows it;
- path is active;
- occupancy/reservation permits use.

Set 28 may decide whether a companion is willing to follow; Set 30 decides whether the route is physically traversable.

## 31.3 Creature Climbers

Creature wall/ceiling climbing capability can reuse climb-surface/transition principles, but creature-specific body orientation and locomotion belong to their movement profile plus 30I/creature runtime integration.

30C does not force humanoid hand-contact rules onto spiders.

# 32. First-Person Camera and Body Presentation

## 32.1 First-Person Traversal Principle

Maintain player control and spatial understanding without forcing cinematic camera animation.

### Vault/Mantle

- camera follows authorised body movement;
- head-anchor presentation may be damped;
- excessive roll is avoided;
- hands/body can enter view through the connected rig;
- camera cannot clip through the target wall.

### Ledge Hang/Climb

- pitch remains player-controlled inside safe limits;
- yaw may be constrained enough to avoid camera penetration;
- body/arms remain connected;
- the camera does not detach and fly to the top before the body.

### Ladder/Rope

- camera can look around while movement remains constrained to path;
- turning the camera does not detach the player.

## 32.2 Reduced Motion

Reduced-motion presentation may:

- minimise camera vertical bob during mantle;
- avoid forced roll;
- reduce grapple swing camera lag;
- remove landing dip;
- keep horizon stable.

Gameplay path remains identical.

# 33. Third-Person Camera and Traversal Framing

Third-person camera should prioritise:

- target visibility;
- player silhouette;
- wall clearance;
- landing visibility;
- grapple anchor visibility.

## 33.1 Near-Wall Camera

The camera collision system may shift laterally or retract, but never moves the authoritative body.

## 33.2 Grapple Swing

A default swing camera may use modest velocity look-ahead.

Players can reduce or disable look-ahead/lag.

## 33.3 Tight Climbing Routes

On ladders and narrow shafts, camera distance may compress automatically. Optional first-person switching remains a user preference rather than a gameplay requirement.

# 34. Animation, IK, Motion Warping, Audio and VFX Handoff

## 34.1 Traversal Animation Events

30C may publish:

- `traversal.start`;
- `traversal.contact.hand`;
- `traversal.contact.foot`;
- `traversal.vault.apex`;
- `traversal.mantle.pull`;
- `traversal.ledge.capture`;
- `traversal.ledge.release`;
- `traversal.ladder.rung`;
- `traversal.rope.contact`;
- `traversal.grapple.attach`;
- `traversal.grapple.detach`;
- `traversal.complete`;
- `traversal.interrupted`.

Gameplay completion is not awarded solely because an animation event fired.

## 34.2 IK

IK resolves hands/feet toward:

- ledge contacts;
- ladder rungs;
- rope;
- climb surface;
- grapple line;
- landing surface.

It does not author target validity.

## 34.3 Motion Warping

Use only within action-defined translation/rotation bounds.

## 34.4 Audio/VFX

Presentation may consume:

- surface material;
- rope material;
- speed;
- exertion band;
- contact event;
- grapple attachment type;
- anchor material;
- slip/interruption event.

No critical traversal state is communicated only through sound or colour.

# 35. UI, Prompting, Failure Reasons and Knowledge

## 35.1 Minimal Prompt Rule

High-confidence familiar actions usually need no permanent prompt.

Examples:

- low vault using Jump/Traverse;
- ordinary mantle;
- ladder climb.

Prompts become useful for:

- new grappling tool;
- ambiguous rope direction;
- invalid anchor reason;
- protected/permissioned route;
- advanced traversal capability;
- accessibility tutorial.

## 35.2 Candidate Highlight

A subtle non-colour-only indicator may show:

- selected grapple point;
- ledge candidate;
- valid rope anchor;
- blocked anchor.

The world geometry remains primary.

## 35.3 Failure Reasons

Examples:

- `Too high`;
- `No room to pull up`;
- `Surface cannot be climbed`;
- `Anchor out of range`;
- `Grapple cannot attach here`;
- `Route is blocked`;
- `Cannot continue - exhausted` from Set 29;
- `Cannot climb with current load` from external capability result;
- `Ladder damaged`;
- `Rope anchor destroyed`.

# 36. Accessibility and Traversal Assistance

## 36.1 Supported Assistance

- auto ledge-grab on/off;
- expanded safe ledge-capture window;
- contextual traversal-assist strength;
- hold versus tap for mantle/ladder/rope;
- auto-align to ladder/rope within safe bounds;
- reduced requirement for precise grapple reticle;
- optional grapple target cycling among valid nearby anchors;
- traversal camera motion reduction;
- slower traversal timing where animation timing would otherwise matter;
- no repeated button mashing for climbing;
- high-contrast/non-colour traversal target cues;
- controller aim assistance for explicit grapple targets.

## 36.2 Assistance Boundary

Assistance may select among **already valid** candidates.

It may not:

- extend grapple range beyond profile;
- create an anchor;
- ignore collision;
- mantle through a ceiling;
- bypass a Set 29 hard restriction unless that owner/world setting allows it;
- climb an unapproved fortification wall.

# 37. Multiplayer Authority, Prediction and Traversal Reservations

## 37.1 Authority

Server/host owns:

- candidate acceptance;
- traversal action ID;
- selected anchor/path;
- start transform;
- target/destination;
- action progress;
- rope/grapple attachment;
- ladder/rope occupancy;
- collision result;
- exit state;
- interruption.

## 37.2 Client Prediction

Low-risk short actions may be predicted:

- low vault;
- low mantle;
- ledge capture;
- ladder start.

Prediction requires a deterministic candidate hash containing relevant geometry/provider revision.

Long/sustained actions are primarily state-replicated with local presentation smoothing.

## 37.3 Traversal Request

Client sends:

```text
input_sequence
requested_action_family
candidate_id_or_hash
entry_transform
movement_intent
camera_basis
local_geometry_revision
equipment_capability_revision
```

Server never accepts "I am now on top of the wall" as the request.

## 37.4 Narrow Route Reservation

Ladders, ropes, one-person ledges and tension lines may use reservation classes:

- exclusive;
- directional queue;
- limited capacity;
- passable;
- party-friendly overlap only if collision profile permits.

Reservation prevents two authoritative bodies from occupying impossible transition space.

## 37.5 Grapple Replication

Replicate:

- anchor ID/transform source;
- tether length;
- tether mode;
- attachment state;
- provider revision;
- authoritative player state.

Visual rope segment simulation may remain client-local.

# 38. Persistence, Save/Load and Destroyed-Route Recovery

## 38.1 Persistent Traversal Infrastructure

Persist where appropriate:

- deployed rope/line instance;
- anchor references;
- line length/path;
- owner/permission reference;
- damage/item state reference;
- traversal-link registration;
- grapple line if the design intentionally allows persistent deployment.

## 38.2 Active Player Traversal

A save may occur during traversal.

Persist enough to reconstruct when safe:

- traversal action family;
- provider/anchor ID;
- action progress/path parameter;
- current authoritative transform/velocity;
- tether length/mode;
- most recent safe position;
- provider revision.

## 38.3 Load Revalidation

If the traversal provider remains valid, reconstruct action.

If not:

- mantle/ledge -> validated nearby support or Airborne;
- ladder/rope -> nearest valid safe exit or Airborne;
- grapple -> detach and restore physical velocity where reconstructable;
- invalid collision -> 30A/30B safe-position recovery.

A broken route never traps the save.

# 39. Registry and Data Definitions

## 39.1 TraversalActionDefinition

Suggested IDs:

- `movement.traversal.vault.low`
- `movement.traversal.mantle.low`
- `movement.traversal.mantle.high`
- `movement.traversal.ledge.hang`
- `movement.traversal.climb.surface_basic`
- `movement.traversal.ladder.basic`
- `movement.traversal.rope.basic`
- `movement.traversal.grapple.swing_basic`

Fields:

- capability requirements;
- allowed entry states;
- allowed stance;
- geometry/provider requirements;
- height/depth/range bands;
- path solver;
- motion profile;
- exit states;
- cancellation rules;
- exertion profile ID;
- camera requirement;
- animation family;
- prediction class;
- reason codes.

## 39.2 TraversalSurfaceDefinition

Fields:

- surface category;
- allowed traversal families;
- material/structure source;
- directionality;
- grip/suitability band;
- weather/state modifier hook;
- required capability;
- dynamic state;
- AI/navigation support;
- presentation tags.

## 39.3 TraversalProviderRecord

For ladder/rope/structure providers:

```text
provider_id
provider_type
source_definition_id
world_instance_id
entry_anchors[]
exit_anchors[]
path_definition
supported_mover_classes[]
capability_requirements[]
reservation_profile_id
active_state
damage_state_ref
permission_ref
revision
```

# 40. Balance-Draft Baseline Values

These are implementation starting targets, not final shipped balance.

## 40.1 Vault/Mantle Geometry

| Parameter | Balance-Draft Target |
| --- | --- |
| Low vault obstacle height | approx. 0.55-1.05 m |
| Low vault obstacle depth | approx. <= 1.10 m |
| Vault forward candidate range | approx. 1.2-1.5 m from body |
| Baseline low mantle top height | approx. 0.8-1.35 m above foot support |
| High mantle candidate band | approx. 1.35-1.85 m, capability/ledge-tag gated |
| Default generic two-block fortification | not freely mantleable without explicit valid high-mantle/climb condition |
| Airborne ledge capture vertical tolerance | tune around normal jump apex and hand reach; target ~0.35-0.45 m forgiveness band |
| Ledge shimmy speed | approx. 0.8-1.1 m/s |

## 40.2 Climb/Ladder/Rope

| State | Base Movement Target |
| --- | ---: |
| Surface climb | ~1.05 m/s vertical-equivalent |
| Ladder climb | ~1.35 m/s |
| Ladder fast descent | ~1.8 m/s where capability permits |
| Rope climb | ~0.90 m/s |
| Rope descent | ~1.2 m/s controlled |
| Ledge pull-up | ~0.65-0.95 s action envelope |
| Low vault | ~0.45-0.70 s action envelope |
| Low mantle | ~0.65-0.95 s action envelope |

Set 29 may modify effective speed/continuation.

## 40.3 Grapple Starting Bands

| Parameter | Suggested Starting Band |
| --- | --- |
| Basic physical grapple range | ~10-14 m |
| Advanced reel/arcane range | data-driven; not globally fixed |
| Swing rope length | attachment distance up to profile max |
| Player tangential control | limited; cannot create unbounded energy |
| Reel speed | ~3-5 m/s depending on profile |
| Target assist cone | modest and accessibility-adjustable |

# 41. Godot/Summer Engine Implementation Direction

## 41.1 Recommended Runtime Services

```text
TraversalQueryService
TraversalCapabilityResolver
TraversalActionController
TraversalCollisionValidator
TraversalAnchorRegistry
ClimbSurfaceResolver
LadderRopePathProvider
GrappleTetherController
TraversalReservationService
TraversalNetworkAdapter
TraversalDebugService
```

## 41.2 Node/Resource Direction

Use project-owned wrappers/resources rather than hard-code traversal into one `CharacterBody3D` script.

Suggested immutable resources:

- `TraversalActionDefinition`;
- `TraversalCapabilityDefinition`;
- `TraversalSurfaceDefinition`;
- `TraversalPathDefinition`;
- `GrappleProfile`;
- `TraversalCameraProfile`;
- `TraversalPredictionProfile`;
- `TraversalReservationProfile`.

Runtime state lives in controller/records.

## 41.3 Physics

Use:

- shape casts;
- swept `CharacterBody3D` movement;
- ray/shape queries for ledge/anchor discovery;
- spline/segment parameterisation for ladders/ropes;
- deterministic tether constraint for grapple swing;
- optional visual rope solver separated from gameplay.

Avoid:

- one rigid body per rope segment;
- animation-driven transform teleport;
- physics-joint chains as the sole save/network truth;
- unconstrained frame-rate dependent swing forces.

## 41.4 Summer Engine Tests

Summer Engine may generate and run deterministic traversal fixtures across:

- voxel heights;
- different player movement profiles;
- dynamic block edits;
- anchor states;
- network latency;
- equipment capability permutations;
- Set 29 modifier snapshots.

AI-generated traversal definitions or code changes require validator and review approval.

# 42. Prototype Laboratories and Acceptance Tests

## 42.1 Vault Lab

Include obstacles:

- 0.5 m;
- 0.75 m;
- 1.0 m;
- 1.25 m;
- differing depth;
- blocked far side;
- protected structure boundary.

Verify correct vault/jump/mantle selection.

## 42.2 Mantle Lab

Include ledges:

- one-block;
- block + slab;
- high marked ledge;
- high unmarked wall;
- obstructed top;
- moving/damaged ledge.

Verify:

- generic two-block defence remains meaningful;
- valid marked high mantle works;
- blocked top falls back safely.

## 42.3 Ledge Lab

Verify:

- jump capture;
- auto-grab settings;
- shimmy;
- convex corner;
- drop;
- block removal while hanging;
- Set 29 continuation denial.

## 42.4 Climb Surface Lab

Test:

- rough rock;
- smooth stone;
- vines;
- scaffold;
- wet/iced modifier;
- damage-state change;
- creature-only surface.

## 42.5 Ladder Lab

Test:

- top/bottom/mid entry;
- stacked segments;
- missing middle segment;
- blocked top;
- two-player queue;
- NPC transition link;
- destruction during climb.

## 42.6 Rope Lab

Test:

- vertical rope;
- angled rope;
- deployable rope;
- anchor removal;
- fast descent;
- line through newly placed voxel;
- persistence/save reload.

## 42.7 Grapple Lab

Test:

- valid hardpoint;
- invalid material;
- out of range;
- line blocked;
- ballistic hook;
- instant arcane tether;
- reel into wall;
- swing detach momentum;
- dynamic anchor;
- client/server correction.

## 42.8 Camera Lab

First-person:

- vault;
- mantle;
- ledge hang;
- ladder;
- rope;
- grapple swing.

Third-person:

- tight shaft;
- wall proximity;
- swing velocity;
- target visibility;
- reduced motion.

## 42.9 Blueprint/World Edit Lab

While traversing:

- place/remove destination block;
- destroy ladder;
- remove rope anchor;
- repair ladder;
- build a new valid mantle ledge.

Routes and runtime actions must update without stale invisible links.

# 43. Handoff to 30D and Later Set 30 Documents

## 43.1 30D

30C sends 30D:

- drop/detach transform;
- authoritative velocity;
- traversal release source;
- fall-start context;
- grapple release velocity;
- safe-position reference;
- environment context.

30D owns:

- fall acceleration/terminal behaviour;
- fall consequence handoff to Set 29;
- gliding;
- controlled descent outside rope/ladder;
- aerial/environmental traversal.

## 43.2 30H

30C exposes traversal-link costs and accessibility for route planning.

30H may decide a route requires:

- ladder;
- climb;
- grapple;
- bridge alternative;
- long detour.

It does not re-simulate 30C actions.

## 43.3 30I

30I consumes traversal transition links for NPC navigation, reservations and group pathing.

## 43.4 30J

30J finalises shared traversal registries, validators and compatibility matrices.

# 44. Main-Document Integration Register

| Existing Document | Integration Required |
| --- | --- |
| 02 | Progression may grant traversal capabilities/modifiers; no duplicate traversal physics. |
| 03 | Add/confirm semantic climb/grapple/ladder surface facets to relevant block families. |
| 04 | Add canonical traversal-equipment facets and production rope/grapple item families as approved. |
| 05 | Provide recipes for approved traversal equipment/infrastructure; no movement logic in recipes. |
| 11 | Worldgen may place climb surfaces/anchors/routes and validate reachability packages. |
| 12/19/20 | Structures/blueprints expose traversal providers and validate mover clearance. |
| 16 | Combat consumes traversal state and may request interruption/displacement without owning traversal. |
| 17 | UI owns prompt/binding/accessibility presentation for traversal intents. |
| 22E/F/H | Forge supplies semantic contacts, rigs, animation and movement profiles; Set 30 remains motion authority. |
| 25C/K | Final capability, anchor, event and completeness registries include Set 30 traversal families. |
| 26E | Maintain water-side ownership; land ledge/rope handoff remains explicit. |
| 30A/B | Parent architecture and locomotion entry/exit remain binding. |

# 45. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward; pending explicit approval.

30C does not transfer swimming/diving ownership. A water-exit ledge may be provided to 26E as a terrestrial transition target, but 26E remains responsible for aquatic approach/exit behaviour until the integration decision is approved.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Carried forward and refined for sustained traversal; no ownership transfer.

30C requires the XSI-30-002 contract to accept an explicit Set-30-owned **exertion request context**:

```text
movement_action_id
movement_action_family
intensity_band
is_sustained
elapsed_duration
vertical_gain
support_mode
hand_arm_requirement
current_load_band
external_equipment_assist_band
```

Set 29 returns its existing owned decision fields:

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

Set 30 reports movement facts and obeys the response. Set 29 remains sole owner of stamina, fatigue, injury and recovery simulation.

No new Set 27 or Set 28 interface is required by 30C.

# 46. Open Decisions and Deferred Questions

1. Final low/high mantle height bands after player-rig and one-metre voxel testing.
2. Whether baseline high mantle remains unavailable entirely until a progression unlock, or is available only on explicitly tagged ledges.
3. Final default for contextual auto-vault: Jump-only versus high-confidence auto while sprinting.
4. Final default for ledge auto-grab.
5. Whether player surface climbing is present early game or introduced through equipment/skill progression.
6. Whether ceiling climbing is ever granted to the player outside special magic/creature forms.
7. Exact rope/ladder exertion bands after Set 29 is final.
8. Whether deployable rope consumes a physical rope length stack, a single reusable rope item or a hybrid item-state model; Items/Recipes own the final answer.
9. Whether tension-line/zipline traversal ships in Core Production or later.
10. Whether physical grapple hooks use full ballistic projectile simulation for all variants or allow a simplified validated arc.
11. Whether arbitrary rope wrapping around geometry is ever required; v0.1 defaults to direct/explicit guide paths.
12. Whether grapples can attach to moving creatures outside specific boss/quest actions.
13. Whether grapple swing is Core Production or a later traversal upgrade.
14. Final client-prediction classes for mantle/ledge capture after multiplayer measurement.
15. Final traversal reservation behaviour for crowded ladders in settlements.
16. Whether Combat gains any dedicated attack-from-ledge or vault-attack actions later; not owned here.
17. Final canonical rope/grapple item roster and recipes during post-Set-30 registry integration.
18. Resolution of XSI-30-001 and final XSI-30-002 schema.

# Appendix A. Traversal Action Transition Matrix

| From | Condition / Input | To | Owner Check | Failure |
| --- | --- | --- | --- | --- |
| Ground Run/Sprint | low obstacle + Jump/Traverse | Traverse/Vault | 30C geometry/capability | Standard Jump or blocked |
| Ground/Airborne | reachable ledge + intent | Traverse/Mantle | 30C destination clearance | Ground/Airborne |
| Airborne | grabbable ledge + capture | Traverse/LedgeHang | 30C + Set 29 availability | Continue Airborne |
| LedgeHang | mantle | Traverse/Mantle | destination clearance | Remain Hang / Drop |
| LedgeHang | lateral input | Traverse/LedgeShimmy | ledge continuity | Stop / Drop if support lost |
| Ground | climb surface entry | Traverse/SurfaceClimb | capability + surface | Stay Ground |
| SurfaceClimb | top ledge | Mantle/Ground | destination clearance | Remain Climb / Drop |
| Ground/Airborne | ladder entry | Traverse/Ladder | provider active | prior state |
| Ground/Airborne | rope entry | Traverse/Rope | provider active | prior state |
| Ground/Airborne | grapple attach | Traverse/Grapple | profile + target | prior state |
| Any Traverse | provider destroyed | Ground/Airborne/Safe | continuous revalidation | Safe recovery |
| Traverse | exertion denied | Ground/Airborne | Set 29 | reason surfaced |

# Appendix B. Traversal Query and Candidate Templates

```text
TraversalQuery
query_id
entity_id
physics_tick
origin_transform
movement_mode
movement_state
stance
velocity
move_intent
camera_basis
requested_action
body_profile_id
capability_revision
external_modifier_revision
world_collision_revision
query_channels[]
```

```text
TraversalCandidate
candidate_id
candidate_type
provider_id?
geometry_hash?
entry_transform
exit_transform?
path_ref?
surface_ref?
distance
height_delta
depth
intent_alignment
clearance_result
capability_result
permission_result
destination_safety
provider_revision
score
reason_codes[]
```

# Appendix C. Traversal Action Definition Template

```text
traversal_action_id
action_family
allowed_entry_modes[]
allowed_entry_states[]
allowed_stances[]
required_capabilities[]
required_surface_categories[]
required_provider_types[]
height_band
depth_band
range_band
alignment_tolerance
motion_solver_type
motion_profile
exit_policy
cancel_policy
failure_policy
exertion_profile_id
camera_profile_id
animation_family_id
prediction_class
reservation_profile_id?
reason_codes[]
version
```

# Appendix D. Climb Surface and Anchor Template

```text
surface_or_anchor_id
source_definition_id
world_instance_id?
semantic_role
surface_category
normal/orientation
bounds
supported_traversal_families[]
required_capabilities[]
mover_classes[]
permission_ref?
state_ref
damage_ref
environment_modifier_ref?
entry_links[]
exit_links[]
provider_revision
```

# Appendix E. Ladder/Rope Path Template

```text
path_provider_id
provider_type
path_points_or_spline
entry_anchors[]
exit_anchors[]
directionality
width
clearance_profile
movement_speed_profile
reservation_profile
supported_mover_classes[]
required_capabilities[]
damage_state_ref
permission_ref
active
revision
```

# Appendix F. Grapple Profile Template

```text
grapple_profile_id
deployment_mode
target_query_type
range
trajectory_profile?
allowed_anchor_categories[]
allowed_surface_categories[]
dynamic_anchor_allowed
tether_modes[]
rope_length_policy
reel_speed
swing_constraint_profile
player_control_profile
collision_policy
line_obstruction_policy
detach_policy
external_energy_cost_ref?
exertion_profile_id?
presentation_profile_id
prediction_class
version
```

# Appendix G. Exertion Request Template

```text
request_id
entity_id
movement_action_id
movement_action_family
intensity_band
is_sustained
elapsed_duration
vertical_gain
support_mode
hand_arm_requirement
current_load_band
external_equipment_assist_band
physics_tick
```

# Appendix H. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| traversal.no_candidate | No valid traversal target found. | Set 30 |
| traversal.too_high | Candidate exceeds action capability band. | Set 30 |
| traversal.too_far | Candidate outside reach/range. | Set 30 |
| traversal.exit.blocked | Destination clearance invalid. | Set 30 |
| traversal.surface.not_climbable | Surface lacks climb suitability. | Set 30 + source data |
| traversal.anchor.invalid | Anchor inactive/unsupported. | Set 30/provider |
| traversal.path.blocked | Traversal corridor became blocked. | Set 30 |
| traversal.ladder.damaged | Ladder provider inactive due to source state. | Structure/block owner surfaced through Set 30 |
| traversal.rope.anchor_lost | Rope provider lost anchor. | Provider/Set 30 |
| traversal.grapple.range | Grapple target out of profile range. | Set 30 |
| traversal.grapple.material | Surface/anchor not compatible. | Set 30 + item/profile |
| traversal.grapple.line_blocked | Tether path blocked. | Set 30 |
| traversal.exertion.denied | Set 29 denied begin/continue. | Set 29 |
| traversal.capability.restricted | External/current-state restriction. | Owning source |
| traversal.permission.denied | Access/ownership restriction. | Owning structure/faction/permission system |
| traversal.recovery.safe_fallback | Action failed and safe fallback was used. | Set 30 |

# Appendix I. Multiplayer Traversal Contract

## Client -> Authority

```text
player_id
input_sequence
client_tick
requested_action_family
candidate_id_or_hash
entry_transform
move_intent
camera_basis
equipment_capability_revision
external_modifier_revision
local_provider_revision
local_geometry_revision
```

## Authority -> Client

```text
server_tick
ack_input_sequence
traversal_action_id?
action_state
provider_id?
entry_transform
current_transform
exit_transform?
path_progress?
tether_length?
movement_mode
movement_state
provider_revision
reason_codes[]
```

# Appendix J. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Vault | Low obstacles cross smoothly; invalid far side rejects; no auto-vault in precision mode. |
| Mantle | Reachable ledges work; blocked destination rejects; generic fortification remains meaningful. |
| Ledge | Contextual capture, shimmy and drop work; destroyed ledge transitions safely. |
| Climb | Only approved surfaces climb; smooth protected walls remain non-climbable. |
| Ladder | Segment continuity, top/bottom entry, blocked exit and damage states work. |
| Rope | Path climb/descent works without per-segment physics authority; destroyed anchor invalidates route. |
| Grapple | Range/material/line-of-sight validated; reel/swing cannot phase through voxels or create unlimited energy. |
| Set 29 Boundary | Sustained traversal obeys XSI-30-002 without calculating stamina in 30C. |
| Item Boundary | Rope/grapple identity, recipe, price and durability remain external; movement facet is consumed. |
| Forge Boundary | Animation/IK aligns to authorised action; invalid target returns to safe locomotion. |
| Building | Blueprint traversal markers validate clear entries/exits and become real navigation links. |
| Dynamic Voxels | Mining/placing during traversal invalidates/rebuilds routes correctly. |
| Camera | First/third person preserve spatial control with reduced-motion alternatives. |
| Multiplayer | Server validates candidate/provider revisions; no client-only mantle/grapple teleport. |
| Persistence | Active traversal/deployed lines reload or fail safely; broken routes never trap saves. |
| 30B Regression | Ground/jump/crouch/crawl behaviour remains unchanged when no traversal candidate is committed. |

# END OF DOCUMENT 30C
