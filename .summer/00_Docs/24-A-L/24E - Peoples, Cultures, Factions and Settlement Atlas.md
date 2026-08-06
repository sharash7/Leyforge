---
title: 24E — Peoples, Cultures, Factions and Settlement Atlas
document_set: 24
document: 24E
aliases:
- 24E
- Document 24E
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
- 24e
---

# 24E — Peoples, Cultures, Factions and Settlement Atlas

> [!NOTE]
> Obsidian-ready Markdown conversion of the approved Set 24 source document. Source wording and structure have been preserved wherever possible.

**Fantasy Voxel Civilisation Sandbox**

**24E - World Content Atlas: Peoples, Cultures, Factions and Settlement Atlas**

Version 0.1 - Post-POC Production Content Draft

A database-ready atlas for ancestries, lineages, cultures, languages, faiths, governments, factions, territories, settlements, migration, diplomacy, war, labour, trade, realm-linked societies, procedural civilisation generation, and persistent social change.

| **Civilisation Atlas Statement**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The finished game contains no guaranteed Forest Hamlet, fixed POC villagers, Briarhook raid faction, predetermined regional authority, or mandatory starter culture. Every world seed assembles peoples, cultures, factions, settlements, territories, relationships, historical claims, migrations, laws, and conflicts from validated Atlas definitions. Ancestry, culture, faction, faith, language, citizenship, settlement, and government remain separate but interconnected identities, and no people is inherently heroic, evil, civilised, primitive, magical, industrial, peaceful, or hostile. |

| **Field**                    | **Locked Direction**                                                                                                                                                                                                                                                                                            |
|------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Document scope**           | Full post-POC production atlas for intelligent peoples, ancestry and heritage, authored culture families, procedural regional variants, factions, government, law, language, faith, labour, economy, territory, migration, settlements, diplomacy, war, realm adaptation, data registries, and seed validation. |
| **Core philosophy**          | Individuals and societies are defined through layered identities. Biology does not determine morality, profession, culture, magic, politics, or technology.                                                                                                                                                     |
| **World direction**          | Use authored cultural and settlement families assembled through deterministic history, geography, migration, trade, realm contact, conflict, and player-driven change.                                                                                                                                          |
| **Post-POC direction**       | Remove all POC names, residents, local factions, guaranteed settlement roles, fixed population mixes, and scripted political relationships from production generation.                                                                                                                                          |
| **Procedural direction**     | The seed creates coherent societies from compatible ancestry, culture, language, faith, government, economy, territory, settlement, faction, and history records, with validation and repair rather than unrestricted random mixing.                                                                            |
| **Settlement direction**     | Settlements are living populations plus physical places, laws, ownership, storage, jobs, projects, infrastructure, districts, routes, threats, history, and political status.                                                                                                                                   |
| **Realm direction**          | No ancestry owns a realm by biology. Peoples connect to dimensions through history, adaptation, migration, faith, trade, conquest, treaties, diaspora, and settlement infrastructure.                                                                                                                           |
| **Data direction**           | Use stable IDs, parent definitions, membership edges, relationship graphs, settlement records, territory state, cultural variants, procedural names, historical events, and clean separation between immutable definitions and save-specific runtime state.                                                     |
| **Implementation direction** | Content contracts are engine-neutral and align with the current Godot/Summer Engine production direction, simulation LOD, authoritative world state, and registry-driven generation.                                                                                                                            |

# Document Purpose

This document is the civilisation-facing volume of Document Set 24, the World Content Atlas. It expands the earlier Races, Peoples, Cultures and Factions and NPC Village foundations into a post-POC production framework for complete generated societies. It defines who people can be, how cultures remain recognisable without becoming monocultures, how factions pursue goals, how settlements adapt to geography and realms, and how history, migration, economy, magic, automation, war, diplomacy, and player action change the social world.

The document does not replace detailed NPC behaviour, building blueprints, quest writing, economy balancing, combat AI, creature registries, realm generation, or final assets. It owns the shared identity and relationship contracts those systems reference: ancestry and heritage definitions, culture families, languages, faiths, governments, faction archetypes, settlement profiles, territory and citizenship, procedural society assembly, and persistent civilisation state.

This volume also formalises the retirement of all Forest Hamlet proof-of-concept social content. The POC residents, local council, Briarhook raiders, regional march authority, mandatory population roles, and fixed political relationships are development evidence only. Production worlds use new reusable families and seed-derived identities.

# Design Source and Supersession Rules

| **Source**                                 | **Direction retained, expanded, or superseded**                                                                                                                                                                       |
|--------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00 - Master Game Design Bible              | Retains living civilisations, player freedom, race and culture stories, conquest and protection paths, settlement growth, world consequences, and civilisation-scale progression.                                     |
| 01-02 - Core Loop and Player Progression   | Retains exploration, reputation, settlement support, leadership, diplomacy, conquest, knowledge, and dimensions as progression paths. Removes any POC-sequence assumption.                                            |
| 03-06 - Blocks, Items, Recipes, Resources  | Retains cultural materials, architecture sets, trade goods, faction seals, strategic resources, project recipes, ownership, and exact stored-resource use.                                                            |
| 07 - NPC Village System                    | Retains persistent NPC identity, jobs, needs, households, schedules, storage, laws, migration, projects, growth stages, reputation, death, and simulation LOD. POC-specific residents and village are retired.        |
| 08-09 - Automation and Magic               | Retains cultural attitudes, regulated practices, specialist labour, magical infrastructure, machine adoption, forbidden systems, and civilisation consequences.                                                       |
| 10 - Creatures and Monsters                | Retains intelligent societies, raiders, cults, surrender, diplomacy, morale, faction motives, and non-combat outcomes. Intelligent ancestry is not equivalent to enemy type.                                          |
| 11-12 - Worldgen and Structures            | Retains biome adaptation, territory, roads, settlement clusters, ownership, ruins, restoration, dynamic states, and procedural placement.                                                                             |
| 13 - Races, Peoples, Cultures and Factions | Retains the separation of ancestry, lineage, culture, faction, settlement, religion, language, government, citizenship, and membership. This document supersedes its POC scope and expands the production registries. |
| 14 and 24D - Dimensions and Realm Atlas    | Retains twelve realm families, sovereignty, migration, route diplomacy, foreign settlements, adaptation, and the rule that no realm is biologically exclusive to one ancestry.                                        |
| 15-17 - Quests, Combat, UI                 | Retains faction stories, diplomacy, wars, reputation, law, surrender, settlement defence, Codex certainty, map borders, and readable social feedback.                                                                 |
| 18 - Technical Plan                        | Retains stable IDs, external registries, persistent records, relationship graphs, simulation LOD, save migration, and deterministic generation while translating implementation to Godot/Summer Engine.               |
| 24A-D - World Content Atlas                | Uses the post-POC seed hierarchy, procedural history, regions and biome mosaics, special environments, realm networks, completeness contracts, and no-hardcoded-content rule.                                         |

# Static Table of Contents

1\. Locked Peoples, Cultures, Factions and Settlement Atlas Identity

2\. Post-POC Production Decisions

3\. Authority and Cross-Document Ownership

4\. Identity Stack, Terminology, and Membership

5\. Ancestry, Species, Lineage, Heritage, and Personhood

6\. Player Origins, Transformation, Equipment, and Accessibility

7\. Culture Families, Regional Variants, and Hybrid Cultures

8\. Languages, Scripts, Naming, Titles, and Translation

9\. Households, Kinship, Life Stages, Inheritance, and Social Memory

10\. Food, Clothing, Craft, Art, Festivals, and Taboos

11\. Religion, Philosophy, Cosmology, and Magical Tradition

12\. Government, Law, Citizenship, Property, and Justice

13\. Work, Professions, Labour, Technology, Magic, and Automation Attitudes

14\. Economy, Trade, Currency Hooks, and Strategic Resources

15\. Faction Taxonomy, Leadership, Membership, Assets, and Internal Politics

16\. Diplomacy, Reputation, Information, Treaties, Espionage, and Crime

17\. Territory, Borders, War, Conquest, Occupation, Resistance, and Peace

18\. Migration, Diaspora, Refugees, Colonisation, and Cultural Change

19\. Settlement Hierarchy, Growth, Decline, and Political Status

20\. Settlement Morphology, Biome Adaptation, and Realm Adaptation

21\. Districts, Services, Infrastructure, Defence, and Civic Projects

22\. Procedural Society, Faction, Territory, and Settlement Generation

23\. Historical Layers, Legitimacy, Archaeology, and Competing Truths

24\. Intelligent Hostile Societies, Raiders, Cults, Bandits, and Reform

25\. Realm-Linked Civilisations, Route Sovereignty, and Cross-Realm Settlements

26\. Dynamic Civilisation States, Events, Succession, and Long-Term Change

27\. Detailed Ancestry and Personhood Registry v0.1

28\. Detailed Culture Family Registry v0.1

29\. Government and Law Profile Registry v0.1

30\. Faction Archetype Registry v0.1

31\. Settlement Archetype Registry v0.1

32\. Content Completeness Contracts and Production Budgets

33\. Discovery, Codex, Presentation, Forge, Audio, and VFX Requirements

34\. Simulation LOD, Persistence, Multiplayer, and Save Safety

35\. Data Models, Registries, Validation, Seed Testing, and Production Gates

36\. Balancing, Representation, and Player-Freedom Rules

37\. Cross-Document Update Plan

38\. Open Questions

Appendix A. Ancestry Definition Template

Appendix B. Culture Definition Template

Appendix C. Faction and Relationship Templates

Appendix D. Settlement Definition Template

Appendix E. Minimum Completeness and Validation Matrix

Appendix F. Acceptance Criteria

# 1. Locked Peoples, Cultures, Factions and Settlement Atlas Identity

The civilisation Atlas is the identity, society, politics, and settlement layer of the generated world. It defines persistent people rather than interchangeable villagers, recognisable cultures rather than ancestry stereotypes, factions with goals rather than colour-coded teams, and settlements that exist as functioning communities rather than decorative structure clusters.

Every generated NPC can hold separate ancestry, lineage, culture, subculture, settlement, citizenship, household, language, faith, profession, guild, public faction, secret faction, personal loyalty, and historical-memory records. These values can agree, conflict, or change. A goblin may be a citizen of a dwarven-founded port, speak a trade creole, follow a Veilkeeper philosophy, work for a merchant league, and oppose a goblin-led raider faction. None of those identities is inferred from ancestry alone.

| **Locked Rule**                                                                                                                                                                                                                                                                                                                           |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| No ancestry is inherently heroic, evil, civilised, primitive, magical, industrial, peaceful, hostile, intelligent, obedient, honourable, criminal, or suited to one profession. Behaviour comes from individuals, cultures, factions, circumstances, history, leadership, resources, laws, relationships, world state, and player action. |

## 1.1 What this Atlas prevents

- One ancestry being represented by a single culture, government, biome, profession, morality, or realm.

- Every settlement of one culture using the same exact blueprint, population list, leader, or political state.

- Hostile factions being treated as proof that their entire ancestry is hostile.

- Procedural generation combining incompatible laws, architectures, economies, and settlement environments without explanation.

- Cultures existing only as clothing palettes while schedules, food, buildings, magic, labour, law, and trade remain identical.

- Factions spawning without logistics, leadership, membership, assets, goals, territory, information, or a path to change.

- Conquest functioning as a free ownership switch without occupation, legitimacy, resistance, refugees, law, rebuilding, or external reaction.

- Foreign-realm settlements being treated as empty-land colonies without native claims, ecology, treaties, adaptation, and route dependence.

- POC residents, village roles, councils, raiders, or regional references appearing in production worlds.

# 2. Post-POC Production Decisions

| **Field**                | **Locked Direction**                                                                                                                                                                                             |
|--------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **POC identities**       | Forest Hamlet residents, Forest Hamlet Council, Briarhook Clan, Regional March Authority, POC households, fixed jobs, and scripted relationships are removed from production registries and normal seeds.        |
| **Reusable mechanics**   | Named NPCs, councils, raider factions, mixed settlements, warehouse permission, watchtowers, raids, projects, and regional authorities survive only as generic system families with new seed-derived identities. |
| **Starting societies**   | No fixed first culture, ancestry, village, faction, language, leader, or settlement type. World presets may bias accessibility, density, or climate without selecting one canonical opening.                     |
| **Core ancestry roster** | Use a curated production foundation of twelve ancestry or personhood families, each supporting multiple cultures, body profiles, realm links, and social roles. Expansion remains content-pack compatible.       |
| **Culture model**        | Twenty authored culture foundations provide strong material and social identities. Seeds create regional branches, mixed populations, diasporas, and hybrid cultures through history and geography.              |
| **Faction model**        | Factions are generated or authored from archetypes with goals, assets, leadership, membership, law, relationships, internal blocs, and state transitions.                                                        |
| **Settlement model**     | Settlement scale and settlement form are separate. A city may be coastal, underground, floating, nomadic, pocket-realm, fortress, sacred, industrial, or mixed.                                                  |
| **Moral model**          | No faction is permanently assigned good or evil. Ideology, methods, leadership, treatment of others, current pressure, and player choices determine moral and political evaluation.                              |
| **Procedural names**     | Generated societies receive reproducible names from language and culture profiles. Important generated leaders, settlements, factions, treaties, wars, and sites receive stable runtime IDs.                     |
| **Production status**    | Planning labels such as Foundation, Expansion, Deferred, Placeholder, or Experimental remain documentation metadata and do not become inherited gameplay traits.                                                 |

# 3. Authority and Cross-Document Ownership

| **Content layer**       | **24E owns**                                                                                                                                                                                     | **Referenced systems own**                                                                                   |
|-------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|
| Ancestry and personhood | Body profile, inherited traits, tolerances, equipment profile, heritage rules, transformation compatibility, personhood hooks, and production status.                                            | Final models, animations, numerical balance, combat hitboxes, equipment assets, and player-creation UI.      |
| Culture                 | Shared values, material culture, language links, architecture grammar, food, clothing, labour, law defaults, faiths, magic traditions, economy, festivals, taboos, and regional variation rules. | Specific recipes, building blueprints, dialogue, quest scripts, item stats, and final visual/audio assets.   |
| Faction                 | Type, goals, ideology, membership, leadership, assets, territory, relationships, reputation profile, information network, strategic state, and change rules.                                     | Combat formations, individual quests, encounter tuning, economy values, and AI implementation.               |
| Settlement              | Scale, form, environment, culture blend, demographics, government, laws, districts, services, infrastructure, project slots, routes, growth, decline, and political status.                      | Exact blocks, structures, NPC schedules, machine networks, navigation, UI screens, and construction recipes. |
| Relationship            | Trust, fear, respect, grievance, obligation, legitimacy, treaty, membership, ownership, citizenship, and public or secret status.                                                                | Dialogue reactions, quest objectives, combat hostility, trading values, and UI presentation.                 |
| Procedural generation   | Compatibility rules, authored pools, history inputs, name profiles, membership constraints, validation gates, repair priorities, and completeness contracts.                                     | Technical generation order, storage, threading, replication, streaming, and debugging implementation.        |

# 4. Identity Stack, Terminology, and Membership

The Atlas uses an identity stack rather than one race or faction field. The official technical term for biological or body-level identity is ancestry or species, while player-facing language may use people, folk, kin, kindred, lineage names, or culturally appropriate terms. Culture describes learned social identity. Faction describes organised membership and goals. Settlement describes a local population and place. Citizenship describes legal belonging. Faith and philosophy may cross all of them.

| **Identity layer**       | **Meaning**                                                                                                                               | **Examples of change**                                                                                      |
|--------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| Ancestry / species       | Body plan, senses, lifespan, environmental tolerances, locomotion, dietary tags, equipment fit, inherited traits, and reproduction rules. | Rare transformation, reincarnation, awakening, curse, blessing, construct transfer, or compatible heritage. |
| Lineage / heritage       | Regional, magical, realm-linked, transformed, or mixed inherited variation within or between compatible ancestry records.                 | Migration, realm exposure, family history, rituals, or long-term adaptation.                                |
| Culture / subculture     | Learned language, names, food, clothing, work, architecture, law, faith, magic, art, memory, economy, and social values.                  | Assimilation, resistance, diaspora, reform, hybridisation, generational change, or player influence.        |
| Settlement / citizenship | Local residence, law, property rights, taxes, services, project obligations, defence duties, and political status.                        | Migration, naturalisation, exile, occupation, secession, annexation, foundation, or abandonment.            |
| Faction / organisation   | Purposeful group with leadership, membership, goals, assets, resources, territory, relationships, and memory.                             | Join, leave, split, merge, reform, radicalise, collapse, conquer, federate, or go underground.              |
| Faith / philosophy       | Spiritual, ethical, metaphysical, or civic tradition that may cross cultures and factions.                                                | Conversion, syncretism, schism, reform, revelation, suppression, revival, or secularisation.                |
| Profession / guild       | Work identity, skill practice, labour obligations, certification, tools, and organisational membership.                                   | Training, promotion, unemployment, crisis reassignment, automation, injury, retirement, or migration.       |
| Personal loyalty         | Individual attachments, memories, fears, debts, ambitions, relationships, and secret beliefs.                                             | Dialogue, rescue, betrayal, kinship, payment, injustice, leadership change, or world events.                |

## 4.1 Membership edge types

- Citizen, resident, guest, protected person, refugee, migrant worker, pilgrim, prisoner, exile, stateless person, or occupier.

- Household, clan, lineage house, guild, faith, military, government office, political bloc, research order, caravan, crew, or secret society.

- Full member, probationary member, contractor, vassal, client, tributary, ally, honorary member, infiltrator, captive member, or coerced labourer.

- Public, private, disputed, illegal, hidden, historical, conditional, inherited, temporary, or revoked membership.

# 5. Ancestry, Species, Lineage, Heritage, and Personhood

Ancestry definitions provide physical identity without creating class locks. Traits should be noticeable, readable, and useful, but equivalent paths must exist for all professions, magic schools, settlement roles, and automation branches. Differences can create distinct traversal, equipment, building, survival, or sensory experiences without making one ancestry objectively superior.

| **Design area**               | **Locked rule**                                                                                                                                                                                                           |
|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Mechanical identity**       | Traits affect possibilities, efficiency, senses, tolerances, or interaction style rather than determining morality, intelligence, job, culture, or faction.                                                               |
| **Weaknesses**                | Use contextual vulnerabilities with mitigation through equipment, food, medicine, architecture, magic, technology, acclimatisation, or social support.                                                                    |
| **Body plans**                | Different sizes, limbs, locomotion, or material bodies may require adapted equipment, furniture, doors, vehicles, animations, and housing, but functional equivalents must exist.                                         |
| **Mixed heritage**            | Only compatible combinations use inherited blending. Cultural inheritance is always separate from biology. Unsupported combinations may use adoption, magical lineage, soul inheritance, or transformed heritage instead. |
| **Transformation**            | Rare events can change body or ancestry state, but consent, reversibility, legal identity, equipment, saves, quests, and multiplayer visibility require explicit handling.                                                |
| **Personhood**                | Constructs, spirits, undead, elemental beings, colonies, copies, dream selves, and transferred minds can be recognised, denied, or disputed as persons by different laws and cultures.                                    |
| **Reproduction and families** | Definitions support biological, created, adopted, awakened, grafted, budded, forged, memory-inherited, or ritual family formation without forcing all societies into one model.                                           |
| **Player mastery**            | One character can eventually learn any profession, magic path, leadership role, and technology regardless of ancestry, subject to knowledge, resources, relationships, and world state.                                   |

## 5.1 Personhood and legal status

The developer truth of self-awareness is separate from legal recognition. A settlement may recognise awakened constructs as full citizens, treat them as guild property, grant limited contracts, or criminalise their creation. A Necropolis polity may treat deathless citizens as continuous persons while an Overworld kingdom considers them legally deceased. These disagreements create diplomacy, migration, emancipation, crime, rescue, and story hooks without changing the underlying entity identity record.

# 6. Player Origins, Transformation, Equipment, and Accessibility

World and server settings may support selected ancestry, random ancestry, fixed campaign ancestry, discovered origin, or outsider starts. Cultural origin is a separate choice where enabled. Starting familiarity, language, recipes, clothing, and reputation should be modest and never replace exploration or progression.

| **Origin option**    | **Gameplay direction**                                                                                                                                                 |
|----------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Outsider             | Begins without formal cultural membership. Broad neutrality and flexible identity are balanced by language, trust, property, and service barriers.                     |
| Culture-born         | Begins with one language, basic clothing, cultural knowledge, minor recipe familiarity, and local relationship context.                                                |
| Diaspora             | Belongs to a culture outside its majority territory, with mixed language, memory, and relationship hooks.                                                              |
| Foundling or adopted | Ancestry and culture are intentionally separated through household, settlement, or mentor history.                                                                     |
| Construct awakening  | Begins through creation, discovery, emancipation, inheritance, or self-activation, with legal status dependent on the world.                                           |
| Realm-returned       | Carries heritage or adaptation from another realm without being biologically owned by that realm.                                                                      |
| Discovered form      | The player learns or changes their physical origin during play; this requires explicit consent settings, equipment migration, UI explanation, and quest compatibility. |

## 6.1 Accessibility and equivalent interaction

- Reach, eye height, door size, camera, mounts, ladders, furniture, swimming, gliding, pressure tolerance, and equipment fit must have accessible alternatives.

- Colour, hearing, scent, spirit sight, heat vision, echolocation, mana sensing, and machine diagnostics require UI alternatives rather than being communicated through one sensory channel only.

- Body-specific advantages should open playstyles, not hide mandatory information or make another body profile incapable of completing core progression.

- Transformation systems require preview, consent, reversal or confirmation rules, save-safe equipment handling, and clear multiplayer identity updates.

# 7. Culture Families, Regional Variants, and Hybrid Cultures

Culture definitions are authored foundations with recognisable material, social, and historical identity. A seed does not invent cultures from arbitrary traits. It selects compatible foundations, places them in geographic and historical context, derives regional variants, then applies migration, trade, realm contact, conquest, faith, technology, ecology, and settlement conditions.

| **Layer**              | **Purpose**                                                                                                                                | **Generation behaviour**                                                                            |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| Culture family         | Strong authored identity covering language links, architecture, food, clothing, labour, law, faith, magic, economy, and historical themes. | Stable definition selected by world history and region suitability.                                 |
| Regional branch        | Local adaptation to climate, resources, neighbouring peoples, route access, rulers, disasters, and settlement form.                        | Seed-derived variant with inherited core plus bounded modifications.                                |
| Subculture             | Profession, faith, class, border, urban, rural, diaspora, military, scholarly, or realm-contact branch.                                    | Authored or generated from compatible modules and historical events.                                |
| Hybrid culture         | New identity formed through long-term mixed settlement, intermarriage, shared labour, trade, displacement, or political union.             | Requires sufficient time, population contact, stable institutions, and an explicit emergence event. |
| Assimilated population | Individuals adopt parts of a dominant culture while retaining heritage, language, faith, or private customs.                               | Tracked by demographic and household records, not instant replacement.                              |
| Revival movement       | A suppressed, lost, or diaspora culture re-establishes language, ritual, architecture, law, or territory.                                  | Triggered by archives, leaders, settlement projects, political change, or player support.           |

## 7.1 Culture coherence rules

- Architecture, economy, food, clothing, labour, law, faith, magic, and settlement form must tell compatible stories unless a deliberate historical contradiction is recorded.

- Regional variants preserve a visible core while adapting to local materials, climate, hazards, routes, and neighbouring cultures.

- Mixed populations do not automatically become hybrid cultures; people can share a settlement while retaining distinct languages, faiths, laws, districts, and identities.

- Culture change is gradual and event-driven. A conquest can change government quickly, but language, household customs, food, memory, and identity may resist for generations.

- No culture is treated as culturally pure. Internal class, region, profession, faith, generation, and political differences are expected.

# 8. Languages, Scripts, Naming, Titles, and Translation

Language is both world flavour and an optional gameplay layer. World settings can make language cosmetic, lightweight, or immersive. Regardless of setting, language profiles drive personal names, settlement names, faction names, titles, inscriptions, map labels, accents, scripts, loanwords, and cultural interpretation.

| **Language component**  | **Required fields and behaviour**                                                                                                                         |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Language family         | Stable ID, parent family, phonetic profile, word order, scripts, mutual intelligibility, loanword rules, naming grammar, and translation difficulty.      |
| Name profile            | Personal names, household names, lineage names, settlement forms, titles, honorifics, occupational names, realm names, and exonyms.                       |
| Script                  | Glyph set, direction, material use, literacy requirement, magical or machine compatibility, signage, book assets, and accessibility transcription.        |
| Trade language          | Regional bridge language used by routes, ports, guilds, diplomats, mixed settlements, and players without erasing local languages.                        |
| Creole and mixed speech | Generated through sustained contact, shared institutions, migration, or trade; uses bounded vocabulary and naming inheritance.                            |
| Translation state       | Unknown, recognised, partial, conversational, fluent, scholarly, ritual, technical, or disputed.                                                          |
| Cultural names          | A site, creature, boss, realm, war, or relic can hold developer truth, local endonyms, foreign exonyms, faction propaganda names, and player-known names. |

## 8.1 Procedural naming safeguards

- Generated names are deterministic under the same seed, content manifest, and naming-profile version.

- Profanity, accidental real-world slurs, duplicate major names, unreadable strings, and excessive repetition are filtered and repaired.

- Important generated entities keep stable IDs even if their display name changes after conquest, restoration, marriage, title change, or localisation update.

- Name generation records language source, morphological pieces, cultural branch, naming reason, aliases, and player-known state for debugging and Codex use.

# 9. Households, Kinship, Life Stages, Inheritance, and Social Memory

Households are the bridge between persistent NPC identity and civilisation simulation. They can represent nuclear families, extended kin, communal halls, guild households, monastery cells, military barracks, caravan crews, constructed cohorts, spirit lineages, adoption networks, or mixed arrangements. The system must not assume one family model for every culture.

| **Area**              | **Atlas requirement**                                                                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Household structure   | Culture and settlement profiles define common arrangements, capacity, shared resources, privacy, dependants, work links, and care responsibilities.         |
| Life stages           | Child, youth, adult, elder, newly awakened, apprentice, active duty, retired, deathless, dormant, or culturally specific stages affect schedules and roles. |
| Kinship               | Biological, adopted, forged, sworn, mentor, lineage-house, memory-inherited, spiritual, and civic kinship edges are supported.                              |
| Inheritance           | Property, titles, debt, tools, businesses, leadership, memories, legal claims, and faction obligations can transfer according to law and household custom.  |
| Population continuity | Birth, creation, awakening, migration, adoption, recruitment, death, disappearance, return, and revival change population over time.                        |
| Mourning and memory   | Deaths and losses can alter morale, schedules, monuments, household needs, faction grievances, succession, migration, and player reputation.                |
| Identity conflict     | Household loyalty can conflict with law, faction, faith, class, citizenship, or personal belief, creating emergent quests and political pressure.           |

# 10. Food, Clothing, Craft, Art, Festivals, and Taboos

Material culture must be visible in everyday play. Culture changes what NPCs grow, hunt, preserve, cook, wear, decorate, repair, trade, celebrate, forbid, teach, and request. These differences should connect to real items, blocks, recipes, schedules, buildings, sounds, animations, and seasonal events rather than exist only in lore text.

| **Cultural area** | **System connections**                                                                                                                                    |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Food              | Climate, crops, livestock, gathering, hunting, preservation, communal meals, taboos, festivals, trade, shortages, health, and hospitality.                |
| Clothing          | Climate protection, body profiles, profession, status, faith, armour layering, dyes, textiles, identity, disguise, mourning, and ceremony.                |
| Craft             | Material preferences, tool forms, quality standards, repair customs, apprenticeships, guild control, automation attitudes, exports, and cultural recipes. |
| Art and symbols   | Banners, carving, weaving, masonry, gardens, murals, music, stories, masks, machine ornament, rune style, memorials, and map icons.                       |
| Festivals         | Season, harvest, migration, ancestry, realm events, founding, victory, mourning, trade fairs, competitions, pilgrimages, and temporary laws.              |
| Taboos            | Foods, burial, magic, automation, property, sacred sites, contracts, blood, names, spirits, constructs, resource extraction, or treatment of creatures.   |
| Hospitality       | Guest rights, gifts, shared meals, shelter obligations, tolls, safe conduct, diplomatic immunity, and consequences for violation.                         |

# 11. Religion, Philosophy, Cosmology, and Magical Tradition

Faiths and philosophies are separate records that can cross ancestry, culture, settlement, and faction boundaries. The game can contain real supernatural entities while preserving disputed interpretation. A divine being, ancestor, spirit, machine intelligence, realm sovereign, or natural force may be demonstrably present without every culture agreeing on its identity, authority, or moral meaning.

| **Tradition layer**     | **Atlas contract**                                                                                                                                       |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Developer truth         | What entities, realms, laws, and events objectively exist in simulation. This may remain intentionally incomplete where mystery is a design goal.        |
| Cultural interpretation | Names, myths, creation stories, moral lessons, ritual claims, sacred geography, and historical disputes.                                                 |
| Institution             | Temples, household rites, orders, pilgrimages, schools, shrines, courts, clergy, lay practice, finances, property, and political influence.              |
| Magic tradition         | Permitted schools, teaching methods, ritual forms, components, public infrastructure, taboos, licences, forbidden practices, and specialist professions. |
| Schism and reform       | Competing interpretations, leadership disputes, new revelations, political capture, corruption, syncretism, revival, or secular movements.               |
| Law and diplomacy       | Marriage, burial, oaths, contracts, holidays, sanctuary, personhood, inheritance, forbidden magic, warfare, and realm access.                            |

## 11.1 Magic and cultural ownership

No culture owns an entire magic school. Cultures may preserve distinctive teaching traditions, rune styles, rituals, tools, ethical limits, public uses, and infrastructure, but players and NPCs can learn across cultural boundaries through travel, teachers, books, experimentation, diplomacy, conquest, theft, reform, or mixed institutions.

# 12. Government, Law, Citizenship, Property, and Justice

Government is a modular record rather than a culture stereotype. A culture can support councils, monarchies, guild republics, communes, theocracies, military administrations, federations, clan assemblies, machine councils, or mixed constitutions depending on settlement scale, history, faction control, resources, and world state.

| **Law domain**   | **Required behaviour**                                                                                                                                                          |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Authority        | Office holders, jurisdiction, succession, emergency powers, legitimacy, term, removal, public knowledge, and disputed claim.                                                    |
| Citizenship      | Eligibility, residence, naturalisation, household status, voting or voice, service, taxation, protection, exile, and dual citizenship.                                          |
| Property         | Personal, household, guild, communal, sacred, faction, state, foreign, abandoned, salvage, occupied, and disputed ownership.                                                    |
| Crime            | Witnesses, evidence, intent, theft, assault, trespass, sabotage, smuggling, forbidden magic, illegal construction, grave violation, and realm-law offences.                     |
| Justice          | Warning, restitution, fine, service, licence loss, confiscation, exile, imprisonment, trial, duel, mediation, oath, rehabilitation, or execution depending on law and settings. |
| Contracts        | Employment, trade, debt, delivery, protection, route access, construction, research, apprenticeship, marriage, realm passage, and magical bargains.                             |
| Emergency law    | Raid, famine, plague, disaster, war, corruption, boss threat, route collapse, succession crisis, or occupation can temporarily change permissions and duties.                   |
| Player authority | Helper, contractor, citizen, guild member, office holder, ruler, occupier, rebel, criminal, conqueror, or foreign sovereign status changes lawful options.                      |

# 13. Work, Professions, Labour, Technology, Magic, and Automation Attitudes

Jobs remain functional. A profession defines tasks, tools, work sites, skills, inputs, outputs, hazards, schedules, social status, guild links, training, and crisis roles. Culture and faction can influence labour organisation without ancestry-locking work. Automation should support and transform NPC labour rather than make societies irrelevant.

| **Job family**                  | **Representative roles**                                                                           | **Civilisation connections**                                                  |
|---------------------------------|----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| Food and survival               | Farmer, herder, fisher, hunter, forager, cook, brewer, baker, water keeper, healer.                | Food stability, culture, health, trade, festivals, siege survival, migration. |
| Gathering and extraction        | Miner, lumber worker, quarry worker, herbalist, salvager, diver, sky harvester, realm gatherer.    | Resources, environmental impact, strategic assets, territory, automation.     |
| Industry and craft              | Smith, carpenter, mason, weaver, potter, glassworker, tanner, jeweller, rune crafter, alchemist.   | Tools, buildings, trade goods, repairs, guilds, cultural identity.            |
| Construction and infrastructure | Builder, architect, surveyor, road worker, bridge keeper, engineer, wardwright, portal technician. | Settlement growth, routes, power, defence, adaptation, megaprojects.          |
| Logistics and trade             | Hauler, courier, caravaner, sailor, broker, merchant, warehouse keeper, customs officer.           | Supply, markets, routes, contracts, taxes, diplomacy, smuggling.              |
| Knowledge and culture           | Teacher, scribe, archivist, historian, artist, musician, translator, cartographer, researcher.     | Language, Codex, legitimacy, research, diplomacy, cultural survival.          |
| Magic and realm work            | Mage, ritualist, healer, spirit mediator, dream guide, golemancer, portal keeper, leyline tender.  | Infrastructure, law, threats, education, dimensions, forbidden practice.      |
| Governance and defence          | Councillor, judge, tax officer, guard, scout, soldier, diplomat, investigator, commander.          | Law, safety, war, reputation, territory, succession, public trust.            |

## 13.1 Labour models

- Household labour, wage labour, guild membership, communal obligation, corvée, military service, apprenticeship, contract work, self-employment, cooperative ownership, ritual duty, machine support, golem labour, and coerced labour are distinct systems.

- Coerced, necromantic, blood-powered, debt-bound, prison, or construct ownership systems carry legal, moral, political, rebellion, and faction consequences rather than existing as neutral efficiency upgrades.

- Automation attitudes may be enthusiastic, cautious, guild-controlled, sacred, regulated, environmentally limited, anti-magitech, pro-construct-rights, or divided internally.

# 14. Economy, Trade, Currency Hooks, and Strategic Resources

The Atlas defines economic identity and dependencies, while final prices and market algorithms belong to economy implementation. Cultures and factions produce, consume, regulate, tax, hoard, export, import, steal, embargo, and fight over real resources. Strategic goods connect geography, labour, settlement growth, magic, automation, diplomacy, and war.

| **Economic layer**     | **Required fields**                                                                                                                                  |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| Subsistence            | Food, water access, heat, shelter, medicine, clothing, tools, fuel, repair inputs, and emergency reserves.                                           |
| Production             | Primary industries, specialist crafts, machine adoption, magic infrastructure, labour model, waste, by-products, quality, and seasonality.           |
| Trade                  | Exports, imports, routes, caravans, ports, realm gates, tariffs, licences, contracts, reputation, danger, and market access.                         |
| Currency hook          | Barter, local coin, regional standard, ledger credit, guild token, ration chit, soul or oath debt, magical charge, or mixed tender.                  |
| Strategic resources    | Materials required for defence, portals, wards, industry, food security, medicine, cultural legitimacy, or realm survival.                           |
| Ownership and taxation | Who owns land, deposits, machines, workshops, warehouses, roads, gates, fisheries, forests, ruins, and salvage rights.                               |
| Informal economy       | Gifts, favours, household exchange, black markets, smuggling, piracy, salvage, tribute, protection, and illicit magic.                               |
| Economic crisis        | Shortage, inflation, route loss, crop failure, labour dispute, automation shock, embargo, occupation, disaster, boss threat, or realm contamination. |

# 15. Faction Taxonomy, Leadership, Membership, Assets, and Internal Politics

A faction is an organised actor with goals, leadership, membership, assets, relationships, information, territory or influence, and persistent memory. It may be local or cross-realm, public or secret, peaceful or violent, legal or criminal, temporary or ancient. Factions are not identical to cultures, settlements, governments, or ancestries, although they can represent or control them.

| **Faction layer** | **Required content**                                                                                                                          |
|-------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| Identity          | Stable ID, name profile, type, public description, secret truth, symbols, culture links, origin, and legitimacy claims.                       |
| Membership        | Eligibility, recruitment, ranks, obligations, benefits, households, guilds, settlement branches, spies, coerced members, and departure rules. |
| Leadership        | Leader or council, offices, succession, internal blocs, rivals, charisma, competence, corruption, and removal conditions.                     |
| Purpose           | Goals, ideology, fears, claims, strategic priorities, unresolved pressures, acceptable methods, and red lines.                                |
| Assets            | Territory, settlements, resources, wealth, military, specialists, trade routes, portals, magic, machines, archives, creatures, and allies.    |
| Relationships     | Trust, fear, respect, grievance, obligation, treaty, rivalry, war, infiltration, debt, legitimacy, and information certainty.                 |
| Simulation        | Strength, morale, logistics, unrest, economy, research, recruitment, war state, diplomacy, public support, and event budget.                  |
| Transformation    | Merge, split, reform, radicalise, decentralise, federate, collapse, go underground, become government, become criminal, or revive.            |

## 15.1 Internal blocs

Major factions should contain internal positions rather than one universal opinion. Merchants may favour peace while military leaders demand expansion. Traditionalists may oppose automation while engineers support it. Reformers may seek construct citizenship while property interests resist. Internal blocs create leadership contests, compromise, civil war, defections, and player influence without requiring a new top-level faction for every disagreement.

# 16. Diplomacy, Reputation, Information, Treaties, Espionage, and Crime

Diplomacy depends on what actors know, not only objective truth. A faction can misidentify the player, believe false rumours, hide a treaty, exaggerate a threat, or misunderstand another culture. Reputation is multi-dimensional and exists at individual, household, settlement, faction, culture, realm-route, and world levels where appropriate.

| **Relationship dimension** | **Meaning and use**                                                                                  |
|----------------------------|------------------------------------------------------------------------------------------------------|
| Trust                      | Confidence that promises, contracts, information, access, and cooperation are reliable.              |
| Fear                       | Expectation of harm, punishment, conquest, forbidden power, or uncontrollable consequences.          |
| Respect                    | Recognition of competence, honour, strength, craft, knowledge, authority, tradition, or achievement. |
| Affection                  | Personal or communal warmth, friendship, kinship, gratitude, admiration, or shared identity.         |
| Grievance                  | Remembered injury, theft, death, betrayal, occupation, pollution, desecration, or broken promise.    |
| Obligation                 | Debt, oath, contract, tribute, protection, kinship, rescue, inheritance, or treaty commitment.       |
| Legitimacy                 | Belief that a person, office, faction, border, law, settlement, or claim is rightful.                |
| Information                | Unknown, rumoured, suspected, verified, public, secret, forged, outdated, or disputed knowledge.     |

## 16.1 Treaty families

- Alliance, defensive pact, non-aggression, truce, ceasefire, guarantee, federation, vassalage, protectorate, autonomy, border recognition, and shared sovereignty.

- Trade agreement, tariff rule, monopoly, debt, tribute, labour contract, resource-sharing pact, caravan access, port rights, and portal throughput agreement.

- Pilgrimage access, sacred-site protection, archaeological custody, grave rights, refugee passage, prisoner exchange, research cooperation, and anti-corruption compact.

- Secret patronage, covert alliance, infiltration arrangement, black-market protection, false-flag agreement, double agency, and concealed succession support.

# 17. Territory, Borders, War, Conquest, Occupation, Resistance, and Peace

Territory is a relationship between people, law, control, use, infrastructure, and claims. Borders can be surveyed lines, rivers, roads, patrol zones, cultural frontiers, grazing ranges, sacred areas, migration corridors, mining claims, sea lanes, sky routes, portal networks, or overlapping jurisdictions. Map colour alone is not sufficient.

| **State**            | **Civilisation consequences**                                                                                                                                   |
|----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Peace                | Trade, travel, projects, mixed settlement, cultural exchange, diplomacy, migration, and internal development.                                                   |
| Rivalry              | Competition, tariffs, propaganda, border incidents, espionage, resource races, proxy factions, and limited pressure.                                            |
| War                  | Mobilisation, supply, raids, sieges, casualties, refugees, occupation goals, destruction, morale, alliances, and settlement defence.                            |
| Occupation           | Military control without automatic legitimacy; laws, taxes, property, resistance, collaboration, shortages, rebuilding, and external recognition remain active. |
| Annexation           | Attempted legal incorporation requiring administration, citizenship policy, settlement control, acceptance, repression, or negotiated autonomy.                 |
| Vassalage or tribute | Local government continues under obligations, protection, resource transfer, military support, or route access.                                                 |
| Rebellion            | Underground organisation, strikes, sabotage, defections, liberated zones, foreign support, propaganda, and leadership disputes.                                 |
| Peace settlement     | Borders, reparations, prisoners, succession, autonomy, disarmament, guarantees, resource access, trials, amnesty, and memory.                                   |

## 17.1 Player conquest rule

| **Conquest Rule**                                                                                                                                                                                                                                                                                                                                                    |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Capturing a settlement, defeating a leader, or destroying a faction headquarters does not instantly convert population, culture, legitimacy, law, property, loyalty, supply, or history. Player rule requires an occupation or negotiated-governance state, with administration, services, security, diplomacy, resistance, migration, rebuilding, and consequences. |

# 18. Migration, Diaspora, Refugees, Colonisation, and Cultural Change

Population movement is a major source of world variety. Migration can be voluntary, seasonal, economic, religious, ecological, political, military, catastrophic, or forced. It changes demographics, languages, labour, food, architecture, faith, factions, settlement growth, border pressure, and hybrid culture formation.

| **Movement type**      | **Typical causes and outcomes**                                                                                                                                                |
|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Seasonal migration     | Herding, fishing, harvest, pilgrimage, trade, climate, realm windows, or creature movement; creates temporary camps and recurring routes.                                      |
| Economic migration     | Jobs, land, resources, construction, guild recruitment, machine industry, universities, ports, and portal hubs.                                                                |
| Diaspora               | Long-term dispersed communities maintaining culture, language, faith, trade, memory, and claims across several settlements.                                                    |
| Refugees               | War, disaster, famine, corruption, boss pressure, persecution, occupation, route collapse, or realm failure; require shelter, law, food, work, safety, and political response. |
| Colonisation           | Settlement beyond existing territory or realm; requires claims, treaties, ecology, supply, adaptation, local consent or conflict, and long-term political meaning.             |
| Forced movement        | Exile, deportation, enslavement, prison transfer, ethnic cleansing, evacuation, or magical displacement; treated as serious world-state consequences.                          |
| Return and restoration | Diaspora return, reclaimed homeland, restored settlement, reopened route, revived culture, or post-war resettlement.                                                           |
| Hybridisation          | Sustained mixed institutions, households, labour, schools, markets, rituals, and public identity eventually produce a new culture branch.                                      |

# 19. Settlement Hierarchy, Growth, Decline, and Political Status

Settlement scale and settlement form are separate. The growth ladder remains Camp -\> Hamlet -\> Village -\> Fortified Village -\> Town -\> City -\> Capital -\> Magical Metropolis, but a settlement can also be nomadic, marine, skyborne, subterranean, realm-bound, monastic, military, industrial, sacred, academic, or mixed at any suitable scale.

| **Scale stage**    | **Typical capabilities**                                                                                            | **Failure or transition hooks**                                                                       |
|--------------------|---------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| Camp               | Temporary shelter, basic storage, fire, gathering, scouting, small household or work group.                         | Move, become seasonal, collapse, be attacked, formalise, or grow into a hamlet.                       |
| Hamlet             | Permanent homes, subsistence, small storage, one or two work sites, local authority, limited defence.               | Shortage, migration, annexation, abandonment, specialisation, or village growth.                      |
| Village            | Several jobs, warehouse, projects, trade, basic law, roads, services, guards, cultural identity.                    | Fortify, specialise, split, decline, become occupied, or grow.                                        |
| Fortified Village  | Walls or terrain defence, guard force, emergency reserves, watch network, stronger government.                      | Siege, demilitarisation, frontier expansion, refugee pressure, or town growth.                        |
| Town               | Markets, districts, specialists, regional trade, administration, guilds, stronger infrastructure.                   | Boom, stagnation, class conflict, route loss, industrialisation, or city growth.                      |
| City               | Multiple districts, institutions, complex law, major economy, cultural diversity, faction politics, large projects. | Civil unrest, succession, disaster, siege, annexation, reform, or capital status.                     |
| Capital            | Regional or realm-level government, archives, diplomacy, symbolic legitimacy, military and economic coordination.   | Succession crisis, revolution, conquest, relocation, federation, or collapse.                         |
| Magical Metropolis | Civilisation-scale mana, portals, automation, floating or realm infrastructure, wonders, complex governance.        | World event, systemic failure, realm conflict, corruption, secession, restoration, or transformation. |

## 19.1 Growth requirements

- Population, housing, food, water access, safety, health, work, storage, infrastructure, morale, specialists, governance, culture, resources, routes, and project capacity.

- Growth is not automatic population inflation. It requires available land or topology, supply, labour, political stability, environmental suitability, and construction.

- Settlements can intentionally remain small because of law, ecology, sacred duty, nomadism, isolation, defence strategy, resource limits, or cultural preference.

# 20. Settlement Morphology, Biome Adaptation, and Realm Adaptation

A settlement belongs to its environment through terrain use, materials, transport, food, water, power, hazards, ecology, architecture, storage, defence, and routes. Culture provides grammar; biome and realm provide constraints; history and faction control provide current state.

| **Environment**           | **Settlement adaptations**                                                                                                                          |
|---------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| Temperate surface         | Road networks, mixed agriculture, timber and stone construction, seasonal storage, river crossings, market squares, varied growth forms.            |
| Desert and dryland        | Water rights, cisterns, shaded streets, thermal mass, caravans, oasis control, dust protection, night schedules, salt and solar industry.           |
| Wetland and floodplain    | Stilts, canals, causeways, boats, raised stores, disease control, floating gardens, flexible boundaries, flood-season evacuation.                   |
| Mountain and alpine       | Terraces, lifts, tunnels, avalanche defence, compact heating, quarry access, cliff roads, ropeways, wind power, seasonal isolation.                 |
| Coast and islands         | Harbours, storm walls, fisheries, shipyards, lighthouse networks, salt storage, tide access, evacuation routes, piracy defence.                     |
| Marine and underwater     | Pressure adaptation, air or water circulation, reef integration, submersible routes, buoyant storage, current power, marine agriculture.            |
| Skylands                  | Anchor structures, bridges, gliders, airships, wind corridors, fall protection, cloud water, storm shelters, lightweight materials.                 |
| Underground               | Ventilation, light, fungus or imported food, water control, cave roads, lifts, structural mapping, heat, collapse defence, surface trade.           |
| Volcanic and forge depths | Cooling, heat-resistant materials, vent management, firebreaks, forge industry, toxic-gas monitoring, emergency shelters.                           |
| Realm settlement          | Law adaptation, stabilisation, native ecology, route dependence, imported inputs, political claims, cultural interpretation, contamination control. |

# 21. Districts, Services, Infrastructure, Defence, and Civic Projects

Districts are functional and social zones rather than mandatory city-grid pieces. Small settlements may express district functions through one building or shared space. Large settlements can contain overlapping residential, craft, market, sacred, administrative, military, academic, agricultural, industrial, transport, port, realm-gate, and marginal districts.

| **Civic layer**        | **Examples and system links**                                                                                                                  |
|------------------------|------------------------------------------------------------------------------------------------------------------------------------------------|
| Residential            | Households, communal halls, inns, dormitories, construct bays, spirit wards, gardens, sanitation, heating, and privacy.                        |
| Food and health        | Farms, fisheries, granaries, kitchens, wells, clinics, apothecaries, quarantine, burial, and emergency reserves.                               |
| Work and industry      | Workshops, mines, mills, foundries, rune halls, alchemy labs, machine yards, warehouses, waste handling, and labour offices.                   |
| Trade and transport    | Markets, caravan yards, docks, sky moorings, roads, rail, tunnels, customs, portals, stables, and route security.                              |
| Government and justice | Council halls, courts, archives, tax offices, prisons, mediation spaces, embassies, and public boards.                                         |
| Culture and knowledge  | Schools, libraries, shrines, theatres, guild halls, memorials, museums, festivals, and language institutions.                                  |
| Defence                | Walls, towers, gates, patrol routes, armouries, shelters, wards, traps, signal systems, evacuation routes, and repair stock.                   |
| Civic projects         | Housing expansions, waterworks, roads, bridges, hospitals, schools, ports, walls, magical grids, factories, portals, wonders, and restoration. |

# 22. Procedural Society, Faction, Territory, and Settlement Generation

Civilisation generation follows authored constraints and procedural history. It must not roll a culture, government, settlement form, environment, economy, and faction independently. The seed creates a coherent chain of causes, then validation repairs impossible or contradictory outputs while preserving variation.

1.  Select world-history influences, realm-network conditions, continent and region identities, resource provinces, route opportunities, and ancient layers.

2.  Select or derive ancestry demographic pools from migration, environment, realm access, prior empires, refuges, trade, and historical events.

3.  Choose culture families compatible with history and geography, then derive regional branches and mixed-population relationships.

4.  Generate languages, name profiles, faiths, governments, legal defaults, economic roles, settlement forms, and cultural infrastructure.

5.  Create settlement sites from terrain, water, resources, safety, routes, sacred areas, strategic needs, and political claims.

6.  Generate factions from institutions, crises, classes, professions, faiths, military needs, trade, realm routes, dissent, crime, or historical remnants.

7.  Apply wars, treaties, migrations, disasters, dynasties, reforms, occupations, collapses, restorations, and archaeological inheritance.

8.  Validate subsistence, route access, population support, settlement adaptation, legal authority, ownership, faction assets, and progression relevance.

9.  Assign persistent runtime IDs to generated settlements, factions, leaders, major households, treaties, wars, routes, claims, and social institutions.

10. Create current-state summaries, rumours, map knowledge, Codex certainty, event pressures, and distant-simulation schedules.

## 22.1 Generation validation priorities

| **Validation** | **Failure example**                                                                           | **Repair priority**                                                                                           |
|----------------|-----------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| Subsistence    | A settlement has no food, water, energy, trade, or adaptation path.                           | Add compatible local production, route dependency, stored reserves, or reduce settlement scale.               |
| Architecture   | Culture materials cannot exist or survive in the selected biome or realm.                     | Use regional material variant, imported supply route, protective technology, or different settlement profile. |
| Government     | No authority controls law, property, projects, or succession.                                 | Assign local council, faction governor, customary law, autonomous household network, or contested state.      |
| Faction assets | A faction has goals but no members, settlement, resources, income, route, secrecy, or patron. | Attach compatible assets, reduce scope, make it dormant, or remove it.                                        |
| Demographics   | Population body profiles cannot use housing, tools, routes, or environment.                   | Add adaptations, mixed infrastructure, equipment variants, or alternate site.                                 |
| History        | A ruin builder, current owner, culture, route, date, and claim contradict one another.        | Regenerate event edge, add conquest or migration event, or mark the claim disputed.                           |
| Progression    | All nearby societies block essential knowledge, resources, routes, or services.               | Add alternative discovery, neutral service, trade path, ruin, teacher, research, or fallback placement.       |

# 23. Historical Layers, Legitimacy, Archaeology, and Competing Truths

Generated societies inherit history rather than appearing at world start with no past. The Atlas uses primordial, ancient, intermediate, recent, and player-era layers. Each layer can add builders, migrations, languages, ruins, border claims, faiths, disasters, laws, roads, portal networks, extinctions, dynasties, revolutions, and unresolved grievances.

| **History layer** | **Civilisation output**                                                                                                                |
|-------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| Primordial        | World-shaping beings, first ecologies, realm fractures, giant remains, natural wonders, foundational myths, and pre-person history.    |
| Ancient           | Lost civilisations, old roads, sealed portals, megastructures, scripts, relics, original borders, great wars, and foundational faiths. |
| Intermediate      | Successor states, migrations, hybrid cultures, collapsed trade, revived settlements, religious changes, and altered ownership.         |
| Recent            | Current kingdoms, councils, guilds, faction rivalries, living witnesses, treaties, occupations, disasters, and active claims.          |
| Player era        | Construction, alliances, conquests, restorations, migrations, reforms, discoveries, boss aftermath, realm routes, and new cultures.    |

## 23.1 Legitimacy sources

- Descent, election, appointment, conquest, treaty, divine claim, popular support, guild charter, ancestral recognition, possession of a relic, control of infrastructure, protection, law, or practical service.

- Legitimacy is actor-specific and can be high among one class, settlement, faith, culture, faction, or foreign power and low among another.

- Archaeology can strengthen, undermine, complicate, or expose a claim, but evidence may be forged, misread, hidden, destroyed, sacred, or politically controlled.

# 24. Intelligent Hostile Societies, Raiders, Cults, Bandits, and Reform

Hostility is a faction state or relationship, not an ancestry category. Raiders, bandits, pirates, slavers, cults, mercenaries, occupying armies, corrupted settlements, undead polities, machine remnants, and monster-worshipping groups require motives, logistics, leadership, morale, territory, recruitment, and possible non-combat outcomes.

| **Hostile-society question** | **Required answer**                                                                                                                                      |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Why are they hostile?        | Resources, survival, ideology, revenge, coercion, corruption, profit, territory, leadership ambition, fear, law, faith, occupation, or misunderstanding. |
| How do they survive?         | Food, salvage, tribute, trade, theft, patronage, farming, mining, magic, machines, hidden settlements, or external supply.                               |
| Who joins?                   | Volunteers, families, criminals, refugees, coerced members, professionals, zealots, deserters, constructs, undead, or recruited locals.                  |
| What do they target?         | Warehouses, routes, prisoners, sacred sites, strategic resources, rival leaders, settlements, portals, machines, or symbols.                             |
| Can they change?             | Surrender, bargain, relocate, reform, split, mutiny, ally, become mercenary, integrate, receive amnesty, or collapse.                                    |
| What remains after defeat?   | Refugees, prisoners, loot, ruins, claims, leadership vacuum, splinter groups, liberated territory, ecological change, or new law.                        |

# 25. Realm-Linked Civilisations, Route Sovereignty, and Cross-Realm Settlements

Dimensions are connected worlds with their own laws, societies, ecologies, routes, and claims. An ancestry may have historical affinity with a realm without being its biological owner. Cultures can span several realms, exist as diasporas, maintain embassies, operate trade enclaves, hold sacred claims, or dispute the meaning of realm access.

| **Realm family**      | **Civilisation and settlement hooks**                                                                                                                          |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Verdant Covenant      | Seasonal courts, pact enclaves, living settlements, root-road communities, ecological treaties, harvest obligations, and disputes over extraction or promises. |
| Ancestral Veil        | Memorial cities, psychopomp orders, ancestor houses, pilgrimage routes, unresolved-dead communities, grave law, and identity continuity disputes.              |
| Somnolent Expanse     | Dream ports, lucid communes, nightmare dominions, memory archives, sleeper sanctuaries, prophecy markets, and consent law.                                     |
| Aetheric Reach        | Sky freeholds, storm monasteries, airship leagues, floating farms, anchor authorities, wind-right disputes, and mobile settlements.                            |
| Impossible Deep       | Pressure cities, thermal forge communes, trench pilgrimages, seismic infrastructure, deep-route treaties, and surface dependency.                              |
| World-Engine          | Civic assemblies, maintenance guilds, archive sects, machine-rights movements, repair territories, production law, and system-governance disputes.             |
| Ashen Lower Realms    | Contract cities, furnace principalities, rebel foundries, debt law, heat industry, sanctuary enclaves, and bargaining with powerful entities.                  |
| Void Between          | Anchor stations, scavenger flotillas, containment orders, memory-safe refuges, route monopolies, research colonies, and collapse risk.                         |
| Divine Concords       | Pilgrimage republics, temple polities, covenant courts, doctrinal embassies, trial settlements, relic custody, and competing divine claims.                    |
| Necropolis Domains    | Deathless republics, funerary kingdoms, soul-rights movements, mortuary guilds, living enclaves, inheritance disputes, and forbidden labour politics.          |
| Elemental Confluences | Treaty towns, adaptive enclaves, climate guilds, resource leagues, elemental citizenship, stabilisation infrastructure, and environmental sovereignty.         |
| Created Pockets       | Founder estates, research communes, prisons, sanctuaries, farms, vault cities, owner disputes, capacity limits, collapse law, and emancipation.                |

## 25.1 Route sovereignty

Owning a portal or route does not automatically confer sovereignty over its destination. Route owners may charge tolls, enforce passage law, inspect cargo, grant visas, or maintain safety while destination settlements, native societies, realm sovereigns, and competing factions retain separate claims. Route treaties require direction, throughput, ownership, law, emergency closure, refugee passage, military use, maintenance, and collapse responsibility.

# 26. Dynamic Civilisation States, Events, Succession, and Long-Term Change

Civilisations change through simulation rather than remaining static worldgen results. Nearby settlements use detailed NPC and resource simulation; distant societies use persistent summaries, event budgets, demographic totals, relationship graphs, project state, and promotion rules. Change must preserve identity, resources, history, and consequences when a location is reloaded.

| **Dynamic state family** | **Examples**                                                                                                                                             |
|--------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Demographic              | Growth, ageing, birth, creation, migration, refugee arrival, death, disease, mixed households, labour shortage, or diaspora return.                      |
| Political                | Election, succession, coup, reform, scandal, secession, federation, occupation, rebellion, collapse, constitutional change, or restoration.              |
| Economic                 | Boom, shortage, route loss, guild strike, automation transition, embargo, debt crisis, resource discovery, industrialisation, or black-market growth.    |
| Cultural                 | Festival, revival, language shift, assimilation, hybridisation, schism, artistic movement, historical discovery, taboo change, or generational conflict. |
| Security                 | Raid pressure, war, crime wave, guard reform, monster migration, boss awakening, sabotage, fortification, demobilisation, or peacekeeping.               |
| Environmental            | Famine, flood, drought, fire, blight, corruption, cleansing, overharvest, pollution, realm leakage, or habitat restoration.                              |
| Infrastructure           | Road, port, railway, ward grid, aqueduct, portal, factory, school, wall, hospital, wonder, collapse, abandonment, or repair.                             |
| Diplomatic               | Treaty, alliance, marriage pact, trade compact, border closure, refugee agreement, war, mediation, sanctions, or recognition.                            |

## 26.1 Succession and continuity

- Leadership death, retirement, removal, transformation, imprisonment, disappearance, or realm separation triggers a succession profile rather than deleting faction identity.

- Offices can pass by election, inheritance, appointment, duel, guild vote, divine sign, machine consensus, ancestor recognition, conquest, or emergency rule.

- Failed succession can split factions, start civil war, create regencies, invite foreign intervention, weaken law, or produce negotiated constitutions.

# 27. Detailed Ancestry and Personhood Registry

This registry defines foundational personhood and ancestry families for procedural cultures and settlements. These entries are not complete cultures, moral alignments, governments, professions, or biome locks. Every ancestry can appear across multiple societies, regions, classes, belief systems, technologies, and political identities.

| **Registry Rule**                                                                                                                                                                                                                        |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| An ancestry entry may describe broadly shared biological, constructed, spiritual, or magical traits, but it must not prescribe intelligence, morality, civilisation level, profession, social class, government, religion, or hostility. |

| **Stable ID**               | **Working Name**   | **Body and Shared Traits**                                                                                      | **Social Range**                                                                                             | **Heritage Examples**                                                                          | **Status** |
|-----------------------------|--------------------|-----------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|------------|
| ancestry.human              | Human              | Highly varied and adaptable body profiles with broad environmental tolerances.                                  | Can appear in any rural, urban, nomadic, maritime, subterranean, aerial, magical, or realm-linked society.   | Regional, magical, realm-returned, mixed-lineage, diaspora, and transformed heritages.         | Foundation |
| ancestry.goblin             | Goblin             | Typically smaller-bodied and dexterous, with strong low-space mobility and wide local variation.                | Can form cities, villages, guilds, clans, trade networks, communes, academic orders, or hostile factions.    | Deep, sky, fae, desert, coastal, construct-linked, urban, and mixed heritages.                 | Foundation |
| ancestry.dwarf              | Dwarf              | Robust compact builds, strong endurance, and useful vibration or stone-sense traditions in some lineages.       | Surface, underground, volcanic, frost, maritime, urban, pastoral, and realm-linked societies.                | Deepstone, frost, ember, skyhold, coastal, machine-linked, and mixed heritages.                | Foundation |
| ancestry.orc                | Orc                | Powerful but highly varied body frames; appearance and adaptation differ strongly by lineage and environment.   | Pastoral, urban, maritime, agricultural, scholarly, mercantile, military, and spiritual societies.           | Steppe, forest, coastal, highland, infernal, spirit-linked, tundra, and mixed heritages.       | Foundation |
| ancestry.elf.kindred        | Elven Kindreds     | Related long-lived body families shaped over generations by ecology, magic, memory, and realm exposure.         | Many independent cultures rather than one unified elven civilisation.                                        | Woodland, desert, moonlit, deep, dream, aetheric, river, urban, and mixed kindreds.            | Foundation |
| ancestry.construct.awakened | Awakened Construct | Created material bodies with genuine personhood; forms may be repaired, rebuilt, transferred, or self-modified. | Civic assemblies, guilds, adopted cultures, freed communities, machine societies, and mixed settlements.     | Stone, metal, wood, clay, glass, rune, organic, repurposed labour, and transferred-mind forms. | Foundation |
| ancestry.tidekin            | Tidekin            | Amphibious or aquatic peoples with body plans adapted to rivers, reefs, coasts, deltas, or deep water.          | River-clans, reef communes, harbour districts, deep-sea polities, traders, farmers, and explorers.           | Freshwater, saltwater, abyssal, estuary, ice-sea, current-born, and mixed heritages.           | Expansion  |
| ancestry.aerai              | Aerai              | Gliding or flight-assisted peoples with light frames, specialised balance, and altitude-adapted lineages.       | Sky freeholds, cliff settlements, fleets, ports, migratory communities, and ground-based diaspora.           | Storm, cloud, cliff, desert-thermal, nocturnal, aetheric, and mixed heritages.                 | Expansion  |
| ancestry.mycelian           | Mycelian           | Fungal or colony-bodied peoples whose individuality, memory, and reproduction vary by lineage.                  | Cavern settlements, forest enclaves, medical orders, archives, cities, farms, and migratory networks.        | Cave, root, luminous, toxic, dream, necropolis, machine-symbiotic, and mixed heritages.        | Expansion  |
| ancestry.emberkin           | Emberkin           | Scaled or heat-adapted peoples with wide differences in thermal tolerance, size, and magical affinity.          | Volcanic, forge, desert, scholarly, mercantile, military, agricultural, and cold-climate diaspora societies. | Magma, ash, sun, storm, deep-forge, elemental, glassland, and mixed heritages.                 | Expansion  |
| ancestry.rootborn           | Rootborn           | Plant-bodied or symbiotic peoples with seasonal, grafted, seed-grown, or cultivated forms.                      | Forest, garden, mobile-grove, city, farm, monastery, Verdant, and mixed settlements.                         | Canopy, marsh, thorn, bloom, fungal-symbiotic, winter, realm-grown, and mixed heritages.       | Expansion  |
| ancestry.veilborn           | Veilborn           | Spirit-material persons anchored by memory, relic, body, place, oath, or recurring manifestation.               | Memorial houses, traveller communities, ancestor societies, research enclaves, cities, and mixed households. | Ancestor, dream, relic, deathless, elemental, reincarnated, and place-bound heritages.         | Expansion  |

## 27.1 Ancestry Profile Requirements

| **Profile Field**        | **Required Content**                                                                             | **Design Safeguard**                                                     |
|--------------------------|--------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|
| Personhood basis         | Biological, constructed, spiritual, transformed, collective, or mixed form.                      | All playable and sapient entries receive equal personhood treatment.     |
| Body range               | Height, proportions, movement, senses, lifespan, repair/healing, reproduction, and variation.    | Describe ranges rather than one stereotyped body.                        |
| Environmental adaptation | Climate, pressure, altitude, water, mana, realm exposure, and accessibility needs.               | Adaptation affects preparation, not social worth.                        |
| Lineages and heritages   | Regional, magical, realm-linked, diaspora, mixed, and transformed variants.                      | Heritage is not automatically a culture.                                 |
| Equipment and buildings  | Fit, animation, socket, doorway, furniture, vehicle, mount, and workstation needs.               | World content must remain usable by supported body plans.                |
| Social diversity         | Examples across classes, professions, governments, faiths, and political alignments.             | No ancestry may be represented only as enemies or one occupation.        |
| Player support           | Origin options, customisation, voice/body presentation, gameplay readability, and accessibility. | Do not convert biological description into mandatory class restrictions. |

# 28. Detailed Culture Family Registry

Culture families are reusable civilisation identities that can generate multiple regional variants, settlements, factions, households, and political movements. They are intentionally multi-ancestry unless a particular historical context produces a narrower population.

| **Stable ID**                     | **Working Name**            | **Environment Tendency**                                    | **Social Identity**                                               | **Architecture**                                                     | **Economy and Magic**                                                   |
|-----------------------------------|-----------------------------|-------------------------------------------------------------|-------------------------------------------------------------------|----------------------------------------------------------------------|-------------------------------------------------------------------------|
| culture.hearthland.commons        | Hearthland Commons          | Temperate farms, river valleys, old roads                   | Household cooperation, local festivals, mutual defence            | Timber-and-stone villages, halls, mills, gardens                     | Food surplus, craft exchange, practical warding and seasonal rites      |
| culture.marchroad.leagues         | Marchroad Leagues           | Frontiers, trade roads, borderlands                         | Chartered towns, road law, caravans, negotiated identity          | Fortified inns, bridge towns, road shrines, depots                   | Transit tolls, cartwrighting, escorts, maps, signal magic               |
| culture.emberhold.concords        | Emberhold Concords          | Volcanic lands, deep forges, mountain basins                | Craft compacts, oath-led workshops, heat stewardship              | Vaulted halls, lava channels, forge courts, vent towers              | Metalwork, ceramics, heat power, rune forging, pressure engineering     |
| culture.moonroot.courts           | Moonroot Courts             | Ancient forests, twilight valleys, dream-touched regions    | Memory houses, seasonal courts, artful diplomacy                  | Living wood, moon wells, layered gardens, root bridges               | Rare botanicals, memory craft, illusion, dream navigation               |
| culture.brassroot.communes        | Brassroot Communes          | Scraplands, towns, underground workshops                    | Cooperative invention, salvage rights, public workshops           | Dense modular streets, shared foundries, pipe and lift networks      | Repair, devices, recycling, precision parts, mechanical automation      |
| culture.stormsteppe.confederacies | Stormsteppe Confederacies   | Prairie, savanna, high steppe, storm corridors              | Mobile households, herd law, seasonal assemblies                  | Portable halls, wind towers, corrals, route markers                  | Livestock, textiles, wind power, weather reading, mounted trade         |
| culture.tidesong.clans            | Tidesong Clans              | Rivers, deltas, coasts, estuaries                           | Waterway kinship, shared fisheries, navigation traditions         | Stilt homes, floating docks, river gardens, shellwork halls          | Fishing, boats, river crops, current magic, water logistics             |
| culture.cloudward.freeholds       | Cloudward Freeholds         | Cliffs, skylands, high plateaus, aerial routes              | Independent holds linked by flight and beacon treaties            | Cliff terraces, hanging docks, wind bridges, beacon towers           | Aerial trade, gliders, storm capture, cloud farming, rescue services    |
| culture.deepstone.compacts        | Deepstone Compacts          | Caverns, deep roads, mineral provinces                      | Shared excavation charters, safety law, inter-hall councils       | Terraced halls, load-bearing arches, rail galleries, cisterns        | Stone, ore, underground farming, surveying, seismic warding             |
| culture.saltglass.caravan_cities  | Saltglass Caravan Cities    | Deserts, salt pans, canyons, oasis chains                   | Mobile commerce, hospitality law, route intelligence              | Canvas districts, glass towers, shaded courts, cistern forts         | Salt, glass, spices, beasts, maps, mirage and heat magic                |
| culture.mirelight.covenants       | Mirelight Covenants         | Swamps, wetlands, mangroves, luminous fens                  | Water stewardship, medicinal knowledge, consensus circles         | Raised walkways, reed halls, boat homes, lantern gardens             | Medicine, dyes, reeds, wetland farming, bioluminescent craft            |
| culture.frosthearth.circles       | Frosthearth Circles         | Tundra, taiga, glaciers, polar coasts                       | Shared heat, seasonal migration, careful resource law             | Insulated halls, snow walls, communal hearths, ice cellars           | Furs, preserved food, ice craft, thermal engineering, aurora magic      |
| culture.verdant.pact_enclaves     | Verdant Pact Enclaves       | Verdant Covenant crossings and living biomes                | Negotiated coexistence with sentient landscapes                   | Grown structures, grafted bridges, seasonal rooms, pollen courts     | Living materials, seedcraft, growth magic, ecological treaties          |
| culture.veilkeeper.houses         | Veilkeeper Houses           | Ancestral sites, memorial roads, haunted or old regions     | Custodianship of memory, funerary rights, witness duties          | Memorial courtyards, archive crypts, spirit lamps, guest houses      | History, funerary services, relic care, cleansing and ancestor magic    |
| culture.dreamweaver.cantons       | Dreamweaver Cantons         | Dream-touched districts, Somnolent routes, scholarly cities | Shared dream law, privacy customs, symbolic art                   | Layered sleeping halls, mnemonic gardens, shifting galleries         | Therapy, prophecy, dream craft, memory art, safe dream travel           |
| culture.engine_civic.assemblies   | Engine-Civic Assemblies     | Machine districts, World-Engine enclaves, industrial towns  | Civic personhood, maintenance duty, transparent system governance | Modular civic frames, accessible repair halls, data beacons          | Machine parts, public infrastructure, logic craft, stable automation    |
| culture.ashbound.contract_cities  | Ashbound Contract Cities    | Infernal crossings, volcanic frontiers, trade enclaves      | Explicit contracts, negotiated obligations, public witness        | Basalt courts, cooling channels, contract towers, heat shelters      | Rare fuels, legal services, heat industry, binding and ward magic       |
| culture.reefgarden.communes       | Reefgarden Communes         | Warm seas, reefs, islands, submerged shelves                | Collective reef stewardship, tidal calendars, shared nurseries    | Coral-grown districts, bubble chambers, current gates, surface piers | Aquaculture, pearls, coral materials, tide power, marine healing        |
| culture.starfall.scholarates      | Starfall Scholarates        | Impact craters, observatories, high deserts, leyline sites  | Research colleges, open debate, hazardous knowledge law           | Observatories, specimen vaults, rune arrays, protected laboratories  | Research, celestial metals, mapping, ritual theory, anomaly containment |
| culture.wayfarer.mosaics          | Wayfarer Mosaic Settlements | Ports, frontier towns, portal routes, refugee centres       | Plural citizenship, negotiated customs, adaptive public life      | Mixed districts, shared markets, modular worship and civic spaces    | Trade, mediation, translation, repair, cultural exchange, hybrid craft  |

## 28.1 Regional Culture Variant Modifiers

| **Modifier Layer**   | **Possible Variants**                                                                          | **What It Changes**                                                                |
|----------------------|------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Climate and ecology  | Wet, dry, tropical, alpine, coastal, subterranean, aerial, realm-adapted                       | Food, clothing, construction, travel, schedules, hazards, and resource priorities. |
| Political experience | Imperial core, frontier, occupied, autonomous, post-revolt, diaspora, treaty enclave           | Law, trust, symbols, defence, faction attitudes, and claims.                       |
| Economic role        | Agrarian, industrial, mercantile, scholarly, extractive, pastoral, service, mixed              | Jobs, imports, exports, settlement districts, and class tensions.                  |
| Historical layer     | Ancient continuity, recent foundation, refugee reconstruction, restored ruin, colonial outpost | Architecture, heritage disputes, ruins, stories, and legitimacy.                   |
| Magic and technology | Low-magic, ritual, magitech, machine-led, spirit-linked, forbidden, anti-magic                 | Infrastructure, education, risks, taboos, and specialist jobs.                     |
| Settlement form      | Nomadic, dispersed, village network, city-state, underground hall, mobile fleet, pocket realm  | Population pattern, services, roads, governance, and simulation scale.             |

# 29. Government and Law Profile Registry

Government profiles are combinable templates rather than ancestry traits. A settlement or faction may use one profile, a hybrid constitution, or different systems at local and regional scale.

| **Stable ID**                      | **Profile**             | **Authority Base**                                              | **Decision Form**                                              | **Pressure Points**                                                    |
|------------------------------------|-------------------------|-----------------------------------------------------------------|----------------------------------------------------------------|------------------------------------------------------------------------|
| government.communal_council        | Communal Council        | Households, elders, neighbourhoods, or recognised contributors  | Delegated council with public meetings                         | Slow consensus, entrenched families, emergency powers                  |
| government.direct_assembly         | Direct Assembly         | Eligible residents or citizens                                  | Regular votes, rotating facilitators, committees               | Scale limits, participation inequality, populist swings                |
| government.constitutional_monarchy | Constitutional Monarchy | Crown plus chartered institutions                               | Monarch within written law, ministers, courts, councils        | Succession disputes, royal overreach, unequal charters                 |
| government.central_monarchy        | Central Monarchy        | Dynasty, conquest, sacred legitimacy, or inherited office       | Royal decrees through appointed officials                      | Succession, corruption, distance, rebellion                            |
| government.guild_oligarchy         | Guild Oligarchy         | Recognised craft, trade, or professional guilds                 | Weighted guild council and negotiated charters                 | Exclusion, monopoly, labour conflict, guild rivalry                    |
| government.clan_confederacy        | Clan Confederacy        | Households, clans, bands, or regional communities               | Seasonal moot, delegates, oath network                         | Fragmentation, feud, uneven obligations                                |
| government.civic_republic          | Civic Republic          | Citizenship, districts, elections, public office                | Elected councils, magistrates, courts                          | Faction capture, disenfranchisement, corruption                        |
| government.plural_temple_compact   | Plural Temple Compact   | Recognised faith communities and civil delegates                | Interfaith council with secular administration                 | Doctrinal conflict, minority access, sacred-law disputes               |
| government.frontier_march          | Frontier March          | Military charter, crown grant, settlement compact               | Warden with civilian council and emergency authority           | Militarisation, abuse of emergency powers, settler-native conflict     |
| government.cooperative_federation  | Cooperative Federation  | Workplaces, communes, districts, or member settlements          | Delegated federation with recall and shared services           | Coordination burden, local inequality, secession                       |
| government.machine_consensus       | Machine Consensus       | Recognised persons linked by verified civic protocols           | Auditable proposals, deliberation cycles, consensus thresholds | Protocol manipulation, access inequality, maintenance dependence       |
| government.ancestor_mandate        | Ancestor Mandate        | Living custodians plus recognised ancestral or spirit witnesses | Ritual consultation interpreted through councils and law       | Interpretive monopoly, false claims, conflict between past and present |
| government.contract_principality   | Contract Principality   | Binding charter, investors, ruler, guarantors, and residents    | Contractual offices with explicit obligations and penalties    | Coercive contracts, legal complexity, outsider disadvantage            |
| government.customary_network       | Customary Network       | Households, routes, reciprocity, and precedent                  | Distributed negotiation without one permanent centre           | Ambiguity, enforcement gaps, conflict between customs                  |

# 30. Faction Archetype Registry

Faction archetypes define organised interests that can be instantiated procedurally with culture, settlement, territory, leadership, resources, objectives, methods, rivals, and change history.

| **Stable ID**                | **Archetype**        | **Core Assets and Role**                                 | **Transformation Paths**                                         |
|------------------------------|----------------------|----------------------------------------------------------|------------------------------------------------------------------|
| faction.local_council        | Local Council        | Settlement administration, records, local legitimacy     | Reform, capture, dissolution, federation                         |
| faction.crown_administration | Crown Administration | Taxes, officials, courts, roads, garrisons               | Centralisation, constitutional reform, secession                 |
| faction.confederacy          | Confederacy          | Member clans, towns, or peoples linked by oath           | Unification, fragmentation, expansion, neutrality                |
| faction.merchant_league      | Merchant League      | Trade routes, warehouses, credit, contracts              | Monopoly, public utility, cartel war, political rule             |
| faction.craft_guild          | Craft Guild          | Skills, workshops, standards, apprenticeships            | Innovation, conservatism, labour split, industrial expansion     |
| faction.mage_order           | Mage Order           | Knowledge, rituals, wards, teachers, relics              | Public service, secrecy, corruption, doctrinal schism            |
| faction.faith_network        | Faith Network        | Temples, charities, pilgrims, doctrine, sacred sites     | Reform, crusade, plural compact, decline                         |
| faction.ancestor_house       | Ancestor House       | Lineage records, memorial sites, inheritance claims      | Reconciliation, succession conflict, historical revision         |
| faction.military_order       | Military Order       | Fortresses, trained forces, defence mandate              | Protectorate, coup, demobilisation, mercenary turn               |
| faction.frontier_company     | Frontier Company     | Charter, extraction sites, settlers, security            | Town government, abusive monopoly, collapse, nationalisation     |
| faction.caravan_federation   | Caravan Federation   | Mobile traders, route knowledge, pack animals, camps     | Permanent city, route migration, trade war, relief network       |
| faction.portal_authority     | Portal Authority     | Gates, route keys, transit law, stabilisation teams      | Open access, blockade, privatisation, realm diplomacy            |
| faction.research_consortium  | Research Consortium  | Laboratories, archives, expeditions, dangerous knowledge | Breakthrough, containment failure, public oversight, secrecy     |
| faction.personhood_league    | Personhood League    | Legal advocacy, shelters, evidence, civic campaigns      | Rights expansion, backlash, institutionalisation, radicalisation |
| faction.labour_union         | Labour Union         | Workers, strike funds, bargaining, safety knowledge      | Reform, repression, cooperative ownership, faction split         |
| faction.rebel_movement       | Rebel Movement       | Cells, grievances, hidden routes, popular support        | Reform victory, revolution, fragmentation, reconciliation        |
| faction.raider_clan          | Raider Clan          | Mobile fighters, stolen goods, intimidation, camps       | Settlement, treaty, confederation, escalation                    |
| faction.bandit_syndicate     | Bandit Syndicate     | Road control, fences, informants, extortion              | Criminal state, amnesty, internal war, merchant capture          |
| faction.pirate_flotilla      | Pirate Flotilla      | Ships, hidden ports, crews, sea routes                   | Free port, privateering, naval war, dispersal                    |
| faction.smuggler_network     | Smuggler Network     | Secret logistics, forged papers, safe houses             | Legitimisation, cartel control, resistance support, exposure     |
| faction.forbidden_order      | Forbidden Order      | Banned magic, hidden patrons, rare resources             | Exposure, catastrophe, redemption, takeover                      |
| faction.ancient_remnant      | Ancient Remnant      | Old infrastructure, surviving agents, historical claim   | Reawakening, alliance, restoration, extinction                   |
| faction.realm_embassy        | Realm Embassy        | Cross-realm legitimacy, interpreters, protected enclave  | Alliance, closure, annexation, migration hub                     |
| faction.crisis_coalition     | Crisis Coalition     | Temporary pooled resources against disaster or war       | Permanent federation, dissolution, authoritarian emergency rule  |

# 31. Settlement Archetype Registry

Settlement archetypes provide generation and simulation profiles. They do not imply one culture, ancestry, faction, or biome, and each profile supports regional material, architectural, economic, and political variants.

| **Stable ID**                    | **Archetype**            | **Scale**              | **Purpose**                                                          | **Minimum Infrastructure**                                                       |
|----------------------------------|--------------------------|------------------------|----------------------------------------------------------------------|----------------------------------------------------------------------------------|
| settlement.camp.temporary        | Temporary Camp           | Camp                   | Short stay, expedition, work crew, displaced group                   | Shelter, fire, water access, storage, sanitation                                 |
| settlement.camp.seasonal         | Seasonal Camp            | Camp                   | Recurring herding, fishing, farming, pilgrimage, harvest             | Durable storage, marked sites, seasonal work areas                               |
| settlement.hamlet.rural          | Rural Hamlet             | Hamlet                 | Small agricultural or craft community                                | Homes, water, food production, basic storage, gathering place                    |
| settlement.village.general       | General Village          | Village                | Balanced local service and production centre                         | Homes, food, storage, workshop, market point, governance, safety                 |
| settlement.village.fortified     | Fortified Village        | Fortified Village      | Threatened frontier or strategic rural centre                        | Walls or terrain defence, gates, guards, reserves, warning network               |
| settlement.town.market           | Market Town              | Town                   | Regional exchange and services                                       | Market, warehouses, inns, roads, administration, specialist workshops            |
| settlement.town.river            | River Town               | Town                   | Transport, fishing, milling, bridge control                          | Docks, crossing, flood control, water power, warehouses                          |
| settlement.town.port             | Port Town                | Town                   | Coastal or island trade                                              | Harbour, ship repair, customs, markets, storm shelter                            |
| settlement.town.mining           | Mining Town              | Town                   | Ore or stone extraction and processing                               | Mine access, supports, processing, worker housing, tailings control, safety      |
| settlement.town.forge            | Forge Town               | Town                   | Metal, ceramic, glass, heat, or machine industry                     | Power, cooling, foundries, storage, transport, fire control                      |
| settlement.enclave.mage          | Mage Enclave             | Hamlet–Town            | Teaching, research, wards, rituals                                   | Library, laboratories, mana storage, protected testing, accommodation            |
| settlement.monastery             | Monastery Settlement     | Hamlet–Town            | Faith, philosophy, archive, healing, pilgrimage                      | Sanctuary, food, guest housing, ritual space, archive, infirmary                 |
| settlement.caravanserai          | Caravanserai             | Hamlet–Town            | Route service, trade, protection, information                        | Courtyard, stables, repair, water, storage, lodging, signal system               |
| settlement.city.oasis            | Oasis City               | City                   | Dense desert centre around scarce water                              | Water governance, shaded districts, farms, trade depots, walls, cooling          |
| settlement.stilt                 | Stilt Settlement         | Hamlet–Town            | Floodplain, swamp, river, or coastal life                            | Raised routes, boats, water-safe storage, flexible foundations                   |
| settlement.hearthstead.tundra    | Tundra Hearthstead       | Hamlet–Village         | Cold-climate subsistence and route support                           | Insulation, shared heat, preservation, snow defence, fuel reserves               |
| settlement.cliff_terrace         | Cliff Terrace Settlement | Village–City           | Steep terrain, defence, sky route, mining                            | Anchors, lifts, terraces, fall safety, water capture, evacuation routes          |
| settlement.hall.underground      | Underground Hall         | Village–Town           | Subterranean habitation and industry                                 | Ventilation, water, food production, supports, lighting, escape routes           |
| settlement.city.deep_cavern      | Deep Cavern City         | City–Capital           | Regional underground civilisation centre                             | District caverns, transit, farms, air systems, seismic safety, deep logistics    |
| settlement.village.island        | Island Village           | Village                | Fishing, farming, navigation, local trade                            | Boats, storm shelter, freshwater, food storage, landing sites                    |
| settlement.freehold.sky          | Sky Freehold             | Village–Town           | Floating island or aerial-route community                            | Flight docks, anchors, wind protection, water capture, fall rescue               |
| settlement.city.reef             | Reef City                | Town–City              | Aquatic or amphibious marine centre                                  | Current routes, pressure-safe spaces, surface access, reef stewardship           |
| settlement.convoy.mobile         | Mobile Convoy            | Hamlet–Town equivalent | Nomadic, migratory, trade, refugee, military, or industrial mobility | Vehicles or beasts, modular housing, route supply, repair, governance            |
| settlement.fortress              | Fortress Settlement      | Fortified Village–City | Military control, refuge, frontier defence                           | Layered defence, stores, barracks, civilian quarter, water, siege resilience     |
| settlement.town.portal           | Portal Town              | Town–City              | Cross-realm transit and trade                                        | Gate safety, customs, quarantine, stabilisation, lodging, emergency closure      |
| settlement.enclave.realm_embassy | Realm Embassy Enclave    | Hamlet–Town            | Diplomatic and cultural bridge between realms                        | Protected status, translation, adapted habitat, transit, shared law              |
| settlement.colony.research       | Research Colony          | Camp–Town              | Remote study, excavation, anomaly observation                        | Laboratories, containment, supply, evacuation, secure records                    |
| settlement.pocket_realm          | Pocket-Realm Settlement  | Hamlet–City            | Bounded artificial or magical habitation                             | Stable anchor, life support, return route, capacity control, failure plan        |
| settlement.capital.regional      | Regional Capital         | Capital                | Political, administrative, economic, and cultural centre             | Government, courts, archives, markets, districts, defence, transport             |
| settlement.metropolis.magical    | Magical Metropolis       | Magical Metropolis     | Civilisation-scale magical or magitech hub                           | City-scale mana, transit, wards, governance, layered districts, disaster control |

# 32. Content Completeness Contracts and Production Budgets

The Atlas requires relationship completeness rather than isolated names. A people, culture, faction, or settlement is production-ready only when it has enough connected content to generate coherent residents, places, conflicts, services, stories, assets, and world-state reactions.

| **Completeness Principle**                                                                                                                                                                                                                                           |
|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Content should not be approved because it has an appealing description alone. Approval requires the registry links, variants, settlement support, simulation hooks, visual identity, progression uses, and dynamic-state behaviour needed for procedural generation. |

| **Content Package**           | **Minimum Relationship Contract**                                                                                                                                                                      | **Production Evidence**                                                                                              |
|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| Ancestry or personhood family | Body range; movement and senses; heritage variants; equipment/building fit; naming support; player/NPC presentation; several cultural examples; no moral or occupational lock.                         | Registry entry, model/rig requirements, animation notes, customisation plan, culture links, accessibility review.    |
| Culture family                | Regional variants; language profile; food, clothing, craft, art, faith, governance, economy, settlement forms, magic/technology attitudes, internal factions, neighbours, diaspora, and change states. | Culture entry, palette and architecture sheet, settlement links, faction set, trade goods, NPC dialogue/codex voice. |
| Major faction                 | Leadership; membership; territory; assets; objectives; methods; internal blocs; allies and rivals; reputation rules; diplomacy; services; quest/event hooks; succession and defeat outcomes.           | Faction definition, relationship graph, settlement ownership, encounter rules, dynamic-state transitions.            |
| Settlement profile            | Scale; population bands; districts; needs; jobs; storage; construction; services; law; defence; trade; transport; culture variants; biome/realm adaptation; damage and recovery.                       | Blueprint grammar, service matrix, job sites, resource ledger, LOD profile, persistence schema.                      |
| Regional civilisation package | At least two cultures or meaningful internal variants; multiple settlements; local factions; economy; routes; threats; history; ruins; diplomatic relationships; migration and conflict hooks.         | Region seed tests, generated map samples, population/territory summaries, trade and event simulations.               |
| Realm civilisation package    | Native and migrant societies; adapted settlements; realm law effects; cross-realm politics; resources; dungeons; routes; ecological relationships; return and evacuation rules.                        | Realm generation tests, portal-access cases, settlement adaptation kits, diplomacy and invasion simulations.         |

## 32.1 v0.1 Registry Coverage

| **Registry Family**                       | **v0.1 Foundation Count** | **Coverage Intent**                                                                    | **POC Identities Allowed** |
|-------------------------------------------|---------------------------|----------------------------------------------------------------------------------------|----------------------------|
| Ancestry and personhood families          | 12                        | Six foundation entries plus six expansion candidates, all culture-independent.         | 0                          |
| Culture families                          | 20                        | Broad environmental, political, technological, and realm-linked diversity.             | 0                          |
| Government profiles                       | 14                        | Reusable constitutions and customary systems with hybrid support.                      | 0                          |
| Faction archetypes                        | 24                        | Civil, political, economic, religious, military, criminal, research, and realm roles.  | 0                          |
| Settlement archetypes                     | 30                        | Land, water, sky, underground, mobile, realm, research, capital, and metropolis forms. | 0                          |
| Realm civilisation foundations            | 12                        | One baseline civilisation relationship profile for each 24D realm family.              | 0                          |
| Hardcoded tutorial societies or residents | 0                         | Tutorial and onboarding must bind to generated valid content.                          | 0                          |

## 32.2 Production Budget Rules

- Counts are planning foundations, not requirements to ship every entry simultaneously. Content moves through concept, registry, asset, simulation, and release gates independently.

- A smaller coherent roster is preferred over a large registry whose cultures lack settlements, whose factions lack motivations, or whose ancestry entries lack equipment and animation support.

- Reusable parent families should generate regional material, architectural, clothing, voice, and settlement variants without making cultures interchangeable.

- Named leaders and unique settlements are generated or authored as seed-bound instances. They must not become universal world assumptions.

- Every major society package should support friendly, neutral, conflicted, and hostile relationships where its history allows; hostility must belong to factions or circumstances rather than ancestry.

- Asset budgets must be recorded in 24L and linked to Forge production so model, texture, animation, audio, VFX, UI, localisation, and testing scope remains visible.

# 33. Discovery, Codex, Presentation, Forge, Audio, and VFX Requirements

Civilisations must be readable through the world before the player opens a menu. Architecture, clothing, tools, roads, crops, signs, banners, work rhythms, sound, lighting, magic, and NPC behaviour should communicate identity while avoiding one-symbol stereotypes.

| **Presentation Layer**  | **Atlas Requirement**                                                                                                                                | **Examples of Attached Production Data**                                                                          |
|-------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| Shape and silhouette    | Define body, clothing, equipment, building, vehicle, banner, and skyline languages that remain readable at voxel distance.                           | Forge kits, modular silhouettes, rig variants, doorway and workstation clearances.                                |
| Materials and colour    | Provide culture and regional palettes with climate, wealth, faction, age, damage, and realm variants.                                                | Material families, 32×32 texture sets, trim sheets, dyes, weathering and corruption states.                       |
| Animation and behaviour | Show profession, etiquette, social distance, ceremony, labour, fear, celebration, mourning, travel, and combat differences.                          | Animation tags, interaction sockets, held-object positions, crowd and schedule behaviours.                        |
| Audio identity          | Use language rhythm, tools, markets, music, bells, horns, machines, rituals, animals, and ambience without reducing a culture to one musical cliché. | Voice direction, settlement soundscape, profession loops, event cues, biome and realm layers.                     |
| Magic and VFX           | Express each society's use, regulation, infrastructure, risk, and aesthetics of magic or magitech.                                                   | Rune families, ward shapes, spell signatures, portal effects, public-works feedback, forbidden-state warnings.    |
| UI and maps             | Use readable symbols for settlements, factions, laws, routes, access, danger, reputation, and disputed territory.                                    | Map icon set, relationship colours/patterns, settlement overview, legal warnings, accessibility labels.           |
| Codex certainty         | Separate observed fact, local belief, faction claim, rumour, translation uncertainty, propaganda, and developer truth.                               | Source tags, confidence levels, cultural names, contradictions, discovered evidence, updated entries.             |
| Forge dependency links  | Every Atlas entry identifies required modular assets and optional variations rather than assuming bespoke production for every generated instance.   | Entity Forge IDs, building kits, item/block families, sockets, animation events, audio and VFX attachment points. |

## 33.1 Naming and Language Presentation

- The same person, creature, settlement, realm, ruin, or historical event may have different names across languages and cultures.

- Generated names use language-family phonology, morphology, social titles, household rules, settlement history, and migration layers rather than one global syllable list.

- Translations may be literal, approximate, politically contested, outdated, or deliberately misleading.

- Player-facing text should preserve readable pronunciation aids and localisation support without flattening every language into English word order.

- Signs, maps, dialogue, books, and official documents can reveal literacy, multilingualism, occupation, conquest, trade, and cultural exchange.

## 33.2 Cultural Readability Without Stereotyping

- Use combinations of architecture, economy, environment, law, history, values, internal debate, and individual behaviour—not one accent, food, colour, or weapon—to signal a culture.

- Every major culture needs ordinary civilian life, children or generational continuity where applicable, disabled residents, multiple professions, different wealth levels, and political disagreement.

- Cultural practices should have reasons and internal variation. Exceptions, reform movements, diaspora adaptations, mixed households, and personal dissent are expected.

- Hostile encounters must identify the responsible faction, order, army, raider group, cult, or criminal network rather than presenting an entire people as monsters.

# 34. Simulation LOD, Persistence, Multiplayer, and Save Safety

Civilisation simulation must preserve identity and consequence across detailed nearby play and abstract distant processing. Visual actors may unload, but named people, households, settlements, factions, claims, relationships, projects, and history remain persistent records.

| **Persistent Record** | **Minimum Saved State**                                                                                                                | **Near/Far Simulation Behaviour**                                                                                                 |
|-----------------------|----------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| NPC                   | Stable ID, identity stack, household, home, role, skills, inventory summary, health, relationships, memories, legal and faction state. | Full actor, schedule, inventory, navigation, dialogue, work and combat nearby; compact task and event outcomes at distance.       |
| Household             | Members, dependants, home, property/use rights, resources, obligations, relationships, migration intent.                               | Physical domestic activity nearby; demographic, consumption, care, and movement summaries at distance.                            |
| Settlement            | Population, culture mix, government, needs, storage, districts, jobs, projects, damage, laws, services, reputation, event history.     | Visible workers, logistics, construction and encounters nearby; resource and project ticks with bounded events at distance.       |
| Faction               | Leadership, membership, assets, objectives, relationships, territory, treaties, internal blocs, succession and defeat state.           | Agents and patrols nearby; strategic decisions, diplomacy and conflict resolution through regional simulation at distance.        |
| Territory or claim    | Claimant, basis, confidence, borders, disputes, occupation, resource rights, route control, historical evidence.                       | Boundary markers and guards nearby; influence fields, incidents and negotiation outcomes at distance.                             |
| Culture state         | Population distribution, variants, institutions, traditions, reform pressure, language use, diaspora and historical changes.           | Visible practices and dialogue nearby; bounded cultural diffusion, assimilation, revival and hybridisation summaries at distance. |
| Relationship edge     | Participants, status, trust, fear, obligations, grievances, treaties, debts, knowledge and expiry/renewal rules.                       | Conversation and actions update immediately nearby; strategic changes propagate through event queues at distance.                 |

## 34.1 Multiplayer Rules

- The authoritative host or server owns persistent civilisation state. Clients request validated actions and never directly rewrite reputation, ownership, faction, law, inventory, construction, or territory records.

- Reputation supports individual, party, settlement, faction, and world-level components. Shared actions must record contributors rather than assigning every consequence to all players equally.

- Crime, trade, donations, contracts, conquest, diplomacy, elections, faction membership, and settlement permissions require explicit ownership and witness rules.

- Split-screen and online players may belong to different cultures or factions and may hold different legal status in the same settlement.

- High-impact choices—war declarations, settlement law, forced migration, portal closure, annexation, or civilisation-scale projects—need permission and quorum rules appropriate to world settings.

- Disconnected players retain safe ownership and contribution records. Reconnection must not duplicate deliveries, votes, contracts, citizenship, or faction rewards.

## 34.2 Save and Migration Safety

- Definitions use stable namespace IDs; saves store IDs and mutable records rather than duplicated display text.

- Removing or renaming a culture, faction, settlement profile, law, or ancestry requires explicit migration, fallback, archival, or deprecation behaviour.

- Generated societies store their generation manifest and source definition versions so later updates do not silently rewrite history.

- Civilisation simulation writes through journals or atomic transactions for inventories, construction, migration, ownership, treaties, deaths, leadership, and territory changes.

- Backups and recovery must preserve the last valid society graph even if a later event batch, content pack, or migration fails.

# 35. Data Models, Registries, Validation, Seed Testing, and Production Gates

The Atlas is implementation-facing data. Godot/Summer Engine systems should import or load versioned definitions, generate mutable world instances from them, validate references, and preserve deterministic manifests.

| **Registry or Record**   | **Owns**                                                                                                                 | **Key Links**                                                                          |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------|
| AncestryDefinition       | Body range, personhood form, movement, senses, lifespan, heritage options, equipment and presentation requirements.      | Culture, NPC template, player origin, rigs, animation, gear, settlement accessibility. |
| CultureDefinition        | Values, practices, language use, material culture, economy, magic/technology, governance tendencies, variants.           | Regions, settlements, factions, households, recipes, blocks, items, dialogue, Codex.   |
| LanguageDefinition       | Phonology, writing, naming, comprehension, translation, register, borrowing and dialect rules.                           | Names, signs, dialogue, books, factions, cultures, quests, UI accessibility.           |
| GovernmentDefinition     | Authority, offices, succession, law process, citizenship, courts, emergency powers, participation.                       | Settlement, faction, laws, elections, leadership, reputation, quests and events.       |
| FactionDefinition        | Membership, leadership, assets, goals, methods, relationships, territory, services and state machine.                    | NPCs, settlements, structures, routes, events, diplomacy, combat, trade.               |
| SettlementProfile        | Scale, population, districts, services, jobs, needs, buildings, defence, transport, biome/realm adaptation.              | Worldgen, blueprints, NPC village simulation, resources, routes, structures, LOD.      |
| SocietyGenerationProfile | Compatible identity layers, diversity ranges, history grammar, faction budgets, settlement distribution, fallback rules. | World seed, region, realm, history, population, territory, routes and validation.      |
| RelationshipRecord       | Trust, fear, status, treaties, debts, obligations, claims, grievances, knowledge and timestamps.                         | NPC, household, settlement, faction, culture, realm and player actors.                 |
| CivilisationStateRecord  | Population, institutions, economy, territory, war, migration, disasters, cultural change, development and collapse.      | Regional simulation, quests, events, settlements, factions, history and saves.         |

## 35.1 Stable ID Examples

- \`ancestry.goblin\`, \`ancestry.construct.awakened\`, \`culture.deepstone.compacts\`, \`language.family.march_trade\`, \`government.cooperative_federation\`.

- \`faction.generated.\<world_seed_token\>.\<instance_token\>\`, \`settlement.generated.\<realm_token\>.\<region_token\>.\<instance_token\>\`.

- \`relationship.faction.\<a_id\>.\<b_id\>\`, \`claim.region.\<region_id\>.\<claimant_id\>\`, \`culture_variant.\<culture_id\>.\<region_id\>\`.

- Display names, translated names, titles, epithets, banners, and map labels are localised data and may change without changing stable identity.

## 35.2 Automated Seed-Test Matrix

| **Test Family**   | **Required Check**                                                                                                            | **Failure Example**                                                                            |
|-------------------|-------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------|
| Determinism       | Same seed, version, content packs, and settings produce the same civilisation manifest.                                       | Different culture, settlement, ruler, or faction appears without an authorised version change. |
| Variation         | Seed batches produce meaningful differences in populations, governments, relationships, histories, and settlement networks.   | Every world repeats one dominant culture and identical neighbour graph.                        |
| Coherence         | Societies fit climate, resources, routes, realm laws, history, infrastructure, and population capacity.                       | Large port civilisation generates without navigable water or supply.                           |
| Representation    | Foundation ancestries and culture types can appear in varied social roles and are not systematically assigned hostile status. | One ancestry generates almost exclusively as raiders or labourers.                             |
| Reachability      | Players can discover civilisation, trade, knowledge, settlement support, and realm access through valid generated routes.     | Required learning exists only in an unreachable or extinct society.                            |
| Persistence       | Save/load and LOD transitions preserve identities, leaders, households, treaties, projects, and inventories.                  | A distant capital respawns with a new government after reload.                                 |
| Migration         | Refugees, traders, settlers, armies, and diasporas move without duplicating or losing population and ownership.               | Migrating households exist in both origin and destination.                                     |
| Stress            | Large settlement and faction counts remain bounded and simulation budgets degrade gracefully.                                 | Political or household events grow without limit and block frame time.                         |
| Failure injection | Missing definitions, invalid links, interrupted writes, and removed content packs recover safely.                             | A missing culture definition corrupts the entire world save.                                   |

## 35.3 Production Gates

| **Gate**              | **Minimum Approval Criteria**                                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------------------------------------|
| Concept Gate          | Purpose, identity separation, non-stereotype check, system connections, world role, and scope owner approved.                       |
| Registry-Ready Gate   | Stable IDs, parent family, fields, tags, references, variants, dynamic states, and migration notes validate.                        |
| Greybox Gate          | Representative NPCs, settlement layouts, interactions, routes, UI, and LOD behaviour work with placeholder assets.                  |
| Content-Ready Gate    | Required models, textures, rigs, animations, buildings, items, audio, VFX, dialogue, localisation keys, and Codex entries exist.    |
| Simulation-Ready Gate | Jobs, needs, economy, factions, reputation, diplomacy, migration, damage, construction, and persistence pass test cases.            |
| Release-Ready Gate    | Seed coverage, performance, accessibility, representation, multiplayer authority, save migration, and content-pack validation pass. |

# 36. Balancing, Representation, and Player Freedom Rules

| **Freedom Rule**                                                                                                                                                                                                                         |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The player may cooperate, migrate, trade, join, govern, oppose, conquer, exploit, reform, restore, or leave societies, but the game must model social and material consequences rather than presenting every action as equally accepted. |

- No ancestry, lineage, body type, or realm origin grants an automatic moral alignment, intelligence ranking, social class, government, profession, or hostility profile.

- Cultures require internal diversity: regional variants, classes, professions, generations, faiths, parties, reformers, traditionalists, diaspora groups, and individuals who disagree.

- Hostile content is assigned to specific factions, military forces, raider groups, criminal organisations, corrupted institutions, monsters, or temporary war states.

- Peaceful and non-combat players must be able to access culture, trade, language, settlement growth, exploration, diplomacy, magic, automation, and most story knowledge.

- Combat and conquest can create alternate routes but should not be the universal fastest method for obtaining every recipe, resource, service, or realm key.

- Forced labour, enslavement, collective punishment, cultural destruction, displacement, forbidden personhood systems, and exploitative extraction require explicit ethical framing, resistance, reputation, law, rebellion, refugee, and faction consequences.

- The game should support abolition, liberation, treaty, reparations, restoration, asylum, amnesty, reform, mediation, and peaceful integration systems where appropriate.

- A faction or settlement may be defeated without erasing its culture or ancestry. Survivors, diaspora, memory, claims, refugees, occupied districts, resistance, and reconstruction remain possible.

- Generated societies need bounded demographic and political variation so every world differs without producing incoherent or offensive random combinations.

- Player-founded settlements can develop culture through residents, location, law, architecture, festivals, economy, alliances, history, and choices rather than selecting one immutable preset.

- No culture, ancestry, faction, or settlement should exist only as an enemy palette, loot source, exotic decoration, or progression gate.

## 36.1 Multiple Resolution Contract

| **Conflict Type**         | **Supported Resolution Families**                                                                                                     |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Resource dispute          | Trade, shared rights, compensation, regulated extraction, route change, arbitration, theft, sabotage, occupation, or withdrawal.      |
| Faction hostility         | Diplomacy, reputation repair, prisoner exchange, treaty, alliance, reform, leadership change, deterrence, defeat, or dissolution.     |
| Settlement crisis         | Supply, evacuation, construction, medicine, automation, ritual, political reform, migration, defence, or controlled abandonment.      |
| Realm dispute             | Access treaty, embassy, closure, stabilisation, shared stewardship, quarantine, colonisation conflict, repatriation, or war.          |
| Cultural conflict         | Translation, accommodation, plural law, autonomy, mediation, reform, assimilation pressure, resistance, separation, or hybridisation. |
| Boss or guardian conflict | Combat, cleansing, sealing, bargaining, restoring duty, relocating, taming, supporting, or changing the surrounding cause.            |

# 37. Cross-Document Update Plan

Document Set 24 supersedes POC-era content assumptions but does not replace the core systems. The following revisions are required so all registries and implementation plans recognise generated societies and the Godot/Summer Engine production direction.

| **Document or Set**                      | **Required Revision**                                                                                                                                                               |
|------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 00–02 Vision, Loop, Progression          | Remove Forest Hamlet and fixed-village examples as production assumptions; use generated civilisation discovery, teaching, reputation, settlement and realm paths.                  |
| 03–06 Blocks, Items, Recipes, Resources  | Replace POC-tagged culture goods and village IDs with culture/faction/settlement tags, material variants, generated ownership, and Atlas links.                                     |
| 07 NPC Village System                    | Retire fixed residents and Forest Hamlet templates; generalise households, jobs, laws, culture, government, migration, faction, settlement profile, and simulation records.         |
| 08 Automation System                     | Support culturally varied infrastructure, labour law, ownership, public/private networks, settlement permissions, realm adaptation, and generated supply contracts.                 |
| 09 Magic System                          | Link schools, rituals, public infrastructure, law, faith, faction, culture, realm and forbidden practices without ancestry locks.                                                   |
| 10 Creatures and Monsters                | Move sapient enemy identities into faction records; distinguish peoples from monsters; link ecology, domestication, diplomacy, settlements, and 24F.                                |
| 11 and 24B–24C Worldgen                  | Generate populations, territories, routes, settlements, cultural mosaics, ruins, claims, and migrations through deterministic relational placement.                                 |
| 12 and future 24I Structures             | Add culture kits, district grammars, ownership, government, law, access, occupation, restoration, mixed-material history, and settlement archetypes.                                |
| 13 Races, Peoples, Cultures and Factions | Supersede v0.1 POC entries with this Atlas separation model, expanded registries, player origins, culture families, faction archetypes, and representation rules.                   |
| 14 and 24D Dimensions                    | Connect each realm to multiple native and migrant societies, adapted settlements, embassies, law, trade, conflict, colonisation, and evacuation.                                    |
| 15 and future 24K Quests/Events          | Generate civilisation events from needs, institutions, factions, succession, law, migration, war, disasters, culture, and persistent history.                                       |
| 16 and future 24H Combat/Bosses          | Connect war, guards, armies, faction champions, siege threats, civilian consequences, treaties, occupation, and non-combat resolutions.                                             |
| 17 UI/UX                                 | Add society inspection, citizenship, law, faction graph, reputation layers, territory claims, language certainty, settlement overview, permissions, and accessible map symbols.     |
| 18 Technical Plan                        | Rewrite Unreal-specific assumptions for Godot/Summer Engine; preserve stable IDs, registries, authority, deterministic worldgen, simulation LOD, saves, validation, and testing.    |
| Forge document sets                      | Create ancestry rigs, body/equipment fit profiles, culture kits, settlement modules, banners, clothing, vehicles, animation events, audio/VFX sockets, and production dependencies. |

# 38. Open Questions for Later Production Planning

1\. Which ancestry and personhood families will be playable at first production release, and which remain NPC-only until animation, equipment, UI, and accessibility support is complete?

2\. How many complete language families, writing systems, dialect layers, and translation mechanics can be produced without overwhelming dialogue and localisation scope?

3\. What demographic model is appropriate for households, births, aging, death, adoption, constructed persons, spirit persons, migration, and world settings?

4\. How much freedom should players have to define an origin culture, mixed heritage, faith, citizenship, prior faction ties, and starting language knowledge?

5\. Which government actions require direct player interfaces, NPC deliberation, elections, councils, decrees, votes, laws, courts, or delegated administration?

6\. How deep should crime, evidence, witness, fines, imprisonment, exile, rehabilitation, corruption, and legal appeal systems become?

7\. Which sensitive historical and political systems require specialist representation review before implementation or public presentation?

8\. What are the minimum and maximum active faction counts per settlement, region, realm, and world before politics becomes unreadable or too expensive?

9\. How should distant wars, coups, elections, migrations, famines, trade changes, cultural shifts, and succession resolve without arbitrary outcomes?

10\. How strongly should language barriers affect dialogue, trade, law, diplomacy, quest understanding, maps, books, and multiplayer cooperation?

11\. What legal rights, maintenance needs, inheritance rules, and identity continuity apply to Awakened Constructs, Veilborn, collective beings, transferred minds, and resurrected persons?

12\. Which settlement services are physically simulated and staffed, and which use abstract capacity while the player is distant?

13\. How do cross-realm law, extradition, citizenship, asylum, quarantine, resource rights, portal ownership, and diplomatic immunity function?

14\. How should generated names, titles, households, cultures, factions, and settlements migrate safely when language and Atlas definitions evolve?

15\. What external sensitivity, cultural design, accessibility, and localisation reviews are required at each production gate?

# Appendix A. Ancestry and Personhood Entry Template

| **Field Group**    | **Required Fields**                                                                                                            |
|--------------------|--------------------------------------------------------------------------------------------------------------------------------|
| Identity           | Stable ID; display and localised names; personhood basis; parent family; planning status; source version.                      |
| Body and lifecycle | Body ranges; movement; senses; lifespan; healing/repair; reproduction or creation; sleep/food/energy; environmental needs.     |
| Variation          | Lineages; heritages; mixed forms; magical/realm changes; disability and adaptation; customisation ranges.                      |
| World interaction  | Collision; reach; camera; doors; furniture; ladders; vehicles; mounts; tools; armour; animation sockets; building clearances.  |
| Social breadth     | Example cultures, professions, governments, faiths, settlements, classes, friendly and hostile factions, diaspora.             |
| Gameplay           | Player availability; origin options; derived traits; counterbalance; accessibility; no mandatory class or morality lock.       |
| Presentation       | Models; rigs; textures; voices; names; animations; audio; VFX; UI portrait; Codex; Forge dependencies.                         |
| Validation         | Representation review; equipment-fit tests; settlement-access tests; multiplayer; save migration; prohibited stereotype flags. |

# Appendix B. Culture Entry Template

| **Field Group**         | **Required Fields**                                                                                                               |
|-------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| Identity                | Stable ID; names and self-names; parent culture family; regional variant; language use; population distribution.                  |
| Values and institutions | Shared ideals, disagreements, households, education, care, faith/philosophy, rites, etiquette, law, governance tendencies.        |
| Material life           | Food, clothing, art, crafts, tools, architecture, settlement forms, transport, farming, medicine, technology and magic.           |
| Economy                 | Jobs, labour customs, ownership, common goods, imports, exports, strategic resources, trade relationships, class structure.       |
| Politics                | Internal factions, leaders, reform movements, rivals, allies, historical grievances, diplomacy, military and civil organisations. |
| World placement         | Climate and biome tendencies, realm links, routes, settlement profiles, ruins, migration, diaspora and mixed regions.             |
| Dynamic states          | Prosperity, scarcity, war, occupation, revival, assimilation pressure, schism, reform, disaster, corruption, restoration.         |
| Presentation and data   | Palette, motifs, naming, voice, music, soundscape, VFX, Forge assets, tags, registry links, localisation and Codex perspectives.  |

# Appendix C. Faction and Relationship Templates

## C.1 Faction Entry

| **Field Group** | **Required Fields**                                                                                                   |
|-----------------|-----------------------------------------------------------------------------------------------------------------------|
| Identity        | Stable and instance IDs; names; archetype; culture links; headquarters; symbols; legal status.                        |
| Organisation    | Membership, leadership, succession, ranks, cells, departments, internal blocs, recruitment, dismissal.                |
| Purpose         | Objectives, grievances, doctrine, public claims, secret goals, methods, prohibited actions, risk tolerance.           |
| Assets          | Residents, specialists, structures, territory, routes, storage, wealth, armies, research, magic, automation, portals. |
| Relationships   | Allies, rivals, enemies, clients, patrons, treaties, debts, claims, infiltration, reputation and knowledge.           |
| State machine   | Formation, growth, schism, reform, alliance, war, defeat, occupation, disbanding, underground survival, restoration.  |

## C.2 Relationship Edge

| **Field**    | **Meaning**                                                                                                            |
|--------------|------------------------------------------------------------------------------------------------------------------------|
| Participants | NPC, household, settlement, faction, culture, government, realm, player or mixed actors.                               |
| Status       | Unknown, contact, neutral, friendly, allied, client, subject, rival, hostile, at war, truce, occupied, disputed.       |
| Modifiers    | Trust, fear, respect, dependence, ideological affinity, trade value, historical grievance, personal memory.            |
| Agreements   | Treaties, contracts, marriage/household links, trade access, defence, transit, extradition, resource sharing, tribute. |
| Knowledge    | What each side knows, believes, misunderstands, conceals, or claims about the other.                                   |
| History      | Timestamped events, contributors, witnesses, evidence, reparations, unresolved incidents, renewal and expiry.          |

# Appendix D. Settlement Entry Template

| **Field Group**             | **Required Fields**                                                                                                                |
|-----------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| Identity and placement      | Stable profile and instance IDs; name; scale; region; biome; realm; coordinates; history; owner and claims.                        |
| Population                  | Residents, households, ancestry/culture/language mix, citizenship, visitors, migration, workforce and dependants.                  |
| Government and law          | Constitution, leaders, offices, courts, laws, permissions, taxes, crime response, emergency rules.                                 |
| Physical settlement         | Districts, roads, water, homes, job sites, storage, farms, markets, walls, ports, portals, public spaces.                          |
| Needs and economy           | Food, housing, health, work, safety, infrastructure, morale, stocks, production, imports, exports, shortages.                      |
| Institutions and factions   | Guilds, faiths, schools, military, councils, parties, criminal groups, external powers and internal blocs.                         |
| Simulation                  | Schedules, construction, repairs, trade, events, threats, LOD, population change, damage, evacuation, abandonment and restoration. |
| Presentation and production | Architecture kit, material variants, signage, sounds, lighting, VFX, map icon, UI, Codex, Forge dependencies.                      |

# Appendix E. Minimum Completeness and Validation Matrix

| **Validation Question**                   | **Ancestry**            | **Culture**   | **Faction**               | **Settlement**   | **Region/Realm Package** |
|-------------------------------------------|-------------------------|---------------|---------------------------|------------------|--------------------------|
| Has stable identity and versioning?       | Required                | Required      | Required                  | Required         | Required                 |
| Has multiple non-hostile social roles?    | Required                | Required      | Required where applicable | Required         | Required                 |
| Has internal variation and dissent?       | Examples                | Required      | Required                  | Required         | Required                 |
| Has worldgen and placement rules?         | Compatibility           | Required      | Required                  | Required         | Required                 |
| Has economy, resources, and services?     | Compatibility           | Required      | Required                  | Required         | Required                 |
| Has dynamic states and aftermath?         | Heritage/transformation | Required      | Required                  | Required         | Required                 |
| Has presentation and Forge links?         | Required                | Required      | Required                  | Required         | Required                 |
| Has simulation LOD and persistence?       | NPC records             | Culture state | Faction state             | Settlement state | Regional summaries       |
| Has representation/accessibility review?  | Required                | Required      | Required                  | Required         | Required                 |
| Passes seed, save, and multiplayer tests? | Compatibility           | Generation    | Generation                | Generation       | Required                 |

# Appendix F. Document Acceptance Criteria

- All Forest Hamlet, fixed-resident, fixed-watchtower, Briarhook, Regional March, and other POC production assumptions are absent from active Atlas registries.

- Ancestry, heritage, culture, language, faith, government, faction, settlement, profession, citizenship, and personal loyalty remain separate data layers.

- The document defines a usable foundation roster of 12 ancestry/personhood families, 20 culture families, 14 government profiles, 24 faction archetypes, and 30 settlement archetypes.

- Every ancestry can participate in multiple cultures, professions, governments, settlement forms, realms, and moral or political positions.

- Every major culture supports internal factions, regional variants, ordinary civilian life, economy, settlement forms, history, migration, and dynamic change.

- Generated societies are deterministic, relational, versioned, validated, save-safe, multiplayer-authoritative, and compatible with simulation LOD.

- Settlement generation supports land, coast, water, sky, underground, mobile, portal, pocket-realm, capital, and magical-metropolis forms.

- Government, law, crime, reputation, diplomacy, territory, war, migration, colonisation, succession, and collapse connect to persistent world-state records.

- Realm civilisations follow 24D physical laws and support native, migrant, diaspora, embassy, trade, conflict, and cross-realm consequences.

- Presentation requirements cover models, rigs, clothing, buildings, materials, animation, audio, VFX, UI, map symbols, naming, language, Codex certainty, and Forge dependencies.

- The document aligns implementation language with Godot/Summer Engine and requires the old Unreal-specific technical plan to be revised.

- The next Atlas documents can reference these stable relationship rules without inventing hardcoded peoples, settlements, factions, or world placements.

---
## Navigation
- Previous: [[24D - Dimensions, Realm Structure and Realm Biome Atlas|24D]]
- Next: [[24F - Wildlife, Creatures, Monsters and Ecology Atlas|24F]]
- Index: [[00 - Document Set 24 Index]]
