---
title: 24D — Dimensions, Realm Structure and Realm Biome Atlas
document_set: 24
document: 24D
aliases:
- 24D
- Document 24D
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
- 24d
---

# 24D — Dimensions, Realm Structure and Realm Biome Atlas

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24D - World Content Atlas: Dimensions, Realm Structure and Realm Biome Atlas**

Version 0.1 - Post-POC Production Content Draft

A database-ready atlas for seed-derived dimensions, realm networks, realm laws, regions, biome families, native ecologies, civilisations, portals, dungeons, bosses, resources, infrastructure, dynamic states, and cross-realm consequences.

| **Dimension Atlas Statement**                                                                                                                                                                                                                                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The final game uses no fixed proof-of-concept valley, guaranteed first portal, predetermined first realm, or hardcoded dimensional route. Every seed derives a connected but variable network of realms, access methods, societies, biome families, dungeons, bosses, resources, and consequences from validated Atlas definitions. The Forest Hamlet proof-of-concept and its portal assumptions are retired from production content. |

| **Field**            | **Locked Direction**                                                                                                                                                                                                                          |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope       | Post-POC production rules for dimensions, realm networks, physical and magical laws, portals, biome families, societies, ecology, resources, infrastructure, dungeons, bosses, dynamic states, data registries, validation, and seed testing. |
| Realm Roster         | Twelve realm families: Verdant Covenant, Ancestral Veil, Somnolent Expanse, Aetheric Reach, Impossible Deep, World-Engine, Ashen Lower Realms, Void Between, Divine Concords, Necropolis Domains, Elemental Confluences, and Created Pockets. |
| Biome Expansion      | Eight production biome families are defined for each realm family, creating ninety-six realm-biome foundations before later sub-biomes and local variants.                                                                                    |
| Procedural Direction | Realm availability, access route, arrival region, political condition, dungeon ownership, boss state, and cross-realm consequences are seed-derived and simulation-responsive.                                                                |
| POC Retirement       | No Forest Hamlet gate, old rune clearing, fixed first dimension, tutorial portal, or POC-specific encounter is part of normal generation. POC content remains archival and test-only.                                                         |
| Technology Direction | Registry and runtime guidance is aligned to Godot and Summer Engine, using stable IDs, data-driven definitions, deterministic generation, streamed realm instances, and save-safe state records.                                              |

# Document Purpose

This document is the dimension-facing volume of Document Set 24, the World Content Atlas. It converts the earlier high-level realm concepts into a production-ready structure for complete, seed-generated worlds. It defines what a realm is, how realms relate to one another, how their laws affect play, how portals and safe return work, how civilisations and ecologies occupy them, and how each realm receives a meaningful range of biomes, dungeons, bosses, resources, and dynamic outcomes.

The document does not replace the detailed Magic, Creatures, Structures, Races and Factions, Quest and Event, Combat, or Technical Implementation documents. Instead, it owns the shared dimensional vocabulary and the realm-facing fields those systems must reference. Later Atlas volumes will expand the people, creatures, dungeons, bosses, structures, resources, and story content introduced here.

# Design Source and Supersession Rules

| **Source**                                 | **Direction retained or superseded**                                                                                                                                                                                                  |
|--------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | Retains multiple persistent realms, civilisation-scale progression, cultural stories, magic infrastructure, and player freedom.                                                                                                       |
| 09 - Magic System                          | Retains portals, rituals, mana infrastructure, realm hazards, corruption, and magical discovery; removes any POC-only gate assumption.                                                                                                |
| 10 - Creatures and Monsters                | Retains dimensional creature families, bosses, ecology, variants, and world consequences.                                                                                                                                             |
| 11 - Biomes and World Generation           | Retains deterministic layered generation, biome functionality, realm leaks, dynamic states, and simulation LOD.                                                                                                                       |
| 12 - Structures                            | Retains portal structures, realm gates, dungeons, settlements, ownership, restoration, and dynamic structure states.                                                                                                                  |
| 13 - Races, Peoples, Cultures and Factions | Retains separation of ancestry, culture, faction, language, government, faith, settlement, and citizenship. No realm is biologically exclusive to one ancestry.                                                                       |
| 14 - Dimensions                            | Retains the twelve major realm families and their thematic purpose. This document expands and supersedes its POC scoping and any fixed progression order.                                                                             |
| 18 - Technical Plan                        | Retains stable IDs, realm instances, derived seeds, streamed chunks, save records, simulation summaries, and authoritative transactions, while implementation references are translated to the current Godot/Summer Engine direction. |
| 24A-C - World Content Atlas                | Uses their post-POC procedural hierarchy, world-history layers, biome completeness contracts, environmental transitions, and no-hardcoded-content rules.                                                                              |

# Static Table of Contents

1\. Locked Dimension and Realm Atlas Identity

2\. Post-POC Production Decisions

3\. Authority and Cross-Document Ownership

4\. Cosmology and Realm Classification

5\. Realm Network, Seed Derivation, and Topology

6\. Realm Regions, Biomes, and Law Architecture

7\. Realm Laws, Survival, Building, Navigation, and Safe Return

8\. Portals, Anchors, Routes, and Access Progression

9\. Civilisations, Settlements, Migration, and Sovereignty

10\. Ecology, Creatures, and Invasive Pressure

11\. Resources, Crafting, Automation, and Trade

12\. Verdant Covenant Atlas

13\. Ancestral Veil Atlas

14\. Somnolent Expanse Atlas

15\. Aetheric Reach Atlas

16\. Impossible Deep Atlas

17\. World-Engine Atlas

18\. Ashen Lower Realms Atlas

19\. Void Between Atlas

20\. Divine Concords Atlas

21\. Necropolis Domains Atlas

22\. Elemental Confluences Atlas

23\. Created Pockets Atlas

24\. Dimension Dungeons and Megadungeons

25\. Realm Bosses, Guardians, and Sovereigns

26\. Dynamic States and Cross-Realm Consequences

27\. Discovery, Rumours, Maps, and Codex

28\. Visual, Audio, VFX, and Forge Requirements

29\. Simulation LOD, Persistence, Multiplayer, and Save Safety

30\. Data Models, Registries, Validation, Seed Testing, and Production Gates

31\. Balancing Rules

32\. Cross-Document Update Plan

33\. Open Questions

34\. Appendices A-F

# 1. Locked Dimension and Realm Atlas Identity

Dimensions are complete world systems, not single themed maps, reward rooms, or recoloured biomes. A major realm contains regions, biome families, transitions, societies or deliberate wilderness, native ecology, resources, infrastructure requirements, dungeons, bosses, routes, dynamic states, and long-term consequences. Created pockets may be smaller, but they still require explicit boundaries, laws, ownership, persistence, and failure behaviour.

| **Locked Rule**                                                                                                                                                                                                                                                                                                             |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Every major realm must answer: what makes its world physically and socially different, what does it provide, what threatens it, who lives there, what infrastructure works or fails, how the player enters and returns, what can permanently change, and why its content cannot be reproduced by an Overworld biome reskin. |

## 1.1 What this Atlas prevents

- A mandatory first dimension or fixed portal sequence repeated across every seed.

- One ancestry being treated as the sole owner or biological equivalent of a dimension.

- A realm containing only one biome, one enemy palette, and one boss corridor.

- Portals functioning as consequence-free teleport menus with no route, anchor, ownership, or failure state.

- Dimension dungeons that behave exactly like Overworld dungeons with different textures.

- Bosses that exist only as large health bars and drop tables without regional or political meaning.

- Resources that leave a realm and have no lasting use in settlements, machines, magic, trade, or restoration.

- Random generation that can make required progression impossible or safe return unavailable.

# 2. Post-POC Production Decisions

| **Field**       | **Locked Direction**                                                                                                                                                                |
|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| POC content     | Removed from the production registries and normal seed generation. It may remain in an archive scene or automated regression test.                                                  |
| First realm     | Not fixed. Seeds expose different early clues and routes while validation guarantees at least one reachable realm path within the configured progression envelope.                  |
| Access order    | Branching and partially procedural. Knowledge, faction trust, rituals, structures, bosses, engineering, exploration, or accidents may reveal different routes.                      |
| Major realms    | Persistent generated world instances with derived seeds, region state, settlements, structures, ecology, routes, and bounded inactive simulation.                                   |
| Minor realms    | Smaller domains or subrealms generated from the same Atlas contracts with reduced scope and an explicit purpose.                                                                    |
| Pocket realms   | Finite, definition-driven instances with creator, owner, capacity, rules, persistence, exit, and collapse fields.                                                                   |
| Realm ownership | Political control and route control are separate. A faction may own a gate without owning the destination.                                                                          |
| Safe return     | Every intended progression route must provide a discoverable, constructible, negotiated, or recoverable return method. Deliberate one-way challenge content must be clearly marked. |
| Realm outcomes  | Restoration, alliance, conquest, isolation, exploitation, cleansing, reform, collapse, sealing, and negotiated coexistence are supported where appropriate.                         |
| Content scale   | Eight biome families per realm in v0.1, later expanded through sub-biomes, regional variants, overlays, seasonal states, and settlement influence.                                  |

# 3. Authority and Cross-Document Ownership

| **Content layer**      | **Atlas 24D owns**                                                                                                                              | **Referenced systems own**                                                          |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|
| Realm identity         | Stable realm ID, class, fantasy, law profile, topology, affinities, access categories, and completeness status.                                 | Narrative dialogue, individual quests, spell implementation, and final assets.      |
| Realm biome            | Biome-family identity, law modifiers, ecology slots, settlement suitability, dungeon and boss suitability, resources, hazards, and transitions. | Specific block palettes, creature entries, loot values, structures, and encounters. |
| Route                  | Origin/destination, route class, anchor requirements, permissions, risk, return rule, discovery state, and dynamic status.                      | Portal block implementation, ritual recipes, effects, UI, and network replication.  |
| Society                | Civilisation slots, settlement forms, migration rules, sovereignty, route diplomacy, and realm adaptation needs.                                | Detailed cultures, factions, NPC templates, laws, languages, and story arcs in 24E. |
| Dungeon and boss hooks | Realm-specific dungeon mechanic requirements, families, territory roles, and aftermath expectations.                                            | Full dungeon registries in 24G and boss registries in 24H.                          |
| Persistence            | Required realm state, generated relationships, route records, discovered knowledge, and dynamic outcomes.                                       | Technical storage, migration, streaming, authority, and recovery implementation.    |

# 4. Cosmology and Realm Classification

The Atlas does not require one universally accepted cosmology. Developer definitions describe how world generation and simulation behave, while cultures may hold conflicting explanations. A realm can be physically separate, interstitial, layered over the Overworld, networked through dreams or spirits, artificially constructed, divided into subrealms, or bounded as a pocket.

| **Realm class**        | **Generation meaning**                                                                                   | **Examples**                                                   |
|------------------------|----------------------------------------------------------------------------------------------------------|----------------------------------------------------------------|
| Major persistent realm | Large streamed world with multiple regions, societies, biomes, dungeons, and persistent state.           | Verdant Covenant; Aetheric Reach; Impossible Deep.             |
| Layer or reflection    | World overlaps another reality and may use relationships, memory, death, or perception as coordinates.   | Ancestral Veil.                                                |
| Network realm          | Many connected domains or coherence zones linked by special routes rather than one continuous geography. | Somnolent Expanse; Divine Concords.                            |
| Realm cluster          | Several related but distinct worlds sharing a thematic and systemic family.                              | Ashen Lower Realms; Necropolis Domains; Elemental Confluences. |
| Artificial realm       | World-scale constructed environment governed by engineered systems.                                      | World-Engine.                                                  |
| Interstitial realm     | Space between destinations, routes, or realities.                                                        | Void Between.                                                  |
| Pocket family          | Finite created instances with bounded rules, ownership, and capacity.                                    | Created Pockets.                                               |

## 4.1 Realm relationship types

- Stable adjacency: two realms share durable routes or boundary regions.

- Affinity: magic, ecology, culture, or infrastructure transfers with reduced risk.

- Conflict: laws or materials react destructively without stabilisation.

- Leakage: weather, creatures, resources, corruption, dreams, spirits, or terrain cross into another world.

- Dependency: a route, settlement, or biome requires energy or state from another realm.

- Containment: one realm or pocket imprisons content from another.

- Claim: cultures hold historical, spiritual, legal, or political claims over routes or destinations.

- Unknown: the Atlas preserves mysteries where developer truth is deliberately incomplete or discoverable only through play.

# 5. Realm Network, Seed Derivation, and Topology

A world seed derives a realm-network seed. The realm roster may remain broadly stable for the full game, but the locations, discoverability, route graph, arrival regions, active factions, historical layers, dungeon states, and boss conditions vary. Optional content packs may add new realm families without rewriting existing save IDs.

| **Generation layer** | **Derived output**                                                                                                  | **Validation requirement**                                                                              |
|----------------------|---------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| World seed           | Realm-network seed, world-history influences, global magical conditions, and optional content-pack selection.       | Deterministic under the same content manifest and worldgen version.                                     |
| Realm definition     | Realm instance seed, topology profile, law profile, region budget, hidden layers, and global dynamic state.         | Valid stable ID and supported runtime class.                                                            |
| Region graph         | Biome mosaics, transitions, settlement zones, wilderness, routes, resources, dungeons, and boss territories.        | Connected intended play space; no required content isolated without a matching route.                   |
| Access graph         | Portal anchors, rituals, natural crossings, faction gates, accidents, one-way hazards, and return routes.           | At least one reachable realm path and one valid recovery path within configured progression guarantees. |
| History layer        | Builders, migrations, wars, collapses, treaties, sealed routes, invasions, and ruins.                               | No contradictory owner, date, route, or structure state.                                                |
| Simulation state     | Current sovereignty, settlements, ecology pressure, active bosses, dungeon occupation, route stability, and events. | Save-safe, resumable, and abstractable when unloaded.                                                   |

## 5.1 Realm topology requirements

- Every major realm has at least one understandable macro-layout: continents, islands, layers, networks, flow fields, sectors, domains, or bounded modules.

- Arrival points occur in suitable regions, not arbitrary lethal terrain, unless the route is explicitly risky and signposted.

- Critical routes receive fallback placement or alternative unlock conditions rather than relying on a single random structure.

- Hidden regions, deep layers, and climax territories can remain inaccessible until knowledge, infrastructure, diplomacy, or world state changes.

- Topology exposes navigational clues through skyline, weather, currents, roots, roads, stars, sound, machine signals, spirit paths, or anchor networks.

# 6. Realm Regions, Biomes, and Law Architecture

A realm is generated from regional graphs and biome families, not one global palette. Realm laws apply at several scopes so the world can remain coherent while supporting local exceptions, dungeons, settlement wards, disasters, or boss territories.

| **Law scope**     | **Purpose**                                                                        | **Example**                                             |
|-------------------|------------------------------------------------------------------------------------|---------------------------------------------------------|
| Cosmological      | Defines what the realm fundamentally permits or changes.                           | Promises create binding states in the Verdant Covenant. |
| Realm global      | Default gravity, time, mana, atmosphere, death, navigation, and matter behaviour.  | Aetheric matter is buoyant and altitude-sensitive.      |
| Regional          | Large local variations caused by flows, courts, sectors, history, or climate.      | A storm province reverses prevailing windways.          |
| Biome             | Ecology, hazards, resources, structures, visibility, and local movement modifiers. | Frostfire Shelves combine cold flame and ice magma.     |
| Site or dungeon   | Deliberate rules for a ruin, prison, trial, machine, boss arena, or pocket.        | A contract fortress enforces signed route permissions.  |
| Temporary overlay | Event, corruption, blessing, war, ritual, leak, disaster, or player intervention.  | A Void breach erodes map knowledge until stabilised.    |

## 6.1 Major-realm completeness contract

| **Content area** | **Minimum production target**                                                                                                                                     |
|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Biome structure  | At least six biome families; v0.1 defines eight per realm, plus transitions, hidden layers, and dynamic variants.                                                 |
| Civilisation     | Multiple societies or a deliberate wilderness explanation; settlement adaptation and route diplomacy rules.                                                       |
| Ecology          | Twelve to twenty-five creature families over production, including ambient, prey, predators, magical beings, and major threats where appropriate.                 |
| Dungeons         | Three to six dungeon families plus realm-specific mechanics that cannot function identically in an Overworld dungeon.                                             |
| Bosses           | Regional boss possibilities and at least one guardian, sovereign, system intelligence, titan, or realm-climax path.                                               |
| Resources        | Common survival inputs, construction materials, cultural goods, magical or industrial resources, rare strategic materials, and extraction consequences.           |
| Infrastructure   | Clear rules for building, power, transport, storage, farming, wards, portals, and settlement survival.                                                            |
| Outcomes         | At least several meaningful long-term states such as alliance, restoration, reform, conquest, isolation, cleansing, containment, collapse, or negotiated balance. |

# 7. Realm Laws, Survival, Building, Navigation, and Safe Return

| **System**              | **Required realm-facing fields**                                                                                                                                |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Atmosphere and survival | Breathability, temperature, pressure, radiation or mana exposure, food compatibility, sleep, identity, soul, corruption, disease, and special protective needs. |
| Gravity and movement    | Direction, magnitude, local variation, buoyancy, falling rules, flight, swimming, root orientation, phase movement, and mount or vehicle compatibility.         |
| Time                    | Rate, cycles, seasonal behaviour, dream divergence, memory ordering, pause behaviour, crops, NPC schedules, and save reconciliation.                            |
| Matter and blocks       | Native block stability, foreign-material reaction, decay, growth, transformation, structural rules, repair, and reclamation.                                    |
| Magic and power         | Mana density, school affinities, forbidden effects, overload, elemental flows, soul use, divine law, machine compatibility, and stabilisation.                  |
| Navigation              | Maps, compasses, landmarks, route beacons, stars, currents, signals, memories, roads, anchors, and failure behaviour.                                           |
| Death and recovery      | Body, inventory, spirit, respawn, rescue, corpse rights, realm ejection, tombstone compatibility, and multiplayer revival.                                      |
| Safe return             | Return anchor, reciprocal gate, ritual, route repair, rescue system, emergency consumable, or explicit challenge-state exception.                               |

| **Safe-Return Rule**                                                                                                                                                                                                                                                                                                         |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The player may enter dangerous or temporarily one-way content, but normal progression must not silently strand a save. Route UI, environmental language, quest text, and portal feedback must distinguish stable return, conditional return, consumable return, emergency rescue, and deliberate no-return challenge states. |

# 8. Portals, Anchors, Routes, and Access Progression

| **Route class**   | **Typical source**                                                                              | **Gameplay identity**                                                       |
|-------------------|-------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| Natural crossing  | Seasonal path, spirit road, dream boundary, storm opening, elemental vent, or Void-thin scar.   | Exploration-driven and often time- or state-dependent.                      |
| Ancient gate      | Ruins, precursor frames, sealed roads, forgotten infrastructure, or realm embassies.            | Repair, knowledge, history, and contested ownership.                        |
| Ritual route      | Runes, offerings, vows, dreams, funerary rites, climate alignment, or contracts.                | Preparation and cultural or magical knowledge.                              |
| Engineered portal | Player or faction-built gate with power, anchors, stabilisers, permissions, and maintenance.    | Reliable infrastructure and long-term logistics.                            |
| Faction route     | Embassy, military gate, pilgrimage road, trade charter, prison transfer, or diplomatic passage. | Reputation, law, fees, politics, and route security.                        |
| Accidental breach | Machine failure, boss event, disaster, realm leak, dream collapse, or Void rupture.             | Urgent, unstable, narratively reactive, and rarely safe for routine travel. |
| Pocket aperture   | Keyed door, relic, portable gate, structure-bound entrance, or machine module.                  | Finite destination with explicit owner and capacity.                        |

## 8.1 Route progression

1\. Notice evidence: anomalies, stories, materials, creatures, dreams, structures, faction activity, or failed gates imply another realm.

2\. Identify destination: research, translation, NPC teaching, experimentation, maps, rituals, or recovered route records establish where a route leads.

3\. Prepare access: gather keys, build anchors, negotiate permission, repair structures, align conditions, or defeat a route-blocking threat.

4\. Establish return: confirm the reciprocal route, place an anchor, carry emergency equipment, or understand the route window.

5\. Stabilise logistics: provide power, maintenance, security, storage, customs, wards, and safe arrival infrastructure.

6\. Integrate the route: trade, migration, quests, invasions, cultural exchange, resource flow, diplomacy, and environmental leakage begin affecting both sides.

# 9. Civilisations, Settlements, Migration, and Sovereignty

No major realm is automatically owned by one ancestry. Realm populations can include native peoples, migrants, stranded groups, artificial beings, spirits, colonists, refugees, conquerors, trade diasporas, mixed communities, and factions created by the realm itself. Ancestry, culture, faction, citizenship, settlement, faith, and route ownership remain separate records.

| **Settlement question**            | **Atlas requirement**                                                                                                    |
|------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Why can residents survive?         | Native adaptation, protective infrastructure, food or energy loop, social support, and law compatibility.                |
| What is the settlement built from? | Native and imported materials, degradation rules, architectural grammar, repair chain, and Forge asset families.         |
| How is it supplied?                | Local gathering, agriculture, hunting, mining, magic, industry, trade routes, portals, or external subsidies.            |
| Who governs it?                    | Government, faction, law, recognised sovereignty, route rights, property rules, and relations with native inhabitants.   |
| What does it export?               | Resources, services, knowledge, labour, transport, relics, rituals, military power, or cultural goods.                   |
| What threatens it?                 | Environment, ecology, rivals, route instability, law violations, corruption, bosses, shortages, or internal conflict.    |
| Can it grow or fail?               | Population, housing, infrastructure, projects, migration, damage, abandonment, conquest, restoration, and dynamic state. |

| **Colonisation Rule**                                                                                                                                                                                                                                                      |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Player and faction settlement in another realm must not be treated as empty-land expansion by default. The Atlas records existing claims, native ecologies, sacred areas, treaties, extraction rights, displacement risk, and the political meaning of new infrastructure. |

# 10. Ecology, Creatures, and Invasive Pressure

| **Ecology layer**              | **Required content**                                                                                                                                   |
|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ambient and micro-life         | Pollinators, spores, motes, insects, drifting organisms, machine microfauna, spirits, or equivalent signs of environmental function.                   |
| Primary producers              | Plants, fungi, mineral growths, energetic fields, memory systems, soul agriculture, machine assemblers, or other foundations of the food/resource web. |
| Prey and herd life             | Local food-web roles, migration, reproduction, habitat needs, settlement interaction, and harvesting rules.                                            |
| Predators and territorial life | Hunting behaviour, territory signs, counters, lairs, population pressure, and response to player or settlement activity.                               |
| Intelligent beings             | Civilisation, diplomacy, factions, ownership, language, law, jobs, and non-combat interactions.                                                        |
| Magical and constructed life   | Elementals, spirits, thoughtforms, golems, machine beings, undead, divine servants, and law-generated entities.                                        |
| Invasive pressure              | What happens when Overworld creatures, crops, diseases, machines, spirits, or foreign realm species cross a route.                                     |
| Boss ecology                   | Whether a boss is an apex species, sovereign, machine intelligence, guardian, catastrophe, political ruler, or unique anomaly.                         |

# 11. Resources, Crafting, Automation, and Trade

Realm resources must remain useful outside their origin. Each family should support several connected uses such as construction, equipment, magic, machines, wards, food, medicine, settlement projects, trade, story, restoration, portal infrastructure, or environmental control. Extraction can alter ecology, politics, realm stability, or cross-realm relations.

| **Realm or family**   | **Automation adaptation profile**                                                                                                                |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| Verdant Covenant      | Living conduits, regenerative machines, negotiated harvesting, seasonal throughput, biological storage, and anti-blight safeguards.              |
| Ancestral Veil        | Memory anchors, spirit-safe transactions, name protection, ritual labour, memorial power, and safeguards against identity consumption.           |
| Somnolent Expanse     | Lucidity controls, waking-body protection, coherence anchors, symbolic logic, dream-time reconciliation, and nonphysical inventories.            |
| Aetheric Reach        | Weight limits, wind and storm power, buoyant transport, tethered structures, aerial routes, and fall-safe logistics.                             |
| Impossible Deep       | Pressure seals, heat management, seismic power, tunnel logistics, deep-water handling, and structural reinforcement.                             |
| World-Engine          | Protocol adapters, permissions, machine-language interfaces, coolant, sector power, maintenance access, and resistance to hostile reprogramming. |
| Ashen Lower Realms    | Heat-proof industry, contract permissions, debt-free ownership records, siege logistics, smoke management, and coercion safeguards.              |
| Void Between          | Redundant anchors, decay-resistant storage, route verification, memory protection, spatial containers, and strict shutdown behaviour.            |
| Divine Concords       | Domain-law compliance, vow permissions, sanctified materials, ritual validation, taboo monitoring, and culture-specific legitimacy.              |
| Necropolis Domains    | Soul-rights permissions, corpse ownership, necrotic protection, separate body/spirit inventories, memorial records, and ethical labour controls. |
| Elemental Confluences | Flow balancing, phase-safe machines, pressure and temperature controls, conductive routing, corrosion resistance, and climate feedback.          |
| Created Pockets       | Capacity accounting, owner permissions, internal time, stability power, exit redundancy, boundary monitoring, and resource-loop sustainability.  |

# 12. Verdant Covenant Atlas

| **Field**         | **Locked Direction**                                                                                                                                                      |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.major.verdant_covenant                                                                                                                                              |
| Realm Class       | Major Living/Fae Realm                                                                                                                                                    |
| Production Status | Early or mid-game major realm candidate, but never a mandatory first realm.                                                                                               |
| Core Fantasy      | A beautiful and politically dangerous living world where seasons, names, hospitality, emotion, and spoken promises can become physical law.                               |
| Topology          | Interwoven continental forests, living river basins, seasonal borderlands, root-depth layers, court territories, and neutral covenant sanctuaries.                        |
| Defining Laws     | Mana-rich living matter; recognised promises may create binding states; seasons can migrate geographically; some terrain grows, remembers, or refuses extraction.         |
| Survival and Risk | Breathable and fertile, but aggressive overgrowth, glamour, unfamiliar food, territorial plants, seasonal hazards, and oath consequences require preparation.             |
| Access Families   | Ancient covenant gates, Fae invitations, living-key rituals, seasonal crossings, dream-root paths, and negotiated court routes.                                           |
| Civilisations     | Multiple Fae courts, mortal diasporas, living settlements, wandering seasonal peoples, neutral enclaves, blight refugees, and disputed embassy sites.                     |
| Realm Affinities  | Strong links to Elemental Confluences, Somnolent Expanse, Ancestral Veil, and nature-aligned Overworld leylines. Void and industrial breaches create severe interference. |
| Overworld Utility | Living construction, nature automation, new crops, anti-blight systems, seasonal magic, Fae migration, treaty obligations, and politically sensitive resources.           |
| Dungeon Families  | Living palace roots; broken covenant gardens; thorn-hunt labyrinths; rot-heart groves; seasonal vaults.                                                                   |
| Boss Hooks        | Seasonal Regent; Rot-Crowned Hart; Oathbreaker Thorn; court champion or sovereign conflict.                                                                               |

## 12.1 Realm-biome family registry

| **Biome Family**     | **World Identity**                                                                                                                                                                   | **Resources and Ecology**                                                                                                                               | **Civilisation, Dungeons, and Threats**                                                                                            |
|----------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Sunlit Canopy        | Multi-level luminous forest crowns with living bridges, pollen shafts, shifting leaves, and abundant mana. Paths grow toward welcomed travellers and close against marked intruders. | Fae seeds, living wood, nectar, canopy grazers, pollinators, glamour fauna, and seasonal fruit. Overharvesting provokes the forest or local court.      | Canopy settlements, embassy platforms, living dungeons, aerial predators, court patrols, and a possible Seasonal Regent territory. |
| Moonroot Groves      | Silver-lit woodland beneath enormous root arches. Memory, names, and whispered intentions persist in bark and soil. Navigation depends on respectful markers.                        | Oath-thread, moon sap, spirit moss, nocturnal prey, root guardians, and ancestral echoes. Roots can reveal or conceal buried paths.                     | Shrine villages, oath courts, root crypts, spirit crossings, lost treaties, and guardian bosses tied to broken promises.           |
| Pollenwild Meadows   | Vast flowering plains whose colours, wind, and emotional weather change with the dominant season. Pollen can heal, enchant, confuse, or trigger uncontrolled growth.                 | Medicinal pollen, seasonal resin, herd fauna, giant pollinators, glamour insects, and fast-growing crops. Fire and machines can cause explosive blooms. | Nomadic seasonal peoples, festival sites, mobile markets, flower mazes, herd events, and migrating regional bosses.                |
| Living Riverlands    | Rivers alter course around treaties, settlements, damaged roots, and seasonal needs. Banks grow natural docks, reed villages, and water-conduit organisms.                           | Living reeds, covenant fish, river pearls, wetland herbs, amphibious spirits, and biological water infrastructure.                                      | River courts, ferryman factions, living locks, drowned covenant ruins, water-route dungeons, and river sovereign encounters.       |
| Thorn-Court Marches  | Defensive borderlands of intelligent hedges, thorn walls, hunting roads, and territorial weather. The landscape enforces court boundaries.                                           | Thorn fibre, ward resin, predatory vines, armoured beasts, hunting birds, and rare defensive seeds.                                                     | Fortified court estates, border treaties, hunt dungeons, prisoner groves, military factions, and oath-bound champions.             |
| Rotwilds             | Blighted or abandoned territories where seasonal balance collapsed. Rot is ecological, magical, and political rather than automatically evil.                                        | Rotwood, cleansing reagents, fungal beasts, scavengers, corrupted pollinators, and unstable heart-seeds.                                                | Blight camps, quarantined settlements, cleansing projects, rot-heart dungeons, rival restoration factions, and corruption bosses.  |
| Seasonal Nexus       | A convergence where spring, summer, autumn, and winter occupy moving territories around a central covenant heart. Boundaries shift with politics and world events.                   | Seasonal crystals, climate catalysts, rare crops, elemental fauna, and weather resources.                                                               | Realm-scale rituals, court summits, seasonal trial dungeons, major route hub, and a realm-climax sovereign path.                   |
| Dreaming Root Depths | Subterranean living roots connect distant forests, dreams, memories, and portal anchors. Gravity follows root orientation rather than global down.                                   | Root amber, dream sap, buried relics, symbiotic fungi, dream predators, and living conduit tissue.                                                      | Hidden root cities, cross-realm passages, organic megadungeons, sleeping titans, and secret links to the Somnolent Expanse.        |

## 12.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the major living/fae realm topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 12.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 13. Ancestral Veil Atlas

| **Field**         | **Locked Direction**                                                                                                                                                               |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.major.ancestral_veil                                                                                                                                                         |
| Realm Class       | Major Spirit Layer                                                                                                                                                                 |
| Production Status | Major story and exploration realm; access can begin through death rites, spirit study, or damaged boundaries.                                                                      |
| Core Fantasy      | A layered reflection of memory, ancestors, unresolved deaths, remembered places, forgotten names, divine territories, and predatory spirits.                                       |
| Topology          | Overlapping reflections of Overworld regions connected by processional roads, memory seas, family hearthlands, forgotten districts, and deep predatory dark.                       |
| Defining Laws     | Identity, memory, name, burial, and remembrance affect solidity and visibility. Time is narrative rather than uniform. Some roads connect relationships instead of distance.       |
| Survival and Risk | No ordinary hunger is required in many regions, but memory loss, spirit exposure, identity erosion, unresolved grief, hostile possession, and severed return paths are hazards.    |
| Access Families   | Funerary gates, ancestral shrines, spirit roads, near-death crossings, remembered objects, medium rituals, and sanctioned ferryman routes.                                         |
| Civilisations     | Ancestor councils, psychopomp orders, lost communities, memory archivists, divine custodians, spirit predators, living visitors, and factions disputing the treatment of the dead. |
| Realm Affinities  | Strong links to Necropolis Domains, Divine Concords, Somnolent Expanse, and old Overworld settlements. World-Engine and Void processes can erase or trap spirits.                  |
| Overworld Utility | Historical truth, ancestor diplomacy, cleansing, soul wards, recovery of lost knowledge, memorial construction, and consequences for death, burial, and forgotten settlements.     |
| Dungeon Families  | Processional necropolises; memory archives; spirit courts; drowned remembrance halls; devouring-silence zones.                                                                     |
| Boss Hooks        | Memory Eater; Uncrowned Ancestor; Ferryman Sovereign; predatory lineage spirit.                                                                                                    |

## 13.1 Realm-biome family registry

| **Biome Family**             | **World Identity**                                                                                                                                                | **Resources and Ecology**                                                                              | **Civilisation, Dungeons, and Threats**                                                                                             |
|------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Echoing Hearthlands          | Warm reflections of homes, villages, and camps sustained by remembrance. Buildings fade or strengthen according to living memory and ritual care.                 | Ancestral essence, hearth ash, spirit grain, domestic echoes, family guardians, and memory fragments.  | Ancestor settlements, family quests, restored homes, memorial dungeons, inheritance disputes, and non-combat reconciliation bosses. |
| Processional Roads           | Endless roads, bridges, lantern paths, and river crossings used by the dead. Routes shift when rites fail, wars occur, or settlements are forgotten.              | Soul lantern fuel, ferryman tokens, road spirits, lost travellers, and relic cargo.                    | Psychopomp stations, toll factions, caravan events, bridge dungeons, route blockades, and sovereign ferrymen.                       |
| Memory Sea                   | A vast ocean made of remembered places, voices, and emotions. Islands form from shared history; storms erase or rearrange weak memories.                          | Memory pearls, echo glass, spectral fish, drowned relics, and truth fragments.                         | Archive fleets, drowned cities, memory-diving dungeons, leviathan spirits, and access to lost historical layers.                    |
| Ossuary Orchards             | Bone-white trees grow from properly tended remains, producing fruits of lineage, skill, or remembrance. Neglect can create hungry roots.                          | Ancestor fruit, soulwood, bone pollen, grave insects, orchard guardians, and funerary materials.       | Custodian villages, ethical harvesting conflicts, orchard crypts, lineage trials, and ancestral beasts.                             |
| Mourning Mists               | Fog provinces formed by unresolved mass grief, disaster, exile, or betrayal. Sound and direction bend toward unfinished stories.                                  | Mourning dew, grief crystal, lost-soul wisps, spectral predators, and cleansing reagents.              | Disaster echoes, refugee spirits, investigation dungeons, cleansing projects, and grief-fed regional threats.                       |
| Forgotten City Reflections   | Fading copies of settlements erased, abandoned, conquered, or culturally forgotten in the Overworld. Architecture changes as truth is recovered.                  | Lost plans, extinct crafts, forgotten language fragments, spirit tools, and rare historical resources. | Restorable city simulations, competing historical claims, urban dungeons, ancestor factions, and city-mind bosses.                  |
| Predator Dark                | Regions where remembrance is weak and identity-eating spirits hunt names, faces, and route markers. Light alone is insufficient; social bonds and anchors matter. | Null-ash, predator essence, protective sigils, shadow fauna, and stolen memories.                      | High-risk expeditions, rescue dungeons, quarantine gates, identity mechanics, and Memory Eater territories.                         |
| Crownlands of the Remembered | Strong ancestral territories shaped by dynasties, heroes, clans, temples, or entire cultures. Law, etiquette, and historical legitimacy govern access.            | Royal remembrance, oath relics, ceremonial materials, guardian spirits, and cultural knowledge.        | Ancestor courts, succession politics, pilgrimage cities, trial dungeons, sovereign encounters, and disputes over who owns the past. |

## 13.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the major spirit layer topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 13.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 14. Somnolent Expanse Atlas

| **Field**         | **Locked Direction**                                                                                                                                                       |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.network.somnolent_expanse                                                                                                                                            |
| Realm Class       | Dream Network                                                                                                                                                              |
| Production Status | Major networked realm; accessible through controlled sleep, dream anchors, psychic phenomena, or rare structures.                                                          |
| Core Fantasy      | A shifting network of dream, nightmare, prophecy, memory, fear, desire, and collective imagination connected through sleep.                                                |
| Topology          | Coherence islands, dream seas, shared roads, personal pocket zones, collective cities, nightmare fronts, and deep dream layers.                                            |
| Defining Laws     | Belief and expectation influence matter; coherence determines persistence; waking time and dream time diverge; identities may split into dream aspects.                    |
| Survival and Risk | Lucidity, identity, rest debt, nightmare pressure, false exits, emotional hazards, and waking-body safety matter more than ordinary food or temperature.                   |
| Access Families   | Sleep rituals, dream beds, rare fungi, oracle sites, psychic creatures, collective ceremonies, memory objects, and purpose-built dream anchors.                            |
| Civilisations     | Dream walkers, oracle schools, nightmare wardens, sleeping communities, memory traders, predatory thoughtforms, and cultures that maintain shared dream districts.         |
| Realm Affinities  | Strong links to Ancestral Veil and Verdant roots; Divine visions and Void erosion can intrude. World-Engine logic can stabilise or imprison dreams.                        |
| Overworld Utility | Prophecy clues, memory recovery, illusion and dream crafting, nightmare containment, remote communication, psychological story arcs, and sleep-related settlement systems. |
| Dungeon Families  | Lucid observatories; nightmare nests; memory theatres; waking labyrinths; prophecy engines.                                                                                |
| Boss Hooks        | Nightmare Architect; Sleeping Oracle; Waking Devourer; collective fear sovereign.                                                                                          |

## 14.1 Realm-biome family registry

| **Biome Family**       | **World Identity**                                                                                                                                                        | **Resources and Ecology**                                                                         | **Civilisation, Dungeons, and Threats**                                                                                             |
|------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Lucid Shores           | Stable beaches and islands where dreamers first arrive. The horizon shows possible destinations rather than fixed geography.                                              | Dream sand, lucid water, sleep motes, gentle thoughtforms, and anchor flora.                      | Arrival sanctuaries, dream ports, tutorial-safe expeditions, small puzzle dungeons, and route-selection infrastructure.             |
| Reverie Gardens        | Beautiful cultivated dreamlands created by communities, artists, healers, or rulers. Neglect causes symbolism to overgrow function.                                       | Emotion blossoms, inspiration resin, dream fruit, muse spirits, and crafted weather.              | Shared settlements, therapy sites, artistic factions, symbolic mazes, social events, and contested ownership of collective dreams.  |
| Memory Cities          | Urban districts assembled from many remembered places. Streets overlap eras, homes, languages, and impossible architecture.                                               | Memory masonry, echo signs, lost techniques, identity fragments, and dream citizens.              | Investigation-heavy urban dungeons, lost-person searches, historical contradictions, memory markets, and city-scale dream entities. |
| Prophecy Dunes         | Shifting deserts of unrealised futures. Wind exposes scenes, symbols, and possible outcomes that may be true, false, or self-fulfilling.                                  | Fate glass, omen dust, time-seeds, prophecy fauna, and probability catalysts.                     | Oracle caravans, prediction conflicts, future-ruin dungeons, event foreshadowing, and bosses that react to player choices.          |
| Nightmare Thickets     | Dense hostile dream forests grown from fear, trauma, and communal anxiety. Routes repeat until the source is confronted or understood.                                    | Nightmare sap, fear chitin, ward reagents, stalking thoughtforms, and corrupted dream seeds.      | Containment outposts, rescue missions, fear-specific dungeons, cleansing choices, and Nightmare Architect territories.              |
| Sleepwalker Roads      | Long connective routes used by experienced travellers, spirits, and dream caravans. Wrong turns can enter another sleeper, era, or realm.                                 | Road chalk, dream thread, courier motes, route beasts, and communication reagents.                | Dream trade, message networks, route tolls, travelling factions, ambush dungeons, and cross-realm shortcuts.                        |
| Shattered Waking Isles | Fragments where dream and waking reality collided. Physics is partly ordinary and partly symbolic, making them suitable for persistent construction but prone to rupture. | Waking stone, coherence cores, unstable relics, hybrid wildlife, and anchor materials.            | Long-term outposts, experimental farms, mixed-reality dungeons, breach events, and colonisation disputes.                           |
| Deep Dream Abyss       | Low-coherence depths beneath collective dreaming where forgotten concepts, primal fears, and sleeping powers accumulate.                                                  | Abyssal dream glass, origin motes, rare psychic catalysts, concept predators, and dormant titans. | Endgame expeditions, non-Euclidean megadungeons, world-threatening nightmares, and realm-climax paths.                              |

## 14.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the dream network topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 14.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 15. Aetheric Reach Atlas

| **Field**         | **Locked Direction**                                                                                                                                             |
|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.major.aetheric_reach                                                                                                                                       |
| Realm Class       | Major Sky Realm                                                                                                                                                  |
| Production Status | Major exploration, settlement, trade, and automation realm with strong traversal requirements.                                                                   |
| Core Fantasy      | Floating continents, storm oceans, sky settlements, rare gases, wind currents, vertical logistics, weather industry, and colossal aerial life.                   |
| Topology          | Layered altitude bands of floating land, cloud seas, storm fronts, windways, undersides, sky oceans, and high-silence regions.                                   |
| Defining Laws     | Gravity varies by altitude and island mass; wind routes act like rivers; weather can be harvested; falling may lead to lower layers rather than immediate death. |
| Survival and Risk | Low oxygen, cold, lightning, turbulence, exposure, falling, static charge, and limited solid ground require gear, vessels, anchors, and weather planning.        |
| Access Families   | Sky gates, storm towers, floating ruins, wind rituals, airship routes, elemental crossings, and restored aerial anchors.                                         |
| Civilisations     | Skyport city-states, nomadic vessel cultures, storm monasteries, gas miners, cloud farmers, aerial beast riders, and isolated underside communities.             |
| Realm Affinities  | Strong links to Elemental Confluences and high Overworld skylands. Void breaches disrupt gravity; World-Engine technology supports navigation and stabilisation. |
| Overworld Utility | Sky vessels, storm power, floating construction, weather control, aerial trade, rare gases, vertical logistics, and new defence systems.                         |
| Dungeon Families  | Skyforts; storm temples; fallen airship graveyards; thunderhead citadels; underside vaults.                                                                      |
| Boss Hooks        | Tempest Leviathan; Sky-King Automaton; Thunder Roc; storm sovereign.                                                                                             |

## 15.1 Realm-biome family registry

| **Biome Family**            | **World Identity**                                                                                                                                   | **Resources and Ecology**                                                                           | **Civilisation, Dungeons, and Threats**                                                                             |
|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| Cloudgrass Plateaus         | Broad floating grasslands with shallow gravity, cloud-fed rivers, and open wind exposure. Islands slowly drift within regional bounds.               | Cloudgrain, buoyant stone, herd flyers, burrowing sky fauna, and wind herbs.                        | Agricultural sky settlements, ranching cultures, island-edge ruins, migration events, and roaming aerial predators. |
| Stormglass Archipelagos     | Jagged crystal islands formed by repeated lightning strikes. Electrical storms create new terrain and destroy unstable routes.                       | Stormglass, charged metals, lightning essence, static insects, conductive plants, and storm drakes. | Power-harvesting stations, storm temples, crystal dungeons, route closures, and lightning-aligned bosses.           |
| Windway Corridors           | Stable high-speed currents connecting distant regions. Travel is rapid but requires route knowledge, steering, and safe exits.                       | Wind silk, current markers, courier fauna, gas pockets, and navigation crystals.                    | Trade lanes, patrol routes, floating toll stations, convoy events, pirate ambushes, and route-control conflicts.    |
| Thunderhead Seas            | Dense cloud oceans with internal lightning, floating water masses, hidden islands, and colossal atmospheric creatures.                               | Condensed cloudwater, thunder pearls, storm organs, skyfish, cloud leviathans, and rare gases.      | Cloud vessels, storm fishing, hidden dungeons, rescue events, and Tempest Leviathan territories.                    |
| Aerial Kelp Fields          | Vast strands of buoyant plant life hang through multiple altitude layers, creating vertical forests and sheltered ecological corridors.              | Sky kelp, buoyancy bladders, fibres, nesting fauna, pollen clouds, and medicinal spores.            | Hanging settlements, vertical farms, biological lifts, living dungeons, and ecosystem management conflicts.         |
| Skyforge Calderas           | Volcanic floating islands vent heat and metal-rich gases into cold upper air. Natural furnaces and dangerous pressure gradients support industry.    | Storm metal, sky iron, hot gas, forge ash, heat-adapted fauna, and elemental catalysts.             | Industrial sky cities, forge monasteries, caldera dungeons, extraction disputes, and furnace guardians.             |
| High Silence Expanse        | Near-vacuum upper realm with dim stars, slow motion, weak sound, and isolated ancient structures. Navigation depends on beacons and sealed habitats. | Aether gas, silence crystal, vacuum metals, radiation flora, and rare void-touched organisms.       | Observatories, sealed stations, ancient sky ruins, high-risk research dungeons, and links toward the Void Between.  |
| Fallen Continent Undersides | Dark inverted landscapes beneath massive floating continents, filled with hanging caverns, root systems, waterfalls, ruins, and gravity anomalies.   | Underside stone, hanging roots, cave flyers, gravity nodules, and lost settlement salvage.          | Hidden underside cultures, inverted mines, deep sky dungeons, falling-water routes, and gravity bosses.             |

## 15.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the major sky realm topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 15.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 16. Impossible Deep Atlas

| **Field**         | **Locked Direction**                                                                                                                                                  |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.major.impossible_deep                                                                                                                                           |
| Realm Class       | Major Deep Realm                                                                                                                                                      |
| Production Status | Major high-preparation realm beyond ordinary Overworld depth; supports permanent underworld civilisations.                                                            |
| Core Fantasy      | A physically impossible subterranean world of immense caverns, pressure seas, inverted strata, seismic forests, ancient cultures, and deep forge resources.           |
| Topology          | Nested world-caverns, inverted mountains, blackwater seas, pressure layers, fossil continents, coreward chasms, and gravity wells.                                    |
| Defining Laws     | Pressure and gravity vary by chamber; rock can flow; distance is distorted by folded strata; seismic events alter routes and expose forgotten regions.                |
| Survival and Risk | Pressure, toxic gases, heat, darkness, tremors, isolation, crushing water, unstable gravity, and limited agriculture require specialised habitats and infrastructure. |
| Access Families   | Deep anchors, seismic gates, ancient lifts, worldroot descents, pressure tunnels, machine shafts, and rare natural folds.                                             |
| Civilisations     | Ancient underworld cultures, pressure-adapted peoples, forge cities, blackwater settlements, fossil archivists, nomadic tunnel communities, and surface colonies.     |
| Realm Affinities  | Strong links to Overworld deep strata, World-Engine shafts, Elemental stone and fire confluences, and some Necropolis ruins. Void fractures are catastrophic.         |
| Overworld Utility | Pressure technology, seismic magic, deep forge materials, underground logistics, advanced mining, structural reinforcement, and ancient underworld knowledge.         |
| Dungeon Families  | Pressure vaults; inverted mines; fossil cities; seismic forges; blackwater citadels.                                                                                  |
| Boss Hooks        | Pressure Titan; Coreworm; Fossil Sovereign; seismic world-beast.                                                                                                      |

## 16.1 Realm-biome family registry

| **Biome Family**      | **World Identity**                                                                                                                                               | **Resources and Ecology**                                                                                   | **Civilisation, Dungeons, and Threats**                                                                             |
|-----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------|
| Pressure Gardens      | Enclosed caverns where dense atmosphere and mineral-rich water produce enormous soft-bodied plants and slow-moving fauna. Habitats require pressure locks.       | Pressure resin, dense fibres, medicinal fluids, giant molluscs, filter fauna, and exotic crops.             | Pressure settlements, biological farms, research sites, sealed dungeons, and ecological-collapse events.            |
| Inverted Caverns      | Gravity points toward chamber ceilings, creating upside-down mountains, waterfalls, settlements, and mining routes. Boundary zones have dangerous gravity shear. | Inverted stone, gravity nodules, ceiling forests, gliding fauna, and orientation crystals.                  | Inverted cities, anchor bridges, gravity puzzles, vertical dungeons, and bosses that manipulate orientation.        |
| Seismic Forests       | Stone-like organisms grow around tectonic energy and react to vibrations. Loud industry attracts predators or triggers defensive growth.                         | Resonance wood, quake fruit, seismic crystals, burrowing fauna, and vibration-sensitive predators.          | Quiet settlements, seismic farms, resonance temples, sound-based dungeons, and industrial conflict.                 |
| Blackwater Vault-Seas | Subterranean oceans under extreme pressure with lightless ecosystems, mineral storms, drowned ruins, and enormous migratory life.                                | Blackwater pearls, pressure oils, abyssal organs, deep fish, vent resources, and rare salts.                | Submersible routes, dome settlements, drowned-city dungeons, leviathan events, and resource-right disputes.         |
| Emberbone Forges      | Hot caverns built through fossilised remains of colossal beings. Bone minerals and magma channels form natural forge complexes.                                  | Emberbone, deep metal, heat organs, forge fungi, fire elementals, and relic fragments.                      | Forge cities, sacred extraction laws, natural foundry dungeons, titan archaeology, and Furnace Beast bosses.        |
| Gravity Wells         | Spherical chambers with multiple local gravity centres, floating debris, compressed matter, and unstable routes.                                                 | Gravity ore, compressed crystal, floating stone, anomaly fauna, and spatial catalysts.                      | Research outposts, hazardous mines, non-linear dungeons, route shortcuts, and gravitational regional bosses.        |
| Fossil Metropolises   | Cities built into or around continent-sized fossils, some abandoned and some still inhabited. Architecture preserves extinct ecologies and technologies.         | Fossil alloys, ancient scripts, bone stone, extinct spores, relic machines, and cultural treasures.         | Living underworld polities, archaeology, urban megadungeons, succession conflicts, and Fossil Sovereign encounters. |
| Coreward Chasms       | Deep fractures leading toward impossible heat, light, pressure, and seismic forces. Terrain forms and collapses around immense buried movement.                  | Core crystals, primal heat, seismic hearts, rare metals, extremophile organisms, and world-scale catalysts. | Endgame mining, realm infrastructure, unstable megadungeons, titan signs, and a Pressure Titan climax path.         |

## 16.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the major deep realm topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 16.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 17. World-Engine Atlas

| **Field**         | **Locked Direction**                                                                                                                                                                               |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.artificial.world_engine                                                                                                                                                                      |
| Realm Class       | Artificial Major Realm                                                                                                                                                                             |
| Production Status | Late-game major realm with powerful automation rewards and severe system-wide consequences.                                                                                                        |
| Core Fantasy      | A failing artificial world-machine built by a lost civilisation, still executing unknown functions through regions that are simultaneously terrain, infrastructure, and computation.               |
| Topology          | Machine continents, sector lattices, coolant oceans, archive forests, foundry belts, maintenance underlayers, logic storms, and a central furnace-core.                                            |
| Defining Laws     | Terrain is functional machinery; permissions can override physics; repair changes geography; machine processes continue at realm scale; identity and access may be treated as credentials.         |
| Survival and Risk | Heat, radiation, moving terrain, maintenance cycles, hostile security, logic contamination, coolant hazards, and resource starvation require technical adaptation.                                 |
| Access Families   | Ancient machine gates, recovered coordinates, deep shafts, dimensional control rooms, construct diplomacy, and repaired routing arrays.                                                            |
| Civilisations     | Machine factions, awakened constructs, maintenance cults, salvage communities, lost uploaded minds, surface expeditions, and rival groups seeking control of the Engine.                           |
| Realm Affinities  | Strong links to Created Pockets, Impossible Deep, Aetheric logistics, and portal networks. Dream, spirit, infernal, and void systems can infect or alter machine logic.                            |
| Overworld Utility | Advanced automation, machine origins, dimensional routing, programmable infrastructure, construct rights, powerful alloys, and the risk of connecting Overworld systems to a failing intelligence. |
| Dungeon Families  | Logic vaults; foundry spines; archive sectors; rogue assemblies; coolant labyrinths.                                                                                                               |
| Boss Hooks        | Prime Custodian; Furnace Heart; Recursive General; sector-scale machine intelligence.                                                                                                              |

## 17.1 Realm-biome family registry

| **Biome Family**       | **World Identity**                                                                                                                                                     | **Resources and Ecology**                                                                               | **Civilisation, Dungeons, and Threats**                                                                                |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| Brass Plains           | Vast plate landscapes of gears, vents, access hatches, and slow moving assemblies. Day-night is defined by maintenance lighting cycles.                                | Brass composites, lubricants, gear flora, maintenance drones, scrap fauna, and simple machine parts.    | Salvage camps, construct caravans, maintenance stations, plain-spanning mechanisms, and mobile machine dungeons.       |
| Gearwood Assemblies    | Forests of articulated rods, cable vines, piston trunks, and self-repairing mechanical growth. Some systems cultivate organic-machine hybrids.                         | Cable fibre, actuator wood, logic sap, repair insects, construct wildlife, and hybrid seeds.            | Machine villages, biological-engineering factions, living assembly dungeons, repair projects, and rogue growth bosses. |
| Coolant Rivers         | Rivers, lakes, and waterfalls of specialised coolant fluids moving heat and data between sectors. Flow direction changes with system demand.                           | Coolant compounds, thermal crystals, filter organisms, maintenance fish, and heat-exchange materials.   | Canal cities, pump stations, coolant rights, flooded machine dungeons, and system-overheat events.                     |
| Archive Lattices       | Endless crystalline or metallic information forests storing maps, people, histories, designs, and damaged simulations. Data can manifest as terrain or entities.       | Archive shards, lost blueprints, memory cores, data spirits, security constructs, and knowledge keys.   | Research settlements, information markets, archive dungeons, identity ethics, and uploaded-mind factions.              |
| Broken Foundries       | Industrial belts where production lines continue without valid orders, creating defective machines, weapons, structures, and waste.                                    | World-engine alloy, machine cores, slag, volatile fuel, defective constructs, and fabrication modules.  | Industrial outposts, shutdown projects, factory dungeons, resource booms, and Furnace Heart threats.                   |
| Scrap Wastes           | Collapsed sectors filled with obsolete components, dead machines, rogue recyclers, and unstable remnants. The waste may conceal entire earlier versions of the Engine. | Scrap alloys, old cores, salvage relics, recycler fauna, toxic residues, and forgotten tools.           | Salvager cultures, nomadic constructs, buried sector dungeons, territorial recyclers, and restoration opportunities.   |
| Logic Storm Fields     | Regions where corrupted instructions, electromagnetic weather, and recursive commands rewrite machines, signs, routes, and sometimes living behaviour.                 | Logic crystals, error motes, rare control components, corrupted drones, and stabilisation materials.    | Quarantine stations, code rituals, shifting puzzle dungeons, faction sabotage, and Recursive General territories.      |
| Central Furnace Depths | The immense power and fabrication heart of the realm, surrounded by pressure, heat, security layers, and world-shaping machinery.                                      | Prime cores, furnace plasma, dimensional control alloys, high-tier catalysts, and custodian constructs. | Realm-climax megadungeons, control conflicts, repair or shutdown endings, and the Prime Custodian path.                |

## 17.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the artificial major realm topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 17.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 18. Ashen Lower Realms Atlas

| **Field**         | **Locked Direction**                                                                                                                                                                   |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.cluster.ashen_lower                                                                                                                                                              |
| Realm Class       | Realm Cluster                                                                                                                                                                          |
| Production Status | Late-game or optional high-risk cluster; individual lower realms can be discovered separately.                                                                                         |
| Core Fantasy      | Distinct hostile lower worlds shaped by heat, war, hunger, contracts, ambition, punishment, or corruption rather than one interchangeable hell.                                        |
| Topology          | A cluster of politically and physically separate subrealms connected by contract roads, furnace gates, siege corridors, ash seas, and contested border domains.                        |
| Defining Laws     | Contracts, ownership, debt, conquest, appetite, heat, and declared authority can become physical constraints. Each subrealm has its own law profile.                                   |
| Survival and Risk | Extreme heat, smoke, scarcity, coercive law, hostile politics, soul or debt risks, siege conditions, and dangerous industry require preparation and negotiation.                       |
| Access Families   | Pact gates, conquered portals, infernal embassies, war breaches, contract rituals, volcanic anchors, and deliberately opened lower routes.                                             |
| Civilisations     | Infernal city-states, contract houses, war realms, enslaved and emancipated peoples, mortal enclaves, industrial powers, rebel movements, and predatory sovereigns.                    |
| Realm Affinities  | Strong links to volcanic Overworld regions, Necropolis industry, World-Engine production, and Elemental fire. Divine and Verdant laws often conflict; Void offers dangerous shortcuts. |
| Overworld Utility | Infernal fuels, pact magic, heat industry, dangerous metallurgy, contract systems, demon politics, military threats, refugees, and moral consequences.                                 |
| Dungeon Families  | Contract fortresses; war furnaces; hunger basilicas; chain citadels; ash-sea prisons.                                                                                                  |
| Boss Hooks        | Contract Prince; War-Furnace Colossus; Hunger Queen; lower-realm sovereign.                                                                                                            |

## 18.1 Realm-biome family registry

| **Biome Family**    | **World Identity**                                                                                                                                            | **Resources and Ecology**                                                                            | **Civilisation, Dungeons, and Threats**                                                                                   |
|---------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------|
| Ember Marches       | Ash plains, lava canals, fortress roads, and military encampments shaped by continuous territorial conflict. Borders move with conquest.                      | Infernal ash, ember iron, war beasts, siege fungi, fire elementals, and battlefield salvage.         | War camps, fortified cities, siege dungeons, military contracts, invasions, and War-Furnace Colossus events.              |
| Red Ledger Dominion | Urban and rural territories where contracts, debts, permissions, and recorded ownership alter access, movement, and resource rights.                          | Ledger ink, oath metal, contract seals, bureaucratic imps, debt collectors, and legal relics.        | Contract cities, courts, archives, legal labyrinths, rebellion factions, and Contract Prince story paths.                 |
| Cinder Seas         | Oceans of ash, molten dust, and ember storms navigated by heat-proof vessels and chained islands. Visibility and buoyancy change with furnace cycles.         | Cinder pearls, ash glass, heat gas, sea demons, ember leviathans, and floating slag.                 | Infernal ports, prison islands, sea-fort dungeons, trade convoys, and ash leviathan bosses.                               |
| Hunger Pits         | Deep basins where scarcity and appetite have physical influence over creatures, terrain, and magic. Feeding systems can stabilise or empower the region.      | Hunger crystal, devourer organs, rare preserved food, predatory crops, and consumption catalysts.    | Survival settlements, ration politics, feeding rituals, biological dungeons, and Hunger Queen territories.                |
| War-Furnace Barrens | Industrial wastelands dominated by colossal forges that manufacture armies, weapons, and fortress components. Production alters weather and terrain.          | Infernal alloys, furnace cores, weapon parts, slag beasts, labour constructs, and volatile fuels.    | Factory cities, sabotage missions, production-line dungeons, worker uprisings, and machine-infernal hybrid bosses.        |
| Sootglass Gardens   | Artificial pleasure estates and black-glass forests cultivated by powerful houses. Beauty conceals surveillance, coercion, and predatory hospitality.         | Sootglass, rare spices, glamour ash, garden predators, contract flowers, and luxury goods.           | Court estates, intrigue settlements, masked festivals, garden dungeons, diplomatic routes, and sovereign hunts.           |
| Chainwind Heights   | Mountain and aerial domains crossed by hot winds, suspended fortresses, chains, lifts, and prison routes. Falling may bind travellers to lower jurisdictions. | Chain metal, hot wind essence, aerial demons, prison relics, and lift components.                    | Fortress monasteries, prison cities, chain dungeons, escape events, and aerial war bosses.                                |
| Black Ember Hollows | Remote cooling caverns where failed fires, abandoned pacts, refugees, and old weapons accumulate. Some hollows offer genuine sanctuary.                       | Black embers, pact residue, cold fire, scavenger fauna, escaped constructs, and forgotten contracts. | Rebel enclaves, hidden markets, abandoned dungeons, liberation stories, and routes to reform or destabilise lower powers. |

## 18.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the realm cluster topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 18.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 19. Void Between Atlas

| **Field**         | **Locked Direction**                                                                                                                                                                              |
|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.interstitial.void_between                                                                                                                                                                   |
| Realm Class       | Interstitial Realm                                                                                                                                                                                |
| Production Status | Late or endgame high-risk space used for shortcuts, rare resources, portal optimisation, and existential threats.                                                                                 |
| Core Fantasy      | The eroding space between destinations, containing unstable matter, broken routes, spatial shortcuts, dead stars, forbidden storage, and predators that consume identity, distance, or causality. |
| Topology          | Fragmented islands, rift seas, anchor chains, dead-star interiors, route graveyards, null deserts, and zones with no stable coordinate system.                                                    |
| Defining Laws     | Distance, direction, mass, memory, and sequence are unreliable without anchors. Matter decays toward null states. Unobserved structures may move or disappear.                                    |
| Survival and Risk | Void exposure, anchor loss, memory erosion, spatial shear, silence, matter decay, predatory attention, and irreversible route failure require redundant safeguards.                               |
| Access Families   | Portal malfunctions, deliberate void apertures, high-tier routing gates, dead portals, World-Engine systems, and emergency dimensional shortcuts.                                                 |
| Civilisations     | Anchor keepers, void navigators, stranded communities, predatory entities, salvage cults, artificial stations, and factions seeking control over shortcut routes.                                 |
| Realm Affinities  | Touches every realm but safely belongs to none. World-Engine and Created Pockets can impose temporary stability; Divine or Ancestral anchors protect identity; breaches spread severe risk.       |
| Overworld Utility | Voidstone, spatial logistics, dimensional storage, portal optimisation, high-risk magic, existential invasions, and powerful but dangerous shortcuts.                                             |
| Dungeon Families  | Anchor mazes; rift shipwrecks; null cathedrals; dead-star vaults; portal graveyards.                                                                                                              |
| Boss Hooks        | Rift Maw; Anchorless One; Dead-Star Larva; route-devouring world threat.                                                                                                                          |

## 19.1 Realm-biome family registry

| **Biome Family**        | **World Identity**                                                                                                                                      | **Resources and Ecology**                                                                        | **Civilisation, Dungeons, and Threats**                                                                                     |
|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|
| Null Deserts            | Flat expanses where colour, sound, matter, and stored energy slowly erode. Landmarks survive only when observed or anchored.                            | Void dust, null glass, decay catalysts, sparse anchor fauna, and resistant stone.                | Anchor camps, survey routes, disappearing ruins, endurance dungeons, and territory defined by beacon networks.              |
| Shattered Gravity Isles | Fragments orbit multiple invisible centres, colliding and separating along unstable routes. Local gravity can reverse without warning.                  | Gravity shards, voidstone, drifting minerals, shell creatures, spatial flora, and route anchors. | Void stations, salvage settlements, movement puzzles, island dungeons, and gravity predators.                               |
| Echo Forests            | Tree-like structures repeat sounds, memories, footsteps, and portal signatures until travellers cannot distinguish original from echo.                  | Echo wood, memory-resistant resin, mimic fauna, signal motes, and tracking reagents.             | Navigation trials, missing-expedition searches, deceptive dungeons, and identity-eating hunters.                            |
| Rift Seas               | Fluid spatial fractures crossed by anchor ships and portal buoys. Currents connect distant realms but may strand cargo in unrelated locations or times. | Rift fluid, portal salts, route crystals, void leviathans, and lost cargo.                       | Shipping lanes, smuggling, route warfare, shipwreck dungeons, and Rift Maw territories.                                     |
| Dead-Star Caverns       | Interior spaces inside cold stellar remnants containing impossible pressure, fossil light, and ancient structures protected by collapsed geometry.      | Dead-star metal, fossil light, dense cores, radiation organisms, and ancient relics.             | Sealed research bases, stellar dungeons, resource megaprojects, and Dead-Star Larva bosses.                                 |
| Memory Erosion Fields   | Zones that remove names, maps, ownership, relationships, and learned route data. Shared records and external anchors can resist loss.                   | Erosion crystal, blank relics, anti-memory compounds, nameless predators, and lost knowledge.    | High-risk story regions, rescue and restoration systems, archive dungeons, and cross-link to Ancestral Veil threats.        |
| Portal Graveyards       | Clusters of broken gates, failed expeditions, abandoned anchors, stranded settlements, and routes from many civilisations and eras.                     | Portal frames, mixed realm resources, anchor hearts, stranded fauna, and salvage technology.     | Multicultural survivor enclaves, archaeology, route repair, megadungeons made from overlapping gates, and faction conflict. |
| Anchorless Dark         | Deep regions with no stable reference, light, sequence, or return. Entry is usually temporary, event-driven, or realm-climax content.                   | Primal voidstone, impossible catalysts, rare predator remains, and reality-stabilising cores.    | Endgame expeditions, nonpersistent route windows, existential bosses, and consequences for the entire portal network.       |

## 19.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the interstitial realm topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 19.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 20. Divine Concords Atlas

| **Field**         | **Locked Direction**                                                                                                                                                                                   |
|-------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.network.divine_concords                                                                                                                                                                          |
| Realm Class       | Domain Network                                                                                                                                                                                         |
| Production Status | Story-dependent domain network; access and content depend on cultures, faiths, vows, and world history rather than one universal religion.                                                             |
| Core Fantasy      | Overlapping divine territories, pilgrim roads, sacred laws, miracles, abandoned sanctums, rival interpretations, and domains shaped by worship, duty, mercy, war, craft, knowledge, or natural forces. |
| Topology          | Separate domains connected by pilgrimage paths, visions, shrine networks, celestial courts, threshold cities, and contested concord spaces.                                                            |
| Defining Laws     | Each domain enforces one or more sacred principles. Intent, ritual status, vows, taboo, legitimacy, and divine recognition can matter as much as physical equipment.                                   |
| Survival and Risk | Hazards include overwhelming radiance, judgement, taboo violation, enforced truth, spiritual exhaustion, domain conflict, and loss of access rather than only environmental damage.                    |
| Access Families   | Shrines, pilgrimages, visions, divine invitations, relics, festivals, vows, rare physical gates, and faction or cultural recognition.                                                                  |
| Civilisations     | Divine servants, mortal pilgrims, saintly orders, theological factions, celestial bureaucracies, exiles, heretics, neutral custodians, and abandoned populations.                                      |
| Realm Affinities  | Strong links to Ancestral Veil, culture-specific Overworld faiths, and Elemental domains. Necropolis and Ashen routes may be enemies or treaty partners depending on doctrine.                         |
| Overworld Utility | Blessings, relics, sacred construction, religious stories, divine law conflicts, pilgrimage economies, miracles, and consequences for institutions rather than a simple good-aligned reward tier.      |
| Dungeon Families  | Trial domains; pilgrimage labyrinths; abandoned sanctuaries; law engines; celestial archives.                                                                                                          |
| Boss Hooks        | Law-Bound Herald; Fallen Saint; Concord Judge; domain sovereign or theological crisis.                                                                                                                 |

## 20.1 Realm-biome family registry

| **Biome Family**        | **World Identity**                                                                                                                                           | **Resources and Ecology**                                                                            | **Civilisation, Dungeons, and Threats**                                                                                  |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| Pilgrim Thresholds      | Neutral arrival regions of roads, hostels, shrines, gates, and interpretation halls. Different faiths maintain overlapping but not always compatible routes. | Pilgrim tokens, blessed water, threshold stone, messenger spirits, and ceremonial goods.             | Embassies, pilgrim settlements, route quests, introductory trials, customs conflicts, and safe return infrastructure.    |
| Law Gardens             | Beautiful landscapes where one sacred principle governs growth, movement, speech, ownership, or conflict. Breaking the law visibly changes terrain.          | Law seeds, sacred fibre, judgement crystals, symbolic fauna, and ritual materials.                   | Monastic settlements, law puzzles, garden dungeons, philosophical disputes, and Law-Bound Herald encounters.             |
| Radiant Tribunal Cities | Great cities of courts, archives, petition halls, relic vaults, and divine administration. Legitimacy and precedent shape access.                            | Concord metal, petition seals, relic fragments, archive spirits, and miracle catalysts.              | Political story hubs, divine courts, urban trial dungeons, faction appeals, and judgement-based outcomes.                |
| Mercy Wells             | Healing valleys, springs, shelters, and refuge domains where sanctuary is powerful but conditional. Exploiting protection can corrupt or close the realm.    | Mercy water, healing light, sanctuary stone, peaceful fauna, and restoration reagents.               | Hospitals, refugee communities, healing quests, sanctuary defence, and conflicts over who deserves protection.           |
| War-Saint Fields        | Battlefields, training grounds, memorial plains, and fortress monasteries shaped by doctrines of defence, sacrifice, honour, conquest, or righteous war.     | Saint steel, banner cloth, courage essence, celestial war beasts, and relic weapons.                 | Military orders, challenge dungeons, ideological conflicts, siege events, and Fallen Saint bosses.                       |
| Archive of Oaths        | Libraries and halls preserving vows, treaties, histories, names, and obligations across cultures and realms. Records can enforce or release binding states.  | Oath parchment, truth ink, archive light, record spirits, and legal relics.                          | Scholar settlements, treaty restoration, archive dungeons, cross-realm diplomacy, and disputes over erased history.      |
| Abandoned Sanctums      | Domains whose worship ended, deity vanished, law failed, or custodians withdrew. Miracles persist without guidance and may become dangerous.                 | Faded relics, orphan blessings, silent stone, feral divine beings, and lost doctrines.               | Archaeology, heretic refuges, restoration or closure quests, fallen-sanctum dungeons, and unknown divine threats.        |
| Concordant Firmament    | High connecting realm where multiple domains overlap around celestial routes, councils, and disputed borders. Conflicting laws create unstable zones.        | Concord resonance, celestial material, domain keys, messenger hosts, and rare harmonising catalysts. | Realm-scale diplomacy, cross-domain cities, law-conflict dungeons, major divine events, and a Concord Judge climax path. |

## 20.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the domain network topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 20.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 21. Necropolis Domains Atlas

| **Field**         | **Locked Direction**                                                                                                                                                                                                          |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.cluster.necropolis_domains                                                                                                                                                                                              |
| Realm Class       | Artificial and Death-Touched Realm Cluster                                                                                                                                                                                    |
| Production Status | Optional major branch for undead diplomacy, necromancy, soul ethics, forbidden labour, and death-linked civilisation; not all domains or residents are hostile.                                                               |
| Core Fantasy      | Necromantic empires, sealed death industries, memorial states, soul infrastructure, undead agriculture, and societies where death becomes administration, labour, citizenship, inheritance, and conflict.                     |
| Topology          | Bone cities, lantern plains, soul canals, quiet farms, sepulchral courts, abandoned deadlands, industrial necropoles, and sealed sovereign crypts linked by mortuary roads.                                                   |
| Defining Laws     | Life, death, soul, identity, ownership of remains, memory, and reanimation differ by domain. A body, spirit, memory record, and legal person may be treated as separate entities.                                             |
| Survival and Risk | Soul drain, necrotic atmosphere, disease, possession, corpse law, restricted movement, unfamiliar supply needs, and social prohibitions create risk. Undead residents may have entirely different needs from living visitors. |
| Access Families   | Necromantic gates, funerary empires, spirit treaties, cursed ruins, corpse roads, soul engines, sanctioned diplomatic portals, and rare breaches from mass-death sites.                                                       |
| Civilisations     | Undead citizens, living minorities, necromancer houses, memorial republics, bone industries, soul-rights movements, grave custodians, death cults, and factions opposing coerced reanimation.                                 |
| Realm Affinities  | Strong links to the Ancestral Veil and Ashen industry. Divine relations vary by doctrine. World-Engine labour systems are controversial; Verdant life magic may heal, liberate, or destabilise death-touched systems.         |
| Overworld Utility | Necromancy, soul ethics, bone industry, undead diplomacy, memorial technology, forbidden labour, disease control, and consequences for graves, war dead, inheritance, and displaced spirits.                                  |
| Dungeon Families  | Boneworks; soul reservoirs; sepulchral courts; dead-empire transit systems; sealed sovereign crypts.                                                                                                                          |
| Boss Hooks        | Bone Emperor; Soul Tax Collector; Unquiet City Mind; necromantic sovereign or liberation crisis.                                                                                                                              |

## 21.1 Realm-biome family registry

| **Biome Family**          | **World Identity**                                                                                                                                             | **Resources and Ecology**                                                                                          | **Civilisation, Dungeons, and Threats**                                                                                                     |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| Bonefoundry Districts     | Industrial necropoles that refine bone, shell, ash, and funerary materials into construction pieces, tools, replacement bodies, and machines.                  | Bone alloys, marrow fuel, ash cement, soul-safe tools, skeletal constructs, and industrial reagents.               | Foundry cities, labour factions, factory dungeons, ethical supply disputes, and Bone Emperor production territories.                        |
| Lantern Cities            | Dense urban regions illuminated by regulated soul lanterns. Spirit traffic, citizenship after death, and memory registration shape daily life.                 | Soul lanterns, identity seals, ghostglass, civic records, messenger spirits, and memorial goods.                   | Undead city-states, living districts, bureaucracy quests, urban dungeons, rights movements, and Soul Tax Collector encounters.              |
| Quiet Agricultural Fields | Dim agricultural provinces worked by undead, constructs, and living farmers using crops adapted to ash-rich soil and low sunlight.                             | Grave grain, pale root crops, funerary herbs, bone fertiliser, farm constructs, and nocturnal livestock.           | Rural communes, food diplomacy, abandoned farm dungeons, labour reform, and crop blight events.                                             |
| Soul Reservoirs           | Lakes, wells, towers, and containment basins storing spirit energy, memories, or unclaimed souls. Extraction can power cities but risks identity loss.         | Soul condensate, memory sediment, containment crystal, reservoir spirits, and high-tier magical fuel.              | Custodian stations, power disputes, reservoir dungeons, containment failures, and soul-liberation story paths.                              |
| Mortuary Canals           | Canal networks transporting bodies, spirits, goods, legal records, and ritual materials between domains. Currents follow funerary authority more than gravity. | Canal salts, embalming plants, ferry tokens, drowned relics, mortuary fauna, and transport components.             | Canal settlements, ferryman guilds, smuggling routes, submerged dungeons, and disputes over stolen remains.                                 |
| Sepulchral Courts         | Palatial necropolises governed by dynasties, councils, liches, elected dead, or memorial institutions. Social status can continue or change after death.       | Court relics, oath bone, ceremonial cloth, legal soul seals, guardian dead, and historical knowledge.              | Political capitals, succession stories, court dungeons, diplomatic missions, and necromantic sovereign confrontations.                      |
| Unclaimed Deadlands       | Battlefields, ruined settlements, and wastes filled with unregistered dead, broken rites, soul storms, and communities beyond recognised law.                  | Unbound essence, battlefield salvage, cursed metal, wandering spirits, scavenger undead, and cleansing materials.  | Refugee enclaves, grave-recovery projects, open-world lairs, soul-storm events, and the Unquiet City Mind threat.                           |
| Crown Crypt Megalopolis   | A layered city-tomb built across many eras, containing royal districts, public housing for the dead, sealed histories, and city-scale machinery.               | Sovereign remains, ancient bone alloys, crown relics, urban soul cores, archival dead, and forbidden technologies. | Realm-climax megadungeon, competing governments, restoration or dismantling choices, and a city-scale boss or negotiated transfer of power. |

## 21.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the artificial and death-touched realm cluster topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 21.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 22. Elemental Confluences Atlas

| **Field**         | **Locked Direction**                                                                                                                                                                                  |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.cluster.elemental_confluences                                                                                                                                                                   |
| Realm Class       | Primordial Realm Cluster                                                                                                                                                                              |
| Production Status | Mid- or late-game branching cluster of mixed elemental ecologies, industries, cultures, and climate systems.                                                                                          |
| Core Fantasy      | Mixed elemental worlds where fire, water, air, earth, ice, lightning, pressure, ash, crystal, and living matter meet, separate, cycle, and conflict.                                                  |
| Topology          | Elemental flows cross through deltas, reefs, forests, deserts, shelves, calderas, storm belts, pressure zones, and central convergence hearts.                                                        |
| Defining Laws     | Matter and energy transform more readily than in the Overworld. Regional balance changes terrain and ecology; drawing heavily from one flow may strengthen, redirect, or starve another.              |
| Survival and Risk | Extreme temperature, pressure, conductivity, corrosion, weather, phase change, elemental saturation, and rapidly changing terrain require specialised equipment and infrastructure.                   |
| Access Families   | Elemental shrines, leyline nexuses, storm gates, volcanic anchors, deep vents, climate rituals, natural breaches, and engineered resonance portals.                                                   |
| Civilisations     | Elemental peoples, mixed-material cultures, ritual engineers, climate custodians, mobile settlements, mining powers, storm navigators, and factions disputing control of shared flows.                |
| Realm Affinities  | Strong links to natural Overworld biomes, the Verdant Covenant, Aetheric Reach, Impossible Deep, and Ashen Lower Realms. Void breaches and World-Engine extraction can destabilise elemental balance. |
| Overworld Utility | Power generation, elemental materials, climate control, catalysts, agricultural modification, environmental restoration, weather hazards, and large-scale industry.                                   |
| Dungeon Families  | Confluence crucibles; stormroot temples; frostfire calderas; pressure reefs; elemental balance engines.                                                                                               |
| Boss Hooks        | Convergence Titan; Stormroot Colossus; Frostfire Dragon; primal elemental sovereign.                                                                                                                  |

## 22.1 Realm-biome family registry

| **Biome Family**       | **World Identity**                                                                                                                   | **Resources and Ecology**                                                                                          | **Civilisation, Dungeons, and Threats**                                                                                               |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Steam Bloom Marshes    | Hot springs, cold runoff, mineral wetlands, and constant steam support explosive plant growth and unstable visibility.               | Steam bulbs, mineral reeds, thermal algae, pressure amphibians, mist spirits, and heat-exchange catalysts.         | Stilt settlements, geothermal farms, steam dungeons, pressure eruptions, and regional climate-control projects.                       |
| Glassstorm Deserts     | Silica deserts crossed by lightning, heat fronts, and abrasive winds that melt and shatter dunes into temporary glass terrain.       | Stormglass, charged sand, lightning crystal, burrowing predators, glass flora, and conductive alloys.              | Shielded caravans, lightning collectors, glass labyrinths, storm migrations, and roaming elemental bosses.                            |
| Thunderroot Forests    | Forests whose deep roots store charge and whose crowns attract continuous storms. Trees communicate through electrical pulses.       | Thunderwood, charge sap, conductive fibre, storm fruit, electric fauna, and lightning cores.                       | Root settlements, power networks, stormroot temples, forest outages, and the Stormroot Colossus territory.                            |
| Frostfire Shelves      | Terraced landscapes where cold flame, ice magma, and opposing thermal currents coexist in unstable equilibrium.                      | Frostfire crystal, cold ash, thermal skins, dual-aspect creatures, and high-tier forge catalysts.                  | Research enclaves, thermal forges, shifting shelf dungeons, balance crises, and Frostfire Dragon encounters.                          |
| Stoneflow Deltas       | Slow rivers of semi-fluid stone divide into channels, islands, and mineral wetlands before hardening into new land.                  | Flowstone, fresh ore nodules, stone reeds, burrowing elementals, and construction catalysts.                       | Mobile quarry settlements, bridge-building challenges, delta dungeons, territorial mining conflicts, and terrain-growth events.       |
| Ashwater Calderas      | Volcanic basins where ash, mineral water, acidic rain, and geothermal life create dangerous but fertile ecosystems.                  | Ashwater salts, volcanic herbs, heat-resistant fish, corrosion glands, and alchemical minerals.                    | Caldera towns, medicinal industries, submerged forge ruins, eruption events, and contested thermal resources.                         |
| Crystal Pressure Reefs | Dense reefs grown under immense elemental pressure, combining crystal, water, stone, and compressed air pockets.                     | Pressure crystal, reef metal, resonance coral, armoured fauna, and deep-energy cores.                              | Pressure habitats, mining platforms, reef labyrinths, decompression hazards, and leviathan-scale elemental threats.                   |
| Convergence Heart      | A realm-centre where many elemental flows meet around unstable terrain, enormous engines, primal life, and contested control points. | Primal catalysts, convergence cores, multi-element materials, rare sovereign fauna, and climate-shaping resources. | Realm-scale settlements, balance-engine megadungeons, faction summits, world-changing rituals, and the Convergence Titan climax path. |

## 22.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the primordial realm cluster topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 22.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 23. Created Pockets Atlas

| **Field**         | **Locked Direction**                                                                                                                                                                               |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Stable ID         | realm.family.created_pockets                                                                                                                                                                       |
| Realm Class       | Pocket Realm Family                                                                                                                                                                                |
| Production Status | Late utility and story system, although individual pockets may appear much earlier as ruins, prisons, vaults, sanctuaries, or experiments.                                                         |
| Core Fantasy      | Bounded realities made by players, factions, relics, structures, gods, machines, dreams, or ancient civilisations for storage, farming, refuge, research, imprisonment, testing, or secrecy.       |
| Topology          | Finite modules with explicit boundaries, capacity, entrances, internal topology, stability, ownership, and persistence rules. Pockets can nest, link into networks, or detach from their creators. |
| Defining Laws     | The creator or template defines gravity, time, climate, permissions, capacity, reset behaviour, persistence, exits, and simulation scope. Damaged pockets may violate their own rules.             |
| Survival and Risk | Isolation, collapse, depletion, time distortion, hostile ownership, failed exits, unstable rules, limited ecosystems, and contamination from connected realms are the primary hazards.             |
| Access Families   | Keys, portable gates, relics, machine apertures, ritual doors, divine invitations, dream anchors, structure-bound portals, and emergency escape devices.                                           |
| Civilisations     | Caretakers, prisoners, researchers, refugees, constructs, simulated people, contained ecosystems, abandoned populations, and communities born inside a pocket.                                     |
| Realm Affinities  | Any realm can create or contaminate a pocket. World-Engine systems improve control; Void exposure increases instability; Divine, Dream, and Spirit influences can change identity and persistence. |
| Overworld Utility | Vaults, farms, laboratories, trials, sanctuaries, prisons, storage, shelters, controlled habitats, temporary construction space, and high-tier settlement infrastructure.                          |
| Dungeon Families  | Trial pockets; failed laboratories; prison loops; vault networks; abandoned sanctuaries; recursive prototypes.                                                                                     |
| Boss Hooks        | Escaped Prototype; Pocket Warden; Failed Creator Echo; instability entity or hostile pocket intelligence.                                                                                          |

## 23.1 Realm-biome family registry

| **Biome Family**      | **World Identity**                                                                                                                                          | **Resources and Ecology**                                                                                       | **Civilisation, Dungeons, and Threats**                                                                                                                           |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Vault Pockets         | Compact secure spaces designed for valuables, archives, strategic supplies, or dangerous relics. Security may remain active after ownership is lost.        | Stored resources, vault alloys, lock cores, guardian constructs, preservation fields, and mixed-era treasure.   | Treasury infrastructure, heist dungeons, inheritance disputes, malfunctioning defences, and Pocket Warden encounters.                                             |
| Sanctuary Gardens     | Controlled habitats built for refuge, healing, conservation, or diplomatic neutrality. Their serenity depends on stable life-support rules.                 | Rare plants, sanctuary water, preserved species, healing resources, caretaker constructs, and climate controls. | Refugee settlements, conservation projects, sanctuary breaches, peaceful story hubs, and protection-focused outcomes.                                             |
| Trial Arenas          | Rule-bound testing environments for combat, puzzles, rituals, education, certification, or entertainment. Layouts may reset or adapt.                       | Challenge tokens, training relics, simulated materials, arena constructs, and performance records.              | Repeatable trials, faction competitions, puzzle dungeons, progression tests, and escaped challenge entities.                                                      |
| Research Laboratories | Isolated experimental worlds used for dangerous magic, ecology, automation, dimensional physics, or creature design.                                        | Prototype components, research notes, altered organisms, unstable catalysts, and experimental machines.         | Research outposts, failed-lab dungeons, ethical investigations, containment emergencies, and Escaped Prototype bosses.                                            |
| Bounded Farms         | Finite agricultural pockets optimised for crops, livestock, fungi, aquaculture, or magical resources. Poor balance can exhaust the entire closed ecosystem. | High-yield crops, breeding stock, nutrient loops, farm constructs, climate modules, and specialised soils.      | Settlement supply systems, agricultural factions, ecosystem management, invasive outbreaks, and famine-prevention projects.                                       |
| Prison Realms         | Containment spaces designed for individuals, armies, monsters, ideas, diseases, or forbidden technologies. Some have developed societies inside.            | Containment seals, prison alloys, restricted relics, adapted populations, and dangerous prisoners.              | Escape dungeons, moral choices, prison communities, jurisdiction conflicts, and Pocket Warden or prisoner-sovereign paths.                                        |
| Memory Archives       | Pocket worlds that preserve locations, people, events, cultures, or simulations as navigable environments. Records may believe they are alive.              | Memory architecture, archive keys, historical objects, simulated inhabitants, and truth fragments.              | Historical investigation, archive settlements, identity disputes, reconstruction quests, and Failed Creator Echo encounters.                                      |
| Unstable Prototypes   | Incomplete or damaged pockets with failing boundaries, contradictory rules, recursive spaces, and leaking inhabitants.                                      | Instability matter, broken anchors, mixed-realm resources, anomalous creatures, and prototype control cores.    | Procedural anomaly dungeons, emergency stabilisation, realm leaks, recursive boss encounters, and choices to repair, evacuate, repurpose, or collapse the pocket. |

## 23.2 Regional, transitional, and hidden layers

- Generation combines the eight biome families into regional mosaics based on the pocket realm family topology rather than scattering them as isolated patches.

- Transition regions inherit laws and resources from both neighbouring families and must explain major changes in terrain, atmosphere, social control, or ecology.

- Hidden layers, restricted territories, deep regions, sovereign spaces, and climax sites are unlocked by route knowledge, diplomacy, infrastructure, world state, or deliberate risk.

- Settlements adapt to local survival and law conditions; imported Overworld designs require realm-specific foundations, materials, utilities, and maintenance.

- Dungeon entrances, boss territories, resource deposits, and settlements use suitability fields rather than fixed coordinates or one guaranteed arrangement.

## 23.3 Dynamic states and cross-realm effects

- Biome families support baseline, disturbed, occupied, exploited, fortified, corrupted, stabilised, abandoned, restored, and realm-event variants where appropriate.

- Route activity can introduce foreign creatures, crops, diseases, machines, magic, weather, laws, trade goods, refugees, invaders, and cultural influence.

- Major boss, sovereign, faction, or infrastructure outcomes can change route safety, settlement viability, resource access, dungeon occupation, and the realm relationship graph.

- The world records lasting evidence through changed blocks, structures, ownership, ecology, NPC memory, maps, Codex entries, trade, and event history.

# 24. Dimension Dungeons and Megadungeons

Dimension dungeons are generated from the realm’s laws, history, ecology, infrastructure, factions, and dynamic state. They are not Overworld layouts with a new material palette. At least one navigation, puzzle, survival, social, time, memory, gravity, law, power, or transformation mechanic must depend on the destination realm.

| **Dimension-Dungeon Rule**                                                                                                                                                                                                                                                                    |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A dimension dungeon must contain at least one core mechanic that would not function identically in an ordinary Overworld dungeon. The mechanic must influence traversal, choices, combat, resource management, social interaction, or the dungeon’s persistent outcome—not only presentation. |

| **Realm**             | **Provisional Dungeon Families**                                                                               | **Realm-Specific Mechanic Requirement**                                                                      |
|-----------------------|----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Verdant Covenant      | Living palace roots; broken covenant gardens; thorn-hunt labyrinths; rot-heart groves; seasonal vaults.        | Living rooms regrow, remember oaths, and alter routes according to season or court permission.               |
| Ancestral Veil        | Processional necropolises; memory archives; spirit courts; drowned remembrance halls; devouring-silence zones. | Relationships, names, remembrance, and recovered truth determine which spaces become solid or reachable.     |
| Somnolent Expanse     | Lucid observatories; nightmare nests; memory theatres; waking labyrinths; prophecy engines.                    | Lucidity, expectation, fear, dream logic, and waking conditions reshape layout and inhabitants.              |
| Aetheric Reach        | Skyforts; storm temples; fallen airship graveyards; thunderhead citadels; underside vaults.                    | Gravity, buoyancy, windways, storm charge, and moving islands determine traversal and combat.                |
| Impossible Deep       | Pressure vaults; inverted mines; fossil cities; seismic forges; blackwater citadels.                           | Pressure, flooding, heat, seismic movement, and vertical supply lines change the dungeon over time.          |
| World-Engine          | Logic vaults; foundry spines; archive sectors; rogue assemblies; coolant labyrinths.                           | Players reroute power, permissions, coolant, production orders, and machine logic to reconfigure sectors.    |
| Ashen Lower Realms    | Contract fortresses; war furnaces; hunger basilicas; chain citadels; ash-sea prisons.                          | Contracts, declared ownership, debt, hunger, heat, or conquest rules constrain actions and exits.            |
| Void Between          | Anchor mazes; rift shipwrecks; null cathedrals; dead-star vaults; portal graveyards.                           | Anchors, observation, memory, sequence, and spatial links determine whether rooms continue to exist.         |
| Divine Concords       | Trial domains; pilgrimage labyrinths; abandoned sanctuaries; law engines; celestial archives.                  | Vows, taboo, intent, truth, legitimacy, and domain law create nonphysical permissions and consequences.      |
| Necropolis Domains    | Boneworks; soul reservoirs; sepulchral courts; dead-empire transit systems; sealed sovereign crypts.           | Body, spirit, memory, remains ownership, citizenship, and soul infrastructure can be separate puzzle layers. |
| Elemental Confluences | Confluence crucibles; stormroot temples; frostfire calderas; pressure reefs; elemental balance engines.        | Players balance flows, phase states, conductivity, pressure, temperature, and terrain transformation.        |
| Created Pockets       | Trial pockets; failed laboratories; prison loops; vault networks; abandoned sanctuaries; recursive prototypes. | Capacity, creator rules, resets, recursion, boundary stability, ownership, and exits define the entire site. |

## 24.1 Dungeon scale and persistence

| **Dungeon scale**          | **Realm use**                                                                                                                   | **Persistence expectation**                                                                                     |
|----------------------------|---------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
| Micro-site                 | Shrine, lair, route station, failed portal room, research cell, spirit pocket, or sealed vault.                                 | Usually persists in cleared, claimed, restored, reoccupied, or collapsed state.                                 |
| Standard dungeon           | Multi-room generated site with one or more law-driven mechanics, faction state, resources, and climax.                          | Persistent world evidence; may receive new occupants rather than reset invisibly.                               |
| Grand dungeon              | Large multi-zone site connected to regional history, settlement, route, sovereign, or major resource system.                    | Long-term projects, partial clears, shortcuts, faction control, and multiple outcomes.                          |
| Megadungeon                | Realm-scale city, engine, root system, dead star, crypt, archive, or law complex spanning several visits and simulation states. | Major world-state record with staged progression, internal settlements, multiple bosses, and durable aftermath. |
| Mobile or shifting dungeon | Dream, storm, living organism, fleet, migration, moving island, machine sector, or Void route.                                  | Position and access can change; discovered identity and internal progress remain stable.                        |

## 24.2 Dungeon state model

- Undiscovered, rumoured, located, entered, mapped, partially explored, and understood knowledge states are tracked separately.

- Dormant, active, occupied, contested, damaged, flooded, corrupted, unstable, sealed, conquered, cleansed, restored, claimed, converted, and collapsed world states may apply.

- Loot, boss, puzzle, route, power, population, ownership, and structural state persist independently where necessary.

- Distant simulation updates ownership, danger, resource pressure, repair, reoccupation, and major events without simulating every room.

- A dungeon can become a settlement, mine, research site, fortress, shrine, route station, prison, farm, or ruin after resolution if its structure and laws allow it.

# 25. Realm Bosses, Guardians, and Sovereigns

Realm bosses occupy a world role before combat begins. They may be apex creatures, guardians, rulers, city minds, machine intelligences, contract authorities, divine agents, ecological regulators, catastrophes, or political crises. Killing is only one valid resolution when the fiction and mechanics support alternatives.

| **Realm**             | **Boss, Guardian, or Sovereign Hooks**                                                                    | **Required Regional Aftermath**                                                                  |
|-----------------------|-----------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| Verdant Covenant      | Seasonal Regent; Rot-Crowned Hart; Oathbreaker Thorn; court champion or sovereign conflict.               | Season, court law, migration, blight, and living terrain change according to the outcome.        |
| Ancestral Veil        | Memory Eater; Uncrowned Ancestor; Ferryman Sovereign; predatory lineage spirit.                           | Memory, burial, ancestor access, identity, and lost-history recovery change.                     |
| Somnolent Expanse     | Nightmare Architect; Sleeping Oracle; Waking Devourer; collective fear sovereign.                         | Nightmare pressure, prophecy, sleep safety, and shared dream routes change.                      |
| Aetheric Reach        | Tempest Leviathan; Sky-King Automaton; Thunder Roc; storm sovereign.                                      | Storm patterns, altitude routes, floating settlements, and sky trade change.                     |
| Impossible Deep       | Pressure Titan; Coreworm; Fossil Sovereign; seismic world-beast.                                          | Pressure stability, seismic danger, forge access, deep settlements, and tunnel routes change.    |
| World-Engine          | Prime Custodian; Furnace Heart; Recursive General; sector-scale machine intelligence.                     | Sector control, production, machine rights, realm repair, and cross-realm infrastructure change. |
| Ashen Lower Realms    | Contract Prince; War-Furnace Colossus; Hunger Queen; lower-realm sovereign.                               | Contracts, wars, refugees, heat industry, realm invasions, and political legitimacy change.      |
| Void Between          | Rift Maw; Anchorless One; Dead-Star Larva; route-devouring world threat.                                  | Portal stability, shortcuts, anchor networks, existential pressure, and route safety change.     |
| Divine Concords       | Law-Bound Herald; Fallen Saint; Concord Judge; domain sovereign or theological crisis.                    | Domain law, blessings, pilgrimage access, institutions, and theological politics change.         |
| Necropolis Domains    | Bone Emperor; Soul Tax Collector; Unquiet City Mind; necromantic sovereign or liberation crisis.          | Soul rights, reanimation law, memorial practice, undead diplomacy, and grave safety change.      |
| Elemental Confluences | Convergence Titan; Stormroot Colossus; Frostfire Dragon; primal elemental sovereign.                      | Climate, energy balance, disasters, resources, and elemental migrations change.                  |
| Created Pockets       | Escaped Prototype; Pocket Warden; Failed Creator Echo; instability entity or hostile pocket intelligence. | Ownership, capacity, stability, trapped populations, and whether the pocket persists change.     |

## 25.1 Boss resolution families

- Defeat or kill: removes or transforms the threat, potentially destabilising the ecological or political role it fulfilled.

- Cleanse or restore: separates corruption, damage, possession, malfunction, or imposed law from the underlying being or system.

- Seal or contain: creates an ongoing infrastructure, maintenance, faction, or moral responsibility.

- Bargain or recognise sovereignty: changes laws, tribute, access, diplomacy, trade, and faction relations.

- Bind or recruit: converts the entity into a guardian, infrastructure component, ally, mount, summoned force, or dangerous dependent.

- Relocate or redirect: moves pressure into another region or realm, creating new consequences rather than erasing it.

- Reform or transfer control: changes a city mind, divine institution, court, machine sector, necromantic state, or pocket ownership without a conventional kill.

## 25.2 Boss territory and recurrence

- Territory is signposted through weather, ecology, structures, NPC behaviour, resources, damage, sounds, tracks, law effects, or route disruption.

- Unique sovereigns normally persist as world-state entities and do not respawn without an explicit succession, resurrection, simulation, or cyclical rule.

- Species bosses may be replaced through migration, breeding, promotion, faction succession, or ecological recovery.

- Wandering bosses have schedules, migration corridors, retreat logic, settlement impact, and discoverable warnings.

- Boss rewards include knowledge, route change, materials, faction outcomes, infrastructure, settlement safety, and world-state access—not only gear.

# 26. Dynamic States and Cross-Realm Consequences

| **State family**          | **Examples**                                                                                                              | **Cross-system result**                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| Route state               | Hidden, stable, costly, seasonal, contested, blockaded, damaged, one-way, leaking, collapsed, repaired.                   | Travel, trade, migration, invasion, quest availability, and logistics change.               |
| Realm environmental state | Balanced, blighted, storm-active, pressure-failing, overheating, memory-eroding, overgrown, law-conflicted, stabilised.   | Biome overlays, hazards, resources, creatures, settlements, and VFX change.                 |
| Political state           | Peace, treaty, cold conflict, succession, occupation, rebellion, trade compact, quarantine, holy dispute, machine schism. | NPCs, permissions, prices, patrols, routes, dungeons, raids, and stories change.            |
| Ecology state             | Stable, invasive, overhunted, predator collapse, migration, outbreak, extinction risk, restoration, engineered.           | Spawns, agriculture, village needs, resources, events, and boss pressure change.            |
| Infrastructure state      | Unpowered, supplied, overloaded, abandoned, captured, corrupted, repaired, expanded, automated.                           | Production, wards, settlements, dungeon access, route safety, and regional survival change. |
| Knowledge state           | Unknown, rumoured, disputed, mapped, translated, scientifically tested, culturally restricted, deliberately concealed.    | Codex, maps, dialogue, recipes, route confidence, and player decision quality change.       |

## 26.1 Leakage and exchange

- Realm leaks can alter Overworld biomes without converting them into full dimensions: dream weather, spirit visibility, floating fragments, elemental storms, living growth, undead activity, machine terrain, divine law zones, or Void scars.

- Trade can introduce crops, livestock, construction materials, rituals, machine components, beliefs, laws, diseases, invasive species, and political dependencies.

- Closing a route can protect one side while stranding migrants, collapsing trade, starving infrastructure, preventing funerary rites, or breaking treaties.

- Opening high-throughput logistics can enrich settlements while enabling extraction, colonisation, military expansion, pollution, or loss of local control.

- Cross-realm outcomes are recorded in regional history and should appear through structures, NPC memory, ownership, ecology, maps, dialogue, and altered generation for newly explored areas where appropriate.

# 27. Discovery, Rumours, Maps, and Codex

The Atlas separates developer truth from cultural belief and player knowledge. A realm, creature, ruler, ruin, or route may have multiple names and interpretations. Maps can be incomplete, symbolic, political, dream-derived, spirit-recorded, machine-precise, intentionally false, or unstable under changing laws.

| **Knowledge layer** | **Stored meaning**                                                                                                |
|---------------------|-------------------------------------------------------------------------------------------------------------------|
| Developer truth     | Stable IDs, generation facts, simulation rules, real relationships, and hidden state used by the game.            |
| Cultural account    | What a culture believes, teaches, fears, venerates, or claims about the realm.                                    |
| Faction claim       | Political, religious, economic, military, legal, or historical interpretation promoted by a faction.              |
| Rumour              | Unverified clue with source, confidence, age, region, possible distortion, and expiration or correction rule.     |
| Player observation  | Seen biomes, routes, creatures, materials, structures, hazards, and outcomes.                                     |
| Tested knowledge    | Mechanically confirmed law, recipe, weakness, route condition, resource property, or ecological relationship.     |
| Codex synthesis     | Player-facing summary that records certainty, contradictions, alternate names, sources, and unresolved questions. |

## 27.1 Mapping requirements

- Maps record discovered topology without revealing undiscovered route graph or hidden layers by default.

- Unstable realms can display confidence, last-confirmed state, anchor coverage, or expected drift rather than false precision.

- Cultural maps may prioritise pilgrimage, trade, spirit relationships, winds, roots, laws, or machine sectors instead of geometric distance.

- Shared multiplayer knowledge tracks world discovery plus optional individual notes, annotations, rumours, and language comprehension.

- Route maps expose stability, directionality, cost, permission, active hazards, return confidence, and ownership.

# 28. Visual, Audio, VFX, and Forge Requirements

| **Presentation layer**  | **Atlas fields and production needs**                                                                                                                                 |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Silhouette and topology | Horizon language, verticality, dominant forms, landmark scale, route shapes, settlement profiles, dungeon entrances, and boss-territory evidence.                     |
| Material palette        | Native block families, construction materials, organic or machine surfaces, wear, age, corruption, cleansing, faction variants, and foreign-material reactions.       |
| Lighting and sky        | Sky model, light sources, day cycle, stars, weather, fog, realm glow, shadow behaviour, visibility, and accessibility alternatives.                                   |
| Environmental movement  | Wind, currents, floating matter, roots, particles, machinery, spirits, dream changes, fluid flows, ash, snow, pollen, or gravity effects.                             |
| Audio identity          | Ambient beds, biome layers, weather, creature ecology, settlement activity, portal tones, law warnings, dungeon acoustics, and boss territory signals.                |
| VFX identity            | Portal transitions, mana or power flow, hazards, law effects, status readability, route stability, corruption, restoration, and realm leakage.                        |
| UI and map language     | Realm icon, biome icons, route symbols, hazard badges, law warnings, stability, permissions, return state, and colour-independent readability.                        |
| Forge attachments       | Entity models, modular biome kits, structure sets, sockets, animation events, material families, audio hooks, VFX sockets, LODs, collisions, and validation metadata. |

| **Production Boundary**                                                                                                                                                                                                                                                                                                                                        |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The Atlas defines identity, readability, relationships, required attachment points, and asset-family coverage. Dedicated Forge, Audio, and VFX documents define creation tools and pipelines. Realm definitions must still reserve stable event, socket, material, effect, and sound references so those systems can attach without redesigning world content. |

# 29. Simulation LOD, Persistence, Multiplayer, and Save Safety

| **Simulation range** | **Realm behaviour**                                                                                                                                         |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Active local         | Full voxel interaction, actors, AI, combat, physics, portals, machines, NPC schedules, ecology, dungeon mechanics, effects, and authority validation.       |
| Active regional      | Reduced agents, aggregated populations, scheduled jobs, route traffic, power and resource graphs, boss movement, settlement projects, and event triggers.   |
| Inactive realm       | Compact region summaries for population, ownership, resources, ecology pressure, route state, dungeon state, boss state, infrastructure, and major events.  |
| Dormant pocket       | Explicit pause, reduced tick, or continued simulation based on pocket definition, creator rule, multiplayer state, and world settings.                      |
| Reactivation         | Deterministic elapsed-time reconciliation, bounded catch-up, event summaries, identity preservation, and promotion of persistent records into local actors. |

## 29.1 Required persistent records

- Realm instance ID, definition ID, derived seed, worldgen version, content manifest, generated region graph, and law profile.

- Route and anchor records with endpoints, direction, owner, permission, stability, cost, discovery, return state, damage, and last use.

- Settlement, faction, population, migration, supply, sovereignty, project, damage, and history summaries.

- Dungeon identity, generated layout seed, discovered areas, ownership, occupants, bosses, loot state, puzzles, power, damage, conversion, and aftermath.

- Boss identity, territory, phase or condition, movement, relationships, injuries, outcome, succession, and regional consequences.

- Ecology populations, invasive pressure, protected species, migration, extraction, corruption, restoration, and event state.

- Player and group knowledge, maps, Codex certainty, language comprehension, permissions, treaties, contracts, vows, and rescue state.

## 29.2 Multiplayer rules

- The authoritative host or server owns realm state, route transactions, portal use, inventories, boss outcomes, dungeon state, and settlement changes.

- Players can occupy different realms concurrently within server capacity; unloaded realms use summary simulation.

- Portal travel is an explicit transition with party policy, ownership checks, arrival reservation, failure handling, reconnection, and split-screen compatibility.

- Shared world outcomes coexist with individual reputation, knowledge, vows, contracts, crimes, permissions, and quest contribution where appropriate.

- Disconnect and crash recovery must place players at a validated saved position, arrival anchor, rescue state, or safe fallback—not invalid void coordinates.

# 30. Data Models, Registries, Validation, Seed Testing, and Production Gates

## 30.1 Core registry records

| **Registry**             | **Required key fields**                                                                                                                                                                   |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| RealmDefinition          | id, class, display keys, topology profile, law profile, seed salt, region budget, biome pool, affinities, access categories, survival profile, simulation policy, content status.         |
| RealmBiomeDefinition     | id, parent realm, region roles, law modifiers, terrain profile, resources, ecology slots, settlement suitability, dungeon and boss suitability, transitions, dynamic variants, asset set. |
| RealmRouteDefinition     | id, origin/destination selectors, route class, anchor types, requirements, directionality, costs, permissions, stability, return policy, risks, events, presentation.                     |
| RealmRegionRecord        | instance ID, realm instance, seed, biome graph, laws, ownership, settlements, resources, ecology, dungeons, bosses, routes, dynamic state, history.                                       |
| RealmLawProfile          | gravity, time, atmosphere, survival, matter, magic, death, navigation, identity, ownership, social law hooks, and UI warning keys.                                                        |
| PocketRealmDefinition    | id, creator class, boundary, capacity, topology, law overrides, simulation mode, persistence, owner, access, exit, reset, collapse, contamination, and recovery.                          |
| RealmCompatibilityRecord | source realm, target realm, material, creature, crop, magic, machine, law, contamination, adaptation, trade, and stabilisation behaviour.                                                 |

## 30.2 Stable ID conventions

| **Content type**      | **Pattern**                                  | **Example**                                |
|-----------------------|----------------------------------------------|--------------------------------------------|
| Realm                 | realm.\<class\>.\<name\>                     | realm.major.verdant_covenant               |
| Realm biome           | biome.realm.\<realm\>.\<family\>             | biome.realm.void_between.portal_graveyards |
| Realm region instance | region.\<realm_instance\>.\<generated_ulid\> | region.verdant_01.01J...                   |
| Route definition      | route.\<class\>.\<name\>                     | route.ritual.ancestral_procession          |
| Route instance        | route_instance.\<generated_ulid\>            | route_instance.01J...                      |
| Law profile           | law.realm.\<name\>                           | law.realm.aetheric_reach                   |
| Pocket template       | pocket.\<purpose\>.\<name\>                  | pocket.research.failed_laboratory          |

## 30.3 Validation gates

- All stable IDs are unique, namespaced, resolvable, localisable, and compatible with save migration rules.

- Every major realm meets its biome, ecology, civilisation, dungeon, boss, resource, infrastructure, and outcome completeness contract before production approval.

- Every intended progression route has valid origin and destination selectors, requirements, arrival suitability, return logic, and fallback conditions.

- No route can place a player into invalid terrain, sealed geometry, unsupported simulation state, or a realm instance that failed generation.

- Biome adjacency, law compatibility, structure placement, settlement viability, ecology slots, and resource guarantees pass automated validation.

- Cross-realm materials, creatures, crops, machines, spells, and blocks have explicit compatibility or safe default behaviour.

- Dungeon and boss hooks reference valid future registry slots and do not depend on retired POC IDs.

- Content-pack removal, version change, and save migration have defined missing-content behaviour without silently deleting player state.

## 30.4 Seed-testing matrix

| **Test family**   | **Minimum automated coverage**                                                                                                                              |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Determinism       | Repeat selected seeds under identical content manifests and compare realm graph, region graph, routes, stable generated identities, and validation reports. |
| Reachability      | Verify at least one realm path becomes discoverable within configured progression bounds and all required return or rescue paths are valid.                 |
| Variation         | Measure route order, arrival biome, regional mix, history, societies, dungeons, bosses, and dynamic starting states across large seed samples.              |
| Safety            | Test arrival terrain, atmosphere, law warnings, multiplayer spawning, reconnection, death recovery, route collapse, and emergency rescue.                   |
| Completeness      | Confirm biome, resource, ecology, civilisation, dungeon, boss, and infrastructure slots are populated according to realm contract.                          |
| Stress            | Generate high-density route graphs, large realm counts, many pockets, concurrent players, distant simulation, and long elapsed-time catch-up.               |
| Migration         | Load old worldgen versions, changed content packs, renamed definitions, removed optional content, and partially generated realms.                           |
| Failure injection | Interrupt generation, save, portal transition, chunk streaming, dungeon generation, boss updates, and route transactions, then verify recovery.             |

## 30.5 Production gates

1\. Concept gate: identity, topology, laws, player value, societies, risks, and Overworld utility are distinct and approved.

2\. Atlas gate: biome families, transitions, ecology slots, resources, structures, dungeon hooks, boss hooks, routes, and outcomes meet the completeness contract.

3\. Registry gate: stable IDs, schemas, tags, localisation keys, compatibility fields, and content-pack ownership validate.

4\. Prototype gate: one representative region proves the realm-specific laws, building, travel, survival, and persistence without becoming fixed final content.

5\. Content gate: enough interchangeable authored families exist to prevent obvious repetition across seeds.

6\. Performance gate: generation, streaming, simulation LOD, portals, AI, effects, and multiplayer remain within budgets.

7\. Save gate: migrations, interrupted transitions, missing optional content, and long-term world state recover safely.

8\. Release gate: no required progression can fail because of unreachable routes, missing return paths, invalid arrivals, or retired POC references.

# 31. Balancing Rules

- Realm difficulty is multidimensional: survival, navigation, law, politics, ecology, infrastructure, route risk, and knowledge can matter as much as combat.

- Early-accessible realms still contain deep and dangerous regions; late-access realms should offer more than inflated health and damage values.

- Environmental adaptation should create preparation and new infrastructure, not constant unavoidable damage or excessive inventory tax.

- Realm resources remain desirable without making Overworld materials obsolete. Native advantages, maintenance, substitution, and cultural use preserve older materials.

- Portals become more reliable as the player invests in anchors, knowledge, diplomacy, power, and maintenance; instability should be readable and controllable.

- Settlement supply requirements scale with population, law, environment, route distance, and infrastructure rather than arbitrary realm multipliers.

- Boss preparation can involve wards, machines, faction allies, settlement defences, route control, ecological intervention, rituals, or social decisions—not only gear score.

- Dimension content supports peaceful, diplomatic, industrial, magical, exploratory, conquest, and restoration play where the fiction allows it.

- Cross-realm logistics are powerful late-game systems and require performance-aware throughput, permissions, failure isolation, and visible ownership.

- Rare world outcomes remain discoverable through clues and alternative routes; random generation must not hide all meaningful options behind unknowable chance.

# 32. Cross-Document Update Plan

| **Document or system**                  | **Required update**                                                                                                                                          |
|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00-02 Vision, loop, progression         | Replace POC dimensional milestones with procedural realm discovery, branching access, safe return, and realm-outcome progression.                            |
| 03-06 Blocks, items, recipes, resources | Add realm-family tags, compatibility, stabilisation, native construction, route components, biome resources, and cross-realm utility.                        |
| 07 NPC and village                      | Add realm adaptation, migration, citizenship, route diplomacy, foreign settlements, sovereignty, refugee, and distant-realm simulation fields.               |
| 08 Automation                           | Add the twelve realm adaptation profiles, cross-realm logistics, portal throughput, failure isolation, and realm-law compatibility.                          |
| 09 Magic                                | Expand portal, ritual, law, corruption, soul, dream, divine, elemental, and stabilisation systems without fixed POC progression.                             |
| 10 Creatures                            | Create realm ecology packages, invasive species, variants, intelligent peoples, boss ecology, and cross-realm migration rules.                               |
| 11 World generation                     | Add realm-network generation, realm region graphs, access fallback, route validation, and dynamic leakage overlays.                                          |
| 12 Structures                           | Add realm settlement profiles, portal infrastructure, realm-specific dungeons, megadungeons, route stations, and compatibility rules.                        |
| 13 Races and factions / 24E             | Connect peoples to multiple realms through history, culture, migration, claims, settlements, factions, and adaptation without biological locking.            |
| 14 Dimensions                           | Treat 24D as the expanded source of truth; archive or revise POC-specific scope and old ordering assumptions.                                                |
| 15 Quests and events / 24K              | Add generated realm discovery, route crises, invasions, diplomacy, migrations, dungeon change, boss aftermath, and cross-realm world events.                 |
| 16 Combat and defence / 24H             | Add realm hazards, guardian mechanics, siege threats, non-kill resolution, settlement preparation, and persistent boss aftermath.                            |
| 17 UI/UX                                | Add realm maps, route state, stability, law warnings, return confidence, knowledge certainty, Codex contradictions, and multiplayer transition feedback.     |
| 18 Technical plan                       | Rewrite engine-specific implementation for Godot/Summer Engine and add post-POC realm-network generation, streaming, persistence, and validation.            |
| Forge document sets                     | Add realm biome kits, creatures, structures, portal assets, sockets, materials, animations, audio hooks, VFX hooks, LODs, collisions, and production status. |

# 33. Open Questions

1\. Will all twelve realm families exist in every standard world, or can world presets omit selected optional clusters while preserving progression and save compatibility?

2\. How early can accidental realm breaches occur, and which protections prevent them from functioning as unfair lethal traps?

3\. Which realm laws are fully systemic at first production release and which remain authored encounter rules until later milestones?

4\. How much player-built cross-realm logistics is supported before portal throughput becomes abstracted for performance?

5\. Can settlements be founded in every major realm, or do some require outposts, temporary camps, treaty enclaves, or protected habitats instead?

6\. How are death, respawn, tombstones, spirits, and corpse ownership reconciled across the Ancestral Veil and Necropolis Domains?

7\. How are dream time, pocket time, distant simulation, crops, machine processing, and multiplayer synchronised without exploits?

8\. Which bosses and sovereigns are unique world entities, which are species-level roles, and which support succession or recurrence?

9\. How much of Divine Concord law is generated from world cultures versus authored as stable domain identity?

10\. Can players create permanent pocket realms, and what capacity, server, save-size, and abuse limits apply?

11\. What accessibility alternatives communicate realm laws, unstable routes, memory loss, dream distortion, and gravity changes without relying only on visual effects?

12\. Which parts of the old Dimension document are archived, revised in place, or retained as historical design context after 24D becomes authoritative?

# Appendix A. Realm Definition Template

| **Field group**       | **Required fields**                                                                                                            |
|-----------------------|--------------------------------------------------------------------------------------------------------------------------------|
| Identity              | stable_id, display_name_key, aliases, realm_class, content_pack, version, production_status, rarity, discoverability.          |
| Fantasy and cosmology | core_fantasy, developer_truth, cultural_interpretations, origin_theories, affinities, conflicts, historical_layers.            |
| Topology              | seed_salt, world_shape, region_graph_profile, vertical_layers, hidden_layers, region_budget, boundaries, coordinate_model.     |
| Laws                  | law_profile_id, gravity, time, atmosphere, survival, matter, magic, death, identity, ownership, navigation, social_law_hooks.  |
| Content pools         | biome_pool, structure_pool, settlement_profiles, creature_ecology_slots, dungeon_families, boss_roles, resource_families.      |
| Access                | route_classes, allowed_origins, arrival_rules, return_policy, fallback_rules, rescue_policy, anchor_requirements, permissions. |
| Civilisation          | native_societies, migrant_slots, sovereignty, settlement_suitability, diplomacy, trade, colonisation_constraints, laws.        |
| Simulation            | active_policy, distant_policy, elapsed_time, ecology_summary, settlement_summary, boss_summary, route_summary, event_budget.   |
| Presentation          | sky_profile, light_profile, material_palette, weather, ambience, music, VFX, UI_icon, map_style, accessibility cues.           |
| Validation            | completeness_contract, dependencies, compatibility_matrix, seed_tests, performance_budget, migration_policy, release_gate.     |

# Appendix B. Realm Biome Definition Template

| **Field group** | **Required fields**                                                                                                             |
|-----------------|---------------------------------------------------------------------------------------------------------------------------------|
| Identity        | stable_id, parent_realm_id, display_name_key, family, sub_biome_pool, region_roles, tags, production_status.                    |
| Generation      | terrain_profile, region_scale, elevation_or_depth, transition_rules, adjacency, rarity, hidden_conditions, arrival_suitability. |
| Law modifiers   | gravity, time, atmosphere, matter, magic, navigation, survival, death, identity, temporary overlays.                            |
| Ecology         | producer_slots, ambient_slots, prey_slots, predator_slots, intelligent_slots, magical_slots, invasive_rules, migration.         |
| Resources       | common, construction, food, medicine, cultural, magical, industrial, strategic, dungeon, boss, renewable, extraction_effects.   |
| Civilisation    | settlement_suitability, adaptations, agriculture, power, transport, storage, defence, factions, sovereignty, trade.             |
| Adventure       | structures, landmarks, dungeon_suitability, boss_suitability, hazards, events, secrets, route_clues, progression_value.         |
| Dynamic states  | disturbed, exploited, occupied, fortified, corrupted, stabilised, abandoned, restored, disaster, seasonal_or_cyclical.          |
| Presentation    | blocks, materials, silhouettes, lighting, weather, ambience, audio, VFX, Forge asset_set, map and UI cues.                      |

# Appendix C. Access and Route Matrix

| **Route property** | **Supported values and notes**                                                                                            |
|--------------------|---------------------------------------------------------------------------------------------------------------------------|
| Direction          | bidirectional, origin-to-destination, destination-to-origin, conditional reverse, temporary one-way, challenge no-return. |
| Stability          | stable, maintained, decaying, seasonal, event-driven, contested, overloaded, leaking, collapsed, repairable.              |
| Discovery          | unknown, rumoured, located, identified, requirements_known, activated, mapped, mastered.                                  |
| Ownership          | unowned, shared, faction, settlement, player, divine, machine, sovereign, disputed, illegal.                              |
| Permission         | open, toll, reputation, contract, vow, key, ritual, citizenship, military, quest, crime, owner-only.                      |
| Cost               | none, mana, fuel, item, sacrifice, debt, time window, power, weather, participant count, route wear.                      |
| Arrival            | fixed anchor, weighted safe region, settlement gate, moving site, random within validated pool, emergency fallback.       |
| Return             | reciprocal, separate anchor, ritual, consumable, timed window, rescue, route repair, prohibited with explicit warning.    |
| Risk               | environmental, misroute, creature leakage, corruption, memory, dream, soul, law, overload, political interception.        |
| Throughput         | individual, party, caravan, vehicle, cargo, automation, settlement-scale, abstract distant logistics.                     |

# Appendix D. Minimum Completeness Contracts

| **Content package**     | **Minimum contract**                                                                                                                                                                |
|-------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Major realm             | 6+ biome families; v0.1 target 8; transitions; hidden layer; societies or wilderness rationale; ecology; 3-6 dungeon families; bosses; resources; infrastructure; routes; outcomes. |
| Minor realm or subrealm | Clear purpose, laws, topology, 2-4 environment families, ecology or deliberate emptiness, access and return, threats, resources, sites, and persistent outcome.                     |
| Created pocket          | Creator/template, boundary, capacity, topology, rules, ownership, simulation, persistence, access, return, collapse, contamination, and recovery.                                   |
| Realm biome             | Distinct function, law modifier, resources, ecology, settlements, structures, dungeons, boss suitability, transitions, dynamic variants, and presentation identity.                 |
| Dimension dungeon       | Origin, realm-specific core mechanic, procedural grammar, inhabitants, hazards, resources, climax, ownership, dynamic states, persistence, and conversion options.                  |
| Realm boss              | World role, territory clues, conditions, mechanics, alternatives, faction/ecology links, unique value, recurrence rule, and persistent regional aftermath.                          |
| Route                   | Origin, destination, class, requirements, direction, arrival, return, risk, owner, permissions, cost, stability, UI, persistence, fallback, and recovery.                           |

# Appendix E. Realm Roster and Stable IDs

| **Realm Family**      | **Stable ID**                       | **Class**                                  | **Biome Families in v0.1** |
|-----------------------|-------------------------------------|--------------------------------------------|----------------------------|
| Verdant Covenant      | realm.major.verdant_covenant        | Major Living/Fae Realm                     | 8                          |
| Ancestral Veil        | realm.major.ancestral_veil          | Major Spirit Layer                         | 8                          |
| Somnolent Expanse     | realm.network.somnolent_expanse     | Dream Network                              | 8                          |
| Aetheric Reach        | realm.major.aetheric_reach          | Major Sky Realm                            | 8                          |
| Impossible Deep       | realm.major.impossible_deep         | Major Deep Realm                           | 8                          |
| World-Engine          | realm.artificial.world_engine       | Artificial Major Realm                     | 8                          |
| Ashen Lower Realms    | realm.cluster.ashen_lower           | Realm Cluster                              | 8                          |
| Void Between          | realm.interstitial.void_between     | Interstitial Realm                         | 8                          |
| Divine Concords       | realm.network.divine_concords       | Domain Network                             | 8                          |
| Necropolis Domains    | realm.cluster.necropolis_domains    | Artificial and Death-Touched Realm Cluster | 8                          |
| Elemental Confluences | realm.cluster.elemental_confluences | Primordial Realm Cluster                   | 8                          |
| Created Pockets       | realm.family.created_pockets        | Pocket Realm Family                        | 8                          |

| **Atlas v0.1 Coverage**                                                                                                                                                                                                                                                                                            |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| This volume defines 12 realm families and 96 realm-biome families. These are production foundations, not final content caps. Later Atlas volumes add detailed people, ecology, dungeons, bosses, structures, resources, and story records while preserving the stable realm and biome identities established here. |

# Appendix F. Acceptance Criteria

- The production realm network contains no mandatory Forest Hamlet, POC portal, old rune clearing, fixed first destination, or other POC-only ID.

- All twelve realm families have a distinct topology, law identity, survival profile, access family, civilisation model, Overworld utility, dungeon hooks, boss hooks, and eight biome foundations.

- Every major realm can support several regions and transitions rather than functioning as a single visual biome.

- No realm is biologically exclusive to one ancestry; cultures, factions, migration, citizenship, and sovereignty remain separate records.

- Dimension dungeons require realm-specific mechanics and persistent outcomes.

- Realm bosses alter regional ecology, politics, infrastructure, routes, settlements, knowledge, or law state before and after resolution.

- Every intended access route has validated arrival, return, rescue, ownership, permission, stability, and persistence behaviour.

- Generated realm graphs are deterministic for the same seed, worldgen version, and content manifest while maintaining meaningful variation across seeds.

- All major state survives save/load, distant simulation, multiplayer authority, reconnection, interrupted portal travel, and version migration.

- Realm resources, creatures, structures, settlements, and infrastructure connect back to the broader survival, civilisation, automation, magic, combat, trade, quest, and building systems.

- The document is aligned to Godot/Summer Engine implementation direction and avoids carrying forward the obsolete Unreal-specific plan as current authority.

- 24D is ready to serve as the source foundation for 24E Peoples, Cultures, Factions and Settlement Atlas and later creature, dungeon, boss, structure, resource, and story volumes.

---
## Navigation
- Previous: [[24C - Oceans, Coasts, Islands, Skylands, Underground and Special Overworld Biomes|24C]]
- Next: [[24E - Peoples, Cultures, Factions and Settlement Atlas|24E]]
- Index: [[00 - Document Set 24 Index]]
