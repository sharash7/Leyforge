# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28C - Knowledge, Rumours, Truth, Lies, Languages and Information Spread

**Dialogue, Social Interaction, Relationships, Companions and Delegation**

**Version 0.1 - Social Knowledge and Information Foundation Draft**

A canonical, data-driven system for individual knowledge, beliefs, uncertainty, evidence, provenance, rumours, testimony, secrets, deception, misinformation, corrections, language competence, translation and bounded information spread across persistent people, settlements, factions, quests and multiplayer without creating omniscient NPCs or allowing dialogue text to become world truth.

**Project Lead and Final Authority:** Ash

> **Knowledge and Information Statement**  
> Leyforge must distinguish what is true in the world from what a person has perceived, been told, inferred, misunderstood, concealed or chosen to claim. NPCs should not know facts merely because the game knows them, rumours should travel through plausible people and channels, lies should remain claims rather than retroactively rewriting reality, and language should meaningfully shape communication without becoming tedious. The system must preserve uncertainty, source history and local perspective while staying bounded enough for a very large living voxel world.

| Field | Locked Direction |
| --- | --- |
| Document Set | Document Set 28 - Dialogue, Social Interaction, Relationships, Companions and Delegation. |
| Document Role | 28C is the detailed authority for social knowledge state, belief state, claims, evidence/provenance, rumours, testimony, deception representation, individual language competence, comprehension, translation and information propagation. |
| Governing Contract | The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0**, Document 28A and Document 28B are governing contracts. 28C consumes external facts and never takes ownership of economy, survival, movement, quest, combat, law or political world state. |
| Truth Boundary | Objective truth remains owned by the gameplay system that owns the underlying fact. 28C stores semantic references to those facts, claims about them and each person's belief state. It never becomes a second world-state database. |
| Dialogue Boundary | 28B owns conversation sessions, turns, topics, choices and committed utterances. 28C determines what a speaker can know or claim, what a listener can comprehend and what information-transfer consequences follow a committed utterance. |
| Relationship Boundary | 28D owns relationship dimensions and long-term interpersonal relationship effects. 28C may consume trust, familiarity and relationship context as inputs to source credibility, disclosure and information sharing. |
| Social-Check Boundary | 28E owns persuasion, intimidation, negotiation, etiquette and deliberate deception resolution. 28C represents the claim, the speaker's belief/deception intent and the listener's resulting informational state after the resolved social attempt. |
| Culture/Language Boundary | Document 13 owns language identities, dialect/culture definitions and political/cultural world state. 28C owns individual language competency, comprehension and translation state against those definitions. |
| Quest/Event Boundary | Document 15 owns quest/event truth, lifecycle and consequences. 28C can store discovered clues, rumours and beliefs about those facts and can expose knowledge conditions to quests without advancing quest state itself. |
| Witness/Law Boundary | Perception/combat/world systems establish what was physically observable. 28C owns witness knowledge, identity confidence, statements and testimony provenance. Justice/governance systems alone determine guilt, legal weight, verdict and sentence. |
| Information Philosophy | No omniscient NPC blackboard and no instantaneous global gossip. Information moves through observation, conversation, documents, institutions, companions, messengers, magical interfaces and bounded distant summaries. |
| Language Philosophy | In-world language and real-world localisation are separate. Difficulty comes from partial comprehension, context, dialect and translation, not from requiring the player to decode invented grammar manually. |
| Simulation Direction | Important named-person knowledge is persisted individually. Low-salience information may be compressed into settlement/faction prevalence summaries at distance and reconstructed under deterministic promotion rules. |
| Multiplayer Direction | Information state is authoritative and scoped. One player's discovery does not automatically reveal the same fact to every player unless a party/world sharing rule or actual information transfer does so. |
| Engine Direction | Gameplay design is engine-neutral but aligned to Godot/Summer Engine: stable IDs, immutable definitions, mutable records, authoritative commands/events, bounded processing and deterministic save/migration behaviour. |
| Production Direction | The Forest Hamlet can remain a regression fixture, but production knowledge systems must work with arbitrary seed-generated NPCs, cultures, settlements, rumours, histories, languages and faction relationships. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Social Knowledge and Information Foundation Draft | Establishes truth/belief separation, knowledge records, evidence and provenance, rumours and distortion, deception representation, witness testimony, language competence, translation, information propagation, LOD, multiplayer authority, registries, validation and cross-set ownership. |

# Document Purpose

Document 28C defines how information exists socially in Leyforge. The simulation already knows authoritative facts such as who owns a building, whether a bridge is damaged, what a merchant currently charges, whether a raid occurred, which faction controls a road, whether an NPC is injured and which quest stage is active. A believable social world cannot simply expose those facts to every person. Each persistent person needs a bounded viewpoint shaped by what they have observed, been told, read, inferred, forgotten, doubted, hidden or misunderstood.

28C therefore introduces an explicit separation between **world truth**, **semantic propositions**, **claims**, **beliefs**, **evidence**, **rumours** and **presentation text**. A villager may truthfully report a wolf attack they witnessed, repeat an inaccurate rumour about its location, deliberately lie about who caused it or simply be uncertain. None of those statements changes what actually happened. Conversely, an authoritative fact changing in another system does not magically update every character who once believed an older version.

The document also establishes the in-world language layer. Document 13 defines that cultures, peoples and factions can have languages and linguistic identities. 28C defines how an individual understands, speaks, reads, writes or interprets those languages and how partial comprehension affects information transfer. Real-world localisation remains a presentation concern and must never be confused with whether the character understands the language being spoken.

The purpose is not to build a human cognition simulator. The goal is a **readable, inspectable and bounded social information model** that creates useful gameplay: rumours can lead to discoveries, misinformation can cause mistakes, witnesses can matter, secrets can be protected or leaked, interpreters can become valuable, settlements can learn about threats, factions can spread propaganda and companions can return with reports - all while preserving authoritative ownership and large-world performance.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28C | 28C Relationship |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living NPC civilisations, named individuals, consequences, cultural variety, emergent stories and player freedom. | Makes knowledge local to persistent people and allows information to create social consequences without creating an omniscient world narrator. |
| 01 - Core Gameplay Loop | Players interact, explore, discover, trade, negotiate and follow environmental/social clues. | Information becomes a gameplay resource that helps the player choose goals and understand world change. |
| 02 - Player Progression | Knowledge/research and Diplomacy/Reputation are progression channels; no class lock. | 28C can expose discovery and language-competence milestones while progression rewards remain owned by Document 02. |
| 07 - NPC Village System | Persistent people have identity, memories, schedules, households and world consequences. | 07 supplies person identity and opportunities for social contact. 28C owns informational belief/knowledge records associated with those people. |
| 13 - Races, Peoples, Cultures and Factions | Languages are separate identity records; diplomacy uses gradual information flow, faction memory, disguises and technology spread. | 13 remains language/culture/faction-definition authority. 28C owns individual comprehension and the runtime flow of information through those structures. |
| 15 - Quest and Event System | Quests may be discovered through rumours, letters, clues, messengers, dreams, world events and observation; generated quests must bind valid world facts. | 28C supplies knowledge, rumour, clue and provenance state. Document 15 remains quest/event authority. |
| 16 - Combat, Gear and Defence | Crime, surrender, capture, injury, death, stealth and aftermath can create witnesses and persistent consequences. | 28C records what an observer perceived and later claims. Combat/stealth decides physical observability and encounter outcomes. |
| 17 - UI/UX System | Knowledge-aware presentation, spoiler protection, dialogue, maps, reputation, crime and accessible feedback are required. | 28C supplies knowledge/confidence/provenance view models and reason codes; UI owns presentation. |
| 18 current Godot/Summer direction | Stable IDs, definitions/runtime separation, authority, event-driven systems, bounded LOD, saves and validation. | Shapes proposition IDs, belief records, transfer events, distant summaries and deterministic diagnostics. |
| 19-20 | Settlements contain real public spaces, governance facilities, archives, markets, notice points and communication-relevant structures. | These can provide physical information channels when their owning systems report valid operational context. 28C does not create building service capacity from appearance. |
| 22-23 | Entity presentation, gestures, voice/audio and spatial anchors are presentation layers. | 28C exposes semantic comprehension/communication events without owning lipsync, voice or visual execution. |
| 24 | Seed-generated cultures, histories, factions and events provide varied facts and perspectives. | 28C must work from arbitrary canonical IDs and history packages rather than fixed POC lore. |
| 25 | Canonical IDs, field ownership, typed relationships, provenance, validation, content packs and migration. | All knowledge definitions and records follow the canonical registry kernel. |
| 26 | Maritime crews, ports, charts, navigation reports, piracy and naval diplomacy create specialised information channels. | Maritime systems provide facts; 28C provides general knowledge/rumour/language mechanics without redefining maritime gameplay. |
| 28A | Set ownership, social architecture, Social API and cross-set interface contract. | Governing parent document. |
| 28B | Conversation session lifecycle, intents, utterances and authoritative commit. | 28B delivers committed speech acts; 28C resolves informational eligibility, comprehension and transfer. |

# Static Table of Contents

1. Locked Knowledge and Information Identity  
2. Ownership Boundaries and Anti-Duplication Rules  
3. Locked Decision Summary  
4. Knowledge and Information Architecture  
5. World Fact, Proposition, Claim, Belief, Evidence and Rumour Separation  
6. Proposition Model and Truth Authority  
7. Individual Knowledge State  
8. Belief, Confidence, Uncertainty and Contradiction  
9. Evidence, Source Credibility and Provenance  
10. Observation, Perception and Witness Knowledge  
11. Claims, Statements and Testimony  
12. Rumours and Hearsay  
13. Rumour Mutation, Distortion and Compression  
14. Information Transfer Through Conversation  
15. Secrets, Privacy, Classification and Disclosure  
16. Deception, Lies, Bluffing, Omission and Misdirection  
17. Correction, Retraction, Dispute and Supersession  
18. Information Spread and Social Network Channels  
19. Settlement, Household and Community Information Flow  
20. Faction, Government, Guild, Religious and Criminal Channels  
21. Documents, Letters, Books, Signs, Maps and Records  
22. Language Definition Boundary and Language Identity  
23. Individual Language Competency  
24. Dialects, Registers, Jargon, Codes and Archaic Forms  
25. Comprehension Resolution and Meaning Fidelity  
26. Interpreters, Translation and Mediation  
27. Reading, Writing and Written Translation  
28. Magic, Telepathy, Divination and Extraordinary Information Interfaces  
29. Quest, Event, Exploration and World-Knowledge Integration  
30. Economy, Markets and Trade-Information Integration  
31. Crime, Witness, Law and Investigation Integration  
32. Personality, Relationship and Social-Reputation Hooks  
33. Companion, Recruitment and Delegation Information Hooks  
34. UI, Localisation, Accessibility and Spoiler Protection  
35. Multiplayer Information Scope and Authority  
36. Persistence, Save/Load and Simulation LOD  
37. Registries, Naming and Data Templates  
38. Diagnostics, Validation and Automated Test Strategy  
39. Production Scope and Staged Delivery  
40. 28C Acceptance Criteria  
41. Open Questions Assigned to Later Documents  
42. Cross-Set Interface Amendments  
Appendix A. Knowledge Definition and Runtime Record Catalogue  
Appendix B. BeliefState and InformationTransfer Templates  
Appendix C. Information Source and Evidence Families  
Appendix D. Bounded Information-Transfer Algorithm  
Appendix E. Knowledge and Language Reason-Code Families  
Appendix F. Example Information Flows  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. Glossary

# 1. Locked Knowledge and Information Identity

The Knowledge and Information System is Leyforge's **perspective layer**. It sits between authoritative world facts and the social actions of persistent people. It answers not simply "what happened?" but "who could know that, what do they think happened, how certain are they, where did that belief come from and what are they willing or able to communicate?"

> **Locked Rule**  
> The game may know an authoritative fact without every character knowing it. A character may believe or claim something without that thing becoming true. Presentation text never creates knowledge merely by appearing on screen; knowledge changes only through authoritative observation, transfer, discovery, inference or explicit system-owned update.

## 1.1 Design Promise

A player should be able to encounter situations such as:

- two NPCs giving different accounts of the same event;
- a guard knowing a road is unsafe because a scout returned, while a distant farmer has not heard yet;
- a merchant sincerely repeating an outdated price rumour even though the market has changed;
- a witness being confident a hooded figure committed a crime but uncertain of identity;
- a companion returning from a delegated task with only the facts they actually discovered;
- a faction spreading propaganda that many citizens believe without the game labelling it as "true" to them;
- a bilingual interpreter enabling negotiations between groups that cannot otherwise communicate;
- an old map being useful but stale;
- a player correcting a false rumour and seeing that correction spread gradually;
- a secret leaking because one trusted recipient chose to tell someone else.

## 1.2 What 28C Is Not

28C is not:

- the authoritative owner of the world facts being discussed;
- a universal database that duplicates every gameplay system;
- a freeform text generator allowed to invent facts;
- a psychological simulation of every thought a person has;
- a memory-of-every-line transcript archive;
- the relationship scoring model;
- the persuasion/deception success formula;
- a legal court verdict system;
- the quest progression owner;
- the faction political-state owner;
- a replacement for real-world localisation;
- a requirement to simulate gossip between every pair of NPCs every minute;
- permission to reveal hidden truth to the player through developer-style confidence labels.

## 1.3 Information Is Gameplay, Not Only Lore

Knowledge has practical consequences. It can affect:

- which dialogue topics are available;
- which locations appear on a map;
- whether an NPC can warn others about danger;
- whether a quest or investigation can be discovered;
- whether a merchant knows of a trade opportunity;
- whether a settlement can prepare for a threat;
- whether a guard can identify a suspect;
- whether a diplomat understands another faction's demand;
- whether a companion can report completion or failure;
- whether the player can use a secret as leverage;
- whether misinformation creates a believable mistake.

The system should create these consequences without requiring constant manual information management.

# 2. Ownership Boundaries and Anti-Duplication Rules

## 2.1 28C Owns

28C owns the detailed design of:

- semantic propositions used as social-information references;
- individual informational knowledge records;
- belief stance and confidence;
- evidence references and information provenance;
- claims and statements;
- rumour records and rumour transmission state;
- information freshness and staleness;
- contradiction and correction handling;
- secrets and disclosure classification at the information layer;
- deception representation: whether a speaker believes, doubts or knowingly contradicts a claim;
- witness informational records and testimony content/provenance;
- information-transfer outcomes after valid communication;
- individual language competency and comprehension state;
- interpreter/translation information fidelity;
- bounded information propagation and distant summaries;
- information-specific reason codes, diagnostics and registries.

## 2.2 28C Consumes but Does Not Own

| Concern | Owner | 28C Use |
| --- | --- | --- |
| Underlying objective fact | Owning gameplay system | Resolves proposition truth/revision when that truth is queryable. |
| NPC identity, schedule, current task, household | Document 07 | Identifies knower/speaker/listener and possible information-contact opportunities. |
| Culture, language definitions, faction, law, territory | Document 13 | Supplies language/cultural/political definitions and context. |
| Conversation session and utterance commit | 28B | Provides committed information-bearing speech event. |
| Relationship trust/familiarity | 28D | Influences disclosure and source credibility; 28C never changes relationship values directly. |
| Persuasion/deception/negotiation check | 28E | Supplies resolved social influence outcome where deliberate convincing is attempted. |
| Companion/recruitment/delegation state | 28F/28G | Supplies who can report, receive orders or hold companion-specific information. |
| Quest/event truth and progression | Document 15 | Knowledge may reveal or describe state but never advance it. |
| Combat/stealth/perception outcome | Document 16 and AI/perception owners | Determines whether an event was actually perceived and at what fidelity. |
| Prices, stock, wages, market state | Set 27 | Becomes economic propositions/claims without duplication. |
| Injury, illness, fatigue | Set 29 | Can be observed/reported as facts; survival truth remains external. |
| Movement, location accessibility, journey state | Set 30 | Can become observed/reported facts; movement truth remains external. |
| UI, captions, map visualisation, accessibility | Document 17/28I | Renders knowledge state without inventing or leaking facts. |
| AI/procedural dialogue policy | 28H | Providers receive bounded fact/knowledge packets from 28C. |
| Network/persistence implementation details | 28J/current technical plan | Implements the authority and record contracts. |

## 2.3 No Duplicate Truth Store

28C must not copy complete authoritative records such as:

- `market.price.current`;
- `npc.health.current`;
- `quest.stage.current`;
- `faction.territory.owner`;
- `vehicle.position`;
- `structure.condition`.

Instead, a belief or claim stores a **semantic proposition reference** and the version/time/context of what was observed or communicated. The owning system remains the only authority for current reality.

## 2.4 Historical Observations Are Allowed

A person may persist an observation of a fact that is no longer current. For example:

> "Yesterday the bridge was intact."

This is not a duplicate current bridge state. It is a historical informational record with a timestamp and provenance.

# 3. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Core Model | Separate world fact, proposition, claim, belief, evidence, rumour and presentation text. |
| Omniscience | NPCs do not automatically know authoritative world state, quest state, prices, crimes, identities or player actions. |
| Proposition Format | Use semantic proposition keys/instances referencing stable IDs and typed predicates rather than storing prose as knowledge truth. |
| Truth | Objective truth is resolved from the owning system when available. Some propositions are subjective, predictive, disputed or inherently unresolved and therefore have no single binary truth value. |
| Belief | Each actor may hold a stance and confidence independently of truth. Lack of knowledge is distinct from disbelief. |
| Confidence | Use bounded internal confidence plus readable qualitative bands; never expose hidden objective truth merely because confidence is high. |
| Provenance | Important knowledge tracks where it came from. Provenance is compressed but not discarded for consequential information. |
| Observation | Physical/perception systems establish whether something was observed. 28C converts valid observation evidence into knowledge/belief records. |
| Witnesses | Witness records store event, perceived identity, confidence, vantage/provenance and later statements. Justice remains external. |
| Claims | A spoken/written claim can be true, false, uncertain, mistaken, speculative or deceptive from the speaker's perspective. |
| Rumours | A rumour is a socially transmissible claim package, not a truth category. Rumours can be correct, stale, distorted, false or mixed. |
| Distortion | Rumours mutate through bounded semantic transformations such as detail loss, exaggeration, location blur, attribution uncertainty and certainty drift - never arbitrary hallucinated prose. |
| Deception | 28C records speaker belief and deception intent. 28E resolves deliberate convincing where a social check is required. |
| Secrets | Information can have disclosure policies, owners and sensitivity tags. Knowing a secret does not automatically grant permission or willingness to share it. |
| Correction | New evidence can create contradiction, doubt, correction or supersession. Corrections spread like information rather than instantly erasing old beliefs globally. |
| Spread | Information moves through actual or abstracted social contact, public channels, documents, messengers, faction networks and magical interfaces. |
| LOD | Nearby transfer can be individual; distant propagation uses bounded summaries for low-salience facts while preserving important named-person beliefs. |
| Language Ownership | Document 13 owns language/dialect definitions. 28C owns individual competence and runtime comprehension. |
| Language Skills | Track relevant modalities separately: understand spoken/signed, speak/sign, read and write where the language supports them. |
| Proficiency | Use readable bands with optional numeric internal competence. Topic jargon and dialect familiarity can modify effective comprehension. |
| Translation | Interpreters bridge languages using their own competence and information fidelity. Translation is not guaranteed perfect. |
| Localisation | Player UI language is independent from in-world language. Accessibility can describe unintelligible speech without revealing hidden semantic content. |
| Player Knowledge | The player character can use the same knowledge model. UI may reveal discovered facts/rumours while protecting spoilers and uncertainty. |
| Multiplayer | Knowledge can be personal, party-shared by rule, settlement/faction-known or world-public. Discovery is not automatically global. |
| Performance | No all-to-all gossip simulation. Candidate information is filtered by relevance, salience, secrecy, recency and bounded budgets. |
| Production | Important facts, secrets, threats, investigations, culture/language hooks and rumours receive full provenance. Routine chatter can use lightweight informational categories. |

# 4. Knowledge and Information Architecture

The system uses five conceptual layers.

| Layer | Purpose | Examples |
| --- | --- | --- |
| Authoritative Fact Layer | Current or historical facts owned outside 28C. | bridge damaged, market price, NPC injured, treaty active, camp discovered. |
| Semantic Information Layer | Stable proposition/claim structure used to refer to facts. | `bridge X is damaged`, `camp Y lies north of settlement Z`. |
| Actor Perspective Layer | What a person knows, believes, doubts, remembers informationally or refuses to disclose. | builder believes bridge unsafe with high confidence. |
| Propagation Layer | Transfers, rumours, documents, public channels, messengers and corrections. | scout tells captain; captain announces warning; rumour spreads. |
| Presentation Layer | Dialogue lines, subtitles, maps, codex entries, journal text, voice and UI summaries. | "The north bridge collapsed last night." |

## 4.1 Core Runtime Flow

```text
Authoritative world event/fact
  -> eligible observation/source evidence
  -> semantic proposition
  -> actor knowledge/belief update
  -> possible disclosure/claim
  -> 28B committed utterance or other channel
  -> language/comprehension resolution
  -> information-transfer result
  -> listener belief/provenance update
  -> optional rumour/public propagation
  -> later correction or stale-state handling
```

## 4.2 Information Does Not Have to Be Binary

Not every proposition is "true/false" in a useful sense. Supported truth classes include:

- objective current fact;
- objective historical fact;
- quantity/range estimate;
- prediction;
- hypothesis;
- subjective evaluation;
- belief/value statement;
- disputed claim;
- unknown/unresolved fact;
- intentionally fictional or hypothetical content.

A cultural statement such as "This shrine is sacred" may be a real belief/cultural rule without being treated as a scientifically binary world fact. A forecast such as "The caravan will arrive tomorrow" may be reasonable but uncertain.

# 5. World Fact, Proposition, Claim, Belief, Evidence and Rumour Separation

## 5.1 World Fact

A **World Fact** is authoritative state owned by another system or a committed historical event.

Examples:

- the gate is open;
- the merchant currently has five iron ingots;
- the guard was injured during the raid;
- the player accepted a contract;
- a faction currently controls a fort.

28C may query or reference a fact. It does not own it.

## 5.2 Proposition

A **Proposition** is a semantic statement that can be known, believed, claimed or discussed.

Example conceptual key:

```text
proposition:
  predicate: structure.condition
  subject: structure_instance:bridge_41
  value: damaged
  temporal_scope: current_at_observation
```

Propositions use IDs and typed parameters. They are not player-facing sentences.

## 5.3 Claim

A **Claim** is an assertion made by a source.

A claim stores:

- proposition reference or structured content;
- speaker/source;
- asserted stance/value;
- assertion time;
- certainty expressed by speaker;
- channel;
- whether speaker believes it;
- whether speaker knows it conflicts with their own evidence;
- provenance parent when repeating another claim.

## 5.4 Belief

A **Belief** is an actor's current informational stance toward a proposition. It may be based on direct evidence, trusted testimony, repeated rumour, institutional authority, inference or deliberate self-deception where content later supports it.

## 5.5 Evidence

**Evidence** is a structured reason a belief or claim may be supported, such as:

- direct observation;
- document;
- physical clue;
- trusted witness;
- official report;
- market reading;
- magical detection result;
- repeated independent sources.

Evidence does not guarantee truth. It supplies provenance and weight.

## 5.6 Rumour

A **Rumour** is a claim package marked as socially transmissible and not necessarily verified. It contains a semantic core plus transmission metadata such as source confidence, novelty, urgency, sensitivity and distortion history.

> **Rumour Rule**  
> "Rumour" means *how information is travelling*, not whether the information is false.

# 6. Proposition Model and Truth Authority

## 6.1 Proposition Key

A proposition should be deterministically identifiable from:

- predicate/type;
- subject stable ID(s);
- optional object/value;
- temporal scope;
- optional location/scope;
- version/revision reference where required.

Dynamic propositions can be generated without pre-authoring one registry row for every possible person and object.

## 6.2 Truth Provider

Where objective truth exists, the proposition family declares its external truth provider.

Examples:

| Proposition Family | Truth Provider |
| --- | --- |
| current market price | Set 27 |
| NPC injury | Set 29/combat as appropriate |
| route accessible | Set 30 |
| quest active | Document 15 |
| faction owns settlement | Document 13/political owner |
| structure damaged | structure/world owner |
| companion assignment complete | 28G |

28C queries rather than caches current truth unless a historical observation requires preserving the prior value.

## 6.3 Revision-Aware Knowledge

Knowledge about volatile facts stores the observed revision/time. This permits believable stale knowledge.

Example:

```text
Merchant A observed wheat price = 8 at market revision 112.
Current market revision = 119; wheat price = 14.
Merchant A still believes 8 until new information arrives.
```

## 6.4 Subjective and Unresolvable Propositions

Subjective propositions do not query an objective truth provider.

Examples:

- "The mayor is a good leader."
- "The old forest is frightening."
- "This price is unfair."

They may still be believed, repeated, contested and socially consequential.

# 7. Individual Knowledge State

An actor's information state should be sparse. The system stores **salient propositions**, not everything the actor has ever sensed.

## 7.1 Knowledge Record

A conceptual knowledge/belief record includes:

- actor ID;
- proposition key;
- awareness state;
- belief stance;
- confidence;
- freshness/time last updated;
- primary provenance summary;
- evidence references where important;
- disclosure classification;
- contradiction flags;
- importance/salience;
- persistence priority;
- information scope tags.

## 7.2 Awareness States

Suggested states:

- **Unaware** - actor has no tracked knowledge of the proposition;
- **Heard Of** - actor recognises topic/entity but lacks useful detail;
- **Partial** - actor knows incomplete or approximate information;
- **Informed** - actor has usable information;
- **Detailed** - actor knows high-detail information appropriate to role/evidence;
- **Specialist** - actor has domain expertise that can interpret technical details.

Awareness is separate from whether the actor believes a claim.

## 7.3 Knowledge Acquisition Sources

Knowledge can enter through:

- direct observation;
- dialogue transfer;
- overhearing;
- reading;
- map/sign inspection;
- official announcement;
- job/profession briefing;
- household sharing;
- faction/guild communication;
- companion report;
- quest/event discovery;
- magical information source;
- inference from known evidence;
- player-authored note or report when supported.

## 7.4 Knowledge Is Bounded by Role

Profession and role can grant baseline knowledge domains, not omniscience.

Examples:

- a blacksmith may know local metal-working recipes and current workshop shortages;
- a guard may know current patrol warnings but not the contents of every warehouse;
- a farmer may know local crop conditions but not distant faction strategy;
- a scholar may understand an ancient script while knowing little about current market prices.

# 8. Belief, Confidence, Uncertainty and Contradiction

## 8.1 Belief Stance

Suggested stance values:

- accepts;
- leans_accept;
- uncertain;
- leans_reject;
- rejects;
- conflicting;
- suspended/no_position.

"Unaware" remains an awareness state rather than a belief stance.

## 8.2 Confidence

Internal confidence may use a bounded deterministic scale, for example 0-1000. Player-facing UI should normally use qualitative descriptions:

- very uncertain;
- uncertain;
- plausible;
- confident;
- very confident.

High confidence does not mean objective truth.

## 8.3 Confidence Inputs

Belief update can consider:

- directness of evidence;
- source credibility;
- relationship trust from 28D;
- number of independent sources;
- recency;
- specialist competence;
- language comprehension fidelity;
- contradiction with prior evidence;
- deliberate persuasion/deception outcome from 28E where applicable;
- cultural/institutional source familiarity;
- whether the actor personally witnessed related evidence.

## 8.4 Contradictory Evidence

Actors may hold unresolved contradiction rather than instantly selecting one version.

Example:

```text
Source A (trusted scout): road is blocked.
Source B (official notice, older): road is open.
Actor state: conflicting; leans toward blocked; high need for verification.
```

This can create investigation dialogue without declaring one source "the liar" automatically.

## 8.5 Belief Inertia

Strong prior beliefs should not flip from one weak rumour. Conversely, overwhelming new evidence should not require dozens of arbitrary repetitions. Use bounded update curves and source independence rather than raw message counts.

# 9. Evidence, Source Credibility and Provenance

## 9.1 Provenance Principle

Important information should be traceable enough to answer:

- where did this actor get the information;
- was it direct or hearsay;
- how old is it;
- how many transformations occurred;
- is the source identifiable;
- can a correction target the same information chain?

## 9.2 Source Classes

Initial source classes include:

- self/direct observation;
- named person;
- anonymous person;
- household;
- settlement institution;
- faction/government office;
- guild/profession;
- religious organisation;
- merchant network;
- criminal network;
- written document;
- sign/map/chart;
- quest/event discovery;
- magical or supernatural interface;
- environmental clue;
- player;
- companion/delegated agent.

## 9.3 Credibility Is Contextual

Credibility is not one universal "honesty" stat. It can depend on:

- relationship trust;
- source role and competence;
- track record on the proposition domain;
- faction relationship;
- known conflicts of interest;
- language clarity;
- whether the source is repeating hearsay;
- whether multiple independent sources agree.

28C consumes personality and relationship context but does not own those values.

## 9.4 Provenance Compression

To prevent unbounded chains, the runtime preserves:

- root/earliest known source where available;
- immediate source;
- hop count;
- last few meaningful transformations;
- aggregate source-diversity count;
- relevant evidence IDs for important facts.

Routine rumours do not need a full lifetime graph of every speaker.

# 10. Observation, Perception and Witness Knowledge

## 10.1 Observation Contract

28C does not decide whether a person could physically see or hear an event. The relevant perception/AI/combat/world system emits an observation result such as:

- observer ID;
- observed event/entity;
- sensory channel;
- distance/occlusion result;
- identity confidence;
- detail fidelity;
- timestamp;
- location;
- disguise/visibility result if externally resolved.

28C converts that into informational evidence.

## 10.2 Witness Record

A witness record can preserve:

- witnessed event ID;
- observer;
- observed actor identity or perceived identity;
- identity confidence;
- action category;
- location/time;
- relevant physical evidence reference;
- emotional/social significance hooks;
- whether testimony has been given;
- testimony recipients;
- later correction/retraction state.

## 10.3 Mistaken Identity

If an observer saw "a tall hooded person with a red cloak" but not the face, the witness record should not silently store the true actor ID as known identity.

It can store:

- actual event actor as hidden provenance owned by event/combat for validation if necessary;
- **perceived identity descriptor** as the witness's knowledge;
- confidence and evidence.

Player-facing dialogue uses perceived knowledge, not developer truth.

## 10.4 Overhearing

Overheard speech can create information transfer when:

- the observer is in valid auditory range;
- language comprehension succeeds;
- the conversation is not private beyond audibility rules;
- the utterance contains transferable semantic claims.

28B owns conversation participants; perception/spatial rules establish overhearing opportunity; 28C resolves comprehension and transfer.

# 11. Claims, Statements and Testimony

## 11.1 Statement Record

A statement is a committed claim through a communication channel. It may be:

- assertion;
- denial;
- question implying information;
- warning;
- report;
- accusation;
- confession;
- testimony;
- promise about expected future action;
- speculation;
- correction/retraction.

Promises and obligations may additionally create 28D/28E/quest/economy records owned elsewhere.

## 11.2 Speaker Perspective

For every meaningful claim, 28C can classify the relation between speaker belief and asserted claim:

- sincerely believed;
- sincerely uncertain;
- repeating hearsay;
- knowingly deceptive;
- bluff/speculation presented as uncertain;
- fiction/joke/hypothetical;
- coerced/externally pressured if 28E/other system reports it.

## 11.3 Testimony

Testimony is a statement with witness/evidence relevance. 28C can provide:

- what the witness says;
- what they actually remember/believe;
- source/provenance;
- confidence;
- contradictions/retractions;
- whether the statement appears knowingly deceptive.

A justice system may consume this information but decides legal admissibility and verdict.

# 12. Rumours and Hearsay

## 12.1 Rumour Definition

A rumour packages one or more claims for social spread.

Suggested fields:

- rumour ID;
- core proposition(s);
- root source/provenance;
- current framing;
- confidence expressed;
- novelty;
- urgency;
- sensitivity/secrecy;
- geographic relevance;
- faction/culture relevance;
- distortion state;
- spread scope;
- decay/staleness rules;
- quest/discovery hooks where externally declared.

## 12.2 Rumour Eligibility

Not every fact becomes gossip. Candidate rumours should normally pass relevance filters such as:

- surprising;
- dangerous;
- personally relevant;
- economically important;
- socially dramatic;
- politically important;
- useful for survival/travel;
- culturally significant;
- secret/forbidden and therefore tempting to leak;
- directly requested by a listener.

## 12.3 Rumour Categories

Initial categories:

- danger warning;
- opportunity;
- market/trade;
- missing person;
- crime/accusation;
- relationship/social;
- political/faction;
- military/raid;
- magical/strange;
- exploration/location;
- resource/discovery;
- prophecy/prediction;
- scandal;
- public announcement distorted into hearsay.

# 13. Rumour Mutation, Distortion and Compression

Rumour mutation must remain semantic and bounded.

## 13.1 Allowed Distortion Families

- **Detail Loss** - exact details become approximate.
- **Quantity Blur** - 12 raiders becomes "about a dozen" or "many".
- **Location Blur** - exact cave becomes "north of the river".
- **Time Blur** - "last night" becomes "recently".
- **Attribution Drift** - known source becomes uncertain or misattributed.
- **Certainty Drift** - "might" becomes "probably" under biased retelling, within limits.
- **Exaggeration/Minimisation** - severity shifts within authored bounds.
- **Causal Simplification** - complex cause becomes one prominent cause.
- **Identity Generalisation** - one known member becomes "someone from that faction" if identity detail is lost.

## 13.2 Forbidden Distortion

The system must not invent unrelated entities, events, resources or locations merely to make gossip colourful.

A mutation provider may only use:

- the current semantic claim;
- allowed transformation rules;
- valid known entities and contextual categories;
- approved authored variants.

## 13.3 Mutation Budget

Each rumour family can define a maximum semantic mutation budget. Important quest-critical information may permit little or no distortion until a discovery objective is satisfied. Low-stakes gossip may allow more ambiguity.

## 13.4 Canonical Clue Protection

Critical clues should be represented by stable semantic kernels even if wording changes. A rumour can obscure confidence or location precision without destroying the clue needed to make content solvable.

# 14. Information Transfer Through Conversation

28B owns the utterance. 28C owns the informational consequences of that utterance.

## 14.1 Transfer Pipeline

```text
28B commits utterance
  -> collect semantic claims attached to utterance
  -> validate speaker knowledge/belief permissions
  -> resolve language/channel comprehension
  -> apply interpreter path if any
  -> determine delivered semantic fidelity
  -> combine source credibility + listener prior state
  -> if deliberate convincing was attempted, consume 28E outcome
  -> update listener belief/provenance
  -> emit InformationTransferred / InformationRejected / InformationPartiallyUnderstood
  -> 28B receives result for branch/presentation
```

## 14.2 A Line Cannot Leak Unknown Facts

A dialogue line bound to proposition `camp.location.briarhook` is eligible only if the speaker's knowledge state supports the intended speech mode:

- knows/believes it and asserts it;
- doubts it and presents it as uncertainty;
- repeats a rumour with provenance;
- intentionally lies about it;
- asks about it without asserting knowledge;
- uses it hypothetically where authored.

## 14.3 Transfer Does Not Mean Belief

A listener can understand a statement yet reject it. Therefore transfer results distinguish:

- heard/decoded;
- understood semantic content;
- accepted into belief;
- stored as hearsay but doubted;
- rejected;
- partially understood;
- misunderstood due to language or distortion.

# 15. Secrets, Privacy, Classification and Disclosure

## 15.1 Secret Is an Information Property

A secret is not automatically a quest flag. It is information whose disclosure is restricted or socially sensitive.

Possible classifications:

- personal/private;
- household;
- professional;
- guild;
- settlement-restricted;
- faction-confidential;
- military;
- sacred/ritual;
- criminal;
- diplomatic;
- quest-sensitive;
- dangerous knowledge;
- public but not yet announced.

## 15.2 Knowing vs Sharing

An actor may know a fact but refuse to disclose it because of:

- loyalty;
- law;
- fear;
- relationship trust;
- professional duty;
- faction orders;
- privacy;
- personal shame;
- risk to another person;
- negotiated confidentiality.

28C owns information classification and can query disclosure context. Exact social pressure/negotiation resolution remains 28E.

## 15.3 Secret Leakage

When a secret is disclosed, the new recipient gains provenance and the leak can become a social event. It does not automatically become public. Further spread follows normal propagation rules.

## 15.4 Player Secrets

The same model can support secrets learned by the player character. UI should avoid exposing hidden metadata such as "This is a faction secret" unless the character has enough context to understand that sensitivity.

# 16. Deception, Lies, Bluffing, Omission and Misdirection

## 16.1 Deception Representation

28C determines whether a proposed claim is consistent with the speaker's own informational state.

A statement can therefore be classified as:

- truthful according to speaker belief;
- mistaken but sincere;
- uncertain/speculative;
- knowingly false;
- selective omission;
- technically true but misleading framing;
- bluff about an unresolved proposition;
- fiction/hypothetical/joke.

## 16.2 Deception Success Boundary

When a speaker deliberately tries to make another person believe a deceptive claim, 28E owns the social resolution. 28C supplies:

- claim structure;
- speaker knowledge;
- deception classification;
- listener prior beliefs;
- evidence contradictions;
- language fidelity;
- source relationship/trust input references.

28E returns an influence result. 28C then updates or preserves the listener's belief state.

## 16.3 Omission

Not mentioning known information is not automatically a lie. Omission only becomes a semantic deception event when an authored/systemic context explicitly treats withholding as meaningful, such as:

- sworn testimony;
- contract disclosure requirement;
- direct question;
- formal report;
- companion mission report expectation.

## 16.4 Detecting Lies

28C does not give players a magical "lie detected" icon by default. A listener may gain reasons to doubt based on:

- contradictory evidence;
- incompatible prior statements;
- source credibility;
- 28E social-reading/perception outcomes if defined later;
- obvious factual impossibility from known state.

The UI communicates uncertainty rather than hidden developer truth.

# 17. Correction, Retraction, Dispute and Supersession

## 17.1 Correction Is New Information

A correction does not erase the old belief globally. It is a new claim/evidence package that can update recipients.

## 17.2 Retraction

A source may retract a prior statement. This creates provenance linking old and new claims. Recipients may:

- accept the correction;
- distrust both statements;
- suspect coercion;
- keep the old belief;
- mark the topic unresolved.

Relationship and persuasion systems can influence this response.

## 17.3 Supersession

Volatile facts such as prices, route conditions and injuries naturally supersede older observations. The old information becomes **stale**, not necessarily false for its original timestamp.

## 17.4 Dispute State

A proposition can have a public dispute summary without selecting a winner. This is useful for political, historical, religious and investigative content.

# 18. Information Spread and Social Network Channels

Information propagation uses opportunities and channels, not all-to-all pair simulation.

## 18.1 Propagation Sources

- direct conversation;
- ambient social contact reported by Document 07;
- public notice/announcement;
- settlement meeting;
- worksite/barracks/guild briefing;
- household sharing;
- messenger/letter;
- caravan/merchant route;
- faction network;
- religious service;
- tavern/market/social hub;
- criminal network;
- companion report;
- magical broadcast or link when defined externally.

## 18.2 Candidate Selection

At each information opportunity, 28C selects a small candidate set based on:

- salience;
- relevance to listener;
- novelty;
- urgency;
- secrecy;
- speaker willingness;
- channel suitability;
- recency;
- current world events;
- available simulation budget.

## 18.3 No Gossip Tick Storm

The system must not evaluate every known proposition between every pair of NPCs. Use event-driven transfer opportunities and bounded queues.

## 18.4 Information Reach

Information can have natural reach bands:

- personal;
- household;
- local settlement;
- neighbouring settlements;
- regional trade network;
- faction-wide;
- realm-wide;
- public/world-scale for rare major announcements.

Reach is achieved through channels over time, not automatic broadcasting unless the owning content explicitly defines a magical or technical broadcast capability.

# 19. Settlement, Household and Community Information Flow

## 19.1 Household Sharing

Households can be efficient channels for routine local information such as:

- danger warnings;
- schedule changes;
- family news;
- food shortages;
- local events;
- work opportunities.

They do not automatically share every secret or professional fact.

## 19.2 Workplace Information

Work roles can expose role-appropriate information:

- guards receive patrol warnings;
- builders receive project blockers;
- healers receive treatment-relevant reports;
- merchants receive market notices;
- farmers receive seasonal/crop information.

The underlying facts remain owned by their systems.

## 19.3 Public Social Anchors

Operational structures such as markets, halls, taverns, shrines, schools or notice boards may provide information opportunities if Documents 19/20 report valid functions. 28C never infers a communication service merely because a voxel building looks like one.

## 19.4 Town Criers and Notice Boards

Public announcement channels can transfer verified or propagandistic claims to many residents with bounded batch processing. Recipients can still distrust the source.

# 20. Faction, Government, Guild, Religious and Criminal Channels

## 20.1 Faction Channels

Document 13 defines faction identity and political structures. 28C can model information channels such as:

- command briefings;
- diplomatic letters;
- intelligence reports;
- propaganda;
- guild bulletins;
- religious sermons;
- criminal whispers;
- trade circulars.

## 20.2 Official Does Not Mean True

An official announcement is a high-authority source for some actors, but it is still a claim. A government may be mistaken or deceptive. 28C never equates `source = official` with objective truth.

## 20.3 Compartmentalisation

Faction knowledge can be role-gated:

- public;
- member;
- officer;
- specialist;
- leadership;
- cell-specific;
- need-to-know.

Individual actors still carry actual knowledge records rather than automatically inheriting every faction secret.

## 20.4 Propaganda

Propaganda is authored/systemic communication designed to influence belief. The political owner defines the policy/content intent; 28C handles claims and propagation; 28E may resolve deliberate persuasion effects.

# 21. Documents, Letters, Books, Signs, Maps and Records

## 21.1 Written Sources

Written information is represented by a document/source record referencing semantic content rather than treating rendered prose as the sole authority.

Possible source types:

- personal letter;
- official notice;
- contract copy;
- ledger;
- book;
- field note;
- map;
- wanted notice;
- guild bulletin;
- shrine inscription;
- ancient tablet;
- ship log;
- research report.

## 21.2 Reading Requires Access and Comprehension

A character must:

- possess/access the document;
- be able to perceive it;
- meet language/script comprehension requirements;
- satisfy any decoding/cipher/magic requirement owned by the relevant system.

## 21.3 Maps

A map can transfer location propositions at varying precision. Document 17 owns map presentation; 28C determines what the character learned and how precise/reliable the source is.

## 21.4 Forged Documents

A forged document can assert false claims. Item/document systems own the physical object; 28C owns informational content/provenance; 28E/skill systems may resolve whether deception is believed or forgery detected.

# 22. Language Definition Boundary and Language Identity

Document 13 remains the owner of language identities.

A `LanguageDefinition` may describe:

- stable language ID;
- name/localisation key;
- cultures/regions associated with it;
- supported modalities;
- script family;
- dialect relationships;
- historical/archaic relations;
- mutual-intelligibility tags;
- specialist registers/jargon associations.

28C does not redefine which cultures speak which languages as canonical world identity. It stores what an **individual** can do with those definitions.

## 22.1 Language Is Not Ancestry

A character's ancestry never automatically determines language. Starting language competence may derive from upbringing, culture, household, schooling, profession or history.

## 22.2 Multilingual Worlds

Mixed settlements can naturally contain:

- shared lingua franca;
- household language;
- trade language;
- faction language;
- ritual language;
- ancient scholarly language.

No society requires linguistic uniformity.

# 23. Individual Language Competency

## 23.1 Competency Record

An individual's competency may track modalities independently:

- listening/understanding spoken language;
- speaking;
- understanding signed language where applicable;
- signing;
- reading;
- writing.

## 23.2 Proficiency Bands

Recommended readable bands:

1. **Unfamiliar** - does not meaningfully understand.
2. **Recognition** - recognises language/common words/names.
3. **Basic** - simple needs, greetings, obvious directions.
4. **Conversational** - routine social and work communication.
5. **Fluent** - complex ordinary communication with low loss.
6. **Mastery** - high nuance, specialised rhetoric, idiom and difficult texts subject to domain knowledge.

Internal numeric competence may support gradual learning while UI uses bands.

## 23.3 Competency Sources

Competence can come from:

- childhood/household;
- culture/upbringing;
- travel and immersion;
- NPC teaching;
- books/courses;
- repeated conversation;
- profession;
- magical translation aids;
- quest/story rewards;
- world settings.

Progression reward ownership remains Document 02.

# 24. Dialects, Registers, Jargon, Codes and Archaic Forms

## 24.1 Dialect Familiarity

Dialect relationships come from Document 13. 28C can track individual familiarity that modifies effective comprehension.

## 24.2 Register

Communication may use registers such as:

- informal;
- formal;
- courtly;
- military;
- mercantile;
- religious;
- scholarly;
- criminal slang.

Register affects vocabulary difficulty and social etiquette but does not create a separate full language unless Document 13 defines one.

## 24.3 Technical Jargon

Language fluency does not imply domain expertise. A fluent speaker may still misunderstand advanced arcane, engineering, medical or legal jargon.

Jargon comprehension can require:

- domain knowledge/skill;
- specialist role;
- discovered terminology;
- explicit explanation.

## 24.4 Codes and Ciphers

Codes/ciphers can be represented as additional decoding gates. The system owner of cryptography/quest puzzle content defines how a code is solved. 28C records whether decoded meaning is known.

# 25. Comprehension Resolution and Meaning Fidelity

## 25.1 Effective Comprehension

Comprehension can consider:

- language competence;
- dialect familiarity;
- channel quality;
- speaker clarity;
- distance/noise from external presentation/perception systems;
- vocabulary/register difficulty;
- technical-domain familiarity;
- interpreter path;
- fatigue/injury communication modifiers supplied by Set 29 where approved;
- magical interference if an owning system exposes it.

## 25.2 Comprehension Results

Suggested results:

- full;
- high;
- partial;
- fragmentary;
- recognition_only;
- unintelligible.

## 25.3 Semantic Fidelity

Partial comprehension does not randomly scramble text. It reduces the **semantic payload** that transfers.

Example:

```text
Original: "The eastern bridge is closed until noon because the second support cracked."
High fidelity: eastern bridge closed until noon; support damage.
Partial: eastern bridge closed; damaged.
Fragmentary: eastern bridge... closed.
```

## 25.4 Context Clues

Gestures, visible objects, map pointing and shared environment may improve comprehension of simple propositions without granting language fluency.

# 26. Interpreters, Translation and Mediation

## 26.1 Interpreter Path

An interpreter must comprehend both source and target communication sufficiently for the content.

Transfer becomes:

```text
Speaker -> interpreter comprehension -> interpreter claim/re-expression -> listener comprehension
```

Each stage can reduce fidelity.

## 26.2 Interpreter Trust

An interpreter can intentionally distort or selectively omit information. 28C records the transformed claim; 28E may resolve deliberate deception/social pressure where required.

## 26.3 Group Negotiation

28B owns multi-party conversation. 28C supplies language-routing information so the runtime knows:

- who understands whom directly;
- who requires interpretation;
- whether one interpreter can serve multiple participants;
- what semantic information each participant actually received.

## 26.4 Translation Items and Magic

Books, devices, spells or artifacts may provide translation capability when their owning item/magic systems expose a valid effect. 28C consumes that capability and resolves information fidelity.

# 27. Reading, Writing and Written Translation

## 27.1 Literacy Is Separate From Speech

A person can speak a language without reading its script, or read an ancient language without speaking it conversationally.

## 27.2 Writing Quality

Writing a comprehensible message can depend on writing competence and domain vocabulary. The physical letter/item remains external; 28C owns semantic content and intended recipients.

## 27.3 Translation of Documents

A translated document should preserve:

- original source ID;
- translator;
- source language;
- target language;
- translation fidelity;
- ambiguities;
- intentional modifications if any;
- date/version.

## 27.4 Ancient and Damaged Text

Partial inscriptions can reveal fragments rather than all-or-nothing knowledge. Exploration/quest systems can use these fragments as clues.

# 28. Magic, Telepathy, Divination and Extraordinary Information Interfaces

Magic may alter communication, but the Magic System remains the owner of magical capability and cost.

Possible interfaces include:

- magical translation;
- telepathic speech;
- memory projection;
- truth-seeking ritual;
- divination;
- remote viewing;
- dream communication;
- spirit testimony.

28C handles the **information result** provided by the magic owner.

## 28.1 Magic Is Not Automatic Truth

Unless a spell explicitly and authoritatively guarantees a fact, magical information can have:

- uncertainty;
- symbolic output;
- incomplete scope;
- interference;
- deception resistance or vulnerability;
- provenance.

28C should never assume "magic source = true".

## 28.2 Telepathy and Privacy

A magical communication channel can bypass spoken language only if the magic definition says so. Privacy, consent, detection and cost remain with magic/social rules as appropriate.

# 29. Quest, Event, Exploration and World-Knowledge Integration

## 29.1 Quest Discovery

Document 15 may query whether the player knows/heard a required proposition before revealing a quest topic or map clue.

Examples:

- heard rumour of abandoned tower;
- read a wanted notice;
- witnessed attack;
- learned a ritual name;
- received a messenger warning.

## 29.2 Quest Facts Remain External

Knowing "the missing miner may be in the north cave" does not spawn/move the miner or complete an objective. It only affects information and discoverability.

## 29.3 Investigation

Investigation gameplay can accumulate:

- witness statements;
- physical evidence references;
- contradictory claims;
- location clues;
- motive claims;
- official reports.

Document 15 may interpret these as objective progress conditions. 28C remains the information layer.

## 29.4 Exploration Rumours

Rumours can reveal approximate map areas instead of exact coordinates. Precision depends on source knowledge and language fidelity.

# 30. Economy, Markets and Trade-Information Integration

Set 27 remains the authority for prices, market supply/demand, wages, contracts and merchant stock.

28C can represent beliefs and rumours such as:

- "Iron is scarce in Westmere."
- "The southern market pays well for salt."
- "A caravan is overdue."
- "The guild may raise wages next week."

## 30.1 Economic Information Can Be Stale

Market facts change. A merchant, traveller or player may carry old information. The UI should distinguish source age and confidence where appropriate rather than silently showing current Set 27 truth through every NPC.

## 30.2 Price Queries vs Social Knowledge

When the player opens an actual trade transaction, Set 27 supplies the live price. When the player asks an NPC what another town pays, 28C supplies that NPC's knowledge/belief about the distant market.

## 30.3 Market Rumours

Market rumours may influence behaviour only through interfaces approved by Set 27. 28C does not modify supply, demand or price because people are talking about them.

# 31. Crime, Witness, Law and Investigation Integration

## 31.1 Crime Facts

Crime/ownership/combat systems determine what action occurred and whether it violated applicable rules. 28C determines what witnesses perceived and what claims circulate afterward.

## 31.2 Identification Confidence

Witnesses can know:

- exact identity;
- probable identity;
- faction/uniform only;
- appearance descriptor;
- unknown actor.

No hidden actual identity is exposed as witness certainty.

## 31.3 Reporting

A witness may:

- report immediately;
- tell household first;
- tell a guard later;
- remain silent;
- be persuaded/intimidated by 28E;
- give false testimony;
- retract/correct testimony.

## 31.4 Legal Boundary

28C exposes evidence/statement provenance. The justice system decides:

- admissibility;
- warrant/arrest threshold;
- guilt;
- sentence;
- legal reputation effect.

# 32. Personality, Relationship and Social-Reputation Hooks

28C consumes later Set 28 social states without owning them.

## 32.1 Personality Hooks

Personality can influence:

- curiosity;
- gossip tendency;
- caution about unverified claims;
- secrecy preference;
- willingness to correct errors;
- tendency to volunteer information;
- preference for official vs personal sources;
- verbosity/detail level.

Exact personality definitions belong to the Set 28 social personality framework, with later detailed ownership as assigned by 28A.

## 32.2 Relationship Hooks

28D may provide:

- trust;
- familiarity;
- affection;
- fear;
- loyalty;
- grievance;
- relationship milestone.

28C can use these as source/disclosure inputs but never writes relationship values merely because information transferred.

## 32.3 Social Reputation

A reputation for reliability or dishonesty can influence source credibility after the owning relationship/reputation system exposes it.

# 33. Companion, Recruitment and Delegation Information Hooks

## 33.1 Companion Knowledge

Companions are not telepathically synced with the player by default. They can know:

- what they witnessed together;
- what the player told them;
- what they discovered independently;
- briefing information supplied by 28G;
- shared party information if world settings explicitly enable it.

## 33.2 Mission Briefing

28G can supply an assignment goal; 28C records which mission-critical propositions the companion was actually briefed on.

## 33.3 Mission Report

When a delegated agent returns, 28G reports outcomes and discovered evidence. 28C converts these into reportable knowledge. The companion can be uncertain, mistaken or incomplete where the assignment result says so.

## 33.4 Recruitment Information

Recruitment offers can depend on what the NPC knows about the player, faction, danger or promised destination, while 28F owns the actual recruitment decision/state.

# 34. UI, Localisation, Accessibility and Spoiler Protection

## 34.1 Player-Facing Knowledge Presentation

Document 17/28I may render:

- known fact;
- heard rumour;
- uncertain claim;
- conflicting reports;
- source and date where appropriate;
- "you do not understand this language";
- translated/partially translated text;
- discovered map area;
- witness summary;
- correction/retraction.

## 34.2 Never Show Hidden Truth by Accident

UI must not display:

- objective truth marker unknown to the character;
- actual disguised identity when witness knowledge is uncertain;
- hidden speaker deception flag;
- current live price when displaying a stale rumour unless clearly separated as a live transaction view;
- untranslated semantic content as subtitles simply because localisation exists.

## 34.3 In-World Language vs Localisation

A line can simultaneously have:

- semantic meaning in game state;
- in-world source language;
- player-facing localisation key.

If the player character does not understand the source language, the UI may render:

- unintelligible speech indicator;
- partial recognised words;
- translated subtitles if a valid interpreter/effect exists;
- accessibility-safe speaker/emotion cues without semantic spoiler.

## 34.4 Accessibility Assist

World settings may optionally offer **Language Comprehension Assist** that reduces or removes in-world language barriers for the player. This is a gameplay accessibility setting, not silent localisation leakage. NPC-to-NPC knowledge and language state remain intact unless the setting explicitly changes world rules.

# 35. Multiplayer Information Scope and Authority

## 35.1 Knowledge Scope

Information records can be:

- character-personal;
- player-profile-known where appropriate for meta tutorials only;
- party-shared by configured rule;
- settlement-public;
- faction-distributed;
- world-public.

## 35.2 No Automatic Party Telepathy by Default

If Player A discovers a hidden shrine while Player B is elsewhere, Player B does not automatically know unless:

- party knowledge sharing setting says discoveries sync;
- Player A communicates it;
- a shared map/device transmits it;
- the quest owner explicitly defines party-scoped discovery.

## 35.3 Authoritative Transfer

Clients request statements/transfers; server/host validates:

- speaker has permission/knowledge to make the selected semantic claim mode;
- recipients are valid;
- language/channel resolution;
- information revision;
- resulting record updates.

## 35.4 Competitive Information

Future PvP/competitive worlds can keep faction intelligence private by scope. Debug tooling must never leak hidden information to normal clients.

# 36. Persistence, Save/Load and Simulation LOD

## 36.1 Persistence Priorities

Persist individually when information is:

- quest/story critical;
- a secret;
- a witness record;
- relationship-significant;
- companion/delegation critical;
- faction/diplomacy critical;
- recently disputed/corrected;
- explicitly pinned by content.

Low-salience routine facts can decay or compress.

## 36.2 Distant Information Summary

A settlement/faction may store `InformationPrevalenceSummary` entries such as:

```text
proposition: raid_warning.region_12
awareness_prevalence: 0.76
acceptance_prevalence: 0.68
average_confidence_band: confident
primary_channels: guard_network, market_gossip
last_update: day_44_14h
```

This is not a substitute for important named-person beliefs. It is a bounded LOD tool.

## 36.3 Promotion

When an NPC returns to detailed simulation:

- preserve all explicit individual records;
- optionally materialise low-priority beliefs from relevant prevalence summaries using deterministic actor/culture/role factors;
- never overwrite a preserved contradictory individual belief without an actual information event.

## 36.4 Catch-Up

Unloaded information spread uses bounded time slices, not minute-by-minute conversations. It resolves a limited number of channel updates per period and records summary outcomes.

## 36.5 Save Compatibility

Knowledge records reference stable IDs, proposition families and provenance records. Removed/renamed content must use Set 25 aliases/migrations or degrade to safe "source unavailable" history rather than corrupting the save.

# 37. Registries, Naming and Data Templates

## 37.1 Definition Families

Suggested canonical families:

- `social.knowledge.proposition_family.*`
- `social.knowledge.source_profile.*`
- `social.knowledge.rumour_profile.*`
- `social.knowledge.distortion_profile.*`
- `social.knowledge.disclosure_policy.*`
- `social.knowledge.evidence_type.*`
- `social.language.comprehension_profile.*`
- `social.language.interpretation_profile.*`
- `social.knowledge.propagation_channel.*`

Runtime IDs remain instance-scoped records rather than registry definitions.

## 37.2 Proposition Family Definition

Conceptual fields:

| Field | Purpose |
| --- | --- |
| `id` | Qualified stable ID. |
| `predicate` | Semantic relation/type. |
| `truth_provider` | Owning system/query contract, if objective. |
| `temporal_mode` | Current, historical, prediction, timeless, subjective. |
| `volatility` | How quickly knowledge may become stale. |
| `default_salience` | Candidate propagation weight. |
| `default_sensitivity` | Public/private/secret handling baseline. |
| `distortion_profile` | Allowed semantic mutation family. |
| `display_topic_key` | UI/dialogue topic linkage. |
| `validation_rules` | Required subject/object types and scopes. |

## 37.3 Belief Record

Runtime fields are defined in Appendix B.

## 37.4 Rumour Profile

A rumour profile can define:

- category;
- eligible proposition families;
- spread channels;
- mutation budget;
- decay;
- urgency;
- spoiler protection;
- public/private restrictions;
- max LOD reach per catch-up interval.

# 38. Diagnostics, Validation and Automated Test Strategy

## 38.1 Required Validators

Validators should detect:

- proposition family without owner/truth semantics;
- knowledge record referencing missing actor/entity;
- claim whose semantic subject/object types are invalid;
- rumour transformation that introduces an unknown entity;
- dialogue line requiring knowledge not checked through 28C;
- hidden truth leaked in a player-facing view model;
- interpreter path with no shared language chain;
- evidence provenance cycles;
- unbounded rumour propagation profile;
- secret marked public by conflicting override;
- save migration that drops critical witness/quest knowledge;
- language competency referencing missing Document 13 language ID.

## 38.2 Debug Inspector

Developer tooling should allow authorised users to inspect:

- actor knowledge/beliefs;
- source/provenance chain;
- objective truth query result, clearly developer-only;
- current contradictions;
- rumour hop/mutation history;
- language competency;
- comprehension calculation;
- recent transfers;
- distant prevalence summaries.

## 38.3 Deterministic Tests

Automated scenarios should cover:

- direct observation creates correct knowledge;
- hidden event does not create witness knowledge;
- hearsay transfers source provenance;
- deliberate lie does not alter objective truth;
- correction updates one recipient but not untouched NPCs;
- stale price belief remains stale until updated;
- partial language comprehension transfers only allowed semantic subset;
- interpreter chain reduces fidelity deterministically;
- duplicate independent sources increase confidence without infinite stacking;
- contradictory sources create conflict state;
- LOD summary round-trip preserves critical individual beliefs;
- multiplayer discovery remains scoped;
- migration preserves witness testimony and secrets.

## 38.4 Content Validation Against 28B

Every information-bearing dialogue unit should declare semantic payload or explicitly declare `no_information_transfer`. Presentation text alone is never parsed at runtime to discover facts.

# 39. Production Scope and Staged Delivery

28C should be implemented in layers.

## 39.1 Foundation Slice

First production slice:

- proposition keys;
- individual awareness/belief record;
- source provenance;
- committed dialogue transfer from 28B;
- basic confidence update;
- direct observation integration;
- personal/settlement scope;
- one language + competence framework even if early content mostly shares a common language;
- save/load and debug inspector.

## 39.2 Social Depth Slice

Add:

- rumours;
- contradiction/correction;
- secrets;
- witness testimony;
- public channels;
- partial language comprehension;
- interpreters;
- map/document knowledge;
- multiplayer scope.

## 39.3 Civilisation Scale Slice

Add:

- faction/institution channels;
- propaganda;
- distant prevalence summaries;
- regional information spread;
- advanced language/dialect registers;
- companion/delegation reports;
- cross-realm communication;
- bounded magical information interfaces.

## 39.4 Explicit Deferrals

28C does not require for first production:

- full linguistic grammar simulation;
- procedural invented-language generation;
- unrestricted AI-generated rumours;
- forensic court simulation;
- cryptographic puzzle engine;
- global newspaper simulation;
- perfect human belief psychology;
- every NPC storing every fact.

# 40. 28C Acceptance Criteria

Document 28C is satisfied when the design clearly ensures that:

1. objective world truth and actor belief are separate;
2. dialogue text cannot create facts or knowledge by display alone;
3. every consequential claim has semantic structure and source;
4. a person cannot truthfully assert knowledge they do not possess unless the speech mode is explicitly guess, hearsay, question, fiction or deception;
5. rumours can be true or false and are never treated as a truth category;
6. rumour mutation is semantic, bounded and validator-safe;
7. important provenance survives transfer and save/load;
8. corrections spread through normal channels rather than globally rewriting minds;
9. witnesses preserve perception uncertainty and do not receive hidden actual identity;
10. testimony does not determine guilt inside Set 28;
11. deliberate deception is represented by 28C while social success remains 28E;
12. language definitions remain owned by Document 13;
13. individual language competence and comprehension are owned by 28C;
14. real-world localisation cannot leak in-world meaning;
15. partial comprehension transfers bounded semantic meaning rather than random garbling;
16. interpreters form explicit information-transfer chains;
17. player and NPC knowledge can be scoped separately in multiplayer;
18. economy/survival/movement facts remain owned by Sets 27/29/30;
19. distant propagation is bounded and does not require all-to-all gossip simulation;
20. important secrets, witness records, quest knowledge and companion reports persist individually;
21. debug tools can explain why an actor knows or believes something;
22. the system is compatible with 28A ownership and 28B conversation runtime.

# 41. Open Questions Assigned to Later Documents

The following questions are deliberately assigned rather than solved here.

| Question | Owner |
| --- | --- |
| Exact relationship effect of exposing or protecting a secret | 28D |
| Exact persuasion/deception/intimidation success formulas | 28E |
| Recruitment impact of what an NPC knows about the player | 28F |
| Companion information-sharing permissions and mission-report obligations | 28F/28G |
| AI-assisted wording/generation policy using knowledge packets | 28H |
| Final dialogue/codex/map language UX and accessibility controls | 28I |
| Network replication, persistence schemas and migration implementation | 28J |
| Economic impact of market rumours | Set 27 |
| Survival impact of misinformation about medicine/food | Set 29 |
| Travel/path consequences of incorrect route knowledge | Set 30 |
| Legal evidentiary weight of testimony | justice/governance owner |
| Magical spell costs/limits for telepathy/divination/translation | Document 09 |
| Quest progression thresholds for evidence/investigation | Document 15 |

# 42. Cross-Set Interface Amendments

## 42.1 Status

**No new ownership transfer or mandatory Cross-Set Interface amendment is required by 28C v0.1.**

28C can consume the existing governing interfaces:

- Set 27 economic facts through prices, merchant inventory, trade opportunities, contracts and other exposed economy queries;
- Set 29 injury/illness/fatigue/recovery state when such facts become observable or reportable;
- Set 30 travel state, route accessibility and movement context when such facts become observable or reportable.

If implementation later requires a typed **historical fact snapshot** interface from one of these sets, that should be proposed as a non-owning query contract in the final reconciliation pass rather than defined unilaterally here.

## 42.2 Internal Set 28 Interface Addition

28C exposes a conceptual **Knowledge API** for use by 28B-28J:

- `KnowledgeState(actor, proposition)`
- `BeliefState(actor, proposition)`
- `Confidence(actor, proposition)`
- `PrimaryProvenance(actor, proposition)`
- `CanAssert(actor, proposition, speech_mode)`
- `DisclosureEligibility(actor, recipient, proposition, context)`
- `ResolveComprehension(sender, recipient, language, payload, context)`
- `ResolveInterpreterPath(sender, recipient, interpreters, payload)`
- `ApplyInformationTransfer(transfer_event)`
- `RumourState(rumour_id)`
- `WitnessKnowledge(observer, event_id)`
- `InformationPrevalence(scope, proposition)`

Exact implementation signatures belong to 28J/current technical implementation.

# Appendix A. Knowledge Definition and Runtime Record Catalogue

| Record | Type | Owner | Purpose |
| --- | --- | --- | --- |
| `PropositionFamilyDefinition` | Immutable definition | 28C | Defines semantic proposition type and truth-provider contract. |
| `PropositionInstanceKey` | Deterministic semantic key | 28C | Identifies specific proposition subject/value/time. |
| `BeliefRecord` | Mutable runtime | 28C | Actor awareness, stance, confidence, freshness and provenance. |
| `EvidenceRecord` | Runtime/history | 28C + external source ref | Structured support for belief/claim. |
| `ClaimRecord` | Runtime/history | 28C | Semantic assertion by a source. |
| `RumourRecord` | Mutable runtime | 28C | Socially transmissible claim package and mutation/provenance state. |
| `WitnessKnowledgeRecord` | Persistent runtime | 28C | What a witness perceived/believes about an event. |
| `StatementRecord` | Persistent/selective runtime | 28C | Committed claim/testimony/correction record. |
| `DisclosurePolicyDefinition` | Immutable definition | 28C | Sensitivity and sharing restrictions. |
| `InformationTransferRecord` | Runtime/history | 28C | Sender/recipient/channel/fidelity/result. |
| `LanguageCompetencyRecord` | Mutable runtime | 28C | Individual competence by language/modality. |
| `InformationPrevalenceSummary` | Distant summary | 28C | Bounded settlement/faction awareness/acceptance state. |
| `LanguageDefinition` | Immutable definition | Document 13 | Language identity, script and cultural relationships. |
| `ConversationSessionState` | Mutable runtime | 28B | Active conversation that can carry claims. |
| `RelationshipRecord` | Mutable runtime | 28D | Trust/familiarity/etc consumed by 28C. |
| `SocialResolutionResult` | Runtime event | 28E | Persuasion/deception/negotiation result consumed by 28C. |

# Appendix B. BeliefState and InformationTransfer Templates

## B.1 BeliefRecord

```yaml
belief_record:
  actor_id: npc:...
  proposition_key: proposition:...
  awareness: informed
  stance: leans_accept
  confidence: 720
  last_updated_world_time: ...
  observed_revision: optional
  primary_source_id: source:...
  root_source_id: source:...
  hop_count: 2
  evidence_ids:
    - evidence:...
  contradiction_state: none
  disclosure_policy_id: social.knowledge.disclosure.public
  salience: 0.65
  persistence_priority: important
  tags:
    - danger
    - settlement_local
```

## B.2 InformationTransferRecord

```yaml
information_transfer:
  transfer_id: info_transfer:...
  sender_id: npc:...
  recipient_ids:
    - player:...
  conversation_session_id: conversation_session:...
  claim_ids:
    - claim:...
  source_language_id: language:...
  interpreter_ids: []
  comprehension_result: high
  semantic_fidelity: 0.88
  deliberate_influence_result_id: optional_28E_result
  transfer_outcome: understood_doubted
  world_time: ...
  authority_revision: ...
```

## B.3 WitnessKnowledgeRecord

```yaml
witness_knowledge:
  witness_id: npc:...
  event_id: event:crime_...
  perceived_actor:
    identity_id: optional
    descriptor_profile_id: appearance_descriptor:...
    identity_confidence: 0.42
  action_category: theft
  observation_fidelity: 0.71
  location_id: ...
  world_time: ...
  evidence_ids:
    - evidence:visual_observation_...
  testimony_status: not_reported
```

# Appendix C. Information Source and Evidence Families

| Family | Typical Reliability Context | Notes |
| --- | --- | --- |
| Direct visual observation | High for visible action, variable for identity/detail | Perception owner supplies fidelity. |
| Direct auditory observation | High for heard words if language understood | Speaker identity and acoustics can vary. |
| Trusted named witness | Relationship/domain dependent | Still hearsay for recipient. |
| Independent multiple witnesses | Stronger when genuinely independent | Do not count repeated same root source as independent. |
| Official announcement | High institutional authority for some actors | Can still be mistaken or propaganda. |
| Professional report | Strong in relevant domain | Competence/role matters. |
| Household member | Often high interpersonal trust | May lack specialist knowledge. |
| Merchant/caravan report | Useful for routes/markets | Often stale by travel time. |
| Anonymous rumour | Low/variable | Useful as discovery hook, not proof. |
| Written record | Depends on author/date/authenticity | Can be forged or outdated. |
| Physical clue | Depends on interpretation | Investigation/domain skill may matter. |
| Magical detection | Defined by magic capability | Never assumed infallible unless magic owner guarantees it. |
| Companion report | Depends on assignment, competence and relationship | 28G supplies mission outcome. |
| Player statement | Uses player's social credibility like any other source | No privileged truth flag. |

# Appendix D. Bounded Information-Transfer Algorithm

```text
INPUT:
  opportunity(sender, recipients, channel, context)

1. Gather sender candidate propositions from:
   - urgent/salient beliefs
   - requested topic
   - role briefing
   - authored conversation payload
   - eligible rumours

2. Filter by:
   - sender awareness
   - disclosure policy
   - secrecy/permission
   - relevance
   - cooldown/repetition
   - channel capacity

3. For each selected proposition (bounded count):
   a. construct claim mode
   b. attach provenance
   c. if 28B speech: wait for committed utterance
   d. resolve recipient language/comprehension
   e. apply interpreter transformations if required
   f. if deliberate influence: consume 28E result
   g. update recipient awareness/belief/confidence
   h. record transfer and limited provenance
   i. optionally schedule rumour/public propagation

4. Emit summary events.

5. Stop at channel/event budget. Never iterate over every known proposition.
```

# Appendix E. Knowledge and Language Reason-Code Families

Examples:

- `social.knowledge.unaware`
- `social.knowledge.partial`
- `social.knowledge.stale`
- `social.knowledge.conflicting_sources`
- `social.knowledge.source_unknown`
- `social.knowledge.assert.not_known`
- `social.knowledge.assert.hearsay_only`
- `social.knowledge.disclosure.private`
- `social.knowledge.disclosure.faction_restricted`
- `social.knowledge.disclosure.refuses`
- `social.knowledge.transfer.understood`
- `social.knowledge.transfer.partial`
- `social.knowledge.transfer.rejected`
- `social.knowledge.transfer.stale_revision`
- `social.knowledge.rumour.mutation_budget_exceeded`
- `social.knowledge.provenance.missing_root`
- `social.knowledge.witness.identity_uncertain`
- `social.language.unfamiliar`
- `social.language.partial_comprehension`
- `social.language.requires_interpreter`
- `social.language.interpreter_insufficient`
- `social.language.script_unreadable`
- `social.language.jargon_unknown`
- `social.language.translation.partial`

# Appendix F. Example Information Flows

## F.1 Scout Warning Becomes Settlement Knowledge

```text
Scout observes raider camp movement
  -> perception system emits valid observation evidence
  -> 28C creates belief: raid risk elevated, high confidence
  -> scout returns to settlement
  -> 28B conversation/report committed to guard captain
  -> captain understands language fully
  -> captain belief updates with scout provenance
  -> guard network public-warning channel activates through owning settlement/event rules
  -> 28C batches warning transfer to eligible guards/residents
  -> settlement prepares through combat/event systems
```

28C never starts the raid or changes defence values merely because the warning spread.

## F.2 False Crime Accusation

```text
Witness sees hooded thief at night
  -> identity fidelity low
  -> witness record stores appearance descriptor, not true identity
  -> witness sincerely concludes "probably Player A" based on cloak similarity
  -> tells guard
  -> guard receives claim with uncertainty/provenance
  -> player presents contradictory evidence
  -> guard belief becomes conflicting
  -> justice system evaluates legal response using its own rules
```

The game does not secretly upgrade the witness statement to the actual offender's identity.

## F.3 Market Rumour Becomes Stale

```text
Merchant in Town A observes salt price 20 at revision 55
  -> tells caravan trader
  -> trader travels three days
  -> price in Town A falls to 11 at revision 63
  -> trader tells player "Salt was fetching 20 in Town A"
  -> 28C stores source age and revision
  -> player treats it as old market intelligence
  -> actual purchase price later comes live from Set 27
```

## F.4 Interpreter in Diplomatic Council

```text
Leader A speaks Language A fluently
Leader B speaks Language B fluently
Interpreter speaks A mastery / B fluent
  -> 28B hosts three-party council
  -> 28C routes semantic claims A -> interpreter -> B
  -> technical treaty jargon lowers one segment to high rather than full fidelity
  -> interpreter asks clarification
  -> corrected claim transferred
  -> 28E resolves negotiation
  -> Document 13/political owner commits treaty state
```

## F.5 Secret Leak

```text
Player learns faction-secret route from trusted officer
  -> belief record tagged faction_confidential
  -> player tells companion
  -> disclosure event records leak provenance
  -> companion later tells merchant under systemic gossip rules
  -> merchant repeats as rumour
  -> faction eventually learns of leak through its own channels
  -> 28D/28E/faction systems may create social/political consequences
```

The information does not become globally public at the first leak.

## F.6 Correction Competes With Rumour

```text
Rumour: "The healer caused the sickness"
  -> spreads through market with moderate acceptance
Evidence later identifies contaminated well
  -> healer and investigator issue correction
  -> some residents update immediately
  -> others remain doubtful due to distrust
  -> correction and old rumour coexist temporarily
  -> prevalence gradually shifts as evidence/public channels spread
```

# Appendix G. Cross-System Responsibility Matrix

| Case | 28C Owns | External Owner |
| --- | --- | --- |
| NPC knows live market price | Belief/provenance/staleness | Set 27 actual price |
| NPC repeats market rumour | Claim/rumour/transfer | Set 27 economic effects |
| NPC observes injury | Informational observation record | Set 29/combat injury truth |
| Player asks if route is open | Speaker knowledge/claim | Set 30 route accessibility truth |
| Witness reports theft | Witness knowledge/testimony | Crime/justice verdict and consequence |
| NPC lies about theft | Deception representation | 28E influence; justice outcome external |
| NPC tells quest clue | Knowledge/transfer | Document 15 quest stage/objective |
| Rumour reveals location | Approximate location knowledge | Worldgen/structure actual location |
| Faction issues propaganda | Claims/propagation | Document 13 political policy/state; 28E influence |
| Player cannot understand speech | Language competence/comprehension | 28I/UI renders result |
| Interpreter translates | Semantic transfer/fidelity | 28B conversation; 28E negotiation outcome |
| Companion returns with report | Knowledge/report conversion | 28G assignment result |
| Magical divination reveals clue | Information result/provenance | Document 09 magic capability/cost/truth guarantee |
| Party shares map discovery | Knowledge scope update | Document 17 presentation; quest/world map owner actual landmark |

# Appendix H. Glossary

**Awareness** - Whether an actor has encountered enough information to recognise or describe a proposition/topic.

**Belief** - An actor's informational stance toward a proposition, independent of objective truth.

**Claim** - A semantic assertion made by a source through speech, writing or another communication channel.

**Comprehension** - The degree to which a recipient decodes the intended semantic information through a language/channel.

**Confidence** - Bounded estimate of how strongly an actor holds a belief; not a hidden truth probability shown to the player.

**Correction** - New information that explicitly challenges or supersedes an earlier claim.

**Disclosure Policy** - Rules/classification describing when information may be shared and with whom.

**Evidence** - Structured provenance supporting or contradicting a proposition or claim.

**Information Prevalence Summary** - Bounded distant-simulation summary of how widely a proposition is known/believed within a scope.

**Information Transfer** - Authoritative event in which semantic information is communicated from one source to one or more recipients with resolved comprehension/fidelity.

**Language Competency** - Individual ability to understand/speak/read/write a language definition owned by Document 13.

**Proposition** - Stable semantic statement that can be known, believed, claimed, questioned or discussed.

**Provenance** - Where information came from and how it reached the current actor.

**Rumour** - Socially transmissible claim package whose truth may be correct, false, stale, uncertain or mixed.

**Semantic Fidelity** - How much of the intended proposition content successfully transfers through language/channel/translation.

**Stale Knowledge** - Information that may have been accurate when observed but no longer reflects the current revision of a volatile fact.

**Testimony** - A claim offered as a witness/reporting statement with evidence/provenance relevance.

**Truth Provider** - External system that owns and can authoritatively resolve an objective proposition family.

**Witness Knowledge** - A witness's actual perceived/believed informational state about an event, including uncertainty and identity confidence.

---

**End of Document 28C - Knowledge, Rumours, Truth, Lies, Languages and Information Spread v0.1**
