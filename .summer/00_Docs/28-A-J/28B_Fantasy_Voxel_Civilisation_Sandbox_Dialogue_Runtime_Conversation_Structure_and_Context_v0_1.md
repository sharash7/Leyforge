# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28B - Dialogue Runtime, Conversation Structure and Context

**Dialogue, Social Interaction, Relationships, Companions and Delegation**

**Version 0.1 - Dialogue Runtime Foundation Draft**

A canonical, data-driven runtime for direct conversation, contextual dialogue, authored dialogue graphs, systemic social interaction, conversation topics, intents, choice eligibility, branching, interruptions, multi-party participation, quest/event handoffs, world-continuous interaction and authoritative social consequences without allowing dialogue content to invent state owned by economy, survival, movement, quests, law, combat, factions or presentation systems.

**Project Lead and Final Authority:** Ash

> **Dialogue Runtime Statement**  
> Leyforge dialogue must feel like conversation with persistent people who exist inside a living world, not like opening a detached quest terminal. Every consequential line and choice must be grounded in who is speaking, what each participant can know, what has happened between them, what the world is currently doing and which system owns the result. Conversation may be authored, contextual or systemic, but it must remain interruptible, multiplayer-safe, save-safe, localisable, inspectable and unable to manufacture facts that the simulation has not established.

| Field | Locked Direction |
| --- | --- |
| Document Set | Document Set 28 - Dialogue, Social Interaction, Relationships, Companions and Delegation. |
| Document Role | 28B is the detailed authority for conversation sessions, dialogue runtime, conversation structure, topics, intents, conditions, branching, contextual assembly, interruption, resumption and interaction lifecycle. |
| Governing Contract | The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** and Document 28A are governing contracts. 28B consumes external facts and never redefines Set 27 economy, Set 29 survival or Set 30 movement. |
| Runtime Philosophy | Use a hybrid authored-and-systemic conversation runtime. Important scenes may use authored graphs; ordinary interaction can assemble reusable intent/topic content from valid context. Both use the same authoritative session and command pipeline. |
| World Continuity | Conversation does not automatically freeze the world. NPC schedules, threats, events and multiplayer continue unless an owning world/pause rule explicitly pauses simulation. Active conversation creates a bounded social commitment, not invulnerability. |
| Knowledge Boundary | 28C owns knowledge, belief, rumours, lies, language comprehension and information propagation. 28B queries those states to decide what content can be spoken or understood. |
| Relationship Boundary | 28D owns relationship dimensions, long-term memory effects and relationship milestones. 28B consumes their resolved states and emits committed conversation events. |
| Social Check Boundary | 28E owns persuasion, intimidation, negotiation resolution, etiquette and diplomacy formulas. 28B owns how those actions enter and leave the conversation runtime. |
| Companion Boundary | 28F/28G own recruitment, companion state, orders and delegation. 28B provides the conversation wrapper and choice lifecycle only. |
| AI-Dialogue Boundary | 28H owns whether AI-assisted or procedural generation may author or assemble dialogue. 28B defines the runtime contract every provider must satisfy. |
| Presentation Boundary | Document 17 and 28I own screen layout, focus, captions, localisation presentation, voice presentation and accessibility presentation. 28B supplies semantic dialogue state, available actions, text/localisation keys and authoritative reason codes. |
| Multiplayer Boundary | 28B supports declared conversation scopes and authority modes. 28J finalises network replication, vote/consensus policy and save/migration contracts. |
| Engine Direction | Runtime design is engine-neutral but aligned to Godot/Summer Engine: stable IDs, Resources/definitions, persistent records, command/event services and no NodePath-as-identity assumptions. |
| Production Direction | The existing Forest Hamlet dialogue remains a useful regression fixture, not required production content. New dialogue must function with arbitrary seed-generated people, settlements, cultures, factions and world histories. |

# Document Purpose

Document 28B defines how a social interaction becomes an active conversation, how participants and context are bound, how valid topics and intentions are selected, how authored and systemic dialogue share one runtime, how choices are filtered and committed, how the world may interrupt the interaction and how a session closes without confusing presentation text with authoritative state.

Leyforge already establishes persistent named NPCs, schedules, social memory, quests, faction identity, multiplayer authority and adaptive UI. The missing detailed layer is the conversation runtime connecting those systems. Document 07 explicitly states that a memory references an event or summarised cause and that dialogue text is presentation rather than the memory source. Document 15 makes quests expressions of real world state rather than free-standing text. Document 17 expects intent-based choices, known-consequence indicators, interruption rules and world continuity. Document 18 v0.2 requires stable IDs, authoritative commands/events and multiplayer-scoped dialogue. 28B turns those requirements into one coherent runtime.

This document does **not** decide whether a rumour is true, how affection changes, whether persuasion succeeds, what an item costs, how tired an NPC is, whether a route is traversable or whether a treaty alters territory. It defines how those external facts and specialist social outcomes participate in conversation without ownership drift.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28B | 28B Relationship |
| --- | --- | --- |
| 00 - Master Game Design Bible | Named people, player freedom, meaningful consequences and civilisation interaction. | Dialogue supports help, trade, friendship, threat, betrayal, diplomacy and other valid playstyles without imposing a heroic voice. |
| 01 - Core Gameplay Loop | Interaction includes talking, trading, requests, recruitment, training, helping, threatening and conquering. NPCs socialise in daily life. | Conversation is a first-class loop activity that coexists with schedules and world events. |
| 02 - Player Progression | Diplomacy/Reputation, Leadership and knowledge are progression channels. | Progression may unlock eligibility or context but does not replace social/runtime checks. |
| 07 v0.2 - NPC Village System | Persistent identity, schedules, commitments, memory, household context and dialogue hooks. | 07 supplies people and availability context. 28B owns active conversation session state and runtime structure. |
| 13 - Races, Peoples, Cultures and Factions | Culture, language definitions, law, status, government and faction identity remain separate. | 28B binds these facts into conversation context; 28C/28E resolve comprehension and etiquette. |
| 15 - Quest and Event System | Authored and simulation-generated quests use valid actors, world conditions, branching, rumours and persistent consequences. | Quest state may enable dialogue. 28B emits committed social events; Document 15 alone commits quest/event state. |
| 16 - Combat, Gear and Defence | Surrender, capture, intimidation, danger and combat aftermath affect interaction. | Combat facts can start, block, suspend or terminate dialogue. 28B never resolves combat. |
| 17 - UI/UX | NPC dialogue needs intent-based choices, known consequence indicators, interruption rules, world continuity, accessibility and multiplayer scope. | UI renders 28B view models and sends dialogue commands; widgets do not mutate social truth. |
| 18 v0.2 - Godot/Summer Technical Plan | Definitions/runtime separation, stable IDs, authoritative commands/events, multiplayer-scoped dialogue and localisable reason codes. | 28B follows those contracts while leaving final class names to 28J/technical implementation. |
| 19-20 | Real buildings, schedules, services, governance sites and persistent world instances. | Conversation may occur at valid physical/social anchors without inferring gameplay capacity from appearance. |
| 22/23 | Entity presentation, dialogue anchors, gestures, voice-event hooks and audiovisual presentation. | 28B emits semantic speaker/beat events only; presentation owns animation/audio execution. |
| 25 | Canonical IDs, field ownership, validation, content packs and migration. | All dialogue definitions and relationships use canonical registry contracts. |
| 26 | Crews, captains, passengers, piracy, naval diplomacy and maritime social roles. | Maritime content consumes the general dialogue runtime; 28B does not redefine maritime gameplay. |
| 28A | Set identity, ownership, record separation, social API and cross-set contract. | Governing parent document. |

# Static Table of Contents

1. Locked Dialogue Runtime Identity  
2. Ownership Boundaries and Anti-Duplication Rules  
3. Locked Decision Summary  
4. Dialogue Runtime Architecture  
5. Definition, Session, Transcript and Event Separation  
6. Conversation Session Lifecycle  
7. Participants, Roles, Speaker Turns and Audience  
8. Conversation Entry, Availability and Commitment  
9. Conversation Context Snapshot and Live Revalidation  
10. Topics, Topic Discovery and Topic Hubs  
11. Dialogue Intents and Social Action Grammar  
12. Dialogue Beats, Utterances, Prompts and Response Units  
13. Conditions, Eligibility, Visibility and Reason Codes  
14. Choice Construction, Selection and Authoritative Commit  
15. Branching, Hubs, Redirects, Returns and Closure  
16. Contextual and Systemic Dialogue Assembly  
17. Authored Dialogue, Story-Critical Beats and Overrides  
18. Interruptions, Suspension, Resumption and Invalidation  
19. World Continuity, Time, Schedules and Physical Presence  
20. Ambient Dialogue, Barks, Greetings and Incidental Social Speech  
21. Multi-Party and Group Conversations  
22. Quest, Event and Story Integration  
23. Economy, Trade, Service and Contract Conversation Integration  
24. Crime, Witness, Law, Surrender and Captivity Integration  
25. Survival, Movement, Combat and Emergency Integration  
26. Personality, Relationship and Social-Memory Hooks  
27. Knowledge, Rumour, Deception and Language Interfaces  
28. Presentation, Voice, Localisation and Accessibility Contract  
29. Multiplayer Conversation Scope and Choice Authority Foundation  
30. Persistence, Save/Load, Transcript and Simulation LOD  
31. Registry, Naming and Data Templates  
32. Diagnostics, Validation and Automated Test Strategy  
33. Production Scope and Staged Delivery  
34. 28B Acceptance Criteria  
35. Open Questions Assigned to Later Documents  
36. Cross-Set Interface Amendments  
Appendix A. Dialogue Definition Catalogue  
Appendix B. ConversationSessionState Template  
Appendix C. Initial Dialogue Intent Library  
Appendix D. Condition, Command and Event Module Library  
Appendix E. Dialogue Reason-Code Families  
Appendix F. Example Conversation Flows  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. Glossary

# 1. Locked Dialogue Runtime Identity

The Dialogue Runtime is the active social-interaction layer of Set 28. It controls a bounded session between persistent participants and turns valid world/social context into a sequence of understandable exchanges and player/NPC social actions.

> **Locked Rule**  
> A dialogue line may describe or react to authoritative state; it may not become the source of that state merely because the line was displayed. A consequential choice is real only after the owning system validates the requested action and the conversation runtime receives the committed result.

## 1.1 Design Promise

A player speaking to an NPC should experience a conversation that can answer:

- why this person is willing or unwilling to talk;
- what subject is currently relevant;
- what the player can ask, offer, promise, refuse or challenge;
- which options are unavailable and, when appropriate, why;
- how previous history changes tone and options;
- whether a quest, contract, danger, law or world event is affecting the conversation;
- whether another person is listening or participating;
- whether the world can interrupt the exchange;
- whether a selected response actually succeeded;
- what changed after the conversation and which system owns that change.

## 1.2 Conversation Is Not a Frozen Menu

Conversation is a world interaction, not a detached screen. The default design assumes:

- simulation continues;
- time may pass;
- danger may approach;
- NPC schedules may matter;
- additional participants may arrive or leave;
- players in multiplayer may move independently;
- a participant may become unavailable;
- an external system may invalidate an offer, contract, quest state or route while the conversation is open.

The runtime therefore uses **context snapshots plus live revalidation** rather than assuming the world remains unchanged after a panel opens.

## 1.3 What 28B Is Not

28B is not:

- a knowledge or rumour truth model;
- a persuasion probability system;
- a relationship scoring system;
- a price calculator or trade transaction owner;
- an NPC schedule owner;
- a pathfinding or interaction-distance physics owner;
- a quest graph owner;
- a legal verdict system;
- a voice-recording or lip-sync production system;
- a runtime generative-chat policy;
- a requirement that every NPC has hundreds of authored lines;
- permission for dialogue text to mutate arbitrary world state.

# 2. Ownership Boundaries and Anti-Duplication Rules

## 2.1 28B Owns

28B owns:

- conversation session creation and lifecycle;
- participant binding and conversation roles;
- conversation context assembly;
- topic and intent selection runtime;
- dialogue-beat traversal;
- choice candidate construction;
- condition evaluation routing;
- visibility/availability state for options;
- authoritative dialogue-choice commit pipeline;
- branching/redirect/return semantics;
- interruption/suspension/resumption policy;
- group-conversation runtime structure;
- ambient-dialogue runtime categories;
- conversation transcript event structure;
- dialogue-specific reason codes;
- dialogue definition schemas at the conceptual level;
- semantic presentation events for speech/choices.

## 2.2 28B Consumes but Does Not Own

| Concern | Owner | 28B Use |
| --- | --- | --- |
| NPC existence, schedule, current task, household, job | Document 07 | Determines participation and context. |
| Knowledge, belief, rumour, language comprehension | 28C | Filters speakable/understandable content. |
| Relationship values, milestones and long-term social memory | 28D | Influences content eligibility and tone. |
| Persuasion, intimidation, negotiation, etiquette and diplomacy resolution | 28E | 28B routes the intent and receives outcome. |
| Recruitment/companion state | 28F | Conversation can offer recruitment action and display result. |
| Delegated assignments | 28G | Conversation can propose assignment; 28G owns assignment state. |
| AI/procedural content-generation policy | 28H | Dialogue provider must satisfy 28B runtime contract. |
| UI, voice, subtitles, localisation display | 28I/Document 17/23 | Renders semantic conversation state. |
| Price, wages, merchant stock, contracts | Set 27 | Display/query only; transaction remains external. |
| Injury, illness, fatigue | Set 29 | Availability/tone input only. |
| Movement mode, route, mount, vehicle, seating | Set 30 | Availability/interruption/travel input only. |
| Quest/event stage | Document 15 | Choice may request event transition. |
| Combat result and danger | Document 16 | May interrupt or contextualise conversation. |
| Law, faction, government, political world state | Document 13/governance | Context only. |

## 2.3 No Hidden Side Effects

Dialogue definitions cannot contain arbitrary direct writes such as `set_reputation = 80`, `give_gold = 100`, `complete_quest = true` or `make_friend = true` as unvalidated side effects.

A dialogue choice may instead declare **intended commands/events**, for example:

- request a Set 27 transaction;
- request a Document 15 quest transition;
- request a 28E persuasion resolution;
- emit a Set 28 social statement/promise event;
- request recruitment from 28F;
- request a witness statement update;
- request a household/social milestone command from the correct owner.

The conversation transition can depend on the returned result.

# 3. Locked Decision Summary

| Area | Version 0.1 Locked Decision |
| --- | --- |
| Core Model | Hybrid authored + systemic dialogue through one shared conversation-session runtime. |
| Session Authority | Active conversation state is authoritative on the world host/server. UI is a consumer and command sender. |
| Context | Build a context snapshot at entry and revalidate volatile conditions immediately before consequential commits. |
| World Pause | Conversation does not pause world simulation by default. Solo pause behaviour remains a world/UI setting, not a dialogue assumption. |
| NPC Commitment | A participating NPC receives a bounded social commitment recognised by Document 07 task selection; emergencies can override it. |
| Choice Philosophy | Player choices are intent-based and consequence-aware where the character could reasonably know the stakes. |
| Choice Visibility | Options may be available, visible-but-unavailable with reason, redacted/unknown, or hidden according to knowledge/spoiler and content rules. |
| Consequential Mutation | A choice is committed only after authoritative revalidation. External gameplay mutations are commands to their owning systems. |
| Dialogue Graph | Use reusable conversation definitions made of beats and transitions. Graphs may contain hubs/returns rather than requiring a pure tree. |
| Topic Model | Topics are stable semantic definitions; availability comes from relationship, knowledge, world state, quest state and authored rules. |
| Intent Model | Intents describe what a speaker is trying to do socially, separate from exact wording. Specialist documents resolve complex intents. |
| Branching | Important authored scenes may branch deeply. Routine dialogue should prefer reusable hubs, contextual variants and short loops. |
| Interruptions | Explicit hard-invalidate, hard-interrupt, soft-suspend, graceful-close and presentation-only interruption classes. |
| Resumption | Resumable sessions keep a stable resume token/cursor and revalidate context; invalid sessions fall back to authored recovery or close cleanly. |
| Ambient Speech | Barks and incidental speech are low-consequence content and cannot directly create major persistent changes. |
| Multi-Party | Conversations support speaker, addressee, participant, observer/witness, moderator/interpreter and audience roles. |
| Knowledge | 28C decides knowable/speakable/understandable facts. 28B never invents knowledge. |
| Relationship | 28D supplies relationship state and receives committed conversation events. |
| Persuasion | 28E resolves persuasion/intimidation/negotiation. 28B owns presentation and branch routing around the outcome. |
| Multiplayer | Every consequential conversation declares personal, leader, vote, consensus or authorised-representative scope. Final policy matrix is 28J. |
| Save/Load | Consequential sessions can be saved at stable beat boundaries. On load, context is revalidated before resuming. |
| LOD | Full player-facing conversations run only at active/local social detail. Distant social outcomes use summaries/events, not hidden full dialogue simulation. |
| Localisation | Definitions reference localisation keys and semantic arguments. In-world language mechanics remain 28C; player-language localisation remains 28I/UI. |
| Production | Deep authored content is reserved for important characters/scenes; ordinary NPCs use reusable systemic dialogue plus authored local flavour. |

# 4. Dialogue Runtime Architecture

## 4.1 Runtime Flow

```text
Interaction Request / NPC Initiative / Quest Trigger
                        ↓
              Conversation Availability
                        ↓
             Participant + Authority Bind
                        ↓
                Context Snapshot Build
                        ↓
         Entry Topic / Template / Beat Selection
                        ↓
                  Active Conversation
                        ↓
         Build Candidate Intents and Choices
                        ↓
 Knowledge/Condition/Permission Filtering
                        ↓
              UI/Presentation View Model
                        ↓
                  Player Selection
                        ↓
              Authoritative Revalidation
                        ↓
       Specialist/External Command Resolution
                        ↓
             Commit Social Conversation Event
                        ↓
         Branch / Continue / Suspend / Close
```

## 4.2 Service Responsibilities

Conceptually, implementation should expose separate responsibilities rather than one enormous dialogue manager:

| Responsibility | Purpose |
| --- | --- |
| Conversation Service | Owns active session lifecycle and authoritative state. |
| Context Resolver | Builds read-only context from social and external systems. |
| Dialogue Definition Registry | Resolves templates, topics, intents, beats and transition definitions. |
| Eligibility Evaluator | Evaluates condition modules and reason codes. |
| Choice Committer | Revalidates chosen action and routes commands to owners. |
| Transcript/Event Recorder | Records committed semantic dialogue events and optional presentation transcript references. |
| Presentation Adapter | Produces view models for Document 17/28I. |
| Diagnostic Inspector | Explains why a line/choice/session is available, blocked, hidden, suspended or closed. |

Final Godot node/resource/service names are deferred to 28J and technical implementation.

# 5. Definition, Session, Transcript and Event Separation

Dialogue requires several data layers that must not be collapsed.

| Layer | Type | Example | Persistence |
| --- | --- | --- | --- |
| Dialogue Intent Definition | Immutable | apologise, ask_help, threaten | Registry/content pack |
| Dialogue Topic Definition | Immutable | local_shortage, personal_history, current_raid | Registry/content pack |
| Conversation Template Definition | Immutable | merchant_smalltalk, companion_recruitment, quest_scene_X | Registry/content pack |
| Dialogue Beat Definition | Immutable | speaker line, choice prompt, branch, external action, end | Registry/content pack |
| Conversation Session State | Runtime authoritative | active participants, current beat, scope, resume state | Temporary; save when required |
| Conversation Context Snapshot | Runtime read model | relationship, known facts, quest flags, external summaries | Rebuildable; limited persistence only if required |
| Dialogue Choice State | Runtime | candidate, visible, blocked reason, selected/committed | Session-scoped |
| Conversation Semantic Event | Historical fact | choice committed, promise spoken, topic disclosed | Persistent when consequential |
| Presentation Transcript | Player-facing history | displayed lines and speaker labels | UI/profile/world policy; not social truth |

> **Transcript Rule**  
> A transcript records what the player was shown. A social memory records what a persistent character remembers. A world event records what actually happened. These records may reference one another but are never interchangeable.

# 6. Conversation Session Lifecycle

## 6.1 Session States

A conversation session uses the following conceptual lifecycle:

1. **Requested** - an interaction attempt exists but participants/authority are not yet committed.
2. **Establishing** - availability, scope, roles and starting context are validated.
3. **Active** - one or more beats are resolving.
4. **Awaiting Choice** - runtime is waiting for the authorised player/group response.
5. **Resolving** - selected intent is being revalidated or routed to an external owner.
6. **Suspended** - conversation may resume after a temporary interruption.
7. **Closing** - farewell, consequence summary or cleanup beat is running.
8. **Ended** - session has completed normally.
9. **Invalidated** - continuation is impossible or unsafe; fallback/cleanup occurs.

## 6.2 Start Triggers

A session may begin through:

- player interact action;
- NPC direct approach;
- quest/event authored trigger;
- service interaction that opens through a named person;
- guard challenge or legal stop;
- surrender/capture interaction;
- companion initiated conversation;
- scheduled social scene;
- diplomacy/negotiation invitation;
- world event callout that escalates into dialogue;
- permitted remote/magical communication channel supplied by another system.

The trigger does not guarantee success. It requests a session.

## 6.3 Normal End Reasons

Examples:

- player farewell;
- NPC farewell;
- topic exhausted;
- service complete;
- authored scene complete;
- recruitment/negotiation completed;
- player cancels;
- distance/physical context no longer valid;
- schedule pressure causes graceful close;
- session superseded by a higher-priority interaction.

Every end has a stable reason code.

# 7. Participants, Roles, Speaker Turns and Audience

## 7.1 Participant Roles

| Role | Meaning |
| --- | --- |
| Initiator | Entity that requested the session. |
| Primary Addressee | Main person/group being addressed. |
| Active Speaker | Participant currently producing the beat. |
| Active Listener | Intended recipient(s) of the current utterance. |
| Participant | May speak or receive choices during the session. |
| Observer | Present and potentially able to hear/remember; not necessarily allowed to speak. |
| Witness | Observer whose presence may create a testimony/memory path if an event is perceived. |
| Interpreter | Participant providing language mediation; comprehension remains 28C-owned. |
| Moderator/Chair | Person or role controlling turn/agenda in formal meetings. |
| Authorised Representative | Participant whose choice may bind a settlement/faction in a diplomacy context. |
| Audience | Non-individual grouped listeners used for speeches/ceremonies where individual simulation is unnecessary. |

## 7.2 Turn Model

Conversation is **beat-driven**, not forced into strict alternating turns. One beat may contain:

- one speaker line;
- a short sequence of NPC lines;
- a player prompt;
- an external resolution;
- a reaction beat;
- a group response;
- a silent/gesture semantic beat resolved by presentation.

A conversation definition states who may speak at each beat or supplies a role query. The runtime resolves that role to persistent participants.

## 7.3 Observer Participation

Observers are important because Leyforge supports witnesses, rumours, family reactions and group politics. 28B records who was present and eligible to perceive the exchange. 28C decides what they understood and how information propagates; 28D decides long-term memory/relationship effects.

# 8. Conversation Entry, Availability and Commitment

## 8.1 Conversation Availability Query

Before creating a session, 28B evaluates a read-only availability view including:

- participant exists and is interactable;
- local interaction/remote-channel requirement is satisfied;
- participant is conscious/available according to external owners;
- current schedule/task can yield or be socially committed;
- active emergency/combat state does not prohibit the session;
- relationship/legal/faction rules do not make direct interaction impossible;
- required quest/event context is valid;
- language channel is potentially usable;
- multiplayer authority permits initiation;
- no incompatible exclusive conversation already owns the participant;
- content definition exists and validates.

## 8.2 Availability Result

`ConversationAvailability()` should conceptually return:

- `available` boolean/state;
- availability class;
- reason codes;
- suggested fallback action;
- retry/wake condition when known;
- whether a shorter greeting/service interaction is still permitted.

Examples of readable outcomes:

- available now;
- available for urgent topic only;
- available but on duty;
- asleep - wake only if emergency/permission permits;
- in combat;
- too injured/unwell for optional conversation;
- refuses interaction due to social/legal state;
- already in exclusive conversation;
- no shared communication channel;
- not authorised to discuss requested topic.

## 8.3 Social Commitment

When a session establishes successfully, it requests a **conversation commitment** from the persistent-agent/task system.

The commitment:

- keeps ordinary NPC task selection from immediately walking away;
- has a bounded priority;
- can be overridden by genuine emergencies;
- does not freeze personal needs indefinitely;
- releases on end/suspension as defined;
- can be downgraded for ambient or service interactions;
- is never used to imprison an NPC in dialogue.

Document 07 retains schedule/task ownership.

# 9. Conversation Context Snapshot and Live Revalidation

## 9.1 Context Snapshot

At establishment, 28B builds a structured read-only `ConversationContextSnapshot`.

Recommended categories:

| Category | Example Inputs |
| --- | --- |
| Identity | participant IDs, known names/titles, roles, culture/faction refs |
| Social | relationship summary, trust/fear/affection hooks, social reputation summary |
| Memory | relevant social-memory references from 28D |
| Knowledge | known/believed facts and comprehension from 28C |
| World | location, settlement, time, event/crisis tags, structure/service context |
| Quest/Event | active scene/objective, required branch state, authored locks |
| Economy | price/stock/contract summaries from Set 27 where relevant |
| Survival | condition/availability summary from Set 29 |
| Movement | travel/mount/vehicle state from Set 30 where relevant |
| Combat | danger, surrender/capture/hostility state from Document 16 |
| Legal/Political | law, authority, faction membership, diplomatic role |
| Multiplayer | choice authority mode, participants, controlling player/party scope |

## 9.2 Snapshot Is Not a Cache of Truth

The snapshot improves determinism and avoids repeated expensive cross-system queries during every line. It does not grant authority to stale data.

Volatile facts must be revalidated before consequential commit, including:

- price/stock/contract still valid;
- quest stage still current;
- participant still exists/alive/available;
- relationship/recruitment state not already changed by another player;
- danger/interruption state;
- legal authority still valid;
- required item/resource still exists if the choice depends on it;
- multiplayer authority still belongs to the chooser.

## 9.3 Context Versioning

A session should maintain a context revision or dependency revision set. If an important dependency changes, the runtime can:

- rebuild options;
- replace an outdated line;
- redirect to a fallback beat;
- suspend;
- close with an explanation.

# 10. Topics, Topic Discovery and Topic Hubs

## 10.1 Dialogue Topic Definition

A **topic** is a semantic subject, not a line of text.

Examples:

- current settlement shortage;
- local danger;
- NPC profession;
- recent raid;
- personal history;
- culture/custom;
- faction tension;
- active quest matter;
- trade/service;
- companion concern;
- apology/grievance;
- nearby ruin;
- known rumour;
- family matter;
- recruitment;
- diplomacy proposal.

## 10.2 Topic Sources

Topics can become candidates through:

- participant role/job;
- relationship milestone;
- active memories;
- knowledge state;
- current world event;
- quest/event binding;
- physical location;
- settlement needs;
- discovered structure/resource;
- companion status;
- player-selected pinned subject;
- NPC initiative;
- authored scene override.

28C owns whether the subject is known; 28B owns how an eligible topic appears in the session.

## 10.3 Topic Hubs

Routine conversation should favour **topic hubs** rather than endless one-way trees. A hub may expose categories such as:

- Ask about...
- Offer...
- Personal...
- Work/Services...
- Current problems...
- Faction/Culture...
- Companion...
- Farewell.

Availability is contextual. Important scenes may temporarily replace or restrict the hub.

## 10.4 Topic Exhaustion and Freshness

Topics can have session-level and time-based freshness rules to prevent repetitive dialogue:

- not discussed this session;
- discussed, but new evidence exists;
- repeatable summary allowed;
- one-time reveal;
- cooldown until a world/event change;
- available only while a crisis is active.

The underlying knowledge/memory does not disappear merely because a topic is exhausted.

# 11. Dialogue Intents and Social Action Grammar

An **intent** describes what the speaker is trying to accomplish socially. Wording can vary by personality, culture and content pack while preserving stable gameplay meaning.

## 11.1 Intent Families

Initial families include:

- greet;
- farewell;
- ask_information;
- ask_opinion;
- ask_help;
- offer_help;
- offer_item/service;
- thank;
- praise;
- comfort;
- apologise;
- forgive/refuse_forgiveness;
- joke/tease;
- challenge;
- accuse;
- confess;
- warn;
- threaten;
- reassure;
- request_permission;
- request_service;
- request_trade;
- request_training;
- recruit;
- dismiss;
- assign/delegate;
- persuade;
- intimidate;
- negotiate;
- propose_diplomatic_action;
- surrender;
- demand_surrender;
- refuse;
- accept;
- counteroffer;
- promise;
- break_off;
- share_information;
- withhold_information.

## 11.2 Intent Routing

28B owns intent selection and routing. Specialist resolution belongs elsewhere:

- `request_trade` -> Set 27 transaction/service flow;
- `persuade`, `intimidate`, `negotiate` -> 28E;
- `recruit` -> 28F;
- `assign/delegate` -> 28G;
- `share_information`, `lie`, `withhold` -> 28C knowledge/deception rules;
- `propose_diplomatic_action` -> 28E social diplomacy + political owner commit;
- `surrender` -> Combat/quest/legal owner depending context.

## 11.3 Intent Is Not Tone

Intent and tone are separate. `ask_information` can be polite, blunt, fearful, formal, teasing or hostile. Tone selection consumes social personality, relationship and cultural context but should not change the stable gameplay meaning of the requested action.

# 12. Dialogue Beats, Utterances, Prompts and Response Units

## 12.1 Dialogue Beat

A **DialogueBeatDefinition** is the smallest reusable structural unit in a conversation graph.

Recommended beat types:

| Beat Type | Purpose |
| --- | --- |
| Utterance | One participant communicates a line/semantic statement. |
| Sequence | Small ordered set of utterances with no player choice. |
| Prompt | Opens player/NPC response options. |
| Topic Hub | Presents available topics/intents. |
| Condition Gate | Redirects based on validated context. |
| External Action | Routes an authoritative command/query to another owner. |
| Result Branch | Branches from returned specialist/external result. |
| Reaction | Social response after a committed event. |
| Wait/Timing | Short authored pause or world-condition wait where appropriate. |
| Participant Change | Adds/removes participant role if valid. |
| Presentation Cue | Emits semantic cue; cannot mutate gameplay truth. |
| Redirect | Jumps to another beat/template/topic. |
| Return | Returns to a previous hub/stack frame. |
| End | Closes with reason/outcome. |

## 12.2 Utterance Content

An utterance definition may contain:

- speaker role query;
- localisation/text key;
- semantic meaning tags;
- tone/style tags;
- required knowledge proposition references;
- optional variables/format arguments;
- presentation cue tags;
- subtitle/voice key references;
- whether the utterance creates a **claim** for 28C processing;
- whether it is eligible for transcript/history;
- fallback text key.

The utterance does not itself apply relationship/economy/quest changes.

# 13. Conditions, Eligibility, Visibility and Reason Codes

## 13.1 Condition Philosophy

Dialogue conditions are pure queries. They answer whether content is valid; they do not secretly mutate state.

Common condition modules include:

- participant identity/role;
- relationship state/milestone;
- social memory present/absent;
- knowledge/belief proposition;
- language comprehension threshold;
- quest/event state;
- settlement/faction/legal state;
- item/resource possession query;
- Set 27 price/stock/contract state;
- Set 29 condition state;
- Set 30 travel/movement state;
- time/date/festival;
- location/structure/service context;
- combat/capture/surrender state;
- companion/recruitment state;
- multiplayer authority scope;
- prior session choice or beat history.

## 13.2 Four Visibility States

A candidate option may resolve to:

1. **Available** - visible and selectable.
2. **Visible but unavailable** - shown with a truthful reason when revealing the requirement is appropriate.
3. **Redacted/unknown** - shown as an unknown or partially understood option when knowledge/language design benefits from it.
4. **Hidden** - not shown because visibility would leak knowledge, spoilers, unavailable systems or inappropriate options.

Document 17/28I decides exact visual treatment.

## 13.3 Reason Codes

Blocked choices use stable reason codes such as:

- `social.dialogue.requires_relationship`;
- `social.dialogue.requires_knowledge`;
- `social.dialogue.language_unavailable`;
- `social.dialogue.participant_busy`;
- `social.dialogue.authority_missing`;
- `social.dialogue.quest_state_changed`;
- `social.dialogue.external_contract_invalid`;
- `social.dialogue.interrupted_by_danger`;
- `social.dialogue.participant_left`;
- `social.dialogue.choice_stale`.

# 14. Choice Construction, Selection and Authoritative Commit

## 14.1 Candidate Construction

When the runtime reaches a prompt:

1. gather candidate choices from the current beat/template/topic;
2. add permitted contextual/systemic choices;
3. evaluate knowledge and content visibility;
4. evaluate conditions and permissions;
5. calculate non-mutating preview information;
6. sort/group by authored priority and UI metadata;
7. publish a conversation view model.

## 14.2 Selection Is Intent, Not Success

When the player selects a choice, the client/UI submits a `CommitDialogueChoice` intent containing:

- session ID;
- choice ID;
- chooser identity;
- expected session/context revision;
- any required selected target/quantity/proposal reference;
- multiplayer authority token/scope;
- optional confirmation acknowledgement.

The runtime then revalidates the choice.

## 14.3 Commit Pipeline

```text
Choice Selected
    ↓
Session/Authority Revision Check
    ↓
Re-evaluate Critical Conditions
    ↓
If needed: External/Specialist Command
    ↓
Receive Authoritative Result
    ↓
Emit ConversationChoiceCommitted
    ↓
Emit Specialist Social Events as appropriate
    ↓
Advance to Result Branch / Recovery Branch
```

## 14.4 Irreversible Choice Confirmation

Severe actions may require a confirmation step when:

- the consequence is reasonably knowable;
- the action is difficult to undo;
- the choice can cause major legal, diplomatic, companion or quest consequences;
- multiplayer authority makes accidental input especially costly.

Confirmation is a UI/presentation action; 28B marks the semantic severity and confirmation requirement.

# 15. Branching, Hubs, Redirects, Returns and Closure

## 15.1 Graph Rather Than Pure Tree

Leyforge should not represent every conversation as a recursively expanding tree. The runtime supports:

- branches;
- loops with bounded repetition;
- shared hubs;
- reusable sub-conversations;
- call/return semantics;
- redirects to specialist flows;
- fallbacks;
- end states.

This reduces authoring duplication and makes systemic dialogue practical.

## 15.2 Branch Priority

When multiple branches are valid:

1. story-critical explicit override;
2. active emergency/legal/diplomatic context;
3. relationship/memory-specific authored variant;
4. role/service-specific variant;
5. culture/faction/local flavour variant;
6. generic systemic fallback.

The exact content-generation/selection policy is refined by 28H, but 28B defines deterministic precedence hooks.

## 15.3 Closure Quality

Normal conversation endings should release commitments cleanly and, when appropriate:

- acknowledge unfinished business;
- indicate a reason for abrupt closure;
- preserve resumable context;
- emit semantic end reason;
- update transcript/history references;
- trigger external follow-up only after committed results.

# 16. Contextual and Systemic Dialogue Assembly

Routine NPCs need believable conversation without every resident receiving a handcrafted novel.

## 16.1 Systemic Assembly Inputs

A systemic provider may assemble eligible beats from:

- social personality;
- current job/role;
- settlement situation;
- relationship/memory hooks;
- current needs/crisis context;
- known world facts;
- culture/faction context;
- time/location;
- companion status;
- recent consequential event;
- active topic freshness.

## 16.2 Systemic Assembly Boundaries

Systemic dialogue may:

- choose among approved semantic content units;
- select tone variants;
- insert validated names/places/items;
- reorder optional small-talk topics;
- expose current real shortages or events;
- generate short context-sensitive greetings/farewells from approved templates.

It may not:

- invent a new named person or event as fact;
- claim a quest exists when no quest/event owner created it;
- create a resource transfer;
- create a relationship milestone;
- reveal unknown information;
- fabricate a law, price, faction state or injury;
- bypass 28H governance for runtime generated prose.

# 17. Authored Dialogue, Story-Critical Beats and Overrides

## 17.1 Authored Content Priority

Hand-authored dialogue is preferred for:

- major cultural/faction story scenes;
- companion personal arcs;
- romance/family milestones;
- major betrayal/reconciliation;
- boss or antagonist negotiation;
- diplomacy scenes;
- trials or major witness confrontations;
- irreversible world choices;
- important tutorials where wording matters;
- emotionally sensitive scenes.

## 17.2 Authored Locks

A story-critical scene can temporarily:

- restrict available topics;
- require specific participants;
- enforce a sequence before returning to hub;
- require an explicit multiplayer authority mode;
- suppress unrelated small talk;
- pin a context revision requirement;
- define failure/fallback when actors or world state changed.

It still cannot bypass external system authority.

## 17.3 Missing Actor/Changed World Fallback

Authored definitions must declare what happens if:

- required NPC died;
- NPC migrated;
- settlement was destroyed/conquered;
- target faction changed;
- required item no longer exists;
- quest already resolved by another route;
- player knows the answer from another source;
- event deadline passed.

Fallbacks may redirect, substitute an authorised actor, acknowledge history, close safely or let Document 15 transform the quest.

# 18. Interruptions, Suspension, Resumption and Invalidation

28B locks the conversation interruption policy that 28A intentionally deferred.

## 18.1 Interruption Classes

| Class | Examples | Default Runtime Response |
| --- | --- | --- |
| Presentation-only | UI focus lost, subtitle toggle, camera mode change | Conversation state continues. |
| Soft pressure | NPC schedule window ending, mild need, player looks away, another person approaches | Continue briefly, warn, or graceful-close based on template. |
| Soft suspend | player steps away, service task briefly required, non-danger movement transition | Suspend if template allows; retain resume token. |
| Hard interrupt | combat starts, evacuation alarm, serious hazard, forced displacement, participant attacked | Immediately suspend or close; release unsafe presentation locks. |
| Hard invalidate | participant death/removal, authority lost, required world/quest state permanently changed | Invalidate session; use recovery/fallback beat if possible. |

## 18.2 Emergency Priority

Conversation commitments are lower priority than genuine safety/emergency actions. 28B does not decide what counts as combat or medical emergency; it consumes authoritative interrupt signals.

## 18.3 Resume Token

A resumable session retains:

- session/template ID;
- participant IDs;
- stable beat/cursor;
- topic stack;
- selected but uncommitted choice state = cleared;
- committed result history;
- context dependency revisions;
- suspend reason;
- allowed resume window/conditions;
- authored fallback beat.

## 18.4 Revalidation on Resume

Before resuming:

- participants are rebound;
- critical external state is refreshed;
- current beat remains valid;
- stale choices are rebuilt;
- if context changed significantly, authored `resume_changed_context` branch may run;
- otherwise session ends with a reason.

## 18.5 No Half-Committed Choice

If an interrupt occurs while an external command is resolving, the command result remains authoritative. The conversation records the committed result before suspending/closing. Presentation may catch up afterward. Retrying must not duplicate transactions.

# 19. World Continuity, Time, Schedules and Physical Presence

## 19.1 Time Continues by Default

The dialogue runtime does not assume global pause. This supports multiplayer and the living-world promise.

A solo world may allow pause-in-dialogue as a world setting, but content must remain correct when time continues.

## 19.2 Schedule Pressure

NPC schedule ownership remains Document 07. Conversation context may expose:

- free time;
- working but interruptible;
- service duty;
- patrol/guard duty;
- sleeping/resting;
- crisis task;
- committed project work;
- social/event time.

Dialogue definitions can react without redefining schedules.

## 19.3 Physical Presence

28B assumes the interaction layer supplies valid local/remote communication eligibility. It does not own movement reach calculations. If participants become physically incompatible with the active session, the runtime receives an interruption/availability change and applies Section 18.

# 20. Ambient Dialogue, Barks, Greetings and Incidental Social Speech

Not all speech requires a full menu-driven conversation.

## 20.1 Ambient Categories

- greeting/farewell bark;
- work comment;
- settlement-state remark;
- weather/event reaction;
- combat warning/callout;
- family/social chatter;
- merchant/service greeting;
- companion travel chatter;
- celebration/mourning line;
- overheard rumour fragment;
- reaction to player appearance/action when appropriate.

## 20.2 Ambient Consequence Rule

Ambient speech is presentation-light and **low consequence by default**. It can reference real state and create an information-heard event when 28C rules permit, but it does not directly:

- complete quests;
- transfer resources;
- establish marriage/recruitment;
- resolve persuasion;
- create major diplomatic state;
- convict crimes.

A bark can escalate into a full conversation session if the player engages or content requires a consequential choice.

## 20.3 Repetition Control

Definitions support:

- cooldown;
- once-per-event;
- once-per-session;
- per-NPC/day weighting;
- novelty/freshness;
- mutually exclusive variants;
- importance priority;
- suppression during serious scenes.

# 21. Multi-Party and Group Conversations

## 21.1 Group Use Cases

- family discussion;
- village council;
- trial/hearing;
- diplomacy table;
- party/companion discussion;
- guard challenge with witnesses;
- merchant plus apprentice;
- prisoner exchange;
- festival/social scene;
- multiplayer party speaking to an NPC.

## 21.2 Addressing Model

Each utterance declares:

- speaker;
- direct addressee(s);
- intended audience scope;
- private/public flag;
- whether observers may react;
- whether the statement creates a claim for knowledge propagation.

## 21.3 Participant Changes

Participants may join or leave when validated. The runtime must rebuild:

- audience/knowledge eligibility;
- relevant response options;
- witness state;
- authority rules;
- presentation roster.

Major authored scenes may prohibit dynamic joining except through explicit branches.

# 22. Quest, Event and Story Integration

Document 15 owns quest/event lifecycle. 28B provides the conversational execution layer.

## 22.1 Quest Inputs to Conversation

- quest/event ID;
- current node/stage;
- required participants;
- authored topic/beat entry;
- available objectives/context;
- known stakes;
- deadlines;
- branch history;
- authority scope;
- fallback rules.

## 22.2 Conversation Outputs to Quest/Event

After committed choices, 28B may emit:

- `ConversationChoiceCommitted`;
- `DialogueTopicDiscussed`;
- `PromiseCreated` or specialist social event;
- `InformationShared` request to 28C;
- `NegotiationOutcomeResolved` from 28E;
- `RecruitmentResolved` from 28F;
- `WitnessStatementCreated`;
- `ConversationEnded` with outcome tags.

Document 15 decides whether those events transition a quest.

## 22.3 No UI-Only Quest Progress

Displaying a quest line does not advance the quest. Selecting a choice does not advance the quest until authoritative commit succeeds.

# 23. Economy, Trade, Service and Contract Conversation Integration

Set 27 owns economic facts.

## 23.1 Dialogue Can Display

- merchant inventory summary;
- buy/sell price quote;
- wage offer;
- contract summary;
- trade opportunity;
- settlement affordability/economic standing where exposed;
- accepted/rejected economic transaction result.

## 23.2 Dialogue Does Not Calculate

28B does not calculate:

- item value;
- price discount;
- wage;
- debt;
- tax;
- route profit;
- stock availability;
- contract payment.

A bargaining intent routes through 28E for social negotiation and Set 27 for final financial terms.

## 23.3 Stale Quote Handling

Because the world continues, a visible quote may become stale. Before purchase/contract commit, Set 27 revalidates. If terms changed, 28B can branch to:

- refreshed quote;
- merchant explanation;
- insufficient stock;
- contract no longer available;
- counteroffer flow.

# 24. Crime, Witness, Law, Surrender and Captivity Integration

## 24.1 Crime Dialogue

Conversation may include:

- accusation;
- questioning;
- warning;
- admission/confession;
- denial;
- bribery attempt routed to appropriate owners;
- witness statement;
- surrender demand;
- prisoner dialogue;
- legal-right/permit explanation;
- trial/hearing scene.

## 24.2 Ownership Boundary

- Combat/inventory/justice establish the factual incident/evidence.
- Set 28/28B controls what is said and who participates.
- 28C controls knowledge/claim/belief state.
- Set 28 witness systems record statements.
- justice/governance decides guilt, sentence and legal consequences.

## 24.3 Captive and Hostile Conversation

Hostile participants can still converse when encounter rules permit. Availability may be constrained by:

- surrender state;
- restraint/capture state;
- threat proximity;
- guard control;
- legal authority;
- faction hostility;
- fear/trust context.

28B does not create invulnerability during parley.

# 25. Survival, Movement, Combat and Emergency Integration

## 25.1 Set 29 Inputs

28B may query:

- injury state;
- illness;
- fatigue;
- recovery status;
- survival-derived social modifier if approved.

Uses include availability, shortened interaction, concern lines and refusal reasons. Medical outcomes remain Set 29.

## 25.2 Set 30 Inputs

28B may query:

- current movement mode;
- travel state;
- mount/vehicle state;
- passenger/formation context if relevant.

Uses include remote/travel chatter, interruption, whether a stationary interaction can continue and companion travel context. Movement remains Set 30.

## 25.3 Combat Inputs

Combat may signal:

- active threat;
- participant attacked;
- surrender/capture state;
- injury/death;
- hostility change;
- raid/emergency phase.

The default response to direct combat is hard interrupt unless an authored combat-dialogue channel explicitly permits short callouts.

# 26. Personality, Relationship and Social-Memory Hooks

28B does not define relationship formulas, but conversation content must be able to consume them.

## 26.1 Personality Hooks

A social personality may influence:

- preferred greeting style;
- verbosity;
- directness;
- tolerance for interruption;
- humour/formality style;
- willingness to initiate conversation;
- preferred topic ordering;
- likelihood of volunteering information, subject to 28C;
- reaction-line selection;
- refusal wording.

## 26.2 Relationship Hooks

Conversation definitions may gate/variant content by:

- relationship milestone;
- trust/fear/affection/loyalty bands;
- grievance or gratitude memory;
- familiarity;
- companion status;
- family/romance state;
- prior promises.

Exact values and changes remain 28D/28E.

## 26.3 Memory Hooks

A line can reference a social memory by stable ID/category, e.g. rescue, betrayal, gift, abandonment, honoured promise. The displayed wording is a presentation of that memory; it never becomes the memory source.

# 27. Knowledge, Rumour, Deception and Language Interfaces

28C is the authority for this entire domain. 28B requires a clean interface.

## 27.1 Required 28C Queries

Conceptually:

- what propositions does participant know/believe;
- confidence/source of proposition;
- whether speaker may truthfully assert a proposition;
- whether a participant intends deception;
- whether listener can comprehend the current language/channel;
- whether an interpreter can bridge comprehension;
- what information transfer is produced by a committed utterance.

Exact APIs belong to 28C/28J.

## 27.2 Information-Safe Dialogue

A line requiring a fact cannot appear merely because the author wrote it. The runtime validates the speaker's knowledge/belief state unless the content explicitly represents guesswork, deception, fiction, prayer, joke or hypothetical speech.

## 27.3 In-World Language vs Localisation

The same semantic utterance can be:

- fully comprehended;
- partially comprehended;
- translated/interpreted;
- unintelligible but speaker identity/emotion visible;
- shown through player accessibility/localisation without changing the in-world comprehension result.

28I controls presentation; 28C controls gameplay comprehension.

# 28. Presentation, Voice, Localisation and Accessibility Contract

28B supplies semantic data; 28I/Document 17/23 own presentation.

## 28.1 Required View-Model Fields

- session ID and scope;
- speaker/participant IDs and display references;
- semantic beat ID;
- text/localisation key plus safe arguments;
- speaker role/title known state;
- tone/presentation tags;
- available choices/intents;
- choice availability state and reason;
- known consequence severity tags;
- topic category;
- interruption/suspend status;
- authority mode;
- timer metadata only when authored;
- voice/caption semantic key;
- accessibility labels;
- optional relationship/context summary references;
- context revision.

## 28.2 Timed Choices

Timed responses are **not default dialogue behaviour**. They are permitted only when real world urgency justifies them. Definitions must declare:

- timing reason;
- default timeout result;
- whether the timer pauses with world pause;
- accessibility extension/disable policy;
- multiplayer authority behaviour.

## 28.3 No Presentation-Only Meaning

Critical meaning must not rely only on:

- voice tone;
- colour;
- facial animation;
- camera angle;
- sound cue.

Semantic state and text/captions must remain sufficient for accessibility.

# 29. Multiplayer Conversation Scope and Choice Authority Foundation

28J finalises the complete multiplayer matrix, but 28B requires the following scope types.

## 29.1 Scope Types

| Scope | Typical Use |
| --- | --- |
| Personal | NPC speaks privately to one player; result affects that player's relationship/quest. |
| Party-visible personal | Others may observe, but one player owns the response. |
| Party leader | Designated leader selects shared response. |
| Vote | Players select options; defined rule resolves winner. |
| Consensus | All required participants must agree. |
| Authorised representative | Only player/NPC with political role can bind a settlement/faction. |
| World/host authority | Last-resort content type where a single world choice is required and no role system applies. |

## 29.2 Simultaneous Interaction

The server prevents incompatible exclusive sessions from mutating the same NPC state concurrently. Depending on content:

- second player may join as observer/participant;
- receive `already_in_conversation`;
- start a non-exclusive service interaction if safe;
- queue/ask to join;
- interrupt under emergency rules.

## 29.3 Stale Choice Protection

Every committed choice includes session/context revision. If another player changes relevant state first, stale commit fails and options rebuild.

# 30. Persistence, Save/Load, Transcript and Simulation LOD

## 30.1 What Persists

Not every conversation needs a saved runtime session. Persist when required by:

- authored scene at a stable beat;
- unresolved negotiation/recruitment/promise transaction;
- multiplayer shared choice;
- long-form council/diplomacy scene;
- quest state explicitly expecting resumable dialogue.

Routine small talk may end on save without persistent session state, while committed social events remain.

## 30.2 Save Boundary

Saveable sessions record only stable state:

- definition/template ID;
- session ID;
- participant persistent IDs;
- current beat/cursor;
- topic stack;
- committed choice history required for continuation;
- authority scope;
- external resolution references;
- suspend state;
- context dependency revisions;
- resume/fallback rule.

Do not serialise scene nodes, widget state, audio playback position or transient actor pointers as social truth.

## 30.3 Load Revalidation

On load:

1. resolve definition aliases/migrations;
2. resolve persistent participants;
3. rebuild context;
4. validate current beat;
5. verify external commands/results already committed;
6. resume or follow recovery branch;
7. close safely if continuation is impossible.

## 30.4 Dialogue LOD

- L0 active: full player-facing session.
- L1 local reduced: ambient chatter and simple social task commitments; no hidden choice graph.
- L2 settlement summary: conversation-like social interactions resolve as bounded social events, not rendered transcripts.
- L3 regional abstract: only consequential diplomacy, promises, companion assignments or relationship events.
- L4 dormant: no active dialogue simulation; persistent wake conditions/history only.

# 31. Registry, Naming and Data Templates

## 31.1 Proposed Canonical Domains

Subject to Set 25 registration:

- `leyforge.core.dialogue.intent.*`
- `leyforge.core.dialogue.topic.*`
- `leyforge.core.dialogue.template.*`
- `leyforge.core.dialogue.beat.*`
- `leyforge.core.dialogue.condition.*`
- `leyforge.core.dialogue.reason.*`
- `leyforge.core.dialogue.presentation_cue.*`

Examples:

- `leyforge.core.dialogue.intent.apologise`
- `leyforge.core.dialogue.intent.ask_information`
- `leyforge.core.dialogue.topic.local_shortage`
- `leyforge.core.dialogue.template.service_blacksmith`
- `leyforge.core.dialogue.condition.quest_state`
- `leyforge.core.dialogue.reason.participant_emergency`

## 31.2 Definition Pack Requirements

Every production dialogue pack should declare:

- canonical ID/version;
- dependency packs;
- participant-role assumptions;
- topic/intent dependencies;
- localisation keys;
- required condition modules;
- external command permissions;
- fallback content;
- content rating/warnings where relevant;
- validation status;
- provenance/authorship metadata according to 28H/Set 25.

# 32. Diagnostics, Validation and Automated Test Strategy

## 32.1 Definition Validation Hard Failures

- missing or duplicate canonical ID;
- transition target does not exist;
- unbounded unconditional loop;
- speaker role cannot resolve;
- direct mutation of an externally owned field;
- production line missing localisation key/fallback;
- choice references missing intent/topic;
- condition references unsupported owner/interface;
- authored quest beat references nonexistent quest binding;
- session marked saveable but uses transient-only participant identity;
- invalid multiplayer authority mode;
- external action has no failure branch;
- irreversible choice lacks declared severity/confirmation policy when required.

## 32.2 Runtime Test Cases

- conversation starts with valid persistent NPC and survives actor representation refresh;
- NPC schedule recognises conversation commitment but emergency overrides it;
- context snapshot does not permit stale contract/quest commit;
- blocked choice exposes correct reason without leaking hidden knowledge;
- NPC cannot speak knowledge 28C says they do not possess;
- choice event occurs once after authoritative commit;
- failed Set 27 transaction follows failure branch and does not fake payment;
- persuasion choice routes to 28E rather than applying relationship result directly;
- active combat hard-interrupts normal dialogue;
- save/load resumes a saveable conversation at a stable beat;
- deceased participant invalidates cleanly;
- multi-party observer set updates if someone joins/leaves;
- stale multiplayer choice revision fails safely;
- LOD demotion cannot leave an active player conversation silently running;
- transcript line and social-memory record remain separate;
- localisation expansion does not change semantic choice identity.

## 32.3 Conversation Inspector

Developer tooling should expose:

- session ID/state;
- participants and roles;
- current template/topic/beat;
- authority scope;
- context revision;
- all candidate choices;
- eligibility conditions with owner/source;
- hidden/blocked reason;
- external queries and returned revisions;
- committed choices/events;
- interrupt signals;
- resume token;
- source pack/provenance;
- presentation view-model snapshot.

# 33. Production Scope and Staged Delivery

## 33.1 Foundation Slice

Implement first:

- conversation service;
- persistent participant IDs;
- entry/availability;
- basic context snapshot;
- utterance + prompt + condition + end beats;
- topic hub;
- 10-15 core intents;
- reason codes;
- choice commit/revalidation;
- Document 15 quest event handoff;
- basic relationship/memory query hooks;
- interruption by combat/emergency;
- save/load of one stable authored conversation;
- accessible UI adapter.

## 33.2 Core Production Slice

Add:

- contextual/systemic dialogue assembly;
- multi-party conversations;
- service/trade wrapper;
- recruitment wrapper;
- persuasion/negotiation wrapper;
- knowledge/language gating;
- ambient speech and repetition control;
- richer interruption/resume;
- multiplayer scopes;
- content-pack validation;
- full diagnostics.

## 33.3 Expanded Production

Later:

- complex councils/trials;
- long diplomatic sessions;
- companion travel conversations;
- romance/family scenes;
- advanced procedural assembly;
- AI-assisted dialogue providers only if 28H approves;
- larger voice/localisation production through 28I.

## 33.4 Post-POC First Regression Scenario

The old Forest Hamlet can remain a deterministic regression fixture:

- speak to named resident;
- ask about current watchtower need;
- accept/decline request through Document 15;
- return after material delivery and receive changed contextual dialogue;
- interrupt conversation with raid warning;
- resume/close correctly;
- save/reload without duplicating quest/social events.

Production acceptance must additionally test a randomly generated settlement and NPC rather than relying on fixed POC names.

# 34. 28B Acceptance Criteria

28B is acceptable when:

- conversation has one authoritative session owner;
- 28A/C/D/E/F/G/H/I/J boundaries are preserved;
- Set 27/29/30 gameplay is consumed rather than redefined;
- active sessions use persistent participant identity;
- definition/session/transcript/memory/world-event records are clearly separate;
- conversation lifecycle and end reasons are explicit;
- topic and intent semantics are data-driven;
- choice conditions are query-only;
- consequential choices use authoritative revalidation;
- external mutations route to owning systems;
- graph/hub/return structure avoids forced exponential trees;
- exact interruption classes and resumption policy are defined;
- world continuity is preserved by default;
- multi-party roles and observers are supported;
- NPC knowledge cannot be invented by dialogue;
- multiplayer authority scope exists on consequential conversations;
- save/load and LOD behaviour are defined;
- production content can scale from important authored scenes to routine systemic NPC interaction;
- diagnostics can explain why every option appeared or failed;
- no new cross-set ownership transfer is introduced.

# 35. Open Questions Assigned to Later Documents

28B intentionally leaves the following to specialist documents:

- exact proposition/belief/rumour model and information-transfer algorithm - 28C;
- exact language fluency/comprehension thresholds - 28C;
- exact relationship-value bands and dialogue weighting - 28D;
- exact promise memory/relationship consequences - 28D;
- exact persuasion/intimidation/negotiation calculations - 28E;
- exact diplomacy proposal and concession algorithms - 28E;
- exact recruitment eligibility and companion party limits - 28F;
- exact delegated-task conversation/action library - 28G;
- runtime generative prose/AI policy - 28H;
- final voice strategy, lip-sync, subtitle layout and conversation-history UI - 28I;
- final network RPC/replication/save schema and public mod exposure - 28J;
- final Godot Resource/service class names - 28J/rewritten Technical Plan;
- balance values for cooldowns, resume windows and repetition weights - production testing.

# 36. Cross-Set Interface Amendments

The governing **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0** remains unchanged.

28B requires no ownership transfer and introduces **no new mandatory Set 27, Set 29 or Set 30 API beyond the semantic requirements already recorded in 28A**.

## 36.1 Consumed Proposed Interfaces from 28A

| Interface | Owner | 28B Use |
| --- | --- | --- |
| `ContractSummary(contract_id)` | Set 27 | Presents authoritative contract terms during conversation and revalidates before commit. |
| `TradeOpportunities(actor_or_settlement, context)` | Set 27 | Supplies eligible economy-generated topics. |
| `EconomicStanding(subject, observer_scope)` | Set 27 | Context only; does not replace social reputation. |
| `RecoveryStatus(entity)` | Set 29 | Availability/context during injury/illness recovery. |
| `SurvivalSocialModifier(entity)` | Set 29 | Bounded context modifier without duplicating survival rules. |
| `TravelState(entity_or_party)` | Set 30 | Determines whether a conversation can continue in current travel context. |

## 36.2 Set 28 Internal Dialogue API Additions

These are Set 28-owned and do not amend external ownership:

- `ConversationAvailability(subject, initiator, context)`;
- `BeginConversation(request)`;
- `ConversationContext(session_id)`;
- `AvailableDialogueIntents(session_id)`;
- `AvailableDialogueTopics(session_id)`;
- `CommitDialogueChoice(session_id, choice_id, expected_revision)`;
- `SuspendConversation(session_id, reason)`;
- `ResumeConversation(session_id)`;
- `EndConversation(session_id, reason)`.

> **Amendment Status**  
> No new cross-set amendment proposed by 28B. Previously proposed interfaces from 28A remain pending final integration review.

# Appendix A. Dialogue Definition Catalogue

| Definition | Owner | Purpose |
| --- | --- | --- |
| DialogueIntentDefinition | 28B | Stable semantic social action. |
| DialogueTopicDefinition | 28B | Stable semantic subject. |
| ConversationTemplateDefinition | 28B | Reusable conversation graph/structure. |
| DialogueBeatDefinition | 28B | Smallest graph unit. |
| DialogueChoiceDefinition | 28B | Player/NPC selectable intent mapping and branch. |
| DialogueConditionDefinition | 28B | Pure query module definition. |
| DialogueTransitionDefinition | 28B | Branch/redirect/return/end rule. |
| DialoguePresentationCueDefinition | 28B/Presentation contract | Semantic cue with no gameplay mutation. |
| ConversationAvailabilityPolicy | 28B | Rules for establishing session class. |
| ConversationInterruptionPolicy | 28B | Interruption/resume/fallback policy. |
| ConversationAuthorityPolicy | 28B/28J | Declared scope semantics; 28J final technical/network detail. |

# Appendix B. ConversationSessionState Template

```text
ConversationSessionState
  session_id
  template_id
  state
  initiator_id
  participant_bindings[]
  primary_addressee_id
  authority_scope
  controlling_player_or_group_id
  current_beat_id
  topic_stack[]
  context_revision
  context_dependency_revisions{}
  candidate_choice_ids[]
  selected_choice_id?
  committed_choice_history[]
  external_resolution_refs[]
  commitment_refs[]
  interrupt_state?
  suspend_reason?
  resume_token?
  start_world_time
  last_update_world_time
  transcript_event_refs[]
  semantic_event_refs[]
  end_reason?
```

The runtime representation may optimise these fields. Persistent identities remain stable IDs, never transient scene references.

# Appendix C. Initial Dialogue Intent Library

| Intent ID Suffix | Meaning | Specialist Owner if Applicable |
| --- | --- | --- |
| `greet` | Open social interaction. | 28B |
| `farewell` | End politely/explicitly. | 28B |
| `ask_information` | Request known information. | 28C knowledge transfer |
| `share_information` | Offer a proposition/claim. | 28C |
| `ask_opinion` | Request personal/social view. | 28B + 28D hooks |
| `thank` | Express gratitude. | 28B; effects 28D |
| `apologise` | Request social repair. | 28B; effects 28D/28E |
| `comfort` | Support another person. | 28B; effects 28D |
| `praise` | Positive social statement. | 28B; effects 28D |
| `warn` | Communicate danger/concern. | 28C knowledge transfer |
| `accuse` | Assert wrongdoing. | 28B; 28C/justice context |
| `confess` | Admit claimed action. | 28C/justice context |
| `threaten` | Communicate threatened consequence. | 28E resolution |
| `persuade` | Attempt to change decision. | 28E |
| `intimidate` | Attempt compliance through fear. | 28E |
| `negotiate` | Exchange proposals/concessions. | 28E + Set 27/political owner |
| `request_trade` | Enter economic service. | Set 27 |
| `request_service` | Ask for owned external service. | Owning service system |
| `request_training` | Ask NPC to teach. | Progression/knowledge owner |
| `recruit` | Invite to companion/follower relationship. | 28F |
| `dismiss` | End companion relationship. | 28F |
| `delegate` | Request assignment. | 28G |
| `promise` | Create social commitment statement. | 28D/28E as defined |
| `accept` | Accept proposal. | Owning target system |
| `refuse` | Decline proposal. | 28B/social specialist |
| `counteroffer` | Respond with revised proposal. | 28E + relevant owner |
| `surrender` | Offer cessation/capture. | Combat/legal/quest owner |
| `demand_surrender` | Request opponent surrender. | Combat + 28E social context |

# Appendix D. Condition, Command and Event Module Library

## D.1 Condition Modules

- participant exists;
- participant role matches;
- relationship milestone/value band;
- social memory query;
- knowledge proposition/comprehension;
- quest/event state;
- economy quote/contract availability;
- item possession query;
- settlement/faction/law state;
- survival condition summary;
- movement/travel mode;
- combat danger/surrender/capture state;
- time/location/structure context;
- multiplayer authority;
- prior dialogue choice/session flag;
- cooldown/freshness.

## D.2 Command Routing Families

- `social.dialogue.command.social_event`;
- `social.dialogue.command.quest_request`;
- `social.dialogue.command.economy_request`;
- `social.dialogue.command.relationship_request`;
- `social.dialogue.command.persuasion_request`;
- `social.dialogue.command.recruitment_request`;
- `social.dialogue.command.delegation_request`;
- `social.dialogue.command.knowledge_transfer_request`;
- `social.dialogue.command.legal_or_political_request`.

## D.3 Core Semantic Events

- `ConversationStarted`;
- `ConversationParticipantJoined`;
- `ConversationParticipantLeft`;
- `DialogueBeatPresented` (presentation/history only where configured);
- `ConversationChoiceCommitted`;
- `DialogueTopicDiscussed`;
- `ConversationSuspended`;
- `ConversationResumed`;
- `ConversationInvalidated`;
- `ConversationEnded`.

# Appendix E. Dialogue Reason-Code Families

Initial families:

- `social.dialogue.start.*`
- `social.dialogue.unavailable.*`
- `social.dialogue.choice.*`
- `social.dialogue.condition.*`
- `social.dialogue.knowledge.*`
- `social.dialogue.authority.*`
- `social.dialogue.interrupt.*`
- `social.dialogue.resume.*`
- `social.dialogue.external.*`
- `social.dialogue.definition.*`

Examples:

- `social.dialogue.unavailable.sleeping`
- `social.dialogue.unavailable.combat`
- `social.dialogue.unavailable.exclusive_session`
- `social.dialogue.choice.requires_relationship`
- `social.dialogue.choice.requires_authority`
- `social.dialogue.choice.stale_revision`
- `social.dialogue.knowledge.speaker_does_not_know`
- `social.dialogue.interrupt.emergency`
- `social.dialogue.resume.context_changed`
- `social.dialogue.external.contract_invalid`
- `social.dialogue.external.quest_state_changed`

# Appendix F. Example Conversation Flows

## F.1 Routine Settlement Need

```text
Player interacts with builder
  → availability succeeds
  → context sees current settlement project + player relationship
  → greeting beat
  → topic hub
      Ask about current work
        → query Document 19/20 project summary
        → builder explains real blocker
        → optional quest/request topic from Document 15
      Personal
        → relationship/memory eligible topic
      Farewell
```

No project resources or quest state change merely because the builder described them.

## F.2 Merchant Quote Changes Mid-Conversation

```text
Player opens trade topic
  → Set 27 supplies quote revision 41
  → dialogue shows "12 coins"
  → another player buys remaining stock
  → player confirms purchase
  → authoritative revalidation returns quote revision 42 / unavailable
  → 28B follows "stock changed" branch
  → merchant explains shortage
```

The UI never commits the old displayed price as truth.

## F.3 Raid Interrupt

```text
Player speaks to guard captain
  → active conversation commitment
  → raid warning event escalates
  → Combat/Event owner emits emergency interrupt
  → session hard-suspends
  → guard enters emergency task
  → after raid, player interacts again
  → resume token revalidates
  → authored "we were interrupted" branch
  → conversation continues or redirects to aftermath topic
```

## F.4 Multiplayer Shared Decision

```text
Party begins settlement negotiation
  → authority scope = party leader or vote, as definition declares
  → all players see session
  → authorised responses collected
  → server resolves choice rule
  → 28E resolves social negotiation
  → political/economic owners commit accepted terms
  → 28B records outcome and branches
```

# Appendix G. Cross-System Responsibility Matrix

| Conversation Case | 28B Owns | External Owner |
| --- | --- | --- |
| Ask merchant price | Session/topic/line/choice | Set 27 price and stock |
| Persuade merchant | Intent routing and branch | 28E modifier/outcome; Set 27 final price |
| Accept quest | Dialogue choice commit event | Document 15 quest acceptance/state |
| Discuss injury | Context and wording | Set 29 injury/recovery |
| Recruit NPC | Conversation wrapper | 28F recruitment/companion status; Set 27 payment if hired |
| Ask companion to travel | Conversation/intent | 28F permission; Set 30 movement/travel |
| Threaten guard | Dialogue/intent | 28E social resolution; Combat/law for encounter consequence |
| Witness accusation | Conversation and statement presentation | 28C claim/knowledge; witness record; justice verdict external |
| Ask about rumour | Topic/turn runtime | 28C rumour/belief/provenance |
| Romance scene | Conversation graph | 28D relationship/milestone; 28E etiquette/consent checks where applicable |
| Diplomacy council | Multi-party session | 28E social diplomacy; Document 13/political owner world-state; Set 27 terms |
| Voice/gesture | Semantic cue | 28I/22/23 presentation |

# Appendix H. Glossary

**Conversation Commitment** - A bounded task/social commitment that keeps a participant engaged in an established conversation until normal completion or a higher-priority interruption.

**Conversation Context Snapshot** - A read-only structured view of relevant identity, social, knowledge and external facts captured for deterministic dialogue selection and refreshed/revalidated when needed.

**Dialogue Beat** - Small reusable structural unit in a conversation graph, such as an utterance, prompt, condition, external action, reaction, redirect or end.

**Dialogue Intent** - Stable semantic description of what a speaker is trying to accomplish, independent of exact wording or tone.

**Dialogue Topic** - Stable semantic subject that can become available based on knowledge, world state, role, relationship, quest/event state and authored rules.

**Live Revalidation** - The authoritative check immediately before a consequential choice commits, ensuring a previously displayed option has not become stale.

**Presentation Transcript** - Player-facing history of displayed lines. It is not automatically a social memory or factual event record.

**Resume Token** - Stable session information allowing a suspended conversation to continue after participants and context are revalidated.

**Systemic Dialogue** - Context-sensitive dialogue assembled from approved semantic definitions/templates rather than one bespoke authored graph for a specific named NPC.

---

**End of Document 28B - Dialogue Runtime, Conversation Structure and Context v0.1**
