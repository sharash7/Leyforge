# LEYFORGE

## 15 — Quest, Event, History and World-Consequence System

### Runtime Quests, Requests, Investigations, Event Lifecycles, Objective Evidence, Contribution, Failure, Aftermath, Chronicles and Persistent Narrative State

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `15_Fantasy_Voxel_Civilisation_Sandbox_Quest_and_Event_System_v0_1` for active production direction  
**Primary Authored History / Story / Event Atlas Authority:** `24K — World History, Story Arcs, Events and Dynamic World States Atlas v0.1`  
**World Generation / Placement:** Document 11 v1.0 + Atlas 24A–24D  
**Persistent People / Settlement Operation:** Document 07 v1.0  
**Automation:** Document 08 v1.0  
**Magic:** Document 09 v1.0  
**Creatures / Ecology:** Document 10 v1.0  
**Structures / Sites / Routes:** Document 12 v1.0 + Atlas 24G / 24I  
**Civilisation / Government / Law:** Document 13 v1.0  
**Realms / Dimensional Routes:** Document 14 v1.0  
**Combat / Defence:** Document 16  
**UI / Journal / Alerts / Chronicle Presentation:** Document 17  
**Settlement Growth / Building Projects:** Documents 19–20  
**Production Governance:** Set 25  
**Maritime Quest / Event Extension:** Set 26N and related Set 26 systems  
**Economic Contracts / Payments / Breach:** Set 27, especially 27E  
**Dialogue / Knowledge / Social Outcomes / Assignments:** Set 28  
**Biological State / Treatment / Disease / Injury:** Set 29  
**Movement / Travel / Arrival Evidence:** Set 30, with Set 26 aquatic/vessel execution  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale quest, event and world-consequence runtime for Leyforge in which stories emerge from real generated people, places, shortages, discoveries, institutions, ecological pressures, conflicts, projects, contracts, realm changes and historical evidence. Quests make important world situations understandable to players; they do not replace the simulation that created those situations.

> **Quest System Statement**
>
> **A quest is a structured player-facing interpretation of a real opportunity, problem, promise, investigation, project, story arc or event. It may guide, track and reward participation, but it does not manufacture the underlying world truth merely to satisfy its objectives.**

> **Event System Statement**
>
> **An event is an authoritative time-bounded or phase-based change in world state driven by valid causes, actors, schedules, simulation pressure or authored world-history grammars. It may progress without player participation and it leaves persistent aftermath rather than resetting when its UI marker disappears.**

> **Evidence Owns Progress Rule**
>
> **Quest objectives advance from authoritative evidence supplied by the system that owns the underlying gameplay fact. Document 15 decides whether that evidence satisfies the objective; it does not recreate the owner's formula.**

> **Failure Becomes History Rule**
>
> **Most quest or event failure changes the world instead of forcing a reload. Deadlines can pass, people can leave, settlements can lose, structures can collapse, contracts can breach, factions can reform and routes can close. The runtime records why and exposes future consequences or replacement opportunities when valid.**

> **Arc / Quest / Event Separation Rule**
>
> **24K owns authored world-history, story-arc, event-family, rumour and aftermath content. Document 15 owns runtime quests and events. An Arc may exist without player awareness; a Quest exposes structured objectives; an Event changes world state; a Contract remains an economic obligation in Set 27.**

---

# Document Purpose

Document 15 defines how Leyforge turns persistent simulation and authored world-content relationships into readable player-facing quests, requests, investigations, event chains, story arcs, warnings, contribution records and historical aftermath.

The original Document 15 v0.1 already established many of the correct foundations:

- hybrid authored and simulation-driven quests;
- world-state-driven requests;
- multiple solution methods;
- objective modules;
- branching;
- failure without mandatory reload;
- time-bounded events;
- settlement projects;
- raids;
- exploration;
- faction conflicts;
- magic and ritual quests;
- dimensional events;
- multiplayer contribution;
- history records;
- POC consequence tracking.

Those concepts remain.

The production reconciliation changes the source-of-truth architecture.

Since v0.1, Leyforge now has:

- deterministic world generation;
- the World Content Atlas;
- a full history/story/event Atlas in 24K;
- persistent people and settlement operation;
- canonical Block/Item/Recipe/Resource systems;
- full economy and persistent contracts;
- detailed social knowledge/dialogue;
- biological health/injury/disease systems;
- movement and arrival evidence;
- maritime voyages, rescue, piracy, storms, wrecks and port crises;
- persistent structure and realm instances;
- clear cross-system authority contracts.

Document 15 therefore becomes the **runtime narrative orchestration and objective-evidence layer**.

It does not become the owner of every action a quest can mention.

---

# 1. Locked System Identity

Document 15 owns:

- Quest Definition runtime schema;
- Quest Instance lifecycle;
- quest offer state;
- quest discovery state;
- quest acceptance;
- quest ownership/scope;
- stage progression;
- objective state;
- evidence satisfaction;
- quest branching;
- quest replacement;
- quest closure;
- quest failure/expiry interpretation;
- optional quest abandonment rules;
- quest contribution;
- quest reward-package orchestration;
- quest aftermath hooks;
- Request runtime;
- Investigation runtime;
- player-visible formal objective records;
- Event Definition runtime schema;
- Event Instance lifecycle;
- event selection/exclusion;
- event warning;
- event phases;
- event escalation;
- event intervention windows;
- event contribution;
- event resolution orchestration;
- event aftermath orchestration;
- event-to-history transition;
- Chronicle / History Record runtime;
- persistent narrative bindings;
- objective reason codes;
- quest/event LOD;
- quest/event persistence;
- multiplayer quest authority;
- quest/event migration;
- runtime bindings to 24K Arc/Event/History/Aftermath content.

---

# 2. Document 15 Does Not Own

Document 15 does not own:

- world terrain/biome truth — Document 11;
- people, homes, jobs and schedules — Document 07;
- physical Blocks/Items/Recipes/Resources — Documents 03–06;
- automation output — Document 08;
- magical state — Document 09;
- creature populations — Document 10;
- structure/site state — Document 12;
- government/law/faction political truth — Document 13;
- realm/portal route truth — Document 14;
- combat resolution — Document 16;
- settlement building/service function — Documents 19–20;
- prices, payments, contracts, escrow, breach and economic remedies — Set 27;
- dialogue, persuasion, Trust, Loyalty, beliefs, rumours and social assignments — Set 28;
- Health, injury, disease, treatment and biological recovery — Set 29;
- physical movement, travel time and arrival — Set 30;
- vessel movement, storms, fishing, maritime ecology or ship damage — Set 26;
- final UI rendering — Document 17.

---

# 3. 24K and Document 15 Relationship

24K is the authored content Atlas for:

- generated history;
- historical incidents;
- story grammars;
- world-event foundations;
- dynamic-state profiles;
- rumours and mysteries;
- evidence roles;
- aftermath modules;
- cross-content narrative relationships.

Document 15 is the runtime that binds those content definitions to actual generated subjects.

## 3.1 24K Production Foundation

24K defines:

| Content Family | Foundation Count |
|---|---:|
| Historical Incident Foundations | 48 |
| Story-Arc Foundations | 48 |
| World-Event Foundations | 72 |
| Dynamic-State Profiles | 36 |
| Rumour / Mystery Modules | 24 |
| Aftermath-Propagation Modules | 18 |

These remain 24K-owned.

## 3.2 Document 15 Runtime Responsibilities

Document 15 binds a selected 24K grammar to:

- actual people;
- actual households;
- actual structures;
- actual settlements;
- actual inventories;
- actual factions;
- actual contracts;
- actual routes;
- actual creatures;
- actual realm instances;
- actual knowledge state;
- actual world time;
- actual evidence.

## 3.3 No Duplicate Atlas

Document 15 does not author a second copy of:

- `ARC-001` through `ARC-048`;
- `EVT-001` through `EVT-072`;
- historical incident families;
- aftermath modules.

It references them.

---

# 4. World Story Architecture

Production narrative uses distinct layers.

| Layer | Purpose | Owner |
|---|---|---|
| Historical Incident | Explains past world state and evidence. | 24K content; world-history runtime integration |
| Story Arc | Long-term relationship/tension that may exist without player awareness. | 24K |
| Event Family | Authored pattern for world change. | 24K |
| Event Instance | Actual active event in this world. | Document 15 |
| Request | Short-lived need-driven ask. | Document 15 runtime sourced from owning system |
| Quest Definition | Player-facing structured objective pattern. | Document 15 / approved content pack |
| Quest Instance | Actual accepted/offered/tracked quest. | Document 15 |
| Contract | Persistent economic obligation. | Set 27E |
| Assignment | Delegated/social task relationship. | Set 28G |
| Investigation | Structured evidence/knowledge progression. | Document 15 + Set 28C |
| Player Objective | Private marker or planning goal. | Document 15 / UI |
| Chronicle Record | Persistent resolved historical narrative record. | Document 15 consuming evidence |

---

# 5. Quests Are Not Simulation Truth

A quest may say:

- deliver 100 Grain;
- repair Bridge A;
- reach Port B;
- heal Citizen C;
- convince Councillor D;
- defeat Predator E;
- investigate Ruin F;
- complete Contract G;
- open Realm Route H.

The authoritative truth comes from:

- inventory transaction;
- structure repair;
- movement arrival;
- biological treatment;
- social negotiation;
- combat/ecology;
- evidence;
- contract state;
- realm transition.

Document 15 tracks those facts.

---

# 6. Objective-Evidence Architecture

Every objective has:

- objective definition;
- target bindings;
- evidence predicate;
- evidence sources;
- completion policy;
- contribution policy;
- failure policy;
- visibility;
- reason state.

## 6.1 Evidence Sources

Evidence may come from:

- inventory transaction;
- recipe transaction;
- construction stage;
- structure state;
- settlement service state;
- NPC lifecycle;
- social outcome;
- knowledge verification;
- economic contract;
- payment;
- movement arrival;
- journey progress;
- combat outcome;
- creature population;
- treatment result;
- realm transition;
- event state;
- automation delivery;
- authority/legal state.

---

# 7. Evidence Record

A cross-system evidence record should include:

```yaml
quest_evidence:
  evidence_id: evidence:<ulid>
  source_owner: <system>
  source_event_or_transaction_ref: <id>
  evidence_type: <qualified_id>
  subject_refs: []
  world_time: <time>
  payload_ref: <typed_snapshot_or_fact>
  source_revision: <rev>
  visibility_class: <class>
  authority_signature_or_server_ref: <id>
```

Document 15 stores the evidence reference, not a duplicate copy of external mutable state where avoidable.

---

# 8. Evidence Idempotency

The same evidence ID can satisfy an objective only according to its declared policy.

This prevents:

- duplicate reward claims;
- repeated objective increments;
- repeated multiplayer credit;
- repeated event consequence commits.

---

# 9. Quest Definition

```yaml
quest_definition:
  quest_id: leyforge.core.quest.<path>
  schema_version: 1
  category: <category>
  scope: <scope>
  source_arc_ref: <24K_arc_id>?
  source_event_ref: <24K_event_id>?
  source_history_ref: <24K_history_id>?
  availability_rules: []
  participant_slots: []
  target_slots: []
  stages: []
  branch_rules: []
  failure_policy_ref: <id>
  expiry_policy_ref: <id>
  contribution_policy_ref: <id>
  reward_package_ref: <id>?
  aftermath_refs: []
  journal_presentation_ref: <id>
  production_status: <status>
```

---

# 10. Quest Instance

```yaml
quest_instance:
  quest_instance_id: quest_instance:<ulid>
  definition_ref: <id>
  definition_revision: <rev>

  binding:
    actor_refs: []
    faction_refs: []
    structure_refs: []
    settlement_refs: []
    route_refs: []
    realm_refs: []
    item_resource_refs: []
    contract_refs: []
    event_refs: []

  ownership:
    scope: personal
    owner_player_refs: []
    party_ref: null
    settlement_ref: null
    faction_ref: null

  lifecycle:
    state: offered
    accepted_world_time: null
    current_stage_ref: <id>
    stage_state_refs: []
    branch_decision_refs: []

  evidence:
    evidence_refs: []
    contribution_refs: []

  resolution:
    result: unresolved
    failure_reason_refs: []
    reward_claim_state: unclaimed
    aftermath_refs: []
    history_record_ref: null

  revision: 1
```

---

# 11. Quest Lifecycle

Recommended states:

1. `latent`
2. `discoverable`
3. `offered`
4. `available`
5. `accepted`
6. `active`
7. `blocked`
8. `suspended`
9. `branch_pending`
10. `completed`
11. `failed`
12. `expired`
13. `abandoned`
14. `superseded`
15. `closed`
16. `archived`

## 11.1 Latent

The world condition exists but no player-facing quest is exposed.

## 11.2 Discoverable

Evidence can reveal it.

## 11.3 Offered

A person/institution/event has actively offered it.

## 11.4 Active

The player/party has accepted or the quest is auto-tracked according to settings.

## 11.5 Blocked

Current progress is impossible temporarily, with readable reason.

## 11.6 Closed

The quest has no valid continuation and history records why.

---

# 12. Quest Discovery

Quests may be discovered through:

- environmental evidence;
- NPC conversation;
- request board;
- contract;
- map;
- archive;
- rumour;
- faction notice;
- settlement alert;
- magical divination;
- creature sign;
- damaged structure;
- route warning;
- realm signal;
- economic shortage;
- biological crisis.

The source must exist.

---

# 13. Discovery Is Knowledge-Aware

Set 28C owns what the actor knows.

Document 15 may expose:

- hidden;
- hinted;
- rumoured;
- reported;
- investigated;
- verified;
- contested.

It must not reveal hidden world truth merely because a quest definition exists.

---

# 14. Quest Categories

Production categories may include:

- Main Mystery;
- Cultural Arc;
- Faction Arc;
- Settlement Story;
- Personal Story;
- Project;
- Request;
- Contract Wrapper;
- Emergency;
- Exploration;
- Structure;
- Investigation;
- Research / Knowledge;
- Magic / Ritual;
- Realm / Dimensional;
- Creature / Ecology;
- Maritime;
- Rescue;
- Tutorial / Contextual Guidance;
- Repeatable;
- Emergent;
- World Objective.

Categories are organisational, not ownership.

---

# 15. Quest Scope

Possible scopes:

- personal;
- party;
- household;
- vessel;
- settlement;
- faction;
- regional;
- realm;
- world.

Scope determines:

- visibility;
- participation;
- credit;
- authority;
- reward handling;
- journal ownership.

---

# 16. Requests

A Request is a short-lived need-driven player-facing opportunity.

Potential sources:

- person;
- household;
- settlement;
- faction;
- institution;
- machine/facility;
- event.

Examples:

- need medicine;
- need repair materials;
- need escort;
- need food;
- need a specialist;
- need survey;
- need rescue.

## 16.1 Request Is Not a Contract

A request becomes an economic contract only when Set 27E creates persistent obligations such as:

- payment;
- delivery window;
- acceptance criteria;
- escrow;
- penalty;
- service obligation.

---

# 17. Contract / Quest Separation

Set 27E is explicit:

> a contract is not a quest objective with decorative legal language.

Document 15 may:

- expose contract;
- track obligation;
- add contextual story;
- create journal entry;
- award quest/progression recognition.

Set 27E remains owner of:

- parties;
- obligations;
- payment;
- escrow;
- acceptance;
- breach;
- remedies.

## 17.1 Contract Completion Objective

Correct:

`Objective: Contract <ID> reaches fulfilled state.`

Incorrect:

`Quest counter reaches 100, therefore contract is paid.`

---

# 18. Social Assignment / Quest Separation

Set 28G owns delegated social assignments.

A companion may be told:

- return home;
- scout;
- meet someone;
- deliver message;
- travel to settlement.

Document 15 may track the assignment as an objective.

Set 28 owns assignment agreement/authority.

Set 30 owns movement.

---

# 19. Investigation

Investigation quests structure evidence.

They may involve:

- inspecting;
- interviewing;
- comparing records;
- translating;
- testing;
- researching;
- tracking;
- archaeology;
- magic sensing;
- economic records;
- creature signs.

## 19.1 Investigation Is Not Omniscience

An objective can complete when:

- sufficient evidence collected;
- proposition verified;
- contradiction discovered;
- investigation closed unresolved.

Not every mystery must have one final certain answer.

---

# 20. Investigation Knowledge Boundary

Set 28C owns:

- known facts;
- claims;
- confidence;
- misinformation;
- lies;
- rumours.

Document 15 owns:

- investigation stage;
- required evidence pattern;
- objective completion.

---

# 21. Player Objectives

A player can create private markers/plans such as:

- build a home;
- reach mountain;
- save materials;
- map coast.

These need not become formal simulation quests.

They do not create:

- rewards;
- NPC obligations;
- world state;
- contract state.

---

# 22. Objective Module Architecture

Reusable objective modules keep quest content scalable.

Examples:

- acquire;
- possess;
- deliver;
- transfer;
- craft;
- construct;
- repair;
- restore;
- activate;
- operate;
- maintain;
- reach;
- travel;
- escort;
- protect;
- survive;
- defend;
- defeat;
- capture;
- rescue;
- heal/treat;
- investigate;
- discover;
- observe;
- research;
- negotiate;
- persuade;
- sign treaty;
- fulfil contract;
- pay;
- trade;
- gather evidence;
- map;
- survey;
- tame;
- relocate creature;
- cleanse;
- complete ritual;
- open portal;
- settle;
- evacuate.

---

# 23. Acquire Objective

“Acquire 10 Iron Ingots” requires authoritative ownership/possession evidence.

It does not care whether obtained by:

- crafting;
- trade;
- salvage;
- gift;
- mining/refining;
- valid quest reward

unless method restrictions are explicit.

---

# 24. Possess Versus Deliver

`possess` means the bound actor currently owns/carries/controls the required content.

`deliver` means an authoritative transfer reaches a destination/custodian.

Do not complete delivery because the player merely has the item.

---

# 25. Craft Objective

Document 05 supplies recipe completion evidence.

Quest may require:

- exact recipe;
- output family;
- quality;
- quantity;
- contributor.

It does not spawn output.

---

# 26. Construct Objective

Documents 19/20/05/12 supply:

- project stage;
- structure completion;
- commissioning.

Quest does not increment an abstract construction bar independent of the project.

---

# 27. Repair / Restore Objective

Document 12 / specialist owner supplies structure state.

Quest decides whether required state satisfies the objective.

---

# 28. Reach / Travel Objective

Set 30 supplies authoritative:

- arrival;
- route;
- journey status;
- blocker.

For water/vessel travel, Set 26 supplies specialist execution through the movement facade.

## 28.1 No Proximity Guess

Do not complete a travel objective because the quest system thinks the actor should be near the destination.

Use arrival evidence.

---

# 29. Escort Objective

Escort completion can require:

- protected subject arrival;
- subject alive;
- cargo present;
- route constraints;
- time condition;
- party separation policy.

Movement evidence comes from Set 30/26.

Biological survival from Set 29.

---

# 30. Defend Objective

Document 16 supplies combat/threat outcome.

Document 12 supplies structure condition.

Document 07 supplies resident state.

Quest may accept multiple success definitions such as:

- enemy withdraws;
- treaty signed;
- civilians evacuated;
- structure survives;
- attacker redirected.

---

# 31. Defeat Objective

“Defeat” must declare meaning:

- kill;
- force retreat;
- capture;
- surrender;
- neutralise;
- remove from territory;
- complete boss resolution.

Not every enemy must die.

---

# 32. Rescue Objective

Rescue may require:

- locate subject;
- stabilise biological state;
- provide access;
- move subject;
- deliver to safety.

Set 29 owns stabilisation.

Set 30/26 owns movement.

Document 15 owns rescue-objective completion.

---

# 33. Treatment Objective

Set 29 supplies treatment evidence.

Quest may require:

- treatment attempted;
- stabilised;
- cured;
- rehabilitated;
- delivered to care.

Do not duplicate disease/injury state.

---

# 34. Social Objective

Set 28 supplies:

- negotiation result;
- agreement;
- disclosure;
- relationship outcome.

Document 15 decides objective progression.

No objective directly writes Trust.

---

# 35. Political Objective

Document 13 supplies:

- treaty;
- citizenship;
- law;
- war/peace;
- government state.

Set 28 may supply negotiation evidence.

---

# 36. Contract Objective

Set 27E supplies:

- active;
- partially fulfilled;
- fulfilled;
- breached;
- cancelled;
- disputed.

Quest tracks.

---

# 37. Economic Objective

Set 27 supplies:

- payment;
- market transaction;
- economic delivery;
- tax/tariff state.

Document 15 does not calculate prices.

---

# 38. Creature Objective

Document 10 supplies:

- population;
- tame state;
- relocation;
- ecology state;
- nest state.

Document 16 supplies combat result.

Quest must respect personhood.

---

# 39. Ecology Objective

Possible success:

- population recovered;
- predator pressure reduced;
- habitat restored;
- invasive spread contained;
- migration corridor opened.

Document 10 owns ecology.

---

# 40. Magic Objective

Document 09 supplies:

- spell learned;
- ritual stage;
- ward state;
- mana network;
- corruption/cleansing;
- portal activation.

Quest tracks.

---

# 41. Realm Objective

Document 14 supplies:

- route discovered;
- anchor stabilised;
- transition;
- return route;
- realm state.

Quest does not teleport player.

---

# 42. Automation Objective

Document 08 supplies:

- machine operational;
- output delivered;
- network restored;
- production target committed.

Quest does not count theoretical machine capacity as output.

---

# 43. Maritime Objective

Set 26 can supply:

- voyage milestone;
- vessel arrival;
- docking;
- rescue;
- catch;
- wreck claim;
- shipbuilding stage;
- convoy;
- piracy incident;
- port crisis;
- storm aftermath;
- marine ecology.

---

# 44. Stages

A quest can use ordered or branching stages.

A stage contains:

- entry conditions;
- objectives;
- optional objectives;
- hidden objectives;
- branch choices;
- time rules;
- evidence requirements;
- completion policy;
- failure policy;
- next-stage rules.

---

# 45. Stage Completion Policies

Examples:

- all required objectives;
- any one solution;
- weighted contribution;
- threshold of evidence;
- authority decision;
- external event phase;
- negotiated outcome.

---

# 46. Parallel Objectives

Objectives may run simultaneously.

Example:

During storm preparation:

- reinforce roof;
- stock medicine;
- evacuate coast;
- move vessels;
- repair beacon.

Event can progress while tasks remain incomplete.

---

# 47. Optional Objectives

Optional objectives may affect:

- reward;
- aftermath;
- knowledge;
- casualties;
- relationships;
- future opportunities.

They must not be presented as mandatory.

---

# 48. Hidden Objectives

Use sparingly.

A hidden objective should represent:

- undiscovered alternative;
- secret actor;
- optional evidence;
- betrayal path.

Do not punish players for invisible arbitrary requirements.

---

# 49. Branching

A meaningful branch changes one or more:

- beneficiary;
- method;
- risk;
- timing;
- knowledge;
- ownership;
- relationship;
- political state;
- world aftermath.

---

# 50. Convergence

Branches may converge structurally.

The history record preserves earlier differences.

Example:

Both diplomacy and combat may end a siege.

Aftermath differs.

---

# 51. Replacement

If a required subject becomes invalid:

- NPC dies;
- faction dissolves;
- structure destroyed;
- route closes;
- settlement abandoned;

the quest can:

- bind successor;
- bind institution;
- change objective;
- close;
- fail;
- become historical investigation.

It cannot resurrect the original actor solely to preserve a quest.

---

# 52. Continuity Audit

Before advancing stages, validate:

- subjects exist;
- roles still apply;
- ownership valid;
- location valid;
- world state compatible;
- required systems loaded/reconciled.

---

# 53. Failure

Failure policies include:

- recoverable;
- branch-to-aftermath;
- partial success;
- expiry;
- closed opportunity;
- catastrophic-but-playable;
- retry after cooldown;
- contract breach;
- replacement arc.

## 53.1 No Mandatory Reload Philosophy

Most failures should produce:

- changed world;
- lost opportunity;
- new problem;
- history;
- alternative path.

---

# 54. Expiry

Expiry requires a world reason:

- event ended;
- person left;
- contract deadline;
- route closed;
- season passed;
- election completed;
- structure destroyed;
- target migrated.

---

# 55. Abandonment

Player abandonment may:

- stop tracking;
- notify requester;
- breach contract if contract says so;
- affect relationship if social system says so.

Document 15 does not invent penalty.

---

# 56. Quest Failure Is Not Contract Breach

A quest can fail while contract remains active.

A contract can breach while quest remains open as “resolve dispute.”

Set 27E remains authority.

---

# 57. Rewards

Rewards may include:

- items;
- blocks;
- currency;
- payment;
- services;
- access;
- knowledge;
- recipe unlock;
- progression;
- relationship consequence;
- citizenship;
- property;
- structure;
- map information.

Each reward is committed by its owner.

## 57.1 Reward Package Is Orchestration

Document 15 can request reward effects.

It cannot mint currency or inventory directly.

---

# 58. Reward Significance

Peaceful, diplomatic, rescue, research and restoration solutions should receive rewards equivalent in **significance**, not necessarily identical loot.

---

# 59. Contribution

Contribution supports multiplayer, settlements and large events.

Contribution types include:

- supply;
- labour;
- design;
- operation;
- rescue;
- healing;
- scouting;
- research;
- negotiation;
- combat;
- repair;
- transport;
- funding;
- command;
- evidence.

---

# 60. Contribution Record

```yaml
quest_contribution:
  contribution_id: contribution:<ulid>
  quest_or_event_ref: <id>
  contributor_ref: <player|party|npc|settlement|faction>
  contribution_type: <type>
  evidence_refs: []
  significance_band: <band>
  committed_world_time: <time>
  revision: <rev>
```

---

# 61. Contribution Is Not Raw Grind Score

Do not reward thousands of trivial actions merely because they can be counted.

Contribution should reflect meaningful committed evidence.

---

# 62. Shared Credit

A quest declares:

- personal credit;
- party shared credit;
- contribution-weighted credit;
- settlement/world shared resolution;
- discoverer credit;
- final-actor credit;
- multi-role credit.

---

# 63. Multiplayer Branch Authority

For shared quests, declare who can:

- accept;
- reject;
- choose branch;
- negotiate;
- spend shared stock;
- sign contract;
- turn in;
- abandon.

---

# 64. Multiplayer Conflict

If players choose incompatible goals:

- separate personal quests;
- party vote;
- leader authority;
- negotiated split;
- world event proceeds independently.

Do not silently let last click win.

---

# 65. Event Definition

```yaml
event_definition:
  event_id: leyforge.core.event.<path>
  schema_version: 1
  atlas_foundation_ref: <24K_event_id>
  category: <category>
  scale: <scope>
  trigger_rules: []
  eligibility_rules: []
  suitability_rules: []
  exclusion_rules: []
  density_budget_ref: <id>
  phases: []
  warning_profile_ref: <id>
  intervention_profiles: []
  resolution_profiles: []
  aftermath_refs: []
  cooldown_profile_ref: <id>
  lod_profile_ref: <id>
  accessibility_profile_ref: <id>
  production_status: <status>
```

---

# 66. Event Instance

```yaml
event_instance:
  event_instance_id: event_instance:<ulid>
  definition_ref: <id>
  definition_revision: <rev>

  binding:
    region_refs: []
    actor_refs: []
    settlement_refs: []
    faction_refs: []
    structure_refs: []
    route_refs: []
    creature_refs: []
    realm_refs: []

  lifecycle:
    phase: warning
    started_world_time: <time>
    phase_started_world_time: <time>
    severity_band: <band>
    escalation_state: <state>

  participation:
    intervention_refs: []
    contribution_refs: []
    generated_quest_refs: []

  resolution:
    outcome_ref: null
    aftermath_refs: []
    history_record_ref: null

  runtime:
    lod_state: E0
    revision: 1
```

---

# 67. Event Lifecycle

24K establishes the production lifecycle:

1. Dormant Opportunity
2. Warning / Foreshadowing
3. Initiation
4. Escalation
5. Crisis / Decision
6. Resolution
7. Aftermath
8. Historical Record

Document 15 executes those stages.

---

# 68. Dormant Opportunity

Conditions exist but an Event Instance has not yet activated.

Examples:

- predator population rising;
- river level increasing;
- political dispute worsening;
- ward instability;
- labour conflict;
- storm developing.

---

# 69. Warning / Foreshadowing

Warnings may include:

- weather;
- tracks;
- migration;
- market change;
- damage;
- rumours;
- scouting;
- faction mobilisation;
- magical readings;
- NPC reports.

Warning should exist before major avoidable consequences where appropriate.

---

# 70. Initiation

Creates:

- Event Instance;
- bound subjects;
- scope;
- phase;
- authoritative timing;
- severity;
- initial world-state refs.

---

# 71. Escalation

Escalation may:

- spread;
- increase severity;
- consume stock;
- close routes;
- move populations;
- activate factions;
- create quests;
- change prices through Set 27;
- increase biological pressure through Set 29.

---

# 72. Crisis / Decision

The event reaches highest constraint/stakes.

Players may still have valid alternatives.

---

# 73. Resolution

Resolution consumes actual specialist outcomes.

Example siege:

- combat;
- diplomacy;
- evacuation;
- supply;
- structure state;
- faction state.

---

# 74. Aftermath

Aftermath may include:

- repair;
- grief;
- migration;
- trade change;
- ecological response;
- succession;
- memorial;
- investigation;
- insurance claim;
- restoration;
- follow-up arc.

---

# 75. Historical Record

Major resolved events become persistent records.

History affects future:

- stories;
- politics;
- dialogue;
- structures;
- names;
- economy;
- ecology;
- commemorations.

---

# 76. Event Eligibility

An event activates only if:

- required subjects exist;
- required location exists;
- required world condition exists;
- capability context valid;
- production content present.

---

# 77. Event Suitability

Evaluate:

- biome;
- season;
- route;
- settlement;
- culture;
- faction;
- economy;
- magic;
- ecology;
- danger;
- realm law;
- maritime context.

---

# 78. Event Density Budgets

Prevent permanent crisis spam.

Budgets may exist by:

- region;
- settlement;
- faction;
- household;
- world;
- realm;
- category.

---

# 79. Cooldowns

Similar events respect:

- local cooldown;
- faction cooldown;
- ecological recovery;
- seasonal cycle;
- world settings.

---

# 80. Exclusions

Examples:

- two incompatible elections;
- duplicate unique boss awakenings;
- flood and impossible drought in same scope;
- protected onboarding window;
- actor already dead;
- route impossible.

---

# 81. Event Priority

Priority derives from:

- real urgency;
- authored rarity;
- player proximity;
- unresolved pressure;
- world settings.

Not random timer alone.

---

# 82. Event Repair

If an event cannot bind valid subjects:

- choose compatible alternative;
- defer;
- close opportunity.

Do not invent missing actors or teleport them.

---

# 83. Environmental Events

24K event families include:

- flood;
- drought;
- wildfire;
- migration;
- invasive bloom;
- river shift;
- volcanic activity;
- cave collapse;
- starfall;
- fog;
- restoration season.

Document 15 orchestrates lifecycle.

Owning systems commit physical state.

---

# 84. Creature / Boss Events

Examples:

- predator pressure;
- nest expansion;
- boss territory shift;
- titan crossing;
- siege muster;
- creature plague;
- sacred herd;
- wounded guardian;
- negotiated hostile-group truce;
- hunt proclamation;
- reproductive season;
- scavenger bloom.

---

# 85. Settlement / Civic Events

Examples:

- festival;
- refugee arrival;
- public works;
- election;
- succession funeral;
- housing shortage;
- medicine shortage;
- labour dispute;
- mixed-culture celebration;
- crime wave;
- anniversary;
- abandonment decision.

---

# 86. Political Events

Examples:

- border negotiation;
- succession crisis;
- treaty negotiation;
- rebellion;
- coup;
- embargo;
- war mobilisation;
- occupation;
- liberation;
- faction schism.

Document 13 owns political result.

---

# 87. Economic Events

Set 27 owns economic truth.

Events may expose:

- shortage;
- surplus;
- market disruption;
- labour dispute;
- bankruptcy;
- trade-route failure;
- credit crisis;
- smuggling pressure.

Document 15 orchestrates event/story.

---

# 88. Magical Events

Document 09 owns magic state.

Examples:

- leyline surge;
- ward failure;
- corruption spread;
- ritual opportunity;
- portal instability;
- magical pollution;
- summon escape.

---

# 89. Realm Events

Document 14 owns realm truth.

Examples:

- route opening;
- route collapse;
- realm breach;
- leak;
- quarantine;
- realm crisis;
- cross-realm migration;
- anchor failure.

---

# 90. Structure / Dungeon Events

Examples:

- ruin collapse;
- site reoccupation;
- bridge failure;
- restoration;
- dungeon awakening;
- archaeology discovery;
- lost expedition.

Document 12/24G owns site state.

---

# 91. Maritime Events

Set 26N extends the quest/event system with:

- severe storm/cyclone;
- sea ice/freeze;
- port crisis;
- wreck;
- rescue;
- fishery change;
- migration;
- boss territory shift;
- pollution/mana spill;
- piracy;
- blockade;
- convoy;
- salvage dispute;
- shipbuilding project;
- quarantine.

---

# 92. Voyage Quest

A voyage quest may bind:

- vessel;
- captain/crew;
- cargo;
- origin;
- destination;
- route;
- weather;
- provisions;
- contract;
- arrival.

Set 26/30 owns voyage/movement.

---

# 93. Rescue at Sea

Evidence may include:

- distress report;
- survivor state;
- vessel position;
- biological stabilisation;
- tow/arrival;
- claim.

---

# 94. Wreck Quest

A wreck can support:

- rescue;
- salvage;
- investigation;
- heritage;
- ecology;
- crime;
- insurance;
- restoration.

---

# 95. Port Crisis

Potential causes:

- storm damage;
- blocked berth;
- disease;
- cargo shortage;
- strike;
- fire;
- piracy;
- political closure;
- pollution.

---

# 96. Event-Generated Quests

An Event Instance may create zero or more quests.

Example flood:

- evacuate residents;
- reinforce bridge;
- deliver medicine;
- rescue livestock;
- inspect dam.

The flood exists even if no quest is accepted.

---

# 97. Quest-Triggered Events

A quest action may create an event if world state supports it.

Example:

- player breaks seal;
- boss awakens;
- Event Instance starts.

The quest does not directly script every world consequence.

---

# 98. World Continues Without Player

Events may progress while:

- player ignores;
- player travels;
- player logs out;
- player is in another realm.

Distant simulation must remain bounded.

---

# 99. Player Is Not Always Central

NPCs/factions/settlements can:

- solve;
- fail;
- negotiate;
- evacuate;
- construct;
- fight;
- repair.

Player may arrive during aftermath.

---

# 100. Event Intervention

Intervention profiles list valid ways to influence event.

Examples:

- supply;
- evacuate;
- repair;
- fight;
- negotiate;
- investigate;
- sabotage;
- fund;
- automate;
- heal;
- redirect;
- contain;
- cleanse.

---

# 101. Event Resolution Without Player

Resolution may use:

- faction capacity;
- settlement services;
- NPC labour;
- resources;
- routes;
- combat;
- weather;
- ecology.

Player absence does not freeze reality.

---

# 102. Event Severity

Severity should be factual/contextual.

Example bands:

- Local;
- Serious;
- Major;
- Regional;
- Realm;
- World.

Avoid inflated “legendary” UI labels disconnected from consequence.

---

# 103. Event Timing

All event timing uses the authoritative world timeline.

Set 27 contracts, Set 28 assignments, Set 29 treatment scheduling and Set 30 travel estimates share the same time authority.

---

# 104. Deadlines

Quest deadlines may derive from:

- contract;
- event;
- season;
- biological state;
- election;
- weather;
- route closure.

The owning system remains authoritative for the underlying deadline.

---

# 105. Deadline Extension

An extension may come from:

- contract amendment;
- event phase change;
- negotiation;
- force majeure;
- world setting.

Document 15 updates tracking only after authority changes.

---

# 106. Force Majeure

External events do not automatically erase economic obligations.

Set 27E decides:

- pause;
- extend;
- renegotiate;
- terminate;
- remain breach.

Quest mirrors contract state.

---

# 107. Biological Crisis Quests

Possible quests:

- medicine shortage;
- outbreak investigation;
- stabilise injured workers;
- establish quarantine;
- evacuate exposure zone;
- acquire treatment capability.

Set 29 owns all biological truth.

---

# 108. Disease Objective

Do not store:

`quest_disease_progress = 80% cured`

Use Set 29 population/individual biological evidence.

---

# 109. Injury Quest

A wounded NPC remains a real person with real injury.

Quest cannot keep them “wounded” after Set 29 reports recovery.

---

# 110. Social Quests

Set 28 owns the social layer.

Personal stories may use:

- relationship;
- memory;
- promises;
- grief;
- rivalry;
- family;
- companion state.

Document 15 tracks story progression.

---

# 111. Personal Story Replacement

If a person dies:

- quest may close;
- successor may continue;
- investigation may shift;
- memorial arc may begin.

Never respawn the person for quest continuity.

---

# 112. Political Quest

Potential arcs:

- election;
- reform;
- treaty;
- border;
- succession;
- citizenship;
- rebellion;
- occupation.

Political commit remains Document 13.

---

# 113. Law Quest

Quest may ask player to:

- gather evidence;
- lobby;
- negotiate;
- vote;
- enforce;
- challenge.

Document 13 owns law state.

---

# 114. Economy Quest

Potential:

- contract;
- shortage;
- market investigation;
- debt;
- labour dispute;
- caravan supply;
- public works procurement.

Set 27 owns economy.

---

# 115. Automation Quest

Potential:

- repair factory;
- diagnose bottleneck;
- restore power;
- supply machine;
- redesign route;
- produce quota.

Document 08 owns machine truth.

---

# 116. Creature / Ecology Quest

Potential:

- track predator;
- protect breeding ground;
- tame eligible animal;
- relocate herd;
- restore habitat;
- study migration;
- contain invasive species.

Document 10 owns ecology.

---

# 117. Personhood Safeguard

A quest template may not classify recognised persons as:

- huntable monster;
- tameable animal;
- livestock;
- harvest source

because of hostility/body type.

---

# 118. Structure Quest

Potential:

- survey;
- repair;
- restore;
- claim;
- defend;
- excavate;
- activate;
- convert.

Document 12 owns structure state.

---

# 119. Dungeon Quest

Potential:

- explore;
- rescue;
- research;
- clear threat;
- restore;
- negotiate with occupants;
- recover evidence.

24G/12 owns site.

---

# 120. Realm Quest

Potential:

- find route;
- stabilise anchor;
- establish return;
- negotiate access;
- settle outpost;
- contain leak;
- restore realm infrastructure.

Document 14 owns realm/route.

---

# 121. Realm Safe-Return Quest Rule

A realm quest cannot deliberately hide the fact that normal return is impossible unless it is explicitly authored high-risk/no-return content.

---

# 122. Story Arcs

24K owns Story Arc foundations.

A Story Arc:

- exists in world-content relationships;
- may be dormant;
- may be unknown;
- can generate several quests/events;
- can branch;
- can close without player.

---

# 123. Arc Runtime Binding

Document 15 may maintain an `ArcRuntime` binding:

```yaml
arc_runtime:
  arc_runtime_id: arc_runtime:<ulid>
  atlas_arc_ref: <24K_id>
  bound_subject_refs: []
  current_world_state_refs: []
  known_to_actor_refs: []
  active_quest_refs: []
  active_event_refs: []
  branch_history_refs: []
  closure_state: open
  history_refs: []
  revision: <rev>
```

---

# 124. Arc Participant Slots

24K story grammars may bind roles such as:

- requester;
- affected party;
- beneficiary;
- opponent;
- witness;
- expert;
- authority;
- hidden actor;
- successor.

---

# 125. Place Slots

Examples:

- origin;
- target;
- meeting;
- evidence site;
- route;
- refuge;
- confrontation;
- restoration.

---

# 126. Object Slots

Examples:

- resource;
- relic;
- document;
- tool;
- building;
- creature;
- machine;
- ritual component;
- legal claim.

---

# 127. Pressure Slots

Examples:

- shortage;
- threat;
- injustice;
- rivalry;
- secret;
- disaster;
- opportunity;
- corruption;
- succession;
- realm instability.

---

# 128. Capability Requirements

Arc selection can require:

- population;
- profession;
- law;
- infrastructure;
- transport;
- magic;
- technology;
- reputation;
- language;
- realm access.

---

# 129. Arc Exclusion

Avoid:

- duplicate unique roles;
- impossible relationships;
- contradictory ownership;
- unsafe start timing;
- excessive event density.

---

# 130. Arc Fallback

If a role is missing:

- compatible institution;
- archive;
- traveller;
- distant faction;
- successor;
- safe closure.

Do not invent the original POC person.

---

# 131. Main Mystery

Leyforge may support an optional long-form mystery.

It must:

- bind to generated world;
- support several entry points;
- not require one seed arrangement;
- preserve sandbox freedom;
- allow interruption/delay;
- avoid becoming mandatory survival progression.

---

# 132. Cultural Arcs

Potential themes:

- identity;
- migration;
- tradition;
- historical truth;
- diaspora;
- reform;
- heritage;
- mixed culture.

---

# 133. Faction Arcs

Potential:

- schism;
- leadership;
- resource conflict;
- war;
- alliance;
- corruption;
- legitimacy;
- reform.

---

# 134. Settlement Arcs

Potential:

- shortage;
- growth;
- defence;
- governance;
- rebuilding;
- integration;
- decline;
- refugee settlement.

---

# 135. Site Arcs

Potential:

- ruin restoration;
- dungeon change;
- route reopening;
- mine dispute;
- portal ownership.

---

# 136. Character Arcs

Grounded in:

- household;
- job;
- relationships;
- memory;
- world state.

Avoid static “stand here forever until player accepts.”

---

# 137. Event / Arc History

Arcs can consume resolved events as future premises.

A city that suffered flood can later have:

- memorial;
- rebuilding conflict;
- insurance dispute;
- political blame;
- ecological change.

---

# 138. Dynamic World State

24K owns Dynamic-State profiles.

Document 15 binds state transitions to actual evidence.

Examples:

- recovering;
- contested;
- isolated;
- prosperous;
- rebuilding;
- corrupted;
- quarantined;
- occupied.

Specialists still own underlying facts.

---

# 139. State Transition

A narrative state transition should reference:

- prior state;
- cause;
- evidence;
- affected subjects;
- owner-domain changes;
- world time.

---

# 140. Rumours

24K owns rumour/mystery modules.

Set 28C owns knowledge/belief spread.

Document 15 may use rumours to:

- reveal quest;
- add investigation objective;
- create alternate lead.

---

# 141. False Rumour

A quest may be generated from a false claim.

The world does not alter itself to make the rumour true.

---

# 142. Prophecy

A prophecy can be:

- symbolic;
- cultural;
- magical;
- probabilistic;
- self-fulfilling;
- false;
- manipulated.

Document 15 cannot guarantee future world state unless definition explicitly owns a scheduled event.

---

# 143. History Record

Resolved meaningful activity can become a Chronicle record.

```yaml
history_record:
  history_record_id: history:<ulid>
  record_type: <quest|event|political|structure|realm|maritime>
  subject_refs: []
  origin_definition_refs: []
  start_world_time: <time>
  end_world_time: <time>
  participant_refs: []
  contribution_refs: []
  decision_refs: []
  evidence_refs: []
  committed_outcome_refs: []
  aftermath_refs: []
  discovery_visibility_refs: []
  summary_template_ref: <id>
  revision: <rev>
```

---

# 144. History Is Evidence-Based

Generated prose summarising history may only use:

- stored evidence;
- committed state;
- approved template.

It may not invent unsupported facts.

---

# 145. Historical Significance

Not every completed delivery becomes permanent world history.

Significance can depend on:

- scale;
- rarity;
- person importance;
- structure;
- political change;
- casualties;
- realm consequence;
- player contribution;
- authored arc relevance.

---

# 146. Personal History

A named person's story may record:

- rescue;
- injury;
- betrayal;
- promotion;
- migration;
- marriage;
- death.

Ownership stays with relevant systems.

---

# 147. Settlement Chronicle

A settlement chronicle may include:

- founding;
- expansion;
- disaster;
- election;
- siege;
- restoration;
- migration;
- major trade opening.

---

# 148. Structure Chronicle

A structure may remember:

- builder;
- damage;
- occupation;
- restoration;
- claim.

Document 12 owns structure state.

---

# 149. Realm Chronicle

A realm may remember:

- first route;
- settlement;
- treaty;
- boss outcome;
- sealing;
- restoration.

---

# 150. Chronicle Compression

History must be bounded.

Use:

- significant event retention;
- aggregation;
- summaries;
- references.

Do not store limitless generated prose.

---

# 151. Quest Reward and History

Quest completion can be significant without leaving permanent world-history record.

The history significance profile decides.

---

# 152. Tutorial Quests

Tutorials are optional contextual guidance.

They may teach:

- gathering;
- crafting;
- building;
- movement;
- settlement;
- magic;
- automation.

They must bind to actual valid world state.

---

# 153. No Fixed Tutorial Valley

Tutorial does not require:

- Forest Hamlet;
- Watchtower;
- fixed mine;
- fixed NPC;
- goblin raid;
- fixed Day 4.

---

# 154. Contextual Tutorial Replacement

If no local workbench exists, tutorial can:

- teach hand crafting;
- point to alternate station;
- teach construction;
- skip.

Do not spawn hidden POC furniture.

---

# 155. Repeatable Quests

Repeatable content must correspond to recurring real needs.

Examples:

- patrol;
- supply;
- maintenance;
- survey;
- seasonal harvest;
- rescue service;
- trade contract.

---

# 156. Repeatable Anti-Farm Rule

Cooldown and state validation prevent:

- infinite reward from artificial abandon/reaccept;
- duplicate resource creation;
- duplicate contract payment.

---

# 157. Emergent Quests

Simulation conditions can create quest opportunities.

Examples:

- blocked road;
- missing worker;
- damaged pump;
- predator pressure;
- refugee arrival;
- market shortage;
- disease outbreak;
- route discovery.

---

# 158. Emergent Quest Validation

Before creation:

- real problem exists;
- meaningful action exists;
- subject valid;
- reward valid;
- not duplicate existing quest;
- event density acceptable.

---

# 159. Request Boards

Boards are projections of real opportunities.

They may show:

- requests;
- contracts;
- public projects;
- warnings;
- bounties;
- jobs.

Removing board does not remove underlying world condition.

---

# 160. Bounties

A bounty can be:

- economic contract;
- legal proclamation;
- creature-control request.

Document 15 tracks if exposed as quest.

Set 27/13 owns payment/legal authority.

---

# 161. NPC Quest Offers

NPCs can offer a quest only if:

- person exists;
- knows relevant information;
- has authority/interest;
- can communicate.

Set 28 supplies conversation/knowledge.

---

# 162. Dead Quest Giver

If quest giver dies:

- quest may continue via institution;
- reward executor may change;
- closure may occur.

No immortal quest-giver flag by default.

---

# 163. Off-Screen NPC Quest Progress

NPCs may independently:

- complete their own task;
- move;
- die;
- migrate.

Quest tracks authoritative state.

---

# 164. Automated Quest Fulfilment

Automation can satisfy objectives if the objective allows it.

Example:

“Maintain Grain stock above threshold for three days.”

Document 08/Inventory provides evidence.

---

# 165. Method Restrictions

A quest restricts method only for meaningful reasons.

Examples:

- non-lethal;
- no magic;
- exact ritual;
- specific cultural procedure;
- preserve structure.

Avoid arbitrary “kill with sword” conditions unless narrative/systemically justified.

---

# 166. Multiple Solutions

A shortage could be solved through:

- farm;
- trade;
- hunting;
- fishing;
- import;
- rationing;
- magic;
- diplomacy;
- relocation;
- automation.

Quest should reference outcome capabilities where practical.

---

# 167. Capability-Based Objectives

Prefer:

`provide 100 units of valid preserved provisions`

over:

`provide exactly item.food.bread.basic`

unless exact item matters.

---

# 168. Quality Requirements

Objectives may specify:

- minimum quality;
- freshness;
- purity;
- condition;
- provenance.

Canonical Item/Resource system remains authority.

---

# 169. Ownership Requirements

Quest delivery can require:

- lawful ownership;
- custody;
- no stolen stock;
- contract reservation.

Inventory/economy/law owners validate.

---

# 170. Quest-Owned Items

Avoid “quest item” as a magical duplicate identity.

An item may have:

- unique provenance;
- quest relevance;
- protected transfer.

It remains a normal canonical Item/Block/relic identity.

---

# 171. Unique Evidence

Evidence can be protected from accidental destruction through:

- warning;
- replacement path;
- archive copy;
- alternative evidence.

Avoid unresolvable soft-locks.

---

# 172. Objective Counting

Counts must be tied to committed evidence.

Do not count:

- client-side UI click;
- animation;
- predicted transfer;
- uncommitted recipe.

---

# 173. Aggregated Objectives

Large goals may use authoritative summaries.

Example:

“Settlement has treated at least 80% of outbreak cases.”

Summary must come from Set 29.

---

# 174. Threshold Objectives

Threshold may require:

- stay above;
- stay below;
- reach once;
- maintain duration.

---

# 175. Maintain Objective

A maintain objective needs:

- start time;
- end time;
- sampled/authoritative state;
- break conditions.

---

# 176. Escort / Follow Objectives at LOD

Distant travel uses Set 30 movement state.

Quest does not assume escort success because time elapsed.

---

# 177. Search Area Objectives

Search zones can guide exploration.

They do not guarantee target is physically inside if world state changed; runtime should update/close based on evidence.

---

# 178. Dynamic Target Locations

If subject moves:

- map marker updates only if player knowledge supports it;
- objective binding remains person ID.

---

# 179. Marker Knowledge

UI marker location is not objective truth.

Set 28C controls known location confidence.

---

# 180. Quest Pins and Map

Document 17 displays.

Document 15 supplies:

- objective;
- known target refs;
- urgency;
- confidence.

---

# 181. Journal

Journal should answer:

- what;
- why;
- who;
- known location;
- current evidence;
- time;
- choices;
- consequences.

---

# 182. Reason-First Status

Examples:

- “Bridge already collapsed — objective replaced.”
- “Contract breached — resolve dispute.”
- “Target migrated — last known location outdated.”
- “Storm ended — rescue window closed.”

---

# 183. Accessibility

Quest/event UI must support:

- text;
- icons;
- non-colour status;
- adjustable notifications;
- reduced urgency effects;
- captions;
- readable timers;
- optional tracking.

---

# 184. Notification Control

Players may reduce:

- event alerts;
- quest popups;
- auto-tracking;
- sound.

World still progresses.

---

# 185. Difficulty / Guidance Settings

Settings may alter:

- timer harshness;
- event density;
- consequence severity;
- quest marker precision;
- tutorial verbosity;
- emergency warning lead time.

They should not change authoritative ownership.

---

# 186. Peaceful Mode

Peaceful settings may replace combat objectives with:

- negotiation;
- deterrence;
- rescue;
- relocation;
- research;
- restoration.

---

# 187. Event Compatibility With Low-End Simulation

Low-end profiles may reduce:

- event evaluation frequency;
- ambient presentation;
- minor event density.

They must preserve active important event state.

---

# 188. Quest/Event LOD

### Q0 — Active Local
- full objective updates;
- local event phase;
- detailed participant evidence.

### Q1 — Regional
- objective event-driven updates;
- reduced polling;
- active important events.

### Q2 — World Summary
- major event milestones;
- quest deadlines;
- contract/social/movement callbacks.

### Q3 — Dormant Scheduled
- timers;
- milestone wakeups;
- no unnecessary polling.

---

# 189. LOD Invariants

LOD cannot change:

- quest acceptance;
- objective completion;
- branch decision;
- contribution;
- event phase;
- deadline;
- failure;
- reward;
- history.

---

# 190. Event-Driven Updates

Prefer subscriptions to:

- transaction committed;
- arrival;
- structure changed;
- treatment result;
- social agreement;
- contract state;
- political state;
- combat result.

Avoid scanning entire world every frame.

---

# 191. Condition Polling

Some conditions need periodic evaluation.

Use:

- bounded cadence;
- region relevance;
- dirty flags;
- event budgets.

---

# 192. Save / Persistence

Persist:

- Quest Instances;
- objective states;
- bound IDs;
- evidence refs;
- contribution;
- branch choices;
- deadlines;
- rewards;
- Event Instances;
- phase;
- severity;
- history;
- generated Arc bindings;
- migration revisions.

---

# 193. Save During Reward

Rewards must be transaction-safe.

A crash cannot result in:

- objective incomplete + reward given repeatedly;
- reward lost after completion.

---

# 194. Reward Claim State

Suggested:

- unclaimed;
- committing;
- claimed;
- partially_claimed;
- failed_recoverable.

---

# 195. Save During Event Resolution

Event resolution records:

- owner-domain commits;
- aftermath;
- history transition.

Use idempotent evidence IDs.

---

# 196. Multiplayer Authority

Host/server owns quest/event state.

Clients may:

- accept/request;
- track;
- vote;
- contribute;
- present local journal.

---

# 197. Personal Quests

Personal quest visibility/progression can differ per player.

World facts remain shared.

---

# 198. World Events

Event state is world-authoritative.

Players may have different knowledge of it.

---

# 199. Party Quests

Party quest must define:

- owner;
- join rules;
- leave rules;
- contribution;
- branch authority;
- reward.

---

# 200. Late Join

Late join may receive:

- current quest state;
- future contribution eligibility;
- no retroactive unique rewards unless policy allows.

---

# 201. Disconnect

Disconnecting player does not freeze:

- event;
- contract;
- convoy;
- rescue.

---

# 202. Shared Inventory

Quest cannot spend another player's stock without valid shared ownership/permission.

---

# 203. Anti-Duplication

Every reward and contribution transaction is idempotent.

---

# 204. Quest Migration

Migration handles:

- old IDs;
- removed NPC;
- removed structure;
- content pack update;
- objective schema change;
- ownership transfer;
- archived POC content.

---

# 205. Legacy POC Quest Migration

The fixed Forest Hamlet Watchtower Arc becomes an Archived Validation fixture.

Its generic capabilities survive.

---

# 206. POC Watchtower Arc

Legacy sequence:

**need discovery**  
→ **resource gathering**  
→ **processing**  
→ **warehouse delivery**  
→ **construction**  
→ **warning**  
→ **raid**  
→ **aftermath**

This remains an excellent regression test.

It is not production mainline.

---

# 207. POC Archived Elements

Archive as default production content:

- Forest Hamlet;
- fixed named villagers;
- fixed watchtower site;
- fixed goblin faction;
- fixed raid day;
- fixed mana discovery;
- fixed cave/ruin sequence;
- fixed reward chronology.

---

# 208. POC Preserved Mechanics

Preserve:

- settlement request;
- physical resource objective;
- warehouse delivery;
- staged project;
- NPC construction;
- warning;
- preparation alternatives;
- raid/event;
- casualties/damage;
- repair;
- persistent history.

---

# 209. POC Timing

The old fixed Day-4 raid becomes:

- simulation pressure;
- event selection;
- world settings;
- warning lead time.

---

# 210. POC Quest-Giver Replacement

Named POC actors become:

- generated valid person;
- institution;
- board;
- event;
- settlement role.

---

# 211. 24K Integration

24K's event families and arcs enter Document 15 through stable references.

Document 15 never edits the Atlas because one world's Event Instance resolved unusually.

---

# 212. Dynamic Content Packs

Mods/expansions can add:

- quest templates;
- event templates;
- arc adapters;
- objective modules;
- aftermath modules.

Set 25 governs admission.

---

# 213. Quest Security

User-authored/mod quests cannot execute arbitrary code.

They use validated:

- conditions;
- objectives;
- commands;
- effect requests;
- rewards.

---

# 214. AI-Assisted Quest Authoring

Future AI may propose:

- quest wording;
- participant binding;
- objective structure;
- dialogue hooks;
- alternative solutions.

Authoritative validators ensure:

- subjects exist;
- objectives valid;
- no invented rewards;
- no ownership bypass;
- no false world facts.

---

# 215. Runtime AI Story Director

A future bounded World Mind may propose:

- eligible arc;
- event;
- quest exposure;
- pacing.

It cannot force invalid world state.

---

# 216. No AI-Only Core Dependency

The shipped deterministic quest/event runtime must work without generative AI.

---

# 217. Quest Text

Text is presentation over structured state.

Generated/localised quest text may say:

“Bring grain to the eastern warehouse.”

The underlying binding stores exact settlement/inventory refs.

---

# 218. Text Must Not Invent State

If target warehouse is destroyed, journal text must update/close.

It cannot continue claiming it exists.

---

# 219. Voice / Localisation

Set 28I / Document 17 owns presentation.

Quest content uses localisation keys and dynamic tokens.

---

# 220. Chronology

All quests/events/history use authoritative world time.

---

# 221. Historical Dates

History records should support local calendar presentation while preserving canonical time reference.

---

# 222. Repeating Events

Recurring events need:

- recurrence rules;
- cooldown;
- changed context;
- history.

Festival year 2 is not the exact same Event Instance as year 1.

---

# 223. Seasonal Events

Seasonal opportunities can include:

- harvest;
- migration;
- storms;
- trade;
- rituals.

World/environment owner supplies season.

---

# 224. Scheduled Political Events

Elections/succession review can create Event Instances.

Document 13 owns political state.

---

# 225. Event Cascades

One event may trigger another.

Example:

storm → bridge collapse → route closure → market shortage → refugee arrival.

Each owner commits its own state.

Document 15 links history.

---

# 226. Cascade Budgets

Prevent infinite event cascades.

Use:

- cause chain depth;
- cooldown;
- density;
- significance;
- duplicate suppression.

---

# 227. Aftermath Modules

24K owns authored aftermath modules.

Document 15 applies them by requesting valid specialist consequences.

Examples:

- memorial;
- repair demand;
- migration;
- market recovery;
- ecology succession;
- leadership change;
- investigation.

---

# 228. Aftermath Is Not Reward Screen

Aftermath may take:

- hours;
- days;
- months

of world time.

---

# 229. Long-Term Consequence

Quest choices may affect:

- structure;
- settlement;
- faction;
- route;
- ecology;
- realm;
- market;
- relationships;
- history.

---

# 230. Consequence Visibility

Players should be able to discover later:

- what changed;
- why;
- who remembers;
- what remains unresolved.

---

# 231. Hidden Consequence

Some consequences can be hidden initially.

They still exist authoritatively.

---

# 232. No Fake Moral Meter

Choices are evaluated by systems.

Document 15 does not assign universal “good/evil points.”

---

# 233. Choice Labels

Avoid misleading labels like:

- Good
- Evil
- Correct

unless deliberately used by an in-world narrator.

Show action intent where practical.

---

# 234. Failure Recovery

If a quest target is deleted due to migration/error:

- attempt stable alias;
- successor;
- valid replacement;
- safe closure;
- compensate if required.

---

# 235. Missing Content Pack

If a quest definition disappears:

- preserve instance history;
- freeze/close safely;
- do not delete committed rewards/consequences.

---

# 236. Quest Versioning

Quest Instance stores definition revision.

Content update does not silently rewrite accepted quest objectives without migration.

---

# 237. Event Versioning

Active Event Instance should preserve its frozen definition revision unless compatible migration succeeds.

---

# 238. Debug Tools

Developers need inspectors for:

- quest bindings;
- objectives;
- evidence;
- event phase;
- timers;
- contributions;
- history;
- reason codes.

---

# 239. Explainability

Every blocked objective should answer:

- what is missing;
- which system owns it;
- current target;
- whether recoverable.

---

# 240. Diagnostics

Recommended reason codes:

| Code | Meaning |
|---|---|
| `QST-DEF-001` | Quest definition missing/invalid. |
| `QST-BIND-001` | Required bound subject invalid. |
| `QST-STAGE-001` | Stage transition invalid. |
| `QST-OBJ-001` | Objective definition invalid. |
| `QST-EVID-001` | Evidence missing/stale/invalid. |
| `QST-EVID-002` | Duplicate evidence application blocked. |
| `QST-TIME-001` | Deadline/time reference invalid. |
| `QST-BRANCH-001` | Branch transition invalid. |
| `QST-REPL-001` | Required subject replacement unavailable. |
| `QST-REWARD-001` | Reward commit failed/recoverable. |
| `QST-CONTRIB-001` | Contribution evidence invalid. |
| `QST-ECON-001` | Economic contract/payment state unresolved. |
| `QST-SOC-001` | Social outcome/knowledge evidence unresolved. |
| `QST-BIO-001` | Biological treatment/state evidence unresolved. |
| `QST-MOVE-001` | Journey/arrival evidence unresolved. |
| `QST-STRUCT-001` | Structure/project state unresolved. |
| `QST-MAG-001` | Magic/ritual state unresolved. |
| `QST-REALM-001` | Realm route/transition state unresolved. |
| `QST-PERS-001` | Personhood/subject classification conflict. |
| `QST-AUTH-001` | Player lacks quest/branch authority. |
| `QST-SAVE-001` | Quest persistence inconsistency. |
| `QST-POC-001` | Retired POC dependency detected. |
| `EVT-DEF-001` | Event definition missing/invalid. |
| `EVT-ELIG-001` | Event eligibility failed. |
| `EVT-EXCL-001` | Event conflicts with active state. |
| `EVT-PHASE-001` | Event phase transition invalid. |
| `EVT-SUBJ-001` | Event subject invalid. |
| `EVT-DENS-001` | Event density budget prevents activation. |
| `EVT-RES-001` | Resolution cannot reconcile owner-domain evidence. |
| `EVT-AFTER-001` | Aftermath commit unresolved. |
| `EVT-LOD-001` | LOD reconciliation failed. |
| `EVT-SAVE-001` | Event persistence inconsistency. |

---

# 241. Validation — Quest Definition

Validate:

- ID;
- category;
- scope;
- availability;
- stages;
- objectives;
- evidence predicates;
- branch rules;
- failure;
- rewards;
- aftermath;
- localisation;
- production status.

---

# 242. Validation — Subject Binding

Check:

- entity exists;
- type valid;
- personhood valid;
- world/realm reachable if required;
- ownership compatible;
- no duplicate unique role;
- not POC-only.

---

# 243. Validation — Objective Ownership

Fail if quest objective:

- calculates price;
- writes Trust;
- writes Health;
- writes movement transform;
- creates inventory;
- declares structure complete;
- completes contract itself.

---

# 244. Validation — Reward Ownership

Fail direct unauthorised mutation.

Rewards route through owners.

---

# 245. Validation — Event

Check:

- cause;
- eligibility;
- suitability;
- subjects;
- phase;
- warning;
- interventions;
- resolution;
- aftermath;
- cooldown.

---

# 246. Validation — Event Cause

Every event requires:

- simulation cause;
- authored schedule;
- world-state opportunity;
- explicit actor action;
- valid world event trigger.

No universal arbitrary chaos timer.

---

# 247. Validation — Aftermath

Resolved event must not leave orphaned:

- structure state;
- settlement state;
- faction state;
- biological state;
- contract;
- inventory reservation;
- route.

---

# 248. Validation — Continuity

Every branch transition checks references before commit.

---

# 249. Validation — POC Leakage

Production fails if normal generation requires:

- Forest Hamlet;
- Watchtower Arc;
- named POC villagers;
- fixed goblin raid;
- fixed day timing;
- fixed mana discovery;
- fixed ruin;
- fixed portal.

---

# 250. Validation — Multiplayer

Test:

- simultaneous acceptance;
- simultaneous turn-in;
- branch vote;
- shared inventory;
- reward duplication;
- disconnect.

---

# 251. Required Test Laboratory — Basic Request

Generate a real settlement shortage.

Expose request.

Solve via multiple methods.

Verify world condition and quest close correctly.

---

# 252. Required Test — Contract Wrapper

Accept Set 27 freight contract.

Expose as quest.

Partially deliver, suffer storm delay, renegotiate, complete.

Verify contract truth remains Set 27.

---

# 253. Required Test — Social Objective

Negotiate with generated faction.

Verify Set 28 supplies result.

Document 15 advances objective only from evidence.

---

# 254. Required Test — Biological Objective

Treat injured NPC.

Verify Set 29 owns injury/treatment.

Quest reacts to recovery.

---

# 255. Required Test — Movement Objective

Travel to remote site.

Block route mid-journey.

Verify objective waits for Set 30 arrival.

---

# 256. Required Test — Construction Project

Build/repair structure.

Verify project state, resources and commissioning.

---

# 257. Required Test — Event Without Player

Start flood.

Leave region.

Return after resolution.

Verify aftermath/history.

---

# 258. Required Test — Event Cascade

Storm damages bridge.

Route closes.

Economic shortage emerges.

Verify separate owner-domain state and linked history.

---

# 259. Required Test — Dead Quest Giver

Kill/lose requester after quest acceptance.

Verify replacement/closure.

---

# 260. Required Test — Realm Quest

Stabilise route and enter realm.

Save during transition.

Verify no duplication and valid safe return.

---

# 261. Required Test — Maritime Rescue

Storm strands vessel.

Rescue survivors.

Verify Set 26 movement/weather, Set 29 health and Document 15 objective state.

---

# 262. Required Test — Personhood

Create hostile sapient Goblin faction quest.

Verify no animal/monster harvest/taming objective.

---

# 263. Required Test — POC Regression

Run archived Watchtower Arc.

Verify generic systems still pass.

---

# 264. Required Test — Low-End LOD

Run events/quests under low simulation profile.

Verify consequences/evidence equivalent.

---

# 265. Required Test — Multiplayer Contribution

Four players contribute through:

- supply;
- building;
- combat;
- healing.

Verify correct credit and no duplication.

---

# 266. Required Test — Content Update

Change quest definition.

Load old accepted quest.

Verify migration/frozen revision.

---

# 267. Performance

Quest/event runtime should be mostly:

- event-driven;
- indexed;
- region-scoped;
- dirty-condition-driven;
- scheduled.

Avoid evaluating every quest condition every frame.

---

# 268. Quest Condition Indexing

Index by:

- subject;
- event type;
- transaction type;
- region;
- world time;
- system owner.

---

# 269. Event Selection Budget

Event selector evaluates eligible candidates at bounded intervals.

---

# 270. History Storage Budget

Keep:

- significant history;
- summaries;
- provenance refs.

Prune low-value repetitive details according to policy.

---

# 271. Godot / Summer Engine Direction

Document 18 v1.0 owns implementation.

Document 15 requires eventual services such as:

- QuestDefinitionRegistry;
- QuestRuntimeService;
- ObjectiveEvidenceService;
- QuestBindingService;
- QuestContributionService;
- RewardOrchestrationService;
- EventDefinitionRegistry;
- EventSelectionService;
- EventRuntimeService;
- EventAftermathService;
- ArcRuntimeService;
- HistoryChronicleService;
- QuestEventLODService;
- QuestEventMigrationService;
- QuestEventValidationService;
- QuestDebugInspector.

Names are illustrative.

---

# 272. Runtime Commands

Illustrative commands:

- `DiscoverQuest`
- `OfferQuest`
- `AcceptQuest`
- `AbandonQuest`
- `SubmitQuestEvidence`
- `ChooseQuestBranch`
- `ClaimQuestReward`
- `StartEvent`
- `AdvanceEventPhase`
- `SubmitEventContribution`
- `ResolveEvent`
- `CommitAftermath`

All are server-authoritative where consequential.

---

# 273. Runtime Events

Illustrative emitted events:

- `QuestDiscovered`
- `QuestOffered`
- `QuestAccepted`
- `QuestObjectiveChanged`
- `QuestStageCompleted`
- `QuestBlocked`
- `QuestCompleted`
- `QuestFailed`
- `QuestExpired`
- `QuestClosed`
- `EventWarningStarted`
- `EventStarted`
- `EventEscalated`
- `EventResolved`
- `EventAftermathStarted`
- `HistoryRecordCreated`

---

# 274. Objective Predicate Example

```yaml
objective:
  objective_id: <id>
  module: delivery
  target_inventory_ref: <id>
  selector_ref: <resource_or_item_selector>
  required_quantity: 100
  completion_predicate:
    evidence_type: inventory_transfer_committed
    destination_must_match: true
    ownership_transfer_required: true
  contribution_policy: proportional
```

---

# 275. Movement Objective Example

```yaml
objective:
  module: reach_location
  target_area_ref: <id>
  required_subject_refs:
    - player:<id>
  completion_predicate:
    evidence_type: authoritative_arrival
    source_owner: set30
  failure_policy:
    route_destroyed: replace_or_block
```

---

# 276. Treatment Objective Example

```yaml
objective:
  module: treatment
  patient_ref: person:<id>
  completion_predicate:
    evidence_type: biological_treatment_result
    source_owner: set29
    accepted_result_tags:
      - stabilised
      - recovered
```

---

# 277. Contract Objective Example

```yaml
objective:
  module: fulfil_contract
  contract_ref: contract:<id>
  completion_predicate:
    evidence_type: contract_state_change
    source_owner: set27
    accepted_states:
      - fulfilled
```

---

# 278. Social Objective Example

```yaml
objective:
  module: negotiate
  negotiation_context_ref: <id>
  completion_predicate:
    evidence_type: social_negotiation_result
    source_owner: set28
    accepted_outcome_tags:
      - agreement_reached
```

---

# 279. Structure Objective Example

```yaml
objective:
  module: restore_structure
  structure_ref: structure_instance:<id>
  target_state: restored
  completion_predicate:
    evidence_type: structure_state_changed
    source_owner: document12
```

---

# 280. Event Trigger Example

```yaml
event_trigger:
  atlas_event_ref: EVT-031
  condition:
    biological_population_summary_ref: <id>
    medicine_supply_summary_ref: <id>
    severity_threshold: <value>
  exclusion:
    active_event_tag: medicine_shortage
  warning_profile_ref: <id>
```

---

# 281. World Event / Quest Relationship Example

**Medicine Shortage Event**

World truth:

- Set 29 population treatment demand;
- Inventory/Set 27 medicine supply.

Event:

- `EVT-031 Medicine Shortage`

Generated quests:

- procure medicine;
- restore clinic;
- escort healer;
- investigate supply disruption.

The Event exists independently of those quests.

---

# 282. Event Cascade Example

**Storm**

Set 26/environment:

- storm.

Document 12:

- pier damaged.

Set 30/26:

- route blocked.

Set 27:

- fish/provision supply falls.

Set 29:

- care demand rises.

Document 15:

- records linked event history and exposes relevant quests.

---

# 283. Multiple Solution Example — Food Shortage

Underlying problem:

`Settlement Provisions demand > available supply`

Potential solutions:

- farm;
- hunt;
- fish;
- buy;
- contract;
- import;
- ration;
- magical growth;
- relocation.

Quest success evaluates the authoritative shortage state or declared valid contribution.

---

# 284. Multiple Solution Example — Raid

Underlying event:

hostile faction operation.

Potential:

- diplomacy;
- tribute;
- fortification;
- evacuation;
- sabotage;
- alliance;
- combat.

No mandatory kill-all path.

---

# 285. Multiple Solution Example — Corrupted Spring

Potential:

- magical cleansing;
- engineering bypass;
- alternative water source;
- containment;
- scientific investigation;
- settlement relocation.

---

# 286. World-First Narrative Rule

A quest should usually point to a world fact the player could potentially discover without the quest UI.

---

# 287. No Marker-First Design

Avoid designing:

`marker → objective → spawn world object`

Prefer:

`world object/state → evidence → quest`.

---

# 288. Sandbox Guidance

Quests provide clarity without forcing participation.

Players can:

- ignore;
- delay;
- solve indirectly;
- discover aftermath.

---

# 289. Main Quest Optionality

Any main mystery should coexist with:

- settlement building;
- trade;
- magic;
- exploration;
- realm play.

World does not end because player ignores it.

---

# 290. Quest Chain Optionality

Non-critical quest chains may close permanently.

That is acceptable when history explains it.

---

# 291. Critical Capability Guarantee

If a quest path is the only provider of a required capability, production design should normally provide:

- alternate provider;
- fallback;
- safe replacement.

Do not resurrect fixed story actors.

---

# 292. Reward Unlocks

Unlocks should come from actual:

- knowledge;
- recipe;
- authority;
- capability.

Quest completion can trigger these through owners.

---

# 293. Quest XP

Document 02 owns progression.

Quest completion may provide progression evidence/reward.

---

# 294. Reputation

Set 28 owns social reputation.

Quest completion may emit contribution/outcome evidence.

---

# 295. Political Standing

Document 13 owns formal political status.

Quest can request:

- citizenship grant;
- title;
- office

only through valid authority.

---

# 296. Property Reward

A structure/property reward requires valid ownership transfer.

Document 12/13/27 handles it.

---

# 297. Item Reward

Use canonical Items/Block projections.

No duplicate quest-item identity.

---

# 298. Currency Reward

Set 27 transaction.

No quest-owned gold counter.

---

# 299. Knowledge Reward

Set 28C/02 or relevant registry owner commits knowledge.

---

# 300. Contract Reward

If reward is contract payment, Set 27E pays it.

Quest does not pay twice.

---

# 301. Quest Availability Rules

May use:

- world state;
- knowledge;
- capability;
- relationship;
- political status;
- settlement need;
- production tier;
- realm access.

---

# 302. No Level-Only Quest Universe

Level can contribute.

Do not replace all contextual requirements with `player_level >= N`.

---

# 303. Dynamic Scaling

Quest difficulty may scale through:

- participant count;
- quantity;
- travel;
- threat;
- time;
- environment.

Do not rewrite world truth to match player level.

---

# 304. Generated Quest Binding

Generated quests must bind:

- valid requester/source;
- valid target;
- valid solution;
- valid reward;
- valid aftermath.

---

# 305. Generated Quest Variety

Variation should come from real differences in:

- people;
- place;
- culture;
- resources;
- politics;
- ecology;
- routes.

Not just noun substitution.

---

# 306. Quest Template Reuse

A repair-request template can bind:

- bridge;
- pump;
- ward;
- vessel component.

But objectives adapt to specialist owner.

---

# 307. Personalisation

Quest text may reference:

- prior history;
- relationship;
- culture;
- settlement;
- player actions.

Only if evidence exists.

---

# 308. Narrative Memory

Resolved quests/events can become inputs to Set 28 social memory and 24K future arc selection.

---

# 309. World Chronicle

Chronicle is not merely player achievement list.

It records important world history.

---

# 310. History Ownership

Document 15 owns the Chronicle record.

The underlying event states remain owned by specialists.

---

# 311. History Queries

Systems may query:

- settlement suffered flood;
- player helped rebuild;
- faction broke treaty;
- boss was spared.

Use committed history/evidence.

---

# 312. Memorialisation

A historical event may later lead to:

- monument;
- holiday;
- place name;
- ritual.

The appropriate systems commit those changes.

---

# 313. Rumour from History

Set 28C may spread distorted accounts of a real history record.

---

# 314. Contested History

Several groups may interpret one event differently.

Document 15 stores objective committed evidence.

Set 28/13 holds interpretations/claims.

---

# 315. World History Is Not Perfect Knowledge

The runtime can know objective facts that actors do not.

UI must filter.

---

# 316. Event Ethics

24K flags serious content such as:

- persecution;
- slavery;
- genocide;
- disease;
- colonisation;
- cultural erasure

for deliberate authored review, not filler procedural events.

Document 15 respects content-safety/review tags.

---

# 317. Content Severity Settings

World settings may suppress or soften:

- severe disease;
- permanent death;
- persecution;
- extreme disasters;
- harsh economic failure.

Replacement events should remain coherent.

---

# 318. Event Warnings

High-consequence events should expose fair warning where the fiction permits.

---

# 319. Surprise Events

Some events may intentionally surprise.

They still require cause.

---

# 320. World Event Fairness

Avoid:

- destroying player base with no possible warning/counterplay;
- killing named NPCs off-screen arbitrarily;
- removing unique quest items without recovery.

---

# 321. Off-Screen Consequence Protection

Protected player-critical state may use:

- bounded risk;
- warning;
- delayed catastrophic commit;
- rescue opportunity;
- settings.

---

# 322. No Narrative Invulnerability

Important NPCs are not universally immortal.

Story continuity must handle death.

---

# 323. No Infinite Waiting

Quest givers/events do not wait forever if world conditions should resolve.

---

# 324. Dynamic Opportunity Windows

An opportunity may last:

- hours;
- season;
- until condition changes;
- indefinitely.

---

# 325. Journal Archive

Closed/failed quests remain in archive where useful.

---

# 326. History Search

UI may support filtering by:

- settlement;
- faction;
- person;
- realm;
- category;
- date.

---

# 327. Quest/Event Registry Families

Document 15 runtime registries include:

- quest definition;
- quest category;
- quest scope;
- stage;
- objective module;
- evidence predicate;
- contribution policy;
- failure policy;
- expiry policy;
- reward orchestration;
- event definition;
- event phase;
- intervention profile;
- density budget;
- cooldown;
- arc runtime profile;
- history significance;
- Chronicle template;
- LOD profile;
- reason code;
- migration alias.

24K content registries remain separate.

---

# 328. Stable IDs

Recommended:

```text
leyforge.core.quest.<domain>.<identity>
leyforge.core.quest_objective.<identity>
leyforge.core.event_runtime_profile.<identity>
leyforge.core.history_profile.<identity>
```

24K IDs remain their own stable authored content IDs.

---

# 329. Cross-System Interface Summary — Set 27

Document 15 consumes:

- contract state;
- payment evidence;
- economic transaction;
- market facts.

Set 27 remains source of truth.

---

# 330. Cross-System Interface Summary — Set 28

Document 15 consumes:

- dialogue result;
- negotiation result;
- assignment state;
- knowledge evidence;
- relationship consequence evidence.

Set 28 remains source of truth.

---

# 331. Cross-System Interface Summary — Set 29

Document 15 consumes:

- treatment result;
- biological state summary;
- disease/outbreak evidence;
- casualty state.

Set 29 remains source of truth.

---

# 332. Cross-System Interface Summary — Set 30

Document 15 consumes:

- journey;
- route status;
- ETA;
- arrival;
- blockage;
- formation/escort evidence.

Set 30 remains source of truth.

---

# 333. Cross-System Interface Summary — Set 26

Document 15 consumes:

- vessel/voyage;
- storm;
- rescue;
- wreck;
- port;
- catch;
- maritime ecology;
- naval event evidence.

---

# 334. Cross-System Interface Summary — Documents 03–06

Document 15 consumes:

- ownership;
- item/resource state;
- recipe transaction;
- project resource state.

---

# 335. Cross-System Interface Summary — Document 07

Consumes:

- person existence;
- settlement operation;
- worker/job;
- migration.

---

# 336. Cross-System Interface Summary — Document 08

Consumes:

- machine state;
- automated production;
- delivery.

---

# 337. Cross-System Interface Summary — Document 09

Consumes:

- spell;
- ward;
- ritual;
- corruption;
- mana;
- portal activation.

---

# 338. Cross-System Interface Summary — Document 10

Consumes:

- population;
- ecology;
- tame state;
- creature event evidence.

---

# 339. Cross-System Interface Summary — Document 12

Consumes:

- structure;
- route infrastructure;
- damage;
- restoration;
- claim.

---

# 340. Cross-System Interface Summary — Document 13

Consumes:

- government;
- law;
- faction;
- treaty;
- war;
- citizenship;
- political state.

---

# 341. Cross-System Interface Summary — Document 14

Consumes:

- realm instance;
- route;
- anchor;
- transition;
- realm state.

---

# 342. Cross-System Interface Summary — Document 16

Consumes:

- combat resolution;
- surrender;
- capture;
- death;
- defence outcome.

---

# 343. Main-Document Reconciliation Requirements

| Document | Required Follow-On Reconciliation |
|---|---|
| 16 — Combat | Combat quest objectives consume authoritative outcomes; fixed POC raid ceases to be canonical encounter. |
| 17 — UI/UX | Journal/events/chronicle become knowledge-aware and reason-first; no hidden simulation truth leakage. |
| 18 — Technical | Implement evidence bus, quest/event services, persistence, LOD, idempotency and migration in Godot/Summer. |
| 19–20 | Settlement projects expose authoritative project/service evidence to Document 15. |

---

# 344. Production Acceptance Criteria

Document 15 v1.0 is accepted when:

- [x] authored + simulation-driven quests remain supported;
- [x] multiple solution methods remain core;
- [x] failure usually creates persistent world state rather than reload;
- [x] world events progress with/without player;
- [x] 24K remains authored history/story/event Atlas authority;
- [x] 48 historical incident foundations are referenced rather than duplicated;
- [x] 48 story-arc foundations are referenced rather than duplicated;
- [x] 72 world-event foundations are referenced rather than duplicated;
- [x] 36 dynamic-state profiles remain 24K-owned;
- [x] 24 rumour/mystery modules remain 24K-owned;
- [x] 18 aftermath modules remain 24K-owned;
- [x] Quest Instances own objective lifecycle;
- [x] Event Instances own runtime event lifecycle;
- [x] real specialist evidence drives objective completion;
- [x] Set 27 contracts remain economically authoritative;
- [x] Set 28 social outcomes/knowledge remain authoritative;
- [x] Set 29 biological state remains authoritative;
- [x] Set 30 movement/arrival remains authoritative;
- [x] Set 26 maritime quest/event integration is included;
- [x] rewards route through owners;
- [x] contribution is idempotent and multiplayer-safe;
- [x] quest items do not create duplicate Item identities;
- [x] dead/migrated actors do not respawn for quest continuity;
- [x] event density/cooldown/exclusion is explicit;
- [x] high-consequence events have warning/counterplay where appropriate;
- [x] history is evidence-based and bounded;
- [x] the fixed Forest Hamlet Watchtower Arc is Archived Validation only;
- [x] fixed goblin raid/mana-discovery chronology is retired;
- [x] Godot/Summer direction is current.

---

# Appendix A — Objective Ownership Matrix

| Objective | Authoritative Evidence Owner |
|---|---|
| Own / Deliver Item | Inventory / Documents 03–04 |
| Craft / Transform | Document 05 |
| Resource Provider State | Document 06 |
| NPC Alive / Migrated | Document 07 |
| Machine Produced / Delivered | Document 08 |
| Ritual / Ward / Spell | Document 09 |
| Creature Population / Taming | Document 10 |
| Reach / Travel | Set 30 / Set 26 |
| Structure Built / Restored | Documents 12 / 19 / 20 |
| Treaty / Citizenship / War | Document 13 |
| Realm Route / Transition | Document 14 |
| Combat Defeat / Surrender | Document 16 |
| Contract / Payment | Set 27 |
| Persuasion / Relationship / Knowledge | Set 28 |
| Treatment / Injury / Disease | Set 29 |
| Quest / Event Stage | Document 15 |

---

# Appendix B — Quest / Contract / Assignment Separation

| Record | Owner | Core Meaning |
|---|---|---|
| Quest | Document 15 | Player-facing structured objective lifecycle |
| Request | Document 15 | Need-driven ask |
| Contract | Set 27E | Persistent economic obligation |
| Social Assignment | Set 28G | Delegated task/agreement |
| Movement Intent | Set 30 | Physical movement request/execution |
| Event | Document 15 | Time/phase-based world change |
| Arc | 24K | Long-term authored relationship/story possibility |

---

# Appendix C — Event Lifecycle Template

```yaml
event_phase:
  phase_id: <id>
  entry_conditions: []
  warning_outputs: []
  active_pressure_refs: []
  generated_quest_profiles: []
  intervention_profiles: []
  escalation_conditions: []
  resolution_conditions: []
  max_duration: <value>?
  next_phase_rules: []
```

---

# Appendix D — Quest Failure Record

```yaml
quest_resolution:
  quest_instance_ref: <id>
  result: failed
  reason_code: <id>
  causal_evidence_refs: []
  world_state_refs: []
  contract_effect_refs: []
  social_effect_refs: []
  history_record_ref: <id>?
  replacement_quest_refs: []
  closed_world_time: <time>
```

---

# Appendix E — Event Aftermath Record

```yaml
event_aftermath:
  event_instance_ref: <id>
  outcome_ref: <id>
  committed_effect_refs:
    - owner: document12
      evidence_ref: <id>
    - owner: set29
      evidence_ref: <id>
  followup_arc_refs: []
  generated_request_refs: []
  historical_significance: major
  chronicle_record_ref: <id>
```

---

# Appendix F — Maritime Quest/Event Template Alignment

Set 26N requires maritime templates to bind:

- real subjects;
- knowledge visibility;
- stages;
- objectives;
- solutions;
- delegation;
- contribution;
- rewards;
- failure;
- aftermath.

Maritime Event Instances bind:

- region/sea area;
- vessels;
- ports;
- crews;
- weather;
- ecology;
- cargo;
- phase;
- severity;
- generated quests;
- consequences;
- history.

Document 15 adopts the same generic architecture rather than creating a separate maritime quest engine.

---

# Appendix G — 24K Event Foundation Intake Examples

Document 15 may bind production Event Instances to 24K foundations such as:

- Seasonal Flood;
- Drought Front;
- Wildfire Corridor;
- Great Migration;
- Pollinator Collapse;
- Predator Pressure;
- Boss Territory Shift;
- Siege Muster;
- Refugee Arrival;
- Public Works Drive;
- Leadership Election;
- Medicine Shortage;
- Labour Dispute;
- Border Negotiation;
- Realm Breach.

The complete event-family registry remains in 24K.

---

# Appendix H — POC Watchtower Regression Flow

```text
Generated settlement need
    ↓
Request / Project Quest
    ↓
Real resource acquisition
    ↓
Document 05 processing
    ↓
Real warehouse transfer
    ↓
Document 19/20 construction project
    ↓
Event warning
    ↓
Preparation alternatives
    ↓
Document 16 threat resolution
    ↓
Structure / NPC / settlement aftermath
    ↓
Chronicle record
```

No step requires Forest Hamlet in production.

---

# Appendix I — Definition of Done for Implemented Quest/Event Runtime

The implementation is not complete because a journal can display “0/10”.

Production proof requires:

- quest definitions bind stable real subjects;
- objective progress comes from authoritative evidence;
- duplicate evidence cannot double-complete objectives;
- quests do not own contract truth;
- quests do not own social truth;
- quests do not own biological truth;
- quests do not own movement truth;
- rewards are transactional;
- accepted quests survive save/load;
- event lifecycle continues at LOD;
- events can resolve without player;
- aftermath persists;
- historical records use evidence;
- dead quest givers remain dead;
- destroyed structures remain destroyed;
- migrated targets retain identity;
- movement objectives wait for authoritative arrival;
- treatment objectives wait for Set 29 outcomes;
- contract objectives wait for Set 27E outcomes;
- social objectives wait for Set 28 outcomes;
- maritime quests use Set 26;
- realm quests preserve Document 14 safe-return rules;
- multiplayer contribution is deterministic;
- low-end settings do not change quest/event truth;
- content updates migrate active instances safely;
- POC Watchtower Arc remains usable only as Archived Validation;
- normal production contains no fixed POC story sequence.

---

# Completion Statement

**Document 15 v1.0 reconciles Leyforge's original Quest and Event System with the production World Content Atlas, the persistent simulation foundation and the final cross-system ownership model.**

The result preserves the original design philosophy:

**quests are expressions of real world state, not detached errands.**

The architecture now makes that promise enforceable.

**24K owns authored history, story arcs, event families, dynamic-state profiles, rumours and aftermath modules.**  
**Document 15 owns runtime Quest Instances, Event Instances, objectives, evidence satisfaction, branching, contribution, failure and Chronicle records.**  
**Set 27 owns contracts and economic obligations.**  
**Set 28 owns social outcomes, dialogue and knowledge.**  
**Set 29 owns biological state.**  
**Set 30 / Set 26 owns movement and arrival.**  
**Documents 03–14 own the physical and simulation truths quests refer to.**

A quest can fail because the bridge collapsed.

It cannot keep the bridge alive for narrative convenience.

A contract can breach because the shipment missed its window.

The quest cannot rewrite the deadline.

A patient can recover before the player arrives.

The quest must adapt.

A settlement can solve its own crisis.

The world does not wait for a marker to be clicked.

And the old Forest Hamlet Watchtower sequence remains valuable as a regression fixture without becoming the story every Leyforge world is forced to tell.

**Next foundation reconciliation dependency: Document 16 — Combat, Gear and Defence System v1.0.**
