**Fantasy Voxel Civilisation Sandbox**

**13 - Races, Peoples, Cultures and Factions**

*Version 0.1 - Detailed Design Bible Draft*

| **Civilisation System Statement**                                                                                                                                                                                                                                          |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| A database-ready system for ancestries, peoples, cultures, factions, governments, religions, languages, laws, diplomacy, war, migration, heritage, player origins, territorial influence, cultural architecture, economic identity, and proof-of-concept faction conflict. |

| **Field**            | **Locked Direction**                                                                                                                                                                                                                              |
|----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Document Scope       | Full design-bible document covering ancestry, heritage, cultures, languages, factions, governments, law, religion, diplomacy, war, territory, economy, migration, intelligent hostile societies, history, data fields, registries, and POC scope. |
| Core Philosophy      | Ancestry, culture, faction, settlement, religion, language, and government are separate but interconnected identities. No people is inherently good or evil.                                                                                      |
| World Direction      | Use familiar fantasy foundations transformed through original cultures, histories, regional variants, mixed populations, migrations, realm links, and political change.                                                                           |
| Simulation Direction | Cultures and factions can emerge, evolve, merge, split, migrate, conquer, assimilate, resist, decline, disappear, revive, or hybridise through world simulation and player action.                                                                |
| POC Direction        | Prove one mostly human forest-hamlet culture with a mixed population, one local goblin raider clan that does not represent all goblins, basic reputation and ownership, cultural architecture, and a regional faction reference.                  |
| Data Direction       | Use unique IDs and layered records for ancestry, lineage, culture, subculture, faction, settlement, religion, language, government, treaty, territory, membership, and historical event.                                                          |

# Document Purpose

This document defines how intelligent peoples and political organisations work across the Fantasy Voxel Civilisation Sandbox. It establishes the distinction between biological ancestry, cultural identity, faction membership, settlement citizenship, religion, language, government, and personal allegiance. It also explains how these layers affect architecture, trade, recipes, magic, law, diplomacy, war, migration, NPC behaviour, player origins, territorial control, and world history.

The system is designed to support a living world where the same ancestry can belong to many cultures, one culture can contain many ancestries, and factions can span or divide cultures. A goblin raider is therefore a member of a hostile faction, not proof that all goblins are hostile. A human kingdom is one political organisation, not the definition of humanity. This separation is essential for believable civilisations and meaningful player choice.

This document does not replace the NPC Village System, Magic System, Structures document, Biomes and World Generation document, Creatures and Monsters document, Economy System, Combat and Defence System, Dimensions document, or Player Settlement System. It defines the race-, culture-, and faction-facing rules those systems must support.

# Design Source

| **Source Document**              | **Relevant Direction**                                                                                                                   | **How This Document Uses It**                                                                       |
|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible    | Living civilisations, race-specific stories, faction choice, conquest, destruction, player freedom, and civilisation-scale consequences. | Defines peoples and factions as core world systems rather than cosmetic lore.                       |
| 01 - Core Gameplay Loop          | Explore, interact, trade, defend, upgrade and expand across villages, cultures, factions and dimensions.                                 | Turns culture and faction discovery into a recurring gameplay loop.                                 |
| 02 - Player Progression          | No class lock; progression through reputation, knowledge, villages, leadership, conquest and exploration.                                | Makes ancestry traits useful but non-mandatory and keeps all professions and magic paths learnable. |
| 03-06 - Registries and Resources | Blocks, items, recipes and resources support cultural goods, faction seals, village projects and strategic resources.                    | Adds culture/faction tags, unlocks, preferences, ownership and political value.                     |
| 07 - NPC Village System          | Named NPCs, jobs, families, warehouses, memory, laws, reputation, migration and settlement growth.                                       | Defines how individuals participate in culture and faction systems.                                 |
| 08-09 - Automation and Magic     | Automation and magic affect villages, law, labour, infrastructure and forbidden practices.                                               | Creates culture-specific technology, magic traditions, regulation and political conflict.           |
| 10 - Creatures and Monsters      | Intelligent enemies can be factions with motives, diplomacy and non-combat outcomes.                                                     | Separates intelligent peoples from hostile factions and supports surrender, reform and alliance.    |
| 11-12 - Worldgen and Structures  | Regions, settlements, roads, ruins, camps and structures use culture/faction ownership and historical state.                             | Makes culture and faction identity visible in world generation and architecture.                    |

# Static Table of Contents

- 1\. Locked Civilisation Identity

- 2\. Player Answer Decision Summary

- 3\. System Architecture

- 4\. Parent Data Model and Identity Layers

- 5\. Ancestry, Species, Lineage and Heritage

- 6\. Player Character Origin and Ancestry

- 7\. Core Intelligent Peoples Framework

- 8\. Culture System

- 9\. Language, Names, Clothing, Food and Taboos

- 10\. Cultural Architecture, Materials and Infrastructure

- 11\. Government, Law and Social Structure

- 12\. Religion, Philosophy and Magical Tradition

- 13\. Faction Types and Organisation

- 14\. Reputation, Diplomacy and Information Flow

- 15\. Territory, War, Conquest and Occupation

- 16\. Economy, Labour, Technology and Strategic Resources

- 17\. Migration, Families, Heritage and Cultural Change

- 18\. Intelligent Enemies, Raiders and Monster Societies

- 19\. History, Myth, Ancient Civilisations and Legitimacy

- 20\. Integration With Worldgen, Structures, NPCs, Magic and Automation

- 21\. Simulation LOD, Performance and World Settings

- 22\. Proof-of-Concept Scope

- 23\. Detailed Registry v0.1

- 24\. Example Culture and Faction Profiles

- 25\. Balancing and Representation Rules

- 26\. Open Questions for Later Documents

- Appendix A. POC Checklist

- Appendix B. Database Field Templates

- Appendix C. Relationship and Membership Types

- Appendix D. Future People and Culture Backlog

- Appendix E. POC Success Criteria

# 1. Locked Civilisation Identity

The Races, Peoples, Cultures and Factions system is the identity and politics layer of the game. It explains who people are biologically, how they live culturally, what organisations they belong to, what they believe, what laws they follow, which territory they control, and how these identities change over time.

| **Locked Rule**                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| No ancestry is inherently heroic, evil, civilised, primitive, magical, industrial, peaceful, or hostile. Behaviour comes from individuals, cultures, factions, circumstances, history, leadership, resources, law, and player action. |

| **Identity Layer**    | **Design Meaning**                                                                                              | **Player-Facing Result**                                                                             |
|-----------------------|-----------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|
| Ancestry / Species    | Biological body plan, senses, lifespan, environmental tolerances, inherited traits and reproduction rules.      | Characters look, move and interact differently without being locked into a profession or morality.   |
| Lineage / Heritage    | Regional, magical, transformed, realm-linked or mixed biological variation.                                     | Supports distinct silhouettes and traits without turning every variant into a separate civilisation. |
| Culture               | Shared language, names, food, architecture, work customs, faith, values, rituals, magic traditions and history. | Settlements feel recognisable, coherent and worth learning.                                          |
| Faction               | An organised group with goals, leadership, resources, membership, territory, relationships and memory.          | Players can ally, trade, negotiate, infiltrate, oppose, conquer or reform organisations.             |
| Settlement            | A local population and physical place with ownership, laws, storage, projects and political status.             | Reputation and permissions can differ village by village.                                            |
| Religion / Philosophy | Spiritual, ethical or cosmological tradition that may cross cultures and factions.                              | Faith affects rituals, laws, diplomacy, buildings and magic without being ancestry-locked.           |
| Government            | Decision-making and authority structure.                                                                        | Leadership, succession, taxes, law, war and player authority differ by society.                      |
| Personal Identity     | Individual personality, family, job, beliefs, loyalties, memories and choices.                                  | NPCs remain people rather than copies of their culture tags.                                         |

## 1.1 Naming and Terminology

The official document title is “Races, Peoples, Cultures and Factions.” In player-facing dialogue, “people,” “folk,” “kin,” specific ancestry names, or culturally appropriate terms are preferred. Technical data may use Species, Ancestry and Lineage. “Race” remains available as a familiar player-facing category but should not collapse biology, culture and politics into one field.

## 1.2 Core Design Promises

- Ancestry and culture are separate but interconnected.

- Cultures can contain multiple ancestries, and ancestries can belong to many cultures.

- Factions can span cultures or divide one culture into competing organisations.

- Cultures and factions can evolve through simulation and player influence.

- Hostile groups have motives, resources, leadership, territory and possible non-combat outcomes.

- Culture is visible through buildings, materials, schedules, food, clothing, language, law, magic and economy.

- Player freedom includes helper, trader, outsider, mediator, ruler, conqueror, reformer and destroyer paths.

# 2. Player Answer Decision Summary

All 180 questionnaire answers were accepted as recommended, with Question 23 combining options D and E. The resulting direction is the broadest layered simulation model, implemented through scalable detail and a deliberately small POC subset.

| **Area**                 | **Locked Decision**                                                                                                                                                        |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Terminology and identity | Use separate ancestry/species, lineage, culture, faction, settlement, religion, language and government identities.                                                        |
| Player ancestry          | World settings can support fixed, chosen, random or discovered ancestry. Ancestry traits are useful but never profession- or magic-locking.                                |
| Core roster              | Use a curated mix of familiar fantasy foundations and original peoples, with no hard final limit and controlled staged expansion.                                          |
| Culture model            | Authored cultural families with procedural regional variants, mixed populations and emergent hybrid cultures.                                                              |
| Architecture             | Culture affects silhouettes, block variants, materials, layout, storage, defence, automation and magical infrastructure.                                                   |
| Government and law       | Modular governments and functioning laws affect ownership, crime, authority, projects, diplomacy and succession.                                                           |
| Religion and magic       | Faiths and philosophies can cross cultures; gods and supernatural entities exist within a layered, disputed cosmology.                                                     |
| Faction organisation     | Support households, clans, settlements, guilds, religions, kingdoms, merchant networks, criminal groups and realm-scale factions.                                          |
| Diplomacy                | Use multidimensional reputation, gradual information flow, treaties, disguises, faction memory and autonomous diplomacy.                                                   |
| War and territory        | Borders, conquest, occupation, resistance, vassalage, liberation and settlement destruction are dynamic and configurable.                                                  |
| Economy and labour       | Cultural demand, strategic resources, labour customs, technology diffusion and automation politics affect faction power.                                                   |
| Migration and heritage   | Refugees, diaspora, mixed families, inheritance, assimilation, revival and emergent player-settlement culture are supported.                                               |
| Intelligent enemies      | Raiders, cultists, bandits and monster societies are contextual factions, not inherent moral categories.                                                                   |
| History                  | Ancient civilisations persist through ruins, laws, language, descendants, relics, myths and competing claims.                                                              |
| POC                      | Mostly human forest hamlet with a mixed population, culturally distinct architecture, local goblin raider clan, regional faction reference and basic reputation/ownership. |
| Data                     | Use layered parent records, relationship graphs, persistent history, multi-affiliation NPCs and mod-ready data.                                                            |
| Simulation               | Detailed local simulation, regional summaries and strategic global ticks; configurable war, destruction, migration and politics.                                           |

# 3. System Architecture

The system uses linked records rather than one monolithic “race” entry. The player sees readable names and relationships; internally, NPCs and settlements reference several identity records at once.

| **Layer**                     | **Purpose**                                     | **Examples**                                                   |
|-------------------------------|-------------------------------------------------|----------------------------------------------------------------|
| Base Ancestry Definition      | Biological rules and body compatibility.        | Human, dwarf, goblin, draconic, fungal, construct.             |
| Lineage Definition            | Inherited or transformed variation.             | Frost dwarf, deep goblin, fae-touched human, awakened golem.   |
| Culture Definition            | Shared social and material identity.            | Riverward Hamlets, Emberhold Clans, Moonroot Courts.           |
| Subculture / Regional Variant | Local adaptation and historical branch.         | Northern Riverward, border marcher, diaspora quarter.          |
| Faction Definition            | Organised actor with goals and resources.       | Crown, guild, temple, raider clan, rebellion, merchant league. |
| Settlement Definition         | Local place, population and authority.          | Hamlet, city ward, fortress, refugee camp, monastery.          |
| Government Definition         | Authority and succession model.                 | Council, monarchy, guild oligarchy, commune, theocracy.        |
| Religion / Philosophy         | Beliefs, rites and institutions.                | Ancestor path, leyline faith, rational arcane school.          |
| Language Definition           | Speech, script, translation and naming grammar. | Trade Tongue, Hold-Rune, Deep Cant.                            |
| Relationship Graph            | Typed links and changing values.                | Alliance, rivalry, vassalage, trade pact, grievance, kinship.  |
| Historical Event Record       | Persistent world memory.                        | War, migration, founding, schism, conquest, treaty, disaster.  |

# 4. Parent Data Model and Identity Layers

| **Record Type**     | **Core Fields**                                                                                                                                                                                                                                                |
|---------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ancestry            | ID, display name, body profile, size, senses, lifespan, environmental tolerances, locomotion, dietary tags, equipment fit, heritage rules, traits, weaknesses, mitigation paths, reproduction compatibility, visual families.                                  |
| Culture             | ID, cultural family, region tags, ancestry demographics, languages, naming rules, architecture set, material preferences, foods, clothing, schedules, laws, taboos, faiths, magic traditions, economy, government defaults, festivals, stories, relationships. |
| Faction             | ID, faction type, culture links, ancestry demographics, leadership, membership rules, goals, ideology, laws, territory, resources, economy, military, magic, technology, diplomacy, reputation dimensions, memory, history, simulation state.                  |
| NPC Identity        | NPC ID, ancestry, lineage, culture, subculture, settlement, citizenship, family, faith, profession, guilds, political faction, secret faction, languages, personal traits, memories and loyalties.                                                             |
| Settlement Identity | Settlement ID, culture blend, faction owner, government, laws, languages, demographics, districts, architecture, projects, territory, resources, history, migration and reputation state.                                                                      |
| Relationship Edge   | Source, target, edge type, trust, fear, respect, grievance, obligation, legitimacy, treaty terms, information level, start/end dates and public/secret state.                                                                                                  |

| **Important Data Rule**                                                                                                                                                                     |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Planning labels such as POC Required, Alpha, Final Game, Placeholder and Deferred remain documentation metadata. They are not inherited gameplay traits of an ancestry, culture or faction. |

# 5. Ancestry, Species, Lineage and Heritage

Ancestry describes biological form and inherited capability. It should create identity and interaction differences without becoming a class system or a permanent disadvantage. Contextual weaknesses can be mitigated through equipment, skills, food, medicine, magic, technology or cultural support.

| **Design Area**     | **Locked Rule**                                                                                                                          |
|---------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Mechanical strength | Traits provide noticeable identity and utility but do not make an ancestry mandatory for a profession, school or automation path.        |
| Weaknesses          | Use contextual vulnerabilities rather than punitive permanent penalties. Provide mitigation paths.                                       |
| Mastery             | One character can eventually master all professions and magic paths regardless of ancestry.                                              |
| Transformation      | Rare story, ritual, curse, blessing, reincarnation, construct-transfer and realm events can change ancestry or form.                     |
| Equipment           | Body plans may require adapted armour, tools, furniture or building dimensions, but equivalent functionality must exist.                 |
| Mixed heritage      | Data-driven blending is supported only where biologically and narratively compatible; culture inheritance remains separate from biology. |
| Personhood          | Construct, undead, elemental, colony and spirit personhood can be legally and culturally contested.                                      |

# 6. Player Character Origin and Ancestry

| **Option**          | **Design**                                                                                                              |
|---------------------|-------------------------------------------------------------------------------------------------------------------------|
| World setting       | Choose whether the player is fixed, selected, randomised or discovers their true form/origin during play.               |
| Character creation  | Ancestry, lineage, cultural origin and personal history are independent selections where enabled.                       |
| Outsider origin     | A standard origin with no initial cultural membership; provides harder diplomacy but broad neutrality.                  |
| Culture-born origin | Starts with modest familiarity, language, clothing, a small recipe package and initial relationships.                   |
| Refugee / Exile     | Starts with cultural knowledge but altered faction standing and personal story hooks.                                   |
| Mixed heritage      | Combines eligible visual and biological traits while culture is chosen from upbringing, residence or personal identity. |
| No permanent lock   | Starting knowledge accelerates a path but does not prevent learning other cultures, languages, recipes or magic.        |

# 7. Core Intelligent Peoples Framework

The final game has no hard ancestry cap. Development begins with a controlled core roster, then expands through regions, underground layers, magical biomes, dimensions and content packs. Familiar fantasy peoples provide readability, but cultures, histories and variants should be original.

| **People Family**        | **Design Direction**                                                                                          | **Example Variation Space**                                                          |
|--------------------------|---------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------|
| Humans                   | One broad ancestry with many unrelated cultures, kingdoms, diasporas and faiths.                              | River farmers, marcher towns, desert caravan states, arcane republics, sea kingdoms. |
| Elven Peoples            | Several closely related ancestries and many cultures shaped by biome, magic and realm contact.                | Forest, highland, nocturnal, fae-linked, urban mixed populations.                    |
| Dwarven Peoples          | Broad ancestry with underground, surface, volcanic, frost and wandering cultures.                             | Rune holds, trade enclaves, forge communes, ancestor monasteries.                    |
| Orcish Peoples           | Diverse civilisations including clans, kingdoms, nomads, industrial communities and raider factions.          | Pastoral confederacies, frontier forts, mercenary republics, war cults.              |
| Goblin Peoples           | Full civilisation spectrum; POC raiders are only one local clan.                                              | Tinker towns, cave communes, caravan traders, scavenger clans, scholars.             |
| Beastfolk Families       | Parent category with distinct lineages, cultures and mixed settlements.                                       | Canid, feline, avian, cervine, reptilian and original fantasy lineages.              |
| Draconic Peoples         | Distinct from true dragons, dragon-blooded mortals and constructed drakes.                                    | Scaled cityfolk, volcanic clans, sky monasteries, imperial bloodlines.               |
| Fae Peoples              | Broad supernatural category containing peoples, courts, spirits, transformed mortals and realm-born lineages. | Seasonal courts, household fae, wild hosts, dreamborn.                               |
| Undead Peoples           | Mindless undead, cursed individuals, ancestral guardians and full civilisations are separate categories.      | Memory cities, bone monasteries, oathbound guardians, necromantic states.            |
| Construct Peoples        | Tools, programmed golems, awakened individuals and potential construct civilisations are distinguished.       | Forge-born, archive minds, liberated labour golems, ancient machine folk.            |
| Elemental Peoples        | Spirits through embodied realm-based civilisations.                                                           | Stonekin, emberfolk, stormborn, river spirits, crystal minds.                        |
| Aquatic Peoples          | Coastal, river, amphibious, deep-ocean and realm-linked peoples.                                              | Reef cities, river clans, abyssal courts, marsh communities.                         |
| Plant and Fungal Peoples | Different forms of individuality, memory and reproduction.                                                    | Rootbound, mobile plantfolk, spore colonies, mycelial councils.                      |
| Giantkin                 | Several size-scaled peoples requiring building and equipment accommodation.                                   | Mountain giants, compact giant-descended folk, wandering titan clans.                |

# 8. Culture System

Culture is a layered authored system with procedural regional branches and settlement histories. It is generated from ancestry mix, environment, history, religion, economy, technology, magic, government and neighbouring societies. Cultural values are weighted norms, never universal personality rules.

| **Culture Component** | **Examples of Data and Gameplay**                                                                                |
|-----------------------|------------------------------------------------------------------------------------------------------------------|
| Demographics          | Majority/minority ancestries, households, migration history and mixed-heritage patterns.                         |
| Environment           | Climate adaptation, settlement placement, building materials, work hours, clothing and food preservation.        |
| History               | Founding, wars, migrations, disasters, ancient inheritance, grievances and alliances.                            |
| Economy               | Signature exports, labour organisation, trade partners, scarcity, strategic resources and automation acceptance. |
| Magic                 | Preferred schools, rune styles, rituals, mage institutions, forbidden practices and mana infrastructure.         |
| Religion              | Faiths, philosophies, sacred sites, festivals, burial, charity, law and conflict.                                |
| Government            | Default authority structures, leadership legitimacy, citizenship, property and succession.                       |
| Material culture      | Architecture, tools, furniture, clothing, symbols, food, art, roads and storage customs.                         |
| Social norms          | Hospitality, privacy, family, work, honour, education, age, status and conflict resolution.                      |
| Dynamic state         | Reform, schism, hybridisation, decline, revival, occupation, diaspora and generational change.                   |

## 8.1 Cultural Evolution

- New cultures can emerge from colonies, faction splits, refugees, hybrid settlements, religious reform, revolutions, realm contact and player-founded societies.

- Cultures can decline or disappear, but ruins, descendants, customs, laws, language fragments and revival paths remain.

- Mixed cultures inherit architecture, foods, laws, names, festivals, recipes and relationships rather than becoming simple palette swaps.

- Internal disagreements include generational, religious, magical, regional, class and economic divisions that may create subcultures or factions.

- Player-founded settlements develop emergent culture from residents, laws, architecture, economy, magic, history and festivals.

# 9. Language, Names, Clothing, Food and Taboos

| **System**           | **Locked Direction**                                                                                                      |
|----------------------|---------------------------------------------------------------------------------------------------------------------------|
| Languages            | Lightweight language system affecting speech, scripts, signs, books, translation, lore and diplomacy.                     |
| Language barriers    | Configurable; support gestures, interpreters, magic, books, immersion and gradual learning.                               |
| Naming               | Grammar, family customs, lineage, titles, professions, nicknames and regional variants.                                   |
| Food                 | Cuisine reflects biome, agriculture, faith, wealth, festival, preservation and trade; recipes have buffs and trade value. |
| Clothing             | Shows culture, biome, profession, class, faith, faction, wealth, season and personal history.                             |
| Taboos               | May cover food, magic, death, creatures, sacred sites, machines, trade and relationships; reactions depend on context.    |
| Individual variation | NPC personality and subculture can disagree with cultural norms.                                                          |

# 10. Cultural Architecture, Materials and Infrastructure

Culture must be visible before the player opens a menu. Settlement silhouette, roads, roofs, storage, defensive layout, ritual sites, work buildings, banners, lighting and machine placement should communicate identity.

| **Area**             | **Cultural Variation**                                                                                         |
|----------------------|----------------------------------------------------------------------------------------------------------------|
| Architecture         | Silhouette, materials, roof logic, room use, hierarchy, family structure, climate response and growth pattern. |
| Block variants       | Engine-driven cultural material variation plus selected unique structural and functional blocks.               |
| Biome adaptation     | A culture retains recognisable principles while adapting to terrain, climate, local resources and neighbours.  |
| Settlement layout    | Roads, districts, sacred centres, markets, land use, defence, workshops, water and emergency planning.         |
| Storage              | Household, communal, guild, temple, military and magical storage with different access and reserve customs.    |
| Defence              | Terrain use, patrols, fortification, wards, traps, militia, creatures, weapons and siege response.             |
| Automation           | Shared foundations with distinct power sources, machine families, layouts, risks and social priorities.        |
| Magic infrastructure | Rune styles, shrines, wards, mana handling, ritual geometry, magical schools and taboos.                       |
| Player learning      | Unlock cultural styles through reputation, apprenticeship, books, ruins, trade, observation and membership.    |
| Hybrid building      | Players can combine styles; mixed settlements may gain new aesthetics, efficiencies, tensions and identity.    |

# 11. Government, Law and Social Structure

| **Government Family** | **Possible Forms**                                                                         |
|-----------------------|--------------------------------------------------------------------------------------------|
| Monarchical           | Hereditary crown, elective monarch, sacred ruler, rotating dynasty, vassal hierarchy.      |
| Council               | Elders, household delegates, guild council, mage conclave, citizen assembly.               |
| Clan / Tribal         | Clan chiefs, moot, war leader, kinship federation, seasonal gathering.                     |
| Guild / Commercial    | Merchant houses, craft oligarchy, charter city, company settlement.                        |
| Religious             | Temple state, oracle rule, monastic council, divine mandate, spirit compact.               |
| Republican            | Elected magistrates, district delegates, citizen militia, mixed constitution.              |
| Communal              | Collective ownership, work councils, village consensus, rotating stewards.                 |
| Magical / Construct   | Archmage rule, rune-administered law, immortal guardian, predictive archive, bound spirit. |

Governments function mechanically. They affect law, property, project approval, taxes, trade, war, migration, services, succession and player authority. Leadership can change through succession, election, appointment, challenge, coup, revolt, conquest, abdication or player intervention.

| **Law Domain**            | **Examples**                                                                                                     |
|---------------------------|------------------------------------------------------------------------------------------------------------------|
| Ownership                 | Private, household, communal, guild, temple, crown, settlement and contested property.                           |
| Trespass and building     | Where the player may enter, mine, place blocks, connect automation or establish outposts.                        |
| Magic                     | Public casting, necromancy, blood magic, mind magic, portals, rituals, constructs and safety standards.          |
| Weapons and creatures     | Carrying weapons, summoning, mounts, dangerous pets, hunting and monster harvesting.                             |
| Trade and labour          | Licences, guild rights, taxes, banned goods, debt, contracts, labour protections and coercion.                   |
| Religion and sacred sites | Desecration, pilgrimage, relic ownership, burial and ritual access.                                              |
| Crime response            | Warnings, repayment, fines, confiscation, imprisonment, labour, exile, bounty, hostility or restorative justice. |

Crime detection uses witnesses, evidence, reports, guards, alarms, magical detection, reputation and delayed information flow. Faction knowledge is not automatically omniscient.

# 12. Religion, Philosophy and Magical Tradition

Religions, philosophies and spiritual traditions can exist within or across cultures and factions. The setting uses a layered cosmology: some gods or entities are demonstrably real, while interpretation, identity, doctrine and divine claims remain disputed. False gods, spirits, ascended beings and unknowable forces also exist.

| **Area**              | **Design Rule**                                                                                                           |
|-----------------------|---------------------------------------------------------------------------------------------------------------------------|
| Faith gameplay        | Affects buildings, festivals, charity, morality, diplomacy, magic, burial, healing, conflict, blessings and world events. |
| Pluralism             | One culture can contain competing religions; one religion can span many cultures.                                         |
| Syncretism and schism | Traditions can merge, reform, split, coexist or become political factions.                                                |
| Magic schools         | Cultural institutions favour schools and techniques, but individuals and players can learn alternatives.                  |
| Forbidden practice    | Reaction depends on law, harm, secrecy, necessity, evidence, status and faction goals.                                    |
| Changing law          | Forbidden magic may become legal or regulated through evidence, crisis, politics, reform or player action.                |
| Ritual knowledge      | Advanced rituals may require culture-specific language, catalysts, specialists, layouts or permissions.                   |
| Sacred protection     | Legal, social, spiritual and magical protection varies by culture and structure.                                          |

# 13. Faction Types and Organisation

| **Scale / Type**       | **Examples and Role**                                                                                |
|------------------------|------------------------------------------------------------------------------------------------------|
| Household and lineage  | Families, noble houses, clans, ancestor lines and inheritance networks.                              |
| Settlement             | Village councils, city governments, fortress commands and neighbourhood blocs.                       |
| Guild                  | Craft, trade, magic, exploration, military, transport, academic and criminal guilds.                 |
| Merchant network       | Caravan leagues, ports, markets, monopolies, merchant houses and trade coalitions.                   |
| Religious organisation | Temples, charities, knightly orders, cults, reformers and theocratic states.                         |
| Political state        | Kingdoms, republics, federations, confederacies, empires, communes and city-states.                  |
| Military / raider      | Armies, mercenary companies, warbands, pirate fleets, raider clans and rebel movements.              |
| Scholarly / magical    | Universities, mage orders, secret societies, archivists, alchemists and realm researchers.           |
| Criminal               | Bandits, smugglers, thieves, black markets, forbidden crafters and corrupt officials.                |
| Ancient / hidden       | Remnant civilisations, dormant constructs, sealed cults, survivor enclaves and dimensional factions. |

A culture may contain any number of factions. A faction may contain many cultures. Every persistent faction should have formation cause, leadership, goals, resources, laws, territory, allies, enemies, internal pressures and unresolved problems.

# 14. Reputation, Diplomacy and Information Flow

Reputation is multidimensional and layered. A player may be respected but feared, trusted but politically illegitimate, loved by one settlement and hated by its ruling faction.

| **Reputation Dimension** | **Meaning**                                                              |
|--------------------------|--------------------------------------------------------------------------|
| Trust                    | Belief that the player will keep promises and avoid betrayal.            |
| Fear                     | Expectation that the player can or will cause harm.                      |
| Respect                  | Recognition of competence, power, courage, craft or status.              |
| Gratitude                | Memory of aid, rescue, gifts, defence and sacrifice.                     |
| Grievance                | Accumulated theft, harm, betrayal, humiliation, death or unpaid debt.    |
| Legitimacy               | Recognition of the player’s authority, title, claim or right to rule.    |
| Familiarity              | How well the group knows the player and how reliable its information is. |
| Ideological alignment    | Compatibility with faction goals, faith, law, technology and morality.   |

- Reputation can exist at individual, family, settlement, culture, faction, religion and regional levels.

- Ordinary memories may fade; major deeds, deaths, betrayals, monuments and records persist.

- Information travels through witnesses, messengers, rumours, roads, caravans, records, magic and communication infrastructure.

- Disguises use clothing, banners, language, forged papers, reputation and magical detection.

- Factions negotiate, trade, ally, feud, marry, split and fight without requiring player involvement.

- Treaties can include borders, tribute, trade, prisoners, access, disarmament, projects, resources, marriage, magic restrictions and guarantees.

# 15. Territory, War, Conquest and Occupation

Territory is visible through map overlays and physical world evidence: roads, farms, forts, shrines, banners, patrols, taxes, materials and settlement styles. Borders change through settlement growth, influence, roads, treaties, migration, war and resource control.

| **Conflict Layer** | **Mechanics**                                                                                                          |
|--------------------|------------------------------------------------------------------------------------------------------------------------|
| Causes             | Territory, resources, trade, religion, magic, old grievances, leadership, succession, defence pacts and player action. |
| Forms              | Battles, raids, sieges, blockades, sabotage, propaganda, embargoes, migration pressure and proxy conflict.             |
| Neutral play       | Neutrality, mediation, mercenary work, trade, humanitarian aid and opportunistic play remain valid.                    |
| Conquest           | Surrender, occupation, vassalage, liberation, negotiated transition, internal revolt and annexation.                   |
| Occupation         | Changes law, symbols, taxation, resources, guards, migration, NPC loyalty, resistance and cultural hybridisation.      |
| Cultural survival  | Adaptation, diaspora, local autonomy, hidden traditions, syncretism, resistance and restoration.                       |
| Destruction        | Settlement destruction is configurable, telegraphed, remembered and recoverable where possible.                        |
| Player claims      | Claim, administer, grant, liberate, share or leave territory independent.                                              |

# 16. Economy, Labour, Technology and Strategic Resources

| **Area**                 | **System Direction**                                                                                                              |
|--------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Cultural value           | Goods have different value according to scarcity, belief, war, technology, festival, status and law.                              |
| Signature exports        | Cultures produce distinctive materials, foods, crafts, machines, magic goods, knowledge and services.                             |
| Strategic assets         | Deposits, leylines, roads, rivers, portals, rare creatures and ruins create diplomacy and conflict.                               |
| Labour customs           | Household, communal, guild, wage, bonded, golem, undead and magical labour systems may exist with legal and ethical consequences. |
| Coercive labour          | May appear only as a serious oppressive system with resistance, liberation, law and consequence; never trivial flavour.           |
| Automation politics      | Acceptance depends on jobs, safety, religion, resource use, ownership, pollution, magic and inequality.                           |
| Technology spread        | Trade, capture, observation, research, defectors, ruins, diplomacy and espionage spread knowledge.                                |
| Independent progress     | Factions develop through research, specialists, resources, trade and war even without the player.                                 |
| Rejection and adaptation | Cultures may reject, regulate, secretly adopt, reinterpret or selectively use technologies.                                       |
| Regional power           | Player production can strengthen settlements, create dependency, provoke rivals, fund wars or reshape diplomacy.                  |

# 17. Migration, Families, Heritage and Cultural Change

| **System**              | **Locked Direction**                                                                                                 |
|-------------------------|----------------------------------------------------------------------------------------------------------------------|
| Migration               | Driven by safety, jobs, family, culture, climate, war, faith, opportunity and player settlements.                    |
| Refugees                | Temporary camps can disperse, integrate, return home, become permanent or form new cultures.                         |
| Cross-cultural families | Relationships are influenced by individuals, law, culture, faction relations and safety.                             |
| Mixed heritage          | Biological blending where compatible; cultural identity inherited through upbringing, community and personal choice. |
| Inheritance             | Property, titles, debts, tools, knowledge, duties and memories follow culture-specific rules.                        |
| Adoption of culture     | Language, residence, ritual, work, belief, citizenship and relationships allow gradual cultural change.              |
| Assimilation            | Can be voluntary, pressured or imposed; resistance, hybridity and diaspora outcomes persist.                         |
| Diaspora                | Maintains language, faith, food, trade, politics, memory and homeland links.                                         |
| Revival                 | Abandoned cultures can return through descendants, archives, language, artefacts, rituals and rebuilding.            |

# 18. Intelligent Enemies, Raiders and Monster Societies

Intelligent enemies should normally possess faction, culture, motive, leadership, territory, supply and relationship data. Combat remains valid, but destruction is not automatically the only or best solution.

| **Topic**                 | **Design Rule**                                                                                                               |
|---------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| POC goblins               | The raiders are one local clan within a broader goblin people.                                                                |
| Surrender                 | Individuals, squads, settlements and leaders can surrender based on morale, losses, leadership and offered terms.             |
| Alliance and reform       | Enemies can become allies through diplomacy, mercy, trade, common threats, leadership change or faction splits.               |
| Monster societies         | Any sufficiently intelligent creature group may develop territory, communication, customs, diplomacy and social organisation. |
| Discovery of intelligence | Codex, law, ethics, harvesting, quests and NPC reactions change when personhood is recognised.                                |
| Necromancers and cultists | Hostility depends on methods, harm, law, ideology and goals, not labels alone.                                                |
| Bandit origins            | Poverty, exile, war, crime, ideology, faction collapse or organised predation.                                                |
| Camp growth               | Raider camps can become forts, markets, mercenary towns, recognised factions or reform communities.                           |
| Alternatives              | Combat, sabotage, negotiation, intimidation, supply disruption, relocation, leadership change and integration.                |

# 19. History, Myth, Ancient Civilisations and Legitimacy

| **Layer**             | **World Function**                                                                                                  |
|-----------------------|---------------------------------------------------------------------------------------------------------------------|
| Ancient evidence      | Ruins, roads, laws, scripts, descendants, artefacts, machines, magic and claims.                                    |
| Legitimacy claims     | Descent, possession, prophecy, restoration, law, religion and archaeology.                                          |
| Procedural history    | Authored frameworks plus seeded wars, migrations, collapses, alliances, disasters and schisms.                      |
| Faction origins       | Every persistent faction records formation cause, goals, founders, resources, relationships and pressure.           |
| Myths                 | Creation, ancestral, heroic, cautionary, magical, local and historical stories.                                     |
| Partial truth         | Myths may preserve distorted history, ritual instructions, realm knowledge, propaganda or real supernatural events. |
| Competing records     | Monuments, education, censorship, archives, oral histories and faction propaganda can disagree.                     |
| Player discovery      | Archaeology, archives, spirits, magic, witnesses and comparative evidence reveal history.                           |
| Political consequence | Historical truth may alter borders, legitimacy, faith, reparations, leadership, war and restoration.                |

# 20. Integration With Worldgen, Structures, NPCs, Magic and Automation

| **Connected System** | **Required Integration**                                                                                                 |
|----------------------|--------------------------------------------------------------------------------------------------------------------------|
| World Generation     | Regions and settlements use culture, faction territory, history, migration, roads, resources, magic and danger layers.   |
| Structures           | Architecture, banners, materials, ownership, occupation, damage, ruins, sacred spaces and faction history.               |
| NPC Village          | Each NPC references ancestry, culture, language, faith, household, settlement, faction memberships and personal beliefs. |
| Blocks and Items     | Culture variants, faction seals, legal ownership, sacred objects, contraband, trade goods and equipment fit.             |
| Recipes              | Culture-taught, faction-locked, forbidden, ritual, construction, food and automation recipes.                            |
| Resources            | Strategic materials, culture goods, contested deposits, sacred resources and illegal substances.                         |
| Magic                | Preferred schools, cultural rune styles, magic laws, public infrastructure, forbidden practice and realm links.          |
| Automation           | Cultural machines, labour effects, regulation, strategic production, faction dependency and sabotage.                    |
| Creatures            | Faction creatures, mounts, sacred animals, hunting laws, intelligent societies and personhood recognition.               |
| Quest and Story      | Reputation, treaties, leadership, cultural growth, historical claims, conflict, migration and reform.                    |

# 21. Simulation LOD, Performance and World Settings

| **Simulation Range** | **Behaviour**                                                                                                 |
|----------------------|---------------------------------------------------------------------------------------------------------------|
| Local detailed       | Individual NPC schedules, conversations, witnesses, patrols, construction, trade, conflict and item movement. |
| Settlement summary   | Population groups, resources, projects, laws, leadership, migration, morale and local faction events.         |
| Regional strategic   | Territory, trade routes, military pressure, alliances, wars, migration flows and cultural influence.          |
| Global abstract      | Major diplomatic shifts, realm factions, world events, strategic resources and historical records.            |

Distant ordinary populations may be abstracted, while important named NPCs remain persistent. Diplomacy updates are event-driven with scheduled strategic ticks. Off-screen wars continue through abstract simulation, with warnings, reports and configurable safeguards.

| **World Setting**   | **Configurable Controls**                                                           |
|---------------------|-------------------------------------------------------------------------------------|
| Political intensity | War frequency, diplomacy speed, faction density, rebellion and border change.       |
| Consequence         | Settlement conquest, destruction, NPC death, exile, assimilation and cultural loss. |
| Migration           | Refugee frequency, settlement founding, diaspora and population movement.           |
| Crime and law       | Witness strictness, punishment severity, theft permissions and bounty systems.      |
| Language            | Disabled, cosmetic, lightweight or immersive learning.                              |
| Player origin       | Fixed, selected, random, discovered or outsider.                                    |

# 22. Proof-of-Concept Scope

The POC should prove that ancestry, culture, faction, settlement, ownership and reputation are separate but connected. It does not need the full final political simulation.

| **POC Element**       | **Required Behaviour**                                                                                                            |
|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Forest hamlet culture | Mostly human regional culture with at least one non-human resident or household, proving mixed culture membership.                |
| Cultural identity     | Farming, timber, practical rune magic, communal storage and frontier defence shape schedules, recipes, architecture and projects. |
| Local village faction | Village authority controls warehouse access, construction permission, trade and watchtower project.                               |
| Goblin raider clan    | Named local clan with banner, camp style, stolen goods, hierarchy, motives and raid pressure.                                     |
| Broader goblin hint   | Optional trader, captive, deserter, letter or camp evidence showing the clan does not represent all goblins.                      |
| Regional faction      | Referenced through a banner, road marker, tax notice, messenger, guard badge or dialogue; no full simulation required.            |
| Reputation            | Village trust, individual memory flags, raider hostility and basic ownership permission.                                          |
| Culture recipes       | Local food, watchtower style, ward/rune item and trade good.                                                                      |
| Architecture          | Watchtower and village use cultural shape, materials, banner, storage logic, builder stages and future upgrade sockets.           |
| Conflict outcome      | Watchtower, supplies, wards and player relationships affect the raid outcome.                                                     |

## 22.1 POC Active Factions

| **Faction**              | **Role**                                                     | **POC Detail**                                                                         |
|--------------------------|--------------------------------------------------------------|----------------------------------------------------------------------------------------|
| Forest Hamlet Council    | Local settlement authority and project owner.                | Detailed local reputation, laws, permissions and named members.                        |
| Briarhook Raider Clan    | Goblin raid source and enemy camp owner.                     | Leader, motives, patrols, stolen supplies, surrender/morale hooks and hostility.       |
| Player Affiliation State | Tracks outsider, helper, contractor, trusted ally or threat. | Not necessarily a formal faction, but ownership and contribution records are required. |
| Regional March Authority | Larger political context.                                    | Referenced only through symbols, road ownership, messages or future obligations.       |

# 23. Detailed Registry v0.1

Version 0.1 defines framework entries rather than a complete final roster. Names below are working placeholders and may be replaced during dedicated lore and naming passes.

| **ID**                      | **Type**        | **Working Name**           | **Scope**     | **Core Role**                                                                    |
|-----------------------------|-----------------|----------------------------|---------------|----------------------------------------------------------------------------------|
| ancestry.human              | Ancestry        | Human                      | POC Required  | Adaptable widespread people with many unrelated cultures.                        |
| ancestry.goblin             | Ancestry        | Goblin                     | POC Required  | Small-bodied intelligent people with diverse communities and factions.           |
| ancestry.elf.kindred        | Ancestry Family | Elven Kindreds             | Final Game    | Related long-lived peoples shaped by biome, magic and realm contact.             |
| ancestry.dwarf              | Ancestry        | Dwarf                      | Alpha         | Robust people with underground, surface, frost, volcanic and wandering cultures. |
| ancestry.orc                | Ancestry        | Orc                        | Alpha         | Diverse people with clans, kingdoms, nomads and industrial societies.            |
| ancestry.construct.awakened | Ancestry        | Awakened Construct         | Final Game    | Self-aware created beings whose legal personhood varies.                         |
| culture.riverward.frontier  | Culture         | Riverward Frontier Folk    | POC Required  | Mixed frontier culture of farms, timber, communal stores and practical runes.    |
| faction.hamlet.council      | Faction         | Forest Hamlet Council      | POC Required  | Local authority overseeing storage, law, projects and defence.                   |
| faction.goblin.briarhook    | Faction         | Briarhook Clan             | POC Required  | Local raider clan with material motives and a raid captain.                      |
| faction.region.march        | Faction         | Regional March Authority   | POC Reference | Larger authority controlling roads, taxation and regional defence.               |
| language.trade.common       | Language        | Common Trade Tongue        | POC Required  | Shared practical language for trade and mixed settlements.                       |
| language.goblin.deepcant    | Language        | Deep Cant                  | POC Light     | Goblin language used in names, camp markings and optional translation.           |
| religion.riverward.hearth   | Religion        | Hearth and River Tradition | POC Light     | Local household rites, seasonal customs and protective ward practice.            |
| government.village.council  | Government      | Village Council            | POC Required  | Elder and household representatives approve projects and permissions.            |

# 24. Example Culture and Faction Profiles

## 24.1 Riverward Frontier Folk - POC Culture

| **Field**    | **Draft Profile**                                                                                                                                      |
|--------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| Identity     | A practical river-and-forest frontier culture built around shared labour, communal reserves, timber craft, farming, safe roads and basic rune wards.   |
| Demographics | Mostly human, with room for goblin, dwarf, elf, beastfolk or other resident households depending on world seed.                                        |
| Architecture | Timber frames, stone foundations, steep roofs, raised stores, river crossings, lantern posts, carved ward beams and visible repair scaffolds.          |
| Economy      | Timber, grain, preserved food, simple ironwork, rune-carved utility goods and caravan support.                                                         |
| Government   | Village council with elder, craft representatives and emergency defence authority.                                                                     |
| Religion     | Hearth, river and ancestor customs; sacred boundaries are practical rather than monumental.                                                            |
| Magic        | Small protective runes, ward lanterns, crop charms and repair magic; dangerous magic is regulated.                                                     |
| Law          | Communal warehouse is protected; theft and unauthorised machine connections reduce trust. Emergency supplies can be requisitioned by council decision. |
| Social tone  | Hospitable to useful outsiders but cautious toward unknown factions and forbidden practices.                                                           |

## 24.2 Briarhook Clan - POC Raider Faction

| **Field**     | **Draft Profile**                                                                                                               |
|---------------|---------------------------------------------------------------------------------------------------------------------------------|
| Identity      | A local goblin raider clan occupying a scrap-built forest camp. They are not the default representation of goblin civilisation. |
| Motives       | Food insecurity, access to iron, revenge for road expansion, ambitious leadership and profitable theft.                         |
| Leadership    | Raid captain supported by scouts, scavengers and a small inner circle.                                                          |
| Camp identity | Hook-shaped banner, stolen crates, timber palisade, scrap metal, traps, lookout platforms and captured tools.                   |
| Economy       | Raiding, salvage, stolen trade goods, mushroom gathering and limited metalworking.                                              |
| Diplomacy     | Can threaten, bargain, demand tribute, surrender, split, reform, relocate or become mercenary depending on later scope.         |
| POC behaviour | Raid hostility and morale are implemented; deeper negotiation can remain teaser or scripted.                                    |

# 25. Balancing and Representation Rules

- Never use ancestry as shorthand for morality, intelligence, profession, civilisation level or faction loyalty.

- Culture should influence probability and institutions, not erase individual personality.

- Every major culture requires strengths, flaws, internal disagreements and historical reasons for its current state.

- No culture should be defined only by war, poverty, faith, magic or one resource.

- Hostile factions need readable motives and counterplay; non-combat options are desirable but not mandatory for every encounter.

- Ancestry traits must remain useful without creating a mandatory meta choice.

- Language, law, religion and politics should be configurable so players can choose simulation depth.

- Oppression, slavery, assimilation and cultural destruction must be treated as serious systems with consequence, resistance and recovery, not decorative flavour.

- Political simulation should create stories without constantly destroying player work or forcing faction babysitting.

- Cultures and factions need strong visual readability through silhouette, materials, banners, clothing, lighting, roads and sound.

# 26. Open Questions for Later Documents

| **Future Document** | **Questions to Resolve**                                                                                                 |
|---------------------|--------------------------------------------------------------------------------------------------------------------------|
| Economy and Trade   | Currency families, taxation, contracts, tariffs, monopolies, market simulation and trade-route ownership.                |
| Combat and Defence  | Faction military roles, formations, morale, surrender, siege logic, prisoners and war crimes.                            |
| Player Settlement   | Citizenship, constitution, lawmaking, districts, elections, appointments, diplomacy and culture emergence.               |
| Dimensions          | Realm peoples, cross-realm diplomacy, portal borders, realm migration and metaphysical ancestry.                         |
| Quest and Story     | Faction arcs, leadership stories, cultural discovery, historical truth and procedural diplomacy quests.                  |
| UI/UX               | Culture codex, faction ledger, map borders, reputation dimensions, treaties, languages and membership display.           |
| Technical AI        | Decision tick frequency, strategic planner, relationship graph limits, conflict resolution and deterministic simulation. |
| Naming and Lore     | Final names, languages, scripts, myths, historical eras and core world geography.                                        |

# Appendix A. POC Checklist

- Mostly human Riverward Frontier culture with at least one non-human resident or household.

- Forest Hamlet Council faction with named leader, law/permission rules and project ownership.

- Briarhook goblin raider clan with distinct banner, camp architecture, leader and motive.

- Basic ancestry and culture IDs on all POC NPCs.

- Village trust, individual memory, raider hostility and warehouse/build permissions.

- One regional faction reference through physical world evidence or dialogue.

- Culture-specific food, ward item, trade good and watchtower blueprint style.

- Visible cultural clothing, naming, schedules and architecture.

- Goblin evidence showing the raider clan does not define the ancestry.

- Raid outcome changes based on faction hostility, supplies, watchtower and ward preparation.

# Appendix B. Database Field Templates

## B.1 Ancestry Record

| **Field Group** | **Fields**                                                                                             |
|-----------------|--------------------------------------------------------------------------------------------------------|
| Identity        | id, display_name, plural_name, category, parent_family_id, description, lore_summary                   |
| Body            | body_profile, size_class, locomotion, senses, lifespan, diet_tags, environment_tags, equipment_profile |
| Traits          | passive_traits, active_traits, vulnerabilities, mitigation_paths, magic_affinities, skill_interactions |
| Heritage        | lineage_options, transformation_rules, compatibility_tags, visual_variant_sets                         |
| Connections     | culture_examples, faction_examples, biome_links, dimension_links, creature_registry_links              |
| Planning        | scope_status, owner, revision, notes                                                                   |

## B.2 Culture Record

| **Field Group**           | **Fields**                                                                                      |
|---------------------------|-------------------------------------------------------------------------------------------------|
| Identity                  | id, display_name, cultural_family_id, subculture_ids, description, origin_summary               |
| Population                | ancestry_demographics, heritage_patterns, migration_history, settlement_types                   |
| Language and names        | primary_languages, scripts, naming_profile, titles, translation_difficulty                      |
| Material culture          | architecture_set, material_preferences, clothing_sets, food_set, art_symbols, banners           |
| Society                   | government_defaults, laws, social_roles, family_customs, inheritance, labour_model, schedules   |
| Magic and faith           | religions, philosophies, magic_schools, rituals, taboos, forbidden_practices, sacred_structures |
| Economy                   | signature_exports, imports, strategic_resources, trade_preferences, automation_attitude         |
| History and relationships | historical_events, allies, rivals, grievances, myths, diaspora_links                            |
| Dynamic                   | reform_pressure, hybridisation, decline_state, revival_state, occupation_state                  |

## B.3 Faction Record

| **Field Group**   | **Fields**                                                                                |
|-------------------|-------------------------------------------------------------------------------------------|
| Identity          | id, display_name, faction_type, parent_faction_id, public_description, secret_description |
| Membership        | member_rules, culture_links, ancestry_demographics, settlement_members, guilds, ranks     |
| Leadership        | leader_ids, succession_model, legitimacy, internal_bloks, offices                         |
| Purpose           | goals, ideology, fears, claims, strategic_priorities, unresolved_pressures                |
| Assets            | territory, settlements, resources, military, trade_routes, magic, technology, structures  |
| Law and diplomacy | law_profile, treaties, relationships, reputation_profile, communication_network           |
| Simulation        | strength_vectors, morale, logistics, unrest, war_state, economy_state, research_state     |
| History           | formation_event, wars, schisms, migrations, conquests, records, symbols                   |

# Appendix C. Relationship and Membership Types

| **Category** | **Types**                                                                                                |
|--------------|----------------------------------------------------------------------------------------------------------|
| Diplomatic   | Alliance, non-aggression, rivalry, war, truce, ceasefire, guarantee, federation, vassalage.              |
| Economic     | Trade pact, embargo, monopoly, debt, tribute, contract, shared resource, caravan access.                 |
| Territorial  | Border recognition, disputed claim, occupation, autonomy, protectorate, shared site, access corridor.    |
| Social       | Kinship, marriage tie, diaspora link, cultural affinity, religious solidarity, historical grievance.     |
| Secret       | Infiltration, hidden patronage, conspiracy, black market, covert alliance, double agent.                 |
| Membership   | Citizen, resident, household, clan, guild, faith, military, government, secret faction, honorary member. |

# Appendix D. Future People and Culture Backlog

| **Backlog Group**     | **Future Work**                                                                                               |
|-----------------------|---------------------------------------------------------------------------------------------------------------|
| Core ancestry roster  | Finalise initial playable peoples, body profiles, equipment compatibility and visual direction.               |
| Cultural families     | Create 8-12 major authored cultural families with biome, magic, architecture and economy identities.          |
| Regional branches     | Generate subcultures for coasts, mountains, underground, deserts, forests, swamps and magical regions.        |
| Languages             | Define naming grammars, scripts, translation tiers and common trade languages.                                |
| Faction seeds         | Create starter kingdoms, guilds, mage orders, faiths, merchant leagues, raiders, rebels and ancient remnants. |
| Historical eras       | Define ancient civilisation layers, collapses, migrations, wars, portals and current political map.           |
| Representation review | Review cultures for stereotype risk, monoculture design and moral essentialism.                               |

# Appendix E. POC Success Criteria

| **Success Test**         | **Pass Condition**                                                                                       |
|--------------------------|----------------------------------------------------------------------------------------------------------|
| Identity separation      | A single NPC can clearly have separate ancestry, culture, settlement and faction values.                 |
| Mixed culture            | At least one non-human NPC belongs naturally to the hamlet culture.                                      |
| Faction readability      | Village and raider faction can be identified through architecture, banners, NPC behaviour and UI.        |
| Reputation effect        | Trust or hostility changes dialogue, warehouse access, project contribution or combat response.          |
| Ownership                | Player cannot freely treat faction property as unowned without consequences or world-setting permission. |
| Cultural gameplay        | Culture changes at least one recipe, one building, one schedule and one magic/ward interaction.          |
| Non-essentialist goblins | Game evidence demonstrates that Briarhook raiders are one faction, not the goblin ancestry as a whole.   |
| Conflict consequence     | Preparation and relationships change the raid result and village memory.                                 |
| Data readiness           | All POC NPCs, structures and faction interactions use stable IDs and registry links.                     |
