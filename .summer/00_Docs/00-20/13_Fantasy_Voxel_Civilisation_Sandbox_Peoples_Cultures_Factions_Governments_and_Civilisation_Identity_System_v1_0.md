# LEYFORGE

## 13 — Peoples, Cultures, Factions, Governments and Civilisation Identity System

### Ancestry, Personhood, Cultural Identity, Language, Faith, Citizenship, Government, Law, Political Membership, Territory, Diplomacy, Migration and Persistent Civilisation Change

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `13_Fantasy_Voxel_Civilisation_Sandbox_Races_Peoples_Cultures_and_Factions_v0_1` for active production direction  
**Primary Authored Civilisation Content Authority:** `24E — World Content Atlas: Peoples, Cultures, Factions and Settlement Atlas v0.1`  
**Realm-Civilisation Context:** Document 14 + Atlas 24D  
**World Generation Context:** Document 11 v1.0 + Atlas 24A–24C  
**Persistent Person / Household / Job Context:** Document 07 v1.0  
**Creature / Personhood Boundary:** Document 10 v1.0 + Atlas 24F  
**Structure / Territory Evidence:** Document 12 v1.0 + Atlas 24I  
**Settlement Growth / Governance Facilities:** Documents 19–20  
**Economy Boundary:** Set 27  
**Social / Dialogue / Relationship / Negotiation Boundary:** Set 28  
**Biological Runtime Boundary:** Set 29  
**Movement / Physical Travel Boundary:** Set 30, with Set 26 maritime execution  
**Quest / Event Boundary:** Document 15  
**Combat / War Execution Boundary:** Document 16  
**Production Governance:** Set 25  
**Forge Presentation / Building Packs:** Sets 21–23 + Document 20G  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale civilisation identity and political-world-state system for Leyforge in which ancestry, personhood, culture, language, faith, citizenship, government, faction, settlement, territory, profession, political loyalty, social relationship and realm connection are separate but interoperable identities.

> **Civilisation Identity Statement**
>
> **People are not factions, factions are not cultures, cultures are not ancestries, governments are not settlements, faiths are not governments, and realms are not biological homelands. Leyforge builds societies by connecting these records through history, geography, migration, law, trade, belief, conflict and player action rather than inferring one identity from another.**

> **No Inherent Morality Rule**
>
> **No ancestry, lineage, body type, culture or realm origin is inherently heroic, evil, civilised, primitive, intelligent, obedient, criminal, peaceful, hostile, magical, industrial or suited to one profession. Behaviour belongs to individuals, institutions, factions, circumstances, history, laws, resources, relationships and current world state.**

> **Political State / Social Process Boundary**
>
> **Document 13 owns formal civilisation and political world state: identity, membership, citizenship, government, law, territory, recognised authority, faction organisation, treaties, war/peace status, occupation and political claims. Set 28 owns the social process by which people negotiate, persuade, trust, remember, believe, form relationships and socially react to those facts.**

> **Government Authority / Economy Boundary**
>
> **Document 13 may establish that a government has lawful authority to levy a tax, control a customs zone or authorise public borrowing. Set 27 owns the economic policy definition, assessment, amount, collection, treasury, payment and market consequences.**

---

# Document Purpose

Document 13 defines Leyforge's runtime rules for **who people and societies are politically and culturally**.

The original v0.1 already contained the core architectural insight that the game must distinguish:

- ancestry/species;
- lineage/heritage;
- culture;
- language;
- religion/philosophy;
- faction;
- settlement;
- citizenship;
- government;
- law;
- territory;
- personal allegiance.

It also explicitly established that:

- one ancestry may participate in many cultures;
- one culture may contain many ancestries;
- factions may span or divide cultures;
- a goblin raider does not imply all goblins are hostile;
- a human kingdom does not define humanity;
- cultures and factions may change through simulation;
- migration, diaspora, conquest, occupation and hybridisation matter;
- no ancestry is inherently good or evil.

Those principles remain production locks.

The World Content Atlas 24E later expanded the civilisation foundation into:

- **12 ancestry/personhood families**;
- **20 culture families**;
- **14 government profiles**;
- **24 faction archetypes**;
- **30 settlement archetypes**;
- **12 realm-civilisation foundation relationships**;
- procedural society generation;
- migration;
- diaspora;
- cross-realm settlements;
- legal identity;
- personhood;
- political change;
- representation/completeness contracts.

Document 13 v1.0 does not copy all of 24E into another editable Atlas.

Instead, it becomes the **gameplay/runtime authority for layered civilisation identity and formal political state**.

It answers:

- which identities a person can hold simultaneously;
- how ancestry and culture are kept separate;
- how citizenship and membership are granted, changed and revoked;
- how governments hold recognised authority;
- how laws and jurisdictions become active;
- how factions are instantiated from Atlas archetypes;
- how formal political relationships and treaties persist;
- how borders, claims, occupation and sovereignty are represented;
- how cultures branch, mix and persist through diaspora;
- how hostile factions can reform or split without redefining an ancestry;
- how political state remains consistent through LOD and save/load;
- how economy, social interaction, war, movement and settlements consume the same political truth.

---

# 1. Locked Civilisation Identity

Document 13 is the formal identity, membership, government, law and political-world-state authority.

It is not a personality simulator and not an economy simulator.

## 1.1 Core Identity Stack

A persistent person may simultaneously have:

- ancestry/species;
- lineage;
- heritage;
- body profile;
- culture;
- subculture/regional culture;
- language competencies;
- faith/philosophy;
- household;
- settlement residence;
- citizenship;
- legal status;
- profession/job;
- guild membership;
- public faction membership;
- secret faction membership;
- government office;
- military role;
- political bloc;
- personal relationships;
- personal beliefs;
- personal loyalties;
- realm origin/history;
- migration/diaspora history.

These layers may:

- align;
- conflict;
- overlap;
- change independently;
- be hidden;
- be disputed;
- be recognised differently by different jurisdictions.

## 1.2 Example Identity

A single generated person could be:

- ancestry: Goblin;
- heritage: coastal mixed lineage;
- culture: Wayfarer Mosaic;
- language: March Trade + local harbour creole;
- faith: Veilkeeper philosophy;
- citizenship: Deepstone-founded port;
- profession: navigator;
- guild: Merchant League affiliate;
- public faction: harbour council;
- secret faction: smuggler network;
- political loyalty: reform bloc;
- personal relationship: friend of a dwarf shipwright.

None of these facts is inferred from `ancestry.goblin`.

---

# 2. What Document 13 Owns

Document 13 owns:

- runtime ancestry/personhood-definition references;
- lineage/heritage identity links;
- culture membership and cultural-origin records;
- subculture/regional-culture membership;
- cultural change/hybridisation state;
- language-definition identity and formal language membership/competency references;
- faith/philosophy identity and formal affiliation references;
- citizenship;
- residency legal status where political rather than household;
- asylum/refugee/political status definitions;
- faction instance identity;
- faction membership;
- faction office/role;
- government-instance identity;
- government profile;
- formal office/authority;
- succession rules at the political layer;
- law-definition activation;
- jurisdiction;
- legal personhood recognition;
- property-rights framework references;
- political status;
- formal titles;
- territorial claim;
- sovereignty;
- border;
- occupation state;
- protectorate/vassal/autonomy state;
- formal war/peace state;
- alliance;
- political treaty;
- recognition;
- legitimacy claims;
- rebellion/secession political state;
- annexation/liberation state;
- political diaspora/colonisation status;
- formal political relationship graph;
- faction assets/claims references;
- political history;
- civilisation-state transitions;
- runtime Atlas-to-instance resolution;
- civilisation LOD;
- political persistence;
- civilisation diagnostics and validation.

---

# 3. What Document 13 Does Not Own

Document 13 does not own:

- persistent person existence, home, household, job or ordinary schedule — Document 07;
- interpersonal Trust, Affection, Fear, Loyalty, Grievance or friendship — Set 28;
- dialogue runtime — Set 28;
- rumours, beliefs, information confidence or witness knowledge — Set 28;
- persuasion, negotiation mechanics or social diplomacy resolution — Set 28;
- companion relationships — Set 28;
- prices, wages, currencies, economic contracts or market value — Set 27;
- tax assessment, tariff amount, treasury or public budget — Set 27;
- biological Health, Hunger, injury, disease, physiology runtime — Set 29;
- physical pathfinding/travel time — Set 30;
- vessel movement — Set 26;
- combat attack/damage — Document 16;
- settlement population operation — Document 07;
- settlement growth ladder/planning — Document 19;
- universal building/service function — Document 20;
- authored structure source — Blueprint Forge;
- realm topology/physics — Document 14/24D;
- creature ecology — Document 10/24F;
- final UI — Document 17.

---

# 4. 24E and Document 13 Relationship

24E is the **authored civilisation content Atlas**.

Document 13 is the **runtime identity and political state system**.

## 4.1 24E Owns

24E owns authored definitions for:

- ancestry/personhood families;
- culture families;
- language families/profiles;
- faith/philosophy families;
- government profiles;
- faction archetypes;
- settlement archetypes;
- realm civilisation foundations;
- society generation profiles;
- authored compatibility;
- content completeness;
- representation rules.

## 4.2 Document 13 Owns

Document 13 resolves those definitions into:

- specific faction instances;
- governments;
- political offices;
- active laws;
- citizenship records;
- territory claims;
- treaties;
- wars;
- political membership;
- sovereignty;
- occupation;
- migration/political status;
- cultural transition records;
- political history.

## 4.3 No Duplicate Atlas

Document 13 must not maintain a second editable copy of:

- the 12 ancestry/personhood families;
- 20 culture families;
- 14 government profiles;
- 24 faction archetypes;
- 30 settlement archetypes.

It references their stable IDs.

---

# 5. Production Foundation Counts

24E v0.1 establishes:

| Registry Family | Foundation Count |
|---|---:|
| Ancestry / personhood families | 12 |
| Culture families | 20 |
| Government profiles | 14 |
| Faction archetypes | 24 |
| Settlement archetypes | 30 |
| Realm civilisation foundations | 12 |
| Hardcoded tutorial societies/residents | 0 |

These are **content foundations**, not guaranteed simultaneous shipping scope.

Set 25 production gates still control release maturity.

---

# 6. Ancestry, Species and Personhood

Ancestry/species describes body-level inherited or persistent form.

It can include:

- biological body plan;
- constructed body;
- spirit-material embodiment;
- senses;
- environmental adaptation;
- equipment fit;
- lifespan/reproduction/repair context;
- inherited magical/realm adaptations;
- lineage compatibility.

It does not define:

- intelligence;
- morality;
- culture;
- job;
- class;
- government;
- religion;
- faction;
- hostility;
- technological sophistication.

## 6.1 Official Foundation Intake

24E establishes these foundation families:

| Stable ID | Working Name | Status |
|---|---|---|
| `ancestry.human` | Human | Foundation |
| `ancestry.goblin` | Goblin | Foundation |
| `ancestry.dwarf` | Dwarf | Foundation |
| `ancestry.orc` | Orc | Foundation |
| `ancestry.elf.kindred` | Elven Kindreds | Foundation |
| `ancestry.construct.awakened` | Awakened Construct | Foundation |
| `ancestry.tidekin` | Tidekin | Expansion |
| `ancestry.aerai` | Aerai | Expansion |
| `ancestry.mycelian` | Mycelian | Expansion |
| `ancestry.emberkin` | Emberkin | Expansion |
| `ancestry.rootborn` | Rootborn | Expansion |
| `ancestry.veilborn` | Veilborn | Expansion |

Document 13 references these definitions rather than rewriting their body descriptions.

---

# 7. Personhood

Personhood is distinct from body category.

Recognised personhood may apply to:

- biological peoples;
- awakened constructs;
- intelligent undead;
- spirits;
- transformed beings;
- collective persons;
- other future entities.

## 7.1 Personhood Rights Hook

A personhood definition may expose:

- recognised person;
- disputed personhood;
- collective personhood;
- legal recognition requirements;
- jurisdictional dispute hooks.

## 7.2 Document 10 Boundary

A recognised person cannot be routed into ordinary:

- livestock;
- pet capture;
- animal taming;
- animal sale;
- harvest;
- monster-loot classification

merely because they are hostile or non-human.

---

# 8. Lineage and Heritage

Lineage/heritage represents inherited, regional, transformed, realm-linked or mixed variation.

Examples:

- regional lineage;
- magical lineage;
- realm-returned lineage;
- mixed lineage;
- transformed heritage;
- diaspora adaptation.

Heritage is not automatically a culture.

## 8.1 Heritage Change

Changes may come from:

- family history;
- transformation;
- realm exposure;
- magical event;
- generational adaptation.

Such changes require explicit save/migration handling.

---

# 9. Ancestry and Player Progression

Document 02 preserves classless progression.

Ancestry may influence:

- body size;
- equipment fit;
- senses;
- environment;
- locomotion capability;
- biological profile;
- certain innate traits.

It must not prohibit entire:

- professions;
- schools of magic;
- settlement roles;
- automation paths;
- leadership roles

unless a specific physical constraint has an alternative path or is intentionally fundamental to the body.

---

# 10. Ancestry and Biology Boundary

Document 13/24E defines ancestry/body profile identity.

Set 29 owns runtime biology.

An ancestry definition can reference:

- Biological Profile;
- environmental tolerance;
- diet compatibility;
- repair/healing model;
- lifespan/life-stage model;
- body temperature context.

Set 29 executes:

- Health;
- Stamina;
- Fatigue;
- Hunger;
- Hydration;
- injury;
- disease;
- toxins;
- treatment.

---

# 11. Ancestry and Movement Boundary

Ancestry/body definitions may expose capabilities such as:

- body envelope;
- height;
- step clearance;
- amphibious capability;
- gliding anatomy;
- flight-assist capability;
- climbing anatomy;
- low-space mobility.

Set 30/26 executes movement.

Document 13 does not write transforms or speed.

---

# 12. Culture

Culture is learned social identity.

A Culture Definition may include:

- language tendencies;
- naming;
- food;
- clothing;
- craft;
- art;
- architecture;
- festivals;
- etiquette;
- faith patterns;
- philosophy;
- social institutions;
- labour customs;
- technology attitudes;
- magic attitudes;
- inheritance customs;
- settlement forms;
- historical identity.

Culture does not erase individual personality.

---

# 13. Culture Membership

Culture membership can be:

- birth culture;
- adopted culture;
- mixed culture;
- diaspora culture;
- regional culture;
- hybrid culture;
- revived culture;
- personally claimed culture;
- externally assigned culture.

## 13.1 Multiple Cultures

A person may participate in multiple cultural identities.

Examples:

- household culture;
- settlement culture;
- trade culture;
- diaspora culture;
- religious culture;
- realm-adapted culture.

The UI can choose what to display contextually.

---

# 14. Culture Foundation Intake

24E defines 20 culture families:

1. Hearthland Commons
2. Marchroad Leagues
3. Emberhold Concords
4. Moonroot Courts
5. Brassroot Communes
6. Stormsteppe Confederacies
7. Tidesong Clans
8. Cloudward Freeholds
9. Deepstone Compacts
10. Saltglass Caravan Cities
11. Mirelight Covenants
12. Frosthearth Circles
13. Verdant Pact Enclaves
14. Veilkeeper Houses
15. Dreamweaver Cantons
16. Engine-Civic Assemblies
17. Ashbound Contract Cities
18. Reefgarden Communes
19. Starfall Scholarates
20. Wayfarer Mosaic Settlements

Document 13 consumes their stable IDs and rules.

---

# 15. Culture Variants

Regional culture variants may result from:

- climate;
- ecology;
- political history;
- economy;
- magic;
- technology;
- settlement form;
- occupation;
- diaspora;
- realm adaptation.

A regional branch remains related to its parent culture without becoming an ancestry.

---

# 16. Hybrid Cultures

Hybrid cultures may emerge from:

- mixed settlement;
- trade;
- migration;
- intermarriage;
- conquest;
- occupation;
- shared frontier;
- common disaster;
- realm enclave;
- player-founded settlement.

## 16.1 Hybridisation Is Not Instant

A mixed settlement does not generate a new culture after one day.

A hybrid requires:

- persistent population;
- shared institutions/practices;
- time;
- language/material/social blending;
- sufficient difference from parent branches.

---

# 17. Cultural Continuity

Culture can survive without political sovereignty.

A conquered culture may persist through:

- households;
- language;
- food;
- religion;
- festivals;
- crafts;
- diaspora;
- archives;
- architecture;
- oral history;
- resistance;
- education.

Defeating a faction does not delete a culture.

---

# 18. Cultural Change

Culture may:

- reform;
- split;
- merge;
- revive;
- hybridise;
- regionalise;
- diaspora-adapt;
- assimilate partly;
- reject assimilation;
- disappear locally;
- return.

Change must leave history.

---

# 19. Language

Document 13 owns language-definition identity and formal competency references.

Set 28C owns how language affects information transfer and understanding.

Language may have:

- family;
- spoken form;
- signed form;
- written script;
- dialect;
- trade creole;
- ritual register;
- technical register.

## 19.1 Language Is Not Ancestry-Locked

A Goblin may speak:

- a Dwarven-associated civic language;
- March Trade;
- coastal creole;
- ritual script.

---

# 20. Translation

Document 13 supplies:

- language identity;
- competency;
- script knowledge.

Set 28C resolves:

- comprehension;
- mistranslation;
- confidence;
- information transfer.

Document 09 may provide magical translation capability.

---

# 21. Names and Titles

Naming systems may derive from:

- ancestry lineage;
- culture;
- household;
- profession;
- faction;
- office;
- faith;
- achievement;
- realm;
- personal choice.

A display name is not identity.

---

# 22. Faith, Religion and Philosophy

Faith/philosophy can cross:

- ancestry;
- culture;
- faction;
- settlement;
- realm.

Document 13 owns:

- faith-definition identity;
- formal affiliation;
- recognised religious institution;
- political/legal status of faith.

Document 09 owns magical truth.

Set 28 owns personal belief/relationship interpretation.

## 22.1 Belief Versus Membership

A person can:

- formally belong but doubt;
- believe privately without membership;
- follow multiple traditions;
- change faith;
- be secular.

Set 28 owns what they actually believe.

---

# 23. Government

Government defines formal authority and decision structure.

A government may operate at:

- settlement;
- city-state;
- regional;
- kingdom;
- confederation;
- realm enclave;
- cross-settlement federation.

## 23.1 Government Is Not Culture

A single culture may support:

- councils;
- monarchy;
- republic;
- guild rule;
- federation;
- customary law.

One government may rule multiple cultures.

---

# 24. Government Foundation Intake

24E defines 14 government profiles:

| Stable ID | Profile |
|---|---|
| `government.communal_council` | Communal Council |
| `government.direct_assembly` | Direct Assembly |
| `government.constitutional_monarchy` | Constitutional Monarchy |
| `government.central_monarchy` | Central Monarchy |
| `government.guild_oligarchy` | Guild Oligarchy |
| `government.clan_confederacy` | Clan Confederacy |
| `government.civic_republic` | Civic Republic |
| `government.plural_temple_compact` | Plural Temple Compact |
| `government.frontier_march` | Frontier March |
| `government.cooperative_federation` | Cooperative Federation |
| `government.machine_consensus` | Machine Consensus |
| `government.ancestor_mandate` | Ancestor Mandate |
| `government.contract_principality` | Contract Principality |
| `government.customary_network` | Customary Network |

Profiles are reusable, combinable templates rather than ancestry traits.

---

# 25. Government Instance

A runtime government instance may contain:

```yaml
government_instance:
  government_id: government_instance:<ulid>
  profile_ref: government:<24E_id>
  jurisdiction_refs: []
  governed_settlement_refs: []
  governed_territory_refs: []
  governing_faction_refs: []
  office_refs: []
  constitution_or_charter_refs: []
  active_law_set_ref: <id>
  succession_profile_ref: <id>
  recognised_by_refs: []
  legitimacy_claim_refs: []
  fiscal_authority_ref: <id>
  military_authority_ref: <id>
  diplomacy_authority_ref: <id>
  state: active
  revision: <n>
```

---

# 26. Political Offices

Examples:

- councillor;
- mayor;
- magistrate;
- monarch;
- warden;
- guild representative;
- speaker;
- minister;
- judge;
- governor;
- delegate;
- clan representative;
- treaty envoy.

Document 07 owns the person.

Document 13 owns the office and authority.

---

# 27. Authority Tokens / Capability

Political authority should be queryable.

Examples:

- can enact law;
- can sign treaty;
- can declare war;
- can appoint office;
- can grant citizenship;
- can control customs;
- can authorise taxation;
- can command public military;
- can grant asylum;
- can issue building permit.

Authority can be:

- personal;
- office-based;
- council-based;
- conditional;
- emergency;
- delegated.

---

# 28. Law

Document 13 owns law definition/activation and jurisdiction.

A law may define:

- prohibited act;
- required act;
- protected status;
- ownership rule;
- property rule;
- citizenship rule;
- marriage recognition;
- inheritance rule;
- weapon restriction;
- magic restriction;
- building restriction;
- hunting restriction;
- movement/border rule;
- trade authorisation hook;
- taxation-authority hook;
- punishment/sanction authority.

## 28.1 Law Does Not Execute Every Consequence

Document 13 determines:

- whether law exists;
- jurisdiction;
- legal classification;
- authority.

Other systems execute:

- seizure;
- combat;
- prison movement;
- economic payment;
- reputation reaction;
- biological consequence.

---

# 29. Jurisdiction

A jurisdiction may apply to:

- settlement;
- district;
- territory;
- road;
- bridge;
- market;
- port;
- portal;
- vessel under recognised law;
- protected site.

Overlapping jurisdictions are supported.

---

# 30. Legal Status

A person may hold statuses such as:

- citizen;
- resident;
- visitor;
- guest;
- protected foreigner;
- diplomat;
- refugee;
- asylum seeker;
- stateless;
- outlaw;
- prisoner/detainee;
- indentured/contract-bound where the setting supports serious legal systems;
- emancipated;
- disputed personhood.

These are political/legal facts.

Social stigma or acceptance belongs to Set 28.

---

# 31. Citizenship

Citizenship may be acquired by:

- birth;
- descent;
- residence;
- oath;
- adoption;
- naturalisation;
- service;
- charter;
- political grant;
- treaty;
- emancipation.

It may be:

- single;
- dual;
- multiple;
- layered local/regional.

## 31.1 Citizenship Does Not Equal Culture

A person may be a citizen without adopting local culture.

---

# 32. Property and Ownership Law

Document 13 defines legal ownership frameworks.

Actual inventories/structure ownership remain with their physical owners.

Law may recognise:

- private property;
- household property;
- communal ownership;
- guild ownership;
- settlement ownership;
- state ownership;
- sacred custody;
- stewardship;
- use-rights;
- lease;
- tenancy.

Set 27 handles economic contracts/rents.

---

# 33. Inheritance

Document 13 owns inheritance law.

Set 28 owns interpersonal family relationship.

Document 07 owns household.

Physical inventory/property owners execute transfers after authoritative inheritance resolution.

Marriage does not automatically merge property unless law/contract says so.

---

# 34. Marriage / Union Recognition Boundary

Set 28D owns:

- interpersonal partnership;
- mutual commitment;
- marriage/union social milestone;
- relationship consequences;
- separation/reconciliation social state.

Document 13 owns:

- legal recognition;
- ceremony requirements;
- inheritance consequences;
- titles/property law;
- political marriage consequence;
- prohibited legal relationships;
- divorce law.

---

# 35. Factions

A faction is an organised group with:

- membership;
- goals;
- leadership;
- assets;
- resources;
- methods;
- history;
- relationships;
- internal politics.

A faction is not a culture.

---

# 36. Faction Types

Possible types include:

- local government;
- crown administration;
- confederacy;
- merchant league;
- guild;
- mage order;
- faith network;
- ancestor house;
- military order;
- frontier company;
- caravan federation;
- portal authority;
- research consortium;
- rights/personhood league;
- labour organisation;
- rebels;
- raiders;
- bandits;
- pirates;
- smugglers;
- forbidden order;
- ancient remnant;
- realm embassy;
- crisis coalition.

---

# 37. Faction Foundation Intake

24E defines 24 archetypes:

| Stable ID | Archetype |
|---|---|
| `faction.local_council` | Local Council |
| `faction.crown_administration` | Crown Administration |
| `faction.confederacy` | Confederacy |
| `faction.merchant_league` | Merchant League |
| `faction.craft_guild` | Craft Guild |
| `faction.mage_order` | Mage Order |
| `faction.faith_network` | Faith Network |
| `faction.ancestor_house` | Ancestor House |
| `faction.military_order` | Military Order |
| `faction.frontier_company` | Frontier Company |
| `faction.caravan_federation` | Caravan Federation |
| `faction.portal_authority` | Portal Authority |
| `faction.research_consortium` | Research Consortium |
| `faction.personhood_league` | Personhood League |
| `faction.labour_union` | Labour Union |
| `faction.rebel_movement` | Rebel Movement |
| `faction.raider_clan` | Raider Clan |
| `faction.bandit_syndicate` | Bandit Syndicate |
| `faction.pirate_flotilla` | Pirate Flotilla |
| `faction.smuggler_network` | Smuggler Network |
| `faction.forbidden_order` | Forbidden Order |
| `faction.ancient_remnant` | Ancient Remnant |
| `faction.realm_embassy` | Realm Embassy |
| `faction.crisis_coalition` | Crisis Coalition |

---

# 38. Faction Instance

```yaml
faction_instance:
  faction_id: faction.generated:<world>:<ulid>
  archetype_ref: faction:<24E_id>
  public_name_ref: <name>
  culture_refs: []
  membership_refs: []
  leadership_ref: <id>
  office_refs: []
  settlement_refs: []
  territory_claim_refs: []
  asset_refs: []
  political_goal_refs: []
  method_policy_refs: []
  internal_bloc_refs: []
  treaty_refs: []
  political_relationship_refs: []
  economic_party_ref: <set27_id>
  social_profile_ref: <set28_id>
  current_state: active
  history_refs: []
  revision: <n>
```

---

# 39. Faction Membership

Membership can be:

- citizen-based;
- employee;
- oath;
- military;
- religious;
- professional;
- family/clan;
- ideological;
- secret;
- temporary;
- coerced;
- inherited;
- appointed;
- elected.

## 39.1 Multiple Memberships

A person can be:

- citizen of a republic;
- member of a guild;
- member of a faith network;
- member of a research consortium.

Conflict between memberships can create story.

---

# 40. Membership Is Not Loyalty

Document 13 stores formal membership.

Set 28 stores social/personal Loyalty.

A member may be disloyal.

A non-member may be deeply loyal.

---

# 41. Internal Faction Politics

A faction can contain:

- reform bloc;
- conservative bloc;
- militant bloc;
- merchant bloc;
- religious bloc;
- regional bloc;
- leadership rival.

Document 13 owns the political group/office state.

Set 28 resolves interpersonal persuasion and relationships.

---

# 42. Faction Goals

Goals may include:

- survival;
- wealth;
- territory;
- reform;
- independence;
- defence;
- trade control;
- knowledge;
- faith;
- personhood rights;
- labour reform;
- realm access;
- resource security.

Goals need:

- motivation;
- capacity;
- evidence;
- possible transitions.

---

# 43. Hostile Factions

Hostility belongs to current political relationship, faction goal and circumstance.

A hostile faction must answer:

- why hostile;
- how supplied;
- who joins;
- what targeted;
- how leadership works;
- whether change is possible;
- what remains after defeat.

---

# 44. Raiders, Bandits and Pirates

These are faction archetypes, not ancestries.

A raider faction may:

- negotiate;
- surrender;
- relocate;
- reform;
- split;
- become mercenary;
- settle;
- escalate.

The original Briarhook concept becomes an Archived Validation example only.

---

# 45. Cults and Forbidden Orders

A cult/forbidden faction may be dangerous due to:

- goals;
- methods;
- magic;
- coercion;
- political actions.

It is not dangerous because its ancestry is “evil.”

---

# 46. Government and Faction Separation

A faction may:

- control government;
- oppose government;
- lobby government;
- be government administration;
- operate outside government.

Government is the formal authority structure.

Faction is an organised interest/group.

---

# 47. Settlement and Government Separation

A settlement is:

- physical place;
- population;
- operation.

Government is authority.

One government may govern multiple settlements.

One settlement may have:

- municipal government;
- regional government;
- faction authorities;
- customary authorities;
- contested authorities.

---

# 48. Settlement Archetypes

24E owns 30 settlement archetypes.

Document 13 consumes:

- political status;
- citizenship;
- government;
- faction presence;
- territorial relation.

Document 19/20/07 own growth, buildings and operation.

---

# 49. Territory

Territory is a political/spatial claim.

It may be:

- sovereign;
- disputed;
- occupied;
- leased;
- communal;
- protected;
- sacred;
- demilitarised;
- frontier;
- autonomous.

Document 13 stores claim geometry/reference and political owner.

Document 11/12 stores physical world.

---

# 50. Territory Is Not Perfect Control

A faction may claim land it cannot:

- patrol;
- access;
- supply;
- govern.

Claims and effective control are separate.

---

# 51. Borders

Borders may follow:

- rivers;
- ridges;
- roads;
- structures;
- settlement influence;
- historical markers;
- coordinates;
- customary use;
- treaty lines.

Set 30 determines physical movement across them.

---

# 52. Border Access

Document 13 may define:

- legal open/closed;
- visa requirement;
- permit requirement;
- military restriction;
- quarantine rule;
- customs authority.

Set 30 answers whether the route is physically traversable.

Set 27 handles economic customs/tariffs.

---

# 53. Sovereignty

Sovereignty means recognised authority claim.

It is not inferred from:

- ancestry;
- culture;
- nearest settlement;
- route owner.

A portal owner does not automatically own the destination realm.

---

# 54. Political Recognition

Recognition may exist between:

- governments;
- factions;
- settlements;
- realms.

States:

- recognised;
- partially recognised;
- unrecognised;
- disputed;
- hostile but recognised.

Social attitudes remain Set 28.

---

# 55. Legitimacy

Political legitimacy may claim basis in:

- descent;
- election;
- appointment;
- conquest;
- treaty;
- sacred/divine claim;
- popular support;
- guild charter;
- ancestor recognition;
- relic;
- infrastructure control;
- protection;
- law;
- service.

Legitimacy can differ by observer.

## 55.1 Belief Boundary

Document 13 stores formal legitimacy claims and recognition.

Set 28 stores whether a person believes/accepts them.

---

# 56. Diplomacy World State

Document 13 owns formal diplomatic state such as:

- peace;
- alliance;
- defensive pact;
- non-aggression;
- truce;
- war;
- embargo authorisation;
- recognition;
- protectorate;
- vassalage;
- autonomy;
- access treaty;
- extradition treaty;
- portal treaty;
- ceasefire.

Set 28 owns the negotiation/social process.

---

# 57. Negotiation Boundary

Set 28 may resolve:

- proposal;
- persuasion;
- intimidation;
- credibility;
- face-saving;
- social acceptance;
- relationship consequences.

Document 13 validates and commits the political state change.

Example:

**Set 28:** parties agree to proposed truce.  
**Document 13:** authoritative `TreatyRecord` transitions war → truce if signatories have authority.

---

# 58. Treaty Record

```yaml
political_treaty:
  treaty_id: treaty:<ulid>
  treaty_type: truce
  signatory_refs: []
  authorised_signer_refs: []
  effective_world_time: <time>
  expiry_or_review_time: <time>?
  jurisdiction_refs: []
  political_terms: []
  economic_term_refs: []
  movement_access_term_refs: []
  realm_term_refs: []
  breach_condition_refs: []
  dispute_resolution_refs: []
  status: active
  history_refs: []
  revision: <n>
```

Economic terms reference Set 27.

---

# 59. Treaty Breach

A breach requires authoritative evidence.

Examples:

- attack;
- border violation;
- unpaid treaty payment;
- prohibited military movement;
- route closure;
- unlawful seizure.

Document 13 records political breach/status.

Set 28 handles reaction/relationship.

---

# 60. War

Document 13 owns:

- formal war state;
- belligerents;
- political objectives;
- recognised casus/claims;
- alliance obligations;
- war status;
- occupation state.

Document 16 owns combat.

Set 27 owns war economy.

Set 30 owns physical campaigns/travel.

---

# 61. War Objectives

Examples:

- defend;
- seize territory;
- liberate;
- enforce treaty;
- depose government;
- secure route;
- rescue citizens;
- destroy threat;
- independence.

War objective is political state.

It does not guarantee battlefield victory.

---

# 62. Surrender

Set 28/Document 16 may resolve surrender interaction.

Document 13 commits:

- ceasefire;
- capitulation;
- occupation terms;
- prisoner/legal status;
- transfer of authority;
- treaty state.

---

# 63. Conquest

Conquest requires more than capturing a flag.

It may require:

- military control;
- government collapse or capitulation;
- occupation capacity;
- route access;
- administrative authority;
- population response;
- external recognition;
- settlement control.

---

# 64. Occupation

Occupation is separate from sovereignty.

A territory/settlement may have:

- legal claimant;
- occupier;
- local government;
- resistance;
- foreign recognition.

Document 12 structures can likewise have owner and occupier separately.

---

# 65. Resistance

Resistance may be:

- civil;
- political;
- armed;
- economic;
- cultural;
- clandestine.

Document 13 owns resistance faction/political state.

Set 28 handles recruitment/social willingness.

Document 16 handles fighting.

Set 27 handles economic action.

---

# 66. Vassalage and Protectorates

A polity may retain:

- internal government;
- culture;
- law;
- local citizenship

while yielding:

- foreign policy;
- tax/tribute obligation;
- military obligation;
- route control

according to treaty.

---

# 67. Liberation

Liberation may restore:

- government;
- territory;
- citizenship;
- property;
- faction rights.

It does not automatically restore:

- buildings;
- population;
- economy;
- relationships.

Those systems must recover separately.

---

# 68. Political Defeat Does Not Delete Culture

A faction can collapse.

A government can fall.

A settlement can be occupied.

The culture remains if people/institutions/history remain.

---

# 69. Migration

Document 07 owns the operational movement of persistent residents/households.

Document 13 owns political/cultural migration context:

- migrant status;
- refugee status;
- citizenship change;
- diaspora membership;
- asylum;
- colonisation;
- return rights;
- political consequence.

Set 30 executes physical travel.

---

# 70. Refugees and Displacement

A person may become displaced by:

- war;
- disaster;
- persecution;
- ecological collapse;
- economic failure;
- realm failure.

Document 13 records legal/political status.

Document 07 operates household/residence.

Set 28 handles social reactions.

---

# 71. Diaspora

Diaspora can preserve:

- culture;
- language;
- faith;
- family memory;
- trade network;
- political claim.

A diaspora can create:

- enclaves;
- hybrid cultures;
- return movements;
- transregional factions.

---

# 72. Assimilation

Assimilation can be:

- voluntary;
- partial;
- generational;
- pressured;
- forced.

It should not be a silent percentage bar erasing culture.

---

# 73. Cultural Destruction and Oppression

Systems involving:

- forced assimilation;
- slavery;
- collective punishment;
- displacement;
- cultural destruction;
- personhood denial;
- exploitative extraction

must be treated as serious political systems with:

- law;
- resistance;
- reputation/social consequence;
- refugees;
- faction response;
- historical memory;
- recovery.

They are not decorative flavour.

---

# 74. Colonisation

Cross-region/realm colonisation must consider:

- existing claims;
- native societies;
- ecology;
- treaties;
- supply;
- route;
- settlement adaptation;
- law;
- migration.

“Empty map space” does not guarantee unowned land.

---

# 75. Realm Civilisations

Document 14/24D owns realm topology and physical law.

Document 13 owns:

- realm political actors;
- realm-linked cultures;
- embassies;
- citizenship;
- diplomacy;
- route sovereignty;
- cross-realm settlement political status.

## 75.1 No Realm Biological Ownership

No ancestry owns a realm by biology.

Connection may arise from:

- history;
- adaptation;
- migration;
- faith;
- trade;
- conquest;
- treaty;
- diaspora;
- settlement infrastructure.

---

# 76. Realm Foundation Intake

24E includes civilisation hooks for all twelve 24D realm families:

- Verdant Covenant;
- Ancestral Veil;
- Somnolent Expanse;
- Aetheric Reach;
- Impossible Deep;
- World-Engine;
- Ashen Lower Realms;
- Void Between;
- Divine Concords;
- Necropolis Domains;
- Elemental Confluences;
- Created Pockets.

Document 13 does not convert these into ancestry homelands.

---

# 77. Route Sovereignty

Owning a portal/route may allow authority over:

- toll;
- inspection;
- passage;
- maintenance;
- closure.

It does not automatically confer sovereignty over destination.

---

# 78. Cross-Realm Citizenship

Possible statuses:

- foreign resident;
- dual-realm citizen;
- embassy resident;
- route worker;
- refugee;
- trader;
- diplomat;
- pilgrim;
- researcher.

---

# 79. Realm Embassies

Embassy status may include:

- protected enclave;
- diplomatic immunity;
- translation support;
- adapted environment;
- portal access;
- dual jurisdiction.

Document 13 owns political status.

Document 20/12 owns facility/structure.

---

# 80. Economy Boundary

Set 27 owns economy.

Document 13 supplies:

- recognised government;
- jurisdiction;
- legal actor;
- fiscal authority;
- customs authority;
- property regime;
- faction membership;
- treaty state;
- embargo authorisation;
- political stability;
- war state.

Set 27 supplies:

- currency;
- price;
- wages;
- market;
- contracts;
- tariffs;
- taxes;
- treasury;
- budgets;
- public finance.

---

# 81. Tax Authority Boundary

Document 13 may answer:

- who can levy;
- where;
- under which law;
- on whom;
- effective dates;
- legal exemptions.

Set 27G answers:

- tax base;
- rate;
- amount;
- assessment;
- collection;
- refund;
- treasury destination;
- public expenditure.

---

# 82. Tariff and Customs Boundary

Document 13:

- customs jurisdiction;
- authority;
- border law;
- prohibited categories.

Set 27:

- tariff;
- duty;
- fee;
- assessment;
- payment.

---

# 83. Economic Contracts

Set 27 owns economic contracts.

Document 13 may reference a contract when it has political status, e.g.:

- charter;
- concession;
- tribute;
- public procurement;
- treaty economic term.

It does not duplicate the monetary obligation.

---

# 84. Labour Law

Document 13 owns law defining:

- work eligibility;
- safety authority;
- collective bargaining recognition;
- compulsory service legality;
- labour restrictions.

Set 27 owns wages/compensation.

Document 07 owns jobs/work.

Set 28 owns willingness/social response.

Set 29 owns safety/biology.

---

# 85. Technology and Automation Attitudes

Culture/government/faction definitions may influence:

- legal acceptance;
- public funding;
- restricted use;
- cultural preference;
- education;
- military priority.

Document 08 owns machine truth.

A culture preference does not make a machine work differently without an explicit module.

---

# 86. Magic and Faith Law

Document 13 may define:

- permitted schools;
- restricted practices;
- licensing;
- sacred sites;
- forbidden ritual law;
- portal law.

Document 09 owns magic.

Set 28 owns belief/social interpretation.

---

# 87. Settlement Integration

Document 07 owns residents/jobs/households.

Document 19 owns settlement growth/planning.

Document 20 owns building/service function.

Document 13 owns:

- settlement citizenship regime;
- local government;
- political status;
- active law;
- faction presence;
- territorial affiliation.

---

# 88. Player-Founded Settlements

Player-founded settlements may develop:

- government;
- charter;
- law;
- citizenship;
- cultural identity;
- faction affiliations;
- diplomatic relationships.

Document 19 owns settlement creation/growth.

Document 13 owns resulting civilisation/political identity.

---

# 89. Emergent Player Culture

A player settlement can develop a distinct culture when:

- population is persistent;
- practices become stable;
- material/social identity differentiates;
- institutions exist;
- history accumulates.

It is not automatically “Player Culture” on founding day.

---

# 90. Culture and Building Packs

Document 20G owns building-pack composition.

Document 13 supplies:

- culture;
- faction;
- government;
- faith;
- historical state.

20G resolves:

- materials;
- blueprint pools;
- modules;
- architecture;
- presentation.

No ancestry directly selects architecture.

---

# 91. Historical Occupation Layers

A structure may retain:

- origin culture;
- current faction;
- current government;
- occupation overlay;
- restored/converted state.

Document 12 stores structure history/state.

Document 13 stores political identities.

---

# 92. Culture and Architecture

Culture can influence probability/preference for:

- material roles;
- public spaces;
- storage style;
- roads;
- defence;
- ritual spaces;
- machinery.

It does not grant hidden function.

---

# 93. Social System Boundary

Set 28 owns:

- Trust;
- Affection;
- Fear;
- Loyalty;
- Respect;
- Gratitude;
- Grievance;
- social reputation;
- dialogue;
- persuasion;
- negotiation;
- interpersonal marriage state;
- companion relationships;
- beliefs;
- rumours.

Document 13 owns:

- culture definition;
- faction membership;
- citizenship;
- law;
- government;
- territory;
- formal treaty;
- formal political status.

---

# 94. Social Reputation Versus Political Standing

Avoid one universal reputation number.

Set 28 may store:

- social reputation/perception.

Document 13 may store formal political standing such as:

- citizen;
- ally;
- treaty signatory;
- outlaw;
- officeholder;
- wanted legal status;
- recognised representative.

---

# 95. Diplomacy Interaction

Diplomacy is a two-layer system.

## Layer A — Social Process (Set 28)

- conversation;
- proposal;
- credibility;
- persuasion;
- relationship;
- etiquette;
- willingness.

## Layer B — Political Commit (Document 13)

- treaty;
- recognition;
- border;
- war state;
- political obligation;
- government state.

---

# 96. Information and Political Truth

Document 13 stores objective political world state.

Set 28C stores actor knowledge.

An NPC may incorrectly believe:

- a war ended;
- a king died;
- a border moved;
- a faction owns a town.

The world state remains authoritative.

---

# 97. Propaganda

Political entities may produce propaganda.

Document 13 can emit:

- source faction;
- political claim;
- desired narrative.

Set 28C resolves spread/belief.

---

# 98. Espionage

Document 13 owns:

- faction membership;
- office;
- classified political facts;
- diplomatic state.

Set 28 owns:

- deception;
- information acquisition;
- social infiltration.

Physical trespass belongs to movement/law/world systems.

---

# 99. Crime and Justice Boundary

Document 13 owns:

- laws;
- jurisdiction;
- offence classification;
- legal authority;
- sentence class;
- warrant status.

Set 28 owns:

- witnesses;
- social memory;
- belief.

Document 16 owns force.

Set 30 owns arrest/prison movement.

Set 27 owns fines/economic payment.

---

# 100. Fines

Document 13:

- law permits fine;
- offence class;
- court authority.

Set 27:

- amount;
- payment;
- debt;
- treasury.

---

# 101. Courts

Document 20 may provide court facility.

Document 13 owns:

- court jurisdiction;
- judicial office;
- law;
- legal decision state.

Set 28 may own testimony/negotiation/social process.

---

# 102. Military Political State

Document 13 owns:

- military faction identity;
- command authority;
- war status;
- mobilisation law;
- territorial objective.

Document 16 owns:

- units fighting;
- morale/combat;
- damage.

Set 30 moves units.

---

# 103. Surrender, Prisoners and Occupation Law

Document 13 owns legal/political status.

Document 16 resolves combat surrender.

Document 07 stores persistent persons.

Set 28 social consequences.

---

# 104. Political Succession

Succession may follow:

- election;
- heredity;
- appointment;
- council;
- guild selection;
- ritual confirmation;
- rotation;
- consensus.

Document 13 owns formal succession.

Set 28 may influence votes/relationships through social mechanics.

---

# 105. Office Vacancy

Vacancy can result from:

- death;
- resignation;
- removal;
- exile;
- term expiry;
- coup;
- disappearance.

Document 07 reports person lifecycle.

Document 13 starts succession.

---

# 106. Coups

A coup may involve:

- faction conspiracy;
- military support;
- office seizure;
- law suspension;
- recognition;
- resistance.

Document 13 owns political transition.

Other systems own social/combat/economic execution.

---

# 107. Elections

Document 13 owns:

- eligibility;
- office;
- electorate;
- rules;
- term;
- result commit.

Set 28 can influence voter social decisions where simulated.

No election outcome is inferred from culture stereotype.

---

# 108. Assemblies and Councils

Assemblies are governance institutions, not generic NPC dialogue circles.

They may require:

- members;
- quorum;
- agenda;
- authority;
- voting/consensus rule.

---

# 109. Public Policy

Political policy categories may include:

- migration;
- building;
- defence;
- magic;
- labour;
- trade authorisation;
- taxation authority;
- wildlife;
- public services.

Specialist systems implement exact effects.

---

# 110. Faction Transformation

Factions can:

- split;
- merge;
- federate;
- reform;
- radicalise;
- become government;
- lose government;
- become legal;
- become outlawed;
- demobilise;
- settle;
- dissolve.

History persists.

---

# 111. Faction Split

A split should preserve:

- members;
- assets;
- claims;
- leadership;
- grievances;
- treaties;
- history.

It cannot duplicate all assets.

---

# 112. Faction Merge

A merge must reconcile:

- membership;
- assets;
- offices;
- laws;
- treaties;
- names;
- claims.

Old IDs remain historical/deprecated references.

---

# 113. Government Collapse

A government may collapse while:

- settlements remain;
- people remain;
- culture remains;
- factions compete;
- services continue locally.

Political collapse is not world deletion.

---

# 114. State Formation

A new polity may form from:

- federation;
- independence;
- conquest;
- settlement league;
- revolution;
- colonial autonomy;
- crisis coalition.

---

# 115. Cultural Faction Versus Political Faction

A faction can claim to defend a culture.

That does not make it the sole owner/representative of that culture.

---

# 116. Minority and Mixed Populations

Settlements must support:

- cultural minorities;
- ancestry minorities;
- mixed households;
- multilingual residents;
- multiple faiths;
- non-citizen residents;
- refugees;
- diaspora.

---

# 117. Cultural Rights

Law may recognise:

- language rights;
- ritual rights;
- education rights;
- land/use rights;
- heritage protection;
- personhood rights.

These become political/legal state.

---

# 118. Representation Safeguards

Production content should not:

- represent one ancestry only as enemies;
- represent one ancestry only as labourers;
- equate body size with intelligence;
- equate technological style with civilisation worth;
- equate faith with morality;
- equate government with culture;
- equate culture with one personality.

---

# 119. Cultural Strengths and Trade-Offs

Cultures may have:

- strong institutions;
- specialised knowledge;
- environmental adaptations;
- trade networks;
- architecture.

These are authored capabilities/institutions, not universal stat bonuses to every member.

---

# 120. Player Origins

Player origin may include separate choices:

- ancestry;
- heritage;
- culture;
- citizenship;
- outsider status;
- language familiarity.

World settings may support:

- chosen;
- random;
- fixed campaign;
- discovered origin.

No origin should replace progression.

---

# 121. Starting Familiarity

An origin may grant modest:

- language;
- cultural knowledge;
- clothing familiarity;
- recipes;
- contacts;
- reputation context.

It does not grant every technology, spell or political office.

---

# 122. Transformation and Identity

If body/ancestry changes:

- person ID remains;
- culture remains unless changed separately;
- citizenship remains unless law reacts;
- faction remains unless changed;
- equipment may require adaptation;
- biological profile changes;
- movement profile changes.

---

# 123. Disguise

A disguise may alter perceived identity.

Document 13 owns true:

- membership;
- citizenship;
- office.

Set 28 owns perception/belief.

---

# 124. Titles

Titles may be:

- hereditary;
- elected;
- appointed;
- professional;
- religious;
- factional;
- honourary.

Title display must distinguish office from person identity.

---

# 125. Realm-Origin Identity

Realm origin may be:

- birthplace;
- heritage;
- citizenship;
- culture;
- migration history.

None implies biological ownership.

---

# 126. Historical Layers

Civilisations inherit:

- primordial;
- ancient;
- intermediate;
- recent;
- player-era history.

Document 13 consumes 24K history for political state.

---

# 127. Archaeology and Legitimacy

Archaeological evidence may support/challenge:

- borders;
- dynasties;
- sacred claims;
- settlement ownership;
- treaty history.

Set 28 owns whether actors believe evidence.

---

# 128. Competing Truth Claims

Two factions may claim the same:

- ruler;
- border;
- relic;
- historical event;
- ancestry narrative.

Document 13 stores competing claims.

Objective evidence remains separate.

---

# 129. Political History Record

```yaml
political_history_event:
  event_id: political_event:<ulid>
  event_type: <succession|treaty|war|occupation|secession|reform|migration>
  actor_refs: []
  settlement_refs: []
  territory_refs: []
  government_refs: []
  faction_refs: []
  prior_state_refs: []
  committed_state_refs: []
  evidence_refs: []
  world_time: <time>
  revision: <n>
```

---

# 130. World Generation Integration

Document 11/24E generates coherent society packages.

Generation inputs include:

- geography;
- climate;
- resources;
- routes;
- history;
- realm links;
- migrations;
- settlements;
- culture compatibility;
- government;
- faction budgets.

Document 13 instantiates runtime political records.

---

# 131. Procedural Society Coherence

Validation checks:

- population can physically inhabit settlement;
- culture fits environment or has adaptation/import;
- government has authority structure;
- faction has assets/members;
- economy has physical routes/resources;
- history explains contradictions;
- progression access is not dead-ended.

---

# 132. No Unrestricted Random Mixing

A seed cannot randomly combine:

- desert architecture;
- underwater settlement;
- incompatible body profiles;
- zero water;
- glacial farming;
- no adaptation

without an explanation.

---

# 133. Society Generation Profile

```yaml
society_generation_profile:
  profile_id: society_generation:<id>
  allowed_ancestry_refs: []
  diversity_range: <range>
  culture_refs: []
  language_refs: []
  faith_refs: []
  government_profile_refs: []
  faction_archetype_budget: <value>
  settlement_profile_refs: []
  economy_context_refs: []
  realm_context_refs: []
  history_grammar_refs: []
  compatibility_rules: []
  fallback_rules: []
```

---

# 134. Political Relationships

Formal political relationship records may store:

- recognition;
- war/peace;
- alliance;
- treaty;
- border dispute;
- vassalage;
- protectorate;
- sanctions authorisation;
- access.

Do not store Set 28 Trust here.

---

# 135. Social Relationship Aggregates

If Set 28 exposes faction-facing social sentiment summaries, Document 13 may consume them as political inputs.

They do not become political truth automatically.

High resentment may create a revolt condition, but Document 13 commits the actual revolt/faction creation through valid rules.

---

# 136. Faction Reputation Boundary

Set 28 owns social reputation.

Document 13 owns formal status.

Example:

The player may have:

- high personal reputation with miners;
- low social reputation with a merchant faction;
- formal citizenship in the city;
- legal outlaw status in another kingdom;
- military alliance with a third faction.

---

# 137. Political AI / Strategic Planning

Faction/government planners may propose:

- law;
- treaty;
- war;
- settlement project;
- alliance;
- appointment;
- mobilisation;
- migration policy.

Every proposal must be validated by authoritative systems.

---

# 138. Future AI Boundary

A future bounded AI may produce political reasoning/dialogue proposals.

It cannot:

- invent a treaty;
- move a border;
- create citizens;
- spend treasury;
- declare war

without authoritative commands.

---

# 139. Civilisation Simulation LOD

### C0 — Local Detailed

- persistent leaders/people;
- active offices;
- local law;
- faction presence;
- social negotiation;
- physical meetings where needed.

### C1 — Settlement Political State

- government;
- citizenship;
- local factions;
- law;
- claims;
- elections/succession;
- key relationships.

### C2 — Regional Political Summary

- territories;
- major factions;
- settlements;
- treaties;
- war;
- migration;
- key leaders.

### C3 — Realm / World Strategic Summary

- major polities;
- cross-realm treaties;
- long wars;
- alliances;
- diaspora;
- route sovereignty.

### C4 — Dormant Historical State

- stable identity;
- next scheduled political milestones;
- no per-frame simulation.

---

# 140. LOD Invariants

Distance cannot change:

- citizenship;
- government;
- faction membership;
- treaty;
- war;
- territory;
- leadership;
- law;
- political history;
- culture.

---

# 141. Distant Political Catch-Up

Catch-up may resolve:

- election;
- succession;
- treaty expiry;
- faction split;
- migration;
- war milestone;
- occupation;
- law change;
- recognition.

It must preserve:

- resources;
- people;
- authority;
- actual routes;
- economy;
- combat outcomes.

---

# 142. No Off-Screen Political Magic

Distant simulation cannot say:

> “Faction A conquered City B because time passed.”

It needs authoritative evidence such as:

- conflict outcome;
- surrender;
- occupation;
- government transition.

---

# 143. Persistence

Persist:

- identity memberships;
- government instances;
- laws;
- jurisdictions;
- citizenship;
- faction instances;
- faction membership;
- offices;
- territories;
- claims;
- treaties;
- war state;
- occupation;
- political history;
- culture transitions;
- diaspora;
- legitimacy/recognition;
- LOD;
- schema/version.

---

# 144. Save Safety

A save must not produce:

- person in contradictory exclusive citizenship states without legal explanation;
- same office held twice where single-holder;
- dead leader still in office without succession rule;
- faction dissolved but owning active assets without transition;
- settlement simultaneously sovereign to incompatible exclusive governments;
- treaty referencing deleted faction;
- territory owner missing;
- culture deleted on faction defeat.

---

# 145. Multiplayer Authority

Host/server owns:

- political membership;
- office;
- law;
- citizenship;
- government;
- faction state;
- treaty;
- war;
- territory;
- claim;
- political change.

Clients request actions through authorised interfaces.

---

# 146. Multiplayer Diplomacy

A multiplayer party may have:

- individual social reputations;
- different citizenship;
- different faction membership.

Political authority to sign treaty must be explicit.

One player cannot sign for a faction just because another player is its leader.

---

# 147. UI / Knowledge Boundary

Document 17 owns presentation.

Set 28C owns known/believed political information.

Document 13 exposes authoritative views filtered by access.

Normal players should not automatically see:

- secret faction membership;
- hidden treaty terms;
- undiscovered borders;
- classified claims;
- spy status.

---

# 148. Culture Presentation

World-first presentation may use:

- architecture;
- clothing;
- food;
- tools;
- music;
- signage;
- language;
- public rituals;
- banners;
- roads;
- markets.

Presentation must not turn one motif into a stereotype.

---

# 149. Government Presentation

Government can be visible through:

- assembly hall;
- court;
- notices;
- officials;
- voting;
- heraldry;
- checkpoints;
- records.

Document 20/12 supplies physical structures.

---

# 150. Faction Presentation

Faction identity may use:

- banner;
- clothing accents;
- equipment;
- signs;
- structure overlays;
- patrols;
- documents.

Visual faction colour does not imply culture.

---

# 151. Forge Integration

Forge may author:

- ancestry rigs/body profiles;
- clothing;
- cultural materials;
- banners;
- signs;
- architecture packs;
- government modules;
- faction overlays;
- realm adaptation.

Gameplay identity remains Document 13/24E.

---

# 152. Document 20G Building-Pack Integration

Composition order can include:

`universal function → Blueprint source → culture → regional/subculture → biome → faction/government/faith/economy → realm → history/state → approved settlement/player override → deterministic detail`

Document 13 supplies the identity inputs.

---

# 153. Culture Pack Rule

Architecture follows:

- culture;
- environment;
- economy;
- government;
- faith;
- technology;
- history.

Not ancestry.

---

# 154. Settlement Political Status

Possible statuses:

- autonomous;
- incorporated;
- capital;
- occupied;
- vassal;
- protectorate;
- colony;
- enclave;
- embassy;
- disputed;
- independent.

---

# 155. Settlement Scale Is Not Political Rank

A village can be independent.

A city can be subordinate.

A capital is a political status, not simply size.

---

# 156. Mobile Settlements

Caravan/fleet settlements can have:

- citizenship;
- government;
- territory/use rights;
- faction;
- law.

Set 30/26 handles physical movement.

---

# 157. Maritime Civilisations

Set 26 adds:

- ports;
- crews;
- navies;
- piracy;
- marine trade;
- maritime settlements.

Document 13 owns:

- maritime faction identity;
- naval political authority;
- port jurisdiction;
- citizenship;
- maritime law hook;
- diplomatic status.

Set 26 owns maritime execution.

---

# 158. Pirate Personhood / Faction Rule

Piracy is faction/economic/legal activity.

A “pirate ancestry” is invalid as a moral category.

---

# 159. Crews

Crew operational roles belong to Set 26/07.

Crew faction/citizenship membership belongs to Document 13.

Social loyalty belongs to Set 28.

---

# 160. Political Economy Without Duplication

A merchant league may politically control a port.

Document 13 owns:

- league faction;
- political office;
- legal authority.

Set 27 owns:

- market;
- contracts;
- prices;
- treasury.

---

# 161. Political Resources

Factions may have political assets referencing:

- settlements;
- structures;
- warehouses;
- fleets;
- armies;
- routes;
- relics;
- treasury;
- knowledge.

The actual asset remains owned by its system.

---

# 162. Asset References

Document 13 does not duplicate:

- warehouse stock;
- ship;
- army member;
- structure.

It stores `asset_ref`.

---

# 163. Faction Supply

A faction cannot fight or govern indefinitely without physical resources where required.

Set 27/07/08/26 supply logistics.

Document 13 strategic state consumes them.

---

# 164. Embargo

Document 13 may authorise political embargo.

Set 27 executes market/trade restrictions.

Set 30/26 physical route still exists unless closed.

---

# 165. Blockade

A blockade is physical/military.

Document 16/26 executes.

Document 13 stores political blockade objective/status.

---

# 166. Language Policy

Government may define:

- official language;
- court language;
- translation requirement;
- minority-language rights.

Set 28 resolves communication.

---

# 167. Faith Policy

Government may:

- recognise several faiths;
- protect secularism;
- grant temple status;
- restrict dangerous rituals.

Document 09 owns magical practices.

---

# 168. Personhood Law

Jurisdictions may dispute personhood.

The production system can represent such conflict without the engine itself treating a recognised sapient entity as livestock.

Core gameplay authority must preserve safety against systemic de-personing bugs.

---

# 169. Rights and Restrictions

Legal rights may include:

- property;
- vote;
- office;
- movement;
- trial;
- contract;
- worship;
- education;
- personhood recognition.

Specialist systems consume rights.

---

# 170. Discrimination and Prejudice

Where authored, discriminatory laws/social attitudes are contextual political/social states.

They are not encoded as natural ancestry hostility.

Document 13 owns discriminatory law/policy.

Set 28 owns social prejudice/reaction.

---

# 171. Crime Factions

Bandits/smugglers may operate:

- within culture;
- across ancestries;
- inside government corruption;
- across borders.

Crime is organisational activity.

---

# 172. Secret Factions

Secret membership remains authoritative but hidden.

Set 28C controls who knows.

---

# 173. Intelligence and Espionage Organisations

Document 13 can define faction office/membership.

Set 28 handles information/social methods.

No global omniscient spy network.

---

# 174. Political Promises

Set 28 may record social promise.

A formal political promise becomes a treaty/charter only when Document 13 commits it.

---

# 175. Political Charters

Charters may create:

- settlement;
- guild;
- company;
- rights;
- office;
- fiscal authority;
- route rights.

Economic obligations reference Set 27.

---

# 176. Public Authority

Set 27G requires recognised public authority from governance.

Document 13 exposes:

- public authority identity;
- jurisdiction;
- fiscal powers;
- effective dates.

---

# 177. Faction Legal Status

Faction may be:

- recognised;
- chartered;
- tolerated;
- illegal;
- outlawed;
- insurgent;
- government.

Legal status differs by jurisdiction.

---

# 178. Military Authority

Faction member does not automatically have permission to command military.

Office/role grants authority.

---

# 179. Diplomatic Authority

A person needs:

- office;
- delegation;
- mandate

to bind a government/faction.

---

# 180. Emergency Authority

Government profiles may allow:

- temporary powers;
- disaster authority;
- wartime power.

Expiry/review must be explicit.

---

# 181. Internal Autonomy

A polity may contain:

- autonomous towns;
- clan territories;
- guild jurisdictions;
- faith enclaves;
- realm embassies.

---

# 182. Federal Systems

Federations require:

- member polity IDs;
- delegated powers;
- shared services;
- secession rules;
- common law scope.

---

# 183. Confederacies

Confederacies can preserve more local sovereignty.

They are not simply “weak kingdoms.”

---

# 184. Customary Networks

Government may be distributed through:

- household;
- route;
- precedent;
- reciprocal obligation

without a permanent central state.

Document 13 must not require a castle/king for political validity.

---

# 185. Machine Consensus

Awakened constructs may use:

- auditable proposals;
- consensus thresholds;
- civic protocols.

This is government profile, not ancestry destiny.

---

# 186. Ancestor Mandate

Ancestor consultation may influence government.

Document 09 may provide genuine spirit/magic capability.

Set 28 belief/interpretation remains separate.

---

# 187. Contract Principality

Contract-based government may reference Set 27 obligations.

Document 13 owns the political charter/office.

Set 27 owns financial contract execution.

---

# 188. Government Failure Modes

Profiles include pressures such as:

- corruption;
- exclusion;
- emergency-power abuse;
- secession;
- monopoly;
- succession dispute;
- participation inequality.

Failure is generated/history-driven, not inevitable stereotype.

---

# 189. Political Events

Document 15 owns formal event/quest lifecycle.

Document 13 emits conditions:

- election due;
- succession crisis;
- treaty breach;
- rebellion;
- disputed border;
- refugee crisis;
- coup;
- annexation;
- reform.

---

# 190. Quest Integration

Quests may involve:

- citizenship;
- diplomacy;
- reform;
- succession;
- law;
- recognition;
- historical evidence;
- faction change.

Document 15 owns objectives.

---

# 191. Combat Integration

Document 13 supplies:

- belligerent faction;
- war state;
- legal/command status;
- target political context.

Document 16 resolves fighting.

---

# 192. Movement Integration

Document 13 supplies:

- border law;
- permit;
- access status;
- jurisdiction.

Set 30 supplies:

- route;
- travel;
- actual crossing.

Legal permission does not guarantee physical feasibility.

---

# 193. Biology Integration

Ancestry/personhood definitions may reference Biological Profiles.

Set 29 resolves physical survival.

Culture cannot make members immune to biology unless a real capability exists.

---

# 194. Creature Integration

Document 10 requires personhood separation.

Document 13 handles recognised intelligent peoples.

A hostile goblin faction is a political actor.

A wild wolf pack is ecology.

---

# 195. Automation Integration

Culture/faction/government may define:

- legal access;
- ownership;
- labour politics;
- public infrastructure.

Document 08 owns machine operation.

---

# 196. Magic Integration

Culture/faith/government may define:

- tradition;
- institutions;
- law;
- social meaning.

Document 09 owns spell/mana truth.

---

# 197. Structure Integration

Document 12 stores:

- owner;
- occupier;
- historical origin.

Document 13 provides:

- government;
- faction;
- legal claim;
- territory.

---

# 198. Realm Integration

Document 14/24D provides:

- realm;
- routes;
- laws of physics.

Document 13 provides:

- realm polities;
- citizenship;
- diplomatic state;
- settlements' political relationship.

---

# 199. Content Completeness

A civilisation entry is not production-ready because it has lore.

24E requires relationship completeness.

## 199.1 Ancestry Completeness

Requires:

- body;
- movement/senses refs;
- heritage;
- equipment/building fit;
- presentation;
- several cultural examples;
- no moral lock.

## 199.2 Culture Completeness

Requires:

- variants;
- language;
- food;
- clothing;
- craft;
- art;
- faith;
- governance;
- economy;
- settlement;
- magic/technology attitudes;
- internal factions;
- neighbours;
- diaspora;
- change states.

## 199.3 Faction Completeness

Requires:

- leadership;
- membership;
- territory;
- assets;
- objectives;
- methods;
- blocs;
- allies/rivals;
- diplomacy;
- succession;
- defeat outcome.

---

# 200. Production Scope Discipline

A smaller coherent roster is preferable to incomplete hundreds of identities.

Counts in 24E are foundations.

Actual shipping availability depends on:

- rigs;
- equipment;
- animation;
- settlement packs;
- dialogue;
- localisation;
- economy;
- simulation;
- accessibility;
- QA.

---

# 201. Stable IDs

Examples from 24E:

- `ancestry.goblin`
- `ancestry.construct.awakened`
- `culture.deepstone.compacts`
- `government.cooperative_federation`
- `faction.generated.<world_seed_token>.<instance_token>`
- `settlement.generated.<realm_token>.<region_token>.<instance_token>`

Display names can change without breaking identity.

---

# 202. Runtime Political IDs

Use generated stable IDs for:

- government instances;
- faction instances;
- treaties;
- claims;
- offices;
- citizenship records;
- laws;
- political events.

---

# 203. Definition Versus Instance

`faction.raider_clan` is an archetype.

`faction.generated.world7.BK92` is one actual faction.

Do not edit the archetype because one generated faction reforms.

---

# 204. Cultural Instance / Branch

A generated regional cultural branch may have:

- parent culture ref;
- region;
- variation modifiers;
- migration history;
- local vocabulary;
- hybrid influences.

---

# 205. Law Definition Versus Active Law

Reusable law definition:

- what rule means.

Active law instance:

- jurisdiction;
- authority;
- effective date;
- exemptions;
- status.

---

# 206. Membership Edge

```yaml
political_membership:
  membership_id: membership:<ulid>
  person_or_actor_ref: <id>
  organisation_ref: <id>
  membership_type: citizen
  public_visibility: public
  start_world_time: <time>
  end_world_time: null
  authority_source_ref: <id>
  legal_status_refs: []
  role_refs: []
  revision: <n>
```

---

# 207. Territory Claim

```yaml
territory_claim:
  claim_id: territory_claim:<ulid>
  claimant_ref: <government|faction|settlement>
  spatial_ref: <area_or_route>
  claim_type: sovereignty
  legal_basis_refs: []
  history_refs: []
  treaty_refs: []
  effective_control_band: <band>
  disputed_by_refs: []
  status: active
  revision: <n>
```

---

# 208. Law Instance

```yaml
active_law:
  law_instance_id: law:<ulid>
  definition_ref: law_definition:<id>
  jurisdiction_ref: <id>
  enacted_by_ref: <authority>
  effective_world_time: <time>
  expiry_world_time: null
  subject_filters: []
  exemptions: []
  specialist_policy_refs: []
  status: active
  revision: <n>
```

---

# 209. Political Relationship Record

```yaml
political_relationship:
  relationship_id: political_relationship:<ulid>
  actor_a_ref: <government_or_faction>
  actor_b_ref: <government_or_faction>
  recognition_state: recognised
  formal_state: peace
  active_treaty_refs: []
  dispute_refs: []
  war_ref: null
  access_policy_refs: []
  economic_policy_refs: []
  movement_policy_refs: []
  last_changed_world_time: <time>
  revision: <n>
```

No Trust/Affection fields belong here.

---

# 210. Civilisation Diagnostics

Recommended reason codes:

| Code | Meaning |
|---|---|
| `CIV-ID-001` | Missing/invalid civilisation identity. |
| `CIV-ANC-001` | Ancestry/personhood definition conflict. |
| `CIV-PERS-001` | Recognised person routed through non-person system. |
| `CIV-CULT-001` | Culture membership/definition invalid. |
| `CIV-LANG-001` | Language ref/competency invalid. |
| `CIV-FAITH-001` | Faith affiliation invalid. |
| `CIV-GOV-001` | Government instance/profile invalid. |
| `CIV-OFF-001` | Political office/authority invalid. |
| `CIV-LAW-001` | Law/jurisdiction invalid. |
| `CIV-CIT-001` | Citizenship/legal-status invalid. |
| `CIV-FAC-001` | Faction instance invalid. |
| `CIV-MEM-001` | Membership edge invalid. |
| `CIV-TERR-001` | Territory claim invalid. |
| `CIV-TREATY-001` | Treaty/signatory authority invalid. |
| `CIV-WAR-001` | War-state transition invalid. |
| `CIV-OCC-001` | Occupation/sovereignty state conflict. |
| `CIV-MIG-001` | Migration/political status invalid. |
| `CIV-REALM-001` | Realm political relationship invalid. |
| `CIV-ECON-001` | Economic state duplicated instead of Set-27 ref. |
| `CIV-SOC-001` | Social state duplicated instead of Set-28 ref. |
| `CIV-BIO-001` | Biological runtime duplicated instead of Set-29 ref. |
| `CIV-MOVE-001` | Movement state duplicated instead of Set-30 ref. |
| `CIV-SAVE-001` | Persistence/migration inconsistency. |
| `CIV-AUTH-001` | Unauthorised political mutation. |
| `CIV-POC-001` | Retired POC identity detected in production generation. |

---

# 211. Validation Rules

## 211.1 Identity Separation

Fail if:

- culture inferred solely from ancestry;
- faction inferred solely from ancestry;
- morality inferred from ancestry;
- realm inferred solely from ancestry;
- government inferred solely from ancestry.

## 211.2 Personhood

Fail if a recognised person is:

- normal livestock;
- animal loot source;
- ordinary tameable pet;
- monster merely due to hostility.

## 211.3 Government

Validate:

- profile;
- office;
- authority;
- jurisdiction;
- law;
- succession.

## 211.4 Faction

Validate:

- members;
- leadership;
- assets;
- goals;
- history;
- transformations.

## 211.5 Treaty

Validate:

- signatories;
- authority;
- terms;
- effective date;
- referenced economic/movement systems.

---

# 212. Representation Validation

Seed/content testing should verify:

- each foundation ancestry can appear in several social roles;
- ancestry does not correlate overwhelmingly with hostility without authored world-history reason;
- cultures contain variation;
- settlements can be mixed;
- multiple governments can use same culture;
- factions can cross ancestry/culture boundaries;
- realm societies are mixed/native/migrant where valid.

---

# 213. Production Seed Testing

Test:

- government diversity;
- culture diversity;
- settlement political status;
- migration;
- faction density;
- conflict;
- diplomacy;
- route sovereignty;
- realm embassies;
- progression access;
- save persistence.

---

# 214. POC Leakage Scan

Fail production generation if it contains:

- Forest Hamlet Council;
- Briarhook Clan;
- Regional March Authority;
- fixed POC residents;
- fixed Riverward opening culture;
- fixed POC political relationships;
- fixed goblin hostility rule;
- fixed watchtower-raid political chain.

Archive/test namespaces are allowed.

---

# 215. POC Preservation

The POC remains an Archived Validation fixture.

It may test:

- mixed settlement;
- ancestry/culture separation;
- local council;
- raider faction;
- reputation/social reaction;
- warehouse permission;
- watchtower ownership;
- raid;
- surrender;
- faction hostility;
- regional authority reference.

The names are not production content dependencies.

---

# 216. POC Migration

| Legacy POC Element | Production Treatment |
|---|---|
| Riverward Frontier culture | Archive fixture; generic culture-family mechanics survive. |
| Forest Hamlet Council | Archive faction/government fixture. |
| Briarhook goblin raiders | Archive raider-faction fixture; Goblins remain ancestry-independent persons. |
| Regional March Authority | Archive regional-governance fixture. |
| Fixed mostly-human population | Replaced by seed-generated demographics. |
| Fixed individual Trust | Social runtime moved to Set 28. |
| Fixed faction hostility | Replaced by political/social relationship state. |
| Fixed watchtower political outcome | Generic defence/faction/event integration survives. |

---

# 217. Migration from v0.1 Broad Ownership

Legacy fields must move to modern owners where necessary.

## 217.1 Reputation

Detailed social reputation → Set 28.

Formal citizenship/legal/political status → Document 13.

## 217.2 Economy

Prices/taxes/contracts/finance → Set 27.

Law authorising them → Document 13.

## 217.3 Movement

Travel/path → Set 30/26.

Border permission → Document 13.

## 217.4 Biology

Runtime ancestry physiology → Set 29.

Ancestry definition/body profile reference → Document 13/24E.

---

# 218. Existing-Save Migration

Migration should preserve:

- person ID;
- ancestry;
- culture;
- membership;
- government;
- settlement;
- claims;
- treaties;
- history.

Do not reset society to new generated default.

---

# 219. Culture Rename

Culture display-name change:

- keep stable ID;
- update localisation;
- preserve membership.

---

# 220. Faction Split Migration

Old faction remains historical parent.

Assets/members transfer explicitly.

---

# 221. Removed Definition

If a content pack removes a definition:

- alias;
- deprecate;
- freeze instance;
- fallback;
- quarantine.

Do not delete living people.

---

# 222. Godot / Summer Engine Direction

Document 18 v1.0 will own exact implementation.

Document 13 requires eventual services such as:

- CivilisationDefinitionRegistry;
- IdentityMembershipService;
- GovernmentService;
- LawService;
- CitizenshipService;
- FactionService;
- PoliticalRelationshipService;
- TreatyService;
- TerritoryClaimService;
- SuccessionService;
- CivilisationLODService;
- CivilisationMigrationService;
- CivilisationValidationService.

Names are illustrative.

---

# 223. Performance

Political simulation can scale through:

- sparse relationship graph;
- regional summaries;
- scheduled elections;
- event-driven law changes;
- bounded strategic ticks;
- protected important actors;
- LOD.

Do not simulate every distant council conversation.

---

# 224. Low-End Settings

Low-end modes may reduce:

- faction strategic tick frequency;
- minor political event frequency;
- background office meetings;
- ambient political dialogue;
- visible crowds.

They must not erase:

- government;
- law;
- citizenship;
- territory;
- treaty;
- war;
- history.

---

# 225. Accessibility

Civilisation UI should provide:

- clear terminology;
- icons + text;
- distinguish ancestry/culture/faction;
- readable legal status;
- treaty summaries;
- permission explanations;
- no colour-only borders;
- glossary.

---

# 226. Knowledge-Aware UI

Players should see:

- “Unknown faction”
- “Claim disputed”
- “Reported border”
- “Rumoured alliance”

when Set 28C does not provide certainty.

The UI should not leak server truth.

---

# 227. Player Freedom

Players may:

- remain outsider;
- become citizen;
- join factions;
- found faction;
- negotiate;
- trade;
- reform;
- rebel;
- rule;
- conquer;
- liberate;
- migrate;
- create hybrid settlement culture.

No one political path is mandatory.

---

# 228. Political Failure Is Playable

A faction can lose.

A city can revolt.

A government can collapse.

The player can rebuild or leave.

Failure should create world history rather than force reload.

---

# 229. No Good/Evil Meter

Morality emerges through:

- actions;
- law;
- beliefs;
- faction response;
- social memory;
- world consequence.

Document 13 does not reduce politics to one alignment number.

---

# 230. Production Acceptance Criteria

Document 13 v1.0 is accepted when:

- [x] ancestry, culture, faction, settlement, faith, language, government and citizenship are separate;
- [x] 24E remains authored content authority;
- [x] 12 ancestry/personhood families are referenced, not duplicated as runtime content copies;
- [x] 20 culture families remain authored Atlas foundations;
- [x] 14 government profiles remain reusable Atlas definitions;
- [x] 24 faction archetypes remain reusable Atlas definitions;
- [x] 30 settlement archetypes remain Atlas definitions;
- [x] no realm is biologically owned by one ancestry;
- [x] hostility never implies ancestry morality;
- [x] personhood protection is explicit;
- [x] Document 07 retains person/household/job operation;
- [x] Set 28 owns social relationships, beliefs and negotiation process;
- [x] Set 27 owns prices, taxes, tariffs, contracts and public finance execution;
- [x] Set 29 owns runtime biology;
- [x] Set 30/26 owns movement;
- [x] Document 16 owns combat;
- [x] Document 13 owns political state commit;
- [x] governments and factions are distinct;
- [x] membership and loyalty are distinct;
- [x] ownership and occupation are distinct;
- [x] claims and effective control are distinct;
- [x] political defeat cannot delete culture;
- [x] mixed settlements, migration and diaspora are supported;
- [x] POC political identities are archive-only;
- [x] Godot/Summer direction is current.

---

# Appendix A — Identity Layer Quick Reference

| Layer | Meaning | Owner |
|---|---|---|
| Person Instance | The persistent individual | Document 07 |
| Ancestry | Body/personhood family | 24E / Document 13 runtime ref |
| Heritage | Inherited/regional/transformed variation | 24E / Document 13 |
| Culture | Learned social identity | 24E / Document 13 |
| Language | Communication system definition | Document 13; Set 28C runtime information transfer |
| Faith | Tradition/affiliation | Document 13; Set 28 belief |
| Household | Co-residence/operational household | Document 07 |
| Citizenship | Legal belonging | Document 13 |
| Faction | Organised membership/goals | Document 13 |
| Government | Formal authority structure | Document 13 |
| Law | Active legal rule/jurisdiction | Document 13 |
| Profession | Ordinary job/work | Document 07 |
| Social relationship | Trust/Affection/Loyalty etc. | Set 28 |
| Economic contract | Economic obligation | Set 27 |
| Territory claim | Political claim | Document 13 |
| Movement | Physical execution | Set 30 / 26 |
| Biology | Runtime body state | Set 29 |

---

# Appendix B — Culture Foundation IDs

```text
culture.hearthland.commons
culture.marchroad.leagues
culture.emberhold.concords
culture.moonroot.courts
culture.brassroot.communes
culture.stormsteppe.confederacies
culture.tidesong.clans
culture.cloudward.freeholds
culture.deepstone.compacts
culture.saltglass.caravan_cities
culture.mirelight.covenants
culture.frosthearth.circles
culture.verdant.pact_enclaves
culture.veilkeeper.houses
culture.dreamweaver.cantons
culture.engine_civic.assemblies
culture.ashbound.contract_cities
culture.reefgarden.communes
culture.starfall.scholarates
culture.wayfarer.mosaics
```

---

# Appendix C — Government Foundation IDs

```text
government.communal_council
government.direct_assembly
government.constitutional_monarchy
government.central_monarchy
government.guild_oligarchy
government.clan_confederacy
government.civic_republic
government.plural_temple_compact
government.frontier_march
government.cooperative_federation
government.machine_consensus
government.ancestor_mandate
government.contract_principality
government.customary_network
```

---

# Appendix D — Faction Archetype IDs

```text
faction.local_council
faction.crown_administration
faction.confederacy
faction.merchant_league
faction.craft_guild
faction.mage_order
faction.faith_network
faction.ancestor_house
faction.military_order
faction.frontier_company
faction.caravan_federation
faction.portal_authority
faction.research_consortium
faction.personhood_league
faction.labour_union
faction.rebel_movement
faction.raider_clan
faction.bandit_syndicate
faction.pirate_flotilla
faction.smuggler_network
faction.forbidden_order
faction.ancient_remnant
faction.realm_embassy
faction.crisis_coalition
```

---

# Appendix E — Ancestry Foundation IDs

```text
ancestry.human
ancestry.goblin
ancestry.dwarf
ancestry.orc
ancestry.elf.kindred
ancestry.construct.awakened
ancestry.tidekin
ancestry.aerai
ancestry.mycelian
ancestry.emberkin
ancestry.rootborn
ancestry.veilborn
```

---

# Appendix F — Political Commit Pattern

A political state change follows:

**Proposal / Trigger**  
→ **Authority Check**  
→ **World-Fact Check**  
→ **Social Resolution if Required (Set 28)**  
→ **Economic Feasibility if Required (Set 27)**  
→ **Physical Feasibility if Required (Set 30/26)**  
→ **Political Commit (Document 13)**  
→ **Evidence/Event**  
→ **Specialist Consequences**

Examples:

### Treaty

proposal → negotiation → authorised signatures → treaty commit → economic/movement terms activate.

### War

political trigger → authority → declaration/war state → mobilisation → actual movement/combat.

### Citizenship

application/eligibility → social/legal process → authority decision → citizenship record.

### Annexation

military/political outcome → effective control → authority/treaty → territory/government state.

---

# Appendix G — Cross-System Responsibility Examples

## G.1 Merchant Faction Raises Toll

Document 13:
- faction controls toll gate;
- law authorises toll.

Set 27:
- determines toll amount and collection.

Set 30:
- determines whether traveller physically uses that route.

Set 28:
- determines social reaction/negotiation.

## G.2 Goblin Raider Surrenders

Document 16:
- combat surrender succeeds.

Set 28:
- negotiation/social acceptance.

Document 13:
- raider-faction political status changes.

Document 07:
- persistent goblin persons remain.

## G.3 Healing Discriminatory Law

Document 13:
- law restricts care eligibility.

Document 20/29:
- facility/treatment capability.

Set 28:
- social consequences.

The biological system does not encode ancestry discrimination itself.

---

# Appendix H — Definition of Done for Implemented Civilisation Identity Foundation

The implemented Document 13 system is not complete because NPCs have a `race` field and factions have colours.

Production proof requires:

- one person can hold multiple independent identity memberships;
- changing faction does not change ancestry;
- changing citizenship does not change culture;
- changing government does not respawn population;
- goblin factions can be friendly, neutral, hostile or mixed;
- human factions can be hostile;
- awakened constructs can be citizens;
- multiple cultures can share a government;
- one culture can exist under several governments;
- political membership and personal loyalty are separate;
- social Trust is not stored in political relationship records;
- tax authority and Set-27 tax calculation are separate;
- border permission and Set-30 movement are separate;
- formal treaties are committed only by authorised actors;
- war state persists;
- occupation and sovereignty can differ;
- defeated factions leave survivors/history;
- diaspora survives territory loss;
- cultures can hybridise over time;
- realm settlement identity does not imply biological realm ownership;
- POC identities never appear in normal generated worlds;
- save/load preserves governments, treaties, membership and claims;
- LOD does not rewrite political truth;
- UI can distinguish known information from hidden political truth.

---

# Completion Statement

**Document 13 v1.0 reconciles Leyforge's original ancestry/culture/faction vision with the production World Content Atlas and the final post-Atlas economy, social, biology and movement ownership model.**

The original design's most important insight survives unchanged:

**A goblin raider is a member of a hostile faction, not proof that goblins are hostile. A human kingdom is one government, not the definition of humanity.**

The production architecture now takes that principle much further.

Leyforge separates:

**body → heritage → culture → language → faith → household → settlement → citizenship → government → faction → profession → social relationship → political loyalty → realm history**

into interoperable records.

24E provides the authored civilisation foundations.

Document 13 owns the formal runtime identity and political state.

Set 28 owns social interaction and belief.

Set 27 owns economic value and public finance.

Set 29 owns biological runtime.

Set 30/26 owns physical movement.

The result is a world where civilisations can migrate, mix, split, reform, conquer, resist, hybridise, lose territory, rebuild and create new political identities without reducing entire peoples to colour-coded enemy teams or biologically predetermined societies.

**Next foundation reconciliation dependency: Document 14 — Dimensions, Realms, Realm Travel and Interdimensional World System v1.0.**
