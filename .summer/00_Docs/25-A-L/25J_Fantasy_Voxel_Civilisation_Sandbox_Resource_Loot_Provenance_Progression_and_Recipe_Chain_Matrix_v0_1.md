---
title: "25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix"
document_id: "25J"
version: "0.1"
status: "Core Production Resource and Transformation Matrix Draft"
project: "Leyforge - Fantasy Voxel Civilisation Sandbox"
document_set: "25 - Post-Atlas Production Governance, Registries, Classification and Integration"
owner: "Ash"
depends_on:
  - "[[25B - Canonical Registry Kernel]]"
  - "[[25C - Domain Schemas and Completeness Contracts]]"
  - "[[25D - Content Packs, Manifests and Migration]]"
  - "[[25E - Validation Architecture and Release Gates]]"
  - "[[25F - Core Production Atlas Classification and Scope Lock]]"
  - "[[25G - Core Production Package Dependency and Progression Matrix]]"
  - "[[25H - Core Production Block Family Catalogue]]"
  - "[[25I - Core Production Item Family Catalogue]]"
next_document: "[[25K - Asset Budgets and Forge Manifest Contract]]"
tags: [leyforge, resources, recipes, loot, provenance, progression, economy, production, godot, summer-engine]
---

# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 25

# 25J - Resource, Loot, Provenance, Progression and Recipe-Chain Matrix

Version 0.1 - Core Production Material Ecology, Transformation, Reward and Registry-Handoff Draft

A governed matrix connecting the approved Core Production world packages to physical resource sources, conserved transformations, capability-based progression, contextual loot, provenance, ownership, fallbacks and the exact replacement requirements for Documents 05 and 06.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and production support: GPT-5.6 Thinking

---

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Initial draft | Creates 105 production chain contracts, 18 contextual loot grammars, 15 substitution groups and 12 provenance profiles; replaces the fixed POC material ladder with CAP-00 to CAP-10 capability pathways and defines the gates for Documents 05 and 06 v1.0. |

# Document Purpose

Document 25J converts the approved Core Production package, block-family and item-family obligations into a dependency-complete physical resource and transformation plan. It defines where important materials come from, how they are discovered, gathered, processed, stored, traded, consumed, repaired, recovered and rewarded; how alternate providers prevent seed dead ends; and how quantity, ownership, provenance and world consequence survive automation, simulation LOD, saves and optional content changes.

This document works at **chain-contract and grammar level**. It does not assign final numeric quantities, times, yields, prices, damage statistics, exact concrete recipe IDs or Godot implementations. Those remain owned by replacement Documents 05 and 06, the system documents that consume their outputs, the rewritten Document 18 and balance testing. The contracts here are precise enough that those documents cannot silently omit a source, consumer, by-product, fallback, ownership rule or acceptance test.

By proceeding from 25I to 25J, Ash has accepted the 25I item-family catalogue as the current working inventory intake. The chain identities and boundaries in this draft become working locks only when this document is approved. Exact values and any source-extending proper names remain recommendations until their owning document is approved.

# Design Sources and Supersession Rules

| Source | Authority Used by 25J |
| --- | --- |
| Documents 25A-25E | Governance, IDs, ownership, schemas, packs, migration, validation, seed QA, conservation and release gates. |
| Documents 25F-25G | Approved Core scope, packages, CAP-00 to CAP-10 graph, physical input/output requirements and fallbacks. |
| Documents 25H-25I | Approved block and item family boundaries, generated forms, state profiles and downstream registry intake. |
| Atlas 24J | Material ecology, origin, distribution, depletion, provenance, contextual loot, trade, relic, ownership and reward direction. |
| Atlas 24B-24K | Biome/realm sources, cultures, ecology, sites, bosses, structures, history, events and dynamic states that give resources context. |
| Documents 05-06 v0.1 | Retain unified recipe categories, stations, by-products, timed/batched production, old-material usefulness, prospecting and village/automation connections. POC chains, fixed watchtower delivery and universal ladder assumptions are legacy. |
| Documents 03-04/07-17 | Physical sources/forms, NPC consumption, automation, magic, creatures, structures, factions, quests, combat and UI requirements. |
| Document Set 26 | Owns detailed water, marine resources, fishing, vessel components, shipyard recipes, cargo, naval rewards and maritime economic chains. 25J defines only general expansion admission and base compatibility. |

> **Supersession Rule**
>
> Document 25J does not replace Documents 05 or 06 by itself. It supersedes their POC-specific chain selection and single-ladder planning assumptions, and becomes the approved transformation/progression intake for their v1.0 replacements. The old documents remain legacy design sources until both replacements pass their respective gates.

# Static Table of Contents

- 1. Locked Resource and Recipe-Chain Matrix Identity
- 2. Decision Boundary and Approval Status
- 3. Scope, Non-Goals and Handoff Boundaries
- 4. Canonical Terminology
- 5. Source-of-Truth and Registry Ownership
- 6. Chain Architecture and Planning Identity
- 7. Universal Resource and Chain Contract
- 8. Resource, Item, Block, Recipe and Runtime Separation
- 9. Material Ecology, Distribution and Source Contracts
- 10. Grade, Purity, Quality, Condition and Provenance
- 11. Renewability, Depletion, Regeneration and Carrying Capacity
- 12. Capability-Based Progression and Provider Diversity
- 13. Recipe and Transformation Classes
- 14. Inputs, Outputs, By-products, Waste and Conservation
- 15. Substitution, Compatibility and Fallback Groups
- 16. Discovery, Knowledge, Culture and Unlock Paths
- 17. Stations, Power, Time, Batching and Automation
- 18. Settlement Needs, Trade, Contracts and Economy
- 19. Ownership, Claims, Theft, Salvage and Restitution
- 20. Loot, Reward, Relic and Knowledge Grammars
- 21. Matrix Summary and Status Envelope
- 22. Technical Recovery and Migration Chains
- 23. Immediate Survival and Primitive Capability Chains
- 24. Timber, Fibre, Leather and Record-Media Chains
- 25. Stone, Ceramic, Glass and Mineral Chains
- 26. Agriculture, Food, Water and Health Chains
- 27. Copper, Iron, Salvage and Industrial Chains
- 28. Automation, Power, Logistics and Maintenance Chains
- 29. Creature Resource and Ethical Harvest Chains
- 30. Mana, Rune, Ward and Realm-Access Chains
- 31. Settlement, Culture, Trade and Public-Works Chains
- 32. Adventure, Loot, Relic and Aftermath Chains
- 33. Verdant Covenant Complete Realm Chains
- 34. Ancestral Veil Threshold Teaser Chains
- 35. Capability Reachability and Fallback Matrix
- 36. Core Package Coverage Matrix
- 37. Document Set 26 Compatibility and Admission Boundary
- 38. Validation, Seed QA and Acceptance Evidence
- 39. Document 06 v1.0 Replacement Gate
- 40. Document 05 v1.0 Replacement Gate
- 41. Production Sequence and Integration Gates
- 42. Decisions Locked by 25J
- 43. Handoff to 25K-25L and Main Documents
- 44. Risks, Redesign Triggers and Open Decisions
- Appendix A. Master Chain Register
- Appendix B. Substitution and Capability-Equivalent Groups
- Appendix C. Provenance, Ownership and Custody Profiles
- Appendix D. Contextual Loot Grammar Register
- Appendix E. Recipe-Class and Field Matrix
- Appendix F. CAP-00 to CAP-10 Reachability Checklist
- Appendix G. Document 06 v1.0 Replacement Checklist
- Appendix H. Document 05 v1.0 Replacement Checklist
- Appendix I. Document 25J Acceptance Criteria

# 1. Locked Resource and Recipe-Chain Matrix Identity

> **Locked Rule**
>
> A Core resource or reward chain is valid only when the world can produce or legitimately supply its inputs, the transformation conserves quantity and required state, the outputs have real consumers, alternate providers prevent inappropriate dead ends, ownership and provenance remain explainable, and failure or optional-content absence has a safe recorded outcome. A chain does not exist merely to fill a crafting menu, loot chest or material tier.

| Identity Layer | 25J Meaning | Player-Facing Result |
| --- | --- | --- |
| Material ecology | Resources originate from geology, ecology, civilisation, history, structures, creatures, realms or trade. | Materials feel like parts of a living world rather than arbitrary drops. |
| Physical transformation | Inputs become outputs through explicit tools, stations, labour, power, time and by-products. | Crafting and automation remain understandable and conserved. |
| Capability progression | Progression asks what capability is available, not whether one named ore or teacher spawned. | Different seeds and cultures support valid alternative paths. |
| Contextual reward | Loot grammars select existing items, knowledge and world outcomes using site/history/ownership context. | Exploration rewards remain useful and believable. |
| Provenance and custody | Important goods record source, maker, owner, event, claim and custody at the appropriate detail. | Trade, theft, restitution, relics and shared rewards have consequences. |
| Save and expansion safety | Definitions, instances, transactions and unavailable pack state remain distinct. | Updates and optional expansions do not silently delete inventories or progression. |

# 2. Decision Boundary and Approval Status

| Statement Type | Status in 25J |
| --- | --- |
| 25A-25I governance, Core packages, block and item families | Locked working authority. |
| Chain contracts, substitution groups, loot grammars and boundaries in this document | Proposed working locks; approved when Ash accepts 25J. |
| Exact concrete resource and recipe IDs | Deferred to Documents 06 and 05 v1.0. |
| Numeric yields, quantities, time, power, price, spoilage and balance | Deferred to replacement registries and testing. |
| Detailed station/machine/spell/NPC execution | Owned by Documents 07-09 and rewritten Document 18. |
| Maritime resources, vessel recipes, fishing and naval rewards | Owned by Set 26; only expansion compatibility is specified here. |

# 3. Scope, Non-Goals and Handoff Boundaries

## 3.1 In scope

- Core resource source and transformation contracts.
- CAP-00 to CAP-10 provider and fallback pathways.
- Recipe classes, station/power/time requirements and conservation boundaries.
- By-products, waste, salvage, repair, recycling and world aftermath.
- Contextual loot, relic, knowledge and boss/event reward grammars.
- Provenance, ownership, claims, custody and trade-shipment boundaries.
- Settlement need, project, warehouse, economy and automation handoffs.
- Verdant Covenant complete chains and Ancestral Veil teaser limits.
- Set 26 expansion-admission compatibility.
- Replacement gates for Documents 05 and 06 v1.0.

## 3.2 Explicit non-goals

- No final per-recipe ingredient counts, craft times, throughput, fuel rates or prices.
- No final concrete item/block/resource registry rows beyond approved family references.
- No complete economy simulation, currency system or merchant AI design.
- No detailed maritime/fishing/vessel/shipyard production chains.
- No new disconnected Atlas names or filler materials.
- No reintroduction of Forest Hamlet, watchtower delivery, goblin raid or fixed mana-pocket assumptions.

## 3.3 Handoff boundaries

| Concern | Canonical Owner after 25J |
| --- | --- |
| Material origin, ecology, distribution, cultural meaning and provenance context | Atlas 24J and related Atlas documents. |
| Executable resource progression definitions and pathway rules | Document 06 v1.0. |
| Concrete recipe definitions, quantities, stations, time, power and outputs | Document 05 v1.0. |
| Inventory form and stack/instance behaviour | Document 04 v1.0 using 25I. |
| World block/deposit/node forms and drops | Document 03 v1.0 using 25H. |
| Creature eligibility, anatomy, welfare and harvesting | Document 10 v1.0. |
| Settlement consumption, projects and trade execution | Documents 07/13 and settlement systems. |
| Automation transactions and machine processing | Document 08 v1.0. |
| Mana, rune, ritual and realm-route behaviour | Documents 09/14. |
| Loot site/event/boss context and objective outcomes | Documents 12/15/16. |
| UI, Codex, warnings and player-facing explanations | Document 17 v1.0 and 25K. |
| Godot runtime, authority, saves, LOD and tooling | Document 18 v1.0. |
| Maritime resource and production systems | Document Set 26. |

# 4. Canonical Terminology

| Term | Definition |
| --- | --- |
| Resource family | World/progression contract describing origin, availability, roles, states and relationships; not automatically an inventory item. |
| Material family | Transformable physical substance or component family referenced by blocks/items/recipes. |
| Chain contract | Planning record connecting source classes, transformations, outputs, capability, consumers, fallbacks and acceptance. |
| Concrete recipe | Executable stable definition with exact inputs, outputs, station, time, power, rules and UI fields. |
| Loot grammar | Contextual selection contract resolving valid items/knowledge/outcomes from site, history, owner and state. |
| Provenance | Source, maker, owner, event, culture, route, custody and claim history retained at the approved granularity. |
| Provider | Definition or generated instance able to satisfy a capability requirement under declared constraints. |
| Substitution group | Typed capability-equivalent input/output group with compatibility rules; not a free any-item wildcard. |
| Reservation | Authoritative quantity/instance claim held for recipe, project, contract, quest or unique reward. |
| By-product | Expected secondary output that remains conserved and has use, disposal or bounded abstraction rules. |
| Waste | Output requiring storage, treatment, world effect or safe abstraction; never silent deletion. |
| Recovery path | Approved fallback that restores progress or preserves state after failure, removal, migration or loss. |

# 5. Source-of-Truth and Registry Ownership

| Layer | Owns | Must Not Own |
| --- | --- | --- |
| Atlas | Why/where resources exist, ecology, culture, history, scarcity context, claims and reward meaning. | Executable stack rules, numeric recipes or current runtime quantities. |
| Document 06 / res definitions | Capability role, acquisition/provider classes, refinement stages and progression relationships. | Inventory instance serialisation or world placement implementation. |
| Document 04 / item definitions | Carried/equipped/consumed forms, state profiles and use actions. | World distribution, deposit generation or loot context. |
| Document 03 / block definitions | Placed sources, deposits, nodes, stations and block drops/states. | Inventory/market truth or resource ecology narrative. |
| Document 05 / recipe definitions | Exact transformations, substitutions, station/power/time, by-products and unlock fields. | Material origin or loot selection context. |
| Loot/site/event owners | Selection context, claims, uniqueness, contributions and aftermath. | Duplicate item/resource definitions. |
| Runtime/save | Current quantities, reservations, owners, condition, provenance, depletion, markets and transactions. | Authored identity semantics. |
| Forge/presentation | Models, textures, icons, audio/VFX and sockets. | Gameplay yields, progression or legal ownership. |

# 6. Chain Architecture and Planning Identity

Chain codes such as `RC-MET-02` are production-planning identities used by this document and the backlog. They are not shipped definition IDs. Document 05 v1.0 creates qualified `leyforge.core.recipe.<path>` definitions; Document 06 v1.0 creates qualified `leyforge.core.res.<path>` definitions; contextual reward grammars may use the approved `leyforge.core.loot.<path>` domain.

| Layer | Example | Rule |
| --- | --- | --- |
| Chain contract | RC-MET-02 Copper Smelting | May map to one or several concrete recipes. |
| Resource definition | leyforge.core.res.metal.copper | Owns material/progression context. |
| Item definition | leyforge.core.item.material.copper_ingot | Owns inventory behaviour. |
| Recipe definition | leyforge.core.recipe.smelting.copper_ingot | Owns exact executable transformation. |
| Runtime job | Persistent station/machine/project record | Owns current reservation and progress. |
| Transaction | Authoritative journal entry | Commits conserved input/output once. |
| Loot grammar | leyforge.core.loot.industry.workshop_salvage | Selects existing definitions contextually. |

# 7. Universal Resource and Chain Contract

| Field Group | Required Contract |
| --- | --- |
| Identity | Planning chain code; owning resource/recipe/loot domains; source pack; lifecycle status. |
| World source | Eligible biome/realm/structure/creature/settlement/trade providers, suitability and exclusions. |
| Acquisition | Tools, labour, skills/knowledge, permissions, hazards, depletion and alternate providers. |
| Inputs | Exact definitions or typed substitution groups, quantity units, state compatibility and reservation. |
| Transformation | Recipe class, station/tool, time, power/fuel/mana, environment, batching and interruption policy. |
| Outputs | Primary products, by-products, waste, knowledge, world-state changes and provenance. |
| Consumers | Player actions, blocks/items, NPC needs, machines, projects, trade, quests, magic and realm use. |
| Progression | Capabilities offered/required, unlock paths and no-dead-end proof. |
| Authority | Owner, permissions, contract, theft/salvage/restitution and multiplayer allocation. |
| Persistence | Near/far conservation, save records, migration, optional-pack absence and recovery. |
| Presentation | Recipe UI, source clues, warnings, quality/provenance cues and accessible feedback. |
| Validation | Schema, reference, conservation, reachability, seed, save, authority, LOD and performance evidence. |

# 8. Resource, Item, Block, Recipe and Runtime Separation

| Question | Correct Owner |
| --- | --- |
| Where copper can form and which regions value it | Atlas/resource definition. |
| Which placed ore block or deposit is mined | Block/worldgen definition and instance. |
| How raw copper stacks and records grade/source | Item definition and batch state. |
| How ore becomes ingot | Recipe definition and authoritative job. |
| How much ore remains in an explored deposit | Runtime world/save state. |
| Which settlement owns the shipment | Runtime ownership/contract record. |
| Which icon/model/sound presents it | Presentation/Forge facet. |
| Which capability it satisfies | Resource/chain capability relationship. |

> **No Duplicate Truth Rule**
>
> A recipe may reference source and output definitions, but it does not copy their ecology, stack schema, ownership history or presentation. A resource definition may describe eligible transformations, but it does not store live machine progress or current world quantities.

# 9. Material Ecology, Distribution and Source Contracts

| Source Class | Minimum Contract | Examples |
| --- | --- | --- |
| Renewable wild source | Habitat, carrying capacity, harvest pressure, recovery and damaged state. | Forage, herbs, fibre, resin. |
| Cultivated source | Seed/stock, suitability, labour, water/soil, disease, harvest and reseeding. | Grain, roots, orchards, textile crops. |
| Finite geological source | Geology, depth, grade, density, depletion, clues and aftermath. | Stone, copper, iron, salt. |
| Large deposit/node | Capacity, extraction interface, ownership, LOD and rehabilitation. | Automation-oriented ore/stone source. |
| Creature source | Personhood eligibility, anatomy, welfare, ecology, law and method. | Meat, hide, silk, essence. |
| Civilisation producer | Workshop, labour, knowledge, input supply, stock and market route. | Culture goods, medicine, components. |
| Salvage source | Original object/site, claim, damage, contamination and restoration alternative. | Scrap, machine parts, relic fragments. |
| Realm source | Realm law, stabilisation, native demand, route and Overworld utility. | Verdant materials. |
| Trade/import abstraction | Producer/route/destination/risk/replenishment; no infinite stock. | Regional substitute and scarce goods. |

# 10. Grade, Purity, Quality, Condition and Provenance

| Dimension | Meaning | Rule |
| --- | --- | --- |
| Grade | Natural concentration/yield potential of a source or raw batch. | Affects yield/by-products; does not create automatic rarity power. |
| Purity | Contamination or energetic/material composition. | Matters for mana, metallurgy, medicine and hazard stability. |
| Craft quality | Outcome of material, station, skill, specialist and process. | Only families that support quality store it. |
| Condition | Current integrity/freshness/charge/contamination. | Mutable runtime state with repair/preservation rules. |
| Provenance | Source, maker, owner, event, route or custody history. | Retained at detail appropriate to gameplay and save cost. |
| Scarcity | Availability in current world/region/market. | Contextual, not immutable item power. |
| Significance | Cultural, relic, authority or unique importance. | Controls custody/presentation/recovery, not universal stats. |
| Legality/claim | Who may gather, possess, trade, salvage or use. | Readable warnings and consequences required. |

# 11. Renewability, Depletion, Regeneration and Carrying Capacity

- Renewable does not mean infinite per tick; habitat and labour impose bounded recovery.
- Finite sources record remaining bands/quantity and visible aftermath where practical.
- Distant simulation may aggregate quantities but must preserve totals, reservations and irreversible events.
- Automation can increase throughput but cannot create input material without a declared producer or energy-to-matter rule owned by magic/realm systems.
- Overharvest, pollution, corruption or extraction consequences are package- and difficulty-aware, never universal random punishment.
- World repair may add an alternate provider or trade route, but does not refill explored deposits invisibly.

# 12. Capability-Based Progression and Provider Diversity

| Band | Primary Chains | Required Proof | Fallback Principle |
| --- | --- | --- | --- |
| CAP-00 Safe Spawn | RC-SUR-01/02/05/07 | Food/water-access equivalent, fuel/light, shelter and safe build area. | Spawn relocation, alternate provider or controlled generation failure. |
| CAP-01 Primitive Tools | RC-SUR-03/04/06/08; RC-MIN-01 | Gather, mine, store and repair common material capability. | Salvage, settlement loan/service or material substitution. |
| CAP-02 Provisions/Contact | RC-FOD-01-12; RC-SET-04/06 | Renewable provisions, health input, route/trade or settlement contact. | Forage, relief, imports, visiting specialist or alternate crop. |
| CAP-03 Copper Mechanisms | RC-MET-01-06; RC-AUT-01/02 | Conductive/mechanical material, gears/plates and simple power/logistics. | Salvage, trade, restored machine or approved alloy/technology. |
| CAP-04 Iron Support | RC-MET-07-12; RC-MIN-09 | Durable tools, structural frames, forge/refinement and project support. | Trade, salvage, equivalent structural capability or alternate design. |
| CAP-05 Practical Mana | RC-MAG-01-08; RC-CRE-06 | At least two discovery/provider families and practical infrastructure use. | Alternate provider, teacher, ruin/device, trade or world repair. |
| CAP-06 Regional Civilisation | RC-SET-01-08; RC-FOD-12 | Two cultures/settlements, real goods, routes, permissions and exchange. | Caravan/wayhouse, visiting specialist or alternate regional connection. |
| CAP-07 Regional Adventure | RC-ADV-01-08 | Reachable site, supplies, counterplay, contextual reward and aftermath. | Alternate eligible site/threat and safe-route repair. |
| CAP-08 Automation-to-Civilisation | RC-AUT-04-08; RC-SET-01/04 | Conserved production supplies settlement need/project/trade outcome. | Manual/NPC delivery, alternate producer or simpler chain. |
| CAP-09 Realm Access | RC-MAG-09; RC-VEI-01 | Knowledge/material/relationship route, arrival, return and rescue. | Alternate gate/guide or controlled omission/failure. |
| CAP-10 Verdant Resolution | RC-VRD-01-08 | Complete realm resource, society, site, authority and Overworld-use package. | Alternate authority outcome or equivalent knowledge/capability reward. |

> **Progression Rule**
>
> Copper and iron remain readable Core anchors, but progression is a branching capability graph. Copper alloy is an optional branch, Mana is parallel infrastructure, and culture, trade, salvage, research, restoration and realm materials may satisfy approved capabilities when their physical and knowledge contracts are complete.

# 13. Recipe and Transformation Classes

| Class | Contract | Typical Use |
| --- | --- | --- |
| Hand Recipe | Immediate low-complexity transformation; no persistent station required. | Primitive tools, simple bundles and field preparation. |
| Station Recipe | Transformation owned by a placed station with slots, time and permissions. | Workbench, forge, kiln, kitchen, rune table. |
| Machine Recipe | Timed/batched transformation with power, ports, throughput and LOD transaction rules. | Crusher, sawmill, furnace, sorter. |
| Cooking/Preservation Recipe | Food safety, freshness, spoilage and culture variants. | Meals, drying, smoking, fermentation. |
| Repair/Maintenance Recipe | Consumes compatible repair stock and changes condition/state without replacing identity. | Tools, machines, blocks and infrastructure. |
| Salvage/Recovery Recipe | Dismantles eligible objects under ownership/claim rules and produces bounded fractions. | Ruins, machines, equipment and event aftermath. |
| Project Recipe | Staged exact-resource reservation and labour transforming structure/settlement state. | Buildings, roads, public works and living construction. |
| Automation Network Contract | Authoritative transfer/production relationship across machines and storage. | Extraction -> processing -> warehouse. |
| Rune/Magic Recipe | Uses mana, purity, knowledge, risk and substrate fields. | Runes, wards, cleansing and couplers. |
| Ritual/Route Recipe | Multi-participant/world-state transformation with safe failure and persistent aftermath. | Realm routes and major cleansing. |
| Culture Recipe Facet | Culture-owned technique/presentation applied to common physical ingredients. | Signature goods without duplicate economy logic. |
| Quest/Event Resolution Recipe | Consumes/reserves/returns physical goods as part of authoritative objective/outcome. | Relief, restitution, restoration and contracts. |
| Realm Recipe | Realm-law-aware transformation with native demand and Overworld utility. | Verdant living construction and stabilisation. |
| Generated Shape/Variant Recipe | Tool-generated conversions for eligible material/shape sets with explicit exceptions. | Slabs, stairs and construction variants in Document 03/05. |

# 14. Inputs, Outputs, By-products, Waste and Conservation

- Every input is reserved before irreversible processing and released, consumed or returned exactly once.
- Every output uses integer or explicitly scaled fixed-point quantities defined by the technical plan; floating display values cannot own stock truth.
- By-products are declared outputs. They may be useful, hazardous, recyclable, compostable or safely abstracted only by an explicit rule.
- Failure recipes declare what is consumed, returned, damaged, emitted or transformed.
- Split/merge, machine buffering, warehouse transfer, NPC use, project reservation and multiplayer allocation use the same conservation service.
- Near/far simulation must reconcile to the same net transaction results within approved tolerances; no hidden yield bonus at distance.
- Packed stations, containers and optional pack removal cannot duplicate contents or stored progress.

# 15. Substitution, Compatibility and Fallback Groups

| Group | Eligible Provider Classes | Compatibility Rule |
| --- | --- | --- |
| SUB-01 Shelter Material | Timber, common stone, earth/brick, reed/cane or salvaged construction kit. | Must satisfy weather, support and placement capability; presentation may differ. |
| SUB-02 Cutting Edge | Sharp stone, copper/alloy, iron, chitin/bone specialist edge or salvage. | Target hardness and durability band must be valid. |
| SUB-03 Common Fuel | Firewood, charcoal, peat, coal, lamp oil or approved magical heat. | Recipe declares heat class, contamination and renewable/finite preference. |
| SUB-04 Cordage and Flexible Binding | Plant fibre, bast/reed, wool, leather thong, creature silk or culture good. | Tensile, wetness, heat and magic compatibility checked. |
| SUB-05 Structural Masonry | Common stone, cut stone, brick, deepstone or approved living construction. | Load, hazard and repair class required; no universal cosmetic substitution. |
| SUB-06 Staple Provision | Grain, root crop, mushroom, orchard/forage, animal product or imports. | Nutrition, renewability and settlement availability required. |
| SUB-07 Basic Medicine | Medicinal herb, fungus, creature reagent, culture medicine or healer service. | Condition tags and diagnosis coverage must match. |
| SUB-08 Preservation | Salt, drying, smoking, fermentation, cold/magic storage or frequent fresh supply. | Shelf-life and world-setting effects explicit. |
| SUB-09 Copper Mechanism Capability | Copper, approved copper alloy, restored mechanism, trade component or culture technology. | Conductive/mechanical capability and CAP-03 proof required. |
| SUB-10 Durable Structural Capability | Iron, approved equivalent material, restored frame, imported component or alternative structure design. | CAP-04 tool/load/repair capability required. |
| SUB-11 Conductive/Ward Material | Copper conductor, silver-like specialist metal, rune conductor, mana crystal pathway or recovered device. | Magic/power compatibility and risk declared. |
| SUB-12 Sealant and Weatherproofing | Resin/pitch, wax/oil-like culture compound, fitted ceramic/stone solution or Set 26 extension. | Environment and flammability constraints required. |
| SUB-13 Light and Visibility | Fire/torch, lamp oil, mana light, bioluminescent safe source or settlement service. | Duration, hazard, fuel and accessibility cue explicit. |
| SUB-14 Mana Provider | Mineral, leyline, creature essence, ruin/device, culture teacher/trade or realm material. | At least two valid discovery families per supported world profile. |
| SUB-15 Cleansing Provider | Herbal/fungal reagent, filter/charcoal, ward/ritual, specialist service or natural recovery. | Hazard class, waste and outcome limits declared. |

> **Substitution Rule**
>
> A substitution group is capability-typed. `any_material` and unrestricted `any_ingot` are prohibited where hardness, nutrition, conductivity, purity, culture, law, realm compatibility or presentation matters.

# 16. Discovery, Knowledge, Culture and Unlock Paths

| Unlock Source | Permitted Role | Constraint |
| --- | --- | --- |
| Material encounter | Reveal simple uses, source clues or research eligibility. | Does not automatically grant advanced cultural/ritual technique. |
| Station construction | Expose compatible recipe families. | Station alone does not bypass knowledge, permission or material capability. |
| NPC/culture teaching | Teach technique, substitutions, law and quality practice. | Requires present teacher/service or retained knowledge record. |
| Books/records/ruins | Provide recipe, map, weakness or history knowledge. | Loot grammar checks duplicates and fallback. |
| Experimentation/research | Discover bounded recipe variants from valid inputs. | Deterministic and logged; no uncontrolled random recipe explosion. |
| Faction/reputation | Grant access, permission, contracts or protected technique. | Actions and ownership remain meaningful. |
| Boss/event outcome | Unlock proof, knowledge, service or material path. | Alternative outcomes cannot become progression dead ends. |
| Realm relationship | Unlock realm-law-aware recipes and materials. | Requires safe route and native-world consequence. |
| World setting/tutorial | Reveal hints or simplify requirements. | Must not inject fixed POC content or coordinates. |

# 17. Stations, Power, Time, Batching and Automation

| Concern | Requirement |
| --- | --- |
| Station identity | References exact admitted block/station definition and required interfaces. |
| Power | Declares manual, fuel, mechanical, mana or other approved provider; idle/blocked behaviour explicit. |
| Time | Uses deterministic work units/ticks; pause/resume/interruption policy recorded. |
| Batching | Batch size, buffer, state compatibility and partial-progress rules explicit. |
| Throughput | Measured and profile-budgeted; UI explains bottleneck and blocked output. |
| NPC labour | Uses same resource and recipe truth with job/skill modifiers; no free hidden goods. |
| Quality | May depend on inputs, station, skill, specialist and process only where supported. |
| LOD | Detailed nearby and aggregate distant execution reconcile through authoritative transactions. |
| Maintenance | Wear/service is readable, bounded and package-specific; normal machines warn/shut down before destructive failure. |
| Authority | Clients request actions; authoritative world validates ownership, inputs, power and output space. |

# 18. Settlement Needs, Trade, Contracts and Economy

| Need / Function | Required Physical Chains | Economy Rule |
| --- | --- | --- |
| Housing | Timber/stone/brick, fasteners, furnishings and repair. | Projects reserve exact stock; substitutions respect blueprint/material kit. |
| Provisions | Agriculture, forage, preserved food, feed and water access. | Warehouses track stock, spoilage and emergency reserves. |
| Health | Medicine, clean water, fuel, sanitation and treatment tools. | Service capacity depends on real supplies and labour. |
| Work | Tools, stations, machine parts, fuel and maintenance. | Outputs require producers and inputs. |
| Safety | Guard gear, fortifications, wards, light and repair. | Readiness consumes/maintains real stock. |
| Infrastructure | Road fill, bridge materials, carts, storage and public works. | Trade route capacity and loss are physical/abstracted with causes. |
| Morale | Culture goods, food variety, records, festivals/services and safe housing. | No single decorative item solves morale universally. |
| Trade | Cargo, manifests, permissions, routes, risks and receiving stock. | Prices arise from supply/demand/context, not immutable item value. |
| Contracts/Taxes | Goods or services transfer under explicit authority and ledger. | Donation, sale, tax, tribute and theft remain distinct transactions. |

# 19. Ownership, Claims, Theft, Salvage and Restitution

| State | Meaning | Required Behaviour |
| --- | --- | --- |
| Unclaimed | No valid owner/claim under current world law. | May still carry site/cultural provenance. |
| Personal | Owned by player/NPC persistent identity. | Transfer requires valid action or crime response. |
| Settlement/Faction | Held as public, warehouse, armoury, project or institutional stock. | Permissions and reservations enforced. |
| Contract Reserved | Held for recipe, shipment, project, quest or delivery. | Cannot be double-consumed or casually withdrawn. |
| Sacred/Restricted | Culturally, legally or magically controlled. | Warnings, custody and consequences required. |
| Stolen/Disputed | Possession and legitimate ownership differ. | Trade, guards, restitution and evidence systems can react. |
| Salvage Eligible | Owner abandoned/lost or law grants recovery under conditions. | Claim is determined by site/event/law, not damage alone. |
| Unique Reserved | One authoritative instance/custody record. | Loss/recovery and proxy progression rules prevent duplication/dead ends. |

# 20. Loot, Reward, Relic and Knowledge Grammars

Loot is resolved from context rather than a universal rarity table. A grammar may produce materials, equipment, documents, permissions, reputation, service access, restoration opportunity or no physical item when that is the coherent outcome.

| Grammar ID | Name | Context / Slots | Ownership / Fallback |
| --- | --- | --- | --- |
| leyforge.core.loot.survival.wilderness_cache | Wilderness Survival Cache | Forage/shelter context; food, fuel, simple tool material, map clue. | No advanced tier reward; owner normally unclaimed or former traveller. Material/knowledge fallback. |
| leyforge.core.loot.civilisation.worker_cache | Worker and Tool Cache | Active/abandoned job site; tools, repair stock, food, work records. | Ownership depends on settlement/site state. Damaged tool, scrap or job knowledge. |
| leyforge.core.loot.civilisation.relief_stock | Relief and Emergency Stock | Disaster, refugee, infirmary or public store context. | Strong restitution/aid ownership rules. Reputation/quest evidence if goods unavailable. |
| leyforge.core.loot.trade.shipment | Trade Shipment Resolution | Manifest, route, producer, destination, danger and loss state. | Exact physical goods; no infinite merchant generation. Damaged goods, claim document or route clue. |
| leyforge.core.loot.industry.workshop_salvage | Workshop and Machine Salvage | Industry state, machine family, damage and claim. | Components, maintenance stock, designs and scrap. Knowledge, rubble or repair opportunity. |
| leyforge.core.loot.extraction.mine_cache | Mine and Extraction Cache | Geology, operator, depth, hazard and depletion. | Ore/sample/tools/supplies consistent with site. Survey clue or salvage component. |
| leyforge.core.loot.culture.archive | Culture Archive and Record Cache | Culture, institution, history, law and damage state. | Books, maps, contracts, art/culture goods; custody important. Copied knowledge or restoration task. |
| leyforge.core.loot.sacred.offering | Sacred Offering and Custody Grammar | Faith/culture site, active/abandoned status and law. | Offerings remain owned/interpreted; taking may create consequence. Blessing/knowledge/permission rather than item. |
| leyforge.core.loot.adventure.dungeon_material | Dungeon Material Cache | Site grammar, depth, occupants, history and solved state. | Useful materials and tools tied to environment. Knowledge, repair stock or alternate material. |
| leyforge.core.loot.ecology.nest_hoard | Nest, Den and Hoard Grammar | Species behaviour, diet, territory, stolen-goods history. | Natural material, prey remains, stolen item or evidence. Ecology clue or non-material discovery. |
| leyforge.core.loot.faction.supply | Faction Supply and Encampment Grammar | Faction role, logistics, morale, legality and event state. | Food, gear, contracts, stolen goods and intelligence. Prisoner/info/reputation outcome. |
| leyforge.core.loot.boss.outcome | Boss Outcome Reward Grammar | Outcome, contribution, territory, faction and aftermath. | Proof, material, knowledge, reputation and world change. Capability-equivalent non-item reward. |
| leyforge.core.loot.relic.fragment | Relic Fragment and Restoration Grammar | History, relic reservation, site/custody and condition. | Fragment, restoration clue, provenance and interpretation. Replica, knowledge or alternate relic. |
| leyforge.core.loot.knowledge.exploration | Map, Recipe and Research Grammar | Discovery context, player knowledge and duplication policy. | New clue/recipe/map or improved certainty. Currency/material/reputation when already known. |
| leyforge.core.loot.structure.restoration | Restoration and Public-Works Reward | Restored structure, contributors, owner and project outcome. | Payment, reputation, service unlock, leftover material and history. Service/permission/relationship reward. |
| leyforge.core.loot.event.aftermath | Dynamic Event Aftermath Grammar | Event cause, casualties, claims, shortages and current state. | Salvage, relief need, evidence and restitution choices. Quest/event state only when physical reward invalid. |
| leyforge.core.loot.realm.verdant_memory | Verdant Memory and Growth Grammar | Realm relationship, seasonal state, consent and outcome. | Living material, memory knowledge and relationship reward. Knowledge-only or delayed gift. |
| leyforge.core.loot.realm.ancestral_threshold | Ancestral Threshold Evidence Grammar | Teaser route, safety status and non-extractive boundary. | Bounded evidence/knowledge; no farmable production resource. Overworld testimony or Codex clue. |

# 21. Matrix Summary and Status Envelope

| Measure | Count |
| --- | --- |
| Total proposed chain contracts | 105 |
| Core Required | 90 |
| Core Conditional | 13 |
| Teaser Only | 2 |
| Contextual loot grammars | 18 |
| Substitution groups | 15 |
| Provenance profiles | 12 |
| Recipe/transform classes | 14 |

These counts are dependency-planning results, not quotas. Document 05 v1.0 may create multiple concrete recipes beneath one chain or combine closely related operations when state, balance and UI remain clear. It must not create recipes merely to match a count.

# 22. Technical Recovery and Migration Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-REC-01<br>**Quantity Reconciliation and Quarantine** | Invalid stack, interrupted transaction, missing definition or incompatible batch state. | Registry/save validator separates payload and records cause; no ordinary crafting station. | Recovered quantity, quarantine payload, migration receipt or explicit unresolved state.<br>Capability: Save integrity and player trust. | Restore exact definition, approved alias/substitution or admin-visible quarantine.<br>Core Required / 25D-25E / Runtime |
| RC-REC-02<br>**Definition Supersession Migration** | Deprecated item, block, resource or recipe reference plus declared replacement/migration rule. | Ordered migration transforms references and preserves affected state fields. | Replacement reference, tombstone, receipt and rollback evidence.<br>Capability: Version-safe content evolution. | Keep deprecated identity resolvable in archive/migration scope; never reuse ID.<br>Core Required / 25B-25D |
| RC-REC-03<br>**Optional-Pack Removal Preservation** | Persistent state references an unavailable optional definition or extension facet. | Pack-removal recovery preserves opaque payload and disables execution safely. | Missing-content representation, retained ownership/provenance and reinstall path.<br>Capability: Expansion-safe saves. | Reinstall compatible pack, migrate to approved substitute, or retain quarantined state.<br>Core Required / 25D / Set 26 Admission |
| RC-REC-04<br>**Interrupted Production Rollback** | Timed, automated, project or ritual transformation is interrupted by unload, crash, authority transfer or failure. | Authoritative transaction journal commits, pauses or rolls back reserved inputs deterministically. | Inputs returned or progress retained; outputs appear once only; failure by-products recorded.<br>Capability: Conservation across runtime failure. | Resume from journal or restore last committed state.<br>Core Required / Document 18 / 25E |

# 23. Immediate Survival and Primitive Capability Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-SUR-01<br>**Local Forage to Immediate Food** | Wild berries, edible fungi, safe plant foods or equivalent local provider. | Inspection/harvest; optional simple preparation. | Immediate food, seed clue, compostable remains and Codex knowledge.<br>Capability: CAP-00 safe local survival. | Alternate forage, settlement relief, trade or spawn repair.<br>Core Required / Seed Start / Ecology |
| RC-SUR-02<br>**Firewood and Emergency Heat** | Fallen branches, common logs, peat or approved fuel substitute. | Gather, split/dry or bundle; burn in fire/light interface. | Heat, light, cooking access, ash and charcoal opportunity.<br>Capability: CAP-00 fuel/light path. | Lamp oil, coal, resin fuel or emergency heat pack.<br>Core Required / Survival / Frontier |
| RC-SUR-03<br>**Primitive Cutting Tool** | Branch/handle, sharp stone or capability-equivalent edge, fibre binding. | Hand assembly at simple work surface. | Crude axe/knife/sickle capability and repairable components.<br>Capability: CAP-01 wood and plant harvesting. | Salvaged tool, trader, settlement loan or alternate sharp material.<br>Core Required / Primitive Tools |
| RC-SUR-04<br>**Primitive Mining Tool** | Handle, shaped stone head, fibre or fastener. | Hand shaping and assembly. | Crude pick/hammer capability, rubble and repair path.<br>Capability: CAP-01 common stone and shallow ore access. | Salvaged tool, NPC service or alternate head material.<br>Core Required / Primitive Tools |
| RC-SUR-05<br>**Immediate Shelter Materials** | Logs/branches, soil/turf, common stone, fibre and construction block forms. | Hand shaping and placement; no fixed blueprint required. | Weather cover, safe sleeping/respawn class, storage space and build knowledge.<br>Capability: CAP-00/01 shelter and construction area. | Cave/ruin shelter, settlement lodging or alternate local materials.<br>Core Required / Seed Start / Building |
| RC-SUR-06<br>**Simple Storage and Carrying** | Timber, reed/cane, fibre, hide or equivalent container material. | Hand or workbench assembly. | Crate, basket, sack, basic chest or backpack capability.<br>Capability: CAP-01 inventory and loss prevention. | Recovered container, settlement storage service or bundled ground cache.<br>Core Required / Inventory / Storage |
| RC-SUR-07<br>**Clean-Water Access and Container** | Freshwater source or settlement water access, container, fuel/filter input when required. | Collect, inspect, boil/filter/purify according to world settings. | Drinkable-water state, filled container, residue/filter waste and contamination record.<br>Capability: CAP-00 health support where water rules apply. | Settlement well, rain capture, trade supply or world-setting reduction.<br>Core Required / Survival / Health |
| RC-SUR-08<br>**Field Repair and Salvage** | Damaged tool/equipment, compatible repair material, repair kit or salvage tool. | Inspect, dismantle, patch or replace bounded components. | Restored condition, recovered components, scrap and provenance update.<br>Capability: CAP-01 continuity without disposable gear. | Settlement craft service, replacement item or controlled breakdown.<br>Core Required / Repair / Player Trust |

# 24. Timber, Fibre, Leather and Record-Media Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-ORG-01<br>**Hardwood Timber Processing** | Hardwood logs/branches with lawful harvest provenance. | Hand hewing or sawmill/workbench cutting. | Planks, beams, poles, chips and sawdust.<br>Capability: Shelter, tools, furniture and settlement construction. | Softwood, reclaimed timber, trade or stone construction substitute.<br>Core Required / Temperate Forestry |
| RC-ORG-02<br>**Softwood Framing and Polework** | Softwood logs, branches and resinous offcuts. | Sawing, splitting and seasoning. | Frames, poles, planks, kindling and resin by-product.<br>Capability: Frontier shelter, routes and early infrastructure. | Hardwood, reed/cane, reclaimed framing or stone supports.<br>Core Required / Boreal / Upland Forestry |
| RC-ORG-03<br>**Charcoal Production** | Dry timber/offcuts and enclosed kiln/fire process. | Slow controlled carbonisation. | Charcoal, ash, heat and recoverable fines.<br>Capability: Reliable industry fuel and filter input. | Coal, peat, fuelwood or magical heat for compatible recipes.<br>Core Required / Forestry / Industry |
| RC-ORG-04<br>**Resin, Pitch and Sealant** | Tree resin, pitch-bearing wood or salvage; container and heat. | Collect, clarify, reduce or blend. | Adhesive, sealant, route repair, lamp/fuel additive and residue.<br>Capability: Repair, waterproofing and machine maintenance. | Wax/oil-based approved sealant, culture recipe or Set 26 extension.<br>Core Required / Forestry / Routes |
| RC-ORG-05<br>**Plant-Fibre Cordage** | Common plant fibre, bast fibre, reed or approved equivalent. | Dry, comb, twist and braid. | Cord, rope, binding, net-like generic textile input and waste fibre.<br>Capability: Tools, storage, building, hauling and projects. | Leather thong, wool cord, creature silk or trade.<br>Core Required / All Regions |
| RC-ORG-06<br>**Reed and Cane Goods** | Reed/cane with wetland provenance. | Dry, split, weave and bind. | Mats, baskets, screens, light panels and paper pulp.<br>Capability: Wetland construction, storage, filtration and trade. | Timber slats, plant fibre, cloth or imported goods.<br>Core Required / Wetland / Mirelight |
| RC-ORG-07<br>**Textile Fibre to Cloth** | Cultivated textile fibre, retting/washing water and tools. | Ret, clean, spin, weave and finish. | Cloth, thread, scraps and dye-ready textile.<br>Capability: Clothing, bandages, sacks, banners and culture goods. | Wool, hide/leather, reed matting or trade imports.<br>Core Required / Agriculture / Textile |
| RC-ORG-08<br>**Wool to Insulating Textile** | Raw wool, washing access and spinning/weaving tools. | Clean, card, spin, weave/felt. | Warm cloth, padding, bedding and low-grade scraps.<br>Capability: Cold protection, housing and morale. | Plant textile, hide/fur, culture imports or emergency heat gear.<br>Core Required / Domestic Ecology |
| RC-ORG-09<br>**Hide to Leather and Parchment** | Lawfully sourced raw hide, salt/tannin/smoke and tools. | Clean, preserve, tan and cut; optional parchment finishing. | Leather, straps, armour panels, parchment and waste scraps.<br>Capability: Containers, gear, records and repair. | Textile, chitin, bark fibre or trade.<br>Core Required / Creature Resources / Craft |
| RC-ORG-10<br>**Paper, Ink and Record Media** | Fibre/reed pulp or parchment; pigment/ink binder. | Pulp, press, dry and prepare writing surface. | Paper sheets, maps, books, contracts, labels and pulp waste.<br>Capability: Knowledge, trade, quests and administration. | Parchment, carved tablet, culture medium or magical record.<br>Core Required / Knowledge / Civilisation |

# 25. Stone, Ceramic, Glass and Mineral Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-MIN-01<br>**Common Stone to Rubble and Cut Stone** | Surface/shallow stone blocks, loose rock or lawful salvage. | Break, sort, cut and dress. | Rubble, aggregate, cut stone, slabs and chips.<br>Capability: Shelter, roads, foundations and repair. | Timber construction, earthen blocks or imported masonry.<br>Core Required / Geology / Building |
| RC-MIN-02<br>**Limestone to Lime and Mortar** | Limestone/chalk, fuel, kiln and water. | Crush, calcine, slake and mix. | Quicklime/slaked lime, mortar, plaster and kiln emissions/ash.<br>Capability: Masonry, sanitation, preservation and restoration. | Clay mortar, culture binder or dry-stone construction.<br>Core Required / Karst / Construction |
| RC-MIN-03<br>**Clay to Brick and Ceramic** | Clay, temper/sand, water, moulding tools and fuel. | Shape, dry and fire in kiln. | Brick, tile, pottery, pipe components, shards and rejects.<br>Capability: Housing, storage, furnaces and infrastructure. | Stone, timber, reed/cane or salvaged ceramic.<br>Core Required / Clayworks / Settlement |
| RC-MIN-04<br>**Sand to Glass** | Suitable sand, flux/supporting mineral, fuel and furnace. | Wash, mix, melt and form. | Glass panes, vessels, lenses, slag/reject glass.<br>Capability: Lighting, storage, instruments, wards and UI-visible machinery. | Polished crystal, oiled parchment window, culture substitute or trade.<br>Core Required / Industry / Magic |
| RC-MIN-05<br>**Aggregate to Road and Drainage Fill** | Rubble, gravel, sand, slag or approved waste fraction. | Crush, grade, compact and place through project recipe. | Road base, drainage fill, embankment and reusable spoil.<br>Capability: Routes, settlements and automation access. | Timber corduroy, stone paving, raised causeway or local earthworks.<br>Core Required / Routes / Infrastructure |
| RC-MIN-06<br>**Salt and Mineral Preservative** | Salt-bearing source, brine deposit abstraction or trade stock. | Mine/collect, dry, purify and package. | Preservation salt, medicine/cleaning input and mineral residue.<br>Capability: Food preservation, hide treatment and health. | Smoking, drying, fermentation, cold storage or trade.<br>Core Required / Food / Health / Trade |
| RC-MIN-07<br>**Peat and Wetland Fuel** | Peat block/source with ecology and extraction limits. | Cut, dry and bundle. | Peat fuel, soil amendment residue and depleted-ground state.<br>Capability: Frontier heat and local industry fallback. | Firewood, charcoal, coal or imported fuel.<br>Core Required / Wetland / Moorland |
| RC-MIN-08<br>**Prospecting Sample and Grade Analysis** | Ore/stone sample, survey tool and knowledge profile. | Sample, inspect and compare against geology clues. | Deposit knowledge, grade/purity estimate and retained sample.<br>Capability: Discovery without fixed guaranteed nodes. | NPC prospector, map/archive, restored mine or trade information.<br>Core Required / Exploration / Extraction |
| RC-MIN-09<br>**Deepstone and Specialist Masonry** | Deepstone or hard-rock source, capable tools and cutting station. | Extract, stabilise and dress. | Heavy masonry, reinforcement, hazard-resistant blocks and chips.<br>Capability: Deep structures, dungeons and advanced infrastructure. | Iron frame, ordinary stone with higher upkeep or culture alternative.<br>Core Conditional / Underground / Adventure |

# 26. Agriculture, Food, Water and Health Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-FOD-01<br>**Staple Grain Agriculture** | Viable grain seed, suitable soil, season, water access and labour. | Plant, tend, harvest, thresh and reserve seed. | Grain, straw, seed stock and spoiled/compost fraction.<br>Capability: Renewable provisions, feed and trade. | Root crops, gathered foods, imports or relief supply.<br>Core Required / Agriculture / Provisions |
| RC-FOD-02<br>**Root-Crop Agriculture** | Tuber/seed stock, suitable soil and labour. | Plant, tend, harvest and store. | Root food, propagation stock, greens/feed and spoilage.<br>Capability: Cold/poor-soil provisions fallback. | Grain, mushrooms, livestock products or trade.<br>Core Required / Frontier Agriculture |
| RC-FOD-03<br>**Orchard and Berry Production** | Graft/seedling, suitable climate, pollination/ecology and labour. | Plant, mature, prune and harvest. | Fruit, seeds/grafts, preserves input and windfall feed.<br>Capability: Long-term food, morale and culture goods. | Wild berries, imported fruit or other staples.<br>Core Required / Temperate Agriculture |
| RC-FOD-04<br>**Mushroom and Fungal Food** | Safe fungal culture or wild edible mushroom source. | Identify, cultivate/harvest, clean and prepare. | Fresh mushrooms, dried food, spores and compost.<br>Capability: Cave/forest provisions and trade. | Root crops, forage, settlement supply or alternate cave food.<br>Core Required / Forest / Fungal Cavern |
| RC-FOD-05<br>**Domestic Animal Products** | Healthy livestock/work-beast population, feed, welfare and husbandry labour. | Feed, breed, collect renewable products or humane slaughter under settings/law. | Milk/eggs/wool/meat/hide as species permits, manure and husbandry records.<br>Capability: Food, textile, agriculture and settlement economy. | Wild game, crops, trade or culture-specific plant alternatives.<br>Core Required / Domestic Ecology |
| RC-FOD-06<br>**Wild Game and Ethical Harvest** | Eligible non-person wildlife, lawful hunting context and suitable tools. | Track, hunt, recover and butcher with ecology limits. | Meat, hide, bone, samples and waste/compost.<br>Capability: Survival, equipment and research. | Livestock, plant foods, trade or non-lethal sample collection.<br>Core Required / Wildlife / Combat |
| RC-FOD-07<br>**Basic Meal Preparation** | One or more valid food inputs, clean preparation surface, fuel where required. | Combine, cook and portion. | Meal, scraps, cooking by-products and recipe knowledge progress.<br>Capability: Player/NPC nutrition and morale. | Raw safe food, preserved ration, trade meal or accessibility setting.<br>Core Required / Cooking / Survival |
| RC-FOD-08<br>**Preserved Rations** | Fresh food, salt/smoke/drying/fermentation provider, container and time. | Preserve and package. | Long-life ration, preservation residue and quality/provenance state.<br>Capability: Travel, events, settlements and distant logistics. | Cold storage, magical preservation, frequent fresh supply or reduced spoilage setting.<br>Core Required / Provisions / Trade |
| RC-FOD-09<br>**Animal Feed and Fodder** | Straw, grain fractions, roots, forage or by-products. | Sort, mix and bundle. | Feed, bedding and compostable remainder.<br>Capability: Livestock welfare and renewable production. | Pasture access, alternate crop, trade or reduced husbandry density.<br>Core Required / Agriculture / Ecology |
| RC-FOD-10<br>**Herbal Remedy and Bandage** | Medicinal herb/fungus, clean water/alcohol-like approved solvent, cloth/bandage and knowledge. | Clean, grind, infuse, compound and package. | Basic medicine, bandage, spent plant matter and treatment record.<br>Capability: CAP-02 player and settlement health. | Healer service, creature reagent, trade medicine or rest/recovery.<br>Core Required / Health / Settlement |
| RC-FOD-11<br>**Antidote and Cleansing Medicine** | Identified toxin/corruption class, medicinal fungus/herb, filter/charcoal or mana reagent. | Diagnose, extract, purify and compound. | Antidote/cleanser, contaminated waste and knowledge entry.<br>Capability: Hazard counterplay and infirmary capability. | Specialist NPC, ward cleansing, rest/care or avoidance route.<br>Core Required / Health / Magic |
| RC-FOD-12<br>**Relief and Emergency Supply Pack** | Preserved food, medicine, fuel, clean-water containers, blankets/tools and contract crate. | Bundle through project/contract recipe with exact conserved contents. | Sealed relief package, manifest and delivery transaction.<br>Capability: Settlement shortage/event response and CAP-06 trade. | Direct warehouse delivery, caravan imports or multiple smaller donations.<br>Core Required / Settlement / Events |

# 27. Copper, Iron, Salvage and Industrial Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-MET-01<br>**Copper Ore Extraction and Concentration** | Copper deposit/vein/salvage, capable tool or machine, permissions and fuel support. | Mine/salvage, sort, crush and concentrate. | Raw copper ore/concentrate, gangue, stone by-product and depletion state.<br>Capability: CAP-03 mechanical material access. | Trade, salvage, restored mine or approved equivalent conductive/mechanical material.<br>Core Required / Extraction / CAP-03 |
| RC-MET-02<br>**Copper Smelting** | Raw copper ore/concentrate, charcoal/coal/heat, furnace and optional flux. | Smelt, skim and cast. | Copper ingot, slag, emissions/ash and quality record.<br>Capability: CAP-03 refined metal. | Re-melt salvage, trade ingots or culture smelting service.<br>Core Required / Refinement / CAP-03 |
| RC-MET-03<br>**Copper Plate and Sheet** | Copper ingot, forge/hammer or rolling-equivalent station and fuel/power. | Heat, hammer/roll and trim. | Copper plate, offcuts and scale.<br>Capability: Machines, conduits, repair and construction. | Salvaged plate, trade or approved alternate material.<br>Core Required / Automation / Building |
| RC-MET-04<br>**Copper Wire and Connectors** | Copper ingot/rod, drawing/forming tools and insulation/support material where needed. | Draw, cut and fit connectors. | Wire/connector, scrap and calibration grade.<br>Capability: Control, signal, basic power and mana interface. | Conductive precious metal, rune conductor, restored component or trade.<br>Core Required / Automation / Magic |
| RC-MET-05<br>**Copper Gears and Mechanisms** | Copper ingot/plate, precision tool/station and design knowledge. | Cut, cast/forge, finish and test. | Gear, mechanism, filings and quality record.<br>Capability: CAP-03 simple automation. | Wooden mechanism, approved copper alloy, salvage or NPC workshop.<br>Core Required / Automation / CAP-03 |
| RC-MET-06<br>**Copper-Alloy Capability Branch** | Copper plus approved alloying material, knowledge and forge. | Alloy, cast/forge and test. | Bronze-like or other approved concrete alloy entries, slag and recipe provenance.<br>Capability: Optional durability/tool/gear alternative; not universal ladder step. | Pure copper, iron path, culture trade or salvage.<br>Core Conditional / 25J Capability Alternatives |
| RC-MET-07<br>**Iron Ore Extraction and Concentration** | Iron deposit/vein/salvage, capable tools/machines, permissions and fuel support. | Mine/salvage, sort, crush and concentrate. | Raw iron ore/concentrate, gangue, stone and depletion state.<br>Capability: CAP-04 durable structural material. | Trade, salvage, restored deep industry or approved capability-equivalent material.<br>Core Required / Extraction / CAP-04 |
| RC-MET-08<br>**Iron Smelting and Bloom/Ingots** | Raw iron ore, charcoal/coal, furnace/forge and flux support. | Smelt, consolidate/refine and cast/forge. | Iron ingot/bloom, slag, scale and quality record.<br>Capability: CAP-04 refined structural metal. | Re-melt salvage, trade ingots or culture specialist service.<br>Core Required / Refinement / CAP-04 |
| RC-MET-09<br>**Iron Plate, Rod and Fasteners** | Iron ingot, forge, tools/power and design pattern. | Forge/roll/draw, cut and finish. | Plate, rod/bar, fasteners, offcuts and scale.<br>Capability: Frames, gates, armour, tools, machines and repair. | Salvage, trade, copper for light-duty roles or stone/timber alternatives.<br>Core Required / Industry / Civilisation |
| RC-MET-10<br>**Tool and Weapon Blank** | Iron/copper/alloy stock, forge, fuel and pattern knowledge. | Forge/cast blank, heat treat where applicable and rough finish. | Tool/weapon blank, scale and rejected scrap.<br>Capability: Tools, equipment and NPC industry. | Salvage blank, trade equipment or alternate material tool family.<br>Core Required / Craft / Equipment |
| RC-MET-11<br>**Structural Frame and Project Ironwork** | Iron plate/rod/fasteners, workshop, blueprint/project recipe and labour. | Assemble, rivet/bolt and inspect. | Machine frame, bridge/gate/warehouse components, scrap and project progress.<br>Capability: CAP-08 settlement-scale infrastructure. | Timber/stone structure, salvaged frame or imported components.<br>Core Required / Automation / Settlement |
| RC-MET-12<br>**Mixed Scrap Recovery** | Damaged equipment/machine/ruin metal with claim and salvage permission. | Inspect, dismantle, sort, clean and re-melt or reuse. | Copper/iron fractions, reusable parts, contaminated scrap and provenance record.<br>Capability: Circular repair economy and alternate progression. | Trade, fresh extraction or leave site intact for restoration/lore.<br>Core Required / Salvage / Adventure |

# 28. Automation, Power, Logistics and Maintenance Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-AUT-01<br>**Basic Mechanical Power Interface** | Timber/metal mechanism, shaft/axle, hand crank/water/wind/fuel interface and blueprint. | Assemble and commission power source/transfer. | Usable mechanical power connection, maintenance demand and safety state.<br>Capability: CAP-03 machine operation. | Manual labour, alternate natural-power site or settlement service.<br>Core Required / Automation / Power |
| RC-AUT-02<br>**Chute and Gravity Logistics** | Construction material, chute components, supports and route plan. | Craft components, place and configure direction. | Low-tier item transport path, overflow behaviour and repair needs.<br>Capability: Early resource movement. | Manual hauling, carts or direct adjacent inventory transfer.<br>Core Required / Automation / Logistics |
| RC-AUT-03<br>**Cart, Wheel and Bounded Track** | Timber/metal components, wheels/running gear, route/rail material and workshop. | Assemble vehicle/track components and commission route. | Handcart/minecart capability, route capacity and maintenance.<br>Capability: Bulk movement between extraction, processing and storage. | Haulers, pack animals, chutes or shorter site placement.<br>Core Required / Routes / Industry |
| RC-AUT-04<br>**Machine Frame and Processing Assembly** | Frame, gears, shafts, bearings, tool head, power interface and blueprint knowledge. | Station/machine assembly recipe with inspection. | Commissionable machine block item or project component.<br>Capability: Processing, agriculture or extraction scaling. | NPC workshop service, restored machine or manual station.<br>Core Required / Automation / Industry |
| RC-AUT-05<br>**Filter, Sorter and Routing Control** | Filter media, frame/mechanism, sensor/switch when applicable and configuration knowledge. | Craft, install and configure. | Filter/sorter/control component plus maintenance profile.<br>Capability: Readable logistics and safe processing. | Manual sorting, simple route separation or NPC labour.<br>Core Required / Automation / Storage |
| RC-AUT-06<br>**Machine Maintenance and Wear Recovery** | Lubricant/sealant, fasteners, filters, replacement parts and diagnostic tool. | Inspect, service, replace bounded component and log maintenance. | Restored condition, worn parts, waste fluid/filter and reliability state.<br>Capability: Automation continuity without random punishment. | NPC specialist, slower safe shutdown or full replacement.<br>Core Required / Automation / Settlement |
| RC-AUT-07<br>**Portable Fuel and Mana Supply** | Fuel/charge source, container/battery-equivalent item and safety knowledge. | Fill/charge, seal and label. | Portable fuel/energy item, empty container and provenance/charge state.<br>Capability: Remote machines, wards and expedition support. | Direct network connection, manual refuelling or non-powered alternative.<br>Core Required / Power / Magic |
| RC-AUT-08<br>**Automation-to-Settlement Supply Contract** | Operational extraction/production chain, warehouse permission, manifest and settlement demand. | Route conserved output into authorised warehouse/project reservation. | Delivered stock, ledger entry, payment/reputation/project progress and shortage change.<br>Capability: CAP-08 core game identity proof. | Manual delivery, trade caravan, NPC production or alternate supplier.<br>Core Required / Automation / Civilisation |

# 29. Creature Resource and Ethical Harvest Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-CRE-01<br>**Meat, Fat and Food Recovery** | Eligible non-person creature remains, lawful ownership/claim and butchery tools. | Inspect, butcher, separate edible and unsafe fractions. | Meat, fat/oil, waste/compost and hunting record.<br>Capability: Food, cooking, medicine and trade. | Plant food, livestock, purchased provisions or non-lethal play.<br>Core Required / Creature / Food |
| RC-CRE-02<br>**Hide, Fur and Fibre Recovery** | Eligible non-person creature or renewable husbandry product with welfare rules. | Skin/shear/groom, clean and preserve. | Hide/fur/wool/fibre, scraps and condition/provenance.<br>Capability: Clothing, insulation, leather and culture goods. | Plant textile, chitin, trade or synthetic/magic alternative.<br>Core Required / Creature / Textile |
| RC-CRE-03<br>**Bone, Horn, Chitin and Shell Processing** | Eligible remains, lawful claim and cutting/cleaning tools. | Clean, cut, cure and grade. | Bone/horn/chitin components, meal/powder and waste.<br>Capability: Tools, armour, filters, alchemy and crafts. | Wood, metal, stone, culture material or trade.<br>Core Required / Creature / Craft |
| RC-CRE-04<br>**Venom, Toxin and Antidote Research** | Live non-person source or recovered gland/sample, containment and knowledge. | Safely extract, stabilise, identify and test. | Venom/toxin reagent, antidote knowledge/sample and hazardous waste.<br>Capability: Alchemy, medicine, traps and Codex research. | Plant toxin, purchased reagent or non-lethal observation.<br>Core Conditional / Creature / Health / Magic |
| RC-CRE-05<br>**Silk and Web Fibre** | Eligible spider/arthropod source, nest salvage or renewable collection method. | Collect, clean, spin and weave. | Silk thread, strong belt/filter material and contaminated waste.<br>Capability: Automation belts, textiles and specialist gear. | Plant fibre, leather belt, wool or trade.<br>Core Required / Cave Ecology / Automation |
| RC-CRE-06<br>**Essence and Magical Sample** | Magical creature residue/sample, containment, consent/personhood check and stabiliser. | Collect after valid encounter, stabilise and classify. | Essence, research sample, mana reagent and event provenance.<br>Capability: Practical magic, research and wards. | Leyline source, ruin/research, NPC teaching or trade.<br>Core Required / Magic Ecology |
| RC-CRE-07<br>**Construct Component Salvage** | Defeated/decommissioned construct, ownership/creator status and salvage tools. | Disarm, inspect and dismantle without duplicating stored energy. | Core/component, plates, gears, residue and origin record.<br>Capability: Automation repair, research and adventure reward. | Craft fresh parts, trade or restore construct intact.<br>Core Required / Construct Ecology / Adventure |

# 30. Mana, Rune, Ward and Realm-Access Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-MAG-01<br>**Mana Source Discovery and Harvest** | Leyline/mineral/creature/ruin/culture provider, knowledge clue and suitable tool/container. | Discover, inspect and gather within purity/risk limits. | Raw mana crystal/charge/essence, knowledge and local depletion/risk state.<br>Capability: CAP-05 practical mana access through multiple providers. | Alternate provider family, trade, teacher, restored device or world repair.<br>Core Required / Magic / CAP-05 |
| RC-MAG-02<br>**Mana Crystal to Shard and Dust** | Raw mana crystal/material, crusher/grinder and containment. | Split, grade and mill with loss control. | Mana shard, dust, rejects and purity/contamination state.<br>Capability: Rune, ward, charge and catalyst inputs. | Direct low-tier crystal use, essence reagent or traded refined mana.<br>Core Required / Magic / Processing |
| RC-MAG-03<br>**Rune Substrate Preparation** | Stone/metal/wood/glass substrate, engraving tool and stabilising material. | Shape, smooth, inscribe-ready prepare. | Blank rune plate/token, chips and compatibility profile.<br>Capability: Rune crafting without fixed named material. | Alternate substrate class or purchased blanks.<br>Core Required / Magic / Craft |
| RC-MAG-04<br>**Basic Rune Inscription** | Blank substrate, mana dust/shard, rune knowledge and rune chisel/table. | Inscribe, charge, test and bind function. | Functional rune, residue, failure state and maker provenance.<br>Capability: Control, wards, machines and knowledge progression. | NPC inscription service, recovered rune or alternate control system.<br>Core Required / Magic / Automation |
| RC-MAG-05<br>**Mana Charge and Storage** | Mana source, storage component/container, conductor and safety rule. | Charge, seal, calibrate and record capacity. | Portable mana charge/storage item, loss/heat and purity state.<br>Capability: Machines, wards, field tools and realm route. | Direct source/network, disposable rune or mechanical alternative.<br>Core Required / Magic / Power |
| RC-MAG-06<br>**Ward Component and Maintenance** | Rune, conductor, mana charge, structural substrate and ward knowledge. | Assemble/place/commission; later inspect and replenish. | Ward component/infrastructure, protected area state and spent parts.<br>Capability: Settlement safety, hazard control and realm access. | Physical defences, NPC guards, avoidance or alternate magic school.<br>Core Required / Magic / Settlement |
| RC-MAG-07<br>**Cleansing Reagent and Restoration** | Cleansing herb/fungus, mana reagent, filter/charcoal and knowledge. | Purify, compound and apply through item/project/ritual recipe. | Cleansing reagent, reduced corruption state and hazardous residue.<br>Capability: Environmental, item and settlement recovery. | Specialist NPC, natural recovery, isolation or alternate ritual.<br>Core Required / Magic / Aftermath |
| RC-MAG-08<br>**Mana-Mechanical Coupler** | Copper conductor/gear, mana coil, rune/control component and frame. | Assemble, insulate, calibrate and test. | Mana coupler/coil, machine extension and maintenance profile.<br>Capability: Hybrid practical magic automation. | Separate mechanical drive and manual mana feed.<br>Core Required / Magic / Automation |
| RC-MAG-09<br>**Realm Route Stabilisation Supply** | Route knowledge, mana storage, ward/anchor components, realm-specific stabiliser and return plan. | Assemble and reserve route package; activate through route/ritual owner. | Stable route state, consumed/retained components, rescue fallback and route record.<br>Capability: CAP-09 realm discovery and safe return. | Alternate authorised gate, culture guide, delayed travel or controlled failure.<br>Core Conditional / Realm Access / 14 |

# 31. Settlement, Culture, Trade and Public-Works Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-SET-01<br>**Construction Supply Bundle** | Exact block/item materials, fasteners, tools/consumables and project manifest. | Bundle, reserve and deliver through staged project recipe. | Project stock, visible construction progress, leftovers and ledger entries.<br>Capability: Settlement housing/infrastructure growth. | Direct loose delivery, local NPC production or alternate approved blueprint/material kit.<br>Core Required / Settlement Projects |
| RC-SET-02<br>**Guard and Defence Supply** | Weapons/armour/shields, repair stock, food/medicine and ownership contract. | Inspect, assign and reserve to armoury/guard role. | Equipped guards, defence readiness, maintenance demand and ledger state.<br>Capability: Safety need and raid/threat preparation. | Wards, fortification, hired help, diplomacy or evacuation.<br>Core Required / Settlement / Defence |
| RC-SET-03<br>**Health and Infirmary Supply** | Medicine, bandages, clean-water containers, fuel and medical tools. | Bundle and reserve to health service. | Treatment capacity, consumed stock, waste and health-state change.<br>Capability: Health need and event recovery. | Healer caravan, culture specialist, magic healing or reduced disease settings.<br>Core Required / Settlement / Health |
| RC-SET-04<br>**Food Reserve and Granary Stock** | Staples, preserved food, containers and warehouse permission. | Grade, store, rotate and reserve. | Provision-days capacity, spoilage loss, seed reserve and trade surplus.<br>Capability: Provisions need and migration resilience. | Fresh supply, imports, emergency relief or hunting/forage.<br>Core Required / Settlement / Provisions |
| RC-SET-05<br>**Culture Signature Good Production** | Approved local materials, culture technique/knowledge, workshop and maker. | Craft according to culture-owned recipe facet. | Signature good, scraps/by-products, maker/culture provenance and demand profile.<br>Capability: Culture identity, morale, diplomacy and trade. | Imported good, substitute morale service or another culture good.<br>Core Required / Six Core Cultures |
| RC-SET-06<br>**Trade Cargo and Shipment Manifest** | Physical goods, container/cargo bundle, route/contract, ownership and risk profile. | Pack, seal, manifest, transport and receive. | Shipment instance, delivered goods, losses/damage and transaction record.<br>Capability: CAP-06 regional trade and real logistics. | Local production, alternate route, caravan/portal service or delayed demand.<br>Core Required / Trade / Routes |
| RC-SET-07<br>**Tax, Tribute, Donation and Contract Transfer** | Eligible goods/currency, authority record, obligation or voluntary action. | Authoritative transaction transfers ownership and updates ledger/reputation. | Public/faction stock, receipt, reputation/fear/obligation change.<br>Capability: Civilisation economy and player choice. | Service/labour contribution, negotiated reduction or alternate goods.<br>Core Required / Economy / Factions |
| RC-SET-08<br>**Repair, Restoration and Public Works** | Damaged blocks/structure state, compatible materials, labour/tools and approved project. | Reserve, repair/rebuild and validate state transition. | Restored structure/infrastructure, rubble/scrap, history event and reputation.<br>Capability: Persistent aftermath and civilisation recovery. | Stabilise without full restoration, alternate materials or abandon/repurpose.<br>Core Required / Structures / Events |

# 32. Adventure, Loot, Relic and Aftermath Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-ADV-01<br>**Site Salvage and Evidence Recovery** | Generated ruin/dungeon/site, claim context, salvage tool and discovery state. | Inspect, recover permitted materials/evidence and update site state. | Salvage components, records, contextual loot and altered site availability.<br>Capability: CAP-07 exploration reward with aftermath. | Restoration path, leave intact for lore, trade clue or alternate site.<br>Core Required / Adventure Sites |
| RC-ADV-02<br>**Contextual Container Resolution** | Container/site/history grammar, eligible item families, ownership and uniqueness reservations. | Deterministically select valid reward slots at first authoritative resolution. | Item stacks/instances, provenance, empty/failed slots with fallback and container state.<br>Capability: Readable non-generic loot. | Currency/goods/knowledge/material fallback or explicit empty narrative outcome.<br>Core Required / Loot / Structures |
| RC-ADV-03<br>**Boss Proof and Reward Package** | Defeated/resolved/negotiated boss outcome, contribution record and reward grammar. | Resolve outcome-specific proof, materials, knowledge, reputation and world-state rewards. | Boss proof, components, map/recipe knowledge, settlement/faction changes and aftermath.<br>Capability: Regional threat progression without detached drop table. | Non-lethal outcome, shared public reward, alternate proof or guaranteed capability fallback.<br>Core Required / Bosses / Events |
| RC-ADV-04<br>**Relic Fragment Restoration** | Relic fragment(s), provenance/evidence, restoration material, specialist knowledge and custody. | Identify, clean, repair/reassemble and interpret. | Restored relic state, knowledge, display/custody record and unused fragments.<br>Capability: Lore, culture, museum and optional capability. | Preserve fragment, replica/display, alternate relic or knowledge reward.<br>Core Conditional / Relics / Culture |
| RC-ADV-05<br>**Map, Key and Access Knowledge** | Site clue, map fragment, inscription, witness/NPC knowledge or research. | Study, combine, annotate and validate against world state. | Map/route/permission knowledge, quest lead and uncertainty state.<br>Capability: Adventure and realm access without fixed coordinates. | Environmental clue, alternate informant, trade or search capability.<br>Core Required / Knowledge / Exploration |
| RC-ADV-06<br>**Dungeon Maintenance and Consumables** | Food, light/fuel, repair, medicine, climbing/utility tools and route plan. | Assemble expedition loadout or supply cache. | Expedition supplies, empty containers, waste and consumed-condition records.<br>Capability: Safe traversal and return. | Settlement support, magic utility, shorter route or retreat.<br>Core Required / Adventure / Survival |
| RC-ADV-07<br>**Event Aftermath Recovery** | World event state, damaged/abandoned stocks, ownership rules and recovery labour. | Search, triage, salvage, return/restitute or claim according to law. | Recovered goods, relief materials, disputed claims, evidence and dynamic-state change.<br>Capability: Persistent world consequence and moral choice. | Leave untouched, donate, report, restore or alternate event resolution.<br>Core Required / Events / Law |
| RC-ADV-08<br>**Unique Object Loss and Recovery** | Reserved unique/relic instance, last custody/location state and recovery policy. | Track, retrieve, replace with bounded proxy or migrate custody. | Recovered unique, proxy proof, updated history and no duplicate reservation.<br>Capability: Save-safe unique rewards. | Alternate progression proof or explicit permanent narrative consequence when approved.<br>Core Required / Relics / Save Integrity |

# 33. Verdant Covenant Complete Realm Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-VRD-01<br>**Living Heartwood Harvest and Consent** | Eligible Verdant living source, realm law/relationship, specialist tool and consent/aftermath rule. | Prune/receive/salvage rather than ordinary clear-cut extraction. | Living Heartwood, growth memory, damaged/recovering source state and provenance.<br>Capability: Living construction and Overworld restoration. | Trade/gift, fallen source, reclaimed material or non-living construction substitute.<br>Core Conditional / Verdant Covenant |
| RC-VRD-02<br>**Season Sap Collection** | Seasonal living source, vessel/container and timing knowledge. | Tap/collect within carrying capacity and close source safely. | Season Sap, container state and source recovery timer.<br>Capability: Seasonal catalysts, medicine and realm infrastructure. | Trade, alternate seasonal reagent or delayed collection.<br>Core Conditional / Verdant Covenant |
| RC-VRD-03<br>**Thornsilver Fibre Processing** | Approved plant/creature source, protective tools and cleansing. | Harvest, clean, spin and temper. | Thornsilver fibre/thread, hazardous thorns and treatment waste.<br>Capability: Flexible armour, conduits and living mechanisms. | Overworld silk/metal hybrid, trade or culture substitute.<br>Core Conditional / Verdant Covenant |
| RC-VRD-04<br>**Pollen Amber Stabilisation** | Pollen/amber source, filter, container and stabilising reagent. | Collect, clarify, harden and inscribe/polish. | Pollen Amber, dust, optical/inscription component and allergy/hazard state.<br>Capability: Knowledge, lenses, wards and culture goods. | Glass/crystal, imported amber or alternate rune substrate.<br>Core Conditional / Verdant Covenant |
| RC-VRD-05<br>**Memory Seed Cultivation** | Memory Seed, suitable living substrate, relationship/knowledge condition and time. | Plant, tend, awaken and record memory outcome. | New growth, remembered clue/relationship state and seed lineage.<br>Capability: Realm story, restoration and living blueprint support. | Preserve as knowledge item, trade/gift or alternate quest evidence.<br>Core Conditional / Verdant Covenant |
| RC-VRD-06<br>**Bloomstone Extraction and Cleansing** | Eligible Bloomstone source, tool, stabiliser and realm-state constraints. | Extract, cleanse and grade. | Bloomstone, dust, stabilisation component and source aftermath.<br>Capability: Route, ward, construction and cleansing support. | Overworld mana/stone composite, trade or alternate stabiliser.<br>Core Conditional / Verdant Covenant |
| RC-VRD-07<br>**Living Construction Commission** | Living Heartwood, fibre, sap/seed catalyst, blueprint, realm law and builder/grower labour. | Commission and grow through staged project recipe. | Living structure/block package, care demand and growth-state record.<br>Capability: Complete realm settlement/infrastructure package. | Conventional construction, repair existing growth or culture-provided shelter.<br>Core Conditional / Verdant Covenant |
| RC-VRD-08<br>**Verdant Resolution Reward and Overworld Use** | Realm authority outcome, relationship state, approved materials/knowledge and route record. | Resolve outcome grammar; allocate rewards and unlock Overworld recipes/projects. | Material package, knowledge, relationship proof, world-state aftermath and no duplicate unique.<br>Capability: CAP-10 realm resolution with lasting Overworld utility. | Alternate authority outcome, knowledge-only reward or equivalent capability path.<br>Core Conditional / Verdant Covenant / Bosses |

# 34. Ancestral Veil Threshold Teaser Chains

| Chain | Source Inputs | Transformation / Station | Outputs and Capability | Fallback / Status |
| --- | --- | --- | --- | --- |
| RC-VEI-01<br>**Ancestral Threshold Stabilisation** | Approved teaser route, ward/anchor, memory-safe return token and no full realm exploitation. | Commission safe threshold and record return rescue state. | Teaser access, route record, bounded evidence and return capability.<br>Capability: Ancestral Veil foreshadowing only. | Close route, recover player through rescue fallback or omit teaser.<br>Teaser Only / Ancestral Veil |
| RC-VEI-02<br>**Threshold Evidence and Memory Record** | Safe teaser observation, non-extractive evidence method and Codex/map record. | Observe, record and return without opening production resource loop. | Knowledge/evidence item, story hook and no farmable realm material.<br>Capability: Teaser discovery without incomplete economy. | Environmental clue or NPC testimony in Overworld.<br>Teaser Only / Ancestral Veil |

# 35. Capability Reachability and Fallback Matrix

| Capability Band | Primary Chains | Required Proof | Repair / Fallback |
| --- | --- | --- | --- |
| CAP-00 Safe Spawn | RC-SUR-01/02/05/07 | Food/water-access equivalent, fuel/light, shelter and safe build area. | Spawn relocation, alternate provider or controlled generation failure. |
| CAP-01 Primitive Tools | RC-SUR-03/04/06/08; RC-MIN-01 | Gather, mine, store and repair common material capability. | Salvage, settlement loan/service or material substitution. |
| CAP-02 Provisions/Contact | RC-FOD-01-12; RC-SET-04/06 | Renewable provisions, health input, route/trade or settlement contact. | Forage, relief, imports, visiting specialist or alternate crop. |
| CAP-03 Copper Mechanisms | RC-MET-01-06; RC-AUT-01/02 | Conductive/mechanical material, gears/plates and simple power/logistics. | Salvage, trade, restored machine or approved alloy/technology. |
| CAP-04 Iron Support | RC-MET-07-12; RC-MIN-09 | Durable tools, structural frames, forge/refinement and project support. | Trade, salvage, equivalent structural capability or alternate design. |
| CAP-05 Practical Mana | RC-MAG-01-08; RC-CRE-06 | At least two discovery/provider families and practical infrastructure use. | Alternate provider, teacher, ruin/device, trade or world repair. |
| CAP-06 Regional Civilisation | RC-SET-01-08; RC-FOD-12 | Two cultures/settlements, real goods, routes, permissions and exchange. | Caravan/wayhouse, visiting specialist or alternate regional connection. |
| CAP-07 Regional Adventure | RC-ADV-01-08 | Reachable site, supplies, counterplay, contextual reward and aftermath. | Alternate eligible site/threat and safe-route repair. |
| CAP-08 Automation-to-Civilisation | RC-AUT-04-08; RC-SET-01/04 | Conserved production supplies settlement need/project/trade outcome. | Manual/NPC delivery, alternate producer or simpler chain. |
| CAP-09 Realm Access | RC-MAG-09; RC-VEI-01 | Knowledge/material/relationship route, arrival, return and rescue. | Alternate gate/guide or controlled omission/failure. |
| CAP-10 Verdant Resolution | RC-VRD-01-08 | Complete realm resource, society, site, authority and Overworld-use package. | Alternate authority outcome or equivalent knowledge/capability reward. |

# 36. Core Package Coverage Matrix

| Package Cluster | Required Chain Coverage | Boundary |
| --- | --- | --- |
| Seed Start | Survival chains, common organic/mineral providers, water-access policy and spawn repair. | No fixed POC region or guaranteed named resource. |
| Temperate/Boreal/Wetland/Highland | Distinct timber, food, fuel, stone, medicine and route providers. | Profiles may omit a named resource only when a capability fallback exists. |
| Underground/Deepstone | Ore, fuel, fungal food, specialist stone, creature resource and adventure salvage. | No mandatory fixed cave or mine. |
| Six Core Cultures | Signature-goods facets, workshops, preferences, law, trade and alternative learning/provider paths. | Culture goods do not duplicate base item/economy definitions. |
| Settlement Network | Provisions, health, work, safety, infrastructure and morale supply chains. | Warehouses use real stock, reservations and ledgers. |
| Ecology | Food, fibre, samples, threats, welfare/personhood and depletion/recovery. | No generic drop table detached from ecology. |
| Adventure Sites/Bosses | Supplies, contextual loot, proofs, relics, restoration and aftermath. | No detached rarity chest or compulsory unique drop. |
| Practical Magic | Multiple mana discovery paths, rune substrate, wards, cleansing, automation and route support. | No guaranteed mana pocket or fixed teacher. |
| Verdant Covenant | Six realm resource roles plus living construction, route and outcome rewards. | Conditional until realm contracts and runtime tests pass. |
| Ancestral Veil | Safe access and evidence only. | No incomplete production economy. |
| Set 26 | Admitted maritime resource/recipe/loot packages via optional expansion contracts. | Base chains do not hard-reference maritime IDs. |

# 37. Document Set 26 Compatibility and Admission Boundary

> **Expansion Boundary**
>
> Set 26 owns all detailed maritime production design. Core data may expose generic resource, fluid-container, environmental exposure, cargo, project, salvage, provenance and recipe extension interfaces, but it cannot hard-reference unadmitted maritime definitions.

| Set 26 Area | 25J Base Compatibility | Set 26 Authority |
| --- | --- | --- |
| Water/liquid overhaul | Generic fluid identity, volume/container, contamination and recipe input/output interfaces. | Fluid states, water simulation, saltwater/brine behaviour and hydrodynamic effects. |
| Marine ecology/fishing | Creature/resource provenance, welfare/personhood, spoilage and loot grammar interfaces. | Species, fishing methods, catch ecology, marine products and processing. |
| Vessels and shipyards | Generic blueprint/project/component/cargo/repair chain contracts. | Vessel structural roles, commissioning, shipyard recipes, refit and salvage. |
| Sails/rigging/sealants | Existing textile, cordage and pitch families may be eligible inputs only after Set 26 contracts approve them. | Exact sailcloth, rope, caulking, hull and propulsion requirements. |
| Ports/trade/fleets | Generic shipment, warehouse, route, contract and ownership records. | Port services, maritime routes, fleet cargo, piracy/navy economies. |
| Naval combat/rewards | Generic damage, salvage, claim, boss/event and loot grammar interfaces. | Flooding, fire, sinking, boarding, naval rewards and wreck law. |
| Optional pack absence | 25D recovery, opaque facet preservation and no base hard dependency. | Set 26 migrations, substitutes and reactivation rules. |
| Validation | Cross-pack schema/reference/conservation/save/authority tests. | Maritime simulation, moving-interior, vessel and ocean-specific QA. |

# 38. Validation, Seed QA and Acceptance Evidence

| Validation Area | Required Evidence |
| --- | --- |
| Schema/reference | Every chain resolves admitted block/item/resource/recipe/loot/capability relationships or declared future handoff. |
| Conservation | Inputs, outputs, by-products, waste, buffers and reservations reconcile across hand/station/machine/NPC/project execution. |
| Reachability | Seed corpus proves CAP-00 to CAP-10 through valid local, trade, salvage, research, culture and realm providers. |
| Distribution | No required named resource is universally guaranteed when capability alternatives are approved. |
| Ownership | Theft, donation, tax, shipment, salvage, restitution and unique custody produce distinct authoritative records. |
| Loot | Every grammar has at least one valid resolution and duplicate/unique/fallback handling. |
| LOD | Near/far production, markets, spoilage and depletion conserve accepted state. |
| Save/migration | Renamed/removed recipes, resources, packs, unique objects and interrupted jobs recover safely. |
| POC leakage | No Forest Hamlet, fixed watchtower, scripted goblin raid, guaranteed mana pocket or POC chest identifiers in production pools. |
| Set 26 | Absent/present/removal/reinstall tests pass without base progression hard dependency. |
| Accessibility/player trust | Non-colour indicators for hazards, legality, freshness, purity, uncertainty and ownership; recipe/transaction explanations available. |

# 39. Document 06 v1.0 Replacement Gate

Document 06 v1.0 may replace the old Resource Progression source only when it converts this matrix into executable resource definitions and capability pathways without restoring a universal linear ladder.

- Define qualified `res` identities and relationships for every admitted physical resource family.
- Map each resource to world source classes, block/item forms, renewability/depletion, grade/purity, hazards, claims and consumers.
- Implement CAP-00 to CAP-10 provider queries and at least the approved fallbacks.
- Treat copper alloy as optional/culture-owned unless later approved otherwise; keep mana parallel to material capability.
- Define trade, salvage, research, culture and realm pathways as real alternatives with physical/knowledge requirements.
- Declare old-material long-term uses, repair/recycling and settlement demand.
- Define realm material stabilisation, native demand and lasting Overworld use.
- Provide seed reachability reports and redesign triggers for unsupported profiles.
- Archive POC resource scope and migrate legacy IDs without shipping POC status fields.

# 40. Document 05 v1.0 Replacement Gate

Document 05 v1.0 may replace the old Crafting and Recipe Registry only when every admitted chain has exact executable recipes or an explicitly owned non-recipe transformation path.

- Define qualified recipe IDs, categories, parent schemas and source packs.
- Reference exact item/block/resource definitions or typed substitution groups; no display-name inputs.
- Declare outputs, by-products, waste, quantity units, state transfer and failure behaviour.
- Declare tool/station, time, batch, power/fuel/mana, environment, skill/knowledge, permission and automation fields.
- Support hand, station, machine, cooking, repair, salvage, project, rune, ritual, culture, event and realm classes where admitted.
- Use one authoritative transaction/reservation model for player, NPC, automation and project crafting.
- Define unlock/discovery/research/culture/faction/boss/realm paths and duplicate-knowledge fallback.
- Define UI warnings and explanations for hazards, ownership, substitutions, output state and blocked production.
- Provide conservation, interruption, LOD, save, migration, multiplayer and optional-pack tests.
- Remove fixed watchtower and POC-specific production chains from shipping data.

# 41. Production Sequence and Integration Gates

1. Approve Document 25J chain, fallback, provenance and loot boundaries.
2. Create 25K asset/presentation manifests using the approved physical families and state cues.
3. Create 25L bounded backlog and integrity audit while keeping final closure dependent on sufficiently locked Set 26 outputs.
4. Replace Document 06 v1.0 first at resource/progression level.
5. Replace Document 05 v1.0 after resource, block, item and station identities are stable.
6. Generate validated Godot-facing registries through the 25D toolchain.
7. Run 25E seed, reachability, conservation, save, authority and performance gates.
8. Only then admit bounded Summer Engine implementation tasks for concrete chains.

# 42. Decisions Locked by 25J

- Core progression is a capability graph, not one universal material ladder.
- Every admitted chain has a physical source, transformation, output use, fallback, provenance and validation path.
- Copper alloy is a conditional capability branch; mana is parallel infrastructure.
- Loot uses contextual grammars and existing definitions rather than universal rarity chests.
- Scarcity, quality, condition, provenance, significance and market value remain separate.
- All production paths conserve quantities and required state across player, NPC, automation, projects and LOD.
- Salvage, repair, by-products and waste are explicit paths rather than hidden deletion or duplication.
- Important ownership, claims, custody and restitution remain authoritative.
- Verdant Covenant receives a complete conditional resource/recipe package; Ancestral Veil remains non-extractive teaser scope.
- Set 26 extends the matrix through admitted optional packs and owns maritime chain design.

# 43. Handoff to 25K-25L and Main Documents

| Target | Required Handoff |
| --- | --- |
| 25K | Models/icons/material states, source/depletion cues, station/machine animations, loot/relic presentation, warnings, audio/VFX events and Forge manifests. |
| 25L | Implementation tasks, source files, validators, migration steps, rollback, integration debt and release admission. |
| Document 03 v1.0 | Placed sources, deposits, stations, project blocks, drops and state transitions. |
| Document 04 v1.0 | Concrete raw/refined/component/food/loot/knowledge item definitions and state profiles. |
| Document 05 v1.0 | Exact recipe registry and transformation execution contracts. |
| Document 06 v1.0 | Resource progression definitions, provider graph, scarcity and reachability. |
| Documents 07-09 | Settlement consumption/projects, automation processing and magic/realm transformations. |
| Documents 10/12/15/16 | Creature harvesting, site loot, event rewards, boss proofs and equipment outcomes. |
| Document 17 | Recipe book, Codex, provenance, market, ownership and warning presentation. |
| Document 18 | Transactions, jobs, saves, LOD, authority, performance, validation commands and generated resources. |
| Set 26 | Maritime extension schemas, chain packages and downstream amendment map. |

# 44. Risks, Redesign Triggers and Open Decisions

## 44.1 Primary risks

- Chain count may become recipe bloat if concrete variants are created without gameplay distinction.
- Excessive provenance detail may inflate saves and UI complexity.
- Substitution groups may become loopholes if capability constraints are too broad.
- Trade/salvage fallbacks may trivialise exploration if availability and cost are not bounded.
- Automation LOD may drift from nearby yields or lose by-products/reservations.
- Contextual loot may feel unrewarding if non-material outcomes are not clearly communicated.
- Realm materials may become one-way progression gates instead of lasting cross-world systems.
- Set 26 may require new state dimensions; extensions must not overwrite base ownership.

## 44.2 Redesign triggers

- Any supported seed cannot reach a required capability despite repair.
- A chain can duplicate/delete quantity or required state across any execution mode.
- A mandatory capability depends on one named culture, site, boss, teacher or optional pack.
- A common recipe requires provenance detail that cannot stack or perform acceptably.
- A unique relic/reward can duplicate, vanish or permanently block progression without approved consequence.
- A market or distant simulation creates stock without a producer/import abstraction.
- Set 26 needs incompatible base fields rather than extension facets and declared dependencies.

## 44.3 Open decisions for later authority

- Exact numeric yields, recipe quantities, work times, power rates, waste ratios and price curves.
- Whether the copper-alloy branch includes a named bronze family in Core or a later/culture package.
- Default spoilage, preservation and contamination settings.
- How much provenance common crafted equipment retains before aggregation.
- Which relics are authored unique, generated unique or bounded-copy objects.
- Currency, barter, credit, insurance, taxation and public-finance depth.
- Default extraction consequences and which remain difficulty/package specific.
- Exact contribution and allocation rules for multiplayer bosses, public projects and unique rewards.
- Which chains require dedicated 3D assets versus shared family presentations.

# Appendix A. Master Chain Register

## Technical Recovery and Migration Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-REC-01 | Quantity Reconciliation and Quarantine | Core Required | 25D-25E / Runtime |
| RC-REC-02 | Definition Supersession Migration | Core Required | 25B-25D |
| RC-REC-03 | Optional-Pack Removal Preservation | Core Required | 25D / Set 26 Admission |
| RC-REC-04 | Interrupted Production Rollback | Core Required | Document 18 / 25E |

## Immediate Survival and Primitive Capability Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-SUR-01 | Local Forage to Immediate Food | Core Required | Seed Start / Ecology |
| RC-SUR-02 | Firewood and Emergency Heat | Core Required | Survival / Frontier |
| RC-SUR-03 | Primitive Cutting Tool | Core Required | Primitive Tools |
| RC-SUR-04 | Primitive Mining Tool | Core Required | Primitive Tools |
| RC-SUR-05 | Immediate Shelter Materials | Core Required | Seed Start / Building |
| RC-SUR-06 | Simple Storage and Carrying | Core Required | Inventory / Storage |
| RC-SUR-07 | Clean-Water Access and Container | Core Required | Survival / Health |
| RC-SUR-08 | Field Repair and Salvage | Core Required | Repair / Player Trust |

## Timber, Fibre, Leather and Record-Media Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-ORG-01 | Hardwood Timber Processing | Core Required | Temperate Forestry |
| RC-ORG-02 | Softwood Framing and Polework | Core Required | Boreal / Upland Forestry |
| RC-ORG-03 | Charcoal Production | Core Required | Forestry / Industry |
| RC-ORG-04 | Resin, Pitch and Sealant | Core Required | Forestry / Routes |
| RC-ORG-05 | Plant-Fibre Cordage | Core Required | All Regions |
| RC-ORG-06 | Reed and Cane Goods | Core Required | Wetland / Mirelight |
| RC-ORG-07 | Textile Fibre to Cloth | Core Required | Agriculture / Textile |
| RC-ORG-08 | Wool to Insulating Textile | Core Required | Domestic Ecology |
| RC-ORG-09 | Hide to Leather and Parchment | Core Required | Creature Resources / Craft |
| RC-ORG-10 | Paper, Ink and Record Media | Core Required | Knowledge / Civilisation |

## Stone, Ceramic, Glass and Mineral Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-MIN-01 | Common Stone to Rubble and Cut Stone | Core Required | Geology / Building |
| RC-MIN-02 | Limestone to Lime and Mortar | Core Required | Karst / Construction |
| RC-MIN-03 | Clay to Brick and Ceramic | Core Required | Clayworks / Settlement |
| RC-MIN-04 | Sand to Glass | Core Required | Industry / Magic |
| RC-MIN-05 | Aggregate to Road and Drainage Fill | Core Required | Routes / Infrastructure |
| RC-MIN-06 | Salt and Mineral Preservative | Core Required | Food / Health / Trade |
| RC-MIN-07 | Peat and Wetland Fuel | Core Required | Wetland / Moorland |
| RC-MIN-08 | Prospecting Sample and Grade Analysis | Core Required | Exploration / Extraction |
| RC-MIN-09 | Deepstone and Specialist Masonry | Core Conditional | Underground / Adventure |

## Agriculture, Food, Water and Health Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-FOD-01 | Staple Grain Agriculture | Core Required | Agriculture / Provisions |
| RC-FOD-02 | Root-Crop Agriculture | Core Required | Frontier Agriculture |
| RC-FOD-03 | Orchard and Berry Production | Core Required | Temperate Agriculture |
| RC-FOD-04 | Mushroom and Fungal Food | Core Required | Forest / Fungal Cavern |
| RC-FOD-05 | Domestic Animal Products | Core Required | Domestic Ecology |
| RC-FOD-06 | Wild Game and Ethical Harvest | Core Required | Wildlife / Combat |
| RC-FOD-07 | Basic Meal Preparation | Core Required | Cooking / Survival |
| RC-FOD-08 | Preserved Rations | Core Required | Provisions / Trade |
| RC-FOD-09 | Animal Feed and Fodder | Core Required | Agriculture / Ecology |
| RC-FOD-10 | Herbal Remedy and Bandage | Core Required | Health / Settlement |
| RC-FOD-11 | Antidote and Cleansing Medicine | Core Required | Health / Magic |
| RC-FOD-12 | Relief and Emergency Supply Pack | Core Required | Settlement / Events |

## Copper, Iron, Salvage and Industrial Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-MET-01 | Copper Ore Extraction and Concentration | Core Required | Extraction / CAP-03 |
| RC-MET-02 | Copper Smelting | Core Required | Refinement / CAP-03 |
| RC-MET-03 | Copper Plate and Sheet | Core Required | Automation / Building |
| RC-MET-04 | Copper Wire and Connectors | Core Required | Automation / Magic |
| RC-MET-05 | Copper Gears and Mechanisms | Core Required | Automation / CAP-03 |
| RC-MET-06 | Copper-Alloy Capability Branch | Core Conditional | 25J Capability Alternatives |
| RC-MET-07 | Iron Ore Extraction and Concentration | Core Required | Extraction / CAP-04 |
| RC-MET-08 | Iron Smelting and Bloom/Ingots | Core Required | Refinement / CAP-04 |
| RC-MET-09 | Iron Plate, Rod and Fasteners | Core Required | Industry / Civilisation |
| RC-MET-10 | Tool and Weapon Blank | Core Required | Craft / Equipment |
| RC-MET-11 | Structural Frame and Project Ironwork | Core Required | Automation / Settlement |
| RC-MET-12 | Mixed Scrap Recovery | Core Required | Salvage / Adventure |

## Automation, Power, Logistics and Maintenance Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-AUT-01 | Basic Mechanical Power Interface | Core Required | Automation / Power |
| RC-AUT-02 | Chute and Gravity Logistics | Core Required | Automation / Logistics |
| RC-AUT-03 | Cart, Wheel and Bounded Track | Core Required | Routes / Industry |
| RC-AUT-04 | Machine Frame and Processing Assembly | Core Required | Automation / Industry |
| RC-AUT-05 | Filter, Sorter and Routing Control | Core Required | Automation / Storage |
| RC-AUT-06 | Machine Maintenance and Wear Recovery | Core Required | Automation / Settlement |
| RC-AUT-07 | Portable Fuel and Mana Supply | Core Required | Power / Magic |
| RC-AUT-08 | Automation-to-Settlement Supply Contract | Core Required | Automation / Civilisation |

## Creature Resource and Ethical Harvest Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-CRE-01 | Meat, Fat and Food Recovery | Core Required | Creature / Food |
| RC-CRE-02 | Hide, Fur and Fibre Recovery | Core Required | Creature / Textile |
| RC-CRE-03 | Bone, Horn, Chitin and Shell Processing | Core Required | Creature / Craft |
| RC-CRE-04 | Venom, Toxin and Antidote Research | Core Conditional | Creature / Health / Magic |
| RC-CRE-05 | Silk and Web Fibre | Core Required | Cave Ecology / Automation |
| RC-CRE-06 | Essence and Magical Sample | Core Required | Magic Ecology |
| RC-CRE-07 | Construct Component Salvage | Core Required | Construct Ecology / Adventure |

## Mana, Rune, Ward and Realm-Access Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-MAG-01 | Mana Source Discovery and Harvest | Core Required | Magic / CAP-05 |
| RC-MAG-02 | Mana Crystal to Shard and Dust | Core Required | Magic / Processing |
| RC-MAG-03 | Rune Substrate Preparation | Core Required | Magic / Craft |
| RC-MAG-04 | Basic Rune Inscription | Core Required | Magic / Automation |
| RC-MAG-05 | Mana Charge and Storage | Core Required | Magic / Power |
| RC-MAG-06 | Ward Component and Maintenance | Core Required | Magic / Settlement |
| RC-MAG-07 | Cleansing Reagent and Restoration | Core Required | Magic / Aftermath |
| RC-MAG-08 | Mana-Mechanical Coupler | Core Required | Magic / Automation |
| RC-MAG-09 | Realm Route Stabilisation Supply | Core Conditional | Realm Access / 14 |

## Settlement, Culture, Trade and Public-Works Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-SET-01 | Construction Supply Bundle | Core Required | Settlement Projects |
| RC-SET-02 | Guard and Defence Supply | Core Required | Settlement / Defence |
| RC-SET-03 | Health and Infirmary Supply | Core Required | Settlement / Health |
| RC-SET-04 | Food Reserve and Granary Stock | Core Required | Settlement / Provisions |
| RC-SET-05 | Culture Signature Good Production | Core Required | Six Core Cultures |
| RC-SET-06 | Trade Cargo and Shipment Manifest | Core Required | Trade / Routes |
| RC-SET-07 | Tax, Tribute, Donation and Contract Transfer | Core Required | Economy / Factions |
| RC-SET-08 | Repair, Restoration and Public Works | Core Required | Structures / Events |

## Adventure, Loot, Relic and Aftermath Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-ADV-01 | Site Salvage and Evidence Recovery | Core Required | Adventure Sites |
| RC-ADV-02 | Contextual Container Resolution | Core Required | Loot / Structures |
| RC-ADV-03 | Boss Proof and Reward Package | Core Required | Bosses / Events |
| RC-ADV-04 | Relic Fragment Restoration | Core Conditional | Relics / Culture |
| RC-ADV-05 | Map, Key and Access Knowledge | Core Required | Knowledge / Exploration |
| RC-ADV-06 | Dungeon Maintenance and Consumables | Core Required | Adventure / Survival |
| RC-ADV-07 | Event Aftermath Recovery | Core Required | Events / Law |
| RC-ADV-08 | Unique Object Loss and Recovery | Core Required | Relics / Save Integrity |

## Verdant Covenant Complete Realm Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-VRD-01 | Living Heartwood Harvest and Consent | Core Conditional | Verdant Covenant |
| RC-VRD-02 | Season Sap Collection | Core Conditional | Verdant Covenant |
| RC-VRD-03 | Thornsilver Fibre Processing | Core Conditional | Verdant Covenant |
| RC-VRD-04 | Pollen Amber Stabilisation | Core Conditional | Verdant Covenant |
| RC-VRD-05 | Memory Seed Cultivation | Core Conditional | Verdant Covenant |
| RC-VRD-06 | Bloomstone Extraction and Cleansing | Core Conditional | Verdant Covenant |
| RC-VRD-07 | Living Construction Commission | Core Conditional | Verdant Covenant |
| RC-VRD-08 | Verdant Resolution Reward and Overworld Use | Core Conditional | Verdant Covenant / Bosses |

## Ancestral Veil Threshold Teaser Chains

| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-VEI-01 | Ancestral Threshold Stabilisation | Teaser Only | Ancestral Veil |
| RC-VEI-02 | Threshold Evidence and Memory Record | Teaser Only | Ancestral Veil |

# Appendix B. Substitution and Capability-Equivalent Groups

| Group | Eligible Providers | Compatibility Boundary |
| --- | --- | --- |
| SUB-01 Shelter Material | Timber, common stone, earth/brick, reed/cane or salvaged construction kit. | Must satisfy weather, support and placement capability; presentation may differ. |
| SUB-02 Cutting Edge | Sharp stone, copper/alloy, iron, chitin/bone specialist edge or salvage. | Target hardness and durability band must be valid. |
| SUB-03 Common Fuel | Firewood, charcoal, peat, coal, lamp oil or approved magical heat. | Recipe declares heat class, contamination and renewable/finite preference. |
| SUB-04 Cordage and Flexible Binding | Plant fibre, bast/reed, wool, leather thong, creature silk or culture good. | Tensile, wetness, heat and magic compatibility checked. |
| SUB-05 Structural Masonry | Common stone, cut stone, brick, deepstone or approved living construction. | Load, hazard and repair class required; no universal cosmetic substitution. |
| SUB-06 Staple Provision | Grain, root crop, mushroom, orchard/forage, animal product or imports. | Nutrition, renewability and settlement availability required. |
| SUB-07 Basic Medicine | Medicinal herb, fungus, creature reagent, culture medicine or healer service. | Condition tags and diagnosis coverage must match. |
| SUB-08 Preservation | Salt, drying, smoking, fermentation, cold/magic storage or frequent fresh supply. | Shelf-life and world-setting effects explicit. |
| SUB-09 Copper Mechanism Capability | Copper, approved copper alloy, restored mechanism, trade component or culture technology. | Conductive/mechanical capability and CAP-03 proof required. |
| SUB-10 Durable Structural Capability | Iron, approved equivalent material, restored frame, imported component or alternative structure design. | CAP-04 tool/load/repair capability required. |
| SUB-11 Conductive/Ward Material | Copper conductor, silver-like specialist metal, rune conductor, mana crystal pathway or recovered device. | Magic/power compatibility and risk declared. |
| SUB-12 Sealant and Weatherproofing | Resin/pitch, wax/oil-like culture compound, fitted ceramic/stone solution or Set 26 extension. | Environment and flammability constraints required. |
| SUB-13 Light and Visibility | Fire/torch, lamp oil, mana light, bioluminescent safe source or settlement service. | Duration, hazard, fuel and accessibility cue explicit. |
| SUB-14 Mana Provider | Mineral, leyline, creature essence, ruin/device, culture teacher/trade or realm material. | At least two valid discovery families per supported world profile. |
| SUB-15 Cleansing Provider | Herbal/fungal reagent, filter/charcoal, ward/ritual, specialist service or natural recovery. | Hazard class, waste and outcome limits declared. |

# Appendix C. Provenance, Ownership and Custody Profiles

| Profile | Required Context | Compression / Boundary |
| --- | --- | --- |
| PROV-01 Gathered Natural | Source region/biome, harvest time, harvester where needed, claim and ecological state. | Common stacks may aggregate to source class rather than exact coordinates. |
| PROV-02 Cultivated or Bred | Producer/settlement, lineage/variety, harvest, welfare/health and treatment. | Supports culture, quality, disease and trade evidence. |
| PROV-03 Crafted or Processed | Maker/workshop, recipe, material batches, quality and production event. | Exact material ancestry may be compressed after policy threshold. |
| PROV-04 Salvaged or Recovered | Original site/object, claimant, salvage law, damage/contamination and recovery event. | Cannot become automatically unowned merely because it was damaged. |
| PROV-05 Traded or Shipped | Producer, consignor, carrier, destination, contract, route and loss/damage events. | Market price is contextual, not stored as immutable item truth. |
| PROV-06 Settlement/Public Stock | Settlement/faction owner, warehouse, reservation, tax/donation/contract source. | Project and emergency reservations override normal consumption by rule. |
| PROV-07 Sacred or Culturally Restricted | Culture/faith interpretation, custodian, permitted uses and restitution requirements. | UI must communicate non-colour warnings and consequences. |
| PROV-08 Creature-Derived | Species/personhood eligibility, acquisition method, welfare/law, hunter/collector and event. | Personhood gate is mandatory; remains are not generic resources. |
| PROV-09 Boss/Threat Proof | Threat instance, outcome, contributors, public/private allocation and aftermath. | Proof may be shared/recorded even when physical trophy is unique. |
| PROV-10 Relic/Unique Custody | Authored/generated origin, reservation, condition, custody history, display and loss/recovery. | No duplication; proxy evidence may protect progression. |
| PROV-11 Realm-Origin | Realm, route, stabilisation, native demand, customs/ownership and cross-realm use. | Removal/pack absence preserves identity and state. |
| PROV-12 Migration/Recovery | Original definition, migration chain, substitution/quarantine reason and receipt. | Never presented as ordinary newly crafted provenance. |

# Appendix D. Contextual Loot Grammar Register

| Grammar ID | Name | Context / Slots | Ownership Rule | Fallback |
| --- | --- | --- | --- | --- |
| leyforge.core.loot.survival.wilderness_cache | Wilderness Survival Cache | Forage/shelter context; food, fuel, simple tool material, map clue. | No advanced tier reward; owner normally unclaimed or former traveller. | Material/knowledge fallback. |
| leyforge.core.loot.civilisation.worker_cache | Worker and Tool Cache | Active/abandoned job site; tools, repair stock, food, work records. | Ownership depends on settlement/site state. | Damaged tool, scrap or job knowledge. |
| leyforge.core.loot.civilisation.relief_stock | Relief and Emergency Stock | Disaster, refugee, infirmary or public store context. | Strong restitution/aid ownership rules. | Reputation/quest evidence if goods unavailable. |
| leyforge.core.loot.trade.shipment | Trade Shipment Resolution | Manifest, route, producer, destination, danger and loss state. | Exact physical goods; no infinite merchant generation. | Damaged goods, claim document or route clue. |
| leyforge.core.loot.industry.workshop_salvage | Workshop and Machine Salvage | Industry state, machine family, damage and claim. | Components, maintenance stock, designs and scrap. | Knowledge, rubble or repair opportunity. |
| leyforge.core.loot.extraction.mine_cache | Mine and Extraction Cache | Geology, operator, depth, hazard and depletion. | Ore/sample/tools/supplies consistent with site. | Survey clue or salvage component. |
| leyforge.core.loot.culture.archive | Culture Archive and Record Cache | Culture, institution, history, law and damage state. | Books, maps, contracts, art/culture goods; custody important. | Copied knowledge or restoration task. |
| leyforge.core.loot.sacred.offering | Sacred Offering and Custody Grammar | Faith/culture site, active/abandoned status and law. | Offerings remain owned/interpreted; taking may create consequence. | Blessing/knowledge/permission rather than item. |
| leyforge.core.loot.adventure.dungeon_material | Dungeon Material Cache | Site grammar, depth, occupants, history and solved state. | Useful materials and tools tied to environment. | Knowledge, repair stock or alternate material. |
| leyforge.core.loot.ecology.nest_hoard | Nest, Den and Hoard Grammar | Species behaviour, diet, territory, stolen-goods history. | Natural material, prey remains, stolen item or evidence. | Ecology clue or non-material discovery. |
| leyforge.core.loot.faction.supply | Faction Supply and Encampment Grammar | Faction role, logistics, morale, legality and event state. | Food, gear, contracts, stolen goods and intelligence. | Prisoner/info/reputation outcome. |
| leyforge.core.loot.boss.outcome | Boss Outcome Reward Grammar | Outcome, contribution, territory, faction and aftermath. | Proof, material, knowledge, reputation and world change. | Capability-equivalent non-item reward. |
| leyforge.core.loot.relic.fragment | Relic Fragment and Restoration Grammar | History, relic reservation, site/custody and condition. | Fragment, restoration clue, provenance and interpretation. | Replica, knowledge or alternate relic. |
| leyforge.core.loot.knowledge.exploration | Map, Recipe and Research Grammar | Discovery context, player knowledge and duplication policy. | New clue/recipe/map or improved certainty. | Currency/material/reputation when already known. |
| leyforge.core.loot.structure.restoration | Restoration and Public-Works Reward | Restored structure, contributors, owner and project outcome. | Payment, reputation, service unlock, leftover material and history. | Service/permission/relationship reward. |
| leyforge.core.loot.event.aftermath | Dynamic Event Aftermath Grammar | Event cause, casualties, claims, shortages and current state. | Salvage, relief need, evidence and restitution choices. | Quest/event state only when physical reward invalid. |
| leyforge.core.loot.realm.verdant_memory | Verdant Memory and Growth Grammar | Realm relationship, seasonal state, consent and outcome. | Living material, memory knowledge and relationship reward. | Knowledge-only or delayed gift. |
| leyforge.core.loot.realm.ancestral_threshold | Ancestral Threshold Evidence Grammar | Teaser route, safety status and non-extractive boundary. | Bounded evidence/knowledge; no farmable production resource. | Overworld testimony or Codex clue. |

# Appendix E. Recipe-Class and Field Matrix

| Recipe Class | Required Contract | Representative Chains |
| --- | --- | --- |
| Hand Recipe | Immediate low-complexity transformation; no persistent station required. | Primitive tools, simple bundles and field preparation. |
| Station Recipe | Transformation owned by a placed station with slots, time and permissions. | Workbench, forge, kiln, kitchen, rune table. |
| Machine Recipe | Timed/batched transformation with power, ports, throughput and LOD transaction rules. | Crusher, sawmill, furnace, sorter. |
| Cooking/Preservation Recipe | Food safety, freshness, spoilage and culture variants. | Meals, drying, smoking, fermentation. |
| Repair/Maintenance Recipe | Consumes compatible repair stock and changes condition/state without replacing identity. | Tools, machines, blocks and infrastructure. |
| Salvage/Recovery Recipe | Dismantles eligible objects under ownership/claim rules and produces bounded fractions. | Ruins, machines, equipment and event aftermath. |
| Project Recipe | Staged exact-resource reservation and labour transforming structure/settlement state. | Buildings, roads, public works and living construction. |
| Automation Network Contract | Authoritative transfer/production relationship across machines and storage. | Extraction -> processing -> warehouse. |
| Rune/Magic Recipe | Uses mana, purity, knowledge, risk and substrate fields. | Runes, wards, cleansing and couplers. |
| Ritual/Route Recipe | Multi-participant/world-state transformation with safe failure and persistent aftermath. | Realm routes and major cleansing. |
| Culture Recipe Facet | Culture-owned technique/presentation applied to common physical ingredients. | Signature goods without duplicate economy logic. |
| Quest/Event Resolution Recipe | Consumes/reserves/returns physical goods as part of authoritative objective/outcome. | Relief, restitution, restoration and contracts. |
| Realm Recipe | Realm-law-aware transformation with native demand and Overworld utility. | Verdant living construction and stabilisation. |
| Generated Shape/Variant Recipe | Tool-generated conversions for eligible material/shape sets with explicit exceptions. | Slabs, stairs and construction variants in Document 03/05. |

# Appendix F. CAP-00 to CAP-10 Reachability Checklist

- Every supported world profile proves CAP-00 food/water-access, heat/light, shelter and safe building without fixed coordinates.
- CAP-01 primitive tools and storage have local or salvage/service alternatives.
- CAP-02 provisions and health have renewable providers and settlement/trade repair.
- CAP-03 copper mechanisms have at least two provider families across extraction, salvage, trade or equivalent technology.
- CAP-04 durable structural capability has iron or approved equivalent path with refinement/service access.
- CAP-05 practical mana has at least two discovery/provider families and a real infrastructure use.
- CAP-06 connects at least two cultures/settlements through physical goods, permissions and routes.
- CAP-07 provides a reachable site/threat with supplies, reward fallback and safe aftermath.
- CAP-08 proves conserved production into a settlement need, project, defence, trade or recovery outcome.
- CAP-09 proves route discovery, stabilisation, arrival, return and rescue.
- CAP-10 proves the Verdant realm package, several outcomes and Overworld-visible aftermath.

# Appendix G. Document 06 v1.0 Replacement Checklist

- Qualified resource IDs, parents, tags, status and pack ownership.
- World source, suitability, exclusions, distribution and provider alternatives.
- Block/item/creature/structure/trade/realm relationships.
- Renewability, depletion, recovery, grade, purity, hazards and extraction consequences.
- CAP-00 to CAP-10 capability relationships and fallback groups.
- Refinement stages, by-products, consumers and long-term older-material uses.
- Settlement, automation, magic, trade and quest demand.
- Provenance, legality, claims and cultural interpretation boundaries.
- Seed reachability, LOD, save, migration and optional-pack evidence.
- Legacy POC IDs/status fields archived or migrated.

# Appendix H. Document 05 v1.0 Replacement Checklist

- Qualified recipe IDs and schema-valid categories.
- Exact input/output references, quantities, units, substitutions, state transfer and by-products.
- Station/tool, time, batch, power/fuel/mana, environment and permission fields.
- Unlock, knowledge, culture, faction, quest, boss and realm relationships.
- Player, NPC, automation, project and ritual execution through one transaction service.
- Failure, interruption, blocked output, salvage, repair and rollback behaviour.
- Quality, contamination, freshness, purity and provenance propagation only where required.
- UI, accessibility, localisation, warnings and search fields.
- Conservation, LOD, save, migration, multiplayer and pack tests.
- No POC-only fixed recipes or guaranteed content dependencies.

# Appendix I. Document 25J Acceptance Criteria

- All 25G physical input/output classes and CAP bands have chain coverage.
- All 25H/25I families required for Core production have source or consumer paths.
- Every chain declares source, transformation, output, capability, fallback, status and owner.
- Substitutions are typed and cannot bypass essential capability, law or realm constraints.
- Loot grammars are contextual, provenance-aware and have valid fallback resolution.
- Quantity, ownership, unique reservations and required state are conserved across execution modes.
- Verdant Covenant is complete enough for Document 06/05 handoff; Ancestral Veil remains teaser-bounded.
- Set 26 compatibility is explicit without maritime design duplication.
- Documents 05 and 06 have precise replacement gates.
- Risks, conditional chains and open decisions remain visible rather than silently resolved.

# Navigation

- Previous: [[25I - Core Production Item Family Catalogue]]
- Next: [[25K - Asset Budgets and Forge, Animation, Audio, VFX, Socket and Event Manifest Contract]]
- Related: [[05 - Crafting and Recipe Registry v1.0 Replacement]]; [[06 - Resource Progression v1.0 Replacement]]; [[24J - Resources, Loot, Relics, Trade and Material Ecology Atlas]]; [[26A - Maritime and Naval Expansion Vision]]
