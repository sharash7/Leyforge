---
title: 24F — Wildlife, Creatures, Monsters and Ecology Atlas
document_set: 24
document: 24F
aliases:
- 24F
- Document 24F
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
- 24f
---

# 24F — Wildlife, Creatures, Monsters and Ecology Atlas

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24F - World Content Atlas: Wildlife, Creatures, Monsters and Ecology Atlas**

Version 0.1 - Post-POC Production Content Draft

A database-ready ecology atlas for ambient life, wildlife, livestock, predators, monsters, magical beings, undead, constructs, dimensional fauna, population simulation, nests, migration, taming, harvesting, ecological events, and persistent world consequences.

| **Wildlife, Creatures, Monsters and Ecology Atlas Statement**                                                                                                                                                                                                                                                                                                                                                          |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Production worlds must not use the retired Forest Hamlet creature roster or any fixed POC spawn arrangement. Every creature family, population, nest, migration, dungeon ecology, settlement threat, and realm fauna package is selected through deterministic seed-derived habitat, history, faction, magic, and world-state rules. Creatures are living ecological actors rather than interchangeable combat spawns. |

| **Field**               | **Locked Direction**                                                                                                                                                                                                                                                       |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document Scope**      | Full post-POC Atlas covering creature taxonomy, ecological roles, populations, habitats, lifecycle, migration, nests, ordinary wildlife, livestock, monsters, magical and dimensional fauna, taming, resources, simulation LOD, data contracts, and production registries. |
| **POC Status**          | All POC-only creatures, goblin raid actors, fixed cave threats, Forest Wisp tutorial logic, and valley-specific spawn relationships are archived and excluded from production registries.                                                                                  |
| **Core Philosophy**     | Creatures must provide ecology, danger, resources, clues, labour, companionship, settlement pressure, magic, story, or world-state consequences. Combat is one role, not the entire identity.                                                                              |
| **Worldgen Direction**  | Populations derive from biome, microhabitat, season, climate, terrain, water, food, lairs, civilisation pressure, magical fields, history, realm law, and current events.                                                                                                  |
| **Content Direction**   | Use authored creature families with deterministic compatible variants. Do not procedurally assemble random body parts, abilities, behaviours, and loot without a coherent family identity.                                                                                 |
| **Production Target**   | Define a broad v0.1 foundation of 72 Overworld creature families, 60 realm creature families, ecology packages, dungeon-fauna modules, boss ecology hooks, and minimum biome/realm completeness contracts.                                                                 |
| **Technical Direction** | Use stable namespace IDs, definition inheritance, population records, deterministic reconciliation, near/far simulation, authoritative transactions, seed validation, and save-safe state changes in Godot/Summer Engine.                                                  |

# Document Purpose

This document is the creature- and ecology-facing volume of Document Set 24, the World Content Atlas. It converts the broad creature system established in Document 10 into a post-POC production framework connected to the procedural world rules in 24A, the Overworld biome atlases in 24B and 24C, the realm atlas in 24D, and the peoples, factions, and settlement atlas in 24E.

The Atlas does not replace detailed combat movesets, animation graphs, navigation code, final loot balancing, dungeon layouts, boss encounter design, animal husbandry UI, or Forge asset specifications. It owns creature identity, ecological role, habitat compatibility, population behaviour, world relationships, registry structure, and the content contracts those later systems must fulfil.

This volume formally supersedes all creature assumptions created only to prove the POC. The retired POC animals, cave threats, goblin raid roster, raid captain, and magical tutorial creature remain historical test references only. Production worlds receive no guaranteed creature, camp, nest, raid, boss, or magical encounter at a fixed location.

# Design Source and Supersession Rules

| **Source**                                                  | **Inherited Direction**                                                                                            | **24F Production Treatment**                                                                                               |
|-------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------|
| **00 - Master Game Design Bible**                           | Creatures support survival, villages, magic, automation, exploration, economy, story, and consequence.             | Preserve the living-world identity while replacing small POC examples with scalable ecosystem packages.                    |
| **10 - Creatures and Monsters**                             | Defines creature categories, spawning, AI, drops, villages, taming, bosses, and data fields.                       | Retain the system principles; supersede POC scope, POC registry status, and fixed goblin-raid assumptions.                 |
| **11 - Biomes and World Generation**                        | Biome spawns depend on ecology, light, weather, structures, magic, safety, and world state.                        | Use 24B/24C biome definitions as habitat authority and define required ecology slots for every biome family.               |
| **24A - Atlas Foundations**                                 | All world content is deterministic, seed-derived, relationship-validated, and free from hardcoded canonical sites. | Creature populations, migrations, nests, variants, and events follow the Atlas graph and seed hierarchy.                   |
| **24B - Surface Biomes**                                    | Defines 96 natural surface biomes, climates, ecotones, seasons, resources, settlements, and threat slots.          | Assign compatible creature packages rather than fixed one-creature-per-biome lists.                                        |
| **24C - Oceans, Skylands, Underground, and Special Biomes** | Defines marine, aerial, subterranean, magical, corrupted, and special Overworld habitats.                          | Provide locomotion, pressure, altitude, water, darkness, and anomaly adaptations plus specialist ecology families.         |
| **24D - Dimensions and Realm Biomes**                       | Defines 12 realms with 96 realm-biome families, realm laws, dungeon mechanics, and boss hooks.                     | Provide realm-native fauna packages whose biology, behaviour, and resources obey each realm law.                           |
| **24E - Peoples, Cultures, Factions, and Settlements**      | Separates personhood, ancestry, culture, faction, citizenship, law, and hostility.                                 | Sapient peoples are not classified as monsters. Hostility belongs to faction, circumstance, law, and individual behaviour. |

# Static Table of Contents

1\. Locked Wildlife, Creatures, Monsters and Ecology Atlas Identity

2\. Post-POC Production Decisions

3\. Authority and Cross-Document Ownership

4\. Creature Taxonomy, Terminology, Personhood, and Classification

5\. Ecology Graph, Trophic Roles, and Habitat Relationships

6\. Population, Range, Carrying Capacity, and Local Density

7\. Lifecycle, Reproduction, Growth, Migration, and Seasonal Behaviour

8\. Ambient Life, Microfauna, Pollinators, and Environmental Clues

9\. Grazers, Browsers, Herds, Prey, and Neutral Wildlife

10\. Predators, Apex Predators, Territorial Beasts, and Counterplay

11\. Scavengers, Pests, Parasites, Vermin, and Crop Pressure

12\. Livestock, Domestication, Husbandry, and Village Economy

13\. Pets, Mounts, Work Beasts, Companions, and Training

14\. Hostile Overworld Monsters and Environmental Threat Roles

15\. Personhood Boundary, Intelligent Hostility, and Faction Ownership

16\. Magical, Fae, Spirit, Dream, and Leyline Fauna

17\. Elementals, Living Weather, and Material-Bodied Creatures

18\. Undead, Necromantic Ecology, Ghosts, and Remains

19\. Corruption, Blight, Infernal, Void, and Realm-Leak Creatures

20\. Constructs, Golems, Machine Life, and Created Organisms

21\. Marine, Aerial, Subterranean, and Extreme-Environment Ecology

22\. Dimension Ecology and Realm Fauna Packages

23\. Nests, Dens, Colonies, Herd Grounds, Lairs, and Territory

24\. Encounter Assembly, Spawning, World Pressure, and Safe Zones

25\. AI, Senses, Morale, Communication, Group Tactics, and Terrain Use

26\. Settlements, Factions, Roads, Farms, Automation, and Magic Interaction

27\. Hunting, Harvesting, Drops, Trophies, Resources, and Trade

28\. Taming, Breeding, Care, Welfare, Ownership, and Release

29\. Venom, Disease, Infestation, Status, and Ecological Hazard Rules

30\. Variants, Morphs, Seasons, Age, Mutation, and Corruption

31\. Invasive Species, Overhunting, Extinction, Reintroduction, and Recovery

32\. Creature Events, Migrations, Outbreaks, Sieges, and World Transformation

33\. Tracking, Research, Rumours, Codex Knowledge, and Competing Names

34\. Detailed Overworld Creature Family Registry v0.1

35\. Detailed Realm Creature Family Registry v0.1

36\. Dungeon Ecology Modules and Boss Ecology Hooks

37\. Content Completeness Contracts and Production Budgets

38\. Presentation, Forge, Animation, Audio, VFX, and Readability Requirements

39\. Simulation LOD, Persistence, Multiplayer, and Save Safety

40\. Data Models, Registries, Validation, Seed Testing, and Production Gates

41\. Balancing, Representation, Accessibility, and Player-Freedom Rules

42\. Cross-Document Update Plan

43\. Open Questions

Appendix A. Creature Family Definition Template

Appendix B. Population and Ecology Package Template

Appendix C. Taming, Husbandry, and Companion Template

Appendix D. Dungeon Ecology and Boss Ecology Templates

Appendix E. Minimum Completeness and Validation Matrix

Appendix F. Acceptance Criteria

# 1. Locked Wildlife, Creatures, Monsters and Ecology Atlas Identity

The ecology Atlas is the living non-civilisation layer of every generated world. It defines the animals, monsters, spirits, constructs, undead, pests, predators, work creatures, realm fauna, and population processes that make terrain respond to time, climate, settlement growth, resource extraction, magic, faction activity, and player action.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Locked Rule<br />
</strong>No creature family exists only to fill a spawn table or provide a generic health bar. Every production creature must meaningfully provide, consume, threaten, protect, reveal, migrate, transform, teach, trade, work, reproduce, infest, stabilise, or alter another world system.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

| **Identity Layer**            | **Design Meaning**                                                                                                       | **Player-Facing Result**                                                             |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| **Living Ecology**            | Food webs, seasonal cycles, migration, nests, predation, disease, competition, and habitat pressure connect populations. | Biomes feel inhabited and readable rather than randomly populated.                   |
| **Adventure and Threat**      | Monsters, predators, lairs, raids, dungeon fauna, and bosses create preparation and defence goals.                       | Danger has visible sources, clues, counterplay, and consequences.                    |
| **Resource and Economy**      | Meat, fibre, hide, bone, venom, chitin, essence, labour, eggs, milk, transport, and trophies enter real economies.       | Hunting, husbandry, trade, crafting, and village needs connect.                      |
| **Magic and Realm Law**       | Spirits, elementals, dream fauna, undead, constructs, and dimensional species express physical and magical laws.         | Magic and dimensions are visible in ecology, not confined to UI or terrain palettes. |
| **Civilisation Relationship** | Settlements domesticate, fear, protect, worship, regulate, hunt, conserve, exploit, or cooperate with creatures.         | Cultures and factions differ through real ecological relationships.                  |
| **Persistent Consequence**    | Overhunting, taming, settlement expansion, cleansing, corruption, invasion, and boss outcomes change populations.        | The world remembers player and NPC choices.                                          |

## 1.1 What this Atlas prevents

- Hardcoded Forest Hamlet creatures, mandatory goblin raids, fixed cave enemies, and tutorial-only magical fauna appearing in production worlds.

- Every forest receiving the same deer, wolf, spider, and goblin package regardless of climate, history, culture, magic, or food availability.

- Sapient peoples being listed as monsters because one faction is hostile.

- Bosses spawning as isolated combat arenas with no territory, ecological clues, local effects, or aftermath.

- Wildlife functioning as decorative particles while livestock, hunting, settlement needs, and ecology use unrelated systems.

- Unlimited invisible respawning that ignores nests, population pressure, clearing, conservation, migration, or player construction.

- Creature drops existing only as vendor trash instead of resources, evidence, knowledge, trade goods, ritual materials, or ecological costs.

- Dimensions receiving recoloured Overworld animals that do not obey realm laws or support realm societies and progression.

# 2. Post-POC Production Decisions

| **Area**                 | **Locked Production Decision**                                                                                                                                    |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **POC Retirement**       | Archive all POC creature definitions and scenario bindings. Production registries contain no POC Required status and no fixed valley references.                  |
| **Creature Families**    | Use authored families with coherent silhouettes, movement, behaviour, habitat, resource, and variation rules.                                                     |
| **Ecology Depth**        | Use a layered simulation: authored ecological relationships, bounded population values, seasonal migration, local nests, and abstract regional reconciliation.    |
| **Personhood**           | Self-aware peoples, awakened constructs, and social beings are governed by 24E identity and faction rules, not monster taxonomy.                                  |
| **Biome Population**     | Biome definitions expose habitat and ecology slots. Seeds select compatible packages based on food, terrain, climate, history, magic, and civilisation pressure.  |
| **Dimensions**           | Every major realm receives native ecology families, adapted migrants, dungeon fauna, resource links, and law-specific behaviour.                                  |
| **Spawning**             | Prefer population sources, nests, migration, territory, breeding, events, and dungeon ownership over unexplained point spawning.                                  |
| **Bosses**               | 24F defines ecological roles and aftermath hooks; 24H owns full encounter design, phases, rewards, and world-boss production entries.                             |
| **Dungeons**             | 24F defines dungeon ecology modules; 24G owns room grammar, layouts, puzzles, ownership, restoration, and complete dungeon registries.                            |
| **Taming**               | Taming requires species suitability, individual disposition, care, training, ownership, welfare, and world reaction. It is not a universal capture mechanic.      |
| **Extinction**           | Local depletion and regional collapse may occur under suitable settings. Global permanent extinction requires explicit high-consequence rules and recovery paths. |
| **Procedural Variation** | Variation changes age, sex where relevant, size, coat, pattern, horns, season, health, magic exposure, and regional adaptation within authored limits.            |

# 3. Authority and Cross-Document Ownership

| **Content Question**                                | **Primary Authority**                     | **24F Responsibility**                                                                     |
|-----------------------------------------------------|-------------------------------------------|--------------------------------------------------------------------------------------------|
| **Where can the creature live?**                    | 24B, 24C, 24D                             | Declare habitat constraints, niche requirements, range, migration, and exclusions.         |
| **Is the being a person or faction member?**        | 24E                                       | Declare personhood boundary and defer culture, law, faction, dialogue, and citizenship.    |
| **How is its lair or dungeon built?**               | 24G                                       | Declare nest/lair needs and ecology modules; defer room grammar and final site production. |
| **How does the boss fight work?**                   | 24H and Document 16                       | Declare territory, ecology, awakening, clues, and aftermath; defer full combat phases.     |
| **What resources drop and what are they used for?** | Documents 04, 05, 06, and 24J             | Declare resource identity, harvesting method, renewability, ethics, and ecology cost.      |
| **How does AI execute?**                            | Technical implementation and AI documents | Declare behavioural profile, senses, group logic, schedules, and simulation requirements.  |
| **What model, rig, sound, and VFX are required?**   | Forge and presentation documents          | Declare asset family, sockets, events, silhouette, audio language, and readability needs.  |

# 4. Creature Taxonomy, Terminology, Personhood, and Classification

The Atlas uses multiple independent classification axes. Category is not morality, threat tier is not intelligence, and biological ancestry is not faction. A peaceful elemental, hostile livestock animal, self-aware construct, corrupted predator, and domesticated monster can all be represented without forcing them into one hierarchy.

| **Axis**             | **Example Values**                                                                                                            | **Use**                                                              |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| **Being Class**      | animal, plant-like organism, fungal colony, spirit, elemental, undead, construct, swarm, created organism, anomaly            | Determines baseline systems and presentation.                        |
| **Personhood State** | non-person, uncertain, emergent, recognised person, disputed personhood, collective personhood                                | Routes law, dialogue, ownership, harm, captivity, and faction rules. |
| **Ecological Role**  | producer partner, pollinator, grazer, browser, predator, apex, scavenger, parasite, decomposer, ecosystem engineer            | Connects food web and habitat effects.                               |
| **Gameplay Role**    | ambient clue, resource source, livestock, mount, work beast, nuisance, stealth threat, siege threat, dungeon enemy, boss hook | Defines player-facing function without replacing ecology.            |
| **Threat Band**      | harmless, defensive, low, moderate, severe, regional, catastrophic                                                            | Supports encounter budget and warnings.                              |
| **Social Pattern**   | solitary, pair, family, herd, pack, flock, colony, swarm, hive, temporary aggregation                                         | Controls population presentation and AI.                             |
| **Origin**           | natural, magically adapted, artificial, undead, corrupted, infernal, void, realm-native, cross-realm migrant                  | Connects history and vulnerability.                                  |

## 4.1 Personhood boundary rules

- A being capable of language, durable self-identity, culture, law, negotiation, moral agency, and social memory is presumed to fall under 24E unless the setting intentionally treats personhood as disputed.

- Collective minds, awakened golems, intelligent undead, spirits, and dream beings require explicit personhood records rather than being classified by body type.

- Hostility, predation, corruption, possession, faction war, or lack of shared language does not by itself remove personhood.

- Taming, ownership, harvesting, breeding, and captivity systems must reject recognised persons and surface warnings for uncertain or disputed beings.

# 5. Ecology Graph, Trophic Roles, and Habitat Relationships

Each regional ecology is assembled as a graph of authored relationships. The graph does not attempt a full scientific simulation. It tracks enough energy, habitat, population, and pressure relationships to produce believable spawns, shortages, migrations, settlement problems, and recovery.

| **Relationship Edge**      | **Meaning**                                                                                               | **Example Consequence**                                                        |
|----------------------------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **feeds_on**               | Consumer depends on another creature, plant, fungus, mineral, mana field, memory, heat, or machine waste. | Prey collapse reduces predator carrying capacity or pushes raids toward farms. |
| **pollinates / disperses** | Creature supports plant reproduction or resource spread.                                                  | Loss lowers crop or wild-herb output until alternatives arrive.                |
| **shelters_in / nests_in** | Creature requires terrain, vegetation, structures, ruins, machines, or magical fields.                    | Clearing habitat removes local source even when the biome remains valid.       |
| **competes_with**          | Families share food, territory, nest sites, or magical energy.                                            | Introduced livestock can displace native grazers.                              |
| **preys_on / controls**    | Predator limits prey, pests, disease carriers, or corruption organisms.                                   | Removing predators increases crop damage or infestation.                       |
| **engineers_habitat**      | Dams, burrows, grazing, digging, reef building, fire setting, or mana cycling changes terrain.            | Population growth creates wetlands, tunnels, clearings, or hazards.            |
| **symbiosis**              | Two families gain shelter, food, cleaning, transport, mana, or protection.                                | Breaking one relationship weakens both populations.                            |
| **avoids / repelled_by**   | Light, wards, sound, civilisation, fire, salt, cold, ritual law, or another creature excludes it.         | Players can create safe corridors without killing every creature.              |

# 6. Population, Range, Carrying Capacity, and Local Density

Population is tracked at the smallest practical level for the simulation range. Nearby actors represent individuals or groups. Distant areas store family totals, age structure bands, nest counts, pressure, migration intent, and notable identities. Carrying capacity is influenced by food, water, shelter, climate, competition, predation, disease, civilisation, and magical stability.

| **Population State**   | **World Meaning**                                                                 | **Generation / Simulation Treatment**                                                        |
|------------------------|-----------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| **Absent**             | Habitat is incompatible or no colonisation route exists.                          | Do not spawn, even if the biome family generally supports the creature.                      |
| **Trace**              | Tracks, calls, scat, one-off individuals, or migration stragglers.                | Rare encounters and clues; no durable local breeding source.                                 |
| **Established**        | Stable breeding population within carrying capacity.                              | Normal encounter, nest, and resource rules.                                                  |
| **Abundant**           | High food and habitat availability or reduced predation.                          | More visible groups, crop pressure, migration, and hunting opportunity.                      |
| **Overpopulated**      | Population exceeds safe capacity.                                                 | Starvation, disease, dispersal, settlement conflict, habitat damage, or predator attraction. |
| **Declining**          | Loss exceeds recruitment due to hunting, habitat change, disease, or competition. | Fewer encounters, conservation requests, price changes, and ecosystem effects.               |
| **Locally Extirpated** | No local population remains, but recolonisation is possible.                      | Require migration, reintroduction, hidden survivors, or deliberate restoration.              |

# 7. Lifecycle, Reproduction, Growth, Migration, and Seasonal Behaviour

| **Lifecycle Layer**    | **Required Fields**                                                                             | **Gameplay Connections**                                                        |
|------------------------|-------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| **Age / Stage**        | juvenile, adolescent, adult, elder, larva, pupa, seed, dormant, spectral stage, assembled stage | Silhouette, stats, behaviour, drops, taming, care, and vulnerability.           |
| **Breeding Trigger**   | season, food surplus, rainfall, moon, leyline pulse, ritual, nest condition, machine cycle      | Creates readable population rhythms and event windows.                          |
| **Gestation / Growth** | abstract duration, care requirements, environmental dependence, magical stability               | Supports husbandry without excessive micromanagement.                           |
| **Migration**          | origin, destination profile, corridor, group size, season, weather threshold, danger response   | Creates moving encounters, hunting, road hazards, and settlement opportunities. |
| **Dormancy**           | hibernation, cocoon, burial, shutdown, spirit withdrawal, dry-season torpor                     | Changes spawn pressure and resource availability.                               |
| **Death / Remains**    | carcass, shed parts, spirit residue, salvage, decomposition, reanimation risk                   | Feeds scavengers, resources, disease, rituals, and world evidence.              |

# 8. Ambient Life, Microfauna, Pollinators, and Environmental Clues

Ambient life is rendered at lower cost than full gameplay actors but still communicates ecology. Swarms, tracks, calls, disturbed vegetation, burrows, shells, nests, feathers, spores, shed skins, and mana trails can indicate resources, weather, predators, hidden structures, or environmental change.

- Ambient populations may be represented through pooled particles, decals, simple agents, audio emitters, vegetation reactions, and regional density values.

- Pollinators and seed dispersers may affect farming or wild-resource yield only at higher ecology settings; default play uses readable bonuses rather than punitive collapse.

- Environmental clues must remain available through visual, audio, controller, and accessibility channels.

# 9. Grazers, Browsers, Herds, Prey, and Neutral Wildlife

Neutral wildlife creates food-web structure, hunting, observation, travel clues, migration events, predator pressure, and settlement conflict. Herds should use group awareness, juvenile protection, alarm communication, route memory, and terrain-specific escape behaviour.

| **Role**                      | **Design Requirement**                                                  | **Counterplay / Opportunity**                                                   |
|-------------------------------|-------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| **Small Prey**                | Burrows, cover use, rapid reproduction, predator food, minor resources. | Traps, non-lethal capture, farm protection, conservation, predator observation. |
| **Browser**                   | Depends on shrubs, leaves, bark, or canopy edge.                        | Forest management, orchard conflict, seasonal migration.                        |
| **Grazer**                    | Depends on grass, sedge, tundra plants, algae, or realm equivalent.     | Pasture competition, herding, hunting, predator attraction.                     |
| **Large Defensive Herbivore** | Strong warning, charge, group defence, or armour.                       | Avoidance, terrain use, calming, specialist hunting, taming exceptions.         |
| **Ecosystem Engineer**        | Digs, dams, grazes, clears, reefs, spreads mana, or fertilises.         | Protect, relocate, harvest sustainably, or accept landscape change.             |

# 10. Predators, Apex Predators, Territorial Beasts, and Counterplay

Predators should hunt according to prey availability, time, terrain, weather, injury, hunger, territory, and risk. They are not expected to attack the player on sight in every circumstance. Warning displays, stalking, avoidance, retreat, scavenging, and territorial defence create more readable behaviour than universal aggression.

- Apex predators suppress smaller predators, pests, or overabundant grazers and therefore have regional consequences when removed.

- Predator territories use den sites, kill remains, calls, scratches, tracks, missing livestock, and NPC reports as advance warning.

- Counterplay can include light, fire, noise, scent masking, wards, fences, elevation, guard animals, safe routes, bait, relocation, or hunting.

- Repeated killing may create a vacant territory that another predator, monster, faction, or invasive species later occupies.

# 11. Scavengers, Pests, Parasites, Vermin, and Crop Pressure

| **Pressure Type**       | **Target**                                                | **World Effects**                                                                   |
|-------------------------|-----------------------------------------------------------|-------------------------------------------------------------------------------------|
| **Food Theft**          | fields, barns, camps, warehouses, caravans                | Loss, contamination, traps, guard jobs, storage upgrades, population booms.         |
| **Material Nesting**    | cloth, timber, metal scrap, mana conduits, books          | Machine faults, damaged records, salvage clues, specialist extermination.           |
| **Parasite**            | animals, livestock, monsters, plants, spirits, constructs | Weakness, disease, behavioural change, quality loss, treatment demand.              |
| **Carrion Scavenging**  | corpses, battlefield remains, failed raids                | Faster cleanup, disease control, resource competition, necromantic risk.            |
| **Magical Infestation** | wards, leylines, portals, batteries, rituals              | Power drain, instability, mutation, magical resource production, specialist quests. |

# 12. Livestock, Domestication, Husbandry, and Village Economy

Domestic species are authored relationships between creatures and societies rather than universally tameable wild animals. Different cultures may maintain distinct breeds, husbandry laws, feed systems, slaughter customs, sacred protections, work uses, and trade networks.

| **Husbandry Layer** | **Required Behaviour**                                                                                                    |
|---------------------|---------------------------------------------------------------------------------------------------------------------------|
| **Ownership**       | Individual, household, guild, settlement, faction, communal, wild-managed, sacred, protected, or disputed ownership.      |
| **Needs**           | Feed category, water or equivalent, shelter, temperature, space, social group, enrichment, health, and magical stability. |
| **Outputs**         | Food, fibre, hide, eggs, milk, manure, transport, labour, guarding, mana, spores, shed materials, or prestige.            |
| **Breeding**        | Pairing or group rules, season, traits, fertility, population cap, juvenile care, and genetic/variant limits.             |
| **Welfare**         | Neglect, overcrowding, injury, fear, exposure, magical contamination, and overwork affect output and reputation.          |
| **Economy**         | Feed supply, disease, predation, route safety, cultural demand, and law alter availability and price.                     |

# 13. Pets, Mounts, Work Beasts, Companions, and Training

| **Relationship**            | **Design Identity**                                                                                    | **Commands / Constraints**                                                                |
|-----------------------------|--------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| **Pet**                     | Bond, household presence, morale, warning, minor utility.                                              | Follow, stay, home, avoid danger, interact; low combat expectation.                       |
| **Companion**               | Persistent individual with skills, bond, equipment or magical link.                                    | Tactical commands, retreat, role profile, care, injury, consent where personhood applies. |
| **Mount**                   | Traversal partner adapted to terrain, water, air, burrow, realm law, or cargo.                         | Mount/dismount, pace, stamina, route suitability, fear, injury, housing.                  |
| **Work Beast**              | Hauling, ploughing, logging, mining, lifting, guarding, pumping, or powering.                          | Work zone, schedule, load, rest, feed, safety, handler skill.                             |
| **Managed Wild Population** | Not owned individually; settlements protect, feed, guide, harvest, or coexist with a local population. | Habitat projects, seasonal access, quotas, deterrents, conservation.                      |

# 14. Hostile Overworld Monsters and Environmental Threat Roles

A monster is a gameplay classification for dangerous non-person beings, not a biological category. Monster families require a reason for hostility or hazard: predation, territoriality, hunger, magical instability, parasitism, corruption, defence of a nest, attraction to resources, artificial orders, or a world event.

| **Threat Role**        | **Behaviour Identity**                                                  | **Useful Counterplay**                                                                      |
|------------------------|-------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| **Night Hunter**       | Uses darkness, low visibility, cold, or moon conditions.                | Lighting, patrols, shelter, sound, scent, night-vision tools, sleep planning.               |
| **Ambusher**           | Uses vegetation, mud, ceilings, ruins, dunes, snow, or invisibility.    | Tracking, disturbance clues, companions, detection magic, terrain clearing.                 |
| **Swarm**              | Many weak units with colony or resource source.                         | Area control, fire/smoke where appropriate, nest removal, barriers, targeted repellents.    |
| **Siege Creature**     | Attacks gates, walls, crops, machines, or wards.                        | Defence construction, specialised guards, traps, supply resilience, weak-point targeting.   |
| **Resource Predator**  | Seeks mana, metal, heat, memory, soul residue, crops, or machine waste. | Shielding, routing, decoys, containment, cleaner production, warding.                       |
| **Territory Guardian** | Defends a sacred, natural, ancient, or constructed site.                | Avoidance, ritual permission, diplomacy if personhood applies, alternate routes, cleansing. |

# 15. Personhood Boundary, Intelligent Hostility, and Faction Ownership

Goblins, orcs, bandits, cultists, raiders, undead citizens, awakened constructs, and other self-aware groups belong to the civilisation and faction Atlas. Their combat actors may use creature AI foundations, but their identity, law, goals, surrender, diplomacy, recruitment, prisoners, reputation, and settlement consequences are owned by 24E and later faction documents.

<table>
<colgroup>
<col style="width: 100%" />
</colgroup>
<thead>
<tr class="header">
<th><strong>Classification Rule<br />
</strong>Never use ancestry or body type as the hostility flag. Encounter hostility resolves from faction relationship, local law, personal disposition, orders, crime, hunger, corruption, possession, territorial state, and event context.</th>
</tr>
</thead>
<tbody>
</tbody>
</table>

# 16. Magical, Fae, Spirit, Dream, and Leyline Fauna

| **Family Type**            | **Ecological Input**                                                  | **Typical World Relationship**                                                 |
|----------------------------|-----------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **Mana Feeder**            | ambient mana, crystals, conduits, spells, leyline discharge           | Can reveal magic, drain infrastructure, stabilise fields, or produce reagents. |
| **Place Spirit**           | river, grove, hearth, bridge, ruin, road, mountain, settlement memory | Changes with stewardship, damage, rituals, ownership, and local history.       |
| **Fae Fauna**              | season, oath, emotion, story, beauty, trickery, living terrain        | Behaves through bargains, taboos, court influence, and altered ecology.        |
| **Dream Fauna**            | sleep, memory, fear, expectation, prophecy, collective emotion        | May appear in dreams, leak into waking sites, or alter navigation and morale.  |
| **Spell-Adapted Wildlife** | long exposure to one school, relic, ward, ritual, or anomaly          | Creates regional variants with bounded abilities and ecological costs.         |

# 17. Elementals, Living Weather, and Material-Bodied Creatures

Elementals are organisms or entities whose bodies and needs are based on materials, energy, weather, or processes rather than ordinary flesh. They require source conditions, dissipation rules, resource relationships, and clear distinctions between natural, summoned, bound, and self-aware forms.

- Fire elementals may feed on heat, oxygen, fuel, lava, industrial waste, or ritual energy and can either control or spread fire depending on family.

- Water, ice, storm, stone, metal, plant, steam, sand, glass, and mixed-aspect elementals receive unique locomotion and habitat constraints.

- Bound elementals require legal, moral, faction, and maintenance consequences rather than functioning as free batteries.

- Living-weather populations may be tracked as moving regional phenomena with associated creatures, resources, hazards, and forecast clues.

# 18. Undead, Necromantic Ecology, Ghosts, and Remains

| **Undead Type**      | **Persistence Source**                                        | **Ecology / Society Boundary**                                             |
|----------------------|---------------------------------------------------------------|----------------------------------------------------------------------------|
| **Mindless Remains** | curse, ambient necromancy, failed burial, battlefield residue | Creature threat; may be controlled, cleansed, harvested, or prevented.     |
| **Bound Worker**     | ritual order, core, contract, necromancer control             | Ownership and labour ethics; personhood must be assessed.                  |
| **Ghost / Echo**     | memory, identity, place, unfinished event, repeated pattern   | Can be person, fragment, clue, hazard, or environmental record.            |
| **Undead Animal**    | disease, curse, necromantic field, deliberate creation        | May spread corruption, ignore normal needs, or retain pack/herd behaviour. |
| **Undead Citizen**   | durable identity, language, culture, law, household, goals    | Handled as a person and civilisation member under 24E.                     |

# 19. Corruption, Blight, Infernal, Void, and Realm-Leak Creatures

Corruption families require an origin, transmission method, ecological cost, stabilisation or cleansing rules, and permanent-state policy. They should not be generic stronger variants. A blight can alter feeding, reproduction, terrain, drops, faction response, and the possibility of recovery.

| **Origin**                         | **Typical Adaptation**                                                 | **Required Consequence**                                                              |
|------------------------------------|------------------------------------------------------------------------|---------------------------------------------------------------------------------------|
| **Blight / Disease**               | rapid spread, plant-animal fusion, rot, spores, contaminated remains   | Habitat decline, treatment demand, containment, cleansing, resistant survivors.       |
| **Infernal Exposure**              | heat tolerance, contract marks, ash feeding, fear, combustion          | Fire risk, faction interest, portal pressure, valuable fuel resources.                |
| **Void Exposure**                  | spatial distortion, memory loss, gravity change, absence feeding       | Navigation failure, portal instability, identity hazards, difficult containment.      |
| **Realm Leak**                     | partial adaptation to foreign law, mixed resources, unstable lifecycle | Local anomaly, invasion risk, research opportunity, route clue, ecosystem disruption. |
| **Industrial / Magical Pollution** | metal growth, mana addiction, smoke feeding, waste nesting             | Machine faults, social conflict, cleanup projects, altered resource chains.           |

# 20. Constructs, Golems, Machine Life, and Created Organisms

| **Construct Class**    | **Identity**                                                               | **Simulation Requirement**                                                      |
|------------------------|----------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| **Tool Construct**     | Simple task logic, no durable selfhood, owner and maintenance.             | Orders, zones, fuel, wear, safety, theft, damage, shutdown.                     |
| **Guardian Construct** | Protects site, route, person, law, or resource.                            | Recognition rules, challenge behaviour, overrides, hacking/runes, deactivation. |
| **Maintenance Fauna**  | Small machines or organisms that clean, repair, sort, inspect, or recycle. | Colony source, machine integration, infestation and salvage states.             |
| **Awakened Construct** | Persistent self-identity, learning, language, memory, and goals.           | Personhood and 24E ownership; cannot be treated as tameable equipment.          |
| **Created Organism**   | Alchemical, magical, biological, dream, or dimensional design.             | Creator history, containment, reproduction, mutation, ethics, escape, ecology.  |

# 21. Marine, Aerial, Subterranean, and Extreme-Environment Ecology

| **Environment**           | **Required Adaptations**                                                            | **Gameplay and Infrastructure Links**                                          |
|---------------------------|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| **Marine / Freshwater**   | depth, salinity, oxygen, current, pressure, temperature, beaching, spawning grounds | Fishing, aquaculture, boats, diving, ports, reefs, pollution, storms.          |
| **Aerial / Skyland**      | flight mode, lift, wind, altitude, nesting, storm response, landing needs           | Gliders, airships, towers, sky farms, routes, lightning, falling hazards.      |
| **Subterranean**          | darkness, vibration, burrowing, cave volume, mineral diet, low food, vertical paths | Mining, rails, cave-ins, light, noise, ventilation, hidden colonies.           |
| **Volcanic / Geothermal** | heat, toxic gas, lava proximity, cooling cycles, mineral feeding                    | Forges, vents, obsidian, heat power, eruption events.                          |
| **Polar / Glacial**       | cold, ice movement, fat/fur/energy, snow travel, seasonal scarcity                  | Clothing, sleds, migration, meltwater, blizzards, ice dungeons.                |
| **Void / Dream / Spirit** | realm-law adaptation, anchor, memory, lucidity, identity, route stability           | Wards, rituals, portal safety, Codex certainty, nonstandard combat and taming. |

# 22. Dimension Ecology and Realm Fauna Packages

Each major dimension receives a complete ecology package rather than a small monster list. The package includes low-cost ambient life, ordinary consumers, predators, ecosystem engineers, settlement relationships, dungeon fauna, boss ecology hooks, migration or route behaviour, and resources that remain useful outside the realm.

| **Realm Ecology Requirement** | **Minimum v0.1 Target**                                                                                                       |
|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| **Native Creature Families**  | At least 5 authored families per realm in 24F, expanding toward 12-25 over production.                                        |
| **Biome Coverage**            | Every realm biome family supports at least one ordinary ecology package, one specialist or rare family, and exclusions.       |
| **Civilisation Relationship** | At least two native societies or factions have distinct uses, fears, laws, husbandry, hunting, or conservation relationships. |
| **Dungeon Ecology**           | At least three compatible dungeon-fauna modules and one law-specific ecological mechanic.                                     |
| **Regional Threat**           | At least one apex, migration, outbreak, invasion, or boss ecology hook.                                                       |
| **Cross-Realm Consequence**   | At least one invasive risk, trade species, adapted migrant, portal hitchhiker, or conservation issue.                         |

# 23. Nests, Dens, Colonies, Herd Grounds, Lairs, and Territory

| **Site Type**                 | **World Function**                                                                             | **Persistence**                                                                         |
|-------------------------------|------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| **Burrow / Den**              | Shelter, breeding, food cache, local predator or prey source.                                  | Can be active, abandoned, flooded, collapsed, occupied, protected, or relocated.        |
| **Nest / Roost**              | Eggs, juveniles, seasonal return, territorial defence, aerial or cliff ecology.                | May persist while individuals migrate; destruction affects recruitment.                 |
| **Colony / Hive**             | Centralised population source, workers, resource flow, queen/core or distributed reproduction. | Can split, migrate, infest structures, be harvested, contained, or collapse.            |
| **Herd Ground**               | Calving, grazing, watering, salt, migration rest, social gathering.                            | Seasonal site that may conflict with farms, roads, or settlements.                      |
| **Monster Lair**              | Danger source, stored loot, remains, environmental modification, boss or elite possibility.    | Clearing creates a vacancy; later reoccupation is explicit rather than invisible reset. |
| **Spirit / Elemental Anchor** | Place, object, memory, law, weather, or material source supporting nonphysical beings.         | Can be restored, polluted, bound, cleansed, moved, or severed with consequences.        |

# 24. Encounter Assembly, Spawning, World Pressure, and Safe Zones

Encounter assembly selects from established populations and world sources. The system resolves encounter intent, family, group composition, activity, location, weather, time, and current goal. It does not spawn a random combat unit because the player crossed an invisible trigger.

| **Assembly Step**         | **Resolution**                                                                                                         |
|---------------------------|------------------------------------------------------------------------------------------------------------------------|
| **1. Region Eligibility** | Check realm, biome, sub-biome, microhabitat, climate, history, current state, and population presence.                 |
| **2. Source**             | Resolve nest, migration, territory, dungeon, settlement edge, event, carcass, portal, or roaming population.           |
| **3. Activity**           | Feed, rest, travel, hunt, flee, defend, court, breed, scavenge, work, patrol, infest, or investigate.                  |
| **4. Group**              | Select age mix, social composition, leader/elite chance, juvenile protection, injuries, and variants.                  |
| **5. Player Context**     | Apply noise, light, scent, magic, equipment, reputation where relevant, wards, difficulty, and accessibility settings. |
| **6. Aftermath**          | Update losses, escape, knowledge, remains, nest pressure, local fear, settlement reports, and resource transactions.   |

## 24.1 Safe-zone rules

- Settlements, wards, roads, lights, patrols, walls, habitat management, and cleared sources reduce danger through visible infrastructure.

- Safe does not mean ecologically empty. Harmless wildlife, owned animals, pollinators, managed species, and ambient life remain present.

- Difficulty settings may allow peaceful, defensive-only, reduced threat, no settlement damage, or ecology-without-combat modes.

# 25. AI, Senses, Morale, Communication, Group Tactics, and Terrain Use

| **Behaviour Layer** | **Examples**                                                                                                                                                        |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Senses**          | vision cones, colour sensitivity, hearing, vibration, scent, heat, mana, spirit presence, electrical field, memory, line-of-sight through water.                    |
| **Motivations**     | hunger, thirst/equivalent, safety, offspring, territory, social group, work order, resource attraction, ritual law, curiosity, revenge where cognition supports it. |
| **Morale**          | confidence from group size, leader, home territory, injuries, fire, wards, casualties, trapped state, hunger, command.                                              |
| **Communication**   | calls, posture, colour, scent, vibration, light, rune signal, dream image, spirit resonance, machine network.                                                       |
| **Terrain Use**     | climb, burrow, swim, glide, fly, phase, squeeze, break blocks, open doors, use cover, perch, ambush, retreat routes.                                                |
| **Group Tactics**   | herd defence, pack flank, swarm surround, relay alarm, protect juveniles, carry wounded, siege roles, formation, distributed hive tasks.                            |

# 26. Settlements, Factions, Roads, Farms, Automation, and Magic Interaction

| **System**          | **Creature Relationships**                                                                                                                 |
|---------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| **Settlements**     | livestock, pests, pets, guard animals, sacred species, conservation, hunting law, urban scavengers, siege threats, morale.                 |
| **Factions**        | breeding programs, monster hunters, druids, beast riders, poachers, conservation orders, cults, construct guilds, portal quarantine.       |
| **Roads and Trade** | migration crossings, caravan attacks, draft animals, roadside scavengers, animal bridges, patrols, quarantine, wildlife corridors.         |
| **Farms**           | pollination, grazing, crop damage, manure, pest control, feed demand, disease, fencing, irrigation habitats, seasonal labour.              |
| **Automation**      | noise attraction, waste feeding, conduit infestation, golem labour, automated husbandry, sensors, humane deterrents, dangerous extraction. |
| **Magic**           | wards, summoning, familiars, healing, corruption, spirit negotiation, elemental binding, dream contact, transformation, realm adaptation.  |

# 27. Hunting, Harvesting, Drops, Trophies, Resources, and Trade

Creature resources are generated through anatomy, material body, magical ecology, carried inventory, nest stores, faction equipment, or post-death transformation. A family does not receive a drop table merely to satisfy rarity tiers.

| **Resource Method**               | **Required Rules**                                                                  | **Examples**                                                           |
|-----------------------------------|-------------------------------------------------------------------------------------|------------------------------------------------------------------------|
| **Non-lethal Collection**         | cooldown, care, health, season, handling skill, ownership                           | milk, eggs, fibre, shed antler, feathers, venom, spores, mana residue. |
| **Hunting / Butchery**            | tool, damage quality, spoilage, cultural law, witness, ownership, disease           | meat, hide, bone, organs, chitin, fat, teeth, trophies.                |
| **Salvage**                       | deactivation, dismantling, ownership, personhood, hazardous core, repair potential  | plates, gears, cores, runes, memory modules, machine residue.          |
| **Spirit / Elemental Resolution** | binding, release, cleansing, negotiation, condensation, ritual containment          | essence, memory, elemental crystal, oath token, weather seed.          |
| **Nest Harvest**                  | population pressure, regeneration, guardian response, sustainability, contamination | honey, silk, eggs, resin, cached goods, fungus, ore nodules.           |

# 28. Taming, Breeding, Care, Welfare, Ownership, and Release

| **Taming Stage**       | **Meaning**                                                                                                                         |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| **Eligibility**        | Family allows domestication, companionship, work, temporary calming, managed wild coexistence, or no taming.                        |
| **Trust**              | Built through food, rescue, handling, habitat, repeated safe interaction, magic, imprinting, or cultural technique.                 |
| **Training**           | Role-specific behaviours, command reliability, fear tolerance, route knowledge, equipment acceptance, and handler skill.            |
| **Care**               | Feed, shelter, health, rest, social needs, cleaning, enrichment, magical stability, and safe work limits.                           |
| **Breeding**           | Trait inheritance within authored bounds, lineage tracking, population caps, juvenile care, and prevention of exploitative loops.   |
| **Release / Transfer** | Wild release suitability, sale, gift, settlement ownership, retirement, sanctuary, death, inheritance, and multiplayer permissions. |

# 29. Venom, Disease, Infestation, Status, and Ecological Hazard Rules

Creature-caused hazards should be telegraphed, diagnosable, preventable, and configurable. Disease and infestation must not become constant chores. They create occasional ecosystem, settlement, and preparation problems with clear treatment and recovery.

| **Hazard**                | **Primary Channels**                                              | **Counterplay**                                                                         |
|---------------------------|-------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| **Venom / Toxin**         | bite, sting, spine, cloud, water, food, contact                   | armour, antidote, medicine, cooking, distance, resistance, creature knowledge.          |
| **Disease**               | parasite, carcass, livestock, water, overcrowding, realm exposure | hygiene, quarantine, healers, feed, habitat, vaccination/ritual where appropriate.      |
| **Infestation**           | grain, timber, machines, books, conduits, nests, ships            | inspection, sealed storage, predators, traps, fumigation alternatives, cleansing.       |
| **Corruption**            | wound, proximity, resource use, ritual, portal, remains           | wards, treatment, cleansing, containment, source removal, faction help.                 |
| **Fear / Dream / Memory** | call, gaze, aura, dream, place, collective event                  | training, morale, companions, light, rituals, rest, truth recovery, accessibility cues. |

# 30. Variants, Morphs, Seasons, Age, Mutation, and Corruption

| **Variant Layer**       | **Allowed Variation**                                                             | **Not Allowed Without New Family**                                           |
|-------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------|
| **Cosmetic**            | coat, feathers, scales, glow, pattern, scars, horn shape, regional palette        | Changing silhouette or readability so strongly that behaviour is misread.    |
| **Biological**          | sex where relevant, size range, age, health, seasonal coat, antlers, caste        | Adding unrelated locomotion, diet, intelligence, or magical school.          |
| **Regional Adaptation** | fur density, foot shape, salt tolerance, altitude lungs, camouflage, diet breadth | Ignoring plausible migration/history and spawning arbitrary biome recolours. |
| **Magical Exposure**    | bounded school effect, glow, resistance, resource, sensory change                 | Stacking random powers solely for rarity.                                    |
| **Corrupted / Undead**  | transmission, altered needs, behaviour, drops, recovery possibility               | Treating the variant as a stat multiplier with no ecological consequence.    |

# 31. Invasive Species, Overhunting, Extinction, Reintroduction, and Recovery

| **State Change**      | **Trigger**                                                                          | **Response Paths**                                                                                 |
|-----------------------|--------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------|
| **Invasion**          | portal, trade, escaped livestock, climate change, deliberate release, dungeon breach | contain, hunt, relocate, adapt farming, introduce predator, close route, accept new ecology.       |
| **Overhunting**       | high harvest, market demand, trophy pressure, automation, faction policy             | quotas, protection, breeding, alternative materials, enforcement, imports.                         |
| **Habitat Loss**      | settlement, road, mine, fire, pollution, corruption, drainage                        | corridors, restoration, reserve, relocation, coexistence structures, compensation.                 |
| **Local Extirpation** | population reaches zero in a region                                                  | natural recolonisation, hidden refuge, reintroduction, cloning/ritual only where lore supports it. |
| **Recovery**          | food, habitat, protection, disease control, restored predator balance                | population growth, migration return, settlement bonuses, renewed resources.                        |

# 32. Creature Events, Migrations, Outbreaks, Sieges, and World Transformation

| **Event Family**           | **Examples**                                                              | **Persistent Effects**                                                           |
|----------------------------|---------------------------------------------------------------------------|----------------------------------------------------------------------------------|
| **Migration**              | herd passage, spawning run, sky convoy, spirit procession, realm crossing | trampled routes, hunting camps, trade, predator movement, temporary closures.    |
| **Population Boom**        | rodents, pollinators, mana moths, reef spawn, fungal bloom                | crop pressure, resource abundance, disease, predators, settlement requests.      |
| **Predator Shift**         | apex death, rival arrival, prey collapse, winter hunger                   | new territories, livestock attacks, safer or less stable ecology.                |
| **Infestation / Outbreak** | parasites, blight beasts, machine mites, undead animals, void larvae      | quarantine, damaged storage, cleansing, altered prices, abandoned sites.         |
| **Siege / Titan Movement** | regional beast approaches settlement, mine, road, or portal               | evacuation, defence projects, changed terrain, boss hook, aftermath state.       |
| **Conservation / Return**  | rare species nesting, restored wetland, cleansed grove, reintroduced herd | new quests, tourism/trade, cultural change, resource limits, ecosystem recovery. |

# 33. Tracking, Research, Rumours, Codex Knowledge, and Competing Names

The Codex separates developer truth from observed evidence and cultural interpretation. One creature can have a registry name, scientific or guild classification, local names, faction names, mythic titles, and mistaken rumours. Players unlock certainty through tracks, observation, NPC knowledge, books, remains, behaviour, capture, magical analysis, and repeated encounters.

| **Knowledge Tier**     | **Player Information**                                                                                 |
|------------------------|--------------------------------------------------------------------------------------------------------|
| **Unknown**            | Silhouette, sound, tracks, environmental effect, or rumour only.                                       |
| **Observed**           | Habitat, activity, basic disposition, obvious attack or resource clue.                                 |
| **Studied**            | Diet, lifecycle, weaknesses, group behaviour, nest signs, harvesting methods.                          |
| **Expert**             | Population impact, seasonal movement, taming, disease, variants, cultural laws, realm relationships.   |
| **Contested / Mythic** | Multiple claims remain visible when the setting has no confirmed answer or factions dispute the truth. |

# 34. Detailed Overworld Creature Family Registry v0.1

The following 72 authored families are production foundations, not final quotas. They replace the retired POC roster and are intentionally distributed across ecological roles. Names and mechanics may be refined during Atlas, Forge, combat, and resource integration passes, but stable IDs should remain migration-safe once implementation begins.

## 34.1 Ambient Life, Pollinators, and Microfauna

| **Creature Family**   | **Stable ID**                        | **Primary Role**                     | **Habitats and System Hooks**                                                                    |
|-----------------------|--------------------------------------|--------------------------------------|--------------------------------------------------------------------------------------------------|
| **Lantern Gnat**      | creature.overworld.lantern_gnat      | Ambient pollinator swarm             | Wetlands, riverbanks, dusk meadows; glow intensity forecasts humidity and mana weather.          |
| **Threadwing Moth**   | creature.overworld.threadwing_moth   | Fibre-producing nocturnal pollinator | Forests, orchards, ruins; cocoons support cloth and tracking predators.                          |
| **Riverglass Skater** | creature.overworld.riverglass_skater | Freshwater surface insect            | Calm rivers and lakes; indicates clean water, fish presence, and subtle current changes.         |
| **Pebbleback**        | creature.overworld.pebbleback        | Tiny mineral-shelled grazer          | Rocky uplands and caves; consumes lichen and accumulates trace minerals.                         |
| **Hush Cricket**      | creature.overworld.hush_cricket      | Acoustic ambient clue                | Grasslands and ruins; sudden silence warns of predators, storms, or realm anomalies.             |
| **Ember Ant**         | creature.overworld.ember_ant         | Heat-adapted colony insect           | Geothermal and volcanic margins; farms hot fungi and gathers ash minerals.                       |
| **Skyseed Drifter**   | creature.overworld.skyseed_drifter   | Airborne seed carrier                | Highlands and skyland margins; disperses floating plants along windways.                         |
| **Grave Beetle**      | creature.overworld.grave_beetle      | Carrion decomposer                   | Battlefields, crypt edges, and wilderness carcasses; can suppress or reveal necromantic buildup. |

## 34.2 Grazers, Browsers, Herds, and Neutral Wildlife

| **Creature Family** | **Stable ID**                     | **Primary Role**                     | **Habitats and System Hooks**                                                            |
|---------------------|-----------------------------------|--------------------------------------|------------------------------------------------------------------------------------------|
| **Meadowhorn**      | creature.overworld.meadowhorn     | Medium herd grazer                   | Meadows and rolling pasture; migration supports predators, hunting, and managed grazing. |
| **Briarback Deer**  | creature.overworld.briarback_deer | Forest-edge browser                  | Broadleaf forests and thorn scrub; spreads burr seeds and damages unprotected orchards.  |
| **Stonewool Ram**   | creature.overworld.stonewool_ram  | Highland herd animal                 | Rocky uplands and alpine meadows; dense fibre, sure-footed travel, defensive charges.    |
| **Dune Sailer**     | creature.overworld.dune_sailer    | Desert migratory grazer              | Dune seas and gravel deserts; broad feet, water-storing tissue, caravan route clues.     |
| **Mire Grazer**     | creature.overworld.mire_grazer    | Wetland browser and habitat engineer | Fens and marshes; opens channels, fertilises reed beds, attracts ambush predators.       |
| **Frostmane Elk**   | creature.overworld.frostmane_elk  | Cold-region migratory herd           | Taiga, tundra, and glacial valleys; seasonal antler resource and long migration events.  |
| **Canopy Strider**  | creature.overworld.canopy_strider | Tall rainforest browser              | Rainforest and giant fernwood; feeds above ground and creates canopy-clear paths.        |
| **Cliffback Ibex**  | creature.overworld.cliffback_ibex | Cliff and karst browser              | Mountain, canyon, and tower-karst terrain; reveals safe ledges and mineral springs.      |

## 34.3 Predators, Apex Predators, and Territorial Beasts

| **Creature Family**      | **Stable ID**                           | **Primary Role**                   | **Habitats and System Hooks**                                                                  |
|--------------------------|-----------------------------------------|------------------------------------|------------------------------------------------------------------------------------------------|
| **Gloamcat**             | creature.overworld.gloamcat             | Solitary dusk ambusher             | Forest understory and ruins; stalks small prey, avoids strong light, leaves claw markers.      |
| **Silverfang Packhound** | creature.overworld.silverfang_packhound | Coordinated pack predator          | Taiga, moor, and highland; tests herd edges and retreats when morale breaks.                   |
| **Mirecoil**             | creature.overworld.mirecoil             | Aquatic ambush constrictor         | Swamps, deltas, and reed marshes; uses water cover and nest islands.                           |
| **Ridge Roc**            | creature.overworld.ridge_roc            | Large aerial territorial predator  | Mountains and skyland margins; nests on inaccessible spires and hunts cliff grazers.           |
| **Sandglass Stalker**    | creature.overworld.sandglass_stalker    | Burrowing desert predator          | Dunes and glasslands; detects vibration and exposes buried structures while hunting.           |
| **Rootmaw Bear**         | creature.overworld.rootmaw_bear         | Large omnivorous forest apex       | Ancient woods and root caverns; digs for fungi, raids stores, controls boar-like prey.         |
| **Stormclaw**            | creature.overworld.stormclaw            | Lightning-adapted plateau predator | Storm highlands and obsidian ridges; becomes active during electrical weather.                 |
| **Reed Serpent**         | creature.overworld.reed_serpent         | Wetland and river apex             | Floodplains and inland shores; controls fish and marsh grazers, threatens boats and livestock. |

## 34.4 Scavengers, Pests, Parasites, and Vermin

| **Creature Family** | **Stable ID**                      | **Primary Role**                          | **Habitats and System Hooks**                                                                   |
|---------------------|------------------------------------|-------------------------------------------|-------------------------------------------------------------------------------------------------|
| **Scrap Jackal**    | creature.overworld.scrap_jackal    | Scavenger attracted to camps and industry | Badlands, roads, and machine wilderness; steals parts and follows battles.                      |
| **Bonepicker Crow** | creature.overworld.bonepicker_crow | Intelligent non-person scavenger          | Most temperate regions; follows caravans, reveals corpses, caches shiny objects.                |
| **Crop Gnawer**     | creature.overworld.crop_gnawer     | Rapid-breeding agricultural pest          | Plains, farms, and warehouses; population booms after mild winters or predator loss.            |
| **Mana Tick**       | creature.overworld.mana_tick       | Magical parasite                          | Leyline regions, livestock, and mana-rich creatures; drains charge and spreads magical illness. |
| **Rotfly Swarm**    | creature.overworld.rotfly_swarm    | Carrion and disease pressure              | Swamps, battlefields, and blight zones; accelerates decay and signals contaminated remains.     |
| **Tunnel Snatcher** | creature.overworld.tunnel_snatcher | Burrowing thief                           | Caves, mines, cellars, and grain stores; relocates items into hidden communal caches.           |
| **Saltback Crab**   | creature.overworld.saltback_crab   | Coastal scavenger and shell resource      | Salt marshes, beaches, and tidal flats; cleans carrion and raids fish traps.                    |
| **Ash Vulture**     | creature.overworld.ash_vulture     | Volcanic and dryland scavenger            | Calderas and badlands; circles heat plumes, corpses, and active monster territories.            |

## 34.5 Livestock, Domestic Species, and Work Creatures

| **Creature Family**   | **Stable ID**                       | **Primary Role**                     | **Habitats and System Hooks**                                                            |
|-----------------------|-------------------------------------|--------------------------------------|------------------------------------------------------------------------------------------|
| **Hearthhen**         | creature.domestic.hearthhen         | Small domestic egg and meat bird     | Common settlement stock with regional breeds, pest-control behaviour, and predator risk. |
| **Woolhorn**          | creature.domestic.woolhorn          | Fibre and milk herd animal           | Cool grassland and highland breeds; social care and seasonal shearing.                   |
| **Burdenback**        | creature.domestic.burdenback        | Heavy hauling and plough animal      | Road, farm, quarry, and caravan use; slow, strong, heat-sensitive base profile.          |
| **Mossyak**           | creature.domestic.mossyak           | Cold-region pack and fibre animal    | Taiga, tundra, and mountain settlements; survives sparse forage and deep snow.           |
| **Reedrunner**        | creature.domestic.reedrunner        | Fast wetland and riverland mount     | Long-legged, light-footed, requires open water and social groups.                        |
| **Skybridle Glider**  | creature.domestic.skybridle_glider  | Short-range aerial mount and courier | Skyland and cliff cultures; launches from height and requires wind-aware handling.       |
| **Tunnel Mole**       | creature.domestic.tunnel_mole       | Mining and excavation work creature  | Underground settlements; detects soft ground, moves spoil, vulnerable to noise and gas.  |
| **Tideback Tortoise** | creature.domestic.tideback_tortoise | Coastal cargo and ferry creature     | Shallow seas and island routes; slow, durable, can carry modular platforms.              |

## 34.6 Magical, Spirit, and Leyline Fauna

| **Creature Family** | **Stable ID**                  | **Primary Role**                   | **Habitats and System Hooks**                                                            |
|---------------------|--------------------------------|------------------------------------|------------------------------------------------------------------------------------------|
| **Ley Mote**        | creature.magic.ley_mote        | Ambient mana indicator             | Forms streams along leylines and reacts to conduits, portals, and storms.                |
| **Hearth Spirit**   | creature.spirit.hearth_spirit  | Settlement place spirit            | Strengthens through care, shared meals, repair, and household memory; not an owned pet.  |
| **Raincaller Frog** | creature.magic.raincaller_frog | Weather-linked amphibian           | Wetlands and monsoon forests; chorus predicts rain and can amplify ritual weather.       |
| **Moonhare**        | creature.magic.moonhare        | Night-active illusion-adapted prey | Meadows, moors, and dream-touched zones; leaves misleading tracks and lunar reagents.    |
| **Rune Antler**     | creature.magic.rune_antler     | Mana-adapted forest grazer         | Old forests and rune ruins; shed antlers carry natural glyph patterns.                   |
| **Mirrorfish**      | creature.magic.mirrorfish      | Memory-reflecting freshwater fish  | Clear lakes and spirit springs; schools echo nearby images and emotional residue.        |
| **Whisperwing**     | creature.spirit.whisperwing    | Messenger-like spirit bird         | Roads, shrines, graves, and settlements; repeats fragments of names and warnings.        |
| **Orchard Warden**  | creature.spirit.orchard_warden | Managed grove spirit-beast         | Cultivated orchards and sacred groves; deters pests when local stewardship is respected. |

## 34.7 Undead, Corrupted, Void, and Realm-Leak Creatures

| **Creature Family** | **Stable ID**                    | **Primary Role**                   | **Habitats and System Hooks**                                                                 |
|---------------------|----------------------------------|------------------------------------|-----------------------------------------------------------------------------------------------|
| **Hollow Walker**   | creature.undead.hollow_walker    | Mindless reanimated traveller      | Roads, battlefields, and abandoned settlements; carries historical evidence and disease risk. |
| **Grave Root**      | creature.undead.grave_root       | Necromantic plant-animal colony    | Cemeteries and battlefield soil; binds remains, spreads through disturbed burial layers.      |
| **Blight Hound**    | creature.corruption.blight_hound | Corrupted pack predator            | Blightwoods and abandoned farms; spreads spores through wounds and carcasses.                 |
| **Canker Swarm**    | creature.corruption.canker_swarm | Small destructive blight organisms | Crops, timber, and living structures; requires source cleansing and habitat recovery.         |
| **Lantern Wraith**  | creature.undead.lantern_wraith   | Predatory memory-light spirit      | Ruins, roads, and mist; imitates safe lights and feeds on fear or lost identity.              |
| **Rift Leech**      | creature.void.rift_leech         | Portal and mana parasite           | Realm leaks, gates, and conduits; drains stability and can hitchhike between worlds.          |
| **Ashbone Herd**    | creature.infernal.ashbone_herd   | Infernal-altered ungulate pack     | Volcanic and breach zones; consumes charcoal and leaves heat-reactive bone.                   |
| **Nullwing**        | creature.void.nullwing           | Small aerial absence feeder        | Void-thin skies and portal graveyards; suppresses sound and weakens magical navigation.       |

## 34.8 Marine, Aerial, Subterranean, and Extreme-Environment Families

| **Creature Family**  | **Stable ID**                          | **Primary Role**                         | **Habitats and System Hooks**                                                                  |
|----------------------|----------------------------------------|------------------------------------------|------------------------------------------------------------------------------------------------|
| **Kelpback**         | creature.marine.kelpback               | Large coastal grazer and habitat carrier | Kelp forests and shallow seas; supports fish nurseries and can be managed by coastal cultures. |
| **Reefjaw**          | creature.marine.reefjaw                | Coral-reef ambush predator               | Warm reefs and submerged ruins; defends caves and controls grazing schools.                    |
| **Cloudray**         | creature.aerial.cloudray               | Large filter-feeding sky creature        | Cloud seas and humid skylands; follows airborne plankton and predictable windways.             |
| **Windlace Swarm**   | creature.aerial.windlace_swarm         | Small aerial decomposer and pollinator   | Cliffs and floating meadows; reacts to storms and airship wakes.                               |
| **Cavern Weaver**    | creature.subterranean.cavern_weaver    | Web-building cave predator               | Limestone, root, and deep caves; webs alter routes and capture ambient fauna.                  |
| **Crystal Burrower** | creature.subterranean.crystal_burrower | Mineral-feeding tunneller                | Crystal caverns and mana pockets; exposes deposits but destabilises walls.                     |
| **Magma Shell**      | creature.volcanic.magma_shell          | Heat-armoured volcanic grazer            | Lavafield margins and forge depths; consumes mineral crust and sheds refractory plates.        |
| **Deepfin**          | creature.subterranean.deepfin          | Subterranean river predator              | Underground rivers and blackwater lakes; senses vibration and guards spawning pools.           |

## 34.9 Constructs, Golems, and Created Ecology

| **Creature Family**   | **Stable ID**                        | **Primary Role**                        | **Habitats and System Hooks**                                                                    |
|-----------------------|--------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------|
| **Hauler Golem**      | creature.construct.hauler_golem      | Programmable transport construct        | Settlement and industrial labour; ownership, maintenance, zones, and overload rules.             |
| **Ward Hound**        | creature.construct.ward_hound        | Patrol and anomaly-detection construct  | Villages, gates, and mage sites; tracks corruption, spirits, and unauthorised mana.              |
| **Orchard Automaton** | creature.construct.orchard_automaton | Agricultural maintenance construct      | Prunes, carries, scares pests, and can damage ecosystems when misconfigured.                     |
| **Archive Mite**      | creature.construct.archive_mite      | Tiny preservation and indexing machine  | Libraries and vaults; repairs pages but may reorganise or consume unregistered material.         |
| **Gearwing**          | creature.construct.gearwing          | Courier and inspection flyer            | Factories, roads, and towers; carries messages and reports faults.                               |
| **Quarry Crawler**    | creature.construct.quarry_crawler    | Excavation and hauling machine creature | Mines and construction; creates noise, dust, maintenance demand, and raid value.                 |
| **Bridge Sentinel**   | creature.construct.bridge_sentinel   | Infrastructure guardian                 | Bridges, tunnels, and route gates; uses ownership and challenge protocols.                       |
| **Runic Custodian**   | creature.construct.runic_custodian   | Magic-site maintenance construct        | Rune ruins, shrines, and portals; can be dormant, damaged, hostile by obsolete law, or awakened. |

# 35. Detailed Realm Creature Family Registry v0.1

Each realm receives five foundational creature families in this draft. These are not the final ecological ceiling. They establish law-specific silhouettes, resources, settlement relationships, dungeon fauna, and progression hooks for later expansion toward the realm completeness target.

## 35.1 Verdant Covenant

| **Creature Family**   | **Stable ID**                            | **Primary Role**                 | **Realm Ecology and System Hooks**                                                         |
|-----------------------|------------------------------------------|----------------------------------|--------------------------------------------------------------------------------------------|
| **Oathstag**          | creature.realm.verdant.oathstag          | Large court-linked grazer        | Antlers change with honoured promises; migration routes respond to seasonal law.           |
| **Pollen Drake**      | creature.realm.verdant.pollen_drake      | Small flying pollinator-predator | Carries living pollen between canopy biomes and defends bloom territories.                 |
| **Seasonal Fox**      | creature.realm.verdant.seasonal_fox      | Adaptive mesopredator            | Body, diet, and magic shift with the active season without becoming random powers.         |
| **Thornbound Hunter** | creature.realm.verdant.thornbound_hunter | Living-terrain apex predator     | Moves through thorn corridors and targets oathbreakers or blight depending on court state. |
| **Rotcap Colony**     | creature.realm.verdant.rotcap_colony     | Decomposer fungal collective     | Recycles dead living structures; can become blight or restoration partner.                 |

## 35.2 Ancestral Veil

| **Creature Family**  | **Stable ID**                             | **Primary Role**              | **Realm Ecology and System Hooks**                                                     |
|----------------------|-------------------------------------------|-------------------------------|----------------------------------------------------------------------------------------|
| **Namekeeper Crane** | creature.realm.ancestral.namekeeper_crane | Memory-preserving spirit bird | Repeats true names near processional waters and guides respectful travellers.          |
| **Memory Moth**      | creature.realm.ancestral.memory_moth      | Ambient memory pollinator     | Feeds on discarded recollections and deposits fragments in archive flowers.            |
| **Procession Hound** | creature.realm.ancestral.procession_hound | Route guardian spirit         | Protects funeral roads and becomes hostile to desecration, not ancestry.               |
| **Mourning Eel**     | creature.realm.ancestral.mourning_eel     | Canal scavenger spirit        | Consumes grief residue and can either calm or empty communities when overabundant.     |
| **Remnant Eater**    | creature.realm.ancestral.remnant_eater    | Predatory identity parasite   | Consumes unanchored memories and threatens archives, ghosts, and returning travellers. |

## 35.3 Somnolent Expanse

| **Creature Family**   | **Stable ID**                          | **Primary Role**               | **Realm Ecology and System Hooks**                                                           |
|-----------------------|----------------------------------------|--------------------------------|----------------------------------------------------------------------------------------------|
| **Lucid Manta**       | creature.realm.dream.lucid_manta       | Large peaceful dream navigator | Travels predictable thought-currents and provides safe passage while lucidity is maintained. |
| **Fearling**          | creature.realm.dream.fearling          | Small emotion-feeding nuisance | Grows around repeated fear and can aggregate into larger nightmare forms.                    |
| **Pillow Moss Beast** | creature.realm.dream.pillow_moss_beast | Dormant ambush grazer          | Appears as terrain until disturbed; feeds on sleep and dream vegetation.                     |
| **Dream Grazer**      | creature.realm.dream.dream_grazer      | Memory-meadow herd animal      | Consumes recurring dream plants and carries symbolic resources into waking portals.          |
| **Waking Devourer**   | creature.realm.dream.waking_devourer   | Apex boundary predator         | Targets unstable sleepers and collapsing dream routes; regional boss ecology hook.           |

## 35.4 Aetheric Reach

| **Creature Family** | **Stable ID**                          | **Primary Role**                       | **Realm Ecology and System Hooks**                                        |
|---------------------|----------------------------------------|----------------------------------------|---------------------------------------------------------------------------|
| **Cloudwhale**      | creature.realm.aetheric.cloudwhale     | Massive filter-feeding migratory fauna | Shapes cloud plankton, wind routes, and sky settlements during migration. |
| **Storm Roc**       | creature.realm.aetheric.storm_roc      | Aerial apex predator                   | Nests in thunderheads, hunts sky grazers, and affects storm corridors.    |
| **Windlace Swarm**  | creature.realm.aetheric.windlace_swarm | Aerial pollinator and decomposer       | Feeds on cloud bloom and airship residue; indicates safe pressure bands.  |
| **Skyback Grazer**  | creature.realm.aetheric.skyback_grazer | Floating-island herd animal            | Grazes levitating moss and migrates by controlled falls and updrafts.     |
| **Static Serpent**  | creature.realm.aetheric.static_serpent | Electrical current predator            | Travels conductive windways and threatens exposed power networks.         |

## 35.5 Impossible Deep

| **Creature Family**    | **Stable ID**                          | **Primary Role**                      | **Realm Ecology and System Hooks**                                                 |
|------------------------|----------------------------------------|---------------------------------------|------------------------------------------------------------------------------------|
| **Pressure Crab**      | creature.realm.deep.pressure_crab      | Armoured scavenger                    | Lives near vents and pressure vaults; shell stores compression-resistant material. |
| **Coreworm**           | creature.realm.deep.coreworm           | Massive tunnelling ecosystem engineer | Creates deep routes, ore exposure, seismic risk, and boss-scale territories.       |
| **Fossil Grazer**      | creature.realm.deep.fossil_grazer      | Mineral and lichen browser            | Feeds across fossil cities and spreads dormant micro-ecologies.                    |
| **Blackwater Lantern** | creature.realm.deep.blackwater_lantern | Bioluminescent ambush organism        | Uses false route lights in subterranean seas and pressure trenches.                |
| **Seismic Caller**     | creature.realm.deep.seismic_caller     | Vibration-based territorial beast     | Communicates through stone and can trigger controlled or catastrophic shifts.      |

## 35.6 World-Engine

| **Creature Family** | **Stable ID**                        | **Primary Role**                        | **Realm Ecology and System Hooks**                                                       |
|---------------------|--------------------------------------|-----------------------------------------|------------------------------------------------------------------------------------------|
| **Gearling**        | creature.realm.engine.gearling       | Small assembly-maintenance machine life | Repairs compatible mechanisms and dismantles unregistered foreign objects.               |
| **Coolant Eel**     | creature.realm.engine.coolant_eel    | Pipe-network fluid organism             | Regulates temperature, carries contamination, and migrates through machine channels.     |
| **Archive Scarab**  | creature.realm.engine.archive_scarab | Data-preservation construct fauna       | Copies, indexes, and sometimes corrupts mechanical records.                              |
| **Assembly Hound**  | creature.realm.engine.assembly_hound | Patrol and retrieval construct          | Tracks missing components and obsolete ownership signatures.                             |
| **Fault Wraith**    | creature.realm.engine.fault_wraith   | Emergent error-entity                   | Lives in contradictory instructions and can spread malfunction across connected sectors. |

## 35.7 Ashen Lower Realms

| **Creature Family** | **Stable ID**                       | **Primary Role**                   | **Realm Ecology and System Hooks**                                                  |
|---------------------|-------------------------------------|------------------------------------|-------------------------------------------------------------------------------------|
| **Ember Imp**       | creature.realm.ashen.ember_imp      | Small heat-feeding nuisance        | Steals fuel, nests in furnaces, and can be bargained with by local cultures.        |
| **Contract Hound**  | creature.realm.ashen.contract_hound | Law-bound tracker                  | Pursues marked debt or oath targets; behaviour changes when contracts are voided.   |
| **Cinder Ram**      | creature.realm.ashen.cinder_ram     | Ashland grazer and mount candidate | Consumes charcoal scrub and sheds heat-resistant wool or plates.                    |
| **Furnace Wyrm**    | creature.realm.ashen.furnace_wyrm   | Industrial heat apex               | Nests in foundries and volcanic vents, affecting regional production and fire risk. |
| **Ashwing**         | creature.realm.ashen.ashwing        | Smoke and carrion scavenger        | Follows battles, eruptions, and contract executions; spreads ash seeds.             |

## 35.8 Void Between

| **Creature Family** | **Stable ID**                    | **Primary Role**               | **Realm Ecology and System Hooks**                                          |
|---------------------|----------------------------------|--------------------------------|-----------------------------------------------------------------------------|
| **Rift Leech**      | creature.realm.void.rift_leech   | Spatial-stability parasite     | Attaches to gates, travellers, and containers; drains route anchors.        |
| **Echo Stalker**    | creature.realm.void.echo_stalker | Sound-copying ambush predator  | Replays movement and voice fragments to lure travellers across unsafe gaps. |
| **Null Jelly**      | creature.realm.void.null_jelly   | Drifting absence filter-feeder | Consumes stray energy and creates temporary quiet zones.                    |
| **Gravity Ray**     | creature.realm.void.gravity_ray  | Large migratory spatial fauna  | Moves between gravity wells and changes local navigation fields.            |
| **Void Maw**        | creature.realm.void.void_maw     | Apex rupture organism          | Feeds on unstable routes and can collapse or redirect realm connections.    |

## 35.9 Divine Concords

| **Creature Family** | **Stable ID**                        | **Primary Role**               | **Realm Ecology and System Hooks**                                                 |
|---------------------|--------------------------------------|--------------------------------|------------------------------------------------------------------------------------|
| **Petition Dove**   | creature.realm.divine.petition_dove  | Message-bearing sacred fauna   | Carries petitions, witnesses sanctuary, and nests near threshold courts.           |
| **Mercy Hart**      | creature.realm.divine.mercy_hart     | Sanctuary-linked grazer        | Calms aggression within protected valleys and responds to broken refuge law.       |
| **Law Lion**        | creature.realm.divine.law_lion       | Territorial principle guardian | Enforces one declared law within its territory; not universally hostile.           |
| **Halo Moth**       | creature.realm.divine.halo_moth      | Radiant pollinator             | Feeds on blessings and distributes minor restorative residue.                      |
| **Edict Sentinel**  | creature.realm.divine.edict_sentinel | Construct-like law guardian    | Challenges entrants through rule tests and requires personhood review if awakened. |

## 35.10 Necropolis Domains

| **Creature Family**    | **Stable ID**                                | **Primary Role**                 | **Realm Ecology and System Hooks**                                                               |
|------------------------|----------------------------------------------|----------------------------------|--------------------------------------------------------------------------------------------------|
| **Pale Ox**            | creature.realm.necropolis.pale_ox            | Undead agricultural work animal  | Labours without ordinary feed but requires maintenance, legal ownership, and soul-safe practice. |
| **Soul Lantern Moth**  | creature.realm.necropolis.soul_lantern_moth  | Spirit-energy pollinator         | Feeds on lantern overflow and signals containment failure.                                       |
| **Mortuary Crocodile** | creature.realm.necropolis.mortuary_crocodile | Canal apex scavenger             | Guards body routes and consumes dangerous remains.                                               |
| **Bonework Spider**    | creature.realm.necropolis.bonework_spider    | Constructive colony organism     | Builds bone lattice, repairs crypts, and can infest living districts.                            |
| **Gravewind Steed**    | creature.realm.necropolis.gravewind_steed    | Fast route mount and spirit herd | Travels mortuary plains and requires ritual handling rather than normal feed.                    |

## 35.11 Elemental Confluences

| **Creature Family**      | **Stable ID**                                 | **Primary Role**           | **Realm Ecology and System Hooks**                                 |
|--------------------------|-----------------------------------------------|----------------------------|--------------------------------------------------------------------|
| **Steam Bulb Frog**      | creature.realm.elemental.steam_bulb_frog      | Pressure-wetland amphibian | Stores steam and predicts vent eruptions.                          |
| **Stormglass Scarab**    | creature.realm.elemental.stormglass_scarab    | Charged desert scavenger   | Builds glass shells from lightning-struck sand.                    |
| **Thunderroot Ape**      | creature.realm.elemental.thunderroot_ape      | Forest canopy engineer     | Redirects charge through trees and defends storm fruit groves.     |
| **Frostfire Salamander** | creature.realm.elemental.frostfire_salamander | Dual-temperature predator  | Alternates cold flame and hot ice metabolism across shelf biomes.  |
| **Flowstone Tortoise**   | creature.realm.elemental.flowstone_tortoise   | Slow geological grazer     | Channels semi-fluid stone and forms temporary islands and bridges. |

## 35.12 Created Pockets

| **Creature Family**     | **Stable ID**                             | **Primary Role**                            | **Realm Ecology and System Hooks**                                                   |
|-------------------------|-------------------------------------------|---------------------------------------------|--------------------------------------------------------------------------------------|
| **Prototype Chimera**   | creature.realm.pocket.prototype_chimera   | Escaped experimental organism               | Traits are authored per laboratory history; unstable breeding and containment hooks. |
| **Vault Guardian**      | creature.realm.pocket.vault_guardian      | Security construct                          | Protects assets using pocket-specific access law and configurable threat response.   |
| **Garden Custodian**    | creature.realm.pocket.garden_custodian    | Habitat maintenance organism                | Prunes, pollinates, recycles, and may attack species marked invasive.                |
| **Arena Echo Beast**    | creature.realm.pocket.arena_echo_beast    | Repeatable trial organism                   | Reconstructs bounded challenge patterns without implying infinite wild populations.  |
| **Escaped Farm Strain** | creature.realm.pocket.escaped_farm_strain | High-yield domestic variant turned invasive | Creates food opportunity, disease, genetic contamination, and ownership disputes.    |

# 36. Dungeon Ecology Modules and Boss Ecology Hooks

## 36.1 Dungeon ecology modules

| **Module**                          | **Ecology Identity**                                                                                              | **Compatible Site Families**                     |
|-------------------------------------|-------------------------------------------------------------------------------------------------------------------|--------------------------------------------------|
| **Root-Nest Labyrinth**             | Living roots, burrowing grazers, ambush predators, fungal recyclers, and a protected brood chamber.               | forest, Verdant, ancient grove, living structure |
| **Webbed Vertical Colony**          | Ceiling and wall hunters, captured prey caches, silk routes, vibration alarms, and queen/core alternatives.       | caves, ruins, canyons, deep realm                |
| **Flooded Ruin Food Web**           | Fish, scavengers, amphibious hunters, drowned undead, water quality, and air-pocket refuges.                      | rivers, coasts, underground water, Ancestral     |
| **Fungal Bloom Complex**            | Spore grazers, decomposers, symbiotic insects, hallucination zones, and a spreading substrate.                    | underground, swamp, blight, dream                |
| **Crypt Scavenger Chain**           | Grave beetles, bonework organisms, corpse-eaters, spirits, and reanimation sources.                               | crypts, battlefields, Necropolis                 |
| **Machine Infestation**             | Archive mites, coolant fauna, cable nests, scavenger constructs, and fault entities.                              | factories, World-Engine, machine wilderness      |
| **Realm-Breach Ecology**            | Hitchhikers, unstable adapted forms, native defenders, resource parasites, and route contamination.               | portals, void-thin zones, cross-realm sites      |
| **Predator Den Network**            | Kill sites, scent routes, juveniles, scavengers, rival predators, and seasonal occupancy.                         | surface lairs, caves, ruins                      |
| **Herd Sanctuary / Calving Ground** | Defensive adults, juveniles, predators, poachers, sacred law, and resource restrictions.                          | plains, tundra, sky islands                      |
| **Elemental Source Colony**         | Source-fed minor elementals, material grazers, stabilisers, and an overloaded core.                               | volcanic, storm, geothermal, Elemental           |
| **Dream Nest**                      | Fearlings, symbolic prey, lucid guardians, repeated rooms, and waking-state changes.                              | Somnolent, dream leaks, haunted inns             |
| **Spirit Procession Site**          | Namekeepers, memory moths, mourners, hostile remnant eaters, and respect-based access.                            | Ancestral, graves, roads, drowned ruins          |
| **Cult Menagerie**                  | Captured or bred creatures, handlers, feed logistics, escape routes, and ethical resolution.                      | faction forts, laboratories, arenas              |
| **Abandoned Husbandry Complex**     | Feral domestic stock, disease, automated feeders, predators, ownership records, and rescue paths.                 | farms, pockets, ruined settlements               |
| **Titan Carcass Biome**             | Scavenger succession, parasites, rare tissues, faction camps, necromantic risk, and slow terrain change.          | boss aftermath, bonefields, coasts, deserts      |
| **Quarantine Vault**                | Contained invasive species, failed seals, research notes, treatment resources, and multiple containment outcomes. | laboratories, portals, cities, Created Pockets   |

## 36.2 Boss ecology hooks for 24H

| **Boss Ecology Hook**       | **Primary Territory**               | **Required World-State Relationship**                                                                                     |
|-----------------------------|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| **Root-Crowned Behemoth**   | Ancient Oakwood / worldroot         | Grazing and root movement shape forest clearings; defeat, binding, or relocation changes regrowth and predator balance.   |
| **Thunderhorn Matriarch**   | Savanna / storm grassland           | Leads continental herd migrations and charges storm fields; outcome changes routes, crops, and predator movement.         |
| **Glassjaw Colossus**       | Mesa badlands / glasslands          | Consumes silica and buried metal, creating tunnels and glass scars; can expose or destroy ancient sites.                  |
| **Pale Glacier Worm**       | Glacial valley / icefield           | Moves beneath ice, controls melt channels, and threatens settlements as climate changes.                                  |
| **Mire Sovereign**          | Cypress swamp / delta               | Maintains wetland channels while preying on large fauna; killing it may dry or overgrow the marsh.                        |
| **Stormglass Wyvern**       | Obsidian ridge / lightning province | Nests on charged glass and alters storm frequency, power infrastructure, and aerial routes.                               |
| **Crown Reef Leviathan**    | Coral reef / submerged ruins        | Protects reef structure but destroys vessels and harvest sites; resolution affects marine biodiversity.                   |
| **Tidebreaker**             | Open ocean / island chain           | Migratory sea titan whose path changes storms, fisheries, and navigation.                                                 |
| **Tempest Roc**             | Skylands / Aetheric leak            | Controls aerial predator territories and floating-island migration corridors.                                             |
| **Worldburrower**           | Deepstone / buried city             | Creates tunnels and collapses while exposing rare deposits and sealed civilisations.                                      |
| **Ironwood Titan**          | Machine wilderness / ancient forest | Hybrid construct-organism that recycles ruins into living machinery and changes local resource networks.                  |
| **Bannerless Host**         | Haunted battlefield                 | Collective undead event sustained by unresolved history; can be defeated, remembered, reconciled, or redirected.          |
| **Seasonal Regent**         | Verdant Covenant                    | Realm sovereign ecology tied to season and court law; outcome changes migration, growth, and blight.                      |
| **Memory Eater**            | Ancestral Veil                      | Predates unanchored identity; resolution changes archive safety and recovery of lost history.                             |
| **Nightmare Architect**     | Somnolent Expanse                   | Builds habitats from collective fear; outcome changes sleep safety and dream routes.                                      |
| **Tempest Leviathan**       | Aetheric Reach                      | World-scale storm migrator; outcome changes windways, sky trade, and floating settlements.                                |
| **Pressure Titan**          | Impossible Deep                     | Stabilises or destabilises deep pressure fields; outcome changes tunnels, forges, and settlements.                        |
| **Central Fault Sovereign** | World-Engine                        | Emergent machine ecology ruler; outcome changes sector logic, maintenance fauna, and automation access.                   |
| **Furnace Wyrm Prime**      | Ashen Lower Realms                  | Controls heat ecology and industrial fuel; outcome changes foundries and infernal factions.                               |
| **Void Maw**                | Void Between                        | Consumes unstable routes; outcome changes portal network topology and invasive pressure.                                  |
| **Law Lion Ascendant**      | Divine Concords                     | Embodies one law whose enforcement reshapes sanctuary ecology and civilisation.                                           |
| **Reservoir Sovereign**     | Necropolis Domains                  | Controls soul-energy ecology; outcome changes undead labour, identity safety, and spirit migration.                       |
| **Confluence Colossus**     | Elemental Confluences               | Maintains or disrupts balance among competing elements and regional climate.                                              |
| **Runaway Prototype Prime** | Created Pockets                     | Escaped apex experiment whose traits reflect pocket history; outcome determines containment, rights, and invasive spread. |

# 37. Content Completeness Contracts and Production Budgets

| **Content Package**            | **Minimum Relationship Contract**                                                                                                                                                                                                         |
|--------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Major Surface Biome Family** | 6-12 ordinary creature families; 2-4 magical/unusual families; 1 predator chain; 1 pest/scavenger layer; 2 lair modules; 1 seasonal or migration event; 1 regional threat hook; explicit exclusions.                                      |
| **Ocean / Coast Family**       | Ambient school or swarm; grazer/filter feeder; predator; scavenger; breeding site; fisheries/aquaculture relationship; boat/diving threat; pollution response; boss hook.                                                                 |
| **Skyland Family**             | Airborne ambient life; herbivore/filter feeder; aerial predator; nesting rule; wind/storm response; route hazard; mount or transport relationship; boss hook.                                                                             |
| **Underground Family**         | Low-cost ambient life; decomposer; mineral/fungal consumer; predator; nest/colony; mining/noise response; light response; dungeon module; deep threat hook.                                                                               |
| **Major Realm**                | 5 foundation families in this v0.1; target 12-25 over production; 3 dungeon modules; 1 regional threat; 1 cross-realm invasive issue; 2 civilisation relationships.                                                                       |
| **Settlement Culture**         | At least one livestock/work relationship, one protected/sacred species, one feared or regulated threat, one pest issue, one trade or craft resource, and one conservation or hunting law.                                                 |
| **Creature Family**            | Identity, stable ID, class, personhood, role, habitats, diet/input, lifecycle, social pattern, senses, activity, threats, resources, variants, nests, settlement links, magic/realm links, simulation profile, presentation requirements. |

# 38. Presentation, Forge, Animation, Audio, VFX, and Readability Requirements

| **Presentation Layer**   | **Required Atlas Data**                                                                                                              |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| **Silhouette**           | body plan, size band, locomotion, stance, horns/wings/tail, group readability, threat readability.                                   |
| **Model Family**         | shared skeleton or unique rig, modular parts, juvenile/elder needs, damage states, equipment sockets, harvest/remains model.         |
| **Animation**            | idle, move, sprint/flee, feed, rest, social, threat, attack, hit, death/dissipation, work, mount, tame, nest, special law behaviour. |
| **Audio**                | call language, footsteps, wing/water/burrow sound, warning, group communication, nest ambience, accessibility channel.               |
| **VFX**                  | mana, spirit, elemental, corruption, void, weather, disease, scent/tracking, telegraph, non-colour cue.                              |
| **Environment Evidence** | tracks, scat, shed material, scratch, nest, kill site, disturbed plants, glow, soundscape, damaged structures.                       |
| **UI / Codex**           | map symbol, threat icon, knowledge tier, ownership, health/welfare, status, family relationship, habitat, legal restrictions.        |

# 39. Simulation LOD, Persistence, Multiplayer, and Save Safety

| **Simulation Band**      | **Creature Behaviour**                                                                                                                      |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| **Active Local**         | Full actors, navigation, senses, combat, animation, group tactics, inventory, care, mounts, nests, and physics as budget allows.            |
| **Active Regional**      | Reduced agents, simplified movement, group tasks, scheduled migration, hunting, breeding, settlement interactions, and encounter promotion. |
| **Distant Region**       | Population totals, age bands, nest counts, carrying capacity, pressure, migration intent, disease, notable identities, and event rolls.     |
| **Inactive Realm**       | Bounded regional ecology summaries, route exchange, invasion, major event, boss pressure, and deterministic elapsed-time reconciliation.    |
| **Promotion / Demotion** | Preserve persistent individuals, ownership, bond, injury, variants, inventory, nest state, population conservation, and recent history.     |

- Multiplayer uses authoritative ownership, taming, damage, harvesting, breeding, trading, nest clearing, conservation, and creature-state transactions.

- Persistent companions, named rare creatures, bosses, managed herds, owned livestock, awakened constructs, and quest-bound beings use durable entity IDs.

- Population reconciliation must be bounded to prevent unloaded areas from generating impossible exponential growth, total collapse, or duplicate rewards.

# 40. Data Models, Registries, Validation, Seed Testing, and Production Gates

| **Registry / Record**           | **Core Responsibility**                                                                                                                    |
|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| **CreatureFamilyDefinition**    | Immutable identity, class, parent, tags, personhood, habitats, diet, lifecycle, senses, AI profile, resources, variants, asset references. |
| **PopulationRecord**            | Region, family, count bands, age structure, health, carrying capacity, trend, nests, migration, disease, source seed, history.             |
| **PersistentCreatureRecord**    | Stable entity ID, family, variant, age, sex where relevant, name, owner, bond, training, health, equipment, inventory, location, history.  |
| **NestSiteRecord**              | Site ID, family, type, capacity, occupants, brood, resources, danger, state, ownership, discovery, last event.                             |
| **EcologyPackageDefinition**    | Compatible families, relationships, habitat slots, population ratios, event hooks, exclusions, fallback rules.                             |
| **CreatureEncounterDefinition** | Intent, source, group composition, activity, difficulty, environment, warnings, aftermath, multiplayer authority.                          |
| **TamingProfile**               | Eligibility, trust actions, care, commands, roles, welfare, breeding, equipment, transfer, release.                                        |
| **CreatureResourceProfile**     | Harvest method, outputs, quality, renewability, ethics/law, spoilage, processing, ecology cost, registry links.                            |

## 40.1 Required automated validation

- Every creature stable ID is unique, namespaced, and resolves all parent, habitat, AI, resource, asset, event, and realm references.

- No production definition references POC-only IDs, Forest Hamlet locations, Briarhook raid state, or POC Required planning tags.

- Recognised-person definitions cannot use livestock, taming, ownership, butchery, or non-person harvesting profiles.

- Every major biome and realm meets its ecology completeness contract or declares an approved intentional absence.

- Every predator has food or an alternate energy source; every breeding population has habitat and lifecycle support; every drop has a valid use or is removed.

- Seed tests detect impossible populations, incompatible habitats, missing progression resources, repeated rare families, overcrowded start regions, and unsafe portal arrivals.

- Save migration tests preserve persistent creatures, ownership, bonds, population conservation, nests, and boss aftermath across registry versions.

# 41. Balancing, Representation, Accessibility, and Player-Freedom Rules

- Peaceful and low-threat modes must retain ecology, observation, husbandry, migration, resources, Codex discovery, and world events without forced combat.

- No real-world-inspired people or ancestry is coded as a monster, vermin, livestock, primitive, biologically evil, or naturally suited to enslavement.

- Creature telegraphs use silhouette, movement, sound, animation, UI, controller feedback, and effects rather than colour alone.

- Taming and livestock systems should reward care and planning without requiring constant repetitive chores on default settings.

- Rare resources must not force extinction, cruelty, or one moral path when renewable, trade, synthetic, ritual, salvage, or alternative-material routes can support player freedom.

- Predators and pests should create problems with multiple solutions: deterrence, fencing, habitat management, guards, relocation, trade, ritual, conservation, hunting, or acceptance.

- Bosses and major creatures should support more than killing where lore allows: cleanse, seal, relocate, bargain, tame, bind, protect, restore, or coexist.

# 42. Cross-Document Update Plan

| **Document**                                         | **Required Revision**                                                                                                                                  |
|------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| **00 Master Bible**                                  | Replace POC creature examples with general post-POC ecology and procedural-threat language.                                                            |
| **01 Core Gameplay Loop**                            | Remove fixed goblin-raid and Forest Hamlet assumptions; use seed-derived settlement threats, ecological events, and regional bosses.                   |
| **03 Blocks / 04 Items / 05 Recipes / 06 Resources** | Add creature habitat blocks, nest forms, husbandry objects, remains, resources, sustainable harvesting, realm fauna materials, and migration-safe IDs. |
| **07 NPC Village System**                            | Replace fixed villagers and raid with culture-specific livestock, pest, conservation, hunting, guard-animal, and threat relationships.                 |
| **08 Automation**                                    | Add husbandry automation, humane deterrents, sensors, wildlife corridors, machine infestations, noise/pollution attraction, and construct ecology.     |
| **09 Magic**                                         | Expand spirit, elemental, familiar, binding, corruption, realm fauna, cleansing, transformation, and personhood safeguards.                            |
| **10 Creatures and Monsters**                        | Supersede POC scope and registry with 24F terminology, ecology graph, production registries, personhood boundary, and completeness contracts.          |
| **11 Biomes / 12 Structures**                        | Replace fixed POC spawn lists with ecology slots, nests, migration corridors, lair modules, dungeon ecology, and boss territories.                     |
| **13 Peoples / 24E**                                 | Cross-reference cultural husbandry, sacred species, hunting law, conservation, monster factions, personhood, and construct rights.                     |
| **14 Dimensions / 24D**                              | Attach realm fauna packages, invasive rules, realm-law biology, dungeon ecology, and boss aftermath.                                                   |
| **15 Quests / Events**                               | Add migration, conservation, outbreak, poaching, rescue, infestation, reintroduction, boss ecology, and settlement-animal event templates.             |
| **16 Combat / Gear / Defence**                       | Add creature role counters, non-lethal tools, capture limits, guard specialisation, siege fauna, harvesting quality, and accessibility telegraphs.     |
| **18 Technical Plan**                                | Replace outdated engine assumptions with Godot/Summer Engine registries, AI LOD, population records, deterministic encounters, and save migration.     |
| **24G / 24H / 24J / 24K / 24L**                      | Consume dungeon ecology modules, boss hooks, creature resources, history/events, production budgets, and validation contracts.                         |

# 43. Open Questions

- Which of the 72 Overworld and 60 realm foundations are Core Production, Early Access, Later Expansion, or concept reserve?

- How strong should default ecological feedback be for predator removal, crop pests, disease, overhunting, and habitat destruction?

- Should global extinction be possible in normal worlds, or only local extirpation unless a high-consequence setting is enabled?

- Which domestic species are shared widely and which are culture-exclusive breeds, realm imports, or protected trade monopolies?

- How much individual persistence should ordinary wild animals receive before promotion to named, bonded, rare, quest, or notable status?

- Which magical, spirit, undead, construct, hive, and dream beings require explicit personhood decisions before implementation?

- What maximum active creature, flock, swarm, school, herd, nest, and population budgets are appropriate for target hardware?

- Which boss ecology hooks should be promoted into the first full 24H production registry?

# Appendix A. Creature Family Definition Template

| **Field**                    | **Definition**                                                                                       |
|------------------------------|------------------------------------------------------------------------------------------------------|
| **Stable ID**                | Namespaced immutable identifier.                                                                     |
| **Display Names**            | Developer truth name, local names, titles, plural, juvenile, group term.                             |
| **Parent / Family**          | Inheritance parent, body plan, rig family, related variants.                                         |
| **Being Class / Personhood** | Animal, spirit, elemental, undead, construct, etc.; personhood state and review.                     |
| **Ecological Role**          | Diet/input, trophic role, competition, predation, symbiosis, habitat engineering.                    |
| **Habitats**                 | Realm, region, biome, sub-biome, microhabitat, climate, terrain, water, altitude, depth, exclusions. |
| **Lifecycle**                | Stages, reproduction, season, growth, dormancy, migration, death/remains.                            |
| **Behaviour**                | Activity, social pattern, senses, motivations, morale, communication, terrain use, AI profile.       |
| **World Connections**        | Settlements, factions, farms, roads, machines, magic, dungeons, bosses, events, quests.              |
| **Resources**                | Non-lethal outputs, harvesting, salvage, quality, legality, renewability, processing, ecology cost.  |
| **Taming / Ownership**       | Eligibility, trust, training, care, roles, breeding, welfare, transfer, release.                     |
| **Variants**                 | Cosmetic, age, regional, seasonal, magical, corrupted, undead, authored limits.                      |
| **Presentation**             | Scale, silhouette, model, rig, animations, sockets, audio, VFX, tracks, Codex, accessibility cues.   |
| **Simulation**               | Threat, group size, population profile, nest, LOD, persistence, multiplayer authority.               |
| **Production**               | Status, dependencies, owner, test seeds, acceptance criteria, migration notes.                       |

# Appendix B. Population and Ecology Package Template

| **Field**              | **Required Content**                                                                              |
|------------------------|---------------------------------------------------------------------------------------------------|
| **Package ID / Scope** | Realm, region family, biome family, transformed state, season, culture influence.                 |
| **Habitat Inputs**     | Climate, terrain, vegetation, water, geology, mana, history, civilisation, disturbance.           |
| **Family Slots**       | Ambient, prey, grazer, predator, apex, scavenger, pest, decomposer, magical, specialist, rare.    |
| **Relationships**      | Feeds on, pollinates, competes, controls, shelters in, symbiosis, avoids, engineers habitat.      |
| **Population Bands**   | Minimum, expected, carrying capacity, trend, age structure, nest count, migration.                |
| **Events**             | Boom, decline, migration, outbreak, invasion, boss pressure, settlement conflict, recovery.       |
| **Fallbacks**          | Compatible substitute families, intentional absence, progression guarantee, duplicate prevention. |
| **Validation**         | Seed coverage, impossible graph checks, resource links, performance budget, safe-start rules.     |

# Appendix C. Taming, Husbandry, and Companion Template

| **Field**                   | **Required Content**                                                                             |
|-----------------------------|--------------------------------------------------------------------------------------------------|
| **Relationship Type**       | Pet, companion, mount, work beast, livestock, managed wild, temporary summon, no taming.         |
| **Eligibility and Ethics**  | Personhood exclusion, age, health, family suitability, cultural law, faction restriction.        |
| **Trust Actions**           | Food, rescue, handling, habitat, ritual, repeated interaction, training, social group.           |
| **Needs and Welfare**       | Feed, water/equivalent, shelter, space, group, enrichment, health, rest, magical stability.      |
| **Commands and Work**       | Follow, stay, home, route, haul, guard, graze, patrol, mount, flee, work schedule, allowed zone. |
| **Equipment**               | Harness, saddle, armour, packs, tools, focus, identification, size/body constraints.             |
| **Breeding**                | Pair/group, season, traits, juvenile care, cap, inheritance, disease, records.                   |
| **Ownership / Multiplayer** | Owner, household, settlement, guild, permissions, sale, gift, theft, inheritance, release.       |

# Appendix D. Dungeon Ecology and Boss Ecology Templates

| **Dungeon Ecology Field**      | **Required Content**                                                                      |
|--------------------------------|-------------------------------------------------------------------------------------------|
| **Origin and Current State**   | Natural, built, ruined, occupied, flooded, corrupted, realm leak, restored, quarantined.  |
| **Energy / Food Source**       | Prey, fungus, carrion, mana, heat, memory, soul residue, machine waste, imported feed.    |
| **Population Layers**          | Ambient, prey, predator, scavenger, parasite, guardian, boss, invasive, captive.          |
| **Spatial Relationships**      | Nest rooms, feeding routes, water, ventilation, verticality, safe refuges, blocked paths. |
| **Faction / Settlement Links** | Handlers, hunters, poachers, cult, research, rescue, quarantine, trade, conservation.     |
| **State Change**               | Clear, relocate, cleanse, collapse, restore, claim, reoccupy, breed, contain, open route. |

| **Boss Ecology Field**       | **Required Content**                                                                           |
|------------------------------|------------------------------------------------------------------------------------------------|
| **Territory and Function**   | What habitat, population, route, resource, law, or world process the boss controls.            |
| **Evidence**                 | Tracks, weather, migration, missing animals, damaged sites, NPC reports, altered resources.    |
| **Awakening / Arrival**      | Seed placement, event, resource extraction, corruption, season, faction action, portal change. |
| **Alternate Resolution**     | Kill, cleanse, seal, relocate, bargain, tame, bind, protect, restore, coexist.                 |
| **Aftermath**                | Population, terrain, settlement, faction, resource, dungeon, climate, route, realm state.      |
| **Replacement / Recurrence** | Permanent unique, successor, migration, rematch, event return, setting-dependent respawn.      |

# Appendix E. Minimum Completeness and Validation Matrix

| **Package**         | **Ordinary Ecology**                              | **Threat / Adventure**                     | **Civilisation / Economy**             | **Dynamic State**                   | **Validation Gate**                          |
|---------------------|---------------------------------------------------|--------------------------------------------|----------------------------------------|-------------------------------------|----------------------------------------------|
| **Surface Biome**   | ambient, prey/grazer, predator, scavenger/pest    | lairs, rare family, regional threat        | hunting, livestock/pest, resource/law  | season, migration, decline/recovery | habitat graph and seed coverage              |
| **Ocean / Coast**   | school/filter feeder, grazer, predator, scavenger | reef/lair, vessel threat, leviathan hook   | fishing, aquaculture, port law         | spawn run, storm, pollution         | depth/salinity/current compatibility         |
| **Skyland**         | ambient swarm, sky grazer, predator               | nest, route threat, sky boss               | mount/transport, settlement defence    | storm migration, island movement    | wind/altitude/landing validation             |
| **Underground**     | ambient, decomposer, consumer, predator           | colony, dungeon fauna, deep threat         | mining, pest, resource, work creature  | cave-in, bloom, noise response      | cave volume and food-source validation       |
| **Major Realm**     | 5 v0.1 families; target 12-25                     | 3 dungeon modules, apex/boss hook          | 2 society relationships, trade species | invasion, law shift, migration      | realm-law and portal safety tests            |
| **Creature Family** | complete definition and relationships             | counterplay and threat role where relevant | resource, law, settlement links        | variants, population, events        | ID, reference, personhood, asset, save tests |

# Appendix F. Acceptance Criteria

- The document contains no active POC creature, Forest Hamlet, Briarhook raid, or fixed valley spawn dependency.

- Creature, personhood, faction, dungeon, boss, biome, realm, resource, and technical ownership boundaries are explicit.

- A production foundation of 72 Overworld and 60 realm creature families is defined with stable IDs and system hooks.

- Every major biome and realm can be populated through authored ecology packages without one canonical world layout.

- Predation, migration, nests, taming, husbandry, harvesting, corruption, extinction, recovery, and world events have bounded rules.

- Sapient beings and awakened constructs are protected from monster, livestock, taming, and harvesting classification errors.

- Dungeon ecology modules and boss ecology hooks are ready for 24G and 24H expansion.

- Godot/Summer Engine data, simulation LOD, persistence, multiplayer authority, seed validation, and save migration requirements are recorded.

- Accessibility, peaceful play, non-lethal solutions, conservation, alternative materials, and multiple boss resolutions preserve player freedom.

---
## Navigation
- Previous: [[24E - Peoples, Cultures, Factions and Settlement Atlas|24E]]
- Next: [[24G - Dungeons, Ruins, Lairs and Megadungeons Atlas|24G]]
- Index: [[00 - Document Set 24 Index]]
