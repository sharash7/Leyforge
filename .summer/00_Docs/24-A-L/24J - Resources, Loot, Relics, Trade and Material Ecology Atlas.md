---
title: 24J — Resources, Loot, Relics, Trade and Material Ecology Atlas
document_set: 24
document: 24J
aliases:
- 24J
- Document 24J
project: Leyforge
version: '0.1'
status: Draft
format: Obsidian Markdown
engine: Godot / Summer Engine
source_format: DOCX
tags:
- leyforge
- world-content-atlas
- document-set-24
- 24j
---

# 24J — Resources, Loot, Relics, Trade and Material Ecology Atlas

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24J - World Content Atlas: Resources, Loot, Relics, Trade and Material Ecology Atlas**

Version 0.1 - Post-POC Production Content Draft

*A database-ready Atlas for resource ecology, extraction, refinement, loot grammars, relic provenance, trade networks, strategic scarcity, dynamic markets, and persistent material consequences across the Overworld and every major realm.*

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Resource and Reward Atlas Statement<br />
</strong>Resources are not scattered ingredients and loot is not a random reward fountain. Every material, treasure, relic, trade good, and strategic asset has an origin, ecology, owner, transformation path, social value, extraction consequence, and persistent place in the world. The final game contains no hardcoded Forest Hamlet resource chain, fixed watchtower delivery, guaranteed mana pocket, scripted goblin drop table, or POC-only treasure placement.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Field**                | **Locked Direction**                                                                                                                                                                                                                              |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Scope**       | Full post-POC production Atlas for natural, organic, creature, industrial, magical, cultural, forbidden, and realm resources; loot; relics; trade goods; markets; scarcity; ownership; extraction; refinement; storage; and material world state. |
| **Core Philosophy**      | A resource or reward exists because the world produces, stores, protects, values, transforms, loses, remembers, or fights over it - never merely because a list or chest needed filler.                                                           |
| **World Direction**      | All distributions, deposits, caches, hoards, relic sites, market networks, and shortages are deterministic products of the seed, generated history, biome, geology, ecology, civilisation, faction, structure, dungeon, boss, and realm state.    |
| **Reward Direction**     | Use contextual reward grammars, provenance, condition, knowledge, ownership, and outcome-dependent rewards. Avoid detached rarity ladders, generic chest inflation, and boss drops with no world use.                                             |
| **Trade Direction**      | Markets move physical goods through routes, warehouses, contracts, caravans, ports, gates, and faction permissions. Supply, demand, danger, law, culture, and infrastructure determine value.                                                     |
| **Production Direction** | Provides foundational registries for 84 Overworld resources, 72 realm resources, 60 loot/reward families, 36 relic foundations, 48 trade-good families, 24 reusable modules, and 18 dynamic states.                                               |
| **Technical Direction**  | Data-driven resources and runtime records aligned with Godot and Summer Engine. Stable IDs, deterministic selection, quantity conservation, provenance, ownership, simulation LOD, validation, and save migration are mandatory.                  |

# Document Purpose

This document is the resource, reward, relic, trade, and material-ecology volume of Document Set 24, the World Content Atlas. It converts the locations, peoples, creatures, dungeons, bosses, structures, and realms defined by Documents 24A-24I into material relationships that can be generated, simulated, traded, consumed, restored, stolen, exhausted, renewed, and remembered.

The Atlas owns the authored definitions and relationship rules that determine where a material may exist, how it is recognised, who can gather it, what it becomes, which societies value it, how it enters loot and trade, and what consequences follow extraction or loss. It does not replace the Blocks, Items, Recipes, Progression, NPC, Automation, Magic, Creature, Biome, Structure, Dimension, Quest, Combat, or technical documents; it provides the cross-content material layer those systems reference.

This volume formally supersedes all POC-only resource and reward arrangements. Reusable mechanics such as ore grades, mana purity, exact resource consumption, contextual loot, warehouse permissions, and boss materials remain valid. Any named POC deposit, fixed resource route, scripted delivery, guaranteed chest, or demonstration-only economy is archived rather than selected by normal world generation.

# Design Source and Supersession Rules

| **Source**                           | **Authority Used by 24J**                                                                                                                                                                                                   |
|--------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00 Master Game Design Bible**      | Resources must support survival, villages, automation, magic, exploration, story, trade, defence, and world change rather than exist as isolated upgrade ingredients.                                                       |
| **01 Core Gameplay Loop**            | Material flows support explore, gather, craft, build, interact, automate, defend, upgrade, and expand without imposing a single fixed order.                                                                                |
| **03 Blocks Registry**               | Defines mineable blocks, nodes, fluids, storage, hazards, realm blocks, states, and physical material presentation.                                                                                                         |
| **04 Items Registry**                | Defines inventory forms, stack and instance state, rarity, quality, durability, monster drops, trade goods, lore objects, keys, trophies, and relic item behaviour.                                                         |
| **05 Crafting and Recipe Registry**  | Defines transformation, stations, time, power, by-products, substitutions, failure, project recipes, rituals, culture recipes, and dimension recipes.                                                                       |
| **06 Resource Progression**          | Provides the hybrid material ladder, persistent uses for old materials, veins, deposits, purity, fuel, monster, cultural, forbidden, and realm resource families.                                                           |
| **07-09 NPC, Automation, and Magic** | Own consumption, warehouses, permissions, logistics, power, mana, runes, risk, village supply, and infrastructure demand.                                                                                                   |
| **10-17 Content Systems**            | Own creature anatomy and harvesting, biome placement, structures, cultures, realms, quests/events, combat rewards, and player-facing knowledge.                                                                             |
| **18 Technical Plan**                | Stable IDs, registries, deterministic generation, conservation, saves, simulation LOD, and validation remain relevant. Unreal-specific implementation direction is superseded by the current Godot/Summer Engine direction. |
| **24A-24I World Content Atlas**      | Own world topology, biomes, realms, peoples, ecology, dungeons, bosses, structures, routes, wonders, and the contextual slots that 24J fills with materials and rewards.                                                    |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Supersession Rule<br />
</strong>When an older document names a POC-required material, deposit, chest, delivery, boss drop, village good, or fixed economy, retain only the reusable family or mechanic. Production worlds select authored definitions through seed-derived suitability and content relationships; no POC name, coordinate, sequence, or guaranteed arrangement survives as default content.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Static Table of Contents

1\. Locked Resource, Loot, Relic, Trade and Material Ecology Identity

2\. Post-POC Production Decisions

3\. Authority and Cross-Document Ownership

4\. Resource, Material, Reward, Relic and Trade Taxonomy

5\. Material Ecology and World Relationship Model

6\. Provenance, Ownership, Legitimacy and Cultural Interpretation

7\. Deterministic Distribution, Suitability, Density, Rarity and Exclusion

8\. Resource Nodes, Deposits, Stocks, Caches and Reservations

9\. Grade, Purity, Quality, Condition and Instance Variation

10\. Renewability, Regeneration, Depletion and Ecological Carrying Capacity

11\. Prospecting, Discovery, Surveying and Knowledge

12\. Gathering, Harvesting, Extraction, Labour and Permissions

13\. Processing, Refinement, By-products, Waste and Recovery

14\. Material Tags, Substitution, Compatibility and Recipe Contracts

15\. Organic, Agricultural, Botanical and Marine Resources

16\. Stone, Soil, Clay, Salt, Glass and Construction Minerals

17\. Ores, Metals, Gems, Crystals and Strategic Deposits

18\. Fuels, Power Materials, Mana and Energy Carriers

19\. Creature Resources, Anatomy, Welfare and Ethical Harvesting

20\. Magical, Corrupted, Forbidden and Hazardous Resources

21\. Realm Resources, Stabilisation and Cross-Realm Use

22\. Cultural Goods, Luxuries, Art, Food, Textiles and Identity

23\. Industrial Components, Maintenance Goods and Infrastructure Supply

24\. Loot Taxonomy, Reward Layers and Contextual Value

25\. Loot Grammars, Slot Selection, Duplication Control and Pity/Fallback Rules

26\. Containers, Caches, Hoards, Remains and Evidence

27\. Dungeon, Boss, Siege, Event and Exploration Rewards

28\. Relics, Artifacts, Wonders, Keys and Unique Objects

29\. Relic Provenance, Restoration, Interpretation, Custody and Display

30\. Maps, Records, Knowledge, Recipes and Non-Material Rewards

31\. Trade Networks, Supply, Demand, Routes and Regional Price Formation

32\. Markets, Merchants, Caravans, Warehouses, Contracts and Logistics

33\. Currency, Barter, Credit, Taxes, Tithes, Tribute and Public Finance

34\. Strategic Resources, Monopolies, Embargoes, Smuggling and Conflict

35\. Cultural and Settlement Economic Profiles

36\. Dynamic Scarcity, Booms, Crashes, Disasters and World Events

37\. Ownership, Theft, Salvage, Claims, Restitution and Law

38\. Storage, Preservation, Spoilage, Insurance, Loss and Recovery

39\. UI, Accessibility, Inventory Trust, Codex and Player Feedback

40\. Overworld Resource and Material Registry v0.1

41\. Realm Resource Registry v0.1

42\. Loot, Treasure and Reward Registry v0.1

43\. Relic and Artifact Registry v0.1

44\. Trade and Cultural Goods Registry v0.1

45\. Material Ecology, Processing, Loot and State Module Libraries

46\. Visual, Audio, VFX, Forge and Presentation Requirements

47\. Simulation LOD, Persistence, Multiplayer and Godot/Summer Engine Direction

48\. Data Models, Stable IDs, Validation and Content-Pack Rules

49\. Completeness Contracts, Content Budgets and Production Gates

50\. Balancing, Ethics, Anti-Exploitation and Quality Rules

51\. Cross-Document Revision and Registry Migration Plan

52\. Open Questions for Later Production

Appendix A. Registry Field Templates

Appendix B. Cross-System Relationship Matrix

Appendix C. Content Validation and Seed-Test Checklist

Appendix D. Example Regional Material-Ecology Assembly

Appendix E. Example Loot and Relic Resolution

Appendix F. Production Acceptance Criteria

# 1. Locked Resource, Loot, Relic, Trade and Material Ecology Identity

This Atlas is the material circulation layer of the living world. It describes how terrain, organisms, civilisations, dungeons, bosses, structures, realms, and history become physical resources, meaningful rewards, contested property, cultural goods, strategic assets, and persistent evidence.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Locked Rule<br />
</strong>Every meaningful resource, material, reward, relic, or trade good must answer where it comes from, what maintains it, who values or controls it, what it becomes, what consumes it, what extraction changes, what history it preserves, what conflict it causes, or what capability it unlocks.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**         | **Design Meaning**                                                                                                     | **Player-Facing Result**                                                                  |
|----------------------------|------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| **Material Ecology**       | Resources belong to geological, biological, magical, industrial, cultural, or historical systems.                      | The player learns where materials come from and how gathering changes the world.          |
| **Transformation Web**     | Raw materials move through preparation, refinement, fabrication, consumption, repair, recycling, and waste.            | Production chains feel physical, readable, and useful at personal and civilisation scale. |
| **Contextual Reward**      | Loot derives from the defeated entity, site, owner, event, history, and player outcome.                                | Rewards reinforce the encounter instead of feeling like unrelated random rolls.           |
| **Provenance and Memory**  | Relics, treasure, tools, and goods can record maker, owner, origin, age, restoration, theft, and major events.         | Objects carry stories, claims, legal risk, museum value, and personal attachment.         |
| **Living Economy**         | Physical supply moves through settlement demand, routes, markets, contracts, taxation, scarcity, and danger.           | Trade responds to the world and gives infrastructure, diplomacy, and logistics purpose.   |
| **Strategic Conflict**     | Rare deposits, routes, relics, fuels, and realm materials create monopolies, treaties, raids, wars, and moral choices. | Resources shape politics and story rather than only equipment power.                      |
| **Persistent Consequence** | Extraction, contamination, overhunting, restoration, hoarding, embargo, and loss alter stocks and regional state.      | The world remembers player and faction material decisions.                                |

## 1.1 What This Atlas Is Not

- A catalogue of arbitrary ingredients created only to inflate recipe counts.

- A rarity-colour treadmill where higher colour automatically means stronger or more useful.

- A generic chest system that ignores the site, owner, history, condition, and player outcome.

- A boss-drop table whose rewards have no ecological, cultural, crafting, political, or infrastructure purpose.

- An infinite merchant inventory disconnected from routes, stock, danger, production, and settlement demand.

- A rule that associates one ancestry with one resource, trade good, profession, or economic behaviour.

- A punishment simulator where every extraction creates unavoidable collapse; consequences must be readable, proportional, and configurable.

# 2. Post-POC Production Decisions

| **Area**                  | **Locked Production Decision**                                                                                                                                                                                 |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **POC Retirement**        | Remove fixed Forest Hamlet deposits, the iron-watchtower delivery chain, guaranteed mana-crystal pocket, scripted goblin drops, demonstration chests, and static POC merchant stock from production selection. |
| **Registry Status**       | POC Required becomes archival planning metadata only. Production entries use Concept, Draft, Validated, Asset Ready, Integrated, Balanced, and Released status.                                                |
| **Distribution**          | Resources are selected by seed-derived geology, climate, biome, ecology, civilisation, history, magic, structure, dungeon, boss, route, and world-state suitability.                                           |
| **Quantity Conservation** | Items do not appear or disappear silently. Gathering, crafting, trade, loot, consumption, destruction, decay, abstraction, and migration use auditable transactions.                                           |
| **Reward Context**        | Use contextual slots and authored family grammars. Randomness chooses among valid relationships rather than across the whole registry.                                                                         |
| **Relics**                | Unique and historically significant objects use provenance, claims, restoration, knowledge, and world-state records; they are not merely high-stat equipment.                                                  |
| **Economy**               | Settlement stocks, production, imports, exports, storage, routes, law, danger, and preference inform supply and demand. Distant simulation may aggregate quantities without inventing goods.                   |
| **Old Materials**         | Earlier resources retain construction, repair, culture, trade, component, maintenance, substitution, and settlement uses throughout the game.                                                                  |
| **Realm Materials**       | Every realm resource requires native context, safe handling, stabilisation or compatibility where appropriate, and lasting Overworld use.                                                                      |
| **Player Freedom**        | Gather, buy, trade, salvage, steal, negotiate, farm, automate, restore, recycle, research, or obtain substitute materials where the world logically supports alternatives.                                     |

# 3. Authority and Cross-Document Ownership

| **Concern**                    | **24J Owns**                                                                                                                                 | **Referenced Authority**                                                 |
|--------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| **Identity and Relationships** | Resource/reward/relic/trade-good definitions, ecological and economic links, selection rules, provenance fields, and completeness contracts. | 24A world topology and relationship graph.                               |
| **World Placement**            | Suitability tags and constraints; not terrain generation algorithms or coordinates.                                                          | 24B-24D biomes, geology, realms, routes, and dynamic states.             |
| **Civilisation Demand**        | Cultural preference, trade use, strategic value, and market profiles; not full NPC scheduling or government simulation.                      | 24E peoples, factions, settlements, laws, and economies.                 |
| **Creature Materials**         | Harvestable families, ethical/legal tags, and processing links; not anatomy, population, or AI.                                              | 24F creature ecology and personhood rules.                               |
| **Site and Encounter Rewards** | Reward grammars and content families; not room layouts, boss mechanics, or event logic.                                                      | 24G dungeons, 24H bosses, 24I structures, 15 quests/events.              |
| **Inventory and Recipes**      | Atlas definitions reference item and recipe IDs but do not replace stack, equipment, recipe, station, or transaction rules.                  | 03-06 registries and progression.                                        |
| **Economy and Logistics**      | Goods, demand, scarcity, and trade relationships; implementation uses NPC, automation, route, and settlement systems.                        | 07-08 and 24E/24I.                                                       |
| **Technical Records**          | Field contracts and validation expectations; engine implementation remains in technical documents.                                           | Current Godot/Summer Engine architecture and future revised Document 18. |

# 4. Resource, Material, Reward, Relic and Trade Taxonomy

| **Class**             | **Definition**                                                                                                       | **Examples / Distinction**                            |
|-----------------------|----------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
| **Natural Resource**  | Material produced by geology, climate, water, or non-sapient natural processes.                                      | Stone, clay, salt, ore, sand, geothermal brine.       |
| **Organic Resource**  | Renewable or semi-renewable material produced by plants, fungi, agriculture, or marine ecosystems.                   | Timber, fibre, grain, herbs, resin, kelp.             |
| **Creature Resource** | Material derived from shed, gathered, hunted, raised, salvaged, or voluntarily provided creature anatomy or essence. | Hide, silk, venom, shell, spirit essence.             |
| **Refined Material**  | A standardised output created by processing one or more resources.                                                   | Ingot, plate, glass, cloth, charcoal, rune substrate. |
| **Component**         | A fabricated intermediate used by tools, machines, structures, magic, or repairs.                                    | Gear, filter, mana battery, ward kit.                 |
| **Trade Good**        | A packaged good whose principal role is settlement consumption, export, preference, diplomacy, or market value.      | Pottery, spices, textiles, tools, ritual candles.     |
| **Loot**              | A contextual transfer or discovery of items, resources, knowledge, currency, claims, or evidence.                    | Recovered stores, enemy equipment, archive cache.     |
| **Treasure**          | Valuable hoarded, hidden, ceremonially stored, or historically accumulated goods.                                    | Coin, gems, art, offerings, rare stock.               |
| **Relic**             | An object with historical, cultural, legal, magical, or personal significance and persistent provenance.             | Treaty stone, broken crown, ancestral mask.           |
| **Artifact**          | A powerful, unique, or world-altering crafted object, often requiring special custody or restoration.                | Ley Compass, Void Anchor, Realm Guardian Sigil.       |
| **Strategic Asset**   | A resource, deposit, route, stockpile, license, or object whose control affects regional power.                      | Coal basin, mana spring, gate key, military stores.   |
| **Knowledge Reward**  | A non-material or document-mediated capability, truth, claim, recipe, language, map, or calibration.                 | Research notes, charter, recipe folio, portal data.   |

# 5. Material Ecology and World Relationship Model

Material ecology is the complete life of a resource from origin to aftermath. Each entry stores enough relationships for world generation, harvesting, crafting, economy, quests, events, AI needs, visual evidence, and saves to agree on what the material means.

| **Stage**          | **Required Questions**                                                                                              | **World Connections**                                          |
|--------------------|---------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| **Origin**         | What geological, biological, magical, industrial, cultural, or historical process creates it?                       | Biome, realm, creature, structure, civilisation, event.        |
| **Availability**   | Where, when, and under what state can it be found?                                                                  | Climate, depth, season, danger, access, route, permission.     |
| **Recognition**    | How does the player or NPC know it is present and what tools or knowledge improve certainty?                        | Surface clues, tracks, survey, language, Codex, NPC teaching.  |
| **Extraction**     | Who can gather it, using which tool, skill, labour, station, permit, or ritual?                                     | Player, NPC job, machine, creature, faction, law.              |
| **Transformation** | Which preparation, refinement, fabrication, preservation, purification, binding, or restoration steps apply?        | Recipes, stations, power, mana, by-products, failures.         |
| **Circulation**    | Who stores, consumes, trades, taxes, steals, hoards, exports, or protects it?                                       | Settlement, warehouse, merchant, route, faction, household.    |
| **Use**            | Which survival, building, automation, magic, culture, combat, quest, realm, repair, or research roles remain valid? | Blocks, items, recipes, projects, wards, gear, rituals.        |
| **Aftermath**      | What changes after depletion, contamination, overuse, decay, destruction, recycling, restoration, or transfer?      | Biome state, scarcity, ecology, reputation, conflict, history. |

# 6. Provenance, Ownership, Legitimacy and Cultural Interpretation

| **Field**                  | **Purpose**                                                                                         | **Examples**                                                      |
|----------------------------|-----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| **Source Provenance**      | Records natural source, producer, structure, creature, event, or cache.                             | Mined in a named basin; woven by a guild; taken from a lair.      |
| **Maker / Refiner**        | Identifies workshop, NPC, faction, civilisation, machine line, or unknown craft tradition.          | Masterwork forge mark; ancient machine pattern.                   |
| **Custody Chain**          | Tracks important transfers without requiring every common item to hold full history.                | Gifted, inherited, sold, looted, seized, restored, displayed.     |
| **Legal Owner**            | Defines current recognised property under local law.                                                | Player, household, guild, temple, settlement, faction, contested. |
| **Cultural Claim**         | Allows several groups to claim or interpret the same material or relic differently.                 | Sacred ancestor object versus archaeological artifact.            |
| **Acquisition Legitimacy** | Records purchase, gift, salvage, lawful harvest, theft, conquest, illicit trade, or unknown status. | Affects guards, markets, museums, quests, and restitution.        |
| **Condition History**      | Tracks damage, repair, contamination, cleansing, alteration, and major enchantment.                 | Cracked, reforged, curse removed, identity disputed.              |
| **Knowledge State**        | Separates object truth from player understanding and faction claims.                                | Unidentified alloy, false royal provenance, decoded inscription.  |

# 7. Deterministic Distribution, Suitability, Density, Rarity and Exclusion

Random generation means deterministic selection from compatible definitions, not uniform chance. A seed resolves the world and generated-history inputs first; resource and reward choices then use authored suitability, exclusion, scarcity, uniqueness, and fallback contracts.

| **Selection Input**             | **Influence on Material or Reward**                                                                                                                       |
|---------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Realm and World Law**         | Allows or forbids native material families, stabilisation requirements, and physical behaviour.                                                           |
| **Geology and Terrain**         | Controls stone, ore, salt, clay, geothermal, fossil, crystal, and sediment resources.                                                                     |
| **Climate, Water and Season**   | Controls crops, forests, herbs, wetlands, marine stocks, preservation, and access.                                                                        |
| **Ecology and Population**      | Controls animal, plant, fungal, shed, nest, predator, and invasive resource availability.                                                                 |
| **Generated History**           | Creates mines, abandoned stockpiles, battle salvage, trade caches, relics, lost techniques, and contamination.                                            |
| **Culture and Faction**         | Controls extraction traditions, trade goods, legal restrictions, demand, hoarding, and ownership.                                                         |
| **Structure, Dungeon and Boss** | Provides contextual containers, stores, equipment, relic anchors, unique parts, and aftermath.                                                            |
| **Magic and World State**       | Applies purity, corruption, blessing, realm leakage, warding, disaster, depletion, or recovery.                                                           |
| **Progression Guarantee**       | Ensures capabilities remain reachable through multiple valid deposits, trade, substitutes, recycling, salvage, or realm routes without fixed coordinates. |
| **Exclusion and Repetition**    | Prevents incompatible resources, excessive duplication, overlapping unique relics, and monotonous regional economies.                                     |

# 8. Resource Nodes, Deposits, Stocks, Caches and Reservations

| **Form**               | **Behaviour**                                                                                                                   | **Typical Use**                                  |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| **Scatter**            | Small surface or local objects gathered quickly and replenished by ecology or world state.                                      | Sticks, loose stone, shells, fallen fruit.       |
| **Patch / Stand**      | Area-based biological or mineral concentration with density and recovery rules.                                                 | Herb patch, reed bed, clay bank, fungal stand.   |
| **Vein**               | Finite or slowly renewing block distribution with grade, continuity, depth, and by-products.                                    | Copper, iron, quartz, salt.                      |
| **Lode / Deposit**     | Large strategic body suitable for surveying and scaled extraction.                                                              | Industrial ore body, coal basin, mana seam.      |
| **Node**               | Persistent source with capacity, rate, access, and maintenance rules.                                                           | Spring, mana well, vent, managed grove.          |
| **Stock**              | Owned or simulated stored quantity held by a person, settlement, faction, structure, caravan, or machine.                       | Warehouse grain, guard equipment, fuel reserve.  |
| **Cache**              | Hidden or protected contextual storage that may include goods, evidence, currency, or knowledge.                                | Smuggler cache, survey store, shrine offering.   |
| **Hoard**              | Accumulated valuable stock created by creature, ruler, collector, faction, or historical event.                                 | Dragon-like hoard, treasury, relic collection.   |
| **Unique Reservation** | Seed-registered placement or custody for a unique relic, artifact, world-machine part, or irreplaceable resource.               | One living dungeon core, named crown, realm key. |
| **Project Reserve**    | Quantity allocated to construction, defence, ritual, contract, emergency, or maintenance and unavailable to normal consumption. | City wall stone, ward mana, siege grain.         |

# 9. Grade, Purity, Quality, Condition and Instance Variation

| **Axis**               | **Applies To**                                                                  | **Meaning and Use**                                                                    |
|------------------------|---------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| **Grade**              | Ore, deposits, biological stands, salvage.                                      | Yield concentration, extraction effort, waste, by-products, and processing efficiency. |
| **Purity**             | Mana, crystals, reagents, fuels, water, magical and forbidden materials.        | Power output, ritual stability, corruption risk, quality, and purification demand.     |
| **Quality**            | Crafted goods, components, food, tools, textiles, trade goods.                  | Performance, durability, presentation, price, repair cost, and cultural prestige.      |
| **Condition**          | Loot, relics, equipment, stored goods, structures, documents.                   | Intact, worn, damaged, broken, contaminated, spoiled, restored, or altered.            |
| **Age**                | Organic goods, wine-like products, documents, relics, structures.               | Spoilage, maturation, historical value, brittleness, authenticity, and lore.           |
| **Provenance**         | Important goods, relics, trophies, legal items.                                 | Story, ownership, reputation, claims, museum value, and faction response.              |
| **Variant**            | Regional, cultural, realm, seasonal, corrupted, blessed, or manufacturing form. | Visual identity and specialised use without replacing the parent family.               |
| **Charge / Stability** | Batteries, magical objects, portals, cores, realm materials.                    | Remaining power, safe operating range, leakage, overload, and maintenance.             |

# 10. Renewability, Regeneration, Depletion and Ecological Carrying Capacity

| **Renewability Class**    | **Default Rule**                                                                                        | **Consequences and Recovery**                                        |
|---------------------------|---------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| **Rapid Renewable**       | Regrows within short cycles when habitat remains healthy.                                               | Forage, common crops, some fungi; overharvest reduces local density. |
| **Managed Renewable**     | Requires cultivation, husbandry, rotation, replanting, irrigation, feeding, or protection.              | Timber, livestock, orchards, fibre, managed fisheries.               |
| **Slow Renewable**        | Recovers over seasons or years and is vulnerable to repeated pressure.                                  | Old-growth resin, rare herbs, shell beds, spirit blooms.             |
| **Conditional Renewable** | Returns only when magical, ecological, cultural, or structural conditions are maintained.               | Ley crystals, blessed herbs, ritual wax, elemental residue.          |
| **Finite Local**          | A deposit can be exhausted locally but exists elsewhere in the generated world.                         | Most ore veins, fossil fuels, ruins, caches.                         |
| **Strategic Finite**      | Large deposit or stock has regional economic importance and may trigger conflict when depleted.         | Coal basin, rare-metal lode, ancient machine stock.                  |
| **Unique**                | One or a bounded number exists per save; replacement requires explicit succession or restoration rules. | Relics, artifact cores, world-machine parts.                         |
| **Recyclable**            | Does not regenerate naturally but can re-enter production through salvage and recovery.                 | Metals, glass, machine parts, construction blocks.                   |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Readability Rule<br />
</strong>The game must communicate whether a source is renewable, finite, recovering, protected, owned, dangerous, or depleted before the player commits to large-scale extraction. Consequences should emerge from visible pressure and settings, not surprise punishment.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 11. Prospecting, Discovery, Surveying and Knowledge

| **Knowledge Layer**         | **Player/NPC Method**                                                                                                     | **Result**                                                                  |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| **Environmental Reading**   | Colours, rock type, vegetation, exposed fragments, vents, stains, water chemistry, creature behaviour, ruins, and sounds. | Low-certainty clues available without specialist tools.                     |
| **Simple Prospecting**      | Pan, hammer, sample kit, magnet, tasting/chemical test, local map, or experienced NPC.                                    | Confirms family and approximate richness.                                   |
| **Surveying**               | Survey lens, drilling, magical resonance, seismic test, aerial view, archive research, or machine scan.                   | Defines geometry, grade bands, hazards, ownership, and extraction plan.     |
| **Cultural Knowledge**      | Local language, oral history, guild records, sacred law, trade rumours, and faction teaching.                             | Reveals named sources, protected sites, substitutes, and legitimate access. |
| **Codex State**             | Unknown, observed, sampled, identified, analysed, mastered, or disputed.                                                  | Controls UI detail without hiding essential safety information.             |
| **Map Layer**               | Private notes, shared party map, purchased survey, settlement atlas, faction secret, or public chart.                     | Supports exploration and multiplayer information ownership.                 |
| **False or Outdated Claim** | Rumours, propaganda, exhausted mines, moved caravans, mistaken identification.                                            | Creates investigation without making system feedback dishonest.             |
| **Knowledge Reward**        | Recipes, processing improvements, purity tests, safe handling, harvesting methods, and market intelligence.               | Progress without always granting a physical item.                           |

# 12. Gathering, Harvesting, Extraction, Labour and Permissions

| **Method**                      | **Requirements**                                                                                 | **System Connections**                                     |
|---------------------------------|--------------------------------------------------------------------------------------------------|------------------------------------------------------------|
| **Hand Gathering**              | Reach, basic knowledge, inventory space, and simple tool where needed.                           | Survival, exploration, ecology, early crafting.            |
| **Skilled Harvest**             | Appropriate skill, precision tool, timing, anatomy knowledge, or preservation.                   | Higher yield/quality, lower harm, rare components.         |
| **Agriculture / Husbandry**     | Land or facility, seed/breeding stock, labour, water/feed, season, health, and ownership.        | Settlements, food, trade, culture, ecology.                |
| **Mining / Quarrying**          | Tool tier, support, ventilation, hauling, grade knowledge, safety, and land rights.              | Resources, structures, automation, hazards, law.           |
| **Salvage / Deconstruction**    | Ownership or salvage right, dismantling tools, condition assessment, and transport.              | Ruins, machines, battlefields, recycling, theft.           |
| **Automation**                  | Power, machine, logistics, maintenance, permissions, throughput, storage, and consequence rules. | Scaled production without deleting labour or world impact. |
| **Ritual / Magical Extraction** | Knowledge, catalysts, participants, purity, stability, and moral/legal constraints.              | Mana, spirits, realm materials, corruption risk.           |
| **NPC Contract**                | Payment, reputation, tools, workplace, route, safety, and stock ownership.                       | Jobs, factions, settlements, economy.                      |
| **Faction Concession**          | License, tax, quota, territory, environmental restriction, or monopoly.                          | Politics, strategic resources, crime, war.                 |

# 13. Processing, Refinement, By-products, Waste and Recovery

| **Process Family**         | **Inputs and Requirements**                                                     | **Outputs / Risks**                                              |
|----------------------------|---------------------------------------------------------------------------------|------------------------------------------------------------------|
| **Cleaning and Sorting**   | Raw stock, water/air, labour, screens, quality knowledge.                       | Usable material, rejects, contamination separation.              |
| **Mechanical Preparation** | Crushing, cutting, milling, sawing, grinding, pressing, spinning.               | Intermediate grades, dust, chips, fibre, slurry, wear.           |
| **Thermal Processing**     | Drying, smoking, firing, smelting, roasting, annealing, distilling.             | Preserved food, ceramics, ingots, glass, fumes, slag, ash.       |
| **Chemical / Alchemical**  | Leaching, tanning, dyeing, fermentation, reagents, catalysts.                   | Refined products, effluent, toxicity, failure, valuable residue. |
| **Biological Processing**  | Composting, curing, brewing, culturing, symbiotic growth.                       | Renewable outputs, spoilage, disease, timing dependency.         |
| **Magical Stabilisation**  | Purification, binding, warding, cooling, grounding, attunement.                 | Safe realm material, reduced corruption, mana residue.           |
| **Fabrication**            | Casting, forging, weaving, carving, assembly, inscription.                      | Components, goods, gear, blocks, cultural variants.              |
| **Restoration**            | Cleaning, matching, reforging, conserving, translating, reattaching provenance. | Recovered function or history; may preserve or erase evidence.   |
| **Recovery and Recycling** | Dismantling, remelting, glass cullet, fibre reclaim, waste sorting.             | Reduced extraction demand, lower-grade outputs, recovered parts. |

# 14. Material Tags, Substitution, Compatibility and Recipe Contracts

| **Contract Type**              | **Purpose**                                                                               | **Examples**                                                         |
|--------------------------------|-------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| **Family Tag**                 | Allows readable substitutions within a broad family.                                      | any_log, any_fibre, any_stone, any_ingot.                            |
| **Property Tag**               | Requires behaviour rather than a named material.                                          | conductive, heat_resistant, flexible, transparent, spirit_receptive. |
| **Grade / Quality Minimum**    | Preserves balance and output expectations.                                                | ore_grade_normal+, cloth_quality_refined+.                           |
| **Cultural Variant**           | Changes appearance, value, preference, or story while preserving core function.           | River-clan rope, rune-hold steel fittings.                           |
| **Realm Compatibility**        | Requires native, stabilised, or attuned material for a realm or infrastructure.           | void_stable, pressure_safe, dream_anchored.                          |
| **Forbidden / Restricted Tag** | Triggers law, reputation, storage, handling, or corruption rules.                         | necromantic_core, blood_catalyst, cursed_metal.                      |
| **Substitution Cost**          | Alternative may change quantity, time, quality, durability, risk, or cultural acceptance. | Bronze fitting replacing iron with more pieces.                      |
| **No-Substitute Contract**     | Reserved for identity-critical, unique, ritual, legal, or world-state objects.            | Specific relic seal, named boss core, treaty charter.                |

# 15. Organic, Agricultural, Botanical and Marine Resources

| **Family**                   | **Ecology and Production**                                                                                 | **Primary Connections**                              |
|------------------------------|------------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| **Timber and Wood Products** | Tree species, age, soil, climate, forestry method, replanting, fire, disease, and cultural protection.     | Building, fuel, furniture, tools, machines, trade.   |
| **Fibres and Textiles**      | Wild/cultivated plants, animal fibres, fungal threads, marine fibres, spinning, weaving, dyeing.           | Clothing, ropes, sails, filters, culture goods.      |
| **Food Crops**               | Climate, season, soil, water, labour, seed stock, pests, storage, cuisine, and trade.                      | Survival, NPC needs, festivals, morale, economy.     |
| **Herbs and Reagents**       | Microhabitat, season, moon/mana state, careful harvest, cultivation difficulty.                            | Medicine, alchemy, ritual, cooking, trade.           |
| **Resins, Oils and Waxes**   | Trees, seeds, insects, marine organisms, pressing, rendering, purification.                                | Lighting, preservation, adhesives, polish, rituals.  |
| **Fungi and Cultures**       | Substrate, moisture, darkness, symbiosis, contamination, fermentation.                                     | Food, medicine, dyes, alchemy, waste recovery.       |
| **Marine Stocks**            | Water temperature, salinity, depth, current, spawning grounds, migration, pollution, and fishing pressure. | Food, oils, shell, dyes, fertiliser, trade.          |
| **Managed Ecologies**        | Orchards, groves, reed beds, apiaries, fisheries, kelp farms, mushroom halls.                              | Settlement jobs, renewable supply, landscape change. |

# 16. Stone, Soil, Clay, Salt, Glass and Construction Minerals

| **Family**               | **Key Variables**                                                                   | **Uses and Consequences**                             |
|--------------------------|-------------------------------------------------------------------------------------|-------------------------------------------------------|
| **Soils and Loams**      | Fertility, drainage, texture, organic content, contamination, erosion, climate.     | Agriculture, earth building, restoration, land value. |
| **Clays**                | Plasticity, firing range, colour, impurities, deposit moisture, cultural technique. | Brick, pottery, refractory parts, ritual forms.       |
| **Sands and Silica**     | Grain, purity, colour, source, coastal/river/desert ecology, extraction pressure.   | Glass, mortar, casting, filters, construction.        |
| **Stone Families**       | Hardness, grain, fracture, polish, weathering, regional identity, quarry access.    | Blocks, roads, sculpture, fortification, trade.       |
| **Salt and Evaporites**  | Brine, dry basin, mine, sea works, purity, strategic food-preservation role.        | Food, medicine, alchemy, trade, taxation.             |
| **Glass Materials**      | Silica, flux, colourant, fuel, furnace quality, realm additives.                    | Windows, optics, containers, runes, portals.          |
| **Industrial Minerals**  | Lime, gypsum, sulphur, graphite, abrasives, pigments, fluxes.                       | Construction, metallurgy, alchemy, machinery.         |
| **Extraction Aftermath** | Quarries, erosion, subsidence, saline waste, habitat loss, heritage conflict.       | Dynamic states, restoration projects, law, economy.   |

# 17. Ores, Metals, Gems, Crystals and Strategic Deposits

| **Family**                 | **Progression Identity**                                                                     | **Long-Term Use**                                               |
|----------------------------|----------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| **Copper and Tin**         | Early mechanisms, conductors, bronze, fittings, pipes, decorative and cultural work.         | Automation, repairs, trade, roofs, tools, magic conduits.       |
| **Iron and Steel Inputs**  | Tools, weapons, fasteners, rails, machines, settlement projects, defence.                    | Infrastructure, repair, construction, industry, trade.          |
| **Side Metals**            | Lead, nickel, cobalt, silver, gold, mercury-bearing ore, and regional alloys.                | Special chemistry, shielding, coin/art, magic, precision parts. |
| **Gems**                   | Cutting, clarity, colour, inclusions, cultural preference, enchantment affinity.             | Jewellery, optics, trade, magic, relic restoration.             |
| **Crystals**               | Structure, resonance, charge, purity, growth condition, fragility.                           | Mana, runes, research, sensors, storage, portals.               |
| **Strategic Lodes**        | Large deposits whose control affects settlement growth, war, routes, and contracts.          | Concessions, monopolies, faction conflict, industrial planning. |
| **Reclaimed Metals**       | Salvaged structures, machines, battlefields, ruins, and waste.                               | Reduced mining, historical evidence, variable condition.        |
| **Rare and Mythic Metals** | Arcane Alloy, Mythril, Voidstone-linked alloys, Celestial Metal and realm-specific branches. | High-tier gear, conduits, realm infrastructure, wonders.        |

# 18. Fuels, Power Materials, Mana and Energy Carriers

| **Energy Family**            | **Behaviour**                                                                  | **Infrastructure and Risk**                                          |
|------------------------------|--------------------------------------------------------------------------------|----------------------------------------------------------------------|
| **Biological Fuel**          | Firewood, charcoal, peat, oils, crop residue, biogas-like outputs.             | Renewable management, smoke, land use, household and early industry. |
| **Fossil / Geological Fuel** | Coal, oil shale, gas-like pockets, sulphurous deposits.                        | High throughput, finite stocks, pollution, strategic basins.         |
| **Mechanical Potential**     | Water head, wind corridors, tides, gravity, pressure, animal or labour power.  | Site-dependent renewable infrastructure rather than inventory fuel.  |
| **Thermal / Geothermal**     | Magma, vents, hot springs, deep heat, furnace embers.                          | Location, corrosion, hazard, settlements, industry.                  |
| **Mana Carrier**             | Raw crystal, shard, dust, battery, charged liquid, rune core, ley connection.  | Purity, charge, leakage, wards, machines, portals.                   |
| **Alchemical Fuel**          | Prepared compounds, reactive oils, explosive powders, catalysts.               | Portable power with handling, recipe, storage, and legal risk.       |
| **Realm Fuel**               | Void shards, infernal ash, storm cores, dream motes, deep embers.              | Powerful, incompatible or corrupting unless stabilised.              |
| **Grid / Network Energy**    | Stored or flowing energy represented by network state rather than item stacks. | Authority, loss, throughput, overload, maintenance, simulation LOD.  |

# 19. Creature Resources, Anatomy, Welfare and Ethical Harvesting

Creature resources reference the ecology and personhood rules of 24F. Sapient beings are never converted into generic monster-drop categories by ancestry or appearance. Anatomical resources define possible material relationships; the creature system determines whether the source is shed, cultivated, voluntary, hunted, scavenged, illegal, forbidden, or impossible.

| **Acquisition Class**    | **Examples**                                                                       | **Rules**                                                                                  |
|--------------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| **Shed / Gathered**      | Feathers, antlers, moulted shell, silk, wool, secretions, abandoned nest material. | May be non-lethal; still affected by territory, season, stress, and ownership.             |
| **Husbandry Product**    | Milk-like goods, eggs, wool, wax, manure, cultivated venom, symbiotic essence.     | Requires welfare, feed, housing, health, breeding, and law.                                |
| **Hunted Resource**      | Meat, hide, bone, horn, chitin, organs.                                            | Population, season, tool, skill, ethics, culture, permits, and waste use matter.           |
| **Scavenged / Salvaged** | Carcass, naturally dead creature, battlefield remains, shed titan fragments.       | Disease, decomposition, ownership, sacred law, and contamination apply.                    |
| **Magical Essence**      | Spirit residue, elemental core, dream dust, corruption tissue.                     | Entity nature, consent/personhood, stability, ritual, and moral consequences.              |
| **Trophy**               | Evidence of encounter, achievement, office, claim, or cultural practice.           | Does not have to require killing; may be a token, image, cast, shed part, or granted mark. |
| **Forbidden Material**   | Sapient remains, coerced essence, necromantic cores, blood catalysts.              | Explicit law, morality, corruption, fear, faction, and storage consequences.               |
| **Restoration Use**      | Antivenom, ecological research, breeding recovery, healing, habitat repair.        | Creature materials can support conservation rather than extraction only.                   |

# 20. Magical, Corrupted, Forbidden and Hazardous Resources

| **Class**                         | **Value**                                                                                | **Required Safeguards and Consequences**                                          |
|-----------------------------------|------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| **Ambient Mana Material**         | Naturally resonant crystal, dust, fluid, plant, or biological structure.                 | Purity, charge, leakage, local mana ecology, warding.                             |
| **Blessed / Consecrated**         | Material altered by ritual, faith, realm law, guardian, or sustained community practice. | Cultural legitimacy, storage, deconsecration, theft response.                     |
| **Spirit / Memory Material**      | Essence, echo, memory glass, oathbone, ancestral ash.                                    | Personhood, consent, interpretation, mourning, ritual law.                        |
| **Corrupted Material**            | Resource changed by blight, curse, void, unstable mana, pollution, or forbidden action.  | Contamination spread, handling, cleansing, market restriction.                    |
| **Forbidden Catalyst**            | Blood, coerced soul, necromantic core, cursed metal, sacrificial reagent.                | Strong capability paired with moral, social, legal, and world-state consequences. |
| **Unstable Realm Matter**         | Material whose physics or magic decays outside its realm.                                | Container, stabilisation, time limit, compatibility, portal route.                |
| **Hazardous Industrial Material** | Toxin, explosive, corrosive, radioactive-like magical or mineral hazard.                 | Protective gear, labels, storage separation, spill response.                      |
| **Cleansed / Neutralised Output** | Recovered safe material or inert waste after treatment.                                  | May lose power, gain value, enable restoration, or preserve evidence.             |

# 21. Realm Resources, Stabilisation and Cross-Realm Use

Each major dimension receives a complete material ecology rather than one novelty ore. Native resources must connect to realm law, biome, society, creature ecology, dungeons, bosses, infrastructure, and trade. Their value continues outside the realm through construction, machines, magic, settlement projects, restoration, research, or story.

| **Realm Resource Rule**  | **Requirement**                                                                                                                                |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| **Native Context**       | Every resource identifies the realm biomes, processes, societies, creatures, structures, or events that produce it.                            |
| **Physical Law**         | The entry records unusual gravity, pressure, memory, dream, contract, death, elemental, divine, void, or artificial behaviour.                 |
| **Extraction Access**    | Gathering may require realm-adapted tools, survival systems, faction permission, ritual state, or local knowledge.                             |
| **Stabilisation**        | Refining can require binding, cooling, purifying, grounding, warding, attunement, pressure containment, memory anchoring, or contract release. |
| **Transport**            | Containers, route stability, gate capacity, customs, smuggling, decay, and portal risk apply.                                                  |
| **Overworld Utility**    | At least three lasting uses beyond simply crafting stronger gear.                                                                              |
| **Native Demand**        | Realm societies and ecosystems continue to consume and value their own material; export cannot erase local meaning.                            |
| **Cross-Realm Conflict** | Competing claims, invasive use, embargo, extraction damage, and colonial behaviour receive explicit consequences.                              |

# 22. Cultural Goods, Luxuries, Art, Food, Textiles and Identity

Culture goods are authored traditions and production relationships, not ancestry bonuses. Any people can learn, adopt, adapt, trade, or challenge a cultural technique through history and contact. A good may have several regional variants and may become a hybrid product in mixed settlements.

| **Goods Family**              | **Identity Inputs**                                                               | **World Uses**                                               |
|-------------------------------|-----------------------------------------------------------------------------------|--------------------------------------------------------------|
| **Cuisine and Preserves**     | Climate, crops, livestock, faith, taboo, season, celebration, storage technology. | Needs, morale, festivals, hospitality, trade, diplomacy.     |
| **Textiles and Dress**        | Fibres, dyes, weather, work, status, ritual, art, trade routes.                   | Clothing, banners, sails, interiors, culture recognition.    |
| **Ceramics and Glass**        | Clay/silica source, fuel, kiln, glaze, local motifs, function.                    | Storage, cooking, architecture, trade, archaeology.          |
| **Wood, Bone and Stonecraft** | Available material, tool tradition, law, symbolism, architecture.                 | Furniture, instruments, tools, ritual, decoration.           |
| **Metalwork and Jewellery**   | Ore access, alloy knowledge, guilds, status, coinage, magic affinity.             | Equipment, prestige, diplomacy, trade, relics.               |
| **Scents, Inks and Pigments** | Plants, minerals, creatures, alchemy, writing, ritual, art.                       | Codex, maps, cosmetics, worship, contracts, trade.           |
| **Music and Instruments**     | Material acoustics, performance tradition, migration, ceremony.                   | Festivals, communication, morale, relics, quests.            |
| **Luxury and Collectibles**   | Scarcity, workmanship, provenance, fashion, patronage, political legitimacy.      | Wealth storage, gifts, museum collections, theft, diplomacy. |

# 23. Industrial Components, Maintenance Goods and Infrastructure Supply

| **Supply Family**                    | **Consumers**                                                       | **Material-Ecology Requirement**                             |
|--------------------------------------|---------------------------------------------------------------------|--------------------------------------------------------------|
| **Fasteners and Fittings**           | Buildings, vehicles, machines, roads, ships, workshops.             | Standard sizes, metals, repairs, salvage compatibility.      |
| **Gears, Bearings and Motion Parts** | Automation, lifts, mills, rails, gates, vehicles.                   | Wear, lubrication, quality, precision, replacement stock.    |
| **Pipes, Valves and Containers**     | Water, fuel, steam, chemicals, mana, food, trade.                   | Material compatibility, pressure, corrosion, leakage.        |
| **Filters and Treatment Media**      | Air, water, fumes, mana, alchemy, corruption.                       | Consumable media, disposal, regeneration, hazard handling.   |
| **Cables, Ropes and Belts**          | Transport, cranes, ships, mines, machines, bridges.                 | Fibre/metal family, load, weather, wear, cultural technique. |
| **Batteries, Cores and Power Parts** | Mana grids, machines, wards, portals, portable tools.               | Charge, purity, cycle life, containment, recycling.          |
| **Repair and Maintenance Kits**      | Tools, armour, structures, machines, wards, routes.                 | Material-specific parts, skill, quality, stock planning.     |
| **Standardised Supply Packs**        | Construction, emergency, military, expedition, settlement projects. | Exact contents, ownership, reservation, expiry, logistics.   |

# 24. Loot Taxonomy, Reward Layers and Contextual Value

| **Reward Layer**         | **Definition**                                                         | **Examples**                                                  |
|--------------------------|------------------------------------------------------------------------|---------------------------------------------------------------|
| **Immediate Functional** | Items usable during or directly after an encounter.                    | Food, medicine, ammunition-like supplies, repair parts, keys. |
| **Recovered Property**   | Goods taken from a defeated, abandoned, damaged, or surrendered owner. | Equipment, tools, stock, documents, personal effects.         |
| **Site Stock**           | Materials logically stored for the site function.                      | Mine tools, temple offerings, workshop parts, ship stores.    |
| **Ecological Material**  | Nest, lair, shed, residue, anatomy, or environmental by-product.       | Silk, venom, bone midden, elemental residue.                  |
| **Knowledge and Access** | Information or permissions that open options.                          | Map, recipe, language note, survey, charter, calibration.     |
| **Cultural / Political** | Object whose value depends on faction, law, identity, or diplomacy.    | Banner, seal, tribute, credential, treaty evidence.           |
| **Unique / Relic**       | Seed-reserved or historically significant object with provenance.      | Crown, guardian sigil, living dungeon core.                   |
| **World-State Reward**   | Persistent change rather than inventory gain.                          | Safe route, restored mine, allied faction, cleansed biome.    |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Reward Principle<br />
</strong>The strongest reward is often a new capability, relationship, route, settlement function, safe biome, knowledge state, or recovered infrastructure. Physical loot remains important, but every major encounter should not collapse into a chest of statistically stronger gear.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 25. Loot Grammars, Slot Selection, Duplication Control and Fallback Rules

A loot grammar is an authored set of contextual slots. The generator fills only slots supported by the source, owner, event, condition, difficulty, history, and outcome. It can vary quantities and compatible definitions while preserving identity.

| **Grammar Layer**      | **Resolution Rule**                                                                                                                                       |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Source Grammar**     | Creature, NPC, structure, dungeon room, boss, caravan, battlefield, cache, shrine, or event defines eligible slots.                                       |
| **Ownership Grammar**  | Owner culture, profession, faction, wealth, supply state, route, and law shape equipment and stored goods.                                                |
| **Function Grammar**   | Kitchen, archive, armoury, workshop, mine, ritual chamber, treasury, nest, and prison have different stock logic.                                         |
| **Condition Grammar**  | Burning, flooded, looted, abandoned, occupied, restored, corrupted, or collapsed states change quantity and condition.                                    |
| **Outcome Grammar**    | Killed, surrendered, bargained, cleansed, restored, captured, protected, or studied outcomes grant different rewards.                                     |
| **Uniqueness Check**   | Seed registry prevents duplicate unique relics, claims, boss cores, and irreplaceable knowledge unless a copy is explicitly diegetic.                     |
| **Repetition Control** | Regional and recent-drop memory reduces monotonous duplicates while retaining staple supplies.                                                            |
| **Fallback Contract**  | When a unique or required entry is unavailable, grant a valid clue, fragment, substitute path, restoration lead, or alternate source rather than nothing. |
| **Pity / Protection**  | Long-tail content may use transparent bounded protection for required progression, but never silently violates world logic.                               |

# 26. Containers, Caches, Hoards, Remains and Evidence

| **Container / Evidence Type**   | **Typical Contents**                                                | **Special Rules**                                                     |
|---------------------------------|---------------------------------------------------------------------|-----------------------------------------------------------------------|
| **Personal Inventory**          | Tools, food, carried goods, documents, equipment.                   | Ownership, profession, wealth, recent activity, surrender outcome.    |
| **Household Storage**           | Food, clothing, heirlooms, tools, savings, local goods.             | Private property, family needs, crime and restitution.                |
| **Workplace Stock**             | Inputs, outputs, tools, safety supplies, records, waste.            | Job and recipe logic, project reservations, automation ports.         |
| **Warehouse / Treasury**        | Categorised bulk stocks, contracts, taxes, strategic reserves.      | Permissions, ledgers, contribution, guard response, simulation LOD.   |
| **Expedition / Caravan Stores** | Travel supplies, trade goods, repair kits, route documents.         | Route origin/destination, danger, loss, rescue, contract.             |
| **Hidden Cache**                | Emergency, smuggled, stolen, secret, ceremonial, or survival stock. | Clues, ownership, concealment, trap, decay, legal status.             |
| **Hoard / Collection**          | Accumulated valuables, trophies, art, relics, rare material.        | Collector identity, curation, provenance, negotiation, unique checks. |
| **Remains / Debris**            | Damaged possessions, salvage, documents, biological evidence.       | Time, weather, scavengers, respect, disease, archaeology.             |
| **Environmental Evidence**      | Spill, tailings, ash, footprints, packaging, discarded parts.       | Reveals production, danger, route, faction, event, or hidden site.    |

# 27. Dungeon, Boss, Siege, Event and Exploration Rewards

| **Source**                | **Reward Composition**                                                                                            | **Persistent Result**                                            |
|---------------------------|-------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------|
| **Micro-site / Lair**     | Local materials, creature evidence, small cache, route clue, crafting component.                                  | Ecology knowledge, pressure reduction, nest state.               |
| **Dungeon**               | Function stock, occupant goods, historical material, knowledge, relic lead, infrastructure control.               | Claim, restore, cleanse, occupy, route, faction change.          |
| **Megadungeon**           | Layered economies, unique systems, regional stock, multiple relics/claims, world-machine parts.                   | Long-term project, settlement, regional transformation.          |
| **Boss**                  | Anatomy or core where appropriate, equipment/tribute, territory key, knowledge, political proof, unique catalyst. | Territory, succession, ecology, faction, route, biome aftermath. |
| **Siege**                 | Recovered stores, standards, engines, prisoner/hostage outcomes, relief stock, contribution reward.               | Settlement damage, loyalty, fear, border and economy change.     |
| **World Event**           | Seasonal or disaster materials, temporary markets, rare routes, public projects, evidence.                        | Dynamic scarcity, recovery, migration, history.                  |
| **Exploration Milestone** | Map, survey, landmark knowledge, shortcut, resource clue, Codex discovery.                                        | Safer travel and broader planning rather than raw power only.    |
| **Non-Lethal Resolution** | Granted token, contract, teaching, alliance, access, harmless sample, shared custody.                             | Preserves ecology/personhood and supports alternate play.        |

# 28. Relics, Artifacts, Wonders, Keys and Unique Objects

| **Object Class**           | **Primary Identity**                                                              | **Persistence Rule**                                                      |
|----------------------------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------|
| **Historical Relic**       | Significant because of maker, owner, event, place, law, or memory.                | Can be ordinary in function but extraordinary in story and claims.        |
| **Sacred Relic**           | Held significant through faith, ancestor, oath, guardian, or sustained ritual.    | Custody, desecration, pilgrimage, blessing, cultural interpretation.      |
| **Functional Artifact**    | Unique or rare device with exceptional capability.                                | Charge, repair, calibration, risk, compatible infrastructure.             |
| **Political Regalia**      | Symbol or legal instrument of office, sovereignty, guild, faction, or treaty.     | Control affects legitimacy but does not automatically force loyalty.      |
| **Realm Key / Seal**       | Opens, stabilises, regulates, or proves authority over a route or realm system.   | Seed reservation, recovery path, alternate access, multiplayer authority. |
| **Living Object**          | Has agency, growth, memory, ecology, or personhood considerations.                | Consent, care, relationship, succession, containment.                     |
| **Wonder Component**       | Part of a world machine, colossal structure, titan, or civilisation-scale system. | May be restored in place rather than carried.                             |
| **False / Disputed Relic** | Claimed, copied, forged, misidentified, or culturally contested.                  | Investigation and interpretation matter; UI separates belief from truth.  |

# 29. Relic Provenance, Restoration, Interpretation, Custody and Display

| **Lifecycle Step** | **Player and World Choices**                                                          | **Consequences**                                                 |
|--------------------|---------------------------------------------------------------------------------------|------------------------------------------------------------------|
| **Discovery**      | Excavate, loot, receive, inherit, purchase, seize, rescue, or identify.               | Initial claim, damage, witnesses, legality, knowledge.           |
| **Authentication** | Research maker marks, material, language, history, magic, witnesses, and records.     | Truth, disputed claim, forgery, faction interest.                |
| **Conservation**   | Stabilise condition without replacing original evidence.                              | Preserves historical value and may limit immediate power.        |
| **Restoration**    | Repair function or appearance using compatible materials and knowledge.               | Can increase capability but alter authenticity or claims.        |
| **Custody**        | Keep, return, share, lend, donate, display, seal, destroy, or transfer.               | Reputation, access, law, diplomacy, museum/town growth.          |
| **Interpretation** | Several cultures and scholars may offer different readings.                           | Codex viewpoints, quests, propaganda, unresolved mystery.        |
| **Activation**     | Use power, connect infrastructure, perform rite, install in wonder, or awaken entity. | World-state change, risk, ownership conflict, new routes.        |
| **Loss / Theft**   | Relic can move to another owner, market, faction, dungeon, or hoard.                  | Recovery quest, succession, altered politics; no silent respawn. |

# 30. Maps, Records, Knowledge, Recipes and Non-Material Rewards

| **Knowledge Form**        | **What It Can Unlock**                                                              | **Trust and Persistence**                                        |
|---------------------------|-------------------------------------------------------------------------------------|------------------------------------------------------------------|
| **Map / Survey**          | Location, route, deposit, danger, structure, border, water, or realm anchor.        | May be incomplete, outdated, private, copied, sold, or shared.   |
| **Recipe / Technique**    | Craft, process, repair, preserve, stabilise, substitute, or recover.                | Requires knowledge plus materials/stations; not level alone.     |
| **Language / Script**     | Read signs, negotiate, interpret relics, understand claims, access archives.        | Knowledge state can be partial and culturally situated.          |
| **Historical Record**     | Generated history, ownership, disaster, route, lineage, law, or site function.      | Can confirm or challenge rumours and provenance.                 |
| **Research Data**         | Creature weakness, material property, portal calibration, ecology, machine pattern. | Improves safety, yield, choices, and Codex certainty.            |
| **Credential / License**  | Access market, guild, mine, archive, route, ritual, or resource concession.         | Revocable, transferable, forged, inherited, or reputation-bound. |
| **Relationship Reward**   | Teaching, trust, alliance, follower, specialist, faction service.                   | Persists socially and may unlock material networks.              |
| **Infrastructure Reward** | Warehouse access, safe road, restored mine, ferry, gate, workshop, ward.            | Capability exists physically and can be damaged or lost.         |

# 31. Trade Networks, Supply, Demand, Routes and Regional Price Formation

Prices are derived summaries of physical and social conditions. The game does not need to simulate every coin exchange at all distances, but generated values must be explainable by production, stock, consumption, route cost, danger, law, preference, quality, and world state.

| **Price / Flow Input**     | **Effect**                                                                                                |
|----------------------------|-----------------------------------------------------------------------------------------------------------|
| **Local Production**       | Reliable surplus lowers price locally and creates exports; damage or labour loss reduces supply.          |
| **Settlement Consumption** | Population, jobs, projects, defence, food, culture, festivals, and emergencies create demand.             |
| **Stock and Storage**      | Warehouses buffer shocks; spoilage, fire, theft, contamination, or hoarding changes effective supply.     |
| **Route Cost**             | Distance, terrain, vehicle, port, gate, fuel, tariffs, maintenance, escort, and capacity add cost.        |
| **Danger and Reliability** | Raids, storms, monsters, war, realm instability, and seasonal closure raise risk premium or stop trade.   |
| **Culture and Preference** | Cuisine, faith, fashion, craftsmanship, taboo, prestige, and local substitutes change willingness to pay. |
| **Law and Diplomacy**      | Tax, embargo, monopoly, permit, alliance, contraband, occupation, and border status change access.        |
| **Quality and Provenance** | Condition, maker, origin, authenticity, age, legality, and story affect value.                            |
| **Market Memory**          | Recent shortages, gluts, disasters, manipulation, and restored routes change expectations gradually.      |

# 32. Markets, Merchants, Caravans, Warehouses, Contracts and Logistics

| **Market Actor / Structure**             | **Role**                                                                               | **Simulation Contract**                                          |
|------------------------------------------|----------------------------------------------------------------------------------------|------------------------------------------------------------------|
| **Household / Stall**                    | Small local production and direct consumption.                                         | Simple stock, schedule, prices, relationships.                   |
| **Specialist Merchant**                  | Curated goods linked to profession, culture, suppliers, and permissions.               | Restock through production/routes, not infinite registry access. |
| **Market Hall / Bazaar**                 | Aggregates local stalls, visiting traders, information, taxes, and culture goods.      | Summary stock with visible representative inventories.           |
| **Warehouse / Silo / Vault**             | Buffers bulk categories and reserves projects, emergencies, trade, and military stock. | Authoritative quantities, permissions, spoilage, ledgers.        |
| **Caravan / Ship / Train / Gate Convoy** | Moves physical or abstracted shipments between nodes.                                  | Origin, destination, cargo, route, escort, risk, loss, arrival.  |
| **Broker / Guild / Exchange**            | Matches contracts, concessions, credit, insurance, bulk sales, and specialist supply.  | Rules and reputation rather than magical teleportation of goods. |
| **Public Contract**                      | Requests delivery, extraction, transport, restoration, protection, or procurement.     | Exact quantities, quality, ownership, deadline, contribution.    |
| **Black Market / Fence**                 | Moves restricted, stolen, embargoed, forged, or dangerous goods.                       | Discovery, reputation, law, corruption, faction and price risk.  |

# 33. Currency, Barter, Credit, Taxes, Tithes, Tribute and Public Finance

| **Mechanism**                | **Use**                                                                                  | **Constraints**                                                       |
|------------------------------|------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| **Coin / Standard Currency** | Readable common exchange and prices where accepted.                                      | Mint, metal, authority, counterfeiting, exchange, weight abstraction. |
| **Barter**                   | Direct exchange where currency is scarce, culturally inappropriate, or goods are urgent. | Valuation, inventory, preference, trust, transport.                   |
| **Trade Credit**             | Deferred payment between trusted households, guilds, settlements, and factions.          | Records, default, reputation, collateral, law.                        |
| **Contract Token / Scrip**   | Bounded currency for guild, mine, military, festival, realm, or project.                 | Acceptance and redemption must be explicit.                           |
| **Tax / Tariff**             | Funds services, roads, guards, storage, ports, gates, and administration.                | Government, law, corruption, exemptions, player choice.               |
| **Tithe / Offering**         | Religious or cultural contribution in goods, labour, currency, or service.               | Belief, community, legitimacy; never ancestry-mandated.               |
| **Tribute**                  | Payment under treaty, protection, conquest, fear, or hierarchy.                          | Politics, resistance, rebellion, fairness, alternate story paths.     |
| **Public Stockpile**         | Non-currency wealth held for famine, siege, repair, disaster, or projects.               | Reservation, auditing, theft, spoilage, emergency override.           |

# 34. Strategic Resources, Monopolies, Embargoes, Smuggling and Conflict

| **Strategic Situation**    | **World Behaviour**                                                                          | **Player Choices**                                                                  |
|----------------------------|----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| **Natural Monopoly**       | One region controls a rare deposit, route, climate product, or realm anchor.                 | Trade, negotiate access, find substitute, survey elsewhere, support rival route.    |
| **Faction Concession**     | Law grants extraction or trade rights to a guild, temple, house, state, or settlement.       | Buy license, earn trust, challenge law, steal, expose corruption.                   |
| **Embargo / Sanction**     | Political relationship blocks selected goods, routes, technology, or realm materials.        | Diplomacy, smuggling, local production, substitute, war.                            |
| **Hoarding / Speculation** | Actor withholds stock expecting shortage or political leverage.                              | Investigate, regulate, compete, raid, negotiate, public relief.                     |
| **Smuggling Network**      | Moves restricted goods through hidden routes, false manifests, caches, or corrupt officials. | Join, expose, intercept, redirect, legitimise.                                      |
| **Resource War**           | Control of deposit, water, fuel, portal, relic, or trade corridor drives conflict.           | Protect civilians, mediate, choose faction, destroy asset, create alternate supply. |
| **Extraction Colonialism** | External power removes value while local ecology/society bears cost.                         | Resist, reform contract, share ownership, restore, exploit.                         |
| **Strategic Release**      | Stockpile or technology is deliberately released during disaster, war, or market collapse.   | Public good, profit, reputation, political consequence.                             |

# 35. Cultural and Settlement Economic Profiles

A settlement economy is assembled from environment, history, population, jobs, infrastructure, culture, law, faction, routes, threats, and realm access. Profiles are not rigid racial economies.

| **Profile Layer**          | **Generated Fields**                                                                                |
|----------------------------|-----------------------------------------------------------------------------------------------------|
| **Subsistence Base**       | Primary foods, water, fuel, housing materials, seasonal risks, household production.                |
| **Core Industries**        | Extraction, farming, forestry, fishing, craft, magic, services, administration, military, research. |
| **Inputs and Bottlenecks** | Materials, labour, tools, power, routes, knowledge, permits, specialists, storage.                  |
| **Exports**                | Surplus resources, refined materials, components, cultural goods, services, knowledge.              |
| **Imports**                | Unavailable climate goods, strategic parts, luxury, food buffer, realm materials, specialist tools. |
| **Preferences and Taboos** | Cuisine, faith, fashion, status, ethical restrictions, sacred resources, forbidden goods.           |
| **Public Reserves**        | Food, fuel, medicine, repair, guard, mana, seed, construction, emergency stock.                     |
| **Informal Economy**       | Household barter, salvage, mutual aid, smuggling, gifting, festival exchange.                       |
| **Growth Response**        | New route, automation, specialist, deposit, war, migration, or realm access changes the profile.    |

# 36. Dynamic Scarcity, Booms, Crashes, Disasters and World Events

| **Event Family**               | **Material Effect**                                                                           | **World Response**                                                |
|--------------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| **Harvest Failure**            | Food and fibre supply falls; seed stock and imports become strategic.                         | Prices, migration, relief contracts, unrest, substitute foods.    |
| **Resource Discovery**         | New vein, deposit, route, relic site, or technique increases expected supply.                 | Rush settlement, claims, roads, conflict, environmental pressure. |
| **Mine / Industry Collapse**   | Production stops and stored waste or hazards may escape.                                      | Rescue, shortage, unemployment, restoration, ownership dispute.   |
| **Trade Route Closure**        | Weather, war, monster, realm instability, bridge loss, or embargo interrupts flow.            | Rerouting, stock drawdown, convoy, repair, smuggling.             |
| **Market Boom**                | Fashion, war demand, new recipe, construction project, or realm opening raises demand.        | Investment, overextraction, labour migration, speculation.        |
| **Market Crash**               | Substitute, peace, route shift, overproduction, scandal, or loss of legitimacy reduces value. | Debt, abandonment, repurposing, political reaction.               |
| **Contamination / Corruption** | Stock, land, water, creatures, or infrastructure becomes unsafe.                              | Quarantine, cleansing, disposal, illicit sale, research.          |
| **Recovery / Restoration**     | Habitat, route, settlement, mine, workshop, or realm stabilises.                              | Renewed production, returning population, price normalisation.    |
| **Festival / Pilgrimage**      | Temporary demand for food, art, offerings, lodging, transport, and security.                  | Seasonal markets, culture goods, opportunity, shortages.          |

# 37. Ownership, Theft, Salvage, Claims, Restitution and Law

| **Legal / Social State**           | **Meaning**                                                                                  | **Possible Outcomes**                                             |
|------------------------------------|----------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| **Unclaimed Natural**              | No recognised owner under local law, though ecological/cultural restrictions may apply.      | Gather, protect, survey, claim, contest.                          |
| **Private / Household**            | Recognised person or household property.                                                     | Permission, purchase, theft, gift, inheritance, restitution.      |
| **Communal / Customary**           | Shared under village, clan, guild, faith, or traditional rules.                              | Quota, duty, taboo, negotiated access, conflict.                  |
| **Faction / State**                | Owned or regulated by political authority.                                                   | Tax, concession, embargo, seizure, public project.                |
| **Sacred / Protected**             | Custody is moral, religious, ecological, historical, or legal rather than purely commercial. | Pilgrimage, research permit, desecration, restoration.            |
| **Abandoned**                      | No active owner is present, but prior claims, descendants, law, or evidence may survive.     | Salvage, archaeology, restitution, occupation.                    |
| **Battlefield / Disaster Salvage** | Emergency recovery rights may differ from ordinary theft.                                    | Rescue priority, state claim, family claim, looting accusation.   |
| **Contested**                      | Several actors hold incompatible claims.                                                     | Court, diplomacy, quest, conflict, shared custody, player choice. |
| **Illicit / Stolen**               | Acquisition violates law or recognised claim.                                                | Fence, conceal, return, expose, keep, lose reputation.            |

# 38. Storage, Preservation, Spoilage, Insurance, Loss and Recovery

| **Concern**                 | **Rules**                                                                                                                             |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| **Storage Compatibility**   | Food, fuel, chemicals, mana, relics, explosives, living materials, and corrupted goods require appropriate containers and separation. |
| **Capacity and Throughput** | Slots, bulk capacity, stack rules, ports, access time, hauling, and simulation LOD remain visible and auditable.                      |
| **Preservation**            | Drying, cooling, salting, sealing, warding, stasis, atmosphere, humidity, pressure, and realm anchoring extend life.                  |
| **Spoilage / Degradation**  | Freshness, charge, corrosion, decay, contamination, leakage, curse spread, and document damage can be scaled by world settings.       |
| **Security**                | Locks, guards, wards, permissions, ledgers, concealment, insurance, and route escort reduce loss.                                     |
| **Loss Events**             | Fire, flood, raid, collapse, spoilage, theft, seizure, accident, portal failure, and abandonment create persistent evidence.          |
| **Insurance / Risk Pool**   | Guild, settlement, faction, or contract systems can compensate defined losses after verification.                                     |
| **Recovery**                | Salvage, repair, cleansing, search, restitution, rerouting, emergency reserves, and rebuilding restore value.                         |
| **Save Integrity**          | No stock is deleted because an area unloads; near/far conversion preserves authoritative quantities and reservations.                 |

# 39. UI, Accessibility, Inventory Trust, Codex and Player Feedback

| **Player Need**            | **Required Presentation**                                                                                                                         |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **Identify**               | Readable name, icon, model/texture, category, condition, ownership, hazard, and key use.                                                          |
| **Understand Source**      | Codex and inspection show known origin, biome/realm, producer, deposit clues, and harvest method.                                                 |
| **Understand Use**         | Recipe search, construction, village need, trade demand, magic, automation, repair, and quest links.                                              |
| **Understand Value**       | Local buy/sell context, recent trend, demand reason, legality, quality, provenance, and route risk where known.                                   |
| **Understand Consequence** | Renewability, depletion, contamination, protected status, spoilage, corruption, and extraction warning.                                           |
| **Trust Transactions**     | Clear quantities, reservations, ownership transfers, contribution ledgers, crafting inputs/outputs, and loss reason.                              |
| **Accessibility**          | Do not rely on colour alone for rarity, quality, hazard, legality, ownership, freshness, or charge. Use icons, labels, patterns, sound, and text. |
| **Information Control**    | Support compact tooltips, expanded inspection, comparison, filters, search, pinning, map layers, and configurable notifications.                  |
| **Uncertainty**            | Distinguish confirmed facts, estimates, rumours, cultural claims, outdated surveys, and undiscovered properties.                                  |

# 40. Overworld Resource and Material Registry v0.1

The following 84 foundations are parent-level content entries, not final item stacks or individual block variants. Each will later expand into deposits, block forms, raw items, refined materials, cultural variants, recipes, trade profiles, presentation assets, and balance values. All names and quantities remain production draft.

## 40.1 Wood, Fibre, Resin, Oil and Botanical Materials

| **ID**                     | **Foundation**  | **Primary Source**       | **Core World Role** | **Band** |
|----------------------------|-----------------|--------------------------|---------------------|----------|
| res.overworld.botanical.01 | Oak Heartwood   | Temperate forest         | Structural timber   | Variable |
| res.overworld.botanical.02 | Ironbark Timber | Old-growth woodland      | Heavy construction  | Variable |
| res.overworld.botanical.03 | Whitepine       | Cold forest              | Light framing       | Variable |
| res.overworld.botanical.04 | Blackwood       | Magical/deep forest      | Arcane craft        | Variable |
| res.overworld.botanical.05 | Willowreed      | Wetland or river edge    | Thatch/rope         | Variable |
| res.overworld.botanical.06 | Sunflax Fibre   | Managed field            | Textile             | Variable |
| res.overworld.botanical.07 | Mirehemp Fibre  | Marsh cultivation        | Cordage/filter      | Variable |
| res.overworld.botanical.08 | Resin Amber     | Resin-bearing trees      | Varnish/alchemy     | Variable |
| res.overworld.botanical.09 | Pitch Sap       | Conifer/industrial grove | Fuel/sealant        | Variable |
| res.overworld.botanical.10 | Corkbark        | Dry woodland             | Insulation          | Variable |
| res.overworld.botanical.11 | Dye Lichen      | Rock/forest surface      | Pigment             | Variable |
| res.overworld.botanical.12 | Alchemical Moss | Mana-rich shade          | Medicine/reagent    | Variable |

## 40.2 Food, Agriculture, Medicine and Consumable Inputs

| **ID**                       | **Foundation**   | **Primary Source**  | **Core World Role** | **Band** |
|------------------------------|------------------|---------------------|---------------------|----------|
| res.overworld.agriculture.01 | Hearthgrain      | Temperate fields    | Staple food         | Variable |
| res.overworld.agriculture.02 | Frostbarley      | Cold fields         | Cold staple/brewing | Variable |
| res.overworld.agriculture.03 | Sunmaize         | Warm plains         | Staple/feed         | Variable |
| res.overworld.agriculture.04 | Marsh Rice       | Wetland paddies     | Wetland staple      | Variable |
| res.overworld.agriculture.05 | Stonebean        | Dry uplands         | Protein crop        | Variable |
| res.overworld.agriculture.06 | Deepcap Mushroom | Caves/fungal farms  | Food/alchemy        | Variable |
| res.overworld.agriculture.07 | Sweetroot        | Loamy fields        | Sweetener/starch    | Variable |
| res.overworld.agriculture.08 | Redleaf Herb     | Forest margins      | Medicine            | Variable |
| res.overworld.agriculture.09 | Silvermint       | Cool riverbanks     | Food/medicine       | Variable |
| res.overworld.agriculture.10 | Bitterbloom      | Bogs/highlands      | Potent reagent      | Variable |
| res.overworld.agriculture.11 | Honeycomb        | Apiaries/wild hives | Food/wax            | Variable |
| res.overworld.agriculture.12 | Sea Kelp Meal    | Coasts/kelp farms   | Food/fertiliser     | Variable |

## 40.3 Earth, Stone, Clay, Salt and Glass Materials

| **ID**                   | **Foundation** | **Primary Source**   | **Core World Role** | **Band** |
|--------------------------|----------------|----------------------|---------------------|----------|
| res.overworld.mineral.01 | River Clay     | Riverbank            | Pottery             | Variable |
| res.overworld.mineral.02 | White Kaolin   | Weathered uplands    | Fine ceramics       | Variable |
| res.overworld.mineral.03 | Brick Loam     | Floodplain           | Brick               | Variable |
| res.overworld.mineral.04 | Peat Soil      | Bog/fen              | Soil/fuel           | Variable |
| res.overworld.mineral.05 | Silica Sand    | Coast/desert/river   | Glass               | Variable |
| res.overworld.mineral.06 | Salt Crystal   | Evaporite/brine      | Food/alchemy        | Variable |
| res.overworld.mineral.07 | Limestone      | Karst                | Lime/building       | Variable |
| res.overworld.mineral.08 | Granite        | Mountain pluton      | Heavy building      | Variable |
| res.overworld.mineral.09 | Slate          | Metamorphic highland | Roofing             | Variable |
| res.overworld.mineral.10 | Basalt         | Volcanic province    | Roads/forge         | Variable |
| res.overworld.mineral.11 | Marble         | Metamorphic quarry   | Prestige building   | Variable |
| res.overworld.mineral.12 | Obsidian       | Volcanic glass field | Tools/magic         | Variable |

## 40.4 Ores, Metals and Metallurgical Inputs

| **ID**               | **Foundation** | **Primary Source**            | **Core World Role**   | **Band** |
|----------------------|----------------|-------------------------------|-----------------------|----------|
| res.overworld.ore.01 | Copper Ore     | Hydrothermal veins            | Mechanisms/conductors | Variable |
| res.overworld.ore.02 | Tin Ore        | Granite belts                 | Bronze alloy          | Variable |
| res.overworld.ore.03 | Iron Ore       | Sedimentary/metamorphic belts | Tools/steel           | Variable |
| res.overworld.ore.04 | Lead Ore       | Deep veins                    | Shielding/chemistry   | Variable |
| res.overworld.ore.05 | Nickel Ore     | Mafic geology                 | Alloys                | Variable |
| res.overworld.ore.06 | Cobalt Ore     | Deep cobalt lodes             | Precision/pigment     | Variable |
| res.overworld.ore.07 | Silver Ore     | Veins/realm influence         | Magic/coin            | Variable |
| res.overworld.ore.08 | Gold Ore       | Veins/placer deposits         | Prestige/coin         | Variable |
| res.overworld.ore.09 | Star Iron Ore  | Impact sites                  | Rare alloy            | Variable |
| res.overworld.ore.10 | Bog Iron       | Wetlands                      | Local iron            | Variable |
| res.overworld.ore.11 | Magnetite      | Iron formations               | Iron/compass          | Variable |
| res.overworld.ore.12 | Cinnabar       | Volcanic belts                | Alchemy/hazard        | Variable |

## 40.5 Gems, Crystals and Mana-Bearing Materials

| **ID**                   | **Foundation**   | **Primary Source**    | **Core World Role**    | **Band** |
|--------------------------|------------------|-----------------------|------------------------|----------|
| res.overworld.crystal.01 | Clear Quartz     | Quartz veins          | Optics/runes           | Variable |
| res.overworld.crystal.02 | Garnet           | Metamorphic rock      | Abrasive/jewellery     | Variable |
| res.overworld.crystal.03 | Sapphire         | Alluvial/metamorphic  | Jewellery/magic        | Variable |
| res.overworld.crystal.04 | Ruby             | Metamorphic/igneous   | Jewellery/heat magic   | Variable |
| res.overworld.crystal.05 | Emerald          | Hydrothermal          | Jewellery/nature magic | Variable |
| res.overworld.crystal.06 | Opal             | Sedimentary/volcanic  | Trade/illusion         | Variable |
| res.overworld.crystal.07 | Diamond          | Deep mantle pipes     | Cutting/prestige       | Variable |
| res.overworld.crystal.08 | Raw Mana Crystal | Mana seams            | Mana infrastructure    | Variable |
| res.overworld.crystal.09 | Ley Crystal      | Leyline nexuses       | Ley devices            | Variable |
| res.overworld.crystal.10 | Thunder Glass    | Storm-struck silica   | Storm craft            | Variable |
| res.overworld.crystal.11 | Frost Pearl      | Cold waters/ice caves | Cold craft             | Variable |
| res.overworld.crystal.12 | Sunstone         | High-sun drylands     | Light/heat craft       | Variable |

## 40.6 Creature and Biological Material Families

| **ID**                    | **Foundation** | **Primary Source**     | **Core World Role** | **Band** |
|---------------------------|----------------|------------------------|---------------------|----------|
| res.overworld.creature.01 | Common Hide    | Managed/hunted fauna   | Leather             | Variable |
| res.overworld.creature.02 | Thick Fur      | Cold predators/herds   | Insulation          | Variable |
| res.overworld.creature.03 | Bone           | Carcass/shed remains   | Tools/alchemy       | Variable |
| res.overworld.creature.04 | Horn           | Horned fauna           | Tools/ritual        | Variable |
| res.overworld.creature.05 | Antler         | Seasonal shed          | Craft/trade         | Variable |
| res.overworld.creature.06 | Chitin         | Arthropods             | Armour/components   | Variable |
| res.overworld.creature.07 | Silk           | Spinners/cocoons       | Textile/machines    | Variable |
| res.overworld.creature.08 | Venom Sac      | Venomous fauna         | Alchemy/medicine    | Variable |
| res.overworld.creature.09 | Ink Gland      | Marine/cave fauna      | Ink/alchemy         | Variable |
| res.overworld.creature.10 | Shell Plate    | Armoured fauna         | Armour/building     | Variable |
| res.overworld.creature.11 | Spirit Essence | Spirits/ritual residue | Magic/ritual        | Variable |
| res.overworld.creature.12 | Elemental Core | Elemental entities     | Power/magitech      | Variable |

## 40.7 Fuel, Industrial, Strategic and Hazardous Materials

| **ID**                     | **Foundation**        | **Primary Source**       | **Core World Role**       | **Band** |
|----------------------------|-----------------------|--------------------------|---------------------------|----------|
| res.overworld.strategic.01 | Firewood              | Managed/wild timber      | Household fuel            | Variable |
| res.overworld.strategic.02 | Charcoal              | Kiln production          | Renewable industrial fuel | Variable |
| res.overworld.strategic.03 | Coal                  | Coal measures            | Industry/steel            | Variable |
| res.overworld.strategic.04 | Peat Fuel             | Bogs                     | Local fuel/soil           | Variable |
| res.overworld.strategic.05 | Oil Shale             | Sedimentary basins       | Fuel/chemistry            | Variable |
| res.overworld.strategic.06 | Lamp-Oil Seed         | Oilseed farms            | Lighting/oil              | Variable |
| res.overworld.strategic.07 | Sulphur               | Volcanic/evaporite       | Alchemy/explosives        | Variable |
| res.overworld.strategic.08 | Saltpetre             | Caves/soils/manure works | Preservation/explosives   | Variable |
| res.overworld.strategic.09 | Emberstone            | Geothermal zones         | Heat storage              | Variable |
| res.overworld.strategic.10 | Ancient Machine Scrap | Ruins/machine strata     | Salvage/research          | Variable |
| res.overworld.strategic.11 | Titan Bone            | Titan remains            | Wonder/structure material | Variable |
| res.overworld.strategic.12 | Corrupted Shard       | Corrupted zones          | Forbidden magic/hazard    | Variable |

# 41. Realm Resource Registry v0.1

Each realm receives six foundational resource families. These entries are deliberately distributed across biological, mineral, energetic, cultural, structural, and stabilisation roles so that no dimension becomes a single-ore excursion. Further realm-specific trade goods and relics appear in later sections.

| **ID**                             | **Realm**             | **Foundation**    | **Primary Role**                    | **Export Rule**              |
|------------------------------------|-----------------------|-------------------|-------------------------------------|------------------------------|
| res.realm.verdant_covenant.01      | Verdant Covenant      | Living Heartwood  | Structural / construction           | Native; stabilisation varies |
| res.realm.verdant_covenant.02      | Verdant Covenant      | Season Sap        | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.verdant_covenant.03      | Verdant Covenant      | Thornsilver Fibre | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.verdant_covenant.04      | Verdant Covenant      | Pollen Amber      | Optical / inscription               | Native; stabilisation varies |
| res.realm.verdant_covenant.05      | Verdant Covenant      | Memory Seed       | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.verdant_covenant.06      | Verdant Covenant      | Bloomstone        | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.ancestral_veil.01        | Ancestral Veil        | Ancestor Ash      | Structural / construction           | Native; stabilisation varies |
| res.realm.ancestral_veil.02        | Ancestral Veil        | Memory Glass      | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.ancestral_veil.03        | Ancestral Veil        | Oathbone          | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.ancestral_veil.04        | Ancestral Veil        | Veil Silk         | Optical / inscription               | Native; stabilisation varies |
| res.realm.ancestral_veil.05        | Ancestral Veil        | Grave Salt        | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.ancestral_veil.06        | Ancestral Veil        | Echo Pearl        | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.somnolent_expanse.01     | Somnolent Expanse     | Dream Mote        | Structural / construction           | Native; stabilisation varies |
| res.realm.somnolent_expanse.02     | Somnolent Expanse     | Nightmare Resin   | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.somnolent_expanse.03     | Somnolent Expanse     | Lucid Glass       | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.somnolent_expanse.04     | Somnolent Expanse     | Sleepbloom        | Optical / inscription               | Native; stabilisation varies |
| res.realm.somnolent_expanse.05     | Somnolent Expanse     | Memory Thread     | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.somnolent_expanse.06     | Somnolent Expanse     | Prophecy Ink      | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.aetheric_reach.01        | Aetheric Reach        | Stormglass        | Structural / construction           | Native; stabilisation varies |
| res.realm.aetheric_reach.02        | Aetheric Reach        | Cloudstone        | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.aetheric_reach.03        | Aetheric Reach        | Skyiron           | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.aetheric_reach.04        | Aetheric Reach        | Windspun Fibre    | Optical / inscription               | Native; stabilisation varies |
| res.realm.aetheric_reach.05        | Aetheric Reach        | Lightning Core    | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.aetheric_reach.06        | Aetheric Reach        | Sunmist           | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.impossible_deep.01       | Impossible Deep       | Pressure Pearl    | Structural / construction           | Native; stabilisation varies |
| res.realm.impossible_deep.02       | Impossible Deep       | Abyssal Iron      | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.impossible_deep.03       | Impossible Deep       | Seismic Crystal   | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.impossible_deep.04       | Impossible Deep       | Black Brine Salt  | Optical / inscription               | Native; stabilisation varies |
| res.realm.impossible_deep.05       | Impossible Deep       | Ventglass         | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.impossible_deep.06       | Impossible Deep       | Deepfire Ember    | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.world_engine.01          | World-Engine          | Logic Brass       | Structural / construction           | Native; stabilisation varies |
| res.realm.world_engine.02          | World-Engine          | Archive Crystal   | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.world_engine.03          | World-Engine          | Coolant Gel       | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.world_engine.04          | World-Engine          | Gearwood          | Optical / inscription               | Native; stabilisation varies |
| res.realm.world_engine.05          | World-Engine          | Prime Alloy       | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.world_engine.06          | World-Engine          | Machine Seed      | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.ashen_lower_realms.01    | Ashen Lower Realms    | Infernal Ash      | Structural / construction           | Native; stabilisation varies |
| res.realm.ashen_lower_realms.02    | Ashen Lower Realms    | Contract Iron     | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.ashen_lower_realms.03    | Ashen Lower Realms    | Ember Salt        | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.ashen_lower_realms.04    | Ashen Lower Realms    | Cinderhide        | Optical / inscription               | Native; stabilisation varies |
| res.realm.ashen_lower_realms.05    | Ashen Lower Realms    | Hellglass         | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.ashen_lower_realms.06    | Ashen Lower Realms    | Furnace Heart     | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.void_between.01          | Void Between          | Voidstone         | Structural / construction           | Native; stabilisation varies |
| res.realm.void_between.02          | Void Between          | Null Dust         | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.void_between.03          | Void Between          | Riftglass         | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.void_between.04          | Void Between          | Gravity Thread    | Optical / inscription               | Native; stabilisation varies |
| res.realm.void_between.05          | Void Between          | Echo Shard        | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.void_between.06          | Void Between          | Starless Oil      | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.divine_concords.01       | Divine Concords       | Celestial Metal   | Structural / construction           | Native; stabilisation varies |
| res.realm.divine_concords.02       | Divine Concords       | Halo Glass        | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.divine_concords.03       | Divine Concords       | Blessing Salt     | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.divine_concords.04       | Divine Concords       | Hymnstone         | Optical / inscription               | Native; stabilisation varies |
| res.realm.divine_concords.05       | Divine Concords       | Grace Thread      | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.divine_concords.06       | Divine Concords       | Covenant Wax      | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.necropolis_domains.01    | Necropolis Domains    | Soulbone          | Structural / construction           | Native; stabilisation varies |
| res.realm.necropolis_domains.02    | Necropolis Domains    | Grave Iron        | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.necropolis_domains.03    | Necropolis Domains    | Embalmer Resin    | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.necropolis_domains.04    | Necropolis Domains    | Mourning Silk     | Optical / inscription               | Native; stabilisation varies |
| res.realm.necropolis_domains.05    | Necropolis Domains    | Necrotic Salt     | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.necropolis_domains.06    | Necropolis Domains    | Deathglass        | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.elemental_confluences.01 | Elemental Confluences | Pyrestone         | Structural / construction           | Native; stabilisation varies |
| res.realm.elemental_confluences.02 | Elemental Confluences | Tideshard         | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.elemental_confluences.03 | Elemental Confluences | Gale Crystal      | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.elemental_confluences.04 | Elemental Confluences | Earthblood Ore    | Optical / inscription               | Native; stabilisation varies |
| res.realm.elemental_confluences.05 | Elemental Confluences | Frostglass        | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.elemental_confluences.06 | Elemental Confluences | Stormsap          | Stabilisation / realm compatibility | Native; stabilisation varies |
| res.realm.created_pockets.01       | Created Pockets       | Pocket Anchor     | Structural / construction           | Native; stabilisation varies |
| res.realm.created_pockets.02       | Created Pockets       | Boundary Chalk    | Energy / catalyst                   | Native; stabilisation varies |
| res.realm.created_pockets.03       | Created Pockets       | Folded Glass      | Fibre / flexible material           | Native; stabilisation varies |
| res.realm.created_pockets.04       | Created Pockets       | Time Sand         | Optical / inscription               | Native; stabilisation varies |
| res.realm.created_pockets.05       | Created Pockets       | Stable Core       | Biological / growth or memory       | Native; stabilisation varies |
| res.realm.created_pockets.06       | Created Pockets       | Pattern Clay      | Stabilisation / realm compatibility | Native; stabilisation varies |

# 42. Loot, Treasure and Reward Registry v0.1

These 60 foundations are contextual reward packages, not fixed chest contents. Each resolves into valid item, material, document, ownership, condition, and knowledge entries at runtime.

| **ID**                                  | **Family**                       | **Foundation**           | **Context Inputs**                                              | **Selection**   |
|-----------------------------------------|----------------------------------|--------------------------|-----------------------------------------------------------------|-----------------|
| loot.common_work_and_travel.01          | Common Work and Travel           | Worn Tool Bundle         | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.02          | Common Work and Travel           | Repairable Weapon        | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.03          | Common Work and Travel           | Mixed Coin Purse         | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.04          | Common Work and Travel           | Field Ration Pack        | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.05          | Common Work and Travel           | Trade Scrap Bundle       | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.06          | Common Work and Travel           | Cloth Roll Cache         | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.07          | Common Work and Travel           | Spare Parts Case         | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.08          | Common Work and Travel           | Uncut Gem Packet         | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.09          | Common Work and Travel           | Old Map Fragment         | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.10          | Common Work and Travel           | Inscribed Token Set      | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.11          | Common Work and Travel           | Medicinal Satchel        | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.common_work_and_travel.12          | Common Work and Travel           | Key Ring and Tags        | Profession, route, wealth, condition, recent activity           | Context grammar |
| loot.site_dungeon_and_ruin.01           | Site, Dungeon and Ruin           | Sealed Archive Cache     | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.02           | Site, Dungeon and Ruin           | Ritual Component Case    | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.03           | Site, Dungeon and Ruin           | Surveyor Chest           | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.04           | Site, Dungeon and Ruin           | Ancient Workshop Stores  | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.05           | Site, Dungeon and Ruin           | Burial Offering Set      | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.06           | Site, Dungeon and Ruin           | Smuggler Cache           | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.07           | Site, Dungeon and Ruin           | Collapsed Vault Debris   | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.08           | Site, Dungeon and Ruin           | Shrine Donation Box      | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.09           | Site, Dungeon and Ruin           | Explorer Remains Package | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.10           | Site, Dungeon and Ruin           | Collector Hoard          | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.11           | Site, Dungeon and Ruin           | Faction Pay Chest        | Site function, builder, occupant, history, state                | Context grammar |
| loot.site_dungeon_and_ruin.12           | Site, Dungeon and Ruin           | Forgotten Pantry         | Site function, builder, occupant, history, state                | Context grammar |
| loot.ecology_and_lair.01                | Ecology and Lair                 | Nest Material Bundle     | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.02                | Ecology and Lair                 | Predator Trophy Package  | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.03                | Ecology and Lair                 | Shed Carapace Cache      | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.04                | Ecology and Lair                 | Egg Clutch               | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.05                | Ecology and Lair                 | Hoarded Shiny Cache      | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.06                | Ecology and Lair                 | Venom Harvest Package    | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.07                | Ecology and Lair                 | Silk Cocoon Stores       | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.08                | Ecology and Lair                 | Bone Midden              | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.09                | Ecology and Lair                 | Elemental Residue Pool   | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.10                | Ecology and Lair                 | Spirit Offering Cache    | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.11                | Ecology and Lair                 | Pack Leader Trophy       | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.ecology_and_lair.12                | Ecology and Lair                 | Tamed Lineage Token      | Species ecology, lifecycle, habitat, non-lethal/lethal outcome  | Context grammar |
| loot.boss_siege_and_world.01            | Boss, Siege and World            | Commander Standard       | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.02            | Boss, Siege and World            | Siege Engine Core        | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.03            | Boss, Siege and World            | Titan Fragment           | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.04            | Boss, Siege and World            | Guardian Seal            | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.05            | Boss, Siege and World            | Sovereign Tribute        | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.06            | Boss, Siege and World            | Battle Plan Archive      | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.07            | Boss, Siege and World            | Unique Crafting Catalyst | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.08            | Boss, Siege and World            | Territory Key            | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.09            | Boss, Siege and World            | Settlement Relief Cache  | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.10            | Boss, Siege and World            | Realm Gate Component     | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.11            | Boss, Siege and World            | Faction Charter          | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.boss_siege_and_world.12            | Boss, Siege and World            | World Event Trophy       | Threat identity, territory, resolution, contribution, aftermath | Context grammar |
| loot.knowledge_social_and_relic_lead.01 | Knowledge, Social and Relic Lead | Recipe Folio             | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.02 | Knowledge, Social and Relic Lead | Language Primer          | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.03 | Knowledge, Social and Relic Lead | Historical Ledger        | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.04 | Knowledge, Social and Relic Lead | Research Notebook        | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.05 | Knowledge, Social and Relic Lead | Faction Credential       | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.06 | Knowledge, Social and Relic Lead | Land or Resource Deed    | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.07 | Knowledge, Social and Relic Lead | Salvage Writ             | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.08 | Knowledge, Social and Relic Lead | Trade Contract           | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.09 | Knowledge, Social and Relic Lead | Relic Provenance Record  | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.10 | Knowledge, Social and Relic Lead | Treasure Map             | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.11 | Knowledge, Social and Relic Lead | Creature Field Guide     | Culture, language, faction, archive, discovery state            | Context grammar |
| loot.knowledge_social_and_relic_lead.12 | Knowledge, Social and Relic Lead | Portal Calibration Notes | Culture, language, faction, archive, discovery state            | Context grammar |

# 43. Relic and Artifact Registry v0.1

The 36 foundations below define the identity and role of a unique or historically significant object. Every spawned relic receives a generated or authored provenance record, custody state, cultural interpretations, condition, and outcome hooks.

| **ID**                          | **Class**              | **Foundation**        | **Primary Meaning**                                     | **Persistence**                 |
|---------------------------------|------------------------|-----------------------|---------------------------------------------------------|---------------------------------|
| relic.civic_and_historical.01   | Civic and Historical   | Founder's Charter     | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.02   | Civic and Historical   | Broken Crown          | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.03   | Civic and Historical   | Treaty Stone          | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.04   | Civic and Historical   | Guildmaster Seal      | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.05   | Civic and Historical   | Pilgrim Bell          | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.06   | Civic and Historical   | Last Census           | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.07   | Civic and Historical   | Exile Banner          | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.08   | Civic and Historical   | City Key              | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.09   | Civic and Historical   | Ancestor Mask         | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.10   | Civic and Historical   | Victory Standard      | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.11   | Civic and Historical   | Lost Law Tablet       | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.civic_and_historical.12   | Civic and Historical   | Royal Astrolabe       | Legitimacy, memory, law, heritage, claim                | Seed reserved; custody persists |
| relic.functional_and_magical.01 | Functional and Magical | Ley Compass           | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.02 | Functional and Magical | Storm Crown           | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.03 | Functional and Magical | Rootheart Seed        | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.04 | Functional and Magical | Memory Lantern        | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.05 | Functional and Magical | Dream Mirror          | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.06 | Functional and Magical | Pressure Pearl Engine | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.07 | Functional and Magical | Archive Prism         | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.08 | Functional and Magical | Contract Chain        | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.09 | Functional and Magical | Void Anchor           | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.10 | Functional and Magical | Halo Forge            | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.11 | Functional and Magical | Soul Loom             | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.functional_and_magical.12 | Functional and Magical | Elemental Concordance | Infrastructure, navigation, ritual, realm compatibility | Seed reserved; custody persists |
| relic.unique_boss_and_world.01  | Unique, Boss and World | Titan Heart Shard     | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.02  | Unique, Boss and World | Realm Guardian Sigil  | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.03  | Unique, Boss and World | Living Dungeon Core   | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.04  | Unique, Boss and World | World-Machine Gear    | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.05  | Unique, Boss and World | First Flame Ember     | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.06  | Unique, Boss and World | Moon-Root Thorn       | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.07  | Unique, Boss and World | Dead Star Fragment    | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.08  | Unique, Boss and World | Ocean Crown           | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.09  | Unique, Boss and World | Sky Serpent Scale     | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.10  | Unique, Boss and World | Colossus Eye          | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.11  | Unique, Boss and World | Gatekeeper's Key      | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |
| relic.unique_boss_and_world.12  | Unique, Boss and World | Worldseed Vessel      | World-state, sovereign, titan, wonder, major route      | Seed reserved; custody persists |

# 44. Trade and Cultural Goods Registry v0.1

These 48 foundations are broad packaged-goods families. Cultures, settlements, workshops, realms, and content packs create variants through ingredients, technique, presentation, quality, provenance, and preference rather than duplicating the economic logic for every decorative name.

| **ID**                                | **Family**                    | **Foundation**          | **Typical Producers**                                         | **Market Logic**           |
|---------------------------------------|-------------------------------|-------------------------|---------------------------------------------------------------|----------------------------|
| good.everyday_and_settlement.01       | Everyday and Settlement       | Salted Fish             | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.02       | Everyday and Settlement       | Cured Meat              | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.03       | Everyday and Settlement       | Milled Flour            | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.04       | Everyday and Settlement       | Dried Fruit             | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.05       | Everyday and Settlement       | Cooking Oil             | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.06       | Everyday and Settlement       | Glazed Pottery          | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.07       | Everyday and Settlement       | Window Glass            | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.08       | Everyday and Settlement       | Candles                 | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.09       | Everyday and Settlement       | Soap                    | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.10       | Everyday and Settlement       | Paper Reams             | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.11       | Everyday and Settlement       | Rope Coils              | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.everyday_and_settlement.12       | Everyday and Settlement       | Iron Nails              | Households, farms, fisheries, common workshops                | Supply/demand + preference |
| good.luxury_and_artistic.01           | Luxury and Artistic           | Dyed Cloth              | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.02           | Luxury and Artistic           | Embroidered Textile     | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.03           | Luxury and Artistic           | Fine Leather Goods      | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.04           | Luxury and Artistic           | Woven Rugs              | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.05           | Luxury and Artistic           | Incense Blend           | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.06           | Luxury and Artistic           | Perfume Oil             | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.07           | Luxury and Artistic           | Spice Casket            | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.08           | Luxury and Artistic           | Tea and Infusion Bundle | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.09           | Luxury and Artistic           | Vintage Beverage        | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.10           | Luxury and Artistic           | Jewellery Set           | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.11           | Luxury and Artistic           | Lacquerware             | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.luxury_and_artistic.12           | Luxury and Artistic           | Carved Wood Art         | Specialist workshops, patrons, guilds, culture centres        | Supply/demand + preference |
| good.industrial_and_infrastructure.01 | Industrial and Infrastructure | Bronze Fittings         | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.02 | Industrial and Infrastructure | Iron Tool Set           | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.03 | Industrial and Infrastructure | Steel Plate Bundle      | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.04 | Industrial and Infrastructure | Gear Set                | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.05 | Industrial and Infrastructure | Bearing Case            | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.06 | Industrial and Infrastructure | Filter Cartridge        | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.07 | Industrial and Infrastructure | Pipe Bundle             | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.08 | Industrial and Infrastructure | Mana Battery            | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.09 | Industrial and Infrastructure | Rune Control Plate      | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.10 | Industrial and Infrastructure | Mana Lamp               | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.11 | Industrial and Infrastructure | Ward Maintenance Kit    | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.industrial_and_infrastructure.12 | Industrial and Infrastructure | Standard Repair Kit     | Foundries, machine shops, mage industry, public works         | Supply/demand + preference |
| good.realm_and_ceremonial.01          | Realm and Ceremonial          | Ancestor Candle         | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.02          | Realm and Ceremonial          | Dream Ink               | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.03          | Realm and Ceremonial          | Storm Silk              | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.04          | Realm and Ceremonial          | Abyssal Pearl Set       | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.05          | Realm and Ceremonial          | Logic Brass Instrument  | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.06          | Realm and Ceremonial          | Contract Paper          | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.07          | Realm and Ceremonial          | Voidproof Container     | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.08          | Realm and Ceremonial          | Celestial Icon          | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.09          | Realm and Ceremonial          | Funerary Mask           | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.10          | Realm and Ceremonial          | Elemental Pigment Set   | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.11          | Realm and Ceremonial          | Living Seedcraft        | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |
| good.realm_and_ceremonial.12          | Realm and Ceremonial          | Pocket-Space Casket     | Realm specialists, temples, gate trade, cross-realm workshops | Supply/demand + preference |

# 45. Material Ecology, Processing, Loot and State Module Libraries

Modules are reusable authored behaviours referenced by resource, reward, relic, structure, biome, creature, and realm entries. They reduce duplicated design while preserving specific overrides.

| **Module ID**                        | **Name**                 | **Function**                                                                                   |
|--------------------------------------|--------------------------|------------------------------------------------------------------------------------------------|
| module.material.surface_scatter      | Surface Scatter          | Small readable objects distributed across a valid surface.                                     |
| module.material.shallow_vein         | Shallow Vein             | Accessible early vein with surface clues and bounded depth.                                    |
| module.material.deep_lode            | Deep Lode                | Large high-value body requiring survey, access, hauling, and support.                          |
| module.material.placer_deposit       | Placer Deposit           | Water- or gravity-sorted sediment concentration.                                               |
| module.material.biological_stand     | Biological Stand         | Patch population with density, season, recovery, and habitat.                                  |
| module.material.managed_crop         | Managed Crop             | Cultivated resource with seed, labour, soil, water, pests, and harvest.                        |
| module.material.migratory_stock      | Migratory Stock          | Resource availability follows creature or ecological migration.                                |
| module.material.seasonal_bloom       | Seasonal Bloom           | Short availability window controlled by season or magical cycle.                               |
| module.material.renewable_node       | Renewable Node           | Persistent source with capacity, rate, maintenance, and damage.                                |
| module.material.finite_cache         | Finite Cache             | Non-renewing stored stock created by history, site, or event.                                  |
| module.material.realm_leak           | Realm Leak Deposit       | Overworld anomaly producing unstable realm material.                                           |
| module.material.unique_reservation   | Unique Reservation       | Save-level reservation preventing duplicate unique content.                                    |
| module.process.hand_preparation      | Hand Preparation         | Simple cleaning, cutting, sorting, grinding, or bundling.                                      |
| module.process.beneficiation         | Beneficiation            | Mechanical concentration that improves grade and creates tailings.                             |
| module.process.thermal_refining      | Thermal Refining         | Firing, smelting, roasting, drying, distilling, or annealing.                                  |
| module.process.biological_refining   | Biological Refining      | Fermentation, curing, composting, culturing, or symbiotic processing.                          |
| module.process.magical_stabilisation | Magical Stabilisation    | Purification, binding, grounding, warding, or attunement.                                      |
| module.process.precision_crafting    | Precision Crafting       | Quality-sensitive fabrication using specialist station and skill.                              |
| module.process.restoration           | Restoration              | Condition and provenance-aware conservation or functional repair.                              |
| module.process.waste_recovery        | Waste Recovery           | Returns salvage, by-products, cullet, scrap, compost, or residue.                              |
| module.loot.context_slot             | Context Slot Grammar     | Fills a reward slot from compatible source, owner, function, and state.                        |
| module.loot.unique_fallback          | Unique Reward Fallback   | Replaces unavailable unique reward with clue, fragment, or alternate path.                     |
| module.state.depleted_memory         | Depleted Site Memory     | Preserves evidence, history, recovery, and economic effects after exhaustion.                  |
| module.loot.outcome_dependent        | Outcome-Dependent Reward | Changes reward composition according to kill, surrender, bargain, restore, or cleanse outcome. |

## 45.1 Dynamic Scarcity, Depletion and Market States

| **State ID**      | **State**    | **Primary Effect**                                                          |
|-------------------|--------------|-----------------------------------------------------------------------------|
| state.material.01 | Abundant     | High local supply; lower scarcity pressure and increased export potential.  |
| state.material.02 | Normal       | Expected stock, yield, price, and ecological pressure.                      |
| state.material.03 | Scarce       | Low effective supply; higher demand, substitute use, and conflict risk.     |
| state.material.04 | Exhausted    | Source no longer produces until recovery, restoration, or new discovery.    |
| state.material.05 | Recovering   | Source regains capacity under protected or managed conditions.              |
| state.material.06 | Contaminated | Unsafe or lower-quality output requiring treatment or quarantine.           |
| state.material.07 | Corrupted    | Magically altered stock with hazard, forbidden use, or spreading risk.      |
| state.material.08 | Purified     | Hazard removed or reduced; may lose power and gain legitimacy.              |
| state.material.09 | Flooded      | Access, quality, equipment, route, and safety are altered by water.         |
| state.material.10 | Frozen       | Seasonal access and preservation improve while extraction becomes harder.   |
| state.material.11 | Occupied     | Faction, creature, settlement, military, or site authority controls access. |
| state.material.12 | Embargoed    | Legal trade blocked across named factions or routes.                        |
| state.material.13 | Monopolised  | One actor controls most legitimate supply or access.                        |
| state.material.14 | Smuggled     | Goods circulate through illicit routes, hidden stock, and risk premiums.    |
| state.material.15 | Booming      | Rapid demand, investment, migration, and extraction pressure.               |
| state.material.16 | Collapsed    | Demand, route, production, legitimacy, or price has failed sharply.         |
| state.material.17 | Hoarded      | Available stock is deliberately withheld from normal circulation.           |
| state.material.18 | Rediscovered | Lost source, technique, route, or stock re-enters knowledge and trade.      |

# 46. Visual, Audio, VFX, Forge and Presentation Requirements

| **Asset / Presentation Layer** | **Requirements**                                                                                                                                                        |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **World Material**             | Base 32x32-compatible texture family, geometry behaviour, natural variation, wet/dry, damage, grade, purity, corruption, season, cultural extraction evidence, and LOD. |
| **Item Form**                  | Readable silhouette/icon, held/placed representation, stack presentation, condition, quality, ownership, hazard, charge, and provenance markers.                        |
| **Deposit and Node**           | Surface clue, exposed form, depleted form, active extraction, machinery sockets, particles, sound, and environmental footprint.                                         |
| **Processed Material**         | Raw/intermediate/refined variants, recipe station placement, by-products, waste, packaging, and storage forms.                                                          |
| **Loot and Container**         | Container type, ownership and faction motifs, condition, open/empty/looted states, trap/ward sockets, contextual contents presentation.                                 |
| **Relic**                      | Distinct silhouette, material palette, inscriptions, damage/restoration states, active/inactive VFX, sockets, display mount, carry/install scale, and Codex portrait.   |
| **Trade Good**                 | Packaging, bundle/crate/barrel form, regional/cultural variant hooks, quality and spoilage states, market display.                                                      |
| **Audio**                      | Harvest impact, tool loop, extraction ambience, machine process, container, coin/goods handling, relic resonance, hazard warning, and market soundscape.                |
| **VFX**                        | Dust, chips, sparks, fluid, mana leakage, contamination, purity, spoilage, charge, stabilisation, portal compatibility, and restoration.                                |
| **Sockets and Events**         | Tool contact, drop point, harvest output, machine port, container hinge, relic activation, attachment, display, hit, break, repair, and effect anchors.                 |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Forge Boundary<br />
</strong>24J defines asset families, variation dimensions, functional states, sockets, and event hooks. The Forge document set owns authoring tools, model/texture workflows, animation authoring, validation, export, and later audio/VFX production modules. Atlas entries must be buildable without embedding tool-specific assumptions in gameplay data.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 47. Simulation LOD, Persistence, Multiplayer and Godot/Summer Engine Direction

| **Technical Concern**      | **Locked Direction**                                                                                                                                                  |
|----------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Definitions**            | Immutable Godot Resources or imported registry definitions use stable namespace IDs and parent/module references.                                                     |
| **Runtime Stocks**         | Authoritative records store quantity, quality bands, condition, ownership, reservation, contamination, charge, expiry, and provenance only where needed.              |
| **Near Simulation**        | Visible blocks, drops, containers, machines, NPC carrying, merchants, caravans, and item movement operate at detailed local simulation.                               |
| **Far Simulation**         | Settlements, routes, deposits, markets, caravans, and dungeons use bounded aggregate ticks that conserve quantities and preserve key events.                          |
| **Promotion / Demotion**   | Conversion between detailed and abstract states preserves stocks, reservations, unique objects, owners, damage, spoilage, and history.                                |
| **Determinism**            | Seed and definition version resolve placement and initial stocks; runtime deltas record extraction, trade, loss, restoration, and world events.                       |
| **Multiplayer Authority**  | Server/host validates harvesting, containers, loot claims, crafting, trade, relic custody, warehouse access, reservations, and market actions.                        |
| **Contribution**           | Projects, sieges, bosses, trade contracts, restoration, and public stock use auditable contribution records and configurable reward rules.                            |
| **Save Safety**            | Journals and transaction boundaries protect against duplication, deletion, rollback exploits, and unique relic loss.                                                  |
| **Summer Engine Workflow** | AI-assisted implementation consumes validated documents and registry schemas in bounded tasks; generated code/content must pass deterministic tests and human review. |

# 48. Data Models, Stable IDs, Validation and Content-Pack Rules

## 48.1 Core Resource Definition

| **Field Group**    | **Required Fields**                                                                                                   |
|--------------------|-----------------------------------------------------------------------------------------------------------------------|
| **Identity**       | resource_id, display_name_key, description_key, category, subcategory, parent_id, tags, content_pack, status.         |
| **World Origin**   | realm_ids, region/biome suitability, geology/ecology/history sources, producer IDs, structure/dungeon/creature links. |
| **Availability**   | season, depth/elevation, state requirements, rarity band, density, exclusion, uniqueness, progression fallback.       |
| **Extraction**     | tool/skill/knowledge, method, labour, permit, hazard, yield model, grade/purity, damage/consequence.                  |
| **Transformation** | raw item/block IDs, processing families, recipe links, by-products, waste, stabilisation, recycling.                  |
| **Use and Demand** | recipe, building, automation, magic, village need, culture, trade, quest, repair, realm, strategic uses.              |
| **Economy**        | base value band, bulk unit, storage, spoilage, legality, preference tags, export/import profiles.                     |
| **Presentation**   | texture/model/icon families, sounds, VFX, sockets, clues, variants, state visuals.                                    |

## 48.2 Loot, Relic and Trade Records

| **Record**           | **Additional Fields**                                                                                                                                    |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Loot Grammar**     | grammar_id, source families, slot definitions, conditions, owner/function/state filters, quantity bands, uniqueness, fallback, outcome variants.         |
| **Relic Definition** | relic_id, class, unique scope, generated/authored provenance, claims, custody, condition, restoration, activation, world effects, succession/loss rules. |
| **Trade Good**       | good_id, component resources, producer profiles, consumer profiles, packaging, quality, spoilage, preference, route and legality tags.                   |
| **Runtime Stock**    | holder_id, location_id, item/resource IDs, quantity, quality/condition bands, ownership, reservation, expiry, contamination, transaction revision.       |
| **Market Summary**   | market_id, stock bands, production/consumption, route capacity/cost, danger, tax, law, preference, recent shocks, price band.                            |
| **Provenance Event** | object_id, event_type, actor/location/time, prior/new owner, legitimacy, condition change, public/known state.                                           |

## 48.3 Stable ID Examples

| **Namespace**        | **Pattern**                       | **Example**                          |
|----------------------|-----------------------------------|--------------------------------------|
| **Resource**         | res.\<realm\>.\<family\>.\<name\> | res.overworld.ore.copper             |
| **Material State**   | state.material.\<name\>           | state.material.contaminated          |
| **Loot Grammar**     | loot.\<context\>.\<name\>         | loot.dungeon.archive_cache           |
| **Relic**            | relic.\<class\>.\<name\>          | relic.functional.ley_compass         |
| **Trade Good**       | good.\<family\>.\<name\>          | good.industrial.ward_maintenance_kit |
| **Module**           | module.\<domain\>.\<name\>        | module.process.magical_stabilisation |
| **Market Profile**   | market.\<scope\>.\<name\>         | market.settlement.frontier_importer  |
| **Provenance Event** | prov.\<event\>                    | prov.restored                        |

# 49. Completeness Contracts, Content Budgets and Production Gates

| **Content Type**               | **Minimum Relationship Contract**                                                                                                                                       |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Major Overworld Biome**      | Common survival materials; construction family; food/medicine; one strategic or specialist resource; creature materials; depletion/recovery; trade hooks; visual clues. |
| **Major Realm Biome**          | Native material web; stabilisation; survival/infrastructure use; native demand; export consequence; dungeon/boss links; Overworld utility.                              |
| **Culture Family**             | Foods, textiles, crafts, common goods, luxury, tools/components, material preferences/taboos, trade profile, variants, and hybridisation rules.                         |
| **Settlement Archetype**       | Subsistence, inputs, outputs, storage, public reserves, route needs, shortages, industrial goods, emergency demand, and market roles.                                   |
| **Creature Family**            | Ecological role, non-lethal and/or lethal resource logic, legal/ethical tags, harvesting knowledge, processing, trade/use, and population consequence.                  |
| **Dungeon Family**             | Function stock, occupant stock, historical material, ecology, containers, knowledge rewards, relic chance/lead, state-dependent loot, restoration value.                |
| **Boss / Titan**               | Contextual reward, alternate outcome rewards, unique reservation if needed, material use, territory key/knowledge, aftermath, succession.                               |
| **Structure / Infrastructure** | Construction materials, operating inputs, maintenance goods, storage, outputs/services, salvage, ownership, damage/loss, restoration.                                   |
| **Resource Foundation**        | Origin, availability, recognition, extraction, transformation, use, demand, trade, consequence, states, presentation, technical record.                                 |

## 49.1 v0.1 Registry Budget

| **Registry**                        | **Foundation Count** | **Purpose**                                                                                                       |
|-------------------------------------|----------------------|-------------------------------------------------------------------------------------------------------------------|
| **Overworld Resource and Material** | 84                   | Seven broad families covering survival, construction, agriculture, industry, magic, creatures, fuel, and hazards. |
| **Realm Resource**                  | 72                   | Six foundations for each of twelve major realms.                                                                  |
| **Loot, Treasure and Reward**       | 60                   | Context packages for work/travel, sites, ecology, bosses/events, and knowledge/social rewards.                    |
| **Relic and Artifact**              | 36                   | Civic/historical, functional/magical, and unique world-scale objects.                                             |
| **Trade and Cultural Goods**        | 48                   | Everyday, luxury, industrial, realm, and ceremonial packaged goods.                                               |
| **Reusable Modules**                | 24                   | Distribution, processing, restoration, loot, uniqueness, and aftermath behaviours.                                |
| **Dynamic States**                  | 18                   | Scarcity, depletion, environment, control, market, and rediscovery states.                                        |

## 49.2 Production Gates

- No definition enters Integrated status without stable IDs, source relationships, uses, presentation requirements, and fallback validation.

- No biome, realm, culture, settlement, dungeon, boss, or structure package passes Atlas validation while its material and reward slots remain empty or generic.

- No unique relic can be selected without a reservation scope, loss/recovery rule, provenance record, and save migration strategy.

- No market profile can generate infinite stock without a defined producer, import abstraction, replenishment rate, or explicit sandbox setting.

- No extraction or processing chain can silently duplicate or delete quantity across near/far simulation.

- No forbidden or hazardous material can ship without readable warnings, storage rules, consequences, and accessible presentation.

- Automated seed tests must confirm progression access, distribution diversity, resource exclusions, unique placement, trade connectivity, and absence of POC fixtures.

# 50. Balancing, Ethics, Anti-Exploitation and Quality Rules

| **Rule**                        | **Locked Direction**                                                                                                                                                 |
|---------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Usefulness Over Ladder**      | Tier and rarity do not erase older materials. Preserve repair, infrastructure, culture, trade, substitution, and specialist uses.                                    |
| **Context Over Volume**         | Fewer meaningful reward families with strong relationships are better than thousands of detached items.                                                              |
| **Consequence Proportionality** | Extraction and economy consequences scale with pressure, method, location, settings, knowledge, and mitigation.                                                      |
| **No Ancestry Essentialism**    | Goods, jobs, resources, law, wealth, and technology belong to cultures, histories, environments, factions, and individuals - not immutable ancestry traits.          |
| **Personhood Safeguard**        | Sapient beings are not generic resource nodes. Any remains, essence, ownership, labour, or constructed-person content receives explicit ethical and legal treatment. |
| **No Forced Killing**           | Key progression should usually support trade, salvage, research, surrender, alliance, restoration, substitute, or non-lethal sampling where appropriate.             |
| **Anti-Duplication**            | Authoritative transactions, reservations, container revisions, unique records, and save journals prevent duplication and rollback exploits.                          |
| **Anti-Market Exploit**         | Price changes use bounded response, transaction cost, stock, route capacity, and actor knowledge; trivial buy/sell loops are invalid.                                |
| **Player Trust**                | UI states why an item changed, spoiled, was reserved, was illegal, lost value, became contaminated, or could not transfer.                                           |
| **World Settings**              | Players may scale spoilage, depletion, market volatility, theft consequences, ecological pressure, and extraction hazards without breaking registry logic.           |

# 51. Cross-Document Revision and Registry Migration Plan

| **Document / Area**                     | **Required Revision**                                                                                                                                                                     |
|-----------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00-02 Vision, Loop, Progression**     | Replace POC examples with seed-driven material access, contextual rewards, trade routes, realm materials, and multiple progression sources.                                               |
| **03 Blocks Registry**                  | Expand all Atlas resource block families, nodes, deposits, depleted states, storage, hazard, realm, cultural, and extraction evidence.                                                    |
| **04 Items Registry**                   | Create item forms for 24J resources, goods, loot packages, relics, documents, containers, provenance, condition, legality, and trade metadata.                                            |
| **05 Recipe Registry**                  | Add processing, preservation, stabilisation, restoration, recycling, cultural-good, realm, relic, packing, and substitute recipes.                                                        |
| **06 Resource Progression**             | Replace POC scope with the Atlas material web and revise the ladder so realm, cultural, strategic, and old-material identities remain explicit.                                           |
| **07-09 NPC, Automation, Magic**        | Add settlement demand profiles, market stocks, contracts, warehouses, extraction labour, logistics, processing, stabilisation, mana fuels, forbidden handling, and near/far transactions. |
| **10-12 Creatures, Biomes, Structures** | Replace POC entries with Atlas ecology, biome/resource suitability, dungeon rewards, structure inputs/outputs, deposits, salvage, and dynamic states.                                     |
| **13-17 Peoples through UI**            | Connect culture goods, law, trade, realm resources, quests/events, boss rewards, ownership, provenance, Codex, maps, and accessible inspection.                                           |
| **18 Technical Implementation**         | Rewrite Unreal-specific content for Godot/Summer Engine and adopt the authoritative resource, stock, market, provenance, unique, transaction, and validation contracts defined here.      |
| **24A-24I Atlas**                       | Backfill resource, reward, trade, relic, construction, maintenance, and scarcity links into every applicable entry.                                                                       |
| **Content Databases**                   | Retire POC-only IDs or mark them archive-only; migrate reusable families to stable production IDs and provide save/content-pack aliases where needed.                                     |

# 52. Open Questions for Later Production

- What exact progression bands and numerical yield/price curves will replace the old POC balance values after the complete Atlas and block/item registries are populated?

- Which resources are common to every valid world preset, and which may be supplied entirely by substitutes, trade, salvage, or realm routes?

- How much individual provenance should common equipment retain before save cost and UI complexity outweigh narrative value?

- Which relics are authored uniques, which are generated historical uniques, and which support bounded copies?

- How detailed should currency exchange, credit, insurance, taxation, and public finance become before the economy distracts from the sandbox?

- Which extraction consequences are default, difficulty-scaled, optional, or reserved for specific biomes, factions, realms, and forbidden materials?

- How should multiplayer ownership and fair distribution work for unique relics, public bosses, shared settlements, museums, and realm keys?

- Which markets update continuously, daily, seasonally, on route arrival, or only through bounded distant simulation ticks?

- How much automated production can be abstracted while still showing believable jobs, inputs, outputs, maintenance, waste, and transport?

- Which resource and trade-good families require dedicated models versus icon/texture/package variants generated through the Forge?

- How should mod/content packs add resources and markets without destabilising progression guarantees, unique reservations, save migration, or regional economies?

- Which historical goods, sacred materials, remains, and relics require additional cultural sensitivity review before final lore and production?

# Appendix A. Registry Field Templates

## A.1 Resource Definition Template

| **Field**                              | **Type / Example**                                                    | **Required**  |
|----------------------------------------|-----------------------------------------------------------------------|---------------|
| **resource_id**                        | Stable namespace ID                                                   | Yes           |
| **display_name_key / description_key** | Localisation keys                                                     | Yes           |
| **parent_id / tags**                   | Inheritance and filtering                                             | Yes           |
| **category / subcategory**             | Taxonomy                                                              | Yes           |
| **origin_links**                       | Biome, realm, geology, ecology, culture, creature, structure, history | Yes           |
| **availability_rules**                 | Season, depth, state, density, rarity, exclusion                      | Yes           |
| **node/deposit_profile**               | Scatter, vein, lode, stand, node, stock, cache                        | Yes           |
| **grade_purity_quality**               | Bands and variation axes                                              | As applicable |
| **extraction_contract**                | Tool, skill, knowledge, labour, permission, hazard, yield             | Yes           |
| **processing_links**                   | Recipes, stations, power, by-products, waste, recycling               | Yes           |
| **use_links**                          | Items, blocks, villages, trade, magic, automation, quests, realm      | Yes           |
| **renewability / consequence**         | Recovery, depletion, contamination, world state                       | Yes           |
| **economy_fields**                     | Bulk unit, value band, storage, legality, preference                  | Yes           |
| **presentation_fields**                | Block/item/icon/model/sound/VFX/socket/state families                 | Yes           |
| **planning_status**                    | Concept to Released                                                   | Yes           |

## A.2 Loot Grammar Template

| **Field**          | **Description**                                                                    |
|--------------------|------------------------------------------------------------------------------------|
| **grammar_id**     | Stable reward grammar ID.                                                          |
| **source_context** | Creature, site, room, owner, boss, event, structure, caravan, cache.               |
| **required_slots** | Guaranteed contextual categories when valid.                                       |
| **optional_slots** | Weighted compatible categories.                                                    |
| **filters**        | Culture, faction, profession, realm, function, history, state, outcome, condition. |
| **quantity_bands** | Bounded amounts by source scale and world settings.                                |
| **uniqueness**     | Save, region, site, actor, or unrestricted scope.                                  |
| **fallback**       | Clue, fragment, substitute path, alternate source, or world-state reward.          |
| **ownership**      | Prior owner, current claim, legality, witnesses, restitution.                      |
| **presentation**   | Container/evidence, reveal, inspection, notification, Codex.                       |
| **validation**     | Progression, duplication, context, no-empty, and no-POC-fixture checks.            |

## A.3 Relic Runtime Record Template

| **Field**                             | **Description**                                                       |
|---------------------------------------|-----------------------------------------------------------------------|
| **relic_instance_id**                 | Unique save-level identity.                                           |
| **definition_id**                     | Relic foundation reference.                                           |
| **provenance_seed / authored record** | Generated or authored history.                                        |
| **current_owner / custody**           | Person, settlement, faction, structure, world, contested.             |
| **location / installed_target**       | Inventory, display, vault, dungeon, wonder, gate, lost.               |
| **condition / restoration**           | Damage, contamination, missing parts, conservation, repair.           |
| **knowledge states**                  | Player and faction interpretations, authenticity, decoded properties. |
| **claims / legitimacy**               | Legal, cultural, religious, ancestral, political claims.              |
| **activation state**                  | Charge, calibration, attunement, risk, cooldown, world links.         |
| **event history**                     | Major transfers, theft, restoration, use, destruction, recovery.      |
| **succession / fallback**             | Replacement, fragment, heir, replica, alternate access, none.         |

# Appendix B. Cross-System Relationship Matrix

| **Atlas Entry**       | **Blocks / Items / Recipes**                             | **NPC / Economy**                               | **Magic / Automation**                             | **World / Story**                                 |
|-----------------------|----------------------------------------------------------|-------------------------------------------------|----------------------------------------------------|---------------------------------------------------|
| **Natural Resource**  | Block/node/item forms; gathering and processing recipes. | Jobs, warehouses, concessions, trade, needs.    | Machine extraction, power, mana compatibility.     | Biome, geology, ecology, depletion, events.       |
| **Creature Resource** | Item forms, preservation, anatomy-linked processing.     | Hunting law, husbandry, welfare, trade.         | Essence, alchemy, work beasts, containment.        | Population, lairs, ecology, personhood, quests.   |
| **Trade Good**        | Packaged item and production recipe.                     | Producer, consumer, route, market, preference.  | Industrial or magical production and storage.      | Culture, diplomacy, shortages, festivals.         |
| **Loot Grammar**      | Contextual item/resource/document slots.                 | Owner, faction, profession, legitimacy.         | Cores, components, wards, machine stock.           | Dungeon, boss, structure, history, outcome.       |
| **Relic**             | Unique item/block/installed form; restoration recipes.   | Claims, custody, legitimacy, museum, diplomacy. | Artifact function, realm gate, wonder integration. | History, quest, faction, boss, world-state.       |
| **Strategic Stock**   | Bulk items, storage and project reservations.            | Public finance, military, contracts, shortages. | Fuel, mana, maintenance, network capacity.         | War, siege, disaster, route, settlement survival. |

# Appendix C. Content Validation and Seed-Test Checklist

- All resource, loot, relic, trade-good, module, and state IDs are unique, namespaced, resolvable, and versioned.

- Every major biome and realm has valid survival, construction, ecology, strategic, dungeon/boss, trade, and dynamic-state material links.

- Generated starts can reach required capabilities through local resources, valid substitutes, trade, salvage, NPC teaching, or exploration without fixed POC coordinates.

- No retired Forest Hamlet, watchtower, goblin-raid, mana-pocket, or POC chest identifiers appear in production generation pools.

- Every deposit respects geology/biome/realm suitability, exclusion, density, and repetition limits.

- Every renewable resource has habitat, recovery, pressure, and damaged-state rules; every finite source has depletion and aftermath.

- Every realm material has native demand, safe handling or stabilisation as applicable, route rules, and lasting non-realm use.

- Every creature material passes personhood, ecology, welfare, legal, and acquisition-method validation.

- Every contextual loot grammar has at least one valid resolution and a fallback when unique or filtered content is unavailable.

- Unique relic reservations cannot duplicate, vanish on unload, or become permanently progression-blocking without an alternate path.

- Near/far simulation conserves quantities, reservations, ownership, condition bands, spoilage, contamination, unique objects, and material events.

- Markets cannot create infinite stock without production/import abstraction and cannot delete shipments without a recorded cause.

- Prices remain bounded, explainable, and resistant to trivial circular buy/sell exploits.

- All hazards, legality, ownership, rarity, quality, freshness, charge, and uncertainty states have non-colour indicators.

- Save migration tests cover renamed IDs, removed content packs, registry changes, unique relic aliases, and POC archive retirement.

# Appendix D. Example Regional Material-Ecology Assembly

| **Layer**                 | **Generated Example: Stormreef Trade March**                                                                                                                       |
|---------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Region**                | Windward volcanic coast with kelp shelves, basalt headlands, storm routes, deep harbour, and damaged ancient lighthouse network.                                   |
| **Natural Materials**     | Basalt, silica sand, salt crystal, sulphur, coastal clay, stormglass traces, kelp, fish, shell plate, lamp-oil seed imports.                                       |
| **Settlements**           | Harbour town exports salted fish, rope, glass, storm instruments, and basalt; imports grain, timber, iron, medicine, and mana batteries.                           |
| **Infrastructure Demand** | Breakwaters, lighthouse lenses, rope, sailcloth, iron fittings, filters, ward kits, repair stone, fuel, and emergency food.                                        |
| **Ecology Pressure**      | Overfishing and storm damage reduce marine stock; protected spawning coves and managed kelp farms enable recovery.                                                 |
| **Strategic Asset**       | A stormglass reef and stable Aetheric route attract guild concession, smugglers, scholars, and rival faction claims.                                               |
| **Dungeons / Sites**      | Flooded customs vault, wreck reef, volcanic glass mine, ruined signal tower, hidden smuggler caves.                                                                |
| **Boss / Event Reward**   | Storm serpent can be driven away, bargained with, studied, or killed; outcomes grant route safety, shed scale, storm research, guardian pact, or territory change. |
| **Dynamic States**        | Storm season closes routes; damaged lighthouse raises loss; restored network lowers risk and expands markets; embargo diverts cargo to smugglers.                  |

# Appendix E. Example Loot and Relic Resolution

| **Resolution Step**    | **Example: Restored Archive Citadel**                                                                                                                            |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Context**            | Ancient civic archive, partially occupied by a modern faction, damaged by fire, containing public records, sealed vaults, and a dormant archive mechanism.       |
| **Source Grammar**     | Archive rooms use record, ink, map, key, office supply, civic relic lead, damaged furniture, and faction-stock slots.                                            |
| **State Filters**      | Fire damage lowers paper condition; occupied rooms add current rations, tools, pay chests, orders, and ownership.                                                |
| **Player Outcome**     | Negotiation grants supervised research and copies; conquest grants physical stock but creates stolen/custody states; restoration unlocks public archive service. |
| **Unique Check**       | Royal Astrolabe is reserved elsewhere in this seed, so the vault provides a provenance record and map to its current site rather than a duplicate.               |
| **Relic Found**        | Lost Law Tablet with disputed claims from the local council, a displaced culture, and a scholar guild.                                                           |
| **Restoration Choice** | Conserve burn marks for historical evidence, restore readable sections, or magically reconstruct missing law at risk of introducing false memory.                |
| **World Reward**       | Archive service improves maps, legal claims, relic authentication, settlement governance, and future dungeon interpretation.                                     |

# Appendix F. Production Acceptance Criteria

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Definition of Done for 24J v0.1<br />
</strong>The document is accepted as the production Atlas foundation when its taxonomies, relationship rules, registry foundations, modules, data fields, validation contracts, and cross-document revisions can support fully seed-generated material ecologies and contextual rewards without any POC-specific content or fixed world arrangement.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Acceptance Area**         | **Pass Criteria**                                                                                                                                                                                       |
|-----------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Post-POC World**          | No normal generation rule depends on Forest Hamlet, its residents, its watchtower, fixed goblin raid, fixed resource chain, or guaranteed POC site.                                                     |
| **Atlas Coverage**          | Resources, loot, relics, trade goods, markets, ownership, extraction, processing, realm compatibility, dynamic states, and presentation are covered.                                                    |
| **Registry Scale**          | 84 Overworld, 72 realm, 60 loot, 36 relic, 48 trade-good, 24 module, and 18 state foundations are present with stable draft IDs.                                                                        |
| **Cross-System Integrity**  | Every content family can link to blocks, items, recipes, biomes, creatures, societies, dungeons, bosses, structures, quests, UI, saves, and technical implementation.                                   |
| **Living World**            | Material flows can create shortages, trade, construction, maintenance, restoration, conflict, ecological change, political claims, and persistent history.                                              |
| **Player Freedom**          | Progression and rewards support gathering, crafting, trade, salvage, research, restoration, diplomacy, automation, exploration, non-lethal resolution, conquest, and forbidden paths with consequences. |
| **Technical Safety**        | Stable IDs, authoritative quantities, reservations, provenance, unique records, deterministic selection, near/far conservation, multiplayer validation, and migration rules are defined.                |
| **Accessibility and Trust** | All important material, ownership, legality, quality, hazard, freshness, charge, and uncertainty information is readable without colour alone.                                                          |
| **Production Handoff**      | 24K can reference material events, relic histories, trade crises, discoveries, wars, disasters, and persistent economic world states without redesigning 24J.                                           |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Next Atlas Volume<br />
</strong>[[24K - World History, Story Arcs, Events and Dynamic World States Atlas]] - World History, Story Arcs, Events and Dynamic World States will use 24J resources, relics, trade networks, shortages, discoveries, extraction conflicts, disasters, and economic aftermath as authored causes and evidence within generated history and live world events.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

---
## Navigation
- Previous: [[24I - Structures, Landmarks, Routes, Wonders and World Infrastructure Atlas|24I]]
- Next: [[24K - World History, Story Arcs, Events and Dynamic World States Atlas|24K]]
- Index: [[00 - Document Set 24 Index]]
