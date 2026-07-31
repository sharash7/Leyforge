# Fantasy Voxel Civilisation Sandbox
## 22B - Entity Model Taxonomy, Anatomy and Body Architecture
### Voxel Body Plans, Anatomy Graphs and Model Standards
**Version 0.1 - Detailed Design Bible Draft**

A voxel-only taxonomy and body-architecture system for building player characters, humanoid NPCs, animals, livestock, multi-armed beings, multi-legged creatures, segmented crawlers, serpents, birds, dragons, monsters, bosses, constructs and unconventional entities inside the Leyforge Forge.

## Entity Model Taxonomy and Body Architecture Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the model taxonomy, body-plan graph, anatomy roles, scale standards, body templates, modular anatomy, limb and segment rules, silhouette requirements, damage-region boundaries, collision footprints, LOD architecture, registry fields, validation and proof-of-concept body plans for Entity Forge. |
| Core Philosophy | Simple entities should begin from reliable templates, while unusual creatures must remain possible through editable voxel body-plan graphs rather than being forced onto a humanoid rig. |
| Voxel Direction | Every body part, limb, wing, horn, shell, feather mass, tail, jaw, segment and attachment authored by the Forge originates from editable voxel source data. Runtime meshes may be merged or simplified, but conventional smooth meshes are not the approved source of truth. |
| Scale Direction | One world block equals one metre, one standard model density equals 32 voxel cells per metre, and body templates declare their real world size, authoring density and gameplay footprint. |
| Taxonomy Direction | Classify entities by body architecture and movement needs rather than only by lore species. A dragon may be a quadruped-winged-chain body, while a wyvern may be a biped-winged-chain body. |
| Body-Plan Direction | Use reusable templates backed by a flexible directed body-plan graph containing named parts, parent-child links, symmetry groups, limb chains, segment generators, sockets, animation roles and damage regions. |
| Humanoid Direction | Support standard bipeds, short and tall humanoids, digitigrade legs, tails, horns, wings, additional arm pairs and composite lower bodies while preserving equipment and animation compatibility where declared. |
| Animal Direction | Support pigs, livestock, wolves, bears, horses, birds and other animals through dedicated quadruped, avian, aquatic and hybrid templates rather than humanoid approximations. |
| Multi-Legged Direction | Support six-legged, eight-legged and higher-limb creatures through procedural gait groups, paired appendage generators, terrain-aware foot targets and scalable limb-detail LOD. |
| Segmented Direction | Support centipedes, worms, serpents and long dragons with repeated-segment generators, taper curves, optional limb pairs, regional collision and deterministic phase offsets. |
| Flying Direction | Winged bodies must define wing roots, span, folding clearance, take-off posture, grounded footprint, flight centre, tail control surfaces and landing contact points. |
| Boss Direction | Large bosses may use multiple body graphs, targetable regions, breakable armour, detachable presentation parts, phase variants and scale-specific camera or navigation markers. |
| Template Direction | Ship with validated templates for humanoid, four-armed humanoid, quadruped, large quadruped, bird, bat, spider, hexapod, centipede, serpent, wyvern, dragon, aquatic body, floating entity, slime, plant being and golem. |
| Override Direction | Developers may replace the voxel model or body architecture of an existing entity only through explicit compatible override or migration workflows. Stable gameplay IDs remain separate from presentation and rig identities. |
| Validation Direction | Validate voxel integrity, hierarchy, scale, symmetry, disconnected parts, joint clearance, grounding, silhouette, animation-role completeness, collision coverage, sockets, damage regions, LOD and dependency integrity. |
| Implementation Context | Godot with Summer Engine is the current implementation target. This document defines game-facing design contracts; class, resource and editor implementation details are expanded in 22E and 22K. |
| POC Direction | Prove six production-quality body plans: humanoid, pig, spider, giant centipede, bird and dragon-scale test, plus one four-armed variation and one custom-body graph. |

## Document Purpose

This document defines the anatomical and structural language used by the Entity Forge. It converts the broad entity scope locked in 22A into a concrete taxonomy that can represent ordinary villagers, player characters, farm animals, spiders, giant centipedes, birds, dragons, magical constructs and bosses without treating them as unrelated one-off models.

The body architecture is deliberately based on visual structure and movement requirements rather than lore category alone. A domesticated pig and a demonic boar may share a quadruped foundation. A cave spider and a crystal crawler may share an eight-legged gait family while using different abdomen, armour and attack parts. A dragon and a long serpentine spirit may share tail-chain technology while using very different limbs, flight and damage regions.

This document also establishes the limits needed to keep the Forge coherent. All approved source geometry remains voxel-based. Standard world scale is preserved. Body parts use stable names and roles. Repeated limbs or segments are generated reproducibly. Visual detail does not silently change hitboxes, navigation or gameplay reach. Large or unusual creatures may be complex, but their complexity must be visible, testable and scalable through declared LOD rules.

This document does not define the final humanoid customisation interface, exact rigging tools, animation graphs, AI behaviour, combat damage formulas or Blueprint Forge implementation. Those responsibilities belong to Documents 22C through 22K. It provides the anatomical foundation they must share.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Documents 21A through 21G define the existing Voxel Asset Forge, and 22A establishes the Entity Forge and Blueprint Forge expansion. This document extends those rules without replacing the voxel source, registry, override, validation or baking foundations already locked.

## Design Sources

| Source Document | Relevant Direction | How 22B Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Leyforge uses stylised, readable, high-fidelity voxel visuals. Characters and creatures may be more detailed than terrain while remaining recognisably part of the same world. | Locks voxel-only body models, readable silhouettes and a shared visual density rather than full realism. |
| 03 - Blocks Registry | The world uses one-metre blocks, stable IDs, material families, shapes, states and data inheritance. | Supplies the world-scale anchor, material references and occupancy context used by entity models. |
| 04 - Items Registry | Equipment, held items, block forms and icons remain separate but linked through stable definitions. | Requires anatomy roles and sockets capable of receiving Forge-authored equipment without merging item truth into the body model. |
| 07 - NPC Village System | NPCs are persistent named people with jobs, homes, schedules, inventories and culture. | Requires reusable humanoid anatomy, variation and work-compatible body standards. |
| 10 - Creatures and Monsters | Creatures include wildlife, livestock, hostile mobs, factions, magical beings, constructed beings and bosses, and must be identifiable by silhouette and movement. | Provides the required breadth of body plans and the readability standard used throughout this document. |
| 16 - Combat, Gear and Defence | Combat must communicate threat roles, attacks, equipment, hit feedback and target priorities clearly. | Requires named attack origins, damage regions, weak-point boundaries, readable scale and animation roles without making the model own combat rules. |
| 21B - Voxel Modelling, Texturing and Material Authoring | One block is one metre, standard model density is 32 voxels per metre, and custom voxel models retain editable source data. | Provides the canonical density, voxel scale, material DNA and source-versus-baked separation. |
| 21C - Animation, Effects and Runtime Visual States | Models may contain named parts, transform animation, voxel-frame animation, material animation and state bindings. | Requires anatomy parts and graph roles that animation can address predictably. |
| 21D - Asset Overrides, Variants and Registry Integration | Stable IDs, inheritance, overrides, fallbacks and deterministic content resolution protect existing content. | Extends these rules to body plans, anatomy templates and presentation-compatible overrides. |
| 22A - Forge Entity and Blueprint Expansion | Locks voxel-only entity creation, flexible body graphs, procedural gaits, repeated segments, icon capture, testing and packaging. | Acts as the master expansion direction this anatomy document formalises. |

## Static Table of Contents

- 1. Locked Entity Anatomy Identity
- 2. Locked Direction Summary
- 3. Entity Taxonomy Architecture
- 4. Voxel Source, Scale and Density Rules
- 5. Coordinates, Orientation, Grounding and Body Space
- 6. Body-Plan Graph Architecture
- 7. Anatomical Node Roles and Naming Conventions
- 8. Humanoid and Bipedal Architectures
- 9. Multi-Armed, Multi-Torso and Altered Humanoids
- 10. Quadruped Architectures
- 11. Hexapods, Arthropods and Multi-Legged Bodies
- 12. Segmented Crawlers, Centipedes and Worms
- 13. Serpents, Long-Tail and Chain Bodies
- 14. Avian, Bat and General Winged Architectures
- 15. Dragons, Wyverns and Large Flying Bosses
- 16. Aquatic and Amphibious Architectures
- 17. Amorphous, Floating, Elemental and Slime Bodies
- 18. Constructs, Golems, Plant Beings and Modular Entities
- 19. Hybrid and Composite Body Plans
- 20. Heads, Faces, Mouths and Sensory Anatomy
- 21. Limbs, Hands, Feet, Claws, Wings, Tails and Appendages
- 22. Symmetry, Asymmetry and Variant Inheritance
- 23. Damage Regions, Breakable Parts and Attachment Boundaries
- 24. Silhouette, Readability, Icon and Camera Standards
- 25. Collision, Occupancy, Navigation Footprints and Mount Scale
- 26. Repetition, LOD and Performance Architecture
- 27. Template Library and Creation Wizards
- 28. Data Schemas, Registry Fields and Dependency Rules
- 29. Validation Rules and Test Laboratory Scenarios
- 30. Proof-of-Concept Scope and Acceptance Criteria
- 31. Relationships With Documents 22C-22L
- Appendix A. Body-Plan Family Matrix
- Appendix B. Anatomy Role and Naming Register
- Appendix C. Scale and Density Presets
- Appendix D. Example Body-Plan Graphs
- Appendix E. Anatomy Validation Checklist
- Appendix F. Glossary

# 1. Locked Entity Anatomy Identity

Entity Forge models are assemblies of editable voxel body parts organised by a declared body architecture. The architecture explains what the model is made from, which parts are connected, how the body is oriented, which parts mirror or repeat, where joints and sockets belong, how the entity touches the world, and which roles later rigging, animation, combat and AI systems may reference.

A body plan is not a species definition. It is a reusable structural pattern. A pig, boar, spectral hog and armoured war-beast can share a quadruped body family while differing in proportions, materials, equipment, horns, effects and gameplay. A body plan is also not the final skeleton. It provides the intended anatomy and animation roles from which a compatible rig can be selected or generated in 22E.

> **Locked Rule**  
> No approved Entity Forge model may depend on a conventional smooth mesh as its editable source. Every visible body part must resolve to voxel source, Forge-generated voxel geometry or a declared voxel-derived repetition/modifier result.

## 1.1 Anatomy Promise

A developer should be able to inspect an entity and answer:

- What body family is this entity using?
- Which part is its root and where is its centre of mass intended to be?
- Which appendages are walking limbs, grasping limbs, wings, fins, tails or decorative parts?
- Which limbs are paired, repeated or asymmetric?
- Where does the entity touch the ground, perch, swim, fly or mount?
- Which parts receive equipment, attacks, icons, damage presentation or effects?
- Which parts can be hidden, replaced, broken or simplified at distance?
- Which template and animation families are compatible?

## 1.2 Design Pillars

| Pillar | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel Authenticity | Source bodies remain editable voxel assemblies. | Every entity belongs to Leyforge's visual language. |
| Structural Clarity | Body parts have named roles, parents, axes and declared purpose. | Animation, equipment and damage remain predictable. |
| Template Efficiency | Common entities begin from validated body templates. | Pigs, villagers and birds can be produced without rebuilding foundations. |
| Custom-Body Freedom | Unusual anatomy uses editable graphs and repeated structures. | Spiders, centipedes, dragons and eldritch bosses are not forced into humanoid limits. |
| Scale Consistency | Density and world dimensions are declared and previewed against blocks. | Creatures look intentional beside players, doors, buildings and terrain. |
| Runtime Scalability | Repeated parts, LOD and simplified collision are designed from the source. | Large monsters remain visually rich without impossible performance cost. |
| Behaviour Separation | Anatomy exposes roles and markers but does not own AI or combat truth. | Visual editing cannot silently alter gameplay systems. |

## 1.3 What Anatomy Is Not

- Anatomy is not a biological simulation or medical system.
- Anatomy is not permission to create one collision body per visible voxel.
- Anatomy is not a humanoid skeleton with renamed bones for every creature.
- Anatomy is not a guarantee that all creatures can wear humanoid equipment.
- Anatomy is not a physics-ragdoll requirement for every appendage.
- Anatomy is not a hidden gameplay-stat editor.
- Anatomy is not an excuse to create unreadable detail that disappears at normal camera distance.

# 2. Locked Direction Summary

| Area | Locked Decision |
| --- | --- |
| Primary Classification | Classify entities first by body architecture and locomotion needs, then link species, faction, culture and gameplay definitions separately. |
| Source Geometry | All body geometry originates from editable voxel data, voxel primitives, repeated voxel segments or non-destructive voxel modifiers. |
| Standard Density | Standard model density is 32 voxel cells per metre. Exceptions require an approved density profile and clear connection rules. |
| Body Graph | Every entity uses a directed body-plan graph with one declared root and named child parts. |
| Templates | Common body plans are supplied as editable templates, never immutable black boxes. |
| Limb Counts | Arm, leg, wing, fin, tentacle and tail counts are data, not hard-coded assumptions. |
| Segment Counts | Repeated segment counts are parameterised, seeded where varied, and baked deterministically. |
| Symmetry | Mirror and radial symmetry are authoring aids. Final bodies may preserve, partially break or completely override symmetry. |
| Grounding | Every grounded entity declares contact sets, nominal floor plane, step height assumptions and footprint. |
| Flight | Flying entities declare grounded and airborne body states, wing clearance and flight centre. |
| Aquatic Bodies | Aquatic entities declare swim axis, buoyancy presentation centre, fin roles and land capability where applicable. |
| Equipment | Equipment compatibility is role-based and declared; it is not assumed from visual resemblance. |
| Damage | Anatomy may expose damage regions and breakable presentation parts, while combat systems own health and damage rules. |
| Icons | Anatomy supplies framing bounds, focus parts and preferred poses used by live icon capture. |
| LOD | Large repeated bodies must define reduction rules at authoring time rather than after performance problems appear. |
| Overrides | Visual anatomy overrides must declare compatibility or provide migration for rigs, animations, sockets and gameplay markers. |
| Validation | Invalid hierarchy, missing root, disconnected required parts, overlapping joints, scale mismatch and incomplete roles are blocked before approval. |

# 3. Entity Taxonomy Architecture

## 3.1 Taxonomy Layers

Entity classification uses multiple independent layers so lore identity does not become a technical restriction.

| Layer | Purpose | Examples |
| --- | --- | --- |
| Body Family | Broad anatomical structure. | Humanoid, quadruped, arthropod, segmented crawler, serpent, avian, dragon, slime. |
| Locomotion Family | How the body normally moves. | Biped walk, quadruped gait, eight-leg gait, wave crawl, flap flight, swim, hover. |
| Scale Class | Approximate physical presentation and budget. | Tiny, small, human-scale, large, giant, colossal. |
| Rig Family | Compatible joint and animation foundation. | Standard humanoid rig, pig quadruped rig, spider procedural rig, dragon rig. |
| Equipment Profile | Which sockets and wearable regions are supported. | Humanoid full gear, saddle only, harness, horn ornaments, none. |
| Gameplay Entity Type | External registry meaning. | Player, NPC, livestock, monster, boss, summon, construct. |
| Species/Culture/Faction | Lore and social identity outside anatomy. | Human villager, forest elf, goblin raider, fae beast. |

An entity can therefore be described as:

```text
Gameplay type: livestock
Species: domestic pig
Body family: compact quadruped
Locomotion family: short-leg quadruped
Scale class: small
Rig family: quadruped_pig_standard
Equipment profile: collar_and_harness
```

## 3.2 Primary Body Families

The initial Forge taxonomy includes:

1. Humanoid and bipedal.
2. Multi-armed or altered humanoid.
3. Quadruped.
4. Hexapod and general multi-legged.
5. Arthropod and spider-like.
6. Segmented crawler.
7. Serpentine or chain-bodied.
8. Avian.
9. Bat-like or membrane-winged.
10. Wyvern.
11. Dragon.
12. Aquatic fish-like.
13. Aquatic mammal or reptile-like.
14. Amphibious.
15. Floating or hovering.
16. Slime or amorphous.
17. Construct or golem.
18. Plant or fungal being.
19. Hybrid/composite.
20. Custom graph.

## 3.3 Template Versus Custom Graph

A template provides a valid starting graph, scale profile, naming set, symmetry rules, standard sockets, recommended rig family and validation expectations. A custom graph allows the same underlying parts and relationships to be assembled without template restrictions.

Templates should cover most ordinary content. Custom graphs should be used when:

- The entity combines body families in a way no template expresses.
- Limb or segment placement is intentionally asymmetric.
- The boss changes architecture between phases.
- A magical construct floats as independent parts.
- A creature has multiple torsos, heads, tails or wing pairs.
- A structure-like creature requires unusual attachment or navigation rules.

# 4. Voxel Source, Scale and Density Rules

## 4.1 Canonical World Scale

Leyforge retains the world-scale rules from Document 21B:

- One terrain or world block edge represents one metre.
- One standard block face contains 32 x 32 authoring pixels.
- One standard model density contains 32 voxel cells per metre.
- One standard authoring voxel edge represents approximately 3.125 centimetres.

Entity measurements are always stored in world units and authoring voxels. A human-scale model may be roughly 1.75 metres or 56 standard voxels tall, while a pig may be approximately 0.8 metres or 26 standard voxels at the shoulder.

## 4.2 Density Profiles

| Profile | Voxel Density | Intended Use | Restrictions |
| --- | ---: | --- | --- |
| Coarse | 16 voxels/metre | Distant creatures, huge simple forms, low-detail prototypes. | Must preserve silhouette; not default for player-facing human-scale entities. |
| Standard | 32 voxels/metre | Most humanoids, animals, monsters, items and body parts. | Default profile. |
| Fine | 64 voxels/metre | Small expressive heads, premium hero parts, thin wing tips or compact critical details. | Use sparingly; must connect to standard-density parts explicitly. |
| Colossal Modular | 16-32 voxels/metre by part | Dragons, titans and bosses assembled from multiple bounded parts. | One enormous dense volume is discouraged. |
| Micro Accent | 64-128 voxels/metre within tiny bounded parts | Eyes, teeth, jewellery, rune cores or other small accents. | Must be merged, instanced or material-driven where possible. |

A body part should normally use one density. Mixed-density entities must declare conversion scale and connection sockets. The Forge should warn when a fine-density torso is attached to coarse limbs without an intentional transition.

## 4.3 Body Scale Classes

| Scale Class | Approximate Height/Length | Typical Examples | Design Notes |
| --- | --- | --- | --- |
| Tiny | under 0.25 m | Insects, motes, miniature summons. | Often represented through simplified geometry, particles later, or grouped agents. |
| Small | 0.25-1.0 m | Piglets, chickens, spiders, small goblins. | Full nearby model; careful icon framing. |
| Human-Scale | 1.0-2.5 m | Players, villagers, wolves, horses, common monsters. | Baseline interaction, doors and equipment. |
| Large | 2.5-6 m | Bears, trolls, giant spiders, young dragons. | Requires wider navigation and camera tests. |
| Giant | 6-20 m | Adult dragons, giants, siege beasts. | Modular body parts, regional hitboxes and LOD required. |
| Colossal | above 20 m | Titans, world bosses, structure-scale beings. | May combine entity, structure and encounter systems; strict budgets and special navigation. |

These bands guide authoring and testing, not lore power. A tiny creature can be dangerous, and a giant creature can be peaceful.

## 4.4 Scale Anchors

Entity Forge previews must provide optional reference anchors:

- One-metre block cube.
- Standard player silhouette.
- Standard village doorway.
- Bed, chair and workstation examples.
- Common mount saddle height.
- Camera near and far distances.
- Blueprint room and corridor presets.

Scale anchors are visual references only. They cannot become hidden geometry in the baked entity.

## 4.5 Voxel Detail Budget

Detail should serve silhouette, material identity, expression or animation. Features that do not survive normal gameplay distance should usually be represented through palette, texture or material behaviour rather than additional geometry.

Good geometric detail includes:

- Horn silhouette.
- Jaw opening.
- Wing finger structure.
- Large feathers or plates.
- Claws visible in attack poses.
- Armour layers that may break.
- A spider's recognisable leg shape.

Poor geometric detail includes:

- Hundreds of isolated fur voxels on a normal pig.
- Teeth smaller than one visible pixel at gameplay distance.
- Internal organs never visible in gameplay.
- Separate physics bodies for decorative scales.

# 5. Coordinates, Orientation, Grounding and Body Space

## 5.1 Canonical Axes

Every body plan declares a canonical local coordinate system:

- Forward: the direction the entity faces in its neutral pose.
- Up: the direction away from the nominal ground plane.
- Right: derived consistently from forward and up.
- Root origin: the reference used for placement, movement and authoring.

Godot-specific axis conversion belongs to 22K, but Forge data must remain internally consistent and explicitly convertible.

## 5.2 Root Placement

Default root placement depends on body family:

| Body Family | Recommended Root |
| --- | --- |
| Humanoid | Pelvis or centre between feet projected into the pelvis. |
| Quadruped | Torso centre between shoulder and hip groups. |
| Spider/arthropod | Central thorax or body centre. |
| Segmented crawler | Head-base or central leading segment, with chain direction declared. |
| Serpent | Head-base or body root depending on locomotion solver. |
| Bird | Torso centre near wing roots. |
| Dragon | Chest/torso centre near wing and front-limb roots. |
| Fish | Body centre near primary turning mass. |
| Slime | Centre of base contact volume. |
| Floating entity | Visual centre or declared motion centre. |

The root should not jump between variants unless a migration updates animation, collision, sockets and saves.

## 5.3 Neutral Pose

Each body plan stores a neutral authoring pose used for:

- Modelling.
- Rig generation.
- Equipment fitting.
- Collision generation.
- Icon framing.
- Symmetry and comparison.
- Retargeting.

Neutral pose examples include humanoid relaxed A-pose, quadruped standing pose, spider evenly spread stance, bird folded-wing perch pose and dragon grounded pose with wings partially folded.

## 5.4 Contact Sets

A body may define multiple contact sets:

```text
contact_set.ground_walk
contact_set.crouch
contact_set.perch
contact_set.wall_climb
contact_set.ceiling_climb
contact_set.swim_surface
contact_set.mount_rest
```

Each contact set lists the parts or markers expected to touch a surface. Procedural locomotion and validation use these markers; gameplay code remains responsible for whether a movement mode is permitted.

## 5.5 Clearance Volumes

Entities with large wings, horns or tails require declared clearance previews:

- Neutral collision footprint.
- Animation sweep bounds.
- Wing-folded width.
- Wing-open width.
- Tail turning radius.
- Attack reach preview.
- Door and corridor compatibility.

Clearance volumes are diagnostics and authoring metadata unless explicitly linked to gameplay collision.

# 6. Body-Plan Graph Architecture

## 6.1 Graph Definition

A body-plan graph is a directed hierarchy of anatomical nodes. Every graph contains:

- One root node.
- Zero or more body-part nodes.
- Parent-child attachment relationships.
- Local transforms and voxel-source references.
- Symmetry, repetition or generation rules.
- Anatomy and animation roles.
- Optional sockets, contact points and damage-region membership.
- Compatibility metadata.

A simple humanoid graph may be a tree. A complex boss may contain grouped subgraphs and presentation links, but the transform hierarchy must remain acyclic.

## 6.2 Node Types

| Node Type | Purpose | Examples |
| --- | --- | --- |
| Body Part | Visible anatomical voxel part. | Torso, head, upper arm, wing segment, tail plate. |
| Joint Anchor | Connection and rotation reference. | Shoulder, hip, jaw hinge, wing root. |
| Socket | Attachment point for equipment, effects or interactions. | Main hand, saddle, breath origin. |
| Contact Marker | Expected contact with ground or surface. | Foot sole, hoof, claw tip, perch grip. |
| Repetition Generator | Produces repeated parts or segments. | Centipede body segments, feather rows, rib plates. |
| Symmetry Group | Mirrors or radially repeats child nodes. | Left/right arms, spider leg pairs. |
| Region Group | Collects parts for damage, LOD or selection. | Head region, left wing, tail group. |
| Guide Curve | Controls chains or repeated placement. | Serpent spine, dragon tail, horn curve. |
| Presentation Marker | Icon focus, nameplate, camera or preview marker. | Portrait focus, health-bar anchor. |

## 6.3 Required Node Fields

Each node should support:

```text
node_id
parent_node_id
node_type
anatomy_role
voxel_source_id
local_position
local_rotation
local_scale
pivot_or_joint_id
symmetry_group_id
repetition_profile_id
rig_role
lod_group
region_membership
socket_ids
contact_marker_ids
visibility_rules
planning_status
```

## 6.4 Graph Operations

The Forge should allow:

- Add or remove body parts.
- Re-parent a part with validation.
- Mirror a part or chain.
- Convert mirrored parts into independent editable copies.
- Group parts into a region.
- Generate repeated segments.
- Attach a guide curve.
- Replace voxel source while preserving node role.
- Promote a decorative part into an animated part.
- Collapse nodes into a baked static group.
- Create a template from a validated graph.

## 6.5 Graph Compatibility

Two body plans are animation-compatible only when their required roles and hierarchy contracts match. Visual similarity is insufficient.

Compatibility levels:

| Level | Meaning |
| --- | --- |
| Exact | Same required nodes, roles, axes and hierarchy. Animation can be shared directly. |
| Retargetable | Same functional roles but different proportions or optional parts. Retargeting is expected. |
| Partial | A subset of animations can be shared; custom clips are needed for additional parts or locomotion. |
| Incompatible | Different locomotion or hierarchy; no automatic animation sharing. |

# 7. Anatomical Node Roles and Naming Conventions

## 7.1 Stable Role Names

Node display names may be friendly, but internal role IDs must be stable and database-friendly.

Recommended pattern:

```text
anatomy.<family>.<region>.<side>.<index>.<part>
```

Examples:

```text
anatomy.humanoid.arm.left.01.upper
anatomy.humanoid.hand.right.01.palm
anatomy.quadruped.leg.front_left.01.lower
anatomy.spider.leg.left.03.tibia
anatomy.centipede.segment.012.body
anatomy.dragon.wing.right.01.forearm
anatomy.dragon.tail.07.segment
```

Numbers should use fixed-width formatting where large sequences are expected.

## 7.2 Functional Roles

A visible name such as `ornamental_antler` may carry several independent roles:

- Anatomy role: horn.
- Rig role: secondary_chain.
- Damage role: decorative_breakable.
- Equipment role: head_accessory_blocker.
- LOD role: secondary_detail.

Role separation prevents one label from becoming an overloaded gameplay contract.

## 7.3 Side and Pair Naming

Approved side tokens:

- `center`
- `left`
- `right`
- `front_left`
- `front_right`
- `rear_left`
- `rear_right`
- `upper_left`
- `upper_right`
- `lower_left`
- `lower_right`
- `radial_01` through declared count

Custom tokens are permitted for unusual bodies, but template compatibility requires documented mapping.

## 7.4 Required Common Roles

Where applicable, templates should expose:

- root.
- torso or main_body.
- head.
- neck chain.
- pelvis or hip group.
- limb roots.
- hands, paws, hooves or terminal contacts.
- tail root and chain.
- wing roots and tips.
- jaw or mouth.
- eye/vision origin.
- interaction focus.
- icon focus.
- nameplate anchor.

# 8. Humanoid and Bipedal Architectures

## 8.1 Standard Humanoid

The standard humanoid template is the foundation for player characters, villagers, humanoid enemies and many races.

```text
root
`-- pelvis
    |-- spine_lower
    |   `-- spine_upper
    |       |-- neck
    |       |   `-- head
    |       |       |-- jaw
    |       |       `-- face_parts
    |       |-- shoulder_left
    |       |   `-- arm_left
    |       `-- shoulder_right
    |           `-- arm_right
    |-- leg_left
    `-- leg_right
```

Required compatibility roles include pelvis, torso/spine, head, two arm chains, two leg chains, hands, feet and main equipment sockets.

## 8.2 Proportion Profiles

Humanoids may vary through declared proportion profiles:

- Standard adult.
- Short/stocky.
- Tall/slender.
- Broad/heavy.
- Child or youth, if later gameplay supports them.
- Digitigrade.
- Hunched.
- Long-armed.
- Large-headed stylised.

Proportion changes must remain within equipment and animation compatibility bounds or create a new compatibility profile.

## 8.3 Leg Types

| Leg Type | Structure | Examples |
| --- | --- | --- |
| Plantigrade | Heel and foot rest broadly on ground. | Humans, dwarves, many humanoids. |
| Digitigrade | Heel raised, weight on toes. | Beastfolk, some demons, avian humanoids. |
| Unguligrade | Hoof-based terminal limb. | Satyr-like beings, minotaur variants. |
| Mechanical | Jointed constructed limb with custom foot. | Golems, automata. |
| Floating Lower Body | No ground leg chain; hover or tail support. | Spirits, naga-like casters. |

Leg type changes may require different locomotion rigs even when the upper body remains humanoid-compatible.

## 8.4 Optional Humanoid Anatomy

Optional standard extensions include:

- Tail.
- Horns or antlers.
- Long ears.
- Snout or muzzle.
- Wings.
- Back spines.
- Additional eyes.
- Facial tendrils.
- Claws.
- Hooves.
- External magical core.

Extensions declare whether they are static, secondary animated, procedural, damageable or equipment-blocking.

## 8.5 Player and NPC Constraints

Player-compatible humanoids should preserve:

- Camera and eye-height ranges.
- Door and corridor compatibility.
- Main-hand and off-hand sockets.
- Standard armour regions.
- Interaction reach assumptions.
- Mount and seat compatibility where supported.
- First-person visibility rules.

NPC-only or boss humanoids may exceed these standards but must declare incompatibility clearly.

# 9. Multi-Armed, Multi-Torso and Altered Humanoids

## 9.1 Additional Arm Pairs

A four-armed humanoid should not fake extra arms as unrigged decorations. Each arm pair requires:

- Shoulder or torso attachment region.
- Unique side and pair index.
- Independent or linked animation role.
- Equipment compatibility profile.
- Collision/clearance consideration.
- Attack and interaction socket mapping.
- Clothing and armour occlusion rules.

Example role structure:

```text
arm.left.01  -> upper primary arm
arm.right.01 -> upper primary arm
arm.left.02  -> lower secondary arm
arm.right.02 -> lower secondary arm
```

## 9.2 Equipment Rules

The existence of four hands does not automatically grant four weapon slots. Gameplay registries decide usable equipment. Anatomy only exposes sockets and whether each hand can visually hold, brace, gesture or remain decorative.

## 9.3 Multiple Torsos or Heads

Multi-torso and multi-head entities require explicit hierarchy decisions:

- Shared pelvis with branching torsos.
- One dominant torso and secondary torso.
- Shared neck base with multiple heads.
- Independent head tracking or linked motion.
- Separate or shared damage regions.
- Icon focus selection.
- Camera and nameplate placement.

## 9.4 Altered Lower Bodies

Humanoid upper bodies may connect to:

- Serpent tail.
- Quadruped lower body.
- Spider lower body.
- Floating magical base.
- Rooted plant body.
- Mechanical platform.

These are composite body plans and should not be marked standard humanoid compatible unless their locomotion and equipment contracts support the claim.

# 10. Quadruped Architectures

## 10.1 Core Quadruped Graph

```text
root
`-- torso
    |-- neck
    |   `-- head
    |       `-- jaw
    |-- leg.front_left
    |-- leg.front_right
    |-- leg.rear_left
    |-- leg.rear_right
    `-- tail
```

Quadruped templates must support variable shoulder height, hip height, body length, neck angle, tail length, paw/hoof type and head mass.

## 10.2 Quadruped Families

| Family | Characteristics | Examples |
| --- | --- | --- |
| Compact Short-Leg | Wide torso, low shoulder, short neck and legs. | Pig, boar, badger-like beasts. |
| Canine/Feline | Flexible spine, longer limbs, pronounced gait phases. | Wolf, dog, large cat. |
| Hoofed Grazer | Longer legs, hoof contacts, herd silhouettes. | Cow, deer, sheep, horse. |
| Heavy Plantigrade | Large paws, broad torso, substantial shoulder mass. | Bear, giant badger. |
| Reptilian Quadruped | Lower stance, lateral limb spread, long tail. | Lizard, crocodile-like beast. |
| Siege Quadruped | Huge body, reinforced limbs, armour or harness zones. | War beast, giant boar, stone guardian. |

## 10.3 Pig Template

The pig POC template should include:

- Compact torso.
- Short neck.
- Large head and snout.
- Four short plantigrade or hoof-like legs.
- Small tail with optional curl modifier.
- Ear pair.
- Mouth and feeding marker.
- Back harness socket.
- Body, head and leg damage regions.
- Walk, trot, run and idle-compatible anatomy roles.

## 10.4 Spine Flexibility

Quadrupeds may use a rigid torso, two-part torso or flexible spine chain. The choice affects:

- Running silhouette.
- Turning.
- Jumping.
- Breathing and idle motion.
- Saddle placement.
- Collision approximation.

Simple livestock may use a mostly rigid body. Cats, wolves and large predators may benefit from a multi-part spine.

## 10.5 Mount-Compatible Quadrupeds

Mount candidates require:

- Saddle or seat socket.
- Rider clearance preview.
- Mounting-side markers.
- Rider pose compatibility.
- Head and camera obstruction tests.
- Body width and animation sweep validation.

Mount capability is a gameplay decision; anatomy only provides the required presentation contract.

# 11. Hexapods, Arthropods and Multi-Legged Bodies

## 11.1 General Multi-Legged Architecture

Multi-legged creatures use limb groups rather than hard-coded front/rear assumptions. Each limb defines:

- Pair or radial group.
- Attachment segment.
- Locomotion phase group.
- Ground target.
- Allowed reach and lift.
- Climbing capability.
- LOD priority.

## 11.2 Six-Legged Bodies

Hexapods commonly use three leg pairs and a tripod gait. Templates should allow:

- Insect-like thorax and abdomen.
- One or more head parts.
- Wing pairs.
- Mandibles.
- Antennae.
- Tail or stinger.
- Optional grasping forelimbs distinct from walking limbs.

## 11.3 Spider and Eight-Legged Bodies

The spider template uses a central thorax, abdomen, head/front region and four leg pairs.

```text
root
`-- thorax
    |-- abdomen
    |-- head_front
    |   |-- fang_left
    |   `-- fang_right
    |-- leg.left.01
    |-- leg.right.01
    |-- leg.left.02
    |-- leg.right.02
    |-- leg.left.03
    |-- leg.right.03
    |-- leg.left.04
    `-- leg.right.04
```

Leg chains may contain hip/coxa, upper, lower and terminal foot/claw roles. Small spiders can use fewer animated joints, while giant spiders may expose more articulation.

## 11.4 Climbing Profiles

Arthropod bodies may support ground, wall and ceiling contact sets. Anatomy must define:

- Which leg tips can contact surfaces.
- Body clearance from the surface.
- Orientation transition bounds.
- Abdomen and head clearance.
- Whether limbs can cross or reassign targets.

The movement system in 22F decides how these contacts are solved.

## 11.5 Scorpions and Tail Weapons

Scorpion-like bodies combine multiple leg pairs, grasping claws and a segmented tail. The tail must be a separate chain with attack origin and clearance preview. Claws may be walking-adjacent but should use grasp/attack roles rather than foot-contact roles.

## 11.6 LOD for Many Limbs

At distance, the Forge may:

- Reduce joint count per leg.
- Use a shared or simplified gait phase.
- Merge tiny feet into lower-leg geometry.
- Hide antennae or secondary feelers.
- Bake decorative limb motion into a simplified clip.

Core silhouette and limb count should remain recognisable whenever the entity is visible enough to matter.

# 12. Segmented Crawlers, Centipedes and Worms

## 12.1 Segment Generator

Segmented creatures should usually be authored from:

- Head module.
- One or more body-segment modules.
- Optional special segments.
- Tail module.
- Guide curve or chain axis.
- Repeat count.
- Taper profile.
- Per-segment appendage rules.
- Variation seed.

## 12.2 Centipede Template

A giant centipede may use:

```text
head
`-- segment_generator
    |-- body_segment x 36
    |   |-- leg_left
    |   `-- leg_right
    `-- tail
```

Recommended parameters:

```text
repeat_count: 36
scale_curve: 1.00 at head -> 0.55 at tail
leg_pair_per_segment: true
armour_variant_pattern: A/B/A/B
collision_region_size: 6 segments
phase_offset: travelling wave
lod_secondary_detail: remove after medium distance
```

## 12.3 Worm and Larval Bodies

Worm-like entities may have no visible limbs. They can use:

- Flexible chain segments.
- Ring or plate repetition.
- Head-mouth module.
- Burrowing contact markers.
- Surface-emergence poses.
- Reduced collision regions.

## 12.4 Segment Variation

Variation may be deterministic by:

- Segment index.
- Seeded noise.
- Repeating pattern.
- Region rule.
- Damage state.
- Boss phase.

Random variation must store the seed and parameters so the source can be rebuilt exactly.

## 12.5 Segment Ownership and Selection

The editor should allow selecting:

- One generated segment.
- All segments of one type.
- A range of indices.
- Every nth segment.
- A collision or damage region.
- Head, body or tail group.

Local overrides should remain sparse rather than duplicating all generated source data.

## 12.6 Runtime Reduction

A long creature should not require one independent full-detail actor per segment. Baked outputs may:

- Merge static surfaces by region.
- Use a skeleton chain with reduced bones.
- Sample visual segment transforms from a lower-resolution spine.
- Use simplified collision capsules per region.
- Replace distant motion with a baked wave animation.

# 13. Serpents, Long-Tail and Chain Bodies

## 13.1 Serpent Architecture

Serpents use a head module attached to a flexible chain body. Unlike a repeated centipede, the body may be visually continuous and use fewer large control segments.

Required data includes:

- Head orientation.
- Spine guide.
- Body radius curve.
- Tail taper.
- Ground or swim contact mode.
- Coil clearance.
- Attack origin.
- Optional hood, fins, horns or limbs.

## 13.2 Naga and Humanoid-Serpent Bodies

A humanoid upper body may attach to a serpent lower body through a composite junction. The junction must define:

- Shared root.
- Torso-to-tail transition.
- Equipment compatibility.
- Grounding and seated poses.
- Tail collision and turning radius.
- Animation compatibility level.

## 13.3 Long Dragon Necks and Tails

Dragons may use chain bodies for neck and tail while retaining a central quadruped or wyvern torso. Chain resolution should differ by importance:

- Neck: higher control density for gaze and breath attacks.
- Tail base: strong turning and balance.
- Tail tip: lower mass, optional secondary animation.

## 13.4 Tentacles

Tentacles use chain roles but are not assumed to be tails. They may be:

- Locomotion appendages.
- Grasping appendages.
- Attack limbs.
- Decorative feelers.
- Independent floating parts.

Each tentacle declares maximum bend, root, terminal role and whether it participates in collision or damage.

# 14. Avian, Bat and General Winged Architectures

## 14.1 Avian Body

A bird template includes:

- Torso.
- Neck and head.
- Beak or jaw.
- Two leg chains with perch contacts.
- Two wing chains.
- Tail-feather group.
- Wing-folded and wing-open bounds.
- Flight centre and icon focus.

## 14.2 Wing Structure

Voxel wings may be authored as:

- Rigid wing parts.
- Multi-segment skeletal wings.
- Feather groups attached to structural bones.
- Membrane panels between voxel wing fingers.
- Hybrid coarse geometry plus animated material detail.

All visible geometry remains voxel-derived even when a membrane is baked into a merged surface.

## 14.3 Bird POC Template

The bird template should support:

- Folded-wing ground pose.
- Hop and short walk contacts.
- Take-off pose.
- Flap and glide roles.
- Landing and perch contacts.
- Beak interaction marker.
- Head tracking.
- Tail steering role.

## 14.4 Bat-Like Bodies

Bat templates differ from birds because the wing may integrate the forelimb and membrane. Anatomy must declare whether:

- Wings replace arms.
- Wing claws can grasp or walk.
- The entity can hang from feet.
- Folded wings contribute to ground footprint.
- Membrane damage is a separate region.

## 14.5 Additional Wing Pairs

Four-winged creatures use indexed wing pairs:

```text
wing.left.01
wing.right.01
wing.left.02
wing.right.02
```

Each pair declares primary lift, steering, display or magical role. The animation system may link them while preserving independent control.

# 15. Dragons, Wyverns and Large Flying Bosses

## 15.1 Dragon Family Distinctions

| Family | Limbs | Wings | Typical Body |
| --- | ---: | ---: | --- |
| True Dragon | Four walking legs | One wing pair | Large torso, long neck and tail. |
| Wyvern | Two rear walking legs | Forelimbs are wings | More avian/bat-like grounded posture. |
| Drake | Four walking legs | None or vestigial | Heavy terrestrial dragon. |
| Wyrm | None or very small limbs | None | Serpentine body. |
| Amphithere | No walking legs | One or more wing pairs | Flying serpent. |
| Multi-Wing Dragon | Two or four legs | Two or more wing pairs | Magical or boss-scale variant. |

These are body-architecture labels only; lore may use different names.

## 15.2 True Dragon Graph

```text
root
`-- chest_torso
    |-- neck_chain
    |   `-- head
    |       |-- jaw
    |       |-- horn_groups
    |       `-- breath_socket
    |-- wing_left
    |-- wing_right
    |-- front_leg_left
    |-- front_leg_right
    |-- rear_leg_left
    |-- rear_leg_right
    `-- tail_chain
```

## 15.3 Dragon Scale and Modularity

Large dragons should be assembled from bounded modules:

- Head.
- Neck segments.
- Chest.
- Pelvis/rear torso.
- Limbs.
- Wing structural parts.
- Tail segments.
- Horn and armour groups.

This avoids a single enormous high-density voxel volume and allows regional LOD, damage, collision and overrides.

## 15.4 Wing Requirements

Dragon wings must define:

- Root joint.
- Shoulder/chest connection.
- Primary structural segments.
- Membrane or feather panels.
- Folded resting pose.
- Maximum span.
- Take-off clearance.
- Landing fold sequence.
- Damage region and optional broken presentation.

## 15.5 Boss Anatomy

Boss dragons may add:

- Breakable horns.
- Armour plate regions.
- Wing membrane damage states.
- Multiple breath sockets.
- Tail weapon module.
- Climbable markers.
- Cinematic focus markers.
- Phase-specific voxel replacements.
- Arena-scale contact points.

Anatomy exposes these capabilities but does not decide boss phases, damage values or attack rules.

# 16. Aquatic and Amphibious Architectures

## 16.1 Fish-Like Bodies

Fish templates include:

- Main body.
- Head and mouth.
- Tail-fin chain.
- Pectoral, dorsal and optional pelvic fins.
- Swim axis.
- Turning centre.
- Waterline and icon profile.

## 16.2 Aquatic Mammal or Reptile Bodies

Whale-, seal- or crocodile-like bodies may combine:

- Flexible spine.
- Flippers or limbs.
- Tail flukes or long tail.
- Surface breathing marker.
- Land contact set where applicable.

## 16.3 Amphibious Bodies

Amphibious entities require separate contact and posture profiles for water and land. Examples include frogs, salamanders, swamp beasts and semi-aquatic dragons.

## 16.4 Buoyancy Presentation

The anatomy document does not define fluid physics, but each aquatic body may provide:

- Nominal buoyancy centre.
- Preferred waterline.
- Surface pose.
- Dive pose.
- Propulsion parts.
- Land capability flag.

# 17. Amorphous, Floating, Elemental and Slime Bodies

## 17.1 Slime Bodies

Slimes may use a voxel volume with deformable presentation states rather than a traditional skeleton. Source data can include:

- Rest volume.
- Compressed frame.
- Stretched frame.
- Jump frame.
- Damage or split variants.
- Internal core part.
- Base contact area.

## 17.2 Floating Entities

Floating entities such as wisps, eyes, spell constructs or hovering crystals may use:

- Central core.
- Orbiting voxel parts.
- Guide paths.
- Hover centre.
- Look or attack direction.
- No ground contacts, or optional resting contacts.

## 17.3 Elementals

Elementals may combine rigid voxel chunks with material animation and later VFX references. The approved source still defines a voxel silhouette, attachment structure and fallback presentation even when future effects enhance it.

## 17.4 Independent Part Groups

A floating construct may contain parts that are not physically connected. The graph remains connected through transform relationships even when visible voxels are separated by empty space.

Validation should distinguish intentionally separated parts from accidental disconnected islands.

# 18. Constructs, Golems, Plant Beings and Modular Entities

## 18.1 Golems and Constructs

Constructs can use humanoid, quadruped, spider, floating or custom graphs. Their anatomy may include:

- Core housing.
- Replaceable limbs.
- Mechanical or magical joints.
- Tool mounts.
- Armour plates.
- Power sockets.
- Maintenance access parts.

## 18.2 Modular Replacement

A construct may support compatible limb families:

```text
arm.standard_stone
arm.heavy_hammer
arm.harvesting_tool
arm.mana_cannon
```

Replacement is visual and socket-based. Gameplay definitions decide available modules and capabilities.

## 18.3 Plant and Fungal Bodies

Plant beings may use:

- Root contact groups.
- Trunk or stem chains.
- Branch appendages.
- Leaf or cap masses.
- Bloom states.
- Growth-stage variants.
- Rooted versus mobile forms.

## 18.4 Structure-Like Entities

Very large constructs or living trees may overlap with Blueprint Forge. The entity body plan controls moving or targetable anatomy, while Blueprint Forge may control attached platforms, rooms or stationary structure components. The boundary must be explicit.

# 19. Hybrid and Composite Body Plans

## 19.1 Composite Architecture

A composite body joins validated subgraphs through a declared junction. Examples:

- Humanoid upper body + horse lower body.
- Humanoid torso + spider abdomen and legs.
- Bird head and wings + quadruped body.
- Serpent body + multiple humanoid arms.
- Dragon body + mechanical wing replacement.

## 19.2 Junction Definition

A junction stores:

- Parent subgraph.
- Child subgraph.
- Connection node.
- Scale conversion.
- Orientation conversion.
- Material transition.
- Collision overlap rule.
- Rig compatibility or custom bridge.
- Damage-region boundary.

## 19.3 Centaur-Like Bodies

A centaur template should not duplicate a full humanoid pelvis and full horse neck without purpose. The Forge should provide a clean torso-to-quadruped junction and dedicated animation profile.

## 19.4 Chimera Bodies

Chimera-like monsters may have multiple heads, tails or limb types. Each addition should serve silhouette, behaviour or encounter design rather than being added as unstructured decoration.

# 20. Heads, Faces, Mouths and Sensory Anatomy

## 20.1 Head Architecture

Heads may be:

- Humanoid.
- Muzzled.
- Beaked.
- Mandibled.
- Multi-jawed.
- Eyeless.
- Multi-eyed.
- Floating or detached.
- Integrated directly into torso.

The head node should expose orientation and focus even when a conventional neck is absent.

## 20.2 Facial Components

Voxel face systems may use:

- Replaceable eye parts.
- Eyebrows or brow plates.
- Mouth voxel frames.
- Jaw hinge.
- Muzzle or beak parts.
- Ear pairs.
- Horn groups.
- Material overlays.
- Emissive eye states.

22C and 22F define customisation and expressions in detail.

## 20.3 Mouth and Attack Origins

Anatomy may expose:

- Mouth centre.
- Bite region.
- Breath origin.
- Tongue root.
- Venom fang sockets.
- Projectile spit origin.
- Feeding interaction point.

These are named markers only; combat or interaction systems own their effects.

## 20.4 Sensory Markers

Suggested markers:

- Eye/vision origin.
- Alternate eye origins for multiple heads.
- Hearing focus.
- Smell or tracking origin where useful.
- Head-look target basis.
- Nameplate and dialogue focus.

# 21. Limbs, Hands, Feet, Claws, Wings, Tails and Appendages

## 21.1 Limb Chain Model

A limb chain consists of:

- Root attachment.
- One or more articulated segments.
- Terminal part.
- Contact or interaction markers.
- Optional twist or secondary parts.

## 21.2 Terminal Roles

| Terminal Role | Intended Use |
| --- | --- |
| Hand | Grasping, equipment, gestures and interaction. |
| Paw | Ground contact, claw attacks and locomotion. |
| Hoof | Ground contact and impact. |
| Talon | Perching, grasping and attacks. |
| Claw | Attack or climbing; may also be terminal foot. |
| Fin | Swimming control, not ground contact by default. |
| Wing Tip | Flight and silhouette; not automatically an interaction point. |
| Tentacle Tip | Grasping, attack, sensing or decoration depending on role. |
| Tail Tip | Balance, attack, display or effect socket. |

## 21.3 Hand Architecture

Humanoid hands may use:

- Simplified mitten voxel shape.
- Palm with grouped fingers.
- Fully articulated hero hand.
- Claw hand.
- Mechanical gripper.

The chosen detail tier must match camera distance, equipment needs and animation budget.

## 21.4 Feet and Ground Contacts

Ground-contact markers should be placed at the intended support surface, not simply the lowest voxel. Hooves, claws, paws and digitigrade toes may require multiple contact points or a contact patch.

## 21.5 Wings and Fins

Wings and fins must distinguish structural parts from visual surfaces. The Forge should support material or panel regions attached to voxel structural chains while keeping the entire approved source voxel-derived.

## 21.6 Tails

Tail roles include:

- Balance.
- Steering.
- Attack.
- Grasping.
- Display.
- Flight control.
- Swimming propulsion.
- Equipment or banner mount.

Role selection influences rig and animation recommendations but not gameplay permissions.

# 22. Symmetry, Asymmetry and Variant Inheritance

## 22.1 Symmetry Modes

The Forge should support:

- Left/right mirror.
- Front/rear mirror where useful.
- Radial repetition.
- Segment repetition.
- Linked symmetry.
- Frozen/baked symmetry.
- Broken symmetry with local overrides.

## 22.2 Intentional Asymmetry

Asymmetry may represent:

- Injury.
- Mutation.
- Different weapon limbs.
- Uneven horns.
- Boss armour.
- Faction decoration.
- Corruption.
- Individual identity.

The editor should warn about accidental mismatches without forcing symmetry.

## 22.3 Inheritance Stack

A body may inherit:

```text
Body family template
    -> species anatomy
    -> sex/body variation where used
    -> culture or faction additions
    -> profession/equipment profile
    -> individual generated variation
    -> runtime damage or magical state
```

Each layer should override only necessary fields.

## 22.4 Variant Compatibility

A visual variant can remain in the same rig family when it preserves required anatomy roles and joint ranges. A variant that adds a second wing pair, removes legs or changes from plantigrade to serpent locomotion may require a new compatibility profile.

# 23. Damage Regions, Breakable Parts and Attachment Boundaries

## 23.1 Region Purpose

Anatomy regions organise presentation and references for combat, selection, LOD and breakage. Common regions include:

- Head.
- Torso.
- Left/right arms.
- Left/right legs.
- Wings.
- Tail.
- Core.
- Armour shell.
- Segment groups.

## 23.2 Separation of Responsibility

The body plan may state that `region.dragon.left_wing` exists and contains certain parts. It does not assign health, resistance, sever chance or gameplay consequence. Those belong to combat and creature definitions.

## 23.3 Breakable Presentation Parts

A part may define:

- Intact voxel source.
- Damaged source.
- Broken or hidden source.
- Debris profile reference.
- Changed animation role.
- Fallback collision rule.
- Socket disable rule.

## 23.4 Attachment Boundaries

Equipment, armour and replaceable parts should connect at stable boundaries. Examples:

- Humanoid wrist/hand.
- Shoulder armour anchor.
- Saddle zone.
- Golem arm mount.
- Dragon horn base.
- Machine-creature core housing.

Stable boundaries make variants and overrides safer.

## 23.5 Segmented Region Grouping

Long bodies should group segments into regions rather than creating hundreds of independent gameplay targets. A 36-segment centipede might use six regional groups of six segments each, while the visual source retains all segments.

# 24. Silhouette, Readability, Icon and Camera Standards

## 24.1 Readability Rule

A creature should be identifiable through silhouette, body proportions, major appendages and posture before fine colour or texture is considered. This follows the existing creature-system promise that players learn threats and wildlife through appearance and movement.

## 24.2 Silhouette Tests

Every body plan should be previewed:

- In solid black silhouette.
- From front, side, rear and three-quarter views.
- At normal gameplay distance.
- At medium LOD distance.
- Against light and dark backgrounds.
- In idle and primary locomotion poses.
- Beside similarly sized entities.

## 24.3 Icon Framing Metadata

Anatomy should provide:

- Full-body bounds.
- Head or portrait focus bounds.
- Preferred three-quarter direction.
- Preferred icon pose.
- Wing-folded or wing-open icon choice.
- Oversized-part cropping warnings.
- Variant-safe camera profile.

Icon Capture Studio in 22J uses these bounds.

## 24.4 Threat Readability

Bosses and hostile creatures should communicate major capabilities through anatomy where practical:

- Wings suggest aerial mobility.
- Heavy forelimbs suggest impact attacks.
- Long tail weapon suggests sweep range.
- Large jaw or breath chamber suggests bite or breath attack.
- Armour plates suggest protected regions.
- Multiple grasping arms suggest multi-directional attacks.

This is a design aid, not a requirement that every mechanic be visually literal.

# 25. Collision, Occupancy, Navigation Footprints and Mount Scale

## 25.1 Collision Sources

The Forge should derive simplified collision suggestions from anatomy, but approved collision remains an explicit authored product. Recommended collision layers include:

- Main movement body.
- Head or large protrusion where necessary.
- Regional hit proxies.
- Wing or tail attack sweep diagnostics.
- Ground-contact footprint.

No standard entity should use collision on every visible voxel.

## 25.2 Footprint Profiles

An entity may declare:

- Standing footprint.
- Crouched footprint.
- Wing-folded footprint.
- Wing-open clearance.
- Turning radius.
- Climbing body offset.
- Swimming bounds.
- Boss arena clearance.

## 25.3 Navigation Scale

Navigation profiles should consider:

- Width.
- Height.
- Step height.
- Slope tolerance.
- Turn radius.
- Jump or flight capability references.
- Door and corridor compatibility.

Navigation logic belongs to 22H and technical systems, but anatomy supplies the dimensions and contact structure.

## 25.4 Mount and Rider Scale

Mount-compatible entities need:

- Seat position.
- Rider orientation.
- Mounting markers.
- Saddle bounds.
- Rider leg clearance.
- Camera clearance.
- Animation sweep tests.

Large bosses that can be climbed may use separate climb markers rather than mount sockets.

# 26. Repetition, LOD and Performance Architecture

## 26.1 Source Versus Runtime Complexity

The editable source may contain detailed repeated parts, but runtime outputs should use appropriate merging, instancing, bone reduction and culling.

## 26.2 LOD Groups

Suggested groups:

| Group | Examples | Distance Behaviour |
| --- | --- | --- |
| Core Silhouette | Torso, head, major limbs, wings. | Preserved longest. |
| Secondary Anatomy | Horns, claws, tail fins, jaw parts. | Simplified at medium distance. |
| Tertiary Detail | Small feathers, feelers, decorative scales. | Hidden or material-baked early. |
| Repeated Limbs | Centipede legs, tiny spider feet. | Joint count or animation complexity reduced. |
| Effects Anchors | Tiny sockets and hidden helper parts. | Never rendered; retained only when needed. |

## 26.3 Bone and Part Budgets

Exact numbers are technical tuning, but body plans should declare expected complexity bands:

- Simple: under 20 animated parts/bones.
- Standard: 20-60.
- Complex: 60-120.
- Boss: above 120 only with explicit justification and LOD plan.

Generated centipede legs should not automatically create hundreds of fully evaluated independent bones at all distances.

## 26.4 Repeated Geometry

Repeated geometry should use:

- Source references rather than duplicated voxel data.
- Deterministic transforms.
- Material-instance reuse.
- Regional bake groups.
- Sparse overrides.

## 26.5 Distant Representation

At long range, large entities may use:

- Simplified voxel mesh.
- Reduced skeleton.
- Baked animation.
- Impostor or billboard later if art direction allows.
- Hidden render with abstract simulation when unloaded.

# 27. Template Library and Creation Wizards

## 27.1 Required Initial Templates

The Entity Forge template library should include:

1. Standard humanoid.
2. Short humanoid.
3. Tall humanoid.
4. Four-armed humanoid.
5. Compact pig-like quadruped.
6. Canine quadruped.
7. Hoofed quadruped.
8. Heavy quadruped.
9. Six-legged insect.
10. Eight-legged spider.
11. Scorpion.
12. Centipede.
13. Worm.
14. Serpent.
15. Bird.
16. Bat.
17. Wyvern.
18. True dragon.
19. Fish.
20. Amphibian.
21. Floating entity.
22. Slime.
23. Humanoid golem.
24. Quadruped golem.
25. Plant being.
26. Custom empty graph.

## 27.2 New Entity Wizard

The wizard should ask:

- Intended gameplay entity type.
- Body family.
- Approximate scale class.
- Standard or custom density.
- Locomotion families.
- Limb, wing, head and tail counts.
- Symmetry preference.
- Equipment profile.
- Template or custom graph.
- Icon profile.
- POC/production lifecycle status.

## 27.3 Template Editing

Templates are normal versioned Forge assets. Developers may:

- Duplicate into a new project template.
- Override presentation fields.
- Add optional modules.
- Create compatible subfamilies.
- Deprecate obsolete templates with migration.

Built-in originals should remain recoverable.

## 27.4 Reference Examples

Each template should ship with at least one reference entity demonstrating:

- Correct scale.
- Valid naming.
- Required sockets.
- Contact points.
- Collision suggestions.
- LOD groups.
- Icon framing.
- Compatible rig family.

# 28. Data Schemas, Registry Fields and Dependency Rules

## 28.1 Body-Plan Definition Fields

| Field | Purpose |
| --- | --- |
| body_plan_id | Stable body-plan identity. |
| display_name | Developer-facing readable name. |
| body_family | Primary anatomical category. |
| source_namespace | Owning project or content pack. |
| scale_profile_id | World size and density profile. |
| root_node_id | Required graph root. |
| node_records | Body-part and marker graph. |
| symmetry_groups | Mirror/radial authoring relationships. |
| repetition_profiles | Segment or limb-generation rules. |
| contact_sets | Ground, perch, climb, swim or mount contacts. |
| rig_compatibility | Exact, retargetable, partial or incompatible mappings. |
| equipment_profile_id | Supported attachment and wearable regions. |
| collision_profile_id | Suggested/approved collision product reference. |
| region_definitions | Damage, LOD, selection and breakable groups. |
| icon_profile_id | Preferred capture bounds and pose. |
| lod_profile_id | Reduction rules. |
| dependency_ids | Materials, voxel sources, templates and related assets. |
| lifecycle_state | Concept through approved/deprecated. |
| schema_version | Migration and compatibility. |

## 28.2 Node Record Fields

| Field | Purpose |
| --- | --- |
| node_id | Stable local node identity. |
| parent_node_id | Transform parent. |
| node_type | Body part, joint, socket, contact, generator or marker. |
| anatomy_role | Semantic anatomy role. |
| voxel_asset_id | Editable voxel source for visible parts. |
| transform | Position, orientation and scale. |
| pivot_id | Joint or pivot reference. |
| side_token | Left, right, centre, pair or radial index. |
| rig_role | Expected skeleton/animation mapping. |
| region_ids | Damage, LOD and selection grouping. |
| required | Whether compatible variants must preserve it. |
| visibility_rules | State, variant or LOD visibility. |

## 28.3 Stable IDs and Local IDs

Body plans use a stable global ID, while nodes use stable local IDs within the plan. Renaming a display label must not change the local node ID. Removing or replacing required nodes requires a schema migration when existing animations, equipment or saves reference them.

## 28.4 Dependencies

The dependency graph should record:

- Parent template.
- Voxel part assets.
- Material DNA definitions.
- Rig family.
- Animation set.
- Equipment profile.
- Collision product.
- Icon capture profile.
- Creature or NPC registry users.
- Blueprint markers that spawn or display the entity.

## 28.5 Override Compatibility

An anatomy override may be:

- Presentation-only compatible.
- Rig-compatible.
- Retargetable with review.
- Gameplay-marker migration required.
- Fully incompatible/new body plan.

The Forge must not silently treat an incompatible replacement as a safe visual override.

# 29. Validation Rules and Test Laboratory Scenarios

## 29.1 Hard Errors

Approval must be blocked for:

- Missing or duplicate root.
- Cyclic transform hierarchy.
- Required node without parent.
- Missing voxel source on required visible part.
- Invalid density conversion.
- Duplicate stable node IDs.
- Broken symmetry or repetition reference.
- Required socket outside valid hierarchy.
- Collision product missing where required.
- Template marked compatible while required roles are absent.
- Unresolved dependency.

## 29.2 Warnings

Warnings include:

- Disconnected voxel islands not marked intentional.
- Excessive detail or animated-part count.
- Joint pivot inside unrelated geometry.
- Limb sweep intersects torso severely.
- Foot contacts above or below intended floor.
- Wing-open bounds exceed test environment.
- Tail turning radius is extreme.
- Icon focus crops important anatomy.
- Silhouette becomes unreadable at medium distance.
- Fine-density parts dominate total cost.
- Repeated segments lack LOD reduction.

## 29.3 Test Laboratory Scenarios

| Scenario | Body Plans Tested | Checks |
| --- | --- | --- |
| Scale Studio | All | Blocks, player, doors, camera and icon size. |
| Flat Locomotion Pad | Bipeds, quadrupeds, arthropods | Grounding, stance, turning and limb clearance. |
| Terrain Course | Grounded entities | Slopes, stairs, low obstacles and uneven contact. |
| Climbing Wall | Spiders and climbers | Contact sets, body offset and orientation change. |
| Flight Volume | Birds, bats, dragons | Wing span, take-off, glide, banking and landing clearance. |
| Water Tank | Aquatic/amphibious | Swim axis, fins, waterline and land transition. |
| Door and Corridor Course | Human-scale entities | Width, height, horns, tails and equipment clearance. |
| Boss Arena | Large/giant entities | Camera, regional selection, collision and attack sweep bounds. |
| Icon Studio | All icon-bearing entities | Focus, pose, silhouette, background and variant consistency. |
| LOD Range | All production entities | Mesh, part, bone and silhouette transitions. |

## 29.4 Validation Report

The validation report should include:

- Pass/fail summary.
- Hard errors.
- Warnings.
- Complexity totals.
- Scale and footprint.
- Required-role completeness.
- Dependency status.
- Icon readiness.
- LOD readiness.
- Suggested fixes.
- Reviewer sign-off.

# 30. Proof-of-Concept Scope and Acceptance Criteria

## 30.1 Required POC Body Plans

### Humanoid

- Standard 1.75 m voxel humanoid.
- Head, torso, two arms, two legs, hands and feet.
- Main equipment sockets.
- Icon focus and collision profile.
- Retargetable short/tall variants.

### Four-Armed Humanoid

- Additional indexed arm pair.
- Independent sockets.
- Clear compatibility classification.
- No assumption that all four hands use weapons.

### Pig

- Compact quadruped template.
- Snout, ears, four legs and tail.
- Valid walk/trot/run roles.
- Harness socket and feeding marker.

### Spider

- Eight articulated leg chains.
- Four gait groups or configurable procedural grouping.
- Wall/ceiling contact sets.
- Fang and web/spinneret markers.

### Giant Centipede

- At least 24 repeated body segments.
- Leg pair per segment.
- Deterministic taper and variation.
- Regional collision and LOD plan.

### Bird

- Folded and open wing bounds.
- Perch contacts.
- Take-off, flight and landing roles.
- Beak and head focus markers.

### Dragon-Scale Test

- Four legs, two wings, neck chain and tail chain.
- Breath socket.
- Multiple damage/LOD regions.
- Folded and open wing clearances.
- Modular voxel sources rather than one monolithic volume.

### Custom Graph

- One unconventional entity assembled without a fixed template.
- Must validate, bake, icon-capture and preview successfully.

## 30.2 POC Acceptance Criteria

The anatomy system passes POC when:

1. All required models remain editable voxel source assets.
2. Each entity declares world size and density.
3. Templates generate valid body-plan graphs with stable node IDs.
4. Pig, spider, centipede, bird and dragon use distinct appropriate architectures.
5. Limb and segment counts are data-driven.
6. Symmetry can be broken without corrupting the graph.
7. Contact sets and clearance previews are available.
8. Icon framing metadata works in live capture.
9. Simplified collision suggestions can be generated and edited.
10. LOD groups exist for complex and repeated bodies.
11. Dependencies appear in the Forge dependency graph.
12. Incompatible overrides produce clear migration warnings.
13. Validation reports identify hierarchy, scale and readability problems.
14. Baked runtime products preserve silhouette and scale.
15. Existing source assets remain recoverable after overrides.

## 30.3 Explicit POC Deferrals

The POC does not require:

- Final player character customisation breadth.
- Every race or creature family.
- Full procedural gait implementation.
- Final combat hitbox tuning.
- Full boss severing or climb systems.
- Full aquatic gameplay.
- Final public modding tools.
- Audio production or particle/VFX authoring.

# 31. Relationships With Documents 22C-22L

| Document | Relationship to 22B |
| --- | --- |
| 22C - Humanoid Player Character and NPC Creator | Uses humanoid anatomy roles, proportion profiles, equipment compatibility and facial-part standards. |
| 22D - Creature, Mob, Monster and Boss Model Creator | Uses every non-humanoid body family, template, segment and custom-graph rule. |
| 22E - Skeletons, Rigging, Joints, IK and Attachments | Converts anatomy nodes, joint anchors, contacts and compatibility roles into rigs and procedural targets. |
| 22F - Entity Animation, Locomotion, Combat and Visual States | Uses locomotion families, contact sets, wing/limb roles, chain bodies and animation events. |
| 22G - Customisation, Equipment, Variants and Visual Inheritance | Uses anatomy inheritance, symmetry, optional modules, equipment regions and compatible overrides. |
| 22H - Gameplay Integration, Hitboxes, AI Markers and Simulation LOD | Uses region groups, collision, navigation footprints, attack origins, mount markers and LOD groups. |
| 22I - Blueprint Forge | Uses scale, navigation, spawn and structure-clearance data when entities are placed in buildings or world sites. |
| 22J - Unified Forge UI/UX | Provides graph editors, anatomy outliner, template wizard, silhouette tests, icon framing and validation views. |
| 22K - Technical Implementation Plan | Defines Godot Resources, graph storage, deterministic generators, bakers, migrations and runtime products. |
| 22L - Production and Migration Plan | Converts the template library and POC body plans into a full entity-production backlog. |

# Appendix A. Body-Plan Family Matrix

| Body Family | Typical Limbs | Primary Locomotion | Repetition Need | Standard Template |
| --- | --- | --- | --- | --- |
| Humanoid | 2 arms, 2 legs | Biped | Low | Yes |
| Four-Armed Humanoid | 4 arms, 2 legs | Biped | Low | Yes |
| Compact Quadruped | 4 legs | Quadruped walk/run | Low | Yes |
| Canine/Feline | 4 legs | Flexible quadruped | Low | Yes |
| Hoofed Grazer | 4 legs | Walk/trot/gallop | Low | Yes |
| Hexapod | 6 legs | Tripod gait | Medium | Yes |
| Spider | 8 legs | Alternating gait/climb | Medium | Yes |
| Scorpion | 8 legs + claws + tail | Multi-leg + tail attack | Medium | Yes |
| Centipede | Many leg pairs | Travelling wave | Very High | Yes |
| Worm | None | Wave/burrow | High | Yes |
| Serpent | None or small limbs | Slither/swim | High | Yes |
| Bird | 2 legs, 2 wings | Hop/walk/flight | Medium | Yes |
| Bat | 2 legs, wing-arms | Flight/hang | Medium | Yes |
| Wyvern | 2 legs, 2 wing-arms | Walk/flight | Medium | Yes |
| True Dragon | 4 legs, 2 wings | Walk/flight | High | Yes |
| Fish | Fins + tail | Swim | Medium | Yes |
| Amphibian | Usually 4 limbs | Land/swim | Low | Yes |
| Floating Entity | Optional orbit parts | Hover | Variable | Yes |
| Slime | None | Deform/jump | Low | Yes |
| Golem | Variable | Template-dependent | Low-Medium | Yes |
| Plant Being | Roots/branches | Rooted or walk | Variable | Yes |
| Hybrid | Mixed | Mixed | Variable | Composite |
| Custom Graph | Any | Any | Any | Empty graph |

# Appendix B. Anatomy Role and Naming Register

| Role | Recommended ID Example | Notes |
| --- | --- | --- |
| Root | anatomy.common.root.center.00.root | Exactly one required. |
| Pelvis | anatomy.humanoid.pelvis.center.00.main | Humanoid root region. |
| Torso | anatomy.common.torso.center.00.main | Main body mass. |
| Head | anatomy.common.head.center.00.main | May be multiple with indexed IDs. |
| Jaw | anatomy.common.head.center.00.jaw | Hinge or frame-swapped. |
| Arm | anatomy.humanoid.arm.left.01.upper | Side and pair index required. |
| Leg | anatomy.quadruped.leg.front_left.01.upper | Use body-relative side token. |
| Wing | anatomy.dragon.wing.left.01.upper | Pair index supports multiple wing sets. |
| Tail | anatomy.common.tail.center.01.segment | Number chain segments consistently. |
| Segment | anatomy.centipede.segment.center.012.body | Fixed-width index. |
| Horn | anatomy.common.head.left.01.horn | Decorative or breakable role separate. |
| Eye | anatomy.common.head.left.01.eye | Can be material, voxel part or marker. |
| Hand Socket | socket.equipment.hand.right.01.main | Socket namespace separate from anatomy. |
| Foot Contact | contact.ground.foot.left.01.sole | Surface contact marker. |
| Breath Origin | socket.attack.mouth.center.01.breath | Marker does not own attack logic. |
| Icon Focus | marker.presentation.icon.center.00.focus | Preferred framing centre. |

# Appendix C. Scale and Density Presets

| Preset | World Dimensions | Standard Voxel Envelope | Use |
| --- | --- | --- | --- |
| Humanoid Standard | 0.6 x 0.4 x 1.75 m | about 20 x 13 x 56 | Player/NPC baseline. |
| Humanoid Short | 0.7 x 0.5 x 1.35 m | about 22 x 16 x 43 | Dwarf-like or short species. |
| Pig Adult | 1.2 x 0.45 x 0.8 m | about 38 x 14 x 26 | Compact livestock. |
| Wolf | 1.5 x 0.5 x 0.9 m | about 48 x 16 x 29 | Canine quadruped. |
| Spider Small | 0.7 x 0.7 x 0.25 m | about 22 x 22 x 8 | Common cave creature. |
| Spider Giant | 3.0 x 3.0 x 1.4 m | modular | Large monster. |
| Centipede Giant | 8.0 x 0.8 x 0.6 m | repeated 16-32 voxel segments | Segmented monster. |
| Bird Small | 0.35 m body, 0.7 m wingspan | modular | Ambient/utility bird. |
| Dragon Young | 5 m body, 8 m wingspan | modular standard density | Large creature. |
| Dragon Adult | 12+ m body, 20+ m wingspan | modular mixed budget | Giant/boss. |

These are starting presets, not immutable species measurements.

# Appendix D. Example Body-Plan Graphs

## D.1 Pig

```text
pig.root
`-- pig.torso
    |-- pig.neck
    |   `-- pig.head
    |       |-- pig.snout
    |       |-- pig.ear_left
    |       `-- pig.ear_right
    |-- pig.leg_front_left
    |-- pig.leg_front_right
    |-- pig.leg_rear_left
    |-- pig.leg_rear_right
    `-- pig.tail
```

## D.2 Spider

```text
spider.root
`-- spider.thorax
    |-- spider.abdomen
    |-- spider.head_front
    |-- spider.leg_left_01
    |-- spider.leg_right_01
    |-- spider.leg_left_02
    |-- spider.leg_right_02
    |-- spider.leg_left_03
    |-- spider.leg_right_03
    |-- spider.leg_left_04
    `-- spider.leg_right_04
```

## D.3 Centipede

```text
centipede.root
`-- centipede.head
    `-- centipede.segment_generator[001..036]
        `-- centipede.tail
```

Each generated segment owns one left and one right walking leg and maps to one of six regional groups.

## D.4 Bird

```text
bird.root
`-- bird.torso
    |-- bird.neck
    |   `-- bird.head
    |       `-- bird.beak
    |-- bird.wing_left
    |-- bird.wing_right
    |-- bird.leg_left
    |-- bird.leg_right
    `-- bird.tail_feathers
```

## D.5 True Dragon

```text
dragon.root
`-- dragon.chest
    |-- dragon.neck_chain
    |   `-- dragon.head
    |       |-- dragon.jaw
    |       |-- dragon.horns
    |       `-- dragon.breath_socket
    |-- dragon.wing_left
    |-- dragon.wing_right
    |-- dragon.front_leg_left
    |-- dragon.front_leg_right
    |-- dragon.rear_leg_left
    |-- dragon.rear_leg_right
    `-- dragon.tail_chain
```

# Appendix E. Anatomy Validation Checklist

- [ ] Approved source is voxel-based.
- [ ] Body-plan ID and schema version are present.
- [ ] Exactly one graph root exists.
- [ ] No transform cycle exists.
- [ ] Required body roles are present.
- [ ] Node IDs are unique and stable.
- [ ] World dimensions and density profile are declared.
- [ ] Mixed-density connections are explicit.
- [ ] Neutral pose is valid.
- [ ] Ground, perch, climb, swim or hover contacts are declared as required.
- [ ] Limb, wing, head, tail and segment counts match the intended body.
- [ ] Symmetry and repetition rules resolve deterministically.
- [ ] Joint and pivot clearances have been previewed.
- [ ] Equipment and interaction sockets are valid.
- [ ] Damage and LOD regions are grouped appropriately.
- [ ] Simplified collision exists or is explicitly deferred for concept assets.
- [ ] Navigation footprint and clearance are documented.
- [ ] Silhouette passes front, side and three-quarter tests.
- [ ] Icon focus and preferred pose are present.
- [ ] Complex/repeated bodies include LOD plans.
- [ ] Dependencies resolve through the Forge Project Manifest.
- [ ] Override compatibility is classified.
- [ ] Validation report contains no hard errors.
- [ ] Approved revision and reviewer are recorded.

# Appendix F. Glossary

| Term | Meaning |
| --- | --- |
| Anatomy Role | Semantic purpose assigned to a body node, separate from its display name. |
| Body Family | Broad structural category such as humanoid, quadruped or arthropod. |
| Body-Plan Graph | Directed hierarchy of voxel body parts, joints, sockets, contacts and generators. |
| Contact Set | Named collection of surface-contact markers for a movement mode. |
| Density Profile | Number of authoring voxel cells per world metre. |
| Guide Curve | Editable path controlling a chain, horn, tail or repeated body. |
| Junction | Explicit connection between two body-plan subgraphs. |
| Locomotion Family | Movement architecture expected by a body, such as quadruped gait or flight. |
| Neutral Pose | Standard modelling and rigging pose used as a reference. |
| Region Group | Collection of parts used for damage references, LOD, selection or breakage. |
| Repetition Generator | Deterministic rule producing repeated voxel parts or segments. |
| Rig Compatibility | Declared level of animation/skeleton sharing between body plans. |
| Scale Class | Approximate physical-size and production-budget category. |
| Symmetry Group | Authoring relationship that mirrors or radially repeats body parts. |
| Voxel Source of Truth | Editable voxel data from which runtime meshes and products are baked. |
