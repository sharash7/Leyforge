**Fantasy Voxel Civilisation Sandbox**

**02 - Player Progression System**

Version 0.1 - Detailed Design Bible Draft

| **Progression Statement:** A hybrid sandbox progression system where tools, resources, player level, use-based skills, perk trees, knowledge, research, magic, automation, village reputation, settlement growth, bosses, and dimensions all combine without removing sandbox freedom. |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Field**          | **Locked Direction**                                                                                                                        |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Progression Model  | Hybrid: Minecraft-style material/tool progression + RPG levels/skills/perks + knowledge/research unlocks.                                   |
| Overall Level      | Yes. The player has an overall level, but it is a light progression layer and does not control every system.                                |
| Skill Progression  | Many individual skills exist. Skills level primarily through repeated use.                                                                  |
| Attributes/Classes | No traditional attributes, classes, or starting backgrounds. Players start equal and grow through action.                                   |
| Mastery            | One character can eventually master everything. Specialisation is encouraged but not forced.                                                |
| Progression Shape  | Early progression is clear and readable; mid/late progression branches into multiple valid sandbox paths.                                   |
| POC Target         | A small connected loop: first tools -\> simple level -\> basic skill use -\> village delivery -\> automation -\> magic -\> defence outcome. |

# Document Purpose

This document defines how the player grows over time. It covers overall level, skill growth, perk trees, recipe unlocks, tool and material progression, magic progression, automation progression, village and reputation progression, settlement leadership, combat growth, exploration gates, dimensions, death recovery, multiplayer progression, and the exact progression scope for the proof-of-concept.

It does not replace later detailed documents for magic, automation, settlement simulation, combat, blocks, items, recipes, dimensions, or technical implementation. Instead, it locks the progression rules those documents should follow.

| **Design Source:** This document follows the Master Game Design Bible promise that magic, automation, survival, NPC civilisations, race stories, and player choice should all affect each other. It also follows the Core Gameplay Loop target where the POC proves gathering, automation, village supply, real resource consumption, village growth, and a changed threat outcome. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Source Anchor**        | **Progression Requirement**                                                                                                                                                                                     |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Master Game Design Bible | The player begins with hand tools and basic shelter, then escalates into village projects, machine networks, magic schools, golem labour, portals, dimensions, floating cities, and civilisation-scale systems. |
| Master Game Design Bible | Resources should have layered uses across crafting, village needs, trade, machines, quests, magic catalysts, and dimension keys.                                                                                |
| Core Gameplay Loop       | Progression must support explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                                                                    |
| Core Gameplay Loop       | Progression should not force a single fixed order; multiple playstyles must remain valid.                                                                                                                       |
| Core Gameplay Loop       | The POC must be staged and must prove survival, gathering, automation, real village storage, NPC construction, magic, and threat outcomes.                                                                      |

# Static Table of Contents

- 1\. Locked Progression Identity

- 2\. Player Answer Decision Summary

- 3\. Progression Architecture

- 4\. Overall Player Level System

- 5\. XP Sources and Reward Philosophy

- 6\. Derived Stats and Player Resources

- 7\. Skill System

- 8\. Perk Tree System

- 9\. Mastery, Respec, and Specialisation

- 10\. Tool, Material, and Equipment Progression

- 11\. Survival Need Progression

- 12\. Knowledge, Recipe, and Research Unlocks

- 13\. Magic Progression

- 14\. Automation Progression

- 15\. Village, Reputation, and Civilisation Progression

- 16\. Building, Settlement, and Leadership Progression

- 17\. Combat, Defence, and Adventure Progression

- 18\. Exploration, Boss, and Dimension Progression

- 19\. Evil and Conqueror Progression

- 20\. Death, Failure, and Progression Loss

- 21\. Multiplayer Progression

- 22\. UI and Feedback

- 23\. Proof-of-Concept Progression Scope

- 24\. Example Progression Paths

- 25\. Balancing Rules

- 26\. Open Questions for Later Documents

- Appendix A. POC Progression Checklist

- Appendix B. Progression System Summary Matrix

# 1. Locked Progression Identity

Player progression is a hybrid system. The game should preserve the readable survival sandbox feeling of gathering, crafting, tool tiers, block placement, and resource discovery, while also adding RPG depth through player levels, many use-based skills, large perk trees, magic mastery, automation upgrades, knowledge unlocks, village reputation, and civilisation-scale outcomes.

| **Locked Rule:** The game must never become only a levelling treadmill. Levels, skills, perks, research, and reputation support the sandbox; they do not replace physical resources, player choice, construction, exploration, or world simulation. |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **Progression Layer**           | **Role**                                                   | **Player-Facing Result**                                                                                                                                             |
|---------------------------------|------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Tool and Material Progression   | Creates early readability and tactile survival growth.     | The player moves from crude survival tools into copper, bronze, iron, steel, mythic metals, magic-compatible tools, and advanced equipment.                          |
| Overall Player Level            | Provides long-term RPG reward across all playstyles.       | The player earns level-ups from almost every meaningful action and receives perk points, resource growth, and broad progression rewards.                             |
| Use-Based Skills                | Rewards repeated playstyle investment without class locks. | Mining, farming, combat, magic, trade, leadership, engineering, and other skills grow as the player uses them.                                                       |
| Perk Trees                      | Adds build identity and long-term goals.                   | The player chooses meaningful upgrades in survival, crafting, combat, magic, automation, leadership, trade, exploration, settlement management, and forbidden paths. |
| Knowledge and Research          | Controls recipes, magic, automation, and ancient systems.  | The player discovers, researches, learns, buys, experiments, or earns unlocks rather than receiving everything from level alone.                                     |
| Village and Reputation Growth   | Makes civilisation interaction a progression path.         | Helping, trading, protecting, leading, or conquering settlements unlocks recipes, followers, story, services, support, and settlement growth.                        |
| Exploration and Dimension Gates | Keeps adventure and discovery important.                   | Tools, gear, magic, bosses, rituals, faction knowledge, and settlements unlock deeper regions and dimensions.                                                        |

## 1.1 Progression Fantasy

The player starts with nothing and grows in whichever direction they pursue. The system must support a lone survivor, cosy builder, village helper, mage-engineer, adventurer, trader, automation specialist, ruler, archmage, dimensional explorer, conqueror, or villain. These identities should be valid without forcing a single class choice at character creation.

| **Starting State**        | **Mid-Game Direction**                                                      | **Late/Endgame Fantasy**                                                                        |
|---------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| Empty-handed survivor     | Skilled builder, miner, farmer, crafter, trader, mage, fighter, or engineer | Civilisation founder, archmage, factory master, faction leader, world-shaper, or tyrant         |
| Manual resource gathering | Mechanical and magical production chains                                    | City-scale mana grids, golem labour, portal logistics, and dimensional infrastructure           |
| Nearby village requests   | Regional trade, faction reputation, settlement projects                     | Race stories, faction wars, dimensional arcs, conquest, restoration, or peaceful world building |

# 2. Player Answer Decision Summary

The following table translates the chosen multiple-choice answers into locked design decisions for this document.

| **Area**               | **Locked Decision**                                                                                                                                                                                 |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Core Philosophy        | Use a hybrid progression model: tool/resource progression, RPG levels, use-based skills, perk trees, knowledge, research, magic, automation, and civilisation growth.                               |
| Progression Shape      | Clear early milestones plus branching sandbox freedom. Early steps are readable; later systems branch into multiple paths.                                                                          |
| Player Level           | Use an overall player level with no hard cap. It gives useful rewards but does not replace skills, tools, gear, research, or world unlocks.                                                         |
| XP                     | XP comes from all major play: mining, gathering, crafting, building, combat, exploration, village help, magic, automation, quests, trading, and economy. Milestones pay more than repeated actions. |
| Grinding               | Grinding is allowed. Simple repeated actions give progress, but meaningful milestones, discovery, and complex tasks remain more rewarding.                                                          |
| Attributes and Classes | No traditional attributes, classes, or backgrounds. There are no starting classes and no background bonuses.                                                                                        |
| Stats                  | Use derived stats such as health, stamina, mana, carry capacity, efficiency, and resistances, but avoid Strength/Agility/Intelligence-style character attributes.                                   |
| Skills                 | Use many individual skills. Skills level by repeated use and can contribute to recipes, efficiency, abilities, and perk access.                                                                     |
| Skill Failure          | Low skill should not cause common failures. It should mean slower actions, lower efficiency, weaker output, or fewer options.                                                                       |
| Perks                  | Use large RPG-style perk trees across every major playstyle. Respec is available through cost, resource, NPC, shrine, or equivalent system.                                                         |
| Mastery                | One character can eventually master everything. Multiplayer may encourage specialisation, but no one is permanently locked out.                                                                     |
| Materials              | Material ladder: wood -\> stone -\> copper -\> bronze -\> iron -\> steel -\> mythic metals, with magic materials layered into progression.                                                          |
| Needs                  | Core resources: health, stamina, mana, hunger/food, and temperature. Stamina is mainly for sprinting and combat. No thirst by default.                                                              |
| Magic                  | Magic appears after basic survival and/or village/ruin discovery. It has many schools and role categories. Spells use a hybrid of known spell list, loadouts, runes, gear, and components.          |
| Automation             | Automation begins after copper/iron or through an automation-focused path. Power sources are mixed: manual, fuel, water, wind, mana, and later advanced systems.                                    |
| Reputation             | Reputation is very important but supports multiple playstyles. Track individual NPC, village, and faction reputation.                                                                               |
| Settlement             | Helping an existing village is the standard teaching path for founding a player settlement. Player settlement stages follow Camp -\> Hamlet -\> Village -\> Town -\> City -\> Capital.              |
| Death                  | Player death does not reduce progression by default. Use tombstone/inventory recovery rather than skill or level loss.                                                                              |
| Multiplayer            | Progression sharing is a world/server setting. Reputation should support individual plus group reputation where practical.                                                                          |
| POC                    | Include a simple player level, basic tool tiers, skill use, crafting station unlocks, village reputation, automation, magic, combat/defence, a basic quest chain, and basic research.               |

# 3. Progression Architecture

Progression is built from overlapping layers rather than one master track. A player can progress by mining better materials, levelling skills, unlocking perks, discovering recipes, improving reputation, building machines, mastering magic, defeating bosses, growing settlements, or opening dimensions.

| **Layer**            | **Primary Unlocks**                                                   | **Secondary Connections**                                               |
|----------------------|-----------------------------------------------------------------------|-------------------------------------------------------------------------|
| Material Tier        | Tools, stations, gear, machine parts, building blocks                 | Village projects, trade goods, boss preparation, dimension gates        |
| Overall Level        | Perk points, derived stat growth, broad recognition                   | Supports all playstyles without enforcing a class                       |
| Skill Level          | Efficiency, skill perks, action improvements, recipe prerequisites    | Training identity, multiplayer roles, mastery goals                     |
| Perk Tree            | Build-defining bonuses, abilities, modifiers, conveniences            | Respec, specialisation, long-term player identity                       |
| Knowledge/Research   | Recipes, machines, spells, rituals, ancient techniques                | NPC teachers, books, ruins, research stations, experimentation          |
| Magic Mastery        | Spells, runes, magical devices, rituals, wards, enchants              | Combat, utility, automation, villages, dimensions                       |
| Automation Tier      | Machines, power, logistics, throughput, golems, networks              | Village supply, settlement growth, trade, warfare, magic infrastructure |
| Reputation           | Trade, services, followers, recipes, faction arcs, settlement support | Morality, diplomacy, conquest, race stories                             |
| Settlement Stage     | Population, jobs, laws, projects, defences, culture identity          | Leadership, trade routes, story arcs, dimensions                        |
| Boss/Dimension Gates | Rare materials, realms, major magic, endgame systems                  | Adventure, danger, story, world-state change                            |

| **No Single Mandatory Track:** The player should usually have more than one way to unlock a major capability. For example, a recipe might be found in a ruin, taught by an NPC, researched at a station, bought from a faction, unlocked through village growth, or learned through experimentation. |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 4. Overall Player Level System

The player has an overall level. This level represents accumulated life experience across the sandbox, not a class rank. It should be visible, satisfying, and rewarding, but it should not become the only way to progress.

| **Design Question**            | **Locked Answer**                                                                                                                                                   |
|--------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Hard cap?                      | No hard cap. The level curve can slow naturally, but the player can continue growing indefinitely.                                                                  |
| Does level control everything? | No. It grants broad rewards, but tools, skills, recipes, research, gear, reputation, bosses, and dimensions remain separate unlock layers.                          |
| What gives XP?                 | All meaningful playstyles: gathering, crafting, building, combat, exploration, village help, magic, automation, quests, trade, and economy.                         |
| How does XP scale?             | Repeated actions give steady XP. Milestones, discoveries, quests, boss defeats, first-time creations, village upgrades, and automation achievements give larger XP. |
| Does grinding work?            | Yes. A player can grind, but milestone play should feel more exciting and efficient.                                                                                |

## 4.1 Level Rewards

| **Reward Type**                    | **How It Works**                                                                                 | **Notes**                                                            |
|------------------------------------|--------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Perk Points                        | Each level grants general perk points, with extra points at major milestones.                    | Core level reward. Perks provide build identity.                     |
| Skill Points or Skill Perk Points  | Some levels may grant flexible points that can supplement skill trees.                           | Should not replace use-based skill growth.                           |
| Derived Stat Growth                | Small increases to health, stamina, mana, carrying capacity, resilience, or resource efficiency. | No traditional attributes; these are derived capabilities.           |
| Recipe Hints or Unlock Eligibility | Level can reveal recipe categories or make the player eligible for advanced learning.            | Final recipes still require materials, research, NPCs, or discovery. |
| Magic Capacity                     | Level can increase mana pool, spell loadout size, focus slots, or ritual stability.              | Major magic still requires schools and knowledge.                    |
| Automation Efficiency              | High levels can unlock broad engineering efficiency bonuses or machine-handling perks.           | Specific machines still require research and materials.              |
| Reputation Bonus Options           | Leadership, diplomacy, trade, and village-help perks may improve reputation gain.                | Not automatic universal trust. Actions still matter.                 |

## 4.2 Suggested Level Milestone Bands

| **Milestone Band** | **Progression Feel**                  | **Typical Unlock Direction**                                                                                             |
|--------------------|---------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Level 1-5          | Primitive survival and first contact. | Basic tools, shelter, early crafting, first village contact, first skill levels.                                         |
| Level 6-15         | Early settlement and material growth. | Copper/bronze/iron path, workstations, first reputation perks, first combat or utility magic.                            |
| Level 16-30        | Mid-game branching.                   | Automation, larger village projects, skill perks, research, blacksmithing, alchemy, first dungeons, first advanced gear. |
| Level 31-60        | Regional influence.                   | Trade routes, stronger combat, advanced machines, magic schools, settlement founding, early dimensions or pocket realms. |
| Level 61+          | Civilisation and world-shaping.       | Golems, portals, city-scale projects, faction influence, endgame magic, major dimensions, mythic materials.              |

# 5. XP Sources and Reward Philosophy

XP should reward every major playstyle. A peaceful builder, a miner, a village helper, a combat adventurer, a mage, an engineer, a trader, or a conqueror should all gain levels through their chosen loop.

| **XP Source**     | **Small/Repetitive XP**                                           | **Milestone XP Examples**                                                                                |
|-------------------|-------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| Mining/Gathering  | Breaking ore, chopping trees, harvesting plants, gathering stone. | First new ore found, rare deposit discovered, first automated mine, major quarry output.                 |
| Crafting/Building | Crafting items, placing blocks, building functional stations.     | First workbench, first furnace, first blueprint, first completed player base, first settlement building. |
| Combat            | Defeating mobs, surviving raids, clearing camps.                  | First boss, village saved, dungeon cleared, faction war objective won.                                   |
| Exploration       | Discovering landmarks, caves, biomes, ruins, structures.          | First village found, first ruin solved, map region completed, dimension entered.                         |
| Village Help      | Delivering resources, fulfilling needs, repairing damage.         | Village stage upgrade, watchtower completed, blacksmith unlocked, famine prevented.                      |
| Magic Use         | Casting spells, crafting runes, enchanting items.                 | First spell learned, school tier advanced, ritual completed, ward protects village.                      |
| Automation        | Machine crafting, production ticks, connected storage outputs.    | First production chain, first village supply line, first automated farm, throughput milestone.           |
| Quests/Story      | Minor requests, bounties, delivery tasks.                         | Race story chapter, faction alliance, major choice, dungeon story conclusion.                            |
| Trading/Economy   | Buying, selling, bartering, fulfilling contracts.                 | First trade route, major supply contract, market upgrade, faction trade unlock.                          |

| **Anti-Frustration Rule:** Repeated action XP should be transparent and satisfying, but the game should not require mindless grinding. Milestone XP, world discoveries, village growth, and system integration should remain the most exciting way to level. |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 6. Derived Stats and Player Resources

The player does not have classic RPG attributes such as Strength, Agility, Intelligence, or Charisma. Instead, progression uses derived stats, resources, skills, gear, magic, and perks. This keeps the game more sandbox-readable and avoids forcing class builds.

| **Resource/Stat**        | **Default Role**                                                                            | **Progression Sources**                                                            |
|--------------------------|---------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Health                   | Survival and combat durability.                                                             | Level rewards, food quality, armour, vitality perks, healing magic, buffs.         |
| Stamina                  | Mainly sprinting, blocking, dodging, melee pressure, and intense combat actions.            | Level rewards, combat/survival perks, food buffs, gear, training.                  |
| Mana                     | Personal magical casting resource.                                                          | Level rewards, magic perks, spell focuses, mana crystals, rituals, school mastery. |
| External Magical Fuel    | Machine, ritual, rune, enchantment, and automation fuel.                                    | Mana crystals, conduits, batteries, leylines, arcane engines, dimension materials. |
| Hunger/Food              | Important food loop by default; supports farming, cooking, trade, village needs, and buffs. | Better meals, farming, cooking skill, village supply chains, automation.           |
| Temperature              | Environmental challenge and biome/weather identity.                                         | Clothing, shelter, fire, insulation, magic, potions, world settings.               |
| Carry/Inventory Capacity | Limits logistics and expedition planning.                                                   | Backpacks, carts, beasts, magic bags, perks, automation, storage networks.         |
| Resistance/Protection    | Reduces environmental, combat, magic, and status threats.                                   | Armour, enchants, wards, potions, perks, race/faction gear.                        |

## 6.1 No Classic Attributes

- No starting Strength, Dexterity, Intelligence, Willpower, Charisma, Attunement, or Craftsmanship attributes.

- No class restrictions and no starting backgrounds by default.

- Role identity comes from what the player does: skills, perks, gear, magic schools, machines, reputation, settlement choices, and morality.

- Level-up can improve derived stats such as health, stamina, mana, carrying capacity, and efficiency without creating attribute build restrictions.

# 7. Skill System

The game should have many individual skills. Skills primarily level through use: the player becomes better at mining by mining, farming by farming, fighting by fighting, trading by trading, and using magic by casting and crafting related magic. NPCs, books, and research may teach recipes or perks, but the core skill XP loop is use-based.

| **Skill**                    | **How It Levels**                                                                       | **What It Can Unlock or Improve**                                                          |
|------------------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Mining                       | Mine stone, ores, crystals, rare deposits.                                              | Speed, yield, special drops, safer deep mining, advanced ore handling.                     |
| Woodcutting                  | Chop trees, process logs, manage forests.                                               | Speed, yield, special timber, replanting bonuses, sawmill efficiency.                      |
| Farming                      | Plant, harvest, irrigate, breed crops, manage soil.                                     | Crop yield, growth speed, rare seeds, food quality, automation compatibility.              |
| Building                     | No skill gate for free building; use for construction planning/support if later needed. | Can improve blueprint handling, scaffolding speed, material planning, NPC project support. |
| Crafting                     | Craft tools, blocks, stations, components.                                              | Efficiency, reduced waste, better item quality, recipe categories.                         |
| Smithing                     | Forge tools, weapons, armour, machine parts.                                            | Durability, quality, metal recipes, repair efficiency, guard equipment.                    |
| Alchemy                      | Brew potions, catalysts, fuels, transmutation reagents.                                 | Potion strength, catalyst efficiency, medicine, explosives, machine inputs.                |
| Enchanting                   | Enchant tools, gear, machines, structures.                                              | Enchant strength, stability, slots, warding, magical utility.                              |
| Magic Schools                | Use spells, runes, rituals, school-specific items.                                      | School mastery, spell variants, mana efficiency, ritual stability.                         |
| Combat                       | Fight with melee, block, dodge, survive combat.                                         | Damage handling, combos, stamina efficiency, survivability.                                |
| Archery/Ranged               | Use bows, crossbows, thrown weapons, ranged devices.                                    | Accuracy, reload, draw speed, special shots, guard training.                               |
| Trading                      | Buy, sell, fulfil contracts, manage trade value.                                        | Prices, trade routes, demand visibility, contract rewards.                                 |
| Leadership                   | Command followers, manage settlements, inspire NPCs.                                    | Followers, patrols, laws, morale, settlement operations.                                   |
| Exploration/Survival         | Travel, map, forage, endure weather, navigate danger.                                   | Map detail, camp quality, hazard resistance, discovery rewards.                            |
| Engineering/Automation       | Build, tune, route, and maintain machines.                                              | Machine efficiency, diagnostics, throughput, power handling, automation perks.             |
| Animal Handling/Beast Taming | Tame, breed, ride, train, and care for animals/beasts.                                  | Mounts, farm animals, beasts of burden, combat companions.                                 |
| Diplomacy/Reputation         | Negotiate, assist, persuade, resolve conflicts.                                         | Reputation gain, dialogue options, alliances, faction handling.                            |

## 7.1 Skill Level Rules

- Skills level through repeated use, not through starting classes or attributes.

- Low skill should rarely cause outright failure. It should mainly reduce speed, efficiency, output quality, stability, or available advanced options.

- Skills can unlock eligibility for recipes, but recipes can also come from research, NPCs, books, ruins, quests, experimentation, or trade.

- Skill caps should not hard-lock the player from eventual mastery. One character can eventually master all skills given enough time.

- Skill trees should support specialisation without making other playstyles impossible.

# 8. Perk Tree System

Perk trees are the main RPG-style specialisation system. The chosen design favours large perk trees across all major gameplay pillars. Perks should feel meaningful, but the player can eventually master everything, so choices define the current path rather than permanently locking the character.

| **Perk Tree**            | **Example Focus**                                                                                 |
|--------------------------|---------------------------------------------------------------------------------------------------|
| Survival                 | Food, weather, camp safety, healing, stamina management, exploration endurance.                   |
| Mining                   | Ore yield, mining speed, rare crystal handling, deep mining safety, tool preservation.            |
| Building                 | Blueprint planning, material estimates, scaffolding, construction speed, aesthetic utility.       |
| Farming                  | Crop yield, irrigation, animal feed, food quality, automation-friendly farms.                     |
| Combat                   | Weapon handling, blocking, dodging, armour use, stamina efficiency, combat survivability.         |
| Magic                    | Mana pool, spell loadouts, school mastery, spell efficiency, ritual stability, focus slots.       |
| Automation               | Machine efficiency, diagnostics, power handling, throughput, maintenance, routing tools.          |
| Leadership               | Followers, village projects, morale, guard orders, settlement commands, laws.                     |
| Trade                    | Prices, demand visibility, caravans, market contracts, merchant reputation.                       |
| Exploration              | Maps, landmarks, cave awareness, movement, resource discovery, ruin reading.                      |
| Settlement Management    | Town stages, NPC jobs, storage policies, trade routes, defence planning, production priorities.   |
| Forbidden Magic/Conquest | Fear control, tribute, dark labour, conquest systems, villain diplomacy, hostile faction options. |

## 8.1 Perk Unlock Sources

| **Source**                 | **Use**                                                                                   |
|----------------------------|-------------------------------------------------------------------------------------------|
| Overall Level              | Grants general perk points usable across broad categories.                                |
| Skill Level                | Grants or unlocks skill-specific perks.                                                   |
| Research                   | Unlocks technical, magical, automation, and ancient perks.                                |
| NPC Teachers               | Unlocks culture-specific, magic-specific, faction-specific, or profession-specific perks. |
| Village/Faction Reputation | Unlocks social, leadership, trade, settlement, and culture perks.                         |
| Bosses/Dimensions          | Unlocks rare combat, magic, material, and realm-related perks.                            |

# 9. Mastery, Respec, and Specialisation

| **System**                   | **Locked Rule**                                                            | **Design Reason**                                                                                |
|------------------------------|----------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| Master Everything Eventually | One character can eventually unlock everything.                            | Supports long-term sandbox play without forcing restarts.                                        |
| Specialisation Still Matters | Perks and skills create current identity and efficiency differences.       | Players can feel like a mage, engineer, trader, leader, fighter, or builder at different stages. |
| Respec                       | Available with cost, resource, NPC, shrine, ritual, or settlement service. | Choices matter, but mistakes are not permanent.                                                  |
| Multiplayer Specialisation   | Encouraged but not required.                                               | Friends can divide roles naturally without locking solo players out.                             |
| No Permanent Class Lock      | No classes, no backgrounds, no permanent attribute build.                  | Keeps sandbox identity and free experimentation.                                                 |

| **Suggested Respec Fiction:** Respec can be framed as visiting a Memory Shrine, Spirit Mentor, Guild Trainer, Archmage, or Settlement Hall. The cost may be coin, rare crystals, time, reputation, or a crafted respec item. |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 10. Tool, Material, and Equipment Progression

Tool progression remains very important, especially early. However, tools are not the only progression layer. Skills, magic, automation, gear, machines, research, and village development all matter too.

| **Material Tier**                    | **Primary Use**                                                         | **Progression Identity**                                                                               |
|--------------------------------------|-------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Wood                                 | First tools, planks, fuel, basic building, early village help.          | Immediate survival and construction foundation. Stays useful for building, fuel, and village projects. |
| Stone                                | Basic tools, furnaces, walls, roads, early structures.                  | First durable material. Stays useful for construction and village projects.                            |
| Copper                               | Wiring, machine parts, simple tools, early mechanisms.                  | First technical material; starts automation identity.                                                  |
| Bronze                               | Improved tools, mechanisms, fittings, durable parts.                    | Transitional alloy that improves early metal progression before iron dominance.                        |
| Iron                                 | Strong tools, weapons, armour, anvils, machines, guard equipment.       | Major settlement and defence material.                                                                 |
| Steel                                | Advanced machines, structural parts, high-tier gear, rails, defences.   | Industrial fantasy foundation.                                                                         |
| Mana Crystal / Refined Mana          | Magic fuel, rune crafting, mana furnace, magical stations, wards.       | First magic infrastructure material.                                                                   |
| Mythic Metals                        | Advanced gear, arcane machines, enchantment frames, dimension prep.     | Late-game identity materials with special behaviours rather than simple stat upgrades.                 |
| Void/Celestial/Dimensional Materials | Portals, rituals, endgame machines, realm gear, world-shaping projects. | Dimension and endgame systems.                                                                         |

## 10.1 What Tools Unlock

| **Unlock Type**              | **Examples**                                                                                                                 |
|------------------------------|------------------------------------------------------------------------------------------------------------------------------|
| Faster Gathering             | Higher mining speed, chopping speed, harvesting speed, digging speed.                                                        |
| Harder Blocks/Ores           | Stone pick mines copper; copper/bronze handles early metals; iron handles tougher ores; magic tools handle special deposits. |
| Combat Use                   | Axes, hammers, mining tools, sickles, staffs, and special tools can double as weapons if designed.                           |
| Building Precision           | Advanced tools can rotate, copy, replace, chisel, shape, or blueprint blocks more easily.                                    |
| Special Abilities            | Excavation pulse, tree-felling sweep, vein detection, crop tending, rune marking, repair mode.                               |
| Automation Compatibility     | Tools may socket into machines, define recipes, or unlock machine variants.                                                  |
| Magic/Rune Socketing         | Higher-tier tools can hold runes, enchantments, school effects, or utility magic.                                            |
| Village Project Requirements | Villages may require specific tool materials or equipment for builders, miners, guards, blacksmiths, and specialists.        |

## 10.2 Equipment Rarity

Equipment uses rarity labels such as Common, Uncommon, Rare, Epic, and Legendary. Rarity should mainly describe special traits, enchantments, unique bonuses, named items, or rare generation, not just raw damage. A Common steel sword and a Rare steel sword may use the same base material, but the rare item has extra properties, better quality, cultural history, or enchantment capacity.

| **Rarity** | **Typical Meaning**                                                                                 |
|------------|-----------------------------------------------------------------------------------------------------|
| Common     | Standard crafted or found item.                                                                     |
| Uncommon   | Slightly improved, culture-specific, quality-modified, or with one minor property.                  |
| Rare       | Special trait, strong enchantment, rare material mix, dungeon reward, or advanced crafting outcome. |
| Epic       | Powerful unique function, boss/dimension tie, major faction recipe, or high-end magical item.       |
| Legendary  | Named item, world-lore object, major quest reward, race story artefact, or endgame creation.        |

# 11. Survival Need Progression

Survival needs exist but should remain configurable. The locked core for progression is health, stamina, mana, hunger/food, and temperature. Thirst, sleep/fatigue, illness, sanity, and a player corruption meter are not core progression resources by default.

| **Need**          | **Default Direction**                               | **Progression Connection**                                                                                                                               |
|-------------------|-----------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Food/Hunger       | Important by default.                               | Farming, cooking, NPC food needs, village storage, food automation, buffs, trade, festivals.                                                             |
| Thirst            | Not a default progression need.                     | Can be added by harsh survival setting later, but should not be required by default.                                                                     |
| Temperature       | Environmental challenge rather than constant meter. | Clothing, shelter, fire, magic, biome preparation, exploration gates.                                                                                    |
| Sleep/Fatigue     | Optional convenience or world setting.              | Beds, respawn, night skipping, recovery, NPC schedules.                                                                                                  |
| Illness           | Optional or rare status system.                     | Medicine, alchemy, food quality, healer NPCs, harsh settings.                                                                                            |
| Corruption/Sanity | No core player corruption meter.                    | Forbidden magic can use reputation, faction reaction, ritual risk, or world effects instead. Environmental corruption may exist in dimension/magic docs. |

# 12. Knowledge, Recipe, and Research Unlocks

Recipes and unlocks should come from many sources. This supports sandbox discovery and prevents a single linear tech tree from controlling the whole game. Research exists, but it should be light and optional by default, becoming deeper for magic, automation, and ancient technology.

| **Unlock Source**      | **Examples**                                                              | **Best Use**                                                      |
|------------------------|---------------------------------------------------------------------------|-------------------------------------------------------------------|
| Material Discovery     | Pick up copper, mana crystal, ancient gear fragment, rare seed.           | Basic recipe reveal and early discovery pacing.                   |
| Prerequisite Crafting  | Craft workbench -\> furnace -\> anvil -\> sawmill -\> assembler.          | Readable station-based progression.                               |
| NPC Teachers           | Mage teaches spell, blacksmith teaches alloy, engineer teaches machines.  | Culture, profession, reputation, and village integration.         |
| Research Stations      | Study samples, build prototypes, analyse ruins, test components.          | Automation, magic, machines, ancient knowledge, advanced recipes. |
| Books and Ruins        | Lore books, diagrams, murals, tablets, damaged schematics.                | Exploration-driven unlocks and ancient mystery.                   |
| Village/Faction Quests | Help village grow, complete faction contract, solve shortage.             | Civilisation progression and social rewards.                      |
| Skill Levels           | Mining skill reveals extraction methods; smithing unlocks better forging. | Use-based skill relevance.                                        |
| Buying/Training        | Purchase recipe, hire tutor, join guild, trade secrets.                   | Economy and reputation path.                                      |
| Experimentation        | Combine ingredients, test runes, prototype machine parts.                 | Discovery-focused players and emergent crafting.                  |

## 12.1 Research Cost Types

| **Cost Type**           | **Example**                                                              |
|-------------------------|--------------------------------------------------------------------------|
| Time                    | Research takes in-game time or workstation cycles.                       |
| Materials               | Samples, components, ores, monster drops, machine parts.                 |
| Books/Lore Fragments    | Pages, tablets, schematics, spell diagrams.                              |
| Mana Crystals           | Arcane experiments and magical devices.                                  |
| NPC Specialist Labour   | Mage, scholar, engineer, smith, alchemist, archivist, rune-smith.        |
| Machine Output Items    | Prototype components, test ingots, gear assemblies, calibration tools.   |
| Quest/Story Progress    | Race story chapter, faction permission, restored archive, village stage. |
| Discovery-Based Unlocks | Some knowledge unlocks immediately when found, with no cost.             |

# 13. Magic Progression

Magic should appear after basic survival tools and/or through village or ruin discovery. It should feel special, but not so late that the fantasy is delayed. Magic is not only combat; it supports utility, automation, villages, exploration, and dimensions.

| **Magic Unlock Path**  | **How It Works**                                                                                             |
|------------------------|--------------------------------------------------------------------------------------------------------------|
| Mana Crystal Discovery | Mining or finding mana crystals reveals basic magical materials and recipes.                                 |
| Village Mage           | A mage NPC teaches early spells, utility magic, rune use, or magical crafting.                               |
| Ruin Discovery         | A ruined tower, shrine, or ancient device teaches spell diagrams, rune patterns, or basic rituals.           |
| Spellbook              | Books unlock spells, spell variants, schools, lore, or research prompts.                                     |
| Rune Table             | Crafting or repairing a rune table unlocks crafted runes, spell modules, machine runes, and utility effects. |
| Magical Background     | Not a default character background, but world settings or special starts may allow this later.               |

## 13.1 Magic Schools and Role Categories

| **Magic Path**      | **Progression Role**                                                                 |
|---------------------|--------------------------------------------------------------------------------------|
| Elemental           | Combat, furnaces, irrigation, mining, weather, machines, movement.                   |
| Rune Magic          | Automation, logic, machines, doors, gates, mana networks, settlement infrastructure. |
| Nature Magic        | Farming, animals, forests, healing, ecological balance, food systems.                |
| Golemancy           | Magical workers, guards, haulers, miners, builders, farmers, repairers.              |
| Alchemy             | Potions, catalysts, transmutation, fuels, explosives, medicines.                     |
| Enchanting          | Tools, weapons, armour, machines, structures, wards, equipment identity.             |
| Portal/Ritual Magic | Dimensions, fast travel, world events, large structures, endgame infrastructure.     |
| Necromancy          | Undead labour, spirits, bone crafting, forbidden rituals, villain paths.             |
| Shadow/Blood Magic  | Powerful forbidden effects, stealth, curses, sacrifice, dark factions.               |
| Divine/Spirit Magic | Blessings, protection, healing, faith structures, spiritual realms, culture stories. |

## 13.2 Spell Mastery and Casting Model

| **System**        | **Locked Direction**                                                                                                                                                                |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Spell Mastery     | Combination of repeated use, perk points, research upgrades, NPC teaching, focus upgrades, and school-specific quests.                                                              |
| Casting Model     | Hybrid: known spell list + prepared loadouts + crafted runes/modules + gear-based spells.                                                                                           |
| Magic Costs       | Personal mana, stamina in some cases, components, runes, focus durability, cooldowns, external crystals, ritual structures, school-specific costs.                                  |
| Magic vs Machines | Magic supports machines but does not replace them at scale. Machines remain better for bulk production; magic provides power, specialisation, utility, and advanced infrastructure. |
| Corruption        | No core player corruption meter. Forbidden magic uses faction reaction, reputation, fear, cost, ritual risk, and world consequences instead.                                        |

# 14. Automation Progression

Automation starts after basic metal progression, especially copper and iron, but an automation-focused player can move into it earlier than other paths if they prioritise materials and recipes. Automation depth should be medium: satisfying for factory players but not overwhelming for players focused on building, villages, combat, or magic.

| **Automation Stage**        | **Unlock Sources**                                                                  | **Purpose**                                                                                    |
|-----------------------------|-------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Manual and Basic Storage    | Wood, stone, workbench, chest, hoppers/chutes if included.                          | Reduce early handling and prepare for processing.                                              |
| Copper/Bronze Mechanisms    | Copper, bronze, gears, crank, water wheel, windmill, NPC engineer, research.        | Introduce power, motion, and simple mechanical production.                                     |
| Iron Processing Chain       | Iron, furnace, miner, transport, storage.                                           | First core POC chain: manual furnace -\> automated miner/furnace -\> village warehouse supply. |
| Basic Logistics             | Belts, pipes, item chutes, splitters, filters, sorters.                             | Move resources from machines into storage and village warehouses.                              |
| Machine Efficiency Upgrades | Engineering skill, perks, research, components, specialists.                        | Increase output, reduce fuel, diagnose bottlenecks, improve reliability.                       |
| Magic Automation            | Mana crystals, rune table, mana furnace, mana conduits, arcane batteries.           | Merge magic and production.                                                                    |
| Golem Labour                | Golemancy, magic research, advanced materials, village/settlement infrastructure.   | Programmable workers for mining, hauling, building, farming, guarding, repair.                 |
| Dimensional Logistics       | Portals, rituals, dimension materials, faction knowledge, major settlement support. | Linked warehouses, remote supply, inter-realm chains, endgame networks.                        |

## 14.1 Power Model

| **Power Source**    | **Use Case**                                                                           |
|---------------------|----------------------------------------------------------------------------------------|
| Manual/Crank        | Very early machines, demos, temporary production, tutorial use.                        |
| Fuel Engine/Furnace | Reliable early processing using wood, coal, charcoal, oil-like fuels, or magical fuel. |
| Water Wheel         | Settlement-friendly medieval mechanism for rivers and mills.                           |
| Windmill            | Surface power for farms, sawmills, grinders, and village infrastructure.               |
| Mana Crystal        | Magical machines, mana furnaces, runes, wards, arcane automation.                      |
| Mixed Network       | Different regions, player paths, and machines can support different power solutions.   |

| **Automation Skill:** Automation has both an Engineering/Automation skill tree and machine efficiency upgrades. Progression comes from materials, research, NPC engineers, village projects, ruins, magic/runes, and crafting milestones. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 15. Village, Reputation, and Civilisation Progression

Village reputation is a major progression path, but it should remain playstyle-sensitive. A player can help villages, trade with them, defend them, build for them, supply them with automation, ignore them, exploit them, or conquer them. Reputation should track individual NPCs, villages, and factions.

| **Reputation Layer**            | **Tracks**                                                                   | **Unlocks**                                                                                   |
|---------------------------------|------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Individual NPC                  | Trust, friendship, fear, betrayal, personal history.                         | Personal quests, discounts, teaching, followers, unique dialogue, relationships.              |
| Village                         | Overall trust, gratitude, fear, dependency, hostility, contribution history. | Better prices, services, request tiers, building projects, blueprints, story stages, workers. |
| Faction/Culture                 | Wider political and cultural standing.                                       | Faction arcs, alliances, recipes, trade access, military support, magic teaching, enemies.    |
| Group Reputation in Multiplayer | Shared party or settlement reputation where world setting enables it.        | Useful for co-op world progress while still preserving individual consequences.               |

## 15.1 Reputation Unlocks

| **Unlock Type**              | **Examples**                                                                                |
|------------------------------|---------------------------------------------------------------------------------------------|
| Better Trade Prices          | Discounts, higher sell prices, bulk contracts, priority orders.                             |
| Unique Recipes               | Culture blocks, weapons, foods, machines, spells, armour, building pieces.                  |
| NPC Followers/Workers        | Guards, builders, haulers, apprentices, companions, specialists.                            |
| Village Services             | Repair, healing, training, storage, market, travel, crafting help.                          |
| Story Arcs                   | Race stories, faction arcs, village mysteries, dimensional preparations.                    |
| Magic Teaching               | School basics, culture magic, ritual hints, rune patterns, wards.                           |
| Building Blueprints          | Watchtowers, walls, shrines, farms, workshops, culture houses, mage towers.                 |
| Land/Settlement Permission   | Optional town-law system for building, founding, renting, or claiming in village territory. |
| Faction Alliances            | Military aid, trade protection, diplomatic options, shared goals.                           |
| Marriage/Family/Social Bonds | Optional life-sim progression if included later.                                            |
| Military Support             | Guards, patrols, siege aid, defensive equipment, faction troops.                            |

## 15.2 Village Growth as Progression

| **Village Stage** | **Player Progression Rewards**                                                            |
|-------------------|-------------------------------------------------------------------------------------------|
| Camp              | Basic requests, survival trade, first social contacts, simple food/tool needs.            |
| Hamlet            | Warehouse, builder projects, basic reputation, first specialists, first village upgrades. |
| Village           | Blacksmith, merchant, guards, farms, culture recipes, more jobs, safer region.            |
| Fortified Village | Walls, watchtowers, guards, patrols, military support, stronger story hooks.              |
| Town              | Specialists, schools, shrines, guilds, trade routes, faction diplomacy, advanced recipes. |
| City              | Politics, districts, major projects, high-tier services, large-scale trade and defence.   |
| Capital           | Race destiny, world-scale choices, dimension gates, legendary projects, endgame support.  |

# 16. Building, Settlement, and Leadership Progression

Player free-building should not be locked behind a building skill. The player can build creatively as long as they have resources and blocks. Functional settlement systems, however, use settlement stages, NPC jobs, storage, laws, leadership perks, reputation, and buildings.

| **Building Method**       | **Unlock Timing**                                          | **Progression Role**                                                                 |
|---------------------------|------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Block-by-Block            | Available from the start.                                  | Maximum creative freedom and classic voxel building.                                 |
| Modular Pieces            | Early progression.                                         | Faster detailed building: walls, roofs, windows, arches, furniture, stations.        |
| Blueprint Construction    | Mid-game.                                                  | Plan larger structures, preview resources, repeat designs, support NPC construction. |
| NPC-Assisted Construction | After village interaction or settlement systems.           | Builders consume stored resources and construct in stages.                           |
| Culture/Research Building | Through factions, races, research, magic, and exploration. | Distinct architecture, special functions, faction identity, story buildings.         |

## 16.1 Player Settlement Stages

| **Stage** | **Requirements**                                                             | **Progression Unlocks**                                                                |
|-----------|------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Camp      | Claim marker, bed/shelter, storage, food access.                             | Basic safe point, simple NPC visits, temporary workers.                                |
| Hamlet    | Multiple homes, food production, workstations, storage, first NPC residents. | Basic jobs, requests, repairs, local identity.                                         |
| Village   | Warehouse, farms, guards, workshops, basic laws, reputation base.            | Stable production, trade, NPC growth, builder projects.                                |
| Town      | Specialised districts, trade route, school/guild/shrine, defences.           | Specialists, faction relations, advanced recipes, leadership perks.                    |
| City      | Large population, major projects, politics, advanced infrastructure.         | Regional influence, military support, advanced magic/automation, large economy.        |
| Capital   | World-scale infrastructure, major faction identity, endgame projects.        | Race/faction destiny, dimension support, legendary status, civilisation-scale systems. |

## 16.2 Leadership Progression

| **Leadership Source**      | **Effect**                                                                                      |
|----------------------------|-------------------------------------------------------------------------------------------------|
| Leadership Skills/Perks    | Followers, morale, patrol orders, project prioritisation, settlement management tools.          |
| Reputation and NPC Loyalty | NPCs obey, volunteer, migrate, teach, follow, defend, or support the player.                    |
| Buildings and Laws         | Settlement hall, barracks, market, shrine, school, laws, taxes, patrol zones, storage policies. |

# 17. Combat, Defence, and Adventure Progression

Combat is a major pillar, but it should be optional or reduced on peaceful settings. Combat progression should support adventurers, defenders, dungeon explorers, raiders, conquerors, and players who mainly fight to protect villages.

| **Combat Progression Layer** | **Examples**                                                                         |
|------------------------------|--------------------------------------------------------------------------------------|
| Weapon Tiers                 | Wood/crude weapons, copper/bronze, iron, steel, mythic, magical, legendary.          |
| Armour Tiers                 | Cloth/leather, hide, chain, iron, steel, magical robes, mythic armour, faction sets. |
| Combat Skills                | Melee, ranged, blocking, dodging, stamina handling, weapon styles.                   |
| Combat Perks                 | Combos, stamina reduction, critical bonuses, defence, crowd control, shield use.     |
| Magic Combat                 | Elemental bolts, shields, summons, curses, healing, control, enchanted weapons.      |
| Movement Abilities           | Dodging, sprint bursts, climbing, levitation, dash spells, mount combat.             |
| Companions/Followers         | Guards, beasts, golems, NPC companions, faction allies.                              |
| Village Defence Support      | Watchtowers, walls, gates, patrols, traps, wards, equipped guards.                   |

## 17.1 Boss Progression Philosophy

| **Boss Role**          | **Use**                                                                                    |
|------------------------|--------------------------------------------------------------------------------------------|
| Major Gate Bosses      | Some major bosses unlock tiers, dimensions, ancient systems, or story gates.               |
| Optional Branch Bosses | Optional bosses unlock unique gear, spells, materials, faction favour, or side dimensions. |
| Reward Bosses          | Some bosses mainly provide rare rewards without mandatory progression.                     |
| Dimension/Story Bosses | Realm and race-story bosses can gate major dimension progression.                          |

# 18. Exploration, Boss, and Dimension Progression

Exploration progression uses tools, gear, magic, reputation, maps, bosses, and knowledge. Dimensions are significant progression gates and exploration rewards, but not every dimension must be mandatory.

| **Gate Type**       | **Examples**                                                                                    |
|---------------------|-------------------------------------------------------------------------------------------------|
| Tool Gate           | Better pickaxes open deeper ores, ancient blocks, special crystals, sealed ruins.               |
| Gear Gate           | Armour, weapons, temperature gear, potions, mount gear, underwater or air protection.           |
| Magic Gate          | Rune keys, light spells, levitation, portal spells, block shaping, cleansing, realm navigation. |
| Reputation/Map Gate | Faction maps, village rumours, road access, cultural permission, guide NPCs.                    |
| Boss Gate           | Boss key, guardian defeat, monster nest cleared, dimension guardian defeated.                   |
| Research Gate       | Ritual decoded, portal components understood, ancient machine repaired.                         |
| Settlement Gate     | A village/town/city restores shrine, builds portal, gathers scholars, or funds expedition.      |

## 18.1 Major Dimension Entry Requirements

Major dimensions can require different combinations of rare materials, village/culture story progression, portal structures, boss keys, magic research, faction permission or knowledge, ritual events, and player level or skill thresholds. The exact requirement depends on the dimension and its narrative role.

| **Dimension Gate Style** | **Example**                                                                                               |
|--------------------------|-----------------------------------------------------------------------------------------------------------|
| Race Story Dimension     | Requires a developed race settlement, restored shrine, cultural ritual, rare material, and faction trust. |
| Resource Dimension       | Requires protective gear, rare materials, portal frame, and survival preparation.                         |
| Boss Dimension           | Requires boss key, guardian defeat, ritual site, and major combat readiness.                              |
| Utility Dimension        | Requires research, machine components, and magic infrastructure.                                          |
| World Lore Dimension     | Requires ancient books, archaeology, puzzle ruins, and scholar/mage support.                              |

| **Pocket Realms:** Smaller pocket realms should exist as teaser content in some dungeons and ruins. These can be dream spaces, shrine trials, fae pockets, cave realms, spirit echoes, or damaged portal rooms before full dimensions unlock. |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 19. Evil and Conqueror Progression

Evil and conqueror play should be a full alternate progression path, not merely a way to destroy content. The player can exploit, conquer, intimidate, use forbidden magic, side with monsters, or control settlements, but the world responds with fear, hostility, resistance, rebellion, faction intervention, or darker allies.

| **Evil/Conquest Action** | **Progression Reward**                                                 | **Consequence**                                                               |
|--------------------------|------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Threaten Village         | Tribute, forced discounts, fear reputation, intimidation options.      | Trust loss, resistance, guards, faction anger.                                |
| Conquer Settlement       | Control of storage, labour, projects, taxes, forced production.        | Rebellions, refugee stories, enemy alliances, tyrant reputation.              |
| Forbidden Magic          | Powerful spells, undead labour, blood/shadow rituals, dark automation. | Faction hostility, fear, ritual cost, possible world or village consequences. |
| Monster/Bandit Alliance  | Raid support, black market, alternative quests, villain factions.      | Civilised factions distrust or attack the player.                             |
| Exploit NPCs             | Short-term labour and resources.                                       | Morale collapse, sabotage, hidden resistance, migration.                      |

| **No Fake Freedom:** Evil play should unlock systems, but it must also create meaningful resistance. It should not simply remove quests without offering alternate stories, powers, economies, and dangers. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

# 20. Death, Failure, and Progression Loss

Player death should not reduce progression by default. The player should not lose levels or permanent skill progress on normal settings. Death should primarily create a recoverable tombstone/inventory challenge. World failures, especially village defence failures, can affect village resources, buildings, NPCs, and reputation, but should generally be recoverable.

| **Failure Type**       | **Default Progression Effect**                                                                                                          |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Player Death           | No level loss and no skill loss by default. Inventory and experience can be recovered through tombstone/grave.                          |
| Failed Village Defence | Buildings may be damaged, resources lost, NPCs injured or killed, and reputation affected. Recoverable by default.                      |
| Village Damage         | Repair projects, resource requests, morale issues, interrupted production.                                                              |
| Village Collapse       | Possible on normal/hard if repeated failures occur, but not permanent by default in easier settings.                                    |
| Skill Loss             | No permanent skill loss. Temporary injury/debuff can exist if difficulty settings allow it.                                             |
| Reputation Loss        | Can drop from choices, failures, betrayal, conquest, theft, or faction conflict. Can recover through work/quests unless story-specific. |

# 21. Multiplayer Progression

Multiplayer progression should be flexible and world-setting controlled. Players can specialise naturally, but everyone should be able to do everything eventually. Reputation should support both individual and group tracking, especially because one player may be helpful while another is hostile or criminal.

| **Multiplayer Setting** | **Possible Options**                                                                                                                    |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| Progression Sharing     | World/server setting: individual, mostly individual with shared world unlocks, individual skills with shared research, or fully shared. |
| Recipe Sharing          | World/server setting: individual, shared by library/research station, shared inside same settlement/faction, or universal.              |
| Reputation              | Individual plus group reputation where practical. Server/world setting can control group weighting.                                     |
| Specialisation          | Somewhat encouraged but not required. Players can focus on magic, combat, building, villages, engineering, farming, or exploration.     |
| World Unlocks           | Major settlement stages, dimension gates, trade routes, and village events can be shared world-state progression.                       |

# 22. UI and Feedback

Progression has many layers, so UI must be clear. The player should understand what improved, why it improved, what is newly available, and what paths are open next without forcing a linear questline.

| **UI Screen/Feedback**       | **Purpose**                                                                                                             |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------|
| Character Progression Screen | Shows overall level, XP, derived stats, perk points, skill levels, and current progression bonuses.                     |
| Skill Journal                | Shows skill XP, next unlocks, current perks, use history, and mastery bonuses.                                          |
| Perk Trees                   | Displays large trees, prerequisites, costs, respec access, and future goals.                                            |
| Recipe Book                  | Shows known recipes, hinted recipes, missing materials, unlock sources, and discovery history.                          |
| Research Screen              | Shows research projects, consumed items, required specialists, time, and unlocked results.                              |
| Magic Book/Grimoire          | Shows known spells, loadouts, runes, school mastery, components, mana costs, and upgrades.                              |
| Automation Handbook          | Shows machine unlocks, power types, production chains, throughput tips, and village supply links.                       |
| Reputation Screen            | Shows individual NPC, village, and faction reputation, trust/fear, unlocks, and recent actions.                         |
| Settlement Screen            | Shows stage, requirements, population, jobs, laws, projects, storage, defences, and needs.                              |
| POC UI                       | Keep simple: level bar, basic skills, recipe unlocks, request board, village storage, machine UI, magic unlock prompts. |

# 23. Proof-of-Concept Progression Scope

The POC should prove progression in a small integrated loop. It should not try to implement the full final game. The first clear milestone is crafting first tools. From there, the POC should connect tool progression, simple level progression, basic skill use, village reputation, automation, magic, defence, a quest chain, and basic research.

| **POC Progression Loop:** Craft first tools -\> gather wood/stone/ore -\> find village -\> deliver resources -\> gain reputation/XP -\> build or supply warehouse -\> unlock simple automation -\> discover mana/magic -\> craft rune table or mana furnace -\> learn combat and utility spell -\> supply watchtower -\> survive raid with changed outcome. |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|

| **POC System**         | **Required Progression Proof**                                                                                                                               |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Simple Player Level    | Player gains XP from gathering, crafting, delivery, basic combat, magic, and automation milestones. Level-up grants at least one small reward or perk point. |
| Basic Tool Tiers       | Crude/wood or stone tools, then copper/iron path. Tools improve gathering and unlock ore access.                                                             |
| Basic Skills           | Mining, woodcutting, crafting, combat, and magic can show simple use-based progress.                                                                         |
| Crafting Stations      | Workbench, furnace, chest, village warehouse, mana furnace or rune table, and one machine.                                                                   |
| Village Reputation     | Delivering resources improves village trust and unlocks the watchtower/warehouse step.                                                                       |
| Automation Unlock      | Manual furnace -\> automated miner/furnace -\> storage -\> village warehouse supply.                                                                         |
| Magic Unlock           | Mana crystal -\> rune table or mana furnace -\> one utility spell and one combat spell.                                                                      |
| Combat/Defence Upgrade | Watchtower, guards, basic weapon/armour, and raid outcome difference.                                                                                        |
| Basic Quest Chain      | Village requests resources, player supplies them, builders consume stored resources, watchtower is built, raid occurs.                                       |
| Basic Research         | One simple research or discovery step for mana furnace/rune table or automation component.                                                                   |

## 23.1 POC Level Rewards

| **POC Level Milestone** | **Example Reward**                                                                    |
|-------------------------|---------------------------------------------------------------------------------------|
| Level 1                 | No bonus; starting level.                                                             |
| Level 2                 | One perk point or small health/stamina increase after first tool/gathering milestone. |
| Level 3                 | Basic crafting or gathering efficiency perk after first village delivery.             |
| Level 4                 | Automation or engineering perk after first machine produces output.                   |
| Level 5                 | Magic capacity or spell loadout perk after mana/rune unlock.                          |
| Level 6                 | Combat/defence perk after surviving or resolving the raid.                            |

## 23.2 POC Skills

| **Skill**              | **POC Use**                                                             |
|------------------------|-------------------------------------------------------------------------|
| Mining                 | Mine stone, copper/iron, and mana crystal ore.                          |
| Woodcutting            | Chop logs for planks and village projects.                              |
| Crafting               | Craft tools, furnace, machine part, rune table/mana furnace.            |
| Combat                 | Fight goblins or night monsters.                                        |
| Magic                  | Use one utility spell and one combat spell.                             |
| Engineering/Automation | Build and connect automated miner/furnace/storage to village warehouse. |
| Diplomacy/Reputation   | Deliver resources, speak to village elder/mage/builder, improve trust.  |

# 24. Example Progression Paths

| **Path**              | **Early Focus**                                       | **Mid/Late Progression**                                                                           |
|-----------------------|-------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| Survivor Builder      | Shelter, food, tools, storage, safe base.             | Player settlement, decoration, modular building, blueprint projects, cosy village support.         |
| Village Helper        | Find village, deliver food/wood/stone, repair, trade. | Reputation, specialists, village stages, race stories, followers, town/city upgrades.              |
| Automation Engineer   | Copper/iron, machines, power, storage.                | Factories, village warehouse links, engineering perks, golems, portal logistics.                   |
| Mage Explorer         | Ruins, mana crystals, spellbook, rune table.          | Magic schools, rituals, wards, dimensions, archmage infrastructure.                                |
| Adventurer Defender   | Weapons, armour, caves, combat, village raid defence. | Bosses, dungeons, faction wars, dimension guardians, heroic reputation.                            |
| Trader/Diplomat       | Markets, requests, trade goods, NPC relations.        | Trade routes, faction alliances, economic influence, settlement prosperity.                        |
| Conqueror/Tyrant      | Weapons, followers, intimidation, raids.              | Tribute, forced labour, fear reputation, dark allies, rebellion and faction wars.                  |
| Peaceful World-Shaper | Farming, building, village help, reduced threats.     | Civilisation growth, restoration, trade, story discovery, dimensions with lowered combat pressure. |

# 25. Balancing Rules

- Progression must support sandbox freedom first. No class, attribute, or linear questline should control the whole game.

- Overall level should feel rewarding but should not replace tools, materials, recipes, research, skills, gear, villages, bosses, or dimensions.

- Skills should reward use. Low skill should not make common actions fail; it should reduce efficiency or access to advanced options.

- Perk trees should support specialisation now and eventual mastery later.

- Old materials should remain useful where possible, especially wood, stone, copper, and iron.

- Magic should support machines, villages, exploration, defence, and dimensions, but bulk production should still favour machines.

- Villages should unlock recipes, services, story, followers, and civilisation progression without forcing every player into village babysitting.

- Death should not erase progression by default. Consequences should come through recoverable tombstones and world-state changes.

- Multiplayer progression should be configurable, with individual reputation strongly supported.

- The POC should prove the connected progression loop in stages, not the whole final system.

# 26. Open Questions for Later Documents

- What are the exact level-up rewards for the first 20 levels?

- What is the full skill list for version 1.0 and which skills are POC-only?

- How many perk points are gained per level and per skill milestone?

- What are the exact perk trees and perk prerequisites?

- How many tool tiers are required before mythic metals and dimension materials?

- What exact materials appear in the POC: copper, bronze, iron, steel, mana crystal, and which are placeholders?

- How should item rarity interact with quality, durability, enchantments, and cultural variants?

- What is the exact mana system: regeneration, crystals, conduits, focus items, school-specific costs?

- What are the first two POC spells and their recipes/costs?

- What is the exact first automation chain and power source implementation?

- Which village reputation ranks exist and what exact unlocks occur at each rank?

- What are the first player settlement founding requirements?

- Which bosses gate dimensions, and which are optional reward bosses?

- How does world/server progression sharing work in multiplayer?

# Appendix A. POC Progression Checklist

| **ID**      | **Checklist Item**                                                                                    | **Status**   |
|-------------|-------------------------------------------------------------------------------------------------------|--------------|
| POC-PRG-001 | Player starts at Level 1 with no class/background/attributes.                                         | POC Required |
| POC-PRG-002 | Player can gain XP from gathering, crafting, village delivery, combat, automation, and magic.         | POC Required |
| POC-PRG-003 | Simple level-up event grants visible reward.                                                          | POC Required |
| POC-PRG-004 | Basic skills track use for mining, woodcutting, crafting, combat, magic, engineering, and reputation. | POC Required |
| POC-PRG-005 | Craft first tools as first clear milestone.                                                           | POC Required |
| POC-PRG-006 | Tool progression supports wood/stone into copper/iron.                                                | POC Required |
| POC-PRG-007 | Player delivers resources to village warehouse and gains reputation/XP.                               | POC Required |
| POC-PRG-008 | Village consumes stored resources for watchtower or warehouse project.                                | POC Required |
| POC-PRG-009 | Manual furnace can become automated miner/furnace/storage chain.                                      | POC Required |
| POC-PRG-010 | Automation can supply village warehouse.                                                              | POC Required |
| POC-PRG-011 | Mana crystal unlocks rune table or mana furnace.                                                      | POC Required |
| POC-PRG-012 | One utility spell and one combat spell exist.                                                         | POC Required |
| POC-PRG-013 | Raid or threat outcome changes based on preparation/watchtower.                                       | POC Required |
| POC-PRG-014 | Death uses tombstone/no progression loss by default.                                                  | POC Required |
| POC-PRG-015 | Basic research/discovery unlock exists for magic or automation.                                       | POC Required |

# Appendix B. Progression System Summary Matrix

| **System**    | **Final Game Direction**                                         | **POC Direction**                                                           |
|---------------|------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Overall Level | No cap, broad rewards, all playstyles earn XP.                   | Simple level display and level-up reward.                                   |
| Skills        | Many use-based skills with perks and efficiency.                 | Small subset tracked with simple XP.                                        |
| Perks         | Large trees across all major pillars.                            | Tiny placeholder tree or simple perk point reward.                          |
| Attributes    | No classic attributes/classes/backgrounds.                       | None.                                                                       |
| Tools         | Large material ladder with magic compatibility.                  | First tools, stone/copper/iron path.                                        |
| Equipment     | Rarity system and later enchantments/quality.                    | Basic sword/tool/armour, rarity optional placeholder.                       |
| Needs         | Health, stamina, mana, food, temperature, configurable.          | Health, stamina, mana, hunger/food only if needed.                          |
| Research      | Light optional system, deeper for magic/automation.              | One simple unlock/research step.                                            |
| Magic         | Many schools, hybrid casting, utility/infrastructure focus.      | Mana crystal, rune table/mana furnace, one utility spell, one combat spell. |
| Automation    | Medium-depth factory systems, engineering perks, village supply. | Manual furnace -\> automated chain -\> village warehouse.                   |
| Reputation    | Individual, village, faction reputation with many unlocks.       | Basic village trust from deliveries.                                        |
| Settlement    | Camp to capital, leadership perks, laws, NPC jobs.               | Not full settlement; use existing village project only.                     |
| Combat        | Major pillar, optional on peaceful, bosses/raids/defence.        | Goblin raid or night threat and basic defence upgrade.                      |
| Dimensions    | Major gates, optional realms, pocket realm teasers.              | No major dimension; optional ruin teaser only.                              |
| Death         | Tombstone, no default progression loss.                          | Simple tombstone/no progression loss.                                       |
| Multiplayer   | World-setting progression sharing, individual + group rep.       | Not required for POC.                                                       |

End of Document 02 - Player Progression System v0.1
