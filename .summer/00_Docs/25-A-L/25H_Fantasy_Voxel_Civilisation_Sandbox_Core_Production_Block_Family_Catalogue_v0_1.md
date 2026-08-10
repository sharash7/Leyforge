---

title: "25H - Core Production Block Family Catalogue"

document_id: "25H"

version: "0.1"

status: "Core Production Block Family Draft"

project: "Leyforge - Fantasy Voxel Civilisation Sandbox"

document_set: "25 - Post-Atlas Production Governance, Registries, Classification and Integration"

owner: "Ash"

depends_on:

  - "[[25B - Canonical Registry Kernel]]"

  - "[[25C - Domain Schemas and Completeness Contracts]]"

  - "[[25F - Core Production Atlas Classification and Scope Lock]]"

  - "[[25G - Core Production Package Dependency and Progression Matrix]]"

next_document: "[[25I - Core Production Item Family Catalogue]]"

tags: [leyforge, blocks, registry, voxel, production, atlas, godot, summer-engine]

---

# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25H - Core Production Block Family Catalogue

Version 0.1 - Core Production Physical-World Family and Registry-Handoff Draft

A governed catalogue of the physical block families required by the approved Core Production packages, establishing family identity, shape/state policy, world role, executable boundaries, culture and realm adaptation, optional-expansion compatibility and the exact handoff required before replacing Document 03.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking


---


# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Initial draft | Creates 217 proposed block-family contracts across terrain, geology, vegetation, fluids, resources, construction, functional blocks, automation, magic, infrastructure, adventure and realm content; defines shape/state rules, package coverage, Set 26 compatibility and the replacement requirements for Document 03 v1.0. |

# Document Purpose

Document 25H converts the physical block obligations established by Documents 25F and 25G into a bounded Core Production family catalogue. It identifies which material, terrain, vegetation, resource, construction, functional, machine, magic, infrastructure, adventure and realm families must exist before the selected Atlas packages can become executable. It prevents the replacement Blocks Registry from becoming either a renamed POC list or an uncontrolled catalogue of every possible material/shape combination.

This document works at **family-contract level**. It proposes stable family identities, required roles, eligible forms, mandatory states, item/drop expectations and owning packages. It does not create every final concrete block entry, numeric hardness value, exact texture, recipe, drop quantity, machine throughput, Godot class or Set 26 maritime behaviour. Those remain owned by Document 03 v1.0, 25I-25K, Documents 05-06/08-12/18 and Document Set 26.

By proceeding from 25G to 25H, Ash has accepted the 25G package graph as the current working dependency authority. The family identities and catalogue boundaries in this draft become working locks only when this document is approved. Unsupported detail remains explicitly deferred rather than silently invented.

# Design Sources and Supersession Rules

| Source | Authority Used by 25H |
| --- | --- |
| Documents 25A-25E | Governance, qualified IDs, field ownership, schemas, relationships, packs, migration, validation and release gates. |
| Document 25F | Approved Core world, biome, culture, settlement, realm, ecology, site, boss, structure and route scope. |
| Document 25G | Package dependencies, capability bands, physical input/output classes, realm/material obligations, blockers and handoffs. |
| Atlas 24A-24D | Procedural world context, selected surface/special environments, coast/water boundary and Verdant/Ancestral realm contracts. |
| Atlas 24E and 24I | Culture architecture, settlement adaptation, structures, routes and infrastructure context. |
| Atlas 24J | Resource/material ecology, six Verdant resource classes, provenance, extraction and contextual-use direction. |
| Document 03 v0.1 | Retains block/item separation, parent families, shapes, block states, mining/drops, construction, functional blocks, automation, magic and spreadsheet-ready intent. POC lists and short IDs are legacy inputs. |
| Documents 05-12 and settlement/Forge sets | Recipe, progression, NPC, automation, magic, ecology, worldgen, structure, blueprint, asset and presentation requirements. |
| Document Set 26 direction | Owns detailed fluids, waves, tides, currents, vessels, ports, naval combat and maritime block extensions. 25H provides only base compatibility and admission hooks. |

> **Supersession Rule**
>
> Document 25H does not replace Document 03 by itself. It supersedes the POC block-selection logic and becomes the approved family intake for Document 03 v1.0. The original registry remains a legacy design source until the replacement registry is accepted, after which its POC scope and short-ID entries move to archive/migration status.

# Static Table of Contents

- 1. Locked Block-Family Catalogue Identity
- 2. Decision Boundary and Approval Status
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Block-Family Terminology
- 5. Catalogue Architecture and Qualified-ID Rules
- 6. Family Inheritance, Composition and Variant Policy
- 7. Shape, Placement and Structural-Role Policy
- 8. State, Overlay and Transformation Policy
- 9. Block, Item, Resource, Structure and Blueprint Boundaries
- 10. Catalogue Summary and Status Envelope
- 11. Universal Block-Family Contract
- 12. Technical and Recovery Families
- 13. Terrain, Soil and Organic-Substrate Families
- 14. Geology, Aggregates and Deep-Layer Families
- 15. Vegetation and Agriculture Families
- 16. Base Fluids and Environmental-Surface Families
- 17. Resource Deposit and Node Families
- 18. Construction Material Families
- 19. Culture Adaptation and Presentation Kits
- 20. Functional, Crafting, Storage and Project Families
- 21. Automation, Logistics and Power Families
- 22. Practical Magic and Realm-Infrastructure Families
- 23. Settlement, Route and Infrastructure Families
- 24. Adventure, Defence and Hazard Families
- 25. Verdant Covenant Complete Block Package
- 26. Ancestral Veil Threshold Block Package
- 27. Dynamic-State and World-Aftermath Coverage
- 28. Document Set 26 Compatibility and Admission Boundary
- 29. Core Package Coverage Matrix
- 30. Item, Resource, Recipe and Drop Handoff
- 31. Forge, Material, Audio/VFX and Presentation Handoff
- 32. Validation, Seed QA and Acceptance Evidence
- 33. Production Sequence and Document 03 Replacement Gate
- 34. Decisions Locked by 25H
- 35. Handoff to 25I-25L and Main Documents
- 36. Risks, Redesign Triggers and Open Decisions
- Appendix A. Master Block-Family Register
- Appendix B. Shape Eligibility Profiles
- Appendix C. State and Overlay Register
- Appendix D. Culture Kit Matrix
- Appendix E. Package-to-Family Coverage
- Appendix F. Document 03 v1.0 Replacement Checklist
- Appendix G. Document 25H Acceptance Criteria

# 1. Locked Block-Family Catalogue Identity

> **Locked Rule**
>
> A block family enters Core Production only when it has a clear world role, package owner, physical interaction, permitted forms, state policy, item/drop boundary, fallback role, presentation obligation and validation path. A family does not exist merely because a biome, culture or material could support another decorative variant.

| Identity Layer | 25H Meaning | Player-Facing Result |
| --- | --- | --- |
| Physical world contract | Families define what terrain, structures, machines, magic and aftermath can physically exist. | The selected world packages are tangible rather than prose-only. |
| Family before entry explosion | Shared behaviour and material rules are locked before concrete shape/state entries multiply. | The catalogue remains readable and maintainable. |
| Context without duplication | Atlas context, gameplay behaviour, assets and runtime state remain separately owned facets. | A block can vary by biome/culture/state without competing truths. |
| Capability support | Families provide survival, building, automation, civilisation, magic, adventure and realm capabilities. | Seed variation does not remove essential physical paths. |
| Save-safe identity | Approved family and entry IDs remain stable through variants, packs, migration and state changes. | World edits and constructions survive updates. |

# 2. Decision Boundary and Approval Status

| Statement Type | Status in 25H |
| --- | --- |
| 25A-25G governance, package graph and Core roster | Locked working authority. |
| Family identities and family boundaries in this document | Proposed working locks; approved when Ash accepts 25H. |
| Exact concrete block IDs generated beneath each family | Deferred to Document 03 v1.0 and registry authoring. |
| Numeric hardness, blast/fire values, tool tiers, drops, stack sizes and balance | Deferred to Documents 03, 06 and testing. |
| Exact items and recipes | Deferred to 25I-25J and Documents 04-06. |
| Godot Resources, voxel storage and runtime classes | Deferred to rewritten Document 18. |
| Detailed maritime blocks and behaviours | Owned by Set 26; only base compatibility is specified here. |

# 3. Scope, Non-Goals and Handoff Boundaries

## 3.1 In scope

- qualified family identities and catalogue categories;
- Core-required, Core-conditional, teaser-only and extension-boundary status;
- world role, owning package, eligible shape profile and required state classes;
- block/item/resource/recipe and block/structure/blueprint boundaries;
- culture and realm variant policy without redundant executable definitions;
- base water/coast compatibility and Set 26 extension admission;
- package coverage, validator obligations and the Document 03 replacement gate.

## 3.2 Explicit non-goals

- creating every species-specific crop, flower, tree leaf, ore grade, decorative trim or colour variant;
- locking final numeric balance, crafting costs, mining speed, drops or texture counts;
- designing complete structures, dungeon layouts, NPC jobs, recipes, machines or spell effects;
- implementing full structural integrity for ordinary land construction;
- designing waves, tides, currents, open oceans, vessel-local blocks, flooding or naval damage;
- promoting unselected Atlas environments or realm families into Core.

## 3.3 Handoff boundaries

| Handoff | 25H Supplies | Receiving Owner |
| --- | --- | --- |
| Items | Placeable-item policy, raw/resource outputs and family links. | 25I and Document 04 v1.0 |
| Resources/Recipes | Deposit/transform classes, station interfaces and shape-conversion requirements. | 25J and Documents 05-06 v1.0 |
| Blocks Registry | Approved family intake, ID policy, required fields, shapes, states and package coverage. | Document 03 v1.0 |
| Worldgen | Terrain/resource/vegetation families and suitability-facing tags. | Document 11 v1.0 |
| Structures/Blueprints | Material palettes, modules, project anchors, state transitions and culture kits. | Document 12, Forge and settlement documents |
| Runtime | Block definitions, block-entity boundaries, state storage, migration and validators. | Document 18 v1.0 |
| Maritime | Base water/coast identities and extension hooks only. | Document Set 26 |

# 4. Canonical Block-Family Terminology

| Term | Canonical Meaning |
| --- | --- |
| Block Family | A stable qualified block-domain definition that owns shared physical, placement, mining, state, drop and presentation defaults for related block entries. |
| Concrete Block Entry | A selectable executable block definition beneath a family, such as a material/shape combination or behaviourally distinct natural block. |
| Material Variant | A presentation/physical profile applied through an approved family or material-set relationship; not automatically a new family. |
| Shape Variant | A concrete form generated or authored under an eligible shape profile, such as slab, stair, wall, beam, arch or panel. |
| State | Mutable instance data that does not change definition identity, such as powered, wet, damaged or owned. |
| Transformation | A validated change to another block family or entry, such as burning to charred material or cleansing corruption. |
| Overlay | A compatible surface/state layer such as moss, snow, roots or corruption; it cannot silently own the underlying material. |
| Block Entity | A persistent state record for inventories, machines, anchors, projects, routes or complex interactions. |
| Structure Module | A blueprint/grammar-owned arrangement or semantic module referencing block entries; it is not itself a block family. |
| Component Role | A semantic role attached to a block or module, such as support, port, socket, door, ward anchor or future vessel role. |

# 5. Catalogue Architecture and Qualified-ID Rules

Family IDs use the registered **block** domain and the identity path `family.<category>.<name>`. Example: `leyforge.core.block.family.terrain.stone.limestone`. Concrete entries created later remain in the block domain but omit the family marker where practical, for example `leyforge.core.block.terrain.stone.limestone.natural` or `leyforge.core.block.construction.masonry.limestone.stair`.

| Rule | Requirement |
| --- | --- |
| Namespace | Core families are owned by `leyforge.core`; optional Set 26 definitions use their approved expansion namespace or authorised extension facets. |
| Display text | Names and descriptions use localisation keys; family IDs never depend on display names. |
| Family stability | Once referenced by a compiled registry, save or compatibility fixture, the family ID is frozen. |
| Entry generation | Generated shape/state entries must record family ID, generation profile and semantic hash. |
| Aliases/tombstones | Renames, splits, merges and removals follow 25B/25D; IDs are never recycled. |
| Planning metadata | Core status, milestone and risk are catalogue metadata, not gameplay properties. |

# 6. Family Inheritance, Composition and Variant Policy

25H recommends shallow inheritance plus composition. A family may inherit from one abstract block parent and compose material, shape, sound, drop, state, port, ownership and presentation profiles. Deep chains that make final behaviour difficult to inspect are prohibited.

| Mechanism | Use | Boundary |
| --- | --- | --- |
| Abstract parent | Shared terrain, construction, functional, machine, magic or vegetation behaviour. | One clear parent chain; no circular inheritance. |
| Material profile | Hardness class, tool interaction, sound, flammability, density and base presentation. | Owned by block/material registries; cannot duplicate resource identity. |
| Shape profile | Eligible generated or authored forms. | Only approved shapes are emitted; no universal all-shapes rule. |
| State profile | Allowed mutable states and transitions. | Runtime state remains instance-owned. |
| Culture profile | Architecture, trim, colour, symbol, roof and fixture adaptation. | Does not create a new executable block unless behaviour changes. |
| Biome/realm profile | Weathering, moss, snow, season, mana, corruption or realm appearance. | Context remains Atlas/worldgen-owned. |
| Expansion facet | Optional fields or component roles admitted by a content pack. | Base block must remain valid when optional facet is absent. |

# 7. Shape, Placement and Structural-Role Policy

The default world grid remains approximately one cubic metre. Smaller furniture, panels, rails, plants, sockets and structure modules may occupy partial cells or approved sub-cell placement. Ordinary land construction preserves the readable floating-block model from Document 03 unless a specific block uses gravity or a system-owned support rule.

> **Structural Boundary**
>
> 25H does not introduce global structural collapse. Blocks may expose semantic support, load, buoyancy or hull-role interfaces for blueprints and Set 26, but ordinary land buildings do not become vessel-style physics objects merely because those fields exist.

| Policy | Locked Direction |
| --- | --- |
| Full voxels | Primary terrain, geology, deposits and many construction blocks. |
| Partial shapes | Generated only through approved shape profiles and collision rules. |
| Gravity | Limited to loose families such as sand, gravel, shingle and selected rubble. |
| Rotation | Functional, route, machine, panel and directional blocks declare supported rotations. |
| Connections | Fences, walls, rails, conduits, pipes, roots and routes use explicit connection profiles. |
| Multiblocks | Stations, storage and structures may use anchors/modules; the authoritative identity remains clear. |
| NPC placement | NPCs use the same block definitions, permissions and transactions as players, with project/LOD rules. |

# 8. State, Overlay and Transformation Policy

A state is preferred when the material and gameplay identity remain the same. A separate block entry or transformation is required when collision, drops, capability, ownership, simulation class or save compatibility changes materially. Visual variation alone is not enough.

| Use State/Overlay When | Create Separate Entry/Transformation When |
| --- | --- |
| The block is wet, frosted, mossy, powered, facing, opened or lightly damaged. | The block becomes rubble, ash, a different material, a different fluid or a different interactive object. |
| Season or biome changes presentation while preserving function. | Season changes capability, collision, drops or route behaviour beyond the declared state profile. |
| Ownership, project reservation or occupation changes at runtime. | A definition itself has different permissions or service behaviour. |
| Corruption/blight is reversible and uses a typed spread/cleansing profile. | The result becomes a permanent new material/ecology family after transformation. |

# 9. Block, Item, Resource, Structure and Blueprint Boundaries

| Layer | Owns | Must Reference |
| --- | --- | --- |
| Block family/entry | Placed physical behaviour, collision, placement, mining, block states, ports and block-entity schema. | Material/resource, item form, drops, shape/state profiles, assets and owning packages. |
| Item | Inventory stack, carried use, durability/quality/charge and block-item form. | Placed block ID where applicable. |
| Resource/material | World provenance, grade, purity, extraction consequences and progression role. | Deposit block and raw/refined item identities. |
| Recipe/project | Inputs, outputs, substitutions, time, labour, power, permissions and by-products. | Block/item/resource/station/project IDs. |
| Structure/blueprint | Spatial arrangement, modules, sockets, culture palette, ownership, stages and state transitions. | Approved block families/entries and project anchors. |
| Atlas | World context, ecology, culture, distribution, history, suitability and relationships. | Executable definitions without duplicating their mechanics. |

# 10. Catalogue Summary and Status Envelope

| Catalogue Category | Family Count | Statuses | Primary Package Coverage |
| --- | --- | --- | --- |
| Technical and Recovery | 5 | Core Conditional, Core Required | 25D-25E / Runtime; Blueprint / UI / Forge; Runtime / Voxel Kernel; Structure / Realm / Runtime; World Profile / Runtime |
| Terrain, Soil and Organic Substrate | 16 | Core Conditional, Core Required | Highland/Karst/Rift; Moorland/Boreal Frontier; Temperate Heartland; Temperate Heartland / Ancient States; Underground/Deepstone; Verdant Covenant; Wet |
| Geology, Aggregates and Deep Layers | 15 | Core Conditional, Core Required | Adventure / Underground; All Overworld Packages; Ancient States / Underground / Verdant; Coastal Edge / Set 26 Compatibility; Highland/Karst/Rift; Hig |
| Vegetation and Agriculture | 20 | Core Conditional, Core Required | Forest / Underground / Adventure; Herd/Domestic / Agriculture; Moorland/Boreal Frontier; Provisions/Health/Agriculture; Surface Biomes; Surface Biomes |
| Base Fluids and Environmental Surfaces | 10 | Core Conditional, Core Required | Boreal / Highland; Boreal / Highland / Underground Water; Coastal Edge / Set 26; Highland/Karst/Rift; Underground/Deepstone; Wetland/Flood Basin; Worl |
| Resource Deposit and Node Families | 15 | Core Conditional, Core Required | CAP-03 / Automation; CAP-04 / Industry; Clayworks / Construction; Extraction/Refinement/Automation; Highland/Karst/Rift; Practical Magic / CAP-05; Und |
| Construction Material Families | 19 | Core Conditional, Core Required | Brassroot / Industry; Civic / Defence / Culture Kits; Civic / Industry; Clayworks / Settlement; Construction / Adventure; Construction / Culture Kits; |
| Functional, Crafting and Storage | 26 | Core Required | Agriculture / Restoration; Agriculture / Routes; Automation / Trade; Civilisation / Automation; Civilisation / UI; Clayworks; Crafting / Settlement; E |
| Automation, Logistics and Power | 20 | Core Conditional, Core Required | Automation; Automation / Defence; Automation / Highland; Automation / Player Trust; Automation / Routes; Automation / Set 26 Compatibility; Automation |
| Practical Magic and Realm Infrastructure | 20 | Core Conditional, Core Required | Leyline States / Magic; Magic / Aftermath; Practical Magic; Practical Magic / Automation; Practical Magic / Safety; Practical Magic / Settlement; Prac |
| Settlement, Route and Infrastructure | 25 | Core Conditional, Core Required | Agriculture / Herd Ecology; Agriculture / Verdant; Agriculture / Wetland; Ancient Roadland / Narrative; Defence / Events; Defence / Routes; Highland / |
| Adventure, Defence and Hazard | 23 | Core Required | Adventure; Adventure / Automation; Adventure / Civilisation; Adventure / Combat; Adventure / Defence; Adventure / Environment; Adventure / Loot; Adven |
| Ancestral Veil Teaser | 3 | Teaser Only | Ancestral Veil Threshold |

The catalogue contains **217 family contracts**: **Core Conditional: 26**, **Core Required: 188**, **Teaser Only: 3**. These are family-level planning records, not a promise of an equal number of player inventory blocks. One family may generate several concrete entries while another remains a single non-item technical identity.

# 11. Universal Block-Family Contract

| Field Group | Required Fields / Evidence |
| --- | --- |
| Identity | family_id, schema_id/version, display/localisation keys, owner, source pack and production status. |
| Classification | category, parent, material profile, tags, capabilities, family purpose and package owners. |
| Placement | grid/sub-cell policy, collision, support/gravity, rotation, connection and replacement rules. |
| Shapes | shape profile, generated/authored forms, collision generation and item-form policy. |
| Interaction | tool/harvest class, hardness class, damage, repair, ownership, permissions and NPC use. |
| State | allowed state fields, transition definitions, block-entity schema, save/LOD/authority owner. |
| Physical flow | drop profile, resource provenance, item form, transformations, by-products and recipe links. |
| Worldgen | natural-generation eligibility, biome/realm suitability references, exclusions and clue roles. |
| Presentation | material/texture set, model family, sound profile, particles/VFX hooks, accessibility cue and LOD class. |
| Validation | schema/reference checks, generation tests, drop conservation, migration fixture, performance class and package acceptance evidence. |

# 12. Technical and Recovery Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.technical.air<br>**Air / Empty Cell** | Non-solid empty voxel identity used by terrain editing and save migration; never an inventory item. | No item form; transparent; non-colliding; replaceable. | Core Required<br>Runtime / Voxel Kernel |
| leyforge.core.block.family.technical.world_boundary<br>**Finite-World Boundary** | Optional protected boundary for finite presets and rescue spaces; never selected as ordinary terrain. | Invisible or accessibility-visible presentation; non-item; immutable. | Core Conditional<br>World Profile / Runtime |
| leyforge.core.block.family.technical.missing_definition<br>**Missing-Definition Recovery Block** | Visible quarantine representation when an optional or removed block definition cannot load safely. | Non-craftable; admin/recovery interaction; retains original qualified ID and state payload. | Core Required<br>25D-25E / Runtime |
| leyforge.core.block.family.technical.blueprint_ghost<br>**Blueprint Ghost Cell** | Non-persistent placement preview and construction planning cell. | Transparent preview; no save identity as a placed world block; permission-aware. | Core Required<br>Blueprint / UI / Forge |
| leyforge.core.block.family.technical.protected_anchor<br>**Protected System Anchor** | Generic protected anchor for portals, structures, projects or world services where the visible shell is separate. | Block-entity capable; hidden or inspectable; cannot become a universal gameplay shortcut. | Core Conditional<br>Structure / Realm / Runtime |

# 13. Terrain, Soil and Organic-Substrate Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.terrain.turf.meadow<br>**Meadow Turf** | Fertile, buildable temperate surface for meadow starts, farming and settlement suitability. | Full block; soil side profile; grassy top; farmable state. | Core Required<br>Temperate Heartland |
| leyforge.core.block.family.terrain.turf.pasture<br>**Pasture Turf** | Grazing-oriented hill turf supporting fences, farmsteads and wind infrastructure. | Full block; trampled and grazed states. | Core Required<br>Temperate Heartland |
| leyforge.core.block.family.terrain.turf.prairie<br>**Prairie Sod** | Tall-grass floodplain surface with rich sediment and herd routes. | Full block; wet/flooded and harvested states. | Core Required<br>Temperate Heartland |
| leyforge.core.block.family.terrain.turf.heather_moor<br>**Heather-Moor Turf** | Acidic upland surface supporting heather, peat, pastoral settlements and barrows. | Full block; heather overlay; wet/frost states. | Core Required<br>Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.soil.forest_loam<br>**Forest Loam** | Mixed broadleaf forest floor supporting roots, forage and forestry. | Full block; leaf-litter and disturbed states. | Core Required<br>Temperate Heartland |
| leyforge.core.block.family.terrain.soil.ancient_root<br>**Ancient Rootsoil** | Old-growth soil with large-root support, spirit herbs and root-dungeon suitability. | Full block; rootbound, sacred and disturbed states. | Core Required<br>Temperate Heartland / Ancient States |
| leyforge.core.block.family.terrain.soil.pine_duff<br>**Pine Duff** | Needle-rich cool forest floor associated with resinous pinewoods and fire risk. | Full block; needle-litter, dry and scorched states. | Core Required<br>Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.soil.spruce_duff<br>**Spruce Duff** | Cold needleleaf forest floor supporting snow, moss and boreal ecology. | Full block; snow-covered and frozen states. | Core Required<br>Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.turf.cold_meadow<br>**Cold-Meadow Turf** | Short-summer valley turf with meltwater and seasonal grazing. | Full block; summer-bloom, frosted and snow-covered states. | Core Required<br>Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.wetland.marsh_mud<br>**Marsh Mud** | Saturated ground for reeds, amphibians, tracks, stilt settlements and disease pressure. | Full block; soft collision profile; wet/dry and disturbed states. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.peat<br>**Peat** | Acidic organic terrain and harvestable fuel source in bogs and moors. | Full block; cut, dry, saturated and burning states. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.flood_silt<br>**Flood Silt** | Fertile deposited sediment used by floodplain farming, levees and repair events. | Full block; saturated, cracked-dry and cultivated states. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.quaking_mat<br>**Quaking-Mire Mat** | Floating organic surface that creates sink risk and hidden pools. | Thin/full variants; unstable support; torn and submerged states. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.terrain.turf.alpine<br>**Alpine Turf** | Thin highland turf supporting rare herbs, summer camps and snowmelt. | Full block; wind-scoured, frosted and summer-bloom states. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.terrain.cave.fungal_substrate<br>**Fungal Substrate** | Damp cave floor for fungal ecology, medicine and underground food chains. | Full block; colonised, harvested and blighted states. | Core Required<br>Underground/Deepstone |
| leyforge.core.block.family.terrain.realm.verdant_living_soil<br>**Verdant Living Soil** | Responsive realm substrate supporting living structures, seasonal growth and memory effects. | Full block; seasonal, negotiated-harvest, blighted and restored states. | Core Conditional<br>Verdant Covenant |

# 14. Geology, Aggregates and Deep-Layer Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.terrain.stone.common<br>**Common Stone** | Baseline mineable stone for shelter, tools, masonry and cave generation. | Full block; natural, rough, cracked and rubble outputs. | Core Required<br>All Overworld Packages |
| leyforge.core.block.family.terrain.stone.upland_hardstone<br>**Upland Hardstone** | Durable exposed rock for highlands, quarries, forts and prospecting. | Full block; weathered and fractured states. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.limestone<br>**Limestone** | Karst, cave and spring-forming stone with masonry, lime and cave-town uses. | Full block; natural, water-worn and fossil-bearing variants. | Core Required<br>Highland/Karst/Rift / Underground |
| leyforge.core.block.family.terrain.stone.deepstone<br>**Deepstone** | Dense high-risk deep-layer stone supporting underground halls and late Core extraction. | Full block; pressure-fractured and reinforced states. | Core Required<br>Underground/Deepstone |
| leyforge.core.block.family.terrain.stone.riftstone<br>**Riftstone** | Geothermal and fault-zone rock carrying heat, mineral and instability context. | Full block; hot, cooled, cracked and vent-bearing variants. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.travertine<br>**Travertine** | Mineral-deposited geothermal stone used in terraces, baths, shrines and alchemy sites. | Full block; layered, wet and polished variants. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.crystal_matrix<br>**Crystal Matrix** | Resonant cavern host rock for mana clues, crystal ecology and risky extraction. | Full block; inert, resonant, depleted and unstable states. | Core Required<br>Underground/Deepstone / Practical Magic |
| leyforge.core.block.family.terrain.stone.machine_strata<br>**Machine-Strata Composite** | Ancient engineered layer combining stone, metal and dormant mechanisms. | Full block; sealed, powered, damaged and salvaged states. | Core Required<br>Underground/Deepstone / Adventure |
| leyforge.core.block.family.terrain.aggregate.river_gravel<br>**River Gravel** | Water-rounded aggregate for riverbeds, roads, filtration and prospecting clues. | Gravity block; wet/dry; poor/normal/rich clue variants where supported. | Core Required<br>Temperate / Wetland / Underground Water |
| leyforge.core.block.family.terrain.aggregate.shingle<br>**Shingle** | Coastal and river-edge loose stone supporting shore readability and salvage context. | Gravity block; wave-wet hook; compacted route variant. | Core Conditional<br>Coastal Edge / Set 26 Compatibility |
| leyforge.core.block.family.terrain.aggregate.sand<br>**Sand** | Glass, mortar and river/coast substrate with loose-block gravity behaviour. | Gravity block; wet, compacted and glassed states. | Core Required<br>Temperate / Wetland / Coastal Edge |
| leyforge.core.block.family.terrain.earth.clay<br>**Clay Earth** | Ceramic and brick resource appearing at rivers, wetlands and clayworks. | Full block; wet, dug and fired transformation outputs. | Core Required<br>Temperate / Wetland / Economy |
| leyforge.core.block.family.terrain.mineral.sulfur_crust<br>**Sulfur and Mineral Crust** | Geothermal surface clue and alchemical mineral layer near vents and springs. | Thin/full variants; hot, brittle and depleted states. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.terrain.fossil.colossal_bone<br>**Colossal Remains** | Fossilised or mineralised remains supporting colossal-remains site grammars and rare materials. | Full/curved module variants; fractured, excavated and restored-display states. | Core Required<br>Adventure / Underground |
| leyforge.core.block.family.terrain.rootmass.worldroot<br>**Worldroot Mass** | Massive living/dead root terrain joining forests, root caves, Worldroot Galleries and Verdant foreshadowing. | Full, wall, arch and tunnel-lining variants; living, dormant, cut, blighted states. | Core Required<br>Ancient States / Underground / Verdant |

# 15. Vegetation and Agriculture Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.vegetation.grass.short<br>**Short Grass** | Common ground cover and forage cue across meadows, pasture and cold valleys. | Replaceable plant block; seasonal and grazed variants. | Core Required<br>Surface Biomes |
| leyforge.core.block.family.vegetation.grass.tall<br>**Tall Grass** | Prairie and floodplain cover supporting herds, concealment and fibre. | Replaceable two-height or modular plant; cut and flooded states. | Core Required<br>Temperate / Wetland |
| leyforge.core.block.family.vegetation.heath.heather<br>**Heather** | Moorland identity plant supporting forage, dye, bees and cultural presentation. | Replaceable low plant; flowering and frost states. | Core Required<br>Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.flower.wild<br>**Wildflower Family** | Pollinator, herb, dye and biome-colour family rather than filler decoration. | Replaceable plant variants selected by biome and season. | Core Required<br>Surface Biomes / Ecology |
| leyforge.core.block.family.vegetation.reed.marsh<br>**Marsh Reeds** | Wetland fibre, thatch, habitat and settlement resource. | Water-edge plant; harvested, regrown and burned states. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.vegetation.moss.common<br>**Common Moss** | Humidity and age indicator for forests, caves, ruins and stone. | Surface overlay/low plant; wet, dry and luminous variants by context. | Core Required<br>Forest / Underground / Adventure |
| leyforge.core.block.family.vegetation.moss.bog<br>**Bog Moss** | Wetland mat builder, medicine and quaking-mire contributor. | Surface overlay/harvestable plant; saturated and floating variants. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.vegetation.tree.mixed_broadleaf<br>**Mixed Broadleaf Tree Family** | Balanced timber, nuts, forage and settlement woodland. | Trunk, branch, leaf canopy, sapling, stump and deadwood components. | Core Required<br>Temperate Heartland |
| leyforge.core.block.family.vegetation.tree.ancient_oak<br>**Ancient Oak Family** | Massive old-growth tree supporting sacred sites, root dungeons and guardian territory. | Large trunk/branch/root/canopy modules; living, hollow, scarred and fallen states. | Core Required<br>Temperate Heartland / Ancient States |
| leyforge.core.block.family.vegetation.tree.evergreen_pine<br>**Evergreen Pine Family** | Straight timber, resin, cones and fire-aware upland forest. | Trunk, branch, needle canopy, sapling, stump and charred variants. | Core Required<br>Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.tree.boreal_spruce<br>**Boreal Spruce Family** | Cold timber, resin and snow-bearing boreal canopy. | Trunk, branch, needle canopy, sapling and snow-load variants. | Core Required<br>Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.tree.mistwood<br>**Mistwood Wet-Timber Family** | Fog-basin trees carrying moss, fungi, wet timber and spirit presentation. | Shared broadleaf body with wet bark, hanging moss and hollow variants. | Core Required<br>Temperate Heartland / Ancient States |
| leyforge.core.block.family.vegetation.shrub.berry<br>**Berry and Forage Shrub Family** | Early food, dyes, wildlife feed and seasonal clues. | Replaceable shrub; fruiting, harvested and winter states. | Core Required<br>Surface Biomes / Provisions |
| leyforge.core.block.family.vegetation.herb.medicinal<br>**Medicinal Herb Family** | Source family for health, alchemy, settlement medicine and ecology clues. | Replaceable herb variants; potency/season belongs to resource/item data. | Core Required<br>Wetland / Highland / Health |
| leyforge.core.block.family.vegetation.fungus.cave<br>**Cave Fungus Family** | Underground food, medicine, light and decomposition roles. | Small, wall, shelf and giant forms; harvested, luminous and blighted states. | Core Required<br>Underground/Deepstone |
| leyforge.core.block.family.agriculture.crop.field<br>**Field Crop Template Family** | Executable planted-crop states for Core foods and fibres without locking species here. | Planted, growing, mature, harvested, diseased and seasonal states. | Core Required<br>Provisions/Health/Agriculture |
| leyforge.core.block.family.agriculture.tree.orchard<br>**Orchard Tree Template Family** | Managed fruit/nut trees for settlements, trade and seasonal food. | Sapling, mature, flowering, fruiting, harvested and dormant states. | Core Required<br>Provisions/Health/Agriculture |
| leyforge.core.block.family.agriculture.pasture.feed<br>**Pasture Feed and Hay Family** | Managed fodder, hay storage and livestock-support vegetation. | Growing grass, cut hay, bale/stack forms. | Core Required<br>Herd/Domestic / Agriculture |
| leyforge.core.block.family.vegetation.root.living_vine<br>**Living Root and Vine Family** | Climbing, bridging, blocking and repair-capable living growth used in Verdant-linked content. | Vine, root, lattice and tendril variants; cooperative, dormant, hostile and cut states. | Core Conditional<br>Verdant Covenant / Realm Leak |
| leyforge.core.block.family.vegetation.realm.verdant_seasonal<br>**Verdant Seasonal Flora Family** | Realm-native flora whose form and function change with seasonal law. | Spring/summer/autumn/winter variant profiles; blighted/restored states. | Core Conditional<br>Verdant Covenant |

# 16. Base Fluids and Environmental-Surface Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.fluid.water.fresh<br>**Fresh Water Volume** | Base lakes, rivers, wells and safe swimming contact required even without Set 26. | Fluid cell/volume; source/flow semantics deferred to Document 18 and 26B; clean/contaminated tags. | Core Required<br>World / Survival / Set 26 Compatibility |
| leyforge.core.block.family.fluid.water.marsh_shallow<br>**Shallow Marsh Water** | Wetland water volume supporting reeds, mud, amphibians and stilt structures. | Shallow depth profile; murky/clear and contaminated states. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.fluid.water.estuary_brackish<br>**Brackish Estuary Water** | Bounded river-sea transition compatible with future tide/current extensions. | Salinity/context profile; tide hook only; no Core ocean simulation. | Core Conditional<br>Coastal Edge / Set 26 |
| leyforge.core.block.family.fluid.water.underground<br>**Underground Water** | Subterranean rivers and lakes with darkness, route and cave-ecology context. | Fresh/mineralised profiles; no unique fluid algorithm required. | Core Required<br>Underground/Deepstone |
| leyforge.core.block.family.fluid.water.geothermal<br>**Geothermal Mineral Water** | Hot spring and bath water supporting healing, alchemy and hazard context. | Temperature/mineral profile; steam interaction; safe/unsafe temperature states. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.fluid.mud.slurry<br>**Mud Slurry** | Soft wetland and flood material between solid mud and water volume. | Slow-movement hazard; drying and freezing transitions. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.environment.vent.steam<br>**Steam Vent Block Family** | Geothermal environmental emitter and power/alchemy site clue. | Vent block entity or stateful terrain socket; active, dormant and unstable states. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.environment.vent.peat_gas<br>**Peat-Gas Vent Family** | Hidden mire hazard, alchemical clue and fire-risk source. | Vent socket; detected/undetected, active and ignited states. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.terrain.snow.surface<br>**Snow Cover Family** | Seasonal/cold surface layer affecting tracks, temperature and readability. | Thin-to-deep layer; melt, compacted and drift variants. | Core Required<br>Boreal / Highland |
| leyforge.core.block.family.terrain.ice.freshwater<br>**Freshwater Ice Family** | Frozen lake/river surface and seasonal route state. | Solid surface; thin, safe, cracked and melting states. | Core Required<br>Boreal / Highland / Underground Water |

# 17. Resource Deposit and Node Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.resource.deposit.coal<br>**Coal Deposit Family** | Fuel, steel, filters, trade and industry resource source. | Vein, exposed clue and large-deposit profiles; poor/normal/rich grades. | Core Required<br>Extraction/Refinement/Automation |
| leyforge.core.block.family.resource.ore.copper<br>**Copper Ore Family** | Primary early mechanism, plate, connector and automation metal source. | Vein, clue and large-deposit profiles; poor/normal/rich grades. | Core Required<br>CAP-03 / Automation |
| leyforge.core.block.family.resource.ore.iron<br>**Iron Ore Family** | Structural, tool, defence and settlement-support metal source. | Vein, clue and large-deposit profiles; poor/normal/rich grades. | Core Required<br>CAP-04 / Industry |
| leyforge.core.block.family.resource.ore.bog_iron<br>**Bog-Iron Node Family** | Wetland/nomadic alternate iron provider and regional progression fallback. | Regenerating or bounded nodules; extraction consequences defined by 25J. | Core Required<br>Wetland / CAP-04 Fallback |
| leyforge.core.block.family.resource.deposit.clay<br>**Clay Deposit Family** | Concentrated ceramic and brick source distinct from ordinary clay terrain. | Pit/node profile; wet and exhausted states. | Core Required<br>Clayworks / Construction |
| leyforge.core.block.family.resource.deposit.peat<br>**Harvestable Peat Deposit** | Fuel and soil-improvement source with fire/ecology consequences. | Cuttable layers; wet, drying and exhausted states. | Core Required<br>Wetland / Moorland |
| leyforge.core.block.family.resource.deposit.mana_crystal<br>**Mana-Crystal Deposit Family** | Practical mana, rune, ward, machine and realm-route source. | Vein/node/cluster; purity, charged, depleted and unstable states. | Core Required<br>Practical Magic / CAP-05 |
| leyforge.core.block.family.resource.deposit.geothermal_mineral<br>**Geothermal Mineral Deposit** | Sulfur, salts, catalysts and heat-linked materials near springs and vents. | Crust/nodule profiles; hot, cooled and depleted states. | Core Required<br>Highland/Karst/Rift |
| leyforge.core.block.family.resource.deposit.resonant_crystal<br>**Resonant Crystal Deposit** | Crystal Cathedral resource and signal/resonance source separate from general mana crystal. | Cluster/node; frequency/purity belongs to resource data. | Core Required<br>Underground / Magic / Adventure |
| leyforge.core.block.family.resource.realm.living_heartwood<br>**Living Heartwood Source** | Verdant structural resource harvested through negotiated or managed methods. | Living trunk/root node; healthy, consented-harvest, wounded and restored states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.resource.realm.season_sap<br>**Season-Sap Source** | Verdant energy and catalyst source whose availability changes by season. | Tap/node and reservoir interface; seasonal and exhausted states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.resource.realm.thornsilver_fibre<br>**Thornsilver Fibre Source** | Flexible realm material for binding, bridges, conduits and equipment. | Vine/thorn harvest node; tame, hostile and depleted states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.resource.realm.pollen_amber<br>**Pollen-Amber Deposit** | Optical and inscription resource for lenses, records and magical interfaces. | Nodule/resin deposit; clear, clouded and harvested states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.resource.realm.memory_seed<br>**Memory-Seed Node** | Growth/memory resource and stateful realm-story interface. | Seed pod/planter node; dormant, remembering, sprouting and spent states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.resource.realm.bloomstone<br>**Bloomstone Deposit** | Realm compatibility and stabilisation resource for routes and imported infrastructure. | Deposit/anchor node; unstable, tuned, depleted and renewed states. | Core Conditional<br>Verdant Covenant |

# 18. Construction Material Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.construction.timber.log<br>**Structural Log Family** | Raw timber construction and decorative material preserving tree provenance. | Full log, stripped log, post, beam and pile profiles. | Core Required<br>Construction / Culture Kits |
| leyforge.core.block.family.construction.timber.plank<br>**Timber Plank Family** | Common processed building surface and component material. | Full, slab, stair, wall/panel, floor and hatch profiles. | Core Required<br>Construction / Culture Kits |
| leyforge.core.block.family.construction.timber.beam<br>**Timber Beam and Joinery Family** | Readable structural framing, bridges, roofs and machine supports. | Beam, post, brace, lintel, railing and truss modules. | Core Required<br>Construction / Routes |
| leyforge.core.block.family.construction.timber.shingle<br>**Timber Shingle Roof Family** | Weather-shedding roof system for forest and road cultures. | Roof tile, ridge, valley and edge modules. | Core Required<br>Hearthland / Marchroad |
| leyforge.core.block.family.construction.plant.thatch<br>**Thatch Family** | Low-cost roof and wall material from grass/reeds. | Roof, ridge, wall panel and bundle forms. | Core Required<br>Hearthland / Wetland |
| leyforge.core.block.family.construction.plant.woven_reed<br>**Woven-Reed Family** | Wetland wall, screen, floor and lightweight bridge material. | Panel, mat, screen, railing and roof forms. | Core Required<br>Mirelight / Wetland |
| leyforge.core.block.family.construction.masonry.rubble<br>**Rubble Masonry Family** | Low-cost stone construction, repair and ruin transition material. | Full, wall, fill and collapsed/rubble forms. | Core Required<br>Construction / Adventure |
| leyforge.core.block.family.construction.masonry.cobble<br>**Cobble Family** | Durable common stone construction and road material. | Full, slab, stair, wall, pillar and road profiles. | Core Required<br>Construction / Routes |
| leyforge.core.block.family.construction.masonry.cut_stone<br>**Cut-Stone Family** | Refined structural and civic masonry. | Full, slab, stair, wall, pillar, arch, lintel and trim profiles. | Core Required<br>Civic / Defence / Culture Kits |
| leyforge.core.block.family.construction.masonry.stone_brick<br>**Stone-Brick Family** | Repeatable settlement, fortification and dungeon masonry. | Full, slab, stair, wall, pillar, arch and cracked variants. | Core Required<br>Settlement / Adventure |
| leyforge.core.block.family.construction.masonry.limestone<br>**Limestone Masonry Family** | Karst, monastery, bath and Deepstone-compatible light masonry. | Cut, brick, slab, stair, column, arch and carved variants. | Core Required<br>Highland/Karst / Deepstone |
| leyforge.core.block.family.construction.masonry.deepstone<br>**Deepstone Masonry Family** | Heavy underground halls, reinforced tunnels and seismic works. | Full, slab, stair, pillar, arch, buttress and reinforced profiles. | Core Required<br>Deepstone Compacts |
| leyforge.core.block.family.construction.ceramic.clay_brick<br>**Clay-Brick Family** | Fired building material for settlements, chimneys, kilns and industry. | Full, slab, stair, wall and patterned variants. | Core Required<br>Clayworks / Settlement |
| leyforge.core.block.family.construction.ceramic.roof_tile<br>**Ceramic Roof-Tile Family** | Durable civic and industrial roofing. | Roof, ridge, valley, eave and decorative cap modules. | Core Required<br>Civic / Industry |
| leyforge.core.block.family.construction.glass.clear<br>**Clear Glass Family** | Windows, greenhouse surfaces, lenses and machine sight-lines. | Full pane, thin pane, framed pane and reinforced pane profiles. | Core Required<br>Construction / Industry / Magic |
| leyforge.core.block.family.construction.metal.plate_grate<br>**Metal Plate and Grate Family** | Industrial floors, machine shells, walkways and reinforced doors. | Plate, grate, panel, hatch, railing and reinforced frame profiles. | Core Required<br>Brassroot / Industry |
| leyforge.core.block.family.construction.realm.living_heartwood<br>**Living-Heartwood Construction Family** | Self-maintaining Verdant construction with negotiated growth and seasonal behaviour. | Full, wall, beam, arch, bridge, door and grown-room modules. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.construction.realm.thornsilver_lattice<br>**Thornsilver Lattice Family** | Flexible realm structural lattice, suspension, screens and conduits. | Lattice, rope, railing, bridge and binding profiles. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.construction.realm.pollen_amber<br>**Pollen-Amber Glazing Family** | Realm optical, inscription and light-transmission construction. | Pane, lens, tile, inlay and signal-window profiles. | Core Conditional<br>Verdant Covenant |

# 19. Culture Adaptation and Presentation Kits

The six Core cultures use shared executable block families wherever behaviour is equivalent. Culture kits are validated material-set, trim, symbol, fixture and module profiles. A new culture-styled block ID is justified only when the block has different physical, service, permission, magic or progression behaviour.

| Culture Kit | Required Block-Family Emphasis | Boundary |
| --- | --- | --- |
| Hearthland Commons | Timber plank/beam, stone/cobble, thatch/shingle, clay brick, clear glass, household hearth, granary and festival presentation. | No duplicate behaviour-only blocks; material/style profiles differentiate settlements. |
| Marchroad Leagues | Cut stone, timber framing, stone roads, bridge modules, milestone/sign, beacon, market and toll infrastructure. | Route, ownership and service behaviour remains in route/structure data. |
| Brassroot Communes | Metal plate/grate, clay brick, machine frames, pipes, rails, buffers, workshop/storage modules and salvage states. | Industrial presentation may add ports/sockets but cannot overwrite machine rules. |
| Deepstone Compacts | Deepstone/limestone masonry, arches, buttresses, tunnel lining, cisterns, minecart rail, seismic/ward anchors. | No global structural-collapse system is implied. |
| Mirelight Covenants | Woven reed, thatch, raised walkways, piles, irrigation, levees, lanterns, medicine stations and wet-state variants. | Base water contracts remain bounded; advanced maritime systems stay Set 26-owned. |
| Verdant Pact Enclaves | Living Heartwood, thornsilver lattice, pollen-amber glazing, growth anchors, seasonal flora, anti-blight wards and negotiated harvest states. | Realm law and ecology control use; culture style does not own resource mechanics. |

# 20. Functional, Crafting, Storage and Project Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.functional.crafting.hand_surface<br>**Hand-Crafting Surface** | Early physical crafting interface without assuming a fixed tutorial structure. | Placeable surface; simple recipe and inspection interface. | Core Required<br>Seed Start / CAP-01 |
| leyforge.core.block.family.functional.crafting.workbench<br>**Workbench Family** | General shaped crafting and repair station. | Material/style variants; block entity; upgrade sockets. | Core Required<br>Crafting / Settlement |
| leyforge.core.block.family.functional.processing.furnace<br>**Furnace Family** | Fuel-based smelting, cooking and early processing. | Stone/brick variants; lit, idle, blocked and damaged states. | Core Required<br>Extraction/Refinement |
| leyforge.core.block.family.functional.processing.forge_anvil<br>**Forge and Anvil Family** | Metal shaping, tool heads, repair and settlement industry. | Forge hearth plus anvil/work surface modules; upgrade sockets. | Core Required<br>Extraction/Refinement |
| leyforge.core.block.family.functional.processing.sawbench<br>**Sawbench Family** | Manual or powered timber processing and shape efficiency. | Manual/powered variants; input/output ports where automated. | Core Required<br>Logging / Sawmill |
| leyforge.core.block.family.functional.processing.kiln<br>**Kiln Family** | Clay, brick, tile and ceramic processing. | Fuel/power variants; temperature, firing and cooldown states. | Core Required<br>Clayworks |
| leyforge.core.block.family.functional.processing.mill<br>**Mill and Grindstone Family** | Grain, pigment, fibre and selected material preparation. | Manual/water/wind-driven variants; recipe interfaces. | Core Required<br>Agriculture / Routes |
| leyforge.core.block.family.functional.cooking.hearth<br>**Cooking Hearth Family** | Meals, warmth, social use and household/communal food preparation. | Small hearth, stove and communal kitchen variants. | Core Required<br>Survival / Provisions / Morale |
| leyforge.core.block.family.functional.health.medicine_station<br>**Medicine Station Family** | Treatment, medicine preparation and infirmary work. | Table/cabinet/station variants; clean/contaminated state. | Core Required<br>Health / Settlement |
| leyforge.core.block.family.functional.alchemy.table<br>**Alchemy Table Family** | Reagent processing and risk-aware alchemy. | Table/block entity; catalyst and containment sockets. | Core Required<br>Health / Magic |
| leyforge.core.block.family.functional.magic.rune_workbench<br>**Rune Workbench Family** | Rune inscription, tuning and repair. | Workbench/block entity; substrate and lens sockets. | Core Required<br>Practical Magic |
| leyforge.core.block.family.functional.magic.mana_refinery<br>**Mana Refinery Family** | Mana shard/dust, stabilisation and infrastructure component processing. | Machine/station variants; power, purity and safety states. | Core Required<br>Practical Magic / Automation |
| leyforge.core.block.family.functional.storage.chest<br>**Chest Family** | Personal and small-workshop storage with ownership and permissions. | Wood/metal/culture variants; locked and damaged states. | Core Required<br>Survival / Settlement |
| leyforge.core.block.family.functional.storage.crate<br>**Crate Family** | Visible logistics and bulk material storage. | Small/large and open/closed variants; automation ports. | Core Required<br>Automation / Trade |
| leyforge.core.block.family.functional.storage.barrel<br>**Barrel Family** | Food, liquids and trade-good storage with content-compatible profiles. | Dry/liquid-compatible variants; sealed, spoiled and damaged states. | Core Required<br>Provisions / Trade |
| leyforge.core.block.family.functional.storage.granary<br>**Granary and Silo Family** | Settlement-scale food/feed storage and need accounting. | Block entity/multiblock interface; fill level and infestation states. | Core Required<br>Settlement Services / Agriculture |
| leyforge.core.block.family.functional.storage.warehouse<br>**Warehouse Interface Family** | Authoritative settlement storage, delivery, reservations and ledger endpoint. | Block entity/structure service; permissions, reservation and import/export ports. | Core Required<br>Civilisation / Automation |
| leyforge.core.block.family.functional.storage.seed_vault<br>**Seed-Vault Family** | Protected crop, ecological and restoration seed storage. | Block entity; climate/ward support; sealed and compromised states. | Core Required<br>Agriculture / Restoration |
| leyforge.core.block.family.functional.storage.armory<br>**Armory Rack and Guard-Supply Family** | Visible settlement defence equipment storage and reservation. | Rack/chest/service variants; ownership and emergency reservation. | Core Required<br>Settlement Safety / Defence |
| leyforge.core.block.family.functional.project.supply_crate<br>**Project Supply Crate** | Reserved project inputs and visible construction staging. | Block entity; owner/project link; full/empty/damaged states. | Core Required<br>Settlement Projects / Structures |
| leyforge.core.block.family.functional.project.anchor<br>**Construction Project Anchor** | Persistent staged blueprint/project identity separate from visible blocks. | Protected block entity; local blueprint reference; progress and permissions. | Core Required<br>Projects / NPC Construction |
| leyforge.core.block.family.functional.project.scaffold<br>**Construction Scaffold Family** | Visible temporary construction and repair state. | Frame, platform, ladder and covered variants; temporary and salvageable. | Core Required<br>Projects / Repair |
| leyforge.core.block.family.functional.npc.jobsite_anchor<br>**Job-Site Anchor Family** | Semantic work location for NPC jobs without making every marker visible. | Visible workstation or hidden protected anchor; one canonical job link. | Core Required<br>NPC / Settlement |
| leyforge.core.block.family.functional.housing.bed<br>**Bed and Sleeping Place Family** | Housing capacity, rest and household assignment. | Bedroll, bed and bunk variants; owner/household binding. | Core Required<br>Housing / NPC |
| leyforge.core.block.family.functional.housing.hearth<br>**Household Hearth Family** | Home warmth, cooking support and household/social anchor. | Small hearth and stove variants; active/unsafe/damaged states. | Core Required<br>Housing / Morale |
| leyforge.core.block.family.functional.civic.notice_board<br>**Notice and Request Board Family** | Player-readable requests, warnings, contracts and project information. | Board/sign variants; authoritative view model, not stored quest truth. | Core Required<br>Civilisation / UI |

# 21. Automation, Logistics and Power Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.automation.component.machine_frame_copper<br>**Copper Machine-Frame Family** | Early modular frame for basic processing and logistics. | Frame/panel/port variants; repairable; component roles. | Core Required<br>CAP-03 / Automation |
| leyforge.core.block.family.automation.component.machine_frame_iron<br>**Iron Structural Machine-Frame Family** | Stronger frame for settlement-scale machines and defence support. | Frame/panel/port variants; reinforced and damaged states. | Core Required<br>CAP-04 / Automation |
| leyforge.core.block.family.automation.power.shaft<br>**Mechanical Shaft Family** | Visible rotational power transmission. | Straight, corner, vertical and bearing variants. | Core Required<br>Early Automation |
| leyforge.core.block.family.automation.power.gearbox<br>**Gearbox Family** | Direction, speed and torque routing for mechanical systems. | Block entity; input/output sides; overload warning. | Core Required<br>Early Automation |
| leyforge.core.block.family.automation.power.hand_crank<br>**Hand-Crank Family** | Manual startup and low-throughput power source. | Interactive block; effort/cycle state. | Core Required<br>Early Automation |
| leyforge.core.block.family.automation.power.waterwheel<br>**Waterwheel Anchor Family** | Water-powered mechanical generation using suitable bounded flows. | Anchor plus wheel asset; flow-suitability hook; no Set 26 tide dependency. | Core Required<br>Automation / Water Edge |
| leyforge.core.block.family.automation.power.wind_rotor<br>**Wind Rotor and Mill Anchor** | Wind-powered mechanical generation in pasture/highland routes. | Anchor plus rotor asset; wind-profile query; storm-safe shutdown. | Core Required<br>Automation / Highland |
| leyforge.core.block.family.automation.logistics.chute<br>**Item Chute Family** | Gravity-assisted early item transport. | Straight, corner, drop, merge and output variants. | Core Required<br>Early Automation |
| leyforge.core.block.family.automation.logistics.hopper<br>**Hopper and Intake Family** | Inventory collection and machine feeding. | Top/side/bottom variants; filters and ownership. | Core Required<br>Automation / Storage |
| leyforge.core.block.family.automation.logistics.belt<br>**Basic Conveyor Family** | Visible powered item transport beyond simple chutes. | Straight, slope, turn, junction and lift profiles; bounded nearby item visuals. | Core Required<br>Automation |
| leyforge.core.block.family.automation.logistics.filter<br>**Simple Filter and Router Family** | Tag/category routing without full logic-network complexity. | Inline block entity; allow/deny list; overflow behaviour. | Core Required<br>Automation |
| leyforge.core.block.family.automation.logistics.loader<br>**Loader and Unloader Family** | Transfers between belts/chutes, carts, stores and machines. | Directional ports; ownership/reservation-aware. | Core Required<br>Automation / Routes |
| leyforge.core.block.family.automation.logistics.buffer<br>**Automation Buffer Family** | Small transactional storage between machines and routes. | Block entity; internal capacity; pause-on-blocked-output. | Core Required<br>Automation |
| leyforge.core.block.family.automation.fluid.pipe_basic<br>**Basic Utility Pipe Family** | Bounded transfer for approved base fluids and machine inputs. | Straight, corner, junction, valve and port variants; Set 26 extension facets allowed. | Core Conditional<br>Automation / Set 26 Compatibility |
| leyforge.core.block.family.automation.fluid.pump_basic<br>**Basic Pump Family** | Moves approved fluids through local systems without defining ocean simulation. | Powered block entity; intake/output and dry-run state. | Core Conditional<br>Automation / Set 26 Compatibility |
| leyforge.core.block.family.automation.rail.minecart<br>**Minecart Rail Family** | Industrial transport through mines, roads and Deepstone galleries. | Straight, curve, slope, switch and stop variants. | Core Required<br>Routes / Industry |
| leyforge.core.block.family.automation.rail.cart_station<br>**Cart Station Family** | Loading, unloading, routing and settlement/warehouse handoff for carts. | Block entity; stop, loader and signal interfaces. | Core Required<br>Routes / Automation |
| leyforge.core.block.family.automation.control.copper_signal<br>**Copper Signal and Switch Family** | Simple machine state, rail and warning control. | Wire/connector/switch/sensor variants; no unrestricted scripting. | Core Required<br>Automation / Defence |
| leyforge.core.block.family.automation.safety.shutdown<br>**Machine Safety and Shutdown Family** | Readable overload, jam and emergency-stop behaviour. | Indicator, switch and lockout variants; authoritative state only. | Core Required<br>Automation / Player Trust |
| leyforge.core.block.family.automation.realm.regenerative_interface<br>**Regenerative Machine Interface** | Verdant-compatible machine casing and repair/growth interface. | Expansion facet on approved machines; living power/storage sockets. | Core Conditional<br>Verdant Covenant |

# 22. Practical Magic and Realm-Infrastructure Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.magic.rune.substrate<br>**Rune Substrate Family** | Physical surfaces that can accept stable rune definitions. | Tile, tablet, plate and inlay forms; blank, inscribed and damaged states. | Core Required<br>Practical Magic |
| leyforge.core.block.family.magic.rune.inscription<br>**Inscribed Rune Block Family** | Executable rune effect/control presentation linked to a rune definition. | Surface/inlay/standing forms; active, dormant, overloaded and broken states. | Core Required<br>Practical Magic / Automation |
| leyforge.core.block.family.magic.ward.stone<br>**Wardstone Family** | Placeable settlement, route and site protection anchor. | Standing stone, wall inlay and structure-anchor variants; charged/failed states. | Core Required<br>Practical Magic / Safety |
| leyforge.core.block.family.magic.ward.lantern<br>**Ward Lantern Family** | Readable local ward/light coverage and mana demand. | Post, wall and hanging forms; lit, low-power and breached states. | Core Required<br>Practical Magic / Settlement |
| leyforge.core.block.family.magic.mana.conduit<br>**Mana Conduit Family** | Physical mana transmission between sources, storage, wards and machines. | Straight, corner, junction, vertical and port variants. | Core Required<br>Practical Magic / Automation |
| leyforge.core.block.family.magic.mana.storage<br>**Mana Storage Family** | Battery/reservoir for practical magic infrastructure. | Block entity; charge/purity/ownership and safe-failure states. | Core Required<br>Practical Magic |
| leyforge.core.block.family.magic.mana.well<br>**Mana-Well Family** | Natural or constructed mana collection/service anchor. | Well/collector variants; flow, stability and contamination states. | Core Required<br>Practical Magic / Structures |
| leyforge.core.block.family.magic.leyline.anchor<br>**Leyline Anchor Family** | Links infrastructure to a validated leyline location without owning the leyline definition. | Anchor/block entity; tuned, overloaded, severed and repaired states. | Core Required<br>Leyline States / Magic |
| leyforge.core.block.family.magic.cleansing.anchor<br>**Cleansing Anchor Family** | Applies source-supported cleansing/restoration processes to blocks, sites or settlements. | Station/ward variants; input, progress, residue and failure states. | Core Required<br>Magic / Aftermath |
| leyforge.core.block.family.magic.spirit.memory_anchor<br>**Spirit and Memory Anchor Family** | Non-combat dialogue, remembrance, history and spirit-grove interaction point. | Stone/tree/relic presentation variants; knowledge and relationship gating. | Core Required<br>Spirit Grove / Narrative |
| leyforge.core.block.family.magic.portal.frame<br>**Portal-Frame Family** | Physical frame compatible with route definitions; frame is not the portal route itself. | Material/culture variants; incomplete, stabilised, damaged and sealed states. | Core Required<br>Realm Access |
| leyforge.core.block.family.magic.portal.anchor<br>**Portal Anchor Family** | Authoritative route endpoint and save-safe return reference. | Protected block entity; route, owner, state and spatial anchor references. | Core Required<br>Realm Access / Runtime |
| leyforge.core.block.family.magic.route.stabilizer<br>**Realm Route Stabiliser Family** | Consumes approved inputs to keep a route safe and reachable. | Block entity; charge, calibration, failure and emergency-return states. | Core Required<br>Realm Access |
| leyforge.core.block.family.magic.realm.bloomstone_stabilizer<br>**Bloomstone Stabiliser Family** | Verdant-specific compatibility and imported-infrastructure stabilisation. | Anchor/inlay variants; tuned, growing, exhausted and renewed states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.magic.realm.season_sap_reservoir<br>**Season-Sap Reservoir Family** | Stores and distributes seasonal catalyst/energy in Verdant infrastructure. | Reservoir and conduit-port variants; season-dependent state. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.magic.realm.pollen_amber_lens<br>**Pollen-Amber Lens Family** | Optical, inscription, signal and realm-perception interface. | Lens, window, instrument and rune-socket forms. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.magic.realm.memory_seed_anchor<br>**Memory-Seed Growth Anchor** | Grows or records negotiated realm structures and memory-linked outcomes. | Planter/altar/structure anchor; dormant, recording, growing and spent states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.magic.realm.thornsilver_binding<br>**Thornsilver Binding Family** | Flexible magical binding for living structures, routes and restraints. | Lashing, cable, lattice and seal variants. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.magic.realm.anti_blight_ward<br>**Anti-Blight Ward Family** | Protects living realm systems from rot/blight spread and supports restoration. | Ward/inlay/lantern variants; healthy, strained and failed states. | Core Conditional<br>Verdant Covenant |
| leyforge.core.block.family.magic.realm.return_anchor<br>**Emergency Realm Return Anchor** | Guarantees source-supported safe return and recovery from realm thresholds. | Protected route anchor; armed, spent, obstructed and repaired states. | Core Required<br>Realm Access / Ancestral Teaser |

# 23. Settlement, Route and Infrastructure Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.infrastructure.path.dirt<br>**Dirt Path Family** | Local trails and low-cost settlement navigation. | Full/path surface, edge and worn variants. | Core Required<br>Routes / Settlement |
| leyforge.core.block.family.infrastructure.road.compacted<br>**Compacted Road Family** | Farm lanes, regional roads and service access. | Surface, shoulder, drainage and damaged variants. | Core Required<br>Routes / Trade |
| leyforge.core.block.family.infrastructure.road.stone<br>**Stone Road Family** | Durable civic, bridge and high-traffic route surface. | Surface, curb, step and repaired variants. | Core Required<br>Routes / Civilisation |
| leyforge.core.block.family.infrastructure.road.ancient<br>**Ancient Road Family** | Restorable historical route with archaeology and trade-state meaning. | Intact, buried, broken, restored and claimed states. | Core Required<br>Ancient Roadland / Narrative |
| leyforge.core.block.family.infrastructure.bridge.timber_deck<br>**Timber Bridge-Deck Family** | Common bridge and raised walkway components. | Deck, beam, post, railing and damaged variants. | Core Required<br>Routes / Wetland |
| leyforge.core.block.family.infrastructure.bridge.stone_arch<br>**Stone-Arch Bridge Family** | Durable crossing structure and bridgehouse foundation. | Arch, pier, abutment, deck and parapet modules. | Core Required<br>Routes / Marchroad |
| leyforge.core.block.family.infrastructure.bridge.rope_suspension<br>**Rope Suspension Bridge Family** | Light highland/karst crossing with repair and load limits. | Anchor, cable, deck and railing modules. | Core Required<br>Highland / Routes |
| leyforge.core.block.family.infrastructure.crossing.ford_marker<br>**Seasonal Ford Marker Family** | Readable shallow crossing, warning and route-state anchor. | Marker posts, stepping stone and warning variants; water-level query. | Core Required<br>Routes / Water Edge |
| leyforge.core.block.family.infrastructure.pass.switchback_support<br>**Switchback Support Family** | Retaining walls, stairs, rails and stations on mountain routes. | Retaining wall, stair, platform and safety rail modules. | Core Required<br>Highland / Routes |
| leyforge.core.block.family.infrastructure.tunnel.lining<br>**Road-Tunnel Lining Family** | Safe constructed tunnel route through hills and underground. | Lining, support, drainage, light and gate modules. | Core Required<br>Routes / Underground |
| leyforge.core.block.family.infrastructure.route.river_marker<br>**River Route and Barge-Lane Marker** | Bounded Core river-route marker compatible with future maritime extension. | Buoy/marker/mooring interface only; no full vessel mechanics. | Core Conditional<br>Water Edge / Set 26 |
| leyforge.core.block.family.infrastructure.defence.palisade<br>**Palisade Family** | Early settlement perimeter and raid-pressure response. | Wall, corner, post, walkway and damaged variants. | Core Required<br>Settlement Safety |
| leyforge.core.block.family.infrastructure.defence.gate<br>**Gate and Gatehouse Interface Family** | Controlled entry, ownership, warning and defence connection. | Door/gate, portcullis hook, lock and damaged variants. | Core Required<br>Settlement Safety |
| leyforge.core.block.family.infrastructure.defence.barricade<br>**Barricade Family** | Temporary defence, event response and route obstruction. | Timber, rubble and mixed-material variants. | Core Required<br>Defence / Events |
| leyforge.core.block.family.infrastructure.signal.beacon<br>**Beacon Family** | Long-range warning, route and settlement signal source. | Tower-top, ground and magical-assisted variants; lit/unlit states. | Core Required<br>Defence / Routes |
| leyforge.core.block.family.infrastructure.signal.lantern<br>**Settlement and Route Lantern Family** | Lighting, navigation and safety cue with culture variants. | Post, wall, hanging and handoff sockets; fuel/mana variants. | Core Required<br>Settlement / Routes |
| leyforge.core.block.family.infrastructure.navigation.milestone<br>**Milestone and Sign Family** | Maps, roads, claims, warnings and player-readable navigation. | Stone/wood/signboard variants; localisation and generated-name references. | Core Required<br>Routes / UI |
| leyforge.core.block.family.infrastructure.commerce.market_stall<br>**Market Stall Family** | Physical trade endpoint and culture presentation. | Stall, counter, display and storage variants; merchant/job link. | Core Required<br>Trade / Settlement |
| leyforge.core.block.family.infrastructure.water.well<br>**Well Family** | Settlement water-access capability without making every well an infinite fluid source. | Wellhead, bucket/pump interface and protected water record. | Core Required<br>Provisions / Health |
| leyforge.core.block.family.infrastructure.water.cistern<br>**Cistern Family** | Stored water and settlement resilience. | Tank/reservoir block entity; clean/contaminated and damaged states. | Core Required<br>Provisions / Health |
| leyforge.core.block.family.infrastructure.agriculture.irrigation_channel<br>**Irrigation Channel Family** | Farm water distribution and flood-control interface. | Channel, gate, culvert and outlet variants; bounded fluid hook. | Core Required<br>Agriculture / Wetland |
| leyforge.core.block.family.infrastructure.water.levee<br>**Levee and Floodbank Family** | Floodplain protection, repair events and water-route boundary. | Earth/stone bank, spillway and breached variants. | Core Required<br>Wetland/Flood Basin |
| leyforge.core.block.family.infrastructure.wetland.raised_walkway<br>**Raised Walkway Family** | Safe movement through marshes, mire and stilt settlements. | Pile, deck, rail, junction and damaged variants. | Core Required<br>Mirelight / Wetland |
| leyforge.core.block.family.infrastructure.agriculture.pasture_fence<br>**Pasture Fence Family** | Livestock boundaries, grazing management and settlement readability. | Fence, gate, post and damaged variants. | Core Required<br>Agriculture / Herd Ecology |
| leyforge.core.block.family.infrastructure.agriculture.crop_support<br>**Crop Support and Trellis Family** | Managed crops, vines, orchards and living-material cultivation. | Stake, trellis, planter and greenhouse support variants. | Core Required<br>Agriculture / Verdant |

# 24. Adventure, Defence and Hazard Families

| Family ID / Name | World and Player Role | Required Forms / States | Status / Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.adventure.lock.mechanical<br>**Mechanical Lock Family** | Ownership, dungeon, storage and route gating through explicit lock definitions. | Door/container/port variants; locked, jammed and broken states. | Core Required<br>Adventure / Civilisation |
| leyforge.core.block.family.adventure.socket.key<br>**Key and Token Socket Family** | Physical receiver for keys, seals, faction tokens or quest items. | Wall/pedestal/door variants; one authoritative requirement reference. | Core Required<br>Adventure / Narrative |
| leyforge.core.block.family.adventure.seal.ritual<br>**Ritual and Magical Seal Family** | Magic, oath, realm or site gating distinct from ordinary locks. | Door/floor/wall variants; intact, weakened, broken and restored states. | Core Required<br>Magic / Adventure |
| leyforge.core.block.family.adventure.control.lever<br>**Lever and Manual Control Family** | Readable physical control for doors, machines and puzzles. | Wall/floor variants; ownership and state link. | Core Required<br>Adventure / Automation |
| leyforge.core.block.family.adventure.control.pressure_plate<br>**Pressure Plate and Sensor Family** | Weight/presence trigger for traps, doors and machinery. | Floor variants; armed, disabled and damaged states. | Core Required<br>Adventure |
| leyforge.core.block.family.adventure.puzzle.rune_socket<br>**Rune Puzzle Socket Family** | Typed rune-placement and logic interface without embedding puzzle truth in the block. | Pedestal, wall and floor variants; required-rune references. | Core Required<br>Adventure / Magic |
| leyforge.core.block.family.adventure.passage.hidden<br>**Hidden-Passage Family** | Discoverable wall/floor/door variants with clue and knowledge support. | Closed/open/revealed states; material-compatible presentation. | Core Required<br>Adventure |
| leyforge.core.block.family.adventure.trap.launcher<br>**Trap Launcher Family** | Projectile, gas or environmental trap emitter with readable disarm state. | Wall/floor/ceiling variants; armed, triggered, disabled and depleted states. | Core Required<br>Adventure / Combat |
| leyforge.core.block.family.adventure.trap.spike<br>**Spike and Pit-Trap Family** | Physical hazard, fortification and dungeon obstacle. | Floor/pit/barricade variants; armed, sprung and damaged states. | Core Required<br>Adventure / Defence |
| leyforge.core.block.family.adventure.hazard.emitter<br>**Hazard Emitter Family** | Generic typed socket for steam, poison, corruption, frost or other owned hazard definitions. | Vent/nozzle/rune variants; does not own the hazard effect. | Core Required<br>Adventure / Environment |
| leyforge.core.block.family.adventure.loot.container<br>**Contextual Loot-Container Family** | Treasure, salvage and evidence container with provenance, claims and ownership. | Chest, cache, reliquary and wreckage variants; sealed/looted states. | Core Required<br>Adventure / Loot |
| leyforge.core.block.family.adventure.sacred.altar<br>**Shrine and Altar Family** | Ritual, offering, memory and faction/culture interaction point. | Stone, timber, living and ruined variants. | Core Required<br>Sacred Sites / Culture |
| leyforge.core.block.family.adventure.tomb.marker<br>**Tomb and Memorial Marker Family** | Burial, remembrance, history and undead-pressure evidence. | Grave, cairn, slab and ossuary variants; disturbed/restored states. | Core Required<br>Tombs / History |
| leyforge.core.block.family.adventure.mechanism.ancient<br>**Ancient Mechanism Family** | Restorable machine, door, observatory and surveyor-site mechanism. | Console, gear-wall, lift and sealed-interface variants. | Core Required<br>Ruins / Machine Strata |
| leyforge.core.block.family.adventure.root.gate<br>**Living Root-Gate Family** | Root-cave, Verdant and ancient-oak passage control. | Arch/door/thorn variants; cooperative, dormant, hostile and cut states. | Core Required<br>Root Sites / Verdant |
| leyforge.core.block.family.adventure.fossil.wall<br>**Colossal-Remains Wall Family** | Dungeon walls and anatomy modules built from enormous remains. | Bone plate, rib arch, joint and marrow cavity modules. | Core Required<br>Natural Cave Grammars |
| leyforge.core.block.family.adventure.aftermath.boss_evidence<br>**Boss-Aftermath Evidence Family** | Persistent remains, scars, trophies or restoration anchors after major-threat outcomes. | Remains/scar/marker variants selected by outcome; not a universal loot chest. | Core Required<br>Regional Threats / Aftermath |
| leyforge.core.block.family.hazard.growth.corruption<br>**Corruption Growth Family** | Physical corruption evidence, spread and cleansing target. | Surface/full growth; dormant, spreading, cleansed and scarred states. | Core Required<br>Magic/Undead/Corruption Ecology |
| leyforge.core.block.family.hazard.growth.blight<br>**Blight Growth Family** | Plant/soil blight affecting ecology, food and Verdant systems. | Surface/full growth; infected, spreading, contained and restored states. | Core Required<br>Ecology / Verdant |
| leyforge.core.block.family.hazard.growth.rot<br>**Rot and Decay Family** | Organic decay, dungeon pressure and Rotwild presentation. | Surface/full growth; active, dried and cleansed states. | Core Required<br>Adventure / Verdant |
| leyforge.core.block.family.hazard.fire.source<br>**Fire and Heat Source Family** | Readable controlled/hostile fire source for survival, industry and damage. | Hearth/flame/ember variants; fuel, spread and extinguished states. | Core Required<br>Survival / Industry / Combat |
| leyforge.core.block.family.defence.ward.barrier<br>**Ward Barrier Family** | Visible magical boundary and defence-volume edge. | Post/field-edge/inlay variants; powered, strained and breached states. | Core Required<br>Magic / Defence |
| leyforge.core.block.family.defence.refuge.shutter<br>**Refuge Shutter and Reinforced Door Family** | Event-safe enclosure, bastion and shelter closure. | Door/shutter/hatch variants; locked, barred and damaged states. | Core Required<br>Safety / Structures |

# 25. Verdant Covenant Complete Block Package

The Verdant package is **conditional but indivisible at the production-admission level**. It cannot be represented by a handful of recoloured terrain blocks. The package must provide a coherent living substrate, six source-supported material classes, construction, growth, storage, infrastructure, route safety, anti-blight states and Overworld-compatible exports.

| Verdant Obligation | Required Families / Interfaces | Acceptance Meaning |
| --- | --- | --- |
| Seven biome-family surfaces | Verdant living soil, Worldroot mass, living water/riverbed profile through base fluids, seasonal flora, thorn/rot growth, living construction and seasonal state profiles. | Sunlit Canopy, Moonroot Groves, Pollenwild Meadows, Living Riverlands, Thorn-Court Marches, Rotwilds and Seasonal Nexus can be assembled without unique one-off blocks for every patch. |
| Six realm resources | Living Heartwood, Season Sap, Thornsilver Fibre, Pollen Amber, Memory Seed and Bloomstone source families. | Each has provenance, harvest/stabilisation, physical outputs and Overworld use handoffs to 25I-25J. |
| Living construction | Living-Heartwood construction, thornsilver lattice, pollen-amber glazing, root/vine modules and growth anchors. | Settlements and sites feel materially alive and can change with season/outcome. |
| Infrastructure | Season-sap reservoir, bloomstone stabiliser, regenerative machine interface, mana/ward compatibility and emergency return anchor. | Automation and magic operate under realm law rather than being disabled or copied unchanged. |
| Blight/restoration | Blight, rot, anti-blight ward, cleansing and restored/scarred states. | Realm outcomes leave persistent physical evidence. |
| Safe export | Exported block items preserve stabilisation and compatibility requirements. | Realm resources remain useful outside the realm without bypassing progression. |

# 26. Ancestral Veil Threshold Block Package

The Ancestral Veil content is a bounded teaser with no unique progression capability. Only the physical identities required for a safe threshold, memory interaction, accessibility boundary and guaranteed return are admitted.

| Family ID / Name | Role | Required Forms / States | Status |
| --- | --- | --- | --- |
| leyforge.core.block.family.realm.ancestral.threshold_surface<br>**Ancestral Threshold Surface** | Bounded safe-threshold presentation without promising a full explorable realm. | Floor/wall/veil surface variants; inactive, open and unstable states. | Teaser Only |
| leyforge.core.block.family.realm.ancestral.echo_anchor<br>**Ancestral Echo Anchor** | History, memory and Codex interaction point at the threshold. | Pedestal/marker variants; knowledge-gated and non-progression-critical. | Teaser Only |
| leyforge.core.block.family.realm.ancestral.safety_boundary<br>**Ancestral Safety Boundary** | Prevents unsupported traversal beyond the approved threshold and supports accessible feedback. | Visible/accessible boundary; no inventory form; pack-aware. | Teaser Only |

# 27. Dynamic-State and World-Aftermath Coverage

| State Class | Required States / Profiles | Ownership Rule |
| --- | --- | --- |
| Physical condition | intact, cracked, damaged, ruined, rubble/collapsed, repaired, reinforced | State where identity/material remains the same; separate block only when collision, drop or behaviour requires it. |
| Moisture and water | dry, damp, wet, waterlogged, flooded, submerged | Full fluid behaviour remains owned by runtime/Set 26; block state records local material response. |
| Temperature and season | hot, cooled, frosted, frozen, snow-covered, thawing; spring/summer/autumn/winter profiles | Seasonal presentation must not multiply IDs unless gameplay identity changes. |
| Fire | flammable-ready, burning, extinguished, scorched, charred | Burning is authoritative runtime state; charred result may be a variant or transformed family. |
| Growth and occupation | bare, mossy, overgrown, rootbound, fungal-colonised, occupied | Applied through validated variant/state profiles; reverse links preserve source identity. |
| Magic and power | uncharged, charged, active, overloaded, depleted, tuned, severed | Used by mana, rune, ward, conduit, portal and realm infrastructure. |
| Corruption and restoration | corrupted, blighted, rotted, contained, cleansed, scarred, restored | Transitions must name cause, spread, cure, output and persistent aftermath. |
| Ownership and access | unclaimed, owned, public, restricted, locked, sealed, conquered | Ownership is an instance/service record, not copied into immutable block definition. |
| Project and construction | planned, scaffolded, supplied, building, paused, complete, repair-priority | Project truth belongs to the project instance; blocks present the current stage. |
| Resource state | poor/normal/rich, pure/impure, exposed, harvested, depleted, regenerating | Grades/purity belong to resource/deposit state and must map to conserved drops. |

Every Core block family must declare which state classes it permits. Unsupported states are rejected rather than stored as arbitrary dictionaries. Worldgen, events, raids, bosses, ecology and player action may request transitions only through registered relationship/effect definitions. Demotion to simulation LOD must preserve all state that changes drops, capability, ownership, pathing, danger, project progress or player-visible history.

# 28. Document Set 26 Compatibility and Admission Boundary

Set 26 is the first major test of optional expansion compatibility. The base catalogue must remain valid without Set 26 while allowing admitted expansion facets and new definitions to add maritime capabilities later.

| Compatibility Area | 25H Base Contract | Set 26 Ownership |
| --- | --- | --- |
| Water identity | Fresh, marsh, underground, geothermal and brackish fluid families have stable IDs and save-safe states. | Detailed liquid simulation, waves, tides, currents, pressure and advanced storms. |
| Coast/waterline | Shingle, sand, estuary and wet-state hooks can accept optional waterline/environment facets. | Ocean/coast/island/underwater package breadth and dynamic shoreline behaviour. |
| Pipes/pumps | Basic local utility interfaces expose typed fluid ports. | Maritime pumping, bilge, flooding, ballast and vessel systems. |
| Structures | Base bridge, river-route and mooring-compatible semantic roles may exist without shipyards. | Docks, ports, harbours, shipyards and naval infrastructure. |
| Mobile constructs | Block definitions may expose optional component roles and local-space attachment data. | Vessel-local voxel structures, buoyancy, displacement, stability and moving interiors. |
| Damage/state | Base state schemas admit authorised extension fields without duplicate ownership. | Hull breach, compartment flooding, fire spread, sinking and salvage. |
| Pack absence/removal | Expansion-only definitions quarantine safely and base families continue to load. | Set 26 migration and reactivation mappings. |

> **Maritime Boundary**
>
> 25H does not create hull blocks, sails, rudders, anchors, naval weapons, shipyard stations, dock modules or flooding logic. Those definitions require the detailed component-role, physics, construction, combat and migration contracts owned by 26B and 26F-26O.

# 29. Core Package Coverage Matrix

| Core Package | Minimum Block-Family Coverage | Boundary / Fallback |
| --- | --- | --- |
| Seed Start and Immediate Survival | Meadow/pasture/forest/cold/wetland surface families; common stone, wood, fibre, water; hand-crafting surface, hearth and storage. | No fixed starter biome, village or block identity. |
| Temperate Heartland | Meadow, pasture, prairie, forest loam, mixed broadleaf, ancient oak, river gravel, clay, timber and common masonry. | Supports farming, settlements, roads, ruins and guardian aftermath. |
| Moorland and Boreal Frontier | Heather turf, peat, pine/spruce, cold turf, snow/ice, hardstone, timber, wind power and route safety. | Fire, frost and seasonal states required. |
| Wetland and Flood Basin | Marsh mud, peat, silt, quaking mat, reeds, shallow water, bog iron, raised walkways, irrigation and levees. | Advanced tides/currents remain Set 26-owned. |
| Highland, Karst and Geothermal | Alpine turf, hardstone, limestone, riftstone, travertine, sulfur crust, geothermal water/steam, bridges and switchbacks. | Supports mines, baths, alchemy, forts and hazard sites. |
| Coastal Edge and Inland Water | Shingle, sand, brackish estuary water, waterline-compatible states, river route markers and safe swimming contact. | Conditional; no open-ocean, vessel or naval dependency. |
| Underground and Deepstone | Limestone caves, fungal substrate, rootmass, crystal matrix, deepstone, machine strata, underground water, rails and tunnel lining. | Supports cave ecology, halls, sites, mining and ancient automation. |
| Leyline, Spirit, Ancient and Realm-Leak States | Leyline anchors, spirit/memory anchors, ancient roads, root/vine growth, corruption/restoration and Verdant leak families. | State changes must preserve base biome/block identity. |
| Civilisation and Settlement Services | Construction sets, storage, job/project anchors, beds/hearths, notice boards, markets, roads, water and defence infrastructure. | Seven settlement needs receive physical providers. |
| Extraction, Refinement and Early Automation | Coal/copper/iron deposits, furnace/forge/sawbench/kiln/mill, frames, shafts, power, chutes, belts, rails, buffers and warehouse interfaces. | 25I-25J must close all item and recipe chains. |
| Practical Mana, Wards and Cleansing | Mana crystal, runes, conduits, storage, wardstone/lantern, mana well, cleansing and portal/stabiliser families. | No fixed mage, ruin or portal location. |
| Adventure and Regional Threats | Locks, seals, puzzle sockets, traps, altars, tombs, mechanisms, root/fossil modules, hazard growth and boss evidence. | Site grammars own placement and solvability. |
| Verdant Covenant | Living soil/wood, seasonal flora, realm resources, living construction, growth/return anchors, anti-blight and regenerative interfaces. | Conditional complete package; cannot ship as isolated palette swaps. |
| Ancestral Veil Threshold | Threshold surface, echo anchor, safety boundary and emergency return anchor. | No unique progression capability or full realm simulation. |
| Set 26 Compatibility | Fresh/brackish water identities, waterline and bounded fluid interfaces, basic pipes/pumps and optional extension facets. | Detailed fluids, vessels, docks, flooding and naval systems remain Set 26. |

# 30. Item, Resource, Recipe and Drop Handoff

| Block Family Class | 25I Item Requirement | 25J / Registry Requirement |
| --- | --- | --- |
| Natural terrain | Item form only when collectable/placeable; otherwise raw drop or no drop. | Tool gate, drop profile, regeneration/exhaustion and transformation. |
| Vegetation/crops | Seed/sapling/harvest items where applicable. | Growth recipe/state, harvest products, ecology and season rules. |
| Deposits/nodes | Usually no direct block item; raw resource outputs preserve provenance/grade/purity. | Extraction, by-products, depletion, large-deposit and fallback-provider rules. |
| Construction | Block-item form for every player-placeable concrete entry. | Shape conversion, repair, salvage and project quantities. |
| Functional/storage | Placeable item or project output; block entity retains persistent state. | Assembly, upgrades, permissions, inventories and migration. |
| Automation/magic | Component items, upgrade modules and placeable blocks. | Power/mana, ports, transactions, failure and maintenance. |
| Adventure/hazard | Often structure/site-generated; item form only when explicitly recoverable. | Loot, disarm, restoration, claims and persistent aftermath. |
| Realm blocks | Exportability and stabilisation shown on item form. | Realm acquisition, safe use, substitution and contamination/blight rules. |

Every placeable block item must reference one concrete block ID. Every natural block that drops a different resource must reference a drop profile and resource/item IDs. No recipe may use a family ID as an ambiguous output unless the recipe explicitly selects a variant through tags and deterministic rules.

# 31. Forge, Material, Audio/VFX and Presentation Handoff

| Presentation Layer | 25H Requirement | Owning Handoff |
| --- | --- | --- |
| 32x32 material bases | Reusable material families for terrain, construction, damage, weathering, culture and realm overlays. | 25K and Forge |
| Generated shapes | Shape-compatible UV/material rules and collision profiles. | Document 03 / Forge / Runtime |
| Natural modules | Tree, root, cave, fungus, fossil and deposit modules with seed-safe variation. | Forge and Document 11 |
| Functional blocks | Ports, doors, storage openings, moving parts, interaction sockets and icon snapshots. | Forge / Documents 08-09/17 |
| States | Readable powered, damaged, burning, corrupted, blighted, restored and seasonal presentation. | 25K / Audio/VFX / gameplay owners |
| Culture kits | Six coherent palettes using shared families and selective unique modules. | 25K / Forge / Document 13 |
| Audio/VFX hooks | Footstep, impact, break, placement, machine, mana, hazard and state-transition events. | Minimal binding contracts now; dedicated tools not required. |
| Accessibility | Non-colour cues for hazard, state, power, ownership and interaction. | Document 17 / 25E |

# 32. Validation, Seed QA and Acceptance Evidence

| Validation Suite | Required Evidence |
| --- | --- |
| Identity/schema | All family IDs, parent/material/shape/state references and owners resolve; no POC namespace or short-ID leakage. |
| Entry generation | Generated concrete entries are deterministic, collision-safe and free of duplicate semantic IDs. |
| Worldgen coverage | Every selected biome/environment resolves to valid terrain, vegetation, water and resource palettes with transitions. |
| Capability reachability | Representative seeds expose CAP-00 to CAP-05 physical providers or recorded repairs/fallbacks. |
| Drops/conservation | Mining, harvesting, placing, breaking, repairing and transforming cannot duplicate or delete conserved resources unexpectedly. |
| State/migration | Save/load and version migration preserve block IDs, block-entity state, ownership, project links and unknown optional facets. |
| LOD/authority | Full/reduced/abstract simulation preserves machine, storage, project, hazard and realm-critical state. |
| Performance | Palette size, meshing, state density, block entities, connected shapes and animated blocks remain inside measured budgets. |
| Expansion | Set 26 absent/present/removal/reinstall tests preserve base water/coast blocks and quarantine expansion-only definitions safely. |
| Presentation/accessibility | Every hazard and important state is readable through at least one non-colour cue and correct interaction feedback. |

# 33. Production Sequence and Document 03 Replacement Gate

1. Approve 25H family identities, boundaries, conditional packages and explicit maritime deferrals.
2. Create 25I using the approved block-item, resource-output and component obligations.
3. Create 25J to close resource provenance, acquisition, transformation, recipe, by-product and progression paths.
4. Generate the first concrete block-entry worksheet from 25H families and approved shape profiles.
5. Replace Document 03 with v1.0 using qualified IDs, family contracts, exact entries, fields and cross-registry references.
6. Compile representative families into generated Godot Resources and validate world placement, state, save and migration.
7. Only then admit large-scale Forge asset production and implementation tasks for Core blocks.

> **Document 03 Replacement Gate**
>
> Document 03 v1.0 may not be accepted while a selected 25G package lacks required physical families, while a family lacks item/drop/recipe ownership, or while concrete entries still depend on retired POC identities. Placeholders may exist during authoring but cannot satisfy Integrated status.

# 34. Decisions Locked by 25H

- Block family IDs use the `leyforge.core.block.family.<path>` pattern under the registered block domain.
- The catalogue is family-first; concrete entry multiplication is governed by shape, state, culture and realm profiles.
- Visual or cultural variation does not automatically create a new executable block definition.
- Ordinary land construction retains no universal structural-collapse simulation.
- Every selected Core package must resolve to physical block families before integration.
- Verdant Covenant requires a complete living-material package; Ancestral Veil remains a bounded threshold package.
- Base water and coast blocks are stable without Set 26; detailed maritime blocks remain Set 26-owned.
- Document 03 v1.0, not 25H, becomes the executable Blocks Registry source of truth.

# 35. Handoff to 25I-25L and Main Documents

| Receiving Document | Required Handoff from 25H |
| --- | --- |
| 25I - Item Family Catalogue | Block-item policy, natural drops, harvested outputs, machine components, realm exports and non-item families. |
| 25J - Resource/Recipe Matrix | Deposit/node families, transformations, construction shape conversions, station/project inputs and by-products. |
| 25K - Asset Budgets | Family/shape/state/culture/realm asset classes, reusable kits, animated blocks and socket/event obligations. |
| 25L - Production Backlog | Concrete registry conversion, validators, representative Godot imports, tests, changed files and rollback notes. |
| 03 v1.0 | Full concrete entry registry, field values, family links, aliases and spreadsheet/generated-data contract. |
| 08-09 | Machine, logistics, power, mana, ward and stateful block behaviour. |
| 11-12 | Worldgen palettes, transitions, structure modules, projects and restoration states. |
| 17-18 | Authoritative UI/view models, voxel storage, meshing, block entities, saves, LOD, authority and performance. |
| Set 26 | Optional maritime facets and new block families after detailed maritime contracts are approved. |

# 36. Risks, Redesign Triggers and Open Decisions

## 36.1 Primary risks

- Concrete entry explosion if every culture, biome, weathering state and shape becomes a separate ID.
- Palette and save growth if generated variants are not normalised and hashed deterministically.
- Duplicate ownership between resource deposits, natural blocks, materials and items.
- Overuse of hidden anchors that makes systems hard for players and developers to inspect.
- Worldgen dead ends if selected biomes lack valid early material and water providers.
- Verdant content becoming cosmetic rather than changing harvesting, construction, infrastructure and aftermath.
- Premature maritime definitions creating incompatible vessel or flooding assumptions before Set 26 locks them.
- Performance costs from excessive connected shapes, animated blocks, block entities and per-cell state.

## 36.2 Redesign triggers

- A family requires more than one canonical owner for the same field path.
- A family cannot be represented without unique behaviour but is currently treated only as a visual variant.
- Representative seeds cannot satisfy CAP-00 to CAP-05 without fixed named content.
- A generated shape/state changes collision or drops without its own stable concrete entry.
- Registry snapshots exceed measured palette, memory, meshing or migration budgets.
- Set 26 requires a base-field change rather than an authorised extension facet or new expansion definition.
- Verdant Covenant cannot pass complete-realm validation with the selected physical families.

## 36.3 Open decisions for later authority

| Decision | Owner / Timing |
| --- | --- |
| Exact concrete entry count and which families receive extended shape sets. | Document 03 v1.0 after 25I-25J. |
| Final block-state packing and block-entity thresholds. | Document 18 v1.0 and representative profiling. |
| Exact crop/tree species and decorative subfamilies. | 25I/25J, Atlas package owners and Core scope control. |
| Whether basic conveyors and utility pipes enter the earliest Core milestone or a later internal milestone. | 25L production sequencing; no change to family admission required. |
| Final water-cell and fluid-transfer implementation. | Document 18 and Set 26B under base-compatibility constraints. |
| Which Set 26 block roles are extension facets versus new expansion-owned definitions. | 26F-26O with 25B-25D admission review. |

# Appendix A. Master Block-Family Register

## Technical and Recovery

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.technical.air | Air / Empty Cell | Core Required | Runtime / Voxel Kernel |
| leyforge.core.block.family.technical.world_boundary | Finite-World Boundary | Core Conditional | World Profile / Runtime |
| leyforge.core.block.family.technical.missing_definition | Missing-Definition Recovery Block | Core Required | 25D-25E / Runtime |
| leyforge.core.block.family.technical.blueprint_ghost | Blueprint Ghost Cell | Core Required | Blueprint / UI / Forge |
| leyforge.core.block.family.technical.protected_anchor | Protected System Anchor | Core Conditional | Structure / Realm / Runtime |

## Terrain, Soil and Organic Substrate

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.terrain.turf.meadow | Meadow Turf | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.turf.pasture | Pasture Turf | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.turf.prairie | Prairie Sod | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.turf.heather_moor | Heather-Moor Turf | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.soil.forest_loam | Forest Loam | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.soil.ancient_root | Ancient Rootsoil | Core Required | Temperate Heartland / Ancient States |
| leyforge.core.block.family.terrain.soil.pine_duff | Pine Duff | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.soil.spruce_duff | Spruce Duff | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.turf.cold_meadow | Cold-Meadow Turf | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.wetland.marsh_mud | Marsh Mud | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.peat | Peat | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.flood_silt | Flood Silt | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.quaking_mat | Quaking-Mire Mat | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.turf.alpine | Alpine Turf | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.cave.fungal_substrate | Fungal Substrate | Core Required | Underground/Deepstone |
| leyforge.core.block.family.terrain.realm.verdant_living_soil | Verdant Living Soil | Core Conditional | Verdant Covenant |

## Geology, Aggregates and Deep Layers

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.terrain.stone.common | Common Stone | Core Required | All Overworld Packages |
| leyforge.core.block.family.terrain.stone.upland_hardstone | Upland Hardstone | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.limestone | Limestone | Core Required | Highland/Karst/Rift / Underground |
| leyforge.core.block.family.terrain.stone.deepstone | Deepstone | Core Required | Underground/Deepstone |
| leyforge.core.block.family.terrain.stone.riftstone | Riftstone | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.travertine | Travertine | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.crystal_matrix | Crystal Matrix | Core Required | Underground/Deepstone / Practical Magic |
| leyforge.core.block.family.terrain.stone.machine_strata | Machine-Strata Composite | Core Required | Underground/Deepstone / Adventure |
| leyforge.core.block.family.terrain.aggregate.river_gravel | River Gravel | Core Required | Temperate / Wetland / Underground Water |
| leyforge.core.block.family.terrain.aggregate.shingle | Shingle | Core Conditional | Coastal Edge / Set 26 Compatibility |
| leyforge.core.block.family.terrain.aggregate.sand | Sand | Core Required | Temperate / Wetland / Coastal Edge |
| leyforge.core.block.family.terrain.earth.clay | Clay Earth | Core Required | Temperate / Wetland / Economy |
| leyforge.core.block.family.terrain.mineral.sulfur_crust | Sulfur and Mineral Crust | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.fossil.colossal_bone | Colossal Remains | Core Required | Adventure / Underground |
| leyforge.core.block.family.terrain.rootmass.worldroot | Worldroot Mass | Core Required | Ancient States / Underground / Verdant |

## Vegetation and Agriculture

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.vegetation.grass.short | Short Grass | Core Required | Surface Biomes |
| leyforge.core.block.family.vegetation.grass.tall | Tall Grass | Core Required | Temperate / Wetland |
| leyforge.core.block.family.vegetation.heath.heather | Heather | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.flower.wild | Wildflower Family | Core Required | Surface Biomes / Ecology |
| leyforge.core.block.family.vegetation.reed.marsh | Marsh Reeds | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.vegetation.moss.common | Common Moss | Core Required | Forest / Underground / Adventure |
| leyforge.core.block.family.vegetation.moss.bog | Bog Moss | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.vegetation.tree.mixed_broadleaf | Mixed Broadleaf Tree Family | Core Required | Temperate Heartland |
| leyforge.core.block.family.vegetation.tree.ancient_oak | Ancient Oak Family | Core Required | Temperate Heartland / Ancient States |
| leyforge.core.block.family.vegetation.tree.evergreen_pine | Evergreen Pine Family | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.tree.boreal_spruce | Boreal Spruce Family | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.tree.mistwood | Mistwood Wet-Timber Family | Core Required | Temperate Heartland / Ancient States |
| leyforge.core.block.family.vegetation.shrub.berry | Berry and Forage Shrub Family | Core Required | Surface Biomes / Provisions |
| leyforge.core.block.family.vegetation.herb.medicinal | Medicinal Herb Family | Core Required | Wetland / Highland / Health |
| leyforge.core.block.family.vegetation.fungus.cave | Cave Fungus Family | Core Required | Underground/Deepstone |
| leyforge.core.block.family.agriculture.crop.field | Field Crop Template Family | Core Required | Provisions/Health/Agriculture |
| leyforge.core.block.family.agriculture.tree.orchard | Orchard Tree Template Family | Core Required | Provisions/Health/Agriculture |
| leyforge.core.block.family.agriculture.pasture.feed | Pasture Feed and Hay Family | Core Required | Herd/Domestic / Agriculture |
| leyforge.core.block.family.vegetation.root.living_vine | Living Root and Vine Family | Core Conditional | Verdant Covenant / Realm Leak |
| leyforge.core.block.family.vegetation.realm.verdant_seasonal | Verdant Seasonal Flora Family | Core Conditional | Verdant Covenant |

## Base Fluids and Environmental Surfaces

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.fluid.water.fresh | Fresh Water Volume | Core Required | World / Survival / Set 26 Compatibility |
| leyforge.core.block.family.fluid.water.marsh_shallow | Shallow Marsh Water | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.fluid.water.estuary_brackish | Brackish Estuary Water | Core Conditional | Coastal Edge / Set 26 |
| leyforge.core.block.family.fluid.water.underground | Underground Water | Core Required | Underground/Deepstone |
| leyforge.core.block.family.fluid.water.geothermal | Geothermal Mineral Water | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.fluid.mud.slurry | Mud Slurry | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.environment.vent.steam | Steam Vent Block Family | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.environment.vent.peat_gas | Peat-Gas Vent Family | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.snow.surface | Snow Cover Family | Core Required | Boreal / Highland |
| leyforge.core.block.family.terrain.ice.freshwater | Freshwater Ice Family | Core Required | Boreal / Highland / Underground Water |

## Resource Deposit and Node Families

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.resource.deposit.coal | Coal Deposit Family | Core Required | Extraction/Refinement/Automation |
| leyforge.core.block.family.resource.ore.copper | Copper Ore Family | Core Required | CAP-03 / Automation |
| leyforge.core.block.family.resource.ore.iron | Iron Ore Family | Core Required | CAP-04 / Industry |
| leyforge.core.block.family.resource.ore.bog_iron | Bog-Iron Node Family | Core Required | Wetland / CAP-04 Fallback |
| leyforge.core.block.family.resource.deposit.clay | Clay Deposit Family | Core Required | Clayworks / Construction |
| leyforge.core.block.family.resource.deposit.peat | Harvestable Peat Deposit | Core Required | Wetland / Moorland |
| leyforge.core.block.family.resource.deposit.mana_crystal | Mana-Crystal Deposit Family | Core Required | Practical Magic / CAP-05 |
| leyforge.core.block.family.resource.deposit.geothermal_mineral | Geothermal Mineral Deposit | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.resource.deposit.resonant_crystal | Resonant Crystal Deposit | Core Required | Underground / Magic / Adventure |
| leyforge.core.block.family.resource.realm.living_heartwood | Living Heartwood Source | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.season_sap | Season-Sap Source | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.thornsilver_fibre | Thornsilver Fibre Source | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.pollen_amber | Pollen-Amber Deposit | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.memory_seed | Memory-Seed Node | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.bloomstone | Bloomstone Deposit | Core Conditional | Verdant Covenant |

## Construction Material Families

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.construction.timber.log | Structural Log Family | Core Required | Construction / Culture Kits |
| leyforge.core.block.family.construction.timber.plank | Timber Plank Family | Core Required | Construction / Culture Kits |
| leyforge.core.block.family.construction.timber.beam | Timber Beam and Joinery Family | Core Required | Construction / Routes |
| leyforge.core.block.family.construction.timber.shingle | Timber Shingle Roof Family | Core Required | Hearthland / Marchroad |
| leyforge.core.block.family.construction.plant.thatch | Thatch Family | Core Required | Hearthland / Wetland |
| leyforge.core.block.family.construction.plant.woven_reed | Woven-Reed Family | Core Required | Mirelight / Wetland |
| leyforge.core.block.family.construction.masonry.rubble | Rubble Masonry Family | Core Required | Construction / Adventure |
| leyforge.core.block.family.construction.masonry.cobble | Cobble Family | Core Required | Construction / Routes |
| leyforge.core.block.family.construction.masonry.cut_stone | Cut-Stone Family | Core Required | Civic / Defence / Culture Kits |
| leyforge.core.block.family.construction.masonry.stone_brick | Stone-Brick Family | Core Required | Settlement / Adventure |
| leyforge.core.block.family.construction.masonry.limestone | Limestone Masonry Family | Core Required | Highland/Karst / Deepstone |
| leyforge.core.block.family.construction.masonry.deepstone | Deepstone Masonry Family | Core Required | Deepstone Compacts |
| leyforge.core.block.family.construction.ceramic.clay_brick | Clay-Brick Family | Core Required | Clayworks / Settlement |
| leyforge.core.block.family.construction.ceramic.roof_tile | Ceramic Roof-Tile Family | Core Required | Civic / Industry |
| leyforge.core.block.family.construction.glass.clear | Clear Glass Family | Core Required | Construction / Industry / Magic |
| leyforge.core.block.family.construction.metal.plate_grate | Metal Plate and Grate Family | Core Required | Brassroot / Industry |
| leyforge.core.block.family.construction.realm.living_heartwood | Living-Heartwood Construction Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.construction.realm.thornsilver_lattice | Thornsilver Lattice Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.construction.realm.pollen_amber | Pollen-Amber Glazing Family | Core Conditional | Verdant Covenant |

## Functional, Crafting and Storage

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.functional.crafting.hand_surface | Hand-Crafting Surface | Core Required | Seed Start / CAP-01 |
| leyforge.core.block.family.functional.crafting.workbench | Workbench Family | Core Required | Crafting / Settlement |
| leyforge.core.block.family.functional.processing.furnace | Furnace Family | Core Required | Extraction/Refinement |
| leyforge.core.block.family.functional.processing.forge_anvil | Forge and Anvil Family | Core Required | Extraction/Refinement |
| leyforge.core.block.family.functional.processing.sawbench | Sawbench Family | Core Required | Logging / Sawmill |
| leyforge.core.block.family.functional.processing.kiln | Kiln Family | Core Required | Clayworks |
| leyforge.core.block.family.functional.processing.mill | Mill and Grindstone Family | Core Required | Agriculture / Routes |
| leyforge.core.block.family.functional.cooking.hearth | Cooking Hearth Family | Core Required | Survival / Provisions / Morale |
| leyforge.core.block.family.functional.health.medicine_station | Medicine Station Family | Core Required | Health / Settlement |
| leyforge.core.block.family.functional.alchemy.table | Alchemy Table Family | Core Required | Health / Magic |
| leyforge.core.block.family.functional.magic.rune_workbench | Rune Workbench Family | Core Required | Practical Magic |
| leyforge.core.block.family.functional.magic.mana_refinery | Mana Refinery Family | Core Required | Practical Magic / Automation |
| leyforge.core.block.family.functional.storage.chest | Chest Family | Core Required | Survival / Settlement |
| leyforge.core.block.family.functional.storage.crate | Crate Family | Core Required | Automation / Trade |
| leyforge.core.block.family.functional.storage.barrel | Barrel Family | Core Required | Provisions / Trade |
| leyforge.core.block.family.functional.storage.granary | Granary and Silo Family | Core Required | Settlement Services / Agriculture |
| leyforge.core.block.family.functional.storage.warehouse | Warehouse Interface Family | Core Required | Civilisation / Automation |
| leyforge.core.block.family.functional.storage.seed_vault | Seed-Vault Family | Core Required | Agriculture / Restoration |
| leyforge.core.block.family.functional.storage.armory | Armory Rack and Guard-Supply Family | Core Required | Settlement Safety / Defence |
| leyforge.core.block.family.functional.project.supply_crate | Project Supply Crate | Core Required | Settlement Projects / Structures |
| leyforge.core.block.family.functional.project.anchor | Construction Project Anchor | Core Required | Projects / NPC Construction |
| leyforge.core.block.family.functional.project.scaffold | Construction Scaffold Family | Core Required | Projects / Repair |
| leyforge.core.block.family.functional.npc.jobsite_anchor | Job-Site Anchor Family | Core Required | NPC / Settlement |
| leyforge.core.block.family.functional.housing.bed | Bed and Sleeping Place Family | Core Required | Housing / NPC |
| leyforge.core.block.family.functional.housing.hearth | Household Hearth Family | Core Required | Housing / Morale |
| leyforge.core.block.family.functional.civic.notice_board | Notice and Request Board Family | Core Required | Civilisation / UI |

## Automation, Logistics and Power

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.automation.component.machine_frame_copper | Copper Machine-Frame Family | Core Required | CAP-03 / Automation |
| leyforge.core.block.family.automation.component.machine_frame_iron | Iron Structural Machine-Frame Family | Core Required | CAP-04 / Automation |
| leyforge.core.block.family.automation.power.shaft | Mechanical Shaft Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.power.gearbox | Gearbox Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.power.hand_crank | Hand-Crank Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.power.waterwheel | Waterwheel Anchor Family | Core Required | Automation / Water Edge |
| leyforge.core.block.family.automation.power.wind_rotor | Wind Rotor and Mill Anchor | Core Required | Automation / Highland |
| leyforge.core.block.family.automation.logistics.chute | Item Chute Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.logistics.hopper | Hopper and Intake Family | Core Required | Automation / Storage |
| leyforge.core.block.family.automation.logistics.belt | Basic Conveyor Family | Core Required | Automation |
| leyforge.core.block.family.automation.logistics.filter | Simple Filter and Router Family | Core Required | Automation |
| leyforge.core.block.family.automation.logistics.loader | Loader and Unloader Family | Core Required | Automation / Routes |
| leyforge.core.block.family.automation.logistics.buffer | Automation Buffer Family | Core Required | Automation |
| leyforge.core.block.family.automation.fluid.pipe_basic | Basic Utility Pipe Family | Core Conditional | Automation / Set 26 Compatibility |
| leyforge.core.block.family.automation.fluid.pump_basic | Basic Pump Family | Core Conditional | Automation / Set 26 Compatibility |
| leyforge.core.block.family.automation.rail.minecart | Minecart Rail Family | Core Required | Routes / Industry |
| leyforge.core.block.family.automation.rail.cart_station | Cart Station Family | Core Required | Routes / Automation |
| leyforge.core.block.family.automation.control.copper_signal | Copper Signal and Switch Family | Core Required | Automation / Defence |
| leyforge.core.block.family.automation.safety.shutdown | Machine Safety and Shutdown Family | Core Required | Automation / Player Trust |
| leyforge.core.block.family.automation.realm.regenerative_interface | Regenerative Machine Interface | Core Conditional | Verdant Covenant |

## Practical Magic and Realm Infrastructure

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.magic.rune.substrate | Rune Substrate Family | Core Required | Practical Magic |
| leyforge.core.block.family.magic.rune.inscription | Inscribed Rune Block Family | Core Required | Practical Magic / Automation |
| leyforge.core.block.family.magic.ward.stone | Wardstone Family | Core Required | Practical Magic / Safety |
| leyforge.core.block.family.magic.ward.lantern | Ward Lantern Family | Core Required | Practical Magic / Settlement |
| leyforge.core.block.family.magic.mana.conduit | Mana Conduit Family | Core Required | Practical Magic / Automation |
| leyforge.core.block.family.magic.mana.storage | Mana Storage Family | Core Required | Practical Magic |
| leyforge.core.block.family.magic.mana.well | Mana-Well Family | Core Required | Practical Magic / Structures |
| leyforge.core.block.family.magic.leyline.anchor | Leyline Anchor Family | Core Required | Leyline States / Magic |
| leyforge.core.block.family.magic.cleansing.anchor | Cleansing Anchor Family | Core Required | Magic / Aftermath |
| leyforge.core.block.family.magic.spirit.memory_anchor | Spirit and Memory Anchor Family | Core Required | Spirit Grove / Narrative |
| leyforge.core.block.family.magic.portal.frame | Portal-Frame Family | Core Required | Realm Access |
| leyforge.core.block.family.magic.portal.anchor | Portal Anchor Family | Core Required | Realm Access / Runtime |
| leyforge.core.block.family.magic.route.stabilizer | Realm Route Stabiliser Family | Core Required | Realm Access |
| leyforge.core.block.family.magic.realm.bloomstone_stabilizer | Bloomstone Stabiliser Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.season_sap_reservoir | Season-Sap Reservoir Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.pollen_amber_lens | Pollen-Amber Lens Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.memory_seed_anchor | Memory-Seed Growth Anchor | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.thornsilver_binding | Thornsilver Binding Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.anti_blight_ward | Anti-Blight Ward Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.return_anchor | Emergency Realm Return Anchor | Core Required | Realm Access / Ancestral Teaser |

## Settlement, Route and Infrastructure

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.infrastructure.path.dirt | Dirt Path Family | Core Required | Routes / Settlement |
| leyforge.core.block.family.infrastructure.road.compacted | Compacted Road Family | Core Required | Routes / Trade |
| leyforge.core.block.family.infrastructure.road.stone | Stone Road Family | Core Required | Routes / Civilisation |
| leyforge.core.block.family.infrastructure.road.ancient | Ancient Road Family | Core Required | Ancient Roadland / Narrative |
| leyforge.core.block.family.infrastructure.bridge.timber_deck | Timber Bridge-Deck Family | Core Required | Routes / Wetland |
| leyforge.core.block.family.infrastructure.bridge.stone_arch | Stone-Arch Bridge Family | Core Required | Routes / Marchroad |
| leyforge.core.block.family.infrastructure.bridge.rope_suspension | Rope Suspension Bridge Family | Core Required | Highland / Routes |
| leyforge.core.block.family.infrastructure.crossing.ford_marker | Seasonal Ford Marker Family | Core Required | Routes / Water Edge |
| leyforge.core.block.family.infrastructure.pass.switchback_support | Switchback Support Family | Core Required | Highland / Routes |
| leyforge.core.block.family.infrastructure.tunnel.lining | Road-Tunnel Lining Family | Core Required | Routes / Underground |
| leyforge.core.block.family.infrastructure.route.river_marker | River Route and Barge-Lane Marker | Core Conditional | Water Edge / Set 26 |
| leyforge.core.block.family.infrastructure.defence.palisade | Palisade Family | Core Required | Settlement Safety |
| leyforge.core.block.family.infrastructure.defence.gate | Gate and Gatehouse Interface Family | Core Required | Settlement Safety |
| leyforge.core.block.family.infrastructure.defence.barricade | Barricade Family | Core Required | Defence / Events |
| leyforge.core.block.family.infrastructure.signal.beacon | Beacon Family | Core Required | Defence / Routes |
| leyforge.core.block.family.infrastructure.signal.lantern | Settlement and Route Lantern Family | Core Required | Settlement / Routes |
| leyforge.core.block.family.infrastructure.navigation.milestone | Milestone and Sign Family | Core Required | Routes / UI |
| leyforge.core.block.family.infrastructure.commerce.market_stall | Market Stall Family | Core Required | Trade / Settlement |
| leyforge.core.block.family.infrastructure.water.well | Well Family | Core Required | Provisions / Health |
| leyforge.core.block.family.infrastructure.water.cistern | Cistern Family | Core Required | Provisions / Health |
| leyforge.core.block.family.infrastructure.agriculture.irrigation_channel | Irrigation Channel Family | Core Required | Agriculture / Wetland |
| leyforge.core.block.family.infrastructure.water.levee | Levee and Floodbank Family | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.infrastructure.wetland.raised_walkway | Raised Walkway Family | Core Required | Mirelight / Wetland |
| leyforge.core.block.family.infrastructure.agriculture.pasture_fence | Pasture Fence Family | Core Required | Agriculture / Herd Ecology |
| leyforge.core.block.family.infrastructure.agriculture.crop_support | Crop Support and Trellis Family | Core Required | Agriculture / Verdant |

## Adventure, Defence and Hazard

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.adventure.lock.mechanical | Mechanical Lock Family | Core Required | Adventure / Civilisation |
| leyforge.core.block.family.adventure.socket.key | Key and Token Socket Family | Core Required | Adventure / Narrative |
| leyforge.core.block.family.adventure.seal.ritual | Ritual and Magical Seal Family | Core Required | Magic / Adventure |
| leyforge.core.block.family.adventure.control.lever | Lever and Manual Control Family | Core Required | Adventure / Automation |
| leyforge.core.block.family.adventure.control.pressure_plate | Pressure Plate and Sensor Family | Core Required | Adventure |
| leyforge.core.block.family.adventure.puzzle.rune_socket | Rune Puzzle Socket Family | Core Required | Adventure / Magic |
| leyforge.core.block.family.adventure.passage.hidden | Hidden-Passage Family | Core Required | Adventure |
| leyforge.core.block.family.adventure.trap.launcher | Trap Launcher Family | Core Required | Adventure / Combat |
| leyforge.core.block.family.adventure.trap.spike | Spike and Pit-Trap Family | Core Required | Adventure / Defence |
| leyforge.core.block.family.adventure.hazard.emitter | Hazard Emitter Family | Core Required | Adventure / Environment |
| leyforge.core.block.family.adventure.loot.container | Contextual Loot-Container Family | Core Required | Adventure / Loot |
| leyforge.core.block.family.adventure.sacred.altar | Shrine and Altar Family | Core Required | Sacred Sites / Culture |
| leyforge.core.block.family.adventure.tomb.marker | Tomb and Memorial Marker Family | Core Required | Tombs / History |
| leyforge.core.block.family.adventure.mechanism.ancient | Ancient Mechanism Family | Core Required | Ruins / Machine Strata |
| leyforge.core.block.family.adventure.root.gate | Living Root-Gate Family | Core Required | Root Sites / Verdant |
| leyforge.core.block.family.adventure.fossil.wall | Colossal-Remains Wall Family | Core Required | Natural Cave Grammars |
| leyforge.core.block.family.adventure.aftermath.boss_evidence | Boss-Aftermath Evidence Family | Core Required | Regional Threats / Aftermath |
| leyforge.core.block.family.hazard.growth.corruption | Corruption Growth Family | Core Required | Magic/Undead/Corruption Ecology |
| leyforge.core.block.family.hazard.growth.blight | Blight Growth Family | Core Required | Ecology / Verdant |
| leyforge.core.block.family.hazard.growth.rot | Rot and Decay Family | Core Required | Adventure / Verdant |
| leyforge.core.block.family.hazard.fire.source | Fire and Heat Source Family | Core Required | Survival / Industry / Combat |
| leyforge.core.block.family.defence.ward.barrier | Ward Barrier Family | Core Required | Magic / Defence |
| leyforge.core.block.family.defence.refuge.shutter | Refuge Shutter and Reinforced Door Family | Core Required | Safety / Structures |

## Ancestral Veil Teaser

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.realm.ancestral.threshold_surface | Ancestral Threshold Surface | Teaser Only | Ancestral Veil Threshold |
| leyforge.core.block.family.realm.ancestral.echo_anchor | Ancestral Echo Anchor | Teaser Only | Ancestral Veil Threshold |
| leyforge.core.block.family.realm.ancestral.safety_boundary | Ancestral Safety Boundary | Teaser Only | Ancestral Veil Threshold |

# Appendix B. Shape Eligibility Profiles

| Profile | Name | Primary Use | Required Forms / Boundary |
| --- | --- | --- | --- |
| SHP-00 | No placed item form | Air, boundary, hidden anchors and generated preview only. | No shape variants; interaction through owning service. |
| SHP-01 | Natural full voxel | Soils, stone, deposits and organic substrate. | Full block; optional surface/overlay variant; no automatic construction shapes. |
| SHP-02 | Loose/gravity aggregate | Sand, gravel, shingle and selected rubble. | Full voxel with gravity/settling; compacted route variant explicit. |
| SHP-03 | Basic masonry set | Common construction materials. | Full, slab, stair and wall; pillar/arch only when family permits. |
| SHP-04 | Extended civic masonry set | Cut stone, limestone, deepstone and selected bricks. | Full, slab, stair, wall, pillar, arch, lintel, trim and railing. |
| SHP-05 | Timber framing set | Logs, planks, beams and living wood. | Full, slab, stair/panel, beam, post, brace, railing, door/hatch hooks. |
| SHP-06 | Roof system | Shingle, thatch and ceramic roof families. | Slope/tile, ridge, valley, eave and cap modules. |
| SHP-07 | Thin panel/lattice | Glass, reed, metal plate, thornsilver and rune substrates. | Pane, panel, grate, lattice, screen and inlay forms. |
| SHP-08 | Plant/growth set | Grass, crops, shrubs, fungi, vines and roots. | Replaceable plant, surface growth, climbing and multi-cell modules. |
| SHP-09 | Functional block entity | Stations, storage, machines, magic and project anchors. | One or more assembled forms with ports, sockets and authoritative state. |
| SHP-10 | Route/infrastructure modules | Roads, bridges, rails, channels and palisades. | Surface, edge, junction, slope, support, corner and endpoint modules. |
| SHP-11 | Adventure grammar modules | Locks, traps, altars, hidden passages and mechanisms. | Floor/wall/ceiling/socket variants selected by site grammar. |

# Appendix C. State and Overlay Register

| Class | State Set | Contract |
| --- | --- | --- |
| Physical condition | intact, cracked, damaged, ruined, rubble/collapsed, repaired, reinforced | State where identity/material remains the same; separate block only when collision, drop or behaviour requires it. |
| Moisture and water | dry, damp, wet, waterlogged, flooded, submerged | Full fluid behaviour remains owned by runtime/Set 26; block state records local material response. |
| Temperature and season | hot, cooled, frosted, frozen, snow-covered, thawing; spring/summer/autumn/winter profiles | Seasonal presentation must not multiply IDs unless gameplay identity changes. |
| Fire | flammable-ready, burning, extinguished, scorched, charred | Burning is authoritative runtime state; charred result may be a variant or transformed family. |
| Growth and occupation | bare, mossy, overgrown, rootbound, fungal-colonised, occupied | Applied through validated variant/state profiles; reverse links preserve source identity. |
| Magic and power | uncharged, charged, active, overloaded, depleted, tuned, severed | Used by mana, rune, ward, conduit, portal and realm infrastructure. |
| Corruption and restoration | corrupted, blighted, rotted, contained, cleansed, scarred, restored | Transitions must name cause, spread, cure, output and persistent aftermath. |
| Ownership and access | unclaimed, owned, public, restricted, locked, sealed, conquered | Ownership is an instance/service record, not copied into immutable block definition. |
| Project and construction | planned, scaffolded, supplied, building, paused, complete, repair-priority | Project truth belongs to the project instance; blocks present the current stage. |
| Resource state | poor/normal/rich, pure/impure, exposed, harvested, depleted, regenerating | Grades/purity belong to resource/deposit state and must map to conserved drops. |

# Appendix D. Culture Kit Matrix

| Culture | Block-Family Emphasis | Ownership Boundary |
| --- | --- | --- |
| Hearthland Commons | Timber plank/beam, stone/cobble, thatch/shingle, clay brick, clear glass, household hearth, granary and festival presentation. | No duplicate behaviour-only blocks; material/style profiles differentiate settlements. |
| Marchroad Leagues | Cut stone, timber framing, stone roads, bridge modules, milestone/sign, beacon, market and toll infrastructure. | Route, ownership and service behaviour remains in route/structure data. |
| Brassroot Communes | Metal plate/grate, clay brick, machine frames, pipes, rails, buffers, workshop/storage modules and salvage states. | Industrial presentation may add ports/sockets but cannot overwrite machine rules. |
| Deepstone Compacts | Deepstone/limestone masonry, arches, buttresses, tunnel lining, cisterns, minecart rail, seismic/ward anchors. | No global structural-collapse system is implied. |
| Mirelight Covenants | Woven reed, thatch, raised walkways, piles, irrigation, levees, lanterns, medicine stations and wet-state variants. | Base water contracts remain bounded; advanced maritime systems stay Set 26-owned. |
| Verdant Pact Enclaves | Living Heartwood, thornsilver lattice, pollen-amber glazing, growth anchors, seasonal flora, anti-blight wards and negotiated harvest states. | Realm law and ecology control use; culture style does not own resource mechanics. |

# Appendix E. Package-to-Family Coverage

| Package | Required Coverage | Boundary |
| --- | --- | --- |
| Seed Start and Immediate Survival | Meadow/pasture/forest/cold/wetland surface families; common stone, wood, fibre, water; hand-crafting surface, hearth and storage. | No fixed starter biome, village or block identity. |
| Temperate Heartland | Meadow, pasture, prairie, forest loam, mixed broadleaf, ancient oak, river gravel, clay, timber and common masonry. | Supports farming, settlements, roads, ruins and guardian aftermath. |
| Moorland and Boreal Frontier | Heather turf, peat, pine/spruce, cold turf, snow/ice, hardstone, timber, wind power and route safety. | Fire, frost and seasonal states required. |
| Wetland and Flood Basin | Marsh mud, peat, silt, quaking mat, reeds, shallow water, bog iron, raised walkways, irrigation and levees. | Advanced tides/currents remain Set 26-owned. |
| Highland, Karst and Geothermal | Alpine turf, hardstone, limestone, riftstone, travertine, sulfur crust, geothermal water/steam, bridges and switchbacks. | Supports mines, baths, alchemy, forts and hazard sites. |
| Coastal Edge and Inland Water | Shingle, sand, brackish estuary water, waterline-compatible states, river route markers and safe swimming contact. | Conditional; no open-ocean, vessel or naval dependency. |
| Underground and Deepstone | Limestone caves, fungal substrate, rootmass, crystal matrix, deepstone, machine strata, underground water, rails and tunnel lining. | Supports cave ecology, halls, sites, mining and ancient automation. |
| Leyline, Spirit, Ancient and Realm-Leak States | Leyline anchors, spirit/memory anchors, ancient roads, root/vine growth, corruption/restoration and Verdant leak families. | State changes must preserve base biome/block identity. |
| Civilisation and Settlement Services | Construction sets, storage, job/project anchors, beds/hearths, notice boards, markets, roads, water and defence infrastructure. | Seven settlement needs receive physical providers. |
| Extraction, Refinement and Early Automation | Coal/copper/iron deposits, furnace/forge/sawbench/kiln/mill, frames, shafts, power, chutes, belts, rails, buffers and warehouse interfaces. | 25I-25J must close all item and recipe chains. |
| Practical Mana, Wards and Cleansing | Mana crystal, runes, conduits, storage, wardstone/lantern, mana well, cleansing and portal/stabiliser families. | No fixed mage, ruin or portal location. |
| Adventure and Regional Threats | Locks, seals, puzzle sockets, traps, altars, tombs, mechanisms, root/fossil modules, hazard growth and boss evidence. | Site grammars own placement and solvability. |
| Verdant Covenant | Living soil/wood, seasonal flora, realm resources, living construction, growth/return anchors, anti-blight and regenerative interfaces. | Conditional complete package; cannot ship as isolated palette swaps. |
| Ancestral Veil Threshold | Threshold surface, echo anchor, safety boundary and emergency return anchor. | No unique progression capability or full realm simulation. |
| Set 26 Compatibility | Fresh/brackish water identities, waterline and bounded fluid interfaces, basic pipes/pumps and optional extension facets. | Detailed fluids, vessels, docks, flooding and naval systems remain Set 26. |

# Appendix F. Document 03 v1.0 Replacement Checklist

- Use fully qualified family and concrete block IDs; preserve aliases and tombstones for legacy IDs.
- Remove POC Required/Alpha/Beta as shipped gameplay fields; use canonical production metadata.
- Create exact parent, material, shape, state, item-form, drop and block-entity references for every admitted entry.
- Provide spreadsheet/JSON authoring fields compatible with 25D and generated Godot Resources.
- List all natural-generation palettes and references without copying Atlas distribution ownership.
- Declare tool, hardness, gravity, support, collision, light, transparency, flammability, repair and hazard fields.
- Declare ownership, permissions, automation ports, mana ports, NPC/project and multiplayer-authority fields where applicable.
- Link every placeable block to an item form and every non-self drop to item/resource definitions.
- Declare exact shape-generation output and exclude unsupported family/shape combinations.
- Declare state packing, migrations, aliases, deprecation and missing-definition recovery.
- Provide validation evidence for representative terrain, construction, functional, automation, magic, adventure and Verdant families.
- Prove normal production manifests contain no Forest Hamlet, fixed valley, named POC villager, watchtower-project or scripted-raid content identities.

# Appendix G. Document 25H Acceptance Criteria

- Every 25G package has sufficient physical family coverage or an explicit conditional blocker.
- All family IDs follow 25B grammar and have one identity owner.
- Family boundaries avoid duplicate item/resource/structure/Atlas ownership.
- Shape and state policies prevent uncontrolled entry multiplication.
- Verdant Covenant has a complete physical package and Ancestral Veil remains teaser-bounded.
- Set 26 compatibility is explicit without premature maritime design.
- 25I and 25J can derive item/resource/recipe obligations without inventing missing block classes.
- Document 03 v1.0 has a precise replacement checklist and acceptance gate.
- Risks, conditional families and open decisions remain visible rather than silently resolved.

# Navigation

- Previous: [[25G - Core Production Package Dependency and Progression Matrix]]
- Next: [[25I - Core Production Item Family Catalogue]]
- Related: [[03 - Blocks Registry v1.0 Replacement]]; [[25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix]]; [[26A - Maritime and Naval Expansion Vision]]
