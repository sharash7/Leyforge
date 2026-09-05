**Fantasy Voxel Civilisation Sandbox**

**01 - Core Gameplay Loop**

*Version 0.1 - Detailed Design Bible Draft*

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Core Loop Statement</strong></p>
<p>A balanced fantasy voxel civilisation sandbox where players survive, build, explore, automate, use magic, interact with living NPC villages, and reshape a procedurally generated world at their own pace.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Design Source</strong></p>
<p>This document expands the locked vision from 00 - Master Game Design Bible and converts the player-facing fantasy into actionable gameplay-loop design. It is intended to guide later system documents, content registries, and proof-of-concept planning.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Field**             | **Lock**                                                                                                                |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------|
| Game Type             | Survival sandbox + civilisation sandbox + automation/factory + fantasy RPG                                              |
| World Type            | Seed-generated voxel world with procedural discovery and flexible pacing                                                |
| Ending                | No fixed ending; escalating sandbox goals continue indefinitely                                                         |
| Primary Loop          | Explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand                      |
| POC Target            | Gather -\> automate -\> supply village -\> village consumes real resources -\> village grows -\> threat outcome changes |
| Difficulty Philosophy | Configurable survival, threat, tutorial, event, death, and NPC consequence settings                                     |

# Document Purpose

This document defines how the player experiences the game over multiple time scales: moment-to-moment, in-game day cycles, early progression, mid-game expansion, late-game escalation, and long-term sandbox play. It also defines how survival, NPC villages, automation, magic, exploration, combat, economy, settlement building, dimensions, multiplayer, and failure states connect into one cohesive loop.

This is not a final balancing document, technical implementation document, or full content registry. It is the gameplay-loop foundation that later documents should reference when designing blocks, items, recipes, NPC jobs, village systems, structures, monsters, races, dimensions, UI, and proof-of-concept milestones.

# Static Table of Contents

- 1\. Locked Gameplay Identity

- 2\. Core Loop Overview

- 3\. Sandbox Freedom and Player Direction

- 4\. New World Start Loop

- 5\. Minute-to-Minute Loop

- 6\. Survival and Need Loop

- 7\. Day and Night Loop

- 8\. Daily Village and NPC Loop

- 9\. World Event Loop

- 10\. Early Game Loop

- 11\. Mid-Game Loop

- 12\. Late Game Loop

- 13\. Endgame Sandbox Loop

- 14\. Resource Gathering Loop

- 15\. Crafting and Building Loop

- 16\. NPC Village Loop

- 17\. Automation Loop

- 18\. Magic Loop

- 19\. Exploration Loop

- 20\. Combat, Threat, and Defence Loop

- 21\. Quest and Story Loop

- 22\. Economy and Reputation Loop

- 23\. Player Settlement and Civilisation Loop

- 24\. Dimensions and Realm Loop

- 25\. Death, Failure, and Recovery

- 26\. Multiplayer Gameplay Loop

- 27\. UI and Feedback Loop

- 28\. Pacing and Balance Philosophy

- 29\. Proof-of-Concept Gameplay Loop

- 30\. Example Gameplay Scenarios

- 31\. Core Design Rules for Future Documents

- 32\. Open Design Questions for Later Documents

# 1. Locked Gameplay Identity

The core identity is a true hybrid rather than a single-genre game. The player should be able to approach the world as a survivor, builder, village helper, automation engineer, adventurer, mage, trader, conqueror, explorer, or peaceful world-shaper. None of the four core pillars should permanently dominate normal play: survival sandbox, NPC civilisation sandbox, automation/factory design, and fantasy RPG progression should all remain legitimate paths.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Identity Rule</strong></p>
<p>The game must feel like a sandbox first. Guidance, quests, progression, and story exist, but they should support player freedom rather than replacing it.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Pillar**           | **Player-Facing Promise**                                                                                     | **Loop Function**                                                                             |
|----------------------|---------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------|
| Survival Sandbox     | The player can gather, craft, build, mine, farm, fight, and live in a voxel world.                            | Creates the base tactile loop and ensures every system has a grounded resource layer.         |
| Civilisation Sandbox | Villages are living communities with needs, jobs, storage, growth, damage, stories, and consequences.         | Turns gathered resources into visible world change and social progression.                    |
| Automation/Factory   | Machines, mills, furnaces, logistics, and later magical systems reduce grind and enable large-scale growth.   | Transforms manual resource work into supply chains that can support villages and settlements. |
| Fantasy RPG          | Magic, ruins, dungeons, factions, creatures, dimensions, gear, and reputation provide adventure and identity. | Adds discovery, danger, wonder, character progression, and long-term goals.                   |

The game should support focused playstyles but reward interconnection. A builder should benefit from trade. A mage should benefit from exploration. An automation player should benefit from village demand. A village helper should benefit from machines. A conqueror should face political and social consequences. A peaceful player should still have access to building, trade, farming, magic, NPC growth, and exploration.

# 2. Core Loop Overview

The broad loop is flexible rather than scripted. In its simplest form, the player sees a need or curiosity, chooses a goal, gathers or discovers what is required, transforms resources through crafting, building, trading, magic, or machines, then sees the world react. That reaction creates the next goal.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Primary Loop</strong></p>
<p>Explore -&gt; gather -&gt; craft -&gt; build -&gt; interact -&gt; automate -&gt; defend -&gt; upgrade -&gt; expand.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Loop Step** | **Player Action**                                                                                            | **World Response**                                                                                     |
|---------------|--------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Explore       | Travel through procedural terrain, caves, ruins, roads, landmarks, villages, and dangerous areas.            | New resources, threats, cultures, structures, quests, and lore are revealed.                           |
| Gather        | Mine, chop, farm, hunt, salvage, harvest, trade, loot, or receive resources.                                 | Player gains materials needed for crafting, building, village requests, and machines.                  |
| Craft         | Create tools, blocks, stations, gear, components, magic items, and machine parts.                            | New capabilities unlock, allowing deeper mining, better defence, or production expansion.              |
| Build         | Place blocks, modular pieces, machines, blueprints, storage, defences, homes, and settlement infrastructure. | Personal bases, villages, and later player settlements become more capable and resilient.              |
| Interact      | Talk, trade, accept requests, deliver resources, recruit, train, help, threaten, or conquer.                 | NPCs react through reputation, jobs, growth, fear, loyalty, trade, stories, and faction outcomes.      |
| Automate      | Set up miners, farms, furnaces, mills, conveyors, pipes, storage, filters, and later magical logistics.      | Production scales up and can supply the player, warehouses, construction, trade, and settlement needs. |
| Defend        | Fight monsters, prepare walls, towers, guards, wards, traps, lighting, patrols, and safe routes.             | Threat outcomes change based on preparation, village strength, difficulty, and player choices.         |
| Upgrade       | Improve tools, buildings, machines, magic, villages, storage, defences, reputation, and routes.              | New systems unlock and the local world becomes more complex.                                           |
| Expand        | Reach new regions, biomes, villages, cultures, dungeons, dimensions, factions, and settlement scale.         | The sandbox opens wider and new long-term goals emerge.                                                |

The loop should never require the player to do these steps in a single fixed order. A player might spend a session building, another session exploring, another automating, and another resolving village problems. The system should recognise multiple valid routes to progress.

# 3. Sandbox Freedom and Player Direction

The game should provide freedom first, with adjustable guidance layered on top. Some players enjoy pure discovery. Others need visible goals, tutorial assistance, recipe direction, quest logs, or request boards. The design should support both without forcing either style.

| **Guidance Source**      | **Purpose**                                                                                                              | **Player Control**                                                    |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| Optional Tutorial        | Introduces core mechanics such as gathering, crafting, survival, storage, and village requests.                          | Can be enabled, reduced, or disabled.                                 |
| NPC Requests             | Give local goals tied to real settlement needs.                                                                          | Can be accepted, ignored, delayed, or failed depending on quest type. |
| Request Boards           | Show village resource shortages, construction projects, work orders, trade requests, and event warnings.                 | Useful for players who want clear tasks without a linear campaign.    |
| Recipe Book and Tooltips | Explain items, blocks, stations, and machine requirements.                                                               | Can be detailed, minimal, or discovery-based.                         |
| Environmental Clues      | Roads, smoke, ruins, glowing crystals, monster nests, cave sounds, and abandoned structures guide exploration naturally. | Always present, but never mandatory.                                  |
| Quest Journal            | Tracks accepted quests, major world events, faction arcs, and player objectives.                                         | Configurable notification intensity.                                  |
| Codex/Help Menu          | Provides optional deep explanations for systems, biomes, magic, NPCs, and automation.                                    | Available without forcing popups.                                     |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>No Fixed Ending</strong></p>
<p>The game has escalating goals but no true final endpoint. Players can continue building, exploring, trading, automating, conquering, restoring villages, founding settlements, and entering dimensions indefinitely.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

The player can ignore villages, help them, trade with them, protect them, build their own settlement after learning the system, or conquer them. Ignored villages should usually survive in a limited way but grow slowly and remain vulnerable. This keeps the world alive without making the player feel forced into constant babysitting.

# 4. New World Start Loop

A new world begins with the player alone in the wilderness with nothing. Because the world is generated from a seed, the first village, cave, ruin, biome, and resource distribution may vary. The start loop must adapt to different seeds instead of assuming a fixed tutorial village or scripted opening.

| **Opening Layer**    | **Default Behaviour**                                                                                                                         | **Design Notes**                                                     |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Spawn State          | Player begins alone with empty or near-empty inventory.                                                                                       | This preserves the classic survival sandbox fantasy.                 |
| Immediate Goal       | Gather wood, stone, food, and basic shelter materials.                                                                                        | The first 5 minutes should be readable without requiring complex UI. |
| Village Discovery    | A village may be nearby, distant, hidden, absent from the immediate area, or discovered through roads, smoke, signs, rumours, or exploration. | Seed variation creates replayability.                                |
| Magic Discovery      | Magic is usually discovered through ruins, mage NPCs, books, ancient structures, or rare resources.                                           | Magic should feel special rather than instantly given.               |
| Automation Discovery | Automation usually appears after copper/iron progression and basic crafting are understood.                                                   | This prevents overwhelming the player in the opening.                |
| Tutorial Support     | If enabled, tutorial help can guide basic tools, shelter, food, crafting, and first points of interest.                                       | Tutorial should not override sandbox choice.                         |

## 4.1 First 5 Minutes

1.  Player spawns and observes the surrounding biome, weather, time of day, and visible landmarks.

2.  Player gathers immediate resources: wood, stone, plant fibre, berries, sticks, flint, or similar local equivalents.

3.  Player crafts first tools such as a crude axe, crude pickaxe, torch, basic work surface, or temporary shelter pieces.

4.  Player chooses a direction: make shelter, search for food, mine, follow a road, investigate smoke, enter a cave, or explore a ruin.

5.  If tutorial help is enabled, the game suggests goals but does not lock the player into them.

# 5. Minute-to-Minute Loop

The minute-to-minute loop is the tactile loop: moving, mining, chopping, placing, crafting, looting, sorting, fighting, talking, inspecting machines, and reacting to immediate needs. It should feel direct and satisfying before higher systems are added.

| **Activity**        | **What It Feels Like**                                                                                 | **How It Connects**                                                               |
|---------------------|--------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------|
| Gathering           | Fast, readable, and rewarding. The player sees material gain quickly.                                  | Feeds crafting, survival, village requests, trading, and machines.                |
| Crafting            | Clear cause-and-effect: resources become tools, blocks, stations, gear, and components.                | Unlocks new gathering, building, automation, and magic options.                   |
| Building            | Immediate creative control through block-by-block placement, with later modular and blueprint support. | Creates shelter, bases, machines, settlement infrastructure, and village support. |
| Exploring           | Curiosity-driven discovery through terrain, caves, landmarks, roads, ruins, and procedural structures. | Reveals resources, dangers, NPCs, magic, and progression hooks.                   |
| NPC Interaction     | Dialogue, trade, requests, reputation, visible needs, and social consequences.                         | Links the player to civilisation growth and living-world stories.                 |
| Automation Checking | Inspect production, fix bottlenecks, refuel, route outputs, connect storage, and improve throughput.   | Turns manual work into scalable supply systems.                                   |
| Combat              | Reactive and purposeful: defend yourself, defend villages, clear caves, fight bosses, or conquer.      | Adds risk, rewards, and consequences.                                             |

The player should always be able to find something useful to do: gather, craft, build, trade, explore, fight, repair, supply a village, improve machines, check NPC needs, plan a route, or pursue magic. Downtime can exist, but it should feel like chosen calm rather than lack of content.

# 6. Survival and Need Loop

Survival systems should exist, but they must be configurable. Some players want hunger, thirst, sleep, illness, temperature, and harsh danger. Others want a relaxed fantasy builder. The same game should support both through world and difficulty settings.

| **Need**    | **Harsh Mode**                                                        | **Normal Mode**                           | **Relaxed/Peaceful Mode**     |
|-------------|-----------------------------------------------------------------------|-------------------------------------------|-------------------------------|
| Hunger      | Frequent food planning and penalties when starving.                   | Meaningful but manageable food loop.      | Can be reduced or disabled.   |
| Thirst      | Water access, containers, purification, and travel planning matter.   | Periodic hydration need.                  | Can be reduced or disabled.   |
| Temperature | Cold, heat, storms, clothing, shelter, and fire matter.               | Biome/weather modifiers matter sometimes. | Mostly atmospheric.           |
| Sleep       | Fatigue, safety, night danger, and schedule planning matter.          | Sleep helps recovery and time control.    | Optional convenience.         |
| Illness     | Food quality, weather exposure, monster effects, and medicine matter. | Rare but meaningful status events.        | Optional or disabled.         |
| Danger      | Night, caves, raids, and wilderness are highly threatening.           | Balanced danger and recovery.             | Mostly avoidable or disabled. |

The default should be readable and fair rather than punishing. Survival creates reasons to farm, trade, cook, build shelter, upgrade clothing, improve village food systems, and automate production. It should not become repetitive micromanagement unless the player chooses harsh settings.

# 7. Day and Night Loop

Day and night should affect survival, NPC behaviour, monster pressure, travel safety, village work, lighting, guard patrols, and atmosphere. The effect should scale with difficulty.

| **Time Period** | **Player Impact**                                                                  | **NPC/Village Impact**                                                         | **Threat Impact**                                                      |
|-----------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------|
| Morning         | Plan tasks, check food, collect outputs, visit villages, prepare travel.           | NPCs wake, eat, open shops, begin work, move to fields/workshops.              | Low to moderate danger.                                                |
| Day             | Best time for travel, gathering, building, trade, and exploration.                 | Farmers, builders, guards, merchants, miners, and craftspeople work schedules. | Surface danger lower; caves remain dangerous.                          |
| Dusk            | Warning period to return, light areas, prepare defences, or continue risky travel. | NPCs return home, guards patrol, shops close, gates may shut.                  | Monster spawns increase.                                               |
| Night           | Dangerous or atmospheric depending on difficulty; travel and building are riskier. | NPCs sleep, guards patrol, emergency events can trigger.                       | Night monsters, raids, cave emergence, or corruption events may occur. |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Difficulty Rule</strong></p>
<p>Night may be a serious survival phase on harsh settings, a manageable danger on normal settings, or mostly atmosphere and NPC schedule change on relaxed settings.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 8. Daily Village and NPC Loop

NPCs should follow detailed daily schedules that make settlements feel alive. The player should see people working, eating, socialising, sleeping, trading, building, fleeing, repairing, mourning, celebrating, training, and reacting to shortages or danger.

| **NPC Schedule Element** | **Examples**                                                                         | **Gameplay Purpose**                                                 |
|--------------------------|--------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Work                     | Farm, mine, build, patrol, smith, cook, trade, research, cast, haul.                 | Makes village production and jobs visible.                           |
| Needs                    | Food, rest, shelter, safety, tools, medicine, family, morale.                        | Creates shortages, quests, and consequences.                         |
| Social Life              | Meals, markets, festivals, conversations, prayer, family visits.                     | Makes NPCs feel named and alive.                                     |
| Danger Response          | Flee, defend, ring bell, close gate, gather at shelter, call guards.                 | Makes raids and disasters readable.                                  |
| Construction             | Carry resources, scaffold, build in stages, repair damage.                           | Shows real resource use and village growth.                          |
| Availability             | Important services may be closed at night unless emergency or special access exists. | Schedules add immersion while UI should avoid excessive frustration. |

## 8.1 Discovering Village Needs

The player should be able to discover village needs through multiple methods, so players who prefer dialogue, observation, UI boards, or emergent play all feel supported.

- Talk to the village elder, mayor, chief, priest, blacksmith, mage, guard captain, or warehouse keeper.

- Check a request board for resource needs, work orders, construction projects, shortages, trade requests, and danger warnings.

- Observe warehouse shortages, empty fields, damaged walls, low guard equipment, unfinished buildings, or idle workers.

- Listen to NPC dialogue and rumours about hunger, danger, missing tools, cave threats, monster camps, or nearby ruins.

- Receive direct approaches from NPCs for urgent or personal issues.

# 9. World Event Loop

World events should be rare by default and configurable. They should feel meaningful, not like constant interruptions. Events should emerge from simulation, progression, danger level, difficulty, faction relationships, village growth, and procedural world state.

| **Event Type**          | **Trigger Sources**                                                         | **Potential Outcomes**                                                  |
|-------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------|
| Goblin Raid             | Night danger, village wealth, nearby camps, player actions, random event.   | Damage, NPC injury/death, loot, reputation changes, defence validation. |
| Night Monster Surge     | Moon phase, biome, difficulty, magic disturbance, random world event.       | Increased danger, travel risk, village defence test.                    |
| Trader Caravan          | Road networks, reputation, village growth, peaceful event roll.             | New goods, trade opportunities, rumours, faction contact.               |
| Magical Storm           | Weather systems, mana density, dimension influence.                         | Machine disruption, rare resources, magic effects, crop impact.         |
| Village Festival        | Growth milestone, seasonal calendar, cultural identity.                     | Morale, trade, quests, lore, reputation rewards.                        |
| Resource Shortage       | Consumption exceeds production, failed harvest, damaged route, high demand. | Requests, trade price changes, migration risk, production goals.        |
| Cave Threat Emergence   | Deep mining, nearby cave nests, event roll.                                 | Monsters surface, village calls for help, new dungeon hook.             |
| Dimensional Disturbance | Portal use, late-game events, corrupted biome, ritual failure.              | Overworld effects, new resources, corruption, boss or realm hook.       |

Event frequency should be adjustable in world settings. A peaceful builder should not be constantly disrupted. A harsh survival player should be able to create a world where events create real pressure.

# 10. Early Game Loop

Early game should introduce the survival sandbox foundation while gently opening the civilisation, cave, and resource layers. Tutorial help may point the player toward these systems, but the player should be free to choose first goals.

| **Early Goal**     | **Player Actions**                                                       | **Unlocks/Outcome**                                       |
|--------------------|--------------------------------------------------------------------------|-----------------------------------------------------------|
| Secure Shelter     | Gather wood/stone, craft tools, place blocks, light area, survive night. | Safe storage, crafting base, first survival confidence.   |
| Basic Tools        | Craft crude tools, mine stone, upgrade to better tools.                  | Faster gathering and access to early ores.                |
| Find Food/Water    | Forage, hunt, fish, farm, cook, or trade.                                | Survival stability and later farming economy.             |
| First Ore          | Locate cave or surface ore; mine copper/iron depending on seed.          | Tool upgrades, station recipes, early machine path.       |
| Discover Village   | Follow roads, smoke, NPC tracks, maps, or exploration.                   | Trade, requests, social progression, first village needs. |
| First Village Help | Deliver simple materials, trade food/tools, repair small damage.         | Reputation, visible gratitude, next requests.             |

## 10.1 Valid First Milestones

Because the game is a sandbox, the first major milestone can vary. The design should recognise multiple valid starts rather than forcing a single path.

- Build a secure shelter.

- Craft better tools or reach iron-level progression, depending on the seed and player priorities.

- Find and help a village complete an early project.

- Map the local area and identify key resources.

- Create a basic food supply or small farm.

# 11. Mid-Game Loop

Mid-game begins when the player has stable survival, access to better materials, and a clearer relationship with nearby settlements. This is where the game should open into automation, regional exploration, magic, village growth, trade, better combat, and faction contact.

| **Mid-Game System** | **Player Loop**                                                                         | **Why It Matters**                                                |
|---------------------|-----------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Automation          | Build miners, furnaces, farms, mills, storage, belts/pipes, filters, and supply routes. | Reduces grind and enables village-scale construction.             |
| Village Growth      | Supply resources, protect villages, unlock jobs/buildings, improve reputation.          | Turns materials into living-world change.                         |
| Magic Progression   | Learn spells through mages, ruins, books, practice, and research.                       | Adds utility, combat, automation, defence, and exploration tools. |
| Dungeons and Bosses | Explore caves, ruins, monster nests, and regional threats.                              | Provides danger, loot, rare resources, and story hooks.           |
| Trade Routes        | Connect villages, caravans, warehouses, and production hubs.                            | Transforms local play into regional economy.                      |
| Factions            | Meet competing cultures, orders, clans, guilds, or kingdoms.                            | Adds reputation, conflict, diplomacy, and long-term consequence.  |

The first automation chains should include ore to furnace to storage, farm to food processing to village storage, and wood cutter to plank maker to builder supply. These chains connect directly to the civilisation fantasy rather than existing only for player item output.

# 12. Late Game Loop

Late game scales the same core loops upward instead of replacing them. The player still gathers, builds, explores, trades, and defends, but now at settlement, region, faction, and dimension scale.

| **Late-Game Direction**    | **Gameplay Expression**                                                                                                          |
|----------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Large Factories            | Multi-stage production chains, logistics hubs, refined materials, magical processors, storage networks, and throughput planning. |
| Player-Founded Settlements | A settlement with jobs, homes, culture, magic identity, defences, trade, production, and political relationships.                |
| High-Tier Magic            | Rituals, wards, portals, golems, advanced utility, major combat spells, and dimension-linked magic.                              |
| Dimensions                 | Realm access, unique resources, bosses, realm rules, hazards, and overworld consequences.                                        |
| Faction Conflict           | Wars, alliances, conquest, trade disputes, cultural arcs, diplomacy, and reputational consequences.                              |
| Civilisation Consequences  | Villages become towns or fall; trade routes thrive or collapse; NPCs migrate; regions change.                                    |

Late game should support multiple identities: ruler, archmage, mage-engineer, world-shaper, conqueror, trade master, peaceful civilisation builder, dimensional explorer, or automation master.

# 13. Endgame Sandbox Loop

The endgame is not a final boss followed by credits. It is an ongoing sandbox escalation layer. Major bosses, dimensions, faction wars, and story arcs can provide climaxes, but the world should continue afterward.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Endgame Rule</strong></p>
<p>Endgame is defined by scale and consequence, not by a final ending.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Endgame Path**           | **Long-Term Loop**                                                                            |
|----------------------------|-----------------------------------------------------------------------------------------------|
| Ruler/Civilisation Builder | Found, expand, defend, and politically position a settlement or city.                         |
| Archmage                   | Master schools of magic, rituals, wards, dimensions, and magical infrastructure.              |
| Mage-Engineer              | Merge automation, runes, mana, machines, golems, and portals into advanced systems.           |
| Automation Master          | Optimise large-scale production for settlements, trade, war, and rare materials.              |
| Faction Warlord/Tyrant     | Conquer villages, control resources, intimidate factions, and face resistance.                |
| Peaceful World Builder     | Develop villages, restore ruins, improve trade, farm, build, and avoid harsh threat settings. |
| Dimensional Explorer       | Push into realms, bosses, rare resources, and overworld effects.                              |

# 14. Resource Gathering Loop

Resource gathering should be simple enough to understand immediately, but deep enough to support long-term planning. It can be Minecraft-like at the surface, more layered in progression, and increasingly automated later.

| **Resource Design Principle** | **Application**                                                                                                             |
|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Multiple Uses                 | Important resources should connect to crafting, machines, trade, village needs, magic, quests, and building where possible. |
| Some Simple, Some Complex     | Not every material needs many uses. Common materials may remain simple while strategic resources support multiple systems.  |
| Tool Gates                    | Classic tiered tools remain readable and satisfying.                                                                        |
| Biome/Depth Gates             | Some materials appear in certain depths, biomes, regions, cave types, or dimension conditions.                              |
| Magic Gates                   | Magic can reveal, extract, refine, or stabilise special materials.                                                          |
| Automation Gates              | Manual mining gives first access; automation enables bulk supply.                                                           |
| Scarcity Settings             | Resource scarcity can be harsh, moderate, rare-only, or adjusted by world settings.                                         |

The design should avoid flat progression where every new ore is only a stronger version of the previous ore. Materials should have identity. Copper can matter for machines. Iron can matter for tools and village growth. Mana crystals can matter for magic and later automation. Stone can remain important for construction and village projects.

# 15. Crafting and Building Loop

Crafting and building are central loops. The player should begin with hand crafting and block-by-block construction, then unlock stations, modular pieces, blueprints, NPC-assisted construction, and culture or research-based building methods.

| **Crafting Source**       | **Role in Progression**                                                                                                |
|---------------------------|------------------------------------------------------------------------------------------------------------------------|
| Player Inventory Crafting | Simple survival items, first tools, basic materials, quick field repairs.                                              |
| Crafting Stations         | Workbench, furnace, sawmill, anvil, loom, alchemy table, rune table, machine assembler, and culture-specific stations. |
| Research/Unlocks          | Progression gates for advanced machines, magic, construction, and recipes.                                             |
| NPC Knowledge             | Mages, blacksmiths, builders, alchemists, priests, engineers, and cultures can teach recipes.                          |
| Exploration Discoveries   | Ruins, books, structures, dungeons, and dimensions can unlock recipes and techniques.                                  |

## 15.1 Building Methods

| **Method**                | **Unlock Timing**                                         | **Purpose**                                                                          |
|---------------------------|-----------------------------------------------------------|--------------------------------------------------------------------------------------|
| Block-by-Block            | Available from the start.                                 | Maximum freedom and classic voxel sandbox building.                                  |
| Modular Pieces            | Early to mid-game.                                        | Faster detailed building: walls, roofs, windows, arches, doors, furniture, machines. |
| Blueprint Construction    | Mid-game and onward.                                      | Large structures, planned costs, settlement layouts, repeatable designs.             |
| NPC-Assisted Construction | After village interaction or settlement systems.          | NPCs consume stored resources and build in stages.                                   |
| Culture/Research Building | Unlocked through factions, races, magic, and exploration. | Distinct building identities and special functions.                                  |

Large structures should require resource planning when built through blueprints or village/settlement systems. Freeform creative building can remain simpler. Building functions should vary: some structures are decorative, some unlock crafting, some enable NPC jobs, some defend villages, some affect storage, some enable magic or automation, and some are settlement identity pieces.

# 16. NPC Village Loop

The village loop is one of the core unique systems. Villages should have real stored resources, named NPCs, jobs, homes, needs, schedules, construction, trade, defences, reputation, culture, and consequences.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Village Core Loop</strong></p>
<p>Village needs resources -&gt; player helps, ignores, trades, automates, protects, exploits, or conquers -&gt; village consumes real resources -&gt; village grows, suffers, adapts, or collapses.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Village State**      | **Without Player Help**                                                      | **With Player Help**                                                 |
|------------------------|------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Camp/Hamlet            | Survives slowly, gathers basics, vulnerable to shortages and raids.          | Can stabilise, finish first projects, expand jobs, build storage.    |
| Village                | May progress slowly but remains limited by resources, danger, and logistics. | Can add specialised buildings, better trade, guards, culture quests. |
| Fortified Village/Town | Requires significant conditions and may rarely reach this unaided.           | Can become a strong regional ally or political actor.                |
| Damaged/Threatened     | Repairs slowly, loses morale, may suffer deaths, migration, or conquest.     | Can be restored through resources, medicine, defence, and quests.    |

## 16.1 Village Growth Feedback

- New buildings appear through visible construction stages.

- NPC population grows through migration, births/generations later, apprenticeships, or recruitment.

- New jobs unlock: blacksmith, apprentice, guard, builder, warehouse keeper, mage, alchemist, farmer, courier, miner, etc.

- Trade stock improves based on local production and reputation.

- Guards, walls, towers, gates, lighting, patrols, traps, and wards improve village safety.

- Culture, race, and faction story arcs unlock as villages grow.

## 16.2 NPC Death and Consequence

NPC death should matter. Named NPCs can die permanently, especially at normal or harsh difficulty. Generic NPCs can sometimes be replaced over time through migration, apprentices, births/generations, or recruitment. This gives real consequence without making the world unrecoverable after every loss.

# 17. Automation Loop

Automation should begin mostly mechanical and become increasingly magical. Early machines can use fuel, water wheels, and windmills. Later systems can use mana crystals, rune engines, mana batteries, conduits, golems, magical storage, and portals. Automation must connect directly to villages and settlements.

| **Automation Tier**     | **Example Systems**                                                                                  | **Purpose**                                           |
|-------------------------|------------------------------------------------------------------------------------------------------|-------------------------------------------------------|
| Early Manual/Mechanical | Fuel furnaces, hand processing, water wheels, windmills, simple storage.                             | Reduce early grind and introduce production thinking. |
| Basic Factory           | Ore miners, wood cutters, farm processors, furnaces, item transport, warehouses.                     | Supply player and village projects.                   |
| Advanced Logistics      | Belts, pipes, splitters, filters, sorters, production rates, routing, storage networks.              | Enable larger settlements and trade supply.           |
| Magical Automation      | Mana furnaces, rune miners, mana batteries, arcane assemblers, golem workers.                        | Merge magic with infrastructure.                      |
| Late-Game Networks      | Portal logistics, city-scale supply, dimension resources, magical routing, automated ritual support. | Support endgame civilisation and realm-scale play.    |

## 17.1 First Automation Chains

| **Chain**                                      | **Inputs**                        | **Outputs**               | **Village Connection**                          |
|------------------------------------------------|-----------------------------------|---------------------------|-------------------------------------------------|
| Ore Miner -\> Furnace -\> Storage              | Ore deposit, fuel/power, storage. | Ingots.                   | Tools, weapons, blacksmith, walls, machines.    |
| Farm -\> Food Processing -\> Village Storage   | Crops, water, fuel/power.         | Food, meals, animal feed. | Survival, NPC needs, festivals, trade.          |
| Wood Cutter -\> Plank Maker -\> Builder Supply | Trees, power, storage.            | Logs, planks, beams.      | Housing, walls, blacksmith, warehouse, repairs. |

Monsters should not normally attack automation systems directly. Machines can be damaged by major events, siege-level threats, magical disasters, or specific hostile factions if designed later, but routine random monsters should not grief factories by default.

# 18. Magic Loop

Magic should be a practical world system, not only combat. The first unlocks should include a basic combat spell and a utility spell for mining, building, travel, or environmental interaction. Later magic can connect to automation, villages, wards, rituals, dimensions, and infrastructure.

| **Magic Source**  | **How It Teaches/Unlocks Magic**                                                |
|-------------------|---------------------------------------------------------------------------------|
| NPC Mages         | Teach basic spells, utility uses, schools, culture-specific magic, and quests.  |
| Ruins and Books   | Reveal forgotten spells, rune patterns, lore, rituals, and ancient systems.     |
| Research/Crafting | Convert resources into runes, tools, stations, components, and magical devices. |
| Practice/Use      | Improves familiarity, unlocks variants, or advances mastery over time.          |
| Exploration       | Find rare resources, shrines, dimensions, schools, and magical creatures.       |

| **Magic Role**         | **Examples**                                                                         |
|------------------------|--------------------------------------------------------------------------------------|
| Combat                 | Fire bolt, frost shard, lightning spark, shield, summon, curse, healing.             |
| Utility                | Light, mining pulse, vine bridge, water flow, block shaping, repair, levitation.     |
| Automation             | Mana furnace, rune miner, magical sorter, golem hauler, arcane battery.              |
| Village Support        | Protection ward, crop blessing, healing shrine, anti-monster lantern, weather charm. |
| Exploration/Dimensions | Rune keys, portal opening, realm navigation, corruption cleansing, ruin activation.  |

Magic risks should mainly apply to forbidden or dark magic and high-tier rituals. Normal utility and early magic should not punish the player constantly. Risk should be a meaningful design lever for power, morality, faction reaction, corruption, or world consequences.

# 19. Exploration Loop

Exploration should be motivated primarily by dungeons and bosses, while also delivering resources, ruins, lore, villages, cultures, magic unlocks, procedural structures, and new biomes. The world should guide players through a mix of authored logic and procedural generation.

| **Exploration Hook**  | **How It Appears**                                                                | **Reward/Outcome**                           |
|-----------------------|-----------------------------------------------------------------------------------|----------------------------------------------|
| Landmarks             | Towers, mountains, giant trees, ruins, smoke, lights, portals, statues.           | Navigation, curiosity, discovery.            |
| NPC Rumours           | Villagers mention caves, monsters, resources, caravans, ruins, or missing people. | Soft quest direction without forced markers. |
| Maps                  | Found, bought, crafted, or received through reputation.                           | Regional objectives and unknown areas.       |
| Roads/Trails          | Procedural routes connect villages, camps, ruins, mines, and structures.          | Natural guidance through the world.          |
| Dungeons/Bosses       | Caves, towers, ruins, nests, camps, shrines, dimension gates.                     | Loot, rare resources, story, progression.    |
| Procedural Generation | Seed creates varied biomes, caves, danger levels, villages, and structures.       | Replayability and uncertainty.               |

Caves should vary widely. Some are simple resource caves. Others are dangerous, monster-heavy, vertical, magical, flooded, biome-specific, or tied to bosses. Procedural generation should create different risk and reward profiles rather than a single cave type.

# 20. Combat, Threat, and Defence Loop

Combat should support multiple roles: major pillar for combat-focused players, important defence layer for villages, exploration danger for caves and dungeons, and optional or reduced danger for peaceful play. Threat systems should scale with difficulty and player choices.

| **Threat Source**           | **Default Role**                                       | **Progression Impact**                                              |
|-----------------------------|--------------------------------------------------------|---------------------------------------------------------------------|
| Night Monsters              | First common threat, especially outside light/shelter. | Encourages shelter, lighting, sleep, guard patrols, and safe roads. |
| Goblin Raids                | First civilisation threat.                             | Tests village defences and player response.                         |
| Random Spawning Monsters    | Procedural danger in wilderness and caves.             | Keeps exploration and night meaningful.                             |
| Cave Creatures              | Resource-area danger.                                  | Adds risk to mining and deeper progression.                         |
| Bandits/Hostile Factions    | Optional mid/late threat.                              | Connects combat to trade, politics, and conquest.                   |
| Magical/Dimensional Threats | Later escalation.                                      | Connects magic, dimensions, and world consequences.                 |

## 20.1 Raid Logic

Raids can be triggered by time, village growth, player actions, random events, danger level, faction conflict, nearby camps, wealth, or story conditions. This allows raids to feel systemic rather than purely scripted.

- Watchtowers should increase detection, archery, guard response, and early warning.

- Defensive walls should shape navigation, define boundaries, block direct entry, and create gate logic.

- Lighting should reduce basic monster pressure and improve village safety.

- Guards, patrols, traps, wards, and equipment should visibly change outcomes.

- Higher difficulty can allow harsher damage, NPC death, and permanent consequences.

# 21. Quest and Story Loop

Quests should come from all major systems: handwritten arcs, NPC needs, village simulation, exploration discoveries, faction conflicts, world events, and procedural circumstances. Story should be split between village growth, exploration, world events, faction arcs, and player choices.

| **Quest Source**    | **Examples**                                                                      | **Consequence Style**                   |
|---------------------|-----------------------------------------------------------------------------------|-----------------------------------------|
| Village Needs       | Food shortage, damaged wall, missing tools, blacksmith request, warehouse supply. | Mostly repeatable or recoverable.       |
| Handwritten Arcs    | Race stories, major faction arcs, ancient mystery, dimension storyline.           | Major consequences possible.            |
| Exploration         | Ruins, caves, lost NPCs, dungeon bosses, map fragments.                           | Rewards, lore, system unlocks.          |
| Faction Conflict    | Trade disputes, alliances, wars, spies, conquest, diplomacy.                      | Reputation, politics, world changes.    |
| World Events        | Raids, storms, festivals, corruption, caravan ambush.                             | Temporary or regional effects.          |
| Procedural Requests | Resource orders, monster bounties, escort, repair, delivery.                      | Low-stakes, flexible, sandbox-friendly. |

Failed minor quests can usually be retried, ignored, or replaced. Major quests can have consequences, but should generally avoid ending the entire world or permanently blocking all core progression. Consequence should create story, not destroy the sandbox.

# 22. Economy and Reputation Loop

Trade should range from minor convenience to major progression path, depending on player style. Villages should have real supply and demand. Reputation should exist at individual NPC, village, and faction levels.

| **Economy Layer** | **Function**                                                                                     |
|-------------------|--------------------------------------------------------------------------------------------------|
| Basic Trade       | Buy/sell resources, food, tools, blocks, books, maps, components, and local goods.               |
| Supply and Demand | Prices and requests respond to shortages, production, local resources, danger, and trade routes. |
| Village Economy   | Stored resources are consumed by NPC needs, buildings, jobs, repairs, trade, and defence.        |
| Trade Routes      | Villages can exchange goods; player can support, protect, disrupt, or dominate routes.           |
| Automation Supply | Player factories can feed village warehouses and become economic engines.                        |
| Faction Economy   | Larger groups can reward, punish, tax, embargo, or request resources later.                      |

| **Reputation Level** | **Tracked With**                                                      | **Unlocks**                                                                  |
|----------------------|-----------------------------------------------------------------------|------------------------------------------------------------------------------|
| Individual           | Named NPCs such as elder, blacksmith, mage, merchant, guard captain.  | Dialogue, personal quests, discounts, friendship, followers/workers.         |
| Village              | Settlement as a whole.                                                | Better prices, new quests, unique recipes, services, trust, requests.        |
| Faction              | Cultures, guilds, kingdoms, clans, orders, religions, hostile groups. | Faction arcs, trade access, alliances, enemies, military or magical support. |

Reputation should unlock better prices, new quests, unique recipes, and NPC followers/workers. Land or building permissions are not locked as a core reputation unlock in this document, but later settlement documents may revisit this as an optional faction or town-law system.

# 23. Player Settlement and Civilisation Loop

The player should be able to found their own settlement after first helping or learning from an existing village. This teaches the living-village systems before handing the player full control of founding, jobs, storage, defences, culture, and growth.

| **Settlement Layer** | **Design Direction**                                                                                |
|----------------------|-----------------------------------------------------------------------------------------------------|
| Founding Requirement | Unlocked after meaningful interaction with an existing village or equivalent discovery path.        |
| Identity Focus       | Settlement culture, magic identity, building style, production role, reputation, and player values. |
| NPC Systems          | Homes, jobs, schedules, storage, needs, families/generations later, migration, guards, builders.    |
| Production           | Farms, mines, workshops, storage, trade, automation, magic infrastructure.                          |
| Defence              | Walls, watchtowers, gates, patrols, traps, wards, lighting, emergency shelters.                     |
| Competition          | Player settlements can compete economically and politically with NPC villages.                      |

A player settlement should not simply be a decorative base with NPCs pasted on top. It should be a living extension of the village simulation, with real resource flows and meaningful identity choices.

# 24. Dimensions and Realm Loop

Dimensions should appear as early teasers and minor realms, with major dimensions unlocking later. They should not be isolated content bubbles. Each dimension should provide meaningful resources, story, magic, bosses, settlement upgrades, or overworld effects.

| **Dimension Role** | **Design Requirement**                                                                                    |
|--------------------|-----------------------------------------------------------------------------------------------------------|
| Early Teaser       | Visible portals, ruins, strange materials, dreams, rifts, or lore without full access.                    |
| Minor Realm        | Smaller pocket spaces, shrines, trials, dream spaces, fae pockets, or cave realms.                        |
| Major Dimension    | Full progression layer with unique blocks, mobs, resources, bosses, rules, structures, and risks.         |
| Overworld Effect   | Dimensions can influence events, corruption, resources, portals, weather, magic, and settlement upgrades. |
| Civilisation Link  | Realm resources or magic can support villages, wards, advanced machines, or faction arcs.                 |

The relation between dimensions and the overworld should vary by dimension. Some may mainly provide rare resources and portals. Others may create corruption, events, monsters, dreams, weather effects, or major story consequences.

# 25. Death, Failure, and Recovery

Death and failure should support multiple settings. The default should be recoverable but meaningful, with harder settings enabling severe penalties. The world should usually be recoverable after disaster, but recovery should require effort.

| **Failure Type** | **Possible Outcomes**                                                                              | **Default Philosophy**                                  |
|------------------|----------------------------------------------------------------------------------------------------|---------------------------------------------------------|
| Player Death     | Drop inventory, durability/resource loss, respawn penalty, grave recovery, difficulty-based rules. | Tombstone/grave recovery with adjustable harshness.     |
| Village Damage   | Buildings damaged, resources lost, NPCs injured, production disrupted.                             | Recoverable with labour/resources.                      |
| NPC Death        | Named NPCs may die; generic NPCs may be replaceable over time.                                     | Meaningful consequence without total system collapse.   |
| Village Collapse | NPCs migrate, village abandoned, conquered, corrupted, or destroyed.                               | Possible but not common on default settings.            |
| Quest Failure    | Minor quests retry or expire; major quests can change outcomes.                                    | Consequence should create story, not block the sandbox. |

# 26. Multiplayer Gameplay Loop

Multiplayer should be designed from the start, even if implemented later. The structure should support solo, split-screen, LAN, and online multiplayer in a way similar to Minecraft-style world ownership and joining. Core systems should not assume only one player exists.

| **Multiplayer Area**   | **Locked Direction**                                                                                             |
|------------------------|------------------------------------------------------------------------------------------------------------------|
| Supported Modes        | Solo, split-screen, LAN, and online multiplayer should be considered during design.                              |
| Progression            | Players can do everything equally; no forced class roles.                                                        |
| Natural Specialisation | Players may voluntarily focus on building, magic, combat, trade, engineering, farming, or exploration.           |
| Reputation             | Each player has individual reputation, even in shared worlds. Later systems may optionally add group reputation. |
| Villages               | Villages should react to actions by the responsible player where possible.                                       |
| Automation and Storage | Shared infrastructure should support permissions, labels, or ownership later if needed.                          |

Individual reputation is important because one player may be a village hero while another is a thief, conqueror, or troublemaker. The world should be able to distinguish them where practical.

# 27. UI and Feedback Loop

Because the game contains deep systems, UI feedback must be clear, readable, and adjustable. Players should be able to track goals through quest logs, request boards, map markers, NPC dialogue, world alerts, event alerts, tooltips, recipe books, and help/codex menus.

| **Feedback Area** | **Required Feedback**                                                                                         |
|-------------------|---------------------------------------------------------------------------------------------------------------|
| Village Progress  | Progress bars, visible construction stages, NPC dialogue, storage numbers, completion celebrations/events.    |
| Automation        | Machine UI panels, visible item movement, production rates, blocked machine warnings, magical visual effects. |
| Survival          | Readable needs, weather warnings, temperature feedback, food/water status, injury/illness indicators.         |
| Threats           | Raid warnings, bells, guard calls, map alerts, smoke/fire, monster sounds, danger icons if enabled.           |
| Exploration       | Landmarks, maps, rumours, discovered points, optional markers, codex entries.                                 |
| Tutorial/Help     | Adjustable explanation level: minimal, contextual, guided, or full help.                                      |

The player should be able to adjust explanation intensity in settings. A first-time player may want tutorial quests and tooltips. A veteran may want discovery and minimal UI.

# 28. Pacing and Balance Philosophy

Pacing should be moderate with steady unlocks. However, exact timing must remain seed-dependent and player-dependent. Like Minecraft, iron tools might take a few minutes, thirty minutes, an hour, or longer depending on spawn, resource luck, cave access, player choices, and first goals.

| **Progression Moment** | **Timing Philosophy**                                                                            |
|------------------------|--------------------------------------------------------------------------------------------------|
| Basic Tools            | Should usually happen quickly, but terrain and player choice can vary the pace.                  |
| Iron Tools             | Seed and player goals matter. It can be quick or delayed without breaking the game.              |
| First Automation       | Can happen at different times depending on resource access, tutorial settings, and player focus. |
| First Village Upgrade  | Can happen early or late depending on whether a village is found, helped, and supplied.          |
| Magic Unlock           | Usually discovered through ruins, mage NPCs, books, or special resources, not instant.           |
| Escalation             | Moderate and steady; avoid overwhelming the player with too many major systems at once.          |

Difficulty settings should control survival harshness, event frequency, raid severity, NPC death, resource scarcity, death penalty, tutorial help, peaceful play, and world risk. Pacing should also be influenced by world settings where appropriate.

# 29. Proof-of-Concept Gameplay Loop

The POC should prove the full integrated loop, but it must be built in stages one thing at a time. The goal is not to build the whole final game. The goal is to prove that survival, gathering, automation, real village storage, NPC construction, magic, and threat outcomes can connect.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>POC Target Loop</strong></p>
<p>Gather -&gt; craft -&gt; build -&gt; automate -&gt; supply village -&gt; village consumes real resources -&gt; village grows -&gt; threat happens -&gt; village defences change the outcome.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **POC System**    | **What It Proves**                                                                                       |
|-------------------|----------------------------------------------------------------------------------------------------------|
| Warehouse         | Village storage, resource tracking, player delivery, automation-to-village supply, and real consumption. |
| Blacksmith        | New building unlocks jobs such as blacksmith and apprentice, and creates tool/weapon economy.            |
| Watchtower        | Defence building, more guards, early warning, better raid response, visible upgrade.                     |
| Defensive Wall    | Village boundary, navigation around town/city border, gate logic, pathfinding, defence layout.           |
| Automation Chains | Ore, wood, stone, food, mana, and building components can be produced and supplied.                      |
| Magic Features    | Mana furnace, rune-powered miner, combat spell, utility spell, village ward, rune crafting table.        |
| Threats           | Goblin raid, night monsters, random spawning monsters, cave creature pressure.                           |

## 29.1 Recommended POC Stage Breakdown

| **Stage** | **Build Target**                                                                 | **Success Test**                                                                 |
|-----------|----------------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| Stage 1   | Basic movement, gathering, inventory, crafting, block placement, simple shelter. | Player can survive, gather wood/stone, craft tools, and build a small structure. |
| Stage 2   | One NPC village shell with named NPCs, simple schedules, and request board.      | Player can find a village and understand basic needs.                            |
| Stage 3   | Village warehouse with real stored resources and manual delivery.                | Delivered resources appear in village storage and can be consumed by a project.  |
| Stage 4   | One construction project, preferably warehouse or watchtower first.              | NPC builder consumes resources and visibly builds in stages.                     |
| Stage 5   | First automation chain: wood, stone, or ore to storage.                          | Machine output reaches storage and reduces manual gathering.                     |
| Stage 6   | Automation-to-village supply link.                                               | Factory outputs can feed the village warehouse.                                  |
| Stage 7   | First magic feature: utility spell or mana furnace/rune table.                   | Magic affects world interaction or production.                                   |
| Stage 8   | First threat event: night monsters or goblin raid.                               | Village defences, guards, and player preparation change the outcome.             |
| Stage 9   | Expanded POC village projects: blacksmith, watchtower, defensive wall.           | New jobs, defences, pathfinding, and storage consumption are validated.          |

## 29.2 POC Production Outputs

The final POC target can include production of iron ingots, stone bricks, timber/planks, food, mana crystals/refined mana, and finished village building components. These should be implemented gradually, beginning with the simplest chain that proves the storage and consumption loop.

# 30. Example Gameplay Scenarios

## 30.1 Wilderness Survivor Start

The player spawns in a forest with no village visible. They gather wood, stone, berries, and fibre, craft crude tools, build a small shelter, and survive the first night. The next day they follow smoke on the horizon, discover a hamlet, and learn that the village lacks stone and tools. The player can help immediately, ignore them, trade, or continue exploring.

## 30.2 Village Helper Start

The player finds a struggling village after a short walk. Farmers have food but the warehouse is nearly empty of timber. A builder wants to repair a damaged watchtower. The player chops trees manually at first, delivers planks, gains reputation, and later automates wood cutting to keep the village supplied.

## 30.3 Automation Engineer Path

The player focuses on copper, iron, water wheels, storage, and processing. They build a small ore line, route ingots into storage, and then connect output to a village warehouse. The blacksmith starts producing better tools, guards improve equipment, and the village begins requesting larger construction supplies.

## 30.4 Mage Explorer Path

The player ignores automation early and follows rumours of a ruined tower. Inside, they find a basic utility spell and a damaged rune table. A nearby mage NPC explains that mana crystals can power special machines. The player uses magic to mine difficult resources, then returns to villages with knowledge and rare components.

## 30.5 Conqueror Path

The player builds weapons, recruits followers, and attacks a weak village. The game allows conquest, but consequences follow. Surviving NPCs may fear or hate the player, nearby factions may respond, trade may collapse, and the village may become productive only through control, intimidation, or replacement systems. Evil play should be supported honestly, not faked.

## 30.6 Multiplayer Group Path

One player builds a base, one explores caves, one helps the village, and one experiments with farms and machines. Each player can do everything, but they naturally specialise. Reputation is tracked individually, so the village may trust the helper while distrusting the thief or aggressor. Shared infrastructure creates group goals without forcing roles.

# 31. Core Design Rules for Future Documents

| **Rule**                       | **Meaning for Later Documents**                                                                                               |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| Connect Systems                | Blocks, items, recipes, NPC jobs, magic, monsters, and structures should connect to multiple gameplay loops where reasonable. |
| Respect Sandbox Freedom        | Do not design future systems as mandatory linear chores unless they are explicitly tutorial or major story content.           |
| Support Procedural Variation   | Do not assume fixed village distance, resource availability, cave danger, or magic discovery order.                           |
| Use Difficulty Settings        | Harsh survival, NPC death, event frequency, death penalties, and peaceful play should be adjustable.                          |
| Make Villages Real             | Village storage, consumption, construction, jobs, and danger should be concrete, visible, and consequential.                  |
| Automation Serves Civilisation | Machines should not only make items for the player; they should feed settlements, trade, defence, magic, and construction.    |
| Magic Is Practical             | Magic should affect combat, utility, infrastructure, automation, villages, exploration, and dimensions.                       |
| POC in Stages                  | Never attempt the full POC all at once. Build one loop, prove it, then connect the next loop.                                 |
| No Final Ending Required       | Major story arcs can conclude, but the sandbox continues.                                                                     |

# 32. Open Design Questions for Later Documents

The following questions should be answered in later system documents, not in this core loop document. They are recorded here so the design remains consistent.

- What exact blocks, items, tools, machines, and materials are required for the POC?

- What are the starting races, cultures, and village types?

- How many NPC jobs are required for the first village simulation slice?

- What are the first magic schools, spells, stations, risks, and research requirements?

- What is the first automation power model: fuel, water wheel, windmill, or mixed?

- How detailed should hunger, thirst, temperature, illness, and sleep be at each difficulty level?

- What are the exact POC monster behaviours and spawn rules?

- How should village boundaries, walls, gates, and pathfinding be represented technically?

- How should individual, village, and faction reputation be stored and displayed?

- Which POC project should be built first: warehouse, watchtower, blacksmith, or defensive wall?

**End of Document 01 - Core Gameplay Loop v0.1**
