**Fantasy Voxel Civilisation Sandbox**

**Master Game Design Bible**

*Version 0.1 — Vision Lock Draft*

A high-fidelity fantasy voxel survival civilisation sandbox where survival, magic, automation, NPC life simulation, settlement growth, story, dimensions, and multiplayer all connect into one living world.

# Document Purpose

This document is the master vision bible for the game. It does not replace the detailed system documents that will be created later. Instead, it defines the creative direction, gameplay identity, major pillars, rules of the world, and proof-of-concept target so every later document stays aligned.

The purpose of this draft is to lock the high-level game vision before creating the block registry, item registry, crafting recipes, magic systems, NPC systems, dimensions, races, structures, monsters, and technical implementation plans.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Design Bible Rule</strong></p>
<p>Whenever a later system is unclear, it should be checked against this document. If the system does not support the core fantasy of living NPC civilisations powered by player survival, magic, and automation, it should be simplified, redesigned, or deferred.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# Static Table of Contents

- 1\. Locked Vision Statement

- 2\. Core Identity

- 3\. Player Fantasy

- 4\. World Tone

- 5\. Visual Style

- 6\. Building System

- 7\. NPC World Simulation

- 8\. Village Growth and Consequences

- 9\. Automation System

- 10\. Magic System

- 11\. Technology Progression

- 12\. Danger, Difficulty, and World Risk

- 13\. Death and Recovery

- 14\. Races and Cultures

- 15\. Dimensions and Realms

- 16\. Story Structure

- 17\. Player Morality and Freedom

- 18\. Multiplayer

- 19\. Proof-of-Concept Target

- 20\. Core Design Rules

- 21\. Future Documentation Roadmap

# 1. Locked Vision Statement

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Master Vision</strong></p>
<p>A detailed fantasy voxel survival civilisation sandbox where players gather, build, craft, automate, study magic, explore dimensions, and shape living NPC societies. Villages grow, trade, struggle, build, fight, and unlock race-specific stories as they develop. The player can help, ignore, exploit, conquer, or destroy them. Magic is not just for combat; it powers mining, farming, crafting, machines, logistics, settlement growth, and dimensional progression. The final game supports solo play, co-op, LAN, and split-screen, with scalable difficulty ranging from peaceful cosy building to harsh civilisation survival.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 1.1 The Hook

The strongest unique hook is that player-built production does not exist only to make stronger gear. Magic and factories feed villages, grow settlements, unlock race stories, power civilisations, and change the world state.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Core Hook</strong></p>
<p>Your magic and factories do not just make items — they build civilisations, unlock stories, power settlements, and reshape the world.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 1.2 What the Game Is Not

The game is not intended to be a simple Minecraft clone with extra ores and spells. It should retain the freedom and readability of voxel survival, but the identity comes from interconnected systems: living NPCs, village growth, automation chains, race-specific stories, magical infrastructure, and meaningful world consequences.

The game is also not meant to be a pure factory game. Automation should be powerful and satisfying, but its purpose is broader than efficiency. It should affect settlements, trade, war, story progression, farming, exploration, and dimensional travel.

Finally, it is not a purely linear RPG. Stories exist, but they are discovered through settlement growth, race arcs, village needs, factions, ruins, dimensions, and emergent events rather than being the only reason to play.

# 2. Core Identity

The core identity is a balanced blend of four major game types: survival sandbox, civilisation sandbox, automation/factory game, and fantasy RPG. None of these pillars should completely overpower the others. The goal is to make each pillar feed into the next.

| **Pillar**           | **Role in the Game**                                                                                      | **How It Connects**                                                                                             |
|----------------------|-----------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| Survival Sandbox     | Provides mining, gathering, crafting, building, food, shelter, exploration, and immediate player freedom. | Creates the raw materials and physical world interaction needed for automation, village support, and adventure. |
| Civilisation Sandbox | Makes villages, NPCs, factions, cultures, trade, war, migration, and settlement growth matter.            | Gives resources and automation a world-level purpose beyond personal progression.                               |
| Automation / Factory | Lets the player scale production with machines, logistics, magic engines, golems, and production chains.  | Supplies player bases, villages, trade routes, military defences, and large construction projects.              |
| Fantasy RPG          | Adds magic, quests, races, monsters, bosses, gear, lore, dimensions, and story arcs.                      | Gives exploration, progression, and village growth deeper meaning.                                              |

## 2.1 System Interconnection Requirement

The game should be designed so major systems rarely exist in isolation. A resource should not only be a crafting ingredient. It may also be a village need, trade good, machine input, quest requirement, magical catalyst, or dimension key.

For example, mana crystals may be mined by the player, traded to mages, used in rune engines, required for village wards, consumed by portal gates, and requested by a race-specific story quest. This layered use makes the world feel deeper without requiring every item to be complicated.

## 2.2 The Living World Promise

The world should feel like it exists beyond the player. Villages should have needs, projects, risks, relationships, schedules, and stories. However, the player remains the strongest catalyst. Without the player, settlements can still survive and slowly progress, but they are heavily stunted and more vulnerable.

This creates a strong fantasy: the player is not simply collecting blocks. They are deciding which communities thrive, which factions rise, which stories unlock, and which parts of the world fall into ruin.

# 3. Player Fantasy

The player should not be forced into one identity. The game should support multiple player fantasies at the same time, allowing different playstyles to feel legitimate. One player might become a cosy village builder, while another becomes a mage-industrialist, conqueror, dungeon explorer, or wandering hero.

| **Fantasy Role**         | **Experience It Should Support**                                                                                           |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------|
| Lone Survivor            | Start with almost nothing, gather basic resources, survive the first nights, and build a first shelter.                    |
| Settlement Founder       | Create a base, attract NPCs, build infrastructure, assign jobs, and eventually grow a player-led village or city.          |
| Wandering Adventurer     | Travel between villages, solve problems, explore ruins, complete quests, and discover hidden lore.                         |
| Mage-Engineer            | Combine runes, machinery, mana systems, golems, and automation to create magical infrastructure.                           |
| Chosen Hero              | Follow race and world story arcs, defeat major threats, restore ancient sites, and influence dimensional outcomes.         |
| Neutral World-Shaper     | Choose which factions to support, ignore, exploit, or destabilise without being forced into heroism.                       |
| Future Ruler or Archmage | Command settlements, control trade, build magical networks, unlock high-tier magic, and shape civilisation-scale projects. |
| Villain or Tyrant        | Use forbidden magic, conquer villages, exploit NPCs, side with dangerous factions, or destroy settlements.                 |

## 3.1 Role Freedom

The design should avoid assuming every player wants to be a heroic saviour. The world can react morally and politically to the player, but it should not fake freedom by allowing evil choices without meaningful responses. A player who protects villages should be trusted. A player who robs, conquers, or uses forbidden magic should be feared, hunted, bargained with, or resisted depending on the culture.

## 3.2 Progression Fantasy

The long-term fantasy is escalation. The player begins with hand tools and basic shelter, then gradually gains access to village projects, machine networks, magic schools, golem labour, portals, dimensions, floating cities, and civilisation-scale systems. This gives the game a strong sense of growth without removing sandbox freedom.

# 4. World Tone

The world tone should combine cosy fantasy, danger, wonder, civilisation growth, whimsical magic, dark threats, serious consequences, ancient mysteries, and optional relaxed play. This is not contradictory if each tone appears in the right part of the game.

| **Tone Layer**            | **Where It Appears**                                                                        | **Design Purpose**                                                   |
|---------------------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Cosy Fantasy              | Homes, farms, villages, decorating, festivals, friendly NPCs, peaceful difficulty.          | Makes building and settlement life warm, inviting, and replayable.   |
| Dangerous Survival        | Nights, caves, raids, wild biomes, hostile factions, harsh difficulty.                      | Creates stakes and makes preparation meaningful.                     |
| High Fantasy Adventure    | Magic schools, bosses, race stories, ancient artefacts, dimensions.                         | Gives the world scale and wonder.                                    |
| Medieval Civilisation Sim | Village jobs, trade, construction, politics, faction relations, settlement stages.          | Makes NPC societies feel structured and believable.                  |
| Whimsical Magic           | Fae forests, living items, odd magical creatures, spell experiments, strange dimensions.    | Keeps discovery playful and surprising.                              |
| Dark Consequences         | Village destruction, corruption, conquest, NPC death, forbidden magic, dimensional threats. | Makes the world react seriously when danger is ignored or exploited. |
| Ancient Mystery           | Ruins, lost machines, old portals, buried civilisations, hidden world lore.                 | Gives exploration a deeper historical layer.                         |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Tone Rule</strong></p>
<p>The game should feel cosy when the player creates, dangerous when they explore, epic when civilisations rise, and dark when ancient powers awaken.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

Difficulty settings are important because not every player wants the same balance of cosy and dangerous. A peaceful player should still access building, farming, automation, village development, and story discovery. Higher difficulty should intensify raids, resource pressure, loss, and world danger.

# 5. Visual Style

The game should use a detailed high-fidelity voxel fantasy style. The world should remain readable and buildable like a voxel sandbox, but with better models, lighting, animation, effects, interfaces, and atmosphere than a simple blocky survival game.

## 5.1 Visual Principles

- Voxel terrain and block-based interaction should remain clear and easy to understand.

- Characters, creatures, tools, weapons, machines, and NPCs can use more detailed models than standard blocks.

- Lighting should carry mood: warm village lanterns, glowing mana crystals, eerie ruins, dangerous caves, stormy magical events.

- Magic effects should be visually readable: fire powering furnaces, water flowing into irrigation, runes pulsing through machines, portals opening through dimensional gates.

- UI should feel modern and polished, not like a rough mod menu. It should support complex systems without overwhelming the player.

- Animations should help NPCs feel alive: carrying resources, building, farming, casting, trading, fleeing, celebrating, mourning, repairing, and fighting.

## 5.2 Style Boundaries

The art direction should not chase full realism. Realistic graphics would make block building harder to read and much more expensive to produce. The better target is stylised, readable, atmospheric fantasy voxel art with high-quality presentation.

The game can look richer than Minecraft while keeping the same design advantage: players instantly understand blocks, resources, terrain, and placement.

# 6. Building System

The building system should include every major building approach: full block-by-block construction, modular pieces, blueprint construction, and NPC-assisted construction. Each method solves a different player need.

| **Building Method**          | **Purpose**                                                            | **Example Use**                                                                                        |
|------------------------------|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Block-by-Block               | Maximum creative freedom and classic voxel sandbox interaction.        | Build custom homes, walls, caves, farms, towers, decoration, terrain edits.                            |
| Modular Pieces               | Cleaner large structures with better shapes and less block tedium.     | Place roof pieces, arches, beams, windows, stairs, balconies, fences, doors.                           |
| Blueprint Building           | Plan larger structures and preview resource requirements.              | Place a planned workshop, village wall, mage tower, warehouse, bridge, or portal gate.                 |
| NPC-Assisted Construction    | Let villagers or recruited workers build when supplied with resources. | Builders slowly construct a watchtower from the village storage while the player gathers materials.    |
| Village Project Construction | Allow settlements to define their own construction goals.              | A village requests stone, timber, iron, and mana crystals to upgrade from hamlet to fortified village. |

## 6.1 Building Philosophy

The player should never feel forced to hand-place every block of a large civilisation project. Freeform building is important, but large-scale growth should be supported by blueprint planning and NPC labour. This keeps the game scalable.

## 6.2 Player and NPC Building Difference

Player building should be flexible and creative. NPC village building should be structured, readable, and based on defined project blueprints. A village should know how to build a blacksmith, wall, shrine, watchtower, farm, market, school, or mage tower from stored resources. The player can contribute resources, defend workers, speed construction, redesign areas, or build their own structures nearby.

## 6.3 Building as Progression

Buildings should not be only cosmetic. Many should unlock functions: storage, trade, research, magic, NPC jobs, settlement defence, automation access, culture-specific recipes, story steps, or dimension preparation. This makes construction part of the game loop instead of a side activity.

# 7. NPC World Simulation

NPCs are one of the core features. They should combine Millenaire-style village workers with colony sim and light life-sim depth. The goal is for NPCs to create stories, needs, quests, labour, consequences, and emotional attachment.

## 7.1 NPC Feature Set

| **System**            | **Description**                                                                                           | **Gameplay Value**                                                                 |
|-----------------------|-----------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Names and Identity    | NPCs have names, roles, culture, relationships, and possibly traits.                                      | Players remember them as people, not generic mobs.                                 |
| Jobs and Skills       | NPCs perform tasks such as farming, mining, building, guarding, trading, teaching, scouting, or crafting. | Villages function as living economies and sources of generated quests.             |
| Homes and Families    | NPCs can belong to households and settlement social structures.                                           | Village loss matters more when NPCs have connections.                              |
| Needs                 | NPCs require food, shelter, safety, tools, workstations, medicine, and culture-specific goods.            | Needs become trade opportunities, quests, and village growth requirements.         |
| Schedules             | NPCs move through daily routines: work, eat, trade, rest, socialise, worship, guard, patrol, sleep.       | Settlements feel alive rather than static.                                         |
| Inventories           | NPCs and villages track carried and stored resources.                                                     | Construction, trade, theft, delivery, and automation can connect to real supplies. |
| Reputation            | NPCs and settlements remember player actions.                                                             | Player choices affect trade, quests, trust, fear, and access.                      |
| Death and Replacement | NPCs can die, migrate, be born, grow up, or be recruited depending on settings and systems.               | Raids and disaster have consequences.                                              |
| Generated Quests      | NPC needs, danger, missing resources, family problems, jobs, and world events create quests.              | The world produces content naturally.                                              |

## 7.2 NPC Jobs

Jobs should be functional, not just labels. A farmer should grow food. A builder should consume resources and construct structures. A guard should patrol and fight. A merchant should trade based on stock and village economy. A mage should teach, craft, ward, research, or request magical resources.

- Core village jobs: farmer, lumberjack, miner, builder, guard, hunter, merchant, blacksmith, priest/belief leader, mage, alchemist, scholar, courier, fisher, cook, mason, carpenter, healer, golemancer.

- Advanced jobs: engineer, rune-smith, portal keeper, beast trainer, diplomat, quartermaster, siege engineer, archivist, dimensional scout, ritualist.

## 7.3 NPCs as Quest Sources

Many quests should arise from simulation rather than being fully hand-written. If a village lacks food, farmers or elders can request seeds, irrigation, tools, or monster clearing. If builders lack stone, they request mining support or a supply route. If a guard captain loses soldiers in a raid, they request weapons, armour, training, or wall upgrades.

This makes the same village feel different across playthroughs because needs, attacks, resources, player choices, and growth paths can vary.

# 8. Village Growth and Consequences

Villages should grow on their own, but slowly. Player involvement heavily accelerates growth and can shape what the settlement becomes. This creates a world that feels alive without removing the player’s importance.

| **Village State**    | **Description**                                                                          | **Possible Player Role**                                                        |
|----------------------|------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| Camp                 | Small temporary group with basic tents, fires, and survival needs.                       | Provide food, safety, tools, and early building resources.                      |
| Hamlet               | Small permanent settlement with homes, farms, and a few jobs.                            | Help build storage, a workshop, roads, and first defences.                      |
| Village              | Stable community with trade, multiple jobs, culture, and construction projects.          | Supply resources, improve economy, complete local quests, defend from raids.    |
| Fortified Village    | Protected settlement with walls, towers, guards, and stronger storage.                   | Support military upgrades, trade routes, and regional influence.                |
| Town                 | Larger settlement with specialised jobs, markets, schools, shrines, and workshops.       | Help unlock race story chapters, advanced production, and faction diplomacy.    |
| City                 | Major population centre with politics, districts, large projects, and powerful defences. | Influence laws, major quests, faction wars, and dimension preparation.          |
| Capital / Metropolis | High-tier civilisation hub with deep story, advanced magic, and world-scale influence.   | Shape race destiny, unlock endgame projects, and access major dimensional arcs. |

## 8.1 Independent Growth, Stunted Without Help

A village should be able to gather some food, repair damage, trade a little, reproduce or recruit slowly, and attempt small upgrades without the player. However, bigger growth should be slowed by lack of resources, dangers, missing specialists, trade interruptions, and story gates.

The player can accelerate growth by delivering resources, building infrastructure, protecting roads, installing machines, teaching magic, recruiting specialists, opening trade routes, clearing threats, or completing race-specific quests.

## 8.2 Village Damage and Collapse

Villages can be damaged, conquered, abandoned, or destroyed. The severity should depend on difficulty settings and world rules. Peaceful mode may disable destructive raids, while harsh settings may allow full village collapse.

| **Failure State** | **What Happens**                                                           | **Recovery Possibility**                                               |
|-------------------|----------------------------------------------------------------------------|------------------------------------------------------------------------|
| Damaged           | Buildings are broken, storage is lost, NPCs injured or displaced.          | Player can repair structures and provide resources.                    |
| Conquered         | A hostile faction occupies the settlement or demands tribute.              | Player can liberate it, negotiate, side with conquerors, or ignore it. |
| Abandoned         | NPCs flee after repeated danger, famine, corruption, or lack of shelter.   | Player may rebuild and attract survivors later.                        |
| Destroyed         | The settlement is ruined, many NPCs are gone, and story access may change. | Ruins may remain as a dungeon, memorial, or reconstruction project.    |
| Corrupted         | Magic, monsters, or dimensional forces alter the village.                  | Player may cleanse, exploit, study, or spread the corruption.          |

## 8.3 Village Story Unlocking

Each village race or type should unlock its main story as it grows. A small hamlet should not immediately reveal the full race dimension arc. Instead, story depth should scale with village development. Growth reveals history, problems, leaders, rituals, lost structures, and eventually dimensional access.

# 9. Automation System

Automation is a major pillar and should progress from simple medieval mechanisms into magical industrial systems. It should feel satisfying for factory players while remaining tied to fantasy, villages, magic, and world simulation.

## 9.1 Automation Progression Ladder

| **Tier** | **Automation Style**       | **Examples**                                                                                    |
|----------|----------------------------|-------------------------------------------------------------------------------------------------|
| Tier 0   | Manual Labour              | Hand mining, hand chopping, crafting by hand, carrying items manually.                          |
| Tier 1   | Medieval Mechanisms        | Water wheels, windmills, mills, pulleys, carts, simple storage hoppers.                         |
| Tier 2   | Early Industry             | Basic drills, furnaces, belts, item chutes, sorters, storage crates.                            |
| Tier 3   | Industrial Fantasy         | Conveyors, crushers, mixers, smelters, assemblers, pumps, pipes.                                |
| Tier 4   | Arcane Machinery           | Rune engines, mana conduits, crystal cores, arcane furnaces, spell-powered machines.            |
| Tier 5   | Golem Labour               | Programmable golem miners, haulers, builders, guards, farmers, repairers.                       |
| Tier 6   | Dimensional Logistics      | Portal item routing, linked warehouses, remote mana grids, inter-realm supply chains.           |
| Tier 7   | Civilisation-Scale Systems | Floating factories, city-wide mana networks, automated defences, large infrastructure projects. |

## 9.2 Automation Purpose

Automation should not only make the player richer. It should support world systems. A stone quarry can supply a village wall. A food production line can prevent famine. A mana grid can power village wards. A golem workforce can rebuild after a raid. A portal network can connect distant settlements.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Automation Design Rule</strong></p>
<p>Every major automation system should answer: what does this produce for the player, and what can it do for villages, factions, story, defence, trade, or magic?</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 9.3 Village Supply Integration

The most important automation connection is village supply. The player should be able to connect production to a village warehouse or delivery system. Villagers then use stored resources for construction, repairs, crafting, defence, trade, and quests.

For example, an iron chain might produce iron ingots. Those ingots can be used by the player for tools, by the blacksmith for guard weapons, by builders for a watchtower, by machines for components, and by merchants as trade goods.

# 10. Magic System

Magic is a core world system, not a combat-only feature. It should connect to almost every major part of gameplay: mining, farming, smelting, construction, automation, exploration, NPC jobs, combat, village defence, crafting, rituals, dimensions, and story.

## 10.1 Magic Schools and Roles

| **Magic Type**        | **Primary Role**                                                             | **System Connections**                                                               |
|-----------------------|------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Elemental Magic       | Fire, water, earth, wind, lightning, ice, and related effects.               | Combat, furnaces, irrigation, mining, movement, weather, machines.                   |
| Rune Magic            | Structured symbols that control machines, buildings, gates, and logic.       | Automation, crafting stations, doors, mana networks, settlement infrastructure.      |
| Nature Magic          | Plants, animals, healing, forests, soil, growth, and ecological balance.     | Farming, animal care, forest villages, medicines, food production, Fae-like stories. |
| Shadow / Blood Magic  | Forbidden or dangerous power with high cost and moral consequences.          | Combat, curses, sacrifice, stealth, corruption, evil player paths, dark factions.    |
| Necromancy            | Death magic, spirits, undead labour, bone crafting, and forbidden rituals.   | Undead workers, dark automation, graveyards, fear reputation, faction hostility.     |
| Golemancy             | Creation and control of magical workers, guards, miners, and builders.       | Automation, NPC labour, defence, construction, advanced settlement management.       |
| Alchemy               | Potions, catalysts, transmutation, explosives, fuels, and reagents.          | Crafting, farming, mining, medicine, machine inputs, rare resource conversion.       |
| Enchanting            | Imbuing tools, gear, machines, structures, and weapons with magical effects. | Progression, gear, machines, village defence, efficiency, exploration.               |
| Portal / Ritual Magic | Large-scale magic requiring structures, resources, timing, and knowledge.    | Dimensions, fast travel, world events, race story gates, endgame infrastructure.     |

## 10.2 Magic as Utility

Magic should have practical uses from early to late game. Fire magic can power furnaces, water magic can feed crops, earth magic can crack stone, wind magic can move machines, rune magic can regulate item flow, and golemancy can automate labour. This turns magic into a technology layer.

## 10.3 Race-Linked Dimensional Magic

Rather than having a generic divine or dimension magic school, major dimensional progression should connect to races and their stories. Each race can have a mythic or spiritual relationship with a dimension, god, ancestral power, evil being, ancient mistake, or lost homeland. This makes dimensions personal to civilisations rather than random portals.

For example, an elven civilisation might lead toward a Fae or Living Forest realm. A dwarven civilisation might lead toward a Deep Forge realm. A goblin civilisation might lead toward a chaotic under-realm. Original races can have entirely unique realms tied to their history, biology, magic, or culture.

## 10.4 Magic Costs and Balance

Magic should be powerful but not free. Costs can include mana, stamina, components, cooldowns, rituals, risk, corruption, faction reaction, machine wear, rare catalysts, or environmental impact. Utility magic should be useful without making tools, machines, or NPC labour irrelevant.

# 11. Technology Progression

The overall progression should move from primitive survival to massive magical civilisation. The player should feel their relationship with the world changing as they unlock better tools, stronger magic, larger settlements, more advanced machines, and dimensional access.

| **Phase**             | **Player Capability**                                                                 | **World Impact**                                                                          |
|-----------------------|---------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| Primitive Survival    | Wood, stone, shelter, food, simple tools, basic combat.                               | Player survives and begins interacting with nearby villages.                              |
| Early Settlement      | Workbench crafting, farms, basic storage, roads, simple village help.                 | Villages receive materials and complete small construction projects.                      |
| Metal and Mechanisms  | Copper, iron, steel, windmills, water wheels, basic machines.                         | Production increases and villages can build stronger infrastructure.                      |
| Magic Infrastructure  | Mana crystals, rune tables, arcane furnaces, early enchanting.                        | Magic begins powering crafting, farming, defence, and automation.                         |
| Industrial Fantasy    | Conveyors, drills, assemblers, pipes, larger factories.                               | The player can supply towns, trade routes, and regional projects.                         |
| Arcane Civilisation   | Mana grids, golems, advanced machines, portals, ward networks.                        | Cities, faction wars, major stories, and dimensions become central.                       |
| Endgame World-Shaping | Floating cities, interdimensional logistics, ancient technology, world-scale rituals. | The player can reshape civilisations, race destinies, and large parts of the world state. |

## 11.1 Avoiding Flat Progression

Progression should not be only “new ore replaces old ore.” Each material and technology tier should unlock new behaviours. Copper might unlock machinery. Iron might unlock strong tools and village defences. Mana crystal might unlock magical machines. Arcane alloys might unlock portals and advanced automation. Void materials might unlock dimensional systems.

# 12. Danger, Difficulty, and World Risk

The game should support scalable difficulty so different players can enjoy different moods. Some players will want peaceful building and village growth. Others will want raids, harsh survival, dungeon danger, and the possibility of village collapse.

| **Difficulty Style**        | **Intended Experience**                                                       | **Possible Rules**                                                                      |
|-----------------------------|-------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Peaceful / Relaxed          | Cosy building, farming, automation, NPC growth, low stress.                   | No destructive raids, reduced hostile spawns, villages cannot be permanently destroyed. |
| Normal Survival             | Balanced danger similar to classic survival sandbox pacing.                   | Hostile mobs, minor raids, recoverable village damage, normal death consequences.       |
| Adventure                   | More quests, bosses, and dungeon threats without extreme survival punishment. | More world events, stronger enemies, but manageable settlement risks.                   |
| Harsh Civilisation Survival | World consequences matter heavily.                                            | Village conquest, famine, NPC death, raids, resource pressure, stronger faction wars.   |
| Hardcore                    | High-risk mode for challenge players.                                         | Optional permadeath or severe consequences depending on settings.                       |

## 12.1 Threat Types

- Night monsters

- Bandit raids

- Goblin or monster camps

- Faction wars

- Sieges

- Cave and dungeon creatures

- Magical storms

- Dimensional rifts

- Corruption outbreaks

- Boss awakenings

- Resource shortages

- Trade route blockades

Threats should create gameplay for survival, combat, village defence, automation, and story. A raid should not be just an enemy wave; it can damage buildings, interrupt trade, kill guards, trigger repair projects, create refugee NPCs, or unlock revenge quests.

# 13. Death and Recovery

The preferred death system keeps consequence while reducing frustration. When the player dies, their inventory and experience should be stored in a tombstone at or near the death location. This keeps the Minecraft-style risk of death while avoiding the hated experience of items despawning or being permanently lost too easily.

| **Death Feature**  | **Design Decision**                                                                         |
|--------------------|---------------------------------------------------------------------------------------------|
| Inventory Loss     | Dropped into a tombstone rather than scattered loose.                                       |
| Experience Loss    | Stored in the tombstone and recoverable.                                                    |
| Respawn            | At bed, shrine, home point, village respawn point, or world spawn depending on progression. |
| Map Marker         | The tombstone should be marked or trackable, with difficulty settings controlling clarity.  |
| Difficulty Options | Keep inventory, partial loss, tombstone only, or hardcore can be configurable.              |
| Hardcore           | Optional for players who want extreme risk.                                                 |

Tombstones can also become part of the world. Dangerous areas may contain previous player graves in multiplayer, grave recovery quests, or enemies guarding the tombstone. However, recovery should usually be fair rather than cruel.

# 14. Races and Cultures

The world should use a combination of classic fantasy races and original races. Familiar races help players understand the world quickly, while original races make the setting feel unique. Classic races should be redesigned enough to have distinct cultures, dimensions, stories, buildings, economies, and magic.

## 14.1 Race Design Requirements

| **Race Field**      | **Purpose**                                                                                               |
|---------------------|-----------------------------------------------------------------------------------------------------------|
| Name                | The race or culture name.                                                                                 |
| Visual Identity     | Body type, silhouette, clothing, materials, colours, architecture.                                        |
| Preferred Biomes    | Where they settle and what terrain shapes their life.                                                     |
| Building Style      | How their villages, towns, and cities look.                                                               |
| Economy             | What they gather, produce, need, and trade.                                                               |
| Magic Identity      | Their strongest or most culturally important magic traditions.                                            |
| Village Progression | How their settlements grow differently from other races.                                                  |
| Main Story Arc      | The race-specific narrative unlocked through village development.                                         |
| Main Dimension      | The realm connected to their culture, myth, threat, god, evil being, or lost history.                     |
| Relations           | How they tend to interact with other races and factions.                                                  |
| Unique Jobs         | Culture-specific NPC roles, such as rune-smith, beast speaker, ancestor keeper, spore tender, sky sailor. |

## 14.2 Race Examples to Explore Later

The final race list should be created in its own race and culture registry. For the Master Bible, the important decision is that races are not cosmetic. They determine village style, story progression, magic access, economy, trade, dimensions, relationships, and world events.

- Classic-inspired races may include humans, elves, dwarves, orcs, goblins, beastfolk, fae-touched peoples, undead cultures, and elemental-touched peoples.

- Original races should be created to make the world feel distinct, with unique dimensions, social structures, settlement logic, magic, and biology.

# 15. Dimensions and Realms

Dimensions should be mid-to-end-game content. They should feel significant, dangerous, mysterious, and rewarding. Some dimensions should be directly connected to race stories, while others should exist as optional world-lore realms tied to ancient powers, rare materials, hidden bosses, or side mysteries.

## 15.1 Dimension Design Rule

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Dimension Rule</strong></p>
<p>A dimension should never be just a new biome with different blocks. It should unlock story, materials, bosses, structures, magic, machines, civilisation upgrades, or major world-state choices.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Dimension Type**   | **Purpose**                                                                            | **Example Use**                                                        |
|----------------------|----------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Race Story Dimension | A realm tied to a race’s myth, origin, god, enemy, lost homeland, or cultural destiny. | An elven village grows enough to reopen a living forest realm.         |
| World Lore Dimension | A realm tied to ancient history, hidden civilisations, or the origin of magic.         | A forgotten machine realm explains old arcane technology.              |
| Resource Dimension   | A dangerous realm with rare materials needed for late-game systems.                    | A void realm provides materials for portals and dimensional logistics. |
| Boss Dimension       | A realm focused around major combat and story challenge.                               | A sealed realm contains an ancient evil or world guardian.             |
| Utility Dimension    | A realm that changes travel, farming, magic, or automation.                            | A sky realm unlocks floating structures and wind-based machinery.      |

## 15.2 Unlocking Dimensions

Dimensions should usually require preparation: settlement growth, story steps, rare resources, ritual structures, portal components, faction knowledge, magical research, or boss keys. This makes entering a realm feel earned.

Race-linked dimensions should be tied to village growth. A race’s small village may not know enough to open its realm, but a developed town or city might restore shrines, gather scholars, build portal structures, recover lost rituals, and ask the player to help cross over.

# 16. Story Structure

The story should combine sandbox freedom, environmental lore, optional main quests, race-based village storylines, RPG-style arcs, and emergent NPC events. The player should be able to ignore story for long periods, but story should naturally appear through exploration and civilisation growth.

| **Story Layer**       | **Description**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| Sandbox Story         | The player creates their own story through building, automation, travel, survival, and choices.       |
| Environmental Lore    | Ruins, books, murals, old machines, abandoned villages, and strange biomes reveal history.            |
| Race / Village Story  | Each race or village type unlocks a main story as settlements grow.                                   |
| Faction Story         | Factions compete, ally, conquer, trade, betray, and request support.                                  |
| Dimension Story       | Realms reveal race histories, ancient powers, gods, evil beings, or world origins.                    |
| Optional Main Mystery | A larger world-spanning mystery can exist without forcing linear play.                                |
| Emergent NPC Story    | Generated needs, deaths, marriages, migrations, raids, shortages, and successes create local stories. |

## 16.1 Village Growth as Story Progression

The strongest story structure is to tie race stories to village development. As a village grows, it gains new leaders, buildings, specialists, archives, shrines, rituals, conflicts, and access to deeper lore. This makes the player care about settlement growth because it unlocks narrative, not just bigger buildings.

For example, an early dwarven hamlet might only ask for tools and food. Later, a larger dwarven town may uncover old forge maps. A fortified dwarven city may restore an ancestral gate. The final arc may lead into a Deep Forge realm where the player confronts a lost god, ancient machine, or evil sealed beneath the mountains.

# 17. Player Morality and Freedom

The player can be good, neutral, selfish, or evil. The game should support this freedom while making the world respond. Morality should not be a simple good/evil meter only. It should be represented through reputation, faction relationships, village fear, trust, trade access, story availability, NPC behaviour, and world-state outcomes.

| **Player Behaviour**           | **Possible World Reaction**                                                                     |
|--------------------------------|-------------------------------------------------------------------------------------------------|
| Protects villages              | Higher trust, better trade, followers, story access, statues, gifts, alliance offers.           |
| Ignores villages               | Slow growth, possible damage, abandoned settlements, missed stories, neutral reputation.        |
| Exploits villages              | Fear, resentment, rebellion, hidden resistance, black market deals, faction intervention.       |
| Conquers villages              | Control, tribute, forced labour, enemy alliances against the player, tyrant reputation.         |
| Uses forbidden magic           | Powerful shortcuts, fear, corruption risks, holy or cultural opposition, dark faction interest. |
| Sides with monsters or bandits | Alternative allies, hostile civilisations, raiding systems, villain storylines.                 |
| Destroys settlements           | Ruins, refugees, revenge quests, faction hostility, lost or altered story arcs.                 |

## 17.1 Evil Play Without Fake Freedom

If the player can be evil, evil play must have systems. It should not simply mean killing NPCs and losing content. It can unlock darker paths, forbidden magic, conquest mechanics, fear-based control, monster alliances, necromantic labour, and alternate faction stories. However, it should also create resistance, danger, reputation loss, and moral consequence.

# 18. Multiplayer

Multiplayer is required for the final game vision. The game should support solo play, co-op, LAN, and split-screen. This needs to be considered early because systems like NPC simulation, village ownership, world events, tombstones, machine networks, inventories, and story progression can become complicated in multiplayer.

| **Mode**             | **Purpose**                                          | **Design Notes**                                                            |
|----------------------|------------------------------------------------------|-----------------------------------------------------------------------------|
| Single Player        | Full game experience for one player.                 | All systems must work offline/solo.                                         |
| Online Co-op         | Friends share a world and build together.            | Shared progression, permissions, village reputation rules, and sync needed. |
| LAN Co-op            | Local network play without needing external servers. | Useful for households and offline groups.                                   |
| Split-Screen         | Same device or local screen play.                    | UI, performance, controls, and camera need special design.                  |
| Optional Server Play | Potential future dedicated worlds.                   | Useful later, but not necessarily required for first POC.                   |

## 18.1 Multiplayer Design Questions for Later

- Is reputation shared between all players, individual per player, or both?

- Can one player be evil while another protects the same village?

- Who owns machines, buildings, and blueprints?

- How are tombstones handled if another player reaches them first?

- Can players split up across far distances while villages simulate?

- How does split-screen display inventory, crafting, machine UI, dialogue, and maps?

These questions do not need to be solved in this first document, but they should be tracked because multiplayer cannot be treated as a simple late add-on for a simulation-heavy game.

# 19. Proof-of-Concept Target

The POC should prove the identity of the game without trying to build the full game. It should include a small but complete vertical slice where survival, NPC village growth, automation, and magic connect together.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>POC Goal</strong></p>
<p>A small voxel survival loop where the player gathers resources, uses basic magic and automation, supplies an NPC village, triggers village construction, and sees the village survive or suffer based on player support.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

## 19.1 POC Pillars to Prove

| **POC Pillar**     | **Minimum Proof**                                                                                |
|--------------------|--------------------------------------------------------------------------------------------------|
| Voxel Survival     | Player can move, mine, chop, gather, craft, build, and survive in a small world.                 |
| NPC Village Growth | A small village has storage, named NPCs, jobs, needs, and one construction project.              |
| Fantasy Automation | A basic production chain converts raw resources into useful materials.                           |
| Magic Utility      | At least one magic system supports production, farming, smelting, mining, or defence.            |
| World Consequence  | A village outcome changes based on player support, such as surviving a raid or suffering damage. |
| Living World Feel  | NPCs move, work, request resources, build, and react rather than standing still.                 |

## 19.2 Recommended POC Scenario

The player begins near a small village in a forest valley. The village wants to build a watchtower before goblins attack. The player gathers wood, stone, iron, and mana crystals. They craft tools, build a simple furnace or mana furnace, automate part of the iron process, deliver materials to the village warehouse, and watch builders construct the tower. A raid then tests whether the village was prepared.

## 19.3 POC Content Scope

| **Category**   | **POC Content**                                                                                                                                                       |
|----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| World          | Small valley, forest, cave, one village, one ruin, one enemy camp.                                                                                                    |
| Player         | Movement, mining, chopping, inventory, crafting, building, basic combat.                                                                                              |
| Blocks         | Grass, dirt, stone, logs, planks, leaves, iron ore, copper ore, mana crystal ore, workbench, furnace, mana furnace, chest, village warehouse, simple transport block. |
| Items          | Wood, stone, copper ore/ingot, iron ore/ingot, mana crystal, pickaxe, axe, sword, food, basic rune, machine part.                                                     |
| NPCs           | Elder, builder, farmer, guard, merchant, mage.                                                                                                                        |
| Village System | Village storage, resource request, builder project, basic reputation, damage state.                                                                                   |
| Automation     | Basic miner or resource node, furnace, item movement, storage, one production chain.                                                                                  |
| Magic          | Mana crystal, mana furnace, one utility spell or rune, basic magical fuel system.                                                                                     |
| Threat         | Goblin raid or monster attack affected by watchtower completion.                                                                                                      |

## 19.4 POC Non-Goals

The POC should not attempt to include every race, full multiplayer, every building system, full colony simulation, procedural world generation, all magic schools, dimensions, large faction wars, deep story trees, or hundreds of blocks and items. Those are final-game goals. The POC proves the central loop first.

# 20. Core Design Rules

These rules should guide every later system document.

**Interconnect Systems:** Blocks, items, machines, magic, NPCs, villages, story, and dimensions should connect wherever possible.

**Player Freedom First:** Players should be able to build, automate, explore, quest, trade, rule, protect, ignore, or destroy.

**Villages Must Matter:** NPC settlements should provide story, needs, labour, trade, consequence, and emotional stakes.

**Automation Has World Purpose:** Factories and machines should support villages, factions, construction, war, farming, trade, and magic.

**Magic Is Practical:** Magic should be used for utility and infrastructure, not only combat.

**Consequences Should Scale:** Difficulty settings should control how harsh raids, death, village damage, and collapse become.

**Story Emerges Through Growth:** Village development should unlock race stories, dimensions, leaders, conflicts, and world lore.

**POC Stays Focused:** The first build should prove the integrated loop, not the full feature list.

**Multiplayer Must Be Remembered:** Even if built later, core systems should avoid assumptions that make co-op impossible.

**Content Needs Clear Registries:** Blocks, items, recipes, races, monsters, structures, dimensions, and NPC jobs should be tracked in structured documents or spreadsheets.

# 21. Future Documentation Roadmap

The Master Game Design Bible should be followed by specialised documents. Each document should expand one area in detail without overloading a single chat or file.

| **Order** | **Document**                              | **Purpose**                                                                                             |
|-----------|-------------------------------------------|---------------------------------------------------------------------------------------------------------|
| 01        | Core Gameplay Loop and Progression        | Define minute-to-minute, hour-to-hour, and long-term gameplay progression.                              |
| 02        | POC Scope and Vertical Slice              | Lock the first playable proof-of-concept in buildable detail.                                           |
| 03        | Blocks Registry                           | List terrain, construction, functional, magic, machine, and dimension blocks.                           |
| 04        | Items Registry                            | List raw materials, refined resources, tools, weapons, armour, food, magical items, and trade goods.    |
| 05        | Crafting and Recipe Registry              | Define crafting stations, recipes, unlock rules, and production chains.                                 |
| 06        | Resource and Material Progression         | Define ore tiers, materials, fuels, magic components, and use cases.                                    |
| 07        | NPC World Simulation                      | Design NPC jobs, needs, schedules, families, skills, quests, storage, and behaviour.                    |
| 08        | Village Growth and Settlement Systems     | Define settlement stages, projects, damage states, player-founded towns, and NPC-assisted construction. |
| 09        | Automation System                         | Design machines, belts, pipes, mana conduits, golems, power, logistics, and village supply.             |
| 10        | Magic System                              | Define magic schools, utility spells, combat, rituals, enchanting, costs, and progression.              |
| 11        | Races, Cultures, and Factions             | Define classic and original races, culture rules, relationships, factions, and story hooks.             |
| 12        | Dimensions and Realm Design               | Define race-linked dimensions, optional lore realms, entry methods, bosses, materials, and rewards.     |
| 13        | Creatures, Monsters, and Bosses           | Define passive wildlife, hostile mobs, raid enemies, dungeon creatures, bosses, drops, and behaviours.  |
| 14        | Biomes and World Generation               | Define world biomes, resources, structures, hazards, and generation principles.                         |
| 15        | Structures and Landmarks                  | Define villages, ruins, dungeons, towers, camps, shrines, portals, and random encounters.               |
| 16        | Combat, Gear, and Defence                 | Define weapons, armour, damage, magic combat, village defence, traps, turrets, and raids.               |
| 17        | UI/UX and Player Experience               | Define inventory, crafting, quest log, village screen, machine UI, magic UI, map, and multiplayer UI.   |
| 18        | Technical Planning and POC Implementation | Define engine choice, architecture, data registries, save systems, networking risks, and staged builds. |

## 21.1 Registry Format Rule

Most content documents should use structured tables and database-style entries. Every block, item, recipe, monster, race, structure, dimension, machine, spell, and NPC job should eventually include a status field such as POC Required, Alpha, Final Game, Placeholder, or Deferred.

## 21.2 Closing Direction

This document locks the foundation. Later documents can add detail, but they should not drift away from the central promise: a living fantasy voxel world where magic, automation, survival, NPC civilisations, race stories, and player choice all affect each other.
