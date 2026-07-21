**Fantasy Voxel Civilisation Sandbox**

**09 - Magic System**

**Version 0.1 - Detailed Design Bible Draft**

*A database-ready magic system for mana, spellcasting, runes, rituals, enchanting, alchemy, magitech, NPC culture, village defence, forbidden magic, portals, golems, UI, and proof-of-concept magical infrastructure.*

Working design document - magic system and registry foundation

# Magic System Statement

| **Field**             | **Locked Direction**                                                                                                                                                                                                                                                                                   |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope        | Full design-bible document covering mana, spellcasting, schools, runes, rituals, enchanting, alchemy, magitech, magical resources, magic blocks, NPC magic, village defence, forbidden magic, portals, golems, UI, data fields, and POC scope.                                                         |
| Core Philosophy       | Magic is a practical infrastructure layer. It supports combat, villages, automation, exploration, construction, farming, logistics, defence, dimensions, and story rather than existing only as combat spells.                                                                                         |
| Progression Direction | Magic starts after basic survival or village/ruin discovery, then branches into schools, research, NPC teaching, runes, rituals, magitech, golems, leylines, portals, dimensions, and world-shaping systems.                                                                                           |
| POC Direction         | The proof-of-concept proves Mana Crystal -\> Mana Shard/Dust -\> Basic Rune -\> Rune Table -\> Mana Furnace -\> Ward Lantern/Stone -\> village defence outcome, with one utility spell, one combat spell, a village mage, a magical ruin, a basic mana conduit, and teaser-scope golem/portal objects. |
| Data Direction        | Use database/spreadsheet-ready IDs, categories, schools, tiers, tags, costs, unlock methods, risks, block interactions, NPC/village use, automation links, UI fields, and planning status.                                                                                                             |
| Boundary Rule         | Full school trees, full enchanting, full alchemy, full golemancy, full necromancy paths, full portals/dimensions, leyline networks, weather rituals, large ritual structures, complex rune logic, and multiplayer magical permissions are deferred beyond POC.                                         |

# Document Purpose

This document defines how magic works across the Fantasy Voxel Civilisation Sandbox. It turns the high-level promise of practical fantasy magic into concrete gameplay rules: how mana is stored and spent, how spells are learned and cast, how runes control machines and wards, how rituals affect the world, how NPCs and villages use magic, how forbidden magic creates consequences, and how the proof-of-concept proves that magic powers infrastructure rather than only combat.

This document does not replace the Blocks Registry, Items Registry, Crafting and Recipe Registry, Resource Progression document, NPC Village System, Automation System, Combat System, Economy System, Dimensions document, or future Player Settlement System. Instead, it creates the magic-facing rules those documents must support.

# Design Source

| **Source Document**               | **Relevant Direction**                                                                                                                                              | **How This Magic Document Uses It**                                                                                                     |
|-----------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible     | Locks the core hook that magic and factories build civilisations, unlock stories, power settlements, and reshape the world.                                         | Magic is treated as a world-changing infrastructure pillar, not a bolt-on spell list.                                                   |
| 01 - Core Gameplay Loop           | Locks the primary loop: explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                         | Magic supports the loop through discovery, utility spells, mana resources, village defence, and late-game dimension progression.        |
| 02 - Player Progression System    | Locks hybrid progression through tools, levels, skills, perks, knowledge, research, magic, automation, villages, reputation, exploration, dimensions, and morality. | Magic progression uses research, school mastery, NPC teaching, gear, ruins, rituals, reputation, and resources rather than level alone. |
| 03 - Blocks Registry              | Defines magic blocks such as mana conduits, ward lanterns, portal frames, ritual anchors, magical states, and parent MagicBlock rules.                              | Magic content includes placeable, damageable, stateful infrastructure blocks with mana, ward, ritual, and corruption behaviour.         |
| 04 - Items Registry               | Defines magic components such as mana crystals, dust, runes, glyphs, essences, catalysts, ritual items, staves, wands, spellbooks, relics, and scrolls.             | Magic entries link to physical items, components, trade goods, NPC consumption, fuel, equipment, and knowledge items.                   |
| 05 - Crafting and Recipe Registry | Defines alchemy, rune, ritual, mana furnace, machine, NPC project, forbidden, culture, and dimension recipe structures.                                             | Magic uses the same recipe foundation but adds school, purity, risk, ritual, mana, participant, and world-state fields.                 |
| 06 - Resource Progression         | Locks Mana Crystal as a parallel magic resource and defines Raw Mana Crystal -\> Mana Shard -\> Mana Dust -\> Runes/Cores/Batteries.                                | Mana, purity, magical fuels, catalysts, forbidden resources, and realm resources become core magic progression inputs.                  |
| 07 - NPC Village System           | Locks village mages, magical resources, wards, healing, rituals, mage buildings, magic laws, reputation, and village reactions to forbidden magic.                  | Magic connects directly to villages through mage NPCs, wards, teaching, project support, NPC needs, laws, fear, and trust.              |
| 08 - Automation System            | Locks mana furnaces, conduits, batteries, rune automation, ward links, magitech upgrades, instability, and POC mana automation links.                               | Magic powers, controls, stabilises, upgrades, and risks automation without replacing mechanical systems.                                |

# Static Table of Contents

- 1\. Locked Magic System Identity

- 2\. Player Answer Decision Summary

- 3\. Magic System Architecture

- 4\. Parent Magic Data Model

- 5\. Magic Categories, Schools, and Tags

- 6\. Mana, Energy, and Magical Resources

- 7\. Magic Progression and Unlocks

- 8\. Spellcasting, Focuses, and Loadouts

- 9\. Utility Magic

- 10\. Combat Magic, Gear, and Status Effects

- 11\. Rune Magic, Enchanting, and Alchemy

- 12\. Rituals, Portals, Dimensions, and World Events

- 13\. Magitech, Machines, Automation, and Golems

- 14\. Villages, NPC Magic, Culture, and Reputation

- 15\. Forbidden Magic, Corruption, Risk, and Morality

- 16\. UI, Discovery, Codex, and Feedback

- 17\. Proof-of-Concept Magic Scope

- 18\. Detailed Magic Registry v0.1

- 19\. Core POC Scenario: Forest Hamlet Ward Loop

- 20\. Balancing Rules

- 21\. Open Questions for Later Documents

- Appendix A. POC Magic Checklist

- Appendix B. Magic Database Field Templates

- Appendix C. Cross-System Use Matrix

- Appendix D. Future Magic Backlog

- Appendix E. POC Success Criteria

# 1. Locked Magic System Identity

The Magic System is the mystical infrastructure layer of the game. It gives the player personal spells, but its main identity is broader: mana powers furnaces, wards, conduits, rituals, villages, machines, portals, research, healing, farming, construction, and world-state change. Magic should feel ancient, useful, dangerous, cultural, and physical inside the voxel world.

| **Locked Rule**                                                                                                                                                                                                                                 |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Magic should never be only a spell list. Every major magic feature should answer at least one gameplay question: what does it power, protect, unlock, teach, transform, stabilise, corrupt, repair, grow, move, reveal, or change in the world? |

| **Identity Layer**       | **Design Meaning**                                                                                                                | **Player-Facing Result**                                                                                    |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Practical Infrastructure | Mana, runes, wards, conduits, rituals, enchanted stations, and magical machines become placeable, usable systems.                 | Magic visibly helps the player build, defend, automate, travel, farm, heal, and supply villages.            |
| Player Power             | Spells, focuses, gear, loadouts, mana, school mastery, and utility actions give the player personal magical agency.               | The player can cast, learn, specialise, fight, explore, repair, and manipulate blocks.                      |
| Civilisation Support     | Villages consume magical resources and use mage NPCs, shrines, ward towers, alchemy labs, libraries, and ritual circles.          | Magic grows settlements, protects roads, stabilises food, unlocks cultural stories, and changes reputation. |
| Automation Expansion     | Mana furnaces, conduits, batteries, rune filters, machine runes, ward links, and magitech upgrades extend the factory layer.      | Automation becomes fantastical without replacing mechanical systems or NPC labour.                          |
| Adventure and Discovery  | Ruins, spellbooks, research notes, bosses, factions, dimensions, and relics reveal schools and rituals.                           | Magic feels discovered through the world, not handed out only by levelling.                                 |
| Risk and Morality        | Forbidden schools, unstable materials, overloads, corruption, sacrifice, necromantic labour, and public laws create consequences. | Powerful magic can create fear, faction anger, disaster, rebellion, or alternative dark paths.              |

## 1.1 Magic Design Promise

A player should be able to look at magical infrastructure and understand what it is doing: where mana comes from, how it flows, what the rune controls, what the ward protects, which village or machine depends on it, and what risks exist if it fails. The system can become deep later, but early magic must be readable and physically grounded.

## 1.2 What Magic Is Not

- It is not a pure combat class system.

- It is not a replacement for tools, crafting, machines, villagers, or exploration.

- It is not only a late-game fantasy effect layer.

- It is not a random punishment system where rituals or machines fail without explanation.

- It is not a POC requirement to build full schools, dimensions, golemancy, leylines, or dark paths.

# 2. Player Answer Decision Summary

The following table converts the selected multiple-choice answers into locked magic-system decisions. Where multiple answers were selected, the document uses a hybrid rule. Question 96 includes golem and portal POC content, while Question 100 defers full golemancy and full portals/dimensions; this is resolved by treating the POC golem and portal as teaser-scope or heavily limited objects.

| **Q** | **Area**                  | **Locked Decision**                                                                                                                                                                                                   |
|-------|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1     | Scope                     | C - Full magic system document covering spells, runes, rituals, enchanting, alchemy, mana, magical blocks, resources, NPC magic, automation magic, forbidden magic, and POC scope.                                    |
| 2     | Core identity             | C - Magic is a practical infrastructure layer for combat, villages, automation, exploration, construction, farming, defence, and dimensions.                                                                          |
| 3     | Final complexity          | C - Deep but readable with schools, resources, rituals, utility, combat, risks, and progression.                                                                                                                      |
| 4     | POC complexity            | C - Basic mana crystals, basic rune, mana furnace, ward/defence use, one utility spell, and one combat spell.                                                                                                         |
| 5     | POC proof                 | C - Magic must prove useful infrastructure: mana furnace, basic rune crafting, village defence, and automation support.                                                                                               |
| 6     | Optional/required         | C - Optional early, strongly useful mid-game, and required for some late-game/dimension systems.                                                                                                                      |
| 7     | Non-mage viability        | B/C - Non-mage playstyles remain viable while still using magic infrastructure indirectly when needed.                                                                                                                |
| 8     | Specialisation            | C - Players can specialise through schools, research, tools, gear, NPC teaching, and choices.                                                                                                                         |
| 9     | Moral consequences        | C - Forbidden magic, necromancy, blood magic, corruption, village harm, and exploitative rituals have consequences.                                                                                                   |
| 10    | Name/number               | A/D - Use 09 - Magic System as the main title, with Magic, Rituals, and Magitech as a subtitle identity.                                                                                                              |
| 11    | Energy name               | A - Mana is the main magical energy term.                                                                                                                                                                             |
| 12    | Mana role                 | C - Mana is world energy used by players, machines, wards, rituals, items, villages, and dimensions.                                                                                                                  |
| 13    | Personal mana             | C - The player has personal mana, but major magic also needs components, tools, rituals, or infrastructure.                                                                                                           |
| 14    | Mana regeneration         | B - Mana regenerates slowly over time and faster with rest, food, gear, shrines, or mage support.                                                                                                                     |
| 15    | Mana crystals             | C - Mana Crystals are fuel, crafting ingredient, village request item, machine input, ward power, ritual component, and trade good.                                                                                   |
| 16    | Mana purity               | C - Purity affects ritual stability, corruption risk, machine performance, enchanting quality, and spell strength.                                                                                                    |
| 17    | World mana nodes          | C - Mana appears as ore blocks, crystal clusters, large deposits, leyline-adjacent nodes, and rare magical wells.                                                                                                     |
| 18    | Leylines                  | C - Leylines are late-game static infrastructure for large magic, automation, portals, and city-scale projects.                                                                                                       |
| 19    | Mana storage              | C - Mana batteries, crystal tanks, ward cores, conduits, shrines, and leyline reservoirs exist.                                                                                                                       |
| 20    | Environmental mana        | C - Concentrated mana can affect crops, monsters, corruption, weather, mutations, growth, and hazards.                                                                                                                |
| 21    | School model              | C - Use broad schools with sub-branches, tags, and culture variants.                                                                                                                                                  |
| 22    | Schools                   | A-M - Include Elemental, Nature, Rune, Arcane, Divine/Spirit, Shadow/Blood, Necromancy, Golemancy, Alchemy, Enchanting, Portal/Ritual, Dream/Fate/Illusion, and culture-specific schools.                             |
| 23    | Rune Magic                | C - Rune Magic controls machines, wards, doors, mana networks, automation logic, building support, and magical devices.                                                                                               |
| 24    | Alchemy                   | C - Alchemy is a hybrid magic/crafting system for potions, catalysts, transmutation, explosives, medicine, fuels, and reagents.                                                                                       |
| 25    | Enchanting vs Rune        | B - Enchanting imbues items/blocks; Rune Magic controls patterns, logic, machines, and structures.                                                                                                                    |
| 26    | Golemancy                 | C - Golemancy is both magic and automation: worker creation for labour, hauling, mining, defence, construction, and support.                                                                                          |
| 27    | Necromancy                | C - Players can use necromancy, but it is forbidden, risky, faction-reactive, fear-generating, and tied to dark labour.                                                                                               |
| 28    | Shadow/Blood              | C - Shadow/Blood Magic is powerful forbidden magic with costs, corruption, sacrifice, fear, faction consequences, and dark paths.                                                                                     |
| 29    | Divine/Spirit             | C - Divine/Spirit Magic connects to shrines, culture, villagers, blessings, spirits, ancestors, morale, and protection.                                                                                               |
| 30    | Dream/Fate/Illusion       | C - Dream/Fate/Illusion exists mostly later through dimensions, race stories, relics, prophecy, illusion, and memory magic.                                                                                           |
| 31    | Casting method            | C - Hybrid casting through learned spells, equipped focus, hotbar assignment, scrolls, runes, and items.                                                                                                              |
| 32    | Focus requirement         | C - Simple spells can be cast directly; stronger spells need wand, staff, spellbook, rune tool, relic, or station.                                                                                                    |
| 33    | Learning spells           | C - Spells are learned through discovery, NPC teaching, books, ruins, research, faction trust, bosses, dimensions, experimentation, and culture stories.                                                              |
| 34    | Spell tiers               | C - Tiers align with progression bands: starter, copper/iron, mana, steel/magitech, mythril/realm, void/celestial/endgame.                                                                                            |
| 35    | Spell improvement         | C - Spells improve through use, research, tools, school knowledge, quests, NPC mentors, and resources.                                                                                                                |
| 36    | School mixing             | C - Schools can mix, but strong hybrid spells require research, components, rituals, or special tools.                                                                                                                |
| 37    | Loadouts                  | B - Active slots are limited, while the full known spell library remains in the codex.                                                                                                                                |
| 38    | Cooldowns                 | C - Magic can use cooldowns plus mana/components depending on power and category.                                                                                                                                     |
| 39    | Targeting                 | C - Use aim-based projectiles/beams, area placement, targeted healing, structure targeting, and block targeting.                                                                                                      |
| 40    | Block interaction         | C - Magic can break, grow, repair, light, ward, corrupt, transmute, support placement, aid construction, and create hazards.                                                                                          |
| 41    | Utility importance        | C - Utility magic is more important than combat for the game's identity.                                                                                                                                              |
| 42    | Mining support            | C - Magic supports ore sensing, stone cracking, vein revealing, safe excavation, auto-mining support, and special harvesting.                                                                                         |
| 43    | Farming support           | C - Magic supports fertility, irrigation, crop protection, magical crops, pest control, seasons, and village food stability.                                                                                          |
| 44    | Building support          | C - Magic supports blueprint assistance, scaffolds, repair, block shaping, levitation, wards, and NPC projects.                                                                                                       |
| 45    | Village defence           | C - Magic supports wards, alarm bells, protective lanterns, barrier stones, anti-monster lights, guard buffs, healing, and tower upgrades.                                                                            |
| 46    | Roads/trade               | C - Magic supports warded roads, safe-lamps, waystones, route protection, weather protection, courier speed, and anti-bandit wards.                                                                                   |
| 47    | Storage/logistics         | C - Magic supports sorting glyphs, item conduits, storage wards, preservation, portal-linked storage, anti-theft seals, and permissions.                                                                              |
| 48    | Food/cooking              | C - Magic supports preservation, cooking buffs, alchemy ingredients, village food quality, magical meals, and spoilage reduction.                                                                                     |
| 49    | Healing/medicine          | C - Magic supports player healing, NPC medicine, disease cleansing, injury recovery, morale, shrine blessings, and village survival.                                                                                  |
| 50    | Weather                   | C - Weather influence is limited, costly, and mainly mid/late-game rituals or village infrastructure.                                                                                                                 |
| 51    | Automation link           | C - Magic powers, controls, upgrades, protects, risks, and expands automation without replacing mechanical systems.                                                                                                   |
| 52    | Mana Furnaces             | C - Mana Furnaces are early magical infrastructure for smelting, mana materials, runes/ward cores, and village supply.                                                                                                |
| 53    | Mana conduits             | C - Mana conduits are physical transfer blocks with throughput, ownership, damage states, overload risk, and feedback.                                                                                                |
| 54    | Rune Logic                | C - Rune Logic is readable: filters, permissions, routing, machine modes, delivery rules, locks, alarms, and later logic networks.                                                                                    |
| 55    | Machine upgrades          | C - Magic upgrades affect efficiency, safety, output quality, fuel type, by-products, protection, compatibility, and special recipes.                                                                                 |
| 56    | Machine risks             | C - Risks are predictable: overload, corruption, instability, waste, cursed outputs, faction concern, and shutdown warnings.                                                                                          |
| 57    | Golems                    | C - Golems are later progression workers for hauling, mining, guarding, building, repairing, and automation support.                                                                                                  |
| 58    | POC golems                | C - POC golems are teaser-scope only: broken, heavily limited, or future-linked rather than full golemancy.                                                                                                           |
| 59    | Village permission        | C - Village warehouses, wards, village-owned machines, NPC chests, and settlement magic require trust/ownership/permissions.                                                                                          |
| 60    | Damageable infrastructure | C - Conduits, wards, batteries, machines, towers, and ritual anchors can be damaged, repaired, stolen, corrupted, or sabotaged.                                                                                       |
| 61    | Village mages             | C - Village mages teach, maintain wards, research, assist rituals, heal, and specialise culturally.                                                                                                                   |
| 62    | NPC casting               | C - Selected NPCs can heal, defend, craft, maintain wards, teach, perform rituals, and use culture-specific magic.                                                                                                    |
| 63    | Culture styles            | C - Cultures/races/factions prefer different schools, buildings, rituals, items, and dimension links.                                                                                                                 |
| 64    | Culture stories           | C - Village growth, mage buildings, rituals, archives, specialists, and race-linked dimensions unlock magic lore and arcs.                                                                                            |
| 65    | Forbidden reactions       | C - Villages react through witnesses, fear, fines, exile, guards, faction alerts, rebellion, cult recruitment, or dark paths.                                                                                         |
| 66    | Positive reputation       | C - Healing, wards, cleansing, crops, trade route protection, and village saving improve trust.                                                                                                                       |
| 67    | Magic buildings           | C - Shrines, mage huts, rune workshops, alchemy labs, ward towers, libraries, ritual circles, golem yards, portal sanctums, and variants exist.                                                                       |
| 68    | NPC resource use          | C - Villages consume mana crystals, runes, herbs, medicine, ward cores, ritual goods, shrine goods, and culture-specific magic items.                                                                                 |
| 69    | Magic laws                | C - Laws vary by culture/faction: necromancy, blood magic, mind magic, illegal rituals, dangerous machines, and public casting.                                                                                       |
| 70    | Peaceful play             | C - Magic supports lighting, crops, healing, animal care, weather protection, building help, preservation, festivals, and comfort items.                                                                              |
| 71    | Combat weight             | C - Utility/infrastructure first, but combat remains meaningful through spells, gear, wards, enemies, raids, and bosses.                                                                                              |
| 72    | Magic weapons             | C - Wands, staves, spellbooks, enchanted weapons, rune tools, relics, scrolls, charms, and magitech weapons exist.                                                                                                    |
| 73    | Armour interaction        | C - Robes, light armour, heavy enchanted armour, resistances, mana bonuses, penalties, ward slots, and set effects exist.                                                                                             |
| 74    | Enemy magic               | C - Magical monsters, shamans, necromancers, cultists, spirits, village mages, faction casters, and dimension enemies can use magic.                                                                                  |
| 75    | Raids target magic        | C - Intelligent enemies may attack wards, conduits, batteries, shrines, mage towers, and mana storage strategically.                                                                                                  |
| 76    | Status effects            | C - Include burn, freeze, shock, poison, rooted, blessed, cursed, corrupted, warded, silenced, slowed, frightened, inspired, and cleansed.                                                                            |
| 77    | Damage scaling            | C - Scaling uses school knowledge, focus quality, mana purity, runes, catalysts, enchantments, and progression tier.                                                                                                  |
| 78    | Friendly fire             | C - World setting/difficulty controlled. Dangerous spells, explosives, rituals, and forbidden magic can harm allies or villages.                                                                                      |
| 79    | Defensive wards           | C - Wards are placeable blocks with fuel, radius, strength, damage, ownership, upgrades, failure states, and village integration.                                                                                     |
| 80    | Block damage              | C - Spell block damage is controlled by spell type and world setting; dangerous magic can damage blocks, basic spells avoid griefing by default.                                                                      |
| 81    | Rituals                   | C - Rituals are multi-block, resource-consuming, timed, interruptible, risky, and story-linked magic events.                                                                                                          |
| 82    | Portals                   | C - Portals are both found and built/stabilised later through rare resources and rituals.                                                                                                                             |
| 83    | Dimensions                | C - Dimensions require rituals, culture stories, realm materials, stabilisers, boss/story gates, and magic infrastructure.                                                                                            |
| 84    | Dimension rewards         | C - Dimensions give materials, spells, blocks, machines, rituals, NPC specialists, culture upgrades, hazards, and story outcomes.                                                                                     |
| 85    | Magic events              | C - Mana storms, corruption waves, spirit nights, leyline surges, eclipse rituals, fae blooms, void breaches, and omens exist.                                                                                        |
| 86    | World-state rituals       | C - Rituals can cleanse, bless, open gates, awaken bosses, change weather, empower wards, found magical cities, or cause disasters.                                                                                   |
| 87    | Ritual failure            | C - Failures are readable: missing components, poor purity, wrong timing, damage, interruption, forbidden catalysts, or unstable power.                                                                               |
| 88    | Endgame magic             | C - Celestial/Void/endgame magic supports world-shaping structures, floating cities, realm machines, and artifacts.                                                                                                   |
| 89    | Data model                | C - Use database/spreadsheet-ready entries for schools, spells, rituals, runes, enchantments, resources, blocks, effects, unlocks, risks, and status.                                                                 |
| 90    | Unique IDs                | C - Every school, spell, rune, ritual, enchantment, resource, magic block, status effect, and unlock has a unique ID.                                                                                                 |
| 91    | Spell fields              | C - Spell entries include ID, school, tier, cost, cast method, focus, unlock, effects, block/NPC/automation use, risk, tags, UI text, and status.                                                                     |
| 92    | Ritual fields             | C - Ritual entries include structure, inputs, timing, location, participants, risks, outputs, world-state effects, unlock, and failures.                                                                              |
| 93    | Magic UI                  | C - UI includes codex, active slots, mana, school tabs, hints, warnings, ritual UI, rune/machine links, and village magic hooks.                                                                                      |
| 94    | Discovery                 | C - Discovery uses ruins, books, scrolls, research notes, experimentation, NPC teaching, faction trust, projects, bosses, dimensions, and recipe hints.                                                               |
| 95    | POC UI                    | C - POC UI has mana display, known spell/rune list, mana furnace UI, ward feedback, and quest/codex hint.                                                                                                             |
| 96    | POC content               | A-N - Include Mana Crystal, shards/dust, Basic Rune, Rune Table, Mana Furnace, Ward Lantern/Stone, utility spell, combat spell, mage NPC, magic note/book, ruin, mana conduit, and teaser-scope golem/portal objects. |
| 97    | POC forbidden magic       | C - Include one cursed item or ruined ritual warning, not a full forbidden system.                                                                                                                                    |
| 98    | POC warding               | C - Include one functional ward lantern/stone that improves raid defence or monster safety when supplied.                                                                                                             |
| 99    | POC spell combat          | C - Include one simple combat spell with clear cost/cooldown.                                                                                                                                                         |
| 100   | POC deferrals             | A-K - Defer full school trees, enchanting, alchemy, golemancy, dark paths, portals/dimensions, leylines, weather rituals, large rituals, complex rune logic, and magical multiplayer permissions.                     |

# 3. Magic System Architecture

The Magic System should be data-driven from the beginning. The player sees spells, runes, mana crystals, ward lanterns, rituals, conduits, mages, ruins, warnings, and magical machines. The game internally tracks linked data definitions for schools, spells, runes, rituals, magic resources, mana networks, magic blocks, enchantments, alchemy recipes, NPC magic profiles, and runtime state.

| **Layer**              | **Purpose**                                                                             | **Examples**                                                          |
|------------------------|-----------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| Base Magic Definition  | Parent record for every magic entry.                                                    | ID, display name, category, school, tier, tags, unlock, cost, scope.  |
| School Definition      | Groups magic into broad identities with sub-branches and culture variants.              | Rune, Nature, Elemental, Arcane, Divine/Spirit, Shadow/Blood.         |
| Spell Definition       | Defines castable player/NPC actions.                                                    | Spark Bolt, Stone Sense, Mend Minor, Cleanse Blight.                  |
| Rune Definition        | Defines inscribed logic/control/support symbols.                                        | Basic Rune, Ward Rune, Machine Rune, Lock Rune.                       |
| Ritual Definition      | Defines multi-block, timed, resource-consuming world events.                            | Ward Settlement, Cleanse Corruption, Wake Dormant Portal.             |
| Mana Network           | Tracks mana flow, storage, throughput, overload, ownership, and visual states.          | Conduit -\> battery -\> mana furnace -\> ward lantern.                |
| Enchantment Definition | Defines persistent magical properties added to items or blocks.                         | Sharpness-style weapon effects, preservation seal, warded gate.       |
| Alchemy Formula        | Defines reagent, catalyst, risk, potion, medicine, explosive, and fuel transformations. | Minor Healing Draught, Mana Binder, Blast Powder.                     |
| Magic Runtime State    | Tracks mutable state in a save file.                                                    | Charge, purity, cooldown, corruption, ritual progress, failure state. |
| Village Magic Layer    | Connects magic to NPC teaching, warehouses, laws, wards, reputation, and project needs. | Mage teaching Basic Rune after a village trust milestone.             |

| **Important Data Rule**                                                                                                                                                                                                                                                         |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| POC status, Alpha/Beta/Final status, Placeholder status, Deferred status, and balance-draft notes are documentation fields only. They should not become hard gameplay properties inherited by magic entries. Shipped gameplay data should remain clean, moddable, and reusable. |

# 4. Parent Magic Data Model

The parent magic model prevents the system from becoming an unmanageable list of one-off spells and blocks. A Basic Rune inherits from RuneEntry, which inherits from BaseMagicEntry. A Ward Lantern inherits from MagicBlock and ManaNetworkObject. A village mage uses an NPCMagicProfile tied to culture, teaching, and laws.

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                                             | **Example Children**                  |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
| BaseMagicEntry                | Core identity, ID, display name, category, tier, rarity, tags, unlock method, connected systems, and planning status.               | All magic records.                    |
| MagicSchool                   | School theme, allowed roles, sub-branches, culture variants, unlock routes, reputation reactions, and forbidden status.             | Elemental, Rune, Nature, Necromancy.  |
| SpellEntry                    | Mana cost, cooldown, cast method, focus requirement, targeting, effects, block interactions, NPC use, damage/healing, and UI text.  | Spark Bolt, Stone Sense, Mend Minor.  |
| RuneEntry                     | Inscription base, school affinity, mana charge, purity, slot compatibility, machine/ward role, and stability rules.                 | Basic Rune, Ward Rune, Machine Rune.  |
| RitualEntry                   | Structure requirements, inputs, timing, location, participants, risk, output, world-state effect, failure states, and story unlock. | Cleanse Hamlet Well, Open Minor Rift. |
| EnchantmentEntry              | Target item/block tags, socket/slot requirements, mana/catalyst cost, stat modifier, durability impact, and risk.                   | Preservation Seal, Focused Edge.      |
| AlchemyEntry                  | Reagents, catalysts, station, purity, failure outputs, potion/medicine/fuel results, and warning text.                              | Minor Healing Potion, Mana Binder.    |
| ManaNetworkObject             | Ports, throughput, storage, charge, ownership, overload, damage, corruption, and visual feedback.                                   | Mana Conduit, Mana Battery.           |
| NPCMagicProfile               | Casting permissions, school preference, teaching role, ward task, ritual assistance, fear/law reaction, and culture style.          | Village Mage, Priest, Cultist.        |
| ForbiddenMagicPath            | Forbidden tag, witness rules, fear, corruption, faction reaction, alternate unlocks, and dark progression hooks.                    | Necromantic Labour, Blood Engine.     |

# 5. Magic Categories, Schools, and Tags

Magic uses broad schools with sub-branches, tags, and culture variants. Schools are useful for player identity, NPC teaching, faction reactions, UI tabs, unlock paths, and worldbuilding. Tags are more important for actual system logic because one spell or rune can support many systems at once.

## 5.1 School Map

| **School**          | **Sub-Branches**                                                   | **Primary Gameplay Roles**                                               |
|---------------------|--------------------------------------------------------------------|--------------------------------------------------------------------------|
| Elemental           | Fire, frost, lightning, earth, wind, water.                        | Combat, furnaces, mining, weather influence, hazard control, defence.    |
| Nature              | Plants, beasts, soil, seasons, healing, growth, fertility.         | Farming, food stability, animal care, village morale, forest structures. |
| Rune                | Inscription, control, logic, warding, machine rules, locks.        | Automation, magic blocks, door logic, wards, machines, building support. |
| Arcane              | Raw mana, research, portals, spell theory, enchantment basics.     | Mana systems, codex unlocks, artifacts, advanced spellcasting.           |
| Divine/Spirit       | Shrines, blessings, spirits, ancestors, protection, morale.        | Village protection, healing, festivals, spirit events, cultural rites.   |
| Shadow/Blood        | Fear, sacrifice, curses, blood catalysts, dark bargains.           | Forbidden power, dark automation, faction consequences, villain paths.   |
| Necromancy          | Death, bones, spirits, undead labour, grave sites, soul anchors.   | Forbidden workers, undead enemies, dark rituals, haunted settlements.    |
| Golemancy           | Constructed workers, cores, commands, ownership, job profiles.     | Hauling, mining, guarding, construction, repair, automation support.     |
| Alchemy             | Reagents, catalysts, potions, explosives, medicine, transmutation. | Consumables, fuels, cures, blast powder, mana binders, risky recipes.    |
| Enchanting          | Persistent item/block empowerment and socketed effects.            | Gear upgrades, warded blocks, preservation, tool bonuses.                |
| Portal/Ritual       | Multi-block events, gates, stabilisers, location/time rules.       | Dimensions, long-distance travel, major story gates, city-scale magic.   |
| Dream/Fate/Illusion | Memory, omen, prophecy, mind, dreams, deception.                   | Later-game stories, dream realm, culture arcs, illusions, warnings.      |
| Culture-Specific    | Local expressions of the above schools.                            | Dwarven runeforging, forest shrine magic, desert mirage rites.           |

## 5.2 Tag System

| **Tag Type** | **Example Tags**                                                                                                          | **Used By**                                                   |
|--------------|---------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------|
| Role         | combat, utility, crafting, automation, ward, ritual, exploration, farming, mining, building, healing, transport           | Spellbook filters, tutorial, recipe links, NPC job use.       |
| School       | elemental, nature, rune, arcane, divine, spirit, shadow, blood, necromancy, golemancy, alchemy, enchanting, portal, dream | School tabs, unlock paths, perks, faction/culture preference. |
| Risk         | safe, unstable, corrupting, forbidden, cursed, explosive, overload, sacrifice, witness-reactive                           | Warnings, village laws, difficulty scaling, faction reaction. |
| Target       | self, ally, enemy, block, area, structure, machine, storage, village, ritual-site, road, crop                             | Targeting UI and interaction validation.                      |
| Progression  | starter, copper-tier, iron-tier, mana-tier, steel-tier, magitech, realm, void, celestial, endgame                         | Unlock views and balance bands.                               |
| Discovery    | known, hinted, hidden, npc-taught, researched, ruin-found, faction-locked, culture-locked, boss-locked, dimension-locked  | Codex, recipe book, journal, tutorial hints.                  |
| Automation   | mana-fuel, conduit-compatible, machine-rune, filter-rune, ward-link, battery-compatible, warehouse-compatible             | Machine UI, route validation, supply contracts.               |
| Village      | npc-taught, npc-cast, village-request, ward-project, shrine-use, law-sensitive, reputation-positive, fear-generating      | Village simulation and reputation logic.                      |

# 6. Mana, Energy, and Magical Resources

Mana is the shared name for the world's magical energy. It exists as personal casting power, physical resource, machine fuel, ritual input, ward supply, village stock, dimension key, and environmental force. The system should distinguish between the player's personal mana pool and external mana stored in crystals, dust, conduits, batteries, wards, shrines, and later leylines.

| **Mana Layer**        | **Locked Direction**                                                                                                                                       |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Personal Mana         | A player resource for direct casting. It regenerates slowly and can be improved by rest, food, gear, shrines, school mastery, and perks.                   |
| External Mana         | Physical energy stored in crystals, dust, batteries, ward cores, conduits, reservoirs, and leylines. Used by machines, wards, rituals, and infrastructure. |
| Mana Crystal          | A core mid-game resource that stays useful forever as fuel, component, ward supply, machine input, ritual material, trade good, and village request item.  |
| Purity                | Purity affects mana yield, ritual stability, corruption risk, machine efficiency, enchanting quality, and some spell outputs.                              |
| World Nodes           | Mana appears as ore blocks, crystal clusters, large deposits, leylines, magical wells, ruin veins, and dimension-linked sources.                           |
| Mana Storage          | Storage uses mana batteries, crystal tanks, ward cores, shrines, conduits, and late-game leyline reservoirs.                                               |
| Environmental Effects | Concentrated mana can cause crop mutations, monster attraction, corruption, weather anomalies, accelerated growth, and magical hazards.                    |
| Leylines              | Late-game static world infrastructure used for large rituals, city-scale magic, portals, regional automation, and world-shaping projects.                  |

## 6.1 Physical Mana Progression

The standard physical mana chain for early and POC content is: Raw Mana Crystal -\> Mana Shard -\> Mana Dust -\> Basic Rune / Ward Core / Mana Furnace input. Later systems expand this into mana batteries, purified crystals, unstable crystals, realm-touched mana, void shards, dream motes, and celestial cores.

## 6.2 Purity and Stability

Purity should begin as a simple quality property rather than a complex chemistry simulation. First-pass bands can be Impure, Standard, Pure, and Flawless. Low purity reduces output or increases risk; high purity improves ritual stability, machine efficiency, spell quality, and enchantment strength.

# 7. Magic Progression and Unlocks

Magic appears after basic survival and/or discovery. It should feel like the player uncovers an ancient practical science rather than instantly choosing a class at spawn. Progression can come from use, school knowledge, NPC mentors, ruins, books, research, faction trust, village growth, bosses, dimensions, tools, and resources.

| **Progression Band**   | **Magic Role**                                                                                                                    | **Example Unlocks**                                                          |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Starter                | No full magic at spawn. Player may find glowing resources, minor scrolls, ruins, or village rumours.                              | Spark Bolt scroll, Strange Crystal, Stone Sense hint, old rune carving.      |
| Copper/Iron            | Basic survival and crafting make magic understandable. Mage NPCs and ruins become practical unlock sources.                       | Rune Table, Basic Rune, Mana Shard, Ward Lantern, Mana Furnace.              |
| Mana Tier              | Mana becomes a functional infrastructure path with wards, conduits, basic spellcasting, magic recipes, and village mage projects. | Mana Furnace chain, warded watchtower, mana conduit, magic stock.            |
| Steel/Magitech         | Magic joins stronger industry. Rune logic, machine runes, safer storage, and advanced stations appear.                            | Rune filters, mana battery, arcane assembler, ward tower upgrades.           |
| Mythril/Realm          | Realm materials and specialised schools unlock stronger focuses, advanced enchantments, golems, and portals.                      | Mythril focus, dream glass, fae seed rituals, golem core.                    |
| Void/Celestial/Endgame | Magic becomes world-shaping, dangerous, political, and civilisation-scale.                                                        | Leyline reservoirs, floating city anchors, realm gates, celestial artifacts. |

## 7.1 Unlock Sources

| **Unlock Source**     | **How It Works**                                                                                                                              |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Ruin Discovery        | Player finds books, carvings, broken machines, inactive portals, strange crystals, or ritual remnants.                                        |
| NPC Teaching          | Village mages, priests, alchemists, scholars, golemancers, faction specialists, and travellers teach content when trust or payment is earned. |
| Research              | Research desks, rune tables, libraries, experiments, sample analysis, and field notes unlock safer recipes and spell variants.                |
| Faction/Culture Trust | Certain schools and rituals are taught only by cultures that respect or fear the player enough.                                               |
| Bosses and Dungeons   | Rare schools, dangerous rituals, advanced focuses, and dimension gates can require boss drops or dungeon knowledge.                           |
| Experimentation       | Players can discover limited recipes through materials and stations, but risky/forbidden combinations may fail or cause warnings.             |
| Village Growth        | Mage buildings, shrines, libraries, alchemy labs, portal sanctums, and cultural archives unlock new magic as settlements grow.                |

| **No Single Mandatory Track**                                                                                                                                                                                                                             |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The same magic capability may be discoverable through more than one route. For example, Basic Rune might be found in a ruin, taught by a village mage, researched from Mana Dust, bought from a mage faction, or unlocked through a village ward project. |

# 8. Spellcasting, Focuses, and Loadouts

Spellcasting uses a hybrid system. The player can know many spells, but only equip a limited active loadout at once. Simple magic can be cast directly, while stronger effects require focuses, scrolls, runes, components, stations, rituals, or infrastructure. This keeps magic flexible without turning the UI into a giant menu.

| **Casting Layer** | **Locked Direction**                                                                                                                      |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| Known Library     | All learned spells appear in the codex/spellbook with school, tags, costs, unlock notes, and hints.                                       |
| Active Loadout    | The player equips a limited number of active spells to prevent UI overload and make preparation matter.                                   |
| Focus Items       | Simple spells can be cast directly, while stronger spells require wand, staff, spellbook, rune tool, relic, or station.                   |
| Scrolls and Items | Scrolls, charms, potions, relics, and runestones allow single-use or item-based magic without full school investment.                     |
| Costs             | Costs can include personal mana, external mana, components, cooldowns, focus durability, ritual inputs, or moral/forbidden costs.         |
| Targeting         | Magic uses aim-based projectiles, area placement, block targeting, structure targeting, ally/enemy targeting, and machine/ward targeting. |
| Improvement       | Spells improve through use, school knowledge, better focus quality, mana purity, research, mentor quests, and resources.                  |

## 8.1 Focus Types

| **Focus Type** | **Use**                                                               | **Notes**                                                      |
|----------------|-----------------------------------------------------------------------|----------------------------------------------------------------|
| Bare Hands     | Starter or minor utility spells.                                      | Low power; no equipment dependency.                            |
| Wand           | Fast, focused spellcasting.                                           | Lower durability/charge, good for utility or small combat.     |
| Staff          | Stronger and more stable casting.                                     | Better range, ward support, ritual participation.              |
| Spellbook      | Prepared and researched spells.                                       | Good for complex schools, hints, and scholar play.             |
| Rune Tool      | Rune inscription, machine tuning, ward links, and block interactions. | Key tool for mage-engineer playstyle.                          |
| Relic          | Unique effects, story gates, culture unlocks, or dangerous power.     | Usually rare, risky, faction-linked, or boss/dimension reward. |

# 9. Utility Magic

Utility magic is more important than combat for the identity of this game. A magical system that only makes enemies die faster would not support the core hook. Magic should help the player gather, build, farm, repair, protect, organise, travel, supply villages, and solve environmental problems.

| **Utility Category**  | **Supported Uses**                                                                                                                   |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| Mining                | Ore sensing, vein revealing, stone cracking, safe excavation, special material harvesting, and auto-mining support.                  |
| Farming               | Soil fertility, irrigation, growth boosts, crop protection, magical crops, pest control, season support, and village food stability. |
| Building              | Blueprint assistance, temporary scaffolds, block shaping, minor levitation, repair, warded structures, and NPC project support.      |
| Village Defence       | Ward lanterns, barrier stones, alarm glyphs, anti-monster lights, guard buffs, healing, watchtower upgrades, and warded gates.       |
| Roads and Trade       | Warded roads, safe-lamps, waystones, courier speed, weather protection, anti-bandit wards, and route safety markers.                 |
| Storage and Logistics | Sorting glyphs, magic chests, preservation seals, item conduits, warehouse permissions, anti-theft seals, and later portal storage.  |
| Food and Medicine     | Preservation, cooking buffs, minor healing, cleansing disease, NPC medicine, morale, shrine blessings, and village survival.         |
| Weather               | Limited, costly mid/late-game rituals for rain, storm calming, crop protection, ritual timing, and village event management.         |

# 10. Combat Magic, Gear, and Status Effects

Combat magic remains meaningful, especially for raids, bosses, dungeons, magical enemies, and defensive play. However, combat magic should be balanced so it does not trivialise weapons, armour, guards, wards, traps, NPCs, or preparation. The strongest combat magic should connect to cost, skill, school mastery, focus quality, mana purity, components, and risk.

| **Combat Layer** | **Locked Direction**                                                                                                              |
|------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Combat Role      | Combat magic matters, but utility and infrastructure remain the identity anchor.                                                  |
| Weapons          | Wands, staves, spellbooks, enchanted weapons, rune tools, relics, scrolls, charms, and hybrid magitech weapons exist.             |
| Armour           | Robes, light armour, heavy enchanted armour, ward slots, mana bonuses, resistance sets, and casting penalties exist.              |
| Enemy Casters    | Shamans, necromancers, cultists, spirits, village mages, magical beasts, faction casters, and realm enemies use magic.            |
| Raid AI          | Intelligent raiders may target wards, batteries, conduits, shrines, mage towers, and mana stores when those systems matter.       |
| Status Effects   | Burn, freeze, shock, poison, rooted, blessed, cursed, corrupted, warded, silenced, slowed, frightened, inspired, and cleansed.    |
| Friendly Fire    | Controlled by world settings; dangerous spells, explosives, rituals, and forbidden magic can harm allies or villages.             |
| Block Damage     | Basic spells avoid griefing by default; fire, explosions, corruption, siege spells, bosses, and harsh settings can damage blocks. |

## 10.1 Status Effect Direction

Status effects should be shared between spells, potions, traps, monster abilities, rituals, wards, and environmental hazards where practical. This prevents duplicate systems and makes UI readable.

| **Status Effect** | **Purpose**                                                                  |
|-------------------|------------------------------------------------------------------------------|
| Burn              | Fire damage over time and possible hazard interaction.                       |
| Freeze            | Slows or locks movement, affects water/weather, may preserve food.           |
| Shock             | Interrupts, chains through conductive blocks, can overload small machines.   |
| Rooted            | Nature control effect that holds enemies or stabilises soil/crops.           |
| Blessed           | Positive divine/spirit state improving morale, protection, or healing.       |
| Cursed            | Negative occult state from forbidden magic, rituals, enemies, or relics.     |
| Corrupted         | Dangerous state that may spread, mutate, damage, or destabilise systems.     |
| Warded            | Protected by active ward infrastructure or temporary spell effects.          |
| Silenced          | Prevents or weakens spellcasting.                                            |
| Inspired          | Positive morale/combat/crafting boost from village magic, shrine, or ritual. |

# 11. Rune Magic, Enchanting, and Alchemy

Rune Magic, Enchanting, and Alchemy are closely related but should stay distinct enough for players to understand them. Runes control patterns and systems, enchantments empower objects, and alchemy transforms ingredients. All three can overlap through recipes, stations, and research.

| **Branch**      | **Locked Direction**                                                                                                                             |
|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Rune Magic      | Controls patterns, logic, machines, wards, permissions, locks, delivery rules, doors, conduits, and magic infrastructure.                        |
| Enchanting      | Imbues items or blocks with persistent effects, sockets, charges, affinities, resistance, durability changes, and special behaviours.            |
| Alchemy         | Transforms reagents and catalysts into potions, medicine, fuels, explosives, oils, binders, transmutation outputs, and risky mixtures.           |
| Separation Rule | Runes control systems and patterns; enchantments empower objects; alchemy transforms ingredients. They can overlap but remain readable.          |
| Risk Rule       | Alchemy, forbidden runes, low purity, unstable catalysts, and interrupted rituals can create waste, curses, corruption, explosions, or warnings. |

## 11.1 Early Rune Examples

| **Rune**       | **Role**                                                                     | **POC/Timing** |
|----------------|------------------------------------------------------------------------------|----------------|
| Basic Rune     | General first rune for simple magic recipes, Mana Furnace, and Ward Lantern. | POC Required   |
| Ward Rune      | Defensive inscription for Ward Lantern/Stone and village protection.         | POC Required   |
| Machine Rune   | Machine control, mode, efficiency, or safety upgrade.                        | Alpha          |
| Lock Rune      | Ownership, chest, door, warehouse, and anti-theft permissions.               | Alpha          |
| Stability Rune | Reduces overload and ritual/machine instability.                             | Alpha          |
| Growth Rune    | Nature/farming support, crop stability, and soil improvement.                | Alpha/Beta     |

# 12. Rituals, Portals, Dimensions, and World Events

Rituals are the bridge between magic and world state. They should not feel like invisible crafting recipes. A ritual is a visible event that uses blocks, items, timing, location, participants, mana, risk, and story context to create a meaningful result. Rituals are also the natural route into portals, dimensions, village blessings, corruption cleansing, weather influence, and major endgame projects.

| **Ritual Layer** | **Locked Direction**                                                                                                                                  |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ritual Structure | Rituals require physical blocks such as ritual anchors, carved stones, ward cores, portal frames, shrines, or culture-specific layouts.               |
| Inputs           | Inputs include mana, catalysts, runes, offerings, realm materials, tools, participant roles, timing, location, and story state.                       |
| Process          | Rituals are timed, interruptible, visible, risky, and may require defending the site or maintaining power.                                            |
| Outputs          | Outputs may include cleansed areas, ward networks, weather influence, awakened bosses, opened gates, blessed villages, or disasters.                  |
| Failure          | Failures are readable and tied to missing resources, low purity, wrong timing, damage, interruption, forbidden catalysts, or overload.                |
| Portals          | Found portals introduce knowledge. Built/stabilised portals are later-game infrastructure with rare resources and rituals.                            |
| Dimensions       | Dimensions require magic progression and reward overworld-relevant materials, blocks, machines, spells, NPC specialists, hazards, and story outcomes. |

## 12.1 Magical World Events

| **Event**             | **Gameplay Role**                                                                    |
|-----------------------|--------------------------------------------------------------------------------------|
| Mana Storm            | Temporary mana surge that boosts magic but risks overload and strange spawns.        |
| Corruption Wave       | Dangerous event that can spread cursed terrain or damage villages without wards.     |
| Spirit Night          | Ancestor/spirit event tied to shrines, village morale, and rare encounters.          |
| Leyline Surge         | Late-game surge that powers large networks and rituals but can destabilise machines. |
| Eclipse Ritual Window | Special timing condition for powerful or forbidden rituals.                          |
| Fae Bloom             | Nature/dream event that changes crops, forests, creatures, and NPC stories.          |
| Void Breach           | Late-game dimensional hazard that threatens regions, portals, and automation.        |

# 13. Magitech, Machines, Automation, and Golems

Magic connects to automation by powering, controlling, upgrading, protecting, stabilising, risking, and expanding machines. It should not erase the mechanical branch. Copper mechanisms, iron machines, water/wind power, and stable non-magical infrastructure should remain useful because they are cheaper, safer, and culturally acceptable in places that fear magic.

| **Magitech Layer** | **Locked Direction**                                                                                                                                 |
|--------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Mana Furnace       | Early magical station for smelting, mana processing, runes, ward cores, magic alloys, and village supply.                                            |
| Mana Conduit       | Physical block that transfers mana with throughput, ownership, damage state, overload risk, and visual feedback.                                     |
| Mana Battery       | Stores external mana for machines, wards, rituals, and later settlements.                                                                            |
| Rune Logic         | Readable filters, locks, delivery rules, permissions, machine modes, alarms, and later logic networks.                                               |
| Machine Upgrades   | Magic can improve efficiency, safety, output quality, fuel type, by-products, protection, automation compatibility, and special recipes.             |
| Risks              | Overload, corruption, instability, cursed outputs, waste, faction concern, shutdown warnings, sabotage, and raid targeting.                          |
| Golems             | Later programmable workers for hauling, mining, guarding, building, repairing, and automation support. POC includes only a controlled teaser object. |

| **POC Golem and Portal Boundary**                                                                                                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The POC may include a broken helper golem and dormant portal frame because they were selected as POC content. They should be teaser-scope objects only: limited, inactive, single-action, or narrative proof-of-future. Full golemancy and full portal/dimension systems remain deferred. |

# 14. Villages, NPC Magic, Culture, and Reputation

Magic is a village system as much as a player system. Village mages, priests, alchemists, scholars, shrine keepers, golemancers, and faction specialists make magic social, political, cultural, and practical. The same spell can be praised in one culture, regulated in another, and outlawed in a third.

| **Village Magic Layer** | **Locked Direction**                                                                                                                           |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Village Mages           | Teachers, ward maintainers, researchers, ritual assistants, healers, cultural specialists, and magic infrastructure workers.                   |
| NPC Casting             | Selected NPCs can heal, defend, craft, maintain wards, teach, perform rituals, and cast culture-specific magic.                                |
| Magic Buildings         | Mage huts, shrines, rune workshops, alchemy labs, ward towers, libraries, ritual circles, golem yards, portal sanctums, and variants.          |
| Resource Consumption    | Villages consume mana crystals, runes, herbs, medicine, ward cores, ritual goods, shrine goods, and culture goods.                             |
| Reputation              | Healing, wards, crop help, cleansing, trade-route protection, and saving villages improve trust. Forbidden magic can create fear or hostility. |
| Magic Laws              | Culture and faction laws govern necromancy, blood magic, mind magic, public spellcasting, dangerous machines, and illegal rituals.             |
| Culture Stories         | Village growth, mage buildings, archives, rituals, specialists, and race-linked dimensions unlock magic lore and story arcs.                   |
| Peaceful Play           | Lighting, farming, healing, animal care, preservation, building help, festivals, comfort items, and cosy village magic remain supported.       |

## 14.1 Example Cultural Magic Styles

| **Culture Style** | **Likely Magic Preference**        | **Gameplay Expression**                                               |
|-------------------|------------------------------------|-----------------------------------------------------------------------|
| Forest Hamlet     | Nature, Rune, Spirit               | Ward Lanterns, crop blessings, simple rune repairs, shrine festivals. |
| Mountain Hold     | Rune, Enchanting, Golemancy        | Rune anvils, warded gates, machine runes, stone golems.               |
| Desert Caravan    | Dream/Fate/Illusion, Divine/Spirit | Mirage wards, oasis rites, omen reading, safe road lamps.             |
| Mage Order        | Arcane, Rune, Ritual               | Research, libraries, portals, mana grids, faction-locked spells.      |
| Dark Cult         | Shadow/Blood, Necromancy           | Forbidden catalysts, cursed machines, fear economy, hidden rituals.   |

# 15. Forbidden Magic, Corruption, Risk, and Morality

Forbidden magic exists because the player fantasy includes freedom, morality, villain paths, consequences, fear, faction conflict, and dark ancient systems. The design should not make forbidden magic merely evil-coloured fireballs. It should be powerful, practical, tempting, dangerous, socially reactive, and world-state changing.

| **Forbidden Layer** | **Locked Direction**                                                                                                                                 |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Necromancy          | Allowed for players but forbidden, risky, fear-generating, faction-reactive, and linked to undead labour, grave sites, spirits, and dark automation. |
| Shadow/Blood        | Powerful magic with costs, corruption, sacrifice themes, fear, faction consequences, curses, and alternative dark story paths.                       |
| Corruption          | A state that can spread through blocks, machines, resources, NPC health, rituals, and events if ignored or exploited.                                |
| Witnesses           | Public forbidden magic can trigger witnesses, guard response, village fear, fines, exile, cult recruitment, rebellion, or faction alerts.            |
| Dark Automation     | Blood-powered machines, necromantic labour, cursed conduits, and corruption engines exist later and create social/environmental consequences.        |
| POC Boundary        | POC includes a cursed item or ruined ritual warning only. Full forbidden systems are deferred.                                                       |

## 15.1 Risk Feedback

Risk should be visible before catastrophe. The player should see warning states such as unstable glow, conduit sparks, ritual misalignment, low purity labels, NPC fear comments, village law warnings, corruption particles, or UI warnings. Sudden random failure should be avoided except in harsh settings or deliberately unstable content.

# 16. UI, Discovery, Codex, and Feedback

The Magic UI should teach through context rather than overwhelming the player at spawn. Before the player discovers mana, most magic UI can remain hidden or minimal. After discovery, the codex, spellbook, rune table, station UI, and village screens gradually reveal the deeper system.

| **UI Layer**       | **Locked Direction**                                                                                                     |
|--------------------|--------------------------------------------------------------------------------------------------------------------------|
| Mana Display       | Shows personal mana, external fuel where relevant, recharge state, and warnings.                                         |
| Spellbook/Codex    | Shows learned spells, schools, active slots, costs, unlock hints, tags, lore, and upgrade paths.                         |
| Rune UI            | Rune Table and machine UI display rune slot, effect, power use, compatibility, purity, warnings, and recipe links.       |
| Ritual UI          | Shows required structure, missing components, participants, timing, location, risk, progress, and failure warnings.      |
| Village Magic UI   | Village overview can show ward status, magic stock, mage buildings, shrine morale, laws, and magical threats.            |
| Discovery Feedback | Ruins, books, scrolls, NPC teaching, research notes, experiments, bosses, dimensions, and recipe hints update the codex. |
| POC UI             | Basic mana display, known spell/rune list, mana furnace UI, ward feedback, quest/codex hint, and simple warning text.    |

# 17. Proof-of-Concept Magic Scope

The POC should be small but connected. It must prove that magic has a reason to exist inside the survival, village, and automation loop. It should not try to implement every school. It should prove one resource chain, one station, one rune, one ward, one utility spell, one combat spell, one mage NPC, one magical ruin, and one changed village outcome.

## 17.1 Required POC Magic Content

| **POC Element**     | **Purpose**                                                                                                            |
|---------------------|------------------------------------------------------------------------------------------------------------------------|
| Mana Crystal        | Mineable and tradeable resource used as magic fuel and village request material.                                       |
| Mana Shard/Dust     | Processed outputs used for runes, ward cores, and mana furnace recipes.                                                |
| Basic Rune          | First rune item and/or inscription used for Mana Furnace, Ward Lantern, and basic machine/magic interactions.          |
| Rune Table          | POC station where Basic Rune is crafted after discovery or NPC teaching.                                               |
| Mana Furnace        | POC magical processing station that proves mana-powered crafting and iron/magic support.                               |
| Ward Lantern/Stone  | Functional defensive block that improves village safety or raid outcome when supplied.                                 |
| Utility Spell       | Stone Sense or similar spell that helps locate ore/mana or inspect blocks.                                             |
| Combat Spell        | Spark Bolt or similar simple spell with clear mana cost and cooldown.                                                  |
| Village Mage        | NPC who teaches Basic Rune and explains warding after reputation or quest progress.                                    |
| Magic Note/Book     | Knowledge item that unlocks or hints at Rune Table, Basic Rune, or Mana Furnace.                                       |
| Magical Ruin        | Small ruin containing magic discovery, cursed warning, portal/golem teaser, and mana crystal source.                   |
| Mana Conduit        | Simple physical link between mana source/storage and a ward or mana furnace.                                           |
| Golem Worker Teaser | A broken or heavily limited helper object. It may demonstrate a single hauling/repair action but not full golemancy.   |
| Portal Teaser       | Dormant or unstable portal frame that shows activation feedback or local test behaviour, but no full dimension system. |

## 17.2 Explicit POC Deferrals

| **Deferred Feature**            | **Boundary**                                                                   |
|---------------------------------|--------------------------------------------------------------------------------|
| Full School Trees               | Deferred. POC uses one or two spell examples and basic rune knowledge.         |
| Full Enchanting                 | Deferred. POC can mention future enchantment but does not implement it.        |
| Full Alchemy                    | Deferred. POC may use mana dust processing, but no full potion/reagent system. |
| Full Golemancy                  | Deferred. POC has teaser-scope golem object only.                              |
| Necromancy/Dark Paths           | Deferred. POC has one cursed warning item or ruined ritual story sign.         |
| Full Portals/Dimensions         | Deferred. POC has dormant/unstable portal object only.                         |
| Leyline Networks                | Deferred. Leylines can be lore text or visible distant clue only.              |
| Weather Rituals                 | Deferred. Weather magic is mid/late-game.                                      |
| Large Ritual Structures         | Deferred. POC may show a small ruined circle but not full ritual building.     |
| Complex Rune Logic              | Deferred. POC runes are simple components, not redstone-like logic.            |
| Magical Multiplayer Permissions | Deferred beyond data planning.                                                 |

# 18. Detailed Magic Registry v0.1

This first-pass registry is not the final content count. It defines enough magic entries to align the POC, Alpha expansion, and future full-game systems. All values are design draft values and should later move into spreadsheet/database format with exact numeric tuning.

| **ID**                          | **Display Name**           | **Type**            | **Planning Status** | **Purpose / Description**                                                                                     |
|---------------------------------|----------------------------|---------------------|---------------------|---------------------------------------------------------------------------------------------------------------|
| school.elemental                | Elemental Magic            | School              | Final Game          | Fire, frost, lightning, earth, wind, and water magic for combat, utility, machines, hazards, and environment. |
| school.nature                   | Nature Magic               | School              | Final Game          | Farming, animals, soil, healing, crop safety, forests, seasons, and food stability.                           |
| school.rune                     | Rune Magic                 | School              | POC Required        | The first practical school for Basic Rune, Rune Table, Mana Furnace, wards, conduits, and automation links.   |
| school.arcane                   | Arcane Magic               | School              | Alpha               | Raw mana theory, research, spell structure, artifacts, portals, and advanced casting.                         |
| school.divine_spirit            | Divine/Spirit Magic        | School              | Final Game          | Shrines, blessings, protection, spirits, ancestors, morale, and cultural rites.                               |
| school.shadow_blood             | Shadow/Blood Magic         | School              | Deferred            | Forbidden power tied to cost, corruption, fear, sacrifice, and faction consequences.                          |
| school.necromancy               | Necromancy                 | School              | Deferred            | Forbidden death magic, undead labour, haunted sites, soul anchors, and dark path content.                     |
| school.golemancy                | Golemancy                  | School              | Deferred            | Constructed worker magic for golem cores, job profiles, commands, and labour automation.                      |
| school.alchemy                  | Alchemy                    | Crafting Magic      | Alpha               | Potion, catalyst, medicine, explosive, transmutation, reagent, and fuel transformation system.                |
| school.enchanting               | Enchanting                 | Crafting Magic      | Alpha               | Item/block imbuement through sockets, charges, affinities, and persistent magical properties.                 |
| school.portal_ritual            | Portal/Ritual Magic        | School              | Deferred            | Multi-block ritual and portal infrastructure for dimensions and major world state changes.                    |
| school.dream_fate_illusion      | Dream/Fate/Illusion Magic  | School              | Final Game          | Memory, prophecy, dreams, deception, omens, and later realm/race story magic.                                 |
| resource.mana_crystal           | Mana Crystal               | Resource            | POC Required        | Core physical mana source, fuel, trade good, ward input, machine input, and ritual material.                  |
| resource.mana_shard             | Mana Shard                 | Resource            | POC Required        | Processed shard from Mana Crystal used for Basic Rune and mana recipes.                                       |
| resource.mana_dust              | Mana Dust                  | Resource            | POC Required        | Fine mana material used in runes, ward cores, mana furnace recipes, and magic crafting.                       |
| item.rune.basic                 | Basic Rune                 | Rune                | POC Required        | First rune component for Rune Table, Mana Furnace, Ward Lantern/Stone, and basic magic unlocks.               |
| item.rune.ward                  | Ward Rune                  | Rune                | POC Required        | Rune used to craft or power a basic defensive ward block.                                                     |
| item.rune.machine               | Machine Rune               | Rune                | Alpha               | Controls simple machine modes, fuel efficiency, filtering, and magitech upgrades.                             |
| item.rune.lock                  | Lock Rune                  | Rune                | Alpha               | Ownership, permission, door, chest, warehouse, and anti-theft magic.                                          |
| item.rune.stability             | Stability Rune             | Rune                | Alpha               | Reduces overload, corruption, and ritual/machine instability.                                                 |
| block.rune_table                | Rune Table                 | Magic Station       | POC Required        | Station for Basic Rune and early rune recipes, unlocked through ruin or village mage teaching.                |
| block.mana_furnace              | Mana Furnace               | Magic Station       | POC Required        | Mana-powered furnace for magic processing, early magitech, and POC resource chain support.                    |
| block.ward_lantern              | Ward Lantern               | Ward Block          | POC Required        | Fuelled protective lantern that reduces monster pressure and improves village raid safety.                    |
| block.ward_stone                | Ward Stone                 | Ward Block          | POC Required        | Sturdier defensive ward block for village defence and future ward networks.                                   |
| block.mana_conduit.basic        | Basic Mana Conduit         | Mana Network        | POC Required        | Simple conduit that links mana source/storage to a ward or mana furnace.                                      |
| block.mana_battery              | Mana Battery               | Mana Storage        | Alpha               | Stores mana for wards, machines, rituals, and later village magic infrastructure.                             |
| block.ritual_anchor             | Ritual Anchor              | Ritual Block        | Deferred            | Multi-block ritual centre for cleansing, portal, weather, ward, and world-state rituals.                      |
| block.portal_frame.dormant      | Dormant Portal Frame       | Portal Block        | POC Teaser          | Ruin object that hints at portals and may show activation feedback without opening a full dimension.          |
| block.corrupted_ground          | Corrupted Ground           | Hazard Block        | POC Teaser          | Small ruined ritual hazard showing forbidden magic consequences and future cleansing systems.                 |
| spell.spark_bolt                | Spark Bolt                 | Combat Spell        | POC Required        | Simple aimed projectile with mana cost and cooldown. Useful against goblins and cave threats.                 |
| spell.stone_sense               | Stone Sense                | Utility Spell       | POC Required        | Reveals nearby ore/mana clues or highlights resource blocks for a short duration.                             |
| spell.mend_minor                | Mend Minor                 | Utility Spell       | Alpha               | Repairs minor block, tool, or machine damage using mana and materials.                                        |
| spell.ward_pulse                | Ward Pulse                 | Defence Spell       | Alpha               | Temporarily boosts ward range or repels weak monsters.                                                        |
| spell.cleanse_blight            | Cleanse Blight             | Utility Spell       | Alpha               | Reduces corruption on blocks, crops, or NPCs when paired with materials or shrine support.                    |
| spell.verdant_touch             | Verdant Touch              | Nature Spell        | Alpha               | Improves soil fertility or speeds safe crop growth.                                                           |
| spell.heal_wound                | Heal Wound                 | Divine/Spirit Spell | Alpha               | Heals player or NPC injuries with mana, cooldown, and possible reagent cost.                                  |
| effect.burn                     | Burn                       | Status Effect       | Alpha               | Fire damage over time, hazard interaction, and possible block/fire risk on harsh settings.                    |
| effect.warded                   | Warded                     | Status Effect       | POC Required        | Protected state from Ward Lantern/Stone, reducing certain monster or raid effects.                            |
| effect.corrupted                | Corrupted                  | Status Effect       | POC Teaser          | Risk state from cursed resources, rituals, forbidden magic, or corrupted terrain.                             |
| npc.village_mage.forest         | Forest Hamlet Mage         | NPC Magic Profile   | POC Required        | Teaches Basic Rune, explains Mana Crystal, maintains Ward Lantern, and provides magic requests.               |
| item.knowledge.rune_note        | Old Rune Note              | Knowledge Item      | POC Required        | Ruin note that hints at Rune Table, Basic Rune, Ward Lantern, or Mana Furnace.                                |
| item.cursed_warning             | Cracked Blood-Sealed Charm | Forbidden Teaser    | POC Teaser          | Cursed item warning that hints forbidden magic without unlocking a full dark path.                            |
| object.golem.broken_helper      | Broken Helper Golem        | Golem Teaser        | POC Teaser          | Limited or inactive golem object used to foreshadow future Golemancy without full control systems.            |
| ritual.ward_settlement_minor    | Minor Settlement Ward      | Ritual              | Alpha               | Future multi-block ritual to empower village wards through mana, runes, and mage assistance.                  |
| ritual.cleanse_corruption_minor | Minor Cleansing Rite       | Ritual              | Alpha               | Future ritual to cleanse small corrupted areas or ruined structures.                                          |
| ritual.wake_dormant_portal      | Wake Dormant Portal        | Portal Ritual       | Deferred            | Future ritual for stabilising found portal frames with rare resources and story gates.                        |
| structure.magic_ruin.small      | Small Rune Ruin            | Structure           | POC Required        | Small discovery site containing Mana Crystal, Old Rune Note, Dormant Portal Frame, and cursed warning.        |

# 19. Core POC Scenario: Forest Hamlet Ward Loop

This scenario describes how the POC magic slice should be experienced. It connects the player, ruin, village mage, mana resource, rune crafting, Mana Furnace, Ward Lantern, automation support, watchtower construction, and goblin raid outcome.

1.  The player discovers a small rune ruin near the forest hamlet or cave route.

2.  The ruin contains Mana Crystal, an Old Rune Note, a dormant portal frame, and a cursed warning object.

3.  The player brings the note or Mana Crystal to the village mage, earning the Basic Rune recipe or Rune Table hint.

4.  The player processes Mana Crystal into Mana Shard/Dust and crafts Basic Rune at the Rune Table.

5.  The player builds or upgrades a Mana Furnace, proving that magic can process resources and support the iron/village supply chain.

6.  The player crafts a Ward Lantern or Ward Stone and connects it to a simple mana source through a Basic Mana Conduit.

7.  The ward improves the village's safety score, reduces night threat near the watchtower, or gives guards a defence bonus.

8.  During the POC raid, the completed watchtower plus powered ward changes the outcome: fewer damaged blocks, fewer NPC injuries, better guard survival, and improved reputation.

9.  The broken golem and dormant portal remain visible as future-system teasers, not full POC mechanics.

## 19.1 POC Result States

| **Preparation State**             | **Raid Outcome Direction**                                                                     | **Player Feedback**                                  |
|-----------------------------------|------------------------------------------------------------------------------------------------|------------------------------------------------------|
| No watchtower, no ward            | Village is vulnerable; guards struggle; more damage and injuries occur.                        | Request board and elder explain missing preparation. |
| Watchtower built, no ward         | Village defends better but night monsters or raiders can still cause damage.                   | Watchtower visibly helps guards.                     |
| Ward powered, no watchtower       | Monsters are deterred near ward radius, but ranged defence and guard visibility are weaker.    | Ward light and safety score show value.              |
| Watchtower built and ward powered | Best POC outcome: fewer injuries, less block damage, better guard survival, higher reputation. | Elder, mage, and guards react positively.            |
| Ward damaged or out of mana       | The village loses magical protection until repaired or refuelled.                              | UI alert, dim ward visuals, and mage request appear. |

# 20. Balancing Rules

| **Rule**             | **Direction**                                                                                                                                    |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Readability First    | Early magic should be understandable through visible resources, simple recipes, clear UI, and NPC explanation.                                   |
| Infrastructure Value | At least half of early magic should support gathering, crafting, farming, defence, villages, or automation rather than combat.                   |
| No Free Replacement  | Magic supports tools, machines, and NPC labour. It should not instantly replace mining, crafting, automation, or building.                       |
| Mana Economy         | Mana Crystals must stay useful beyond early magic as fuel, trade goods, ward inputs, ritual components, and machine resources.                   |
| Risk Is Predictable  | Overload, corruption, ritual failure, and forbidden magic should use warnings and readable causes rather than random punishment.                 |
| Culture Matters      | A spell's social meaning depends on culture/faction law and witness context, not only its mechanical effect.                                     |
| POC Constraint       | POC magic must be small but connected: one resource chain, one utility spell, one combat spell, one ward, one mage, one ruin, one magic station. |

# 21. Open Questions for Later Documents

- How many active spell slots should the player start with, and how many can be unlocked later?

- Should mana regeneration pause during combat, slow during combat, or continue normally?

- Should spell schools have perk trees inside the wider player progression system or separate school mastery pages?

- How destructive should magic be by default in multiplayer worlds?

- How much UI should be available before the player discovers the first magical source?

- What exact numerical purity bands should Mana Crystals use?

- Should village mages be required to maintain wards, or can player-built wards run unattended?

- Should the first combat spell be Spark Bolt, Ember Dart, Rune Spark, or another name?

- Should the first utility spell be Stone Sense, Mana Sense, Ore Whisper, or another name?

- Should the POC golem teaser be a broken object, a single-route hauler, or a repairable non-combat helper?

- Should the POC portal teaser be purely inactive, local teleport only, or a visual effect with no destination?

# Appendix A. POC Magic Checklist

| **Checklist Item**  | **Status / Notes**                                                                            |
|---------------------|-----------------------------------------------------------------------------------------------|
| Resource Link       | Player can gather Mana Crystal and process it into Mana Shard/Dust.                           |
| Knowledge Link      | Player learns Basic Rune through village mage, ruin note, or research hint.                   |
| Station Link        | Rune Table and Mana Furnace are functional and understandable.                                |
| Infrastructure Link | Ward Lantern/Stone can be powered and visibly affects village safety or raid outcome.         |
| Automation Link     | Basic Mana Conduit or mana-powered station demonstrates magic-machine connection.             |
| NPC Link            | Village Mage explains magic, teaches or unlocks a recipe, and reacts to village needs.        |
| Combat Link         | One combat spell works with mana cost/cooldown and enemy interaction.                         |
| Utility Link        | One utility spell helps gather, inspect, mine, or discover resources.                         |
| Risk Link           | One cursed warning or ruined ritual shows that forbidden magic has consequences.              |
| Future Teaser       | Broken golem and dormant portal hint at future systems without requiring full implementation. |

# Appendix B. Magic Database Field Templates

| **Template**       | **Fields**                                                                                                                                                                                                                                                                  |
|--------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| SpellEntry         | spell_id, display_name, school_id, tier, role_tags, mana_cost, component_cost, cooldown, cast_method, focus_required, target_type, range, area, effect_ids, block_interactions, npc_use, automation_use, unlock_method, risk_tags, UI_text, planning_status                 |
| RuneEntry          | rune_id, display_name, school_id, tier, material_inputs, mana_charge, purity_requirement, slot_type, compatible_blocks, compatible_machines, ward_effect, automation_effect, risk_tags, unlock_method, planning_status                                                      |
| RitualEntry        | ritual_id, display_name, school_tags, tier, structure_requirements, inputs, mana_requirement, location_rules, timing_rules, participant_roles, duration, interruption_rules, output_effects, world_state_changes, failure_states, risk_tags, unlock_method, planning_status |
| MagicBlockEntry    | block_id, display_name, category, tier, mana_storage, mana_throughput, ports, radius, ownership_rules, damage_states, overload_rules, corruption_rules, UI_fields, crafting_recipe, unlock_method, planning_status                                                          |
| MagicResourceEntry | resource_id, display_name, category, family, tier, rarity, source, purity_range, refinement_path, mana_value, ritual_role, machine_role, village_use, corruption_risk, trade_value, planning_status                                                                         |
| NPCMagicProfile    | npc_magic_id, species_or_culture, preferred_schools, castable_spells, teaching_unlocks, ward_tasks, ritual_roles, law_reactions, shop_stock, quest_hooks, reputation_requirements, planning_status                                                                          |

# Appendix C. Cross-System Use Matrix

| **Connected System** | **Magic System Requirement**                                                                                                                   |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Blocks               | Magic blocks are placed, powered, damaged, repaired, overloaded, corrupted, and integrated into villages and machines.                         |
| Items                | Magic requires components such as mana crystals, dust, runes, catalysts, scrolls, focuses, relics, charms, and ritual objects.                 |
| Recipes              | Rune crafting, alchemy, enchantment, ritual, mana furnace, magic machine, forbidden, culture, and dimension recipes use shared registry rules. |
| Resources            | Mana Crystal, purity, monster essences, forbidden resources, and realm materials form the physical basis of magic progression.                 |
| NPC Villages         | Village mages, wards, shrines, mage buildings, laws, fear, reputation, magical needs, and cultural stories use magic data.                     |
| Automation           | Mana conduits, mana furnaces, batteries, rune logic, machine upgrades, wards, and golems connect magic to factories.                           |
| Combat               | Spells, status effects, enemies, raids, gear, wards, friendly fire settings, and block damage rules connect to combat systems.                 |
| Dimensions           | Portals, rituals, realm materials, dream/void/celestial magic, and culture-linked realms create late-game exploration gates.                   |

# Appendix D. Future Magic Backlog

- Full school mastery trees and sub-branches for every major magic school.

- Complete spell registry with utility, combat, defence, farming, construction, healing, exploration, and ritual spells.

- Full alchemy system with reagents, catalysts, medicines, fuels, explosives, transmutation, waste, and risk.

- Full enchanting system with item/block sockets, durability costs, set effects, and school affinities.

- Full golemancy with cores, bodies, commands, job profiles, ownership, ethics, and faction reactions.

- Full portal/dimension ritual system with stabilisers, realm hazards, keys, bosses, and story gates.

- Leyline mapping, taps, reservoirs, city-scale power, and regional magical infrastructure.

- Forbidden magic paths: necromancy, blood engines, corruption machines, cults, fear economy, and rebellion/faction response.

- Culture-specific magic styles for every race/faction and settlement architecture family.

- Magic law, witness, crime, teaching, licensing, and public casting systems.

- Weather, season, festival, eclipse, omen, and spirit-night magical events.

- Advanced magic UI including school tabs, warnings, ritual planning, village ward overlay, and machine/rune network overlay.

# Appendix E. POC Success Criteria

The magic POC succeeds if a new player can understand why magic matters without reading a design document: a glowing crystal becomes a rune, the rune powers a station, the station supports village defence, the ward visibly protects the village, and the raid outcome changes. The player should leave the POC thinking: magic is not just a weapon; it is how civilisations become stronger, stranger, safer, and more dangerous.
