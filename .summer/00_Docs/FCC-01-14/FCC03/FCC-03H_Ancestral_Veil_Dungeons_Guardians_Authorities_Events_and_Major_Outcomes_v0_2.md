# Leyforge Final Content Canon Collection

## FCC-03H — Ancestral Veil Dungeons, Guardians, Authorities, Events & Major Outcomes

**Version:** 0.2  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ancestral Veil  
**Stable Realm ID:** `realm.major.ancestral_veil`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Depends On:** FCC-03A through FCC-03G  
**Primary Upstream Sources Reconciled:** Foundation Documents 00–20; World Content Atlas Set 24, especially 24D, 24G and 24H; Post-Atlas production governance; accepted FCC-03 interview decisions  
**Primary Scope:** Five dungeon families, five dungeon guardian families, three fixed realm authorities, one canonical variable boss-family, one canonical Ancestral titan/world-scale encounter foundation, supporting adventure-site categories, deterministic dungeon grammar, encounter resolution, reward provenance, authority outcomes, persistent aftermath, twelve realm-event families, accessibility, simulation scaling and source supersession.  
**Final Global Status:** Pending cross-realm reconciliation through FCC-12, FCC-13 and FCC-14.

---

# 1. Purpose

FCC-03H defines the complete realm-local **adventure, dungeon, guardian, authority and major-event canon** of the Ancestral Veil.

It owns Ancestral definitions for:

- the five canonical dungeon families;
- the five canonical dungeon guardian families;
- the three fixed realm authorities;
- the canonical Predatory Lineage Spirit variable boss-family;
- the canonical Grave-Sea Procession titan/world-scale encounter foundation;
- dungeon purpose, topology and state grammar;
- guardian encounter roles;
- authority world roles and resolution families;
- supporting adventure-site categories that are not full dungeon families;
- non-combat, mixed and combat resolution patterns;
- dungeon and authority reward provenance;
- persistent site transformation and aftermath;
- the twelve canonical Ancestral realm-event families;
- interaction between adventure content and memory, identity, routes, civilisation, ecology and Necropolis states;
- accessibility requirements for identity-, silence-, mist- and memory-oriented encounters;
- deterministic generation and simulation-LOD constraints;
- art-handoff requirements for dungeons, guardians, authorities and major events.

FCC-03H does **not** redefine:

- universal combat;
- universal boss-health or encounter-runtime systems;
- universal AI scheduling;
- universal quest execution;
- universal dialogue;
- universal reputation;
- universal faction simulation;
- universal loot architecture;
- universal dungeon-seed infrastructure;
- universal structure generation;
- universal pathfinding;
- universal save/load;
- universal multiplayer authority;
- universal portal travel;
- universal economy;
- universal item ownership;
- universal player death/respawn;
- the source or cosmology of Void corruption;
- exact final item quantities or recipe tables.

The governing rule is:

> **FCC-03H defines what Ancestral adventure content exists, what world role it serves, how it may resolve and what realm state it may change; shared Leyforge systems execute those contracts.**

---

# 2. Adventure Canon Statement

Ancestral dungeons are not disposable enemy corridors layered over the realm.

They are persistent places produced by the same systems already established in FCC-03A through FCC-03G:

- recognised identity;
- contested history;
- memory stability;
- route relationships;
- Memory Sea state;
- civilisation and law;
- archive access;
- Necropolis engineering;
- ecology;
- settlement history;
- material provenance;
- native identity predators;
- Mourning Mists;
- Devouring Silence;
- Void corruption where actually present.

A dungeon may contain combat, but combat is not its definition.

A guardian may be fought, but a guardian is not automatically an enemy.

A realm authority may become a boss encounter, but an authority is not defined as a large creature waiting to be killed.

The realm must support meaningful combinations of:

- exploration;
- navigation;
- investigation;
- evidence recovery;
- historical reconstruction;
- negotiation;
- testimony;
- diplomacy;
- route repair;
- identity stabilisation;
- rescue;
- cleansing;
- containment;
- restoration;
- salvage;
- ecological management;
- stealth;
- avoidance;
- combat;
- political choice.

The final adventure rule is:

> **Ancestral adventure content should ask the player to understand what a place remembers, claims, protects, has forgotten or is becoming — not merely clear it.**

---

# 3. Ownership and Interface Contract

## 3.1 FCC-03H Owns

FCC-03H owns:

1. dungeon-family identity;
2. guardian-family identity;
3. fixed realm-authority identity;
4. variable Ancestral boss-family identity;
5. Ancestral titan/world-scale encounter identity;
6. Ancestral encounter-state inputs;
7. Ancestral resolution categories;
8. realm-event family identity;
9. world-state consequences originating from Ancestral adventure content;
10. supporting adventure-site categories;
11. reward-provenance requirements;
12. post-resolution dungeon state;
13. authority succession/replacement interfaces where relevant;
14. adventure-content art requirements.

## 3.2 FCC-03H Consumes

FCC-03H consumes:

- realm laws and no-afterlife-simulation boundaries from FCC-03A;
- biomes, environmental states and hazards from FCC-03B;
- material/resource provenance from FCC-03C;
- flora and orchard ecology from FCC-03D;
- creature ecology and resource rules from FCC-03E;
- civilisation, polity and settlement definitions from FCC-03F;
- structures, Blocks, Items, processing, Veilgate and recipe relationships from FCC-03G;
- universal combat, quest/event, faction, reputation, world-state, AI, accessibility, difficulty, multiplayer and save/load systems.

## 3.3 Prohibited Ownership Drift

FCC-03H must not:

- redefine normal death/respawn;
- route dead players or NPCs automatically into the Veil;
- create a second Ancestral portal type;
- allow the Ferryman Sovereign to own resurrection or universal soul migration;
- turn every spirit into a monster;
- turn every undead polity into a dungeon;
- treat every hostile native phenomenon as Void corruption;
- add a fourth fixed realm authority without explicit FCC amendment;
- make all dungeon guardians permanently hostile;
- require killing all three authorities;
- create generic Souls, Ancestral Essence or Memory Fragment loot;
- invent new major material families solely as dungeon rewards;
- permanently delete player/NPC identity or save data as a mechanic;
- depend on uncontrolled generative text or unbounded AI for solvability.

---

# 4. Canon Adventure Roster

## 4.1 Canonical Dungeon Families

| Dungeon Family | Stable ID | Canon Status |
|---|---|---|
| **Processional Necropolis** | `dungeon.realm.ancestral.processional_necropolis` | Locked |
| **Memory Archive** | `dungeon.realm.ancestral.memory_archive` | Locked |
| **Spirit Court** | `dungeon.realm.ancestral.spirit_court` | Locked |
| **Drowned Remembrance Halls** | `dungeon.realm.ancestral.drowned_remembrance` | Locked |
| **Devouring Silence Zone** | `dungeon.realm.ancestral.devouring_silence` | Locked |

These five are the authoritative Ancestral dungeon families.

The realm does not require one dungeon family per biome. Each family uses suitability constraints and may appear in several compatible regions.

## 4.2 Canonical Dungeon Guardian Families

| Guardian Family | Working FCC Realm-Local ID | Primary Dungeon Relationship |
|---|---|---|
| **Procession Warden** | `guardian.realm.ancestral.procession_warden` | Processional Necropolis |
| **Archive Custodian** | `guardian.realm.ancestral.archive_custodian` | Memory Archive |
| **Court Adjudicator** | `guardian.realm.ancestral.court_adjudicator` | Spirit Court |
| **Drowned Keeper** | `guardian.realm.ancestral.drowned_keeper` | Drowned Remembrance Halls |
| **Silence Devourer** | `guardian.realm.ancestral.silence_devourer` | Devouring Silence Zone |

These are reusable **guardian families**, not five additional fixed realm authorities.

They may receive:

- culture variants;
- site variants;
- state variants;
- Necropolis variants;
- corruption variants;
- elite variants.

A variant remains within its guardian family unless it becomes a unique named authority through an explicit later canon amendment.

## 4.3 Canonical Fixed Realm Authorities

| Realm Authority | Stable ID | Canon Status |
|---|---|---|
| **Memory Eater** | `boss.realm.ancestral.memory_eater` | Locked |
| **Uncrowned Ancestor** | `boss.realm.ancestral.uncrowned_ancestor` | Locked |
| **Ferryman Sovereign** | `boss.realm.ancestral.ferryman_sovereign` | Locked |

These three are the **only fixed realm-scale authority roster** for FCC-03.

Their fixed-authority count does **not** exclude other Atlas threat classes. FCC-03 also contains one canonical variable boss-family and one canonical titan/world-scale encounter foundation, defined below.

## 4.4 Canonical Variable Boss-Family

| Boss Family | Working FCC ID | Canon Status |
|---|---|---|
| **Predatory Lineage Spirit** | `boss.family.ancestral.predatory_lineage_spirit` | Locked variable boss-family |

The **Predatory Lineage Spirit** preserves the fourth Ancestral boss hook from the Dimensions/Realm Atlas without incorrectly promoting it to a fourth fixed realm authority.

It is a **seed-, history-, culture- and claim-derived boss family**. An instance may become associated with:

- a disputed lineage;
- a cultural succession;
- a historical inheritance claim;
- a family/community archive;
- a false or weaponised ancestry claim;
- a forgotten-city claimant conflict;
- a Crownland legitimacy dispute;
- a Necropolis continuity dispute.

“Lineage” may be biological, cultural, legal, memorial or historical depending on the instance. It must not assume that every valid lineage is blood ancestry.

A Predatory Lineage Spirit may exploit, distort, monopolise or feed upon **bounded lineage/continuity records and recognition states**. It may not permanently delete real save data, invent secret ancestry without evidence, or consume generic souls.

Possible resolutions include:

- recover or compare lineage evidence;
- expose a fabricated claim;
- restore a damaged continuity record;
- protect targeted communities;
- sever the spirit from a claim;
- redirect or contain it;
- recognise a legitimate role;
- negotiate where personhood/communication applies;
- defeat or destroy it.

Possible aftermath includes changes to:

- claimant legitimacy;
- archive access;
- family/community recognition;
- settlement politics;
- Crownland succession;
- Necropolis continuity law;
- identity stability;
- historical truth records.

A generated Predatory Lineage Spirit is a major encounter actor, not a universal ruler of the realm.

## 4.5 Canonical Titan / World-Scale Encounter Foundation

| Titan | Stable ID | Canon Status |
|---|---|---|
| **Grave-Sea Procession** | `titan.ancestral.grave_sea_procession` | Locked Ancestral titan/world-scale encounter foundation |

The **Grave-Sea Procession** is promoted directly from the Atlas into FCC-03 canon.

Its retained Atlas identity is a vast moving procession of ancestral vessels and spirit-active participants crossing land and water toward a destination whose meaning may be unknown, disputed or discovered during play.

FCC reconciliation narrows older afterlife implications:

- participants are Veil-native, Veil-associated, memorial, invited, attached or otherwise explicitly authored populations and phenomena;
- the Procession is **not** composed automatically from every NPC that dies elsewhere;
- it does not transport universal dead populations into the Veil;
- it does not replace the Veilgate;
- it does not create a second normal inter-dimensional access method.

The Procession may travel through:

- Memory Sea waters;
- Processional routes;
- coastal/river interfaces;
- flooded districts;
- rare authorised boundary-event spaces where universal route systems permit it.

Its world role combines:

- names and recognised identity;
- route protection;
- memorial law;
- convoy/pilgrimage-scale movement;
- Memory Sea navigation;
- settlement and port pressure;
- historical/lineage disputes;
- Veil-linked aftermath.

Retained and reconciled resolution families include:

- **Return Names** — restore bounded recognised-name records or participant identities.
- **Join the Procession** — accompany, observe, protect or participate without implying death.
- **Protect the Route** — repair, defend or stabilise the Procession's valid path.
- **Challenge Leaders** — dispute authority, law, destination or treatment of participants.
- **Redirect** — establish a safer or politically accepted route/destination.
- **Disperse** — break the Procession apart where justified, with persistent consequences.
- **Negotiate / Communicate** — reach a treaty or new memorial/route compact.
- **Defend / Fight** — combat remains possible when conflict requires it.

Retained Atlas aftermath is reconciled as follows:

- **creates memorial sea** → may create or transform a bounded Memory Sea / memorial-water regional state;
- **opens Veil passage** → may open or stabilise an **intra-Veil route**, portal-side approach, or access to a valid existing/constructed **Veilgate**; it never creates an alternative normal Ancestral portal type;
- **resolves lineage** → may resolve a bounded historical, cultural, family or legal continuity dispute;
- **causes haunt migration** → may cause movement of Veil-native spirit populations, memorial phenomena, communities or attached entities; it never means automatic migration of all dead Overworld NPCs.

Because Set 26M explicitly treats Grave-Sea Procession as a marine/world-scale boss foundation, its encounters may use shared vessel, fleet, underwater, route, rescue, communication and multi-stage expedition systems where appropriate.

Additional major challenge may also come from:

- dungeon guardians;
- elite native creatures;
- city minds;
- local Necropolis rulers;
- claimant sovereigns;
- political crises;
- event-generated authority conflicts;
- severe Void transformations.

Those do not automatically become fourth, fifth or sixth fixed authorities.

---

# 5. Dungeon Grammar Contract

Every generated Ancestral dungeon instance must be describable through deterministic authoritative state.

A minimum dungeon descriptor should include:

- `dungeon_family`;
- `world_seed`;
- `realm_seed`;
- `instance_seed`;
- `biome_context`;
- `civilisation_context`;
- `site_origin`;
- `ownership_state`;
- `memory_state`;
- `identity_state`;
- `route_state`;
- `historical_truth_state`;
- `necropolis_state` where applicable;
- `water_state` where applicable;
- `silence_state` where applicable;
- `void_corruption_state`;
- `guardian_profile`;
- `resolution_profile`;
- `reward_provenance_profile`;
- `access_state`;
- `restoration_state`;
- `completed_state`.

Optional descriptors may include:

- settlement history;
- disputed claimant;
- local court;
- archive institution;
- Processional Order;
- predator pressure;
- Mourning Mist condition;
- Forgotten City reflection state;
- authority influence;
- refugee/occupation state;
- cross-realm historical evidence.

No dungeon may require uncontrolled AI to invent the key, testimony, route or truth necessary for completion.

---

# 6. Shared Dungeon State Axes

## 6.1 Memory State

A dungeon may consume bounded memory states such as:

- stable;
- fragmented;
- contested;
- incomplete;
- suppressed;
- restored;
- overwritten-by-false-record;
- fading.

These states refer to explicit dungeon/world data, not to a simulation of every person's private memories.

## 6.2 Identity State

Possible dungeon identity states include:

- recognised;
- disputed;
- masked;
- destabilised;
- anchored;
- reconstructed;
- legally unrecognised;
- falsely attributed.

Identity effects must remain bounded and save-safe.

## 6.3 Route State

Possible route states include:

- open;
- restricted;
- unstable;
- severed;
- redirected;
- disputed;
- restored;
- sanctioned.

## 6.4 Historical Truth State

A dungeon may expose:

- confirmed evidence;
- conflicting evidence;
- missing evidence;
- fabricated evidence;
- culturally disputed interpretation;
- unresolved chronology.

The game must distinguish **evidence** from **interpretation**.

## 6.5 Necropolis State

Where applicable:

- active;
- dormant;
- maintained;
- failing;
- contested;
- quarantined;
- restored;
- abandoned;
- liberated;
- politically transformed.

Necropolis state is not a morality axis.

## 6.6 Void Corruption State

Void corruption remains separate:

- none;
- trace;
- active;
- severe;
- irreversible transformation.

Devouring Silence, memory loss, Remnant Eaters or Mourning Mists are not automatically Void-corrupted states.

---

# 7. Shared Room and Encounter Module Rules

A dungeon family may assemble family-specific modules providing:

- traversal;
- navigation;
- combat;
- ecology;
- testimony;
- negotiation;
- historical evidence;
- archive research;
- route repair;
- identity stabilisation;
- water control;
- silence counterplay;
- ritual;
- salvage;
- rescue;
- settlement interaction;
- guardian encounter;
- authority encounter;
- consequence/reward;
- restoration.

A normal dungeon graph should usually contain some form of:

1. approach;
2. threshold;
3. identity-establishing space;
4. escalating complication;
5. optional branch or evidence route;
6. contextualisation;
7. guardian or equivalent gate;
8. resolution space;
9. aftermath/reward space;
10. safe return or transformed exit state.

Small instances may compress these functions. Large instances may repeat them in distinct wings.

---

# 8. Non-Combat and Mixed Resolution Contract

A non-combat route must still be gameplay.

Valid requirements may include:

- locating evidence;
- proving identity;
- comparing records;
- recovering a lost name;
- repairing route infrastructure;
- restoring Memory Glass records;
- stabilising Grave Salt boundaries;
- obtaining testimony;
- negotiating with claimants;
- completing a lawful process;
- restoring a drowned district;
- protecting a vulnerable population;
- exposing forged history;
- repairing a guardian's function;
- containing an ecological or memory hazard;
- accepting a cost or trade-off.

A mixed resolution may combine:

- combat to create safe space;
- investigation to identify the actual problem;
- infrastructure work to stabilise the site;
- negotiation to determine final ownership or use.

No dungeon family is required to have a pacifist route in every generated state, but the realm-wide adventure roster must support substantial non-kill outcomes.

---

# 9. Processional Necropolis

## 9.1 Identity

The **Processional Necropolis** is a route-city dungeon family built from memorial infrastructure, Processional Roads, civic complexes, Necropolis districts, stations, bridges, courts and old transit systems.

Its final identity supersedes the old assumption that all routes are universal roads for the dead.

Routes become stable through explicit combinations of:

- recognised names;
- valid records;
- known destinations;
- route anchors;
- witnesses;
- local law;
- restored infrastructure;
- culturally specific rites where actually authored.

## 9.2 Possible Origins

An instance may originate as:

- an old route-city;
- a failed Necropolis transit capital;
- a Processional Order complex;
- an abandoned station network;
- a disputed memorial city;
- a route system fractured by war or historical erasure;
- a polity still actively occupying the dungeon.

A populated Processional Necropolis is not automatically hostile.

## 9.3 Core Challenges

- route recognition;
- changing access permissions;
- identity-safe navigation;
- damaged bridges/stations;
- disputed civic law;
- lost route records;
- Remnant Eater pressure;
- guardian control;
- political occupation;
- selective Necropolis failure.

## 9.4 Resolution Families

Possible outcomes include:

- restore route infrastructure;
- negotiate passage;
- recognise a claimant;
- expose false route authority;
- evacuate trapped populations;
- repair the Procession Warden's mandate;
- defeat hostile occupation;
- split route jurisdiction;
- seal a dangerous district;
- convert parts into a stable settlement/route station.

## 9.5 Aftermath

Resolution may alter:

- regional route safety;
- trade;
- migration;
- Processional Order influence;
- settlement viability;
- access to other Ancestral regions;
- dungeon ownership;
- local Necropolis politics.

---

# 10. Procession Warden

The **Procession Warden** is the guardian family associated with route-city thresholds, infrastructure and sanctioned passage.

A Warden may be:

- spirit-active guardian;
- constructed sentinel;
- recognised-office manifestation;
- bound civic protector;
- cultural guardian variant.

Its job is to protect valid route function, not to kill living travellers.

Possible encounter states:

- functioning and neutral;
- functioning but restrictive;
- operating under outdated law;
- damaged;
- falsely authorised;
- politically captured;
- corrupted;
- hostile after route violation.

Resolution may involve:

- proving passage;
- updating authority;
- repairing infrastructure;
- restoring records;
- disabling a hostile state;
- combat;
- replacement by a valid successor system.

---

# 11. Memory Archive

## 11.1 Identity

The **Memory Archive** is a dungeon family where stored experiences, records and reconstructed histories form navigable spaces.

It is distinct from ordinary civic archive buildings in FCC-03G/F.

## 11.2 Core Principle

Archive content may be:

- accurate;
- incomplete;
- biased;
- censored;
- forged;
- damaged;
- contradictory;
- politically curated.

A dungeon instance should therefore challenge the player to distinguish:

- what happened;
- what was recorded;
- who recorded it;
- what is missing;
- who benefits from one interpretation.

## 11.3 Navigation

Rooms may be organised by:

- event;
- person/identity record;
- location;
- institution;
- era;
- evidence class;
- claimant;
- sealed collection.

Navigation is deterministic and based on explicit archive metadata.

## 11.4 Resolution Families

- restore damaged records;
- compare conflicting archives;
- expose fabrication;
- preserve ambiguity where evidence is insufficient;
- return stolen records;
- negotiate access;
- contain dangerous memory accumulation;
- rescue archivists or trapped manifestations;
- defeat hostile custodial systems;
- repurpose the site as public/restricted research facility.

---

# 12. Archive Custodian

The **Archive Custodian** is the guardian family responsible for preserving archive integrity, access rules and dangerous collections.

A Custodian may be:

- constructed;
- spirit-active;
- a formal office manifested through an artefact/system;
- a living or person-like guardian where personhood rules apply.

Its hostility may arise from:

- unauthorised access;
- corrupted instruction;
- conflicting permissions;
- damaged identity recognition;
- political capture;
- attempts to destroy protected records.

Valid outcomes include:

- gain authorisation;
- repair its index;
- demonstrate lawful claim;
- prove its archive has been compromised;
- negotiate limited access;
- disable or fight it;
- install a successor mandate.

---

# 13. Spirit Court

## 13.1 Identity

The **Spirit Court** is a judicial and diplomatic dungeon family where testimony, legitimacy, obligations, identity and authority determine thresholds and outcomes.

It is not simply a courthouse full of enemies.

## 13.2 Court Inputs

A Spirit Court may consume explicit evidence such as:

- identity records;
- witness statements;
- Oathbone seals;
- Memory Glass evidence;
- settlement law;
- property claims;
- historical records;
- faction reputation;
- recognised office;
- valid contracts.

It may not decide cases by interpreting arbitrary player prose as binding law.

## 13.3 Dungeon Grammar

Possible spaces include:

- petition halls;
- evidence archives;
- witness chambers;
- claimant galleries;
- restricted judicial wings;
- holding/refuge spaces;
- adjudication chambers;
- records of precedent.

## 13.4 Resolution Families

- present evidence;
- expose false testimony;
- negotiate settlement;
- recognise or reject a claimant;
- amend a local order;
- free wrongly contained persons;
- uphold a legitimate restriction;
- replace a compromised adjudicator;
- escape an illegitimate court;
- combat hostile enforcement.

---

# 14. Court Adjudicator

The **Court Adjudicator** is the reusable guardian family for Spirit Court thresholds and rulings.

It may represent:

- a person holding office;
- a construct;
- a spirit-active legal mechanism;
- an inherited judicial role;
- a culture-specific court guardian.

A Court Adjudicator is not automatically infallible.

It may be:

- legitimate;
- outdated;
- biased;
- deceived;
- politically controlled;
- damaged;
- corrupted.

Resolution must depend on explicit evidence and world state rather than hidden dialogue guessing.

---

# 15. Drowned Remembrance Halls

## 15.1 Identity

The **Drowned Remembrance Halls** are a flooded echo-city dungeon family in which recovered historical truth changes water access, architecture, route availability and political claims.

## 15.2 Core Systems

An instance may combine:

- flooding;
- submerged archive access;
- Memory Sea ecology;
- drowned civic districts;
- contested history;
- salvage;
- collapsed routes;
- air/water traversal;
- Echo Ray/Memory Koi/Mourning Eel ecology;
- claimant occupation.

## 15.3 Truth–Water Relationship

Recovered historical truth may change authored/systemic state such as:

- which floodgates can be operated;
- which rooms become accessible;
- whether a reflected district stabilises;
- which claimant receives recognition;
- what route or structure can be restored.

Truth does **not** magically lower every water body because the player read a book.

The relationship must be represented through explicit site mechanisms and state transitions.

## 15.4 Resolution Families

- drain or redirect sections;
- preserve submerged districts;
- recover evidence;
- restore infrastructure;
- settle claimant disputes;
- evacuate inhabitants;
- protect aquatic ecology;
- contain dangerous echo accumulation;
- defeat hostile occupiers/guardians;
- convert portions into a port, archive or research settlement.

---

# 16. Drowned Keeper

The **Drowned Keeper** is the guardian family associated with submerged infrastructure, protected memory chambers and drowned civic systems.

Its roles may include:

- flood control;
- archive protection;
- submerged route regulation;
- protection of inhabited drowned districts;
- containment of hazardous echo matter.

Possible states include functioning, trapped, damaged, politically reassigned, hostile, corrupted or operating under obsolete instructions.

Resolution may involve hydraulic repair, evidence, route restoration, negotiation, containment or combat.

---

# 17. Devouring Silence Zone

## 17.1 Identity

The **Devouring Silence Zone** is a dungeon family built around hostile absence.

Inside it, sound, names, maps and relationships become difficult to maintain without explicit anchors.

**Devouring Silence is a native Veil phenomenon unless a specific instance has additional Void corruption.**

## 17.2 Hazard Language

A Silence Zone may suppress or disrupt:

- audible cues;
- map labels;
- route certainty;
- displayed names;
- communication range;
- recognition interfaces;
- memory/identity-state readability.

It may never permanently delete authoritative data.

## 17.3 Counterplay

Counterplay may include:

- physical markers;
- Grave Salt boundaries;
- Memory Glass anchors;
- Soul Silver devices;
- Veil-Lantern nodes;
- paired-player/NPC route protocols;
- redundant visual symbols;
- restored names/records;
- community anchoring.

## 17.4 Resolution Families

- establish a safe route;
- recover missing anchors;
- rescue trapped people;
- contain the absence;
- reconnect isolated districts;
- restore communication;
- disable a hostile system exploiting the silence;
- confront the Silence Devourer;
- seal or stabilise the site.

---

# 18. Silence Devourer

The **Silence Devourer** is the guardian family of Devouring Silence Zones.

It may be:

- a native absence-entity;
- a site-scale predator;
- a guardian that has adapted to silence;
- a culturally interpreted manifestation.

It is distinct from the **Remnant Eater** creature family and from the **Memory Eater** authority.

Its mechanics should emphasise:

- removal of cues;
- pressure on anchors;
- route disruption;
- readable telegraphs through non-audio channels;
- recoverable identity/recognition interference.

Permanent deletion or forced account/profile loss is prohibited.

---

# 19. Guardian Family Contract

All five dungeon guardians follow these principles.

A guardian:

- exists to protect, regulate, maintain, contain, test or enforce something;
- has a world role before combat begins;
- may be a person, creature, construct, spirit-active system or office manifestation;
- can vary by culture/site/state;
- may have non-hostile states;
- may be repaired, convinced, replaced, bypassed or fought where fiction supports it;
- must produce persistent site consequences after resolution.

Guardian rewards should derive from:

- access;
- restored infrastructure;
- legal recognition;
- knowledge;
- legitimate salvage;
- crafted components;
- material allotment;
- settlement benefits;
- rare context-specific trophies if combat actually occurred.

A guardian does not need a unique body-part drop merely to justify the encounter.

---

# 20. Realm Authority Contract

A realm authority occupies a **world role** before any possible boss fight.

An authority may regulate:

- a major ecological function;
- a historical/political legitimacy question;
- route infrastructure;
- a civilisation-scale system;
- a regional danger;
- cross-realm interface conditions.

Authorities must support at least several of the following where fiction allows:

- investigate;
- negotiate;
- regulate;
- restore;
- redirect;
- contain;
- ally;
- depose;
- replace;
- expose;
- challenge;
- fight;
- kill.

Killing an authority cannot be treated as the universally optimal answer.

---

# 21. Memory Eater

## 21.1 Stable Identity

**Stable ID:** `boss.realm.ancestral.memory_eater`

The **Memory Eater** is a major ecological/intellectual authority governing or embodying the dangerous problem of abandoned, unstable, stolen or harmful memory accumulation.

It is **not** the Remnant Eater species.

## 21.2 World Role

Depending on seed/state, the Memory Eater may function as:

- necessary regulator;
- feared predator;
- archive-containment entity;
- politically exploited force;
- overfed regional threat;
- misunderstood ecological process;
- corrupted authority.

## 21.3 Possible Conflicts

- it consumes protected records;
- societies intentionally feed it dangerous memories;
- factions weaponise its appetite;
- containment fails;
- it grows beyond sustainable scale;
- archives demand its destruction while others depend on it;
- stolen records must be recovered before consumption;
- Void corruption alters its role.

## 21.4 Resolution Families

Locked valid outcome directions include:

- regulate feeding;
- recover protected memories;
- establish boundaries;
- redirect it;
- prove its ecological necessity;
- contain it;
- separate corruption;
- destroy/kill it where justified.

## 21.5 Aftermath

Outcomes may alter:

- dangerous memory accumulation;
- archive safety;
- historical recovery;
- identity stability;
- faction relationships;
- dungeon states;
- regional haunting/echo pressure;
- access to protected records.

The authority does not control player death or the existence of souls.

---

# 22. Uncrowned Ancestor

## 22.1 Stable Identity

**Stable ID:** `boss.realm.ancestral.uncrowned_ancestor`

The **Uncrowned Ancestor** is a colossal ancestral/memory sovereign representing unresolved civilisation, lineage or historical political legitimacy.

The old source definition of “a powerful dead sovereign denied burial/succession” is **one possible seed/history expression**, not the universal identity.

The authority may instead be:

- a native Veil sovereign;
- reconstructed collective identity;
- memory-born civilisation symbol;
- historical office made manifest;
- lineage/cultural aggregate;
- disputed sovereign created by competing records.

## 22.2 Core Conflict

The authority's central issue is **legitimacy**, not simply undeath.

Possible questions include:

- Who has the right to rule?
- Is the reconstructed sovereign authentic enough to hold office?
- Which historical record is credible?
- Does a civilisation still recognise the old polity?
- Should the office be restored, transformed or ended?
- Are descendants/successors relevant, and if so how?

## 22.3 Resolution Families

- recognise a legitimate claim;
- reject a fraudulent claim;
- expose wrongdoing;
- reconcile successor groups;
- create a new constitutional settlement;
- grant symbolic rather than political recognition;
- seal/contain a dangerous manifestation;
- depose;
- fight;
- destroy where necessary.

## 22.4 Aftermath

Outcomes may change:

- Crownland politics;
- claimant legitimacy;
- archive interpretation;
- property/territorial claims;
- diplomatic relationships;
- cultural identity;
- settlement allegiance;
- historical Codex truth state.

No outcome automatically rewrites all Overworld ancestry or genealogy.

---

# 23. Ferryman Sovereign

## 23.1 Stable Identity

**Stable ID:** `boss.realm.ancestral.ferryman_sovereign`

The **Ferryman Sovereign** is the major authority over:

- Processional Roads;
- Memory Sea crossings;
- ferries and stations;
- route law;
- unstable crossings;
- portal-side transit infrastructure;
- selected Ancestral transport permissions.

## 23.2 Explicit Supersession

The old Set 24 role that gave the Ferryman Sovereign authority over:

- death travel;
- spirit migration;
- resurrection law;
- universal living/dead crossings

is superseded.

The Ferryman Sovereign **does not control**:

- player death;
- player respawn;
- universal soul migration;
- whether dead NPCs enter Ancestral Veil;
- resurrection as a universal game system;
- the existence of the Veilgate itself.

## 23.3 Legitimate Authority

The Ferryman Sovereign may control or influence:

- ferry networks;
- route tolls;
- route maintenance;
- route access law;
- Processional stations;
- Memory Sea crossing safety;
- destination-side Veilgate infrastructure;
- sanctioned convoy routes;
- rescue obligations;
- unstable crossing closures.

## 23.4 Resolution Families

- earn or negotiate passage;
- repair route infrastructure;
- amend tolls;
- expose route monopoly/abuse;
- support reform;
- replace a ferryman network;
- redistribute route authority;
- ally;
- challenge;
- depose;
- fight.

## 23.5 Aftermath

Outcomes may change:

- Ancestral route safety;
- trade;
- settlement connectivity;
- ferry availability;
- Processional Order politics;
- portal-side services;
- rescue response;
- Memory Sea travel.

They do **not** change universal respawn rules.

---

# 24. Fixed Authority Ceiling and Additional Major-Encounter Content

FCC-03 has exactly **three fixed realm authorities**:

1. Memory Eater;
2. Uncrowned Ancestor;
3. Ferryman Sovereign.

This ceiling applies only to the **fixed authority class**.

FCC-03 additionally locks:

- **Predatory Lineage Spirit** as one canonical **variable boss-family**;
- **Grave-Sea Procession** as one canonical **titan/world-scale encounter foundation**.

This follows the Atlas distinction between realm authorities, generated bosses and titans rather than flattening every major actor into one authority roster.

## 24.1 Predatory Lineage Spirit — Variable Boss-Family

**Working ID:** `boss.family.ancestral.predatory_lineage_spirit`

The Predatory Lineage Spirit is a variable major encounter generated from valid historical, lineage, succession, claimant or identity-state contexts.

Its instance identity may be derived from:

- culture;
- polity;
- family/community archive;
- claimant conflict;
- Crownland succession;
- Forgotten City history;
- Necropolis continuity;
- world seed and site history.

It is **not** automatically the spirit of a specific dead NPC.

Its predation acts on bounded recognition, inheritance, lineage or continuity state and must never permanently delete authoritative character, NPC or world-history data.

Valid outcomes may include:

- investigate;
- recover evidence;
- restore records;
- expose a false lineage;
- defend targeted claimants;
- sever predatory access;
- contain;
- redirect;
- recognise;
- negotiate;
- fight/destroy.

Regional aftermath may change:

- claimant legitimacy;
- recognised succession;
- archive truth state;
- access rights;
- identity stability;
- settlement politics;
- historical recovery.

## 24.2 Grave-Sea Procession — Titan / World-Scale Encounter

**Stable ID:** `titan.ancestral.grave_sea_procession`

The Grave-Sea Procession is a canonical moving Ancestral titan-scale encounter: a vast host of spirit-active/ancestral vessels and participants crossing land and water toward an important destination.

Its source identity is retained, but final FCC law applies:

- it does not automatically contain the dead of other realms;
- it does not own death or respawn;
- it does not bypass Veilgate;
- its participants and vessels require explicit world provenance;
- its “passage” effects must resolve through legitimate Ancestral route or portal interfaces.

Canonical encounter roles include:

- moving fleet/procession;
- route-protection crisis;
- memorial-law dispute;
- name/identity recovery;
- port/settlement pressure;
- Memory Sea world event;
- convoy/pilgrimage escort;
- major political or historical confrontation.

Canonical resolution families include:

- return names;
- join;
- protect route;
- communicate;
- bargain;
- challenge leaders;
- redirect;
- escort;
- disperse;
- defend;
- fight.

Its aftermath can create durable changes to:

- Memory Sea geography/state;
- Processional route safety;
- port traffic;
- memorial law;
- claimant/lineage politics;
- settlement migration;
- Veilgate approach/access infrastructure;
- spirit-population movement;
- historical records.

Set 26 marine systems may execute its vessel, fleet, surface, underwater or multi-stage encounter components where applicable.

## 24.3 Other Generated Boss-Scale Content

The following may create additional boss-scale encounters without expanding the fixed authority roster or the two canonical additional major-encounter foundations:

- elite Procession Wardens;
- Archive Custodians;
- Court Adjudicators;
- Drowned Keepers;
- Silence Devourers;
- elite Remnant Eaters;
- local Necropolis rulers;
- claimant sovereigns;
- city minds;
- event-created political champions;
- severe corrupted transformations;
- invasion leaders.

These are instance/content-generation possibilities, not additional mandatory fixed realm icons.

---

# 25. Supporting Adventure-Site Categories

Not every meaningful site is a full dungeon family.

FCC-03H allows deterministic supporting site categories such as:

- route blockades;
- broken route stations;
- abandoned archive annexes;
- disputed memorial sites;
- flooded civic wings;
- collapsed bridges;
- orchard restoration sites;
- Mourning Mist investigation zones;
- forgotten-reflection districts;
- Predator-Dark anchor failures;
- Necropolis maintenance complexes;
- stranded ferries;
- corrupted threshold sites;
- historical excavation sites;
- claimant camps;
- rescue/refuge sites.

These are categories, not a new mandatory named registry of fifteen dungeon families.

A supporting site becomes a full dungeon-family candidate only if it develops a distinct reusable topology, encounter grammar and world role that cannot be represented by the five locked families or ordinary structures.

---

# 26. Dungeon State and Persistence

A dungeon instance may persist through states such as:

- undiscovered;
- discovered;
- active;
- occupied;
- contested;
- damaged;
- flooded;
- unstable;
- sealed;
- corrupted;
- cleansed;
- restored;
- claimed;
- converted;
- abandoned;
- collapsed.

Important state should persist independently where needed:

- ownership;
- guardian state;
- authority influence;
- route access;
- flood state;
- archive truth state;
- population;
- loot/salvage state;
- corruption;
- restoration;
- structure damage.

Distant simulation may update ownership, danger, repair, reoccupation and major events without simulating every room.

---

# 27. Post-Resolution Conversion

A resolved Ancestral dungeon may become, where its structure and law permit:

- settlement;
- archive;
- research site;
- route station;
- fortress;
- court;
- refuge;
- port;
- workshop;
- cultural site;
- sealed preservation zone;
- restored ruin.

Conversion must respect:

- ownership;
- remaining hazards;
- guardian/authority outcomes;
- resident personhood;
- structural condition;
- route safety;
- local law;
- resource conservation.

“Cleared dungeon” must not mean all inhabitants vanish and the site becomes free real estate.

---

# 28. Reward Provenance Contract

Ancestral adventure rewards must come from legitimate sources.

Valid reward categories include:

- recovered historical knowledge;
- Codex truth updates;
- maps and route data;
- legal recognition;
- faction/polity access;
- settlement access;
- route permission;
- restored infrastructure;
- resource claims;
- lawful salvage;
- crafted components;
- cultural goods;
- authority gifts;
- material allotments;
- specialist services;
- recipes/techniques;
- reputation;
- converted/restored site access.

A dungeon may contain real materials such as Memory Glass, Soul Silver, Grave Salt, Spirit Clay, Soulwood goods or Echo Pearls only where the site's history and provenance support them.

The following are prohibited as generic reward currencies:

- Soul;
- Ancestral Essence;
- Memory Fragment;
- Spirit Essence;
- dead-person essence.

Major progression must not require killing a fixed realm authority solely to obtain a mandatory material drop.

---

# 29. Twelve Canonical Realm-Event Families

FCC-03H locks exactly twelve major Ancestral realm-event families:

1. **Route Closure**
2. **Processional Opening**
3. **Memory Sea Storm**
4. **Historical Revelation**
5. **Competing Claim**
6. **Forgotten District Reappearance**
7. **Mourning Mist Crisis**
8. **Ossuary Bloom**
9. **Archive Breach**
10. **Predator Dark Expansion**
11. **Necropolis Political Crisis**
12. **Void Incursion**

These are event **families**, not single fixed scripted quests.

---

# 30. Route Closure

A **Route Closure** occurs when a Processional or civic route becomes unusable, restricted or unsafe.

Possible causes:

- infrastructure damage;
- guardian action;
- political closure;
- route-law dispute;
- identity instability;
- Predator Dark encroachment;
- storm/flood;
- corruption.

Possible consequences:

- trade interruption;
- stranded travellers;
- settlement shortage;
- alternate-route discovery;
- rescue missions;
- political tension;
- dungeon activation.

Resolution may involve repair, diplomacy, alternate route construction, hazard removal or authority negotiation.

---

# 31. Processional Opening

A **Processional Opening** is the activation/restoration of a significant route, station, bridge or crossing.

It may result from:

- restored records;
- infrastructure repair;
- authority outcome;
- settlement growth;
- route discovery;
- diplomatic agreement.

Consequences may include:

- new trade;
- migration;
- new dungeon/region access;
- increased visitor traffic;
- new political claims;
- ecological movement.

It is not automatic travel of the dead.

---

# 32. Memory Sea Storm

A **Memory Sea Storm** is a major aquatic/environmental disturbance.

Possible effects:

- navigation disruption;
- changed echo state;
- flooding;
- stranded ferries;
- exposed drowned structures;
- altered aquatic migration;
- temporary resource access;
- settlement damage.

Storms use Memory Sea environmental systems and do not randomly delete world history.

---

# 33. Historical Revelation

A **Historical Revelation** occurs when new credible evidence changes the known interpretation of a place, polity, event or claim.

It may affect:

- Codex truth state;
- claimant legitimacy;
- archive access;
- settlement politics;
- dungeon state;
- diplomacy;
- restoration projects.

A revelation may prove, complicate or disprove an existing account.

The game must allow uncertainty where evidence remains insufficient.

---

# 34. Competing Claim

A **Competing Claim** event creates active conflict over:

- land;
- archive ownership;
- historic district;
- Soulwood orchard;
- route authority;
- sovereignty;
- cultural relics;
- Necropolis infrastructure.

Possible outcomes include negotiation, evidence review, shared governance, legal ruling, purchase, alliance, occupation or combat.

The event framework must not assume the oldest claimant is automatically correct.

---

# 35. Forgotten District Reappearance

A **Forgotten District Reappearance** occurs when a Forgotten City Reflection becomes materially accessible or stable enough to affect the world.

Possible consequences:

- new structures;
- displaced occupants;
- claimant disputes;
- lost craft recovery;
- dungeon activation;
- route changes;
- restoration opportunity;
- hazards from inaccurate reconstruction.

Reappearance does not automatically resurrect all historical inhabitants.

---

# 36. Mourning Mist Crisis

A **Mourning Mist Crisis** is a severe regional intensification of unresolved grief/history-related environmental state.

Possible effects:

- route distortion;
- visibility loss;
- increased investigation sites;
- displaced populations;
- settlement morale/health pressure;
- native creature migration.

Resolution may involve investigation, memorial work, restoration, evacuation, cleansing or political acknowledgement.

The game must never reward deliberately manufacturing suffering merely to farm mist resources.

---

# 37. Ossuary Bloom

An **Ossuary Bloom** is a major ecological event in Ossuary Orchard systems.

It may represent:

- unusually strong flowering/propagation;
- rapid orchard expansion;
- fungal symbiosis surge;
- wildlife population response;
- excessive/unstable growth.

Possible consequences:

- Soulwood propagation opportunity;
- orchard labour demand;
- wildlife migration;
- trade opportunity;
- ecological imbalance;
- restoration conflict.

It is not corpse-powered tree growth.

---

# 38. Archive Breach

An **Archive Breach** occurs when protected historical/memory systems lose containment, integrity or lawful access control.

Possible causes:

- structural damage;
- theft;
- internal corruption;
- false indexing;
- hostile faction action;
- guardian failure;
- Void corruption.

Effects may include:

- dangerous record exposure;
- false-history propagation;
- identity confusion;
- political crisis;
- Memory Eater involvement.

---

# 39. Predator Dark Expansion

A **Predator Dark Expansion** is the growth of weak-remembrance/identity-predator territory.

Effects may include:

- route closure;
- Remnant Eater migration;
- Lantern Wisp retreat;
- settlement evacuation;
- anchor demand;
- dungeon activation;
- rescue operations.

It is a native realm crisis unless explicitly contaminated by Void influence.

---

# 40. Necropolis Political Crisis

A **Necropolis Political Crisis** is a polity-scale conflict involving engineered persistence, body-state, succession, identity storage, citizenship or the right to continue/end a system.

Possible forms:

- succession crisis;
- maintenance collapse;
- citizen revolt;
- body-rights dispute;
- contested identity continuity;
- secession;
- constitutional reform;
- external intervention.

Valid resolutions must include political/non-combat possibilities where appropriate.

Undead or persistence-based citizens cannot be treated as disposable monsters by default.

---

# 41. Void Incursion

A **Void Incursion** is explicit external Void corruption entering Ancestral territory.

It must remain mechanically and visually distinct from:

- Devouring Silence;
- Predator Dark;
- Mourning Mists;
- natural decay;
- Remnant Eater predation;
- Necropolis failure.

Possible outcomes include:

- containment;
- cleansing;
- evacuation;
- stabilisation;
- research;
- controlled sacrifice of infrastructure;
- cross-realm assistance;
- severe irreversible transformation where FCC-03I/J allows it.

FCC-03H owns the event family; FCC-03I owns corruption-state interaction in detail.

---

# 42. Event Persistence and Combination

Event families may combine where causally valid.

Examples:

- Memory Sea Storm → Drowned Halls access → Historical Revelation;
- Archive Breach → Competing Claim;
- Predator Dark Expansion → Route Closure;
- Necropolis Political Crisis → Processional Opening/Closure;
- Void Incursion → Archive Breach or route destabilisation.

Combination must use explicit causal state, not random event stacking.

Events may leave lasting evidence through:

- changed Blocks;
- damaged/repaired structures;
- ownership;
- settlement migration;
- route state;
- archive truth state;
- ecology;
- NPC memory/reputation;
- maps;
- Codex;
- trade;
- faction state.

---

# 43. Authority and Event Interaction

Authorities may respond to events without owning the event framework.

Examples:

- Memory Eater may become involved in Archive Breach or dangerous Historical Revelation.
- Uncrowned Ancestor may become central to Competing Claim or Forgotten District Reappearance.
- Ferryman Sovereign may become central to Route Closure, Processional Opening or Memory Sea Storm.

No authority must spawn for every matching event.

Authority participation is derived from world seed, territory, relationship and state.

---

# 44. Failure, Retreat and Recovery

Ancestral dungeons and authorities must support readable failure and retreat where encounter structure allows it.

Failure may cause:

- lost access;
- increased hazard;
- political consequence;
- temporary route closure;
- guardian hostility;
- settlement damage;
- lost salvage opportunity;
- event escalation.

Failure may not:

- corrupt the save intentionally;
- delete the player's identity;
- permanently erase required quest data;
- remove all return routes without explicit recoverable system;
- trap a player permanently in the realm.

Recovery may require:

- alternate route;
- repair;
- negotiation;
- rescue;
- new evidence;
- changed equipment;
- cleansing;
- settlement support;
- later rematch.

---

# 45. Difficulty and Scaling

Difficulty may adjust:

- enemy count;
- guardian move complexity;
- timing windows;
- hazard intensity;
- clue redundancy;
- resource pressure;
- encounter preparation requirements;
- recovery assistance;
- damage.

Difficulty must not change canon truth.

For example:

- lower difficulty cannot make the Ferryman Sovereign own respawn;
- higher difficulty cannot permanently delete names;
- performance mode cannot change which claimant is legally recognised;
- accessibility mode cannot turn false evidence into true evidence.

---

# 46. Accessibility Contract

Ancestral adventure content frequently manipulates:

- sound;
- labels;
- names;
- visibility;
- map certainty;
- route recognition;
- reflective imagery.

Therefore critical mechanics require redundant presentation.

## 46.1 Silence

Critical telegraphs in Devouring Silence cannot be audio-only.

## 46.2 Name / Label Disruption

Identity hazards may visually scramble labels, but critical objectives and recovery routes need accessible fallback markers.

## 46.3 Mist

Reduced visual-distortion settings may simplify fog/refraction without changing authoritative hazard state.

## 46.4 Colour

Claims, route states, danger and evidence classifications cannot rely on colour alone.

## 46.5 Flash / Distortion

Memory and identity effects must obey reduced-flash and reduced-motion settings.

---

# 47. Multiplayer Contract

Universal multiplayer authority executes dungeon and authority state.

FCC-03H requires:

- one authoritative dungeon state;
- one authoritative evidence state;
- one authoritative guardian/authority outcome;
- safe handling of players in different dungeon zones;
- reconnect/rejoin recovery;
- no permanent identity effect applied from client-only presentation;
- contribution tracking that recognises non-combat roles.

Contribution may include:

- fighting;
- healing;
- evidence recovery;
- route repair;
- negotiation prerequisites;
- infrastructure;
- rescue;
- cleansing;
- logistics.

---

# 48. Performance and Simulation Scaling

Adventure canon remains identical across performance profiles.

Lower-end modes may reduce:

- distant NPC actors;
- guardian animation complexity;
- visual memory echoes;
- water-reflection complexity;
- particle density;
- live route visualisation;
- crowd density;
- off-screen room simulation frequency.

Distant dungeons may update through aggregate state.

Scaling may not change authoritative:

- dungeon topology solvability;
- evidence truth;
- ownership;
- guardian outcome;
- authority outcome;
- reward quantities after committed transactions;
- route state;
- settlement consequences;
- event result.

---

# 49. Art-Handoff: Dungeon Families

Later visual governance must preserve distinct family identities.

## Processional Necropolis

- route-city scale;
- bridges, stations, memorial civic architecture;
- recognised-name and route motifs;
- living/active occupation possible;
- not simply a giant graveyard.

## Memory Archive

- architecture shaped by records, collections and reconstruction;
- readable difference between intact, censored, damaged and false layers;
- Memory Glass use without turning every surface transparent.

## Spirit Court

- judicial/diplomatic spatial hierarchy;
- evidence, witness and authority cues;
- cultural variants;
- not universal gothic throne room.

## Drowned Remembrance Halls

- flooded civic/archive architecture;
- waterline and recovered-history state readability;
- functioning aquatic ecology;
- drowned city rather than generic underwater ruin.

## Devouring Silence Zone

- absence, reduced cues and anchor contrast;
- must remain visually distinct from Void corruption;
- accessibility-safe route/anchor readability.

---

# 50. Art-Handoff: Guardians and Authorities

## Guardians

Guardian families need silhouettes/functions matching their role rather than simply enlarged generic enemies.

- Procession Warden → route/infrastructure protection.
- Archive Custodian → archive/access protection.
- Court Adjudicator → judicial/recognition role.
- Drowned Keeper → aquatic/infrastructure stewardship.
- Silence Devourer → absence/anchor pressure.

## Memory Eater

Must read as a major memory-regulation/predation authority distinct from the smaller Remnant Eater species.

## Uncrowned Ancestor

Must visually support multiple seed/history expressions rather than lock every instance to “dead human king.”

## Ferryman Sovereign

Must read as sovereign of routes, ferries, crossings and transit infrastructure, not the god of death or resurrection.

## Predatory Lineage Spirit

Must support seed- and history-derived identity rather than one fixed anatomy or ancestry stereotype. Visual language should communicate predation on recognition/continuity without resembling Void corruption or implying every lineage spirit is a literal dead ancestor.

## Grave-Sea Procession

Must read at **titan/procession scale**: a moving host/fleet with vessels, route markers, names, memorial/civic elements and a coherent travel direction. It should be able to occupy land-water transition spaces and Memory Sea routes without visually becoming a generic ghost navy or universal afterlife ferry.

Exact palettes, VFX, animation and audio remain deferred.

---

# 51. Source Reconciliation Register

| Earlier Direction | FCC-03H Resolution |
|---|---|
| Five Set 24 dungeon families | Preserved exactly with stable IDs |
| Processional Necropolis routes solidify through lineage/funeral rites | Reframed around recognised names, records, relationships, local rites and route infrastructure; no universal dead transit |
| Memory Archive truth/bias/missing memories | Retained and expanded with evidence-vs-interpretation boundary |
| Spirit Court obligations/ancestor factions | Retained as bounded legal/diplomatic content |
| Drowned Halls recovered names lower water | Reframed so recovered truth changes explicit flood/infrastructure/site state rather than magical global water response |
| Devouring Silence erases names/maps/relationships | Retained as temporary bounded disruption; no authoritative data deletion |
| Three Set 24 authority stable IDs | Preserved exactly |
| Memory Eater | Retained and reframed as ecological/intellectual memory-regulation authority |
| Uncrowned Ancestor = dead sovereign denied burial | Broadened to ancestral/memory sovereign of unresolved legitimacy; dead sovereign remains one possible instance history |
| Ferryman Sovereign controls death travel/spirit migration/resurrection law | Explicitly superseded; now owns Ancestral route/ferry/crossing infrastructure and law only |
| Predatory lineage spirit as fourth Atlas boss hook | **Promoted into FCC-03 as the canonical Predatory Lineage Spirit variable boss-family; remains separate from the three fixed authorities** |
| Grave-Sea Procession titan | **Promoted into FCC-03 with stable ID `titan.ancestral.grave_sea_procession`; afterlife/alternate-portal implications reconciled to final Veil law** |
| Boss = required combat | Rejected; authorities have multiple resolution families |
| Guardian = automatic enemy | Rejected |
| Dungeon cleared = empty/free property | Rejected; ownership/personhood persists |
| Generic soul/memory loot | Rejected |
| Native horror = Void corruption | Rejected |
| Authorities control portal type | Rejected; Veilgate remains universal Realm Access interface |

---

# 52. Cross-Document Interfaces

## FCC-03A

Supplies realm laws, no-afterlife-simulation rule, fixed dungeon/guardian/authority roster and universal ownership boundaries.

## FCC-03B

Supplies biome suitability, hazards, environmental states, Memory Sea, Mourning Mists, Predator Dark and Devouring Silence boundaries.

## FCC-03C

Supplies materials, resource provenance and no-soul-economy rules.

## FCC-03D

Supplies flora, orchard ecology and restoration hooks.

## FCC-03E

Supplies creature ecology, Remnant Eater distinction and creature-resource boundaries.

## FCC-03F

Supplies civilisations, claimants, Necropolis polities, courts, settlements and political consequence.

## FCC-03G

Supplies structures, Veilgate, Blocks, Items, processing, recipe relationships and signature infrastructure.

## FCC-03I

Consumes dungeon/authority/event outcomes for:

- identity/memory dynamic states;
- Necropolis dynamics;
- Void corruption;
- restoration;
- cross-realm interaction.

## FCC-03J

Certifies:

- five dungeon families;
- five guardian families;
- three fixed authorities;
- one canonical variable boss-family: Predatory Lineage Spirit;
- one canonical titan/world-scale encounter: Grave-Sea Procession;
- twelve event families;
- stable-ID preservation;
- authority supersession;
- reward provenance;
- no death/respawn ownership drift;
- art-handoff completeness.

---

# 53. Canonical Registry Snapshot

## 53.1 Dungeons

1. `dungeon.realm.ancestral.processional_necropolis` — **Processional Necropolis**
2. `dungeon.realm.ancestral.memory_archive` — **Memory Archive**
3. `dungeon.realm.ancestral.spirit_court` — **Spirit Court**
4. `dungeon.realm.ancestral.drowned_remembrance` — **Drowned Remembrance Halls**
5. `dungeon.realm.ancestral.devouring_silence` — **Devouring Silence Zone**

## 53.2 Guardians

1. `guardian.realm.ancestral.procession_warden` — **Procession Warden**
2. `guardian.realm.ancestral.archive_custodian` — **Archive Custodian**
3. `guardian.realm.ancestral.court_adjudicator` — **Court Adjudicator**
4. `guardian.realm.ancestral.drowned_keeper` — **Drowned Keeper**
5. `guardian.realm.ancestral.silence_devourer` — **Silence Devourer**

## 53.3 Fixed Authorities

1. `boss.realm.ancestral.memory_eater` — **Memory Eater**
2. `boss.realm.ancestral.uncrowned_ancestor` — **Uncrowned Ancestor**
3. `boss.realm.ancestral.ferryman_sovereign` — **Ferryman Sovereign**

## 53.4 Additional Canonical Major-Encounter Foundations

1. `boss.family.ancestral.predatory_lineage_spirit` — **Predatory Lineage Spirit** — variable boss-family
2. `titan.ancestral.grave_sea_procession` — **Grave-Sea Procession** — titan/world-scale encounter foundation

## 53.5 Major Realm Events

1. Route Closure
2. Processional Opening
3. Memory Sea Storm
4. Historical Revelation
5. Competing Claim
6. Forgotten District Reappearance
7. Mourning Mist Crisis
8. Ossuary Bloom
9. Archive Breach
10. Predator Dark Expansion
11. Necropolis Political Crisis
12. Void Incursion

---


# 53.6 v0.2 Atlas Restoration Amendment

Version 0.2 restores two Atlas elements that v0.1 had left outside the fixed FCC roster:

1. **Predatory Lineage Spirit** — promoted from Atlas boss hook to a canonical variable boss-family.
2. **Grave-Sea Procession** — promoted from Atlas titan foundation to canonical Ancestral titan/world-scale encounter content using its preserved stable ID.

This amendment does **not** change:

- the five canonical dungeon families;
- the five canonical dungeon guardian families;
- the three fixed realm authorities;
- the twelve canonical realm-event families;
- the universal death/respawn boundary;
- Veilgate as the one canonical normal Ancestral portal type.

The amendment broadens the realm's major-encounter canon while preserving the ownership boundaries already locked in FCC-03A–G.

---

# 54. FCC-03H Acceptance Gate

FCC-03H is ready for realm-local acceptance only when all of the following are true:

- exactly five canonical dungeon families are locked;
- all five Set 24 dungeon stable IDs are preserved;
- exactly five dungeon guardian families are locked;
- guardian families remain reusable encounter roles rather than extra fixed authorities;
- exactly three fixed realm authorities are locked;
- all three Set 24 authority stable IDs are preserved;
- the Atlas fourth boss hook is preserved through the Predatory Lineage Spirit variable boss-family;
- the Atlas Grave-Sea Procession stable titan ID is preserved;
- Processional Necropolis no longer implies universal dead transit;
- Memory Archive supports truth, bias, omission and conflicting interpretation;
- Spirit Court uses explicit evidence/identity/legitimacy state;
- Drowned Remembrance Halls links recovered history to explicit flood/access/political state;
- Devouring Silence uses bounded, recoverable disruption and cannot delete save data;
- Procession Warden, Archive Custodian, Court Adjudicator, Drowned Keeper and Silence Devourer have distinct world roles;
- Remnant Eater, Silence Devourer and Memory Eater are clearly separate entities;
- Memory Eater supports regulation, recovery, redirection, containment and combat outcomes;
- Uncrowned Ancestor is not universally constrained to “dead king awaiting burial”;
- Ferryman Sovereign is explicitly stripped of death, resurrection and universal soul-migration ownership;
- no authority is a mandatory kill for basic realm completion solely because of material loot;
- Predatory Lineage Spirit is canonically present as a variable boss-family while remaining separate from the three fixed authorities;
- Grave-Sea Procession is canonically present with stable ID `titan.ancestral.grave_sea_procession` as a titan/world-scale encounter foundation;
- Grave-Sea Procession's old `opens Veil passage` outcome is reconciled so it cannot create a second normal Ancestral portal type;
- Grave-Sea Procession's migration effects cannot become automatic universal dead/soul migration;
- supporting adventure-site categories exist without inflating the dungeon-family registry;
- dungeon persistence, ownership, restoration and conversion are defined;
- reward provenance excludes generic Soul/Ancestral Essence/Memory Fragment economies;
- exactly twelve major realm-event families are locked;
- native Ancestral hazards remain distinct from Void corruption;
- failure and retreat cannot permanently erase identity or trap the player irrecoverably;
- accessibility safeguards cover silence, mist, name disruption and colour-independent information;
- low-end scaling preserves authoritative dungeon, authority and event truth;
- art-handoff distinctions are explicit.

**FCC-03H Status:** **REALM-LOCAL LOCK CANDIDATE — pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**
