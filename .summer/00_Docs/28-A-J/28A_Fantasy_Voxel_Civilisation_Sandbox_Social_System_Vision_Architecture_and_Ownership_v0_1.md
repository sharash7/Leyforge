# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28A - Social-System Vision, Architecture and Ownership

**Dialogue, Social Interaction, Relationships, Companions and Delegation**

**Version 0.1 - Social Architecture Foundation Draft**

A canonical, data-driven architecture for Leyforge dialogue, social relationships, personality-driven reactions, social memory, family and romance, diplomacy, negotiation, companions, followers and delegated social agency, designed to preserve persistent people and meaningful world consequences without allowing the social layer to redefine economy, survival, movement, settlement operation, culture identity, quest state, combat or presentation authority.

**Project Lead and Final Authority:** Ash

> **Social-System Statement**  
> Leyforge's social systems must make persistent people understandable as people rather than service terminals. Conversation, memory, friendship, fear, loyalty, family, romance, negotiation, diplomacy, recruitment and companionship must emerge from named identities, world evidence, culture, relationships and player action. The player should be able to build trust, lose it, repair it, form attachments, create enemies, recruit allies, negotiate across cultures and delegate meaningful work, while every important outcome remains grounded in authoritative world state and owned by exactly one gameplay system.

| Field | Locked Direction |
| --- | --- |
| Document Set | Document Set 28 - Dialogue, Social Interaction, Relationships, Companions and Delegation. |
| Document Role | 28A is the authority, ownership and architecture foundation for the full Set 28 suite. It defines what Set 28 owns, what it consumes, what it exposes, how its persistent records are separated, and which specialist documents own later detail. |
| Governing Contract | The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** is adopted as the governing ownership contract. Set 28 consumes Set 27, 29 and 30 interfaces and must not redefine their gameplay rules. |
| Core Ownership | Dialogue, relationships, friendship, family, marriage, romance, NPC social personality, recruitment, companion AI, diplomacy, negotiation, social memory, crime witnesses, social reputation and social reactions. |
| Persistent-Person Boundary | Document 07 continues to own persistent NPC identity, household membership records, jobs, schedules, needs, inventories, life-stage state, migration and village operation. Set 28 owns the detailed social meaning and runtime social records attached to those people. |
| Culture/Faction Boundary | Document 13 continues to own ancestry, culture, language definitions, faction identity, government, law, territory, membership and political world state. Set 28 consumes those facts to resolve conversation, etiquette, social reactions, diplomacy and relationship consequences. |
| Quest/Event Boundary | Document 15 owns quest and event lifecycle, objectives, stages, deadlines and event consequences. Set 28 provides conversation, negotiation, social decisions, witnesses, relationship changes and delegation outcomes as authoritative inputs. |
| Economy Boundary | Set 27 owns prices, wages, currency, markets, trade contracts, economic standing and financial consequences. Set 28 owns the social negotiation process and relationship effects around those facts. |
| Survival Boundary | Set 29 owns injury, illness, fatigue, recovery and biological state. Set 28 consumes those states to influence social availability and behaviour but never computes medical or survival outcomes. |
| Movement Boundary | Set 30 owns locomotion, pathfinding, mounts, vehicles, travel times, route accessibility and physical formation resolution. Set 28 owns social command intent, companion membership and passenger/formation intent only. |
| Presentation Boundary | Documents 17, 22 and 23 own UI interaction grammar, entity presentation/animation contracts, voice-event hooks, audio and VFX presentation. Set 28 supplies authoritative social state and semantic events. |
| Registry Direction | Definitions use the Set 25 canonical registry kernel, qualified IDs, field ownership, typed relationships, immutable definitions and separate mutable runtime records. |
| Simulation Direction | Nearby social interaction is fully represented; distant social state uses bounded summaries. Promotion/demotion must preserve identity, social memory, relationship edges, companion commitments, diplomacy state and consequential history. |
| Multiplayer Direction | Social state is authoritative. Conversation participation, final choices, companion ownership/command scope, diplomacy authority and social consequences must have explicit multiplayer scope. |
| Engine Direction | Current project implementation direction is Godot with Summer Engine. This document is primarily engine-neutral gameplay and data architecture and avoids obsolete Unreal-specific assumptions. |
| Production Direction | Social depth is layered. Named important characters receive richer memory and authored content; ordinary residents remain believable through reusable systemic definitions without requiring enormous bespoke dialogue trees. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Social Architecture Foundation Draft | Establishes Set 28 identity, ownership, source-of-truth boundaries, social runtime architecture, persistent record separation, cross-set API consumption, multiplayer/LOD rules, document map, validation direction and Cross-Set Interface Amendments. |

# Document Purpose

Document 28A establishes the authority and architecture for Leyforge's social layer before individual dialogue, relationship, companion and delegation mechanics are specified in later Set 28 documents. Existing documents already establish persistent NPCs, memories, households, culture, faction politics, quests, UI, entity presentation and simulation LOD. What has been missing is a single detailed owner for how those facts become conversations, interpersonal relationships, social decisions, companion bonds, diplomatic interaction and delegated social agency.

This document therefore does not rewrite the NPC Village System, Culture/Faction System, Quest/Event System, UI/UX System, Entity Forge, Economy, Survival or Movement systems. Instead, it assigns field-level social ownership, creates stable interfaces to those systems and defines a runtime architecture in which social decisions are consequences of authoritative facts rather than isolated dialogue variables.

The social system must remain compatible with Leyforge's core promise: a player can help, ignore, trade with, befriend, recruit, negotiate with, exploit, frighten, betray, conquer, protect or restore living societies, and those societies remember. The Master Game Design Bible already establishes that morality should be expressed through reputation, fear, trust, faction response and world-state outcomes rather than a single good/evil meter. Document 07 v0.2 establishes persistent people, social memory and living households. Document 13 establishes layered identities, languages, laws, multidimensional reputation and autonomous diplomacy. Document 15 establishes authored-and-simulated story and event consequences. Set 28 converts those foundations into a coherent social runtime.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28A | Set 28 Relationship |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living NPC civilisations, named people, emergent NPC stories, marriages, migration, player morality and world reaction. | Preserves the social fantasy and world-consequence requirement. |
| 01 - Core Gameplay Loop | Interaction includes talking, trading, accepting requests, recruiting, training, helping, threatening and conquering; NPC daily life includes socialising and family. | Makes social interaction a first-class loop rather than a quest-menu wrapper. |
| 02 - Player Progression | Individual, settlement and faction reputation are progression channels; Diplomacy/Reputation and Leadership are skills. | Consumes progression state while Set 28 defines social resolution and relationship consequences. |
| 07 v0.2 - NPC Village System | Persistent NPC identity, traits, memory, households, relationships, trust, fear, dialogue hooks, families, LOD and consequence. | **Detailed ownership clarification:** 07 remains owner of persistent person/village operation; Set 28 becomes the detailed authority for social personality definitions, relationship semantics, social memory interpretation, dialogue runtime, recruitment and companion social state. Future 07 revision should reference Set 28 rather than duplicate those rules. |
| 13 - Races, Peoples, Cultures and Factions | Separate ancestry/culture/faction identities, languages, laws, multidimensional reputation, information flow, treaties, marriage politics and autonomous diplomacy. | 13 remains identity/political-world-state authority. Set 28 owns the social and conversational diplomacy runtime that consumes those definitions. |
| 15 - Quest and Event System | Quests arise from real relationships and conditions; rumours, social events, weddings, trials and negotiations can create persistent consequences. | Set 28 provides conversation, social decision, relationship, witness and delegation facts to quest/event authority. |
| 16 - Combat, Gear and Defence | Surrender, capture, intimidation, trauma, named NPC injury/death and persistent aftermath affect dialogue and relationships. | Combat owns damage and encounter resolution; Set 28 consumes historical facts and produces social consequences. |
| 17 - UI/UX System | Dialogue, reputation, trade, crime and faction UX are world-first, accessible, knowledge-aware and authoritative. | UI owns presentation; Set 28 owns the state and reason codes shown. |
| 19-20 - Settlement and Buildings | Households, community spaces, governance, diplomacy facilities, justice, witnesses and services use real residents and structures. | Set 28 uses settlement context and physical social anchors without creating abstract services. |
| 22C/22F/22H - Entity Forge and Animation | Persistent visual identity, dialogue anchors, interaction markers, social animation hooks and simulation LOD are separate from gameplay truth. | Set 28 requests semantic presentation events; Forge never owns social outcomes. |
| 23 - Presentation Forge | Voice, sound and VFX may attach to semantic events without becoming gameplay authority. | Set 28 exposes social presentation events and text/voice keys. |
| 24 - World Content Atlas | Seed-generated cultures, factions, histories and social contexts replace fixed POC social arrangements. | Set 28 operates on generated identities and relationships rather than hardcoded named POC actors. |
| 25B-25E | Canonical IDs, field-level ownership, typed relationships, capabilities, content packs, validation, persistence and production gates. | Set 28 definitions and runtime records must comply with the canonical registry kernel and validation architecture. |
| 26 - Maritime Expansion | Crews, captains, maritime factions, piracy, naval diplomacy, passengers and shipboard social roles extend existing NPC systems. | Set 28 supplies general social/companion/diplomatic interfaces; maritime documents retain maritime gameplay ownership. |
| 27-30 Cross-Set Interface Register v1.0 | One owner per gameplay system and explicit cross-set interfaces. | Adopted verbatim as governing contract for Set 28. |

> **Detailed-Authority Clarification Rule**  
> Where an older Leyforge document contains a broad placeholder or preliminary rule for dialogue, relationships, social memory, companion behaviour, romance, negotiation or diplomacy, Set 28 becomes the detailed social authority after approval. The older document retains its own domain state and consumes Set 28 outputs. No unrelated gameplay ownership is transferred.

# Static Table of Contents

1. Locked Social-System Identity  
2. Source-of-Truth and Ownership Boundaries  
3. Cross-Set Interface Register Adoption  
4. Social Architecture Overview  
5. Definition, Runtime Record and Historical Evidence Separation  
6. Persistent Person and Social Profile Contract  
7. Social Personality Architecture  
8. Relationship Graph Architecture  
9. Social Memory and Information Architecture  
10. Dialogue and Conversation Runtime Architecture  
11. Social Reputation and Reaction Resolution  
12. Family, Friendship, Romance and Marriage Architecture  
13. Negotiation and Diplomacy Architecture  
14. Crime Witness and Testimony Architecture  
15. Companion, Follower and Recruitment Architecture  
16. Orders, Delegation and Off-Screen Social Agency  
17. Culture, Language, Law and Etiquette Integration  
18. Quest, Event and Story Integration  
19. Economy Interface Integration  
20. Survival Interface Integration  
21. Movement and Transportation Interface Integration  
22. Combat, Magic, Settlement and World-State Integration  
23. Simulation LOD and Distant Social Resolution  
24. Persistence, Save and Migration Requirements  
25. Multiplayer Authority and Shared Social Consequence  
26. UI, Voice, Accessibility and Localisation Requirements  
27. Registry, Data and Naming Direction  
28. Validation, Diagnostics and Test Strategy  
29. Document Set 28 Map and Specialist Ownership  
30. Production Scope and Staged Delivery  
31. 28A Acceptance Criteria  
32. Open Questions Assigned to Later Documents  
33. Cross-Set Interface Amendments  
Appendix A. Social Definition and Runtime Record Catalogue  
Appendix B. Social API Contract v0.1  
Appendix C. Cross-System Responsibility Matrix  
Appendix D. Social Event and Reason-Code Families  
Appendix E. Glossary

# 1. Locked Social-System Identity

The Social System is Leyforge's interpersonal understanding, relationship and social-agency layer. It governs how persistent people interpret events, communicate, remember social meaning, form or break bonds, respond to reputation, negotiate, recruit companions and participate in diplomacy.

It exists between factual world state and player-facing social consequence. A mine is depleted by the resource system, a villager loses work through settlement simulation, a merchant experiences a shortage through the economy, an NPC becomes injured through combat/survival systems and a faction changes law through civilisation systems. Set 28 does not own any of those facts. It owns how a person or social group **understands, remembers and reacts** to those facts within its approved scope.

> **Locked Rule**  
> Social outcomes must be traceable to authoritative people, memories, relationships, identities, knowledge and world events. A dialogue line, friendship change, companion decision or diplomatic response may simplify the underlying simulation for readability, but it may never invent a factual state that no owning system has established.

## 1.1 Social Design Promise

A player should be able to ask, directly or indirectly:

- Who is this person?
- What do they know?
- What do they believe happened?
- What do they remember about me?
- What do they want right now?
- Why do they trust, fear, admire or resent me?
- Which cultural or legal expectations matter here?
- Can I persuade, negotiate, apologise, threaten, recruit or dismiss them?
- What will change if I make this choice?
- Will this person still remember the outcome after I leave the region?

The game does not need to expose every internal value numerically. It must expose enough evidence and explanation that important social outcomes feel understandable rather than arbitrary.

## 1.2 Social Identity Layers

| Layer | Meaning | Examples |
| --- | --- | --- |
| Person | Stable persistent individual supplied by Document 07. | Named villager, merchant, captain, prisoner, ruler, scholar. |
| Social Personality | Reusable Set 28 definition describing social tendencies, preferences, thresholds and conversational style modifiers. | Cautious, generous, ambitious, blunt, patient teacher, proud, conciliatory. |
| Social Role | Contextual role in the current relationship or interaction. | Friend, stranger, employer, companion, spouse, rival, envoy, witness, debtor. |
| Relationship Edge | Persistent directed or paired connection between people or a person and social group. | Trust, affection, fear, loyalty, respect, grievance, familiarity. |
| Social Memory | Evidence-linked remembered interpretation of a consequential event. | Rescue, theft, betrayal, honoured promise, family loss, gift, conquest. |
| Social Reputation | Aggregated or propagated social view associated with a person, settlement or group, separate from raw event evidence. | Trusted helper, dangerous raider, reliable negotiator, oath-breaker. |
| Conversation Session | Temporary authoritative interaction state. | Participants, context, topic, choices, knowledge state, interruption. |
| Companion Bond | Persistent recruitment and loyalty/permission state for a follower relationship. | Recruited, temporary ally, hired specialist, loyal companion, dismissed. |
| Diplomacy Session | Temporary social process for proposals between political parties or recognised representatives. | Ceasefire discussion, access negotiation, prisoner exchange. |

## 1.3 What Set 28 Is Not

Set 28 is not:

- a replacement for NPC schedules, jobs, needs, inventories or village simulation;
- an economy simulator hidden inside dialogue;
- a survival or medical system;
- a movement, pathfinding, mount or vehicle controller;
- a quest generator allowed to invent nonexistent actors or locations;
- a faction/territory/war-state owner;
- a justice system that decides guilt or punishment;
- an animation, voice, lip-sync or UI authoring system;
- an unrestricted generative chatbot disconnected from game state;
- a universal morality score;
- a requirement that every ordinary NPC receive a massive handcrafted dialogue tree.

# 2. Source-of-Truth and Ownership Boundaries

Set 28 follows the Set 25 rule that every mutable truth has one owner and every field path has one canonical source. Social systems frequently touch data from other domains, so ownership must be unusually explicit.

## 2.1 Core Ownership Matrix

| State or Rule | Canonical Owner | Set 28 Use |
| --- | --- | --- |
| NPC stable identity, existence, age/life stage, home, job, schedule | Document 07 | Query context; never duplicate. |
| Household membership and residence | Document 07 | Social relationships may request a household change after marriage/adoption, but 07 commits it. |
| Personality definitions and social personality state | Set 28 | Canonical social behaviour input. |
| Relationship dimensions and relationship edge state | Set 28 | Canonical interpersonal bond state. |
| Social memory records and social interpretation | Set 28 | Canonical social memory state linked to factual source events. |
| Physical injury/illness/fatigue | Set 29 | Query only through Survival API. |
| Item/currency ownership and financial transfer | Inventory/Set 27 | Social system requests or consumes outcome; never invents transfer. |
| Price, wage, market, contract financial terms | Set 27 | Negotiation consumes values; Set 28 owns social modifiers and dialogue process. |
| Faction identity, membership, law, government, territory | Document 13 / settlement governance | Query context; do not mutate except through approved owner commands. |
| Political treaty/world-state record | Document 13 or designated political owner | Set 28 negotiation may propose/resolve social acceptance; owner commits treaty state. |
| Quest/event stages and deadlines | Document 15 | Conversation choices may trigger validated quest events. |
| Crime fact, damage, theft transaction | Combat/inventory/justice owner | Set 28 witnesses perceive and remember facts; does not create crime. |
| Evidence chain, guilt, trial, sentence | Document 20C / justice system | Set 28 supplies witness statements and social testimony only. |
| Movement/path, route success, riding, seating | Set 30 | Companion command creates intent; Set 30 resolves physical execution. |
| Companion recruitment, loyalty, social permissions, autonomy | Set 28 | Canonical companion social state. |
| Companion combat action | Document 16 / combat AI | Set 28 can issue high-level command intent; combat owns execution. |
| Dialogue screen, subtitles, focus, input | Document 17 | Consumes Set 28 view models and reason codes. |
| Character animation, dialogue anchor, gestures | Entity Forge / Presentation | Set 28 emits semantic state/events; presentation resolves visuals. |

## 2.2 Document 07 Clarification

Document 07 v0.2 currently describes itself as owning social memory, households and relationships because no later dedicated social set existed when it was written. Set 28 does not remove Document 07's role as the persistent-person and village-operation authority. It narrows the overlap:

- Document 07 owns **who the person is**, whether they exist, where they live, their household membership, work, schedule, personal needs, life-stage state and village context.
- Set 28 owns **how that person relates socially**, which relationship dimensions exist, how social memories are represented, how social personality modifies reactions, how conversations are resolved and how companion/diplomatic social decisions are made.
- Document 07 may cache or expose a resolved social summary for task selection, but that summary is a read-only view of Set 28 state.
- Set 28 may request household, schedule or migration changes through the owning system when a social milestone requires them.

## 2.3 Document 13 Clarification

Document 13 remains authoritative for the layered civilisation identities it established: ancestry, culture, language definitions, faction membership, settlement citizenship, religion, government, law, territory and political history. Set 28 consumes those layers to determine etiquette, intelligibility, prejudice/affinity rules where authored, diplomatic authority and social context.

Set 28 owns the **interaction process** of diplomacy: participants, proposals, social credibility, trust, persuasion, threats, face-saving, relationship consequences, memory and conversational outcome. It does not directly change borders, tax rates, military status, trade tariffs or legal codes.

# 3. Cross-Set Interface Register Adoption

The user-approved **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** is incorporated as a mandatory contract.

## 3.1 Set 28 Owns

- Dialogue
- Relationships
- Friendship
- Family
- Marriage
- Romance
- Companion AI
- Recruitment
- NPC personalities
- Reputation reactions
- Diplomacy
- Negotiation
- Social memory
- Crime witnesses
- Social reputation

## 3.2 Set 28 Receives from Set 27

- Prices
- Wages
- Merchant inventories
- Economic reputation/standing
- Contracts
- Trade opportunities

Set 28 must never define market simulation, currency, price formation, contract accounting, wages, taxes or other economy rules.

## 3.3 Set 28 Receives from Set 29

- Injury state
- Illness state
- Survival-derived mood/social penalties
- Fatigue effects
- Recovery status

Set 28 may change conversational availability, urgency, patience or relationship reaction based on these inputs, but it never computes health, fatigue or recovery.

## 3.4 Set 28 Receives from Set 30

- Mount availability/status
- Companion following movement state
- Vehicle seating availability
- Formation resolution
- Travel state
- Route accessibility and travel time where needed

Set 28 does not define pathfinding, locomotion, mount riding or vehicle physics.

## 3.5 Set 28 Exposes Social API

The base register locks the following public queries:

- `RelationshipLevel()`
- `Trust()`
- `Affection()`
- `Fear()`
- `Loyalty()`
- `PersuasionModifier()`
- `CompanionStatus()`
- `SocialMemory()`

Later sections and specialist documents may add non-owning interfaces through the Cross-Set Interface Amendments process.

# 4. Social Architecture Overview

The social system is layered so world truth, social interpretation and presentation remain separate.

## 4.1 Architecture Layers

| Layer | Owns | Example |
| --- | --- | --- |
| External Facts | Other domain owners | Injury, price, theft, faction membership, quest stage, route status. |
| Social Definitions | Set 28 immutable registries | Personality types, relationship dimensions, memory categories, dialogue intents. |
| Social Runtime State | Set 28 persistent records | Relationship edges, social memories, companion bond, social reputation. |
| Social Resolution | Set 28 services | Context build, eligibility, reaction, choice consequences, persuasion, recruitment. |
| Domain Commands | Owning external systems | Pay wage, transfer item, change household, create quest event, start travel. |
| Social Historical Events | Set 28 plus source event links | Promise kept, apology accepted, recruitment failed, witness statement given. |
| Presentation | UI/Forge/Presentation systems | Dialogue text, subtitles, gestures, portraits, voice, notifications. |

## 4.2 Social Resolution Flow

A standard social interaction follows this order:

1. Resolve stable participants and authority.
2. Query external factual context from owning systems.
3. Query social personality, relationship, memory, reputation and knowledge state.
4. Build a conversation or social-action context.
5. Determine which intents/actions are currently valid.
6. Present choices or systemic responses through the UI/presentation layer.
7. Validate the selected action against current authoritative state.
8. Resolve social consequences.
9. Submit any external state changes to their owning systems.
10. Commit Set 28 state only after required authoritative external actions succeed or explicitly return a partial outcome.
11. Emit historical/social events and presentation hooks.
12. Persist meaningful state and update bounded summaries.

This prevents a dialogue choice from promising a payment that the player cannot afford, recruiting an NPC who has already died, creating a treaty with an invalid representative, or assigning a companion to a route that no longer exists.

# 5. Definition, Runtime Record and Historical Evidence Separation

Set 28 follows the project-wide distinction between immutable definitions and mutable world state.

## 5.1 Definition Examples

- social personality definition;
- relationship dimension definition;
- relationship milestone definition;
- social memory category definition;
- dialogue intent definition;
- conversation template;
- social action definition;
- persuasion/negotiation action definition;
- companion role definition;
- companion permission profile;
- delegation task category;
- diplomacy action definition;
- witness statement schema;
- social reputation dimension;
- culture etiquette rule reference;
- localisation/text key bundle.

## 5.2 Runtime Record Examples

- `SocialProfileState`
- `RelationshipEdgeState`
- `SocialMemoryRecord`
- `SocialReputationState`
- `ConversationSessionState`
- `CompanionBondState`
- `CompanionOrderState`
- `DelegatedAssignmentState`
- `DiplomacySessionState`
- `WitnessStatementRecord`

Runtime records use persistent world identities rather than authored definition IDs for individuals. A relationship between two named NPCs is not a new registry definition; it is a saved relationship record referencing two persistent person IDs and the relationship dimensions defined by the registries.

## 5.3 Evidence Link Rule

A social memory must distinguish:

- the **source event** that actually occurred;
- the **observer/source** through which the person learned of it;
- the person's **interpretation**;
- confidence and visibility;
- emotional/social weight;
- decay or persistence policy.

This allows two NPCs to remember the same event differently without creating two conflicting versions of world truth.

# 6. Persistent Person and Social Profile Contract

Document 07 supplies a stable person record. Set 28 attaches or resolves a social profile using that identity.

## 6.1 Required Person Inputs

Set 28 may query, where available:

- persistent person ID;
- display/name keys;
- age/life stage;
- household ID and family links;
- culture and language memberships;
- faction and settlement memberships;
- job/profession and current role;
- schedule availability;
- legal status;
- current location and interaction availability;
- current survival condition through Set 29;
- current combat/emergency state;
- current companion or service commitments;
- relevant quest/event bindings;
- knowledge access and discovered information.

## 6.2 Social Profile Output

Set 28 resolves:

- personality profile references;
- current social disposition context;
- relationship edges;
- social memories;
- social reputation view;
- conversation availability;
- relationship milestones;
- companion/recruitment eligibility;
- diplomacy authority where applicable;
- social preferences and boundaries derived from individual plus culture/law references.

The social profile must not duplicate work skill, health, inventory, schedule or faction membership.

# 7. Social Personality Architecture

Set 28 owns NPC social personality definitions because the Cross-Set Interface Register explicitly assigns NPC personalities to this set. Document 07's broad trait examples remain valid source material but become inputs to a more precise social personality layer.

## 7.1 Personality Principles

- Traits are few, legible and consequential.
- Personality changes weights and thresholds rather than hard-scripting outcomes.
- Culture and personality remain separate. A person can conform to, reinterpret or reject cultural expectations.
- Personality does not determine morality.
- Personality does not grant hidden knowledge.
- Personality may change slowly through major life events when an approved rule exists, but ordinary conversations do not randomly rewrite a person.

## 7.2 Social Personality Facets

Potential facets include:

- openness to strangers;
- patience;
- generosity;
- risk tolerance;
- conflict style;
- pride/status sensitivity;
- empathy/helpfulness;
- curiosity;
- directness;
- secrecy;
- loyalty tendency;
- forgiveness tendency;
- ambition;
- humour/solemnity presentation preference;
- teaching willingness;
- authority deference/resistance.

These are architecture categories only. Exact numeric ranges and final trait rosters belong to 28D/28E and production registries.

# 8. Relationship Graph Architecture

Relationships are persistent graph edges, not a single friendship score.

## 8.1 Core Relationship Dimensions

The source documents already establish trust, fear, respect, gratitude, grievance, legitimacy, familiarity and ideological alignment at various social scales. The Set 28 Cross-Set Register additionally requires affection and loyalty. 28A therefore locks a multidimensional architecture while leaving detailed formulas to 28D.

Minimum supported dimensions:

- Trust
- Affection
- Fear
- Loyalty
- Respect
- Gratitude
- Grievance
- Familiarity

Additional contextual dimensions such as legitimacy or ideological alignment may be supplied from civilisation/faction systems or represented as specialised social reputation dimensions rather than forced into every personal relationship edge.

## 8.2 Directed and Mutual State

Relationships are generally directed: A may trust B more than B trusts A. Some milestones can be paired or require mutual state, such as friendship recognition, partnership, marriage or reciprocal companion bonds.

## 8.3 Relationship Sources

Relationship change may come from:

- direct conversation outcomes;
- fulfilled or broken promises;
- help, rescue or protection;
- theft, harm, betrayal or humiliation;
- gifts or support, where the economy/inventory confirms the transfer;
- shared danger or long-term service;
- treatment of family/household members;
- cultural or faction events;
- quests and world events;
- witness/rumour propagation;
- companion success, neglect or abandonment;
- diplomacy and negotiated settlements.

Set 28 records the social interpretation and relationship delta, not the underlying physical event.

# 9. Social Memory and Information Architecture

Document 07 v0.2 already establishes memory layers, significance, confidence, emotional direction, visibility, source and decay. Set 28 preserves those concepts and makes them the detailed social-memory authority.

## 9.1 Social Memory Layers

- Personal memory
- Household/family memory
- Settlement social memory
- Culture/faction social memory

The owning scope of the underlying factual event remains separate. A settlement may remember a raid outcome as history, while individual residents maintain their own social memories of who rescued or abandoned them.

## 9.2 Knowledge vs Memory

Knowledge is what a person currently believes or has learned. Social memory is a remembered event or relationship-relevant interpretation. A person may know that a treaty exists without personally remembering its negotiation. Conversely, a person may remember being insulted even if the insult has no broader historical significance.

## 9.3 Rumours and Confidence

Rumours are information-transfer records with source, confidence, distortion allowance and propagation path. They do not rewrite the source event. Later 28C owns truth, lies, rumours, information spread and language effects in detail.

# 10. Dialogue and Conversation Runtime Architecture

Set 28 owns dialogue runtime. Dialogue is not limited to branching trees, and it is not an unrestricted text generator.

## 10.1 Conversation Context

Every active conversation resolves at least:

- participants;
- speaker/listener roles;
- location/context;
- current availability and interruption conditions;
- relationship summary;
- relevant social memories;
- known/unknown information;
- language intelligibility;
- culture/law/etiquette context;
- active quest/event hooks;
- trade/contract facts from Set 27 if relevant;
- survival condition from Set 29 if relevant;
- travel/combat/emergency state;
- conversation ownership/scope in multiplayer.

## 10.2 Conversation Content Classes

- authored critical dialogue;
- authored modular dialogue fragments;
- systemic contextual lines;
- rumours and information exchange;
- service/transaction dialogue;
- companion banter;
- diplomacy/negotiation dialogue;
- ambient social dialogue;
- generated candidate text under strict fact and lore constraints, if later approved by 28H.

## 10.3 Truthfulness Rule

A conversation may contain lies, uncertainty or mistaken beliefs, but the system must distinguish those from authoritative world truth. Procedural or AI-assisted dialogue may never fabricate an item transfer, quest completion, relationship, location, faction membership or historical fact as if it were authoritative.

# 11. Social Reputation and Reaction Resolution

Set 28 owns **social reputation** and **reputation reactions**, while source evidence may come from many systems.

## 11.1 Social Reputation Scopes

- individual perception;
- household/family perception;
- settlement social perception;
- culture/community perception;
- faction-facing social perception where supplied by political authority;
- party/group reputation where multiplayer rules permit.

## 11.2 Resolved Reaction View

A social reaction query may consider:

- direct relationship;
- relevant social memories;
- propagated reputation;
- familiarity/confidence;
- current role and context;
- culture/law expectations;
- faction/political standing;
- economic standing from Set 27;
- recent harm/help to household or settlement;
- disguise or identity certainty if supported by civilisation systems;
- current crisis state.

The result may affect willingness to talk, tone, available social actions, recruitment, persuasion difficulty, guard reactions, teaching willingness and quest availability. It must not directly change prices; Set 27 consumes the appropriate social modifier and owns the economic result.

# 12. Family, Friendship, Romance and Marriage Architecture

Set 28 owns social relationship mechanics for friendship, family, romance and marriage. This ownership is deliberately separated from population biology and household storage.

## 12.1 Family Boundary

- Document 07 owns persistent household membership, residence, generation/life-stage state and migration.
- Document 13 owns culture-specific family customs, law, inheritance and political marriage context.
- Set 28 owns kinship/social-bond interpretation, relationship strength, courtship/romance, partnership/marriage decisions, social consequences and relationship milestones.

## 12.2 Milestone Model

Milestones are validated social states rather than automatic score thresholds. Examples include:

- recognised acquaintance;
- friend;
- close friend;
- rival;
- sworn ally;
- companion;
- romantic interest;
- committed partnership;
- marriage, where culture/law permits;
- estrangement;
- separation;
- reconciliation.

Exact eligibility, consent, player options, cultural restrictions, ceremony handling and household consequences belong to 28D/28E and related event/civilisation documents.

## 12.3 Consent and Agency Foundation

No relationship milestone that implies mutual commitment may be created unilaterally by a numeric score alone. Mutual eligibility and accepted social actions are required. NPC personality, existing commitments, law, culture, life stage, world state and player/NPC choice may all make a milestone unavailable.

# 13. Negotiation and Diplomacy Architecture

Set 28 owns the social process of negotiation and diplomacy.

## 13.1 Negotiation Inputs

- participant identities and authority;
- relationship/trust/fear/respect;
- personality and negotiation style;
- culture, etiquette and language;
- political/faction state from Document 13;
- economic terms from Set 27;
- legal constraints from governance/justice;
- active quest/event context;
- known leverage/evidence;
- threat and military context from combat/faction systems;
- prior promises and diplomatic memories.

## 13.2 Negotiation Outputs

Set 28 may produce:

- accepted/rejected/countered proposal;
- social concession or demand;
- relationship deltas;
- trust/fear/respect effects;
- promise/obligation social record;
- dialogue outcome;
- proposed contract/treaty command to an owning external system;
- event hooks;
- diplomatic memory.

It does not directly set a tax rate, market price, border, inventory transfer, war flag or route accessibility.

# 14. Crime Witness and Testimony Architecture

The Cross-Set Register assigns crime witnesses to Set 28. This does not make Set 28 the Crime and Justice System.

## 14.1 Witness Ownership

Set 28 owns:

- whether a person perceived a socially relevant incident, using supplied perception facts;
- whether they recognise involved identities;
- confidence and memory of the observation;
- willingness to report, conceal or distort the statement according to social state and authored rules;
- the social consequences of witnessing;
- the witness statement record.

Set 28 does not own:

- whether an action legally counts as a crime;
- physical evidence generation;
- chain of custody;
- arrest, trial, guilt or sentence;
- guard pathfinding or combat response.

Document 20C's justice/evidence architecture remains the legal owner and consumes witness statements as one evidence source.

# 15. Companion, Follower and Recruitment Architecture

Set 28 owns recruitment, companion social state and companion AI at the social/decision level.

## 15.1 Companion Classes

The architecture must support:

- temporary allies;
- hired followers;
- recruited specialists;
- guards or escorts;
- quest companions;
- long-term companions;
- socially bonded companions;
- faction-assigned companions;
- player-settlement retainers where permitted.

The class describes social/command relationship, not locomotion or combat implementation.

## 15.2 Recruitment Inputs

Recruitment can depend on:

- relationship and trust;
- loyalty or faction permission;
- personality and personal goals;
- active duties/job commitments;
- household/family concerns;
- survival condition;
- economic contract/wage from Set 27;
- quest/event state;
- culture/law;
- player reputation;
- available companion capacity or world setting;
- travel feasibility from Set 30 where immediately relevant.

## 15.3 Companion AI Boundary

Set 28 owns:

- willingness to follow;
- loyalty and refusal logic;
- high-level priorities;
- social permission profile;
- preferred/forbidden orders;
- relationship-sensitive autonomy;
- companion status;
- delegated assignment state;
- reports, complaints and social consequences.

Other systems own:

- physical following and pathfinding - Set 30;
- combat action selection/execution - Combat/AI;
- health and fatigue - Set 29;
- inventories/items - inventory systems;
- wages/payments - Set 27;
- quest objective state - Document 15.

# 16. Orders, Delegation and Off-Screen Social Agency

Delegation allows companions or authorised NPCs to perform meaningful assignments without becoming a remote-control strategy army.

## 16.1 Delegation Architecture

Set 28 owns:

- who may be asked;
- whether they consent;
- assignment social contract;
- priority and permission boundaries;
- refusal reasons;
- relationship impact;
- reporting and accountability;
- abandonment/desertion/betrayal social outcomes;
- social memory of the assignment.

The actual task's domain owner resolves task-specific work. For example, Set 30 resolves travel, Document 07 resolves ordinary job labour, Set 27 resolves trade transactions, Document 15 resolves quest objective completion and Combat resolves fighting.

## 16.2 Delegation Principle

Delegation must reduce repetitive labour without allowing a companion to bypass progression, discover impossible information, teleport resources or complete tasks through a private simulation that ignores the owning gameplay system.

# 17. Culture, Language, Law and Etiquette Integration

Set 28 consumes civilisation identity rather than flattening everyone into one universal dialogue style.

## 17.1 Culture Inputs

Document 13 may supply:

- culture and subculture;
- language and fluency rules;
- naming conventions;
- etiquette and taboo tags;
- authority structures;
- law and social status;
- faith/philosophy;
- family custom;
- hospitality norms;
- diplomatic customs;
- faction history and grievance;
- accepted/restricted practices.

Set 28 turns these into social interaction constraints and reactions while preserving individual personality and agency.

## 17.2 Anti-Stereotype Rule

A culture changes social context; it does not hard-code identical personalities or morality. Individual beliefs, mixed identities, migration, assimilation, diaspora, faction splits and personal history must remain possible as established in Document 13.

# 18. Quest, Event and Story Integration

Document 15 remains the quest/event authority. Set 28 exposes social states and consumes quest/event context.

## 18.1 Social Inputs to Quests/Events

- relationship milestone reached or broken;
- persuasion/negotiation outcome;
- companion recruited/dismissed/deserted;
- promise made/kept/broken;
- rumour learned or corrected;
- witness statement created;
- diplomatic proposal accepted/rejected;
- family/romance milestone;
- apology/reconciliation;
- social reputation threshold crossed;
- delegated assignment outcome.

## 18.2 Quest Inputs to Social System

- active objective/context;
- required speaker/participant;
- authored line/choice locks;
- story-critical facts;
- timing/deadline;
- prior branch state;
- event emergency state;
- reward/obligation result.

Set 28 must not silently advance a quest because a line displayed; the quest owner advances only after receiving a valid committed social event.

# 19. Economy Interface Integration

Set 28 consumes Set 27 facts in merchant dialogue, bargaining, recruitment and diplomacy.

## 19.1 Economy Inputs

Expected inputs include:

- `BuyPrice()`
- `SellPrice()`
- `MarketAvailability()`
- `MerchantInventory()`
- economic standing/reputation;
- wage offers;
- contract summaries;
- trade opportunities;
- settlement wealth or affordability where relevant.

## 19.2 Social Outputs to Economy

Set 28 may expose:

- trust;
- relationship level;
- fear/respect where approved;
- persuasion modifier;
- merchant personality/social style;
- negotiation outcome;
- companion contract social acceptance;
- promise/reliability social state.

Set 27 decides how these affect actual price, credit, wage, contract or tax results.

# 20. Survival Interface Integration

Set 28 consumes Set 29 condition state to keep social behaviour believable.

Examples:

- an exhausted NPC may decline a long conversation;
- a severely injured companion may refuse an optional expedition;
- illness may trigger concern, care requests or modified social availability;
- recovery may enable delayed follow-up conversations;
- survival-derived mood penalties may reduce patience but do not create a permanent personality change by default.

Set 28 never computes injury severity, disease progression, fatigue drain, healing time or medicine.

# 21. Movement and Transportation Interface Integration

Set 28 consumes Set 30 travel and movement facts for companions and group interaction.

Examples:

- determine whether a companion can physically join the current travel mode;
- request a follow/formation intent;
- query whether a vehicle has a valid passenger seat;
- query mount status before offering a ride-related command;
- estimate whether an assignment is currently travel-reachable;
- suspend or recontextualise conversation during incompatible movement states.

Set 28 does not compute pathfinding, speed, formation positions, seat transforms, mount handling, vehicle physics or route accessibility.

# 22. Combat, Magic, Settlement and World-State Integration

## 22.1 Combat

Combat supplies facts such as injury, surrender, rescue, friendly fire, death, capture, threat and historical combat events. Set 28 converts meaningful facts into fear, trust, grievance, gratitude, trauma-facing social reactions or relationship memories where appropriate.

## 22.2 Magic

Magic may supply social facts such as known spell use, forbidden practice, magical disguise, mind-affecting attempt, ritual participation or curse state. Set 28 never invents magical effects and must respect culture/faction/legal interpretations from their owners.

## 22.3 Settlement

Settlement systems supply household, leadership, service, law, crisis and community context. Social systems can affect morale-facing events, social cohesion, recruitment and requests, but they do not create Housing/Provisions/Health/Work/Safety/Infrastructure/Morale service capacity directly.

## 22.4 World State

The world may remember monuments, conquest, destruction, restoration, migration and history. Set 28 links social memories and reputation to those facts without becoming the history registry itself.

# 23. Simulation LOD and Distant Social Resolution

Leyforge already uses detailed nearby simulation and bounded distant summaries. Social systems must follow the same rule.

## 23.1 Social LOD Tiers

| Tier | Social Representation | Typical Behaviour |
| --- | --- | --- |
| L0 - Active Interaction | Full conversation session, local perception, live participants, gestures/voice hooks. | Player-facing dialogue, immediate companion command, witnessed incident. |
| L1 - Local Reduced | Relationship and social-task checks at reduced frequency; no full conversation presentation. | Nearby residents socialise, companions follow routine priorities. |
| L2 - Settlement Summary | Batched social events, household/community interactions, memory propagation and relationship maintenance. | Unseen portion of active settlement. |
| L3 - Regional Abstract | Only consequential social events, diplomacy, migration-relevant relationships and companion assignments resolve. | Distant settlements, factions, caravans, expeditions. |
| L4 - Dormant | Persistent records and wake conditions only. | Very distant inactive individuals with no active social commitment. |

## 23.2 LOD Preservation Rule

Promotion/demotion must preserve:

- person identity;
- relationship edges;
- persistent social memories;
- social reputation evidence;
- companion bond/status;
- active promises/obligations;
- diplomacy sessions that are allowed to persist;
- delegated assignment state;
- relationship milestones;
- consequential witness statements.

Ambient conversation lines do not need persistence unless they create a real fact or social consequence.

# 24. Persistence, Save and Migration Requirements

Social systems are save-critical because the game's promise depends on people remembering the player.

## 24.1 Persistent Minimum

Named/persistent characters must retain, as applicable:

- social personality reference/state;
- relationship edges;
- persistent memory records;
- reputation evidence/summary;
- friendship/family/romance milestones;
- companion bond and command permissions;
- active delegated assignments;
- unresolved promises/obligations;
- witness statements with legal links;
- diplomacy/social commitments;
- relevant conversation branch state when authored content requires it.

## 24.2 Migration Rule

Definitions may change; runtime identity must survive. Migrations must preserve persistent person IDs and relationship endpoints. Removed relationship dimensions or personality definitions require explicit migration, alias or tombstone handling under Set 25 rules rather than silent deletion.

# 25. Multiplayer Authority and Shared Social Consequence

Social interaction requires explicit authority because multiple players may speak to, recruit or command the same NPC.

## 25.1 Conversation Scope Types

- personal conversation;
- party-visible personal choice;
- party leader choice;
- vote;
- consensus-required choice;
- settlement/faction authority choice;
- host/world-authority choice only where unavoidable and clearly declared.

## 25.2 Companion Authority

A companion must declare:

- recruiting player or owning social party;
- who may issue commands;
- whether commands can be shared;
- whether the companion has personal loyalty to one player or a group;
- conflict resolution when players give incompatible orders;
- permissions for inventory, travel and dismissal;
- server-authoritative final state.

## 25.3 No Client-Owned Social Truth

Clients may display predicted dialogue selection and presentation but may not commit relationship changes, recruitment, payments, treaty outcomes, quest branches or companion state without authoritative validation.

# 26. UI, Voice, Accessibility and Localisation Requirements

Document 17 remains UI/UX owner. Set 28 must provide enough structured data for truthful presentation.

## 26.1 Required Social View Data

- speaker identity and portrait reference;
- known name/title/pronouns where available in content;
- conversation topic/context;
- selectable actions with availability reason;
- consequence warnings where the character could reasonably understand them;
- relationship/reputation summary at the configured information level;
- important memory/context references;
- language comprehension state;
- companion status and order reason codes;
- negotiation proposal/counterproposal summary;
- subtitles and localisation keys;
- accessibility metadata;
- authoritative failure reasons.

## 26.2 Accessibility

Social interaction must support:

- complete subtitles/captions;
- scalable/reflowing dialogue text;
- speaker identification;
- non-colour relationship/status cues;
- sufficient response time or pausable choices unless the design intentionally uses a timed event and accessibility settings allow extension;
- simplified choice presentation;
- replayable conversation history where spoilers and deception rules permit;
- reduced animation/motion dependence;
- keyboard/controller/split-screen navigation;
- narration-ready labels.

## 26.3 Localisation Architecture

Definitions store localisation keys rather than final hard-coded English text where practical. Language-system gameplay and real-world localisation are separate: an NPC speaking an in-world language may still be rendered through the player's localisation language while preserving comprehension mechanics through UI conventions.

# 27. Registry, Data and Naming Direction

Set 28 adopts Set 25 qualified IDs and registry separation.

## 27.1 Proposed Official Domains

Subject to final Set 25 schema registration, Set 28 should use domains such as:

- `leyforge.core.social.*`
- `leyforge.core.relationship.*`
- `leyforge.core.dialogue.*`
- `leyforge.core.companion.*`
- `leyforge.core.diplomacy.*`

Examples:

- `leyforge.core.relationship.dimension.trust`
- `leyforge.core.relationship.milestone.close_friend`
- `leyforge.core.social.memory.rescue`
- `leyforge.core.dialogue.intent.apologise`
- `leyforge.core.companion.role.scout`
- `leyforge.core.diplomacy.action.propose_ceasefire`

Exact domain registrations are not final until checked against 25B/25C.

## 27.2 Runtime Identity

Runtime relationship and social-memory records use world/save IDs. They must never use scene-tree paths, transient actor references or display names as persistent identity.

# 28. Validation, Diagnostics and Test Strategy

Set 28 must be testable as a stateful simulation rather than only by reading dialogue.

## 28.1 Definition Validation

Hard-fail examples:

- invalid canonical IDs;
- missing personality/relationship definitions;
- dialogue choice points to nonexistent required fact;
- relationship milestone references impossible participants;
- companion role references unavailable required interface;
- diplomacy action tries to mutate an unowned field directly;
- missing localisation key for production dialogue;
- cyclic inheritance in social definitions;
- invalid cross-pack dependencies.

## 28.2 Runtime Validation

Test cases include:

- relationship persists through save/load;
- memory is linked to source evidence;
- NPC does not know an undiscovered fact without a valid information path;
- rumour confidence is preserved and does not rewrite world truth;
- deceased/migrated NPC invalidates or redirects a conversation safely;
- companion refuses an invalid order with a reason;
- economic negotiation never changes money without Set 27 transaction confirmation;
- injured companion state comes from Set 29;
- formation/mount/travel state comes from Set 30;
- dialogue cannot advance a quest without a committed quest event;
- witness statement does not itself convict a suspect;
- LOD demotion/promotion preserves relationship and memory;
- multiplayer simultaneous interaction resolves authority consistently.

## 28.3 Diagnostics

Developer tools should expose:

- social profile inspector;
- relationship edge inspector;
- memory/evidence chain;
- conversation context inspector;
- dialogue eligibility reasons;
- recruitment/refusal reasons;
- companion command state;
- diplomacy proposal state;
- witness confidence/source;
- social reputation composition;
- LOD state;
- cross-set interface query results;
- source-of-truth owner for each displayed field.

# 29. Document Set 28 Map and Specialist Ownership

28A locks the following working map.

| Document | Title | Primary Ownership |
| --- | --- | --- |
| 28A | Social-System Vision, Architecture and Ownership | Set identity, ownership, architecture, cross-set contracts, state separation, LOD, persistence and suite governance. |
| 28B | Dialogue Runtime, Conversation Structure and Context | Conversation sessions, topics, intents, conditions, branching, interruptions, context and interaction lifecycle. |
| 28C | Knowledge, Rumours, Truth, Lies, Languages and Information Spread | Knowledge state, belief, confidence, rumours, deception, information propagation, language comprehension and provenance. |
| 28D | Relationships, Memory, Trust, Loyalty, Affection, Friendship, Family and Romance | Relationship dimensions, milestones, memory effects, friendship, family bonds, romance, marriage/partnership and long-term social history. |
| 28E | Persuasion, Negotiation, Intimidation, Etiquette, Reputation Reactions and Diplomacy | Social checks/modifiers, persuasion, negotiation, intimidation, cultural etiquette, diplomacy process and social reputation reactions. |
| 28F | Companion, Follower, Hireling and Temporary-Ally System | Recruitment, companion status, loyalty, autonomy, permissions, roles, dismissal and social companion state. |
| 28G | Orders, Delegation, Assignments, Autonomy and Off-Screen Resolution | Commands, assignment contracts, delegation, refusal, reporting, failure, off-screen work and domain handoffs. |
| 28H | Authored, Procedural and AI-Assisted Dialogue Governance | Authored/systemic balance, content-generation constraints, lore/state grounding, review, safety, provenance and fallback. |
| 28I | Voice, Localisation, Accessibility, UI and Presentation | Social presentation requirements consumed by Documents 17/23, voice/subtitle hooks, localisation, accessibility and conversation history. |
| 28J | Multiplayer, Persistence, Registries, Validation and Cross-System Integration | Final technical contracts, save/migration, multiplayer authority, registry templates, validation suites and complete integration matrix. |

> **Suite Boundary Rule**  
> A later Set 28 document may refine mechanics inside its assigned column but may not absorb a Set 27, 29 or 30 gameplay system. Any new cross-set requirement is recorded in its Cross-Set Interface Amendments section.

# 30. Production Scope and Staged Delivery

Set 28 should not attempt to author every possible social line or relationship at once.

## 30.1 Production Layers

### Foundation

- social registries and IDs;
- social profile/personality;
- relationship edges;
- memory records;
- simple dialogue context;
- basic recruitment status;
- reason codes and save support.

### Core Production

- authored + systemic conversation framework;
- trust/fear/affection/loyalty;
- friendship and family integration;
- persuasion and negotiation;
- social reputation;
- companion recruitment and basic commands;
- crime witness statements;
- culture/language interaction;
- quest/event integration;
- multiplayer-ready authority.

### Expanded Production

- romance and marriage depth;
- group conversations;
- deep diplomacy;
- richer companion autonomy and delegation;
- complex rumours/deception;
- extended cultural etiquette;
- large companion content roster;
- AI-assisted dialogue if approved and validated.

## 30.2 Post-POC Position

The existing POC already proves named villagers with persistent identity, basic dialogue, reputation and actor streaming. The Set 28 production goal is not to preserve Forest Hamlet as required content. POC actors and arrangements remain archive/test fixtures. New social systems must work with arbitrary seed-generated people, settlements, cultures and factions.

# 31. 28A Acceptance Criteria

Document 28A is acceptable when all of the following are true:

- Set 28 has one clear gameplay identity.
- Cross-Set Interface Register v1.0 is adopted without ownership drift.
- Set 28 ownership is separated from Sets 27, 29 and 30.
- Persistent NPC identity remains owned by Document 07.
- Culture/faction identity and political world state remain owned by Document 13.
- Quest/event state remains owned by Document 15.
- Justice remains owner of legal guilt/sentencing while Set 28 owns witnesses.
- UI and Forge presentation remain non-authoritative consumers.
- Relationship, personality, social memory, social reputation, companion and dialogue runtime records are clearly separated from immutable definitions.
- Social memories link to factual evidence rather than replace it.
- Family/romance ownership is separated from household/population state.
- Diplomacy interaction is separated from territory/economic/legal mutation.
- Companion AI ownership is separated from movement, combat, survival and economy execution.
- Social LOD preserves consequential state.
- Multiplayer scope and authority are explicit.
- Set 28 document map has no obvious duplicate owner.
- Required cross-set API gaps are recorded rather than silently solved.

# 32. Open Questions Assigned to Later Documents

28A intentionally does not lock the following details:

- exact relationship numeric ranges and decay curves - 28D;
- exact romance/marriage eligibility and milestone rules - 28D/28E;
- exact dialogue graph schema and interruption policy - 28B;
- exact rumour distortion and deception algorithms - 28C;
- exact persuasion formula and negotiation difficulty - 28E;
- exact companion roster size, party size and command granularity - 28F;
- exact delegation task library and off-screen timing - 28G;
- whether and how AI-assisted runtime dialogue is permitted - 28H;
- voice synthesis/recorded voice production strategy - 28I/Presentation governance;
- final multiplayer conversation choice modes by content category - 28J;
- final Godot Resource/class names - 28J and rewritten Document 18;
- final public modding exposure of social definitions - 28J/Set 25;
- balance values for trust, affection, loyalty, fear and social reputation - specialist documents and testing.

# 33. Cross-Set Interface Amendments

The governing register remains unchanged unless explicitly approved. 28A identifies the following **proposed additions/clarifications** because the receive lists in the register require data not currently represented by named exposed functions.

## 33.1 Proposed Set 27 -> Set 28 Additions

| Proposed Interface | Owner | Purpose | Ownership Impact |
| --- | --- | --- | --- |
| `WageOffer(actor_or_role, context)` | Set 27 | Supplies current wage/compensation terms for recruitment and negotiation. | None; Set 27 retains wage calculation. |
| `ContractSummary(contract_id)` | Set 27 | Supplies authoritative non-mutating contract terms for dialogue and companion recruitment. | None; Set 28 does not own contract enforcement/payment. |
| `TradeOpportunities(actor_or_settlement, context)` | Set 27 | Supplies current economy-generated opportunities that may be discussed socially. | None. |
| `EconomicStanding(subject, observer_scope)` | Set 27 | Supplies economy-specific reliability/credit/trade standing distinct from Set 28 social reputation. | None. |

## 33.2 Proposed Set 29 -> Set 28 Additions

| Proposed Interface | Owner | Purpose | Ownership Impact |
| --- | --- | --- | --- |
| `RecoveryStatus(entity)` | Set 29 | Allows conversation/recruitment/delegation to understand whether a condition is improving, stable or worsening. | None. |
| `SurvivalSocialModifier(entity)` | Set 29 | Provides a bounded survival-derived modifier such as exhaustion/illness impact without exposing or duplicating medical formulas. | None. |

## 33.3 Proposed Set 30 -> Set 28 Additions

| Proposed Interface | Owner | Purpose | Ownership Impact |
| --- | --- | --- | --- |
| `TravelState(entity_or_party)` | Set 30 | Supplies whether the actor is walking, mounted, in vehicle transit, waiting, blocked or arrived. | None. |
| `PassengerSeatAvailability(vehicle, passenger_profile)` | Set 30 | Allows Set 28 to validate a social passenger assignment before issuing a travel intent. | None. |
| `FormationResolution(group, formation_intent)` | Set 30 | Resolves Set 28 high-level formation intent into physically valid positions. | None; Set 30 retains movement/pathing. |

## 33.4 Proposed Set 28 -> Set 27/30 Clarifications

| Proposed Interface | Consumer | Purpose | Ownership Impact |
| --- | --- | --- | --- |
| `CompanionAgreement(subject)` | Set 27 | Exposes social consent, service role, duration/termination state and companion status; Set 27 attaches payment terms separately. | Clarifies companion contract split without transferring contract economics. |
| `FormationIntent(group)` | Set 30 | Exposes social/command formation preference and role ordering only. | Set 30 still resolves positions/path. |
| `PassengerAssignment(vehicle_or_trip)` | Set 30 | Exposes who is socially assigned/authorised as passenger. | Set 30 validates seating and movement. |
| `CompanionTravelPermission(companion, travel_context)` | Set 30 | Exposes whether the companion is willing/authorised to participate in the requested travel. | Movement mechanics remain Set 30. |

> **Amendment Status**  
> Proposed for final integration review. These additions do not transfer system ownership. Until approved, Set 28 documents should refer to the semantic requirement and flag the dependency rather than assume a permanent API name.

# Appendix A. Social Definition and Runtime Record Catalogue

| Record | Type | Owner | Purpose |
| --- | --- | --- | --- |
| SocialPersonalityDefinition | Immutable definition | Set 28 | Reusable social tendencies and modifiers. |
| RelationshipDimensionDefinition | Immutable definition | Set 28 | Defines trust/affection/fear/loyalty/etc. semantics and bounds. |
| RelationshipMilestoneDefinition | Immutable definition | Set 28 | Defines named social milestones and validation hooks. |
| SocialMemoryCategoryDefinition | Immutable definition | Set 28 | Defines significance, decay and interpretation categories. |
| DialogueIntentDefinition | Immutable definition | Set 28 | Defines social intent such as ask, apologise, persuade, threaten, recruit. |
| ConversationTemplateDefinition | Immutable definition | Set 28 | Authored/systemic conversation structure. |
| CompanionRoleDefinition | Immutable definition | Set 28 | Social role, permissions and expected companion relationship. |
| DelegationTaskDefinition | Immutable definition | Set 28 | Social assignment contract and required external domain interface. |
| DiplomacyActionDefinition | Immutable definition | Set 28 | Social proposal/action grammar for diplomacy. |
| SocialProfileState | Persistent runtime | Set 28 | Person's social profile references and mutable social state. |
| RelationshipEdgeState | Persistent runtime | Set 28 | Directed relationship dimensions between persistent identities. |
| SocialMemoryRecord | Persistent runtime | Set 28 | Evidence-linked remembered social event. |
| SocialReputationState | Persistent runtime | Set 28 | Scope-aware social reputation summary/evidence. |
| CompanionBondState | Persistent runtime | Set 28 | Recruitment, loyalty, permissions, status and social commitment. |
| DelegatedAssignmentState | Persistent runtime | Set 28 | Social assignment, consent, status and result links. |
| ConversationSessionState | Temporary/runtime | Set 28 | Active conversation participants, context, choices and authority. |
| DiplomacySessionState | Temporary/persistent as needed | Set 28 | Active diplomatic negotiation process. |
| WitnessStatementRecord | Persistent runtime | Set 28 | Witness identity, observed event reference, confidence and statement state. |

# Appendix B. Social API Contract v0.1

The following queries are the minimum public social interface. Exact implementation signatures belong to 28J.

| Query | Returns | Notes |
| --- | --- | --- |
| `RelationshipLevel(subject, target, context?)` | Resolved relationship summary/milestone | Does not replace individual dimensions. |
| `Trust(subject, target)` | Trust value/state | Persistent directed relationship dimension. |
| `Affection(subject, target)` | Affection value/state | Used by friendship/family/romance as appropriate. |
| `Fear(subject, target)` | Fear value/state | Social fear, not combat threat calculation. |
| `Loyalty(subject, target_or_group)` | Loyalty value/state | Used by companions, factions and relationships where valid. |
| `PersuasionModifier(speaker, listener, context)` | Social modifier + reason breakdown | Economy/combat/survival outcomes remain external. |
| `CompanionStatus(person, requester_or_party?)` | Status/permissions/reason | Recruited, temporary, unavailable, dismissed, etc. |
| `SocialMemory(person, query)` | Filtered memory records/summary | Respects knowledge, privacy and UI rules. |

Suggested Set 28 event outputs include:

- `SocialMemoryCreated`
- `RelationshipChanged`
- `RelationshipMilestoneChanged`
- `ConversationChoiceCommitted`
- `PromiseCreated`
- `PromiseResolved`
- `RecruitmentResolved`
- `CompanionStatusChanged`
- `DelegatedAssignmentChanged`
- `DiplomacyOutcomeResolved`
- `WitnessStatementCreated`
- `SocialReputationChanged`

# Appendix C. Cross-System Responsibility Matrix

| Concern | Set 28 Owns | Consumes/Delegates To |
| --- | --- | --- |
| Merchant bargaining | Social negotiation, trust, persuasion, memory | Set 27 price/stock/transaction. |
| Companion wages | Recruitment willingness and companion agreement | Set 27 wage/payment contract. |
| Injured companion | Social concern, refusal, loyalty effects | Set 29 injury/recovery; Combat source event. |
| Companion following | Willingness, command intent, party membership | Set 30 path/movement. |
| Mounted companion | Social permission/assignment | Set 30 mount and seat mechanics. |
| Marriage | Social relationship/mutual milestone | Document 07 household change; Document 13 law/custom; Document 15 ceremony event. |
| Witnessed theft | Memory and statement | Inventory/justice crime fact and legal process. |
| Faction negotiation | Social/diplomatic session and relationship effects | Document 13 political state; Set 27 economic terms; Document 15 event hooks. |
| Quest dialogue | Conversation and relationship outcome | Document 15 quest state. |
| Social animation | Semantic event request | Entity/Presentation Forge. |
| Voice/subtitles | Content keys and speaker context | Documents 17/23. |

# Appendix D. Social Event and Reason-Code Families

Reason codes should be stable, localisable and inspectable. Initial families include:

- `social.unavailable.*`
- `social.relationship.*`
- `social.memory.*`
- `social.language.*`
- `social.etiquette.*`
- `social.recruitment.*`
- `social.companion.*`
- `social.delegation.*`
- `social.diplomacy.*`
- `social.witness.*`
- `social.authority.*`
- `social.external_dependency.*`

Examples:

- `social.unavailable.sleeping`
- `social.unavailable.emergency`
- `social.recruitment.insufficient_trust`
- `social.recruitment.active_duty`
- `social.companion.refused_order`
- `social.delegation.route_unavailable`
- `social.diplomacy.not_authorised_representative`
- `social.language.insufficient_comprehension`
- `social.witness.identity_uncertain`
- `social.external_dependency.contract_invalid`

# Appendix E. Glossary

**Affection** - A Set 28 relationship dimension representing positive emotional attachment. It does not by itself imply romance.

**Companion Agreement** - The social/role commitment defining that a person has agreed to accompany or serve with a player/party. Economic compensation remains Set 27-owned.

**Conversation Context** - The authoritative collection of participants, relationships, knowledge, external facts and permissions used to resolve a social interaction.

**Diplomacy Session** - A Set 28 social negotiation between authorised representatives. Political world-state changes remain owned by civilisation/political systems.

**Relationship Edge** - A saved directed social connection between persistent identities containing one or more relationship dimensions and milestone references.

**Social Memory** - A person's or social scope's evidence-linked remembered interpretation of an event relevant to social behaviour.

**Social Personality** - A reusable definition describing social tendencies and reaction modifiers without replacing individual identity, culture or morality.

**Social Reputation** - A propagated or aggregated social perception derived from evidence and information flow. It remains distinct from economic standing, legal status and raw faction world state.

**Witness Statement** - A persistent social record of what a person claims to have observed, including confidence and source links. It is evidence input, not a legal verdict.

---

**End of Document 28A - Social-System Vision, Architecture and Ownership v0.1**
