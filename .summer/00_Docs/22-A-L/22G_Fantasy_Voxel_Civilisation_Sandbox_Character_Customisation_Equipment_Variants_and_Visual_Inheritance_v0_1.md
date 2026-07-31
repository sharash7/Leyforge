# Fantasy Voxel Civilisation Sandbox
## 22G - Character Customisation, Equipment, Variants and Visual Inheritance
### Voxel Appearance Layers, Equipment Fit, Entity Families, Deterministic Variation and Override-Safe Presentation
**Version 0.1 - Detailed Design Bible Draft**

A voxel-only presentation system for assembling player characters, NPCs, creatures, monsters and bosses from reusable body families, equipment, culture profiles, deterministic variation, runtime conditions and non-destructive visual inheritance.

## Character Customisation, Equipment, Variants and Visual Inheritance Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines visual customisation, equipment presentation, appearance layers, entity-family inheritance, deterministic variants, runtime visual conditions, developer overrides, icon capture, validation and production rules for all Forge-authored entities. |
| Core Philosophy | Create visual breadth through reusable voxel source, semantic roles, inheritance and controlled variation rather than duplicating complete models for every individual, profession, creature variant or boss phase. |
| Voxel Direction | Bodies, clothing, armour, weapons, accessories, creature adornments and natural equipment remain voxel-authored. Runtime meshes may be baked and optimised, but editable voxel source remains authoritative. |
| Identity Separation | Species, people, culture, faction, profession, equipment, wealth, personal history and runtime condition remain separate appearance layers. No single visual preset should collapse these concepts into one hard-coded model. |
| Inheritance Direction | Resolve appearance from stable parent families through ordered, inspectable layers with local overrides, explicit dependencies and safe fallbacks. |
| Equipment Direction | Equipment uses semantic slots, coverage regions, sockets, fit profiles, visibility rules and animation compatibility data. Gameplay inventory owns whether equipment is worn; the Forge owns how it is presented. |
| Variant Direction | Support authored, parameterised and seeded variants for anatomy, palette, markings, hair, horns, natural armour, culture, profession, damage, corruption, elemental infusion, boss phases and quality presentation. |
| Determinism Direction | Persistent entities reproduce the same approved appearance from stored IDs, seeds and required local overrides. Procedural generation must not silently change when unrelated content is added. |
| Player Direction | Player-facing character customisation uses curated options derived from developer-authored Forge definitions. It does not expose unrestricted developer editing in normal play. |
| NPC Direction | Named NPCs preserve recognisable identities across saves, simulation LOD, equipment changes, ageing and world events. Population generation should create variety without visual incoherence. |
| Creature Direction | Creature families share body plans, rigs, materials and animation profiles while allowing meaningful species, biome, age, corruption, elite and boss variants. |
| Runtime-State Direction | Wetness, snow, mud, burning, freezing, poison, damage, exhaustion, corruption, enchantment and boss-phase presentation layer non-destructively over persistent appearance. |
| Icon Direction | Any icon-bearing equipment, character, creature or variant may capture an approved icon or portrait from the live voxel preview with a saved capture profile. |
| Override Direction | Authorised developers may replace presentation assets or layer rules while retaining stable gameplay IDs, provided compatibility, migration and dependency validation pass. |
| Performance Direction | Variant diversity must be compatible with batching, palette reuse, material limits, animation LOD and memory budgets. Visual variety must not require an unbounded unique material or mesh for every entity. |
| Audio/VFX Boundary | This document may define named presentation hooks and sockets, but full sound, particle and VFX authoring remain deferred to future Forge modules. |
| Implementation Context | Godot with Summer Engine is the current target. Editable source definitions and baked runtime products remain separate. |
| POC Direction | Prove one customisable player humanoid, one persistent NPC population set, one profession/culture equipment family, one pig/boar creature family, one corrupted monster variant, one boss phase set and a complete deterministic inheritance, icon and override pipeline. |

## Document Purpose

This document defines how Leyforge entities gain visual identity after their voxel bodies, rigs and animation systems exist. Documents 22B through 22F establish body architecture, humanoid and creature modelling, skeletons, inverse kinematics, locomotion, combat animation and runtime visual states. Document 22G defines the layers that make those shared foundations look like distinct people, professions, cultures, creatures, elites and bosses without requiring every result to become a disconnected one-off asset.

The system must support two needs at the same time. First, the player and developer need direct creative control: a specific NPC, boss, player character or creature may require a carefully authored silhouette, outfit, palette, scar pattern or broken armour state. Second, Leyforge needs scalable content production: villages may contain many persistent named residents; creature families may have regional and magical variants; equipment may appear on multiple body frames; and culture or profession changes should not require manually rebuilding the same body dozens of times.

The solution is a layered voxel presentation architecture. A base body family is resolved through anatomy, surface materials, culture, faction, profession, equipment, individual variation and runtime-state layers. Each layer has stable IDs, explicit ownership, deterministic resolution and clear override boundaries. The system preserves gameplay truth: the inventory system decides that an iron helmet is equipped, the NPC system decides that a villager is a blacksmith, and the status system decides that a creature is burning. The Forge defines how those facts appear on the voxel model.

This document also formalises equipment fit, coverage and clipping rules; deterministic appearance seeds; creature-family variants; age, scars and life-history presentation; player customisation boundaries; live icon capture; runtime performance; migration; validation and production lifecycle. It does not define inventory mechanics, armour statistics, item durability, race gameplay bonuses, AI behaviour, combat damage formulas or the final technical class implementation. Those systems remain owned by their relevant registries and are connected through stable presentation contracts.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Documents 21A-21G define the Voxel Asset Forge, while Documents 22A-22F establish the voxel-only Entity Forge, body plans, models, rigs and animation. This document adds the shared customisation, equipment, variant and inheritance layer used by player characters, NPCs, creatures, monsters and bosses.

## Design Sources

| Source Document | Relevant Direction | How 22G Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Characters, creatures, tools and machines may be more detailed than terrain while remaining stylised, readable and voxel-based. | Locks voxel-authored appearance layers, strong silhouettes and a consistent fantasy style rather than realism. |
| 02 - Player Progression System | Players progress through gear, skills, magic, reputation, cultures and multiple sandbox roles. | Requires equipment and appearance to communicate growth without making visual rarity the sole source of power. |
| 04 - Items Registry | Items have stable IDs, quality, rarity, durability, equipment roles and block or held presentations. | Keeps item gameplay definitions separate from wearable, held and icon presentation profiles. |
| 07 - NPC Village System | NPCs are persistent named individuals with jobs, inventories, culture, relationships, ageing and world consequences. | Requires deterministic identity, profession presentation, equipment changes, life-history marks and simulation-safe persistence. |
| 09 - Magic System | Enchantment, corruption, elemental states, mana and forbidden magic should be physically readable. | Adds non-destructive magical and corruption presentation layers with priority and compatibility rules. |
| 10 - Creatures and Monsters | Creatures need readable families, variants, elite forms, bosses, drops, damage and world-state links. | Defines inherited creature variants, natural equipment, boss phases and family generation. |
| 13 - Races, Peoples, Cultures and Factions | Species, people, culture, faction, language and political identity are layered rather than identical concepts. | Prevents appearance definitions from collapsing ancestry, culture and faction into one field. |
| 16 - Combat, Gear and Defence | Equipment, resistances, armour sets, damage, readable attacks and boss mechanics are central. | Defines armour coverage, fit, breakable presentation, equipment visibility and combat-readable silhouettes. |
| 17 - UI/UX System | Complex systems need clear, inspectable and accessible presentation. | Guides player customisation, Forge comparison views, variant previews, warnings and icon capture. |
| 21B - Voxel Modelling, Texturing and Materials | Defines voxel source, palettes, Material DNA, compound parts, sockets and baking. | Supplies the shared material and modelling language for bodies, clothing, armour and accessories. |
| 21C - Animation and Runtime Visual States | Defines state-driven presentation, material animation, frame animation and attachment hooks. | Provides runtime state layering and animated-equipment contracts. |
| 21D - Overrides, Variants and Registry Integration | Defines stable IDs, inheritance, overrides, fallbacks, content-pack resolution and migration. | Becomes the base rule set expanded into entity appearance stacks and equipment fit inheritance. |
| 21E - Forge UI/UX and Creator Workflow | Defines Asset Browser, live preview, comparison, validation, autosave and approval. | Guides the customisation workspace, family inspector, equipment fitting and batch variant workflow. |
| 22A - Forge Entity and Blueprint Expansion | Locks voxel-only entities, deterministic generation, lifecycle, dependency graphs, icon capture and packaging. | Provides the governing Forge-wide requirements used throughout this document. |
| 22B - Entity Model Taxonomy | Defines body plans, anatomy roles, scale, repeated segments and body compatibility. | Supplies semantic body roles and size envelopes used by equipment and variants. |
| 22C - Humanoid Player Character and NPC Creator | Defines modular humanoids, race profiles, culture, clothing, armour, professions and persistent variation. | Provides humanoid component sources that this document resolves through shared inheritance rules. |
| 22D - Creature, Mob, Monster and Boss Creator | Defines creature families, natural materials, damage regions, variants and bosses. | Supplies creature source definitions and family structures for inherited variants. |
| 22E - Skeletons, Rigging, IK and Attachments | Defines rig roles, sockets, retargeting, riders and attachment compatibility. | Provides the attachment and motion contracts required by equipment fit profiles. |
| 22F - Entity Animation and Visual States | Defines clips, graphs, procedural motion, equipment-aware animation and state layering. | Provides animation compatibility, visibility events, runtime state priority and icon pose selection. |

## Static Table of Contents

1. Locked Customisation and Inheritance Identity
2. Player Decision Summary
3. Scope, Users and System Boundaries
4. Presentation Architecture Overview
5. Appearance Definition Data Model
6. Stable IDs, Namespaces and Registry Contracts
7. Voxel Source and Baked Presentation Separation
8. Visual Inheritance Stack
9. Layer Ownership and Resolution Order
10. Base Species and Body-Family Layer
11. Body Frame, Proportion and Silhouette Variation
12. Surface Materials, Palette DNA and Markings
13. Head, Face, Hair and Sensory Feature Variants
14. Horns, Tails, Wings and Optional Anatomy
15. Culture, People, Faction and Settlement Profiles
16. Profession, Wealth, Rank and Social Presentation
17. Personal Identity, History and Life-State Presentation
18. Equipment Presentation Architecture
19. Semantic Equipment Slots
20. Coverage Regions, Occlusion and Layer Priority
21. Equipment Fit Profiles and Body Compatibility
22. Sockets, Anchors and Attachment Rules
23. Clothing and Soft-Garment Voxel Presentation
24. Armour and Protective Equipment Presentation
25. Weapons, Tools, Shields and Held Objects
26. Backpacks, Jewellery, Accessories and Carried Goods
27. Multi-Armed and Unusual Humanoid Equipment
28. Quadruped Barding, Saddles, Harnesses and Cargo
29. Creature Natural Equipment and Modular Anatomy
30. Boss Armour, Breakable Parts and Phase Equipment
31. Item Quality, Rarity, Material and Enchantment Presentation
32. Equipment Sets, Mix-and-Match and Visual Cohesion
33. Animation Compatibility and Equipment Motion
34. Clipping Prevention, Adaptation and Fallbacks
35. Visibility Rules, Sheathing and Contextual Presentation
36. Deterministic Appearance Generation
37. Seed Channels and Reproducibility
38. Parameter Domains, Weighted Pools and Exclusions
39. Authored Variants and Procedural Variants
40. Entity Families and Variant Inheritance
41. Creature, Monster, Elite and Boss Variant Rules
42. Age, Scars, Damage and Persistent History
43. Magical, Elemental, Corrupted and Undead Layers
44. Runtime Environmental and Status Layers
45. Player Character Customisation
46. NPC Population and Persistent Individuality
47. Multiplayer Identity, Saves and Replication
48. Icon, Portrait, Codex and Thumbnail Capture
49. Forge Customisation Workspace and Workflow
50. Live Preview, Fit Testing and Test Laboratory
51. Dependency Graphs, Revision History and Overrides
52. Performance, LOD, Batching and Memory
53. Validation, Readability and Accessibility
54. Editable Source and Baked Runtime Products
55. Proof-of-Concept Scope and Acceptance Criteria
56. Implementation Handoff and Deferred Features
57. Production and Balancing Rules
58. Open Questions for Later Documents
- Appendix A. Appearance Definition Template
- Appendix B. Visual Inheritance Order
- Appendix C. Equipment Slot and Coverage Register
- Appendix D. Fit Profile Template
- Appendix E. Seed Channel Register
- Appendix F. Example Entity Appearance Profiles
- Appendix G. Validation Checklist
- Appendix H. Proof-of-Concept Checklist
- Appendix I. Glossary

# 1. Locked Customisation and Inheritance Identity

Character customisation and visual inheritance are the identity-scaling layer of the Entity Forge. They turn a limited library of approved voxel bodies, materials, equipment and animation families into a wide range of recognisable players, named NPCs, animals, monsters, elites and bosses without losing style consistency or data integrity.

The system is not a random skin generator placed after modelling. It is an ordered presentation architecture with explicit ownership. Species defines anatomy compatibility. A people or regional lineage may provide approved proportions and surface traits. Culture influences clothing, adornment and material preference. Faction adds insignia and uniform rules. Profession influences tools and workwear. Equipment reflects actual inventory and loadout state. Personal history adds scars or repairs. Runtime systems add wetness, damage, corruption, enchantment and other temporary or persistent conditions.

> **Locked Rule**  
> Visual identity must be assembled from stable voxel-authored layers whose ownership, dependencies, resolution order and fallbacks are inspectable. Random variation may enrich identity, but it must never override gameplay truth, destroy recognisability or produce combinations outside approved style and compatibility rules.

## 1.1 Player-Facing Promise

A player should be able to recognise a named villager after that NPC changes clothes, gains armour, ages or suffers a scar. A guard should look like a guard because of real equipment, profession and faction presentation rather than an arbitrary texture swap. A corrupted boar should still read as a member of its base creature family while clearly showing the corruption state. A dragon boss entering a new phase should preserve its identity while exposing broken armour, altered glow and phase-specific anatomy.

## 1.2 Production Promise

Developers should be able to create one approved body family, one culture palette, one profession kit and one equipment family, then generate many valid combinations without manually duplicating every complete model. Any generated result must remain reproducible, inspectable, locally overrideable and bakeable.

## 1.3 What This System Is Not

- It is not a replacement for the Items Registry or inventory system.
- It is not a conventional smooth-mesh character wardrobe system.
- It is not unlimited randomisation with no cultural or anatomical rules.
- It is not a requirement that every visible difference grant gameplay bonuses.
- It is not a permission for runtime presentation to invent species, jobs, equipment or status.
- It is not a full cloth simulation system.
- It is not a full Audio Forge or VFX Forge.

# 2. Player Decision Summary

| Area | Locked Decision |
| --- | --- |
| Style | All customisation and equipment presentation remains voxel-authored and consistent with Leyforge's stylised high-fidelity voxel direction. |
| Layering | Separate species, people, body frame, culture, faction, profession, equipment, individuality, history and runtime condition. |
| Player Creator | Use curated, developer-authored option pools and compatibility rules rather than exposing the full developer Forge. |
| NPC Identity | Store stable appearance profile IDs, seeds and local overrides so named NPCs remain recognisable across saves and simulation LOD. |
| Equipment Truth | Gameplay systems determine what is equipped; presentation definitions determine model, fit, coverage and animation behaviour. |
| Equipment Fit | Use semantic slots, coverage zones, sockets, body envelopes and fit profiles with warnings and approved fallbacks. |
| Creature Variants | Use parent creature families with biome, age, corruption, elite and boss extensions rather than unrelated duplicates. |
| Randomisation | Use deterministic seeded channels with weighted pools, exclusions and explicit versioning. |
| Overrides | Allow authorised developer overrides of any presentation layer while preserving stable IDs and migration paths. |
| Icons | Capture icons and portraits from the live voxel preview with saved camera, lighting, pose, state and variant profiles. |
| Runtime States | Layer environment, damage, magic and condition presentation non-destructively over persistent identity. |
| Performance | Reuse palettes, meshes, materials and animation families; bake expensive combinations; provide LOD and batching guidance. |
| Validation | Hard-fail broken IDs, impossible attachments, incompatible required roles and corrupt inheritance. Warn on clipping, unreadable silhouettes, excessive uniqueness and weak accessibility. |
| Deferred Scope | Full sound and particle creation remain deferred; only stable events, sockets and references are preserved. |

# 3. Scope, Users and System Boundaries

## 3.1 Primary Users

| User | Access |
| --- | --- |
| Developer/Designer | Full appearance stack, equipment fit, family inheritance, procedural generation, overrides, migration and bake controls. |
| Artist/Content Creator | Voxel body parts, materials, equipment presentation, icon profiles, previews and validation within approved namespaces. |
| Technical Designer | Registry bindings, slot definitions, runtime-state mappings, LOD, performance and compatibility settings. |
| Player | Curated character-creation options, equipment visibility preferences and approved cosmetic choices. |
| Mod Author, Future | Namespaced content packs with dependency, compatibility and validation constraints. |

## 3.2 Forge-Owned Data

The Forge owns:

- Voxel body-part and equipment presentation assets.
- Appearance layers and inheritance references.
- Material and palette assignments.
- Equipment fit and coverage profiles.
- Variant parameter sets and seeds.
- Icon and portrait capture profiles.
- Presentation LOD and bake settings.
- Visual override and fallback definitions.

## 3.3 Gameplay-Owned Data

Gameplay systems own:

- Species gameplay rules and racial abilities.
- Inventory ownership and equipped-item state.
- Armour, resistance, rarity and durability values.
- NPC profession, faction membership and social rank.
- Status effects, damage and boss-phase truth.
- Unlocks, crafting, loot and progression.
- Multiplayer authority and save-state decisions.

## 3.4 Binding Contract

Presentation reads stable facts from gameplay and resolves an approved visual result. It may request warnings or fallback presentation but must not change gameplay state.

# 4. Presentation Architecture Overview

The resolved entity appearance is produced through an ordered stack:

```text
Base body family
    -> anatomy/body-frame profile
    -> surface material and markings
    -> people/region profile
    -> culture profile
    -> faction profile
    -> profession/rank profile
    -> persistent individual variation
    -> equipped item presentations
    -> personal history and damage
    -> runtime environment/status layers
    -> selected LOD and baked product
```

Each layer may:

- Add a component.
- Replace an inherited component.
- Hide a covered component.
- Change a material role.
- Add a local palette substitution.
- Add a socket attachment.
- Apply a non-destructive modifier.
- Select an animation or fit compatibility profile.
- Declare exclusions and required dependencies.

A layer may not silently edit unrelated gameplay fields.

# 5. Appearance Definition Data Model

## 5.1 Core Records

| Record | Purpose |
| --- | --- |
| AppearanceProfile | Root presentation definition for an entity or family. |
| AppearanceLayer | Ordered add, replace, hide or modify operation. |
| BodyFrameProfile | Approved proportions, body envelope and rig compatibility. |
| SurfaceProfile | Skin, fur, feather, scale, chitin, bone or construct material roles. |
| EquipmentPresentation | World, worn, held, sheathed and icon presentation for an item. |
| FitProfile | Compatibility, adaptation and fallback rules for a body family. |
| VariantProfile | Authored or parameterised variation over a parent profile. |
| GenerationProfile | Seed channels, pools, weights, exclusions and versioning. |
| RuntimeVisualLayer | Conditional overlay driven by authoritative state. |
| CaptureProfile | Camera, pose, state, lighting and crop used for icons or portraits. |

## 5.2 Required Universal Fields

Every appearance-related record should support:

- Stable namespace ID.
- Display and editor name.
- Parent ID where applicable.
- Lifecycle state.
- Compatible body families.
- Required semantic roles and sockets.
- Material and palette dependencies.
- Animation and fit compatibility.
- Source resource path.
- Baked product references.
- Override priority and content-pack origin.
- Version and migration notes.
- Validation status.

# 6. Stable IDs, Namespaces and Registry Contracts

Stable IDs prevent visual overhaul work from breaking saves, inventories, NPC identities or blueprints.

Recommended patterns:

```text
appearance.humanoid.base.standard
appearance.npc.forest_builder.base
bodyframe.humanoid.compact
surface.humanoid.skin.warm_03
equipment.helmet.iron_guard.presentation
fit.humanoid.standard.helmet
variant.pig.corrupted_forest
runtime_visual.entity.wet
capture.character.dialogue.default
```

Display names may change without changing stable IDs. Renaming an ID requires an explicit alias or migration entry. Deleting a referenced definition requires a safe fallback.

# 7. Voxel Source and Baked Presentation Separation

## 7.1 Editable Source

Editable source includes:

- Voxel volumes and component layers.
- Non-destructive modifiers.
- Material-role assignments.
- Body-frame and fit parameters.
- Attachment and coverage metadata.
- Seeded generation profiles.
- Capture profiles.
- Revision and approval history.

## 7.2 Runtime Products

Runtime products may include:

- Merged and hidden-face-removed meshes.
- Palette-atlas or material-instance references.
- Simplified attachment meshes.
- Resolved visibility masks.
- Pre-fitted equipment variants.
- LOD meshes and impostors.
- Icon and portrait images.
- Compact appearance records for saves and replication.

The runtime product is replaceable. The voxel source is the long-term authoring truth.

# 8. Visual Inheritance Stack

## 8.1 Parent-First Resolution

A child profile inherits approved parent data and stores only its differences. This reduces duplication and makes family-wide updates possible.

Example:

```text
appearance.creature.pig.base
    -> variant.pig.domestic
        -> variant.pig.domestic.forest_region
            -> individual_seed
                -> runtime_visual.muddy
```

## 8.2 Field-Level Inheritance

Inheritance should operate at field or component level rather than replacing the complete asset whenever one value changes. A child may override tusks while retaining the parent's body, rig, palette family and animation compatibility.

## 8.3 Explicit Resets

A child may explicitly clear an inherited attachment or rule. Clearing must be distinguishable from leaving a field unspecified.

## 8.4 Inheritance Cycles

Cycles are hard errors. The dependency graph should identify the full chain and offer a repair path.

# 9. Layer Ownership and Resolution Order

| Order | Layer | Typical Owner |
| ---: | --- | --- |
| 10 | Base body family | Entity definition/Forge. |
| 20 | Body frame and anatomy | Species or approved body profile. |
| 30 | Surface and markings | Species/individual generation. |
| 40 | People or regional lineage | World/culture definition. |
| 50 | Culture and settlement style | Culture/settlement system. |
| 60 | Faction and uniform | Faction system. |
| 70 | Profession, wealth and rank | NPC/village system. |
| 80 | Persistent individual variation | Saved appearance profile. |
| 90 | Equipment and carried objects | Inventory/equipment system. |
| 100 | Personal history and damage | Save/world-state systems. |
| 110 | Runtime environment and status | Status, weather, magic and combat. |
| 120 | Accessibility or local identification | Client-side approved UI/presentation. |

Higher layers may not erase critical identity without explicit rules. For example, mud may cover colour but should not hide the silhouette of a dangerous boss weak point.

# 10. Base Species and Body-Family Layer

The base layer establishes body-plan roles, expected rig, authoring scale, collision envelope and equipment compatibility family. It should remain visually simple enough to accept later layers.

A base family may define:

- Required body components.
- Optional anatomy sockets.
- Default surface roles.
- Standard coverage zones.
- Body-frame range.
- Animation family.
- Allowed equipment families.
- Default capture profiles.

Base families should not embed culture-specific clothing or profession tools.

# 11. Body Frame, Proportion and Silhouette Variation

## 11.1 Approved Variation

Body-frame profiles may adjust:

- Overall height or length.
- Torso width and depth.
- Limb length and thickness.
- Head size.
- Neck, tail or wing proportions.
- Posture and resting angle.
- Segment count within approved bounds.

## 11.2 Compatibility Envelopes

Each equipment and animation family declares a supported body envelope. Variation outside that envelope triggers one of four outcomes:

1. Use automatic bounded adaptation.
2. Select a dedicated fit variant.
3. Hide or substitute incompatible equipment.
4. Require manual authoring.

## 11.3 Silhouette Protection

Variation must preserve the body's readable category. A pig should remain identifiable as a pig; a spider should retain readable leg grouping; a guard should not lose the recognisable outline of shield and helmet because of an over-dense accessory stack.

# 12. Surface Materials, Palette DNA and Markings

Surface profiles should use Material DNA rather than unique materials per entity.

Supported categories include:

- Skin.
- Fur.
- Feathers.
- Scales.
- Chitin.
- Bone.
- Stone, metal, wood and crystal constructs.
- Slime or magical matter.

A profile may define base colour ranges, pattern masks, edge treatment, roughness, metallic response, emission, damage response and environmental overlays.

Markings may include stripes, spots, patches, freckles, scars, runes, veins or culture paint. Markings should be voxel masks or generated voxel/material regions with saved seeds.

# 13. Head, Face, Hair and Sensory Feature Variants

Humanoid and expressive creature identities may vary through:

- Head families.
- Eye shape, colour and emission.
- Brows and eyelids.
- Nose, muzzle, beak or mandible profile.
- Ear shape.
- Mouth, jaw, teeth and tusks.
- Hair and facial hair.
- Antennae, whiskers or sensory fins.

The system should favour a small number of strong, compatible component families over hundreds of barely distinguishable pieces. Face variation must remain readable at dialogue portrait and normal gameplay distances.

# 14. Horns, Tails, Wings and Optional Anatomy

Optional anatomy uses named sockets and compatibility profiles. It may be inherited from species, selected by player customisation, generated from weighted pools or added by boss and magical variants.

Rules should define:

- Pairing and symmetry.
- Size limits.
- Equipment conflicts.
- Animation and collision implications.
- Damage regions.
- Visibility at LOD.
- Whether anatomy is cosmetic, functional or gameplay-owned.

Four-winged, multi-tailed or multi-horned creatures are supported through repeated semantic groups rather than hard-coded limits.

# 15. Culture, People, Faction and Settlement Profiles

These concepts remain separate:

| Layer | Visual Role |
| --- | --- |
| Species/Ancestry | Body anatomy and natural material compatibility. |
| People/Regional Lineage | Approved features, proportions, markings and local material tendencies. |
| Culture | Clothing cuts, ornament, architecture-linked motifs, colour preferences and craft style. |
| Faction | Insignia, uniforms, rank marks, banners and controlled palette accents. |
| Settlement | Local wear, available materials, climate adaptations and prosperity state. |

A culture may be shared by multiple species, and a species may participate in multiple cultures. The data model must not assume one-to-one relationships.

# 16. Profession, Wealth, Rank and Social Presentation

Profession profiles influence presentation without replacing actual equipment state.

Examples:

- Builder: tool belt, gloves, measuring tool, dust and reinforced workwear.
- Farmer: practical clothing, hat, seed pouch and mud exposure.
- Guard: faction armour family, weapon, shield and rank insignia.
- Mage: focus, rune accessories, layered robes or magitech equipment.
- Merchant: satchel, ledger, jewellery and prosperity-linked fabric quality.

Wealth and rank may influence material quality, cleanliness, ornament and repair state, but should not stereotype every individual identically.

# 17. Personal Identity, History and Life-State Presentation

Persistent individuality may include:

- Stable face and palette choices.
- Hair or horn arrangement.
- Scars and repaired injuries.
- Missing or replaced parts where supported.
- Tattoos, paint or ritual marks.
- Favourite accessory.
- Age-related changes.
- Memorial, veteran or leadership symbols.

Personal history layers should be sparse and meaningful. Excessive marks reduce readability and weaken the impact of important events.

# 18. Equipment Presentation Architecture

An item presentation may have several forms:

| Form | Purpose |
| --- | --- |
| Inventory Icon | UI representation captured or authored from live view. |
| Held Model | Model attached to hand, mouth, claw or tool socket. |
| Worn Model | Armour, clothing, jewellery or harness fitted to body regions. |
| Sheathed/Stowed Model | Visible storage position when not active. |
| Dropped Model | World item presentation. |
| Display Model | Rack, mannequin, table or shop presentation. |
| Broken/Damaged Model | Optional durability or break state. |

All forms reference the same item gameplay ID but may use different baked products and camera profiles.

# 19. Semantic Equipment Slots

Slots are semantic presentation roles, not arbitrary mesh parents.

Recommended humanoid slots:

- Head.
- Face.
- Neck.
- Torso inner.
- Torso outer.
- Shoulders.
- Arms.
- Hands.
- Waist.
- Legs.
- Feet.
- Back.
- Main hand.
- Off hand.
- Additional hands.
- Accessory groups.

Creature slots may include:

- Head harness.
- Neck collar.
- Saddle.
- Body barding.
- Leg armour.
- Wing armour.
- Tail attachment.
- Cargo left/right.
- Rider seat.

Gameplay may use fewer or different inventory slots. Presentation maps gameplay slots to semantic visual regions.

# 20. Coverage Regions, Occlusion and Layer Priority

Coverage determines which underlying voxel surfaces remain visible.

Example coverage regions:

```text
head.scalp
head.face
neck
chest.front
chest.back
shoulder.left/right
upper_arm.left/right
forearm.left/right
hand.left/right
waist
thigh.left/right
shin.left/right
foot.left/right
```

A helmet may hide hair regions but preserve beard, horns or ears if its fit profile supports them. A chestplate may hide outer clothing but retain visible undersleeves. Coverage should use named masks and rules rather than deleting source voxels.

# 21. Equipment Fit Profiles and Body Compatibility

## 21.1 Fit Profile Levels

| Level | Meaning |
| --- | --- |
| Exact | Authored for the exact body frame or species. |
| Family Compatible | Uses standard sockets and bounded adaptation. |
| Semantic Compatible | Maps roles but requires reviewed scaling or local offsets. |
| Substitute | Uses a simpler approved fallback presentation. |
| Incompatible | Cannot be shown safely without new authoring. |

## 21.2 Fit Operations

Permitted operations include:

- Uniform or axis-bounded scaling.
- Socket offset.
- Voxel stretch within approved regions.
- Alternate strap or connector piece.
- Horn, ear, tail or wing cut-out variant.
- Coverage-mask substitution.

Fit operations must preserve voxel scale and avoid smooth deformation that breaks the art style.

# 22. Sockets, Anchors and Attachment Rules

Equipment attaches to semantic sockets defined by 22E. A presentation specifies:

- Required socket role.
- Local position, rotation and scale.
- Handedness or mirrored variant.
- Body-frame offsets.
- Motion inheritance.
- Visibility rules.
- Collision or clearance notes.
- Optional secondary stabilisation socket.

Two-handed items may use a primary hand socket plus an IK target for the secondary hand. Saddles use body and rider sockets. Cargo may use paired anchors and sway constraints.

# 23. Clothing and Soft-Garment Voxel Presentation

Leyforge clothing should remain voxel-authored and intentionally stylised. It may use rigid components, limited bone-driven panels and short segmented chains for hems, scarves or capes.

Full cloth simulation is not required. Approved techniques include:

- Rigid torso and limb pieces.
- Small layered voxels for folds.
- Bone-driven coat tails.
- Limited secondary motion.
- Material animation for magical fabric.

Clothing must provide safe combat, work, sitting and locomotion poses.

# 24. Armour and Protective Equipment Presentation

Armour profiles define:

- Coverage and exposed weak regions.
- Material family.
- Thickness and silhouette.
- Body compatibility.
- Breakable or damaged states.
- Equipment-set relationships.
- Faction or culture variants.
- Enchantment and corruption hooks.

Protective value remains owned by combat and item systems. Presentation should make broad armour class readable but must not imply exact statistics that the item does not possess.

# 25. Weapons, Tools, Shields and Held Objects

Held presentations need:

- Grip and orientation profiles.
- Main/off-hand compatibility.
- Two-handed support.
- Sheath and stow positions.
- Attack or work animation compatibility.
- Trail/effect hook sockets for future systems.
- Icon capture pose.

Tools used by NPC jobs should align with work animations and animation event markers. A builder's hammer must contact the intended work point; a miner's pick should align with the strike arc.

# 26. Backpacks, Jewellery, Accessories and Carried Goods

Accessories add individuality but can create visual clutter.

Rules:

- Use accessory budgets by entity tier.
- Reserve strong silhouettes for gameplay-relevant equipment.
- Hide small accessories at distance.
- Avoid stacking multiple items on the same narrow region without explicit offsets.
- Allow player visibility toggles for selected cosmetic categories where safe.

Carried crates, baskets, bundles and job goods may use temporary task attachments rather than persistent equipment slots.

# 27. Multi-Armed and Unusual Humanoid Equipment

Multi-armed entities require indexed hand roles:

```text
hand.primary.left/right
hand.secondary.left/right
hand.tertiary.left/right
```

Equipment profiles should declare allowed hand groups, animation masks and conflict rules. The system should not assume every extra arm can independently use a full-size weapon without silhouette, collision and animation review.

Digitigrade legs, hooves, wings, tails and unusual heads need dedicated footwear, back and head fit families or approved hidden/substitute presentation.

# 28. Quadruped Barding, Saddles, Harnesses and Cargo

Quadruped equipment uses body-zone and movement-clearance rules.

Required checks include:

- Shoulder and hip movement.
- Neck rotation.
- Saddle and rider clearance.
- Leg armour clipping during gait.
- Tail freedom.
- Cargo balance and symmetry.
- Mount/dismount animation compatibility.

A pig may support a simple harness and small cargo pack. A war boar may use dedicated barding. A dragon saddle requires species-specific authoring and boss or mount permissions.

# 29. Creature Natural Equipment and Modular Anatomy

Natural weapons and protection may be represented as modular equipment-like components while remaining part of the creature definition:

- Tusks.
- Claws.
- Horns.
- Shell plates.
- Spines.
- Stingers.
- Crystal growths.
- Magical cores.

This allows variants to add, enlarge, damage or replace these parts through inheritance. Gameplay systems decide their mechanical effects.

# 30. Boss Armour, Breakable Parts and Phase Equipment

Boss presentation may include:

- Armour plates bound to damage regions.
- Phase-specific crowns, cores or weapons.
- Breakable restraints.
- Damaged wing or tail variants.
- Arena-linked equipment.
- Exposed weak-point states.

Break events should replace or hide approved voxel components and preserve collision, socket and animation mappings defined by gameplay integration.

# 31. Item Quality, Rarity, Material and Enchantment Presentation

Quality and rarity may influence:

- Edge cleanliness.
- Material refinement.
- Ornament density.
- Repair state.
- Palette accents.
- Approved emission or rune details.

Rarity must not be communicated by colour alone. Shape, border, icon frame, pattern or readable material treatment should provide additional cues.

Not every rare item requires a unique mesh. A family may use shared geometry with controlled material and detail overrides.

# 32. Equipment Sets, Mix-and-Match and Visual Cohesion

Set equipment may share:

- Material roles.
- Trim motifs.
- Proportion language.
- Coverage transitions.
- Emblem placement.
- Damage style.

Mix-and-match remains allowed. Fit profiles should minimise gaps and overlaps between common adjacent regions. The preview should offer random outfit testing to expose bad combinations.

# 33. Animation Compatibility and Equipment Motion

Equipment may influence animation through declared profiles:

- Weapon stance.
- Shield posture.
- Heavy armour movement restriction presentation.
- Backpack sway.
- Robe or coat-tail secondary motion.
- Rider and cargo stabilisation.

Presentation cannot change movement speed or combat timing unless gameplay owns that rule. It may select a compatible animation set after gameplay provides the equipped category.

# 34. Clipping Prevention, Adaptation and Fallbacks

## 34.1 Prevention Order

1. Correct socket and fit profile.
2. Coverage-mask hiding.
3. Approved local offset or bounded scaling.
4. Alternate authored fit variant.
5. Simplified substitute presentation.
6. Hide incompatible cosmetic component with warning.
7. Require manual correction for critical gear.

## 34.2 Critical and Non-Critical Clipping

Critical clipping includes weapons through faces, armour blocking limbs, saddles intersecting riders and equipment obscuring boss weak points. Minor hidden internal overlap may be acceptable when invisible in all approved poses.

# 35. Visibility Rules, Sheathing and Contextual Presentation

Visibility may depend on:

- Active or stowed state.
- First- or third-person view.
- Dialogue portrait.
- Swimming or climbing.
- Mounted state.
- Work task.
- Death or dropped state.
- LOD distance.

Rules must be deterministic and should avoid equipment popping without transition at normal gameplay distance.

# 36. Deterministic Appearance Generation

Persistent variation should be generated from a stable appearance record, not from unversioned random calls.

The record may store:

- Generation profile ID.
- Profile version.
- Master appearance seed.
- Per-channel seeds.
- Selected component IDs.
- Local overrides.
- Persistent history additions.

A named NPC should resolve identically after save/load, chunk unload, server reconnection and simulation promotion.

# 37. Seed Channels and Reproducibility

Separate channels prevent one new hair option from changing an NPC's entire appearance.

Recommended channels:

- Body frame.
- Surface palette.
- Markings.
- Head features.
- Hair and facial hair.
- Horns or optional anatomy.
- Culture clothing selection.
- Profession accessories.
- Personal accessory.
- Wear and repair state.

Each channel derives from the master seed and stable channel name. Content-pool version changes require migration or pinning of selected IDs.

# 38. Parameter Domains, Weighted Pools and Exclusions

Generation profiles define:

- Eligible component pools.
- Weights.
- Required and forbidden tags.
- Culture, biome, age and profession conditions.
- Maximum accessory count.
- Colour harmony constraints.
- Symmetry or asymmetry allowance.
- Rarity and uniqueness limits.

Exclusions prevent impossible or unwanted combinations, such as a closed helmet with incompatible horns or heavy wing armour on a creature that must fly.

# 39. Authored Variants and Procedural Variants

| Variant Type | Use |
| --- | --- |
| Fully Authored | Hero NPCs, bosses, story characters and signature equipment. |
| Parameterised Authored | Approved body or equipment changes controlled by values. |
| Seeded Procedural | Population diversity within strict pools and rules. |
| Runtime Conditional | Damage, status, weather or temporary magic. |
| Content-Pack Override | Project or mod replacement with explicit priority. |

Generated variants may be baked and promoted to authored profiles when they become important named entities.

# 40. Entity Families and Variant Inheritance

A family definition should identify which data is shared and which may vary.

Example:

```text
appearance.creature.boar.family
|-- body plan and rig family
|-- base surface roles
|-- locomotion compatibility
|-- tusk socket group
|-- standard damage regions
|-- variant pools
`-- icon capture family
```

Children may include domestic pig, wild boar, snow boar, corrupted boar, armoured war boar and giant boss boar.

# 41. Creature, Monster, Elite and Boss Variant Rules

## 41.1 Normal Variant

Uses palette, markings, small proportion changes and optional anatomy within family limits.

## 41.2 Elite Variant

May add stronger silhouette features, natural armour, equipment, scale changes and readable status presentation.

## 41.3 Boss Variant

Requires deliberate authored review. It may change body frame, phase parts, breakable regions and animation set, but should preserve family readability where narratively intended.

## 41.4 Swarm Variant

Uses low-cost palette and minor geometry variation with shared meshes and materials to avoid performance collapse.

# 42. Age, Scars, Damage and Persistent History

Age and history may alter:

- Palette saturation or material wear.
- Hair, fur or feather distribution.
- Horn growth.
- Scars and repairs.
- Posture profile.
- Equipment condition presentation.
- Missing or prosthetic components.

These layers should update through explicit events or milestones, not constantly regenerate.

# 43. Magical, Elemental, Corrupted and Undead Layers

Magical layers may add:

- Emissive eyes or runes.
- Crystal, frost, ash or living-root growths.
- Palette substitution.
- Material role replacement.
- New phase components.
- Corruption spread masks.
- Undead damage or exposed bone.

The base identity remains available for cleansing, transformation or comparison. Permanent transformations should create explicit saved layers or new profile IDs.

# 44. Runtime Environmental and Status Layers

Runtime layers include:

- Wet.
- Muddy.
- Snow-covered.
- Burning.
- Frozen.
- Poisoned.
- Bleeding or damaged.
- Exhausted.
- Frightened.
- Empowered.
- Invisible or phased.

Compatibility and priority rules prevent unreadable stacks. Burning and frozen may be mutually exclusive; mud may combine with damage; invisibility may suppress most surface detail while preserving required gameplay outlines.

# 45. Player Character Customisation

The player creator should expose curated categories:

- Body frame within gameplay-safe limits.
- Head and face family.
- Skin, fur, scale or surface palette.
- Hair, facial hair and adornments.
- Optional anatomy permitted by selected playable species.
- Starting clothing or cosmetic style.
- Voice and audio are deferred to later systems.

Developer-authored presets, randomise-by-category and undo should be supported. The player should preview walking, combat stance, equipment, lighting and icon portrait before confirming.

Character creation choices are stored as stable component IDs and parameters, not a flattened screenshot or destructive mesh.

# 46. NPC Population and Persistent Individuality

Population generation should balance variety and cultural coherence.

A village profile may define:

- Species and body-frame distribution.
- Culture clothing pools.
- Profession kits.
- Wealth ranges.
- Regional palettes.
- Age distribution.
- Rare feature frequency.
- Family resemblance channels where later supported.

Named NPCs store resolved choices. Distant simulation may omit rendered assets but must preserve the appearance record for later promotion.

# 47. Multiplayer Identity, Saves and Replication

## 47.1 Authority

The authoritative world owns persistent appearance IDs, equipment state, history layers and required seeds. Clients resolve or receive compatible baked products.

## 47.2 Replication

Replicate compact identifiers and parameters rather than full voxel volumes where content packs match. Missing content uses approved fallbacks and reports compatibility issues.

## 47.3 Local Preferences

Local accessibility outlines, nameplate colours or cosmetic visibility options may be client-side where they do not alter authoritative gameplay or conceal critical information.

# 48. Icon, Portrait, Codex and Thumbnail Capture

The live Forge view should create:

- Player portrait.
- NPC dialogue portrait.
- Creature codex image.
- Boss card.
- Equipment inventory icon.
- Loadout thumbnail.
- Save or character-select thumbnail.

Capture profiles store:

- Camera type and angle.
- Pose or animation frame.
- Equipment state.
- Runtime visual state.
- Lighting preset.
- Background and transparency.
- Crop, padding and output size.
- Variant or body-frame target.

Live-linked icons may regenerate after approved source changes. Locked icons warn when stale.

# 49. Forge Customisation Workspace and Workflow

Recommended workflow:

```text
Select entity family or appearance profile
    -> inspect inheritance stack
    -> edit body/surface/culture layers
    -> equip or fit presentation assets
    -> configure generation pools and exclusions
    -> preview runtime states and animation poses
    -> capture icons or portraits
    -> validate dependencies, clipping and budgets
    -> compare with parent/approved revision
    -> approve and bake
```

The workspace should include:

- Appearance Stack panel.
- Body and Surface inspector.
- Equipment Wardrobe and Fit panel.
- Variant Generator.
- Seed and Reproduction inspector.
- Coverage and Occlusion view.
- Dependency graph.
- Comparison and revision view.
- Capture Studio.
- Validation report.

# 50. Live Preview, Fit Testing and Test Laboratory

Every approved equipment family and appearance profile should be tested against representative scenarios.

## 50.1 Humanoid Tests

- Idle, walk, sprint, crouch, jump and swim.
- Melee, ranged, magic and work poses.
- Sitting, sleeping and doorway clearance.
- First-person hand view where relevant.
- Dialogue portrait framing.

## 50.2 Creature Tests

- Full gait cycle.
- Turning and slopes.
- Attack and damage poses.
- Mount and cargo clearance.
- Flight, landing or climbing where relevant.

## 50.3 Combination Tests

The Forge should sample random valid combinations across body frames, equipment sets and runtime layers to reveal clipping or unreadable results before release.

# 51. Dependency Graphs, Revision History and Overrides

## 51.1 Dependency Graph

Before changing a shared body, material, fit profile or equipment asset, the Forge should show affected entities, icons, blueprints and baked products.

## 51.2 Revision History

Each source definition should support:

- Compare current to approved.
- Restore earlier revision.
- Review inherited changes.
- Record migration notes.
- Show regenerated icons and affected variants.

## 51.3 Overrides

Override layers may replace selected fields without copying the whole parent. Load order is deterministic. Conflicts are visible and resolvable. Reverting an override restores the inherited value.

# 52. Performance, LOD, Batching and Memory

Visual variety must scale to villages, raids and creature groups.

Guidance:

- Reuse shared voxel meshes and material atlases.
- Prefer palette parameters over unique materials.
- Bake common equipment/body combinations where beneficial.
- Merge hidden covered body surfaces in runtime products.
- Reduce accessory and status-layer detail at distance.
- Preserve silhouette-critical equipment in LOD.
- Use grouped or shared variants for swarms.
- Avoid per-entity shader instances unless required.
- Profile packaged Godot builds, not editor-only results.

Bosses may receive larger budgets, but every boss needs authored LOD and fallback presentation.

# 53. Validation, Readability and Accessibility

## 53.1 Hard Errors

- Missing required parent or stable ID.
- Inheritance cycle.
- Required socket or semantic role absent.
- Equipment fit profile claims compatibility but cannot resolve.
- Corrupt seed profile or unresolved component selection.
- Duplicate mutually exclusive authoritative layer.
- Missing runtime product for an approved mandatory presentation.

## 53.2 Warnings

- Visible clipping in approved poses.
- Equipment hides critical silhouette or weak point.
- Too many accessories or materials.
- Colour-only rarity or faction identification.
- Unreadable icon at target size.
- Excessive unique mesh/material count.
- Body variation exceeds animation envelope.
- Stale locked icon.

## 53.3 Accessibility

Important identity should use shape, pattern, iconography or silhouette in addition to colour. Team, faction, hostility and equipment class should remain readable for colour-vision deficiencies and in low-light environments.

# 54. Editable Source and Baked Runtime Products

| Editable Source | Runtime Product |
| --- | --- |
| Voxel body/equipment parts | Merged render meshes. |
| Appearance layers | Compact resolved appearance record. |
| Fit and coverage profiles | Resolved attachments and visibility masks. |
| Generation pools and seeds | Selected stable component IDs. |
| Material DNA references | Atlas/material instance references. |
| Capture profiles | PNG/WebP icon or portrait outputs. |
| LOD settings | LOD meshes and simplified attachments. |

A rebuild from source must be deterministic for the same versioned inputs.

# 55. Proof-of-Concept Scope and Acceptance Criteria

## 55.1 POC Assets

1. Standard player-compatible humanoid with curated customisation.
2. Forest-village NPC family with at least three professions.
3. Shared clothing and iron guard equipment family.
4. Pig family with domestic, wild boar and corrupted variants.
5. Four-armed humanoid equipment test.
6. Mount harness or saddle fit test.
7. Boss armour and phase-break presentation.
8. Live icon and portrait capture examples.

## 55.2 Acceptance Criteria

- All source assets remain voxel-authored and editable.
- Inheritance resolves deterministically with no cycles.
- Stable IDs survive visual replacement.
- Named NPC appearance survives save/load and simulation LOD.
- Player options remain within rig and equipment compatibility envelopes.
- Equipment fits representative body frames and required animation poses.
- Coverage and visibility rules prevent major clipping.
- Creature family variants preserve recognisable identity.
- Corruption and boss-phase layers are non-destructive and reversible where designed.
- Icons regenerate from approved capture profiles.
- Missing optional content uses valid fallbacks.
- Runtime products rebuild reproducibly.
- POC village crowd and creature tests meet first-pass performance targets.

# 56. Implementation Handoff and Deferred Features

Document 22K will translate this design into Godot Resources, editor panels, resolution services, baking systems, save records, replication contracts and validation tools.

Deferred or later systems include:

- Full cloth simulation.
- Full realistic facial morphing.
- Full Audio Forge.
- Full VFX and Particle Forge.
- Marketplace or public user-generated-content moderation.
- Genetic heredity simulation beyond controlled family resemblance profiles.
- Automatic unrestricted conversion of conventional mesh clothing into voxel equipment.

The data model should preserve named hooks and sockets so deferred systems can connect later without replacing stable appearance IDs.

# 57. Production and Balancing Rules

1. Build strong parent families before creating many children.
2. Prefer clear silhouette differences over tiny surface noise.
3. Use deterministic variety to support identity, not to maximise combinations for their own sake.
4. Do not create equipment without at least one approved fit profile and icon.
5. Test equipment against motion, not only a static rest pose.
6. Treat culture, profession and faction as separate layers.
7. Reserve unique meshes and materials for content that benefits from them.
8. Keep runtime status layers readable and bounded.
9. Promote important generated characters to explicit saved profiles.
10. Protect stable IDs and migration paths during visual overhaul.
11. Validate random combinations before approving a generation profile.
12. Profile crowds, raids and villages with real variant diversity enabled.

# 58. Open Questions for Later Documents

- Exact maximum number of active appearance layers per entity tier.
- Final palette-atlas and material-instance strategy in Godot.
- Whether covered body voxels are removed at bake time or masked at runtime for each equipment class.
- Final player cosmetic visibility and transmog rules.
- How family resemblance should work if generational NPC simulation is expanded.
- Which boss breakable equipment parts require separate physics objects.
- How mod content packs declare equipment compatibility with custom body families.
- Final save migration policy when a selected cosmetic component is removed.
- Whether some icons use a shared generated atlas or individual files.

# Appendix A. Appearance Definition Template

```text
appearance_id
parent_appearance_id
body_family_id
body_frame_profile_id
surface_profile_id
people_profile_id
culture_profile_id
faction_profile_id
profession_profile_id
persistent_variant_profile_id
generation_profile_id
master_seed
resolved_component_ids
local_overrides
equipment_presentation_bindings
history_layers
runtime_layer_compatibility
capture_profile_ids
lod_profile_id
source_version
lifecycle_state
dependencies
migration_notes
```

# Appendix B. Visual Inheritance Order

| Priority | Layer | May Add | May Replace | May Hide |
| ---: | --- | --- | --- | --- |
| 10 | Base Body | Required anatomy | Base components | No critical roles. |
| 20 | Body Frame | Proportion parameters | Approved body frame | No. |
| 30 | Surface | Palette and markings | Material roles | No. |
| 40 | People/Region | Features and markings | Approved regional traits | Optional inherited traits. |
| 50 | Culture | Clothing and adornment | Culture materials | Conflicting adornments. |
| 60 | Faction | Uniform and insignia | Faction accents | Conflicting insignia. |
| 70 | Profession/Rank | Tools and role kit | Profession clothing | Lower-priority role props. |
| 80 | Individual | Personal features | Local component choice | Optional cosmetics. |
| 90 | Equipment | Worn/held assets | Slot presentation | Covered body/clothing regions. |
| 100 | History | Scars and repairs | Damage presentation | Lost parts where gameplay permits. |
| 110 | Runtime State | Temporary overlays | State materials | Low-priority cosmetic detail. |

# Appendix C. Equipment Slot and Coverage Register

| Slot | Common Coverage | Common Sockets |
| --- | --- | --- |
| Head | scalp, forehead, sides, rear head | head, brow, horn-base variants. |
| Face | eyes, nose/muzzle, mouth region | face, eye, jaw. |
| Neck | neck and upper shoulder | neck, collar. |
| Torso Inner | chest and back underlayer | chest_root. |
| Torso Outer | chest, back, ribs | chest, spine_upper. |
| Shoulders | left/right shoulder | shoulder.left/right. |
| Arms | upper and forearm | arm role bones. |
| Hands | hand and wrist | hand.left/right. |
| Waist | belt, pelvis | pelvis, hip. |
| Legs | thigh and shin | leg role bones. |
| Feet | foot/hoof/claw | foot.left/right. |
| Back | upper/lower back | back.upper/lower. |
| Main Hand | none | hand.primary. |
| Off Hand | none | hand.off. |
| Saddle | quadruped back | saddle.root, rider.seat. |
| Cargo | body sides/rear | cargo.left/right/rear. |

# Appendix D. Fit Profile Template

```text
fit_profile_id
presentation_asset_id
compatible_body_families
supported_body_envelope
required_sockets
coverage_regions
occlusion_rules
allowed_adaptation
alternate_fit_ids
fallback_presentation_id
animation_compatibility
first_person_rules
lod_rules
validation_pose_set
review_status
```

# Appendix E. Seed Channel Register

| Channel | Purpose | Stability Rule |
| --- | --- | --- |
| body_frame | Select approved size/proportion profile. | Pinned after entity creation. |
| surface_palette | Base surface colours. | Independent of component pool order. |
| markings | Pattern mask and placement. | Seed and generator version stored. |
| head_features | Ears, muzzle, eyes and related pieces. | Selected stable IDs stored for named NPCs. |
| hair | Hair and facial hair. | Culture and age filters applied. |
| optional_anatomy | Horns, tails or adornments. | Required compatibility tags. |
| culture_clothing | Non-equipment clothing choice. | Culture profile versioned. |
| profession_detail | Role props and wear. | May update when profession changes. |
| personal_accessory | Small individual detail. | Persistent unless removed by event. |
| wear_history | Repair, age and condition. | Updated through explicit events. |

# Appendix F. Example Entity Appearance Profiles

## Forest Builder NPC

```text
Body: humanoid.standard / compact frame
Surface: warm_skin_03
Culture: forest_human_common
Profession: builder_basic
Clothing: linen_shirt + work_trousers + reinforced_boots
Equipment: tool_belt + iron_hammer
Individual: short_dark_hair + eyebrow_02 + scar_small_cheek
History: dust_wear_light
Capture: dialogue_three_quarter
```

## Corrupted Boar

```text
Parent: appearance.creature.boar.wild
Body Variant: heavy_shoulders
Surface: dark_brush_fur
Natural Equipment: tusk_long
Corruption Layer: crystal_growth_stage_02
Eyes: corrupted_emissive
Damage Regions: inherited
Animation Family: boar_standard with corrupted_idle overlay
Capture: codex_full_body
```

## Four-Armed Guard

```text
Body: humanoid.four_arm.standard
Culture: mountain_city_guard
Faction: citadel_watch
Equipment: helmet_open_hornless, chestplate_split_shoulder,
           sword_primary, shield_primary_off,
           spear_secondary, utility_secondary_off
Fit: four_arm_guard_exact
Capture: guard_full_body
```

# Appendix G. Validation Checklist

- [ ] All geometry originates from editable voxel source.
- [ ] Stable IDs and parent references resolve.
- [ ] No inheritance cycles exist.
- [ ] Layer ownership and order are explicit.
- [ ] Body frame remains inside approved animation and equipment envelopes.
- [ ] Surface palette and markings are reproducible.
- [ ] Culture, faction and profession layers remain separate.
- [ ] Equipment gameplay ID and presentation ID are linked correctly.
- [ ] Required slots, sockets and coverage regions exist.
- [ ] Fit profile passes representative poses.
- [ ] Critical clipping is absent.
- [ ] Hidden regions restore correctly when equipment is removed.
- [ ] Multi-arm and unusual anatomy mappings are explicit.
- [ ] Mount, saddle and cargo clearance passes.
- [ ] Boss breakable and phase presentation maps to valid regions.
- [ ] Rarity and faction information is not colour-only.
- [ ] Seed channels reproduce the same result.
- [ ] Generated pools honour exclusions and accessory budgets.
- [ ] Named NPC appearance persists through save/load and LOD.
- [ ] Runtime layers follow compatibility and priority rules.
- [ ] Icon or portrait is readable at target size.
- [ ] Dependency graph and overrides are valid.
- [ ] Runtime products rebuild from source.
- [ ] Performance and material budgets pass.
- [ ] Audio/VFX references remain hooks only.

# Appendix H. Proof-of-Concept Checklist

- [ ] Player humanoid customisation profile created.
- [ ] Character creator exposes curated voxel options.
- [ ] Three persistent NPC profession appearances created.
- [ ] Culture and faction layers demonstrated separately.
- [ ] Shared clothing family fitted to approved body frames.
- [ ] Iron guard set fitted and animated.
- [ ] Four-arm equipment mapping tested.
- [ ] Pig, wild boar and corrupted boar family resolved from inheritance.
- [ ] Mount harness or saddle profile tested.
- [ ] Boss armour break and phase variant tested.
- [ ] Seed channels reproduce identical named NPCs.
- [ ] Random combination fit test completes without critical errors.
- [ ] Runtime wet, damaged and corrupted layers stack correctly.
- [ ] Inventory icon, dialogue portrait and codex image captured.
- [ ] Override and revert workflow works.
- [ ] Save/load and simulation LOD preserve appearance.
- [ ] At least two presentation LOD levels operate.
- [ ] Runtime bake is deterministic.
- [ ] All POC assets reach Functional or higher lifecycle state.

# Appendix I. Glossary

| Term | Definition |
| --- | --- |
| Appearance Layer | Ordered presentation operation that adds, replaces, hides or modifies visual data. |
| Appearance Profile | Root definition that resolves an entity's persistent visual identity. |
| Body Envelope | Approved range of body dimensions supported by a fit or animation family. |
| Coverage Region | Named body area hidden or covered by equipment. |
| Deterministic Variant | Variation that reproduces from stable IDs, seeds and versioned rules. |
| Equipment Presentation | Voxel model and metadata used to show an item worn, held, stowed, dropped or displayed. |
| Fit Profile | Rules mapping equipment to compatible body families, sockets and coverage regions. |
| Generation Profile | Weighted pools, filters, exclusions and seed channels used to create variants. |
| Individual Override | Local saved difference applied after inherited family layers. |
| Material DNA | Shared visual identity controlling palette, surface response and state variation. |
| Occlusion Rule | Rule that hides an underlying body or clothing region when covered. |
| Persistent Appearance | Visual identity stored across saves and simulation promotion. |
| Runtime Visual Layer | Conditional presentation driven by current authoritative state. |
| Semantic Slot | Functional equipment role independent of a specific skeleton bone name. |
| Seed Channel | Independent deterministic random stream for one appearance category. |
| Variant Family | Parent definition and related children sharing body, rig, materials or presentation rules. |
| Visual Inheritance | Parent-to-child resolution of appearance data with field-level overrides and fallbacks. |
| Voxel Source of Truth | Editable voxel data from which runtime presentation products are baked. |

---

**End of Document 22G - Character Customisation, Equipment, Variants and Visual Inheritance - Version 0.1**
