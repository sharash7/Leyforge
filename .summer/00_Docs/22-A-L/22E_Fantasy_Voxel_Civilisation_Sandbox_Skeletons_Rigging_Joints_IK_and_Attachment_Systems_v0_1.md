# Fantasy Voxel Civilisation Sandbox
## 22E - Skeletons, Rigging, Joints, IK and Attachment Systems
### Voxel Entity Rigs, Procedural Support, Retargeting, Runtime Contracts and Forge Workflow
**Version 0.1 - Detailed Design Bible Draft**

A voxel-first rigging foundation for humanoids, animals, multi-legged creatures, segmented crawlers, birds, dragons, constructs, mounts and bosses inside the Leyforge Forge.

## Skeletons, Rigging, Joints, IK and Attachment Systems Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines skeleton families, rig graphs, joint types, pivots, constraints, voxel-part binding, constrained voxel skinning, inverse kinematics, procedural targets, attachment sockets, equipment anchors, mount seats, retargeting, damage-region integration, rig LOD, validation and proof-of-concept rigs. |
| Core Philosophy | A rig should preserve the clarity and authored character of a voxel model while making movement reusable, terrain-aware and scalable. Rig complexity must follow the body plan rather than forcing every entity into a humanoid skeleton. |
| Voxel Direction | Every visible body part remains sourced from editable voxels. Bones, pivots, constraints and solvers move voxel-authored parts or baked derivatives; rigging must never become a path for replacing the source with unrelated smooth-mesh geometry. |
| Binding Direction | Use rigid named-part binding by default for machines, armour plates, blocky constructs and deliberately segmented creatures. Use constrained per-voxel or per-region skeletal weights where organic bending is needed, while preserving crisp voxel silhouettes and avoiding rubber-like deformation. |
| Rig-Family Direction | Provide reusable families for standard humanoids, additional-arm humanoids, quadrupeds, avians, bats, spiders, hexapods, segmented crawlers, serpents, wyverns, dragons, aquatic bodies, floating entities and constructs. Custom rigs remain supported. |
| Joint Direction | Joints use explicit local axes, pivots, limits and semantic roles. Supported patterns include fixed, hinge, ball, twist, slider, planar, chain, spring-follow and compound joints. |
| IK Direction | IK is layered and optional. It supports feet, hands, multi-legged terrain placement, climbing, perching, mounting, head tracking, weapon alignment and creature grounding without replacing authored animation. |
| Procedural Direction | Procedural solvers use stored profiles, deterministic parameters and declared fallbacks. They add terrain response, gait assistance and secondary motion but must remain reproducible and testable. |
| Retargeting Direction | Animation sharing is based on semantic rig roles and compatibility profiles rather than bone names alone. Exact, family-compatible, semantic-retargeted, bridged and incompatible levels are explicitly tracked. |
| Attachment Direction | Equipment, armour, tools, riders, saddles, cargo, effects, interactions, cameras and gameplay markers use named sockets or attachment regions with stable IDs and preview rules. |
| Gameplay Boundary | The Forge supplies rig transforms, contact points, markers and animation-facing events. Gameplay systems retain authority over attacks, damage, AI decisions, navigation, mounting permissions, item ownership and state changes. |
| Damage Direction | Breakable, severable or disabled body regions may have rig-linked presentation states, detached-piece rules and fallback poses, while combat code decides when those states occur. |
| Performance Direction | Rig budgets scale by entity importance and distance. Bone reduction, solver throttling, procedural simplification and animation update LOD must be built into the definition rather than added after content production. |
| Override Direction | Developers may override skeleton templates, joint settings, bindings, sockets, IK profiles and retarget maps while preserving stable entity and presentation IDs unless an explicit migration is approved. |
| Validation Direction | Hard-fail invalid hierarchy cycles, missing required roles, broken parent references, impossible attachment chains and corrupt IDs. Warn on poor pivots, extreme limits, expensive solvers, weak silhouette deformation and likely terrain failures. |
| Audio/VFX Boundary | Rigs may expose named sockets and animation-event attachment references for future audio and VFX systems, but full sound and particle creation remain deferred. |
| Implementation Context | Godot with Summer Engine is the current implementation target. This document locks data and authoring contracts; concrete classes, importers, runtime services and editor implementation are expanded in 22K. |
| POC Direction | Prove a standard humanoid, four-armed humanoid, pig, spider, giant centipede, bird and dragon rig, including equipment sockets, foot or limb IK, semantic retargeting, one mount seat, one breakable region and at least two rig LOD levels. |

## Document Purpose

This document defines how voxel entities created through the Leyforge Forge become movable, reusable and gameplay-ready without losing their voxel identity. Documents 22B, 22C and 22D establish anatomy, humanoid construction and creature construction. Document 22E converts those authored body parts into rig graphs containing pivots, joints, constraints, semantic roles, attachment points and procedural targets.

The rigging system must support both simple and unusual bodies. A villager should inherit a dependable humanoid rig and use shared animations. A pig should use a straightforward quadruped rig. A spider should place eight feet without requiring hundreds of hand-authored terrain variants. A giant centipede should use repeated segment logic rather than a completely unique solver for every leg. A dragon should combine a jaw, neck chain, four legs, two wings and a long tail while still remaining practical at gameplay distances.

The system is voxel-first, not merely voxel-styled. Source geometry remains editable voxel data. Runtime meshes may be merged and weighted to a skeleton, but the rig is an animation and attachment framework around that voxel source. The Forge must preserve visible voxel density, crisp part boundaries and deliberate stepped forms even when joints bend or procedural solvers adjust poses.

This document also protects the separation between presentation and gameplay authority. A hand socket can hold a sword; it does not decide whether the NPC owns that sword. A mouth socket can identify where a dragon breath begins; it does not apply damage. A rider seat can define placement; it does not decide who is permitted to mount. These contracts allow content to be edited safely without making visual assets responsible for game rules.

This document does not define the final animation clip library, locomotion state machines, combat timing, gesture library, social animation set or boss animation direction. Those are expanded in 22F. It also does not define complete combat hitbox rules, AI sensing or simulation ownership, which are expanded in 22H and 22K.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Documents 21A-21G define the original Voxel Asset Forge. Documents 22A-22D expand it into a voxel-only Entity Forge and Blueprint Forge. This document establishes the shared rigging layer used by player characters, NPCs, creatures, monsters, mounts and bosses.

## Design Sources

| Source Document | Relevant Direction | How 22E Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Characters and creatures may be more detailed than terrain but must remain stylised, readable and compatible with the voxel world. | Locks voxel-preserving deformation, clear silhouettes and body-plan-specific movement foundations. |
| 03 - Blocks Registry | Functional objects use orientation, states, damage and attachment-like interaction points. | Reuses stable pivot, facing and socket conventions across entities and animated voxel objects. |
| 04 - Items Registry | Equipment, tools and carried objects use stable item IDs and presentation forms. | Defines hand, back, belt, armour, saddle and cargo attachment contracts without moving item ownership into the rig. |
| 07 - NPC Village System | Named NPCs work, carry items, build, fight, flee and interact with structures. | Requires reusable humanoid rigs, tool alignment, work-target IK and dependable attachment sockets. |
| 08 - Automation System | Machines use visible moving parts, ports and state presentation. | Shares named-part and pivot principles while keeping machine rigs lighter than entity skeletons. |
| 10 - Creatures and Monsters | Animals, multi-legged creatures, magical beings, mounts and bosses need distinct silhouettes and movement roles. | Requires body-plan-specific skeleton families, procedural limb support and boss-region rigging. |
| 12 - Structures | Buildings contain interaction markers, navigation, work sites and mount or creature clearances. | Requires rig test environments and stable interaction anchors that align entities with world blueprints. |
| 16 - Combat, Gear and Defence | Combat needs weapon origins, damage regions, weak points, armour and readable attacks. | Provides rig-linked anchors, regions and breakable presentation contracts while leaving damage authority external. |
| 21B - Voxel Modelling, Texturing and Material Authoring | Editable voxel source is baked into efficient runtime products. | Defines how voxel volumes or named parts bind to rig outputs without losing source data. |
| 21C - Animation, Effects and Runtime Visual States | Named parts, transforms, state bindings, events and sockets drive presentation. | Extends those concepts from machines into entity skeletons and procedural attachment systems. |
| 21D - Asset Overrides, Variants and Registry Integration | Stable IDs, field-level overrides and migrations protect content. | Governs rig-template inheritance, retarget maps, socket overrides and dependency-safe revisions. |
| 21E - Forge UI/UX and Creator Workflow | Forge workspaces use previews, validation, comparisons and approval gates. | Establishes shared interaction patterns for the Rig Builder, Joint Inspector and IK preview tools. |
| 21F - Forge Technical Implementation Plan | Source and baked assets are separate, validated and hot-reloadable. | Requires editable rig sources and deterministic runtime rig products. |
| 22A - Forge Entity and Blueprint Expansion | The expanded Forge includes body plans, procedural locomotion, manifests, dependencies, testing and packaging. | Supplies governance and project-wide capability requirements. |
| 22B - Entity Model Taxonomy, Anatomy and Body Architecture | Body-plan graphs define anatomy nodes, joint anchors, contact roles and rig compatibility. | Converts anatomy definitions into skeletons, constraints, IK chains and attachment contracts. |
| 22C - Humanoid Player Character and NPC Creator | Humanoid bodies use modular parts, equipment, expressions and persistent variation. | Defines humanoid rig families, extra-arm extensions, equipment sockets and player/NPC compatibility. |
| 22D - Creature, Mob, Monster and Boss Model Creator | Creature models include quadrupeds, spiders, segmented crawlers, birds, dragons, constructs and bosses. | Defines the specialised skeleton and solver families needed by non-humanoid entities. |

## Static Table of Contents

- 1. Locked Rigging System Identity
- 2. Locked Direction Summary
- 3. Scope, Users and System Boundaries
- 4. Rigging Terminology and Layered Architecture
- 5. Voxel Geometry and Rig Relationship
- 6. Anatomy Graph to Rig Graph Conversion
- 7. Coordinate Systems, Axes, Pivots and Orientation
- 8. Bone, Part and Role Naming
- 9. Rig Families and Template Library
- 10. Standard Humanoid Rigs
- 11. Additional-Arm and Altered Humanoid Rigs
- 12. Quadruped Rigs
- 13. Arthropod and Multi-Legged Rigs
- 14. Segmented Crawler and Serpentine Rigs
- 15. Avian, Bat and Flying-Creature Rigs
- 16. Wyvern, Dragon and Great-Beast Rigs
- 17. Aquatic, Amorphous, Floating and Construct Rigs
- 18. Joint Types, Constraints and Limits
- 19. Rigid-Part Binding and Voxel Skin Weights
- 20. Root Motion, Grounding and Scale
- 21. Inverse-Kinematics Architecture
- 22. Humanoid Hand and Foot IK
- 23. Quadruped Terrain IK
- 24. Spider, Hexapod and Centipede Limb Solvers
- 25. Head Look, Eye Aim and Target Tracking
- 26. Wings, Flight Surfaces, Perching and Landing
- 27. Neck, Tail, Tentacle and Secondary Chains
- 28. Attachment Sockets and Equipment Anchors
- 29. Armour, Clothing, Saddles, Riders and Cargo
- 30. Interaction, Combat and Gameplay Marker Anchors
- 31. Animation Retargeting and Compatibility
- 32. Modular Bodies, Variants and Additional Limbs
- 33. Procedural Motion, Seeds and Determinism
- 34. Physics-Assisted Secondary Motion
- 35. Damage, Breakable Parts, Severing and Phase Rigs
- 36. Rig LOD, Update Budgets and Performance
- 37. Editable Source and Baked Runtime Products
- 38. Forge Rig-Authoring Workflow and UI
- 39. Pose Library, Retarget Preview and Test Laboratory
- 40. Overrides, Dependencies, Versioning and Migration
- 41. Validation Rules, Errors and Warnings
- 42. Proof-of-Concept Scope and Acceptance Criteria
- 43. Relationships With Documents 22F-22L
- Appendix A. Semantic Rig Role Register
- Appendix B. Joint and Constraint Register
- Appendix C. Rig Template Register
- Appendix D. Socket and Attachment Register
- Appendix E. IK and Procedural Solver Profiles
- Appendix F. Rig Performance Guidance
- Appendix G. Rig Validation Checklist
- Appendix H. Proof-of-Concept Rig Checklist
- Appendix I. Glossary

# 1. Locked Rigging System Identity

The Skeletons, Rigging, Joints, IK and Attachment Systems layer is the movement and connection foundation for every Forge-authored entity. It translates a body plan into a hierarchy of controllable transforms and semantic roles without changing what the entity is made from. The visible model remains voxel-authored; the rig supplies structure, motion, grounding and stable connections to other systems.

> **Locked Rule**  
> Every approved entity rig must declare its body-plan family, semantic roles, hierarchy, pivots, joint limits, binding method, required sockets, solver profile, compatibility level and runtime LOD behaviour.

## 1.1 Rigging Promise

A developer opening an entity rig should be able to answer:

- Which rig family or custom template does the entity use?
- Which anatomy nodes correspond to bones, rigid parts or procedural chains?
- Which joints can rotate, slide or remain fixed?
- Where are local forward, up and right axes defined?
- Which parts use rigid transforms and which use constrained voxel skinning?
- Which feet, hands, claws, wing tips or segment contacts use IK?
- Which sockets hold equipment, riders, cargo, effects or interaction targets?
- Which animation families can be retargeted safely?
- Which bones or solvers are removed, simplified or throttled at each LOD?
- Which dependencies will be affected by changing the rig?

## 1.2 Rigging Design Pillars

| Pillar | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel Integrity | Rigs move voxel-authored geometry and preserve deliberate stepped forms. | Characters and creatures remain visually consistent with Leyforge. |
| Semantic Structure | Bones and parts declare roles, not only arbitrary names. | Animations, equipment and gameplay markers can be shared reliably. |
| Body-Plan Fit | Rig architecture follows anatomy and limb count. | Pigs, spiders, centipedes, birds and dragons move distinctly. |
| Author First | Authored poses and clips remain the primary artistic direction. | Procedural systems assist rather than erase personality. |
| Terrain Awareness | IK and contact solvers respond to uneven voxel terrain. | Feet, claws and hands connect convincingly to the world. |
| Reuse With Limits | Compatible families share animation without forcing unsafe retargeting. | Content production scales without producing broken motion. |
| Stable Attachments | Equipment and interactions use durable named anchors. | Items stay aligned across characters, variants and animations. |
| Scalable Runtime | Rig complexity decreases predictably with distance and importance. | Villages, raids and ecosystems remain performant. |

## 1.3 What This System Is Not

- It is not a smooth-character pipeline that hides non-voxel source models inside the Forge.
- It is not a requirement that every visible voxel be independently animated.
- It is not a universal skeleton that every body plan must imitate.
- It is not an animation clip library; that belongs primarily to 22F.
- It is not an AI locomotion controller or navigation system.
- It is not a physics-ragdoll requirement for every entity.
- It is not permission for procedural solvers to produce unstable or non-deterministic multiplayer results.
- It is not a replacement for visual review and authored silhouette testing.

# 2. Locked Direction Summary

| Area | Locked Decision |
| --- | --- |
| Source of Truth | Editable voxel model plus editable rig definition. Runtime skeletons, meshes and constraints are generated products. |
| Default Binding | Rigid named-part binding for clearly segmented pieces; constrained voxel skinning for necessary organic bends. |
| Skinning Style | Prefer hard or stepped weights and small influence counts. Avoid broad soft gradients that make voxel limbs appear rubbery. |
| Hierarchy | Single rooted acyclic hierarchy, with optional solver graphs and virtual helper nodes kept separate from gameplay identity. |
| Role IDs | Every important transform uses a stable semantic role such as `root`, `pelvis`, `hand_left`, `wing_root_right` or `segment_12`. |
| Joint Limits | Explicit limits are required for production rigs unless a joint is intentionally unrestricted. |
| IK | Optional per chain, layered after authored animation and blended by state, surface confidence and LOD. |
| Retargeting | Based on role maps, rest-pose compatibility, scale rules and declared exceptions. |
| Root Motion | Supported, but in-place movement remains available. Gameplay movement authority chooses how motion is applied. |
| Attachments | Stable sockets inherit transforms from bones or rigid parts and support offsets, orientation profiles and occupancy rules. |
| Additional Limbs | Extension roles allow extra arms, wings, tails and limb banks without corrupting the base family. |
| Segments | Long repeated bodies use generated role ranges and grouped solver profiles rather than hundreds of individually handcrafted rules. |
| Damage | Regions can disable, hide, detach or replace rigged parts, but gameplay state remains authoritative. |
| LOD | Bone count, solver count, update frequency and procedural detail reduce by authored profiles. |
| Determinism | Stored seeds, parameters and fixed fallbacks are required for procedural generation and network-relevant pose decisions. |
| Validation | Cycles, missing parents, duplicate role IDs and invalid required sockets are hard failures. Extreme cost, unusual limits and readability concerns are warnings. |

# 3. Scope, Users and System Boundaries

## 3.1 Primary Users

The rigging workspace is initially developer-facing and supports:

- Voxel character and creature artists.
- Technical animators.
- Gameplay designers defining equipment and interaction anchors.
- Combat designers defining attack and weak-point origins.
- AI designers confirming contact and look-target roles.
- Blueprint and village designers testing work positions and mount clearance.
- Summer Engine or approved agents generating first-pass rigs for review.
- QA reviewers validating motion, attachments, terrain fit and LOD.

## 3.2 In-Scope Outputs

- Skeleton and rigid-part hierarchies.
- Rest poses and orientation profiles.
- Joint types, limits and constraints.
- Voxel-to-rig bindings.
- IK chain definitions and solver settings.
- Procedural-contact and gait-support profiles.
- Semantic retarget maps.
- Equipment, mount and interaction sockets.
- Damage-region and detachable-part rig links.
- Rig LOD profiles.
- Pose presets and validation scenes.
- Editable rig source plus baked runtime products.

## 3.3 Out-of-Scope Ownership

| Concern | Owning System |
| --- | --- |
| Animation clips, blend trees and locomotion states | 22F - Entity Animation, Locomotion, Combat and Visual States |
| Combat damage, hit confirmation and statistics | 16 Combat and 22H Gameplay Integration |
| AI path selection, target choice and navigation | Creature/NPC AI systems and 22H |
| Item ownership and equipment rules | Items, inventory and equipment systems |
| Mount permission, taming and rider control | Creature, interaction and gameplay systems |
| Full ragdoll, advanced cloth and destruction simulation | Later technical and polish work unless explicitly scoped |
| Sound or particle authoring | Future Audio Forge and VFX/Particle Forge modules |

# 4. Rigging Terminology and Layered Architecture

## 4.1 Core Terms

| Term | Meaning |
| --- | --- |
| Anatomy Node | Body-plan element such as torso, jaw, leg, wing or repeated segment. |
| Rig Node | Transform in the control hierarchy. It may become a bone, rigid part, helper or virtual target. |
| Bone | Skeleton transform used to drive bound geometry or child attachments. |
| Rigid Part | Named voxel assembly moved as a solid unit around a pivot. |
| Joint | Relationship and allowed motion between a child rig node and its parent. |
| Constraint | Rule limiting rotation, translation, scale or relationship to another target. |
| Socket | Stable attachment transform for equipment, riders, effects, cameras or interaction. |
| Contact | Point or small region expected to meet terrain or another object. |
| IK Chain | Ordered transforms solved from an end target back toward a root. |
| Solver Profile | Reusable settings describing how IK or procedural motion behaves. |
| Retarget Map | Semantic relationship between source and target rig roles. |
| Rest Pose | Authoritative neutral transform state used for binding and retargeting. |
| Rig LOD | Reduced hierarchy or update profile used at distance or lower importance. |

## 4.2 Layered Rig Architecture

```text
Body-Plan Definition
    ↓
Voxel Model Parts and Anatomy Roles
    ↓
Editable Rig Source
    ├── Hierarchy
    ├── Rest pose
    ├── Joints and limits
    ├── Bindings
    ├── Sockets
    ├── IK and procedural profiles
    └── Retarget metadata
    ↓
Validated Rig Product
    ↓
Runtime Skeleton / Part Graph
    ├── Animation input
    ├── IK and procedural adjustment
    ├── Attachment transforms
    ├── Damage presentation
    └── LOD selection
```

The editable rig source is the production record. Runtime nodes are replaceable generated outputs and must be rebuildable after changes to the body model, baker or engine version.

# 5. Voxel Geometry and Rig Relationship

## 5.1 Voxel-First Rule

Rigging does not change the source-geometry rule established by the Forge. A humanoid arm, spider leg or dragon wing begins as voxels. The rig may move a baked mesh created from those voxels, but the developer can always reopen the asset and edit the voxel source.

Allowed inputs include:

- Named voxel volumes.
- Voxel layers converted into parts.
- Voxel-generated primitives.
- Repeated voxel modules.
- Non-destructive modifiers that output voxels.
- Approved Forge assets attached as modular voxel parts.

## 5.2 Geometry Binding Modes

| Binding Mode | Best Use | Rule |
| --- | --- | --- |
| Rigid Part | Armour plates, jaws, machine-like limbs, spider leg segments, blocky golems. | Every vertex belongs fully to one transform. |
| Hard Voxel Skin | Humanoid limbs, animal shoulders, necks with limited bends. | Each voxel or generated vertex group uses one primary bone and optional narrow transition. |
| Stepped Multi-Bone Skin | Organic bends requiring continuity. | Influence changes occur in deliberate voxel bands rather than broad smooth gradients. |
| Segment Chain | Tails, necks, serpents and centipedes. | Repeated modules bind to segment roles with controlled overlap. |
| Frame/Part Replacement | Mouth shapes, damage states, phase transformations. | A rigged part may be swapped without altering the rest of the skeleton. |

## 5.3 Voxel Deformation Boundaries

The Forge should preview bends at several angles and flag:

- Cubes visibly stretched into long wedges.
- Gaps opening between adjacent voxel parts.
- Overlapping surfaces that become distracting.
- Texture density changes at joints.
- Rounded deformation inconsistent with the rest of the art style.
- Silhouettes that collapse at normal gameplay distance.

Local corrective parts, stepped weight bands or rigid-segment approaches are preferred over unrestricted soft deformation.

# 6. Anatomy Graph to Rig Graph Conversion

## 6.1 Conversion Rules

Each anatomy node from 22B declares whether it becomes:

- A primary rig node.
- A rigid visual child.
- A deforming chain.
- A socket-only marker.
- A damage region without its own transform.
- A repeated generated element.
- A procedural contact target.
- A non-animated decorative part.

The conversion tool should suggest a first-pass rig but never silently discard anatomy roles.

## 6.2 Required Mapping Fields

| Field | Purpose |
| --- | --- |
| anatomy_role_id | Stable body-plan role. |
| rig_role_id | Stable movement role. |
| parent_role_id | Parent in the rig hierarchy. |
| node_type | Bone, rigid part, helper, target, socket or virtual node. |
| pivot_source | Authored anchor, calculated centre, surface contact or inherited pivot. |
| joint_profile | Joint and limit template. |
| binding_profile | Rigid, hard skin, stepped skin or segment binding. |
| symmetry_group | Mirrored or radial relationship. |
| required_for_family | Whether family compatibility depends on this role. |
| lod_group | Reduction behaviour. |

## 6.3 Generated and Manual Rigs

The Forge may generate a first pass from anatomy, but production approval requires review of:

- Root position.
- Pelvis or body centre.
- Limb axes.
- Joint bends.
- Contact points.
- Attachment clearance.
- Rest pose.
- Retarget role assignment.
- LOD group assignment.

# 7. Coordinate Systems, Axes, Pivots and Orientation

## 7.1 Entity Orientation Standard

Every rig definition declares:

- Forward axis.
- Up axis.
- Right axis.
- Ground plane.
- Scale unit.
- Model origin.
- Root-motion reference.

The Forge displays these axes permanently in Rig Mode and warns when imported or duplicated parts use inconsistent local orientation.

## 7.2 Pivot Rules

A pivot should represent the physical joint or intended motion centre:

- Shoulder at arm connection.
- Elbow at the visible bend.
- Jaw at the hinge.
- Wing at the wing root.
- Spider leg joints at segment connections.
- Gear at its axle.
- Tail segment at the centre of its connection ring.

Automatic centres may be offered as suggestions, but production pivots remain explicitly authored.

## 7.3 Rest-Pose Standards

Rig families use declared rest poses:

- Humanoid neutral A-like voxel pose by default, avoiding excessive shoulder strain.
- Quadruped standing pose with neutral spine.
- Bird grounded neutral pose plus wing-rest pose.
- Dragon grounded neutral pose plus optional flight-reference pose.
- Spider and hexapod neutral contact spread.
- Serpent straight or gently curved reference line.

A family may store multiple reference poses, but one remains authoritative for binding and retargeting.

# 8. Bone, Part and Role Naming

## 8.1 Semantic Role IDs

Names should describe function and side consistently:

```text
root
body_main
pelvis
spine_01
spine_02
neck_01
head
jaw
clavicle_left
upper_arm_left
lower_arm_left
hand_left
upper_leg_left
lower_leg_left
foot_left
wing_root_right
wing_mid_right
wing_tip_right
tail_01
segment_12
```

Display labels may be friendly, but internal role IDs remain stable and namespace-safe.

## 8.2 Side and Sequence Rules

- Use `_left`, `_right`, `_centre` or declared radial indexes.
- Use zero-padded sequence numbers for generated chains where ordering matters.
- Do not encode temporary visual descriptions into stable IDs.
- Renaming a role requires dependency analysis and migration.
- Mirrored roles declare a symmetry partner rather than relying only on text matching.

## 8.3 Helper and Virtual Nodes

Helper roles use clear prefixes or categories:

- IK targets.
- Pole vectors.
- Aim targets.
- Twist helpers.
- Contact probes.
- Camera anchors.
- Solver-only virtual nodes.

They must not be mistaken for persistent anatomy or gameplay damage regions.

# 9. Rig Families and Template Library

## 9.1 Required Template Families

| Rig Family | Typical Users | Key Features |
| --- | --- | --- |
| Humanoid Standard | Player, villagers, humanoid enemies. | Pelvis, spine, head, two arms, two legs, hand and foot sockets. |
| Humanoid Extra Arms | Four-armed peoples, bosses. | Additional shoulder bank and arm-pair roles. |
| Quadruped Standard | Pig, sheep, wolf, horse. | Body/spine, neck, head, four limb chains, tail. |
| Heavy Quadruped | Bear, boar boss, siege beast. | Stronger spine and shoulder roles, heavy contact profile. |
| Avian | Birds, griffin-like bodies. | Two legs, wing chains, tail-feather roles, perch contacts. |
| Bat | Bats and membrane-winged creatures. | Finger-like wing chain and folded-wing rest. |
| Spider | Eight-legged arthropods. | Thorax/abdomen, eight limb chains, fang and spinner sockets. |
| Hexapod | Insects and six-legged monsters. | Three limb pairs and tripod-gait groups. |
| Segmented Crawler | Centipedes and millipedes. | Generated segment chain with repeated leg banks. |
| Serpent | Snakes, worms, bone serpents. | Long spine chain, head, optional fins or small limbs. |
| Wyvern | Two-legged dragons. | Hind legs, wing-arms, neck, jaw and tail. |
| Dragon | Four-legged dragons. | Four legs, separate wings, long neck and tail, boss-region support. |
| Aquatic | Fish and aquatic monsters. | Body spine, fins, tail propulsion, optional jaw/tentacles. |
| Floating | Wisps, floating eyes, magical constructs. | Root, orbiting parts, aim and hover roles. |
| Construct | Golems and automata. | Rigid parts, mechanical joints, replaceable modules. |

## 9.2 Template Governance

Templates are versioned assets. Updating a template must report:

- Entities inheriting it.
- Animation sets using it.
- Retarget maps affected.
- Sockets added, removed or moved.
- Solver profiles changed.
- Required migrations.

An approved entity may pin a template version or inherit compatible updates according to its asset policy.

# 10. Standard Humanoid Rigs

## 10.1 Base Hierarchy

A standard humanoid rig contains:

- Root and movement reference.
- Pelvis.
- Configurable spine chain.
- Neck and head.
- Optional jaw and face-part nodes.
- Clavicles or shoulder helpers.
- Upper arm, lower arm and hand per side.
- Upper leg, lower leg, foot and optional toe per side.
- Equipment and interaction sockets.

## 10.2 Player and NPC Compatibility

Player-compatible rigs require stricter standards for:

- First-person camera anchor.
- Hand alignment.
- Tool and weapon sockets.
- Equipment fit profiles.
- Doorway and capsule alignment.
- Crouch, sit and sleep reference poses.
- Network-safe movement representation.

NPC-only variants may adjust proportions more widely but should remain within the same retarget family when possible.

## 10.3 Voxel Hands and Faces

Hands may be simple rigid blocks, articulated fingers or grouped finger parts depending on detail tier. The standard production requirement is reliable item holding, not realistic finger simulation.

Facial parts may use jaw bones, rigid eye parts, swappable voxel frames or expression groups. Detailed facial rigging is optional and must not become a requirement for every villager.

# 11. Additional-Arm and Altered Humanoid Rigs

## 11.1 Extra-Arm Banks

Additional arms use extension roles attached to declared torso anchors:

```text
shoulder_bank_upper
├── upper_arm_left
└── upper_arm_right
shoulder_bank_lower
├── extra_upper_arm_left_01
└── extra_upper_arm_right_01
```

Each arm pair declares:

- Shoulder height and orientation.
- Shared or independent clavicle behaviour.
- Retarget group.
- Hand socket profile.
- Combat and work priority.
- Collision and self-intersection warnings.

## 11.2 Altered Lower Bodies

Humanoid upper bodies may connect to:

- Digitigrade legs.
- Hooved legs.
- Serpentine lower bodies.
- Centaur bodies.
- Floating bases.
- Mechanical tracks or wheel assemblies.

These use a rig bridge between the humanoid torso family and the lower-body family. Animation compatibility becomes partial rather than assumed.

## 11.3 Retargeting Limits

A two-arm animation can be applied to the primary arm pair while secondary arms use:

- Mirrored support animation.
- Independent authored clips.
- Procedural pose rules.
- Idle or held-object poses.

The Forge must not silently duplicate primary-arm motion when it causes collisions or unclear combat silhouettes.

# 12. Quadruped Rigs

## 12.1 Standard Structure

- Root and body centre.
- Pelvis/rear body.
- Spine segments.
- Chest/front body.
- Neck and head.
- Jaw where needed.
- Front-left and front-right limb chains.
- Rear-left and rear-right limb chains.
- Tail chain.
- Optional ears, horns and saddle anchors.

## 12.2 Limb Role Differences

Front and rear legs are not treated as identical by default. They may have different:

- Joint directions.
- Foot shapes.
- Weight-bearing profiles.
- Stride timing.
- Terrain solver reach.
- Attack roles.

Pig, horse, wolf and bear templates may share the quadruped family while using different proportion and gait profiles.

## 12.3 Spine and Body Support

Quadruped terrain placement should adjust body height and limited body tilt from the four contact targets. Excessive tilt is clamped to avoid unstable motion on voxel stairs or sharp terrain edges.

# 13. Arthropod and Multi-Legged Rigs

## 13.1 Limb Banks

Spiders, insects and crustaceans use limb banks attached to a thorax or central shell. Each bank declares:

- Limb count.
- Side or radial index.
- Segment count per limb.
- Preferred contact region.
- Gait group.
- Fold direction.
- Reach limits.

## 13.2 Spider Rig

A standard spider rig includes:

- Root.
- Thorax.
- Abdomen.
- Head or fang assembly.
- Eight three- or four-part limb chains.
- Optional spinneret, web and leap sockets.
- Grounding probes and body-height solver.

## 13.3 Variable Limb Counts

The system supports four, six, eight or more legs through generated role groups. Creatures with missing or damaged limbs must be able to switch to an alternate gait profile rather than assuming all contacts remain available.

# 14. Segmented Crawler and Serpentine Rigs

## 14.1 Segment Generation

A repeated body is generated from:

- Head module.
- Body segment template.
- Segment count.
- Taper curve.
- Optional leg-pair module.
- Tail module.
- Variation seed.
- Rig-reduction groups.

Each segment receives stable generated roles derived from the source definition and count.

## 14.2 Centipede Rig

The giant centipede rig should avoid evaluating every leg with a full expensive solver at all distances. Nearby detail may use contact groups and wave timing; distant versions may animate grouped leg banks or use material/part motion approximations.

## 14.3 Serpentine Chains

Serpents use a spine or part chain with:

- Curvature limits.
- Twist limits.
- Ground-conform profile.
- Head targeting.
- Tail follow-through.
- Optional climbing or swimming profile.

Self-intersection checks should be available in preview, though not every overlap can be eliminated automatically.

# 15. Avian, Bat and Flying-Creature Rigs

## 15.1 Avian Structure

- Root and body.
- Neck and head.
- Jaw or beak parts.
- Two leg chains with perch contacts.
- Left and right wing chains.
- Tail-feather or tail-plane roles.
- Flight, perch and landing anchors.

## 15.2 Wing Types

| Wing Type | Rig Approach |
| --- | --- |
| Feathered Bird | Primary wing bones plus grouped feather parts or voxel layers. |
| Bat Membrane | Arm/finger-like chain supporting membrane voxel surfaces. |
| Insect | Rigid or lightly chained wings with high-frequency transform animation. |
| Magical Floating Wing | Rigid or orbiting parts with hover constraints. |
| Multi-Wing | Repeated wing banks with declared phase relationships. |

## 15.3 Folding and Clearance

The rest pose must define where wings fold without intersecting the body excessively. Preview tests include:

- Ground idle.
- Doorway or cave clearance where relevant.
- Take-off spread.
- Full flap extension.
- Landing fold.
- Perch balance.

# 16. Wyvern, Dragon and Great-Beast Rigs

## 16.1 Dragon Rig Components

A four-legged dragon generally contains:

- Root and body centre.
- Pelvis and chest.
- Spine chain.
- Long neck chain.
- Head, jaw, horns and eye roles.
- Four leg chains.
- Two wing chains.
- Long tail chain.
- Breath, bite, claw, wing-strike and tail-strike sockets.
- Rider or cinematic anchors where used.
- Breakable wing, horn, armour or tail-region links.

## 16.2 Wyvern Difference

A wyvern uses its forelimbs as wings. The rig family therefore maps wing-root roles to primary forelimb roles and uses different grounded-contact rules. It should not be treated as a four-legged dragon with hidden front legs.

## 16.3 Great-Beast Stability

Large creatures need:

- Wider contact confidence zones.
- Slower IK blending.
- Stronger motion clamping.
- Body-mass presentation through spine and shoulder lag.
- LOD transitions that avoid obvious popping of neck or tail chains.
- Arena and doorway validation appropriate to their scale.

# 17. Aquatic, Amorphous, Floating and Construct Rigs

## 17.1 Aquatic Rigs

Fish and aquatic creatures use body-spine chains, fins, tail propulsion roles and optional tentacles or jaws. Ground contact may be absent, replaced by swim-depth targets and bank/turn controls.

## 17.2 Amorphous Bodies

Slimes and amorphous entities may use:

- Root and squash/stretch presentation controls.
- Rigid internal parts.
- Voxel-frame surface changes.
- Material-driven motion.
- Limited bones for pseudopods.

They remain voxel-authored and should not rely on unrestricted smooth deformation that erases the voxel form.

## 17.3 Floating and Orbiting Entities

Floating constructs or wisps may use:

- Central root.
- Aim pivot.
- Hover offset.
- Orbit groups.
- Independent rigid parts.
- Socket rings.

## 17.4 Constructs and Golems

Construct rigs favour rigid parts, hinge joints, replaceable modules and visible pivots. Mechanical limits should match the model rather than copying organic ranges.

# 18. Joint Types, Constraints and Limits

## 18.1 Supported Joint Profiles

| Joint Type | Typical Use | Key Controls |
| --- | --- | --- |
| Fixed | Armour, attached decorations, locked modules. | Offset and orientation only. |
| Hinge | Elbows, knees, jaws, machine arms. | Axis, minimum and maximum angle. |
| Ball | Shoulders, hips, wing roots. | Swing cone, twist range and preferred axis. |
| Twist | Forearms, neck sections, tail roll. | Twist axis and range. |
| Slider | Piston limbs, retracting parts, telescoping horns. | Axis and translation range. |
| Planar | Limited surface-following components. | Plane, range and clamp. |
| Chain | Neck, spine, tail, tentacle, serpent. | Per-link limits, stiffness and distribution. |
| Spring-Follow | Ears, tassels, light tails, antennae. | Lag, damping, maximum deviation. |
| Compound | Dragon wing, complex jaw, mechanical shoulder. | Ordered sub-constraints. |

## 18.2 Preferred Angles

Joints may store a preferred neutral angle used by IK to resolve ambiguous bends. Pole targets or bend hints are required for elbows, knees and similar chains where inversion would be visually incorrect.

## 18.3 Constraint Preview

The Forge should provide:

- Rotation arcs.
- Limit cones.
- Translation ranges.
- Collision/intersection hints.
- Mirror comparison.
- Extreme-pose preview.
- Rest-pose return test.

# 19. Rigid-Part Binding and Voxel Skin Weights

## 19.1 Rigid Binding

Rigid binding is the default for:

- Spider leg sections.
- Armour plates.
- Golem limbs.
- Horns and claws.
- Mechanical creatures.
- Deliberately segmented tails.
- Equipment and props.

It preserves voxel shape exactly and is cheap to evaluate.

## 19.2 Constrained Voxel Skinning

Where a continuous surface crosses a joint, the Forge may assign weights by voxel region. Recommended rules:

- Limit active influences per generated vertex.
- Prefer one dominant bone.
- Use narrow transition bands.
- Keep weights consistent across vertices generated from the same source voxel face where practical.
- Allow manual paint or region assignment for corrections.
- Preview under common and extreme poses.

## 19.3 Binding Repair Tools

Tools should include:

- Assign selected voxels to bone.
- Grow/shrink voxel selection.
- Mirror weights.
- Copy weights between family variants.
- Convert soft region to rigid part.
- Normalize and validate influences.
- Show deformation heatmap.
- Compare source silhouette with posed silhouette.

# 20. Root Motion, Grounding and Scale

## 20.1 Root Roles

Every rig distinguishes:

- World/entity root.
- Visual root.
- Movement/root-motion reference.
- Body or pelvis centre.

This prevents camera, collision and network movement from being confused with local animation offsets.

## 20.2 In-Place and Root-Motion Clips

Both are supported. The animation definition declares whether it contains meaningful root translation or rotation. Gameplay movement decides whether to consume, scale, ignore or validate that motion.

## 20.3 Grounding

Grounding uses declared contacts and body targets. The solver must handle voxel terrain with abrupt changes while avoiding violent snapping. Confidence, maximum step height, blend speed and fallback pose are part of the profile.

# 21. Inverse-Kinematics Architecture

## 21.1 IK Layer Order

A standard pose evaluation order is:

```text
Rest and current rig
    ↓
Authored animation pose
    ↓
Retarget correction
    ↓
Gameplay-directed pose offsets
    ↓
IK and terrain contacts
    ↓
Secondary procedural chains
    ↓
Attachment and marker output
```

The final implementation may optimise this order, but the authoring model must remain understandable.

## 21.2 Solver Profile Fields

| Field | Purpose |
| --- | --- |
| chain_root_role | First movable role. |
| end_role | Hand, foot, claw, wing tip or other endpoint. |
| target_type | Terrain contact, held item, work marker, look target or authored target. |
| pole_role | Bend direction helper. |
| reach_limit | Maximum extension. |
| blend_weight | Current solver influence. |
| blend_in/out | Transition timing. |
| position_weight | Position authority. |
| rotation_weight | Orientation authority. |
| surface_alignment | How strongly endpoint follows surface normal. |
| lod_policy | Full, reduced, grouped or disabled. |
| failure_fallback | Authored animation, last valid target or neutral pose. |

## 21.3 IK Is Assistance, Not Replacement

Authored locomotion remains responsible for rhythm, personality and readable intent. IK corrects contacts and alignment within bounded limits. If a target is unreachable, the system blends back rather than stretching the entity unnaturally.

# 22. Humanoid Hand and Foot IK

## 22.1 Foot IK

Foot IK supports:

- Uneven ground.
- Slopes.
- Stairs.
- Standing at workstations.
- One-foot raised poses where authored.

The pelvis may adjust within a limited range to keep both feet reachable. Crouching or climbing states may use different profiles.

## 22.2 Hand IK

Hand IK can align to:

- Two-handed weapon grips.
- Tool handles.
- Workbench markers.
- Ladders or climbing holds.
- Doors, levers and interactive objects.
- Carried crates.
- Mount reins.

Primary and secondary hand ownership is declared by the animation or interaction context. The rig should not guess which hand controls an item without a profile.

## 22.3 First-Person Considerations

First-person arms may use a dedicated presentation rig or constrained subset of the world rig. Shared equipment sockets remain aligned through fit profiles, but camera-specific clipping corrections must not modify the authoritative third-person skeleton.

# 23. Quadruped Terrain IK

## 23.1 Four-Contact Placement

The quadruped solver finds potential contact targets for four feet, then derives limited body height, pitch and roll. It respects:

- Maximum limb extension.
- Minimum body clearance.
- Gait phase.
- Current speed.
- Contact confidence.
- Slope limits.

## 23.2 Moving Contacts

A planted foot should remain stable for its contact phase where possible. During swing, the target advances toward the next planned placement. Sudden terrain changes use capped correction speeds.

## 23.3 Large and Small Quadrupeds

Small pigs can react quickly to steps; large bears or mounts use slower, heavier adjustments. Solver profiles therefore belong to body families and scale bands rather than one global setting.

# 24. Spider, Hexapod and Centipede Limb Solvers

## 24.1 Gait Groups

Multi-legged rigs divide limbs into named gait groups:

- Spider alternating groups.
- Six-legged tripod groups.
- Crab lateral groups.
- Centipede wave groups.
- Custom radial groups.

Each group defines phase offset, minimum planted contacts and recovery rules.

## 24.2 Body Support

The solver estimates a support polygon or support region from valid contacts. Body height and tilt adjust conservatively. If too few contacts remain, the entity uses a fallback animation or movement restriction rather than producing unstable poses.

## 24.3 Centipede Simplification

A nearby centipede may solve representative contact legs and interpolate timing across the remaining bank. Medium LOD groups several segments. Far LOD uses a simplified travelling-wave animation without individual terrain contacts.

# 25. Head Look, Eye Aim and Target Tracking

## 25.1 Look Hierarchy

Target tracking may distribute rotation across:

- Eyes.
- Head.
- Neck chain.
- Upper spine or body.

Each rig profile sets maximum yaw, pitch, roll and contribution per role.

## 25.2 Readability and Safety

Look targets should not cause:

- Head inversion.
- Neck self-intersection.
- Eyes rotating outside sockets.
- Sudden snaps when targets change.
- Constant tracking that makes idle creatures feel unnatural.

## 25.3 Multi-Headed Creatures

Each head may have independent look and attack targets while sharing a body aim influence. Priority rules are gameplay-driven; the rig only supports target inputs and clamps.

# 26. Wings, Flight Surfaces, Perching and Landing

## 26.1 Wing Chains

Wing rigs declare:

- Root.
- Primary bend joints.
- Tip.
- Feather or membrane groups.
- Fold profile.
- Full-extension profile.
- Damage or breakable region.

## 26.2 Flight Assistance

Procedural flight support may add:

- Bank angle.
- Pitch response.
- Wingbeat amplitude scaling.
- Tail-plane adjustment.
- Head stabilization.

Authored clips still control the intended flap cycle and personality.

## 26.3 Perching and Landing

Perch contacts can align feet to branches, beams or designated markers. Landing uses a target approach profile, leg extension timing and wing fold transition. Invalid perch size or clearance should fail validation in the Test Laboratory.

# 27. Neck, Tail, Tentacle and Secondary Chains

## 27.1 Chain Types

| Chain | Typical Behaviour |
| --- | --- |
| Neck | Aim distribution, stabilization and limited follow-through. |
| Tail | Balance, follow-through, attacks and expression. |
| Tentacle | Target reaching, idle motion or attack paths. |
| Antenna | Light spring-follow with small range. |
| Ear/Horn Decoration | Optional secondary motion or fixed attachment. |
| Serpent Spine | Primary locomotion chain, not merely secondary motion. |

## 27.2 Authored Versus Procedural Control

Each chain declares control layers and weights. A dragon tail attack may temporarily override passive follow-through. A serpent spine remains locomotion-critical and should not be handled as a decorative spring.

## 27.3 Collision Limits

Full self-collision is not required for every chain. The Forge supports simplified body-avoidance volumes and angle limits, with warnings where authored motion repeatedly intersects the body.

# 28. Attachment Sockets and Equipment Anchors

## 28.1 Socket Definition

A socket contains:

- Stable socket ID.
- Parent rig role.
- Local position and rotation.
- Optional scale policy.
- Attachment category.
- Allowed fit profiles.
- Occupancy group.
- LOD behaviour.
- Preview asset.

## 28.2 Common Socket Categories

- Main hand and off hand.
- Back weapon.
- Belt left/right.
- Headgear.
- Chest/armour.
- Shoulder accessory.
- Tool or work attachment.
- Mouth or bite origin.
- Breath origin.
- Projectile origin.
- Saddle and rider seat.
- Cargo left/right.
- Nameplate and health bar.
- Camera and dialogue focus.
- Future sound/VFX attachment reference.

## 28.3 Stable Socket Rule

Moving or renaming an approved socket triggers dependency reporting because equipment, animations, interactions and blueprints may rely on it.

# 29. Armour, Clothing, Saddles, Riders and Cargo

## 29.1 Equipment Fit Profiles

An equipment fit profile defines how an item or armour piece adapts to a rig family:

- Required sockets.
- Body-region coverage.
- Scale ranges.
- Offset corrections.
- Hidden body voxels where permitted.
- Collision-clearance notes.
- Animation restrictions.

## 29.2 Armour Binding

Voxel armour may be:

- Rigidly attached to a bone.
- Bound through stepped voxel weights.
- Assembled from several plates.
- Swapped by equipment state.

Armour should not deform more smoothly than the body style allows.

## 29.3 Riders and Mounts

A mount defines:

- Rider seat socket.
- Mount direction.
- Dismount clearance markers.
- Rider hand targets.
- Saddle fit profile.
- Camera anchors.
- Optional passenger or cargo seats.

The rider rig receives mount-specific pose targets. Gameplay controls mounting permission and movement authority.

# 30. Interaction, Combat and Gameplay Marker Anchors

## 30.1 Marker Types

- Weapon origin.
- Bite or claw origin.
- Breath origin.
- Projectile origin.
- Footstep contact.
- Work-tool strike point.
- Carry grip.
- Interaction focus.
- Eye and hearing origin.
- Loot-drop origin.
- Weak-point anchor.
- Damage-region centre.
- Cinematic camera anchor.

## 30.2 Marker Boundary

Markers describe where presentation or gameplay queries occur. They do not contain attack damage, AI choices or item transactions.

## 30.3 Work and Blueprint Alignment

NPC work animations may align hands or tools to Blueprint Forge markers such as:

- Anvil strike point.
- Construction block target.
- Farming row position.
- Storage pickup point.
- Machine control handle.

Rig and blueprint validation should test these pairings together.

# 31. Animation Retargeting and Compatibility

## 31.1 Compatibility Levels

| Level | Meaning |
| --- | --- |
| Exact | Same rig template and required roles; direct clip reuse. |
| Family-Compatible | Same semantic family with proportional differences handled by retarget profile. |
| Semantic Retarget | Roles map across related but non-identical skeletons. Manual corrections may be needed. |
| Bridged | A custom bridge maps a subset, such as humanoid torso to centaur body. |
| Incompatible | Clip is not safe to retarget and requires a new animation. |

## 31.2 Retarget Profile Fields

- Source and target family IDs.
- Rest-pose correction.
- Role map.
- Translation scaling policy.
- Limb-length handling.
- Root-motion scaling.
- Missing-role fallback.
- Extra-role behaviour.
- Twist distribution.
- Hand/foot correction offsets.
- Review status.

## 31.3 Retarget Review

Every retargeted family should be previewed for:

- Foot sliding.
- Hand alignment.
- Shoulder collapse.
- Joint inversion.
- Weapon reach.
- Silhouette readability.
- Extra-limb behaviour.
- Root-motion mismatch.

# 32. Modular Bodies, Variants and Additional Limbs

## 32.1 Module Contracts

A modular body part declares compatible:

- Rig family.
- Parent role.
- Joint profile.
- Binding profile.
- Socket requirements.
- Scale range.
- Retarget implications.

## 32.2 Variant Safety

Changing horn shape or tail length may be visual only. Changing limb count, neck segments or body orientation affects rig compatibility and requires a variant rig or extension profile.

## 32.3 Generated Extensions

Repeated limb or segment generators store:

- Count.
- Base role pattern.
- Parent distribution.
- Joint profile.
- Symmetry or radial rules.
- LOD grouping.
- Deterministic seed.

# 33. Procedural Motion, Seeds and Determinism

## 33.1 Deterministic Profiles

Procedural authoring tools and runtime solvers store parameters rather than uncontrolled random results. A profile may include a seed for variation, but identical input state and seed should produce reproducible outputs where gameplay or networking depends on the result.

## 33.2 Runtime Inputs

Valid runtime inputs include:

- Ground samples.
- Movement speed and direction.
- Current animation phase.
- Look target.
- Held-object target.
- Mount or workstation marker.
- Damage-disabled limbs.
- LOD and simulation budget.

## 33.3 Fallbacks

Every solver declares behaviour when data is missing or invalid:

- Blend to authored animation.
- Hold last valid target briefly.
- Use neutral contact.
- Disable the chain.
- Switch to simplified gait.

# 34. Physics-Assisted Secondary Motion

## 34.1 Supported Uses

Limited physics-assisted motion may be used for:

- Ears.
- Antennae.
- Short tails.
- Tassels.
- Light armour decorations.
- Hanging voxel charms.

## 34.2 Restrictions

- Not authoritative for attacks or gameplay contact.
- Clamped to safe angles.
- Deterministic or replicated only where necessary.
- Disabled or baked into simpler motion at lower LOD.
- No full cloth simulation requirement.
- No uncontrolled chain explosion after teleport or load.

## 34.3 Reset Behaviour

Secondary chains need explicit reset, teleport and spawn handling to avoid large visual impulses.

# 35. Damage, Breakable Parts, Severing and Phase Rigs

## 35.1 Rig-Linked Damage Regions

A damage presentation region may reference:

- One or more bones or rigid parts.
- Replacement voxel parts.
- Disabled solver chains.
- Detached-piece presentation.
- Changed sockets.
- Alternate animation set or pose restrictions.

## 35.2 Breakable Wings and Limbs

When a gameplay system marks a region broken, the presentation may:

- Hide or swap a part.
- Disable a wing or limb solver.
- Use an injured gait profile.
- Move equipment to a fallback socket.
- Enable a stump, crack or damage model.
- Trigger a named event reference for future VFX/audio.

## 35.3 Boss Phase Rigs

A boss phase may activate:

- New appendages.
- Expanded wing forms.
- Exposed core parts.
- Alternative jaw or head assembly.
- Changed constraint limits.
- New sockets and attack origins.

Phase changes must be explicit variants or state layers, not undocumented runtime hierarchy mutations.

# 36. Rig LOD, Update Budgets and Performance

## 36.1 Rig LOD Layers

| LOD | Typical Behaviour |
| --- | --- |
| Rig LOD 0 | Full bones, IK, procedural contacts, secondary chains and attachments. |
| Rig LOD 1 | Full core skeleton, reduced limb solvers, simplified secondary motion. |
| Rig LOD 2 | Reduced bones or grouped segments, limited IK, lower update frequency. |
| Rig LOD 3 | Simplified animation rig or baked part animation; no expensive solvers. |
| Abstract | No rendered rig; simulation record only. |

## 36.2 Bone Reduction

Reduction may:

- Merge spine or tail roles.
- Group centipede segments.
- Remove finger, feather or decorative bones.
- Collapse extra facial nodes.
- Replace multi-contact IK with body-level grounding.

Required gameplay sockets must either remain available or map to stable fallback transforms.

## 36.3 Update Budget Factors

- Distance to player.
- Screen size.
- Entity importance.
- Combat relevance.
- Local population count.
- Current animation complexity.
- Multiplayer visibility.
- Platform settings.

# 37. Editable Source and Baked Runtime Products

## 37.1 Editable Rig Source

Contains:

- Rig family and version.
- Hierarchy and semantic roles.
- Rest pose.
- Joints and constraints.
- Voxel bindings.
- Sockets and markers.
- IK and procedural profiles.
- Retarget maps.
- LOD rules.
- Validation notes.
- Revision and approval metadata.

## 37.2 Runtime Products

May include:

- Engine skeleton or transform hierarchy.
- Baked skin weights.
- Runtime socket map.
- Solver configuration.
- Reduced LOD skeletons.
- Retarget cache.
- Attachment compatibility data.
- Validation fingerprint.

## 37.3 Rebuild Rule

Runtime products are disposable and must be rebuildable from approved voxel and rig source. A new baker version should not require manual recreation of the skeleton.

# 38. Forge Rig-Authoring Workflow and UI

## 38.1 Guided Workflow

```text
Open entity or body template
    ↓
Generate or select rig family
    ↓
Map anatomy roles
    ↓
Place root, pivots and joint axes
    ↓
Set rest pose and limits
    ↓
Bind voxel parts or regions
    ↓
Create sockets and markers
    ↓
Configure IK and solver profiles
    ↓
Assign retarget compatibility
    ↓
Generate rig LODs
    ↓
Run Test Laboratory scenarios
    ↓
Validate, review and approve
```

## 38.2 Rig Builder Panels

- Hierarchy tree.
- Anatomy-to-rig mapping.
- 3D rig viewport.
- Joint inspector.
- Constraint visualizer.
- Binding/weight editor.
- Socket manager.
- IK chain editor.
- Retarget map editor.
- LOD profile panel.
- Dependency and revision panel.
- Validation report.

## 38.3 Editing Assistance

The Forge may suggest:

- Bone chains from anatomy.
- Joint pivots from voxel connection surfaces.
- Mirrored roles.
- Foot and hand contacts.
- Basic limits based on template.
- Socket positions.
- LOD grouping.

Suggestions remain editable and require review.

# 39. Pose Library, Retarget Preview and Test Laboratory

## 39.1 Pose Library

Store reusable poses for:

- Neutral rest.
- Equipment fitting.
- Hand grips.
- Crouch.
- Sit and sleep.
- Quadruped stand.
- Wing folded and extended.
- Spider neutral contact.
- Dragon grounded and flight reference.
- Damage and breakable-region preview.

## 39.2 Test Laboratory Scenarios

- Flat ground.
- Slopes and stairs.
- Uneven voxel rubble.
- Narrow doorway.
- Workbench or machine interaction.
- Two-handed item alignment.
- Mount and rider fit.
- Perch and landing platform.
- Flight clearance.
- Multi-legged obstacle path.
- Boss-scale arena.
- LOD transition distance.

## 39.3 Retarget Comparison

The viewport should play source and target side by side with overlays for:

- Foot contacts.
- Hand targets.
- Joint-limit warnings.
- Root trajectory.
- Silhouette comparison.
- Socket paths.

# 40. Overrides, Dependencies, Versioning and Migration

## 40.1 Overrideable Fields

Developers may override:

- Rig template.
- Rest pose.
- Joint limits.
- Binding regions.
- Socket offsets.
- IK profile.
- Retarget map.
- LOD grouping.
- Damage-region links.

Overrides should be field-level where practical so an asset can inherit future safe improvements.

## 40.2 Dependency Graph

A rig change may affect:

- Entity models.
- Animation sets.
- Equipment fit profiles.
- Mount and rider profiles.
- Interaction blueprints.
- Combat marker mappings.
- Icon poses.
- Save-visible equipment presentation.

The Forge displays dependencies before destructive changes.

## 40.3 Migration Rules

Migrations are required when:

- Stable role IDs change.
- Required sockets are removed.
- Hierarchy meaning changes.
- Rest pose changes invalidate retarget maps.
- LOD fallback roles disappear.
- Equipment fit profiles become incompatible.

Visual-only pivot corrections may not require save migration, but they still require animation and attachment review.

# 41. Validation Rules, Errors and Warnings

## 41.1 Hard Errors

- Hierarchy cycle.
- Missing root.
- Duplicate stable role ID.
- Parent role does not exist.
- Required family role missing.
- Socket parent missing.
- Invalid binding reference.
- IK chain is disconnected.
- Retarget map references missing roles.
- Runtime product cannot be rebuilt.
- Corrupt or conflicting registry ID.

## 41.2 Warnings

- Pivot outside expected joint area.
- Joint limit permits obvious inversion.
- Voxel deformation stretches strongly.
- Attachment clips through body in common poses.
- IK reach is too short for target profile.
- Excessive solver count.
- Too many active bones for target LOD.
- Retargeted clip shows foot sliding.
- Wing or tail clearance is poor.
- Secondary motion lacks reset behaviour.
- No fallback socket after breakable-part loss.

## 41.3 Review Gates

| Lifecycle State | Rig Requirement |
| --- | --- |
| Draft | Hierarchy may be incomplete; source remains recoverable. |
| Functional | Required roles, bindings and basic sockets validate. |
| Animation Ready | Rest pose, limits, retarget profile and contacts approved. |
| Gameplay Ready | Required interaction, combat and equipment markers validated. |
| Visual Review | Common and extreme poses preserve voxel quality. |
| Performance Review | Rig LOD and update budgets pass. |
| Approved | Dependencies, migrations and test scenarios are complete. |

# 42. Proof-of-Concept Scope and Acceptance Criteria

## 42.1 Required POC Rigs

| Asset | Rig Proof |
| --- | --- |
| Standard Humanoid | Shared player/NPC family, hand and foot sockets, foot IK, two-handed grip test. |
| Four-Armed Humanoid | Additional arm bank, independent sockets, partial animation reuse. |
| Pig | Quadruped family, terrain contacts, head and tail roles. |
| Spider | Eight limb chains, gait groups, body grounding and climb-ready contact roles. |
| Giant Centipede | Generated segment chain, repeated leg banks and reduced LOD solver. |
| Bird | Wing chains, perch contacts, folded and extended poses. |
| Dragon | Four legs, two wings, neck and tail chains, breath socket, mount/camera anchor and breakable wing region. |

## 42.2 Required System Tests

- Generate rig from body-plan template.
- Edit pivots and mirror changes safely.
- Bind voxel parts and constrained skin regions.
- Preview joint limits.
- Create and test stable sockets.
- Run foot or limb IK on uneven voxel terrain.
- Retarget one animation family between compatible variants.
- Disable one limb and activate fallback pose/gait profile.
- Switch between at least two rig LOD levels.
- Rebuild runtime rig products from source.
- Capture dependency changes and revision history.

## 42.3 Definition of Done

The 22E POC is successful when:

- Every required body plan can be rigged without abandoning voxel source data.
- The standard humanoid and pig reuse family rigs.
- The spider and centipede demonstrate scalable multi-leg support.
- The bird and dragon demonstrate wing, perch or flight-related rig roles.
- Equipment and rider attachments remain stable through preview animations.
- Retargeting works for a compatible family and refuses an unsafe incompatible case.
- Breakable-region presentation disables or replaces the correct rig section.
- Rig LOD reduces active complexity without losing required gameplay anchors.
- All approved source files rebuild deterministic runtime products.

# 43. Relationships With Documents 22F-22L

| Document | Relationship |
| --- | --- |
| 22F - Entity Animation, Locomotion, Combat and Visual States | Uses the rig families, contacts, joints, sockets and solver contracts defined here to build clips, gait sets, blend graphs and state presentation. |
| 22G - Character Customisation, Equipment, Variants and Visual Inheritance | Uses sockets, fit profiles, bindings and modular-rig rules for equipment and appearance variants. |
| 22H - Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD | Converts rig markers and regions into gameplay-facing integration while preserving authority boundaries. |
| 22I - Blueprint Forge | Supplies work markers, mount points and interaction locations that rig IK targets align to. |
| 22J - Unified Forge UI/UX | Integrates the Rig Builder, Joint Inspector, Socket Manager, Retarget Editor and Test Laboratory. |
| 22K - Technical Implementation Plan | Defines Godot resources, runtime skeleton generation, solver services, threading, caching, hot reload and testing. |
| 22L - Production and Migration Plan | Schedules rig-template creation, entity migration, animation compatibility review and approval work. |

# Appendix A. Semantic Rig Role Register

| Role Pattern | Required For | Notes |
| --- | --- | --- |
| root | All rigs | Entity/world reference. |
| visual_root | Recommended | Local presentation offset. |
| pelvis / body_main | Humanoid or central-body rigs | Primary body centre. |
| spine_## | Humanoids, quadrupeds, dragons | Ordered chain. |
| neck_## | Headed creatures | Optional multi-link chain. |
| head | Most entities | Aim and expression parent. |
| jaw | Creatures with articulated mouths | Hinge or compound joint. |
| upper_arm_side | Humanoids | Primary arm chain. |
| hand_side | Humanoids | Item and interaction socket parent. |
| upper_leg_side | Humanoids/quadrupeds | Limb chain. |
| foot_side / claw_side | Grounded creatures | Contact and IK endpoint. |
| wing_root_side | Flying creatures | Primary wing attachment. |
| wing_tip_side | Flying creatures | Flight and clearance endpoint. |
| tail_## | Tailed creatures | Ordered chain. |
| segment_## | Repeated bodies | Generated stable sequence. |
| leg_pair_##_* | Multi-legged creatures | Generated limb-bank roles. |
| aim_target | Optional helper | Solver-only target. |
| ik_*_target | Optional helper | IK target role. |

# Appendix B. Joint and Constraint Register

| Profile ID | Joint Type | Example |
| --- | --- | --- |
| joint.fixed.default | Fixed | Armour plate. |
| joint.hinge.elbow | Hinge | Humanoid elbow. |
| joint.hinge.knee | Hinge | Humanoid knee. |
| joint.hinge.jaw | Hinge | Animal jaw. |
| joint.ball.shoulder | Ball | Humanoid shoulder. |
| joint.ball.hip | Ball | Hip. |
| joint.ball.wing_root | Ball/compound | Bird or dragon wing root. |
| joint.twist.forearm | Twist | Forearm correction. |
| joint.chain.neck | Chain | Neck. |
| joint.chain.tail | Chain | Tail. |
| joint.chain.serpent | Chain | Serpentine body. |
| joint.slider.piston | Slider | Construct limb. |
| joint.spring.antenna | Spring-follow | Antenna. |

# Appendix C. Rig Template Register

| Template ID | Body Plan | POC Status |
| --- | --- | --- |
| rig.humanoid.standard | Two-arm, two-leg humanoid | Required |
| rig.humanoid.four_arm | Four-arm humanoid | Required |
| rig.quadruped.pig | Compact quadruped | Required |
| rig.quadruped.standard | General quadruped | Planned |
| rig.spider.eight_leg | Spider | Required |
| rig.hexapod.standard | Six-legged arthropod | Planned |
| rig.segmented.centipede | Repeated crawler | Required |
| rig.serpent.standard | Serpentine body | Planned |
| rig.avian.bird | Bird | Required |
| rig.bat.standard | Membrane flyer | Planned |
| rig.wyvern.standard | Two-leg winged dragon | Planned |
| rig.dragon.four_leg | Four-leg dragon | Required |
| rig.aquatic.fish | Fish-like body | Planned |
| rig.floating.standard | Floating entity | Planned |
| rig.construct.golem | Rigid construct | Planned |

# Appendix D. Socket and Attachment Register

| Socket ID Pattern | Parent Role | Use |
| --- | --- | --- |
| socket.hand.main | hand_right or configured side | Primary held item. |
| socket.hand.off | hand_left or configured side | Secondary held item. |
| socket.back.weapon | spine/chest | Stowed weapon. |
| socket.head.gear | head | Head equipment. |
| socket.mouth.attack | head/jaw | Bite or breath alignment. |
| socket.breath.origin | head/jaw | Dragon or magical breath origin. |
| socket.saddle.main | body/spine | Saddle attachment. |
| socket.rider.seat_01 | body/spine | Rider transform. |
| socket.cargo.left/right | body | Pack or cargo. |
| socket.nameplate | head/body | UI anchor. |
| socket.camera.dialogue | head/body | Dialogue framing. |
| socket.effect.* | appropriate role | Future VFX reference only. |
| socket.sound.* | appropriate role | Future audio reference only. |

# Appendix E. IK and Procedural Solver Profiles

| Profile | Purpose | LOD Strategy |
| --- | --- | --- |
| ik.humanoid.feet | Two-foot terrain alignment. | Full near, pelvis-only medium, off far. |
| ik.humanoid.two_hand | Secondary hand aligns to held item. | Full where item visible. |
| ik.quadruped.four_contact | Four-foot placement and body support. | Full near, reduced contacts medium. |
| gait.spider.alternating | Eight-leg gait groups. | Full near, grouped medium, clip far. |
| gait.hexapod.tripod | Six-leg tripod gait. | Full near, grouped far. |
| gait.centipede.wave | Segment-phase wave and representative contacts. | Representative near, grouped medium, visual wave far. |
| ik.avian.perch | Foot alignment to perch marker. | Full during perch state only. |
| aim.head.standard | Eye/head/neck target distribution. | Head only at lower LOD. |
| chain.tail.follow | Bounded tail follow-through. | Reduced bones and update rate by distance. |

# Appendix F. Rig Performance Guidance

| Entity Tier | Suggested Rig Approach |
| --- | --- |
| Ambient Small | Minimal core bones, no continuous IK unless very near. |
| Standard NPC | Shared humanoid rig, limited foot IK, standard equipment sockets. |
| Standard Creature | Family rig, terrain IK when visible, reduced secondary chains. |
| Elite / Mount | Full local rig, equipment or rider sockets, stronger solver budget. |
| Boss | Detailed Rig LOD 0 with authored reductions for distance and phase. |
| Swarm / Horde | Shared simple rig, update staggering, grouped or baked procedural motion. |
| Segmented Giant | Full head/core rig, grouped segment and contact evaluation. |

Budgets are first-pass guidance and must be profiled in packaged builds. The Forge should expose cost estimates but should not pretend estimates replace runtime measurement.

# Appendix G. Rig Validation Checklist

- [ ] Voxel source remains editable and linked.
- [ ] Rig family or custom body plan is declared.
- [ ] One valid root exists.
- [ ] Hierarchy contains no cycles.
- [ ] Required semantic roles exist.
- [ ] Local axes and forward direction are consistent.
- [ ] Pivots align with visible joints.
- [ ] Joint limits have been reviewed.
- [ ] Bindings preserve voxel silhouette in common poses.
- [ ] Extreme-pose deformation has been checked.
- [ ] Required hand, foot, mouth, equipment and UI sockets exist.
- [ ] IK chains are connected and have fallbacks.
- [ ] Terrain tests pass for relevant contacts.
- [ ] Retarget compatibility is declared honestly.
- [ ] Additional limbs or segments have generated stable roles.
- [ ] Damage and breakable-region fallbacks are valid.
- [ ] Required sockets survive or remap across rig LOD.
- [ ] Runtime products rebuild from source.
- [ ] Dependencies and migrations are recorded.
- [ ] Audio/VFX references remain hooks only.

# Appendix H. Proof-of-Concept Rig Checklist

- [ ] Standard humanoid rig created.
- [ ] Four-armed humanoid extension created.
- [ ] Pig quadruped rig created.
- [ ] Spider eight-leg rig created.
- [ ] Giant centipede generated rig created.
- [ ] Bird wing and perch rig created.
- [ ] Dragon rig created.
- [ ] Two-handed equipment test passes.
- [ ] Mount/rider socket test passes.
- [ ] Uneven terrain IK test passes.
- [ ] Semantic retarget test passes.
- [ ] Unsafe retarget is rejected or warned correctly.
- [ ] Breakable region disables the correct chain.
- [ ] Rig LOD transition preserves required anchors.
- [ ] Runtime rigs rebuild deterministically.
- [ ] All assets reach Functional or higher lifecycle state.

# Appendix I. Glossary

| Term | Definition |
| --- | --- |
| Bone | Hierarchical transform that drives geometry or child attachments. |
| Body-Plan Graph | Anatomy structure defining body parts and relationships before rigging. |
| Contact | End point or region intended to meet terrain or an object. |
| Constraint | Limit or relationship applied to a rig node. |
| Hard Skinning | Binding with one dominant transform and little or no smooth blending. |
| IK | Inverse kinematics; solving a chain to reach a target. |
| Joint | Allowed movement relationship between parent and child rig nodes. |
| Retargeting | Applying animation from one rig to another through semantic mapping. |
| Rigid Part | Voxel assembly moved without deformation. |
| Rig Family | Reusable skeleton and role contract shared by compatible entities. |
| Rig LOD | Reduced rig or solver profile used for performance. |
| Semantic Role | Stable functional identity such as hand, head, wing root or tail segment. |
| Socket | Named attachment transform parented to the rig. |
| Solver Profile | Reusable settings for IK, gait or procedural motion. |
| Stepped Skinning | Deliberately banded multi-bone weights preserving voxel form. |
| Virtual Node | Helper transform used by a solver but not a visible anatomy part. |
| Voxel Source of Truth | Editable voxel data from which runtime meshes and rig bindings are generated. |

---

**End of Document 22E - Skeletons, Rigging, Joints, IK and Attachment Systems - Version 0.1**
