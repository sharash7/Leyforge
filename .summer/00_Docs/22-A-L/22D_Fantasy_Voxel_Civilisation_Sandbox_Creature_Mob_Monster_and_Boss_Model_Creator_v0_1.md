# Fantasy Voxel Civilisation Sandbox
## 22D - Creature, Mob, Monster and Boss Model Creator
### Voxel Creature Construction, Variant Families, Boss Presentation and Production Workflow
**Version 0.1 - Detailed Design Bible Draft**

A voxel-only creature creation system for livestock, wildlife, mounts, ambient life, hostile mobs, magical beings, multi-legged monsters, segmented crawlers, birds, dragons, constructs and bosses inside the Leyforge Forge.

## Creature, Mob, Monster and Boss Model Creator Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Forge workspace and data rules for creating non-humanoid animals, creatures, mobs, monsters, mounts, constructed beings and bosses through voxel source models, body-plan templates, modular anatomy, repeated segments, surface materials, variants, damage presentations, icon capture, validation and proof-of-concept creature families. |
| Core Philosophy | Creature authoring should make a simple pig quick to create while allowing spiders, giant centipedes, birds, dragons and unusual bosses to use specialised body plans without being forced into a humanoid workflow. |
| Voxel Direction | Every visible creature body, limb, wing, tail, horn, shell, feather cluster, scale plate, tooth, eye and attachment created in the Forge originates from editable voxel source data or voxel-producing modifiers. Runtime meshes are baked derivatives and never replace the voxel source of truth. |
| Body-Plan Direction | Use reusable body-plan templates and flexible body graphs for quadrupeds, multi-legged arthropods, segmented crawlers, serpents, avians, winged beasts, dragons, aquatic creatures, amorphous entities, constructs and hybrids. |
| Simplicity Direction | Common animals should be creatable through guided templates, proportion controls, palette assignment and a small number of body-part edits rather than requiring manual skeleton construction. |
| Complexity Direction | Advanced creators may change limb counts, add repeated segments, create custom joints, attach multiple wings or tails, define boss regions and build entirely custom voxel body graphs. |
| Creature-Family Direction | Parent creature families should share body plans, materials, rigs, animation compatibility and marker conventions while allowing species, biome, culture, corruption, age and boss variants. |
| Surface Direction | Fur, feathers, scales, skin, chitin, bone, stone, metal, plant tissue, crystal and magical matter remain stylised voxel materials with reusable Material DNA and readable silhouettes. |
| Animation Preparation | This creator defines named body parts, joints, segment chains, contact points, movement roles, sockets and animation compatibility. Rigging and animation implementation are expanded in Documents 22E and 22F. |
| Gameplay Boundary | The Forge places visual regions, hitbox suggestions, attack origins, mount seats and interaction markers, but AI decisions, damage authority, statistics, loot, spawning and combat rules remain owned by gameplay systems. |
| Boss Direction | Bosses use the same voxel source principles as ordinary creatures but may add scale tiers, phase presentations, breakable regions, targetable parts, arena anchors, cinematic cameras and multiple icon or codex profiles. |
| Procedural Direction | Repeated limbs, body segments, horn growth, feather layouts, markings and family variation may use deterministic procedural tools whose seeds and parameters are stored and reproducible. |
| Icon Direction | The live model viewer can capture item-like creature tokens, codex images, portraits, boss cards, spawn-egg icons and thumbnails from reproducible camera, pose, state, lighting and background profiles. |
| Override Direction | Developers may open and manually replace any approved creature model, body part, material, variant, marker set, icon profile or compatible animation presentation while preserving stable creature gameplay IDs unless migration is explicitly required. |
| Validation Direction | Validate voxel integrity, scale, silhouette, grounded contact, limb attachment, segment continuity, wing clearance, collision suggestions, marker placement, LOD, deterministic generation, icon framing, dependencies and runtime budgets. |
| Audio/VFX Boundary | The Forge may expose named sockets and event references for later sound and visual-effect systems, but full audio production and particle/VFX authoring are deferred beyond this document set. |
| Implementation Context | Godot with Summer Engine is the current implementation target. This document locks creature-model authoring contracts; technical class design, runtime integration and unified Forge UI are expanded in 22E-22K. |
| POC Direction | Prove a pig, spider, giant centipede, bird and dragon using five different body plans, plus one livestock variant family, one hostile variant family, one breakable boss region test, live icon capture and complete validation. |

## Document Purpose

This document defines how the Leyforge Forge creates, edits, previews, validates and stores creatures that do not fit the standard humanoid character creator. It covers ordinary animals, livestock, ambient life, tameable beasts, hostile mobs, arthropods, segmented monsters, flying creatures, dragons, magical beings, constructed entities and large bosses.

The system must support two opposite production needs. A developer should be able to create a readable pig or bird quickly from a guided template, while still being able to build a twenty-segment centipede, an eight-legged spider, a four-winged magical predator or a dragon with breakable wings and several combat phases. These goals are compatible when simple templates and advanced body graphs share the same underlying voxel source, stable IDs and validation rules.

The creature creator is not a conventional smooth-mesh modeller. Every approved creature originates from voxel cells, voxel brushes, voxel-generated primitives, repeated voxel segments or non-destructive modifiers that output voxel geometry. The Forge may merge visible faces, simplify repeated geometry, bake LODs and generate runtime collision, but those products remain rebuildable from editable voxel source data.

The creator also separates visual authoring from gameplay authority. A model can declare a mouth socket, a bite region, a rider seat, a weak-point marker or a breakable wing presentation, but it does not decide damage, AI goals, taming rules, loot tables or spawn conditions. Those systems reference the creature presentation through stable contracts.

This document does not define final rig solvers, procedural gait algorithms, animation blend graphs, AI behaviour trees, combat balance, ecology simulation, creature spawning, complete VFX or complete audio production. It establishes the creature-model architecture those later systems must use.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Documents 21A-21G define the Voxel Asset Forge. Document 22A expands it into the Entity Forge and Blueprint Forge, Document 22B defines body-plan architecture, and Document 22C defines humanoid creation. This document provides the dedicated non-humanoid creature, monster and boss modelling workspace.

## Design Sources

| Source Document | Relevant Direction | How 22D Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Creatures may use more detailed models than terrain while remaining stylised, readable and voxel-consistent. | Locks voxel-authored creature silhouettes and avoids realism that would conflict with the world's visual language. |
| 04 - Items Registry | Creature drops, trophies, saddles and equipment are stable item definitions linked to visuals. | Keeps creature equipment and drops outside the body model while allowing preview sockets and icon links. |
| 09 - Magic System | Magical creatures, constructs, corruption and elemental states make magic visible in the world. | Adds magical material layers, rune sockets, elemental variants and corruption presentations without owning spell rules. |
| 10 - Creatures and Monsters | Creatures include wildlife, livestock, hostile mobs, faction enemies, magical beings, bosses and constructed entities with readable roles and variants. | Defines the model creator around the full creature-category range and requires clear silhouettes, movement roles and system-facing markers. |
| 11 - Biomes and World Generation | Biomes control ecology, creature spawns, magical density and visual variation. | Supports biome palettes, environmental adaptations and family variants while leaving spawning external. |
| 12 - Structures | Nests, pens, caves, arenas and creature structures interact with world geometry and blueprints. | Requires footprint, clearance, perch, burrow and arena-preview testing. |
| 16 - Combat, Gear and Defence | Creatures need attack origins, hit regions, armour, weak points and boss-readable phases. | Adds presentation markers and breakable-region authoring while keeping authoritative combat external. |
| 21B - Voxel Modelling, Texturing and Material Authoring | Source assets remain editable voxel data, use Material DNA and bake into efficient runtime products. | Supplies core modelling, palette, source-versus-baked and modifier rules. |
| 21C - Animation, Effects and Runtime Visual States | Named parts, clips, state bindings, animation events and sockets present runtime activity. | Requires predictable part names, visual states and effect attachment points. |
| 21D - Asset Overrides, Variants and Registry Integration | Stable IDs, inheritance, field-level overrides and migration protect content. | Provides family inheritance, variant, override and dependency rules. |
| 21E - Forge UI/UX and Creator Workflow | Forge workspaces use asset browsing, editing, previews, validation and approval. | Supplies shared editor conventions while 22J later unifies all expanded workspaces. |
| 22A - Forge Entity and Blueprint Expansion | Locks voxel-only entities, live icon capture, manifests, lifecycle, dependency tracking, revision history and testing. | Provides umbrella production and governance requirements. |
| 22B - Entity Model Taxonomy, Anatomy and Body Architecture | Defines quadruped, arthropod, segmented, avian, dragon, aquatic, amorphous and hybrid body graphs. | Supplies the anatomy and role contracts used by every creature in this document. |
| 22C - Humanoid Player Character and NPC Creator | Defines the dedicated humanoid route and shared equipment, identity and icon principles. | Establishes the boundary between humanoid creation and this non-humanoid creature workspace. |

## Static Table of Contents

- 1. Locked Creature Creator Identity
- 2. Locked Direction Summary
- 3. Scope, Users and System Boundaries
- 4. Creature Presentation Definition Architecture
- 5. Voxel Source, Scale and Density Standards
- 6. Creature Creator Workflow and Authoring Modes
- 7. Template Selection and Custom Body Graphs
- 8. Quadruped Architecture
- 9. Livestock and Pig Authoring
- 10. Predators, Mounts and Heavy Beasts
- 11. Arthropods and Spider Authoring
- 12. Hexapods, Crustaceans and Other Multi-Legged Bodies
- 13. Segmented Crawlers and Giant Centipedes
- 14. Serpents, Worms and Flexible Body Chains
- 15. Birds and Avian Creatures
- 16. Bats, Insect Flight and Unusual Wing Plans
- 17. Wyverns, Dragons and Great Flying Beasts
- 18. Aquatic and Amphibious Creatures
- 19. Slimes, Amorphous and Floating Entities
- 20. Plant, Fungal and Living-Environment Creatures
- 21. Constructs, Golems and Artificial Creatures
- 22. Hybrid, Multi-Armed and Custom Anatomy
- 23. Heads, Sensory Organs and Attack Anatomy
- 24. Wings, Tails, Tentacles and Secondary Appendages
- 25. Fur, Feathers, Scales, Skin, Chitin and Material DNA
- 26. Creature Size Tiers, World Fit and Boss Scale
- 27. Creature Families, Variants and Deterministic Generation
- 28. Mob, Elite, Mini-Boss and Boss Authoring
- 29. Damage, Breakable Regions and Phase Presentations
- 30. Sockets, Regions, Hitbox Suggestions and Interaction Markers
- 31. Rig and Animation Preparation Contracts
- 32. Live Preview, Test Laboratory and Environment Tests
- 33. Icon, Codex, Portrait and Thumbnail Capture
- 34. Non-Destructive Modifiers and Procedural Creature Tools
- 35. Developer Overrides, Revisions and Migration
- 36. Registry Fields, Dependencies and Packaging
- 37. Validation, Performance Budgets and Production Lifecycle
- 38. Proof-of-Concept Scope and Acceptance Criteria
- 39. Relationships With Documents 22E-22L
- Appendix A. Creature Template Register
- Appendix B. Body-Part, Region and Socket Register
- Appendix C. Example Creature Presentation Profiles
- Appendix D. Creature Family and Variant Parameter Register
- Appendix E. Scale, Density and Runtime Budget Guidance
- Appendix F. Creature Validation Checklist
- Appendix G. Proof-of-Concept Asset Checklist
- Appendix H. Glossary

# 1. Locked Creature Creator Identity

The Creature, Mob, Monster and Boss Model Creator is the Forge workspace for building voxel entities whose anatomy, locomotion and presentation cannot be adequately handled by the standard humanoid creator. It provides guided templates for common animals and advanced body graphs for multi-legged, segmented, winged, aquatic, amorphous and boss-scale entities.

A completed creature presentation is a resolved assembly of voxel body parts, anatomy roles, materials, variants, damage layers, sockets, marker profiles, icon settings and bake products. The source may be modular or generated, but it must remain reproducible and editable.

> **Locked Rule**  
> Every creature model approved through the Forge must remain voxel-authored at source, use a declared body architecture and preserve separation between visual presentation and authoritative gameplay behaviour.

## 1.1 Creator Promise

A developer should be able to open any creature and immediately answer:

- Which body-plan template or custom graph does it use?
- Which parts are unique and which are inherited from a family?
- How many legs, arms, wings, tails, segments and attack appendages exist?
- Which voxel density and world scale does the model use?
- Which joints, contact points and movement roles are required?
- Which visual regions are targetable, breakable, armoured or phase-dependent?
- Which materials and deterministic variants define the species?
- Which sockets and markers connect it to combat, AI, mounting, interaction and future VFX or audio?
- Which icons and codex captures are generated from the live model?
- Which dependencies and existing creatures are affected by a parent change?

## 1.2 Design Pillars

| Pillar | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel Authenticity | All visible geometry originates from editable voxel source. | Creatures belong naturally beside voxel terrain, props and characters. |
| Body-Plan Fit | Each creature uses anatomy suited to its actual shape and limb count. | Spiders, centipedes, birds and dragons move and read differently. |
| Guided Simplicity | Templates reduce the work needed for common animals. | Livestock and wildlife can be produced at useful scale. |
| Advanced Freedom | Custom graphs, segments and modifiers support unusual monsters. | Bosses and fantasy creatures are not limited to preset anatomy. |
| Family Reuse | Related creatures share authored foundations and compatible outputs. | Variants feel related without being duplicated assets. |
| Readable Threat | Silhouette, anatomy, size and damage states communicate function. | Players can identify danger and counterplay quickly. |
| Runtime Discipline | Baked meshes, LOD and simplified collision respect budgets. | Large ecosystems and raids remain technically practical. |

## 1.3 What the Creature Creator Is Not

- It is not an AI behaviour-tree editor.
- It is not a creature statistics or loot-table editor.
- It is not a smooth sculpting package with voxel style applied afterward.
- It is not a requirement that every creature use a skeletal rig.
- It is not a promise that one animation set fits every body plan.
- It is not a replacement for authored silhouette and material decisions.
- It is not a full audio or particle-production suite.
- It is not permission to use hundreds of active physics bodies simply because a creature has many parts.

# 2. Locked Direction Summary

| Area | Locked Decision |
| --- | --- |
| Source Geometry | All visible creature geometry comes from voxel cells, voxel brushes, voxel-generated primitives, repeated voxel modules or modifiers that output voxel geometry. |
| Runtime Product | Hidden-face removal, greedy meshing, surface merging, instancing, LOD and simplified collision may optimise the model without replacing source voxels. |
| Body Plans | Provide guided templates plus fully editable body graphs for unusual creatures. |
| Simple Animals | Pig, sheep, cow, wolf, horse and similar animals should be creatable from proportion profiles and modular heads, legs, tails and materials. |
| Multi-Legged | Support declared limb counts, mirrored limb banks, gait groups and contact-point roles rather than hard-coded four-leg assumptions. |
| Segmented Bodies | Support repeated body modules, taper curves, segment variation, optional legs per segment and grouped runtime simulation. |
| Flying Creatures | Declare wing roots, wing chains, feather or membrane groups, flight footprint, perch points and landing contact roles. |
| Dragons | Use configurable dragon templates supporting two or four legs, two or more wings, neck and tail chains, jaw and breath sockets, breakable regions and boss phases. |
| Amorphous Bodies | Permit rigid-part, voxel-frame, material and procedural presentation where conventional limb rigs are unsuitable. |
| Creature Families | Use parent species/family definitions with local variants, deterministic markings and controlled anatomy overrides. |
| Bosses | Add phase models, breakable regions, targetable parts, cinematic anchors and arena-size validation while retaining the same voxel source rule. |
| Gameplay Markers | The Forge authors presentation-facing markers; gameplay systems own actual damage, AI, taming, loot and spawning. |
| Icon Capture | Generate codex images, creature portraits, boss cards and thumbnails directly from the live voxel model. |
| Overrides | Allow field-level replacement, comparison and reversion without changing stable gameplay IDs. |
| Validation | Hard-fail invalid source, disconnected required anatomy, broken segment chains, missing critical markers, invalid IDs and unsafe registry conflicts. Use warnings for budget or readability concerns that may be intentionally overridden. |

# 3. Scope, Users and System Boundaries

## 3.1 Primary Users

The first version is a developer-facing Forge workspace used by:

- Ash and authorised Leyforge collaborators.
- Summer Engine or other approved development agents.
- Voxel artists and creature designers.
- Technical animators and rig authors.
- Combat and AI designers placing required markers.
- World and encounter designers creating creature families.
- QA reviewers validating readability, fit and performance.

A restricted modding or player-facing creature creator may be considered later, but it is not required for the first implementation.

## 3.2 Supported Creature Categories

The workspace supports:

- Ambient wildlife.
- Livestock and farm animals.
- Tameable companions and mounts.
- Neutral and territorial beasts.
- Hostile overworld mobs.
- Cave and underground creatures.
- Arthropods and multi-legged monsters.
- Segmented crawlers and serpents.
- Birds and flying creatures.
- Aquatic and amphibious entities.
- Magical, elemental, fae and spirit creatures.
- Undead or corrupted non-humanoids.
- Constructs, golems and living machines.
- Dungeon elites, mini-bosses and world bosses.
- Dragon, titan and raid-scale creatures.

Humanoid villagers, player characters and standard humanoid enemies remain primarily owned by 22C, though hybrid or heavily altered humanoids may reference both creators.

## 3.3 External Ownership Boundaries

| System | Owns | Creature Creator References |
| --- | --- | --- |
| Creature Registry | Stable creature identity, category, family, threat tier and gameplay tags. | Presentation ID, body plan, family, marker profile and icon links. |
| AI System | Senses, goals, navigation decisions, tactics, morale and task authority. | Eye, hearing, contact, movement and interaction origins. |
| Combat System | Damage, armour, attacks, status, break logic and authoritative hit resolution. | Suggested hit regions, weak-point markers, attack sockets and visual damage states. |
| Spawning/Ecology | Biomes, population rules, nests, time, weather and world pressure. | Scale, footprint, habitat preview tags and variant references. |
| Items Registry | Saddles, armour, harnesses, drops, trophies and held equipment. | Fit profiles, attachment sockets and preview links. |
| Animation System | Rigs, clips, procedural gait, IK, blending and animation events. | Named anatomy roles, chains, contact points and clip compatibility. |
| Magic System | Magical powers, mana behaviour, corruption and ritual rules. | Rune sockets, elemental materials and visual state profiles. |
| Forge | Voxel source, body assembly, materials, visual regions, icons, previews and baked outputs. | Does not become authoritative gameplay logic. |

## 3.4 Separation Example

```text
Creature definition: creature.livestock.forest_pig
Family: family.pig
AI profile: ai.passive_grazer
Loot table: loot.pig.standard
Presentation: entity.pig.forest_base
Appearance seed: 184233
Variant: spotted_brown
Current state: muddy + fed
```

Changing the pig's voxel snout or spotted palette does not alter its health, breeding, drops, AI or ownership.

# 4. Creature Presentation Definition Architecture

## 4.1 Layered Definition

```text
CreaturePresentationDefinition
|-- creature_family_id
|-- body_plan_id
|-- scale_profile_id
|-- voxel_source_set
|-- body_part_graph
|-- material_profile_id
|-- variant_profile_id
|-- damage_presentation_id
|-- marker_profile_id
|-- rig_compatibility_id
|-- animation_compatibility_id
|-- icon_capture_profiles[]
|-- lod_profile_id
|-- bake_profile_id
|-- dependencies[]
|-- lifecycle_state
```

## 4.2 Definition Layers

| Layer | Purpose | Examples |
| --- | --- | --- |
| Family Definition | Shared identity and compatibility for related creatures. | Pig family, spider family, dragon family. |
| Body Plan | Declares graph roles, symmetry, limb banks and segment chains. | Quadruped, octopod arthropod, avian, dragon. |
| Voxel Source Set | Editable volumes and modifiers for visible parts. | Torso, head, leg, wing, shell, horn. |
| Material Profile | Assigns skin, fur, feather, scale, chitin, bone or magical matter. | Forest pig hide, crystal spider shell. |
| Variant Profile | Controls weighted or selected visual differences. | Spotted, albino, winter coat, corrupted. |
| Marker Profile | Connects presentation to gameplay systems. | Mouth socket, rider seat, weak point. |
| Damage Presentation | Defines visual layers and broken-part variants. | Scarred hide, cracked shell, torn wing. |
| Capture Profile | Produces icons and codex images. | Full-body codex, boss card, spawn icon. |
| Bake Profile | Controls runtime mesh, LOD, collision and instancing outputs. | Small wildlife, raid creature, boss. |

## 4.3 Stable Identity Rule

Creature gameplay IDs, visual presentation IDs, body plans, materials and variants remain separate. A species may change visual presentation without invalidating existing save records, provided the replacement satisfies declared compatibility and migration rules.

# 5. Voxel Source, Scale and Density Standards

## 5.1 Voxel-Only Source Rule

Approved source geometry may be created through:

- Direct voxel placement and removal.
- Voxel brushes and selections.
- Voxel-generated boxes, spheres, cylinders, cones and arches.
- Curve-following voxel placement.
- Repeated voxel modules.
- Mirror, array, taper, bend, twist, hollow and material modifiers.
- Conversion of an approved Forge voxel asset into a reusable body part.

A smooth imported mesh may be used only as a temporary reference or guide. It cannot be the approved editable source unless it is converted into reviewed voxel geometry.

## 5.2 Standard Density Bands

| Creature Band | Suggested Authoring Density | Use |
| --- | --- | --- |
| Tiny Ambient | 8-24 voxels across primary body | Insects, small birds, visual ambience. |
| Small Creature | 24-48 voxels across primary body | Piglet, chicken, rabbit, small spider. |
| Standard Creature | 32-64 voxels across primary body | Pig, wolf, sheep, medium monster. |
| Large Creature | Modular 48-96 voxel body parts | Bear, horse, ogre-beast, large spider. |
| Huge Creature | Modular 64-128 voxel body parts | Dragon, giant, siege monster. |
| Titan/Boss | Multiple modular volumes with dedicated LOD | World boss, ancient dragon, colossal construct. |

Density is a visual and production guide rather than a direct runtime voxel count. Large creatures should use modular parts instead of one enormous monolithic volume.

## 5.3 World Scale

All creatures are previewed against the one-metre world grid. Scale profiles must show:

- Standing height.
- Body length and width.
- Ground footprint.
- Door and tunnel clearance.
- Attack and turning clearance.
- Camera framing.
- Mount seat height where relevant.
- LOD transition distances.

## 5.4 Density Consistency

The Forge should warn when:

- One body part is far denser than the rest of the creature.
- A creature family uses visibly incompatible voxel densities.
- Very small details disappear at normal gameplay distance.
- feather, fur or scale treatment creates excessive noise.
- a large creature uses tiny detail that cannot survive LOD.

# 6. Creature Creator Workflow and Authoring Modes

## 6.1 Guided Workflow

1. Create a new creature presentation or duplicate an approved template.
2. Select a creature family or create a new family.
3. Choose a body-plan template.
4. Select world scale and density profile.
5. Adjust proportions, limb counts and segment counts.
6. Edit voxel body parts and materials.
7. Define or confirm anatomy roles and joints.
8. Place contact points, attack origins, seats and interaction markers.
9. Configure variants and damage presentations.
10. Assign capture, LOD and bake profiles.
11. Run test-laboratory scenarios.
12. Validate, compare, approve and bake.

## 6.2 Authoring Modes

| Mode | Purpose | Typical User |
| --- | --- | --- |
| Guided Template | Fast creation from approved body plans. | Content designer or new artist. |
| Body Graph | Advanced topology, limb count and segment editing. | Creature designer or technical artist. |
| Voxel Sculpt | Direct part-by-part shape authoring. | Voxel artist. |
| Material and Variant | Surface, markings and family variation. | Character/material artist. |
| Marker and Region | Gameplay-facing sockets and region setup. | Technical designer. |
| Damage and Phase | Broken parts, armour and boss presentation. | Combat/boss designer. |
| Capture Studio | Icons, portraits and codex renders. | Content/UI designer. |
| Test Laboratory | Movement, scale, collision and readability tests. | Artist, animator and QA. |

## 6.3 Fast Creation Goal

A common animal created from an approved template should reach a testable draft without requiring custom code or a manually built skeleton. Advanced features remain available without making them mandatory for simple content.

# 7. Template Selection and Custom Body Graphs

## 7.1 Template Families

The Forge should provide templates for:

- Small quadruped.
- Standard quadruped.
- Heavy quadruped.
- Spider/octopod.
- Hexapod insect.
- Crab or lateral arthropod.
- Segmented crawler.
- Serpent.
- Standard bird.
- Bat or membrane-winged flier.
- Wyvern.
- Four-legged dragon.
- Fish.
- Amphibian.
- Slime.
- Floating entity.
- Plant creature.
- Construct/golem.

## 7.2 Template Contents

A template includes:

- Required and optional anatomy roles.
- Default symmetry.
- Limb and segment ranges.
- Suggested joint chains.
- Standard contact points.
- Default collision approach.
- Compatible rig and animation families.
- Scale and density guidance.
- Marker suggestions.
- Preview scenarios.

## 7.3 Custom Graph Mode

Advanced users may:

- Add, remove or rename body nodes.
- Create multiple limb banks.
- Attach four or more arms.
- Add more than one wing pair.
- Use multiple heads or tails.
- Mix rigid and flexible chains.
- Define repeated segment modules.
- Create asymmetric anatomy.
- Mark optional, transformable or phase-only parts.

Custom graphs must still validate parentage, joint continuity, role uniqueness and runtime budgets.

# 8. Quadruped Architecture

Quadrupeds cover pigs, cows, sheep, wolves, bears, horses and many fantasy beasts. The default graph is simple enough for rapid authoring but supports specialised necks, paws, hooves, claws, tails, horns and saddles.

```text
root
|-- body
|   |-- neck
|   |   `-- head
|   |-- front_left_leg
|   |-- front_right_leg
|   |-- rear_left_leg
|   |-- rear_right_leg
|   `-- tail
```

## 8.1 Quadruped Proportion Controls

- Body length, width and depth.
- Shoulder and hip height.
- Neck length and angle.
- Head scale and muzzle length.
- Front and rear leg length.
- Paw, hoof or claw size.
- Back curvature.
- Tail length, thickness and curl.
- Ear and horn placement.

## 8.2 Leg Roles

Each leg declares:

- Root joint.
- Upper and lower limb parts.
- Optional ankle, hock or wrist.
- Ground-contact point.
- Foot orientation.
- gait group.
- collision contribution.
- injury or break presentation group.

## 8.3 Quadruped Validation

The Forge checks that:

- Feet can reach a common ground plane in the neutral pose.
- Body height fits declared terrain and doorway profiles.
- Limbs do not intersect the torso through expected movement ranges.
- Turn radius and body length are plausible for preview navigation.
- Saddle or rider sockets remain above the back surface.

# 9. Livestock and Pig Authoring

The pig is the first guided quadruped test because it is visually simple, recognisable and useful for validating body shape, materials, family variants, feeding poses and livestock-scale performance.

## 9.1 Pig Template

```text
Template: quadruped.small_heavy
Body: low, broad and rounded voxel volume
Head: short neck + wedge head + voxel snout
Legs: four short limb chains
Tail: short curved or stepped voxel chain
Ears: two readable ear parts
Materials: skin/hide + optional coarse hair + hoof material
```

## 9.2 Required Pig Presentation States

- Neutral idle.
- Walking pose preview.
- Eating or rooting pose.
- Sleeping pose.
- Muddy overlay.
- Injured overlay.
- Juvenile proportion profile.
- Wild boar family variant.

## 9.3 Pig Family Variants

| Variant | Shared | Overrides |
| --- | --- | --- |
| Domestic Pig | Core body, rig, sockets. | Softer proportions, farm palettes, shorter tusks. |
| Wild Boar | Core family and gait. | Longer legs, stronger shoulders, tusks, coarse hair. |
| Snow Boar | Boar body. | Dense coat, pale palette, larger feet. |
| Corrupted Boar | Body and movement roles. | Distorted tusks, corruption material, glowing eyes. |
| Giant Boar Boss | Family identity and some clips. | Boss scale, armour regions, phase parts, unique head. |

## 9.4 Livestock Generalisation

The same workflow should support sheep, cows, goats and similar livestock through different head, horn, body, tail and material families. Breeding, hunger, ownership and production remain gameplay-system concerns.

# 10. Predators, Mounts and Heavy Beasts

Predators and mounts often share quadruped architecture but need stronger motion silhouettes and additional attachment contracts.

## 10.1 Predator Features

- Flexible spine profile.
- Strong head-tracking origin.
- Bite and claw attack sockets.
- Readable shoulder and hip movement.
- Paw contact points.
- optional mane, crest or quills.
- stalking and crouch envelope.

## 10.2 Mount Features

- Rider seat socket.
- Saddle fit region.
- Rein or control sockets.
- Mount camera anchor.
- Mount/dismount interaction points.
- Rider clearance bounds.
- Equipment and pack attachment regions.

## 10.3 Heavy Beast Features

Large bears, oxen, rhinos and siege beasts may use:

- Reinforced collision profile.
- multiple armour regions.
- charge attack origins.
- broader turn-radius preview.
- breakable horn or armour presentation.
- larger terrain-contact zones.

# 11. Arthropods and Spider Authoring

Spiders validate the Forge's multi-legged architecture. Their body plan uses two major body masses and four mirrored leg pairs.

```text
root
|-- cephalothorax
|   |-- head_features
|   |-- leg_pair_01
|   |-- leg_pair_02
|   |-- leg_pair_03
|   `-- leg_pair_04
`-- abdomen
    `-- spinneret
```

## 11.1 Spider Leg Banks

Each leg pair may inherit one source limb mirrored left and right, while local offsets and scale create natural variation. Leg banks define gait order without forcing every leg to use an independent animation asset.

## 11.2 Spider Features

- Eight leg roots.
- Fangs and mouth socket.
- Eye cluster or eye material pattern.
- Abdomen variants.
- Spinneret/web socket.
- wall and ceiling contact profile.
- leap origin.
- climb-clearance bounds.

## 11.3 Spider Visual Readability

Small details should not obscure the silhouette. The abdomen, leg span, fang area and movement style should distinguish:

- Cave spider.
- Forest spider.
- Crystal spider.
- Web ambusher.
- Armoured brood guardian.
- Spider boss.

## 11.4 Ground and Wall Preview

The test laboratory should include flat ground, slopes, walls, ceilings and narrow openings so leg reach and body clearance can be inspected before animation integration.

# 12. Hexapods, Crustaceans and Other Multi-Legged Bodies

The same limb-bank system should support six-legged insects, lateral crabs, scorpions and fantasy creatures with non-standard limb arrangements.

## 12.1 Hexapod Template

- Head.
- Thorax.
- Abdomen.
- Three leg pairs.
- Optional wing pair or pairs.
- Antennae.
- mandible or proboscis sockets.

## 12.2 Crab and Lateral Templates

Crab-like creatures may define:

- Broad central shell.
- Sideways locomotion axis.
- Multiple walking-leg pairs.
- two claw arms.
- eyestalks.
- underside contact profile.

## 12.3 Scorpion Extension

A scorpion combines:

- Arthropod leg bank.
- Claw arms.
- segmented tail chain.
- stinger socket.
- armour plates.

This demonstrates that body-plan templates may be composed rather than treated as isolated fixed rigs.

# 13. Segmented Crawlers and Giant Centipedes

Segmented crawlers use one or more repeatable body modules. The giant centipede is the required stress test for repeated segments, many legs and long-body LOD.

## 13.1 Segment Generator

The developer creates:

- Head module.
- Primary body segment.
- Optional alternate segments.
- Tail segment.
- Leg pair module.
- taper and curvature rules.

The Forge then generates a reproducible chain using stored parameters.

```text
Head
|-- Segment 01 + leg pair
|-- Segment 02 + leg pair
|-- Segment 03 + leg pair
|-- ...
`-- Tail
```

## 13.2 Required Parameters

| Parameter | Purpose |
| --- | --- |
| Segment Count | Total repeated body length. |
| Segment Spacing | Distance and overlap between modules. |
| Taper Curve | Scales modules toward head or tail. |
| Leg Frequency | Every segment, alternate segments or custom pattern. |
| Variation Seed | Reproducible armour, colour or spike differences. |
| Runtime Group Size | Combines several segments for LOD and damage handling. |
| Motion Phase Offset | Supports travelling gait waves later. |

## 13.3 Centipede Performance Rules

The source may contain many visible segments, but runtime products should avoid one node or physics body per voxel or per leg. The baker may:

- Merge repeated static surfaces.
- Instance identical segment meshes.
- group leg animation controls.
- simplify collision into several capsules or hulls.
- reduce visible leg animation at distance.
- replace far segments with simplified chains.

## 13.4 Damage Grouping

A fifty-segment centipede does not require fifty independent health pools. Presentation regions may group five or ten segments while retaining local hit feedback and broken-shell visuals.

# 14. Serpents, Worms and Flexible Body Chains

Serpents and worms use flexible chains without mandatory legs. Their silhouette depends on segment continuity, taper and head identity.

## 14.1 Serpent Definition

- Head and jaw.
- Neck segments.
- Body segments.
- Tail segments.
- optional fins, spines or wings.
- mouth, eye and attack sockets.
- ground or swimming contact profile.

## 14.2 Chain Controls

- Segment count and length.
- curvature limits.
- twist limits.
- taper.
- scale patterns.
- dorsal features.
- collision grouping.
- LOD simplification.

## 14.3 Burrowing and Swimming Preview

The Forge may preview poses and clearance for burrowing or swimming, but actual terrain deformation, fluid movement and AI remain external.

# 15. Birds and Avian Creatures

Birds require a body plan that supports both ground and flight presentation.

```text
root
|-- torso
|   |-- neck -> head -> beak
|   |-- left_wing
|   |-- right_wing
|   |-- left_leg
|   |-- right_leg
|   `-- tail_feathers
```

## 15.1 Avian Anatomy Roles

- Wing root, upper wing, lower wing and tip.
- Feather-group layers or membrane substitute.
- Beak and eye origins.
- foot and perch contacts.
- tail-feather steering group.
- flight centre and body balance marker.

## 15.2 Bird Authoring Modes

| Mode | Use |
| --- | --- |
| Small Bird | Ambient birds, songbirds, crows. |
| Ground Bird | Chickens, turkeys and heavy fowl. |
| Raptor | Hawks, eagles and magical hunters. |
| Water Bird | Ducks, geese and swamp creatures. |
| Fantasy Avian | Griffins, winged serpents and multi-winged spirits. |

## 15.3 Feather Treatment

Feathers should be represented through readable voxel clusters, layered planes derived from voxel sources or grouped material regions. Individual feather microgeometry should be limited to major silhouette feathers rather than covering the entire creature with expensive tiny pieces.

## 15.4 Required Bird POC

The POC bird must support:

- Ground idle and perch pose.
- Extended and folded wing source states.
- Clear beak and eye direction.
- flight and landing clearance previews.
- codex icon capture.

# 16. Bats, Insect Flight and Unusual Wing Plans

Not every flying creature uses avian feathered wings.

## 16.1 Membrane Wings

Bat and dragon-like wings may use:

- Voxel bone/finger chains.
- voxel-authored membrane surfaces.
- fold and stretch roles.
- tear or damage regions.
- transparent-material budget warnings.

## 16.2 Insect Wings

Insect wings may use:

- one or two wing pairs.
- rapid-flap compatibility tags.
- thin transparent or emissive materials.
- folded and extended presentation states.
- simplified far-distance geometry.

## 16.3 Multi-Winged Creatures

The body graph may support four or more wings. Each pair declares:

- anatomical parent.
- wing role.
- animation group.
- mirrored relationship.
- collision and clearance participation.
- phase or variant conditions.

# 17. Wyverns, Dragons and Great Flying Beasts

Dragons are a core advanced template because they combine quadruped or biped locomotion, wing flight, flexible necks and tails, large scale, attack sockets and boss presentation.

## 17.1 Supported Dragon Architectures

| Type | Anatomy |
| --- | --- |
| Wyvern | Two legs + two wings + neck + tail. |
| Four-Legged Dragon | Four legs + two wings + neck + tail. |
| Serpentine Dragon | Long body + optional limbs + optional wings. |
| Multi-Winged Dragon | Two or four legs + four or more wings. |
| Aquatic Dragon | Flexible body + fins + optional limbs/wings. |
| Construct Dragon | Voxel armour parts, joints and magical core. |

## 17.2 Dragon Graph

```text
root
|-- torso
|   |-- neck_chain -> head -> jaw
|   |-- front_leg_pair
|   |-- rear_leg_pair
|   |-- wing_pair
|   `-- tail_chain
|-- breath_socket
|-- rider_or_cinematic_anchor
`-- boss_regions
```

## 17.3 Dragon Authoring Controls

- Neck and tail segment count.
- leg count and posture.
- wing span, chord and fold profile.
- head, jaw, horn and crest families.
- scale plate and underbelly materials.
- claw and tooth profiles.
- breath origin and charge region.
- rider, saddle or boss camera anchors.
- breakable wing, horn, armour or tail regions.

## 17.4 Dragon Scale and World Fit

A dragon must be tested against:

- Village streets and roofs.
- forest and mountain clearance.
- cave or lair entrance sizes.
- take-off and landing zones.
- combat arena dimensions.
- camera near and far framing.
- LOD and silhouette readability.

## 17.5 Boss Phase Presentation

A boss dragon may switch or layer:

- intact and damaged wings.
- armour plates.
- glowing throat or chest core.
- enraged material state.
- corrupted or cleansed phase.
- grounded phase after wing damage.

Gameplay decides when phases occur. The Forge stores and previews the associated presentations.

# 18. Aquatic and Amphibious Creatures

Aquatic creatures use body plans based on swimming rather than ground contact.

## 18.1 Fish Template

- Head and body volume.
- flexible spine or segment chain.
- tail fin.
- dorsal, pectoral and optional ventral fins.
- eye, mouth and gill regions.
- swimming centre and body bounds.

## 18.2 Amphibious Template

Frogs, salamanders and similar entities combine:

- ground contacts.
- swimming profile.
- jumping or crawling posture.
- webbed feet or broad tail.
- wetness material state.

## 18.3 Large Aquatic Bosses

Large aquatic creatures may require:

- partial-surface presentation.
- multiple body-region markers.
- waterline preview.
- arena camera anchors.
- tentacle or fin chains.
- simplified off-screen body representation.

# 19. Slimes, Amorphous and Floating Entities

Not every entity needs a conventional skeleton.

## 19.1 Supported Presentation Methods

- Rigid voxel parts.
- Voxel-frame shape changes.
- material animation.
- procedural squash and stretch applied to voxel-derived runtime surfaces.
- floating part chains.
- particle or light sockets for future systems.

## 19.2 Slime Source

A slime remains a voxel-authored volume with approved deformation limits. The editable source may include:

- neutral volume.
- compressed frame.
- stretched frame.
- attack frame.
- damaged or split presentation.
- embedded item or core parts.

## 19.3 Floating Entities

Wisps, floating eyes and magical constructs may declare:

- no ground contacts.
- hover centre.
- orbiting voxel parts.
- gaze or attack origin.
- movement envelope.
- icon pose.

# 20. Plant, Fungal and Living-Environment Creatures

Plant and fungal creatures should look connected to biome materials without becoming indistinguishable from static scenery.

## 20.1 Plant Creature Features

- Root or foot contacts.
- trunk or stem chain.
- branch limb roles.
- leaf, flower or fruit clusters.
- face, eye or core region.
- dormant and active presentations.

## 20.2 Fungal Creature Features

- cap and stalk parts.
- spore sockets.
- soft material families.
- colony or cluster variants.
- glow and corruption states.

## 20.3 Mimicry Validation

The Forge should preview these creatures both active and dormant to ensure the intended level of camouflage is readable and fair.

# 21. Constructs, Golems and Artificial Creatures

Constructs use voxel materials such as stone, wood, metal, bone or crystal and may combine creature anatomy with machine-style parts.

## 21.1 Construct Types

- Humanoid or quadruped golem.
- animated statue.
- living machine.
- rune beast.
- segmented mechanical crawler.
- crystal guardian.
- floating arcane construct.

## 21.2 Construct Features

- Exposed joints or hidden magical joints.
- core socket or core region.
- armour plates.
- mechanical or rune animation groups.
- repair and broken presentations.
- ownership or faction emblem surfaces.

## 21.3 Shared Asset Boundary

Gears, cores and machine parts may reference Item or Block Forge assets, but the creature presentation controls their attachment and creature-scale version. The gameplay automation system remains external.

# 22. Hybrid, Multi-Armed and Custom Anatomy

Fantasy creatures may combine several body architectures.

Examples include:

- Centaur-like beasts.
- Four-armed quadrupeds.
- Spider-bodied humanoids.
- Six-legged dragons.
- bird-serpent hybrids.
- multi-headed wolves.
- winged scorpions.
- floating tentacled constructs.

## 22.1 Composition Rules

A hybrid should:

- Declare one primary root graph.
- attach secondary templates through named connectors.
- resolve duplicate roles explicitly.
- define locomotion authority.
- group mirrored and repeated limbs.
- declare animation compatibility or custom requirements.
- validate collision and marker conflicts.

## 22.2 Multiple Heads

Each head declares:

- identity and role.
- eye and mouth origins.
- target-tracking capability.
- attack sockets.
- hit region.
- icon visibility.
- optional phase or damage state.

# 23. Heads, Sensory Organs and Attack Anatomy

The head is usually the strongest identity and threat-reading region.

## 23.1 Head Components

- Skull or primary head volume.
- muzzle, beak or mouth.
- jaw.
- teeth, fangs or mandibles.
- eyes or eye clusters.
- ears, antennae or sensory fins.
- horns, crests or tusks.
- breath, spit, web or projectile sockets.

## 23.2 Readable Gaze

Eye placement, eye material and head orientation should make direction readable at gameplay distance. Tiny realistic eyes are less useful than stylised voxel eyes that survive lighting and distance.

## 23.3 Attack Anatomy

Attack appendages should expose named origins and presentation ranges:

- Bite.
- horn charge.
- claw swipe.
- stinger.
- tail strike.
- breath cone.
- web or spit projectile.
- tentacle strike.

These markers do not define damage values.

# 24. Wings, Tails, Tentacles and Secondary Appendages

Secondary appendages often need specialised chains and LOD.

## 24.1 Wing Requirements

- Root joint.
- major structural segments.
- fold axis.
- tip role.
- membrane or feather groups.
- collision participation.
- damage region.
- landing and idle state compatibility.

## 24.2 Tail Requirements

- Tail chain.
- taper curve.
- optional club, blade, fin or stinger.
- balance role.
- attack socket.
- break or damage region.

## 24.3 Tentacles

Tentacles may use:

- flexible chains.
- repeated voxel modules.
- grouped procedural controls.
- simplified collision.
- tip sockets.
- distance-based segment reduction.

# 25. Fur, Feathers, Scales, Skin, Chitin and Material DNA

Creature surfaces should communicate biology, environment and threat while remaining voxel-readable.

## 25.1 Material Families

| Material | Visual Identity | Typical Use |
| --- | --- | --- |
| Skin/Hide | Broad colour fields, subtle variation, readable folds. | Pigs, amphibians, reptiles. |
| Fur | Clustered voxel shapes or patterned surface treatment. | Wolves, bears, boars. |
| Feather | Layered silhouette groups and palette bands. | Birds, griffins. |
| Scale | Repeating plates or material pattern with major silhouette scales. | Dragons, reptiles, fish. |
| Chitin | Hard shell plates, edge highlights, segmented seams. | Spiders, insects, centipedes. |
| Bone | Pale hard material, cracks and worn edges. | Undead beasts, bone constructs. |
| Stone/Metal | Hard faceted materials and joints. | Golems and constructs. |
| Crystal | Translucent or emissive facets with strict overdraw budgets. | Magical crawlers, mana beasts. |
| Plant/Fungal | Wood, bark, leaf, moss, cap and spore materials. | Treants, fungi, living vines. |

## 25.2 Surface Detail Rule

Use macro silhouette and major material regions first. Fine voxel detail should support identity rather than covering every surface with noise.

## 25.3 Environmental States

Materials may expose:

- Wet.
- muddy.
- snowy.
- scorched.
- poisoned.
- corrupted.
- mana-charged.
- wounded.
- aged or scarred.

Runtime systems decide when these states apply.

# 26. Creature Size Tiers, World Fit and Boss Scale

## 26.1 Size Tiers

| Tier | Example | Primary Concern |
| --- | --- | --- |
| Tiny | Insect, mouse, tiny bird. | Visibility and cheap rendering. |
| Small | Chicken, rabbit, spider. | Readable silhouette at ground level. |
| Standard | Pig, wolf, sheep. | World interaction and common navigation. |
| Large | Bear, horse, giant spider. | Doorways, turn radius and camera. |
| Huge | Troll beast, wyvern, young dragon. | Arena space, LOD and attack clearance. |
| Colossal | Ancient dragon, titan, siege creature. | Multi-region presentation, streaming and distant readability. |

## 26.2 Scale Profiles

Each profile stores:

- World dimensions.
- base collision suggestion.
- navigation radius and height reference.
- camera bounds.
- attack clearance.
- icon framing.
- LOD distances.
- expected active-instance count.

## 26.3 Colossal Creature Rules

Colossal creatures should avoid one monolithic all-purpose runtime actor where possible. Presentation may use:

- grouped body regions.
- streamed or simplified distant parts.
- dedicated arena logic references.
- multiple LOD meshes.
- reduced secondary animation at distance.

# 27. Creature Families, Variants and Deterministic Generation

Creature families allow production scale without creating incoherent randomisation.

## 27.1 Inheritance Order

```text
Base Body Plan
    -> Creature Family
        -> Species
            -> Biome/Culture Variant
                -> Individual Seeded Variation
                    -> Runtime Condition
```

## 27.2 Variant Controls

- Scale within approved range.
- body proportions.
- head family.
- horn, tusk or crest selection.
- tail length.
- fur, feather, scale or chitin palette.
- markings and pattern seed.
- scar or damage history.
- elemental or corruption layer.
- equipment or harness.

## 27.3 Determinism

Procedural variation stores:

- Source profile version.
- seed.
- selected weighted options.
- modifier parameters.
- resolved overrides when necessary.

The same creature must reproduce the same appearance after save/load and across authoritative multiplayer clients.

## 27.4 Family Example

```text
family.spider
|-- species.cave_spider
|-- species.forest_spider
|-- species.crystal_spider
|-- species.swamp_webber
`-- boss.brood_matriarch
```

# 28. Mob, Elite, Mini-Boss and Boss Authoring

The model creator should distinguish production scope without requiring entirely separate systems.

| Rank | Presentation Needs |
| --- | --- |
| Ambient | Cheap, small, limited variants and minimal regions. |
| Standard Mob | Clear silhouette, core states, attack sockets and common LOD. |
| Elite | Distinct materials, armour, larger scale or extra parts. |
| Mini-Boss | Unique head/body features, phase or breakable presentation, dedicated card. |
| Boss | Multiple regions, phase presentations, arena anchors, damage states and cinematic framing. |
| World/Titan Boss | Colossal scale, distant LOD, multiple target areas and world-scale preview. |

## 28.1 Boss Authoring Layers

- Base body and scale.
- unique silhouette parts.
- armour and weak points.
- phase-only geometry.
- breakable or disabled parts.
- arena and cinematic anchors.
- boss-card capture profile.
- distance-readable material states.

## 28.2 Boss Identity Rule

A boss should not be only a standard creature scaled larger. Size may contribute, but the Forge should require a distinct silhouette, presentation feature, region or phase plan before boss approval.

# 29. Damage, Breakable Regions and Phase Presentations

## 29.1 Damage Layers

Damage presentation may include:

- Material overlays.
- missing voxel sections.
- alternate part meshes.
- cracks, scars or exposed cores.
- changed posture compatibility.
- disabled or altered appendage presentation.

## 29.2 Breakable Region Definition

```text
BreakableRegion
|-- region_id
|-- body_parts[]
|-- intact_presentation
|-- damaged_presentation
|-- broken_presentation
|-- attachment_changes[]
|-- marker_changes[]
|-- animation_compatibility_tags[]
```

Gameplay systems own health and break triggers. The Forge only supplies valid presentations and marker remaps.

## 29.3 Phase Presentation

Phases may enable or disable:

- Armour.
- wings.
- additional heads.
- glowing cores.
- corruption layers.
- elemental materials.
- summoned or orbiting parts.

Every phase must resolve required anatomy and marker contracts.

# 30. Sockets, Regions, Hitbox Suggestions and Interaction Markers

## 30.1 Common Markers

- Root and centre of mass.
- visual eye origin.
- AI sight origin.
- hearing origin.
- mouth or beak socket.
- bite and projectile origins.
- left/right claw origins.
- tail or stinger origin.
- foot and ground contacts.
- rider seat and mount points.
- saddle, harness and pack sockets.
- loot-drop origin.
- nameplate and health-bar anchors.
- interaction point.
- weak-point markers.
- future VFX and audio attachment sockets.

## 30.2 Suggested Hit Regions

The Forge may analyse occupied voxel volumes and propose simplified regions such as:

- Head.
- torso.
- abdomen.
- limb banks.
- wings.
- tail.
- armour plates.
- exposed core.

These suggestions require review before approval and do not create combat rules automatically.

## 30.3 Interaction Markers

Tameable or domestic creatures may need:

- Feed point.
- pet point.
- milk or harvest point.
- mount point.
- lead or tether point.
- inventory pack point.

Gameplay ownership and permissions remain external.

# 31. Rig and Animation Preparation Contracts

This creator does not implement the complete rigging and animation system, but every approved model must expose enough information for those systems.

## 31.1 Required Preparation Data

- Named body parts.
- parent-child graph.
- joint origins and axes.
- expected movement limits.
- symmetry and mirror pairs.
- limb banks and gait groups.
- segment chains.
- ground contacts.
- wing and tail chains.
- deforming versus rigid parts.
- animation compatibility family.
- required and optional clips.

## 31.2 Hybrid Animation Readiness

Creature presentations may combine:

- Skeletal or rigid-part animation.
- procedural gait and foot placement.
- voxel-frame changes.
- material animation.
- runtime damage layers.
- future VFX and audio events.

## 31.3 Animation Events

The model definition may reserve named event roles such as:

- foot_contact.
- bite_contact.
- wing_downstroke.
- takeoff_release.
- breath_charge.
- breath_release.
- land_impact.

Exact event timing belongs to animation clips in 22F.

# 32. Live Preview, Test Laboratory and Environment Tests

## 32.1 Preview Environments

- Neutral studio.
- daylight forest.
- night forest.
- village pen.
- cave floor and wall.
- slopes and stairs.
- shallow and deep water.
- flight volume.
- narrow tunnel.
- combat arena.
- boss-scale landscape.

## 32.2 Test Controls

The developer can:

- Change pose or animation preview.
- switch variants and states.
- display voxel density.
- show joints, regions and sockets.
- show simplified collision.
- preview camera distance and LOD.
- compare against player and one-metre block scale.
- display performance estimates.

## 32.3 Creature-Specific Scenarios

| Creature | Required Scenario |
| --- | --- |
| Pig | Pen, doorway, feeding pose and group preview. |
| Spider | Ground, slope, wall, ceiling and narrow opening. |
| Centipede | Curved path, long-body turning and segment LOD. |
| Bird | Perch, take-off volume, flight and landing. |
| Dragon | Ground movement, wing clearance, take-off, arena and distant silhouette. |

## 32.4 Validation Scenario Command

`Run Validation Scenario` selects tests based on body plan and enabled features, records warnings and produces a review report linked to the asset revision.

# 33. Icon, Codex, Portrait and Thumbnail Capture

The live creature viewer doubles as a reproducible capture studio.

## 33.1 Capture Types

- Small creature icon.
- spawn or inventory-style icon.
- codex full-body image.
- head or threat portrait.
- boss card.
- encounter thumbnail.
- developer asset-browser thumbnail.

## 33.2 Capture Profile Fields

- Camera projection.
- camera position and target.
- pose or selected animation frame.
- variant and runtime state.
- lighting preset.
- background and transparency.
- shadow and outline settings.
- padding and crop.
- output resolution.
- live-linked or locked mode.

## 33.3 Automatic Framing

The Forge calculates occupied bounds but allows manual correction for wings, tails and asymmetric poses. Large bosses may use multiple profiles for full-body, head and phase-specific cards.

## 33.4 Batch Capture

Batch generation may refresh:

- An entire creature family.
- all missing codex images.
- every variant changed in a content pack.
- boss cards after model revisions.
- asset-browser thumbnails after bake.

# 34. Non-Destructive Modifiers and Procedural Creature Tools

## 34.1 Supported Modifiers

- Mirror.
- radial symmetry.
- limb-bank array.
- segment repeat.
- taper.
- bend.
- twist.
- hollow.
- thicken.
- material replace.
- pattern noise.
- damage scatter.
- feather or scale layering.
- horn growth.
- corruption spread.

Modifiers remain ordered, editable and reversible until deliberately baked into source.

## 34.2 Procedural Tools

The Forge may assist with:

- Segment-chain creation.
- leg-bank placement.
- wing-feather layouts.
- horn and tusk curves.
- scale plate patterns.
- deterministic markings.
- hitbox suggestions.
- joint and socket suggestions.
- LOD grouping.

Generated results must store seeds and parameters and remain manually editable.

## 34.3 AI-Assisted Suggestions

Summer Engine may later suggest a template, anatomy roles or missing markers, but suggestions do not bypass validation or human approval. AI assistance is optional and cannot become the only way to create or recover an asset.

# 35. Developer Overrides, Revisions and Migration

## 35.1 Override Scope

Developers may override:

- Entire voxel source sets.
- individual body parts.
- proportions and body graph.
- materials and markings.
- variant rules.
- damage and phase presentations.
- sockets and markers.
- icon profiles.
- compatible rig or animation references.
- LOD and bake profiles.

## 35.2 Safe Editing Actions

- Open original read-only.
- edit as project override.
- duplicate as new creature.
- compare original and override.
- revert selected field.
- revert entire override.
- inspect dependency impact.
- test existing save compatibility.

## 35.3 Revision History

Each source revision should record:

- Revision ID and date.
- author or authorised agent.
- changed fields.
- linked validation report.
- approval notes.
- previous approved revision.
- migration requirement.

## 35.4 Migration Triggers

A migration may be required when changing:

- Stable IDs.
- required anatomy roles.
- socket IDs used by equipment or combat.
- marker semantics.
- rig compatibility family.
- variant parameter schema.
- phase or breakable-region IDs referenced by saves.

Pure visual voxel or material changes normally do not require save migration.

# 36. Registry Fields, Dependencies and Packaging

## 36.1 Core Registry Fields

| Field Group | Example Fields |
| --- | --- |
| Identity | presentation_id, family_id, display_name_key, namespace. |
| Anatomy | body_plan_id, part_graph_id, limb_count, segment_profile. |
| Scale | scale_profile_id, bounds, footprint, density band. |
| Visual | voxel_source_ids, material_profile_id, variant_profile_id. |
| Integration | marker_profile_id, rig_compatibility_id, animation_family_id. |
| Runtime | lod_profile_id, collision_profile_id, bake_profile_id. |
| Capture | icon_profiles, codex_profiles, boss_card_profile. |
| Governance | lifecycle_state, revision_id, dependencies, migration_version. |

## 36.2 Dependency Graph

The Forge should display dependencies such as:

```text
material.chitin.crystal
|-- entity.crystal_spider.base
|-- entity.crystal_crawler.base
|-- boss.crystal_brood_guardian
`-- codex_family.crystal_arthropods
```

Before deletion or replacement, the user sees affected entities, icons, animations, blueprints, encounters and content packs.

## 36.3 Package Contents

A portable creature package may include:

- Editable voxel source.
- body-plan and part graph.
- modifiers and parameters.
- materials and palettes.
- damage and phase presentations.
- sockets and marker definitions.
- icon and codex profiles.
- baked meshes and LODs.
- validation report.
- dependencies and migration metadata.
- credits and licence fields.

# 37. Validation, Performance Budgets and Production Lifecycle

## 37.1 Hard Errors

Approval is blocked by:

- Missing or corrupt voxel source.
- invalid stable IDs.
- broken parent-child graph.
- disconnected required body parts.
- invalid repeated segment chain.
- missing required markers for declared features.
- incompatible rig contract.
- destructive registry conflict.
- non-reproducible required procedural output.
- failed bake.

## 37.2 Warnings

Warnings may include:

- Excessive visible faces.
- too many animated parts.
- too many transparent surfaces.
- excessive bone or segment count.
- collision complexity.
- missing optional LOD.
- poor silhouette at distance.
- icon framing mismatch.
- ground penetration.
- wing or tail clipping.
- material noise.

Authorised developers may override warnings with a recorded reason.

## 37.3 Lifecycle States

```text
Concept
-> Draft
-> Functional
-> Animation Ready
-> Visual Review
-> Gameplay Review
-> Approved
-> Deprecated
-> Legacy Fallback
```

Flags may identify:

- Missing icon.
- missing LOD.
- missing damage state.
- needs animation.
- needs marker review.
- POC required.
- production approved.

## 37.4 Readability Tests

Every gameplay creature should be reviewed:

- At codex size.
- at normal gameplay distance.
- at medium LOD distance.
- in daylight and darkness.
- against likely biome backgrounds.
- beside related creatures.
- in damaged or phase states.

# 38. Proof-of-Concept Scope and Acceptance Criteria

## 38.1 Required POC Creatures

| Asset | Required Proof |
| --- | --- |
| Pig | Guided quadruped workflow, family variant and livestock-scale validation. |
| Spider | Eight-leg body graph, leg banks, climb markers and cave silhouette. |
| Giant Centipede | Repeated segments, many legs, taper, grouped collision and LOD. |
| Bird | Avian body plan, folded/extended wings, perch and flight clearance. |
| Dragon | Large hybrid graph, neck/tail chains, wings, breath socket and boss region. |

## 38.2 Required Shared Features

The POC must demonstrate:

- Voxel source editing for every creature.
- Template and advanced body-graph modes.
- Material assignment and at least one variant per family.
- Joint, contact and marker placement.
- Automatic collision or hit-region suggestions.
- Live icon or codex capture.
- Source-versus-baked separation.
- Deterministic procedural generation for segments or markings.
- Validation report and lifecycle state.
- Override, compare and revert workflow.

## 38.3 Dragon Boss Test

The dragon must include:

- At least one breakable presentation region.
- one phase-specific material or geometry state.
- breath origin.
- full-body and boss-card capture profiles.
- arena-scale preview.
- LOD and silhouette review.

## 38.4 Acceptance Criteria

The document's design is proven when:

1. A pig can be built quickly from a quadruped template.
2. A spider supports eight independently placed but grouped legs.
3. A centipede can change segment count without rebuilding every segment manually.
4. A bird can switch between folded and extended wing presentation.
5. A dragon supports large-scale validation, flexible chains and boss regions.
6. Every asset remains editable as voxel source after bake.
7. Icons and codex images regenerate reproducibly from the live model.
8. Gameplay IDs remain stable when presentation models are replaced.
9. Validation catches broken anatomy, markers and unsafe dependencies.
10. The runtime products meet first-pass performance budgets without one node per voxel.

# 39. Relationships With Documents 22E-22L

| Document | Relationship |
| --- | --- |
| 22E - Skeletons, Rigging, Joints, IK and Attachment Systems | Converts body graphs, joints, chains and contact roles into reusable rig and procedural-control contracts. |
| 22F - Entity Animation, Locomotion, Combat and Visual States | Defines clip families, gaits, flight, crawling, attacks, reactions, death and state presentation. |
| 22G - Character Customisation, Equipment, Variants and Visual Inheritance | Expands shared variant, equipment, culture, condition and inheritance rules across humanoids and creatures. |
| 22H - Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD | Connects markers and regions to combat, navigation, AI, mounting, multiplayer and runtime simulation. |
| 22I - Blueprint Forge | Uses creature nests, pens, perches, spawn markers, boss arenas and lairs in structure blueprints. |
| 22J - Unified Forge UI/UX | Defines the final combined creature-authoring interface and workflow. |
| 22K - Forge Entity and Blueprint Technical Implementation Plan | Defines Godot resources, bakers, graph storage, deterministic tools, runtime loading and tests. |
| 22L - Entity and Blueprint Visual Production and Migration Plan | Prioritises the actual creature, boss and blueprint asset backlog. |

# Appendix A. Creature Template Register

| Template ID | Required Roles | Optional Roles | Typical Use |
| --- | --- | --- | --- |
| template.creature.quadruped_small | Body, head, four legs. | Tail, ears, horns, saddle. | Pig, sheep, dog. |
| template.creature.quadruped_heavy | Large body, head, four legs. | Horns, armour, charge region. | Bear, ox, rhino beast. |
| template.creature.spider | Cephalothorax, abdomen, eight legs. | Fangs, spinneret, armour. | Spider families. |
| template.creature.hexapod | Head, thorax, abdomen, six legs. | Wings, antennae, stinger. | Insects. |
| template.creature.segmented | Head, repeated body, tail. | Leg pair per segment, fins, spikes. | Centipede, worm. |
| template.creature.serpent | Head, flexible chain, tail. | Limbs, wings, fins. | Snake, serpent. |
| template.creature.avian | Torso, head, two wings, two legs, tail. | Crest, talons, extra wings. | Birds, griffins. |
| template.creature.wyvern | Torso, head, two wings, two legs, tail. | Horns, breath, armour. | Wyverns. |
| template.creature.dragon | Torso, head, four legs, two wings, tail. | Extra wings, riders, phase parts. | Dragons and bosses. |
| template.creature.fish | Body, head, tail fin. | Dorsal and side fins, teeth. | Fish and aquatic mobs. |
| template.creature.slime | Core volume. | Embedded core, orbiting parts. | Slime and ooze. |
| template.creature.construct | Custom rigid graph. | Core, gears, armour, runes. | Golems and living machines. |

# Appendix B. Body-Part, Region and Socket Register

| Category | Example IDs |
| --- | --- |
| Core Parts | root, torso, body, thorax, abdomen, pelvis, shell. |
| Head Parts | head, muzzle, beak, jaw, mandible, horn_left, horn_right. |
| Limb Parts | leg_fl, leg_fr, leg_rl, leg_rr, arm_left, arm_right, claw_left. |
| Wing Parts | wing_left_root, wing_left_mid, wing_left_tip, wing_right_root. |
| Chain Parts | neck_01, tail_01, segment_01, tentacle_01. |
| Contact Markers | foot_fl_contact, perch_left, ground_centre, swim_centre. |
| Attack Sockets | mouth_attack, claw_left_attack, tail_attack, stinger_attack, breath_origin. |
| Interaction Sockets | rider_seat, feed_point, pet_point, tether_point, pack_left. |
| UI Anchors | nameplate_anchor, healthbar_anchor, boss_camera_anchor. |
| Future Presentation Hooks | vfx_mouth, vfx_core, audio_head, audio_body. |

# Appendix C. Example Creature Presentation Profiles

## C.1 Forest Pig

```text
presentation_id: entity.pig.forest_base
body_plan: template.creature.quadruped_small
scale_profile: creature.standard_small
materials: hide.pink_brown + hoof.dark
variants: plain, spotted, dark, muddy
markers: mouth, feed_point, pet_point, loot_origin
capture: codex_fullbody + icon_isometric
```

## C.2 Cave Spider

```text
presentation_id: entity.spider.cave
body_plan: template.creature.spider
leg_pairs: 4
materials: chitin.dark + eye.emissive_red
markers: bite, web_origin, wall_contact_profile
variants: juvenile, standard, armoured
capture: codex_threequarter
```

## C.3 Giant Centipede

```text
presentation_id: entity.centipede.giant
body_plan: template.creature.segmented
segments: 36
leg_frequency: every_segment
runtime_group_size: 6
materials: chitin.ochre + underside.dark
markers: mandible_attack, tail_attack, grouped_regions
capture: codex_longbody
```

## C.4 Forest Bird

```text
presentation_id: entity.bird.forest_small
body_plan: template.creature.avian
materials: feather.green_brown + beak.dark
states: wings_folded, wings_extended
markers: perch_left, perch_right, flight_centre
capture: codex_perched + icon_profile
```

## C.5 Ancient Dragon Boss

```text
presentation_id: boss.dragon.ancient_forest
body_plan: template.creature.dragon
scale_profile: creature.colossal
materials: scale.forest_ancient + underbelly.stone
breakable_regions: left_wing, right_wing, horn_crown
phase_presentations: dormant, awakened, wounded, enraged
markers: breath_origin, claw_attacks, tail_attack, boss_camera_anchor
capture: boss_card + codex_fullbody + head_portrait
```

# Appendix D. Creature Family and Variant Parameter Register

| Parameter | Type | Example |
| --- | --- | --- |
| appearance_seed | Integer | 184233 |
| scale_multiplier | Bounded float | 0.92-1.08 |
| body_length_profile | Enum | short, standard, long |
| head_family | Stable ID | head.pig.domestic_01 |
| horn_profile | Stable ID/None | horn.boar_short |
| segment_count | Integer range | 20-60 |
| wing_pair_count | Integer range | 0-3 |
| palette_profile | Stable ID | palette.spider.cave_dark |
| marking_seed | Integer | 9182 |
| damage_history | Stable list | scar_left, chipped_horn |
| biome_variant | Stable ID | variant.snow |
| corruption_level | State value | 0-3 |

# Appendix E. Scale, Density and Runtime Budget Guidance

| Profile | Expected Instances | Animated-Part Guidance | LOD Expectation |
| --- | ---: | ---: | --- |
| Ambient Tiny | Dozens to hundreds | Very low | Early simplification or culling. |
| Common Small | Dozens | Low to moderate | At least one simplified LOD. |
| Standard Mob | Several to dozens | Moderate | Standard near/mid/far LOD. |
| Large Creature | Few | Moderate to high | Dedicated LOD and collision review. |
| Boss | One or few | High but controlled | Multiple LODs and phase testing. |
| Colossal Boss | Usually one | Region-based | Distant representation and strict budgets. |

Budget values remain first-pass engineering targets and are finalised in 22K. This document locks the requirement that the Forge estimate and report cost before approval.

# Appendix F. Creature Validation Checklist

- Voxel source is present, editable and reproducible.
- Stable IDs and namespace are valid.
- Body plan and parent graph validate.
- Required parts are connected.
- Limb, wing and segment counts match declarations.
- Symmetry and mirror roles are correct where used.
- Ground, perch, swim or hover contacts are present.
- Attack and interaction markers are correctly named.
- Scale and footprint match the profile.
- Silhouette remains readable at gameplay distance.
- Materials use approved DNA profiles or documented overrides.
- Variant generation is deterministic.
- Damage and phase presentations resolve required parts.
- Collision and hit-region suggestions are reviewed.
- LOD and bake profiles are assigned.
- Icons and codex captures frame correctly.
- Dependency graph has no missing references.
- Validation report is linked to the revision.
- Lifecycle state matches production readiness.

# Appendix G. Proof-of-Concept Asset Checklist

- Pig base presentation.
- Domestic pig variant.
- Wild boar variant.
- Cave spider with eight legs.
- Spider wall-contact markers.
- Giant centipede with repeated segments.
- Centipede grouped LOD and collision test.
- Small forest bird.
- Folded and extended bird wings.
- Ancient dragon base.
- Dragon breath socket.
- Dragon breakable wing presentation.
- Dragon boss-card capture.
- Live icon and codex capture for all five templates.
- Override and revert test.
- Validation reports for all assets.

# Appendix H. Glossary

| Term | Definition |
| --- | --- |
| Body Graph | Parent-child structure describing creature parts, chains, symmetry and roles. |
| Body Plan | Reusable anatomy template such as quadruped, spider, avian or dragon. |
| Creature Family | Parent visual and compatibility definition shared by related species or variants. |
| Limb Bank | Group of repeated or mirrored limbs managed together, such as spider leg pairs. |
| Marker Profile | Stable set of sockets, contacts, regions and anchors used by external systems. |
| Phase Presentation | Visual configuration enabled for a boss or creature phase without owning phase logic. |
| Repeated Segment | Reusable voxel body module generated several times in a chain. |
| Runtime Group | Several visual parts treated together for collision, damage presentation or LOD. |
| Voxel Source of Truth | Editable voxel data and parameters from which runtime creature products are baked. |
| Guided Template | Approved starting body plan and workflow that allows rapid creature creation. |
