
# LEYFORGE PRODUCTION PROGRAMME

## PROD-14 — Arcs XV–XVI Production Contracts: P127–P148

**Document ID:** PROD-14  
**Title:** Leyforge Arcs XV–XVI Production Contracts — The Forge Unbound / A World That Remembers  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **DRAFT FOR OWNER REVIEW — EXECUTABLE ARC VOLUME CANDIDATE**  
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
**Previous executable volumes:** PROD-07 through PROD-13  
**Arc scope:** ARC XV — THE FORGE UNBOUND / ARC XVI — A WORLD THAT REMEMBERS  
**Parent slices:** P127–P148  
**Programme gates:** PG-15 Unified Forge Production Platform, PG-16 Persistent Knowledge & History Foundation  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, Forge engineering, runtime implementation, PROD-15 onward

---

# 00. Executive Arc Statement

PROD-14 completes two transformations that the earlier arcs have been building toward.

ARC XV transforms The Forge from a family of specialist editors into one coherent production environment.

ARC XVI transforms Leyforge from a world that merely has state into a world that can know, misremember, record, inherit and interpret its own past.

The central promise of ARC XV is:

> **A creator should be able to move from canonical identity to validated, tested, revisioned and packaged production content through one coherent Forge journey without manually stitching together disconnected tools or bypassing authority.**

The central promise of ARC XVI is:

> **Reality, observation, knowledge, belief, rumour, memory and history are not the same thing, and Leyforge must preserve those distinctions strongly enough that people, settlements, factions and the player can genuinely learn different things about the same world.**

The combined progression is:

```text
UNIFIED FORGE WORKSPACE
→ CREATION JOURNEY ENGINE
→ DEPENDENCY / COMPOSITION GRAPH
→ UI / ICON / 2D FORGE
→ CAPTURE STUDIO
→ UNIVERSAL VALIDATION
→ FINAL TEST LAB
→ LIVE PLAYTEST / HOT RELOAD
→ REVISION / COMPARISON
→ PACKAGE FORGE
→ FORGE-MADE MINI EXPANSION
→ KNOWLEDGE CONTRACT
→ KNOWLEDGE / CODEX / RESEARCH FORGE
→ QUEST & EVENT FORGE
→ WORLD EVENT RUNTIME
→ NPC MEMORY & RELATIONSHIPS
→ FAMILIES / GENERATIONS / SUCCESSION
→ RUMOURS / INFORMATION PROPAGATION
→ ARCHIVES / RECORDS / HISTORICAL SITES
→ PERSISTENT HISTORICAL LAYERING
→ CHRONICLE
→ A WORLD THAT REMEMBERS
```

---

# 01. Governing Production Rules for P127–P148

## 01.1 The Forge is one platform, not a folder of editors

Specialist editors may remain separate workspaces, but they must share:

- stable identity;
- project manifest;
- dependency graph;
- source lifecycle;
- validation;
- preview/test services;
- revision history;
- package/build services;
- provenance;
- diagnostics;
- Production Ready status.

The creator should not need to remember hidden inter-tool handoff rituals.

## 01.2 Specialist workflows orchestrate shared services

The constitutional rule remains:

> **Specialist Forge workflows orchestrate shared Forge services instead of duplicating them.**

A Vessel Forge does not own its own independent icon pipeline.

A Creature Forge does not own a private package system.

A Realm Forge does not own a separate dependency graph.

## 01.3 Editable source remains authoritative

The production chain remains:

```text
canonical authority
→ editable Forge source
→ validation
→ bake/generated products
→ runtime registry/package
```

Generated runtime products are reproducible outputs.

They are not where creators manually repair source truth.

## 01.4 Production status is explicit and partial completion is allowed

An asset/project can be:

- SOURCE VALID;
- representation-valid;
- runtime-valid;
- art-approved;
- migration-approved;
- release-ready;
- certified;

without pretending all those states are identical.

If one required representation remains unresolved, the package is not silently “done”.

## 01.5 No silent canon repair

Forge cannot resolve contradictory upstream canon by quietly inventing a new truth.

It may:

- diagnose;
- show authority conflict;
- propose resolution;
- create governed handoff.

It may not mutate owning canon as a side effect.

## 01.6 No silent engineering repair

If runtime/Forge engineering lacks a required capability, the production source remains truthful and the engineering gap is recorded.

Do not weaken the source asset so a broken validator passes.

## 01.7 No silent scope expansion

Creating an asset does not author an unrelated gameplay system.

Creating a sword does not invent a metallurgy tree.

Creating a culture pack does not invent a new ancestry.

Creating a portal does not create a new realm.

## 01.8 The Creation Journey is declarative and specialist-configurable

Each content class declares:

- required stages;
- optional stages;
- prerequisites;
- blockers;
- review gates;
- auto-generated products;
- allowed stage skipping;
- completion state.

The same underlying journey engine should support blocks, machines, characters, structures, vessels, realms and packages without one giant hard-coded wizard.

## 01.9 Experts can jump; correctness cannot be skipped

A beginner may follow:

```text
NEXT → NEXT → NEXT
```

An expert may jump directly to a stage.

But production readiness still evaluates every mandatory requirement.

## 01.10 Dependency truth is inspectable

Every source/package should be able to answer:

- what do I depend on?
- who depends on me?
- what version did I resolve?
- what override won?
- what is missing?
- what is stale?
- what must rebuild if I change this?

## 01.11 Composition truth is inspectable

The dependency graph must also represent semantic composition where useful.

The Forge should be able to explain that an emergent system exists because:

```text
registered components
+ compatible ports/sockets
+ valid permissions
+ valid states
+ valid routes/signals/resources
→ functioning composition
```

rather than requiring a bespoke manager.

## 01.12 UI/Icon/2D production belongs in the same lifecycle

Icons, maps, portraits, thumbnails, cards, overlays and 2D products are not afterthought exports.

They have:

- identity;
- source inputs;
- capture/reference rules;
- accessibility;
- localisation hooks;
- variants;
- validation;
- revision/provenance.

## 01.13 Capture is reproducible

A thumbnail/icon/reference image should be reproducible from:

- source;
- capture profile;
- camera;
- lighting;
- background;
- state;
- pose;
- resolution;
- post-processing profile.

Do not manually screenshot final production icons without provenance.

## 01.14 Validation is layered

Validation includes, where applicable:

1. schema/identity;
2. registry/reference;
3. semantic;
4. spatial;
5. visual/audio representation;
6. accessibility;
7. performance;
8. runtime;
9. migration/compatibility;
10. package/security.

No single green validator proves the whole package.

## 01.15 Test Lab tests the actual product path

The final Test Laboratory should be able to launch baked/runtime products in representative contexts.

A Forge source that only works inside editor preview is not production-ready.

## 01.16 Live playtest is controlled, not magic mutation

Hot reload/live preview must preserve authority.

Changes should flow through:

```text
source change
→ narrow validation
→ bake/update
→ runtime reload
```

not arbitrary editor memory patching that cannot reproduce after restart.

## 01.17 Revision history compares meaning, not only files

Where possible, comparison should show semantic differences such as:

- material changed;
- socket moved;
- recipe dependency removed;
- collision changed;
- progression requirement changed;
- icon regenerated;
- realm compatibility changed;
- validation status changed.

## 01.18 Packages have explicit manifests and compatibility

A package declares:

- stable package ID;
- version;
- dependencies;
- optional dependencies;
- contained sources/products;
- registry contributions;
- override policy;
- compatibility;
- migrations;
- localisation;
- access/security policy;
- certification state.

## 01.19 Arc XV must work without AI

The complete Forge production platform must function without generative AI.

AI-assisted Forge features belong to ARC XIX.

Deterministic automation, generation, validation and templates are not considered AI merely because they save work.

## 01.20 The Forge certification expansion must be real content

P137 cannot be a mock demo.

It must create a bounded but genuine mini expansion using the same authoring, validation, package and runtime path intended for production content.

## 01.21 Reality and knowledge are separate

ARC XVI introduces a formal distinction among:

```text
REALITY
OBSERVATION
EVIDENCE
FACT CLAIM
KNOWLEDGE
BELIEF
RUMOUR
MEMORY
RECORD
HISTORY / INTERPRETATION
```

These are related, not interchangeable.

## 01.22 Engine truth is not automatically known

A system may know:

- a ruin exists;
- a faction committed an attack;
- a material has a property;
- a person died.

That does not mean every actor, faction or player knows it.

## 01.23 Knowledge has provenance

Knowledge should be able to record where appropriate:

- source;
- observer;
- time;
- confidence;
- direct/indirect status;
- evidence;
- authority;
- contradiction;
- expiry/obsolescence;
- sharing history.

## 01.24 Knowledge can be wrong without reality becoming wrong

A rumour may be false.

An NPC may misremember.

A faction may publish propaganda.

A map may be outdated.

The underlying reality record remains separate.

## 01.25 Research turns evidence into practical understanding

Research is not merely an XP bar.

Research may consume/require:

- observations;
- samples;
- books;
- diagrams;
- experiments;
- teachers;
- faction permission;
- ruins;
- prototypes;
- time;
- specialist labour.

It can produce:

- verified knowledge;
- recipe/progression unlocks;
- hypotheses;
- map information;
- system understanding.

## 01.26 Progression authoring is routed into P139

The previously unresolved **Progression Forge / Research & Invention Forge** gap is closed here.

P139 owns a specialist authoring surface for:

- knowledge prerequisites;
- evidence requirements;
- research nodes;
- unlock relationships;
- invention/prototype steps;
- recipe/system unlocks;
- teacher/faction/discovery alternatives.

This remains a child capability under Knowledge & Codex Forge rather than creating a new parent slice.

## 01.27 In-game Codex and production Codex-agent terminology remain distinct

Within this document:

- **In-Game Codex** = player-facing knowledge/encyclopaedia/journal system.
- **Production agent** = Codex/coding agent used in development workflows.

They are not the same system.

## 01.28 Quests bind to real world identity and state

Quest/event content should reference stable:

- NPCs;
- settlements;
- factions;
- resources;
- structures;
- routes;
- knowledge;
- world-state predicates;

rather than storing a detached fantasy copy of the world.

## 01.29 Failure creates state where appropriate

Quest failure should commonly produce:

- altered relationship;
- damaged structure;
- missed opportunity;
- changed faction state;
- death/injury;
- shortage;
- new event;
- persistent history;

rather than forcing reload or silently resetting.

## 01.30 World events are system-owned state changes

Events may coordinate several systems, but they should not secretly override them.

A flood event asks water/structures/routes/settlements to change through their contracts.

A war event uses faction, military and territory state.

## 01.31 NPC memory is bounded and selective

NPCs do not need infinite perfect logs.

Memory can preserve meaningful:

- relationships;
- promises;
- harm/help;
- major events;
- household history;
- faction events;
- witnessed discoveries;
- grief/celebration;
- personal milestones.

Lower-value detail may summarise/decay.

## 01.32 Relationship is not one universal reputation number

Relationships may include:

- familiarity;
- trust;
- affection;
- fear;
- respect;
- grievance;
- obligation;
- kinship;
- factional context.

Do not reduce every social consequence to `reputation += 5`.

## 01.33 Family and succession use persistent identity

Children/successors are new identities.

They may inherit:

- relationships;
- household property/roles;
- culture;
- knowledge exposure;
- obligations;
- social position;
- genetics/body lineage where canon supports;

but they are not clones of parents.

## 01.34 Rumours travel through channels

Information propagation can depend on:

- conversation;
- household;
- workplace;
- market;
- caravan;
- road;
- port;
- messenger;
- archive;
- faction network;
- ritual/magic;
- cross-realm route.

Distance and social structure can matter.

## 01.35 Archives preserve records, not omniscience

A library/archive can hold:

- documents;
- maps;
- laws;
- contracts;
- genealogies;
- event records;
- research;
- testimonies.

Possessing the archive does not mean every NPC instantly knows its contents.

## 01.36 Historical layering modifies the existing world

History should often appear as layers:

- repaired wall;
- old road;
- renamed district;
- occupation marker;
- memorial;
- ruined foundation;
- rebuilt port;
- changed ownership;
- archaeological layer.

Do not spawn a decorative “history prop” when the existing object can preserve provenance/state.

## 01.37 Chronicle is knowledge-aware

The Chronicle should distinguish, where appropriate:

- verified event;
- reported event;
- disputed account;
- unknown cause;
- player-observed;
- faction account;
- archival evidence.

It is not necessarily an omniscient developer timeline.

---

# 02. ARC XV — THE FORGE UNBOUND

---

# P127 — THE GREAT WORKSHOP

**Classification:** FORGE-FIRST / INTEGRATION  
**Player/creator payoff:** All major Forge domains become accessible through one coherent production workspace.

## Purpose

Create the Unified Forge Workspace.

## Source packet

PROD-04; ART-09/10; Documents 21/22; especially Unified Forge UI/UX concepts; all specialist Forge milestones P06–P126.

## In scope

Shared shell:

- project/workspace browser;
- recent/favourites;
- content search;
- canonical ID browser;
- authority/source links;
- specialist-editor launcher;
- manifest;
- dependency summary;
- lifecycle/status;
- validation panel;
- problem list;
- Test Lab launcher;
- capture launcher;
- revision panel;
- package view;
- work-log/provenance view;
- multi-document tabs;
- unsaved/source-dirty state;
- safe recovery.

## Core law

Unified Forge does not replace specialist authoring surfaces.

It coordinates them.

## Recommended child slices

- P127-A — shared shell/navigation;
- P127-B — identity/search/content browser;
- P127-C — manifest/status/problems;
- P127-D — specialist editor routing;
- P127-E — shared session/recovery;
- P127-F — accessibility/performance/reconciliation.

## Acceptance

- major specialist Forge domains launch from one workspace;
- canonical IDs and source authority are visible;
- lifecycle/validation state consistent across editors;
- reopening restores safe workspace state;
- no duplicated per-editor package/status system;
- keyboard/controller/accessibility baseline works;
- final SHA/CI passes.

## Manual scenario

Open workspace → search registered asset → inspect dependencies/status → edit through specialist Forge → validate → launch Test Lab → return to workspace.

## Rule-of-cool target

> **The Forge finally feels like one place.**

## Exit gate

Unified Forge shell operational.

---

# P128 — THE PATH OF MAKING

**Classification:** FORGE-FIRST / COOL-PULL  
**Player/creator payoff:** Every major content type gains a guided creation journey that beginners can follow and experts can navigate freely.

## Purpose

Create the Creation Journey Engine.

## In scope

Declarative stage system:

- stage ID;
- label/help;
- required/optional;
- applicability condition;
- prerequisites;
- blockers;
- source panel/editor route;
- completion predicate;
- generated products;
- validator set;
- review gate;
- revisit/stale rules.

Common conceptual spine:

```text
Identity
→ Form
→ Materials
→ Functional anatomy / sockets / markers
→ Rig / moving parts
→ Animation
→ VFX / Lighting
→ Audio
→ Behaviour / function
→ Variants / states
→ Icon / thumbnail / 2D
→ Validation
→ Test Lab
→ Bake / package
→ Production Ready
```

Each specialist domain declares the subset/order it needs.

## Core law

Experts may skip navigation steps.

They may not skip mandatory completion predicates.

## Recommended child slices

- P128-A — journey schema;
- P128-B — stage engine/navigation;
- P128-C — prerequisite/blocker/staleness;
- P128-D — specialist journey profiles;
- P128-E — beginner/expert UX;
- P128-F — accessibility/reconciliation.

## Acceptance

- at least block, machine, creature, structure, vessel and realm journeys run on one engine;
- stage applicability differs without code duplication;
- stale downstream stages re-open after upstream change;
- NEXT workflow usable by novice;
- expert jump navigation available;
- mandatory production requirements cannot be bypassed;
- final SHA/CI passes.

## Exit gate

Creation Journey Engine operational.

---

# P129 — THREADS OF THE FORGE

**Classification:** FOUNDATION / FORGE-FIRST  
**Player/creator payoff:** The Forge can explain how every source, product, dependency and emergent composition relates.

## Purpose

Create the Universal Dependency & Composition Graph.

## In scope

Graph node families:

- canonical definition;
- Forge source;
- material;
- component;
- blueprint;
- package;
- generated product;
- runtime registry entry;
- localisation key;
- capture;
- test fixture;
- validator;
- migration;
- golden reference.

Edge families:

- depends-on;
- inherits;
- overrides;
- generates;
- binds-to;
- contains;
- consumes;
- compatible-with;
- supersedes;
- validates-with;
- composed-with.

Graph capabilities:

- upstream/downstream impact;
- missing dependency;
- stale product;
- circular dependency;
- package boundary;
- version mismatch;
- override provenance;
- composition inspection;
- rebuild plan.

## Architecture closure

P129 also provides the production-wide place to inspect earlier typed connections and semantic composition.

It does **not** replace runtime network solvers.

## Recommended child slices

- P129-A — graph schema;
- P129-B — dependency extraction;
- P129-C — provenance/override paths;
- P129-D — composition view;
- P129-E — impact/rebuild/stale detection;
- P129-F — scale/performance/reconciliation.

## Acceptance

- change to source identifies downstream products;
- missing/circular dependencies diagnosed;
- override winner/provenance inspectable;
- package boundary visible;
- emergent composition can be inspected without bespoke object type;
- graph handles representative large project boundedly;
- final SHA/CI passes.

## Exit gate

Forge dependency/composition truth is inspectable.

---

# P130 — INK, ICON & INTERFACE

**Classification:** FORGE-FIRST  
**Player/creator payoff:** Icons, UI assets, map symbols, cards and other 2D products can be authored inside the same governed production pipeline.

## Purpose

Create UI, Icon & 2D Forge.

## Source packet

ART-08; UI/UX system; P127–P129; existing capture/icon source rules.

## In scope

- icon source/profile;
- UI sprite/panel source;
- map/cartography symbol;
- codex illustration slot;
- portrait/thumbnail;
- status/ability symbol;
- package branding/art hook;
- nine-slice/layout metadata where applicable;
- resolution variants;
- accessibility metadata;
- localisation-sensitive text-safe areas;
- capture-derived source binding;
- state variants;
- preview matrix;
- export/bake.

## Core law

Critical meaning cannot be colour-only.

Text is localised data, not baked irreversibly into reusable icons unless canon specifically requires text-as-art.

## Recommended child slices

- P130-A — 2D source schemas;
- P130-B — icon/symbol tools;
- P130-C — UI/map/codex products;
- P130-D — accessibility/localisation;
- P130-E — preview/bake/validation;
- P130-F — reconciliation.

## Acceptance

- representative item, spell/status, structure/map and Codex images produced;
- multiple resolutions/states generated;
- localisation-safe assets remain reusable;
- non-colour redundancy validated;
- provenance to 3D/capture source retained where applicable;
- final SHA/CI passes.

## Exit gate

2D production integrated into Forge lifecycle.

---

# P131 — THE EYE OF THE FORGE

**Classification:** FORGE-FIRST / COOL-PULL  
**Player/creator payoff:** The Forge can reproducibly capture production thumbnails, icons, comparison images and reference boards.

## Purpose

Create Capture Studio.

## In scope

Capture profile:

- subject/source;
- representation/state;
- camera;
- framing/bounds;
- focal length/projection;
- background;
- lighting;
- environment;
- pose/animation frame;
- effect state;
- resolution/aspect;
- transparency;
- post-process;
- accessibility/scalability mode;
- output destination;
- naming/provenance.

Batch capture:

- state matrix;
- family lineup;
- LOD comparison;
- damage/repair;
- biome/lighting;
- first/third-person;
- golden-reference board.

## Core law

Final captures must be reproducible from source and profile.

## Acceptance

- same profile reproduces materially equivalent capture;
- batch family/state capture works;
- transparent icons and comparison boards supported;
- capture records source revision;
- missing dependency blocks misleading final capture;
- performance bounded;
- final SHA/CI passes.

## Exit gate

Capture Studio operational.

---

# P132 — THE JUDGE'S HAMMER

**Classification:** FOUNDATION / FORGE-FIRST  
**Player/creator payoff:** The Forge can tell creators exactly why content is invalid before broken content reaches production.

## Purpose

Create Universal Forge Validation.

## In scope

Validator registry and layered execution:

1. identity/schema;
2. authority/freshness;
3. registry/reference;
4. dependency;
5. semantic;
6. spatial/collision/footprint;
7. connection/socket;
8. representation completeness;
9. accessibility/localisation;
10. performance budget;
11. runtime/bake;
12. migration/compatibility;
13. package/security.

Diagnostic record:

- stable diagnostic code;
- severity;
- owner;
- subject;
- field/location;
- reason;
- suggested resolution;
- evidence link;
- waiver/exception authority if permitted.

## Core law

Validators do not silently repair authority.

Auto-fix is allowed only for bounded deterministic formatting/derived-source repairs explicitly marked safe.

## Recommended child slices

- P132-A — validator registry/execution;
- P132-B — diagnostic model;
- P132-C — cross-domain validator adapters;
- P132-D — batch/CI integration;
- P132-E — safe autofix/waiver flow;
- P132-F — performance/reconciliation.

## Acceptance

- representative validators run across multiple Forge domains;
- failures have stable reason codes;
- batch validation works;
- CI can execute headless validators;
- safe fixes remain distinguishable from canon/engineering changes;
- waived exceptions are explicit/auditable;
- final SHA/CI passes.

## Exit gate

Universal validation operational.

---

# P133 — THE LIVING TEST CHAMBER

**Classification:** FORGE-FIRST / INTEGRATION  
**Player/creator payoff:** Any production asset or package can be launched into representative runtime tests without manually constructing ad-hoc scenes.

## Purpose

Finalise the Forge Test Laboratory.

## In scope

Test templates:

- neutral visual studio;
- block/material room;
- item/tool handling;
- machine/network;
- creature/entity;
- structure/settlement context;
- combat;
- vessel/water;
- world/biome;
- realm/portal;
- UI/accessibility;
- package integration.

Test Lab controls:

- spawn selected product;
- choose state/variant;
- inspect logs/diagnostics;
- toggle LOD/scalability;
- simulate damage/power/Flux/weather;
- actor/body-scale fixtures;
- save/reload;
- performance capture;
- screenshot/capture handoff;
- regression recording.

## Core law

Test Lab launches baked/runtime products, not a Forge-only simulation that can hide runtime defects.

## Acceptance

Representative content classes launch; state/scalability/accessibility controls work; save/reload supported; performance capture integrated; Test Lab results link back to source/revision; final SHA/CI passes.

## Exit gate

Final Test Laboratory operational.

---

# P134 — FORGE WITHOUT WALLS

**Classification:** COOL-PULL / FORGE-FIRST  
**Player/creator payoff:** Creators can edit content and safely test changes in live gameplay without restarting the entire game for every iteration.

## Purpose

Create controlled live playtest / hot reload.

## In scope

- developer runtime connection;
- selected source change detection;
- narrow validation;
- bake delta;
- runtime product reload;
- state-preservation policy;
- restart-required classification;
- rollback;
- error recovery;
- version mismatch diagnostics;
- multiplayer-safe future boundary.

## Explicit non-scope

Arbitrary code hot patching; bypassing validators; live mutation of irreversible world state without confirmation.

## Core law

Hot reload is a reproducible source→bake→runtime update path.

## Acceptance

- representative material/icon/structure/creature-data changes update live where allowed;
- restart-required changes are identified honestly;
- failed update rolls back safely;
- source revision and runtime product stay traceable;
- persistent-world destructive changes require explicit safety handling;
- final SHA/CI passes.

## Rule-of-cool target

> **Change it in The Forge, turn around in the world, and see it.**

## Exit gate

Controlled live iteration works.

---

# P135 — ECHOES OF YESTERDAY

**Classification:** FORGE-FIRST / FOUNDATION  
**Player/creator payoff:** Creators can compare revisions, understand changes and safely restore earlier source.

## Purpose

Create Revision, Comparison & Review Forge.

## In scope

- source revision history;
- branch/draft review state;
- side-by-side visual comparison;
- semantic diff;
- dependency diff;
- generated-product diff;
- validation diff;
- before/after capture;
- comment/review notes;
- approval record;
- restore/branch;
- migration comparison;
- supersession.

## Core law

Review compares meaning as well as raw text/files.

## Acceptance

- source revision restores safely;
- semantic diff works on representative Forge classes;
- changed dependencies/outputs visible;
- visual before/after available through Capture Studio;
- approval/review is attributable;
- restoring old revision does not silently reuse incompatible stale bakes;
- final SHA/CI passes.

## Exit gate

Revision/review workflow operational.

---

# P136 — BOUND IN WAX AND RUNE

**Classification:** FORGE-FIRST / FOUNDATION  
**Player/creator payoff:** Finished content can be built into explicit, versioned, dependency-aware production packages.

## Purpose

Create Package Forge.

## In scope

Package manifest:

- package ID;
- title/version;
- author/owner;
- content list;
- source/product policy;
- dependencies;
- optional dependencies;
- registry contributions;
- override/load-order policy;
- compatibility range;
- migrations;
- localisation;
- previews/captures;
- licences/provenance as required;
- security capability declaration;
- validation/certification;
- build hash;
- release channel.

Package operations:

- validate;
- dependency resolve;
- build;
- inspect;
- install in dev environment;
- update;
- rollback;
- migration report;
- conflict report.

## Core law

Packaging does not grant authority to override canon.

Developer/base-game package rules remain governed.

## Acceptance

Representative multi-domain package builds; missing dependencies fail clearly; deterministic product manifest produced; version/update/rollback works in dev fixture; localisation/captures included; security capability explicit; final SHA/CI passes.

## Exit gate

Package Forge operational.

---

# P137 — THE FORGE UNBOUND

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** A genuine mini expansion can be created end to end through The Forge without bespoke manual pipelines.

## Purpose

Certify ARC XV.

## Required mini-expansion scope

The certification package should contain a bounded but cross-domain set such as:

- new material/resource family;
- several blocks/components;
- one item/tool/equipment family;
- one workstation/machine or magical device;
- one recipe/progression chain;
- one structure or small site;
- furniture/interactive structure components sufficient to prove ordinary building-content production;
- one creature/entity or NPC-facing content element where practical;
- animation/VFX/audio;
- UI/icons/captures;
- one quest/event hook or discovery;
- one world/biome/realm-compatible placement hook;
- localisation keys;
- package manifest;
- regression fixture.

The exact theme remains a production choice.

## Gap closure

P137 explicitly proves that ordinary **furniture / interactive construction components** can travel through the complete Forge/runtime lifecycle rather than remaining a documentation-only content category.

## Required journey

```text
authority / IDs
→ Forge workspace
→ Creation Journeys
→ dependencies
→ specialist authoring
→ 2D/capture
→ validation
→ Test Lab
→ live iteration
→ revision review
→ package build
→ install
→ runtime play
→ update
→ rollback
```

## Core law

No bespoke expansion build script/pipeline may bypass Package Forge.

No AI assistance is required.

## Recommended child slices

- P137-A — certification expansion brief/authority;
- P137-B — multi-domain source production;
- P137-C — validation/Test Lab/live iteration;
- P137-D — captures/review/package;
- P137-E — install/update/rollback/runtime;
- P137-F — human review/performance;
- P137-G — PG-15 reconciliation.

## Acceptance

1. Expansion created through normal Forge tools.
2. Cross-domain dependencies inspectable.
3. Every required product validates.
4. Test Lab and live iteration used.
5. Revision comparison captures changes.
6. Package builds/installs/updates/rolls back.
7. Runtime uses packaged products.
8. Furniture/interactive construction components included and functional.
9. No hidden manual production pipeline required.
10. No AI required.
11. Human review says the Forge feels coherent rather than stitched together.
12. Final SHA/CI passes.

## Rule-of-cool target

> **Make an actual Leyforge expansion with The Forge.**

## Exit gate — PG-15 UNIFIED FORGE PRODUCTION PLATFORM

PG-15 passes when P127–P137 are COMPLETE and a real multi-domain content package is authored, validated, tested, packaged and played entirely through governed Forge workflows.

---

# 03. ARC XVI — A WORLD THAT REMEMBERS

---

# P138 — WHAT IS KNOWN

**Classification:** FOUNDATION  
**Player/creator payoff:** Leyforge gains a formal knowledge model where different people can know different things about the same world.

## Purpose

Create the Knowledge Contract.

## In scope

Core record types:

### Reality record
Authoritative world state owned by the relevant gameplay system.

### Observation
An actor/system perceived something at a time/place.

### Evidence
Persistent support for a claim:

- object;
- sample;
- document;
- testimony;
- measurement;
- event trace.

### Claim
A proposition about reality.

### Knowledge state
An observer/organisation accepts a claim with provenance/confidence.

### Belief
Accepted proposition that may not be sufficiently verified.

### Rumour
Propagating claim with indirect provenance.

### Memory
Actor-specific retained record/summary of experienced or learned information.

### Archive record
Persisted documentary evidence/account.

### Historical interpretation
A later synthesis of records/claims/events.

## Suggested common fields

- subject;
- predicate/topic;
- value/claim payload;
- observer/holder;
- source;
- timestamp/period;
- location/realm;
- confidence;
- verification state;
- direct/indirect;
- secrecy/access;
- contradiction set;
- provenance chain;
- freshness/expiry;
- sharing policy.

## Core laws

- engine truth ≠ universal knowledge;
- knowledge can be incomplete/outdated/wrong;
- false knowledge never changes reality merely by existing;
- UI/map/Codex query actor knowledge rather than unrestricted world state.

## Recommended child slices

- P138-A — knowledge ontology/contracts;
- P138-B — observation/evidence/claim;
- P138-C — holder/confidence/provenance;
- P138-D — contradiction/freshness/secrecy;
- P138-E — query/API/persistence;
- P138-F — performance/reconciliation.

## Acceptance

- two actors can know different facts;
- stale map/claim remains stale without changing reality;
- false rumour represented safely;
- provenance traceable;
- knowledge query does not leak engine truth;
- persistence/reload stable;
- performance bounded;
- final SHA/CI passes.

## Manual scenario

Hide a site from player/NPC A → let NPC B observe it → transfer a partial report → compare all knowledge states.

## Rule-of-cool target

> **The world can contain truth that nobody knows yet.**

## Exit gate

Knowledge primitive production-ready.

---

# P139 — PAGES AGAINST OBLIVION

**Classification:** FORGE-FIRST / FOUNDATION  
**Player/creator payoff:** Lore, research, discoveries, recipes and progression can be authored as a connected knowledge web rather than one linear tech tree.

## Purpose

Create Knowledge & In-Game Codex Forge, including Research / Progression / Invention authoring.

## Source packet

Set 29 Knowledge/Lore/Discovery; Player Progression; Items/Recipes knowledge items; UI/UX knowledge web; P138.

## In scope

### Knowledge/Codex authoring

- topic/concept identity;
- subject links;
- lore entry;
- discovery condition;
- evidence links;
- source reliability;
- spoiler/knowledge visibility;
- images/captures;
- maps;
- cross-links;
- localisation;
- updates/revisions.

### Research / Progression Forge child surface

- research node;
- prerequisite knowledge;
- evidence requirement;
- sample/material requirement;
- experiment;
- station/tool;
- teacher;
- faction/culture permission;
- prototype/invention step;
- time/labour;
- alternative discovery paths;
- unlock outputs;
- recipe/system/Forge-content unlock hooks;
- hidden/rumoured node;
- validation.

### In-Game Codex runtime products

- known entries;
- unknown hints;
- partial entries;
- contradictory accounts;
- source/provenance;
- research links;
- map/site links;
- recipe/content links.

## Core law

Research converts evidence into understanding/unlocks.

It is not one universal XP currency.

## Progression law

Where multiple paths are valid, the Forge should permit:

- discovery;
- teaching;
- experimentation;
- faction trust;
- research;
- prerequisite crafting;
- quest/world event;

to converge on the same canonical unlock without duplicating the unlocked content.

## Recommended child slices

- P139-A — knowledge-topic/Codex sources;
- P139-B — research/progression graph;
- P139-C — evidence/experiment/teacher paths;
- P139-D — invention/prototype authoring;
- P139-E — Codex UI/knowledge filtering;
- P139-F — validation/Test Lab/reconciliation.

## Acceptance

- Codex entry visibility follows holder knowledge;
- research nodes bind real evidence/inputs;
- at least one unlock has multiple valid acquisition paths;
- recipe/system unlock remains one canonical identity;
- false/disputed knowledge can display without being treated as verified;
- spoiler/localisation/accessibility rules work;
- Progression Forge gap is considered closed under this slice;
- final SHA/CI passes.

## Manual scenario

Discover a material → receive rumour → collect sample → research → learn recipe; repeat alternative path through NPC teaching and confirm same canonical unlock.

## Exit gate

Knowledge/Codex/Research/Progression Forge operational.

---

# P140 — STORIES WAITING TO HAPPEN

**Classification:** FORGE-FIRST  
**Player/creator payoff:** Quests and events can be authored from real world conditions, identities and systemic objectives.

## Purpose

Create Quest & Event Forge.

## In scope

Quest/event source:

- stable ID;
- category;
- scope/ownership;
- discovery channels;
- eligibility conditions;
- bindings;
- objectives;
- optional objectives;
- systemic solution classes;
- branching;
- timers/windows where applicable;
- contribution;
- rewards;
- failures;
- aftermath;
- follow-up;
- knowledge requirements;
- secrecy/spoiler;
- multiplayer ownership hook;
- accessibility/guidance options.

Objective library may include:

- acquire/deliver;
- produce;
- construct/repair;
- defend;
- negotiate;
- investigate;
- explore/discover;
- escort;
- teach/train;
- operate machinery;
- ritual;
- route/trade;
- world-state threshold.

## Template generation

Contextual templates can bind to valid:

- NPC;
- settlement;
- faction;
- resource;
- structure;
- route;
- threat;
- relationship;
- knowledge;
- world event.

## Core law

Generated quests use valid world bindings.

They do not invent fake unavailable resources/NPCs/locations.

## Recommended child slices

- P140-A — quest/event source schema;
- P140-B — conditions/objectives/results;
- P140-C — bindings/template generation;
- P140-D — branching/failure/aftermath;
- P140-E — journal/guidance/Test Lab;
- P140-F — validation/reconciliation.

## Acceptance

- authored and contextual-template quest both work;
- objectives consume real system state;
- at least two solution paths supported where plausible;
- failure creates persistent aftermath;
- invalid/stale bindings fail or re-resolve safely according to policy;
- knowledge/spoiler rules respected;
- final SHA/CI passes.

## Exit gate

Quest & Event Forge operational.

---

# P141 — THE TURNING OF DAYS

**Classification:** FOUNDATION / INTEGRATION  
**Player/creator payoff:** Meaningful world events can occur because of simulation, calendar, player action and faction/world state.

## Purpose

Create World Event Runtime.

## In scope

Event trigger families:

- condition-driven;
- calendar/season;
- weighted opportunity;
- player-triggered;
- faction/government;
- ecology;
- weather;
- magic;
- realm;
- settlement need;
- economy;
- conflict;
- quest consequence.

Event lifecycle:

```text
eligible
→ pending/telegraph
→ active
→ resolved/failed/aborted
→ aftermath
→ history
```

Event scale:

- personal;
- household;
- settlement;
- regional;
- faction;
- realm;
- world.

## Core law

World Events coordinate normal systems rather than privately simulating fake copies of them.

## Acceptance

- events triggered from real system conditions;
- event overlap policy works;
- telegraph/knowledge respects observer information;
- consequences persist;
- event can resolve in active or bounded LOD;
- frequency configurable;
- event history recorded;
- final SHA/CI passes.

## Manual scenario

Create shortage/weather/faction condition → event emerges → player ignores or intervenes → inspect different persistent outcomes.

## Exit gate

World Event Runtime operational.

---

# P142 — I REMEMBER YOU

**Classification:** COOL-PULL / FOUNDATION  
**Player/creator payoff:** Named NPCs can remember meaningful interactions and relationships over time.

## Purpose

Create NPC Memory & Relationship Runtime.

## In scope

Memory classes:

- interaction;
- help/harm;
- promise/debt;
- witnessed event;
- shared project;
- combat/defence;
- gift/trade;
- teaching;
- discovery;
- household milestone;
- grief/death;
- celebration;
- faction/political event.

Relationship dimensions may include:

- familiarity;
- trust;
- affection;
- respect;
- fear;
- grievance;
- obligation;
- kinship;
- professional/faction context.

Memory operations:

- encode;
- summarise;
- reinforce;
- decay where appropriate;
- contradict/correct;
- share;
- query for dialogue/planner;
- archive significant life events.

## Core law

NPC memory is bounded.

No actor stores infinite frame-by-frame history.

## Recommended child slices

- P142-A — memory schema/importance;
- P142-B — relationship dimensions;
- P142-C — encode/decay/reinforcement;
- P142-D — dialogue/planner integration;
- P142-E — persistence/LOD/performance;
- P142-F — reconciliation.

## Acceptance

- NPC reacts differently after meaningful help/harm;
- memory persists through unload/reload;
- minor memories can summarise/decay without losing critical history;
- relationship is multidimensional, not one score;
- knowledge provenance distinguishes witnessed vs told;
- performance bounded for representative population;
- final SHA/CI passes.

## Rule-of-cool target

> **“Wait... this NPC actually remembers that.”**

## Exit gate

NPC memory/relationships operational.

---

# P143 — THOSE WHO COME AFTER

**Classification:** COOL-PULL / EXPANSION  
**Player/creator payoff:** Households and societies can continue through births, families, inheritance and succession.

## Purpose

Create Families, Generations & Succession Runtime.

## In scope

- parent/guardian/child links;
- household membership;
- birth/adoption hooks according to canon/settings;
- childhood/life-stage hooks;
- lineage;
- inheritance;
- household property/role succession;
- profession/knowledge exposure;
- culture/faction/faith exposure without deterministic assignment;
- office/title succession integration;
- death/widow/orphan household consequences;
- genealogy/records;
- migration/marriage/partnership hooks where canon supports;
- long-term population continuity.

## Core laws

A successor/child is a new persistent identity.

Ancestry/body lineage does not force:

- culture;
- politics;
- faction;
- morality;
- profession.

## Recommended child slices

- P143-A — kinship/household graph;
- P143-B — life-stage/generation hooks;
- P143-C — inheritance/property;
- P143-D — civic/profession succession;
- P143-E — genealogy/persistence/LOD;
- P143-F — reconciliation.

## Acceptance

- new generation identities persist;
- household succession works after death;
- ownership/role transfer explicit;
- culture/faction remain independent data;
- genealogy records queryable;
- long-run simulation bounded;
- final SHA/CI passes.

## Exit gate

Generational continuity operational.

---

# P144 — RUMOURS ON THE ROAD

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** News, warnings and stories can spread imperfectly through people, settlements and routes.

## Purpose

Create Information Propagation & Rumour Runtime.

## In scope

Information packet:

- claim/topic;
- source/provenance;
- teller;
- audience;
- confidence;
- distortion policy where authorised;
- secrecy;
- urgency;
- expiry/freshness;
- transmission channel;
- location/time.

Channels:

- direct conversation;
- household;
- workplace;
- market/tavern/public space;
- request board;
- caravan/road;
- port/ship;
- messenger;
- faction/government;
- archive/library;
- magical communication where authorised;
- portal/cross-realm route.

## Core laws

- information does not teleport globally;
- propagation never changes underlying reality;
- distortion is bounded/traceable, not random nonsense;
- false rumours can exist as claims.

## Recommended child slices

- P144-A — information packet/channel;
- P144-B — social/local propagation;
- P144-C — route/caravan/port propagation;
- P144-D — faction/magic/cross-realm hooks;
- P144-E — distortion/freshness/knowledge integration;
- P144-F — performance/reconciliation.

## Acceptance

- report spreads progressively through a route network;
- actors can hold different versions/confidence;
- stale/false rumour remains distinguishable from verified fact;
- blocked route delays information;
- player learns only when channel reaches them;
- simulation bounded;
- final SHA/CI passes.

## Manual scenario

Cause event in Town A → leave Town B unaware → allow caravan/messenger to travel → observe rumour arrival/version/confidence.

## Rule-of-cool target

> **You can outrun the news of what you did.**

## Exit gate

Information propagation operational.

---

# P145 — INK AND STONE

**Classification:** FOUNDATION / COOL-PULL  
**Player/creator payoff:** Settlements can preserve records, maps, contracts, genealogies, discoveries and accounts in physical archives and historical sites.

## Purpose

Create Archives, Records & Historical Site Runtime.

## In scope

Record families:

- law;
- contract;
- census/household;
- genealogy;
- property;
- map;
- route;
- expedition;
- research;
- recipe/schema;
- faction/government;
- trial/decision;
- event account;
- memorial/death;
- construction;
- trade;
- portal/realm;
- correspondence.

Archive capabilities:

- collection;
- ownership;
- access/permission;
- indexing;
- storage location;
- copying;
- damage/loss;
- restoration;
- forgery/dispute hook;
- translation/language hook;
- provenance;
- discovery/research linkage.

Historical sites:

- ruins;
- monuments;
- battle sites;
- old roads;
- abandoned settlements;
- archives;
- graves/memorials;
- preserved machines/structures.

## Core law

Archive contents are stored evidence/records.

They do not automatically become universal actor knowledge.

## Recommended child slices

- P145-A — record schema;
- P145-B — archive collection/access;
- P145-C — physical record items/locations;
- P145-D — historical site evidence;
- P145-E — damage/restoration/research;
- P145-F — reconciliation.

## Acceptance

- physical/archive record has provenance/access;
- discovering archive can create knowledge/research opportunities;
- destruction/loss removes access without rewriting historical reality;
- copying preserves lineage;
- permission controls sensitive records;
- save/reload stable;
- final SHA/CI passes.

## Exit gate

Archives/records/historical sites operational.

---

# P146 — SCARS UPON THE LAND

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** Major events leave persistent physical and social layers that can still be discovered generations later.

## Purpose

Create Persistent Historical Layering.

## In scope

Layer families:

- construction origin;
- upgrade;
- repair;
- disaster;
- occupation;
- liberation;
- abandonment;
- reuse;
- cultural adaptation;
- faction/government overlay;
- memorialisation;
- ecological succession;
- magical contamination/cleansing;
- road/route change;
- territorial change;
- ruin formation;
- restoration.

Layer requirements:

- source event;
- timestamp/period;
- author/actor/faction where known;
- affected world object/site;
- material/state delta;
- visibility;
- knowledge evidence;
- restoration/removal rule;
- provenance.

## Core law

Prefer changing the real world object/state over spawning decorative historical evidence unrelated to actual history.

## Recommended child slices

- P146-A — historical layer schema;
- P146-B — structure/route/territory layers;
- P146-C — ecology/magic/culture overlays;
- P146-D — site discovery/evidence;
- P146-E — long-term compaction/persistence;
- P146-F — reconciliation.

## Acceptance

- damaged/repaired/occupied structure preserves layered provenance;
- old route remains historically detectable after reroute where configured;
- historical layer can generate evidence/knowledge;
- restoration does not erase event history unless explicitly authorised;
- long-run layer compaction remains bounded;
- final SHA/CI passes.

## Rule-of-cool target

> **The world can show you what happened without a quest marker explaining it.**

## Exit gate

Persistent historical layering operational.

---

# P147 — THE CHRONICLE

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** The player can read an evolving, knowledge-aware history of their world without being granted developer omniscience.

## Purpose

Create the In-Game Chronicle.

## In scope

Chronicle entries may draw from:

- player observations;
- verified public records;
- archive research;
- NPC testimony;
- faction reports;
- maps;
- treaties;
- battles;
- constructions;
- disasters;
- discoveries;
- realm crossings;
- births/deaths/succession;
- major projects;
- player actions.

Presentation can distinguish:

- confirmed;
- reported;
- disputed;
- partially known;
- unknown cause;
- outdated;
- private/secret where permission allows.

Chronicle views:

- timeline;
- place/site;
- person/household;
- settlement;
- faction;
- realm;
- project;
- discovery;
- custom bookmarks/search.

## Core law

Chronicle is assembled from legitimate knowledge/evidence for the player.

It is not automatically the engine's omniscient event log.

## Recommended child slices

- P147-A — Chronicle data/query layer;
- P147-B — event/history aggregation;
- P147-C — confidence/dispute/provenance;
- P147-D — UI/search/timeline;
- P147-E — map/Codex/archive links;
- P147-F — performance/reconciliation.

## Acceptance

- unknown event remains absent/partial;
- later archive discovery can enrich old entry;
- contradictory accounts display as such;
- Chronicle links to map/Codex/person/site;
- long histories remain searchable/bounded;
- localisation/accessibility passes;
- final SHA/CI passes.

## Manual scenario

Experience one event directly; hear another as rumour; discover archival evidence about an old event; inspect different Chronicle certainty.

## Rule-of-cool target

> **The save file starts reading like the history of a place that actually existed.**

## Exit gate

Chronicle operational.

---

# P148 — A WORLD THAT REMEMBERS

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** Long-running Leyforge worlds accumulate people, memories, rumours, records and physical history that remain coherent over time.

## Purpose

Certify ARC XVI.

## Golden long-simulation scenario

The certification world should include:

- several settlements;
- named households/NPCs;
- trade/routes;
- factions/governments;
- discoveries;
- quest/event chains;
- birth/succession/death;
- relationship change;
- rumour propagation;
- archive creation/use;
- route/structure damage and repair;
- occupation or other major historical layer where appropriate;
- realm/cross-realm knowledge hook;
- Chronicle updates;
- save/reload and simulation LOD;
- substantial elapsed world time.

Example history chain:

```text
expedition discovers site
→ only expedition party knows
→ rumour reaches settlement
→ archive receives report/map
→ research verifies part of claim
→ faction acts on discovery
→ conflict damages route/site
→ settlement repairs/commemorates
→ original witnesses age/die
→ descendants inherit partial records
→ Chronicle contains layered account
```

## Core law

No `WorldHistoryManager` may fabricate a parallel fake world.

History is derived from persistent events, records, states, memories and evidence emitted by normal systems.

A coordinating history/index service is allowed, but it indexes authoritative records rather than replacing them.

## Recommended child slices

- P148-A — long-world certification fixture;
- P148-B — knowledge/event/memory integration;
- P148-C — generations/rumours/archives;
- P148-D — physical layering/Chronicle;
- P148-E — LOD/save/performance;
- P148-F — human review/regression;
- P148-G — PG-16 reconciliation.

## Acceptance

1. Different actors hold meaningfully different knowledge.
2. NPC memories/relationships persist and influence behaviour/dialogue.
3. Generational succession preserves identity/history without cloning people.
4. Rumours travel through actual channels/routes.
5. Archives preserve records without granting instant universal knowledge.
6. Historical changes remain visible/provenanced.
7. Chronicle reflects player-known/disputed history rather than omniscient truth.
8. Long simulation survives save/reload/LOD.
9. Old evidence can revise later understanding without rewriting past reality.
10. Performance/storage remain within provisional long-world budgets.
11. Human review confirms the world feels accumulated rather than reset-driven.
12. Final SHA/CI passes.

## Rule-of-cool target

> **Leave for years. Come back. The world remembers.**

## Exit gate — PG-16 PERSISTENT KNOWLEDGE & HISTORY FOUNDATION

PG-16 passes when P138–P148 are COMPLETE and knowledge, research, quests/events, memories, generations, rumours, archives, historical layering and Chronicle coexist without collapsing engine truth into universal knowledge.

---

# 04. PG-15 — Unified Forge Production Platform Summary

| Capability | Parent |
| --- | --- |
| Unified Forge Workspace | P127 |
| Creation Journey Engine | P128 |
| Dependency / Composition Graph | P129 |
| UI / Icon / 2D Forge | P130 |
| Capture Studio | P131 |
| Universal Forge Validation | P132 |
| Final Test Laboratory | P133 |
| Live Playtest / Hot Reload | P134 |
| Revision / Comparison / Review | P135 |
| Package Forge | P136 |
| Forge-made Mini Expansion | P137 |

Minimum end-to-end:

```text
canonical ID
→ unified workspace
→ creation journey
→ specialist source authoring
→ dependency graph
→ 2D/capture
→ validation
→ Test Lab
→ live iteration
→ revision review
→ package build
→ install/update/rollback
→ runtime play
```

---

# 05. PG-16 — Persistent Knowledge & History Foundation Summary

| Capability | Parent |
| --- | --- |
| Knowledge Contract | P138 |
| Knowledge / Codex / Research / Progression Forge | P139 |
| Quest & Event Forge | P140 |
| World Event Runtime | P141 |
| NPC Memory & Relationships | P142 |
| Families / Generations / Succession | P143 |
| Rumours / Information Propagation | P144 |
| Archives / Records / Historical Sites | P145 |
| Persistent Historical Layering | P146 |
| Chronicle | P147 |
| A World That Remembers | P148 |

Minimum end-to-end:

```text
world event occurs
→ some actors observe
→ evidence/claims form
→ knowledge differs
→ rumour spreads
→ records are archived
→ research verifies/changes understanding
→ NPC relationships/memory change
→ later generation inherits records/context
→ physical world preserves scars
→ Chronicle reflects what player actually knows
```

---

# 06. Recommended Production Concurrency

## P127–P129

Unified shell, journey engine and dependency graph should be designed together around stable shared services.

P129 graph semantics must not become a prerequisite for opening every basic editor during early implementation, but final PG-15 requires them integrated.

## P130–P133

2D Forge, Capture Studio, Validation and Test Lab can progress in parallel once shared manifest/source interfaces are stable.

Capture and validation should use the same revision/product IDs.

## P134–P136

Hot reload, revision review and packaging may overlap after deterministic bake/product identity is stable.

## P137

Do not begin certification expansion until P127–P136 are sufficiently operational.

P137 is a test of the platform, not a substitute for finishing it.

## P138/P139

Knowledge Contract must stabilise before Knowledge/Codex/Research Forge freezes its schemas.

## P140/P141

Quest/Event Forge and World Event Runtime may overlap once standard condition/objective/event-result contracts are stable.

## P142–P145

Memory, generations, rumours and archives may develop in parallel against P138 Knowledge/History primitives.

## P146/P147

Historical layering and Chronicle can overlap once authoritative history/event records stabilise.

---

# 07. Explicit Anti-Scope

## Forge anti-scope

Reject:

- a new duplicate lifecycle/status system per specialist editor;
- manual screenshot-only production;
- silent source repair inside generated products;
- AI dependency before ARC XIX;
- arbitrary code execution in packages;
- one giant generic editor that destroys specialist guidance;
- making “Production Ready” a manual checkbox that ignores validators.

## Knowledge/history anti-scope

Reject:

- omniscient NPCs;
- omniscient maps;
- global instant rumours;
- all social consequence reduced to reputation;
- family lineage forcing culture/politics/morality;
- archives granting instant knowledge;
- Chronicle as raw developer event log;
- fake history props unrelated to actual world state;
- research as one universal XP bar.

---

# 08. Cross-Arc Architectural Locks

## 08.1 Creation Journey closes the usability gap

The Forge can remain powerful without demanding that every creator memorise the entire pipeline.

Guided stages expose what is missing.

Experts remain fast.

## 08.2 Dependency graph and provenance become production infrastructure

This allows:

- safe rebuild;
- revision review;
- packages;
- migration;
- impact analysis;
- composition explanation.

## 08.3 Research/Progression Forge is formally placed

The previously unresolved roadmap gap is closed under P139 rather than adding an extra parent slice.

## 08.4 The Forge must prove itself without AI

P137 is deliberately before ARC XIX.

If the Forge cannot create content without AI, AI would be masking an incomplete toolchain.

## 08.5 Knowledge becomes a universal observer-relative primitive

Maps, Codex, dialogue, quests, rumours, factions, research and Chronicle can now query the same conceptual knowledge model.

## 08.6 Quest generation is world-bound

Generated content is constrained by real identities/state.

This prevents “bring me 20 Moonsteel” when no Moonsteel source exists in that world.

## 08.7 Memory and history remain different

Memory belongs to an actor.

History may be reconstructed from many records/events.

Neither automatically equals objective reality.

## 08.8 Physical world history remains valuable evidence

Repairs, occupations, ruins, road changes and monuments can tell history spatially.

The world itself becomes an archive.

---

# 09. Persistent Regression Fixtures

Retain at minimum:

- P127 unified workspace smoke project;
- P128 multi-domain journey suite;
- P129 dependency/provenance graph project;
- P130 icon/map/UI product pack;
- P131 deterministic capture matrix;
- P132 cross-domain validation corpus;
- P133 multi-template Test Lab suite;
- P134 hot-reload rollback fixture;
- P135 revision semantic-diff project;
- P136 package dependency/update fixture;
- P137 Forge certification mini expansion;
- P138 differing-observer knowledge fixture;
- P139 research/progression knowledge web;
- P140 authored/contextual quest pair;
- P141 world-event aftermath fixture;
- P142 NPC memory/relationship fixture;
- P143 multi-generation household;
- P144 two-settlement rumour route;
- P145 archive/historical-site fixture;
- P146 layered structure/route history;
- P147 Chronicle certainty/dispute fixture;
- P148 long-world memory/history regression save.

P137 and P148 become top-tier long-term certification fixtures.

---

# 10. ProductionRegistry Seed Entries

```text
P127 — The Great Workshop
P128 — The Path of Making
P129 — Threads of the Forge
P130 — Ink, Icon & Interface
P131 — The Eye of the Forge
P132 — The Judge's Hammer
P133 — The Living Test Chamber
P134 — Forge Without Walls
P135 — Echoes of Yesterday
P136 — Bound in Wax and Rune
P137 — The Forge Unbound
P138 — What Is Known
P139 — Pages Against Oblivion
P140 — Stories Waiting to Happen
P141 — The Turning of Days
P142 — I Remember You
P143 — Those Who Come After
P144 — Rumours on the Road
P145 — Ink and Stone
P146 — Scars Upon the Land
P147 — The Chronicle
P148 — A World That Remembers
```

No status becomes READY merely because this document exists.

---

# 11. Open Decisions Deliberately Deferred to Execution Evidence

PROD-14 does not silently decide:

- final Forge desktop/window layout;
- exact graph database/library implementation;
- exact undo/redo storage architecture;
- exact capture renderer;
- exact hot-reload transport;
- exact package binary/container format;
- exact source-control integration;
- exact semantic-diff algorithm;
- exact validator parallelism;
- exact knowledge confidence arithmetic;
- exact memory decay formula;
- exact relationship dimension weights;
- exact population reproduction rates;
- exact rumour distortion probabilities;
- exact archive storage density;
- exact history compaction strategy;
- exact Chronicle summarisation algorithm;
- exact research timing/balance.

Those remain implementation/balance/evidence decisions.

---

# 12. PROD-14 Acceptance Gate

PROD-14 is ready for owner lock when the owner agrees that:

- [ ] P127–P148 retain PROD-02 names/order;
- [ ] The Forge is one shared production platform with specialist workflows;
- [ ] Creation Journey stages are declarative and domain-specific;
- [ ] experts may navigate freely but cannot bypass correctness;
- [ ] source remains authoritative over generated products;
- [ ] dependency/provenance/override truth is inspectable;
- [ ] UI/Icon/2D and Capture are governed production products;
- [ ] validation is layered and produces stable diagnostics;
- [ ] Test Lab executes runtime/baked products;
- [ ] hot reload remains reproducible and rollback-safe;
- [ ] revision comparison includes semantic changes;
- [ ] packages use explicit manifests/dependencies/compatibility;
- [ ] P137 proves a real Forge-made expansion without AI;
- [ ] furniture/interactive structure component production is proven inside P137;
- [ ] reality, observation, evidence, claims, knowledge, belief, rumour, memory, record and history remain distinct;
- [ ] knowledge has provenance and can be incomplete/incorrect;
- [ ] Research/Progression Forge is explicitly owned under P139;
- [ ] research converts evidence into understanding/unlocks rather than universal XP;
- [ ] quests/events bind real identities/world state;
- [ ] event failure may create persistent aftermath;
- [ ] NPC memory is bounded and relationships multidimensional;
- [ ] descendants/successors are new identities and do not inherit culture/politics deterministically;
- [ ] rumours travel through channels/routes rather than globally;
- [ ] archives store evidence without granting universal knowledge;
- [ ] historical layering modifies/provenances real world state;
- [ ] Chronicle is player-knowledge-aware rather than developer-omniscient;
- [ ] P148 certifies long-running world memory/history coherently.

---

# 13. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-14 — LEYFORGE ARCS XV–XVI PRODUCTION CONTRACTS — v0.1**
>
> ARC XV completes The Forge as a unified production platform. Specialist editors share one workspace, Creation Journey Engine, dependency/composition graph, 2D/capture pipeline, validation framework, Test Laboratory, live iteration path, revision system and Package Forge. Editable Forge source remains authoritative over reproducible generated products; production status is explicit; validation cannot silently repair canon or engineering; and the platform must prove itself by producing a real multi-domain mini expansion without AI or hidden manual pipelines. ARC XVI then establishes observer-relative knowledge and persistent history. Reality, observations, evidence, claims, knowledge, beliefs, rumours, memories, records and historical interpretation remain distinct. Knowledge & Codex Forge includes the previously unresolved Research/Progression/Invention authoring surface, while Quest & Event Forge binds stories to actual world identities and state. NPCs retain bounded meaningful memories and multidimensional relationships; households continue across generations; rumours travel through actual social/route channels; archives preserve evidence; structures/routes/settlements retain historical layers; and the Chronicle presents what the player can legitimately know rather than an omniscient developer timeline. By P148, a long-running Leyforge world can accumulate history instead of repeatedly resetting its context.

---

# 14. Next Document

After PROD-14 acceptance/reconciliation, continue to:

> **PROD-15 — Arcs XVII–XVIII Production Contracts: P149–P170**

That volume will cover:

- multiplayer authority;
- joining/reconnecting;
- cooperative voxel interaction;
- cooperative settlements;
- multiplayer living simulation;
- collaborative Forge;
- safe mod/content-pack runtime;
- community content/sharing;
- dedicated servers;
- multiplayer integration;
- Performance Observatory;
- low-end scalability;
- Create Realm/world settings;
- main menu/world management;
- accessibility finalisation;
- localisation;
- final UI/UX/trust pass;
- save migration/backups/recovery;
- update/patch/content lifecycle;
- diagnostics/security/support;
- platform/distribution;
- whole non-AI game certification.

---

**End of PROD-14 v0.1 — Arcs XV–XVI Production Contracts Candidate**
