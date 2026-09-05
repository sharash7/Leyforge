**Fantasy Voxel Civilisation Sandbox**

**14 - Dimensions**

**Version 0.1 - Detailed Design Bible Draft**

A database-ready dimensional system for realms, portals, anchors, survival rules, civilisations, resources, automation, trade, settlement, world-state change, and proof-of-concept foreshadowing.

| **Dimension System Statement**                                                                                                                                                                                                                                                                                                                                         |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Dimensions are complete gameplay ecosystems rather than differently coloured resource worlds. Each realm must contribute a distinct identity through physical laws, survival conditions, terrain, ecology, civilisations, magic, structures, resources, automation constraints, portal infrastructure, political consequences, and lasting effects on the wider world. |

| **Field**             | **Locked Direction**                                                                                                                                                                                                                                            |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope        | Full design-bible document covering cosmology, realm categories, portal access, realm rules, survival, biomes, structures, resources, creatures, cultures, settlement, logistics, politics, world-state outcomes, multiplayer, data fields, and POC boundaries. |
| Core Philosophy       | The Overworld remains the civilisation heart, while major dimensions operate as connected worlds with their own peoples, ecology, infrastructure, hazards, stories, and long-term settlement potential.                                                         |
| Progression Direction | Dormant gates and dimensional evidence appear early; temporary experiments and first expeditions emerge in mid-game; reliable portal networks, freight, colonies, and realm-scale projects arrive late-game.                                                    |
| POC Direction         | Use an inspectable dormant portal, damaged components, magical feedback, an unknown destination, one limited stabilisation interaction, and environmental evidence without implementing functional realm travel.                                                |
| Data Direction        | Use a shared Realm parent model linked to regions, biomes, rulesets, portals, anchors, resources, structures, creatures, factions, events, settlements, routes, and mutable world-state records.                                                                |
| Performance Direction | Use dimensional simulation LOD: active regions run detailed terrain, NPC, creature, machine, and portal behaviour; inactive regions use bounded summaries for production, danger, travel, politics, and ecology.                                                |

# Document Purpose

This document defines how dimensions and realms work across the Fantasy Voxel Civilisation Sandbox. It converts the game’s high-level promise of portals, strange worlds, realm resources, culture stories, dimensional threats, and late-game logistics into a unified system that remains compatible with survival, voxel building, NPC civilisation simulation, magic, automation, structures, creatures, and long-term sandbox freedom.

The document deliberately treats a dimension as more than a biome package. A major realm must explain how players reach it, survive there, navigate it, gather and automate its resources, interact with its peoples, build settlements, operate machines, secure portals, change local politics, and carry consequences back to the Overworld.

This document does not replace the detailed registries for blocks, items, recipes, creatures, biomes, structures, races, cultures, or factions. It defines the realm-facing rules those registries must reference and provides the shared dimensional architecture needed to keep future content consistent.

# Design Source

| **Source Document**                                     | **Relevant Direction**                                                                                                                    | **How This Document Uses It**                                                                                  |
|---------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible                           | Magic and factories grow civilisations, unlock stories, power settlements, and reshape the world. Dimensions are part of late escalation. | Dimensions become civilisation-scale expansion spaces rather than isolated loot zones.                         |
| 01 - Core Gameplay Loop                                 | Explore -\> gather -\> craft -\> build -\> interact -\> automate -\> defend -\> upgrade -\> expand.                                       | Every realm supports the loop through discovery, survival, supply chains, settlement, threat, and expansion.   |
| 02 - Player Progression                                 | Realm access uses tools, knowledge, magic, bosses, rituals, settlements, and reputation.                                                  | Dimension progression is branching and multi-track rather than a single boss ladder.                           |
| 03-06 - Blocks, Items, Recipes, Resources               | Realm materials, portal keys, dimension recipes, and realm block families must retain Overworld utility.                                  | Realm content is linked to existing registries and never replaces the base material economy wholesale.         |
| 07-09 - NPC, Automation, Magic                          | Villages use portals, warehouses, magitech, rituals, wards, and late-game logistics.                                                      | Portal infrastructure, migration, interdimensional supply, and realm-adapted machines are first-class systems. |
| 10-13 - Creatures, Biomes, Structures, Peoples/Factions | Realm ecology, worldgen, portals, native peoples, and cultural stories are interconnected.                                                | Each major realm receives a complete ecological, structural, cultural, and political profile.                  |

# Static Table of Contents

- 1\. Locked Dimension System Identity

- 2\. Player Answer Decision Summary

- 3\. Dimension System Architecture

- 4\. Parent Realm Data Model

- 5\. Cosmology and Realm Classification

- 6\. Initial Realm Family Roster

- 7\. Discovery, Foreshadowing, and Access

- 8\. Portals, Anchors, and Network Infrastructure

- 9\. Realm Survival, Physics, Time, and Death

- 10\. Realm World Generation, Biomes, and Terrain

- 11\. Structures, Landmarks, Dungeons, and Restoration

- 12\. Resources, Crafting, Power, and Automation

- 13\. Native Peoples, Factions, Ecology, and Creatures

- 14\. Settlements, Colonies, Migration, and Politics

- 15\. Story, Progression, Bosses, and World-State Outcomes

- 16\. Interdimensional Trade, Logistics, and Military Use

- 17\. UI, Codex, Mapping, and Player Feedback

- 18\. Multiplayer, Difficulty, Accessibility, and World Settings

- 19\. Proof-of-Concept Dimension Scope

- 20\. Dimension Registry v0.1

- 21\. Portal and Anchor Registry v0.1

- 22\. Balancing and Content Rules

- 23\. Open Questions for Later Documents

- Appendix A. Dimension Database Field Template

- Appendix B. Portal Database Field Template

- Appendix C. Realm Design Checklist

- Appendix D. Cross-System Use Matrix

- Appendix E. POC Success Criteria

# 1. Locked Dimension System Identity

The Dimension System is the game’s late-expansion and alternate-world layer. It extends the sandbox beyond the Overworld without abandoning the systems that define the project. A realm can be wondrous, dangerous, surreal, artificial, spiritual, elemental, or culturally familiar, but it must still support meaningful exploration, construction, society, resource flow, progression, and consequence.

| **Locked Rule**                                                                                                                                                                                                                                         |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A dimension should never exist only as a visual theme or higher-tier resource zone. Every major realm must answer what it changes about survival, navigation, building, magic, automation, civilisation, ecology, politics, story, and the wider world. |

| **Identity Layer**        | **Design Meaning**                                                                                                         | **Player-Facing Result**                                                                                 |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------|
| World Expansion           | Major dimensions are worlds or planes with their own regions, rules, ecology, history, and civilisations.                  | Entering a realm feels like discovering a new layer of the setting rather than loading a themed dungeon. |
| Progression Constellation | Realm access branches through knowledge, factions, rituals, bosses, settlement growth, and specialised equipment.          | Players have multiple valid routes instead of one fixed dimension ladder.                                |
| Civilisation Frontier     | Outposts, settlements, trade, migration, diplomacy, conquest, and restoration can extend across realms.                    | Portals become roads between societies, not merely teleport buttons.                                     |
| Magical Infrastructure    | Anchors, frames, catalysts, wards, portal power, coordinates, and stability are physical systems.                          | Dimensional travel requires readable preparation and creates buildable infrastructure.                   |
| Ecological Consequence    | Creatures, crops, mana, corruption, weather, and invasive species can cross or leak between realms.                        | Opening a gate can help, enrich, destabilise, or endanger regions on both sides.                         |
| World-State Change        | Realms can be stabilised, healed, industrialised, conquered, quarantined, partially collapsed, or politically transformed. | Player choices leave permanent visible and systemic consequences.                                        |

## 1.1 Design Promise

A player should be able to stand before a portal and understand its state: where its power comes from, what destination it is attuned to, whether the route is stable, who controls it, what can pass through it, what hazards are present, and what will happen if it fails. After arrival, the realm should quickly communicate its survival rules, ecological logic, local politics, and resource opportunities through terrain, weather, structures, creatures, NPC behaviour, and readable UI.

## 1.2 What Dimensions Are Not

- Not recoloured Overworld biomes with stronger ores.

- Not mandatory linear levels that replace sandbox freedom.

- Not consequence-free fast-travel menus.

- Not disposable adventure maps with no native daily life.

- Not automatic upgrades that make Overworld materials, roads, villages, or machines obsolete.

- Not part of the full POC beyond deliberate foreshadowing.

# 2. Player Answer Decision Summary

All 150 questionnaire decisions were selected as the recommended hybrid answer. The resulting lock is an interconnected realm model that prioritises consistency, flexibility, and system depth. The table below consolidates those answers into practical design rules rather than repeating every question verbatim.

| **Decision Area** | **Locked Decision**                                                                                                                                                               |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Cosmology         | Use a layered cosmology containing true worlds, overlapping planes, spirit layers, echoes, pocket realms, divine domains, artificial dimensions, and unstable interstitial space. |
| Overworld Role    | The Overworld remains the primary civilisation heart, while selected major realms can support permanent settlements, industries, and political power.                             |
| Origins           | Realm origins vary: primordial, divine, fractured, natural, artificial, corrupted, remembered, dreamed, or created by ancient civilisations.                                      |
| Physical Laws     | Core controls remain readable, but gravity, time, death, magic, matter, navigation, ecology, and construction may vary by realm.                                                  |
| Generation        | Use authored anchor regions and landmarks combined with procedural expansion where appropriate.                                                                                   |
| Access            | Access depends on knowledge, repaired structures, attunement, ritual preparation, catalysts, settlement or faction support, and sometimes bosses.                                 |
| Portals           | Stable gates are physical infrastructure with power, maintenance, security, throughput, ownership, permissions, and sabotage risks.                                               |
| Survival          | Normal survival remains legible, while each realm adds selected environmental rules, equipment needs, hazards, and local resources.                                               |
| Building          | Voxel interaction remains core, but protected, sacred, living, unstable, or reality-locked materials require specialised methods.                                                 |
| Resources         | Realm resources combine with established material families and retain meaningful Overworld, village, machine, magic, and story uses.                                              |
| Automation        | Machines can function across realms but may require adaptation for heat, pressure, corrosion, mana, gravity, spirit interference, or instability.                                 |
| Civilisations     | Realms may contain native societies, colonies, ruins, nomads, divine polities, construct networks, wildlife-only ecologies, or incomprehensible entities.                         |
| Politics          | Migration, treaties, colonial pressure, extraction rights, sacred sites, conquest, trade, and portal control create lasting political consequences.                               |
| Progression       | Use a branching constellation of realms; gates can be resolved through combat, diplomacy, research, ritual, restoration, settlement, or exploration.                              |
| POC               | Show a dormant inspectable portal with limited stabilisation and realm evidence, but no full transition or playable dimension.                                                    |

# 3. Dimension System Architecture

The system uses a shared Realm parent model plus linked records. A realm record defines identity and global rules, while regions, biomes, portals, settlements, factions, events, and world states remain separate so they can change independently. This prevents a single oversized entry from becoming impossible to maintain and allows full realms, pocket dimensions, divine domains, dream instances, and artificial spaces to share the same foundation.

| **Layer**          | **Purpose**                                                                        | **Examples**                                                                                     |
|--------------------|------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------|
| Realm Definition   | Stable identity and high-level rules.                                              | Name, type, origin, sky, gravity, time profile, survival profile, magic laws, build permissions. |
| Realm Region       | Large geographical or metaphysical subdivision.                                    | Verdant Courts, Ash Marches, Memory Sea, Outer Gearlands.                                        |
| Realm Biome        | Local terrain, ecology, resources, weather, and spawn rules.                       | Living Canopy, Glass Dunes, Storm Shelf, Whispering Archive.                                     |
| Realm Ruleset      | Reusable gameplay modifiers.                                                       | Low gravity, dream instability, spirit visibility, mana saturation, corrosive air.               |
| Portal Definition  | Portal family, frame, power, throughput, security, and transition logic.           | Ancient arch, ritual door, dream gate, freight aperture.                                         |
| Anchor Definition  | A discovered destination address or stabilisation point.                           | Fae Embassy Gate, Ruined Deep Anchor, Skyport Relay.                                             |
| Realm Settlement   | Population, ownership, jobs, supplies, local law, migration, and simulation state. | Native city, player outpost, refugee camp, machine enclave.                                      |
| Realm World State  | Mutable consequences and milestone state.                                          | Corruption level, ruler, portal status, restored wonder, invasion risk.                          |
| Realm Route        | Travel or logistics connection.                                                    | Portal route, sky current, spirit road, dream path, freight network.                             |
| Simulation Profile | Near/far update rules.                                                             | Detailed local AI, abstract production, bounded migration, event summaries.                      |

## 3.1 Shared Realm-Type Hierarchy

| **Parent Type**    | **Use**                                                                        | **Typical Scale**                                                        |
|--------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Major Realm        | Full world or plane with several regions and civilisations.                    | Long-term exploration, settlement, industry, story arcs.                 |
| Minor Realm        | Smaller stable world with narrow identity.                                     | One to several biomes, focused progression, optional stories.            |
| Pocket Realm       | Bounded created or naturally enclosed space.                                   | Vault, trial, prison, laboratory, farm, ritual site.                     |
| Echo Realm         | Reflection of another location through memory, spirit, dream, or time.         | Story, investigation, restoration, altered world-state.                  |
| Domain             | Territory controlled or embodied by a deity, sovereign, titan, or magical law. | Rare access, strong permissions, unusual consequences.                   |
| Interstitial Realm | Space between destinations.                                                    | Dangerous travel, shortcuts, void exposure, route failure.               |
| Artificial Realm   | Constructed dimensional environment.                                           | Ancient machine world, simulation, sealed habitat, weapon.               |
| Breach Instance    | Temporary unstable incursion.                                                  | World event, short expedition, creature migration, resource opportunity. |

# 4. Parent Realm Data Model

| **Field Group** | **Core Fields**                                                                                                        |
|-----------------|------------------------------------------------------------------------------------------------------------------------|
| Identity        | realm_id, display_name, aliases, realm_type, origin_type, description, discovery_state, planning_status                |
| Visual          | sky_profile, celestial_profile, lighting_profile, fog_profile, colour_logic, material_variation_profile, audio_profile |
| Physics         | gravity_profile, time_profile, movement_modifiers, fluid_rules, falling_rules, projectile_rules, spatial_instability   |
| Survival        | temperature, atmosphere, pressure, exposure_type, food_rules, rest_rules, death_profile, emergency_return_rules        |
| Magic           | mana_density, allowed_schools, amplified_schools, suppressed_schools, ritual_rules, leyline_model, corruption_profile  |
| Worldgen        | seed_derivation, generation_mode, anchor_regions, biome_pool, vertical_layers, structure_pool, landmark_guarantees     |
| Ecology         | native_creature_tags, invasive_rules, crop_compatibility, migration_rules, ecosystem_state                             |
| Civilisation    | native_peoples, factions, settlement_rules, law_model, trade_model, migration_model, colonisation_reaction             |
| Resources       | resource_families, stabilisation_requirements, automation_compatibility, export_risk, strategic_value                  |
| Portals         | allowed_portal_types, destination_addressing, anchor_requirements, transit_hazards, freight_support                    |
| World State     | ruler_state, threat_state, restoration_state, industrialisation_state, corruption_state, global_flags                  |
| Simulation      | active_region_radius, far_sim_tick, bounded_production, event_budget, multiplayer_sync_profile                         |

## 4.1 Runtime Separation

Static realm data defines what a realm can be. Save-state data records what has happened in the current world. A Fae realm’s promise laws belong in static data; whether the player broke a treaty, restored a seasonal court, or opened a freight route belongs in runtime world state. Planning labels such as POC Required or Deferred remain documentation metadata and should not ship as gameplay properties.

# 5. Cosmology and Realm Classification

The setting should not present one universally accepted cosmology at the beginning. Cultures, religions, scholars, spirits, and ancient machine archives may describe the same realms differently. Exploration gradually reveals evidence, but the final truth can remain partly unresolved. This supports mystery while still giving designers a stable internal classification.

| **Classification** | **Definition**                                                                             | **Common Gameplay Role**                                                       |
|--------------------|--------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------|
| Primordial Plane   | A foundational layer of matter, force, concept, or magic.                                  | Elemental resources, extreme survival, ancient beings.                         |
| Living Plane       | A realm behaving like a vast organism or ecological intelligence.                          | Nature magic, living materials, diplomacy with land and species.               |
| Spirit Layer       | A non-material or partially material realm of souls, memory, faith, and emotion.           | Ancestors, unresolved histories, divine influence, spirit threats.             |
| Dream Network      | A shifting realm formed through sleep, nightmare, memory, prophecy, and psychic resonance. | Investigation, unstable navigation, identity effects, dream resources.         |
| Fractured World    | A broken or separated part of an older world.                                              | Ruins, displaced cultures, restoration, world-history revelations.             |
| Divine Domain      | A realm or territory shaped by a god, saint, cosmic sovereign, or worship system.          | Blessings, trials, religious politics, rare access.                            |
| Artificial World   | A constructed dimensional machine, habitat, prison, archive, or simulation.                | Automation, ancient technology, repair, dangerous control systems.             |
| Void Interstice    | Eroding space between stable realities.                                                    | Portal shortcuts, instability, forbidden resources, existential threats.       |
| Echo               | A copy or reflection of a place through another law.                                       | Story reconstruction, alternate states, cleansing, temporal or memory puzzles. |

# 6. Initial Realm Family Roster

The following roster is a v0.1 planning map rather than a final launch commitment. Names are working titles. Major realms receive complete world, civilisation, and progression profiles; smaller realms may remain focused. The first playable realm should be selected after culture stories and production scope are locked, with a Fae-adjacent living realm currently the strongest onboarding candidate.

| **Working Realm**     | **Type**                        | **Core Identity**                                                                                                             | **Primary Unlocks**                                                                    |
|-----------------------|---------------------------------|-------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Verdant Covenant      | Major Living/Fae Realm          | A beautiful political wilderness where seasons, names, promises, emotion, and living nature have physical power.              | Living wood, nature automation, seasonal magic, Fae diplomacy, promise law.            |
| Ancestral Veil        | Major Spirit Layer              | A layered reflection of memory, ancestors, lost souls, divine territories, and predatory spirits.                             | Spirit communication, ancestral crafts, cleansing, soul wards, historical truth.       |
| Somnolent Expanse     | Dream Network                   | Shifting dream, nightmare, prophecy, memory, and psychic landscapes connected through sleep.                                  | Dream glass, illusion, fate clues, memory travel, nightmare containment.               |
| Aetheric Reach        | Major Sky Realm                 | Floating continents, storm oceans, sky settlements, rare gases, wind currents, and vertical logistics.                        | Sky vessels, storm power, aerial trade, floating construction, weather industry.       |
| Impossible Deep       | Major Deep Realm                | A physically impossible subterranean world beyond the deepest Overworld strata.                                               | Deep forge resources, pressure technology, ancient underworld cultures, seismic magic. |
| World-Engine          | Artificial Major Realm          | A failing artificial world-machine built by a lost civilisation and still executing unknown functions.                        | Magitech origins, advanced automation, dimensional control, machine factions.          |
| Ashen Lower Realms    | Realm Cluster                   | Distinct hostile lower worlds shaped by heat, war, hunger, contracts, or corruption rather than one generic hell.             | Infernal fuels, pact magic, heat industry, demon politics, dangerous metallurgy.       |
| Void Between          | Interstitial Realm              | Dimensional erosion, spatial shortcuts, unstable matter, forbidden storage, and existential predators.                        | Voidstone, portal optimisation, spatial logistics, high-risk magic.                    |
| Divine Concords       | Domain Network                  | Overlapping divine territories reached through visions, shrines, pilgrimage, or rare physical gates.                          | Blessings, relics, religious stories, divine construction, law conflicts.              |
| Necropolis Domains    | Artificial/Death-Touched Realms | Necromantic empires, sealed death industries, and territories where undeath became infrastructure.                            | Necromancy, soul ethics, bone industry, undead diplomacy, forbidden labour.            |
| Elemental Confluences | Primordial Realm Cluster        | Complex mixed elemental ecologies rather than one repetitive world per element.                                               | Specialised power, elemental materials, climate control, advanced ritual catalysts.    |
| Created Pockets       | Pocket Realm Family             | Player-, faction-, relic-, or structure-created spaces used as vaults, farms, trials, prisons, laboratories, and sanctuaries. | Compact specialist infrastructure with strict capacity and stability limits.           |

## 6.1 First-Realm Onboarding Rule

| **Recommended First Realm**                                                                                                                                                                                                                                                                                                                             |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Use a relatively readable arrival sanctuary in a living Fae-adjacent realm, followed by increasingly dangerous regions. The first expedition should teach environmental adaptation, native diplomacy, one unique resource chain, one portal problem, one realm settlement, and one major threat without introducing every dimensional mechanic at once. |

# 7. Discovery, Foreshadowing, and Access

Dimensions should be foreshadowed long before reliable travel. Players can encounter broken gates, realm-touched creatures, strange weather, imported goods, contradictory religious stories, displaced NPCs, unstable rifts, and impossible materials. This makes portal activation feel like the resolution of accumulated knowledge rather than a surprise crafting recipe.

| **Discovery Stage**   | **Player Evidence**                                                                   | **Gameplay Result**                                               |
|-----------------------|---------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| Rumour                | NPC stories, songs, myths, trade goods, warnings, cultural festivals.                 | Realm enters the codex as unverified.                             |
| Physical Evidence     | Broken portal, strange residue, realm fragment, displaced creature, impossible plant. | Realm becomes suspected; research goals appear.                   |
| Knowledge Recovery    | Books, ruins, faction archives, spirit testimony, machine records.                    | Destination, hazards, and activation requirements become clearer. |
| Anchor Identification | A specific destination address or stabilisation point is located.                     | Portal plan can target a known arrival region.                    |
| Gate Preparation      | Frame repair, catalysts, power, ritual, permissions, specialist support.              | Activation project becomes available.                             |
| First Transition      | Controlled expedition through a limited or ancient route.                             | Arrival sanctuary and emergency return systems unlock.            |
| Route Stabilisation   | Threats, anchor damage, local politics, and power problems are resolved.              | Repeat travel, NPC movement, and larger cargo become possible.    |
| Network Integration   | Permanent logistics, security, trade, migration, and governance are established.      | Realm becomes part of civilisation-scale play.                    |

## 7.1 Access Requirement Model

Portal access uses linked requirements rather than a single key item. Different routes may require different combinations of knowledge, physical structure, catalyst, power, ritual, specialist, permission, boss outcome, settlement stage, and local anchor. This allows cultural gates, ancient machine gates, dream passage, divine invitation, and player-built portals to feel mechanically distinct while sharing one data framework.

# 8. Portals, Anchors, and Network Infrastructure

Portals are strategic infrastructure. They can be owned, damaged, repaired, overloaded, sabotaged, taxed, warded, quarantined, seized, or integrated into settlements. A portal record describes the gate mechanism; an anchor record describes a valid destination. Stable travel depends on both.

| **Portal Layer**  | **Function**                                             | **Example Variables**                                          |
|-------------------|----------------------------------------------------------|----------------------------------------------------------------|
| Frame             | Physical structure that shapes and contains the opening. | material tier, size, durability, culture, supported cargo      |
| Anchor            | Destination stabilisation point.                         | realm, region, address, ownership, damage, discovery state     |
| Attunement        | Pattern selecting the target.                            | runes, coordinates, names, memory, relic, cultural method      |
| Power             | Energy required to open or sustain transit.              | mana, leyline, fuel, ritual, divine charge, machine power      |
| Catalyst          | Consumable or persistent material that enables passage.  | realm shard, seal, key, blood, dream mote, voidstone           |
| Stability         | Chance and severity of transit errors.                   | frame quality, overload, storms, contamination, route distance |
| Throughput        | Maximum passengers or cargo per time.                    | aperture size, power, cargo class, freight modules             |
| Security          | Who or what may pass.                                    | ownership, permissions, wards, guards, destination filters     |
| Maintenance       | Ongoing upkeep and calibration.                          | parts, runes, cleansing, cooling, alignment, inspection        |
| Emergency Systems | Shutdown, return, quarantine, rescue, and evacuation.    | manual cut-off, beacon, recall token, collapse procedure       |

## 8.1 Portal Progression Tiers

| **Tier**                 | **Capability**                                                   | **Typical Use**                                                |
|--------------------------|------------------------------------------------------------------|----------------------------------------------------------------|
| Dormant Gate             | Inspectable, damaged, unknown or inactive.                       | Foreshadowing, lore, POC interaction.                          |
| Unstable Breach          | Temporary opening with limited control.                          | World event, short expedition, creature leak, rare resource.   |
| Restored Ancient Gate    | Reliable fixed destination and moderate capacity.                | First major realm access, faction-controlled travel.           |
| Experimental Player Gate | Constructed route with high cost and maintenance.                | Mid/late testing, temporary specialist access.                 |
| Permanent Civil Gate     | Reliable passenger and trade route with permissions.             | Settlement migration, regular caravans, diplomacy.             |
| Freight Aperture         | Large-capacity cargo and vehicle transport.                      | Interdimensional industry, rails, golems, strategic logistics. |
| Network Gate             | Remote routing, monitoring, multiple anchors, emergency control. | Late-game portal web and city-scale infrastructure.            |
| Realm-Scale Engine       | Alters or stabilises routes across regions or worlds.            | Endgame wonders, invasions, rescue, world-state change.        |

## 8.2 Malfunction Philosophy

Portal failures must have readable causes. Damage, overload, incorrect attunement, realm storms, sabotage, contamination, insufficient anchoring, or forbidden catalysts can produce destination drift, cargo loss, partial transit, creature incursion, local corruption, power collapse, or temporary route closure. Routine stable gates should warn and shut down before catastrophic failure unless harsh settings or risky technologies explicitly permit worse outcomes.

# 9. Realm Survival, Physics, Time, and Death

Realm rules should create identity without making basic controls frustrating. Most worlds keep familiar movement and time relationships, while selected realms use strong exceptions. Dedicated meters are reserved for threats that define sustained gameplay; smaller hazards use normal statuses, equipment, and environmental feedback.

| **Rule Area** | **Default Direction**                             | **Possible Realm Exceptions**                                                        |
|---------------|---------------------------------------------------|--------------------------------------------------------------------------------------|
| Hunger/Food   | Core survival remains active and understandable.  | Dream food, spirit sustenance, altered spoilage, local nutritional rules.            |
| Atmosphere    | Breathable by default in accessible realms.       | Toxic spores, vacuum pockets, ash, pressure, spiritual suffocation.                  |
| Temperature   | Normal system with local extremes.                | Constant heat, soul-cold, rapid cycles, magical storms.                              |
| Gravity       | Familiar in most regions.                         | Low gravity, shifting direction, buoyancy, local gravity wells.                      |
| Time          | Compatible for simulation stability.              | Rare controlled time ratios central to a story or domain.                            |
| Sleep/Rest    | Works in safe shelter.                            | Dream interference, no natural night, spirit vulnerability, special sanctuaries.     |
| Death         | Default tombstone recovery.                       | Portal respawn, spirit rescue, curse, severed return route, realm-specific recovery. |
| Building      | Normal voxel interaction is the baseline.         | Living terrain, sacred law, reality locks, unstable matter, protected settlements.   |
| Navigation    | Maps and landmarks normally work.                 | Moving terrain, memory paths, starless void, current-based sky travel.               |
| Agriculture   | Depends on soil, light, water, climate, and mana. | Greenhouses, imported ecosystems, realm crops, magical pollination.                  |

## 9.1 Entrapment and Emergency Return

Being trapped can create meaningful tension but must not produce arbitrary permanent loss. Dangerous expeditions may lose their return route, yet the realm should provide readable alternatives such as repairing an anchor, reaching a native gate, completing a rescue ritual, activating an emergency beacon, negotiating passage, or paying a substantial emergency cost. Story events may temporarily enforce entrapment, but standard play should avoid unwinnable states.

# 10. Realm World Generation, Biomes, and Terrain

Major realms use the same layered worldgen philosophy as the Overworld while applying realm-specific physics, climate, magic, culture, resource, and structure layers. Each realm derives from the world seed but preserves authored landmarks, guaranteed progression anchors, and multiplayer consistency.

| **Worldgen Layer**     | **Realm Use**                                                                                                                    |
|------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| Global Shape           | Defines whether the realm is continental, island-based, vertical, enclosed, networked, fragmented, oceanic, or spatially folded. |
| Anchor Regions         | Authored arrival zones, capitals, wonders, major threats, or story-critical landscapes.                                          |
| Procedural Regions     | Seeded expansion with region identity, faction territory, route networks, resources, and danger.                                 |
| Biome Families         | Usually two to four for small realms and six or more for major worlds.                                                           |
| Vertical/Hidden Layers | Caves, roots, clouds, machine interiors, memory depths, oceans, folded rooms, or under-realms.                                   |
| Dynamic State          | Corruption, seasons, divine influence, industry, restoration, war, extraction, and settlement growth alter terrain.              |
| Arrival Safety         | First anchors create a readable sanctuary or defensible foothold unless the story intentionally breaks this rule.                |
| Landmark Guarantees    | Critical structures and progression materials use fallback generation so a seed cannot block advancement.                        |

## 10.1 Realm Material Families

Every major dimension should introduce terrain, construction, resource, magic, and hazard block families that remain useful outside the realm. Familiar structural roles improve readability, while behaviour, material states, weathering, magic charge, corruption, culture, and rarity create visual and mechanical distinction. The engine-driven material variation system should apply realm, seed, state, age, culture, and magic modifiers to 32x32 base textures and material layers.

# 11. Structures, Landmarks, Dungeons, and Restoration

| **Structure Family**    | **Realm Function**                                                                     |
|-------------------------|----------------------------------------------------------------------------------------|
| Arrival Sanctuary       | Teaches local rules, provides temporary safety, and frames the first expedition.       |
| Native Settlement       | Shows ordinary life, law, jobs, storage, politics, and resource use.                   |
| Portal Complex          | Controls travel, customs, security, power, maintenance, and faction access.            |
| Ancient Network Site    | Reveals cosmology, lost routes, technology, or realm history.                          |
| Resource Installation   | Mine, grove, forge, storm collector, spirit well, dream archive, or machine extractor. |
| Dungeon/Threat Site     | Connects enemies, lore, local hazards, bosses, and progression rewards.                |
| World Wonder            | Unique authored monument with realm-scale visual and systemic importance.              |
| Restoration Project     | Can unlock routes, NPCs, production, safety, trade, magic, or regional healing.        |
| Colonial/Player Outpost | Supports shelter, storage, logistics, defence, work, migration, and growth.            |
| Collapsed/Unstable Zone | Shows damage, reality failure, corruption, war, or portal catastrophe.                 |

## 11.1 Claiming and Restoration

Realm structures may be claimed through clearing, negotiation, ritual attunement, legal recognition, restoration, inheritance, purchase, or conquest. Restoration should be a major loop rather than a cosmetic repair. Repaired landmarks can reopen routes, revive settlements, attract specialists, unlock resources, change weather, reduce threats, restore ecosystems, or shift faction power.

# 12. Resources, Crafting, Power, and Automation

Dimension materials should extend the existing economy rather than invalidate it. Wood, stone, copper, iron, steel, mana crystal, and established side materials remain essential as structural, repair, machine, binding, and trade inputs. Realm materials add specialised properties and cross-system capabilities.

| **Resource Layer**  | **Purpose**                                                           | **Examples**                                              |
|---------------------|-----------------------------------------------------------------------|-----------------------------------------------------------|
| Common Realm Matter | Construction, repair, local crafting, settlement supply.              | living wood, cloudstone, ash brick, spirit clay           |
| Strategic Material  | Faction power, advanced machines, trade conflict.                     | storm metal, deep ember, soul silver, world-engine alloy  |
| Magical Catalyst    | Rituals, wards, portals, enchanting, research.                        | dream mote, ancestral essence, fae seed, divine resonance |
| Creature Resource   | Alchemy, gear, machines, culture, trophies.                           | sky membrane, void carapace, spirit thread                |
| Keystone Resource   | Realm progression, major structures, cross-realm synthesis.           | anchor heart, seasonal crown shard, world-engine core     |
| Hazardous Resource  | Powerful but unstable, corrupting, illegal, or politically sensitive. | voidstone, infernal ash, necromantic core                 |

## 12.1 Automation Adaptation

| **Environmental Pressure** | **Machine Adaptation**                                                              |
|----------------------------|-------------------------------------------------------------------------------------|
| Extreme Heat               | Cooling loops, ceramic insulation, heat-resistant seals, local thermal generators.  |
| Corrosive Air or Spores    | Filters, sealed bearings, cleansing cycles, replaceable protective coatings.        |
| Mana Saturation            | Grounding runes, surge buffers, purity filters, mana-aware control logic.           |
| Low or Shifting Gravity    | Anchored foundations, enclosed transport, directional conveyors, pressure movement. |
| Spirit Interference        | Wards, spirit-safe timing, consecrated components, negotiated local access.         |
| Reality Instability        | Stabilisers, redundant anchors, bounded operating windows, emergency shutdown.      |
| Pressure/Deep Conditions   | Reinforced frames, pressure vessels, remote labour, specialised power.              |
| Dream Logic                | Memory-coded controls, observer-dependent safeguards, waking relays.                |

## 12.2 Interdimensional Production

Initial realm gathering should be manual and expedition-focused. Prospecting, local permissions, transport routes, power, stabilisation, and settlement support gradually enable extraction and processing. Machines continue abstract production while unloaded through bounded simulation rules, consuming fuel and maintenance and remaining vulnerable to local events. Cross-realm synthesis is reserved for selected high-tier artefacts, portals, wonders, and civilisation projects rather than ordinary recipes.

# 13. Native Peoples, Factions, Ecology, and Creatures

Not every dimension needs humanoid civilisations, but inhabited realms should contain ordinary daily life: homes, farms, labour, trade, family, religion, politics, celebration, and hardship. Realm peoples should not exist only to dispense quests or fight the player.

| **Population Model**      | **Design Use**                                                                              |
|---------------------------|---------------------------------------------------------------------------------------------|
| Major Native Civilisation | Cities, villages, factions, law, trade, culture stories, internal politics.                 |
| Distributed Nomads        | Migration routes, seasonal settlements, mobile trade, territory knowledge.                  |
| Diaspora/Refugees         | Cross-realm history, cultural splits, settlement pressure, moral choices.                   |
| Construct Network         | Machine societies, maintenance roles, collective intelligence, failing directives.          |
| Divine/Spirit Society     | Unusual personhood, ritual law, memory, faith, consent, and metaphysical territory.         |
| Wild Realm                | No settled intelligence; ecology, ancient ruins, or incomprehensible entities dominate.     |
| Colonised Frontier        | Mixed native and newcomer populations with treaty, conflict, labour, and extraction issues. |

## 13.1 Cross-Realm Ecology

Creature and plant survival across portals depends on climate, mana, food, habitat, disease, containment, and reproduction. Some organisms die quickly; others become valuable domesticated species; others become invasive or transform local biomes. Natural rifts can cause migrations, predator incursions, magical contamination, rescue events, and new ecosystems. These effects should be regionally bounded by default and configurable through difficulty and ecology settings.

## 13.2 Boss and Sovereign Roles

Major beings are not automatically hostile. A realm boss may be a guardian, ruler, prisoner, wounded titan, natural force, machine administrator, corrupted protector, or potential ally. Progression gates can be resolved through combat, negotiation, healing, proof, ritual, restoration, or faction alignment when the fiction supports it.

# 14. Settlements, Colonies, Migration, and Politics

Permanent realm bases can grow from expedition camps into defended outposts, specialist settlements, joint colonies, independent cities, or interdimensional capitals. Growth uses the same civilisation foundation as Overworld settlements but adapts needs, jobs, law, ecology, portal dependence, and local politics.

| **Settlement Stage**  | **Core Requirements**                                                                      | **New Capability**                                      |
|-----------------------|--------------------------------------------------------------------------------------------|---------------------------------------------------------|
| Expedition Camp       | Shelter, return route, supplies, beacon, small storage.                                    | Safe rest and basic exploration support.                |
| Foothold Outpost      | Defence, portal maintenance, specialists, local resource access.                           | Regular expeditions and limited processing.             |
| Supply Colony         | Housing, food, jobs, warehouse, transport, law, local agreements.                          | Migration, trade, construction, stable production.      |
| Realm Settlement      | Local culture adaptation, families, services, governance, diplomacy.                       | Independent growth and regional projects.               |
| Interdimensional City | Freight portals, multiple populations, advanced industry, security, political recognition. | Major trade, faction power, cross-realm institutions.   |
| Portal Capital/Wonder | Realm-scale infrastructure, alliances, world projects, strategic defence.                  | Endgame logistics, diplomacy, restoration, or conquest. |

## 14.1 Colonisation Rule

| **Moral and Political Rule**                                                                                                                                                                                                                                                                                                                                                                                         |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Expansion into inhabited or sacred realms must be treated as politically and morally complex. Native ownership, treaties, extraction scale, sacred sites, ecology, pollution, labour, trade benefit, historical harm, and player reputation should shape reactions. The system may permit conquest and exploitation, but it must model resistance, occupation costs, migration, rebellion, and lasting consequences. |

## 14.2 Migration and Self-Sufficiency

Early realm outposts depend heavily on imported food, tools, medicine, replacement parts, portal fuel, and specialists. Mature settlements can develop local agriculture, industry, culture goods, and governance, but cross-realm dependencies should remain meaningful. NPC relocation depends on safety, housing, work, culture, law, family ties, portal stability, and personal choice rather than a simple recruitment button.

# 15. Story, Progression, Bosses, and World-State Outcomes

Dimensional progression forms a branching constellation. Some realms require knowledge or materials from others, but the player should normally have several valid routes. A major realm can contain multiple faction and cultural arcs, while smaller realms may focus on one mystery, trial, expedition, or restoration problem.

| **Milestone**        | **Meaning**                                                                                                            |
|----------------------|------------------------------------------------------------------------------------------------------------------------|
| Known                | The realm is documented or rumoured.                                                                                   |
| Located              | A destination anchor or route is identified.                                                                           |
| Accessed             | The player completes a first transition.                                                                               |
| Mapped               | Major regions, routes, hazards, and settlements are recorded.                                                          |
| Stabilised           | A reliable return route and safe foothold exist.                                                                       |
| Integrated           | Trade, migration, logistics, and diplomacy become regular.                                                             |
| Threat Resolved      | A major danger is defeated, negotiated with, contained, healed, or redirected.                                         |
| Restored/Transformed | The player changes ecology, rulership, infrastructure, or realm condition.                                             |
| Mastered             | The player understands core rules and controls major local systems; the realm remains playable rather than “finished.” |

## 15.1 Permanent Outcomes

Choices can change settlement survival, faction rulers, portal access, resource availability, creature migration, ecology, weather, corruption, industrialisation, religious power, boss states, and Overworld consequences. Major realm destruction should be extraordinarily difficult; pocket realms and local regions may collapse more readily. Restoration can require cleansing, infrastructure, diplomacy, ecology work, ritual, settlement growth, and threat resolution.

# 16. Interdimensional Trade, Logistics, and Military Use

| **System**        | **Locked Direction**                                                                                               |
|-------------------|--------------------------------------------------------------------------------------------------------------------|
| Manual Transport  | Players, pack creatures, carts, and expeditions move early cargo.                                                  |
| Caravans          | NPC trade begins after routes are safe, legal, and politically accepted.                                           |
| Freight Gates     | Late-game portal systems move bulk goods, vehicles, golems, and specialised cargo.                                 |
| Throughput        | Capacity depends on frame tier, power, anchor strength, distance, cargo type, maintenance, and realm interference. |
| Trade Effects     | New goods can create prosperity, shortages, monopolies, cultural conflict, or economic disruption.                 |
| Security          | Wards, guards, permissions, destination filters, inspection, shutdown, and quarantine protect routes.              |
| Military Use      | Portals can support invasion, evacuation, occupation, supply, sabotage, rescue, and strategic denial.              |
| Strategic Targets | Anchors and gate complexes are high-value structures that factions may seize, blockade, tax, or destroy.           |

## 16.1 Route Simulation

Important journeys should be visible in active regions, while high-volume trade, migration, and military supply use abstract route simulation at distance. Route records track origin, destination, ownership, capacity, safety, travel time, cargo classes, escort, tolls, legal status, threat, and disruption. A blocked portal route should create shortages and project delays rather than silently teleporting goods through failure.

# 17. UI, Codex, Mapping, and Player Feedback

| **Interface**       | **Required Information**                                                                                               |
|---------------------|------------------------------------------------------------------------------------------------------------------------|
| Portal Inspection   | state, destination, power, stability, damage, ownership, permissions, throughput, hazards, maintenance                 |
| Realm Codex         | classification, discovery evidence, known rules, peoples, resources, threats, structures, history, unresolved theories |
| Realm Map           | regions, anchors, routes, settlements, hazards, weather, faction territory, resource sites, return options             |
| Portal Network      | all known gates, route status, traffic, power, security, queued freight, emergency controls                            |
| Expedition Planner  | environmental requirements, supplies, protection, expected duration, known threats, return plan                        |
| Settlement Overview | population, imported needs, local production, portal dependency, law, threats, projects, migration                     |
| World-State History | major choices, ruler changes, restored wonders, invasions, collapses, treaties, ecological changes                     |

## 17.1 Readability Rule

Realm danger should be communicated before irreversible commitment through portal visuals, specialist warnings, codex evidence, equipment checks, environmental clues, and clear arrival feedback. Hidden surprises are valuable, but basic survival requirements and catastrophic risks should not depend on trial-and-error death.

# 18. Multiplayer, Difficulty, Accessibility, and World Settings

| **Area**             | **Locked Direction**                                                                                                    |
|----------------------|-------------------------------------------------------------------------------------------------------------------------|
| Shared State         | Realm discovery, anchor restoration, rulers, settlements, and major world-state outcomes are shared by the world.       |
| Individual State     | Knowledge detail, personal reputation, quests, transformations, and some unlocks can remain individual or configurable. |
| Concurrent Play      | Players may operate in different dimensions with independent regional simulation.                                       |
| Communication        | Default multiplayer remains usable; immersive settings can require relay structures or communication magic.             |
| Ownership/PvP        | Claims, permissions, faction law, and server settings govern sabotage, theft, and portal access.                        |
| Peaceful Mode        | All realms, stories, resources, building, diplomacy, and bosses remain accessible with adjusted combat and loss.        |
| Hazard Settings      | Players can adjust survival intensity, exposure, navigation difficulty, time pressure, corruption, and loss.            |
| Visual Accessibility | Portal effects, motion, distortion, flashing, fog, colour dependence, and transition speed are configurable.            |
| World Presets        | Optional realms can be disabled or delayed, with dependency warnings and curated presets.                               |
| Seed Rules           | Realm terrain derives from the world seed while critical anchors and landmarks remain guaranteed.                       |

# 19. Proof-of-Concept Dimension Scope

| **POC Boundary**                                                                                                                                                                                                                                         |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The POC must communicate that dimensions exist and matter without implementing a playable realm. Full portal transition, realm terrain generation, native civilisation simulation, portal logistics, and dimensional ecology remain explicitly deferred. |

| **POC Element**          | **Required Behaviour**                                                                                        |
|--------------------------|---------------------------------------------------------------------------------------------------------------|
| Dormant Portal Structure | A visually distinctive damaged gate located in or near the magical ruin.                                      |
| Inspection Interaction   | Shows dormant state, unknown destination, damaged components, missing power, and unstable residue.            |
| Limited Stabilisation    | The player can repair, align, cleanse, or energise one component to reveal feedback but cannot open the gate. |
| Environmental Evidence   | Realm-touched plants, residue, sound, light, gravity motes, or weather appear around the site.                |
| Lore Evidence            | A fragment, inscription, mage dialogue, or research note confirms the gate once reached another realm.        |
| Realm-Touched Creature   | Optional one controlled creature, echo, corpse, fossil, or track without a full realm ecology system.         |
| Teaser Resource          | Mana Crystal remains functional; an inert realm fragment can foreshadow future portal recipes.                |
| UI                       | Compact inspection panel with status, known facts, unknown destination, and future requirements.              |
| No Activation            | The POC must not accidentally imply that full realm travel is implemented or imminent in the first slice.     |

## 19.1 First Post-POC Vertical Slice

The first dimensional implementation milestone should not attempt an infinite major world. It should prove a stable portal transition into a small expedition region with one clear realm rule, one survival adaptation, one native or faction interaction, one resource chain, one structure, one threat, a reliable return route, and one visible consequence in the Overworld. Only after that loop works should the project expand toward procedural realm regions and permanent settlement simulation.

# 20. Dimension Registry v0.1

The entries below are planning records. Working names, exact lore, biome counts, resource lists, peoples, and progression positions remain editable as later culture, story, economy, and technical documents develop.

| **ID**                              | **Working Name**      | **Class**                | **Primary Systems**                                                              | **Status**         |
|-------------------------------------|-----------------------|--------------------------|----------------------------------------------------------------------------------|--------------------|
| realm.major.verdant_covenant        | Verdant Covenant      | Major Living/Fae         | nature magic; promise law; living resources; native courts; seasonal world state | Alpha candidate    |
| realm.major.ancestral_veil          | Ancestral Veil        | Major Spirit Layer       | ancestors; memory; death recovery; spirit diplomacy; cleansing                   | Future major       |
| realm.network.somnolent_expanse     | Somnolent Expanse     | Dream Network            | dream travel; nightmare threats; prophecy; memory; dream resources               | Future major       |
| realm.major.aetheric_reach          | Aetheric Reach        | Major Sky Realm          | sky settlements; storm power; vessels; gases; vertical logistics                 | Future major       |
| realm.major.impossible_deep         | Impossible Deep       | Major Deep Realm         | pressure survival; deep cultures; forge materials; seismic systems               | Future major       |
| realm.artificial.world_engine       | World-Engine          | Artificial Major Realm   | ancient magitech; machine factions; repair; portal control                       | Late game          |
| realm.cluster.ashen_lower           | Ashen Lower Realms    | Realm Cluster            | infernal politics; heat industry; contracts; dangerous fuels                     | Late game          |
| realm.interstitial.void_between     | Void Between          | Interstitial Realm       | voidstone; spatial logistics; portal risk; existential threats                   | Late/endgame       |
| realm.network.divine_concords       | Divine Concords       | Domain Network           | religion; blessings; trials; divine politics; relics                             | Story dependent    |
| realm.cluster.necropolis_domains    | Necropolis Domains    | Artificial/Death-Touched | necromancy; undead society; soul ethics; forbidden labour                        | Optional dark path |
| realm.cluster.elemental_confluences | Elemental Confluences | Primordial Cluster       | power generation; catalysts; elemental ecology; climate control                  | Mid/late branches  |
| realm.family.created_pockets        | Created Pockets       | Pocket Realm Family      | vaults; trials; farms; prisons; labs; sanctuaries                                | Late utility       |

## 20.1 Sample Detailed Entry: Verdant Covenant

| **Field**           | **Draft Value**                                                                                                                        |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Classification      | Major Living/Fae Realm                                                                                                                 |
| Core Fantasy        | A beautiful but politically dangerous living world where seasons, names, promises, emotion, and hospitality can become physical law.   |
| Arrival             | A restored ancient gate reaches a neutral sanctuary maintained by a small cross-cultural embassy or abandoned covenant site.           |
| Realm Rules         | Mana-rich ecology; seasonal regional shifts; spoken promises can create enforceable magical states in recognised territories.          |
| Survival            | Breathable; unfamiliar foods; aggressive overgrowth; emotional and seasonal weather; safe shelter must respect local living materials. |
| Civilisations       | Several Fae courts, mortal diasporas, living settlements, wandering seasonal peoples, and disputed neutral enclaves.                   |
| Resources           | Living wood, fae seed, seasonal resin, oath-thread, glamour crystal, rare covenant heart.                                              |
| Automation          | Nature-compatible machines, living conduits, negotiated harvesting, growth cycles, and anti-blight systems.                            |
| Conflict            | Court politics, broken ancient treaty, extraction disputes, corrupted seasonal force, or hostile promise-bound sovereign.              |
| Overworld Impact    | Nature automation, new crops, living construction, Fae migration, seasonal weather, trade goods, and political obligations.            |
| Primary Progression | Diplomacy + exploration + restoration with combat and alternative alliances available.                                                 |

# 21. Portal and Anchor Registry v0.1

| **ID**                        | **Type**                 | **Use**                                                              | **Progression**      |
|-------------------------------|--------------------------|----------------------------------------------------------------------|----------------------|
| portal.dormant.rune_arch      | Dormant Ancient Arch     | POC teaser; inspectable damage and unknown destination.              | POC Required         |
| portal.breach.natural_rift    | Natural Rift             | Temporary event access, creature leak, hazard, rare resource.        | Post-POC             |
| portal.ancient.fixed_gate     | Restored Ancient Gate    | First reliable fixed route to a discovered anchor.                   | Alpha                |
| portal.player.experimental    | Experimental Player Gate | High-cost temporary or unstable constructed route.                   | Mid/late             |
| portal.civil.passenger_gate   | Civil Passenger Gate     | Regular NPC travel, diplomacy, migration, and customs.               | Late                 |
| portal.freight.large_aperture | Freight Aperture         | Bulk cargo, carts, golems, vehicles, industrial throughput.          | Late                 |
| portal.network.routing_gate   | Network Routing Gate     | Multiple anchors, remote monitoring, permissions, emergency control. | Endgame              |
| anchor.arrival.sanctuary      | Arrival Sanctuary Anchor | Safe first destination and emergency return point.                   | First realm          |
| anchor.settlement.civil       | Civil Settlement Anchor  | Trade, migration, law, and portal services.                          | Realm integration    |
| anchor.wild.expedition        | Wild Expedition Anchor   | Remote exploration with limited support and greater risk.            | Optional exploration |

# 22. Balancing and Content Rules

- Every major realm must add at least one meaningful rule beyond visual identity.

- Every major realm needs a reason to visit, a reason to stay, and a reason to return later.

- Realm resources must preserve the long-term usefulness of established materials.

- Portal travel must not erase roads, mounts, ships, rail, caravans, or local exploration.

- First arrival must be readable enough to prevent unavoidable failure.

- Harsh environmental systems should offer preparation, mitigation, local adaptation, and difficulty settings.

- Native peoples require daily life, internal diversity, political agency, and reactions to settlement or extraction.

- Conquest and exploitation can exist, but consequences must be systemic rather than cosmetic.

- Automation should adapt to realm conditions rather than simply switching off.

- Portal failures must be caused, warned, and recoverable rather than random punishment.

- No realm should require one mandatory combat boss if diplomacy, restoration, or ritual is more appropriate.

- Major world-state outcomes should visibly affect terrain, settlements, routes, factions, and available systems.

- POC scope remains teaser-only; the first playable realm is a separate vertical slice milestone.

# 23. Open Questions for Later Documents

- Final names, cosmological terminology, and cultural interpretations of each realm.

- Which race or culture story unlocks the first stable portal route.

- Exact first-realm biome roster, native peoples, factions, boss or sovereign, and resource chain.

- Portal construction recipes, frame tiers, fuel costs, throughput values, and maintenance frequency.

- Detailed economy rules for portal tolls, customs, migration, smuggling, and strategic monopolies.

- Combat and defence rules for portal invasions, quarantine, siege, and realm-scale threats.

- Player settlement governance, law, districts, and sovereignty across dimensions.

- Full crop, livestock, disease, and invasive ecology models.

- Exact technical strategy for multi-realm save data, streaming, seed derivation, and server simulation.

- How dream, spirit, death, resurrection, and soul ownership rules connect to player and NPC mortality.

# Appendix A. Dimension Database Field Template

| **Category** | **Fields**                                                                                     |
|--------------|------------------------------------------------------------------------------------------------|
| Identity     | realm_id; display_name; aliases; realm_type; origin_type; lore_summary; planning_status        |
| Discovery    | rumour_state; evidence_ids; codex_state; required_knowledge; first_anchor_id                   |
| Visual       | sky_profile; celestial_profile; lighting; fog; weather; audio; material_variation_profile      |
| Rules        | gravity; time; atmosphere; survival; rest; death; building; navigation; map behaviour          |
| Magic        | mana_density; school_modifiers; ritual_rules; corruption; leyline_profile; portal_affinity     |
| Generation   | generation_mode; seed_rule; regions; biomes; vertical_layers; structures; guaranteed_landmarks |
| Ecology      | creature_pools; crop_rules; invasive_rules; migration; ecosystem_state                         |
| Civilisation | peoples; factions; settlements; laws; trade; migration; colonisation_reaction                  |
| Resources    | resource_families; stabilisation; extraction; automation; export; strategic tags               |
| Progression  | access_requirements; milestones; boss_or_gate; rewards; dependencies; Overworld effects        |
| Simulation   | active detail; far tick; production bounds; event budget; multiplayer sync                     |

# Appendix B. Portal Database Field Template

| **Category** | **Fields**                                                                           |
|--------------|--------------------------------------------------------------------------------------|
| Identity     | portal_id; portal_type; frame_family; culture; owner; faction; state                 |
| Connection   | origin_anchor; destination_anchor; realm; region; address_method; discovered         |
| Power        | power_type; startup_cost; sustained_cost; fuel; battery; leyline link                |
| Stability    | base_stability; modifiers; storm effect; contamination; overload; malfunction table  |
| Capacity     | aperture size; passengers; cargo classes; vehicles; throughput; queue                |
| Security     | permissions; locks; wards; guards; inspection; destination filter; shutdown rights   |
| Maintenance  | parts; calibration; cleansing; cooling; service interval; specialist job             |
| Transition   | duration; visual profile; motion option; hazard; emergency return; loading behaviour |
| Simulation   | active visual flow; far traffic summary; route disruption; multiplayer ownership     |

# Appendix C. Realm Design Checklist

- What makes this realm mechanically different within the first ten minutes?

- What does the player need to survive, and how is that requirement signposted?

- What can be built, mined, farmed, automated, restored, traded, or governed?

- Who lives here, what do they need, and what political agency do they possess?

- What resources remain valuable outside the realm and which existing materials remain necessary?

- How do local creatures, weather, magic, and structures communicate ecology and danger?

- What are the non-combat progression routes?

- How does the portal work, who controls it, and what can disrupt it?

- What settlement progression is possible?

- What consequences return to the Overworld?

- What can permanently change in the realm?

- What accessibility and difficulty controls are required?

- How does the realm simulate when no player is present?

# Appendix D. Cross-System Use Matrix

| **System**      | **Dimension Requirement**                                                                         |
|-----------------|---------------------------------------------------------------------------------------------------|
| Blocks          | Realm families, states, portal frames, hazards, construction, dynamic material variation.         |
| Items           | Keys, catalysts, protective gear, resources, maps, relics, trade goods, knowledge.                |
| Recipes         | Portal assembly, stabilisation, adaptation, local processing, restoration, cross-realm synthesis. |
| Resources       | Local deposits, strategic materials, stabilisation, Overworld utility, political value.           |
| Progression     | Knowledge, reputation, settlement, boss, ritual, research, and branching access.                  |
| NPC/Villages    | Migration, outposts, native settlements, jobs, supplies, law, memory, world-state reactions.      |
| Automation      | Realm adaptation, local power, freight, maintenance, simulation LOD, portal logistics.            |
| Magic           | Attunement, rituals, anchors, mana laws, corruption, wards, realm schools.                        |
| Creatures       | Native ecology, migration, invasive species, realm bosses, domestication, resources.              |
| Biomes/Worldgen | Seeded regions, authored anchors, vertical layers, hazards, dynamic state.                        |
| Structures      | Gate complexes, sanctuaries, settlements, wonders, dungeons, restoration projects.                |
| Races/Factions  | Native peoples, diasporas, portal empires, cultural interpretations, treaties, conflict.          |

# Appendix E. POC Success Criteria

- The portal is visually readable as ancient dimensional infrastructure rather than decoration.

- The player can inspect it and understand that specific components are damaged or missing.

- One limited interaction produces clear magical, audio, visual, and UI feedback.

- The site connects to the village mage, ruin, mana resources, and future progression.

- Environmental evidence implies another realm without requiring a playable destination.

- The POC does not promise or expose incomplete full portal travel.

- The data model can later replace the dormant state with a functional portal without rebuilding the structure system.
