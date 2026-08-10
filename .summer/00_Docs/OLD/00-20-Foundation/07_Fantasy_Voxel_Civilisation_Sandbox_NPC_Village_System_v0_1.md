**Fantasy Voxel Civilisation Sandbox**

**07 - NPC Village System**

*Version 0.1 - Detailed Design Bible Draft*

A database-ready NPC and village simulation system for living settlements, real resource consumption, jobs, schedules, needs, warehouses, construction projects, reputation, raids, families, magic, automation, and proof-of-concept village growth.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>NPC Village System Statement</strong></p>
<p>NPC villages are not decorative structures or quest hubs only. They are living social and economic systems: named residents have homes, jobs, needs, schedules, skills, inventories, relationships, and memory flags, while the village as a whole consumes real resources, builds projects, suffers damage, trades, grows, migrates, remembers the player, and reacts to danger. The player can help, ignore, automate, trade with, exploit, conquer, or rebuild these settlements.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Field**       | **Locked Direction**                                                                                                                                                                                                                                                             |
|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope  | Covers NPC identity, jobs, needs, schedules, village storage, warehouses, requests, reputation, village projects, construction, raids, families, migration, magic/automation integration, simulation LOD, UI, data fields, and POC scope.                                        |
| Boundary        | References player-founded settlements and permission rules, but the full player-founded settlement/city control layer should be expanded in a later Settlement System document.                                                                                                  |
| Core Philosophy | Blend Millenaire-style village workers with colony-sim and light life-sim depth. NPCs should be functional, memorable, and system-connected rather than static villagers.                                                                                                        |
| POC Direction   | Prove one forest hamlet with elder, builder, farmer, guard, merchant, mage, miner, lumberjack, shared warehouse, request board, staged watchtower project, basic trust/reputation, automation-fed supplies, and a goblin raid outcome that changes based on village preparation. |
| Data Direction  | Use unique IDs, database/spreadsheet-ready fields, tags, parent templates, planning status, and clean separation between shipped gameplay data and planning metadata.                                                                                                            |

# Document Purpose

This document defines how NPC villages work across the Fantasy Voxel Civilisation Sandbox. It turns the high-level promise of living civilisations into concrete gameplay rules: what NPCs are, what they remember, what jobs they perform, what resources they consume, how warehouses work, how construction projects are built, how raids damage settlements, how reputation and fear change behaviour, and how the proof-of-concept village should function.

This document does not replace the future Automation System, Magic System, Economy System, Combat and Defence System, Races/Cultures/Factions document, or full Player Settlement System. Instead, it creates the NPC/village-facing rules those later systems must support.

# Design Source

| **Source Document**               | **Relevant Direction**                                                                                                                                                                                                                              | **How This Document Uses It**                                                                                                                                           |
|-----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible     | The main hook is that magic and factories build civilisations, unlock stories, power settlements, and reshape the world. Villages can grow, trade, struggle, build, fight, be helped, ignored, exploited, conquered, or destroyed.                  | NPC villages are designed as the central civilisation layer: real resources, growth stages, story unlocks, morality reactions, danger, and player choice all meet here. |
| 01 - Core Gameplay Loop           | The POC loop is gather -\> automate -\> supply village -\> village consumes real resources -\> village grows -\> threat outcome changes. Daily NPC schedules, request boards, and world events are key loop elements.                               | The POC section focuses on a forest hamlet, warehouse supply, staged watchtower construction, and a raid whose outcome changes based on preparation.                    |
| 02 - Player Progression System    | Progression is multi-track: materials, skills, recipes, magic, automation, villages, reputation, exploration, dimensions, and morality. Reputation supports helper, trader, defender, conqueror, and villain paths.                                 | Village reputation, trust, fear, faction standing, permissions, NPC teaching, and conqueror progression are treated as proper progression systems.                      |
| 03 - Blocks Registry              | Blocks include village warehouses, blueprint/project anchors, storage, defence, magic, automation, damage states, repair states, and NPC-interactive blocks.                                                                                        | NPC construction, repair, storage, job-site markers, village permissions, and block states are defined as village simulation requirements.                              |
| 04 - Items Registry               | Items support NPC economies, real item consumption, tools, food, magic components, trade goods, quality, durability, spoilage, knowledge, and village needs.                                                                                        | NPCs consume real food, tools, medicine, repair supplies, guard equipment, cultural goods, and magic resources through item tags and storage categories.                |
| 05 - Crafting and Recipe Registry | NPC/village project recipes consume exact stored resources over build stages using NPC jobs. Warehouse automation requires trust/permission.                                                                                                        | Village projects use ProjectRecipe entries with stage gates, reserved resources, builders, scaffolds, and visible construction.                                         |
| 06 - Resource Progression         | Resources are civilisation inputs, automation feedstock, magic catalysts, strategic assets, trade goods, and dimension keys. Villages consume exact stored resources for food, repairs, buildings, defence, tools, trade, culture, and story gates. | Warehouses, supply/demand, strategic scarcity, cultural preference, and automation-fed village supply become core simulation rules.                                     |

# Static Table of Contents

- 1\. Locked NPC Village System Identity

- 2\. Player Answer Decision Summary

- 3\. NPC/Village System Architecture

- 4\. Parent NPC, Village, and Runtime Data Model

- 5\. NPC Identity, Names, Traits, and Memory

- 6\. Needs, Survival, Morale, and Consumption

- 7\. Jobs, Skills, Tools, and Labour

- 8\. Schedules, AI States, and Local Simulation

- 9\. Village Storage, Warehouses, Supply, and Permissions

- 10\. Construction, Repairs, Blueprints, and Village Projects

- 11\. Village Growth Stages and Unlock Gates

- 12\. Reputation, Fear, Trust, Morality, and Player Freedom

- 13\. Dialogue, Request Boards, Quests, and Story Unlocks

- 14\. Economy, Trade, Caravans, and Culture Goods

- 15\. Danger, Raids, Guards, Damage, and Disaster

- 16\. Families, Population, Migration, and Generations

- 17\. Magic, Golems, Automation, and Special Labour

- 18\. Simulation LOD, Performance, and Multiplayer

- 19\. UI, Feedback, Data, and Registry Rules

- 20\. Proof-of-Concept Village Scope

- 21\. Detailed NPC/Village Registry v0.1

- 22\. Core POC Scenario: Forest Hamlet Watchtower Loop

- 23\. Balancing Rules

- 24\. Open Questions for Later Documents

- Appendix A. POC Village Checklist

- Appendix B. NPC/Village Database Field Templates

- Appendix C. Cross-System Use Matrix

- Appendix D. Future NPC/Village Backlog

# 1. Locked NPC Village System Identity

The NPC Village System is the social, economic, and consequence layer of the game. It is where gathered blocks, crafted items, recipes, resources, magic, automation, quests, raids, and morality become visible civilisation change. A village should not be a static decoration that gives quests. It should be a settlement made of people, homes, jobs, storage, projects, risks, culture, and history.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Locked Rule</strong></p>
<p>Every major NPC or village feature should answer at least one gameplay question: what does this person need, produce, protect, teach, trade, build, remember, unlock, or risk losing? If a village feature does not connect to survival, crafting, automation, magic, story, defence, economy, reputation, or world-state change, it should be simplified, redesigned, or deferred.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**   | **Design Meaning**                                                                                                                   | **Player-Facing Result**                                                                     |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| Living People        | NPCs have persistent names, homes, jobs, schedules, inventories, relationships, skills, and memory flags.                            | Players remember villagers as people and care when they thrive, suffer, migrate, or die.     |
| Civilisation Economy | Villages request, store, consume, reserve, trade, and lose real resources.                                                           | Mining, farming, crafting, and automation visibly affect settlement survival and growth.     |
| Construction Engine  | Village projects use stored resources, blueprints, builders, stages, damage states, and repair logic.                                | A watchtower, wall, shrine, market, school, or mage tower feels earned and visible.          |
| Social Progression   | Trust, fear, reputation, faction standing, and individual memory control access, dialogue, prices, permissions, teaching, and story. | Helping, ignoring, exploiting, conquering, or using forbidden magic creates different paths. |
| Threat Target        | Raids, shortages, sickness, corruption, disaster, conquest, and theft can damage the village.                                        | Defences, guard equipment, wards, food stores, roads, and player intervention matter.        |
| Story Gate           | Village growth unlocks culture stories, leaders, archives, rituals, specialists, dimensions, and faction arcs.                       | Civilisation growth becomes a path to lore and progression, not only population increase.    |
| Scalable Simulation  | Nearby villages simulate in detail, while distant villages use abstract state, resource totals, risk rolls, and event summaries.     | The world feels alive without requiring impossible performance budgets.                      |

This document intentionally merges NPC world simulation and the village mechanics required to make NPCs function. Full player-founded settlement/city control, law systems, districts, and ruler tools should be expanded later, but this document already defines the shared foundations they will use.

# 2. Player Answer Decision Summary

The following table converts the selected multiple-choice answers into locked NPC/village-system decisions. Where multiple options were selected, the document uses a hybrid rule rather than treating them as contradictions.

| **Area**                    | **Locked Decision**                                                                                                                                                                                                                                |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Scope                       | Full NPC/village design-bible document covering behaviour, jobs, needs, schedules, storage, requests, reputation, projects, raids, UI, data fields, and POC scope. Player-founded settlements are referenced but saved for deeper expansion later. |
| POC Scale                   | Small but functional POC: one village with elder, builder, farmer, guard, merchant, mage, miner, lumberjack, shared warehouse, watchtower project, basic reputation, and raid outcome.                                                             |
| NPC Identity                | All village residents are persistent named NPCs. Travellers, temporary workers, raiders, and distant background agents can use generated or generic labels until promoted by interaction.                                                          |
| Schedules                   | Scalable job-based schedules: work, eat, rest, sleep, flee, defend, socialise, worship, trade, repair, and event reactions. Detail increases for nearby/important settlements.                                                                     |
| Inventories and Carrying    | NPCs have personal inventories for tools, food, gear, job items, and trade items. Workers carry resources locally; distant/large transfers may be abstracted.                                                                                      |
| Skills                      | Job skills affect speed, quality, material waste, combat, teaching, output quality, and project success without needing full RPG stats for every villager.                                                                                         |
| Needs                       | NPCs need food, shelter, safety, tools, work access, morale, medicine, and culture goods. Water is abstracted through wells/water access. Spoilage exists but can scale with difficulty/world settings.                                            |
| Consumption                 | Villagers consume real items over time: food, tools, fuel, medicine, clothing, repair supplies, guard equipment, cultural goods, and project materials.                                                                                            |
| Jobs                        | Jobs are driven by buildings, skills, tools, schedules, available resources, and village need. NPCs can change jobs when crisis, death, leadership, settlement status, or building changes require it.                                             |
| Storage                     | Use a hybrid storage model: physical warehouses, chests, barns, silos, armories, and magical stores with a summary UI. Projects reserve resources so daily consumption does not steal them.                                                        |
| Permissions                 | Automation can feed village warehouses after trust/permission. NPCs can only use player chests if ownership, reputation, donation flags, or settlement laws allow it.                                                                              |
| Theft and Crime             | Use a full crime foundation: witnesses, guards, fines, reputation loss, jail/exile possibilities, village/faction response, and future law hooks.                                                                                                  |
| Construction                | Use visible staged blueprint construction with scaffolds and supply crates. Nearby important builds can place actual blocks; far-away builds simulate abstractly.                                                                                  |
| Repairs                     | Villages can repair automatically if resources exist, but trusted-player or player-founded settlements can require approval, repair priorities, or project permissions.                                                                            |
| Project Types               | Full game supports homes, roads, farms, workshops, storage, markets, walls, gates, towers, shrines, mage buildings, schools, monuments, portals, castles, districts, megaprojects, wonders, and floating cities.                                   |
| Growth                      | Camp -\> Hamlet -\> Village -\> Fortified Village -\> Town -\> City -\> Capital -\> Magical Metropolis. Growth requires population, food, housing, safety, specialists, projects, resources, culture story, and events.                            |
| Independent Growth          | Villages grow without the player, but very slowly and heavily stunted. Player help, automation, protection, trade, and magic act as major accelerators.                                                                                            |
| Reputation                  | Per-village reputation plus faction/culture reputation plus trust/fear modifiers. Major actions are remembered: deliveries, theft, rescues, raids, conquest, forbidden magic, deaths, and repairs.                                                 |
| Player Freedom              | Players may protect, ignore, trade, automate, exploit, conquer, or destroy villages. Exploitation/conquest creates fear, tribute, rebellion, resistance, faction response, and alternate story paths.                                              |
| Death and Failure           | NPC death is permanent by default, with world settings able to soften consequences. Destroyed settlements can become ruins, refugee sources, monster camps, conquered sites, haunted sites, or rebuild projects.                                   |
| Dialogue and Quests         | Dialogue trees plus generated request lines, relationship state, job comments, event reactions, handcrafted story quests, generated needs, request boards, and village growth story unlocks.                                                       |
| Trade                       | POC can use simple/static trade, while the full game supports supply/demand, culture preference, shortages, reputation, danger, faction access, caravans, trade routes, and resource competition.                                                  |
| Raids and Defence           | Dynamic raids scale with threat, wealth, faction hostility, world events, and defence. The POC raid proves that watchtower completion changes guard effectiveness, damage, survival, and reputation.                                               |
| Families and Migration      | Families, children, aging, inheritance, mourning, migration, refugees, specialists, travellers, and deserters exist, controlled by pacing and world settings.                                                                                      |
| Magic and Automation        | Magic supports wards, healing, rituals, mana lights, farming boosts, corruption cleansing, portals, golems, and village projects. Automation supply can stabilise or destabilise villages depending on machine/resource risk.                      |
| Performance and Multiplayer | Detailed simulation nearby, abstract simulation far away. Multiplayer uses shared village/world reputation plus individual modifiers and ownership/permission fields from the start.                                                               |
| UI and Data                 | POC UI includes dialogue, request board, warehouse UI, project progress, reputation indicator, and raid warning. Full UI expands to village overview, NPC list, jobs, needs, storage, projects, threats, trade, permissions, and event history.    |

# 3. NPC/Village System Architecture

The NPC/Village System should be data-driven from the beginning. The player sees named villagers, buildings, boards, warehouses, jobs, raids, and construction projects. The game internally tracks several linked records: NPC templates, village templates, job sites, households, needs, inventories, projects, events, reputation profiles, permissions, and culture/faction state.

| **Layer**                    | **Purpose**                                                                                    | **Examples**                                                                                                      |
|------------------------------|------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| Base NPC Definition          | The parent record for all NPCs and humanoid agents.                                            | ID, display name, type, culture, job slots, needs profile, schedule profile, inventory rules, relationship flags. |
| NPC Runtime State            | The mutable state for an individual NPC in a save file.                                        | Current job, current task, hunger, morale, tool durability, wounds, home, worksite, carried item, memory flags.   |
| Job Template                 | Defines what work can be performed and what is required.                                       | Farmer requires field/seed/tool; builder requires blueprint/storage/tools; guard requires weapon/post.            |
| Household Template           | Defines home membership, family links, bed use, household storage, morale hooks.               | Parents, children, elders, shared food, mourning state, inheritance, migration desire.                            |
| Village Definition           | The settlement-level record and static metadata.                                               | Village ID, culture, biome, stage, founder, faction, layout template, difficulty/risk rules.                      |
| Village Runtime State        | The mutable state of the settlement.                                                           | Population, food reserves, morale, threat level, active projects, damage, warehouse contents, reputation.         |
| Storage/Warehouse System     | Physical and summary storage for items/blocks used by NPCs and projects.                       | Food stores, construction stock, armory, medicine shelf, magic vault, player donation chest.                      |
| Project System               | Blueprints, stages, reserved resources, construction sites, builders, timings, consequences.   | Watchtower foundation, frame, platform, wall repair, shrine upgrade, road project.                                |
| Event System                 | Village events generated from needs, danger, growth, faction state, and world systems.         | Goblin raid, caravan, famine, festival, sickness, fire, refugee arrival, corruption outbreak.                     |
| Reputation/Permission System | Tracks trust, fear, standing, crimes, permissions, individual modifiers, and faction reaction. | Warehouse import permission, building permission, shop access, teaching, exile, tribute.                          |
| Simulation LOD               | Controls how much detail runs based on proximity, importance, hardware, and difficulty.        | Full local AI nearby; daily resource rolls far away; event summaries on return.                                   |
| Planning Metadata            | Documentation-only scope and readiness markers.                                                | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                                                     |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Important Data Rule</strong></p>
<p>Planning scope, POC status, Alpha/Beta/Final status, and balance-draft comments are documentation fields only. They should not become hard gameplay properties inherited by NPCs or villages. Shipped gameplay data should remain clean, moddable, and reusable.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 4. Parent NPC, Village, and Runtime Data Model

| **Parent Class / Data Layer** | **Inherits / Controls**                                                                                                            | **Example Children**                                      |
|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------|
| BaseNPC                       | Identity, species/culture, display name, age band, role tags, needs profile, schedule profile, inventory rules, interaction types. | All NPCs.                                                 |
| ResidentNPC                   | Home requirement, household link, village membership, reputation link, daily schedule, personal memory.                            | Farmers, miners, builders, children, elders.              |
| WorkerNPC                     | Job site, tool requirements, work actions, output rules, skill growth, carried items, task queue.                                  | Farmer, lumberjack, miner, builder, carpenter, cook.      |
| SpecialistNPC                 | Teaching, unique recipes, shop stock, special station use, culture unlocks, quest hooks.                                           | Mage, blacksmith, alchemist, scholar, priest, golemancer. |
| LeaderNPC                     | Village request logic, diplomacy, project approval, emergency declarations, law/permission hooks.                                  | Elder, chief, mayor, council head, clan leader.           |
| GuardNPC                      | Combat role, patrol route, guard post link, equipment needs, threat response, arrest/chase rules.                                  | Militia guard, captain, archer, tower sentry.             |
| ChildNPC                      | Safety behaviour, education path, growth timers, family morale hooks, non-combat response.                                         | Village child, apprentice, orphan refugee.                |
| TravellerNPC                  | Temporary settlement presence, trade/rumour hooks, migration possibility, route state.                                             | Merchant caravaner, wandering mage, refugee, deserter.    |
| RaiderNPC                     | Hostile faction behaviour, loot target, raid objective, flee threshold, drop table.                                                | Goblin raider, bandit thief, cult saboteur.               |
| GolemWorkerNPC                | Constructed status, owner, command profile, fuel/charge, permitted jobs, ethics/reaction flags.                                    | Hauling golem, builder golem, guard golem, miner golem.   |

| **Village Data Layer** | **Controls**                                                                                             | **Notes**                                           |
|------------------------|----------------------------------------------------------------------------------------------------------|-----------------------------------------------------|
| BaseVillage            | Village ID, display name, culture, biome, faction, stage, layout family, settlement rules.               | Static and semi-static definition.                  |
| VillageRuntimeState    | Population, morale, threat, food reserve, safety score, active projects, damaged buildings, event queue. | Save-game mutable state.                            |
| CultureProfile         | Preferred blocks/items, architecture, foods, festivals, taboos, magic reaction, trade preferences.       | Expanded in Races/Cultures/Factions.                |
| StorageProfile         | Warehouse capacity, category limits, permissions, reserves, import/export rules, spoilage rules.         | Connects to items, blocks, automation, and economy. |
| ProjectProfile         | Available projects, prerequisites, resource requirements, job roles, stage timings, unlock outputs.      | Connects to recipe/project registry.                |
| ThreatProfile          | Raid chance, monster types, faction enemies, corruption risk, disaster vulnerability, defence score.     | Connects to combat/defence and world events.        |
| ReputationProfile      | Trust, fear, faction standing, crimes, individual modifiers, permissions, memory flags.                  | Supports helper and tyrant paths.                   |
| SimulationLODProfile   | Nearby detail, far-away tick rate, abstract risk rules, catch-up summaries.                              | Performance-critical.                               |

## 4.1 Example Parent Inheritance

| **Example**   | **Inheritance Chain**                                                         | **What It Gains Automatically**                                                                                                                     |
|---------------|-------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| POC Builder   | BaseNPC -\> ResidentNPC -\> WorkerNPC -\> BuilderNPC -\> ForestHamletVariant  | Home need, village membership, builder schedule, tool requirements, blueprint interaction, warehouse withdrawal, construction skill, repair action. |
| Village Mage  | BaseNPC -\> ResidentNPC -\> SpecialistNPC -\> MageNPC -\> CultureVariant      | Teaching hooks, rune/mana recipe access, ward maintenance, magic request generation, forbidden magic reactions, ritual story hooks.                 |
| Goblin Raider | BaseNPC -\> RaiderNPC -\> FactionEnemyNPC -\> GoblinRaiderVariant             | Hostile AI, raid objective, warehouse theft target, flee threshold, drop table, faction reputation effects.                                         |
| Forest Hamlet | BaseVillage -\> CultureVillage -\> ForestHamletTemplate -\> POCVillageRuntime | Stage limits, architecture set, food needs, job sites, warehouse rules, watchtower project, goblin raid profile.                                    |

# 5. NPC Identity, Names, Traits, and Memory

All normal village residents should have persistent names. This is essential for emotional attachment, memory, dialogue, quests, family systems, death, migration, and village history. Generic labels can still be used for temporary raiders, distant traders, or low-importance background agents until the player interacts with them or they become important.

| **Identity Field** | **Purpose**                                                    | **Gameplay Use**                                                                  |
|--------------------|----------------------------------------------------------------|-----------------------------------------------------------------------------------|
| npc_id             | Unique internal ID.                                            | Save data, quests, relationships, death records, event logs.                      |
| display_name       | Player-facing generated or authored name.                      | Dialogue, UI, request board, memorials, reputation logs.                          |
| culture_id         | Links NPC to culture/race rules.                               | Architecture, food preference, taboos, names, recipes, magic reaction.            |
| home_id            | Home or household assignment.                                  | Sleep schedule, safety behaviour, morale, family links.                           |
| job_id             | Current job role.                                              | Work schedule, tool needs, outputs, services, project participation.              |
| skill_profile      | Job skill and specialist capability.                           | Speed, quality, waste, combat, teaching, construction success.                    |
| need_profile       | Food, shelter, safety, tools, morale, medicine, culture needs. | Shortages, requests, migration risk, work speed.                                  |
| inventory_profile  | Personal carried items and equipment.                          | Tools, food, trade goods, weapons, arrows, medicine, carried project resources.   |
| relationship_flags | Family, mentor, rival, friend, leader, apprentice, follower.   | Dialogue, morale, mourning, apprenticeship, story hooks.                          |
| memory_flags       | Major events and player actions remembered by the NPC.         | Theft, rescue, trade, death witnessed, forbidden magic, conquest, heroic defence. |

## 5.1 NPC Memory Scope

The system should not try to store every tiny interaction forever. Instead, it should store meaningful memory flags at three levels: individual NPC memory, village memory, and faction/culture memory.

| **Memory Level** | **Examples**                                                                                                                               | **Effect**                                                                                  |
|------------------|--------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Individual NPC   | Player saved this NPC, stole from their household, killed family member, healed them, taught them, hired them.                             | Dialogue changes, personal trade modifier, fear/trust modifier, follower/recruitment hooks. |
| Village          | Player delivered watchtower materials, ignored a famine, defended raid, stole from warehouse, automated food supply, conquered settlement. | Request board, prices, guards, permissions, project access, festivals, story branches.      |
| Faction/Culture  | Player repeatedly helps dwarven villages, uses forbidden magic near temple towns, conquers goblin camps, liberates settlements.            | Faction standing, diplomacy, unique recipes, hostility, patrols, culture story access.      |

# 6. Needs, Survival, Morale, and Consumption

NPC needs should be meaningful but not become overwhelming micromanagement. Needs create trade opportunities, generated quests, construction goals, automation demand, and consequences. The default should be readable and fair, with harsher simulation available through difficulty/world settings.

| **Need Category** | **How It Is Satisfied**                                                                           | **Shortage Effects**                                                                                    |
|-------------------|---------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| Food              | Village food store, farms, hunting, fishing, trade, player donations, automated food supply.      | Work slows, morale drops, sickness risk rises, migration/desperation can occur depending on difficulty. |
| Water Access      | Wells, rivers, rain barrels, pumps, water storage, magical springs.                               | Abstracted water access penalty; harsh settings can require containers/purification.                    |
| Shelter           | Valid homes, beds, safe sleeping areas, warmth and weather protection.                            | Sleep loss, morale loss, migration risk, illness/weather penalties.                                     |
| Safety            | Lighting, walls, gates, guard posts, watchtowers, patrols, wards, cleared threats.                | Fear rises, non-combatants hide, work routes shrink, migration risk, raids become worse.                |
| Tools             | Job tools, repair supplies, replacement parts, specialist gear.                                   | Workers slow or stop; quality drops; project build time rises.                                          |
| Medicine          | Herbs, bandages, healer access, potions, temple care, alchemy.                                    | Injured/sick NPCs recover slowly, death risk rises, morale drops.                                       |
| Morale            | Food stability, safety, homes, festivals, family survival, culture goods, fair treatment.         | Lower productivity, less trade friendliness, migration, rebellion, despair events.                      |
| Culture Needs     | Religious icons, festival goods, preferred foods, building style, magic materials, story objects. | Culture story stalls, reputation gains shrink, specialist unlocks delayed.                              |
| Work Access       | Available job site, path, tools, storage, inputs, and schedule window.                            | NPC idles, job output stops, village stagnates.                                                         |

## 6.1 Need Severity Bands

| **Severity** | **Description**                                                                   | **Simulation Response**                                                                    |
|--------------|-----------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------|
| Stable       | Need is satisfied with buffer.                                                    | Normal work, normal morale, positive dialogue.                                             |
| Low          | Need is being met but with little reserve.                                        | Request board warning, minor price changes, NPC comments.                                  |
| Shortage     | Need is below safe threshold.                                                     | Generated requests, work slowdown, morale penalty, trade price shift.                      |
| Crisis       | Need has been unmet long enough to threaten survival.                             | Migration risk, sickness/injury risk, desperation events, leadership requests direct help. |
| Collapse     | Need failure combines with danger, repeated raids, corruption, or severe neglect. | Abandonment, death, conquest, refugee event, destroyed/ruined village state.               |

## 6.2 Spoilage and Preservation

Fresh foods can spoil, cooked meals last longer, and preserved foods last longest. Spoilage can be reduced, disabled, or simplified by world settings. Villages should favour stable staples for long-term survival: grain, dried meat, salted food, smoked fish, preserved fruit, root vegetables, and culture-specific staples.

| **Food Type**  | **Default Simulation**                                            | **Village Use**                                                |
|----------------|-------------------------------------------------------------------|----------------------------------------------------------------|
| Fresh Food     | Spoils fastest; high morale or immediate food value.              | Meals, daily consumption, festivals, trade while fresh.        |
| Cooked Food    | Lasts longer than fresh; better value and buffs.                  | Worker meals, guard rations, morale.                           |
| Preserved Food | Longest shelf life; lower luxury value but strong survival value. | Famine reserves, caravan supply, winter stores, raid recovery. |
| Culture Food   | May be fresh, cooked, or preserved; important for morale/story.   | Festivals, reputation boosts, culture quests.                  |

# 7. Jobs, Skills, Tools, and Labour

NPC jobs should be functional, not labels. A farmer grows food. A builder consumes stored materials and constructs projects. A guard patrols, fights, and needs equipment. A merchant trades based on stock and reputation. A mage teaches, wards, researches, and requests mana resources. This makes villages feel like small economies rather than shop clusters.

| **Job Rule**           | **Locked Direction**                                                                                                                                                         |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Job Source             | Jobs come from buildings, village stage, culture, skills, tools, leadership decisions, and available resources.                                                              |
| Job Change             | NPCs can change jobs when the village needs change, job buildings are destroyed, specialists die, leadership reassigns them, or player-founded settlements allow management. |
| Tools                  | Tools improve or enable jobs and can break over time. Repair and replacement create village demand.                                                                          |
| Skill                  | Skill affects speed, output quality, material waste, repair quality, combat, teaching, and project success.                                                                  |
| Job Buildings          | Job site + worker + tools + materials unlocks the function. A blacksmith without ore, fuel, tools, or a forge should not magically produce weapons.                          |
| Automation Interaction | Automation can supply job inputs, reduce hauling, stock warehouses, stabilise food, or create new specialist demand.                                                         |

## 7.1 POC Jobs

| **Job**        | **Primary Function**                                                            | **Required Inputs / Site**                                            | **POC Gameplay Purpose**                             |
|----------------|---------------------------------------------------------------------------------|-----------------------------------------------------------------------|------------------------------------------------------|
| Elder / Leader | Explains village needs, approves projects, controls reputation and permissions. | Meeting spot, request board, village ledger.                          | Introduces village system and watchtower request.    |
| Builder        | Constructs staged project blueprints and repairs damage.                        | Builder tools, warehouse access, blueprint/project anchor, materials. | Builds watchtower stages from stored resources.      |
| Farmer         | Produces food and reports food shortages.                                       | Farm plot, seeds, tool, water access.                                 | Proves village consumption and food need loop.       |
| Guard          | Patrols, defends village, mans watchtower/guard post.                           | Weapon, armour, arrows, guard post/watchtower.                        | Proves raid outcome changes.                         |
| Merchant       | Trades items, buys/sells based on stock, reputation, shortages.                 | Market stall, stock, ledger.                                          | Gives player village economy access.                 |
| Mage           | Teaches basic rune/mana knowledge, maintains ward/magic requests.               | Mage hut, rune table or lore object, mana resources.                  | Connects magic to village infrastructure.            |
| Miner          | Gathers stone/ore if village has access, requests tools/clearance.              | Mine site, pickaxe, storage route.                                    | Supports construction and iron chain.                |
| Lumberjack     | Gathers logs and supports wood supply.                                          | Forest access, axe, storage route.                                    | Supports scaffold/beams/planks and resource economy. |

## 7.2 Full Game Job Families

| **Job Family**               | **Example Jobs**                                                                     | **Village Systems Connected**                                    |
|------------------------------|--------------------------------------------------------------------------------------|------------------------------------------------------------------|
| Food and Survival            | Farmer, fisher, hunter, cook, brewer, herbalist.                                     | Food stores, morale, medicine, trade, festivals.                 |
| Gathering and Materials      | Lumberjack, miner, quarry worker, clay digger, prospector, scavenger.                | Construction, crafting, resource nodes, automation input.        |
| Crafting and Industry        | Blacksmith, carpenter, mason, tailor, glassworker, engineer, rune-smith.             | Tools, weapons, blocks, machine parts, repairs, culture goods.   |
| Construction and Maintenance | Builder, road worker, repairer, architect, scaffold hauler, siege engineer.          | Village projects, roads, repairs, defences, megaprojects.        |
| Defence                      | Guard, archer, captain, scout, ward keeper, trapper, militia trainer.                | Raids, patrols, towers, walls, gate control, crime.              |
| Trade and Logistics          | Merchant, warehouse keeper, quartermaster, courier, caravan master.                  | Storage, pricing, permissions, supply/demand, trade routes.      |
| Knowledge and Magic          | Mage, alchemist, scholar, priest/belief leader, archivist, ritualist, portal keeper. | Teaching, story, magic resources, wards, dimensions, culture.    |
| Advanced Labour              | Golemancer, golem worker, automation engineer, dimensional scout.                    | Late automation, magical labour, high-tier projects, realm arcs. |

# 8. Schedules, AI States, and Local Simulation

Schedules make villages feel alive, but they must scale. Nearby settlements should show villagers walking, carrying, farming, building, sleeping, fleeing, trading, socialising, repairing, and celebrating. Far-away settlements can resolve schedules through abstract work ticks and daily resource changes.

| **Schedule State**  | **Behaviour**                                                                         | **Visible Result**                                                 |
|---------------------|---------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| Wake / Morning Need | NPC wakes, checks food, travels to work or social hub.                                | Village becomes active; shops may open.                            |
| Work                | NPC performs job tasks using tools, site, inputs, and route.                          | Fields are farmed, blocks repaired, goods crafted, patrols begin.  |
| Haul / Supply       | NPC moves resources between local stores, job sites, and project crates.              | Visible bundles, carts, crates, or abstracted warehouse transfers. |
| Trade / Service     | Merchant, mage, blacksmith, healer, or leader becomes available to player.            | Shop/dialogue access, teaching, request turn-ins.                  |
| Social / Culture    | NPC eats, talks, worships, celebrates, attends festival, visits family.               | Morale, culture identity, rumours, story hooks.                    |
| Rest / Sleep        | NPC returns to home/bed unless danger or night job.                                   | Village quiets down; guards remain active.                         |
| Danger Response     | Non-combatants flee to safe zones; guards fight; leaders ring alarm; mages ward/heal. | Raids become readable and emotionally meaningful.                  |
| Repair / Recovery   | After damage, builders and workers fix priority blocks and tend injuries.             | Rubble, scaffolds, injured NPCs, request board updates.            |
| Event Mode          | Festival, funeral, famine meeting, caravan arrival, trial, rebellion, ritual.         | Schedule is temporarily overridden by world event.                 |

## 8.1 AI Priority Stack

| **Priority** | **Task Type**             | **Notes**                                                                   |
|--------------|---------------------------|-----------------------------------------------------------------------------|
| 1            | Life Threat               | Flee fire, monster, active combat, deadly hazard, corruption surge.         |
| 2            | Assigned Emergency Role   | Guards defend, leaders alert, mages ward/heal, builders patch gate if safe. |
| 3            | Critical Need             | Eat, seek shelter, get medicine, go to safe zone.                           |
| 4            | Village Crisis Task       | Move food, repair breach, treat injured, carry supplies to project.         |
| 5            | Normal Job Task           | Farm, mine, trade, build, craft, patrol, teach.                             |
| 6            | Social/Culture Task       | Market, worship, family, festival, leisure.                                 |
| 7            | Idle/Decorative Behaviour | Look around, sit, sweep, chat, inspect goods.                               |

# 9. Village Storage, Warehouses, Supply, and Permissions

Village storage is the bridge between the player, NPC labour, automation, construction, trade, and survival. The locked model is hybrid: physical stores exist in the world, but the player can also inspect a summary UI that shows what the village has, what is reserved, what is lacking, and what can be imported or exported.

| **Storage Category**    | **Example Contents**                                                                | **Used By**                                                     |
|-------------------------|-------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| Food Stores             | Grain, bread, stew, preserved food, berries, meat, fish.                            | Daily consumption, famine buffer, festivals, trade.             |
| Water Access            | Well/water block access, rain barrels, pump stores, water flasks on harsh settings. | NPC hydration, cooking, farming, fire control.                  |
| Construction Stock      | Logs, planks, beams, stone bricks, clay bricks, roof tiles, glass, nails.           | Builders, repairs, village projects.                            |
| Fuel / Power            | Wood, charcoal, coal, mana shards, alchemical oils.                                 | Furnaces, smiths, machines, wards, winter heat.                 |
| Tools and Work Gear     | Axes, pickaxes, hoes, hammers, wrenches, job tools.                                 | Workers, repairs, output quality.                               |
| Guard Supply            | Weapons, armour, arrows, shields, medicine, torches.                                | Guards, watchtower, raid response.                              |
| Magic Stock             | Mana crystals, mana dust, runes, ward cores, ritual catalysts.                      | Mage, wards, magic buildings, portals.                          |
| Trade Goods             | Culture goods, surplus materials, luxury items, strategic goods.                    | Merchant, caravans, faction economy.                            |
| Reserved Project Stock  | Resources locked to an active project.                                              | Prevents NPC consumption from stealing project materials.       |
| Player Donations        | Items the player explicitly gives to the village.                                   | Safe contribution without allowing NPCs to raid private chests. |
| Restricted / Contraband | Forbidden resources, stolen goods, cursed materials.                                | Crime, taboo, fear, corruption, law, faction reaction.          |

## 9.1 Warehouse Permissions

| **Permission State**        | **Player Access**                                      | **NPC Access To Player Goods**                     | **Automation Access**                                         |
|-----------------------------|--------------------------------------------------------|----------------------------------------------------|---------------------------------------------------------------|
| Unknown / Stranger          | Can trade or donate through board/elder only.          | No access to player chests.                        | No direct warehouse automation.                               |
| Helpful Outsider            | Can use donation chest and basic request deliveries.   | No access except marked donation containers.       | Manual delivery only; import permissions not yet unlocked.    |
| Trusted Supplier            | Can deliver approved categories directly to warehouse. | NPCs access only designated supply containers.     | Basic import from chutes/pipes/miners may unlock.             |
| Trusted Ally                | Can view warehouse summary and contribute to projects. | Shared-use containers allowed with explicit flags. | Automation import/export rules can be configured.             |
| Honoured Friend / Champion  | Can help prioritise projects and repairs.              | Broader access if village law allows.              | Advanced logistics permission and supply contracts.           |
| Founder / Player Settlement | Player controls permissions by settlement law.         | NPC access depends on player-set rules.            | Full automation permissions where infrastructure supports it. |
| Conqueror / Tyrant          | Tribute and forced access possible.                    | NPCs may hide goods, sabotage, or rebel.           | Forced input/output possible but increases fear/resistance.   |

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><p><strong>Warehouse Rule</strong></p>
<p>Village warehouses accept automated input only after trust or permission is earned. This prevents the player from accidentally breaking village progression, exploiting storage too early, or bypassing the social permission loop.</p></th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 10. Construction, Repairs, Blueprints, and Village Projects

Village construction should be one of the signature visible systems. The player can contribute resources, automate supply, defend workers, clear land, improve roads, or help directly. Villagers should be able to build staged blueprints from stored resources, with detailed visuals nearby and abstract progress far away.

| **Construction Mode**          | **Use Case**                                                                            | **Locked Direction**                                                                                                                                  |
|--------------------------------|-----------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| Visible Staged Blueprint       | Default for important nearby projects.                                                  | Blueprint appears, resources are reserved, supply crates/scaffolds appear, builders work in stages, structure becomes functional at stage completion. |
| Nearby Block Placement         | High-value or close-up projects where the player can watch.                             | Builders may place actual blocks or visible construction chunks when performance and pathing allow it.                                                |
| Full Block-by-Block            | Selected showcase builds, player-founded settlements, debug/dev mode, or small repairs. | Can exist for fidelity but should not be mandatory for every structure.                                                                               |
| Abstract Far-Away Construction | Distant villages or LOD simulation.                                                     | Project uses resources and time rolls; player receives summary on return.                                                                             |
| Player-Assisted Construction   | Player provides labour, materials, or building actions.                                 | Speeds stages, repairs damage, or overrides design within permission rules.                                                                           |

## 10.1 Project Lifecycle

1.  Need appears through shortage, story, village growth, defence weakness, culture requirement, or player/faction request.

2.  Leader/request board exposes a project: requirements, benefits, risks, site, and permissions.

3.  Project reserves required resources in the warehouse or staged supply crates.

4.  Builders claim tasks, collect tools, travel to site, scaffold, and build stage by stage.

5.  Functional activation occurs when the key stage is complete, even if decoration/finish stages remain.

6.  Village stats update: safety, trade, jobs, morale, story unlocks, storage, production, or magic access.

7.  Project enters maintenance state and can later be damaged, upgraded, repaired, or replaced.

## 10.2 Repair Logic

| **Repair Mode**            | **When It Applies**                                                                                  | **Player Control**                                                           |
|----------------------------|------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| Automatic Minor Repair     | Small damage, safe area, resources available, village-owned structure.                               | No approval required by default; can be disabled in harsh/roleplay settings. |
| Prioritised Repair Project | Walls, gates, warehouses, farms, wells, watchtowers, bridges, shrines, machines.                     | Leaders/builders prioritise; trusted players may help set priority.          |
| Player Approval Repair     | Trusted-player-modified village, player-founded town, expensive materials, story-sensitive building. | Requires player/leader approval depending on ownership and law.              |
| Emergency Patch            | Raid breach, fire, gate damage, ward failure.                                                        | Guards/builders respond if safe; player can override by direct action.       |
| Magical Cleansing/Repair   | Corruption, curse, void damage, unstable mana residue.                                               | Requires mage, ward core, ritual, or later magic system.                     |

# 11. Village Growth Stages and Unlock Gates

Villages should grow on their own, but slowly and heavily stunted without the player. Growth is not only population. It is a combination of food security, housing, safety, jobs, storage, specialists, roads, trade, culture story, project completion, and world events.

| **Stage**          | **Description**                                                                 | **Core Unlocks / Risks**                                                              |
|--------------------|---------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Camp               | Temporary or early survival group.                                              | Basic tents, fire, food requests, high vulnerability, first NPC identities.           |
| Hamlet             | Small permanent settlement with homes, farms, and a few jobs.                   | Request board, village warehouse, basic jobs, first construction projects.            |
| Village            | Stable community with multiple jobs and trade.                                  | Market, better storage, workshops, guards, local stories, caravans.                   |
| Fortified Village  | Defensive upgrade with walls, towers, gates, stronger guards.                   | Raid resilience, guard equipment demand, defence projects, regional influence.        |
| Town               | Larger settlement with specialists, schools, shrines, workshops, and diplomacy. | Culture story chapters, specialist teaching, advanced trade, faction contact.         |
| City               | Major centre with districts, politics, high population, large projects.         | Laws, advanced economy, multiple factions, large construction, major story arcs.      |
| Capital            | Civilisation hub with culture-defining power.                                   | Race destiny choices, major diplomacy, armies, rituals, dimension preparation.        |
| Magical Metropolis | Endgame civilisation-scale settlement with advanced magic/automation.           | Floating districts, portal logistics, ward networks, wonders, world-shaping projects. |

## 11.1 Growth Requirements

| **Requirement**    | **What It Checks**                                              | **Why It Matters**                                  |
|--------------------|-----------------------------------------------------------------|-----------------------------------------------------|
| Population         | Enough residents, families, migrants, children, specialists.    | A settlement cannot become a city with five people. |
| Housing            | Valid homes, beds, safety, household space.                     | Population and morale gate.                         |
| Food and Water     | Stable consumption with reserves and water access.              | Prevents growth into famine.                        |
| Safety             | Walls, guards, lighting, wards, nearby threats cleared.         | Villagers will not expand into danger.              |
| Storage            | Warehouse, barns, armory, magic store, trade storage.           | Large projects need stable resource handling.       |
| Job Diversity      | Farmers, builders, gatherers, guards, merchants, specialists.   | Expands functions, stories, and production.         |
| Project Completion | Key structures completed for current stage.                     | Visible growth milestones.                          |
| Trade and Roads    | Caravans, routes, bridge/road quality, market access.           | Economic stability and culture exchange.            |
| Culture Story      | Leader, archive, shrine, ritual, faction issue, dimension hook. | Prevents generic growth and ties villages to lore.  |
| World Events       | Raids, disasters, diplomacy, corruption, famine, war, seasons.  | Growth is affected by what happens in the world.    |

# 12. Reputation, Fear, Trust, Morality, and Player Freedom

The player should not be forced into heroism. The system must support protector, trader, neutral wanderer, industrial patron, conqueror, tyrant, forbidden mage, liberator, or destroyer paths. The world should react seriously to each path.

| **Reputation Layer** | **Tracks**                                                                                 | **Effects**                                                                    |
|----------------------|--------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Per-NPC              | Personal help/harm, relationship, rescue, theft, family impact, teaching, hiring.          | Dialogue, individual prices, followers, fear, hostility, gratitude.            |
| Per-Village          | Deliveries, projects, defence, theft, conquest, repairs, famine response, forbidden magic. | Warehouse permissions, request board, guards, leaders, prices, project access. |
| Culture/Faction      | Repeated patterns across villages and story decisions.                                     | Faction standing, patrols, recipes, culture story, war/diplomacy.              |
| Trust                | Reliability, kindness, legal behaviour, fulfilled contracts, protection.                   | Access, teaching, direct warehouse input, leadership requests.                 |
| Fear                 | Intimidation, conquest, violence, dark magic, tribute, hostile reputation.                 | Compliance, tribute, hidden resistance, rebellion, faction intervention.       |
| Crime                | Theft, assault, murder, sabotage, trespass, contraband, forbidden rituals.                 | Witnesses, fines, jail, guards, exile, bounty, faction reports.                |

## 12.1 Player Action Consequences

| **Player Action**         | **Possible Positive Result**                                     | **Possible Negative / Alternate Result**                                     |
|---------------------------|------------------------------------------------------------------|------------------------------------------------------------------------------|
| Deliver needed resources  | Trust rises, project starts, prices improve, story opens.        | If exploitative/conditional, fear or dependency may rise.                    |
| Automate village supply   | Food/material stability, faster growth, warehouse permission.    | Machine risk, dependency, pollution/corruption, faction concern.             |
| Defend from raid          | Hero reputation, guard respect, memorial/festival, story unlock. | Failure may cause death, damage, grief, and urgent repair requests.          |
| Steal from village        | Short-term gain.                                                 | Crime, reputation loss, guards, locked storage, individual hatred.           |
| Use forbidden magic       | Powerful effects, fear path, dark allies.                        | Suspicion, corruption, legal consequences, cult interest, faction hostility. |
| Conquer village           | Tribute, forced supply, strategic control.                       | Rebellion, fear, sabotage, resistance, refugees, faction retaliation.        |
| Ignore village            | Player freedom maintained.                                       | Slow growth, shortages, raids, abandonment, missed story chances.            |
| Rebuild destroyed village | Strong trust, refugee return, restoration story.                 | Requires major resources and may attract enemies.                            |

# 13. Dialogue, Request Boards, Quests, and Story Unlocks

Village quests should be a mix of authored story content and generated simulation requests. Request boards give clear player direction without forcing a linear campaign, while NPC dialogue makes the same needs feel human and culture-specific.

| **Quest/Request Source**  | **Examples**                                                                                | **System Inputs**                                        |
|---------------------------|---------------------------------------------------------------------------------------------|----------------------------------------------------------|
| Leader Dialogue           | Village project, diplomacy, crisis, growth gate, conquest/tribute response.                 | Reputation, stage, threat, project backlog.              |
| Request Board             | Material request, work order, defence warning, trade offer, missing NPC, job shortage.      | Storage shortage, active project, economy, event queue.  |
| Specialist NPC            | Mage teaches rune, blacksmith requests iron, healer requests herbs, scholar asks for relic. | Job site, recipes, knowledge, culture story.             |
| Observed World State      | Damaged wall, empty field, low food, idle builder, injured guard.                           | Visual feedback, warehouse state, damage state.          |
| Generated Need Quest      | Need 64 stone bricks, 24 iron nails, 10 medicine bundles, 3 guard bows.                     | Need severity, village stage, resource tags.             |
| Handcrafted Culture Story | Shrine restoration, archive unlock, lost ancestor, portal ritual, faction dispute.          | Village stage, culture profile, reputation, story flags. |
| Event Quest               | Defend raid, escort caravan, stop sabotage, treat plague, cleanse corruption.               | World event, threat profile, difficulty.                 |

## 13.1 Village Story Unlock Philosophy

Village growth should reveal story gradually. A hamlet can reveal local needs and rumours. A village can reveal culture problems and nearby ruins. A town can reveal leaders, archives, specialists, and faction stakes. A city or capital can reveal major race stories, rituals, dimensions, and civilisation-scale choices. This keeps lore tied to living world progress.

# 14. Economy, Trade, Caravans, and Culture Goods

The POC can use simple trade lists, but the final game should support deeper economy rules. Prices, stock, and requests should respond to supply, demand, culture preference, danger, reputation, roads, caravans, seasons, and faction access.

| **Economy System**   | **POC Direction**                                               | **Final Direction**                                                                 |
|----------------------|-----------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Shop Inventory       | Simple stock per merchant with a few reputation-gated items.    | Stock changes with village stage, shortages, culture, caravans, and supply.         |
| Prices               | Basic buy/sell values with reputation modifier.                 | Supply/demand, danger, scarcity, culture preference, faction control, season.       |
| Trade Goods          | Food, tools, basic materials, mana crystal request, guard gear. | Culture goods, luxury items, strategic resources, contraband, festival goods.       |
| Caravans             | Optional/teaser or scripted arrival.                            | Routes between villages, affected by roads, danger, reputation, blockades, weather. |
| Resource Competition | Not needed for first POC.                                       | Strategic resources can trigger theft, diplomacy, blockades, taxes, raids, or war.  |
| Culture Preference   | Simple flavour in dialogue.                                     | Preferred foods, blocks, gifts, taboos, magic materials, architecture, festivals.   |

# 15. Danger, Raids, Guards, Damage, and Disaster

Villages must be able to suffer. This does not mean constant punishment. Danger should be configurable and readable. The POC raid exists to prove the central promise: if the player supplies resources and the village completes the watchtower, the raid outcome changes.

| **Threat Type** | **Trigger Sources**                                                 | **Possible Outcomes**                                                                 |
|-----------------|---------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| Goblin Raid     | Nearby camp, wealth, night danger, event roll, story trigger.       | Damage, theft, injuries/death, guard XP, reputation gain/loss, loot, repair requests. |
| Bandit Theft    | Road danger, rich warehouse, low guards, crime/faction state.       | Warehouse loss, merchant shortage, bounty, escort quest.                              |
| Monster Surge   | Biome threat, caves, moon/weather, corrupted area.                  | NPCs flee, guards fight, wall damage, night danger.                                   |
| Fire            | Lightning, raiders, accident, lava, sabotage, flammable blocks.     | Burnt buildings, food loss, urgent water/repair.                                      |
| Famine          | Food consumption exceeds production, failed harvest, blocked roads. | Work slowdown, sickness, migration, desperate requests.                               |
| Sickness/Injury | Poor food, monster wounds, weather, plague event.                   | Medicine demand, healer relevance, mortality risk.                                    |
| Corruption      | Forbidden magic, dimensional rift, cursed resources, failed ritual. | Mutation, fear, cleansing quest, dark path, village damage.                           |
| Conquest        | Hostile faction strength, player conquest, failed defence.          | Occupation, tribute, rebellion, liberation quest, altered story state.                |

## 15.1 Guard and Defence Factors

| **Factor**       | **Effect**                                                                                     |
|------------------|------------------------------------------------------------------------------------------------|
| Guard Count      | Determines patrol coverage and combat presence.                                                |
| Guard Skill      | Improves accuracy, survival, tactics, and equipment use.                                       |
| Equipment        | Weapons, armour, shields, arrows, medicine, torches, ward charms improve defence.              |
| Defence Blocks   | Walls, gates, palisades, towers, spikes, lanterns, traps shape raid pathing/outcome.           |
| Watchtower       | Improves line of sight, ranged defence, early warning, guard confidence, and POC raid outcome. |
| Wards/Magic      | Anti-monster radius, corruption resistance, magical lighting, ritual protection.               |
| Roads and Layout | Improves patrol and evacuation; can also expose routes if undefended.                          |
| Safe Zones       | Non-combatants flee to shelter, town hall, temple, cellar, or warded building.                 |

## 15.2 Damage States

| **Damage State** | **Visual / System Meaning**                                       | **Recovery**                                                           |
|------------------|-------------------------------------------------------------------|------------------------------------------------------------------------|
| Normal           | Building is intact and functioning.                               | No action needed.                                                      |
| Damaged          | Visible cracks, broken props, reduced function.                   | Basic repair materials and builder labour.                             |
| Burnt            | Fire damage, ash, missing roof/walls, morale penalty.             | Wood/roof replacement, water access, repair project.                   |
| Broken           | Key function disabled: gate jammed, tower unusable, well blocked. | Priority repair project.                                               |
| Rubble/Ruined    | Structure collapsed or destroyed.                                 | Clear rubble, rebuild project, memorial/story possible.                |
| Corrupted        | Magical/dimensional alteration.                                   | Requires cleansing ritual, mage, ward core, or dark path exploitation. |

# 16. Families, Population, Migration, and Generations

Families and generations give consequence to village life. The goal is not a full genealogy simulator at v0.1, but homes, relationships, children, aging, migration, mourning, inheritance, and refugee behaviour should exist as design targets.

| **Population System**      | **Locked Direction**                                                                      | **Gameplay Purpose**                                            |
|----------------------------|-------------------------------------------------------------------------------------------|-----------------------------------------------------------------|
| Families                   | Homes, relationships, children, morale, inheritance, mourning, and migration hooks.       | Makes settlement loss and protection meaningful.                |
| Children                   | Safety behaviour, growth over time, future workers, emotional stakes.                     | Supports long-term worlds and village recovery.                 |
| Aging                      | Slow, world-setting controlled, most relevant in long-term worlds.                        | Generational settlements and succession.                        |
| Migration                  | Migrants, refugees, specialists, deserters, travellers, culture/faction movement.         | Population growth and consequences from war/disaster.           |
| Death                      | Permanent by default, softened by difficulty settings.                                    | Raids and disasters matter.                                     |
| Replacement                | New NPCs can arrive through migration, births, recruitment, refugees, or rescued NPCs.    | Villages can recover without nullifying loss.                   |
| Destroyed Village Outcomes | Ruins, refugee source, monster camp, conquered settlement, haunted site, rebuild project. | Failure creates new content instead of simply deleting content. |

# 17. Magic, Golems, Automation, and Special Labour

Magic and automation should not sit outside village life. Villages need mana, wards, rituals, golems, magical lights, healing, farming boosts, portal preparation, corruption cleansing, and machine-fed supply. These systems make the game distinct from a normal colony sim.

| **System**        | **Village Use**                                                                    | **Risks / Gates**                                                               |
|-------------------|------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| Village Mage      | Teaches basic runes, requests mana crystals, maintains wards, interprets ruins.    | Needs trust, mana resources, culture compatibility.                             |
| Wards             | Reduce monster pressure, protect stores, cleanse corruption, improve safety score. | Consume mana/ward cores; can fail if underpowered.                              |
| Mana Lighting     | Improves safety and atmosphere; may reduce hostile spawns.                         | Requires mana resources or conduit network.                                     |
| Healing Magic     | Speeds injury recovery and reduces death risk.                                     | Requires mage/healer, reagents, mana, or temple.                                |
| Farming Magic     | Improves crop growth, resilience, or special harvests.                             | Requires nature/rune magic, water, culture acceptance.                          |
| Golems            | Workers, guards, haulers, miners, builders, repairers.                             | Ownership, ethics, fuel/charge, village reaction, forbidden variants.           |
| Automation Supply | Inputs food/materials/tools/magic resources into warehouses.                       | Trust permission, dependency, machine risk, resource depletion.                 |
| Forbidden Magic   | Powerful labour, undead workers, dark wards, cursed automation.                    | Fear, suspicion, corruption, faction hostility, cult interest, alternate paths. |
| Portals           | Later travel/logistics and dimension story preparation.                            | High-tier project, story/faction/magic requirements, instability risk.          |

## 17.1 Automation Dependency and Risk

Automation can stabilise villages, but it should not always be consequence-free. A clean farm route or water wheel may be accepted easily. A noisy quarry, cursed miner, void-fuelled machine, or dark automation line can create pollution, instability, corruption, faction concern, fear, or worker displacement depending on settings and culture.

# 18. Simulation LOD, Performance, and Multiplayer

The final game needs scalable simulation. A nearby village can show every worker walking and carrying resources. A distant village should not run every pathfinding routine. Instead, it should resolve daily or hourly abstract changes based on stored resources, danger, jobs, buildings, and events.

| **Simulation Level**       | **When Used**                                        | **What Runs**                                                                                          |
|----------------------------|------------------------------------------------------|--------------------------------------------------------------------------------------------------------|
| Full Local Simulation      | Player is in/near village.                           | NPC movement, pathfinding, carrying, job actions, dialogue availability, combat, visible construction. |
| Regional Active Simulation | Player nearby in same region but not inside village. | Simplified work ticks, trade route checks, threat rolls, event warnings.                               |
| Abstract Far Simulation    | Distant discovered villages.                         | Daily resource changes, growth progress, raid/shortage/trade rolls, summaries.                         |
| Frozen/Protected Mode      | Optional peaceful or low-performance setting.        | Minimal or no negative progress while player is away.                                                  |
| Catch-Up Summary           | When player returns after absence.                   | Village reports what happened: stores changed, project progressed, raid occurred, migrants arrived.    |

## 18.1 Multiplayer Rules

| **Multiplayer Field** | **Locked Direction**                                                                                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Shared Reputation     | Village/world reputation can be shared by group actions, project contributions, raid defence, and faction outcomes.                   |
| Individual Modifiers  | Each player also has personal modifiers for crimes, donations, teaching, trading, violence, and trust.                                |
| Permissions           | Chests, warehouses, building zones, projects, automation access, theft, and settlement laws must support ownership/permission fields. |
| Contribution Tracking | Project delivery and defence contribution should track who helped, especially in co-op.                                               |
| Conflict Handling     | One player may be trusted while another is criminal or feared; the UI must explain this clearly.                                      |

# 19. UI, Feedback, Data, and Registry Rules

| **UI Screen / Feedback** | **POC Need**                                                               | **Full Game Direction**                                                                 |
|--------------------------|----------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| NPC Dialogue             | Talk to elder, merchant, mage, builder, guard.                             | Relationship state, memory, services, teaching, rumours, event reactions.               |
| Request Board            | Watchtower request, resource needs, raid warning.                          | Material requests, jobs, trade offers, danger notices, event notices, progress reports. |
| Warehouse UI             | View accepted deliveries, reserved project resources, shortage categories. | Storage categories, import/export, spoilage, permissions, reserves, strategic stock.    |
| Project Progress UI      | Watchtower stage and missing resources.                                    | All active projects, stages, labour, resources, priority, approval, repair state.       |
| Reputation Indicator     | Trust/fear basics.                                                         | Per-village, faction/culture, individual modifiers, crimes, permissions.                |
| Raid Warning             | Basic incoming raid alert.                                                 | Threat forecast, guard readiness, safe zones, damage report, recovery plan.             |
| Village Overview         | Deferred or minimal POC.                                                   | NPC list, jobs, needs, storage, projects, trade, threats, permissions, event history.   |

## 19.1 Registry Categories and Tags

| **Registry**              | **Purpose**                                                                 | **Example IDs / Tags**                                                       |
|---------------------------|-----------------------------------------------------------------------------|------------------------------------------------------------------------------|
| NPC Template Registry     | Defines NPC archetypes, jobs, behaviours, needs, inventories, interactions. | npc.template.builder.basic, npc.template.guard.militia.                      |
| NPC Instance Registry     | Save-game identity for named NPCs.                                          | npc.instance.forest_hamlet.builder_talia.                                    |
| Job Registry              | Defines job requirements and outputs.                                       | job.builder, job.farmer, job.mage, job.guard.                                |
| Need Profile Registry     | Defines need categories, thresholds, consumption rates.                     | need.profile.standard_villager, need.profile.guard.                          |
| Village Template Registry | Defines settlement type, culture, stage rules, base buildings.              | village.template.forest_hamlet.human.                                        |
| Storage Category Registry | Defines warehouse categories and permissions.                               | storage.food, storage.construction, storage.magic, storage.project_reserved. |
| Project Registry          | Defines staged construction/repair/growth projects.                         | project.watchtower.basic, project.palisade.wall.                             |
| Event Registry            | Defines raids, caravans, shortages, disasters, festivals.                   | event.raid.goblin_poc, event.shortage.food.                                  |
| Reputation Registry       | Defines trust/fear ranks, permissions, unlocks, crimes.                     | rep.village.trusted_supplier, rep.fear.conqueror.                            |

# 20. Proof-of-Concept Village Scope

The POC should prove the smallest playable version of the full identity: gather resources, automate a supply chain, deliver to a living village, village consumes exact resources, NPCs build a staged watchtower, and a goblin raid outcome changes based on preparation.

| **POC Area** | **Required Scope**                                                                                                      | **Why It Matters**                                                    |
|--------------|-------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------|
| World        | Small forest valley with one hamlet, nearby cave, mana crystal clue, goblin camp/raid source.                           | Tests exploration, resource gathering, village discovery, and threat. |
| Village      | Forest hamlet at Hamlet stage with homes, farm plot, warehouse, request board, guard post, mage hut, construction site. | Tests village presence without full town management.                  |
| NPCs         | 8 core named NPCs: elder, builder, farmer, guard, merchant, mage, miner, lumberjack.                                    | Tests core job loops and emotional identity.                          |
| Needs        | Food, shelter, safety, tools, work access, basic morale, water access through well.                                     | Tests consumption and shortages.                                      |
| Storage      | Village warehouse with food, construction, guard, magic, project-reserved, and donation categories.                     | Tests real resource delivery and project reservation.                 |
| Project      | Basic watchtower with staged construction: supply crate, foundation, timber frame, platform/guard readiness.            | Tests NPC construction and exact resource consumption.                |
| Automation   | Basic mana miner/furnace or early transport chain can feed materials into warehouse after permission.                   | Tests factory-to-village hook.                                        |
| Magic        | Mage teaches basic rune/mana furnace or ward support; ward lantern or mana item can improve safety.                     | Tests magic as infrastructure.                                        |
| Raid         | Goblin raid attacks village; watchtower changes guard effectiveness, damage, survival, and reputation.                  | Tests consequence and defence.                                        |
| UI           | Dialogue, request board, warehouse UI, project progress, reputation indicator, raid warning.                            | Tests player comprehension.                                           |

## 20.1 POC Success Criteria

- The player understands what the village needs without reading a manual.

- The player can gather or automate required materials and deliver them to the village warehouse.

- The village stores exact resources and reserves them for the watchtower project.

- The builder visibly constructs the watchtower in stages using stored materials.

- The guard becomes more effective once the watchtower is functional.

- A goblin raid damages the village more severely if the watchtower is not complete.

- NPCs react through dialogue, request board state, reputation, and visible behaviour.

- Automation into the warehouse is locked behind trust/permission rather than available immediately.

- The system feels like the foundation of a larger civilisation sandbox, not a one-off quest.

# 21. Detailed NPC/Village Registry v0.1

The following registries are draft database-ready content for the NPC Village System. Values are first-pass design targets and can be moved into spreadsheets later.

## 21.1 POC NPC Roster

| **npc_id**                           | **Display Name / Role**      | **Core Functions**                                                                              | **POC Status** |
|--------------------------------------|------------------------------|-------------------------------------------------------------------------------------------------|----------------|
| npc.poc.forest_hamlet.elder_rowan    | Elder Rowan - Village Leader | Introduces hamlet, watchtower request, reputation, permissions, project approval, raid warning. | POC Required   |
| npc.poc.forest_hamlet.builder_talia  | Talia Stonehand - Builder    | Withdraws resources, builds stages, repairs damage, comments on missing supplies.               | POC Required   |
| npc.poc.forest_hamlet.farmer_bram    | Bram Reed - Farmer           | Produces food, reports food shortage, uses farm/water access, village morale source.            | POC Required   |
| npc.poc.forest_hamlet.guard_elric    | Elric Vale - Guard           | Patrols, fights goblins, uses guard post/watchtower, needs weapon/armour/arrows.                | POC Required   |
| npc.poc.forest_hamlet.merchant_lysa  | Lysa Fen - Merchant          | Trades basics, reflects supply/demand, buys surplus, sells village goods.                       | POC Required   |
| npc.poc.forest_hamlet.mage_serin     | Serin Ashglow - Mage         | Teaches basic rune/mana concept, requests mana crystals, maintains ward lantern.                | POC Required   |
| npc.poc.forest_hamlet.miner_doran    | Doran Flint - Miner          | Provides stone/ore if tool/site exists, explains cave resource needs, supports project supply.  | POC Required   |
| npc.poc.forest_hamlet.lumberjack_fen | Fen Oakwise - Lumberjack     | Gathers logs/wood if axe/site exists, supports beams/planks/scaffolds.                          | POC Required   |
| npc.template.villager.generic_adult  | Generic Named Adult Resident | Background resident, household, need consumption, social life, future job assignment.           | Alpha          |
| npc.template.child.basic             | Child Resident               | Safety behaviour, family morale, long-term generation hook.                                     | Alpha          |
| npc.template.traveller.merchant      | Traveller / Caravan Merchant | Trade route, rumours, migration/visitor hook.                                                   | Alpha          |
| npc.enemy.goblin_raider_poc          | Goblin Raider                | Attacks, steals, burns/sabotages, flees, drops loot, raid outcome driver.                       | POC Required   |
| npc.golem.worker.basic               | Basic Worker Golem           | Hauling/building/mining automation unit with ownership and ethics hooks.                        | Final Game     |

## 21.2 Job Registry v0.1

| **job_id**           | **Required Site / Tools**                            | **Outputs / Services**                                                     | **Status**   |
|----------------------|------------------------------------------------------|----------------------------------------------------------------------------|--------------|
| job.leader.elder     | Town centre, request board, village ledger.          | Requests, permissions, reputation, projects, diplomacy, emergency notices. | POC Required |
| job.builder.basic    | Builder yard, hammer, blueprint, warehouse access.   | Construction stages, repairs, scaffolds, supply crates.                    | POC Required |
| job.farmer.basic     | Farm plot, hoe, seed, water access.                  | Food items, food security, farming requests.                               | POC Required |
| job.guard.militia    | Guard post/watchtower, weapon, armour, arrows/torch. | Patrol, defence, raid combat, crime response.                              | POC Required |
| job.merchant.basic   | Market stall, stock ledger, storage access.          | Trade, buy/sell, price changes, rumours.                                   | POC Required |
| job.mage.apprentice  | Mage hut, rune table/lore object, mana stock.        | Teaching, wards, mana requests, magic story hooks.                         | POC Required |
| job.miner.basic      | Mine site/quarry, pickaxe, storage route.            | Stone/ore supply, cave requests, prospecting hints.                        | POC Required |
| job.lumberjack.basic | Forest zone, axe, storage route.                     | Logs, sticks, wood supply, replanting later.                               | POC Required |
| job.blacksmith.basic | Forge/anvil, fuel, metal stock, hammer.              | Tools, weapons, repairs, guard gear.                                       | Alpha        |
| job.healer.basic     | Healer hut, herbs, bandages, medicine stock.         | Healing, sickness recovery, medicine requests.                             | Alpha        |
| job.courier.basic    | Road route, satchel/cart, route permission.          | Village-to-village delivery, trade route messages.                         | Alpha        |
| job.golemancer.basic | Golem bench, runes, cores, mana stock.               | Golem construction/repair, ethics/reaction hooks.                          | Final Game   |

## 21.3 Need Profile Registry v0.1

| **need_profile_id**            | **Applies To**                          | **Tracked Needs**                                                    | **Status**   |
|--------------------------------|-----------------------------------------|----------------------------------------------------------------------|--------------|
| need.profile.standard_resident | Most adult villagers.                   | Food, water access, shelter, safety, morale, work access.            | POC Required |
| need.profile.worker            | Farmers, miners, builders, lumberjacks. | Standard needs + tools + worksite access + repair supplies.          | POC Required |
| need.profile.guard             | Guards and militia.                     | Standard needs + weapons + armour + arrows + medicine + guard post.  | POC Required |
| need.profile.specialist_mage   | Village mage.                           | Standard needs + mana stock + knowledge items + ward/magic tools.    | POC Required |
| need.profile.child             | Children.                               | Food, shelter, safety, family, morale, education later.              | Alpha        |
| need.profile.golem_worker      | Constructed worker.                     | Charge/fuel, command, maintenance, allowed owner/task, repair parts. | Final Game   |

## 21.4 Village Building and Service Registry v0.1

| **building_id**                   | **Function**                                              | **Village Systems**                                   | **Status**   |
|-----------------------------------|-----------------------------------------------------------|-------------------------------------------------------|--------------|
| building.village.request_board    | Shows requests, project needs, warnings, trade offers.    | UI, quests, needs, events.                            | POC Required |
| building.village.warehouse.basic  | Stores food/materials/magic/guard goods/project reserves. | Storage, permissions, construction, automation input. | POC Required |
| building.home.hut_basic           | Valid resident shelter and sleep point.                   | Housing, families, morale.                            | POC Required |
| building.farm.plot_basic          | Food production and farmer worksite.                      | Food, water, crops, morale.                           | POC Required |
| building.guard_post.basic         | Guard patrol start and safety anchor.                     | Defence, crime, raid response.                        | POC Required |
| building.mage_hut.basic           | Mage service and basic rune/mana teaching.                | Magic, teaching, ward request.                        | POC Required |
| building.market_stall.basic       | Merchant trade site.                                      | Economy, reputation, trade.                           | POC Required |
| building.project.watchtower_basic | Defence structure and POC construction goal.              | Defence, construction, reputation, raid outcome.      | POC Required |
| building.defence.palisade_wall    | Basic raid protection.                                    | Defence, repairs, construction.                       | Alpha        |
| building.service.blacksmith_basic | Tools, weapons, repairs.                                  | Crafting, guard supply, trade.                        | Alpha        |
| building.service.well_basic       | Water access.                                             | Needs, farming, fire recovery.                        | POC Required |
| building.magic.ward_lantern       | Safety/anti-monster ward lighting.                        | Magic, defence, mana consumption.                     | POC Required |
| building.late.portal_gate         | Dimension/trade/magic story gate.                         | Dimensions, magic, story, logistics.                  | Final Game   |

## 21.5 Village Project Registry v0.1

| **project_id**                             | **Stages / Requirements**                                                                                     | **Result**                                                 | **Status**   |
|--------------------------------------------|---------------------------------------------------------------------------------------------------------------|------------------------------------------------------------|--------------|
| project.watchtower.basic_supply            | Supply crate: 64 Stone Brick, 32 Oak Beam, 32 Oak Plank, 24 Iron Nails, 8 Iron Plates, 4 Torches or Lanterns. | Resources reserved for watchtower project.                 | POC Required |
| project.watchtower.foundation              | Consumes 24 Stone Brick, 8 Oak Beam, 8 Iron Nails; 1 in-game hour builder labour.                             | Foundation built; project site anchored.                   | POC Required |
| project.watchtower.frame                   | Consumes 20 Oak Beam, 12 Oak Plank, 8 Iron Nails; 2 in-game hours builder labour.                             | Timber frame built; visible tower shape.                   | POC Required |
| project.watchtower.platform                | Consumes 24 Stone Brick, 12 Oak Plank, 8 Iron Plates, 4 Torches/Lanterns; 2 in-game hours builder labour.     | Functional platform/railing; guard effectiveness improved. | POC Required |
| project.wall.palisade_segment              | Logs/planks/rope/nails; builder labour.                                                                       | Basic perimeter protection.                                | Alpha        |
| project.repair.basic_structure             | Matching materials + builder labour.                                                                          | Damaged building restored.                                 | POC Required |
| project.farm.expansion                     | Wood, soil prep, seeds, water access.                                                                         | Food capacity increased.                                   | Alpha        |
| project.magic.ward_lantern                 | Mana dust/shard, lantern, basic ward core, mage labour.                                                       | Safety score improved, magic infrastructure tested.        | POC Required |
| project.city.megaproject.floating_district | Celestial metal, mana network, portal power, massive labour.                                                  | Endgame civilisation-scale construction.                   | Final Game   |

## 21.6 Reputation State Registry v0.1

| **state_id**                 | **Display State** | **Typical Unlocks / Effects**                                                          | **Status**           |
|------------------------------|-------------------|----------------------------------------------------------------------------------------|----------------------|
| rep.village.stranger         | Stranger          | Basic dialogue and trade only; no warehouse access.                                    | POC Required         |
| rep.village.helpful_outsider | Helpful Outsider  | Request board delivery, donation chest, small price improvement.                       | POC Required         |
| rep.village.trusted_supplier | Trusted Supplier  | Approved warehouse deliveries, project contribution tracking, basic automation import. | POC Required         |
| rep.village.trusted_ally     | Trusted Ally      | Warehouse summary, repair priority input, better trade, more project access.           | Alpha                |
| rep.village.honoured_friend  | Honoured Friend   | Specialist teaching, culture recipes, leadership trust, story unlocks.                 | Alpha                |
| rep.village.champion         | Village Champion  | Unique rewards, followers, festivals, major story access.                              | Final Game           |
| rep.village.founder          | Founder / Leader  | Player settlement control and full permission system.                                  | Later Settlement Doc |
| rep.fear.feared_outsider     | Feared Outsider   | NPC compliance mixed with avoidance, guard caution, hidden resistance.                 | Alpha                |
| rep.fear.conqueror           | Conqueror         | Tribute, occupation, rebellion risk, faction retaliation, alternate story path.        | Final Game           |
| rep.crime.hated_enemy        | Hated Enemy       | Guards attack or refuse access; faction consequences.                                  | Alpha                |

## 21.7 Event Registry v0.1

| **event_id**                      | **Trigger**                                            | **Effects**                                                                      | **Status**   |
|-----------------------------------|--------------------------------------------------------|----------------------------------------------------------------------------------|--------------|
| event.raid.goblin_poc             | POC night or project trigger; nearby goblin threat.    | Raid attacks village, tests watchtower, causes damage/injury/reputation changes. | POC Required |
| event.shortage.food               | Food stock below threshold.                            | Request board warning, work slowdown, morale loss.                               | POC Required |
| event.project.watchtower_complete | Watchtower final stage complete.                       | Guard effectiveness/safety increases; reputation reward; raid modifier.          | POC Required |
| event.damage.post_raid            | Raid damage occurred.                                  | Repair requests, rubble/damaged blocks, morale changes.                          | POC Required |
| event.trade.caravan_arrival       | Road/reputation/stage conditions.                      | New stock, rumours, trade route hooks.                                           | Alpha        |
| event.population.migrants         | Housing/jobs/safety/food surplus.                      | New residents or specialists arrive.                                             | Alpha        |
| event.culture.festival            | Growth milestone/season/culture trigger.               | Morale, trade, story, reputation.                                                | Alpha        |
| event.magic.corruption_surge      | Forbidden magic, rift, cursed resource, failed ritual. | Corruption damage, fear, cleansing/dark path.                                    | Final Game   |

# 22. Core POC Scenario: Forest Hamlet Watchtower Loop

This is the recommended first integrated scenario for the POC. It uses the smallest feature set that proves the final game identity.

8.  Player discovers a forest hamlet through smoke, road signs, NPC rumours, or exploration.

9.  Elder Rowan explains that goblins have been scouting the area and the hamlet needs a watchtower.

10. The request board lists the Watchtower Supply Crate resources and shows current warehouse stock.

11. The player mines stone/iron, chops wood, crafts planks/beams/nails/plates, and optionally builds a basic automation chain to produce iron or stone supply.

12. At Helpful Outsider reputation, the player can donate items. At Trusted Supplier, they can deliver approved resources directly to the warehouse and unlock basic automation input.

13. The warehouse reserves project resources and the builder begins the foundation stage.

14. The builder progresses through foundation, timber frame, and platform stages, visibly using scaffolds and supply crates.

15. The guard begins using the watchtower once the functional platform stage is complete.

16. A goblin raid triggers. If the tower is complete, guards spot enemies earlier, fight better, and village damage is reduced. If incomplete, the raid causes more injuries, stolen goods, or damaged buildings.

17. After the raid, the request board updates with damage, repairs, gratitude or grief, reputation changes, and the next village growth hook.

## 22.1 POC Outcome Matrix

| **Village Preparation**                                 | **Raid Outcome**                                                             | **Player Feedback**                                                           |
|---------------------------------------------------------|------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| No watchtower, low guard gear, low safety.              | High damage risk, possible injury/death, warehouse theft, urgent repairs.    | Elder disappointed/fearful; repair request; player learns consequence.        |
| Watchtower supplied but not complete.                   | Moderate damage; scaffolds may be damaged; builder/guard comments on timing. | Project remains important; player sees partial preparation mattered somewhat. |
| Watchtower complete, basic guard supply.                | Reduced damage, guard performs better, village survives with gratitude.      | Reputation boost, merchant stock improves, next project unlock.               |
| Watchtower complete plus ward lantern/extra guard gear. | Strong defence, minimal damage, possible bonus loot/prisoner/rumour.         | Mage/guard praise; advanced village defence hook appears.                     |
| Player conquers/intimidates instead of helping.         | Raid may be repelled by force, but fear/resistance rises.                    | Tribute/control path begins; villagers may hide resources or seek allies.     |

# 23. Balancing Rules

- Village systems should create motivation, not constant babysitting. Shortages should warn before collapsing by default.

- NPC needs should matter most at village scale. Individual micromanagement should be optional or limited to important NPCs.

- Real item consumption should be readable. The player should be able to see why food, tools, guard gear, or project materials are disappearing.

- Project requirements should be high enough to justify automation, but not so high that early POC becomes a grind.

- Death and destruction should create consequences and recovery paths, not simply delete fun.

- Hero, trader, automation, peaceful builder, conqueror, and forbidden magic playstyles should all be supported, but not treated as morally identical by the world.

- Distant simulation must be simplified aggressively. A beautiful local village is more important than simulating every distant villager pathfinding in real time.

- NPCs should visibly do jobs when nearby, even if the exact economic output is partially abstracted behind the scenes.

- Player-founded settlements must reuse the same underlying NPC, storage, project, reputation, and permission systems rather than becoming a separate game mode.

# 24. Open Questions for Later Documents

| **Future Question**                                                                           | **Likely Document**                                       |
|-----------------------------------------------------------------------------------------------|-----------------------------------------------------------|
| What exact population numbers define each growth stage?                                       | Village Growth / Settlement System                        |
| How are culture-specific architecture sets generated and upgraded?                            | Races, Cultures, and Factions + Blocks Registry expansion |
| How deep should the law/crime/jail system become?                                             | Economy/Law/Faction System                                |
| How much direct control should the player have in founded settlements?                        | Player Settlement System                                  |
| What exact combat stats do guards, raiders, and towers use?                                   | Combat, Gear, and Defence                                 |
| How do golem labour ethics and culture reactions differ by race/faction?                      | Magic System + Races/Cultures/Factions                    |
| How do caravans calculate route safety and trade profit?                                      | Economy and Trade System                                  |
| How are children, schools, apprenticeships, and aging balanced in long-term worlds?           | Population and Generations System                         |
| How do dimensions affect villages through corruption, portals, resources, and story?          | Dimensions and Realm Design                               |
| What exact UI screen layout best presents village complexity without overwhelming the player? | UI/UX and Player Experience                               |

# Appendix A. POC Village Checklist

| **Group**         | **Required Elements**                                                                                          | **Status / Reason**                             |
|-------------------|----------------------------------------------------------------------------------------------------------------|-------------------------------------------------|
| NPCs              | Elder, builder, farmer, guard, merchant, mage, miner, lumberjack.                                              | Required - tests core job loop.                 |
| Buildings         | Homes, warehouse, request board, farm plot, guard post, mage hut, market stall, well, watchtower project site. | Required - tests village structure.             |
| Needs             | Food, shelter, safety, tools, work access, morale, water access.                                               | Required - tests consumption and shortage.      |
| Storage           | Food, construction, guard, magic, donation, reserved project categories.                                       | Required - tests real resources.                |
| Project           | Watchtower supply crate, foundation, frame, platform, functional guard use.                                    | Required - tests NPC construction.              |
| Automation        | Basic resource production into approved warehouse input.                                                       | Required - tests factory-to-village hook.       |
| Magic             | Basic rune/mana teaching, ward lantern or mana furnace tie-in.                                                 | Required - tests magic infrastructure.          |
| Raid              | Goblin raid with damage, theft/injury risk, guard response, outcome matrix.                                    | Required - tests consequences.                  |
| UI                | Dialogue, board, warehouse UI, project progress, reputation, raid warning.                                     | Required - tests comprehension.                 |
| Advanced Families | Children/aging/inheritance.                                                                                    | Deferred - design exists but not POC-critical.  |
| Caravans          | Trade routes.                                                                                                  | Alpha - not needed for first slice.             |
| Conquest Path     | Fear/tribute/resistance.                                                                                       | Alpha/Final - data fields now, mechanics later. |

# Appendix B. NPC/Village Database Field Templates

## B.1 NPC Template Fields

| **Field**              | **Purpose**                                                           | **Required?**               |
|------------------------|-----------------------------------------------------------------------|-----------------------------|
| npc_template_id        | Database-friendly ID.                                                 | Required                    |
| display_name_template  | Generated naming pattern or authored name.                            | Required                    |
| npc_type               | Resident, specialist, leader, guard, child, traveller, raider, golem. | Required                    |
| culture_id             | Culture/race/faction link.                                            | Required if relevant        |
| default_job_id         | Starting job or role.                                                 | Required if worker/resident |
| need_profile_id        | Need and consumption profile.                                         | Required                    |
| schedule_profile_id    | Daily behaviour pattern.                                              | Required                    |
| inventory_profile_id   | Personal inventory/equipment defaults.                                | Required if relevant        |
| skill_profile          | Job skill, combat skill, teaching ability, quality modifiers.         | Required if relevant        |
| home_requirement       | Home/bed/shelter requirement.                                         | Required for residents      |
| interaction_types      | Dialogue, shop, teach, request, hire, fight, arrest, heal.            | Required if relevant        |
| memory_flags_supported | Major events this NPC can remember.                                   | Optional                    |
| tags                   | System/search tags.                                                   | Required                    |
| planning_scope         | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.         | Planning only               |

## B.2 Village Template Fields

| **Field**              | **Purpose**                                                                        | **Required?** |
|------------------------|------------------------------------------------------------------------------------|---------------|
| village_template_id    | Database-friendly settlement template ID.                                          | Required      |
| display_name_template  | Naming rules or authored names.                                                    | Required      |
| culture_id             | Culture/race/faction identity.                                                     | Required      |
| biome_tags             | Where the village can generate.                                                    | Required      |
| growth_stage           | Camp, Hamlet, Village, Fortified Village, Town, City, Capital, Magical Metropolis. | Required      |
| building_set           | Allowed architecture/building families.                                            | Required      |
| starting_npc_templates | NPCs that spawn with the settlement.                                               | Required      |
| storage_profile_id     | Warehouse and storage category rules.                                              | Required      |
| project_pool           | Available projects and prerequisites.                                              | Required      |
| need_rules             | Village-scale consumption and shortage rules.                                      | Required      |
| threat_profile_id      | Raid/disaster/corruption/danger behaviour.                                         | Required      |
| reputation_profile_id  | Trust/fear/faction permissions and unlocks.                                        | Required      |
| simulation_lod_profile | Nearby/far simulation rules.                                                       | Required      |
| tags                   | System/search tags.                                                                | Required      |
| planning_scope         | POC Required, Alpha, Beta, Final Game, Placeholder, Deferred.                      | Planning only |

# Appendix C. Cross-System Use Matrix

| **System**     | **Village Link**                                                                     | **NPC Link**                                                            | **POC?**    |
|----------------|--------------------------------------------------------------------------------------|-------------------------------------------------------------------------|-------------|
| Blocks         | Warehouses, project anchors, scaffolds, watchtower, walls, damaged/repair states.    | NPCs place, repair, farm, mine, cut, guard, path around blocks.         | Yes         |
| Items          | Food, tools, guard gear, medicine, culture goods, magic resources, project supplies. | NPCs consume, carry, equip, trade, teach, and request items.            | Yes         |
| Recipes        | Project recipes, repair recipes, supply crates, warehouse manifests.                 | NPCs craft, teach, build, reserve resources through recipes.            | Yes         |
| Resources      | Exact stored materials for projects, food, repairs, tools, trade, magic.             | NPC jobs gather/refine/consume resources.                               | Yes         |
| Automation     | Warehouse input/output, supply contracts, bulk materials, village dependence/risk.   | NPCs benefit from reduced hauling or may react to machine consequences. | Yes         |
| Magic          | Wards, mana lights, rituals, mage tower, cleansing, portals.                         | Mages teach/use magic; golems and forbidden magic affect reactions.     | Yes         |
| Combat/Defence | Raids, guards, towers, walls, traps, damage states.                                  | Guards fight; non-combatants flee; leaders warn; mages heal/ward.       | Yes         |
| Economy        | Stock, prices, shortages, trade routes, caravans, strategic goods.                   | Merchants trade, couriers move goods, cultures prefer goods.            | Partial POC |
| Races/Cultures | Architecture, food, festivals, story gates, taboos, diplomacy.                       | NPC names, reactions, teachings, culture needs.                         | Alpha/Final |
| Dimensions     | Portal projects, realm resources, corruption, race story arcs.                       | Mages/ritualists/scouts react and unlock stories.                       | Teaser only |
| UI/UX          | Village overview, request board, warehouse, project progress, raid warning.          | Dialogue, services, memory, relationship state.                         | Yes         |

# Appendix D. Future NPC/Village Backlog

| **Backlog Family**           | **Examples**                                                                                        |
|------------------------------|-----------------------------------------------------------------------------------------------------|
| Advanced NPC Personality     | Traits, likes/dislikes, fears, ambitions, loyalties, rivalries, hobbies, trauma/recovery.           |
| Deep Families                | Marriage, inheritance, apprenticeships, schooling, adoption, dynasties, legacy names.               |
| City Governance              | Councils, laws, taxes, districts, public works, courts, prisons, mayors, elections/appointments.    |
| Faction War                  | Sieges, occupations, liberation, treaties, border towns, tribute, raids, deserters.                 |
| Advanced Economy             | Caravans, contracts, market stalls, inflation/demand, shortages, monopolies, strategic stockpiles.  |
| Culture Festivals            | Seasonal events, rituals, food, decorations, games, reputation rewards, story clues.                |
| Player-Founded Settlements   | Town founding, zoning, job assignment, laws, permission rules, leadership perks, districts.         |
| Golem Civil Labour           | Programmable haulers, guard golems, miner golems, builder golems, village acceptance/ethics.        |
| Forbidden Civilisation Paths | Necromantic labour, cursed factories, tribute systems, fear economy, rebellion/resistance.          |
| Dimension-Linked Villages    | Fae villages, Deep Forge cities, Dream hamlets, Void corruption settlements, Sky realm outposts.    |
| Large Projects               | Castles, aqueducts, bridges, roads, walls, mage towers, portals, wonders, floating cities.          |
| Advanced Disaster Recovery   | Refugee camps, reconstruction campaigns, memorials, haunted ruins, cleansing rituals, resettlement. |

# End of Document

This v0.1 NPC Village System locks the foundation for living settlements: named NPCs, real needs, jobs, schedules, personal and village inventories, warehouses, permissions, construction projects, repairs, reputation, fear, quests, economy, raids, families, magic, automation, simulation LOD, UI, POC scope, and registry-ready data. Future documents should expand specialised systems without drifting away from the core promise: the player shapes living fantasy civilisations through survival, magic, automation, and choice.
