**Fantasy Voxel Civilisation Sandbox**

**05 - Crafting and Recipe Registry**

**Version 0.1 - Detailed Design Bible Draft**

A database-ready recipe system for survival crafting, station crafting, cooking, smelting, magic, automation, NPC projects, village supply, culture recipes, quest unlocks, and dimension progression.

*Working design document - recipe system and registry foundation*

# Document Purpose

This document defines the crafting and recipe system for the Fantasy Voxel Civilisation Sandbox. It explains what counts as a recipe, how recipes are categorised, how stations and power requirements work, how recipes unlock, how they connect to blocks and items, and how they support NPC villages, automation, magic, combat, economy, story, and dimensions.

The Crafting and Recipe Registry is designed as both a readable design-bible document and a future database/spreadsheet foundation. It does not replace the later Automation System, Magic System, Economy System, NPC/Village System, Cooking System, or Dimensions document. Instead, it creates the recipe-facing rules those later documents can reference.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Numbering Note<br />
</strong>The prior Items Registry was titled internally as "05 - Items Registry" while the file is part of the 04 stage. For the master planning sequence, this document uses the clean roadmap title "05 - Crafting and Recipe Registry" so the registry order remains: 03 Blocks, 04 Items, 05 Recipes.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## Design Source

This document uses all five existing source documents as alignment anchors. Their shared rule is that resources, blocks, items, machines, magic, NPCs, villages, story, and dimensions should interconnect wherever practical.

| **Source Document**            | **Relevant Direction**                                                                                                                                            | **How This Recipe Registry Uses It**                                                                                                                |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible  | Defines the main hook: magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                                         | Recipes are treated as world-facing progression links, not isolated crafting formulas.                                                              |
| 01 - Core Gameplay Loop        | Locks the primary loop: explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                       | Recipe chains are organised around what they let the player do next in the loop.                                                                    |
| 02 - Player Progression System | Locks multi-track progression through materials, skills, recipes, research, NPCs, magic, automation, villages, reputation, exploration, dimensions, and morality. | Recipes can unlock from discovery, research, NPC teaching, books, ruins, bosses, dimensions, faction trust, and experimentation.                    |
| 03 - Blocks Registry           | Defines placeable blocks, construction pieces, stations, magic blocks, automation blocks, village warehouses, defence blocks, and block tags.                     | Recipes reference block IDs, block item forms, station blocks, village project blocks, automation endpoints, and magic infrastructure.              |
| 04 - Items Registry            | Defines raw resources, refined materials, tools, food, magic components, machine parts, village goods, knowledge items, and POC item scope.                       | Recipes use the item registry as their primary input/output catalogue and preserve item tier, rarity, quality, spoilage, repair, and NPC-use rules. |

# Static Table of Contents

- 1\. Locked Recipe Registry Identity

- 2\. Player Answer Decision Summary

- 3\. Recipe System Architecture

- 4\. Parent Recipe Data Model

- 5\. Recipe Categories, Families, and Tags

- 6\. Recipe Entry Fields and Database Schema

- 7\. Crafting Sources, Stations, and Power

- 8\. Inputs, Outputs, By-products, and Substitutions

- 9\. Unlocks, Discovery, Research, and Recipe Book

- 10\. Time, Batching, Throughput, Fuel, and Automation

- 11\. Quality, Failure, Risk, and World Effects

- 12\. Repair, Maintenance, Cooking, and Spoilage

- 13\. NPC, Village, and Project Recipes

- 14\. Automation and Machine Recipes

- 15\. Magic, Alchemy, Rune, and Ritual Recipes

- 16\. Culture, Quest, Forbidden, and Dimension Recipes

- 17\. Proof-of-Concept Recipe Scope

- 18\. Full Game Recipe Category Matrix

- 19\. Detailed Recipe Registry v0.1

- 20\. Core Production Chains

- 21\. Sample Detailed Recipe Entry

- 22\. Balancing Rules

- 23\. Open Questions for Later Documents

- Appendix A. POC Recipe Checklist

- Appendix B. Recipe Database Field Template

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Recipe Family Backlog

# 1. Locked Recipe Registry Identity

Recipes are the transformation layer of the game. They define how gathered resources become tools, blocks, stations, machines, food, magic components, village supplies, quest objects, repairs, rituals, and dimension keys. Because the game is a survival civilisation sandbox, recipes should never be treated as isolated crafting formulas only. They should explain how the player turns the world into capability and how that capability can feed settlements, automation, magic, story, or defence.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Locked Rule<br />
</strong>A recipe should not exist only to fill a crafting list. Every recipe should support survival, building, automation, magic, NPC civilisation, combat, trade, exploration, story, progression, repair, settlement growth, or world-state change.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**      | **Design Meaning**                                                                                                 | **Player-Facing Result**                                                |
|-------------------------|--------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Survival Transformation | Basic resources become tools, food, light, shelter, water containers, and early equipment.                         | The player can survive the first day and choose their first direction.  |
| Crafting Ingredient Web | Raw resources convert into refined materials, components, and sub-components.                                      | Production chains become readable and expandable.                       |
| Civilisation Supply     | Recipes produce goods villages request, consume, build with, repair with, or trade.                                | Crafting visibly changes village growth and raid outcomes.              |
| Automation Path         | Hand crafting unlocks components, components unlock machines, machines unlock bulk production.                     | The player can scale from personal crafting to settlement-scale supply. |
| Magic Infrastructure    | Mana, runes, wards, conduits, catalysts, ritual items, and enchanted stations are crafted.                         | Magic becomes practical technology rather than combat-only power.       |
| Progression Gate        | Recipes unlock through materials, tools, stations, NPCs, books, ruins, research, factions, bosses, and dimensions. | Discovery and growth naturally unlock new gameplay.                     |
| World-State Evidence    | Project recipes create buildings, repairs, defences, corruption, cleansing, relics, or ritual results.             | The world visibly remembers what was crafted and supplied.              |

# 2. Player Answer Decision Summary

The following table converts the selected multiple-choice answers into locked recipe-system decisions. Question 29 was answered as both B and E, so spoilage and preservation exist, while spoilage can also be reduced, disabled, or simplified through difficulty/world settings.

| **Area**                   | **Locked Decision**                                                                                                                                                                                                    |
|----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Registry Role              | Full design-bible document plus spreadsheet/database-ready recipe framework with light technical implementation notes.                                                                                                 |
| Detail Level               | Full gameplay detail for v0.1 recipes: station, inputs, output, unlock, time, fuel/power, by-products, tags, automation support, NPC use, and POC status.                                                              |
| v0.1 Size                  | Target 100-150 recipes, with 40-70 marked POC Required.                                                                                                                                                                |
| Recipe Categories          | Use clear categories: hand crafting, station crafting, smelting, cooking, alchemy, rune crafting, machine assembly, automation, NPC/village projects, quest, culture, and dimension recipes.                           |
| Unique IDs                 | Every recipe has a unique database-friendly internal ID.                                                                                                                                                               |
| Outputs and By-products    | Multiple outputs and by-products are supported for smelting, crushing, refining, alchemy, magic, automation, and waste systems.                                                                                        |
| Quality Interaction        | Player skill, station quality, NPC specialist support, material quality, and magic can affect output quality.                                                                                                          |
| Crafting Time              | Simple hand recipes can be instant. Stations, machines, rituals, NPC projects, and advanced recipes can take time and may be interruptible.                                                                            |
| Fuel and Power             | Recipes can require fuel, mana, mechanical power, water/wind power, steam, rune power, leyline power, or portal power.                                                                                                 |
| Unlocks                    | Recipes unlock through gathering, stations, NPC teaching, books, ruins, research, faction trust, quests, bosses, dimensions, and hidden discovery.                                                                     |
| Shaped and Shapeless       | Both shaped and shapeless recipes exist. Tools, machines, runes, and iconic objects can be shaped; simple conversions and food prep can be shapeless.                                                                  |
| Tags and Substitutions     | Ingredient tags support any_log, any_plank, any_stone, any_ingot, any_mana_crystal, culture variants, quality equivalents, and material substitutions.                                                                 |
| NPC Recipes                | NPCs mostly use the same recipe/resource logic as players, while large village builds use Project Recipe entries with stages and consequences.                                                                         |
| Automation Recipes         | Machine recipes live in the same registry but include extra fields for time, throughput, power type, batch size, input/output slots, and automation compatibility.                                                     |
| Failure and Risk           | Risky systems can fail: rituals, alchemy, forbidden magic, unstable machines, poor materials, and interrupted crafting. Failure can create junk, waste, explosions, corruption, curses, raids, or faction anger.       |
| Repair and Maintenance     | Repair recipes cover tools, weapons, armour, machines, blocks, village repairs, magical cleansing, and maintenance stations. Higher quality usually costs more to repair.                                              |
| Cooking and Spoilage       | Cooking belongs in this registry. Fresh foods spoil, cooked foods last longer, preserved foods last longest, and spoilage can also be reduced/disabled by difficulty/world settings.                                   |
| Magic Recipes              | Alchemy and rune crafting are included now, with early POC recipes plus future structures for potions, reagents, transmutation, explosives, catalysts, runes, conduits, wards, rituals, and portals.                   |
| Shape Recipes              | Block shape conversion uses a hybrid model: generated shape recipes for eligible materials plus explicit recipes for important exceptions.                                                                             |
| Machine Components         | Machines require visible components such as frames, gears, plates, belts, pipes, coils, filters, cores, and fuel/power parts.                                                                                          |
| Early Automation Branch    | Mechanical first, then magical support, then hybrid magitech.                                                                                                                                                          |
| POC Chain                  | POC proves survival basics + starter tools + first building blocks + furnace chain + copper mechanisms + iron settlement chain + basic rune/mana furnace + village watchtower delivery.                                |
| Village Warehouse          | Automation can feed village warehouses directly after trust/permission is earned.                                                                                                                                      |
| Recipe Book                | Known, hinted, hidden, discovered, NPC-taught, research-locked, and faction-locked recipe states appear in the recipe book, with grouped notifications.                                                                |
| UI Fields                  | Each recipe supports icon, category, station tab, search tags, hidden state, tutorial note, and warning text.                                                                                                          |
| Batch Crafting             | Stations, machines, cooking, construction supply packs, and automation recipes can support batch crafting.                                                                                                             |
| Station Upgrades           | Stations can upgrade through material tiers, add-ons, NPC specialists, magic/runes, and machine modules.                                                                                                               |
| Multiplayer Readiness      | Ownership/permissions can apply to stations, automation outputs, village deliveries, project contributions, and warehouse access.                                                                                      |
| Balance Philosophy         | Use first-pass values marked as balance draft. Game feel comes first, supported by enough realism to feel believable. Early crafting is forgiving; village-scale production requires larger quantities and automation. |
| Old Materials              | Older materials stay useful through parts, repairs, construction, culture variants, automation inputs, and village needs.                                                                                              |
| Morality and World Effects | Forbidden magic, necromancy, corruption, exploitation, cursed automation, and dark rituals have recipe paths and can affect the world.                                                                                 |
| Difficulty Settings        | Recipe costs, timers, failure states, spoilage, and destructive risk can scale by difficulty/world settings.                                                                                                           |
| Quest and Dimension Links  | Recipes can link to quests, ruins, NPCs, dimensions, faction arcs, realm materials, portal keys, boss keys, and story artifacts.                                                                                       |

# 3. Recipe System Architecture

The recipe system should be data-driven from the beginning. A simple hand recipe, a furnace recipe, a mana furnace recipe, a machine recipe, and a village project recipe all belong to the same registry but use different category extensions. This keeps recipes searchable, balanceable, importable, and compatible with future modding or spreadsheet workflows.

| **Layer**               | **Purpose**                                                                               | **Examples**                                                                                   |
|-------------------------|-------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Base Recipe Definition  | The parent record all recipes inherit from.                                               | ID, display name, recipe type, category, station, inputs, outputs, unlock, tags, scope.        |
| Recipe Category         | Defines broad behaviour and UI grouping.                                                  | Hand, workbench, furnace, forge, cooking, alchemy, rune, machine, project, dimension.          |
| Station / Process Layer | Defines where and how the recipe runs.                                                    | Inventory, workbench, furnace, rune table, mana furnace, village warehouse, machine assembler. |
| Input and Output Model  | Defines exact ingredients, tags, substitutions, by-products, and batch size.              | any_log, Raw Iron Ore, Iron Ingot, Slag, Watchtower Supply Crate.                              |
| Runtime State           | Used for timed crafting, machine processing, projects, rituals, and interruptions.        | Progress %, fuel remaining, mana charge, blocked output, stage complete, failure state.        |
| Connected Systems       | Links recipes to blocks, items, NPCs, automation, magic, economy, quests, and dimensions. | Village requests, station menus, recipe book, machine routing, NPC construction, research.     |
| Planning Metadata       | Documentation-only fields not required in shipped recipe data.                            | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred, balance notes.                   |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Important Data Rule<br />
</strong>POC status, Alpha status, Placeholder status, and balance-draft comments are planning columns. They should not be hard gameplay properties inherited by a recipe. Shipped recipe data should remain clean and reusable.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 4. Parent Recipe Data Model

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                      | **Example Children**                                             |
|-------------------------------|--------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------|
| BaseRecipe                    | Core identity, display name, station, input list, output list, tags, unlock method, time, power/fuel, scope. | Every recipe.                                                    |
| HandRecipe                    | No station or very light station; mostly instant; simple tags; low complexity.                               | Rope, crude pickaxe, crude axe, torch.                           |
| StationRecipe                 | Requires a station block, station tier, input/output slots, and optional station upgrades.                   | Workbench tools, stone bricks, glass, iron sword.                |
| ProcessingRecipe              | Consumes fuel/power/time and can produce by-products.                                                        | Smelting ore, crushing ore, cooking meat, glassmaking.           |
| CookingRecipe                 | Food value, spoilage, buff, NPC food need, preservation state, difficulty setting hooks.                     | Bread, cooked meat, stew, guard rations.                         |
| AlchemyRecipe                 | Risk, failure, waste, catalyst, medicine, potion, explosive, transmutation, reagent rules.                   | Minor healing potion, blast powder, mana binder.                 |
| RuneRecipe                    | Mana charge, rune base, school, purity, corruption risk, inscription tool, magic unlock.                     | Basic Rune, Ward Core, Fire Rune, Machine Rune.                  |
| MachineAssemblyRecipe         | Component roles, mechanical/magical branch, machine category, station requirements.                          | Basic Mana Miner, Conveyor, Sorter, Machine Assembler.           |
| AutomationProcessRecipe       | Power type, throughput, input slots, output slots, blocked-output rules, batch size.                         | Ore crushing, efficient smelting, automated plank cutting.       |
| ProjectRecipe                 | Village blueprint, stages, resource storage, NPC job roles, build time, consequences.                        | Watchtower, Palisade Wall, Village Gate, Blacksmith Upgrade.     |
| QuestCultureRecipe            | Faction/culture requirements, story state, hidden status, reputation effects, moral consequences.            | Dwarven Rune Anvil, Captured Goblin Standard, Dark Ward Core.    |
| DimensionRecipe               | Realm source, portal role, boss key, realm hazard, overworld utility, world-state impact.                    | Portal Frame, Voidstone Plate, Dream Glass Pane, Celestial Core. |

# 5. Recipe Categories, Families, and Tags

| **Top-Level Category**    | **Purpose**                                                                                                         | **Notes**                                                           |
|---------------------------|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| Hand Crafting             | Inventory or quick-craft recipes for simple survival, first tools, rope, bundles, and emergency field items.        | Fast or instant; low complexity; mostly early game.                 |
| Workbench Crafting        | Core block, tool, furniture, simple gear, and early component recipes.                                              | Primary early station; supports shaped and shapeless recipes.       |
| Furnace / Smelting        | Ore-to-ingot, sand-to-glass, clay-to-brick, cooked food, and basic fuel processing.                                 | Consumes fuel; timed; can produce slag or ash by-products later.    |
| Forge / Anvil / Hammering | Plates, rods, nails, tools, weapons, armour, reinforced parts, and repair recipes.                                  | Quality and NPC specialist effects matter strongly.                 |
| Sawmill / Wood Processing | Planks, beams, boards, shafts, paper pulp, furniture pieces, and high-yield wood conversion.                        | Improves efficiency and feeds construction/village projects.        |
| Cooking and Preservation  | Meals, rations, preserved foods, stews, baked goods, dried ingredients, and culture foods.                          | Food value, spoilage, NPC need, and buff fields matter.             |
| Alchemy                   | Potions, catalysts, medicine, explosives, transmutation, oils, fuels, reagents, and unstable mixtures.              | Can fail; can create waste; often uses risk warnings.               |
| Rune Crafting             | Blank runes, basic runes, elemental utility runes, ward cores, machine runes, conduits, and ritual symbols.         | Uses mana materials, rune table, knowledge unlocks, and magic tags. |
| Machine Assembly          | Frames, gears, cores, miner heads, conveyors, chutes, pipes, sorters, batteries, and full machines.                 | Uses component chains and station/power requirements.               |
| Automation Processing     | Recipes run by machines: crushing, refining, smelting, routing, batching, sorting, and automated assembly.          | Throughput, time, slots, power, and batch size are required fields. |
| NPC / Village Project     | Blueprint and settlement build recipes such as watchtowers, walls, markets, wells, shrines, workshops, and repairs. | Consumes exact stored resources over build stages using NPC jobs.   |
| Quest / Story / Culture   | Recipe unlocks, faction goods, culture variants, ritual keys, narrative projects, and moral paths.                  | Often hidden, NPC-taught, faction-locked, or story-gated.           |
| Dimension / Realm         | Portal frames, realm materials, dimensional machines, boss keys, realm foods, and overworld-use realm blocks.       | Mid-to-end-game; never purely cosmetic.                             |

| **Tag Type** | **Example Tags**                                                                                           | **Used By**                                                 |
|--------------|------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| Progression  | starter, wood-tier, stone-tier, copper-tier, iron-tier, mana-tier, steel-tier, dimension, endgame          | Recipe book, progression views, unlock guidance.            |
| Station      | hand, workbench, furnace, forge, sawmill, loom, rune-table, mana-furnace, alchemy, machine-assembler       | Station menus and UI filters.                               |
| Material     | wood, stone, metal, copper, iron, steel, clay, glass, fibre, crystal, mana, rune, corrupted                | Ingredient matching, substitutions, automation filters.     |
| System       | crafting, building, automation, magic, village-use, npc-build, repair, food, combat, economy, quest        | Cross-system logic and content search.                      |
| Risk         | safe, spoilable, unstable, explosive, forbidden, corrupting, cursed, interruptible, failure-possible       | Warnings, difficulty settings, faction reaction, safety UI. |
| Recipe Book  | known, hinted, hidden, discovered, npc-taught, researched, faction-locked, culture-locked, boss-locked     | Discovery state and player-facing guidance.                 |
| Automation   | manual-only, accepts-automation-input, outputs-to-automation, machine-process, warehouse-compatible, batch | Transport and machine routing logic.                        |
| NPC/Economy  | npc-consumed, npc-crafted, npc-taught, village-request, trade-good, guard-supply, project-supply           | Village simulation and economy use.                         |

# 6. Recipe Entry Fields and Database Schema

Each row in the detailed registry can be transformed into a future database or spreadsheet. The document table keeps entries readable, while Appendix B defines the fuller field template for implementation.

| **Field**          | **Purpose**                                                                                              | **Use**                                                                         |
|--------------------|----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| recipe_id          | Unique internal ID, e.g. recipe.workbench.tool.iron_pickaxe.                                             | Required for every recipe.                                                      |
| display_name       | Player-facing name.                                                                                      | Can differ from output item name for project or process recipes.                |
| recipe_type        | Hand, Workbench, Furnace, Forge, Cooking, Alchemy, Rune, Machine, Automation, Project, Quest, Dimension. | Used by UI tabs and station filtering.                                          |
| station_required   | None, workbench, furnace, forge, rune table, alchemy table, machine assembler, village warehouse, etc.   | Can include station tier or upgrade requirements.                               |
| inputs             | Item IDs/tags and quantities.                                                                            | Supports exact items, tags, substitutions, qualities, and staged consumption.   |
| outputs            | Primary output item/block/project result.                                                                | Supports multiple outputs and batch quantities.                                 |
| by_products        | Waste, slag, ash, dust, residue, bonus materials, failed outputs.                                        | Optional but important for processing and risk systems.                         |
| unlock_method      | Known, discovered, crafted, researched, NPC-taught, culture, faction, boss, dimension, hidden, quest.    | Feeds recipe book visibility and progression.                                   |
| craft_time         | Instant, seconds, minutes, in-game hours, staged days for projects.                                      | Balance draft value in v0.1.                                                    |
| fuel_or_power      | None, fuel, mana, mechanical, water, wind, steam, rune, leyline, portal.                                 | Can be fixed, optional, or station-derived.                                     |
| batch_size         | How many outputs are produced per recipe run.                                                            | Important for construction and automation.                                      |
| automation_support | Manual only, automation input, automation output, machine recipe, warehouse-compatible.                  | Controls future logistics integration.                                          |
| npc_use            | Whether NPCs can craft, request, consume, teach, or use the output.                                      | Connects to economy, jobs, and village projects.                                |
| quality_rules      | Whether output quality can vary and what influences it.                                                  | Material quality, station tier, skill, NPC specialist, magic, failure.          |
| failure_rules      | Can fail, cannot fail, risky only, interrupted only, dark magic risk, unstable machine risk.             | Used by alchemy, rituals, forbidden paths, and unstable recipes.                |
| tags               | Search/system tags.                                                                                      | Examples: starter, copper-tier, village-use, magic, automation, repair, hidden. |
| scope              | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                                            | Planning metadata only, not shipped gameplay data.                              |

# 7. Crafting Sources, Stations, and Power

Crafting begins with hand recipes and expands through stations. Stations should be physical blocks where possible. Upgraded stations, NPC specialists, magic modules, and machine add-ons can improve quality, speed, yield, allowed recipes, or automation compatibility.

| **Crafting Source / Station** | **Unlock Tier**     | **Primary Recipe Types**                                                          | **Important Notes**                                                      |
|-------------------------------|---------------------|-----------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Inventory / Hand              | Primitive Survival  | Crude tools, rope, thatch, simple bundles, emergency repairs.                     | No station; usually instant; low-output efficiency.                      |
| Workbench                     | Wood and Stone      | Tools, planks, basic blocks, chests, simple components, early furniture.          | First general station; supports shaped recipes.                          |
| Stone Furnace                 | Wood and Stone      | Ore smelting, glass, cooked meat, clay brick, fuel conversion.                    | Consumes fuel; timed; can later accept automation input/output.          |
| Hammer / Basic Forge          | Copper and Iron     | Plates, rods, nails, gear blanks, weapons, armour, repairs.                       | Quality and NPC blacksmith effects matter.                               |
| Sawmill                       | Copper Mechanisms   | Efficient planks, beams, shafts, boards, sawdust by-product.                      | Mechanical station; feeds villages and construction.                     |
| Rune Table                    | Mana Infrastructure | Blank runes, basic runes, ward cores, rune tools, mana tuning.                    | Knowledge-gated; connects to magic, machines, and wards.                 |
| Mana Furnace                  | Mana Infrastructure | Fast smelting, mana-infused outputs, refined smelting, early magic processing.    | Uses mana crystal or mana conduit input.                                 |
| Village Warehouse             | Village Support     | Delivery manifests, supply tokens, project recipes, staged build recipes.         | NPCs withdraw stored resources and automation can input with permission. |
| Machine Assembler             | Steel and Industry  | Full machines, advanced logistics, frames, filters, batteries, cores.             | Later automation progression; not POC.                                   |
| Alchemy Table                 | Mana / Mid Game     | Potions, medicine, catalysts, oils, explosives, preservation salts.               | Can fail; uses risk and by-product fields.                               |
| Ritual Structure              | Mid/Late Game       | Portal keys, faction/culture rituals, cleansing, dark paths, world-state recipes. | Staged, costly, risky, often story-gated.                                |

# 8. Inputs, Outputs, By-products, and Substitutions

Recipes support exact ingredients and ingredient tags. Exact ingredients are useful for quests, culture identity, magic, quality control, and project clarity. Tags are useful for readable sandbox crafting and variants.

| **Substitution/Output Type** | **Example**                                                            | **Design Use**                                                                     |
|------------------------------|------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Exact Ingredient             | recipe requires Iron Ingot specifically                                | Used when tier, lore, strength, magic, or balance matters.                         |
| Tag Ingredient               | recipe accepts any_log or any_plank                                    | Used for generic construction, furniture, fuel, and simple material families.      |
| Quality Requirement          | requires Refined or better Iron Plate                                  | Used for high-tier equipment, rituals, precision machines, and masterwork outputs. |
| Culture Variant              | accepts any_stone_brick, but Dwarven Stone Brick improves result       | Used to make cultures distinct without duplicating every recipe.                   |
| By-product                   | ore smelting may create Slag; sawmill creates Sawdust                  | Feeds alchemy, fuel, waste, construction filler, or cleanup systems later.         |
| Bonus Output                 | rich ore processing can occasionally output Mana Shard or Gem Fragment | Rewards better tools, magic, machines, or higher-quality deposits.                 |

# 9. Unlocks, Discovery, Research, and Recipe Book

| **Unlock Source**     | **Examples**                                                      | **Design Purpose**                                                         |
|-----------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------|
| Known at Start        | Crude tools, rope, thatch, basic torch.                           | Supports immediate survival without menu confusion.                        |
| Material Discovery    | Mining copper reveals copper wire/plate/gear hints.               | Rewards natural exploration and gathering.                                 |
| Station Discovery     | Building a furnace reveals smelting recipes.                      | Makes stations feel like capability unlocks.                               |
| NPC Teaching          | Village mage teaches Basic Rune; blacksmith teaches iron repairs. | Connects recipes to living settlements.                                    |
| Knowledge Item        | Basic Rune Note, Torn Research Page, old manuals.                 | Lets ruins, dungeons, books, and loot unlock systems.                      |
| Research Desk         | Combines pages, samples, and experiments to reveal recipes.       | Optional deeper progression for automation, magic, and ancient technology. |
| Faction/Culture Trust | Dwarven Rune Anvil, Elven Livingwood Beam.                        | Makes culture recipes earned and social.                                   |
| Quest/Story Gate      | Watchtower stages, portal stabiliser, shrine rituals.             | Links crafting to world-state change.                                      |
| Boss/Dimension Gate   | Voidstone Plate, Celestial Core.                                  | Gates endgame systems through challenge and realm progression.             |
| Hidden/Forbidden      | Dark Ward Core, necromancy worker core.                           | Enables morality, risk, and faction reaction.                              |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Recipe Book Rule<br />
</strong>The recipe book supports known, hinted, hidden, discovered, NPC-taught, research-locked, faction-locked, and dimension-locked states. Notifications should be grouped intelligently so recipe unlocks feel rewarding without spamming the player.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 10. Time, Batching, Throughput, Fuel, and Automation

The registry should include placeholder balancing fields now, but final numeric values should be tuned after POC testing. Simple recipes can be instant. Timed crafting matters most for stations, machines, rituals, project recipes, and automation throughput.

| **Timing/Power Rule** | **Examples**                                                     | **Design Purpose**                                           |
|-----------------------|------------------------------------------------------------------|--------------------------------------------------------------|
| Instant               | Rope, plank conversion, simple workbench recipes.                | Keeps early crafting quick and readable.                     |
| Short Timed           | Ore smelting, rune inscription, cooking, hammering.              | Creates station identity without causing frustration.        |
| Machine Timed         | Crushing, automated smelting, sawmill cutting.                   | Used for throughput and bottleneck design.                   |
| Batch Crafting        | Construction materials, arrows, nails, planks, food batches.     | Reduces click fatigue and supports village-scale supply.     |
| Staged Projects       | Watchtower, gate, market, shrine, mage tower.                    | Consumes resources over time and makes NPC labour visible.   |
| Fuel / Power          | Coal furnace, water wheel, windmill, mana conduit, rune engine.  | Recipes must know their power dependency for balance and UI. |
| Automation Ports      | Input slot, output slot, blocked-output state, warehouse import. | Future implementation needs explicit routing behaviour.      |

# 11. Quality, Failure, Risk, and World Effects

Quality should matter where it creates interesting outcomes: gear, tools, armour, precision components, magical items, food, culture goods, and specialist crafts. Failure should not be a constant annoyance. It belongs to risky recipes, forbidden recipes, unstable machines, poor materials, or interrupted advanced processes.

| **Risk/Quality Type**    | **Examples**                                             | **Design Purpose**                                                                   |
|--------------------------|----------------------------------------------------------|--------------------------------------------------------------------------------------|
| Quality Output           | Crude, Standard, Refined, Masterwork, Legendary.         | Affected by material quality, station tier, player skill, NPC specialist, and magic. |
| Safe Failure-Free        | Basic tools, planks, stone bricks, simple food.          | Early game should be forgiving.                                                      |
| Interrupted Timed Recipe | Rune inscription, mana furnace core, machine assembly.   | Usually returns some inputs and preserves expensive ingredients where fair.          |
| Alchemy Failure          | Bitter sludge, unstable residue, weak potion, fumes.     | Creates risk and useful/waste by-products.                                           |
| Ritual Failure           | Corruption, curses, rift event, faction anger, storm.    | Major recipes can affect the world.                                                  |
| Forbidden Recipe         | Dark Ward Core, undead worker, blood/shadow fluid path.  | Powerful but morally and politically dangerous.                                      |
| Machine Overload         | Jammed output, damaged machine, wasted fuel, mana surge. | Used sparingly to create maintenance gameplay.                                       |

# 12. Repair, Maintenance, Cooking, and Spoilage

Repair recipes belong in this registry because they transform damaged items and blocks back into usable states. Cooking also belongs here because food connects survival, buffs, NPC needs, spoilage, preservation, trade, and culture identity.

| **Recipe Group**     | **Examples**                                                | **Design Purpose**                                                                          |
|----------------------|-------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Tool Repair          | Damaged pickaxe + matching material + station.              | Keeps durability meaningful without forcing constant replacement.                           |
| Weapon/Armour Repair | Iron sword or leather tunic repair with matching materials. | Higher quality is more durable and more expensive to repair.                                |
| Machine Maintenance  | Copper wire, gears, frames, wrench action.                  | Only needed after overload, storms, sieges, or harsh settings; no routine decay by default. |
| Village Repair       | Damaged walls, gates, houses, roads, warehouses.            | NPC builders consume stored resources and repair in stages.                                 |
| Cooking              | Bread, cooked meat, stew, rations.                          | Improves food value and NPC usefulness.                                                     |
| Preservation         | Dried meat, preserves, smoked food, salted goods.           | Fresh foods spoil fastest, cooked foods last longer, preserved foods last longest.          |
| Difficulty Setting   | Spoilage reduced, disabled, or relaxed.                     | Supports cosy/peaceful play without deleting the deeper system.                             |

# 13. NPC, Village, and Project Recipes

Village construction projects should use special Project Recipe entries. These are not normal one-click crafts. They define stored materials, NPC job roles, stages, build time, damage/repair states, reputation rewards, and gameplay consequences. The POC watchtower is the first proof of this system.

| **Project Layer**            | **Example**                                                                | **Design Purpose**                                        |
|------------------------------|----------------------------------------------------------------------------|-----------------------------------------------------------|
| Project Request              | Village generates Builder Request Slip and request board entry.            | Player sees required materials and reason for project.    |
| Warehouse Delivery           | Player or automation delivers resources to village warehouse.              | Resources are tracked as real inventory.                  |
| Supply Crate / Project Stock | Warehouse allocates exact resources to project.                            | Prevents invisible village construction.                  |
| NPC Construction Stage       | Builders carry materials, place scaffold, build foundation/frame/platform. | Construction is visible and can be interrupted by danger. |
| Functional Completion        | Watchtower activates guard detection and raid response bonus.              | Buildings are not only cosmetic.                          |
| Repair Loop                  | Raid damage creates repair recipe requirements.                            | Village consequences remain recoverable.                  |

# 14. Automation and Machine Recipes

Automation recipes use the same registry, but machine recipes need fields for throughput, power, slots, input/output sides, blocked outputs, visible item transport, and warehouse compatibility. The POC only needs a basic mana miner, item chute, furnace/mana furnace, storage, and village warehouse input.

| **Automation Layer** | **Recipes / Outputs**                                              | **Design Purpose**                                                      |
|----------------------|--------------------------------------------------------------------|-------------------------------------------------------------------------|
| Entry Automation     | Copper wire, plates, gears, machine frames, basic machine core.    | Hand/station crafting produces visible parts.                           |
| POC Machine          | Basic Mana Miner.                                                  | Extracts from ore nodes or marked deposits and proves resource scaling. |
| Transport            | Basic Item Chute.                                                  | Moves items visibly from miner to furnace/storage/warehouse.            |
| Processing           | Stone Furnace and Mana Furnace.                                    | Turns ore into ingots for tools and village projects.                   |
| Storage Output       | Wooden Chest and Village Warehouse.                                | Stores automation output and supplies NPC construction.                 |
| Later Factory        | Conveyors, splitters, sorters, crushers, assemblers, power blocks. | Expands into full Satisfactory-style chains later.                      |

# 15. Magic, Alchemy, Rune, and Ritual Recipes

Magic recipes should connect to infrastructure. The POC magic path begins with mana crystals, mana shards, mana dust, blank rune stones, basic runes, ward cores, rune table, mana furnace, ward lantern, rune chisel, rune tuner, and apprentice staff. Later recipes expand into elemental runes, conduits, mana batteries, spell turrets, rituals, portals, and forbidden paths.

| **Magic Recipe Layer** | **Examples**                                                              | **Design Purpose**                                        |
|------------------------|---------------------------------------------------------------------------|-----------------------------------------------------------|
| Mana Processing        | Raw Mana Crystal -\> Mana Shard -\> Mana Dust.                            | Creates grounded magical ingredient progression.          |
| Rune Base              | Stone Brick + Clay + Mana Dust -\> Blank Rune Stone.                      | Links mining/building materials to magic.                 |
| Basic Rune             | Blank Rune Stone + Mana Dust + Mana Shard.                                | First magic logic component and POC tutorial object.      |
| Ward Path              | Basic Rune + Mana Crystal + Copper Wire -\> Ward Core -\> Ward Lantern.   | Directly improves village safety and POC raid outcome.    |
| Machine Magic          | Basic Rune and mana components support Mana Furnace and Basic Mana Miner. | Magic powers automation and processing.                   |
| Alchemy                | Potions, catalysts, medicine, oils, explosives, transmutation.            | Optional but planned with failure and by-product support. |
| Rituals                | Portal frames, cleansing, dark magic, dimension keys.                     | Staged, costly, and sometimes dangerous.                  |

# 16. Culture, Quest, Forbidden, and Dimension Recipes

Culture recipes make settlements feel different. Quest recipes turn crafting into world-state change. Forbidden recipes enable villain, tyrant, necromancer, corruption, or dark automation paths with consequences. Dimension recipes should never just recolour old items; they should unlock new machines, magic, settlement upgrades, portals, bosses, and realm-level consequences.

| **Branch**        | **Examples**                                                            | **Design Purpose**                                                               |
|-------------------|-------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Culture Recipes   | Dwarven Rune Anvil, Elven Livingwood Beam, Goblin Scrap Engine.         | Race/culture identity, trade, village growth, and reputation rewards.            |
| Quest Recipes     | Bandit Camp Map Assembly, Captured Goblin Standard, restored relics.    | Turns loot and knowledge into objectives and story proof.                        |
| Forbidden Recipes | Dark Ward Core, Bone Worker Core, blood/shadow catalysts.               | Powerful but creates fear, faction hostility, corruption, or moral consequences. |
| Dimension Recipes | Portal Stabiliser, Voidstone Plate, Fae Seedling Pot, Dream Glass Pane. | Realm materials remain useful in the overworld.                                  |
| Endgame Recipes   | Celestial Core, city-scale mana networks, world-shaping rituals.        | Civilisation-scale transformation and long-term sandbox goals.                   |

# 17. Proof-of-Concept Recipe Scope

The POC recipe set is intentionally focused. It should prove that a player can gather resources, craft starter tools, process wood/stone/copper/iron, unlock mana/runes, build the first automation chain, deliver real resources to a village warehouse, and cause NPCs to complete a watchtower that changes the next threat outcome.

| **POC Recipe Family**   | **Representative Recipes**                                                                        | **Purpose**                                              |
|-------------------------|---------------------------------------------------------------------------------------------------|----------------------------------------------------------|
| Survival Basics         | Rope, thatch, crude pickaxe, crude axe, torch, arrows, water flask.                               | First 5-15 minutes and basic survival.                   |
| Wood and Stone Building | Planks, beams, cobblestone, stone bricks, door, fence, chest, workbench.                          | Shelter, village supplies, watchtower, cosy build proof. |
| Furnace Chain           | Stone furnace core, stone furnace, glass, clay brick, cooked meat.                                | Processing, fuel, food, glass, smelting unlock.          |
| Copper Mechanisms       | Copper ingot, wire, plate, gear, machine frames, machine core, chute segment.                     | Entry automation components.                             |
| Iron Settlement Support | Iron ingot, rod, plate, nails, pickaxe, axe, sword, miner head.                                   | Village defence, stronger tools, watchtower fittings.    |
| Magic Utility           | Mana shard, mana dust, blank rune, basic rune, ward core, rune table, mana furnace, ward lantern. | Magic infrastructure and village safety.                 |
| Automation Chain        | Basic mana miner, item chute, furnace/mana furnace, storage, warehouse input.                     | Production scaling and village supply.                   |
| Village Watchtower      | Supply crate, foundation, frame, platform, completed watchtower.                                  | NPC construction and changed raid outcome.               |

# 18. Full Game Recipe Category Matrix

| **Category** | **Family**               | **Examples**                                                    | **System Role**                                  |
|--------------|--------------------------|-----------------------------------------------------------------|--------------------------------------------------|
| Survival     | Primitive Tools          | Crude axe, crude pickaxe, torch, rope, campfire kit             | Starter survival and first resource access.      |
| Construction | Wood/Stone/Clay Shapes   | Planks, beams, slabs, stairs, roofs, windows, bricks            | Player building and NPC projects.                |
| Materials    | Raw-to-Refined           | Ores to ingots, clay to brick, sand to glass, logs to planks    | Core production and progression.                 |
| Machines     | Mechanical Components    | Gears, shafts, frames, pipes, belts, cores                      | Factory setup and repair.                        |
| Machines     | Full Machines            | Miner, sawmill, crusher, assembler, pump, power blocks          | Automation and large-scale supply.               |
| Magic        | Runes and Mana           | Mana dust, blank runes, elemental runes, ward cores, conduits   | Magic infrastructure and utility.                |
| Magic        | Rituals and Portals      | Ritual anchors, portal stabilisers, cleansing rites, dark rites | Dimensions and world-state change.               |
| Food         | Cooking and Preservation | Bread, meat, stew, rations, preserves, dried food               | Survival, NPC needs, trade, buffs.               |
| Combat       | Weapons/Armour/Ammo      | Swords, bows, arrows, shields, armour, staff, turrets           | Defence, raids, dungeons, guards.                |
| NPC/Village  | Project Recipes          | Watchtower, palisade, market, shrine, blacksmith, mage tower    | Settlement growth and consequences.              |
| Economy      | Trade Goods              | Tool bundles, grain sacks, festival goods, culture goods        | Village economy and reputation.                  |
| Quest/Story  | Keys/Trophies/Maps       | Camp map, captured standard, old key, restored relic            | Story state, exploration, proof of action.       |
| Culture      | Race Recipes             | Dwarven anvil, elven livingwood, goblin engines, undead cores   | Culture identity and faction progression.        |
| Dimensions   | Realm Materials          | Voidstone plate, dream glass, infernal brick, celestial core    | Endgame machines, magic, portals, world-shaping. |

# 19. Detailed Recipe Registry v0.1

The following registry entries define the v0.1 recipe target. Values are first-pass balance draft numbers and should be adjusted after the POC proves pacing. Scope is planning metadata, not shipped gameplay data.

## 19.1 POC Required Recipes

| **ID**                                          | **Display Name**              | **Type / Station**                | **Inputs**                                                                                        | **Outputs**                                                  | **Unlock**                                    | **Time / Power**                     | **Scope**    |
|-------------------------------------------------|-------------------------------|-----------------------------------|---------------------------------------------------------------------------------------------------|--------------------------------------------------------------|-----------------------------------------------|--------------------------------------|--------------|
| recipe.hand.material.rope                       | Twisted Plant Rope            | Hand / Shapeless                  | 3 Plant Fibre                                                                                     | 1 Rope Bundle                                                | Known at start                                | Instant / None                       | POC Required |
| recipe.hand.material.thatch_bundle              | Thatch Bundle                 | Hand / Shapeless                  | 4 Plant Fibre or Reeds                                                                            | 1 Thatch Bundle                                              | Known at start                                | Instant / None                       | POC Required |
| recipe.hand.tool.crude_pickaxe                  | Crude Pickaxe                 | Hand / Shaped                     | 2 Stick, 2 Stone Chunk or Flint, 1 Plant Fibre                                                    | 1 Crude Pickaxe                                              | Known at start                                | Instant / None                       | POC Required |
| recipe.hand.tool.crude_axe                      | Crude Axe                     | Hand / Shaped                     | 2 Stick, 1 Flint or Stone Chunk, 1 Plant Fibre                                                    | 1 Crude Axe                                                  | Known at start                                | Instant / None                       | POC Required |
| recipe.hand.utility.basic_torch                 | Basic Torch                   | Hand / Shapeless                  | 1 Stick, 1 Coal Chunk, 1 Plant Fibre                                                              | 4 Basic Torches                                              | Known at start                                | Instant / None                       | POC Required |
| recipe.hand.ammo.arrow_bundle                   | Arrow Bundle                  | Hand / Shaped                     | 4 Stick, 4 Flint, 2 Plant Fibre                                                                   | 16 Arrows                                                    | Known after Bow                               | Instant / None                       | POC Required |
| recipe.workbench.material.oak_plank             | Oak Planks                    | Workbench / Shape Conversion      | 1 Oak Log                                                                                         | 4 Oak Planks                                                 | Known at start                                | Instant / None                       | POC Required |
| recipe.workbench.material.oak_beam              | Oak Beam                      | Workbench / Shaped                | 2 Oak Logs                                                                                        | 4 Oak Beams                                                  | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.block.oak_shape_set            | Oak Shape Set                 | Workbench / Shape Conversion      | 6 Oak Planks                                                                                      | 4 Stairs or 6 Slabs or 3 Beams                               | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.hand.material.cobblestone                | Cobblestone Bundle            | Hand / Shapeless                  | 4 Stone Chunk                                                                                     | 1 Cobblestone Block Item                                     | Known after mining stone                      | Instant / None                       | POC Required |
| recipe.workbench.material.stone_brick           | Stone Brick                   | Workbench / Shaped                | 4 Stone Chunk or 2 Cobblestone                                                                    | 4 Stone Bricks                                               | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.block.stone_shape_set          | Stone Shape Set               | Workbench / Shape Conversion      | 6 Stone Bricks                                                                                    | 4 Stairs or 6 Slabs or 3 Walls                               | Stone Brick recipe known                      | Instant / None                       | POC Required |
| recipe.furnace.material.clay_brick              | Clay Brick                    | Furnace / Smelting                | 1 Clay Lump, fuel                                                                                 | 1 Clay Brick                                                 | Clay gathered                                 | 10s / Fuel                           | POC Required |
| recipe.furnace.material.glass_piece             | Glass Piece                   | Furnace / Smelting                | 1 Sand, fuel                                                                                      | 1 Glass Piece                                                | Sand gathered                                 | 12s / Fuel                           | POC Required |
| recipe.workbench.block.window_basic             | Basic Window                  | Workbench / Shaped                | 4 Glass Piece, 2 Oak Plank                                                                        | 1 Basic Window Block Item                                    | Glass crafted                                 | Instant / None                       | POC Required |
| recipe.workbench.block.door_oak                 | Oak Door                      | Workbench / Shaped                | 6 Oak Planks, 2 Iron Nails optional                                                               | 1 Oak Door Block Item                                        | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.block.fence_oak                | Oak Fence                     | Workbench / Shaped                | 4 Stick, 2 Oak Plank                                                                              | 3 Oak Fence Block Items                                      | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.block.chest_wood               | Wooden Chest                  | Workbench / Shaped                | 8 Oak Planks                                                                                      | 1 Wooden Chest                                               | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.block.workbench_basic          | Workbench                     | Hand / Shaped                     | 4 Oak Planks, 2 Stick                                                                             | 1 Workbench Block Item                                       | Known at start                                | Instant / None                       | POC Required |
| recipe.furnace.component.stone_furnace_core     | Stone Furnace Core            | Furnace / Preheat                 | 8 Stone Brick, 2 Clay Brick, 1 Coal Chunk                                                         | 1 Stone Furnace Core                                         | Stone Brick known                             | 20s / Fuel                           | POC Required |
| recipe.workbench.block.furnace_stone            | Stone Furnace                 | Workbench / Shaped                | 1 Stone Furnace Core, 6 Cobblestone, 2 Clay Brick                                                 | 1 Stone Furnace Block Item                                   | Stone Furnace Core known                      | Instant / None                       | POC Required |
| recipe.furnace.ingot.copper                     | Copper Ingot                  | Furnace / Smelting                | 1 Raw Copper Ore, fuel                                                                            | 1 Copper Ingot; chance 1 Slag later                          | Copper Ore gathered                           | 15s / Fuel                           | POC Required |
| recipe.furnace.ingot.iron                       | Iron Ingot                    | Furnace / Smelting                | 1 Raw Iron Ore, fuel                                                                              | 1 Iron Ingot; chance 1 Slag later                            | Iron Ore gathered                             | 18s / Fuel                           | POC Required |
| recipe.workbench.material.copper_wire           | Copper Wire                   | Workbench / Shaped                | 1 Copper Ingot                                                                                    | 4 Copper Wire                                                | Copper Ingot known                            | Instant / None                       | POC Required |
| recipe.hammer.material.copper_plate             | Copper Plate                  | Hammer / Basic Forge              | 1 Copper Ingot                                                                                    | 2 Copper Plates                                              | Copper Ingot known                            | 5s / Manual                          | POC Required |
| recipe.workbench.component.gear_copper          | Copper Gear                   | Workbench / Shaped                | 2 Copper Plates, 1 Copper Wire                                                                    | 2 Copper Gears                                               | Copper Plate known                            | Instant / None                       | POC Required |
| recipe.workbench.component.machine_frame_wood   | Wooden Machine Frame          | Workbench / Shaped                | 6 Oak Planks, 2 Oak Beams, 2 Copper Wire                                                          | 1 Wooden Machine Frame                                       | Copper Wire known                             | Instant / None                       | POC Required |
| recipe.workbench.component.machine_frame_copper | Copper Machine Frame          | Workbench / Shaped                | 1 Wooden Machine Frame, 4 Copper Plates, 2 Copper Gears                                           | 1 Copper Machine Frame                                       | Wooden Frame known                            | Instant / None                       | POC Required |
| recipe.workbench.component.machine_core_basic   | Basic Machine Core            | Workbench / Shaped                | 2 Copper Gear, 4 Copper Wire, 1 Iron Rod                                                          | 1 Basic Machine Core                                         | Copper Gear and Iron Rod known                | Instant / None                       | POC Required |
| recipe.workbench.component.chute_segment        | Item Chute Segment            | Workbench / Shaped                | 4 Oak Plank, 2 Copper Plate, 2 Iron Nails                                                         | 4 Item Chute Segments                                        | Copper Plate known                            | Instant / None                       | POC Required |
| recipe.workbench.block.item_chute_basic         | Basic Item Chute              | Workbench / Shaped                | 2 Item Chute Segment, 1 Copper Wire                                                               | 2 Basic Item Chute Blocks                                    | Item Chute Segment known                      | Instant / None                       | POC Required |
| recipe.hammer.material.iron_rod                 | Iron Rod                      | Hammer / Basic Forge              | 1 Iron Ingot                                                                                      | 2 Iron Rods                                                  | Iron Ingot known                              | 6s / Manual                          | POC Required |
| recipe.hammer.material.iron_plate               | Iron Plate                    | Hammer / Basic Forge              | 1 Iron Ingot                                                                                      | 2 Iron Plates                                                | Iron Ingot known                              | 6s / Manual                          | POC Required |
| recipe.hammer.material.iron_nails               | Iron Nails                    | Hammer / Basic Forge              | 1 Iron Rod                                                                                        | 8 Iron Nails                                                 | Iron Rod known                                | 4s / Manual                          | POC Required |
| recipe.workbench.tool.stone_pickaxe             | Stone Pickaxe                 | Workbench / Shaped                | 3 Stone Chunk, 2 Stick, 1 Plant Fibre                                                             | 1 Stone Pickaxe                                              | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.tool.stone_axe                 | Stone Axe                     | Workbench / Shaped                | 3 Stone Chunk, 2 Stick, 1 Plant Fibre                                                             | 1 Stone Axe                                                  | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.tool.hammer_basic              | Basic Hammer                  | Workbench / Shaped                | 2 Copper Plate, 1 Iron Rod, 1 Oak Beam                                                            | 1 Basic Hammer                                               | Copper Plate known                            | Instant / None                       | POC Required |
| recipe.workbench.tool.wrench_basic              | Basic Wrench                  | Workbench / Shaped                | 2 Copper Plate, 1 Copper Gear, 1 Iron Rod                                                         | 1 Basic Wrench                                               | Basic Machine Core hinted                     | Instant / None                       | POC Required |
| recipe.forge.tool.iron_pickaxe                  | Iron Pickaxe                  | Forge / Shaped                    | 3 Iron Ingots, 2 Iron Rods                                                                        | 1 Iron Pickaxe                                               | Iron Ingot known                              | 15s / Manual or Fuel                 | POC Required |
| recipe.forge.tool.iron_axe                      | Iron Axe                      | Forge / Shaped                    | 3 Iron Ingots, 2 Iron Rods                                                                        | 1 Iron Axe                                                   | Iron Ingot known                              | 15s / Manual or Fuel                 | POC Required |
| recipe.forge.weapon.iron_sword                  | Iron Sword                    | Forge / Shaped                    | 2 Iron Ingots, 1 Iron Rod, 1 Leather or Fibre Grip                                                | 1 Iron Sword                                                 | Iron Ingot known                              | 18s / Manual or Fuel                 | POC Required |
| recipe.workbench.weapon.wooden_bow              | Wooden Bow                    | Workbench / Shaped                | 3 Stick or Oak Beam, 2 Plant Fibre Rope                                                           | 1 Wooden Bow                                                 | Plant Rope known                              | Instant / None                       | POC Required |
| recipe.workbench.equipment.wooden_shield        | Wooden Shield                 | Workbench / Shaped                | 6 Oak Planks, 1 Plant Fibre, 2 Iron Nails optional                                                | 1 Wooden Shield                                              | Workbench discovered                          | Instant / None                       | POC Required |
| recipe.workbench.equipment.small_backpack       | Small Backpack                | Workbench / Shaped                | 4 Leather or Cloth, 4 Plant Fibre, 2 Stick                                                        | 1 Small Backpack                                             | Fibre gathered; leather/cloth found or traded | Instant / None                       | POC Required |
| recipe.cooking.food.bread                       | Bread                         | Furnace / Cooking                 | 3 Wheat, fuel                                                                                     | 1 Bread                                                      | Wheat harvested                               | 12s / Fuel                           | POC Required |
| recipe.cooking.food.cooked_meat                 | Cooked Meat                   | Furnace or Campfire / Cooking     | 1 Raw Meat, fuel                                                                                  | 1 Cooked Meat                                                | Raw Meat obtained                             | 10s / Fuel                           | POC Required |
| recipe.cooking.food.simple_stew                 | Simple Stew                   | Cooking Pot / Shapeless           | 1 Wheat or Crop, 1 Berries or Mushroom, 1 Water Flask, optional Meat                              | 1 Simple Stew                                                | Cooking pot or village cook taught            | 20s / Fire/Fuel                      | POC Required |
| recipe.hand.drink.water_flask_fill              | Fill Water Flask              | World Interaction                 | 1 Empty Flask at clean water                                                                      | 1 Water Flask                                                | Flask obtained                                | Instant / Water source               | POC Required |
| recipe.crush.magic.mana_shard                   | Mana Shard Breaking           | Hand or Hammer / Processing       | 1 Raw Mana Crystal                                                                                | 4 Mana Shards                                                | Mana Crystal mined                            | Instant or 5s / Manual               | POC Required |
| recipe.crush.magic.mana_dust                    | Mana Dust Grinding            | Rune Table or Mortar / Processing | 1 Mana Shard                                                                                      | 2 Mana Dust                                                  | Mana Shard obtained                           | 8s / Manual                          | POC Required |
| recipe.workbench.magic.blank_rune_stone         | Blank Rune Stone              | Workbench / Shaped                | 2 Stone Brick, 1 Clay Lump, 1 Mana Dust                                                           | 2 Blank Rune Stones                                          | Mana Dust known                               | Instant / None                       | POC Required |
| recipe.rune.magic.basic_rune                    | Basic Rune                    | Rune Table / Inscription          | 1 Blank Rune Stone, 2 Mana Dust, 1 Mana Shard                                                     | 1 Basic Rune                                                 | Basic Rune Note or mage teaching              | 15s / Mana charge                    | POC Required |
| recipe.rune.magic.ward_core_basic               | Basic Ward Core               | Rune Table / Assembly             | 2 Basic Runes, 1 Raw Mana Crystal, 2 Copper Wire                                                  | 1 Basic Ward Core                                            | Basic Rune known                              | 25s / Mana charge                    | POC Required |
| recipe.rune.component.ward_lantern_core         | Ward Lantern Core             | Rune Table / Assembly             | 1 Basic Ward Core, 4 Glass Piece, 2 Mana Dust                                                     | 1 Ward Lantern Core                                          | Ward Core known                               | 20s / Mana charge                    | POC Required |
| recipe.workbench.block.ward_lantern             | Ward Lantern                  | Workbench + Rune Table            | 1 Ward Lantern Core, 4 Glass Piece, 2 Iron Nails, 1 Basic Rune                                    | 1 Ward Lantern Block Item                                    | Village mage or first raid hint               | 20s / Mana charge                    | POC Required |
| recipe.workbench.block.rune_table_basic         | Rune Table                    | Workbench / Shaped                | 4 Stone Brick, 2 Oak Beam, 2 Copper Wire, 1 Raw Mana Crystal                                      | 1 Rune Table Block Item                                      | Torn Research Page or mage teaching           | Instant / None                       | POC Required |
| recipe.rune.component.mana_furnace_core         | Mana Furnace Core             | Rune Table / Assembly             | 1 Stone Furnace Core, 1 Basic Ward Core, 2 Raw Mana Crystal, 4 Copper Wire                        | 1 Mana Furnace Core                                          | Torn Research Page or rune table built        | 35s / Mana charge                    | POC Required |
| recipe.workbench.block.mana_furnace             | Mana Furnace                  | Workbench + Rune Table            | 1 Mana Furnace Core, 6 Stone Brick, 2 Copper Plate, 1 Basic Rune                                  | 1 Mana Furnace Block Item                                    | Mana Furnace Core known                       | Instant / None                       | POC Required |
| recipe.rune.tool.rune_chisel                    | Rune Chisel                   | Rune Table / Shaped               | 1 Iron Rod, 1 Mana Shard, 1 Flint, 1 Basic Rune                                                   | 1 Rune Chisel                                                | Basic Rune known                              | 15s / Mana charge                    | POC Required |
| recipe.rune.tool.rune_tuner_basic               | Basic Rune Tuner              | Rune Table / Shaped               | 2 Copper Wire, 1 Basic Rune, 1 Mana Shard, 1 Iron Rod                                             | 1 Basic Rune Tuner                                           | Mana conduit hinted                           | 18s / Mana charge                    | POC Required |
| recipe.rune.weapon.apprentice_staff             | Apprentice Staff              | Rune Table / Shaped               | 1 Oak Beam, 1 Raw Mana Crystal, 1 Basic Rune, 2 Mana Dust                                         | 1 Apprentice Staff                                           | Village mage teaching                         | 25s / Mana charge                    | POC Required |
| recipe.workbench.component.miner_head_iron      | Iron Miner Head               | Workbench / Shaped                | 3 Iron Plates, 2 Iron Rods, 1 Stone Pickaxe or Iron Pickaxe head                                  | 1 Iron Miner Head                                            | Iron Plate known                              | Instant / None                       | POC Required |
| recipe.workbench.block.basic_mana_miner         | Basic Mana Miner              | Workbench + Rune Table            | 1 Copper Machine Frame, 1 Basic Machine Core, 1 Iron Miner Head, 1 Basic Rune, 2 Raw Mana Crystal | 1 Basic Mana Miner Block Item                                | Automation tutorial + mana crystal discovery  | 45s / Mana charge                    | POC Required |
| recipe.village.logistics.village_supply_token   | Village Supply Token Issue    | Village Warehouse / Ledger        | Delivered approved items to warehouse                                                             | Village Supply Tokens based on value                         | First village request accepted                | Instant / Warehouse permission       | POC Required |
| recipe.village.logistics.warehouse_manifest     | Warehouse Manifest            | Village Warehouse / Ledger        | Warehouse inventory snapshot                                                                      | 1 Warehouse Manifest                                         | First warehouse interaction                   | Instant / Warehouse permission       | POC Required |
| recipe.village.project.watchtower_supply_crate  | Watchtower Supply Crate       | Village Project / Warehouse       | 64 Stone Brick, 32 Oak Beam, 32 Oak Plank, 24 Iron Nails, 8 Iron Plates, 4 Torches or Lanterns    | 1 Watchtower Supply Crate state                              | Builder Request Slip                          | Staged / NPC Builder labour          | POC Required |
| recipe.village.project.watchtower_foundation    | Watchtower Foundation Stage   | Village Project / Blueprint       | Watchtower Supply Crate consumes 24 Stone Brick, 8 Oak Beam, 8 Iron Nails                         | Foundation built                                             | Supply crate stocked                          | 1 in-game hour / NPC Builder         | POC Required |
| recipe.village.project.watchtower_frame         | Watchtower Timber Frame Stage | Village Project / Blueprint       | Consumes 20 Oak Beam, 12 Oak Plank, 8 Iron Nails                                                  | Timber frame built                                           | Foundation complete                           | 2 in-game hours / NPC Builder        | POC Required |
| recipe.village.project.watchtower_platform      | Watchtower Platform Stage     | Village Project / Blueprint       | Consumes 24 Stone Brick, 12 Oak Plank, 8 Iron Plates, 4 Torches or Lanterns                       | Platform and railing built                                   | Frame complete                                | 2 in-game hours / NPC Builder        | POC Required |
| recipe.village.project.watchtower_complete      | Completed Watchtower          | Village Project / Blueprint       | Final inspection; 4 Iron Nails, 1 Warehouse Manifest                                              | Watchtower active; guard detection and raid outcome improved | Platform complete                             | 30 minutes / Builder + Guard Captain | POC Required |

## 19.2 Alpha, Beta, Final Game, and Future Recipes

| **ID**                                       | **Display Name**          | **Type / Station**             | **Inputs**                                                                        | **Outputs**                                           | **Unlock**                           | **Time / Power**                      | **Scope**    |
|----------------------------------------------|---------------------------|--------------------------------|-----------------------------------------------------------------------------------|-------------------------------------------------------|--------------------------------------|---------------------------------------|--------------|
| recipe.sawmill.material.planks_efficient     | Efficient Plank Cutting   | Sawmill / Processing           | 1 Any Log, mechanical power                                                       | 6 Matching Planks; 1 Sawdust by-product               | Sawmill built                        | 8s / Mechanical                       | Alpha        |
| recipe.sawmill.material.beams_efficient      | Efficient Beam Cutting    | Sawmill / Processing           | 1 Any Log, mechanical power                                                       | 3 Matching Beams; 1 Sawdust                           | Sawmill built                        | 10s / Mechanical                      | Alpha        |
| recipe.workbench.block.sawmill_basic         | Basic Sawmill             | Workbench / Machine Assembly   | 1 Copper Machine Frame, 2 Iron Rods, 2 Copper Gear, 1 Saw Blade                   | 1 Sawmill Block Item                                  | Copper mechanisms                    | Instant / None                        | Alpha        |
| recipe.forge.block.basic_forge               | Basic Forge               | Workbench / Station            | 8 Stone Brick, 1 Stone Furnace Core, 4 Iron Plates, 2 Clay Bricks                 | 1 Basic Forge Block Item                              | Iron Plate known                     | Instant / None                        | Alpha        |
| recipe.loom.material.cloth                   | Woven Cloth               | Loom / Processing              | 4 Plant Fibre or Wool                                                             | 2 Cloth                                               | Loom discovered                      | 15s / Manual                          | Alpha        |
| recipe.workbench.block.loom_basic            | Basic Loom                | Workbench / Station            | 6 Oak Planks, 2 Oak Beams, 4 Plant Fibre Rope                                     | 1 Loom Block Item                                     | Village crafter or fibre use         | Instant / None                        | Alpha        |
| recipe.alchemy.block.alchemy_table           | Alchemy Table             | Workbench / Station            | 4 Oak Planks, 2 Glass Piece, 2 Clay Brick, 1 Mana Dust                            | 1 Alchemy Table Block Item                            | Alchemist NPC or first potion book   | Instant / None                        | Alpha        |
| recipe.research.block.research_desk          | Research Desk             | Workbench / Station            | 6 Oak Planks, 2 Glass Piece, 1 Copper Wire, 1 Local Map Fragment                  | 1 Research Desk Block Item                            | First Knowledge item read            | Instant / None                        | Alpha        |
| recipe.furnace.ingot.steel                   | Steel Ingot               | Forge / Smelting               | 1 Iron Ingot, 1 Coal Chunk, flux catalyst                                         | 1 Steel Ingot; 1 Slag                                 | Forge built                          | 30s / Fuel                            | Alpha        |
| recipe.forge.material.steel_plate            | Steel Plate               | Forge / Hammering              | 1 Steel Ingot                                                                     | 2 Steel Plates                                        | Steel Ingot known                    | 10s / Manual or Power                 | Alpha        |
| recipe.forge.component.steel_frame           | Reinforced Steel Frame    | Forge / Assembly               | 4 Steel Plates, 4 Iron Rods, 2 Copper Gear                                        | 1 Reinforced Steel Frame                              | Steel Plate known                    | 30s / Manual                          | Alpha        |
| recipe.machine.block.machine_assembler       | Machine Assembler         | Workbench + Forge              | 2 Reinforced Steel Frames, 4 Copper Wire, 2 Basic Machine Cores, 1 Wrench         | 1 Machine Assembler Block Item                        | Steel progression                    | 60s / Mechanical or Fuel              | Alpha        |
| recipe.machine.component.belt_segment        | Conveyor Belt Segment     | Machine Assembler              | 2 Copper Plates, 1 Cloth, 1 Iron Rod                                              | 4 Conveyor Belt Segments                              | Machine Assembler built              | 8s / Mechanical                       | Alpha        |
| recipe.machine.block.conveyor_basic          | Basic Conveyor            | Machine Assembler              | 2 Conveyor Belt Segments, 1 Copper Wire                                           | 2 Basic Conveyor Blocks                               | Belt segment known                   | 8s / Mechanical                       | Alpha        |
| recipe.machine.component.pipe_segment_copper | Copper Pipe Segment       | Machine Assembler              | 2 Copper Plates, 1 Copper Wire                                                    | 4 Copper Pipe Segments                                | Machine Assembler built              | 8s / Mechanical                       | Alpha        |
| recipe.machine.block.splitter_basic          | Basic Splitter            | Machine Assembler              | 1 Conveyor Belt Segment, 1 Copper Gear, 1 Basic Machine Core                      | 1 Basic Splitter Block                                | Conveyor known                       | 15s / Mechanical                      | Alpha        |
| recipe.machine.block.sorter_basic            | Basic Sorter              | Machine Assembler              | 1 Basic Splitter, 2 Copper Wire, 1 Filter Screen                                  | 1 Basic Sorter Block                                  | Splitter known                       | 20s / Mechanical                      | Alpha        |
| recipe.machine.component.filter_screen       | Filter Screen             | Workbench / Component          | 2 Copper Wire, 1 Glass Piece, 1 Cloth                                             | 2 Filter Screens                                      | Glass and wire known                 | Instant / None                        | Alpha        |
| recipe.power.block.manual_crank              | Manual Crank              | Workbench / Power              | 2 Oak Beam, 1 Copper Gear, 1 Iron Rod                                             | 1 Manual Crank Block                                  | Copper Gear known                    | Instant / None                        | Alpha        |
| recipe.power.block.water_wheel               | Water Wheel               | Workbench / Power              | 8 Oak Beams, 4 Copper Gear, 2 Iron Rods                                           | 1 Water Wheel Block                                   | Water source + copper mechanisms     | Instant / Water flow                  | Alpha        |
| recipe.power.block.windmill                  | Windmill                  | Workbench / Power              | 12 Oak Beam, 8 Cloth, 4 Copper Gear, 2 Iron Rods                                  | 1 Windmill Block                                      | Settlement roof/windmill quest       | Instant / Wind                        | Beta         |
| recipe.power.block.fuel_engine               | Fuel Engine               | Machine Assembler              | 1 Reinforced Steel Frame, 1 Stone Furnace Core, 2 Copper Pipes, 2 Copper Gear     | 1 Fuel Engine Block                                   | Steel progression                    | 60s / Fuel                            | Alpha        |
| recipe.machine.block.crusher_basic           | Basic Crusher             | Machine Assembler              | 1 Reinforced Steel Frame, 2 Iron Miner Heads, 2 Copper Gear, 1 Basic Machine Core | 1 Basic Crusher Block                                 | Machine Assembler built              | 45s / Mechanical                      | Alpha        |
| recipe.machine.process.ore_crushing_copper   | Crushed Copper Ore        | Crusher / Processing           | 1 Raw Copper Ore, power                                                           | 2 Crushed Copper Ore; chance Stone Dust               | Crusher built                        | 10s / Mechanical                      | Alpha        |
| recipe.machine.process.ore_crushing_iron     | Crushed Iron Ore          | Crusher / Processing           | 1 Raw Iron Ore, power                                                             | 2 Crushed Iron Ore; chance Stone Dust                 | Crusher built                        | 12s / Mechanical                      | Alpha        |
| recipe.furnace.ingot.crushed_copper          | Efficient Copper Smelt    | Furnace / Smelting             | 1 Crushed Copper Ore, fuel                                                        | 1 Copper Ingot; reduced slag                          | Crusher output known                 | 10s / Fuel                            | Alpha        |
| recipe.furnace.ingot.crushed_iron            | Efficient Iron Smelt      | Furnace / Smelting             | 1 Crushed Iron Ore, fuel                                                          | 1 Iron Ingot; reduced slag                            | Crusher output known                 | 12s / Fuel                            | Alpha        |
| recipe.rune.magic.fire_rune                  | Fire Rune                 | Rune Table / Inscription       | 1 Blank Rune Stone, 2 Mana Dust, 1 Coal Chunk, 1 Weak Monster Essence             | 1 Fire Rune                                           | Elemental rune research              | 20s / Mana charge                     | Alpha        |
| recipe.rune.magic.water_rune                 | Water Rune                | Rune Table / Inscription       | 1 Blank Rune Stone, 2 Mana Dust, 1 Water Flask, 1 Weak Monster Essence            | 1 Water Rune                                          | Elemental rune research              | 20s / Mana charge                     | Alpha        |
| recipe.rune.magic.earth_rune                 | Earth Rune                | Rune Table / Inscription       | 1 Blank Rune Stone, 2 Mana Dust, 2 Stone Brick, 1 Weak Monster Essence            | 1 Earth Rune                                          | Elemental rune research              | 20s / Mana charge                     | Alpha        |
| recipe.rune.magic.wind_rune                  | Wind Rune                 | Rune Table / Inscription       | 1 Blank Rune Stone, 2 Mana Dust, 1 Feather or Cloth, 1 Weak Monster Essence       | 1 Wind Rune                                           | Elemental rune research              | 20s / Mana charge                     | Alpha        |
| recipe.rune.magic.machine_rune               | Machine Rune              | Rune Table / Assembly          | 1 Basic Rune, 1 Copper Gear, 2 Copper Wire, 1 Mana Dust                           | 1 Machine Rune                                        | Automation + rune table              | 25s / Mana charge                     | Alpha        |
| recipe.rune.block.mana_conduit               | Mana Conduit              | Rune Table / Assembly          | 2 Copper Wire, 1 Basic Rune, 2 Mana Shard, 1 Glass Piece                          | 4 Mana Conduit Blocks                                 | Rune Tuner known                     | 20s / Mana charge                     | Alpha        |
| recipe.rune.block.mana_battery               | Mana Battery              | Rune Table / Assembly          | 1 Raw Mana Crystal, 2 Basic Runes, 4 Copper Wire, 2 Glass Piece                   | 1 Mana Battery Block                                  | Mana Conduit known                   | 35s / Mana charge                     | Alpha        |
| recipe.rune.block.rune_engine                | Rune Engine               | Machine Assembler + Rune Table | 1 Mana Battery, 1 Machine Rune, 1 Reinforced Steel Frame, 2 Copper Gear           | 1 Rune Engine Block                                   | Mana battery + machine assembler     | 60s / Mana + Mechanical               | Beta         |
| recipe.rune.block.spell_turret_basic         | Basic Spell Turret        | Rune Table / Defence           | 1 Ward Core, 1 Apprentice Staff, 1 Iron Rod, 2 Basic Runes                        | 1 Basic Spell Turret Block                            | Village defence research             | 45s / Mana charge                     | Beta         |
| recipe.alchemy.potion.healing_minor          | Minor Healing Potion      | Alchemy / Brew                 | 1 Water Flask, 2 Wild Berries, 1 Mana Dust, 1 Herb                                | 1 Minor Healing Potion; failed output = Bitter Sludge | Alchemy table built                  | 25s / Heat or Mana                    | Alpha        |
| recipe.alchemy.medicine.basic_salve          | Basic Healing Salve       | Alchemy / Mix                  | 2 Herb, 1 Plant Fibre, 1 Water Flask                                              | 2 Basic Healing Salves                                | Healer NPC or alchemy table          | 15s / Manual                          | Alpha        |
| recipe.alchemy.catalyst.flux_binder          | Mana Binder Catalyst      | Alchemy / Catalyst             | 1 Mana Dust, 1 Clay Lump, 1 Coal Chunk                                            | 2 Mana Binder Catalysts                               | Mana Dust known                      | 15s / Heat                            | Alpha        |
| recipe.alchemy.utility.blast_powder          | Blast Powder              | Alchemy / Risky Mix            | 2 Coal Chunk, 1 Sulfur later, 1 Mana Dust                                         | 2 Blast Powder; failure can ignite                    | Miner research or cave discovery     | 20s / Heat; Risky                     | Beta         |
| recipe.cooking.preserve.dried_meat           | Dried Meat                | Cooking / Preservation         | 1 Cooked Meat, 1 Salt later or Smoke Rack time                                    | 1 Dried Meat                                          | Preservation discovered              | 1 in-game hour / Smoke                | Alpha        |
| recipe.cooking.preserve.berry_preserve       | Berry Preserve            | Cooking / Preservation         | 4 Wild Berries, 1 Clay Jar, fuel                                                  | 2 Berry Preserves                                     | Cooking station + jar                | 30s / Fuel                            | Alpha        |
| recipe.cooking.food.hearty_stew              | Hearty Stew               | Cooking / Meal                 | 1 Cooked Meat, 1 Wheat, 1 Vegetable, 1 Water Flask                                | 1 Hearty Stew                                         | Cook NPC or recipe scroll            | 30s / Fuel                            | Alpha        |
| recipe.cooking.food.guard_ration             | Guard Ration              | Cooking / Village Meal         | 1 Bread, 1 Cooked Meat, 1 Dried Herb                                              | 2 Guard Rations                                       | Guard captain request                | 30s / Fuel                            | Alpha        |
| recipe.repair.tool.basic_tool_repair         | Basic Tool Repair         | Workbench / Repair             | Damaged tool, matching repair material, optional hammer                           | Restored durability based on material and quality     | Tool damaged                         | 5-20s / Manual                        | POC Required |
| recipe.repair.weapon.iron_sword_repair       | Iron Sword Repair         | Forge / Repair                 | Damaged Iron Sword, 1 Iron Ingot or 2 Iron Plates                                 | Restored Iron Sword durability                        | Iron Sword damaged                   | 20s / Manual or Fuel                  | Alpha        |
| recipe.repair.machine.basic_maintenance      | Basic Machine Maintenance | Maintenance / Repair           | Damaged machine, Copper Wire, Gear, matching Frame material                       | Machine repaired                                      | Machine damaged by event or overload | 30s / Wrench                          | Alpha        |
| recipe.repair.village.wall_patch             | Village Wall Patch        | Village Repair / Project       | 16 Stone Brick or 12 Oak Planks, 8 Iron Nails                                     | Damaged wall segment repaired                         | Raid damage exists                   | 1 in-game hour / NPC Builder          | Alpha        |
| recipe.village.project.palisade_wall         | Palisade Wall Project     | Village Project / Blueprint    | 128 Oak Planks, 64 Oak Beams, 64 Iron Nails                                       | Village Palisade Wall active                          | Hamlet defence project               | 1-2 in-game days / NPC Builders       | Alpha        |
| recipe.village.project.village_gate          | Village Gate Project      | Village Project / Blueprint    | 32 Oak Beams, 16 Iron Plates, 48 Iron Nails                                       | Village Gate active                                   | Palisade started                     | 6 in-game hours / NPC Builders        | Alpha        |
| recipe.village.project.blacksmith_upgrade    | Blacksmith Upgrade        | Village Project / Blueprint    | 96 Stone Brick, 32 Iron Plates, 24 Copper Wire, 1 Basic Forge                     | Blacksmith job and recipes unlocked                   | Village trust + iron chain           | 2 in-game days / Builder + Smith      | Alpha        |
| recipe.village.project.irrigation_channel    | Irrigation Channel        | Village Project / Farming      | 64 Clay Brick, 32 Copper Pipe Segment, 1 Water Rune                               | Improved farms and crop reliability                   | Water Rune + farmer request          | 1 in-game day / Builder + Farmer      | Alpha        |
| recipe.village.project.market_stall          | Market Stall              | Village Project / Economy      | 32 Oak Planks, 8 Glass Piece, 12 Cloth, 16 Iron Nails                             | Market stall trade upgrade                            | Village reputation Helpful           | 6 in-game hours / Carpenter           | Alpha        |
| recipe.village.project.shrine_basic          | Basic Shrine              | Village Project / Culture      | 64 Stone Brick, 8 Glass Piece, 2 Ward Cores, culture icon                         | Shrine service and culture story hook                 | Priest request                       | 1 in-game day / Mason + Priest        | Beta         |
| recipe.village.project.mage_tower_foundation | Mage Tower Foundation     | Village Project / Magic        | 128 Stone Brick, 16 Mana Conduit, 4 Ward Cores, 2 Rune Tables                     | Mage tower construction stage                         | Town stage + mage trust              | 3 in-game days / Mages + Builders     | Beta         |
| recipe.quest.key.bandit_camp_map             | Bandit Camp Map Assembly  | Quest / Map                    | 3 Local Map Fragments, 1 Trader Rumour or Scout Note                              | 1 Bandit Camp Map                                     | Rumours or village threat            | Instant / Research Desk               | Alpha        |
| recipe.quest.trophy.goblin_standard          | Captured Goblin Standard  | Quest / Trophy                 | 8 Goblin Scrap, 1 Crude Goblin Blade, 1 Cloth                                     | 1 Captured Goblin Standard                            | Defeat raid or camp                  | Instant / Workbench                   | Alpha        |
| recipe.culture.dwarf.rune_anvil              | Dwarven Rune Anvil        | Culture / Station              | 1 Basic Forge, 4 Steel Plates, 2 Machine Runes, Dwarven favour token              | 1 Dwarven Rune Anvil                                  | Dwarven culture trust                | 60s / Forge + Mana                    | Final Game   |
| recipe.culture.elf.livingwood_beam           | Livingwood Beam           | Culture / Nature Magic         | 1 Fae Seed, 1 Oak Beam, 1 Nature Rune                                             | 2 Livingwood Beams                                    | Elven/Fae story unlock               | 30s / Nature magic                    | Final Game   |
| recipe.culture.goblin.scrap_engine           | Goblin Scrap Engine       | Culture / Machine              | 16 Goblin Scrap, 4 Copper Gear, 1 Fuel Engine Core                                | 1 Scrap Engine                                        | Goblin clan trade or conquest        | 45s / Fuel; unstable                  | Beta         |
| recipe.culture.undead.bone_worker_core       | Bone Worker Core          | Forbidden / Necromancy         | 8 Bone, 2 Weak Monster Essence, 1 Shadow Rune, dark catalyst                      | 1 Bone Worker Core                                    | Necromancy path unlocked             | 60s / Ritual; forbidden               | Final Game   |
| recipe.forbidden.dark_ward_core              | Dark Ward Core            | Forbidden / Rune               | 1 Ward Core, 4 Weak Monster Essence, 1 Blood/Shadow Fluid                         | 1 Dark Ward Core; corruption risk                     | Forbidden text found                 | 45s / Mana; risky                     | Final Game   |
| recipe.dimension.portal.frame_basic          | Basic Portal Frame        | Dimension / Portal             | 8 Stone Brick, 4 Mana Conduit, 2 Ward Cores, 1 Portal Stabiliser                  | 1 Portal Frame Block                                  | Dimension research                   | 60s / Mana                            | Beta         |
| recipe.dimension.portal.stabiliser           | Portal Stabiliser         | Dimension / Component          | 2 Basic Runes, 4 Mana Dust, 2 Steel Plates, 1 Relic Gem later                     | 1 Portal Stabiliser                                   | Ruins + research desk                | 45s / Mana                            | Beta         |
| recipe.dimension.void.voidstone_plate        | Voidstone Plate           | Dimension / Processing         | 1 Voidstone Shard, 1 Steel Plate, portal power                                    | 1 Voidstone Plate; instability residue                | Void realm access                    | 60s / Portal power                    | Final Game   |
| recipe.dimension.fae.fae_seedling_pot        | Fae Seedling Pot          | Dimension / Nature             | 1 Fae Seed, 2 Living Soil, 1 Water Rune, 1 Clay Pot                               | 1 Fae Seedling Pot                                    | Fae realm access                     | 1 in-game day / Nature magic          | Final Game   |
| recipe.dimension.dream.dream_glass           | Dream Glass Pane          | Dimension / Processing         | 1 Dream Glass Shard, 1 Mana Dust, 1 Glass Piece                                   | 2 Dream Glass Panes                                   | Dream realm access                   | 30s / Mana                            | Final Game   |
| recipe.dimension.infernal.infernal_brick     | Infernal Brick            | Dimension / Smelting           | 1 Infernal Ash, 1 Clay Brick, 1 Fire Rune                                         | 2 Infernal Bricks                                     | Infernal realm access                | 45s / High heat                       | Final Game   |
| recipe.dimension.celestial.celestial_core    | Celestial Core            | Endgame / World-Shaping        | 4 Celestial Metal, 4 Voidstone Plates, 4 Mythril Runes, 1 Mythic Relic            | 1 Celestial Core                                      | Endgame civilisation arc             | 1 in-game day / Ritual + portal power | Final Game   |

# 20. Core Production Chains

| **Chain**                   | **Recipe Path**                                                                                                          | **Purpose**                                                                     |
|-----------------------------|--------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| Starter Survival Chain      | Sticks + fibre + stone/flint -\> crude tools -\> stone chunks/logs -\> workbench -\> stone tools.                        | Proves first five minutes and basic readable survival progression.              |
| Wood Construction Chain     | Oak log -\> planks/beams -\> workbench/chest/fence/door/roof pieces -\> shelter and village build parts.                 | Turns gathering into base building and NPC construction support.                |
| Stone and Furnace Chain     | Stone chunks -\> cobblestone/stone brick -\> furnace core -\> stone furnace -\> smelting and cooking.                    | Unlocks metal, glass, cooked food, clay brick, and village tower stone supply.  |
| Copper Mechanism Chain      | Copper ore -\> copper ingot -\> wire/plate/gear -\> machine frames/cores/chutes/wrench.                                  | Unlocks early automation without jumping straight to full factory complexity.   |
| Iron Settlement Chain       | Iron ore -\> iron ingot -\> rod/plate/nails/tools/weapons -\> miner head/watchtower/guard equipment.                     | Core POC chain linking mining, smelting, crafting, combat, and village defence. |
| Mana Infrastructure Chain   | Mana crystal -\> shards -\> dust -\> blank rune -\> basic rune -\> ward core/mana furnace/rune tools.                    | Makes magic practical infrastructure rather than combat-only spellcasting.      |
| Automation to Village Chain | Basic mana miner -\> item chute -\> furnace or mana furnace -\> chest/village warehouse -\> project recipe.              | Proves that production can feed NPC storage and change settlement outcomes.     |
| Watchtower Project Chain    | Builder request -\> supply crate -\> foundation -\> frame -\> platform -\> completed watchtower -\> altered raid result. | POC proof of living NPC construction using real resources.                      |

# 21. Sample Detailed Recipe Entry

The full database can store more detail than the main registry table. The following example shows how one POC recipe should be expanded when moving from design registry into implementation planning.

| **Field**          | **Value**                                                                                         |
|--------------------|---------------------------------------------------------------------------------------------------|
| Field              | Basic Mana Miner Recipe                                                                           |
| Recipe ID          | recipe.workbench.block.basic_mana_miner                                                           |
| Recipe Type        | Workbench + Rune Table / Machine Assembly                                                         |
| Inputs             | 1 Copper Machine Frame, 1 Basic Machine Core, 1 Iron Miner Head, 1 Basic Rune, 2 Raw Mana Crystal |
| Output             | 1 Basic Mana Miner Block Item                                                                     |
| Unlock             | Automation tutorial plus mana crystal discovery; hinted by Torn Research Page.                    |
| Time / Power       | 45 seconds; mana charge required during final rune binding.                                       |
| Automation Support | Output is automation block; recipe itself is manual/station-crafted in POC.                       |
| NPC Use            | Village engineers can request it later; POC villagers do not craft it alone.                      |
| Failure            | No normal failure. If interrupted during final rune binding, mana crystal is not consumed.        |

# 22. Balancing Rules

| **Rule**                   | **Meaning**                                                                                                                                                             |
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| POC first                  | The first version must prove survival -\> iron -\> mana -\> automation -\> village warehouse -\> watchtower -\> raid outcome before expanding into hundreds of recipes. |
| Readable complexity        | Recipes can be deep internally, but player-facing UI should show the clearest next action, missing inputs, station, and unlock requirement first.                       |
| Early generosity           | Early survival recipes should be forgiving; large village and automation recipes can require bulk amounts because machines and NPC supply systems support them.         |
| Old materials stay useful  | Wood, stone, copper, iron, clay, glass, and fibre remain useful in repairs, construction, tools, machines, culture variants, and NPC needs.                             |
| Game-feel ratios           | Costs should feel believable but should be tuned for play, pacing, and build satisfaction rather than strict realism.                                                   |
| Automation reduces grind   | Any large material requirement should have a corresponding automation, NPC production, trade, or batch-crafting path.                                                   |
| Magic has cost but utility | Magic crafting uses mana, components, charge, risk, research, or faction reaction where appropriate, but utility magic should not punish normal play constantly.        |
| NPC consumption pacing     | Village recipes should consume enough to matter but not so much that the player feels permanently taxed.                                                                |
| Failure is targeted        | Failure belongs to risky systems: rituals, alchemy, unstable machines, forbidden magic, poor materials, or interrupted advanced crafting.                               |
| Difficulty-aware           | Spoilage, cost, timers, failure, corruption, and destructive side effects should be adjustable by world settings.                                                       |

# 23. Open Questions for Later Documents

- Exact numeric crafting times for every station after playtesting the POC loop.

- Whether the POC needs a dedicated Basic Forge block or can treat hammering as a workbench extension.

- Exact fuel burn values for coal, wood, charcoal, mana crystals, and future fuels.

- How recipe quality is calculated from skill, material quality, station tier, NPC specialist help, and magic modifiers.

- Whether the recipe book should show unknown recipe silhouettes or only hinted recipes after discovery.

- How much substitution villages allow in project recipes: exact Stone Brick versus any_stone_brick tag.

- How direct automation delivery to villages should be permissioned, logged, and rewarded.

- Whether failed alchemy produces reusable by-products or mostly waste.

- How hidden/forbidden recipes affect guards, merchants, village fear, faction hostility, and morality tracking.

- Which culture-specific recipe branch should be documented first after the POC: human village, dwarven hold, elven forest settlement, or goblin clan.

# Appendix A. POC Recipe Checklist

| **Recipe**                    | **Type / Station**                | **Scope**    |
|-------------------------------|-----------------------------------|--------------|
| Twisted Plant Rope            | Hand / Shapeless                  | POC Required |
| Thatch Bundle                 | Hand / Shapeless                  | POC Required |
| Crude Pickaxe                 | Hand / Shaped                     | POC Required |
| Crude Axe                     | Hand / Shaped                     | POC Required |
| Basic Torch                   | Hand / Shapeless                  | POC Required |
| Arrow Bundle                  | Hand / Shaped                     | POC Required |
| Oak Planks                    | Workbench / Shape Conversion      | POC Required |
| Oak Beam                      | Workbench / Shaped                | POC Required |
| Oak Shape Set                 | Workbench / Shape Conversion      | POC Required |
| Cobblestone Bundle            | Hand / Shapeless                  | POC Required |
| Stone Brick                   | Workbench / Shaped                | POC Required |
| Stone Shape Set               | Workbench / Shape Conversion      | POC Required |
| Clay Brick                    | Furnace / Smelting                | POC Required |
| Glass Piece                   | Furnace / Smelting                | POC Required |
| Basic Window                  | Workbench / Shaped                | POC Required |
| Oak Door                      | Workbench / Shaped                | POC Required |
| Oak Fence                     | Workbench / Shaped                | POC Required |
| Wooden Chest                  | Workbench / Shaped                | POC Required |
| Workbench                     | Hand / Shaped                     | POC Required |
| Stone Furnace Core            | Furnace / Preheat                 | POC Required |
| Stone Furnace                 | Workbench / Shaped                | POC Required |
| Copper Ingot                  | Furnace / Smelting                | POC Required |
| Iron Ingot                    | Furnace / Smelting                | POC Required |
| Copper Wire                   | Workbench / Shaped                | POC Required |
| Copper Plate                  | Hammer / Basic Forge              | POC Required |
| Copper Gear                   | Workbench / Shaped                | POC Required |
| Wooden Machine Frame          | Workbench / Shaped                | POC Required |
| Copper Machine Frame          | Workbench / Shaped                | POC Required |
| Basic Machine Core            | Workbench / Shaped                | POC Required |
| Item Chute Segment            | Workbench / Shaped                | POC Required |
| Basic Item Chute              | Workbench / Shaped                | POC Required |
| Iron Rod                      | Hammer / Basic Forge              | POC Required |
| Iron Plate                    | Hammer / Basic Forge              | POC Required |
| Iron Nails                    | Hammer / Basic Forge              | POC Required |
| Stone Pickaxe                 | Workbench / Shaped                | POC Required |
| Stone Axe                     | Workbench / Shaped                | POC Required |
| Basic Hammer                  | Workbench / Shaped                | POC Required |
| Basic Wrench                  | Workbench / Shaped                | POC Required |
| Iron Pickaxe                  | Forge / Shaped                    | POC Required |
| Iron Axe                      | Forge / Shaped                    | POC Required |
| Iron Sword                    | Forge / Shaped                    | POC Required |
| Wooden Bow                    | Workbench / Shaped                | POC Required |
| Wooden Shield                 | Workbench / Shaped                | POC Required |
| Small Backpack                | Workbench / Shaped                | POC Required |
| Bread                         | Furnace / Cooking                 | POC Required |
| Cooked Meat                   | Furnace or Campfire / Cooking     | POC Required |
| Simple Stew                   | Cooking Pot / Shapeless           | POC Required |
| Fill Water Flask              | World Interaction                 | POC Required |
| Mana Shard Breaking           | Hand or Hammer / Processing       | POC Required |
| Mana Dust Grinding            | Rune Table or Mortar / Processing | POC Required |
| Blank Rune Stone              | Workbench / Shaped                | POC Required |
| Basic Rune                    | Rune Table / Inscription          | POC Required |
| Basic Ward Core               | Rune Table / Assembly             | POC Required |
| Ward Lantern Core             | Rune Table / Assembly             | POC Required |
| Ward Lantern                  | Workbench + Rune Table            | POC Required |
| Rune Table                    | Workbench / Shaped                | POC Required |
| Mana Furnace Core             | Rune Table / Assembly             | POC Required |
| Mana Furnace                  | Workbench + Rune Table            | POC Required |
| Rune Chisel                   | Rune Table / Shaped               | POC Required |
| Basic Rune Tuner              | Rune Table / Shaped               | POC Required |
| Apprentice Staff              | Rune Table / Shaped               | POC Required |
| Iron Miner Head               | Workbench / Shaped                | POC Required |
| Basic Mana Miner              | Workbench + Rune Table            | POC Required |
| Village Supply Token Issue    | Village Warehouse / Ledger        | POC Required |
| Warehouse Manifest            | Village Warehouse / Ledger        | POC Required |
| Watchtower Supply Crate       | Village Project / Warehouse       | POC Required |
| Watchtower Foundation Stage   | Village Project / Blueprint       | POC Required |
| Watchtower Timber Frame Stage | Village Project / Blueprint       | POC Required |
| Watchtower Platform Stage     | Village Project / Blueprint       | POC Required |
| Completed Watchtower          | Village Project / Blueprint       | POC Required |

# Appendix B. Recipe Database Field Template

| **Field**          | **Purpose**                                                                                              | **Requirement**                                                                 |
|--------------------|----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| recipe_id          | Unique internal ID, e.g. recipe.workbench.tool.iron_pickaxe.                                             | Required for every recipe.                                                      |
| display_name       | Player-facing name.                                                                                      | Can differ from output item name for project or process recipes.                |
| recipe_type        | Hand, Workbench, Furnace, Forge, Cooking, Alchemy, Rune, Machine, Automation, Project, Quest, Dimension. | Used by UI tabs and station filtering.                                          |
| station_required   | None, workbench, furnace, forge, rune table, alchemy table, machine assembler, village warehouse, etc.   | Can include station tier or upgrade requirements.                               |
| inputs             | Item IDs/tags and quantities.                                                                            | Supports exact items, tags, substitutions, qualities, and staged consumption.   |
| outputs            | Primary output item/block/project result.                                                                | Supports multiple outputs and batch quantities.                                 |
| by_products        | Waste, slag, ash, dust, residue, bonus materials, failed outputs.                                        | Optional but important for processing and risk systems.                         |
| unlock_method      | Known, discovered, crafted, researched, NPC-taught, culture, faction, boss, dimension, hidden, quest.    | Feeds recipe book visibility and progression.                                   |
| craft_time         | Instant, seconds, minutes, in-game hours, staged days for projects.                                      | Balance draft value in v0.1.                                                    |
| fuel_or_power      | None, fuel, mana, mechanical, water, wind, steam, rune, leyline, portal.                                 | Can be fixed, optional, or station-derived.                                     |
| batch_size         | How many outputs are produced per recipe run.                                                            | Important for construction and automation.                                      |
| automation_support | Manual only, automation input, automation output, machine recipe, warehouse-compatible.                  | Controls future logistics integration.                                          |
| npc_use            | Whether NPCs can craft, request, consume, teach, or use the output.                                      | Connects to economy, jobs, and village projects.                                |
| quality_rules      | Whether output quality can vary and what influences it.                                                  | Material quality, station tier, skill, NPC specialist, magic, failure.          |
| failure_rules      | Can fail, cannot fail, risky only, interrupted only, dark magic risk, unstable machine risk.             | Used by alchemy, rituals, forbidden paths, and unstable recipes.                |
| tags               | Search/system tags.                                                                                      | Examples: starter, copper-tier, village-use, magic, automation, repair, hidden. |
| scope              | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                                            | Planning metadata only, not shipped gameplay data.                              |

# Appendix C. Cross-System Use Matrix

| **Recipe / Family**      | **Player Use**                   | **Village/NPC Use**              | **Automation Use**                 | **Magic Use**                  | **Scope**    |
|--------------------------|----------------------------------|----------------------------------|------------------------------------|--------------------------------|--------------|
| Oak Planks / Beams       | Player shelter and furniture     | Village homes and watchtower     | Frames, sawmill input              | Rune table body later          | POC Required |
| Stone Brick              | Durable builds and furnace parts | Watchtower and walls             | Machine base material              | Rune bases and ritual anchors  | POC Required |
| Copper Wire / Gear       | Tools and machine parts          | Workshop upgrades                | Machine cores, chutes, power       | Rune tools and mana conduits   | POC Required |
| Iron Plate / Rod / Nails | Tools, weapons, structures       | Guard gear and tower fittings    | Miner heads and stronger frames    | Rune chisel and staff fittings | POC Required |
| Mana Dust / Basic Rune   | Magic items and tools            | Wards and mage requests          | Mana miner and mana furnace        | Core magic recipe chain        | POC Required |
| Ward Lantern             | Player safety lighting           | Village defence and raid outcome | Can be supplied by warehouse later | Anti-monster magic block       | POC Required |
| Basic Mana Miner         | Resource scaling                 | Supplies warehouse with trust    | First automated extractor          | Mana-powered machine           | POC Required |
| Watchtower Project       | Player goal and visible build    | Village defence and story trust  | Consumes bulk production           | Can include ward upgrade later | POC Required |
| Dwarven Rune Anvil       | Advanced crafting                | Culture trust and city projects  | Magitech parts                     | Rune-forging identity          | Final Game   |
| Portal Stabiliser        | Realm access                     | Story and faction gates          | Dimensional logistics              | Portal rituals                 | Beta         |

# Appendix D. Future Recipe Family Backlog

| **Family Group**          | **Backlog Examples**                                                                                                 |
|---------------------------|----------------------------------------------------------------------------------------------------------------------|
| Additional Wood Families  | Pine, birch, darkwood, livingwood, emberwood planks, beams, doors, roofs, furniture, culture trim.                   |
| Stone Families            | Granite, limestone, basalt, marble, slate, deepstone, crystal stone, carved stone, cultural masonry.                 |
| Advanced Metals           | Bronze, steel, silver, gold, mythril, arcane alloy, voidstone, celestial metal recipe families.                      |
| Full Cooking System       | Farm crops, cultural meals, drinks, rations, preservation, festival foods, NPC diet preferences.                     |
| Alchemy Expansion         | Medicine, poisons, oils, explosives, fertilisers, transmutation, fuel additives, purity/corruption systems.          |
| Rune School Expansion     | Elemental, nature, shadow, necromancy, golemancy, portal, ward, logic, machine, and ritual runes.                    |
| Automation Expansion      | Conveyors, item pipes, fluid pipes, splitters, sorters, mergers, assemblers, farm processors, pumps, power networks. |
| Village Project Expansion | Roads, wells, farms, walls, gates, markets, shrines, blacksmiths, schools, mage towers, warehouses, bridges.         |
| Culture Recipes           | Race-specific food, tools, architecture, machines, magic stations, ritual items, trade goods, and story keys.        |
| Forbidden Crafting        | Dark automation, cursed gear, necromancy workers, blood/shadow fuels, corruption rituals, villain infrastructure.    |
| Dimension Recipes         | Realm materials, realm machines, boss keys, portal networks, floating structures, overworld realm upgrades.          |
