**Fantasy Voxel Civilisation Sandbox**

**10 - Creatures and Monsters**

**Version 0.1 - Detailed Design Bible Draft**

A database-ready creature system for passive wildlife, livestock, ambient life, hostile mobs, raid factions, dungeon enemies, magical beings, undead, corruption, bosses, drops, spawning, AI, village interaction, magic, automation, taming, and proof-of-concept threat loops.

| **Field**         | **Locked Direction**                                                                                                                                                                                                                                                                                                 |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope    | Full design-bible document covering passive wildlife, ambient creatures, livestock, tameable creatures, neutral animals, hostile monsters, intelligent factions, raids, dungeon creatures, magical beings, undead, corruption, bosses, drops, AI, spawning, villages, magic, automation, data fields, and POC scope. |
| Core Philosophy   | Creatures are living world systems, not only things to fight. They affect survival, villages, magic, automation, exploration, economy, story, and world-state consequences.                                                                                                                                          |
| POC Direction     | Prove one small but functional creature set: fantasy passive wildlife, livestock, night monster, cave spider and crystal crawler cave pressure, goblin raider faction, goblin raid captain mini-boss, and an early wisp/magical creature tied to mana discovery and wards.                                           |
| Data Direction    | Use database/spreadsheet-ready IDs, categories, families, tags, threat tiers, spawn rules, AI profiles, drops, village interactions, magic links, automation links, variants, and planning status.                                                                                                                   |
| Balance Direction | Every gameplay creature needs a readable role, counterplay, system connection, and clear reward or consequence. Ambient creatures can exist for atmosphere but should still support clues, ecology, or small resources where practical.                                                                              |

# Document Purpose

This document defines how creatures and monsters work across the Fantasy Voxel Civilisation Sandbox. It explains what counts as a creature, how creatures are categorised, how they spawn, how they behave, how they interact with villages and player bases, how they feed drops and resources, how raids and bosses work, and how the proof-of-concept should prove that threats, wildlife, magic, automation, and village defence are connected.

This document does not replace the future Combat, Gear, and Defence document, Biomes and World Generation document, Races/Cultures/Factions document, Structures and Landmarks document, Dimensions document, Economy document, Farming/Livestock document, or technical AI implementation plan. Instead, it creates the creature-facing rules those later documents must support.

# Design Source

| **Source Document**               | **Relevant Direction**                                                                                                                                                      | **How This Creature Document Uses It**                                                                                                                             |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible     | Core hook: magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                                                               | Creatures must support the living world promise: they create danger, resources, quests, boss gates, faction pressure, village consequences, and magical discovery. |
| 01 - Core Gameplay Loop           | Primary loop: explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand. POC loop ends with threat outcome changed by preparation. | Creatures provide exploration risk, gathering/hunting resources, combat pressure, defence goals, and the POC goblin raid outcome.                                  |
| 02 - Player Progression System    | Progression is hybrid across materials, skills, recipes, magic, automation, villages, reputation, bosses, and dimensions.                                                   | Creature families feed combat XP, hunting, taming, drops, boss gates, reputation, magic resources, and dimensional unlocks.                                        |
| 03 - Blocks Registry              | Blocks include defence, hazards, magic infrastructure, villages, damaged states, storage, and physical world-state evidence.                                                | Creatures can damage doors, crops, livestock pens, wards, machines, warehouses, and structures depending on type and difficulty.                                   |
| 04 - Items Registry               | Items include monster drops, loot, trophies, magic components, trade goods, quest items, and knowledge items.                                                               | Creature drops become inventory-facing resources with quality, harvesting tools, trade value, alchemy use, and trophy roles.                                       |
| 05 - Crafting and Recipe Registry | Recipes include alchemy, rune crafting, forbidden crafting, village projects, boss keys, and exact resource consumption.                                                    | Creature drops feed recipes such as silk belts, venom catalysts, wisp cores, bone wards, trophies, boss keys, and forbidden components.                            |
| 06 - Resource Progression         | Monster drops support alchemy, magic, gear, trophies, rituals, and faction resources.                                                                                       | Creature resources are defined as a major resource family, not random loot filler.                                                                                 |
| 07 - NPC Village System           | Villages have jobs, needs, warehouses, defences, raids, memories, death, migration, and consequences.                                                                       | Creatures attack, steal, hunt livestock, create quests, trigger raids, affect morale, and become remembered world events.                                          |
| 08 - Automation System            | Automation feeds village warehouses and can be targeted by raiders, sabotage, corruption, or instability.                                                                   | Some creatures damage machines, target supply lines, are attracted by noise/mana leakage, or provide automation materials.                                         |
| 09 - Magic System                 | Magic includes wards, spirit events, corruption, forbidden magic, magical monsters, NPC casters, and damageable infrastructure.                                             | Creature design includes ward categories, spirits, undead, fae, elementals, void threats, forbidden creature use, and magical AI.                                  |

# Static Table of Contents

- 1\. Locked Creature System Identity

- 2\. Player Answer Decision Summary

- 3\. Creature System Architecture

- 4\. Parent Creature Data Model

- 5\. Creature Categories, Families, and Tags

- 6\. Spawning, Ecology, Nests, and World Pressure

- 7\. Passive Wildlife, Livestock, and Ecology

- 8\. Hostile Overworld Monsters and Combat Roles

- 9\. Goblins, Raiders, and Faction Enemies

- 10\. Undead, Corruption, and Forbidden Creatures

- 11\. Magical, Elemental, Fae, Spirit, and Void Creatures

- 12\. Dungeon, Structure, and Nest Creatures

- 13\. Bosses and Major Threats

- 14\. Drops, Harvesting, and Creature Resources

- 15\. Creature AI, Senses, Morale, and Terrain Use

- 16\. Villages, NPCs, Raids, and Defences

- 17\. Magic, Automation, Wards, and Creature Interaction

- 18\. Taming, Pets, Mounts, Work Beasts, and Companions

- 19\. Visual, Audio, Variants, and Readability

- 20\. UI, Codex, Discovery, and Feedback

- 21\. Proof-of-Concept Creature Scope

- 22\. Detailed Creature Registry v0.1

- 23\. Core POC Scenario: Forest Hamlet Creature and Raid Loop

- 24\. Balancing Rules

- 25\. Open Questions for Later Documents

- Appendix A. POC Creature Checklist

- Appendix B. Creature Database Field Template

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Creature Family Backlog

- Appendix E. POC Success Criteria

# 1. Locked Creature System Identity

The Creature System is the living danger and ecology layer of the game. It includes animals, livestock, ambient life, tameable beasts, hostile monsters, intelligent raiders, dungeon creatures, magical beings, undead, spirits, elementals, corruption creatures, void threats, bosses, titans, and constructed beings such as golems. It must support the fantasy of a world that reacts to player activity, village growth, magic, automation, corruption, and exploration.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Rule</strong></p>
<p>Creatures should never exist only as moving decorations or generic health bars. Every gameplay creature should answer at least one design question: what does it hunt, flee from, steal, defend, drop, teach, warn about, unlock, corrupt, protect, threaten, or change in the world?</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**      | **Design Meaning**                                                                                                                                   | **Player-Facing Result**                                                                                    |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Living Ecology          | Wildlife, predators, livestock, ambient life, migration, and biome-specific behaviours create a world that feels alive.                              | The player learns biomes through tracks, sounds, nests, herds, danger, and useful resources.                |
| Threat and Defence      | Hostile creatures, raids, night monsters, dungeon enemies, and bosses create danger for players, villages, roads, farms, and machines.               | Preparation matters: lighting, walls, guards, towers, wards, traps, gear, and supply lines change outcomes. |
| Resource Layer          | Creatures provide meat, hide, bone, venom, silk, chitin, essences, cores, trophies, faction loot, and magical reagents.                              | Hunting and combat feed crafting, alchemy, automation, trade, quests, rituals, and progression.             |
| Civilisation Pressure   | Intelligent enemies can raid, steal, sabotage, scale with wealth, remember defeats, and become diplomacy or conquest targets.                        | Villages feel vulnerable, defended, remembered, or transformed by creature events.                          |
| Magic and World State   | Wisps, spirits, elementals, undead, fae, demons, void creatures, corruption monsters, and bosses connect to schools, wards, rituals, and dimensions. | Magic becomes visible in the ecosystem, not only the spellbook.                                             |
| Progression and Story   | Bosses, rare variants, nests, faction enemies, and creature research can unlock recipes, areas, dimensions, reputation, and lore.                    | Creature encounters create long-term goals and meaningful rewards.                                          |
| Data-Driven Scalability | Creature families inherit shared rules, AI profiles, drops, variants, spawn rules, and system tags.                                                  | The registry can grow without hand-designing every creature from scratch.                                   |

## 1.1 Creature Design Promise

A player should be able to identify a creature by silhouette, sound, movement, habitat, and behaviour. A goblin raider should feel different from a cave spider, a crystal crawler, a wisp, an undead worker, a fae trickster, or a void horror. The player should gradually learn what each creature means for nearby resources, villages, danger, magic, and automation.

## 1.2 What Creatures Are Not

- Creatures are not only random combat targets.

- Hostile monsters should not exist only to interrupt building without purpose or counterplay.

- Wildlife should not be only cosmetic if it can reasonably support hunting, ecology, farming, clues, or village needs.

- Bosses should not be only large health bars; they should have mechanics, context, consequences, and rewards.

- The POC does not need a full ecosystem, full taming, all boss families, or every magical creature type.

# 2. Player Answer Decision Summary

The following table converts the selected multiple-choice answers into locked creature-system decisions. The user selected the recommended answers for all questions, so the document uses a coherent deep-but-readable creature model with a small functional POC target.

| **Q** | **Area**                      | **Locked Decision**                                                                                                                                                                                                                       |
|-------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1     | Document scope                | Full creature system document covering passive wildlife, neutral creatures, hostile mobs, raid enemies, dungeon creatures, magical beings, bosses, drops, spawning, AI, and POC scope.                                                    |
| 2     | Creature identity             | Creatures are living world systems affecting survival, villages, magic, automation, exploration, economy, and story.                                                                                                                      |
| 3     | Final depth                   | Deep but readable: ecology, factions, raids, drops, village interaction, biome roles, and magic links.                                                                                                                                    |
| 4     | POC depth                     | Small but functional: passive animal, night monster, cave creature, goblin raider, and mini-boss/raid leader, with magic creature support.                                                                                                |
| 5     | Registry categories           | Use categories for passive, ambient, livestock, tameable, neutral, hostile, faction, raid, dungeon, magical, undead, boss, and dimensional creatures.                                                                                     |
| 6     | Full categories               | Include passive wildlife, livestock, neutral wildlife, hostile monsters, raid enemies, dungeon creatures, magical creatures, undead, elementals, fae/dream/spirit beings, infernal beings, void/corruption creatures, bosses, and titans. |
| 7     | Ambient creatures             | Ambient creatures exist for atmosphere and can provide minor resources or clues.                                                                                                                                                          |
| 8     | Livestock                     | Livestock has separate breeding, feeding, production, ownership, village economy, and farm roles.                                                                                                                                         |
| 9     | Faction enemies               | Some monsters are intelligent factions: goblins, bandits, undead cults, orc clans, demon cults, corrupted villages, and similar enemies.                                                                                                  |
| 10    | Boss registry                 | Bosses have separate entries with phases, arenas, drops, world effects, story hooks, faction links, and planning status.                                                                                                                  |
| 11    | POC set                       | POC includes passive animal, livestock animal, night monster, cave creature, goblin raider, goblin brute/leader, and wisp/magic creature.                                                                                                 |
| 12    | POC main threat               | The primary POC hostile threat is a goblin raid.                                                                                                                                                                                          |
| 13    | POC cave threat               | Use a mix of cave spider and crystal crawler for early cave pressure.                                                                                                                                                                     |
| 14    | POC magical creature          | Use an early wisp as the POC magical creature.                                                                                                                                                                                            |
| 15    | POC passive animal            | Use an original fantasy animal rather than a direct real-world equivalent.                                                                                                                                                                |
| 16    | POC mini-boss                 | Use a goblin raid captain as the POC mini-boss.                                                                                                                                                                                           |
| 17    | POC count                     | Target 7 creature types before expansion, with an 8th magical/variant entry if production allows.                                                                                                                                         |
| 18    | Spawning                      | Spawning uses biome, time, light, nearby structures, village safety, faction camps, corruption, weather, and world events.                                                                                                                |
| 19    | Lighting safety               | Torches reduce basic threats while wards reduce magical and corruption threats.                                                                                                                                                           |
| 20    | Nests and camps               | Nests and camps act as local spawn sources, raid sources, loot sites, and faction pressure points.                                                                                                                                        |
| 21    | Migration                     | Use some migration for herds, monsters, raids, seasonal creatures, and world events.                                                                                                                                                      |
| 22    | Village spawn safety          | Village lights, guards, walls, towers, patrols, wards, and cleanliness affect local danger.                                                                                                                                               |
| 23    | Player base attacks           | Hostile creatures can attack player bases through difficulty settings, wealth/threat scaling, and player activity triggers.                                                                                                               |
| 24    | Difficulty scaling            | Difficulty can affect spawn rate, aggression, raid size, village damage, NPC death, boss mechanics, and corruption spread.                                                                                                                |
| 25    | Passive wildlife role         | Wildlife supports food, hide, alchemy parts, ecology clues, village hunting, taming, and biome identity.                                                                                                                                  |
| 26    | Animal behaviour              | Animals can flee using stealth, bait, domestication, traps, and hunting skill hooks later.                                                                                                                                                |
| 27    | Village hunting               | Hunters can gather meat/hide and affect village food supply.                                                                                                                                                                              |
| 28    | Livestock ownership           | Livestock ownership matters; killing or stealing owned livestock can be theft/crime.                                                                                                                                                      |
| 29    | Fantasy livestock             | Use a mix of familiar and fantasy livestock.                                                                                                                                                                                              |
| 30    | Animal products               | Animal products feed food, leather, fat/oil, bone meal, wool/fibre, eggs, fantasy milk-like resources, fertiliser, and alchemy.                                                                                                           |
| 31    | Night monsters                | Use original fantasy threats with readable roles plus some familiar archetypes.                                                                                                                                                           |
| 32    | Village damage                | Monsters can attack villagers, doors, crops, livestock, lights, and weak structures depending on type.                                                                                                                                    |
| 33    | Block interaction             | Different creatures can climb, dig, burn, corrupt, phase, avoid light, target wards, or damage machines.                                                                                                                                  |
| 34    | Automation targeting          | Some intelligent or magical enemies can sabotage machines, belts, conduits, and warehouses.                                                                                                                                               |
| 35    | Combat roles                  | Use clear roles: swarm, brute, ranged, support, siege, scout, assassin, summoner, disabler, and boss.                                                                                                                                     |
| 36    | Retreat behaviour             | Some intelligent, wounded, or outnumbered enemies retreat, regroup, or call reinforcements.                                                                                                                                               |
| 37    | Goblins                       | Goblins are an intelligent scavenger/raider faction with camps, raids, scrap loot, traps, and escalation.                                                                                                                                 |
| 38    | Goblin gear                   | Goblin gear quality varies across poor, crude, standard, scavenged, and improved gear.                                                                                                                                                    |
| 39    | Goblin theft                  | Goblins can steal from exposed storage, crops, livestock, roads, and caravans if undefended.                                                                                                                                              |
| 40    | Raid scaling                  | Goblin raids scale with wealth, food stock, exposed routes, previous defeats, nearby camps, difficulty, and faction hostility.                                                                                                            |
| 41    | Siege units                   | Raid enemies can include crude early siege units and later trolls, war beasts, sappers, and magic siege.                                                                                                                                  |
| 42    | Bandits                       | Bandits exist as a separate human/other-race outlaw faction focused on trade routes and theft.                                                                                                                                            |
| 43    | Diplomacy                     | Some intelligent factions can be bribed, intimidated, traded with, allied with, conquered, or turned against rivals.                                                                                                                      |
| 44    | Undead                        | Undead are a major family linked to burial sites, necromancy, haunted ruins, village fear, forbidden magic, spirits, and bosses.                                                                                                          |
| 45    | Corruption creatures          | Corruption creatures are a spreading hazard tied to forbidden magic, void breaches, corrupted land, wards, and village disasters.                                                                                                         |
| 46    | Magic attraction              | Necromancy, blood magic, void magic, corruption, sacrifice, and overload can attract or create threats.                                                                                                                                   |
| 47    | Village reaction              | Villages react to forbidden creatures through fear, laws, exile, guards, faction reports, rebellion, cult interest, or dark path unlocks.                                                                                                 |
| 48    | Necromantic labour            | Necromantic workers are possible later as forbidden labour with strong village/faction/morality consequences.                                                                                                                             |
| 49    | Magical creatures             | Magical creatures are core to magic resources, biomes, rituals, wards, bosses, and dimensions.                                                                                                                                            |
| 50    | Elementals                    | Elementals connect to biomes, magic schools, materials, weather, machines, and elemental resources.                                                                                                                                       |
| 51    | Wisps                         | Wisps have neutral and hostile variants that teach mana, ruins, wards, and magical drops.                                                                                                                                                 |
| 52    | Fae                           | Fae creatures are helpful, mischievous, dangerous, bargain-based, and nature/dream connected.                                                                                                                                             |
| 53    | Spirits                       | Spirits connect to shrines, graveyards, morale, rituals, lost NPCs, blessings, and hauntings.                                                                                                                                             |
| 54    | Void creatures                | Void creatures are late-game dimensional threats tied to portals, Voidstone, corruption, storage, events, and bosses.                                                                                                                     |
| 55    | Structure enemies             | Ruins, mines, towers, camps, shrines, crypts, caves, and dimensions each have creature pools and mini-bosses.                                                                                                                             |
| 56    | Cave depth                    | Caves differ by shallow caves, deepstone caves, crystal caves, lava caves, ancient ruins, and dimensional cracks.                                                                                                                         |
| 57    | Spawner equivalents           | Use physical nests, cursed anchors, ritual remains, egg sacs, camps, graves, and corruption nodes instead of abstract spawners only.                                                                                                      |
| 58    | Clearing nests                | Clearing a nest reduces local danger until faction/event respawn, with visible world-state effects.                                                                                                                                       |
| 59    | Progression guards            | Dungeon creatures guard key recipes, magic books, relics, boss drops, dimension clues, and rare resources.                                                                                                                                |
| 60    | Boss meaning                  | Bosses are major world, faction, biome, magic, dimension, or story threats with unique mechanics and consequences.                                                                                                                        |
| 61    | Boss progression              | Bosses unlock some dimensions, high magic, rare materials, faction arcs, and world outcomes, while alternate paths may exist.                                                                                                             |
| 62    | Boss phases                   | Mini-bosses can have simple phase changes; major bosses have phases, arena changes, summons, and world effects.                                                                                                                           |
| 63    | Boss village effects          | Bosses can threaten regions, cause raids, corrupt land, block trade, empower monsters, or unlock rebuilding projects.                                                                                                                     |
| 64    | Trophies                      | Boss trophies can be decoration, reputation proof, crafting input, morale boost, relic core, or faction symbol.                                                                                                                           |
| 65    | World bosses                  | Late-game world bosses exist as region-scale threats tied to dimensions, ancient ruins, and civilisation projects.                                                                                                                        |
| 66    | Drop importance               | Monster drops are important resources for alchemy, magic, gear, trophies, rituals, faction resources, trade, and quests.                                                                                                                  |
| 67    | Drop consistency              | Most gameplay creatures have drops, while ambient creatures may only provide clues or tiny resources.                                                                                                                                     |
| 68    | Drop quality                  | Hide, meat, essence, cores, trophies, venom, bones, and gear can vary by quality, damage type, tool, or processing.                                                                                                                       |
| 69    | Harvest tools                 | Correct tools, skills, magic, and processing stations improve yield and quality.                                                                                                                                                          |
| 70    | Monster farming               | Creature farms, nests, or golem traps are limited by ethics, danger, balance, village reaction, and corruption risk.                                                                                                                      |
| 71    | Boss drops                    | Core relic drops are unique, while secondary resources can be repeatable through rematches, events, or settings.                                                                                                                          |
| 72    | AI depth                      | Use role-based AI: flee, hunt, stalk, guard, raid, steal, defend nest, call help, avoid hazards, and target weak points.                                                                                                                  |
| 73    | Senses                        | Creatures can use sight, sound, smell, and magic sense depending on type, with stealth and bait hooks.                                                                                                                                    |
| 74    | Terrain use                   | Enemies can climb, dig, fly, swim, burrow, open doors, avoid traps, use cover, or path around walls depending on type.                                                                                                                    |
| 75    | Morale                        | Intelligent enemies and animals can flee, panic, regroup, surrender, or retreat.                                                                                                                                                          |
| 76    | Creature conflicts            | Creatures can fight each other through faction hatred, predator/prey, undead vs living, golems vs monsters, guards vs raiders, and biome conflicts.                                                                                       |
| 77    | Weather/time reaction         | Creatures react to day/night, rain, storms, mana storms, eclipses, seasons, temperature, corruption waves, and rituals.                                                                                                                   |
| 78    | Village interactions          | Creatures can attack, steal, hunt livestock, damage crops, target warehouses, avoid walls, fear guards, corrupt blocks, or trigger quests.                                                                                                |
| 79    | Guard specialisation          | Guards can be trained/equipped for raiders, undead, beasts, magic threats, flying threats, and siege threats.                                                                                                                             |
| 80    | Village preparation           | Watchtowers, walls, gates, patrols, guard gear, food, medicine, traps, wards, lighting, and automation affect raid outcomes.                                                                                                              |
| 81    | Creature quests               | Creatures create hunting, nest-clearing, rescue, escort, road-warding, monster research, corruption cure, and boss arc quests.                                                                                                            |
| 82    | NPC memory                    | NPCs remember raids, rescues, deaths, nests cleared, livestock lost, forbidden creatures used, and boss trophies.                                                                                                                         |
| 83    | Ward types                    | Basic wards affect normal threats; specialised wards affect undead, fae, corruption, void, demons, or spirits.                                                                                                                            |
| 84    | Automation attraction         | Noise, light, wealth, pollution/waste, mana leakage, exposed warehouses, and forbidden machines can attract or alter threats.                                                                                                             |
| 85    | Machine damage                | Intelligent raiders, corruption creatures, elementals, and void creatures can damage or sabotage machines and conduits.                                                                                                                   |
| 86    | Creature automation resources | Monster resources can create silk belts, slime sealant, venom catalysts, wisp cores, beast oil, chitin plates, elemental shards, and void residue.                                                                                        |
| 87    | Golems                        | Golems are a hybrid construct NPC/creature/machine category with ownership, orders, power, maintenance, and moral reactions.                                                                                                              |
| 88    | Taming                        | Taming supports pets, mounts, livestock, familiars, work beasts, and magical companions.                                                                                                                                                  |
| 89    | Mount progression             | Mounts include land mounts, pack beasts, flying mounts later, magical mounts, and culture-specific mounts.                                                                                                                                |
| 90    | Combat pets                   | Combat pets and familiars exist but are limited by balance, care, training, command rules, and world reaction.                                                                                                                            |
| 91    | Village work animals          | Villages use carts, plough beasts, guard beasts, messenger birds, magical beasts, and culture-specific work animals.                                                                                                                      |
| 92    | Visual style                  | Use higher-fidelity voxel creatures with readable silhouettes, strong animations, fantasy detail, and clear threat roles.                                                                                                                 |
| 93    | Variants                      | Creature variants can be biome, faction, rarity, corruption, age, magic affinity, elite, and boss variants.                                                                                                                               |
| 94    | Rare variant mechanics        | Rare variants can have different drops, behaviour, magic affinity, village value, tame chance, or event triggers.                                                                                                                         |
| 95    | Audio readability             | Creature sounds communicate danger, nest location, raid warning, boss phase, magic corruption, and passive wildlife.                                                                                                                      |
| 96    | Database entries              | Every creature has a database-ready entry with ID, category, family, biome, spawn rules, AI type, drops, threat tier, village interactions, magic links, automation links, and planning status.                                           |
| 97    | Inheritance                   | Use BaseCreature -\> Animal/Monster/Faction/Boss/etc. with shared fields and override fields.                                                                                                                                             |
| 98    | Planning status               | Use POC Required, Alpha, Beta, Final Game, Placeholder, Deferred, and Cut status fields.                                                                                                                                                  |
| 99    | Draft balancing               | Include threat tier, health band, damage band, spawn rarity, drop rarity, and POC balance notes as draft values.                                                                                                                          |
| 100   | Initial registry              | Include POC creatures plus first-pass full-game backlog families in registry v0.1.                                                                                                                                                        |

# 3. Creature System Architecture

The creature system should be data-driven from the beginning. The player sees animals, monsters, raiders, nests, bosses, drops, tracks, and village warnings. Internally, the game tracks parent classes, spawn profiles, AI profiles, loot tables, variants, faction state, nest state, village interaction rules, and planning metadata.

| **Layer**                 | **Purpose**                                                                | **Examples**                                                                                              |
|---------------------------|----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| Base Creature Definition  | Parent record for all creature entries.                                    | ID, display name, category, family, size, health band, threat tier, tags, biome rules, AI profile, drops. |
| Creature Family           | Shared behaviour and theming across related creatures.                     | Goblin, Cave Arachnid, Wisp, Undead, Elemental, Fae, Void, Livestock.                                     |
| Spawn Profile             | Rules for where and when the creature appears.                             | Biome, light, time, structure, nest, weather, corruption, village safety, difficulty.                     |
| AI Profile                | Behaviour package used by the runtime creature.                            | Flee, herd, hunt, stalk, raid, steal, guard, ranged support, boss phase, nest defence.                    |
| Drop Table                | Defines rewards, harvesting, quality, and conditions.                      | Meat, hide, chitin, silk, venom, essence, core, gear, trophy, by-products.                                |
| Variant Layer             | Optional biome, rarity, age, corruption, elite, magic, or faction variant. | Crystal Crawler - pure/impure; Goblin Raider - crude/scavenged; Wisp - calm/corrupted.                    |
| Village Interaction Layer | Rules for how creatures affect NPCs and settlements.                       | Steals food, attacks livestock, targets warehouse, avoids wards, causes quest, remembers defeat.          |
| Magic/Automation Links    | Connections to wards, mana, corruption, machines, golems, and resources.   | Ward type, mana attraction, conduit sabotage, creature resource used in automation.                       |
| Runtime State             | Save-file state for individual creatures or nests.                         | Health, target, alertness, morale, home nest, owner, hunger, corruption, phase, carried loot.             |
| Planning Metadata         | Documentation-only readiness fields.                                       | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred, Cut, balance draft.                         |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Important Data Rule</strong></p>
<p>Planning status, balance-draft notes, POC flags, and implementation readiness should remain documentation metadata. Shipped creature data should stay clean, moddable, and reusable.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 4. Parent Creature Data Model

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                                                                | **Example Children**                                 |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| BaseCreature                  | Core identity, internal ID, display name, category, family, tags, size, collision, health band, threat tier, AI profile, spawn profile, drops, sounds. | All creatures.                                       |
| AmbientCreature               | Small ambience, low interaction, clue/resource hooks, sound markers, swarm/group behaviour.                                                            | Glowmotes, lantern gnats, script moths, cave sparks. |
| AnimalCreature                | Flee/hunt/herd behaviours, harvesting rules, predator/prey relationships, taming hooks, biome identity.                                                | Mossback Grazer, Tuskroot Boar, Windstrider Elk.     |
| LivestockCreature             | Ownership, feeding, breeding, production, pens, theft rules, village economy, farm jobs.                                                               | Ambercluck, Stonewool Grazer, Hearthgoat.            |
| TameableCreature              | Trust, bonding, care, commands, owner, companion slot, mount/work role, village reaction.                                                              | Pack beetle, guard hound, familiar, mount.           |
| MonsterCreature               | Hostility, aggro, damage, threat role, counterplay, drops, spawn pressure, difficulty hooks.                                                           | Night stalker, cave spider, crystal crawler.         |
| FactionCreature               | Intelligent group, camp/nest, equipment quality, morale, theft, diplomacy, faction reputation.                                                         | Goblin raider, bandit thief, cultist.                |
| RaidCreature                  | Raid objective, target priorities, scaling, retreat, group coordination, loot targets, village damage rules.                                           | Goblin raider, goblin sapper, siege brute.           |
| DungeonCreature               | Structure pool, room role, nest/spawn anchor, guarding behaviour, progression loot hooks.                                                              | Crypt warden, mine crawler, tower homunculus.        |
| MagicalCreature               | Mana affinity, ward interaction, essence drops, spell effects, purity/corruption, school tags.                                                         | Wisp, elemental, mana sprite.                        |
| UndeadCreature                | Necromancy link, spirit/bone drops, holy/divine ward weakness, grave/nest source, fear hooks.                                                          | Restless dead, skeletal archer, crypt revenant.      |
| CorruptionCreature            | Spreading land effects, corruption nodes, block infection, cleansing hooks, hazard aura.                                                               | Blight crawler, corrupted elk, void-touched grub.    |
| BossCreature                  | Phase logic, arena, unique mechanics, world effects, boss drops, trophy, progression gates.                                                            | Goblin Raid Captain, Spider Queen, Void Titan.       |
| ConstructCreature             | Ownership, command profile, power/maintenance, job role, legal/moral reactions.                                                                        | Hauling golem, guard golem, necromantic worker.      |

## 4.1 Example Inheritance Chains

| **Example**         | **Inheritance Chain**                                                                     | **What It Gains Automatically**                                                                             |
|---------------------|-------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Mossback Grazer     | BaseCreature -\> AnimalCreature -\> PassiveWildlife -\> ForestGrazerFamily                | Flee behaviour, herd grouping, hide/meat harvesting, forest biome spawn, bait hooks, village hunter target. |
| Ambercluck          | BaseCreature -\> LivestockCreature -\> BirdLivestockFamily                                | Ownership, feeding, egg/resource production, pen rules, village theft/crime hooks.                          |
| Goblin Raider       | BaseCreature -\> FactionCreature -\> RaidCreature -\> GoblinFamily                        | Camp spawn, theft objectives, equipment quality, morale, retreat, faction hostility, warehouse targeting.   |
| Forest Wisp         | BaseCreature -\> MagicalCreature -\> WispFamily                                           | Mana affinity, glow/sound cues, ward interaction, essence drop, neutral/hostile variants.                   |
| Goblin Raid Captain | BaseCreature -\> FactionCreature -\> RaidCreature -\> BossCreature -\> GoblinLeaderFamily | Command aura, raid phase change, trophy drop, camp escalation, village memory event.                        |

# 5. Creature Categories, Families, and Tags

| **Top-Level Category** | **Purpose**                                                                             | **Examples**                                     |
|------------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------|
| Ambient                | Tiny or low-interaction creatures that build atmosphere and provide clues.              | Glowmotes, cave sparks, script moths.            |
| Passive Wildlife       | Wild animals that usually flee and support hunting, ecology, and taming.                | Mossback Grazer, Barkhare, Windstrider Elk.      |
| Livestock              | Farmable, owned animals connected to villages and player settlements.                   | Ambercluck, Stonewool Grazer, milk-sap beast.    |
| Neutral Wildlife       | Animals that ignore the player unless threatened, hungry, or protecting territory.      | Tuskroot Boar, thornback lynx.                   |
| Hostile Monsters       | Basic non-faction threats for night, caves, wilderness, and dangerous biomes.           | Duskhollow Stalker, cave spider, swamp leech.    |
| Faction Enemies        | Intelligent groups with camps, gear, diplomacy, theft, and escalation.                  | Goblins, bandits, cultists, hostile clans.       |
| Raid Enemies           | Creatures with village/player-base objectives and scaled group behaviour.               | Goblin raider, sapper, brute, captain.           |
| Dungeon Creatures      | Structure-specific enemies tied to ruins, caves, towers, crypts, and mines.             | Crypt warden, crystal crawler, tower homunculus. |
| Magical Creatures      | Mana-linked beings with magic resources, ward rules, and school tags.                   | Wisps, mana sprites, arcane slimes.              |
| Undead                 | Death and necromancy-linked creatures with hauntings, fear, and forbidden magic ties.   | Restless dead, skeletal worker, revenant.        |
| Elementals             | Element-linked creatures tied to terrain, weather, materials, and magic schools.        | Pyreling, frostbound, storm wisp, stoneheart.    |
| Fae / Dream / Spirit   | Bargain, shrine, dream, omen, ancestor, and morale-linked beings.                       | Fae trickling, dream moth, ancestral guardian.   |
| Infernal / Demon       | Dangerous late-game or dimension-linked beings tied to fire, contracts, and corruption. | Ash imp, forge fiend, infernal hound.            |
| Void / Corruption      | Unstable dimensional threats that corrupt land, storage, portals, and magic.            | Void leech, rift lurker, blight crawler.         |
| Boss / Titan           | Major threats with phases, arenas, world effects, trophies, and progression links.      | Goblin Raid Captain, Spider Queen, Void Titan.   |
| Construct / Golem      | Hybrid creature/NPC/machine entities with owner, job, power, and repair rules.          | Hauling golem, ward golem, necromantic worker.   |

| **Tag Type** | **Example Tags**                                                                                              | **Used By**                                  |
|--------------|---------------------------------------------------------------------------------------------------------------|----------------------------------------------|
| Behaviour    | flee, herd, stalk, ambush, raid, steal, guard, support, siege, summon, burrow, fly, swim                      | AI selection, tutorial, threat readability.  |
| Spawn        | forest, cave, crystal-cave, ruin, camp, night, storm, corruption, village-edge, nest-source                   | World generation, spawning, ecology.         |
| Village      | attacks-villagers, steals-food, targets-warehouse, hunts-livestock, damages-crops, fears-guards, avoids-walls | NPC simulation, raids, quest generation.     |
| Magic        | mana, wisp, elemental-fire, undead, spirit, fae, void, corrupted, ward-sensitive, forbidden                   | Wards, magic drops, schools, faction laws.   |
| Automation   | machine-saboteur, noise-attracted, mana-leak-attracted, drops-belt-material, drops-catalyst                   | Machine defence, production resources.       |
| Drops        | meat, hide, bone, venom, silk, chitin, essence, core, trophy, gear, scrap, residue                            | Loot tables, crafting, economy, alchemy.     |
| Risk         | poisonous, cursed, corrupting, explosive, burning, freezing, fear, siege, burrower, flying                    | Warnings, difficulty, combat, world effects. |
| Planning     | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred, Cut                                             | Production scope tracking.                   |

# 6. Spawning, Ecology, Nests, and World Pressure

Spawning should be readable and connected to the world. Basic spawns use biome, time, light, weather, structure, difficulty, and nearby safety. Deeper systems add nests, camps, migration, corruption nodes, world events, faction memory, and village/player activity.

| **Spawn Driver** | **Design Role**                                                                                                 | **Example**                                                                                        |
|------------------|-----------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| Biome            | Defines creature pools and ambient identity.                                                                    | Forest grazers in forest valleys, crystal crawlers in crystal caves, desert spirits in dunes.      |
| Time and Light   | Controls day/night danger and safe zones.                                                                       | Night monsters increase after dark; torches suppress basic spawns; wards suppress magical threats. |
| Structures       | Creates themed danger around ruins, towers, camps, mines, and shrines.                                          | Goblin camps spawn raiders; crypts spawn undead; broken rune towers spawn wisps.                   |
| Nests and Camps  | Physical sources of local danger, raids, loot, eggs, anchors, or corrupted growth.                              | Clearing a nest reduces local danger and can become a village quest.                               |
| Village Safety   | Village lights, walls, watchtowers, patrols, cleanliness, and wards reduce or redirect spawns.                  | Prepared villages experience smaller raids and fewer random intrusions.                            |
| Player Activity  | Wealth, exposed storage, automation noise, mana leakage, forbidden machines, and pollution can attract threats. | Factories and warehouses need protection without becoming constant punishment.                     |
| World Events     | Weather, mana storms, eclipses, seasonal migrations, corruption waves, and rituals change spawn pressure.       | Players learn to prepare around events and danger cycles.                                          |
| Difficulty       | Scales spawn rates, aggression, village damage, NPC death, boss mechanics, and corruption spread.               | Peaceful/cozy settings keep ecology but reduce destructive threat.                                 |

## 6.1 Nest and Camp Rules

- Nests and camps should be visible physical places rather than invisible spawn points whenever possible.

- Each nest has a creature family, danger radius, loot profile, respawn rule, and world-state effect.

- Clearing a nest reduces local danger temporarily or permanently depending on difficulty, faction pressure, and nearby world events.

- Nests can escalate if ignored: more raids, stronger variants, blocked roads, stolen supplies, or corrupted ground.

- Villages can generate request-board tasks to scout, weaken, clear, ward, or monitor nearby nests.

# 7. Passive Wildlife, Livestock, and Ecology

Passive and neutral creatures are important because they make biomes feel alive and feed the survival, farming, trade, and village supply systems. They should not all be real-world animals. The POC should start with at least one original fantasy passive animal and one livestock-style creature.

| **Group**         | **Role**                                                                                               | **Examples**                                         |
|-------------------|--------------------------------------------------------------------------------------------------------|------------------------------------------------------|
| Passive Wildlife  | Fleeing wild animals with meat, hide, ecology clues, taming potential, and biome identity.             | Mossback Grazer, Barkhare, Glowhorn Fawn.            |
| Neutral Predators | Predators that hunt wildlife and attack if threatened, hungry, or protecting young.                    | Thornback Lynx, Tuskroot Boar, cave bear equivalent. |
| Livestock         | Owned animals that produce food, fibre, eggs, milk-like fantasy resources, fertiliser, or trade goods. | Ambercluck, Stonewool Grazer, Sapmilker.             |
| Work Animals      | Village and player labour creatures for ploughing, hauling, carts, roads, and messenger systems.       | Quarry Beetle, Hearth Ox, courier bird.              |
| Tameable Pets     | Companions that provide alerts, small utility, morale, tracking, or flavour.                           | Lantern ferret, guard pup, familiar moth.            |
| Mounts            | Travel progression through land mounts, pack beasts, magical mounts, and later flying mounts.          | Windstrider, Stonehorn, skywing later.               |

## 7.1 Ownership and Crime

Village-owned livestock should be protected by ownership and crime rules. Killing, stealing, or baiting away livestock can reduce reputation, trigger guards, create fines, and damage food stability. On relaxed settings, these consequences can be softened. Wild hunting remains available, but village hunters and animal populations should react to overhunting in later systems.

# 8. Hostile Overworld Monsters and Combat Roles

| **Combat Role** | **Function**                                                            | **Example**                                |
|-----------------|-------------------------------------------------------------------------|--------------------------------------------|
| Swarm           | Weak in isolation; dangerous in groups; tests area control.             | Cave skitterlings, blight grubs.           |
| Stalker         | Approaches from darkness, tracks sound, punishes careless night travel. | Duskhollow Stalker.                        |
| Brute           | Slow, durable, structure pressure, draws guard attention.               | Goblin Brute, stone troll.                 |
| Ranged          | Harasses from distance, forces cover and shield use.                    | Goblin thrower, skeletal archer.           |
| Support         | Buffs allies, heals, calls reinforcements, weak alone.                  | Goblin drummer, cult chanter.              |
| Siege           | Targets walls, gates, towers, and warehouses.                           | Goblin sapper, war beast, battering brute. |
| Scout/Thief     | Finds exposed resources and retreats with loot.                         | Goblin scout, bandit thief.                |
| Disabler        | Poisons, webs, slows, silences, drains mana, or jams machines.          | Cave spider, void leech.                   |
| Summoner        | Creates minions or anchors; priority target.                            | Necromancer, rift caller.                  |
| Boss            | Unique mechanics, phases, arena rules, and world effects.               | Raid Captain, Spider Queen.                |

Basic night monsters should be original fantasy threats with readable roles, while still borrowing familiar combat archetypes where useful. Early threats must be dangerous enough to justify lighting, shelters, guards, and watchtowers, but not so destructive that villages collapse before the player can understand the systems.

# 9. Goblins, Raiders, and Faction Enemies

Goblins are the first major hostile faction for the POC. They are not mindless mobs. They are scavengers, thieves, opportunists, trap-setters, and raiders who care about food stock, exposed storage, roads, caravans, and village weakness.

| **System**         | **Locked Direction**                                                                                            | **Gameplay Result**                                                                      |
|--------------------|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| Camp Logic         | Goblin camps act as spawn sources, loot sites, raid sources, and local threat anchors.                          | A nearby camp increases raid chance until scouted, weakened, cleared, bribed, or warded. |
| Theft Objective    | Goblins can steal food, tools, livestock, loose resources, and warehouse goods.                                 | Exposed chests or unguarded farms become targets.                                        |
| Gear Quality       | Poor, crude, standard, scavenged, and improved gear affects danger and drops.                                   | A village that repeatedly defeats raids may see better-equipped revenge parties later.   |
| Raid Scaling       | Raids scale with wealth, food stock, exposed routes, previous defeats, nearby camps, difficulty, and hostility. | Automated village supply can require stronger defences.                                  |
| Morale and Retreat | Goblins can flee, regroup, call reinforcements, or surrender depending on morale and leader state.              | Killing or routing the captain can collapse a raid.                                      |
| Diplomacy          | Some intelligent enemies can be bribed, intimidated, traded with, allied with, conquered, or redirected.        | A dark or pragmatic player may pay goblins to raid a rival.                              |

## 9.1 Bandits and Other Raiders

Bandits should exist separately from goblins. They focus more on roads, caravans, extortion, trade routes, and faction politics. Later intelligent factions can include undead cults, demon cults, corrupted villages, hostile clans, and rival civilisations. These groups should use the same faction creature architecture where practical.

# 10. Undead, Corruption, and Forbidden Creatures

| **Family**           | **Design Role**                                                                                         | **Examples / Result**                                              |
|----------------------|---------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Undead               | Burial sites, haunted ruins, necromancy, fear, spirit events, forbidden labour, and bosses.             | Skeletons, restless dead, crypt wardens, revenants, bone colossus. |
| Corruption Creatures | Spreading hazards tied to forbidden magic, void breaches, corrupted land, wards, and village disasters. | Blight crawler, corrupted grazer, canker root, void-touched grub.  |
| Forbidden Summons    | Creatures created or attracted by necromancy, blood magic, sacrifice, overloads, and unstable rituals.  | Necromantic worker, blood-bound hound, shadow thrall.              |
| Village Reaction     | Witnesses, fear, laws, guards, exile, faction reports, rebellion, cult interest, and dark path unlocks. | A village may accept a helpful ward but reject undead labour.      |
| Cleansing Hooks      | Divine/spirit magic, wards, rituals, alchemy, boss kills, and project repairs can cleanse sites.        | Corrupted farms become recovery projects.                          |

# 11. Magical, Elemental, Fae, Spirit, and Void Creatures

| **Creature Type** | **Design Role**                                                                              | **Examples**                                                               |
|-------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| Wisps             | Early magical creatures that teach mana, ruins, wards, and magical drops.                    | Neutral forest wisps, hostile corrupted wisps, wisp cores.                 |
| Elementals        | Biome/material/weather-linked creatures that connect schools and resources.                  | Pyrelings near lava, storm motes during storms, stonehearts in deep caves. |
| Fae               | Bargain-based, mischievous, nature/dream-linked creatures.                                   | Fae tricklings, dream moths, glade guardians.                              |
| Spirits           | Shrine, ancestor, morale, ritual, haunting, and lost-NPC linked beings.                      | Ancestral guardian, lost miner spirit, shrine fox.                         |
| Infernal          | Dangerous fire/contract/corruption enemies tied to dimensions and dark bargains.             | Ash imp, forge fiend, hellhound equivalent.                                |
| Void              | Late-game dimensional threats linked to portals, Voidstone, storage, corruption, and bosses. | Void leech, rift lurker, void titan.                                       |

Magical creatures should use school and risk tags. This lets wards, spells, NPC laws, drops, codex entries, and faction reactions interact cleanly without hard-coding every creature individually.

# 12. Dungeon, Structure, and Nest Creatures

| **Structure Type** | **Creature Purpose**                                                        | **Examples**                                      |
|--------------------|-----------------------------------------------------------------------------|---------------------------------------------------|
| Caves              | Shallow cave creatures introduce danger and harvesting resources.           | Cave spider, crystal crawler, stone grub.         |
| Deepstone Caves    | Higher pressure, rare resources, and equipment checks.                      | Deep crawler, blind brute, ore-eating grub.       |
| Crystal Caves      | Mana-linked threats and magical resources.                                  | Crystal crawler, wisp, shardling.                 |
| Ruins              | Ancient guardians, wisps, cursed anchors, and lore locks.                   | Rune wisp, broken construct, relic guardian.      |
| Goblin Camps       | Raid source, stolen goods, traps, and faction pressure.                     | Goblin scout, raider, brute, captain.             |
| Crypts             | Undead, spirits, necromancy resources, and cleansing quests.                | Restless dead, crypt warden, bone archer.         |
| Shrines            | Spirit/fae/magical creatures, blessings, bargains, and ritual consequences. | Shrine spirit, fae trickling, corrupted guardian. |
| Dimensional Cracks | Dangerous late-game enemies and realm clues.                                | Void leech, infernal ember, dream echo.           |

# 13. Bosses and Major Threats

Bosses should represent major world, faction, biome, magic, dimension, or story threats. They can unlock systems, materials, faction arcs, rebuilding projects, trophies, and world-state changes. Some bosses can be optional, while others are required for certain dimensions or high-tier systems, with alternate paths where appropriate.

| **Boss Type**      | **Role**                                                                                | **Examples**                                             |
|--------------------|-----------------------------------------------------------------------------------------|----------------------------------------------------------|
| Mini-Boss          | Simple phase change, local loot, strong teaching role.                                  | Goblin Raid Captain, Cave Spider Matriarch.              |
| Regional Boss      | Threatens roads, villages, dungeons, trade, or corruption zones.                        | Goblin Warlord, Crypt Revenant, Blightheart.             |
| Faction Boss       | Leader of a political/military/monster faction with diplomacy or conquest consequences. | Bandit Lord, Cult Hierarch, Orc war chief.               |
| Magic Boss         | Controls school, ritual, ward, or corruption progression.                               | Wisp Crown, Rune-Torn Guardian.                          |
| Dimension Boss     | Guards realm materials, portal keys, and major story outcomes.                          | Infernal Forge Beast, Dream Tyrant, Void Herald.         |
| World Boss / Titan | Late-game civilisation-scale threat tied to ancient ruins and megaprojects.             | Void Titan, Celestial Leviathan, Sleeping Root Colossus. |

## 13.1 Boss Trophy Rules

- Boss trophies can be displayed as decoration and reputation proof.

- Some trophies act as crafting inputs, relic cores, faction symbols, or village morale boosters.

- Core relic drops are usually unique; secondary boss resources can be repeatable through rematches, events, or world settings.

- Boss defeats can unlock rebuilding projects, cleanse areas, reduce raid pressure, or escalate faction revenge.

# 14. Drops, Harvesting, and Creature Resources

| **Resource Family**  | **Examples**                                                                            | **Uses**                                               |
|----------------------|-----------------------------------------------------------------------------------------|--------------------------------------------------------|
| Food Drops           | Meat, eggs, fat, fantasy milk-like items, rations.                                      | Survival, cooking, village food, trade.                |
| Crafting Materials   | Hide, leather, bone, horn, wool/fibre, chitin, silk.                                    | Armour, tools, belts, bows, clothing, furniture.       |
| Alchemy Reagents     | Venom, glands, slime, spores, oils, organs.                                             | Medicine, poison, explosives, catalysts, preservation. |
| Magic Components     | Wisp core, essence, spirit dust, elemental shard, corrupted residue.                    | Runes, wards, mana batteries, rituals, magic gear.     |
| Faction Loot         | Coins, scrap, crude gear, maps, standards, stolen goods.                                | Trade, quests, camp clues, reputation proof.           |
| Trophies             | Fangs, skulls, banners, boss relics, named parts.                                       | Morale, decoration, crafting, faction intimidation.    |
| Automation Materials | Silk belts, slime sealant, beast oil, chitin plates, venom catalysts, elemental shards. | Machines, pipes, filters, seals, magitech parts.       |
| Forbidden Resources  | Necromantic bone core, blood catalyst, cursed shard, void residue.                      | Dark paths, corruption risk, illegal trade.            |

## 14.1 Harvesting Quality

Harvesting should reward preparation without becoming tedious. Correct tools, skill, damage type, magic, and processing station can improve yield or quality. For example, a clean knife improves hide, frost damage may preserve meat, fire damage may reduce organ quality, and a rune chisel may improve wisp core extraction. Early POC harvesting can be simple: creature defeated -\> basic drop table -\> optional tool bonus later.

# 15. Creature AI, Senses, Morale, and Terrain Use

| **AI Layer**          | **Locked Direction**                                                                         | **Gameplay Result**                                                                  |
|-----------------------|----------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Senses                | Sight, sound, smell, and magic sense depending on creature type.                             | Stealth, bait, scent masking, sound traps, and ward detection become possible later. |
| Morale                | Animals flee; intelligent enemies retreat, regroup, surrender, or call help.                 | Combat feels less robotic and raids can end without killing every enemy.             |
| Terrain Use           | Climb, dig, fly, swim, burrow, open doors, avoid traps, use cover, or path around walls.     | Defences need type-specific planning without making all walls useless.               |
| Group Logic           | Herds, packs, squads, raids, boss summons, and nest defenders share simple group behaviours. | Goblins rally around captains; animals herd; spiders defend nests.                   |
| Faction Conflict      | Predator/prey, undead vs living, golems vs monsters, guards vs raiders, and biome conflicts. | The world feels active beyond player fights.                                         |
| Weather/Time Reaction | Day/night, rain, storms, mana storms, eclipses, seasons, corruption waves, and rituals.      | Creature behaviour can foreshadow danger and create events.                          |

# 16. Villages, NPCs, Raids, and Defences

Creatures are one of the main ways villages prove they are living communities rather than decoration. They threaten food, livestock, roads, storage, workers, guards, crops, machines, wards, and morale. Village preparation should visibly change outcomes.

| **Creature / Event** | **Village Impact**                                                    | **Counterplay**                                               |
|----------------------|-----------------------------------------------------------------------|---------------------------------------------------------------|
| Night monster        | Harasses outskirts, attacks isolated villagers, scares children/NPCs. | Lights, patrols, walls, watchtower, safe paths.               |
| Predator             | Kills livestock or blocks hunters/foragers.                           | Fences, guard beasts, hunters, traps, animal handling.        |
| Goblin raider        | Steals food/tools, attacks guards, damages doors, targets warehouse.  | Watchtower, armed guards, walls, player combat, raid warning. |
| Goblin sapper        | Damages gates, towers, chutes, machines, or storage.                  | Stone walls, patrols, traps, repair supplies, tower archers.  |
| Undead               | Creates fear, hauntings, graveyard quests, morale loss.               | Shrines, spirit magic, wards, cleansing rituals.              |
| Corruption creature  | Corrupts blocks, crops, water, magic stores, and land.                | Special wards, cleansing, alchemy, source-node clearing.      |
| Void creature        | Targets portals, mana conduits, storage, and advanced magic.          | Void wards, stabilisers, elite guards, dimensional materials. |

## 16.1 Guard Specialisation

Guards should eventually specialise against different threat types: raiders, undead, beasts, magic threats, flying threats, and siege threats. In the POC, watchtower completion should improve early warning, sight range, guard positioning, and raid survival without requiring a full guard training system yet.

# 17. Magic, Automation, Wards, and Creature Interaction

| **Interaction**       | **Rule**                                                                                                                                        | **Result**                                                                    |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Lighting              | Torches and lanterns reduce basic night spawns.                                                                                                 | Safe villages and roads are readable.                                         |
| Wards                 | Basic wards affect normal threats; specialised wards affect undead, fae, corruption, void, demons, or spirits.                                  | Magic defence becomes infrastructure.                                         |
| Automation Attraction | Noise, light, wealth, pollution, mana leakage, exposed warehouses, and forbidden machines can attract threats.                                  | Factory growth creates defence planning without being pure punishment.        |
| Machine Sabotage      | Intelligent raiders, corruption creatures, elementals, and void creatures can damage or sabotage machines.                                      | Machines need walls, patrols, repair supplies, and alerts.                    |
| Creature Resources    | Monster drops feed automation through silk belts, slime sealant, venom catalysts, beast oil, chitin plates, elemental shards, and void residue. | Combat and hunting support factory progression.                               |
| Golems                | Golems are hybrid construct creatures/NPCs/machines with ownership, command, power, maintenance, and moral reactions.                           | Late-game labour and defence connect creature, magic, and automation systems. |

# 18. Taming, Pets, Mounts, Work Beasts, and Companions

Taming exists, but it should be balanced by care, training, command rules, ownership, world reaction, and creature identity. Not every creature is tameable. Some can be livestock, some pets, some mounts, some familiars, some work beasts, and some dangerous forbidden companions.

| **Tame Role**        | **Function**                                                             | **Examples**                                |
|----------------------|--------------------------------------------------------------------------|---------------------------------------------|
| Livestock            | Feed, breed, produce resources, support farms and village economy.       | Ambercluck, Stonewool Grazer.               |
| Pets                 | Morale, warning, tracking, small utility, companionship.                 | Lantern ferret, familiar moth.              |
| Mounts               | Travel speed, carry capacity, terrain access, culture identity.          | Windstrider, Stonehorn, later flying mount. |
| Work Beasts          | Hauling, ploughing, carts, roads, messenger systems.                     | Quarry Beetle, plough beast.                |
| Familiars            | Magical utility, scouting, mana sensing, spell support.                  | Wisp-bond familiar, dream moth.             |
| Combat Companions    | Limited combat support with care/training/command limits.                | Guard hound, trained raptor equivalent.     |
| Forbidden Companions | Necromantic or dark creatures with serious faction and village reaction. | Bone servant, blood-bound hound.            |

# 19. Visual, Audio, Variants, and Readability

Creature visuals should use high-fidelity voxel styling with readable silhouettes, strong animation, fantasy detail, and clear threat roles. A player should understand broad behaviour from posture, movement, sound, colour, and habitat before reading a codex entry.

| **Variant Type**       | **Gameplay Use**                                                     | **Example**                                         |
|------------------------|----------------------------------------------------------------------|-----------------------------------------------------|
| Biome Variant          | Changes colour/material detail and sometimes drops.                  | Forest goblin vs cave goblin; mossback vs snowback. |
| Faction Variant        | Changes gear, tactics, banners, and reputation links.                | Goblin scrapper vs goblin warband.                  |
| Rarity Variant         | Slightly rarer creature with better drops or behaviour.              | Silver-horn grazer, pure crystal crawler.           |
| Corruption Variant     | More dangerous, different drops, spreads corruption, ward-sensitive. | Corrupted wisp, blighted grazer.                    |
| Age Variant            | Young/adult/elder changes size, drops, aggression, or taming.        | Juvenile work beast, elder boar.                    |
| Magic Affinity Variant | School-linked behaviour and drops.                                   | Storm-touched wisp, flameback crawler.              |
| Elite Variant          | Stronger combat role and special drop.                               | Goblin veteran, alpha stalker.                      |
| Boss Variant           | Named enemy with arena mechanics and trophy.                         | Goblin Raid Captain, Spider Queen.                  |

## 19.1 Audio Readability

- Passive wildlife sounds can indicate nearby food, safe water, or biome health.

- Nest sounds can warn players before they enter danger.

- Raid horns, drums, shouts, and alarm bells should make attacks readable without only using UI popups.

- Magical creature audio should communicate mana, corruption, ward pressure, or spirit presence.

- Boss phase sounds should teach players that mechanics have changed.

# 20. UI, Codex, Discovery, and Feedback

| **UI / Feedback Element** | **Purpose**                                                                                                    | **Example**                                                                        |
|---------------------------|----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Creature Codex            | Shows discovered creature entries, behaviours, drops, habitats, weaknesses, and village risk notes.            | Unlocked by observation, combat, books, NPC teaching, research, or specimen drops. |
| Threat Alerts             | Warns about raids, nest growth, livestock attacks, corruption spread, or machine sabotage.                     | Configurable intensity by world settings.                                          |
| Village Board Links       | Creature problems appear as request-board tasks.                                                               | Clear nest, protect road, hunt predator, recover stolen goods, repair damage.      |
| Inspection / Tracking     | Later tools or skills reveal tracks, scents, magic traces, nest radius, and danger.                            | Supports hunters, scouts, and peaceful avoidance.                                  |
| Harvest Feedback          | Shows tool/yield/quality information when relevant.                                                            | Clean hide, damaged chitin, pure wisp core, tainted essence.                       |
| Difficulty Settings       | Threat intensity, raids, village damage, NPC death, corruption spread, and creature griefing are configurable. | Cosy and harsh playstyles both work.                                               |

# 21. Proof-of-Concept Creature Scope

The POC should prove a small, connected creature loop rather than a full ecosystem. The minimum target is seven creature types. The recommended practical target is seven core creatures plus one magical wisp if production time allows, because the selected answers require a magical POC creature.

| **Creature**        | **Category**             | **POC Role**                                                  | **Key Systems Tested**                                              |
|---------------------|--------------------------|---------------------------------------------------------------|---------------------------------------------------------------------|
| Mossback Grazer     | Passive fantasy wildlife | Original non-real-world passive animal.                       | Flee AI, hunting, meat/hide drops, biome identity, village hunting. |
| Ambercluck          | Livestock                | Owned village/player livestock.                               | Ownership, eggs/food, theft/crime, pens, village food supply.       |
| Duskhollow Stalker  | Night monster            | Basic night danger with readable audio and light counterplay. | Night spawning, light safety, simple combat, village outskirts.     |
| Cave Spider         | Cave creature            | Web/poison pressure in shallow caves.                         | Dungeon AI, venom/silk drops, disabler role.                        |
| Crystal Crawler     | Magical cave creature    | Mana cave pressure and crystal resource link.                 | Crystal cave spawn, chitin/shard drops, mana purity clue.           |
| Goblin Raider       | Faction raid enemy       | Primary POC hostile faction unit.                             | Camp, theft, raid AI, warehouse targeting, gear drops.              |
| Goblin Brute        | Faction raid enemy       | Raid heavy unit that pressures gates/guards.                  | Brute role, guard defence, watchtower response.                     |
| Goblin Raid Captain | Mini-boss                | POC raid leader and first trophy/reputation event.            | Mini-boss phase, morale aura, raid outcome, trophy.                 |
| Forest Wisp         | Magical creature         | Early magical creature tied to mana and wards.                | Mana discovery, ward interaction, wisp essence/core drop.           |

## 21.1 POC Scope Boundaries

- No full taming system is required in POC, but livestock ownership should be represented simply.

- No full boss system is required beyond the Goblin Raid Captain mini-boss.

- No full diplomacy system is required, but goblin faction structure should be represented in data.

- No full corruption spread system is required, but corrupted variants can be marked as Alpha/Beta.

- No golem gameplay is required in POC, though construct creature data can be planned.

- No flying mounts or full companion commands are required in POC.

# 22. Detailed Creature Registry v0.1

| **Creature ID**                     | **Display Name**    | **Category**        | **Role / Notes**                                             | **Threat Tier** | **Planning Status**    |
|-------------------------------------|---------------------|---------------------|--------------------------------------------------------------|-----------------|------------------------|
| creature.animal.mossback_grazer     | Mossback Grazer     | Passive Wildlife    | Forest grazer; fantasy passive animal; meat/hide; flee/herd. | Low             | POC Required           |
| creature.livestock.ambercluck       | Ambercluck          | Livestock           | Egg/food livestock; ownership and village crime hook.        | None/Low        | POC Required           |
| creature.monster.duskhollow_stalker | Duskhollow Stalker  | Hostile Night       | Night stalker; fears bright light; basic danger.             | Low             | POC Required           |
| creature.cave.cave_spider           | Cave Spider         | Dungeon / Cave      | Web/poison disabler; silk/venom drops.                       | Low-Med         | POC Required           |
| creature.cave.crystal_crawler       | Crystal Crawler     | Magical Cave        | Mana cave threat; chitin/shard drops; crystal clue.          | Medium          | POC Required           |
| creature.goblin.raider              | Goblin Raider       | Faction / Raid      | Steals food/tools; crude gear; raid unit.                    | Low-Med         | POC Required           |
| creature.goblin.brute               | Goblin Brute        | Faction / Raid      | Slow heavy unit; gate/guard pressure.                        | Medium          | POC Required           |
| creature.goblin.raid_captain        | Goblin Raid Captain | Mini-Boss           | Raid leader; morale aura; trophy; POC boss.                  | Med-High        | POC Required           |
| creature.magic.forest_wisp          | Forest Wisp         | Magical             | Neutral/hostile mana creature; ward lesson; essence drop.    | Low-Med         | POC Required / Stretch |
| creature.ambient.glowmote           | Glowmote            | Ambient             | Small glow insect; cave/mana clue.                           | None            | Alpha                  |
| creature.ambient.scriptor_moth      | Scriptor Moth       | Ambient / Magic     | Moth that gathers near lore/ruins; tiny reagent.             | None            | Alpha                  |
| creature.animal.barkhare            | Barkhare            | Passive Wildlife    | Small fast prey; hide/food; forest identity.                 | Low             | Alpha                  |
| creature.animal.tuskroot_boar       | Tuskroot Boar       | Neutral Wildlife    | Territorial neutral beast; crop danger; meat/hide.           | Medium          | Alpha                  |
| creature.animal.thornback_lynx      | Thornback Lynx      | Predator            | Hunts livestock/prey; stealth danger.                        | Medium          | Alpha                  |
| creature.mount.windstrider          | Windstrider         | Mount               | Fast land mount; later taming.                               | Low             | Beta                   |
| creature.work.quarry_beetle         | Quarry Beetle       | Work Beast          | Pack/hauling animal; chitin resource.                        | Low             | Beta                   |
| creature.livestock.stonewool_grazer | Stonewool Grazer    | Livestock           | Fantasy wool/fibre livestock.                                | None/Low        | Alpha                  |
| creature.goblin.scout               | Goblin Scout        | Faction             | Finds exposed storage; warns camp.                           | Low             | Alpha                  |
| creature.goblin.thrower             | Goblin Thrower      | Faction / Ranged    | Ranged harassment with stones/firepots.                      | Low-Med         | Alpha                  |
| creature.goblin.sapper              | Goblin Sapper       | Raid / Siege        | Targets gates, walls, machines, and chutes.                  | Medium          | Alpha                  |
| creature.goblin.shaman              | Goblin Shaman       | Faction / Magic     | Buffs raiders; crude ward breaking.                          | Medium          | Beta                   |
| creature.goblin.war_cart            | Goblin War Cart     | Raid / Siege        | Late raid vehicle; loot target.                              | High            | Beta                   |
| creature.bandit.thief               | Bandit Thief        | Faction             | Road/caravan thief; stealth theft.                           | Low-Med         | Alpha                  |
| creature.bandit.arbalist            | Bandit Arbalist     | Faction / Ranged    | Trade route ranged enemy.                                    | Medium          | Beta                   |
| creature.bandit.chief               | Bandit Chief        | Boss                | Road-control faction boss.                                   | High            | Beta                   |
| creature.undead.restless_dead       | Restless Dead       | Undead              | Basic haunted ruin enemy; fear/morale hook.                  | Low-Med         | Alpha                  |
| creature.undead.skeletal_worker     | Skeletal Worker     | Undead / Forbidden  | Enemy and later forbidden labour template.                   | Low             | Alpha                  |
| creature.undead.skeletal_archer     | Skeletal Archer     | Undead / Ranged     | Crypt ranged pressure.                                       | Medium          | Alpha                  |
| creature.undead.crypt_warden        | Crypt Warden        | Undead / Mini-Boss  | Guards grave/crypt progression items.                        | High            | Beta                   |
| creature.spirit.lost_miner          | Lost Miner Spirit   | Spirit              | Quest/haunting; mine warning.                                | Low-Med         | Alpha                  |
| creature.spirit.ancestral_guardian  | Ancestral Guardian  | Spirit / Boss       | Shrine protector and blessing unlock.                        | High            | Beta                   |
| creature.corrupt.blight_crawler     | Blight Crawler      | Corruption          | Spreads corrupted ground; cleansing hook.                    | Medium          | Beta                   |
| creature.corrupt.canker_root        | Canker Root         | Corruption / Plant  | Corrupts farms/woods; stationary hazard.                     | Medium          | Beta                   |
| creature.corrupt.blighted_grazer    | Blighted Grazer     | Corruption Variant  | Corrupted passive animal variant.                            | Medium          | Beta                   |
| creature.elemental.pyreling         | Pyreling            | Elemental / Fire    | Fire biome enemy; ember drop; furnace link.                  | Medium          | Alpha                  |
| creature.elemental.frostbound       | Frostbound          | Elemental / Ice     | Cold biome enemy; slow/freeze status.                        | Medium          | Beta                   |
| creature.elemental.storm_mote       | Storm Mote          | Elemental / Air     | Storm/mana weather creature.                                 | Medium          | Beta                   |
| creature.elemental.stoneheart       | Stoneheart          | Elemental / Earth   | Deep cave bruiser; stone core.                               | High            | Beta                   |
| creature.fae.trickling              | Fae Trickling       | Fae                 | Bargain/trickster forest creature.                           | Low-Med         | Beta                   |
| creature.fae.dream_moth             | Dream Moth          | Dream / Fae         | Dream clue; illusion/reagent.                                | Low             | Beta                   |
| creature.fae.glade_guardian         | Glade Guardian      | Fae / Boss          | Nature boss tied to sacred grove.                            | High            | Final Game             |
| creature.infernal.ash_imp           | Ash Imp             | Infernal            | Fire/contract nuisance; infernal ash.                        | Medium          | Beta                   |
| creature.infernal.forge_fiend       | Forge Fiend         | Infernal / Boss     | Deep Forge or infernal boss.                                 | High            | Final Game             |
| creature.void.void_leech            | Void Leech          | Void                | Drains mana/conduits; void residue.                          | Medium          | Beta                   |
| creature.void.rift_lurker           | Rift Lurker         | Void                | Portal/storage threat; phase behaviour.                      | High            | Final Game             |
| creature.void.void_titan            | Void Titan          | World Boss          | Region-scale endgame threat.                                 | Extreme         | Final Game             |
| creature.boss.spider_queen          | Cave Spider Queen   | Boss                | Cave boss; silk/venom progression.                           | High            | Alpha/Beta             |
| creature.boss.goblin_warlord        | Goblin Warlord      | Boss / Faction      | Regional goblin boss; raid pressure.                         | High            | Beta                   |
| creature.construct.hauling_golem    | Hauling Golem       | Construct           | Late worker creature/machine/NPC hybrid.                     | None/Low        | Final Game             |
| creature.construct.guard_golem      | Guard Golem         | Construct           | Defensive golem with maintenance/power.                      | Medium          | Final Game             |
| creature.forbidden.bone_worker      | Bone Worker         | Forbidden Construct | Necromantic labour with morality reaction.                   | Low             | Final Game             |

## 22.1 Sample Detailed POC Creature Entries

| **Creature**        | **Detailed Entry Summary**                                                                                                                                                                                                                      |
|---------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mossback Grazer     | Passive fantasy wildlife found in forest valleys. Flees from players and predators. Village hunters can harvest it. Drops basic meat and moss-hide. Teaches hunting and ecology without using a real-world animal as the first passive example. |
| Ambercluck          | Small village-owned livestock creature. Produces amber eggs and feathers/fibre. Killing or stealing from a village pen triggers ownership/crime hooks. Simple in POC: feed, pen, egg output, ownership flag.                                    |
| Duskhollow Stalker  | Basic night threat with a readable call and glowing eyes in darkness. Avoids bright torches and village watchtower light. Attacks isolated players or villagers but should not break major structures in POC.                                   |
| Cave Spider         | Early cave disabler that uses webs, light ambush, and venom. Drops silk and venom. A future Spider Queen can expand this family into boss content.                                                                                              |
| Crystal Crawler     | Magical cave creature that appears near mana crystal formations. Drops chitin and shard fragments. Can hint at mana purity and wisp/cave magic.                                                                                                 |
| Goblin Raider       | Main POC raid enemy. Attempts to steal exposed food/tools and attack guards. Has crude gear quality. Can flee when the captain dies or morale collapses.                                                                                        |
| Goblin Brute        | Heavier POC raid unit that pressures gates, guards, and weak walls. Slow and readable. Watchtower archers/guards counter it better after preparation.                                                                                           |
| Goblin Raid Captain | POC mini-boss that coordinates raiders. Simple phase: command aura while healthy, panic/rage at low health. Drops a captain token/trophy and triggers village memory/reputation.                                                                |
| Forest Wisp         | POC magical creature for mana discovery. Neutral variants lead players toward ruins or mana crystals; corrupted variants attack or disrupt wards. Drops wisp essence/core for early magic.                                                      |

# 23. Core POC Scenario: Forest Hamlet Creature and Raid Loop

The POC creature loop should connect survival, exploration, village storage, automation, magic, and defence. The goal is not to prove every creature system. The goal is to prove that creature pressure changes based on village preparation and that creatures feed useful resources and story context.

1.  The player starts near or eventually discovers a forest hamlet with simple livestock, a warehouse, a request board, and a damaged/unfinished watchtower.

2.  Passive wildlife and livestock establish that creatures are part of food, hide, village economy, and ownership rules.

3.  The player explores a cave and encounters cave spiders and crystal crawlers, gathering silk/venom/chitin/shard materials and learning cave danger.

4.  A forest wisp or magical ruin introduces mana discovery, wisp essence, and basic ward logic.

5.  Goblin scouts or rumours indicate a nearby goblin camp and future raid threat.

6.  The player supplies the village with wood, stone, iron, food, and mana resources manually or through early automation.

7.  NPC builders construct the watchtower in stages while guards and villagers prepare.

8.  A goblin raid attacks. If the watchtower, lighting, food, guard supply, and/or ward support exist, the village detects the raid earlier and suffers less damage.

9.  The Goblin Raid Captain acts as a mini-boss. Defeating or routing him changes goblin morale and produces a trophy/reputation event.

10. After the raid, NPCs remember losses, rescues, stolen resources, damage, the tower outcome, and the player contribution.

## 23.1 POC Outcome States

| **State**               | **Conditions**                                                                             | **Result**                                                                                      |
|-------------------------|--------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|
| Poor Preparation        | No watchtower, weak lighting, empty guard supply, no food/medicine, exposed warehouse.     | Goblins steal resources, damage crops/storage, injure NPCs, and the village requests repairs.   |
| Basic Preparation       | Watchtower partially built, guards armed, some lighting, warehouse supplied.               | Raid is survivable but causes damage. Guards respond better and player contribution matters.    |
| Strong Preparation      | Watchtower complete, guard supply stocked, warehouse protected, ward/light support active. | Early warning, fewer casualties, less theft, higher reputation gain, captain defeat remembered. |
| Overprepared / Advanced | Automation feeds supplies, wards active, traps/walls complete.                             | Raid becomes controlled defence event; goblins may retreat earlier or escalate future tactics.  |

# 24. Balancing Rules

- Readable role first: every creature must have a clear silhouette, sound, behaviour, and counterplay.

- Early threats teach systems without deleting villages before the player understands them.

- Creature danger should scale through spawn pressure, group behaviour, objectives, and world consequences, not only health/damage.

- Raids must be telegraphed through scouts, rumours, horns, camp growth, request boards, or warning signs.

- Village preparation must matter: lights, walls, towers, guards, food, medicine, traps, wards, and automation should change outcomes.

- Not all creatures need drops, but most gameplay creatures should have useful resources or story consequences.

- Creature farming should be possible only with limits, risks, ethics, corruption, village reaction, and balance controls.

- Forbidden creature use should create powerful alternate paths with real social, moral, and faction consequences.

- Peaceful/cozy settings should reduce destructive threat while preserving wildlife, ambience, taming, farming, discovery, and story.

- Bosses should unlock meaningful systems, world-state changes, or story outcomes rather than only bigger numbers.

# 25. Open Questions for Later Documents

| **Later Document**            | **Open Question**                                                                                            |
|-------------------------------|--------------------------------------------------------------------------------------------------------------|
| Combat, Gear, and Defence     | Exact health, damage, armour, status effect, weapon counter, tower, trap, and guard balance values.          |
| Biomes and World Generation   | Exact biome creature pools, spawn weights, migration routes, nests, camps, and seasonal rules.               |
| Races, Cultures, and Factions | Which intelligent creature groups are civilisations, enemies, neutral factions, or possible allies.          |
| Structures and Landmarks      | Creature pools for each dungeon, ruin, shrine, mine, camp, tower, portal, and random encounter.              |
| Dimensions and Realms         | Realm-specific creature families, bosses, unique drops, environmental hazards, and portal threat rules.      |
| Farming and Livestock         | Full breeding, feeding, illness, product outputs, animal housing, taming, and village livestock economy.     |
| Economy and Trade             | Creature drop values, trophy values, forbidden resource legality, market demand, and faction prices.         |
| Technical AI Plan             | Navigation, pathfinding around voxel terrain, performance LOD, group AI, raid planners, and nest simulation. |

# Appendix A. POC Creature Checklist

- Mossback Grazer implemented with flee/herd behaviour and simple drops.

- Ambercluck implemented with ownership flag and simple egg/resource output.

- Duskhollow Stalker implemented as basic night threat with light counterplay.

- Cave Spider implemented with cave spawn, simple poison/web effect, and silk/venom drops.

- Crystal Crawler implemented with crystal cave spawn and chitin/shard drop.

- Goblin Raider implemented with raid objective, crude gear, and theft target.

- Goblin Brute implemented with slow heavy attack and guard pressure role.

- Goblin Raid Captain implemented as mini-boss with morale/phase/trophy effect.

- Forest Wisp implemented or stubbed as early mana/magic creature with essence/core drop.

- At least one nest/camp source implemented for goblin raid pressure.

- Village watchtower completion changes raid detection/outcome.

- Village NPCs can remember raid outcome and player contribution.

- Creature drops connect to item/resource registries.

- Difficulty setting can reduce destructive damage for relaxed play.

# Appendix B. Creature Database Field Template

| **Field**               | **Purpose**                                                                      | **Requirement**                 |
|-------------------------|----------------------------------------------------------------------------------|---------------------------------|
| creature_id             | Unique internal ID such as creature.goblin.raider.                               | Required                        |
| display_name            | Player-facing name.                                                              | Required                        |
| category                | Passive, livestock, hostile, faction, raid, dungeon, magical, undead, boss, etc. | Required                        |
| family                  | Shared family such as goblin, wisp, cave arachnid, undead, elemental.            | Required                        |
| planning_status         | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred, Cut.               | Design metadata                 |
| threat_tier             | None, Low, Medium, High, Extreme, or draft numeric band.                         | Required for gameplay creatures |
| health_band             | Draft health range or tier.                                                      | Balance draft                   |
| damage_band             | Draft damage range or tier.                                                      | Balance draft                   |
| spawn_profile_id        | Link to spawn rules.                                                             | Required                        |
| ai_profile_id           | Link to AI package.                                                              | Required                        |
| drop_table_id           | Link to loot/harvesting table.                                                   | Optional for ambient            |
| biome_tags              | Biomes and regions where it appears.                                             | Required                        |
| structure_tags          | Ruins, caves, camps, shrines, crypts, villages, roads, etc.                      | Optional                        |
| time_light_rules        | Day/night/light/ward rules.                                                      | Optional                        |
| weather_event_rules     | Storm, mana storm, eclipse, season, corruption wave rules.                       | Optional                        |
| village_interactions    | Attack, steal, target warehouse, hunt livestock, trigger quest, morale effect.   | Optional                        |
| automation_interactions | Machine sabotage, noise attraction, mana leakage attraction, resource use.       | Optional                        |
| magic_interactions      | Ward type, school tags, corruption, essence, spirit/undead/fae/void tags.        | Optional                        |
| taming_profile          | None, livestock, pet, mount, work beast, familiar, forbidden companion.          | Optional                        |
| variant_rules           | Biome, age, corruption, rarity, elite, boss variants.                            | Optional                        |
| codex_unlock            | Observation, combat, NPC teaching, book, research, specimen, trophy.             | Optional                        |
| sound_profile           | Idle, alert, attack, raid warning, nest, boss phase sounds.                      | Optional                        |
| notes                   | Design notes, POC simplifications, future expansion.                             | Design metadata                 |

# Appendix C. Cross-System Use Matrix

| **Creature Family**    | **Survival** | **Combat** | **Automation** | **Village** | **Magic**  | **Trade** | **Dimension** |
|------------------------|--------------|------------|----------------|-------------|------------|-----------|---------------|
| Passive Wildlife       | High         | Medium     | Low            | High        | Low        | Medium    | Low           |
| Livestock              | High         | Medium     | Medium         | High        | Low/Medium | High      | Low           |
| Hostile Night Monsters | Medium       | Medium     | Low            | High        | Low        | Low       | Low           |
| Goblin Raiders         | Medium       | High       | Medium         | High        | Low/Medium | Medium    | Low           |
| Dungeon Creatures      | Medium       | High       | Low/Medium     | Medium      | Medium     | Medium    | Medium        |
| Magical Creatures      | Low/Medium   | Medium     | Medium         | Medium      | High       | High      | Medium        |
| Undead                 | Low          | Medium     | Low            | High        | High       | Medium    | Medium        |
| Corruption Creatures   | Low          | High       | Medium         | High        | High       | Medium    | High          |
| Elementals             | Low/Medium   | Medium     | High           | Medium      | High       | Medium    | Medium        |
| Fae/Spirit Creatures   | Low/Medium   | Medium     | Low            | Medium/High | High       | Medium    | High          |
| Void Creatures         | Low          | High       | High           | High        | High       | High/Risk | High          |
| Bosses/Titans          | Low          | High       | Medium/High    | High        | High       | High      | High          |

# Appendix D. Future Creature Family Backlog

- Regional passive wildlife families for plains, forests, deserts, swamps, snowlands, mountains, coasts, caves, and magical biomes.

- Full fantasy livestock and farm creature system with breeding, product outputs, illness, care, pen blocks, and village economy.

- Goblins expanded into scouts, raiders, thieves, throwers, brutes, sappers, shamans, beast handlers, war carts, chiefs, and warlords.

- Bandit/outlaw factions with road camps, ambushes, extortion, caravans, black markets, and diplomacy/conquest paths.

- Undead families for graveyards, crypts, necromancers, haunted villages, spirit events, bone crafting, and forbidden labour.

- Corruption creature families tied to spreading land, crops, water, machines, mana storage, void breaches, and cleansing projects.

- Elemental creature families tied to fire, frost, lightning, earth, wind, water, weather, materials, and machine resources.

- Fae/dream/spirit creatures tied to bargains, forest shrines, memory, prophecy, ancestors, morale, dream realms, and culture arcs.

- Infernal and demon families tied to contracts, fire, forge dimensions, corruption, dark bargains, and forbidden resources.

- Void creatures tied to portals, storage, teleport logistics, Voidstone, unstable machines, and endgame bosses.

- Boss roster by biome, faction, structure, dimension, magic school, and civilisation-scale threat.

- Creature research/codex progression, including weaknesses, drops, tracks, village rumours, and NPC-taught monster lore.

- Mounts, familiars, work beasts, guard beasts, messenger birds, magical companions, and late-game flying mounts.

- Construct/golem creature families integrated with automation, ownership, maintenance, law, and morality.

# Appendix E. POC Success Criteria

| **Success Area**    | **Requirement**                                                                 | **Success Test**                                                                                        |
|---------------------|---------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| Creature Variety    | At least seven creature types exist, each with a clear role and category.       | Player can identify passive, livestock, night, cave, magical, raid, and mini-boss roles.                |
| Spawning            | Basic biome/time/structure spawning works.                                      | Night monster appears at night; cave creatures appear in cave; goblins originate from camp/raid source. |
| Drops               | Creature drops connect to the item/resource system.                             | Meat/hide, silk/venom, chitin/shards, goblin scrap, wisp essence appear as items.                       |
| Village Interaction | At least one raid affects the village and has different outcomes.               | Watchtower/guards/preparation reduce damage or casualties.                                              |
| AI                  | Creatures have distinct basic behaviours.                                       | Animals flee; goblins steal/attack; captain buffs/commands; cave creature uses disabler behaviour.      |
| Magic Link          | Wisp or magical cave creature connects to mana/ward logic.                      | Player sees magical drops and basic ward relevance.                                                     |
| Automation Link     | Raiders can target exposed storage or supply lines at least in simplified form. | Player learns to protect warehouse or automation route.                                                 |
| Feedback            | Threats are readable through audio, UI, request board, or environment.          | Player knows raid is coming and why preparation matters.                                                |
| Difficulty Safety   | Relaxed setting can soften destructive village outcomes.                        | POC can be tested without constant village collapse.                                                    |

# End of Document 10 - Creatures and Monsters v0.1

This document locks the creature-system foundation for the current planning stage. Later documents can add exact combat values, biome pools, structure-specific spawn tables, faction details, boss stat blocks, taming formulas, and technical AI implementation. The core rule should remain: creatures must make the world feel alive, dangerous, useful, magical, and connected to civilisation consequences.
