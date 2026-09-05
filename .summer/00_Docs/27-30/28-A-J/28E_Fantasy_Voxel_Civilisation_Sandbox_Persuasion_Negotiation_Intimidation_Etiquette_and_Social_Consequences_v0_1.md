# Fantasy Voxel Civilisation Sandbox - Document Set 28

## 28E - Persuasion, Negotiation, Intimidation, Etiquette and Social Consequences

**Version 0.1 - Detailed Social Resolution and Diplomacy Design Bible Draft**

**Document Set:** 28 - Dialogue, Social Systems and Companions  
**Governing Contract:** Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0  
**Depends On:** 28A, 28B, 28C, 28D and the current canonical Leyforge source set  
**Project Lead and Final Authority:** Ash

> **Social Resolution Statement**  
> Leyforge social influence must resolve what one person can reasonably convince, reassure, deceive, pressure, negotiate or ask another person to do without reducing conversation to a single Charisma statistic or allowing dialogue text to override authoritative world state. Outcomes must arise from the actual proposal, evidence, relationship, reputation, personality, culture, authority, risk, leverage and current circumstances. Persuasion may change a decision; it must not rewrite facts, erase consequences, manufacture money, create legal authority, turn fear into loyalty or force consent where the target has no valid reason to agree.

| Field | Locked Direction |
| --- | --- |
| Document Role | 28E is the detailed authority for social-action resolution: persuasion, requests, reassurance, apologies, deception influence, intimidation, negotiation, diplomacy process, etiquette evaluation and immediate social-resolution outcomes. |
| Governing Ownership | Set 28 consumes economy, survival and movement interfaces and must not redefine them. Political, legal, quest, combat, inventory and settlement owners retain their own authoritative state. |
| Conversation Boundary | 28B owns conversation sessions, dialogue graph flow, intent presentation, choice commitment and interruption. 28E resolves eligible social actions that require influence, bargaining, pressure, deception or etiquette evaluation. |
| Knowledge Boundary | 28C owns propositions, beliefs, evidence, rumours, language comprehension and deception representation. 28E resolves whether deliberate influence changes acceptance, doubt, disclosure or decision. |
| Relationship Boundary | 28D owns Trust, Affection, Fear, Loyalty, Respect, Gratitude, Grievance, Familiarity, relationship milestones and social reputation. 28E consumes those values and emits social-resolution events; 28D applies lasting relationship effects afterward. |
| Economy Boundary | Set 27 owns prices, wages, market value, contracts, currency, trade opportunities and financial settlement. 28E may negotiate terms supplied by Set 27 but never calculates the economy underneath them. |
| Survival Boundary | Set 29 owns injury, illness, fatigue, recovery and physiological effects. 28E may consume bounded social modifiers or availability state but never computes health. |
| Movement Boundary | Set 30 owns route accessibility, travel state, physical following, seating and movement. 28E may secure social agreement to travel but cannot make travel physically possible. |
| Progression Boundary | Document 02 owns player skill/perk progression. 28E consumes relevant skill/perk values; it does not create a new attribute or class system. |
| Resolution Philosophy | Use transparent, bounded multi-factor resolution. Hard eligibility checks happen before influence. Social checks adjust willingness inside plausible boundaries rather than making impossible outcomes possible. |
| Randomness Direction | Default to mostly deterministic resolution with small bounded uncertainty only where ambiguity improves play. Any hidden variance must be stable for the committed attempt so save/reload cannot reroll endlessly. |
| Player Readability | Explain why a social action is easy, difficult, blocked, risky or offensive through qualitative reasons and known consequences rather than exposing every hidden numeric threshold. |
| Consent Rule | Persuasion and intimidation cannot override adult romance/sexual consent, captive/coercive romance restrictions, or other explicit no-consent boundaries established by 28D/project governance. |
| Diplomacy Rule | 28E owns the negotiation process and social acceptance. The political/governance owner commits treaties, borders, laws, wars, titles, citizenship and other political world state after valid ratification. |
| Persistence Rule | Consequential attempts create authoritative resolution records and evidence-linked events. Repetition, prior promises and accepted terms remain available to later conversations and relationship reappraisal. |

# Revision History

| Version | Status | Summary |
| --- | --- | --- |
| 0.1 | Initial detailed draft | Establishes social-action resolution, persuasion, deception influence, intimidation, negotiation, diplomacy, etiquette, consent boundaries, multiplayer authority, registries and cross-set contracts. |

# Document Purpose

Document 28E defines how Leyforge resolves **social attempts that can succeed, fail, partially succeed, offend, reassure, pressure, bargain or alter another actor's immediate decision**.

Documents 28B through 28D already establish three critical foundations:

1. **28B** determines that a valid conversation exists, who participates, which intent/action is selected and whether the committed choice survives world-state revalidation.
2. **28C** determines what each participant knows or believes, what evidence exists, what was actually communicated and whether language/translation preserved the intended meaning.
3. **28D** determines the persistent relationship and reputation context in which the action occurs.

28E sits directly after those layers. It answers questions such as:

- Will this NPC accept my request?
- Can I reassure someone who believes a dangerous rumour?
- Does my apology repair the immediate dispute enough for them to continue talking?
- Does a lie convince the listener, create doubt or immediately appear implausible?
- Does a threat produce compliance, resistance, panic or retaliation?
- Can the parties reach a negotiated agreement without either side crossing its hard limits?
- Has the player unintentionally violated a local etiquette rule?
- Does a diplomatic representative have authority to make this concession?
- Which parts of the result belong to Set 28, and which must be committed by another owner?

The central rule is that **social influence changes willingness and decisions, not reality**. A persuasive player cannot make an NPC believe the sun did not rise when the NPC is looking at it, cannot negotiate a wage that Set 27 says the employer cannot fund without the economic owner returning a valid term, cannot make an incapacitated companion physically travel, cannot ratify a treaty without political authority and cannot transform terrified obedience into genuine loyalty.

# Design Sources and Responsibility Updates

| Source | Relevant Direction | 28E Use |
| --- | --- | --- |
| 00 - Master Game Design Bible | Supports heroic, neutral, political, commercial, criminal, conqueror and peaceful play with meaningful world reactions. | Social resolution must support multiple approaches without assuming heroism or one moral alignment. |
| 01 - Core Gameplay Loop | Interact, trade, defend, negotiate, help, threaten and conquer are legitimate world interactions. | Social actions are connected to real goals and system consequences rather than detached dialogue checks. |
| 02 - Player Progression | Diplomacy/Reputation, Trading and Leadership are use-based skills/perk paths; no classic Charisma attribute exists. | 28E consumes relevant skill/perk inputs without inventing a Charisma stat or class gate. |
| 07 - NPC Village System | Persistent named people have schedules, jobs, needs, memories and settlement context. | Provides person/role context and availability; 28E does not replace NPC operation. |
| 13 - Races, Peoples, Cultures and Factions | Culture, law, government, faction, language and political identity are layered records. | Provides cultural norms, authority and political context; 28E owns interaction process, not political state. |
| 15 - Quest and Event System | Quests may be solved through diplomacy, negotiation, stealth, trade and systemic alternatives. | Social outcomes can satisfy or branch quest/event objectives only through validated quest commands/events. |
| 16 - Combat, Gear and Defence | Surrender, intimidation, capture, raids, guards and threat states are combat-facing systems. | Supplies credible threat and combat context; 28E resolves social response, not damage or combat execution. |
| 17 - UI/UX | Intent-based choices, readable consequences, knowledge-aware information and accessibility are required. | 28E exposes qualitative difficulty, risk, reason codes and outcome explanations. |
| 19-20 - Settlements and Buildings | Jobs, services, governance facilities, households and public spaces create social contexts. | Supplies venue, role and service context; 28E does not calculate settlement capacity. |
| 25 - Production Governance | One owner per mutable truth, stable IDs, schemas, validation and integration contracts. | Social results use typed definitions, stable records, commands/events and explicit external-owner handoffs. |
| 26 - Maritime Expansion | Maritime crews, ports, piracy, navies and trade create specialised social situations. | Maritime content consumes 28E social resolution while Set 26 retains vessel/naval mechanics. |
| 28A | Owns Set 28 architecture and cross-set contract. | Governing Set 28 authority. |
| 28B | Owns conversation lifecycle and intent entry/exit. | Provides committed social action and receives resolution result. |
| 28C | Owns belief, evidence, claims, lies, language and information transfer. | Provides epistemic context and consumes influence result for belief updates. |
| 28D | Owns persistent relationships and social reputation. | Provides relationship modifiers and consumes social consequence events. |

# Static Table of Contents

1. Locked Social-Resolution Identity  
2. Ownership Boundaries and Anti-Duplication Rules  
3. Locked Decision Summary  
4. Social Action Architecture  
5. Social Action Families and Intent Taxonomy  
6. Hard Eligibility Before Influence  
7. Resolution Context Snapshot  
8. Willingness, Resistance and Decision Boundaries  
9. Core Influence Inputs  
10. Progression Skills, Perks and No-Charisma Rule  
11. Relationship and Reputation Inputs  
12. Personality, Values and Motivation Inputs  
13. Evidence, Knowledge and Credibility Inputs  
14. Authority, Status, Role and Institutional Context  
15. Risk, Cost, Benefit and Personal Stakes  
16. Cultural Etiquette and Social Norm Resolution  
17. Language, Translation and Misunderstanding  
18. Persuasion and Ordinary Requests  
19. Reassurance, Encouragement and De-escalation  
20. Apology, Accountability, Forgiveness Request and Repair  
21. Deception, Bluffing, Misrepresentation and Suspicion  
22. Intimidation, Threats, Coercion and Compliance  
23. Negotiation Architecture  
24. Terms, Issues, Positions and Packages  
25. Offers, Counteroffers, Concessions and Trade-Offs  
26. Reservation Boundaries, Deal Breakers and Walk-Away  
27. Leverage, Guarantees, Hostages, Collateral and Promises  
28. Fairness, Face, Prestige and Perceived Exploitation  
29. Economic Negotiation and Set 27 Integration  
30. Companion Recruitment and Service Negotiation Hooks  
31. Diplomacy Session Architecture  
32. Diplomatic Authority, Mandates and Ratification  
33. Treaties, Ceasefires, Access, Prisoners and Political Proposals  
34. Multi-Party Negotiation, Councils and Coalitions  
35. Crime, Witnesses, Trials and Social Testimony Hooks  
36. Surrender, Captivity and Hostile-Situation Social Resolution  
37. Failure, Partial Success, Refusal and Escalation  
38. Reattempts, Pressure Spam and Anti-Exploit Rules  
39. Social Consequence Commit Pipeline  
40. Relationship, Belief and Reputation Consequence Handoffs  
41. Quest, Event and World-State Integration  
42. NPC-NPC Social Resolution and Autonomous Diplomacy  
43. Simulation LOD and Distant Resolution  
44. Multiplayer Authority and Group Social Actions  
45. UI, Accessibility and Player Readability  
46. Persistence, Save/Load and Audit History  
47. Registries and Runtime Data Model  
48. Reason Codes and Diagnostics  
49. Validation and Automated Test Strategy  
50. Balance Framework and Draft Resolution Formula  
51. Core Example Scenarios  
52. Open Questions and Deferred Decisions  
53. Cross-Set Interface Amendments  
Appendix A. Social Action Definition Template  
Appendix B. Social Resolution Result Template  
Appendix C. Negotiation Session and Term Templates  
Appendix D. Diplomacy Session Template  
Appendix E. Etiquette and Social-Offence Templates  
Appendix F. Outcome Band Tables  
Appendix G. Cross-System Responsibility Matrix  
Appendix H. Glossary

# 1. Locked Social-Resolution Identity

The Social Resolution System is the **decision-influence layer** between a committed social action and its consequences.

A player may have a persuasive argument, a respected history, strong evidence, legitimate authority or credible leverage. An NPC may have strong values, fear, grievances, conflicting obligations or a hard boundary. 28E combines those valid inputs to determine the immediate social outcome.

> **Locked Rule**  
> Social influence can move a willing decision inside plausible boundaries. It cannot bypass hard eligibility, external authority, physical impossibility, explicit consent boundaries or factual ownership.

## 1.1 Design Promise

A player should be able to understand the major reasons behind a result:

- the target trusts or distrusts them;
- the proposal helps or harms the target;
- evidence supports or contradicts the claim;
- the player has or lacks relevant expertise;
- the target's values make the proposal attractive or unacceptable;
- the requested risk is low or severe;
- the player used respectful or offensive etiquette;
- the target fears the player but does not agree with them;
- the proposed terms exceed what the target is authorised to concede;
- the deal is financially invalid according to Set 27;
- an interpreter reduced semantic fidelity;
- a prior broken promise changes credibility;
- the target simply has a hard personal or institutional boundary.

The game does not need to reveal hidden exact thresholds. It should reveal enough **qualitative cause** that results feel earned and learnable.

## 1.2 What 28E Is Not

28E is not:

- a universal Charisma stat;
- a dice-roll minigame detached from the world;
- a system where enough points force any NPC to say yes;
- an economy calculator;
- a legal verdict engine;
- a faction-war owner;
- a combat threat simulator;
- a language system;
- a relationship system;
- an emotion simulator that replaces personality and memory;
- a romance-consent override;
- a procedural text generator that invents terms, facts or authority;
- a requirement that every ordinary purchase becomes a ten-step negotiation.

# 2. Ownership Boundaries and Anti-Duplication Rules

## 2.1 28E Owns

28E owns:

- social-action eligibility after external facts are supplied;
- persuasion resolution;
- request/reassurance/de-escalation resolution;
- apology acceptance and immediate social repair outcome;
- deliberate deception influence outcome;
- intimidation and threat-response resolution;
- negotiation session state;
- offer/counteroffer/concession process;
- social interpretation of fairness and exploitation;
- diplomacy interaction process;
- diplomatic social acceptance/refusal;
- etiquette evaluation and immediate social offence/approval outcome;
- social pressure/repetition controls;
- social resolution records and reason codes;
- `PersuasionModifier()` and more specific Set 28 social-resolution outputs.

## 2.2 28E Consumes but Does Not Own

| Concern | Owner | 28E Use |
| --- | --- | --- |
| Conversation participant/session/choice | 28B | Receives committed action; returns resolution. |
| Beliefs, evidence, truth, claims, language | 28C | Uses credibility and comprehension; returns influence outcome. |
| Trust, Affection, Fear, Loyalty, Respect, Grievance, Familiarity | 28D | Uses as context; emits events for lasting relationship effects. |
| Prices, wages, contract values, currency, financial feasibility | Set 27 | Consumes live terms and validates proposed economic package. |
| Injury, illness, fatigue, recovery | Set 29 | Consumes bounded modifiers/availability only. |
| Travel, following, seating, route | Set 30 | Social agreement may request movement; movement owner executes. |
| Skill/perk progression | Document 02 | Consumes Diplomacy/Reputation, Trading, Leadership and approved perks. |
| Quest objectives/stages | Document 15 | Emits validated social outcome events. |
| Combat strength/harm/capture | Document 16 | Consumes credible threat context; combat remains external. |
| Culture, law, government, faction, treaty state | Document 13/governance | Consumes identity/authority; political owner commits world state. |
| Household/job/schedule | Document 07 | Context and availability only. |
| UI/voice/animation | 17/22/23/28I | Receives view models and semantic outcome events. |

## 2.3 No Side-Door Ownership

A social result must never silently mutate another domain.

Examples:

- "Convince merchant to lower the price" returns a valid **negotiated pricing request/term** to Set 27. Set 27 returns the actual legal/economic transaction price.
- "Convince guard to let me through" may return `social_access_concession_accepted`; the gate/access owner still validates whether the guard has authority and commits access.
- "Persuade ruler to sign treaty" returns accepted negotiated terms; the political owner still checks mandate/ratification and creates the treaty record.
- "Threaten prisoner" can produce disclosure willingness; 28C still determines what the prisoner actually knows and what claim they make.
- "Convince companion to travel" can produce social consent; Set 30 still decides whether the route is accessible.

# 3. Locked Decision Summary

| Area | Locked Decision |
| --- | --- |
| Base Model | Multi-factor willingness/resistance model with hard eligibility before influence. |
| Charisma | No classic Charisma attribute. Relevant use-based skills/perks and world context replace it. |
| Skill Contribution | Skill matters but cannot overwhelm impossible, coercive or hard-value boundaries. |
| Relationship Contribution | Trust, Respect, Fear, Grievance and reputation affect credibility/willingness contextually rather than as one universal bonus. |
| Evidence | Strong relevant evidence can matter more than raw social skill for factual claims. |
| Deception | 28C represents the lie and contradictions; 28E resolves whether the listener accepts, doubts, challenges or rejects the deceptive claim. |
| Intimidation | Produces compliance, hesitation, panic, resistance or escalation; never automatically produces agreement, loyalty or respect. |
| Negotiation | Uses multi-issue packages, reservation boundaries, concessions and trade-offs. Ordinary low-stakes transactions can use simplified one-step wrappers. |
| Diplomacy | Uses the negotiation core plus authority, legitimacy, constituency, prestige, face, ratification and political constraints. |
| Etiquette | Cultural norms influence reaction, credibility and offence; ignorance can reduce blame but does not make every offence consequence-free. |
| Consent | Adult romance/partnership consent and other explicit personal boundaries cannot be overridden by persuasion or intimidation. |
| Randomness | Mostly deterministic. Optional bounded variance is stable per committed attempt and cannot be rerolled through reload. |
| Reattempts | Repeating the same pressure without new evidence, terms or context suffers diminishing returns and may create irritation or grievance. |
| Failure | Failure is informative and may create new paths: ask for proof, improve terms, seek another representative, repair relationship, wait, or accept refusal. |
| UI | Show qualitative factors, blockers and risks. Exact hidden acceptance thresholds are debug-only unless a perk/system explicitly reveals more. |
| Multiplayer | One authoritative resolution. Multiple players cannot stack unlimited persuasion by dogpiling the same NPC. |
| Persistence | Consequential attempts and accepted agreements are historical records linked to their causes and later relationship/quest consequences. |

# 4. Social Action Architecture

The canonical flow is:

```text
28B committed social action
  -> resolve participants and authority
  -> query 28C knowledge/evidence/comprehension
  -> query 28D relationship/reputation state
  -> query external domain facts (27/29/30/13/15/16/etc.)
  -> validate hard eligibility
  -> build SocialResolutionContext
  -> calculate target willingness/resistance profile
  -> apply action-specific influence model
  -> classify outcome band
  -> validate any external consequence commands
  -> commit SocialResolutionResult
  -> 28C belief update if informational influence occurred
  -> 28D relationship/reputation consequence event
  -> external owner commits economic/political/quest/access/etc. mutation
  -> 28B continues, redirects or closes conversation
```

## 4.1 Definition vs Runtime vs Consequence

| Layer | Record | Meaning |
| --- | --- | --- |
| Definition | `SocialActionDefinition` | Immutable rule profile for persuade, apologise, reassure, threaten, bargain, etc. |
| Context | `SocialResolutionContext` | Snapshot of participants, proposal, evidence, relationships and external facts. |
| Runtime | `SocialResolutionAttempt` | The committed attempt and stable uncertainty seed if needed. |
| Result | `SocialResolutionResult` | Outcome band, reasons, accepted terms and follow-up hooks. |
| Long-Term Social | 28D event | Persistent relationship/reputation change. |
| Knowledge | 28C update | Belief, doubt, disclosure or provenance change. |
| External World | Domain command/event | Economic, political, quest, access, combat or movement result. |

# 5. Social Action Families and Intent Taxonomy

Suggested top-level families:

| Family | Typical Intents | Primary Question |
| --- | --- | --- |
| Request | ask, request_help, ask_permission, seek_favour | Will the target willingly do this? |
| Persuasion | persuade, advocate, convince, reason | Will the target change a decision/belief-linked stance? |
| Reassurance | reassure, calm, encourage, de_escalate | Can immediate resistance/fear/uncertainty be reduced? |
| Repair | apologise, admit_fault, seek_forgiveness, make_amends | Will the target accept the social repair step? |
| Information Influence | convince_claim, bluff, deceive, conceal, misdirect | Will the target accept/doubt/challenge the claim? |
| Pressure | intimidate, threaten, warn, coerce | Will threat pressure alter immediate behaviour? |
| Negotiation | offer, counteroffer, concession, package, compromise | Can both sides reach a mutually acceptable package? |
| Diplomacy | parley, ceasefire, treaty, access, recognition, exchange | Can authorised political representatives reach accepted terms? |
| Etiquette | greet, address, gift_protocol, ceremony, taboo_action | Is the behaviour socially appropriate in context? |
| Recruitment | invite_companion, hire, enlist, request_service | Does the person agree socially to join/service? 28F owns companion state. |
| Conflict Resolution | mediate, arbitrate_socially, reconcile, request_truce | Can participants accept a social de-escalation? |

A dialogue intent may be available without requiring a check. Asking a neutral factual question usually should not invoke persuasion. Social resolution exists only when **willingness, credibility, pressure or negotiated terms are materially contested**.

# 6. Hard Eligibility Before Influence

No influence score is calculated until hard eligibility passes.

## 6.1 Hard Block Examples

- target is dead or unavailable;
- conversation/session no longer valid;
- target cannot understand the communicated semantic content and no valid interpreter/channel exists;
- target lacks authority to grant the requested result;
- requested external action is impossible according to its owner;
- player lacks required evidence/item/mandate explicitly required by the action;
- proposal violates a non-negotiable authored boundary;
- romance/sexual consent is blocked by age, coercion, captivity or non-consent rules;
- the economic package is invalid or cannot be represented by Set 27;
- political proposal requires ratification not currently available;
- target is incapacitated beyond permitted interaction according to Set 29;
- route/travel request is not a social-resolution problem because Set 30 reports it physically impossible;
- action duplicates a recently resolved commitment that cannot be reopened yet.

## 6.2 Soft Resistance Is Not a Hard Block

The following normally create resistance rather than impossibility:

- low trust;
- high grievance;
- weak evidence;
- high personal risk;
- cultural offence;
- poor reputation;
- target dislikes the player;
- request conflicts with a preference but not a core boundary;
- current fatigue/illness reduces patience;
- proposal is costly but compensable;
- target fears consequences from a third party.

# 7. Resolution Context Snapshot

`SocialResolutionContext` should include only information needed for the current action.

Typical fields:

- action definition ID;
- conversation/session ID;
- actor/speaker ID;
- target/decision-maker ID;
- observers/witnesses;
- authorised representative/mandate IDs;
- proposal/claim/term package IDs;
- relevant 28C propositions, claims, evidence and comprehension result;
- relevant 28D relationship dimensions and social reputation;
- target social personality/value profile references;
- role/status/authority context;
- location/venue/context tags;
- applicable culture/etiquette references;
- external economic/survival/movement/combat/political facts;
- progression skill/perk snapshot;
- previous-attempt history;
- urgency/time pressure;
- public/private context;
- known witnesses/audience;
- deterministic attempt seed if bounded uncertainty applies;
- authority revision/version hashes for revalidation.

Context is revalidated immediately before commit. A negotiation cannot accept a contract after its underlying terms, authority or required inventory changed.

# 8. Willingness, Resistance and Decision Boundaries

Rather than one "persuasion difficulty", each social action has a **decision model**.

## 8.1 Willingness

Willingness represents reasons to accept:

- personal benefit;
- shared values;
- trust/relationship;
- evidence and credibility;
- legitimate authority;
- gratitude/reciprocity;
- low risk;
- social reputation;
- fair compensation supplied by Set 27;
- face-saving or honour;
- existing obligation;
- fear where the action family is pressure/compliance rather than sincere agreement.

## 8.2 Resistance

Resistance represents reasons to refuse:

- cost/risk;
- conflicting values;
- distrust;
- grievance;
- contradictory evidence;
- conflicting loyalty/obligation;
- lack of authority;
- cultural offence;
- reputational risk;
- fear of third-party retaliation;
- personal boundary;
- poor terms;
- repeated pressure;
- fatigue/illness/social overload;
- suspicion of deception.

## 8.3 Hard Boundaries

Hard boundaries do not become giant resistance numbers. They are explicit blockers. This avoids the design error where a sufficiently high skill score can technically overpower anything.

# 9. Core Influence Inputs

A canonical influence resolution may draw from these factor families:

| Factor | Typical Range | Owner |
| --- | ---: | --- |
| Relevant social skill/perks | bounded modifier | Document 02 |
| Relationship context | bounded modifier | 28D |
| Social reputation | bounded modifier | 28D |
| Evidence strength | bounded modifier | 28C/external evidence |
| Speaker credibility | bounded modifier | 28C + 28D |
| Target values/motivation | bounded modifier | 28A/28E social profile |
| Proposal utility/cost | bounded modifier | external owner + 28E interpretation |
| Authority/mandate | eligibility/modifier | Document 13/governance |
| Etiquette | bounded modifier/offence | 28E using culture context |
| Language fidelity | bounded modifier/block | 28C |
| Survival state | bounded modifier/block | Set 29 |
| Urgency/context | bounded modifier | owning world/event systems |
| Repeat pressure | penalty | 28E |
| Stable uncertainty | small bounded modifier | 28E |

No factor should independently dominate all action families.

# 10. Progression Skills, Perks and No-Charisma Rule

Leyforge does not use a classic Charisma attribute. 28E consumes use-based social progression instead.

## 10.1 Relevant Existing Skills

Document 02 already establishes:

- **Diplomacy/Reputation**;
- **Trading**;
- **Leadership**.

28E may request a tagged proficiency from the progression system, for example:

- `skill.diplomacy` for persuasion, mediation and political dialogue;
- `skill.trading` for economic bargaining literacy;
- `skill.leadership` for command credibility, morale and group negotiation;
- approved knowledge/profession competencies for specialist arguments.

28E must not silently add permanent new skills to Document 02. If future content needs Deception, Oratory, Etiquette or Mediation as separate progression tracks, that is a progression amendment requiring explicit approval.

## 10.2 Skill Does Not Replace Substance

A skilled negotiator with terrible terms should not automatically win.

Skill should improve things such as:

- framing;
- recognising concerns;
- avoiding needless offence;
- presenting evidence clearly;
- identifying negotiable issues;
- making efficient concessions;
- detecting likely walk-away points if sufficiently informed;
- maintaining composure;
- recovering from a weak opening;
- obtaining more information about objections.

# 11. Relationship and Reputation Inputs

28E consumes 28D values contextually.

## 11.1 Suggested Relationship Use

| Dimension | Typical Social Effect |
| --- | --- |
| Trust | Credibility, willingness to accept promises, reduced suspicion. |
| Affection | Willingness to help personally, patience, generosity. |
| Fear | Threat compliance and caution; may reduce open disagreement but increase hidden resistance. |
| Loyalty | Willingness to bear cost for a person/group. |
| Respect | Weight given to competence, judgement or status. |
| Gratitude | Reciprocity willingness. |
| Grievance | Resistance, scepticism, desire for repair or refusal. |
| Familiarity | Better reading of style/preferences; also makes repeated manipulation easier to recognise. |

## 11.2 No Universal Relationship Bonus

Trust should not help a blatant intimidation threat in the same way it helps reassurance. Fear should not help a sincere friendship request. Affection should not make a professional safety rule disappear.

Each `SocialActionDefinition` declares which relationship dimensions matter and how.

# 12. Personality, Values and Motivation Inputs

The target is not an empty difficulty score.

Relevant social-personality/value facets can include:

- caution;
- generosity;
- pride;
- patience;
- suspicion;
- empathy;
- ambition;
- conformity;
- honour sensitivity;
- risk tolerance;
- conflict aversion;
- authority respect;
- competitive drive;
- curiosity;
- secrecy;
- reciprocity preference;
- independence/autonomy.

Values and motives can also come from profession, household, culture, faction, current goals and authored character identity.

A guard may be personally fond of the player yet refuse to abandon a post because loyalty/duty outweighs affection in that context.

# 13. Evidence, Knowledge and Credibility Inputs

28C is the source of what the target knows, believes and can understand.

## 13.1 Factual Persuasion

When persuasion concerns a proposition, evidence quality matters strongly.

Examples:

- direct witnessed evidence;
- physical evidence;
- trusted testimony;
- official record;
- repeated independent sources;
- weak hearsay;
- stale information;
- contradictory evidence;
- known forgery/deception indicators.

A low-skill speaker holding decisive evidence may outperform a highly skilled speaker with no evidence when the dispute is factual.

## 13.2 Credibility

Credibility can depend on:

- Trust;
- reliability social reputation;
- prior accurate/false claims known to the listener;
- expertise relevant to the topic;
- provenance quality;
- consistency with known evidence;
- apparent motive/conflict of interest;
- language fidelity;
- current deception suspicion.

28E never reads hidden objective truth directly to give the player a bonus. It uses the recipient's epistemic context from 28C.

# 14. Authority, Status, Role and Institutional Context

Social influence is constrained by what the target is empowered to do.

Examples:

- merchant may negotiate within a price/stock policy supplied by Set 27;
- guard may grant routine access but not citizenship;
- village leader may promise to propose a project but not personally seize a private parcel;
- diplomat may negotiate terms but require council ratification;
- prisoner may agree to disclose information but cannot deliver information they do not know;
- companion may agree to a social request but cannot override Set 30 movement feasibility.

## 14.1 Status Is Contextual

Titles and authority may improve or worsen willingness depending on culture and relationship. 28E should not create a single universal "rank bonus".

# 15. Risk, Cost, Benefit and Personal Stakes

A request should be easier when it is cheap, safe and aligned with the target's goals.

Suggested stake categories:

- trivial;
- low;
- meaningful;
- major;
- severe;
- existential.

Examples:

| Request | Typical Stake |
| --- | --- |
| "Point me toward the mill" | trivial |
| "Cover my market stall for ten minutes" | low |
| "Lend me your horse for the afternoon" | meaningful |
| "Leave your job and join my expedition" | major |
| "Betray your faction during a siege" | severe |
| "Sacrifice your family/settlement for my plan" | existential/hard boundary for most characters |

Stake classification is action/context dependent and should be data-driven.

# 16. Cultural Etiquette and Social Norm Resolution

Document 13/culture content defines cultural identity, values, laws and canonical norms. 28E owns the **runtime social evaluation** of etiquette in an interaction.

## 16.1 Etiquette Rule Types

- forms of address;
- greeting protocol;
- gift protocol;
- hospitality norms;
- bargaining style;
- public/private disagreement norms;
- hierarchy/deference expectations;
- religious/ritual decorum;
- mourning/funeral conduct;
- courtship/marriage ceremony conduct;
- clothing/weapon protocol in specific venues;
- taboo topics;
- sacred objects/places;
- oath/promise conventions;
- guest-right/customary protection;
- insult/challenge conventions;
- negotiation face-saving conventions.

## 16.2 Outsider Ignorance

An outsider who does not know a norm may receive:

- no penalty for obscure customs;
- reduced blame;
- a warning/correction;
- embarrassment rather than grievance;
- full consequence when the act is obviously harmful or repeated after warning.

The system should distinguish:

- accidental ignorance;
- careless disregard;
- intentional insult;
- deliberate taboo violation;
- malicious provocation.

## 16.3 Etiquette Is Not Law

A social offence may be rude but legal. A legal violation may not be socially taboo. 28E emits social consequence; the legal owner decides legal consequence.

# 17. Language, Translation and Misunderstanding

28C owns comprehension.

28E consumes:

- semantic fidelity;
- unresolved ambiguity;
- interpreter route;
- jargon comprehension;
- script/language competence where relevant.

Low fidelity can:

- reduce credibility;
- increase uncertainty;
- hide nuance;
- make a concession appear broader/narrower;
- create etiquette mistakes;
- require clarification rather than immediately failing.

Important negotiations should allow participants to **ask for clarification** rather than treating imperfect language as a random penalty.

# 18. Persuasion and Ordinary Requests

Persuasion is used when the player is trying to alter a decision or stance through reasons, credibility or appeal rather than threat.

## 18.1 Request Model

A standard request resolves:

1. Does the target have authority/capacity?
2. What does the target believe the request entails?
3. What benefit/cost/risk does it represent?
4. What relationship/obligation exists?
5. Which values/motives align or conflict?
6. How credible is the speaker?
7. What skill/perk support applies?
8. Are there etiquette/context modifiers?
9. Has the same request been pressured repeatedly?
10. What outcome band results?

## 18.2 Suggested Persuasion Outcomes

- enthusiastic acceptance;
- acceptance;
- conditional acceptance;
- reluctant acceptance;
- request for proof/terms;
- defer/consider later;
- polite refusal;
- firm refusal;
- offended refusal;
- suspicion/escalation.

A single success/fail bit is not enough for Leyforge's social depth.

# 19. Reassurance, Encouragement and De-escalation

Reassurance tries to reduce immediate fear, uncertainty, panic or hostility without necessarily changing long-term relationship state.

Possible inputs:

- Trust;
- speaker calm/reputation;
- evidence of safety;
- actual threat state from external systems;
- target Fear/Grievance;
- target personality;
- current injury/fatigue from Set 29;
- public audience;
- prior broken reassurance promises.

Possible outcomes:

- calmed;
- partly reassured;
- remains worried but cooperative;
- disbelieves reassurance;
- becomes more suspicious;
- interprets reassurance as dismissive/offensive.

28D decides lasting relationship consequences afterward.

# 20. Apology, Accountability, Forgiveness Request and Repair

An apology is not a magic Trust restoration button.

## 20.1 Apology Components

An apology action can contain semantic components:

- acknowledgment of event;
- acknowledgment of responsibility;
- expression of regret;
- explanation/context;
- commitment not to repeat;
- restitution/repair offer;
- request for forgiveness;
- request to resume relationship/work;
- public correction where harm was public.

## 20.2 Sincerity

28E may resolve **perceived sincerity**, not objective inner truth unless the actor's authored state explicitly provides intent.

Perceived sincerity can depend on:

- consistency with known facts;
- willingness to accept responsibility;
- prior behaviour;
- actual restitution already committed by owning systems;
- relationship;
- body/presentation cues only as optional presentation, never inaccessible truth;
- contradictory evidence;
- whether the speaker repeats the same apology without behavioural change.

## 20.3 Forgiveness Is Not Required

Even an excellent apology may be acknowledged but not forgiven.

Outcome examples:

- apology accepted and repair path opened;
- apology accepted but grievance remains;
- apology acknowledged without forgiveness;
- restitution requested;
- apology rejected as insincere;
- apology worsens offence by minimising harm;
- conversation deferred;

28D applies any long-term Trust/Grievance changes.

# 21. Deception, Bluffing, Misrepresentation and Suspicion

28C defines the claim and whether it is knowingly deceptive relative to the speaker's belief.

28E resolves influence.

## 21.1 Deception Inputs

- listener prior belief;
- evidence contradictions;
- speaker credibility;
- relationship Trust;
- motive/conflict of interest;
- target suspicion personality;
- claim plausibility relative to known world;
- semantic fidelity;
- relevant skill/perks;
- prior deception history known to listener;
- corroborating or contradicting witnesses;
- pressure/context.

## 21.2 Deception Outcomes

- accepted with high confidence;
- tentatively accepted;
- accepted but suspicious;
- unresolved/doubtful;
- challenged for evidence;
- rejected;
- deception suspected;
- deception recognised strongly enough to trigger immediate accusation/social consequence.

28C then updates belief state using the result.

## 21.3 No Lie-Detector UI

The player should not receive a universal icon saying "Lie succeeded" unless an explicit ability/perk provides feedback. The player can receive contextual cues such as:

- "They seem unconvinced";
- "They ask for proof";
- "Your story conflicts with what they heard";
- "They accept the explanation for now".

# 22. Intimidation, Threats, Coercion and Compliance

Intimidation is a distinct action family.

> **Locked Rule**  
> Intimidation can create compliance. It does not create sincere agreement, friendship, loyalty or consent.

## 22.1 Threat Components

A threat can reference:

- direct physical harm;
- property damage;
- social exposure;
- legal/political consequences;
- economic pressure;
- faction retaliation;
- withdrawal of protection;
- credible future action.

The actual ability to carry out the threat comes from external systems. 28E evaluates **perceived threat credibility** using facts the target knows/believes.

## 22.2 Threat Response

Possible outcomes:

- compliant;
- reluctantly compliant;
- bargains for safer terms;
- stalls;
- calls bluff;
- refuses;
- flees;
- alerts allies;
- escalates to combat;
- submits temporarily then seeks revenge/help;
- panics and becomes less useful as an information source.

## 22.3 Coercion Boundary

Certain actions remain invalid under coercion regardless of Fear score, including adult romance/sexual consent and other explicit project-governance boundaries.

## 22.4 Fear Aftermath

28E emits intimidation result; 28D may increase Fear, Grievance or reduce Trust/Respect depending on context. No automatic Loyalty is granted.

# 23. Negotiation Architecture

Negotiation resolves **packages of terms** rather than a single persuasion roll.

A `NegotiationSessionState` may include:

- parties;
- authorised representatives;
- issues under discussion;
- each party's currently stated position;
- hidden/private reservation boundaries where appropriate;
- known priorities;
- term package history;
- offers/counteroffers;
- concessions;
- promises/guarantees;
- deadlines;
- relationship and reputation context;
- external economy/political/quest facts;
- public/private audience;
- current status: opening, exploring, bargaining, tentative, accepted, rejected, suspended, expired.

## 23.1 Simplified vs Full Negotiation

Not every interaction needs the full system.

- ordinary shop purchase: Set 27 transaction, perhaps one optional bargaining action;
- small favour: one social request;
- employment/recruitment: compact terms + social acceptance;
- major trade contract: multi-issue negotiation;
- faction treaty: full diplomacy session.

# 24. Terms, Issues, Positions and Packages

## 24.1 Issue

An issue is a negotiable subject such as:

- price/compensation;
- quantity;
- delivery time;
- duration;
- access;
- service obligations;
- territorial passage;
- prisoner exchange;
- ceasefire duration;
- protection guarantee;
- resource quota;
- secrecy;
- recognition;
- restitution;
- escort/support;
- settlement contribution.

## 24.2 Term

A term is a typed value supplied/validated by its owning system.

Examples:

- Set 27 price/wage term;
- Document 13 political access/recognition term;
- Document 15 quest obligation;
- Set 30 travel commitment only after physical validation;
- 28F companion service/role agreement.

## 24.3 Package

A package combines multiple terms so trade-offs are possible.

Example:

> Lower wage + housing + guaranteed meals + shorter service duration.

28E evaluates the package socially; Set 27/settlement/survival owners validate their own term components.

# 25. Offers, Counteroffers, Concessions and Trade-Offs

A valid negotiation should provide meaningful movement rather than repeatedly pressing "persuade".

## 25.1 Offer Lifecycle

1. Build package from valid term definitions.
2. Validate current external feasibility.
3. Estimate each side's perceived utility/resistance.
4. Present/commit offer through 28B.
5. Resolve acceptance, rejection or counteroffer.
6. Record concession history.
7. Update expectations/face/trust only after committed results.
8. Continue until tentative agreement, walk-away, expiry or interruption.

## 25.2 Concession Memory

Parties can remember:

- who moved first;
- whether concessions were reciprocated;
- whether one side exploited urgency;
- whether promised compromise was honoured;
- whether the final deal was perceived as fair.

28D owns lasting relationship impact.

# 26. Reservation Boundaries, Deal Breakers and Walk-Away

Each decision-maker may have:

- **preferred position**;
- **acceptable range**;
- **reservation boundary**;
- **hard deal breaker**;
- **must-have term**;
- **cannot-concede term**;
- **requires ratification** condition.

These can arise from values, authority, external economics, political rules, personal need or authored content.

A skilled negotiator can discover or infer some boundaries but cannot move a true hard boundary without changing the underlying world/context.

# 27. Leverage, Guarantees, Hostages, Collateral and Promises

Leverage is any fact that changes the consequences of agreement/refusal.

## 27.1 Legitimate Leverage

- credible alternative supplier;
- valuable information;
- protection capability;
- mutual threat;
- public support;
- evidence;
- existing obligation;
- scarce expertise;
- time advantage;
- trusted guarantor.

## 27.2 Coercive Leverage

- hostages;
- threats;
- blackmail;
- siege pressure;
- exposure of secrets;
- deprivation threats.

Coercive leverage routes through intimidation/pressure semantics and should carry social/political consequences.

## 27.3 Collateral and Financial Guarantees

Set 27 owns economic collateral, deposits, escrow, insurance and payment enforcement. 28E may negotiate their inclusion but does not define their valuation or transfer rules.

## 27.4 Promises

28E can create a social **promise commitment reference**. The promised action's owner tracks whether it later occurs. 28D interprets kept/broken promises socially.

# 28. Fairness, Face, Prestige and Perceived Exploitation

NPCs should respond to more than raw numeric utility.

A party may reject a profitable deal because it is humiliating, politically unacceptable or violates a social norm.

Relevant concepts:

- perceived fairness;
- reciprocity;
- face-saving;
- public embarrassment;
- status recognition;
- symbolic concessions;
- precedent concerns;
- cultural prestige;
- being seen as weak;
- being seen as exploitative;
- unequal information discovered later.

These are social interpretations, not economy simulation.

# 29. Economic Negotiation and Set 27 Integration

Set 27 remains authoritative for all economic values.

## 29.1 Inputs from Set 27

28E may consume:

- current price/price range exposed for negotiation;
- wage offer;
- merchant inventory;
- contract summary;
- economic standing;
- trade opportunity;
- affordability/credit/escrow validity;
- settlement/faction economic constraints;
- taxes/tariffs where relevant.

## 29.2 Outputs to Set 27

28E may emit:

- negotiated social acceptance of a proposed term package;
- requested discount/markup bounded by Set 27's allowed negotiation surface;
- agreed service duration/role reference;
- contract social-signature/consent state;
- reliability/trust/social-reputation modifier query.

Set 27 commits:

- final money/item transfer;
- final transaction price;
- wage payment;
- debt;
- contract accounting;
- tax/tariff;
- market effects.

# 30. Companion Recruitment and Service Negotiation Hooks

28F owns recruitment and companion state. 28E supplies the social resolution for the recruitment conversation.

Potential inputs:

- 28D Trust/Loyalty/Friendship;
- target goals/personality;
- service role;
- risk;
- duration;
- compensation from Set 27 if paid;
- housing/support conditions;
- existing obligations;
- party capacity/role constraints from 28F;
- survival readiness from Set 29;
- travel feasibility from Set 30 after social acceptance.

Possible results:

- enthusiastically joins;
- joins;
- joins under conditions;
- requests pay/support;
- temporary service only;
- refuses for now;
- refuses permanently under current relationship;
- offended by exploitative offer;
- agrees socially but movement assignment later fails externally.

# 31. Diplomacy Session Architecture

Diplomacy is the political specialisation of negotiation.

A `DiplomacySessionState` adds:

- political parties;
- recognised representatives;
- mandates;
- constituency/leadership constraints;
- diplomatic status;
- protocol/venue;
- treaty/proposal issue set;
- public/private channels;
- interpreters;
- observers/guarantors;
- prestige/face context;
- ratification requirements;
- ceasefire/safe-conduct context;
- history of prior agreements/breaches;
- political owner references.

28E owns whether participants **socially agree to terms**. The political owner decides whether those terms become authoritative political world state.

# 32. Diplomatic Authority, Mandates and Ratification

A representative may have:

- full authority;
- limited mandate;
- recommend-only authority;
- emergency authority;
- secret/false claimed authority;
- expired authority;
- no recognised authority.

28C can represent what participants believe about authority. Document 13/governance owns actual authority.

## 32.1 Ratification

Possible ratification owners:

- monarch/ruler;
- council;
- guild council;
- settlement vote;
- faction leadership;
- clan elders;
- religious authority;
- treaty guarantor.

28E records tentative agreement and submits it. Ratification can accept, amend or reject according to the political owner.

# 33. Treaties, Ceasefires, Access, Prisoners and Political Proposals

Suggested diplomacy proposal families:

- ceasefire;
- armistice;
- peace treaty;
- alliance;
- non-aggression pact;
- safe passage;
- border access;
- trade access;
- prisoner exchange;
- hostage release;
- tribute demand;
- reparations;
- mutual defence;
- joint expedition;
- recognition/legitimacy;
- settlement autonomy;
- shared resource rights;
- anti-piracy/naval cooperation;
- portal/dimensional access;
- information exchange.

The political/economic/combat owners define what each term **does**. 28E defines how parties negotiate and accept it.

# 34. Multi-Party Negotiation, Councils and Coalitions

Not all negotiations are bilateral.

## 34.1 Participant Roles

- proposer;
- decision-maker;
- coalition member;
- advisor;
- witness;
- interpreter;
- guarantor;
- mediator;
- veto holder;
- observer.

## 34.2 Coalition Acceptance

A coalition package may require:

- unanimous acceptance;
- majority;
- weighted vote;
- key-party veto approval;
- leader approval after consultation;
- external ratification.

The governance owner defines the constitutional rule. 28E tracks social positions and negotiation process.

## 34.3 Mediation

A mediator can improve communication and face-saving but does not own either side's decision.

# 35. Crime, Witnesses, Trials and Social Testimony Hooks

28C owns witness knowledge/testimony; justice/law owner determines guilt and sentence.

28E may resolve:

- persuading a witness to speak;
- asking a witness to clarify;
- intimidating a witness;
- attempting to bribe a witness where Set 27 and law systems allow the action representation;
- convincing a guard to investigate further;
- social credibility of testimony;
- apology/mediation between parties;
- public persuasion around a dispute.

It must not decide legal truth.

A coerced or bribed statement remains a statement with provenance. The justice owner decides evidentiary effect.

# 36. Surrender, Captivity and Hostile-Situation Social Resolution

Combat owns the physical state of surrender/capture. 28E owns social attempts inside that context.

Possible actions:

- demand surrender;
- offer surrender terms;
- negotiate safe withdrawal;
- request medical aid;
- prisoner exchange;
- interrogation request;
- promise parole;
- threaten consequences;
- negotiate hostage release.

## 36.1 Surrender Terms

Surrender must use validated terms such as:

- disarm;
- leave area;
- imprisonment;
- parole;
- ransom/compensation through Set 27;
- prisoner exchange;
- medical treatment;
- safe passage.

28E resolves acceptance. Combat/justice/movement/economy owners execute the terms.

# 37. Failure, Partial Success, Refusal and Escalation

Failure should be semantically useful.

## 37.1 Outcome Classes

- **Strong Success** - target accepts and may offer extra cooperation.
- **Success** - requested social decision accepted.
- **Conditional Success** - accepted if explicit conditions are met.
- **Narrow/Reluctant Success** - target accepts but relationship/face cost may remain.
- **Stalemate** - no agreement; conversation can continue with changed terms/evidence.
- **Soft Refusal** - refuses now but reason/path forward exists.
- **Firm Refusal** - current proposal/action will not be accepted.
- **Offended Refusal** - refusal plus etiquette/relationship consequence.
- **Backfire** - attempt increases suspicion, grievance or hostility.
- **Escalation** - social interaction triggers guard alert, exit, combat, public dispute or political consequence.

## 37.2 Failure Should Usually Explain a Path

Where appropriate, UI may surface:

- "They need proof."
- "The risk is too high."
- "They cannot authorise this."
- "The terms are unacceptable."
- "Your previous broken promise matters."
- "This request violates a local custom."
- "They will reconsider after the crisis."

Not every refusal needs a solvable path. Some people simply say no.

# 38. Reattempts, Pressure Spam and Anti-Exploit Rules

Repeated social actions without meaningful change should not be farmable.

## 38.1 Attempt Fingerprint

A social attempt can be fingerprinted by:

- target;
- action family;
- core proposal/claim;
- issue set;
- key evidence set;
- material terms;
- context revision.

## 38.2 Meaningful Change

A reattempt can become valid when there is meaningful new input:

- new evidence;
- improved terms;
- changed relationship;
- changed authority;
- changed risk/world state;
- different mediator/interpreter;
- elapsed time after an explicit cooldown;
- apology/restitution;
- new quest/event outcome.

## 38.3 Pressure Consequences

Repeated pressure can cause:

- irritation;
- reduced patience;
- Grievance event;
- refusal to discuss topic;
- guard/security involvement;
- reputation spread if public;
- intimidation classification if pressure becomes threatening.

# 39. Social Consequence Commit Pipeline

A successful influence result is not complete until all required owners agree to the consequence.

## 39.1 Commit Order

1. 28E resolves tentative social outcome.
2. Validate required external commands.
3. If all required external effects can commit atomically, commit them or use project-wide transactional orchestration.
4. Create `SocialResolutionResult` as committed fact.
5. Emit 28C belief/disclosure updates if applicable.
6. Emit 28D relationship/reputation event.
7. Emit quest/event hooks.
8. Return result to 28B for dialogue continuation.

## 39.2 Partial External Failure

If an external system rejects part of a package:

- do not silently pretend the agreement happened;
- return a structured reason;
- preserve a tentative agreement only if the content explicitly allows renegotiation;
- reopen affected terms where appropriate.

# 40. Relationship, Belief and Reputation Consequence Handoffs

## 40.1 To 28C

28E can return:

- influence_strength;
- acceptance/doubt/challenge;
- deception suspicion;
- disclosure willingness;
- reassurance result;
- interpreter/clarification result reference.

28C updates beliefs/information.

## 40.2 To 28D

28E can emit events such as:

- apology accepted/rejected;
- reassurance helpful/dismissive;
- honest persuasion respected;
- deception discovered;
- intimidation used;
- threat compliance;
- fair negotiation;
- exploitative negotiation;
- concession reciprocated/unreciprocated;
- promise made;
- social offence;
- mediation success;
- public humiliation avoided/caused.

28D determines lasting dimension deltas.

# 41. Quest, Event and World-State Integration

Document 15 owns quest/event state.

28E can expose conditions/results such as:

- `social_result.apology_accepted`;
- `social_result.witness_cooperating`;
- `social_result.negotiation_tentative_agreement`;
- `social_result.diplomacy_ceasefire_terms_accepted`;
- `social_result.intimidation_compliance`;
- `social_result.deception_suspected`;
- `social_result.mediation_failed`.

Quest/event content may branch from those results but should not bypass 28E by setting "persuasion succeeded" directly without a valid resolution or explicit authored auto-success action.

# 42. NPC-NPC Social Resolution and Autonomous Diplomacy

NPCs may use the same social-action definitions.

Examples:

- neighbour asks for help;
- merchant negotiates supply;
- guard persuades civilian to evacuate;
- leader negotiates with another settlement;
- spouse apologises;
- rival attempts reconciliation;
- faction envoy proposes ceasefire.

## 42.1 No Full Conversation Simulation Required

Distant or low-importance NPC-NPC interactions may resolve from compact context summaries. The system stores consequential result/evidence, not every generated line.

## 42.2 Named Important Interactions

Important NPC-NPC diplomacy, betrayal or relationship events can be promoted to authored/fully simulated sessions when nearby or story-relevant.

# 43. Simulation LOD and Distant Resolution

Suggested tiers:

| Tier | Social Resolution Behaviour |
| --- | --- |
| Active/Observed | Full conversation, visible participants, detailed terms/reason codes. |
| Local Unobserved | Full authoritative resolution, reduced presentation. |
| Settlement Summary | Batched low-stakes NPC-NPC social actions; preserve consequential records. |
| Regional/Distant | Only important negotiation/diplomacy/social-change events resolve; use bounded summaries. |

Player-initiated social actions should not be completed invisibly merely because the target unloaded unless the action is explicitly asynchronous (letter, envoy, delegation, scheduled negotiation).

# 44. Multiplayer Authority and Group Social Actions

## 44.1 One Authoritative Attempt

The server/authoritative world resolves one attempt from one committed social action.

## 44.2 Speaker Role

Multi-player conversation may designate:

- lead speaker;
- co-negotiator;
- witness;
- advisor;
- interpreter;
- silent party member.

28J owns final multiplayer conversation-choice UX/modes.

## 44.3 No Persuasion Dogpile

Players cannot repeatedly alternate identical persuasion attempts to bypass resistance.

Group contribution can legitimately add:

- independent evidence;
- relevant expertise;
- authority;
- reputation;
- credible guarantee;
- threat presence where intimidation applies.

It must not simply sum every player's skill.

## 44.4 Conflicting Player Intent

If one player threatens while another reassures, the target reacts to the actual combined event history. The system should not let contradictory approaches cancel invisibly into a neutral modifier.

# 45. UI, Accessibility and Player Readability

28E supplies structured view models; Document 17/28I owns final presentation.

## 45.1 Pre-Choice Readability

Where player knowledge allows, show qualitative cues such as:

- **They trust you.**
- **This request is risky for them.**
- **Your evidence supports this claim.**
- **They cannot authorise this.**
- **This custom may be offensive.**
- **The terms are currently outside their acceptable range.**
- **They seem afraid of you.**
- **Repeated pressure may worsen the relationship.**

Do not expose secret hard boundaries or hidden motives the player has no way to know.

## 45.2 Outcome Explanation

After a consequential result, UI can surface a concise reason bundle:

> **Conditional agreement** - They trust your evidence, but the risk is too high without an escort.

## 45.3 Accessibility

- no mandatory rapid-response timer for ordinary dialogue;
- optional pause/extended time where world-state rules allow;
- text alternatives for tone/audio cues;
- clear non-colour outcome states;
- simplified negotiation view;
- configurable verbosity;
- readable subtitles/captions;
- no requirement to infer essential meaning only from facial animation or voice tone.

# 46. Persistence, Save/Load and Audit History

Persist consequential state, not every hover/presentation event.

Minimum persistent records can include:

- committed social resolution attempts/results of significance;
- accepted agreements/promises;
- negotiation/diplomacy sessions that may resume;
- current term package and concession history for resumable negotiations;
- recent-attempt fingerprints/cooldowns;
- etiquette offence/approval events when socially meaningful;
- external command/result references;
- 28C/28D consequence links;
- authority revision/participants;
- stable uncertainty seed/result if used.

Save/load must not reroll a committed attempt.

# 47. Registries and Runtime Data Model

## 47.1 Definition Families

- `SocialActionDefinition`
- `SocialActionFactorProfile`
- `InfluenceResolutionProfile`
- `RequestStakeDefinition`
- `EtiquetteRuleDefinition`
- `EtiquetteContextDefinition`
- `SocialOffenceDefinition`
- `ApologyComponentDefinition`
- `ThreatTypeDefinition`
- `NegotiationIssueDefinition`
- `NegotiationTermAdapterDefinition`
- `NegotiationProtocolDefinition`
- `DiplomacyProtocolDefinition`
- `AuthorityMandateDefinition`
- `OutcomeBandDefinition`
- `RepeatPressureProfile`
- `SocialReasonCodeDefinition`

## 47.2 Runtime Records

- `SocialResolutionContext`
- `SocialResolutionAttempt`
- `SocialResolutionResult`
- `NegotiationSessionState`
- `NegotiationOfferRecord`
- `ConcessionRecord`
- `TentativeAgreementRecord`
- `DiplomacySessionState`
- `EtiquetteEvaluationRecord`
- `SocialPromiseReference`

# 48. Reason Codes and Diagnostics

Suggested families:

- `SOC_RES_AVAILABLE_*`
- `SOC_RES_BLOCKED_*`
- `SOC_RES_SUCCESS_*`
- `SOC_RES_REFUSED_*`
- `SOC_RES_CONDITIONAL_*`
- `SOC_RES_BACKFIRE_*`
- `SOC_RES_EVIDENCE_*`
- `SOC_RES_CREDIBILITY_*`
- `SOC_RES_RELATIONSHIP_*`
- `SOC_RES_ETIQUETTE_*`
- `SOC_RES_LANGUAGE_*`
- `SOC_RES_AUTHORITY_*`
- `SOC_RES_NEGOTIATION_*`
- `SOC_RES_DIPLOMACY_*`
- `SOC_RES_INTIMIDATION_*`
- `SOC_RES_DECEPTION_*`
- `SOC_RES_REPEAT_*`
- `SOC_RES_EXTERNAL_*`

Examples:

- `SOC_RES_BLOCKED_NO_AUTHORITY`
- `SOC_RES_BLOCKED_CONSENT_BOUNDARY`
- `SOC_RES_BLOCKED_EXTERNAL_TERM_INVALID`
- `SOC_RES_EVIDENCE_STRONG_SUPPORT`
- `SOC_RES_CREDIBILITY_PRIOR_BROKEN_PROMISE`
- `SOC_RES_RELATIONSHIP_HIGH_TRUST`
- `SOC_RES_ETIQUETTE_ACCIDENTAL_OUTSIDER_MISSTEP`
- `SOC_RES_ETIQUETTE_INTENTIONAL_TABOO_VIOLATION`
- `SOC_RES_LANGUAGE_PARTIAL_FIDELITY`
- `SOC_RES_NEGOTIATION_RESERVATION_BOUNDARY`
- `SOC_RES_NEGOTIATION_COUNTEROFFER_AVAILABLE`
- `SOC_RES_DIPLOMACY_REQUIRES_RATIFICATION`
- `SOC_RES_INTIMIDATION_COMPLIANCE_NOT_AGREEMENT`
- `SOC_RES_DECEPTION_SUSPECTED`
- `SOC_RES_REPEAT_PRESSURE_PENALTY`

# 49. Validation and Automated Test Strategy

## 49.1 Definition Validation

Validators should confirm:

- every social action has an owner and action family;
- factor weights reference valid factor definitions;
- hard blockers are explicit rather than represented as extreme numeric penalties;
- no Set 27/29/30 calculation is duplicated;
- negotiation terms declare their external owner/adapter;
- diplomacy actions declare authority/ratification requirements;
- etiquette rules reference valid culture/context definitions;
- consent-blocked actions cannot be enabled through modifier overflow;
- outcome bands cover all possible margins;
- repeat-pressure profiles have bounded behaviour;
- localisation/reason-code keys exist;
- persistence-critical records are versioned.

## 49.2 Deterministic Scenario Tests

Required test families:

- high Trust + low-risk request succeeds;
- high skill cannot bypass no-authority hard block;
- decisive evidence overcomes weak prior belief more effectively than raw skill alone;
- repeated lie with contradictory evidence becomes increasingly suspicious;
- intimidation produces compliance without Loyalty increase;
- coercive romance action is always blocked;
- outsider etiquette mistake is less severe than deliberate repeat violation where configured;
- economic negotiation never invents a price outside Set 27 adapter bounds;
- treaty agreement remains tentative until ratification;
- save/reload does not reroll outcome;
- multiplayer dogpile does not stack unlimited bonuses;
- inaccessible route remains inaccessible even after social travel agreement;
- fatigued target modifier comes only from Set 29 interface;
- partial language fidelity can request clarification;
- failed external commit prevents false social agreement finalisation.

# 50. Balance Framework and Draft Resolution Formula

Exact balance remains subject to testing. This section provides a **draft architecture**, not immutable final numbers.

## 50.1 Influence Margin

A generic contested action may use:

```text
InfluenceMargin =
    ActionFit
  + SkillAndPerk
  + Relationship
  + CredibilityEvidence
  + MotivationAlignment
  + AuthorityLegitimacy
  + EtiquetteContext
  + ProposalUtility
  + BoundedStableVariance
  - PersonalRisk
  - ValueConflict
  - GrievanceSuspicion
  - RepetitionPressure
  - ExternalConstraintResistance
```

Every component is clamped and action-specific. Hard blockers are evaluated separately.

## 50.2 Suggested Normalised Component Scale

For a standard action, most factor families should remain in roughly `-20..+20`, with exceptional evidence/stakes allowed stronger impact. The final sum may be normalised to a margin band.

This is intentionally not a universal exposed player number.

## 50.3 Suggested Outcome Bands - Balance Draft

| Margin | Outcome |
| ---: | --- |
| +35 or more | Strong success |
| +15 to +34 | Success |
| +1 to +14 | Narrow/conditional success depending on action |
| 0 to -14 | Stalemate/soft refusal |
| -15 to -34 | Firm refusal |
| -35 or less | Backfire/escalation where action profile allows |

Action families can remap these bands. A threat may map a positive margin to compliance; an apology may map it to acceptance; deception may map it to belief acceptance/doubt.

## 50.4 Stable Uncertainty

If uncertainty is used:

- small magnitude only;
- deterministic from committed attempt ID/world authority seed;
- stored in result;
- never rerolled by save/load;
- optional to reduce/disable for accessibility or deterministic world settings if project settings permit.

# 51. Core Example Scenarios

## 51.1 Persuading a Guard to Allow Emergency Access

```text
Player asks guard to open restricted gate for injured villager.
  -> 28B commits request
  -> guard has routine emergency-access authority
  -> 28C: guard believes villager is injured, strong evidence
  -> 28D: player moderately trusted, no grievance
  -> Set 29 confirms injury state; no health details copied into 28E
  -> 28E: benefit/high urgency outweighs moderate protocol risk
  -> outcome: conditional acceptance
  -> access owner commits temporary permission
  -> 28D receives responsible-help event
```

If the guard lacks authority, persuasion is blocked regardless of skill. The player may need a captain/healer/authorised route.

## 51.2 Failed Lie About a Theft

```text
Player falsely claims "I was outside town all night."
  -> 28C marks claim knowingly deceptive relative to speaker belief
  -> target has two independent witnesses placing player nearby
  -> Trust already low
  -> 28E deception influence margin strongly negative
  -> outcome: deception suspected
  -> 28C target belief shifts toward player lying
  -> 28D receives discovered-deception event
  -> justice owner separately evaluates legal consequences
```

## 51.3 Intimidating a Merchant

```text
Player threatens merchant for a discount.
  -> Set 27 supplies allowed current trade/negotiation bounds
  -> 28D: Fear high, Trust low
  -> target believes threat credible
  -> 28E intimidation succeeds as short-term compliance
  -> Set 27 decides whether a lawful/forced transaction path exists
  -> 28D receives intimidation/exploitation event
  -> merchant may later report incident through 28C/justice channels
```

The merchant does not become loyal because the threat worked.

## 51.4 Apology After a False Accusation

```text
NPC accused player based on false rumour.
Evidence later proves player innocent.
  -> 28C reappraises belief
  -> NPC initiates apology through 28B
  -> apology includes responsibility + regret + public correction promise
  -> 28E resolves perceived sincerity positively
  -> player may accept, defer or refuse forgiveness
  -> 28D reappraises relationship and applies apology consequence
  -> public correction spreads through 28C if performed later
```

## 51.5 Companion Recruitment With Terms

```text
Player asks scout to join expedition.
  -> 28F confirms recruitable social state/role surface
  -> Set 27 supplies wage offer options if this is paid service
  -> Set 29 reports scout recovered/fit enough for service
  -> 28D supplies Trust/Friendship
  -> 28E resolves recruitment negotiation
  -> scout accepts 7-day contract with pay + return guarantee
  -> Set 27 commits contract economics
  -> 28F commits companion agreement
  -> Set 30 later resolves travel/formation physically
```

## 51.6 Ceasefire Negotiation

```text
Two faction envoys meet under safe conduct.
  -> Document 13 confirms both mandates are limited
  -> 28C routes interpreted claims
  -> 28D provides political/social history and trust
  -> 28E diplomacy session negotiates:
       ceasefire duration
       prisoner exchange
       road access
       reparations discussion later
  -> both envoys reach tentative agreement
  -> one issue exceeds envoy mandate
  -> package marked requires ratification
  -> political owners ratify/modify
  -> final ceasefire record is external, not owned by 28E
```

## 51.7 Etiquette Misstep

```text
Player addresses elder by personal name during formal mourning rite.
  -> culture pack flags formal-title norm
  -> player has low cultural knowledge
  -> 28E classifies accidental outsider misstep
  -> NPC gives corrective response; small embarrassment/Respect effect only
Player repeats after explicit warning.
  -> classification becomes deliberate/careless disregard
  -> stronger social offence event emitted to 28D
```

# 52. Open Questions and Deferred Decisions

The following are deliberately deferred:

- final balance weights/curves for every social action family;
- whether social skills use visible levels, hidden proficiency bands or both in final UI;
- whether a separate Deception skill is ever added to Document 02;
- final perk library for diplomacy/trading/leadership;
- final culture-specific etiquette content catalogue;
- final legal bribery/corruption mechanics under the justice/governance owner;
- final treaty/political state schema under Document 13/governance;
- final Set 27 negotiation bounds and economic term adapters;
- final Set 29 survival social-modifier shape;
- final Set 30 travel-party interface names;
- final multiplayer vote/speaker UX in 28J;
- final adaptive voice/gesture cues in 28I/Presentation;
- final AI-assisted dialogue restrictions in 28H;
- final public modding exposure of social-action formulas in 28J/Set 25;
- final difficulty/accessibility presets for hidden uncertainty;
- final romance-content presentation and rating policy in 28I/project governance.

# 53. Cross-Set Interface Amendments

## 53.1 Status

**No new mandatory Set 27-30 ownership transfer is required by 28E v0.1.**

28E consumes the interfaces in the governing Cross-Set Interface Register and the additions already proposed by 28A.

Specifically:

- Set 27 supplies current prices, wages, merchant inventory, contract summaries, trade opportunities and economic standing/validation;
- Set 29 supplies injury, illness, fatigue, recovery and bounded survival-social modifiers;
- Set 30 supplies travel state, route accessibility, passenger seating and physical formation resolution.

## 53.2 Internal Set 28 Social Resolution API

28E exposes conceptual interfaces for later Set 28 documents:

- `PersuasionModifier(actor, target, action_context)`
- `CanAttemptSocialAction(actor, target, action_id, context)`
- `ResolveSocialAction(action_request)`
- `SocialActionPreview(action_request, knowledge_scope)`
- `ResolvePersuasion(request)`
- `ResolveReassurance(request)`
- `ResolveApology(request)`
- `ResolveDeceptionInfluence(claim_context)`
- `ResolveIntimidation(threat_context)`
- `EvaluateEtiquette(actor, target_or_scope, action, context)`
- `OpenNegotiation(parties, issue_set, context)`
- `EvaluateOffer(session_id, package)`
- `CounterofferOptions(session_id, party, knowledge_scope)`
- `NegotiationStatus(session_id)`
- `OpenDiplomacySession(parties, mandate_refs, issue_set)`
- `DiplomacyAgreementStatus(session_id)`
- `SocialResolutionReasonCodes(result_id, viewer_scope)`

Exact runtime signatures, data classes, network replication and Godot implementation belong to 28J/current technical implementation.

## 53.3 Proposed Clarification for Final Cross-Set Reconciliation

28E confirms that 28A's proposed Set 27 interface `ContractSummary(contract_id)` should expose **read-only typed term components and negotiation bounds/permissions where Set 27 permits bargaining**. This is a clarification of the existing proposed interface, not a new ownership transfer and not an economy rule.

# Appendix A. Social Action Definition Template

```yaml
social_action_definition:
  id: social.action.persuade.request_help
  family: request
  display_name_key: ...
  conversation_intent_id: social.intent.request_help
  required_context_tags: []
  hard_block_rules:
    - target_available
    - semantic_comprehension_sufficient
    - target_has_required_authority_or_capacity
  factor_profile_id: social.factor.request.standard
  relevant_relationship_dimensions:
    - trust
    - affection
    - gratitude
    - grievance
  relevant_skill_tags:
    - skill.diplomacy
  stake_profile: contextual
  evidence_profile: optional
  etiquette_profile: contextual
  repeat_pressure_profile_id: social.repeat.standard_request
  outcome_mapping_id: social.outcome.request.standard
  external_owner_handoffs: []
  reason_code_namespace: SOC_RES
```

# Appendix B. Social Resolution Result Template

```yaml
social_resolution_result:
  result_id: social_result:...
  attempt_id: social_attempt:...
  action_definition_id: social.action...
  actor_id: player:...
  target_id: npc:...
  session_id: conversation_session:...
  outcome_class: conditional_success
  influence_margin_band: positive_narrow
  public_reason_codes:
    - SOC_RES_RELATIONSHIP_HIGH_TRUST
    - SOC_RES_EVIDENCE_STRONG_SUPPORT
    - SOC_RES_CONDITIONAL_RISK_REMAINS
  private_debug_factor_breakdown: optional
  accepted_conditions:
    - condition:escort_required
  external_command_refs:
    - command:...
  belief_update_refs:
    - info_result:...
  relationship_event_refs:
    - relationship_event:...
  world_time: ...
  authority_revision: ...
  stable_variance_value: optional
  persistence_priority: important
```

# Appendix C. Negotiation Session and Term Templates

## C.1 Negotiation Session

```yaml
negotiation_session:
  session_id: negotiation:...
  party_ids:
    - player:...
    - npc:merchant:...
  representative_ids: []
  protocol_id: social.negotiation.trade_standard
  issue_ids:
    - issue:price
    - issue:delivery_time
  current_package_id: package:...
  offer_history_ids: []
  concession_history_ids: []
  deadline_world_time: optional
  status: bargaining
  external_owner_refs:
    economy: set27
  persistence_priority: normal
```

## C.2 Term Adapter

```yaml
negotiation_term:
  term_id: term:...
  issue_id: issue:price
  owner_system: set27
  owner_definition_ref: economy.term.price
  current_value: ...
  visible_to_party: true
  negotiable: true
  allowed_range_or_token: owner_supplied
  requires_external_commit: true
```

# Appendix D. Diplomacy Session Template

```yaml
diplomacy_session:
  session_id: diplomacy:...
  political_party_ids:
    - faction:a
    - faction:b
  representative_ids:
    - npc:envoy_a
    - npc:envoy_b
  mandate_refs:
    - mandate:a
    - mandate:b
  protocol_id: social.diplomacy.ceasefire
  safe_conduct_ref: optional
  interpreter_ids: []
  guarantor_ids: []
  issue_set:
    - ceasefire_duration
    - prisoner_exchange
    - road_access
  tentative_package_id: optional
  ratification_requirements:
    - party:a:council
  status: bargaining
  political_owner: document13_or_governance
```

# Appendix E. Etiquette and Social-Offence Templates

## E.1 Etiquette Rule

```yaml
etiquette_rule:
  id: etiquette.riverward.mourning.formal_address
  culture_or_context_ref: culture:...
  context_tags:
    - funeral
    - formal
  action_pattern: address_person
  expected_form: title_or_kinship_form
  knowledge_requirement: low
  outsider_leniency: high
  repeated_after_warning_multiplier: strong
  violation_offence_id: social.offence.disrespect.formal_mourning
```

## E.2 Social Offence

```yaml
social_offence:
  id: social.offence.disrespect.formal_mourning
  severity: minor_to_moderate
  relationship_event_family: etiquette_disrespect
  public_reputation_candidate: contextual
  legal_violation: false
  apology_available: true
```

# Appendix F. Outcome Band Tables

## F.1 Request/Persuasion

| Band | Meaning |
| --- | --- |
| Strong Success | Accepts and may volunteer extra support/information. |
| Success | Accepts requested social decision. |
| Conditional | Accepts with explicit condition or narrower scope. |
| Reluctant | Accepts but social cost/resentment may remain. |
| Stalemate | Needs better evidence/terms/context. |
| Soft Refusal | Refuses now; future path may exist. |
| Firm Refusal | Current request will not be accepted. |
| Backfire | Attempt damages credibility/relationship or escalates. |

## F.2 Deception

| Band | Meaning |
| --- | --- |
| Strong Accept | Listener accepts with strong confidence. |
| Accept | Listener accepts claim. |
| Tentative Accept | Listener leans toward claim but retains uncertainty. |
| Doubt | Listener remains unresolved. |
| Challenge | Requests evidence/clarification. |
| Reject | Listener rejects claim. |
| Suspect Deception | Listener believes speaker may be lying/manipulating. |

## F.3 Intimidation

| Band | Meaning |
| --- | --- |
| Strong Compliance | Immediate compliance plus retreat/avoidance behaviour. |
| Compliance | Complies due perceived threat. |
| Conditional Compliance | Complies only under limited terms. |
| Hesitation | Delays/stalls/bargains. |
| Refusal | Calls bluff or accepts risk. |
| Counter-Escalation | Alerts allies, flees, attacks or invokes authority. |

# Appendix G. Cross-System Responsibility Matrix

| Case | 28E Owns | External Owner |
| --- | --- | --- |
| Persuade merchant to consider discount | Social influence/acceptance | Set 27 final price/transaction |
| Negotiate wage | Social bargaining process | Set 27 wage calculation/payment |
| Ask injured NPC to travel | Social willingness | Set 29 condition; Set 30 travel execution |
| Convince listener of claim | Influence result | 28C belief update/truth/evidence |
| Apology accepted | Immediate social resolution | 28D lasting Trust/Grievance effect |
| Threaten guard | Intimidation response | Combat/law/access systems execute consequences |
| Bribe witness | Social willingness only | Set 27 transfer; justice system legal consequence; 28C testimony |
| Negotiate ceasefire | Diplomatic process/acceptance | Political/combat owners commit ceasefire state |
| Recruit companion | Recruitment social resolution | 28F companion state; Set 27 pay; Set 30 movement |
| Etiquette violation | Social offence evaluation | Document 13 supplies culture context; law owner if illegal |
| Persuade quest NPC | Social result | Document 15 quest stage/objective mutation |
| Promise payment later | Social promise reference | Set 27 contract/debt/payment state |
| Prisoner agrees to disclose | Willingness | 28C supplies actual knowledge/claim; justice/combat owns custody |

# Appendix H. Glossary

**Action Fit** - How well the chosen social approach matches the target/context; an argument can be skilled yet poorly chosen.  
**Backfire** - Social attempt that worsens the immediate situation through offence, suspicion or escalation.  
**Compliance** - Behaviour performed under pressure/threat; distinct from sincere agreement or loyalty.  
**Concession** - Negotiated movement away from a preferred position on an issue.  
**Credibility** - Recipient-contextual reason to treat a speaker/claim as reliable, using 28C/28D evidence and history.  
**Deal Breaker** - Explicit term or condition that makes a package unacceptable; may be hard or context-dependent.  
**Diplomacy Session** - Negotiation between recognised political parties/representatives with mandates and ratification context.  
**Etiquette** - Socially expected conduct in a cultural/contextual setting; not automatically law.  
**Hard Boundary** - Condition persuasion cannot numerically overcome, such as lack of authority or explicit consent block.  
**Influence Margin** - Internal bounded result of action-specific willingness minus resistance factors after hard validation.  
**Leverage** - Fact or capability that changes consequences of agreement/refusal.  
**Mandate** - External political authority defining what a representative may negotiate or commit.  
**Negotiation Issue** - Subject under discussion such as price, duration, access or prisoner exchange.  
**Negotiation Package** - Set of typed terms considered together.  
**Perceived Fairness** - Social interpretation of whether terms/process feel reciprocal, legitimate or exploitative.  
**Persuasion** - Attempt to change a decision/stance through reasons, credibility or appeal rather than threat.  
**Reservation Boundary** - Worst package a party is willing/authorised to accept under current context.  
**Social Resolution Result** - Authoritative 28E record describing immediate outcome and handoffs.  
**Stable Uncertainty** - Small optional deterministic variance fixed for a committed attempt to prevent reload rerolls.  
**Tentative Agreement** - Socially accepted package that still requires external validation or political ratification.  
**Threat Credibility** - Target's belief that a threatened consequence can and may actually occur.  
**Willingness** - Reasons a target has to accept an action/offer.  
**Resistance** - Reasons a target has to refuse or oppose an action/offer.

---

**End of Document 28E - Persuasion, Negotiation, Intimidation, Etiquette and Social Consequences v0.1**
