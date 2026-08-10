---

title: "25I - Core Production Item Family Catalogue"

document_id: "25I"

version: "0.1"

status: "Core Production Item Family Draft"

project: "Leyforge - Fantasy Voxel Civilisation Sandbox"

document_set: "25 - Post-Atlas Production Governance, Registries, Classification and Integration"

owner: "Ash"

depends_on:

  - "[[25B - Canonical Registry Kernel]]"

  - "[[25C - Domain Schemas and Completeness Contracts]]"

  - "[[25F - Core Production Atlas Classification and Scope Lock]]"

  - "[[25G - Core Production Package Dependency and Progression Matrix]]"

  - "[[25H - Core Production Block Family Catalogue]]"

next_document: "[[25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix]]"

tags: [leyforge, items, inventory, registry, production, atlas, godot, summer-engine]

---

# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25I - Core Production Item Family Catalogue

Version 0.1 - Core Production Inventory, Equipment, Material and Registry-Handoff Draft

A governed catalogue of the inventory-facing item families required by the approved Core Production packages, establishing family identity, stack and instance-state policy, block/resource/drop boundaries, culture and realm adaptation, optional-expansion compatibility and the exact handoff required before replacing Document 04.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

---

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Initial draft | Creates 296 proposed item-family contracts across recovery, block forms, materials, food, health, creature products, tools, equipment, automation, magic, settlement supply, culture goods, knowledge, adventure loot and realm content; defines instance-state, quality/provenance, Set 26 compatibility and the replacement requirements for Document 04 v1.0. |

# Document Purpose

Document 25I converts the inventory, equipment, material, supply, loot, knowledge and reward obligations established by Documents 25F-25H into a bounded Core Production item-family catalogue. It identifies which carried, stacked, equipped, consumed, installed, traded, studied, displayed, delivered and recovered item families must exist before the selected Atlas packages can become executable. It prevents the replacement Items Registry from becoming either a renamed POC list or an uncontrolled list of decorative loot and material variants.

This document works at **family-contract level**. It proposes stable family identities, required roles, stack or instance profiles, state requirements, package ownership and cross-registry boundaries. It does not create every final concrete item entry, numeric stat, recipe quantity, market price, loot weight, durability value, icon, Godot class or Set 26 maritime item. Those remain owned by Document 04 v1.0, 25J-25K, Documents 05-10/13-18 and Document Set 26.

By proceeding from 25H to 25I, Ash has accepted the 25H block-family catalogue as the current working physical-world intake. The family identities and boundaries in this draft become working locks only when this document is approved. Proposed family names that extend source material are recommendations, not retroactive Atlas canon.

# Design Sources and Supersession Rules

| Source | Authority Used by 25I |
| --- | --- |
| Documents 25A-25E | Governance, qualified IDs, field ownership, schemas, content packs, migration, validation and release gates. |
| Document 25F | Approved Core world, culture, settlement, ecology, adventure, realm and progression scope. |
| Document 25G | Package dependencies, capability bands, physical input/output classes, fallback providers and blockers. |
| Document 25H | Approved block-family catalogue, generated block-item-form boundary and physical presentation obligations. |
| Atlas 24E/24F/24H/24J/24K | Culture goods, creature resources, boss proofs, material ecology, provenance, contextual loot, history and event meaning. |
| Document 04 v0.1 | Retains block/item separation, item categories, instance states, tools, equipment, food, magic, machine parts, trade, loot and knowledge intent. POC lists, fixed ladder assumptions and short IDs are legacy inputs. |
| Documents 05-10/12-17 and settlement/Forge sets | Recipe, resource, NPC, automation, magic, creature, structure, faction, quest, combat, UI, blueprint, asset and presentation requirements. |
| Document Set 26 direction | Owns detailed maritime resources, fishing, diving gear, vessel components, cargo systems, naval equipment and water-exposure behaviour. 25I provides only generic extension compatibility. |

> **Supersession Rule**
>
> Document 25I does not replace Document 04 by itself. It supersedes the POC item-selection logic and becomes the approved family intake for Document 04 v1.0. The original registry remains a legacy design source until the replacement registry is accepted, after which its POC scope, short IDs and fixed demonstration items move to archive, alias or migration status.

# Static Table of Contents

- 1. Locked Item-Family Catalogue Identity
- 2. Decision Boundary and Approval Status
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Item-Family Terminology
- 5. Catalogue Architecture and Qualified-ID Rules
- 6. Family Inheritance, Composition and Variant Policy
- 7. Definition, Stack, Instance and Runtime-State Separation
- 8. Block Item Forms and Placed-Block Relationships
- 9. Item, Resource, Drop, Loot and Currency Boundaries
- 10. Scarcity, Capability Tier, Quality, Condition and Provenance
- 11. Catalogue Summary and Status Envelope
- 12. Universal Item-Family Contract
- 13. Technical and Recovery Families
- 14. Generated Block-Item Form Profiles
- 15. Natural, Botanical and Organic Inputs
- 16. Stone, Aggregate, Ceramic and Glass Inputs
- 17. Metals, Salvage and Industrial Materials
- 18. Fuel, Power and Portable Energy
- 19. Food, Water, Medicine and Settlement Health
- 20. Creature Products, Samples and Trophies
- 21. Tools, Instruments and Work Equipment
- 22. Weapons, Armour and Personal Equipment
- 23. Automation and Machine Components
- 24. Mana, Runes and Magical Components
- 25. Settlement Supply, Trade and Ownership Records
- 26. Culture Signature Goods
- 27. Knowledge, Maps, Blueprints and Records
- 28. Adventure Loot, Relics and Boss Proofs
- 29. Verdant Covenant Complete Item Package
- 30. Ancestral Veil Threshold Item Package
- 31. Dynamic State, Ownership and Provenance Coverage
- 32. Document Set 26 Compatibility and Admission Boundary
- 33. Core Package Coverage Matrix
- 34. Block, Resource, Recipe, Drop and Loot Handoff
- 35. Forge, UI, Audio/VFX and Presentation Handoff
- 36. Validation, Seed QA and Acceptance Evidence
- 37. Production Sequence and Document 04 Replacement Gate
- 38. Decisions Locked by 25I
- 39. Handoff to 25J-25L and Main Documents
- 40. Risks, Redesign Triggers and Open Decisions
- Appendix A. Master Item-Family Register
- Appendix B. Stack and Instance-State Profiles
- Appendix C. Scarcity, Quality, Condition and Provenance Matrix
- Appendix D. Culture-Goods Matrix
- Appendix E. Package-to-Family Coverage
- Appendix F. Document 04 v1.0 Replacement Checklist
- Appendix G. Document 25I Acceptance Criteria

# 1. Locked Item-Family Catalogue Identity

> **Locked Rule**
>
> An item family enters Core Production only when it has a clear player-facing purpose, package owner, physical source or acquisition path, stack or instance-state profile, consumers, ownership/provenance policy, fallback role, presentation obligation and validation path. An item does not exist merely because a loot table, rarity colour or crafting list could contain another name.

| Identity Layer | 25I Meaning | Player-Facing Result |
| --- | --- | --- |
| Inventory-facing contract | Families define what can be gathered, carried, equipped, consumed, delivered, installed, studied, displayed or recovered. | The selected world packages produce real usable objects rather than abstract counters. |
| Family before entry explosion | Shared roles and state profiles are locked before material, culture, quality and presentation variants multiply. | The item catalogue remains maintainable and searchable. |
| Conserved physical chains | Items link sources, transformations, storage, trade, NPC needs, automation and rewards. | Production and civilisation use real inputs and outputs. |
| Context without duplicate truth | Atlas context, resource ecology, item behaviour, loot context, assets and runtime state remain separately owned. | One item can carry provenance without copying world history into the item definition. |
| Save-safe identity | Approved family, concrete item and persistent instance IDs remain stable through packs, migration and optional expansion changes. | Inventories, containers, equipment and displays survive updates. |

# 2. Decision Boundary and Approval Status

| Statement Type | Status in 25I |
| --- | --- |
| 25A-25H governance, package graph and physical block families | Locked working authority. |
| Item-family identities and boundaries in this document | Proposed working locks; approved when Ash accepts 25I. |
| Exact concrete item IDs beneath each family | Deferred to Document 04 v1.0 and registry authoring. |
| Numeric damage, armour, food, durability, spoilage, price, charge and balance | Deferred to Documents 04-06/16 and testing. |
| Exact recipes, substitutions and progression pathways | Deferred to 25J and Documents 05-06. |
| Godot Resources, inventory implementation and runtime serialisation | Deferred to rewritten Document 18. |
| Detailed maritime item families and behaviours | Owned by Set 26; only extension compatibility is specified here. |

# 3. Scope, Non-Goals and Handoff Boundaries

## 3.1 In scope

- Qualified item-family identities and catalogue categories.
- Core Required, Core Conditional, Teaser Only and extension-boundary treatment.
- Stack, batch, container, durable, charged, knowledge, contract, unique and recovery profiles.
- Block item forms and explicit no-item/packed-state boundaries.
- Material, food, medicine, creature, tool, equipment, automation, magic, trade, knowledge, loot and realm families.
- Quality, condition, provenance, ownership, legality and contextual-value rules.
- Package coverage, validators and the Document 04 replacement gate.

## 3.2 Explicit non-goals

- Creating every material variant of every weapon, tool, armour piece or block form.
- Locking final values, drop rates, prices, stats, recipes, icon art or sound/VFX.
- Turning all creature parts into loot or all cultural objects into trade goods.
- Designing full maritime inventories, vessel components, fishing, diving or naval equipment.
- Treating a family count as a content quota.

## 3.3 Handoff boundaries

| Concern | Canonical Owner after 25I |
| --- | --- |
| Concrete item definitions and executable fields | Document 04 v1.0. |
| Transformations, recipes and substitutions | 25J and Document 05 v1.0. |
| Resource progression, scarcity and capability pathways | 25J and Document 06 v1.0. |
| Block forms and placed behaviour | 25H and Document 03 v1.0. |
| Creature harvesting and drop eligibility | Document 10 v1.0. |
| Loot generation context and site ownership | Documents 12/15 plus Atlas 24G-24K. |
| Combat statistics and equipment actions | Document 16 v1.0. |
| Inventory/UI presentation | Document 17 v1.0 and 25K. |
| Runtime, saves, authority and performance | Document 18 v1.0. |
| Maritime items and water/vessel behaviour | Document Set 26. |

# 4. Canonical Item-Family Terminology

| Term | Definition |
| --- | --- |
| Item family | Governed parent contract sharing role, state model, tags and cross-system expectations. |
| Concrete item definition | Stable executable entry such as a material-specific tool, prepared meal, rune or relic. |
| Item stack | Quantity of compatible item instances or batch state represented together. |
| Item instance | Persistent singular object with condition, owner, charge, container contents, knowledge or provenance. |
| Batch state | Shared state for a stack, such as freshness, purity, grade, source or contamination. |
| Block item form | Inventory definition that references one exact placeable block definition. |
| Resource family | Progression/ecology context describing where and why a material exists; not automatically an inventory entry. |
| Loot context | Rule-owned selection and ownership context that produces item references; not an item property list. |
| Provenance | Source, maker, owner, event, site, creature, culture or claim history attached to an item or batch. |
| Significance | Ordinary, cultural, relic, authority-proof or unique importance; separate from power and scarcity. |

# 5. Catalogue Architecture and Qualified-ID Rules

All family IDs use `leyforge.core.item.family.<identity_path>`. Concrete entries use the item-definition namespace approved by 25B and Document 04 v1.0. Families never occupy runtime-instance namespaces.

| Layer | Example | Rule |
| --- | --- | --- |
| Family | `leyforge.core.item.family.tool.harvest.pickaxe` | Stable parent contract; not placed directly in inventory. |
| Concrete definition | `leyforge.core.item.tool.pickaxe.iron.standard` | Executable item entry with exact material and behaviour. |
| Persistent instance | Generated persistent item key | Stores condition, owner, quality, charge and other approved state. |
| Stack/batch | Inventory record | Stores quantity plus only the state required by the family profile. |
| Alias/tombstone | Legacy short ID mapping | Never reuses an old ID for a different item. |

# 6. Family Inheritance, Composition and Variant Policy

- Families inherit universal identity, localisation, tags, status, pack, source and validation fields from the registry kernel.
- Role-specific parents add stack, durability, spoilage, charge, equipment, container, knowledge or contract fields.
- Material, culture and presentation facets may be composed when they do not change gameplay identity.
- A separate concrete item ID is required when behaviour, recipe role, state schema, equip action, legal status or save meaning differs.
- Quality and provenance do not create new definition IDs unless a fixed authored item requires them.
- Generated block item forms are derived from admitted block definitions and cannot drift from their placed-block references.

# 7. Definition, Stack, Instance and Runtime-State Separation

| Data Class | Examples | Persistence Rule |
| --- | --- | --- |
| Definition | Name, category, parent, icon key, capability, equip action, base stack rule. | Versioned registry data. |
| Batch/stack state | Freshness, grade, purity, source region, contamination. | Stored only when required; merge rules explicit. |
| Persistent instance state | Durability, charge, enchantment, owner, container contents, annotations. | Stable instance ID where uniqueness matters. |
| World-drop state | Position, velocity, pickup rights, despawn/hibernation state. | Runtime world record, not item definition. |
| Transaction/history | Crafted by, looted from, donated to, confiscated, restored. | Event or provenance record referenced as needed. |

> **State Conservation Rule**
>
> Stacking, splitting, crafting, automation, trade, death, container transfer, save migration and optional-pack removal must never silently erase quantity, ownership, contamination, charge, freshness, unique identity or required provenance.

# 8. Block Item Forms and Placed-Block Relationships

- Every placeable block admitted by Document 03 v1.0 declares an item-form policy: generated, explicit special item, packed block entity, project-only, non-removable or no item form.
- A block item form references one exact block definition; it does not copy hardness, collision, generation or placed-state ownership.
- Packed machines and containers preserve only authorised state and must pass ownership, emptying, duplication and migration tests.
- Natural blocks may drop themselves, a resource item, multiple by-products or nothing according to the block/drop contract.
- Living, magical, adventure and realm blocks may require consent, tools, purification, stabilisation or project interaction before becoming items.

# 9. Item, Resource, Drop, Loot and Currency Boundaries

| Layer | Owns | Must Not Own |
| --- | --- | --- |
| Item Registry | Inventory/equipment behaviour, stack/instance schema, use/equip actions, block-form links. | World distribution, creature ecology or loot-table context. |
| Resource Progression | Material identity, source classes, capability role, refinement and long-term use. | Inventory serialisation or exact item instance state. |
| Creature System | Harvest eligibility, welfare, drop source, anatomy/ecology and consequences. | Generic item stack rules. |
| Loot/Site/Event systems | Context, claims, selection, alternatives, aftermath and ownership transfer. | Duplicate item definitions. |
| Economy | Market context, demand, legality, currency use and transaction rules. | Universal fixed value as sole truth. |
| Currency item | Physical representation where used. | Reputation, faction standing or account authority. |

# 10. Scarcity, Capability Tier, Quality, Condition and Provenance

> **Locked Rule**
>
> Scarcity, capability tier, craft quality, condition, provenance, significance and market value are separate dimensions. A colour or rarity label must not automatically make an item stronger.

| Dimension | Owner | Rule |
| --- | --- | --- |
| Availability / scarcity | Definition/context metadata | How often and where a source can appear; never an automatic stat multiplier. |
| Capability band | Definition relationship | What capability or progression requirement the item provides or consumes. |
| Craft quality | Definition or instance, by family | Crude, standard, refined, masterwork or other approved grades; affects supported fields only. |
| Condition | Runtime instance or batch | Wear, damage, spoilage, contamination, fracture, charge or integrity. |
| Provenance | Runtime/definition relationship | Source site, culture, creature, maker, owner, event and legal claim. |
| Significance | Definition/context metadata | Ordinary, culturally important, relic, authority proof or unique; controls presentation and preservation. |
| Value | Derived market context | Base valuation plus supply, demand, culture, legality, reputation, quality and condition. |

# 11. Catalogue Summary and Status Envelope

| Measure | Count |
| --- | --- |
| Total proposed item-family contracts | 296 |
| Core Required | 261 |
| Core Conditional | 32 |
| Teaser Only | 3 |
| Generated block-item form profiles | 10 |
| Verdant Covenant families | 14 |
| Ancestral Veil teaser families | 3 |

The count is a registry-planning result, not a content quota. Concrete item counts will be higher because admitted families may generate material, culture, shape, quality, equipment-slot or authored variants. Document 04 v1.0 must create only variants justified by gameplay, presentation or migration requirements.

# 12. Universal Item-Family Contract

| Field Group | Required Contract |
| --- | --- |
| Identity | Qualified family ID, display-name key, description key, parent family, source pack and lifecycle status. |
| Role | Player-facing purpose, capability offered/required, primary consumers and package owner. |
| Acquisition | Source classes, harvest/trade/craft/quest methods, exclusions and fallback providers. |
| State | Stack/instance profile, stack limit policy, quality, condition, charge, spoilage, contamination and ownership fields as applicable. |
| Relationships | Block form, resource family, recipes, creature/source, culture, faction, site, boss, quest and UI links. |
| Use | Consume, equip, place, install, learn, read, display, deliver, fuel, repair, trade or activate actions. |
| Authority | Owner, permissions, pickup rights, container transfer, multiplayer transaction and anti-duplication rules. |
| Presentation | Icon, held/display model, rarity/significance cue, audio/VFX event hooks and accessibility text. |
| Migration | Aliases, tombstones, removed-pack payload, substitution policy and recovery presentation. |
| Validation | Schema, reference, conservation, stacking, use, save, authority, performance and package-coverage evidence. |

# 13. Technical and Recovery

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.technical.missing_definition | Missing-Definition Recovery Item | Visible quarantine representation when a removed or unavailable item definition must retain quantity, state and provenance safely. | RECOVERY / non-craftable / preserves original qualified ID and payload | Core Required / 25D-25E / Runtime |
| leyforge.core.item.family.technical.invalid_stack_quarantine | Invalid-Stack Quarantine Package | Separates incompatible or corrupted stack state rather than deleting or merging it. | RECOVERY / sealed payload / admin-inspectable | Core Required / Registry / Save Recovery |
| leyforge.core.item.family.technical.migration_receipt | Migration Receipt | Records a player-visible summary when an item, quantity, ownership record or container was migrated or substituted. | KNOWLEDGE / non-trade / save-version linked | Core Required / Migration / Player Trust |
| leyforge.core.item.family.technical.deprecated_tombstone | Deprecated Item Tombstone | Retains an archived identity and replacement link without admitting the old item into normal production. | RECOVERY / non-spawnable / alias and supersession only | Core Required / Registry / Archive |

# 14. Generated Block-Item Form Profiles

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.block_form.terrain_natural | Natural Terrain Block-Item Form | Inventory form for approved mineable or collectable natural blocks that may be carried and placed. | BLOCK_FORM / references exact block ID / simple stack unless state requires split | Core Required / 25H / Document 03 |
| leyforge.core.item.family.block_form.construction | Construction Block-Item Form | Inventory form for masonry, timber, roof, trim and modular building entries generated from approved block definitions. | BLOCK_FORM / material and shape identity preserved | Core Required / 25H / Building |
| leyforge.core.item.family.block_form.functional_station | Functional Station Block-Item Form | Placeable form for crafting, storage, civic and service blocks with block-entity setup rules. | BLOCK_FORM / non-stack or limited stack / ownership initialisation | Core Required / 25H / Stations |
| leyforge.core.item.family.block_form.storage | Storage Block-Item Form | Placeable form for chests, crates, barrels, warehouses and specialised stores. | BLOCK_FORM / container inventory must be empty or explicitly packed | Core Required / 25H / Storage |
| leyforge.core.item.family.block_form.automation | Automation Block-Item Form | Placeable form for machines, logistics, power and control blocks. | BLOCK_FORM / ports and configuration reset or preserved by approved packing rule | Core Required / 25H / Automation |
| leyforge.core.item.family.block_form.magic | Magic Infrastructure Block-Item Form | Placeable form for runes, wards, conduits, mana stores and realm-route infrastructure. | BLOCK_FORM / charged state normally discharged on ordinary pickup unless authorised | Core Required / 25H / Magic |
| leyforge.core.item.family.block_form.infrastructure | Infrastructure Block-Item Form | Placeable form for roads, bridge modules, signs, defences, irrigation and route services. | BLOCK_FORM / construction and project compatibility | Core Required / 25H / Civilisation |
| leyforge.core.item.family.block_form.adventure | Adventure Interaction Block-Item Form | Controlled placeable form for traps, puzzle devices, ritual objects or restorable site components where removal is allowed. | BLOCK_FORM / provenance-bound / permission and site-state checked | Core Conditional / Adventure / Structures |
| leyforge.core.item.family.block_form.plantable | Plantable Block-Item Form | Seedling, sapling, crop start, fungal culture or living growth form that creates a placed growth block. | BLOCK_FORM / biological quality, season and legality facets | Core Required / Agriculture / Ecology |
| leyforge.core.item.family.block_form.realm_living | Living-Realm Block-Item Form | Controlled form for approved Verdant living construction and growth anchors. | BLOCK_FORM / realm compatibility / growth-memory and consent state | Core Conditional / Verdant Covenant |

# 15. Natural, Botanical and Organic Inputs

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.natural.wood.hardwood_log | Hardwood Log and Branch Family | Primary temperate timber input for shelter, tools, fuel, beams and settlement construction. | PROVENANCE_STACK / species or biome provenance may affect presentation and recipes | Core Required / Temperate Heartland / Forestry |
| leyforge.core.item.family.natural.wood.softwood_log | Softwood Log and Branch Family | Resinous boreal and upland timber for framing, fuel, poles, route works and pitch. | PROVENANCE_STACK / moisture and species facets | Core Required / Moorland/Boreal Frontier |
| leyforge.core.item.family.natural.wood.ancient_heartwood | Ancient Heartwood Family | Limited old-growth material used by restoration, specialist construction, magic and lore-linked projects. | PROVENANCE_STACK / protected-source and legality facets | Core Conditional / Ancient Oakwood / Spirit States |
| leyforge.core.item.family.natural.wood.mistwood_timber | Mistwood Timber Family | Moisture-adapted woodland material for wetland, medicine, ward and cultural applications. | PROVENANCE_STACK / treatment and moisture state | Core Required / Mistwood / Mirelight |
| leyforge.core.item.family.natural.wood.worldroot_fragment | Worldroot Fragment Family | Recovered root material connecting root caves, colossal roots, restoration and realm foreshadowing. | PROVENANCE_STACK / living, dormant, blighted and cleansed facets | Core Required / Root Caves / Adventure |
| leyforge.core.item.family.natural.fibre.plant_fibre | Common Plant Fibre Family | Early cordage, wrapping, filters, baskets, paper and simple textiles. | SIMPLE_STACK / dryness and treatment variants by concrete entry | Core Required / All Overworld Packages |
| leyforge.core.item.family.natural.fibre.bast_fibre | Bast and Bark Fibre Family | Durable tree-derived fibre for rope, sacks, reinforcement and culture goods. | PROVENANCE_STACK / processed grade | Core Required / Forestry / Trade |
| leyforge.core.item.family.natural.fibre.reed_cane | Reed and Cane Family | Wetland building, matting, baskets, filters, paper, medicine and stilt-settlement supply. | PROVENANCE_STACK / wet, dried and treated concrete entries | Core Required / Wetland/Flood Basin |
| leyforge.core.item.family.natural.fibre.textile_crop | Textile Crop Fibre Family | Cultivated fibre input for cloth, bandages, sails only through Set 26 extensions, and settlement goods. | PROVENANCE_STACK / crop quality and retting state | Core Required / Agriculture / Textile |
| leyforge.core.item.family.natural.fibre.wool | Raw Wool and Fleece Family | Renewable animal fibre for clothing, bedding, insulation, trade and morale goods. | QUALITY_STACK / cleanliness and grade | Core Required / Herd/Domestic Ecology |
| leyforge.core.item.family.natural.hide.raw | Raw Hide Family | Perishable animal skin used for leather, parchment, containers and equipment. | SPOILAGE_STACK / species, condition and lawful-source provenance | Core Required / Creature Resources |
| leyforge.core.item.family.natural.resin.tree_resin | Tree Resin Family | Adhesive, sealant, incense, medicine, fuel additive and alchemical input. | PROVENANCE_STACK / purity and contamination | Core Required / Forestry / Magic |
| leyforge.core.item.family.natural.resin.pitch_tar | Pitch and Tar Family | Weatherproofing, road, repair, fire and machine-maintenance input. | CONTAINER_STACK / flammable hazard and treatment state | Core Required / Industry / Routes |
| leyforge.core.item.family.natural.seed.staple_grain | Staple Grain Seed Family | Renewable agriculture seed for food, feed, trade and settlement provisions. | BIOLOGICAL_STACK / variety, season and disease facets | Core Required / Agriculture / Provisions |
| leyforge.core.item.family.natural.seed.root_crop | Root-Crop Seed and Tuber Family | Cold- and poor-soil compatible staple propagation and emergency food source. | BIOLOGICAL_STACK / variety and viability | Core Required / Agriculture / Frontier |
| leyforge.core.item.family.natural.seed.orchard | Orchard Seed and Graft Family | Longer-term fruit production and settlement orchard projects. | BIOLOGICAL_STACK / graft quality and dormancy | Core Required / Temperate Agriculture |
| leyforge.core.item.family.natural.seed.herb | Medicinal and Culinary Herb Seed Family | Propagates approved medicine, cooking and ward-support herbs. | BIOLOGICAL_STACK / known-use and culture facets | Core Required / Health / Agriculture |
| leyforge.core.item.family.natural.forage.wild_berry | Wild Berry and Small-Fruit Family | Immediate forage, preserves, dyes, wildlife food and settlement fallback provisions. | SPOILAGE_STACK / freshness and contamination | Core Required / Surface Biomes |
| leyforge.core.item.family.natural.forage.edible_mushroom | Edible Mushroom Family | Cave and forest food supporting underground survival and trade. | SPOILAGE_STACK / toxicity identification and freshness | Core Required / Forest / Fungal Cavern |
| leyforge.core.item.family.natural.forage.medicinal_fungus | Medicinal Fungus Family | Health, antidote, cleansing and alchemical input sourced from damp or underground environments. | PROVENANCE_STACK / potency and contamination | Core Required / Health / Underground |
| leyforge.core.item.family.natural.forage.medicinal_herb | Medicinal Herb Family | Common healing, fever, wound and settlement infirmary supply. | PROVENANCE_STACK / potency and freshness | Core Required / Health / Surface Biomes |
| leyforge.core.item.family.natural.forage.cleansing_herb | Cleansing Herb Family | Counter-corruption, ward maintenance and environmental restoration input. | PROVENANCE_STACK / purity and blight exposure | Core Required / Magic / Health |
| leyforge.core.item.family.natural.forage.dye_pigment | Natural Dye and Pigment Family | Culture presentation, banners, textiles, mapmaking and decorative crafting. | SIMPLE_STACK / colour family as concrete definition | Core Required / Culture / Craft |
| leyforge.core.item.family.natural.soil.compost | Compost and Soil Amendment Family | Recycles organic by-products into crop fertility, settlement sanitation and land restoration. | BULK_STACK / maturity and contamination state | Core Required / Agriculture / Settlement |

# 16. Stone, Aggregate, Ceramic and Glass Inputs

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.mineral.stone.common_fragment | Common Stone Fragment Family | Hand-gathered and mined stone input for primitive tools, rubble, masonry and repair. | SIMPLE_STACK / source family and grade facets | Core Required / All Overworld Packages |
| leyforge.core.item.family.mineral.stone.limestone_chunk | Limestone Chunk Family | Lime, mortar, masonry, filtration and karst-specific trade input. | PROVENANCE_STACK / fossil and purity facets | Core Required / Karst / Industry |
| leyforge.core.item.family.mineral.stone.deepstone_chunk | Deepstone Chunk Family | Dense underground material for reinforced construction and specialist tools. | PROVENANCE_STACK / pressure and hazard facets | Core Required / Underground/Deepstone |
| leyforge.core.item.family.mineral.stone.riftstone_chunk | Riftstone Chunk Family | Geothermal stone input for heat-resistant construction, alchemy and site restoration. | PROVENANCE_STACK / heat and instability state | Core Required / Geothermal Riftlands |
| leyforge.core.item.family.mineral.stone.travertine_chunk | Travertine Chunk Family | Decorative and practical mineral stone used by baths, shrines, civic works and trade. | PROVENANCE_STACK / wet, raw and polished concrete entries | Core Required / Geothermal / Culture |
| leyforge.core.item.family.mineral.crystal.matrix_shard | Crystal-Matrix Shard Family | Resonant cavern material for research, instruments, mana interfaces and risky refinement. | PROVENANCE_STACK / resonance, purity and instability | Core Required / Crystal Cavern / Magic |
| leyforge.core.item.family.mineral.salvage.machine_strata | Machine-Strata Salvage Family | Ancient engineered stone-metal salvage for research, repair and restored industry. | PROVENANCE_STACK / identified, sealed and unstable facets | Core Required / Machine Strata / Adventure |
| leyforge.core.item.family.mineral.aggregate.sand | Sand and Fine Aggregate Family | Glass, mortar, ceramics, filtration and construction input. | BULK_STACK / source and contamination facets | Core Required / River/Coast/Wetland |
| leyforge.core.item.family.mineral.aggregate.gravel | Gravel and Coarse Aggregate Family | Road fill, drainage, concrete-like mixes, filtration and prospecting by-product. | BULK_STACK / grade and mineral clue facets | Core Required / Routes / Industry |
| leyforge.core.item.family.mineral.earth.clay | Raw Clay Family | Brick, ceramic, tile, vessel and seal material. | BULK_STACK / moisture and purity state | Core Required / Wetland / Clayworks |
| leyforge.core.item.family.mineral.ceramic.fired_brick | Fired Brick and Tile Unit Family | Construction, kiln, roof, drain and heat-resistant component. | SIMPLE_STACK / material and shape concrete entries | Core Required / Clayworks / Building |
| leyforge.core.item.family.mineral.ceramic.vessel | Ceramic Vessel Family | Food, medicine, water, dye, alchemy and trade container. | CONTAINER_INSTANCE / sealed contents and breakage state | Core Required / Craft / Settlement |
| leyforge.core.item.family.mineral.binder.mortar | Mortar, Lime and Binder Family | Masonry, repair, plaster, road and structure-restoration input. | BULK_STACK / setting and quality grade | Core Required / Construction / Restoration |
| leyforge.core.item.family.mineral.glass.glasswork | Glasswork Material Family | Windows, lenses, bottles, instruments, mana devices and display cases. | SIMPLE_STACK / clear, coloured, reinforced concrete entries | Core Required / Glass / Magic / UI |

# 17. Metals, Salvage and Industrial Materials

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.metal.copper.raw_ore | Raw Copper Ore Family | Primary early mechanical ore input from mining, salvage or trade. | PROVENANCE_STACK / grade and source | Core Required / CAP-03 / Extraction |
| leyforge.core.item.family.metal.copper.ingot | Copper Ingot Family | Refined copper base for tools, plates, wire, gears, vessels and trade. | QUALITY_STACK / purity and maker provenance | Core Required / CAP-03 / Refinement |
| leyforge.core.item.family.metal.copper.plate | Copper Plate Family | Machine casing, conduit, roof, repair and craft component. | QUALITY_STACK / thickness and quality | Core Required / Automation / Building |
| leyforge.core.item.family.metal.copper.wire | Copper Wire and Connector Family | Control, signal, basic power and mana-interface component. | SIMPLE_STACK / gauge as concrete definition | Core Required / Automation / Magic |
| leyforge.core.item.family.metal.copper.gear | Copper Gear and Mechanism Family | Early automation, clocks, sorters, mills and repair component. | QUALITY_STACK / wear and precision | Core Required / CAP-03 / Automation |
| leyforge.core.item.family.metal.copper.fastener | Copper Fastener Family | Nails, rivets, straps and repair hardware for early structures and machines. | BULK_STACK / form as concrete definition | Core Required / Construction / Automation |
| leyforge.core.item.family.metal.copper.alloy_branch | Copper-Alloy Branch Family | Optional capability-equivalent alloy path, including any later approved bronze-like entries, without making one named alloy universal. | QUALITY_STACK / recipe- and culture-owned concrete entries | Core Conditional / Capability Alternatives / 25J |
| leyforge.core.item.family.metal.iron.raw_ore | Raw Iron Ore Family | Structural and tool-capability ore from mines, salvage, trade or restored industry. | PROVENANCE_STACK / grade and source | Core Required / CAP-04 / Extraction |
| leyforge.core.item.family.metal.iron.ingot | Iron Ingot Family | Refined structural metal for tools, defence, machines, construction and settlement supply. | QUALITY_STACK / purity and maker provenance | Core Required / CAP-04 / Refinement |
| leyforge.core.item.family.metal.iron.plate | Iron Plate Family | Frames, armour, gates, machine casings and major repair component. | QUALITY_STACK / thickness and quality | Core Required / Industry / Defence |
| leyforge.core.item.family.metal.iron.rod | Iron Rod and Bar Family | Shafts, reinforcement, tools, fasteners and structural components. | QUALITY_STACK / shape and grade | Core Required / Industry / Construction |
| leyforge.core.item.family.metal.iron.fastener | Iron Fastener Family | Nails, bolts, rivets, chains and settlement repair stock. | BULK_STACK / form as concrete definition | Core Required / Settlement / Industry |
| leyforge.core.item.family.metal.iron.tool_blank | Iron Tool and Weapon Blank Family | Forged head, blade or body awaiting finishing and assembly. | QUALITY_STACK / intended role and maker provenance | Core Required / Craft / Equipment |
| leyforge.core.item.family.metal.iron.frame | Iron Structural Frame Family | Machine, gate, bridge, warehouse and project component. | BULK_STACK / quality and dimension concrete entries | Core Required / Automation / Civilisation |
| leyforge.core.item.family.metal.precious.silver_family | Silver and Conductive Precious-Metal Family | Specialist trade, ward, creature counter and magical component without universal power scaling. | PROVENANCE_STACK / purity, legality and cultural value | Core Conditional / Magic / Trade |
| leyforge.core.item.family.metal.precious.gold_family | Gold and Ceremonial Precious-Metal Family | Currency reserve, ritual, ornament, relic restoration and high-value trade input. | PROVENANCE_STACK / purity and claim state | Core Conditional / Trade / Culture / Relics |
| leyforge.core.item.family.metal.salvage.mixed_scrap | Mixed Metal Scrap Family | Recoverable copper, iron and machine material from ruins, constructs, damaged equipment and events. | PROVENANCE_STACK / contamination and recoverable fractions | Core Required / Salvage / Repair |

# 18. Fuel, Power and Portable Energy

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.fuel.firewood_bundle | Firewood Bundle Family | Accessible fuel, settlement heating and emergency supply produced from timber. | BULK_STACK / moisture and species facets | Core Required / Survival / Settlement |
| leyforge.core.item.family.fuel.charcoal | Charcoal Family | Renewable higher-efficiency fuel and metalworking input. | SIMPLE_STACK / quality and ash yield | Core Required / Industry / Forestry |
| leyforge.core.item.family.fuel.coal | Coal and Carbon Fuel Family | Mining-derived fuel, metalworking, filters and industrial trade input. | PROVENANCE_STACK / grade and impurity | Core Required / Underground / Industry |
| leyforge.core.item.family.fuel.peat | Cut Peat Fuel Family | Wetland and moor fuel supporting regional alternatives and trade. | BULK_STACK / wet and dried states | Core Required / Wetland / Moorland |
| leyforge.core.item.family.fuel.lamp_oil | Lamp Oil Family | Lighting, field use and selected crafting input. | CONTAINER_STACK / flammable contents and purity | Core Required / Settlement / Exploration |
| leyforge.core.item.family.fuel.resin_pitch | Resin-Pitch Fuel and Sealant Family | Dual-use fire, repair, waterproofing and machine-maintenance material. | CONTAINER_STACK / flammability and treatment | Core Required / Forestry / Routes |
| leyforge.core.item.family.fuel.mana_charge | Portable Mana Charge Family | Standardised charge-bearing item for approved mana infrastructure and devices. | CHARGED_STACK / capacity, purity and owner facets | Core Required / Magic / Automation |
| leyforge.core.item.family.fuel.emergency_heat_pack | Emergency Heat and Survival Fuel Pack | Prepared frontier supply for cold, disaster, rescue and caravan use. | SIMPLE_STACK / expiry only when contents require it | Core Required / Frontier / Trade |

# 19. Food, Water, Medicine and Settlement Health

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.food.raw.grain | Harvested Grain Family | Staple food, flour, brewing/fermentation where later approved, seed reserve and animal feed. | SPOILAGE_STACK / dryness and contamination | Core Required / Agriculture / Provisions |
| leyforge.core.item.family.food.processed.flour | Flour and Meal Family | Bread, porridge, thickening and settlement food-production input. | SPOILAGE_STACK / grade and pest exposure | Core Required / Cooking / Settlement |
| leyforge.core.item.family.food.cooked.bread | Bread and Baked Staple Family | Portable everyday food and settlement provision with culture variants. | SPOILAGE_STACK / freshness and quality | Core Required / Cooking / Culture |
| leyforge.core.item.family.food.cooked.porridge | Porridge and Grain-Pot Family | Low-complexity cooked staple for survival and communal kitchens. | SPOILAGE_STACK / recipe and quality | Core Required / Cooking / Settlement |
| leyforge.core.item.family.food.raw.root_vegetable | Root Vegetable Family | Reliable crop and forage food with long storage and regional variants. | SPOILAGE_STACK / freshness and disease | Core Required / Agriculture / Frontier |
| leyforge.core.item.family.food.raw.orchard_fruit | Orchard Fruit Family | Fresh food, preserves, trade and morale input. | SPOILAGE_STACK / ripeness and bruising | Core Required / Temperate Agriculture |
| leyforge.core.item.family.food.raw.berry | Berry and Small-Fruit Food Family | Immediate forage, preserves, cooking and medicine ingredient. | SPOILAGE_STACK / freshness and toxicity knowledge | Core Required / Surface Biomes |
| leyforge.core.item.family.food.raw.mushroom | Edible Mushroom Food Family | Forest and cave food with identification and preparation requirements. | SPOILAGE_STACK / identified, fresh and contaminated states | Core Required / Forest / Underground |
| leyforge.core.item.family.food.raw.meat | Raw Meat Family | Hunting, livestock and creature-derived food input with source provenance. | SPOILAGE_STACK / species, freshness and lawful source | Core Required / Ecology / Cooking |
| leyforge.core.item.family.food.raw.egg | Egg Family | Domestic food, baking and breeding-related settlement good. | SPOILAGE_STACK / freshness and fertilised flag where relevant | Core Required / Domestic Ecology |
| leyforge.core.item.family.food.raw.milk | Milk and Fresh Dairy Input Family | Renewable nutrition, cooking and culture-good input. | CONTAINER_STACK / spoilage, source and cleanliness | Core Required / Domestic Ecology |
| leyforge.core.item.family.food.processed.fat | Rendered Fat and Tallow Family | Cooking, preservation, candles, medicine and craft input. | CONTAINER_STACK / food-grade and industrial-grade concrete entries | Core Required / Cooking / Craft |
| leyforge.core.item.family.food.cooked.stew | Stew and Communal Meal Family | Flexible meal that accepts capability-approved ingredients and supports communal kitchens. | SPOILAGE_STACK / recipe provenance and serving count | Core Required / Settlement / Cooking |
| leyforge.core.item.family.food.preserved.dried | Dried Food Family | Travel, caravan, dungeon and emergency supply. | SPOILAGE_STACK / long-life and packaging state | Core Required / Trade / Exploration |
| leyforge.core.item.family.food.preserved.pickled | Pickled and Brined Food Family | Long-term vegetable, fungus and selected protein preservation. | CONTAINER_STACK / sealed and contamination state | Core Required / Settlement / Trade |
| leyforge.core.item.family.food.preserved.smoked | Smoked and Cured Food Family | Long-life protein and cultural trade good. | SPOILAGE_STACK / cure quality and source | Core Required / Settlement / Frontier |
| leyforge.core.item.family.food.ration.travel | Travel Ration Family | Standardised route, guard, rescue and adventure provision. | SIMPLE_STACK / packaged serving and provenance | Core Required / Routes / Defence |
| leyforge.core.item.family.food.feed.animal | Animal Feed Family | Livestock, work-beast and emergency wildlife-care input. | BULK_STACK / nutrition class and contamination | Core Required / Agriculture / Ecology |
| leyforge.core.item.family.water.container.clean | Clean Water Container Family | Player, caravan, medicine and emergency water supply without making the item the canonical water-source definition. | CONTAINER_INSTANCE / volume, cleanliness and owner | Core Required / Survival / Health |
| leyforge.core.item.family.health.bandage | Bandage and Dressing Family | Basic wound treatment and settlement infirmary supply. | SIMPLE_STACK / cleanliness and quality | Core Required / Health / Textile |
| leyforge.core.item.family.health.poultice | Medicinal Poultice Family | Herbal wound, swelling and minor-status treatment. | SPOILAGE_STACK / potency and contamination | Core Required / Health / Herbs |
| leyforge.core.item.family.health.tonic | Medicinal Tonic Family | Prepared treatment for approved illnesses, fatigue or environmental effects. | CONTAINER_STACK / dose, potency and expiry | Core Required / Health / Alchemy |
| leyforge.core.item.family.health.antidote | Antidote and Antivenom Family | Counters defined toxin/venom classes using source-supported ingredients. | CONTAINER_STACK / target class and potency | Core Required / Health / Creature Resources |
| leyforge.core.item.family.health.cleansing_salve | Cleansing Salve Family | Treats bounded corruption/blight exposure and supports restoration. | CONTAINER_STACK / purity, target and expiry | Core Required / Health / Magic |

# 20. Creature Products, Samples and Trophies

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.creature.food.game_meat | Game Meat Resource Family | Lawful hunting output supporting food, trade and ecology feedback. | SPOILAGE_STACK / species and harvest provenance | Core Required / Wildlife / Provisions |
| leyforge.core.item.family.creature.material.hide | Creature Hide Family | Skin material for leather, tents, packs, armour and trade. | SPOILAGE_STACK / species, condition and legality | Core Required / Wildlife / Equipment |
| leyforge.core.item.family.creature.material.leather | Processed Leather Family | Durable equipment, containers, belts, books and machine part. | QUALITY_STACK / tanning method and maker | Core Required / Craft / Equipment |
| leyforge.core.item.family.creature.material.bone | Bone and Dense Skeletal Material Family | Tools, glue, carvings, fertiliser, wards and research. | PROVENANCE_STACK / species and condition | Core Required / Creature Resources |
| leyforge.core.item.family.creature.material.horn_antler | Horn and Antler Family | Handles, instruments, trophies, medicine and magical components. | PROVENANCE_STACK / species and lawful source | Core Required / Wildlife / Culture |
| leyforge.core.item.family.creature.material.feather | Feather and Quill Family | Arrows, writing, insulation, ornament and ecology clues. | SIMPLE_STACK / species and quality facets | Core Required / Wildlife / Knowledge |
| leyforge.core.item.family.creature.material.chitin | Chitin and Carapace Family | Armour, tools, filters, alchemy and construct-like components. | PROVENANCE_STACK / species and damage | Core Required / Hostile/Underground Ecology |
| leyforge.core.item.family.creature.material.silk | Natural Silk and Web Fibre Family | Textiles, traps, filters, medicine and automation belts. | QUALITY_STACK / tensile grade and contamination | Core Required / Cavern Weaver / Craft |
| leyforge.core.item.family.creature.reagent.venom | Venom and Toxin Family | Antidote, alchemy, traps and combat consumable input with strict target classes. | CONTAINER_STACK / potency, source and legality | Core Required / Hostile Ecology / Health |
| leyforge.core.item.family.creature.reagent.gland | Creature Gland and Secretion Family | Medicine, scent, alchemy, bait and ecology-research input. | SPOILAGE_STACK / source and potency | Core Required / Creature Resources |
| leyforge.core.item.family.creature.material.tallow | Creature Fat and Tallow Family | Food, candles, waterproofing, medicine and craft input. | CONTAINER_STACK / food-grade and industrial-grade entries | Core Required / Creature Resources |
| leyforge.core.item.family.creature.material.shell_scale | Shell, Scale and Plate Family | Armour, shields, tools, ornament and specialist construction. | PROVENANCE_STACK / species and integrity | Core Required / Creature Resources |
| leyforge.core.item.family.creature.magic.essence | Magical Creature Essence Family | Bounded magic, research, rune and ritual input from approved magical creatures. | CHARGED_STACK / affinity, purity and source | Core Required / Magical Ecology / Magic |
| leyforge.core.item.family.creature.magic.spirit_mote | Spirit Mote and Memory Trace Family | Non-material spirit evidence for dialogue, remembrance, cleansing and history. | PROVENANCE_STACK / consent, source and stability | Core Required / Spirit Ecology / Narrative |
| leyforge.core.item.family.creature.magic.rune_antler_fragment | Runic Antler and Inscribed Growth Family | Readable magical-creature material for study, focus construction and lawful trophies. | PROVENANCE_STACK / pattern and source | Core Required / Rune-Antler Ecology |
| leyforge.core.item.family.creature.crystal.carapace | Crystal Carapace and Burrower Shard Family | Resonant armour, lens, tool and mana-interface material. | PROVENANCE_STACK / resonance and fracture | Core Required / Crystal Burrower / Underground |
| leyforge.core.item.family.creature.undead.residue | Undead Residue Family | Research, cleansing, ward maintenance and forbidden-use risk record. | HAZARD_STACK / contamination, legality and containment | Core Required / Undead Ecology / Magic |
| leyforge.core.item.family.creature.corruption.sample | Corruption Sample Family | Sealed research and cleansing input that carries spread and legal risks. | HAZARD_CONTAINER / strain, stability and custody | Core Required / Corruption Ecology / Health |
| leyforge.core.item.family.creature.construct.scrap | Construct Scrap Family | Metal, stone, rune and component salvage from damaged constructs. | PROVENANCE_STACK / owner, claim and recoverable parts | Core Required / Construct Ecology / Automation |
| leyforge.core.item.family.creature.construct.core | Construct Core and Control Fragment Family | Repair, research, personhood evidence and advanced automation input. | UNIQUE_OR_STACK / identity, memory and ownership safeguards | Core Conditional / Construct Ecology / Personhood |
| leyforge.core.item.family.creature.nest.material | Nest and Habitat Material Family | Ecology clue, bait, farming, research and restoration input collected without erasing habitat state. | PROVENANCE_STACK / nest, species and legality | Core Required / Ecology / World State |
| leyforge.core.item.family.creature.research.specimen | Creature Research Specimen Family | Tagged sample supporting Codex, medicine, ecology and quest progress. | PROVENANCE_CONTAINER / source, method and chain of custody | Core Required / Research / Knowledge |
| leyforge.core.item.family.creature.trophy.common | Common Creature Trophy Family | Display, reputation, hunting record and culture use without implying every kill yields a trophy. | PROVENANCE_INSTANCE / lawful source and display state | Core Required / Culture / Hunting |
| leyforge.core.item.family.creature.capture.nonperson | Non-Person Creature Handling Token Family | Represents approved tame, transport or husbandry permissions without converting persons into inventory. | CONTRACT_INSTANCE / target entity reference and welfare state | Core Conditional / Taming / Personhood Boundary |

# 21. Tools, Instruments and Work Equipment

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.tool.harvest.axe | Axe Tool Family | Tree felling, branch harvesting, carpentry and selected combat use. | DURABLE_INSTANCE / material, quality, condition and enchantment facets | Core Required / Forestry / Survival |
| leyforge.core.item.family.tool.harvest.pickaxe | Pickaxe Tool Family | Stone, ore and hard-block mining with capability-based tool requirements. | DURABLE_INSTANCE / material and tool-capability band | Core Required / Mining / Survival |
| leyforge.core.item.family.tool.harvest.shovel | Shovel Tool Family | Soil, clay, sand, snow and aggregate gathering and terrain work. | DURABLE_INSTANCE / material and efficiency | Core Required / Terrain / Agriculture |
| leyforge.core.item.family.tool.harvest.hoe | Hoe and Cultivator Tool Family | Field preparation, crop care, soil improvement and irrigation work. | DURABLE_INSTANCE / material and agriculture capability | Core Required / Agriculture |
| leyforge.core.item.family.tool.harvest.sickle | Sickle and Reaping Tool Family | Crop, reed, herb and fibre harvesting with reduced damage. | DURABLE_INSTANCE / material and harvest profile | Core Required / Agriculture / Wetland |
| leyforge.core.item.family.tool.harvest.knife | Utility Knife Family | Harvesting, food preparation, carving, hide processing and field utility. | DURABLE_INSTANCE / material and sanitation state | Core Required / Survival / Craft |
| leyforge.core.item.family.tool.build.hammer | Builder Hammer Family | Construction, repair, project contribution and component assembly. | DURABLE_INSTANCE / material, quality and project permissions | Core Required / Building / Settlement |
| leyforge.core.item.family.tool.build.saw | Saw Tool Family | Timber conversion, construction, furniture and machine-component production. | DURABLE_INSTANCE / blade material and condition | Core Required / Forestry / Industry |
| leyforge.core.item.family.tool.build.chisel | Masonry and Carving Chisel Family | Stone shaping, inscription, restoration and archaeology interaction. | DURABLE_INSTANCE / tip material and role | Core Required / Construction / Adventure |
| leyforge.core.item.family.tool.build.trowel | Trowel and Masonry Tool Family | Mortar, brick, plaster, repair and detailed construction. | DURABLE_INSTANCE / material and cleanliness | Core Required / Construction |
| leyforge.core.item.family.tool.engineering.wrench | Wrench and Configuration Tool Family | Machine rotation, port configuration, repair, ownership-safe dismantling and diagnostics. | DURABLE_INSTANCE / permission and tool-capability band | Core Required / Automation |
| leyforge.core.item.family.tool.engineering.prospecting | Prospecting Hammer and Sample Kit Family | Reads surface clues, grades and deposit context without revealing hidden guarantees. | DURABLE_INSTANCE / knowledge and calibration | Core Required / Mining / Exploration |
| leyforge.core.item.family.tool.engineering.survey_lens | Survey Lens and Measurement Tool Family | Terrain, route, structure, leyline and machine inspection. | DURABLE_OR_CHARGED / calibration and knowledge state | Core Required / Worldgen / Engineering |
| leyforge.core.item.family.tool.engineering.salvage | Salvage and Dismantling Tool Family | Recovers components from ruins, machines and structures according to ownership and damage rules. | DURABLE_INSTANCE / claim, skill and target profile | Core Required / Adventure / Automation |
| leyforge.core.item.family.tool.engineering.repair_kit | Field Repair Kit Family | Portable bounded repair for tools, machines, blocks and route infrastructure. | CONSUMABLE_OR_DURABLE / charge count and compatibility | Core Required / Repair / Settlement |
| leyforge.core.item.family.tool.agriculture.pruning | Pruning and Grafting Tool Family | Orchard, living structure and plant-health interaction. | DURABLE_INSTANCE / cleanliness and plant compatibility | Core Required / Agriculture / Verdant |
| leyforge.core.item.family.tool.animal.handling | Animal Handling Tool Family | Feeding, leading, grooming, veterinary and husbandry interactions. | DURABLE_INSTANCE / welfare and species compatibility | Core Required / Domestic Ecology |
| leyforge.core.item.family.tool.health.medical_kit | Medical Kit Family | Treatment, diagnosis and settlement-health work using valid supplies. | CONTAINER_INSTANCE / contents, cleanliness and owner | Core Required / Health / NPC Jobs |
| leyforge.core.item.family.tool.magic.rune_chisel | Rune Chisel Family | Creates or repairs approved rune inscriptions on supported substrates. | DURABLE_INSTANCE / rune knowledge and material compatibility | Core Required / Magic / Craft |
| leyforge.core.item.family.tool.magic.rune_tuner | Rune Tuner Family | Configures mana, ward and control networks without owning the network state. | CHARGED_DURABLE / calibration and access permissions | Core Required / Magic / Automation |
| leyforge.core.item.family.tool.magic.ward_key | Ward Key and Access Focus Family | Authorised inspection, bypass, repair or rekeying of warded infrastructure. | UNIQUE_OR_DURABLE / owner, faction and permission state | Core Required / Magic / Ownership |
| leyforge.core.item.family.tool.navigation.mapmaking_kit | Mapmaking and Survey Kit Family | Creates maps, route notes, markers and expedition records from discovered information. | CONTAINER_INSTANCE / tools, media and knowledge state | Core Required / Routes / UI |
| leyforge.core.item.family.tool.build.blueprint_tool | Blueprint Planning Tool Family | Captures, previews, validates and commissions approved structure blueprints. | DURABLE_OR_KNOWLEDGE / blueprint references and permissions | Core Required / Blueprint / Forge |
| leyforge.core.item.family.tool.utility.container | Bucket, Flask and General Container Tool Family | Carries approved fluids, powders, samples and supplies with volume and contamination rules. | CONTAINER_INSTANCE / contents, seal, cleanliness and material | Core Required / Survival / Craft |

# 22. Weapons, Armour and Personal Equipment

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.equipment.weapon.sword | Sword and Long-Blade Family | Dedicated close-combat weapon with material and culture variants. | DURABLE_INSTANCE / quality, condition, provenance and enchantment | Core Required / Combat / Craft |
| leyforge.core.item.family.equipment.weapon.axe | Combat Axe Family | Weapon-focused axe variants distinct from ordinary harvesting tools where behaviour differs. | DURABLE_INSTANCE / quality and combat profile | Core Required / Combat / Craft |
| leyforge.core.item.family.equipment.weapon.hammer_mace | Hammer and Mace Weapon Family | Impact weapon for armoured, construct and structure interactions. | DURABLE_INSTANCE / quality and damage profile | Core Required / Combat / Defence |
| leyforge.core.item.family.equipment.weapon.spear | Spear and Polearm Family | Reach weapon, hunting tool and guard equipment with culture variants. | DURABLE_INSTANCE / shaft/head quality | Core Required / Combat / Hunting |
| leyforge.core.item.family.equipment.weapon.bow | Bow Family | Ranged hunting and combat weapon using physical ammunition. | DURABLE_INSTANCE / draw class and condition | Core Required / Combat / Hunting |
| leyforge.core.item.family.equipment.weapon.crossbow | Crossbow Family | Heavier ranged weapon and settlement-defence option. | DURABLE_INSTANCE / mechanism quality and reload profile | Core Conditional / Combat / Defence |
| leyforge.core.item.family.equipment.weapon.thrown | Thrown Weapon Family | Knives, darts or approved thrown tools with recoverability rules. | DURABLE_STACK_OR_INSTANCE / recovery and ownership | Core Required / Combat / Hunting |
| leyforge.core.item.family.equipment.defence.shield | Shield Family | Active defence, guard supply and culture presentation. | DURABLE_INSTANCE / material, integrity and coverage | Core Required / Combat / Defence |
| leyforge.core.item.family.equipment.magic.focus | Spell Focus Family | Wand, staff, rod or focus variants that support but do not replace spell knowledge. | CHARGED_DURABLE / affinity, capacity and quality | Core Required / Magic / Combat |
| leyforge.core.item.family.equipment.armour.light | Light Armour Family | Mobility-focused hide, textile, chitin or mixed armour. | DURABLE_INSTANCE / body slot, quality and condition | Core Required / Combat / Craft |
| leyforge.core.item.family.equipment.armour.medium | Medium Armour Family | Balanced layered armour for exploration, guards and specialists. | DURABLE_INSTANCE / body slot, quality and condition | Core Required / Combat / Defence |
| leyforge.core.item.family.equipment.armour.heavy | Heavy Armour Family | High-protection iron or approved specialist armour with movement and maintenance costs. | DURABLE_INSTANCE / body slot, quality and condition | Core Required / Combat / Industry |
| leyforge.core.item.family.equipment.armour.robe | Robe and Ritual Garment Family | Magic, culture, medicine and ceremony clothing with low physical protection. | DURABLE_INSTANCE / body slot, culture and enchantment | Core Required / Magic / Culture |
| leyforge.core.item.family.equipment.clothing.environmental | Environmental Clothing Family | Cold, wetland, heat, cave and contamination protection. | DURABLE_INSTANCE / environment tags and condition | Core Required / Survival / Exploration |
| leyforge.core.item.family.equipment.accessory.backpack | Backpack and Carry Container Family | Inventory expansion with physical capacity, ownership and upgrade rules. | CONTAINER_EQUIPMENT / slots, condition and owner | Core Required / Inventory / Exploration |
| leyforge.core.item.family.equipment.accessory.tool_belt | Tool Belt and Work Rig Family | Quick-access work equipment and profession identity. | CONTAINER_EQUIPMENT / allowed-item rules | Core Required / Craft / NPC Jobs |
| leyforge.core.item.family.equipment.accessory.cloak | Cloak and Mantle Family | Weather protection, culture presentation and selected magic effects. | DURABLE_INSTANCE / condition and culture variant | Core Required / Survival / Culture |
| leyforge.core.item.family.equipment.accessory.charm | Charm, Ring and Amulet Family | Small persistent modifiers, reputation symbols, keys or magical support without universal rarity scaling. | UNIQUE_OR_DURABLE / slot, provenance and charge | Core Required / Progression / Magic |

# 23. Automation and Machine Components

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.automation.component.frame | Machine Frame Family | Structural base for approved machines and industry projects. | QUALITY_STACK / material and load class | Core Required / Automation / Industry |
| leyforge.core.item.family.automation.component.gear | Gear and Cog Family | Mechanical motion transfer and machine assembly. | QUALITY_STACK / material, size and precision | Core Required / Automation |
| leyforge.core.item.family.automation.component.shaft | Shaft and Axle Family | Rotational transmission and cart/machine assembly. | QUALITY_STACK / material and load class | Core Required / Automation / Routes |
| leyforge.core.item.family.automation.component.bearing | Bearing and Bushing Family | Reduces wear and enables higher-speed machinery. | QUALITY_STACK / material, precision and lubrication | Core Required / Automation |
| leyforge.core.item.family.automation.component.belt | Belt and Flexible Drive Family | Mechanical drive, conveyor and selected processing applications. | QUALITY_STACK / material and tensile rating | Core Required / Automation / Creature Silk |
| leyforge.core.item.family.automation.component.chute | Chute and Gravity-Feed Component Family | Simple bulk-item movement and machine input. | SIMPLE_STACK / material and connection profile | Core Required / Early Automation |
| leyforge.core.item.family.automation.component.pipe | Pipe and Sealed Conduit Component Family | Compact routing for approved fluids, gases or items under system-specific rules. | SIMPLE_STACK / material, diameter and content compatibility | Core Required / Automation / Fluids |
| leyforge.core.item.family.automation.component.filter | Filter and Screen Family | Sorting, purification, ventilation and processing component. | QUALITY_STACK / target tags and wear | Core Required / Automation / Health |
| leyforge.core.item.family.automation.component.sorter | Sorter and Routing Mechanism Family | Priority and filter-based item routing. | DURABLE_INSTANCE / configuration stored in placed block, not loose item | Core Required / Automation |
| leyforge.core.item.family.automation.component.hopper | Hopper and Transfer Interface Family | Inventory-to-machine and machine-to-container transfer component. | QUALITY_STACK / throughput class | Core Required / Automation / Storage |
| leyforge.core.item.family.automation.component.cart_wheel | Cart Wheel and Running Gear Family | Handcart, minecart and route-transport assembly. | QUALITY_STACK / load and terrain class | Core Required / Routes / Automation |
| leyforge.core.item.family.automation.component.rail | Rail and Track Component Family | Minecart and bounded industrial route infrastructure. | BULK_STACK / material and gauge concrete entries | Core Required / Underground / Industry |
| leyforge.core.item.family.automation.component.power_interface | Mechanical Power Interface Family | Crank, wheel, shaft coupling and approved early-power components. | QUALITY_STACK / power class and compatibility | Core Required / Automation / Power |
| leyforge.core.item.family.automation.component.furnace_lining | Furnace and Kiln Lining Family | Heat-resistant maintenance and upgrade component. | BULK_STACK / temperature class and condition | Core Required / Industry / Clayworks |
| leyforge.core.item.family.automation.component.crusher_head | Crusher Head Family | Ore, stone and material-processing component. | DURABLE_INSTANCE / material, wear and target class | Core Required / Industry |
| leyforge.core.item.family.automation.component.saw_blade | Machine Saw Blade Family | Sawmill, workshop and automated timber-processing component. | DURABLE_INSTANCE / material and wear | Core Required / Forestry / Automation |
| leyforge.core.item.family.automation.component.miner_head | Extraction Head Family | Bounded automated-mining component linked to deposit and permission rules. | DURABLE_INSTANCE / material, target class and wear | Core Required / Mining / Automation |
| leyforge.core.item.family.automation.component.maintenance_pack | Machine Maintenance Pack Family | Lubrication, seals, fasteners and repair consumables for machines. | CONSUMABLE_STACK / compatibility and quality | Core Required / Automation / Settlement |
| leyforge.core.item.family.automation.component.logic_switch | Mechanical and Rune Logic Switch Family | Control input for approved machines and networks. | DURABLE_INSTANCE / configuration applied after placement | Core Required / Automation / Magic |
| leyforge.core.item.family.automation.component.sensor | Sensor and Detector Family | Reads inventory, pressure, environment, mana or route conditions through approved interfaces. | DURABLE_INSTANCE / sensor type and calibration | Core Conditional / Automation / Runtime |
| leyforge.core.item.family.automation.component.storage_upgrade | Storage Upgrade Module Family | Capacity, filtering, preservation or security upgrade for compatible storage. | DURABLE_INSTANCE / target class and owner | Core Required / Storage / Automation |
| leyforge.core.item.family.automation.component.mana_coil | Mana Coil and Coupler Family | Connects mechanical machines to approved mana power/control systems. | CHARGED_DURABLE / purity, capacity and insulation | Core Required / Magic / Automation |

# 24. Mana, Runes and Magical Components

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.magic.mana.raw_crystal | Raw Mana Crystal Family | Natural magical resource item retaining source, grade and purity. | PROVENANCE_STACK / purity, resonance and contamination | Core Required / Practical Magic / Worldgen |
| leyforge.core.item.family.magic.mana.shard | Mana Shard Family | Processed or fractured mana unit for devices, crafting and trade. | CHARGED_STACK / capacity and purity | Core Required / Practical Magic |
| leyforge.core.item.family.magic.mana.dust | Mana Dust Family | Fine magical material for runes, inks, alchemy and precision components. | CHARGED_STACK / affinity and contamination | Core Required / Practical Magic |
| leyforge.core.item.family.magic.mana.core | Refined Mana Core Family | Stable charge and machine/ward component requiring approved refinement. | CHARGED_DURABLE / capacity, stability and maker | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.rune.blank | Rune Blank and Substrate Family | Prepared stone, metal, wood, ceramic or realm substrate awaiting inscription. | QUALITY_STACK / substrate compatibility | Core Required / Rune Craft |
| leyforge.core.item.family.magic.rune.ink | Rune Ink and Inscription Medium Family | Physical medium for writing, engraving and stabilising approved runes. | CONTAINER_STACK / affinity, purity and expiry | Core Required / Rune Craft / Knowledge |
| leyforge.core.item.family.magic.rune.control | Control Rune Family | Approved machine, routing, lock or signal function definition represented as an item before installation. | CHARGED_OR_SIMPLE / exact rune definition and quality | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.rune.ward | Ward Rune Family | Protection, warning and boundary function for supported infrastructure. | CHARGED_OR_SIMPLE / exact rune definition and quality | Core Required / Magic / Settlement |
| leyforge.core.item.family.magic.rune.transformation | Transformation Rune Family | Processing, refinement or state-change support under recipe and risk rules. | CHARGED_OR_SIMPLE / exact rune definition and quality | Core Conditional / Magic / Recipes |
| leyforge.core.item.family.magic.glyph.plate | Glyph Plate and Rune Circuit Family | Reusable or installed logical/magical component for machines and structures. | DURABLE_CHARGED / circuit identity and compatibility | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.ward.focus | Ward Focus Family | Core component for wardstones, ward lanterns and protected routes. | CHARGED_DURABLE / coverage class and owner | Core Required / Magic / Safety |
| leyforge.core.item.family.magic.conduit.core | Mana Conduit Core Family | Transmission component for conduits, ports and stabilised machines. | CHARGED_STACK / capacity and insulation | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.storage.battery | Mana Battery Family | Portable or installable charge storage with explicit safe-failure behaviour. | CHARGED_INSTANCE / capacity, purity, owner and condition | Core Required / Magic / Automation |
| leyforge.core.item.family.magic.cleansing.reagent | Cleansing Reagent Family | Purifies bounded corruption, blight, residue or contaminated equipment. | CONTAINER_STACK / target class and potency | Core Required / Magic / Health |
| leyforge.core.item.family.magic.ritual.catalyst | Ritual Catalyst Family | Physical catalyst for approved rituals, route stabilisation and world-state actions. | PROVENANCE_STACK / ritual tags, consent and legality | Core Required / Magic / Events |
| leyforge.core.item.family.magic.knowledge.scroll | Spell and Ritual Scroll Family | Teaches, records or temporarily authorises defined magical knowledge. | KNOWLEDGE_INSTANCE / author, language, use and ownership | Core Required / Magic / Knowledge |
| leyforge.core.item.family.magic.knowledge.spellbook | Spellbook and Grimoire Family | Persistent collection of learned or researchable magic records. | CONTAINER_KNOWLEDGE / entries, owner and condition | Core Required / Magic / Progression |
| leyforge.core.item.family.magic.focus.crystal | Focus Crystal Family | Lens or resonator for personal magic, instruments and devices. | CHARGED_DURABLE / affinity, quality and fracture | Core Required / Magic / Equipment |
| leyforge.core.item.family.magic.seal.key | Magical Seal and Key Family | Access, route, ward or site-state token tied to authoritative records. | UNIQUE_INSTANCE / target reference, owner and expiry | Core Required / Magic / Adventure |
| leyforge.core.item.family.magic.ley.prism | Leyline Tuning Prism Family | Survey, align and stabilise leyline-linked infrastructure. | CHARGED_DURABLE / calibration and site compatibility | Core Required / Leyline / Magic |
| leyforge.core.item.family.magic.route.charge | Realm Route Stabiliser Charge Family | Consumable or rechargeable input for safe route operation and return guarantees. | CHARGED_STACK / route compatibility and stability | Core Required / Realm Access |
| leyforge.core.item.family.magic.hazard.corrupted_shard | Corrupted Magical Shard Family | Contained high-risk resource for research, cleansing or forbidden paths. | HAZARD_STACK / strain, legality and containment | Core Conditional / Corruption / Morality |

# 25. Settlement Supply, Trade and Ownership Records

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.settlement.supply.construction | Construction Supply Bundle Family | Standardised project contribution made from exact underlying materials, never an abstract free resource. | BUNDLE_STACK / manifest of conserved inputs | Core Required / Settlement Projects |
| leyforge.core.item.family.settlement.supply.project_crate | Project Supply Crate Family | Reserved staged-project package with owner, destination and contribution records. | CONTAINER_INSTANCE / manifest, seal and project reference | Core Required / Settlement Projects |
| leyforge.core.item.family.settlement.supply.repair | Settlement Repair Supply Family | Emergency and routine repair package for structures, routes and services. | BUNDLE_STACK / material-class manifest | Core Required / Settlement / Aftermath |
| leyforge.core.item.family.settlement.supply.guard | Guard and Defence Supply Family | Weapons, ammunition, armour, food and maintenance goods reserved for defence. | CONTAINER_INSTANCE / exact contents and permission | Core Required / Defence / Settlement |
| leyforge.core.item.family.settlement.supply.medical | Medical Supply Crate Family | Bandages, medicine, clean containers and health tools for infirmaries and relief. | CONTAINER_INSTANCE / exact contents and expiry | Core Required / Health / Settlement |
| leyforge.core.item.family.settlement.supply.relief_food | Relief and Emergency Food Package Family | Preserved food and water for disaster, shortage, migration and rescue. | CONTAINER_INSTANCE / servings, expiry and destination | Core Required / Events / Settlement |
| leyforge.core.item.family.settlement.supply.seed_stock | Seed Stock and Agricultural Reserve Family | Protected crop, herb and orchard propagation reserve. | CONTAINER_INSTANCE / varieties, viability and ownership | Core Required / Agriculture / Settlement |
| leyforge.core.item.family.settlement.supply.tool_allotment | Profession Tool Allotment Family | Exact tool and repair-stock package for NPC jobs and visiting specialists. | CONTAINER_INSTANCE / job profile and contents | Core Required / NPC Jobs / Economy |
| leyforge.core.item.family.trade.goods.bale | Trade Bale and Bulk-Goods Family | Standardised textiles, fibre, hide, food or craft goods for caravans and warehouses. | BULK_CONTAINER / manifest, provenance and owner | Core Required / Trade / Warehouses |
| leyforge.core.item.family.trade.goods.crate | General Cargo Crate Family | Packaged item cargo compatible with route, warehouse and future expansion interfaces. | CONTAINER_INSTANCE / contents, mass/volume class and owner | Core Required / Trade / Set 26 Compatibility |
| leyforge.core.item.family.trade.record.warehouse_manifest | Warehouse Manifest Family | Authoritative record of deliveries, reservations, ownership and shortages. | CONTRACT_KNOWLEDGE / linked transaction records | Core Required / Storage / UI |
| leyforge.core.item.family.trade.record.delivery_contract | Delivery Contract Family | Defines requested goods, destination, ownership transfer, payment and failure rules. | CONTRACT_INSTANCE / parties, conditions and expiry | Core Required / Trade / Quests |
| leyforge.core.item.family.trade.record.tax_tribute | Tax, Tariff and Tribute Record Family | Physical or digital-facing evidence for lawful or coercive transfers. | CONTRACT_INSTANCE / jurisdiction and transaction link | Core Required / Factions / Economy |
| leyforge.core.item.family.trade.record.permit | Permit and Licence Family | Authorises restricted gathering, trade, salvage, access or profession actions. | UNIQUE_CONTRACT / jurisdiction, holder and expiry | Core Required / Law / Factions |
| leyforge.core.item.family.trade.record.ownership_token | Ownership and Claim Token Family | Portable representation of a persistent claim without making possession alone authoritative. | UNIQUE_CONTRACT / target entity and registry owner | Core Required / Ownership / Multiplayer |
| leyforge.core.item.family.trade.record.faction_seal | Faction Seal and Credential Family | Identity, reputation, diplomatic and access evidence. | UNIQUE_INSTANCE / faction, holder and status | Core Required / Factions / Narrative |
| leyforge.core.item.family.trade.currency.physical | Physical Currency Family | Coins, notes or bars where a world profile uses physical money, separate from abstract reputation. | PROVENANCE_STACK / issuer, denomination and authenticity | Core Required / Economy / Culture |
| leyforge.core.item.family.trade.pack.caravan | Caravan and Expedition Pack Family | Prepared route supplies, replacement parts and trade documents for regional travel. | CONTAINER_INSTANCE / contents, owner and route plan | Core Required / Routes / Trade |

# 26. Culture Signature Goods

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.culture.hearthland.communal_pantry | Hearthland Communal Pantry Goods Family | Preserved staples, shared-kitchen supplies and mutual-aid provisions reflecting Hearthland civic identity. | BUNDLE_OR_CONTAINER / provenance and settlement use | Core Required / Hearthland Commons |
| leyforge.core.item.family.culture.hearthland.hearthward_charm | Hearthland Hearthward Charm Family | Practical household and community protection object linked to approved ward knowledge. | DURABLE_OR_CHARGED / maker and household provenance | Core Required / Hearthland Commons / Magic |
| leyforge.core.item.family.culture.marchroad.route_ledger | Marchroad Route Ledger Family | Survey, toll, road-law and passage record used by route services. | KNOWLEDGE_CONTRACT / edition, jurisdiction and discovered routes | Core Required / Marchroad Leagues |
| leyforge.core.item.family.culture.marchroad.traveller_kit | Marchroad Traveller and Repair Kit Family | Road food, signs, cordage, repair and navigation supplies. | CONTAINER_INSTANCE / exact contents and owner | Core Required / Marchroad Leagues |
| leyforge.core.item.family.culture.brassroot.calibration_set | Brassroot Calibration Set Family | Precision gauges, templates and repair components supporting craft and automation expertise. | CONTAINER_DURABLE / calibration and maker mark | Core Required / Brassroot Communes |
| leyforge.core.item.family.culture.brassroot.craft_mark | Brassroot Craft-Mark Component Family | Certified maker, repair, personhood or provenance token attached to approved creations. | UNIQUE_OR_STACK / issuer and target definition | Core Required / Brassroot Communes |
| leyforge.core.item.family.culture.deepstone.hall_ration | Deepstone Hall-Ration Family | Dense preserved provision for underground work, travel and settlement resilience. | SPOILAGE_STACK / recipe and hall provenance | Core Required / Deepstone Compacts |
| leyforge.core.item.family.culture.deepstone.survey_token | Deepstone Survey and Claim Token Family | Mine, water, heat and tunnel survey evidence used by compacts and trade partners. | KNOWLEDGE_CONTRACT / site and jurisdiction | Core Required / Deepstone Compacts |
| leyforge.core.item.family.culture.mirelight.medicine_satchel | Mirelight Medicine Satchel Family | Wetland medicine, antidote and cleansing supplies reflecting local expertise. | CONTAINER_INSTANCE / contents, expiry and healer mark | Core Required / Mirelight Covenants |
| leyforge.core.item.family.culture.mirelight.reedwork_bundle | Mirelight Reedwork Goods Family | Mats, baskets, filters, light structures and trade craft. | BULK_STACK / treatment and maker provenance | Core Required / Mirelight Covenants |
| leyforge.core.item.family.culture.verdant.pact_gift | Verdant Pact Gift and Oath Offering Family | Negotiated gift, access and diplomacy item using approved realm materials and meanings. | PROVENANCE_INSTANCE / giver, recipient and oath context | Core Conditional / Verdant Pact Enclaves |
| leyforge.core.item.family.culture.verdant.living_weave | Verdant Living-Weave Goods Family | Thornsilver and living-fibre craft used in clothing, bindings and realm-compatible construction. | QUALITY_STACK / living state, maker and realm provenance | Core Conditional / Verdant Pact Enclaves |

# 27. Knowledge, Maps, Blueprints and Records

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.knowledge.field_journal | Field Journal Family | Player or NPC observations, ecology notes, discoveries and event records. | KNOWLEDGE_INSTANCE / author, language and pages | Core Required / Codex / Narrative |
| leyforge.core.item.family.knowledge.codex_page | Codex Page and Record Fragment Family | Physical discovery that unlocks or supplements authoritative Codex knowledge. | KNOWLEDGE_STACK_OR_INSTANCE / topic and provenance | Core Required / UI / Exploration |
| leyforge.core.item.family.knowledge.recipe_note | Recipe Note and Technique Sheet Family | Unlocks or hints at a specific recipe, substitution or process. | KNOWLEDGE_INSTANCE / recipe reference, author and use state | Core Required / Craft / Progression |
| leyforge.core.item.family.knowledge.research_folio | Research Folio Family | Multi-step technical, magical, ecological or historical research record. | KNOWLEDGE_CONTAINER / topics, progress and owner | Core Required / Research / Progression |
| leyforge.core.item.family.knowledge.map.local | Local Map Family | Records discovered terrain, sites, routes and warnings without revealing undiscovered content. | MAP_INSTANCE / region, revision and annotations | Core Required / Map / Routes |
| leyforge.core.item.family.knowledge.map.survey | Survey Map and Technical Plan Family | Resource, structure, route, leyline or engineering survey. | MAP_INSTANCE / source quality and permissions | Core Required / Engineering / Worldgen |
| leyforge.core.item.family.knowledge.ruin_rubbing | Rubbing, Inscription Copy and Site Sketch Family | Preserves inscriptions, mechanisms and historical clues from sites. | KNOWLEDGE_INSTANCE / site reference and translation state | Core Required / Adventure / History |
| leyforge.core.item.family.knowledge.language_primer | Language Primer and Translation Aid Family | Supports culture, law, diplomacy and discovery without collapsing language into ancestry. | KNOWLEDGE_INSTANCE / language and proficiency support | Core Required / Cultures / UI |
| leyforge.core.item.family.knowledge.faction_charter | Faction Charter and Membership Record Family | Defines stated rules, services, obligations and credentials. | CONTRACT_KNOWLEDGE / faction and revision | Core Required / Factions / Law |
| leyforge.core.item.family.knowledge.law_code | Law Code and Custom Record Family | Explains jurisdictional rules, penalties, personhood and trade restrictions. | KNOWLEDGE_INSTANCE / jurisdiction and validity | Core Required / Factions / Player Trust |
| leyforge.core.item.family.knowledge.history_record | Historical Record and Chronicle Family | Links ruins, settlements, events and persistent world history. | KNOWLEDGE_INSTANCE / historical IDs and reliability | Core Required / History / Narrative |
| leyforge.core.item.family.knowledge.threat_clue | Threat and Boss Clue Family | Tracks territory, behaviour, counters and alternative-resolution information. | KNOWLEDGE_INSTANCE / threat reference and confidence | Core Required / Bosses / Adventure |
| leyforge.core.item.family.knowledge.realm_route | Realm Route Record Family | Documents route requirements, arrival, return and rescue knowledge. | KNOWLEDGE_INSTANCE / route reference and discovery state | Core Required / Realm Access |
| leyforge.core.item.family.knowledge.blueprint | Structure Blueprint Family | Authoritative build plan reference for player, NPC and Forge-compatible construction. | BLUEPRINT_INSTANCE / version, owner, dependencies and signature | Core Required / Building / Forge |
| leyforge.core.item.family.knowledge.event_notice | Event Notice, Warning and Public Record Family | Physical board, letter or carried notice for simulation-driven events and aftermath. | KNOWLEDGE_CONTRACT / event reference and expiry | Core Required / Events / Settlements |

# 28. Adventure Loot, Relics and Boss Proofs

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.loot.cache.salvage | Salvage Cache Family | Contextual bundle of recoverable materials from ruins, disasters or abandoned industry. | CONTAINER_INSTANCE / source, claim and contents | Core Required / Adventure / Salvage |
| leyforge.core.item.family.loot.cache.currency | Currency and Trade Reserve Cache Family | Contextual monetary or trade-value cache with owner and legal-status rules. | CONTAINER_INSTANCE / issuer, claim and contents | Core Required / Adventure / Economy |
| leyforge.core.item.family.loot.cache.supplies | Lost and Abandoned Supply Cache Family | Food, tools, medicine or route supplies generated from believable history. | CONTAINER_INSTANCE / source event and contents | Core Required / Adventure / Survival |
| leyforge.core.item.family.loot.ancient.mechanism_fragment | Ancient Mechanism Fragment Family | Research, restoration and automation salvage from old sites. | PROVENANCE_STACK / site and mechanism class | Core Required / Ruins / Automation |
| leyforge.core.item.family.loot.relic.weapon | Relic Weapon Family | Persistent authored or generated weapon with provenance and restoration requirements. | UNIQUE_DURABLE / identity, history and condition | Core Required / Dungeons / Combat |
| leyforge.core.item.family.loot.relic.armour | Relic Armour Family | Persistent authored or generated armour with provenance and restoration requirements. | UNIQUE_DURABLE / identity, history and condition | Core Required / Dungeons / Defence |
| leyforge.core.item.family.loot.relic.ceremonial | Ceremonial and Civic Relic Family | Culture, faction, settlement, law or museum object with claims and story value. | UNIQUE_INSTANCE / provenance and ownership | Core Required / Culture / History |
| leyforge.core.item.family.loot.shrine.offering | Shrine Offering and Sacred Goods Family | Contextual sacred goods whose removal, donation or restoration has social consequences. | PROVENANCE_INSTANCE / site, owner and permission | Core Required / Sacred Sites / Morality |
| leyforge.core.item.family.loot.tomb.grave_goods | Grave Goods Family | Burial-associated items with legal, cultural, spiritual and quest consequences. | PROVENANCE_INSTANCE / tomb and claim state | Core Required / Tombs / Culture |
| leyforge.core.item.family.loot.key.site | Site Key, Seal and Mechanism Part Family | Opens, repairs or changes a specific site path without becoming a universal key. | UNIQUE_INSTANCE / target reference and state | Core Required / Adventure / Progression |
| leyforge.core.item.family.loot.restoration.component | Restoration Component Family | Recovered component used to repair structures, routes, machines or realm infrastructure. | PROVENANCE_STACK / target compatibility and condition | Core Required / Restoration / Projects |
| leyforge.core.item.family.loot.display.museum_trophy | Museum and Memorial Display Family | Preserves discovery, creature, boss or historical evidence for settlements and player bases. | UNIQUE_OR_PROVENANCE / display and donation state | Core Required / Culture / Morale |
| leyforge.core.item.family.boss.root_crowned_behemoth.trophy | Root-Crowned Behemoth Trophy Family | Boss-linked reward/proof family supporting research, restoration, equipment or alternate outcomes. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Root-Crowned Behemoth |
| leyforge.core.item.family.boss.mire_sovereign.trophy | Mire Sovereign Trophy Family | Boss-linked wetland reward/proof family with ecology, medicine, law or restoration uses. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Mire Sovereign |
| leyforge.core.item.family.boss.stormglass_wyvern.trophy | Stormglass Wyvern Trophy Family | Boss-linked highland reward/proof family for equipment, research or route safety. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Stormglass Wyvern |
| leyforge.core.item.family.boss.worldburrower.trophy | Worldburrower Trophy Family | Boss-linked deepstone reward/proof family for tunnelling, defence, research or restoration. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Worldburrower |
| leyforge.core.item.family.boss.bannerless_host.trophy | Bannerless Host Trophy Family | Boss-linked historical and faction evidence whose resolution may involve restoration rather than simple loot. | UNIQUE_PROVENANCE / host instance and outcome | Core Required / Bannerless Host |
| leyforge.core.item.family.boss.leyline_weaver.trophy | Leyline Weaver Trophy Family | Boss-linked magical network reward/proof family for study, repair and realm access. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Leyline Weaver |
| leyforge.core.item.family.boss.ironwood_titan.trophy | Ironwood Titan Trophy Family | Boss-linked construct/living-machine reward/proof family with personhood, salvage and repair considerations. | UNIQUE_PROVENANCE / boss instance and outcome | Core Required / Ironwood Titan |
| leyforge.core.item.family.boss.pale_glacier_worm.trophy | Pale Glacier Worm Trophy Family | Boss-linked cold-region reward/proof family; active admission remains tied to selected world coverage. | UNIQUE_PROVENANCE / boss instance and outcome | Core Conditional / Pale Glacier Worm |
| leyforge.core.item.family.boss.verdant.seasonal_regent_token | Seasonal Regent Resolution Token Family | Realm-authority outcome record and reward interface for diplomacy, succession or confrontation. | UNIQUE_PROVENANCE / authority and season outcome | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.boss.verdant.rot_crowned_hart_token | Rot-Crowned Hart Resolution Token Family | Realm-authority outcome record and reward interface for blight, cleansing or confrontation. | UNIQUE_PROVENANCE / authority and outcome | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.boss.verdant.oathbreaker_thorn_token | Oathbreaker Thorn Resolution Token Family | Realm-authority outcome record and reward interface for oath, law and alternative resolution. | UNIQUE_PROVENANCE / authority and outcome | Core Conditional / Verdant Covenant |

# 29. Verdant Covenant Complete Item Package

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.realm.verdant.living_heartwood | Living Heartwood Family | Primary Verdant structural and living-craft material retaining growth and realm provenance. | LIVING_PROVENANCE_STACK / health, consent and treatment | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.season_sap | Season Sap Family | Season-dependent catalyst, fuel, medicine and realm-infrastructure input. | CHARGED_CONTAINER / season, purity and stability | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.thornsilver_fibre | Thornsilver Fibre Family | Flexible strong realm fibre for bindings, textiles, conduits and equipment. | LIVING_QUALITY_STACK / tensile grade and growth state | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.pollen_amber | Pollen Amber Family | Optical, inscription, preservation and perception material. | PROVENANCE_STACK / clarity, season and charge | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.memory_seed | Memory Seed Family | Growth, remembrance, living blueprint and negotiated world-state material. | UNIQUE_OR_BIOLOGICAL / memory record and viability | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.bloomstone | Bloomstone Family | Realm stabilisation, route, ward and living-machine mineral. | CHARGED_STACK / purity, resonance and stability | Core Conditional / Verdant Covenant |
| leyforge.core.item.family.realm.verdant.heartwood_billet | Living Heartwood Billet and Joinery Family | Processed structural component for approved living construction and tools. | LIVING_QUALITY_STACK / maker and growth state | Core Conditional / Verdant Covenant / Building |
| leyforge.core.item.family.realm.verdant.season_sap_vial | Refined Season-Sap Vial Family | Measured catalyst and charge item for recipes, medicine and machines. | CHARGED_CONTAINER / dose and season | Core Conditional / Verdant Covenant / Magic |
| leyforge.core.item.family.realm.verdant.thornsilver_cord | Thornsilver Cord and Lattice Family | Processed flexible component for equipment, routes and living structures. | LIVING_QUALITY_STACK / tension and growth state | Core Conditional / Verdant Covenant / Craft |
| leyforge.core.item.family.realm.verdant.pollen_amber_lens | Pollen-Amber Lens Family | Processed lens for maps, runes, perception and realm-compatible devices. | DURABLE_CHARGED / clarity and calibration | Core Conditional / Verdant Covenant / Magic |
| leyforge.core.item.family.realm.verdant.memory_seed_capsule | Memory-Seed Capsule Family | Protected transport and planting form for authorised memory growth. | UNIQUE_CONTAINER / memory, owner and consent | Core Conditional / Verdant Covenant / Narrative |
| leyforge.core.item.family.realm.verdant.bloomstone_core | Bloomstone Stabiliser Core Family | Processed stabilisation component for routes, wards and imported infrastructure. | CHARGED_DURABLE / capacity and realm compatibility | Core Conditional / Verdant Covenant / Realm Access |
| leyforge.core.item.family.realm.verdant.anti_blight_salve | Verdant Anti-Blight Treatment Family | Realm-specific healing and restoration input for living systems. | CONTAINER_STACK / strain target and potency | Core Conditional / Verdant Covenant / Health |
| leyforge.core.item.family.realm.verdant.oath_offering | Verdant Oath and Diplomacy Offering Family | Contextual gift, promise or access object whose meaning depends on valid participants and law. | UNIQUE_PROVENANCE / parties and oath context | Core Conditional / Verdant Covenant / Culture |

# 30. Ancestral Veil Threshold Teaser

| Family ID | Family Name | World / Player Role | State Profile | Status / Owner |
| --- | --- | --- | --- | --- |
| leyforge.core.item.family.realm.ancestral.threshold_token | Ancestral Veil Threshold Token Family | Teaser-only route, permission or narrative token that cannot imply a complete playable realm. | UNIQUE_INSTANCE / threshold route and owner | Teaser Only / Ancestral Veil Threshold |
| leyforge.core.item.family.realm.ancestral.memory_echo | Ancestral Memory Echo Record Family | Teaser-only recoverable knowledge or history trace with no full realm economy. | KNOWLEDGE_PROVENANCE / echo source and stability | Teaser Only / Ancestral Veil Threshold |
| leyforge.core.item.family.realm.ancestral.return_charm | Emergency Veil Return Charm Family | Protected teaser-route rescue item tied to authoritative return anchors. | CHARGED_UNIQUE / route, owner and spent state | Teaser Only / Ancestral Veil Threshold |

# 31. Dynamic State, Ownership and Provenance Coverage

| State Class | Required Coverage | Failure to Avoid |
| --- | --- | --- |
| Quantity and stacking | Deterministic split/merge, overflow and capacity rules. | Duplication, deletion or merging incompatible state. |
| Quality and condition | Family-approved fields only; repair and degradation preserve identity. | Quality becoming an uncontrolled universal stat layer. |
| Freshness and contamination | Batch-level timers, storage effects and world-setting scaling. | Hidden spoilage or contamination loss on transfer. |
| Charge and purity | Capacity, current charge, source purity, overload and safe discharge. | Free energy through stack merging or pack removal. |
| Ownership and permissions | Player, NPC, settlement, faction, project, contract and public states. | Possession alone overwriting authoritative ownership. |
| Provenance and claims | Source, maker, site, creature, event, donation, theft and restoration records where meaningful. | Copying full world history into every common item. |
| Knowledge and maps | Discovered information, author, language, annotations and version. | Maps revealing undiscovered seed content. |
| Unique and relic state | Persistent ID, restoration, display, story links and safe recovery. | Unique progression loss or duplicate relics. |
| Removed expansion payload | Quarantine, preserve and reactivate extension-owned fields. | Base save corruption or silent deletion. |

# 32. Document Set 26 Compatibility and Admission Boundary

Document 25I remains general and does not populate the maritime inventory. Set 26 may add expansion-owned item families, concrete definitions and extension facets after passing 25B-25E admission.

| Compatibility Area | Base Contract | Set 26 Ownership |
| --- | --- | --- |
| Cargo | General cargo crate, manifest, owner, mass/volume class and container interfaces. | Vessel cargo holds, stowage, shifting cargo, maritime tariffs and fleet logistics. |
| Containers and fluids | Volume, seal, contamination, pressure/temperature hooks and material compatibility. | Diving air, ballast, flooding, bilge, seawater, maritime fuel and specialised tanks. |
| Exposure facets | Optional corrosion, waterlogging, waterproofing and salt-exposure extension fields. | Exact water, wave, storm and vessel-damage behaviour. |
| Equipment | General environmental clothing, tools, weapons and authority fields. | Swimming/diving gear, shipwright tools, naval weapons, boarding gear and crew equipment. |
| Components | Generic frames, fasteners, rope/fibre, mechanisms and cargo interfaces. | Vessel structural roles, propulsion, steering, sails, anchors and naval systems. |
| Absence/removal | Unknown expansion fields and items preserve payload or quarantine safely. | Migration plans and substitutions for maritime packs. |

> **Maritime Boundary Rule**
>
> No vessel part, fishing family, diving apparatus, naval weapon, ship cargo rule or maritime resource becomes a Core item merely because the base catalogue can host it. Those definitions require authoritative Set 26 contracts and package admission.

# 33. Core Package Coverage Matrix

| Package | Required Item Coverage | Boundary |
| --- | --- | --- |
| Seed Start / Immediate Survival | Common gathered material, food/health fallback, primitive tool and light/container pathways. | No fixed named item, village or ruin is guaranteed. |
| Environment Packages | Biome-appropriate logs, fibres, forage, minerals, hazards and provenance. | Atlas owns distribution; Item Registry owns executable inventory definitions. |
| Civilisation / Settlements | Need supplies, profession tools, trade goods, records, projects, repairs and credentials. | Exact consumption and economy remain Documents 07/25J. |
| Extraction / Automation | Copper and iron chains, machine parts, power/fuel and maintenance goods. | Resource conservation and throughput remain Documents 05-06/08/18. |
| Practical Magic | Mana, runes, wards, cleansing, knowledge and route stabilisation. | Schools and detailed spell behaviour remain Document 09. |
| Ecology | Food, hide, fibre, reagents, samples, construct parts and trophies. | Creature document owns drop eligibility, harvesting and welfare. |
| Adventure | Keys, clues, salvage, relics, restoration components and boss proofs. | Sites/events own context and claims; items cannot guarantee placement. |
| Verdant Covenant | Six source materials, processed components, treatment, diplomacy and authority outcomes. | All remain Core Conditional until complete-realm gate passes. |
| Ancestral Veil | Threshold token, memory echo and emergency return only. | No full realm economy or progression chain. |
| Document Set 26 | Base cargo/container, corrosion/waterproofing extension hooks and optional pack admission. | All maritime items, vessel parts, fishing, diving and naval gear remain Set 26-owned. |

# 34. Block, Resource, Recipe, Drop and Loot Handoff

| Handoff | 25I Requirement | Receiving Document |
| --- | --- | --- |
| Block forms | Generated or explicit item-form policy for every placeable 25H block. | Document 03/04 v1.0. |
| Resource families | Every raw/refined/material family maps to source, capability, substitutes and long-term consumers. | 25J and Document 06 v1.0. |
| Recipes | Every craftable/processable item declares candidate inputs, outputs, station/power and by-products through recipe references. | 25J and Document 05 v1.0. |
| Creature drops | Every creature item names eligible source classes, harvest method, welfare/legality and alternatives. | Document 10 v1.0. |
| Loot | Every adventure/relic item has contextual source, claim, alternative reward and persistence policy. | Documents 12/15/16. |
| Settlement supply | Every bundle/crate conserves exact underlying items and tracks project/transaction ownership. | Documents 07/08 and 25J. |
| Realm items | Verdant materials and outcome items map to realm laws, Overworld utility and safe migration. | Documents 14/24D and 25J. |

# 35. Forge, UI, Audio/VFX and Presentation Handoff

- 25K must group item families into reusable icon, held-model, equipment, container, material, culture and realm presentation kits.
- Every concrete item requires an icon or approved generated icon path, readable inventory name, description and accessibility text.
- Held/equipped items require sockets, grip/pose class, action events and first/third-person presentation where applicable.
- Tools, weapons, containers, charged magic, spoilage, damage and unique significance require readable state cues without depending only on colour.
- Audio/VFX hooks are event references only; dedicated production tools remain separately owned.
- Provenance/licensing must be tracked for icons, models, textures, animations, audio and generated assets.

# 36. Validation, Seed QA and Acceptance Evidence

| Suite | Required Evidence | Blocking Failure |
| --- | --- | --- |
| Schema and references | All family IDs, parents, profiles, package owners and cross-registry links resolve. | Broken/ambiguous hard reference or duplicate owner. |
| Physical coverage | Every 25G package has required item inputs/outputs or an explicit conditional blocker. | Package has prose-only material, reward or supply chain. |
| Stack and conservation | Craft, split, merge, transfer, automation, trade, death and migration preserve quantity/state. | Duplication, deletion or state erasure. |
| Block forms | Every placeable block has a valid form policy and no-item families cannot be acquired normally. | Orphan block item or packed-state exploit. |
| Progression reachability | CAP-00 to CAP-10 item capabilities have at least one provider and approved fallback. | Named-item-only or unavailable capability. |
| Loot and provenance | Contextual loot, claims, unique items and alternatives preserve world-state meaning. | Generic chest filler or duplicated unique progression. |
| NPC/economy | Settlement consumption, contracts, warehouses, theft and trade use authoritative transactions. | Infinite shops, free bundles or ownership loss. |
| Realm | Verdant item chain has sources, uses, return, migration and outcome persistence. | Realm material with no Overworld utility or partial package. |
| Optional expansion | Set 26 absent/present/removal/reinstall and unknown-field preservation. | Base save corruption or hard dependency leakage. |
| POC leakage | No fixed Forest Hamlet, watchtower-delivery, named POC villager or scripted raid item appears in production manifests. | Any retired POC item selected normally. |

# 37. Production Sequence and Document 04 Replacement Gate

1. Approve Document 25I family intake and visible conditional decisions.
2. Complete 25J resource, loot, provenance, progression and recipe-chain matrix.
3. Resolve family splits/merges required by progression, substitution, loot and recipe analysis.
4. Generate concrete Document 04 v1.0 item definitions and block item forms from 25H/25I.
5. Create aliases, tombstones and migration rules for legacy item IDs.
6. Implement representative import, validation and Godot Resource generation.
7. Run stack, conservation, inventory, equipment, trade, save and optional-pack tests.
8. Accept Document 04 v1.0 as the new item source of truth and archive the POC registry.

> **Document 04 Replacement Gate**
>
> Document 04 v1.0 cannot replace the legacy registry until every Core package has executable item coverage, every placeable block has a valid item-form policy, all item state is save-safe, CAP-00 to CAP-10 remain reachable, and normal production contains no POC-specific item identity or fixed demonstration chain.

# 38. Decisions Locked by 25I

| Decision | Result |
| --- | --- |
| Family-first item planning | Approved families precede concrete variant multiplication. |
| Qualified IDs | All new families and concrete entries use 25B namespace rules. |
| Rarity separation | Scarcity, capability, quality, condition, provenance, significance and value remain separate. |
| Block/item boundary | Block forms reference exact block definitions; placed behaviour remains block-owned. |
| Resource/item boundary | Resource context and progression remain 25J/Document 06-owned; inventory behaviour remains item-owned. |
| State conservation | Stacking and transactions may not erase required quantity, state or ownership. |
| Personhood boundary | Persons and awakened constructs are never ordinary inventory; handling tokens reference entities and permissions. |
| Verdant package | Verdant item families remain complete but conditional until realm gates pass. |
| Ancestral teaser | Only threshold, memory and safe-return item roles are admitted. |
| Set 26 boundary | Maritime item design remains expansion-owned and enters through general package rules. |

# 39. Handoff to 25J-25L and Main Documents

| Receiving Work | Required Handoff |
| --- | --- |
| 25J | Resolve resource source/use, loot provenance, progression providers, recipe chains, substitutions, recycling and by-products for every admitted family. |
| 25K | Create asset budgets and reusable icon/model/equipment/container/material/culture/realm manifests. |
| 25L | Convert family and chain obligations into bounded Summer Engine tasks, tests and release gates. |
| Document 04 v1.0 | Create concrete executable item registry, state schemas, block forms, aliases and UI fields. |
| Documents 05-06 | Create transformations, progression, scarcity and capability pathways. |
| Documents 07-10 | Consume supplies, tools, equipment, magic and creature-resource contracts. |
| Documents 12-17 | Bind loot, relics, culture, quests, combat and presentation. |
| Document 18 v1.0 | Implement inventory, equipment, item state, saves, authority, transactions and performance. |
| Document Set 26 | Add authoritative maritime item schemas and definitions through admitted extension packs. |

# 40. Risks, Redesign Triggers and Open Decisions

## 40.1 Primary risks

- Concrete item explosion from multiplying every material, culture, quality, shape and rarity combination.
- State-heavy stacks creating memory, save and UI complexity.
- Loot and trade lists drifting away from real ecology, production and ownership.
- Unique items or route keys becoming irreversible progression blockers.
- Creature resources encouraging incoherent harvesting or violating personhood boundaries.
- Verdant living items requiring runtime behaviour not supported by the base item model.
- Premature Set 26 definitions creating incompatible cargo, water-exposure or vessel-component assumptions.

## 40.2 Redesign triggers

- A family requires two canonical owners for the same field path.
- A proposed visual variant needs distinct behaviour, state or save meaning.
- A stack profile cannot preserve conservation and required provenance within measured budgets.
- Representative seeds cannot provide CAP-00 to CAP-05 without a fixed named item.
- A unique item can be lost, duplicated or removed with no recovery route.
- A creature-derived item requires treating a person or awakened construct as ordinary loot.
- Set 26 requires a base-field change rather than an authorised extension facet or expansion definition.
- Verdant Covenant cannot supply, use and migrate all six realm material classes safely.

## 40.3 Open decisions for later authority

| Decision | Owner / Timing |
| --- | --- |
| Exact concrete item count and material variants per tool, weapon and armour family. | Document 04 v1.0 after 25J. |
| Final stack limits, inventory capacities and whether physical currency also has a wallet view. | Documents 04/17/18 and testing. |
| Exact quality vocabulary and which families support instance quality. | 25J and Documents 04-06. |
| Exact spoilage, contamination and preservation values by world setting. | Documents 04-06 and balance testing. |
| Whether crossbows and selected advanced sensors enter the earliest Core milestone. | 25L production sequencing. |
| Exact treatment of construct cores when persistent identity or personhood records exist. | Documents 10/13/15/18 with Ash approval. |
| Detailed maritime item fields and which base families receive expansion facets. | 26B-26O with 25B-25E admission review. |

# Appendix A. Master Item-Family Register

## Technical and Recovery

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.technical.missing_definition | Missing-Definition Recovery Item | Core Required | 25D-25E / Runtime |
| leyforge.core.item.family.technical.invalid_stack_quarantine | Invalid-Stack Quarantine Package | Core Required | Registry / Save Recovery |
| leyforge.core.item.family.technical.migration_receipt | Migration Receipt | Core Required | Migration / Player Trust |
| leyforge.core.item.family.technical.deprecated_tombstone | Deprecated Item Tombstone | Core Required | Registry / Archive |

## Generated Block-Item Form Profiles

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.block_form.terrain_natural | Natural Terrain Block-Item Form | Core Required | 25H / Document 03 |
| leyforge.core.item.family.block_form.construction | Construction Block-Item Form | Core Required | 25H / Building |
| leyforge.core.item.family.block_form.functional_station | Functional Station Block-Item Form | Core Required | 25H / Stations |
| leyforge.core.item.family.block_form.storage | Storage Block-Item Form | Core Required | 25H / Storage |
| leyforge.core.item.family.block_form.automation | Automation Block-Item Form | Core Required | 25H / Automation |
| leyforge.core.item.family.block_form.magic | Magic Infrastructure Block-Item Form | Core Required | 25H / Magic |
| leyforge.core.item.family.block_form.infrastructure | Infrastructure Block-Item Form | Core Required | 25H / Civilisation |
| leyforge.core.item.family.block_form.adventure | Adventure Interaction Block-Item Form | Core Conditional | Adventure / Structures |
| leyforge.core.item.family.block_form.plantable | Plantable Block-Item Form | Core Required | Agriculture / Ecology |
| leyforge.core.item.family.block_form.realm_living | Living-Realm Block-Item Form | Core Conditional | Verdant Covenant |

## Natural, Botanical and Organic Inputs

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.natural.wood.hardwood_log | Hardwood Log and Branch Family | Core Required | Temperate Heartland / Forestry |
| leyforge.core.item.family.natural.wood.softwood_log | Softwood Log and Branch Family | Core Required | Moorland/Boreal Frontier |
| leyforge.core.item.family.natural.wood.ancient_heartwood | Ancient Heartwood Family | Core Conditional | Ancient Oakwood / Spirit States |
| leyforge.core.item.family.natural.wood.mistwood_timber | Mistwood Timber Family | Core Required | Mistwood / Mirelight |
| leyforge.core.item.family.natural.wood.worldroot_fragment | Worldroot Fragment Family | Core Required | Root Caves / Adventure |
| leyforge.core.item.family.natural.fibre.plant_fibre | Common Plant Fibre Family | Core Required | All Overworld Packages |
| leyforge.core.item.family.natural.fibre.bast_fibre | Bast and Bark Fibre Family | Core Required | Forestry / Trade |
| leyforge.core.item.family.natural.fibre.reed_cane | Reed and Cane Family | Core Required | Wetland/Flood Basin |
| leyforge.core.item.family.natural.fibre.textile_crop | Textile Crop Fibre Family | Core Required | Agriculture / Textile |
| leyforge.core.item.family.natural.fibre.wool | Raw Wool and Fleece Family | Core Required | Herd/Domestic Ecology |
| leyforge.core.item.family.natural.hide.raw | Raw Hide Family | Core Required | Creature Resources |
| leyforge.core.item.family.natural.resin.tree_resin | Tree Resin Family | Core Required | Forestry / Magic |
| leyforge.core.item.family.natural.resin.pitch_tar | Pitch and Tar Family | Core Required | Industry / Routes |
| leyforge.core.item.family.natural.seed.staple_grain | Staple Grain Seed Family | Core Required | Agriculture / Provisions |
| leyforge.core.item.family.natural.seed.root_crop | Root-Crop Seed and Tuber Family | Core Required | Agriculture / Frontier |
| leyforge.core.item.family.natural.seed.orchard | Orchard Seed and Graft Family | Core Required | Temperate Agriculture |
| leyforge.core.item.family.natural.seed.herb | Medicinal and Culinary Herb Seed Family | Core Required | Health / Agriculture |
| leyforge.core.item.family.natural.forage.wild_berry | Wild Berry and Small-Fruit Family | Core Required | Surface Biomes |
| leyforge.core.item.family.natural.forage.edible_mushroom | Edible Mushroom Family | Core Required | Forest / Fungal Cavern |
| leyforge.core.item.family.natural.forage.medicinal_fungus | Medicinal Fungus Family | Core Required | Health / Underground |
| leyforge.core.item.family.natural.forage.medicinal_herb | Medicinal Herb Family | Core Required | Health / Surface Biomes |
| leyforge.core.item.family.natural.forage.cleansing_herb | Cleansing Herb Family | Core Required | Magic / Health |
| leyforge.core.item.family.natural.forage.dye_pigment | Natural Dye and Pigment Family | Core Required | Culture / Craft |
| leyforge.core.item.family.natural.soil.compost | Compost and Soil Amendment Family | Core Required | Agriculture / Settlement |

## Stone, Aggregate, Ceramic and Glass Inputs

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.mineral.stone.common_fragment | Common Stone Fragment Family | Core Required | All Overworld Packages |
| leyforge.core.item.family.mineral.stone.limestone_chunk | Limestone Chunk Family | Core Required | Karst / Industry |
| leyforge.core.item.family.mineral.stone.deepstone_chunk | Deepstone Chunk Family | Core Required | Underground/Deepstone |
| leyforge.core.item.family.mineral.stone.riftstone_chunk | Riftstone Chunk Family | Core Required | Geothermal Riftlands |
| leyforge.core.item.family.mineral.stone.travertine_chunk | Travertine Chunk Family | Core Required | Geothermal / Culture |
| leyforge.core.item.family.mineral.crystal.matrix_shard | Crystal-Matrix Shard Family | Core Required | Crystal Cavern / Magic |
| leyforge.core.item.family.mineral.salvage.machine_strata | Machine-Strata Salvage Family | Core Required | Machine Strata / Adventure |
| leyforge.core.item.family.mineral.aggregate.sand | Sand and Fine Aggregate Family | Core Required | River/Coast/Wetland |
| leyforge.core.item.family.mineral.aggregate.gravel | Gravel and Coarse Aggregate Family | Core Required | Routes / Industry |
| leyforge.core.item.family.mineral.earth.clay | Raw Clay Family | Core Required | Wetland / Clayworks |
| leyforge.core.item.family.mineral.ceramic.fired_brick | Fired Brick and Tile Unit Family | Core Required | Clayworks / Building |
| leyforge.core.item.family.mineral.ceramic.vessel | Ceramic Vessel Family | Core Required | Craft / Settlement |
| leyforge.core.item.family.mineral.binder.mortar | Mortar, Lime and Binder Family | Core Required | Construction / Restoration |
| leyforge.core.item.family.mineral.glass.glasswork | Glasswork Material Family | Core Required | Glass / Magic / UI |

## Metals, Salvage and Industrial Materials

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.metal.copper.raw_ore | Raw Copper Ore Family | Core Required | CAP-03 / Extraction |
| leyforge.core.item.family.metal.copper.ingot | Copper Ingot Family | Core Required | CAP-03 / Refinement |
| leyforge.core.item.family.metal.copper.plate | Copper Plate Family | Core Required | Automation / Building |
| leyforge.core.item.family.metal.copper.wire | Copper Wire and Connector Family | Core Required | Automation / Magic |
| leyforge.core.item.family.metal.copper.gear | Copper Gear and Mechanism Family | Core Required | CAP-03 / Automation |
| leyforge.core.item.family.metal.copper.fastener | Copper Fastener Family | Core Required | Construction / Automation |
| leyforge.core.item.family.metal.copper.alloy_branch | Copper-Alloy Branch Family | Core Conditional | Capability Alternatives / 25J |
| leyforge.core.item.family.metal.iron.raw_ore | Raw Iron Ore Family | Core Required | CAP-04 / Extraction |
| leyforge.core.item.family.metal.iron.ingot | Iron Ingot Family | Core Required | CAP-04 / Refinement |
| leyforge.core.item.family.metal.iron.plate | Iron Plate Family | Core Required | Industry / Defence |
| leyforge.core.item.family.metal.iron.rod | Iron Rod and Bar Family | Core Required | Industry / Construction |
| leyforge.core.item.family.metal.iron.fastener | Iron Fastener Family | Core Required | Settlement / Industry |
| leyforge.core.item.family.metal.iron.tool_blank | Iron Tool and Weapon Blank Family | Core Required | Craft / Equipment |
| leyforge.core.item.family.metal.iron.frame | Iron Structural Frame Family | Core Required | Automation / Civilisation |
| leyforge.core.item.family.metal.precious.silver_family | Silver and Conductive Precious-Metal Family | Core Conditional | Magic / Trade |
| leyforge.core.item.family.metal.precious.gold_family | Gold and Ceremonial Precious-Metal Family | Core Conditional | Trade / Culture / Relics |
| leyforge.core.item.family.metal.salvage.mixed_scrap | Mixed Metal Scrap Family | Core Required | Salvage / Repair |

## Fuel, Power and Portable Energy

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.fuel.firewood_bundle | Firewood Bundle Family | Core Required | Survival / Settlement |
| leyforge.core.item.family.fuel.charcoal | Charcoal Family | Core Required | Industry / Forestry |
| leyforge.core.item.family.fuel.coal | Coal and Carbon Fuel Family | Core Required | Underground / Industry |
| leyforge.core.item.family.fuel.peat | Cut Peat Fuel Family | Core Required | Wetland / Moorland |
| leyforge.core.item.family.fuel.lamp_oil | Lamp Oil Family | Core Required | Settlement / Exploration |
| leyforge.core.item.family.fuel.resin_pitch | Resin-Pitch Fuel and Sealant Family | Core Required | Forestry / Routes |
| leyforge.core.item.family.fuel.mana_charge | Portable Mana Charge Family | Core Required | Magic / Automation |
| leyforge.core.item.family.fuel.emergency_heat_pack | Emergency Heat and Survival Fuel Pack | Core Required | Frontier / Trade |

## Food, Water, Medicine and Settlement Health

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.food.raw.grain | Harvested Grain Family | Core Required | Agriculture / Provisions |
| leyforge.core.item.family.food.processed.flour | Flour and Meal Family | Core Required | Cooking / Settlement |
| leyforge.core.item.family.food.cooked.bread | Bread and Baked Staple Family | Core Required | Cooking / Culture |
| leyforge.core.item.family.food.cooked.porridge | Porridge and Grain-Pot Family | Core Required | Cooking / Settlement |
| leyforge.core.item.family.food.raw.root_vegetable | Root Vegetable Family | Core Required | Agriculture / Frontier |
| leyforge.core.item.family.food.raw.orchard_fruit | Orchard Fruit Family | Core Required | Temperate Agriculture |
| leyforge.core.item.family.food.raw.berry | Berry and Small-Fruit Food Family | Core Required | Surface Biomes |
| leyforge.core.item.family.food.raw.mushroom | Edible Mushroom Food Family | Core Required | Forest / Underground |
| leyforge.core.item.family.food.raw.meat | Raw Meat Family | Core Required | Ecology / Cooking |
| leyforge.core.item.family.food.raw.egg | Egg Family | Core Required | Domestic Ecology |
| leyforge.core.item.family.food.raw.milk | Milk and Fresh Dairy Input Family | Core Required | Domestic Ecology |
| leyforge.core.item.family.food.processed.fat | Rendered Fat and Tallow Family | Core Required | Cooking / Craft |
| leyforge.core.item.family.food.cooked.stew | Stew and Communal Meal Family | Core Required | Settlement / Cooking |
| leyforge.core.item.family.food.preserved.dried | Dried Food Family | Core Required | Trade / Exploration |
| leyforge.core.item.family.food.preserved.pickled | Pickled and Brined Food Family | Core Required | Settlement / Trade |
| leyforge.core.item.family.food.preserved.smoked | Smoked and Cured Food Family | Core Required | Settlement / Frontier |
| leyforge.core.item.family.food.ration.travel | Travel Ration Family | Core Required | Routes / Defence |
| leyforge.core.item.family.food.feed.animal | Animal Feed Family | Core Required | Agriculture / Ecology |
| leyforge.core.item.family.water.container.clean | Clean Water Container Family | Core Required | Survival / Health |
| leyforge.core.item.family.health.bandage | Bandage and Dressing Family | Core Required | Health / Textile |
| leyforge.core.item.family.health.poultice | Medicinal Poultice Family | Core Required | Health / Herbs |
| leyforge.core.item.family.health.tonic | Medicinal Tonic Family | Core Required | Health / Alchemy |
| leyforge.core.item.family.health.antidote | Antidote and Antivenom Family | Core Required | Health / Creature Resources |
| leyforge.core.item.family.health.cleansing_salve | Cleansing Salve Family | Core Required | Health / Magic |

## Creature Products, Samples and Trophies

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.creature.food.game_meat | Game Meat Resource Family | Core Required | Wildlife / Provisions |
| leyforge.core.item.family.creature.material.hide | Creature Hide Family | Core Required | Wildlife / Equipment |
| leyforge.core.item.family.creature.material.leather | Processed Leather Family | Core Required | Craft / Equipment |
| leyforge.core.item.family.creature.material.bone | Bone and Dense Skeletal Material Family | Core Required | Creature Resources |
| leyforge.core.item.family.creature.material.horn_antler | Horn and Antler Family | Core Required | Wildlife / Culture |
| leyforge.core.item.family.creature.material.feather | Feather and Quill Family | Core Required | Wildlife / Knowledge |
| leyforge.core.item.family.creature.material.chitin | Chitin and Carapace Family | Core Required | Hostile/Underground Ecology |
| leyforge.core.item.family.creature.material.silk | Natural Silk and Web Fibre Family | Core Required | Cavern Weaver / Craft |
| leyforge.core.item.family.creature.reagent.venom | Venom and Toxin Family | Core Required | Hostile Ecology / Health |
| leyforge.core.item.family.creature.reagent.gland | Creature Gland and Secretion Family | Core Required | Creature Resources |
| leyforge.core.item.family.creature.material.tallow | Creature Fat and Tallow Family | Core Required | Creature Resources |
| leyforge.core.item.family.creature.material.shell_scale | Shell, Scale and Plate Family | Core Required | Creature Resources |
| leyforge.core.item.family.creature.magic.essence | Magical Creature Essence Family | Core Required | Magical Ecology / Magic |
| leyforge.core.item.family.creature.magic.spirit_mote | Spirit Mote and Memory Trace Family | Core Required | Spirit Ecology / Narrative |
| leyforge.core.item.family.creature.magic.rune_antler_fragment | Runic Antler and Inscribed Growth Family | Core Required | Rune-Antler Ecology |
| leyforge.core.item.family.creature.crystal.carapace | Crystal Carapace and Burrower Shard Family | Core Required | Crystal Burrower / Underground |
| leyforge.core.item.family.creature.undead.residue | Undead Residue Family | Core Required | Undead Ecology / Magic |
| leyforge.core.item.family.creature.corruption.sample | Corruption Sample Family | Core Required | Corruption Ecology / Health |
| leyforge.core.item.family.creature.construct.scrap | Construct Scrap Family | Core Required | Construct Ecology / Automation |
| leyforge.core.item.family.creature.construct.core | Construct Core and Control Fragment Family | Core Conditional | Construct Ecology / Personhood |
| leyforge.core.item.family.creature.nest.material | Nest and Habitat Material Family | Core Required | Ecology / World State |
| leyforge.core.item.family.creature.research.specimen | Creature Research Specimen Family | Core Required | Research / Knowledge |
| leyforge.core.item.family.creature.trophy.common | Common Creature Trophy Family | Core Required | Culture / Hunting |
| leyforge.core.item.family.creature.capture.nonperson | Non-Person Creature Handling Token Family | Core Conditional | Taming / Personhood Boundary |

## Tools, Instruments and Work Equipment

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.tool.harvest.axe | Axe Tool Family | Core Required | Forestry / Survival |
| leyforge.core.item.family.tool.harvest.pickaxe | Pickaxe Tool Family | Core Required | Mining / Survival |
| leyforge.core.item.family.tool.harvest.shovel | Shovel Tool Family | Core Required | Terrain / Agriculture |
| leyforge.core.item.family.tool.harvest.hoe | Hoe and Cultivator Tool Family | Core Required | Agriculture |
| leyforge.core.item.family.tool.harvest.sickle | Sickle and Reaping Tool Family | Core Required | Agriculture / Wetland |
| leyforge.core.item.family.tool.harvest.knife | Utility Knife Family | Core Required | Survival / Craft |
| leyforge.core.item.family.tool.build.hammer | Builder Hammer Family | Core Required | Building / Settlement |
| leyforge.core.item.family.tool.build.saw | Saw Tool Family | Core Required | Forestry / Industry |
| leyforge.core.item.family.tool.build.chisel | Masonry and Carving Chisel Family | Core Required | Construction / Adventure |
| leyforge.core.item.family.tool.build.trowel | Trowel and Masonry Tool Family | Core Required | Construction |
| leyforge.core.item.family.tool.engineering.wrench | Wrench and Configuration Tool Family | Core Required | Automation |
| leyforge.core.item.family.tool.engineering.prospecting | Prospecting Hammer and Sample Kit Family | Core Required | Mining / Exploration |
| leyforge.core.item.family.tool.engineering.survey_lens | Survey Lens and Measurement Tool Family | Core Required | Worldgen / Engineering |
| leyforge.core.item.family.tool.engineering.salvage | Salvage and Dismantling Tool Family | Core Required | Adventure / Automation |
| leyforge.core.item.family.tool.engineering.repair_kit | Field Repair Kit Family | Core Required | Repair / Settlement |
| leyforge.core.item.family.tool.agriculture.pruning | Pruning and Grafting Tool Family | Core Required | Agriculture / Verdant |
| leyforge.core.item.family.tool.animal.handling | Animal Handling Tool Family | Core Required | Domestic Ecology |
| leyforge.core.item.family.tool.health.medical_kit | Medical Kit Family | Core Required | Health / NPC Jobs |
| leyforge.core.item.family.tool.magic.rune_chisel | Rune Chisel Family | Core Required | Magic / Craft |
| leyforge.core.item.family.tool.magic.rune_tuner | Rune Tuner Family | Core Required | Magic / Automation |
| leyforge.core.item.family.tool.magic.ward_key | Ward Key and Access Focus Family | Core Required | Magic / Ownership |
| leyforge.core.item.family.tool.navigation.mapmaking_kit | Mapmaking and Survey Kit Family | Core Required | Routes / UI |
| leyforge.core.item.family.tool.build.blueprint_tool | Blueprint Planning Tool Family | Core Required | Blueprint / Forge |
| leyforge.core.item.family.tool.utility.container | Bucket, Flask and General Container Tool Family | Core Required | Survival / Craft |

## Weapons, Armour and Personal Equipment

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.equipment.weapon.sword | Sword and Long-Blade Family | Core Required | Combat / Craft |
| leyforge.core.item.family.equipment.weapon.axe | Combat Axe Family | Core Required | Combat / Craft |
| leyforge.core.item.family.equipment.weapon.hammer_mace | Hammer and Mace Weapon Family | Core Required | Combat / Defence |
| leyforge.core.item.family.equipment.weapon.spear | Spear and Polearm Family | Core Required | Combat / Hunting |
| leyforge.core.item.family.equipment.weapon.bow | Bow Family | Core Required | Combat / Hunting |
| leyforge.core.item.family.equipment.weapon.crossbow | Crossbow Family | Core Conditional | Combat / Defence |
| leyforge.core.item.family.equipment.weapon.thrown | Thrown Weapon Family | Core Required | Combat / Hunting |
| leyforge.core.item.family.equipment.defence.shield | Shield Family | Core Required | Combat / Defence |
| leyforge.core.item.family.equipment.magic.focus | Spell Focus Family | Core Required | Magic / Combat |
| leyforge.core.item.family.equipment.armour.light | Light Armour Family | Core Required | Combat / Craft |
| leyforge.core.item.family.equipment.armour.medium | Medium Armour Family | Core Required | Combat / Defence |
| leyforge.core.item.family.equipment.armour.heavy | Heavy Armour Family | Core Required | Combat / Industry |
| leyforge.core.item.family.equipment.armour.robe | Robe and Ritual Garment Family | Core Required | Magic / Culture |
| leyforge.core.item.family.equipment.clothing.environmental | Environmental Clothing Family | Core Required | Survival / Exploration |
| leyforge.core.item.family.equipment.accessory.backpack | Backpack and Carry Container Family | Core Required | Inventory / Exploration |
| leyforge.core.item.family.equipment.accessory.tool_belt | Tool Belt and Work Rig Family | Core Required | Craft / NPC Jobs |
| leyforge.core.item.family.equipment.accessory.cloak | Cloak and Mantle Family | Core Required | Survival / Culture |
| leyforge.core.item.family.equipment.accessory.charm | Charm, Ring and Amulet Family | Core Required | Progression / Magic |

## Automation and Machine Components

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.automation.component.frame | Machine Frame Family | Core Required | Automation / Industry |
| leyforge.core.item.family.automation.component.gear | Gear and Cog Family | Core Required | Automation |
| leyforge.core.item.family.automation.component.shaft | Shaft and Axle Family | Core Required | Automation / Routes |
| leyforge.core.item.family.automation.component.bearing | Bearing and Bushing Family | Core Required | Automation |
| leyforge.core.item.family.automation.component.belt | Belt and Flexible Drive Family | Core Required | Automation / Creature Silk |
| leyforge.core.item.family.automation.component.chute | Chute and Gravity-Feed Component Family | Core Required | Early Automation |
| leyforge.core.item.family.automation.component.pipe | Pipe and Sealed Conduit Component Family | Core Required | Automation / Fluids |
| leyforge.core.item.family.automation.component.filter | Filter and Screen Family | Core Required | Automation / Health |
| leyforge.core.item.family.automation.component.sorter | Sorter and Routing Mechanism Family | Core Required | Automation |
| leyforge.core.item.family.automation.component.hopper | Hopper and Transfer Interface Family | Core Required | Automation / Storage |
| leyforge.core.item.family.automation.component.cart_wheel | Cart Wheel and Running Gear Family | Core Required | Routes / Automation |
| leyforge.core.item.family.automation.component.rail | Rail and Track Component Family | Core Required | Underground / Industry |
| leyforge.core.item.family.automation.component.power_interface | Mechanical Power Interface Family | Core Required | Automation / Power |
| leyforge.core.item.family.automation.component.furnace_lining | Furnace and Kiln Lining Family | Core Required | Industry / Clayworks |
| leyforge.core.item.family.automation.component.crusher_head | Crusher Head Family | Core Required | Industry |
| leyforge.core.item.family.automation.component.saw_blade | Machine Saw Blade Family | Core Required | Forestry / Automation |
| leyforge.core.item.family.automation.component.miner_head | Extraction Head Family | Core Required | Mining / Automation |
| leyforge.core.item.family.automation.component.maintenance_pack | Machine Maintenance Pack Family | Core Required | Automation / Settlement |
| leyforge.core.item.family.automation.component.logic_switch | Mechanical and Rune Logic Switch Family | Core Required | Automation / Magic |
| leyforge.core.item.family.automation.component.sensor | Sensor and Detector Family | Core Conditional | Automation / Runtime |
| leyforge.core.item.family.automation.component.storage_upgrade | Storage Upgrade Module Family | Core Required | Storage / Automation |
| leyforge.core.item.family.automation.component.mana_coil | Mana Coil and Coupler Family | Core Required | Magic / Automation |

## Mana, Runes and Magical Components

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.magic.mana.raw_crystal | Raw Mana Crystal Family | Core Required | Practical Magic / Worldgen |
| leyforge.core.item.family.magic.mana.shard | Mana Shard Family | Core Required | Practical Magic |
| leyforge.core.item.family.magic.mana.dust | Mana Dust Family | Core Required | Practical Magic |
| leyforge.core.item.family.magic.mana.core | Refined Mana Core Family | Core Required | Magic / Automation |
| leyforge.core.item.family.magic.rune.blank | Rune Blank and Substrate Family | Core Required | Rune Craft |
| leyforge.core.item.family.magic.rune.ink | Rune Ink and Inscription Medium Family | Core Required | Rune Craft / Knowledge |
| leyforge.core.item.family.magic.rune.control | Control Rune Family | Core Required | Magic / Automation |
| leyforge.core.item.family.magic.rune.ward | Ward Rune Family | Core Required | Magic / Settlement |
| leyforge.core.item.family.magic.rune.transformation | Transformation Rune Family | Core Conditional | Magic / Recipes |
| leyforge.core.item.family.magic.glyph.plate | Glyph Plate and Rune Circuit Family | Core Required | Magic / Automation |
| leyforge.core.item.family.magic.ward.focus | Ward Focus Family | Core Required | Magic / Safety |
| leyforge.core.item.family.magic.conduit.core | Mana Conduit Core Family | Core Required | Magic / Automation |
| leyforge.core.item.family.magic.storage.battery | Mana Battery Family | Core Required | Magic / Automation |
| leyforge.core.item.family.magic.cleansing.reagent | Cleansing Reagent Family | Core Required | Magic / Health |
| leyforge.core.item.family.magic.ritual.catalyst | Ritual Catalyst Family | Core Required | Magic / Events |
| leyforge.core.item.family.magic.knowledge.scroll | Spell and Ritual Scroll Family | Core Required | Magic / Knowledge |
| leyforge.core.item.family.magic.knowledge.spellbook | Spellbook and Grimoire Family | Core Required | Magic / Progression |
| leyforge.core.item.family.magic.focus.crystal | Focus Crystal Family | Core Required | Magic / Equipment |
| leyforge.core.item.family.magic.seal.key | Magical Seal and Key Family | Core Required | Magic / Adventure |
| leyforge.core.item.family.magic.ley.prism | Leyline Tuning Prism Family | Core Required | Leyline / Magic |
| leyforge.core.item.family.magic.route.charge | Realm Route Stabiliser Charge Family | Core Required | Realm Access |
| leyforge.core.item.family.magic.hazard.corrupted_shard | Corrupted Magical Shard Family | Core Conditional | Corruption / Morality |

## Settlement Supply, Trade and Ownership Records

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.settlement.supply.construction | Construction Supply Bundle Family | Core Required | Settlement Projects |
| leyforge.core.item.family.settlement.supply.project_crate | Project Supply Crate Family | Core Required | Settlement Projects |
| leyforge.core.item.family.settlement.supply.repair | Settlement Repair Supply Family | Core Required | Settlement / Aftermath |
| leyforge.core.item.family.settlement.supply.guard | Guard and Defence Supply Family | Core Required | Defence / Settlement |
| leyforge.core.item.family.settlement.supply.medical | Medical Supply Crate Family | Core Required | Health / Settlement |
| leyforge.core.item.family.settlement.supply.relief_food | Relief and Emergency Food Package Family | Core Required | Events / Settlement |
| leyforge.core.item.family.settlement.supply.seed_stock | Seed Stock and Agricultural Reserve Family | Core Required | Agriculture / Settlement |
| leyforge.core.item.family.settlement.supply.tool_allotment | Profession Tool Allotment Family | Core Required | NPC Jobs / Economy |
| leyforge.core.item.family.trade.goods.bale | Trade Bale and Bulk-Goods Family | Core Required | Trade / Warehouses |
| leyforge.core.item.family.trade.goods.crate | General Cargo Crate Family | Core Required | Trade / Set 26 Compatibility |
| leyforge.core.item.family.trade.record.warehouse_manifest | Warehouse Manifest Family | Core Required | Storage / UI |
| leyforge.core.item.family.trade.record.delivery_contract | Delivery Contract Family | Core Required | Trade / Quests |
| leyforge.core.item.family.trade.record.tax_tribute | Tax, Tariff and Tribute Record Family | Core Required | Factions / Economy |
| leyforge.core.item.family.trade.record.permit | Permit and Licence Family | Core Required | Law / Factions |
| leyforge.core.item.family.trade.record.ownership_token | Ownership and Claim Token Family | Core Required | Ownership / Multiplayer |
| leyforge.core.item.family.trade.record.faction_seal | Faction Seal and Credential Family | Core Required | Factions / Narrative |
| leyforge.core.item.family.trade.currency.physical | Physical Currency Family | Core Required | Economy / Culture |
| leyforge.core.item.family.trade.pack.caravan | Caravan and Expedition Pack Family | Core Required | Routes / Trade |

## Culture Signature Goods

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.culture.hearthland.communal_pantry | Hearthland Communal Pantry Goods Family | Core Required | Hearthland Commons |
| leyforge.core.item.family.culture.hearthland.hearthward_charm | Hearthland Hearthward Charm Family | Core Required | Hearthland Commons / Magic |
| leyforge.core.item.family.culture.marchroad.route_ledger | Marchroad Route Ledger Family | Core Required | Marchroad Leagues |
| leyforge.core.item.family.culture.marchroad.traveller_kit | Marchroad Traveller and Repair Kit Family | Core Required | Marchroad Leagues |
| leyforge.core.item.family.culture.brassroot.calibration_set | Brassroot Calibration Set Family | Core Required | Brassroot Communes |
| leyforge.core.item.family.culture.brassroot.craft_mark | Brassroot Craft-Mark Component Family | Core Required | Brassroot Communes |
| leyforge.core.item.family.culture.deepstone.hall_ration | Deepstone Hall-Ration Family | Core Required | Deepstone Compacts |
| leyforge.core.item.family.culture.deepstone.survey_token | Deepstone Survey and Claim Token Family | Core Required | Deepstone Compacts |
| leyforge.core.item.family.culture.mirelight.medicine_satchel | Mirelight Medicine Satchel Family | Core Required | Mirelight Covenants |
| leyforge.core.item.family.culture.mirelight.reedwork_bundle | Mirelight Reedwork Goods Family | Core Required | Mirelight Covenants |
| leyforge.core.item.family.culture.verdant.pact_gift | Verdant Pact Gift and Oath Offering Family | Core Conditional | Verdant Pact Enclaves |
| leyforge.core.item.family.culture.verdant.living_weave | Verdant Living-Weave Goods Family | Core Conditional | Verdant Pact Enclaves |

## Knowledge, Maps, Blueprints and Records

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.knowledge.field_journal | Field Journal Family | Core Required | Codex / Narrative |
| leyforge.core.item.family.knowledge.codex_page | Codex Page and Record Fragment Family | Core Required | UI / Exploration |
| leyforge.core.item.family.knowledge.recipe_note | Recipe Note and Technique Sheet Family | Core Required | Craft / Progression |
| leyforge.core.item.family.knowledge.research_folio | Research Folio Family | Core Required | Research / Progression |
| leyforge.core.item.family.knowledge.map.local | Local Map Family | Core Required | Map / Routes |
| leyforge.core.item.family.knowledge.map.survey | Survey Map and Technical Plan Family | Core Required | Engineering / Worldgen |
| leyforge.core.item.family.knowledge.ruin_rubbing | Rubbing, Inscription Copy and Site Sketch Family | Core Required | Adventure / History |
| leyforge.core.item.family.knowledge.language_primer | Language Primer and Translation Aid Family | Core Required | Cultures / UI |
| leyforge.core.item.family.knowledge.faction_charter | Faction Charter and Membership Record Family | Core Required | Factions / Law |
| leyforge.core.item.family.knowledge.law_code | Law Code and Custom Record Family | Core Required | Factions / Player Trust |
| leyforge.core.item.family.knowledge.history_record | Historical Record and Chronicle Family | Core Required | History / Narrative |
| leyforge.core.item.family.knowledge.threat_clue | Threat and Boss Clue Family | Core Required | Bosses / Adventure |
| leyforge.core.item.family.knowledge.realm_route | Realm Route Record Family | Core Required | Realm Access |
| leyforge.core.item.family.knowledge.blueprint | Structure Blueprint Family | Core Required | Building / Forge |
| leyforge.core.item.family.knowledge.event_notice | Event Notice, Warning and Public Record Family | Core Required | Events / Settlements |

## Adventure Loot, Relics and Boss Proofs

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.loot.cache.salvage | Salvage Cache Family | Core Required | Adventure / Salvage |
| leyforge.core.item.family.loot.cache.currency | Currency and Trade Reserve Cache Family | Core Required | Adventure / Economy |
| leyforge.core.item.family.loot.cache.supplies | Lost and Abandoned Supply Cache Family | Core Required | Adventure / Survival |
| leyforge.core.item.family.loot.ancient.mechanism_fragment | Ancient Mechanism Fragment Family | Core Required | Ruins / Automation |
| leyforge.core.item.family.loot.relic.weapon | Relic Weapon Family | Core Required | Dungeons / Combat |
| leyforge.core.item.family.loot.relic.armour | Relic Armour Family | Core Required | Dungeons / Defence |
| leyforge.core.item.family.loot.relic.ceremonial | Ceremonial and Civic Relic Family | Core Required | Culture / History |
| leyforge.core.item.family.loot.shrine.offering | Shrine Offering and Sacred Goods Family | Core Required | Sacred Sites / Morality |
| leyforge.core.item.family.loot.tomb.grave_goods | Grave Goods Family | Core Required | Tombs / Culture |
| leyforge.core.item.family.loot.key.site | Site Key, Seal and Mechanism Part Family | Core Required | Adventure / Progression |
| leyforge.core.item.family.loot.restoration.component | Restoration Component Family | Core Required | Restoration / Projects |
| leyforge.core.item.family.loot.display.museum_trophy | Museum and Memorial Display Family | Core Required | Culture / Morale |
| leyforge.core.item.family.boss.root_crowned_behemoth.trophy | Root-Crowned Behemoth Trophy Family | Core Required | Root-Crowned Behemoth |
| leyforge.core.item.family.boss.mire_sovereign.trophy | Mire Sovereign Trophy Family | Core Required | Mire Sovereign |
| leyforge.core.item.family.boss.stormglass_wyvern.trophy | Stormglass Wyvern Trophy Family | Core Required | Stormglass Wyvern |
| leyforge.core.item.family.boss.worldburrower.trophy | Worldburrower Trophy Family | Core Required | Worldburrower |
| leyforge.core.item.family.boss.bannerless_host.trophy | Bannerless Host Trophy Family | Core Required | Bannerless Host |
| leyforge.core.item.family.boss.leyline_weaver.trophy | Leyline Weaver Trophy Family | Core Required | Leyline Weaver |
| leyforge.core.item.family.boss.ironwood_titan.trophy | Ironwood Titan Trophy Family | Core Required | Ironwood Titan |
| leyforge.core.item.family.boss.pale_glacier_worm.trophy | Pale Glacier Worm Trophy Family | Core Conditional | Pale Glacier Worm |
| leyforge.core.item.family.boss.verdant.seasonal_regent_token | Seasonal Regent Resolution Token Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.boss.verdant.rot_crowned_hart_token | Rot-Crowned Hart Resolution Token Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.boss.verdant.oathbreaker_thorn_token | Oathbreaker Thorn Resolution Token Family | Core Conditional | Verdant Covenant |

## Verdant Covenant Complete Item Package

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.realm.verdant.living_heartwood | Living Heartwood Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.realm.verdant.season_sap | Season Sap Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.realm.verdant.thornsilver_fibre | Thornsilver Fibre Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.realm.verdant.pollen_amber | Pollen Amber Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.realm.verdant.memory_seed | Memory Seed Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.realm.verdant.bloomstone | Bloomstone Family | Core Conditional | Verdant Covenant |
| leyforge.core.item.family.realm.verdant.heartwood_billet | Living Heartwood Billet and Joinery Family | Core Conditional | Verdant Covenant / Building |
| leyforge.core.item.family.realm.verdant.season_sap_vial | Refined Season-Sap Vial Family | Core Conditional | Verdant Covenant / Magic |
| leyforge.core.item.family.realm.verdant.thornsilver_cord | Thornsilver Cord and Lattice Family | Core Conditional | Verdant Covenant / Craft |
| leyforge.core.item.family.realm.verdant.pollen_amber_lens | Pollen-Amber Lens Family | Core Conditional | Verdant Covenant / Magic |
| leyforge.core.item.family.realm.verdant.memory_seed_capsule | Memory-Seed Capsule Family | Core Conditional | Verdant Covenant / Narrative |
| leyforge.core.item.family.realm.verdant.bloomstone_core | Bloomstone Stabiliser Core Family | Core Conditional | Verdant Covenant / Realm Access |
| leyforge.core.item.family.realm.verdant.anti_blight_salve | Verdant Anti-Blight Treatment Family | Core Conditional | Verdant Covenant / Health |
| leyforge.core.item.family.realm.verdant.oath_offering | Verdant Oath and Diplomacy Offering Family | Core Conditional | Verdant Covenant / Culture |

## Ancestral Veil Threshold Teaser

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.item.family.realm.ancestral.threshold_token | Ancestral Veil Threshold Token Family | Teaser Only | Ancestral Veil Threshold |
| leyforge.core.item.family.realm.ancestral.memory_echo | Ancestral Memory Echo Record Family | Teaser Only | Ancestral Veil Threshold |
| leyforge.core.item.family.realm.ancestral.return_charm | Emergency Veil Return Charm Family | Teaser Only | Ancestral Veil Threshold |

# Appendix B. Stack and Instance-State Profiles

| Profile | Use | Required State Boundary |
| --- | --- | --- |
| SIMPLE_STACK | Identical commodity stacks | Quantity plus definition ID; no instance state beyond permitted batch metadata. |
| BULK_STACK | High-volume aggregate or supply material | Quantity, grade and source class; suitable for warehouses and automation. |
| QUALITY_STACK | Stackable manufactured component | Stacks only when material, quality, maker policy and condition class are compatible. |
| PROVENANCE_STACK | Source-sensitive material | Source region/site/creature/faction and legal claim may be retained; stack merging follows policy. |
| SPOILAGE_STACK | Perishable batch | Freshness/expiry and contamination are batch state; incompatible batches do not merge silently. |
| BIOLOGICAL_STACK | Seed, graft or living propagation batch | Variety, viability, disease and season state are preserved. |
| CONTAINER_STACK | Stackable sealed dose/container where allowed | Contents, volume, seal, contamination and hazard class must match. |
| CONTAINER_INSTANCE | Persistent container | Own inventory/contents, owner, condition and seal; generally does not stack when non-empty. |
| DURABLE_INSTANCE | Tool, weapon, armour or device | Condition, quality, material, maker, enchantment and owner as applicable. |
| CHARGED_STACK | Stackable energy-bearing batch | Capacity, charge, purity and stability must match to merge. |
| CHARGED_DURABLE | Persistent charged device | Condition, capacity, current charge, purity, calibration and owner. |
| KNOWLEDGE_INSTANCE | Book, map, note or record | Author/source, language, discovered information, annotations and use state. |
| CONTRACT_INSTANCE | Permit, order, claim or agreement | Parties, target references, jurisdiction, conditions, expiry and signatures. |
| UNIQUE_INSTANCE | Persistent singular item or proof | Stable runtime ID, provenance, ownership, condition and story/world-state links. |
| BLOCK_FORM | Inventory representation of placed block | References exact block definition; packing and state-preservation policy controlled by block class. |
| RECOVERY | Quarantined or migration-only payload | Preserves original IDs/state and cannot enter normal recipes or loot. |
| HAZARD_STACK | Contained dangerous material | Contamination, strain, legality, storage and exposure rules are mandatory. |
| BLUEPRINT_INSTANCE | Versioned structure or asset plan | Blueprint ID/version, dependencies, owner, authoring signature and migration state. |

# Appendix C. Scarcity, Quality, Condition and Provenance Matrix

| Dimension | Canonical Form | Boundary |
| --- | --- | --- |
| Availability / scarcity | Definition/context metadata | How often and where a source can appear; never an automatic stat multiplier. |
| Capability band | Definition relationship | What capability or progression requirement the item provides or consumes. |
| Craft quality | Definition or instance, by family | Crude, standard, refined, masterwork or other approved grades; affects supported fields only. |
| Condition | Runtime instance or batch | Wear, damage, spoilage, contamination, fracture, charge or integrity. |
| Provenance | Runtime/definition relationship | Source site, culture, creature, maker, owner, event and legal claim. |
| Significance | Definition/context metadata | Ordinary, culturally important, relic, authority proof or unique; controls presentation and preservation. |
| Value | Derived market context | Base valuation plus supply, demand, culture, legality, reputation, quality and condition. |

# Appendix D. Culture-Goods Matrix

| Culture | Core Item Emphasis | Ownership Boundary |
| --- | --- | --- |
| Hearthland Commons | Communal provisions, practical ward goods, farm and household supplies. | Concrete recipes and visuals remain Documents 04-05/25J/25K responsibilities. |
| Marchroad Leagues | Route ledgers, traveller kits, permits, maps and repair supplies. | No item may grant universal passage outside valid jurisdiction. |
| Brassroot Communes | Calibration tools, maker marks, repair parts and personhood-aware construct records. | Construct cores cannot be treated as generic loot when identity records exist. |
| Deepstone Compacts | Hall rations, survey tokens, mining tools, heat/water and underground industry goods. | Surface substitutes must preserve capability without copying culture identity. |
| Mirelight Covenants | Medicine satchels, reedwork, filters, water governance and cleansing goods. | Wetland expertise remains culture/context, not ancestry. |
| Verdant Pact Enclaves | Oath offerings, living weave, realm materials and negotiated growth items. | Detailed realm laws and meanings remain Documents 14/24D and Verdant package owners. |

# Appendix E. Package-to-Family Coverage

| Package | Required Coverage | Boundary |
| --- | --- | --- |
| Seed Start / Immediate Survival | Common gathered material, food/health fallback, primitive tool and light/container pathways. | No fixed named item, village or ruin is guaranteed. |
| Environment Packages | Biome-appropriate logs, fibres, forage, minerals, hazards and provenance. | Atlas owns distribution; Item Registry owns executable inventory definitions. |
| Civilisation / Settlements | Need supplies, profession tools, trade goods, records, projects, repairs and credentials. | Exact consumption and economy remain Documents 07/25J. |
| Extraction / Automation | Copper and iron chains, machine parts, power/fuel and maintenance goods. | Resource conservation and throughput remain Documents 05-06/08/18. |
| Practical Magic | Mana, runes, wards, cleansing, knowledge and route stabilisation. | Schools and detailed spell behaviour remain Document 09. |
| Ecology | Food, hide, fibre, reagents, samples, construct parts and trophies. | Creature document owns drop eligibility, harvesting and welfare. |
| Adventure | Keys, clues, salvage, relics, restoration components and boss proofs. | Sites/events own context and claims; items cannot guarantee placement. |
| Verdant Covenant | Six source materials, processed components, treatment, diplomacy and authority outcomes. | All remain Core Conditional until complete-realm gate passes. |
| Ancestral Veil | Threshold token, memory echo and emergency return only. | No full realm economy or progression chain. |
| Document Set 26 | Base cargo/container, corrosion/waterproofing extension hooks and optional pack admission. | All maritime items, vessel parts, fishing, diving and naval gear remain Set 26-owned. |

# Appendix F. Document 04 v1.0 Replacement Checklist

- Use fully qualified family and concrete item IDs; preserve aliases and tombstones for legacy short IDs.
- Remove POC Required/Alpha/Beta as shipped gameplay fields and replace them with canonical production metadata.
- Generate all eligible block item forms from Document 03 definitions and declare explicit exceptions.
- Declare exact parent, category, tags, stack/instance profile, use/equip/place actions and UI fields for every item.
- Declare quantity, quality, condition, durability, charge, spoilage, contamination, owner, provenance and legality fields only where required.
- Link every raw/refined material to a 25J resource family and every craftable item to recipe references.
- Link every creature-derived item to source, harvest, welfare, legality and fallback rules.
- Link every settlement bundle or crate to conserved underlying contents, transaction and project records.
- Link every key, map, contract, relic, boss proof and unique item to authoritative target records and recovery rules.
- Declare inventory, equipment, container, automation, NPC, trade, multiplayer and save/migration behaviour.
- Provide generated Godot Resources and validation reports compatible with 25D-25E.
- Prove production manifests contain no fixed Forest Hamlet, named POC villager, watchtower-delivery, goblin-raid or fixed portal item identities.

# Appendix G. Document 25I Acceptance Criteria

- Every 25G package has sufficient item-family coverage or an explicit conditional blocker.
- All family IDs follow 25B grammar and have one identity owner.
- Family boundaries avoid duplicate block, resource, loot, Atlas and runtime ownership.
- Stack and instance profiles preserve quantity, state, ownership and provenance.
- Rarity is not used as an automatic power ladder.
- Verdant Covenant has a complete conditional item package and Ancestral Veil remains teaser-bounded.
- Set 26 compatibility is explicit without premature maritime item design.
- 25J can derive resource, loot and recipe chains without inventing missing item classes.
- Document 04 v1.0 has a precise replacement checklist and acceptance gate.
- Risks, conditional families and open decisions remain visible rather than silently resolved.

# Navigation

- Previous: [[25H - Core Production Block Family Catalogue]]
- Next: [[25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix]]
- Related: [[04 - Items Registry v1.0 Replacement]]; [[25K - Asset Budgets and Forge Manifests]]; [[26A - Maritime and Naval Expansion Vision]]
