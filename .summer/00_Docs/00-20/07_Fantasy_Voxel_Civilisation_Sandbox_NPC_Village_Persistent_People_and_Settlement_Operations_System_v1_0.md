# LEYFORGE

## 07 — NPC Village, Persistent People and Settlement Operations System

### Persistent Identity, Households, Work, Daily Life, Labour, Migration, Settlement Operation and Scalable Civilisation Runtime

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Supersedes:** `07_Fantasy_Voxel_Civilisation_Sandbox_NPC_Village_System_v0_2` for active production direction  
**Primary Vision Authority:** Document 00 v1.0  
**Primary Gameplay-Loop Authority:** Document 01 v1.0  
**Player Progression Consumer:** Document 02 v1.0  
**Physical Registry Inputs:** Documents 03–06 v1.0  
**World-Generation Input:** Document 11 v1.0 and World Content Atlas Set 24  
**Settlement Growth Authority:** Document 19  
**Building/Service Authority:** Document Set 20  
**Social Authority:** Document Set 28  
**Biological Authority:** Document Set 29  
**Economy Authority:** Document Set 27  
**Movement/Navigation Authority:** Document Set 30, with Set 26 aquatic/maritime providers  
**Production Governance:** Document Set 25  
**Project Lead and Final Authority:** Ash

A production-scale NPC civilisation system for persistent people and living settlements. Document 07 owns who ordinary NPC residents are, where they belong, how households and jobs are organised, what routine work they intend to perform, how settlement operations remain coherent, how migration changes populations, and how those facts persist across streaming and simulation LOD. It consumes specialist systems for social relationships, biology, economy and movement rather than recreating them.

> **NPC Civilisation Statement**
>
> **A Leyforge settlement is a community of persistent people operating real homes, workplaces, storage, services and infrastructure. Residents are not decorative actors or quest dispensers. They possess stable identity, household membership, work, schedules, inventories, responsibilities and history. Their settlement succeeds or fails because people, resources, buildings, routes, services and external systems genuinely function.**

> **Single-Person-Truth Rule**
>
> **A persistent NPC exists once. Their scene actor, visual model, dialogue session, relationship records, biological records, economic contracts and movement state are specialist representations or linked records around the same stable person identity; none of them creates a duplicate person.**

> **Intent Is Not Execution Rule**
>
> **Document 07 may decide that a worker should go to a field, warehouse, workshop, home, emergency shelter or construction site. Set 30 decides whether and how that person physically reaches it and returns authoritative arrival or failure evidence.**

---

# Document Purpose

Document 07 defines the persistent-person and settlement-operation layer of Leyforge.

Earlier versions already established the strongest parts of the civilisation fantasy:

- named persistent residents;
- households and homes;
- jobs and skills;
- schedules and routine autonomy;
- personal and shared inventories;
- physical warehouses;
- real consumption and production;
- visible construction labour;
- migration and population change;
- settlement damage and recovery;
- persistent consequences; and
- nearby/distant simulation LOD.

Those concepts remain valid.

The production reconciliation changes **ownership**, **scope** and **world assumptions**.

Document 07 no longer assumes one fixed Forest Hamlet or a compact hard-coded job roster. It operates on arbitrary seed-generated settlements, mixed cultures, ports, inland towns, frontier camps, magical communities, player-founded settlements and other approved civilisation contexts.

It also no longer owns systems that later specialist sets now define in detail:

- Set 27 owns prices, wages, markets, economic contracts and public finance.
- Set 28 owns dialogue, beliefs, rumours, relationship semantics, trust, loyalty, social memory interpretation, recruitment, companions and social assignment intent.
- Set 29 owns Health, Stamina, Fatigue, hunger, hydration, temperature, wetness, sleep, injury, disease, toxins, treatment and biological modifiers.
- Set 30 owns terrestrial/aerial movement, route accessibility, travel time, local NPC pathfinding, formations and movement LOD.
- Set 26 owns specialist maritime crew/vessel operations and aquatic movement providers where designated.
- Document 19 owns settlement growth orchestration, parcels, districts, project pools, player proposals and player-founded settlement planning.
- Document Set 20 owns the seven settlement needs and universal building/service activation contracts.

Document 07 therefore becomes cleaner and more important: it is the **persistent person, household, job, routine labour and settlement-operation authority** that binds those specialist systems to actual communities.

---

# 1. Locked System Identity

Document 07 is Leyforge's persistent civilian-population and ordinary-settlement-operation authority.

## 1.1 Document 07 Owns

Document 07 owns:

- persistent ordinary NPC person identity;
- NPC existence and lifecycle record;
- settlement residency and citizenship-context references where the political owner permits;
- household membership and household operational record;
- residence assignment and bed/home linkage;
- ordinary job identity and job assignment;
- workplace assignment;
- ordinary schedules and schedule windows;
- routine task intent and utility task selection;
- labour availability after consuming specialist restrictions;
- bounded personal inventory ownership and ordinary carried work stock;
- settlement-facing household demand projections;
- ordinary worker reservations;
- ordinary settlement operational state;
- population roster and population change record;
- migration in/out execution at the settlement-operation level;
- promotion of meaningful temporary/background people into persistent identity;
- demotion/aggregation policy for routine population where permitted;
- ordinary education/apprenticeship participation hooks;
- ordinary construction-labour participation;
- ordinary maintenance/repair labour participation;
- settlement incident participation/history links;
- persistent person-to-place and person-to-role links;
- settlement simulation LOD orchestration for Document-07-owned state;
- local/distant equivalence of Document-07 state;
- settlement operational diagnostics; and
- production interfaces from ordinary people/households/jobs to specialist systems.

## 1.2 Document 07 Does Not Own

Document 07 does **not** own:

- dialogue runtime;
- belief or rumour state;
- Trust, Affection, Fear, Loyalty or other social relationship dimensions;
- persuasion or negotiation;
- companion recruitment/agreement;
- delegated social assignment lifecycle;
- social-memory semantics;
- market prices;
- wages;
- labour contracts;
- merchant price formation;
- taxes;
- household financial accounting;
- Health or Stamina;
- Hunger or Hydration;
- Fatigue or Sleep Pressure;
- injury, disease, toxins or treatment;
- movement speed;
- pathfinding;
- route accessibility;
- travel time;
- mount/vehicle movement;
- swimming or detailed aquatic movement;
- combat resolution;
- settlement-stage promotion;
- district planning;
- universal building-service capacity;
- blueprint authoring;
- culture/faction political identity;
- law definition;
- quest lifecycle; or
- UI presentation authority.

## 1.3 Identity Promise

A named person remains the same person when:

- they walk out of view;
- their actor is despawned;
- they travel to another settlement;
- they change jobs;
- they marry or change household;
- they become injured;
- they become a companion;
- they take a wage contract;
- they become a sailor;
- their settlement is conquered;
- the player leaves for months;
- the world is saved and loaded;
- the simulation changes LOD;
- their appearance assets are revised; or
- the game migrates their record to a newer schema.

---

# 2. Production Ownership Freeze

The final Sets 27–30 Cross-Set Interface Register v1.1 establishes the following relevant ownership:

| Gameplay Truth | Final Owner | Document 07 Relationship |
|---|---|---|
| Prices, value, currency, markets, wages, contracts, finance, taxes, trade-route economics | Set 27 | Supplies person/job/household/workplace facts; consumes economic outcomes. |
| Dialogue, beliefs, rumours, social memory, trust, loyalty, willingness, companion agreements, social assignment intent | Set 28 | Supplies stable person/household/job/schedule context; consumes social decisions. |
| Health, Stamina, Fatigue, hunger/hydration/nutrition, temperature/wetness/sleep, injury, disease, toxins, treatment, biological modifiers | Set 29 | Consumes biological availability and population-health summaries. |
| Ground/air/traversal movement, mounts, land vehicles, physical routes, route accessibility, travel time, local navigation/path execution, movement LOD | Set 30 | Sends destination/task intent; consumes movement arrival/failure. |
| Aquatic locomotion and specialist vessel movement | Set 26 provider boundary | Consumed for maritime/aquatic NPC operation where applicable. |
| Physical roads/bridges/building infrastructure | Document 20 / structure owners | Document 07 uses activated services and access points. |

> **No Formula Re-Creation**
>
> If Document 07 needs a value owned by another set, it reads the owner's typed result. It does not reconstruct a “close enough” local formula.

---

# 3. Revision from Document 07 v0.2

Document 07 v0.2 remains a strong architectural source. Version 1.0 preserves most of its core NPC/village runtime design while reconciling later ownership.

## 3.1 Preserved from v0.2

- persistent named people;
- stable IDs separate from actors;
- households;
- homes;
- jobs and workplace roles;
- schedules;
- bounded personal inventories;
- physical storage;
- real labour;
- real resource conservation;
- settlement autonomy;
- visible construction;
- permanent consequences;
- migration;
- local/distant simulation;
- Godot/Summer direction;
- Entity Forge visual separation;
- Blueprint Forge structure separation;
- Document 19 settlement-planning boundary;
- Document 20 seven-needs and building/service boundary; and
- authoritative commands/events rather than UI mutation.

## 3.2 Narrowed or Transferred

The following broad v0.2 areas are narrowed because later specialist sets now own them:

| Earlier Broad Area | Production Owner |
|---|---|
| Detailed social relationships | Set 28 |
| Trust/fear/loyalty calculations | Set 28 |
| Social memory representation/interpretation | Set 28 |
| Dialogue and requests through conversation | Set 28 + Document 15 |
| Companion state | Set 28 |
| Detailed personal survival needs | Set 29 |
| Injury/disease/treatment | Set 29 |
| Wages and market trade | Set 27 |
| Physical caravans/travel | Set 30 / Set 26 |
| NPC pathfinding | Set 30 |
| Settlement promotion/project planning | Document 19 |
| Service capacity | Document Set 20 |

## 3.3 POC Content Archived

The following become archive/test fixtures:

- Forest Hamlet as mandatory content;
- the eight-person fixed roster;
- fixed elder/builder/farmer/guard/merchant/mage/miner/lumberjack arrangement;
- fixed village warehouse;
- fixed request board;
- fixed watchtower project;
- fixed goblin raid relationship;
- fixed Hearthplain geography;
- fixed POC political/cultural identities; and
- POC-specific tutorial sequencing.

Their underlying capabilities survive.

---

# 4. Canonical Person Architecture

A persistent person is not a Godot scene node.

## 4.1 Persistent Person Record

A person record should contain or reference:

- persistent person instance ID;
- person-definition/archetype references where used;
- generated identity seed/provenance;
- display-name identity;
- existence/lifecycle state;
- age or life-stage record owned by Document 07 where applicable;
- ancestry/culture/faction/citizenship references owned elsewhere;
- settlement affiliation;
- household membership;
- residence/home assignment;
- bed/rest-location reference;
- job assignment;
- workplace assignment;
- ordinary schedule profile;
- personal inventory reference;
- equipment references;
- skill/proficiency references;
- knowledge/recipe entitlement references;
- biological-profile reference;
- Set 29 biological-record reference;
- Set 28 social-profile/relationship-record references;
- economic-party/employment references;
- movement-profile/state reference;
- quest/event participation references;
- presentation/appearance profile reference;
- historical incident references;
- promotion/protection priority;
- source revision;
- save revision; and
- migration/provenance data.

## 4.2 Person Identity Versus Definitions

A reusable `NPCDefinition` or generation profile is not a person.

A runtime person:

- can change jobs;
- can move home;
- can migrate;
- can become a companion;
- can become unemployed;
- can become wealthy or poor;
- can become injured;
- can die;
- can change clothing;
- can acquire memories and relationships;
- can gain skills; and
- can change settlement allegiance.

Those changes do not require changing the immutable source definition.

---

# 5. Person Generation and Promotion

Leyforge should not require every possible distant background actor to receive a fully expanded record immediately.

## 5.1 Persistent by Default for Residents

Ordinary established settlement residents should normally have persistent identity.

## 5.2 Compact Background Agents

Some generated:

- travellers;
- transient labour pools;
- caravan groups;
- distant visitors;
- temporary crowds; or
- low-relevance populations

may initially use compact records where their owning systems permit it.

## 5.3 Promotion Triggers

An agent should become a protected persistent individual when meaningful identity becomes required, such as:

- direct player interaction;
- household formation;
- named employment;
- ownership;
- injury of lasting significance;
- crime/witness relevance;
- social relationship;
- companion recruitment;
- quest/event role;
- leadership;
- specialist expertise;
- unique equipment;
- important contract;
- persistent travel;
- rescue;
- authored story;
- memorial/death significance; or
- other approved evidence.

Promotion cannot create a second person or duplicate their inventory.

---

# 6. Appearance and Entity Forge Boundary

Entity Forge owns:

- editable body source;
- rigs;
- body-part composition;
- appearance layers;
- hair/clothing presentation;
- animations;
- attachment anchors;
- dialogue anchors;
- interaction markers;
- hitbox/presentation contracts; and
- baked runtime presentation products.

Document 07 owns the stable gameplay person.

## 6.1 Appearance Persistence

A person record may preserve deterministic resolved appearance choices so the person remains visually recognisable across:

- actor unloading;
- save/load;
- asset rebakes;
- outfit changes;
- equipment changes; and
- LOD.

## 6.2 Appearance Does Not Grant Gameplay State

A blacksmith apron does not create a blacksmith job.

A guard uniform does not create guard authority.

A bandage visual does not create an injury.

A wedding outfit does not create marriage.

Presentation reflects authoritative state; it does not invent it.

---

# 7. Households

Households are persistent operational groups connecting people to homes and shared domestic context.

Document 07 owns:

- household instance ID;
- member roster;
- household residence links;
- dependent/caregiver operational links where needed;
- household inventory/storage rights where applicable;
- household settlement affiliation;
- ordinary provision-access context;
- household relocation state;
- household split/merge request execution;
- household crisis state;
- household migration linkage; and
- household-history references.

Set 28 owns the social meaning of interpersonal relationships within or outside the household.

## 7.1 Household Is Not Relationship

Two people can:

- be family but live in different households;
- share a household without romance;
- be close friends but not co-resident;
- be married under social/law systems and temporarily live apart;
- be workers living in communal accommodation; or
- be unrelated dependants/caregivers.

Household membership is an operational residence/community fact.

## 7.2 Household Change

Set 28 may resolve a social milestone such as marriage.

Document 13/law may determine whether it is recognised.

Document 07 executes any resulting:

- household merge;
- new household;
- residence reassignment;
- dependent move;
- migration; or
- schedule change

after validation.

---

# 8. Housing and Residence

A resident should have a meaningful relationship to shelter.

Document 20 defines functional housing/service capacity.

Document 19/20 owns built structures and settlement planning.

Document 07 owns:

- which resident/household is assigned to which valid residence;
- bed/rest-location allocation;
- displacement state;
- overcrowding operational evidence;
- relocation intent;
- residence access failure;
- household housing priority; and
- resident consequences of lost housing at the settlement-operation level.

Set 29 owns biological consequences from sleep/exposure.

## 8.1 Housing Failure

If a home becomes:

- destroyed;
- inaccessible;
- occupied;
- unsafe;
- flooded;
- corrupted;
- unheated where required;
- lacking valid beds;
- legally unavailable; or
- otherwise non-functional,

Document 07 updates residence/household operational state and seeks a valid alternative.

It does not directly inflict biological damage.

---

# 9. Settlement Needs Boundary

The only seven main settlement needs remain:

1. Housing
2. Provisions
3. Health
4. Work
5. Safety
6. Infrastructure
7. Morale

Document Set 20 owns the universal top-level need/service framework.

Document 07 supplies population-facing demand and usage evidence.

## 9.1 Personal State Is Not Another Settlement Bar

Do not create new top-level settlement meters for:

- Hunger;
- Hydration;
- Sleep;
- Fatigue;
- Loneliness;
- Tool shortage;
- Clothing;
- Medicine;
- Education;
- Crime;
- Religion;
- Entertainment; or
- wealth.

These may contribute to the seven needs through their appropriate owners.

## 9.2 Biological Need Inputs

Set 29 owns actual biological state.

Document 07 consumes bounded summaries such as:

- recovery status;
- care need;
- treatment urgency;
- assignment survival availability;
- population health summary;
- biologically relevant work restrictions; and
- care-demand projections.

Document 07 may then alter:

- work assignment;
- schedule;
- emergency staffing;
- service demand;
- shelter allocation; or
- migration willingness inputs,

but does not recalculate biology.

---

# 10. Jobs

A job is an operational assignment linking a persistent person to an authorised role and usually a valid workplace/service.

## 10.1 Job Requirements

A job may require:

- job definition;
- worker eligibility;
- skills/knowledge;
- workplace;
- workstation/marker;
- tools/equipment;
- route access;
- schedule window;
- resource inputs;
- output/storage destination;
- legal/permission state;
- biological availability;
- safety conditions;
- specialist service; and
- economic employment context where applicable.

## 10.2 Job Does Not Guarantee Work

A person can have a job but be unable to work because:

- sick/injured;
- route blocked;
- workplace damaged;
- tool missing;
- stock unavailable;
- machine unavailable;
- order absent;
- strike/social refusal where supported;
- law/permission changed;
- emergency duty;
- settlement evacuation;
- weather/environmental closure; or
- schedule window closed.

## 10.3 Changing Jobs

NPCs may:

- retrain;
- apprentice;
- promote;
- change roles;
- become unemployed;
- take temporary emergency roles;
- migrate for opportunity;
- become specialists;
- retire from a role where supported; or
- return to a prior profession.

Exact wages and employment contracts belong to Set 27.

---

# 11. Skills, Knowledge and Training

Document 02 owns the global progression framework.

Document 07 stores or references NPC-relevant skill/proficiency state required for:

- job eligibility;
- work speed;
- quality;
- teaching;
- safety;
- specialist roles;
- construction;
- repair;
- operation; and
- succession.

## 11.1 No Full Player Sheet Requirement

Ordinary residents do not need the full complexity of a player's progression presentation.

They may use bounded skill profiles compatible with the same underlying capability vocabulary.

## 11.2 Apprenticeship

Document 07 may coordinate:

- teacher availability;
- learner assignment;
- schedule windows;
- workplace access;
- training participation;
- progression evidence; and
- role succession.

Document 20B owns education/training facility functions.

Document 02 owns progression meaning.

Set 27 owns wages/fees/contracts where applicable.

---

# 12. Schedules

Schedules define broad intended time windows, not frame-by-frame movement scripts.

Common schedule intents may include:

- sleep/rest;
- household time;
- meal/provision access;
- work;
- training;
- market/service use;
- worship/culture/community activity;
- maintenance;
- patrol/guard duty;
- social activity;
- travel;
- leisure;
- care;
- emergency response; and
- authored event participation.

## 12.1 Schedule Flexibility

A schedule is modified by:

- emergency;
- biological availability;
- social commitments;
- event/quest;
- weather/environment;
- workplace availability;
- settlement policy;
- economic contract;
- movement failure;
- family/household need;
- danger;
- construction priority; and
- player-authorised intervention.

## 12.2 Schedules Do Not Move Actors

The schedule says **what the person intends to do and by when**.

Set 30 resolves actual movement.

---

# 13. Utility Task Selection

Within an allowed schedule window, Document 07 may choose among valid routine tasks.

A candidate task should consider:

- current schedule;
- assigned job;
- household responsibility;
- settlement priority;
- valid target;
- required resources;
- required tool;
- reservation status;
- worker eligibility;
- biological availability from Set 29;
- social permission/willingness where required from Set 28;
- economic employment/contract state from Set 27;
- movement feasibility from Set 30;
- building/service activation from Document 20;
- event/quest constraints; and
- player policy.

## 13.1 Task Commit Model

A consequential routine task follows:

**Intent → Eligibility → Reservation → Movement Request → Arrival Evidence → Domain Action → Result Evidence → Release/Next Task**

No step may be skipped because the NPC is off-screen.

## 13.2 Failure

A failed task records a reason such as:

- no route;
- target invalid;
- target occupied;
- no tool;
- no stock;
- service inactive;
- biological unavailable;
- permission denied;
- social refusal;
- contract invalid;
- hazard;
- world unloaded beyond permitted operation;
- reservation conflict; or
- external domain failure.

The scheduler then retries, chooses another task or escalates according to policy.

---

# 14. Movement and Navigation Integration

Set 30 owns the physical truth of NPC navigation.

Document 07 sends:

- mover/person reference;
- movement intent;
- destination/target reference;
- schedule/deadline context;
- route policy where authorised;
- task priority;
- group/escort context;
- transport preference/permission refs; and
- callback/evidence requirements.

Set 30 returns:

- route/path result;
- accessibility;
- estimated/actual travel time;
- movement mode;
- arrival;
- interruption;
- blocker;
- route invalidation;
- separation; or
- safe recovery evidence.

## 14.1 No Teleport Work

An unloaded NPC may use distant travel abstraction only when Set 30's route/journey model permits it.

Document 07 cannot say:

> “The worker's schedule says work starts at 08:00, therefore they are now at the mine.”

## 14.2 Dynamic Voxel World

When:

- a door closes;
- a bridge breaks;
- a wall is built;
- a path floods;
- a lift loses power;
- a road is blocked; or
- terrain is edited,

Set 30 invalidates affected path/route evidence.

Document 07 consumes the failure and replans intent.

---

# 15. Personal Inventories

Persistent residents may own bounded personal inventories for:

- tools;
- equipment;
- food carried for use;
- work materials;
- personal possessions;
- trade goods;
- quest/story objects;
- medicine/care items;
- documents;
- ammunition; and
- job-specific equipment.

Document 04 owns Item identity.

Document 03 owns carried Block projections.

## 15.1 Ownership

Inventory ownership must remain explicit.

An NPC may not consume:

- player storage;
- another household's private stock;
- project-reserved stock;
- merchant stock;
- military reserves;
- sacred/restricted stock; or
- another person's equipment

without valid authority or a committed theft/confiscation/transfer transaction.

## 15.2 No Summary Duplication

A settlement UI may show “132 food units available”.

That is a read model.

It does not create a second abstract food inventory if the authoritative stock exists in physical storage/owned inventories.

---

# 16. Settlement Storage and Warehouses

Document 07 consumes physical storage/service contracts from Documents 03, 20 and Automation.

It owns settlement operational use such as:

- storage access policy inputs;
- worker haul demand;
- household withdrawal intent;
- job input/output routing intent;
- project delivery intent;
- reserve priority;
- emergency allocation intent;
- inventory summaries;
- stock shortage evidence; and
- storage incident response.

## 16.1 Reserved Stock

Project stock, contract stock, emergency stock and other protected reserves must remain distinguishable.

Routine consumption cannot steal an active project reservation unless the owning policy explicitly releases/reallocates it.

## 16.2 Automation

Automation can deliver to settlement storage only through:

- physical/logical valid endpoints;
- ownership;
- permission;
- capacity;
- route/network;
- accepted input;
- transaction; and
- authoritative arrival.

Document 07 never increments settlement stock because “automation should have produced enough by now.”

---

# 17. Workplaces and Services

Document Set 20 owns universal building/service capability.

Document 07 uses the resulting activation/service records.

A workplace is usable only if the owning building/service system says it is valid.

Potential blockers include:

- structure damage;
- missing semantic marker;
- route failure;
- missing utility;
- missing tool;
- no staffing slot;
- no input;
- output blocked;
- hazard;
- ownership/permission;
- contamination;
- power failure;
- mana failure;
- legal closure; or
- maintenance.

Document 07 chooses people/tasks around those facts.

---

# 18. Production and Crafting Labour

Document 05 owns transformations.

Document 07 provides:

- authorised worker;
- workstation context;
- skill/proficiency;
- job assignment;
- schedule;
- item/tool access;
- reservation;
- production-order intent;
- target storage; and
- participation evidence.

A production job succeeds only after Document 05 or the owning production system commits the transformation.

## 18.1 No NPC-Only Free Recipes

An NPC cannot produce free goods merely because they have the title “Blacksmith”.

NPC production must use the same authoritative transformation/conservation architecture as other production, with approved NPC-specific capability or recipe variants only where defined.

---

# 19. Construction Labour

Document 19 chooses/orchestrates settlement projects.

Document 20 defines the universal function/construction contracts.

Blueprint Forge supplies validated structure source/runtime products.

Document 05 owns project transformation/resource transactions.

Document 07 supplies workers and ordinary construction-task execution.

## 19.1 Construction Flow

**Settlement Capability Gap**  
→ Document 19 planner/project choice  
→ Document 20 functional contract  
→ validated blueprint/site  
→ project reservations  
→ Document 07 labour assignment  
→ Set 30 movement to material/site  
→ Document 05/structure owner commits construction work  
→ stage evidence  
→ commissioned structure  
→ service activation  
→ new jobs/household/service opportunities.

## 19.2 Visible Local Construction

Nearby workers may visibly:

- collect tools;
- collect materials;
- travel;
- clear approved terrain;
- carry stock;
- place stages;
- use scaffolds;
- repair;
- inspect;
- commission; and
- return unused stock.

## 19.3 Distant Construction

Distant construction may batch representation but must preserve:

- worker availability;
- route validity;
- stock;
- reservations;
- project progress;
- tools/capability;
- interruptions;
- damage; and
- authoritative stage results.

---

# 20. Maintenance and Repair Labour

Routine settlements may autonomously schedule repair when:

- a service is degraded;
- materials exist;
- workers exist;
- route exists;
- law/ownership permits;
- higher-priority emergencies do not block it; and
- the relevant structure/recipe owner permits repair.

Player-founded settlement settings may alter:

- auto-repair;
- approval thresholds;
- reserve usage;
- priority classes; and
- protected player edits.

Document 07 supplies labour, not the structure repair formula.

---

# 21. Population Roster

Each settlement maintains a population roster referencing persistent people and approved compact cohorts.

The roster can distinguish:

- resident;
- temporary resident;
- visitor;
- migrant;
- worker;
- dependent;
- specialist;
- leader;
- prisoner/detainee where law systems require;
- guest;
- displaced person;
- companion temporarily present;
- caravan/vessel crew in port; and
- other approved statuses.

Status does not replace social, political, legal or economic records owned elsewhere.

---

# 22. Migration

Migration is a persistent movement of person/household residence context between settlements or regions.

Document 07 owns:

- migration candidate operational state;
- household migration grouping;
- settlement departure/arrival roster changes;
- residence release/assignment;
- job release/assignment hooks;
- migration queue;
- settlement population consequences;
- migration history; and
- person persistence through the move.

## 22.1 Migration Inputs

Migration may consume:

- housing capacity;
- work opportunity;
- safety;
- infrastructure;
- provisions;
- health-service context;
- morale;
- family/household context;
- social relationships;
- culture/faction context;
- law;
- wages/economic opportunity;
- route/travel time;
- biological availability;
- danger;
- event state;
- player policy; and
- settlement-stage/growth context.

The specialist owner decides its own factor.

## 22.2 Migration Is Not Spawn/Despawn

A migrant is not deleted at origin and randomly recreated at destination.

The same persistent person moves.

---

# 23. Population Growth and Life-Stage State

Document 07 maintains ordinary person lifecycle and settlement-population roster state, including age/life-stage references required for:

- dependency;
- education;
- job eligibility;
- housing;
- household operation;
- succession; and
- migration.

Detailed biological health and physiology remain Set 29-owned.

Detailed social family/romance/marriage meaning remains Set 28-owned.

## 23.1 No Hidden Population Counter

Population should resolve to:

- persistent people;
- protected individuals;
- and approved compact cohorts where scale requires abstraction.

A settlement cannot gain “+20 population” without a migration/birth/promotion/generation process supported by its owning systems.

## 23.2 Family and Household Events

Social systems may resolve:

- relationships;
- marriage;
- separation;
- guardianship/care decisions; and
- other interpersonal milestones.

Document 07 performs resulting household/residence/population changes after validation.

---

# 24. Settlement Autonomy

Settlements manage ordinary life without turning Leyforge into mandatory colony micromanagement.

Routine autonomous operations include:

- filling ordinary work;
- performing routine tasks;
- hauling;
- using food/services;
- sleeping;
- repairing;
- staffing services;
- training replacements;
- responding to minor shortages;
- using roads/transport;
- responding to weather;
- sheltering in emergencies;
- maintaining homes/workplaces;
- processing normal production;
- participating in markets through Set 27; and
- generating planner inputs.

The player intervenes when:

- policy matters;
- shortages are meaningful;
- project choice matters;
- danger escalates;
- specialised knowledge is missing;
- trade/contract opportunity exists;
- political/social conflict matters;
- infrastructure is insufficient;
- settlement growth creates choices; or
- the player simply wants to participate.

---

# 25. Settlement Policies

Document 07 may consume settlement policies affecting ordinary operations, such as:

- work priority;
- reserve priority;
- curfew/schedule constraints;
- emergency response;
- food allocation;
- repair priority;
- construction labour priority;
- training priority;
- visitor access;
- warehouse access;
- evacuation;
- trade participation;
- public-service access; and
- recruitment/migration policy.

The policy owner may be:

- settlement governance;
- player-founded settlement authority;
- faction/law;
- event/emergency command; or
- another designated system.

Document 07 executes valid operational consequences without inventing political authority.

---

# 26. Economy Integration

Set 27 owns economy.

Document 07 supplies economic actors and physical work context such as:

- person ID;
- household ID;
- job;
- workplace;
- labour availability;
- skills;
- schedule availability;
- produced/required physical stock;
- settlement demand;
- storage;
- merchant role;
- service role;
- ownership links; and
- migration/work opportunity context.

Set 27 supplies:

- price;
- wage;
- payment;
- quote;
- market demand;
- economic standing;
- contract;
- employment compensation;
- enterprise state;
- household economic state;
- fiscal state; and
- trade economics.

## 26.1 Employment

A Document-07 job assignment is not automatically a Set-27 wage contract.

Cultures/world settings may support:

- wages;
- household labour;
- communal labour;
- duty/service;
- guild systems;
- bonded/legal obligations where allowed by design;
- ownership-share systems;
- public employment; or
- other economic structures.

Set 27 owns their economic meaning.

## 26.2 Trade

Document 07 can provide a merchant NPC and warehouse stock.

It cannot calculate the final sale price.

---

# 27. Social-System Integration

Set 28 owns the detailed social layer.

Document 07 supplies stable facts:

- person identity;
- household;
- home;
- job;
- workplace;
- schedule;
- settlement;
- culture/faction references;
- inventory;
- ordinary task;
- lifecycle state;
- migration;
- world incidents;
- biological summary references;
- economic context references; and
- movement/travel context references.

Set 28 owns:

- dialogue;
- relationship dimensions;
- trust;
- affection;
- fear as social relationship state;
- loyalty;
- social memory;
- beliefs;
- rumours;
- personality-driven social reactions;
- persuasion;
- negotiation;
- diplomacy interaction;
- recruitment;
- companions;
- witnesses;
- social reputation; and
- delegated social assignments.

## 27.1 Social Summary Consumption

Document 07 may consume read-only social outputs for routine task selection, such as:

- willingness;
- relationship-safe cooperation state;
- companion status;
- social permission;
- assignment intent;
- disclosure-safe knowledge; and
- household-change request.

It does not persist a competing Trust value.

## 27.2 Ordinary Jobs Versus Delegation

Routine settlement work belongs to Document 07.

A player/socially negotiated delegated assignment belongs to 28G, which may call an authorised Document-07 labour adapter.

---

# 28. Biology Integration

Set 29 owns biological state.

Document 07 must not maintain duplicate:

- Health;
- Stamina;
- Fatigue;
- Hunger;
- Hydration;
- Body Temperature/Thermal Load;
- Wetness;
- Sleep Pressure;
- injury;
- disease;
- poison/toxin;
- blood loss;
- treatment;
- recovery; or
- biological carrying penalty.

## 28.1 Worker Availability

Set 29 can expose:

- assignment survival availability;
- recovery status;
- care need;
- treatment urgency;
- movement/exertion modifiers;
- carry penalty;
- population health summary; and
- critical condition.

Document 07 uses these to:

- cancel work;
- assign rest;
- reduce schedule load;
- request care;
- choose a replacement worker;
- shelter a population;
- alter emergency staffing; or
- generate settlement demand.

## 28.2 Population Health Summary

For distant or large settlements, Set 29 may provide cohort/population health summaries.

Document 07 does not independently aggregate injury/disease percentages using a separate formula.

---

# 29. Safety, Emergency and Defence

Document 16 owns combat/defence resolution.

Document 20C and relevant structure/law systems own physical defence capability and justice infrastructure.

Document 07 owns civilian/workforce operational response such as:

- warning receipt;
- work suspension;
- evacuation intent;
- shelter assignment;
- emergency staffing;
- guard-role staffing input;
- medical-care demand;
- supply movement intent;
- repair-labour response;
- displaced household state;
- casualty roster change after authoritative outcome; and
- return-to-normal scheduling.

## 29.1 Guard Jobs

Document 07 owns ordinary guard employment/assignment.

Document 16 owns actual combat actions and results.

## 29.2 Death

When the authoritative death owner commits a person's death, Document 07 updates:

- existence/lifecycle state;
- settlement roster;
- job vacancy;
- household membership;
- residence;
- owned inventory inheritance/estate handoff through relevant systems;
- project/labour reservations;
- leadership vacancy hooks;
- memorial/history references; and
- migration/population consequences.

Set 28 handles grief/relationship/social-memory consequences.

---

# 30. Requests, Quests and Events

Document 15 owns quest/event state.

Document 07 can expose genuine settlement conditions such as:

- missing worker;
- low staffing;
- damaged workplace;
- disrupted schedule;
- housing displacement;
- migration pressure;
- specialist shortage;
- blocked route;
- project labour shortage;
- lost tools;
- missing resident;
- workforce injury;
- storage issue; or
- settlement operational crisis.

Document 15 decides whether a condition becomes a formal quest/event.

## 30.1 Request Boards

A physical/digital/request-board interface may display:

- valid opportunities;
- contracts;
- public needs;
- jobs;
- projects;
- shortages;
- warnings; and
- authored quests.

The board does not create the underlying need.

---

# 31. Culture, Faction, Law and Citizenship

Document 13 owns:

- ancestry;
- culture;
- language definitions;
- faction identity;
- government;
- law;
- territory;
- religion;
- political membership;
- political history; and
- related civilisation identity.

Document 07 stores references needed to operate actual people and settlements.

## 31.1 No Ancestry Job Lock

Ancestry does not automatically determine:

- job;
- morality;
- culture;
- class;
- profession;
- settlement role; or
- allegiance.

Authored biological capability differences, culture rules or specialist training may influence eligibility where their owners explicitly define them.

## 31.2 Mixed Settlements

Document 07 must support:

- multi-ancestry households;
- mixed cultures;
- migrants;
- refugees/displaced populations;
- multiple factions;
- neutral residents;
- cultural minorities;
- visiting specialists; and
- changing settlement identity.

---

# 32. World Generation Integration

Document 11 supplies generated settlement contexts.

Document 07 does not require:

- Forest Hamlet;
- fixed biome;
- fixed road;
- fixed job roster;
- fixed resource source;
- fixed danger;
- fixed village size; or
- fixed nearest settlement.

## 32.1 Generated Settlement Intake

A generated settlement context may provide:

- site ID;
- world/region;
- biome;
- culture/faction references;
- historical state;
- starting structure/service set;
- population-generation profile;
- resource context;
- route context;
- safety;
- law/government context;
- neighbouring sites;
- trade opportunity;
- port/coastal context;
- magical context; and
- Atlas content provenance.

Document 07 materialises/operates the people appropriate to that context.

## 32.2 No Hidden POC Fallback

If a generated settlement fails validation, repair chooses another valid generated/capability-equivalent settlement profile.

It does not secretly inject the Forest Hamlet roster.

---

# 33. Settlement Growth Integration

Document 19 owns:

- settlement growth ladder;
- parcels;
- districts;
- project pools;
- project selection orchestration;
- player proposals;
- player-founded settlements; and
- settlement planning.

Document 07 sends planner inputs such as:

- population;
- household count;
- housing demand;
- job demand;
- staffing shortage;
- service usage;
- worker capacity;
- migration pressure;
- safety incidents;
- storage constraints;
- specialist gaps;
- maintenance backlog;
- labour availability;
- objections/preferences; and
- settlement consequences.

Document 19 returns approved project/planning decisions.

---

# 34. Building and Service Integration

Document Set 20 owns:

- seven needs;
- universal building functions;
- activation contracts;
- service capacities;
- construction categories;
- facility requirements;
- network/infrastructure service definitions; and
- catalogue governance.

Document 07 supplies:

- occupants;
- workers;
- households;
- users;
- demand;
- staffing;
- usage;
- labour; and
- consequences.

A settlement cannot create “health service” or “market service” merely because an NPC has a matching job title.

---

# 35. Automation and Special Labour

Document 08 owns automation.

Document 09 owns magic.

Document 10 may own creature/golem/familiar behaviour where applicable.

Document 07 can:

- assign operators;
- create settlement demand;
- request hauling;
- respond to faults;
- consume automation deliveries;
- schedule maintenance;
- coordinate workers around machines;
- provide authorised labour; and
- incorporate specialist outputs.

It does not simulate machine or magic output itself.

## 35.1 Golems and Constructs

If a construct is not a biological persistent person, Document 07 does not force it into the humanlike person schema.

It may still use compatible work/task interfaces through its actual owner.

---

# 36. Maritime Professions and Coastal Settlements

Set 26 extends Leyforge civilisation into maritime life.

Document 07 supports persistent people with roles such as:

- dock worker;
- fisher;
- shipwright labourer;
- rigger;
- sailmaker;
- harbour worker;
- navigator;
- crew member;
- marine gatherer;
- diver where biologically/equipment-valid;
- coastal trader;
- port guard;
- rescue worker; and
- other approved maritime professions.

## 36.1 Ownership Boundary

Document 07 owns the **person and ordinary job assignment**.

Set 26 owns specialist maritime gameplay such as:

- vessel operation;
- crew stations where defined;
- voyage execution;
- ship construction/refit specialist rules;
- maritime hazards;
- ports/shipyards specialist systems;
- cargo/vessel interfaces;
- naval systems; and
- aquatic/marine movement providers.

Set 27 owns maritime economic terms.

Set 30 provides universal movement facade/cross-medium coordination where applicable.

## 36.2 Port Residency

A port settlement can contain:

- permanent residents;
- seasonal workers;
- visiting crews;
- merchants;
- passengers;
- migrants;
- naval/military visitors;
- shipyard workers; and
- transient travellers

without converting every visitor into permanent household membership.

---

# 37. Player-Founded Settlements

Document 19 owns player-founded settlement orchestration.

Document 07 supplies the living population layer.

Players may influence:

- job priorities;
- migration policy;
- storage permissions;
- labour priorities;
- project labour;
- public-service access;
- schedules at policy level;
- emergency policy;
- settlement permissions; and
- recruitment

subject to law, social agency, settings and ownership.

## 37.1 No Puppet Population by Default

A player-founded settlement does not automatically turn every NPC into a directly controlled unit.

NPC agency, social willingness, law, contracts and specialist systems still apply unless a world/game mode explicitly changes that experience.

---

# 38. Conquest, Occupation, Abandonment and Restoration

Settlements can change dramatically without deleting their people/history.

Document 07 supports:

- residents fleeing;
- residents remaining;
- job disruption;
- occupation status references;
- household displacement;
- prisoner/detainee context;
- new authority references;
- resource access changes;
- service shutdown;
- work reassignment;
- reconstruction labour;
- migration;
- return;
- leadership vacancy; and
- historical continuity.

Political/legal ownership belongs elsewhere.

## 38.1 No Settlement Reset

Conquest does not mean:

> despawn old villagers → spawn generic enemy villagers.

Persistent people survive or die according to actual events and authoritative outcomes.

---

# 39. Simulation LOD

Document 07 uses multiple representation levels while preserving the same persistent state.

A conceptual model:

### L0 — Active Individual
- fully instantiated actor;
- local schedule/task;
- local inventory interaction;
- physical movement through Set 30;
- visible work;
- direct interaction.

### L1 — Local Reduced
- persistent individual retained;
- reduced task/movement updates;
- lower presentation frequency;
- local service use still resolved.

### L2 — Settlement Summary
- named/protected people remain individual;
- routine workers may batch compatible operations;
- household/job/service state remains explicit;
- physical stock remains conserved;
- Set 29 may aggregate routine biological cohorts where allowed.

### L3 — Regional Abstract
- settlement-level bounded operation;
- only exceptional named people remain high-detail;
- journeys use Set 30 distant movement;
- production/economy/social/biology use their own LOD outputs.

### L4 — Dormant/Scheduled
- persistent commitments and milestone wakeups;
- no fake continuous actor simulation;
- catch-up occurs through bounded scheduled events.

## 39.1 LOD Is Representation, Not Different Rules

Distance may change:

- how often a task is evaluated;
- how much animation exists;
- whether each footstep is simulated; and
- whether routine work is batched.

Distance cannot change:

- who owns an item;
- whether a worker exists;
- whether someone died;
- whether a route is valid;
- whether a contract was paid;
- whether an injury exists;
- whether stock was consumed;
- whether a project completed; or
- whether a relationship outcome occurred.

---

# 40. Promotion and Demotion

When a persistent person changes representation, preserve:

- person ID;
- settlement;
- household;
- home;
- job;
- schedule;
- current task intent;
- current location/journey reference;
- inventory;
- equipment;
- reservations;
- biological link/revision;
- social links/revisions;
- economic obligations;
- movement state;
- quest/event participation;
- history;
- source revision; and
- unresolved blockers.

## 40.1 Reconciliation Barrier

If external domain state is still catching up after loading a distant settlement, the NPC may temporarily remain unavailable for consequential interaction until the relevant authoritative revisions reconcile.

This is preferable to interacting with half-loaded truth.

---

# 41. Distant Catch-Up

Long absences should process through bounded, deterministic catch-up.

Catch-up may evaluate:

- elapsed simulation time;
- household state;
- job/workplace validity;
- production schedules;
- storage;
- project labour;
- migration milestones;
- service demand;
- biological summaries;
- social milestones/events;
- economic obligations;
- travel;
- threats/events; and
- construction.

Each external effect must be committed by its owner.

## 41.1 Catch-Up Does Not Invent History

If no valid event caused:

- death;
- migration;
- promotion;
- marriage;
- construction;
- item creation;
- debt;
- injury; or
- relationship change,

catch-up cannot create it solely to make the settlement feel “busy”.

---

# 42. World Time and Evidence

Documents 27–30 establish shared time/evidence requirements.

Document 07 uses the authoritative world timeline for:

- schedules;
- work;
- travel intent;
- migration;
- household changes;
- training;
- construction labour;
- incident history; and
- catch-up.

## 42.1 Evidence IDs

Consequential cross-system events should carry stable evidence/transaction IDs where retries or replay could duplicate effects.

Examples:

- employment accepted;
- worker assigned;
- goods withdrawn;
- project labour completed;
- person migrated;
- person died;
- household changed;
- route arrival;
- training milestone;
- social request accepted; and
- economic payment committed.

---

# 43. Multiplayer Authority

The host/server owns authoritative NPC/settlement operations.

Clients may:

- inspect allowed person/settlement views;
- request interactions;
- request policy changes if authorised;
- issue permitted commands/intents;
- display predicted presentation; and
- observe movement.

Clients may not directly:

- edit job state;
- add population;
- move NPCs;
- create inventory;
- set relationships;
- alter biology;
- complete tasks;
- change contracts;
- finish projects; or
- teleport residents.

## 43.1 Split-Screen

Multiple local players may have different:

- UI filters;
- knowledge;
- social relationships;
- quest state;
- permissions; and
- accessibility settings

while sharing the same authoritative settlement.

---

# 44. Persistence

Document-07-owned persistent data includes:

- people;
- households;
- residence assignments;
- job assignments;
- schedule state where necessary;
- settlement roster;
- migration;
- ordinary task commitments that must survive save;
- personal inventory ownership references;
- reservations;
- operational settlement state;
- LOD state;
- history references;
- definition/schema revisions; and
- unresolved/migration state.

Transient local actor animation state is not the source of truth.

## 44.1 Save Safety

Save must not leave a person:

- in two households;
- in two settlements as a resident;
- owning duplicate inventory;
- assigned to a deleted workplace with no recovery state;
- both dead and working;
- simultaneously travelling and locally instantiated without reconciliation;
- duplicated after migration; or
- separated from specialist state without a recoverable reference.

---

# 45. Migration and Schema Evolution

Stable person IDs must survive content revisions.

Migration may:

- remap job definition;
- remap building role;
- remap culture/faction reference;
- migrate schedule schema;
- split old broad social fields into Set 28 records;
- split old biological fields into Set 29 records;
- migrate path state to Set 30;
- migrate employment/economic state to Set 27;
- convert POC settlement IDs to archive/test references; and
- quarantine invalid records.

Migration must not silently delete a named person to solve a schema problem.

---

# 46. Registry Families

Document 07 requires production registries for concepts such as:

- person-generation profile;
- settlement-population profile;
- household profile;
- residence-allocation policy;
- job definition;
- workplace role;
- job eligibility profile;
- schedule profile;
- routine task definition;
- task-priority policy;
- labour reservation profile;
- personal inventory profile;
- migration policy;
- population promotion policy;
- settlement operation policy;
- LOD profile;
- catch-up policy;
- person-history event class;
- diagnostic reason definition; and
- cross-system adapter definition.

Set 25 governs qualified IDs, packages, schemas, migrations and provenance.

---

# 47. Canonical Data Flow

## 47.1 Generated Settlement Intake

`Worldgen/Atlas Context`  
↓  
`Settlement Identity + Culture/Faction/History/Environment`  
↓  
`Population Generation Profile`  
↓  
`Persistent People + Households + Initial Residences/Jobs`  
↓  
`Document 20 Service Availability + Document 19 Growth Context`  
↓  
`Daily Schedules and Routine Task Intent`  
↓  
`Set 27 / 28 / 29 / 30 Specialist Facts`  
↓  
`Authoritative Work / Movement / Social / Economic / Biological Outcomes`  
↓  
`Persistent Settlement Consequence`

## 47.2 Routine Work

`Schedule Window`  
→ `Task Candidate`  
→ `Eligibility`  
→ `Resource/Tool Reservation`  
→ `Set 29 Availability`  
→ `Set 28 Permission/Willingness if required`  
→ `Set 27 Contract/Employment check if required`  
→ `Set 30 Movement`  
→ `Owning Domain Action`  
→ `Committed Result`  
→ `History / Next Task`

---

# 48. UI and Read Models

Document 17 owns presentation.

Document 07 should expose read models such as:

- settlement roster summary;
- household summary;
- housing assignment;
- job/workforce summary;
- worker shortage;
- schedule state;
- current routine task;
- workplace blocker;
- warehouse/storage summary;
- migration state;
- displaced resident count;
- labour availability;
- project workforce;
- settlement operational alerts;
- LOD/catch-up summary for developer tools; and
- reason codes.

Sensitive social/biological/economic details remain filtered by their owners.

---

# 49. Accessibility

NPC civilisation systems should remain understandable without requiring:

- colour-only statuses;
- rapid reaction;
- tiny icons;
- constant alerts;
- exact numeric relationship values;
- manual worker assignment;
- memorisation of schedules; or
- reading debug data.

Players should be able to inspect:

- what is wrong;
- who is affected;
- why a worker is unavailable;
- what service is missing;
- whether a route failed;
- whether stock is reserved;
- whether the problem is social, biological, economic, movement, building or project-related; and
- what actions are possible.

---

# 50. Diagnostics

Document 07 should expose stable diagnostic reason families.

| Code | Meaning |
|---|---|
| `NPC-ID-001` | Invalid/missing persistent person identity. |
| `NPC-HH-001` | Invalid household membership. |
| `NPC-HOME-001` | Residence unavailable/invalid. |
| `NPC-JOB-001` | Job assignment invalid. |
| `NPC-WORK-001` | Workplace/role unavailable. |
| `NPC-SCHED-001` | Schedule cannot resolve valid state. |
| `NPC-TASK-001` | Routine task invalid. |
| `NPC-RES-001` | Required reservation missing/conflicted. |
| `NPC-STOCK-001` | Required stock unavailable. |
| `NPC-BIO-001` | Set 29 reports worker unavailable/restricted. |
| `NPC-SOC-001` | Set 28 reports permission/willingness/social blocker. |
| `NPC-ECON-001` | Set 27 reports employment/contract/economic blocker. |
| `NPC-MOVE-001` | Set 30 reports route/path/arrival failure. |
| `NPC-SVC-001` | Document 20 service/workplace inactive. |
| `NPC-PROJ-001` | Project labour request invalid. |
| `NPC-MIG-001` | Migration cannot complete. |
| `NPC-LOD-001` | Promotion/demotion reconciliation failed. |
| `NPC-SAVE-001` | Persistence/migration inconsistency. |
| `NPC-AUTH-001` | Unauthorised mutation request. |
| `NPC-POC-001` | Retired POC identity or fixed-roster dependency detected in production. |

---

# 51. Validation

## 51.1 Person Invariants

Validate that:

- every persistent person has one ID;
- one existence/lifecycle state is authoritative;
- settlement membership is coherent;
- household membership is coherent;
- residence references resolve;
- jobs resolve;
- workplace roles resolve;
- inventories resolve;
- external specialist links resolve or enter recoverable fallback;
- no duplicate person exists after LOD/save/migration; and
- dead/departed people cannot continue ordinary active work.

## 51.2 Household Invariants

Validate:

- members exist;
- residence is valid or displacement is explicit;
- household not duplicated;
- dependent/care context is coherent;
- private storage rights resolve; and
- migration does not orphan household members silently.

## 51.3 Work Invariants

Validate:

- job eligibility;
- active workplace;
- tools;
- stock;
- schedule;
- route;
- biological availability;
- social permission where required;
- economic contract where required;
- reservation;
- authoritative domain result; and
- no output without committed transformation.

## 51.4 LOD Equivalence

Run the same settlement period:

- fully loaded;
- partly loaded;
- distant; and
- dormant/catch-up.

Consequential outputs should reconcile within the approved abstraction tolerance while preserving exact protected identities, stock and committed history.

---

# 52. Test Laboratories

Required production tests should include:

## 52.1 Generated Settlement Lab
Generate many settlements across different biomes/cultures.

Verify no fixed Forest Hamlet assumptions.

## 52.2 Household Lab
Create, split, relocate and migrate households.

Verify stable people and residence links.

## 52.3 Work Lab
Block tools, stock, workplace, route, biology and permission one at a time.

Verify correct reason and no free output.

## 52.4 Construction Labour Lab
Supply a staged project.

Verify workers reserve, travel, build, pause on blockers and preserve resources.

## 52.5 Social Boundary Lab
Change Set 28 trust/permission/companion state.

Verify Document 07 consumes summaries but does not duplicate values.

## 52.6 Biological Boundary Lab
Injure/fatigue/care-restrict a worker through Set 29.

Verify work changes without Document 07 editing health.

## 52.7 Economy Boundary Lab
Change wage/contract/market state through Set 27.

Verify job/economic effects without local price calculations.

## 52.8 Movement Lab
Close gate, break bridge, damage road, block ladder.

Verify Set 30 failure drives scheduler replan; no teleport.

## 52.9 Maritime Settlement Lab
Operate a coastal settlement with shipyard/port workers and visiting crew.

Verify person identity remains Document 07 while vessel/voyage operation remains Set 26.

## 52.10 LOD Lab
Promote/demote a dense settlement repeatedly.

Verify no duplicate people, stock, tasks or specialist records.

## 52.11 Migration Lab
Move households through long-distance Set 30 journey.

Verify origin/destination population, cargo and identity.

## 52.12 Conquest/Recovery Lab
Change authority, damage services, displace residents, rebuild.

Verify people/history persist.

---

# 53. Performance and Scalability

Performance must scale without converting important people into disposable actors.

Scalable dimensions include:

- schedule evaluation frequency;
- routine task batching;
- local path request frequency through Set 30;
- background actor presentation;
- animation LOD;
- distant service use;
- cohort handling;
- summary update interval;
- UI update frequency; and
- catch-up work budget.

## 53.1 Protected People

Named/story/social/medical/contract/companion-important people remain individually protected even if the surrounding population is aggregated.

## 53.2 Low-End Profiles

Low-end settings may reduce:

- actor count instantiated simultaneously;
- local animation detail;
- path update rate;
- distant update frequency;
- social ambient events;
- presentation density; and
- background simulation granularity.

They do not delete:

- persistent named people;
- inventory;
- deaths;
- migration;
- contracts;
- jobs;
- construction progress;
- settlements; or
- committed world history.

---

# 54. Godot and Summer Engine Direction

Exact implementation belongs to the replacement Document 18.

Document 07 requires the eventual Godot architecture to support:

- versioned registry Resources/data;
- persistent person records independent of scene nodes;
- world-scoped services;
- event-driven commands;
- task scheduler;
- reservation service;
- interfaces to inventory/recipes;
- Set 27 economy adapter;
- Set 28 social adapter;
- Set 29 biology adapter;
- Set 30 movement adapter;
- Set 26 maritime adapter;
- settlement/project/service adapters;
- deterministic LOD/catch-up;
- save journals/migrations;
- debug inspectors;
- reason codes; and
- multiplayer authority.

Summer Engine may assist implementation, generation, testing and tooling under reviewable change controls.

---

# 55. POC Preservation and Archive

The Forest Hamlet POC remains a useful **regression fixture**.

It may still be used to verify:

- persistent identity;
- households;
- jobs;
- schedules;
- personal inventories;
- shared storage;
- construction labour;
- automation delivery;
- guard/emergency response;
- injury/death handoff;
- repair;
- save/load;
- promotion/demotion; and
- player-visible cause/effect.

It is not a production generation template.

## 55.1 Preserved Capability Matrix

| POC Element | Production Capability |
|---|---|
| Named villagers | Persistent generated people |
| Elder | Leadership/governance-compatible resident role |
| Builder | Construction labour |
| Farmer | Agricultural work |
| Guard | Settlement defence employment |
| Merchant | Economic actor consuming Set 27 |
| Mage | Specialist magic worker consuming Document 09 |
| Miner | Resource extraction labour |
| Lumberjack | Forestry labour |
| Warehouse | Settlement storage/service system |
| Request board | UI/quest/contract projection of real needs |
| Watchtower construction | Generic staged settlement project |
| Goblin raid | Generic threat/event integration |
| Injuries/casualties | Set 29/16 outcomes applied to persistent people |
| Village repair | Generic repair labour/project |
| Reputation | Set 28/13 social/political reactions |
| Fixed Forest Hamlet | Archived test settlement only |

---

# 56. Main-Document Reconciliation Requirements

This production Document 07 creates obligations for later foundation revisions.

| Document | Required Reconciliation |
|---|---|
| 08 — Automation | Settlement automation must use Document-07 people/operators/permissions but never duplicate jobs or NPC identity. |
| 09 — Magic | Mage roles and magical services use Document-07 people while Magic owns spells/mana/ritual outcomes. |
| 10 — Creatures | Intelligent non-player settlements/factions must decide whether they use Document-07 person semantics or creature-owned populations; no duplicate actor identity. |
| 12 — Structures | Runtime structures expose residence/work/service markers used by Document 07. |
| 13 — Peoples/Cultures/Factions | Political/cultural identity remains external; Document 07 references it for real residents. |
| 15 — Quests/Events | Simulation conditions from Document 07 can generate quests/events, but quest state remains Document 15. |
| 16 — Combat | Guards/civilians use persistent person IDs; combat outcomes feed Document 07 and Set 29. |
| 17 — UI/UX | Village/NPC screens use filtered read models and cross-owner reason codes. |
| 18 — Technical | Implement person records, task scheduling, adapters, LOD, save and multiplayer in Godot/Summer. |
| 19 — Settlement Growth | Planner consumes Document-07 population/labour/demand after reconciliation. |
| 20 — Buildings | Service/staffing contracts consume Document-07 people without duplicating jobs or need formulas. |

---

# 57. Production Acceptance Criteria

Document 07 v1.0 is accepted when:

- [x] persistent person identity is clearly owned;
- [x] household membership remains owned by Document 07;
- [x] jobs/schedules/routine labour remain owned by Document 07;
- [x] the seven settlement needs remain Document-20-owned;
- [x] Set 28 owns detailed social state;
- [x] Set 29 owns biological state;
- [x] Set 27 owns economy;
- [x] Set 30 owns movement/path execution;
- [x] Set 26 maritime ownership is preserved;
- [x] Document 19 owns growth/project planning;
- [x] Document 20 owns service/building capability;
- [x] arbitrary seed-generated settlements replace Forest Hamlet assumptions;
- [x] persistent people work in mixed cultures/settlements;
- [x] inventories and labour remain resource-conserving;
- [x] ordinary jobs are separated from Set-28 delegated assignments;
- [x] movement intent is separated from arrival;
- [x] biological availability is consumed rather than recalculated;
- [x] wages/prices/contracts are consumed rather than recalculated;
- [x] social summaries are consumed rather than duplicated;
- [x] local/distant simulation preserves the same identity/state;
- [x] migration preserves the same person;
- [x] construction labour remains visible and authoritative;
- [x] POC roster/scenario is archive-only;
- [x] Godot/Summer direction replaces obsolete Unreal assumptions; and
- [x] later foundation documents can consume Document 07 without ownership ambiguity.

---

# Appendix A — Persistent Person Record Template

```yaml
person_instance:
  person_id: person:<ulid>
  schema_version: 1
  source_profile_ref: npc_profile:<qualified_id>
  provenance:
    generated_from_world: world:<id>
    generation_context_ref: settlement_site:<id>
    identity_seed: <stable>
  identity:
    display_name_key_or_generated_name: <value>
    existence_state: alive
    life_stage_ref: life_stage:<id>
  world_context:
    settlement_ref: settlement:<id>
    household_ref: household:<id>
    residence_ref: structure_instance:<id>
    bed_or_rest_marker_ref: marker:<id>
  work:
    job_definition_ref: job:<id>
    workplace_ref: structure_instance:<id>
    workplace_role_ref: work_role:<id>
    schedule_profile_ref: schedule:<id>
    current_task_intent_ref: task_intent:<id>?
  inventory:
    personal_inventory_ref: inventory:<id>
    equipment_set_ref: equipment_state:<id>
  progression:
    skill_profile_ref: npc_skill_state:<id>
    knowledge_refs: []
  external_domains:
    culture_refs: []
    faction_refs: []
    biological_record_ref: biology:<id>
    social_profile_ref: social_profile:<id>
    economic_party_ref: economic_party:<id>
    movement_record_ref: movement:<id>
  history:
    incident_refs: []
    migration_refs: []
  runtime:
    lod_state: <L0-L4>
    protected_individual: true
    revision: <n>
```

---

# Appendix B — Household Record Template

```yaml
household:
  household_id: household:<ulid>
  settlement_ref: settlement:<id>
  member_person_refs: []
  residence_refs: []
  shared_storage_refs: []
  dependent_or_care_links: []
  displacement_state: none
  relocation_intent_ref: null
  migration_group_ref: null
  operational_priority: normal
  history_refs: []
  revision: <n>
```

No social relationship dimension is stored here merely because two people share the household.

---

# Appendix C — Job Definition Template

```yaml
job_definition:
  job_id: leyforge.core.job.<path>
  schema_version: 1
  category_tags: []
  workplace_role_tags: []
  eligibility:
    skill_requirements: []
    knowledge_requirements: []
    equipment_requirements: []
    biological_compatibility_query: true
    social_permission_query: optional
    economic_employment_query: optional
  schedule_profile_ref: schedule:<id>
  task_pool_refs: []
  workplace_capability_refs: []
  tool_tags: []
  input_access_tags: []
  output_destination_tags: []
  safety_requirements: []
  movement_context_requirements: []
  training_paths: []
  replacement_priority: <class>
  owner: document07
```

Wage values do not belong in this definition.

---

# Appendix D — Routine Task Intent Template

```yaml
routine_task_intent:
  task_intent_id: task:<ulid>
  person_ref: person:<id>
  task_definition_ref: task_definition:<id>
  target_ref: <world/entity/structure>
  schedule_window_ref: <id>
  job_ref: job:<id>?
  priority: <class>
  required_reservation_refs: []
  required_tool_refs_or_tags: []
  required_input_refs_or_tags: []
  biological_snapshot_revision: <rev>
  social_permission_revision: <rev>?
  economic_contract_revision: <rev>?
  movement_request_ref: movement_request:<id>?
  domain_action_ref: <id>?
  state: proposed
  reason_codes: []
  revision: <n>
```

---

# Appendix E — Migration Record Template

```yaml
migration_record:
  migration_id: migration:<ulid>
  person_or_household_refs: []
  origin_settlement_ref: settlement:<id>
  destination_settlement_ref: settlement:<id>
  cause_refs: []
  social_context_ref: <id>?
  economic_context_ref: <id>?
  biological_availability_ref: <id>
  movement_journey_ref: journey:<id>
  departure_state: pending
  arrival_state: pending
  residence_release_refs: []
  destination_residence_refs: []
  job_transition_refs: []
  committed_evidence_refs: []
  revision: <n>
```

---

# Appendix F — Cross-System Interface Summary

## Document 07 → Set 27
- person/household identity;
- labour availability;
- job/workplace;
- stock demand;
- settlement demand;
- merchant/service role;
- employment capacity.

## Set 27 → Document 07
- employment/contract state;
- wage/payment result;
- market/price facts;
- enterprise status;
- household economic summary where authorised.

## Document 07 → Set 28
- stable person ID;
- household;
- job;
- schedule;
- settlement;
- lifecycle;
- incident/evidence references.

## Set 28 → Document 07
- willingness/permission;
- social milestone;
- companion/assignment status;
- household/migration change request;
- disclosure-safe social summary.

## Document 07 → Set 29
- activity/task context;
- work demand;
- care-service context;
- settlement population membership.

## Set 29 → Document 07
- biological availability;
- recovery;
- care need;
- population health summary;
- modifiers/restrictions.

## Document 07 → Set 30
- movement destination/intent;
- task deadline;
- transport/formation intent where authorised.

## Set 30 → Document 07
- route/path result;
- travel time;
- arrival/failure;
- movement state;
- journey progress;
- route invalidation.

---

# Appendix G — POC Leakage Scan

Production validation should detect shipping dependencies on:

- `Forest Hamlet`;
- fixed POC resident names;
- fixed eight-role roster;
- fixed watchtower project;
- fixed goblin raid;
- fixed POC warehouse;
- fixed Hearthplain coordinates;
- test-only settlement IDs;
- POC-only culture/faction IDs;
- hard-coded Day-N schedules;
- fixed POC migration assumptions; and
- any task rule that only works with the old demonstration.

Approved archive/test namespaces are exempt when excluded from shipping production pools.

---

# Appendix H — Cross-System Responsibility Quick Reference

| Question | Owner |
|---|---|
| Who is this persistent resident? | Document 07 |
| Which household do they belong to? | Document 07 |
| Where do they live? | Document 07 using valid structure/service refs |
| What is their ordinary job? | Document 07 |
| What do they intend to do this schedule window? | Document 07 |
| Can they physically reach it? | Set 30 |
| Are they too injured/fatigued/ill? | Set 29 |
| Do they trust the requester? | Set 28 |
| What do they believe? | Set 28 |
| Are they a companion? | Set 28 |
| What wage are they owed? | Set 27 |
| What is the item worth? | Set 27 |
| Which building service exists? | Document 20 |
| Which project should the settlement build? | Document 19 |
| Did the recipe actually produce output? | Document 05 / production owner |
| Did the guard hit the attacker? | Document 16 |
| Which culture/faction/law applies? | Document 13 |
| Is this a formal quest? | Document 15 |
| How is their body/animation authored? | Entity Forge |
| How is this implemented technically? | Replacement Document 18 |

---

# Appendix I — Definition of Done for Implemented Document 07 Runtime

The eventual implementation should not be considered complete until tests prove that:

- a generated settlement can create persistent residents without Forest Hamlet data;
- residents survive save/load and actor streaming;
- households survive relocation and migration;
- jobs require real workplaces/tools/routes;
- blocked routes stop work;
- Set 29 injury/fatigue state changes worker availability without Document 07 mutating Health;
- Set 28 social refusal changes eligible action without Document 07 owning Trust;
- Set 27 wage/contract results affect employment without Document 07 owning price;
- construction workers consume real resources through project/recipe owners;
- distant construction cannot create free stock;
- migration preserves person identity;
- a named person cannot exist in two settlements at once;
- LOD cannot duplicate inventory;
- death removes ordinary work but preserves historical identity;
- port/shipyard residents integrate with Set 26 without duplicating crew/vessel rules;
- settlement operation remains coherent after conquest/damage/recovery;
- low-end simulation reduces cost without deleting consequential truth;
- multiplayer clients cannot directly edit person/job/inventory state;
- external record revisions are validated before consequential action; and
- diagnostic tools can explain why every important routine task is active, blocked, cancelled or completed.

---

# Completion Statement

**Document 07 v1.0 reconciles Leyforge's living-NPC vision with the production world, the final Sets 27–30 ownership contract and the post-Atlas settlement architecture.**

Persistent people, households, jobs, schedules, real inventories, real work, migration, construction labour, settlement autonomy and scalable civilisation simulation remain core features.

The fixed Forest Hamlet and its exact roster are retired from production.

The largest architectural correction is the explicit separation of **person/settlement operation from specialist gameplay truth**:

- Document 07 owns persistent people and ordinary settlement operations.
- Set 27 owns economy.
- Set 28 owns social interaction and relationship truth.
- Set 29 owns biology.
- Set 30 owns movement/navigation.
- Set 26 owns specialist maritime execution.
- Document 19 owns settlement growth/planning.
- Document 20 owns building/service capability.

That separation allows Leyforge to support thousands of persistent people across seed-generated settlements without turning every NPC system into a monolith or allowing distance, multiplayer, UI, AI dialogue, migration or content updates to create duplicate truth.

**Next foundation reconciliation dependency: Document 08 — Automation System v1.0.**
