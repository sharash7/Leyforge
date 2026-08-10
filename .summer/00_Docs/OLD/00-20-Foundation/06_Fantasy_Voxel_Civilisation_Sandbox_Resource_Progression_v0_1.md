**Fantasy Voxel Civilisation Sandbox**

**06 - Resource Progression**

*Version 0.1 - Detailed Design Bible Draft*

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Resource Progression Statement</strong></p>
<p>A database-ready resource progression system for a high-fidelity fantasy voxel civilisation sandbox, where materials are not simple upgrade steps: they are survival supplies, construction inputs, machine parts, village needs, trade goods, magical catalysts, strategic assets, forbidden substances, and dimension keys.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Field**       | **Locked Direction**                                                                                                                                                                                                                                      |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope  | Ore tiers, materials, fuels, magical resources, side materials, organic resources, monster drops, cultural goods, refinement chains, resource nodes, village use, and POC resource scope.                                                                 |
| Core Philosophy | Use a hybrid ladder: some direct upgrades exist, but every major material keeps a unique long-term identity.                                                                                                                                              |
| Material Ladder | Keep Wood -\> Stone -\> Copper -\> Iron -\> Steel -\> Mana Crystal -\> Arcane Alloy -\> Mythril -\> Voidstone -\> Celestial Metal, while adding side materials such as Bronze, Silver, Gold, gems, clay, glass, fibre, leather, cloth, and culture goods. |
| POC Direction   | Prove survival basics, copper mechanisms, iron settlement support, basic mana infrastructure, automated village supply, and the watchtower defence loop.                                                                                                  |
| Data Direction  | Every resource should have database-friendly fields, unique IDs, categories, tiers, rarity, source, refinement path, connected systems, and planning status.                                                                                              |

# Document Purpose

This document defines how resources progress across the Fantasy Voxel Civilisation Sandbox. It explains where materials come from, how they are gathered, how they are refined, what they unlock, why older materials remain useful, how resources feed villages and automation, and how magical and dimensional resources expand the world over time.

It does not replace the Blocks Registry, Items Registry, Crafting and Recipe Registry, Automation System, Magic System, Village/NPC System, Economy System, World Generation document, or Dimensions document. Instead, it creates the resource-facing rules those later systems can reference.

## Design Source

| **Source Document**               | **Relevant Direction**                                                                                                                                   | **How This Resource Document Uses It**                                                                                      |
|-----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible     | The main hook is that magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                                 | Resources are treated as world-facing inputs for villages, machines, magic, stories, trade, defence, and realm progression. |
| 01 - Core Gameplay Loop           | The primary loop is explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                  | Resource chains are organised by what they let the player do next in that loop.                                             |
| 02 - Player Progression System    | Progression is multi-track: materials, skills, recipes, magic, automation, villages, reputation, exploration, dimensions, and morality.                  | Material progression is not the only progression path, but it remains one of the most readable early game anchors.          |
| 03 - Blocks Registry              | Resource blocks include veins, biome/depth logic, large automation deposits, surface clues, poor/normal/rich grades, magical purity, and resource nodes. | Resource entries track both mineable block forms and long-term extraction/deposit behaviour.                                |
| 04 - Items Registry               | Resources exist as raw items, refined materials, machine parts, magic components, village goods, loot, knowledge, and dimension materials.               | Resource entries map to item forms, stack behaviour, rarity, quality, and use tags.                                         |
| 05 - Crafting and Recipe Registry | Recipes transform gathered resources into tools, blocks, machines, food, magic components, village supplies, repairs, rituals, and dimension keys.       | Resource progression defines the major input/output chains that recipes will formalise.                                     |

## Static Table of Contents

- 1\. Locked Resource Progression Identity

- 2\. Player Answer Decision Summary

- 3\. Resource System Architecture

- 4\. Parent Resource Data Model

- 5\. Resource Categories, Families, and Tags

- 6\. Material Ladder and Progression Bands

- 7\. Core Material Identity Rules

- 8\. Side Materials and Utility Branches

- 9\. Ore, Deposit, Node, and Prospecting Rules

- 10\. Refinement, By-products, and Processing

- 11\. Fuel and Power Material Progression

- 12\. Tools, Harvesting Gates, and Magic-Assisted Gathering

- 13\. Automation and Bulk Supply Progression

- 14\. Village, Economy, and Strategic Resource Use

- 15\. Magic Resource Progression

- 16\. Monster, Organic, Cultural, and Forbidden Resources

- 17\. Dimension and Realm Resource Families

- 18\. Proof-of-Concept Resource Scope

- 19\. Detailed Resource Registry v0.1

- 20\. Core Resource Chains

- 21\. Balancing Rules

- 22\. Open Questions for Later Documents

- Appendix A. POC Resource Checklist

- Appendix B. Resource Database Field Template

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Resource Family Backlog

# 1. Locked Resource Progression Identity

Resource progression is the material backbone of the game. It starts with simple survival resources and expands into civilisation-scale supply chains, magical infrastructure, strategic faction assets, and realm-shaping endgame materials. The system should remain readable like a voxel sandbox while supporting deeper fantasy, automation, NPC economy, and story consequences.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Rule</strong></p>
<p>A resource should never be only a stronger version of a previous resource. Every major material should have a long-term identity through construction, repair, tools, automation, village needs, magic, trade, culture, quests, dimensions, or world-state change.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**   | **Design Meaning**                                                                                                         | **Player-Facing Result**                                        |
|----------------------|----------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| Survival Supply      | Wood, stone, fibre, food, clay, sand, coal, and water support the first shelter, tools, fire, storage, and basic crafting. | The player understands material collection immediately.         |
| Crafting Web         | Raw resources convert into refined materials, components, fuels, station inputs, by-products, and repair materials.        | Production chains feel readable and expandable.                 |
| Civilisation Input   | Villages request and consume real resources for food, repairs, buildings, defence, tools, trade, and culture.              | Materials visibly change settlements and NPC survival.          |
| Automation Feedstock | Copper, iron, steel, coal, glass, rubber-like organics, mana, and refined parts feed machines and logistics.               | Factories scale resource supply beyond hand gathering.          |
| Magic Catalyst       | Mana crystals, dust, runes, monster essences, silver, gems, and rare reagents power wards, rituals, machines, and spells.  | Magic becomes practical infrastructure.                         |
| Strategic Asset      | Some materials become politically valuable, illegal, contested, or culture-defining.                                       | Resources create trade, diplomacy, conflict, and moral choices. |
| Dimensional Key      | Voidstone, dream glass, fae seeds, infernal ash, celestial metal, and other realm resources unlock higher systems.         | New dimensions add lasting overworld utility.                   |

# 2. Player Answer Decision Summary

The following table converts the selected multiple-choice answers into locked resource-system decisions for this document.

| **Area**                | **Locked Decision**                                                                                                                                                         |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Scope                   | Define ore tiers, materials, fuels, magical resources, organic resources, monster drops, culture goods, refinement chains, village use, and POC scope.                      |
| Detail Level            | Include first-pass draft values and planning notes, clearly marked as balance draft.                                                                                        |
| Progression Philosophy  | Use a hybrid model: direct upgrades exist, but major resources keep unique functions.                                                                                       |
| Old Materials           | Older materials remain useful through repairs, construction, recipes, culture variants, automation inputs, and village needs.                                               |
| Data Format             | Use database/spreadsheet-ready resource fields and unique IDs.                                                                                                              |
| Material Ladder         | Keep the locked ladder and add side materials like Bronze, Silver, and Gold without disrupting the main ladder.                                                             |
| Mana Crystal Role       | Mana Crystal is a parallel magic resource that begins mid-game and stays useful forever.                                                                                    |
| Steel Role              | Steel gates stronger frames, pressure systems, regional industry, and larger projects, but not all automation.                                                              |
| Arcane Alloy            | Arcane Alloy is the first true magitech material, combining metal, mana, and rune processing.                                                                               |
| Mythril                 | Mythril is a lightweight magical metal for gear, conduits, precision tools, and high-tier enchantment.                                                                      |
| Voidstone               | Voidstone is a dangerous dimensional material for portals, unstable machines, void storage, and high-risk magic.                                                            |
| Celestial Metal         | Celestial Metal is an endgame civilisation material for world-shaping structures, floating cities, realm-scale machines, and major artifacts.                               |
| Resource Categories     | Use natural, ore, refined, fuel, magic, organic, monster, dimension, culture, and trade categories.                                                                         |
| Non-Ore Materials       | Wood, stone, clay, sand, glass, fibre, leather, cloth, and food are part of resource progression.                                                                           |
| Monster Drops           | Monster drops support alchemy, magic, gear, trophies, rituals, and faction resources.                                                                                       |
| Cultural Resources      | Cultures can produce or prefer special goods, materials, and refinements.                                                                                                   |
| Strategic Resources     | Certain resources matter politically and economically.                                                                                                                      |
| Ore Generation          | Use simple veins, biome/depth rules, large deposits, and surface clues.                                                                                                     |
| Automation Deposits     | Large deposits exist for automation and are separate from small hand-mined veins.                                                                                           |
| Blocks and Nodes        | Mineable resource blocks and long-term resource nodes both exist.                                                                                                           |
| Surface Clues           | Surface clues such as exposed colour, crystal glows, mineral plants, ruins, vents, and stains guide prospecting.                                                            |
| Ore Grades              | Poor, normal, and rich grades affect yield and by-products.                                                                                                                 |
| Magical Purity          | Purity affects mana yield, ritual stability, corruption risk, and crafting quality.                                                                                         |
| Raw Ore Flow            | Ore Block -\> Raw Ore -\> Ingot or refined material is the standard flow.                                                                                                   |
| By-products             | Refining can produce slag, ash, dust, chips, residue, sawdust, shard fragments, and similar outputs.                                                                        |
| By-product Use          | Some by-products are useful, while not every by-product needs deep use.                                                                                                     |
| Early Refinement        | Early refinement is moderate: furnace first, then optional crusher/sawmill/forge improves yield.                                                                            |
| Advanced Refining       | Advanced resources can require crusher, furnace, forge, rune table, mana furnace, alchemy table, and other stations.                                                        |
| Fuel Categories         | Use biological, fossil, mechanical, magical, alchemical, dimensional, and portal/leyline fuels.                                                                             |
| Coal Use                | Coal remains useful for fuel, steel, filters, explosives, trade, and NPC industry.                                                                                          |
| Charcoal                | Charcoal is a renewable early fuel from wood.                                                                                                                               |
| Mana Fuel               | Mana crystals fuel mana machines, mana furnaces, wards, conduits, and rituals.                                                                                              |
| Leylines                | Leyline energy is late-game static world infrastructure requiring placement strategy.                                                                                       |
| Dimensional Fuels       | Risky but powerful dimensional fuels exist, such as void shards, infernal ash, deep forge embers, and dream motes.                                                          |
| Tool Gates              | Tools unlock both harder blocks and new interactions.                                                                                                                       |
| Special Tools           | Hammer, wrench, rune tuner, rune chisel, sickle, prospecting tool, and survey lens exist.                                                                                   |
| Prospecting             | Prospecting uses simple early clues and better tools later.                                                                                                                 |
| Magic Gathering         | Magic improves gathering but supports rather than replaces tools.                                                                                                           |
| Automation Start        | Automation begins at Copper tier.                                                                                                                                           |
| Early Automation        | Early automation is mechanical first: chutes, cranks, water/wind, and copper mechanisms.                                                                                    |
| Automation Yield        | Basic automation reduces labour; advanced processing improves yield.                                                                                                        |
| Extraction Consequences | Automated extraction can create optional/scalable consequences such as noise, pollution, instability, corruption, or faction concern.                                       |
| Village Warehouse Input | Village warehouses accept automated input after trust or permission is earned.                                                                                              |
| Village Material Use    | Every major material should support at least construction, tools, repairs, trade, defence, or culture.                                                                      |
| Exact Project Resources | Villages consume exact stored resources for projects.                                                                                                                       |
| Supply and Demand       | Scarcity and cultural preference affect trade value.                                                                                                                        |
| Forbidden Resources     | Forbidden resources such as blood catalysts, necromantic bone cores, corrupted shards, and cursed metals exist.                                                             |
| Physical Mana           | Mana progression uses Raw Mana Crystal -\> Mana Shard -\> Mana Dust -\> Runes/Cores/Batteries.                                                                              |
| Runes                   | Runes can exist as items, block inscriptions, machine upgrades, and ritual components.                                                                                      |
| Magic Risk              | Unstable, forbidden, void, blood, shadow, and corrupted resources can carry corruption risk.                                                                                |
| Mage Economy            | Mages, wards, temples, libraries, and magical industries request magic resources.                                                                                           |
| Dimension Families      | Major dimensions get full resource families; minor dimensions can have smaller sets.                                                                                        |
| Overworld Utility       | Dimension materials remain useful in machines, magic, village upgrades, construction, rituals, and stories.                                                                 |
| Race-Linked Resources   | Race-linked dimensions have resources tied to culture, stories, buildings, rituals, and specialists.                                                                        |
| Stabilisation           | Some dimension resources need refining, cleansing, binding, cooling, purifying, or warding before use.                                                                      |
| POC Resources           | POC requires wood, stone, clay, sand, coal, copper, iron, mana crystal, fibre, and food basics.                                                                             |
| Steel POC Scope         | Steel is deferred to Alpha.                                                                                                                                                 |
| Late Resource POC Scope | Voidstone, Mythril, and Celestial Metal can appear as teaser fragments/lore only, not full systems.                                                                         |
| Main POC Chain          | POC proves Iron Ore -\> Iron Ingot -\> Watchtower/Village Defence.                                                                                                          |
| POC Magic Chain         | POC includes Mana Crystal -\> Mana Shard/Dust -\> Basic Rune/Ward Core/Mana Furnace.                                                                                        |
| Resource Fields         | Every entry tracks ID, display name, category, tier, rarity, source, refinement path, uses, connected systems, village use, automation use, magic use, and planning status. |
| Old Material Notes      | Each resource can include notes explaining how it stays useful.                                                                                                             |
| Internal IDs            | Use database-style IDs such as resource.ore.raw_iron, material.ingot.iron, and resource.crystal.raw_mana.                                                                   |
| Connected Systems       | Track survival, crafting, building, automation, village, magic, trade, quest, dimension, and combat links explicitly.                                                       |

# 3. Resource System Architecture

The resource system should be data-driven. The player sees readable materials, while the game tracks categories, tiers, families, source rules, refinement paths, uses, village needs, automation compatibility, magic properties, and realm links.

| **Layer**                | **Purpose**                                                                                        | **Examples**                                                                             |
|--------------------------|----------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Base Resource Definition | Parent record all resource entries inherit from.                                                   | ID, display name, category, rarity, tier, tags, source, uses.                            |
| Category/Subcategory     | Readable organisation and gameplay rules.                                                          | Ore / Metal, Natural / Wood, Magic / Mana, Dimension / Void.                             |
| Material Family          | Shared behaviour, substitution, construction variants, and recipe compatibility.                   | Wood, stone, copper, iron, steel, mana, silver, glass, voidstone.                        |
| World Source Layer       | Where and how the resource appears.                                                                | Surface harvest, underground vein, rich deposit, creature drop, village good, dimension. |
| Refinement Path          | How raw material becomes useful outputs.                                                           | Raw ore -\> ingot -\> plate -\> gear; mana crystal -\> shard -\> dust -\> rune.          |
| Connected Systems        | Links to blocks, items, recipes, NPCs, automation, magic, economy, quests, combat, and dimensions. | Village request, machine input, ward fuel, quest key, trade good.                        |
| Runtime State            | Quality, purity, grade, corruption, temperature, freshness, charge, or stability when needed.      | Rich copper ore, impure mana crystal, unstable void shard, fresh herb.                   |
| Planning Metadata        | Documentation-only fields not required in shipped game data.                                       | POC Required, Alpha, Final Game, Placeholder, Deferred.                                  |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Important Data Rule</strong></p>
<p>POC status, Alpha status, placeholder status, and balance-draft notes are planning columns. They should not be hard gameplay properties inherited by the resource itself. Shipped resource data should remain clean and reusable.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 4. Parent Resource Data Model

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                                | **Example Children**                                           |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| BaseResource                  | Core identity, display name, internal ID, category, family, rarity, tier, tags, value, unlock method, and scope.       | Every resource.                                                |
| NaturalResource               | Surface gather rules, biome tags, seasonality, tool preference, regrowth/renewal, village value.                       | Oak Log, Plant Fibre, Clay Lump, Berries, Reed.                |
| OreResource                   | Stone host, depth/biome rules, tool gate, grade, raw ore drop, by-products, prospecting clues.                         | Raw Copper Ore, Raw Iron Ore, Silver Ore, Mythril Vein.        |
| RefinedMaterial               | Station requirement, family, tier, quality compatibility, recipe roles, trade use, NPC consumption.                    | Iron Ingot, Copper Wire, Stone Brick, Glass Pane.              |
| FuelResource                  | Burn time, power type, pollution/risk, station compatibility, by-product, renewable/fossil/dimensional classification. | Charcoal, Coal, Mana Shard, Infernal Ash.                      |
| MagicResource                 | Mana charge, school affinity, purity, corruption risk, ritual role, rune compatibility, ward/machine use.              | Mana Dust, Basic Rune, Wisp Essence, Ward Core.                |
| OrganicResource               | Spoilage, harvesting tool, animal/plant source, food/medicine/alchemy roles, NPC need tags.                            | Leather, Hide, Herb, Bone, Mushroom, Grain.                    |
| MonsterDropResource           | Creature source, rarity, trophy state, alchemy/magic role, faction value, fear/legality tags.                          | Goblin Ear, Wisp Core, Spider Silk, Boss Heart.                |
| CultureResource               | Producer culture, preferred culture, reputation hooks, trade demand, recipe variants, symbolic meaning.                | Dwarven Tool Bundle, Elven Livingwood Sap, Goblin Scrap Charm. |
| ForbiddenResource             | Moral risk, legality, corruption, faction reaction, dark recipe role, disposal/cleansing path.                         | Blood Catalyst, Cursed Shard, Necromantic Bone Core.           |
| DimensionResource             | Realm source, stabilisation rule, overworld utility, hazard, story significance, portal/machine/ritual role.           | Voidstone Shard, Dream Glass, Fae Seed, Celestial Fragment.    |

## 4.1 Example Parent Inheritance

| **Example**     | **Inheritance Chain**                                                           | **What It Gains Automatically**                                                                           |
|-----------------|---------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Raw Iron Ore    | BaseResource -\> OreResource -\> MetalOre -\> IronFamily                        | Pickaxe requirement, depth rules, raw ore drop, smelting path, iron-tier tags, village-use tags.          |
| Copper Wire     | BaseResource -\> RefinedMaterial -\> MetalComponent -\> CopperFamily            | Copper-tier branch, machine recipes, wiring compatibility, stack/value rules, old-material usefulness.    |
| Mana Dust       | BaseResource -\> MagicResource -\> ManaFamily -\> DustVariant                   | Mana charge value, purity tags, rune recipe compatibility, mage economy use, corruption checks if impure. |
| Voidstone Shard | BaseResource -\> DimensionResource -\> Forbidden/UnstableVariant -\> VoidFamily | Stabilisation requirement, portal role, corruption risk, high trade value, faction concern.               |

# 5. Resource Categories, Families, and Tags

Every resource should have a primary category, optional subcategory, material family where applicable, and multiple tags. Categories help players and designers navigate the registry. Tags help recipes, NPCs, machines, magic, UI filters, search, and save data.

| **Top-Level Category**      | **Purpose**                                                                                        | **Examples**                                                             |
|-----------------------------|----------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Natural Resources           | Basic materials gathered from terrain, plants, water, trees, soil, and surface nodes.              | Logs, sticks, fibre, clay, sand, reeds, berries, herbs.                  |
| Ore Resources               | Mineable metals, minerals, stone-hosted materials, crystal veins, and automation deposits.         | Copper ore, iron ore, coal, silver ore, mana crystal ore.                |
| Refined Materials           | Processed outputs used for tools, blocks, machines, trade, gear, repairs, and village projects.    | Ingots, plates, rods, wires, bricks, glass, cloth, leather.              |
| Fuel Resources              | Materials that provide heat, machine power, mana power, ritual power, or risky dimensional energy. | Wood, charcoal, coal, mana shard, alchemical oil, void fuel.             |
| Magic Resources             | Mana-bearing, spell-affinity, rune, essence, catalyst, ward, and ritual resources.                 | Mana dust, basic rune, wisp essence, ward core, elemental shard.         |
| Organic Resources           | Plant, animal, fungal, fibre, food, medicine, and biological crafting resources.                   | Grain, mushrooms, herbs, leather, hide, bone, silk.                      |
| Monster Resources           | Drops from hostile, neutral, boss, dungeon, magical, or faction creatures.                         | Goblin scrap, spider silk, wisp core, boss heart, trophy fang.           |
| Dimension Resources         | Realm-specific resources that remain useful in the overworld.                                      | Voidstone, fae seed, dream glass, infernal ash, celestial fragment.      |
| Culture Resources           | Culture-produced or culture-preferred goods, refinements, symbols, and trade materials.            | Dwarven rivets, elven living sap, temple incense, goblin salvage.        |
| Trade / Strategic Resources | High-value, politically important, or supply-sensitive goods.                                      | Salt, gems, silver, gold, medicine, steel, mana crystals, food reserves. |

| **Tag Type** | **Example Tags**                                                                                                                      | **Used By**                                                        |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Progression  | primitive, wood-tier, stone-tier, copper-tier, iron-tier, steel-tier, mana-tier, arcane-tier, mythril-tier, void-tier, celestial-tier | Recipe book, tool gates, progression UI, tutorial hints.           |
| Material     | wood, stone, metal, copper, iron, steel, glass, fibre, leather, cloth, crystal, rune, organic, corrupted                              | Recipes, substitutions, village requests, crafting filters.        |
| Source       | surface, cave, deep, biome-forest, biome-desert, village, monster, dungeon, ruin, dimension, node                                     | World generation, loot tables, prospecting, codex.                 |
| System       | survival, crafting, building, automation, village-use, magic, trade, quest, dimension, combat, repair                                 | Cross-system logic and registry search.                            |
| Risk         | flammable, spoilable, unstable, cursed, forbidden, corrupting, explosive, poisonous, hot, freezing                                    | Warnings, difficulty settings, faction reaction, hazard behaviour. |
| Economy      | currency, trade-good, luxury, staple, shortage-sensitive, culture-good, strategic, contraband                                         | Supply/demand, village stores, caravans, faction markets.          |

# 6. Material Ladder and Progression Bands

The ladder is readable, but not purely linear. Wood and stone are survival foundations. Copper starts mechanisms. Iron supports settlements and defence. Steel scales industry. Mana is a parallel magic infrastructure branch. Arcane Alloy fuses machinery and magic. Mythril supports high-tier magical precision. Voidstone introduces dangerous dimensional logistics. Celestial Metal supports world-shaping endgame projects.

| **Band**                         | **Core Resources**                                                                  | **Player Capability**                                                               | **World / Village Impact**                                                           |
|----------------------------------|-------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Tier 0 - Primitive Survival      | Sticks, plant fibre, loose stone, berries, basic food, thatch, flint-like stones.   | First tools, torches, emergency shelter, first food, simple repairs.                | NPCs value basic food, fibre, and emergency supplies in camps.                       |
| Tier 1 - Wood and Stone          | Logs, planks, stone, cobblestone, clay, sand, charcoal, basic crops.                | Workbench, furnace, shelter, storage, stone tools, basic farms.                     | Villages can repair huts, create storage, start early projects, and stabilise food.  |
| Tier 2 - Copper Mechanisms       | Copper ore, ingots, wire, plates, gears, rods, bronze side branch.                  | First machines, cranks, chutes, water/wind mechanisms, sawmill, basic wiring.       | Villages can improve workshops, mills, roads, and early production.                  |
| Tier 3 - Iron Settlement Support | Iron ore, ingots, nails, rods, plates, guard equipment, reinforced fittings.        | Stronger tools, weapons, armour, village defence, watchtower chain.                 | Fortifications, guard gear, blacksmith projects, and raid outcomes improve.          |
| Tier 4 - Steel and Industry      | Steel ingots, reinforced frames, pressure parts, advanced plates, industrial bolts. | Regional production, stronger machines, pumps, pressure systems, advanced armour.   | Towns can build strong walls, industrial workshops, and larger projects.             |
| Parallel - Mana Infrastructure   | Mana crystals, shards, dust, runes, ward cores, mana batteries.                     | Mana furnace, wards, runes, mana conduits, magic utility, mage economy.             | Villages gain wards, mage buildings, magic lights, ritual projects, and story gates. |
| Tier 6 - Arcane Alloy            | Mana-infused metal, arcane circuits, rune-bound plates, hybrid cores.               | True magitech machines, advanced conduits, hybrid tools, arcane automation.         | Cities and factions can support magic-powered infrastructure.                        |
| Tier 7 - Mythril                 | Light magical metal, mythril wire, mythril mesh, high-tier catalysts.               | Precision tools, high enchantment capacity, lightweight gear, stable conduits.      | Specialist cultures and high-tier mages unlock refined projects.                     |
| Tier 8 - Voidstone               | Voidstone shard, void dust, stabilised void plate, void core.                       | Portals, void storage, risky machines, dimensional logistics, dangerous rituals.    | Factions fear, regulate, exploit, or outlaw its use.                                 |
| Tier 9 - Celestial Metal         | Celestial fragment, celestial ingot, star-forged plate, world core component.       | Floating cities, realm-scale machines, major artifacts, world-shaping construction. | Endgame civilisation projects and race destiny arcs become possible.                 |

# 7. Core Material Identity Rules

| **Material / Family** | **Primary Identity**                                                                | **How It Stays Useful**                                                                                    |
|-----------------------|-------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------|
| Wood                  | Starter construction, fuel, tools, furniture, beams, chutes, carts, villages.       | Charcoal, structures, repairs, decoration, handles, shafts, paper, culture variants, early automation.     |
| Stone                 | Starter mining, foundations, walls, furnaces, paths, tools, village construction.   | Roads, stone bricks, walls, repair filler, defensive blocks, bridges, foundations, culture stone variants. |
| Clay                  | Bricks, pottery, pipes, waterproofing, roof tiles, early furnaces.                  | Villages need bricks/tiles; alchemy vessels; pipe linings; kiln-based progression.                         |
| Sand / Glass          | Glass, windows, bottles, lenses, greenhouse blocks, observation tools.              | Alchemy bottles, survey lenses, machine gauges, magic lenses, greenhouse farming.                          |
| Fibre / Cloth         | Rope, bags, backpacks, clothing, bowstrings, filters, sails.                        | Machine filters, conveyor belts, village clothing, tents, windmills, culture textiles.                     |
| Leather / Hide        | Armour, straps, bellows, backpacks, tool grips, machine belts.                      | Repairs, water skins, belts, furniture, NPC clothing, saddles, culture goods.                              |
| Copper                | Mechanisms, wiring, gears, pipes, early machines, conductive parts.                 | Wires, coils, decorative roofs, lightning systems, repairs, machine components throughout game.            |
| Bronze                | Side branch alloy for durable early gear, decorative culture pieces, bearings.      | Non-mandatory upgrade; good for corrosion resistance, statues, gears, culture goods.                       |
| Iron                  | Tools, weapons, armour, nails, rods, settlement construction, guards.               | Construction fittings, guard gear, machine parts, repairs, rails, village projects.                        |
| Steel                 | Industrial strength, reinforced frames, pressure systems, advanced machines.        | Town/city projects, heavy machines, rails, strong defences, siege hardware.                                |
| Silver                | Side material for anti-corruption, magic conductivity, rituals, currency.           | Wards, cleansing, undead counters, mage tools, temple goods, trade wealth.                                 |
| Gold                  | Side material for high-value trade, precision magic, rituals, luxury culture goods. | Faction trade, ritual inlays, noble buildings, high-end conduits, diplomacy gifts.                         |
| Mana Crystal          | Physical magic fuel and infrastructure material.                                    | Mana furnace, wards, runes, research, portals, mage economy, batteries.                                    |
| Arcane Alloy          | Hybrid metal/mana material for true magitech.                                       | Magitech frames, arcane circuits, advanced conduits, warded machines, late infrastructure.                 |
| Mythril               | Lightweight stable magical metal.                                                   | High-tier enchantment, precision tools, conduits, mage gear, lightweight machine parts.                    |
| Voidstone             | Unstable dimensional material for space, portals, void storage, risk.               | Portal frames, storage, high-risk rituals, dimensional factories, forbidden trade.                         |
| Celestial Metal       | Endgame world-shaping and civilisation-scale material.                              | Floating cities, artifacts, realm-scale engines, final cultural projects, endgame structures.              |

# 8. Side Materials and Utility Branches

Side materials add depth without forcing the main ladder to become bloated. They should be useful, culturally meaningful, and sometimes strategically important, but they should not make the core progression confusing.

| **Side Branch**              | **Role**                                                                                                    | **Progression Position**                     | **Notes**                                                                                         |
|------------------------------|-------------------------------------------------------------------------------------------------------------|----------------------------------------------|---------------------------------------------------------------------------------------------------|
| Bronze                       | Copper alloy branch for durability, bearings, decorative metalwork, early weapons/tools, culture goods.     | Copper/Iron side branch.                     | Should not be mandatory for every player, but useful for mechanical players and certain cultures. |
| Silver                       | Magic-conductive and anti-corruption material used in wards, cleansing, undead counters, and ritual inlays. | Iron/Mana side branch.                       | Can be valuable to temples, mage NPCs, and anti-necromancy factions.                              |
| Gold                         | High-value, malleable, magical precision and luxury material.                                               | Iron/Mana side branch.                       | Important for trade, diplomacy, ritual inlays, fine machines, and cultural prestige.              |
| Gems                         | Lens, focus, decoration, magic affinity, trade, and machine calibration resources.                          | From early rare finds to late-game crafting. | Different gems can map to schools, biomes, or cultures later.                                     |
| Salt                         | Preservation, trade, cooking, medicine, alchemy, and desert/coastal economy.                                | Early-mid side branch.                       | Strategic for villages because it supports food storage and trade.                                |
| Sulfur / Nitre-like Minerals | Explosives, alchemy, medicine, fertiliser, and hazardous crafting.                                          | Mid-game side branch.                        | Can support mining, combat, and industrial recipes.                                               |
| Livingwood / Culture Woods   | Nature magic, elven/forest construction, self-repairing furniture, ritual structures.                       | Culture/magic branch.                        | Should tie to race-linked dimension and culture stories later.                                    |
| Obsidian / Volcanic Glass    | Heat-resistant blocks, blades, portal early parts, alchemy vessels.                                         | Mid-game biome branch.                       | Useful before and after dimensional progression.                                                  |

# 9. Ore, Deposit, Node, and Prospecting Rules

Resource generation should support both hand exploration and long-term automation. Mineable blocks make the world tactile. Large deposits and nodes let factories scale without requiring the player to erase entire regions by hand.

| **Rule Area**       | **Locked Direction**                                                                                                                      |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Generation Model    | Use simple underground veins, biome/depth-specific veins, large automation deposits, and surface clues.                                   |
| Mineable Blocks     | Normal voxel blocks provide the early Minecraft-like mining experience and immediate material rewards.                                    |
| Resource Nodes      | Nodes provide long-term extraction targets for machines and should support throughput, depletion settings, grade, and ownership.          |
| Large Deposits      | Large deposits should be more visible, more valuable, and often require better tools, machines, permissions, or prospecting.              |
| Surface Clues       | Exposed colour, unusual plants, crystal glows, ruins, steam vents, soil stains, magnetised stones, and NPC rumours can hint at resources. |
| Ore Grades          | Poor, normal, and rich grades affect yield, by-products, and whether automation is worth setting up.                                      |
| Magical Purity      | Crystal and magical ores can have purity levels that affect mana yield, ritual stability, corruption risk, and output quality.            |
| Rare Material Gates | Rare materials can require biome, depth, boss, dimension, research, magic, village, faction, or stabilisation requirements.               |

## 9.1 Prospecting Progression

| **Stage**              | **Prospecting Method**                                                                        | **Player Experience**                                       |
|------------------------|-----------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Early Visual Clues     | Surface traces, exposed ore, unusual stone colour, mineral plants, cliff seams, cave sparkle. | Player learns to read terrain without a UI-heavy system.    |
| Basic Prospecting Tool | Simple pick/hammer/survey stakes reveal rough nearby resource hints.                          | Helps players find copper/iron without random strip-mining. |
| Survey Lens            | Glass/copper tool that highlights traces and vein direction at short range.                   | Gives glass and copper more long-term utility.              |
| Rune Surveying         | Mana-powered scan that reveals magical purity, corrupted materials, and hidden deposits.      | Supports magic without replacing normal tools.              |
| Automation Survey      | Late machine survey produces deposit maps for nodes, output rates, and hazard notes.          | Factory players can plan large supply chains.               |

# 10. Refinement, By-products, and Processing

Raw resources should usually transform into carried resource items and then into refined materials. This gives recipes, stations, machines, quality, by-products, and automation meaningful hooks.

| **Processing Stage** | **Example**                                                                                 | **Purpose**                                                                            |
|----------------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Raw Collection       | Ore Block -\> Raw Iron Ore; Tree -\> Oak Log; Crystal Ore -\> Raw Mana Crystal.             | Keeps gathering readable and itemised.                                                 |
| Basic Refinement     | Raw Iron Ore -\> Iron Ingot; Sand -\> Glass; Clay -\> Brick.                                | Creates the first usable construction and crafting materials.                          |
| Component Processing | Ingot -\> Plate/Rod/Nail/Gear Blank; Log -\> Plank/Beam/Shaft.                              | Feeds machines, tools, village projects, and repairs.                                  |
| Yield Improvement    | Crusher, sawmill, forge, mana furnace, or specialist NPC improves output.                   | Automation and specialists reduce grind and reward infrastructure.                     |
| By-products          | Slag, ash, sawdust, dust, chips, residue, shard fragments.                                  | Supports alchemy, fuel, filler blocks, fertiliser, waste systems, or low-tier recipes. |
| Advanced Refinement  | Rune-binding, alloying, purification, stabilisation, cleansing, cooling, pressure smelting. | Needed for magitech, dimensions, and dangerous resources.                              |

| **By-product**  | **Likely Source**                        | **Useful Roles**                                                                           |
|-----------------|------------------------------------------|--------------------------------------------------------------------------------------------|
| Slag            | Ore smelting, steelmaking.               | Road filler, low-grade blocks, alchemy reagent, machine waste, village cheap construction. |
| Ash             | Wood/charcoal/coal burning, fire damage. | Fertiliser, lye-like crafting, alchemy, cleaning, dark rituals.                            |
| Sawdust         | Sawmill wood processing.                 | Fuel pellets, compost, animal bedding, paper pulp, filler board.                           |
| Stone Dust      | Crushing stone/ore.                      | Mortar, concrete-like mixes, alchemy bases, filters.                                       |
| Metal Shavings  | Forge/machining.                         | Recycling, precision crafting, pigments, spark powders.                                    |
| Crystal Chips   | Mana/gem processing.                     | Mana dust, small catalysts, decorations, machine calibration.                              |
| Corrupt Residue | Void/shadow/cursed processing.           | Forbidden recipes, cleansing quests, hazard disposal, dark factions.                       |

# 11. Fuel and Power Material Progression

Fuel progression should move from simple biological fuels to fossil fuels, mechanical power, mana infrastructure, alchemical fuels, dimensional fuels, and late-game leyline/portal power. Fuel should support machines, villages, cooking, smelting, rituals, and world consequences.

| **Fuel / Power Type**  | **Examples**                                             | **Unlock Role**                                         | **Risks / Notes**                                                |
|------------------------|----------------------------------------------------------|---------------------------------------------------------|------------------------------------------------------------------|
| Biological Fuel        | Wood, sticks, charcoal, dried plants.                    | Starter torches, cooking, simple furnace use.           | Renewable but competes with construction and ecology.            |
| Fossil / Mineral Fuel  | Coal, coke-like refined coal, sulfur mixes.              | Longer smelting, steel, industry, filters, explosives.  | Can produce ash/pollution on harsh settings.                     |
| Mechanical Power       | Crank, water wheel, windmill, shafts.                    | Early automation without magic.                         | Requires placement, terrain, weather, or manual input.           |
| Steam / Pressure Fuel  | Coal, charcoal, oil-like alchemical fuel.                | Industrial machines, pumps, pressure systems.           | Steel/industry branch; can be dangerous if misused.              |
| Magical Fuel           | Mana shard, mana crystal, mana battery.                  | Mana furnace, wards, runes, conduits, magical machines. | Purity matters; overload can disrupt machines.                   |
| Alchemical Fuel        | Distilled oil, blast gel, fire salts, reactive mixtures. | High-output machines, explosives, specialised recipes.  | Failure, explosion, or waste risk.                               |
| Dimensional Fuel       | Void shard, infernal ash, dream mote, deep forge ember.  | Powerful late or realm-linked machines and rituals.     | High risk; may require stabilisation and faction consequences.   |
| Leyline / Portal Power | Leyline taps, portal anchors, realm conduits.            | Late-game static infrastructure and city-scale power.   | Requires location strategy, warding, and world-state management. |

# 12. Tools, Harvesting Gates, and Magic-Assisted Gathering

Tools should unlock both harder materials and new interactions. Magic can improve harvesting, reveal resources, stabilise rare materials, or improve yield, but it should support tools and machines rather than replacing them completely.

| **Tool / Method**  | **Resource Role**                                                                    | **Progression Notes**                                       |
|--------------------|--------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Pickaxe            | Mines stone, ore, crystals, deepstone, and hard dimension materials.                 | Classic readable tool gate; tiers matter.                   |
| Axe                | Cuts logs, living wood, roots, wooden structures, and some organic blocks.           | Wood remains useful for construction and automation.        |
| Shovel             | Soil, clay, sand, gravel, snow, ash, loose deposits.                                 | Important for farming, clay, glass, roads, and villages.    |
| Sickle / Knife     | Harvests fibre, herbs, reeds, crops, vines, fungi, alchemy plants.                   | Supports food, cloth, medicine, and magic.                  |
| Hammer             | Repairs structures, shapes plates, tests ore, breaks rubble, improves forge recipes. | Connects resource progression to repair and construction.   |
| Wrench             | Configures machines, pipes, chutes, nodes, filters, and automated resource outputs.  | Automation interaction tool begins around copper.           |
| Rune Chisel        | Inscribes runes on blocks, tools, conduits, ritual stones, and machine upgrades.     | Connects material resources to magic infrastructure.        |
| Rune Tuner         | Adjusts mana flow, machine runes, ward settings, and unstable magical resources.     | Supports mana infrastructure and later magitech.            |
| Prospecting Tool   | Detects nearby traces, grades, node size, or direction clues.                        | Prevents random mining and rewards preparation.             |
| Survey Lens        | Glass/copper/mana tool that highlights mineral and magical traces.                   | Makes glass, copper, and mana useful beyond early crafting. |
| Earth / Rune Magic | Cracks stone, reveals veins, stabilises dangerous blocks, or improves mining yield.  | Support layer; should not invalidate pickaxes or machines.  |

# 13. Automation and Bulk Supply Progression

Automation should begin at Copper tier with mechanical parts, not with late-game magic. Early automation reduces labour. Advanced processing improves yield. Village warehouses can accept automated input after trust or permission is earned.

| **Automation Stage**   | **Resource Requirements**                                                    | **Resource Function**                                                              |
|------------------------|------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Manual Labour          | Wood, stone, fibre, food, torches.                                           | The player gathers and carries resources by hand.                                  |
| Copper Mechanisms      | Copper wire, plates, gears, wooden chutes, shafts, leather/fibre belts.      | First chutes, cranks, simple sorters, water/wind power, and sawmill.               |
| Iron Settlement Supply | Iron ingots, nails, rods, plates, reinforced chests, guard gear.             | Supplies watchtower, repairs, blacksmith, guards, and early village defence.       |
| Steel Industry         | Steel frames, pressure plates, reinforced gears, pipes, coal/coke-like fuel. | Scales production into regional logistics and heavy machines.                      |
| Mana Support           | Mana crystals, runes, ward cores, mana batteries.                            | Adds magic furnace, wards, mana-powered boosts, and mage economy.                  |
| Arcane Magitech        | Arcane alloy, mana coils, rune circuits, stabilised cores.                   | Fuses magic and automation into advanced machines.                                 |
| Dimensional Logistics  | Voidstone, stabilised shards, portal anchors, realm conduits.                | Late logistics, linked storage, portal item routing, and high-risk infrastructure. |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Automation Consequence Rule</strong></p>
<p>Automated extraction can have optional or scalable consequences such as noise, surface scars, runoff, magical instability, corruption, faction concern, or village permission issues. These consequences should scale by machine type, resource risk, difficulty settings, and player choices.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 14. Village, Economy, and Strategic Resource Use

Resources should create visible civilisation change. Villages consume exact stored resources for projects, repairs, tools, defence, food, trade, culture, and story gates. Scarcity and cultural preference should affect value.

| **Village Use Type** | **Resources Involved**                                             | **Gameplay Result**                                                               |
|----------------------|--------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| Basic Survival       | Food, water, firewood, cloth, leather, medicine.                   | Camps and hamlets stabilise, avoid famine, and continue work.                     |
| Construction         | Logs, planks, stone, clay bricks, glass, iron nails, roof tiles.   | Villages build homes, storage, roads, wells, markets, and walls.                  |
| Defence              | Iron, steel, stone, wood, leather, bows, arrows, ward cores.       | Watchtowers, guard gear, gates, walls, traps, and raid outcomes improve.          |
| Production           | Copper, iron, coal, clay, glass, fibre, machine parts.             | Workshops, mills, blacksmiths, sawmills, and warehouses become more capable.      |
| Magic Infrastructure | Mana crystals, silver, gems, runes, ward cores, ritual catalysts.  | Wards, mage towers, temples, magic lights, story rituals, and portal preparation. |
| Trade and Culture    | Salt, gold, silver, gems, culture goods, cloth, festival supplies. | Caravans, reputation, diplomacy, festivals, and unique recipes unlock.            |
| Strategic Control    | Iron, coal, steel, mana crystals, food reserves, voidstone.        | Factions may compete, tax, protect, forbid, or fight over key resources.          |

## 14.1 Economic Rules

- Every major material should have at least one village use: construction, tools, repairs, trade, defence, culture, magic, food, or story.

- Large village projects use exact stored resources rather than abstract project points.

- Scarcity, culture preference, nearby supply, season, danger, and faction control can affect trade value.

- Village warehouses accept automated input after trust or permission is earned.

- Some resources are strategic enough to trigger faction interest, theft, blockades, laws, or conflict.

# 15. Magic Resource Progression

Mana should have physical forms that let magic connect to mining, crafting, machines, villages, trade, and risk. Runes can exist as items, inscriptions, machine upgrades, blocks, and ritual components.

| **Magic Resource Stage** | **Example Item / Block Forms**                            | **Primary Uses**                                                              |
|--------------------------|-----------------------------------------------------------|-------------------------------------------------------------------------------|
| Raw Mana Crystal         | Mana Crystal Ore, Raw Mana Crystal, Mana Crystal Cluster. | First magic discovery, mining reward, mage trade, mana furnace fuel.          |
| Mana Shard               | Cracked Shard, Charged Shard, Impure Shard.               | Fuel for small devices, basic runes, portable energy, village ward donations. |
| Mana Dust                | Powdered mana, infused dust, purified mana dust.          | Rune crafting, alchemy, enchanting, catalysts, conduits.                      |
| Blank Rune               | Stone rune blank, copper rune blank, silver rune blank.   | Receives inscriptions; bridge between physical crafting and magic logic.      |
| Basic Rune               | Utility rune, fire rune, ward rune, machine rune.         | Machines, spell tools, wards, doors, rituals, automation rules.               |
| Ward Core                | Basic ward core, village ward core, temple ward core.     | Village protection, anti-monster fields, corruption resistance, story gates.  |
| Mana Battery             | Crystal cell, mana battery, conduit reservoir.            | Stores mana for machines, wards, portable tools, and emergency power.         |
| Arcane Catalyst          | Mana binder, silver inlay, gem focus, monster essence.    | Higher crafting quality, ritual stability, advanced magitech.                 |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Magic Risk Rule</strong></p>
<p>Unstable, forbidden, void, blood, shadow, corrupted, and impure magical resources can carry corruption risk. Risk should not make all magic annoying; it should make dangerous resources feel meaningful and support moral paths, faction reactions, and cleansing gameplay.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 16. Monster, Organic, Cultural, and Forbidden Resources

| **Resource Type**   | **Examples**                                                                               | **Design Purpose**                                                                          |
|---------------------|--------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Common Organic      | Fibre, leather, hide, bone, cloth, reeds, herbs, mushrooms.                                | Survival crafting, food, medicine, clothing, tools, culture goods, alchemy.                 |
| Monster Drops       | Goblin scrap, spider silk, wisp core, slime gel, beast fang, boss heart.                   | Alchemy, magic, gear, trophies, rituals, faction proof, and trade.                          |
| Culture Goods       | Dwarven rivets, elven living sap, temple incense, goblin salvage charms, nomad salt packs. | Make cultures economically distinct without requiring separate versions of every item.      |
| Strategic Staples   | Food reserves, salt, medicine, coal, iron, steel, mana crystals.                           | Create scarcity, trade routes, village priorities, and faction conflict.                    |
| Forbidden Resources | Blood catalyst, necromantic bone core, cursed metal, corrupted shard, shadow resin.        | Support dark crafting, villain paths, illegal trade, fear reputation, and cleansing quests. |
| Relic Resources     | Ancient coin, broken seal, relic gear, old machine core.                                   | Tie ruins, quests, research, faction stories, and archaeology to resource progression.      |

# 17. Dimension and Realm Resource Families

Major dimensions should introduce full resource families. Minor dimensions can have smaller sets. Realm resources should remain useful in the overworld, otherwise dimensions risk becoming isolated content islands.

| **Realm / Family**         | **Resource Examples**                                             | **Overworld Utility**                                                                |
|----------------------------|-------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Fae / Living Forest        | Fae seed, livingwood, moonleaf fibre, glimmer sap, bloom crystal. | Nature automation, living structures, farming magic, elven/forest culture recipes.   |
| Deep Forge / Dwarven Realm | Deep forge ember, blackstone, forge crystal, pressure ore.        | High-temperature industry, steel/arcane alloy, fortress construction, deep machines. |
| Void Realm                 | Voidstone shard, void dust, stabilised void plate, null crystal.  | Portals, void storage, dimensional logistics, high-risk rituals.                     |
| Dream Realm                | Dream glass, memory thread, sleep-mote, lucid crystal.            | Illusion systems, dream wards, lore machines, mental/memory magic.                   |
| Infernal Realm             | Infernal ash, brimstone, heatstone, demon slag.                   | High heat fuels, dangerous weapons, blast furnaces, forbidden recipes.               |
| Sky / Celestial Realm      | Cloudstone, sky ore, celestial fragment, star metal.              | Floating platforms, airships, floating cities, endgame artifacts.                    |
| Spirit Realm               | Spirit salt, ghost silk, ancestral ash, soul crystal.             | Shrines, cleansing, necromancy counters, ancestor rituals, culture stories.          |

## 17.1 Stabilisation Rules

| **Stabilisation Type** | **Used For**                                                    | **Example**                                                                 |
|------------------------|-----------------------------------------------------------------|-----------------------------------------------------------------------------|
| Cleansing              | Corrupted, cursed, shadow, necromantic, or blood resources.     | Corrupt Shard -\> Cleansed Shard with silver, water, ward core.             |
| Binding                | Void, portal, unstable mana, and dimensional storage materials. | Voidstone Shard -\> Bound Voidstone Plate with rune table and silver inlay. |
| Cooling                | Infernal, forge, volcanic, and pressure-smelted materials.      | Infernal Slag -\> Safe Infernal Brick after cooling basin.                  |
| Purifying              | Mana crystals, gems, celestial fragments, ritual catalysts.     | Impure Mana Dust -\> Purified Mana Dust via alchemy/mana furnace.           |
| Warding                | Dangerous machines, portal anchors, forbidden materials.        | Void Storage Core requires warded casing before placement.                  |

# 18. Proof-of-Concept Resource Scope

The POC should prove the connected resource loop, not the full final material system. Its main chain is Iron Ore -\> Iron Ingot -\> Watchtower/Village Defence, supported by basic survival resources, copper mechanisms, mana infrastructure, and village warehouse delivery.

| **POC Resource Group**  | **Included Resources**                                                     | **Why It Exists**                                                                    |
|-------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Survival Basics         | Wood, sticks, fibre, stone, berries/food basics, charcoal.                 | First tools, shelter, torches, crafting, food, and early repairs.                    |
| Terrain and Building    | Dirt/grass, stone, clay, sand, planks, stone brick, glass.                 | Tests building, village construction, furnace, windows, and cosy presentation.       |
| Fuel                    | Wood, charcoal, coal.                                                      | Tests furnace, torches, smelting, early machines, and village industry.              |
| Copper Mechanisms       | Raw copper ore, copper ingot, copper wire, copper plate, gear.             | Tests first automation, chutes, basic machine parts, and sawmill/wind/water options. |
| Iron Settlement Support | Raw iron ore, iron ingot, iron nail, iron rod, iron plate.                 | Tests tools, guard gear, watchtower supply, and raid outcome changes.                |
| Basic Magic             | Mana crystal, mana shard, mana dust, blank rune, basic rune, ward core.    | Tests mana furnace, ward/light, mage NPC requests, and magic infrastructure.         |
| Food and Village Needs  | Grain/berries/simple food, cooked food, basic rations.                     | Tests NPC consumption, village needs, trading, and optional survival.                |
| Teasers Only            | Voidstone fragment, mythril fleck, celestial fragment as lore/teaser only. | Hints at long-term progression without implementing full systems.                    |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>POC Cut Rule</strong></p>
<p>Steel is deferred to Alpha. Voidstone, Mythril, and Celestial Metal should only appear as tiny teaser fragments or lore entries in the POC, not as fully usable systems.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 19. Detailed Resource Registry v0.1

This registry is a first-pass design list. Values and quantities are balance draft placeholders. IDs are database-friendly planning IDs and can be adjusted during technical implementation.

| **Resource ID**                       | **Display Name**         | **Category**                | **Tier**      | **Source**                              | **Main Uses**                                            | **Status**          |
|---------------------------------------|--------------------------|-----------------------------|---------------|-----------------------------------------|----------------------------------------------------------|---------------------|
| resource.natural.stick                | Stick                    | Natural                     | Tier 0        | Surface / tree drops                    | Crude tools, torches, handles, fuel                      | POC Required        |
| resource.natural.plant_fibre          | Plant Fibre              | Natural / Organic           | Tier 0        | Grass, reeds, fibre plants              | Rope, cloth, bowstrings, filters, backpacks              | POC Required        |
| resource.natural.berry_basic          | Wild Berries             | Food / Organic              | Tier 0        | Bushes, forest edges                    | Early food, cooking, NPC food need                       | POC Required        |
| resource.stone.loose                  | Loose Stone              | Natural / Stone             | Tier 0        | Surface stones, broken blocks           | Crude tools, campfires, early recipes                    | POC Required        |
| resource.soil.clay_lump               | Clay Lump                | Natural / Soil              | Tier 1        | Riverbanks, wet biomes, clay deposits   | Bricks, pottery, early pipes, furnace upgrades           | POC Required        |
| resource.soil.sand                    | Sand                     | Natural / Soil              | Tier 1        | Beaches, deserts, rivers                | Glass, mortar, filters, alchemy vessels                  | POC Required        |
| resource.wood.oak_log                 | Oak Log                  | Natural / Wood              | Tier 1        | Trees                                   | Planks, fuel, beams, village construction                | POC Required        |
| material.wood.oak_plank               | Oak Plank                | Refined / Wood              | Tier 1        | Workbench or sawmill from logs          | Building, chests, machines, village projects             | POC Required        |
| material.wood.beam                    | Wooden Beam              | Refined / Wood              | Tier 1        | Workbench/sawmill from logs             | Roofs, scaffolds, towers, bridges                        | POC Required        |
| material.fuel.charcoal                | Charcoal                 | Fuel                        | Tier 1        | Burn logs in furnace/kiln               | Renewable fuel, torches, basic smelting                  | POC Required        |
| resource.fuel.coal                    | Coal                     | Ore / Fuel                  | Tier 1-2      | Caves, underground veins                | Fuel, steel later, filters, explosives, NPC industry     | POC Required        |
| material.stone.cobble                 | Cobblestone              | Refined / Stone             | Tier 1        | Mine stone blocks                       | Building, furnace, village paths, walls                  | POC Required        |
| material.stone.brick                  | Stone Brick              | Refined / Stone             | Tier 1        | Workbench/stonecutter from stone        | Village construction, watchtower, roads                  | POC Required        |
| material.clay.brick                   | Clay Brick               | Refined / Clay              | Tier 1        | Smelt clay                              | Roofs, furnaces, walls, ovens, chimneys                  | POC Required        |
| material.glass.pane                   | Glass Pane               | Refined / Glass             | Tier 1-2      | Smelt sand; craft panes                 | Windows, bottles, survey lenses, greenhouses             | POC Required        |
| resource.crop.grain                   | Grain                    | Food / Organic              | Tier 1        | Farming / village fields                | Bread, rations, animal feed, trade                       | POC Required        |
| material.food.simple_ration           | Simple Ration            | Food / Refined              | Tier 1        | Cooking from grain/berries/meat         | NPC food need, travel food, guard supply                 | POC Required        |
| resource.ore.raw_copper               | Raw Copper Ore           | Ore / Metal                 | Tier 2        | Copper ore blocks/veins                 | Smelt to copper ingots                                   | POC Required        |
| material.ingot.copper                 | Copper Ingot             | Refined / Metal             | Tier 2        | Smelt raw copper ore                    | Wire, plates, gears, machines, trade                     | POC Required        |
| material.component.copper_wire        | Copper Wire              | Refined / Component         | Tier 2        | Forge/hammer from copper ingot          | Machines, conduits, early logic, survey lens             | POC Required        |
| material.component.copper_plate       | Copper Plate             | Refined / Component         | Tier 2        | Forge/hammer from copper ingot          | Machines, chutes, boilers, decorative roofs              | POC Required        |
| material.component.copper_gear        | Copper Gear              | Machine Component           | Tier 2        | Workbench/forge from copper plates      | Cranks, chutes, water/wind mechanisms                    | POC Required        |
| material.component.wooden_shaft       | Wooden Shaft             | Machine Component           | Tier 2        | Sawmill/workbench from logs             | Cranks, mill linkages, water/wind power                  | POC Required        |
| material.component.leather_belt       | Leather Belt             | Machine Component / Organic | Tier 2        | Leather + fibre                         | Sawmill, conveyors, bellows, machine transfer            | Alpha               |
| resource.ore.raw_tin                  | Raw Tin Ore              | Ore / Side Metal            | Tier 2        | Caves, hills, river stones              | Bronze alloy branch                                      | Alpha               |
| material.ingot.bronze                 | Bronze Ingot             | Refined / Side Metal        | Tier 2-3      | Copper + tin alloy                      | Durable mechanisms, bearings, culture goods              | Alpha               |
| resource.ore.raw_iron                 | Raw Iron Ore             | Ore / Metal                 | Tier 3        | Iron veins, caves, cliffs               | Smelt to iron ingots                                     | POC Required        |
| material.ingot.iron                   | Iron Ingot               | Refined / Metal             | Tier 3        | Smelt raw iron ore                      | Tools, weapons, guards, village construction             | POC Required        |
| material.component.iron_nail          | Iron Nail                | Component                   | Tier 3        | Forge from iron ingot                   | Watchtower, buildings, furniture, repairs                | POC Required        |
| material.component.iron_rod           | Iron Rod                 | Component                   | Tier 3        | Forge from iron ingot                   | Tools, rails, machines, gates, supports                  | POC Required        |
| material.component.iron_plate         | Iron Plate               | Component                   | Tier 3        | Forge/hammer from iron ingot            | Machines, armour, watchtower fittings                    | POC Required        |
| material.gear.guard_iron_bundle       | Iron Guard Supply Bundle | Village Supply              | Tier 3        | Project recipe from iron parts          | Village defence, guard equipment, raid loop              | POC Required        |
| material.project.watchtower_supply    | Watchtower Supply Crate  | Village Project             | Tier 3        | Village warehouse project recipe        | Consumes wood, stone, iron, glass, rope                  | POC Required        |
| resource.ore.raw_silver               | Raw Silver Ore           | Ore / Side Metal            | Tier 3-5      | Caves, mountains, magic-biased veins    | Anti-corruption, rituals, trade                          | Alpha               |
| material.ingot.silver                 | Silver Ingot             | Refined / Side Metal        | Tier 3-5      | Smelt raw silver ore                    | Wards, cleansing, mage tools, undead counters            | Alpha               |
| resource.ore.raw_gold                 | Raw Gold Ore             | Ore / Side Metal            | Tier 3-5      | Deep veins, rivers, ruins               | Trade, rituals, luxury, precision magic                  | Alpha               |
| material.ingot.gold                   | Gold Ingot               | Refined / Side Metal        | Tier 3-5      | Smelt raw gold ore                      | Trade, ritual inlays, faction gifts                      | Alpha               |
| resource.gem.quartz                   | Quartz Crystal           | Gem / Mineral               | Tier 3-5      | Caves, crystal pockets                  | Lenses, magic focus, machine calibration                 | Alpha               |
| material.fuel.coke                    | Refined Coal Coke        | Fuel / Industry             | Tier 4        | Process coal in kiln/blast furnace      | Steelmaking, high heat, industry                         | Alpha               |
| material.ingot.steel                  | Steel Ingot              | Refined / Metal             | Tier 4        | Iron + coal/coke in forge/blast furnace | Industry, reinforced frames, strong gear                 | Alpha               |
| material.component.steel_frame        | Steel Frame              | Machine Component           | Tier 4        | Steel plates + rods                     | Advanced machines, town projects                         | Alpha               |
| material.component.steel_pipe         | Steel Pipe               | Machine Component           | Tier 4        | Steel ingot/plate processing            | Pressure systems, pumps, steam, fluids                   | Alpha               |
| resource.crystal.raw_mana             | Raw Mana Crystal         | Magic / Crystal             | Mana Parallel | Mana crystal ore, clusters, ruins       | Mana fuel, research, mage trade                          | POC Required        |
| resource.crystal.mana_shard           | Mana Shard               | Magic / Fuel                | Mana Parallel | Break/refine raw mana crystal           | Mana furnace, basic runes, portable power                | POC Required        |
| resource.crystal.mana_dust            | Mana Dust                | Magic / Component           | Mana Parallel | Grind mana shards                       | Runes, alchemy, enchanting, conduits                     | POC Required        |
| material.rune.blank_stone             | Blank Stone Rune         | Magic Component             | Mana Parallel | Stone + mana dust                       | Inscription base for basic runes                         | POC Required        |
| material.rune.basic                   | Basic Rune               | Magic Component             | Mana Parallel | Rune table from blank rune + mana dust  | Machines, wards, doors, mana furnace upgrade             | POC Required        |
| material.magic.ward_core_basic        | Basic Ward Core          | Magic Component             | Mana Parallel | Basic rune + mana shard + crystal chip  | Village ward, magic light, defence                       | POC Required        |
| material.magic.mana_battery_small     | Small Mana Battery       | Magic Component             | Mana Parallel | Copper wire + mana shard + glass        | Stores mana for small machines/wards                     | Alpha               |
| material.alloy.arcane_alloy           | Arcane Alloy Ingot       | Magitech Metal              | Tier 6        | Steel/copper + mana + rune process      | Magitech machines, conduits, hybrid tools                | Final Game          |
| material.component.arcane_circuit     | Arcane Circuit           | Magitech Component          | Tier 6        | Arcane alloy + mana dust + silver/gold  | Advanced automation, logic, warded machines              | Final Game          |
| resource.ore.raw_mythril              | Raw Mythril Ore          | Ore / Magical Metal         | Tier 7        | Rare deep/magic veins, culture gates    | High-tier magical metal                                  | Final Game          |
| material.ingot.mythril                | Mythril Ingot            | Refined / Magical Metal     | Tier 7        | Special forge + mana stabilisation      | Light gear, conduits, enchantment tools                  | Final Game          |
| material.component.mythril_wire       | Mythril Wire             | Magic Component             | Tier 7        | Mythril ingot processing                | Stable high-tier conduits, precision tools               | Final Game          |
| resource.dimension.voidstone_shard    | Voidstone Shard          | Dimension / Unstable        | Tier 8        | Void realm, corrupted rifts, rare ruins | Portals, void storage, risky rituals                     | Teaser / Final Game |
| material.dimension.bound_void_plate   | Bound Voidstone Plate    | Dimension / Stabilised      | Tier 8        | Voidstone + silver + rune binding       | Portal frames, void logistics, high-risk machines        | Final Game          |
| resource.dimension.dream_glass        | Dream Glass              | Dimension / Dream           | Tier 8        | Dream realm or rare ruins               | Illusion, memory, dream wards, lore systems              | Final Game          |
| resource.dimension.fae_seed           | Fae Seed                 | Dimension / Nature          | Tier 6-8      | Fae realm, living forest events         | Livingwood, nature automation, forest culture            | Final Game          |
| resource.dimension.infernal_ash       | Infernal Ash             | Dimension / Fuel            | Tier 6-8      | Infernal realm, volcanic/dark events    | High heat fuel, dangerous alchemy, forbidden recipes     | Final Game          |
| resource.dimension.deep_forge_ember   | Deep Forge Ember         | Dimension / Fuel            | Tier 6-8      | Deep forge realm                        | Steel/arcane alloy, high heat smelting, dwarven projects | Final Game          |
| resource.dimension.celestial_fragment | Celestial Fragment       | Dimension / Celestial       | Tier 9        | Sky/celestial realm, world events       | Endgame artifacts, world cores, floating cities          | Teaser / Final Game |
| material.ingot.celestial_metal        | Celestial Metal Ingot    | Endgame Material            | Tier 9        | Celestial fragments + realm forge       | World-shaping structures, realm-scale machines           | Final Game          |
| resource.monster.goblin_scrap         | Goblin Scrap             | Monster / Salvage           | Tier 1-3      | Goblin raiders/camps                    | Crude repairs, trade, proof of defence                   | POC Required        |
| resource.monster.spider_silk          | Spider Silk              | Monster / Organic           | Tier 2-5      | Cave spiders/magical spiders            | Cloth, bowstrings, alchemy, traps                        | Alpha               |
| resource.monster.wisp_core            | Wisp Core                | Monster / Magic             | Tier 3-5      | Wisps, ruins, magic biomes              | Mana recipes, lights, ward upgrades                      | Alpha               |
| resource.monster.beast_fang           | Beast Fang               | Monster / Trophy            | Tier 1-4      | Predators, raid beasts                  | Weapons, trophies, trade, faction proof                  | Alpha               |
| resource.forbidden.blood_catalyst     | Blood Catalyst           | Forbidden / Magic           | Varies        | Dark rituals, forbidden alchemy         | High-power magic with moral risk                         | Final Game          |
| resource.forbidden.necrotic_bone_core | Necromantic Bone Core    | Forbidden / Necromancy      | Varies        | Undead, grave rituals, necromancers     | Undead workers, fear reputation, dark automation         | Final Game          |
| resource.culture.dwarven_rivets       | Dwarven Rivets           | Culture Good                | Iron/Steel    | Dwarven workshops/trade                 | Fortress builds, heavy machines, culture recipes         | Final Game          |
| resource.culture.elven_living_sap     | Elven Living Sap         | Culture / Nature Magic      | Mana/Nature   | Elven/forest villages, fae realm        | Livingwood, healing, nature machines                     | Final Game          |
| resource.culture.temple_incense       | Temple Incense           | Culture / Trade             | Early-Mid     | Priests, herbs, villages                | Festivals, morale, rituals, diplomacy                    | Alpha               |

# 20. Core Resource Chains

| **Chain**          | **Flow**                                                                                        | **Systems Proved**                                                         |
|--------------------|-------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Starter Survival   | Stick + Plant Fibre + Loose Stone -\> Crude Tools -\> Wood/Stone gathering -\> Shelter + Torch. | Survival, crafting, building, light, first day readability.                |
| Wood Construction  | Log -\> Plank/Beam -\> Chest/Workbench/Scaffold/Watchtower pieces.                              | Building, storage, village projects, NPC construction.                     |
| Stone Construction | Stone -\> Cobblestone -\> Stone Brick -\> Furnace/Path/Wall/Watchtower base.                    | Mining, construction, village defence, repair.                             |
| Clay and Glass     | Clay -\> Brick/Roof Tile; Sand -\> Glass Pane/Bottle/Lens.                                      | Furnace, building variety, alchemy prep, prospecting lens, cosy buildings. |
| Copper Mechanisms  | Copper Ore -\> Copper Ingot -\> Wire/Plate/Gear -\> Chute/Crank/Sawmill/Basic Machine.          | Early automation, mechanical branch, machine parts.                        |
| Iron Settlement    | Iron Ore -\> Iron Ingot -\> Nails/Rods/Plates -\> Guard Gear/Watchtower Supply.                 | POC village defence loop, blacksmith role, raid outcome.                   |
| Basic Mana         | Raw Mana Crystal -\> Mana Shard -\> Mana Dust -\> Basic Rune/Ward Core/Mana Furnace.            | Magic infrastructure, mage economy, village wards, mana crafting.          |
| Steel Industry     | Iron + Coal/Coke -\> Steel Ingot -\> Steel Frame/Pipe -\> Heavy Machines/Regional Projects.     | Alpha industrial progression, town upgrades, pressure systems.             |
| Arcane Magitech    | Steel/Copper + Mana + Rune -\> Arcane Alloy -\> Arcane Circuit/Core -\> Hybrid Machine.         | True magitech, advanced automation, high-tier infrastructure.              |
| Void Logistics     | Voidstone Shard -\> Bound Void Plate -\> Portal Anchor/Linked Storage.                          | Dimensional progression, stabilisation, high-risk utility.                 |
| Celestial Endgame  | Celestial Fragment -\> Celestial Metal -\> World Core/Floating City Structure.                  | Endgame civilisation-scale construction and story outcomes.                |

# 21. Balancing Rules

- Game feel comes first. Resource collection should feel satisfying before numeric realism is added.

- Do not make early resource chains too complex. The first furnace and first tools should remain readable.

- Use optional complexity: crushers, better stations, NPC specialists, and automation should improve yield rather than block basic play too early.

- Older materials should remain useful through repairs, construction, side recipes, machine parts, village needs, culture variants, and trade.

- Resource rarity should not be the same as material tier. A rare copper relic can matter despite copper being an early material.

- By-products should add useful depth, but not every by-product needs to be valuable.

- Automation should reduce labour first, then improve yield later through better processing.

- Village-scale projects should require large quantities so automation has purpose, but POC costs should stay small enough for testing.

- Magical resources should be powerful but should not invalidate tools, machines, or NPC labour.

- Forbidden and dimensional resources should create risk and consequences only where they add meaningful choice.

- Difficulty/world settings can adjust scarcity, spoilage, destructive consequences, pollution, corruption, machine disruption, and village loss.

# 22. Open Questions for Later Documents

- What exact ore distribution rules should the world generation document use for copper, iron, coal, mana crystal, silver, gold, and rare materials?

- How large should POC village resource requests be for the watchtower, repairs, food, and guard supply?

- What exact throughput should copper-tier machines and chutes support?

- How much should poor, normal, and rich ore grades affect yield?

- Which by-products are enabled in the POC and which remain Alpha/final-game placeholders?

- What exact purity tiers should mana crystals use, and how visible should purity be to the player?

- What resource scarcity settings should exist for relaxed, normal, harsh, and custom worlds?

- Which resources are culturally preferred by the first human, dwarven, elven, goblin, or original-race villages?

- Which forbidden resources are illegal by default and which depend on faction or culture rules?

- Which dimension resource families are mandatory and which are optional side realms?

- Should any deposits be finite, renewable, or slowly regenerating through magic/world events?

- How should NPC miners, player machines, and world depletion interact in multiplayer?

# Appendix A. POC Resource Checklist

| **Resource**                                 | **POC Role** | **Needed For**                                                             |
|----------------------------------------------|--------------|----------------------------------------------------------------------------|
| Wood / Logs / Planks                         | Core         | Tools, shelter, workbench, chests, watchtower, fuel.                       |
| Stone / Cobblestone / Stone Brick            | Core         | Tools, furnace, construction, watchtower base, roads.                      |
| Clay / Brick                                 | Core         | Furnace, roof/wall variants, village construction.                         |
| Sand / Glass                                 | Core         | Windows, bottles, lenses, building detail.                                 |
| Plant Fibre / Rope                           | Core         | Crude tools, torches, watchtower, bags, early machine parts.               |
| Food Basics                                  | Core         | Survival, NPC needs, village requests.                                     |
| Coal / Charcoal                              | Core         | Smelting, torches, early machines, fuel comparison.                        |
| Copper Ore/Ingot/Wire/Plate/Gear             | Core         | Early automation, chutes, mechanisms, sawmill/water/wind power prototypes. |
| Iron Ore/Ingot/Nail/Rod/Plate                | Core         | Tools, guards, watchtower, raid outcome.                                   |
| Mana Crystal/Shard/Dust/Basic Rune/Ward Core | Core         | Mana furnace, magic light/ward, mage NPC, magic infrastructure proof.      |
| Steel                                        | Deferred     | Alpha industrial branch.                                                   |
| Voidstone/Mythril/Celestial                  | Teaser only  | Lore, codex, ruin hints; no full POC systems.                              |

# Appendix B. Resource Database Field Template

| **Field**                    | **Purpose**                                   | **Example**                                                                |
|------------------------------|-----------------------------------------------|----------------------------------------------------------------------------|
| resource_id                  | Unique internal ID.                           | resource.ore.raw_iron                                                      |
| display_name                 | Player-facing name.                           | Raw Iron Ore                                                               |
| category                     | Top-level category.                           | Ore                                                                        |
| subcategory                  | More specific grouping.                       | Metal Ore                                                                  |
| material_family              | Shared family for recipe/tag inheritance.     | iron                                                                       |
| progression_tier             | Where it enters progression.                  | Tier 3 - Iron Settlement Support                                           |
| rarity                       | Access/value/lore rarity, separate from tier. | Common, Uncommon, Rare, Relic                                              |
| source_type                  | How it is obtained.                           | Mineable block, node, harvest, monster drop, village trade, dimension.     |
| source_locations             | Where it appears.                             | Caves, cliffs, iron-rich biome, village blacksmith.                        |
| tool_gate                    | Required or recommended gathering tool.       | Stone pickaxe or better.                                                   |
| grade_or_purity              | Optional quality/grade/purity state.          | Poor/Normal/Rich; Impure/Pure/Pristine.                                    |
| refinement_path              | Main conversion chain.                        | Raw Iron Ore -\> Iron Ingot -\> Iron Plate.                                |
| by_products                  | Optional processing outputs.                  | Slag, stone dust.                                                          |
| primary_uses                 | Main gameplay uses.                           | Tools, guard gear, watchtower supply.                                      |
| village_use                  | Village/NPC consumption or trade role.        | Blacksmith, watchtower, repairs.                                           |
| automation_use               | Machine/logistics role.                       | Machine frames, miner parts, rails.                                        |
| magic_use                    | Magic or ritual role.                         | None, rune casing, ward component.                                         |
| economy_tags                 | Market and culture behaviour.                 | staple, strategic, shortage-sensitive.                                     |
| risk_tags                    | Danger/legality/corruption/hazard flags.      | flammable, cursed, forbidden, unstable.                                    |
| connected_systems            | Explicit system links.                        | survival, crafting, building, automation, village, trade.                  |
| scope                        | Planning status only.                         | POC Required, Alpha, Final Game.                                           |
| old_material_usefulness_note | How this resource stays useful later.         | Iron remains useful for nails, rails, repairs, guard gear, machine frames. |
| balance_notes                | First-pass tuning notes.                      | Balance draft; adjust after POC.                                           |

# Appendix C. Cross-System Use Matrix

| **Resource Family**     | **Survival** | **Building** | **Automation** | **Village** | **Magic** | **Trade** | **Dimension** |
|-------------------------|--------------|--------------|----------------|-------------|-----------|-----------|---------------|
| Wood                    | High         | High         | Medium         | High        | Low       | Medium    | Low           |
| Stone                   | High         | High         | Low            | High        | Low       | Low       | Low           |
| Clay / Brick            | Medium       | High         | Low            | High        | Low       | Medium    | Low           |
| Sand / Glass            | Low          | Medium       | Medium         | Medium      | Medium    | Medium    | Low           |
| Fibre / Cloth / Leather | High         | Medium       | Medium         | High        | Medium    | Medium    | Low           |
| Copper                  | Medium       | Medium       | High           | Medium      | Medium    | Medium    | Low           |
| Iron                    | High         | High         | Medium         | High        | Low       | Medium    | Low           |
| Steel                   | Medium       | High         | High           | High        | Low       | High      | Low           |
| Silver / Gold / Gems    | Low          | Medium       | Medium         | Medium      | High      | High      | Medium        |
| Mana Crystal            | Low          | Medium       | High           | High        | High      | High      | Medium        |
| Arcane Alloy            | Low          | Medium       | High           | High        | High      | High      | Medium        |
| Mythril                 | Low          | Medium       | Medium         | Medium      | High      | High      | Medium        |
| Voidstone               | Low          | Medium       | High           | Medium      | High      | High Risk | High          |
| Celestial Metal         | Low          | High         | High           | High        | High      | Relic     | High          |

# Appendix D. Future Resource Family Backlog

- Regional stone variants with construction identities and culture preferences.

- Tree families with logs, planks, leaves, sap, fruit, living variants, and full construction sets.

- Special soils with fertility, moisture, temperature, magical saturation, and crop effects.

- Gem families connected to magic schools, machines, lenses, trade, and culture.

- Alchemy minerals for explosives, medicine, preservation, dyes, solvents, oils, and fuels.

- Monster drop families by creature type: beast, goblin, undead, wisp, elemental, demon, fae, void, boss.

- Culture goods for every major race/civilisation once the Races and Factions document exists.

- Full dimension resource families for Fae, Deep Forge, Void, Dream, Infernal, Sky/Celestial, and Spirit realms.

- Forbidden resource legality and morality tables for necromancy, blood magic, corruption, and exploitative automation.

- Resource scarcity and depletion world settings for relaxed, normal, harsh, and custom play.
