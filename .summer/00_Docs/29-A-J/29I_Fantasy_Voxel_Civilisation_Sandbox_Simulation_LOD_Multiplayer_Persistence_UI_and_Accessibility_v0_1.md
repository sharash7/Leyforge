# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 29

# 29I - Simulation LOD, Multiplayer, Persistence, UI and Accessibility

**Version 0.1 - Detailed Design Bible, Runtime Architecture and Integration Contract Draft**

*A deterministic, authoritative and accessibility-first runtime architecture for scaling Leyforge's Survival, Health and Biological Systems from one active player to living settlements, distant populations, multiplayer sessions and persistent worlds without losing identity, consequence, explainability or player safety.*

**Project Lead and Final Authority: Ash**

> **29I System Statement**  
> Survival simulation must remain truthful at every scale. The player standing in a blizzard, a wounded companion travelling nearby, an ill named villager in an unloaded settlement and a distant population experiencing a food shortage must all use the same biological rules at the level of detail appropriate to their relevance. Higher LOD may compress representation and scheduling; it may not invent free healing, duplicate consumption, erase serious conditions or create surprise death from application-closed wall time. Multiplayer clients may predict presentation and selected low-risk responsiveness, but the authoritative world owns persistent biological truth. UI and accessibility must make danger readable without forcing permanent meters, colour dependence, nausea-inducing effects or excessive micromanagement.

| Field | Locked Direction |
| --- | --- |
| Document Role | 29I is the Set 29 authority for biological scheduling, simulation LOD, promotion/demotion, persistence policy, multiplayer authority/replication contracts, biological view-model requirements and biological accessibility behaviour. |
| Governing Contract | The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains binding. Set 29 consumes economy, social and movement interfaces rather than redefining them. |
| Simulation Direction | Event-driven where possible, scheduled where time accumulation matters, deterministic under elapsed simulation time, and never tied to render frame rate. |
| LOD Direction | Use five biological LODs: L0 Active, L1 Local Reduced, L2 Settlement/Chunk Summary, L3 Regional Abstract and L4 Dormant/Scheduled. Detail may be reduced; persistent consequence may not be discarded. |
| Named-Actor Rule | Players, companions, story/quest-relevant NPCs, severe/critical medical cases and other explicitly protected actors remain individually traceable even when their surrounding population is aggregated. |
| Offline Rule | Closing a local game does not advance player biological danger by real-world wall time. A dedicated/authoritative server may continue because the world is genuinely running, subject to explicit offline-player presence policy. |
| Save Direction | Persist consequential biological state, definition/profile references, scheduled milestones, transaction safety data and migration versions. Do not save transient presentation interpolation or reconstructable cosmetics. |
| Multiplayer Direction | Server/host authoritative. Clients may predict selected Stamina/presentation behaviour but cannot authoritatively heal, consume, cure, infect, poison, change profile or complete treatment. |
| Transaction Direction | One-time biological actions use idempotent transaction/event IDs so retries, reconnects and save recovery cannot duplicate consumption, damage, healing or treatment. |
| UI Direction | Document 17 remains the actual UI owner. 29I owns the biological view-model and alert contracts that let UI present state accurately, contextually and accessibly. |
| Accessibility Direction | Presentation accessibility is always per-player. Mechanical survival assists use the same authoritative rules and may be per-player only when the world/server policy allows it. No critical state may depend on colour, audio, motion or haptics alone. |
| Difficulty Direction | Peaceful, Relaxed, Standard, Harsh and Custom continue to use one save/schema model. Difficulty and accessibility are separate control layers even when both modify biological severity. |
| Engine Direction | Godot with Summer Engine remains the implementation direction. Set 25 qualified IDs, immutable definitions, schema ownership, migrations, validation and release-gate requirements apply. |
| Final Handoff | 29J owns final registry/API reconciliation, balance framework, canonical schemas, complete amendment reconciliation and final Set 29 validation acceptance. |

# Document Purpose

Documents 29A-29H define what Leyforge's biological systems mean: Health, Stamina, Fatigue, Hunger, Hydration, Nutrition, Temperature, Wetness, Sleep, injuries, wounds, bleeding, disease, poison, medicine, treatment, biological profiles and cross-system protection. 29I defines how those truths continue to work when the actor is no longer the only thing in front of the camera.

This document answers the runtime questions that the specialist documents intentionally left for final integration:

1. How often should each biological channel update?
2. What information is preserved when an actor leaves local simulation?
3. How do settlements simulate hundreds or thousands of residents without running every meal, breath and bandage individually?
4. How does a named injured NPC remain the same injured NPC after unloading and reloading?
5. What happens when the application is closed, a player disconnects or a dedicated server continues running?
6. Which biological values are saved, reconstructed, replicated or intentionally omitted?
7. Which client-side predictions are safe?
8. How do one-time food, medicine, poison, treatment and healing events survive retries and reconnects without duplication?
9. What biological information may UI show immediately, and what remains knowledge-gated?
10. How do survival systems remain usable for players who need reduced motion, stronger warnings, simpler status presentation or less punitive mechanics?

29I does **not** redefine the gameplay owned by 29B-29H. It does not decide how much hunger a meal restores, how a fracture heals, how a disease transmits or what an antidote cures. It schedules, preserves, summarises, replicates and presents the state produced by those owners.

# Design Sources, Authority and Treatment

| Source | Relevant Direction | 29I Treatment |
| --- | --- | --- |
| 00 - Master Game Design Bible | Survival, civilisation, automation and RPG systems must interconnect; difficulty spans peaceful to harsh; solo, co-op, LAN and split-screen are intended. | Preserve sandbox freedom, scalable biological severity and multiplayer compatibility. |
| 01 - Core Gameplay Loop | Survival must support rather than dominate explore -> gather -> craft -> build -> interact -> automate -> defend -> upgrade -> expand. | LOD/UI must not turn survival into permanent meter maintenance. |
| 02 - Player Progression | Health/Stamina and survival modifiers are derived progression surfaces, not traditional attribute ownership. | Persist authoritative progression inputs/references and consume their resulting biological modifiers. |
| 07 - NPC/Village | Named NPC identity and consequences persist while distant populations use bounded simulation. | Named medical state survives LOD transitions; routine populations may aggregate. |
| 15 - Quest/Event | Quests/events bind to persistent actor/world state and may progress under simulation. | Quest-relevant medical cases receive protected individual persistence; 29I emits state changes but does not create quests. |
| 17 - UI/UX | World-first, progressive disclosure, controller support, split-screen, localisation and accessibility are architectural requirements. | 29I defines biological view models, alerts and accessible state channels; Document 17 owns final screens/layout. |
| 18 v0.2 - Godot/Summer Engine Technical Plan | Authoritative world, immutable definitions, mutable runtime records, scheduling, LOD, saves, networking and event-driven architecture. | Use as technical architecture foundation without creating a parallel engine framework. |
| 20 - Buildings/Settlement Services | Health, shelter, provision and recovery services require real staff, resources and functioning infrastructure. | Population summaries consume actual service capacity; aggregation may not invent care. |
| 25B-25E | Qualified IDs, field ownership, definitions/runtime separation, pack/migration rules and validation evidence are production requirements. | All persistent/replicated records use stable references, versions and migration-safe fields; runtime evidence is testable. |
| 26 | Maritime survival, vessel interiors and aquatic specialist systems have their own authority. | 29I persists/replicates Set 29 biological state and consumes Set 26 capability/exposure results without duplicating aquatic ownership. |
| 29A | Establishes L0-L4 concept, authoritative state, offline safety and contextual UI/accessibility contract. | Formalised here into exact scheduling, persistence and integration rules. |
| 29B | Health/Stamina/Fatigue scheduling, persistence and limited prediction requirements. | Consolidated into the common scheduler and replication framework. |
| 29C | Nourishment LOD, cohort demand, transaction authority and contextual Hunger UI. | Consolidated without changing nourishment math. |
| 29D | Deterministic exposure integration, sleep persistence, environmental prediction and offline safety. | Consolidated without owning weather or sleep-world-time advancement. |
| 29E | Injury persistence, named-case traceability, offline bleed safety and accessible injury presentation. | Severe injuries remain individual records through all applicable LODs. |
| 29F | Scheduled disease/toxin milestones, cohort disease pressure, transmission authority and knowledge-sensitive UI. | Disease/poison scheduling and visibility are integrated into shared runtime policy. |
| 29G | Treatment transactions, population treatment throughput, save-safe procedures and treatment explainability. | Active procedures and reservations use the common transaction/checkpoint model. |
| 29H | Biological profiles, overlays, protection snapshots, mixed populations and handoff requirements for 29I. | Profile/version/persistent overlay state and cohort composition are formally preserved here. |

> **Source-of-Truth Rule**  
> 29I may decide *when*, *where*, *how often*, *at what representation*, *with what persistence* and *with what visibility* a biological state is processed. It may not change the biological meaning or formula owned by 29B-29H merely because an actor is distant, disconnected or represented as a cohort.

# Static Table of Contents

1. Locked 29I System Identity  
2. Approved Decision Summary  
3. Ownership and Non-Ownership Boundary  
4. Runtime Biological Simulation Architecture  
5. Authoritative Simulation Time  
6. Scheduler, Work Queues and Event Processing  
7. Biological LOD Model  
8. L0 - Active Simulation  
9. L1 - Local Reduced Simulation  
10. L2 - Settlement/Chunk Summary Simulation  
11. L3 - Regional Abstract Simulation  
12. L4 - Dormant and Scheduled Simulation  
13. Promotion, Demotion and Reconciliation  
14. Population Cohorts and Aggregation  
15. Named-Actor Protection and Priority  
16. Deterministic Catch-Up and Large Time Steps  
17. Offline, Closed-Application and Server-Running Rules  
18. Player Presence, Disconnect and Reconnect  
19. Persistence Architecture and Save Classes  
20. Biological Save Records and Checkpoints  
21. Atomic Save, Recovery and Transaction Journal  
22. Versioning, Migration and Definition Changes  
23. Multiplayer Authority Model  
24. Client Prediction and Reconciliation  
25. Replication Priorities and Snapshot Design  
26. Idempotency, Audit and Cross-System Transactions  
27. Split-Screen and Local Co-op  
28. Sleep, Time Advancement and Multiplayer Presence  
29. Knowledge, Privacy and Information Visibility  
30. Biological View-Model Architecture  
31. Contextual HUD and Alert Priority  
32. Health/Status Inspection and Treatment Views  
33. Explainability, Trends and Cause Tracing  
34. Notification Throttling and Attention Management  
35. Accessibility Architecture  
36. Presentation Accessibility and Sensory Alternatives  
37. Mechanical Survival Assists and Shared-World Policy  
38. Controller, Screen Reader, Localisation and Input Requirements  
39. Performance, Scaling and Profiling Requirements  
40. Debugging, Diagnostics and Developer Tooling  
41. Cross-System Integration Contracts  
42. Validation and Acceptance Criteria  
43. Cross-Set Interface Amendments  
44. Open Decisions and Handoff to 29J  
Appendix A. Biological LOD Reference Matrix  
Appendix B. Biological Persistence Classification Matrix  
Appendix C. Replication and Alert Priority Matrix  
Appendix D. Runtime Record Templates  
Appendix E. Worked Runtime Scenarios  
Appendix F. Validation Scenario Catalogue  
Appendix G. Terminology Register  
Appendix H. Cross-Set Amendment Register

# 1. Locked 29I System Identity

29I is the runtime continuity layer for Set 29. Its purpose is not to make biology more complicated. Its purpose is to make sure the same biology remains **true, affordable, persistent and understandable** when the game scales from one actor to a civilisation.

The central design requirement is conservation of consequence:

- a fracture does not heal because the NPC unloaded;
- a meal is not consumed twice because a network request retried;
- a poisoned player does not cure themselves by disconnecting;
- a treatment reservation does not vanish because of a save/reload boundary;
- a distant settlement cannot feed everyone if the provision system did not supply enough compatible food;
- a severe named disease case is not replaced by an anonymous average when it becomes quest relevant;
- a local single-player character does not freeze to death because the computer was switched off;
- a client cannot forge immunity or Stamina by editing local state;
- UI does not reveal a disease identity the character has not discovered;
- accessibility may simplify or soften survival without corrupting the save architecture.

## 1.1 LOD Changes Representation, Not Rules

All biological LODs call the same specialist owners conceptually. A distant cohort may use an aggregated nourishment allocation rather than 300 individual meal transactions, but the aggregate must be derived from actual provision capacity, population demand and the same 29C state bands. A regional disease summary may process exposure pressure in a batch, but it may not use unrelated infection rules.

## 1.2 Persistence Is Selective, Not Lossy

Not every transient number belongs in a save. The rule is:

> Save what is needed to preserve future consequence, identity, transactions and safe reconstruction.

Presentation interpolation, breathing animation intensity, UI easing and temporary debug traces are not persistent biological truth.

## 1.3 Multiplayer Is Authoritative, Not Sluggish

Authority does not require every visible response to wait for a round trip. Stamina bar motion, interaction progress and warning transitions may predict where safe. Persistent state remains authoritative, with clear reconciliation rules.

# 2. Approved Decision Summary

| Area | Locked Decision |
| --- | --- |
| LOD Count | Five biological LODs: L0 Active, L1 Local Reduced, L2 Settlement/Chunk Summary, L3 Regional Abstract, L4 Dormant/Scheduled. |
| Frame Dependency | No biological outcome depends on render FPS. Time accumulation uses authoritative simulation time or committed events. |
| Active Scheduling | Action-driven Stamina/Health events remain event/command based; slower channels use scheduled updates rather than frame ticks. |
| Distant Scheduling | Distant actors/populations advance through deterministic batches and milestones; no per-frame invisible simulation. |
| Named Actor | Severe/critical, quest/story, companion, player and explicitly protected actors remain individually traceable. |
| Cohorts | Routine unnamed populations may aggregate by settlement/region, compatible biological profile grouping and relevant health state. |
| Catch-Up | Catch-up is processed in bounded simulation-time slices, preserving order and deterministic outcomes; workload may spread over frames without skipping elapsed authoritative world time. |
| Local Offline | Application-closed wall time does not advance player Hunger, disease, bleed-out, Fatigue, exposure or treatment by default. |
| Running Server | A dedicated/authoritative world may continue biological simulation because world time continues. Offline-player presence policy is explicit and server-owned. |
| Player Disconnect | Disconnect alone is neither a cure nor a punishment. The world policy decides whether the actor remains physically present, is safely suspended or transitions to an externally owned protected state. |
| Save Model | Atomic world save plus biological runtime records and one-time transaction safety state. Definitions remain external immutable references. |
| Save Mid-Procedure | Active treatment/action either resumes deterministically, rolls back to a safe pre-commit point or resolves at a documented checkpoint; never double-consumes. |
| Migration | Definition/profile changes use qualified IDs, aliases, versions and explicit migration. Removed state without migration is a validation blocker when persistent consequence exists. |
| Server Authority | Health, Stamina, Fatigue, Hunger/Hydration/Nutrition, Temperature/Wetness/Sleep, injuries, disease, poison, treatment and profile overlays are authoritative. |
| Safe Prediction | Selected Stamina spending, UI progress, local comfort trend and non-authoritative presentation may predict. Healing, curing, poison/disease application, item consumption and profile changes do not. |
| Replication | Priority-based: critical state and transaction results first; routine slow-changing data later/on demand. |
| Split-Screen | Local players have independent biological state/view models/accessibility; one authoritative world resolves shared resources/services. |
| Biological UI | Contextual HUD + inspectable status view. Permanent bars are not required for every need. |
| Alert Priority | Hidden, Ambient, Relevant, Urgent, Critical. Critical alerts are persistent until acknowledged/resolved where appropriate. |
| Knowledge | Simulation truth and player-visible knowledge are separate. UI uses known/uncertain/hidden reason data. |
| Presentation Accessibility | Always per-player: reduced motion, flashes, audio intensity, haptics, text size, warning channels, screen-reader labels and input options. |
| Mechanical Accessibility | Uses authoritative assist modifiers. Single-player permits per-player configuration; multiplayer obeys explicit world/server assist policy. |
| Save Compatibility | Difficulty/accessibility changes do not create separate incompatible save schemas. |
| Performance | Exact hardware budgets are measured by Set 25E/implementation. 29I locks scalable workload classes, profiling counters and no-unbounded-catch-up requirements. |

# 3. Ownership and Non-Ownership Boundary

## 3.1 29I Owns

- biological simulation scheduling policy;
- biological LOD representation classes;
- promotion/demotion requirements;
- deterministic biological catch-up policy;
- population cohort biological summary architecture;
- biological persistence classification;
- biological save-record requirements;
- biological transaction-idempotency requirements;
- biological multiplayer authority and replication contract;
- safe biological client-prediction boundaries;
- biological view-model data contract;
- biological alert priority model;
- biological accessibility requirements and assist application contract;
- biological debug/profiling requirements;
- final runtime handoff requirements to 29J.

## 3.2 29I Does Not Own

- economy, prices, wages, insurance or market consequences - Set 27;
- dialogue, relationships, companion personalities, consent or social care behaviour - Set 28;
- walking, sprinting, climbing, swimming locomotion, mount handling or vehicle physics - Set 30/Set 26 as applicable;
- combat attacks, damage packets, death/respawn or armour defence - Document 16/02 boundaries;
- food item composition, cooking or medicine item definitions - Items/Recipes;
- climate/weather generation, ambient world temperature or storms - world/environment owners;
- healthcare building capacity or staffing rules - settlement/building owners;
- healing spell definitions or mana costs - Magic;
- disease/injury/treatment formulas - 29E/29F/29G;
- final UI layout, art, widgets or menu navigation - Document 17;
- network transport implementation or save-file container format - rewritten Document 18;
- canonical final schemas/qualified IDs - 29J with Set 25.

## 3.3 Consume, Do Not Copy

If Set 30 exposes `CurrentMovementMode()` and a committed sprint action, 29I schedules the Set 29 response. It does not recreate sprint logic. If Set 28 marks a companion as high social/mission relevance, 29I may protect that actor from cohort aggregation; it does not decide loyalty. If Set 27 asks for `PopulationHealthSummary()`, 29I supplies a bounded summary; it does not calculate wages or price medicine.

# 4. Runtime Biological Simulation Architecture

The runtime architecture separates immutable definitions, mutable biological instances, external capability snapshots, scheduler state and presentation.

| Layer | Role | Example |
| --- | --- | --- |
| Definition | Immutable authored rule/content. | Disease definition, injury definition, biological profile. |
| Persistent Actor State | Mutable biological truth belonging to an actor. | Health 63, Fatigue Moderate, fractured left leg. |
| Condition Instance | Persistent or semi-persistent specialist record. | Disease instance, toxin instance, injury instance. |
| Capability/Exposure Snapshot | External system input with source/revision. | Insulated clothing, shelter, movement mode, contaminated water event. |
| Scheduler State | Next required update/milestone and LOD. | Next disease milestone, next cohort nourishment window. |
| Transaction State | One-time command/event safety. | Meal transaction committed, antidote treatment applied. |
| Cohort Summary | Aggregate representation for routine populations. | 18 at-risk residents, 4 moderate respiratory cases. |
| View Model | Knowledge/accessibility-filtered UI data. | “Cold worsening - soaked clothing + wind.” |

No UI widget, scene node or animation owns persistent biological truth.

# 5. Authoritative Simulation Time

## 5.1 Time Domains

29I distinguishes three time concepts:

1. **Simulation Time** - authoritative world time used for biological progression.
2. **Frame Time** - render/input timing used for interpolation and responsiveness only.
3. **Wall Time** - real-world clock time while the application may or may not be running.

Biological progression uses Simulation Time unless a specialist owner explicitly defines an event transaction instead.

## 5.2 Monotonic Biological Time

Every persistent biological record that needs elapsed-time progression references a monotonic world-simulation timestamp or scheduled milestone. Clock/calendar presentation may change or be localised without changing elapsed biological time.

## 5.3 Time Acceleration

Sleeping, admin controls or world rules may accelerate world time. Set 29 integrates the larger Simulation Time delta deterministically. 29I does not decide whether time may be accelerated; it defines how biology safely processes the resulting elapsed time.

## 5.4 No Frame-Rate Advantage

A player at 30 FPS and a player at 144 FPS experience the same:

- Hunger progression;
- Health recovery;
- thermal change;
- disease progression;
- toxin elimination;
- treatment duration;
- Fatigue accumulation for the same authoritative actions/time.

# 6. Scheduler, Work Queues and Event Processing

## 6.1 Event-Driven First

Use events/commands for discrete actions:

- damage accepted;
- Stamina cost committed;
- food consumed;
- water consumed;
- exposure applied;
- venom injected;
- injury created/worsened;
- treatment started/interrupted/completed;
- profile overlay added/removed;
- sleep started/ended;
- equipment/shelter capability snapshot changed.

Do not poll every actor every frame to discover these events.

## 6.2 Scheduled Progression

Use scheduler entries for time-dependent progression:

- Hunger/Hydration accumulation;
- Nutrition rolling-window evaluation;
- natural Health recovery eligibility/progress;
- Fatigue accumulation/recovery;
- Temperature/Wetness integration;
- Sleep Pressure;
- injury recovery milestones;
- disease incubation/stage milestones;
- toxin elimination/onset milestones;
- treatment/rehabilitation checkpoints;
- cohort meal/care/outbreak resolution.

## 6.3 Work Queue Classes

| Queue | Urgency | Examples |
| --- | --- | --- |
| Immediate | Same authoritative simulation step. | Damage, critical bleed transition, item consumption commit, treatment result. |
| High | Next fixed/scheduled step. | Stamina correction, critical toxin warning, sleep interruption. |
| Normal | Periodic biological update. | Hunger, thermal integration, Fatigue progression. |
| Batch | Settlement/region window. | Population meals, routine recovery, disease transmission summary. |
| Milestone | At explicit time/event only. | Incubation ends, treatment follow-up due, L4 wake. |

## 6.4 Budgeted Processing

If a large catch-up or region activation produces more work than one frame budget allows, work is spread over frames while the authoritative target Simulation Time remains fixed. Processing order must be deterministic and players must not interact with partially promoted biological state as though it were final.

# 7. Biological LOD Model

| LOD | Representation | Typical Scope | Biological Rule |
| --- | --- | --- | --- |
| L0 - Active | Full individual state and action-level transactions. | Players, direct combat/treatment targets, immediately relevant companions/NPCs. | Highest fidelity; event-driven + scheduled slow channels. |
| L1 - Local Reduced | Full individual persistent state, reduced update frequency and presentation. | Nearby actors not directly engaged. | Same outcomes over elapsed time; fewer checks/animations. |
| L2 - Settlement/Chunk Summary | Named protected actors + routine cohorts. | Loaded/unloaded local settlement or chunk populations. | Batch meals, routine care, disease pressure, work-health effects. |
| L3 - Regional Abstract | Cohort pressure/demand + exceptional named cases. | Distant settlements, caravans, regional populations. | Milestone/batch progression, bounded summaries, no action-level Stamina. |
| L4 - Dormant/Scheduled | Persistent records + next meaningful wake events. | Very distant/inactive content. | No continuous ticking; wake on milestone, event, dependency or promotion. |

## 7.1 LOD Is Per Biological Relevance, Not Only Distance

An actor can remain L0/L1 biologically because they are undergoing active surgery or a critical poison sequence even if ordinary rendering relevance would have dropped. Likewise, a visually nearby peaceful crowd does not need L0 biological updates for every person.

## 7.2 Cross-System LOD Alignment

29I consumes world/NPC/settlement/movement streaming state. It may request biological protection for a named case, but it does not control actor rendering or AI LOD.

# 8. L0 - Active Simulation

L0 is used when immediate interaction can change biological outcome.

Typical L0 actors:

- every local player;
- current combat target when injury/poison matters;
- actor currently receiving treatment;
- companion directly following/engaged;
- actor in a critical biological state near the player;
- selected inspection target when exact live trend is necessary.

## 8.1 L0 Scheduling

- Stamina spends and Health changes are event/transaction driven.
- Derived Exertion may update at a modest gameplay cadence and interpolate visually.
- Hunger/Hydration, Fatigue and recovery do not need render-frame ticks.
- Temperature/Wetness integrate on scheduled intervals or environment-change events.
- Disease/toxin use milestones and periodic progression rather than frame updates.

## 8.2 L0 Presentation

L0 may expose richer live trend data to view models, including increasing/decreasing state, active causes and time-to-next known milestone where the player has sufficient knowledge.

# 9. L1 - Local Reduced Simulation

L1 retains full individual condition truth but reduces processing frequency.

Examples:

- villagers working nearby but not interacted with;
- guards on routine patrol;
- animals/NPCs in the same local simulation area;
- companions temporarily separated but still nearby.

L1 may:

- batch ordinary exertion from activity summaries;
- update thermal state less often while environment remains stable;
- resolve routine nourishment at schedule windows;
- advance recovery by elapsed-time deltas;
- omit biological presentation animation until promoted.

L1 may **not**:

- clear injuries;
- remove disease instances;
- reset Hunger;
- invent medicine;
- reroll established infection;
- restore Stamina in a way that contradicts an active external action.

# 10. L2 - Settlement/Chunk Summary Simulation

L2 is the bridge between named-individual continuity and civilisation scale.

## 10.1 Representation

Maintain individually:

- players if present/suspended under policy;
- companions;
- story/quest actors;
- severe/critical injury/disease/poison cases;
- actors with active specialist treatment plans;
- actors explicitly referenced by persistent world events.

Aggregate routine residents into cohorts.

## 10.2 L2 Batch Windows

Batch windows may resolve:

- meal allocation and nourishment risk;
- hydration need where enabled;
- routine sleep/rest access;
- minor recovery;
- clinic throughput;
- disease exposure/transmission pressure;
- medicine demand;
- workforce-capacity effects.

The exact interval is adaptive and data-driven. Stable settlements may use larger windows; outbreaks or shortages shorten the next scheduled resolution.

## 10.3 Physical Resource Conservation

A settlement cohort does not eat “abstract food points” if the provision system tracks physical stock. The settlement owner supplies available compatible provisions; 29C resolves biological coverage. Treatment throughput similarly consumes actual medicine/service capacity through owning systems.

# 11. L3 - Regional Abstract Simulation

L3 represents distant populations while preserving meaningful pressure and exceptional cases.

Typical outputs:

- population Health burden;
- food/medical demand;
- disease pressure/case bands;
- injury downtime;
- treatment backlog;
- average/at-risk Fatigue/nourishment bands;
- work-capacity modifier;
- next scheduled biological milestone;
- named exceptional cases retained separately.

L3 does not simulate:

- per-step Stamina;
- individual meal animation/events for routine residents;
- individual mild pain presentation;
- exact Wetness for every citizen unless it has future consequence;
- per-frame toxin ticks.

# 12. L4 - Dormant and Scheduled Simulation

L4 stores only what must remain true and what must wake later.

An L4 record may include:

- persistent injury/disease/toxin/treatment/profile references;
- condition stage/severity;
- last authoritative simulation time;
- next scheduled milestone;
- critical/quest protection flags;
- cohort composition/pressure summary;
- pending cross-system dependency references;
- migration/schema version.

No continuous biological loop runs for dormant content.

## 12.1 L4 Wake Conditions

Wake may be triggered by:

- player/settlement proximity;
- quest/event reference;
- scheduled disease/treatment milestone;
- settlement shortage/outbreak threshold;
- movement/travel arrival;
- companion assignment result;
- economy/social/world system requesting an authoritative summary;
- migration or validation operation.

# 13. Promotion, Demotion and Reconciliation

## 13.1 Demotion Requirements

Before individual detail is removed or reduced, commit:

- current persistent specialist states;
- relevant state bands/values;
- active reservations/transactions;
- current treatment plan/progress;
- profile/overlay revision;
- last update time;
- next scheduled milestones;
- reason/source references needed for later explainability;
- protection/named-actor status.

## 13.2 Promotion Requirements

Promotion reconstructs presentation and higher-frequency scheduling from committed truth. It may not:

- heal/harm merely because of promotion;
- reroll disease establishment;
- choose a different injury type;
- duplicate an already committed meal/treatment;
- discard a provider/resource reservation;
- change biological profile because a newer definition exists without migration.

## 13.3 Reconciliation Barrier

An actor/population being promoted from a large elapsed-time gap enters a brief internal `reconciling` state. External gameplay may receive the last stable summary until catch-up completes. This prevents a player from interacting with half-applied recovery/disease updates.

# 14. Population Cohorts and Aggregation

## 14.1 Cohort Key

Routine populations may be grouped by only the dimensions that materially change biological outcome, such as:

- settlement/region;
- effective biological-profile compatibility group;
- broad occupation/activity intensity where Fatigue/work capacity matters;
- nourishment compatibility/demand class;
- disease family/stage when active;
- treatment-need severity;
- special environmental-exposure class.

Do not create one cohort per trivial variation.

## 14.2 Cohort Summary Fields

Recommended summary:

- population count;
- profile composition;
- healthy/stable/at-risk counts;
- Hunger/Nutrition coverage;
- Hydration risk if enabled;
- Fatigue burden;
- injury severity counts;
- disease cases/pressure by relevant family;
- poison/toxin cases when meaningful;
- treatment demand/backlog;
- recovery-bed demand;
- workforce capacity;
- next resolution time;
- evidence/source revision.

## 14.3 Aggregation Does Not Erase Scarcity

If only 60 compatible meals exist for 100 residents, cohort processing must preserve the shortfall. If a clinic can treat 8 severe cases per window and has 13, five remain in backlog. Aggregation is computational compression, not resource creation.

# 15. Named-Actor Protection and Priority

## 15.1 Protected Individual Classes

The following remain individually traceable by default:

- player characters;
- companions/followers;
- named NPCs with active relationship or assignment relevance;
- quest/story-critical actors;
- leaders or unique specialists when their individual condition matters;
- Severe/Critical injury/disease/toxin cases;
- actors with active specialist procedures;
- actors directly referenced by a persistent event, crime, legal or historical record;
- any actor explicitly marked `biological_individual_priority` by an authorised owner.

## 15.2 Priority Is Not Invulnerability

Protection from aggregation does not protect the actor from biological consequences. It only preserves individual state and traceability.

## 15.3 Priority Expiry

External owners may remove a temporary priority when the reason ends. Set 29 can keep priority longer when biological state itself still requires individual tracking.

# 16. Deterministic Catch-Up and Large Time Steps

## 16.1 Catch-Up Principle

When a simulation region advances by a large amount of authoritative Simulation Time, 29I processes elapsed time in bounded slices/milestones so ordering remains stable.

Example:

1. 18 simulation hours elapsed.
2. A disease incubation milestone occurs at +3h.
3. A clinic opens its treatment window at +6h.
4. A meal allocation resolves at +8h.
5. The disease reaches a new stage at +15h.
6. Catch-up processes these milestones in chronological order rather than applying one giant 18-hour approximation that changes causality.

## 16.2 Catch-Up Slicing

A single processing slice should not span across a known scheduled milestone. Large quiet intervals may be integrated analytically by specialist systems.

Implementation may spread slices across multiple frames/tasks. Deterministic ordering keys must include stable actor/cohort identity plus event/milestone identity rather than relying on non-deterministic scene-tree iteration order.

## 16.3 Safety Caps

Safety caps constrain **work per frame**, not elapsed world truth. If catch-up cannot finish immediately, the region remains reconciling rather than silently discarding later elapsed time.

# 17. Offline, Closed-Application and Server-Running Rules

## 17.1 Local Single-Player Closed Application

Default behaviour:

- no Hunger/Hydration depletion from real-world elapsed time;
- no Fatigue gain;
- no temperature/wetness deterioration;
- no bleed-out;
- no disease/toxin lethal progression;
- no risky treatment completion;
- no Sleep Pressure increase;
- no natural recovery merely because the player waited outside the game.

The save resumes from authoritative Simulation Time.

## 17.2 Authoritative Server Still Running

A dedicated or persistent server may continue world Simulation Time. Biological simulation therefore legitimately continues for actors that server policy keeps active/in-world.

This is **not** wall-clock catch-up: the authoritative simulation actually ran.

## 17.3 Offline-Player Presence Policies

Recommended world/server options:

- `safe_suspend` - disconnected player actor is removed from ordinary biological exposure and resumes from saved state;
- `persistent_body` - actor remains in world and receives normal biological/world consequences;
- `protected_rest` - actor transitions to an externally owned safe/rest state if valid conditions exist;
- `server_custom` - explicit mod/server rule with validated disclosure.

29I defines how biological state obeys the selected policy. It does not define PvP body ownership, beds or social protection.

## 17.4 Disclosure

A server must disclose its offline-player biological policy before join/character creation. A player should not learn after disconnecting that the server silently left them exposed to starvation or poison.

# 18. Player Presence, Disconnect and Reconnect

## 18.1 Disconnect Is Not Treatment

Disconnecting cannot:

- clear poison;
- stop a committed bleed through reset;
- refund consumed medicine;
- remove an injury;
- restore Health/Stamina unless policy explicitly and safely does so;
- cancel an adverse exposure already authoritatively applied.

## 18.2 Reconnect Snapshot

On reconnect, the client receives:

- authoritative biological snapshot revision;
- current critical alerts;
- active conditions known to the player;
- profile/overlay revision;
- pending treatment/interaction state relevant to them;
- recent reconciliation results needed to explain what changed while absent.

## 18.3 Reconnect Explainability

If the server continued simulation, the player receives a concise summary such as:

> While you were away: rested 4h in the inn; Fever progressed to Moderate; clinic treatment consumed 1 prescribed dose.

Only actions that actually occurred under authoritative systems are reported.

# 19. Persistence Architecture and Save Classes

Every biological field belongs to one persistence class.

| Class | Meaning | Examples |
| --- | --- | --- |
| P0 - Always Persistent | Losing it would change identity/consequence. | Injury instances, disease instances, profile ID, critical treatment state. |
| P1 - Conditional Persistent | Save when active/non-default/important. | Wetness outside trivial range, current Stamina in danger, active sleep session. |
| P2 - Reconstructable | Recompute from authoritative sources on load. | Effective protection cache, derived Stamina modifier. |
| P3 - Transient | Never required in save. | HUD fade timer, breathing audio intensity, interpolation progress. |

## 19.1 Persistent Definition References

Store qualified IDs and compatible versions/aliases, not copied display names or scene paths.

## 19.2 Bounded Histories

Treatment/exposure histories are bounded and summarised when old detail no longer affects gameplay. Quest/legal/world-history owners may retain their own permanent references externally.

# 20. Biological Save Records and Checkpoints

## 20.1 Actor Biological Record

Potential fields:

- actor runtime ID;
- biological profile definition ID/version;
- persistent overlay IDs/versions;
- current Health and relevant Stamina state;
- Hunger/Hydration/Nutrition state;
- Fatigue/Sleep Pressure;
- Temperature/Wetness when consequential;
- injury instance references;
- disease/toxin instance references;
- treatment plan/procedure state;
- resistance/immunity memories owned by specialist systems;
- last biological simulation time;
- next scheduled milestones;
- biological snapshot revision;
- schema version.

## 20.2 Cohort Record

Potential fields:

- cohort ID;
- settlement/region owner;
- profile composition;
- count;
- biological burden summaries;
- provision/care resolution references;
- next scheduled batch time;
- protected actor exclusions;
- source revision/hash;
- schema version.

## 20.3 Save Checkpoint

A biological checkpoint represents one coherent revision across actor/cohort state and committed biological transactions. It must not combine pre-treatment inventory with post-treatment biological outcome or vice versa.

# 21. Atomic Save, Recovery and Transaction Journal

## 21.1 Atomicity

Biological state participates in the world save's atomic/recovery contract. A crash during save cannot leave:

- medicine consumed but treatment not applied with no recovery record;
- treatment applied twice;
- meal removed twice;
- poison exposure absent after the source action committed;
- profile overlay applied without its source reference.

## 21.2 One-Time Journal

A bounded recent transaction journal stores enough identity to reject duplicate replay after reconnect/recovery.

Suggested entries:

- transaction/event ID;
- type;
- actor/source/target IDs;
- authoritative simulation timestamp;
- status: reserved/committed/rolled_back;
- resulting biological snapshot revision;
- related inventory/service/mana transaction reference;
- expiry/compaction rule.

## 21.3 Checkpointed Procedures

Long procedures define safe checkpoints. Saving mid-procedure either resumes from the checkpoint or rolls back a not-yet-committed stage. This is a design contract from 29G, not a random save-time decision.

# 22. Versioning, Migration and Definition Changes

## 22.1 Migration Triggers

Migration is required when a persistent interpretation changes, including:

- field renamed/removed;
- biological profile applicability changed;
- injury/disease/toxin definition replaced;
- severity bands materially changed;
- persistent overlay definition removed;
- treatment plan schema changed;
- cohort-key rules changed such that old summaries cannot be interpreted safely.

## 22.2 No Silent Reinterpretation

If `disease.marsh_fever` changes incubation rules in a new version, existing disease instances do not silently restart incubation. The owning migration defines whether instances preserve old stage/timestamps, convert to new state or use a compatibility snapshot.

## 22.3 Profile Applicability Changes

If a profile changes from `uses_hydration=true` to `false`, migration must explicitly resolve existing Hydration state and any active dehydration consequences. 29I performs the migration/revalidation flow; 29H/29J own the biological/profile semantics.

## 22.4 Migration Failure

Persistent-state migration failure is not fixed by deleting the condition. The world is quarantined/recovered according to Set 25/technical policy when a safe mapping cannot be produced.

# 23. Multiplayer Authority Model

## 23.1 Server/Host Owns Biological Truth

Authoritative state includes:

- Health/Stamina/Fatigue;
- Hunger/Hydration/Nutrition;
- Temperature/Wetness/Sleep Pressure;
- injury/wound/bleed state;
- disease/infection/toxin state;
- treatment/procedure outcomes;
- biological profile and overlays;
- biological protection snapshot revisions accepted from authoritative external systems;
- cohort summaries;
- one-time transaction state.

## 23.2 Client Commands

Clients request actions such as:

- consume item;
- start treatment;
- stop treatment;
- sleep/rest interaction;
- perform a movement/combat action that has a biological cost;
- inspect known status.

The server validates ownership, prerequisites, base cost, target state and authoritative external capability before committing.

## 23.3 Never Client-Owned

A client may not submit “my Health is 100”, “poison removed”, “I ate the food” or “this profile grants immunity” as authoritative state.

# 24. Client Prediction and Reconciliation

## 24.1 Allowed Prediction

Prediction is permitted where it improves feel and rollback is safe:

- Stamina bar spending for a locally predicted valid movement/combat action;
- treatment/sleep progress bar animation after server start acknowledgement;
- immediate comfort/thermal trend presentation;
- UI acknowledgement of a consumption request before final commit;
- breathing/animation intensity.

## 24.2 Restricted Prediction

Do not authoritatively predict:

- Health restoration/loss from uncertain source outcome;
- infection establishment;
- toxin removal;
- injury creation/severity;
- item consumption commit;
- disease cure;
- treatment success;
- permanent profile/overlay changes.

## 24.3 Reconciliation

Corrections should snap gameplay truth immediately but may smooth non-critical presentation. Critical biological alerts never wait for cosmetic smoothing.

# 25. Replication Priorities and Snapshot Design

## 25.1 Priority Classes

| Priority | Examples | Delivery Behaviour |
| --- | --- | --- |
| R0 Critical | Critical Health, Heavy/Critical bleeding, Critical toxin, treatment commit/failure, profile applicability change. | Immediate/reliable authoritative update. |
| R1 High | Health change, Stamina correction, new Severe injury, sleep interruption, disease severity threshold. | Prompt reliable or sequence-safe update. |
| R2 Normal | Hunger/Fatigue/Temperature band transitions, known treatment-plan changes. | Batched/delta replication acceptable. |
| R3 Low/On-Demand | Nutrition history detail, distant cohort breakdown, diagnostic source traces. | Replicate when relevant/inspected. |

## 25.2 Snapshot Revision

Every replicated biological snapshot carries a monotonically advancing revision per actor/cohort. Deltas referencing an older incompatible revision are rejected or trigger full snapshot refresh.

## 25.3 Interest Filtering

A client receives full self state needed for play, but other actors' hidden disease/diagnostic data is filtered by knowledge/visibility policy. Distant population summaries replicate only to relevant UI/management contexts.

# 26. Idempotency, Audit and Cross-System Transactions

## 26.1 Transaction Envelope

One-time cross-system effects use a shared envelope concept:

- unique transaction ID;
- initiator/source;
- target;
- action/effect type;
- source definition/instance;
- authoritative time;
- prerequisite snapshot revision;
- external reservation refs;
- commit result;
- biological output revision.

## 26.2 Cross-System Atomic Examples

**Eating from a chest**  
Inventory reserves/removes serving -> 29C commits nourishment -> transaction commits once.

**Antidote treatment**  
Medicine item reserved -> provider/capability validated -> 29G procedure commits -> 29F toxin response applied -> item consumed once.

**Sprint action**  
Set 30 validates movement action -> biological Stamina cost request -> 29B commits Stamina -> movement authority accepts/corrects action.

**Healing spell**  
Magic validates mana/effect -> 29G treatment/effect request -> 29B/29E/29F validate biological destinations -> mana and biological outputs commit under linked transaction identity.

## 26.3 Audit Scope

Production/debug audit should identify who/what caused a state change without exposing hidden narrative knowledge to ordinary UI.

# 27. Split-Screen and Local Co-op

Each local player receives:

- independent biological view model;
- independent HUD/context alerts;
- independent accessibility/presentation settings;
- independent input/focus;
- independent detailed-status inspection.

Shared world resources remain authoritative. If both players try to take the final medicine, only one transaction commits.

Critical alerts should identify which local player they belong to without requiring colour alone.

# 28. Sleep, Time Advancement and Multiplayer Presence

29D owns biological Sleep Pressure and restorative sleep. World/host systems own whether time advances.

## 28.1 Sleep State

29I persists/replicates:

- sleep request accepted/blocked;
- start time;
- rest location/capability reference;
- interruption reason;
- accumulated restorative sleep;
- wake result.

## 28.2 Multiplayer Time Advancement

Possible world policies may include:

- time advances only when all required active players sleep;
- partial sleep provides biological rest without world-time skip;
- vote/host-controlled time skip;
- no time skip on persistent servers.

29I does not choose the global rule. It ensures 29D biological sleep remains valid under whichever policy the world owner exposes.

## 28.3 Disconnect During Sleep

Disconnect follows offline-player policy. It cannot create infinite free sleep or silently strand an active treatment/sleep transaction.

# 29. Knowledge, Privacy and Information Visibility

## 29.1 Truth Versus Knowledge

Biological truth may include a disease ID, exact toxin family and hidden cause. The player-facing view model may only know:

- symptoms;
- suspected category;
- diagnosed identity;
- confidence;
- known source/counter.

29F/knowledge systems remain owners of diagnosis semantics.

## 29.2 Other Actors

UI should expose only information justified by gameplay context:

- visible injury/bleeding;
- voluntarily shared player status where multiplayer UI supports it;
- healer/companion information unlocked through authorised care context;
- settlement aggregate health without revealing every resident's private/hidden diagnosis by default.

## 29.3 Debug/Admin Separation

Developer/admin diagnostics may show exact truth but are visibly distinct from normal gameplay and permission-gated.

# 30. Biological View-Model Architecture

Document 17 owns widgets. 29I requires a stable biological view-model layer.

## 30.1 Core View Models

- `BiologicalHudSummary`
- `BiologicalStatusDetail`
- `BiologicalAlert`
- `ConditionSummary`
- `TreatmentOpportunitySummary`
- `RecoverySummary`
- `BiologicalCauseTrace`
- `PopulationHealthSummaryView`
- `BiologicalProfileSummaryView`

## 30.2 View-Model Principles

- derived from authoritative state;
- knowledge-filtered;
- localisation-keyed;
- accessibility metadata included;
- reason/source IDs included where useful;
- no gameplay mutation methods in the view model;
- stable semantic bands even when exact numbers are hidden.

# 31. Contextual HUD and Alert Priority

## 31.1 Biological Visibility Levels

| Level | Meaning | Example |
| --- | --- | --- |
| Hidden | Healthy/irrelevant and no user request. | Full Hunger indicator while comfortably fed. |
| Ambient | Useful but non-urgent. | Mild Fatigue icon after long travel. |
| Relevant | State is affecting choices. | Hungry, wet in cold weather, Moderate pain. |
| Urgent | Prompt action recommended. | Heavy bleeding, Severe dehydration, dangerous heat. |
| Critical | Immediate risk. | Critical Health/bleeding/toxin/thermal state. |

## 31.2 Priority Composition

When several states are active, UI receives a prioritised list rather than every system demanding permanent HUD space. Critical beats Urgent; Urgent beats Relevant.

Related causes may group:

> **Recovery impaired** - infection + poor nutrition + inadequate rest.

## 31.3 Thirst Disabled

When Hydration gameplay is disabled, the ordinary thirst HUD/view model is absent rather than permanently showing a meaningless full meter.

# 32. Health/Status Inspection and Treatment Views

The detailed biological screen should answer:

- What is wrong?
- How serious is it?
- Is it improving or worsening?
- What is causing or blocking recovery?
- What can I do now?
- What treatment/capability is required?
- What is uncertain or not yet diagnosed?

Suggested groups:

- Immediate Condition;
- Needs and Recovery;
- Injuries;
- Illness/Poison;
- Active Treatment;
- Protection/Adaptation;
- Recent meaningful biological history.

The screen is not a raw debug spreadsheet by default.

# 33. Explainability, Trends and Cause Tracing

## 33.1 Cause Trace

Every major modifier should be traceable to source categories such as:

- biological profile;
- equipment;
- environment;
- movement/activity;
- injury/disease/toxin;
- food/nutrition;
- shelter/rest;
- medicine/treatment;
- magic/ward;
- difficulty/accessibility assist.

## 33.2 Plain-Language Output

Examples:

- “Stamina recovery reduced: Severe Fatigue + fractured leg.”
- “Cold worsening: soaked clothing + strong wind; shelter nearby would help.”
- “Natural healing paused: untreated infection.”
- “Hunger stable: hearty meal recently eaten.”
- “Fever source uncertain; clinic assessment may identify the illness.”
- “Treatment progress paused: clean water service unavailable.”

## 33.3 Trend

Expose semantic trend: improving, stable, worsening, rapidly worsening. Exact numeric derivative is optional/debug-only.

# 34. Notification Throttling and Attention Management

Biological UI must not spam the player every update.

## 34.1 Deduplication

Repeat warnings of the same condition are suppressed until:

- severity band changes;
- trend materially worsens;
- a counter becomes available/unavailable;
- the player acknowledged and sufficient time passed;
- the state resolved and later returned.

## 34.2 Grouping

Related low-level events may become one summary:

> “You are becoming exhausted: long sprint + heavy carried object + poor sleep.”

## 34.3 Critical Persistence

Critical warnings remain discoverable and cannot be lost in a transient toast queue.

# 35. Accessibility Architecture

Accessibility is separated into two classes.

## A. Presentation Accessibility

Changes how information/input is delivered without changing simulation truth.

## B. Mechanical Survival Assistance

Changes authorised biological severity/timing/cost. It uses the same simulation and must be represented in authoritative policy.

Neither class creates a parallel biological system.

## 35.1 Accessibility Metadata

Biological alerts/view models provide:

- severity independent of colour;
- icon semantic ID;
- text label/localisation key;
- caption/audio cue key;
- haptic category/intensity suggestion;
- reduced-motion alternative;
- urgency/acknowledgement behaviour;
- screen-reader ordering/description;
- optional exact-value field.

# 36. Presentation Accessibility and Sensory Alternatives

Players may independently configure:

- reduced/disabled camera shake;
- reduced/disabled blur;
- reduced/disabled pulse/heartbeat overlay;
- reduced flashing;
- reduced breathing/panting audio intensity;
- haptic reduction/disable;
- stronger text warnings;
- stronger icon warnings;
- captions for biological audio cues;
- larger/scalable status text;
- high-contrast/non-colour severity presentation;
- simplified status summaries;
- advanced exact numbers;
- notification frequency;
- reduced-motion treatment animations.

A Severe condition remains Severe even if every cinematic symptom effect is disabled.

# 37. Mechanical Survival Assists and Shared-World Policy

## 37.1 Assist Examples

Possible authoritative assists:

- slower Hunger/Hydration depletion;
- wider thermal safe band;
- slower disease progression;
- lower toxin severity;
- reduced injury persistence;
- faster natural recovery;
- reduced Fatigue gain;
- longer treatment timing windows;
- simplified specialist-treatment requirements where existing difficulty rules permit;
- stronger warning lead time before critical thresholds.

These are bounded by 29A-29H difficulty rules.

## 37.2 Single Player

Single-player may allow per-player mechanical survival assists independently of global content/threat settings.

## 37.3 Multiplayer Policy

The server/world declares one of:

- `personal_assists_allowed` - server applies permitted actor-specific assist profile;
- `world_uniform` - all players use world biological severity while retaining personal presentation accessibility;
- `host_approval` - selected mechanical assists require host/admin approval;
- `competitive_locked` - mechanical assists that change simulation are restricted; presentation accessibility remains available.

This is disclosed before joining where possible.

## 37.4 No Shame/Reward Penalty Requirement

Accessibility assists should not automatically reduce story access, achievements or social standing. Any competitive rules belong to platform/server systems, not Set 29.

# 38. Controller, Screen Reader, Localisation and Input Requirements

## 38.1 Controller

Biological interfaces require:

- predictable focus order;
- no mandatory mouse hover;
- hold/toggle alternatives for treatment;
- no rapid mash requirement;
- clear cancel/back behaviour;
- split-screen-safe focus ownership.

## 38.2 Screen Reader

View models provide concise labels such as:

> “Injury: left leg fracture, severe, stabilised, recovery blocked until splinted.”

Do not rely on spatial placement to communicate severity.

## 38.3 Localisation

All biological names, symptoms, reason strings, alert text and accessibility labels use localisation keys. Runtime concatenation must avoid grammar assumptions that break translated languages; prefer parameterised templates.

## 38.4 Information Density

Players may select Simple, Standard or Detailed biological information density without changing simulation.

# 39. Performance, Scaling and Profiling Requirements

29I does not lock final millisecond/network budgets before profiling evidence. It locks measurable workload categories and scaling invariants.

## 39.1 Required Counters

Track at minimum:

- biological actors by LOD;
- cohort count;
- scheduler entries by channel;
- updates processed/deferred;
- catch-up backlog simulation time;
- promotion/demotion count/time;
- disease transmission batch size;
- treatment batch size;
- biological save bytes;
- biological replication bytes/events per client;
- duplicate transaction rejections;
- migration failures;
- alert/view-model update count.

## 39.2 Scaling Invariants

- No per-frame loop across the total world population.
- L4 cost trends with scheduled milestones, not world population * frame rate.
- Stable distant settlements do not wake every citizen individually.
- One outbreak may increase biological workload, but workload remains batchable and profiled.
- Catch-up cannot create a single unbounded main-thread stall.
- UI inspection of one actor does not require replicating every hidden biological field for the region.

## 39.3 Benchmark Profiles

Set 25E/implementation should benchmark at least:

- one active player with ordinary village;
- split-screen with two active biological HUDs;
- co-op group with concurrent combat/treatment;
- large healthy settlement;
- large settlement shortage;
- outbreak with clinic load;
- distant-region catch-up;
- save/load during active treatment;
- reconnect after persistent-server absence;
- mixed biological-profile city.

# 40. Debugging, Diagnostics and Developer Tooling

Required development surfaces:

- Actor Biological Inspector;
- Effective Biological Profile Inspector;
- Biological LOD visualiser;
- Scheduler queue/milestone view;
- Cohort composition/burden viewer;
- Cause-trace viewer;
- Transaction journal/audit viewer;
- treatment reservation viewer;
- replication snapshot/revision viewer;
- offline/server-presence simulator;
- save/migration fixture runner;
- accessibility alert preview;
- notification-throttle simulator;
- biological performance counters.

Developer tools may expose exact hidden truth but must be visibly marked debug/admin.

# 41. Cross-System Integration Contracts

## 41.1 Set 27 - Economy, Trade and Commerce

29I exposes bounded, versioned summaries rather than raw biological internals:

- `PopulationHealthSummary()`;
- `MedicalDemand()`;
- `FoodDemandProfile()`;
- `WorkCapacityModifier()`;
- `ExpectedInjuryDowntime()`;
- disease-workforce pressure.

Set 27 decides prices, wages, shortages and settlement wealth.

## 41.2 Set 28 - Dialogue, Social Systems and Companions

Set 28 may mark a named companion/NPC as biologically individual-priority and consume:

- `CareNeed()`;
- `TreatmentUrgency()`;
- `RecoveryStatus()`;
- known/visible condition summaries;
- companion care result.

Set 28 owns whether an NPC chooses/agrees to provide care and how relationships react.

## 41.3 Set 30 - Movement, Traversal and Transportation

Set 30 supplies authoritative movement/action context. Set 29 returns biological modifiers/cost results.

29I adds revision/timestamp discipline so prediction/reconciliation does not double-charge Stamina or apply stale Carry/Fatigue modifiers.

## 41.4 Set 26 - Maritime/Aquatic

29I persists and replicates Set 29 biological consequences while leaving breath, drowning, pressure and vessel/aquatic specialist mechanics with their existing owner. Aquatic ownership discrepancy between Set 26 and Set 30 remains an integration item, not resolved here.

## 41.5 Combat

Combat supplies authoritative damage/action outcomes. Set 29 persists resulting biological state. Death/respawn remains outside Set 29.

## 41.6 Settlement/Buildings

Settlement systems provide provision, shelter, sanitation and treatment capacity. 29I uses those authoritative summaries for cohorts; no biological LOD may invent services.

## 41.7 Quest/Event

Set 29 emits stable state-change/threshold events. Quest/Event decides whether those become quests, crises or history.

## 41.8 UI/UX

Document 17 consumes 29I view models and alert metadata. UI never writes biological truth directly.

# 42. Validation and Acceptance Criteria

29I is accepted only when the following invariants can be proven through automated and manual tests.

## 42.1 LOD Conservation

1. Demote/promote an injured named NPC; injury/severity/recovery progress is unchanged except legitimate elapsed Simulation Time.
2. Demote/promote a disease case; infection is not rerolled.
3. Cohort meal allocation consumes no more compatible food than supplied.
4. Clinic throughput cannot treat more cases than capacity/resources permit.
5. Named critical cases remain individually traceable inside a cohort settlement.

## 42.2 Time and Offline Safety

6. Change render FPS; biological outcomes over equal Simulation Time remain equivalent.
7. Close local game for 24 real hours; player does not starve, bleed out or freeze from wall time.
8. Persistent server runs 24 simulated hours; actors left in-world under policy progress legitimately.
9. Large catch-up processes scheduled milestones in chronological order.
10. Catch-up work may span frames without dropping elapsed authoritative time.

## 42.3 Persistence

11. Save/load during active treatment never duplicates medicine use.
12. Recovery from previous/backup save preserves coherent biological transaction state.
13. Removed definition without migration fails validation rather than silently deleting condition.
14. Profile applicability migration revalidates dependent biological channels safely.
15. Transient UI/interpolation state is not required for correct save recovery.

## 42.4 Multiplayer

16. Client cannot forge Health/Stamina/poison/cure/profile state.
17. Predicted Stamina reconciles cleanly on rejected movement action.
18. Duplicate consumption packet commits once.
19. Reconnect receives authoritative snapshot revision and cannot replay old treatment result.
20. Split-screen players do not share/overwrite biological HUD state.

## 42.5 UI and Knowledge

21. Disease identity remains hidden until knowledge/diagnosis permits it.
22. Critical biological warning uses at least text/icon plus another configured channel where available.
23. Disabling blur/shake/audio does not remove critical information.
24. Thirst UI is absent when Hydration gameplay is disabled.
25. Notification deduplication prevents repeated identical warning spam.

## 42.6 Accessibility

26. Screen-reader output communicates condition name/region/severity/trend without visual dependence.
27. Controller can complete first-aid/treatment navigation without mouse hover or rapid mash.
28. Per-player presentation accessibility works in split-screen.
29. Server mechanical-assist policy is disclosed and enforced authoritatively.
30. Changing information density does not change biological simulation.

## 42.7 Performance/Scale

31. Large healthy settlement does not create per-frame per-resident biological ticking.
32. Outbreak increases workload in bounded batches with visible profiler counters.
33. L4 dormant world cost is driven by milestones/events rather than continuous ticks.
34. Promotion burst is budgetable/deferred without exposing partial state.
35. Biological replication supports interest filtering and on-demand detail.

## 42.8 Acceptance Summary

29I passes when:

- LOD preserves consequence;
- time is deterministic;
- local offline play is safe;
- persistent servers are explicit;
- saves are atomic/duplicate-safe;
- multiplayer is authoritative yet responsive;
- UI is contextual and knowledge-safe;
- accessibility never depends on one sensory channel;
- distant civilisation biology scales without fake resources or erased named consequences;
- all new interfaces are recorded for 29J/final reconciliation.

# 43. Cross-Set Interface Amendments

29I inherits AM-29-001 through AM-29-084 from 29A-29H. The following additions/refinements are proposed for final reconciliation.

## AM-29-085 - Authoritative Movement Activity Event Envelope

**Set 30 -> Set 29**

Add a sequence-safe activity event containing:

- actor ID;
- action/activity ID;
- movement mode;
- intensity/cost basis;
- start/end or committed duration;
- carried/load context reference;
- authoritative/predicted sequence number;
- simulation timestamp.

**Purpose:** let 29B/29I apply Stamina/Fatigue once without redefining movement.

## AM-29-086 - Biological Mobility Modifier Snapshot Revision

**Set 29 -> Set 30**

Refines AM-29-001 by adding a revisioned snapshot containing:

- `StaminaModifier()`;
- `CarryPenalty()`;
- Fatigue movement modifier;
- injury functional modifiers;
- thermal/disease/poison movement-affecting modifiers;
- snapshot revision and effective time.

**Purpose:** prevent stale client movement prediction while Set 30 remains locomotion owner.

## AM-29-087 - Named Biological Priority Hint

**Set 28/Quest/NPC owners -> Set 29**

Expose a bounded priority reason/reference for companions, relationship-critical or assignment-critical named actors.

**Purpose:** stop socially important actors disappearing into anonymous population cohorts. Does not make them invulnerable.

## AM-29-088 - Companion Care Outcome Summary

**Set 29 -> Set 28**

Expose:

- care requested/received/failed;
- `CareNeed()`;
- `TreatmentUrgency()`;
- `RecoveryStatus()`;
- non-hidden reason code;
- authoritative result time.

**Purpose:** Set 28 may create social memory/reaction without owning medical simulation.

## AM-29-089 - Versioned Population Health Summary

**Set 29 -> Set 27**

Add summary revision/time/coverage fields to existing economy-facing outputs:

- food demand;
- medical demand;
- workforce capacity;
- injury downtime;
- disease pressure;
- treatment backlog.

**Purpose:** Set 27 can consume stable economic inputs without polling per-NPC biology.

## AM-29-090 - Cross-Set Authoritative World-Time Reference

**World/technical authority -> Sets 27-30**

Expose one stable simulation-time reference and time-scale state for persistent cross-set transactions/schedules.

**Purpose:** economy contracts, social assignments, biological progression and travel time can reference the same authoritative timeline without any set owning the world clock.

## AM-29-091 - Actor Presence and Offline Policy Interface

**World/session authority -> Sets 28-30/29**

Expose actor presence state:

- active local;
- connected remote;
- disconnected persistent;
- safely suspended;
- protected rest;
- other validated server policy.

**Purpose:** biological/social/movement systems know whether off-screen time is genuine simulation rather than wall-clock catch-up.

## AM-29-092 - Biological Snapshot Revision Interface

**Set 29 -> authorised consumers**

Expose monotonic actor/cohort biological revision IDs with full/delta snapshot semantics.

**Purpose:** Set 27/28/30/UI can reject stale state and request refresh without owning biological fields.

## AM-29-093 - Idempotent Cross-Set Transaction Envelope

**Shared interface across Sets 27-30 and existing owners**

Add standard one-time transaction identity/link fields for actions crossing inventory/economy/social/movement/biology boundaries.

**Purpose:** no duplicate purchase-consumption, companion treatment, caravan exposure or movement Stamina cost on retry/reconnect.

## AM-29-094 - Biological Critical Alert Interface

**Set 29 -> UI/Set 28 authorised consumers**

Expose semantic severity, urgency, known cause, acknowledgement state and accessibility metadata without forcing UI layout.

**Purpose:** companions/social systems may respond and UI may present critical state without reading raw internals.

## AM-29-095 - Survival Accessibility Policy Interface

**World/session settings -> Set 29; Set 29 -> UI**

Expose:

- presentation accessibility is personal/unlocked;
- mechanical assist policy: personal/world/host-approved/locked;
- accepted assist profile revision.

**Purpose:** shared worlds can support accessibility without client-authoritative biological cheating.

## AM-29-096 - Biological Knowledge Visibility Query

**Set 29/knowledge owner -> UI/Set 28**

Expose visibility class:

- self-known;
- observable;
- suspected;
- diagnosed;
- hidden/admin-only.

**Purpose:** network/UI/social consumers do not accidentally reveal disease/toxin truth.

## AM-29-097 - Cohort Promotion/Demotion Reason Interface

**NPC/Settlement/Quest/Set 28 -> Set 29**

Expose reasoned requests such as player proximity, companion relevance, quest target, severe case or active treatment.

**Purpose:** biological LOD aligns with world relevance without Set 29 owning NPC simulation.

## AM-29-098 - Distant Travel Biological Summary Interface

**Set 30 -> Set 29**

For abstracted journeys, expose:

- travel duration;
- activity intensity band;
- rest opportunities;
- route exposure summary reference;
- vehicle/mount interior/support reference;
- interruption milestones.

**Set 29 -> Set 30/27/28** returns biological arrival condition/downtime summaries.

**Purpose:** distant caravans/companions do not need action-level movement simulation while biology remains consequential.

## AM-29-099 - Biological Reconciliation Barrier Interface

**Set 29 -> NPC/Movement/UI consumers**

Expose `ready/reconciling/failed` plus snapshot revision after large catch-up/promotion.

**Purpose:** external gameplay does not act on partially caught-up biological state.

## AM-29-100 - Profile Migration Revalidation Event Refinement

**Set 29 -> Set 30/26/Equipment/Entity/UI**

Refines AM-29-084 so persistent profile/applicability migration emits old/new profile revision, changed capability domains and required revalidation targets.

**Purpose:** movement, aquatic capability, equipment fit and UI update after migration without Set 29 redefining them.

> **Ownership Protection**  
> AM-29-085 through AM-29-100 add transport/consumption contracts only. They do not transfer Economy to Set 29, Social behaviour to Set 29 or Movement to Set 29.

# 44. Open Decisions and Handoff to 29J

29I deliberately leaves final schema/value lock to 29J/Set 25 and implementation benchmarking.

| ID | Decision | Owner/Handoff |
| --- | --- | --- |
| DEC-29I-001 | Exact qualified IDs/schema field names for actor/cohort biological save records. | 29J + Set 25. |
| DEC-29I-002 | Exact scheduler cadence defaults per channel after profiling. | 29J/Document 18 implementation evidence. |
| DEC-29I-003 | Exact main-thread/network/save-size budgets. | Set 25E + implementation benchmark. |
| DEC-29I-004 | Final set of cohort grouping dimensions after city-scale tests. | 29J. |
| DEC-29I-005 | Supported history retention/compaction windows. | 29J/technical save policy. |
| DEC-29I-006 | Default persistent-server offline-player policy for official servers. | Multiplayer/world-settings owner; consume in Set 29. |
| DEC-29I-007 | Exact per-player mechanical accessibility assist policy in public multiplayer. | Multiplayer/world-settings product decision. |
| DEC-29I-008 | Final UI screen layout and navigation for Health/Status. | Document 17 revision. |
| DEC-29I-009 | Character-creation biological profile presentation. | Document 17 + 29H integration. |
| DEC-29I-010 | Final network transport/delta compression mechanism. | Rewritten Document 18. |
| DEC-29I-011 | Final migration support window across released Set 29 schemas. | Set 25 governance + 29J. |
| DEC-29I-012 | Whether certain companion/quest NPCs remain individual at L3/L4 permanently or only while relevant. | 29J + Set 28/15 contract. |

29J must now:

1. reconcile all AM-29-001 through AM-29-100;
2. finalise canonical Set 29 API naming and schema families;
3. remove duplicate/provisional fields across 29A-29I;
4. define final balance/reference tables and validation ranges;
5. produce the complete Set 29 dependency matrix;
6. lock the Set 29 Definition of Done and production acceptance suite;
7. record any unresolved Set 26/Set 30 aquatic ownership issue for the wider 27-30 integration pass;
8. ensure no Set 29 document silently owns economy, dialogue/social AI, movement or death.

> **29I Completion Statement**  
> Leyforge's Survival, Health and Biological Systems can now remain coherent from active first-person play to distant civilisation simulation, through save/load and migrations, across split-screen and network multiplayer, and under accessible player presentation. The final Set 29 document can focus on registry/API/balance reconciliation rather than inventing another runtime architecture.

# Appendix A. Biological LOD Reference Matrix

| Channel | L0 | L1 | L2 | L3 | L4 |
| --- | --- | --- | --- | --- | --- |
| Health | Exact individual/event-driven | Exact individual, reduced checks | Named exact; cohort burden | Exceptional named + burden | Persistent named/milestone only |
| Stamina | Action-level | Activity summary where safe | Not routine per-actor | Not simulated action-level | None |
| Fatigue | Exact/periodic | Scheduled | Cohort/activity batch | Work/travel burden | Milestone/summary |
| Hunger/Hydration | Exact | Scheduled | Meal-window batch | Demand/coverage | Next due milestone |
| Nutrition | Rolling individual summary | Scheduled | Cohort weighted summary | Population band | Persist summary |
| Temperature/Wetness | Detailed elapsed integration | Coarser integration | Exposure cohorts | Regional hazard pressure | Only consequential persistent state |
| Sleep | Exact session/pressure | Scheduled | Rest-access batch | Rest burden | Milestone |
| Injuries | Full instances | Full persistent instances | Protected named + severity cohorts | Exceptional named + counts | Persistent protected instances |
| Disease | Full instances/exposure | Full scheduled | Named + cohort transmission | Pressure/case counts | Stage/milestone |
| Poison | Full instance/load | Scheduled | Named + relevant counts | Event-driven summary | Persistent exceptional/milestone |
| Treatment | Full procedure/transactions | Persistent procedure | Named plans + throughput | Backlog/capacity | Scheduled follow-up |
| Profile | Full effective snapshot/cache | Full ref/cache | Profile composition | Group composition | IDs/versions |

# Appendix B. Biological Persistence Classification Matrix

| Data | Class | Notes |
| --- | --- | --- |
| Biological profile ID/version | P0 | Persistent identity/physiology reference. |
| Persistent profile overlays | P0 | Save source/reversal/version. |
| Temporary saveable overlay | P1 | Save if active and future consequence exists. |
| Current Health | P0 for player/important actor | Runtime truth. |
| Current Stamina | P1 | Persist when active/danger continuity requires; may reconstruct safely otherwise. |
| Fatigue | P0/P1 | Persistent meaningful long-term state. |
| Hunger/Hydration | P1/P0 by actor relevance | Needed for player/named and cohort summaries. |
| Nutrition summary | P1 | Rolling-window summary, not every meal event. |
| Thermal Load/Wetness | P1 | Save if meaningful/non-neutral. |
| Sleep Pressure | P1 | Persistent for relevant actors. |
| Injury instances | P0 | Never discard through LOD. |
| Disease instances | P0 | Never reroll through load/LOD. |
| Toxin instances | P0/P1 | Persistent while active/consequential. |
| Treatment plan/procedure | P0/P1 | Required to prevent duplication/loss. |
| Effective protection cache | P2 | Rebuild from authoritative sources/revisions. |
| HUD alert fade | P3 | Presentation only. |
| Breathing sound intensity | P3 | Presentation only. |
| Debug cause trace cache | P3/P2 | Reconstruct; persistent history only if gameplay owner needs it. |

# Appendix C. Replication and Alert Priority Matrix

| State | Replication | Alert | Knowledge Rule |
| --- | --- | --- | --- |
| Critical Health | R0 | Critical | Self/authorised observers. |
| Heavy/Critical Bleeding | R0 | Critical | Usually observable; exact detail may depend on inspection. |
| Severe injury | R1 | Urgent | Visible/known region and diagnosis rules. |
| Critical toxin | R0 | Critical | Symptoms immediate; exact toxin may remain unknown. |
| Disease stage change | R1/R2 | Relevant/Urgent by severity | Identity diagnosis-gated. |
| Hunger band change | R2 | Relevant/Urgent | Self. |
| Hydration band change | R2 | Relevant/Urgent | Disabled entirely when thirst off. |
| Thermal danger | R1/R2 | Urgent/Critical | Self; cause trace uses known environment. |
| Fatigue band change | R2 | Relevant/Urgent | Self. |
| Treatment commit/failure | R0 | Relevant/Urgent | Participants/authorised care UI. |
| Distant cohort demand | R3 | Management alert | Settlement authority/management UI. |
| Profile applicability change | R0 | Relevant/Urgent if disruptive | Self/authorised consumers. |

# Appendix D. Runtime Record Templates

## D.1 Actor Biological Runtime Snapshot

```yaml
actor_biology:
  actor_id: actor:<runtime_id>
  schema_version: 29i.v0_1
  snapshot_revision: 1842
  simulation_time: <world_time>
  lod: L1
  reconciliation_state: ready
  biological_profile:
    definition_id: leyforge.core.biological_profile:<id>
    definition_version: <version>
    persistent_overlays: []
    effective_revision: <hash_or_counter>
  core_refs:
    health_state_ref: <29B record>
    nourishment_state_ref: <29C record>
    exposure_state_ref: <29D record>
    injury_refs: []
    disease_refs: []
    toxin_refs: []
    treatment_refs: []
  scheduler:
    last_update_time: <world_time>
    next_milestones: []
  persistence:
    individual_priority: true
    priority_reasons: [player]
  transaction_journal_revision: 331
```

## D.2 Population Biological Cohort

```yaml
population_biological_cohort:
  cohort_id: bio_cohort:<runtime_id>
  owner_id: settlement:<id>
  schema_version: 29i.v0_1
  snapshot_revision: 92
  lod: L2
  simulation_time: <world_time>
  population_count: 64
  profile_composition:
    leyforge.core.biological_profile:baseline_humanoid: 48
    leyforge.core.biological_profile:tidekin_river: 11
    leyforge.core.biological_profile:other: 5
  burden:
    healthy_stable: 47
    nourishment_at_risk: 6
    fatigue_moderate_plus: 8
    injury_minor: 5
    injury_severe: 1
    disease_cases:
      disease_family:respiratory: 4
    treatment_backlog: 3
  excluded_named_actor_ids: [actor:<id>]
  next_resolution_time: <world_time>
  source_revisions:
    provision: <rev>
    health_service: <rev>
    environment: <rev>
```

## D.3 Biological Alert

```yaml
biological_alert:
  alert_id: bio_alert:<runtime_id>
  actor_id: actor:<id>
  snapshot_revision: 1842
  priority: urgent
  category: thermal
  semantic_state: cold_worsening
  title_key: ui.bio.alert.cold_worsening.title
  body_key: ui.bio.alert.cold_worsening.body
  cause_reason_ids:
    - wetness.soaked_clothing
    - environment.strong_wind
  known_visibility: self_known
  trend: worsening
  persistent_until_resolved: false
  accessibility:
    icon_semantic_id: hazard.cold
    colour_independent: true
    caption_key: ui.bio.alert.cold_worsening.caption
    haptic_class: warning_medium
    reduced_motion_safe: true
```

## D.4 Cross-System Transaction Envelope

```yaml
cross_system_transaction:
  transaction_id: txn:<ULID>
  schema_version: shared.v0_1
  actor_id: actor:<id>
  target_id: actor:<id>
  type: treatment.antidote
  simulation_time: <world_time>
  prerequisite_revisions:
    biology: 1842
    inventory: 771
  reservations:
    - system: inventory
      ref: reservation:<id>
  status: committed
  output_revisions:
    biology: 1843
    inventory: 772
  audit_reason_id: treatment.antidote.applied
```

# Appendix E. Worked Runtime Scenarios

## E.1 Wounded Villager Leaves Player Range

1. Villager has Severe fractured leg and a splint treatment plan.
2. Player leaves settlement.
3. NPC/render systems reduce local detail.
4. 29I demotion commits injury instance, treatment plan, recovery ceiling, last update time and next milestone.
5. Villager remains individually protected because Severe injury is active.
6. Settlement L2 care batch confirms clinic/medicine/rest support.
7. Recovery advances under 29E/29G rules.
8. Player returns two in-game days later.
9. Promotion catches up to current Simulation Time and restores local presentation.
10. Villager is still the same actor, with legitimate recovery progress rather than instant heal/reset.

## E.2 Local Save Closed for a Week

1. Player saves while Hungry but safe, with a Moderate injury.
2. Application remains closed for seven real days.
3. No wall-time biological progression occurs.
4. On load, Simulation Time resumes at the saved point.
5. Hunger and injury are unchanged except safe reconstruction of transient fields.
6. No starvation, bleed-out or free week of healing occurs.

## E.3 Persistent Server Disconnect During Fever

1. Server policy is `safe_suspend`.
2. Player disconnects with Moderate diagnosed fever.
3. Actor leaves ordinary exposure simulation; disease record is saved/suspended under policy.
4. Server world continues for others.
5. Player reconnects; disease resumes from policy-defined suspended state.
6. No cure occurred from reconnect, and no undisclosed lethal progression occurred.

If policy were `persistent_body`, disease/world consequences would continue because the actor remained authoritatively simulated; the server must disclose that policy.

## E.4 Two Players Consume the Final Healing Meal

1. Both clients request the final serving from shared storage.
2. Inventory transaction service accepts one reservation.
3. Losing request fails before nourishment commit.
4. 29C applies meal biological effect once to the winning actor.
5. Snapshot revisions update.
6. Retry/reconnect cannot replay the same transaction ID.

## E.5 Large Settlement Outbreak

1. 900 residents are represented by cohorts plus protected named cases.
2. Contamination/world system supplies an exposure pressure snapshot.
3. 29F batch processes disease pressure using cohort profile/resistance composition.
4. 29G treatment throughput consumes real clinic capacity and medicine stock.
5. 29I updates workforce/medical-demand summary for Set 27 and crisis threshold for Quest/Event.
6. Three named severe NPCs remain individual.
7. When player arrives, only relevant cohorts/actors promote to local detail; no 900-per-frame disease loop is started.

## E.6 Predicted Sprint Rejected

1. Client predicts sprint and spends Stamina visually.
2. Set 30 server rejects the movement action because route/state invalidated.
3. Authoritative Stamina transaction did not commit.
4. 29I receives reconciliation and restores client Stamina display smoothly.
5. Fatigue is not charged for a sprint that never authoritatively occurred.

## E.7 Disease Is Unknown to the Player

1. Actor has an authoritative disease instance.
2. Network snapshot to self contains symptom/knowledge-safe fields, not unrestricted debug truth.
3. UI displays “Unidentified illness - feverish”.
4. Clinic assessment later updates diagnosis knowledge.
5. View model now displays the disease name and appropriate known counter.
6. Simulation did not change; only information visibility changed.

## E.8 Profile Migration

1. Game update changes a playable profile's hydration applicability.
2. Migration loads old profile/version and active Hydration/dehydration state.
3. Explicit migration converts/removes no-longer-valid state according to 29J rule.
4. AM-29-100 emits revalidation for UI/equipment/movement/aquatic consumers.
5. Save is rewritten only after migration validates.

# Appendix F. Validation Scenario Catalogue

| ID | Scenario | Expected Result |
| --- | --- | --- |
| 29I-VAL-001 | Same Hunger simulation at 30/144 FPS. | Equivalent authoritative outcome. |
| 29I-VAL-002 | Demote/promote fractured named NPC. | Same injury identity; elapsed recovery only. |
| 29I-VAL-003 | Disease case demoted to L3 then promoted. | No reroll/restart. |
| 29I-VAL-004 | Close local save for long wall time. | No offline biological punishment/reward. |
| 29I-VAL-005 | Persistent server `persistent_body`. | Genuine server-time progression. |
| 29I-VAL-006 | Persistent server `safe_suspend`. | Biological state suspended per disclosed policy. |
| 29I-VAL-007 | Save during treatment commit. | Exactly one resource consumption/outcome. |
| 29I-VAL-008 | Duplicate meal packet. | One commit; duplicate rejected. |
| 29I-VAL-009 | Client edits Health locally. | Server correction; no persistent change. |
| 29I-VAL-010 | Predicted sprint rejected. | Stamina/Fatigue reconciliation correct. |
| 29I-VAL-011 | Split-screen concurrent treatment. | Independent UI/focus; shared resources authoritative. |
| 29I-VAL-012 | Thirst disabled. | No Hydration HUD/alerts/depletion. |
| 29I-VAL-013 | Critical alert with colour disabled. | Text/icon and configured redundant channel sufficient. |
| 29I-VAL-014 | All motion symptom effects disabled. | Biological severity unchanged/readable. |
| 29I-VAL-015 | Screen reader on severe fracture. | Complete semantic state announced. |
| 29I-VAL-016 | 1,000 healthy distant residents. | No per-frame per-resident loop. |
| 29I-VAL-017 | 1,000 residents + outbreak. | Batched workload with protected named cases. |
| 29I-VAL-018 | Cohort food shortage. | Shortfall preserved; no abstract food creation. |
| 29I-VAL-019 | Clinic overloaded. | Backlog persists; capacity not exceeded. |
| 29I-VAL-020 | Catch-up with several scheduled milestones. | Chronological deterministic processing. |
| 29I-VAL-021 | Promotion catch-up exceeds frame budget. | Reconciliation barrier until complete. |
| 29I-VAL-022 | Old profile ID alias migrated. | Correct profile resolved; state preserved. |
| 29I-VAL-023 | Removed disease ID with no migration. | Validation/quarantine failure; no silent cure. |
| 29I-VAL-024 | Client requests hidden diagnosis. | Knowledge filter denies exact truth. |
| 29I-VAL-025 | Mechanical assist personal allowed. | Server applies authorised per-player modifier. |
| 29I-VAL-026 | Competitive server locks mechanical assist. | Presentation accessibility still available. |
| 29I-VAL-027 | Notification repeats same Moderate warning. | Deduplicated until meaningful state change. |
| 29I-VAL-028 | Critical warning after toast queue full. | Remains persistent/discoverable. |
| 29I-VAL-029 | Reconnect after server-time treatment. | Concise authoritative change summary. |
| 29I-VAL-030 | Profile migration changes body capability. | AM-29-100 revalidation emitted. |
| 29I-VAL-031 | Distant caravan travel summary arrives. | Biological arrival state uses duration/exposure/rest summary. |
| 29I-VAL-032 | Set 27 polls health summary repeatedly. | Stable revisioned summary; no per-NPC leak. |
| 29I-VAL-033 | Companion becomes quest-relevant. | Individual priority prevents aggregation. |
| 29I-VAL-034 | Companion relevance ends while Severe disease active. | Biology keeps individual priority until safe to aggregate. |
| 29I-VAL-035 | Save recovery replays journal. | Committed IDs rejected; no duplication. |
| 29I-VAL-036 | UI information density changed mid-session. | Simulation unaffected. |
| 29I-VAL-037 | Localisation with reordered grammar. | Parameterised strings remain correct. |
| 29I-VAL-038 | Controller-only first aid. | Complete flow accessible. |
| 29I-VAL-039 | Set 30 stale modifier snapshot. | Revision mismatch triggers correction/refresh. |
| 29I-VAL-040 | L4 scheduled disease milestone wakes region. | Correct milestone processed without continuous ticking. |

# Appendix G. Terminology Register

| Term | Meaning |
| --- | --- |
| Simulation Time | Authoritative in-world elapsed time used for biological progression. |
| Wall Time | Real-world clock time; not automatically biological time. |
| Biological LOD | Representation/scheduling level for Set 29 state, independent of render detail. |
| L0 Active | Full individual/action-relevant biological simulation. |
| L1 Local Reduced | Individual state with reduced scheduling/presentation. |
| L2 Settlement/Chunk | Protected named actors plus routine population cohorts. |
| L3 Regional Abstract | Distant cohort pressure/demand plus exceptional named cases. |
| L4 Dormant/Scheduled | Persistent state with milestone/event wakeups and no continuous ticking. |
| Cohort | Aggregated routine population group preserving biological demand/burden. |
| Protected Individual | Actor excluded from anonymous aggregation due to player/story/social/medical relevance. |
| Reconciliation Barrier | Temporary state preventing interaction with partially caught-up biological truth. |
| Snapshot Revision | Monotonic version of an actor/cohort authoritative biological snapshot. |
| Transaction Envelope | One-time cross-system request/commit identity preventing duplicate effects. |
| Presentation Accessibility | Per-player information/sensory/input changes that do not alter simulation truth. |
| Mechanical Survival Assist | Authoritative biological severity/timing adjustment allowed by world/session policy. |
| Knowledge Visibility | Rule deciding how much biological truth a consumer/player is allowed to see. |
| Offline Policy | World/session rule determining whether a disconnected actor remains simulated, suspends or enters protected rest. |
| Cause Trace | Source-labelled explanation of why a biological state/modifier exists. |

# Appendix H. Cross-Set Amendment Register

29I carries forward all applicable amendments from 29A-29H and adds:

- AM-29-085 - Authoritative Movement Activity Event Envelope.
- AM-29-086 - Biological Mobility Modifier Snapshot Revision.
- AM-29-087 - Named Biological Priority Hint.
- AM-29-088 - Companion Care Outcome Summary.
- AM-29-089 - Versioned Population Health Summary.
- AM-29-090 - Cross-Set Authoritative World-Time Reference.
- AM-29-091 - Actor Presence and Offline Policy Interface.
- AM-29-092 - Biological Snapshot Revision Interface.
- AM-29-093 - Idempotent Cross-Set Transaction Envelope.
- AM-29-094 - Biological Critical Alert Interface.
- AM-29-095 - Survival Accessibility Policy Interface.
- AM-29-096 - Biological Knowledge Visibility Query.
- AM-29-097 - Cohort Promotion/Demotion Reason Interface.
- AM-29-098 - Distant Travel Biological Summary Interface.
- AM-29-099 - Biological Reconciliation Barrier Interface.
- AM-29-100 - Profile Migration Revalidation Event Refinement.

All amendments remain provisional until 29J and the final Document Sets 27-30 integration pass. None transfers economy, social or movement ownership into Set 29.

---

**End of Document 29I - Simulation LOD, Multiplayer, Persistence, UI and Accessibility v0.1**
