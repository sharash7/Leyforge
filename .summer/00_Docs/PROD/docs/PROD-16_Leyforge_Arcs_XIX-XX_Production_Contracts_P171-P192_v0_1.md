
# LEYFORGE PRODUCTION PROGRAMME

## PROD-16 — Arcs XIX–XX Production Contracts: P171–P192

**Document ID:** PROD-16  
**Title:** Leyforge Arcs XIX–XX Production Contracts — The Mind in the Machine / The First Flame  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **LOCKED — OWNER-APPROVED PRODUCTION AUTHORITY**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Runtime parent:** PROD-03 — Leyforge Runtime Engineering Architecture  
**Forge parent:** PROD-04 — The Forge Engineering & Creation Journey Architecture  
**Cross-system parent:** PROD-05 — Universal Simulation Primitives & Cross-System Contracts  
**Governance parent:** PROD-06 — Production Governance, Task Contracts & Evidence Standard  
**Previous executable volumes:** PROD-07 through PROD-15  
**Arc scope:** ARC XIX — THE MIND IN THE MACHINE / ARC XX — THE FIRST FLAME  
**Parent slices:** P171–P192  
**Programme gates:** PG-19 Optional AI Foundation; PG-20 Final Production Milestone  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge engineering, PROD-17 final verification and handoff

---

# 00. Executive Arc Statement

PROD-16 closes the Leyforge roadmap.

ARC XIX adds optional artificial intelligence only after P170 has already certified the complete non-AI game and Forge.

ARC XX then uses the final production systems and the final Forge to create the authored Tutorial World, prove the player's complete journey, and certify the whole production programme at P192.

The central promise of ARC XIX is:

> **AI may interpret, propose, converse, compose and assist, but normal Leyforge authority decides what is true, what is valid, what is allowed and what actually changes.**

The central promise of ARC XX is:

> **The Tutorial World is built from the real game, not a simplified tutorial imitation of it. Every lesson is a real mechanic, every settlement uses real resources and NPC labour, every machine is a real machine, every spell is real magic, every vessel is a real vessel, and every realm crossing uses the real portal/realm architecture.**

The combined progression is:

```text
AI AUTHORITY CONSTITUTION
→ NATURAL-LANGUAGE FORGE INTENT
→ AI-ASSISTED FORGE CREATION
→ FORGE ASSISTANT / TROUBLESHOOTER
→ OPTIONAL PLAYER COMPANION
→ BOUNDED NPC / SETTLEMENT INTELLIGENCE
→ OPTIONAL WORLD MIND
→ EXPERIMENTAL AI WORLD MODE
→ AI CERTIFICATION / AI-OFF FALLBACK
→ TUTORIAL WORLD CONTRACT
→ VALLEY OF BEGINNINGS
→ SURVIVAL / BUILDING JOURNEY
→ SETTLEMENT JOURNEY
→ AUTOMATION JOURNEY
→ MAGIC JOURNEY
→ EXPLORATION / COMBAT / DISCOVERY
→ MARITIME SHOWCASE
→ REALM SHOWCASE
→ SECRETS / EASTER EGGS
→ MULTIPLAYER TUTORIAL CERTIFICATION
→ GRADUATION INTO SANDBOX
→ THE FIRST FLAME
```

---

# 01. Governing Production Rules for P171–P192

## 01.1 ARC XIX cannot begin before P170

P170 — Tempered Ley must already have proved:

> **Leyforge works without AI.**  
> **The Forge works without AI.**

ARC XIX cannot be used to repair missing deterministic gameplay, Forge tooling, search, validation, documentation or UI.

## 01.2 AI is an optional capability layer

The game remains functional when no AI provider is configured, the model is offline, a request times out, local inference is unavailable, an external provider is unavailable, the player/server disables AI, or AI output fails validation.

## 01.3 AI is never authoritative gameplay state

AI cannot directly own or mutate inventories, block edits, damage, NPC identity, settlement stock, machine outputs, laws, ownership, faction state, portal transitions, world history, quest completion or Forge Production Ready state.

AI produces structured suggestions, candidate intents or authored source proposals.

Existing systems validate and execute.

## 01.4 AI uses normal contracts

AI actions pass through existing Permission, Transaction, Route, Knowledge, Quest/Event, Structure/Project, Profession/Task and Forge validation/package interfaces.

No `AIBypassEverything()` path exists.

## 01.5 AI output is untrusted input

Every response may be malformed, incomplete, contradictory, outdated, hallucinated, over-broad or incompatible with canonical IDs.

It must be parsed and validated like any other untrusted proposal.

## 01.6 Accepted AI output becomes ordinary governed source/state

```text
AI proposal
→ structured Forge source draft
→ user/authority review
→ normal validation
→ normal bake
→ normal package/runtime path
```

The accepted source becomes the persistent artefact.

Leyforge does not depend on regenerating the same model response later.

## 01.7 AI provenance is retained

Where AI materially contributes to source, retain appropriate provenance such as provider/model identifier where available, timestamp, originating intent/prompt or governed summary, source revision, human edits/approval and validation result.

## 01.8 AI cannot silently rewrite canon

AI may identify conflicts, explain authority or draft a proposal.

It cannot decide the canon was “probably wrong” and overwrite it.

## 01.9 AI cannot silently invent stable IDs

Candidate names/IDs remain proposals until normal registry authority creates or resolves them.

Unknown IDs stay unknown.

## 01.10 AI suggestion must remain visually distinct from truth

The UI differentiates AI suggestion, validated source, committed world action, known fact and speculative inference.

## 01.11 Natural language becomes structured intent

```text
creator request
→ interpretation
→ structured proposal
→ explicit fields/dependencies
→ preview
→ validation
→ approval
→ Forge source change
```

## 01.12 Ambiguous destructive requests require bounded clarification/preview

Broad prompts such as “make this castle tougher” must not trigger irreversible edits without resolving what “tougher” means.

## 01.13 AI may automate labour, not authority

It may fill repetitive fields, propose materials, draft dialogue or generate variants.

It cannot approve itself Production Ready.

## 01.14 Troubleshooting uses evidence before speculation

The Forge assistant should inspect diagnostics, dependency graph, source state, bake logs, Test Lab, performance data and manifests before guessing.

## 01.15 Player companion knowledge is knowledge-bounded

A companion only receives information its configured role legitimately knows: player/party knowledge, Codex, maps, observations and authorised memory.

It cannot query hidden world truth.

## 01.16 Companion advice never becomes player action by default

It may suggest, explain, remind or propose markers/plans.

It does not spend resources, alter builds, sign treaties or move the player without explicit delegated authority.

## 01.17 NPC/settlement AI does not replace deterministic simulation

Deterministic systems remain owners of needs, schedules, work, resources, construction, governance, population, combat, routes and economy.

Optional AI may enrich prioritisation, planning proposals, expression and long-horizon intent.

## 01.18 AI planning is bounded by capability and permission

A settlement AI may propose a granary.

It cannot fabricate materials, labour, land rights, blueprints or permissions.

## 01.19 AI dialogue cannot create unrecorded gameplay facts

Promised rewards, treaties, quests and disclosures bind to normal authoritative records where they have gameplay meaning.

## 01.20 World Mind proposes through Quest/Event architecture

World Mind may observe authorised summary state and propose events, quests, reactions or opportunities.

It never directly mutates the world.

## 01.21 World Mind does not receive god mode

It cannot create rare resources, kill NPCs, teleport factions, rewrite history or bypass economy because a narrative would be convenient.

## 01.22 AI World Mode is explicitly experimental

It is opt-in, visibly labelled, recoverable and separated from standard worlds where necessary.

## 01.23 AI provider/runtime is abstracted

AI features depend on project-owned capability interfaces rather than one provider.

Backends may include local model, supported external provider, user-configured provider or no provider.

## 01.24 External transmission is explicit

If data leaves the local device/server, the user/server policy must make that clear and unnecessary private/world data should not be sent.

## 01.25 Multiplayer AI policy is server-governed

Servers decide which AI features/providers are allowed.

A client cannot force AI-driven world mutation onto the server.

## 01.26 AI failure degrades gracefully

Fallbacks include deterministic planner, normal Forge UI, ordinary help/search, canned/contextual dialogue or simply no optional AI response.

## 01.27 Tutorial World is optional guidance, not Leyforge's definition

Leyforge remains sandbox-first. A player may use Tutorial World or enter normal sandbox play through the product's final onboarding choices.

## 01.28 Tutorial intensity respects player settings

The existing philosophy remains: minimal, contextual, guided or full help.

## 01.29 Tutorial World uses real production rules

No tutorial-only infinite inventory, fake recipe, fake NPC construction, fake machine, fake spell, fake ship or fake portal.

## 01.30 Tutorial World is built last

Final P181 production begins only after normal systems, Forge, content packages, UI, accessibility and localisation foundations are stable.

## 01.31 Tutorial World may use fixed seed + governed authored deltas

A useful pattern is:

```text
canonical fixed seed
+ Tutorial World package
+ Forge-authored placements/deltas/state
→ reproducible authored Tutorial World
```

The exact implementation remains evidence-driven.

## 01.32 Tutorial pacing cannot redefine canonical progression

Tutorial gates may pace exposure inside that world but do not redefine the global game.

## 01.33 Lessons teach through physical cause and effect

Prefer gathering, crafting, placing, delivering, repairing, connecting, helping, exploring, sailing and crossing to modal exposition.

## 01.34 Tutorial NPCs are real NPCs

They retain persistent identity, roles, relationships, knowledge, needs and memories.

## 01.35 Tutorial settlement is a real settlement

All seven settlement pillars apply: Housing, Provisions, Health, Work, Safety, Infrastructure and Morale.

## 01.36 Tutorial automation is real automation

Actual items, power, ports, logistics and signals are used.

## 01.37 Tutorial magic is real Flux/magic

Real Flux, runes/spells, infrastructure, risk and knowledge/progression rules apply.

## 01.38 Tutorial maritime content uses the production maritime stack

Real port, vessel, crew, water, sea-state, cargo and route systems apply.

## 01.39 Tutorial realm crossing uses canonical portal/realm architecture

No tutorial-only pocket realm is invented.

## 01.40 Secrets reward curiosity without blocking core learning

Hidden history, puzzles, tunnels and easter eggs remain optional.

## 01.41 Tutorial multiplayer teaches cooperation without requiring it

The world remains fully completable solo.

## 01.42 Graduation does not delete the world

After P191, the Tutorial World remains a normal persistent sandbox.

## 01.43 P192 is the final production milestone, not the final verification document

P192 defines the final milestone. PROD-17 remains the master evidence/certification/handoff register.

---

# 02. ARC XIX — THE MIND IN THE MACHINE

# P171 — THE IRON BOUNDARY

**Classification:** FOUNDATION  
**Player/creator payoff:** AI can be added without silently becoming authority over the game or The Forge.

## Purpose

Create the AI Constitution & Authority Boundary.

## Entry gate

PG-18 COMPLETE.

## In scope

- provider/backend abstraction;
- capability discovery;
- local/external distinction;
- availability state;
- request budget/timeout;
- structured intent/result envelope;
- provenance;
- permissions/policy;
- privacy classification;
- diagnostics;
- validation;
- fallback;
- multiplayer/server policy;
- feature-level enable/disable.

AI result classes may include:

- text suggestion;
- structured proposal;
- Forge source draft;
- dialogue candidate;
- task/plan proposal;
- event/quest proposal;
- explanation/troubleshooting response.

## Explicit non-scope

Any AI feature directly mutating authoritative world truth.

## Core law

```text
AI MAY PROPOSE
SYSTEMS VALIDATE
AUTHORITY COMMITS
```

## Child slices

- P171-A — AI capability/provider interface;
- P171-B — request/result/provenance model;
- P171-C — policy/privacy/permissions;
- P171-D — structured-output validation;
- P171-E — fallback/diagnostics;
- P171-F — multiplayer/server/security reconciliation.

## Acceptance

1. AI can be globally disabled.
2. No AI response has direct world-mutation authority.
3. Unknown content IDs fail validation.
4. Timeout/provider failure degrades gracefully.
5. local/external backend status is visible.
6. external transmission policy is explicit.
7. server can restrict AI capability.
8. AI provenance attaches to accepted content where appropriate.
9. non-AI systems remain unchanged when AI is disabled.
10. final SHA/CI passes.

## Negative tests

Provider unavailable; malformed structured output; fabricated content ID; forbidden action proposal; timeout; permission-bypass prompt; server AI disabled.

## Exit gate

AI authority boundary proven.

---

# P172 — THE LISTENER AT THE ANVIL

**Classification:** FORGE-FIRST / COOL-PULL  
**Player/creator payoff:** A creator can describe what they want and receive a structured Forge proposal.

## Purpose

Create Natural-Language Forge Intent.

## In scope

Input may describe:

- asset class;
- purpose;
- visual/theme constraints;
- materials;
- dimensions;
- behaviours;
- dependencies;
- variants;
- target realm/culture/content;
- existing source to modify.

Interpretation output:

- inferred Forge domain;
- candidate operation;
- target source IDs;
- structured parameters;
- unresolved ambiguity;
- dependencies;
- warnings;
- proposed Creation Journey;
- affected products.

Example:

> “Make a small Dawnwood waterwheel that can drive a flour mill.”

should resolve toward:

- Machine/Structure domain;
- canonical Dawnwood;
- mechanical-power connections;
- water interaction;
- scale/footprint;
- existing mill compatibility.

It must not directly commit.

## Core law

Natural language becomes structured Forge intent before source mutation.

## Child slices

- P172-A — intent/domain classification;
- P172-B — canonical ID resolution;
- P172-C — ambiguity/clarification;
- P172-D — structured proposal schema;
- P172-E — preview/approval;
- P172-F — accessibility/privacy/reconciliation.

## Acceptance

- representative prompts route correctly;
- canonical references resolve rather than being guessed;
- ambiguity produces options/clarification;
- unsupported requests explain why;
- preview shows affected source/dependencies;
- no mutation before approval;
- AI-off fallback remains normal Forge UI;
- final SHA/CI passes.

## Rule-of-cool target

> **“I want a thing like this...” → The Forge understands what kind of thing you mean.**

## Exit gate

Natural-language Forge intent operational.

---

# P173 — THE APPRENTICE SMITH

**Classification:** FORGE-FIRST / COOL-PULL  
**Player/creator payoff:** AI can draft editable Forge content while validation, revision and human approval remain authoritative.

## Purpose

Create AI-Assisted Forge Creation.

## In scope

AI-assisted operations may include:

- source-field drafting;
- material-role suggestions;
- variant generation;
- recipe candidates;
- structure-layout candidates;
- machine port mapping proposals;
- creature profile drafts;
- dialogue/lore drafts;
- quest/event source drafts;
- icon/capture briefs;
- localisation drafts;
- content-pack metadata;
- validator-fix suggestions.

Every result becomes:

- editable Forge source;
- explicit diff/proposal;
- provenance-bearing;
- validation-bound.

## Recipe proposal law

AI recipe candidates use valid IDs, valid process/workstation, legal quantities and explicit assumptions.

It cannot invent hidden resources to make a proposal “work”.

## Source law

Accepted AI output is persisted as normal source.

The game never relies on regenerating the same response.

## Child slices

- P173-A — source-draft framework;
- P173-B — domain-specific proposal adapters;
- P173-C — diff/edit/approval UX;
- P173-D — provenance/revision;
- P173-E — validation/Test Lab integration;
- P173-F — AI-off equivalence/reconciliation.

## Acceptance

- several Forge source classes can be drafted;
- outputs remain editable before approval;
- invalid canonical references are rejected;
- accepted source follows ordinary bake/package path;
- AI provenance is retained;
- human edits remain visible in revision history;
- AI cannot self-certify Production Ready;
- accepted content remains usable after provider/model removal;
- final SHA/CI passes.

## Rule-of-cool target

> **The AI doesn't make game content somewhere else. It works inside The Forge.**

## Exit gate

AI-assisted Forge creation operational.

---

# P174 — THE LIBRARIAN IN THE WALLS

**Classification:** FORGE-FIRST / COOL-PULL  
**Player/creator payoff:** The Forge can explain problems, dependencies and workflows using real project evidence.

## Purpose

Create Forge AI Assistant & Troubleshooter.

## Evidence sources

- current Forge source;
- validation diagnostics;
- dependency graph;
- revision diff;
- Test Lab results;
- Performance Observatory;
- package manifest;
- migration state;
- approved production documents;
- relevant registry definitions.

## Capabilities

- explain a diagnostic;
- trace a dependency;
- suggest likely fixes;
- explain workflow;
- locate authority;
- summarise changes;
- propose a validation plan;
- identify stale bakes;
- compare alternatives;
- draft governed task/handoff notes where permitted.

## Core law

Evidence first, speculation second.

## Child slices

- P174-A — evidence retrieval/context builder;
- P174-B — diagnostic explanation;
- P174-C — dependency/source guidance;
- P174-D — fix proposal;
- P174-E — revision/task/handoff helper;
- P174-F — privacy/security/reconciliation.

## Acceptance

- assistant grounds troubleshooting in available evidence;
- unknown cause is allowed as an answer;
- proposed fixes remain proposals;
- restricted source is not leaked;
- manual diagnostics still work with AI disabled;
- backend failure does not block Forge;
- final SHA/CI passes.

## Exit gate

Forge AI assistance operational.

---

# P175 — THE COMPANION FLAME

**Classification:** COOL-PULL / OPTIONAL  
**Player/creator payoff:** A player may choose an intelligent companion that remembers and helps without possessing omniscient developer knowledge.

## Purpose

Create Optional Player Companion Intelligence.

## In scope

Companion context may include:

- personality/profile;
- player/party-known knowledge;
- Codex;
- maps;
- quests;
- companion memory;
- authorised inventory/plan summaries;
- local/visible observations;
- public settlement/faction information.

Capabilities may include:

- conversational explanation;
- reminders;
- planning suggestions;
- route preparation;
- settlement advice;
- recipe/knowledge lookup;
- risk warnings;
- roleplay;
- recap;
- map-marker proposals.

## Explicit non-scope

- autonomous resource spending by default;
- hidden-world omniscience;
- automatic diplomacy;
- combat cheat authority;
- deciding player choices.

## Knowledge law

If the player has not discovered a hidden ruin, the companion cannot reveal it merely because worldgen knows it exists.

## Memory law

Companion memory is bounded and governed by product privacy/control policy.

## Child slices

- P175-A — companion identity/personality;
- P175-B — knowledge context;
- P175-C — conversation/memory;
- P175-D — planning/help tools;
- P175-E — privacy/controls;
- P175-F — AI-off/fallback/reconciliation.

## Acceptance

- answers differ based on legitimate player knowledge;
- hidden truth does not leak;
- suggestions do not execute automatically;
- memory persists according to policy;
- player can disable companion;
- provider failure does not block play;
- multiplayer/server policy is respected;
- final SHA/CI passes.

## Rule-of-cool target

> **A companion that knows the journey you've had — but not the secrets you haven't found.**

## Exit gate

Optional companion operational.

---

# P176 — WHISPERS OF THE HEARTH

**Classification:** COOL-PULL / OPTIONAL INTEGRATION  
**Player/creator payoff:** Settlements and selected NPCs can gain richer long-horizon intent while deterministic simulation remains authoritative.

## Purpose

Create Bounded NPC / Settlement Intelligence.

## In scope

Optional AI may propose:

### NPC-level

- conversational phrasing;
- social goals;
- personal priorities;
- memory interpretation;
- non-critical long-horizon plans;
- request/quest candidates.

### Settlement-level

- project priorities;
- expansion ideas;
- policy proposals;
- trade focus;
- defence preparation;
- migration/recruitment goals;
- infrastructure strategy;
- diplomatic proposals.

Structured proposals may include:

- goal;
- reasoning summary;
- required resources;
- dependencies;
- permissions;
- urgency;
- expected benefit;
- confidence.

## Deterministic owners remain

- needs;
- inventories;
- jobs;
- schedules;
- construction;
- economy;
- law execution;
- combat;
- final project approval/commit.

## Core law

No `LLM controls NPC directly`.

AI suggests goals/actions that existing planners validate.

## Child slices

- P176-A — NPC intention proposal;
- P176-B — settlement strategy proposal;
- P176-C — deterministic planner bridge;
- P176-D — dialogue/memory expression;
- P176-E — LOD/cost/provider fallback;
- P176-F — authority reconciliation.

## Acceptance

- proposals cannot bypass resources/permissions;
- invalid project/ID is rejected;
- settlement functions with AI disabled;
- normal work/transaction systems execute approved plans;
- AI downtime cannot freeze NPC schedules;
- dialogue cannot create gameplay fact without a record;
- simulation cost remains bounded;
- final SHA/CI passes.

## Rule-of-cool target

> **The settlement can have ideas without the AI owning the settlement.**

## Exit gate

Bounded living-world intelligence operational.

---

# P177 — THE WORLD THAT WONDERS

**Classification:** COOL-PULL / OPTIONAL  
**Player/creator payoff:** An optional World Mind can notice emerging situations and suggest stories that fit actual world state.

## Purpose

Create Optional World Mind.

## Authorised summary context may include

- settlement conditions;
- faction tensions;
- economy;
- routes;
- ecology;
- major history;
- known player actions;
- realm state;
- unresolved opportunities;
- event cooldowns;
- repetition metrics.

## World Mind may propose

- contextual events;
- quest seeds;
- rumours;
- faction reactions;
- festivals/commemorations;
- expedition opportunities;
- crisis escalation/de-escalation proposals;
- world-story emphasis.

Proposal flow:

```text
World Mind
→ structured Quest/Event proposal
→ canon/ID/permission validation
→ event eligibility
→ normal event runtime
```

## Explicit non-scope

Direct resource/entity/world mutation.

## Core law

World Mind is a storyteller that obeys the same world rules as everyone else.

## Child slices

- P177-A — world-summary context;
- P177-B — proposal schemas;
- P177-C — Quest/Event bridge;
- P177-D — repetition/novelty guard;
- P177-E — cost/LOD/policy;
- P177-F — AI-off/history reconciliation.

## Acceptance

- proposal references real identities/state;
- impossible proposal is rejected;
- approved event executes through normal World Event Runtime;
- repeated suggestions remain bounded;
- World Mind failure does not stop normal events;
- player/server can disable it;
- history records actual event results;
- final SHA/CI passes.

## Rule-of-cool target

> **The world notices what is happening — without cheating to make a story happen.**

## Exit gate

Optional World Mind operational.

---

# P178 — DREAMS OF THE FORGE

**Classification:** EXPERIMENTAL / COOL-PULL  
**Player/creator payoff:** Developers/players can optionally run larger AI-assisted autonomous world experiments.

## Purpose

Create Experimental AI World / Auto-Run Simulation Mode.

## In scope

Possible controls:

- AI-assisted scenario brief;
- simulation objective;
- observer mode;
- safe time acceleration;
- World Mind frequency;
- settlement strategy AI;
- faction-strategy proposals;
- experiment checkpoints;
- pause/inspect;
- save branch/copy;
- metrics/history export;
- reset/rollback.

Use cases:

- observe civilisations developing;
- watch settlement competition;
- stress world-event generation;
- test AI planning;
- create candidate stories for developer review;
- experimental sandbox play.

## Experimental isolation law

Normal worlds cannot silently become experimental AI worlds.

Use explicit flag/branch/copy or another governed mechanism.

## Core law

AI proposals still pass through authoritative world systems.

## Child slices

- P178-A — experimental world flag/branch;
- P178-B — auto-run controls;
- P178-C — AI proposal orchestration;
- P178-D — observation/metrics/history;
- P178-E — rollback/recovery;
- P178-F — explicit experimental UX/reconciliation.

## Acceptance

- mode is opt-in;
- normal world cannot enter accidentally;
- checkpoint/pause/inspect works;
- AI cannot bypass transactions/permissions;
- provider failure cannot corrupt world;
- metrics/history export works;
- rollback/copy policy works;
- final SHA/CI passes.

## Exit gate

Experimental AI World Mode available behind explicit boundary.

---

# P179 — THE MIND IN THE MACHINE

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** AI features are proven useful, bounded and genuinely optional.

## Purpose

Certify ARC XIX.

## Certification matrix

### AI disabled

- game loads;
- world simulates;
- NPCs work;
- settlements grow;
- Forge operates;
- quests/events run;
- package creation works.

### Forge AI

- natural-language intent;
- source proposal;
- validation rejection;
- human edit/approval;
- package/runtime use;
- provider removed afterward.

### Assistant

- diagnostic evidence;
- unknown-cause handling;
- suggestion vs committed-state clarity.

### Companion

- legitimate knowledge;
- hidden truth non-leak;
- memory;
- disable/failure fallback.

### NPC / Settlement AI

- proposal;
- invalid plan rejection;
- deterministic execution;
- AI unavailable fallback.

### World Mind

- contextual event proposal;
- normal Quest/Event validation;
- disable/failure.

### Experimental Mode

- opt-in isolation;
- checkpoint/rollback.

## Adversarial/failure matrix

Test:

- hallucinated ID;
- malformed structured output;
- prompt attempts to override authority;
- restricted-source request;
- stale context;
- timeout;
- external provider unavailable;
- local model unavailable;
- server disables AI;
- player revokes AI;
- impossible recipe proposal;
- event proposal with missing NPC;
- dialogue falsely claiming gameplay completion;
- accepted AI-authored source loaded without the originating model.

## Core law

Turning AI off must not break Leyforge.

## Child slices

- P179-A — AI-off full regression;
- P179-B — Forge AI certification;
- P179-C — companion/NPC/World Mind certification;
- P179-D — privacy/server/provider failure;
- P179-E — adversarial validation;
- P179-F — performance/human review;
- P179-G — PG-19 reconciliation.

## Acceptance

1. full non-AI regression passes;
2. AI cannot directly mutate authoritative state;
3. accepted AI Forge content survives provider removal;
4. hallucinated references fail safely;
5. companion does not leak hidden truth;
6. NPC/settlement AI cannot bypass resources/permission;
7. World Mind uses normal event architecture;
8. experimental mode remains opt-in/isolated;
9. privacy/backend status is clear;
10. server AI policy is enforced;
11. failure degrades gracefully;
12. human review finds AI useful but not mandatory;
13. final SHA/CI passes.

## Rule-of-cool target

> **The intelligence feels alive because it understands Leyforge's systems — not because it is allowed to ignore them.**

## Exit gate — PG-19 OPTIONAL AI FOUNDATION

PG-19 passes only when P171–P179 are COMPLETE and disabling all AI returns the product to already-certified P170 behaviour.

---

# 03. ARC XX — THE FIRST FLAME

# P180 — A WORLD THAT TEACHES

**Classification:** FORGE-FIRST / FOUNDATION  
**Player/creator payoff:** The final onboarding world gains a formal teaching contract without becoming a separate simplified ruleset.

## Purpose

Create the Tutorial World Contract.

## Entry gate

All normal game and Forge systems must already be production-stable.

Tutorial World does not require AI.

## In scope

Tutorial World source contract:

- fixed reproducible world identity;
- seed/base generation relationship;
- authored Forge deltas;
- starting settlement/region;
- tutorial NPC roster;
- lesson zones;
- progression triggers;
- optional guidance layers;
- checkpoints/recovery;
- multiplayer compatibility;
- accessibility/localisation;
- secrets;
- post-graduation persistence.

Tutorial lesson record may include:

- lesson ID;
- concept;
- prerequisites;
- discovery trigger;
- guidance-intensity variants;
- required real action;
- success predicate;
- optional hints;
- accessibility alternative;
- fail/recovery;
- follow-up;
- skip/revisit;
- Knowledge/Codex links.

## Guidance modes

Support production variants equivalent to:

- minimal;
- contextual;
- guided;
- full help.

## Core law

Every lesson points to real system state/action.

## Explicit non-scope

Fake tutorial systems, disposable NPCs, tutorial-only resources, mandatory campaign completion before normal play.

## Child slices

- P180-A — tutorial world/package schema;
- P180-B — lesson/guidance schema;
- P180-C — NPC/settlement/knowledge integration;
- P180-D — checkpoint/recovery;
- P180-E — skip/revisit/accessibility;
- P180-F — multiplayer/localisation/reconciliation.

## Acceptance

- Tutorial World is a normal governed world/package;
- lessons query real success state;
- guidance intensity can vary;
- player may skip/revisit where designed;
- normal worlds remain independently available;
- Tutorial World persists after lessons;
- AI can be entirely disabled;
- final SHA/CI passes.

## Exit gate

Tutorial World production contract stable.

---

# P181 — THE VALLEY OF BEGINNINGS

**Classification:** FORGE-FIRST / COOL-PULL  
**Player/creator payoff:** The final handcrafted Tutorial World is built using the complete Forge and real production content.

## Purpose

Build the Tutorial World package.

## Production approach

Prefer a reproducible authored foundation such as:

```text
fixed canonical seed
+ World/Structure/Biome/Quest Forge sources
+ authored world deltas/placements
+ tutorial package manifest
```

Exact technical packaging remains evidence-driven.

## Required world qualities

- attractive but not overwhelming;
- readable routes and landmarks;
- safe initial refuge;
- nearby meaningful resources;
- visible settlement life;
- early danger clearly telegraphed;
- later automation/magic landmarks;
- ocean/harbour access;
- portal/realm showcase access;
- hidden routes/secrets;
- room to continue sandbox play after graduation.

## Required real systems

- seed/world identity;
- voxels;
- water;
- ecology;
- structures;
- settlement;
- NPCs;
- economy;
- machines;
- magic;
- events;
- knowledge/maps;
- maritime;
- realm portal;
- multiplayer compatibility.

## Core law

The world is authored with The Forge, not hand-hacked into runtime code.

## Child slices

- P181-A — fixed seed/base region;
- P181-B — valley/settlement/route composition;
- P181-C — progression landmarks;
- P181-D — maritime/portal expansion zones;
- P181-E — art/audio/capture/polish;
- P181-F — package/performance/regression.

## Acceptance

- world package builds through Forge;
- no tutorial-only gameplay subsystem is required;
- all major lesson areas are physically reachable;
- world remains coherent with tutorial prompts disabled;
- save/load and multiplayer work;
- performance/scalability passes;
- ART/accessibility/localisation review passes;
- final SHA/CI passes.

## Rule-of-cool target

> **The first place players remember from Leyforge should be a real place worth staying in.**

## Exit gate

Valley of Beginnings built.

---

# P182 — FIRST FOOTPRINTS

**Classification:** COOL-PULL  
**Player/creator payoff:** The Tutorial World teaches survival, voxel interaction and first shelter through real actions.

## Purpose

Create the Survival & Building Journey.

## In scope

Teach/expose:

- movement/look/interact;
- gather;
- break/place;
- inventory/hotbar;
- basic tools;
- food/survival;
- campfire;
- simple crafting;
- shelter;
- repair;
- map/landmark;
- save/recovery basics;
- contextual help.

## Lesson philosophy

The player should physically:

- gather resources;
- craft useful items;
- alter terrain;
- place blocks;
- make/repair shelter;
- survive a normal cycle/threat appropriate to settings.

## Core law

No fake tutorial inventory.

Starting gifts are explicit world/character starting state.

## Child slices

- P182-A — movement/interaction;
- P182-B — gather/inventory/tool;
- P182-C — craft/fire/survival;
- P182-D — voxel build/shelter;
- P182-E — map/help/recovery;
- P182-F — skip/accessibility/multiplayer review.

## Acceptance

- real recipes/resources used;
- alternative valid sandbox solutions tolerated where possible;
- no exact house shape required;
- guidance intensity works;
- accessibility preserves lesson;
- multiplayer contribution does not break solo;
- final SHA/CI passes.

## Exit gate

Core survival/building onboarding proven.

---

# P183 — A FIRE SHARED

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** The player learns that settlements are living communities by actually helping one function and grow.

## Purpose

Create the Settlement Journey.

## In scope

Introduce:

- named NPCs;
- relationships/dialogue;
- seven settlement pillars;
- jobs/professions;
- warehouse/storage;
- project request;
- resource delivery;
- real NPC construction;
- household/housing;
- food/provisions;
- safety/infrastructure;
- morale/community;
- consequence/recovery.

## Required project

At least one visible improvement proceeds through:

```text
need
→ plan
→ resource request
→ real warehouse/project stock
→ NPC/player labour
→ construction stages
→ completed capability
→ settlement response
```

## Core law

The structure does not spawn when a quest flag reaches 100%.

## Child slices

- P183-A — NPC introductions/relationships;
- P183-B — needs/warehouse/jobs;
- P183-C — settlement project;
- P183-D — construction/celebration;
- P183-E — consequence/recovery;
- P183-F — guidance/multiplayer review.

## Acceptance

- project uses exact normal resources;
- Builder/profession logic works;
- completed structure changes real capability;
- multiple valid contribution methods exist where practical;
- failure/neglect has recoverable consequence;
- NPCs remember key contribution;
- final SHA/CI passes.

## Rule-of-cool target

> **The first village grows because you and its people actually built something together.**

## Exit gate

Settlement onboarding proven.

---

# P184 — GEARS IN THE HILLS

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** The player discovers automation by solving a real production/logistics problem.

## Purpose

Create the Automation Journey.

## In scope

Teach:

- repeated-work bottleneck;
- mechanical power;
- machine;
- typed ports/connections;
- input/output;
- logistics;
- warehouse;
- blockage;
- throughput;
- optional signal/control;
- maintenance;
- NPC coexistence.

## Example journey

```text
settlement needs more flour/material
→ manual process demonstrates bottleneck
→ waterwheel/power source
→ powered machine
→ input delivery
→ output routing
→ warehouse
→ diagnose blockage
→ production improves
```

Exact content remains final design choice.

## Core law

Normal machine/resource-conservation rules apply.

## Child slices

- P184-A — bottleneck/manual baseline;
- P184-B — power/machine setup;
- P184-C — logistics/storage;
- P184-D — diagnostics/blockage;
- P184-E — signal/expansion hint;
- P184-F — accessibility/multiplayer review.

## Acceptance

- no resource duplication/loss;
- machine ports use normal Connection contract;
- UI reports real blockage/throughput;
- cause/effect is understandable;
- alternative layouts work within constraints;
- final SHA/CI passes.

## Rule-of-cool target

> **The player watches the settlement make something without their hands touching every step.**

## Exit gate

Automation onboarding proven.

---

# P185 — WHEN STONE BEGINS TO GLOW

**Classification:** COOL-PULL  
**Player/creator payoff:** The player discovers Flux and begins turning ordinary engineering into mage-engineering.

## Purpose

Create the Magic Journey.

## In scope

Introduce selected production systems:

- Flux discovery;
- Flux resource;
- rune or spell;
- magical tool/action;
- magical infrastructure;
- risk/cost;
- alchemy or ritual glimpse;
- automation/magic connection;
- Codex/research knowledge.

Optional advanced secret/showcase:

- Flux-powered voxel pipe organ composition from P72.

## Core law

Magic teaching uses real knowledge/progression requirements.

No tutorial-only “starter mana” system.

## Child slices

- P185-A — Flux discovery/knowledge;
- P185-B — first spell/rune;
- P185-C — magical infrastructure;
- P185-D — risk/repair/resource;
- P185-E — automation integration;
- P185-F — advanced secret/accessibility.

## Acceptance

- Flux acquisition/use is normal world/resource state;
- spell/rune uses production systems;
- infrastructure consumes/transmits real Flux;
- risk remains meaningful;
- Codex/research updates legitimately;
- optional advanced composition is non-required;
- final SHA/CI passes.

## Rule-of-cool target

> **The moment the player's workshop stops being merely mechanical.**

## Exit gate

Magic onboarding proven.

---

# P186 — BEYOND THE SAFE ROAD

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** The player learns exploration, knowledge, combat and discovery beyond the valley.

## Purpose

Create Exploration, Combat & Discovery Journey.

## In scope

- rumours;
- map uncertainty;
- route preparation;
- weather/environment;
- resource expedition;
- cave/site/ruin;
- creature threat;
- combat;
- damage/healing;
- loot/resource;
- discovery;
- Codex;
- quest/event aftermath;
- retreat/surrender where applicable;
- death/recovery according to settings.

## Core law

The destination is a real world site governed by normal Knowledge, Structure, Creature and Event systems.

## Child slices

- P186-A — rumour/map/route;
- P186-B — expedition preparation;
- P186-C — cave/site/discovery;
- P186-D — combat/recovery;
- P186-E — knowledge/Codex/aftermath;
- P186-F — difficulty/accessibility review.

## Acceptance

- hidden sites remain hidden until legitimate discovery;
- rumour/evidence can guide without omniscience;
- combat consumes real resources/state;
- retreat/recovery respects world settings;
- discovery persists;
- event/quest aftermath affects the world;
- final SHA/CI passes.

## Exit gate

Exploration/combat/discovery onboarding proven.

---

# P187 — THE HARBOUR BEYOND

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** The player reaches the sea, boards a real vessel and experiences maritime Leyforge.

## Purpose

Create the Maritime Tutorial Showcase.

## In scope

- harbour/port;
- cargo;
- vessel;
- boarding;
- crew;
- navigation;
- tide/current/sea-state introduction;
- short voyage;
- trade/delivery;
- optional dive/wreck;
- storm warning;
- vessel damage/repair glimpse.

## Core law

P103–P114 systems are used unchanged.

## Child slices

- P187-A — harbour arrival;
- P187-B — cargo/crew/vessel;
- P187-C — navigation/sea-state;
- P187-D — destination/trade;
- P187-E — underwater/storm/damage branch;
- P187-F — performance/accessibility/multiplayer review.

## Acceptance

- port berth/route valid;
- vessel is a normal persistent vessel;
- cargo transaction exact;
- crew are real NPCs;
- sea-state affects trip appropriately;
- delaying/abandoning voyage does not break world;
- final SHA/CI passes.

## Rule-of-cool target

> **The tutorial horizon stops at nothing.**

## Exit gate

Maritime onboarding/showcase proven.

---

# P188 — THE DOOR BETWEEN WORLDS

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** The Tutorial World culminates in a genuine crossing beyond the Overworld.

## Purpose

Create the Realm Tutorial Showcase.

## In scope

- portal discovery/preparation;
- realm knowledge;
- key/resource/activation;
- canonical portal family;
- crossing;
- realm-specific law/hazard;
- short bounded objective/exploration;
- realm resource/knowledge;
- return;
- persistent consequence.

The showcased realm is chosen from the current six non-Overworld realms based on pacing, accessibility and thematic fit.

No tutorial-only realm is created.

## Core law

P115–P126 architecture is used unchanged.

## Child slices

- P188-A — portal setup/knowledge;
- P188-B — activation/preparation;
- P188-C — realm crossing;
- P188-D — hazard/resource/interaction;
- P188-E — return/aftermath;
- P188-F — accessibility/performance/reconciliation.

## Acceptance

- canonical portal used;
- actor/inventory remain same identities;
- realm law applies/reverts;
- knowledge/map rules respected;
- return state persists;
- lesson does not reveal every realm;
- final SHA/CI passes.

## Rule-of-cool target

> **Just when the player thinks they understand the size of Leyforge, the door opens.**

## Exit gate

Realm onboarding/showcase proven.

---

# P189 — SECRETS BENEATH THE LESSONS

**Classification:** COOL-PULL / EXPANSION  
**Player/creator payoff:** Curious players discover that the Tutorial World is a real place with hidden history and surprises beyond the lesson path.

## Purpose

Add Optional Secrets, Easter Eggs & Deep Exploration.

## Possible secret categories

- hidden tunnels;
- developer memorials/nods;
- historical layers;
- hidden archive entries;
- unusual machine/magic compositions;
- rare viewpoints;
- secret rooms;
- ruins beneath later construction;
- environmental storytelling;
- musical/rune puzzles;
- optional high-skill traversal;
- harmless jokes;
- advanced Forge-built contraptions;
- hidden lore connections.

## Core laws

- secrets use normal systems/content;
- core progression does not depend on them;
- discovery should reward observation/knowledge;
- broadly intended secrets receive accessibility alternatives where appropriate.

## Child slices

- P189-A — secret map/coverage;
- P189-B — historical/environmental secrets;
- P189-C — puzzle/composition secrets;
- P189-D — developer/easter-egg layer;
- P189-E — hidden knowledge/rewards;
- P189-F — spoiler/accessibility/reconciliation.

## Acceptance

- secrets do not break canonical progression;
- discovery uses normal Knowledge/History where applicable;
- rewards are normal resources/content;
- secrets persist after graduation;
- spoiler presentation respects discovery;
- final SHA/CI passes.

## Rule-of-cool target

> **Players should still be finding shit in the “tutorial” long after they stopped thinking of it as one.**

## Exit gate

Tutorial secrets layer complete.

---

# P190 — MANY HANDS AT THE FIRST FIRE

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** The Tutorial World works cooperatively without making solo onboarding worse.

## Purpose

Certify Multiplayer Tutorial Experience.

## In scope

- join-in-progress;
- shared lesson-state policy;
- personal guidance;
- settlement projects;
- resource contribution;
- building together;
- automation tasks;
- combat;
- vessel journey;
- realm crossing where supported;
- pings/communication;
- party knowledge policy;
- disconnect/reconnect;
- differing tutorial-intensity settings where feasible.

## Core laws

- solo remains fully supported;
- world progress and personal tutorial progress remain distinct where appropriate;
- one player's lesson completion does not automatically mean another player learned it.

## Child slices

- P190-A — lesson scope/player state;
- P190-B — co-op building/settlement;
- P190-C — automation/combat/voyage;
- P190-D — knowledge/guidance differences;
- P190-E — reconnect/late join;
- P190-F — usability/performance/reconciliation.

## Acceptance

- solo Tutorial World still works;
- several players can share the world;
- personal guidance state remains coherent;
- shared projects conserve resources;
- late joiners can recover context;
- reconnect preserves tutorial/world state;
- human co-op onboarding review passes;
- final SHA/CI passes.

## Exit gate

Multiplayer Tutorial World certified.

---

# P191 — THE WORLD IS YOURS

**Classification:** INTEGRATION / EMOTIONAL PAYOFF  
**Player/creator payoff:** The tutorial ends by giving control back to the player rather than ejecting them from the world.

## Purpose

Create Graduation & Continuing Sandbox transition.

## In scope

Graduation may:

- acknowledge representative mastery;
- reduce/remove optional guidance;
- provide final Codex/help links;
- reveal broader world possibilities;
- open optional goals;
- mark tutorial completion on profile;
- retain world as ordinary playable save.

Post-graduation:

- NPCs remain;
- settlement continues;
- machines continue;
- maritime routes remain;
- secrets remain;
- portal remains according to world rules;
- player keeps building;
- multiplayer remains possible.

## Core law

No forced credits/teleport/delete/new-game requirement.

## Child slices

- P191-A — graduation criteria;
- P191-B — acknowledgement/presentation;
- P191-C — guidance transition;
- P191-D — post-tutorial continuity;
- P191-E — profile/world completion state;
- P191-F — skip/replay/accessibility review.

## Acceptance

- world remains playable after graduation;
- no persistent system resets;
- guidance can be disabled/re-enabled;
- completion state stored separately from world truth where appropriate;
- skipped lessons do not corrupt world;
- returning later works;
- final SHA/CI passes.

## Rule-of-cool target

> **The tutorial doesn't end with “thanks for playing.” It ends with “the world is yours.”**

## Exit gate

Tutorial graduation works.

---

# P192 — THE FIRST FLAME

**Classification:** FINAL PRODUCTION MILESTONE / INTEGRATION / COOL-PULL  
**Player/creator payoff:** The complete Leyforge production programme is demonstrated as one coherent game and creation platform.

## Purpose

Define and execute the final production milestone before PROD-17 performs formal master verification/handoff.

## Required certification scope

### Foundation

- world bootstrap;
- deterministic identity;
- voxel editing;
- persistence;
- registry/content identity.

### Forge

- specialist authoring;
- Creation Journey;
- dependency graph;
- validation;
- Test Lab;
- live iteration;
- revision;
- packaging;
- AI disabled and enabled on separate paths.

### Survival / Crafting / Building

- gather;
- inventory;
- tools;
- recipes;
- construction;
- furniture/interactive components.

### Civilisation

- NPC identity;
- professions;
- seven settlement pillars;
- projects;
- migration/growth;
- governance;
- economy;
- war/consequence/history.

### Automation

- mechanical power;
- universal connections;
- machines;
- logistics;
- signals;
- factory integration.

### Magic

- Flux;
- runes/spells;
- infrastructure;
- alchemy;
- ritual;
- magic/automation composition.

### Exploration / Combat / Creatures

- ecology;
- creatures;
- equipment;
- combat;
- caves/sites/dungeons;
- worldgen/biomes;
- maps/knowledge.

### Maritime

- water;
- waves/tides/currents;
- ports;
- vessels;
- crew;
- trade;
- underwater;
- naval combat.

### Realms

- all seven current persistent worlds;
- six canonical portal families;
- cross-realm trade/persistence.

### Knowledge / History

- research;
- quests/events;
- memory;
- generations;
- rumours;
- archives;
- historical layering;
- Chronicle.

### Multiplayer / Community / Release

- join/reconnect;
- cooperative build/settlement;
- dedicated server;
- community-safe packages;
- low-end profile;
- accessibility;
- localisation;
- world creation;
- character setup;
- migration/recovery;
- update;
- diagnostics;
- shipping build.

### Optional AI

- authority boundary;
- Forge intent/creation;
- assistant;
- companion;
- bounded NPC/settlement intelligence;
- World Mind;
- experimental isolation;
- complete AI-off equivalence.

### Tutorial World

- P180–P191 complete;
- real systems throughout;
- world remains playable;
- multiplayer works;
- hidden content optional.

## First Flame human-facing journey

A representative final run should be able to demonstrate:

```text
arrive in Valley of Beginnings
→ gather and build
→ help named settlers
→ watch a real settlement project complete
→ create/repair production infrastructure
→ automate useful work
→ discover Flux
→ combine magic and engineering
→ follow a rumour beyond the safe road
→ fight/explore/discover
→ reach the harbour
→ sail a real vessel
→ return with cargo/knowledge
→ activate a canonical realm portal
→ cross and return
→ uncover optional secrets
→ play cooperatively
→ graduate
→ continue living in the same world
```

## Production evidence requirement

P192 completion requires evidence produced under PROD-06 and indexed by PROD-17.

This contract does **not** mark P192 COMPLETE.

## Final anti-cheat law

No subsystem may pass P192 by substituting:

- tutorial-only fake state;
- hardcoded showcase outcomes;
- manually staged hidden resource quantities;
- required developer teleport;
- pre-rendered non-interactive substitute;
- AI authority bypass;
- disabled persistence;
- editor-only behaviour.

## Child slices

- P192-A — final scenario/certification matrix;
- P192-B — Tutorial World complete run;
- P192-C — mature-world regression;
- P192-D — Forge/package/content certification;
- P192-E — multiplayer/server/release certification;
- P192-F — AI-on/AI-off certification;
- P192-G — accessibility/localisation/performance;
- P192-H — final human review;
- P192-I — evidence reconciliation into PROD-17.

## Acceptance

1. P01–P191 required parent slices are COMPLETE or hold an explicitly governed disposition permitted by PROD-17.
2. Tutorial World uses real production systems.
3. Tutorial World remains playable after graduation.
4. mature-world regressions pass.
5. Forge produces governed content through source→validate→bake→package.
6. non-AI product remains complete.
7. AI features remain optional/bounded.
8. multiplayer/dedicated-server certification passes.
9. save/update/recovery paths pass.
10. seven-world persistence remains certified.
11. community-content boundaries remain safe.
12. accessibility/localisation/scalability pass.
13. shipping-like build passes performance/integrity gates.
14. no blocker-level authority, data-loss, migration, security, accessibility or canonical-content defect remains unresolved.
15. human review confirms one coherent Leyforge experience.
16. all required evidence is indexed for PROD-17.
17. final governed SHA/CI/release-candidate evidence passes.

## Rule-of-cool target

> # **THE FIRST FLAME**
>
> The first complete Leyforge world the player sees proves the whole thing works.

## Exit gate — PG-20 FINAL PRODUCTION MILESTONE

P192 can only be marked COMPLETE after PROD-17 verifies its evidence and final handoff conditions.

---


# 04. PG-19 — Optional AI Foundation Summary

| Capability | Parent |
| --- | --- |
| AI Constitution & Authority Boundary | P171 |
| Natural-Language Forge Intent | P172 |
| AI-Assisted Forge Creation | P173 |
| Forge AI Assistant / Troubleshooter | P174 |
| Optional Player Companion | P175 |
| Bounded NPC / Settlement Intelligence | P176 |
| Optional World Mind | P177 |
| Experimental AI World Mode | P178 |
| AI Certification | P179 |

Minimum end-to-end:

```text
AI request
→ bounded context
→ structured proposal
→ normal validation
→ human/system authority
→ normal committed state

then:

disable AI
→ game and Forge continue normally
```

---

# 05. PG-20 — The First Flame Summary

| Capability | Parent |
| --- | --- |
| Tutorial World Contract | P180 |
| Valley of Beginnings | P181 |
| Survival / Building Journey | P182 |
| Settlement Journey | P183 |
| Automation Journey | P184 |
| Magic Journey | P185 |
| Exploration / Combat / Discovery | P186 |
| Maritime Showcase | P187 |
| Realm Showcase | P188 |
| Secrets / Easter Eggs | P189 |
| Multiplayer Tutorial Certification | P190 |
| Graduation / Continuing Sandbox | P191 |
| Final Production Milestone | P192 |

Minimum player journey:

```text
survive
→ build
→ belong
→ automate
→ discover magic
→ explore
→ sail
→ cross worlds
→ uncover secrets
→ cooperate
→ graduate
→ keep playing
```

---

# 06. Recommended Production Concurrency

## P171 first

No AI feature begins implementation before the authority/provider/privacy boundary is stable enough to prevent direct-mutation shortcuts.

## P172 / P173 / P174

Natural-language intent, content drafting and Forge troubleshooting may overlap after P171 because they share context, provenance and validation infrastructure.

## P175 / P176 / P177

Companion, settlement intelligence and World Mind may share AI capability infrastructure, but each receives its own Knowledge and Permission context.

They must not collapse into one global omniscient model context.

## P178

Experimental AI World Mode should wait until bounded settlement/World Mind proposal pathways exist.

## P179

AI certification occurs only after all optional AI surfaces exist and includes a complete AI-disabled run.

## P180 before P181

The Tutorial World contract and lesson schema may be drafted before final content production, but the actual Valley of Beginnings is built only after the game and Forge are production-stable.

## P182–P188

Lesson content may be iterated in parallel after the world structure stabilises, provided shared guidance and real-system contracts remain unchanged.

## P189

Secrets are layered after core tutorial routes are stable.

## P190 / P191

Multiplayer onboarding and graduation validate the near-final world.

## P192

P192 is certification and integration, not a place to invent unfinished features.

---

# 07. Explicit Anti-Scope

## AI anti-scope

Reject:

- AI-authoritative inventory/world mutation;
- hidden direct save/database mutation;
- model-generated stable IDs accepted without registry;
- AI self-approval;
- AI-only Forge paths required for content creation;
- AI-only NPC survival/planning;
- omniscient companion;
- World Mind god mode;
- provider lock-in as world authority;
- experimental AI mode silently enabled in normal saves.

## Tutorial anti-scope

Reject:

- fake tutorial recipes/resources;
- scripted NPC construction without labour/resources;
- tutorial-only machine rules;
- tutorial-only spell rules;
- tutorial-only ship or portal;
- forced single house design;
- mandatory Tutorial World before normal sandbox access;
- Tutorial World deletion after graduation;
- handcrafted Tutorial World used as justification to abandon seed-generated normal worlds.

---

# 08. Cross-Arc Architectural Locks

## 08.1 AI is another untrusted input source

This is the simplest safe architecture.

Player input, imported content and AI proposals all require validation before authoritative mutation.

## 08.2 Accepted AI source outlives the model

Once approved, content becomes normal Forge source.

The provider can disappear and the source still works.

## 08.3 AI enriches intention without owning execution

NPC, settlement and World Mind systems gain creativity while resource, permission and state systems remain deterministic/authoritative.

## 08.4 Knowledge prevents omniscient AI characters

Companion/NPC/World Mind contexts can be constrained by legitimate knowledge.

## 08.5 Quest/Event Forge is the World Mind safety valve

World Mind can suggest stories because P140/P141 already provide a governed route for stories to become world events.

## 08.6 Tutorial World is the ultimate Forge integration asset

It uses:

- World Forge;
- Biome Forge;
- Structure Forge;
- Character/Creature Forge;
- Machine Forge;
- Rune/Spell Forge;
- Vessel Forge;
- Portal/Realm Forge;
- Quest/Event Forge;
- UI/Icon/Capture/Package Forge.

If the Tutorial World requires a hidden manual pipeline, The Forge is not truly complete.

## 08.7 Tutorial lessons are state checks, not fake flags

A lesson such as:

> “Provide enough food for two days.”

should query real settlement stock/need state rather than simply set a tutorial boolean because a highlighted crate was clicked.

## 08.8 Graduation protects sandbox identity

After the teaching journey, the Tutorial World becomes simply another living Leyforge world.

## 08.9 P192 is programme integration; PROD-17 is programme certification

This keeps milestone execution separate from final evidence governance.

---

# 09. Persistent Regression Fixtures

Retain:

- P171 AI-off/authority/provider-failure suite;
- P172 natural-language intent corpus;
- P173 AI Forge draft/validation corpus;
- P174 diagnostic assistant evidence suite;
- P175 hidden-knowledge companion suite;
- P176 settlement-planning authority fixture;
- P177 World Mind event-proposal fixture;
- P178 experimental AI-world isolation save;
- P179 AI-on/off certification suite;
- P180 tutorial lesson-schema package;
- P181 Valley of Beginnings canonical package;
- P182 survival/building onboarding run;
- P183 settlement-project tutorial run;
- P184 automation tutorial chain;
- P185 magic tutorial chain;
- P186 exploration/combat/discovery run;
- P187 maritime tutorial run;
- P188 realm-crossing tutorial run;
- P189 secret-discovery regression;
- P190 multiplayer tutorial world;
- P191 post-graduation continuation save;
- P192 First Flame final certification suite.

P179, P181, P191 and P192 are top-tier long-term regressions.

---

# 10. ProductionRegistry Seed Entries

```text
P171 — The Iron Boundary
P172 — The Listener at the Anvil
P173 — The Apprentice Smith
P174 — The Librarian in the Walls
P175 — The Companion Flame
P176 — Whispers of the Hearth
P177 — The World That Wonders
P178 — Dreams of the Forge
P179 — The Mind in the Machine
P180 — A World That Teaches
P181 — The Valley of Beginnings
P182 — First Footprints
P183 — A Fire Shared
P184 — Gears in the Hills
P185 — When Stone Begins to Glow
P186 — Beyond the Safe Road
P187 — The Harbour Beyond
P188 — The Door Between Worlds
P189 — Secrets Beneath the Lessons
P190 — Many Hands at the First Fire
P191 — The World Is Yours
P192 — THE FIRST FLAME
```

No status becomes READY or COMPLETE merely because PROD-16 exists.

---

# 11. Open Decisions Deliberately Deferred to Evidence

PROD-16 does not silently decide:

- exact AI provider/model;
- local-model size;
- AI hardware acceleration requirements;
- provider/subscription business model;
- cloud-vs-local defaults;
- raw-prompt retention policy;
- token/context budgets;
- companion personality;
- which NPCs receive AI enhancement;
- World Mind cadence;
- experimental auto-run speed;
- first-crossing Tutorial realm;
- Tutorial World seed;
- exact Valley layout;
- tutorial NPC names;
- lesson text;
- tutorial safety/default difficulty;
- hidden easter eggs;
- graduation presentation.

These remain implementation, privacy, UX, content or balance decisions.

---

# 12. PROD-16 Acceptance Gate

PROD-16 is ready for owner lock when the owner agrees that:

- [ ] P171–P192 retain PROD-02 names/order;
- [ ] ARC XIX begins only after P170 non-AI certification;
- [ ] AI remains optional at feature and product level;
- [ ] AI never directly owns authoritative gameplay state;
- [ ] AI proposals use normal Permission/Transaction/Forge/Event contracts;
- [ ] AI output is treated as untrusted input;
- [ ] accepted AI Forge output becomes persistent editable source;
- [ ] AI provenance is retained appropriately;
- [ ] AI cannot silently rewrite canon or create stable IDs;
- [ ] natural language becomes structured intent before mutation;
- [ ] Forge AI cannot self-certify output;
- [ ] troubleshooting prefers project evidence over speculation;
- [ ] companion knowledge is bounded by legitimate Knowledge state;
- [ ] NPC/settlement AI cannot replace deterministic needs/work/resource simulation;
- [ ] World Mind proposes only through governed event/quest paths;
- [ ] AI World Mode remains experimental and opt-in;
- [ ] providers are abstracted from world authority;
- [ ] external transmission is explicit/policy-bound;
- [ ] multiplayer servers control AI policy;
- [ ] AI failure degrades gracefully;
- [ ] P179 proves full AI-off equivalence;
- [ ] Tutorial World remains optional sandbox guidance;
- [ ] tutorial guidance supports multiple explanation intensities;
- [ ] final Tutorial World is built after normal game/Forge completion;
- [ ] Tutorial World uses real mechanics rather than tutorial substitutes;
- [ ] Tutorial NPCs, settlement, machines, magic, vessel and portal are real systems;
- [ ] reproducible fixed-seed + governed authored-delta packaging is permitted;
- [ ] secrets remain optional;
- [ ] multiplayer tutorial never makes solo impossible;
- [ ] graduation leaves the world playable;
- [ ] P192 is the final production milestone;
- [ ] PROD-17 remains responsible for formal master verification and handoff.

---

# 13. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-16 — LEYFORGE ARCS XIX–XX PRODUCTION CONTRACTS — v0.1**
>
> ARC XIX introduces artificial intelligence only after the complete non-AI game and Forge have been certified. AI is optional, provider-abstracted and treated as untrusted input: it may interpret intent, propose plans, draft Forge source, converse and suggest events, but all consequential change continues through existing authoritative validation, Permission, Transaction, Knowledge, Quest/Event and Forge pipelines. Accepted AI-authored content becomes ordinary editable/provenanced Forge source and remains usable if the originating model disappears. Companion intelligence is constrained by legitimate player knowledge; NPC and settlement intelligence may enrich long-horizon intention but cannot replace deterministic needs, work, inventories or construction; World Mind may propose stories only through normal event architecture; and experimental AI World Mode remains explicit and isolated. P179 must prove that disabling AI restores the already-certified P170 product without loss of functionality.
>
> ARC XX then creates the final Tutorial World using the finished game and finished Forge. It is optional sandbox onboarding with adjustable guidance, not a separate simplified ruleset. The Valley of Beginnings uses real survival, settlement, automation, magic, exploration, maritime and realm systems; its NPCs are real persistent people; settlement construction consumes real resources and labour; its vessel and portal use production maritime/realm architecture; optional secrets reward curiosity; multiplayer remains optional; and graduation leaves the same world alive and playable. P192 — THE FIRST FLAME — is the final production milestone and must demonstrate the complete Leyforge experience without showcase cheats. Formal programme completion remains subject to PROD-17 master evidence verification and production handoff.

---

# 14. Principal Source Basis

PROD-16 is derived from the current Leyforge corpus and production decisions covering:

- sandbox-first gameplay and adjustable tutorial/help intensity;
- single-owner authoritative state and mutation principles;
- approved programme-level optional bounded living-world intelligence direction;
- AI-assisted Forge through normal validation and player approval;
- World Mind and experimental auto-run simulation concepts;
- Knowledge, Quest/Event, NPC Memory and World Event contracts;
- complete Forge platform established through PROD-04 and PROD-14;
- P170 requirement that Leyforge and The Forge work without AI;
- seven-world realm and maritime production contracts;
- ART/UI accessibility/localisation and production-package standards.

Where dedicated AI design documents are absent or not retrievable in the current source corpus, PROD-16 preserves the approved programme-level AI direction rather than inventing new canon-specific content.

---

# 15. Next Document

After PROD-16 acceptance/reconciliation, continue to the **final formal PROD document**:

> # **PROD-17 — Master Verification, Certification & Production Handoff Register**

PROD-17 will:

- enumerate PROD-00 through PROD-16;
- enumerate P01–P192;
- define the master evidence index;
- reconcile programme gates PG-01 through PG-20;
- record open exceptions and accepted risks;
- verify source authority and unresolved gaps;
- verify ProductionRegistry completeness;
- verify dependency corrections;
- verify AI-off and Tutorial World requirements;
- define programme-level COMPLETE / BLOCKED / HANDOFF READY conditions;
- establish the final pre-P01 repository/Brain/task/handoff verification;
- issue the final governed handoff statement.

And if the full production handoff gate passes:

> # **BEGIN P01 — EMPTY CANVAS.**

---

**End of PROD-16 v0.1 — Arcs XIX–XX Production Contracts Candidate**
