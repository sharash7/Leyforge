# Fantasy Voxel Civilisation Sandbox

## 06 — Canonical Resource Progression, Material Ecology and Capability Pathway System

**Version 1.0 — Production Replacement and Post-Atlas Reconciliation**

**Status:** Production Foundation  
**Supersedes:** `06_Fantasy_Voxel_Civilisation_Sandbox_Resource_Progression_v0_1`  
**Consumes:** Documents 00–05 v1.0; World Content Atlas Set 24, especially 24J; Document Set 25 governance and chain matrix; Document Set 26 maritime interfaces; Sets 27–30 final reconciled interface contract.  
**Engine Direction:** Godot runtime with Summer Engine development assistance.  
**POC Status:** The fixed Forest Hamlet/controlled-valley resource scenario is Archived Validation only. Its reusable material capabilities remain eligible production systems.

---

## Master Resource System Statement

Leyforge resources are not a universal ladder of increasingly stronger ores. They are materials, substances, stocks, biological products, geological deposits, magical carriers, cultural inputs, salvage, fuels, strategic goods and realm-origin resources that belong to a deterministic living world. Progression is expressed through **capabilities and provider diversity**: the player, NPCs and settlements must acquire the physical and knowledge capabilities required for a goal, but a valid world should not dead-end merely because one named ore, teacher, crop, settlement or ruin did not generate nearby.

> **Locked Production Rule — Capability Before Material Tier**  
> Copper and iron remain familiar, important Core anchors, but Leyforge production progression is a branching capability graph. No single material ladder owns progression. Trade, salvage, culture technology, alternative materials, restoration, practical magic, realm resources and specialist services may satisfy an approved capability only when their physical, knowledge, ownership and compatibility contracts are valid.

> **Locked Physical-Identity Rule**  
> A Resource definition is not automatically a Block and is not automatically an Item. Document 06 owns what the resource *is in progression*: its source classes, provider rules, material roles, capability relationships, renewability, grade/purity model and progression-facing provenance. Document 03 owns world Block forms; Document 04 owns genuinely separate carried Item forms; Document 05 owns exact transformations. No duplicate editable truth is allowed.

---

# Document Purpose

This document replaces the original linear/hybrid Resource Progression draft with the production resource authority required after the World Content Atlas and Document Set 25. It defines how resource families participate in progression without hard-coding one world layout or one compulsory material route; how material ecology becomes executable provider queries; how resource sources deplete, renew, move, trade and persist; how grade, purity, condition and provenance remain distinct; how settlements and automation consume real stock; how realm resources remain useful outside their source realm; and how later specialist systems consume resource facts without transferring ownership into Document 06.

The document deliberately does **not** copy the executable rules of Blocks, Items, Recipes, economy, biology, social systems, movement or maritime simulation. It provides canonical resource identities and resource-facing contracts that those systems consume.

---

# Governing Source Register

| Source | Authority Consumed by Document 06 v1.0 |
| --- | --- |
| 00 Master Game Design Bible v1.0 | Living-world, civilisation, magic, automation, sandbox-freedom and production vision. |
| 01 Core Gameplay Loop v1.0 | Seed-adaptive gameplay, physical consequence and the State → Intent → Validation → Cost → Result → Evidence → Consequence pattern. |
| 02 Player Progression v1.0 | Character progression may improve acquisition/processing but cannot invent resources or override specialist systems. |
| 03 Canonical Blocks Registry v1.0 | World-facing deposits, nodes, terrain/material Blocks and Block Inventory Projection boundary. |
| 04 Canonical Items Registry v1.0 | Carried raw/refined/resource Item forms, stack/instance state and the no-duplicate Block/Item identity rule. |
| 05 Canonical Crafting & Recipe Registry v1.0 | Exact transformations, conservation, typed substitutions, recipe classes and 105-chain coverage handoff. |
| 24J Resource/Material Ecology Atlas | Material origin, world context, resource ecology, 84 Overworld foundations, realm resource catalogue, provenance and contextual meaning. |
| 25B Registry Kernel | Qualified IDs, namespaces, one-source-of-truth, aliases, facets and migration rules. |
| 25C Domain/Relationship Contracts | Capability, suitability, fallback and typed relationship model. |
| 25F–25G Production Scope | Core/conditional/teaser selection and progression coverage requirements. |
| 25J Resource/Loot/Recipe-Chain Matrix | CAP-00–CAP-10 progression, 105 chain contracts, substitution groups, provenance profiles and Document 06 replacement gate. |
| Set 26 | Maritime resource uses, marine sources, sealing/fibre/fastener/ballast/corrosion roles, salvage and coastal/ocean resource extensions. |
| Set 27 | Prices, value, markets, contracts, finance and trade-route economics. Document 06 never stores authoritative current price. |
| Set 28 | Beliefs, social meaning, trust, willingness and social interpretation. Resource cultural restrictions are facts; social outcomes remain Set 28-owned. |
| Set 29 | Hunger/hydration/nutrition, toxins, disease, treatment and biological outcomes. Document 06 supplies consumed-material properties and evidence only. |
| Set 30 | Physical transport, cargo movement, routes and accessibility. Document 06 supplies material/cargo properties; Set 30 moves them. |

---

# Static Table of Contents

1. Locked Resource Progression Identity  
2. Supersession of the Legacy Material Ladder  
3. Resource Architecture and Source-of-Truth Boundaries  
4. Canonical Resource Definition Schema  
5. Qualified IDs, Aliases and Lifecycle Status  
6. Resource Taxonomy and Material Roles  
7. Material Ecology and Provider Classes  
8. Deterministic Distribution, Suitability and Seed Diversity  
9. Acquisition, Harvest, Extraction and Permission  
10. Grade, Purity, Quality, Condition and Provenance  
11. Renewability, Depletion, Regeneration and Carrying Capacity  
12. CAP-00 to CAP-10 Capability Progression  
13. Typed Substitution and Equivalent-Provider Rules  
14. Organic, Timber, Fibre, Resin and Botanical Progression  
15. Agriculture, Food, Water and Medicine Resource Progression  
16. Stone, Clay, Salt, Glass and Construction Mineral Progression  
17. Ore, Metal and Metallurgical Capability Progression  
18. Fuels, Power Materials and Energy Carriers  
19. Mana, Crystals, Runes and Magical Resource Progression  
20. Creature-Derived Resources, Personhood and Ethical Harvest Boundary  
21. Salvage, Scrap, Relics and Historical Materials  
22. Realm Resources, Stabilisation and Overworld Utility  
23. Maritime Resource Integration Boundary  
24. Automation, Industry and Maintenance Demand  
25. Settlement Needs, Public Works and Civilisation Demand  
26. Economy, Trade, Contracts and Strategic Resource Boundaries  
27. Biology, Survival and Health Interface  
28. Social, Cultural, Legal and Custody Interface  
29. Movement, Cargo and Route Interface  
30. Resource Processing and Document 05 Handoff  
31. Loot, Reward and Provenance Handoff  
32. Storage, Reservation, Ownership and Conservation  
33. Near/Far Simulation, Persistence and Migration  
34. UI, Codex, Prospecting and Player Trust  
35. POC Retirement and Capability Preservation Register  
36. Validation, Seed QA and Release Gates  
37. Production Integration and Main-Document Amendments  
38. Balancing and Anti-Exploitation Principles  
39. Open Decisions and Deferred Numeric Balance  
40. Production Acceptance Checklist  
Appendix A. 84 Overworld Resource Foundation Intake  
Appendix B. Realm Resource Foundation Intake  
Appendix C. 105 Production Chain Contracts  
Appendix D. Typed Substitution Groups  
Appendix E. Provenance and Custody Profiles  
Appendix F. Canonical Resource Definition Template  
Appendix G. Legacy Resource Migration Guidance

---

# 1. Locked Resource Progression Identity

Resource progression is the material-capability layer of Leyforge. It explains what kinds of matter or stock can support a capability, where those resources can legitimately originate, what prerequisites govern acquisition, how scarcity and replenishment behave, and how different world configurations remain playable without flattening every region into the same resource layout.

| Identity Layer | Meaning | Production Result |
| --- | --- | --- |
| Material ecology | A resource belongs to geological, biological, magical, industrial, cultural, historical or realm systems. | Resources feel like world constituents rather than menu currencies. |
| Capability progression | Resources satisfy capabilities such as shelter, tools, mechanisms, structural support, mana infrastructure and realm access. | Progression survives seed diversity. |
| Provider diversity | More than one physical/social route may satisfy a capability where approved. | Trade, salvage and cultural technology become meaningful rather than cosmetic. |
| Conservation | Resources cannot appear from UI timers, distant simulation or abstract settlement demand. | Player trust and economic coherence are preserved. |
| Long-term usefulness | Early resources retain repair, construction, fuel, culture, infrastructure or substitution roles. | Wood, stone, fibre, clay, copper and iron remain useful after later capabilities unlock. |
| Provenance | Important stock can retain source, maker, owner, route, event, culture and claim evidence. | Theft, salvage, trade, restitution and relic history matter. |
| Environmental consequence | Extraction can alter source state when the source contract declares it. | Automation scales labour without becoming infinite matter creation. |

## 1.1 Resource Is a Progression Concept, Not a Duplicate Object

A single conceptual material may appear through several specialist records without becoming several competing identities. For example, copper has a canonical Resource family; the world may contain copper-bearing Block definitions; the player may carry Raw Copper Ore or Copper Ingot Item definitions; recipes transform those forms; runtime records track deposit depletion and stock quantities. Document 06 owns the resource/progression relationship, not all of those records.

## 1.2 One Source of Truth Per Field

- Atlas owns *why and where* a resource belongs in the world.
- Document 06 owns progression capability, provider classes, resource-state semantics and acquisition/refinement relationships.
- Document 03 owns placed world forms and their block-state/drop interfaces.
- Document 04 owns separate carried forms and stack/instance behaviour.
- Document 05 owns exact transformations and quantity transactions.
- Runtime/save state owns current quantities, reservations, owners, depletion and current condition.
- Set 27 owns current economic valuation.
- Set 29 owns biological consequences of consumption/exposure.
- Set 30/26 own movement of cargo and aquatic/maritime execution.

---

# 2. Supersession of the Legacy Material Ladder

The original Document 06 used the memorable ladder **Wood → Stone → Copper → Iron → Steel → Mana Crystal → Arcane Alloy → Mythril → Voidstone → Celestial Metal**. That ladder was useful as an early design shorthand, but it is no longer the production progression authority.

The production rule is now:

**materials provide capabilities; capabilities unlock possibilities; later materials add new roles rather than globally replacing earlier materials.**

| Legacy Element | v1.0 Treatment |
| --- | --- |
| Wood and stone early progression | Preserved as common CAP-00/CAP-01 providers, not guaranteed named species/stone everywhere. |
| Copper | Preserved as a highly readable CAP-03 mechanism/conduction anchor. Alternatives require explicit capability equivalence. |
| Bronze/copper alloy | Conditional branch, not a compulsory universal rung. |
| Iron | Preserved as a highly readable CAP-04 durable structural/tool anchor. Alternatives require real structural capability. |
| Steel | Preserved as an advanced iron-derived industrial capability where recipes/knowledge allow; not the sole route to all later systems. |
| Mana Crystal | Preserved as one major physical mana provider, but CAP-05 requires provider diversity and cannot depend on one guaranteed mana pocket. |
| Arcane Alloy/Mythril | Retained as later magical/material families where admitted by current Atlas/item/recipe packages; they do not erase mundane materials. |
| Voidstone/Celestial Metal | Retained as realm-linked materials with stabilisation/native-demand/Overworld-use rules, not universal stat upgrades. |
| Fixed POC copper→iron→mana chain | Archived as validation history; generic capabilities remain production-valid. |

> **No Universal Tier Number Rule**  
> A resource may expose capability bands, hazard class, material properties, scarcity, quality compatibility and knowledge requirements, but one global numeric `tier` must not be treated as the authoritative answer to every recipe, tool, structure, economy, combat or magic question.

---

# 3. Resource Architecture and Source-of-Truth Boundaries

| Question | Canonical Owner |
| --- | --- |
| Where a resource can naturally occur | Atlas + worldgen provider facets |
| What progression capability the resource can satisfy | Document 06 |
| Which placed deposit/node is mined | Document 03 + world instance |
| Which carried batch is in inventory | Document 04 + runtime inventory |
| How one material becomes another | Document 05 |
| Which machine performs the transformation | Document 08 |
| How many units remain in a deposit | Runtime/save world state |
| Current ownership/claim | Runtime law/ownership systems |
| Current market price | Set 27 |
| Nutritional/toxic/treatment outcome | Set 29 |
| Social meaning/trust response | Set 28 |
| Cargo movement and route feasibility | Set 30; maritime movement via Set 26 boundary |
| Presentation assets | Forge/presentation systems |

## 3.1 Resource Family versus Material Family

A **Resource family** is an origin/progression contract. A **Material family** is a physical substance/compatibility family that Blocks, Items and Recipes may reference. They often align but need not be identical. A deposit can yield several materials; a material can have several provider families; a cultural good may be produced from common materials without becoming a new geology.

## 3.2 Resource Providers

A capability query resolves **providers**, not names. A provider may be a local natural source, cultivated source, trade route, salvage source, settlement producer, specialist service, realm source or other approved source class. Provider selection must respect suitability, knowledge, permission, law, depletion, route accessibility and installed packages.

---

# 4. Canonical Resource Definition Schema

Every admitted production Resource definition uses the universal registry envelope from Document 25B plus a Document-06-owned resource facet.

| Field | Required Meaning |
| --- | --- |
| `id` | Fully qualified stable Resource ID, normally `leyforge.core.res.<identity_path>`. |
| `source_anchor_ids[]` | Atlas/legacy IDs that supplied the concept; migration evidence, not competing identities. |
| `display_name_key` | Localisation reference, never stable identity. |
| `family_tags[]` | Organic, mineral, ore, crystal, biological, strategic, realm, etc. |
| `material_roles[]` | Structural, fibre, conductive, fuel, reagent, food-provider, sealant, stabiliser, etc. |
| `provider_classes[]` | Natural/cultivated/geological/creature/civilisation/salvage/realm/trade providers. |
| `source_suitability_query` | Atlas/worldgen query or declared external provider contract. |
| `acquisition_capabilities_required[]` | Tool, knowledge, permission, hazard protection, route/service requirements. |
| `capabilities_offered[]` | CAP band capabilities or typed specialist capabilities. |
| `renewability_profile` | Renewable/finite/conditional/recoverable plus regeneration/depletion behaviour. |
| `grade_profile` | Eligible source grade/concentration model where meaningful. |
| `purity_profile` | Composition/contamination/energetic purity model where meaningful. |
| `hazard_tags[]` | Toxic, corrupting, unstable, hot, cold, pressure-sensitive, etc.; descriptive facts only. |
| `block_form_refs[]` | Document 03 source/deposit/node forms where admitted. |
| `item_form_refs[]` | Document 04 carried/raw/refined forms where genuinely separate. |
| `recipe_chain_refs[]` | 25J planning chains and Document 05 executable transformations. |
| `consumer_capability_refs[]` | Structures, machines, projects, services and progression queries that consume the resource role. |
| `substitution_groups[]` | Typed compatibility groups; never unrestricted `any_material`. |
| `provenance_profile` | Minimum source/ownership/custody evidence. |
| `realm_stabilisation_profile` | Required for realm-origin material when cross-realm behaviour differs. |
| `lifecycle_status` | Core Required, Core Conditional, Teaser Only, Archived, etc. |
| `fallback_policy` | Alternate provider, trade, salvage, world repair, controlled omission or blocker. |

## 4.1 Fields Document 06 Must Not Own

Document 06 does not store current stack quantity, current merchant price, current hunger restored, attack damage, current movement speed, current NPC opinion, current deposit remaining quantity, current recipe timer or presentation file paths.

---

# 5. Qualified IDs, Aliases and Lifecycle Status

Production definitions use the Document 25B grammar. The old short IDs from Atlas and Documents 00–18 are retained as `source_anchor_ids` or versioned aliases when migration requires them.

Examples:

- `res.overworld.ore.01` → `leyforge.core.res.metal.ore.copper_ore`
- `res.overworld.crystal.08` → `leyforge.core.res.crystal.raw_mana_crystal`
- `res.realm.verdant_covenant.01` → `leyforge.core.res.realm.verdant_covenant.living_heartwood`

These examples establish the v1.0 canonical pattern; implementation tooling may shorten redundant path tokens only through an approved alias/migration review, never by silently changing a frozen ID.

Lifecycle is separate from identity. `Core Conditional` or `Teaser Only` is package/planning metadata and must not become a magical property of the material itself.

---

# 6. Resource Taxonomy and Material Roles

The production taxonomy is multi-axis. One primary catalogue group aids authoring; tags and roles determine cross-system use.

| Catalogue Group | Typical Roles |
| --- | --- |
| Botanical/organic | timber, fibre, resin, pitch, oil, pigment, insulation, reagent |
| Agricultural | staple provision, feed, medicine, brewing, fertiliser |
| Mineral/earth | masonry, clay, ceramic, glass, salt, aggregate, abrasive |
| Ore/metallurgical | conductor, mechanism, fastener, structural metal, alloy input |
| Crystal/gem/mana | optics, rune substrate, mana carrier, stabiliser, jewellery |
| Creature/biological | food, leather, fur, bone, chitin, silk, venom, essence |
| Strategic/industrial | fuel, salvage, specialist industrial material, hazard, public-works input |
| Realm | structural, catalyst, flexible, optical/inscription, biological/memory, stabilisation roles |
| Maritime extension | marine biological goods, salts/oils, sealants, fibres, ballast, corrosion-resistant and shipbuilding roles as admitted by Set 26 |

A resource can hold several roles. Role compatibility is queried; it is not inferred merely from the display name.

---

# 7. Material Ecology and Provider Classes


| Provider Class | Minimum Production Contract | Typical Examples |
| --- | --- | --- |
| Renewable wild source | Habitat, carrying capacity, harvest pressure, recovery, damaged state and law/claim where relevant. | Forage, herbs, fibre, resin. |
| Cultivated source | Seed/stock, suitability, labour, soil/water, disease, harvest and reseeding. | Grain, roots, orchards, textile crops. |
| Finite geological source | Geology, depth, grade, density, depletion, clues and aftermath. | Stone, copper, iron, salt. |
| Large deposit/node | Capacity, extraction interface, ownership, LOD and rehabilitation. | Automation-scale ore/stone source. |
| Creature source | Personhood eligibility, anatomy, welfare, ecology, law and method. | Meat, hide, silk, essence. |
| Civilisation producer | Workshop, labour, knowledge, input supply, stock and route. | Culture goods, medicine, components. |
| Salvage source | Original object/site, claim, damage, contamination and restoration alternative. | Scrap, machine parts, relic fragments. |
| Realm source | Realm law, stabilisation, native demand, route and Overworld utility. | Verdant and other realm materials. |
| Trade/import provider | Producer, route, destination, risk and replenishment; never infinite stock. | Regional substitute or scarce good. |


## 7.1 Ecology Is Not Decorative Lore

Worldgen and simulation must be able to answer whether a provider is valid **now**. A forest species may be present but protected, depleted, diseased or outside the player's known area. A mine may be geologically valid but already exhausted. A settlement may know a technique but lack labour or fuel. A realm resource may exist but be unstable outside its native realm. Those distinctions are gameplay, not flavour text.

---

# 8. Deterministic Distribution, Suitability and Seed Diversity

No production world is required to reproduce the old POC valley or guarantee one named node near spawn. Instead, supported seed profiles must prove capability reachability.

Worldgen/resource rules must:

- derive natural resource placement deterministically from seed and registered world relationships;
- respect biome, geology, hydrology, climate, ecology, realm influence and structure/site context;
- use surface clues, surveys, maps, NPC knowledge, trade intelligence and exploration rather than omniscient resource markers by default;
- allow named resources to be absent locally when a valid capability alternative exists;
- repair impossible seed starts by relocation, alternate providers or controlled generation failure rather than by invisible arbitrary spawning;
- preserve already-explored depletion and world edits across worldgen version changes.

## 8.1 Required Seed Proof

A supported world profile must prove CAP-00 through the intended package ceiling using at least one valid provider path per required capability. CAP-05 Practical Mana specifically requires more than one potential provider family across the supported world/package design; it cannot depend on a single guaranteed Raw Mana Crystal pocket.

---

# 9. Acquisition, Harvest, Extraction and Permission

Acquisition is a relationship between a valid provider, the actor's capabilities, world state and authority. A resource definition declares requirements; specialist systems execute the action.

| Acquisition Mode | Required Checks |
| --- | --- |
| Hand gather/forage | Reachability, tool if required, claim/permission, source state, harvest pressure. |
| Mining/quarrying | Block/source compatibility, tool capability, grade, support/hazard rules, ownership, depletion. |
| Cultivation | Suitable plot/water/soil, stock, labour, disease/state, harvest maturity. |
| Creature harvest | Creature eligibility/personhood, anatomy, method, welfare/law, source condition. |
| Salvage | Original ownership/claim, damage, contamination, restoration alternative, dismantling capability. |
| Purchase/trade | Real seller stock, Set 27 terms, route/transport feasibility, ownership transfer. |
| Settlement allocation | Warehouse stock, reservations, permission, project/emergency priority. |
| Realm gathering | Realm law, stabilisation, native demand, route access and extraction permission. |

Magic may assist acquisition only through explicit magic-owned effects and compatibility rules. It cannot bypass resource existence, claims or conservation merely because a spell targets a material.

---

# 10. Grade, Purity, Quality, Condition and Provenance

These dimensions are intentionally separate.

| Dimension | Meaning | Owner/Rule |
| --- | --- | --- |
| Grade | Natural concentration/yield potential of a source or raw batch. | Resource/source facet; may influence Document 05 yield. |
| Purity | Contamination or energetic/material composition. | Resource/batch state; relevant to mana, metallurgy, medicine and hazards. |
| Craft quality | Process outcome from material, station, skill, specialist and method. | Item/recipe systems where supported. |
| Condition | Mutable current integrity/freshness/charge/contamination. | Runtime state owned by actual form. |
| Provenance | Source, maker, owner, event, route or custody history. | Shared evidence profile with one authoritative runtime record. |
| Scarcity | Availability in current region/world/market. | Contextual; Set 27 may derive economic effects. |
| Significance | Cultural, relic, authority or unique importance. | Content/site/culture owners; not universal stat power. |
| Legality/claim | Who may gather, possess, trade, salvage or use. | Law/ownership systems; Document 06 exposes facts. |

A high-grade source is not automatically a legendary item. A rare resource is not automatically stronger. A culturally sacred resource may be mechanically mundane but socially consequential.

---

# 11. Renewability, Depletion, Regeneration and Carrying Capacity

1. Renewable does not mean infinite-per-tick.
2. Finite sources preserve remaining quantity/bands and visible aftermath where practical.
3. Cultivated systems require production inputs and time rather than duplicating wild harvest.
4. Automation increases labour efficiency/throughput but cannot generate matter without a declared producer or magic/realm rule.
5. Distant simulation preserves net quantities, reservations and irreversible depletion.
6. Worldgen updates cannot silently refill already-explored deposits.
7. Habitat damage, overharvest, pollution, corruption or instability apply only where the relevant source/package rules declare them; they are not universal random punishments.
8. Restoration, rehabilitation or reseeding can create recovery only through an explicit world-state transformation.

---

# 12. CAP-00 to CAP-10 Capability Progression

The following capability graph is the production replacement for the old universal material ladder.


| Capability Band | Primary Chains | Required Proof | Repair/Fallback |
| --- | --- | --- | --- |
| CAP-00 Safe Spawn | RC-SUR-01/02/05/07 | Food/water-access equivalent, fuel/light, shelter and safe build area. | Spawn relocation, alternate provider or controlled generation failure. |
| CAP-01 Primitive Tools | RC-SUR-03/04/06/08; RC-MIN-01 | Gather, mine, store and repair common materials. | Salvage, settlement loan/service or material substitution. |
| CAP-02 Provisions/Contact | RC-FOD-01–12; RC-SET-04/06 | Renewable provisions, health input, route/trade or settlement contact. | Forage, relief, imports, visiting specialist or alternate crop. |
| CAP-03 Copper Mechanisms | RC-MET-01–06; RC-AUT-01/02 | Conductive/mechanical material, gears/plates and simple power/logistics. | Salvage, trade, restored machine or approved alloy/technology. |
| CAP-04 Iron Support | RC-MET-07–12; RC-MIN-09 | Durable tools, structural frames, forge/refinement and project support. | Trade, salvage, equivalent structural capability or alternate design. |
| CAP-05 Practical Mana | RC-MAG-01–08; RC-CRE-06 | At least two discovery/provider families and practical infrastructure use. | Alternate provider, teacher, ruin/device, trade or world repair. |
| CAP-06 Regional Civilisation | RC-SET-01–08; RC-FOD-12 | Two cultures/settlements, real goods, routes, permissions and exchange. | Caravan/wayhouse, visiting specialist or alternate regional connection. |
| CAP-07 Regional Adventure | RC-ADV-01–08 | Reachable site, supplies, counterplay, contextual reward and aftermath. | Alternate eligible site/threat and safe-route repair. |
| CAP-08 Automation-to-Civilisation | RC-AUT-04–08; RC-SET-01/04 | Conserved production supplies a settlement need/project/trade outcome. | Manual/NPC delivery, alternate producer or simpler chain. |
| CAP-09 Realm Access | RC-MAG-09; threshold access contracts | Knowledge/material/relationship route, arrival, return and rescue. | Alternate gate/guide or controlled omission/failure. |
| CAP-10 Verdant Resolution | RC-VRD-01–08 | Complete Verdant resource, society, site, authority and Overworld-use package. | Alternate authority outcome or equivalent knowledge/capability reward. |


## 12.1 Material Anchors Are Readable, Not Absolute

Copper and iron remain strongly signposted because they create intuitive survival/industry progression. A region or culture may reach equivalent capabilities through approved alternatives, but the alternative must actually provide the required physical traits, production knowledge, maintenance path and availability. A decorative rename is not an alternative capability.

## 12.2 Realm Progression Does Not Invalidate Overworld Industry

Realm resources add behaviours and construction/magic possibilities. They do not make ordinary timber, clay, glass, copper or iron obsolete. Large settlements, maintenance, roads, ships, workshops and repairs continue consuming mundane resources at civilisation scale.

---

# 13. Typed Substitution and Equivalent-Provider Rules

Substitution is capability-typed. `any_material`, unrestricted `any_ingot`, or a display-name match is prohibited where physical or social compatibility matters.


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


A substitution result may change appearance, durability, maintenance demand, hazard tolerance, cultural acceptance or route requirements. Document 05 owns exact recipe substitutions; Document 06 owns whether a material family is eligible to advertise the capability in the first place.

---

# 14. Organic, Timber, Fibre, Resin and Botanical Progression

Organic resources support shelter, construction, fuel, tools, cordage, textiles, records, insulation, sealants, agriculture, medicines and culture goods. Their long-term value comes from scale and specialised properties, not from remaining the strongest structural material.

Key production principles:

- structural timber remains a major building/repair demand throughout the game;
- light framing, heavy timber and arcane-compatible woods are roles, not automatic numeric tiers;
- fibre families must declare tensile/wetness/heat/magic compatibility where relevant;
- resin/pitch/wax/oil-like substances can support sealing, preservation, alchemy and maritime use when approved by recipe/Set 26 contracts;
- forestry and managed cultivation can become renewable industries but are bounded by labour, habitat and recovery;
- paper, ink and record media connect material production to knowledge, maps, contracts and institutions.

The Atlas Overworld intake in Appendix A is authoritative for named source foundations such as Oak Heartwood, Ironbark Timber, Whitepine, Blackwood, Willowreed, Sunflax Fibre, Mirehemp Fibre, Resin Amber, Pitch Sap, Corkbark, Dye Lichen and Alchemical Moss.

---

# 15. Agriculture, Food, Water and Medicine Resource Progression

Document 06 owns food/water/medicine **resource supply capability**, not the biological need calculations.

A supported region should offer multiple provision paths across staple crops, roots, forage, fungi, orchard/berry sources, animal products, imports and preservation. A settlement or player may specialise, but the world must not require one exact crop globally.

| Resource Concern | Document 06 | Set 29 / Other Owner |
| --- | --- | --- |
| A crop can provide staple food input | Yes | Set 29 converts consumed nutrition into biological state. |
| Water source/container material availability | Yes, provider/resource side | Set 29 hydration; Set 26B fluid identity/saltwater behaviour where applicable. |
| Herb/reagent can participate in medicine | Yes | Set 29 treatment eligibility/outcome. |
| Toxin/contamination tags exist | Yes as material facts | Set 29 biological toxin/disease consequence. |
| Spoilage/preservation capability | Resource compatibility + Document 05 process | Set 29 consumes actual food condition where biologically relevant. |
| Current food price | No | Set 27. |

The production design supports fresh supply, preservation, emergency relief and trade rather than assuming every settlement grows the same food.

---

# 16. Stone, Clay, Salt, Glass and Construction Mineral Progression

Minerals are persistent civilisation inputs. Common stone, limestone/lime, clay/brick/ceramic, silica/glass, salt, aggregate, peat and specialist masonry are not early-game trash after metal unlocks.

They remain important for:

- foundations, walls, roads, drainage and public works;
- kilns, furnaces, chimneys and heat-compatible construction;
- glass, optics, windows, vessels and magical apparatus;
- mortar, plaster, ceramics and sanitary infrastructure;
- preservation and chemical/alchemical processing;
- repair stock and region-specific architectural identity;
- shipyard/harbour ballast, masonry and coastal works where Set 26/20 contracts permit.

Prospecting and grade analysis belong to the resource pathway; exact Block hardness, tool interaction and recipe yields remain with Documents 03 and 05.

---

# 17. Ore, Metal and Metallurgical Capability Progression

## 17.1 Copper Capability

Copper is the principal readable CAP-03 anchor because it supports conductors, plates, gears, connectors, pipes/fittings, mechanisms and magic/automation interfaces. Tin and approved alloy routes may extend or substitute parts of the branch, but bronze/copper-alloy progression is not compulsory in every culture.

## 17.2 Iron Capability

Iron is the principal readable CAP-04 anchor because it supports durable tools, fasteners, rails, structural frames, forge work, weapons/gear components, machine support and major settlement projects. Bog Iron, Magnetite, trade, salvage and other approved providers can diversify acquisition without changing the capability requirement.

## 17.3 Steel and Later Metallurgy

Steel is an advanced processed material rather than an entire global tier switch. It expands pressure, wear, frame, weapon/armour and industrial possibilities where admitted recipes and knowledge exist. Rare and mythic metals can add specialised roles such as magical conduction, low mass, corruption resistance, dimensional stability or prestige, but they do not automatically replace iron fasteners, copper conductors or ordinary construction stock.

## 17.4 Strategic Metals

Silver, gold, lead, nickel, cobalt, Star Iron and other Atlas resources retain specific roles. Their value depends on use, scarcity, culture and current markets rather than a single combat-power hierarchy.

---

# 18. Fuels, Power Materials and Energy Carriers

Resource progression supports several energy-carrier classes:

- renewable biological fuels such as firewood and charcoal;
- geological/wetland fuels such as coal and peat where present;
- oils/resins/pitch and other processed combustible resources;
- mechanical/environmental energy providers such as water and wind, which are **not inventory resources** merely because machines consume their power;
- mana carriers and charged components;
- realm-origin or hazardous fuels where specialist systems admit them;
- portable fuel stocks used by automation, travel or settlement services.

Document 06 describes availability and material compatibility. Document 08 owns power-network execution; Document 05 owns fuel-consuming recipes; Set 27 owns fuel prices; Set 29 owns biological exposure where smoke/toxicity matters.

---

# 19. Mana, Crystals, Runes and Magical Resource Progression

The legacy **Raw Mana Crystal → Mana Shard → Mana Dust** chain is preserved as a valid production capability because later sources explicitly retained it. It is no longer the only possible path to Practical Mana.

CAP-05 requires multiple provider families across the supported content design. Potential providers include mineral/crystal sources, leyline infrastructure, creature/essence sources, restored devices/ruins, teachers/services/trade and realm-origin materials when their owning systems permit them.

Document 06 owns:

- material/provider eligibility;
- purity/stability/hazard facts;
- resource progression relationships;
- mana-provider capability tags;
- realm-stabilisation requirements at the material level.

Document 09 owns spells, mana networks, rune behaviour, wards and magical execution. Document 05 owns exact rune/mana transformations. A material being magical does not grant Document 06 authority to determine spell effects.

---

# 20. Creature-Derived Resources, Personhood and Ethical Harvest Boundary

Creature-derived resource families include food, hide/fur, bone/horn/antler, chitin/shell, silk, venom, ink, spirit essence and elemental/construct components as admitted by Atlas and creature systems.

> **Mandatory Boundary**  
> Document 06 never declares a sapient/person-like being to be a generic resource provider. Creature eligibility, personhood, anatomy, welfare and lawful/ethical harvest are owned by Document 10 and later social/law systems. Document 06 consumes an eligibility result.

Non-lethal providers such as shed antler, wool, silk/cocoons, milk/eggs or gathered residue can have distinct renewability and welfare profiles from hunting or carcass recovery.

---

# 21. Salvage, Scrap, Relics and Historical Materials

Salvage is a provider class, not free ownership. A ruined machine, wreck, battlefield, abandoned workshop or destroyed structure may contain recoverable materials, but the resource path must preserve:

- original object/site identity where important;
- claim and salvage-law status;
- damage/condition and contamination;
- restoration-versus-dismantling choice where relevant;
- bounded recovery yield;
- provenance transfer into recovered batches.

Unique relics and quest-significant objects are not generic resource stacks. Their fragments/materials may participate in restoration, but uniqueness and custody remain with relic/site/event owners.

---

# 22. Realm Resources, Stabilisation and Overworld Utility

Atlas 24J provides a broad realm-resource catalogue. Document 06 ingests the resource identities while respecting package maturity:

- **Verdant Covenant** has the complete conditional production chain in 25J and may progress through Living Heartwood, Season Sap, Thornsilver Fibre, Pollen Amber, Memory Seed and Bloomstone contracts.
- **Ancestral Veil** remains threshold/teaser-limited in the current chain baseline; its wider Atlas resource catalogue does not become a farmable production economy merely because names exist.
- Other realm resources remain valid Atlas foundations for later realm-package admission. Their production activation requires the relevant realm authority, stabilisation, route, native-demand and validation contracts.

Every active realm resource must have a lasting Overworld or cross-realm role. A realm should not exist only to provide a higher-stat replacement ore.

## 22.1 Stabilisation

Cross-realm material state may require cleansing, cooling, binding, warding, pressure containment, memory protection, consent, customs clearance or other realm-specific handling. The resource definition declares the need; Documents 05/09/14 and realm specialists own the executable process.

---

# 23. Maritime Resource Integration Boundary

Set 26 requires Document 06 to support marine source conditions, renewability, extraction depth, habitat consequence, coastal resources, salts, oils, reagents, filters, marine biological resources, sealing/fibre branches, maritime fuels/material roles, ballast, corrosion concerns, salvage and long-term shipbuilding/repair demand.

Document 06 therefore exposes generic maritime-compatible facets without stealing Set 26 ownership:

| Resource Facet | Example Meaning | Specialist Owner |
| --- | --- | --- |
| `marine_source_eligible` | Can originate from coastal/ocean/marine ecology. | Set 26C/26M source detail. |
| `saltwater_exposure_class` | Material/resource can be affected by or suitable for marine environment. | Set 26B/26F/26H execute effects/use. |
| `sealant_role` | Eligible for approved caulking/weatherproofing substitutions. | Set 26H exact shipwright requirements. |
| `marine_fibre_role` | Eligible for rope/sail/net/rigging-like uses after admission. | Set 26H/26N. |
| `ballast_role` | Eligible as mass/ballast material when vessel contracts permit. | Set 26F/26G. |
| `corrosion_context` | Resource/material can expose corrosion compatibility facts. | Set 26 vessel/material systems. |
| `wreck_salvage_provenance` | Can retain vessel/wreck/claim source evidence. | Set 26H/26L and law/economy. |

Base progression cannot hard-depend on an optional maritime expansion definition. Set 26 admission/removal/reinstall must preserve opaque extension state and migration safety.

---

# 24. Automation, Industry and Maintenance Demand

Automation never changes the conservation rule. It changes labour, throughput, scheduling, transport and scale.

Resource-facing requirements include:

- large deposits/nodes can expose extraction capacity and depletion state;
- raw materials can expose process compatibility without embedding machine logic;
- maintenance resources remain recurring sinks rather than one-time unlock costs;
- machine wear, filters, lubricants, replacement parts and fuel/mana create continued material demand where those systems define them;
- distant automation must reconcile to the same net resource transformations as local simulation;
- settlement delivery uses actual inventories/reservations and cannot create “virtual stock” merely because a production graph says output exists.

---

# 25. Settlement Needs, Public Works and Civilisation Demand

Resources gain long-term value by feeding real civilisation systems. Document 06 exposes supply roles to Documents 07, 19 and 20 without calculating settlement needs itself.

| Civilisation Demand | Resource Roles |
| --- | --- |
| Housing | timber, stone, masonry, roofing, glass, insulation, fittings, repair stock |
| Provisions | food, water-access inputs, preservation, fuel, containers, storage inputs |
| Health | herbs/reagents, clean-water support, bandage/textile inputs, filters, sanitation materials |
| Work | tools, fuel, machine stock, workshop inputs, maintenance goods |
| Safety | structural material, fasteners, lighting/fuel, guard supply inputs, wards where owned by magic |
| Infrastructure | roads, drainage, bridges, ports, rails, utilities, public-works stock |
| Morale | cultural foods, textiles, art/craft materials, records, ceremonial goods where relevant |

Exact building/project requirements remain Documents 19–20 and Document 05 project recipes.

---

# 26. Economy, Trade, Contracts and Strategic Resource Boundaries

Resource scarcity, provenance, culture preference, strategic importance and route dependence are economic **inputs**, not prices.

Set 27 owns:

- current price/value formation;
- currency and payment;
- contracts, wages, taxes, finance;
- market demand and trade-route economics.

Document 06 may expose facts such as `scarcity_class`, `renewability`, `strategic_role`, `producer_region`, `provenance`, `legality`, `bulk/cargo class` and `substitute_capability`. It must never store a supposedly permanent `base_price` as authoritative current economic truth.

Trade is a valid progression provider only when real stock, seller/producer, route, permission and transaction exist. “Buy copper” is not a fallback if no one actually produces or imports copper or an approved equivalent.

---

# 27. Biology, Survival and Health Interface

Set 29 owns Health, Stamina, Fatigue, hunger/hydration/nutrition, temperature/wetness/sleep, injury, disease, toxins, treatment and biological modifiers.

Document 06 supplies resource facts such as:

- food/provision category;
- hydration source/container compatibility;
- contamination/toxin tags;
- medicinal/reagent compatibility;
- freshness/preservation source facts where applicable;
- thermal/insulation material capability for gear/building consumers;
- biological/creature provenance.

When food, water or medicine is actually consumed, Set 29 determines the biological result. Document 06 does not say “this herb heals 20 HP” or “this food restores 30 hunger” as a resource-level rule.

---

# 28. Social, Cultural, Legal and Custody Interface

A material can be culturally sacred, restricted, taboo, prestigious or ordinary. Those are content facts that can affect permissions and interpretation, but Set 28 owns actor beliefs, trust, loyalty, dialogue and willingness.

Examples:

- a culture may recognise a resource as sacred;
- a settlement may legally restrict harvesting;
- a relic material may have a custodian;
- a gift may have a known cultural meaning;
- a stolen sacred resource may retain provenance.

Document 06 exposes the facts. Social systems decide how specific actors respond.

---

# 29. Movement, Cargo and Route Interface

Resources become cargo through their actual Block/Item/stock representations. Set 30 owns ground/air/traversal transport, route accessibility, travel time and land/guided transport execution; Set 26 owns detailed maritime transport and aquatic movement boundaries.

Document 06 may expose:

- bulk/fragility/hazard handling classes;
- environmental exposure constraints;
- special container/stabilisation requirements;
- perishability/condition facts;
- strategic priority labels supplied to logistics consumers.

It does not calculate vehicle speed, carry penalty, route accessibility or freight price.

---

# 30. Resource Processing and Document 05 Handoff

Document 06 describes **relationships** such as raw → refined → specialised forms; Document 05 owns exact executable recipes.

Examples of preserved production relationships include:

- timber → planks/beams/charcoal/resin products;
- limestone → lime/mortar;
- clay → brick/ceramic;
- silica → glass;
- ore → concentrated/raw metal input → ingot/bloom → plate/rod/fastener/component;
- food inputs → meals/preserved rations;
- hide → leather/parchment;
- Raw Mana Crystal → Mana Shard → Mana Dust → rune/ward/mana infrastructure inputs;
- salvage source → bounded recovered material/components;
- realm source → stabilised usable material;
- marine-compatible inputs → Set-26-owned vessel/shipyard work packages.

Near/far and player/NPC/machine transformations all use Document 05's authoritative reservation/transaction model.

---

# 31. Loot, Reward and Provenance Handoff

Resource definitions can be eligible reward inputs, but they do not own loot selection. Structures/events/bosses and loot grammars decide what is contextually valid.

Loot must not become a detached rarity faucet. A mine cache should reflect geology/operator/history; a workshop salvage cache should reflect machinery and damage; a trade shipment should reflect a real manifest and route; a boss outcome may provide proof, knowledge, reputation or world change instead of a compulsory unique material.

Duplicate knowledge/relic handling and unique-object recovery remain specialist responsibilities.

---

# 32. Storage, Reservation, Ownership and Conservation

Resource progression assumes exact stock conservation across inventory, warehouses, machines, projects, cargo, settlements and distant simulation.

Rules:

1. A Resource family definition never stores live stock quantity.
2. Stock exists only in authoritative world/inventory/storage/aggregate records.
3. Reservations prevent the same batch being promised to two recipes/projects/contracts.
4. Donation, theft, tax, tribute, trade, salvage and project contribution are distinct ownership/custody events.
5. Crafting does not automatically launder stolen provenance.
6. Packing a Block/container cannot duplicate its contents.
7. Splitting/merging stacks preserves required grade/purity/provenance rules.
8. If a pack is removed, unknown definitions are preserved/quarantined according to migration policy rather than converted into free generic materials.

---

# 33. Near/Far Simulation, Persistence and Migration

Distant simulation may compress detail but not change truth.

- finite deposit depletion remains conserved;
- renewable source recovery remains bounded;
- harvest/production transactions preserve totals;
- settlement consumption cannot exceed available/reserved stock;
- perishability/condition advances through owning-system rules rather than being ignored at distance;
- realm-origin state and stabilisation cannot disappear on demotion;
- provenance may be aggregated only according to its profile;
- promoted local instances reconcile against aggregate state before interaction resumes.

Legacy short resource IDs and POC planning statuses migrate through explicit aliases. Old `POC Required`, `Alpha`, etc. columns are documentation history, not shipped resource gameplay fields.

---

# 34. UI, Codex, Prospecting and Player Trust

Resource information should be knowledge-aware. The player may know that a region likely contains copper without knowing exact coordinates or grade. Prospecting can improve certainty through visible clues, tools, surveys, maps, specialists or magic.

Critical information uses more than colour alone:

- ownership/restriction;
- toxicity/corruption/hazard;
- freshness/contamination;
- grade/purity where known;
- realm instability;
- whether a substitution is compatible;
- whether a source is depleted/protected.

The UI must distinguish **unknown** from **absent**. A player should not infer that a resource cannot exist merely because it has not been discovered.

---

# 35. POC Retirement and Capability Preservation Register

| Legacy POC Resource Element | Production Classification | v1.0 Treatment |
| --- | --- | --- |
| Fixed mana pocket | Scenario Wrapper — Archive | No guaranteed production mana pocket. Preserve multiple mana provider paths. |
| Forest Hamlet warehouse stock targets | Scenario Wrapper — Archive | Preserve real settlement warehouse/resource reservation mechanics generically. |
| Watchtower iron delivery chain | Scenario Wrapper — Archive | Preserve iron structural/project supply capability, not fixed watchtower dependency. |
| Copper mechanisms | Gameplay Capability — Preserve | CAP-03 remains Core. |
| Iron tools/support | Gameplay Capability — Preserve | CAP-04 remains Core. |
| Mana Crystal → Shard → Dust | Reusable Content/Capability — Preserve | Production-valid magic processing unless later magic authority explicitly supersedes exact definitions. |
| Wood/stone/clay/sand/coal/fibre/food basics | Reusable Core Resources — Preserve | Generalised into seed-adaptive provider families. |
| POC-only resource status tags | Planning Metadata — Archive | Removed from shipped definitions; migration/provenance only. |
| Fixed late-material teaser fragments | Historical/Atlas-dependent | Admit only through current Atlas/realm lifecycle status; no forced POC teaser spawn. |

> **No Orphaned Capability Gate**  
> A legacy POC resource/chain may be removed only when its underlying capability remains represented, is explicitly superseded by later authority, or has an approved removal decision with migration evidence.

---

# 36. Validation, Seed QA and Release Gates


| Validation Code | Failure | Required Response |
| --- | --- | --- |
| RES-ID-001 | Duplicate or malformed qualified Resource ID. | Block release; repair identity/alias. |
| RES-SOT-001 | Resource copies a field canonically owned by Block, Item, Recipe, economy, biology or runtime. | Block release. |
| RES-FORM-001 | Physical resource has no valid Block/Item/service/provider representation where one is required. | Block affected capability. |
| RES-CAP-001 | Required capability band has no reachable provider path in supported seed profile. | Seed/profile fails validation. |
| RES-SUB-001 | Unrestricted or physically invalid substitution can satisfy a capability. | Block recipe/provider admission. |
| RES-CONS-001 | Near/far/source/production path creates or deletes unexplained material. | Block release. |
| RES-DEP-001 | Finite resource silently refills or renewable source exceeds declared recovery. | Block release. |
| RES-PROV-001 | Required ownership/provenance is lost through harvest, craft, trade or salvage. | Block transaction path. |
| RES-POC-001 | Production pool hard-references Forest Hamlet, fixed watchtower, scripted raid or guaranteed mana pocket. | Block production content. |
| RES-REALM-001 | Teaser/conditional realm material becomes unrestricted Core production without admission. | Block resource/package. |
| RES-MAR-001 | Base progression hard-depends on optional maritime definition or duplicates Set 26 authority. | Block cross-pack integration. |
| RES-ECO-001 | Resource stores authoritative current price/value formula. | Move to Set 27. |
| RES-BIO-001 | Resource directly owns biological outcome instead of exposing consumed-material facts. | Move to Set 29. |
| RES-LOD-001 | Distant source/stock does not reconcile with promoted local truth. | Block save/LOD gate. |


## 36.1 Seed Corpus Acceptance

The release seed corpus must demonstrate:

- CAP-00 safe start viability;
- CAP-01 common gathering/mining/repair;
- CAP-02 provisions/contact through more than one world pattern;
- CAP-03/CAP-04 through local, trade, salvage or approved culture alternatives;
- CAP-05 practical mana through provider diversity;
- civilisation and adventure reachability without fixed named structures;
- conditional realm access only when its package is enabled and valid;
- no base-game progression dead end when Set 26 is absent.

---

# 37. Production Integration and Main-Document Amendments

| Consumer | Required Document 06 Contract |
| --- | --- |
| 03 Blocks | Resource source/deposit/node roles, grade/purity/source relationships and harvest output references. |
| 04 Items | Raw/refined/resource Item relationships and required batch state without duplicate Block identity. |
| 05 Recipes | Resource roles, capability groups, progression relationships and provider compatibility. |
| 07 NPC/Settlements | Supply-role and provider facts; real stock remains storage/runtime truth. |
| 08 Automation | Extraction/processing-compatible inputs, depletion and resource conservation. |
| 09 Magic | Mana/reagent/stabilisation material facts only. |
| 10 Creatures | Eligible biological resource relationships; creature owner decides harvest/personhood. |
| 11 Worldgen | Source suitability/distribution queries and seed reachability targets. |
| 12 Structures | Site/salvage/resource-cache context. |
| 13 Cultures/Factions | Material preferences, restrictions and signature-good inputs; no price/social outcome. |
| 14 Realms | Realm resource identity, stabilisation and cross-realm use contracts. |
| 15 Quests/Events | Resource objective/evidence references; no abstract fake counters where real stock matters. |
| 16 Combat/Defence | Material/equipment/repair input relationships; combat stats remain specialist-owned. |
| 17 UI/UX | Knowledge-aware resource view models, hazards, provenance and uncertainty. |
| 18 Technical | Resource registry service, provider queries, saves, LOD, validation and migrations. |
| 19–20 | Exact project material roles/reservations and long-term settlement sinks. |
| Set 26 | Maritime extension facets and resource admission. |
| Set 27 | Scarcity/supply/provenance facts as economic inputs. |
| Set 28 | Cultural/legal/social facts as evidence inputs. |
| Set 29 | Consumed/exposed material facts as biological inputs. |
| Set 30 | Cargo/material handling facts as movement inputs. |

---

# 38. Balancing and Anti-Exploitation Principles

1. **No resource exists only to pad a tier.** Every admitted family needs consumers or a clear production purpose.
2. **Old materials remain useful.** Later capability does not erase mundane repair/infrastructure demand.
3. **Scarcity is contextual.** Do not encode “rare = strong” or “expensive = powerful.”
4. **Trade is not infinite generation.** Imported goods require producer/route/replenishment evidence.
5. **Automation is not alchemy.** More throughput cannot create missing input.
6. **Salvage is bounded.** Dismantling cannot return more conserved material than the source legitimately contained unless a declared magical rule explains it.
7. **Renewables have rates and carrying capacity.** Farming/forestry/fishing must not become zero-input matter printers.
8. **Teaser content cannot become a farm.** Threshold-only realm resources stay bounded until package admission.
9. **Alternative routes remain meaningful.** Fallbacks should solve seed dead-ends, not make every region materially identical.
10. **Maintenance sustains demand.** Civilisation scale creates recurring use for ordinary materials without arbitrary decay spam.
11. **Economic optimisation cannot override physics.** Cheap cargo still needs physical transport and stock.
12. **Difficulty/world settings may scale pressure, recovery or consequences, but must not silently violate conservation or ownership.**

---

# 39. Open Decisions and Deferred Numeric Balance

The following are intentionally not frozen by this foundation document:

- exact vein sizes, deposit counts, regeneration rates and world densities;
- exact harvest yields and refining ratios beyond values already locked by a concrete Document 05 recipe;
- exact food nutrition/hydration effects (Set 29);
- exact current prices/market curves (Set 27);
- exact vessel material thresholds/corrosion rates (Set 26);
- exact tool speed/hardness numbers (Documents 03/16/technical owners);
- final activation schedule for every Atlas realm resource beyond current package admissions;
- final late-game metallurgy balance for Arcane Alloy, Mythril, Voidstone-derived alloys and Celestial Metal;
- exact ecological penalty/recovery tuning.

Any later numeric balancing must preserve the identity, conservation, capability and ownership contracts in this document.

---

# 40. Production Acceptance Checklist

- [x] Replaces the old universal material-ladder authority with CAP-00–CAP-10 capability progression.
- [x] Preserves copper, iron, mana and other valid POC-tested capabilities without preserving fixed POC geography.
- [x] Adopts the 105 Document 25J production chain contracts as coverage requirements.
- [x] Adopts all 15 typed substitution groups.
- [x] Defines Resource/Block/Item/Recipe/runtime separation and prevents duplicate truth.
- [x] Ingests all 84 Atlas Overworld resource foundations as named source anchors for production resource definitions.
- [x] Ingests the Atlas realm-resource catalogue while preserving conditional/teaser admission boundaries.
- [x] Defines provider classes, seed reachability, fallback and world-repair rules.
- [x] Separates grade, purity, quality, condition, scarcity and provenance.
- [x] Defines renewable/finite/depletion/recovery contracts and near/far conservation.
- [x] Keeps current prices in Set 27, social outcomes in Set 28, biological outcomes in Set 29 and movement execution in Set 30/26.
- [x] Integrates Set 26 maritime resource requirements without making base progression depend on the expansion.
- [x] Defines POC retirement/migration rules and release-blocking validation failures.
- [x] Keeps exact recipe transformations in Document 05 and actual physical forms in Documents 03–04.

---

# Appendix A. 84 Overworld Resource Foundation Intake

The following Atlas foundations are adopted as source anchors for Document 06. They are **resource families**, not automatically Blocks or Items. Exact world forms and carried forms resolve through Documents 03–04. Atlas source context remains authoritative; Document 06 adds qualified production identity and progression/provider contracts.


| Production Resource ID | Atlas Source Anchor | Foundation | Primary Source | Core World Role | Atlas Band |
| --- | --- | --- | --- | --- | --- |
| leyforge.core.res.organic.botanical.oak_heartwood | res.overworld.botanical.01 | Oak Heartwood | Temperate forest | Structural timber | Variable |
| leyforge.core.res.organic.botanical.ironbark_timber | res.overworld.botanical.02 | Ironbark Timber | Old-growth woodland | Heavy construction | Variable |
| leyforge.core.res.organic.botanical.whitepine | res.overworld.botanical.03 | Whitepine | Cold forest | Light framing | Variable |
| leyforge.core.res.organic.botanical.blackwood | res.overworld.botanical.04 | Blackwood | Magical/deep forest | Arcane craft | Variable |
| leyforge.core.res.organic.botanical.willowreed | res.overworld.botanical.05 | Willowreed | Wetland or river edge | Thatch/rope | Variable |
| leyforge.core.res.organic.botanical.sunflax_fibre | res.overworld.botanical.06 | Sunflax Fibre | Managed field | Textile | Variable |
| leyforge.core.res.organic.botanical.mirehemp_fibre | res.overworld.botanical.07 | Mirehemp Fibre | Marsh cultivation | Cordage/filter | Variable |
| leyforge.core.res.organic.botanical.resin_amber | res.overworld.botanical.08 | Resin Amber | Resin-bearing trees | Varnish/alchemy | Variable |
| leyforge.core.res.organic.botanical.pitch_sap | res.overworld.botanical.09 | Pitch Sap | Conifer/industrial grove | Fuel/sealant | Variable |
| leyforge.core.res.organic.botanical.corkbark | res.overworld.botanical.10 | Corkbark | Dry woodland | Insulation | Variable |
| leyforge.core.res.organic.botanical.dye_lichen | res.overworld.botanical.11 | Dye Lichen | Rock/forest surface | Pigment | Variable |
| leyforge.core.res.organic.botanical.alchemical_moss | res.overworld.botanical.12 | Alchemical Moss | Mana-rich shade | Medicine/reagent | Variable |
| leyforge.core.res.organic.agriculture.hearthgrain | res.overworld.agriculture.01 | Hearthgrain | Temperate fields | Staple food | Variable |
| leyforge.core.res.organic.agriculture.frostbarley | res.overworld.agriculture.02 | Frostbarley | Cold fields | Cold staple/brewing | Variable |
| leyforge.core.res.organic.agriculture.sunmaize | res.overworld.agriculture.03 | Sunmaize | Warm plains | Staple/feed | Variable |
| leyforge.core.res.organic.agriculture.marsh_rice | res.overworld.agriculture.04 | Marsh Rice | Wetland paddies | Wetland staple | Variable |
| leyforge.core.res.organic.agriculture.stonebean | res.overworld.agriculture.05 | Stonebean | Dry uplands | Protein crop | Variable |
| leyforge.core.res.organic.agriculture.deepcap_mushroom | res.overworld.agriculture.06 | Deepcap Mushroom | Caves/fungal farms | Food/alchemy | Variable |
| leyforge.core.res.organic.agriculture.sweetroot | res.overworld.agriculture.07 | Sweetroot | Loamy fields | Sweetener/starch | Variable |
| leyforge.core.res.organic.agriculture.redleaf_herb | res.overworld.agriculture.08 | Redleaf Herb | Forest margins | Medicine | Variable |
| leyforge.core.res.organic.agriculture.silvermint | res.overworld.agriculture.09 | Silvermint | Cool riverbanks | Food/medicine | Variable |
| leyforge.core.res.organic.agriculture.bitterbloom | res.overworld.agriculture.10 | Bitterbloom | Bogs/highlands | Potent reagent | Variable |
| leyforge.core.res.organic.agriculture.honeycomb | res.overworld.agriculture.11 | Honeycomb | Apiaries/wild hives | Food/wax | Variable |
| leyforge.core.res.organic.agriculture.sea_kelp_meal | res.overworld.agriculture.12 | Sea Kelp Meal | Coasts/kelp farms | Food/fertiliser | Variable |
| leyforge.core.res.mineral.river_clay | res.overworld.mineral.01 | River Clay | Riverbank | Pottery | Variable |
| leyforge.core.res.mineral.white_kaolin | res.overworld.mineral.02 | White Kaolin | Weathered uplands | Fine ceramics | Variable |
| leyforge.core.res.mineral.brick_loam | res.overworld.mineral.03 | Brick Loam | Floodplain | Brick | Variable |
| leyforge.core.res.mineral.peat_soil | res.overworld.mineral.04 | Peat Soil | Bog/fen | Soil/fuel | Variable |
| leyforge.core.res.mineral.silica_sand | res.overworld.mineral.05 | Silica Sand | Coast/desert/river | Glass | Variable |
| leyforge.core.res.mineral.salt_crystal | res.overworld.mineral.06 | Salt Crystal | Evaporite/brine | Food/alchemy | Variable |
| leyforge.core.res.mineral.limestone | res.overworld.mineral.07 | Limestone | Karst | Lime/building | Variable |
| leyforge.core.res.mineral.granite | res.overworld.mineral.08 | Granite | Mountain pluton | Heavy building | Variable |
| leyforge.core.res.mineral.slate | res.overworld.mineral.09 | Slate | Metamorphic highland | Roofing | Variable |
| leyforge.core.res.mineral.basalt | res.overworld.mineral.10 | Basalt | Volcanic province | Roads/forge | Variable |
| leyforge.core.res.mineral.marble | res.overworld.mineral.11 | Marble | Metamorphic quarry | Prestige building | Variable |
| leyforge.core.res.mineral.obsidian | res.overworld.mineral.12 | Obsidian | Volcanic glass field | Tools/magic | Variable |
| leyforge.core.res.metal.ore.copper_ore | res.overworld.ore.01 | Copper Ore | Hydrothermal veins | Mechanisms/conductors | Variable |
| leyforge.core.res.metal.ore.tin_ore | res.overworld.ore.02 | Tin Ore | Granite belts | Bronze alloy | Variable |
| leyforge.core.res.metal.ore.iron_ore | res.overworld.ore.03 | Iron Ore | Sedimentary/metamorphic belts | Tools/steel | Variable |
| leyforge.core.res.metal.ore.lead_ore | res.overworld.ore.04 | Lead Ore | Deep veins | Shielding/chemistry | Variable |
| leyforge.core.res.metal.ore.nickel_ore | res.overworld.ore.05 | Nickel Ore | Mafic geology | Alloys | Variable |
| leyforge.core.res.metal.ore.cobalt_ore | res.overworld.ore.06 | Cobalt Ore | Deep cobalt lodes | Precision/pigment | Variable |
| leyforge.core.res.metal.ore.silver_ore | res.overworld.ore.07 | Silver Ore | Veins/realm influence | Magic/coin | Variable |
| leyforge.core.res.metal.ore.gold_ore | res.overworld.ore.08 | Gold Ore | Veins/placer deposits | Prestige/coin | Variable |
| leyforge.core.res.metal.ore.star_iron_ore | res.overworld.ore.09 | Star Iron Ore | Impact sites | Rare alloy | Variable |
| leyforge.core.res.metal.ore.bog_iron | res.overworld.ore.10 | Bog Iron | Wetlands | Local iron | Variable |
| leyforge.core.res.metal.ore.magnetite | res.overworld.ore.11 | Magnetite | Iron formations | Iron/compass | Variable |
| leyforge.core.res.metal.ore.cinnabar | res.overworld.ore.12 | Cinnabar | Volcanic belts | Alchemy/hazard | Variable |
| leyforge.core.res.crystal.clear_quartz | res.overworld.crystal.01 | Clear Quartz | Quartz veins | Optics/runes | Variable |
| leyforge.core.res.crystal.garnet | res.overworld.crystal.02 | Garnet | Metamorphic rock | Abrasive/jewellery | Variable |
| leyforge.core.res.crystal.sapphire | res.overworld.crystal.03 | Sapphire | Alluvial/metamorphic | Jewellery/magic | Variable |
| leyforge.core.res.crystal.ruby | res.overworld.crystal.04 | Ruby | Metamorphic/igneous | Jewellery/heat magic | Variable |
| leyforge.core.res.crystal.emerald | res.overworld.crystal.05 | Emerald | Hydrothermal | Jewellery/nature magic | Variable |
| leyforge.core.res.crystal.opal | res.overworld.crystal.06 | Opal | Sedimentary/volcanic | Trade/illusion | Variable |
| leyforge.core.res.crystal.diamond | res.overworld.crystal.07 | Diamond | Deep mantle pipes | Cutting/prestige | Variable |
| leyforge.core.res.crystal.raw_mana_crystal | res.overworld.crystal.08 | Raw Mana Crystal | Mana seams | Mana infrastructure | Variable |
| leyforge.core.res.crystal.ley_crystal | res.overworld.crystal.09 | Ley Crystal | Leyline nexuses | Ley devices | Variable |
| leyforge.core.res.crystal.thunder_glass | res.overworld.crystal.10 | Thunder Glass | Storm-struck silica | Storm craft | Variable |
| leyforge.core.res.crystal.frost_pearl | res.overworld.crystal.11 | Frost Pearl | Cold waters/ice caves | Cold craft | Variable |
| leyforge.core.res.crystal.sunstone | res.overworld.crystal.12 | Sunstone | High-sun drylands | Light/heat craft | Variable |
| leyforge.core.res.biological.creature.common_hide | res.overworld.creature.01 | Common Hide | Managed/hunted fauna | Leather | Variable |
| leyforge.core.res.biological.creature.thick_fur | res.overworld.creature.02 | Thick Fur | Cold predators/herds | Insulation | Variable |
| leyforge.core.res.biological.creature.bone | res.overworld.creature.03 | Bone | Carcass/shed remains | Tools/alchemy | Variable |
| leyforge.core.res.biological.creature.horn | res.overworld.creature.04 | Horn | Horned fauna | Tools/ritual | Variable |
| leyforge.core.res.biological.creature.antler | res.overworld.creature.05 | Antler | Seasonal shed | Craft/trade | Variable |
| leyforge.core.res.biological.creature.chitin | res.overworld.creature.06 | Chitin | Arthropods | Armour/components | Variable |
| leyforge.core.res.biological.creature.silk | res.overworld.creature.07 | Silk | Spinners/cocoons | Textile/machines | Variable |
| leyforge.core.res.biological.creature.venom_sac | res.overworld.creature.08 | Venom Sac | Venomous fauna | Alchemy/medicine | Variable |
| leyforge.core.res.biological.creature.ink_gland | res.overworld.creature.09 | Ink Gland | Marine/cave fauna | Ink/alchemy | Variable |
| leyforge.core.res.biological.creature.shell_plate | res.overworld.creature.10 | Shell Plate | Armoured fauna | Armour/building | Variable |
| leyforge.core.res.biological.creature.spirit_essence | res.overworld.creature.11 | Spirit Essence | Spirits/ritual residue | Magic/ritual | Variable |
| leyforge.core.res.biological.creature.elemental_core | res.overworld.creature.12 | Elemental Core | Elemental entities | Power/magitech | Variable |
| leyforge.core.res.strategic.firewood | res.overworld.strategic.01 | Firewood | Managed/wild timber | Household fuel | Variable |
| leyforge.core.res.strategic.charcoal | res.overworld.strategic.02 | Charcoal | Kiln production | Renewable industrial fuel | Variable |
| leyforge.core.res.strategic.coal | res.overworld.strategic.03 | Coal | Coal measures | Industry/steel | Variable |
| leyforge.core.res.strategic.peat_fuel | res.overworld.strategic.04 | Peat Fuel | Bogs | Local fuel/soil | Variable |
| leyforge.core.res.strategic.oil_shale | res.overworld.strategic.05 | Oil Shale | Sedimentary basins | Fuel/chemistry | Variable |
| leyforge.core.res.strategic.lamp_oil_seed | res.overworld.strategic.06 | Lamp-Oil Seed | Oilseed farms | Lighting/oil | Variable |
| leyforge.core.res.strategic.sulphur | res.overworld.strategic.07 | Sulphur | Volcanic/evaporite | Alchemy/explosives | Variable |
| leyforge.core.res.strategic.saltpetre | res.overworld.strategic.08 | Saltpetre | Caves/soils/manure works | Preservation/explosives | Variable |
| leyforge.core.res.strategic.emberstone | res.overworld.strategic.09 | Emberstone | Geothermal zones | Heat storage | Variable |
| leyforge.core.res.strategic.ancient_machine_scrap | res.overworld.strategic.10 | Ancient Machine Scrap | Ruins/machine strata | Salvage/research | Variable |
| leyforge.core.res.strategic.titan_bone | res.overworld.strategic.11 | Titan Bone | Titan remains | Wonder/structure material | Variable |
| leyforge.core.res.strategic.corrupted_shard | res.overworld.strategic.12 | Corrupted Shard | Corrupted zones | Forbidden magic/hazard | Variable |


## Appendix A.1 Intake Rule

`Atlas Band = Variable` means world occurrence/availability is contextual. It does not mean the resource is optional junk or guaranteed everywhere. Worldgen/provider contracts and production scope determine availability in a given seed/profile.

---

# Appendix B. Realm Resource Foundation Intake

These Atlas entries are retained as canonical source foundations. **Presence in this table does not automatically activate a complete production economy.** Current chain maturity and realm authority govern admission. Verdant Covenant is the complete conditional realm chain in the Set 25 baseline; Ancestral Veil remains threshold/teaser-limited there.


| Production Resource ID | Atlas Source Anchor | Realm | Foundation | Atlas Role | Atlas Handling |
| --- | --- | --- | --- | --- | --- |
| leyforge.core.res.realm.verdant_covenant.living_heartwood | res.realm.verdant_covenant.01 | Verdant Covenant | Living Heartwood | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.verdant_covenant.season_sap | res.realm.verdant_covenant.02 | Verdant Covenant | Season Sap | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.verdant_covenant.thornsilver_fibre | res.realm.verdant_covenant.03 | Verdant Covenant | Thornsilver Fibre | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.verdant_covenant.pollen_amber | res.realm.verdant_covenant.04 | Verdant Covenant | Pollen Amber | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.verdant_covenant.memory_seed | res.realm.verdant_covenant.05 | Verdant Covenant | Memory Seed | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.verdant_covenant.bloomstone | res.realm.verdant_covenant.06 | Verdant Covenant | Bloomstone | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.ancestral_veil.ancestor_ash | res.realm.ancestral_veil.01 | Ancestral Veil | Ancestor Ash | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.ancestral_veil.memory_glass | res.realm.ancestral_veil.02 | Ancestral Veil | Memory Glass | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.ancestral_veil.oathbone | res.realm.ancestral_veil.03 | Ancestral Veil | Oathbone | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.ancestral_veil.veil_silk | res.realm.ancestral_veil.04 | Ancestral Veil | Veil Silk | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.ancestral_veil.grave_salt | res.realm.ancestral_veil.05 | Ancestral Veil | Grave Salt | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.ancestral_veil.echo_pearl | res.realm.ancestral_veil.06 | Ancestral Veil | Echo Pearl | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.somnolent_expanse.dream_mote | res.realm.somnolent_expanse.01 | Somnolent Expanse | Dream Mote | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.somnolent_expanse.nightmare_resin | res.realm.somnolent_expanse.02 | Somnolent Expanse | Nightmare Resin | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.somnolent_expanse.lucid_glass | res.realm.somnolent_expanse.03 | Somnolent Expanse | Lucid Glass | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.somnolent_expanse.sleepbloom | res.realm.somnolent_expanse.04 | Somnolent Expanse | Sleepbloom | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.somnolent_expanse.memory_thread | res.realm.somnolent_expanse.05 | Somnolent Expanse | Memory Thread | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.somnolent_expanse.prophecy_ink | res.realm.somnolent_expanse.06 | Somnolent Expanse | Prophecy Ink | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.aetheric_reach.stormglass | res.realm.aetheric_reach.01 | Aetheric Reach | Stormglass | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.aetheric_reach.cloudstone | res.realm.aetheric_reach.02 | Aetheric Reach | Cloudstone | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.aetheric_reach.skyiron | res.realm.aetheric_reach.03 | Aetheric Reach | Skyiron | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.aetheric_reach.windspun_fibre | res.realm.aetheric_reach.04 | Aetheric Reach | Windspun Fibre | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.aetheric_reach.lightning_core | res.realm.aetheric_reach.05 | Aetheric Reach | Lightning Core | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.aetheric_reach.sunmist | res.realm.aetheric_reach.06 | Aetheric Reach | Sunmist | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.impossible_deep.pressure_pearl | res.realm.impossible_deep.01 | Impossible Deep | Pressure Pearl | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.impossible_deep.abyssal_iron | res.realm.impossible_deep.02 | Impossible Deep | Abyssal Iron | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.impossible_deep.seismic_crystal | res.realm.impossible_deep.03 | Impossible Deep | Seismic Crystal | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.impossible_deep.black_brine_salt | res.realm.impossible_deep.04 | Impossible Deep | Black Brine Salt | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.impossible_deep.ventglass | res.realm.impossible_deep.05 | Impossible Deep | Ventglass | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.impossible_deep.deepfire_ember | res.realm.impossible_deep.06 | Impossible Deep | Deepfire Ember | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.world_engine.logic_brass | res.realm.world_engine.01 | World-Engine | Logic Brass | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.world_engine.archive_crystal | res.realm.world_engine.02 | World-Engine | Archive Crystal | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.world_engine.coolant_gel | res.realm.world_engine.03 | World-Engine | Coolant Gel | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.world_engine.gearwood | res.realm.world_engine.04 | World-Engine | Gearwood | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.world_engine.prime_alloy | res.realm.world_engine.05 | World-Engine | Prime Alloy | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.world_engine.machine_seed | res.realm.world_engine.06 | World-Engine | Machine Seed | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.ashen_lower_realms.infernal_ash | res.realm.ashen_lower_realms.01 | Ashen Lower Realms | Infernal Ash | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.ashen_lower_realms.contract_iron | res.realm.ashen_lower_realms.02 | Ashen Lower Realms | Contract Iron | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.ashen_lower_realms.ember_salt | res.realm.ashen_lower_realms.03 | Ashen Lower Realms | Ember Salt | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.ashen_lower_realms.cinderhide | res.realm.ashen_lower_realms.04 | Ashen Lower Realms | Cinderhide | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.ashen_lower_realms.hellglass | res.realm.ashen_lower_realms.05 | Ashen Lower Realms | Hellglass | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.ashen_lower_realms.furnace_heart | res.realm.ashen_lower_realms.06 | Ashen Lower Realms | Furnace Heart | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.void_between.voidstone | res.realm.void_between.01 | Void Between | Voidstone | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.void_between.null_dust | res.realm.void_between.02 | Void Between | Null Dust | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.void_between.riftglass | res.realm.void_between.03 | Void Between | Riftglass | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.void_between.gravity_thread | res.realm.void_between.04 | Void Between | Gravity Thread | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.void_between.echo_shard | res.realm.void_between.05 | Void Between | Echo Shard | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.void_between.starless_oil | res.realm.void_between.06 | Void Between | Starless Oil | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.divine_concords.celestial_metal | res.realm.divine_concords.01 | Divine Concords | Celestial Metal | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.divine_concords.halo_glass | res.realm.divine_concords.02 | Divine Concords | Halo Glass | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.divine_concords.blessing_salt | res.realm.divine_concords.03 | Divine Concords | Blessing Salt | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.divine_concords.hymnstone | res.realm.divine_concords.04 | Divine Concords | Hymnstone | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.divine_concords.grace_thread | res.realm.divine_concords.05 | Divine Concords | Grace Thread | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.divine_concords.covenant_wax | res.realm.divine_concords.06 | Divine Concords | Covenant Wax | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.necropolis_domains.soulbone | res.realm.necropolis_domains.01 | Necropolis Domains | Soulbone | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.necropolis_domains.grave_iron | res.realm.necropolis_domains.02 | Necropolis Domains | Grave Iron | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.necropolis_domains.embalmer_resin | res.realm.necropolis_domains.03 | Necropolis Domains | Embalmer Resin | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.necropolis_domains.mourning_silk | res.realm.necropolis_domains.04 | Necropolis Domains | Mourning Silk | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.necropolis_domains.necrotic_salt | res.realm.necropolis_domains.05 | Necropolis Domains | Necrotic Salt | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.necropolis_domains.deathglass | res.realm.necropolis_domains.06 | Necropolis Domains | Deathglass | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.elemental_confluences.pyrestone | res.realm.elemental_confluences.01 | Elemental Confluences | Pyrestone | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.elemental_confluences.tideshard | res.realm.elemental_confluences.02 | Elemental Confluences | Tideshard | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.elemental_confluences.gale_crystal | res.realm.elemental_confluences.03 | Elemental Confluences | Gale Crystal | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.elemental_confluences.earthblood_ore | res.realm.elemental_confluences.04 | Elemental Confluences | Earthblood Ore | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.elemental_confluences.frostglass | res.realm.elemental_confluences.05 | Elemental Confluences | Frostglass | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.elemental_confluences.stormsap | res.realm.elemental_confluences.06 | Elemental Confluences | Stormsap | Stabilisation / realm compatibility | Native; stabilisation varies |
| leyforge.core.res.realm.created_pockets.pocket_anchor | res.realm.created_pockets.01 | Created Pockets | Pocket Anchor | Structural / construction | Native; stabilisation varies |
| leyforge.core.res.realm.created_pockets.boundary_chalk | res.realm.created_pockets.02 | Created Pockets | Boundary Chalk | Energy / catalyst | Native; stabilisation varies |
| leyforge.core.res.realm.created_pockets.folded_glass | res.realm.created_pockets.03 | Created Pockets | Folded Glass | Fibre / flexible material | Native; stabilisation varies |
| leyforge.core.res.realm.created_pockets.time_sand | res.realm.created_pockets.04 | Created Pockets | Time Sand | Optical / inscription | Native; stabilisation varies |
| leyforge.core.res.realm.created_pockets.stable_core | res.realm.created_pockets.05 | Created Pockets | Stable Core | Biological / growth or memory | Native; stabilisation varies |
| leyforge.core.res.realm.created_pockets.pattern_clay | res.realm.created_pockets.06 | Created Pockets | Pattern Clay | Stabilisation / realm compatibility | Native; stabilisation varies |


---

# Appendix C. 105 Production Chain Contracts

Document 25J defines these planning chain identities as the production coverage baseline for Documents 05–06. Document 06 maps each chain to resource/provider/capability relationships; Document 05 supplies exact recipes where the transformation belongs to it.


| Chain Code | Name | Status | Primary Owner |
| --- | --- | --- | --- |
| RC-REC-01 | Quantity Reconciliation and Quarantine | Core Required | 25D-25E / Runtime |
| RC-REC-02 | Definition Supersession Migration | Core Required | 25B-25D |
| RC-REC-03 | Optional-Pack Removal Preservation | Core Required | 25D / Set 26 Admission |
| RC-REC-04 | Interrupted Production Rollback | Core Required | Document 18 / 25E |
| RC-SUR-01 | Local Forage to Immediate Food | Core Required | Seed Start / Ecology |
| RC-SUR-02 | Firewood and Emergency Heat | Core Required | Survival / Frontier |
| RC-SUR-03 | Primitive Cutting Tool | Core Required | Primitive Tools |
| RC-SUR-04 | Primitive Mining Tool | Core Required | Primitive Tools |
| RC-SUR-05 | Immediate Shelter Materials | Core Required | Seed Start / Building |
| RC-SUR-06 | Simple Storage and Carrying | Core Required | Inventory / Storage |
| RC-SUR-07 | Clean-Water Access and Container | Core Required | Survival / Health |
| RC-SUR-08 | Field Repair and Salvage | Core Required | Repair / Player Trust |
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
| RC-MIN-01 | Common Stone to Rubble and Cut Stone | Core Required | Geology / Building |
| RC-MIN-02 | Limestone to Lime and Mortar | Core Required | Karst / Construction |
| RC-MIN-03 | Clay to Brick and Ceramic | Core Required | Clayworks / Settlement |
| RC-MIN-04 | Sand to Glass | Core Required | Industry / Magic |
| RC-MIN-05 | Aggregate to Road and Drainage Fill | Core Required | Routes / Infrastructure |
| RC-MIN-06 | Salt and Mineral Preservative | Core Required | Food / Health / Trade |
| RC-MIN-07 | Peat and Wetland Fuel | Core Required | Wetland / Moorland |
| RC-MIN-08 | Prospecting Sample and Grade Analysis | Core Required | Exploration / Extraction |
| RC-MIN-09 | Deepstone and Specialist Masonry | Core Conditional | Underground / Adventure |
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
| RC-AUT-01 | Basic Mechanical Power Interface | Core Required | Automation / Power |
| RC-AUT-02 | Chute and Gravity Logistics | Core Required | Automation / Logistics |
| RC-AUT-03 | Cart, Wheel and Bounded Track | Core Required | Routes / Industry |
| RC-AUT-04 | Machine Frame and Processing Assembly | Core Required | Automation / Industry |
| RC-AUT-05 | Filter, Sorter and Routing Control | Core Required | Automation / Storage |
| RC-AUT-06 | Machine Maintenance and Wear Recovery | Core Required | Automation / Settlement |
| RC-AUT-07 | Portable Fuel and Mana Supply | Core Required | Power / Magic |
| RC-AUT-08 | Automation-to-Settlement Supply Contract | Core Required | Automation / Civilisation |
| RC-CRE-01 | Meat, Fat and Food Recovery | Core Required | Creature / Food |
| RC-CRE-02 | Hide, Fur and Fibre Recovery | Core Required | Creature / Textile |
| RC-CRE-03 | Bone, Horn, Chitin and Shell Processing | Core Required | Creature / Craft |
| RC-CRE-04 | Venom, Toxin and Antidote Research | Core Conditional | Creature / Health / Magic |
| RC-CRE-05 | Silk and Web Fibre | Core Required | Cave Ecology / Automation |
| RC-CRE-06 | Essence and Magical Sample | Core Required | Magic Ecology |
| RC-CRE-07 | Construct Component Salvage | Core Required | Construct Ecology / Adventure |
| RC-MAG-01 | Mana Source Discovery and Harvest | Core Required | Magic / CAP-05 |
| RC-MAG-02 | Mana Crystal to Shard and Dust | Core Required | Magic / Processing |
| RC-MAG-03 | Rune Substrate Preparation | Core Required | Magic / Craft |
| RC-MAG-04 | Basic Rune Inscription | Core Required | Magic / Automation |
| RC-MAG-05 | Mana Charge and Storage | Core Required | Magic / Power |
| RC-MAG-06 | Ward Component and Maintenance | Core Required | Magic / Settlement |
| RC-MAG-07 | Cleansing Reagent and Restoration | Core Required | Magic / Aftermath |
| RC-MAG-08 | Mana-Mechanical Coupler | Core Required | Magic / Automation |
| RC-MAG-09 | Realm Route Stabilisation Supply | Core Conditional | Realm Access / 14 |
| RC-SET-01 | Construction Supply Bundle | Core Required | Settlement Projects |
| RC-SET-02 | Guard and Defence Supply | Core Required | Settlement / Defence |
| RC-SET-03 | Health and Infirmary Supply | Core Required | Settlement / Health |
| RC-SET-04 | Food Reserve and Granary Stock | Core Required | Settlement / Provisions |
| RC-SET-05 | Culture Signature Good Production | Core Required | Six Core Cultures |
| RC-SET-06 | Trade Cargo and Shipment Manifest | Core Required | Trade / Routes |
| RC-SET-07 | Tax, Tribute, Donation and Contract Transfer | Core Required | Economy / Factions |
| RC-SET-08 | Repair, Restoration and Public Works | Core Required | Structures / Events |
| RC-ADV-01 | Site Salvage and Evidence Recovery | Core Required | Adventure Sites |
| RC-ADV-02 | Contextual Container Resolution | Core Required | Loot / Structures |
| RC-ADV-03 | Boss Proof and Reward Package | Core Required | Bosses / Events |
| RC-ADV-04 | Relic Fragment Restoration | Core Conditional | Relics / Culture |
| RC-ADV-05 | Map, Key and Access Knowledge | Core Required | Knowledge / Exploration |
| RC-ADV-06 | Dungeon Maintenance and Consumables | Core Required | Adventure / Survival |
| RC-ADV-07 | Event Aftermath Recovery | Core Required | Events / Law |
| RC-ADV-08 | Unique Object Loss and Recovery | Core Required | Relics / Save Integrity |
| RC-VRD-01 | Living Heartwood Harvest and Consent | Core Conditional | Verdant Covenant |
| RC-VRD-02 | Season Sap Collection | Core Conditional | Verdant Covenant |
| RC-VRD-03 | Thornsilver Fibre Processing | Core Conditional | Verdant Covenant |
| RC-VRD-04 | Pollen Amber Stabilisation | Core Conditional | Verdant Covenant |
| RC-VRD-05 | Memory Seed Cultivation | Core Conditional | Verdant Covenant |
| RC-VRD-06 | Bloomstone Extraction and Cleansing | Core Conditional | Verdant Covenant |
| RC-VRD-07 | Living Construction Commission | Core Conditional | Verdant Covenant |
| RC-VRD-08 | Verdant Resolution Reward and Overworld Use | Core Conditional | Verdant Covenant / Bosses |
| RC-VEI-01 | Ancestral Threshold Stabilisation | Teaser Only | Ancestral Veil |
| RC-VEI-02 | Threshold Evidence and Memory Record | Teaser Only | Ancestral Veil |

**Chain count:** 105 total — Core Conditional: 13, Core Required: 90, Teaser Only: 2.



---

# Appendix D. Typed Substitution Groups

These groups are canonical compatibility queries, not recipe shortcuts. Every actual substitution still passes the consumer's physical, hazard, knowledge, culture and state constraints.


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


---

# Appendix E. Provenance and Custody Profiles


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


---

# Appendix F. Canonical Resource Definition Template

```yaml
id: leyforge.core.res.<identity_path>
source_anchor_ids:
  - <atlas_or_legacy_id>
display_name_key: leyforge.core.loc.res.<identity_path>.name
lifecycle_status: <core_required|core_conditional|teaser_only|...>
resource_facet:
  family_tags: []
  material_roles: []
  provider_classes: []
  source_suitability_query: <qualified_query_or_null>
  acquisition_capabilities_required: []
  capabilities_offered: []
  renewability_profile: <qualified_profile>
  grade_profile: <qualified_profile_or_null>
  purity_profile: <qualified_profile_or_null>
  hazard_tags: []
  block_form_refs: []
  item_form_refs: []
  recipe_chain_refs: []
  consumer_capability_refs: []
  substitution_groups: []
  provenance_profile: <qualified_profile>
  realm_stabilisation_profile: <qualified_profile_or_null>
  fallback_policy: <qualified_policy>
extension_facets: {}
```

## F.1 Example — Copper Ore Resource

```yaml
id: leyforge.core.res.metal.ore.copper_ore
source_anchor_ids:
  - res.overworld.ore.01
resource_facet:
  family_tags: [ore, metal, geological, strategic]
  material_roles: [copper_source, conductive_material_input, mechanism_material_input]
  provider_classes: [finite_geological_source, large_deposit_node, trade_import, salvage]
  capabilities_offered: [CAP-03]
  renewability_profile: finite_geological
  grade_profile: ore_grade
  recipe_chain_refs: [RC-MET-01, RC-MET-02, RC-MET-03, RC-MET-04, RC-MET-05]
  substitution_groups: [SUB-09, SUB-11]
  provenance_profile: PROV-01
```

The example does not define Block hardness, carried stack size, smelting yield or current price; those remain with their canonical owners.

---

# Appendix G. Legacy Resource Migration Guidance

| Legacy Pattern | v1.0 Migration |
| --- | --- |
| `resource.*`, `material.*`, Atlas `res.*` short ID used as persistent identity | Resolve through versioned alias to a qualified `leyforge.core.res.*` ID or quarantine if ambiguous. |
| POC planning status stored on resource object | Remove from shipped resource facet; retain in archive/provenance/production tooling. |
| One numeric material tier controls all systems | Convert to capability/material-role queries plus specialist-system facets. |
| Guaranteed fixed mana pocket | Remove from production generation; preserve mana-provider capability and seed reachability. |
| Fixed watchtower resource chain | Archive scenario wrapper; preserve structural/project supply chains. |
| Resource record contains current market price | Migrate current market state to Set 27/economy runtime authority. |
| Resource record contains hunger/health effect | Migrate biological outcome to Set 29; preserve consumable material facts. |
| Resource record duplicates Block or Item identity | Keep Resource as progression/material family; reference canonical Block/Item forms rather than creating another physical identity. |
| Optional expansion resource removed | Preserve unresolved qualified identity/state according to 25D optional-pack policy; never silently convert into generic stock. |

---

# Final Production Lock

Document 06 v1.0 is the production authority for **resource progression and capability pathways**, not a list of stronger ores. It makes resources part of Leyforge's living world: generated through ecology and geology, shaped by cultures and settlements, transformed by real recipes, transported as physical stock, consumed by civilisation, altered by extraction, remembered through provenance and kept playable across different seeds through typed provider diversity.

The old POC demonstrated that physical resource chains could connect gathering, automation, villages, magic and defence. Production Leyforge keeps that capability and removes the fixed scenario around it.

**End of Document 06 — Canonical Resource Progression, Material Ecology and Capability Pathway System v1.0**
