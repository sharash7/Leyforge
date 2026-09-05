# Leyforge Final Content Canon Collection

## FCC-05H — Ascendant Reach Dungeons, Guardians, Authorities, Pilgrim Star, Events & Major Outcomes

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ascendant Reach  
**Stable Realm ID:** `realm.major.ascendant_reach`  
**Legacy Realm Aliases:** `realm.major.aetheric_reach`; `realm.network.divine_concords`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Depends On:** FCC-05A through FCC-05G  
**Primary Upstream Sources Reconciled:** World Content Atlas Set 24, especially 24D Dimensions/Realm Atlas, 24F Wildlife/Ecology Atlas and 24H Bosses/Titans/Realm Guardians Atlas; accepted FCC-05 decisions Q513–Q554 with related realm-local decisions through Q583.  
**Primary Scope:** eight canonical dungeon families; Trial Domain framework; Abandoned Sanctuary state; eight dungeon guardian families; five fixed realm authorities; Pilgrim Star roaming variable authority/event foundation; variable boss/authority foundations; deterministic dungeon grammar; non-combat and combat resolution; authority aftermath; realm-event families; reward provenance; blessing/relic reward boundaries; site persistence; seed placement; accessibility; simulation scaling; stable-ID migration.  
**Final Global Status:** Pending final cross-realm reconciliation through FCC-12, FCC-13 and FCC-14.

---

# 1. Purpose

FCC-05H defines the complete realm-local **adventure, dungeon, guardian, authority, major-event and persistent-outcome canon** of the Ascendant Reach.

It owns Ascendant definitions for:

- exactly eight canonical dungeon families;
- the reusable Trial Domain framework;
- the Abandoned Sanctuary domain/dungeon state;
- exactly eight canonical dungeon guardian roles;
- exactly five fixed realm authorities;
- the Pilgrim Star roaming variable authority/event foundation;
- variable regional boss, political boss, divine-authority and crisis foundations;
- dungeon world roles and realm-specific mechanic requirements;
- guardian encounter roles;
- fixed-authority identity and world function;
- authority resolution families;
- world-scale and regional aftermath;
- twelve canonical realm-event families;
- reward provenance;
- blessing and relic reward boundaries;
- dungeon/site persistence;
- dungeon conversion and reoccupation;
- deterministic placement and seed variation;
- discovery, warning and preparation;
- failure, retreat and recovery;
- multiplayer and simulation-scaling expectations;
- accessibility/readability requirements;
- adventure-art handoff boundaries;
- legacy source and stable-ID reconciliation.

FCC-05H does **not** redefine:

- universal combat;
- universal boss-health/damage systems;
- universal NPC AI;
- universal quest execution;
- universal dialogue;
- universal faction simulation;
- universal reputation;
- universal economy;
- universal loot architecture;
- universal dungeon generator internals;
- universal settlement simulation;
- universal portal travel;
- universal player death/respawn;
- detailed Divine Domain law-state propagation;
- detailed Void corruption/cleansing/restoration state;
- exact Block/Item/recipe quantities;
- final global stable-ID namespace normalisation;
- final art palettes, textures, rigs, animation sets or VFX graphs.

Those belong to shared systems, FCC-05I/J and FCC-12 through FCC-14.

The governing rule is:

> **FCC-05H defines what Ascendant adventure content exists, what it controls or changes, how it may resolve and what persistent world state it may alter; shared Leyforge systems execute those contracts.**

---

# 2. Adventure Canon Statement

Ascendant Reach dungeons are not ordinary Overworld rooms placed on floating islands and recoloured with clouds.

Every canonical dungeon family must use at least one Ascendant-specific mechanic or world relationship involving:

- altitude;
- gravity;
- buoyancy;
- falling;
- Windways;
- storms;
- electrical charge;
- Thunderhead cloud-fluid;
- moving islands;
- High-Aether survival;
- pilgrimage permissions;
- declared sacred law;
- Divine Domain boundaries;
- recognised legitimacy;
- evidence/precedent;
- route sovereignty;
- law infrastructure.

A dungeon may contain combat, but combat is not its definition.

A guardian may be fought, but a guardian is not automatically an enemy.

A fixed realm authority may become a boss encounter, but a fixed realm authority is not defined as “a creature with a large health bar.”

The adventure layer must support, where fiction allows:

- exploration;
- navigation;
- engineering;
- survival;
- research;
- diplomacy;
- ritual;
- law;
- restoration;
- rescue;
- repair;
- negotiation;
- political action;
- combat;
- deliberate avoidance.

---

# 3. Exact Canonical Dungeon Roster

Ascendant Reach has exactly **eight canonical top-level dungeon families**:

1. **Skyfort**
2. **Storm Temple**
3. **Fallen Airship Graveyard**
4. **Thunderhead Citadel**
5. **Underside Vault**
6. **Pilgrimage Labyrinth**
7. **Law Engine**
8. **Celestial Archive**

Two former Divine Concord dungeon concepts are deliberately reclassified:

- **Trial Domain** → reusable trial framework/overlay;
- **Abandoned Sanctuary** → domain/dungeon/site state.

This prevents ten inherited source concepts from becoming ten overlapping top-level dungeon grammars without losing any strong content.

---

# 4. Dungeon Family Registry

| Working ID | Display Name | Primary Adventure Identity |
|---|---|---|
| `dungeon.ascendant.skyfort` | **Skyfort** | aerial military/political stronghold |
| `dungeon.ascendant.storm_temple` | **Storm Temple** | storm ritual/research/engineering complex |
| `dungeon.ascendant.fallen_airship_graveyard` | **Fallen Airship Graveyard** | wreck-field salvage/history dungeon |
| `dungeon.ascendant.thunderhead_citadel` | **Thunderhead Citadel** | fortress embedded in dense storm/cloud-sea |
| `dungeon.ascendant.underside_vault` | **Underside Vault** | inverted/gravity-dependent ancient vault |
| `dungeon.ascendant.pilgrimage_labyrinth` | **Pilgrimage Labyrinth** | route/permission/sacred-custom dungeon |
| `dungeon.ascendant.law_engine` | **Law Engine** | bounded sacred-law infrastructure dungeon |
| `dungeon.ascendant.celestial_archive` | **Celestial Archive** | precedent/evidence/record-access dungeon |

These are working FCC-local IDs.

Final global namespace normalisation belongs to FCC-05J/FCC-13.

---

# 5. Skyfort

**Skyforts** are military, political, defensive, abandoned or contested aerial strongholds.

They may exist in:

- Cloudgrass border regions;
- Stormglass Archipelagos;
- Thunderhead margins;
- War-Saint Fields;
- strategic Windway intersections;
- high-altitude frontier regions.

## 5.1 Core Dungeon Grammar

Skyfort gameplay may involve:

- exposed approaches;
- landing zones;
- bridges;
- towers;
- vertical courtyards;
- anchor systems;
- patrol routes;
- airship docks;
- Windway access;
- local airspace;
- fortification layers;
- command spaces.

## 5.2 Realm-Specific Requirement

At least one major mechanic must depend on Ascendant conditions such as:

- altitude;
- exposed traversal;
- gravity;
- Windway access;
- flight/landing;
- storm defence;
- route sovereignty.

A Skyfort that functions identically to an Overworld stone castle is incomplete.

## 5.3 Valid States

A Skyfort may be:

- active military fort;
- Freehold defence site;
- League fort;
- pirate-held;
- rebel-held;
- abandoned;
- storm-damaged;
- occupied by another faction;
- divine-controlled;
- under restoration;
- converted to civic/route infrastructure.

## 5.4 Resolutions

Possible outcomes include:

- negotiate passage;
- expose coup;
- change commander;
- disable weapons;
- support defenders;
- support rebels;
- rescue occupants;
- repair anchors;
- seize/transfer ownership;
- force retreat;
- fight through the fort.

---

# 6. Storm Temple

**Storm Temples** are ritual, philosophical, monastic, research, engineering or religious complexes built around persistent storm phenomena.

They are not automatically temples to gods.

## 6.1 Core Dungeon Grammar

Possible elements include:

- exposed lightning towers;
- Stormglass circuits;
- grounding chambers;
- Lightning Core interfaces;
- conductive pathways;
- weather instruments;
- storm timing puzzles;
- ritual halls;
- sealed refuge areas.

## 6.2 Realm-Specific Requirement

Core mechanics may depend on:

- charge routing;
- grounding;
- lightning cycles;
- storm timing;
- conductive materials;
- Lightning Core state;
- Stormfront state;
- weather forecasting.

## 6.3 Valid Identities

A Storm Temple may belong to:

- Storm Monastery;
- research order;
- elemental philosophy;
- divine religion;
- extinct culture;
- military weather programme;
- industrial storm-harvesting institution.

## 6.4 Resolutions

Possible outcomes include:

- restore grounding;
- retune storm infrastructure;
- complete ritual;
- stop dangerous harvest;
- protect research;
- release trapped storm energy;
- negotiate institutional dispute;
- confront guardian/occupant;
- convert the site to a research or power facility.

---

# 7. Fallen Airship Graveyard

**Fallen Airship Graveyards** are persistent wreck-field dungeons formed by one or many crashed vessels.

They may accumulate because of:

- dangerous Windways;
- recurring storm fronts;
- battle history;
- navigation failure;
- gravity shifts;
- piracy;
- failed evacuation;
- migration conflict.

## 7.1 Core Dungeon Grammar

Possible features include:

- overlapping hulls;
- suspended wreckage;
- unstable decks;
- broken pressure rooms;
- hanging cargo;
- drifting debris;
- linked vessels;
- wreck interiors;
- salvage routes;
- survivor/refugee spaces;
- memorial areas.

## 7.2 Realm-Specific Requirement

At least one major mechanic must use:

- unstable altitude;
- shifting wreck geometry;
- fall risk;
- route/current movement;
- salvage ownership;
- vessel systems;
- storm state;
- air/gas containment.

## 7.3 Social/Legal Layer

Wreck contents may be:

- abandoned;
- still owned;
- memorial-protected;
- militarily classified;
- actively claimed;
- occupied by survivors/descendants;
- contested salvage.

Discovery does not automatically grant legal ownership.

## 7.4 Resolutions

Possible outcomes include:

- rescue;
- salvage;
- historical recovery;
- return cargo;
- expose cause of crash;
- stabilise wreck field;
- clear route;
- establish memorial;
- claim legal salvage;
- convert safe wrecks into settlement/route infrastructure.

---

# 8. Thunderhead Citadel

**Thunderhead Citadels** are fortress complexes physically embedded within or sustained by Thunderhead Seas and storm systems.

They remain distinct from ordinary Skyforts.

## 8.1 Core Dungeon Grammar

Possible features include:

- dense cloud-fluid corridors;
- storm chambers;
- sealed interiors;
- lightning conduits;
- low-visibility exterior sections;
- suspended water;
- cloud-vessel docks;
- hidden islands;
- atmospheric pressure compartments.

## 8.2 Realm-Specific Requirement

Core mechanics may depend on:

- Thunderhead Hazard;
- cloud-fluid movement;
- visibility;
- storm pressure;
- internal lightning;
- sealed access;
- vessel approach;
- Cloudfin/Thunderhead ecology.

## 8.3 Valid States

- active fortress;
- abandoned storm station;
- research citadel;
- pirate base;
- sealed military site;
- storm sovereign territory;
- corrupted citadel;
- reclaimed harbour.

## 8.4 Resolutions

Possible outcomes include:

- restore seals;
- reroute charge;
- disable weapon/weather systems;
- negotiate occupation;
- rescue stranded crews;
- restore a safe cloud route;
- seize/reassign control;
- evacuate;
- fight.

---

# 9. Underside Vault

**Underside Vaults** are deep structures built into or beneath the underside of major floating continents.

They may preserve:

- ancient anchor technology;
- old mining systems;
- lost records;
- vanished cultures;
- gravity machinery;
- sealed resources;
- buried transit systems.

## 9.1 Core Dungeon Grammar

Possible features include:

- inverted rooms;
- hanging corridors;
- local-gravity changes;
- waterfall shafts;
- anchor chambers;
- void-like open drops that remain inside Ascendant Reach;
- suspended platforms;
- mining passages;
- old service shafts.

## 9.2 Realm-Specific Requirement

At least one major mechanic must depend on:

- local gravity profile;
- orientation;
- underside terrain;
- anchor/buoyancy state;
- falling/recovery;
- structural load;
- ancient Ascendant engineering.

## 9.3 Boundary

Underside Vaults do not naturally connect to the Void Between.

A Void breach may contaminate one, but ordinary depth/underside traversal remains inside Ascendant Reach.

## 9.4 Resolutions

Possible outcomes include:

- repair anchor;
- stabilise gravity;
- reopen mine;
- recover lost technology;
- rescue underside residents;
- expose historical claim;
- seal dangerous machinery;
- convert vault to infrastructure/research/settlement use.

---

# 10. Pilgrimage Labyrinth

**Pilgrimage Labyrinths** are route-based sacred complexes where progression depends on declared customs, permissions, ritual status, physical navigation and recognised trial conditions.

They are not merely hedge mazes with holy decoration.

## 10.1 Core Dungeon Grammar

Possible elements include:

- branching pilgrimage roads;
- law markers;
- thresholds;
- rest stations;
- ritual preparation sites;
- witness points;
- restricted paths;
- neutral corridors;
- symbolic and physical route choices;
- access permissions.

## 10.2 Realm-Specific Requirement

Core mechanics may depend on:

- explicit declared customs;
- recognised permissions;
- bounded vows;
- hospitality;
- testimony;
- route legitimacy;
- pilgrimage status;
- domain boundaries.

These mechanics may not rely on unbounded hidden parsing of player morality or arbitrary freeform language.

## 10.3 Resolution Families

- complete pilgrimage;
- fulfil recognised condition;
- prove legitimate exception;
- restore route;
- expose fraudulent custodian;
- negotiate access;
- amend recognised practice;
- protect another pilgrim;
- refuse trial and seek alternate internal route where valid;
- confront guardian.

---

# 11. Law Engine

**Law Engines** are ancient, divine or magitechnical systems that stabilise, interpret, transmit or enforce bounded sacred-domain rules.

They are one of Ascendant Reach's strongest bridges between sky engineering and divine metaphysics.

## 11.1 Core Dungeon Grammar

Possible elements include:

- declared-law core;
- permission channels;
- boundary network;
- Hymnstone resonators;
- Judgement Crystal interfaces;
- law-record storage;
- power/maintenance systems;
- guardian stations;
- fail-safe chambers;
- contested admin controls.

## 11.2 Supported Functions

A Law Engine may control or support:

- recognised sanctuary;
- challenge rules;
- ownership permission within scope;
- ritual access;
- oath/legal record recognition;
- domain borders;
- neutral corridors;
- temporary local suppression.

## 11.3 Hard Boundary

A Law Engine may not override:

- universal save authority;
- identity;
- personhood;
- multiplayer authority;
- universal death/respawn;
- unrelated inventory truth.

## 11.4 Resolutions

Possible outcomes include:

- repair;
- audit;
- recalibrate;
- restore missing law data;
- expose manipulated precedent;
- change authorised administrator;
- negotiate law revision through valid authority;
- shut down;
- isolate corruption;
- destroy if fiction supports consequences.

---

# 12. Celestial Archive

**Celestial Archives** are large adventure sites preserving divine, political, legal and historical records.

They may contain:

- divine precedent;
- treaties;
- recognised miracles;
- domain records;
- relic histories;
- petitions;
- institutional memory;
- disputed records;
- sealed evidence.

## 12.1 Core Dungeon Grammar

Possible mechanics include:

- permissions;
- restricted wings;
- competing records;
- evidence reconstruction;
- archive custodians;
- sealed vaults;
- access proofs;
- damaged record networks;
- legal precedent conflicts;
- contested provenance.

## 12.2 Realm-Specific Requirement

At least one core mechanic must use:

- recognised legitimacy;
- record access;
- precedent;
- institutional authority;
- domain law;
- conflicting evidence.

## 12.3 Truth Boundary

A Celestial Archive may preserve authoritative records within a recognised system.

It is not omniscient.

An archived claim is not automatically objective cosmic truth.

Records may be:

- incomplete;
- biased;
- forged;
- superseded;
- disputed;
- deliberately sealed;
- historically contextual.

## 12.4 Structure Boundary

A **Celestial Archive dungeon** is not the same definition as an **Archive of Oaths civic structure**.

A civic Archive may become dungeon content through state/history, but the registries remain distinct.

---

# 13. Trial Domain Framework

**Trial Domain** is not a ninth canonical dungeon family.

It is a reusable **encounter/dungeon framework** that may overlay compatible Ascendant sites.

Possible host sites include:

- Pilgrimage Labyrinth;
- Law Engine;
- Celestial Archive;
- Law Garden site;
- Radiant Tribunal complex;
- War-Saint fortress;
- Skyfort in a divine territory;
- Concordant Firmament precinct.

## 13.1 Required Trial Contract

Every Trial Domain must explicitly define:

1. declared rule or condition;
2. boundary;
3. success condition;
4. failure condition;
5. authorised authority/custodian;
6. readable warning;
7. permitted exceptions;
8. persistent outcome.

## 13.2 Boundary

Trial Domains may not:

- infer arbitrary morality;
- secretly reinterpret player intent without authored state;
- delete save data;
- trap a save without a valid recovery/return path;
- become a second portal system.

---

# 14. Abandoned Sanctuary State

**Abandoned Sanctuary** is not a ninth dungeon family.

It is a reusable state that may apply to:

- Pilgrimage Labyrinth;
- Law Engine;
- Celestial Archive;
- Law Garden site;
- temple;
- Mercy Sanctuary;
- Tribunal precinct;
- War-Saint site;
- Concordant structure;
- other compatible sacred location.

Possible causes include:

- deity vanished;
- worship ended;
- institution collapsed;
- law failed;
- custodians withdrew;
- war;
- migration;
- political exile;
- ordinary neglect;
- Void corruption.

Abandonment is not proof of corruption.

Possible states include:

- dormant;
- feral;
- occupied;
- reclaimed;
- restored;
- reformed;
- corrupted;
- repurposed;
- permanently closed.

---

# 15. Supporting Adventure-Site Categories

Not every meaningful adventure location is a top-level dungeon family.

Supported categories include:

- route blockades;
- storm shelters;
- crashed single vessels;
- isolated wrecks;
- Current Beacon failures;
- abandoned docks;
- Skyback rescue sites;
- Cloudwhale observation crises;
- Lightning Core accident zones;
- broken anchors;
- drifting islands;
- pilgrimage checkpoints;
- disputed shrines;
- relic custody sites;
- Tribunal annexes;
- memorial battlefields;
- sanctuary crises;
- corruption quarantine zones.

These do not inflate the eight-family dungeon count.

A new top-level dungeon family requires a reusable topology and mechanic grammar not representable through the existing eight families/frameworks/states.

---

# 16. Exact Guardian Roster

Ascendant Reach has exactly **eight canonical dungeon guardian roles**:

1. **Skyfort Commander**
2. **Storm Keeper**
3. **Wreckwarden**
4. **Thunder Custodian**
5. **Vault Anchorite**
6. **Pilgrim Adjudicator**
7. **Law Custodian**
8. **Archive Arbiter**

These are **encounter roles**, not eight new species.

A guardian may be:

- mortal;
- divine;
- construct;
- beast;
- institution-appointed person;
- ancient automated system;
- spirit-like being;
- group/collective;
- other compatible entity.

Personhood must be respected where applicable.

---

# 17. Guardian Registry

| Working ID | Guardian | Primary Dungeon |
|---|---|---|
| `guardian.ascendant.skyfort_commander` | **Skyfort Commander** | Skyfort |
| `guardian.ascendant.storm_keeper` | **Storm Keeper** | Storm Temple |
| `guardian.ascendant.wreckwarden` | **Wreckwarden** | Fallen Airship Graveyard |
| `guardian.ascendant.thunder_custodian` | **Thunder Custodian** | Thunderhead Citadel |
| `guardian.ascendant.vault_anchorite` | **Vault Anchorite** | Underside Vault |
| `guardian.ascendant.pilgrim_adjudicator` | **Pilgrim Adjudicator** | Pilgrimage Labyrinth |
| `guardian.ascendant.law_custodian` | **Law Custodian** | Law Engine |
| `guardian.ascendant.archive_arbiter` | **Archive Arbiter** | Celestial Archive |

These are working realm-local IDs pending final registry normalisation.

---

# 18. Skyfort Commander

The **Skyfort Commander** is the encounter-role authority for a Skyfort.

It may be:

- military officer;
- elected defender;
- pirate captain;
- ancient construct;
- rebel leader;
- automated defence mind;
- temporary occupation commander.

Possible resolution:

- duel;
- treaty;
- expose coup;
- transfer command;
- rescue;
- surrender;
- bypass through legal access;
- support reform;
- fight.

A Skyfort Commander is not automatically a fixed realm authority.

---

# 19. Storm Keeper

The **Storm Keeper** maintains, interprets or protects a Storm Temple's storm relationship.

It may be:

- monk;
- researcher;
- elemental specialist;
- construct;
- storm-attuned creature;
- divine custodian.

Possible resolution:

- repair grounding;
- prove understanding;
- restore storm balance;
- stop dangerous harvesting;
- complete ritual;
- assist research;
- negotiate access;
- fight.

---

# 20. Wreckwarden

The **Wreckwarden** governs or protects a Fallen Airship Graveyard's dangerous/claimed history.

It may be:

- survivor;
- salvage authority;
- automated ship mind;
- memorial custodian;
- scavenger leader;
- descendant community representative.

Possible resolution:

- prove salvage rights;
- rescue survivors;
- return remains/property;
- stabilise wreck;
- recover records;
- negotiate claim;
- expose theft;
- fight.

---

# 21. Thunder Custodian

The **Thunder Custodian** manages or controls a Thunderhead Citadel's storm/cloud-sea systems.

It may be:

- military officer;
- storm engineer;
- construct;
- divine agent;
- ancient caretaker.

Possible resolution:

- restore seals;
- reroute storm pressure;
- reopen safe route;
- disable dangerous weapon;
- repair core infrastructure;
- negotiate access;
- transfer authority;
- fight.

---

# 22. Vault Anchorite

The **Vault Anchorite** guards or maintains an Underside Vault's gravity/anchor systems, history or protected contents.

It may be:

- hermit engineer;
- ancient custodian;
- construct;
- isolated cultural guardian;
- gravity-attuned being.

Possible resolution:

- repair anchor;
- prove safe intent;
- restore missing component;
- resolve historical claim;
- negotiate access;
- evacuate;
- shut system down;
- fight.

---

# 23. Pilgrim Adjudicator

The **Pilgrim Adjudicator** validates or interprets an authored Pilgrimage Labyrinth's declared rules.

It may be:

- person;
- construct;
- divine servant;
- order-appointed official;
- ritualised collective.

Possible resolution:

- satisfy condition;
- prove exception;
- appeal;
- expose illegitimate rule;
- restore route;
- negotiate;
- replace custodian;
- fight where supported.

The Adjudicator cannot invent hidden morality tests.

---

# 24. Law Custodian

The **Law Custodian** maintains or administers a Law Engine.

It may be:

- Edict Sentinel;
- engineer;
- bureaucrat;
- divine servant;
- appointed judge;
- ancient system mind.

Possible resolution:

- audit;
- repair;
- recalibrate;
- change authorised operator;
- prove engine error;
- isolate corruption;
- negotiate law change through valid authority;
- fight.

If the Custodian is a recognised person, it cannot be treated as owned machine loot.

---

# 25. Archive Arbiter

The **Archive Arbiter** manages access, evidence or conflict inside a Celestial Archive.

It may be:

- archivist;
- judge;
- construct;
- divine servant;
- record intelligence;
- institutional officer.

Possible resolution:

- present evidence;
- obtain authority;
- prove record conflict;
- repair archive;
- expose forgery;
- restore access;
- negotiate disclosure;
- fight where fiction supports it.

The Arbiter is not automatically omniscient.

---

# 26. Guardian Non-Combat Rule

No guardian family requires combat as the universal resolution.

A guardian may be:

- defeated;
- bypassed;
- convinced;
- legally overruled;
- repaired;
- restored;
- aided;
- replaced;
- exposed as illegitimate;
- challenged through ritual;
- allied with;
- deliberately left in place.

Combat remains legitimate where fiction supports it.

A guardian's reward cannot assume death if a non-lethal outcome is intended to be equivalent progression.

---

# 27. Fixed Realm Authority Roster

Ascendant Reach has exactly **five fixed realm authorities**:

1. **Tempest Leviathan**
2. **Gravity Choir Sovereign**
3. **Law Lion Ascendant**
4. **Fallen Saint**
5. **Concord Judge**

These five are realm-level canonical identities.

They represent fundamentally different authority domains:

- weather/ecology;
- floating-world stability;
- sacred law;
- divine/personhood/doctrinal history;
- celestial institutions and inter-domain adjudication.

The fixed-authority roster is not a list of mandatory kills.

---

# 28. Fixed Authority Stable-ID Strategy

## 28.1 Tempest Leviathan

Preserved legacy stable ID:

`boss.realm.aetheric.tempest_leviathan`

## 28.2 Gravity Choir Sovereign

Preserved legacy stable ID:

`boss.realm.aetheric.gravity_choir_sovereign`

## 28.3 Law Lion Ascendant

Preserved legacy stable ID:

`boss.realm.divine.law_lion_ascendant`

## 28.4 Fallen Saint

The source Atlas established **Fallen Saint** as a Divine Concord boss hook but did not provide a detailed stable ID.

FCC-local working ID:

`boss.realm.ascendant.fallen_saint`

This is explicitly a **working FCC-local ID**, not a claim that a legacy stable ID existed.

Final namespace certification belongs to FCC-05J/FCC-13.

## 28.5 Concord Judge

Final display/canon name:

**Concord Judge**

Preserved legacy stable ID:

`boss.realm.divine.covenant_judge`

Accepted legacy display alias:

**Covenant Judge**

The established stable ID is not renamed merely because the display identity was reconciled.

---

# 29. Tempest Leviathan

The **Tempest Leviathan** is a fixed realm authority and world-scale storm migrator.

Its established source role is:

> storm-bearing sky leviathan governing Windways and cloud-sea migration.

It is not automatically a Cloudwhale.

## 29.1 World Function

The Leviathan may influence:

- Windways;
- rain;
- lightning;
- cloud-sea migration;
- flight lanes;
- aerial ecology;
- storm power;
- settlement safety;
- sky trade.

## 29.2 Encounter Scale

The Leviathan may function as:

- roaming world-scale entity;
- multi-stage expedition;
- escort/protection crisis;
- infrastructure project;
- hunt;
- ecological intervention.

It does not require a circular boss arena.

## 29.3 Resolution Families

- heal;
- redirect;
- bond/cooperate where fiction supports;
- protect a route;
- protect the Leviathan;
- alter settlement/route planning;
- drive it away;
- hunt/kill.

## 29.4 Aftermath

Outcomes may alter:

- flight lanes;
- storm frequency;
- rain;
- Lightning Core/storm-energy opportunity;
- Cloudwhale/Cloudfin/ecological migration;
- settlement viability;
- trade routes.

Killing the Leviathan may remove an ecological/world function and should not be treated as automatically optimal.

---

# 30. Gravity Choir Sovereign

The **Gravity Choir Sovereign** is a fixed realm authority formed as a distributed intelligence maintaining harmonics that help hold floating islands aloft.

Preserved stable ID:

`boss.realm.aetheric.gravity_choir_sovereign`

## 30.1 World Function

The Choir may influence:

- island stability;
- island altitude;
- regional gravity harmonics;
- route geometry;
- hidden layers;
- falling-region risk;
- settlement support.

## 30.2 Identity

The Sovereign may be:

- one distributed mind;
- a network of voices;
- machine/magical intelligence;
- culturally interpreted differently across the realm.

It is not ordinary wildlife.

Its personhood must follow universal personhood rules.

## 30.3 Resolution Families

- retune Choir;
- repair missing voices;
- restore infrastructure;
- negotiate ordering;
- alter island relationships;
- seize limited control;
- partition authority;
- shatter/destroy.

## 30.4 Aftermath

Outcomes may cause:

- islands to stabilise;
- islands to drift;
- regions to fall;
- hidden routes to open;
- routes to close;
- settlements to relocate;
- new construction zones;
- evacuation crises.

Large changes must use explicit persistent world-state transitions.

---

# 31. Law Lion Ascendant

The **Law Lion Ascendant** is a fixed realm authority and exceptional manifestation/individual of the broader **Law Lion** creature family.

Preserved stable ID:

`boss.realm.divine.law_lion_ascendant`

It is not a thirteenth principal creature species.

## 31.1 World Function

The Law Lion Ascendant embodies/enforces one recognised divine concord or sacred law with extraordinary literal force.

It may affect:

- sanctuary;
- law-responsive ecology;
- access;
- taboos;
- blessings;
- domain legitimacy;
- pilgrimage;
- institutions.

## 31.2 Hard Boundary

It may not invent laws through unbounded freeform reasoning.

The enforced law must be:

- explicit;
- authored;
- scoped;
- readable;
- stored as supported game state.

## 31.3 Resolution Families

Established source-compatible outcomes include:

- interpret law;
- prove exception;
- amend concord through valid authority;
- accept trial;
- replace judge/custodian where system permits;
- negotiate;
- fight.

## 31.4 Aftermath

Outcomes may alter:

- blessings;
- taboos;
- pilgrimage access;
- Domain law;
- sanctuary ecology;
- institutional legitimacy.

They do not alter universal save/death/identity authority.

---

# 32. Fallen Saint

The **Fallen Saint** is a fixed realm authority representing a once-recognised divine or mortal sacred authority whose status, doctrine, institution, blessing, identity or purpose has broken, changed or been rejected.

“Fallen” does **not** automatically mean evil or Void-corrupted.

## 32.1 Possible Causes

A Fallen Saint may have fallen through:

- ideological break;
- betrayal;
- institutional corruption;
- disillusionment;
- political exile;
- failed sacred duty;
- false accusation;
- refusal to obey a god;
- unresolved war;
- genuine Void corruption;
- other authored history.

## 32.2 Territory

Especially suitable for:

- War-Saint Fields;
- Abandoned Sanctuary state;
- memorial regions;
- fortress monasteries;
- former pilgrimage sites;
- disputed saintly institutions.

## 32.3 Resolution Families

- restore;
- vindicate;
- expose wrongdoing;
- cleanse actual corruption;
- reconcile;
- support reform;
- support rebellion;
- depose;
- imprison;
- exile;
- fight/kill.

## 32.4 Aftermath

Outcomes may change:

- saintly legitimacy;
- War-Saint doctrine;
- Temple Polity politics;
- pilgrimage;
- relic custody;
- veteran/memorial settlements;
- sanctuary access;
- institutional trust.

Cleansing Void corruption does not automatically restore the old doctrine or institution.

---

# 33. Concord Judge

**Concord Judge** is the fixed upper-realm institutional authority responsible for major inter-domain adjudication.

Preserved legacy stable ID:

`boss.realm.divine.covenant_judge`

Legacy display alias:

**Covenant Judge**

## 33.1 World Function

The Concord Judge may arbitrate disputes involving:

- gods;
- Divine Domains;
- cultures;
- pilgrims;
- institutions;
- sacred access;
- realm treaties;
- legitimacy;
- high-level precedent.

The Judge is not a supreme deity.

The Judge is not omniscient.

## 33.2 Possible States

The Judge may be:

- fair;
- strict;
- biased;
- politically compromised;
- outdated;
- manipulated;
- reformist;
- corrupt in the ordinary institutional sense;
- genuinely Void-corrupted where provenance exists.

Ordinary bias/corruption is not automatically Void corruption.

## 33.3 Resolution Families

Source-compatible outcomes include:

- present case;
- present evidence;
- expose bias;
- complete trial;
- support appeal;
- negotiate settlement;
- reform procedure;
- depose;
- battle.

## 33.4 Aftermath

Outcomes may change:

- realm treaties;
- domain recognition;
- sacred access;
- court legitimacy;
- pilgrimage rights;
- institutional alliances;
- legal precedent.

---

# 34. Fixed Authority Ceiling

FCC-05 has exactly **five fixed realm authorities**.

The following do not expand that fixed count:

- Pilgrim Star;
- Thunder Roc;
- Sky-King Automaton;
- Skycourt Thunder Marshal;
- Storm Sovereign;
- Law-Bound Herald;
- Domain Sovereign;
- Theological Crisis;
- dungeon guardians;
- local rulers;
- faction champions;
- corrupted elite variants.

This separation keeps the canonical realm-authority roster meaningful while preserving broad procedural adventure variety.

---

# 35. Pilgrim Star

**Pilgrim Star** is a canonical **roaming variable realm-authority/event foundation**, not a sixth fixed realm authority.

Preserved stable ID:

`boss.realm.divine.pilgrim_star`

## 35.1 Established World Function

The Pilgrim Star is a moving celestial entity whose route may:

- grant miracles;
- scorch settlements;
- transform environments;
- alter pilgrimage;
- affect climate;
- influence relics;
- reshape faith politics.

## 35.2 Placement

Especially suitable for:

- High Aether;
- Pilgrim Thresholds;
- Concordant Firmament;
- major celestial routes.

Its route is persistent/seed-derived rather than appearing as a random combat encounter.

## 35.3 Resolution Families

Established source-compatible outcomes include:

- guide route;
- shelter communities;
- request miracle;
- redirect;
- anchor;
- study;
- protect;
- attack.

## 35.4 Event Relationship

**Pilgrim Star Passage** is the event family.

Pilgrim Star is the entity/authority foundation that may instantiate or drive the event.

The event may also use indirect Star effects where the entity itself remains distant.

---

# 36. Exceptional Thunder Roc

The old **Thunder Roc** boss hook is reconciled under the canonical **Storm Roc** creature family.

It may be:

- exceptional ancient Storm Roc;
- storm-saturated individual;
- named regional apex;
- culturally titled Thunder Roc;
- boss-scale individual.

It is not a separate principal species.

Possible outcomes include:

- hunt;
- relocate;
- protect nest;
- rescue injured Roc;
- alter prey pressure;
- drive away;
- kill.

Outcome may affect:

- predator territory;
- Skyback safety;
- Cloudfin pressure;
- route danger;
- cultural law.

---

# 37. Sky-King Automaton

**Sky-King Automaton** is a canonical unique/rare ancient construct boss foundation.

It is not a fixed realm authority.

It may be associated with:

- Skyforts;
- Underside Vaults;
- lost sky kingdoms;
- ancient anchor infrastructure;
- abandoned capitals.

Possible identities include:

- deposed artificial monarch;
- dormant defence sovereign;
- surviving administrator;
- false king;
- legitimate ancient ruler awakening into a changed world.

If self-aware, personhood applies.

Possible resolutions:

- restore;
- audit mandate;
- recognise/reject claim;
- negotiate;
- transfer authority;
- repair;
- disable;
- depose;
- fight.

---

# 38. Skycourt Thunder Marshal

**Skycourt Thunder Marshal** is a canonical faction-champion/political-boss foundation.

Preserved legacy stable ID:

`boss.realm.aetheric.thunder_marshal`

Its established source role is a military-political champion controlling storm forts, patrols and contested sky borders.

## 38.1 Variable Office

Different seeds/cultures may instantiate a compatible office such as:

- Thunder Marshal;
- Sky Marshal;
- Storm Admiral;
- culturally equivalent command role.

The Atlas foundation remains preserved.

## 38.2 Resolution Families

Source-compatible outcomes include:

- duel;
- treaty;
- expose coup;
- support reform;
- depose;
- campaign/combat.

## 38.3 Aftermath

May affect:

- fort control;
- patrols;
- Wind Rights;
- borders;
- trade;
- route access;
- military relations.

---

# 39. Storm Sovereign

**Storm Sovereign** is a variable regional sovereign/title family.

It may represent:

- elemental storm intelligence;
- ruler whose authority depends on storm infrastructure;
- divine/storm entity;
- cultural title;
- regional weather sovereign.

It is not automatically:

- Tempest Leviathan;
- Storm Roc;
- god;
- corrupted.

Possible outcomes include:

- negotiate storm boundaries;
- redirect regional weather;
- earn route rights;
- support rival;
- restore damaged system;
- depose;
- fight.

---

# 40. Law-Bound Herald

**Law-Bound Herald** is a variable divine guardian/agent authority family.

It is especially suitable for:

- Law Gardens;
- Pilgrimage Labyrinths;
- Trial Domains;
- Law Engines;
- Divine Domain borders.

A Herald may:

- announce;
- test;
- interpret;
- warn;
- enforce;
- escort;
- challenge;
- deny access.

Its law relationship must remain explicit and bounded.

It is not automatically a fixed Law Lion or Edict Sentinel identity.

---

# 41. Domain Sovereign

**Domain Sovereign** is a variable authority family for the ruler/custodian/embodiment of an individual Divine Domain.

A Domain Sovereign may be:

- god;
- saint;
- spirit;
- collective;
- construct intelligence;
- ascended person;
- other authorised divine authority.

One seed may contain many.

Domain Sovereign is therefore not one fixed individual.

Possible outcomes include:

- alliance;
- recognition;
- reform;
- succession;
- restriction;
- liberation;
- cleansing;
- deposition;
- containment;
- conflict.

---

# 42. Theological Crisis Framework

**Theological Crisis** is not a creature or fixed boss.

It is an adventure/crisis authority framework for conflicts where the primary “boss” is:

- legitimacy dispute;
- doctrinal schism;
- institutional breakdown;
- miracle contradiction;
- succession crisis;
- conflict between god and institution;
- conflict between multiple interpretations;
- mass pilgrimage conflict.

It may still generate:

- champions;
- guardians;
- riots;
- military conflict;
- debates;
- trials;
- authority encounters.

Resolution may occur without one final entity to kill.

---

# 43. Major Encounter Classification

Ascendant major encounters may occupy different scales.

## 43.1 Dungeon Guardian

Site-level role.

Examples:

- Storm Keeper;
- Archive Arbiter.

## 43.2 Dungeon/Regional Boss

Major local threat or ruler.

Examples:

- exceptional Thunder Roc;
- Sky-King Automaton.

## 43.3 Faction Champion

Political/military representative.

Example:

- Skycourt Thunder Marshal.

## 43.4 Variable Regional Sovereign

Example:

- Storm Sovereign;
- Domain Sovereign.

## 43.5 Fixed Realm Authority

Exactly five canonical authorities.

## 43.6 World-Scale/Roaming Authority

Examples:

- Tempest Leviathan;
- Pilgrim Star;
- Gravity Choir Sovereign in distributed/world-infrastructure form.

The categories may overlap, but stable identities must not be duplicated.

---

# 44. Encounter Discovery and Foreshadowing

Major adventure content should be discoverable through persistent evidence.

Possible signs include:

- rumours;
- route closures;
- maps;
- Current Beacon reports;
- Stormfront patterns;
- wreck debris;
- Cloudwhale/creature behaviour;
- Skyfort patrols;
- institutional notices;
- pilgrimage warnings;
- law markers;
- Tribunal records;
- relic histories;
- visible island drift;
- architecture;
- distant celestial phenomena;
- settlement evacuation;
- Codex research.

High-impact encounters should not routinely begin without readable warning.

---

# 45. Preparation

Preparation may materially affect outcomes.

Supported preparation categories include:

- aerial traversal equipment;
- fall recovery;
- weather protection;
- grounding;
- High-Aether survival gear;
- vessel access;
- route knowledge;
- Current Beacon restoration;
- supplies;
- allies;
- faction reputation;
- legal permission;
- evidence;
- maps;
- repairs;
- settlement projects;
- sacred-law knowledge;
- ritual preparation;
- corruption protection.

Preparation should create meaningful advantages without requiring one exact build.

---

# 46. Commitment, Retreat and Recovery

Adventure content must distinguish:

- free exploration;
- warning threshold;
- commitment point;
- active encounter;
- retreat path;
- failure;
- recovery.

Normal progression must not silently strand a save.

Failure may cause:

- retreat;
- temporary access loss;
- damaged route;
- changed faction state;
- settlement damage;
- authority escalation;
- event continuation;
- recovery quest;
- lost opportunity;
- new political state.

Failure should not silently delete a world or invalidate the save.

---

# 47. Dungeon Persistence

Dungeon instances may persist through states such as:

- undiscovered;
- rumoured;
- located;
- entered;
- partially mapped;
- active;
- occupied;
- contested;
- damaged;
- storm-damaged;
- unstable;
- sealed;
- cleared;
- guardian-resolved;
- authority-resolved;
- claimed;
- restored;
- converted;
- reoccupied;
- abandoned;
- corrupted;
- cleansed;
- collapsed where explicitly supported.

Loot, ownership, boss state, guardian state, power, route, structural state and population may persist independently.

A dungeon does not silently reset because the player leaves.

---

# 48. Dungeon Conversion

After resolution, compatible dungeons may become:

- settlement;
- fort;
- research site;
- salvage yard;
- mine;
- route station;
- sanctuary;
- archive;
- farm;
- harbour;
- military site;
- ruin/memorial.

Examples:

- a restored Skyfort may become a route defence site;
- a cleared Airship Graveyard may become a salvage settlement;
- a repaired Underside Vault may become a gravity research facility;
- a restored Law Engine may support a lawful Domain;
- a Celestial Archive may become a civic research institution.

Conversion uses universal settlement/structure systems.

---

# 49. Dungeon Hybridisation

A generated site may combine compatible families/states.

Examples:

- Skyfort + Trial Domain;
- Storm Temple + Abandoned Sanctuary;
- Thunderhead Citadel + Skyfort elements;
- Law Engine + Celestial Archive;
- Pilgrimage Labyrinth + Archive precinct;
- Underside Vault + abandoned Skyfort infrastructure.

Hybridisation must preserve one understandable primary dungeon identity and not produce incoherent mechanic stacking.

---

# 50. Exact Realm Event Roster

Ascendant Reach has exactly **twelve canonical realm-event families**:

1. **Windway Shift**
2. **Cloudwhale Migration**
3. **Stormglass Bloom**
4. **Thunderhead Surge**
5. **Island Drift**
6. **Sky Convoy Crisis**
7. **Pilgrimage Season**
8. **Domain Law Revision**
9. **Tribunal Crisis**
10. **Fallen-Saint Revelation**
11. **Pilgrim Star Passage**
12. **Void Breach**

These are event families, not twelve guaranteed simultaneous events.

---

# 51. Windway Shift

A **Windway Shift** changes one or more route/current states.

Possible causes:

- ordinary atmospheric dynamics;
- Tempest Leviathan outcome;
- Tempest Crown intervention;
- Gravity Choir change;
- storm event;
- island movement.

Possible consequences:

- route opens;
- route closes;
- travel time changes;
- trade reroutes;
- convoy risk changes;
- Current Beacons require recalibration;
- settlements become better/worse connected.

The event must use bounded saved route states rather than randomising the whole realm.

---

# 52. Cloudwhale Migration

A **Cloudwhale Migration** moves major Cloudwhale populations through a region.

Possible effects:

- Migration Tide;
- route congestion;
- festivals;
- research;
- protected-route rules;
- fishery changes;
- predator movement;
- trade interruption/opportunity.

Possible player responses:

- observe;
- protect;
- escort vessels;
- reroute traffic;
- research;
- regulate hunting;
- assist settlement adaptation.

This event is ecological first, not a boss attack.

---

# 53. Stormglass Bloom

A **Stormglass Bloom** is a period of exceptional lightning/storm activity producing or exposing new Stormglass opportunities.

Possible effects:

- increased Lightning Exposure;
- material availability;
- route closure;
- power opportunities;
- damage;
- Static Serpent activity;
- storm-harvesting demand.

The event should create risk/reward rather than free resource spawning.

---

# 54. Thunderhead Surge

A **Thunderhead Surge** expands, intensifies or moves a Thunderhead Sea.

Possible effects:

- visibility loss;
- route closure;
- Cloudfin movement;
- vessel danger;
- Storm Roc activity;
- rescue demand;
- Thunderhead Citadel state changes;
- temporary resource opportunities.

---

# 55. Island Drift

An **Island Drift** changes one or more floating-landmass relationships.

Possible causes:

- ordinary bounded drift;
- Gravity Choir state;
- anchor failure;
- storm;
- infrastructure outcome.

Possible consequences:

- bridge misalignment;
- route change;
- settlement evacuation;
- new resource access;
- new dungeon access;
- border dispute.

Terrain movement must use deterministic/persistent states, not random relocation every load.

---

# 56. Sky Convoy Crisis

A **Sky Convoy Crisis** involves a major travelling group such as:

- merchant fleet;
- pilgrimage fleet;
- refugees;
- military convoy;
- rescue fleet;
- nomadic flotilla.

Possible causes:

- storm;
- route closure;
- piracy;
- breakdown;
- political blockade;
- creature migration;
- fuel/lift failure.

Possible resolutions:

- rescue;
- escort;
- repair;
- negotiate passage;
- defend;
- redirect;
- exploit;
- grant refuge.

Aftermath may change trade, diplomacy and settlement population.

---

# 57. Pilgrimage Season

**Pilgrimage Season** creates a major increase in pilgrimage traffic.

Possible effects:

- Pilgrimage Convergence;
- lodging demand;
- trade;
- route congestion;
- ritual events;
- access disputes;
- doctrinal conflict;
- sanctuary pressure;
- Law Engine/Tribunal demand.

It need not be one religion's holiday.

---

# 58. Domain Law Revision

A **Domain Law Revision** occurs when a recognised local sacred law is amended, reinterpreted, restored, replaced or suspended through an authorised process.

Possible causes:

- authority outcome;
- Law Engine repair;
- Concord Judge decision;
- political succession;
- domain sovereign change;
- historical evidence.

Consequences may include:

- changed permissions;
- new sanctuary state;
- guardian behaviour change;
- route access;
- settlement law adaptation;
- legal dispute.

It cannot rewrite universal game systems.

---

# 59. Tribunal Crisis

A **Tribunal Crisis** is a major conflict around celestial adjudication/institutional legitimacy.

Possible causes:

- competing claims;
- forged evidence;
- bias;
- succession;
- domain conflict;
- missing Judge;
- contradictory rulings;
- institutional corruption.

Possible resolutions:

- evidence;
- trial;
- reform;
- appeal;
- succession;
- negotiation;
- exposure;
- political conflict;
- combat where warranted.

Aftermath may change recognised law and inter-domain relationships.

---

# 60. Fallen-Saint Revelation

A **Fallen-Saint Revelation** exposes major new truth/evidence/action concerning a Fallen Saint, War-Saint institution or saintly doctrine.

Possible revelations include:

- false accusation;
- concealed crime;
- corrupted relic;
- heroic sacrifice;
- institutional betrayal;
- willing rebellion;
- actual Void corruption;
- historical fabrication.

The event may transform:

- pilgrimage;
- memorials;
- doctrine;
- settlement politics;
- relic custody;
- authority relationship.

---

# 61. Pilgrim Star Passage

A **Pilgrim Star Passage** occurs when the Pilgrim Star's persistent route intersects relevant regions.

Possible effects:

- miracle opportunity;
- intense radiance;
- transformed terrain;
- settlement danger;
- pilgrimage surge;
- climate change;
- relic activation;
- faith conflict.

Possible response:

- shelter;
- observe;
- guide;
- redirect;
- request miracle;
- prepare ritual;
- evacuate;
- confront.

The Star is not automatically benevolent or hostile.

---

# 62. Void Breach

A **Void Breach** is genuine Void-origin intrusion into Ascendant Reach.

Possible affected systems:

- gravity;
- Windways;
- Cloudstone systems;
- Law Engines;
- Ascension Gates;
- Divine Domains;
- creatures;
- settlements;
- dungeons.

Void Breach must remain distinct from:

- Stormfront;
- law conflict;
- divine hostility;
- abandoned sanctuary;
- ordinary mechanical failure.

FCC-05I owns detailed corruption/state progression.

---

# 63. Event Combination

Compatible event families may combine.

Examples:

> Windway Shift + Sky Convoy Crisis

> Pilgrimage Season + Tribunal Crisis

> Pilgrim Star Passage + High-Aether Surge

> Island Drift + Underside Vault exposure

> Void Breach + Domain Law Revision

Combinations must remain bounded and authored through compatible state interfaces.

The event generator must not continuously stack all twelve systems into unreadable chaos.

---

# 64. Event Persistence

Events use bounded deterministic/persistent state rather than invisible world resets.

Persistent consequences may include:

- changed Windway;
- shifted island relationship;
- new dock/route demand;
- settlement migration;
- law revision;
- changed authority;
- dungeon occupancy;
- new archive access;
- changed trade;
- new protected species policy;
- corruption quarantine;
- restored infrastructure.

Reloading must reproduce the saved aftermath.

---

# 65. Reward Provenance Rule

Ascendant Reach does not use a generic “celestial loot pool” that ignores source.

Rewards must come from actual provenance.

Valid reward sources include:

- mining;
- quarrying;
- storm harvesting;
- agriculture;
- fisheries;
- husbandry;
- salvage;
- carried possessions;
- faction grants;
- legal claims;
- trade;
- institutional rewards;
- research;
- relic custody;
- recovered records;
- repaired machinery;
- dungeon infrastructure;
- authority outcomes;
- protected resource allotments;
- exploration discoveries.

A chest does not produce unrelated Skyiron, holy robes, Cloudwhale products and legal authority merely because it sits in Ascendant Reach.

---

# 66. Major Authority Progression Rule

Major progression must not require killing a fixed realm authority solely to obtain a mandatory capability/material.

Authority outcomes may grant or unlock:

- Windway rights;
- route stabilisation;
- Choir-tuning knowledge;
- sacred permissions;
- legal recognition;
- new pilgrimage routes;
- Celestial-processing knowledge;
- institutional services;
- settlement alliances;
- storm-infrastructure access;
- resource access;
- relic custody;
- unique trophies where context supports them.

Combat and killing remain valid outcomes where fiction supports them, but not the universal progression contract.

---

# 67. Blessings

A **blessing** is a defined effect with provenance and conditions.

It is not one infinitely stackable generic stat.

A blessing may be:

- personal;
- equipment-bound;
- settlement-wide;
- route-specific;
- Domain-specific;
- temporary;
- conditional;
- persistent where explicitly designed.

A blessing must record:

- source;
- scope;
- condition;
- effect;
- expiry/revocation rule where relevant.

Blessings cannot override universal ownership/save/death/identity rules.

---

# 68. Relics

**Relic** is a provenance/status category, not one material or generic loot tier.

A relic may be:

- weapon;
- tool;
- book;
- banner;
- machine component;
- sacred remains where culturally/ethically appropriate;
- legal object;
- vessel part;
- ancient device;
- institutional artefact.

Its history determines meaning.

Relic status may affect:

- custody;
- legality;
- diplomacy;
- research;
- religion;
- quests;
- museum/archive value.

Relic status does not automatically make an object the strongest combat item.

---

# 69. Dungeon Reward Families

Dungeon rewards may include:

## Skyfort
- route maps;
- military records;
- equipment;
- docking rights;
- fort control;
- salvage;
- faction reputation.

## Storm Temple
- storm knowledge;
- Lightning technology;
- Stormglass access;
- ritual knowledge;
- weather data.

## Fallen Airship Graveyard
- salvage;
- vessel components;
- cargo;
- logs;
- historical evidence;
- legal claims.

## Thunderhead Citadel
- storm infrastructure;
- Cloudfin/Thunderhead access;
- vessel routes;
- Lightning systems;
- military/research data.

## Underside Vault
- gravity/anchor knowledge;
- rare infrastructure;
- ancient history;
- resource access;
- restored facility.

## Pilgrimage Labyrinth
- recognised access;
- pilgrimage status;
- route knowledge;
- ritual/legal knowledge;
- institutional relationship.

## Law Engine
- law infrastructure knowledge;
- domain permission;
- Judgement/Hymnstone interfaces;
- restoration outcomes;
- legal state change.

## Celestial Archive
- records;
- evidence;
- recipes/knowledge;
- precedent;
- relic provenance;
- access to sealed history.

Exact Items/quantities remain FCC-05G/FCC-13 data.

---

# 70. Kill/Non-Kill Reward Equivalence

Where a major encounter supports both lethal and non-lethal outcomes, mandatory progression rewards must not exist only on the corpse.

Examples:

- a protected Tempest Leviathan outcome may grant route access/knowledge without killing;
- a negotiated Concord Judge outcome may grant legal access;
- a repaired Gravity Choir may grant tuning capability;
- an interpreted Law Lion law may unlock recognised passage;
- a vindicated Fallen Saint may grant relic custody/knowledge.

Combat-specific trophies may still differ.

Progression equivalence does not require every outcome to have identical flavour or rewards.

---

# 71. Authority Recurrence

Each authority/foundation needs explicit recurrence semantics.

## Tempest Leviathan
Fixed unique authority; death/removal is persistent unless a later global/world-setting rule explicitly defines succession or comparable ecological replacement.

## Gravity Choir Sovereign
Fixed distributed authority; may be repaired, fragmented, partitioned or destroyed. Recurrence depends on surviving Choir infrastructure rather than generic respawn.

## Law Lion Ascendant
Fixed authority manifestation/individual; resolution persists. Replacement/succession requires explicit world-state logic.

## Fallen Saint
Fixed authority identity; fate persists. If killed/restored/exiled, the same person does not silently respawn.

## Concord Judge
Fixed authority office/identity for FCC purposes. If deposed/killed, institutional succession may create a successor state without silently resurrecting the same person.

## Pilgrim Star
Roaming variable authority/event foundation; route recurrence may be cyclical/seed-derived.

## Variable Boss Families
May recur through different individuals/offices where their foundation supports it.

---

# 72. Personhood and Political Bosses

A ruler, champion, saint, judge, construct intelligence or divine servant is not automatically a monster.

Encounter systems must respect:

- personhood;
- citizenship;
- political status;
- surrender;
- imprisonment;
- negotiation;
- succession;
- lawful/non-lawful authority;
- rehabilitation;
- alliance.

Killing a political authority can have:

- succession;
- legal;
- diplomatic;
- military;
- social

consequences.

---

# 73. Divine Hostility vs Void Corruption

The following are not automatic evidence of Void corruption:

- hostile deity;
- tyrannical ruler;
- unfair trial;
- harsh sacred law;
- doctrinal extremism;
- fallen saint;
- corrupted ordinary institution in the political sense;
- abandoned sanctuary;
- hostile Law Lion;
- malfunctioning Law Engine.

Void corruption requires actual Void provenance.

This distinction must exist in:

- mechanics;
- reward logic;
- dialogue;
- VFX;
- Codex;
- restoration.

FCC-05I owns detailed corruption states.

---

# 74. Corrupted Major Authorities

Void corruption uses state/variant treatment first.

A corrupted authority remains the same person/entity unless irreversible transformation establishes otherwise.

Potential effects may include:

- altered behaviour;
- changed law;
- contaminated territory;
- new hazard profile;
- corrupted abilities;
- altered political relationships.

A distinct new entity definition is justified only when irreversible transformation creates genuinely different identity/anatomy/system role.

---

# 75. Cleansing Major Authorities

Cleansing Void corruption does not automatically restore:

- old doctrine;
- old government;
- old institution;
- old relationship;
- old law;
- old settlement trust;
- old ecology.

Examples:

- a cleansed Fallen Saint may still oppose the institution;
- a cleansed Concord Judge may still be biased;
- a cleansed Law Lion Ascendant may still enforce a contested law;
- a repaired Choir may still prefer a new island order.

Restoration may create a new stable future rather than rewind history.

---

# 76. Dungeon Corruption

A dungeon may enter a Void-corrupted state.

Corruption may affect:

- terrain;
- gravity;
- routes;
- machines;
- records;
- guardians;
- law infrastructure;
- creatures;
- hazards.

Corruption is a state first.

Do not automatically create:

- Corrupted Skyfort;
- Corrupted Storm Temple;
- Corrupted Celestial Archive

as separate top-level dungeon families.

Irreversible transformation requires explicit later admission.

---

# 77. Deterministic Dungeon Placement

Dungeon placement must use deterministic suitability rules.

Possible inputs include:

- world seed;
- realm content version;
- altitude band;
- biome;
- landmass geometry;
- gravity profile;
- Windway graph;
- storm climate;
- settlement history;
- faction history;
- Divine Domain placement;
- abandoned-state history;
- authority territory;
- resource availability;
- portal/route accessibility;
- exclusion zones.

No seed must rely on one fixed dungeon coordinate.

Required progression must not be isolated without a valid route.

---

# 78. Dungeon Scale

Ascendant dungeon families may generate as:

- micro-site;
- standard dungeon;
- grand dungeon;
- megadungeon;
- mobile/shifting dungeon.

Examples:

- small Storm Temple = micro/standard;
- huge Fallen Airship Graveyard = grand/mobile;
- massive Law Engine complex = megadungeon;
- moving wreck field = mobile/shifting;
- multi-island Skyfort = grand.

Scale does not change family identity.

---

# 79. Moving and Shifting Dungeons

Ascendant Reach is particularly suitable for moving/shifting adventure spaces.

Examples:

- drifting wreck graveyard;
- Thunderhead Citadel moving with cloud sea;
- Skyfort on mobile island;
- route-dependent Pilgrimage Labyrinth;
- gravity-reoriented Underside Vault.

Position/access may change through saved state.

Discovered identity and internal progress must remain stable.

A shifting dungeon must not regenerate into a completely unrelated site every visit.

---

# 80. Authority Territory Suitability

Fixed and variable authorities should use territory suitability rather than fixed coordinates.

Examples:

- Tempest Leviathan → Thunderhead/Storm routes;
- Gravity Choir Sovereign → gravity/island infrastructure network;
- Law Lion Ascendant → Divine Domain/Law Garden/Concord territory;
- Fallen Saint → War-Saint/Abandoned Sanctuary/political territory;
- Concord Judge → Tribunal/Concordant institutional territory;
- Pilgrim Star → high celestial route graph;
- Thunder Roc → Storm Roc nesting/route territory;
- Sky-King Automaton → ancient Skyfort/Underside history;
- Thunder Marshal → active military/political territory.

---

# 81. Persistent Aftermath

Authority, dungeon and event outcomes may change:

- Windway route state;
- island altitude/position relationship;
- bridge alignment;
- storm exposure;
- cloud ecology;
- migration routes;
- settlement viability;
- settlement population;
- ownership;
- military control;
- pilgrimage access;
- Domain law;
- sanctuary state;
- Tribunal legitimacy;
- dungeon occupation;
- resource access;
- trade;
- faction relationships;
- corruption/restoration state.

Aftermath should be visible through:

- changed structures;
- changed routes;
- NPC memory;
- maps;
- Codex;
- trade;
- settlement behaviour;
- ecology;
- law markers;
- institutional records.

---

# 82. No Invisible Reset Rule

Ascendant adventure outcomes must not vanish merely because:

- player sleeps;
- player leaves the realm;
- game reloads;
- region unloads.

If a dungeon is cleared, claimed, damaged, restored or politically transferred, the authoritative state persists.

If a unique authority is killed, deposed, allied, cleansed or relocated, the world must remember.

---

# 83. Multiplayer Authority

In multiplayer, the authoritative host/server owns:

- dungeon state;
- guardian state;
- authority state;
- event state;
- major rewards;
- route aftermath;
- law outcome;
- settlement consequences.

All players must resolve against the same authoritative world state.

Encounter scaling may adjust:

- active add count;
- mechanic concurrency;
- timing windows;
- health/damage through universal combat rules.

It must not alter:

- authority identity;
- canonical outcome meaning;
- resource conservation;
- unique reward ownership;
- political truth;
- world-state result.

---

# 84. Contribution Beyond Damage

Multiplayer contribution should recognise support where systems allow, including:

- healing;
- rescue;
- navigation;
- engineering;
- grounding;
- repairs;
- evidence gathering;
- ritual;
- law interpretation;
- diplomacy;
- escort;
- settlement preparation;
- route stabilisation.

A player should not be excluded from meaningful participation solely because they dealt little direct damage.

---

# 85. Simulation LOD

Distant adventure content may use aggregate state.

Lower-end or distant simulation may reduce:

- active enemy count;
- detailed creature AI;
- weather VFX;
- distant moving geometry;
- crowd size;
- particle effects;
- animation complexity;
- off-screen guardian update rate.

It may not change authoritative:

- dungeon identity;
- guardian outcome;
- fixed authority outcome;
- event aftermath;
- route state;
- island state;
- ownership;
- settlement consequence;
- corruption;
- unique reward state.

---

# 86. Accessibility and Readability

Critical encounter information must not rely only on:

- colour;
- tiny floating symbols;
- high-frequency flashes;
- hidden theology;
- audio-only warnings;
- subtle particle changes.

Required support includes:

- text/icon or shape cues;
- readable route warnings;
- law statement display;
- commitment warning;
- retreat information;
- storm danger readability;
- gravity/orientation cues;
- archive/evidence clarity;
- non-colour charge indicators;
- reduced-flash mode;
- reduced-motion mode;
- captions/subtitles;
- scalable UI.

Sacred-law encounters must clearly communicate:

- applicable rule;
- boundary;
- current status;
- warning;
- violation;
- permitted recovery/appeal where known.

---

# 87. Encounter Fairness

Ascendant encounter danger may be severe, but should remain readable.

The adventure layer should avoid:

- untelegraphed random gust instant death;
- hidden law violations with no discoverable rule;
- irreversible commitment without warning;
- unavoidable settlement destruction;
- arbitrary confiscation/deletion of inventory;
- dialogue choices that secretly produce unrelated mechanical outcomes;
- one mandatory combat resolution when canon provides alternatives.

Surprise is allowed where authored, but must not violate save safety.

---

# 88. Art-Handoff — Dungeon Families

Later art governance should preserve distinct spatial/silhouette language.

## Skyfort
- exposed military silhouette;
- bridges/docks/towers;
- clear route and fall language.

## Storm Temple
- storm/grounding architecture;
- conductive paths;
- weather instruments;
- not automatically divine-white/gold.

## Fallen Airship Graveyard
- recognisable overlapping vessel hulls;
- unstable suspended debris;
- readable salvage/memorial states.

## Thunderhead Citadel
- architecture embedded within dense cloud/storm environment;
- sealed and exposed zones;
- strong non-colour storm warning.

## Underside Vault
- inverted/hanging architecture;
- anchor/gravity machinery;
- orientation clarity.

## Pilgrimage Labyrinth
- route/threshold markers;
- culturally diverse sacred architecture;
- declared-law readability.

## Law Engine
- functional law infrastructure;
- explicit boundary and state cues;
- machine/metaphysical hybrid identity.

## Celestial Archive
- monumental record storage;
- evidence/permission readability;
- distinct from ordinary Archive of Oaths civic structure.

---

# 89. Art-Handoff — Guardians

Guardian silhouettes must communicate role without implying species identity.

Examples:

- Skyfort Commander should read as command/fort authority rather than one mandatory ancestry.
- Storm Keeper should read as storm-site custodian without always being a priest.
- Wreckwarden should carry salvage/memorial/ship context.
- Thunder Custodian should read as storm/cloud-citadel systems authority.
- Vault Anchorite should reflect underside/gravity/anchor context.
- Pilgrim Adjudicator should communicate trial/route authority.
- Law Custodian should interface visibly with Law Engine systems.
- Archive Arbiter should communicate record/access authority.

Cultural variants may change clothing, body type, ancestry, equipment and architecture.

---

# 90. Art-Handoff — Fixed Authorities

## Tempest Leviathan
Must read as colossal world-scale storm-bearing entity and remain distinct from Cloudwhale.

## Gravity Choir Sovereign
Must support a distributed/choral/system-intelligence identity rather than default humanoid boss.

## Law Lion Ascendant
Must remain recognisably related to Law Lion while visually reading as an exceptional authority manifestation.

## Fallen Saint
Must support state/history variation and must not equate “fallen” with mandatory black/red evil corruption visual language.

## Concord Judge
Must communicate institutional/divine adjudicative authority without implying omnipotence or one universal religion.

---

# 91. Art-Handoff — Pilgrim Star

Pilgrim Star must read as a moving celestial entity/phenomenon whose route is visible at large scale.

Its visual language must support:

- awe;
- danger;
- pilgrimage;
- transformation;
- route prediction.

It must not be visually indistinguishable from:

- ordinary sun;
- portal;
- Void breach;
- generic spell projectile.

Reduced-flash/brightness accessibility must be supported.

---

# 92. Working Authority Registry

| Classification | Identity | Stable / Working ID | Status |
|---|---|---|---|
| Fixed Realm Authority | **Tempest Leviathan** | `boss.realm.aetheric.tempest_leviathan` | legacy ID preserved |
| Fixed Realm Authority | **Gravity Choir Sovereign** | `boss.realm.aetheric.gravity_choir_sovereign` | legacy ID preserved |
| Fixed Realm Authority | **Law Lion Ascendant** | `boss.realm.divine.law_lion_ascendant` | legacy ID preserved |
| Fixed Realm Authority | **Fallen Saint** | `boss.realm.ascendant.fallen_saint` | FCC-local working ID |
| Fixed Realm Authority | **Concord Judge** | `boss.realm.divine.covenant_judge` | legacy ID preserved; Covenant Judge legacy alias |
| Roaming Variable Authority/Event | **Pilgrim Star** | `boss.realm.divine.pilgrim_star` | legacy ID preserved |
| Faction Champion | **Skycourt Thunder Marshal** | `boss.realm.aetheric.thunder_marshal` | legacy ID preserved |
| Variable Creature Boss | **Thunder Roc** | Storm Roc-derived | not separate species |
| Unique/Rare Construct Boss | **Sky-King Automaton** | final ID deferred | variable foundation |
| Variable Regional Authority | **Storm Sovereign** | final ID deferred | variable foundation |
| Variable Divine Agent | **Law-Bound Herald** | final ID deferred | variable foundation |
| Variable Domain Authority | **Domain Sovereign** | final ID deferred | variable foundation |
| Crisis Framework | **Theological Crisis** | framework identity | not creature/person by default |

---

# 93. Source Reconciliation Register

| Earlier Direction | FCC-05H Resolution |
|---|---|
| Aetheric Reach has five dungeon families | preserved: Skyfort, Storm Temple, Fallen Airship Graveyard, Thunderhead Citadel, Underside Vault |
| Divine Concords has five dungeon families | Pilgrimage Labyrinth, Law Engine and Celestial Archive remain top-level; Trial Domain becomes framework; Abandoned Sanctuary becomes state |
| merged realm should keep all ten as equal | rejected |
| exactly eight final dungeon families | locked |
| one guardian per dungeon family | locked as eight role families |
| guardians must be killed | rejected |
| Trial Domain as fixed layout family | superseded by reusable framework/overlay |
| Abandoned Sanctuary as fixed layout family | superseded by domain/dungeon/site state |
| Tempest Leviathan | fixed realm authority; preserved stable ID |
| Gravity Choir Sovereign | fixed realm authority; preserved stable ID |
| Law Lion Ascendant | fixed realm authority; preserved stable ID; remains Law Lion-derived |
| Fallen Saint | fixed realm authority; source had no detailed stable ID; working FCC-local ID only |
| Concord/Covenant Judge | display canon Concord Judge; preserve `boss.realm.divine.covenant_judge`; Covenant Judge legacy alias |
| Pilgrim Star | roaming variable authority/event foundation; preserved stable ID |
| Thunder Roc | exceptional Storm Roc individual/title; not separate species |
| Sky-King Automaton | unique/rare ancient construct boss foundation; not fixed realm authority |
| Skycourt Thunder Marshal | faction/political boss foundation; preserve stable ID |
| storm sovereign | variable regional authority family |
| Law-Bound Herald | variable divine guardian/agent family |
| domain sovereign | variable Domain authority family |
| theological crisis | crisis/adventure framework, not one creature |
| every major authority must die | rejected |
| generic celestial loot pool | rejected |
| major authority kill as mandatory resource gate | rejected |
| blessings are one generic stat | rejected |
| relic is one material/tier | rejected |
| hostility means Void corruption | rejected |
| cleansing corruption resets everything | rejected |

---

# 94. Cross-Document Interfaces

## FCC-05A

Supplies:

- one merged realm;
- five macro-altitude bands;
- progression stages;
- fixed-authority roster;
- variable-authority snapshot;
- one Ascension Gate;
- universal death ownership exclusion.

## FCC-05B

Supplies:

- twelve biome families;
- Windways;
- hazard families;
- regional states;
- dungeon/authority/event environmental suitability;
- persistent environmental aftermath.

## FCC-05C

Supplies:

- material/resource provenance;
- no mandatory kill-only material gating;
- authority/dungeon resource boundaries.

## FCC-05D

Supplies:

- botanical ecology;
- agriculture;
- flora suitable for dungeon/event environments.

## FCC-05E

Supplies:

- creature roster;
- Storm Roc/Thunder Roc relationship;
- Law Lion/Law Lion Ascendant relationship;
- Tempest Leviathan not equal to Cloudwhale;
- creature-personhood/resource boundaries.

## FCC-05F

Supplies:

- civilisation/polity context;
- Wind Rights;
- settlement consequences;
- Tribunal/Court/institution context;
- personhood;
- political aftermath.

## FCC-05G

Supplies:

- physical structure identities;
- Archive of Oaths versus Celestial Archive distinction;
- Law Engine physical interfaces;
- reward Item/Block ownership;
- Ascension Gate content.

## FCC-05I

Owns:

- detailed Divine Domain state;
- sacred-law state transitions;
- corruption;
- cleansing;
- stabilisation;
- restoration;
- cross-realm dynamic interaction;
- authority/event state outputs.

## FCC-05J

Must certify:

- eight dungeon families;
- Trial Domain framework;
- Abandoned Sanctuary state;
- eight guardian families;
- five fixed realm authorities;
- stable-ID migration;
- Pilgrim Star;
- variable authority families;
- twelve events;
- reward provenance;
- persistent aftermath;
- no orphan boss hooks;
- art-handoff completeness.

---

# 95. FCC-05H Acceptance Gate

FCC-05H is ready for realm-local acceptance only when all of the following remain true.

## 95.1 Dungeon Families

1. exactly eight top-level dungeon families remain canonical;
2. Skyfort remains distinct from Thunderhead Citadel;
3. Storm Temple remains capable of non-divine storm/research identities;
4. Fallen Airship Graveyard retains salvage, instability, history and ownership;
5. Thunderhead Citadel depends on cloud/storm conditions;
6. Underside Vault depends on gravity/orientation/anchor conditions;
7. Pilgrimage Labyrinth depends on explicit route/permission/custom mechanics rather than hidden morality;
8. Law Engine remains bounded sacred-law infrastructure;
9. Celestial Archive remains precedent/evidence/access-oriented and not omniscient;
10. Trial Domain remains a reusable framework, not a ninth top-level family;
11. Abandoned Sanctuary remains a state, not a ninth top-level family;
12. every dungeon family contains a mechanic that would not function identically in an ordinary Overworld dungeon.

## 95.2 Guardians

13. exactly eight guardian roles remain locked;
14. guardian roles do not imply fixed species;
15. Skyfort Commander maps to Skyfort;
16. Storm Keeper maps to Storm Temple;
17. Wreckwarden maps to Fallen Airship Graveyard;
18. Thunder Custodian maps to Thunderhead Citadel;
19. Vault Anchorite maps to Underside Vault;
20. Pilgrim Adjudicator maps to Pilgrimage Labyrinth;
21. Law Custodian maps to Law Engine;
22. Archive Arbiter maps to Celestial Archive;
23. no guardian universally requires combat;
24. personhood is respected.

## 95.3 Fixed Authorities

25. exactly five fixed realm authorities remain;
26. Tempest Leviathan remains fixed and preserves `boss.realm.aetheric.tempest_leviathan`;
27. Gravity Choir Sovereign remains fixed and preserves `boss.realm.aetheric.gravity_choir_sovereign`;
28. Law Lion Ascendant remains fixed and preserves `boss.realm.divine.law_lion_ascendant`;
29. Law Lion Ascendant is not a separate principal creature species;
30. Fallen Saint remains fixed;
31. Fallen Saint's FCC-local working ID is not misrepresented as a legacy Atlas ID;
32. Concord Judge remains the final display name;
33. `boss.realm.divine.covenant_judge` remains preserved;
34. Covenant Judge remains a legacy display alias;
35. fixed authorities do not require killing for primary progression;
36. authority outcomes change meaningful world state.

## 95.4 Variable Authorities and Boss Foundations

37. Pilgrim Star remains a roaming variable authority/event foundation, not a sixth fixed authority;
38. `boss.realm.divine.pilgrim_star` remains preserved;
39. Thunder Roc remains an exceptional Storm Roc individual/title, not duplicate species;
40. Sky-King Automaton remains a unique/rare construct boss foundation;
41. Skycourt Thunder Marshal remains a faction/political foundation and preserves `boss.realm.aetheric.thunder_marshal`;
42. Storm Sovereign remains variable;
43. Law-Bound Herald remains variable;
44. Domain Sovereign remains variable;
45. Theological Crisis remains a crisis framework rather than one creature.

## 95.5 Events and Outcomes

46. exactly twelve event families remain locked;
47. events use bounded persistent state;
48. Cloudwhale Migration remains ecological first;
49. Domain Law Revision cannot override universal systems;
50. Pilgrim Star Passage remains connected to the Pilgrim Star foundation;
51. Void Breach requires genuine Void provenance;
52. event combinations are bounded;
53. persistent aftermath survives reload/unload;
54. dungeons may be restored, occupied, converted or re-used;
55. unique authority outcomes do not silently reset.

## 95.6 Rewards, Corruption and Universal Boundaries

56. rewards use provenance rather than generic celestial loot;
57. major progression does not require killing a fixed authority solely for mandatory material/capability;
58. blessings remain bounded named effects with provenance;
59. relic remains provenance/status category rather than one material/tier;
60. natural/divine hostility is distinct from Void corruption;
61. ordinary institutional corruption is distinct from Void corruption;
62. corruption uses state/variant treatment first;
63. cleansing does not automatically rewind doctrine, politics, relationships or ecology;
64. no adventure structure or authority owns universal death/respawn;
65. no dungeon/event creates a second normal realm portal path;
66. exact final loot/recipe quantities remain with FCC-05G/FCC-13.

## 95.7 Technical / Presentation

67. dungeon/authority placement is deterministic from seed + content version + saved state;
68. moving/shifting dungeons preserve identity/progress;
69. multiplayer uses authoritative shared world state;
70. support/non-damage contribution can matter;
71. low-end scaling does not change authoritative outcomes;
72. law, route, storm, gravity and commitment warnings have accessibility-safe presentation;
73. fixed and variable authorities receive visually distinct art-handoff identities;
74. Fallen Saint visual language does not equate “fallen” with mandatory Void corruption;
75. Pilgrim Star is visually distinct from portal/Void/sun phenomena;
76. final stable-ID namespace migration remains explicitly deferred rather than silently destructive.

**FCC-05H Status:** **REALM-LOCAL LOCK CANDIDATE — pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**
