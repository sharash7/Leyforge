# Fantasy Voxel Civilisation Sandbox
## 22F - Entity Animation, Locomotion, Combat and Visual States
### Voxel Animation Layers, Movement Families, Combat Readability, Runtime Presentation and Forge Workflow
**Version 0.1 - Detailed Design Bible Draft**

A voxel-first animation and runtime-presentation system for player characters, NPCs, animals, multi-legged creatures, segmented crawlers, flying creatures, monsters, mounts and bosses inside the Leyforge Forge.

## Entity Animation, Locomotion, Combat and Visual States Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines animation assets, pose libraries, clip families, locomotion graphs, movement transitions, combat actions, animation events, procedural gait support, runtime visual-state layering, damage presentation, retargeting, preview tools, LOD, validation and proof-of-concept animation sets. |
| Core Philosophy | Animation must preserve clear voxel silhouettes, communicate gameplay state before spectacle, and scale from simple livestock to multi-limbed bosses without requiring every entity to receive a completely unique animation system. |
| Voxel Direction | Every animated entity remains built from voxel-authored source geometry. Animation may move rigid voxel parts, deform constrained voxel regions, swap voxel frames, alter voxel materials or drive baked derivatives, but it must never become a route for replacing the source with unrelated smooth-mesh models. |
| Animation Stack | Use a hybrid stack: authored skeletal or rigid-part clips, procedural IK and gait correction, bounded secondary motion, voxel-frame or mesh-swap animation, material animation, light and attachment-state changes. Each layer has an explicit priority and fallback. |
| Locomotion Direction | Locomotion is body-plan aware. Humanoids, quadrupeds, spiders, centipedes, serpents, birds, bats, dragons, aquatic creatures, floating entities and constructs use compatible movement families rather than one universal state machine. |
| Combat Direction | Combat animation prioritises anticipation, readable attack paths, recoveries, interruption windows, hit reactions and clear state changes. The Forge authors presentation and named events; combat code remains authoritative over damage, targeting, stamina, cooldowns and hit confirmation. |
| Procedural Direction | Procedural movement supports terrain contact, foot placement, body support, gait timing, head tracking, wing adjustment, tail follow-through and repeated segments. It refines authored clips and must have deterministic profiles and safe fallbacks. |
| Event Direction | Animation timelines may contain named event markers for footsteps, contact, release, impact, tool strikes, projectile launch, breath release, interaction completion and presentation hooks. Events request or announce timing; gameplay systems decide authoritative results. |
| Visual-State Direction | Runtime states such as wet, burning, frozen, poisoned, corrupted, empowered, damaged, exhausted, frightened, sleeping, dead or boss-phase-changed are layered non-destructively over the base model and animation state. |
| Expression Direction | Humanoids and expressive creatures may use voxel face-part swaps, jaw motion, eye states, eyebrow parts, head poses and limited voxel-frame expressions. Full realistic facial simulation is not required. |
| Retargeting Direction | Animation libraries are shared through semantic rig roles and compatibility profiles. Exact-family reuse is preferred; semantic retargeting is allowed with review; incompatible body plans require bespoke clips or deliberate bridge profiles. |
| Performance Direction | Animation update rate, solver count, bone count, visible state layers and event evaluation scale by entity importance, distance and screen size. Bosses receive authored LOD; crowds and swarms use simplified or staggered updates. |
| Icon Direction | Any animation pose, selected frame or runtime visual state may be captured through the Forge live view for inventory icons, portraits, codex entries, boss cards and blueprint thumbnails where appropriate. |
| Override Direction | Developers may override models, clips, state graphs, event markers, pose libraries, procedural profiles and visual-state mappings while preserving stable IDs and migration rules. |
| Validation Direction | Hard-fail invalid state references, corrupt clip data, missing required roles, impossible transition targets, duplicate authoritative events and broken dependencies. Warn on foot sliding, unreadable attacks, clipping, excessive motion, unsafe retargeting and poor silhouette readability. |
| Audio/VFX Boundary | Animation may expose named sound and effect events or attachment sockets, but full audio production and particle/VFX authoring are deferred to future Forge modules. Placeholder previews are permitted only for timing validation. |
| Implementation Context | Godot with Summer Engine is the current implementation target. This document locks design and data contracts; concrete resources, graphs, runtime services and editor implementation are expanded in 22K. |
| POC Direction | Prove humanoid locomotion and combat, four-armed coordination, pig movement, spider gait, giant-centipede wave motion, bird take-off and flight, dragon ground/air combat, one NPC work loop, one mount loop, visual status layering and two animation LOD levels. |

## Document Purpose

This document defines how voxel entities created through the Leyforge Forge move, act, fight, work, react and communicate their current condition. Documents 22B through 22E define body plans, humanoid and creature construction, skeletons, joints, inverse kinematics and attachment systems. Document 22F turns those foundations into animation libraries, locomotion graphs, combat actions, procedural movement profiles and runtime visual-state presentation.

The system must support very different bodies without losing a shared authoring language. A player character needs responsive movement, tool use, combat and interaction. A villager needs work cycles, carrying, building, social gestures and danger reactions. A pig needs readable livestock behaviour. A spider needs a stable eight-leg gait. A giant centipede needs a travelling movement wave across repeated segments. A bird needs take-off, flight, banking, landing and perching. A dragon needs grounded weight, wing-driven flight, neck and tail follow-through, breath attacks, boss phases and damage states.

Animation is not only decorative polish. It communicates whether an entity is idle, alert, tired, injured, casting, attacking, blocking, carrying, working, fleeing, sleeping, burning, frozen, corrupted or dead. It also provides timing anchors for gameplay systems. The system therefore needs strict contracts between visual timelines and authoritative simulation. An animation event may announce that a sword reaches its strike point, but combat code decides whether an attack is active and whether a target is hit. A work animation may fire a hammer-contact event, but the construction system decides whether progress is awarded.

The system remains voxel-first. Rigid body parts, crisp silhouettes and deliberate stepped forms are the default visual language. Limited constrained skinning is allowed where bending improves readability, but animation must avoid soft, rubber-like deformation that makes voxel characters look disconnected from the rest of Leyforge. Voxel-frame swaps, material changes and mesh-state changes remain important tools for flames, expressions, magical transformation, damage and special creature bodies.

This document does not define the final combat rules, AI decision logic, hitbox authority, navigation ownership, damage formulas, boss encounter design or complete technical implementation. Combat integration and entity gameplay markers are expanded in 22H, while runtime architecture and Godot implementation are expanded in 22K. Full audio and VFX creation remain deferred.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Documents 21A-21G establish the Voxel Asset Forge. Documents 22A-22E expand it into a voxel-only Entity Forge and Blueprint Forge with body plans, models and rigs. This document establishes the shared animation, locomotion, combat-presentation and visual-state layer used by those systems.

## Design Sources

| Source Document | Relevant Direction | How 22F Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Characters and creatures should remain stylised, readable, atmospheric and clearly part of the voxel world. | Locks voxel-preserving animation, strong silhouettes and state readability over realism. |
| 01 - Core Gameplay Loop | Players gather, build, interact, automate, defend, upgrade and expand. | Requires responsive action, work, interaction, combat and danger-reaction animations. |
| 03 - Blocks Registry | Blocks and functional objects use active, powered, damaged, corrupted and orientation states. | Shares state-binding and readable-transition principles across entities and animated objects. |
| 07 - NPC Village System | NPCs work, carry, build, trade, flee, defend, celebrate, mourn and follow schedules. | Requires reusable NPC work, social, carrying, danger and recovery animation sets. |
| 08 - Automation System | Moving parts and active states should visibly communicate what machines are doing. | Uses the same animation-event and runtime-state philosophy for entity-linked machinery and constructs. |
| 09 - Magic System | Casting, mana, corruption, wards and magical states need physical presentation. | Requires cast phases, magical overlays, transformation states and readable interruption windows. |
| 10 - Creatures and Monsters | Creatures need distinct silhouettes, movement, behaviour roles, attacks and boss phases. | Defines body-plan-specific locomotion and creature combat presentation. |
| 16 - Combat, Gear and Defence | Combat needs readable attacks, blocks, dodges, reactions, equipment and damage states. | Establishes animation phases, event markers, reaction layers and equipment-aware motion contracts. |
| 21C - Animation, Effects and Runtime Visual States | Forge assets may use transform animation, voxel frames, materials, sockets and coded state bindings. | Extends those principles from machines and items to full entities. |
| 21D - Asset Overrides and Registry Integration | Visual assets may be replaced while stable IDs and gameplay definitions remain intact. | Requires stable animation, graph, pose and state IDs with override-safe migrations. |
| 21E - Forge UI/UX and Creator Workflow | Forge creation should be direct, previewable, reversible and validated. | Defines the entity animation workspace, timeline, graph editor and test laboratory workflow. |
| 22A - Forge Entity and Blueprint Expansion | Entity creation, icon capture, dependency graphs, lifecycle states and testing are Forge-wide capabilities. | Uses the shared manifest, lifecycle, revision, packaging and live-preview systems. |
| 22B - Entity Model Taxonomy | Body plans include humanoids, quadrupeds, arthropods, segmented crawlers, flyers, dragons and unusual forms. | Defines compatible animation families for each body architecture. |
| 22C - Humanoid Creator | Player and NPC models use modular bodies, equipment, expressions and deterministic variation. | Defines humanoid animation, equipment fit, dialogue pose and customisation-safe movement. |
| 22D - Creature Creator | Creature models cover livestock, spiders, centipedes, birds, dragons, bosses and hybrids. | Defines creature-specific locomotion, attacks, damage and boss-phase animation needs. |
| 22E - Rigging and IK | Semantic rigs, contacts, sockets, IK and retargeting are shared foundations. | Uses those rig contracts as the base for clips, state graphs, procedural layers and events. |

## Static Table of Contents

1. Locked Animation System Identity
2. Player Decision Summary
3. Animation System Architecture
4. Animation Asset and Data Model
5. Voxel Animation Principles
6. Hybrid Animation Stack
7. Pose, Clip and Graph Taxonomy
8. Stable IDs, Naming and Registry Rules
9. Rest Poses, Reference Poses and Pose Libraries
10. Locomotion State Architecture
11. Root Motion, In-Place Motion and Movement Authority
12. Blending, Transitions and Interruptibility
13. Directional Movement, Turning and Orientation
14. Humanoid Ground Locomotion
15. Humanoid Traversal, Swimming and Climbing
16. Humanoid Work, Social and Daily-Life Animation
17. Additional Arms and Unusual Humanoids
18. Quadruped Locomotion
19. Livestock and Pig Animation Profile
20. Spider and Hexapod Locomotion
21. Giant Centipede and Segmented-Crawler Motion
22. Serpent, Worm and Flexible-Body Motion
23. Bird and Avian Locomotion
24. Bat, Hovering and Multi-Winged Flight
25. Wyvern and Dragon Locomotion
26. Aquatic, Amorphous, Floating and Construct Motion
27. Terrain Adaptation and IK Integration
28. Procedural Gait Designer
29. Secondary Motion and Follow-Through
30. Combat Animation Architecture
31. Humanoid Melee, Ranged and Magic Actions
32. Creature and Monster Attack Animation
33. Boss Actions, Phases and Arena Readability
34. Animation Events and Gameplay Timing Windows
35. Hit Reactions, Stagger, Guard and Knockback
36. Damage, Incapacitation, Death and Breakable Parts
37. NPC Jobs, Tools, Interactions and Construction
38. Mounts, Riders, Cargo and Vehicle-Like Creatures
39. Facial Expression, Dialogue and Communication
40. Runtime Visual-State Layering
41. Environmental, Magical and Status Presentation
42. Equipment, Clothing, Armour and Weapon Motion
43. Retargeting and Shared Animation Libraries
44. Procedural Variation, Seeds and Individuality
45. Animation LOD, Crowds and Performance
46. Multiplayer, Authority, Saves and Replay Consistency
47. Forge Animation Workspace and Workflow
48. Timeline, Graph and Event Editing
49. Live Preview, Icon Capture and Test Laboratory
50. Validation, Readability and Accessibility
51. Overrides, Dependencies, Revision and Packaging
52. Editable Source and Baked Runtime Products
53. Proof-of-Concept Scope and Acceptance Criteria
54. Implementation Handoff and Deferred Features
55. Balancing and Production Rules
56. Open Questions for Later Documents
- Appendix A. Animation Definition Template
- Appendix B. Semantic Clip Naming Register
- Appendix C. Animation Event Register
- Appendix D. Minimum Animation Sets by Body Family
- Appendix E. Runtime Visual-State Priority Matrix
- Appendix F. Performance Guidance
- Appendix G. Validation Checklist
- Appendix H. Proof-of-Concept Checklist
- Appendix I. Glossary

# 1. Locked Animation System Identity

The Entity Animation System is the movement, action and readable-state layer of the Forge. It converts voxel models and semantic rigs into responsive characters, believable creatures, functional workers, readable combatants and memorable bosses.

**Locked Rule:** An animation should not exist only because movement looks empty. Every animation or runtime presentation layer should answer at least one question: what is the entity doing, where is its weight, what is it preparing, what can interrupt it, what has affected it, what does the player need to understand, and which gameplay system owns the result?

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel Motion | Movement preserves voxel silhouettes and part clarity. | Characters and creatures remain visually consistent with the world. |
| Body-Plan Movement | Locomotion follows anatomy rather than a universal humanoid solution. | Pigs, spiders, centipedes, birds and dragons move differently and read clearly. |
| Gameplay Readability | Anticipation, contact, release and recovery are visible. | Players can learn attacks, reactions and interactions. |
| Living-World Behaviour | Work, social, rest and danger states are animated. | NPCs feel like active inhabitants rather than static markers. |
| Procedural Support | IK, gait and secondary motion adapt authored clips. | Entities handle slopes, stairs, perches and repeated limbs more naturally. |
| Runtime State | Conditions layer over base motion without replacing identity. | Wet, burning, frozen, corrupted and injured entities remain understandable. |
| Reuse and Scalability | Semantic rigs and clip families reduce duplicate work. | Many variants can share quality animation foundations. |
| Performance Awareness | Animation complexity scales by visibility and importance. | Villages, raids and swarms remain practical. |

## 1.1 Animation Design Promise

A player should be able to look at an entity and quickly understand whether it is idle, working, suspicious, frightened, attacking, recovering, injured, casting, carrying, sleeping or affected by a major status. A spider should read as low, fast and many-legged. A pig should feel heavy and grounded. A bird should visibly transfer from ground locomotion into flight. A dragon should communicate weight, direction and attack danger before its effects arrive.

## 1.2 What Animation Is Not

- It is not a substitute for AI logic.
- It is not the authority for damage, inventory, movement permission or world state.
- It is not a reason to abandon voxel geometry for smooth imported characters.
- It is not a requirement that every entity use complex skinning.
- It is not an excuse for unreadable motion, excessive camera shake or constant particles.
- It is not a requirement to create full audio or VFX tools inside this document set.

# 2. Player Decision Summary

| Area | Locked Decision |
| --- | --- |
| Voxel Identity | All source models and animated geometry remain voxel-authored. |
| Default Method | Skeletal or rigid-part animation is the main method, supported by constrained voxel skinning where useful. |
| Frame Animation | Voxel-frame and mesh-swap animation remain available for expressions, flames, transformations, amorphous bodies and special states. |
| Procedural Motion | Use procedural correction for terrain contacts, repeated limbs, tails, wings and gaze. |
| State Graphs | Use body-family graphs with reusable layers rather than one giant universal graph. |
| Animation Reuse | Share clips through semantic rig roles and compatibility profiles. |
| Combat Readability | Attacks require anticipation, active/contact timing and recovery presentation. |
| Event Markers | Timelines may publish named events, but gameplay remains authoritative. |
| NPC Life | Include work, carrying, social, sleep, danger and recovery states. |
| Status Presentation | Use layered non-destructive visual states with explicit priority and compatibility rules. |
| Boss Direction | Bosses receive phase-aware animation, breakable-region support and strong telegraphs. |
| Icon Capture | Icons and portraits can capture any approved pose, frame or runtime state from live view. |
| Developer Control | Existing clips, graphs, events and mappings can be overridden manually in the Forge. |
| Audio/VFX | Only hooks and preview placeholders are included now; full creation tools are deferred. |
| POC | Prove representative humanoid, quadruped, arthropod, segmented, avian and dragon animation families. |

# 3. Animation System Architecture

The system separates source animation, runtime evaluation, presentation layers and gameplay authority.

```text
Entity Definition
├── Voxel Model Source
├── Semantic Rig Definition
├── Animation Profile
│   ├── Pose Library
│   ├── Clip References
│   ├── Locomotion Graph
│   ├── Action Graph
│   ├── Procedural Profiles
│   └── Visual-State Mapping
├── Runtime Animation State
├── Gameplay State Adapter
└── Baked Runtime Products
```

| Layer | Owns | Does Not Own |
| --- | --- | --- |
| Animation Source | Keyframes, poses, curves, events, state graph and procedural settings. | AI intent or combat result. |
| Runtime Evaluator | Current clip, blend, transition, solver output and presentation state. | Persistent world truth. |
| Gameplay Adapter | Converts authorised gameplay state into animation parameters and receives named timing callbacks. | Visual authoring data. |
| Visual-State Layer | Material, voxel-frame, visibility, damage and condition presentation. | Status duration or effect damage. |
| Forge Preview | Manual test parameters, camera, lighting, terrain and capture settings. | Shipped save state. |

## 3.1 Event-Driven Boundary

The animation system consumes parameters such as movement speed, grounded state, current action, damage reaction, equipment profile and status tags. It can publish events such as `foot_contact.left`, `tool_contact`, `projectile_release` or `breath_release`. Gameplay services validate whether those events have consequences.

## 3.2 Deterministic Evaluation

Authoring data, seeded procedural variation and event order should produce repeatable results when given the same authorised inputs. Purely cosmetic local variation may be allowed, but it must not alter hit timing, movement authority or other gameplay outcomes.

# 4. Animation Asset and Data Model

Each animation-facing asset should use stable, versioned definitions.

| Data Record | Purpose |
| --- | --- |
| AnimationProfile | Links an entity or family to clip sets, graphs and visual states. |
| AnimationClip | Stores transforms, curves, frames, events and metadata. |
| PoseDefinition | Stores a reusable named pose. |
| StateGraph | Defines nodes, transitions, parameters, priorities and interruptions. |
| BlendProfile | Controls how body regions or clips blend. |
| ProceduralProfile | Defines IK, gait, follow-through or solver settings. |
| EventMarker | Named timeline event with time, payload type and authority classification. |
| VisualStateProfile | Maps runtime tags to materials, parts, frames, overlays and animation modifiers. |
| RetargetProfile | Maps semantic roles and scale adjustments between rigs. |
| AnimationLODProfile | Defines reduced clips, solver limits and update frequency. |
| CaptureProfile | Stores icon, portrait or codex camera and pose settings. |

## 4.1 Animation Profile Fields

```text
animation_profile_id
body_family_id
rig_profile_id
base_locomotion_graph_id
action_graph_ids[]
pose_library_ids[]
clip_family_ids[]
retarget_profile_ids[]
procedural_profile_ids[]
visual_state_profile_id
lod_profile_id
capture_profile_ids[]
dependency_ids[]
version
lifecycle_state
```

## 4.2 Clip Fields

```text
clip_id
display_name
semantic_action
source_rig_id
duration
loop_mode
root_motion_mode
keyframe_tracks
voxel_frame_tracks
material_tracks
visibility_tracks
event_markers
blend_in
blend_out
interrupt_rules
required_roles
supported_equipment_profiles
authoring_fps
bake_settings
```

# 5. Voxel Animation Principles

## 5.1 Preserve Crisp Form

The default visual expectation is that voxel parts remain readable as voxel parts. Bends should not smear colours across large areas or create smooth rubber shapes. When skinning is used, weights should be constrained and reviewed in silhouette.

## 5.2 Prefer Part Clarity

Rigid-part motion is preferred for:

- armour plates;
- hands holding tools;
- jaws;
- horns;
- hooves and feet;
- insect limb segments;
- construct parts;
- dragon scales or plates where deformation would look weak.

## 5.3 Controlled Deformation

Constrained voxel skinning is useful for:

- shoulders and hips;
- necks;
- tails;
- wing membranes;
- flexible torsos;
- serpentine bodies;
- limited facial regions.

## 5.4 Voxel-Frame Changes

Voxel-frame or baked mesh-state tracks are valid when topology or silhouette changes:

- blinking eyes;
- mouth shapes;
- flame bodies;
- magical transformation;
- slime compression;
- wing-feather spread;
- damaged armour loss;
- boss phase mutation.

# 6. Hybrid Animation Stack

The final pose and presentation may be produced by several layers.

```text
Reference Pose
    + Base Locomotion Clip
    + Upper-Body or Action Clip
    + Additive Gesture or Expression
    + IK and Gait Correction
    + Secondary Chain Motion
    + Voxel-Frame / Visibility Changes
    + Material and Runtime Visual States
```

| Layer | Typical Use | Priority Rule |
| --- | --- | --- |
| Base Locomotion | Walk, run, fly, swim, crawl. | Lowest movement layer. |
| Action | Attack, cast, mine, build, eat. | Overrides relevant body regions. |
| Additive | Look, breathe, gesture, recoil. | Adds only declared offsets. |
| Procedural | Foot placement, hand alignment, wing correction. | Applied after authored motion within limits. |
| Voxel Frame | Face, flame, transformation, damage. | Can replace declared parts or regions. |
| Visual State | Wet, burning, corrupted, empowered. | Presentation overlay with explicit compatibility. |

## 6.1 Layer Masks

Each layer declares semantic body regions such as lower body, upper body, head, jaw, wings, tail, additional arms or full body. Masks are semantic, not dependent on arbitrary bone names.

## 6.2 Conflict Resolution

When layers conflict, priority is resolved through:

1. gameplay-critical action;
2. incapacitation or death;
3. locomotion safety;
4. interaction alignment;
5. expression and secondary motion;
6. cosmetic variation.

# 7. Pose, Clip and Graph Taxonomy

| Type | Purpose | Examples |
| --- | --- | --- |
| Reference Pose | Authoring and retarget baseline. | A-pose, quadruped stand, wing-neutral. |
| Static Pose | Reusable held posture. | Guard, sit, sleep, perch. |
| Loop Clip | Continuous motion. | Walk, idle, fly, swim. |
| One-Shot Clip | Single action. | Attack, jump, tool strike. |
| Additive Clip | Offset layered over another clip. | Look, breathing, recoil. |
| Transition Clip | Connects states. | Take-off, land, lie down, stand up. |
| Reaction Clip | Responds to state or impact. | Flinch, stagger, fear. |
| Phase Clip | Boss or transformation change. | Armour break, wing injury. |
| Voxel-Frame Track | Shape or part replacement. | Blink, flame, mouth shape. |
| Procedural Profile | Runtime solver behaviour. | Spider gait, tail follow. |

## 7.1 Graph Layers

An entity may use separate graphs for:

- base locomotion;
- traversal;
- combat stance;
- current action;
- social or work behaviour;
- facial state;
- visual status;
- boss phase.

This avoids turning every possible combination into a single unreadable graph.

# 8. Stable IDs, Naming and Registry Rules

Animation definitions use namespace-safe IDs.

```text
anim.humanoid.locomotion.walk.forward
anim.humanoid.combat.sword.light_01
anim.pig.behaviour.feed_loop
anim.spider.attack.bite_telegraph
anim.centipede.locomotion.wave_fast
anim.bird.flight.takeoff_ground
anim.dragon.combat.breath_fire_release
pose.humanoid.guard.sword
state.entity.status.frozen
```

## 8.1 Stable ID Rule

Renaming a display label must not silently rename the stable ID. Replacing a clip under the same ID is allowed only when compatibility is preserved or a migration is recorded.

## 8.2 Semantic Naming

Names should identify body family, action group, action and variant. Avoid names such as `new_anim_3` or `dragon_good_attack`.

## 8.3 Registry Separation

Gameplay action IDs and animation IDs remain separate. One gameplay action may choose among multiple animation variants, while one animation may be reused by several compatible actions.

# 9. Rest Poses, Reference Poses and Pose Libraries

## 9.1 Required Reference Poses

Each rig family requires a declared reference pose with:

- forward direction;
- up direction;
- ground plane;
- neutral joint limits;
- hand or foot orientation;
- wing-fold state where relevant;
- tail neutral direction;
- scale reference.

## 9.2 Pose Libraries

Pose libraries speed authoring and provide consistent presentation.

| Pose Group | Examples |
| --- | --- |
| Humanoid | Neutral, combat ready, tool ready, sit, sleep, carry. |
| Quadruped | Stand, alert, graze, lie, mount-ready. |
| Arthropod | Neutral spread, low stalk, attack-raised. |
| Avian | Perch, ground stand, wing-open, glide. |
| Dragon | Ground neutral, threat display, flight neutral, breath charge. |
| Boss | Phase portrait, weak-point expose, defeat pose. |

## 9.3 Pose Capture

Approved poses may be saved as icon, dialogue, codex or boss-card capture presets. The capture stores pose ID, camera, lighting, selected variant and runtime state.

# 10. Locomotion State Architecture

Locomotion graphs consume authorised movement parameters and choose compatible animation states.

| Parameter | Example Values |
| --- | --- |
| movement_mode | ground, air, swim, climb, perch, burrow, float |
| speed_normalised | 0.0 to 1.0 |
| direction_local | forward, back, left, right or vector |
| grounded | true/false |
| slope_angle | degrees |
| turn_rate | signed value |
| stance | relaxed, alert, combat, crouched, injured |
| gait | walk, trot, run, gallop, skitter, wave |
| action_lock | none, partial, full |
| equipment_profile | unarmed, sword, bow, tool, shield, staff |

## 10.1 Family Graphs

A body family owns a reusable locomotion graph. Individual species or variants may override clips, speed bands, gait thresholds and transitions without duplicating the whole graph.

## 10.2 Movement Modes

Changing movement mode requires explicit transitions where visually important:

- ground to jump;
- ground to flight;
- flight to landing;
- ground to swim;
- swim to shore;
- walk to climb;
- stand to burrow;
- float to grounded collapse.

# 11. Root Motion, In-Place Motion and Movement Authority

## 11.1 Default Rule

Authoritative character movement remains owned by movement or navigation systems. In-place clips are the default for standard locomotion because they are easier to network, retarget and align with voxel terrain.

## 11.2 Root Motion Uses

Root motion may be used for tightly authored actions such as:

- short lunges;
- boss slams;
- vaults;
- take-off launches;
- knockdowns;
- finishing moves;
- creature pounces.

Gameplay must authorise the movement window and validate destination clearance.

## 11.3 Motion Warping

Limited motion warping may align an approved action with a target marker, ledge, saddle, workstation or attack point. It must not stretch clips beyond configured limits or teleport an entity through blocked space.

# 12. Blending, Transitions and Interruptibility

## 12.1 Blend Rules

Every state or action declares:

- blend-in time;
- blend-out time;
- interrupt category;
- minimum committed time;
- exit windows;
- body-region mask;
- fallback pose.

## 12.2 Interrupt Categories

| Category | Meaning |
| --- | --- |
| Free | Can be interrupted immediately. |
| Soft Commit | Can be interrupted by danger or high-priority actions. |
| Action Commit | Must reach a declared cancel window. |
| Hard Commit | Only death, despawn or explicit emergency can interrupt. |
| Cosmetic | Always yields to gameplay animation. |

## 12.3 Transition Quality

The Forge should warn on:

- abrupt limb flips;
- feet changing phase during a blend;
- wings intersecting the body;
- held equipment snapping;
- root direction mismatch;
- large scale or rest-pose mismatch.

# 13. Directional Movement, Turning and Orientation

## 13.1 Turning Methods

Entities may use:

- rotate-in-place clips;
- strafing blends;
- curved locomotion;
- planted-foot turn;
- whole-body snap for small stylised creatures;
- segmented follow-through for long bodies.

## 13.2 Orientation Profiles

A profile defines:

- maximum body turn rate;
- head-look allowance;
- torso twist allowance;
- foot or contact replanning threshold;
- wing banking response;
- tail counterbalance;
- facing-lock rules during attacks.

## 13.3 Readability Rule

Large creatures should not rotate instantly without visible weight transfer. Small creatures may turn quickly, but their contact and body orientation should still make the direction change understandable.

# 14. Humanoid Ground Locomotion

The humanoid family supports player characters, villagers, humanoid enemies and many bosses.

## 14.1 Minimum Ground Set

- idle relaxed;
- idle alert;
- walk forward;
- walk backward;
- strafe left and right;
- jog or run;
- sprint;
- start and stop;
- turn left and right;
- crouch idle and move;
- jump start, rise, fall and land;
- injured locomotion where required.

## 14.2 Player Responsiveness

Player movement may use faster blends and shortened starts than NPC movement. Presentation should remain readable without making input feel delayed.

## 14.3 NPC Weight and Variation

NPCs may use variation in:

- posture;
- arm swing;
- stride length;
- idle frequency;
- carrying stance;
- age profile;
- injury profile;
- culture or profession gestures.

Variation must not break navigation speed or equipment alignment.

# 15. Humanoid Traversal, Swimming and Climbing

## 15.1 Traversal Actions

- step up;
- vault low obstacle;
- mantle ledge;
- ladder climb;
- rope or vine climb;
- swim surface;
- swim underwater;
- wade;
- crawl through low space;
- mount or dismount.

## 15.2 Voxel Terrain Alignment

Traversal markers should align with one-metre blocks, slabs, stairs, ladders, ledges and Blueprint Forge markers. The Forge test laboratory must include representative voxel obstacles.

## 15.3 Failure Fallback

When a traversal target becomes invalid, the entity must return to a safe locomotion state rather than freezing mid-animation.

# 16. Humanoid Work, Social and Daily-Life Animation

NPC villages require practical animation sets beyond combat.

## 16.1 Work Families

| Work Family | Core Motions |
| --- | --- |
| Mining | Raise tool, strike, recover, inspect, carry ore. |
| Lumber | Chop, brace, drag or carry wood. |
| Farming | Hoe, sow, water, harvest, carry basket. |
| Building | Carry block, place, hammer, inspect scaffold. |
| Smithing | Hammer, turn, quench, inspect. |
| Crafting | Reach, mix, cut, assemble, operate station. |
| Trading | Present item, count, gesture, write. |
| Guarding | Patrol, scan, signal, ready weapon. |
| Magic Work | Read rune, channel, inspect conduit, maintain ward. |

## 16.2 Social Families

- greet;
- wave;
- point;
- agree;
- refuse;
- celebrate;
- mourn;
- fear;
- argue;
- eat and drink;
- sit and stand;
- sleep and wake;
- carry child or small object where supported.

## 16.3 Event Integration

Work clips may publish `tool_contact`, `resource_pickup`, `resource_place` or `interaction_complete`, but job systems remain authoritative over inventory and progress.

# 17. Additional Arms and Unusual Humanoids

## 17.1 Four-Arm Coordination

Additional-arm humanoids may use:

- mirrored secondary arm motion;
- independent tool or shield layers;
- coordinated two-pair attacks;
- upper-pair gestures while lower pair carries;
- family-specific idle poses.

## 17.2 Role Masks

Clips must declare which arm pair they control. A standard humanoid clip may retarget to the primary pair while a procedural or additive profile supplies secondary-arm posture.

## 17.3 Readability

Multiple arms should not create constant visual noise. At least one clear action hierarchy must be visible during combat or work.

# 18. Quadruped Locomotion

Quadrupeds include pigs, cattle, sheep, wolves, horses, bears and many fantasy animals.

## 18.1 Gait Bands

| Speed Band | Typical Gait |
| --- | --- |
| Very Slow | Careful walk or graze step. |
| Slow | Walk. |
| Medium | Trot. |
| Fast | Run or canter. |
| Maximum | Gallop, charge or species-specific sprint. |

## 18.2 Contact and Body Support

Authored clips establish gait rhythm. Quadruped IK adjusts contact height and body tilt within limits. The solver should not completely re-time the gait unless the procedural profile explicitly supports it.

## 18.3 Turning

Small quadrupeds may turn through tighter curves. Large mounts and beasts require wider turns, visible body lean and rear-leg follow-through.

# 19. Livestock and Pig Animation Profile

The pig is the POC quadruped reference because it tests a compact, grounded and readable animal.

## 19.1 Pig Minimum Set

- neutral idle;
- sniff idle;
- feed or root ground;
- walk;
- trot;
- run or flee;
- turn;
- lie down;
- stand up;
- sleep;
- startled reaction;
- hurt reaction;
- death;
- optional mud or water interaction.

## 19.2 Behaviour Readability

The player should distinguish feeding, calm wandering, alertness and panic through posture and speed, not only through UI icons.

## 19.3 Variant Reuse

Domestic pig, wild boar and fantasy boar variants may share the family graph while overriding stride, tusk clearance, attack clips and body-weight response.

# 20. Spider and Hexapod Locomotion

## 20.1 Authored Plus Procedural

The recommended spider solution combines:

- authored body movement and gait phase;
- procedural foot targets;
- leg-group timing;
- ground detection;
- bounded abdomen and head motion.

## 20.2 Gait Groups

An eight-leg spider can use alternating groups, while a six-leg creature can use a tripod gait. The Forge should display groups by colour and preview step order.

## 20.3 Climbing

Climbing profiles may orient contacts to walls or ceilings. Navigation and surface permission remain external; the animation system only solves approved contact targets.

## 20.4 Attack Transition

Attack poses should clearly distinguish bite, leap, web or threat display from normal locomotion. Raised front legs and body compression can provide strong anticipation.

# 21. Giant Centipede and Segmented-Crawler Motion

## 21.1 Repeated Wave System

The centipede uses a travelling phase wave across segments and leg pairs.

```text
head_phase = 0
segment_phase = index * phase_offset
leg_pair_phase = segment_phase + side_offset
```

The profile stores segment count, phase offset, stride, contact height, body-wave amplitude and LOD grouping.

## 21.2 Body Following

The head follows navigation. Body segments follow a constrained path or chain with collision limits. Legs use representative contacts near the player and grouped motion at distance.

## 21.3 Damage and Missing Segments

A damaged or shortened centipede must rebuild its phase groups safely. Missing visual limbs must not leave invalid event references or solver targets.

## 21.4 Performance Rule

Do not evaluate full IK independently for every leg on a very large centipede. Use representative contacts, grouped heights and authored visual waves.

# 22. Serpent, Worm and Flexible-Body Motion

## 22.1 Movement Families

- ground slither;
- burrow entry and exit;
- swim;
- coil idle;
- strike;
- constrict;
- climb or wrap where supported.

## 22.2 Path-Follow Motion

A serpent may use a head-driven path with body-chain sampling. The system preserves segment spacing and limits sharp bends.

## 22.3 Contact Presentation

Ground contact may be implied by body-wave shape and selected contact samples rather than full-body collision solving.

# 23. Bird and Avian Locomotion

## 23.1 Ground States

- stand;
- head-bob idle;
- hop;
- walk;
- short run;
- peck or feed;
- perch;
- sleep.

## 23.2 Flight States

- crouch or launch anticipation;
- take-off;
- flap flight;
- glide;
- bank left or right;
- climb;
- descend;
- hover where species allows;
- landing approach;
- contact and settle.

## 23.3 Wing and Tail Coordination

Wing clips provide primary lift rhythm. Procedural layers may adjust bank, tail fan, wing spread and landing alignment within limits.

## 23.4 Perching

Perch markers define foot targets and body orientation. The bird should transition through approach, contact and settle rather than snapping into place.

# 24. Bat, Hovering and Multi-Winged Flight

## 24.1 Bat Motion

Bats use broad membrane-wing cycles, hanging rest poses, quick turns and optional cave-ceiling transitions.

## 24.2 Hovering Entities

Floating eyes, wisps and magical constructs may use:

- hover bob;
- drift;
- orbiting parts;
- directional lean;
- sudden dash;
- collapse or disperse.

## 24.3 Multiple Wings

Four-wing or multi-wing creatures require wing-group roles and phase offsets. The Forge must preview whether wing paths collide with each other or the body.

# 25. Wyvern and Dragon Locomotion

## 25.1 Ground Movement

Dragons require visible weight and body coordination:

- grounded idle;
- heavy walk;
- turn;
- run or charge;
- crouch;
- take-off;
- landing recovery;
- wing-assisted leap;
- climb or scramble where supported.

## 25.2 Flight Movement

- launch;
- powered flap;
- glide;
- bank;
- climb;
- dive;
- hover for suitable variants;
- attack pass;
- landing approach.

## 25.3 Neck and Tail

Authored body motion drives the core. Procedural chains add bounded follow-through and counterbalance. Combat actions can temporarily take priority over follow motion.

## 25.4 Injured Flight

Damaged-wing states may alter flap symmetry, disable flight or force emergency landing depending on gameplay state. Animation presents the condition; gameplay determines capability.

# 26. Aquatic, Amorphous, Floating and Construct Motion

## 26.1 Aquatic Creatures

Fish-like bodies use body waves, fin motion and bank. Large aquatic creatures may use slower body curves and surface-breach transitions.

## 26.2 Slimes and Amorphous Bodies

Slimes may combine:

- voxel-frame compression;
- scale and part motion;
- limited lattice-like deformation;
- material pulse;
- split or merge state changes.

## 26.3 Floating Constructs

Orbiting parts use deterministic paths, parented local transforms and state-driven speed changes.

## 26.4 Golems and Rigid Constructs

Constructs favour rigid-part animation, mechanical stops, clear weight shifts and visible powered/unpowered states.

# 27. Terrain Adaptation and IK Integration

## 27.1 Evaluation Order

1. choose authored locomotion pose;
2. evaluate root or movement alignment;
3. sample approved contact targets;
4. solve feet, claws or hands;
5. adjust pelvis or body support;
6. apply secondary chains;
7. validate limits and fallback.

## 27.2 Terrain Types

The test set should include:

- full blocks;
- slabs;
- stairs;
- slopes;
- uneven natural terrain;
- narrow beams;
- perches;
- shallow water;
- moving or temporary surfaces where supported.

## 27.3 Failure Safety

If a solver cannot find a valid target, it should blend toward authored motion rather than stretching a limb indefinitely.

# 28. Procedural Gait Designer

The Gait Designer provides guided profiles for multi-legged and repeated-limb creatures.

## 28.1 Gait Parameters

| Parameter | Meaning |
| --- | --- |
| limb_groups | Which contacts move together. |
| phase_order | Step sequence. |
| duty_factor | Portion of cycle spent planted. |
| stride_length | Forward reach. |
| lift_height | Foot clearance. |
| body_sway | Body response. |
| turn_bias | Inner/outer limb adjustment. |
| terrain_probe | Contact-search settings. |
| replanning_threshold | When a foot target is replaced. |
| injured_profile | Optional altered gait. |

## 28.2 Presets

- humanoid walk assistance;
- quadruped walk, trot and gallop;
- spider alternating gait;
- hexapod tripod gait;
- centipede travelling wave;
- crab lateral gait;
- heavy dragon walk;
- bird hop;
- injured limp.

## 28.3 Authoring Control

Presets are starting points. Developers can edit every group and timing value, save custom profiles and bake a representative preview clip.

# 29. Secondary Motion and Follow-Through

Secondary motion adds life without taking control away from authored actions.

## 29.1 Supported Uses

- tails;
- ears;
- hair clumps;
- cloth panels;
- straps;
- feathers;
- horns with flexible tips;
- tentacles;
- hanging equipment;
- dragon neck and tail follow-through.

## 29.2 Rules

- remain bounded;
- reset safely on teleport or LOD change;
- respect attack priority;
- avoid repeated world collision unless explicitly budgeted;
- use deterministic or visually equivalent local behaviour;
- disable or simplify at distance.

# 30. Combat Animation Architecture

Combat presentation is divided into phases.

```text
Ready
→ Anticipation
→ Commitment
→ Active / Release
→ Follow-Through
→ Recovery
→ Return or Chain
```

## 30.1 Phase Metadata

Each combat clip may declare:

- anticipation range;
- movement lock;
- facing lock;
- active or release marker;
- cancel windows;
- chain windows;
- recovery category;
- guard or armour state;
- equipment requirements;
- compatible reactions.

## 30.2 Readability Rule

The damaging or dangerous portion of an action must be visually connected to its anticipation. Fast attacks can be brief, but they still require a learnable cue appropriate to difficulty.

## 30.3 Presentation Versus Authority

Animation timing is authored and can be referenced by combat actions, but server or host authority decides whether a hitbox, projectile or effect is spawned and whether damage is applied.

# 31. Humanoid Melee, Ranged and Magic Actions

## 31.1 Melee Families

- unarmed;
- one-handed sword or axe;
- two-handed weapon;
- spear or polearm;
- shield block and bash;
- dual wield;
- staff;
- tool used defensively.

## 31.2 Ranged Families

- bow draw, hold and release;
- crossbow load and fire;
- thrown object;
- sling or device;
- firearm-like fantasy device if later added.

The projectile-release event is a timing reference, not ownership of projectile creation.

## 31.3 Magic Families

- focus ready;
- channel;
- cast release;
- sustained beam or ward;
- ritual interaction;
- interrupted cast;
- overload or backlash.

## 31.4 Equipment Profiles

Clips declare grip, hand roles, stance and required sockets. The Forge preview should detect hand separation, clipping and incompatible equipment scale.

# 32. Creature and Monster Attack Animation

## 32.1 Attack Categories

- bite;
- claw;
- horn or tusk charge;
- tail swipe;
- body slam;
- leap or pounce;
- web or spit;
- sting;
- constrict;
- wing strike;
- breath or beam;
- summon or transformation.

## 32.2 Creature-Specific Telegraphs

| Creature | Telegraph Example |
| --- | --- |
| Pig/Boar | Head lowers and forelegs brace before charge. |
| Spider | Body compresses or front legs raise before leap or bite. |
| Centipede | Head plates spread and forward segments coil. |
| Bird | Wings draw back and body pitches before dive. |
| Dragon | Chest, throat and jaw prepare before breath release. |

## 32.3 Attack Origin Markers

Clips may reference mouth, claw, stinger, tail, wing or projectile sockets. Missing required sockets are hard validation errors for approved attack clips.

# 33. Boss Actions, Phases and Arena Readability

## 33.1 Boss Animation Goals

Boss animation must communicate:

- phase identity;
- attack danger;
- weak-point exposure;
- breakable-part loss;
- arena movement;
- recovery opportunity;
- transition into defeat or escape.

## 33.2 Phase Transition

Phase transitions may combine:

- full-body clip;
- part visibility changes;
- voxel-frame mutation;
- material state;
- damage-region remap;
- new stance and locomotion profile;
- named event references for future VFX and audio.

## 33.3 Large-Body Camera Readability

Important motion should remain visible from normal gameplay cameras. The Forge test laboratory should preview attacks at expected combat distance, not only in a close studio view.

# 34. Animation Events and Gameplay Timing Windows

## 34.1 Event Classes

| Class | Examples | Authority |
| --- | --- | --- |
| Contact | foot_contact, tool_contact, land_contact | Presentation or gameplay callback. |
| Release | projectile_release, breath_release, item_drop | Gameplay validates result. |
| Window | combo_open, combo_close, guard_window | Gameplay consumes timing. |
| State | takeoff_commit, perch_lock, mount_seated | Movement or interaction validates. |
| Presentation | expression_change, camera_focus_hint | Local presentation only. |
| Future Hook | sound.*, effect.* | Reference only until future modules. |

## 34.2 Event Requirements

Each event stores:

```text
event_id
time_or_normalised_time
event_class
semantic_payload
authority_requirement
loop_policy
lod_policy
network_policy
```

## 34.3 Duplicate Protection

An event must not fire twice because of blend evaluation, loop wrap, resimulation or LOD change. The runtime implementation needs event cursors and explicit replay rules.

## 34.4 Frame Scrubbing

The Forge timeline should display events clearly and allow precise scrubbing, snapping and comparison to contact poses.

# 35. Hit Reactions, Stagger, Guard and Knockback

## 35.1 Reaction Layers

Small reactions may be additive over locomotion. Large reactions may replace full-body movement.

| Reaction Tier | Example |
| --- | --- |
| Minor | Small flinch or head snap. |
| Standard | Torso recoil or step back. |
| Heavy | Stagger, stumble or wing collapse. |
| Knockdown | Fall to ground and recover. |
| Break | Limb, armour or phase-specific reaction. |

## 35.2 Directional Reactions

Where practical, reactions can use hit direction and region. The presentation should not imply a different damage direction than the authoritative result.

## 35.3 Guard and Parry

Guard animations require stable equipment alignment and clear success, strain and break reactions. Combat code decides whether a guard succeeds.

## 35.4 Knockback

Movement authority controls displacement. Animation layers align body pose and landing without moving the entity independently beyond approved root motion.

# 36. Damage, Incapacitation, Death and Breakable Parts

## 36.1 Damage Presentation

Damage may appear through:

- additive posture;
- slowed or uneven gait;
- hidden or broken voxel parts;
- material damage layer;
- damaged equipment;
- lowered wing or tail;
- reaction frequency change.

## 36.2 Incapacitation

Incapacitation states include stunned, knocked down, sleeping, restrained, unconscious and dead. Each state declares entry, loop and exit rules.

## 36.3 Death Profiles

Possible profiles:

- authored fall;
- collapse to side;
- rigid construct break-apart;
- voxel disassembly;
- dissolve or magical dispersal;
- boss defeat sequence.

## 36.4 Breakable Parts

When gameplay disables a region, the animation graph remaps or suppresses affected clips. A dragon with a disabled wing should not continue using normal symmetrical flight clips.

## 36.5 Persistence

Persistent world records store gameplay state, not full transient animation pose, unless a specific save or cinematic requirement needs it. On load, the entity resolves into a valid presentation state.

# 37. NPC Jobs, Tools, Interactions and Construction

## 37.1 Interaction Targets

Blueprint Forge and job sites may expose:

- stand marker;
- hand target;
- tool target;
- look target;
- carry pickup;
- carry drop;
- seat;
- bed;
- ladder;
- workstation controls.

## 37.2 Tool Alignment

Tool profiles define grip sockets, secondary-hand targets, contact point and action family. A hammer, pickaxe, hoe and staff may share parts of a motion family while retaining different contacts.

## 37.3 Construction Stages

Builders can use stage-aware animations:

- carry supplies;
- place foundation block;
- hammer frame;
- inspect wall;
- install functional asset;
- celebrate completion.

The structure system decides when a block or stage changes.

## 37.4 Distant Simulation

Distant NPC jobs do not require full animation. The runtime may reduce updates or remove actors entirely while preserving abstract work progress.

# 38. Mounts, Riders, Cargo and Vehicle-Like Creatures

## 38.1 Mount State Set

- mount-ready idle;
- rider mount;
- seated idle;
- ridden walk/run/fly;
- rider lean or aim;
- dismount;
- forced fall or knock-off.

## 38.2 Synchronisation

Mount and rider use stable seat and hand targets. The mount owns locomotion presentation; the rider graph follows approved movement and action layers.

## 38.3 Cargo

Pack animals may alter posture or gait based on cargo profile. The gameplay inventory remains authoritative; animation only consumes a cargo-weight or presentation parameter.

## 38.4 Large Multi-Rider Creatures

Multiple seats require stable IDs, occupancy mappings and camera tests. Animations must preserve seat transforms across LOD where riders remain visible.

# 39. Facial Expression, Dialogue and Communication

## 39.1 Voxel Expression Methods

- eye-part swap;
- eyelid voxel frame;
- eyebrow-part rotation or swap;
- mouth frame;
- jaw motion;
- head tilt;
- ear position;
- emissive eye state;
- limited facial material overlay.

## 39.2 Expression Set

- neutral;
- happy;
- angry;
- afraid;
- sad;
- tired;
- injured;
- sleeping;
- talking;
- casting;
- corrupted;
- dead.

## 39.3 Dialogue Gestures

Dialogue presentation may combine face, head look, upper-body gesture and idle variation. It should remain readable in close view without demanding realistic lip synchronisation.

## 39.4 Creature Communication

Creatures may use posture, wing spread, tail position, head motion, colour or material changes to signal threat, submission, curiosity or fear.

# 40. Runtime Visual-State Layering

Visual states are separate from base animation graphs but can modify them.

## 40.1 State Categories

| Category | Examples |
| --- | --- |
| Physical Condition | injured, exhausted, starving, sleeping. |
| Environment | wet, muddy, snowy, underwater. |
| Elemental | burning, frozen, shocked. |
| Magical | empowered, warded, cursed, corrupted. |
| Social/AI | frightened, enraged, charmed, surrendered. |
| Equipment | unarmed, carrying, armoured, broken gear. |
| Boss | phase_2, exposed_core, broken_wing. |

## 40.2 State Effects

A state may change:

- material palette;
- emission;
- part visibility;
- voxel-frame layer;
- stance;
- locomotion speed presentation;
- additive motion;
- expression;
- allowed animation graph branch;
- capture thumbnail state.

## 40.3 Priority

Death, incapacitation and major phase states override ordinary status presentation. Multiple compatible cosmetic states may stack, such as wet plus frightened, while incompatible material states require precedence rules.

# 41. Environmental, Magical and Status Presentation

## 41.1 Wet and Muddy

Wet states may darken material response and add small drips through future VFX hooks. Mud may apply a lower-body material or voxel overlay.

## 41.2 Burning

Burning can add a heat posture, damage material and named effect sockets. Full flame authoring is deferred. The state must remain readable even when effect previews are disabled.

## 41.3 Frozen

Frozen presentation may reduce animation amplitude, apply a frost material, lock selected parts or transition into a rigid frozen pose if gameplay authorises it.

## 41.4 Corruption

Corruption may alter colour, emission, posture, idle motion, expression and selected body parts. It should be inherited through variant rules rather than requiring a separate full model for every entity.

## 41.5 Empowered States

Empowered or enchanted states may modify stance, movement intensity and material response. They should not hide attack readability.

# 42. Equipment, Clothing, Armour and Weapon Motion

## 42.1 Equipment-Aware Graphs

Equipment profiles select compatible stances, grips, attacks and idle layers.

## 42.2 Clothing Motion

Voxel cloth remains part-based or uses short constrained chains. Large smooth cloth simulation is not required.

## 42.3 Armour Clearance

The Forge should test:

- shoulder and hip clearance;
- helmet and jaw movement;
- wing and back equipment;
- additional arms;
- seated mount poses;
- tool swings;
- first-person camera visibility.

## 42.4 Broken Equipment

Damaged or broken gear may swap voxel parts, hide sections or change held pose. Inventory and durability systems remain authoritative.

# 43. Retargeting and Shared Animation Libraries

## 43.1 Compatibility Levels

| Level | Meaning |
| --- | --- |
| Exact | Same rig and proportions. |
| Family | Same semantic rig with acceptable proportion differences. |
| Semantic | Compatible roles with retarget profile and review. |
| Bridged | Deliberate mapping with missing or added roles. |
| Incompatible | Requires a new clip or body-family animation. |

## 43.2 Shared Libraries

Recommended libraries include:

- standard humanoid;
- small humanoid;
- four-arm humanoid extension;
- compact quadruped;
- canine or long-legged quadruped;
- spider;
- hexapod;
- segmented crawler;
- avian;
- bat;
- wyvern;
- four-leg dragon;
- fish;
- floating entity;
- golem.

## 43.3 Retarget Review

The Forge should compare source and target side by side, highlight role mismatches and test equipment, contacts and silhouette.

# 44. Procedural Variation, Seeds and Individuality

## 44.1 Deterministic Variation

Individual entities may vary:

- idle selection;
- idle timing;
- stride accent;
- head-look frequency;
- gesture preference;
- breathing amplitude;
- tail motion;
- expression timing.

Variation uses stored seeds where persistence matters.

## 44.2 Gameplay-Safe Rule

Cosmetic variation must not alter authoritative event times, active windows, navigation speed or hit results.

## 44.3 Population Readability

Variation should reduce obvious cloning without making NPC behaviour unpredictable or visually chaotic.

# 45. Animation LOD, Crowds and Performance

## 45.1 Animation LOD Layers

| LOD | Typical Behaviour |
| --- | --- |
| LOD 0 | Full clips, IK, secondary motion, face and state layers. |
| LOD 1 | Full core clips, reduced IK and secondary chains. |
| LOD 2 | Simplified clips, grouped procedural motion, reduced update rate. |
| LOD 3 | Minimal loop, pose interpolation or impostor state. |
| Abstract | No rendered entity; simulation summary only. |

## 45.2 Update Staggering

Crowds, livestock groups and raids may stagger animation updates while preserving apparent smoothness through interpolation.

## 45.3 Event Policy

Gameplay-critical events must not be skipped because visual LOD changes. Either authoritative gameplay owns the timing independently or the event is evaluated in a reduced non-visual track.

## 45.4 Boss LOD

Bosses require authored reductions rather than automatic removal of essential parts, weak-point anchors or attack readability.

# 46. Multiplayer, Authority, Saves and Replay Consistency

## 46.1 Authority

The host or server owns gameplay state and movement authority. Clients reproduce animation from replicated parameters, action IDs and event confirmations.

## 46.2 Local Prediction

Player-controlled movement may predict locomotion and selected actions for responsiveness. Correction should blend where possible without hiding authoritative changes.

## 46.3 Cosmetic Locality

Non-gameplay idle variation, tiny secondary motion and local expression timing may be client-local if they do not affect interactions or recording requirements.

## 46.4 Save Loading

On load, entities resolve to a valid state from persistent gameplay records. Long one-shot clips are not assumed to resume at the exact prior frame unless a specific persistent sequence requires it.

## 46.5 Replay and Debugging

Debug recordings should capture action IDs, graph parameters, state transitions, event markers and seeds needed to reproduce animation issues.

# 47. Forge Animation Workspace and Workflow

## 47.1 Guided Workflow

1. Select entity or animation family.
2. Confirm compatible rig and reference pose.
3. Create or choose a pose library.
4. Create a clip or retarget an existing clip.
5. Edit transform, voxel-frame, material and visibility tracks.
6. Add event markers and interruption metadata.
7. Add the clip to a locomotion or action graph.
8. Configure procedural profiles and state layers.
9. Test equipment, terrain, status and LOD.
10. Validate, approve and bake.

## 47.2 Main Panels

- Asset and animation browser;
- viewport;
- timeline and curve editor;
- pose library;
- semantic rig tree;
- state graph;
- layer and mask panel;
- event track;
- procedural profile panel;
- visual-state panel;
- live parameter inspector;
- dependency and validation panel;
- capture studio.

## 47.3 Non-Destructive Editing

Clips, retarget layers, additive corrections and procedural profiles should remain separable until deliberately baked.

# 48. Timeline, Graph and Event Editing

## 48.1 Timeline Features

- transform keys;
- curve interpolation;
- voxel-frame keys;
- visibility keys;
- material parameters;
- event tracks;
- loop range;
- onion-skin or pose ghosts;
- contact guides;
- marker snapping;
- frame and time display.

## 48.2 Graph Features

- state nodes;
- blend nodes;
- parameter conditions;
- priority layers;
- transition preview;
- interruption rules;
- fallback states;
- graph validation;
- live runtime highlighting.

## 48.3 Event Editing

The event editor must show event class, authority, payload and LOD policy. It should prevent accidental use of future `sound.*` or `effect.*` references as gameplay-authoritative events.

# 49. Live Preview, Icon Capture and Test Laboratory

## 49.1 Preview Environments

- neutral studio;
- forest day and night;
- village interior and exterior;
- cave;
- factory;
- mana-lit ruin;
- rain and snow;
- uneven terrain course;
- stairs and slabs;
- shallow water;
- flight arena;
- combat arena;
- workstation and construction site;
- mount test lane.

## 49.2 Live Controls

Developers can set:

- speed;
- direction;
- grounded state;
- stance;
- action;
- equipment;
- target position;
- terrain profile;
- status tags;
- boss phase;
- LOD;
- multiplayer delay simulation.

## 49.3 Icon and Portrait Capture

Any approved pose or selected animation frame can be captured with:

- orthographic or perspective camera;
- automatic framing;
- transparent background;
- selected variant and equipment;
- selected runtime state;
- lighting preset;
- locked or live-linked regeneration.

# 50. Validation, Readability and Accessibility

## 50.1 Hard Errors

- missing rig or required semantic role;
- corrupt clip data;
- invalid graph target;
- cyclic state dependency;
- missing required attack socket;
- duplicate gameplay-authoritative event;
- impossible LOD reference;
- missing source dependency;
- invalid stable ID;
- broken override chain.

## 50.2 Warnings

- foot sliding;
- limb clipping;
- poor attack anticipation;
- overly long recovery;
- unreadable silhouette at distance;
- excessive screen shake reference;
- equipment clipping;
- extreme retarget stretch;
- solver instability;
- too many active layers;
- missing icon capture profile;
- status colour indistinguishable from base palette.

## 50.3 Accessibility Principles

Gameplay-critical state should not rely only on colour. Use posture, timing, silhouette, UI and optional outlines where appropriate. Fast attacks should support difficulty or accessibility adjustments through gameplay timing, not by silently changing visual events without validation.

# 51. Overrides, Dependencies, Revision and Packaging

## 51.1 Override Scope

Developers may override:

- individual clips;
- complete animation families;
- graph transitions;
- event markers;
- pose libraries;
- procedural profiles;
- visual-state mappings;
- capture profiles;
- LOD profiles.

## 51.2 Dependency Graph

The Forge should show which entities, actions, equipment sets, blueprints or capture assets depend on an animation definition before it is changed or removed.

## 51.3 Revision Comparison

Comparison should support:

- side-by-side viewport playback;
- event-track differences;
- graph differences;
- pose differences;
- changed dependencies;
- approved-version restore.

## 51.4 Packaging

An animation package may include source clips, graphs, pose libraries, procedural profiles, retarget maps, baked runtime assets, capture profiles, dependencies, migration notes and validation report.

# 52. Editable Source and Baked Runtime Products

## 52.1 Editable Source

The source asset stores:

- voxel-linked rig reference;
- keyframe curves;
- voxel-frame source;
- material and visibility tracks;
- events;
- graph source;
- masks;
- procedural profiles;
- retarget mappings;
- visual-state mappings;
- capture settings;
- revision metadata.

## 52.2 Baked Runtime Products

Runtime products may include:

- optimised animation clips;
- compressed curves;
- resolved masks;
- runtime state graph;
- event tables;
- reduced LOD clips;
- precomputed retarget data;
- capture images;
- dependency manifest.

## 52.3 Rebuild Rule

Every runtime animation product must be reproducible from editable source and recorded bake settings.

# 53. Proof-of-Concept Scope and Acceptance Criteria

## 53.1 Required POC Animation Families

| Asset | Required Proof |
| --- | --- |
| Standard Humanoid | Idle, walk, run, jump, tool use, sword attack, hit, death. |
| Four-Arm Humanoid | Primary-pair locomotion plus secondary-arm action layer. |
| Pig | Idle, feed, walk, trot, flee, lie, rise, hit, death. |
| Spider | Eight-leg gait, turn, climb preview, bite or leap, hit, death. |
| Giant Centipede | Generated body wave, grouped leg motion, turn, attack, LOD reduction. |
| Bird | Ground idle, hop/walk, take-off, flap, glide, bank, land, perch. |
| Dragon | Ground walk, turn, take-off, flight, land, bite, tail attack, breath, phase reaction. |
| NPC Builder | Carry, place, hammer and complete interaction events. |
| Mount | Mount, seated locomotion and dismount. |

## 53.2 Visual-State Proof

At least one entity must demonstrate:

- wet;
- damaged;
- burning hook state without full VFX authoring;
- frozen;
- corrupted;
- empowered;
- death or defeat.

## 53.3 Event Proof

The POC must demonstrate correctly classified and de-duplicated:

- foot contact;
- tool contact;
- melee active/release;
- projectile or breath release;
- mount seated;
- interaction complete.

## 53.4 Performance Proof

At least two animation LOD levels must be demonstrated for standard entities, with grouped or simplified procedural motion for the centipede and authored reduction for the dragon.

## 53.5 Acceptance Rule

The POC passes when every required entity can be created, animated, previewed, validated, captured and baked through the Forge without replacing voxel source geometry or embedding gameplay authority inside the animation asset.

# 54. Implementation Handoff and Deferred Features

## 54.1 Handed to 22H

- gameplay hitbox and weak-point rules;
- AI action selection;
- combat authority;
- navigation ownership;
- mount permissions;
- interaction validity;
- simulation LOD ownership.

## 54.2 Handed to 22K

- Godot resource classes;
- runtime graph evaluator;
- editor plugin architecture;
- curve compression;
- worker-thread baking;
- hot reload;
- multiplayer replication implementation;
- automated testing;
- content-pack export.

## 54.3 Deferred Forge Modules

The following remain future systems after the core Forge works:

- full Audio Forge;
- full VFX and Particle Forge;
- advanced cinematic editor;
- realistic lip-sync production;
- motion-capture ingestion pipeline;
- complex cloth simulation authoring.

Named sound and effect hooks remain in the data model so these modules can attach later without redesigning animation assets.

# 55. Balancing and Production Rules

1. Readability outranks animation quantity.
2. Reuse body-family libraries before creating bespoke clips.
3. Preserve voxel silhouette in common and extreme poses.
4. Use procedural motion to solve variability, not to avoid authoring all character.
5. Keep gameplay authority outside animation assets.
6. Every combat action requires reviewed anticipation and recovery.
7. Every work action requires clear interaction targets and event ownership.
8. Every procedural profile requires a deterministic seed or reproducible parameter set where persistence matters.
9. Every approved entity needs a valid reduced animation profile.
10. Every icon or portrait should come from an approved pose or state.
11. Every override must preserve dependencies or include migration notes.
12. No full audio or VFX production scope is added to this set.

# 56. Open Questions for Later Documents

The following are intentionally deferred rather than unresolved within 22F:

- exact combat-frame values and cancel windows;
- final player movement speeds;
- final NPC schedule timing;
- exact boss phase behaviours;
- final networking frequency and prediction model;
- final performance budgets by hardware tier;
- future Audio Forge event schema details;
- future VFX Forge particle and trail authoring;
- cinematic sequencing and camera language;
- motion-capture import support.

These questions should be answered in combat, technical implementation, production balancing or future Forge-module documents without changing the locked voxel-first animation identity.

# Appendix A. Animation Definition Template

```text
AnimationProfile
- id
- display_name
- body_family_id
- rig_profile_id
- locomotion_graph_id
- action_graph_ids
- pose_library_ids
- clip_family_ids
- procedural_profile_ids
- visual_state_profile_id
- retarget_profile_ids
- lod_profile_id
- capture_profile_ids
- dependencies
- version
- lifecycle_state

AnimationClip
- id
- semantic_action
- source_rig_id
- duration
- loop_mode
- root_motion_mode
- transform_tracks
- voxel_frame_tracks
- material_tracks
- visibility_tracks
- event_markers
- blend_rules
- interrupt_rules
- body_mask
- equipment_profiles
- bake_settings
```

# Appendix B. Semantic Clip Naming Register

| Pattern | Example |
| --- | --- |
| anim.{family}.locomotion.{action}.{variant} | anim.humanoid.locomotion.walk.forward |
| anim.{family}.combat.{weapon}.{action} | anim.humanoid.combat.sword.light_01 |
| anim.{family}.work.{job}.{action} | anim.humanoid.work.builder.hammer |
| anim.{family}.social.{action} | anim.humanoid.social.wave |
| anim.{family}.reaction.{action} | anim.pig.reaction.startled |
| anim.{family}.flight.{action} | anim.bird.flight.takeoff_ground |
| anim.{family}.boss.{phase}.{action} | anim.dragon.boss.phase_2.breath_charge |
| pose.{family}.{group}.{name} | pose.dragon.combat.breath_ready |
| graph.{family}.{system} | graph.spider.locomotion |
| state.entity.{category}.{name} | state.entity.status.corrupted |

# Appendix C. Animation Event Register

| Event ID | Class | Typical Owner |
| --- | --- | --- |
| foot_contact.left/right | Contact | Footstep presentation and movement diagnostics. |
| hand_contact.main/off | Contact | Interaction alignment. |
| tool_contact | Contact | Job or resource system validates progress. |
| melee_active.open/close | Window | Combat system. |
| combo_window.open/close | Window | Combat system. |
| projectile_release | Release | Ranged combat system. |
| breath_release | Release | Creature ability system. |
| item_pickup | State/Request | Inventory or interaction system. |
| item_place | State/Request | Inventory, construction or storage system. |
| interaction_complete | State | Interaction owner. |
| takeoff_commit | State | Movement system. |
| landing_contact | Contact | Movement and presentation. |
| mount_seated | State | Mount system. |
| rider_release | State | Mount system. |
| phase_change.commit | State | Boss system. |
| sound.* | Future Hook | Future Audio Forge only. |
| effect.* | Future Hook | Future VFX Forge only. |

# Appendix D. Minimum Animation Sets by Body Family

| Body Family | Minimum Set |
| --- | --- |
| Humanoid | Idle, walk, run, turn, jump, land, interact, hit, death. |
| Four-Arm Humanoid | Humanoid set plus additional-arm idle and action layer. |
| Compact Quadruped | Idle, walk, trot, run/flee, turn, lie, rise, hit, death. |
| Spider | Idle, gait, turn, attack, hit, death, optional climb. |
| Hexapod | Idle, tripod gait, turn, attack, hit, death. |
| Segmented Crawler | Idle wave, move, turn, attack, hit, death, reduced LOD. |
| Serpent | Coil, slither, turn, strike, hit, death. |
| Bird | Ground idle, hop/walk, take-off, flap, glide, bank, land, perch. |
| Bat | Hang, release, flap, bank, land/hang, attack, hit, death. |
| Wyvern | Ground idle, walk, take-off, fly, land, bite, wing/tail attack, hit, death. |
| Dragon | Heavy ground set, full flight set, major attacks, phase, damage, defeat. |
| Aquatic | Idle swim, move, turn, accelerate, attack, hit, death. |
| Floating Entity | Hover, drift, turn, dash, attack, hit, collapse. |
| Golem | Powered idle, walk, turn, work/attack, damaged, unpowered, break. |

# Appendix E. Runtime Visual-State Priority Matrix

| Priority | State Type | Example |
| --- | --- | --- |
| 100 | Death/Removal | dead, disintegrated. |
| 90 | Incapacitation | stunned, frozen-solid, restrained. |
| 80 | Boss Phase/Break | phase_2, broken_wing. |
| 70 | Current Action | attack, cast, mount, interaction. |
| 60 | Locomotion Safety | fall, land, swim, climb. |
| 50 | Major Status | burning, corrupted, empowered. |
| 40 | Physical Condition | injured, exhausted, frightened. |
| 30 | Equipment/Carry | sword stance, cargo, shield. |
| 20 | Environment | wet, muddy, snow-covered. |
| 10 | Expression/Cosmetic | blink, idle gesture, local variation. |

Compatible states may stack across priorities. Incompatible states use the higher-priority result or an explicit composite profile.

# Appendix F. Performance Guidance

| Entity Tier | Suggested Animation Approach |
| --- | --- |
| Ambient Small | Simple loop, sparse events, no continuous IK except very near. |
| Standard NPC | Shared family graph, limited foot IK, reduced face updates at distance. |
| Standard Creature | Family clips, relevant terrain solver, limited secondary motion. |
| Mount/Elite | Full local clips, rider or equipment alignment, stronger solver budget. |
| Boss | Detailed LOD 0, authored LOD reductions, preserved attack anchors. |
| Swarm/Horde | Shared clips, phase offsets, staggered updates, grouped procedural motion. |
| Segmented Giant | Head/core full update, grouped segments and representative contacts. |
| Distant Village | Reduced loops or no rendered actors; simulation remains abstract. |

All budgets are first-pass guidance and require packaged-build profiling.

# Appendix G. Validation Checklist

- [ ] Voxel source remains linked and editable.
- [ ] Compatible rig and reference pose are declared.
- [ ] Stable animation, graph, pose and state IDs are valid.
- [ ] Required clip family is complete for lifecycle target.
- [ ] Locomotion transitions have safe fallbacks.
- [ ] Root-motion use is explicitly authorised.
- [ ] Feet or contacts do not visibly slide in standard preview.
- [ ] Equipment and clothing clear common poses.
- [ ] Additional limbs use explicit masks and priorities.
- [ ] Procedural gait profiles are reproducible.
- [ ] IK failure blends safely to authored motion.
- [ ] Combat anticipation, active/release and recovery are readable.
- [ ] Gameplay-authoritative events are unique and correctly classified.
- [ ] Events do not double-fire across loops, blends or LOD changes.
- [ ] Damage and breakable-part states remap correctly.
- [ ] Status layers have priority and compatibility rules.
- [ ] Colour-only communication has an additional readable cue where needed.
- [ ] Retarget compatibility is declared honestly.
- [ ] LOD transitions preserve required sockets and events.
- [ ] Icon or portrait capture profile is approved where required.
- [ ] Dependency and override chains are valid.
- [ ] Runtime products rebuild from source.
- [ ] Audio/VFX references remain hooks only.

# Appendix H. Proof-of-Concept Checklist

- [ ] Standard humanoid locomotion set created.
- [ ] Humanoid sword or tool action created.
- [ ] Four-arm layered action created.
- [ ] Pig animation set created.
- [ ] Spider gait and attack created.
- [ ] Giant-centipede wave and LOD created.
- [ ] Bird take-off, flight, landing and perch created.
- [ ] Dragon ground, flight and combat set created.
- [ ] NPC builder interaction loop created.
- [ ] Mount and rider loop created.
- [ ] Terrain and IK laboratory tests pass.
- [ ] Combat events are classified and de-duplicated.
- [ ] Status layering demonstrates wet, frozen, corrupted and damaged states.
- [ ] At least two animation LOD levels work.
- [ ] Approved pose can generate an icon or portrait.
- [ ] Overrides and revision comparison work.
- [ ] Runtime bake is reproducible.
- [ ] All POC assets reach Functional or higher lifecycle state.

# Appendix I. Glossary

| Term | Definition |
| --- | --- |
| Action Graph | State graph controlling attacks, work, interactions or other actions. |
| Additive Animation | Motion layered as offsets over a base pose. |
| Animation Event | Named timeline marker consumed by presentation or gameplay systems. |
| Animation LOD | Reduced update, solver or clip complexity used for performance. |
| Anticipation | Visible preparation before an action becomes dangerous or committed. |
| Body Mask | Semantic body regions controlled by an animation layer. |
| Clip | Authored timed animation data. |
| Contact | Moment or target where a foot, hand, tool or body part meets something. |
| Gait | Ordered pattern of limb contacts during locomotion. |
| In-Place Animation | Clip that does not authoritatively move the entity root. |
| Locomotion Graph | State graph selecting movement clips and transitions. |
| Motion Warping | Bounded adaptation of an action to an approved target transform. |
| Pose Library | Reusable collection of named static poses. |
| Procedural Layer | Runtime solver that adjusts authored motion from current inputs. |
| Recovery | Phase after an action before normal control fully returns. |
| Retargeting | Applying animation to a compatible rig through semantic mapping. |
| Root Motion | Movement encoded in the animation root and authorised by gameplay. |
| Runtime Visual State | Layered presentation of condition, environment, magic or phase. |
| Semantic Action | Stable functional meaning of a clip, independent of display name. |
| State Graph | Nodes and transitions controlling animation selection. |
| Voxel-Frame Animation | Timed replacement or alteration of voxel geometry or baked voxel states. |
| Voxel Source of Truth | Editable voxel data from which animated runtime products are generated. |

---

**End of Document 22F - Entity Animation, Locomotion, Combat and Visual States - Version 0.1**
