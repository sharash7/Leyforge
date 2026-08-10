# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28G - Orders, Delegation, Assignments, Autonomy and Off-Screen Resolution

**Version 0.1 - Persistent Delegation, Assignment Orchestration and Bounded Off-Screen Resolution Design Bible Draft**

**Document Set:** 28 - Dialogue, Social Systems and Companions  
**Governing Contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0  
**Depends On:** 28A, 28B, 28C, 28D, 28E, 28F and the current canonical Leyforge source set  
**Project Lead and Final Authority:** Ash

> **Delegation-System Statement**  
> Leyforge delegation lets the player entrust meaningful work to companions and other specifically authorised agents without turning the game into a remote-control strategy interface or allowing off-screen simulation to invent results. Document 28G owns the social commitment, assignment record, instruction envelope, autonomy boundaries, reporting, accountability and orchestration of delegated work. The gameplay system that owns the requested action remains authoritative for travel, combat, trade, construction, quest objectives, healing, resource transactions, settlement labour, magic, research and every other domain effect. A delegated assignment succeeds only through valid world-facing actions, bounded distant simulation or authoritative domain summaries that could have occurred under the same rules if the player were present.

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Persistent Delegation and Off-Screen Resolution Foundation Draft | Establishes order and assignment vocabulary, delegation eligibility, instruction and briefing records, resource custody, domain adapters, assignment lifecycle, interruption/replanning, off-screen checkpoint resolution, evidence and reporting, relationship consequences, multiplayer authority, registries, diagnostics, validation and cross-set interface amendments. |

# Document Purpose

Document 28G defines how a player asks a companion or other explicitly authorised persistent agent to perform work, how that request becomes an accepted assignment, how the assignment remains truthful while the agent is nearby or far away, how external systems perform the actual work, and how the agent eventually reports success, failure, partial completion, changed conditions or refusal.

The earlier Set 28 documents deliberately separate social truth from physical and economic truth:

- **28B** owns the conversation session through which many orders, briefings, recalls and reports are communicated.
- **28C** owns knowledge, beliefs, evidence, rumours, languages and what an agent actually understands about the assignment.
- **28D** owns Trust, Affection, Fear, Loyalty, Respect, Gratitude, Grievance, Familiarity and persistent relationship interpretation.
- **28E** owns contested persuasion, negotiation, intimidation, etiquette and acceptance of socially negotiable requests.
- **28F** owns companion membership, availability, roles, standing permissions, refusal boundaries and service commitments.

28G begins when an issuer wants a valid agent to pursue a **specific goal under explicit constraints**. It records the social and operational envelope of that request, but it does not create a private parallel version of the game world. If the assignment says “deliver medicine to Northfall,” Set 30 owns the journey, inventory systems own the medicine, Set 27 may own payment, Document 15 owns any quest objective, Set 29 owns any illness or injury, and 28G only owns the accepted assignment, allowed substitutions, deadlines, authority, progress interpretation and final report.

This separation follows the project-wide single-owner rule. Document 07 v0.2 already requires NPC tasks to complete only when eligibility, reservation, target validity, authoritative effect and a result record all pass. Document 18 v0.2 similarly requires persistent commitments to survive simulation LOD and makes distant processing bounded, deterministic and reconstructable. 28G extends those principles specifically to player-issued and socially accepted delegated assignments.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28G | 28G Relationship |
| --- | --- | --- |
| 00 - Master Game Design Bible | NPCs are persistent people; player freedom includes leadership, followers, trade, settlement support and world consequences. | Delegation reduces repetitive labour while preserving NPC agency and living-world consequence. |
| 01 - Core Gameplay Loop | Interaction includes recruitment, requests, village work and systemic problem solving rather than a fixed quest sequence. | Delegated work can contribute to the core loop but cannot replace exploration, preparation or progression gates. |
| 02 - Player Progression | Leadership, trade, exploration, magic, engineering and other skills/perks may improve available options. | 28G consumes capability and progression eligibility; it does not define a new Delegation stat. |
| 07 v0.2 - NPC Village System | NPC task completion requires valid eligibility, reservations, targets and authoritative effects; ordinary settlement work belongs to the NPC/job scheduler. | 28G does not replace village jobs. It can submit assignment intent to 07-owned labour where an authorised external-task adapter exists. |
| 08 - Automation System | Real automation performs repeatable work through physical networks, permissions and conserved transactions. | Delegation may ask an agent to inspect, repair or operate automation, but 28G does not simulate machine output. |
| 09 - Magic System | Spells, rituals, mana infrastructure, knowledge and magical risk are independent systemic activities. | 28G can orchestrate a magical assignment only through Magic-owned execution and validation. |
| 10 - Creatures and Monsters | Creatures, tamed beasts, familiars and golems have their own behaviour and capability systems. | 28G supports compatible assignment adapters without redefining taming, creature needs or construct control. |
| 15 - Quest and Event System | Objectives define desired world states; followers, workers, specialists, hired parties, golems and factions may be delegated objectives according to capability, risk, cost, authority and travel time. | Document 15 remains quest-objective authority. 28G owns assignment lifecycle and can link a delegated assignment to an objective. |
| 16 - Combat, Gear and Defence | Combat, surrender, rescue, escort and defence have authoritative action and outcome rules. | 28G can request combat-facing goals and engagement constraints; Combat resolves actual battles. |
| 17 - UI/UX System | Commands use authoritative view models, reason codes, knowledge-aware presentation and accessibility. | 28G exposes assignment summaries, known risks, blockers, status, evidence and reports; UI owns presentation. |
| 18 v0.2 - Technical Implementation Plan | One authoritative world, stable IDs, event-driven commands, bounded simulation LOD, persistent commitments, deterministic catch-up and Godot/Summer Engine implementation. | 28G uses persistent assignment records, checkpoint scheduling, domain adapters, correlation IDs, migrations and deterministic tests. |
| 19 / 20 | Construction, settlement projects, labour, sites and reservations are authoritative external systems. | Delegation can contribute through project adapters but never advances construction by social state alone. |
| 26 | Maritime tasks already use cargo, crew, vessel, route and event ownership. | Maritime delegation uses Set 26 interfaces without duplicating vessel or ocean mechanics. |
| 28A | Set 28 owns who may be asked, consent, assignment social contract, priority/permission boundaries, refusal reasons, reporting, accountability and social consequences. | 28G implements the detailed delegation authority assigned by 28A. |
| 28F | Companion membership, availability and standing action permission exist before a task is issued. | 28G consumes `CompanionAvailability()` and `CompanionActionPermission()` and creates assignment-specific commitments. |
| Cross-Set Register | Set 27 owns economy, Set 29 owns survival/health, Set 30 owns movement/traversal. | 28G consumes their results and never replaces their algorithms. |

# Static Table of Contents

1. Locked Delegation-System Identity  
2. Ownership Boundaries and Anti-Duplication Rules  
3. Locked Decision Summary  
4. Delegation Architecture Overview  
5. Command, Order, Request, Assignment and Standing Instruction Vocabulary  
6. Definition, Runtime Record and Domain-Effect Separation  
7. Delegation-Capable Agents and Eligibility  
8. Issuer Authority, Ownership and Permission  
9. Assignment Creation and Acceptance Flow  
10. Consent, Refusal and Renegotiation  
11. Assignment Goal Model  
12. Constraints, Permissions and Forbidden Methods  
13. Briefing, Knowledge and Language Requirements  
14. Target Binding, World Anchors and Discovery Confidence  
15. Capability, Skill, Tool and Specialist Requirements  
16. Equipment, Supplies, Cargo, Funds and Custody  
17. Time, Urgency, Deadlines and Scheduling  
18. Risk, Uncertainty and Known-Stakes Presentation  
19. Travel and Route Handoff to Set 30  
20. External Domain Adapter Architecture  
21. Quest and Event Integration  
22. Economy, Contracts and Set 27 Integration  
23. Survival, Injury, Fatigue and Set 29 Integration  
24. NPC Village Jobs and Document 07 Integration  
25. Construction, Repair and Settlement Project Delegation  
26. Combat, Defence, Hunt and Capture Delegation  
27. Exploration, Scouting, Survey and Investigation Delegation  
28. Delivery, Hauling, Courier and Logistics Delegation  
29. Diplomacy, Negotiation and Social Delegation  
30. Research, Teaching, Magic and Ritual Delegation  
31. Rescue, Escort, Care and Evacuation Delegation  
32. Assignment Lifecycle State Machine  
33. Execution Plans, Phases and Checkpoints  
34. Interruptions, Emergencies and Priority Overrides  
35. Replanning, Substitution and Adaptive Autonomy  
36. Dynamic World Change and Invalidation  
37. Partial Completion and Progressive Deliverables  
38. Failure Classes and Recoverable Failure  
39. Cancellation, Recall, Suspension and Abandonment  
40. Return, Rendezvous and Post-Assignment Transition  
41. Reports, Evidence, Proof and Accountability  
42. Knowledge Transfer and 28C Integration  
43. Relationship, Loyalty and Social Consequence Integration  
44. Rewards, Payment, Recognition and Contribution  
45. Disputes, Blame, Missing Evidence and Conflicting Accounts  
46. Off-Screen Resolution Architecture  
47. Simulation LOD and Distant Assignment Representation  
48. Deterministic Checkpoints, Seeds and Bounded Uncertainty  
49. Resource-Conservation and No-Teleport Rules  
50. Promotion, Demotion and Reconciliation  
51. Persistence, Save/Load, Migration and Recovery  
52. Multiplayer Authority and Shared Delegation  
53. UI, Accessibility and Player Readability  
54. Registries, Runtime Records and Naming  
55. Reason Codes, Diagnostics and Developer Tools  
56. Validation and Automated Test Strategy  
57. Balance Framework and Anti-Exploit Rules  
58. Core Example Scenarios  
59. Production Scope and Staged Delivery  
60. 28G Acceptance Criteria  
61. Open Questions Assigned to Later Documents  
62. Cross-Set Interface Amendments  
Appendix A. Delegated Assignment Definition Template  
Appendix B. Assignment Instance Template  
Appendix C. Instruction, Briefing and Constraint Templates  
Appendix D. Domain Adapter Contract Template  
Appendix E. Assignment Lifecycle Matrix  
Appendix F. Initial Assignment Family Library  
Appendix G. Reason-Code Catalogue  
Appendix H. Cross-System Responsibility Matrix  
Appendix I. Glossary

# 1. Locked Delegation-System Identity

Delegation is the **persistent intention-and-accountability layer** between a socially autonomous agent and the gameplay systems that perform real work.

> **Locked Rule**  
> 28G may decide that an agent accepted an assignment, understands its goal, has permission to attempt it, remains committed to it, should report its outcome and may suffer social consequences from the result. 28G may never declare that the requested world effect happened merely because the assignment elapsed for long enough.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Social commitment | A person agrees to pursue a goal under conditions. | The player can rely on named people without owning them. |
| Explicit instructions | Goal, target, constraints, permitted methods, supplied resources and reporting expectations are recorded. | “Scout the ruin and return before nightfall” means something concrete. |
| Domain execution | External gameplay systems perform actual travel, trade, combat, construction, healing or other work. | Delegation obeys the same world rules as direct play. |
| Bounded autonomy | The agent may choose reasonable methods inside the accepted instruction envelope. | The player need not script every footstep. |
| Persistent accountability | Success, failure, delay, loss, refusal and changed circumstances are recorded. | The world remembers what was entrusted and what happened. |
| Truthful distance simulation | Distant work uses authoritative summaries and checkpoints. | Agents do not teleport or create resources when unloaded. |
| Social consequence | Reporting, broken promises, reckless orders, rescue, blame and recognition affect relationships. | Delegation creates stories rather than only convenience. |

## 1.1 Delegation Design Promise

A player should be able to tell a trusted scout to investigate a marked ruin, supply them with a map and food, permit them to avoid combat, and later receive a report that distinguishes what they actually observed from what they only heard. The scout may return early because the bridge collapsed, refuse to enter a cursed chamber, discover an unexpected survivor, lose equipment in a real combat encounter, or complete only the safe portion of the task. Every outcome remains traceable to actual world state and system-owned rules.

## 1.2 What 28G Is Not

28G is not:

- an RTS squad-command system;
- a replacement for Document 07's ordinary job scheduler;
- a replacement for Set 30 pathfinding or travel simulation;
- a private combat simulator;
- a private economy or contract simulator;
- an item duplication system;
- a way to reveal undiscovered locations automatically;
- a background “success chance” button that ignores the world;
- a quest-completion shortcut;
- an omniscient mission planner that tells the player hidden risks;
- a system for compelling any NPC to obey any instruction;
- a substitute for automation when the task is genuinely repetitive industrial work.

# 2. Ownership Boundaries and Anti-Duplication Rules

## 2.1 28G Owns

28G owns:

- assignment definitions and assignment runtime records;
- which delegation-capable actor is being asked;
- assignment-specific acceptance and commitment;
- issuer/assignee relationship at the assignment level;
- goal statements and acceptable completion evidence;
- assignment-specific priorities and constraints;
- allowed, conditional and forbidden method families inherited from 28F permissions;
- briefing package references;
- reporting expectations;
- assignment lifecycle state;
- phase/checkpoint orchestration;
- recall, suspension, cancellation and abandonment semantics;
- social interpretation of success, failure, recklessness and accountability;
- off-screen assignment orchestration;
- final report assembly from authoritative evidence;
- assignment history and audit records.

## 2.2 28G Consumes but Does Not Own

| Concern | Owner | 28G Consumption |
| --- | --- | --- |
| Companion membership and standing permissions | 28F | Availability, role and whether the action family may be requested. |
| Relationship state | 28D | Trust, Loyalty, Grievance, Respect and relationship impact inputs. |
| Persuasion/renegotiation | 28E | Whether a negotiable request, hazard escalation or changed term is accepted. |
| Knowledge and comprehension | 28C | What the assignee knows, understands and can truthfully report. |
| Economy and wages | Set 27 | Contract validity, funds, prices, trade and payment outcomes. |
| Health and survival | Set 29 | Injury, illness, fatigue, stamina-related availability and recovery. |
| Movement/pathfinding/travel | Set 30 | Route access, movement, mount/vehicle travel and arrival state. |
| Quest objective truth | Document 15 | Objective completion, failure, contribution and quest branching. |
| Settlement jobs | Document 07 | Routine work, schedules, job tasks and local labour effects. |
| Combat | Document 16 / combat owner | Attacks, damage, capture, death, tactical execution and combat outcomes. |
| Construction/projects | Documents 19/20 | Project stages, material reservations, labour work packages and structure state. |
| Inventory and item custody | Items/Inventory | Real ownership, quantities, durability and transfers. |
| Magic/rituals | Document 09 | Spell, ritual, mana, corruption and magical effect resolution. |
| Automation | Document 08 | Machine output, throughput, faults, networks and resource flow. |

## 2.3 The Domain-Owner Rule

Whenever a delegated assignment requests an effect owned elsewhere, 28G submits an **authoritative request** to that owner and waits for a result. 28G never writes another system's mutable truth directly.

Example:

1. 28G records: “Mara accepted delivery of 12 medicine bundles to Stonebridge.”
2. Inventory service transfers 12 medicine bundles into Mara's custody.
3. Set 30 resolves travel progress and route accessibility.
4. Any combat encounter resolves through Combat.
5. Inventory service commits the delivery to the destination store.
6. Document 15 sees the authoritative delivery event and may advance a quest objective.
7. 28G records the assignment evidence and report.
8. 28D may apply relationship effects from reliability, risk and outcome.

# 3. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Core Model | Delegation is persistent orchestration over authoritative external gameplay systems, not an independent result simulator. |
| Primary Assignee | Set 28 companions and explicitly authorised delegation-capable agents. Ordinary settlement jobs remain Document 07. |
| Assignment Structure | Goal + target + constraints + authority + briefing + resources + deadline + reporting + domain-adapter plan. |
| Acceptance | 28F standing permission is checked first; 28E resolves negotiable acceptance when needed. |
| Knowledge | Assignee knowledge is explicit. No task begins with information the agent does not possess unless a valid briefing transfers it. |
| Travel | Set 30 owns journey feasibility, time, pathing and arrival. |
| Economy | Set 27 owns payment, prices, purchases, sales, wages, trade and contract economics. |
| Health | Set 29 owns injury, illness, fatigue and recovery. |
| Quests | Document 15 owns quest objectives and branching. Delegation contributes only through authoritative evidence. |
| Combat | Combat owner resolves battles. Assignment constraints can limit engagement intent but cannot guarantee survival or victory. |
| Off-Screen | Use bounded checkpoints and external-domain summaries; never simulate every second and never skip required transactions. |
| Risk | Show knowledge-bounded qualitative risk; hidden facts remain hidden. No universal “72% mission success” meter by default. |
| Failure | Prefer specific recoverable causes: route blocked, target moved, permission denied, supplies exhausted, injury, capture, deadline missed, refusal, etc. |
| Reporting | Reports distinguish observed fact, inferred conclusion, hearsay, missing evidence and unknown status. |
| Autonomy | Assignee may adapt methods within accepted constraints; changing material terms may require reapproval. |
| Cancellation | Recall/cancel is a request that must itself respect communication, travel and current crisis state. |
| Multiplayer | Server/host owns assignment mutations, custody, external effects and final state. |
| Persistence | Assignment state, resources, targets, phases, evidence and correlation IDs survive save/load and LOD transitions. |
| Exploit Control | No teleporting agents, free scouting, duplicated cargo, background boss kills, impossible construction or automatic quest completion. |

# 4. Delegation Architecture Overview

The canonical architecture is:

**Intent → Eligibility → Permission → Briefing → Acceptance → Assignment Commit → External Execution Plan → Checkpoints → Evidence → Report → Social/Quest Consequences**

Each stage can fail independently with a stable reason code.

## 4.1 Assignment Envelope

A committed assignment contains at minimum:

- assignment instance ID;
- issuer ID and authority basis;
- assignee ID;
- assignment family and goal;
- target bindings;
- accepted constraints;
- deadline/urgency;
- supplied knowledge/briefing references;
- supplied resources and custody references;
- economic contract reference if any;
- relevant quest/event/objective references;
- permitted domain adapters;
- reporting expectations;
- current phase and status;
- evidence ledger;
- recent blockers;
- save/LOD fields;
- social consequence correlation ID.

## 4.2 No Single “Mission Roll”

A delegated assignment is not resolved by one hidden roll. A scout's outcome can depend on:

- whether Set 30 can route them to the area;
- whether they have the right map knowledge;
- whether weather or world events change the route;
- whether a hostile encounter occurs;
- whether Combat resolves it safely;
- whether they recognise what they observe through 28C knowledge;
- whether they have enough supplies under Set 29;
- whether they decide to withdraw under 28F/28G permissions;
- whether they physically return or can communicate remotely.

A short assignment may still resolve in one checkpoint if the external owners can authoritatively summarise it. The important rule is that the summary comes from the owning systems, not from 28G inventing the outcome.

# 5. Command, Order, Request, Assignment and Standing Instruction Vocabulary

Shared terminology must remain consistent.

| Term | Meaning | Persistence |
| --- | --- | --- |
| **Command Intent** | Player input expressing a desired action before authority/consent validation. | Usually transient. |
| **Request** | A socially framed ask that the recipient may accept, refuse or negotiate. | May become a conversation/social record. |
| **Order** | A request issued under a recognised authority/service relationship where compliance is expected but still bounded by permissions and refusal rules. | Usually short-lived unless converted to assignment. |
| **Immediate Directive** | A bounded present-context instruction such as wait, regroup, avoid combat, defend this point, return to camp. | Active until satisfied, replaced or invalidated. |
| **Delegated Assignment** | Persistent goal-oriented work that may continue without the issuer being present. | Full persistent record. |
| **Assignment Phase** | One operational segment of a delegated assignment. | Persistent while active. |
| **Standing Instruction** | Assignment-level policy applied to a defined class of future decisions, such as “avoid lethal force unless attacked.” | Persistent only while its parent assignment or explicit profile permits. |
| **Permission Profile** | 28F-owned standing social permission boundary for the companion. | Persistent companion state, not owned by 28G. |

## 5.1 An Order Does Not Cancel Personhood

“Order” describes authority context, not mind control. A sworn guard may be expected to obey a lawful post order; a hired guide may be expected to follow the agreed route; a friend travelling voluntarily may treat the same instruction as a request. Hard personal, legal or social boundaries can still cause refusal, renegotiation or later grievance.

# 6. Definition, Runtime Record and Domain-Effect Separation

| Layer | Owns | Example |
| --- | --- | --- |
| Assignment Family Definition | Reusable goal structure, compatible targets, allowed adapters, default constraints, reporting schema. | `assignment.scout.location` |
| Assignment Instance | Issuer, assignee, target, accepted terms, phases, evidence, state. | Scout assignment 01J... |
| External Domain State | Travel, inventory, combat, quest, project, economy, health, etc. | Route segment complete; medicine transferred. |
| Presentation | UI cards, map indicators, companion dialogue, notifications. | “Mara is delayed by a blocked pass.” |

> **Data Rule**  
> Assignment definitions are immutable/versioned content. Assignment instances store only the current commitment and references to authoritative external state. Domain effects remain in their owning systems.

# 7. Delegation-Capable Agents and Eligibility

The primary assignees are persistent agents with a valid authority path.

Supported categories may include:

- active companion;
- reserve companion;
- hired follower;
- retainer;
- faction-assigned agent;
- quest ally explicitly marked delegation-capable;
- player-settlement specialist with a valid authority link;
- compatible creature companion;
- compatible golem/construct through its owner system;
- authorised team or party represented by an external group adapter.

## 7.1 Eligibility Checks

Before creating a proposal, check:

- persistent identity exists;
- actor is alive/valid and not irreconcilably missing;
- companion/agreement permits assignment class;
- current availability permits commitment;
- required authority exists;
- role/capability is at least plausible;
- target exists or the assignment explicitly supports uncertain targets;
- issuer knows enough to formulate the request;
- no hard legal/system blocker forbids issuing it;
- active assignment capacity has not been exceeded.

## 7.2 Ordinary Villagers

An ordinary villager does not become a 28G subordinate merely because the player can talk to them. If the player wants settlement labour performed, the request must enter Document 07/19/20 through a valid project, job, contract or settlement-authority interface. 28G may hold the social agreement to perform an exceptional task only if an explicit adapter grants that authority.

# 8. Issuer Authority, Ownership and Permission

The issuer must have a valid basis for asking the assignee to act.

Authority bases include:

- voluntary companion relationship;
- current paid service contract;
- guard/retainer duty;
- faction mandate;
- settlement leadership role;
- quest or event mandate;
- explicit one-off consent;
- legal office where supported;
- construct ownership/control authority from its owning system.

Authority never grants ownership of another person's body, beliefs or private possessions.

## 8.1 Authority Scope

An assignment stores an `authority_scope` describing what the issuer may decide. Examples:

- destination only;
- destination + method family;
- resource budget;
- combat engagement policy;
- purchasing limit from Set 27;
- reporting deadline;
- secrecy requirement;
- authority to recruit temporary assistance;
- authority to abandon cargo to save life;
- authority to return early if conditions exceed threshold.

# 9. Assignment Creation and Acceptance Flow

Canonical flow:

1. **Select assignee.**
2. **Select or formulate goal.**
3. **Bind known target or target query.**
4. **Build known context.**
5. **Resolve 28F action permission.**
6. **Check external hard constraints.**
7. **Assemble briefing and resource offer.**
8. **Preview known risk and expected duration using external interfaces.**
9. **Resolve social acceptance through 28E if required.**
10. **Commit assignment atomically.**
11. **Reserve/transfer any real resources through owning systems.**
12. **Schedule first execution phase.**
13. **Emit `DelegatedAssignmentCommitted` event.**

## 9.1 Commit Is Atomic

The assignment must not enter `ACTIVE` if required resource custody, contract, target binding or authority checks fail halfway through. Either all mandatory commit preconditions succeed or the proposal remains uncommitted with a reason.

# 10. Consent, Refusal and Renegotiation

28G consumes 28F's standing permissions and 28E's social resolution.

Possible pre-commit outcomes:

- accepted;
- accepted with conditions;
- counterproposal;
- delayed pending prerequisite;
- refused for hard boundary;
- refused for personal reason;
- refused for contract/authority reason;
- unavailable;
- target/route impossible;
- insufficient briefing;
- insufficient resources;
- issuer lacks authority.

## 10.1 Mid-Assignment Renegotiation

Materially changed conditions may require renewed consent, especially when:

- danger exceeds the accepted class;
- lethal force becomes necessary where it was forbidden;
- destination changes substantially;
- deadline becomes much tighter;
- required cost exceeds budget;
- secrecy terms change;
- the assignee discovers a moral or personal conflict;
- a family/faction duty becomes urgent;
- a contract expires.

If communication is impossible, the assignee uses accepted autonomy rules rather than magically asking the player.

# 11. Assignment Goal Model

A goal describes a desired outcome without prescribing every physical step.

Core goal families:

- travel/reach;
- scout/survey;
- investigate;
- deliver/transport;
- acquire/purchase;
- produce/craft;
- construct/repair;
- escort/protect;
- defend/hold;
- hunt/capture;
- negotiate/deliver message;
- teach/train;
- research/analyse;
- ritual/maintain magical process;
- rescue/evacuate;
- retrieve/recover;
- monitor/observe for a bounded period;
- report/contact;
- multi-stage composite assignment.

## 11.1 Goal Completion Evidence

Every goal family declares what counts as completion evidence. Examples:

- destination arrival event;
- inventory transaction receipt;
- project-stage event;
- quest-objective contribution event;
- survey observation record;
- signed contract reference;
- combat/capture historical event;
- rescued actor arrival state;
- ritual completion event;
- report delivered with required evidence items.

# 12. Constraints, Permissions and Forbidden Methods

Assignment-specific constraints refine, but cannot expand beyond, 28F standing permissions unless separately renegotiated.

Constraint families include:

- lethal force allowed / defensive only / prohibited;
- theft prohibited;
- trespass prohibited;
- forbidden magic prohibited;
- avoid named factions;
- do not enter specific hazard classes;
- do not consume specified cargo;
- preserve secrecy;
- do not reveal issuer identity;
- maximum spend;
- maximum acceptable delay;
- minimum evidence quality;
- return if injured above external threshold;
- abandon mission if route loses safety classification;
- preserve target alive;
- prioritise civilians over cargo;
- do not recruit extra help without permission.

## 12.1 Method Freedom

Within those boundaries, a capable agent may choose sensible methods. A courier need not ask the player which side of every tree to walk around. A scout may choose a ridge rather than a road. A diplomat may schedule a meeting within the accepted deadline. The external systems still validate all effects.

# 13. Briefing, Knowledge and Language Requirements

A task can fail before it starts because the assignee does not understand it.

A briefing may transfer:

- target identity;
- location knowledge;
- map references;
- route suggestions;
- passwords or permits;
- known hazards;
- faction context;
- relevant rumours with confidence;
- item identification;
- expected contact person;
- success criteria;
- forbidden methods;
- return/report instructions.

28C owns the resulting knowledge and comprehension.

## 13.1 Briefing Fidelity

If the issuer says “Find the old tower north of the red river” but neither party has a precise map, the assignment stores that uncertainty. Set 30 and world search adapters cannot convert vague knowledge into an exact hidden coordinate.

## 13.2 Language and Literacy

Written orders, maps and reports require appropriate language/literacy or interpreter support. 28G records that a briefing artifact exists; 28C decides whether the assignee can understand it.

# 14. Target Binding, World Anchors and Discovery Confidence

Targets bind through stable world references rather than display names alone.

Target forms:

- persistent entity ID;
- structure instance ID;
- settlement ID;
- known route/waypoint ID;
- region ID;
- item/cargo lot ID;
- project instance ID;
- quest objective binding;
- known map marker;
- bounded search query with knowledge limits;
- contact identity or role query.

## 14.1 Unknown Targets

Assignments may intentionally involve search, such as “Find the missing caravan somewhere along the eastern road.” Such a target remains a **search constraint**, not a secretly resolved exact location.

# 15. Capability, Skill, Tool and Specialist Requirements

28G asks external capability providers whether the assignment is plausible.

Capabilities may include:

- field navigation;
- climbing/swimming/environmental traversal;
- combat proficiency;
- healing/medicine;
- language/interpreting;
- diplomacy;
- trading;
- mining;
- construction;
- crafting/smithing;
- magical school knowledge;
- ritual qualification;
- research/analysis;
- stealth/scouting;
- animal handling;
- vehicle operation;
- legal authority;
- faction access.

Low capability usually changes speed, available methods, confidence or refusal rather than producing arbitrary dice failure.

# 16. Equipment, Supplies, Cargo, Funds and Custody

Delegation must conserve real property.

Assignment resource package may reference:

- equipped gear;
- borrowed equipment;
- consumable supplies;
- medicine;
- food/water as defined by Set 29/world settings;
- maps and knowledge items;
- tools;
- cargo;
- money or spending authority;
- quest items;
- keys/permits;
- mount/vehicle assignment;
- ritual components;
- emergency reserve.

## 16.1 Custody Chain

Every transferred item or fund uses the owning transaction service. 28G stores transaction IDs and custody purpose only.

Possible custody states:

- retained by issuer;
- transferred to assignee;
- reserved for assignment;
- consumed by external system;
- delivered;
- lost/stolen/destroyed through authoritative event;
- recovered;
- returned.

## 16.2 No Synthetic Mission Inventory

28G may not create a hidden mission inventory that exists only because an agent unloaded. Distant simulation uses the same authoritative inventories or compressed equivalent records.

# 17. Time, Urgency, Deadlines and Scheduling

Assignments may be:

- immediate;
- same-day;
- scheduled start;
- deadline-bound;
- open-ended with check-in intervals;
- recurring for a bounded term;
- event-triggered;
- return-before-condition.

Document 18's authoritative simulation clock and scheduler own time progression. 28G records assignment timing and schedules checkpoints.

## 17.1 Deadline Meaning

A deadline can be:

- hard failure after time;
- reduced reward after time;
- escalation trigger;
- social promise;
- advisory target;
- phase deadline within a longer assignment.

Document 15 owns quest deadline consequences when linked to a quest.

# 18. Risk, Uncertainty and Known-Stakes Presentation

Risk is contextual and knowledge-bounded.

Risk families may include:

- travel hazard;
- environmental exposure;
- hostile territory;
- combat threat;
- legal/political risk;
- social/reputation risk;
- resource insufficiency;
- route uncertainty;
- target uncertainty;
- time pressure;
- magical instability;
- health strain;
- cargo value/robbery risk.

## 18.1 No Omniscient Risk Percentage

Player-facing risk should usually appear as:

- low / routine;
- moderate;
- high;
- extreme;
- unknown;
- conflicting information;
- insufficient knowledge.

The estimate must be traceable to what the party knows. Hidden ambushes remain hidden unless discovered.

# 19. Travel and Route Handoff to Set 30

Set 30 owns physical and abstract travel.

28G can request:

- destination intent;
- route constraints;
- travel urgency;
- allowed mount/vehicle usage;
- passenger/cargo assignment intent;
- avoid-region tags;
- rendezvous/return target.

Set 30 returns authoritative values such as:

- route accessibility;
- expected travel time based on known route;
- travel state;
- arrival/failure/delay events;
- transport capacity;
- route interruption.

## 19.1 Route Blocked Is Not Mission Failure by Definition

A blocked route may lead to:

- alternate route attempt;
- waiting;
- return;
- request for new instructions;
- assignment suspension;
- deadline failure if time expires.

28G decides assignment semantics; Set 30 decides whether travel is possible.

# 20. External Domain Adapter Architecture

Every task family that changes another gameplay system uses a **Domain Adapter**.

A domain adapter exposes:

- capability check;
- precondition check;
- estimated work/time information where allowed;
- authoritative command/request submission;
- progress/checkpoint query;
- completion evidence;
- failure reason;
- cancellation semantics;
- LOD summary capability;
- persistence references.

## 20.1 Adapter Invariant

An adapter cannot write state outside its own owner. It translates 28G assignment intent into the external owner's native request.

# 21. Quest and Event Integration

Document 15 owns quest objective truth.

28G may link an assignment to:

- one quest objective;
- several compatible objectives;
- an event response;
- a player-created objective;
- no quest at all.

The assignment can contribute only when Document 15 receives valid completion evidence from the external owner.

## 21.1 Delegation Does Not Auto-Complete Story

An authored story may require the player personally to witness, decide, speak, bind, choose or perform something. Such objectives declare `delegation_allowed = false` or restricted delegation modes.

## 21.2 Quest Changes While Agent Is Away

If the quest target moves or branch changes:

- Document 15 emits invalidation/update information;
- 28G compares the change with the accepted instruction envelope;
- the agent may replan if equivalent;
- otherwise the assignment suspends, aborts or awaits new instructions.

# 22. Economy, Contracts and Set 27 Integration

Set 27 owns:

- wages;
- purchases/sales;
- pricing;
- contract economic terms;
- trade routes/profit;
- taxes/tolls;
- budgets;
- economic penalties.

28G may delegate actions such as:

- buy up to a specified budget;
- sell cargo subject to minimum terms;
- deliver contracted goods;
- collect payment;
- hire transport if contract permits;
- negotiate within economic bounds supplied by Set 27.

## 22.1 Spending Authority

A spending instruction references Set 27's validated budget/contract. 28G cannot create unlimited companion money.

## 22.2 Payment for the Assignment

A hireling's compensation remains Set 27 truth. 28G tracks whether payment status affects assignment willingness or report disputes only through `CompanionContractStatus()`.

# 23. Survival, Injury, Fatigue and Set 29 Integration

Set 29 determines whether the assignee is biologically able to continue.

Possible assignment-facing states include:

- fit;
- strained;
- fatigued;
- injured;
- ill;
- incapacitated;
- recovering;
- medically restricted.

28G can define accepted withdrawal rules, for example:

> “Return if you become seriously injured.”

But Set 29 defines what “seriously injured” means.

## 23.1 Care Is Not a Hidden Cost

Food, medicine and rest used during an assignment must be consumed through their authoritative systems when those mechanics are enabled.

# 24. NPC Village Jobs and Document 07 Integration

Document 07 owns ordinary settlement schedules, job tasks and work selection. 28G must not convert every local work order into a delegated companion assignment.

Integration patterns:

- temporary release from job duties before assignment;
- exceptional external task accepted by a resident;
- settlement-authorised messenger/scout assignment;
- player leadership task routed into village job/project systems;
- companion returning to normal job after completion;
- ordinary task pre-empted only through valid priority/authority rules.

## 24.1 Commitment Priority

A committed delegated assignment sits alongside Document 07's “committed work” layer. Emergency overrides may interrupt it, but ordinary idle/job utility cannot silently erase it.

# 25. Construction, Repair and Settlement Project Delegation

28G may assign a companion to:

- inspect a damaged structure;
- deliver materials;
- join an authorised project labour pool;
- repair within a valid work package;
- oversee a project if qualified;
- survey a site;
- report blockers.

Documents 19/20 and the project service own:

- project selection;
- site validity;
- reservations;
- exact material consumption;
- labour progress;
- block edits;
- commissioning;
- structure state.

A companion cannot “build a tower off-screen” unless the construction owner confirms valid work packages, resources, labour time and authoritative stage progress.

# 26. Combat, Defence, Hunt and Capture Delegation

Combat-related assignments may include:

- guard a site;
- escort a person;
- scout hostile territory;
- hunt a creature;
- capture alive;
- sabotage a camp where rules permit;
- defend a caravan;
- rescue a captive;
- avoid engagement and observe only.

28G provides:

- objective;
- engagement constraints;
- withdrawal priorities;
- target identity/knowledge;
- reporting requirements.

Combat owns:

- detection;
- combat actions;
- damage;
- morale/tactical resolution;
- capture;
- surrender;
- death;
- loot resulting from combat.

## 26.1 No Background Boss Farming

Bosses, major authored encounters and encounters requiring player mechanics may be marked non-delegable or require explicit simulation support. 28G cannot turn high-level companions into an automatic boss-kill machine.

# 27. Exploration, Scouting, Survey and Investigation Delegation

These assignments are core use cases for 28G.

Possible outputs:

- discovered route segment;
- verified landmark;
- resource observation;
- threat observation;
- map annotation;
- witness interview record;
- sample item;
- photograph/sketch/map note if supported;
- “nothing found within searched bounds” evidence;
- incomplete search due to risk/time.

28C determines what the scout can recognise and how confidently they report it.

## 27.1 Scouting Does Not Reveal the Seed

Off-screen scouting may discover only what the agent could plausibly reach and perceive under world knowledge and simulation rules. It cannot expose all structures in a region merely because the region is procedurally knowable to the engine.

# 28. Delivery, Hauling, Courier and Logistics Delegation

Delivery assignments bind:

- source inventory/custody;
- cargo lot;
- destination owner/inventory/site;
- route intent;
- delivery permission;
- deadline;
- loss handling;
- return/report instructions.

A delivery completes only after an authoritative inventory transfer at the destination.

## 28.1 Cargo Loss

Cargo may be lost only through a valid external event such as:

- theft;
- combat;
- destruction;
- abandonment under accepted safety rule;
- spoilage if owning system applies it;
- confiscation under law;
- accidental loss if a domain owner explicitly supports it.

28G cannot invent cargo loss as flavour text without state change.

# 29. Diplomacy, Negotiation and Social Delegation

Delegation may ask an eligible representative to:

- carry a message;
- request a meeting;
- present an offer;
- negotiate within a mandate;
- seek testimony;
- mediate a dispute;
- request passage;
- deliver an apology;
- gather social intelligence.

28E owns contested social resolution. Set 27 owns economic terms. Faction/governance systems own treaty and political validity.

## 29.1 Mandate Bounds

The assignment must state what the representative may promise. An envoy cannot give away settlement land, sign an alliance or spend unlimited funds unless the relevant authority explicitly grants that mandate.

# 30. Research, Teaching, Magic and Ritual Delegation

Possible assignments:

- analyse a sample;
- consult an archive;
- teach an apprentice;
- prepare ritual components;
- maintain a ward;
- calibrate a mana device;
- investigate corruption;
- carry a sealed magical item;
- perform an authorised ritual where the Magic system allows delegation.

The owning research/magic systems determine progress, risks and effects.

## 30.1 Knowledge Outcome

Research can generate knowledge records rather than “research points” owned by 28G. The assignee must later transmit those findings through 28C-compatible reporting.

# 31. Rescue, Escort, Care and Evacuation Delegation

Rescue and escort tasks often span several owners.

Example rescue:

1. Set 30 travels to last-known position.
2. 28C supports search knowledge.
3. Combat may resolve hostile contact.
4. Set 29 resolves victim condition.
5. Set 30 resolves return transport.
6. Document 15 may advance rescue objective.
7. 28G assembles report and social consequences.

The assignment can prioritise “person over property” so cargo may be abandoned under crisis without counting as disobedience.

# 32. Assignment Lifecycle State Machine

Canonical states:

1. **Draft**
2. **Proposed**
3. **Negotiating**
4. **AcceptedPendingCommit**
5. **Committed**
6. **Preparing**
7. **Departing**
8. **Executing**
9. **WaitingExternal**
10. **Suspended**
11. **AwaitingInstruction**
12. **Returning**
13. **AwaitingReport**
14. **Completed**
15. **PartiallyCompleted**
16. **Failed**
17. **Cancelled**
18. **Abandoned**
19. **AssigneeMissing**
20. **AssigneeCaptured**
21. **AssigneeDead**
22. **Archived**

## 32.1 State Transition Rule

Every consequential transition records:

- previous state;
- new state;
- world time;
- cause/reason code;
- external evidence references;
- initiator if applicable;
- whether social/quest consequences have been emitted;
- replication and save class.

# 33. Execution Plans, Phases and Checkpoints

An assignment may be decomposed into phases, for example:

**Prepare → Travel Out → Search → Interact/Perform Work → Return → Report**

Phases are orchestration, not duplicated gameplay.

Each phase declares:

- responsible domain adapter;
- prerequisites;
- success evidence;
- recoverable blockers;
- timeout/deadline relation;
- next phase rules;
- permitted replanning;
- checkpoint interval or event trigger.

## 33.1 Checkpoints

Checkpoints occur when:

- a domain action completes;
- travel reaches a route node/region;
- a deadline approaches;
- risk materially changes;
- health availability changes;
- required resource falls below threshold;
- target invalidates;
- the world simulation promotes/demotes the agent;
- the player requests status and communication is possible.

# 34. Interruptions, Emergencies and Priority Overrides

External crises may interrupt assignments.

Priority examples:

1. immediate survival/self-preservation;
2. emergency rescue or lawful crisis override where applicable;
3. active combat/escape;
4. committed assignment critical phase;
5. assignment normal phase;
6. ordinary job/schedule;
7. social/idle behaviour.

This ordering is contextual, not universal law. A sworn guard may prioritise settlement defence over the player's courier job. A parent may prioritise a child's emergency under personality/relationship rules.

## 34.1 Interruption Does Not Erase Commitment

When interrupted, the assignment records:

- interrupter;
- time;
- phase;
- resources/custody;
- whether progress is preserved;
- whether the assignment can resume;
- whether deadline changed;
- whether issuer must be informed.

# 35. Replanning, Substitution and Adaptive Autonomy

An agent can adapt without becoming omniscient.

Allowed replanning may include:

- choose alternate known route;
- wait for weather/event window;
- use a permitted transport method;
- buy a permitted replacement item within budget;
- seek a permitted healer;
- ask a known contact for directions;
- return early;
- change search order;
- substitute an allowed material/provider if the external system permits it.

Not allowed without new authority:

- change core destination for convenience;
- spend beyond mandate;
- violate explicit no-kill/no-theft constraint;
- use forbidden magic;
- expose secrets;
- abandon a protected person to save ordinary cargo;
- invent a new quest solution not accepted by the relevant owner.

# 36. Dynamic World Change and Invalidation

Assignments must survive a living world.

Possible changes:

- target dies;
- target moves;
- structure destroyed;
- route closes;
- war begins;
- faction becomes hostile;
- contract expires;
- destination changes ownership;
- quest branch changes;
- required item becomes unavailable;
- portal closes;
- weather/event makes route temporarily unsafe;
- issuer loses authority;
- assignee leaves companion status.

Each assignment family defines fallback policy:

- rebind equivalent target;
- wait;
- return;
- request instructions;
- convert to investigation;
- partial complete;
- fail with evidence;
- cancel without blame.

# 37. Partial Completion and Progressive Deliverables

Not all useful work is binary.

Examples:

- scout mapped 60% of intended route before retreating;
- courier delivered half the cargo after a theft event;
- researcher identified three of five samples;
- diplomat secured safe passage but not reduced tolls;
- rescue team found the target but could not transport them;
- builder completed authorised repair stage one.

Partial completion stores **specific evidence**, not an arbitrary percentage alone.

# 38. Failure Classes and Recoverable Failure

Failure categories:

- eligibility failure;
- refusal;
- authority failure;
- briefing failure;
- target invalidation;
- route failure;
- resource/supply failure;
- economic budget failure;
- health/incapacitation;
- combat defeat;
- capture;
- death;
- legal/permission denial;
- deadline expiry;
- external-system failure;
- communication loss;
- voluntary withdrawal within accepted policy;
- disobedience/breach;
- corrupted/incompatible save state.

## 38.1 Failure Is Not Automatically Social Failure

A companion who returns because a bridge collapsed did not betray the player. A companion who knowingly sold assigned cargo for personal gain may have committed a serious breach. Social interpretation uses cause, intent, accepted constraints and evidence.

# 39. Cancellation, Recall, Suspension and Abandonment

## 39.1 Cancellation

Cancellation terminates the goal before completion. It can be initiated by issuer, assignee, external authority or world invalidation depending on rules.

## 39.2 Recall

Recall means “return or disengage as soon as reasonably possible.” It is not teleportation. Communication must reach the assignee if they are distant.

## 39.3 Suspension

Suspension preserves the assignment and current custody while waiting for a recoverable condition.

## 39.4 Abandonment

Abandonment is intentional disengagement from the assignment without normal completion or authorised cancellation. Whether it is justified, neutral, desertion or betrayal is resolved through 28F/28D context.

# 40. Return, Rendezvous and Post-Assignment Transition

After field work, the assignee may:

- return to issuer;
- return home;
- rendezvous at agreed location;
- remain at destination;
- transition directly to another accepted assignment;
- become unavailable due to treatment/recovery;
- remain missing/captured;
- report remotely if communication permits.

Set 30 owns physical return travel.

# 41. Reports, Evidence, Proof and Accountability

A report is a structured social-information product, not merely flavour text.

Report fields may include:

- assignment ID;
- reporter;
- time/location of report;
- completed goals;
- incomplete goals;
- observed facts;
- inferred conclusions;
- hearsay/rumours;
- evidence items/references;
- resource/cargo accounting;
- injuries/losses;
- unexpected events;
- decisions made under autonomy;
- constraints violated or preserved;
- requested follow-up;
- confidence and unknowns.

## 41.1 Proof Strength

The player may choose to accept a verbal report, require an item, witness statement, receipt, map, signed document or other evidence depending on task. 28C owns confidence/provenance; 28G owns whether the assignment's reporting requirement was satisfied.

# 42. Knowledge Transfer and 28C Integration

The assignee learns while executing the assignment through valid observations and sources. They do not automatically upload all new knowledge to the player.

Information transfer can occur via:

- face-to-face report;
- written letter;
- messenger;
- magical communication if supported;
- shared map artifact;
- party communication rule;
- public event knowledge.

28C resolves comprehension, belief and provenance.

# 43. Relationship, Loyalty and Social Consequence Integration

Delegation creates relationship material when the event is meaningful.

Possible positive influences:

- trusted with meaningful responsibility;
- issuer supplied adequate equipment;
- issuer respected boundaries;
- rescue/backup arrived when promised;
- fair recognition/payment;
- assignee succeeded and gained respect;
- issuer accepted honest failure.

Possible negative influences:

- reckless under-briefing;
- deliberate concealment of known danger;
- repeated impossible demands;
- unpaid promised compensation;
- abandonment;
- blame despite evidence of justified withdrawal;
- coerced immoral action;
- broken extraction/rescue promise;
- taking credit while denying contribution.

28D owns the actual relationship changes.

# 44. Rewards, Payment, Recognition and Contribution

28G records **who contributed what** to the assignment. External systems own actual rewards.

Reward families:

- Set 27 payment;
- quest rewards from Document 15;
- reputation/relationship recognition;
- progression XP/skill credit from progression owner;
- items/loot through inventory systems;
- titles/permissions through owning faction/governance system;
- public history/commendation;
- companion-specific appreciation.

## 44.1 No Double Reward Farming

One real action may legitimately contribute to multiple systems, but duplicate payment or quest-reward exploits are prevented by correlation IDs and contribution policy.

# 45. Disputes, Blame, Missing Evidence and Conflicting Accounts

Assignments can produce disputes.

Examples:

- cargo is missing and the courier claims raiders stole it;
- a witness says the companion abandoned civilians;
- the companion says the route was impossible;
- the client says goods arrived late;
- the player believes a scout hid a discovery;
- economic contract says payment was made but assignee believes otherwise.

28G stores competing assignment claims. 28C owns beliefs/evidence. 28D/28E resolve social interpretation. Legal guilt belongs to justice/governance systems.

# 46. Off-Screen Resolution Architecture

Off-screen assignment processing follows one principle:

> **Abstract representation may compress work; it may not change the rules of what work is possible.**

A distant assignment is processed as a sequence of bounded authoritative checkpoints rather than frame-by-frame acting.

Example courier summary:

1. Set 30 advances travel to next region checkpoint.
2. Event/route systems determine any authoritative disruption.
3. Set 29 applies bounded biological passage of time.
4. Inventory remains unchanged unless a real event/consumption rule modifies it.
5. Destination transfer commits when the courier reaches a valid endpoint.
6. 28G records completion evidence.

## 46.1 What May Be Abstracted

- exact walking animation;
- individual footsteps;
- repeated routine path nodes;
- visually simulated eating/resting where external owner provides equivalent summary;
- ordinary low-risk waiting;
- non-interactive travel segments;
- repeated work animation.

## 46.2 What May Not Be Hand-Waved

- resource creation or destruction;
- death/injury without authoritative owner;
- crossing an impossible route;
- bypassing locked doors/permissions;
- quest-state transitions;
- purchase/sale prices;
- boss or major combat outcomes;
- structure construction without materials/work packages;
- knowledge discovery without search/observation;
- item delivery without transfer;
- treaty/contract outcomes without authority.

# 47. Simulation LOD and Distant Assignment Representation

Recommended assignment-facing LOD:

| Tier | Representation | Delegation Behaviour |
| --- | --- | --- |
| L0 - Immediate | Full scene actor near player. | Physical execution and frequent state updates. |
| L1 - Reduced Local | Lightweight actor/low-rate simulation. | Same task state; fewer presentation updates. |
| L2 - Chunk/Settlement Summary | Compact task and route records. | Scheduled checkpoint batches; exact important transactions. |
| L3 - Regional Abstract | Persistent assignment + route/domain summaries. | Bounded event-driven processing. |
| L4 - Dormant/Waiting | Identity, assignment and wake conditions only. | No fabricated progress until valid scheduled/domain condition. |

## 47.1 LOD Invariants

Across promotion/demotion preserve:

- assignee identity;
- assignment ID/state;
- target binding;
- cargo/resource custody;
- current phase;
- deadline;
- known knowledge;
- external-domain correlation IDs;
- injury/condition references;
- evidence ledger;
- social commitment;
- last valid location/route anchor.

# 48. Deterministic Checkpoints, Seeds and Bounded Uncertainty

Where an owning system supports stochastic outcomes, the result must be deterministic for the same authoritative state and assignment checkpoint.

A checkpoint seed may derive from:

- world seed;
- assignment ID;
- phase ID;
- checkpoint sequence;
- external event seed;
- region/route identity.

28G itself should not invent generic random “mission luck.” Randomness belongs to the relevant domain or event system.

## 48.1 Stable Replay

Save/load immediately before a checkpoint must not allow infinite rerolling unless the external owner explicitly treats that result as non-deterministic by design.

# 49. Resource-Conservation and No-Teleport Rules

Hard invariants:

- assignees occupy a valid location/route anchor;
- cargo has one authoritative owner/custodian at a time;
- purchases deduct real funds;
- deliveries transfer real quantities;
- construction consumes reserved resources through project service;
- travel time is not skipped unless a valid fast-travel system owns it;
- recalled companions do not instantly appear;
- lost resources require an authoritative cause;
- duplicated retries must be idempotent.

# 50. Promotion, Demotion and Reconciliation

When a distant assignee becomes visible:

1. resolve all committed checkpoints up to promotion boundary;
2. ensure no half-applied atomic transaction remains;
3. reconstruct position from Set 30 route state;
4. reconstruct equipment/inventory from authoritative records;
5. restore current assignment phase;
6. instantiate presentation actor;
7. continue from the same commitment.

When demoting:

- finish/cancel non-serialisable immediate actions;
- write route/location anchor;
- persist current resources and condition;
- preserve assignment reservations;
- record exact external correlation IDs;
- remove presentation actor only after state commit.

# 51. Persistence, Save/Load, Migration and Recovery

Persistent minimum:

- assignment instance ID;
- definition/revision;
- issuer/assignee;
- authority basis;
- status and phase;
- target bindings;
- accepted constraints;
- briefing refs;
- resource/custody refs;
- external contract/quest/project refs;
- current route/travel ref;
- deadline/schedule;
- evidence ledger;
- blocker/reason;
- history;
- schema version.

## 51.1 Save During External Work

If an external domain operation is mid-transaction, save only a state that can safely resume or reconcile. The assignment cannot claim completion before the owner commits.

## 51.2 Recovery

After corrupted or interrupted save recovery:

- preserve resource truth over presentation convenience;
- reconstruct from committed events/transactions;
- mark uncertain assignment state as `REQUIRES_RECONCILIATION` rather than inventing success;
- expose a developer/player-safe reason where appropriate.

# 52. Multiplayer Authority and Shared Delegation

The host/server owns:

- assignment creation/commit;
- accepted assignee state;
- resource transfers;
- external-domain mutations;
- assignment lifecycle;
- final evidence ledger;
- report delivery state.

## 52.1 Issuer Scope

Possible issuer scopes:

- individual player;
- party leader;
- party consensus;
- settlement office;
- faction office;
- quest-authorised player;
- shared companion controller under world settings.

## 52.2 Conflicting Orders

If two players issue incompatible commands to the same companion:

- authority rules decide which request may commit;
- the second request gets a truthful conflict reason;
- no client-side UI order silently overwrites server state;
- social coercion or repeated harassment may be rate-limited and/or recorded.

## 52.3 Shared Contributions

A companion assignment can be funded, supplied or briefed by multiple players while retaining one authoritative assignment instance and contributor ledger.

# 53. UI, Accessibility and Player Readability

The assignment UI should show enough to make informed decisions without exposing hidden simulation truth.

Core player-facing fields:

- assignee;
- goal;
- known destination/target;
- current status;
- known blockers;
- approximate known duration;
- known risk class;
- supplied resources;
- accepted constraints;
- deadline;
- last confirmed update;
- report/evidence when available.

## 53.1 Status Language

Prefer:

- Preparing
- Travelling
- Searching
- Waiting for access
- Delayed by route closure
- Returning
- Needs instructions
- Partially complete
- Report available
- Missing

Avoid opaque codes in ordinary UI.

## 53.2 Hidden Information

Do not display:

- hidden ambush probabilities;
- secret betrayal intent;
- unknown target location;
- exact undiscovered enemy strength;
- secret faction plans;
- future deterministic event result.

## 53.3 Accessibility

Support:

- scalable text;
- non-colour status cues;
- screen-reader-ready labels;
- reduced notification intensity;
- clear confirmation before high-risk delegation;
- plain-language reason codes;
- timeline/history summaries;
- controller navigation;
- optional detailed/compact assignment cards.

# 54. Registries, Runtime Records and Naming

## 54.1 Definition Families

Recommended definition registries:

- `assignment_family_definition`
- `assignment_phase_definition`
- `assignment_constraint_definition`
- `assignment_report_schema`
- `assignment_domain_adapter_definition`
- `assignment_reason_code_definition`
- `assignment_risk_presentation_definition`

## 54.2 Runtime Records

- `DelegatedAssignmentInstance`
- `AssignmentInstructionEnvelope`
- `AssignmentBriefingPackage`
- `AssignmentResourceCustodyLink`
- `AssignmentPhaseState`
- `AssignmentCheckpointRecord`
- `AssignmentEvidenceRecord`
- `AssignmentReportRecord`
- `AssignmentTransitionRecord`
- `AssignmentContributorRecord`

## 54.3 Stable ID Examples

- `leyforge.core.assignment.scout.location`
- `leyforge.core.assignment.deliver.cargo`
- `leyforge.core.assignment.negotiate.mandate`
- `leyforge.core.assignment.rescue.person`
- `leyforge.core.assignment.constraint.no_lethal_force`
- `leyforge.core.assignment.reason.route_inaccessible`

# 55. Reason Codes, Diagnostics and Developer Tools

Core reason codes should include:

| Code | Meaning |
| --- | --- |
| ASSIGNMENT_ASSIGNEE_INVALID | Assignee cannot resolve or is not delegation-capable. |
| ASSIGNMENT_ASSIGNEE_UNAVAILABLE | Current companion/health/status blocks commitment. |
| ASSIGNMENT_PERMISSION_DENIED | 28F permission profile prohibits the action family. |
| ASSIGNMENT_REFUSED | Assignee refused the proposal. |
| ASSIGNMENT_AUTHORITY_INVALID | Issuer lacks authority for requested task. |
| ASSIGNMENT_BRIEFING_INSUFFICIENT | Required knowledge could not be transferred/understood. |
| ASSIGNMENT_TARGET_INVALID | Target cannot resolve under assignment rules. |
| ASSIGNMENT_ROUTE_INACCESSIBLE | Set 30 reports no valid route. |
| ASSIGNMENT_RESOURCE_MISSING | Required real resource is unavailable. |
| ASSIGNMENT_CUSTODY_TRANSFER_FAILED | Required transfer did not commit. |
| ASSIGNMENT_CONTRACT_INVALID | Set 27 contract/terms invalid. |
| ASSIGNMENT_HEALTH_RESTRICTED | Set 29 condition blocks continuation. |
| ASSIGNMENT_DOMAIN_REJECTED | External owner rejected requested action. |
| ASSIGNMENT_TARGET_CHANGED | Target state invalidated accepted plan. |
| ASSIGNMENT_DEADLINE_EXPIRED | Deadline consequence applied. |
| ASSIGNMENT_COMMUNICATION_UNAVAILABLE | Recall/status request cannot reach assignee. |
| ASSIGNMENT_PARTIAL_EVIDENCE | Some deliverables complete, others unresolved. |
| ASSIGNMENT_EVIDENCE_MISSING | Completion claim lacks required proof. |
| ASSIGNMENT_EXTERNAL_TRANSACTION_PENDING | Wait for authoritative commit. |
| ASSIGNMENT_STATE_RECONCILIATION_REQUIRED | Recovery/migration needs deterministic reconciliation. |

## 55.1 Developer Inspector

Inspector should show:

- definition and revision;
- issuer/assignee;
- authority source;
- current state/phase;
- target bindings;
- permissions/constraints;
- briefing knowledge refs;
- resource custody/transaction IDs;
- Set 30 travel state;
- Set 29 condition summary;
- Set 27 contract summary;
- quest/project refs;
- domain adapter state;
- checkpoint schedule;
- evidence ledger;
- recent transitions;
- deterministic seed/correlation IDs;
- save dirty state.

# 56. Validation and Automated Test Strategy

## 56.1 Definition Hard Failures

Fail validation when:

- assignment family has no completion evidence contract;
- required adapter does not exist;
- a definition attempts to mutate another domain directly;
- non-delegable objective is marked delegable without owner approval;
- target query can leak undiscovered world information;
- resource-consuming task lacks transaction owner;
- lethal/illegal method constraints have no semantic tags;
- persistent field lacks migration path;
- report schema references invalid evidence types.

## 56.2 Runtime Invariants

Tests must prove:

- one assignment instance has one authoritative state;
- assignee cannot be duplicated across LOD;
- resources conserve through load/unload;
- recall does not teleport;
- route invalidation creates a blocker, not silent success;
- quest objectives advance only on Document 15 evidence;
- construction advances only through project owner;
- economy changes only through Set 27;
- injuries come only from health/combat/environment owners;
- hidden map content is not revealed by abstract scouting;
- save/load reproduces assignment state;
- repeated network commands are idempotent;
- partial completion retains exact evidence;
- reports do not invent unobserved facts.

## 56.3 Deterministic Scenario Tests

Required scenarios:

1. local scout assignment completes and reports;
2. same scout unloads mid-route and completes through LOD without divergence;
3. blocked bridge forces return without social blame;
4. courier cargo remains conserved across save/load;
5. hired guard contract expires mid-assignment;
6. injured companion is medically unavailable;
7. quest target moves and assignment rebinds or suspends correctly;
8. companion refuses newly required lethal method;
9. multiplayer conflicting orders are rejected deterministically;
10. off-screen combat defeat produces exact authoritative injury/capture/death state;
11. research report contains only learned facts;
12. recall during distant travel reaches agent through valid communication delay.

# 57. Balance Framework and Anti-Exploit Rules

## 57.1 Delegation Should Reduce Repetition, Not Replace Play

Good delegation targets:

- known delivery runs;
- scouting already within agent capability;
- routine inspection;
- bounded research follow-up;
- escort/security work;
- collecting a known item through valid economy/route systems;
- support tasks around settlements and projects.

Tasks often unsuitable for full delegation:

- first-time major story discovery requiring player choice;
- boss mechanics designed around direct play;
- unrestricted deep exploration into unknown world;
- anything that bypasses a progression gate;
- large-scale factory production better served by automation;
- settlement labour better served by Document 07/19/20 systems.

## 57.2 No Companion Labour Exploit

A player cannot keep every NPC permanently on free delegated labour while settlements still count them as fully available workers. Existing jobs, households and service contracts must register absence/commitment.

## 57.3 No Free Risk Transfer

Delegating dangerous work can still cause:

- injury;
- capture;
- death where enabled;
- equipment loss;
- relationship grievance;
- contract cost;
- quest failure;
- faction consequences.

The player is not punished arbitrarily, but delegation is not a magical shield from consequence.

## 57.4 No Save-Reroll Farming

Deterministic checkpoints prevent repeated reloads from generating different rare discoveries or perfect caravan outcomes from identical state.

## 57.5 Assignment Capacity

Do not use a huge artificial global cap if ordinary availability, travel time, companion count and external work already bound scale. For production, however, apply configurable limits to active high-detail assignments per player/server to protect UI and simulation budgets.

# 58. Core Example Scenarios

## 58.1 Scout the Ruin

The player asks Mara, a trusted scout, to inspect an old rune ruin and return before evening.

- 28F reports Mara available and scouting allowed.
- 28C confirms she understands the ruin marker and map.
- 28G records “observe only; avoid combat; return if danger high.”
- Set 30 resolves route.
- A hostile patrol blocks the direct approach.
- Mara's accepted autonomy allows an alternate ridge route.
- She observes a sealed door and mana glow but does not know the rune's exact function.
- She returns with a map annotation and observation record.
- The report says “sealed rune door, active mana signature, purpose unknown,” not an invented dungeon description.

## 58.2 Courier With Real Cargo

A hired courier takes 20 iron fittings to a settlement.

- Inventory transfers exactly 20 fittings into custody.
- Set 27 contract defines payment.
- Set 30 advances travel.
- Save/load occurs mid-route.
- After arrival, destination warehouse commits exactly 20 fittings.
- Document 15 may advance a supply objective from the delivery event.
- 28G closes assignment and Set 27 processes payment.

No duplicate cargo exists at any point.

## 58.3 Bridge Collapse

A companion is ordered to deliver a message through a mountain pass.

- Set 30 later reports the only known bridge destroyed.
- Alternate routes exceed accepted risk/time.
- Companion returns.
- Assignment resolves `FAILED_ROUTE_INVALIDATED` with no disobedience flag.
- 28D does not apply grievance merely because the goal failed.

## 58.4 Dangerous Change Requires Consent

A research assignment becomes a combat rescue when the scholar finds wounded survivors surrounded by raiders.

- Rescue was not part of the original low-risk research agreement.
- Immediate humanitarian assistance may be allowed by personality/permissions, but offensive assault is outside accepted terms.
- If communication is possible, the scholar requests instructions.
- If not, they may withdraw, hide, render limited aid or take another permitted action.
- 28G does not force a scholar into combat because the player would have preferred it.

## 58.5 Delegated Negotiation

A player sends an interpreter-diplomat to negotiate passage through a toll gate.

- 28G gives a mandate: may accept toll up to Set 27 budget limit; may not promise military alliance.
- 28E resolves dialogue/social negotiation.
- Set 27 validates the toll.
- The diplomat secures passage but not reduced price.
- Report returns signed passage permission and terms.

## 58.6 Rescue Assignment

A companion is sent to find a missing miner.

- Search target is last-known area, not exact hidden position.
- 28C/route/search systems constrain the search.
- Miner is found injured.
- Set 29 reports transport permitted but slow.
- Set 30 resolves return time.
- Quest objective completes only when the miner reaches safety.

## 58.7 Construction Assistance

A builder companion is told to help repair a damaged bridge.

- Documents 19/20 expose a valid repair work package.
- Materials are reserved by project system.
- Builder contributes labour.
- 28G tracks assignment phase and report.
- Project owner advances bridge state.

28G never writes bridge voxels directly.

## 58.8 Off-Screen Combat Failure

A guard escort enters an ambush while both guard and player are far apart.

- Combat/event owner resolves the encounter using authoritative distant-combat rules.
- Guard is injured and cargo stolen.
- Set 29 stores injury.
- inventory/event systems store stolen cargo state.
- 28G marks assignment partial/failed based on goal evidence.
- Guard's report, if they return, reflects what they actually perceived.

## 58.9 Recall Is Not Teleportation

The player recalls a companion three regions away.

- 28G records recall request.
- communication succeeds through available channel.
- Set 30 begins return travel.
- UI shows “Returning - approx. 1 day based on known route.”
- Companion remains physically absent until travel completes.

## 58.10 Conflicting Multiplayer Orders

Two players share a faction-assigned guide.

- Player A asks the guide to scout north.
- Server commits the assignment under A's current authority.
- Player B attempts to order the guide south.
- Server rejects with `ASSIGNMENT_CONFLICT_ACTIVE_COMMITMENT` unless B has override authority and the current agreement permits it.
- No client UI can duplicate the guide.

# 59. Production Scope and Staged Delivery

## 59.1 Foundation Stage

Implement:

- assignment definitions/instances;
- companion eligibility;
- simple accepted assignment lifecycle;
- travel adapter;
- inventory delivery adapter;
- reporting;
- save/load;
- local/distant state consistency;
- reason codes.

Recommended first assignments:

- wait/return as immediate directives;
- travel to known location;
- deliver known cargo;
- scout known landmark;
- return and report.

## 59.2 Core Production Stage

Add:

- quest objective adapter;
- combat/escort adapter;
- Set 27 economic adapter;
- Set 29 health interruption;
- project/construction adapter;
- dynamic target invalidation;
- multi-phase assignments;
- partial completion;
- multiplayer authority;
- evidence ledger;
- knowledge-aware reports.

## 59.3 Expanded Production Stage

Add:

- diplomacy mandates;
- research/teaching tasks;
- magical/ritual assignments;
- faction agents;
- maritime delegation adapters;
- player-settlement retainers;
- richer remote communication;
- group assignments where supported;
- generated assignment templates;
- advanced LOD stress testing.

## 59.4 POC Position

The original Forest Hamlet POC does not require the complete final delegation suite. A practical integration proof is:

1. recruit/authorise one companion;
2. give them a known delivery or scout assignment;
3. allow the player to move far enough to demote the companion;
4. preserve travel/cargo/task state;
5. restore them locally;
6. receive a truthful report;
7. verify no resource, location or quest-state divergence.

# 60. 28G Acceptance Criteria

28G v0.1 is complete at the design level when all of the following are true:

- assignment terminology is unambiguous;
- 28F companion permissions are not duplicated;
- external domain ownership is explicit;
- every task family has completion evidence;
- off-screen work cannot invent effects;
- target knowledge cannot leak undiscovered content;
- resource custody is conserved;
- travel remains Set 30 authority;
- economy remains Set 27 authority;
- survival/health remains Set 29 authority;
- quest truth remains Document 15 authority;
- ordinary NPC jobs remain Document 07 authority;
- construction remains project-owner authority;
- combat remains Combat authority;
- cancellation/recall semantics are clear;
- partial completion and failure are evidence-based;
- reports separate observation/inference/hearsay;
- social consequences distinguish bad luck from breach;
- LOD invariants preserve commitments and resources;
- multiplayer conflicts cannot duplicate or overwrite assignments;
- save/load and migration requirements are defined;
- reason codes and validators are specified;
- Cross-Set Interface Amendments are recorded without transferring ownership.

# 61. Open Questions Assigned to Later Documents

| Question | Owner / Resolution Point |
| --- | --- |
| Exact final active assignment count per player/server | 28J + technical/performance validation |
| Final active companion count | 28J with 28F, Set 30 and Combat performance testing |
| Exact Leadership perk effects on delegation | Player Progression revision |
| Exact companion wages and hazard pay | Set 27 |
| Exact fatigue/exertion cost of long assignments | Set 29 |
| Exact travel durations, formations, mounts and vehicle handling | Set 30 |
| Full distant combat model | Combat/Technical implementation |
| Full settlement workforce release/absence policy | Document 07 / 19 / 20 |
| Public justice consequences for disobedience/theft/breach | Governance/Justice owner |
| Advanced magical communication | Magic System |
| AI-generated mission text, if ever used | 28H governance |
| Voice presentation of orders/reports | 28I / Presentation Forge |
| Final UI screens and accessibility presets | 28I / 28J / Document 17 revision |

# 62. Cross-Set Interface Amendments

The Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains authoritative. 28G does not transfer ownership.

## 62.1 Previously Proposed Interfaces Consumed

### Set 27 -> Set 28

- `WageOffer(actor_or_role, context)`
- `ContractSummary(contract_id)`
- `CompanionContractStatus(companion_agreement)`
- Set 27's economy API for prices, availability and trade where a delegated task requires it.

### Set 29 -> Set 28

- `RecoveryStatus(entity)`
- `InjuryState()`
- `DiseaseState()`
- `Fatigue()`
- `StaminaModifier()` where relevant to eligibility summaries.

### Set 30 -> Set 28

- `TravelState(entity_or_party)`
- `PassengerSeatAvailability(vehicle, passenger_profile)`
- `FormationResolution(group, formation_intent)`
- `TravelTime()`
- `RouteAccessibility()`
- `TraversalCost()` where permitted for planning.

### Set 28 -> External Consumers

- `CompanionActionPermission(companion, action_family, context)`
- `CompanionAvailability(companion, context)`
- `RendezvousIntent(companion, destination_anchor)`
- `ReturnHomeIntent(companion, home_anchor)`
- `CompanionTravelPermission(companion, travel_context)`

## 62.2 Proposed New Clarifications for Final Integration Review

| Proposed Interface | Owner -> Consumer | Purpose | Ownership Impact |
| --- | --- | --- | --- |
| `AssignmentTravelRequest(assignment_id, assignee, destination, constraints)` | Set 28 -> Set 30 | Supplies assignment travel intent, destination and allowed transport constraints. | None; Set 30 retains all movement/pathing/travel truth. |
| `AssignmentTravelUpdate(assignment_id)` | Set 30 -> Set 28 | Returns route state, ETA band, delay/blocker and arrival evidence. | None. |
| `AssignmentEconomicMandate(assignment_id)` | Set 28 -> Set 27 | Read-only mandate containing max spend/sell constraints and relevant contract refs. | None; Set 27 validates all economic effects. |
| `AssignmentEconomicResult(assignment_id)` | Set 27 -> Set 28 | Returns committed transaction/contract result and audit refs. | None. |
| `AssignmentSurvivalAvailability(entity, assignment_context)` | Set 29 -> Set 28 | Returns whether biological state allows start/continue/withdraw under assignment context. | None; Set 29 retains biological thresholds. |
| `AssignmentCarryFeasibility(entity, cargo_profile)` | Set 29 + Set 30 -> Set 28 | Composes physiological carry penalty and physical transport capacity without 28G defining either. | None; joint interface only. |
| `AssignmentStatus(assignment_id)` | Set 28 -> Sets 27/29/30 and external owners | Exposes current assignment phase/status for systems that need context. | None. |
| `DelegatedGoalEvidence(assignment_id, domain_owner, evidence_ref)` | External owner -> Set 28 | Registers authoritative evidence without allowing 28G to mutate the owner. | None. |

> **Amendment Status**  
> Proposed for the final Document Sets 27-30 reconciliation pass. These interfaces clarify orchestration handoffs only. No economy, survival or movement ownership moves into Set 28.

# Appendix A. Delegated Assignment Definition Template

```yaml
assignment_family_definition:
  id: leyforge.core.assignment.scout.location
  schema_version: 1
  display_name_key: assignment.scout.location.name
  goal_family: scout
  compatible_assignee_tags:
    - delegation.field_agent
    - capability.observation.scouting
  target_modes:
    - known_location
    - bounded_search_region
  required_domain_adapters:
    - movement.travel
    - knowledge.observation
  optional_domain_adapters:
    - combat.encounter
    - survival.exposure
  default_constraints:
    - avoid_unnecessary_combat
  completion_evidence:
    - observation_record
    - return_or_remote_report
  partial_completion_allowed: true
  delegation_allowed: true
  planning_status: production_candidate
```

# Appendix B. Assignment Instance Template

```yaml
delegated_assignment_instance:
  assignment_id: 01JXXXXXXXXXXXX
  definition_id: leyforge.core.assignment.scout.location
  definition_revision: 1
  issuer_id: player:01JISSUER
  assignee_id: npc:01JMARA
  authority_basis: companion_agreement:01JAGREEMENT
  status: executing
  phase_id: search
  target_bindings:
    - map_marker:ruin_rune_014
  accepted_constraints:
    - no_lethal_force_unless_attacked
    - return_if_high_risk
  briefing_package_id: briefing:01JBRIEF
  resource_custody_links:
    - inventory_tx:01JFOODTRANSFER
    - item_instance:map_014
  quest_links: []
  contract_links: []
  travel_ref: travel:01JTRAVEL
  deadline_world_time: 193420
  checkpoint_sequence: 7
  evidence_refs:
    - observation:01JOBS1
  last_reason_code: ASSIGNMENT_EXECUTING
  schema_version: 1
```

# Appendix C. Instruction, Briefing and Constraint Templates

## C.1 AssignmentInstructionEnvelope

```yaml
assignment_instruction_envelope:
  goal:
    family: scout
    description_key: assignment.goal.scout_rune_ruin
  priorities:
    - personal_safety
    - preserve_secrecy
    - gather_observations
  constraints:
    lethal_force: defensive_only
    theft: prohibited
    forbidden_magic: prohibited
    max_spend: 0
  reporting:
    return_required: true
    evidence_required:
      - map_annotation
      - observations
```

## C.2 AssignmentBriefingPackage

```yaml
assignment_briefing_package:
  source_actor_id: player:01JISSUER
  language_id: language.riverward_common
  proposition_refs:
    - proposition.ruin.location_estimate
    - proposition.ruin.possible_mana_activity
  map_refs:
    - map_marker:ruin_rune_014
  permits: []
  passwords: []
  confidence_notes:
    - proposition.ruin.location_estimate: moderate
```

# Appendix D. Domain Adapter Contract Template

```yaml
assignment_domain_adapter_definition:
  id: leyforge.core.assignment.adapter.movement.travel
  owner_system: set30_movement
  accepts:
    - assignment_id
    - assignee_id
    - destination_binding
    - travel_constraints
  returns:
    - route_accessibility
    - travel_state
    - eta_band
    - arrival_evidence
    - blocker_reason
  may_mutate_only:
    - movement_owned_state
  cancellation_mode: request_stop_or_return
  supports_lod_summary: true
```

# Appendix E. Assignment Lifecycle Matrix

| State | Can Enter From | Typical Exit | Resource Rule | Social Meaning |
| --- | --- | --- | --- | --- |
| Draft | None | Proposed/Cancelled | No transfer required. | None. |
| Proposed | Draft | Negotiating/Accepted/Refused | No irreversible transfer. | Request exists. |
| Negotiating | Proposed | Accepted/Refused | Economic terms may be previewed only. | Terms discussed. |
| Committed | AcceptedPendingCommit | Preparing/Cancelled | Required transfers/reservations committed. | Promise/obligation active. |
| Preparing | Committed | Departing/Suspended/Failed | Supplies claimed through owners. | Agent is acting on commitment. |
| Executing | Departing/WaitingExternal | WaitingExternal/Returning/Suspended/Failed | External owners mutate real state. | Commitment in progress. |
| Suspended | Executing/WaitingExternal | Executing/Returning/Cancelled | Custody preserved unless owner says otherwise. | Delay not automatically breach. |
| Returning | Executing/Suspended | AwaitingReport/Failed | Travel owner controls return. | Goal work ended. |
| Completed | AwaitingReport/Executing | Archived | Evidence fixed; rewards external. | Promise fulfilled. |
| PartiallyCompleted | Executing/Returning | Archived/Follow-up | Exact partial evidence preserved. | Context-dependent. |
| Failed | Any active state | Archived/Follow-up | Losses require owner evidence. | Not automatically blameworthy. |
| Abandoned | Active | Archived/Follow-up | Custody must reconcile. | May be justified or breach. |

# Appendix F. Initial Assignment Family Library

| ID Suffix | Family | Typical Domains | Delegation Notes |
| --- | --- | --- | --- |
| `scout.location` | Scout known place | Set 30, 28C | Core early delegation family. |
| `survey.route` | Survey road/pass | Set 30, world, 28C | Returns route knowledge, not hidden world seed. |
| `deliver.cargo` | Deliver goods | Inventory, Set 30 | Requires exact custody. |
| `courier.message` | Carry message | Set 30, 28B/28C | Message content remains knowledge object. |
| `escort.person` | Escort actor | Set 30, Combat | Destination arrival is key evidence. |
| `guard.site` | Guard location | Combat/Defence | Does not own combat AI. |
| `investigate.incident` | Gather evidence | 28C, quest/justice | Report may remain uncertain. |
| `retrieve.item` | Recover known item | Movement, inventory, combat as needed | Cannot conjure item. |
| `purchase.goods` | Buy within mandate | Set 27, inventory, Set 30 | Prices and funds external. |
| `negotiate.mandate` | Represent issuer | 28E, Set 27/governance | Authority limits explicit. |
| `assist.project` | Join construction/repair | 19/20/07 | Project owner advances work. |
| `research.sample` | Analyse known sample | Research/Magic, 28C | Returns knowledge/evidence. |
| `rescue.person` | Find and recover actor | Set 30, Combat, Set 29 | Multi-domain composite. |
| `teach.subject` | Teach known knowledge/skill | 28C/Progression | Cannot teach unknown content. |
| `maintain.ward` | Maintain magical infrastructure | Magic/Automation | Domain owner owns effect. |
| `fishery.trip` | Maritime work | Set 26 | Future adapter; 28G does not own vessel/fishing rules. |

# Appendix G. Reason-Code Catalogue

Additional production reason families:

- `ASSIGNMENT_CONFLICT_ACTIVE_COMMITMENT`
- `ASSIGNMENT_CONSTRAINT_VIOLATION_REQUIRED`
- `ASSIGNMENT_RENEGOTIATION_REQUIRED`
- `ASSIGNMENT_REPORT_READY`
- `ASSIGNMENT_REPORT_DELAYED`
- `ASSIGNMENT_ASSIGNEE_MISSING`
- `ASSIGNMENT_ASSIGNEE_CAPTURED`
- `ASSIGNMENT_ASSIGNEE_DEAD`
- `ASSIGNMENT_RETURN_IN_PROGRESS`
- `ASSIGNMENT_PARTIAL_COMPLETION`
- `ASSIGNMENT_ABORTED_JUSTIFIED`
- `ASSIGNMENT_ABORTED_BREACH`
- `ASSIGNMENT_TARGET_NOT_FOUND_WITHIN_BOUNDS`
- `ASSIGNMENT_BUDGET_EXCEEDED`
- `ASSIGNMENT_MANDATE_EXCEEDED`
- `ASSIGNMENT_EXTERNAL_OWNER_UNAVAILABLE`
- `ASSIGNMENT_SAVE_RECONCILED`

# Appendix H. Cross-System Responsibility Matrix

| System | Sends to 28G | Receives from 28G |
| --- | --- | --- |
| 28F Companions | Availability, standing permission, role, agreement status | Assignment commitment/status, return/rendezvous context |
| 28C Knowledge | Briefing comprehension, observations, provenance, report beliefs | Briefing transfer requests, report/evidence context |
| 28D Relationships | Trust/Loyalty/etc. inputs | Meaningful assignment event facts for interpretation |
| 28E Social Resolution | Acceptance/counter/refusal outcomes | Negotiable assignment proposal/renegotiation context |
| Set 27 Economy | Contract, budget, price, transaction results | Economic mandate and assignment context |
| Set 29 Survival | Health/fatigue/availability | Assignment context and withdrawal intent |
| Set 30 Movement | Route/travel/capacity/arrival state | Destination, route constraints, rendezvous/return intent |
| Document 07 | Job availability, task/work results | Exceptional authorised assignment commitment/absence context |
| Document 15 | Objective state, delegation allowed, contribution result | Assignment/objective link and evidence refs |
| Combat | Encounter/capture/death outcomes | Engagement objective and constraints |
| Inventory | Custody/transfer results | Transfer/reservation requests |
| 19/20 Projects | Work package/project stage results | Project-assistance intent |
| Magic/Automation | Valid process/fault/result | Task request within domain permissions |
| UI/17 | Player command inputs | Authoritative status, reasons, known risk and report view model |
| Persistence/18 | Save, migration, scheduler, authority services | Versioned assignment records and scheduled checkpoints |

# Appendix I. Glossary

**Assignment** - A persistent accepted goal pursued by an authorised agent under explicit conditions.  
**Assignee** - The persistent agent who accepted the assignment.  
**Issuer** - The actor or authority that issued the request/order.  
**Instruction Envelope** - Goal, priorities, constraints and reporting rules accepted for the assignment.  
**Briefing Package** - Knowledge and artifacts transferred so the assignee understands the task.  
**Domain Adapter** - Interface that submits assignment intent to the gameplay system that owns the requested effect.  
**Checkpoint** - Bounded authoritative moment at which assignment progress, external results and blockers are reconciled.  
**Evidence Ledger** - Stable references proving what actually happened.  
**Partial Completion** - Some required deliverables were authoritatively achieved while others were not.  
**Recall** - Request for an assignee to stop/return as soon as physically and socially possible.  
**Suspension** - Temporary paused assignment preserving commitment and state.  
**Abandonment** - Intentional disengagement without ordinary completion/cancellation; social meaning depends on cause.  
**Mandate** - Explicit authority bounds granted to an assignee, especially for negotiation, spending or representation.  
**Off-Screen Resolution** - Bounded processing of an assignment through authoritative domain summaries while detailed actors are not loaded.  
**Truthful Abstraction** - Compression of simulation that preserves the same resource, permission, consequence and ownership rules as local play.
