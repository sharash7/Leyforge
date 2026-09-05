# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28F - Companion, Follower, Hireling and Temporary-Ally System

**Version 0.1 - Persistent Companion Membership, Recruitment and Autonomy Design Bible Draft**

**Document Set:** 28 - Dialogue, Social Systems and Companions  
**Governing Contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0  
**Depends On:** 28A, 28B, 28C, 28D, 28E and the current canonical Leyforge source set  
**Project Lead and Final Authority:** Ash

> **Companion-System Statement**  
> Leyforge companions must remain persistent people or valid persistent companion entities rather than disposable combat summons, inventory extensions or permanently obedient AI pawns. Recruitment creates a social and/or service agreement; it does not erase personality, existing obligations, relationships, fear, values, family, health, faction ties or the right to refuse invalid demands. A companion may travel, fight, scout, advise, work, protect, learn, disagree, leave, return, be injured, be captured or die, while every physical, economic, biological and quest consequence remains owned by the appropriate external system.

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Persistent Companion Membership and Autonomy Foundation Draft | Establishes companion classes, recruitment, agreement state, active roster, roles, autonomy, permissions, refusal, hirelings, faction allies, quest companions, creature adapters, dismissal, desertion, party social dynamics, LOD, persistence, multiplayer authority, registries, validation and cross-set interfaces. |

# Document Purpose

Document 28F defines how an NPC or other eligible persistent entity becomes a companion, follower, hireling, escort, temporary ally, faction-assigned supporter or long-term travelling partner, and what that status means while the relationship remains active.

The earlier Set 28 documents already establish the pieces that make recruitment meaningful:

- **28B** owns the conversation session and recruitment dialogue intent.
- **28C** owns what the candidate knows or believes about the player, destination, danger, faction and offer.
- **28D** owns Trust, Affection, Fear, Loyalty, Respect, Gratitude, Grievance, Familiarity and relationship milestones.
- **28E** owns the contested social-resolution process that decides whether a recruitment or service proposal is accepted, refused or countered.

28F begins after those layers have supplied valid inputs. Its job is to decide what kind of companion agreement may exist, record that agreement persistently, expose the companion's current status and permissions, preserve autonomy, and route companion participation into movement, combat, survival, inventory, economy, quests and later delegation without stealing ownership from those systems.

The companion system must also preserve the living-world premise established by the NPC Village System. Named residents already have homes, jobs, schedules, households, inventories, health conditions, migration reasons and permanent consequences. Becoming a companion cannot silently delete those facts. A blacksmith who joins a week-long expedition still has a workshop, family, obligations and social history. A guard temporarily assigned by a faction remains a guard. A hired scout remains a paid service provider unless a later relationship milestone changes the nature of that bond.

This document therefore treats **companion membership as an overlay on persistent identity**, not a replacement identity.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28F | 28F Relationship |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living NPC civilisations, multiple player roles, meaningful consequences and companions as part of a wider civilisation sandbox. | Companions remain people embedded in the world rather than detached party tokens. |
| 01 - Core Gameplay Loop | Interaction includes recruiting, training, helping, threatening and travelling; the sandbox must support multiple playstyles. | Recruitment and companionship become optional extensions of ordinary world interaction rather than a mandatory RPG party. |
| 02 - Player Progression | Leadership perks can unlock followers; companions/followers may include guards, beasts, golems, NPC companions and faction allies. | 28F consumes progression eligibility and exposes companion milestones without creating a competing progression system. |
| 07 v0.2 - NPC Village System | Named NPCs have persistent jobs, schedules, inventories, households, health, migration and permanent death; multiplayer authority remains server-owned. | 07 retains person, job, inventory ownership, home and settlement operation. 28F overlays recruitment, companion status, role, autonomy and service commitment. |
| 10 - Creatures and Monsters | Mounts, familiars, work beasts, guard beasts and magical companions exist; creature taming and creature behaviour are separate gameplay concerns. | 28F supports companion adapters for eligible creatures but does not redefine taming, breeding, creature needs or mount mechanics. |
| 15 - Quest and Event System | Followers, workers, specialists, hired parties, golems and factions may be delegated objectives based on skill, loyalty, equipment, risk, cost, authority and travel time. | 28F owns who is currently a valid companion; 28G will own detailed delegated-assignment lifecycle. Document 15 continues to own quest objectives. |
| 16 - Combat, Gear and Defence | Followers, guards and pets participate in combat; friendly-fire and contribution rules are authoritative combat concerns. | 28F supplies participation consent, high-level engagement permission and companion identity. Combat owns attacks, damage, targets and battle execution. |
| 17 - UI/UX System | Companion commands and social state require world-first, accessible, knowledge-aware presentation. | 28F supplies companion view models, statuses, reasons and permissions; UI owns controls and presentation. |
| 18 - Technical Implementation | Persistent records are separate from temporary actors; authoritative state and LOD must survive streaming and multiplayer. | Companion membership persists by stable IDs and can be represented at different simulation tiers without changing social truth. |
| 28A | Set 28 owns recruitment, companion AI at the social/decision level, loyalty/refusal logic, permissions and companion status while consuming Sets 27, 29 and 30. | 28F implements the specialist companion ownership assigned by 28A. |
| 28B | Conversation choices select recruitment, dismissal, request and companion-related intents but do not create side effects by UI alone. | 28F receives committed recruitment/dismissal social actions and returns authoritative companion-state results. |
| 28C | Companions are not telepathically synced; briefings, witnessed facts and mission reports determine knowledge. | 28F stores membership and role while 28C remains information authority. |
| 28D | Relationships and Loyalty are persistent directed social dimensions; recruitment is a separate decision. | 28F consumes Trust/Loyalty/etc. and must never create a second hidden loyalty score. |
| 28E | Recruitment and service terms are resolved through social negotiation; economic terms are owned by Set 27. | 28F records the accepted social/service agreement after 28E resolves willingness. |
| Cross-Set Register | Set 27 owns wages/contracts, Set 29 owns health/fatigue, Set 30 owns movement/pathfinding/vehicles. | 28F consumes those interfaces and exposes companion agreement, travel permission and passenger/formation intent without redefining them. |

# Static Table of Contents

1. Locked Companion-System Identity  
2. Ownership Boundaries and Anti-Duplication Rules  
3. Locked Decision Summary  
4. Companion Architecture Overview  
5. Companion Classes and Participation Types  
6. Definition, Agreement, Status and Actor Separation  
7. Companion Eligibility and Candidate Discovery  
8. Recruitment Pathways  
9. Recruitment Proposal and Social Resolution  
10. Companion Agreement and Membership Lifecycle  
11. Active Roster, Reserve Roster and Capacity  
12. Companion Roles and Role Profiles  
13. Autonomy Model and Decision Authority  
14. Companion Priority Stack  
15. Permission Profiles and Player Authority  
16. Refusal, Consent and Hard Boundaries  
17. Order/Delegation Boundary With 28G  
18. Relationship, Loyalty and Service Commitment  
19. Personality, Goals and Personal Agency  
20. Jobs, Households, Homes and Existing Obligations  
21. Hirelings, Wages and Set 27 Contract Integration  
22. Equipment, Inventory, Ownership and Resource Permissions  
23. Injury, Illness, Fatigue and Set 29 Integration  
24. Following, Travel and Set 30 Integration  
25. Mounts, Vehicles and Passenger Assignment  
26. Combat Participation and Tactical Permission  
27. Skills, Training, Magic and Specialist Capability  
28. Temporary Allies and Encounter Allies  
29. Faction-Assigned Companions and Escorts  
30. Quest and Story Companions  
31. Long-Term and Socially Bonded Companions  
32. Creature, Familiar, Pet and Construct Companion Adapters  
33. Waiting, Camping, Home and Safe-Location States  
34. Dismissal, End of Service and Peaceful Separation  
35. Resignation, Desertion, Defection and Betrayal  
36. Incapacitation, Capture, Missing Status and Death  
37. Former Companions, Re-Recruitment and Return  
38. Party Social Dynamics and Companion-to-Companion Relationships  
39. Inter-Companion Conflict, Mediation and Incompatibility  
40. Dialogue, Knowledge and Social-Memory Integration  
41. Relationship and Reputation Consequences  
42. Progression, Learning and Companion Development  
43. Settlement and Civilisation Integration  
44. Simulation LOD and Distant Companion Representation  
45. Persistence, Save/Load, Migration and Recovery  
46. Multiplayer Authority and Shared Companion Control  
47. UI, Accessibility and Player Readability  
48. Registries, Runtime Records and Naming  
49. Reason Codes, Diagnostics and Developer Tools  
50. Validation and Automated Test Strategy  
51. Balance Framework and Anti-Exploit Rules  
52. Core Example Scenarios  
53. Production Scope and Staged Delivery  
54. 28F Acceptance Criteria  
55. Open Questions Assigned to Later Documents  
56. Cross-Set Interface Amendments  
Appendix A. Companion Definition Template  
Appendix B. Companion Agreement and Status Templates  
Appendix C. Recruitment Decision Template  
Appendix D. Permission Profile Template  
Appendix E. Initial Companion Role Library  
Appendix F. Companion Lifecycle State Matrix  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. Glossary

# 1. Locked Companion-System Identity

The Companion System is the **persistent social membership and autonomy layer** between an eligible entity and a player, party, faction, quest group or settlement authority.

A companion is not defined merely by proximity. Walking beside the player does not create companion status. A guard responding to a raid is not automatically the player's follower. A merchant travelling on the same road is not a party member. A creature owned by a farm is not automatically a companion. A companion relationship exists only when an authoritative companion agreement or equivalent temporary-alliance record says that the entity has accepted a recognised participation role.

> **Locked Rule**  
> Recruitment may create permission to travel and cooperate; it never creates unlimited obedience. Companion status must preserve identity, agency, obligations, relationship history, external ownership rules and valid reasons to refuse, pause or end participation.

## 1.1 Companion Design Promise

A player should be able to meet a named person, earn or negotiate their support, understand what they are willing to do, travel with them, see their personality affect behaviour, equip or support them where authorised, share danger, disagree, recover from mistakes, dismiss them respectfully, and encounter them again later as the same person with the same history.

The system should support several fantasies without making companions mandatory:

- a lone player who prefers no followers;
- a wandering adventurer with one trusted friend;
- a merchant who hires guards for a dangerous route;
- a ruler accompanied by retainers;
- a mage travelling with a scholar or familiar;
- a faction operative temporarily assigned an escort;
- a peaceful builder bringing a specialist to a remote project;
- a villain whose allies cooperate from fear, money or shared goals rather than false friendship.

## 1.2 What 28F Is Not

28F is not:

- the pathfinding system;
- the mount or vehicle-control system;
- the combat action selector;
- the inventory transaction owner;
- the health or fatigue simulator;
- the wage/contract calculator;
- the quest-objective owner;
- the creature taming system;
- the settlement job scheduler;
- a mind-control system;
- a universal party XP system;
- the detailed delegation/task-assignment system owned by 28G.

# 2. Ownership Boundaries and Anti-Duplication Rules

## 2.1 28F Owns

28F owns:

- recruitment eligibility at the companion-system level;
- accepted companion membership;
- companion class/type;
- companion agreement social terms;
- companion status lifecycle;
- active/reserve membership;
- companion role profile;
- high-level autonomy profile;
- social permission and refusal rules;
- willingness to accompany the player;
- willingness to accept categories of instruction;
- dismissal and voluntary end-of-service social handling;
- former-companion history;
- party social membership;
- companion-specific social reason codes;
- companion participation intent exposed to external systems.

## 2.2 28F Consumes but Does Not Own

| Concern | Owner | 28F Use |
| --- | --- | --- |
| Prices, wages, payments, service contracts | Set 27 | Recruitment/service terms and payment status. |
| Injury, illness, fatigue, recovery, biological stamina effects | Set 29 | Availability, refusal and concern context. |
| Walking, following, pathfinding, route accessibility, mounts, vehicles, seat resolution | Set 30 | Physical execution of companion travel. |
| Combat actions, target selection, damage, downing, friendly fire | Document 16 / combat AI | Executes approved combat participation. |
| Person identity, job, household, inventory container, schedule | Document 07 | Persistent person state remains authoritative. |
| Quest objectives, quest ownership and event lifecycle | Document 15 | Companion participation contributes to quests. |
| Item ownership, stacks, equipment instances | Item/inventory systems | Companion permissions gate requests but do not move items. |
| Creature taming/breeding/needs | Document 10 and related creature systems | Eligible creature companions use adapter records. |
| Golem/construct creation and maintenance | Magic/Automation owners | Constructs may expose companion-compatible control adapters. |
| Dialogue runtime | 28B | Recruitment/dismissal conversations. |
| Knowledge and beliefs | 28C | Candidate and companion awareness. |
| Relationships and Loyalty | 28D | Social attachment and emotional loyalty. |
| Persuasion/negotiation | 28E | Recruitment willingness and contested requests. |
| Detailed orders/delegation | 28G | Executes assignments using 28F permissions and membership. |

## 2.3 No Duplicate Loyalty Score

28F does **not** maintain a second numeric loyalty meter.

The `Loyalty()` relationship dimension belongs to 28D. 28F may maintain factual agreement fields such as:

- service duration;
- current role;
- current employer/party;
- notice requirement;
- duty status;
- temporary suspension;
- contractual obligations;
- permissions;
- commitment type.

Those fields describe **what the companion agreed to do**, not how emotionally loyal they feel.

# 3. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Core Model | Companion status is a persistent overlay on an existing person/entity identity. |
| Recruitment | Requires eligibility plus accepted recruitment/service outcome; proximity or high relationship score alone is insufficient. |
| Autonomy | Companions retain autonomous decision-making and may refuse invalid, impossible, suicidal, forbidden or personally unacceptable demands. |
| Loyalty | Emotional Loyalty remains owned by 28D. 28F stores agreement/role status only. |
| Classes | Support temporary allies, hirelings, guards/escorts, recruited specialists, quest companions, faction-assigned companions, long-term companions and compatible creature/construct adapters. |
| Jobs/Households | Existing NPC jobs, homes and households remain valid unless their owning systems authoritatively change them. |
| Wages | Paid service consumes Set 27 wage/contract interfaces. 28F never calculates pay. |
| Inventory | Companion inventory remains an authoritative inventory owned externally. 28F stores access/permission policy, not item quantities. |
| Health | Set 29/health owners supply condition and recovery state. 28F may refuse travel or hazardous duties based on those facts. |
| Movement | Set 30 owns physical following, formations, travel, mounts, vehicles and route accessibility. |
| Combat | 28F stores whether and how the companion has agreed to participate at a high level; combat owns actions and outcomes. |
| Knowledge | Companions know only what they observed, learned, were told or otherwise validly acquired through 28C. |
| Party Capacity | Architecture supports configurable active and reserve rosters. Exact production default remains a balance/performance value, not a social-law constant. |
| Dismissal | Peaceful dismissal, expiry, resignation, desertion, defection, betrayal, death and disappearance are distinct lifecycle outcomes. |
| Coercion | Captive/forced labour is not converted into genuine companion membership. Fear may produce compliance externally but not a valid consensual companion bond. |
| Multiplayer | Server owns companion membership and authoritative companion commands. Personal relationship state remains per relationship edge. |
| LOD | Distant companions remain persistent records with bounded activity summaries; demotion never deletes identity or agreement history. |
| Delegation | 28G owns detailed order/delegation lifecycle; 28F exposes membership, permissions, willingness and role capability. |

# 4. Companion Architecture Overview

The system separates five layers that are often incorrectly collapsed into one follower object.

| Layer | Purpose | Example |
| --- | --- | --- |
| Companion Definition | Immutable rules for a companion class/role. | Hired Guard, Scholar Companion, Temporary Quest Ally. |
| Recruitment Context | Candidate, recruiter, proposed role, conditions and current eligibility. | Player asks Mira to scout a ruin for three days. |
| Companion Agreement | Persistent accepted social/service relationship. | Mira agreed to accompany the player as a temporary scout. |
| Companion Status | Current operational state of that agreement. | Active, waiting at camp, unavailable due to injury, captured. |
| Physical Representation | Actor/movement/combat representation supplied by external systems. | Mira actor follows a valid Set 30 route and uses Combat AI. |

## 4.1 Canonical Recruitment Flow

1. A persistent eligible person/entity exists.
2. 28C supplies what they know/believe about the recruiter and proposed situation.
3. 28D supplies relationship context.
4. Set 27 supplies valid compensation/contract information where relevant.
5. Set 29 supplies condition/recovery facts where relevant.
6. 28B opens the recruitment conversation or another valid system initiates the proposal.
7. 28E resolves the social proposal, including counters and conditions.
8. 28F validates companion capacity, class compatibility, existing commitments and hard boundaries.
9. If accepted, 28F creates a `CompanionAgreementState` and initial `CompanionStatusState`.
10. Set 30 is asked to realise travel/following only after social acceptance.
11. External systems commit any contract, inventory, quest or political changes through their own authority paths.
12. `CompanionStatusChanged` and `RecruitmentResolved` events are emitted.

# 5. Companion Classes and Participation Types

Companion class describes **why the entity is participating and what social agreement governs them**. It is not a combat class.

| Companion Class | Typical Basis | Default Duration | Notes |
| --- | --- | --- | --- |
| Temporary Ally | Shared immediate objective | Encounter/event | May leave as soon as common objective resolves. |
| Hired Follower | Economic service agreement | Contracted | Set 27 owns pay and breach economics. |
| Guard / Escort | Employment, faction assignment or service | Route/event/shift | Often constrained by duty and protected subject. |
| Recruited Specialist | Relationship, expertise, project goal | Short/medium | Scholar, healer, engineer, guide, mage, builder. |
| Quest Companion | Authored or systemic quest relationship | Quest phase | Quest owns narrative requirement; 28F owns current membership. |
| Faction-Assigned Companion | Political/faction authority | Mission/mandate | Can have reporting obligations to faction. |
| Long-Term Companion | Mutual social commitment | Open-ended | Stronger autonomy and persistent bond; not necessarily romantic. |
| Socially Bonded Companion | Friendship/family/partnership plus agreement | Open-ended | Relationship milestone influences but does not force service. |
| Retainer | Leadership/service relationship | Long-term/renewable | May remain at settlement when not active in field party. |
| Creature Companion Adapter | Valid creature bond/taming authority | Variable | 28F handles party membership; creature system owns taming/needs. |
| Construct Companion Adapter | Valid construct control/bond | Variable | Automation/Magic owns construction, power and maintenance. |

## 5.1 Temporary Ally Is Not Automatically Recruitable

An NPC who fights beside the player during a raid may be a temporary ally because their settlement is under attack. This does not grant the player a future recruitment right. Recruitment eligibility must be evaluated separately.

# 6. Definition, Agreement, Status and Actor Separation

A single companion should never be represented only by a scene actor with booleans such as `is_following=true`.

## 6.1 CompanionRoleDefinition

Defines reusable social expectations:

- role ID;
- display/localisation keys;
- companion class compatibility;
- normal activity families;
- prohibited/default-refused activity families;
- equipment permission defaults;
- travel requirement tags;
- expected risk band;
- home/duty constraints;
- whether payment may be required;
- whether authored relationship gates may apply;
- applicable command/delegation families;
- UI summary tags.

## 6.2 CompanionAgreementState

Persistent accepted relationship between companion and recruiter/party.

Recommended fields:

- agreement ID;
- companion persistent ID;
- recruiter/player/party ID;
- companion class;
- role definition ID;
- start world time;
- duration/expiry rule;
- origin reason;
- economic contract reference if any;
- faction mandate reference if any;
- quest/event reference if any;
- agreed travel scope;
- agreed risk scope;
- permission profile ID + overrides;
- termination terms reference;
- status history summary;
- creation evidence/social action reference.

## 6.3 CompanionStatusState

Tracks current operational state without changing the underlying agreement.

Examples:

- candidate;
- joining;
- active;
- travelling-to-rendezvous;
- waiting;
- resting;
- home/reserve;
- assigned externally;
- temporarily unavailable;
- injured/recovering;
- missing;
- captured;
- stranded;
- suspended;
- notice period;
- departing;
- expired;
- dismissed;
- resigned;
- deserted;
- defected;
- deceased;
- former companion.

## 6.4 Actor Representation

The currently loaded NPC actor is replaceable presentation/runtime representation. Streaming out the actor must not delete the agreement.

# 7. Companion Eligibility and Candidate Discovery

`CompanionEligibility(candidate, recruiter, proposed_role, context)` returns a structured result rather than a single boolean.

Possible dimensions:

- identity is valid/persistent;
- candidate type supports companion participation;
- candidate is alive and not permanently unavailable;
- age/life-stage restrictions allow the proposed role;
- active law/faction rules permit recruitment;
- current job/duty permits absence or has valid leave/transfer path;
- household obligations do not create a hard authored restriction;
- candidate has sufficient information to understand the proposal;
- proposed activity is compatible with their values/role;
- economic contract can exist if required;
- current health state allows discussion/participation;
- world/server companion rules permit the class;
- recruiter has capacity for the requested active/reserve role;
- quest/event state does not forbid recruitment;
- no exclusive authored commitment blocks joining.

Eligibility does not decide willingness. An eligible candidate may still refuse through 28E.

## 7.1 Candidate Discovery Sources

Potential companions may be discovered through:

- ordinary settlement relationships;
- personal quests;
- faction introductions;
- guilds and employment boards;
- taverns/inns/markets where appropriate;
- rescue events;
- shared battles;
- exploration encounters;
- specialists needed for expeditions;
- family/friend networks;
- player settlement recruitment;
- creature taming or construct creation systems;
- authored story arcs.

There is no universal glowing "companion NPC" marker requirement. UI may reveal availability when the player has valid knowledge or when accessibility/guidance settings request it.

# 8. Recruitment Pathways

Recruitment should support multiple social and systemic routes.

| Pathway | Typical Inputs | Character |
| --- | --- | --- |
| Friendship Invitation | Trust, Affection, Familiarity, shared goals | Voluntary social companionship. |
| Professional Hire | Wage, duration, duties, danger, reputation | Transactional but still autonomous. |
| Faction Assignment | Mandate, reputation, faction goals | Duty-based and politically constrained. |
| Quest Alliance | Shared objective/event | Usually temporary and context-bound. |
| Specialist Request | Skill requirement, project/exploration need | Often role-specific and conditional. |
| Retainer Service | Leadership, settlement/faction authority | Longer duty relationship with defined role. |
| Family/Partner Travel | Relationship plus explicit acceptance | Family/romance never automatically creates follower status. |
| Rescue/Reciprocity | Gratitude/relationship context | Gratitude may motivate offer but does not impose debt-service. |
| Creature Bond Adapter | Creature-system bond/taming status | Social membership only after external bond is valid. |
| Construct Assignment | Ownership/control permission from external system | Companion-compatible construct behaviour without pretending a machine has human social state unless lore supports it. |

# 9. Recruitment Proposal and Social Resolution

28F does not run a second persuasion check. It supplies the **companion-specific proposal data** to 28E.

A recruitment proposal can include:

- requested role;
- expected destination;
- approximate duration;
- risk band;
- known objective;
- compensation/benefits from Set 27;
- accommodation/support promises;
- faction authority;
- expected combat exposure;
- expected travel mode;
- expected separation from home/duties;
- termination/cancellation expectations;
- whether the player is asking, hiring, requesting under authority or negotiating a temporary alliance.

Possible 28E outcomes consumed by 28F:

- enthusiastic acceptance;
- acceptance;
- conditional acceptance;
- counteroffer;
- temporary-only acceptance;
- role-limited acceptance;
- delayed acceptance after obligation is resolved;
- refusal for now;
- refusal for this role/destination;
- refusal of this recruiter;
- offended withdrawal;
- external condition required.

28F creates an agreement **only after all required external terms are valid and the social outcome is accepted**.

# 10. Companion Agreement and Membership Lifecycle

## 10.1 Lifecycle

`Candidate -> Proposal -> Accepted -> Joining -> Active/Reserve -> Suspended/Unavailable -> Active/Reserve -> Ending -> Former`

Alternative terminal paths include death, permanent defection or authored removal.

## 10.2 Agreement Types

| Agreement Type | Meaning |
| --- | --- |
| Open-Ended Voluntary | Companion remains until either side ends the arrangement. |
| Fixed Duration | Ends at world time/date or number of days. |
| Objective Bound | Ends when linked objective/event reaches defined state. |
| Route Bound | Escort/travel service ends at valid destination or return. |
| Shift/Guard Bound | Companion participates during a defined duty window. |
| Contract Renewable | Set 27 contract may renew; 28F updates membership only after valid renewal. |
| Faction Mandate | Ends when faction authority withdraws or mission concludes. |
| Story/Authored | Lifecycle constrained by authored narrative conditions without bypassing core safety rules. |

## 10.3 Agreement Is Not Ownership

The player does not "own" a person because they are a companion. Ownership terms apply only to items, animals or constructs where an external owning system legitimately defines them.

# 11. Active Roster, Reserve Roster and Capacity

Leyforge should distinguish between **people who are companions** and **people physically travelling in the active field group**.

## 11.1 Roster Layers

- **Active Field Roster:** currently intended to travel with the player/party.
- **Rendezvous Roster:** accepted companions travelling to meet the party through Set 30.
- **Reserve/Home Roster:** long-term companions currently staying at a home, settlement, camp or assigned base.
- **Temporary Ally Roster:** event-bound actors not counted as ordinary long-term recruits where rules permit.
- **Delegated Roster:** companions currently executing 28G assignments and therefore unavailable to active party until released/returned.

## 11.2 Capacity Philosophy

Companion capacity exists for readability, encounter balance, navigation, performance and meaningful character focus. It is not justified as an arbitrary in-world psychic limit.

The architecture must support:

- world/server configurable limits;
- solo and co-op group budgets;
- temporary authored overrides;
- role-aware limits where needed;
- reserve rosters larger than active field rosters;
- clear reasons when a candidate cannot join the active field group despite being an accepted companion.

> **Balance Draft**  
> Initial production testing should target a small active field group, approximately **two personal companions per solo player**, while keeping the data model variable. Final defaults should be validated against Set 30 pathfinding, Combat encounter readability, split-screen/co-op load and NPC performance before lock.

# 12. Companion Roles and Role Profiles

A companion role describes their expected contribution and permissions, not their RPG class.

Initial role families:

- general companion;
- guard;
- escort;
- scout;
- guide;
- healer/support specialist;
- scholar;
- mage specialist;
- engineer/automation specialist;
- builder;
- trader/caravan aide;
- diplomat/interpreter;
- hunter/ranger;
- porter/logistics aide;
- faction observer;
- quest-specific specialist.

Each role can expose:

- preferred activities;
- accepted risk bands;
- required skill/capability tags from owning systems;
- expected equipment families;
- normal travel assumptions;
- default combat participation policy;
- default item-access permission;
- social expectations;
- role-specific refusal reasons;
- 28G assignment compatibility.

A role does not magically grant skills. A companion must actually possess the required external capability.

# 13. Autonomy Model and Decision Authority

Companions are autonomous agents operating under an agreement.

## 13.1 Autonomy Tiers

| Tier | Meaning | Example |
| --- | --- | --- |
| Self-Preservation | May act to avoid immediate lethal danger or invalid state without waiting for player input. | Move from fire, seek cover, avoid drowning. |
| Role Autonomy | Performs routine actions implied by accepted role. | Guard watches approach; healer moves toward safe treatment opportunity. |
| Context Autonomy | Reacts to immediate events based on personality and permission. | Warn player, help civilian, refuse unnecessary cruelty. |
| Player-Directed | Accepts valid high-level requests routed through 28G/external systems. | Scout location, wait at camp, accompany caravan. |
| Independent Social Agency | May initiate dialogue, complain, ask to stop, propose a plan or leave. | Exhausted companion asks to return home. |

## 13.2 Autonomy Never Overrides External Authority

28F may decide that a companion **wants** to heal someone; Set 29/medical/AI systems decide whether treatment is possible and how it works.

28F may decide that a companion **wants** to follow; Set 30 decides whether a path exists.

# 14. Companion Priority Stack

A companion's high-level decision priority should normally consider:

1. invalid/dead/unconscious state from external owner;
2. immediate self-preservation emergency;
3. protected-person or critical role duty where agreement requires it;
4. active combat/emergency commitments;
5. direct valid player/party request;
6. active mission/quest obligation;
7. companion's own urgent biological/social needs;
8. current role routine;
9. travel/follow state;
10. idle social behaviour.

This is a **social/decision priority architecture**, not a movement or combat behaviour tree.

# 15. Permission Profiles and Player Authority

A companion agreement contains a `CompanionPermissionProfile` defining what kinds of requests the player is normally authorised to make.

Example permission families:

- travel_with_party;
- wait_or_rendezvous;
- enter_hostile_area;
- participate_in_combat;
- use_lethal_force;
- defend_player;
- defend_civilians;
- interact_with_owned_inventory;
- receive_equipment;
- use_consumables_from_shared_stock;
- operate_player_machine;
- enter_restricted_property;
- ride_mount;
- board_vehicle;
- carry_cargo;
- participate_in_crime;
- participate_in_forbidden_magic;
- accept_quest_assignment;
- accept_independent_delegation;
- return_home_without_player.

Permissions can be:

- allowed by default;
- ask each time;
- allowed only under context;
- prohibited;
- externally controlled;
- unknown until discussed.

# 16. Refusal, Consent and Hard Boundaries

Companions can refuse.

A refusal must return a stable reason category and, where knowledge permits, a player-readable explanation.

## 16.1 Hard Refusal Examples

- action violates explicit personal red line;
- action would require invalid consent from the companion;
- companion lacks legal/faction authority and will not break it;
- companion is too injured to participate according to Set 29;
- requested destination is physically inaccessible according to Set 30;
- requested action would abandon a dependent during an active emergency;
- player asks a hired guide to perform an unrelated assassination outside the service agreement;
- player asks a pacifist scholar to execute a prisoner;
- companion is currently captured or incapacitated;
- companion agreement has expired.

## 16.2 Soft Refusal / Negotiable Resistance

A companion may instead:

- ask for rest;
- demand supplies;
- request different route;
- ask for higher pay through Set 27;
- request safer preparation;
- ask another companion to take the role;
- insist on non-lethal approach;
- request return home after mission;
- require player explanation/evidence;
- accept only part of the instruction.

28E may resolve social negotiation where appropriate, but repeated pressure can create Grievance or Fear rather than eventually guaranteeing obedience.

## 16.3 No Compelled Companion Conversion

Captivity, slavery, mind-control or forced labour systems, if ever represented elsewhere, do not automatically create valid companion membership. An unwilling captive may be physically controlled by another system, but 28F must not label that as friendship, loyalty or consensual companionship.

# 17. Order/Delegation Boundary With 28G

28F defines **who is a companion and what categories of request they are willing/authorised to consider**.

28G will own:

- command definitions;
- command queue/lifecycle;
- delegation task construction;
- briefing requirements;
- assignment progress;
- off-screen mission resolution;
- return/report lifecycle;
- task-specific failure and retry;
- group assignment coordination.

28F exposes to 28G:

- companion status;
- role;
- permission profile;
- social willingness;
- relationship context;
- current availability;
- existing commitments;
- refusal reasons;
- preferred/forbidden activity families.

> **Boundary Rule**  
> 28F may say "Mira is willing to scout and is available." 28G decides what the scouting assignment contains, when it starts, what state it enters, and how its result is reported.

# 18. Relationship, Loyalty and Service Commitment

28F consumes 28D relationship dimensions contextually.

Potential influences:

- **Trust:** willingness to accept uncertain information or risky plans.
- **Affection:** willingness to spend personal time together, but never duty by itself.
- **Fear:** may cause avoidance or reluctant compliance; never genuine loyalty.
- **Loyalty:** willingness to remain committed under hardship or competing pressure.
- **Respect:** willingness to accept expertise/leadership in relevant contexts.
- **Gratitude:** may motivate temporary support or a recruitment offer.
- **Grievance:** increases refusal, conflict or resignation risk.
- **Familiarity:** improves coordination/social comfort without guaranteeing agreement.

## 18.1 Service Commitment Is Separate

A paid guard may have low affection and moderate Trust but still perform reliably because the service agreement remains valid.

A close friend may love the player but refuse a role that violates their values.

A terrified captive may comply temporarily while having zero loyalty.

These are intentionally distinct states.

# 19. Personality, Goals and Personal Agency

Companion behaviour should reflect existing social personality and personal goals.

Examples of meaningful tendencies:

- cautious vs daring;
- altruistic vs self-focused;
- lawful vs rule-flexible;
- curious vs routine-oriented;
- mercenary vs duty-oriented;
- conflict-averse vs confrontational;
- protective vs independent;
- secretive vs communicative;
- patient vs impatient;
- forgiving vs grudge-prone;
- ambitious vs content;
- home-attached vs wanderlust.

Personality should bias decisions, not deterministically stereotype a person. Authored goals, relationships and current circumstances can outweigh a trait.

# 20. Jobs, Households, Homes and Existing Obligations

Document 07 remains authoritative for jobs, homes, schedules and household membership.

Recruitment must evaluate absence consequences.

Possible outcomes:

- candidate can freely leave current work;
- candidate requires shift completion;
- candidate can obtain leave;
- replacement worker is required;
- household agrees to temporary absence;
- household crisis blocks departure;
- role is incompatible with leaving settlement;
- candidate can join only during specific season/event window;
- candidate joins permanently and external systems later process job/home changes.

28F may request a change but must not directly delete the job or move the household.

## 20.1 Home Anchor

Long-term companions should usually retain a `home_anchor` or recognised safe location when one exists. This supports:

- reserve roster;
- dismissal destination;
- recovery;
- personal storage access;
- household interaction;
- return after separation;
- off-duty social life.

# 21. Hirelings, Wages and Set 27 Contract Integration

Paid companions use Set 27 economic authority.

28F may need read-only inputs such as:

- wage offer;
- payment frequency;
- hazard premium;
- supplies provided;
- room/board terms;
- contract duration;
- breach/termination terms;
- arrears status;
- current employer party;
- contract validity.

28F stores only the social/service reference and reacts to the result.

Example consequences:

- valid payment -> service continues normally;
- late payment -> complaint, renegotiation or notice;
- prolonged non-payment -> resignation/breach outcome;
- dangerous scope expansion -> request renegotiation;
- bonus/reward -> relationship event only if 28D rules support it;
- exploitative terms -> grievance/social reputation effects through Set 28.

28F never creates money or decides market wages.

# 22. Equipment, Inventory, Ownership and Resource Permissions

Companions retain real inventories owned by existing inventory systems.

28F defines **access permissions**, such as:

- player may inspect summary;
- player may give items;
- player may request item return;
- player may directly manage equipment;
- companion chooses equipment from provided pool;
- shared consumables permitted;
- shared ammunition permitted;
- companion personal items locked from player control;
- quest/faction equipment not transferable;
- hired equipment returned on service end.

## 22.1 Equipment Is Not Ownership Transfer by UI

Dragging a sword into a companion slot must issue an authoritative inventory/equipment request. 28F may validate social permission; the inventory/equipment owner commits the transfer.

## 22.2 Companion Property

A companion can own personal items. Dismissal must not automatically dump their belongings into the player's inventory.

# 23. Injury, Illness, Fatigue and Set 29 Integration

28F consumes Set 29 biological states.

Relevant inputs include:

- InjuryState();
- DiseaseState();
- Fatigue();
- RecoveryStatus();
- StaminaModifier();
- CarryPenalty();
- survival-derived social/availability modifiers where approved.

Possible companion responses:

- remains active;
- requests reduced duty;
- refuses dangerous travel;
- seeks treatment;
- enters reserve/recovery status;
- requires rescue/escort;
- cannot be recruited until recovered;
- accepts only safe role;
- asks party to return home.

28F must never invent medical timers or healing formulas.

# 24. Following, Travel and Set 30 Integration

28F owns **willingness and travel membership intent**. Set 30 owns physical movement.

The companion system may expose:

- `CompanionTravelPermission()`;
- `FormationIntent()`;
- `RendezvousIntent()`;
- `ReturnHomeIntent()`;
- `PassengerAssignment()`;
- desired follow distance category;
- desired role ordering such as scout/front/rear/support.

Set 30 returns:

- current travel state;
- route accessibility;
- movement mode;
- formation resolution;
- seat availability;
- travel time;
- blocked/stranded reasons.

## 24.1 Path Failure Is Not Social Refusal

If a companion cannot reach the player because a bridge is destroyed, 28F must not record "refused to follow" unless the companion actually chose not to travel. The status should distinguish **willing-but-blocked** from **unwilling**.

# 25. Mounts, Vehicles and Passenger Assignment

28F may decide who is socially assigned or permitted to ride. Set 30 decides whether the assignment is physically valid.

Companion-specific considerations:

- willing to ride this mount/vehicle type;
- owns or is authorised to use mount;
- fear/trauma around travel mode;
- role preference (driver, passenger, guard, cargo minder);
- vehicle seat exists and is compatible;
- companion condition permits boarding;
- faction/law permits travel mode;
- destination is accepted.

No companion is teleported into a full wagon because the social party list says they should be there.

# 26. Combat Participation and Tactical Permission

28F stores high-level combat participation agreement. Document 16 and combat AI own execution.

Possible combat participation profiles:

- avoid combat;
- self-defence only;
- defend player/party;
- defend civilians;
- standard engagement;
- ranged/support preference;
- non-lethal preference;
- protect assigned target;
- retreat at defined condition threshold;
- never participate in execution/atrocity actions;
- quest-authored special restrictions.

## 26.1 Tactical Permission Is Not Tactical AI

28F may expose `engagement_policy=defend_party`. Combat AI decides cover, attack selection, movement, target and timing.

## 26.2 Friendly Fire

Friendly-fire rules remain owned by combat/world settings. A companion's social reaction to being repeatedly harmed by the player is handled through 28D after combat commits the facts.

# 27. Skills, Training, Magic and Specialist Capability

Document 02 and specialist systems own progression and skills.

28F may query capability tags such as:

- can_heal;
- can_translate;
- can_cast_ward;
- can_pick_lock;
- can_build;
- can_scout;
- can_operate_machine;
- can_train_skill;
- can_identify_creature;
- can_navigate_realm;
- can_command_guards.

Companion role selection should reflect actual capability.

## 27.1 No Companion XP Siphon by Default

28F does not define whether companions gain XP, share XP or scale with player level. That belongs to progression design. The companion system only records participation history and exposes it as a possible progression input.

# 28. Temporary Allies and Encounter Allies

Temporary allies are the lightest companion-compatible state.

Examples:

- villagers defending a raid;
- prisoner cooperating during escape;
- faction soldiers accompanying one battle;
- travellers fighting a shared monster;
- rescued NPC guiding the player out of danger;
- ritual participants protecting a site.

Temporary allies may receive:

- limited party awareness;
- limited combat coordination;
- limited travel intent;
- temporary shared objective;
- no inventory-management rights;
- no long-term command rights;
- no automatic reserve roster entry.

A temporary ally can later become recruitable only through a separate valid recruitment flow.

# 29. Faction-Assigned Companions and Escorts

Faction-assigned companions retain obligations to their faction.

Possible fields:

- assigning faction;
- mandate;
- permitted mission scope;
- reporting obligation;
- restricted information;
- protected target;
- recall condition;
- authority hierarchy;
- rules of engagement supplied externally;
- diplomatic immunity/status where owned elsewhere.

The player may have strong personal friendship with the assigned companion while still lacking authority to order them against faction mandate.

# 30. Quest and Story Companions

Document 15 owns quest state. 28F owns current companion membership.

Quest companion patterns include:

- escort target who is not commandable;
- story ally who chooses to travel;
- specialist required for one phase;
- rival forced into temporary cooperation;
- rescued character who joins until home is reached;
- companion whose continued presence depends on a branch;
- character who can permanently join after the arc.

## 30.1 Story Protection Without Fake Immortality

If an authored quest requires a character to survive, the quest/event definition must explicitly supply the protection/fallback rule. 28F does not silently grant immortality to all story companions.

# 31. Long-Term and Socially Bonded Companions

Long-term companions have persistent agreement history and strong integration with relationship systems.

They may:

- maintain a room/home at player settlement;
- have personal quests;
- request time away;
- maintain friendships/rivalries with other companions;
- develop grievances;
- become partners/family through 28D if separately eligible;
- serve as mentors or specialists;
- become settlement leaders through external systems;
- retire from active adventuring while remaining socially significant.

A spouse or close friend is **not automatically** an active companion. Social bond and field-service agreement remain separate.

# 32. Creature, Familiar, Pet and Construct Companion Adapters

The broader project already expects beasts, familiars, guard animals, work animals, magical companions and golems.

28F supports a common party-membership wrapper while respecting distinct owners.

## 32.1 Creature Companion Adapter

Consumes from creature/taming systems:

- bond/tame validity;
- ownership/caretaker status where applicable;
- behaviour profile;
- species needs;
- training state;
- equipment/harness compatibility;
- fear/aggression state;
- mount eligibility.

28F may add:

- active party membership;
- handler assignment;
- social call-name reference;
- party permission profile;
- wait/home status;
- role tag such as scout/guard/familiar.

It does not make an animal use human dialogue, contract wages or romance systems.

## 32.2 Construct Companion Adapter

Constructs/golems may have different autonomy depending on lore and design.

The owning magic/automation system supplies:

- creator/controller permissions;
- power/fuel;
- maintenance;
- command capabilities;
- consciousness/personhood flags if relevant.

If a construct is genuinely sapient, Set 28 social systems may apply through a proper persistent-person/social profile. If it is not sapient, 28F treats it as a companion-compatible controlled entity without inventing emotions.

# 33. Waiting, Camping, Home and Safe-Location States

Companions need explicit non-follow states.

Possible safe statuses:

- wait_here;
- camp_wait;
- settlement_home;
- player_base_home;
- faction_post;
- inn/lodging;
- recovery_location;
- rendezvous_location;
- vehicle_wait;
- temporary_guard_post.

28F stores the **social/status intent** and expected anchor. Set 30/settlement systems validate physical location and route.

## 33.1 Waiting Is Not Stasis

A waiting companion may still:

- eat/sleep through owning systems;
- socialise;
- perform permitted local routine;
- respond to emergencies;
- be injured by world events;
- receive messages;
- leave if agreement expires or circumstances change.

# 34. Dismissal, End of Service and Peaceful Separation

Ending companion service should be a normal supported lifecycle, not treated as betrayal by default.

Peaceful end reasons:

- player dismisses companion respectfully;
- fixed contract expires;
- objective completes;
- faction recalls companion;
- companion retires;
- companion returns to family/job;
- mutual agreement ends service;
- player restructures active roster;
- temporary ally's shared objective ends.

Possible post-service outcomes:

- returns home;
- moves to reserve roster;
- remains friend/partner;
- becomes recruitable later;
- resumes prior job;
- joins settlement;
- travels independently;
- receives final pay through Set 27;
- returns loaned equipment through inventory authority.

# 35. Resignation, Desertion, Defection and Betrayal

These are distinct states.

| Outcome | Meaning |
| --- | --- |
| Resignation | Companion openly ends service due to preference, conditions, obligations or conflict. |
| Desertion | Companion leaves active duty without agreed handover, often under danger/pressure. |
| Defection | Companion changes allegiance to another group/faction. |
| Betrayal | Companion intentionally violates a meaningful trust/service commitment in a consequential way. |

Potential causes:

- severe Grievance;
- persistent unpaid wages;
- ideological conflict;
- player atrocities;
- fear exceeding willingness to remain;
- faction recall/pressure;
- family crisis;
- broken promises;
- deception revealed;
- incompatible quest branch;
- coercion;
- personal ambition;
- enemy persuasion;
- authored story event.

Betrayal should not be random punishment. Important betrayals require visible history, plausible motive or authored mystery with evidence discoverable later.

# 36. Incapacitation, Capture, Missing Status and Death

Companion status must reflect external world facts.

## 36.1 Incapacitation

Set 29/combat determines the physical state. 28F may move companion to:

- downed;
- rescue_required;
- recovering;
- unavailable.

## 36.2 Capture

Capture owner supplies custody fact. 28F marks:

- captured;
- captor/faction reference;
- last known location if known;
- companion agreement remains active/suspended as defined;
- rescue/negotiation hooks for quests.

## 36.3 Missing

A missing companion is not assumed dead.

Possible causes:

- route separation;
- portal disruption;
- ship/vehicle incident;
- disaster;
- capture not yet known;
- voluntary departure without communication;
- world streaming reconciliation issue requiring recovery tooling.

## 36.4 Death

Named NPC death remains authoritative and usually permanent according to existing rules. 28F:

- terminates active membership;
- preserves agreement/service history;
- emits companion death status event;
- allows 28D grief/relationship consequences;
- leaves inventory/inheritance to owning systems;
- leaves quest consequences to Document 15.

# 37. Former Companions, Re-Recruitment and Return

Former companions remain socially meaningful.

A `FormerCompanionRecord` may preserve:

- prior class/role;
- service dates;
- end reason;
- major shared events;
- contract completion/breach references;
- dismissal quality;
- relationship context at end;
- re-recruitment eligibility state.

Re-recruitment is not automatic. A former companion may:

- happily return;
- demand changed terms;
- refuse the old role;
- require apology/reconciliation;
- be unavailable due to new family/job;
- now serve another faction;
- have retired permanently.

# 38. Party Social Dynamics and Companion-to-Companion Relationships

Companions are not isolated satellites around the player.

28D may maintain relationship edges between meaningful companion pairs. 28F can use those relationships for:

- willingness to travel together;
- banter opportunities;
- mutual support;
- rivalry;
- mentoring;
- jealousy only where appropriate and not assumed;
- conflict;
- mediation needs;
- shared history;
- party cohesion summaries.

No universal "party morale" number is required. If a summary is useful, it should be a derived view from actual members and current causes, not a substitute for individual state.

# 39. Inter-Companion Conflict, Mediation and Incompatibility

Two valid companions may be incompatible in a particular group.

Examples:

- sworn faction enemies;
- unresolved personal grievance;
- one companion refuses forbidden magic used by another;
- competing leadership claims;
- one is responsible for harm to the other's family;
- mutually exclusive quest commitments.

Possible outcomes:

- tolerate each other;
- request separate formation/quarters;
- argument/dialogue event;
- player mediation through 28E;
- one refuses specific mission;
- one leaves temporarily;
- open conflict only if Combat/Law systems validate it.

The system should avoid arbitrary "Companion A hates Companion B so one must leave" hard coding unless the actual history supports it.

# 40. Dialogue, Knowledge and Social-Memory Integration

Companions remain normal participants in Set 28 conversation and information systems.

## 40.1 Dialogue

28B may offer companion-specific topics:

- status/check-in;
- concerns;
- role discussion;
- travel plan;
- equipment request;
- pay/contract issue;
- relationship conversation;
- quest commentary;
- ask to wait/return;
- dismissal;
- re-recruitment.

## 40.2 Knowledge

28C remains authoritative. Companions may know:

- shared observations;
- briefed mission facts;
- independently discovered information;
- rumours they heard while away;
- private faction knowledge;
- information they deliberately withheld.

No automatic player-companion knowledge merge occurs by default.

## 40.3 Social Memory

Major companion events can create social-memory interpretations:

- survived dungeon together;
- player abandoned companion while injured;
- companion rescued player;
- wages repeatedly unpaid;
- player respected refusal;
- player broke promise;
- long journey completed;
- companion dismissed honourably;
- companion died in shared battle.

# 41. Relationship and Reputation Consequences

28F emits factual companion events; 28D determines relationship effects.

Examples:

| 28F Fact | Possible 28D Interpretation |
| --- | --- |
| Player accepts companion's request to rest | Respect/Trust may improve depending on context. |
| Player repeatedly pressures refused order | Grievance/Fear may increase. |
| Contract ends with fair pay | Respect/Trust may improve. |
| Player dismisses companion during crisis | Grievance or betrayal interpretation may occur. |
| Companion voluntarily returns after danger | Loyalty/Trust history may deepen. |
| Player rescues captured companion | Gratitude/Trust may increase. |

28F never directly writes these relationship dimensions.

# 42. Progression, Learning and Companion Development

Companion participation can expose progression hooks without owning progression.

Potential inputs to Document 02 or specialist systems:

- time spent using a skill;
- successful combat contribution;
- training session completed;
- expedition milestone;
- teaching relationship;
- specialist work performed;
- quest completion;
- companion mentorship.

Potential player unlocks may include:

- leadership perks;
- additional command clarity;
- better recruitment information;
- specialist teaching;
- faction companion access;
- expanded reserve management.

28F should not scale every companion to player level automatically unless progression explicitly defines such a rule.

# 43. Settlement and Civilisation Integration

Companions exist inside the civilisation sandbox.

Possible settlement interactions:

- companion retains residence in village;
- companion moves into player settlement through external migration/household systems;
- retainer assigned a room/bed;
- specialist unlocks a service while present;
- companion temporarily vacates a workplace;
- companion resumes job when in reserve;
- companion becomes settlement guard through external job assignment;
- companion's family remains in another settlement;
- player settlement becomes home anchor;
- local laws affect weapons, magic or companion access.

> **No Free Service Rule**  
> A companion standing inside a settlement does not automatically create a hospital, forge, school, guard post or other service. Functional facilities and job assignments remain owned by settlement systems.

# 44. Simulation LOD and Distant Companion Representation

Companion state must survive world scale.

## 44.1 LOD Tiers

| Tier | Representation | Companion Processing |
| --- | --- | --- |
| Active | Full actor near player | Physical movement/combat/interaction through external systems. |
| Local Reduced | Actor or lightweight entity | Reduced sensing/animation; full agreement and social state retained. |
| Regional | Persistent compact record | Travel/status summaries, major incidents, scheduled check-ins. |
| Distant | Bounded companion summary | No per-frame following; only meaningful status/event updates. |
| Dormant | No active simulation | Agreement remains stored; resumes on relevant event/time trigger. |

## 44.2 LOD Invariants

LOD demotion must preserve:

- companion ID;
- agreement;
- current status;
- role;
- home/rendezvous anchors;
- contract/quest references;
- important inventory ownership references;
- health state reference;
- relationship edges;
- social memories;
- last authoritative location/travel state;
- pending termination/recall conditions.

# 45. Persistence, Save/Load, Migration and Recovery

## 45.1 Persistent Minimum

Every active or historically significant companion record must preserve:

- stable companion ID;
- agreement ID and schema version;
- party/recruiter owner scope;
- class and role;
- start/end timestamps;
- status;
- permission profile;
- home/reserve/rendezvous references;
- economic contract reference;
- faction/quest references;
- last status reason;
- former-companion history where relevant.

## 45.2 Save During Transition

Save must safely support:

- joining while travelling to player;
- boarding vehicle request pending;
- companion downed;
- companion captured;
- dismissal during conversation;
- contract expiring while unloaded;
- companion travelling home;
- world streaming transition.

## 45.3 Recovery

If a companion actor fails to materialise after load, recovery tooling must reconstruct from persistent record rather than deleting the companion or silently teleporting them without audit.

# 46. Multiplayer Authority and Shared Companion Control

Companion membership is authoritative world state.

## 46.1 Ownership Scopes

Possible companion scopes:

- personal to one player;
- shared party companion;
- settlement/faction companion temporarily attached to group;
- quest-group companion;
- neutral temporary ally.

## 46.2 Control Rights

A companion may recognise:

- primary recruiter;
- party leader;
- authorised co-leaders;
- any party member for low-risk requests;
- nobody except faction commander for restricted actions.

28F stores social command authority. 28G/external systems validate each command.

## 46.3 Conflicting Player Requests

If two players issue incompatible requests:

1. authority scope is checked;
2. current committed instruction remains authoritative until changed through valid owner path;
3. companion personality/relationship may influence whose request they prefer only where authority permits choice;
4. no client wins merely because its packet arrived last;
5. UI explains who currently has authority and why.

## 46.4 No Companion Multiplication Exploit

The same persistent companion cannot be attached to multiple incompatible active parties simultaneously.

# 47. UI, Accessibility and Player Readability

The companion UI should answer:

- Who is currently with me?
- Who is a companion but not currently active?
- What role did they agree to?
- Are they available?
- Why are they refusing/unavailable?
- Where are they or what is their last known status?
- Are they injured or recovering, without exposing hidden medical formulas?
- Are they being paid under a contract?
- What inventory/equipment permissions do I have?
- What is their current travel/formation state?
- What concerns or obligations are visible to me?

## 47.1 Suggested Player-Facing Status Labels

- With You
- Joining You
- Waiting at Camp
- At Home
- On Assignment
- Resting
- Recovering
- Unavailable
- Route Blocked
- Missing
- Captured
- Returning Home
- Contract Ending
- Former Companion

## 47.2 Hidden Information

UI should not expose:

- exact hidden betrayal probability;
- secret faction orders the player does not know;
- hidden romance preferences;
- objective truth about whether a companion lied;
- exact fear/loyalty numbers unless debug/explicit accessibility mode allows it;
- pathfinding internals as social reasons.

## 47.3 Accessibility

Provide:

- text and icon status, not colour alone;
- scalable companion panels;
- command confirmation options;
- hold/toggle alternatives;
- simplified companion command presets;
- clear refusal reasons;
- subtitles/captions for companion barks;
- reduced notification spam;
- optional auto-pause only where world settings allow and it does not break authority;
- controller and split-screen focus parity.

# 48. Registries, Runtime Records and Naming

## 48.1 Definition Families

Proposed canonical domains, subject to Set 25 validation:

- `leyforge.core.companion.class.*`
- `leyforge.core.companion.role.*`
- `leyforge.core.companion.permission.*`
- `leyforge.core.companion.status.*`
- `leyforge.core.companion.end_reason.*`
- `leyforge.core.companion.refusal.*`
- `leyforge.core.companion.adapter.*`
- `leyforge.core.recruitment.path.*`

## 48.2 Runtime Records

Primary runtime records:

- `CompanionAgreementState`
- `CompanionStatusState`
- `CompanionPermissionProfileState`
- `RecruitmentDecisionRecord`
- `CompanionStatusHistoryRecord`
- `FormerCompanionRecord`
- `CompanionPartyMembershipRecord`
- `CompanionAdapterState`

## 48.3 Stable Identity

Persistent companion records reference stable person/entity IDs. Never use actor path, scene name, display name or transient network object as durable identity.

# 49. Reason Codes, Diagnostics and Developer Tools

Initial reason-code families:

- `social.recruitment.ineligible.*`
- `social.recruitment.refused.*`
- `social.recruitment.conditional.*`
- `social.companion.unavailable.*`
- `social.companion.refusal.*`
- `social.companion.permission.*`
- `social.companion.contract.*`
- `social.companion.travel.*`
- `social.companion.health.*`
- `social.companion.faction.*`
- `social.companion.household.*`
- `social.companion.capacity.*`
- `social.companion.termination.*`

Developer companion inspector should show:

- persistent ID and source definition;
- current agreement;
- current status and reason;
- active party scope;
- role;
- permission profile;
- relationship query values consumed from 28D;
- health query result from Set 29;
- travel query result from Set 30;
- contract reference/status from Set 27;
- job/household obligations;
- quest/faction references;
- most recent refusal evaluation;
- LOD tier;
- source-of-truth owner per displayed field.

# 50. Validation and Automated Test Strategy

## 50.1 Definition Validation Hard Failures

- companion role references nonexistent capability tag/permission;
- status transition points to invalid state;
- hireling role requires pay but has no Set 27 contract adapter;
- creature adapter references incompatible entity family;
- permission profile directly mutates movement/combat/inventory state;
- quest companion definition directly owns quest stage;
- invalid stable IDs;
- cyclic role inheritance;
- missing localisation keys for production-visible status/reason.

## 50.2 Runtime Invariants

Automated tests should verify:

- recruited NPC keeps same persistent person ID;
- recruitment cannot erase job/household automatically;
- high Loyalty does not recruit without accepted proposal;
- fear alone does not create loyal companion status;
- companion can refuse prohibited order;
- refusal does not become pathfinding failure;
- route blockage from Set 30 produces blocked status, not social refusal;
- unpaid hireling reacts only after Set 27 confirms arrears;
- injured companion availability comes from Set 29;
- dismissal does not transfer personal inventory to player;
- quest companion state survives save/load;
- same companion cannot be duplicated in two active parties;
- LOD demotion/promotion preserves agreement;
- companion death preserves former-service history;
- creature companion adapter does not create human relationship fields unless entity is social-capable;
- multiplayer authority rejects unauthorised command attempts;
- social command cannot directly mutate combat target or movement transform;
- re-recruitment queries former history.

## 50.3 Deterministic Scenario Tests

Recommended fixtures:

1. friend joins voluntarily for expedition;
2. hireling joins under paid three-day contract;
3. faction escort refuses unrelated crime;
4. injured companion requests recovery;
5. route becomes blocked after bridge destruction;
6. companion captured during distant travel;
7. contract expires while companion is unloaded;
8. companion resigns after repeated broken promises;
9. two companions with rivalry travel together;
10. multiplayer co-leader attempts conflicting request.

# 51. Balance Framework and Anti-Exploit Rules

## 51.1 Recruitment Should Not Be Collection Grinding

Avoid designing every named NPC as a collectible party member. Recruitment should depend on role, circumstance and personal willingness.

## 51.2 Relationship Farming Protection

High Trust or Affection should help where relevant but must not bypass:

- role incompatibility;
- family emergency;
- faction mandate;
- health inability;
- hard values;
- explicit refusal;
- active exclusive obligations.

## 51.3 Hireling Exploits

Prevent:

- hiring at stale price after Set 27 invalidates quote;
- dismissing before payment tick to avoid wages if contract says payment is owed;
- cloning gear through dismissal;
- assigning one hireling to multiple parties;
- resetting grievances by re-hiring immediately;
- bypassing dangerous-route pay by changing mission after departure without renegotiation.

## 51.4 Companion Army Creep

The active field roster should remain intentionally bounded. Large military forces belong to guard, faction, settlement and warfare systems rather than turning every soldier into a personal companion.

# 52. Core Example Scenarios

## 52.1 Trusted Friend Joins Expedition

The player asks Mara, a close friend and experienced scout, to investigate an old ruin.

- 28C confirms Mara knows the ruin is dangerous but believes the route is passable.
- 28D supplies high Trust and strong Familiarity.
- 28E resolves the invitation positively because the request aligns with Mara's curiosity and the relationship.
- 28F creates an open-ended temporary expedition agreement with scout role.
- Set 30 resolves the route and formation.
- Mara remains a resident of her home settlement; no job/home state is silently deleted.

## 52.2 Paid Caravan Guard

The player hires Torren for a five-day caravan route.

- Set 27 supplies wage/hazard terms.
- 28E resolves negotiation and Torren requests extra pay due to known bandit activity.
- Set 27 validates the final contract.
- 28F records Hired Follower / Guard role and route-bound agreement.
- Set 30 handles travel and wagon seating.
- Combat handles ambush behaviour.
- If payment becomes overdue, Set 27 reports arrears; 28F opens complaint/notice behaviour rather than inventing debt itself.

## 52.3 Friend Refuses Forbidden Ritual

A long-term companion has high Affection and Loyalty but strongly opposes forbidden blood magic.

- The player requests participation.
- 28F permission evaluation returns prohibited_by_values.
- The player may discuss or negotiate context through 28E, but there is no guarantee of reversal.
- Respecting the refusal may preserve Trust.
- Repeated coercion may create Grievance/Fear through 28D.

High relationship values do not function as mind control.

## 52.4 Injured Companion Wants to Continue

A companion is wounded but still socially willing to travel.

- Set 29 says severe injury makes hazardous travel unavailable.
- 28F marks `temporarily_unavailable.health` even though willingness remains true.
- UI explains "Willing to continue, but currently unable to travel safely."
- Treatment/recovery remains Set 29.

## 52.5 Route Blocked, Not Refusal

A bridge collapses while the companion is returning to the player.

- Set 30 reports route inaccessible.
- 28F status becomes `route_blocked`.
- Relationship does not change.
- 28G may later offer reroute/request options.

## 52.6 Companion Resigns After Broken Promises

The player repeatedly promises safe duties, then changes missions into high-risk raids without renegotiating.

- 28E/28D record broken promises and Grievance.
- 28F evaluates ongoing service as unacceptable.
- Companion gives notice or resigns depending on agreement.
- Set 27 handles any economic contract consequences.
- Former-companion history persists, allowing later apology/recruitment attempts.

## 52.7 Quest Ally Becomes Permanent Companion

A scholar accompanies the player during a ruin quest.

- Initially the scholar is a Quest Companion with objective-bound agreement.
- Quest completes.
- 28F ends temporary membership cleanly.
- A new recruitment conversation becomes available because shared history changed relationship state.
- If accepted, a **new long-term agreement** is created rather than mutating the expired quest record into a permanent follower invisibly.

## 52.8 Creature Companion

A trained scout beast is validly bonded through creature systems.

- Creature system owns tame/bond/needs.
- 28F adapter marks active party membership and scout role.
- Set 30 owns physical following and mount behaviour if rideable.
- Combat owns attacks.
- 28F never gives the beast human wage negotiation or romance fields.

# 53. Production Scope and Staged Delivery

## 53.1 Foundation

Implement first:

- companion agreement/status records;
- one temporary ally class;
- one voluntary NPC companion class;
- one hired guard class;
- active/reserve roster;
- permission/refusal query;
- Set 27/29/30 adapters as stubs where owner not implemented;
- save/load;
- simple UI status;
- deterministic tests.

## 53.2 Core Production

Add:

- role library;
- jobs/household obligation checks;
- faction-assigned companions;
- quest companions;
- former-companion history;
- creature adapter;
- multiplayer control scope;
- robust travel/status handoffs;
- social-memory integration;
- resignation/desertion/capture states.

## 53.3 Expanded Production

Later:

- richer long-term companion content;
- inter-companion conflict;
- construct adapters;
- advanced faction mandates;
- relationship-sensitive camp/home behaviour;
- companion-specific authored story packs;
- deeper accessibility/automation presets;
- large-scale testing with co-op and distant simulation.

## 53.4 POC Position

The existing POC already contains named villagers, guards, injuries, dialogue, persistent identity and world consequences. 28F does not require retrofitting the original Forest Hamlet slice with a full companion campaign before the broader social system is production-ready.

A suitable first regression proof is:

> Recruit one named NPC for a short expedition, travel together, survive a combat event, save/reload, issue a valid wait/return request through the later 28G command layer, dismiss them, and confirm they return to the same home/job/social identity with the shared history preserved.

# 54. 28F Acceptance Criteria

28F is design-complete when:

- companion status is clearly distinct from ordinary NPC proximity;
- recruitment requires accepted social/service agreement;
- relationship Loyalty is consumed rather than duplicated;
- named NPC jobs/homes/households remain external authority;
- hireling compensation remains Set 27-owned;
- injuries/fatigue remain Set 29-owned;
- physical following/vehicles remain Set 30-owned;
- combat execution remains Combat-owned;
- 28G has a clear interface for later orders/delegation;
- refusal and consent rules are explicit;
- temporary allies, hirelings, faction companions, quest companions and long-term companions are supported;
- creature/construct adapters do not collapse distinct systems;
- dismissal/resignation/desertion/death are distinct;
- LOD and save/load preserve companion history;
- multiplayer command authority is explicit;
- registries and reason codes are data-driven and testable;
- no companion mechanic silently creates money, heals injuries, teleports actors, changes quest stages or transfers inventories.

# 55. Open Questions Assigned to Later Documents

The following questions are intentionally deferred:

| Question | Owner |
| --- | --- |
| Exact player command list, queue behaviour and delegation UI | 28G / 28I |
| Off-screen assignment formulas and incident resolution | 28G |
| Companion dialogue/voice presentation and localisation production | 28I / Presentation Forge |
| Exact production default for active companion count | 28J with Set 30/Combat performance validation |
| Companion XP, skill growth and level scaling | Player Progression revision |
| Exact wage formulas, hazard pay and contract penalties | Set 27 |
| Injury thresholds, recovery timers and fatigue | Set 29 |
| Follow distance, formations, mount/vehicle handling and path recovery | Set 30 |
| Creature taming/breeding and pet needs | Creature/Livestock owners |
| Golem creation, power, maintenance and command capability | Magic/Automation owners |
| Full warfare command of squads/armies | Combat/Faction/warfare systems, not personal companion layer |

# 56. Cross-Set Interface Amendments

The governing Cross-Set Interface Register remains authoritative. 28F does not transfer ownership.

## 56.1 Previously Proposed Interfaces Consumed From 28A

28F depends conceptually on the following already proposed interfaces:

### Set 27 -> Set 28

- `WageOffer(actor_or_role, context)`
- `ContractSummary(contract_id)`
- `EconomicStanding(subject, observer_scope)` where relevant

### Set 29 -> Set 28

- `RecoveryStatus(entity)`
- `SurvivalSocialModifier(entity)` where approved

### Set 30 -> Set 28

- `TravelState(entity_or_party)`
- `PassengerSeatAvailability(vehicle, passenger_profile)`
- `FormationResolution(group, formation_intent)`

### Set 28 -> External Consumers

- `CompanionAgreement(subject)` -> Set 27
- `FormationIntent(group)` -> Set 30
- `PassengerAssignment(vehicle_or_trip)` -> Set 30
- `CompanionTravelPermission(companion, travel_context)` -> Set 30

## 56.2 Proposed New Clarifications for Final Integration Review

| Proposed Interface | Owner / Consumer | Purpose | Ownership Impact |
| --- | --- | --- | --- |
| `CompanionActionPermission(companion, action_family, context)` | Set 28 -> 28G/Combat adapters | Returns allowed/ask/conditional/prohibited plus social reason before a command is constructed. | None; external systems still execute action. |
| `CompanionAvailability(companion, context)` | Set 28 -> 28G/UI/Quest | Returns current companion availability and social/status reason. | None. |
| `RendezvousIntent(companion, destination_anchor)` | Set 28 -> Set 30 | Requests physical travel to join party after recruitment. | Set 30 retains movement/pathing. |
| `ReturnHomeIntent(companion, home_anchor)` | Set 28 -> Set 30 | Requests physical return after dismissal/reserve transition. | Set 30 retains movement/pathing. |
| `CompanionContractStatus(companion_agreement)` | Set 27 -> Set 28 | Read-only paid-service standing: valid/current/arrears/expired/breached as economically determined. | Set 27 retains all contract economics. |

> **Amendment Status**  
> Proposed for the final Document Sets 27-30 reconciliation pass. These additions clarify missing semantic handoffs only and do not move ownership.

# Appendix A. Companion Definition Template

```yaml
companion_role_definition:
  id: leyforge.core.companion.role.scout
  schema_version: 1
  display_name_key: companion.role.scout.name
  compatible_classes:
    - voluntary_companion
    - hired_follower
    - faction_assigned
  capability_requirements:
    - capability.navigation.field
    - capability.observation.scouting
  preferred_activity_families:
    - scouting
    - exploration
    - route_recon
  default_permission_profile: leyforge.core.companion.permission.scout_standard
  default_risk_band: moderate
  payment_requirement: optional_external
  home_obligation_policy: evaluate
  delegation_compatibility:
    - scout_area
    - survey_route
    - observe_target
```

# Appendix B. Companion Agreement and Status Templates

## B.1 CompanionAgreementState

```yaml
companion_agreement_state:
  agreement_id: companion_agreement:<ULID>
  schema_version: 1
  companion_person_id: person:<ULID>
  recruiter_scope_id: player_or_party:<ULID>
  companion_class_id: leyforge.core.companion.class.voluntary
  role_definition_id: leyforge.core.companion.role.scout
  start_time: world_time
  duration_rule: objective_or_open
  origin_social_action_id: social_action:<ULID>
  economy_contract_id: null
  faction_mandate_id: null
  quest_event_ref: null
  permission_profile_id: leyforge.core.companion.permission.scout_standard
  agreed_risk_band: moderate
  agreed_travel_scope: regional
  home_anchor_id: structure_or_settlement:<ULID>
  termination_terms_ref: companion.termination.voluntary_standard
```

## B.2 CompanionStatusState

```yaml
companion_status_state:
  agreement_id: companion_agreement:<ULID>
  status: active
  status_reason: social.companion.status.with_party
  active_party_id: party:<ULID>
  last_known_anchor_id: region_anchor:<ULID>
  travel_state_ref: movement_state:<opaque>
  health_state_ref: survival_state:<opaque>
  current_assignment_id: null
  status_since: world_time
  last_transition_event_id: event:<ULID>
```

# Appendix C. Recruitment Decision Template

```yaml
recruitment_decision_record:
  decision_id: recruitment:<ULID>
  candidate_id: person:<ULID>
  recruiter_id: player:<ULID>
  proposed_role_id: leyforge.core.companion.role.guard
  proposed_class_id: leyforge.core.companion.class.hired_follower
  eligibility:
    eligible: true
    hard_blockers: []
    warnings:
      - household_absence_cost
  social_resolution_ref: social_resolution:<ULID>
  economic_offer_ref: economy_quote:<opaque>
  requested_travel_context_ref: movement_context:<opaque>
  outcome: conditional_acceptance
  conditions:
    - contract_must_be_committed
    - return_after_route_complete
  agreement_created: false
```

# Appendix D. Permission Profile Template

```yaml
companion_permission_profile:
  id: leyforge.core.companion.permission.guard_standard
  schema_version: 1
  permissions:
    travel_with_party: allowed
    enter_hostile_area: conditional
    participate_in_combat: allowed
    use_lethal_force: contextual
    defend_player: allowed
    defend_civilians: allowed
    inspect_personal_inventory: denied
    receive_equipment: allowed
    use_shared_consumables: conditional
    participate_in_crime: denied
    forbidden_magic: ask_each_time
    ride_mount: external_validation
    board_vehicle: external_validation
    independent_delegation: allowed
```

# Appendix E. Initial Companion Role Library

| Role ID Suffix | Core Social Expectation | Typical External Capability |
| --- | --- | --- |
| `general` | Flexible travel partner with negotiated permissions. | None beyond ordinary survival readiness. |
| `guard` | Protect agreed subjects/party within rules of engagement. | Combat capability. |
| `escort` | Accompany person/convoy to destination. | Travel + combat awareness. |
| `scout` | Observe routes/areas and report. | Navigation/observation. |
| `guide` | Lead through known territory. | Route knowledge. |
| `healer_support` | Provide support where valid and safe. | Medical/magic capability external. |
| `scholar` | Interpret lore, ruins and records. | Knowledge/research capability. |
| `mage_specialist` | Magical expertise and support. | Magic capability. |
| `engineer` | Technical/automation expertise. | Engineering capability. |
| `builder` | Construction expertise. | Building skill. |
| `diplomat` | Negotiation/interpreter support. | Language/diplomacy capability. |
| `porter` | Carry/support logistics within capacity. | Set 30/Inventory capacity. |
| `faction_observer` | Accompany while reporting to faction. | Political mandate. |
| `quest_specialist` | Context-specific authored role. | Quest-defined capability. |

# Appendix F. Companion Lifecycle State Matrix

| Current State | Valid Next Examples | Invalid Direct Examples |
| --- | --- | --- |
| Candidate | Proposal, unavailable | Active without accepted recruitment |
| Proposal | Accepted, countered, refused | Active before external terms commit |
| Joining | Active, route_blocked, cancelled | Deceased without death fact |
| Active | Waiting, reserve, unavailable, captured, ending | Former without termination event |
| Waiting | Active, reserve, unavailable | Teleport_to_player social mutation |
| Reserve | Joining, active, ending | Combat action directly |
| Unavailable | Active, reserve, ending | Health cure directly |
| Captured | rescued/active, reserve, deceased | free without capture owner resolution |
| Ending | Former, active if cancellation mutually reversed | New unrelated contract without validation |
| Former | Candidate/recruitable, unavailable | Active without new/reinstated agreement |
| Deceased | historical only | Active |

# Appendix G. Cross-System Responsibility Matrix

| Concern | 28F Owns | External Owner |
| --- | --- | --- |
| Recruit friend | Companion eligibility/agreement/status | 28E social resolution; 28D relationship |
| Hire guard | Service membership | Set 27 wages/contract |
| Companion is injured | Availability/social response | Set 29 health/recovery |
| Follow player | Willingness and party membership | Set 30 movement/pathfinding |
| Ride wagon | Passenger intent/permission | Set 30 seats/vehicle physics |
| Fight enemy | Engagement permission | Combat AI/actions/damage |
| Give sword | Social/equipment permission | Inventory/equipment transaction |
| Companion knows clue | Membership context only | 28C knowledge |
| Companion friendship | Companion history event | 28D relationship |
| Companion quest | Membership | Document 15 quest state |
| Scout assignment | Availability/permission | 28G assignment lifecycle |
| Companion home/job | Absence/return intent | Document 07 settlement/person systems |
| Pet companion | Party adapter | Creature taming/needs |
| Golem companion | Party adapter | Magic/Automation construction/control |

# Appendix H. Glossary

**Active Field Roster** - Companions currently intended to physically travel with the player or party.  
**Agreement** - Persistent accepted social/service relationship authorising companion participation.  
**Autonomy** - Companion capacity to make decisions within personality, role, permission and world constraints.  
**Candidate** - Eligible entity who may be recruited but is not yet a companion.  
**Companion Class** - Social/service basis for membership, such as hireling, temporary ally or long-term companion.  
**Companion Role** - Expected contribution profile such as scout, guard or scholar; not an RPG class.  
**Former Companion** - Persistent person/entity with ended companion history.  
**Hireling** - Companion whose service is primarily governed by a valid economic contract.  
**Permission Profile** - Data-driven set describing which action families may be requested and under what conditions.  
**Reserve Roster** - Companions who remain part of the broader companion network but are not currently in the active field group.  
**Refusal** - Companion decision not to accept a request; distinct from physical inability or pathfinding failure.  
**Retainer** - Longer-term service companion associated with player/faction/settlement authority.  
**Temporary Ally** - Context-bound cooperative participant whose membership usually ends with the shared objective.  
**Travel Permission** - Social willingness/authority to participate in travel; physical execution remains Set 30.  

---

**End of Document 28F - Companion, Follower, Hireling and Temporary-Ally System v0.1**
