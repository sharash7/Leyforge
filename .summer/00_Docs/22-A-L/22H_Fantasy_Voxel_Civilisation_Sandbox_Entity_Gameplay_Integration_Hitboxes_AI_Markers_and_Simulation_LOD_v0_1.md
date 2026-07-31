# Fantasy Voxel Civilisation Sandbox
## 22H - Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD
### Voxel Entity Runtime Contracts, Combat Volumes, Interaction Anchors, Navigation Profiles and Scalable Living-World Simulation
**Version 0.1 - Detailed Design Bible Draft**

A voxel-first integration system that connects Forge-authored player characters, NPCs, animals, mobs, monsters, mounts and bosses to movement, collision, combat, interaction, AI perception, navigation, work, world structures, persistence, multiplayer authority and simulation level of detail without allowing presentation assets to become the owner of gameplay truth.

## Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines how Forge-authored voxel entities connect to runtime gameplay through collision bodies, hurtboxes, attack volumes, weak points, semantic markers, interaction anchors, AI perception origins, navigation profiles, mount points, work markers, boss regions, persistence records, multiplayer authority and simulation LOD. |
| Core Philosophy | The Forge describes where and how gameplay systems attach to an entity, while authoritative gameplay systems continue to own movement, damage, inventory, AI decisions, status, quests and world state. |
| Voxel Direction | All entity geometry and editable body parts remain voxel-authored. Collision, hitboxes and markers may use simplified runtime primitives or generated hulls, but they are derived from and remain visibly aligned with the voxel source. |
| Integration Direction | Use stable semantic roles and registry IDs instead of hard-coded scene paths. Gameplay code requests roles such as `marker.eye.primary`, `hurtbox.head` or `socket.mount.rider_01` and resolves them through validated entity definitions. |
| Collision Direction | Use layered collision: one efficient movement body, optional physical sub-bodies where required, semantic hurt regions for combat, and temporary attack volumes controlled by authoritative actions. Never create one physics object per source voxel. |
| Hitbox Direction | Distinguish movement collision, environmental collision, hurtboxes, attack hitboxes, interaction volumes, detection volumes and navigation footprints. Each has a clear owner, lifetime and replication rule. |
| Damage Direction | Damage regions may alter multipliers, reactions, armour presentation, breakable parts, abilities and boss phases, but the combat system decides outcomes. Visual anatomy never applies damage by itself. |
| AI Marker Direction | Forge markers define valid origins, targets and contact points for sight, hearing, scent, attacks, work, carrying, mounting, harvesting, dialogue, nameplates and world interactions. AI behaviour remains defined by AI profiles and runtime state. |
| Body-Plan Direction | Support humanoids, additional arms, quadrupeds, spiders, hexapods, segmented crawlers, serpents, birds, bats, aquatic creatures, dragons, amorphous entities, constructs and custom body-plan graphs. |
| Navigation Direction | Navigation profiles describe locomotion capabilities, footprint, height, step, slope, turning, climbing, swimming, burrowing, flying, perching and formation needs. Navigation code owns route generation and movement validation. |
| Blueprint Direction | Entity markers and structure markers share semantic contracts so NPCs, creatures and bosses can correctly use Forge-authored buildings, workstations, nests, roads, doors, beds, guard posts, arenas and construction sites. |
| LOD Direction | Separate rendering LOD, animation LOD, physics LOD, AI LOD and simulation LOD. These layers may change at different distances while preserving stable identity and authoritative state. |
| Persistence Direction | Persistent entities retain stable IDs, appearance seeds, equipment, injuries, relationships, job state, inventory, location summary and consequential history even when no full actor is loaded. |
| Multiplayer Direction | The server or authoritative local world owns movement validation, combat volumes, AI decisions, inventory changes, interactions and persistent state. Clients may preview, animate and interpolate but do not author gameplay truth. |
| Performance Direction | Use primitive colliders, grouped damage regions, solver throttling, broad-phase filtering, staggered AI updates, abstract distant simulation and explicit budgets. Complexity must scale by gameplay importance, not only visual size. |
| Developer Direction | The Forge may suggest collision, regions and markers from voxel anatomy, but developers can inspect and override them. Overrides must pass alignment, dependency, migration and gameplay-contract validation. |
| Audio/VFX Boundary | Named sound and effect hooks may exist as future attachment references, but full audio and particle/VFX authoring remain deferred to later Forge modules. |
| Implementation Context | Godot with Summer Engine is the current target. This document defines gameplay-facing contracts and design rules; Document 22K will define final technical classes, resources and implementation sequencing. |
| POC Direction | Prove a player humanoid, village NPC, pig, spider, giant centipede, bird and dragon boss using validated collision, semantic markers, damage regions, interactions, navigation profiles, multiplayer-safe action windows and at least three simulation LOD tiers. |

## Document Purpose

Documents 22A through 22G define the expanded Leyforge Forge, voxel body architectures, humanoid and creature creation, reusable rigs, inverse kinematics, animation, visual states, equipment, deterministic variants and presentation inheritance. Those systems make entities look correct and move convincingly. They do not, by themselves, make an entity a valid participant in the game world.

This document defines the integration layer that turns a Forge-authored voxel model into a playable character, working villager, animal, monster, mount or boss. It explains how the game understands the model's occupied space, which regions can receive damage, where attacks originate, where an NPC looks from, where a rider sits, where a worker grips a tool, where loot appears, how a flying creature lands, and what remains simulated after the full entity is unloaded.

The system must preserve a strict ownership boundary. The Forge can declare that a dragon has a mouth socket, a left-wing damage region and a rider seat. It does not decide when the dragon breathes fire, whether its wing is broken, who may ride it or how much damage an attack inflicts. Those decisions remain with combat, ability, AI, mount, inventory and world-state systems. The Forge supplies validated spatial and semantic contracts that those systems can safely consume.

This separation is essential for iteration. A developer must be able to remodel a pig, lengthen a centipede, replace a humanoid's proportions or overhaul a boss without rewriting every gameplay system. Stable semantic roles, compatibility profiles and migration rules allow the presentation to change while gameplay definitions and save data remain intact.

This document also defines simulation level of detail. Leyforge promises persistent named NPCs, living villages, creature ecology, raids, mounts, bosses and a very large world. Full actors, complete physics, continuous perception and detailed animation cannot remain active everywhere. The integration layer therefore needs explicit promotion and demotion rules that preserve identity, resources, injuries, projects, relationships and consequences while changing how much of an entity is simulated.

It does not define final combat formulas, AI utility scores, navigation algorithms, networking code, save-file formats or the complete Forge interface implementation. Those remain owned by their dedicated systems and Document 22K. It defines the contracts those systems must share.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. The Forge remains a voxel-only source-authoring environment. Runtime colliders, hit volumes and navigation proxies may be simplified for performance, but they must be generated from or deliberately aligned to the approved voxel source and may never silently replace its visible identity.

## Design Sources

| Source Document | Relevant Direction | How 22H Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | The world combines survival, living NPC civilisations, automation, fantasy RPG systems and readable voxel presentation. | Requires entities to participate consistently in combat, work, settlement life, world consequences and scalable simulation. |
| 01 - Core Gameplay Loop | The player explores, gathers, builds, interacts, automates, defends, upgrades and expands. | Defines the gameplay interactions that entity anchors and runtime contracts must support. |
| 03 - Blocks Registry | Blocks have collision, interaction, damage, ownership and functional states. | Requires compatible entity-to-block collision, interaction reach, hazards and structure usage. |
| 07 - NPC Village System | Named NPCs have jobs, schedules, needs, inventories, homes, construction tasks, memories and simulation LOD. | Establishes persistent NPC identity, work markers, distant summaries and promotion/demotion requirements. |
| 08 - Automation System | Machines, logistics and village supply are physical, permissioned and performance-aware. | Requires worker, carrying, machine-service and maintenance anchors that remain independent from machine visuals. |
| 09 - Magic System | Spells, wards, conduits, corruption and magical infrastructure interact with entities and world state. | Requires casting origins, ward categories, magical target anchors and persistent condition data. |
| 10 - Creatures and Monsters | Creatures need readable roles, AI, senses, terrain use, drops, village interaction, bosses and LOD. | Provides the creature-facing gameplay categories and threat roles integrated by this document. |
| 11 - Biomes and World Generation | Detailed nearby simulation and abstract distant region state must coexist in a large world. | Establishes world-space promotion zones, habitat summaries and unloaded simulation boundaries. |
| 12 - Structures | Structures contain markers, sockets, ownership, construction stages, dynamic states and simulation LOD. | Aligns entity semantic markers with Blueprint Forge structure markers and usage contracts. |
| 15 - Quest and Event System | Quests and events bind to stable entities and persistent world evidence. | Requires stable entity IDs and fallback behaviour when a full actor is not loaded. |
| 16 - Combat, Gear and Defence | Combat uses readable actions, damage, armour, status, raids, structures and boss mechanics. | Defines the need for authoritative attack windows, hurt regions, weak points, armour coverage and boss parts. |
| 17 - UI/UX System | UI should be inspectable, accessible, world-first and authority-aware. | Guides nameplate anchors, target indicators, interaction prompts, debug overlays and readable validation. |
| 21A-21G - Voxel Asset Forge | Defines voxel source, baking, states, overrides, UI, registries and production migration. | Supplies the shared Forge asset architecture and source-versus-runtime separation. |
| 22A - Forge Entity and Blueprint Expansion | Locks Entity Forge and Blueprint Forge as connected voxel workspaces. | Establishes the umbrella scope and semantic integration requirement. |
| 22B - Entity Model Taxonomy | Defines body-plan graphs for humanoids, quadrupeds, multi-legged, segmented, flying and unusual entities. | Provides body roles from which collision, regions, markers and navigation profiles are derived. |
| 22C - Humanoid Creator | Defines player and NPC voxel bodies, proportions, equipment and persistent identity. | Supplies humanoid integration needs such as camera, interaction, equipment, work and dialogue anchors. |
| 22D - Creature and Boss Creator | Defines animals, monsters, flying creatures, segmented bodies and bosses. | Supplies creature-specific hit regions, locomotion, harvesting, mount and boss requirements. |
| 22E - Rigging, IK and Attachments | Defines skeleton families, joints, IK, sockets and attachment systems. | Supplies semantic bones, pivots, attachment roles and solver compatibility. |
| 22F - Entity Animation | Defines action graphs, event markers, locomotion, attacks and visual states. | Connects authoritative gameplay actions to temporary hit volumes, contact markers and state transitions. |
| 22G - Customisation and Equipment | Defines appearance inheritance, equipment fit, variants and persistent identity. | Ensures gameplay regions and markers remain stable across visual variation and equipment changes. |

## Static Table of Contents

1. Locked Gameplay Integration Identity  
2. Player Decision Summary  
3. Scope, Users and System Boundaries  
4. Integration Architecture Overview  
5. Entity Definition, Runtime Record and Actor Separation  
6. Stable IDs, Semantic Roles and Registry Contracts  
7. Voxel Source Alignment and Runtime Proxy Rules  
8. Collision Architecture  
9. Collision Layers, Masks and Broad-Phase Categories  
10. Movement Body, Footprint and Environmental Contact  
11. Hurtboxes and Damageable Regions  
12. Attack Hitboxes and Action Volumes  
13. Weak Points, Armour Regions and Damage Multipliers  
14. Breakable, Disableable and Severable Body Parts  
15. Interaction Volumes and Context Anchors  
16. AI Perception Origins and Sensor Profiles  
17. Navigation Profiles and Locomotion Capabilities  
18. Ground, Climb, Swim, Burrow and Flight Integration  
19. Terrain Contact, IK Targets and Surface Adaptation  
20. AI Behaviour Integration and Semantic Targets  
21. NPC Work, Social and Village Markers  
22. Equipment, Carrying, Tool and Inventory Anchors  
23. Mounts, Riders, Passengers, Cargo and Towing  
24. Loot, Corpse, Harvesting and Taming Anchors  
25. Projectiles, Breath, Area Attacks and Ability Origins  
26. Bosses, Multi-Part Encounters and Arena Contracts  
27. Blueprint Forge and Structure Marker Integration  
28. Simulation LOD Architecture  
29. Promotion, Demotion and Actor Reconstruction  
30. Nearby, Medium, Distant and Unloaded Simulation  
31. Independent Rendering, Animation, Physics, AI and Simulation LOD  
32. Crowds, Swarms, Herds and Segmented-Body Optimisation  
33. Persistence, Saves and World-State Evidence  
34. Multiplayer Authority, Replication and Prediction  
35. Forge Authoring Workflow and Automatic Suggestions  
36. Test Laboratory, Validation and Diagnostics  
37. Readability, Accessibility and Player Trust  
38. Performance Budgets and Scalability Rules  
39. Overrides, Compatibility, Migration and Deprecation  
40. Proof-of-Concept Scope  
41. Staged Implementation Plan  
42. Definition of Done and Acceptance Criteria  
43. Open Questions and Deferred Features  
Appendix A. Entity Gameplay Integration Data Template  
Appendix B. Semantic ID and Marker Naming Register  
Appendix C. Collision and Volume Category Matrix  
Appendix D. Body-Family Baseline Integration Profiles  
Appendix E. Simulation LOD State Matrix  
Appendix F. Blueprint-to-Entity Contract Examples  
Appendix G. Validation Checklist  
Appendix H. Proof-of-Concept Checklist  
Appendix I. Glossary

# 1. Locked Gameplay Integration Identity

The Entity Gameplay Integration system is the contract layer between voxel-authored presentation and authoritative gameplay. It turns a model, rig and animation set into a world participant without allowing the visual asset to become the owner of movement, combat, AI, inventory or persistence.

## 1.1 Locked Rule

> Every gameplay-facing point on an entity must have a clear semantic role, owner, coordinate space, lifecycle, authority rule and fallback. A model may visually change, but stable gameplay contracts must remain inspectable and valid.

## 1.2 Integration Promise

A developer should be able to open any entity in the Forge and answer:

- What physical space does it occupy?
- Where can it be damaged?
- Which regions are weak, armoured, breakable or non-damaging?
- Where do attacks, projectiles, breath, tools and interactions originate?
- Where does it see, hear, smell, speak, carry, mount, harvest or drop loot from?
- Which terrain and navigation modes can it use?
- Which structure markers can it claim or interact with?
- Which parts remain important at lower LODs?
- What state persists when the full actor is unloaded?
- Which system owns each outcome?

## 1.3 What This System Is Not

- It is not a combat-stat editor.
- It is not a full AI behaviour-tree or utility-authoring system.
- It is not a replacement for navigation, physics or movement code.
- It is not a reason to create physics bodies for every voxel.
- It is not a scene-path convention that breaks when models are reorganised.
- It is not an excuse to simulate every NPC or creature at full detail everywhere.
- It is not a full Audio Forge or VFX Forge.

# 2. Player Decision Summary

| Area | Locked Decision |
| --- | --- |
| Core Architecture | Use semantic, data-driven integration definitions resolved through stable IDs. |
| Source Geometry | All visible entity geometry remains voxel-authored; runtime proxies may be simplified. |
| Movement Collision | One primary efficient movement body by default, with optional specialised environmental sub-colliders. |
| Combat Regions | Hurtboxes are separate from movement collision and grouped by meaningful anatomy or armour region. |
| Attack Volumes | Temporary authoritative volumes are activated by actions and animation events, never permanently attached as damaging colliders. |
| Weak Points | Weak points use explicit semantic regions and combat data references; visual colour alone is insufficient. |
| Breakable Parts | Parts may be disabled, broken, detached or phase-swapped through stable region IDs and fallback rigs. |
| Interaction | Dialogue, use, trade, mount, harvest, carry and work interactions use semantic anchors and bounded interaction volumes. |
| Perception | Sight, hearing, scent and magical sensing use explicit sensor profiles and origins. |
| Navigation | Each body family declares locomotion capabilities, footprint and route constraints. |
| Flight | Flying creatures use dedicated flight volumes, landing/perch markers and altitude rules rather than ground navigation alone. |
| Multi-Legged Bodies | Spiders, hexapods and centipedes use grouped contacts and procedural gait data rather than one gameplay collider per limb. |
| Segmented Bodies | Long bodies use a core movement representation plus grouped segment regions and LOD-aware follow data. |
| Blueprint Integration | Structures expose matching semantic markers for doors, beds, work, guards, nests, mounts, arenas and construction. |
| Simulation LOD | Rendering, animation, physics, AI and simulation detail are independent but coordinated. |
| Persistence | Stable entity records outlive loaded actors and preserve consequential state. |
| Multiplayer | Authoritative world validates movement, attacks, damage, interactions and AI. |
| Developer Overrides | Overrides are allowed but must preserve required semantic roles or supply explicit migrations and fallbacks. |
| POC | Demonstrate diverse body plans and at least three simulation tiers in one connected test world. |

# 3. Scope, Users and System Boundaries

## 3.1 Primary Users

| User | Responsibilities |
| --- | --- |
| Entity Artist/Designer | Aligns collision, regions and markers to approved voxel anatomy. |
| Gameplay Designer | Assigns semantic roles, damage-region meanings, interaction types and required contracts. |
| Animator | Places contact and action events that request gameplay windows. |
| AI Designer | Selects sensor, target and locomotion profiles that consume Forge markers. |
| Structure Designer | Places matching Blueprint Forge markers and validates entity access. |
| Programmer | Implements authoritative services that resolve and consume semantic definitions. |
| Technical Artist | Tunes generated proxies, LODs, debugging views and performance budgets. |
| QA/Reviewer | Runs integration scenarios and verifies that visuals, contacts and gameplay agree. |
| Future Mod Author | Adds namespaced definitions under compatibility and validation rules. |

## 3.2 Forge-Owned Data

The Forge owns or authors:

- Marker placement and semantic role.
- Collision-proxy source settings.
- Hurt-region shapes and bone or part bindings.
- Attack-origin sockets and preview volumes.
- Navigation profile references.
- Mount, cargo and tool attachment anchors.
- Blueprint marker compatibility declarations.
- LOD-preservation flags for important roles.
- Debug colours and editor descriptions.
- Source-to-baked alignment metadata.

## 3.3 Gameplay-Owned Data

Gameplay systems own:

- Current movement and velocity.
- Damage values and formulas.
- Team, faction and hostility.
- AI decisions and task selection.
- Inventory and equipment truth.
- Quest, reputation and relationship state.
- Status effects and conditions.
- Mount permissions and control.
- Taming, harvesting and loot outcomes.
- Boss phase truth.
- Save transactions and multiplayer authority.

## 3.4 Shared Contracts

A shared contract defines:

- Stable role ID.
- Expected transform or volume type.
- Required owner system.
- Whether the role is mandatory or optional.
- Compatibility by body family.
- Replication and persistence behaviour.
- LOD preservation requirement.
- Fallback when missing.

# 4. Integration Architecture Overview

The integration architecture is split into immutable definitions, persistent records, loaded runtime actors and temporary action state.

```text
Entity Definition
├── body_plan_id
├── presentation_profile_id
├── rig_profile_id
├── integration_profile_id
├── navigation_profile_id
├── sensor_profile_id
└── gameplay_definition_refs

Persistent Entity Record
├── stable_entity_id
├── definition_id
├── appearance_seed
├── equipment_state
├── health_and_injuries
├── job_or_ai_summary
├── relationship_and_ownership
├── world_location_summary
├── current_lod_state
└── consequential_history

Loaded Runtime Actor
├── baked voxel presentation
├── movement body
├── active hurt regions
├── resolved markers and sockets
├── animation and IK runtime
├── AI/movement controller
└── replicated local state

Temporary Action State
├── action_id
├── authoritative timing
├── active hit volumes
├── target locks
├── event deduplication
└── completion or interruption result
```

## 4.1 Definition Resolution

At load time, the registry resolves a compatible set of:

1. Entity gameplay definition.
2. Body-plan and presentation definition.
3. Rig and animation family.
4. Integration profile.
5. Navigation and sensor profiles.
6. Equipment and variant layers.
7. LOD products.

Invalid combinations fail validation before entering normal gameplay.

## 4.2 No Scene-Path Dependency

Gameplay code should not depend on paths such as:

```text
Dragon/Body/Neck/Head/MouthSocket
```

It should request:

```text
marker.ability.mouth_primary
```

The resolved marker may move to a different node or body part after a visual overhaul without changing gameplay code.

# 5. Entity Definition, Runtime Record and Actor Separation

## 5.1 Definition Data

Definitions are reusable and versioned. They describe what an entity type can support, not the current state of one individual.

Examples:

- A pig definition supports grazing, fleeing, harvesting and four-foot locomotion.
- A village blacksmith definition supports dialogue, tool use, workstation use and persistent equipment.
- A dragon boss definition supports multiple hurt regions, flight, breath origins, breakable wings and phase markers.

## 5.2 Persistent Runtime Record

Each important entity has a compact record that remains valid without a loaded scene actor. It stores only state that must persist or affect future simulation.

Persistent records should avoid storing direct node references, transient physics contacts or current animation time unless required for seamless short-range promotion.

## 5.3 Loaded Actor

The actor is a temporary runtime representation constructed from the persistent record and resolved definitions. It may be destroyed when the entity is demoted without implying that the entity died or ceased to exist.

## 5.4 Ephemeral Entities

Some ambient entities may use lightweight generated records and become persistent only after meaningful interaction, taming, naming, injury, quest binding or world consequence.

Promotion to persistence must be explicit and save-safe.

# 6. Stable IDs, Semantic Roles and Registry Contracts

## 6.1 ID Families

| ID Family | Example |
| --- | --- |
| Integration Profile | `integration.entity.dragon.standard` |
| Collision Profile | `collision.body.humanoid.medium` |
| Hurt Region | `hurtbox.anatomy.head` |
| Attack Volume | `hitbox.attack.bite.primary` |
| Marker | `marker.interaction.dialogue` |
| Sensor | `sensor.vision.predator_forward` |
| Navigation Profile | `nav.profile.spider_climber` |
| Mount Role | `socket.mount.rider_01` |
| Work Role | `marker.work.hammer_contact` |
| Loot Role | `marker.loot.drop_origin` |
| LOD Profile | `lod.simulation.persistent_npc` |
| Blueprint Marker | `blueprint.marker.job.blacksmith` |

## 6.2 Semantic Role Rules

A semantic role must be:

- Descriptive of function, not visual hierarchy.
- Stable across model revisions.
- Namespaced.
- Unique where uniqueness is required.
- Explicitly repeatable when multiple instances are valid.
- Documented with expected coordinate orientation.
- Tagged with mandatory, optional or conditional status.

## 6.3 Role Multiplicity

Roles may declare:

- Exactly one.
- Zero or one.
- One or more.
- Indexed set.
- Paired set.
- Repeated segment set.

Examples:

```text
marker.eye.primary                 exactly one
socket.hand.main                   zero or one
socket.arm.additional_01           indexed
marker.foot.contact.*              paired or repeated
hurtbox.segment.group_*            repeated grouped set
```

# 7. Voxel Source Alignment and Runtime Proxy Rules

## 7.1 Source-of-Truth Rule

The approved voxel model remains the visual source of truth. Integration proxies may simplify the source but must not meaningfully contradict its silhouette or player-facing contact points.

## 7.2 Allowed Runtime Proxies

- Capsule.
- Box.
- Sphere.
- Convex hull.
- Compound primitive set.
- Bone-bound primitive.
- Swept shape.
- Navigation footprint.
- Simplified segment chain.

## 7.3 Disallowed Defaults

- One collider per voxel.
- High-detail concave dynamic collision for ordinary moving entities.
- Hidden hurt regions far outside visible anatomy.
- Attack volumes that remain active outside the authorised action window.
- Client-created authoritative volumes.
- Marker positions that are visually detached from their source part without an explicit reason.

## 7.4 Alignment Tolerance

Profiles should define acceptable alignment tolerances by role. A dialogue anchor may tolerate small movement, while a sword-contact or weak-point region requires tighter visual agreement.

The Test Laboratory must show both voxel surface and proxy overlays simultaneously.

# 8. Collision Architecture

Collision is divided into distinct purposes so one shape does not attempt to solve every gameplay problem.

| Collision Type | Purpose | Typical Lifetime |
| --- | --- | --- |
| Movement Body | World movement, blocking and stepping. | Continuous while locally loaded. |
| Physical Contact Body | Optional body-part or vehicle contact. | Continuous or conditional. |
| Hurtbox | Receives damage queries. | Continuous while combat-relevant. |
| Attack Hitbox | Applies or requests hit results. | Temporary action window. |
| Interaction Volume | Allows contextual use or targeting. | Continuous or conditional. |
| Sensor Volume/Ray Origin | Perception and detection. | Scheduled or query-based. |
| Trigger Volume | Enters zones, nests, hazards or encounters. | World or entity-owned. |
| Navigation Footprint | Route clearance and local avoidance. | Continuous or abstract profile. |

## 8.1 Default Movement Representation

Most entities use one primary movement body aligned to the torso or overall mass. Limbs animate through it rather than controlling world collision independently.

Exceptions may include:

- Very large bosses with environmental body contacts.
- Vehicles or mounts with meaningful separate sections.
- Serpentine creatures that must block a long passage.
- Climbable colossal entities.
- Breakable constructs whose major sections become independent physics objects.

## 8.2 Physical Versus Semantic Contact

A dragon wing may have a hurt region without physically blocking every nearby object. A spider leg may place on terrain through IK without becoming a full dynamic physics limb. The system should use the least expensive representation that preserves intended gameplay.

# 9. Collision Layers, Masks and Broad-Phase Categories

## 9.1 Recommended High-Level Categories

- World solid.
- World one-way or climbable.
- Player body.
- Friendly NPC body.
- Creature body.
- Hostile body.
- Projectile.
- Hurt region.
- Attack query.
- Interaction query.
- Trigger and event zone.
- Water or fluid query.
- Navigation obstacle.
- Ragdoll or debris.
- Editor preview only.

## 9.2 Filtering Rule

Every volume should interact with the smallest valid category set. Broad-phase filtering should prevent irrelevant comparisons before detailed tests occur.

## 9.3 Team and Faction Filtering

Collision layers should not encode every faction. Combat authority applies team, ownership, permission and friendly-fire rules after the geometric query returns candidates.

## 9.4 Debug Visibility

Forge and runtime debug overlays should display categories with consistent colours and labels, with filters for:

- Movement.
- Hurt regions.
- Attack volumes.
- Interaction.
- Sensors.
- Navigation.
- Mounts.
- Work markers.
- LOD-preserved roles.

# 10. Movement Body, Footprint and Environmental Contact

## 10.1 Movement Profile Fields

| Field | Purpose |
| --- | --- |
| Body shape | Capsule, box, sphere, compound or custom proxy. |
| Radius/width | Horizontal clearance. |
| Height | Vertical clearance. |
| Footprint | Local avoidance and route planning shape. |
| Step height | Maximum ordinary ledge step. |
| Slope limit | Maximum stable ground angle. |
| Ground snap | Allowed distance to maintain grounded contact. |
| Crouch or fold profile | Alternate clearance state. |
| Turn radius | Required turning space. |
| Mass class | Physics and knockback category. |
| Push policy | Whether and how bodies displace each other. |
| Door class | Minimum opening profile. |
| Water displacement | Swimming and fluid interaction class. |

## 10.2 Humanoids

Humanoids generally use a capsule or rounded box centred near the pelvis and torso. Visual arms, equipment and hair do not expand movement collision unless an explicit gameplay reason exists.

Crouching, crawling or carrying oversized cargo may switch to a validated alternate profile.

## 10.3 Quadrupeds

Quadrupeds use an elongated body footprint, body-height clearance and turn-radius rules appropriate to size. Leg animation does not change the core footprint each frame.

## 10.4 Multi-Legged Creatures

Spiders and hexapods may appear wider than their core body. Navigation should use a stable clearance footprint based on intended traversal rather than the extreme animation spread of every leg.

## 10.5 Segmented Creatures

Centipedes and serpents use a head-led movement representation plus a simplified body occupancy strategy. Options include:

- Core capsule with non-blocking visual body for small creatures.
- Chain of grouped occupancy proxies for medium creatures.
- Route-reserved segment chain for giant creatures.
- Boss-specific environmental contact sections.

# 11. Hurtboxes and Damageable Regions

## 11.1 Hurtbox Purpose

Hurtboxes identify meaningful damage-receiving regions. They do not calculate final damage. They return semantic context to the combat system.

## 11.2 Region Classes

- Core body.
- Head.
- Torso or abdomen.
- Limb.
- Wing.
- Tail.
- Natural armour.
- Equipment-covered region.
- Weak point.
- Non-critical appendage.
- Breakable component.
- Invulnerable presentation region.

## 11.3 Region Data

A hurt region may declare:

- Stable region ID.
- Bound body part or semantic bone.
- Shape and local transform.
- Damage category tags.
- Multiplier profile reference.
- Armour coverage role.
- Reaction direction basis.
- Breakable-part reference.
- LOD merge target.
- UI targeting name.
- Whether projectiles can pass through after breakage.

## 11.4 Grouping Rule

Use the fewest regions needed for meaningful gameplay and readable feedback. A normal pig does not need individual toe hurtboxes. A dragon boss may justify head, chest, wings, legs and tail regions because each supports distinct mechanics.

## 11.5 LOD Merging

At reduced combat detail, small regions may merge into a parent region while preserving the entity's total valid damage response. Critical weak points required by current gameplay must remain available or the encounter must not demote to that LOD.

# 12. Attack Hitboxes and Action Volumes

## 12.1 Authoritative Window Rule

Attack volumes become active only when an authoritative action opens a validated window. Animation events may request or label the window, but the combat system owns the final timing.

## 12.2 Volume Types

- Swept weapon arc.
- Limb-bound shape.
- Bite or claw volume.
- Tail sweep.
- Wing strike.
- Charge body volume.
- Projectile spawn origin and path.
- Breath cone or sampled volume.
- Area pulse.
- Ground impact ring.
- Grab or capture volume.

## 12.3 De-Duplication

Each action instance needs a hit ledger so the same target is not damaged repeatedly by overlapping frames unless the action explicitly allows repeated ticks.

## 12.4 Visual Agreement

Attack previews should display the animated voxel part and active volume together. The dangerous period must match readable anticipation, contact and recovery.

## 12.5 Scale and Reach Modifiers

Scaled entity variants should not blindly scale attack range. Each family defines allowed scaling rules and clamps. Large boss variants may use authored attack profiles rather than automatic proportional scaling.

# 13. Weak Points, Armour Regions and Damage Multipliers

## 13.1 Weak-Point Rules

Weak points should be:

- Visually readable by shape, placement, animation or repeated feedback.
- Semantically stable.
- Large enough to target under supported input methods.
- Compatible with camera and accessibility options.
- Preserved at relevant LODs.
- Optional or simplified under accessibility settings where appropriate.

## 13.2 Armour Coverage

Equipment presentation defines coverage mapping, while combat definitions own armour values. A helmet may cover `hurtbox.anatomy.head`, but the inventory and combat systems decide whether it is equipped, intact and protective.

## 13.3 Natural Armour

Chitin, scales, stone plates and magical shells use the same semantic region approach as worn armour, allowing damage states and breakable presentation to layer consistently.

## 13.4 Feedback Without Colour Dependence

Weak points should not rely only on colour. Shape, cracks, emission patterns, animation, sound hooks, target indicators or reaction differences may provide additional cues.

# 14. Breakable, Disableable and Severable Body Parts

## 14.1 Part Outcomes

A region may be:

- Cosmetically damaged.
- Functionally impaired.
- Disabled.
- Broken but attached.
- Detached as debris.
- Replaced by a phase-specific model.
- Regenerated.
- Permanently lost for a persistent entity.

## 14.2 Gameplay Ownership

The combat or boss system decides when a threshold is reached. The Forge supplies:

- Region mapping.
- Replacement or hidden presentation.
- Alternate rig and animation compatibility.
- Debris origin.
- Socket remapping.
- LOD fallback.

## 14.3 Examples

### Dragon Wing

Breaking a wing may:

- Remove or restrict flight.
- Change landing and movement actions.
- Swap to damaged wing voxel geometry.
- Merge the wing hurtbox into a disabled region.
- Preserve a stump or broken-bone marker.

### Construct Arm

Destroying a golem arm may:

- Disable a tool or attack socket.
- Drop a recoverable component.
- Switch animation masks.
- Change work capability.

### Centipede Segments

Segments should usually be grouped into regions rather than severed individually. Boss variants may support authored section breaks with new head or tail endpoints.

# 15. Interaction Volumes and Context Anchors

## 15.1 Interaction Categories

- Dialogue.
- Trade.
- Inspect.
- Recruit.
- Pet or comfort.
- Feed.
- Tame.
- Mount.
- Harvest.
- Carry.
- Revive.
- Loot.
- Use tool on entity.
- Quest handoff.
- Heal or repair.

## 15.2 Anchor Requirements

An interaction anchor defines:

- Semantic role.
- Prompt origin.
- Facing target.
- Preferred approach point.
- Maximum range.
- Allowed angle.
- Height adjustment.
- Animation profile.
- Multiplayer reservation policy.
- Fallback if obstructed.

## 15.3 Large Entities

Large creatures may have multiple interaction anchors, such as:

- Head for feeding.
- Saddle for mounting.
- Side access for cargo.
- Injured limb for treatment.
- Core for repair.

The UI should select the most contextually appropriate valid anchor.

# 16. AI Perception Origins and Sensor Profiles

## 16.1 Sensor Types

- Vision.
- Hearing.
- Scent or trail.
- Vibration.
- Magical detection.
- Heat or life detection.
- Faction awareness.
- Shared group alert.

## 16.2 Vision Profile

A vision profile may define:

- Eye origin roles.
- Forward basis.
- Horizontal and vertical field of view.
- Near and far range.
- Light sensitivity.
- Occlusion policy.
- Peripheral awareness.
- Tracking frequency by LOD.
- Special modes such as night vision.

## 16.3 Hearing

Hearing generally uses one central origin and gameplay-generated sound events. The future Audio Forge may create audible presentation, but AI hearing consumes semantic gameplay noise events rather than analysing rendered audio.

## 16.4 Scent and Vibration

These are abstract gameplay sensors. The Forge supplies suitable body origins and debug display; the ecology or AI system owns trail generation and detection logic.

## 16.5 Sensor Damage

Specific sensors may be disabled through breakable regions if gameplay requires it, such as blinding a boss or damaging a construct's detection crystal.

# 17. Navigation Profiles and Locomotion Capabilities

## 17.1 Navigation Capability Tags

- Ground walk.
- Ground run.
- Jump.
- Step or mantle.
- Climb wall.
- Climb ceiling.
- Crawl.
- Burrow.
- Swim surface.
- Swim volume.
- Fly.
- Hover.
- Glide.
- Perch.
- Use door.
- Use ladder.
- Use lift.
- Use portal.
- Follow road.
- Form caravan.
- Use workstation.

## 17.2 Profile Fields

| Field | Meaning |
| --- | --- |
| Locomotion modes | Supported movement domains. |
| Footprint and height | Route-clearance dimensions. |
| Step and slope | Ground traversal limits. |
| Turn radius | Minimum manoeuvring space. |
| Preferred terrain | Roads, open ground, forest, cave, water, air. |
| Avoidance class | Personal space and crowd behaviour. |
| Door and passage class | Compatible openings and structure routes. |
| Formation slot | Herd, patrol, caravan or raid spacing. |
| Hazard tolerances | Lava, water, sunlight, wards or corruption. |
| Transition markers | Valid take-off, landing, climb or portal anchors. |

## 17.3 Capability Versus Current State

A dragon may support flight but currently be unable to fly due to injury, weather, enclosure or boss phase. The navigation profile declares capability; runtime state determines availability.

# 18. Ground, Climb, Swim, Burrow and Flight Integration

## 18.1 Ground Movement

Ground movement uses navigation paths plus local steering, step validation, slope checks and dynamic obstacle avoidance.

## 18.2 Climbing

Climbers need:

- Climbable surface categories.
- Body clearance.
- Contact orientation rules.
- Transition anchors between ground, wall and ceiling.
- Animation and IK support.
- Safe fallback if contact is lost.

Spiders may use broad procedural contact rather than individual physics feet.

## 18.3 Swimming

Swimming profiles define:

- Buoyancy or depth preference.
- Body orientation.
- Water-entry and exit anchors.
- Surface versus volume navigation.
- Breath or oxygen needs where applicable.
- Current resistance and turn limits.

## 18.4 Burrowing

Burrowing should be limited to explicitly supported terrain and use abstract or staged block interaction. The model may disappear below the surface, but world edits and tunnel creation remain owned by terrain systems.

## 18.5 Flight

Flying creatures require:

- Air-navigation volume or flight graph.
- Minimum clearance and turn radius.
- Take-off commitment rules.
- Landing and perch markers.
- Altitude bands.
- Obstacle avoidance.
- Glide and hover capability.
- Grounded fallback.
- Wing-damage restrictions.

Birds, bats, wyverns and dragons may share principles but use different profiles.

# 19. Terrain Contact, IK Targets and Surface Adaptation

## 19.1 Contact Markers

Contact markers provide desired foot, claw, hand, wing-tip, tail or body points for animation and diagnostics. They do not need full colliders.

## 19.2 IK and Gameplay Separation

IK improves presentation and contact alignment. It does not authoritatively determine whether an entity is standing on valid ground. Movement and physics systems own grounded state.

## 19.3 Multi-Legged Contacts

Procedural gait systems may query multiple contact targets, but updates should be staggered and prioritised. Distant creatures can reduce active contacts while preserving body motion.

## 19.4 Surface Reactions

Contact may expose semantic surface data for:

- Footstep event hooks.
- Dust or splash hooks.
- Slipping.
- Tracks.
- Harvest or digging actions.
- Damage from hazards.

Full audio and VFX creation remain deferred.

# 20. AI Behaviour Integration and Semantic Targets

## 20.1 Target Roles

AI should target semantic concepts rather than arbitrary transform names:

- Entity core.
- Head or weak point.
- Dialogue anchor.
- Workstation use point.
- Food source.
- Threat origin.
- Guard position.
- Escape point.
- Mount seat.
- Nest entrance.
- Storage access.
- Repair region.

## 20.2 Behaviour Ownership

The Forge does not define why a wolf attacks, why a villager works or why a dragon retreats. It defines valid spatial roles that the AI profile can request.

## 20.3 Query Fallbacks

If a preferred marker is unavailable, the contract may define a fallback chain:

```text
marker.attack.weakpoint_head
→ marker.target.combat_core
→ entity_world_origin_adjusted
```

Fallbacks must be explicit and safe.

## 20.4 Reservation

Work points, seats, beds, interaction anchors and narrow approach positions may require reservation so multiple AI agents do not occupy the same role simultaneously.

# 21. NPC Work, Social and Village Markers

## 21.1 Work Markers on Entities

Entities may expose:

- Main-hand tool socket.
- Off-hand support socket.
- Carry origin.
- Shoulder carry anchor.
- Back carry anchor.
- Hammer or tool contact point.
- Look-at target.
- Handover origin.
- Construction placement origin.

## 21.2 Matching Structure Markers

Blueprint Forge workstations expose matching roles:

- Approach point.
- Stand or sit position.
- Tool target.
- Input storage.
- Output storage.
- Safety clearance.
- Animation family.
- Job capability tag.

## 21.3 Social Markers

NPC social interactions may use:

- Conversation spacing.
- Facing targets.
- Group-circle positions.
- Seating points.
- Trade handover.
- Celebration or mourning formations.

## 21.4 Construction

Builder interactions should align tool contacts and resource handoffs with blueprint construction anchors while the project system owns progress and resource consumption.

# 22. Equipment, Carrying, Tool and Inventory Anchors

## 22.1 Equipment Sockets

Equipment sockets are defined semantically and may be remapped by body family:

- Main hand.
- Off hand.
- Additional hands.
- Back.
- Hip left/right.
- Head.
- Chest.
- Shoulder.
- Tail equipment.
- Saddle.
- Cargo side.

## 22.2 Carry Profiles

Carryable objects define compatible profiles such as:

- One-hand small.
- Two-hand long.
- Shoulder load.
- Crate carry.
- Drag.
- Pack animal cargo.
- Suspended or magical carry.

## 22.3 Gameplay Truth

Inventory decides what is held and whether carrying is allowed. The Forge supplies compatible pose, socket and clearance metadata.

## 22.4 Dropped and Looted Items

Drop origins should prevent objects appearing inside the floor or an entity's core. Large creatures may use multiple loot origins or a bounded drop zone.

# 23. Mounts, Riders, Passengers, Cargo and Towing

## 23.1 Mount Roles

A mount definition may include:

- Primary rider seat.
- Passenger seats.
- Saddle attachment.
- Reins or control anchors.
- Rider foot targets.
- Cargo positions.
- Dismount zones.
- Mount interaction point.

## 23.2 Rider Compatibility

Rider and mount profiles declare compatibility by:

- Body family.
- Seat scale.
- Leg spread range.
- Hand target availability.
- Animation family.
- Equipment conflicts.
- Camera profile.

## 23.3 Authority

The mount system owns mounting permission, movement control, seat reservation and dismount validation. The Forge owns spatial alignment and preview.

## 23.4 Towing

Towing uses hitch roles, maximum connection count, clearance and rope or rigid-link profile references. Physics or movement code owns the actual constraint.

# 24. Loot, Corpse, Harvesting and Taming Anchors

## 24.1 Corpse Representation

Death may produce:

- Persistent body actor.
- Simplified corpse model.
- Loot container record.
- Harvestable remains.
- Immediate drops.
- Dissolution or magical remnant.

The creature definition chooses allowed modes; world settings and gameplay determine final behaviour.

## 24.2 Harvest Regions

Harvesting may use semantic regions such as:

- Hide.
- Meat.
- Horn.
- Chitin.
- Venom gland.
- Mana core.
- Mechanical core.
- Trophy part.

These regions need not remain separate physics objects after death.

## 24.3 Taming and Feeding

Taming interactions use safe approach, feeding and contact anchors. AI state determines whether those interactions are currently allowed.

## 24.4 Persistent Injury and Care

Named animals, mounts and NPCs may retain injuries. Treatment anchors allow healing or repair animations to align to affected regions.

# 25. Projectiles, Breath, Area Attacks and Ability Origins

## 25.1 Origin Roles

- Hand cast.
- Staff or focus tip.
- Mouth or beak.
- Eye.
- Chest core.
- Tail stinger.
- Weapon muzzle.
- Wing or claw.
- Ground impact.
- Orbiting attachment.

## 25.2 Orientation

Every origin declares forward and up bases. Mirrored or additional limbs must resolve consistent orientations.

## 25.3 Breath Attacks

Breath profiles may use:

- Cone query.
- Swept capsule samples.
- Projectile stream.
- Ground trail.
- Area cloud request.

The Forge previews the volume; the ability system owns timing, damage and spawned gameplay objects.

## 25.4 Area Effects

Area abilities should anchor to stable roles even if the visual body changes. For example, a mana pulse may originate from `marker.ability.core_primary` across multiple golem variants.

# 26. Bosses, Multi-Part Encounters and Arena Contracts

## 26.1 Boss Integration Profile

A boss may require:

- Multiple targetable regions.
- Breakable armour.
- Phase-specific markers.
- Arena interaction anchors.
- Climbable or mountable surfaces.
- Camera and lock-on targets.
- Multiple attack origins.
- Summon or spawn anchors.
- Safe LOD lock while encounter is active.

## 26.2 Targetable Parts

Targetable parts need stable UI names, health or threshold ownership, accessibility support and fallback targets.

## 26.3 Arena Contracts

Blueprint Forge boss arenas may expose:

- Boss spawn and return anchor.
- Player entry points.
- Phase positions.
- Perch or landing sites.
- Breakable environment roles.
- Hazard zones.
- Camera interest points.
- Exit and recovery zones.

## 26.4 Encounter LOD

An active boss encounter must not demote to an LOD that removes required regions, attack origins or navigation capability. Encounter state can pin a minimum detail level.

# 27. Blueprint Forge and Structure Marker Integration

## 27.1 Shared Semantic Language

Entity and Blueprint Forge use compatible marker roles so entities can consume structures without bespoke code per building.

Examples:

```text
Entity capability: capability.job.blacksmith
Structure marker: blueprint.marker.job.blacksmith

Entity capability: capability.rest.bed_humanoid
Structure marker: blueprint.marker.rest.bed_humanoid

Entity capability: capability.perch.medium_bird
Structure marker: blueprint.marker.perch.medium_bird
```

## 27.2 Structure Marker Categories

- Entrance and exit.
- Door use.
- Bed and seat.
- Workstation.
- Storage.
- Guard and patrol.
- Dialogue and gathering.
- Mount and hitch.
- Nest and den.
- Perch and landing.
- Spawn and despawn.
- Construction and repair.
- Boss arena.
- Portal and transport.

## 27.3 Clearance Validation

The Blueprint Forge should validate marker clearance using selected entity profiles, including:

- Body footprint.
- Height.
- turn radius.
- approach direction.
- animation envelope.
- carried equipment.
- mount or passenger envelope.

## 27.4 Dynamic Structure States

Damaged, upgraded or blocked structures may invalidate markers. The structure system must publish availability changes so AI can release reservations and choose alternatives.

# 28. Simulation LOD Architecture

Simulation LOD determines how much of an entity's behaviour is calculated, not merely how it is drawn.

## 28.1 Independent LOD Axes

| Axis | Controls |
| --- | --- |
| Rendering LOD | Mesh, material, shadow and visibility detail. |
| Animation LOD | Clip update rate, IK, procedural layers and face animation. |
| Physics LOD | Collider detail, rigid bodies and query frequency. |
| AI LOD | Perception, planning, steering and decision frequency. |
| Simulation LOD | Needs, jobs, travel, combat, inventory, relationships and world consequences. |
| Network LOD | Replication frequency and state detail per client relevance. |

## 28.2 Coordination Rule

These axes may differ, but required gameplay contracts must remain valid. An invisible distant NPC may still be simulated abstractly. A visible boss must retain full combat regions even if some cosmetic animation layers are reduced.

## 28.3 Importance Inputs

LOD selection may consider:

- Distance to any player.
- Camera visibility.
- Current combat or interaction.
- Quest relevance.
- Named or persistent importance.
- Village role.
- Boss or elite status.
- Mount ownership.
- Recent damage or event.
- Network ownership.
- Performance pressure.

# 29. Promotion, Demotion and Actor Reconstruction

## 29.1 Promotion

Promotion creates or upgrades a runtime actor from a persistent or abstract record. It must restore:

- Stable identity.
- Approved appearance and equipment.
- Health, injuries and status.
- Position and orientation or valid reconstruction anchor.
- Current job, travel or encounter context.
- Required reservations.
- Relationship and ownership state.

## 29.2 Demotion

Demotion commits authoritative local state to the persistent record before reducing or destroying the actor.

It must not lose:

- Inventory transactions.
- Damage and death.
- Taming or ownership.
- Quest bindings.
- Job progress.
- Current travel destination.
- Reserved project resources.
- Major emotional or reputation events.

## 29.3 Safe Reconstruction

If the exact prior position is invalid when reloaded, the system chooses a validated reconstruction anchor based on:

- Last valid navigation point.
- Home or job marker.
- Travel route node.
- Settlement entrance.
- Nest or den.
- Encounter fallback.

The relocation should be recorded when consequential.

## 29.4 Transition Hysteresis

Use distance and time hysteresis to prevent repeated promotion and demotion when a player hovers near a boundary.

# 30. Nearby, Medium, Distant and Unloaded Simulation

## 30.1 Tier 0 - Full Interactive

Used near active players or during important encounters.

Includes:

- Full local actor.
- Detailed movement and collision.
- Active hurt and attack regions.
- Frequent perception and AI.
- Full relevant animation.
- Exact inventory and interaction.

## 30.2 Tier 1 - Reduced Local

Used within the broader loaded area.

May reduce:

- IK and secondary animation.
- Sensor query frequency.
- Local avoidance detail.
- Non-critical hurt regions.
- Social and idle decisions.

Core combat and interaction remain available if engagement begins.

## 30.3 Tier 2 - Abstract Regional

Used for distant but active settlements, herds, caravans or factions.

Represents entities through:

- Location node or region.
- Schedule phase.
- Job or travel task.
- Health and risk summary.
- Inventory totals or reserved items.
- Group membership.
- Event probabilities and deterministic ticks.

## 30.4 Tier 3 - Dormant Persistent

Used when no meaningful processing is required.

Stores compact persistent state and next scheduled evaluation. It does not run full AI, movement or physics.

## 30.5 Tier 4 - Ephemeral Population Summary

Ambient populations may exist as biome or region counts until promoted into individual entities. Promotion rules must avoid duplicating harvested, killed, tamed or quest-bound individuals.

# 31. Independent Rendering, Animation, Physics, AI and Simulation LOD

## 31.1 Example Combinations

| Scenario | Render | Animation | Physics | AI | Simulation |
| --- | --- | --- | --- | --- | --- |
| Nearby player NPC | Full | Full | Full | Full | Full |
| Visible distant villager | Reduced | Reduced | Simple | Reduced | Local summary |
| Hidden village resident | None | None | None | Abstract | Regional |
| Nearby ambient flock | Reduced instanced | Shared/staggered | Minimal | Group steering | Local group |
| Active dragon boss | Full | Full | Full | Full | Full and pinned |
| Distant named caravan | None | None | None | Route tick | Persistent regional |

## 31.2 Minimum Contract Preservation

Each LOD product declares which roles remain resolvable. Required UI, targeting or quest roles cannot disappear while the relevant feature is active.

# 32. Crowds, Swarms, Herds and Segmented-Body Optimisation

## 32.1 Crowds

Villager crowds should use:

- Shared animation families.
- Staggered AI updates.
- Simplified avoidance.
- Group destinations.
- Reduced facial and equipment updates.
- Abstract social interactions outside focus.

## 32.2 Herds and Flocks

Groups may share:

- Leader or centroid steering.
- Threat state.
- Destination.
- Migration path.
- LOD selection.

Individuals still become persistent when tamed, injured, named or quest-bound.

## 32.3 Swarms

Small insects, wisps or minions may use a swarm actor with representative visuals and a group health or count model, unless individual combat is important.

## 32.4 Segmented Giants

Centipedes, worms and long dragons should use:

- Head or core authoritative movement.
- Follow-chain transforms.
- Grouped collision proxies.
- Grouped hurt regions.
- Reduced contact solving at distance.
- Section-based damage rather than per-segment state by default.

# 33. Persistence, Saves and World-State Evidence

## 33.1 Persistent Identity

Named NPCs, player-linked mounts, bosses, quest entities, settlement residents and meaningfully altered creatures should retain stable IDs.

## 33.2 Minimum Persistent Fields

- Definition ID.
- Entity ID.
- Appearance seed and local overrides.
- Current region or anchor.
- Health and persistent injuries.
- Equipment and inventory summary.
- Ownership, faction and relationships.
- Job, home, nest or route.
- Current abstract task.
- Important cooldowns or phase state.
- Consequential history flags.
- Last simulation timestamp.

## 33.3 World Evidence

Death, migration, taming, injury, boss defeat, broken parts, theft, rescue and village events should leave appropriate persistent evidence even after actors unload.

## 33.4 Definition Migration

If an integration profile changes, migration must map old region and marker IDs to new roles or defined fallbacks. Silent loss of a quest target, mount seat or persistent injury is unacceptable.

# 34. Multiplayer Authority, Replication and Prediction

## 34.1 Authority Rule

The authoritative world owns:

- Movement acceptance.
- AI state.
- Interaction reservation.
- Attack-window activation.
- Hit validation.
- Damage and death.
- Inventory and loot.
- Mount state.
- Promotion and demotion.
- Persistent record commits.

## 34.2 Client Responsibilities

Clients may:

- Render resolved voxel assets.
- Interpolate movement.
- Predict approved local movement.
- Play responsive animation.
- Preview interaction prompts.
- Display debug data when authorised.

Clients do not create authoritative damage or persistent outcomes.

## 34.3 Relevance

Replication relevance may use distance, visibility, ownership, party state, quest relevance and active combat. A player's mount or quest target may remain more relevant than an unrelated nearby ambient creature.

## 34.4 Hit Validation

For latency-sensitive combat, the server may use bounded rewind or authoritative timing policies, but the semantic hurt and attack roles remain the same.

## 34.5 LOD Consistency

A server may simulate an entity at a higher or different detail than a client renders. Replicated state must not depend on a client possessing every local collider or AI detail.

# 35. Forge Authoring Workflow and Automatic Suggestions

## 35.1 Standard Workflow

```text
Open approved voxel entity
→ resolve body plan and rig
→ choose integration template
→ generate initial movement proxy
→ generate suggested hurt regions
→ place semantic markers and sockets
→ assign navigation and sensor profiles
→ declare Blueprint Forge capabilities
→ configure LOD preservation
→ run Test Laboratory scenarios
→ review warnings and overrides
→ approve and bake runtime products
```

## 35.2 Automatic Suggestions

The Forge may analyse voxel volume and semantic body roles to suggest:

- Movement body.
- Ground footprint.
- Head and torso hurt regions.
- Limb groups.
- Eye and mouth origins.
- Hand, foot and tool contacts.
- Nameplate and dialogue anchors.
- Loot origin.
- Rider seat.
- Navigation profile candidates.
- LOD merge groups.

Suggestions remain editable and must be visibly marked as unapproved until reviewed.

## 35.3 Template Library

Templates should include at minimum:

- Standard humanoid.
- Four-armed humanoid.
- Compact quadruped/pig.
- Canine quadruped.
- Spider.
- Hexapod.
- Segmented crawler.
- Bird.
- Bat.
- Wyvern.
- Dragon.
- Aquatic body.
- Floating entity.
- Golem.

## 35.4 Dependency View

Before changing or deleting a marker or region, the Forge shows dependent:

- Animations.
- Abilities.
- AI profiles.
- Equipment.
- Blueprints.
- Quests.
- Boss encounters.
- Runtime LOD products.

# 36. Test Laboratory, Validation and Diagnostics

## 36.1 Test Environments

- Flat ground.
- Slopes and stairs.
- Narrow doors and corridors.
- Forest obstacles.
- Cave walls and ceilings.
- Water volume.
- Flight arena.
- Perches and landing pads.
- Village home and workstation.
- Combat arena.
- Mount test lane.
- Boss arena.
- Construction site.

## 36.2 Integration Tests

The laboratory should test:

- Collision clearance.
- Step and slope traversal.
- Door compatibility.
- Turn radius.
- Hurt-region alignment.
- Attack-window alignment.
- Weak-point accessibility.
- Marker orientation.
- Interaction approach.
- Sensor origin and occlusion.
- Mount and passenger fit.
- Workstation contact.
- Blueprint path reachability.
- LOD transitions.
- Save and reload reconstruction.
- Multiplayer authority scenarios.

## 36.3 Diagnostic Overlays

Selectable overlays include:

- Movement body.
- Hurt regions.
- Active attack volumes.
- Sensor cones and ranges.
- Navigation footprint.
- Contact points.
- Interaction ranges.
- Reserved markers.
- Blueprint compatibility.
- Current LOD axes.
- Replication relevance.
- Persistent record summary.

## 36.4 Validation Severity

| Severity | Meaning |
| --- | --- |
| Info | Recommendation or optimisation opportunity. |
| Warning | Asset may work but has risk, inconsistency or missing optional data. |
| Error | Required gameplay contract is invalid; normal approval is blocked. |
| Critical | Could corrupt state, break authority, lose persistence or cause unsafe runtime behaviour. |

# 37. Readability, Accessibility and Player Trust

## 37.1 Combat Readability

Damageable and dangerous regions should correspond to visible anatomy and animation. Players should not be struck by volumes that are clearly detached from the attack.

## 37.2 Interaction Trust

Prompts should appear near the relevant anchor, and the entity should orient or animate toward the same contact point where practical.

## 37.3 Targeting Assistance

Supported options may include:

- Larger weak-point selection bounds without changing physical visuals.
- Lock-on cycling by semantic region.
- Aim slowdown.
- High-contrast target markers.
- Reduced rapid target switching.
- Simplified boss-part targeting.

## 37.4 Debugging Player Reports

Runtime diagnostics should be able to record semantic IDs and action instances so issues such as invisible hits, unreachable workstations or broken mount seats can be reproduced.

# 38. Performance Budgets and Scalability Rules

## 38.1 Budget Principles

- Use one movement body for ordinary entities.
- Limit continuous dynamic rigid bodies.
- Group small hurt regions.
- Activate attack volumes only during required windows.
- Stagger perception and IK queries.
- Disable unnecessary interaction volumes at distance.
- Merge segmented-body proxies at reduced LOD.
- Abstract distant AI and inventory activity.
- Profile packaged builds, not editor-only results.

## 38.2 Suggested First-Pass Complexity Bands

| Entity Class | Movement Proxies | Hurt Regions | Active Attack Volumes | Continuous Sensors | Notes |
| --- | ---: | ---: | ---: | ---: | --- |
| Ambient Small | 1 | 1 | 0-1 | 0-1 scheduled | Prefer group simulation. |
| Standard NPC | 1 | 3-6 | 0-2 temporary | 1-2 scheduled | Equipment should not multiply bodies. |
| Standard Creature | 1 | 2-6 | 0-3 temporary | 1-2 scheduled | Use family templates. |
| Multi-Legged | 1 core | 2-5 grouped | 0-2 temporary | 1-2 scheduled | Legs are contacts, not full physics. |
| Segmented Creature | 1-5 grouped | 2-8 grouped | 0-3 temporary | 1-2 scheduled | Scale by gameplay importance. |
| Mount/Elite | 1-3 | 4-10 | 0-4 temporary | 1-3 scheduled | Preserve rider and weak-point roles. |
| Boss | Authored | 6-20 meaningful | Authored temporary | Authored | Encounter pins minimum detail. |

These are guidance, not permanent hard caps. Measured performance and gameplay value determine final limits.

## 38.3 Update Scheduling

Expensive systems should support:

- Distance bands.
- Visibility checks.
- Staggered ticks.
- Event-driven wake-up.
- Group updates.
- Time slicing.
- Hard per-frame budgets.

# 39. Overrides, Compatibility, Migration and Deprecation

## 39.1 Allowed Overrides

Developers may override:

- Proxy shapes.
- Region placement.
- Marker transforms.
- Profile references.
- LOD merge groups.
- Debug metadata.

## 39.2 Protected Contracts

An override cannot silently remove a mandatory role used by approved gameplay content. It must:

- Preserve the role.
- Supply a compatible replacement.
- Provide an explicit migration.
- Or deprecate dependent content through a reviewed change.

## 39.3 Compatibility Grades

| Grade | Meaning |
| --- | --- |
| Exact | All required roles and dimensions match. |
| Compatible | Roles match within approved tolerances. |
| Adapted | Requires remapping or adjusted profiles but passes tests. |
| Conditional | Works only for specific variants or states. |
| Incompatible | Cannot safely use the referenced gameplay contract. |

## 39.4 Deprecation

Deprecated IDs remain resolvable through migration aliases for the required support window. The dependency graph should identify remaining users before removal.

# 40. Proof-of-Concept Scope

The POC must demonstrate that one shared integration architecture supports very different voxel body plans.

## 40.1 Required Entities

### Player Humanoid

- Movement capsule and crouch profile.
- Head, torso and limb hurt regions.
- Main/off-hand sockets.
- Interaction and camera anchors.
- Tool and weapon attack origins.
- Multiplayer-safe action windows.

### Village NPC Builder

- Dialogue, carrying and tool anchors.
- Workstation and construction marker compatibility.
- Persistent identity and inventory summary.
- Full, reduced and abstract simulation tiers.

### Pig

- Quadruped footprint.
- Head/body hurt regions.
- Feeding, taming and harvesting anchors.
- Herd/group LOD.

### Spider

- Wide navigation profile.
- Procedural contact markers.
- Bite volume.
- Vision and vibration sensors.
- Optional climb transition.

### Giant Centipede

- Repeated segment body.
- Grouped occupancy and hurt regions.
- Wave locomotion.
- Head attack origin.
- Reduced segment LOD.

### Bird

- Ground footprint.
- Flight navigation.
- Take-off, landing and perch contracts.
- Flock LOD.

### Dragon Boss

- Ground and flight profiles.
- Multiple hurt regions and weak points.
- Breakable wings.
- Bite, claw, tail and breath origins.
- Boss arena marker compatibility.
- Encounter-pinned LOD.

## 40.2 Required Structure Tests

- Humanoid doorway and stairs.
- NPC bed and workstation.
- Pig pen and feeding point.
- Spider cave or wall transition.
- Bird perch.
- Dragon landing arena.
- Boss phase anchors.

## 40.3 Required LOD Tests

- Full actor near player.
- Reduced local actor at medium range.
- Abstract persistent record at distance.
- Save, unload, simulated time advance and reconstruction.

# 41. Staged Implementation Plan

## Stage 1 - Semantic Contract Foundation

Deliver:

- Stable role registry.
- Integration profile resource.
- Marker and volume definitions.
- Debug overlays.
- Mandatory-role validation.

## Stage 2 - Humanoid Runtime Integration

Deliver:

- Movement body.
- Hurt regions.
- hand, camera, dialogue and tool anchors.
- Temporary melee hit volume.
- Blueprint doorway and workstation test.

## Stage 3 - Standard Creature Profiles

Deliver:

- Pig/quadruped template.
- Spider/multi-legged template.
- Sensor and navigation profiles.
- Feeding, harvesting and creature attack roles.

## Stage 4 - Segmented and Flying Profiles

Deliver:

- Centipede grouped chain.
- Bird flight, landing and perch integration.
- LOD-aware contact reduction.

## Stage 5 - Boss and Breakable Regions

Deliver:

- Dragon boss profile.
- Multi-part targeting.
- Breakable wings.
- Breath and arena contracts.
- Encounter LOD pinning.

## Stage 6 - Persistent Simulation LOD

Deliver:

- Persistent entity records.
- Promotion and demotion.
- Reduced local and abstract regional simulation.
- Save/reload reconstruction.

## Stage 7 - Multiplayer and Authority Validation

Deliver:

- Authoritative action windows.
- Replicated role resolution.
- Interaction reservations.
- Relevance and network LOD.
- Desync diagnostics.

## Stage 8 - Production Tooling

Deliver:

- Automatic suggestions.
- Dependency graph integration.
- Batch validation.
- Migration tooling.
- Template library.
- Packaged-build performance tests.

# 42. Definition of Done and Acceptance Criteria

The system reaches Version 0.1 design acceptance when:

- Every required entity uses voxel-authored source geometry.
- Movement, hurt, attack, interaction, sensor and navigation roles are distinct.
- Gameplay code resolves semantic roles without depending on model scene paths.
- Attack volumes are authoritative, temporary and de-duplicated.
- Weak points and damage regions align with visible anatomy.
- NPCs can use Blueprint Forge work, bed and doorway markers.
- Mount and equipment anchors remain stable across approved variants.
- Spider, centipede, bird and dragon profiles demonstrate non-humanoid support.
- At least three simulation tiers preserve identity and consequential state.
- Promotion and demotion do not duplicate, lose or invent inventory, damage or quest state.
- Active boss encounters preserve required integration detail.
- Multiplayer authority is explicit for movement, hits, interactions and persistence.
- Developer overrides expose dependencies and migration requirements.
- The Test Laboratory validates alignment, clearance, LOD and reconstruction.
- Full Audio Forge and VFX Forge remain deferred without blocking future attachment hooks.

# 43. Open Questions and Deferred Features

## 43.1 Questions for Later Implementation

- Exact physics engine shape limits and runtime generation costs in the selected Godot version.
- Whether all humanoid melee uses sampled swept volumes or a hybrid of authored shapes and weapon traces.
- Final server rewind policy for online combat.
- Maximum persistent individual creature density per region.
- Exact promotion distance and hysteresis by hardware profile.
- Whether climbable colossal bosses are required before post-POC production.
- How far full limb severing should extend beyond bosses and constructs.
- Final representation of large aquatic creatures and ships.
- Whether burrowing creates real tunnels or mostly uses staged emergence markers.

## 43.2 Deferred Systems

- Full Audio Forge.
- Full particle and VFX Forge.
- Advanced soft-body voxel simulation.
- Universal ragdoll support for every body family.
- Fully destructible per-voxel anatomy.
- Large-scale cinematic authoring.
- Machine-learning behaviour generation.
- Unbounded physics simulation for distant entities.

# Appendix A. Entity Gameplay Integration Data Template

```text
integration_profile_id
version
body_plan_id
rig_profile_id
presentation_compatibility
movement_body_profile
physical_contact_profiles[]
hurt_regions[]
attack_origin_roles[]
interaction_anchors[]
sensor_profile_id
navigation_profile_id
terrain_contact_roles[]
equipment_socket_contracts[]
mount_roles[]
work_capabilities[]
blueprint_marker_capabilities[]
loot_and_harvest_roles[]
ability_origins[]
breakable_part_mappings[]
lod_profile_id
required_roles[]
optional_roles[]
fallback_chains[]
network_authority_profile
persistence_profile
validation_rules[]
debug_metadata
source_asset_dependencies[]
migration_aliases[]
planning_status
```

# Appendix B. Semantic ID and Marker Naming Register

| Pattern | Example |
| --- | --- |
| `integration.entity.{family}.{name}` | `integration.entity.pig.standard` |
| `collision.body.{family}.{size}` | `collision.body.humanoid.medium` |
| `hurtbox.anatomy.{region}` | `hurtbox.anatomy.head` |
| `hurtbox.armour.{region}` | `hurtbox.armour.chest_plate` |
| `hitbox.attack.{action}.{index}` | `hitbox.attack.claw.left_01` |
| `marker.eye.{role}` | `marker.eye.primary` |
| `marker.interaction.{role}` | `marker.interaction.dialogue` |
| `marker.work.{role}` | `marker.work.tool_contact` |
| `marker.loot.{role}` | `marker.loot.drop_origin` |
| `marker.ability.{role}` | `marker.ability.mouth_primary` |
| `socket.mount.{role}` | `socket.mount.rider_01` |
| `socket.cargo.{role}` | `socket.cargo.left_01` |
| `sensor.{type}.{profile}` | `sensor.vision.predator_forward` |
| `nav.profile.{family}` | `nav.profile.centipede_large` |
| `lod.simulation.{profile}` | `lod.simulation.persistent_villager` |
| `blueprint.marker.{category}.{role}` | `blueprint.marker.job.blacksmith` |

# Appendix C. Collision and Volume Category Matrix

| Category | Blocks World | Blocks Entities | Receives Damage | Applies Damage | Persistent | Replicated Detail |
| --- | --- | --- | --- | --- | --- | --- |
| Movement Body | Yes | Policy-based | No | No | No | Transform/state. |
| Physical Sub-Body | Conditional | Conditional | No | Physics only | No | Near relevance. |
| Hurt Region | No | No | Yes | No | Definition only | Role/state as needed. |
| Attack Volume | No | No | No | Requests hit | Temporary | Authoritative action. |
| Interaction Volume | No | No | No | No | Definition only | Availability/reservation. |
| Sensor Query | No | No | No | No | Profile only | Server/authority only. |
| Navigation Footprint | Route query | Avoidance | No | No | Profile only | Usually not replicated. |
| Trigger Volume | Conditional | Conditional | No | Event request | World-dependent | Event/state. |
| Debris/Ragdoll | Yes | Conditional | Usually no | Physics only | Optional | Nearby only. |

# Appendix D. Body-Family Baseline Integration Profiles

| Body Family | Movement | Hurt Regions | Key Markers | Navigation Notes |
| --- | --- | --- | --- | --- |
| Humanoid | Capsule | Head, torso, limbs | Eyes, hands, feet, dialogue, camera | Doors, stairs, ladders, workstations. |
| Four-Arm Humanoid | Capsule | Head, torso, grouped arms, legs | Four hand sockets, tool roles | Wider action envelope; normal doorway by default. |
| Compact Quadruped | Elongated capsule/box | Head, body, legs grouped | Mouth, feet, feed, harvest | Low clearance, modest turn radius. |
| Large Quadruped | Compound core | Head, torso, legs | Mount, cargo, mouth | Wide doors, stable slopes, towing. |
| Spider | Core body | Head/thorax, abdomen | Fangs, leg contacts, vision | Wide footprint, optional wall/ceiling climb. |
| Hexapod | Core body | Head, thorax, abdomen | Mouth, six contact roles | Tripod gait and wide clearance. |
| Segmented Crawler | Head/core plus grouped chain | Head, segment groups, tail | Mandibles, grouped contacts | Head-led route and segment follow. |
| Serpent | Chain or core capsule | Head, body groups, tail | Mouth, coil centre | Flexible turn, no foot contacts. |
| Bird | Small body | Head, body, wings | Beak, feet, wing tips | Ground plus flight, perch and landing. |
| Bat | Small body | Head, body, wings | Mouth, feet, wing tips | Flight plus hanging anchors. |
| Wyvern | Compound body | Head, chest, wings, legs, tail | Mouth, claws, rider optional | Ground/flight transitions. |
| Dragon | Authored compound | Head, chest, wings, legs, tail, weak points | Breath, claws, rider, camera targets | Large turn radius, arena landing. |
| Aquatic | Capsule/chain | Head, body, fins/tail | Mouth, swim basis | Volume navigation and depth bands. |
| Floating Entity | Sphere/core | Core and appendages | Focus origin, orbit roles | Hover or free-flight navigation. |
| Golem | Box/compound | Core, limbs, armour parts | Tool, core, repair | Heavy step, machine work capability. |

# Appendix E. Simulation LOD State Matrix

| Feature | Tier 0 Full | Tier 1 Reduced | Tier 2 Regional | Tier 3 Dormant |
| --- | --- | --- | --- | --- |
| Rendered Actor | Full | Reduced | No | No |
| Movement | Physics/controller | Simplified controller | Route or region tick | None |
| Collision | Full required | Core only | None | None |
| Hurt Regions | Full relevant | Merged | Abstract risk | None |
| Attack Volumes | Full | On engagement only | Abstract combat | None |
| Animation | Full relevant | Reduced/staggered | None | None |
| IK/Procedural Contacts | Full budget | Limited | None | None |
| Perception | Frequent | Scheduled | Abstract checks | Deferred |
| AI Planning | Full | Reduced | Task summary | Next-event time |
| Inventory | Exact | Exact/local | Summary transactions | Stored record |
| Relationships | Exact | Exact | Event-driven summary | Stored record |
| Quest Binding | Exact | Exact | Stable ID | Stable ID |
| Persistence Commit | On change/checkpoint | On change/demotion | Tick/event | Scheduled |

# Appendix F. Blueprint-to-Entity Contract Examples

## F.1 Blacksmith Workstation

```text
Entity capability: capability.job.blacksmith
Required entity roles:
- socket.hand.main
- socket.hand.off
- marker.work.tool_contact
- marker.eye.primary

Blueprint marker roles:
- blueprint.marker.job.blacksmith.approach
- blueprint.marker.job.blacksmith.stand
- blueprint.marker.job.blacksmith.tool_target
- blueprint.marker.storage.input
- blueprint.marker.storage.output
```

## F.2 Bird Perch

```text
Entity capability: capability.perch.medium_bird
Required entity roles:
- marker.foot.contact.left
- marker.foot.contact.right
- marker.flight.body_basis

Blueprint marker roles:
- blueprint.marker.perch.medium_bird
- blueprint.marker.flight.approach
- blueprint.marker.flight.departure
```

## F.3 Dragon Arena

```text
Entity capability: capability.boss.dragon_standard
Required entity roles:
- marker.ability.mouth_primary
- hurtbox.anatomy.wing_left
- hurtbox.anatomy.wing_right
- marker.target.combat_core

Blueprint marker roles:
- blueprint.marker.boss.spawn
- blueprint.marker.boss.landing_01
- blueprint.marker.boss.perch_01
- blueprint.marker.boss.phase_02
- blueprint.marker.player.entry
```

# Appendix G. Validation Checklist

- [ ] Visible source remains voxel-authored and editable.
- [ ] Integration profile uses stable namespaced IDs.
- [ ] Required semantic roles are present and unique where required.
- [ ] Gameplay does not depend on presentation scene paths.
- [ ] Movement body aligns with intended footprint and clearance.
- [ ] No ordinary entity uses per-voxel physics bodies.
- [ ] Hurt regions align with visible anatomy.
- [ ] Attack volumes are temporary and action-authorised.
- [ ] Hit de-duplication is configured.
- [ ] Weak points have readable non-colour cues where needed.
- [ ] Breakable parts have animation, socket and LOD fallbacks.
- [ ] Interaction anchors have valid approach positions.
- [ ] Sensor origins and forward bases are correct.
- [ ] Navigation profile matches body plan and movement modes.
- [ ] Flying entities have take-off, landing and perch rules where required.
- [ ] Multi-legged contacts do not create unbounded physics cost.
- [ ] Segmented bodies use grouped proxies and regions.
- [ ] Equipment and mount roles remain valid across approved variants.
- [ ] Blueprint marker compatibility passes clearance tests.
- [ ] LOD products preserve required roles.
- [ ] Promotion and demotion preserve consequential state.
- [ ] Multiplayer authority is explicit.
- [ ] Dependencies and override chains are valid.
- [ ] Migrations exist for renamed or removed roles.
- [ ] Test Laboratory scenarios pass.
- [ ] Audio and VFX references remain hooks only.

# Appendix H. Proof-of-Concept Checklist

- [ ] Player humanoid integration profile complete.
- [ ] Village builder can use a Blueprint Forge worksite.
- [ ] Pig supports feeding, herd LOD and harvesting.
- [ ] Spider supports wide footprint, bite and sensor profile.
- [ ] Giant centipede supports grouped segments and reduced LOD.
- [ ] Bird supports ground, take-off, flight, landing and perch.
- [ ] Dragon boss supports multi-part damage, breakable wings and breath origin.
- [ ] Humanoid doorway and stair tests pass.
- [ ] NPC bed and workstation tests pass.
- [ ] Mount or passenger proof passes on one entity.
- [ ] Full, reduced and regional simulation tiers work.
- [ ] Save, unload, time advance and reconstruction work.
- [ ] Attack windows are server-authoritative in multiplayer test.
- [ ] Dependency view identifies marker consumers.
- [ ] Automatic suggestions can be reviewed and overridden.
- [ ] Runtime proxies bake reproducibly from source.
- [ ] All POC assets reach Functional or higher lifecycle state.

# Appendix I. Glossary

| Term | Definition |
| --- | --- |
| Abstract Simulation | Compact processing of entity state without a full local actor. |
| Action Volume | Temporary gameplay query shape active during an authorised action. |
| Actor Reconstruction | Creating a loaded runtime actor from definitions and persistent state. |
| Broad Phase | Early collision filtering that removes irrelevant pair checks. |
| Capability Tag | Semantic declaration that an entity can use a movement, work or structure role. |
| Collision Proxy | Simplified runtime shape representing voxel-authored occupied space. |
| Demotion | Reducing an entity from a detailed actor to a lower-detail representation. |
| Hurtbox | Semantic region that can receive a combat query. |
| Integration Profile | Definition connecting a body plan to collision, markers, navigation, sensors and LOD. |
| Interaction Anchor | Transform and approach contract for a contextual action. |
| LOD Axis | Independent detail category such as rendering, physics, AI or simulation. |
| Marker | Named semantic transform used by gameplay or presentation systems. |
| Navigation Footprint | Clearance shape and movement constraints used for route planning. |
| Persistent Entity Record | Save-safe identity and consequential state independent of a loaded actor. |
| Promotion | Creating or upgrading a detailed representation from a lower-detail record. |
| Semantic Role | Stable functional identifier independent of scene hierarchy. |
| Sensor Profile | Definition of sight, hearing, scent or other perception capabilities. |
| Simulation LOD | Amount of gameplay processing applied to an entity. |
| Weak Point | Explicit damage region with special combat meaning and readable feedback. |
| Voxel Source Alignment | Requirement that runtime proxies remain meaningfully aligned to approved voxel geometry. |

---

**End of Document 22H - Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD - Version 0.1**
