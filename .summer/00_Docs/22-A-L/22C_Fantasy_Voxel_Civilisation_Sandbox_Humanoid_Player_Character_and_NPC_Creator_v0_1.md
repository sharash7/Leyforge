# Fantasy Voxel Civilisation Sandbox
## 22C - Humanoid Player Character and NPC Creator
### Voxel Character Assembly, Appearance, Clothing and Identity Presentation
**Version 0.1 - Detailed Design Bible Draft**

A voxel-only humanoid creation system for player characters, persistent NPCs, villagers, humanoid enemies, cultures, professions, equipment presentation, facial identity, modular anatomy, deterministic variation, portraits and developer-controlled visual overrides inside the Leyforge Forge.

## Humanoid Player Character and NPC Creator Statement

| Field | Locked Direction |
| --- | --- |
| Document Scope | Defines the Forge workspace and data rules for creating player-compatible humanoids, NPCs, villagers, humanoid enemies and humanoid bosses through voxel bodies, proportion profiles, heads, faces, hair, species features, clothing, armour, equipment fitting, deterministic variation, portraits, validation and proof-of-concept character families. |
| Core Philosophy | One shared humanoid foundation should support broad visual identity without making every character look interchangeable or forcing every race, culture, profession or individual onto identical proportions. |
| Voxel Direction | Every visible body, face, hair strand cluster, horn, ear, tail, clothing piece, armour piece and humanoid attachment authored in the Forge originates from editable voxel source data or voxel-derived modifiers. Baked runtime meshes remain derived products rather than the editable source of truth. |
| Player/NPC Direction | Player characters and humanoid NPCs should share compatible anatomy roles, rigs and equipment contracts wherever practical, while NPC-only, enemy-only and boss-specific profiles may deliberately exceed player compatibility. |
| Body Direction | Use validated body-frame and proportion profiles with bounded controls for height, build, shoulder width, torso shape, limb length, posture, head scale, hands, feet and optional species anatomy. |
| Identity Direction | Persistent NPC appearance is generated once from deterministic profile data and then saved as identity state. A villager should not randomly change face, hair, clothing or body between sessions. |
| Face Direction | Faces remain stylised, readable and voxel-authored through modular heads, eyes, brows, noses or muzzles, mouths, jaws, ears, markings and expression-compatible parts rather than realistic facial simulation. |
| Hair Direction | Hair, facial hair and adornments use modular voxel pieces, layered style families, colour palettes, fit profiles, physics-light secondary motion and headwear compatibility masks. |
| Species Direction | Humanoid races and peoples may use different proportions, ears, horns, tails, wings, snouts, digitigrade legs, claws, skin materials and other anatomy through declared compatibility profiles rather than hidden one-off exceptions. |
| Clothing Direction | Clothing and armour are separate Forge assets attached through body regions, sockets, layer masks and fit profiles. Bodies do not permanently contain profession clothes or armour. |
| Equipment Direction | Held items, tools, shields, weapons, backpacks, jewellery and wearable equipment remain linked Item Forge assets. The humanoid creator previews and validates their fit without taking ownership of item gameplay data. |
| NPC Direction | NPC profiles may combine culture, settlement, profession, wealth, age presentation, history, condition and personal variation while keeping job, culture and identity as authoritative gameplay records outside the visual model. |
| Player Creator Direction | The developer Forge exposes complete control. A later player-facing character creator may expose only approved body, face, hair, palette, race and starting-clothing options derived from the same data. |
| Icon Direction | The live model viewer provides full-body icons, head-and-shoulders portraits, dialogue portraits and save thumbnails through reproducible camera, pose, lighting and background capture profiles. |
| Override Direction | Developers may open any humanoid presentation, replace source voxels, face parts, materials, clothing, fitting, portrait settings or compatible animations, and preserve the stable gameplay identity unless an explicit migration is required. |
| Validation Direction | Validate voxel integrity, body compatibility, equipment fit, clipping, camera height, doorway clearance, rig roles, expressions, portrait framing, first-person visibility, LOD, registry links and deterministic generation. |
| Implementation Context | Godot with Summer Engine is the current implementation target. This document locks design contracts; exact rigging, animation, runtime integration, editor UI and class architecture are expanded in 22E, 22F, 22H, 22J and 22K. |
| POC Direction | Prove one player-compatible humanoid foundation, three body-frame profiles, two head families, modular face and hair options, one four-armed test, six NPC profession profiles, culture palette variation, clothing and equipment preview, deterministic NPC generation and portrait capture. |

## Document Purpose

This document defines how the Leyforge Forge creates, edits, previews, validates and stores humanoid characters. It covers player characters, named villagers, merchants, guards, builders, mages, humanoid enemies and humanoid bosses that share all or part of a common voxel character foundation.

The main challenge is not simply modelling one human-shaped figure. Leyforge requires many persistent individuals, multiple races and cultures, visible professions, wearable equipment, animation compatibility, first-person and third-person presentation, multiplayer readiness and long-term content growth. The system therefore needs a reusable assembly architecture rather than isolated complete character meshes.

A humanoid is assembled from editable voxel body parts, a declared anatomy and proportion profile, a rig compatibility family, modular face and hair components, material palettes, clothing layers, equipment attachments, expression parts and portrait settings. These layers remain independently replaceable. A blacksmith may change clothing, equip an apron and hammer, become injured, age visually or receive a cultural redesign without losing the NPC's stable identity or requiring a new gameplay entity definition.

The creator must also preserve Leyforge's visual promise. Characters may contain more detail than terrain blocks, but they remain visibly voxel-based, readable at normal gameplay distance and compatible with the one-metre world. Smooth conventional character meshes are not the approved editable source. Runtime mesh baking, face merging, LOD and simplified collision are allowed only as optimised products derived from voxel source data.

This document does not define final rig-generation algorithms, complete locomotion sets, combat timing, AI behaviour, dialogue writing, player statistics, equipment balance or the final public character-creation screen. Those responsibilities belong to later documents and gameplay systems. This document establishes the humanoid visual-authoring contract they must use.

## Engine and Forge Status Note

> **Current Project Direction**  
> Leyforge is being developed in Godot with Summer Engine. Documents 21A-21G define the Voxel Asset Forge, 22A establishes the Entity Forge and Blueprint Forge expansion, and 22B defines humanoid anatomy and body-plan standards. This document builds the dedicated humanoid creator on those locked voxel, registry, override, baking, icon-capture and validation foundations.

## Design Sources

| Source Document | Relevant Direction | How 22C Uses It |
| --- | --- | --- |
| 00 - Master Game Design Bible | Characters and NPCs may be more detailed than terrain while remaining stylised, readable and part of the high-fidelity voxel world. | Locks voxel-authored humanoids with clear silhouettes and rejects realism that would conflict with block readability. |
| 04 - Items Registry | Clothing, armour, tools, weapons and wearable items remain stable inventory definitions linked to visual presentations. | Keeps equipment as Item Forge assets and defines preview, fitting and attachment contracts rather than merging items into bodies. |
| 07 - NPC Village System | Villagers are persistent named people with jobs, schedules, homes, inventories, relationships, memories, culture and condition. | Requires deterministic persistent appearance, profession and culture layers, individual identity and condition states. |
| 13 - Races, Peoples, Cultures and Factions | Ancestry, culture, faction, clothing, architecture and social identity are separate but connected layers. | Separates body species profiles from culture palettes, profession clothing and faction equipment. |
| 16 - Combat, Gear and Defence | Humanoids use weapons, armour, shields, hit regions, combat animation and readable equipment states. | Requires standard equipment regions, weapon sockets, armour coverage and fit validation while leaving combat rules external. |
| 17 - UI/UX System | UI should remain modern, readable, controller-capable, accessible and knowledge-aware. | Guides creator layout, portrait outputs, warnings, search, preview and later player-facing controls. |
| 21B - Voxel Modelling, Texturing and Material Authoring | One metre equals 32 standard authoring voxels, models retain editable voxel source and materials use reusable DNA. | Supplies body density, voxel tools, palettes, source-versus-baked separation and material inheritance. |
| 21C - Animation, Effects and Runtime Visual States | Named parts, transform clips, voxel frames, state bindings and animation events present runtime behaviour. | Requires expression parts, secondary-motion groups, clothing states and predictable animation roles. |
| 21D - Asset Overrides, Variants and Registry Integration | Stable IDs, field-level overrides, content packs and migration protect existing content. | Extends override and inheritance rules to humanoid bodies, faces, hair, clothing, portraits and generation profiles. |
| 21E - Forge UI/UX and Creator Workflow | Forge workspaces use asset browsing, editing, preview, validation, approval and baking. | Provides shared creator conventions while 22J later unifies the expanded interface. |
| 22A - Forge Entity and Blueprint Expansion | Locks voxel-only entities, icon capture, manifests, dependency tracking, lifecycle, revision history and test laboratory. | Provides the umbrella requirements for humanoid creation and production. |
| 22B - Entity Model Taxonomy, Anatomy and Body Architecture | Defines humanoid body graphs, scale, proportion profiles, optional anatomy, sockets, regions and compatibility. | Supplies the anatomy contract used by every humanoid assembled in this document. |

## Static Table of Contents

- 1. Locked Humanoid Creator Identity
- 2. Locked Direction Summary
- 3. Scope, Users and System Boundaries
- 4. Humanoid Character Definition Architecture
- 5. Voxel Source, Scale and Body Grids
- 6. Base Body Families and Compatibility Profiles
- 7. Body-Frame Presets and Proportion Controls
- 8. Player-Compatible Envelopes and World Clearance
- 9. Head Families and Cranial Construction
- 10. Eyes, Brows and Readable Gaze
- 11. Nose, Muzzle, Ears and Sensory Features
- 12. Mouth, Jaw, Teeth and Expression Geometry
- 13. Hair, Facial Hair and Head Adornments
- 14. Skin, Fur, Scales, Materials and Palette DNA
- 15. Race, People and Species Anatomy Profiles
- 16. Optional Anatomy: Horns, Tails, Wings and Extra Arms
- 17. Hands, Feet, Claws, Hooves and Interaction Ends
- 18. Clothing Layer Architecture
- 19. Armour, Equipment and Attachment Presentation
- 20. Equipment Fit Profiles, Clipping and Adaptation
- 21. Culture, Faction and Settlement Visual Profiles
- 22. Profession, Wealth and Social-Role Presentation
- 23. Persistent NPC Individuality and Deterministic Generation
- 24. Age Presentation, Scars, Condition and Life History
- 25. Expressions, Dialogue, Emotion and Face States
- 26. Player Character Creator Direction
- 27. NPC Batch Creator and Population Variation
- 28. Humanoid Enemy, Elite and Boss Extensions
- 29. Developer Overrides, Revisions and Migration
- 30. Live Preview, Test Laboratory and Fit Testing
- 31. Icon, Portrait and Save-Thumbnail Capture
- 32. Readability, Accessibility and Multiplayer Identification
- 33. Registry Fields, Dependencies and Packaging
- 34. Validation, Approval and Production Lifecycle
- 35. Proof-of-Concept Scope and Acceptance Criteria
- 36. Relationships With Documents 22D-22L
- Appendix A. Humanoid Component and Role Matrix
- Appendix B. Equipment Regions and Socket Register
- Appendix C. Example NPC Visual Profiles
- Appendix D. Character Generation Parameter Register
- Appendix E. Humanoid Validation Checklist
- Appendix F. Proof-of-Concept Asset Checklist
- Appendix G. Glossary

# 1. Locked Humanoid Creator Identity

The Humanoid Player Character and NPC Creator is the Forge workspace for building voxel humanoids from reusable, independently editable layers. It provides complete developer control over anatomy, proportions, body voxels, heads, faces, hair, species features, clothing, equipment presentation, expressions, palettes, variants and portrait capture while preserving external gameplay identity and registry ownership.

A completed humanoid is not one permanently fused model. It is a resolved presentation assembled from compatible source assets. The system may bake that assembly into efficient runtime products, but each approved layer remains traceable to editable voxel source and stable definition IDs.

> **Locked Rule**  
> Player characters and humanoid NPCs must remain voxel-authored assemblies whose visual layers can be edited or replaced without silently changing their gameplay identity, profession, culture, inventory, combat capability or persistent save record.

## 1.1 Creator Promise

A developer should be able to open a humanoid and answer:

- Which anatomy, body-frame, rig and equipment profiles does it use?
- Which visible parts are inherited, generated, overridden or equipped?
- Which options are player-compatible, NPC-only or boss-only?
- Which race or species features affect body shape and which culture profile affects dress?
- Which clothing and equipment layers are currently active?
- Which face parts and expression set create the character's readable identity?
- Which deterministic parameters must be saved to reproduce the same NPC?
- Which icons, portraits and thumbnails are generated from the live model?
- Which dependencies would be affected if a parent body, face, material or clothing family changed?

## 1.2 Design Pillars

| Pillar | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Voxel Authenticity | Bodies and wearable presentation originate from editable voxel source. | Humanoids visibly belong to the same world as blocks, items and machines. |
| Shared Compatibility | Player and NPC humanoids use standard roles where practical. | Equipment and animation families can be reused at scale. |
| Individual Identity | Faces, hair, proportions, marks and clothing combinations remain persistent. | Villagers are recognisable people rather than interchangeable mobs. |
| Layer Separation | Anatomy, culture, profession, equipment and condition are separate records. | Visual updates do not erase gameplay meaning or force duplicated models. |
| Controlled Variety | Seeded profiles create breadth within authored limits. | Settlements look populated without producing incoherent random characters. |
| Creator Authority | Developers can override every approved presentation layer. | Existing characters can be redesigned manually through the Forge. |
| Runtime Efficiency | Assemblies are baked, instanced and simplified according to declared budgets. | Large villages remain visually rich without one unique expensive mesh per NPC. |

## 1.3 What the Humanoid Creator Is Not

- It is not a hidden character-stat editor.
- It is not a realistic human-body simulator.
- It is not a system that derives personality or capability from appearance.
- It is not a promise that every body can wear every item without a compatibility profile.
- It is not permission to merge profession clothing permanently into an NPC body.
- It is not a requirement to expose every developer option to players.
- It is not a procedural generator that replaces authored art direction.
- It is not an excuse to make faces unreadable at normal gameplay distance.

# 2. Locked Direction Summary

| Area | Locked Decision |
| --- | --- |
| Source Geometry | Every visible humanoid component originates from voxel source, voxel-generated primitives or approved voxel modifiers. |
| Core Assembly | Resolve humanoids from anatomy + body frame + body parts + head/face + hair + materials + clothing + equipment + states + portrait profile. |
| Stable Identity | Gameplay entity IDs, NPC IDs and player records remain independent from presentation asset IDs. |
| Player/NPC Sharing | Share compatible roles, rigs and equipment families where practical, but allow NPC-only and boss-only incompatibilities. |
| Body Controls | Use bounded profile controls rather than unrestricted mesh stretching. Out-of-range changes create or require a new compatibility profile. |
| Body Presentation | Height, build, shoulder, torso, hip, limb and head settings are independently authored within species and equipment limits. |
| Sex and Presentation | Body-frame, chest, waist, hip, facial, hair and voice-facing visual options are independent presentation choices. The visual creator does not assign gameplay bonuses or personality. |
| Faces | Use modular voxel head and face parts with authored compatibility, expression and icon-readability profiles. |
| Hair | Use voxel hair families, fit masks, palette inheritance, headwear rules and optional light secondary motion. |
| Species Features | Ears, horns, tails, wings, muzzles, claws, hooves, digitigrade legs and extra arms are declared anatomy extensions. |
| Clothing | Clothing is separate from the body and organised by layer, coverage, fit and occlusion. |
| Equipment | Equipment stays owned by Item definitions and attaches through sockets and wearable regions. |
| NPC Variation | Generate from authored weighted profiles using a stable appearance seed; save resolved choices or seed + versioned profile. |
| Profession | Profession affects allowed clothing, tools, wear and presentation, but job truth remains in the NPC system. |
| Culture | Culture controls palettes, garments, adornments and preferred silhouettes without replacing species or faction records. |
| Condition | Damage, dirt, wetness, age presentation, corruption and status overlays are runtime or saved visual layers. |
| Portraits | Capture full-body icons, character portraits, dialogue portraits and save thumbnails from reproducible live-view profiles. |
| Overrides | Allow field-level visual overrides, comparison, selective reversion and migration-safe replacement. |
| Validation | Block approval on missing required roles, invalid scale, severe clipping, broken fit, missing portrait bounds, invalid dependencies or non-deterministic generation. |

# 3. Scope, Users and System Boundaries

## 3.1 Primary Users

The first implementation is a developer tool used by:

- Ash and project collaborators.
- Summer Engine or other authorised development agents.
- Character and voxel artists.
- Technical animators and rig authors.
- Content designers creating NPC populations.
- QA reviewers validating equipment, portraits and identity variation.

A restricted player-facing creator can later reuse approved data, but public access is not required for the first Entity Forge milestone.

## 3.2 Supported Humanoid Content

The workspace supports:

- Player character bodies.
- Persistent village NPCs.
- Travellers and merchants.
- Guards, workers, leaders and specialists.
- Humanoid faction members and raiders.
- Humanoid undead and corrupted variants.
- Humanoid constructs and golems.
- Four-armed and altered humanoids.
- Humanoid elites and bosses.
- Culture and profession clothing families.
- Humanoid portrait and icon generation.

## 3.3 External Ownership Boundaries

| System | Owns | Humanoid Creator References |
| --- | --- | --- |
| Player System | Player identity, selected race, progression, inventory and save state. | Presentation definition, chosen appearance parameters and portrait profile. |
| NPC Village System | NPC identity, name, job, home, relationships, needs, inventory and memory. | Stable appearance seed, resolved visual profile and condition layers. |
| Race/Culture/Faction System | Species, ancestry, culture, faction, law and relationship truth. | Allowed body profiles, material palettes, garments and adornments. |
| Items Registry | Equipment identity, stats, durability, ownership and inventory behaviour. | Wearable model, fit profile, attachment rules and icon links. |
| Combat System | Hit logic, damage, weapon use, armour protection and attack authority. | Body regions, weapon sockets, presentation states and animation events. |
| Animation System | Rig, clips, blend graphs, IK and event timing. | Anatomy roles, expression parts, clothing groups and compatibility profile. |
| Forge | Editable voxel source, presentation assembly, previews, portraits and baked outputs. | Does not become the owner of gameplay truth. |

## 3.4 Separation Example

```text
NPC record: npc.riverwood.blacksmith.mara
Job: blacksmith
Culture: culture.forest_human
Inventory: actual saved items
Appearance profile: humanoid.forest_blacksmith.female_frame_02
Appearance seed: 741924
Equipped apron: item.clothing.smith_apron
Held hammer: item.tool.iron_hammer
Current condition: soot_level_02 + left_cheek_scar
```

Changing the apron model or face palette does not change Mara's job, inventory, reputation or memories.

# 4. Humanoid Character Definition Architecture

## 4.1 Layered Definition

```text
HumanoidPresentationDefinition
|-- anatomy_profile_id
|-- body_frame_profile_id
|-- proportion_parameters
|-- body_part_set
|-- head_family_id
|-- face_component_set
|-- hair_and_adornment_set
|-- material_palette_profile
|-- species_extension_set
|-- clothing_loadout_or_profile
|-- equipment_presentation_links
|-- rig_compatibility_profile
|-- expression_set_id
|-- runtime_visual_state_profile
|-- portrait_capture_profile
|-- LOD_and_bake_profile
`-- override_and_revision_metadata
```

## 4.2 Definition Types

| Definition | Purpose | Example |
| --- | --- | --- |
| Humanoid Template | Reusable starting assembly. | Standard adult humanoid. |
| Body Frame Profile | Proportion limits and shape direction. | Short stocky, tall slender. |
| Head Family | Head source and compatible face grid. | Rounded human head, angular elf head. |
| Face Component | Local voxel part or frame. | Eyes, brows, nose, mouth. |
| Hair Family | Modular hairstyle and fit rules. | Braided shoulder-length hair. |
| Species Profile | Allowed anatomy, materials and ranges. | Forest elf, dwarf, goblin. |
| Culture Profile | Palettes, garments and adornment preferences. | Riverwood forest culture. |
| Profession Profile | Clothing, carried tools and wear patterns. | Farmer, guard, mage. |
| Individual Profile | Stable resolved appearance for one named entity. | Mara the blacksmith. |
| Player Appearance Record | Player-selected approved options. | Save-specific player design. |

## 4.3 Resolved Presentation

At runtime, the game resolves the final character presentation in a deterministic order:

```text
base humanoid template
    -> species anatomy profile
    -> body-frame and proportions
    -> individual body/head/face choices
    -> culture presentation
    -> profession or default clothing
    -> equipped items
    -> persistent marks and history
    -> runtime condition and temporary states
    -> active animation and expression
```

Later layers may hide or replace earlier visuals but do not erase their source records.

# 5. Voxel Source, Scale and Body Grids

## 5.1 Canonical Density

The standard humanoid density is 32 voxel cells per world metre. A baseline 1.75 metre humanoid is approximately 56 authoring voxels tall before hair, hats, horns or raised poses.

Standard density is a target, not a requirement that every body use one continuous 56-voxel volume. Humanoids should be assembled from modular voxel parts with aligned connection grids.

## 5.2 Recommended Part Grids

| Part | Typical Working Volume | Notes |
| --- | --- | --- |
| Head | 16-24 voxels per axis | Enough space for readable eyes, hair line, ears and mouth. |
| Torso | 20-28 wide, 12-20 deep, 20-30 tall | Varies by frame and armour compatibility. |
| Upper Arm | 6-10 wide/deep, 14-22 long | Uses shoulder and elbow connection zones. |
| Forearm | 5-9 wide/deep, 12-20 long | Includes wrist interface. |
| Hand | 5-9 voxel local volume | Simplified grip shapes preferred. |
| Thigh | 8-14 wide/deep, 16-26 long | Must preserve hip and knee clearance. |
| Lower Leg | 7-12 wide/deep, 15-24 long | Plantigrade or alternate leg profile. |
| Foot | 7-13 wide, 12-20 long | Ground contact and footwear fit are critical. |

These ranges are authoring guidance. Compatibility profiles store exact connection dimensions and accepted variation.

## 5.3 Part Connection Grids

Every modular body part declares:

- Parent attachment plane.
- Child attachment plane.
- Pivot and joint centre.
- Forward and up axes.
- Allowed connection range.
- Material seam behaviour.
- Occlusion boundary.
- Clothing and armour envelope.
- Rig role.

A part may contain visual overlap around the joint to avoid gaps, but the overlap must not create obvious clipping in standard poses.

## 5.4 Density Exceptions

Higher local detail may be used for:

- Faces.
- Jewellery.
- Fine hair or braids.
- Small runes.
- Boss facial features.

Lower detail may be used for:

- Distant NPC LODs.
- Background population silhouettes.
- Large simple golems.

Density changes must occur through approved conversion or nested detail rules so seams remain aligned.

# 6. Base Body Families and Compatibility Profiles

## 6.1 Initial Humanoid Families

| Family | Direction | Typical Use |
| --- | --- | --- |
| Standard Humanoid | Plantigrade biped with standard torso, two arms and two legs. | Player, villagers, many humanoid enemies. |
| Short Humanoid | Shorter limbs, wider body, lower eye height. | Dwarf-like peoples, short cultures. |
| Tall Humanoid | Longer limbs and torso with controlled equipment adaptation. | Elf-like or tall peoples. |
| Broad Humanoid | Wider shoulders, deeper torso and larger hands. | Orc-like peoples, heavy workers, guards. |
| Slender Humanoid | Narrower torso and lighter limbs. | Some mages, fae peoples, agile cultures. |
| Digitigrade Humanoid | Altered lower leg and foot chain. | Beastfolk and some magical races. |
| Four-Armed Humanoid | Additional shoulder/arm pair and equipment profile. | Special races, elites, bosses. |
| Winged Humanoid | Back wing roots and folding-clearance profile. | Angelic, fae or avian peoples. |
| Humanoid Construct | Mechanical or stone body parts with humanoid roles. | Golems, animated armour. |

## 6.2 Compatibility Levels

| Level | Meaning | Reuse Expectation |
| --- | --- | --- |
| Full | Standard rig, clothing and equipment families work without adaptation. | Maximum sharing. |
| Profile-Compatible | Shares rig and sockets; clothing requires fit variant or scaling. | Common for short, tall and broad frames. |
| Partial | Upper or lower body shares roles; several animation or clothing families differ. | Digitigrade, winged, tailed. |
| Custom | Uses humanoid-like structure but requires dedicated rig/equipment. | Four-armed or composite bosses. |

## 6.3 Compatibility Is Explicit

Visual resemblance does not prove compatibility. A tall humanoid may still be fully compatible if authored within standard envelopes, while a superficially human character with reverse-jointed legs may require a partial profile.

# 7. Body-Frame Presets and Proportion Controls

## 7.1 Body-Frame Philosophy

The creator should offer expressive controls without unrestricted deformation that breaks joints, clothes or animations. Body frames define approved ranges and response curves rather than one fixed model.

## 7.2 Core Controls

- Overall height.
- Shoulder width.
- Torso width and depth.
- Torso length.
- Waist width.
- Hip width.
- Upper and lower arm length.
- Upper and lower leg length.
- Neck length and thickness.
- Head scale.
- Hand and foot scale.
- Body mass presentation.
- Posture and spinal curve.
- Limb thickness.

## 7.3 Independent Presentation Axes

The creator should allow authored body-presentation axes such as:

- Slender to broad.
- Soft to angular.
- Light to heavy build.
- Narrow to wide shoulders.
- Narrow to wide hips.
- Flat to fuller chest presentation.
- Short to long limbs.
- Upright to hunched posture.

These are visual controls only. They do not grant Strength, Agility, health or other gameplay attributes.

## 7.4 Preset Plus Manual Refinement

Recommended workflow:

```text
choose species profile
    -> choose body-frame preset
    -> adjust approved sliders
    -> preview clothing and animation
    -> resolve warnings
    -> save as reusable profile or individual appearance
```

## 7.5 Proportion Inheritance

A species profile may define default ranges. A culture may prefer certain visual presets for generated NPCs, but it must not block manual developer creation unless the lore explicitly requires a body distinction.

## 7.6 Child and Youth Profiles

The NPC system may eventually support children and ageing. Youth models require dedicated proportions, rigs, clothing fits, interaction heights and safety rules. They must not be created by simply scaling an adult uniformly.

Youth support is not required for the first humanoid Forge POC, but the data model should reserve compatibility profiles for later implementation.

# 8. Player-Compatible Envelopes and World Clearance

## 8.1 Standard Player Envelope

Player-compatible humanoids should fit the intended movement and building world. First-pass targets should preserve:

- Normal passage through standard doors.
- Clear movement in two-block-high or project-defined corridors.
- Camera eye-height range.
- Reach and interaction origins.
- Crouch and jump clearance.
- Mount and seat alignment.
- First-person hand and item framing.

Exact gameplay dimensions belong to implementation and movement systems, but the Forge must display the approved envelope.

## 8.2 Envelope Preview

The live viewer should show:

- One-metre world grid.
- Standard doorway.
- Standard stair and slab.
- Bed and chair reference.
- Workstation height.
- Camera origin.
- Interaction reach guide.
- Main collision capsule or shape.

## 8.3 Oversized Player Bodies

A body outside the standard envelope may be marked:

- Visual-only variation within unchanged collision.
- Alternate player profile requiring movement support.
- NPC-only.
- Boss-only.

The Forge should never silently change collision or camera rules merely because the model was made larger.

## 8.4 First-Person Considerations

Player-compatible bodies should define:

- First-person arm presentation.
- Body visibility policy.
- Held-item framing.
- Camera clipping mask.
- Head and hair hiding rules.
- Shadow-body or full-body rendering policy.

A third-person body may require a dedicated first-person arm presentation derived from the same materials and equipment.

# 9. Head Families and Cranial Construction

## 9.1 Head Family Definition

A head family defines:

- Voxel source volume.
- Face placement grid.
- Eye line and spacing ranges.
- Brow region.
- Nose or muzzle anchor.
- Mouth and jaw interface.
- Ear anchors.
- Hair fit surface.
- Headwear envelope.
- Neck connection.
- Expression compatibility.
- Portrait focus bounds.

## 9.2 Initial Head Families

| Family | Shape Direction | Typical Compatibility |
| --- | --- | --- |
| Rounded Humanoid | Balanced forehead, cheeks and jaw. | Standard human-like faces. |
| Angular Humanoid | Narrower cheeks and defined jaw or brow. | Elf-like or stylised sharp faces. |
| Broad Humanoid | Wide jaw, larger brow and nose region. | Orc-like, heavy or rugged faces. |
| Compact Humanoid | Larger head relative to body, shorter face. | Short peoples and stylised NPCs. |
| Muzzled Humanoid | Extended nose/mouth region. | Beastfolk and hybrid peoples. |
| Skeletal/Undead | Reduced soft form, exposed bone or hollow regions. | Undead variants. |
| Construct Head | Mechanical, stone or mask-like geometry. | Golems and animated armour. |

## 9.3 Head Replacement

Heads are modular and may be replaced without replacing the entire body when the neck, rig, expression and equipment compatibility contracts remain satisfied.

## 9.4 Readable Facial Scale

Faces should be tested at:

- Close creator view.
- Normal dialogue distance.
- Normal gameplay camera distance.
- Portrait size.
- Small icon size.

Details that only read at extreme zoom should not be the sole identity feature.

# 10. Eyes, Brows and Readable Gaze

## 10.1 Eye Components

Eyes may be authored as:

- Voxel inset parts.
- Surface voxel patterns.
- Separate eyeball-like voxel components.
- Emissive magical eyes.
- Multi-frame blinking parts.
- Single-colour stylised eyes.

## 10.2 Eye Parameters

- Size.
- Spacing.
- Height.
- Depth.
- Shape family.
- Iris or glow colour.
- Pupil style where used.
- Eyelid or blink family.
- Gaze range.
- Heterochromia or asymmetric override.

## 10.3 Brows

Brows provide high-value expression readability. They may be:

- Voxel strips.
- Material overlays.
- Hair-linked components.
- Bone or ridge geometry for non-human peoples.

Brows should support neutral, raised, lowered and asymmetrical expression states where the head family permits.

## 10.4 Gaze Markers

The creator stores eye and look-target markers for later animation. The visual head does not own NPC perception logic.

# 11. Nose, Muzzle, Ears and Sensory Features

## 11.1 Nose and Muzzle Families

Humanoid noses may use compact voxel families rather than freeform per-character sculpting. Supported ranges include:

- Small flat.
- Rounded.
- Straight.
- Broad.
- Hooked.
- Animal-like nose.
- Short muzzle.
- Long muzzle.
- Beak-like extension for avian humanoids.

## 11.2 Ear Families

- Rounded human-like.
- Long pointed.
- Short pointed.
- Wide animal ear.
- Drooping animal ear.
- Fin-like ear.
- Mechanical receiver.
- Missing or damaged variant.

Ear families declare hair and headwear conflicts, animation support and piercing/adornment sockets.

## 11.3 Additional Sensory Features

Optional features include:

- Additional eyes.
- Antennae.
- Whiskers represented as voxel clusters.
- Facial tendrils.
- Gem or magical sensory cores.
- External hearing fins.

These must be declared anatomy components rather than untracked decoration when animation, damage or equipment depends on them.

# 12. Mouth, Jaw, Teeth and Expression Geometry

## 12.1 Mouth Presentation Methods

| Method | Best Use | Notes |
| --- | --- | --- |
| Surface Frame Swap | Simple stylised mouths and dialogue expressions. | Low cost and highly readable. |
| Separate Lip/Mouth Part | More visible expression movement. | Requires compatibility with head family. |
| Hinged Jaw | Muzzles, shouting, eating and combat. | Good for non-human heads. |
| Voxel-Frame Mouth Interior | Magical speech, teeth changes or exaggerated expression. | Use sparingly. |

## 12.2 Required Expression Shapes

A standard humanoid face set should support at least:

- Closed neutral.
- Talking small open.
- Talking wide open.
- Smile.
- Frown.
- Fear or surprise.
- Shout or attack.
- Sleep/rest.

## 12.3 Teeth, Tusks and Fangs

Teeth and tusks may be separate components when they need:

- Species variation.
- Damage states.
- Material differences.
- Expression visibility.
- Boss or enemy readability.

Fine individual teeth are not required when a grouped voxel form reads better.

## 12.4 Dialogue Lip Synchronisation Boundary

The creator provides mouth frames, jaw controls and named speech shapes. Full voice analysis and audio production are deferred to later systems.

# 13. Hair, Facial Hair and Head Adornments

## 13.1 Hair Architecture

Hair is assembled from voxel style components rather than simulated individual strands.

```text
HairDefinition
|-- hairline/base cap
|-- front section or fringe
|-- side sections
|-- rear mass
|-- optional braids, ponytail or buns
|-- material and colour profile
|-- secondary-motion groups
|-- headwear compatibility mask
`-- LOD simplification
```

## 13.2 Style Families

- Cropped.
- Short layered.
- Medium loose.
- Long loose.
- Braided.
- Ponytail.
- Bun or tied.
- Mohawk or crest.
- Shaved combinations.
- Curly or coiled voxel clusters.
- Dreadlock-like grouped locks.
- Magical floating hair.
- Fur mane.

## 13.3 Facial Hair

Facial hair families may include:

- Stubble material layer.
- Moustache.
- Short beard.
- Full beard.
- Braided beard.
- Sideburns.
- Species-specific facial fur.

Beards must declare mouth, chest clothing and helmet conflicts.

## 13.4 Headwear Compatibility

Hair styles define masks or variants for:

- Open hats.
- Closed helmets.
- Hoods.
- Crowns.
- Circlets.
- Horn openings.
- Ear openings.

Headwear may hide, compress, replace or switch to a compatible hair variant. It should not rely on uncontrolled clipping.

## 13.5 Secondary Motion

Long hair, braids and ponytails may use small bone or rigid-part chains with conservative movement. Full strand simulation is out of scope.

# 14. Skin, Fur, Scales, Materials and Palette DNA

## 14.1 Material Separation

Body material and body geometry remain separate. A humanoid may reuse the same anatomy with different approved material DNA:

- Skin-like.
- Fur-covered.
- Scaled.
- Bark or living wood.
- Stone.
- Metal.
- Bone.
- Shadow or magical material.

## 14.2 Palette Profiles

A palette profile can control:

- Base tones.
- Highlight and shadow tones.
- Lips, nose or paw accents.
- Eye colours.
- Hair colours.
- Markings.
- Scar or age variation.
- Damage response.
- Wetness, dirt or soot response.
- Corruption response.

## 14.3 Authored Range Rules

Random NPC generation draws only from authored palette ranges associated with the species and culture profile. Pure unrestricted random colour is not acceptable for normal populations.

## 14.4 Markings

Markings may use:

- Material masks.
- Local voxel recolouring.
- Tattoo or paint layers.
- Fur patterns.
- Scales or plates.
- Magical glyphs.
- Faction marks.

Markings should remain visible and correctly placed across compatible body-frame changes.

# 15. Race, People and Species Anatomy Profiles

## 15.1 Layer Separation

A humanoid's visual result may depend on several records:

```text
species or ancestry anatomy
+ individual body and face
+ culture clothing and adornment
+ faction symbols and equipment
+ profession clothing and tools
+ runtime condition
```

Species does not automatically determine culture, profession or faction.

## 15.2 Species Profile Fields

- Allowed body families.
- Height and proportion ranges.
- Head families.
- Skin/fur/scale materials.
- Ear, horn, tail and wing options.
- Hand and foot types.
- Eye and mouth families.
- Hair or mane families.
- Rig and equipment compatibility.
- Player availability.
- NPC generation weights.
- Required and forbidden components.

## 15.3 Culture Profile Fields

- Clothing silhouettes.
- Material and dye palettes.
- Hair and grooming preferences.
- Jewellery and adornments.
- Profession garment variants.
- Faction or settlement emblems.
- Formal, work, travel and combat presentation.

## 15.4 Faction Profile Fields

Factions may add:

- Uniform pieces.
- Armour styles.
- Badges and banners.
- Face paint.
- Rank markers.
- Corruption or magical affiliation overlays.

Faction overlays must not overwrite a character's species or personal identity unless an explicit transformation occurs.

# 16. Optional Anatomy: Horns, Tails, Wings and Extra Arms

## 16.1 Horns and Antlers

Horn definitions contain:

- Root socket.
- Voxel source or guide-curve modifier.
- Pair or asymmetry rule.
- Material.
- Headwear conflicts.
- Damage/broken variant.
- Portrait bounds.

## 16.2 Tails

Humanoid tails may be:

- Short static.
- Long rigid-part chain.
- Fur tail.
- Reptilian tail.
- Mechanical cable tail.
- Magical floating tail.

Tail definitions need seating, clothing, armour and doorway-clearance checks.

## 16.3 Wings

Winged humanoids require:

- Wing-root sockets.
- Folded pose.
- Extended pose and span.
- Clothing/armour openings.
- Back equipment conflict rules.
- Ground and flight animation compatibility.
- Player-camera and doorway warnings.

A decorative wing does not automatically grant flight. Gameplay systems own movement capability.

## 16.4 Extra Arms

Four-armed and higher-arm humanoids need:

- Additional shoulder regions.
- Unique arm pair indices.
- Rig profile.
- Clothing and armour variants.
- Weapon and gesture socket mapping.
- Collision and animation clearance.

Additional hands do not automatically increase usable equipment slots. The creator only exposes presentation sockets and compatibility.

# 17. Hands, Feet, Claws, Hooves and Interaction Ends

## 17.1 Hand Complexity Levels

| Level | Direction | Use |
| --- | --- | --- |
| Simple Grip | Blocky mitten or grouped fingers. | Distant NPCs, simple characters. |
| Standard Hand | Thumb and readable finger grouping. | Players and important NPCs. |
| Detailed Hand | More articulated voxel fingers or claw parts. | Close-up characters and bosses. |

## 17.2 Grip Profiles

Hands declare compatible grip poses:

- One-handed tool.
- One-handed weapon.
- Two-handed weapon.
- Shield.
- Bow or ranged focus.
- Spellcasting/open palm.
- Carrying crate or block.
- NPC work tool.

## 17.3 Foot Profiles

- Standard boot/foot.
- Wide heavy foot.
- Digitigrade paw.
- Clawed reptilian foot.
- Hoof.
- Mechanical foot.
- Floating lower termination.

Foot profiles affect footwear, ground contacts and locomotion compatibility.

## 17.4 Interaction Ends

Hands, claws and other end effectors should expose:

- Grip socket.
- Palm orientation.
- Tool contact marker.
- Fingertip or claw attack marker where needed.
- IK target role.
- Equipment occlusion bounds.

# 18. Clothing Layer Architecture

## 18.1 Clothing Is Separate

Clothing should never be permanently fused to the base body when it represents an item, job garment, culture outfit or replaceable appearance layer.

## 18.2 Layer Order

Recommended clothing order:

```text
base body
    -> underlayer
    -> shirt/tunic layer
    -> trousers/skirt lower layer
    -> robe/coat outer layer
    -> belt and straps
    -> armour
    -> accessories
    -> equipped backpack/cape
```

Not every character uses every layer.

## 18.3 Clothing Definition Fields

- Clothing asset ID.
- Body regions covered.
- Layer index.
- Fit profile.
- Hidden body mask.
- Hidden lower clothing mask.
- Material and dye channels.
- Culture and profession tags.
- Rig or secondary-motion groups.
- Damage/wear variants.
- Icon and portrait behaviour.
- Item definition link when inventory-owned.

## 18.4 Garment Types

- Shirts and tunics.
- Trousers and leggings.
- Skirts and robes.
- Dresses.
- Aprons.
- Coats and cloaks.
- Hoods.
- Gloves.
- Boots and shoes.
- Belts and harnesses.
- Scarves and wraps.
- Ceremonial clothing.
- Work clothing.

## 18.5 Cloth Presentation

Clothing remains voxel-based. Loose cloth may use rigid sections, bone chains or authored frame changes. Full fabric simulation is not required.

# 19. Armour, Equipment and Attachment Presentation

## 19.1 Armour Regions

- Head.
- Face.
- Neck.
- Chest.
- Back.
- Shoulders.
- Upper arms.
- Forearms.
- Hands.
- Waist.
- Hips.
- Thighs.
- Shins.
- Feet.
- Tail, wing or extra-arm regions where supported.

## 19.2 Equipment Attachments

The standard humanoid attachment set should include:

- Main hand.
- Off hand.
- Back weapon.
- Back shield.
- Hip left and right.
- Chest or belt tools.
- Backpack.
- Quiver.
- Neck accessory.
- Ear and horn adornments.
- Headwear.
- Cape or cloak.

## 19.3 Item Ownership

The humanoid presentation stores visual attachment references. The Item Registry owns:

- Item identity.
- Stats.
- Durability.
- Quality.
- Enchantments.
- Ownership.
- Inventory state.

## 19.4 NPC Work Tools

Profession profiles may suggest or preview tools, but the runtime NPC should display the actual tool it owns or the approved job-prop substitute used by the simulation.

# 20. Equipment Fit Profiles, Clipping and Adaptation

## 20.1 Fit Profile Purpose

A fit profile describes how a clothing or equipment asset adapts across a body compatibility family.

## 20.2 Adaptation Methods

| Method | Direction | Suitable For |
| --- | --- | --- |
| Shared Exact Fit | Same voxel garment works unchanged. | Small proportion differences. |
| Anchor Scaling | Garment sections reposition or scale within limits. | Tall/short profiles. |
| Variant Selection | Choose an authored garment variant. | Broad, short, digitigrade or winged bodies. |
| Masked Replacement | Hide conflicting parts and use alternate geometry. | Helmets, hair, tails, wings. |
| Custom Only | Dedicated asset required. | Four-armed or heavily altered bodies. |

## 20.3 Clipping Validation

The Forge should test standard poses:

- Neutral.
- Walk extremes.
- Run extremes.
- Crouch.
- Sit.
- Sleep/lie.
- Main attack poses.
- Tool-use poses.
- Arms raised.
- First-person held-item pose.

## 20.4 Occlusion Masks

Garments and armour may hide body voxels or lower layers under covered regions. Masks reduce clipping and runtime overdraw but must not remove body areas visible through openings.

## 20.5 Warning Levels

- Informational: minor hidden overlap.
- Warning: visible clipping in uncommon pose.
- Approval blocker: severe clipping in idle, walk, dialogue or standard equipment pose.

# 21. Culture, Faction and Settlement Visual Profiles

## 21.1 Culture Presentation

Culture profiles can influence:

- Garment families.
- Material preferences.
- Dye palettes.
- Hair and grooming weights.
- Jewellery.
- Tattoos or paint.
- Profession uniforms.
- Formal and festival dress.
- Armour decoration.

## 21.2 Settlement Variation

Settlements may apply local layers such as:

- Settlement colours.
- Weather-adapted clothing.
- Resource scarcity substitutions.
- Local badges.
- Recent disaster wear.
- Wealth or growth-stage presentation.

## 21.3 Faction Readability

Faction presentation should be readable through more than tiny emblems. Use silhouette, palette, armour shape, carried equipment and movement style where practical.

## 21.4 Avoiding Uniform Clones

A culture profile defines coherent ranges, not one outfit for every resident. Variation should preserve family resemblance without making all villagers identical.

# 22. Profession, Wealth and Social-Role Presentation

## 22.1 Profession Profiles

Initial profession profiles include:

- Farmer.
- Lumberjack.
- Miner.
- Builder.
- Blacksmith.
- Guard.
- Merchant.
- Mage.
- Scribe.
- Healer.
- Hauler or courier.
- Leader or elder.

## 22.2 Visual Inputs

A profession profile may suggest:

- Work garment family.
- Protective equipment.
- Tool attachment points.
- Dirt, soot or wear profile.
- Storage pouch or belt layout.
- Headwear.
- Rank or skill adornment.

## 22.3 Wealth and Quality

Wealth should influence material quality, repair state, ornamentation and garment layers rather than changing a character's body. Poor does not mean random rags for every culture; each culture should have coherent low-cost, standard and wealthy presentations.

## 22.4 Work and Off-Duty Clothing

Important NPCs may have multiple clothing states:

- Work.
- Off duty.
- Sleep.
- Formal/festival.
- Travel.
- Combat emergency.

The NPC system chooses the appropriate state. The Forge authors and validates the presentations.

# 23. Persistent NPC Individuality and Deterministic Generation

## 23.1 Persistence Rule

A persistent NPC receives a stable appearance when created. That appearance is reproduced across saves, simulation LOD changes and actor respawns.

## 23.2 Generation Inputs

```text
species profile
+ culture profile
+ settlement profile
+ profession profile
+ age presentation band
+ authored rarity/importance profile
+ stable appearance seed
+ explicit story overrides
```

## 23.3 Generation Process

1. Resolve required anatomy and compatibility.
2. Select body frame and bounded proportions.
3. Select head and face components.
4. Select materials and markings.
5. Select hair and adornments.
6. Select default culture/profession clothing.
7. Apply personal marks or story overrides.
8. Validate clipping, readability and dependencies.
9. Store seed, source-profile versions and resolved choices.
10. Bake or select runtime presentation products.

## 23.4 Seed and Resolved Choice Storage

For long-term save safety, important NPCs should store both:

- Stable appearance seed and profile versions.
- Resolved component IDs and key parameters.

This prevents profile rebalance from unexpectedly changing an existing named NPC.

## 23.5 Duplicate Detection

Population generation should detect near-duplicate combinations within the same settlement and reroll or adjust low-priority choices. Exact twins may still be intentionally authored.

## 23.6 Identity Priority

Named, story-important or frequently encountered NPCs receive stronger uniqueness checks and may use manually approved individual profiles.

# 24. Age Presentation, Scars, Condition and Life History

## 24.1 Age Presentation

Age is presented through authored layers such as:

- Hair colour variation.
- Hairline or style.
- Face markings and wrinkles represented in voxel/material form.
- Posture profile.
- Clothing choices.
- Scars and wear.

Age presentation does not automatically define exact chronological age or gameplay capability.

## 24.2 Scars and Marks

Scars may be:

- Face material masks.
- Missing voxel detail.
- Damaged ear or horn variant.
- Body marking layer.
- Prosthetic or replacement component.

Scars can be persistent life-history records tied to events.

## 24.3 Runtime Condition Layers

- Dirt.
- Mud.
- Soot.
- Wetness.
- Snow/frost.
- Blood or injury presentation within rating limits.
- Illness pallor or magical status.
- Corruption.
- Burning or frozen status.

Temporary condition layers should be visually clear but not destroy the base identity.

## 24.4 Damage and Recovery

The Forge can author bruised, bandaged, wounded, missing-part and repaired presentations. Gameplay systems decide when they apply and whether they persist.

## 24.5 Prosthetics

Voxel prosthetic limbs may use standard role contracts when compatible. A prosthetic can be cosmetic, functional or gameplay-significant depending on external definitions.

# 25. Expressions, Dialogue, Emotion and Face States

## 25.1 Standard Expression Set

- Neutral.
- Friendly/happy.
- Concerned.
- Angry.
- Afraid.
- Sad or mourning.
- Injured.
- Tired.
- Sleeping.
- Talking.
- Shouting.
- Casting or concentrating.
- Corrupted/possessed.
- Defeated/dead presentation.

## 25.2 Expression Layers

```text
base face
+ brow state
+ eye/blink state
+ mouth or jaw state
+ head pose
+ optional material/emissive state
```

## 25.3 Dialogue Portraits

Dialogue portraits should use the live 3D model and current appearance, not an unrelated hand-authored portrait that can become outdated. The capture may use a dedicated portrait pose and expression while preserving equipment and condition rules.

## 25.4 Emotional Authority

The Forge defines expression assets. Dialogue, AI, relationship and event systems decide which emotion is active.

## 25.5 Expression Fallback

Every head family must provide neutral, blink, talk and damage-capable fallback states. Optional emotion states may fall back safely rather than breaking the face.

# 26. Player Character Creator Direction

## 26.1 Developer Creator

The developer version exposes:

- Full component and voxel editing.
- Species and body-profile authoring.
- All proportion parameters.
- Face and hair asset creation.
- Clothing and equipment fitting.
- Expression editing.
- Portrait capture settings.
- Compatibility and registry tools.
- Override and migration controls.

## 26.2 Future Player-Facing Creator

The public creator may expose approved selections for:

- Race/species.
- Body frame.
- Height within safe range.
- Face family and features.
- Hair and facial hair.
- Colours and markings.
- Optional species features.
- Starting clothing.
- Name and portrait.

It should not expose developer-only registry IDs, invalid combinations, raw rig settings or unrestricted body graph editing.

## 26.3 Player Preview Modes

- Neutral studio.
- In-world daylight.
- Night lighting.
- Starter clothing.
- Common armour preview.
- First-person hands.
- Walk, run and idle.
- Portrait preview.

## 26.4 Save Record

A player appearance save record stores approved selection IDs, parameters, colours, optional overrides, portrait profile and format version.

## 26.5 Multiplayer Identification

Player customisation should preserve readable silhouettes and team/faction overlays where used. Extreme appearance options must not obscure required combat or interaction readability.

# 27. NPC Batch Creator and Population Variation

## 27.1 Batch Creator Purpose

The NPC Batch Creator generates coherent test populations, settlement rosters and culture/profession preview groups without manually assembling every individual.

## 27.2 Batch Inputs

- Population count.
- Species distribution.
- Culture.
- Settlement stage.
- Profession roster.
- Age-presentation distribution.
- Wealth distribution.
- Gender/body-presentation weights where relevant to the authored culture.
- Uniqueness strength.
- Seed.

## 27.3 Batch Outputs

- Individual appearance records.
- Portraits or portrait queue.
- Duplicate report.
- Missing clothing/equipment report.
- Performance estimate.
- Culture consistency preview.
- Approval state.

## 27.4 Roster Preview

The creator should display the generated population together in a village-like lineup or live scene. This reveals repetition, palette imbalance and unreadable profession differences that single-character preview cannot show.

## 27.5 Promotion to Persistent NPC

Temporary generated agents may be promoted to persistent named NPCs. Promotion freezes or stores their resolved appearance and assigns a stable identity record.

# 28. Humanoid Enemy, Elite and Boss Extensions

## 28.1 Enemy Profiles

Humanoid enemies may reuse standard foundations with:

- Faction equipment.
- Hostile silhouette changes.
- Masks and armour.
- Corruption layers.
- Larger or altered proportions.
- Distinct weapon presentation.

## 28.2 Elite Readability

Elites should communicate status through combinations of:

- Scale.
- Armour silhouette.
- Colour and material.
- Weapon shape.
- Animation posture.
- Effects hooks.
- Rank adornments.

## 28.3 Boss Humanoids

Boss humanoids may use:

- Custom body compatibility.
- Multiple arm pairs.
- Large horns or wings.
- Breakable armour presentation.
- Phase-specific voxel variants.
- Weak-point markers.
- Dedicated portrait and camera profiles.

## 28.4 Player Equipment Compatibility

Boss equipment is not automatically player-wearable even when visually humanoid. Compatibility remains explicit in Item and equipment profiles.

# 29. Developer Overrides, Revisions and Migration

## 29.1 Editable Layers

Developers may override:

- Body voxel parts.
- Body-frame defaults and limits.
- Head and face components.
- Hair and facial hair.
- Materials and palettes.
- Species features.
- Clothing geometry and fitting.
- Equipment sockets and presentation.
- Expression sets.
- Portrait camera and pose.
- LOD and bake settings.

## 29.2 Safe Override Actions

- Open Original Read-Only.
- Edit as Project Override.
- Duplicate as New Family.
- Compare With Approved.
- Revert Selected Field.
- Revert Entire Layer.
- Validate Dependencies.
- Preview Existing Named NPCs.
- Run Migration Simulation.

## 29.3 Compatibility Migration

Changing a head family, rig role, clothing region or socket ID can affect many assets. The Forge should require a migration map when stable references change.

## 29.4 Existing Save Protection

Visual-only compatible overrides may apply to existing saves. Incompatible anatomy changes require explicit migration, fallback or version locking.

## 29.5 Revision History

Each source asset should record:

- Revision ID.
- Author or agent.
- Timestamp.
- Changed fields.
- Validation result.
- Approval note.
- Dependency impact.
- Before/after preview where available.

# 30. Live Preview, Test Laboratory and Fit Testing

## 30.1 Preview Environments

- Neutral studio.
- Forest daylight.
- Night village.
- Interior room.
- Cave.
- Rain and snow.
- Combat arena.
- Workstation scene.
- Multiplayer lineup.
- Blueprint building interior.

## 30.2 Preview Controls

- Change pose and animation.
- Change expression.
- Equip test clothing and gear.
- Toggle first/third person.
- Show collision and sockets.
- Show body and clothing masks.
- Show rig roles.
- Change lighting and background.
- Change LOD distance.
- Compare variants side by side.

## 30.3 Required Test Scenarios

| Scenario | Checks |
| --- | --- |
| Basic Movement | Idle, walk, run, turn, crouch, jump and landing fit. |
| Equipment | One-hand, two-hand, shield, bow/focus, backpack and armour. |
| NPC Work | Hammer, carry, mine, farm, build and sit posture. |
| Interior | Doorway, stairs, bed, chair and workstation clearance. |
| Dialogue | Eye line, expressions, portrait framing and headwear. |
| First Person | Arms, item framing, camera clipping and body hiding. |
| Population | Ten or more NPCs for diversity and performance. |

## 30.4 Validation Scenario Command

A single Run Humanoid Validation Scenario command should execute the approved test matrix and return:

- Pass/fail summary.
- Screenshots of failures.
- Clipping report.
- Missing component report.
- Performance estimate.
- Portrait status.
- Dependency changes.

# 31. Icon, Portrait and Save-Thumbnail Capture

## 31.1 Capture Outputs

| Output | Default View | Use |
| --- | --- | --- |
| Full-Body Character Icon | Three-quarter standing pose. | Character list, codex, party UI. |
| Head-and-Shoulders Portrait | Slight three-quarter face view. | Dialogue, NPC list, relationships. |
| Identity Portrait | Neutral consistent framing. | Save records, village roster. |
| Save Thumbnail | Character in selected scene or studio. | Player saves and profiles. |
| Equipment Preview | Full body with selected loadout. | Creator and inventory preview. |

## 31.2 Capture Profile Fields

- Camera type.
- Position and orbit.
- Focal target.
- Crop bounds.
- Pose.
- Expression.
- Clothing/equipment policy.
- Runtime condition policy.
- Background.
- Lighting preset.
- Shadow and outline.
- Output sizes.
- Transparent background option.

## 31.3 Live-Linked and Locked Portraits

- Live-linked portraits regenerate when approved appearance changes.
- Locked portraits preserve a chosen story or player image.
- The Forge warns when a locked portrait no longer matches the current presentation.

## 31.4 Batch Capture

The Forge can batch-generate missing or outdated portraits for:

- One settlement.
- One culture.
- One profession family.
- All named NPCs.
- All player presets.

## 31.5 Portrait Reproducibility

Capture profiles, pose versions, lighting and camera settings are saved so the same portrait can be regenerated consistently.

# 32. Readability, Accessibility and Multiplayer Identification

## 32.1 Silhouette Testing

Humanoids should remain recognisable at:

- Normal gameplay distance.
- Medium LOD distance.
- Dim lighting.
- Crowded villages.
- Similar-coloured backgrounds.

## 32.2 Profession and Faction Cues

Important roles should use multiple cues rather than colour alone:

- Silhouette.
- Tool or equipment.
- Clothing shape.
- Badge or icon.
- Animation/posture.
- Nameplate information where enabled.

## 32.3 Colour Accessibility

Culture, faction, rarity or condition differences should not depend solely on red/green or subtle hue changes. Shape, pattern, lightness and icons should provide secondary cues.

## 32.4 Multiplayer Players

Multiplayer presentation may add:

- Nameplate anchors.
- Party markers.
- Team/faction overlays.
- Outline profiles.
- Local-player visibility rules.

These overlays do not alter the underlying voxel source.

## 32.5 Visual Noise Limits

The Forge should warn when overlapping hair, horns, capes, weapons, backpacks and effects obscure the head, hands or combat silhouette.

# 33. Registry Fields, Dependencies and Packaging

## 33.1 Humanoid Presentation Registry Fields

| Field | Purpose |
| --- | --- |
| presentation_id | Stable presentation definition ID. |
| display_name | Developer-facing name. |
| anatomy_profile_id | Body-plan contract. |
| body_frame_profile_id | Proportion limits and defaults. |
| body_part_set_ids | Voxel body sources. |
| head_family_id | Head and face grid. |
| face_component_ids | Eyes, brows, nose, mouth and ears. |
| hair_component_ids | Hair, beard and adornments. |
| material_palette_id | Body and feature palette. |
| species_extension_ids | Horns, tail, wings, extra arms and similar parts. |
| clothing_profile_id | Default or generated clothing rules. |
| rig_profile_id | Compatible rig family. |
| expression_set_id | Face and emotion presentation. |
| portrait_profile_id | Icon and portrait capture settings. |
| LOD_profile_id | Runtime simplification. |
| generation_profile_id | Weighted deterministic generation rules. |
| lifecycle_status | Concept, Draft, Functional, Review, Approved, Deprecated. |
| source_version | Editable source schema version. |
| dependencies | Referenced body, item, material, rig and animation assets. |

## 33.2 Individual Appearance Record

```text
entity_id
appearance_seed
source_profile_versions
resolved_body_parameters
resolved_component_ids
resolved_palette_values
persistent_marks
portrait_lock_state
override_patch_ids
```

## 33.3 Dependency Graph

The Forge dependency view should reveal impacts such as:

```text
head.humanoid.rounded.01
|-- 14 face component families
|-- 8 hair fit families
|-- 5 helmet profiles
|-- 62 generated NPC appearances
`-- 3 player presets
```

## 33.4 Packaging

A humanoid content package may contain:

- Editable voxel source.
- Body and head definitions.
- Materials and palettes.
- Hair and clothing assets.
- Equipment fit profiles.
- Expression sets.
- Portrait profiles and generated images.
- Baked meshes and LODs.
- Registry records.
- Dependency manifest.
- Validation report.
- Migration rules.
- Credits and licence metadata.

# 34. Validation, Approval and Production Lifecycle

## 34.1 Lifecycle

```text
Concept -> Draft -> Functional -> Visual Review -> Approved
                                      |             |
                                      v             v
                                Needs Revision   Deprecated
```

## 34.2 Hard Validation Errors

- Non-voxel editable source used as approved geometry.
- Missing anatomy root or required player roles.
- Invalid stable IDs.
- Broken dependency.
- Clothing references missing body regions.
- Equipment socket missing or duplicated incorrectly.
- Deterministic generation cannot reproduce an appearance.
- Portrait capture has invalid bounds or camera.
- Player-compatible asset exceeds required world envelope without declared profile.
- Required fallback head/expression missing.

## 34.3 Warnings

- Minor clipping in uncommon poses.
- Excessive voxel or material count.
- Missing distant LOD.
- Low silhouette contrast.
- Hair/headwear conflict.
- Portrait too visually busy.
- Near-duplicate NPC generation.
- Unused socket or layer.
- Locked portrait differs from current model.

## 34.4 Approval Checklist

An approved humanoid should have:

- Valid voxel source.
- Declared scale and compatibility.
- Complete required anatomy roles.
- Working body, head, face and hair assembly.
- Material and palette profile.
- Required expressions.
- Standard clothing and equipment test.
- Collision and camera preview.
- Icon and portrait outputs.
- LOD or approved deferral.
- Dependency and migration status.
- Test-laboratory pass.

# 35. Proof-of-Concept Scope and Acceptance Criteria

## 35.1 POC Asset Scope

The first production-quality humanoid Forge slice should include:

- Standard player-compatible humanoid anatomy.
- Three body frames: standard, short/stocky and tall/slender.
- Two head families: rounded and angular.
- At least six eye sets, four brow sets, four nose sets, six mouth/expression sets and four ear sets.
- At least ten hair styles and four facial-hair styles.
- Multiple authored body, hair and eye palette families.
- One long-ear extension, one horn pair, one tail and one four-arm test profile.
- Basic clothing layers: shirt/tunic, trousers, robe/apron, boots, gloves, belt and hood/hat.
- Equipment preview: sword, shield, pickaxe, hammer, staff and backpack.
- Six profession profiles: farmer, builder, blacksmith, guard, merchant and mage.
- Two coherent culture palette/garment variations.
- Deterministic generation of at least twenty visibly distinct NPCs.
- Full-body icon, dialogue portrait and save-thumbnail capture.
- Player envelope, first-person, doorway, workstation and equipment fit tests.

## 35.2 POC Acceptance Criteria

| Area | Acceptance Test |
| --- | --- |
| Voxel Source | Every approved visible component can be reopened and edited as voxel source. |
| Assembly | Body, head, face, hair, clothing and equipment resolve without broken references. |
| Variety | Twenty generated NPCs show coherent variation with no unintended exact duplicates. |
| Persistence | The same seeds and resolved records reproduce identical NPCs after reload. |
| Player Fit | Standard player bodies pass camera, doorway, movement-envelope and first-person preview. |
| Equipment | Test items attach correctly and major clothing/armour pieces do not clip in standard poses. |
| Professions | Six roles are readable without relying only on nameplates or colour. |
| Culture | Two culture presentations remain coherent while sharing underlying anatomy. |
| Expressions | Neutral, blink, talk, happy, angry, afraid, injured and sleep states work on both head families. |
| Portraits | Icons and portraits regenerate consistently from saved profiles. |
| Overrides | A developer can override one face, hair, garment and palette field and selectively revert each. |
| Performance | A preview group of at least twenty humanoids remains within the defined POC rendering budget. |
| Validation | Hard errors block approval and warnings provide useful repair guidance. |

## 35.3 Explicit POC Deferrals

- Full public player-character creator.
- Children and full ageing transitions.
- Every final playable race.
- Full cloth physics.
- Full facial motion capture or audio lip sync.
- Every armour family.
- Advanced prosthetics.
- Full multiplayer customisation synchronisation.
- Full VFX and Audio Forge authoring.

# 36. Relationships With Documents 22D-22L

| Document | Relationship to 22C |
| --- | --- |
| 22D - Creature, Mob, Monster and Boss Model Creator | Reuses voxel part, material, portrait, override and generation principles for non-humanoid bodies. |
| 22E - Skeletons, Rigging, Joints, IK and Attachment Systems | Implements humanoid rig families, additional arms, hand/foot IK, sockets and retargeting contracts. |
| 22F - Entity Animation, Locomotion, Combat and Visual States | Defines humanoid locomotion, work, combat, expression, dialogue and condition animation sets. |
| 22G - Character Customisation, Equipment, Variants and Visual Inheritance | Expands inheritance, runtime equipment, generated variants, cultural overlays and condition stacks across all entities. |
| 22H - Entity Gameplay Integration, Hitboxes, AI Markers and Simulation LOD | Connects humanoid models to combat regions, navigation, interaction, multiplayer and simulation LOD. |
| 22I - Blueprint Forge | Uses humanoid size, job markers, beds, doors, workstations and path-clearance requirements when validating buildings. |
| 22J - Unified Forge UI/UX and Creator Workflow | Defines the exact humanoid editor panels, controls, batch workflows and player-facing subset. |
| 22K - Forge Entity and Blueprint Technical Implementation Plan | Implements Resources, baking, generation, portrait rendering, caching, hot reload and migrations in Godot/Summer Engine. |
| 22L - Entity and Blueprint Visual Production and Migration Plan | Schedules player, NPC, culture, profession, enemy and portrait production using this creator. |

# Appendix A. Humanoid Component and Role Matrix

| Component | Required for Player | Required for Standard NPC | Optional/Extension | Main Dependencies |
| --- | --- | --- | --- | --- |
| Pelvis/root | Yes | Yes | No | Rig, collision, clothing. |
| Torso/spine | Yes | Yes | No | Armour, animation, portrait. |
| Head | Yes | Yes | No | Face, hair, camera. |
| Jaw/mouth | Fallback required | Fallback required | Detailed variants optional | Expressions, dialogue. |
| Left/right arms | Yes | Yes | No | Equipment, work, combat. |
| Left/right legs | Yes | Yes | No | Locomotion, footwear. |
| Hands | Yes | Yes | Detail level varies | Items, IK. |
| Feet | Yes | Yes | Type varies | Grounding, boots. |
| Eyes/look markers | Yes | Yes | Additional eyes optional | Gaze, portrait. |
| Hair | Optional | Optional | Yes | Headwear, culture. |
| Facial hair | Optional | Optional | Yes | Head fit, culture. |
| Horns/antlers | Optional | Optional | Species extension | Headwear, damage. |
| Tail | Optional | Optional | Species extension | Clothing, animation. |
| Wings | Optional | Optional | Species extension | Flight, back gear. |
| Extra arms | Custom profile | Custom profile | Species/boss extension | Rig, clothing, items. |

# Appendix B. Equipment Regions and Socket Register

| Role ID | Purpose | Default Parent |
| --- | --- | --- |
| socket.hand.main | Main-hand held item. | hand.right for default handedness. |
| socket.hand.off | Off-hand item or shield. | hand.left. |
| socket.back.weapon | Stowed long weapon. | spine.upper/back. |
| socket.back.shield | Stowed shield. | spine.upper/back. |
| socket.back.pack | Backpack or carried container. | spine.upper/back. |
| socket.hip.left | Belt item or weapon. | pelvis.left. |
| socket.hip.right | Belt item or weapon. | pelvis.right. |
| socket.chest.tool | Small visible tool. | torso.front. |
| socket.head.wear | Hat, helmet, crown or hood. | head. |
| socket.neck | Necklace, collar or amulet. | neck/chest. |
| socket.ear.left/right | Ear adornment. | ear components. |
| socket.horn.left/right | Horn adornment or cap. | horn root. |
| socket.tail.base | Tail armour or adornment. | pelvis rear. |
| socket.wing.left/right | Wing equipment where supported. | wing root. |
| socket.portrait.focus | Portrait camera focus. | head or upper torso. |
| socket.nameplate | Nameplate anchor. | head top. |

# Appendix C. Example NPC Visual Profiles

## C.1 Forest Hamlet Farmer

```text
species: standard human-like
body frame: standard or broad-light
culture: forest_human
profession: farmer
clothing: linen tunic + work trousers + boots + belt pouch
palette: earth greens, browns and undyed fibre
props: sickle or basket when task requires
condition: light dirt, weather exposure
portrait: friendly neutral
```

## C.2 Forest Hamlet Blacksmith

```text
species: standard human-like
body frame: broad or standard
culture: forest_human
profession: blacksmith
clothing: work shirt + leather apron + gloves + heavy boots
props: actual hammer/tongs when equipped or working
condition: soot and heat wear
identity: persistent face, hair and optional scar
```

## C.3 Village Guard

```text
species: culture-supported humanoid
body frame: any compatible approved frame
profession: guard
clothing: padded underlayer + culture armour + boots
items: actual spear/sword, shield and helmet
faction cues: settlement badge + silhouette + palette
condition: patrol, alert or injured state
```

## C.4 Village Mage

```text
species: culture-supported humanoid
profession: mage
clothing: layered robe + belt components + culture mantle
items: focus, spellbook or staff according to inventory
materials: limited emissive rune accents
portrait: clear eyes and head silhouette
```

## C.5 Travelling Merchant

```text
body frame: varied
culture: origin culture plus travel substitutions
clothing: coat, layered bags, scarf, durable boots
items: backpack, ledger, carried goods according to state
condition: road dust or rain layer
```

## C.6 Goblin Raider

```text
species: goblin humanoid profile
body frame: short, lean or broad variants
faction: raider clan
clothing: scavenged layers with clan palette and shape language
items: actual weapon and loot container
identity: individual face, ears, markings and damage
```

# Appendix D. Character Generation Parameter Register

| Parameter | Type | Example Rule |
| --- | --- | --- |
| appearance_seed | Integer | Stable per persistent entity. |
| body_frame | Weighted ID | Restricted by species and compatibility. |
| height | Bounded scalar | Species range, equipment-safe range. |
| build | Bounded scalar/profile | Visual only. |
| head_family | Weighted ID | Must support required expressions. |
| eye_set | Weighted ID | Compatible with head family. |
| hair_style | Weighted ID | Filtered by culture, headwear and age profile. |
| hair_colour | Palette value | Authored species/culture range. |
| body_palette | Palette profile | Authored species range. |
| markings | Optional weighted IDs | Species/culture/faction rules. |
| culture_outfit | Weighted loadout | Settlement and wealth filters. |
| profession_layer | Weighted profile | Job-readable but varied. |
| personal_mark | Rare weighted ID | Scar, tattoo, adornment. |
| portrait_pose | Profile ID | Stable standard unless overridden. |

# Appendix E. Humanoid Validation Checklist

- [ ] Every visible component originates from approved voxel source.
- [ ] Stable presentation and component IDs are valid.
- [ ] Anatomy, body-frame and rig profiles agree.
- [ ] World scale and camera height are declared.
- [ ] Player-compatible bodies fit required clearance envelopes.
- [ ] Body-part connection seams remain closed in standard poses.
- [ ] Head family supports required face components and expressions.
- [ ] Hair correctly resolves with standard headwear tests.
- [ ] Species extensions declare equipment and clipping rules.
- [ ] Clothing layers have coverage, occlusion and fit profiles.
- [ ] Equipment sockets are present, oriented and unique.
- [ ] Test items align in main-hand, off-hand, back and hip positions.
- [ ] Standard animations show no approval-blocking clipping.
- [ ] First-person preview is valid for player-compatible profiles.
- [ ] Icons and portraits are framed and reproducible.
- [ ] Deterministic NPC generation reproduces resolved appearances.
- [ ] Duplicate detection has been reviewed for population profiles.
- [ ] LOD and bake profiles exist or have an approved deferral.
- [ ] Dependencies and migration impact are known.
- [ ] Test Laboratory scenarios pass.

# Appendix F. Proof-of-Concept Asset Checklist

- [ ] Standard humanoid body template.
- [ ] Short/stocky body frame.
- [ ] Tall/slender body frame.
- [ ] Rounded head family.
- [ ] Angular head family.
- [ ] Eye, brow, nose, mouth and ear component sets.
- [ ] Ten hair styles.
- [ ] Four facial-hair styles.
- [ ] Body, hair and eye palettes.
- [ ] Long-ear extension.
- [ ] Horn pair.
- [ ] Tail extension.
- [ ] Four-arm compatibility test.
- [ ] Basic clothing layer set.
- [ ] Culture outfit profile A.
- [ ] Culture outfit profile B.
- [ ] Farmer profile.
- [ ] Builder profile.
- [ ] Blacksmith profile.
- [ ] Guard profile.
- [ ] Merchant profile.
- [ ] Mage profile.
- [ ] Sword fit test.
- [ ] Shield fit test.
- [ ] Pickaxe and hammer fit test.
- [ ] Staff fit test.
- [ ] Backpack fit test.
- [ ] Twenty-character deterministic population test.
- [ ] Full-body icon profile.
- [ ] Dialogue portrait profile.
- [ ] Save-thumbnail profile.
- [ ] First-person player preview.
- [ ] Validation and approval report.

# Appendix G. Glossary

| Term | Meaning |
| --- | --- |
| Appearance Record | Persistent component choices and parameters used to reproduce one entity's visuals. |
| Body Frame | Authored proportion profile and safe control ranges for a humanoid. |
| Compatibility Envelope | Allowed scale and shape range for rigs, clothing, equipment and world clearance. |
| Culture Profile | Clothing, palette, grooming and adornment preferences linked to a culture. |
| Expression Set | Compatible eye, brow, mouth, jaw and pose states for a head family. |
| Fit Profile | Rules adapting clothing or equipment to a compatible body frame. |
| Head Family | Voxel head source plus face, hair, headwear and expression contract. |
| Humanoid Presentation | Resolved visual assembly for a player, NPC or humanoid enemy. |
| Occlusion Mask | Rule hiding body or clothing areas covered by another layer. |
| Player-Compatible | Conforms to approved camera, movement, equipment and world-clearance contracts. |
| Portrait Profile | Reproducible camera, pose, expression, lighting and crop settings. |
| Profession Profile | Visual garment, tool and wear preferences associated with an NPC job. |
| Resolved Appearance | Final selected component IDs and values after generation and overrides. |
| Species Profile | Anatomy, proportion, material and feature rules for a humanoid people/species. |
| Visual-Only Control | Appearance parameter with no automatic gameplay-stat effect. |
| Voxel Source of Truth | Editable voxel data from which runtime character products are baked. |
