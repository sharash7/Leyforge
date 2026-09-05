# Leyforge Final Content Canon Collection

## FCC-02H - Verdant Covenant Dungeons, Guardians, Authorities, Adventure Sites & Resolution Content

**Version:** 0.1  
**Status:** Content Canon - Realm Local Lock  
**Realm:** Verdant Covenant  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Depends On:** FCC-02A, FCC-02B, FCC-02C, FCC-02D, FCC-02E, FCC-02F, FCC-02G  
**Primary Upstream Sources Reconciled:** Foundation Documents 00-20; World Content Atlas Set 24, especially 24D, 24G and 24H; Post-Atlas Governance Set 25, especially 25F, 25G and 25I; later FCC interview decisions  
**Final Global Status:** Pending cross-realm reconciliation through FCC-01, FCC-12, FCC-13 and FCC-14.

---

# 1. Purpose

FCC-02H defines the complete realm-local adventure-content canon for the Verdant Covenant.

It owns the Verdant Covenant definitions for:

- the five canonical dungeon families;
- the five canonical dungeon guardian families;
- the three canonical realm authorities;
- Verdant adventure-site families that are not full dungeons;
- dungeon generation grammar and realm-local room identity;
- non-combat, mixed and combat resolution patterns;
- encounter-state variation caused by season, ecology, Court politics, Covenant law, blight and Void corruption;
- guardian encounter roles;
- authority encounter roles;
- alternative outcomes and world-state consequences;
- realm-local reward provenance;
- dungeon and authority resolution proof interfaces;
- adventure content relationships to settlements, structures, ecology and progression;
- bounded simulation requirements;
- deterministic generation requirements;
- low-end fallbacks;
- art-handoff requirements for dungeons, guardians, authorities and adventure sites.

FCC-02H does **not** redefine:

- universal combat rules;
- universal boss-health or encounter-runtime systems;
- universal AI scheduling;
- universal NPC dialogue;
- universal quest execution;
- universal reputation;
- universal faction simulation;
- universal loot-generation architecture;
- universal dungeon seed/runtime infrastructure;
- universal structure generation;
- universal pathfinding;
- universal saving/loading;
- universal multiplayer authority;
- universal status-effect implementation;
- universal portal travel;
- universal economy;
- universal item ownership;
- universal death/respawn;
- universal music, sound or VFX systems.

The governing rule is:

> **FCC-02H defines what Verdant adventure content exists, what it means, how it may resolve and what realm state it may affect; shared Leyforge systems execute those contracts.**

---

# 2. Canon Statement

Verdant Covenant dungeons and authorities are not a separate "combat world" layered over the realm.

They are consequences of the same systems already established in FCC-02A through FCC-02G:

- living terrain;
- seasonal state;
- Court politics;
- Covenant law;
- ecological health;
- hospitality;
- territorial recognition;
- material provenance;
- blight;
- rot;
- restoration;
- Void corruption;
- settlement history;
- realm infrastructure.

A Verdant dungeon may contain combat, but combat is not the definition of a dungeon.

A Verdant guardian may be fought, but a guardian is not automatically an enemy.

A Verdant authority may become a boss encounter, but an authority is not defined as a creature that exists only to be killed.

The realm must support:

- confrontation;
- avoidance;
- stealth;
- investigation;
- repair;
- ritual;
- navigation;
- ecology;
- diplomacy;
- negotiation;
- fulfilment of obligations;
- rewriting or restoring a Covenant;
- cleansing;
- controlled decay;
- containment;
- succession;
- rescue;
- restitution;
- alliance;
- combat where appropriate.

The final rule is:

> **Verdant adventure content should ask the player to understand a living place, not merely clear it.**

---

# 3. Ownership and Interface Contract

## 3.1 FCC-02H Owns

FCC-02H owns:

1. dungeon-family identity;
2. guardian-family identity;
3. realm-authority identity;
4. Verdant-specific encounter-state inputs;
5. Verdant-specific resolution categories;
6. world-state consequences that originate from Verdant adventure content;
7. realm-local adventure-site archetypes;
8. authority-resolution provenance requirements;
9. Verdant dungeon reward categories;
10. adventure-content art requirements.

## 3.2 FCC-02H Consumes

FCC-02H consumes:

- realm laws from FCC-02A;
- biome and hazard rules from FCC-02B;
- material provenance from FCC-02C;
- flora and ecological-state rules from FCC-02D;
- creature ecology from FCC-02E;
- civilisation, Court, settlement and structure definitions from FCC-02F;
- Blocks, Items, recipes and portal construction from FCC-02G;
- universal combat;
- universal quest/event systems;
- universal faction and reputation systems;
- universal world-state persistence;
- universal encounter spawning;
- universal rewards;
- universal AI;
- universal accessibility;
- universal difficulty;
- universal multiplayer;
- universal save/load.

## 3.3 Prohibited Ownership Drift

FCC-02H must not:

- redefine the Seasonal Courts as one faction;
- define generic death/respawn behaviour;
- create a second portal-access path into Verdant Covenant;
- convert Dreaming Root Depths into a Somnolent Expanse portal;
- treat natural rot as Void corruption;
- treat all blight as Void corruption;
- make all guardians hostile;
- require killing all authorities;
- duplicate items owned by FCC-02G;
- add universal combat or quest rules;
- introduce unlimited procedural "boss species";
- create hidden extra major biomes;
- create material families solely to reward dungeon completion.

---

# 4. Canon Adventure Roster

The Verdant Covenant realm-local adventure roster is bounded as follows.

## 4.1 Canonical Dungeon Families

| Dungeon Family | Stable ID | Canon Status |
|---|---|---|
| Living Palace Roots | `dungeon.realm.verdant.living_palace_roots` | Locked |
| Broken Covenant Gardens | `dungeon.realm.verdant.broken_covenant_gardens` | Locked |
| Thorn-Hunt Labyrinth | `dungeon.realm.verdant.thorn_hunt` | Locked |
| Rot-Heart Grove | `dungeon.realm.verdant.rot_heart` | Locked |
| Seasonal Vaults | `dungeon.realm.verdant.seasonal_vaults` | Locked |

These five are the authoritative Verdant dungeon families.

The realm does not require one full dungeon family per biome.

A dungeon family may appear in more than one compatible biome where generation constraints permit.

## 4.2 Canonical Guardian Families

| Guardian Family | FCC Realm-Local ID | Primary Dungeon |
|---|---|---|
| Palace Rootwarden | `guardian.realm.verdant.palace_rootwarden` | Living Palace Roots |
| Covenant Gardener | `guardian.realm.verdant.covenant_gardener` | Broken Covenant Gardens |
| Thorn-Hunt Beast | `guardian.realm.verdant.thorn_hunt_beast` | Thorn-Hunt Labyrinth |
| Rotheart Keeper | `guardian.realm.verdant.rotheart_keeper` | Rot-Heart Grove |
| Seasonal Sentinel | `guardian.realm.verdant.seasonal_sentinel` | Seasonal Vaults |

These IDs are FCC realm-local candidates and remain subject to FCC-13/FCC-14 stable-ID reconciliation.

Guardian families are encounter roles with controlled variants.

They are not five additional realm authorities.

## 4.3 Canonical Realm Authorities

| Realm Authority | Stable ID | Canon Status |
|---|---|---|
| Seasonal Regent | `boss.realm.verdant.seasonal_regent` | Locked |
| Rot-Crowned Hart | `boss.realm.verdant.rot_crowned_hart` | Locked |
| Oathbreaker Thorn | `boss.realm.verdant.oathbreaker_thorn` | Locked |

These three are the fixed realm-scale authority roster.

Additional challenge may come from:

- Court champions;
- faction leaders;
- elite creatures;
- dungeon guardians;
- event bosses;
- temporary blight entities;
- severe Void transformations;
- local sovereign conflicts.

Those do not automatically become additional fixed realm authorities.

---

# 5. Verdant Dungeon Grammar Contract

Every generated Verdant dungeon instance must be describable by a deterministic grammar.

A minimum dungeon descriptor must include:

- `dungeon_family`;
- `world_seed`;
- `realm_seed`;
- `instance_seed`;
- `biome_context`;
- `season_state`;
- `court_context`;
- `covenant_state`;
- `ecological_health`;
- `blight_state`;
- `void_corruption_state`;
- `guardian_profile`;
- `resolution_profile`;
- `reward_provenance_profile`;
- `access_state`;
- `restoration_state`;
- `completed_state`.

Optional descriptors may include:

- local settlement history;
- responsible Court;
- historical oath;
- displaced population;
- active predator pressure;
- living-river influence;
- Moonroot resonance;
- Dreaming Root resonance;
- migration event;
- restoration project;
- authority influence.

The grammar must remain deterministic from authoritative state.

No dungeon may depend on uncontrolled generative text or unbounded AI to establish its topology or completion logic.

---

# 6. Shared Dungeon State Axes

All five Verdant dungeon families may consume a bounded subset of the following state axes.

## 6.1 Season State

Allowed top-level seasonal states:

- Spring;
- Summer;
- Autumn;
- Winter;
- mixed convergence;
- unstable convergence.

Season may influence:

- room routes;
- local growth;
- resource availability;
- creature populations;
- guardian ability profile;
- environmental hazards;
- visual state;
- Court access;
- puzzle configuration;
- restoration target.

Season should not rebuild the entire dungeon every simulation tick.

State changes are applied:

- on generation;
- on meaningful seasonal transition;
- on authority outcome;
- on major quest/event transition;
- on player-triggered seasonal mechanics.

## 6.2 Court State

Court state may be:

- recognised;
- allied;
- neutral;
- disputed;
- hostile;
- unclaimed;
- abandoned;
- succession-contested.

Court state may alter:

- legal access;
- patrols;
- hospitality;
- guardian stance;
- NPC presence;
- available resolutions;
- reward authority;
- structure condition.

## 6.3 Covenant State

Covenant state may be:

- intact;
- strained;
- disputed;
- broken;
- rewritten;
- restored;
- unknown;
- deliberately voided.

A Covenant state must derive from authored/systemic contracts.

The game must not parse arbitrary player chat or NPC prose as binding promises.

## 6.4 Ecological State

Ecological state may be:

- thriving;
- stable;
- stressed;
- damaged;
- recovering;
- collapsed.

This state may affect:

- flora;
- creature density;
- available restoration actions;
- dungeon hazards;
- Rotheart content;
- resource regeneration;
- settlement response.

## 6.5 Natural Rot State

Natural rot is a normal ecological process.

Valid states include:

- absent;
- balanced;
- abundant;
- locally dominant;
- decompositional surge.

Natural rot is not automatically a hostile condition.

## 6.6 Blight State

Blight is ecological or magical dysfunction.

Valid states include:

- absent;
- local;
- spreading;
- severe;
- contained;
- recovering.

Blight may be caused by:

- ecological imbalance;
- overharvest;
- failed maintenance;
- invasive organisms;
- magical disruption;
- damaged infrastructure;
- Court conflict;
- external contamination.

## 6.7 Void Corruption State

Void corruption is a separate contamination class.

Valid states include:

- none;
- trace;
- active;
- severe;
- irreversible transformation.

Void corruption may exploit damaged environments but is not produced by ordinary rot or blight.

---

# 7. Room and Encounter Module Rules

Dungeon families may assemble from modules, but modules remain family-specific.

A module may provide:

- traversal;
- combat;
- ecology;
- negotiation;
- puzzle;
- ritual;
- resource extraction;
- restoration;
- evidence;
- rescue;
- settlement interaction;
- guardian encounter;
- authority encounter;
- reward;
- transition.

A generated dungeon should avoid meaningless room repetition.

A valid dungeon graph should normally include:

1. approach;
2. threshold;
3. identity-establishing space;
4. escalating complication;
5. one or more optional branches;
6. evidence or contextualisation;
7. guardian or equivalent gate;
8. resolution space;
9. consequence/reward space;
10. return route or transformed exit state.

Short instances may compress these functions.

Large instances may repeat them in distinct wings.

---

# 8. Non-Combat Resolution Contract

A non-combat solution must not mean "press dialogue button to skip gameplay."

A meaningful non-combat resolution may require:

- locating evidence;
- discovering a true historical condition;
- restoring a damaged mechanism;
- repairing ecological systems;
- transporting a required material;
- winning access from a Court;
- satisfying hospitality;
- fulfilling a recognised promise;
- navigating a route correctly;
- performing a ritual;
- stabilising seasonal state;
- cleansing blight;
- containing corruption;
- rescuing trapped inhabitants;
- surrendering or returning stolen property;
- replacing a harmful structure;
- supporting a succession;
- sacrificing an opportunity rather than an NPC;
- accepting controlled decay;
- negotiating competing claims.

The amount of work should be comparable to the importance of the outcome.

Non-combat solutions may be easier or harder than fighting depending on player preparation and world state.

---

# 9. Combat Resolution Contract

Combat remains a fully valid resolution where appropriate.

Combat may occur because:

- a guardian judges the player hostile;
- negotiation fails;
- the player deliberately challenges authority;
- a creature is predatory;
- a corrupted entity is no longer communicative;
- a Court has declared the player an intruder;
- an event creates immediate danger;
- a boss elects to fight;
- the player chooses force.

Combat must not automatically erase:

- political consequences;
- ecological consequences;
- succession consequences;
- legal consequences;
- structural damage;
- unresolved history.

Defeating an encounter is not always equivalent to solving the underlying problem.

---

# 10. Living Palace Roots

**Stable ID:** `dungeon.realm.verdant.living_palace_roots`

## 10.1 Canon Identity

Living Palace Roots are Court-grown palace and root complexes formed:

- beneath colossal trees;
- inside Greatheart root systems;
- around ancient living architecture;
- beneath Court estates;
- around Crowned World-Tree works.

Rooms can retain bounded recognition of:

- hospitality;
- rank;
- permission;
- nourishment;
- oath status;
- seasonal law.

The complex is a living structure, not a sentient omniscient dungeon.

## 10.2 Primary Biome Affinity

Strongest affinity:

- Sunlit Canopy;
- Moonroot Groves;
- Seasonal Nexus.

Secondary placement may occur where major living Court architecture is justified.

## 10.3 Core Themes

- hospitality;
- authority;
- living architecture;
- inherited law;
- succession;
- maintenance;
- forgotten permissions;
- growth;
- Court history.

## 10.4 Approach Modules

Possible approaches include:

- root bridge;
- Court garden;
- sealed trunk doorway;
- buried root stair;
- abandoned reception grove;
- seasonal gate court;
- embassy approach;
- collapsed living corridor.

## 10.5 Threshold Modules

Thresholds may test:

- recognised identity;
- invitation;
- Court permission;
- hospitality status;
- possession of a legitimate token;
- repair of a damaged entrance;
- seasonal alignment.

A threshold must always have at least one viable path appropriate to the generated instance.

## 10.6 Interior Module Families

Canonical interior families:

- Reception Root;
- Nourishment Hall;
- Living Gallery;
- Oath Chamber;
- Root Archive;
- Seasonal Courtroom;
- Service Vein;
- Growth Nursery;
- Steward Passage;
- Rootwell;
- Forgotten Guest Wing;
- Living Armory;
- Palace Heart;
- Guardian Court.

Not all appear in every instance.

## 10.7 Living Route Behaviour

Routes may:

- open;
- close;
- regrow;
- reveal alternate paths;
- harden;
- soften;
- bridge gaps;
- retract hazards.

Route changes must be discrete state transitions, not continuous expensive topology simulation.

## 10.8 Palace Rootwarden

Primary guardian family:

**Palace Rootwarden**

The Rootwarden may be:

- a grown guardian body;
- a root-bound construct;
- a Court-appointed living sentinel;
- an ancient steward organism.

It may recognise:

- Court legitimacy;
- authorised guests;
- restored hospitality;
- valid maintenance roles;
- hostile intrusion.

## 10.9 Guardian Resolutions

Possible Rootwarden resolutions:

- prove permission;
- restore a damaged hospitality marker;
- obtain Court recognition;
- repair palace systems;
- return stolen material;
- calm ecological stress;
- duel;
- defeat;
- temporarily disable;
- redirect.

## 10.10 Completion Outcomes

Possible instance outcomes:

- palace restored;
- Court claim restored;
- Court claim invalidated;
- neutral access established;
- palace abandoned safely;
- palace transferred to another claimant;
- palace sealed;
- palace damaged;
- palace corrupted;
- palace liberated from corruption.

## 10.11 Rewards

Valid reward families:

- Court permission;
- archive knowledge;
- living-construction knowledge;
- specialist grown components;
- legitimate salvage;
- maintenance rights;
- rare seeds;
- Living Heartwood grant where justified;
- Bloomstone stabilisation components;
- structure blueprint knowledge;
- authority evidence.

No reward requires stripping a living palace indiscriminately.

---

# 11. Broken Covenant Gardens

**Stable ID:** `dungeon.realm.verdant.broken_covenant_gardens`

## 11.1 Canon Identity

Broken Covenant Gardens are treaty, hospitality or diplomatic gardens whose original social/ecological contract has failed.

Failure may derive from:

- betrayal;
- abandonment;
- disputed witnesses;
- changed political borders;
- forgotten obligations;
- dead or absent signatories;
- corrupted records;
- damaged boundary stones;
- ecological collapse;
- incompatible successor claims.

The dungeon is not automatically a Void-corrupted garden.

## 11.2 Primary Biome Affinity

Strongest affinity:

- Moonroot Groves;
- Pollenwild Meadows;
- Thorn-Court Marches;
- Seasonal Nexus.

## 11.3 Core Themes

- evidence;
- witnesses;
- boundaries;
- diplomacy;
- stewardship;
- repair;
- competing truths;
- consequences of promises.

## 11.4 Core Module Families

- Treaty Walk;
- Witness Grove;
- Boundary Stone Court;
- Broken Fountain;
- Divided Orchard;
- Overgrown Embassy;
- Disputed Path;
- Memorial Bed;
- Gardener Lodge;
- Oath Record Arbor;
- Reconciliation Circle;
- Sealed Root Gate;
- Guardian Conservatory.

## 11.5 Path Behaviour

Paths may respond to:

- recognised witness evidence;
- possession of stolen objects;
- restored boundary markers;
- Court support;
- Covenant status;
- current season.

The game must present readable cues for why a path changes.

## 11.6 Covenant Gardener

Primary guardian family:

**Covenant Gardener**

The Gardener is a maintenance/guardianship role.

Possible forms:

- humanoid plant caretaker;
- root-and-tool construct;
- bound horticultural spirit;
- ancient autonomous gardener organism.

The Gardener may oppose the player if it concludes that:

- the player threatens the garden;
- the player lacks standing;
- the player carries stolen material;
- the player supports a destructive claimant.

## 11.7 Guardian Resolutions

Possible resolutions:

- restore the garden;
- prove standing;
- present witness evidence;
- repair boundary stones;
- resolve an invasive species;
- fulfil maintenance obligations;
- reassign stewardship;
- defeat the Gardener;
- contain a malfunctioning Gardener.

## 11.8 Completion Outcomes

- Covenant restored;
- Covenant rewritten;
- Covenant dissolved legitimately;
- stewardship transferred;
- neutral garden established;
- garden reclaimed by ecology;
- garden sealed;
- garden remains disputed;
- corruption removed;
- destructive claimant empowered.

## 11.9 Rewards

- legal/diplomatic proof;
- Pact standing;
- Court access;
- horticultural knowledge;
- Memory Seed encoding knowledge;
- specialised botanical goods;
- restoration recipes;
- living-architecture blueprints;
- legitimate salvage.

---

# 12. Thorn-Hunt Labyrinth

**Stable ID:** `dungeon.realm.verdant.thorn_hunt`

## 12.1 Canon Identity

The Thorn-Hunt Labyrinth is a moving hedge and thorn wilderness used for:

- ritual hunt;
- initiation;
- punishment;
- territorial testing;
- predator ecology;
- Court competition;
- disputed rule enforcement.

It is not an infinite maze.

It is a deterministic bounded dungeon whose path state may change at authored transition points.

## 12.2 Primary Biome Affinity

Primary:

- Thorn-Court Marches.

Secondary:

- Seasonal Nexus;
- Pollenwild border regions;
- Rotwild boundary regions.

## 12.3 Core Themes

- pursuit;
- territory;
- consent to the hunt;
- rule interpretation;
- predation;
- endurance;
- tracking;
- escape;
- honour;
- Court spectacle.

## 12.4 Hunt Contract

A generated Thorn-Hunt instance must define whether the player is:

- participant;
- quarry;
- hunter;
- rescuer;
- intruder;
- mediator;
- investigator.

The game must not assume every player entered voluntarily.

## 12.5 Core Module Families

- Thorn Threshold;
- Hunter's Mark;
- Scent Trail;
- Blind Hedge;
- Elevated Root Watch;
- Predator Clearing;
- False Refuge;
- Court Observation Grove;
- Hunt Shrine;
- Abandoned Quarry Camp;
- Living Gate;
- Thorn Tunnel;
- Guardian Den;
- Final Hunt Circle.

## 12.6 Route Reconfiguration

The Labyrinth may alter routes based on:

- hunt phase;
- Court rules;
- seasonal state;
- player mark/status;
- completed objectives;
- guardian movement.

Reconfiguration must use prevalidated route sets.

No uncontrolled maze rewriting is allowed.

## 12.7 Thorn-Hunt Beast

Primary guardian family:

**Thorn-Hunt Beast**

The Beast may represent:

- trained Court guardian;
- wild apex predator;
- ritual quarry;
- ancient territorial organism.

The Beast must remain distinct from the ordinary Thornbound Hunter creature species.

## 12.8 Guardian Resolutions

- complete the hunt lawfully;
- evade;
- track and tag;
- rescue the quarry;
- prove the hunt invalid;
- redirect the Beast;
- calm;
- relocate;
- defeat;
- kill where justified.

## 12.9 Completion Outcomes

- initiation completed;
- punishment survived;
- Court challenge won;
- hunt exposed as illegitimate;
- prisoner rescued;
- predator relocated;
- territory reopened;
- territory closed;
- Court relations altered.

## 12.10 Rewards

- Court recognition;
- legal hunting access;
- specialist tracking knowledge;
- Thornsilver goods;
- Wardthorn material;
- trophy only where provenance permits;
- movement/navigation knowledge;
- route permission;
- faction standing.

---

# 13. Rot-Heart Grove

**Stable ID:** `dungeon.realm.verdant.rot_heart`

## 13.1 Canon Identity

Rot-Heart Grove is a living dungeon where decay, ecological stress, blight and possible corruption have become concentrated.

The generated instance must distinguish:

1. natural rot;
2. ecological blight;
3. magical dysfunction;
4. Void corruption.

These states may coexist but are not interchangeable.

## 13.2 Primary Biome Affinity

Primary:

- Rotwilds.

Secondary:

- damaged Sunlit Canopy;
- damaged Living Riverlands;
- blighted Moonroot zones;
- damaged Seasonal Nexus.

## 13.3 Core Themes

- decomposition;
- ecological necessity;
- disease;
- immune response;
- restoration;
- quarantine;
- invasive growth;
- overcorrection;
- controlled decay;
- corruption detection.

## 13.4 Core Module Families

- Decay Threshold;
- Fungal Gallery;
- Quarantine Root;
- Caretaker Station;
- Rot Pool;
- Blight Vein;
- Immune Chamber;
- Fallen Nursery;
- Cleansing Channel;
- Decomposer Nest;
- Invasive Growth Hall;
- Void Scar Pocket, only when applicable;
- Rotheart Chamber;
- Keeper Grove.

## 13.5 Instance Diagnosis

A valid Rot-Heart Grove must expose enough evidence for the player to diagnose the dominant problem.

Diagnostic clues may include:

- flora;
- creature behaviour;
- material state;
- caretaker records;
- fungal distribution;
- blight spread;
- Void signatures;
- damaged infrastructure;
- seasonal mismatch.

## 13.6 Rotheart Keeper

Primary guardian family:

**Rotheart Keeper**

The Keeper is responsible for maintaining a viable relationship between:

- growth;
- decay;
- nutrient cycling;
- disease control;
- quarantine.

The Keeper may itself be:

- healthy;
- overcorrecting;
- blighted;
- damaged;
- Void-corrupted.

## 13.7 Guardian Resolutions

- restore nutrient balance;
- remove invasive organisms;
- provide decomposer ecology;
- repair cleansing channels;
- accept controlled decay;
- isolate blight;
- cleanse Void contamination;
- contain irreversible corruption;
- negotiate with caretakers;
- defeat the Keeper if necessary.

## 13.8 Completion Outcomes

- balanced decay restored;
- blight contained;
- ecosystem restored;
- decay deliberately expanded;
- quarantine maintained;
- Grove abandoned;
- corruption sealed;
- corruption cleansed;
- corrupted Grove destroyed;
- valuable but dangerous ecology accepted.

## 13.9 Rewards

- restoration knowledge;
- anti-blight recipes/components;
- Rootcap/Rotcap ecological knowledge;
- specialist compost/fertility resources;
- controlled Rotwood-state knowledge;
- Bloomstone restoration components;
- legitimate salvage;
- corrupted material only when irreversible transformation actually occurred.

---

# 14. Seasonal Vaults

**Stable ID:** `dungeon.realm.verdant.seasonal_vaults`

## 14.1 Canon Identity

Seasonal Vaults are a network of protected storage, ritual, archive and resource chambers whose:

- entrances;
- rooms;
- resources;
- guardians;
- route permissions

may shift with season and Court authority.

They are one dungeon family, not four separate dungeon families.

## 14.2 Primary Biome Affinity

Primary:

- Seasonal Nexus.

Secondary:

- major Court territories;
- Sunlit Canopy;
- Moonroot Groves;
- Thorn-Court Marches.

## 14.3 Core Themes

- stewardship;
- season;
- timing;
- stored abundance;
- succession;
- controlled scarcity;
- preservation;
- Court legitimacy.

## 14.4 Core Module Families

- Seasonal Threshold;
- Spring Chamber;
- Summer Chamber;
- Autumn Chamber;
- Winter Chamber;
- Mixed Convergence Chamber;
- Steward Archive;
- Climate Lock;
- Seed Vault;
- Season Sap Reservoir;
- Court Treasury;
- Migration Record Hall;
- Guardian Rotunda;
- Convergence Heart.

## 14.5 Seasonal Chamber Rules

Seasonal chambers may change:

- access;
- hazard;
- flora;
- resource state;
- guardian profile;
- traversal.

A chamber's layout must use a bounded set of variants.

## 14.6 Seasonal Sentinel

Primary guardian family:

**Seasonal Sentinel**

The Sentinel may be:

- living construct;
- Court-made guardian;
- season-attuned organism;
- multi-form sentinel.

A Sentinel may change ability/state by season without becoming four separate creature definitions.

## 14.7 Guardian Resolutions

- arrive during the correct season;
- present Court permission;
- restore seasonal balance;
- retune a seasonal mechanism;
- prove stewardship;
- complete a seasonal trial;
- defeat;
- bypass via legitimate maintenance access.

## 14.8 Completion Outcomes

- vault reopened;
- vault resealed;
- stewardship transferred;
- missing season restored;
- seasonal stock redistributed;
- Court claim changed;
- migration restored;
- convergence stabilised;
- vault corrupted/cleansed.

## 14.9 Rewards

- rare seeds;
- seasonal cultivation knowledge;
- Season Sap access;
- climate catalysts represented through existing materials/states;
- Court proof;
- specialist preservation items;
- Bloomstone tuning knowledge;
- archival knowledge;
- migration-route data.

---

# 15. Dungeon Guardian Family Contract

Dungeon guardians are a reusable class of major encounter.

They are not necessarily unique individuals.

A guardian family may have:

- seasonal visual variants;
- Court variants;
- healthy/blighted/corrupted states;
- elite states;
- age/size variants;
- seed-specific cosmetic variation.

A guardian family must preserve:

- recognisable silhouette;
- role;
- primary mechanical identity;
- material/ecological provenance.

Guardians should not receive arbitrary colour swaps unrelated to material/state.

---

# 16. Palace Rootwarden

## 16.1 Role

Protects:

- palace thresholds;
- Court spaces;
- hospitality systems;
- living architectural hearts.

## 16.2 Mechanical Identity

Potential encounter mechanics:

- root barriers;
- living-wall manipulation;
- restraint rather than pure damage;
- hospitality-state checks;
- regeneration while connected to healthy roots;
- opening/closing routes;
- Court-linked reinforcements.

## 16.3 Counterplay

- sever or calm hostile root links;
- restore recognised permissions;
- move through maintenance paths;
- use ecological knowledge;
- combat.

---

# 17. Covenant Gardener

## 17.1 Role

Maintains:

- treaty gardens;
- boundaries;
- witness plants;
- memorial beds;
- ecological balance.

## 17.2 Mechanical Identity

Potential mechanics:

- growth zones;
- pruning/repair cycles;
- boundary wards;
- plant summons using existing flora;
- nonlethal entanglement;
- environment restoration.

## 17.3 Counterplay

- repair instead of destroy;
- present evidence;
- fix boundaries;
- restore damaged species;
- combat.

---

# 18. Thorn-Hunt Beast

## 18.1 Role

Functions as:

- ritual predator;
- territorial guardian;
- Court hunt enforcer;
- apex challenge.

## 18.2 Mechanical Identity

Potential mechanics:

- tracking;
- scent/mark response;
- charge;
- ambush;
- thorn-armour interaction;
- route pressure.

## 18.3 Counterplay

- break tracking;
- exploit terrain;
- satisfy hunt objective;
- relocate;
- calm;
- combat.

---

# 19. Rotheart Keeper

## 19.1 Role

Maintains decomposition and quarantine balance.

## 19.2 Mechanical Identity

Potential mechanics:

- rot zones;
- cleansing pulses;
- fungal control;
- blight containment;
- self-repair through healthy decomposition;
- state changes after diagnosis.

## 19.3 Counterplay

- restore ecology;
- redirect decomposers;
- cleanse contamination;
- repair channels;
- combat.

---

# 20. Seasonal Sentinel

## 20.1 Role

Protects seasonal storage and convergence infrastructure.

## 20.2 Mechanical Identity

Potential profiles:

**Spring**
- regrowth;
- mobility;
- entangling renewal.

**Summer**
- radiant pressure;
- rapid activity;
- heat/light interaction.

**Autumn**
- shedding;
- resource redistribution;
- weakening/harvest mechanics.

**Winter**
- slowing;
- preservation;
- hardened defence.

These are one guardian family with seasonal state.

## 20.3 Counterplay

- seasonal tuning;
- correct timing;
- permission;
- environmental adaptation;
- combat.

---

# 21. Realm Authority Contract

Realm authorities represent powers whose resolution can alter persistent realm state.

An authority is not required to be:

- evil;
- permanently hostile;
- biologically monstrous;
- unique by species;
- killed for progression.

Authority encounters must support multiple outcomes when compatible with generated state.

Authority outcomes may alter:

- Court legitimacy;
- season;
- borders;
- migration;
- ecology;
- blight;
- routes;
- living structures;
- settlements;
- diplomacy;
- resource access;
- portal timing/conditions where the universal portal system permits.

No authority outcome may delete the canonical Covenant Portal as the normal realm-access method.

---

# 22. Seasonal Regent

**Stable ID:** `boss.realm.verdant.seasonal_regent`

## 22.1 Canon Identity

The Seasonal Regent is a realm-scale **office/title** associated with stewardship of seasonal succession.

The current Regent may be:

- elected;
- appointed;
- inherited;
- chosen by ritual;
- recognised by multiple Courts;
- disputed;
- vacant.

The office is not one immortal species.

## 22.2 Authority Scope

The Regent may influence:

- seasonal transitions;
- convergence timing;
- migration;
- Court diplomacy;
- seasonal infrastructure;
- crop timing;
- selected realm routes;
- realm-wide restoration programmes.

The Regent does not directly simulate every local weather event.

## 22.3 Encounter Preconditions

A Regent storyline may trigger through:

- missing season;
- failed succession;
- disputed appointment;
- seasonal imbalance;
- Court conflict;
- corrupted seasonal infrastructure;
- Regent abuse of office;
- external interference.

## 22.4 Resolution Families

Canonical resolution families:

- support succession;
- challenge succession;
- restore missing season;
- uphold existing oath;
- amend governing Covenant;
- expose illegitimate rule;
- negotiate reform;
- depose;
- duel;
- fight;
- replace office-holder.

## 22.5 Persistent Outcomes

Possible persistent changes:

- season-cycle stability;
- Court legitimacy;
- migration routes;
- farming bonuses/penalties;
- seasonal hazard frequency;
- Seasonal Vault access;
- Court diplomacy;
- Living Conduit infrastructure;
- portal activation timing modifiers where allowed by portal runtime.

## 22.6 Reward Interface

Existing authority item-family continuity:

**Seasonal Regent Resolution Token Family**

The resolution token is not automatically a physical trophy taken from a body.

It may represent:

- signed recognition;
- Court seal;
- ritual proof;
- crafted insignia;
- succession record;
- magical attestation.

Exact executable item definition is reconciled in FCC-13.

---

# 23. Rot-Crowned Hart

**Stable ID:** `boss.realm.verdant.rot_crowned_hart`

## 23.1 Canon Identity

The Rot-Crowned Hart is an ancient sacred guardian carrying uncontrolled decay through living roads, Court territories and ecological networks.

It is not inherently Void-corrupted.

Its crisis may derive from:

- ecological imbalance;
- uncontrolled decomposition;
- blight;
- injury;
- failed containment;
- damaged seasonal cycle;
- external corruption.

## 23.2 Relationship to Oathstag

The Rot-Crowned Hart is not simply a colour variant of an Oathstag.

It is a distinct realm authority.

It may share distant symbolic or biological motifs with Verdant cervid life, but its authority identity, scale and encounter role are unique.

## 23.3 Encounter Preconditions

Possible triggers:

- rot spreading beyond balanced ecology;
- Court attempts to exterminate necessary decay;
- failed restoration;
- blight outbreak;
- Rotwild expansion;
- corrupted caretaker system;
- Hart entering settlement routes.

## 23.4 Resolution Families

Canonical options:

- cure;
- separate harmful blight from necessary decay;
- accept and redirect controlled decay;
- restore ecological role;
- relocate;
- contain;
- protect from destructive factions;
- kill.

## 23.5 Persistent Outcomes

Potential changes:

- Rotwild ecology;
- decomposition rates;
- blight prevalence;
- living-road safety;
- Court politics;
- restoration-enclave viability;
- access to controlled decay resources;
- cultural interpretation of rot.

## 23.6 Reward Interface

Existing authority item-family continuity:

**Rot-Crowned Hart Resolution Token Family**

The proof must encode outcome provenance.

A cure outcome and a kill outcome must not produce indistinguishable records.

---

# 24. Oathbreaker Thorn

**Stable ID:** `boss.realm.verdant.oathbreaker_thorn`

## 24.1 Canon Identity

Oathbreaker Thorn is an ancient defensive living power shaped by generations of broken Covenant obligations.

It is a living fortress/guardian power, not merely a giant hostile plant.

Its current behaviour may reflect:

- accumulated unresolved obligations;
- contradictory Court claims;
- invalid successor assumptions;
- deliberate weaponisation;
- damaged Identity Law;
- territorial collapse.

## 24.2 Encounter Preconditions

Possible triggers:

- sealed border;
- failed treaty;
- inherited conflict;
- disputed land;
- corrupted archive;
- settlement trapped behind defensive growth;
- Court weaponisation.

## 24.3 Investigation Layer

A complete Oathbreaker Thorn encounter should permit discovery of:

- original Covenant;
- parties;
- witnesses;
- changed circumstances;
- broken clauses;
- valid successor claims;
- deliberate manipulation.

The player should be able to understand why the Thorn exists.

## 24.4 Resolution Families

Canonical options:

- reconcile parties;
- fulfil original obligation;
- rewrite Covenant;
- establish successor agreement;
- invalidate fraudulent claim;
- contain;
- redirect defence;
- burn/destroy;
- fight.

## 24.5 Persistent Outcomes

Possible changes:

- borders;
- Court legitimacy;
- settlement access;
- contract norms;
- living architecture behaviour;
- diplomacy;
- trade routes;
- defensive infrastructure.

## 24.6 Reward Interface

Existing authority item-family continuity:

**Oathbreaker Thorn Resolution Token Family**

Outcome proof may be:

- rewritten Covenant record;
- Court recognition;
- thorn seal;
- living sigil;
- crafted attestation.

---

# 25. Realm Authority Failure States

Authority encounters may fail without ending the world.

Possible failed states:

- authority becomes hostile;
- disputed authority persists;
- ecology worsens;
- route remains blocked;
- Court conflict escalates;
- temporary exile;
- lost diplomatic opportunity;
- authority relocates;
- blight spreads;
- corruption deepens;
- settlement damage occurs.

Failure should create continued gameplay where possible.

A player may later obtain another route to resolution if the world state logically permits it.

---

# 26. Authority Replacement and Succession

Only the Seasonal Regent has a canonical office structure by default.

Other authorities may be:

- unique;
- replaceable only through special authored outcomes;
- transformed;
- removed permanently.

The system must not automatically respawn a killed realm authority as if it were an ordinary creature.

If a successor exists, succession must be explicitly defined by:

- authority logic;
- Court logic;
- event content;
- generated world-state contract.

---

# 27. Adventure Site Families

Not all Verdant adventure content is a full dungeon.

The following bounded adventure-site families are canonical.

## 27.1 Court Challenge Site

Purpose:

- duel;
- trial;
- political challenge;
- seasonal competition.

Common locations:

- Seasonal Court;
- Festival Ground;
- Court Estate;
- Seasonal Nexus.

## 27.2 Abandoned Rootway Station

Purpose:

- route repair;
- rescue;
- creature infestation;
- infrastructure restoration;
- evidence discovery.

## 27.3 Blight Outbreak Site

Purpose:

- diagnose;
- contain;
- treat;
- evacuate;
- restore.

May appear near:

- settlements;
- crops;
- Living Riverlands;
- Rotwilds.

## 27.4 Void Incursion Site

Purpose:

- identify true corruption;
- evacuate;
- anchor;
- cleanse;
- contain;
- destroy irreversibly transformed matter.

Void Incursion Sites remain visually/mechanically distinct from ordinary blight.

## 27.5 Living River Crisis Site

Purpose:

- flooding;
- blocked route;
- damaged river agreement;
- invasive ecology;
- infrastructure repair.

## 27.6 Great Bloom Site

Purpose:

- temporary abundance;
- pollinator migration;
- harvesting;
- festival;
- hazard management;
- ecological protection.

## 27.7 Thorn Hunt Site

Smaller than a full Thorn-Hunt Labyrinth.

Supports:

- tracking;
- predator relocation;
- rescue;
- Court contest.

## 27.8 Memory Grove Site

Purpose:

- Moonroot history;
- Memory Seed events;
- spirit resonance;
- archive recovery.

Must not simulate dead NPC migration.

## 27.9 Dream-Root Resonance Site

Purpose:

- anomalous dream resonance;
- strange flora;
- sleeping/waking environmental effects;
- investigation.

This is **not** a portal to Somnolent Expanse.

## 27.10 Court Dispute Site

Purpose:

- boundaries;
- ownership;
- witness evidence;
- diplomacy;
- settlement tension.

## 27.11 Restoration Project Site

Purpose:

- long-form repair;
- player construction;
- ecological recovery;
- settlement cooperation.

## 27.12 Corrupted Living Structure Site

Purpose:

- distinguish blight from Void corruption;
- rescue occupants;
- repair or destroy structure;
- prevent spread.

---

# 28. Regional Elite Encounter Contract

Verdant Covenant may generate regional elite encounters using:

- existing creature species;
- guardian families;
- Court champions;
- faction champions;
- blighted variants;
- severe corrupted variants;
- event-specific roles.

Regional elites should normally be generated from existing families rather than creating endless new named species.

A new unique elite definition is justified only when it has:

- unique silhouette;
- unique role;
- persistent world-state importance;
- distinct material/ecological provenance;
- meaningful gameplay beyond stat inflation.

---

# 29. Court Champions

Court champions are a reusable role, not one fixed species.

A champion may be:

- mortal;
- Fae;
- spirit;
- living construct;
- other compatible person.

Champion encounters may be:

- duel;
- tournament;
- escort;
- hunt;
- defence;
- political trial;
- alliance.

Court champions are not automatically realm authorities.

---

# 30. Dungeon Population Rules

A dungeon population may include:

- ordinary Verdant creatures;
- elite variants;
- guardian;
- Court NPCs;
- caretakers;
- prisoners;
- refugees;
- researchers;
- intruders;
- traders;
- restoration crews;
- hostile factions;
- corruption entities where applicable.

Population must follow:

- biome suitability;
- ecological logic;
- Court context;
- site history;
- season;
- dungeon state.

A Rot-Heart Grove should not randomly contain every Verdant creature because the registry permits them.

---

# 31. Creature Use in Dungeons

The 12 canonical Verdant creatures may appear in adventure content when justified.

Examples:

**Oathstag**
- sacred herd;
- displaced browser;
- Court symbol;
- rescue target.

**Pollen Drake**
- pollinator population;
- nest defence;
- Great Bloom event.

**Seasonal Fox**
- scavenger;
- tracker;
- environmental clue.

**Thornbound Hunter**
- predator;
- territorial threat;
- Court-managed wildlife.

**Rotcap Colony**
- decomposer;
- hazard;
- ecological solution;
- blight indicator.

**Thornsilver Weaver**
- symbiosis target;
- harvest alternative;
- pollinator crisis.

**Moonroot Warden**
- local guardian;
- archive protector;
- Moonroot encounter.

**Riverback**
- waterway engineer;
- flood clue;
- relocation/rescue target.

**Crown Glider**
- canopy navigation clue;
- seed dispersal event.

**Thornshell**
- Marches herbivore;
- predator-prey ecology.

**Rotgrazer**
- decomposer;
- restoration resource;
- blight indicator.

**Dreamburrower**
- Root Depth hazard;
- dream-resonance clue.

---

# 32. Blight Encounter Contract

Blight encounters must use ecological evidence.

Valid gameplay includes:

- sampling;
- visual diagnosis;
- NPC reports;
- plant-state comparison;
- creature behaviour;
- material-state inspection;
- infrastructure inspection;
- treatment;
- quarantine;
- restoration.

Blight is not automatically represented by "purple corrupted enemies."

---

# 33. Void Corruption Encounter Contract

Void corruption must be presented as reality contamination.

Possible effects:

- material rewriting;
- spatial instability;
- identity erosion;
- impossible growth;
- local rule failure;
- corrupted creature anatomy;
- persistent scars.

Only severe or irreversible transformation creates new canonical material/creature definitions where separately justified.

Otherwise corruption is state data applied to the original entity.

---

# 34. Adventure Reward Philosophy

Verdant rewards must preserve provenance.

Valid reward origins:

- authorised Court gift;
- restored site access;
- legitimate salvage;
- natural shed;
- symbiotic harvest;
- crafted reward;
- archive knowledge;
- blueprint;
- recipe;
- permission;
- settlement support;
- route access;
- authority resolution proof;
- recovered stolen object;
- controlled resource grant;
- combat trophy where justified.

Invalid default behaviour:

- random unrelated fantasy loot;
- generic soul drops;
- unexplained metals from creatures;
- materials that do not exist in Verdant canon;
- authority drops that ignore resolution outcome.

---

# 35. Knowledge as Reward

Knowledge may be a first-class reward through the universal knowledge/progression system.

Examples:

- living construction technique;
- Season Sap refinement;
- Memory Seed cultivation;
- Bloomstone tuning;
- Court history;
- portal-upgrade knowledge;
- restoration recipe;
- hidden structure location;
- safe Rootway route;
- seasonal cultivation pattern;
- Covenant interpretation.

Knowledge reward does not require inventing a physical book item unless a physical record is actually part of the content.

---

# 36. Permission as Reward

Permission may unlock:

- Court structures;
- settlement services;
- dungeon routes;
- legal harvest;
- seasonal vault access;
- trade;
- living-architecture projects;
- special cultivation;
- infrastructure use.

Permission is state, not necessarily an inventory key.

Where a physical token is needed for gameplay readability, FCC-02G/FCC-13 may define a proper item.

---

# 37. Authority Resolution Tokens

Existing production canon defines three authority resolution token families.

They remain valid interfaces:

- Seasonal Regent Resolution Token Family;
- Rot-Crowned Hart Resolution Token Family;
- Oathbreaker Thorn Resolution Token Family.

These families must carry:

- authority ID;
- world/realm provenance;
- encounter instance;
- outcome category;
- legitimacy/issuer where relevant;
- date/world-state reference if required.

The tokens must not imply that killing is the only valid resolution.

---

# 38. Dungeon Completion Proof

Full dungeon families may expose a completion proof through universal quest/progression systems.

Completion proof may be:

- state flag;
- Court recognition;
- repaired structure state;
- guardian outcome;
- recovered archive;
- site ownership;
- ritual completion;
- physical token where needed.

A single generic "Dungeon Key" is not required.

---

# 39. Lasting World-State Consequences

Adventure outcomes may alter persistent world state.

Valid Verdant consequence domains:

- ecology;
- Court relations;
- settlement safety;
- migration;
- season;
- route availability;
- structure state;
- blight;
- Void corruption;
- resource access;
- restoration progress;
- dungeon re-entry state;
- guardian stance;
- authority state.

Persistent changes should be bounded to avoid excessive simulation.

---

# 40. Dungeon Revisit States

A dungeon may remain in the world after resolution.

Common revisit states:

- unresolved;
- partially resolved;
- restored;
- repurposed;
- neutralised;
- Court-occupied;
- settlement-occupied;
- quarantined;
- sealed;
- abandoned;
- corrupted.

A restored dungeon may become:

- settlement infrastructure;
- safe route;
- archive;
- Court site;
- resource site;
- restoration hub.

This supports world continuity rather than resetting every dungeon.

---

# 41. Respawn and Death Boundary

FCC-02H does not own player death.

Normal player death uses the universal Leyforge death/respawn system.

Verdant dungeons do not transport dead players to another realm.

Authority defeat does not create alternate death rules.

Dungeon reset rules, corpse/tombstone handling and respawn locations remain universal-system responsibilities.

---

# 42. Portal Boundary

All normal travel into the Verdant Covenant uses the canonical **Covenant Portal** defined in FCC-02A/FCC-02G.

Adventure sites may:

- teach portal knowledge;
- provide portal ingredients;
- provide permissions;
- provide portal upgrades;
- alter portal stability through world state where permitted.

They may not create a second normal realm-entry method.

Dream-Root resonance remains non-portal environmental/adventure content.

---

# 43. Seasonal Event Families

FCC-02H consumes the Verdant event-family roster and exposes adventure hooks for:

1. Seasonal Migration;
2. Court Succession / Challenge;
3. Covenant Dispute;
4. Hospitality Crisis;
5. Living River Diversion;
6. Great Bloom;
7. Blight Outbreak;
8. Restoration Campaign;
9. Thorn Hunt;
10. Pollinator Migration;
11. Rootway Awakening;
12. Realm Breach / Void Incursion.

These are event families, not twelve fixed scripted quests.

---

# 44. Event-to-Dungeon Integration

Event families may change dungeon instances.

Examples:

**Court Succession**
- changes Seasonal Vault permissions;
- may activate a Regent storyline.

**Covenant Dispute**
- may transform a Garden instance from neutral to contested.

**Blight Outbreak**
- may create a Rot-Heart instance or alter an existing one.

**Thorn Hunt**
- may activate Labyrinth content.

**Realm Breach**
- may add Void corruption state to a compatible site.

Events should alter state through authored interfaces rather than regenerate the world arbitrarily.

---

# 45. Quest Interface

FCC-02H provides questable objectives but does not own the universal quest runtime.

Valid objective classes:

- discover;
- investigate;
- reach;
- repair;
- gather;
- deliver;
- protect;
- escort;
- negotiate;
- prove;
- restore;
- cleanse;
- contain;
- hunt;
- defeat;
- survive;
- choose;
- report.

A dungeon may support multiple quest lines concurrently if their state interactions are valid.

---

# 46. Faction and Reputation Interface

Dungeons and authority outcomes may influence:

- individual Court reputation;
- Verdant Pact standing;
- settlement trust;
- neutral enclave standing;
- restoration groups;
- refugees;
- disputed claimants.

FCC-02H does not define reputation mathematics.

World-state consequences must identify which faction interfaces they affect.

---

# 47. Economy Interface

Adventure content may create:

- salvage rights;
- trade access;
- rare resource access;
- changed local supply;
- reopened markets;
- restricted harvest;
- Court contracts.

Dungeon generation must not directly set universal market prices.

---

# 48. Settlement Interface

Adventure outcomes may:

- rescue a settlement;
- damage a settlement;
- unlock a structure;
- create a restoration project;
- open a route;
- force evacuation;
- enable rebuilding;
- alter Court control.

Settlement execution remains owned by the settlement/civilisation systems.

---

# 49. Infrastructure Interface

Adventure content may interact with:

- Rootways;
- living bridges;
- Seasonal Gates;
- Living Conduit Gardens;
- river locks;
- waterway stations;
- Promise Archives;
- Court infrastructure.

Infrastructure remains defined in FCC-02F.

---

# 50. Material and Recipe Interface

Dungeon content may require or reward materials already defined in FCC-02C/FCC-02G.

It must not silently add new major material families.

If a dungeon concept appears to require a new material:

1. first test whether an existing material/state fulfills the role;
2. if not, record it as a reconciliation candidate;
3. do not canonise it locally without explicit FCC amendment.

---

# 51. Difficulty Scaling

Dungeon difficulty may scale through universal difficulty systems using:

- encounter composition;
- guardian ability set;
- hazard severity;
- route complexity;
- resource scarcity;
- puzzle assistance;
- enemy coordination;
- consequence severity.

Difficulty should not alter fundamental canon.

Example:

A low-difficulty Rot-Heart Grove and high-difficulty Rot-Heart Grove are both still Rot-Heart Groves.

---

# 52. World Simulation Complexity Profiles

Verdant adventure content must support world-creation simulation settings.

## 52.1 Low Simulation

Prefer:

- static cached dungeon state;
- simplified ecology;
- discrete seasonal updates;
- minimal background guardian simulation;
- event resolution at coarse intervals.

## 52.2 Standard Simulation

Supports:

- normal seasonal state;
- local ecological updates;
- settlement/dungeon consequences;
- bounded guardian persistence.

## 52.3 Advanced Simulation

May support:

- richer Court interactions;
- migration impact;
- local ecology shifts;
- more detailed restoration;
- longer-term dungeon repurposing.

Advanced simulation must remain deterministic and validated.

---

# 53. Off-Screen Simulation

Off-screen dungeons should not continuously simulate full AI populations.

Use:

- state summaries;
- scheduled events;
- aggregate ecology;
- cached population state;
- deterministic rehydration on approach.

This is required for low-end scalability.

---

# 54. Multiplayer Contract

In multiplayer:

- authoritative server/world owner controls encounter state;
- resolution choices are world-state actions;
- guardian state is authoritative;
- dungeon route state is synchronised;
- authority outcomes are synchronised;
- rewards preserve provenance;
- late-joining players receive current dungeon state.

FCC-02H does not define network protocol.

---

# 55. Split-Screen and Local Co-op

Adventure design should avoid mechanics requiring:

- one camera per distant realm location;
- simultaneous contradictory route topology;
- permanent per-player dungeon geometry.

Where player permissions differ, the system should reconcile them through:

- group state;
- explicit leader/party choice;
- individual UI;
- authoritative encounter state.

---

# 56. Accessibility Contract

Verdant adventure content must communicate state through more than colour alone.

Important states such as:

- season;
- blight;
- Void corruption;
- guardian hostility;
- legal access;
- route change;
- hazard;
- interactable evidence

should use combinations of:

- shape;
- icon;
- animation;
- sound;
- text;
- particle;
- pattern;
- environmental cue.

Glamour/perception hazards must have accessibility options.

---

# 57. Navigation Readability

Living route changes must remain readable.

The player should receive cues when:

- a route closed;
- a route opened;
- Court permission changed;
- season changed;
- a dungeon reconfigured;
- a guardian altered the environment.

The game should not make the player believe geometry changed due to a bug.

---

# 58. Art Direction Handoff - Dungeons

The later Material, Colour & Texture Style Governance set must receive the following from FCC-02H.

## Living Palace Roots

Visual hierarchy should communicate:

- Greatheart/root materials;
- Living Heartwood prestige;
- Court identity;
- hospitality spaces;
- seasonal state;
- living maintenance.

## Broken Covenant Gardens

Visual hierarchy should communicate:

- former order;
- boundary markers;
- broken/restored agreements;
- layered horticulture;
- competing stewardship.

## Thorn-Hunt Labyrinth

Visual hierarchy should communicate:

- territorial thorns;
- route hierarchy;
- hunt markers;
- Court observation;
- dangerous but ecological plant growth.

## Rot-Heart Grove

Visual hierarchy must distinguish:

- healthy decay;
- blight;
- Void corruption.

## Seasonal Vaults

Visual hierarchy should communicate:

- shared base architecture;
- seasonal state;
- Court ownership;
- storage/preservation;
- convergence.

---

# 59. Art Direction Handoff - Guardians

Each guardian family needs:

- canonical silhouette;
- primary materials;
- seasonal/state overlays;
- healthy state;
- blighted state where valid;
- severe Void-corrupted state where valid;
- animation identity;
- damage-state readability.

Guardians must inherit material identity from the materials they are actually made from.

A Palace Rootwarden made from Greatheart/Living Heartwood must visually inherit those materials rather than use arbitrary colours.

---

# 60. Art Direction Handoff - Authorities

## Seasonal Regent

Art must support the fact that the Regent is an office/title.

Therefore the authority identity cannot rely solely on one fixed biological body.

Required reusable elements may include:

- regalia;
- seasonal insignia;
- Court authority markers;
- office-specific VFX;
- recognised silhouette accessories.

## Rot-Crowned Hart

Must visually distinguish:

- ancient guardian nature;
- uncontrolled decay;
- possible blight;
- possible Void corruption.

Natural decay must not be painted as generic Void corruption.

## Oathbreaker Thorn

Must read as:

- defensive living architecture;
- accumulated broken obligations;
- territorial power.

It should not look like a random oversized flower boss.

---

# 61. Audio and VFX Handoff

FCC-02H does not define final audio/VFX assets but requires identity categories.

Dungeon audio families may include:

- living wood movement;
- Court ambience;
- seasonal environmental layers;
- pollinator/fungal ecology;
- thorn movement;
- rot/decomposition ambience;
- Vault mechanisms.

Void corruption must use a distinct corruption audio/VFX family from natural rot and blight.

Guardian and authority telegraphs must remain accessible.

---

# 62. Dungeon Music Context

Music systems may consume:

- dungeon family;
- season;
- Court state;
- guardian phase;
- authority phase;
- restoration state;
- corruption state.

FCC-02H does not define compositions.

---

# 63. Save-State Contract

Minimum persistent dungeon state should include:

- family ID;
- instance seed;
- discovered state;
- resolved state;
- guardian state;
- key route-state flags;
- major ecological state;
- Court ownership where relevant;
- corruption state;
- reward claims;
- restoration/repurposing state.

Avoid storing every plant transform if it can be deterministically reconstructed.

---

# 64. Destruction and Player Building

The universal building/destruction systems may permit players to modify dungeon spaces where allowed.

A dungeon contract may mark:

- protected structural core;
- destructible wall;
- harvestable growth;
- restoration target;
- player-buildable zone;
- no-build threshold.

Protection should serve gameplay/state integrity, not arbitrary invulnerability.

---

# 65. Forge and Developer Tool Integration

The Forge should be able to author:

- dungeon room modules;
- route graphs;
- encounter profiles;
- guardian variants;
- authority arenas;
- adventure sites;
- state overlays.

Validation must ensure:

- material references exist;
- creature references exist;
- route graph remains solvable;
- required outcomes are reachable;
- no alternate realm portal is introduced;
- no illegal Block/Item duplication occurs;
- no retired material is reintroduced.

---

# 66. AI-Assisted Content Boundary

Future bounded Forge AI may propose:

- room layouts;
- decoration;
- encounter variants;
- route alternatives;
- thematic dressing.

It may not independently canonise:

- new materials;
- new realm laws;
- new dungeon families;
- new authorities;
- new portals;
- new creature species.

All proposed content must validate against FCC registries.

---

# 67. Deterministic Validation

Every generated dungeon instance must pass:

- entrance reachability;
- completion reachability;
- return-route safety or explicit intentional trap logic;
- guardian reachability;
- required-item reachability;
- no circular recipe dependency;
- no impossible seasonal requirement;
- no missing Court claimant;
- no undefined material;
- no invalid creature spawn;
- no unsupported alternate-realm transition.

---

# 68. Soft-Lock Prevention

A dungeon must not permanently soft-lock because:

- a unique NPC died unexpectedly;
- one season never returns;
- one Court disappeared;
- one item was destroyed;
- a path closed without alternative;
- a guardian despawned.

Where a state can remove a route, the contract must define:

- restoration;
- alternative route;
- successor;
- rebuild;
- reset condition;
- failure outcome.

---

# 69. Seasonal Vault Timing Safeguards

Seasonal Vault content may reward correct seasonal timing, but required progression should not demand unreasonable real-time waiting.

Allowed solutions:

- wait through game-time season;
- use seasonal manipulation unlocked through gameplay;
- obtain authorised access;
- use alternate chamber route;
- complete prerequisite restoration.

No progression gate should require real-world calendar seasons.

---

# 70. Authority Outcome Reachability

For each authority, at least:

- one confrontation path;
- one non-kill alternative

must exist where world state allows.

Some generated states may legitimately remove a specific alternative, but the overall authority design must not collapse into mandatory killing.

---

# 71. Corrupted Authority Variants

An authority may become Void-corrupted through specific world states.

Corrupted authority state does not automatically create a new authority ID.

A distinct definition is justified only if the original identity is irreversibly replaced and the transformed entity has:

- different anatomy;
- different behaviour;
- different role;
- persistent canon need.

Otherwise use authority + corruption state.

---

# 72. Dungeon Guardian Corruption

The same rule applies to guardians.

Normal severe corruption:

`GuardianDefinition + CorruptionState`

not:

`Corrupted Guardian` duplicate for every guardian.

---

# 73. Reward Duplication Prevention

Dungeon completion must not duplicate rewards already granted by:

- settlements;
- ordinary harvesting;
- portal progression;
- authority outcomes

unless the dungeon provides a legitimate alternate provenance path.

Rare content should be rare because of:

- access;
- skill;
- danger;
- politics;
- ecology;
- provenance

not arbitrary RNG alone.

---

# 74. Rare Resource Use

A dungeon may provide enhanced access to:

- Living Heartwood;
- Bloomstone;
- Pollen Amber;
- Memory Seeds;
- River Pearls;
- specialist Season Sap;
- Thornsilver.

But it must respect each resource's source rules.

Examples:

- Living Heartwood requires valid tree/ecological provenance;
- Thornsilver requires biological production;
- Pollen Amber requires resin/pollen origin;
- Memory Seeds require valid botanical encoding source;
- Bloomstone remains root/geology derived.

No chest may conjure resources with impossible provenance unless it was stored there by a legitimate prior owner.

---

# 75. Treasure Containers

Verdant containers may include:

- Court chests;
- living storage pods;
- root cabinets;
- sealed vault containers;
- archive cases;
- woven storage;
- cached provisions.

Container form does not change loot provenance rules.

---

# 76. Salvage

Salvage may come from:

- abandoned infrastructure;
- broken furniture;
- damaged Court equipment;
- failed restoration works;
- old construction.

Salvage should return:

- actual constituent materials;
- valid components;
- damaged states

rather than random loot.

---

# 77. Dungeon Ecology After Completion

After resolution, dungeon ecology may:

- recover;
- stabilise;
- recolonise;
- remain altered;
- become settlement space;
- become Court infrastructure.

The simulation should use aggregate state off-screen.

---

# 78. Dungeon Spawning

Full dungeon families should be worldgen- or event-generated using suitability rules.

A site may be:

- seeded at world creation;
- discovered later;
- activated by event;
- transformed from an existing structure.

The world should not spawn major dungeons arbitrarily beside the player.

---

# 79. Uniqueness

The five dungeon families are repeatable families.

The three realm authorities are fixed authority identities/roles and should not appear as endless duplicates.

Seasonal Regent may have multiple holders over history, but only the appropriate active office-holder exists as the current authority state unless a succession conflict explicitly creates claimants.

---

# 80. Biome Suitability Summary

| Content | Strong Biome Affinity |
|---|---|
| Living Palace Roots | Sunlit Canopy, Moonroot Groves, Seasonal Nexus |
| Broken Covenant Gardens | Moonroot Groves, Pollenwild Meadows, Thorn-Court Marches, Seasonal Nexus |
| Thorn-Hunt Labyrinth | Thorn-Court Marches |
| Rot-Heart Grove | Rotwilds and damaged compatible biomes |
| Seasonal Vaults | Seasonal Nexus and major Court territories |
| Seasonal Regent | Realm-wide political/seasonal reach |
| Rot-Crowned Hart | Rotwilds, living roads, restoration zones |
| Oathbreaker Thorn | Thorn-Court Marches, disputed borders, Covenant sites |

---

# 81. Hazard Integration Summary

Dungeon families may consume FCC-02B hazard families as follows.

| Hazard | Palace Roots | Gardens | Thorn-Hunt | Rot-Heart | Vaults |
|---|---:|---:|---:|---:|---:|
| Aggressive Overgrowth | Yes | Yes | Yes | Yes | Limited |
| Glamour / Perception Distortion | Yes | Yes | Yes | Limited | Yes |
| Territorial Flora | Yes | Yes | Yes | Yes | Limited |
| Seasonal Exposure | Yes | Yes | Yes | Yes | Yes |
| Pollen Bloom | Limited | Yes | Limited | Limited | Seasonal |
| Living River Shift / Flood | Limited | Limited | No | Possible | Limited |
| Thorn Territory | Limited | Yes | Primary | Possible | Limited |
| Natural Rot / Decay | Limited | Yes | Limited | Primary | Limited |
| Ecological Blight | Possible | Possible | Possible | Primary | Possible |
| Void Corruption | Possible | Possible | Possible | Possible | Possible |
| Covenant / Oath Consequences | Primary | Primary | Primary | Limited | Yes |
| Root Orientation / Navigation | Yes | Yes | Yes | Yes | Yes |

This table defines compatibility, not mandatory inclusion.

---

# 82. Encounter Composition Limits

To control readability and performance:

- not every room requires combat;
- avoid excessive simultaneous large creatures;
- guardian arenas should have performance budgets;
- environmental hazards should not all stack at once;
- Court NPC crowds should use LOD/aggregation;
- living geometry changes should be event-driven.

---

# 83. Boss Arena Philosophy

Authority arenas should emerge from realm context.

Examples:

**Seasonal Regent**
- Seasonal Court;
- Nexus convergence site;
- ritual complex.

**Rot-Crowned Hart**
- living road;
- Rotwild clearing;
- restoration grove.

**Oathbreaker Thorn**
- disputed border;
- thorn fortress;
- broken treaty site.

A boss arena is not required to be a circular locked room.

---

# 84. Encounter Phases

Phases may represent:

- behaviour;
- negotiation;
- state transition;
- environment change;
- season change;
- corruption escalation;
- restoration progress.

A "phase" does not require a health threshold.

---

# 85. Boss Defeat Language

UI and quest text should use outcome-appropriate language.

Examples:

- resolved;
- restored;
- contained;
- defeated;
- deposed;
- reconciled;
- cured;
- slain.

Do not label every successful authority outcome "Boss Killed."

---

# 86. Realm Climax

Verdant Covenant does not require one mandatory linear final boss.

A realm-climax path may emerge through:

- Seasonal Regent;
- Rot-Crowned Hart;
- Oathbreaker Thorn;
- major Court conflict;
- severe Void incursion;
- linked multi-site restoration.

The chosen climax depends on progression/world state.

The fixed authority roster provides multiple possible realm-scale climax paths.

---

# 87. Completion Philosophy

The player does not need to "finish" the Verdant Covenant by exterminating its threats.

Realm mastery may instead be represented by:

- reliable portal access;
- understanding realm laws;
- settlement relationships;
- material knowledge;
- major route access;
- authority resolution;
- dungeon knowledge;
- restoration capability;
- cross-realm progression.

---

# 88. Cross-Realm Adventure Interfaces

Verdant adventure content may consume interfaces from other realms only after those FCC sets are defined.

Examples may include:

- Ancestral Veil resonance at Moonroot sites;
- Somnolent dream resonance at Dreaming Root sites;
- Void corruption;
- imported materials;
- cross-realm progression components.

Until global reconciliation, these remain interface references and may not redefine those realms.

---

# 89. Ancestral Veil Boundary

Moonroot spirit resonance may create:

- phenomena;
- entities;
- clues;
- special interactions.

It does not mean dead Verdant entities automatically migrate to Ancestral Veil.

It does not create an alternate Ancestral portal.

---

# 90. Somnolent Expanse Boundary

Dreaming Root content may create:

- dream-like hazards;
- resonance;
- sleeping effects;
- symbolic ecology.

It does not own Dream Network laws.

It does not create a normal Somnolent entry path.

Somnolent access will use that realm's own canonical portal.

---

# 91. Void Between Boundary

Void corruption affecting Verdant remains a consumed cross-realm interface.

FCC-02H may define how Verdant content responds to corruption.

It may not define the full Void origin, ecology or progression.

---

# 92. Authority-to-Portal Interaction

Authorities may influence:

- permission;
- stability modifiers;
- portal-related quests;
- upgrade access;
- activation conditions

only through the universal portal interface.

They may not replace the Covenant Portal with a new access method.

---

# 93. Adventure Content and Pocket Realms

Pocket Realm systems may later use Verdant imprints/modules.

Dungeon content does not itself define Pocket Realm construction.

Any export of:

- seasonal law;
- Verdant ecology;
- living architecture

must be handled by FCC-11 and global reconciliation.

---

# 94. Canonical Dungeon Registry

| Stable ID | Name | Primary Identity |
|---|---|---|
| `dungeon.realm.verdant.living_palace_roots` | Living Palace Roots | Court-grown living palace/root dungeon shaped by hospitality, permission and seasonal law |
| `dungeon.realm.verdant.broken_covenant_gardens` | Broken Covenant Gardens | Failed treaty/stewardship gardens driven by witnesses, boundaries, repair and competing claims |
| `dungeon.realm.verdant.thorn_hunt` | Thorn-Hunt Labyrinth | Bounded reconfigurable ritual-hunt wilderness driven by territory, pursuit and Court rules |
| `dungeon.realm.verdant.rot_heart` | Rot-Heart Grove | Living decay/blight dungeon requiring diagnosis, restoration, controlled decay or confrontation |
| `dungeon.realm.verdant.seasonal_vaults` | Seasonal Vaults | Seasonal storage/ritual/archive network with season- and Court-dependent access |

---

# 95. Canonical Guardian Registry

| FCC Realm-Local ID | Name | Role |
|---|---|---|
| `guardian.realm.verdant.palace_rootwarden` | Palace Rootwarden | Living palace threshold/stewardship guardian |
| `guardian.realm.verdant.covenant_gardener` | Covenant Gardener | Treaty garden maintenance and boundary guardian |
| `guardian.realm.verdant.thorn_hunt_beast` | Thorn-Hunt Beast | Ritual hunt / territorial apex guardian |
| `guardian.realm.verdant.rotheart_keeper` | Rotheart Keeper | Decay/blight balance and quarantine guardian |
| `guardian.realm.verdant.seasonal_sentinel` | Seasonal Sentinel | Seasonal vault and convergence guardian |

---

# 96. Canonical Authority Registry

| Stable ID | Name | Realm Role |
|---|---|---|
| `boss.realm.verdant.seasonal_regent` | Seasonal Regent | Office/title overseeing seasonal succession and realm-scale seasonal stewardship |
| `boss.realm.verdant.rot_crowned_hart` | Rot-Crowned Hart | Ancient guardian embodying uncontrolled decay and ecological imbalance |
| `boss.realm.verdant.oathbreaker_thorn` | Oathbreaker Thorn | Living defensive power formed from accumulated broken Covenant obligations |

---

# 97. Canonical Adventure-Site Registry

| FCC Family ID | Site Family |
|---|---|
| `site.realm.verdant.court_challenge` | Court Challenge Site |
| `site.realm.verdant.abandoned_rootway` | Abandoned Rootway Station |
| `site.realm.verdant.blight_outbreak` | Blight Outbreak Site |
| `site.realm.verdant.void_incursion` | Void Incursion Site |
| `site.realm.verdant.living_river_crisis` | Living River Crisis Site |
| `site.realm.verdant.great_bloom` | Great Bloom Site |
| `site.realm.verdant.thorn_hunt` | Thorn Hunt Site |
| `site.realm.verdant.memory_grove` | Memory Grove Site |
| `site.realm.verdant.dream_root_resonance` | Dream-Root Resonance Site |
| `site.realm.verdant.court_dispute` | Court Dispute Site |
| `site.realm.verdant.restoration_project` | Restoration Project Site |
| `site.realm.verdant.corrupted_living_structure` | Corrupted Living Structure Site |

These are FCC realm-local IDs pending global stable-ID reconciliation.

---

# 98. Canonical Resolution Categories

The universal systems should be able to record Verdant outcomes using categories such as:

- `RESTORED`;
- `RECONCILED`;
- `CONTAINED`;
- `CLEANSED`;
- `REDIRECTED`;
- `RELOCATED`;
- `SUPPORTED`;
- `DEPOSED`;
- `REWRITTEN`;
- `DISSOLVED`;
- `SEALED`;
- `ABANDONED`;
- `DEFEATED`;
- `SLAIN`;
- `ALLIED`;
- `NEUTRALIZED`.

Exact global enum naming remains subject to system reconciliation.

---

# 99. Canonical Dungeon-Outcome Requirements

Every dungeon family must support persistent outcome data sufficient to distinguish:

- unresolved;
- partially resolved;
- successful non-destructive resolution;
- successful destructive resolution;
- failed attempt;
- corrupted aftermath;
- restored/repurposed state.

The game must not flatten all outcomes into one `completed=true` flag.

---

# 100. Content Completeness Check

FCC-02H is complete only if it accounts for:

- five dungeon families;
- five guardian families;
- three authorities;
- regional adventure sites;
- encounter-state axes;
- non-combat resolution;
- combat resolution;
- authority resolution;
- guardian resolution;
- reward provenance;
- authority resolution proofs;
- persistent consequences;
- corruption handling;
- biome integration;
- creature integration;
- settlement integration;
- low-end simulation;
- multiplayer;
- accessibility;
- art handoff;
- cross-realm boundaries.

This document satisfies those categories at realm-local canon level.

---

# 101. Reconciliation Notes

## 101.1 Existing Dungeon Names

The following Set 24 names are retained exactly:

- Living Palace Roots;
- Broken Covenant Gardens;
- Thorn-Hunt Labyrinth;
- Rot-Heart Grove;
- Seasonal Vaults.

## 101.2 Existing Dungeon Stable IDs

The existing Set 24/25 stable IDs are retained:

- `dungeon.realm.verdant.living_palace_roots`;
- `dungeon.realm.verdant.broken_covenant_gardens`;
- `dungeon.realm.verdant.thorn_hunt`;
- `dungeon.realm.verdant.rot_heart`;
- `dungeon.realm.verdant.seasonal_vaults`.

## 101.3 Existing Authorities

The following Set 24 authority names and stable IDs are retained:

- Seasonal Regent — `boss.realm.verdant.seasonal_regent`;
- Rot-Crowned Hart — `boss.realm.verdant.rot_crowned_hart`;
- Oathbreaker Thorn — `boss.realm.verdant.oathbreaker_thorn`.

Their FCC definitions refine rather than discard their existing identities.

## 101.4 Seasonal Regent Reconciliation

Earlier descriptions permitted an "embodiment or elected custodian."

FCC canon resolves this by making **Seasonal Regent an office/title**.

A holder may still be magically transformed or seasonally embodied, but the office is the canonical authority identity.

## 101.5 Rot-Crowned Hart Reconciliation

Earlier descriptions of uncontrolled decay are retained.

FCC canon clarifies:

- natural decay is not automatically evil;
- the Hart may be curable or redirectable;
- Void corruption is optional state, not its default identity.

## 101.6 Oathbreaker Thorn Reconciliation

Earlier identity as a living fortress grown from broken promises is retained.

FCC canon clarifies:

- Covenant Law is bounded;
- arbitrary speech is not parsed as binding promises;
- the authority responds to recognised Covenant structures and authored/systemic obligations.

---

# 102. Production Requirements

Implementation of FCC-02H requires support for:

- deterministic dungeon instance generation;
- stateful room variants;
- guardian-family encounter profiles;
- authority state persistence;
- alternative outcomes;
- persistent dungeon consequences;
- state-driven reward provenance;
- Court/faction hooks;
- ecological hooks;
- season hooks;
- blight/corruption hooks;
- route-state changes;
- restored/repurposed dungeon states.

No requirement in this document mandates unbounded AI simulation.

---

# 103. Low-End Performance Requirements

For low-end profiles:

- route changes use simplified switchable geometry;
- background dungeon inhabitants aggregate;
- seasonal visuals use material/state swaps rather than full regrowth;
- living structures update at event boundaries;
- authority consequences use coarse state changes;
- environmental particles scale down;
- crowd density scales down;
- off-screen ecology remains aggregate.

Gameplay identity must remain intact.

---

# 104. Validation Tests

A Verdant dungeon implementation should pass at minimum:

1. deterministic regeneration from seed/state;
2. valid entrance;
3. valid completion path;
4. valid exit/return path;
5. guardian state persistence;
6. season-state readability;
7. Covenant-state readability;
8. no impossible required item;
9. no undefined material;
10. no invalid creature;
11. no alternate normal realm access;
12. valid authority consequence persistence where applicable;
13. valid low-end profile;
14. valid multiplayer authoritative state;
15. valid accessibility cues;
16. natural rot/blight/Void distinction;
17. valid reward provenance;
18. no duplicate Block/Item definitions.

---

# 105. Art-Handoff Registry

The later art-governance set must receive at minimum:

## Dungeons
- canonical family name;
- primary materials;
- biome affinity;
- season-state requirements;
- healthy/restored state;
- blighted state;
- corrupted state where valid;
- Court ownership motifs;
- modular-room visual grammar.

## Guardians
- silhouette;
- constituent materials;
- seasonal variants;
- damage states;
- corruption states;
- attack/interaction telegraphs.

## Authorities
- silhouette/identity;
- material composition;
- authority markers;
- state variants;
- resolution-specific visual aftermath.

## Adventure Sites
- site-family visual markers;
- hazard cues;
- restoration cues;
- corruption cues.

---

# 106. Final Realm-Local Lock

At FCC-02H v0.1:

**Dungeons:** locked.  
**Guardian families:** locked.  
**Realm authorities:** locked.  
**Adventure-site families:** locked.  
**Alternative resolution philosophy:** locked.  
**Reward provenance philosophy:** locked.  
**Persistent-consequence categories:** locked.  
**Cross-realm boundaries:** locked.

Remaining global work:

- final global stable-ID reconciliation for new FCC-local guardian/site IDs;
- FCC-13 item/reward executable definitions;
- FCC-14 certification;
- later art/material profiles;
- final cross-realm adventure-content reconciliation.

No additional Verdant dungeon family, guardian family or fixed realm authority should be added without an explicit FCC amendment.

---

# 107. Handoff to FCC-02I

FCC-02I owns:

- corruption, blight and restoration integration at full realm scope;
- realm-state overlays;
- cross-realm interfaces;
- realm-event state propagation;
- portal/realm boundary interactions;
- irreversible transformations;
- state inheritance;
- final cross-system integration before the FCC-02 registry/certification document.

FCC-02H hands FCC-02I:

- five dungeon families;
- five guardian families;
- three authorities;
- twelve adventure-site families;
- dungeon state axes;
- authority outcome interfaces;
- dungeon/authority corruption hooks;
- persistent consequence categories.

---

# 108. FCC-02H Canon Summary

The Verdant Covenant adventure layer is intentionally bounded.

It contains:

- **5 canonical dungeon families**;
- **5 canonical guardian families**;
- **3 canonical realm authorities**;
- **12 canonical regional adventure-site families**.

Its dungeons are living places shaped by:

- ecology;
- season;
- Court politics;
- recognised Covenant law;
- restoration;
- blight;
- Void corruption.

Its guardians are roles, not automatic enemies.

Its authorities are world-state actors, not mandatory loot piñatas.

Its reward model is provenance-first.

Its dungeon model supports persistent restoration and repurposing.

Its normal realm access remains exclusively the **Covenant Portal**.

Its content remains deterministic, scalable and compatible with low-end simulation profiles.

This document is the authoritative realm-local adventure-content canon for the Verdant Covenant until superseded by an explicit FCC revision or amended through the final global reconciliation process.
