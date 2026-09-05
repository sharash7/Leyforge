# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28D - Relationships, Memory, Trust, Loyalty, Affection and Rivalry

**Dialogue, Social Interaction, Relationships, Companions and Delegation**

**Version 0.1 - Persistent Relationship and Bond Simulation Foundation Draft**

A canonical, data-driven relationship system for directed interpersonal bonds, trust, affection, fear, loyalty, respect, gratitude, grievance, familiarity, friendship, rivalry, family, romance, partnership, marriage, separation, reconciliation, social reputation and relationship memory across persistent people without reducing social life to a single friendship bar or allowing score thresholds to override consent, culture, law, factual world state or player freedom.

**Project Lead and Final Authority:** Ash

> **Relationship System Statement**  
> Leyforge relationships must feel like histories between people rather than numbers attached to dialogue options. A person can trust someone without liking them, respect an enemy, fear a protector, remain grateful to a stranger, resent a friend, love a family member while disagreeing with them, or become a rival without becoming murderous. Meaningful bonds must form from remembered events, repeated behaviour, personality, context and mutual choice. Important relationships should survive distance, save/load, settlement change and long absences, while routine social contact remains bounded enough for a very large living world.

| Field | Locked Direction |
| --- | --- |
| Document Set | Document Set 28 - Dialogue, Social Interaction, Relationships, Companions and Delegation. |
| Document Role | 28D is the detailed authority for persistent interpersonal relationship semantics, directed relationship dimensions, relationship event interpretation, social-memory impact, friendship/rivalry/family/romance milestones, social reputation reactions and relationship persistence. |
| Governing Contract | The **Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0**, Document 28A, 28B and 28C are governing contracts. 28D consumes external facts and does not redefine economy, survival, movement, quest, law, settlement population or political world state. |
| Persistent-Person Boundary | Document 07 owns persistent person identity, household membership, home, life stage, jobs, migration and ordinary village operation. 28D owns the social relationship edges and relationship meaning attached to those people. |
| Knowledge Boundary | 28C owns beliefs, evidence, rumours, confidence, witness knowledge and information transfer. 28D consumes what an actor believes or has socially remembered and resolves the relationship effect of that interpretation. |
| Dialogue Boundary | 28B owns conversation sessions and committed social actions. 28D supplies relationship context and applies authorised relationship consequences after the relevant social action or world event succeeds. |
| Social-Check Boundary | 28E owns persuasion, intimidation, deception, etiquette and negotiation resolution. 28D supplies relationship modifiers and receives accepted/rejected social outcomes; it does not resolve persuasion checks itself. |
| Family Boundary | Document 07 owns household and demographic state; Document 13 owns lineage, culture-specific family law, inheritance and political/legal recognition. 28D owns kinship bond semantics, family relationship effects, partnership commitment and interpersonal marriage state. |
| Romance Boundary | Romance and partnership are mutual social states. They never arise from score thresholds alone. Adult life-stage eligibility, mutual consent, personal preference, existing commitments, culture/law and context must all validate before commitment. |
| Economy Boundary | Set 27 owns gifts as item transfers, prices, contracts, wages, debts and economic outcomes. 28D may interpret a confirmed economic event socially but never creates currency, transfers ownership or changes prices. |
| Survival Boundary | Set 29 owns injury, illness, fatigue and biological state. 28D interprets care, abandonment, rescue or harm socially after the owning system confirms the facts. |
| Movement Boundary | Set 30 owns pathfinding, following movement, mounts, vehicles, travel time and formations. 28D may influence willingness to accompany or travel but never moves actors. |
| Relationship Philosophy | Relationship state is multidimensional, directed, evidence-linked, sparse, inspectable and resistant to repetitive farming. Social bonds persist through meaningful milestones instead of constantly drifting to neutral. |
| Numeric Direction | Core relationship dimensions use bounded canonical ranges for deterministic simulation, while ordinary player UI shows qualitative bands and causes rather than raw meters by default. |
| Simulation Direction | Important relationship edges persist individually. Low-value transient contacts may be compressed or omitted. Distant simulation processes scheduled social opportunities and consequential events rather than all-pairs relationship ticks. |
| Multiplayer Direction | Each player-NPC relationship is distinct. Party or settlement reputation does not automatically overwrite personal relationships. Commitments are server-authoritative and mutually validated. |
| Engine Direction | Gameplay design is engine-neutral but aligned with Godot/Summer Engine through stable IDs, immutable definitions, mutable records, authoritative events, deterministic LOD, validation and migration. |
| Production Direction | The system must work for arbitrary seed-generated people and cultures. Forest Hamlet remains useful only as a regression fixture and example scenario. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Persistent Relationship and Bond Simulation Foundation Draft | Establishes directed relationship dimensions, numeric ranges, relationship event interpretation, social-memory impacts, friendship/rivalry/family/romance milestones, consent rules, social reputation, sparse-graph LOD, multiplayer authority, registries, validation and cross-set interfaces. |

# Document Purpose

Document 28D defines how Leyforge stores and changes the long-term social relationship between persistent people. Earlier documents already establish that named NPCs have identity, households, memories and world history; that cultures and factions have laws and relationship structures; that quests may create weddings, grief, rivalry and allegiance; and that dialogue can query relationship context. What remained undefined was the detailed semantic model beneath words such as *friend*, *trusted*, *loyal*, *afraid*, *grateful*, *rival*, *partner* and *family*.

The purpose of 28D is to make those concepts mechanically coherent without building a human psychology simulator. The system deliberately avoids one universal friendship number. A veteran guard may strongly respect and trust a player while feeling little affection. A frightened villager may obey the player while possessing no loyalty at all. A rival may have positive respect and even affection while remaining intensely competitive. A spouse may remain deeply affectionate while trust is temporarily damaged by a betrayal. These combinations create more believable reactions than a single positive/negative reputation axis.

28D also formalises how relationship change is grounded in evidence. A relationship should not change because a line of flavour text appeared. It changes because an authoritative event occurred, because a person believes that event occurred, because a social action was accepted or rejected, or because a meaningful relationship milestone was mutually committed. 28C remains the authority for what the person knows or believes. 28D stores the **social interpretation and relationship consequence** of that knowledge.

The system must be scalable. Leyforge can eventually contain many settlements and persistent people. It is neither necessary nor affordable to maintain a fully simulated relationship score between every pair of NPCs. The relationship graph is therefore sparse: household members, friends, rivals, co-workers with meaningful history, leaders, companions, quest participants and frequently interacting people retain edges, while strangers are evaluated from personality, current context, culture/faction state and social reputation until a relationship becomes meaningful enough to persist.

# Design Sources and Responsibility Updates

| Source | Direction Preserved by 28D | 28D Relationship |
| --- | --- | --- |
| 00 - Master Game Design Bible | Living NPC civilisations, emergent stories, marriages, migration, morality through consequence rather than a binary meter. | Relationships become persistent histories that support friendship, family, rivalry, loyalty, fear and multiple moral playstyles. |
| 01 - Core Gameplay Loop | Interaction includes talking, helping, threatening, recruiting, trading, training and conquering; village life includes socialising and family. | Relationship state becomes a repeatable player-facing loop and an NPC-to-NPC simulation input. |
| 02 - Player Progression | Individual, settlement and faction reputation matter; Diplomacy/Reputation and Leadership are skills; followers can unlock through social play. | 28D exposes relationship state to progression but does not award XP or define perk formulas. |
| 07 v0.2 - NPC Village System | Persistent people have relationships and memories; household, family change, betrayal, rescue, mourning and marriage persist; fear is not genuine trust. | 07 retains person/household/population operation. 28D becomes detailed authority for relationship dimensions, social-memory interpretation and bond milestones. |
| 13 - Races, Peoples, Cultures and Factions | Personal identity is separate from culture; cross-cultural families, marriage ties, inheritance, law and political relationships exist. | 13 supplies family law, political recognition and cultural customs. 28D resolves individual bonds without treating culture as destiny. |
| 15 - Quest and Event System | Personal and household events include rivalry, grief, birth, marriage and inheritance; relationships can alter branching, betrayal, testimony and allegiance. | 28D supplies relationship facts and milestone events while Document 15 owns quest/event lifecycle and authored consequences. |
| 16 - Combat, Gear and Defence | Rescue, surrender, capture, injury, death, intimidation and aftermath create persistent social consequences. | Combat supplies authoritative harm/rescue/death facts. 28D applies social interpretation without recalculating combat. |
| 17 - UI/UX System | NPC, dialogue, reputation and relationship views must be knowledge-aware, accessible and world-first. | 28D supplies qualitative relationship summaries, cause history and reason codes; UI owns presentation. |
| 18 current architecture principles | One mutable owner, stable IDs, authoritative commands/events, save-safe records and simulation LOD. | Relationship records are persistent domain state rather than widget variables or actor-local values. |
| 19-20 | Households, housing, community spaces, memorials and settlement services create physical context for social life. | 28D consumes valid social opportunities and household changes; buildings never create relationships merely by existing. |
| 22-23 | Entity/animation/voice systems present gestures, posture, facial or audio cues. | Presentation consumes social semantic events but never owns relationship state. |
| 24 | Seed-generated peoples, cultures, histories and factions create varied social contexts. | Relationship rules operate on arbitrary canonical IDs rather than fixed POC characters. |
| 25 | Canonical registry kernel, ownership, typed relationships, validation and migration. | All 28D definitions and records follow Set 25 conventions. |
| 26 | Crews, captains, passengers and maritime societies create intense long-term relationships and conflict. | Maritime systems supply events and roles; 28D provides general relationship mechanics without redefining vessel/crew gameplay. |
| 27-30 Cross-Set Interface Register | One owner per gameplay system; Set 28 exposes relationship, trust, affection, fear and loyalty. | Adopted without ownership drift. |
| 28A | Multidimensional relationship architecture and ownership boundaries. | Governing parent document. |
| 28B | Conversation runtime and social-action commit. | 28D provides relationship context and consumes committed outcomes. |
| 28C | Knowledge, belief, rumours, testimony and information provenance. | 28D consumes belief/confidence/provenance and provides trust/familiarity/reputation inputs back to 28C. |

# Static Table of Contents

1. Locked Relationship-System Identity  
2. Ownership Boundaries and Anti-Duplication Rules  
3. Locked Decision Summary  
4. Relationship Architecture Overview  
5. Sparse Directed Relationship Graph  
6. Core Relationship Dimensions  
7. Canonical Numeric Ranges and Player-Facing Bands  
8. Relationship Context and Domain-Specific Trust  
9. Familiarity and Contact History  
10. Trust and Distrust  
11. Affection, Dislike and Attachment  
12. Fear and Perceived Threat  
13. Loyalty and Commitment  
14. Respect and Contempt  
15. Gratitude and Reciprocity Pressure  
16. Grievance, Resentment and Unresolved Harm  
17. Relationship Event Interpretation Pipeline  
18. Social-Memory Imprints and Evidence Links  
19. Belief Revision, Correction and Relationship Reappraisal  
20. Repetition, Saturation and Relationship-Farming Protection  
21. Initial State, Social Priors and Relationship Seeding  
22. Social Personality and Relationship Pace  
23. Friendship and Close-Bond Milestones  
24. Rivalry, Competition, Enmity and Respectful Opposition  
25. Kinship, Family and Chosen-Family Bonds  
26. Family Support, Conflict, Care and Household Consequence  
27. Romance Eligibility, Interest and Adult-Only Consent Rules  
28. Courtship and Romantic Relationship Progression  
29. Partnership, Marriage and Cultural/Legal Recognition  
30. Separation, Estrangement, Reconciliation and Changed Commitments  
31. Relationship Boundaries, Exclusivity and Commitment Conflict  
32. Death, Grief, Mourning and Continuing Bonds  
33. Social Reputation and Community Perception  
34. Household, Settlement, Culture and Faction Spillover  
35. Dialogue and Conversation Integration  
36. Knowledge, Rumour and Witness Integration  
37. Persuasion, Negotiation and Diplomacy Hooks  
38. Economy, Survival and Movement Interface Integration  
39. Companion, Recruitment and Delegation Hooks  
40. Quest, Event, Story and World-History Integration  
41. NPC Schedules, Social Opportunities and Autonomous Relationship Change  
42. Simulation LOD and Distant Relationship Resolution  
43. Multiplayer Authority and Shared Social Consequence  
44. UI, Accessibility, Privacy and Player Readability  
45. Persistence, Save/Load, Migration and Versioning  
46. Registries, Naming and Data Templates  
47. Diagnostics, Validation and Automated Test Strategy  
48. Production Scope and Staged Delivery  
49. 28D Acceptance Criteria  
50. Open Questions Assigned to Later Documents  
51. Cross-Set Interface Amendments  
Appendix A. Relationship Definition and Runtime Record Catalogue  
Appendix B. Relationship Dimension and Band Tables  
Appendix C. Relationship Event Impact Template  
Appendix D. Friendship, Rivalry, Romance and Family Milestone Templates  
Appendix E. Relationship Reason-Code Families  
Appendix F. Example Relationship Histories  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. Glossary

# 1. Locked Relationship-System Identity

The Relationship System is Leyforge's **persistent interpersonal consequence layer**. It represents the social bond between two persistent people after immediate dialogue or world events have ended.

> **Locked Rule**  
> A relationship is not a reward meter and is not the same thing as reputation. It is a directed history between specific people. Significant bonds are built from evidence-linked events, repeated behaviour and mutually validated milestones. No single dimension may automatically stand in for friendship, romance, loyalty, morality or consent.

## 1.1 Design Promise

The system should support relationships such as:

- a blacksmith who respects the player's craftsmanship but distrusts their secrecy;
- a guard who fears the player after a conquest but does not become loyal merely because they obey;
- a merchant who likes the player personally but refuses to trust them with credit after repeated broken commitments;
- siblings who are deeply familiar and affectionate but hold a long-running grievance;
- a rival who enjoys competing with the player and becomes a close friend;
- an enemy commander who hates the player yet respects their mercy;
- a rescued villager who is grateful immediately, then gradually develops trust only if later behaviour supports it;
- a companion whose loyalty survives temporary disagreement because of a long shared history;
- a spouse whose affection remains high while trust is damaged and must be repaired;
- a settlement resident who has never met the player but has heard a strong local reputation through 28C.

## 1.2 What 28D Is Not

28D is not:

- a single friendship or romance meter;
- the owner of NPC identity, age, household membership or reproduction;
- the owner of political faction relationships or treaties;
- a morality alignment system;
- an economic credit score;
- a legal guilt, marriage-law or inheritance engine;
- the persuasion or intimidation success formula;
- a justification for instant romance because a numeric threshold was reached;
- a requirement to simulate every NPC pair in the world;
- a hidden system that arbitrarily punishes the player without inspectable causes;
- a universal assumption that family bonds are positive;
- a system that equates fear with loyalty;
- a system that treats gifts as purchasable affection.

# 2. Ownership Boundaries and Anti-Duplication Rules

## 2.1 28D Owns

28D owns:

- persistent directed relationship edges;
- relationship dimension definitions and runtime values;
- relationship event profiles and impact interpretation;
- relationship-specific social-memory impact records;
- relationship decay, persistence and consolidation rules;
- friendship and close-bond milestones;
- rivalry and enmity social milestones;
- personal loyalty bonds;
- interpersonal family bond semantics;
- romantic interest, courtship, partnership and social marriage commitment;
- separation, estrangement and reconciliation relationship states;
- relationship-driven social-reputation reactions;
- relationship view summaries and reason codes;
- relationship LOD and sparse-graph rules.

## 2.2 28D Consumes but Does Not Own

| Concern | Owner | 28D Use |
| --- | --- | --- |
| Persistent person, home, household, life stage | Document 07 | Supplies relationship endpoints and demographic/household context. |
| Lineage, ancestry, culture, law, inheritance, political marriage context | Document 13 | Supplies kinship/legal/cultural constraints and recognition. |
| Belief, rumour, evidence, confidence | 28C | Determines what relationship-relevant event the actor thinks occurred. |
| Conversation and committed social action | 28B | Supplies accepted conversation action/event. |
| Persuasion, deception, apology, intimidation, negotiation resolution | 28E | Supplies success, refusal, perceived sincerity or accepted terms. |
| Companion/recruitment state | 28F | Consumes relationship outputs and returns companion-state events. |
| Delegation results | 28G | Supplies fulfilment, abandonment, success, failure and report events. |
| Quest/event lifecycle | Document 15 | Consumes relationship conditions and supplies authored consequences. |
| Combat harm/rescue/death | Document 16 | Supplies authoritative historical facts. |
| Price, gift transfer, wage, contract | Set 27 | Supplies confirmed economic events. |
| Injury, care, illness, recovery | Set 29 | Supplies confirmed survival events. |
| Travel, following, seat, route | Set 30 | Supplies movement/travel state only. |
| Household capacity, buildings, services | Documents 19-20 | Supplies social opportunity and settlement context. |
| UI/voice/animation | Documents 17, 22, 23 | Presents relationship state and events. |

## 2.3 Relationship State Never Owns the Cause

A relationship delta stores a reference to the cause but does not replace it.

Examples:

- `Player rescued NPC during raid` is a combat/event fact.
- `NPC believes the player rescued them` is a 28C belief.
- `NPC gains gratitude and trust toward player` is a 28D relationship effect.
- `NPC offers recruitment` is a 28F decision.
- `NPC gives a discount` is a Set 27 economic result.

Each remains separately authoritative.

# 3. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Core Model | Relationships are sparse, persistent, directed graph edges between persistent people. |
| Core Dimensions | Trust, Affection, Fear, Loyalty, Respect, Gratitude, Grievance and Familiarity. |
| Signed Dimensions | Trust, Affection and Respect use -100 to +100. |
| Unsigned Dimensions | Fear, Loyalty, Gratitude, Grievance and Familiarity use 0 to 100. |
| UI Exposure | Raw values are hidden in ordinary play by default; qualitative bands and recent causes are shown where appropriate. |
| Mutuality | Every relationship dimension is directed. Mutual milestones query both directions rather than assuming symmetry. |
| Friendship | Friendship is a validated milestone produced by familiarity, affection/trust, history and mutual social acceptance, not an automatic threshold. |
| Rivalry | Rivalry is a persistent competitive relationship that may be friendly, respectful, bitter or hostile. It is not synonymous with enemy. |
| Family | Biological/household facts come from external owners; 28D owns the interpersonal social bond and family-specific impact weighting. |
| Romance | Romance is adult-only, mutual, optional and consent-based. Affection alone does not imply romantic interest. |
| Marriage | 28D owns mutual interpersonal marriage/partnership commitment. Culture/law controls legal recognition, ceremony requirements and inheritance consequences. |
| Fear | Fear may influence obedience or avoidance but never generates trust or loyalty by itself. |
| Gifts | Confirmed gifts may create gratitude or context-sensitive affection, with saturation and preference checks. Gifts never purchase consent or guarantee romance. |
| Repetition | Repeated low-value actions have diminishing relationship returns and family/time-window caps. |
| Memory | Relationship effects link to evidence/belief and retain important social-memory imprints. Routine effects may consolidate; major betrayal, rescue, death and commitment can persist indefinitely. |
| Correction | When a belief is corrected, relationship impact may be reappraised rather than blindly erased; consequences created while the false belief was held remain real history. |
| Decay | Transient dimensions such as Gratitude, Fear and Grievance may decay by profile; milestone-anchored long-term Trust/Affection/Loyalty do not simply reset because the player travelled away. |
| Social Reputation | Reputation is a scope-local shared social expectation informed by propagated evidence; it never instantly copies one NPC relationship to everyone. |
| NPC-NPC Relationships | NPCs use the same relationship model. Only meaningful edges persist to avoid all-pairs simulation. |
| LOD | Distant simulation processes meaningful social events/contact summaries, not per-frame pairwise relationship ticks. |
| Multiplayer | Each player has separate personal relationships. Group reputation may influence context but cannot overwrite individual history. |
| Accessibility | Relationship UI can explain observed state and causes without exposing secret thoughts, hidden romance preferences or objective truth the player does not know. |

# 4. Relationship Architecture Overview

The relationship system has six major layers.

| Layer | Purpose | Examples |
| --- | --- | --- |
| Relationship Definitions | Immutable meaning, ranges, bands, decay profiles and event mappings. | Trust definition, rescue impact profile, friendship milestone. |
| Persistent Relationship Edge | Directed current state from Person A to Person B. | Trust +42, Fear 8, Familiarity 71. |
| Relationship Impact Record | Auditable change caused by an event/social outcome. | +8 Gratitude from rescue. |
| Social-Memory Interpretation | Long-term relationship meaning linked to belief/evidence. | “They protected my child during the raid.” |
| Milestone Record | Persistent validated bond state. | Friend, Rival, Partner, Married, Estranged. |
| Resolved Relationship View | Context-specific query used by dialogue, recruitment, diplomacy and UI. | “Trusted close friend; current grievance unresolved.” |

## 4.1 Canonical Relationship Flow

1. An owning system commits an event or 28B/28E commits a social action.
2. 28C determines whether the actor knows/believes the relevant proposition and with what confidence.
3. 28D resolves personal relevance and the applicable relationship event profile.
4. Personality, expectations, current relationship and contextual modifiers shape the impact.
5. Saturation, repetition and safety caps are applied.
6. The relationship edge changes authoritatively.
7. Significant effects create or update a social-memory interpretation.
8. Milestone eligibility is re-evaluated where relevant.
9. Relationship change events are emitted to UI, quests, companions and other consumers.
10. Any later correction or supersession can trigger reappraisal through the same evidence links.

# 5. Sparse Directed Relationship Graph

## 5.1 Directed Edges

A relationship edge is stored as:

`relationship:<subject_person_id>:<target_person_id>`

The edge belongs to the **subject's perception/bond toward the target**.

If Mara trusts the player but the player has no simulated social-state record toward Mara, only Mara -> Player needs to exist for NPC behaviour. NPC-NPC important relationships usually have two edges because each person can feel differently.

## 5.2 When an Edge Is Created

An edge is created when at least one condition is true:

- household/kinship context requires persistent social history;
- two characters interact meaningfully more than a transient threshold;
- a high-significance event directly connects them;
- one becomes a companion, recruit, mentor, student, rival, partner or story participant;
- an authored quest/event marks the bond important;
- one character takes a major action affecting the other's household or life;
- a world-generation relationship seed explicitly creates a meaningful prior bond.

A brief purchase from a stranger does not automatically create a permanent edge.

## 5.3 Edge Retention

An edge remains individually persistent if it has:

- any relationship milestone;
- significant social-memory imprints;
- high Familiarity;
- active Gratitude or Grievance above retention threshold;
- companion/recruitment history;
- family/kinship significance;
- quest/event binding;
- explicit authored retention;
- significant positive or negative Trust/Affection/Respect.

Otherwise, a low-value edge may be safely compressed or removed after long inactivity, with only public reputation/context used on future contact.

# 6. Core Relationship Dimensions

The eight core dimensions represent different social meanings. They deliberately overlap only enough to support realistic combinations.

| Dimension | Meaning | Does Not Mean |
| --- | --- | --- |
| Trust | Expectation that the target is honest, safe, reliable or will act as expected. | Affection, competence, obedience or romance. |
| Affection | Personal warmth, fondness, liking or emotional attachment. | Trust, romantic interest or loyalty. |
| Fear | Perceived threat or anticipated harm from the target. | Respect, hatred, loyalty or legal authority. |
| Loyalty | Willingness to remain committed, support the target and accept personal cost for the bond. | Fear-based obedience or political faction allegiance. |
| Respect | Esteem for ability, principles, courage, status or conduct. | Friendship or affection. |
| Gratitude | Active sense of benefit received and reciprocity pressure. | Permanent friendship or debt in the Set 27 sense. |
| Grievance | Active unresolved resentment or remembered wrong. | Objective guilt or legal claim. |
| Familiarity | Depth of personal exposure/history and knowledge of the target. | Positive feelings or trust. |

## 6.1 Relationships Can Be Internally Mixed

Examples:

| Relationship | Trust | Affection | Fear | Loyalty | Respect | Grievance |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Close friend after argument | High | High | Low | High | High | Moderate |
| Respected enemy commander | Low | Negative | Moderate | 0 | High | High |
| Frightened conquered resident | Very low | Negative | High | 0 | Low/variable | High |
| Strict but loved mentor | High | High | Low | Moderate | High | Low |
| Charming unreliable acquaintance | Low | Positive | Low | 0 | Moderate | Low |
| Friendly rival | Moderate | Positive | Low | Moderate | High | Low/competitive |

This multidimensionality is a core design requirement.

# 7. Canonical Numeric Ranges and Player-Facing Bands

Numeric ranges exist for deterministic simulation and testing. They are not intended to make normal social play feel like optimising a spreadsheet.

## 7.1 Signed Dimensions

Trust, Affection and Respect use `-100..+100`.

| Range | Trust Example | Affection Example | Respect Example |
| ---: | --- | --- | --- |
| -100 to -76 | Profound distrust | Hatred/strong aversion | Contempt |
| -75 to -41 | Distrust | Strong dislike | Low respect |
| -40 to -16 | Wary | Mild dislike | Doubtful/dismissive |
| -15 to +15 | Uncertain/neutral | Neutral | Neutral |
| +16 to +40 | Cautiously trusting | Likes | Positive regard |
| +41 to +75 | Trusted | Strong affection | Respected |
| +76 to +100 | Deep trust | Deep attachment | Profound respect |

## 7.2 Unsigned Dimensions

Fear, Loyalty, Gratitude, Grievance and Familiarity use `0..100`.

| Range | Generic Band |
| ---: | --- |
| 0-10 | None/negligible |
| 11-25 | Low |
| 26-45 | Noticeable |
| 46-65 | Strong |
| 66-85 | Very strong |
| 86-100 | Defining/extreme |

Context-specific labels replace the generic band where clearer: `Familiar`, `Very Familiar`, `Deeply Loyal`, `Severe Grievance`, `Terrified` and so on.

## 7.3 Clamp and Precision Rules

- Runtime values are stored with enough precision for smooth simulation, but authoritative comparisons should use deterministic fixed or bounded numeric operations.
- No event can push a dimension outside its canonical range.
- UI rounds or bands values; it does not expose false precision.
- Definitions may specify local thresholds, but content packs cannot redefine the canonical dimension meaning.

# 8. Relationship Context and Domain-Specific Trust

General Trust is a useful summary, but trust can be contextual.

An NPC may trust the player:

- with personal secrets;
- in combat;
- with children/family;
- with money or goods;
- to keep promises;
- to respect sacred sites;
- to command during danger;
- to provide competent advice.

28D therefore supports optional **Trust Domains**.

`Trust(actor, target, domain=general)` resolves:

- general Trust;
- domain-specific history;
- relevant social memories;
- public reliability reputation;
- current context.

Domain trust is a contextual modifier, not eight more permanent mandatory bars. Only meaningful exceptions need storage.

# 9. Familiarity and Contact History

Familiarity measures how much personal history the subject has with the target.

## 9.1 Familiarity Sources

Familiarity increases from:

- meaningful conversations;
- shared work or travel;
- living in the same household;
- recurring workplace contact;
- combat or crisis participation;
- companion time;
- teaching or mentoring;
- repeated trade/service contact when personally conducted;
- festivals, ceremonies and social events;
- family history;
- correspondence where identity is known.

## 9.2 Anti-Spam Rule

Repeatedly starting and ending trivial dialogue cannot farm Familiarity indefinitely. Each social channel has a bounded contribution window.

Example balance-draft caps:

- trivial greetings: at most +0.5 familiarity per in-game day;
- ordinary conversation: +0.5 to +2 depending on novelty/context;
- meaningful shared activity: +1 to +4;
- major shared event: +2 to +8;
- household/companion long-term consolidation: scheduled rather than per-minute accumulation.

## 9.3 Familiarity Decay

Familiarity normally decays very slowly and only after long absence. It never erases major shared history. A known childhood friend does not become a stranger because the player explored another realm for several weeks.

A stored `familiarity_floor` may be established by milestones such as family, close friendship, rivalry, long companionship or partnership.

# 10. Trust and Distrust

Trust represents predicted reliability and safety.

## 10.1 Trust Sources

Trust can increase from:

- keeping promises;
- consistent truthful behaviour;
- protecting confidences;
- reliable aid;
- fulfilling responsibilities;
- returning borrowed/entrusted items through owning systems;
- competent care or protection;
- admitting uncertainty rather than pretending certainty;
- taking responsibility after mistakes;
- repeated alignment between words and actions.

Trust can decrease from:

- lying when discovered;
- broken commitments;
- betrayal;
- theft or exploitation;
- unsafe negligence;
- exposing secrets;
- contradictory behaviour;
- abandoning someone during a committed duty;
- knowingly manipulating a vulnerable person.

## 10.2 Expectation Violation

The same harm can damage Trust more when performed by someone already trusted. Betrayal is therefore not merely `harm_amount`.

A relationship event can apply an `expectation_violation_multiplier` based on:

- prior Trust;
- Loyalty/milestone;
- explicit promise;
- role responsibility;
- family/companion duty;
- known vulnerability.

## 10.3 Trust Recovery

Trust recovery is intentionally slower than gaining short-term Gratitude.

Recovery may require:

- accepted apology from 28E;
- restitution confirmed by Set 27 or another owner;
- repeated reliable behaviour;
- time without renewed harm;
- evidence correcting a false accusation through 28C;
- an authored reconciliation event;
- personality-specific forgiveness willingness.

There is no universal “wait three days and trust resets” rule.

# 11. Affection, Dislike and Attachment

Affection measures warmth and personal liking.

## 11.1 Affection Sources

Affection may grow through:

- enjoyable conversations;
- shared humour/interests;
- kindness;
- emotional support;
- long companionship;
- family care;
- compatible values and habits;
- celebration and shared positive events;
- accepted gifts that are personally meaningful;
- helping people the subject cares about.

It may fall through:

- cruelty;
- repeated disrespect;
- humiliation;
- betrayal;
- neglect of a close relationship;
- harm to family/friends;
- incompatible repeated behaviour;
- violating personally important commitments.

## 11.2 Affection Is Not Romance

Positive Affection can represent friendship, family love, mentorship, camaraderie or simple fondness. Romantic interest is a separate eligibility/milestone state described later.

## 11.3 Negative Affection

Negative Affection means dislike or aversion. It does not automatically mean hostility. A person may dislike someone but still trust their competence, obey lawful orders or work with them against a greater threat.

# 12. Fear and Perceived Threat

Fear is an unsigned measure of how threatening the target feels to the subject.

## 12.1 Fear Sources

Fear can rise from:

- witnessed violence;
- threats/intimidation resolved by 28E;
- conquest or coercion;
- overwhelming power displays;
- unpredictable harmful behaviour;
- rumours believed through 28C;
- harm to family or allies;
- imprisonment or captivity;
- repeated ability to evade consequences.

## 12.2 Fear Decay

Fear can reduce through:

- long absence without threat;
- demonstrated restraint;
- protection from the feared target;
- changed power circumstances;
- reassurance accepted through 28E;
- evidence that a feared rumour was false;
- safety/support from others.

Severe trauma handling is outside this system; Set 29 and narrative systems may expose relevant condition/context.

## 12.3 Fear Is Not Loyalty

> **Locked Fear Rule**  
> Fear may produce avoidance, compliance, surrender or guarded behaviour. It never directly increases Loyalty or Trust. A conquered settlement may obey while actively resenting, resisting or planning escape.

This preserves the NPC Village System rule that fear-based obedience is not stable morale or genuine trust.

# 13. Loyalty and Commitment

Loyalty represents willingness to maintain a relationship commitment and support the target at personal cost.

## 13.1 Loyalty Sources

Loyalty generally requires history. It may grow through:

- reciprocal protection;
- dependable long-term partnership;
- shared hardship;
- mutual commitments honoured over time;
- mentoring or family bonds;
- companion service;
- standing by the subject during unpopular or dangerous moments;
- sacrifice that the subject recognises and values.

## 13.2 Loyalty Is Personal

Interpersonal Loyalty is not the same as:

- faction allegiance;
- government legitimacy;
- employment contract;
- military command authority;
- fear-based compliance.

Those systems may influence context, but personal Loyalty remains a 28D relationship dimension.

## 13.3 Loyalty Floors

Major mutual milestones may establish soft loyalty floors, such as:

- close companion;
- sworn ally;
- committed partner;
- long-term family bond.

A floor is not immunity from betrayal. Severe events can break it, but ordinary absence should not erase it.

# 14. Respect and Contempt

Respect measures esteem rather than affection.

Respect can arise from:

- demonstrated competence;
- courage;
- integrity;
- expertise;
- leadership;
- keeping difficult promises;
- culturally valued behaviour;
- mercy or restraint;
- intellectual or magical achievement;
- honourable rivalry.

Respect can decrease through:

- cowardice where the subject personally values courage;
- incompetence in an entrusted role;
- hypocrisy;
- humiliation;
- broken codes;
- reckless leadership;
- repeated empty boasting.

Personality and culture may weight these events, but no culture forces every individual to react identically.

# 15. Gratitude and Reciprocity Pressure

Gratitude tracks an active sense that the target benefited the subject or someone they care about.

## 15.1 Gratitude Sources

- rescue;
- healing/care after Set 29 confirms outcome;
- food/shelter during crisis;
- meaningful gift;
- debt forgiveness or economic support confirmed by Set 27;
- defending family;
- completing a personally important request;
- returning lost property;
- public defence of reputation;
- helping a settlement during danger when personally relevant.

## 15.2 Gratitude Decay

Gratitude normally decays faster than Trust or Affection because it represents active reciprocity pressure. It can convert into longer-term Trust/Affection when followed by reinforcing behaviour.

Suggested balance-draft decay:

- routine gratitude: 10-25% toward zero per 30 in-game days;
- major rescue/debt: 2-10% per 30 days;
- life-changing gratitude: may become milestone-anchored and persist as a social-memory imprint.

Actual values are data-profiled and test-tuned.

## 15.3 No Gift Farming

A gift produces a social effect only after Set 27/inventory authority confirms transfer. Repeated identical gifts have diminishing returns. Gifts that are insulting, inappropriate, excessive, coercive or culturally problematic may create no positive effect or may create suspicion/grievance.

# 16. Grievance, Resentment and Unresolved Harm

Grievance represents unresolved resentment toward a target.

## 16.1 Grievance Sources

- physical harm;
- theft;
- betrayal;
- humiliation;
- abandonment;
- broken promises;
- harm to loved ones;
- destruction of home or livelihood;
- conquest or coercion;
- disrespect of important values;
- exposing secrets;
- unfair blame;
- accepted belief in wrongdoing even if later disproven.

## 16.2 Grievance Severity

Grievance event profiles include:

- severity;
- intentionality;
- responsibility certainty;
- personal relevance;
- relationship expectation;
- irreversibility;
- restitution potential;
- forgiveness profile;
- decay policy.

## 16.3 Grievance Does Not Equal Legal Guilt

A person can hold a grievance based on a mistaken belief. The legal system may find someone innocent while the victim remains emotionally angry. Conversely, a legal offence may create little personal grievance if no specific person feels harmed.

# 17. Relationship Event Interpretation Pipeline

Every relationship change passes through a bounded interpretation pipeline.

## 17.1 Event Input

A `RelationshipEventInput` contains:

- source event ID;
- subject person;
- target person;
- event family;
- event severity;
- direct/indirect impact;
- intentionality/responsibility metadata where known;
- relevant belief/proposition ID;
- confidence from 28C;
- affected household/ally references;
- context tags;
- authored override flags where permitted.

## 17.2 Impact Resolution

A conceptual balance formula is:

`impact = base × belief_confidence × personal_relevance × responsibility × expectation × personality × repetition × context`

This is not a final implementation signature. It communicates the intended factors.

### Base

Definition-level expected social meaning.

### Belief Confidence

A person who only weakly believes a rumour receives a smaller relationship impact than a direct confident witness.

### Personal Relevance

Direct harm/help is stronger than distant abstract consequence. Harm to a close family member can be highly relevant.

### Responsibility

Accident, negligence, intentional act and coerced act may be interpreted differently.

### Expectation

Betrayal by a trusted ally is more damaging than equivalent harm from a known enemy.

### Personality

Forgiveness, empathy, loyalty tendency and conflict sensitivity adjust impact without becoming deterministic scripts.

### Repetition

Repeated identical low-value events yield diminishing returns.

### Context

War, emergency, law, culture, prior agreement and role duty can change interpretation.

## 17.3 Dimension Delta Profiles

One event may affect several dimensions.

Example: **Rescue from mortal danger**

- Trust +6 to +14;
- Affection +2 to +8;
- Gratitude +15 to +35;
- Respect +2 to +10;
- Fear may decrease if the rescuer was previously feared and acted protectively;
- Familiarity +2 to +6.

Example: **Discovered deliberate betrayal by close ally**

- Trust -20 to -60;
- Affection -5 to -30;
- Loyalty -10 to -50;
- Respect -5 to -25;
- Grievance +20 to +60;
- Familiarity usually unchanged or increased slightly because history deepens.

All values are balance drafts and are capped by current state and event profile.

# 18. Social-Memory Imprints and Evidence Links

28D does not duplicate 28C belief records or the underlying world event. Instead it stores **relationship interpretations** linked to them.

## 18.1 SocialMemoryInterpretationRecord

Suggested fields:

- interpretation_id;
- subject_person_id;
- target_person_id;
- source_event_id;
- proposition_or_belief_id;
- relationship_event_profile_id;
- emotional tags;
- original dimension deltas;
- current retained weight;
- significance;
- consolidation state;
- reappraisal policy;
- created_at;
- last_recalled_at where useful;
- visibility/debug policy.

## 18.2 Memory Significance Bands

| Band | Examples | Persistence |
| --- | --- | --- |
| Routine | Pleasant chat, ordinary fair trade | Usually consolidated or forgotten. |
| Meaningful | Helped with request, shared trip, public praise | Persists while relationship remains relevant. |
| Major | Rescue, severe betrayal, important mentorship, family support | Long-term persistent. |
| Defining | Marriage, death of loved one, liberation, murder, conquest, lifelong oath | Normally permanent unless authored transformation applies. |

## 18.3 Recall Does Not Reapply Deltas

Remembering or mentioning an event in dialogue never reapplies its original relationship delta. The relationship effect is committed once unless a later event explicitly changes interpretation.

# 19. Belief Revision, Correction and Relationship Reappraisal

28C can change a person's confidence or stance toward a proposition. 28D must respond without pretending emotional history never happened.

## 19.1 False Accusation Example

1. NPC believes Player stole medicine with confidence 0.85.
2. Grievance rises and Trust falls.
3. NPC publicly accuses Player; this creates real additional social events.
4. Later evidence proves another person committed the theft.
5. 28C updates belief.
6. 28D reappraises the original theft impact and may restore some Trust/reduce Grievance.
7. The public argument, embarrassment and any harm caused during the accusation remain real events and are not erased.

## 19.2 Reappraisal Factors

- new confidence;
- reason the belief changed;
- whether the target helped reveal the truth;
- how long the false belief persisted;
- actions taken because of the belief;
- personality/forgiveness;
- apology or reconciliation outcome.

## 19.3 No Perfect Rollback

The default is **reappraisal, not rewind**.

# 20. Repetition, Saturation and Relationship-Farming Protection

The player should build relationships through meaningful behaviour, not by repeating the cheapest action hundreds of times.

## 20.1 Diminishing Returns

Each relationship event profile can define:

- repeat family;
- repeat window;
- first-impact multiplier;
- saturation curve;
- daily/weekly cap;
- reset conditions;
- novelty exceptions.

## 20.2 Repetition Examples

- Greeting the same person 50 times does not create friendship.
- Buying a cheap item repeatedly does not create deep Trust.
- Giving 100 identical flowers does not force romance.
- Saving the same person from genuinely distinct dangerous events can remain meaningful because each event is high significance.
- Long-term consistent work or care can accumulate through scheduled consolidation rather than spammed micro-events.

## 20.3 Negative Events Are Not Easily Farm-Protected

Diminishing returns primarily prevent positive exploit loops. Repeated harmful behaviour may continue to worsen Grievance or establish a persistent negative milestone.

# 21. Initial State, Social Priors and Relationship Seeding

## 21.1 Strangers Begin Personally Neutral

Ordinary strangers normally begin with:

- Familiarity 0-5;
- Trust around 0;
- Affection around 0;
- Fear 0 unless contextual threat exists;
- Loyalty 0;
- Respect around 0;
- Gratitude 0;
- Grievance 0.

They may still react strongly to:

- faction/culture standing;
- visible role/status;
- public reputation;
- current war or law;
- known rumours;
- threat context;
- disguise/identity certainty.

These are **contextual priors**, not prefilled personal hatred or friendship.

## 21.2 Generated Prior Relationships

World generation or population simulation may create pre-existing relationships such as:

- siblings;
- parent/child;
- friends;
- rivals;
- mentors/apprentices;
- partners/spouses;
- old enemies;
- former companions;
- workplace associates.

Such edges use a `RelationshipSeedProfile` that creates believable history ranges and optionally synthetic pre-world-start memory references. Seed generation must remain deterministic and consistent with household/culture/world history.

## 21.3 Culture Is Not Personality

Culture may influence etiquette, expected family duties, acceptable courtship forms and what behaviours are publicly respected. It does not directly assign identical Affection, Trust or personality values to every member.

# 22. Social Personality and Relationship Pace

28D locks the relationship-facing personality facets anticipated by 28A.

## 22.1 Core Relationship Facets

Each persistent person's Social Personality Profile may include `0..100` values for:

- Sociability;
- Empathy/Helpfulness;
- Attachment Pace;
- Forgiveness Tendency;
- Loyalty Tendency;
- Conflict Sensitivity;
- Autonomy Need;
- Family Orientation;
- Expressiveness;
- Reciprocity Sensitivity;
- Suspicion/Caution;
- Competitive Drive.

These influence weights and pacing, not hard-scripted outcomes.

## 22.2 Trait Layer

Readable traits may sit above facets:

- warm;
- reserved;
- forgiving;
- grudge-holding;
- fiercely loyal;
- independent;
- competitive;
- conciliatory;
- protective;
- private;
- socially curious.

Traits are generated/authored combinations, not stereotypes based on ancestry.

## 22.3 Personality Cannot Override Consent or Facts

A highly affectionate or loyal personality does not make someone automatically accept romance, forgive murder, ignore law or abandon existing commitments.

# 23. Friendship and Close-Bond Milestones

Friendship is a social milestone layered over dimensions and history.

## 23.1 Suggested Friendship States

- Acquaintance;
- Familiar Associate;
- Friend;
- Close Friend;
- Confidant;
- Sworn Ally;
- Estranged Friend;
- Former Friend.

Not every relationship uses every state.

## 23.2 Friendship Eligibility

A Friend milestone may typically require:

- minimum Familiarity;
- positive Affection;
- non-hostile Trust;
- no unresolved severe Grievance blocking the state;
- sufficient meaningful positive history;
- a valid mutual social recognition event where appropriate.

Exact thresholds are profile-driven. Example balance-draft minimums might be Familiarity 35+, Affection +25+, Trust +15+, but these do **not** auto-create the milestone.

## 23.3 Mutual Recognition

Friendship can be asymmetrical in feeling, but a formal mutual milestone is only created after an accepted interaction or a systemically valid shared event recognises the bond.

A person can privately think of someone as a friend before the other person does.

## 23.4 Confidant

Confidant requires stronger Trust and history than Friend and can influence 28C disclosure eligibility. It never automatically exposes every secret.

# 24. Rivalry, Competition, Enmity and Respectful Opposition

Rivalry is a first-class social state rather than simply negative reputation.

## 24.1 Rivalry Styles

| Rivalry Style | Typical Pattern |
| --- | --- |
| Friendly Rival | Positive Affection, high Respect, competitive history, low Grievance. |
| Professional Rival | Neutral Affection, moderate/high Respect, repeated competition. |
| Bitter Rival | Negative Affection, high Familiarity, moderate/high Grievance. |
| Hostile Rival | Negative Trust/Affection, high Grievance, may include Fear. |
| Ideological Rival | Respect may vary; competition tied to values or faction goals. |

## 24.2 Rivalry Formation

Rivalry can form through:

- repeated competition;
- opposing leadership bids;
- trade/crafting/magic contests;
- conflicting quests;
- duels;
- faction or cultural disputes;
- professional comparison;
- mutual acknowledgement of competition.

A single loss does not normally create a lifelong rival.

## 24.3 Rivalry Benefits

Rivalry can unlock:

- challenge dialogue;
- competitions/events;
- training opportunities;
- mutual respect arcs;
- rivalry-specific quest branches;
- reconciliation or alliance under common threat.

## 24.4 Enmity

Enemy/Nemesis states are distinct from Rival. They normally require severe negative history, not simply competition.

# 25. Kinship, Family and Chosen-Family Bonds

28D represents the **social bond** of family while external owners retain demographic and legal truth.

## 25.1 Family Relationship Types

Potential social bond types include:

- parent;
- child;
- sibling;
- grandparent;
- grandchild;
- guardian;
- ward;
- adopted parent/child;
- spouse/partner;
- extended kin;
- clan kin where culture defines it;
- chosen family;
- former family-by-partnership where socially relevant.

The underlying biological/adoption/legal facts must come from Document 07/13/event authority.

## 25.2 Family Does Not Guarantee Positive Relationship

A family edge can contain:

- love and trust;
- affection with conflict;
- estrangement;
- fear;
- rivalry;
- grievance;
- deep loyalty;
- indifference after long separation.

The relationship type provides context and event relevance, not an automatic positive score.

## 25.3 Family Relevance Multipliers

Events affecting close family may receive stronger personal relevance based on actual bond strength.

Harm to a sibling with whom an NPC is estranged may matter less than harm to a non-relative lifelong friend. **Relationship quality is more important than the kinship label alone.**

# 26. Family Support, Conflict, Care and Household Consequence

## 26.1 Family Support Events

Relationship events may arise from:

- providing food/shelter in crisis;
- caring during illness;
- helping with children/elders where relevant;
- protecting home;
- supporting important ceremonies;
- helping a family member's work or education;
- defending reputation;
- sharing inheritance responsibly;
- rebuilding after disaster.

Underlying resources and care outcomes remain externally owned.

## 26.2 Family Conflict

Potential causes include:

- inheritance disputes;
- conflicting loyalties;
- neglect;
- dangerous behaviour;
- faction allegiance;
- marriage/partnership disputes;
- cultural disagreement;
- betrayal or crime;
- unequal burden or perceived unfairness.

28D owns relationship consequences, while law/property/event systems own external resolution.

## 26.3 Household Change

When Document 07 changes household membership because of marriage, separation, death, migration or adoption, 28D receives the event and updates relationship context. It does not move beds, create residents or change population counts itself.

# 27. Romance Eligibility, Interest and Adult-Only Consent Rules

Romance is optional social content and must be mechanically separated from general Affection.

> **Locked Adult-Only Rule**  
> Romantic interest, courtship, partnership and marriage systems are available only when every participating persistent person is in an adult life stage as reported by the owning life-stage system. Child or adolescent life-stage actors may have family, friendship and age-appropriate social bonds but are never romance targets.

## 27.1 RomanceEligibility()

A romantic action checks:

- adult life stage for all participants;
- participant autonomy and availability;
- individual romance preference profile;
- existing commitment boundaries;
- prohibited kinship from the owning kinship/law definition;
- current captivity/coercion/authority context;
- culture/law restrictions where applicable;
- relationship context;
- active severe grievance/fear where relevant;
- player/world content settings;
- authored story locks only where explicitly justified.

## 27.2 Affection Is Necessary Only Where Defined

Some characters may develop attraction early; others require friendship and trust. The system supports different pacing profiles. A high Affection score never forces romantic eligibility.

## 27.3 No Coercive Romance

Romantic escalation is blocked or invalid when:

- the target is captive or otherwise unable to freely consent;
- the action is an intimidation/threat route;
- fear is the only source of compliance;
- a gameplay authority relationship makes consent invalid under the person's/culture's rule profile;
- the participant has already refused and the refusal cooldown/boundary remains active.

Repeated unwanted advances can create Grievance.

# 28. Courtship and Romantic Relationship Progression

## 28.1 Suggested States

- No Romantic Context;
- Possible Interest;
- Expressed Interest;
- Mutual Interest;
- Courtship/Dating equivalent;
- Committed Partner;
- Engaged/Betrothed where culture uses it;
- Married/Recognised Union;
- Separated;
- Former Partner.

Culture may rename or omit stages.

## 28.2 Progression Rule

Each escalation requires:

1. current eligibility;
2. valid relationship context;
3. an explicit social action/event;
4. mutual acceptance;
5. authoritative commitment;
6. follow-up relationship/milestone state.

There is no silent transition from `Affection 76` to `Romantic Partner`.

## 28.3 Courtship Content

Courtship can involve:

- conversations;
- shared activities;
- festivals;
- culturally meaningful gestures;
- gifts confirmed by economy/inventory;
- helping with personal goals;
- meeting family/community;
- travel/adventure;
- ritual or ceremony preparation.

None is universally required unless the relevant culture/individual profile says so.

## 28.4 Rejection

Rejection is a valid outcome and does not need to create hostility. UI/dialogue should provide a respectful reason category where appropriate without exposing hidden private preferences.

# 29. Partnership, Marriage and Cultural/Legal Recognition

## 29.1 Interpersonal Commitment vs Legal Recognition

28D owns:

- mutual partner commitment;
- marriage/union social milestone;
- relationship consequences of commitment;
- separation/reconciliation state.

Document 13/governance/event systems own:

- whether a culture or jurisdiction legally recognises the union;
- ceremony requirements;
- inheritance consequences;
- titles/property law;
- political marriage consequences;
- prohibited legal relationships;
- divorce law.

## 29.2 Marriage Is Not a Population Command

Marriage does not automatically:

- move households;
- create shared property;
- create children;
- merge inventories;
- change citizenship;
- change faction membership.

Owning systems respond to the committed relationship event according to their rules.

## 29.3 NPC-NPC Marriage

NPCs can form partnerships and marriages without the player when:

- the settlement simulation identifies plausible social opportunity;
- both persistent people are eligible;
- relationship history supports it;
- mutual acceptance is resolved;
- cultural/legal conditions are satisfied or an intentional non-recognised partnership is allowed;
- event budgets permit the transition.

The player is not the centre of every relationship.

# 30. Separation, Estrangement, Reconciliation and Changed Commitments

Relationships can change without requiring death or scripted quest endings.

## 30.1 Separation Causes

- mutual choice;
- repeated conflict;
- betrayal;
- incompatible goals;
- prolonged neglect where relevant;
- culture/faction pressure;
- migration;
- personal change;
- major world events.

## 30.2 Separation Is Not Score Reset

Former partners retain history. They may become:

- amicable former partners;
- friends;
- estranged;
- rivals;
- enemies;
- distant acquaintances.

## 30.3 Reconciliation

Reconciliation may require:

- contact;
- willingness from both parties;
- reduction or resolution of severe Grievance;
- accepted apology or negotiated repair through 28E;
- restitution where relevant;
- evidence correction;
- time and consistent behaviour;
- event/quest resolution for severe conflicts.

Reconciliation does not mean returning to the exact previous state.

# 31. Relationship Boundaries, Exclusivity and Commitment Conflict

Individuals can define relationship-boundary preferences through data rather than one universal social norm.

Potential commitment profiles may include:

- exclusive partnership;
- culturally permitted plural partnership;
- no formal partnership interest;
- temporary/seasonal courtship custom;
- political betrothal constraints;
- personal refusal of marriage despite romance.

28D stores the interpersonal commitment preference/state. Document 13 supplies cultural/legal norms. No default implementation should assume one culture's structure is universal.

Violating an agreed commitment can create Trust loss and Grievance **because a commitment was broken**, not because the game assumes jealousy as a universal trait.

# 32. Death, Grief, Mourning and Continuing Bonds

Document 07/16/29 owns death and health truth. 28D owns the relationship consequences of loss.

## 32.1 Relationship Effects of Death

A death can create:

- grief-related social-memory imprints;
- strengthened or damaged relationships with people seen as responsible;
- Gratitude toward rescuers/caregivers;
- Grievance toward killers or negligent parties where believed;
- family/companion milestone closure;
- memorial dialogue hooks;
- altered social priorities.

## 32.2 Mourning State

Mourning scheduling/presentation remains with NPC/event systems, but 28D can expose:

- lost_person_id;
- relationship closeness summary;
- unresolved grievance targets;
- memorial importance;
- relationship-linked dialogue topics.

## 32.3 Continuing Bonds

The dead person's relationship record may remain archived for history, family references, quests and memorials rather than being deleted.

# 33. Social Reputation and Community Perception

Relationship is personal. **Social reputation** is a shared expectation within a scope.

## 33.1 Reputation Scopes

- household;
- neighbourhood/community;
- settlement;
- culture/community network;
- faction-facing social reputation;
- travelling party/group where configured.

Political standing remains Document 13. Economic reputation remains Set 27.

## 33.2 Default Social-Reputation Dimensions

Registry-driven dimensions include a small default set:

- Reliability `-100..+100`;
- Benevolence `-100..+100`;
- Threat `0..100`;
- Prestige `0..100`;
- Social Integrity `-100..+100`.

These are public/community expectations, not personal relationship dimensions.

## 33.3 Reputation Requires Information Spread

A personal event can affect public reputation only if:

- witnesses observe it;
- a participant reports it;
- records/announcements publish it;
- an institution broadcasts it;
- 28C propagation makes it prevalent in the scope.

No instantaneous settlement-wide telepathy is allowed.

## 33.4 Reputation Labels

The system can produce earned labels such as:

- Reliable;
- Oathbreaker;
- Village Defender;
- Cruel;
- Generous;
- Dangerous;
- Respected Craftsperson;
- Liberator;
- Conqueror;
- Untrustworthy Witness.

Labels require evidence/provenance and should remain scope-local.

# 34. Household, Settlement, Culture and Faction Spillover

## 34.1 Household Spillover

People may react to how the player treats someone they care about.

The effect uses:

- actual relationship between observer and affected person;
- what the observer knows/believes through 28C;
- event severity;
- personality;
- household/family context.

It is not a fixed `family member harmed = -20` rule.

## 34.2 Settlement Spillover

Settlement social reaction may change from:

- public rescue;
- repeated aid;
- conquest;
- theft;
- defence;
- betrayal;
- restoration;
- major leadership actions.

Individual residents can still disagree.

## 34.3 Culture/Faction Spillover

28D can expose social reaction inputs to Document 13. It does not change treaties, war state or territory.

# 35. Dialogue and Conversation Integration

28B may query 28D for:

- current relationship bands;
- active milestone tags;
- unresolved Grievance;
- Trust domain values;
- Affection/Fear/Loyalty/Respect;
- social reputation context;
- relationship-relevant memory summaries;
- recent relationship changes;
- romance/friendship action eligibility reason codes.

28B does not directly edit these values. It submits an authoritative social action that 28D interprets after commit.

## 35.1 Tone Is Presentation

A relationship can influence which tone/line variants are eligible, but relationship state does not require every line to be dynamically generated.

# 36. Knowledge, Rumour and Witness Integration

28C and 28D form a deliberate loop.

28C -> 28D:

- belief that an event occurred;
- confidence;
- provenance;
- witness identity certainty;
- secret disclosure/breach;
- reputation prevalence.

28D -> 28C:

- Trust/Familiarity for source credibility/disclosure;
- relationship milestone;
- reliability reputation;
- secrecy/bond context;
- social reason why a person may choose to tell someone.

## 36.1 Belief-Weighted Relationship Impact

A low-confidence rumour should not damage Trust as strongly as direct witnessed betrayal unless personality/context explicitly makes the subject highly credulous.

# 37. Persuasion, Negotiation and Diplomacy Hooks

28E consumes:

- Trust;
- Affection;
- Fear;
- Loyalty;
- Respect;
- Grievance;
- Familiarity;
- relevant relationship milestone;
- social reputation;
- relationship-specific history.

28E may return:

- accepted apology;
- successful reassurance;
- intimidation outcome;
- negotiated concession;
- perceived insincerity;
- refusal;
- social offence.

28D then applies relationship consequences. This prevents circular formulas where persuasion secretly changes its own input before resolution.

# 38. Economy, Survival and Movement Interface Integration

## 38.1 Set 27 - Economy

28D may consume confirmed events such as:

- gift delivered;
- contract honoured/breached;
- wage paid/unpaid;
- debt forgiven;
- theft confirmed;
- exploitative terms discovered;
- fair trade/aid contribution.

28D may expose relationship/reputation modifiers back to Set 27, but Set 27 alone calculates prices, wages, availability and financial outcomes.

## 38.2 Set 29 - Survival

28D may consume:

- treatment provided;
- rescue from injury/illness;
- abandonment while incapacitated;
- care outcome;
- death/recovery facts.

Set 29 remains health authority.

## 38.3 Set 30 - Movement

28D may influence willingness to:

- accompany;
- share travel;
- accept passenger assignment;
- remain with party;
- travel to reconcile/visit family.

Set 30 owns whether and how movement physically occurs.

# 39. Companion, Recruitment and Delegation Hooks

28F may use 28D to determine:

- whether a person is willing to discuss recruitment;
- current loyalty potential;
- friendship/commitment context;
- severe Grievance blockers;
- fear-based compliance warnings;
- relationship with current companions;
- relationship to household/faction obligations.

## 39.1 Companion Loyalty

Once recruited, personal Loyalty remains a 28D dimension while 28F owns the companion state and behaviour contract.

A companion may remain recruited while Loyalty is low, but 28F can use that state for refusal, departure, negotiation or betrayal risk according to its own rules.

## 39.2 Delegation

28G task outcomes such as fulfilled promise, abandonment, reckless endangerment or successful rescue can produce 28D relationship events.

# 40. Quest, Event, Story and World-History Integration

Relationships are important quest/event conditions but never own quest state.

Document 15 may query:

- Friend/Close Friend status;
- rivalry;
- partner/marriage;
- family bond;
- Trust/Grievance thresholds;
- social reputation label;
- relationship change event;
- reconciliation/separation;
- death of close relation.

Document 15 may emit:

- wedding event;
- funeral;
- reconciliation scene;
- rivalry challenge;
- family dispute;
- betrayal;
- companion loyalty test;
- public accusation;
- relationship-specific personal quest.

28D records social consequences after authoritative event transitions.

# 41. NPC Schedules, Social Opportunities and Autonomous Relationship Change

NPC relationships should evolve without requiring player involvement.

## 41.1 Social Opportunity Sources

Document 07 can expose opportunities from:

- shared household time;
- workplace overlap;
- meals;
- worship/community gatherings;
- festivals;
- patrols;
- training;
- shared travel;
- crisis response;
- mourning;
- tavern/community spaces;
- neighbour contact.

28D determines whether a bounded social interaction produces relationship change.

## 41.2 No Constant Pairwise Simulation

The game does not run relationship updates for every nearby pair every tick.

Instead:

- schedules create candidate contacts;
- high-value social events are committed;
- repeated routine contact can be batch-consolidated;
- important edges receive more detail;
- strangers can remain stateless until meaning emerges.

## 41.3 Autonomous Friendship/Rivalry/Romance

NPC-NPC milestones may occur through scheduled checks based on actual contact and history. The simulation should avoid sudden unexplained marriages between residents who never interacted.

# 42. Simulation LOD and Distant Relationship Resolution

## 42.1 Relationship LOD Tiers

| Tier | Representation |
| --- | --- |
| L0 - Immediate | Full relationship query, conversation, event interpretation and visible social interaction. |
| L1 - Local Reduced | Persistent important edges; scheduled social contact at reduced cadence. |
| L2 - Settlement Summary | Household/work/community contact batches; only meaningful deltas committed. |
| L3 - Regional Abstract | Preserve family/partner/companion/rival/quest edges; process major events and sparse contact summaries. |
| L4 - Dormant Archive | Persist milestones, defining memories and important dimension values; no routine decay loops. |

## 42.2 Distant Catch-Up

Catch-up uses elapsed simulation time and bounded event summaries.

It may process:

- household contact consolidation;
- long-term companion absence;
- major birth/death/migration/war events supplied externally;
- unresolved commitment consequences;
- slow gratitude/fear/grievance decay;
- authored relationship events.

It never simulates every missing conversation.

## 42.3 Promotion

When an NPC returns to active simulation, their actor is reconstructed from the same persistent relationship record. No relationship reset occurs because the actor was unloaded.

# 43. Multiplayer Authority and Shared Social Consequence

## 43.1 Separate Player Relationships

Each NPC can hold distinct relationships toward Player A, Player B and Player C.

One player's kindness does not automatically give every player the same personal Trust.

## 43.2 Group Reputation

Party or settlement reputation can influence first impressions/context when 28C has propagated the relevant information, but it remains separate from personal history.

## 43.3 Shared Actions

For a group action such as defending a village, relationship impact may be allocated from contribution records:

- direct rescuer receives strong personal impact;
- visible helpers receive proportional impact;
- absent party members receive none unless the community credits the whole group through information/reputation rules.

## 43.4 Commitment Authority

Friendship recognition, recruitment, romance, partnership, marriage and separation commits are server-authoritative.

A multiplayer race condition cannot allow two mutually exclusive commitments to be simultaneously accepted. The authoritative commit revalidates all participants and current commitment state.

## 43.5 Player-Player Relationship Features

The system may support player-player social ceremonies or relationship labels later, but they are not required for core Set 28. Any such feature must be explicit mutual opt-in and must never infer real-world relationships between users.

# 44. UI, Accessibility, Privacy and Player Readability

## 44.1 Relationship Summary UI

Ordinary UI should emphasise:

- relationship milestone;
- broad observable bands;
- recent meaningful causes;
- known unresolved issues;
- public social reputation;
- available relationship actions.

Example:

**Mara - Close Friend**  
Trusted • Warm • Grateful  
Recent: “You protected her household during the Ashfall raid.”  
Concern: “You broke your promise to return before the festival.”

## 44.2 Hidden Information

UI must not reveal:

- hidden romantic preference unless disclosed;
- secret grievance source the player character does not know;
- exact internal fear if no observable/known basis exists;
- objective truth behind a false belief;
- raw personality values by default;
- future betrayal probability.

## 44.3 Accessibility

Accessibility may provide:

- clearer social cue labels;
- explicit tone tags where enabled;
- stronger confirmation for irreversible social commitments;
- reduced ambiguity mode for important consent/refusal states;
- readable relationship-cause history;
- non-colour relationship indicators;
- screen-reader labels;
- simplified relationship summaries.

Accessibility never changes consent requirements or reveals hidden objective truth unless a gameplay setting explicitly changes the rules.

## 44.4 No Romance Penalty for Opt-Out

World/player settings may disable or minimise romance presentation. Doing so must not block core progression, settlement growth or companion viability.

# 45. Persistence, Save/Load, Migration and Versioning

## 45.1 Persistent Minimum

Important relationship records persist:

- subject/target IDs;
- core dimension values;
- milestone IDs/states;
- retention flags;
- significant interpretation/memory references;
- trust-domain exceptions;
- commitment/boundary state;
- last meaningful contact time;
- decay/consolidation version;
- relationship schema version.

## 45.2 Save Safety

- Relationship mutation is atomic with the committed relationship event.
- A save cannot contain a marriage milestone referencing a missing person without migration/fallback handling.
- Deleted content definitions require aliases or controlled fallback.
- Major relationship events should be journalled for recovery where technical architecture supports it.

## 45.3 Migration

If balance values change, existing relationship state is not blindly replayed from all historical events. Migration uses explicit version rules.

Possible migration strategies:

- preserve canonical value and reinterpret bands;
- map old dimensions to new ranges;
- rebuild only from retained defining memories when explicitly safe;
- mark an edge for controlled recomputation in development builds.

# 46. Registries, Naming and Data Templates

## 46.1 Definition Families

Proposed canonical families:

- `social.relationship.dimension.*`
- `social.relationship.event.*`
- `social.relationship.decay_profile.*`
- `social.relationship.trust_domain.*`
- `social.relationship.milestone.*`
- `social.relationship.friendship.*`
- `social.relationship.rivalry.*`
- `social.relationship.family_bond.*`
- `social.relationship.romance_profile.*`
- `social.relationship.commitment.*`
- `social.relationship.reputation_dimension.*`
- `social.relationship.seed_profile.*`
- `social.relationship.reason.*`

## 46.2 Relationship Edge Record

Suggested fields:

| Field | Purpose |
| --- | --- |
| relationship_id | Stable directed edge identity. |
| subject_person_id | Person who holds the relationship. |
| target_person_id | Person the relationship concerns. |
| trust | -100..100. |
| affection | -100..100. |
| fear | 0..100. |
| loyalty | 0..100. |
| respect | -100..100. |
| gratitude | 0..100. |
| grievance | 0..100. |
| familiarity | 0..100. |
| trust_domain_overrides | Sparse contextual trust values. |
| milestone_ids | Active relationship milestone records. |
| retained_interpretation_ids | Important social-memory links. |
| familiarity_floor | Long-term familiarity anchor. |
| retention_class | transient / persistent / defining. |
| last_meaningful_contact_at | LOD/decay reference. |
| version | Schema and balance migration. |

## 46.3 Relationship Impact Record

- impact_id;
- relationship_id;
- source_event_id;
- source_belief_id;
- event_profile_id;
- applied deltas;
- confidence multiplier;
- personal relevance;
- expectation multiplier;
- repetition multiplier;
- committed_at;
- reappraisal_state;
- reason codes.

## 46.4 Milestone Record

- milestone_instance_id;
- milestone_definition_id;
- participant_ids;
- directionality/mutuality;
- started_at;
- ended_at if ended;
- originating action/event;
- external legal/cultural recognition references if relevant;
- status;
- history notes/reference IDs.

# 47. Diagnostics, Validation and Automated Test Strategy

## 47.1 Definition Validation

Validators must detect:

- invalid dimension range;
- missing event profile;
- milestone referencing undefined condition;
- romance milestone lacking adult-life-stage requirement;
- mutual commitment without mutual acceptance requirement;
- event profile that directly creates Set 27/29/30 state;
- gift profile that bypasses item-transfer authority;
- fear event that directly increases Loyalty without explicit independent cause;
- family bond that creates household membership;
- marriage milestone that directly changes inheritance/property;
- duplicate canonical IDs;
- unbounded repetition multiplier;
- permanent positive farm from trivial event;
- missing migration path.

## 47.2 Runtime Invariants

- dimensions remain within canonical bounds;
- no relationship references deleted person without valid archive/tombstone treatment;
- relationship event commits at most once per event/subject/target unless explicitly repeatable;
- recalled memory does not reapply impact;
- mutual milestones contain consistent participant records;
- romance participants remain adult at creation time;
- fear does not silently become loyalty;
- distant catch-up does not create impossible contacts;
- server remains authoritative in multiplayer.

## 47.3 Test Families

Required automated/deterministic tests include:

- directed-edge asymmetry;
- rescue relationship impact;
- betrayal expectation multiplier;
- false-rumour grievance then correction reappraisal;
- repeated-gift saturation;
- long absence preserving close friendship;
- fear compliance without loyalty gain;
- friendly rivalry formation;
- rival-to-friend evolution;
- family harm spillover weighted by actual bond;
- adult-only romance eligibility;
- rejection cooldown and no forced commitment;
- marriage event without automatic household/property mutation;
- NPC-NPC autonomous friendship and partnership;
- death archiving and grief links;
- public reputation requiring information propagation;
- multiplayer separate player relationships;
- LOD promotion/demotion preserving milestones;
- migration between schema versions.

## 47.4 Developer Inspector

A development-only relationship inspector should show:

- edge values;
- player-facing bands;
- active milestones;
- trust-domain overrides;
- recent impact records;
- retained social-memory interpretations;
- source event/belief IDs;
- decay profile;
- last contact;
- retention class;
- pending milestone eligibility;
- reason codes.

This inspector must not ship as unrestricted player omniscience.

# 48. Production Scope and Staged Delivery

## 48.1 Foundation

Implement first:

- directed RelationshipRecord;
- eight core dimensions;
- simple event-impact profiles;
- relationship queries;
- evidence/belief links;
- qualitative UI summary;
- save/load;
- basic friendship milestone;
- basic social-reputation scope;
- deterministic tests.

## 48.2 Core Production

Then add:

- personality pacing;
- trust domains;
- grievance/reconciliation;
- rivalry styles;
- family impact weighting;
- NPC-NPC relationship opportunities;
- romance eligibility/courtship/partnership;
- marriage commitment and external recognition hooks;
- death/grief integration;
- distant LOD and catch-up;
- multiplayer authority.

## 48.3 Expanded Production

Later add:

- richer relationship milestone families;
- culture-specific courtship/ceremony profiles;
- advanced chosen-family/mentor bonds;
- expanded community reputation labels;
- relationship-driven ambient behaviour;
- authored long-form companion arcs;
- mod/content-pack extension after Set 25 governance permits it.

## 48.4 POC Position

The current POC already proves basic named villagers, reputation, memories and persistent consequences. 28D is a **post-POC production system**. Forest Hamlet may be used as a regression scenario but no final rule may depend on its fixed roster.

# 49. 28D Acceptance Criteria

28D is acceptable when all of the following are true:

1. Relationships are directed and multidimensional.
2. Trust, Affection and Respect use signed -100..100 ranges.
3. Fear, Loyalty, Gratitude, Grievance and Familiarity use 0..100 ranges.
4. Raw numbers are not required in normal UI.
5. Fear cannot create Loyalty or Trust by itself.
6. Friendship and rivalry are validated milestones, not one-score thresholds.
7. Rivalry supports friendly/respectful forms.
8. Family bonds consume external household/kinship truth rather than redefining population state.
9. Romance is separate from Affection.
10. Romance/courtship/marriage are adult-only and require mutual consent.
11. Gifts cannot purchase romance or override refusal.
12. Marriage does not automatically move households, transfer property or create children.
13. Relationship changes link to authoritative events and/or 28C belief state.
14. False beliefs can cause real relationship effects and later reappraisal.
15. Significant memories persist without being reapplied on recall.
16. Repetitive trivial positive actions have diminishing returns.
17. Major long-term bonds do not decay to neutrality merely because actors are distant.
18. Social reputation requires information spread and remains distinct from personal relationship.
19. NPC-NPC relationships use the same system without all-pairs simulation.
20. Multiplayer keeps player-specific relationships distinct.
21. Save/load and LOD preserve important edges, milestones and memory interpretations.
22. Relationship state does not mutate economy, health, movement, quest or political state directly.
23. Cross-set ownership remains compatible with the governing interface register.

# 50. Open Questions Assigned to Later Documents

| Question | Owner |
| --- | --- |
| Exact persuasion/apology/reassurance/intimidation formulas | 28E |
| Which relationship dimensions modify each social action and by how much | 28E |
| Companion recruitment thresholds and loyalty consequences | 28F |
| Companion departure/betrayal/refusal policy | 28F |
| Delegation promise/obligation relationship effects | 28G |
| AI-assisted relationship-aware dialogue wording | 28H |
| Final player-facing relationship screens, icons and voice/animation cues | 28I |
| Final Godot classes/resources, replication and persistence implementation | 28J |
| Economy impact of social reputation/relationship | Set 27 |
| Biological reproduction, pregnancy, health and care rules | Document 07 / Set 29 / relevant biology owner |
| Legal marriage, inheritance, title/property consequences | Document 13 / governance owner |
| Physical cohabitation and household reassignment | Document 07 |
| Travel/following and visit path resolution | Set 30 |
| Quest/event pacing of weddings, funerals and reconciliation arcs | Document 15 |
| Final content ratings/settings for romance presentation | 28I / project governance |

# 51. Cross-Set Interface Amendments

## 51.1 Status

**No new mandatory Set 27-30 ownership transfer or interface amendment is required by 28D v0.1.**

28D consumes the existing governing interfaces and the additions already proposed by 28A:

- Set 27 provides contracts, prices, wages, merchant/economic facts and confirmed economic outcomes;
- Set 29 provides injury, illness, fatigue and recovery facts;
- Set 30 provides travel, following, seating and formation/travel state.

If implementation requires a typed historical-event query rather than an emitted event payload, that should be proposed during final cross-set reconciliation rather than defined unilaterally here.

## 51.2 Internal Set 28 Relationship API

28D exposes the conceptual **Relationship API** required by 28B-28J:

- `RelationshipLevel(subject, target)`
- `RelationshipView(subject, target, context)`
- `Trust(subject, target, domain=general)`
- `Affection(subject, target)`
- `Fear(subject, target)`
- `Loyalty(subject, target)`
- `Respect(subject, target)`
- `Gratitude(subject, target)`
- `Grievance(subject, target)`
- `Familiarity(subject, target)`
- `RelationshipMilestones(subject, target)`
- `RelationshipHistorySummary(subject, target, knowledge_scope)`
- `SocialReputation(scope, target, dimension)`
- `CanFormMilestone(subject, target, milestone, context)`
- `RomanceEligibility(subject, target, context)`
- `ApplyRelationshipEvent(event_input)`
- `ReappraiseRelationshipImpact(impact_id, belief_revision)`
- `RelationshipReasonCodes(subject, target, context)`

Exact runtime signatures, data classes and networking implementation belong to 28J/current technical implementation.

# Appendix A. Relationship Definition and Runtime Record Catalogue

| Record | Type | Owner | Purpose |
| --- | --- | --- | --- |
| `RelationshipDimensionDefinition` | Immutable definition | 28D | Meaning, range, bands and default behaviour of a dimension. |
| `RelationshipEventProfile` | Immutable definition | 28D | Maps an event family to dimension impact and modifiers. |
| `RelationshipDecayProfile` | Immutable definition | 28D | Controls transient decay/consolidation. |
| `TrustDomainDefinition` | Immutable definition | 28D | Optional contextual trust domain. |
| `RelationshipMilestoneDefinition` | Immutable definition | 28D | Eligibility/mutuality/retention rules. |
| `RelationshipSeedProfile` | Immutable definition | 28D | Creates deterministic pre-existing social history. |
| `SocialReputationDimensionDefinition` | Immutable definition | 28D | Public social-reputation meaning/range. |
| `RelationshipRecord` | Mutable runtime | 28D | Directed current relationship state. |
| `RelationshipImpactRecord` | Mutable/audit runtime | 28D | Committed relationship change tied to cause. |
| `SocialMemoryInterpretationRecord` | Mutable persistent | 28D | Long-term relationship meaning linked to evidence/belief. |
| `RelationshipMilestoneRecord` | Mutable persistent | 28D | Active or historical friend/rival/family/partner state. |
| `SocialReputationRecord` | Mutable scope record | 28D | Shared community expectation after propagated evidence. |
| `BeliefRecord` | Mutable runtime | 28C | What an actor believes; consumed by 28D. |
| `HouseholdRecord` | Mutable runtime | Document 07 | Household membership and residence; consumed by 28D. |
| `LegalUnion/Inheritance State` | External | Document 13/governance | Legal effects; never owned by 28D. |

# Appendix B. Relationship Dimension and Band Tables

## B.1 Signed Bands

| Canonical Value | Trust | Affection | Respect |
| ---: | --- | --- | --- |
| -100..-76 | Profound distrust | Hatred/strong aversion | Contempt |
| -75..-41 | Distrust | Strong dislike | Low respect |
| -40..-16 | Wary | Mild dislike | Doubtful/dismissive |
| -15..+15 | Neutral/uncertain | Neutral | Neutral |
| +16..+40 | Cautious trust | Likes | Positive regard |
| +41..+75 | Trusted | Strong affection | Respected |
| +76..+100 | Deep trust | Deep attachment | Profound respect |

## B.2 Unsigned Bands

| Canonical Value | Fear | Loyalty | Gratitude | Grievance | Familiarity |
| ---: | --- | --- | --- | --- | --- |
| 0-10 | Calm | None | None | None | Stranger |
| 11-25 | Uneasy | Slight | Appreciative | Irritated | Recognised |
| 26-45 | Afraid | Moderate | Grateful | Resentful | Familiar |
| 46-65 | Strong fear | Loyal | Strong gratitude | Strong grievance | Well known |
| 66-85 | Very afraid | Very loyal | Deep gratitude | Severe grievance | Deep history |
| 86-100 | Terrified | Defining loyalty | Life-debt-like gratitude | Defining grievance | Lifelong/intimate familiarity |

`Life-debt-like gratitude` is social language only; it is not an economic debt owned by Set 27.

# Appendix C. Relationship Event Impact Template

```text
RelationshipEventProfile
id:
display_name:
event_family:
required_source_event_tags:
subject_role:
target_role:
base_deltas:
  trust:
  affection:
  fear:
  loyalty:
  respect:
  gratitude:
  grievance:
  familiarity:
personal_relevance_profile:
responsibility_profile:
expectation_violation_enabled:
belief_confidence_curve:
repeat_family:
repeat_window:
saturation_curve:
decay_or_consolidation_profile:
creates_memory_if_significance_at_least:
milestone_recheck_tags:
reason_codes:
cross_system_owner_notes:
```

# Appendix D. Friendship, Rivalry, Romance and Family Milestone Templates

## D.1 Friendship Milestone

```text
RelationshipMilestoneDefinition
id: social.relationship.milestone.friend
mutuality: reciprocal_recognition
minimum_familiarity: 35  # balance draft
recommended_affection: +25
recommended_trust: +15
blocking_grievance: severe
requires_social_action_or_event: true
retention_class: persistent
```

## D.2 Friendly Rival

```text
id: social.relationship.milestone.rival.friendly
minimum_familiarity: 30
requires_competitive_history: true
minimum_respect: +20
maximum_grievance: 45
hostility_required: false
retention_class: persistent
```

## D.3 Romantic Partnership

```text
id: social.relationship.milestone.partner.committed
adult_only: true
mutuality: explicit_mutual_acceptance
requires_romance_eligibility: true
requires_existing_interest_state: mutual_interest
requires_commitment_boundary_validation: true
fear_only_compliance_invalid: true
captivity_or_coercion_invalid: true
retention_class: defining
```

## D.4 Family Bond

```text
FamilyBondInterpretation
kinship_source: external
relationship_edge_required: true
positive_scores_guaranteed: false
family_event_relevance_uses_actual_bond: true
household_mutation_owner: Document 07
inheritance_owner: Document 13/governance
```

# Appendix E. Relationship Reason-Code Families

Suggested reason-code prefixes:

- `SOC_REL_AVAILABLE_*`
- `SOC_REL_BLOCKED_*`
- `SOC_REL_CHANGED_*`
- `SOC_REL_SATURATED_*`
- `SOC_REL_REAPPRAISED_*`
- `SOC_REL_FRIEND_*`
- `SOC_REL_RIVAL_*`
- `SOC_REL_FAMILY_*`
- `SOC_REL_ROMANCE_*`
- `SOC_REL_COMMITMENT_*`
- `SOC_REL_REPUTATION_*`
- `SOC_REL_LOD_*`

Example codes:

- `SOC_REL_BLOCKED_LOW_FAMILIARITY`
- `SOC_REL_BLOCKED_SEVERE_GRIEVANCE`
- `SOC_REL_BLOCKED_NOT_ADULT`
- `SOC_REL_BLOCKED_NO_MUTUAL_CONSENT`
- `SOC_REL_BLOCKED_EXISTING_COMMITMENT`
- `SOC_REL_BLOCKED_COERCIVE_CONTEXT`
- `SOC_REL_CHANGED_RESCUE_CONFIRMED`
- `SOC_REL_CHANGED_PROMISE_BROKEN`
- `SOC_REL_SATURATED_REPEAT_GIFT`
- `SOC_REL_REAPPRAISED_FALSE_ACCUSATION`
- `SOC_REL_RIVAL_FRIENDLY_FORMED`
- `SOC_REL_ROMANCE_INTEREST_DECLINED`
- `SOC_REL_COMMITMENT_MARRIAGE_RECOGNISED_SOCIAL`
- `SOC_REL_REPUTATION_NOT_PROPAGATED`

# Appendix F. Example Relationship Histories

## F.1 Rescue to Friendship

1. Player meets Lysa; Familiarity 3, other values neutral.
2. Player helps repair her workshop. Small Gratitude and Respect increase.
3. Player rescues Lysa during a raid. Major Gratitude, Trust and Affection increase.
4. Lysa learns the player also protected her sibling. Household relevance adds a separate impact.
5. Several meaningful conversations and shared work increase Familiarity.
6. A Friend recognition action becomes available.
7. Both accept the friendship milestone.
8. Player later fails a minor promise. Grievance rises, Trust falls slightly, but friendship persists.
9. An accepted apology repairs some Trust; history remains visible.

## F.2 False Rumour to Reconciliation

1. A false rumour says the player stole medicine.
2. NPC Deren believes it with confidence 0.7.
3. Trust decreases and Grievance increases.
4. Deren refuses a request and publicly confronts the player.
5. Evidence reveals the real thief.
6. 28C corrects Deren's belief.
7. 28D reappraises the theft impact, restoring much of the lost Trust.
8. Deren now holds embarrassment about the accusation and may apologise through 28E.
9. If the player accepts, reconciliation can create new positive history.

## F.3 Friendly Rival

1. Player and smith Arven repeatedly enter forging contests.
2. Both win and lose across events.
3. Respect and Familiarity grow; Affection becomes positive.
4. Competitive Drive and repeated contest history meet Rival eligibility.
5. They mutually recognise a friendly rivalry.
6. Rivalry unlocks challenge dialogue, training and special contest events.
7. A later crisis can convert rivalry into sworn alliance without deleting the rivalry history.

## F.4 Fear Without Loyalty

1. Player conquers a settlement violently.
2. Resident Sela develops Fear 82, Trust -70, Affection -60, Grievance 75, Loyalty 0.
3. She complies with a lawful/forced order because external authority and fear make refusal dangerous.
4. UI/debug systems must not call this “loyal”.
5. If the player later acts protectively and reforms rule, Fear may decline and Trust may slowly recover, but only through real history.

## F.5 Partnership Without Automatic Household Merge

1. Two adult NPCs develop mutual romantic interest.
2. They commit as partners.
3. 28D records partnership.
4. Document 07 evaluates whether/how their households change.
5. Document 13 evaluates legal recognition/ceremony/inheritance.
6. Quest/Event system may schedule a wedding or community celebration.
7. If housing is unavailable, the social commitment still exists; the settlement has a real infrastructure problem rather than the relationship being cancelled silently.

# Appendix G. Cross-System Responsibility Matrix

| System | Sends to 28D | Receives from 28D |
| --- | --- | --- |
| Document 07 NPC Village | Person IDs, household, life stage, social opportunities, migration, death | Relationship state, milestone events, social priorities/reaction context. |
| Document 13 Culture/Faction | Culture, law, kinship, political state, legal recognition | Social relationship/diplomacy reaction inputs; marriage social commitment events. |
| Document 15 Quest/Event | Event facts, authored social transitions | Relationship conditions, milestone/change events. |
| Document 16 Combat | Harm, rescue, surrender, death facts | Social aftermath/reaction facts. |
| 28B Dialogue | Committed social actions | Relationship context, eligibility, reason codes. |
| 28C Knowledge | Belief/confidence/provenance | Trust/familiarity/reputation for disclosure and credibility. |
| 28E Social Resolution | Accepted/rejected persuasion, apology, intimidation, negotiation | Relationship modifiers and resulting relationship effects. |
| 28F Companions | Recruitment/companion state and actions | Loyalty, trust, friendship, grievance, recruitment context. |
| 28G Delegation | Task fulfilment/failure/abandonment | Relationship consequences and obligation context. |
| Set 27 Economy | Confirmed gifts/contracts/economic events | Social modifiers/reputation inputs only. |
| Set 29 Survival | Injury/care/recovery events | Social care/reaction inputs only. |
| Set 30 Movement | Travel/following context | Willingness/relationship intent only. |
| UI/Presentation | Player inputs/presentation capability | Relationship view model and semantic events. |
| Persistence/Networking | Authority/save services | Canonical relationship records/events. |

# Appendix H. Glossary

**Affection** - Personal warmth, liking or emotional attachment; not automatically romance.  
**Directed Relationship** - A relationship state held by one person toward another, independently of the reverse direction.  
**Familiarity** - Depth of personal exposure/history with another person.  
**Fear** - Perceived threat from a target; not loyalty.  
**Gratitude** - Active sense of benefit received and social reciprocity pressure.  
**Grievance** - Unresolved social resentment toward a target.  
**Interpersonal Marriage State** - Mutual social commitment owned by 28D, distinct from external legal recognition.  
**Loyalty** - Willingness to maintain a personal bond and support the target at cost.  
**Milestone** - Validated persistent social state such as Friend, Rival, Partner or Married.  
**Relationship Edge** - Persistent directed record containing relationship dimensions from subject to target.  
**Relationship Event** - Authoritative social interpretation of an evidence-linked event that may change a relationship edge.  
**Relationship Farming** - Repetitive low-value actions used to exploit relationship gains; controlled through saturation and caps.  
**Respect** - Esteem for ability, principles, status or conduct.  
**Rivalry** - Persistent competitive social bond that may be friendly or hostile.  
**Social-Memory Interpretation** - 28D record describing the retained relationship meaning of an event/belief without replacing the underlying fact.  
**Social Reputation** - Scope-local shared expectation about a person created through propagated evidence, distinct from personal relationship and political/economic standing.  
**Trust** - Expectation that another person is reliable, honest, safe or will act as expected in a context.  
**Trust Domain** - Optional contextual exception describing trust in a specific type of responsibility.  
**Reappraisal** - Re-evaluation of a past relationship impact after the underlying belief/evidence changes.  
**Sparse Graph** - Architecture that stores only meaningful persistent relationship edges rather than every possible pair of people.
