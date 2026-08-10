# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28J - Multiplayer, Persistence, Registries, Validation and Cross-System Integration

**Version 0.2 - Social Runtime Integration, Authority, Persistence and Validation Design Bible Draft**

**Document Set:** 28 - Dialogue, Social Systems and Companions  
**Governing Contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.1 - Final Reconciled Contract  
**Depends On:** 28A-28I, Documents 07, 13, 15, 17, current Godot/Summer technical direction, Set 25 production governance, and the exposed interfaces of Sets 27, 29 and 30  
**Project Lead and Final Authority:** Ash

> **Social-Integration Statement**  
> Leyforge's social systems must behave as one authoritative, persistent and testable domain even though dialogue, knowledge, relationships, social resolution, companions, delegation, generated content and presentation are owned by separate specialist documents. 28J defines how those parts are registered, saved, migrated, replicated, queried, validated and integrated without collapsing them into a monolith or allowing multiplayer, UI, AI-generated wording, distance simulation or save/load to create a second source of truth. The same committed social outcome must survive reload, streaming, low-end simulation, split-screen, online play and content revision.

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Social Runtime Integration Foundation Draft | Integrates 28A-28I into one authoritative runtime architecture; defines multiplayer scope, persistence, save records, migration, simulation LOD, registry families, validation, diagnostics, Godot/Summer implementation direction, performance boundaries, mod/content-pack rules, final Set 28 interface reconciliation and acceptance criteria. |

# Document Purpose

Document 28J is the **integration and reliability authority** for Document Set 28. It does not invent another layer of social gameplay. Instead, it answers the engineering and data questions that every social subsystem must answer consistently:

- Which service owns each mutable record?
- Which immutable definition created or constrains that record?
- Which command may request a mutation?
- Which system validates the request?
- Which event proves that a mutation committed?
- What revision prevents stale clients or dialogue screens from overwriting newer state?
- What is saved, what is reconstructed and what is intentionally transient?
- How does the same social state behave when an NPC is nearby, distant, unloaded or reconnecting?
- What does a multiplayer client receive, and what must remain hidden?
- Which social records are world-scoped, player-scoped, party-scoped, settlement-scoped or presentation-only?
- How are old saves migrated when a social schema changes?
- Which validators prevent impossible relationships, invented knowledge, duplicated companion membership or assignment side effects?
- How do Sets 27, 29 and 30 provide their facts without Set 28 redefining economy, survival or movement?

Documents 28A-28I remain the owners of their specialist gameplay rules. 28J gives them a common runtime contract and creates the final Set 28 integration package.

The document also preserves the existing Leyforge architecture that mutable world truth has one owner, definitions are data-driven, UI sends commands rather than mutating gameplay, distant simulation is bounded, and persistent named NPCs must retain identity and consequence across streaming and save boundaries. The current implementation direction is Godot with Summer Engine assisting development under reviewable production controls; obsolete Unreal-specific implementation assumptions are not reintroduced here.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28J | 28J Relationship |
| --- | --- | --- |
| 07 - NPC Village System | Named NPCs, households, jobs, inventories, schedules and world identity persist independently of actor streaming. | Social records reference stable person IDs; 28J never serialises social truth only inside scene actors. |
| 13 - Races, Peoples, Cultures and Factions | Culture, faction, language definitions, government, law and political world state remain separate authorities. | Social registries reference those IDs and validate compatibility without copying their definitions. |
| 15 - Quest and Event System | Quests/events consume committed world evidence and may progress in loaded or distant simulation. | Social outcomes expose events/evidence; 28J does not let dialogue UI directly advance quest stages. |
| 17 - UI/UX System | UI is world-first, localisable, accessible, per-player where needed and never authoritative. | 28J exposes filtered read models and command endpoints; 28I/17 render them. |
| 19/20 and current Technical Direction | Godot/Summer, stable IDs, deterministic records, bounded LOD, authoritative resource/state changes and save migration. | 28J uses Godot-friendly registry Resources plus world-scoped runtime services and serialisable records. |
| Set 25 | Qualified IDs, namespace ownership, schema governance, package admission, provenance, migration, validation and source integrity. | All Set 28 definitions and packages participate in Set 25 governance; 28J adds social-specific validation. |
| 28A | Ownership contract, social architecture, cross-set boundaries and Social API concept. | 28J makes the architecture operational without moving ownership. |
| 28B | Conversation session, intents, topics, context, commit/revision and interruption. | 28J defines persistence/replication boundaries and multiplayer arbitration for conversation state. |
| 28C | Beliefs, claims, evidence, rumours, language competence, disclosure and information transfer. | 28J defines save compaction, privacy filtering, LOD and replicated knowledge views. |
| 28D | Relationships, social memory interpretation, milestones and social reputation. | 28J defines sparse persistence, revisioning, multiplayer visibility and migration. |
| 28E | Persuasion, negotiation, intimidation, etiquette and diplomacy outcomes. | 28J defines authoritative attempt/result records, commit boundaries and multiplayer authority. |
| 28F | Companion agreement, membership, role, permissions and availability. | 28J defines authoritative membership records, control scopes, reconnect and persistence. |
| 28G | Delegated assignments, domain adapters, evidence and off-screen resolution. | 28J defines assignment journaling, adapter idempotency, LOD and cross-system commit integrity. |
| 28H | Authored/systemic/procedural/AI-assisted dialogue governance. | 28J stores provenance/approval references where required but never lets generated text mutate state. |
| 28I | Voice, localisation, accessibility and social presentation. | 28J exposes local-player-safe read models; presentation preferences remain outside shared world truth. |
| Set 27 | Economy, trade, contracts and finance. | 28J consumes typed economic queries/results only. |
| Set 29 | Survival, health and biological systems. | 28J consumes typed health/survival availability summaries only. |
| Set 30 | Movement, traversal and transport. | 28J consumes typed movement/travel results and sends social/assignment intents only. |

# Static Table of Contents

1. Locked Social-Integration Identity  
2. Ownership Boundaries and Anti-Monolith Rules  
3. Locked Decision Summary  
4. Integrated Social Runtime Architecture  
5. Service Boundaries and World-Scoped Ownership  
6. State Classification and Lifetime  
7. Immutable Definitions vs Mutable Runtime Records  
8. Stable IDs, Namespaces and Identity Rules  
9. Social Content Packages and Dependency Rules  
10. Core Runtime Record Catalogue  
11. Command, Validation, Commit and Event Model  
12. Query, Read-Model and Revision Contract  
13. Optimistic Concurrency and Stale-State Protection  
14. Conversation Authority Integration  
15. Knowledge and Information Authority Integration  
16. Relationship Authority Integration  
17. Social Resolution and Negotiation Authority Integration  
18. Companion Authority Integration  
19. Delegation and Domain-Adapter Integration  
20. Dialogue Governance and Generated-Content Integration  
21. Presentation, Voice and Localisation Integration  
22. Multiplayer Authority Model  
23. Solo, Listen-Server and Dedicated-Server Equivalence  
24. Split-Screen and Multiple Local Players  
25. Conversation Participation and Interaction Locks  
26. Shared Decisions, Lead Speaker and Arbitration Policies  
27. Personal Social State and Multiplayer Privacy  
28. Companion Control and Party Authority in Multiplayer  
29. Diplomacy, Representation and Multiplayer Mandates  
30. Disconnect, Reconnect and Session Recovery  
31. Client Prediction, Latency and Presentation Responsiveness  
32. Replication Relevance, Delta Updates and Bandwidth  
33. Persistence Principles and Save Boundaries  
34. Social Save Partition and World Manifest Links  
35. Social Record Persistence by Subsystem  
36. Social Journals, Event History and Audit Evidence  
37. Save Scheduling, Checkpoints and Atomicity  
38. Schema Versioning and Migration  
39. Recovery, Integrity Repair and Missing References  
40. Simulation LOD and Promotion/Demotion  
41. Distant Social Catch-Up and Time Advancement  
42. Knowledge and Rumour LOD  
43. Relationship and Social-Reputation LOD  
44. Companion and Delegation LOD  
45. Registry Architecture and Set 25 Integration  
46. Registry Ownership by Document 28A-28I  
47. Typed Relationships, Tags and Reverse References  
48. Validation Architecture  
49. Schema, Reference and Ownership Validation  
50. Semantic and Gameplay Invariant Validation  
51. Multiplayer, Privacy and Authority Validation  
52. Persistence, Migration and LOD Equivalence Validation  
53. Automated Tests and Deterministic Scenario Harnesses  
54. Property, Fuzz and Adversarial Testing  
55. Diagnostics, Inspectors, Logs and Social Debug Tools  
56. Performance, Memory and Scalability Budgets  
57. Security, Trust Boundaries and Untrusted Inputs  
58. Modding, Content Packs and Safe Extension  
59. Compatibility, Deprecation and Live Content Revision  
60. Cross-System Integration Matrix  
61. Final Set 28 Interface Reconciliation Register  
62. Godot/Summer Engine Implementation Direction  
63. Staged Implementation and Integration Plan  
64. Acceptance Criteria and Definition of Done  
65. Open Questions Assigned to Later Production  
66. Cross-Set Interface Amendments  
Appendix A. Social Definition and Runtime Record Master Catalogue  
Appendix B. Command, Event and Read-Model Contract Templates  
Appendix C. Social Save Partition Template  
Appendix D. Multiplayer Replication Matrix  
Appendix E. Validation and Reason-Code Catalogue  
Appendix F. Cross-Set Interface Reconciliation Table  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. Glossary

# 1. Locked Social-Integration Identity

28J is the **authoritative integration layer** for Set 28, not a new social gameplay layer.

> **Locked Rule**  
> Every mutable social fact has one specialist owner. 28J may coordinate commands, events, persistence, replication, migration and read models, but it must never create a second calculation of dialogue eligibility, belief, trust, persuasion, companion willingness, assignment success or presentation meaning.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Single authority | One service owns each mutable social record. | Save/load, multiplayer and UI do not disagree about what happened. |
| Stable identity | People, relationships, claims, sessions and assignments use persistent IDs. | Named characters remain the same people across streaming and reload. |
| Transactional consequence | Consequential changes commit through validated commands/events. | A line, click or generated sentence cannot silently change world state. |
| Persistent memory | Important social outcomes survive reload and distance. | Trust, betrayal, rumours and companion history matter long term. |
| Bounded simulation | Distance reduces representation, not truth. | Unloaded NPCs can continue believable social life without impossible detail simulation. |
| Multiplayer privacy | Each client receives only authorised social knowledge. | Hidden feelings, secrets and other players' private information do not leak through replication. |
| Registry governance | Definitions use qualified IDs and validated dependencies. | Large social content libraries remain maintainable and moddable. |
| Recoverability | Migrations, journals, backups and repair paths protect social history. | Content updates do not casually destroy long-lived relationships. |

## 1.1 Integration Design Promise

A player should be able to befriend a villager, leave the region for months, return after a game update, reconnect to a multiplayer session, resume a previously interrupted conversation, discover that a rumour has spread while they were away, and find that the same person's trust, memories, companion status and obligations remain coherent.

The same rules must apply whether the person is represented by a fully animated nearby actor, a compact distant record, an offline multiplayer participant or a newly migrated save.

## 1.2 What 28J Is Not

28J is not:

- a new all-purpose SocialManager that owns every social formula;
- a replacement for the specialist rules in 28B-28I;
- an economy, survival or movement simulator;
- a database of every line ever spoken;
- a requirement to replicate all hidden social data to every client;
- permission to serialise Godot scene nodes as long-term social state;
- a runtime AI authority layer;
- a new quest, law, faction or settlement owner;
- a reason to simulate every possible NPC relationship pair;
- permission to resolve multiplayer disagreement through client-local state.

# 2. Ownership Boundaries and Anti-Monolith Rules

## 2.1 Specialist Owners Remain Authoritative

| Concern | Owner | 28J Responsibility |
| --- | --- | --- |
| Conversation session/choices | 28B | Persist/replicate session state where required; route commands. |
| Knowledge/belief/rumours/language comprehension | 28C | Persist compact records; filter knowledge views; support propagation LOD. |
| Relationships/social memory/social reputation | 28D | Persist sparse edges and history summaries; protect privacy. |
| Persuasion/negotiation/intimidation/diplomacy process | 28E | Persist consequential sessions/results; enforce authority scope. |
| Companion membership/permissions | 28F | Persist agreement/status; arbitrate multiplayer control scope. |
| Delegated assignments | 28G | Persist assignment/evidence/audit; coordinate idempotent adapters. |
| Dialogue content/provider governance | 28H | Register definitions/provenance; enforce no-authority boundary. |
| Voice/localisation/accessibility/social UI | 28I + 17/23 | Deliver filtered read models; keep preferences client/profile-local. |
| NPC person/household/job | Document 07 | Reference stable IDs only. |
| Culture/faction/law | Document 13 | Reference and query only. |
| Quest/event | Document 15 | Emit/consume evidence and events; never directly set quest stage. |
| Economy | Set 27 | Consume typed reads/results. |
| Survival/health | Set 29 | Consume typed state/availability. |
| Movement/travel | Set 30 | Send intents; consume travel/capacity/results. |

## 2.2 No Shared Mutable Dictionary

The implementation must not use one untyped `social_state` dictionary where every subsystem reads and writes arbitrary keys. That would defeat field ownership, migration and validation.

Instead:

- each specialist service owns typed records;
- records contain stable references rather than direct mutable object pointers;
- cross-subsystem writes occur through commands/events;
- read models may aggregate multiple systems without gaining write authority;
- integration helpers may compose queries but cannot duplicate calculations.

## 2.3 Coordinator vs Owner

28J may define a `SocialIntegrationCoordinator` or equivalent orchestration service. Its legitimate jobs include:

- route a command to the correct specialist service;
- coordinate atomic multi-domain commits;
- request cross-system revalidation;
- build save partitions;
- register schemas and migrations;
- build filtered read models;
- coordinate replication and reconnect;
- run validators;
- expose diagnostics.

It must not calculate Trust, decide whether a lie is believed, select a companion's moral boundary or determine travel path feasibility.

# 3. Locked Decision Summary

| Area | Locked Direction |
| --- | --- |
| Authority | Server/host-authoritative mutable social state in multiplayer; same mutation path used in solo. |
| Definitions | Immutable, versioned, qualified-ID definitions governed by Set 25. |
| Runtime state | Typed mutable records separated from Godot Nodes and presentation assets. |
| Commands | Express intent and expected revision; never assume success. |
| Events | Emitted only after authoritative commit. |
| Queries | Read-only and knowledge/privacy filtered. |
| Concurrency | Consequential sessions use revision tokens/expected-state checks. |
| Persistence | World-scoped social state stored in a dedicated social partition linked to stable entity IDs. |
| Presentation settings | Product language, subtitle, caption and comfort preferences remain profile/local-player data, not world social truth. |
| Transcripts | Full verbatim transcripts are optional/local where appropriate; authoritative persistence stores semantic consequential history rather than every line. |
| Multiplayer | Personal relationships remain per person/player; shared conversations use explicit participation and decision policies. |
| Privacy | Hidden relationship dimensions, private knowledge and secret claims are not replicated unless disclosure rules permit. |
| LOD | Distant simulation uses summaries/checkpoints; promotion/demotion preserves consequence and never invents detailed history. |
| Migration | Every persisted social record carries schema/version ownership and migrates through tested steps. |
| Mods | Mods may add validated social definitions/content but do not gain arbitrary runtime code or cross-owner mutation authority by default. |
| Runtime AI | Optional providers remain presentation/content realisers only; no mutation authority. |
| Godot | Definitions are suitable for Resource-based registries; mutable world records live in world-scoped services, not global presentation singletons. |
| Summer Engine | May assist implementation/testing under review, but is not an authoritative runtime dependency. |
| Cross-set ownership | The Document Sets 27-30 Cross-Set Interface Register v1.0 remains governing. |

# 4. Integrated Social Runtime Architecture

The integrated runtime uses four conceptual layers.

## 4.1 Definition Layer

Immutable definitions include:

- social personality profiles;
- dialogue intents/topics/templates;
- proposition and disclosure families;
- relationship dimensions and milestones;
- social-action and negotiation definitions;
- companion roles and permission profiles;
- assignment families and adapter requirements;
- dialogue content/provider profiles;
- social presentation metadata.

Definitions are loaded through the canonical registry pipeline and treated as read-only during normal play.

## 4.2 Mutable Domain Layer

World-scoped mutable records include:

- active/suspended conversation sessions;
- beliefs, claims, rumours and evidence references;
- relationship edges and relationship-history summaries;
- negotiation/diplomacy sessions and committed social outcomes;
- companion agreements and status;
- delegated assignments and evidence/audit records.

Each record belongs to one specialist owner.

## 4.3 Integration Layer

The integration layer provides:

- cross-system transaction coordination;
- revision and idempotency keys;
- save/load partitioning;
- migration;
- replication;
- filtered read models;
- diagnostics;
- validation;
- LOD scheduling.

## 4.4 Presentation Layer

28I/Document 17/Presentation Forge consume approved read models and semantic events. Presentation may cache, animate or localise output, but it does not become persistent social truth.

# 5. Service Boundaries and World-Scoped Ownership

A recommended logical service split is:

| Service | Specialist Owner | Mutable Truth |
| --- | --- | --- |
| `ConversationService` | 28B | Conversation session state. |
| `KnowledgeService` | 28C | Beliefs, claims, rumours, information transfer and comprehension state. |
| `RelationshipService` | 28D | Relationship edges, social-memory interpretations, milestones and social reputation. |
| `SocialResolutionService` | 28E | Social-action attempts/results and negotiation/diplomacy sessions. |
| `CompanionService` | 28F | Companion agreements, membership, permissions and availability state. |
| `DelegationService` | 28G | Assignment instances, checkpoints, reports and accountability. |
| `DialogueContentService` | 28H | Approved content/provider selection and provenance; no social mutation. |
| `SocialPresentationAdapter` | 28I | Builds presentation-safe payloads; no social mutation. |
| `SocialIntegrationCoordinator` | 28J | Cross-service orchestration, persistence, replication, migration and validation only. |

## 5.1 World-Scoped Services

Mutable social services should belong to a loaded world/save context rather than a process-global singleton. This supports:

- main menu plus loaded world separation;
- multiple test worlds in automated harnesses;
- clean unload/reload;
- split-screen players sharing one world authority;
- dedicated server without presentation dependencies;
- future editor simulation sandboxes.

A project-level registry service may be shared because immutable definitions are content data. World-specific mutable state may not.

## 5.2 No Node Reference Persistence

Persistent records store IDs and serialisable values, not Godot `NodePath`/instance references as canonical identity. When an NPC actor streams in, it binds to the persistent person/social records through stable IDs. When the actor streams out, the records remain.

# 6. State Classification and Lifetime

Every social datum should declare its lifetime.

| Lifetime | Examples | Persistence Rule |
| --- | --- | --- |
| Immutable definition | Dialogue intent, relationship dimension, companion role. | Content package; not world save. |
| Long-lived world state | Relationship edge, belief, companion agreement. | Persisted. |
| Consequential session | Negotiation, diplomacy, important interrupted conversation. | Persist if resumable/consequential. |
| Short-lived runtime | Ambient bark cooldown, current animation cue. | Not normally persisted. |
| Audit/history | Relationship impact, assignment result, contract-linked social event. | Persist selectively/compactly. |
| Derived view | Relationship band label, localised reason string. | Recomputed; never canonical save truth. |
| Local profile | Subtitle size, social UI density, product language. | Global/local player profile, not shared world state. |
| Cache | Generated line candidate, reverse-reference cache. | Rebuildable unless provenance policy requires record. |

# 7. Immutable Definitions vs Mutable Runtime Records

Definitions answer **what kinds of things can exist**. Runtime records answer **what currently exists in this world**.

Examples:

- `RelationshipDimensionDefinition: trust` is immutable; Mara's current Trust toward the player is mutable.
- `DialogueIntentDefinition: apologise` is immutable; one active apology choice is session state.
- `CompanionRoleDefinition: scout` is immutable; Mara's current role assignment is mutable.
- `AssignmentFamilyDefinition: scout_location` is immutable; assignment `01J...` is mutable.

A save may reference a definition ID and the definition's compatible schema/content revision, but should not serialise a private copy of the entire definition unless a migration snapshot is explicitly required.

# 8. Stable IDs, Namespaces and Identity Rules

Set 28 follows Set 25 qualified-ID governance.

Recommended definition namespaces include:

- `leyforge.core.social.personality.*`
- `leyforge.core.social.intent.*`
- `leyforge.core.social.topic.*`
- `leyforge.core.social.proposition.*`
- `leyforge.core.social.relationship.*`
- `leyforge.core.social.action.*`
- `leyforge.core.social.negotiation.*`
- `leyforge.core.social.companion.*`
- `leyforge.core.social.assignment.*`
- `leyforge.core.social.dialogue_content.*`
- `leyforge.core.social.presentation.*`

Runtime instances use persistent IDs appropriate to their identity type, such as ULID-style values for relationship impact records, conversation sessions or assignments.

## 8.1 Identity Invariants

- Stable person IDs never derive from display names.
- Relationship identity is based on subject/target stable IDs plus relationship scope where required.
- A conversation session ID is not reused after final closure.
- An assignment ID cannot be recycled after cancellation.
- An evidence ID identifies evidence, not its current interpretation.
- A localisation key is not a gameplay ID.
- A generated text candidate ID is not a proposition or event ID.

# 9. Social Content Packages and Dependency Rules

Social content must be packageable without hidden direct dependencies.

A package manifest should be able to declare dependencies such as:

- required culture/faction IDs;
- required NPC/entity definitions;
- required dialogue intents/topics;
- required relationship dimensions;
- required quest/event hooks;
- required economy/survival/movement capabilities;
- required localisation namespaces;
- optional voice/presentation assets.

## 9.1 Package Admission

A social package is admitted only if:

1. all required IDs resolve;
2. field ownership is valid;
3. no namespace collision exists;
4. no prohibited cross-owner override occurs;
5. localisation fallbacks exist for required player-facing content;
6. consequential dialogue has deterministic fallback;
7. migrations are supplied when persisted definition semantics change;
8. validation profiles pass.

# 10. Core Runtime Record Catalogue

The integrated minimum catalogue includes:

| Record | Owner | Persisted? | Notes |
| --- | --- | ---: | --- |
| `ConversationSessionState` | 28B | Conditional | Persist only resumable/consequential sessions. |
| `ConversationCommitRecord` | 28B/28J audit | Yes for consequential | Proves semantic choice commit. |
| `BeliefRecord` | 28C | Yes | Sparse per actor/proposition. |
| `EvidenceRecord` | 28C/external reference | Selective | External evidence may remain owned elsewhere. |
| `ClaimRecord` | 28C | Selective | Persist consequential/public claims. |
| `RumourRecord` | 28C | Yes while relevant | May compact into prevalence summary. |
| `InformationTransferRecord` | 28C | Selective/compacted | Full low-value transfer history need not persist forever. |
| `LanguageCompetencyRecord` | 28C | Yes | Individual mutable competency. |
| `RelationshipRecord` | 28D | Yes | Sparse directed edge. |
| `RelationshipImpactRecord` | 28D | Selective/compacted | Keeps consequential causes. |
| `SocialMemoryInterpretationRecord` | 28D | Yes/compacted | Long-term social meaning. |
| `RelationshipMilestoneRecord` | 28D | Yes | Friendship/rivalry/partnership etc. |
| `SocialReputationRecord` | 28D | Yes/summary | Scope-based public social expectation. |
| `SocialActionAttemptRecord` | 28E | Usually transient | Persist only if needed for audit/story. |
| `SocialResolutionResult` | 28E | Consequential yes | Outcome and reason/evidence references. |
| `NegotiationSessionRecord` | 28E | Conditional | Persist active/important negotiations. |
| `DiplomacySessionRecord` | 28E | Yes when consequential | Includes mandates and ratification state. |
| `CompanionAgreementRecord` | 28F | Yes | Social membership agreement. |
| `CompanionStatusRecord` | 28F | Yes | Active/reserve/unavailable/etc. |
| `DelegatedAssignmentInstance` | 28G | Yes | Goal, phase, constraints and state. |
| `AssignmentCheckpointRecord` | 28G | Selective | Bounded progress evidence. |
| `AssignmentReportRecord` | 28G/28C | Yes when consequential | Distinguishes evidence from interpretation. |
| `DialogueProvenanceRecord` | 28H | Policy-dependent | Required for approved generated content where governance says so. |
| `SocialPresentationPayload` | 28I | No | Derived local view. |

# 11. Command, Validation, Commit and Event Model

All consequential social changes follow the same high-level pattern:

**Command -> Authority Check -> Current Revision Check -> Specialist Validation -> External Revalidation -> Commit -> Event -> Read-Model Update**

## 11.1 Commands Express Intent

Examples:

- `BeginConversationCommand`
- `CommitDialogueChoiceCommand`
- `AttemptSocialActionCommand`
- `SubmitNegotiationOfferCommand`
- `AcceptCompanionAgreementCommand`
- `ChangeCompanionPermissionCommand`
- `CreateDelegatedAssignmentCommand`
- `RecallAssignmentCommand`

Commands contain:

- issuing actor/player identity;
- target/session/record ID;
- requested semantic action;
- expected revision where relevant;
- authority/mandate reference;
- optional idempotency key;
- client/request timestamp for diagnostics, never as authority by itself.

## 11.2 Validation Before Mutation

Validation may include:

- participant still exists;
- actor has authority;
- session is still active;
- target is still available;
- required knowledge is still known;
- contract/price/route/health state revision is still valid;
- choice is still eligible;
- consent boundary remains valid;
- duplicate command was not already committed.

## 11.3 Events Describe Facts

Examples:

- `ConversationStarted`
- `DialogueChoiceCommitted`
- `InformationTransferred`
- `RelationshipChanged`
- `RelationshipMilestoneFormed`
- `SocialActionResolved`
- `NegotiationOfferAccepted`
- `CompanionJoined`
- `CompanionLeft`
- `DelegatedAssignmentAccepted`
- `DelegatedAssignmentCheckpointed`
- `DelegatedAssignmentCompleted`

Events are emitted **after** commit and carry stable cause/evidence references.

# 12. Query, Read-Model and Revision Contract

Social UI, quests, AI/content providers and external systems should query purpose-built read models rather than reading private mutable records directly.

## 12.1 Query Principles

- Queries never mutate.
- Queries declare viewer/knowledge scope where hidden information matters.
- Read models expose bands/reasons rather than secret raw numbers unless developer tooling is authorised.
- External systems receive only fields they own or are explicitly permitted to consume.
- Read models include revision tokens when stale data could cause an invalid action.

Examples:

- `ConversationView(session_id, viewer)`
- `RelationshipView(subject, target, viewer_context)`
- `CompanionView(companion_id, requesting_player)`
- `AssignmentView(assignment_id, viewer)`
- `DiplomacyView(session_id, representative)`

## 12.2 Revision Tokens

A read model used for a consequential choice should contain an `expected_revision` or equivalent monotonic state token. The client returns it with the command. If the world changed, the command is rejected or safely re-evaluated rather than applying against stale assumptions.

# 13. Optimistic Concurrency and Stale-State Protection

Social interactions often remain open while the world continues. A merchant's stock can change, an NPC can be injured, a route can close, another player can complete a quest stage or a companion can become unavailable. 28J therefore adopts optimistic concurrency rather than freezing unrelated world simulation.

## 13.1 Consequential Revision Domains

Recommended revision domains include:

- conversation session revision;
- negotiation/diplomacy session revision;
- companion agreement/status revision;
- assignment revision;
- relationship record revision where direct commits depend on it;
- external snapshot revisions supplied by Sets 27, 29 and 30 where supported.

## 13.2 Stale Command Outcomes

A stale command may resolve as:

- **reject_and_refresh** - choice no longer valid;
- **revalidate_and_commit** - semantics still valid despite unrelated changes;
- **counteroffer_required** - negotiation changed materially;
- **temporarily_blocked** - target unavailable;
- **session_invalidated** - participant died, left, became hostile or otherwise invalid;
- **already_committed** - idempotent duplicate request.

The UI receives a human-readable reason through 28I rather than silently losing input.

# 14. Conversation Authority Integration

28B remains the owner of conversation semantics. 28J adds multiplayer and persistence rules around those sessions.

## 14.1 Session Authority

Every consequential conversation session declares:

- session ID;
- owning `ConversationService` world;
- initiator;
- participants;
- observer/listener roles;
- multiplayer scope;
- decision policy;
- current revision;
- persistence policy;
- interaction-lock policy if any.

## 14.2 Persistence Classes

| Conversation Class | Save Policy |
| --- | --- |
| Ambient bark | Never persist session. |
| Routine service exchange | Usually reconstruct/reopen rather than save. |
| Ordinary personal conversation | Save only if explicitly resumable and interruption matters. |
| Quest-critical conversation | Persist semantic position, participants, context refs and revision. |
| Negotiation/diplomacy | Persist through 28E session record. |
| Companion recruitment/dismissal | Persist resulting agreement/outcome, not necessarily every dialogue beat. |

## 14.3 No Verbatim-Transcript Dependency

Conversation resumption must not require retaining every displayed sentence. Persist semantic node/intent state, committed choices, relevant facts and exact-wording references where needed. Optional transcript history is presentation/user history, not the sole gameplay record.

# 15. Knowledge and Information Authority Integration

28C knowledge is especially sensitive because the server may know much more than any client or NPC.

## 15.1 Server Knowledge Is Not Player Knowledge

The authoritative simulation may contain:

- objective world truth;
- NPC beliefs;
- secret claims;
- evidence;
- undiscovered locations;
- hidden identities;
- private witness records.

A client receives only the subset permitted by:

- the local player's knowledge;
- the viewed NPC's disclosure eligibility;
- conversation context;
- party-sharing settings;
- quest/public-information rules;
- developer permissions.

## 15.2 Knowledge-Filtered Replication

Clients should not receive raw `BeliefRecord` collections for all nearby NPCs. Instead, they receive filtered semantic views such as:

- visible dialogue claims;
- known rumour summaries;
- accessible map knowledge;
- authorised witness statement content;
- permitted uncertainty labels.

This prevents both accidental spoilers and client-side data mining of hidden social state.

## 15.3 Provenance Compaction

Long-lived worlds may generate many information transfers. The system may compact low-value provenance while preserving:

- root source where important;
- current confidence;
- significant contradictions/corrections;
- legally/story-relevant testimony chains;
- secrecy breaches;
- major rumour history.

Compaction may not change the actor's current belief merely to save space.

# 16. Relationship Authority Integration

28D relationship state is persistent, directed and sparse.

## 16.1 Sparse Relationship Graph

The world does not pre-create every possible NPC-to-NPC edge. A relationship edge is materialised when meaningful interaction, household/family relation, long-term cooperation, conflict or authored content makes it useful.

Unused neutral pairs can remain implicit.

## 16.2 Relationship Persistence

A persisted `RelationshipRecord` should contain at minimum:

- subject ID;
- target ID;
- dimension values;
- optional trust-domain overrides;
- active milestones;
- last meaningful interaction time;
- revision;
- significant unresolved social-memory links;
- compaction metadata.

## 16.3 Hidden-State Replication

A client does not automatically receive exact Trust, Affection, Grievance or romance eligibility values. 28D and 28I determine what can be presented. Multiplayer authority therefore replicates **relationship-safe views**, not the full record.

## 16.4 Relationship Event Idempotency

Cross-system events such as rescue, contract breach or assignment abandonment must include stable cause/event IDs so the same event is not applied twice after reconnect, replay or migration.

# 17. Social Resolution and Negotiation Authority Integration

28E owns resolution. 28J ensures attempts are scoped and commit safely.

## 17.1 Attempt Records

Routine attempts may be transient. Consequential attempts should preserve:

- actor/target;
- action definition;
- relevant semantic proposal;
- authority/mandate;
- input snapshot revisions;
- outcome;
- reason codes;
- committed external command references;
- resulting social event references.

## 17.2 Negotiation Atomicity

A negotiation may span social acceptance and an external economy/political transaction. The social system must not announce final acceptance before required external effects are valid.

Recommended pattern:

1. 28E reaches **tentative social agreement**.
2. Owning external system validates terms.
3. Required contract/treaty/resource commands commit.
4. 28E records final agreement state.
5. Social consequences/events emit.

If step 2 or 3 fails, the social session returns to a valid unresolved/counteroffer state rather than pretending a deal happened.

## 17.3 Diplomacy Ratification

A representative may have authority to discuss terms but not to bind a faction. `DiplomacySessionRecord` therefore distinguishes:

- proposal;
- tentative agreement;
- representative recommendation;
- ratification pending;
- ratified;
- rejected;
- superseded;
- expired.

Political state changes remain with Document 13/governance owners.

# 18. Companion Authority Integration

28F companion membership becomes a persisted authority record.

## 18.1 Companion Control Scope

A companion agreement declares who may issue which social commands:

- specific player;
- party/shared authority;
- settlement office/role;
- faction representative;
- quest/event controller;
- self-directed only for some classes.

This is not movement or combat control; it is the social permission to request action families.

## 18.2 One Person, One Persistent Identity

A companion remains the same Document 07 person. Companion membership may not create a duplicate NPC record. Their relationships, household, inventory references, injury state and faction membership remain attached to the original entity.

## 18.3 Conflicting Companion Commands

If two authorised multiplayer players issue incompatible requests, resolution uses the companion agreement's command policy, for example:

- primary_leader;
- current_assignment_owner;
- party_vote;
- first_valid_commit;
- companion_discretion;
- role_authority.

No client wins merely because its network packet arrived first unless the policy explicitly uses first valid commit.

# 19. Delegation and Domain-Adapter Integration

28G delegation is the most cross-system-heavy Set 28 subsystem and therefore requires strict adapter rules.

## 19.1 Domain Adapter Contract

A domain adapter must expose:

- supported assignment capability;
- input/intent schema;
- validation query;
- start/commit command where applicable;
- status query;
- authoritative result/evidence reference;
- cancellation semantics;
- idempotency key handling;
- LOD compatibility;
- failure reason codes.

The adapter never reimplements the domain.

## 19.2 Assignment Checkpoints

Checkpoints are semantic milestones such as:

- travel_started;
- destination_reached;
- purchase_committed;
- evidence_observed;
- combat_encounter_resolved;
- cargo_delivered;
- return_started;
- report_delivered.

They are not fake progress percentages detached from actual domain evidence.

## 19.3 Idempotent Cross-System Effects

Every external assignment effect should carry a stable assignment/request operation ID. Replaying a save journal or reconnecting must not cause:

- duplicate purchases;
- duplicated cargo transfer;
- repeated relationship reward;
- repeated quest contribution;
- duplicate travel booking;
- duplicate contract creation.

# 20. Dialogue Governance and Generated-Content Integration

28H-generated or procedural text remains downstream of authoritative semantics.

## 20.1 Runtime Provider Boundary

The provider receives a disclosure-safe Grounding Packet. It may return:

- text candidate;
- semantic slot usage;
- referenced approved entity/claim IDs;
- validation/provenance metadata.

It never receives a mutable gameplay command interface.

## 20.2 Provider Failure

Provider failure, timeout or validation failure causes deterministic fallback. It must never roll back or alter an already committed social outcome.

## 20.3 Persistence of Generated Text

Persist generated wording only when one of the following is true:

- exact wording becomes narratively consequential;
- player-visible history is intentionally preserved;
- audit/provenance policy requires it;
- another saved record references the wording itself rather than only its semantic meaning.

Otherwise persist semantic IDs and regenerate/reuse deterministic fallback as appropriate.

## 20.4 No AI-Derived Save Truth

A future AI provider cannot write arbitrary keys into the social save. Any persistent result must first become a validated Set 28 definition, command or record through the ordinary authority path.

# 21. Presentation, Voice and Localisation Integration

28I receives a **Social Presentation Payload** assembled from knowledge-safe read models.

## 21.1 Local vs Shared State

Shared world truth includes:

- semantic line/choice identity;
- speaker identity if objectively relevant;
- conversation outcome;
- social state.

Local player presentation includes:

- product language;
- translated text;
- subtitle size;
- captions;
- narration;
- local voice language where available;
- reduced motion;
- UI density.

Two players may therefore render the same semantic conversation differently without changing the shared outcome.

## 21.2 Presentation Cache Invalidation

A presentation payload carries a revision. If knowledge, identity certainty, choice eligibility or conversation state changes, the payload is invalidated/rebuilt. UI should never continue showing an option that the authority has removed without clearly handling the stale state.

# 22. Multiplayer Authority Model

Leyforge uses one authoritative social simulation in multiplayer.

## 22.1 Authority Principles

- The host/server owns mutable social state.
- Clients submit commands.
- The server validates identity, scope, current revision and permissions.
- Clients receive filtered read models/events.
- UI and generated content do not commit state.
- Server results are authoritative for relationships, companion state and assignments.
- Local presentation preferences remain local.

## 22.2 Multiplayer Social Scope

Every consequential social record declares a scope such as:

- personal player-to-NPC;
- participant group;
- party;
- settlement;
- faction;
- world-public;
- private NPC-only;
- delegated/role authority.

The scope affects who may see, act on or replicate the record.

# 23. Solo, Listen-Server and Dedicated-Server Equivalence

Solo is not a separate set of social rules. The local world process acts as authority and executes the same command/validation/commit flow.

| Mode | Authority | Presentation |
| --- | --- | --- |
| Solo | Local authoritative world | Local player UI/audio. |
| Split-screen | One local authoritative world | Multiple local-player presentation contexts. |
| Listen server | Host authoritative world | Host + remote clients. |
| Dedicated server | Headless authoritative world | Remote clients only. |

A social bug should not be “fixed” by making solo bypass validation that multiplayer requires.

# 24. Split-Screen and Multiple Local Players

Split-screen players share one world but may have distinct:

- product languages;
- subtitle/caption preferences;
- dialogue focus;
- map/knowledge views;
- individual relationships;
- quest/social permissions;
- companion command authority.

The runtime therefore separates **local-player context** from shared world state.

## 24.1 Independent UI, Shared Commit

Two local players may see different knowledge-filtered conversation summaries. A shared consequential choice is still committed once according to the session's decision policy.

# 25. Conversation Participation and Interaction Locks

Not every conversation needs a hard NPC lock, but consequential interactions require clear concurrency policy.

## 25.1 Interaction Lock Classes

| Lock Class | Example | Rule |
| --- | --- | --- |
| none | Ambient greeting | Multiple observers may hear/react. |
| soft_focus | Routine shop/service discussion | Others may speak, but one transaction context is primary. |
| participant_lock | Personal/confidential conversation | New participants require explicit join/interrupt rules. |
| consequential_lock | Recruitment, final negotiation, testimony | Prevent parallel contradictory commits. |
| authority_lock | Formal diplomacy/court hearing | Only authorised speakers may issue binding choices. |

## 25.2 Lock Is Not World Freeze

A lock prevents conflicting social commits; it does not necessarily freeze NPC physics, time, danger or unrelated gameplay.

# 26. Shared Decisions, Lead Speaker and Arbitration Policies

A multiplayer conversation may use one of several explicit decision policies.

| Policy | Use |
| --- | --- |
| `initiator_only` | Personal interaction owned by the initiating player. |
| `nominated_lead` | Party chooses one speaker; others advise. |
| `role_authority` | Settlement/faction office holder decides. |
| `unanimous` | High-stakes shared commitment requires all designated players. |
| `majority_vote` | Optional party governance setting for selected shared decisions. |
| `first_valid_commit` | Low-stakes shared action where first accepted command is sufficient. |
| `parallel_personal` | NPC maintains separate personal conversations/outcomes per player where non-conflicting. |

## 26.1 No Persuasion Dogpiling

28E already prevents repeated pressure abuse. Multiplayer does not let four players independently spam the same persuasion attempt until one succeeds. Attempts that address the same social question share cooldown/context/pressure history according to the target and action family.

# 27. Personal Social State and Multiplayer Privacy

## 27.1 Relationship Privacy

One player's exact relationship with an NPC is not automatically visible to other players. Shared reputation may be public, but personal Trust/Affection/Grievance is separate.

## 27.2 Private Knowledge

Private letters, secrets, witness statements or companion confidences replicate only to authorised players. Party sharing may transmit selected discoveries through normal 28C information-transfer rules; it is not automatic developer-level data sharing.

## 27.3 Privacy-Safe Read Models

Read models can expose:

- `known_to_you`;
- `shared_with_party`;
- `public`;
- `confidential_to_role`;
- `private`;

without exposing the secret content itself to unauthorised clients.

# 28. Companion Control and Party Authority in Multiplayer

Companion status belongs to 28F; 28J defines command scope.

## 28.1 Control Models

Supported models may include:

- personal companion - one primary player;
- shared party companion - designated party authority;
- hired group escort - contract-defined issuer(s);
- settlement retainer - office/role authority;
- quest companion - quest-defined participation rules.

## 28.2 Transfer of Command Authority

Changing the primary commander is itself an authoritative social/party action. It cannot be achieved by merely clicking a local UI selector.

## 28.3 Disconnect Behaviour

If the primary player disconnects:

- the companion does not disappear;
- current safe action may continue according to standing autonomy;
- command authority may temporarily transfer if the agreement permits;
- otherwise the companion enters an autonomous/wait/reserve policy;
- reconnect restores the authorised relationship without duplicate join events.

# 29. Diplomacy, Representation and Multiplayer Mandates

Formal diplomacy must know **who is allowed to speak for whom**.

A multiplayer player may possess:

- no mandate;
- observer status;
- adviser status;
- negotiator mandate;
- limited bargaining authority;
- signatory authority;
- emergency authority.

28E resolves the social negotiation. Document 13/governance determines political authority. 28J verifies mandate references and ensures a client cannot bind a faction through an unauthorised dialogue choice.

# 30. Disconnect, Reconnect and Session Recovery

## 30.1 Reconnect Invariants

On reconnect:

- committed choices are not replayed;
- active sessions resume only if still valid;
- stale UI commands are rejected;
- companion membership remains intact;
- assignment ownership/issuer links remain valid;
- private knowledge is resent only to authorised client;
- local presentation settings restore from profile;
- no generated text candidate is treated as a committed event merely because it was cached client-side.

## 30.2 Abandoned Session Cleanup

Transient conversation reservations may expire after a bounded timeout. Consequential sessions either persist, cancel with explicit reason or transition to a safe paused state according to their definition.

# 31. Client Prediction, Latency and Presentation Responsiveness

Social gameplay is less latency-sensitive than movement, but it should still feel responsive.

Clients may immediately:

- highlight a selected choice;
- play a non-consequential input animation;
- show “waiting for response”; 
- begin local UI transition.

Clients may not predictively:

- change relationship values;
- deduct payment;
- recruit a companion;
- complete an assignment;
- mark a negotiation accepted;
- reveal new secret knowledge.

A rejected command returns a reason and refreshed read model.

# 32. Replication Relevance, Delta Updates and Bandwidth

Social state should replicate by **relevance and semantic delta**, not by broadcasting entire social graphs.

## 32.1 Relevance Examples

- Active conversation participants receive session deltas.
- Nearby observers may receive public speech events, not private choice internals.
- A player receives their own relationship-safe views when relevant.
- Settlement summary UI receives aggregate social-reputation data only when opened/subscribed.
- Companion owner/party receives companion status deltas.
- Assignment issuer receives assignment updates; unrelated players do not.

## 32.2 Delta Replication

Use small changes such as:

- choice list revision changed;
- speaker changed;
- companion availability changed;
- assignment phase changed;
- relationship milestone formed;
- public rumour prevalence band changed.

Do not repeatedly replicate full historical records.

# 33. Persistence Principles and Save Boundaries

Social persistence must preserve consequence without turning the save into an unlimited transcript archive.

## 33.1 Persistence Principles

1. Persist authoritative semantic state, not presentation.
2. Persist causes/evidence for important consequences.
3. Compact repetitive low-value history.
4. Preserve stable IDs across streaming and actor recreation.
5. Never infer a missing social fact from a line of text during load.
6. Keep profile presentation settings outside world save state.
7. Migrations must be explicit, versioned and testable.
8. Failed migration must not silently discard relationships or companion commitments.

## 33.2 What Is Not Saved as Social Truth

Normally excluded:

- current subtitle position;
- voice playback time;
- hover/focus state;
- transient generated candidate text;
- ambient bark cooldowns unless abuse prevention requires a short persisted timer;
- developer inspector state;
- temporary animation gestures;
- local UI expansion/collapse state.

# 34. Social Save Partition and World Manifest Links

Set 28 should use a dedicated social save partition or equivalent bounded module rather than scattering state through unrelated files.

Recommended logical partition:

```text
world_manifest
  -> social_partition
       schema_version
       content_compatibility_revision
       relationship_records
       knowledge_records
       conversation_records
       social_resolution_records
       companion_records
       assignment_records
       compact_social_history
       subsystem_checksums
```

The exact file format belongs to the current technical implementation, but the separation should remain.

## 34.1 World vs Player Profile

**World save:**

- social relationships;
- NPC knowledge;
- rumours;
- companion agreements;
- assignments;
- consequential social history.

**Player profile:**

- product language;
- subtitle/caption settings;
- narration;
- social UI density;
- reduced motion;
- local notification preferences.

World-specific learned knowledge remains in the world save even though its presentation settings are profile-level.

# 35. Social Record Persistence by Subsystem

## 35.1 Conversation

Persist only:

- consequential/resumable sessions;
- semantic position;
- committed choice IDs;
- participant IDs;
- relevant external references;
- session revision;
- interruption/resume token;
- expiration policy.

## 35.2 Knowledge

Persist:

- meaningful beliefs;
- language competency;
- important evidence/provenance;
- relevant rumours;
- secrets/disclosure classes;
- compact prevalence summaries.

Very low-salience facts may expire or be summarised according to 28C rules.

## 35.3 Relationships

Persist:

- materialised relationship edges;
- significant milestones;
- unresolved grievances/commitments;
- selected social-memory interpretations;
- current public social-reputation summaries;
- last meaningful interaction metadata.

## 35.4 Social Resolution

Persist consequential:

- negotiated agreements;
- diplomacy sessions;
- promises/obligations where Set 28 owns the social promise;
- important intimidation/deception outcomes;
- evidence-linked apology/reconciliation outcomes.

## 35.5 Companions

Persist all active or historically meaningful agreements/status, including former companion state where relationship history depends on it.

## 35.6 Delegation

Persist every active assignment plus enough checkpoint/evidence history to resume safely and prevent duplicate domain effects.

# 36. Social Journals, Event History and Audit Evidence

The save architecture benefits from append-style journals or commit logs around consequential social changes.

## 36.1 Audit Goals

A developer should be able to answer:

- why did Trust change?
- which command recruited this companion?
- which contract status caused resignation?
- why did an assignment complete?
- which evidence created this rumour?
- who committed the shared dialogue choice?
- was a relationship event applied twice?

## 36.2 Audit Retention Classes

| Class | Example | Retention |
| --- | --- | --- |
| critical | marriage/partnership milestone, betrayal, companion death | Long-term. |
| consequential | recruitment, major negotiation, quest social choice | Long-term or compact summary. |
| routine | ordinary trade greeting | Not normally journalled. |
| diagnostic | rejected stale command | Short-term debug log, not permanent save history. |

## 36.3 History Compression

Compression may combine repetitive impacts such as many small friendly work interactions into a consolidated social-memory summary, provided:

- the current relationship is unchanged by compaction;
- important individual incidents remain inspectable;
- quest/legal/story evidence is retained;
- migration can still identify the semantic cause family.

# 37. Save Scheduling, Checkpoints and Atomicity

## 37.1 Safe Save Points

Social state may be saved during active play, but snapshots must be internally consistent.

A save coordinator should either:

- take a consistent revision snapshot across social services; or
- serialise journal positions so recovery can replay committed operations safely.

## 37.2 Multi-Domain Commit Safety

If a social action depends on an external committed transaction, save ordering must not produce a world where only half of the action exists.

Example: companion hire payment.

Safe states include:

- payment not committed, companion not hired;
- payment committed and hire commit recorded;
- compensation explicitly pending under a contract state defined by Set 27.

Unsafe state:

- money removed with no contract/companion state and no recovery evidence.

## 37.3 Autosave During Conversations

Autosave may occur during ordinary dialogue. If a consequential choice is mid-request but not yet committed, the save records the previous stable revision and the pending client request is discarded/retried after load rather than assumed successful.

# 38. Schema Versioning and Migration

Each persisted social subsystem carries its own schema version under the Set 28 partition.

Example:

```yaml
social_partition:
  version: 4
  subsystems:
    conversation: 2
    knowledge: 3
    relationship: 3
    social_resolution: 2
    companion: 2
    delegation: 2
```

## 38.1 Migration Principles

- Migrate stepwise, never through undocumented leaps.
- Preserve stable IDs whenever semantics remain equivalent.
- Record irreversible migration decisions.
- Unknown optional fields are tolerated where schema policy permits.
- Removed definitions use aliases/deprecation mappings from Set 25.
- Relationship value migration preserves meaning, not just raw numbers.
- Missing content must fail visibly or use explicitly approved fallback definitions.

## 38.2 Example Relationship Migration

If an older save has one `friendship_score`, migration must not blindly copy it into Trust, Affection, Loyalty and Respect equally.

A migration profile should define a deliberate mapping such as:

- convert score band to Familiarity + broad Trust baseline;
- preserve authored friend milestone if present;
- leave Affection/Loyalty neutral unless historical evidence supports them;
- emit a migration-note record for QA.

## 38.3 Definition Semantic Changes

Changing what a persisted ID **means** is more dangerous than changing display text. If a definition's semantics change incompatibly, create a new version/ID or supply a migration rather than silently reusing the ID.

# 39. Recovery, Integrity Repair and Missing References

Social state must fail safely when content or records are damaged.

## 39.1 Recovery Order

1. Validate partition checksum/header.
2. Load immutable registry definitions.
3. Resolve stable person/external IDs.
4. Apply schema migrations.
5. Validate cross-record invariants.
6. Repair safe derived fields/caches.
7. Quarantine unrecoverable optional records.
8. Block load only when loss would corrupt authoritative world truth.

## 39.2 Missing Person Reference

If a relationship references a missing NPC:

- do not rebind it to another NPC with the same display name;
- attempt stable-ID migration/alias resolution;
- if permanently missing, preserve historical edge in quarantine/archive if needed;
- active companion/assignment records become blocking integrity errors requiring explicit recovery.

## 39.3 Missing Definition Reference

Use Set 25 aliases/fallback policy. A generic fallback may preserve read access, but it must not invent gameplay semantics for a missing critical relationship milestone or contract-linked companion role.

# 40. Simulation LOD and Promotion/Demotion

Social LOD changes representation, not ownership.

Recommended tiers:

| Tier | Representation | Typical Use |
| --- | --- | --- |
| S0 - Interactive | Full actor + active conversation/nearby social events. | Same loaded area as player. |
| S1 - Local abstract | Persistent NPC + detailed schedule/social opportunity summaries. | Loaded settlement but off-screen. |
| S2 - Settlement summary | Bounded relationship/info/contact events, no per-frame behaviour. | Distant settlement. |
| S3 - Regional dormant | Only consequential scheduled/social propagation checkpoints. | Far/unloaded regions. |
| S4 - Frozen/archival | No active simulation until a world event/time rule requires it. | Very distant/inactive content. |

## 40.1 Promotion Invariants

When a distant NPC becomes interactive:

- identity is unchanged;
- relationship state matches summary truth;
- knowledge state is consistent with propagated information;
- active assignment phase is reconstructable;
- companion availability is current;
- no invented dialogue history is generated to justify unexplained state.

# 41. Distant Social Catch-Up and Time Advancement

Distant catch-up should process bounded semantic events rather than every missed conversation.

Examples:

- household members have normal social contact -> familiarity maintenance summary;
- a public warning spreads through a settlement -> information prevalence update;
- a long absence causes a low-salience relationship to cool slightly if 28D allows;
- a companion on assignment advances through real travel/domain checkpoints;
- a diplomatic deadline expires;
- a rumour loses detail as it spreads.

## 41.1 Bounded Work

Catch-up has limits on:

- number of social interactions synthesised;
- provenance hops retained;
- relationship edges touched;
- rumours propagated;
- assignments advanced;
- generated presentation text - normally none is needed off-screen.

If more time elapsed than can be simulated in one pass, aggregate safely rather than iterating every hour.

# 42. Knowledge and Rumour LOD

28C may represent settlement-wide knowledge through prevalence summaries when individual detail is not needed.

## 42.1 Prevalence Summary

A summary may track:

- proportion aware;
- broad acceptance/confidence band;
- dominant source family;
- age/freshness;
- secrecy/publicity class;
- notable dissent/contradiction flag.

When an individual becomes important, their personal belief may be instantiated from valid local sources and personality/context rules without pretending they participated in specific conversations that were never simulated.

## 42.2 No Omniscient Promotion

Promotion from prevalence to individual belief must respect:

- whether the person had plausible contact with the channel;
- disclosure restrictions;
- language/comprehension;
- faction/household/workplace connections;
- location/time.

# 43. Relationship and Social-Reputation LOD

## 43.1 Relationship Edge Classes

- **pinned** - player, household, companion, major story, major rival;
- **active** - recent meaningful interaction;
- **summary** - low-detail but retained relationship;
- **implicit neutral** - no stored edge.

Pinned edges do not disappear merely because actors are distant.

## 43.2 Distant Relationship Change

Distant changes require an actual cause family such as:

- assignment completion/failure;
- reported public act;
- household event;
- major faction/settlement event;
- propagated reputation evidence;
- extended absence rule defined by 28D.

Distance by itself does not randomly rewrite deep friendship.

# 44. Companion and Delegation LOD

## 44.1 Companion Away From Player

An active companion may be:

- physically travelling under Set 30;
- delegated under 28G;
- waiting at a safe anchor;
- recovering under Set 29;
- returning home;
- temporarily unavailable.

28F status remains authoritative while movement/survival owners provide current feasibility.

## 44.2 Assignment LOD

Assignments transition through domain checkpoints. The distant simulation can advance only when the domain owner supplies valid results or an approved deterministic summary.

No assignment receives success because “enough simulated days passed” without completion evidence.

# 45. Registry Architecture and Set 25 Integration

Set 28 registries use Set 25's canonical kernel.

## 45.1 Registry Requirements

Each definition should support:

- qualified stable ID;
- schema version;
- owning document/system;
- display/localisation keys where player-facing;
- tags;
- dependencies;
- compatibility constraints;
- package/source/provenance;
- deprecation/alias metadata;
- planning status outside shipped gameplay fields where appropriate;
- validation profile.

## 45.2 Registry Load Phases

1. Foundation types/tags.
2. External owner registries required by Set 28.
3. Core Set 28 definitions.
4. Content packs/overrides permitted by Set 25.
5. Cross-reference resolution.
6. Semantic validation.
7. reverse-reference/index construction.
8. runtime world load.

# 46. Registry Ownership by Document 28A-28I

| Document | Primary Definition Families |
| --- | --- |
| 28A | Social personality facets/profiles, shared social scope/event/reason families, integration contracts. |
| 28B | Dialogue intents, topics, conversation templates, beats, choices, conditions, transitions. |
| 28C | Proposition families, disclosure policies, information channels, evidence/source families, comprehension profiles. |
| 28D | Relationship dimensions, event-impact profiles, decay profiles, trust domains, milestones, social-reputation dimensions. |
| 28E | Social-action definitions, etiquette rules, negotiation issue/term wrappers, leverage classes, resolution profiles. |
| 28F | Companion classes, roles, autonomy/permission profiles, availability/recruitment profiles. |
| 28G | Assignment families, briefing/constraint definitions, domain-adapter contracts, report/evidence requirements. |
| 28H | Dialogue content definitions, style profiles, provider capability profiles, grounding/validation profiles, content-risk classes. |
| 28I | Social presentation definitions, voice profiles/bindings, subtitle/caption metadata, localisation/terminology/pronunciation records. |

28J defines the registry envelope, load order, validation and compatibility rules. It does not move ownership of the definitions above.

# 47. Typed Relationships, Tags and Reverse References

Definitions should reference each other through typed relationships rather than freeform string conventions.

Examples:

- conversation template **uses_intent** dialogue intent;
- dialogue line **may_assert** proposition family;
- relationship milestone **requires_dimension_band** relationship dimension;
- companion role **permits_assignment_family** assignment family;
- assignment **requires_domain_adapter** movement/economy/etc capability;
- voice binding **realises_semantic_line** dialogue content definition.

## 47.1 Reverse References

Build-time indexes should answer questions such as:

- Which dialogue templates use this intent?
- Which milestones depend on this relationship dimension?
- Which companion roles permit this assignment?
- Which localisation/voice assets bind to a semantic line?
- Which content packs depend on this culture/faction ID?

These reverse indexes are derived and need not be authoritative save state.

# 48. Validation Architecture

Validation occurs at multiple stages rather than one final pass.

| Stage | Purpose |
| --- | --- |
| Authoring-time | Catch invalid definitions early. |
| Package admission | Validate dependencies, ownership and provenance. |
| Registry load | Resolve IDs and schemas. |
| World load | Validate persisted records/migrations. |
| Runtime command | Validate current eligibility/authority/revision. |
| Save | Validate structural invariants before commit. |
| CI | Run deterministic scenario/regression suites. |
| Release | Block severe social corruption/privacy/authority defects. |

# 49. Schema, Reference and Ownership Validation

Validators must detect:

- missing required field;
- wrong field type;
- duplicate ID;
- unresolved external ID;
- illegal namespace override;
- record owned by wrong subsystem;
- definition circular dependency where prohibited;
- missing localisation for required content;
- missing deterministic dialogue fallback;
- invalid migration chain;
- unsupported schema version;
- orphaned companion/assignment record;
- relationship endpoint mismatch;
- unknown reason-code family.

# 50. Semantic and Gameplay Invariant Validation

Schema-valid data can still be nonsensical. Semantic validators therefore enforce rules such as:

- a relationship milestone requiring mutual consent cannot be unilateral;
- Fear cannot be treated as Loyalty by a companion rule;
- a dialogue choice cannot mutate Set 27 prices directly;
- a generated line cannot create a new proposition truth;
- a companion cannot be simultaneously dead and active-field;
- an assignment cannot complete without required evidence;
- a settlement-wide rumour cannot be private-to-one-person;
- an unknown speaker name cannot be revealed by presentation metadata;
- a diplomacy session cannot be ratified by an actor lacking the required mandate;
- a player cannot command another player's personal companion without authority;
- a save cannot contain two active membership records that violate a companion class's exclusivity rules.

# 51. Multiplayer, Privacy and Authority Validation

Release-blocking tests include:

- client cannot set Trust directly;
- client cannot submit a choice for a conversation it does not participate in;
- unauthorised player cannot read private belief/secret data;
- player cannot bind faction diplomacy without mandate;
- duplicate network command produces one committed effect;
- stale negotiation offer cannot overwrite newer terms;
- reconnect cannot re-trigger recruitment payment or reward;
- split-screen local language settings cannot alter semantic choice identity;
- remote runtime-AI provider output cannot issue gameplay command;
- client-side cached hidden data is never required for authority.

# 52. Persistence, Migration and LOD Equivalence Validation

## 52.1 Save/Load Equivalence

After save/load, verify:

- relationship dimensions/milestones unchanged except intentional migration;
- knowledge confidence/provenance preserved within compaction policy;
- companion status unchanged;
- assignment checkpoint unchanged;
- active negotiation/session resumes or safely invalidates according to policy;
- no side effect is duplicated.

## 52.2 LOD Equivalence

For representative deterministic scenarios, compare:

- fully loaded simulation;
- local abstract simulation;
- distant summary simulation.

The exact animation/events may differ, but final authoritative outcomes should remain compatible within the rules of each subsystem.

# 53. Automated Tests and Deterministic Scenario Harnesses

Set 28 should ship with social test worlds/scenarios that use fixed IDs and seeds.

Recommended harnesses:

1. **Basic Conversation Commit** - two participants, valid choice, event and reload.
2. **Stale Choice** - external state changes while dialogue is open.
3. **False Rumour Correction** - belief spread, correction, relationship reappraisal.
4. **Relationship Milestone** - friendship forms only after mutual/semantic eligibility.
5. **Negotiation Commit** - tentative social agreement + Set 27 mock validation.
6. **Companion Recruitment** - accepted recruitment, reconnect, no duplicate membership.
7. **Companion Refusal** - command denied socially, no external action starts.
8. **Delegated Delivery** - travel + inventory transaction + report, save mid-assignment.
9. **Blocked Route** - Set 30 reports blocked route; assignment pauses truthfully.
10. **Injury Withdrawal** - Set 29 reports unavailability; assignment/companion state updates without 28J changing health.
11. **Multiplayer Private Conversation** - unauthorised client sees no private contents.
12. **Shared Party Decision** - nominated leader/role authority behaves deterministically.
13. **Disconnect/Reconnect** - active companion and assignment survive.
14. **Runtime AI Failure** - deterministic fallback, no gameplay change.
15. **Migration Fixture** - older relationship/companion records migrate without loss.
16. **LOD Round Trip** - interactive -> distant -> interactive preserves state.

# 54. Property, Fuzz and Adversarial Testing

Beyond authored scenarios, test invariants over many generated cases.

## 54.1 Property Tests

Examples:

- applying the same idempotent relationship event twice produces one effect;
- relationship value remains within definition bounds;
- a closed conversation never accepts another choice;
- every active companion references a valid persistent entity;
- every assignment phase transition is legal;
- every replicated presentation payload is derivable from authorised read models;
- no client-visible payload contains a field tagged server_secret.

## 54.2 Fuzz Tests

Fuzz:

- malformed dialogue content packs;
- unknown IDs;
- extreme relationship values from legacy saves;
- rapid join/leave/reconnect;
- repeated choice submission;
- simultaneous companion commands;
- provider-generated malformed text/metadata;
- localisation strings with unexpected lengths/plural forms;
- corrupted save partition fragments.

## 54.3 Adversarial Free Text

28H player free-text interpretation must be tested against:

- prompt-injection phrasing;
- hidden-quest requests;
- fake system commands;
- attempts to invent currency/items;
- attempts to impersonate another player;
- abusive repeated pressure against NPCs;
- unsupported proper nouns.

# 55. Diagnostics, Inspectors, Logs and Social Debug Tools

A complex social simulation requires inspectable cause chains.

Recommended developer tools:

- Social Person Inspector;
- Conversation Session Inspector;
- Knowledge/Belief Inspector;
- Relationship Graph Inspector;
- Relationship Cause Timeline;
- Negotiation/Diplomacy Inspector;
- Companion Agreement Inspector;
- Assignment Timeline/Adapter Inspector;
- Social Replication Inspector;
- Privacy/Disclosure Inspector;
- Registry Dependency Browser;
- Migration Report Viewer;
- Social LOD Inspector;
- Cross-Set Interface Trace.

## 55.1 Player-Safe vs Developer Views

Developer tools may show exact hidden numbers and secret records. Shipping player UI must not accidentally reuse those unrestricted views.

## 55.2 Structured Logs

Logs should record stable IDs and reason codes rather than dumping full private dialogue text by default.

Useful fields:

- world ID;
- social subsystem;
- command/event ID;
- subject/target IDs;
- revision;
- result code;
- owning service;
- external adapter reference;
- latency/timing;
- migration version.

# 56. Performance, Memory and Scalability Budgets

Exact final numbers require profiling, but 28J locks the shape of the budget.

## 56.1 Primary Cost Drivers

- materialised NPC-to-NPC relationship edges;
- belief/provenance records;
- active conversations;
- rumour propagation;
- delegated assignment checkpoints;
- reverse-reference registry indexes;
- multiplayer filtered read models;
- optional runtime generation/voice presentation.

## 56.2 Scalability Rules

- Do not materialise all-pairs relationships.
- Do not simulate every gossip exchange.
- Do not save every ambient line.
- Do not replicate full social graphs.
- Compact old low-salience provenance/history.
- Cache read models by revision where safe.
- Batch distant social updates.
- Cap active generated-content jobs separately from authoritative social work.

## 56.3 Initial Engineering Targets

These are **prototype budgets**, not final locked hardware promises:

- ordinary social commands should validate/commit within the same simulation frame or bounded job completion window;
- active conversation read-model rebuild should be lightweight enough for immediate UI response;
- distant social catch-up should be budgeted per frame/tick and resumable;
- registry validation may be heavier at load/build time but must provide actionable diagnostics;
- optional AI/voice costs must never block authoritative state progression.

# 57. Security, Trust Boundaries and Untrusted Inputs

Untrusted inputs include:

- multiplayer client commands;
- player free text;
- mod/content packs;
- imported localisation;
- optional runtime provider output;
- legacy saves;
- external service responses.

## 57.1 Trust Rules

- Validate all IDs and authority server-side.
- Never trust client-supplied relationship/economy values.
- Never execute generated text as code.
- Keep credentials outside content/save files.
- Treat imported dialogue as data, not script authority.
- Use schema allowlists for provider output.
- Avoid logging unnecessary private/free-form player text.
- Apply Set 25 provenance/licence controls to social content.

## 57.2 Privacy Boundary

Conversations and social state used in multiplayer remain game data, but external AI/voice services require the additional privacy rules established in 28H/28I. 28J does not assume such services exist.

# 58. Modding, Content Packs and Safe Extension

Set 28 is designed to be content-extensible without unrestricted code execution.

Mods/content packs may add, subject to Set 25 rules:

- dialogue templates/content;
- proposition families that bind to approved truth-provider interfaces;
- relationship milestones/event profiles;
- social actions/etiquette definitions;
- companion roles/permission profiles;
- assignment families using approved domain adapters;
- voice/localisation/presentation content.

They may not by default:

- write arbitrary relationship values;
- invoke unrestricted server code;
- bypass consent/authority rules;
- read hidden player/NPC secrets outside permitted queries;
- create new Set 27/29/30 ownership logic inside Set 28 definitions;
- register an unvalidated runtime AI tool with gameplay command access.

# 59. Compatibility, Deprecation and Live Content Revision

## 59.1 Backward-Compatible Changes

Usually safe with validation:

- adding optional dialogue variants;
- adding localisation;
- adding new companion roles;
- adding new relationship event profiles;
- adding new assignment families;
- adding presentation assets.

## 59.2 Potentially Breaking Changes

Require migration/review:

- changing relationship dimension meaning/range;
- removing a milestone referenced by saves;
- changing a dialogue intent's semantic effect;
- changing companion agreement semantics;
- changing assignment completion evidence;
- changing proposition identity/truth provider;
- changing a cross-set interface contract.

## 59.3 Deprecation

Deprecated definitions remain resolvable for migration/history until the supported compatibility window permits removal. Player-facing UI should prefer replacement definitions, but old save records must not silently remap to an unrelated meaning.

# 60. Cross-System Integration Matrix

| External System | Set 28 Consumes | Set 28 Exposes | Integration Rule |
| --- | --- | --- | --- |
| Document 07 NPC/Village | person, household, job, schedule, settlement membership | social relationships, companion status, dialogue/social events | Never duplicate person identity or job scheduler. |
| Document 13 Culture/Faction | culture, language definition, law, faction, political authority | diplomacy/social reactions, relationship/reputation evidence | Political world state remains external. |
| Document 15 Quest/Event | objective/event context, quest authority | committed dialogue choice, social result, assignment evidence | Quests decide objective progression. |
| Document 16 Combat | harm, rescue, surrender, death, combat facts | social permission/refusal, intimidation outcome | Combat executes physical actions. |
| Document 17 UI | input/navigation/settings architecture | filtered social read models | UI cannot mutate social state directly. |
| Set 25 | IDs, schema/package/provenance/migration kernel | social schemas/validators | Set 25 remains production governance authority. |
| Set 27 | prices, wages, contracts, trade, economic results | relationship/social modifiers, companion agreement/assignment mandate | Set 28 never calculates economy. |
| Set 29 | injury, illness, fatigue, recovery, carry penalty | care/social availability context, assignment status | Set 28 never computes health. |
| Set 30 | movement mode, travel, route, seating, capacity | formation/passenger/travel/assignment intents | Set 28 never paths or moves actors. |
| Presentation Forge | sound event/runtime audio | speech/semantic presentation metadata | Audio system renders; social system owns meaning. |

# 61. Final Set 28 Interface Reconciliation Register

28A-28I proposed several interfaces while preserving the governing cross-set contract. 28J consolidates them into one **Set 28 requested interface package** for the later Document Sets 27-30 final integration pass.

No interface below is treated as approved merely because it appears here. Set 27, 29 and 30 retain the right to expose an equivalent function under a different exact signature so long as the semantic contract is satisfied.

## 61.1 Required Incoming from Set 27

| Semantic Interface | Purpose | Set 28 Consumers |
| --- | --- | --- |
| `WageOffer(actor_or_role, context)` | Read-only current compensation terms. | 28E, 28F. |
| `ContractSummary(contract_id)` | Typed contract terms, status and permitted negotiation bounds. | 28B, 28E, 28F. |
| `TradeOpportunities(actor_or_settlement, context)` | Economy-generated opportunities that may become social topics. | 28B/28C. |
| `EconomicStanding(subject, observer_scope)` | Economy-specific standing distinct from social reputation. | 28A/28E. |
| `CompanionContractStatus(companion_agreement)` | Paid-service economic status such as current/arrears/expired/breached. | 28F. |
| `AssignmentEconomicResult(assignment_id)` | Committed purchase/sale/contract result and audit refs. | 28G. |
| `LocalisedEconomicTermSummary()` or typed localisation-ready term payload | Presentation-safe economic terms. | 28I. |

## 61.2 Required Incoming from Set 29

| Semantic Interface | Purpose | Set 28 Consumers |
| --- | --- | --- |
| `RecoveryStatus(entity)` | Improving/stable/worsening/recovered availability context. | 28B, 28F, 28G. |
| `SurvivalSocialModifier(entity)` | Bounded social-facing effect where approved. | 28D/28E. |
| `AssignmentSurvivalAvailability(entity, assignment_context)` | Whether biological state permits assignment start/continue/withdraw. | 28G. |
| `SociallyRelevantConditionSummary()` | Disclosure-safe localisable condition category/reason. | 28I. |
| Existing `CarryPenalty()` | Physiological component used when assignment cargo feasibility matters. | 28G composition. |

## 61.3 Required Incoming from Set 30

| Semantic Interface | Purpose | Set 28 Consumers |
| --- | --- | --- |
| `TravelState(entity_or_party)` | Walking/mounted/vehicle/waiting/blocked/arrived context. | 28B, 28F, 28G. |
| `PassengerSeatAvailability(vehicle, passenger_profile)` | Validate social passenger assignment against physical seating. | 28F. |
| `FormationResolution(group, formation_intent)` | Resolve social formation intent into physical positions. | 28F. |
| `AssignmentTravelUpdate(assignment_id)` | Route state, ETA band, blocker and arrival evidence. | 28G. |
| `TravelContextPresentationSummary()` | Localisable travel/mount/vehicle blocker summary. | 28I. |
| Existing `CargoCapacity()`, `TraversalCost()`, `TravelTime()`, `RouteAccessibility()` | Planning/execution facts. | 28G. |

## 61.4 Set 28 Outbound Interfaces

| Semantic Interface | Consumer | Meaning |
| --- | --- | --- |
| `RelationshipLevel()` / `Trust()` / `Affection()` / `Fear()` / `Loyalty()` | Set 27/others where permitted | Social state from 28D. |
| `PersuasionModifier()` | Set 27/other social consumers | Bounded modifier/context, not economic result. |
| `CompanionAgreement(subject)` | Set 27 | Social service/consent agreement, excluding payment calculation. |
| `FormationIntent(group)` | Set 30 | Requested social role/order only. |
| `PassengerAssignment(vehicle_or_trip)` | Set 30 | Socially authorised passengers. |
| `CompanionTravelPermission(companion, context)` | Set 30 | Whether companion is willing/authorised to travel. |
| `CompanionActionPermission(companion, action_family, context)` | 28G/combat adapters | Allowed/ask/conditional/prohibited social permission. |
| `CompanionAvailability(companion, context)` | 28G/UI/Quest | Current companion-system availability. |
| `RendezvousIntent(companion, destination)` | Set 30 | Request to physically join party. |
| `ReturnHomeIntent(companion, home_anchor)` | Set 30 | Request physical return after leaving/reserve. |
| `AssignmentTravelRequest(assignment_id, assignee, destination, constraints)` | Set 30 | Delegated travel intent. |
| `AssignmentEconomicMandate(assignment_id)` | Set 27 | Maximum/allowed economic authority for delegated task. |
| `AssignmentStatus(assignment_id)` | Sets 27/29/30 and others | Current assignment phase/status context. |

## 61.5 Generic Evidence Interface

`DelegatedGoalEvidence(assignment_id, domain_owner, evidence_ref)` remains a useful **generic inbound evidence registration pattern**. Exact implementation may be an event rather than a query function. The important rule is that the domain owner produces the evidence and 28G records the reference.

## 61.6 Withdrawn as a Separate Interface: `AssignmentCarryFeasibility()`

28G proposed a joint `AssignmentCarryFeasibility(entity, cargo_profile)` interface. 28J recommends **not creating a new shared owner for this calculation**.

Instead, 28G/28J should compose existing owner outputs:

- Set 29 `CarryPenalty()` / survival availability;
- Set 30 `CargoCapacity()` / movement/traversal constraints.

If later implementation proves a combined query is necessary, it should be a pure integration facade with no independent gameplay formula.

# 62. Godot/Summer Engine Implementation Direction

This document remains engine-aware but avoids locking fragile class names too early.

## 62.1 Godot Definition Assets

Immutable social definitions are well suited to typed Godot `Resource` assets or generated registry objects, for example:

- `DialogueIntentDefinitionResource`;
- `RelationshipDimensionDefinitionResource`;
- `CompanionRoleDefinitionResource`;
- `AssignmentFamilyDefinitionResource`.

Content may originate from validated external data and compile into runtime Resources according to Set 25 tooling.

## 62.2 Mutable World Records

Mutable records should be serialisable data structures owned by world services. They should not require the corresponding NPC Scene/Node to exist.

Recommended characteristics:

- stable IDs;
- explicit schema version;
- deterministic serialisation;
- no presentation references unless optional metadata;
- no hidden cyclic Node ownership;
- bounded arrays/maps;
- validation methods/test fixtures.

## 62.3 World Service Composition

A loaded world may instantiate a `SocialDomainRoot` under the authoritative world simulation with specialist child/services. Dedicated server builds can load these services without audio, portraits, animation or UI.

## 62.4 Signals and Event Bus

Godot signals or project event-bus patterns may distribute committed events, but:

- event emission occurs after commit;
- listeners cannot mutate the owner by direct record reference;
- persistent cross-system effects use explicit commands/adapters;
- event ordering relevant to saves is deterministic/auditable.

## 62.5 Summer Engine Use

Summer Engine may assist with:

- generating typed boilerplate;
- validators;
- migration fixtures;
- test harnesses;
- registry importers;
- debug tools;
- documentation consistency checks.

AI-assisted changes remain reviewed and tested. Summer Engine is not itself the runtime social authority.

# 63. Staged Implementation and Integration Plan

## Stage J0 - Definition/Ownership Audit

- register all 28A-28I definitions;
- verify owner fields;
- eliminate duplicate/legacy social fields from other systems where later revision permits;
- lock stable ID conventions.

**Exit:** registry loads with no unresolved critical ownership conflicts.

## Stage J1 - Core Social Services

- ConversationService;
- KnowledgeService;
- RelationshipService;
- SocialResolutionService;
- command/event/revision infrastructure.

**Exit:** deterministic single-player conversation/relationship scenarios pass save/load.

## Stage J2 - Companion and Delegation Integration

- CompanionService;
- DelegationService;
- domain adapters;
- idempotency/evidence flow;
- distant checkpoint foundation.

**Exit:** recruit companion, delegate task, save/reload mid-task, resume without duplicated effects.

## Stage J3 - Registry, Migration and Recovery Tooling

- schema registry;
- migration chain;
- social save partition;
- integrity reports;
- quarantine/fallback handling.

**Exit:** supported legacy fixtures migrate reproducibly.

## Stage J4 - Multiplayer Authority

- client commands;
- filtered read models;
- conversation participation;
- companion control scope;
- reconnect;
- privacy tests.

**Exit:** two-client deterministic social flows pass with no hidden-data replication.

## Stage J5 - LOD and Distant Social Simulation

- relationship/knowledge summaries;
- rumour propagation budgets;
- companion/assignment distance simulation;
- promotion/demotion.

**Exit:** loaded vs distant scenario outcomes remain compatible.

## Stage J6 - 28H/28I Integration

- deterministic content providers;
- optional runtime-provider hooks behind feature flags;
- localisation/voice payloads;
- accessibility/social UI read models.

**Exit:** text-only/offline/low-end profile can complete all required social scenarios.

## Stage J7 - Cross-Set 27/29/30 Harness

Use mock/stub interfaces until the sibling sets finalise, then bind to approved interfaces and run:

- wage/contract recruitment;
- injury-limited companion availability;
- route-blocked delegation;
- passenger seating;
- economic assignment;
- carry/cargo composition.

**Exit:** no Set 28 code calculates sibling-system gameplay truth.

## Stage J8 - Production Hardening

- soak tests;
- save corruption/recovery;
- mod/content-pack validation;
- fuzz/adversarial tests;
- performance profiling;
- final interface reconciliation.

# 64. Acceptance Criteria and Definition of Done

Document Set 28 integration is production-ready when all of the following are true.

## 64.1 Ownership

- Every mutable social field has one documented owner.
- No Set 28 component defines economy, survival or movement formulas.
- External systems consume Set 28 through documented read/command interfaces.

## 64.2 Authority

- Consequential UI actions use commands.
- Server/host is authoritative in multiplayer.
- Duplicate/stale commands cannot create duplicate consequences.
- Runtime generated text cannot mutate gameplay.

## 64.3 Persistence

- Relationships, knowledge, companion agreements and active assignments survive save/load.
- Consequential interrupted sessions resume or invalidate safely.
- Social save partition validates and migrates.
- Missing/corrupt critical references fail visibly.

## 64.4 Multiplayer

- Personal relationships remain distinct per player.
- Shared conversation decision policy is explicit.
- Private knowledge does not leak to unrelated clients.
- Companion command authority survives disconnect/reconnect correctly.

## 64.5 LOD

- Distant simulation does not invent detailed conversations.
- Promotion/demotion preserves social truth.
- Assignment off-screen resolution requires real domain evidence.
- Bounded catch-up does not stall the world.

## 64.6 Registries and Content

- All critical IDs resolve.
- No illegal namespace override exists.
- Required localisation/fallback content is present.
- Persisted semantic definition changes have migrations.

## 64.7 Accessibility/Presentation

- Text-only social gameplay is complete.
- Local product-language settings do not change in-world language truth.
- Client presentation cannot expose hidden relationship/knowledge data.

## 64.8 Testing

- Deterministic scenario harnesses pass.
- migration fixtures pass;
- reconnect/idempotency tests pass;
- privacy/adversarial tests pass;
- LOD equivalence tests pass within defined tolerances.

# 65. Open Questions Assigned to Later Production

The following decisions remain intentionally open because they require sibling-set completion, profiling, content production or platform testing:

1. Final maximum number of simultaneously active field companions per player/party.
2. Final bandwidth/relevance thresholds for large dedicated servers.
3. Exact social save partition file format and compression scheme.
4. Final relationship/provenance compaction thresholds.
5. Exact timeout windows for abandoned multiplayer conversations.
6. Which shared-decision policies are exposed as world/server settings.
7. Final scope of public social-system modding.
8. Whether optional runtime AI dialogue ships in any release profile.
9. Whether cloud/local speech-to-text becomes a supported player input.
10. Final telemetry policy for social-system diagnostics.
11. Final cross-set function names after Sets 27, 29 and 30 complete their own interface review.
12. Whether long-running dedicated worlds require background social archival/retention policies beyond normal saves.
13. Final companion authority transfer UX in multiplayer.
14. Final thresholds for materialising NPC-to-NPC relationship edges.
15. Whether formal diplomacy uses party votes by default or only role/mandate authority.

# 66. Cross-Set Interface Amendments

The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 remains the governing ownership contract.**

28J does not transfer ownership between document sets.

## 66.1 Set 28 Final Amendment Package for Integration Review

The interface proposals consolidated in Section 61 are the final Set 28 requested package for the future four-set reconciliation pass.

They are grouped as:

- **Set 27 -> Set 28:** compensation, contracts, trade opportunity, economic standing, companion contract status, delegated economic result and localisation-safe economic terms;
- **Set 29 -> Set 28:** recovery, bounded survival-social context, assignment survival availability, disclosure-safe condition summaries and existing carry penalty;
- **Set 30 -> Set 28:** travel state, seating, formation resolution, assignment travel updates, presentation-safe travel summaries and existing transport/traversal queries;
- **Set 28 -> siblings:** relationship/social modifiers, companion agreement/permissions/availability, travel/passenger/formation intents, assignment travel/economic mandates and assignment status.

## 66.2 No New Joint Gameplay Owner

28J specifically recommends that cross-domain composition such as assignment carrying feasibility **not become a new independent gameplay owner**. Integration code may compose read-only outputs from the owning systems but may not invent a third formula.

## 66.3 Signature Flexibility

Exact method names in the design documents are conceptual. The final integration pass may rename or consolidate them if:

- semantic meaning is preserved;
- ownership remains unchanged;
- consumer needs remain satisfied;
- data remains typed and versionable;
- the change is recorded in the final interface register.

> **Amendment Status**  
> Set 28 side complete and ready for final cross-set reconciliation. No ownership transfer approved or implied.

# Appendix A. Social Definition and Runtime Record Master Catalogue

| Family | Representative Records/Definitions | Owner | Persistence |
| --- | --- | --- | --- |
| Social foundation | `SocialPersonalityDefinition`, social scopes/reason families | 28A | Definitions only. |
| Dialogue | intents, topics, templates, `ConversationSessionState` | 28B | Sessions conditional. |
| Knowledge | proposition/disclosure definitions, `BeliefRecord`, `RumourRecord` | 28C | Selected mutable state. |
| Relationship | dimensions, milestones, `RelationshipRecord`, impact/memory records | 28D | Yes/compacted. |
| Social resolution | action definitions, negotiation profiles, result/session records | 28E | Consequential state. |
| Companions | class/role/permission definitions, agreement/status records | 28F | Yes. |
| Delegation | assignment definitions, instances, checkpoints/reports | 28G | Active/consequential. |
| Dialogue governance | content/style/provider/validation definitions, provenance | 28H | Definitions + selected audit. |
| Presentation | presentation/voice/localisation definitions and derived payloads | 28I | Definitions; payloads no. |
| Integration | schema/migration/replication/validation metadata | 28J | Technical state where needed. |

# Appendix B. Command, Event and Read-Model Contract Templates

## B.1 Command Envelope

```yaml
social_command:
  command_id: 01J...
  command_type: social.command.commit_dialogue_choice
  issuing_player_or_actor: player:...
  target_id: social_session:...
  semantic_action_id: social.intent.accept_request
  expected_revision: 14
  mandate_or_authority_ref: optional
  idempotency_key: optional
  parameters: {}
```

## B.2 Commit Event Envelope

```yaml
social_event:
  event_id: 01J...
  event_type: social.event.dialogue_choice_committed
  owner: social.conversation
  world_time: ...
  subject_ids: []
  cause_command_id: 01J...
  revision_after: 15
  evidence_refs: []
  external_commit_refs: []
```

## B.3 Read Model Envelope

```yaml
social_read_model:
  view_type: relationship_view
  viewer_id: player:...
  subject_id: npc:...
  revision: 23
  disclosure_scope: viewer_knowledge_filtered
  payload:
    trust_band: trusted
    affection_band: likes
    visible_milestones: [friend]
    recent_visible_reasons: []
```

# Appendix C. Social Save Partition Template

```yaml
social_partition:
  schema_version: 4
  world_id: world:...
  content_revision: content:...
  subsystem_versions:
    conversation: 2
    knowledge: 3
    relationship: 3
    social_resolution: 2
    companion: 2
    delegation: 2
  conversations: []
  beliefs: []
  rumours: []
  relationships: []
  social_memory_interpretations: []
  social_reputation_summaries: []
  negotiations: []
  diplomacy_sessions: []
  companion_agreements: []
  companion_status: []
  assignments: []
  compact_history: []
  migration_history: []
  integrity:
    checksum: "..."
    last_committed_journal_id: "..."
```

# Appendix D. Multiplayer Replication Matrix

| Data | Server | Participant Client | Observer Client | Unrelated Client |
| --- | --- | --- | --- | --- |
| Active conversation semantic state | Full | Filtered required | Public/observer subset | None |
| Available choices | Full | Authorised choices | Usually none | None |
| NPC private beliefs | Full | Only disclosed/derived | None unless public | None |
| Personal relationship raw values | Full | Normally banded/filtered | None | None |
| Public social reputation | Full | Relevant summary | Relevant summary | On-demand/relevance only |
| Companion agreement | Full | Authorised summary | Public membership where visible | Minimal/none |
| Assignment details | Full | Issuer/authorised party | Public activity if observable | None |
| Generated text candidate | Optional server/provider | Final approved line only | Public spoken line | Only if in hearing/relevance range |
| Presentation settings | No need | Local only | Local only | Local only |

# Appendix E. Validation and Reason-Code Catalogue

| Code | Severity | Meaning |
| --- | --- | --- |
| SOC-INT-001 | Blocker | Mutable social field has multiple authoritative owners. |
| SOC-INT-002 | Error | Runtime record references missing persistent person ID. |
| SOC-INT-003 | Error | Consequential command lacks authority or expected revision. |
| SOC-INT-004 | Warning/Error | Stale read model used for consequential command. |
| SOC-INT-005 | Blocker | Generated/presentation content attempted direct gameplay mutation. |
| SOC-INT-006 | Error | Relationship event applied duplicate cause ID. |
| SOC-INT-007 | Error | Companion agreement duplicates exclusive active membership. |
| SOC-INT-008 | Error | Assignment marked complete without required domain evidence. |
| SOC-INT-009 | Blocker | Client received social field outside disclosure scope. |
| SOC-INT-010 | Error | Diplomacy commit lacks valid mandate/ratification authority. |
| SOC-INT-011 | Error | Social save record has unsupported schema version. |
| SOC-INT-012 | Blocker | Required migration path missing for persisted semantic change. |
| SOC-INT-013 | Error | Social record stores invalid direct scene/node identity as canonical reference. |
| SOC-INT-014 | Error | Save/load changed authoritative social value unexpectedly. |
| SOC-INT-015 | Error | LOD promotion cannot reconcile summary with persistent record. |
| SOC-INT-016 | Warning | Social history/provenance exceeds compaction budget. |
| SOC-INT-017 | Error | Cross-set adapter writes data owned by sibling set. |
| SOC-INT-018 | Error | Duplicate network request caused multiple committed side effects. |
| SOC-INT-019 | Warning | Missing optional voice/generated content fell back deterministically. |
| SOC-INT-020 | Blocker | Text-only/offline profile cannot complete consequential social flow. |
| SOC-INT-021 | Error | Product-language setting altered in-world comprehension state. |
| SOC-INT-022 | Error | Private relationship/knowledge data included in unrestricted debug/log payload. |
| SOC-INT-023 | Error | Invalid cross-set interface signature/semantic version. |
| SOC-INT-024 | Warning | Deprecated definition still used by new content. |
| SOC-INT-025 | Blocker | Critical social partition integrity failure cannot be recovered safely. |

# Appendix F. Cross-Set Interface Reconciliation Table

| Interface Need | Owner | Consumer | Set 28 Status |
| --- | --- | --- | --- |
| Wage/compensation terms | Set 27 | 28E/28F | Requested; pending final reconciliation. |
| Contract summary + negotiation bounds | Set 27 | 28B/28E/28F | Requested; pending. |
| Trade opportunities | Set 27 | 28B/28C | Requested; pending. |
| Economic standing | Set 27 | 28A/28E | Requested; pending. |
| Companion contract status | Set 27 | 28F | Requested; pending. |
| Assignment economic result | Set 27 | 28G | Requested; pending. |
| Localisation-ready economic terms | Set 27 | 28I | Requested; pending. |
| Recovery status | Set 29 | 28B/28F/28G | Requested; pending. |
| Bounded survival social modifier | Set 29 | 28D/28E | Requested; pending. |
| Assignment survival availability | Set 29 | 28G | Requested; pending. |
| Localisable condition summary | Set 29 | 28I | Requested; pending. |
| Carry penalty | Set 29 | 28G composition | Existing governing API. |
| Travel state | Set 30 | 28B/28F/28G | Requested; pending. |
| Passenger-seat availability | Set 30 | 28F | Requested; pending. |
| Formation resolution | Set 30 | 28F | Requested; pending. |
| Assignment travel update | Set 30 | 28G | Requested; pending. |
| Travel presentation summary | Set 30 | 28I | Requested; pending. |
| Cargo/travel/route queries | Set 30 | 28G | Existing governing API. |
| Companion agreement | Set 28 | Set 27 | Set 28 ready. |
| Formation/passenger/travel intent | Set 28 | Set 30 | Set 28 ready. |
| Companion action permission/availability | Set 28 | 28G/external adapters | Set 28 ready. |
| Assignment travel request | Set 28 | Set 30 | Set 28 ready. |
| Assignment economic mandate | Set 28 | Set 27 | Set 28 ready. |
| Assignment status | Set 28 | Sibling/external systems | Set 28 ready. |
| Delegated goal evidence | External owner | Set 28 | Generic event pattern; exact signature pending. |
| Combined carry feasibility | No new owner | 28G | Separate API withdrawn; compose Set 29 + Set 30 reads. |

# Appendix G. Cross-System Responsibility Matrix

| System | Supplies to 28J | 28J Supplies/Coordinates | 28J Must Never Do |
| --- | --- | --- | --- |
| 28A | ownership architecture | integrated runtime contract | redefine ownership. |
| 28B | conversation semantics/state | persistence, multiplayer, revisions | choose dialogue branches. |
| 28C | knowledge/belief state | filtering, compaction, LOD | decide truth owned elsewhere. |
| 28D | relationship state | sparse save/replication/migration | calculate Trust/Affection. |
| 28E | social resolution | authoritative commit scaffolding | resolve persuasion itself. |
| 28F | companion membership/permission | multiplayer control/persistence | decide willingness independently. |
| 28G | assignment state/evidence | adapter integrity/LOD/persistence | simulate external work privately. |
| 28H | content/provenance | provider isolation/registry integration | grant AI mutation authority. |
| 28I | presentation requirements | filtered read models/local-player scope | own voice/localisation rules. |
| Doc 07 | person/world identity | stable social references | duplicate NPC identity. |
| Doc 13 | culture/faction/law/mandates | validated references | set political state. |
| Doc 15 | quest/event authority | social events/evidence | complete quests directly. |
| Set 25 | registry/migration/provenance kernel | social-specific schemas/validators | bypass governance. |
| Set 27 | economy results | social modifiers/mandates | calculate prices/wages. |
| Set 29 | survival state | social availability context | heal/injure/simulate biology. |
| Set 30 | movement/travel results | social/assignment movement intents | path/move actors. |
| UI/Presentation | local input/presentation | knowledge-safe read models | trust client state. |

# Appendix H. Glossary

**Authoritative Social State** - Mutable social truth owned by the server/host world and one specialist Set 28 service.

**Command** - A request to perform a consequential action. It expresses intent and may be rejected.

**Commit Event** - A fact emitted after a validated authoritative mutation succeeds.

**Compaction** - Replacing repetitive low-value detailed history with a bounded summary while preserving current authoritative state and required evidence.

**Cross-Set Adapter** - Typed integration boundary that sends intents or receives facts from another owning document set without duplicating its logic.

**Disclosure-Safe Read Model** - A view containing only information the requesting player/system is permitted to know.

**Domain Adapter** - 28G integration contract through which the gameplay system that owns real work performs a delegated action.

**Idempotency Key** - Stable operation identity used to ensure retries/replays cannot commit the same consequential effect twice.

**Implicit Neutral Relationship** - Absence of a materialised relationship edge when no meaningful persistent relationship needs to be stored.

**Migration** - Versioned deterministic transformation of persisted records from an older supported schema/meaning into the current one.

**Optimistic Concurrency** - Allowing the world to continue while a social UI is open, then validating the expected revision before commit.

**Promotion/Demotion** - Transition between detailed and abstract simulation representations while preserving authoritative identity and state.

**Qualified ID** - Stable namespaced content identifier governed by Set 25.

**Read Model** - Purpose-built read-only projection of authoritative state for UI or another consumer.

**Revision Token** - Monotonic/session state identifier used to detect stale commands or views.

**Social Integration Coordinator** - 28J orchestration layer for routing, persistence, migration, validation and replication; not an owner of specialist gameplay formulas.

**Social Partition** - Logical world-save module containing Set 28 mutable records and subsystem versions.

**World-Scoped Service** - Runtime service attached to one loaded authoritative world context rather than a global process-wide mutable singleton.

# Final Cross-Set Reconciliation Addendum - v0.2

**Governing contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.1 - Final Reconciled Contract.

The requested interface package in original Section 61 is now adopted semantically and consolidated into the canonical contracts below. Exact older conceptual method names remain documentation aliases.

## Final Set 28 Contract Mapping

- Economic terms and social commercial resolution use **XSET-002**.
- Biological recovery/care/assignment availability use **XSET-005**.
- Companion travel permission, ride/passenger assignment, formation intent/resolution, rendezvous/return-home and delegated travel use **XSET-006**.
- Actor route knowledge, rumours, provenance and confidence use **XSET-007**; Set 30 retains objective route truth.
- Off-screen/presence/evidence uses **XSET-001** and **XSET-010**.

## Formation Ownership Freeze

Set 28 owns `FormationIntent`: who participates, preferred formation style, role ordering, willingness, spacing preference and regroup policy. Set 30 owns `FormationSpatialPlan`: physically valid slots, compression, corridor fit, separated/blocked members and movement execution.

## Passenger and Travel Ownership Freeze

Set 28 owns social permission and assignment. Set 30 owns seat availability, boarding/attachment, pathing, route execution and arrival evidence.

## Assignment Carrying

The proposed `AssignmentCarryFeasibility()` remains withdrawn as a new gameplay owner. Set 28 composes Set 29 biological carrying output with Set 30 physical capacity/traversal output.

## Final Status

There is no unresolved Set 28 ownership conflict with Sets 27, 29 or 30.


---

---

**End of Document 28J - Multiplayer, Persistence, Registries, Validation and Cross-System Integration - Version 0.1**
