# LEYFORGE PRODUCTION PROGRAMME

## PROD-00 — Production Constitution, Authority & Scope

**Document ID:** PROD-00  
**Title:** Leyforge Production Constitution, Authority & Scope  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **LOCKED — OWNER-APPROVED PRODUCTION AUTHORITY**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional role:** Parent authority for PROD-01 through PROD-17  
**Primary upstream authorities:** Existing Leyforge gameplay/content canon, FCC programme, ART-00 through ART-10, Sets 21/22 Forge design, Sets 24–30, ENG-GOV/B-OPS, Project Brain, accepted technical evidence and ADRs  
**Primary downstream consumers:** PROD-01 through PROD-17, Codex/coding agents, Project Brain, engineering implementation, The Forge implementation, production content teams, validation/CI, release certification  

---

# 00. Executive Production Statement

Leyforge has completed the phase where the project primarily asks **what the game should be**.

The PROD programme exists to answer a different question:

> **How do we actually build the complete production game and The Forge, in a controlled order, without losing the canon, evidence, art direction, technical lessons, governance or hard-won decisions already produced?**

The programme converts the existing Leyforge corpus and the final twenty-Arc production roadmap into an executable production system.

It is not another replacement design bible.

It is not permission to re-litigate settled canon every time implementation becomes inconvenient.

It is not a requirement to finish every detail of every future system before production code begins.

It is the bridge between **approved design authority** and **real implementation**.

The production sequence currently contains:

- **20 production Arcs**;
- **192 parent production slices**, P01 through P192;
- a Forge-first authoring strategy where appropriate;
- explicit runtime/Forge/content/integration ordering;
- governed child-slice decomposition for implementation;
- formal evidence and acceptance gates;
- an AI-last rule;
- a final Tutorial World that certifies the complete game and creator platform together.

The programme is deliberately designed to prevent two opposite failures:

1. **Endless pre-production**, where Leyforge keeps producing documents instead of a game.
2. **Uncontrolled implementation**, where coding outruns canon, duplicates systems, silently invents rules, or loses earlier work.

The governing production principle is:

> **Build the smallest authoritative capability needed for the next meaningful player/creator payoff, validate it, integrate it, then expand it.**

---

# 01. Purpose

PROD-00 establishes the constitutional rules for the complete Leyforge production programme.

It defines:

- programme authority;
- source hierarchy;
- inheritance from earlier documents;
- non-supersession rules;
- production scope;
- parent/child slice structure;
- Forge-first law;
- shared-service law;
- Forge creation-order law;
- source/runtime separation;
- registry and identity expectations;
- developer/player Forge authority separation;
- production evidence requirements;
- AI sequencing and authority limits;
- the role of the final Tutorial World;
- the downstream PROD document family.

PROD-00 deliberately does **not** contain the complete engineering architecture, complete Forge schemas, or all 192 detailed slice contracts. Those are owned downstream.

---

# 02. Production Programme Identity

## 02.1 Programme goal

The PROD programme shall produce a complete, production-ready Leyforge implementation in Godot using the current approved production architecture and content canon.

The current engine/tooling baseline at the time of this document is:

- **Godot 4.7.2 stable**;
- **Zylann Godot Voxel** as the production voxel technology baseline;
- Leyforge-owned gameplay, semantic, simulation, persistence, content and Forge layers around that voxel foundation.

Exact engine/plugin boundaries are owned by PROD-03 and accepted engineering ADRs. PROD-00 records only the production-level rule that Leyforge must not casually re-implement a subsystem already deliberately owned by a selected dependency, nor delegate Leyforge-specific game semantics to a dependency that does not own them.

## 02.2 Product identity

Leyforge is a fantasy voxel civilisation sandbox combining, in one coherent simulation:

- survival;
- gathering and crafting;
- building;
- settlements and NPC civilisation;
- automation and logistics;
- magic and Fluxion;
- exploration;
- combat;
- economy and trade;
- politics and factions;
- maritime systems;
- multiple persistent realms;
- persistent world history;
- multiplayer;
- The Forge creator platform;
- optional late-stage AI intelligence;
- a final handcrafted Tutorial World.

These pillars are not independent minigames. Production should favour shared contracts and cross-system composition wherever the canon permits it.

---

# 03. Authority Chain

## 03.1 Project-wide authority order

PROD does not erase the existing authority model. It consumes it.

For production questions, use the following high-level order:

```text
LOCKED GAMEPLAY / CONTENT CANON
00–30 family + approved companion documents + FCC + governed post-Atlas canon
        ↓
FINAL PRESENTATION AUTHORITY
ART-00 through ART-10 and approved realm/specialist ART extensions
        ↓
PROD PROGRAMME
production sequence, implementation handoff, cross-system production contracts,
acceptance gates and evidence routing
        ↓
ENGINEERING GOVERNANCE / ACCEPTED ADRs
ENG-GOV, B-OPS, accepted architecture decisions, repository/task governance
        ↓
IMPLEMENTATION & FORGE AUTHORING SOURCES
Godot code, Forge source resources, registries, manifests, editable assets
        ↓
VALIDATED / BAKED PRODUCTS
runtime definitions, caches, baked assets, packages, generated products
        ↓
LEYFORGE RUNTIME
what players and creators actually use
```

The **Project Brain** operates alongside this chain as the project navigation, status, work-record, handoff, decision-history and reusable-knowledge layer. It does not replace an owning canon or technical authority.

## 03.2 PROD authority

PROD owns:

- production ordering;
- parent production-slice identity;
- implementation entry/exit gates;
- cross-system production dependencies;
- the required handoff shape from canon into implementation;
- the required evidence before a slice may claim completion;
- the relationship between runtime, Forge, content and integration work;
- programme-level sequencing of AI, multiplayer, release hardening and the Tutorial World.

PROD does **not** silently redefine upstream gameplay meaning, visual identity, canonical content or engineering governance.

## 03.3 When authorities disagree

### Canon versus PROD

If a PROD document appears to contradict locked upstream gameplay/content canon:

> **The owning upstream canon wins unless formally amended through its governance path.**

PROD must be corrected, narrowed, or explicitly route a change request upstream.

### ART versus PROD

If PROD would produce an implementation that violates an ART requirement:

> PROD/engineering must satisfy the ART requirement, propose an alternative compliant technique, or formally reopen the issue through governance.

Implementation convenience is not permission to erase visual/audio/accessibility requirements.

### PROD versus engineering feasibility

If a PROD requirement is demonstrated to be infeasible, unsafe or disproportionately harmful:

1. record the evidence;
2. stop the affected slice if the requirement is blocking;
3. propose an ADR or bounded design amendment;
4. identify affected upstream/downstream contracts;
5. receive the required authority before implementation diverges.

### Historical source conflict

Historical POC, Unreal-era, Summer-era, prototype or stale-registry behaviour is **evidence**, not current authority, unless an approved current document explicitly rebinds it.

The archived POC may provide:

- measured proof;
- regression fixtures;
- useful interaction lessons;
- performance evidence;
- migration cases;
- validated concepts.

It may not silently donate its obsolete architecture to the clean production implementation.

---

# 04. Existing Corpus Treatment

## 04.1 Existing documents are inherited, not rewritten by default

The PROD programme shall not create replacement documents merely to restate already-owned rules.

Instead, PROD-01 will maintain a formal crosswalk from the existing corpus into production.

Major inherited source families include:

- Master Game Design and system documents 00–22;
- Settlement Needs and building/facility companion documents;
- Document Set 21A–G — Voxel Asset Forge;
- Document Set 22A–L — Forge Entity / Blueprint / production expansion;
- Set 24 — World Content Atlas;
- Set 25 — Post-Atlas Governance & Integration;
- Set 26 — Oceans, Maritime Civilisation, Vessels and Naval Systems;
- Sets 27–30 — Economy, Industry, Knowledge, Movement/Travel;
- Cross-Set Interface Register authority;
- FCC realm/content canon and certification layers;
- ART-00 through ART-10;
- MAP-00;
- PRD research/risk/prototype evidence;
- ENG-GOV and B-OPS;
- Project Brain operational authority;
- POC manual/regression evidence;
- current governed registries and migration evidence;
- previous post-30 Sets 31–42 planning where still relevant.

## 04.2 No documentation explosion rule

A new document is justified only when it owns a stable production responsibility not safely handled by an existing authority.

The PROD programme therefore uses **18 formal programme documents**, not one document per P-slice.

Large implementation work is decomposed into child slices, task contracts and work records rather than automatically creating new design books.

## 04.3 Supersession must be explicit

No PROD document silently supersedes an upstream document.

When a production document genuinely replaces an older planning assumption, it must state:

- the old source;
- the affected rule;
- the reason for replacement;
- the new authority;
- migration/compatibility implications;
- whether the older source remains historical evidence.

---

# 05. Production Slice Model

## 05.1 Parent slice identity

The production roadmap consists of stable parent slice IDs:

`P01` through `P192`.

A P-slice is a **production objective**, not necessarily one coding task, one pull request or one commit.

Each P-slice should eventually define at minimum:

- purpose;
- player/creator payoff;
- upstream sources;
- dependencies;
- Forge prerequisites;
- runtime prerequisites;
- scope;
- non-scope;
- implementation requirements;
- content subset;
- accessibility/UX obligations;
- persistence/multiplayer/LOD implications;
- performance expectations;
- automated evidence;
- manual acceptance scenario;
- exit criteria;
- child-slice rules;
- handoff to the next production state.

PROD-06 owns the final standard template.

## 05.2 Child slices

A parent P-slice may be decomposed into governed child slices when the work cannot safely be delivered or reviewed as one unit.

Examples:

- `P108-A` Vessel Source Contract;
- `P108-B` Hull / Structure Authoring;
- `P108-C` Compartment & Station Authoring;
- `P108-D` Buoyancy Validation;
- `P108-E` Sea Trial Integration.

Child slices must:

- remain subordinate to the parent purpose;
- preserve parent acceptance gates;
- declare dependencies;
- avoid redefining upstream canon;
- produce traceable evidence;
- not claim the parent complete until all required children pass.

## 05.3 Implementation tasks

Task Contracts / Work Records are execution units beneath child or parent slices.

A task may modify code, data, tests or content but does not independently redefine the production roadmap.

---

# 06. Production Classification Markers

The working roadmap uses the following markers.

### ⚙ FOUNDATION
A capability that later systems genuinely depend upon.

### 🔨 FORGE-FIRST
An authoring capability intentionally built before broad content production in that domain.

### 🔥 COOL-PULL
A feature brought forward because it provides strong motivation, identity or vertical-slice value without violating real dependencies.

### 🧩 INTEGRATION
A slice whose primary purpose is proving already-created systems working together.

### 🌱 EXPANSION
A slice that scales a proven capability into broader content or world scope.

These markers are planning aids, not separate authority classes.

---

# 07. Core Production Ordering Law

The default production pattern is:

> **Contract → Forge → Runtime → Content → Integration → Expansion**

This is a directional rule, not a rigid waterfall.

### Contract
Define the minimum stable semantic/runtime contract that authoring and gameplay need.

### Forge
Build the authoring capability before mass-producing content when the domain materially benefits from a Forge workflow.

### Runtime
Teach Leyforge to consume and execute the authored product.

### Content
Create enough real production content to prove the system and support gameplay.

### Integration
Prove the feature works with adjacent systems.

### Expansion
Scale content volume, variants, regions, cultures, realms or advanced capability after the foundation is proven.

Cross-slice refinement remains allowed. A later integration slice may expose a defect requiring an earlier system to be repaired.

---

# 08. Forge-First Law

## 08.1 Forge before mass content

Where a content family requires repeated creation, validation or composition, production should normally create the relevant Forge workflow **before** mass-producing the final content family.

Examples include:

- blocks/materials;
- items/tools/equipment;
- creatures/characters;
- rigs/animation;
- VFX/lighting/audio/music;
- structures/dungeons;
- professions;
- machines/automation;
- magic/runes/rituals;
- worlds/biomes/ecology;
- vessels;
- factions/governments;
- realms;
- quests/events;
- knowledge/Codex;
- packages/community content.

The Forge does not need to precede the semantic contract it depends upon.

## 08.2 The Forge is not a generic editor

The Forge shall remain a collection of **domain-aware guided creation workflows** built on shared authoring services.

A creator should be able to choose a meaningful task such as:

- Create Block;
- Create Character;
- Create Creature;
- Create Structure;
- Create Machine;
- Create Vessel;
- Create Realm;

and be guided through the natural order required to finish it.

The Forge should understand what “complete” means for each creation class.

## 08.3 Creation Journey Law

Specialist Forge workflows shall declare a creation journey in dependency order.

The common conceptual spine is:

```text
IDENTITY
→ FORM
→ MATERIALS
→ FUNCTIONAL ANATOMY / SOCKETS / MARKERS
→ RIG / MOVING PARTS (if applicable)
→ ANIMATION (if applicable)
→ VFX / LIGHTING (if applicable)
→ AUDIO
→ BEHAVIOUR / FUNCTION
→ VARIANTS / STATES
→ ICON / THUMBNAIL / 2D PRODUCTS
→ VALIDATION
→ TEST LABORATORY
→ BAKE / PACKAGE
→ PRODUCTION READY
```

Not every asset type uses every stage.

The Creation Journey Engine shall support:

- required stages;
- optional branches;
- prerequisites;
- missing-content warnings;
- required animation/state manifests;
- completion state;
- direct navigation to unresolved requirements;
- expert non-linear navigation without removing correctness checks.

---

# 09. Shared Forge Services Law

> **Specialist Forge workflows orchestrate shared Forge services instead of duplicating them.**

This rule is constitutional for the production programme.

Creature Forge does not implement a private animation editor.

Vessel Forge does not implement a private audio system.

Realm Forge does not implement private copies of World Forge, Creature Forge, VFX Forge and Music Forge.

Instead, specialist workflows compose shared services through explicit contracts.

Major shared services include or may include:

- registry/identity;
- dependency graph;
- Material Forge;
- modelling/voxel editing;
- rigging;
- animation;
- VFX;
- lighting;
- Sound Forge;
- Music Forge / Music Lab;
- icon/capture;
- UI/2D assets;
- semantic sockets/ports;
- signal/logic;
- permissions;
- validation;
- Test Laboratory;
- source/bake pipeline;
- package/version/migration;
- performance/accessibility validation;
- review/history.

This prevents feature drift, inconsistent files and duplicated maintenance.

---

# 10. Composition and Existing-Content Law

## 10.1 Composition before invention

Higher-level Forge workflows should compose **already registered, authorised content** wherever the design calls for composition.

Examples:

- Structure Forge uses existing registered blocks, materials, items, furniture, machines and modules;
- Vessel Forge uses existing registered blocks/components unless a genuine vessel-specific definition exists;
- Dungeon Forge composes approved rooms/modules, creatures, traps, signals and loot;
- Realm Forge orchestrates existing world, biome, ecology, structure, creature, VFX/audio and culture systems.

A higher-level composition editor is not a backdoor for inventing new canonical base content.

If a required block does not exist:

> Create and validate the block through the owning Block/Material Forge workflow first.

Then the structure may reference it.

## 10.2 Semantic material roles

Blueprints may use semantic roles such as `wall_primary`, `roof_primary` or equivalent approved tokens.

Those roles must resolve through authorised packs/rules to **real registered content**.

They are not invisible duplicate materials.

## 10.3 Single-definition rule

A block that remains that block when broken does not gain a duplicate gameplay Item identity merely for inventory convenience.

Separate item identities exist only where transformation or non-block semantics genuinely require them.

---

# 11. Forge Source and Runtime Product Separation

Editable Forge source and runtime representation are different responsibilities.

The Forge may preserve rich editable information such as:

- layers;
- semantic markers;
- construction stages;
- high-detail authoring data;
- dependency metadata;
- validation metadata;
- named parts;
- variant rules;
- comments/history.

Runtime products may be:

- baked;
- merged;
- cached;
- simplified;
- indexed;
- converted into efficient registries/graphs/meshes/lookup products.

A runtime optimisation must not silently destroy the editable source of truth.

Generated/baked products should be reproducible from approved source wherever practical.

---

# 12. Developer Forge, Player Forge and Shared Core

## 12.1 Shared capability core

Where developer and player creation capabilities overlap, they should use the same underlying:

- edit commands;
- serialization;
- validation;
- semantic markers;
- palette/material-role resolution;
- stage logic;
- preview;
- source format;
- runtime bake path.

Separate unrelated editors are prohibited when the only real difference is authority.

## 12.2 Authority differs by surface

The developer Forge may have permission to:

- create canonical definitions;
- allocate protected IDs through governed mechanisms;
- author universal capabilities;
- modify production packs;
- create migrations;
- access hidden validation/debug information;
- certify release products.

Restricted player-facing Forge surfaces may be limited to:

- approved content;
- unlocked/permitted materials/modules;
- permitted semantic profiles;
- safe bounded logic;
- server/world permissions;
- no registry replacement;
- no migration authority;
- no validator bypass;
- no unrestricted executable scripts by default.

The difference should be **permission and capability exposure**, not incompatible file formats.

---

# 13. Universal Composition Primitives

The programme has identified a set of cross-system concepts that repeatedly appear across gameplay, Forge, simulation and multiplayer.

These will be formalised in PROD-05.

Current candidate primitives are:

### Identity
What is this thing?

### State
What condition is it in now?

### Signal
What happened / what control information is being transmitted?

### Permission
Who may do what, to which target, in which context/jurisdiction?

### Transaction
What authoritative state/resource transfer actually committed?

### Route
How can an actor/resource/signal/cargo travel between endpoints?

### Knowledge
Who knows what, from which source, with what confidence/visibility?

### History
What persistent past events/state transitions matter now?

### Composition
What new functioning system emerges when understood things are connected?

These primitives are not required to share one implementation class. They are shared conceptual contracts whose domain-specific implementations must remain interoperable where appropriate.

---

# 14. Emergent Composition Standard

A major production goal is that creators can build useful functioning compositions that were not individually hardcoded as bespoke systems.

The internal flagship example is the:

> **Flux-powered voxel pipe organ**

It should be possible to construct this through ordinary systems such as:

- registered blocks/components;
- Structure Forge;
- Flux power;
- semantic ports;
- Signal/Logic Forge;
- Music Lab;
- animation;
- lighting/VFX;
- Sound Forge.

The production target is specifically to avoid requiring a bespoke `PipeOrganSystem` merely because the composition is novel.

This example is not a required core gameplay object. It is a certification thought experiment for whether The Forge and Leyforge simulation are truly composable.

The broader rule is:

> **The Forge should create things Leyforge can understand, not merely things Leyforge can render.**

---

# 15. NPC and Civilisation Agency Law

Settlements shall not exist only as player-operated project boards.

NPC professions may perform real world work including, where supported:

- mining;
- lumber work;
- farming;
- fishing/hunting;
- hauling;
- crafting;
- cooking;
- smithing;
- masonry;
- carpentry;
- building;
- repair;
- trade;
- education;
- magical/industrial specialist work.

NPC production must use authoritative resources and valid workplaces/tools/routes.

Settlements may accumulate stock, reserve materials, maintain emergency reserves, construct approved projects and progress at bounded rates while the player is elsewhere.

Distant simulation may abstract representation but must preserve authoritative outcomes and resource conservation.

NPC autonomy does not mean unlimited or cheating autonomy.

---

# 16. Rule-of-Cool Law

Leyforge production intentionally allows high-motivation, high-identity features to move earlier when they are technically safe.

A COOL-PULL is valid when:

- prerequisites genuinely exist;
- it does not create throwaway architecture;
- it exercises reusable systems;
- it creates meaningful player/creator payoff;
- it does not compromise a required production gate.

The roadmap should not be artificially joyless merely because a conventional development sequence might postpone every exciting feature until late Beta.

The rule is:

> **Dependency truth first; rule of cool immediately afterward.**

---

# 17. Integration Slice Law

A production slice may exist primarily to prove several systems together even when it introduces no major new subsystem.

Integration slices are first-class production work.

Examples include:

- founding camp;
- NPC-built Forge-authored cottage;
- first factory;
- first expedition;
- regional economy disruption/recovery;
- first vessel voyage;
- first realm crossing;
- Flux pipe-organ proof;
- multiplayer great-build scenario;
- final Tutorial World.

These slices prevent a project from becoming a collection of individually “complete” systems that never actually work together.

---

# 18. AI Sequencing and Authority Law

## 18.1 AI-last production rule

The following are deliberately **not** allowed to become production dependencies before the non-AI game and non-AI Forge are feature-complete and hardened:

- natural-language Forge generation;
- AI companion;
- World Mind;
- AI-enhanced NPC reasoning;
- AI-assisted autonomous world production as a gameplay dependency.

AI work belongs to **Arc XIX — The Mind in the Machine**, after Arc XVIII production hardening.

## 18.2 Non-AI completeness requirement

At the end of Arc XVIII:

> **Leyforge must work without AI. The Forge must work without AI.**

Turning AI off must not break:

- saves;
- simulation;
- content creation;
- settlements;
- quests/events;
- multiplayer;
- Forge validation;
- core player progression;
- world operation.

## 18.3 AI uses normal authority paths

AI may propose, draft, interpret, plan or operate approved Forge capabilities.

AI does not gain secret authoritative mutation paths.

AI-generated/assisted source must remain:

- editable;
- attributable/provenanced where required;
- validated;
- reviewable;
- subject to the same runtime and release gates as human-created source.

---

# 19. Final Tutorial World Law

The **Tutorial World is the final production milestone**, not an early disposable prototype.

It is built last because it must use the completed game and completed Forge.

The Tutorial World shall be:

- handcrafted using production systems;
- a real Leyforge world, not a separate fake level/ruleset;
- contextual rather than forcibly linear;
- playable with minimal, contextual, guided, full or custom assistance;
- rich in landmarks and curiosity-driven exploration;
- capable of teaching through actual systems;
- multiplayer-compatible where appropriate;
- accessible/localised through the final production frameworks;
- filled with optional secrets, side paths and memorable showcases;
- persistent after tutorial completion.

Where practical:

- a tutorial furnace is the real furnace;
- a tutorial settlement uses real settlement simulation;
- a tutorial construction project uses real resources and builders;
- a tutorial machine fault is a real machine state;
- a tutorial vessel uses real vessel systems;
- a tutorial portal uses real realm-transfer systems.

The final Tutorial World therefore acts as both:

1. the first player's welcoming introduction to Leyforge; and
2. a whole-game / whole-Forge integration certification.

---

# 20. Production Arc Register

The current programme is organised into twenty Arcs.

| Arc | Name | Parent slice range |
|---|---|---:|
| I | A WORLD FROM STONE | P01–P05 |
| II | THE MAKER'S HAND | P06–P11 |
| III | HEARTH & HAMMER | P12–P17 |
| IV | SHAPE, MOTION & SONG | P18–P24 |
| V | BLOOD, BONE & STEEL | P25–P31 |
| VI | THE FIRST HEARTH | P32–P38 |
| VII | FROM CAMPFIRE TO KINGDOM | P39–P48 |
| VIII | GEARS BENEATH THE EARTH | P49–P63 |
| IX | WHEN THE LEY AWAKENS | P64–P72 |
| X | BEYOND THE HORIZON | P73–P82 |
| XI | ROADS OF GOLD & DUST | P83–P92 |
| XII | CROWNS & CONSEQUENCES | P93–P102 |
| XIII | CALL OF THE DEEP BLUE | P103–P114 |
| XIV | BEYOND THE VEIL | P115–P126 |
| XV | THE FORGE UNBOUND | P127–P137 |
| XVI | A WORLD THAT REMEMBERS | P138–P148 |
| XVII | MANY HANDS, ONE WORLD | P149–P158 |
| XVIII | TEMPERING LEYFORGE | P159–P170 |
| XIX | THE MIND IN THE MACHINE | P171–P179 |
| XX | THE FIRST FLAME | P180–P192 |

PROD-02 owns the full dependency atlas and parent-slice index.

---

# 21. PROD Document Family

The formal programme contains eighteen documents.

| ID | Working title | Responsibility |
|---|---|---|
| PROD-00 | Production Constitution, Authority & Scope | Programme law and authority. |
| PROD-01 | Legacy Canon & Source Crosswalk | Maps existing corpus into production ownership. |
| PROD-02 | Master Production Roadmap & Dependency Atlas | Full P01–P192 order/dependency control. |
| PROD-03 | Leyforge Runtime Engineering Architecture | Runtime/LFE-equivalent production architecture. |
| PROD-04 | The Forge Engineering & Creation Journey Architecture | FORGE-ENG-equivalent production architecture. |
| PROD-05 | Universal Simulation Primitives & Cross-System Contracts | Shared conceptual/system contracts. |
| PROD-06 | Production Governance, Task Contracts & Evidence Standard | Execution/validation/handoff procedure. |
| PROD-07 | Arcs I–II Production Contracts | P01–P11. |
| PROD-08 | Arcs III–IV Production Contracts | P12–P24. |
| PROD-09 | Arcs V–VI Production Contracts | P25–P38. |
| PROD-10 | Arcs VII–VIII Production Contracts | P39–P63. |
| PROD-11 | Arcs IX–X Production Contracts | P64–P82. |
| PROD-12 | Arcs XI–XII Production Contracts | P83–P102. |
| PROD-13 | Arcs XIII–XIV Production Contracts | P103–P126. |
| PROD-14 | Arcs XV–XVI Production Contracts | P127–P148. |
| PROD-15 | Arcs XVII–XVIII Production Contracts | P149–P170. |
| PROD-16 | Arcs XIX–XX Production Contracts | P171–P192. |
| PROD-17 | Master Verification, Certification & Production Handoff Register | Final programme state/evidence control. |

A machine-readable `ProductionRegistry` accompanies the programme but is not counted as an additional design document.

---

# 22. Production Registry Requirement

The project shall maintain a machine-readable production registry capable of recording at minimum:

- parent P-ID;
- Arc;
- title;
- classification markers;
- status;
- dependencies;
- authoritative source documents;
- child slices;
- current task/work-record references;
- acceptance gate;
- evidence references;
- blockers;
- readiness state;
- completion state.

The registry exists so Project Brain, Codex and governance tooling can answer:

> **What are we actually allowed to build next?**

without scraping the entire document corpus on every execution.

The registry must not become an alternate source of gameplay canon. It records production state and pointers to authority.

---

# 23. Minimum Production Status Vocabulary

PROD-06 may refine the exact vocabulary, but programme-level work shall distinguish at least:

- **UNASSESSED** — production contract not yet reconciled;
- **PLANNED** — defined but prerequisites not necessarily met;
- **BLOCKED_UPSTREAM** — cannot proceed because an owning dependency/decision is unresolved;
- **READY** — entry gate satisfied and execution may begin;
- **ACTIVE** — authorised implementation underway;
- **VALIDATION_PENDING** — implementation exists but required evidence is incomplete;
- **FAILED / REPAIR REQUIRED** — gate failed; downstream permission remains closed;
- **COMPLETE** — required scope and evidence passed;
- **SUPERSEDED** — formally replaced through governed change;
- **DEFERRED** — intentionally moved out of current programme scope.

No task or parent slice may use a vague “done” label when required evidence remains unresolved.

---

# 24. Evidence and No-Silent-Completion Rule

> **No production slice is complete merely because code exists.**

Completion requires the evidence defined by its production contract.

Evidence may include:

- automated tests;
- determinism tests;
- save/reload tests;
- migration tests;
- performance measurements;
- Forge validation output;
- scenario runs;
- multiplayer/authority tests;
- visual/audio/accessibility certification;
- manual owner review where required;
- regression evidence;
- repository/CI evidence.

Where a required representation, state, validation or handoff remains incomplete, the slice reports exactly what is complete and what remains open.

No silent completion.

No silent canon repair.

No silent scope substitution.

---

# 25. Fail-Closed Production Rule

When a production gate fails:

- record the failure;
- stop downstream work that depends on the failed guarantee;
- repair or formally re-scope the failed condition;
- rerun required evidence;
- only then reopen downstream permission.

Schedule pressure does not convert a failed prerequisite into a passed prerequisite.

This rule applies particularly to:

- save integrity;
- determinism;
- resource conservation;
- multiplayer authority;
- Forge source/bake correctness;
- registry identity;
- migration;
- water/vessel proof;
- simulation LOD;
- performance budgets;
- content compatibility/security.

---

# 26. Production Does Not Require Waterfall Isolation

The programme defines order, but production remains iterative.

Later slices may discover defects in earlier systems.

The correct response is not to pretend the earlier slice never existed, nor to ban fixes because its Arc is “finished.”

Instead:

- trace the regression;
- reopen the affected acceptance condition;
- make the bounded repair;
- rerun impacted evidence;
- update the production registry;
- continue.

A complete parent slice means its current required contract passed, not that its code becomes untouchable forever.

---

# 27. Content Volume and Parent-Slice Scope

Some P-slices represent large production programmes, especially:

- realm implementation;
- world content expansion;
- complete Forge workspaces;
- multiplayer;
- release hardening;
- final Tutorial World.

A P-slice may therefore own many child tasks and content waves.

The roadmap ID remains stable while implementation detail expands beneath it.

This preserves a navigable high-level plan without pretending a realm can be implemented in one Codex prompt.

---

# 28. Definition of Production Handoff Ready

The complete PROD corpus reaches **PRODUCTION HANDOFF READY** when:

- PROD-00 through PROD-17 are complete and internally reconciled;
- all P01–P192 parent slices have an owning production contract or explicit controlled disposition;
- every P-slice has traceable upstream authority;
- dependencies and entry/exit gates are explicit;
- runtime and Forge architecture are reconciled with current evidence;
- universal cross-system contracts are defined sufficiently for implementation;
- production task/evidence rules are executable;
- the ProductionRegistry exists and is consistent with PROD-02/PROD-17;
- no unresolved contradiction forces Codex to invent high-level game rules merely to start production;
- repository/Brain governance can translate the first READY P-slice into controlled execution.

This gate does **not** require the game to be built.

It means the project is finally ready to build it deliberately.

---

# 29. Immediate Production Rule After Handoff

Once the full PROD corpus is approved and the repository/Project Brain confirms the production gate is open:

> **Begin P01.**

Do not invent a new pre-production programme unless a genuine blocker proves one necessary.

Do not create optional documentation simply because implementation feels intimidating.

Do not reopen settled design questions without evidence that the owning canon is insufficient or contradictory.

From that point onward, the default project action becomes:

> **Build → validate → integrate → continue.**

---

# 30. PROD-00 Acceptance Checklist

PROD-00 is ready for owner lock when the owner agrees that:

- [ ] PROD is the implementation/production handoff programme, not a replacement game-design canon.
- [ ] Existing 00–30/FCC/ART/Forge/governance/evidence sources remain inherited through explicit authority rules.
- [ ] Historical POC architecture remains evidence, not automatic production architecture.
- [ ] P01–P192 are stable parent production slices.
- [ ] Parent slices may be decomposed into governed child slices and task contracts.
- [ ] The default production ordering law is Contract → Forge → Runtime → Content → Integration → Expansion.
- [ ] Forge-first applies before mass content where repeated authoring benefits from it.
- [ ] Specialist Forge workflows orchestrate shared Forge services instead of duplicating them.
- [ ] Creation Journey ordering is a core Forge UX/architecture requirement.
- [ ] Higher-level Forge compositions use registered authorised content rather than silently inventing base definitions.
- [ ] Developer Forge and restricted player Forge should share underlying authoring cores where capabilities overlap, with authority controlled by permissions.
- [ ] Source/editable Forge data remains distinct from derived/baked runtime products.
- [ ] Integration slices and rule-of-cool slices are legitimate first-class production work.
- [ ] NPC settlements can perform real bounded work and continue limited authoritative production without the player present.
- [ ] AI remains optional and is sequenced only after the non-AI game and non-AI Forge are complete/hardened.
- [ ] The final Tutorial World is the last production milestone and uses real production systems wherever practical.
- [ ] Fail-closed evidence and no-silent-completion rules govern production.
- [ ] The formal programme contains PROD-00 through PROD-17 plus a machine-readable ProductionRegistry.
- [ ] After production handoff readiness and repository gate verification, the project should begin P01 rather than create another optional pre-production programme.

---

# 31. Proposed Lock Statement

If owner-approved, the following becomes the PROD constitutional baseline:

> **LEYFORGE PROD-00 — PRODUCTION CONSTITUTION, AUTHORITY & SCOPE — LOCKED v0.1**
>
> Leyforge production is governed by a twenty-Arc, P01–P192 programme that inherits rather than replaces the existing gameplay/content canon, FCC authority, ART production corpus, Forge design baselines, engineering governance, Project Brain and accepted technical evidence. PROD owns production sequencing, implementation handoff, cross-system production contracts and acceptance gates; it may not silently rewrite owning upstream authority. Production follows Contract → Forge → Runtime → Content → Integration → Expansion, builds specialist Forge workflows from shared services, guides creators in natural creation order, preserves editable source separately from derived runtime products, uses governed child slices beneath stable parent P-IDs, treats integration and rule-of-cool payoffs as first-class work, fails closed when required evidence fails, and forbids silent completion. AI is optional and may only enter after the complete non-AI game and non-AI Forge are feature-complete and hardened. The final Tutorial World is built last using the complete production game and Forge as both player onboarding and whole-project integration certification. Once PROD-00 through PROD-17 and the ProductionRegistry are approved and repository/Brain gates permit execution, the default project action becomes build, validate, integrate and continue from P01.

---

# 32. Next Document

After PROD-00 owner review/lock, proceed to:

> **PROD-01 — Legacy Canon & Source Crosswalk**

PROD-01 shall enumerate the existing Leyforge source families and map each production concern to its owning upstream authority, inherited rule, evidence role, supersession state and downstream PROD consumer.

The objective is simple:

> **Nothing important gets forgotten, and nothing gets needlessly rewritten.**

---

# 33. Principal Source Basis

This draft was prepared against the current Leyforge project corpus and specifically incorporates the authority patterns and production principles established across:

- existing Leyforge design documents 00–30 and companion sets;
- FCC global/realm authority, especially FCC-12/13/14 routed semantics;
- ART-00 — Production Constitution & Authority Map;
- ART-01 through ART-10;
- Document Set 21A–G — Voxel Asset Forge;
- Document Set 22A–L — Forge Entity / Blueprint Expansion;
- Set 26 maritime/vessel architecture;
- Sets 27–30 post-Atlas system authority;
- settlement/Blueprint Forge shared-core and restricted-player authoring rules;
- ENG-GOV / B-OPS;
- Project Brain governance/status model;
- PRD research, risk and prototype evidence;
- POC Manual Testing Guide and historical registries as evidence/migration inputs;
- previous post-30 production/release planning;
- the owner-approved working twenty-Arc, P01–P192 production roadmap developed in September 2026.

Where PROD-00 is less detailed than an owning upstream source, the owning upstream source remains authoritative.

---

**End of PROD-00 v0.1 — Draft Production Constitution Candidate**
