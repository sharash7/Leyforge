
# LEYFORGE PRODUCTION PROGRAMME

## PROD-15 — Arcs XVII–XVIII Production Contracts: P149–P170

**Document ID:** PROD-15  
**Title:** Leyforge Arcs XVII–XVIII Production Contracts — Many Hands, One World / Tempering Leyforge  
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
**Previous executable volumes:** PROD-07 through PROD-14  
**Arc scope:** ARC XVII — MANY HANDS, ONE WORLD / ARC XVIII — TEMPERING LEYFORGE  
**Parent slices:** P149–P170  
**Programme gates:** PG-17 Multiplayer, Community & Server Foundation; PG-18 Non-AI Release-Candidate Foundation  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge engineering, release engineering, PROD-16 onward

---

# 00. Executive Arc Statement

PROD-15 turns the complete single-authoritative-world Leyforge simulation into a multiplayer-capable, community-capable, maintainable and shippable product.

ARC XVII proves that multiple human players can enter the same authoritative world, edit it, build settlements, run its living simulation, collaborate inside The Forge, exchange governed content and operate long-running servers without creating a second set of gameplay rules.

ARC XVIII then hardens the entire non-AI game and creation platform for real users, real machines, long-lived saves, real updates and distribution.

The central promise of ARC XVII is:

> **Multiplayer adds multiple human participants to one authoritative Leyforge world; it does not fork gameplay truth into client-specific copies.**

The central promise of ARC XVIII is:

> **The released non-AI game must preserve the same simulation truth, content identity, accessibility, recoverability and Forge authority under low-end hardware, long saves, updates, failures and distribution conditions as it does in development.**

The combined progression is:

```text
MULTIPLAYER AUTHORITY
→ JOIN / LEAVE / RECONNECT
→ CO-OP WORLD EDITS
→ CO-OP SETTLEMENTS
→ MULTIPLAYER LIVING SIMULATION
→ COLLABORATIVE FORGE
→ SAFE MOD / CONTENT-PACK RUNTIME
→ COMMUNITY CONTENT / SHARING
→ DEDICATED SERVERS
→ MULTIPLAYER CERTIFICATION
→ PERFORMANCE OBSERVATORY
→ LOW-END / SCALABILITY HARDENING
→ CREATE REALM
→ FINAL FRONT END / WORLD MANAGEMENT / CHARACTER SETUP
→ ACCESSIBILITY FINALISATION
→ LOCALISATION
→ FINAL UI / TRUST PASS
→ SAVE MIGRATION / BACKUP / RECOVERY
→ UPDATE / PATCH / CONTENT LIFECYCLE
→ DIAGNOSTICS / SECURITY / SUPPORT
→ PLATFORM / DISTRIBUTION
→ WHOLE NON-AI GAME CERTIFICATION
```

---

# 01. Governing Production Rules for P149–P170

## 01.1 One authoritative world simulation

Leyforge does not implement one gameplay simulation per client.

```text
solo → local world host authoritative
listen-server multiplayer → host/server authoritative
dedicated server → dedicated runtime authoritative
clients → prediction/presentation/input requests, never final owners of persistent truth
```

This applies to voxels, inventories, transactions, NPCs, settlements, machines, magic, combat, quests/events, factions, vessels, portals and history.

## 01.2 Multiplayer reuses gameplay commands

Where practical, solo and multiplayer use the same authoritative mutation paths.

Do not create separate solo/network rule implementations that can drift.

## 01.3 Client prediction never becomes persistent authority

Clients may predict movement, animation, effects and placement previews.

Clients do not finalise inventory spend, damage, item creation, block placement, ownership or quest outcomes.

## 01.4 Network relevance is not simulation existence

An NPC outside replication range still exists in authoritative simulation.

Replication controls what a client receives, not whether world state exists.

## 01.5 Join-in-progress reconstructs current truth

A joining player receives world/version/content compatibility, persistent player/character binding, relevant current state, permissions, knowledge and scoped quest/event state.

## 01.6 Reconnect preserves identity

Reconnect returns the same persistent player/character unless a deliberate game rule says otherwise.

Disconnect cannot silently duplicate inventory or ownership.

## 01.7 Disconnect policy is explicit

Subsystems define what happens to reservations, tasks, vehicles, combat state and persistent presence.

No ad hoc per-system guessing.

## 01.8 Voxel edits are validated batched operations

Networked edits validate location, permission, tool/resource cost and resulting state, then persist/replicate authoritative deltas.

Clients never submit trusted whole chunks.

## 01.9 Resource conservation outranks latency

Lag may delay feedback.

It cannot justify duplicated pickups, trades, machine outputs or construction contribution.

## 01.10 Ownership uses the universal Permission contract

Multiplayer does not create a separate permission model.

## 01.11 PvP is governed world/server state

PvP/friendly fire/protected regions remain explicit settings and permission/combat rules, not mandatory multiplayer assumptions.

## 01.12 Quest and dialogue scope is explicit

State can be personal, party, settlement, faction, regional or world.

Not every story state becomes global because more than one player exists.

## 01.13 Knowledge remains observer-relative

One player's discovery is not automatically everybody's knowledge unless a sharing rule allows it.

## 01.14 Living simulation pause policy is explicit

Dedicated worlds may continue while nobody is connected.

Listen/solo worlds follow their configured host/time policy.

## 01.15 Collaborative Forge avoids last-writer chaos

Shared source requires identity, revision base, permissions, conflict handling and history.

## 01.16 Developer Forge and community Forge remain separate authority surfaces

Player/community creators cannot mutate official canon merely because they use the same underlying Forge services.

## 01.17 Community content is data-first and script-free by default

Normal packages do not require arbitrary native code, scripts, filesystem access or network access.

## 01.18 Package manifests are mandatory

Packages declare stable ID, version, compatibility, dependencies, hashes, capabilities, localisation and provenance.

## 01.19 Imported content validates before admission

Limits include size, nesting, references, dependency count, registry collisions and unsafe/malformed data.

## 01.20 Server content authority is explicit

Hosts/servers control required/allowed packs, versions and upload/install permissions.

## 01.21 Sharing format remains provider-independent

External workshop services may wrap the package system but do not own the format.

## 01.22 Dedicated servers have no render dependency

Authoritative domain simulation must run headless.

## 01.23 Server administration is explicit and auditable

Administrative mutation is logged and permissioned.

## 01.24 Performance budgets stay observable

P159 consolidates metrics developed throughout production into a release-grade observability layer.

## 01.25 Packaged-build performance is release evidence

Editor FPS is not final certification.

## 01.26 Scalability reduces detail before truth

Lower profiles can reduce visual density and simulation representation detail, but not casually alter authoritative outcomes.

## 01.27 Performance profiles are explicit products

Minimum/low, balanced/medium, high and custom equivalents are governed profiles, exact names deferred.

## 01.28 World creation separates simulation, challenge, worldgen, performance and accessibility

These are independent categories and must not collapse into one difficulty slider.

## 01.29 World settings and profile settings remain separate

World truth settings persist in the world manifest.

Personal UI/input preferences belong to player profile.

## 01.30 Player character customisation is explicitly owned in P162

P162 closes the remaining player-facing character setup gap using Character Forge-produced canonical assets.

It does not let players author new ancestry/culture definitions.

## 01.31 World library prioritises trust

World cards expose version/content/save-health/backup/compatibility state rather than hiding danger behind a Play button.

## 01.32 Accessibility is whole-product architecture

Gameplay, Forge, multiplayer, Create Realm, menus, maps, magic, settlements, content UI and server-facing interfaces all participate.

## 01.33 Critical meaning cannot depend on one channel

Colour/audio/motion/timing/text/icon/haptic alternatives are provided where practical.

## 01.34 Localisation keys are stable production identity

Source-language display text is not a stable gameplay ID.

## 01.35 Localisation must support reflow

Longer text, plural forms, larger text and locale-specific formatting must not destroy layouts.

## 01.36 UI reports authoritative reasons

The presentation may simplify wording but cannot invent a different failure cause.

## 01.37 Saves are long-term player assets

Atomicity, backups, integrity, migrations and recovery are release-critical.

## 01.38 Updating is multi-version reconciliation

Runtime, saves, registries, core content, Forge schema, mods/packages, servers and localisation all have versions that can interact.

## 01.39 World-required content is retained or migrated safely

Updates cannot casually erase the only compatible content version a world needs.

## 01.40 Diagnostics are privacy-conscious and inspectable

Support bundles minimise sensitive/free-form content and expose what is included.

## 01.41 Shipping builds remove unrestricted developer authority

No accidental privileged debug mutation or secret tooling remains available to players.

## 01.42 Platform services are adapters

Stores/cloud/invites/achievements do not become the only owner of world/save truth.

## 01.43 P170 certifies the game with AI unavailable

> **Leyforge works without AI.**  
> **The Forge works without AI.**

---

# 02. ARC XVII — MANY HANDS, ONE WORLD

# P149 — THE SHARED TRUTH

**Classification:** FOUNDATION  
**Player/creator payoff:** Leyforge gains authoritative multiplayer without duplicating solo gameplay rules.

## Purpose

Create the Multiplayer Authority Runtime.

## In scope

- network/player/world identity;
- authoritative command envelope;
- validation and result reasons;
- replication/relevance abstraction;
- server clock/tick hooks;
- transaction idempotency;
- ownership/permission;
- prediction hooks;
- snapshot/delta transfer;
- authority diagnostics;
- solo/listen/dedicated compatibility.

## Explicit non-scope

Final matchmaking provider, host migration promise, all domain tuning.

## Core law

Multiplayer transports validated gameplay commands and state; it does not own duplicate gameplay logic.

## Child slices

- P149-A network/player identity;
- P149-B command/result authority;
- P149-C replication/relevance;
- P149-D permission/ownership;
- P149-E idempotency/security;
- P149-F diagnostics/performance.

## Acceptance

- same command semantics work solo/listen;
- client cannot mint inventory/resources;
- invalid voxel/combat action rejected;
- relevance does not destroy simulation identity;
- replayed command safe where required;
- denials return reason;
- authority diagnostics available;
- final SHA/CI passes.

## Exit gate

Authoritative multiplayer foundation operational.

---

# P150 — ANOTHER FOOTSTEP

**Classification:** COOL-PULL / FOUNDATION  
**Player/creator payoff:** Players can join, leave and reconnect to an ongoing world without identity corruption.

## Purpose

Create Join / Leave / Reconnect Runtime.

## In scope

- compatibility handshake;
- player/character binding;
- join-in-progress snapshot;
- current knowledge/permissions;
- graceful leave;
- unexpected disconnect;
- reservation/task policy;
- vehicle/vessel control transfer;
- reconnect/resume;
- duplicate-session handling;
- retry/recovery.

## Core law

Reconnect restores the same identity.

## Acceptance

- join sees current world;
- reconnect preserves character/inventory/knowledge;
- disconnect cannot duplicate reserved goods;
- content mismatch gives actionable reason;
- duplicate sessions handled safely;
- representative latency/loss passes;
- final SHA/CI passes.

## Exit gate

Join/leave/reconnect operational.

---

# P151 — TWO PICKAXES

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** Multiple players can mine, place, craft, trade and use the same world safely.

## In scope

- voxel break/place/batches;
- pickups/drops;
- inventory/container races;
- crafting;
- machines;
- magic interactions;
- doors/signals;
- loot;
- direct trade;
- baseline combat;
- ownership/permissions;
- simultaneous conflict resolution.

## Core law

Server owns persistent outcomes.

## Acceptance

- simultaneous edits converge;
- duplicate pickup impossible;
- container race conserves quantities;
- trade commits atomically;
- protected objects deny correctly;
- stale interaction state fails safely;
- final SHA/CI passes.

## Rule-of-cool target

> **You can hand your mate the blocks and build the thing together.**

## Exit gate

Cooperative world interaction operational.

---

# P152 — MANY HANDS BUILD FASTER

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** Players can jointly found, supply, build, govern and defend settlements.

## In scope

- settlement membership/roles;
- shared project proposals;
- contribution records;
- warehouses/property;
- blueprint/project permissions;
- governance actions;
- shared defence;
- player-founded settlements;
- offline/disconnect contribution rules.

## Core law

Players use normal Project/Transaction/Permission systems; multiplayer does not bypass civilisation resource/labour truth.

## Acceptance

- multiple players contribute exact resources;
- no double-counting;
- role permissions work;
- NPC builders still use real labour/resources;
- disconnect contribution reconciles;
- shared settlement persists;
- final SHA/CI passes.

## Exit gate

Cooperative settlement play operational.

---

# P153 — THE WORLD DOESN'T PAUSE

**Classification:** FOUNDATION / INTEGRATION  
**Player/creator payoff:** The living simulation remains coherent when players are spread across different places and activities.

## Purpose

Create Multiplayer Living Simulation & Multi-Focus LOD.

## In scope

- multiple activity centres;
- union of active/relevant regions;
- streaming;
- NPC/creature activation;
- settlements/regions;
- automation;
- vessels;
- realms;
- events;
- quest scope;
- offline consequences;
- server time;
- sleep/time-skip policy.

## Core law

Simulation existence is not based only on the host camera.

## Acceptance

- players in separate areas receive coherent local state;
- distant automation remains correct;
- promotion/demotion preserves identity;
- separate-realm activity works within supported architecture;
- sleep/time policy cannot desync world;
- multi-focus performance passes;
- final SHA/CI passes.

## Exit gate

Living simulation supports multiple human centres.

---

# P154 — FORGE TOGETHER

**Classification:** FORGE-FIRST / COOL-PULL  
**Player/creator payoff:** Multiple authorised creators can collaborate on Forge content safely.

## In scope

- collaborator identity/roles;
- source ownership;
- lock/checkout or merge model;
- base revision/change set;
- conflict detection;
- review/comments;
- presence;
- permissions;
- shared Test Lab hook;
- package branches;
- revision history.

## Core law

No silent last-writer-wins source loss.

## Acceptance

- two creators work without overwrite;
- conflict requires explicit resolution;
- official/package permissions enforced;
- revisions attributable;
- disconnect preserves draft;
- Test Lab/package references exact revision;
- final SHA/CI passes.

## Exit gate

Collaborative Forge operational.

---

# P155 — THE SEALED GRIMOIRE

**Classification:** FOUNDATION / FORGE-FIRST  
**Player/creator payoff:** Mods/content packs can extend Leyforge without default arbitrary code execution.

## Purpose

Create Mod / Content-Pack Runtime & Safety Boundary.

## In scope

- manifest validation;
- IDs/versions/hashes;
- game/schema compatibility;
- dependencies/optional dependencies;
- load order/overrides;
- registry contributions;
- capability declarations;
- migration;
- localisation;
- limits;
- quarantine;
- enable/disable;
- world-required package tracking.

Governed data extension may include compatible blocks, items, recipes, structures, creatures, UI/2D products, quests/events, packs and world profiles.

## Explicit non-scope

Unrestricted native libraries, scripts, filesystem/network access or code plugins in normal community packages.

## Core law

Composability makes data packs powerful without granting OS-level execution.

## Acceptance

- valid package loads;
- malformed/unsafe package rejected;
- dependency failure explained;
- required version tracked;
- override provenance visible;
- disabling pack warns affected worlds;
- default format has no arbitrary executable path;
- final SHA/CI passes.

## Exit gate

Safe content-pack runtime operational.

---

# P156 — THE WORKSHOP GATES

**Classification:** COOL-PULL / EXPANSION  
**Player/creator payoff:** Players can export, import and share governed content with compatibility information.

## In scope

- local export/import;
- package preview;
- tags/creator label;
- captures;
- dependency viewer;
- compatibility report;
- install/update/remove;
- quarantine/hide;
- collections;
- version pinning;
- server-pack distribution.

External workshop/profile/rating services are optional adapters.

## Core law

The format remains provider-independent.

## Acceptance

- local package round-trip works;
- dependencies visible before enable;
- incompatible pack cannot silently mutate save;
- update/rollback/version pin works;
- server distribution hooks work;
- quarantine/report/hide hooks do not depend on one provider;
- final SHA/CI passes.

## Exit gate

Community sharing workflow operational.

---

# P157 — A REALM FOR EVERYONE

**Classification:** FOUNDATION / EXPANSION  
**Player/creator payoff:** Long-running Leyforge worlds can run as dedicated servers.

## Purpose

Create Dedicated Server & Realm Operations.

## In scope

Headless:

- world load/create;
- authoritative simulation;
- network service;
- content manifests;
- server config;
- persistence;
- backups;
- restart/shutdown;
- logs/metrics.

Administration:

- roles;
- moderation;
- permissions;
- allowlists/access;
- world operations;
- pack management;
- backup/restore;
- save health;
- audit log.

## Core law

The authoritative simulation must not depend on rendering/audio/local UI.

## Acceptance

- server runs headless;
- clients join/reconnect;
- restart preserves world;
- pack/version matching enforced;
- backup/restore works;
- admin mutation audited;
- long-run soak passes;
- final SHA/CI passes.

## Exit gate

Dedicated server operations viable.

---

# P158 — THE GREAT BUILD

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** A group can build one persistent civilisation together across sessions and server restarts.

## Purpose

Certify ARC XVII.

## Golden scenario

- authoritative listen/dedicated instance;
- supported certification player count;
- join-in-progress;
- disconnect/reconnect;
- co-op voxel editing;
- inventory/container race;
- settlement project;
- NPC simulation;
- automation/magic;
- trade;
- combat/raid;
- vessel/realm case where feasible;
- collaborative Forge/package workflow;
- required content pack;
- server restart;
- latency/loss;
- permission/moderation fixture.

## Core law

No bespoke `MultiplayerDemoMode`.

## Acceptance

1. certification player count joins;
2. identities survive reconnect;
3. edits/transactions conserve state;
4. settlement simulation is normal world simulation;
5. multi-focus LOD remains coherent;
6. collaborative Forge/content permissions work;
7. restart preserves world/content versions;
8. latency/loss fail gracefully;
9. moderation/permissions work;
10. performance passes;
11. human review confirms multiplayer feels like Leyforge;
12. final SHA/CI passes.

## Rule-of-cool target

> **A bunch of people build the same civilisation, and the world keeps being itself.**

## Exit gate — PG-17 MULTIPLAYER, COMMUNITY & SERVER FOUNDATION

PG-17 passes only when P149–P158 are COMPLETE.


---

# 03. ARC XVIII — TEMPERING LEYFORGE

# P159 — THE MEASURE OF THE WORLD

**Classification:** FOUNDATION  
**Player/creator payoff:** Developers can measure what Leyforge is actually doing before performance problems become release failures.

## Purpose

Create the Production Performance Observatory.

## In scope

Metrics/counters/traces for:

- CPU/GPU frame time;
- chunk generation/mesh/commit;
- streaming;
- memory;
- NPC/entity counts by LOD;
- navigation;
- automation graph work;
- transactions;
- events;
- saves;
- network traffic;
- server tick;
- UI updates;
- VFX/lights;
- Forge bake/validation;
- package load;
- realm transition;
- vessel simulation where relevant.

Capabilities:

- runtime overlay;
- packaged benchmark;
- trace capture;
- budget alarms;
- regression comparison;
- reference-save suite;
- hardware/profile metadata;
- CI/performance-lab hooks.

## Core law

Measured evidence outranks editor feel.

## Child slices

- P159-A metrics/counter registry;
- P159-B trace/budget system;
- P159-C packaged benchmark harness;
- P159-D representative save suite;
- P159-E regression reporting;
- P159-F Forge/server metrics.

## Acceptance

- representative subsystems expose counters;
- packaged benchmark reproduces baseline;
- regressions can fail a gate;
- hardware/profile/build identity recorded;
- long-session memory captured;
- multiplayer/server metrics supported;
- final SHA/CI passes.

## Exit gate

Performance Observatory operational.

---

# P160 — A WORLD FOR EVERY MACHINE

**Classification:** FOUNDATION / COOL-PULL  
**Player/creator payoff:** Leyforge scales down gracefully while preserving simulation meaning.

## Purpose

Create final Low-End Scalability & Optimisation profiles.

## In scope

Presentation levers:

- voxel/render distance;
- LOD;
- shadows;
- lighting;
- VFX;
- translucency;
- vegetation;
- water;
- animation density;
- visible logistics items;
- UI effects;
- render scale.

Simulation levers where semantically safe:

- active radius;
- update cadence;
- regional aggregation;
- catch-up budget;
- ecology detail;
- caravan visual detail;
- inactive-realm cadence;
- pathfinding budgets.

## Core law

Scalability may change representation, not casually change intended authoritative outcomes.

## Reference profiles

Final names/hardware remain evidence-driven, but production certifies at least minimum, balanced/recommended and high equivalents plus server/headless where useful.

## Acceptance

- minimum profile remains playable/readable on accepted reference hardware;
- conservation/equivalence checks match higher profiles;
- low-end mode preserves critical warnings;
- profile changes persist safely;
- long-session memory remains bounded;
- packaged benchmarks pass;
- final SHA/CI passes.

## Rule-of-cool target

> **The same world, not a dumber fake world, on weaker hardware.**

## Exit gate

Scalability certified.

---

# P161 — RULES BEFORE BIRTH

**Classification:** FORGE-FIRST / FOUNDATION  
**Player/creator payoff:** Players can define world rules clearly before a new realm is created.

## Purpose

Create final Create Realm / World Creation system.

## Simple creation path

- world name;
- random/entered seed;
- recommended preset;
- difficulty/consequence preset;
- multiplayer intent;
- accessibility profile;
- create.

## Advanced categories

### World generation

- seed;
- exposed world-size/region parameters;
- terrain/biome/ocean balance where allowed;
- structure/content density;
- realm/portal progression options where authorised.

### Simulation

- event frequency;
- civilisation activity;
- ecology;
- distant simulation;
- NPC consequence controls where permitted;
- time/world cadence.

### Survival/combat/consequence

- hunger/survival;
- combat threat;
- raid pressure;
- death consequence;
- destructive-event severity;
- PvP/friendly-fire where relevant.

### Multiplayer/server

- player target;
- access;
- permissions preset;
- pause/time policy;
- content pack set.

### Performance

Separate simulation/performance preset.

### Accessibility

Import profile/defaults.

## Core laws

- world-affecting settings persist in the world manifest;
- difficulty, performance and accessibility remain distinct;
- incompatible combinations produce clear warnings.

## Child slices

- P161-A world-config schema/versioning;
- P161-B simple creation;
- P161-C advanced generation/simulation;
- P161-D difficulty/multiplayer/content;
- P161-E validation/preview/seed summary;
- P161-F save/recreate/regression.

## Acceptance

- simple creation yields valid deterministic baseline;
- same seed+config reproduces governed generated baseline;
- saves diverge independently after creation;
- advanced options explain consequences;
- performance does not masquerade as difficulty;
- multiplayer/content compatibility validated;
- config stored/versioned;
- final SHA/CI passes.

## Exit gate

Create Realm production-ready.

---

# P162 — THE GATEHOUSE

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** Leyforge gains its final reliable front door for worlds, multiplayer, The Forge, community content, recovery and character setup.

## Purpose

Create final Main Menu, World Library, Realm Management & Player Character Setup.

## Product shell

Expected final forms of:

- Continue;
- My Realms / Worlds;
- New Realm;
- Multiplayer;
- Community Servers;
- The Forge;
- Mods / Content;
- Settings;
- Accessibility;
- Help / Codex where appropriate;
- Credits;
- Quit/exit where platform-relevant.

## World library

World cards expose where available:

- name;
- preview;
- age/date;
- playtime;
- last played;
- seed/config summary;
- game/save version;
- content packs;
- multiplayer capability;
- player character(s);
- save health;
- backup state;
- compatibility;
- warnings;
- repair/recovery options.

World operations may include:

- play;
- host;
- duplicate;
- rename;
- backup;
- restore;
- inspect;
- migrate;
- import/export where supported;
- archive;
- delete with confirmation.

## Player Character Identity & Customisation — gap closure

P162 explicitly owns player-facing character setup using Character Forge-produced canonical assets.

May include:

- character name;
- permitted ancestry/body families;
- body/face/hair/skin/fur presentation;
- voice/presentation set;
- pronoun/text identity fields where supported;
- cosmetics/clothing;
- accessibility-facing presentation;
- approved start/background choices where canon permits.

It must not:

- author a new ancestry definition;
- assign culture/faction from appearance;
- bypass starting-world rules.

## Core law

The front end never hides damaged/incompatible saves for cosmetic simplicity.

## Child slices

- P162-A product shell/navigation;
- P162-B world library;
- P162-C world operations/recovery links;
- P162-D player character setup;
- P162-E multiplayer/server/Forge/mod routing;
- P162-F controller/accessibility/performance.

## Acceptance

- all major product areas reachable;
- healthy/damaged/incompatible worlds visually distinct;
- character setup uses canonical Character Forge assets;
- appearance does not assign culture/faction;
- controller/keyboard/pointer navigation coherent;
- large text/reflow works;
- backup/recovery accessible without dev tools;
- final SHA/CI passes.

## Rule-of-cool target

> **Opening Leyforge finally feels like opening the finished game.**

## Exit gate

The Gatehouse operational.

---

# P163 — EVERY HAND, EVERY EYE

**Classification:** FOUNDATION / INTEGRATION  
**Player/creator payoff:** The complete game and Forge remain usable across broad visual, auditory, motor and cognitive needs.

## Purpose

Finalise Whole-Product Accessibility.

## In scope

- full remapping;
- controller/keyboard/pointer parity;
- hold/toggle alternatives;
- aim/timing assistance;
- text/UI scaling;
- reflow;
- contrast;
- non-colour cues;
- captions/subtitles;
- speaker identification;
- audio alternatives;
- reduced motion;
- reduced flashes;
- camera controls;
- screen shake;
- haptics;
- notification density;
- simplified input/interactions;
- cognitive guidance/tutorial options;
- content warnings where accepted;
- map/navigation alternatives;
- Forge diagnostics;
- multiplayer/pings/chat presentation;
- server/content UI.

## Core law

Accessibility assists interaction/presentation without silently changing authoritative world truth unless an explicit difficulty/consequence setting does so.

## Child slices

- P163-A input/motor;
- P163-B visual/text;
- P163-C audio/captions;
- P163-D motion/camera/cognitive;
- P163-E Forge/multiplayer/world creation;
- P163-F automated/manual certification.

## Acceptance

- presets and granular settings work;
- colour-coded critical systems have alternatives;
- required audio cues have visual/text alternatives;
- reduced motion/flash preserves information;
- large text does not truncate critical flows;
- Forge and multiplayer pass baseline;
- settings persist correctly;
- human review passes;
- final SHA/CI passes.

## Exit gate

Whole-product accessibility certified.

---

# P164 — A THOUSAND TONGUES

**Classification:** FOUNDATION / EXPANSION  
**Player/creator payoff:** The game, Forge and product shell can be translated without breaking layouts or identities.

## Purpose

Finalise Localisation Architecture & Production Coverage.

## In scope

- stable localisation keys;
- source-string pipeline;
- translator context;
- plurals/selects;
- glossary;
- proper-noun policy;
- variables;
- locale number/date formats;
- glyph coverage;
- fallback;
- UI reflow;
- captions/subtitles;
- Forge diagnostics;
- package localisation namespaces;
- missing-string diagnostics;
- pseudo-localisation;
- import/export;
- versioning.

## Core law

Source-language display text is not stable content identity.

## Child slices

- P164-A key/catalogue architecture;
- P164-B runtime formatting;
- P164-C UI/reflow/pseudo-localisation;
- P164-D subtitles/Forge/packages;
- P164-E glossary/QA;
- P164-F release-locale certification.

## Acceptance

- agreed target locale set processed separately;
- pseudo-localisation reveals layout issues;
- large text + long translation survives major screens;
- missing keys diagnosed;
- community keys namespaced;
- translation never changes stable IDs;
- fonts/glyphs validated;
- final SHA/CI passes.

## Exit gate

Localisation production-ready.

---

# P165 — THE CLEAR GLASS

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** The final UI tells the truth, explains failures and keeps complex systems understandable.

## Purpose

Create final UI/UX, Comprehension & Player-Trust pass.

## In scope

Whole-product audit for:

- authoritative state;
- knowledge visibility;
- reason codes;
- disabled/locked/unavailable distinction;
- loading/stale/offline state;
- confirmations;
- irreversible actions;
- notifications;
- focus/back/cancel;
- consistency;
- tooltips;
- comparison UI;
- map certainty;
- transaction feedback;
- save/update/content compatibility;
- errors/recovery;
- Forge lifecycle;
- multiplayer ownership/permissions.

## Core laws

- UI observes authoritative state;
- UI cannot pretend consequential success before authority confirms;
- failure explains cause;
- advanced complexity uses progressive disclosure.

## Child slices

- P165-A semantic-state audit;
- P165-B transaction/error/trust feedback;
- P165-C navigation/focus;
- P165-D map/knowledge audit;
- P165-E Forge/mod/server/recovery audit;
- P165-F usability/comprehension certification.

## Acceptance

- representative failure reasons are truthful;
- stale/loading/offline states distinct;
- destructive actions are safely confirmed;
- maps/Codex do not leak truth;
- all main input methods work;
- comprehension tests cover major loops;
- accessibility/localisation remain intact;
- final SHA/CI passes.

## Exit gate

Final UI/trust pass certified.

---

# P166 — NOTHING LOST

**Classification:** FOUNDATION / COOL-PULL  
**Player/creator payoff:** Long-lived worlds survive interruption, corruption and version changes.

## Purpose

Finalise Save Migration, Backups & Recovery.

## In scope

- world manifest;
- schema/version identity;
- atomic save;
- journal/snapshot policy;
- rotating/manual backups;
- integrity checks;
- migration chain;
- preview/dry run where useful;
- content compatibility;
- corrupt-primary recovery;
- restore;
- repair tools;
- missing/orphaned content handling;
- rollback;
- player-facing save health;
- server saves;
- multi-realm saves;
- Forge/package references.

## Core laws

- never overwrite the only known-good save during migration;
- migrations are versioned/tested;
- missing content is diagnosed, not silently replaced with mechanically different content;
- player history is preserved wherever safely possible.

## Child slices

- P166-A final save manifest/health;
- P166-B backup/atomicity;
- P166-C migration framework;
- P166-D corrupt/missing-content recovery;
- P166-E server/multi-realm/package cases;
- P166-F fault-injection certification.

## Acceptance

- forced interruption does not corrupt committed state;
- corrupt primary restores valid backup;
- representative old save migrates;
- failed migration leaves original safe;
- missing package/version is actionable;
- server/multi-realm recovery works;
- save health visible in Gatehouse;
- final SHA/CI passes.

## Rule-of-cool target

> **The world is worth more than the executable. Treat it that way.**

## Exit gate

Save compatibility/recovery certified.

---

# P167 — THE LIVING VERSION

**Classification:** FOUNDATION / INTEGRATION  
**Player/creator payoff:** Leyforge can evolve after release without casually breaking worlds, servers or community content.

## Purpose

Create Game Update, Patching, Versioning & Content Lifecycle.

## Version domains

- game/runtime;
- save schema;
- registry schema;
- core content;
- Forge schema/source;
- package/mod format;
- dedicated server;
- localisation;
- platform build.

## Update classes

- hotfix;
- patch;
- minor content/system update;
- major version;
- migration-required release.

## Lifecycle

```text
detect
→ preflight
→ compatibility/dependencies
→ backup
→ update/migrate
→ verify
→ recover/rollback if needed
```

Includes server/client compatibility, content-pack updates, deprecated/removed content and worldgen-version preservation.

## Core law

The executable is not the only version that matters.

## Child slices

- P167-A version compatibility matrix;
- P167-B preflight/backup;
- P167-C core content/Forge/package update;
- P167-D server/client compatibility;
- P167-E deprecation/removal/worldgen version;
- P167-F rollback/release certification.

## Acceptance

- representative old world updates safely;
- incompatible server/client gives clear result;
- package dependencies remain inspectable;
- removed content has migration/fallback policy;
- existing worldgen baseline preserved;
- failed update recovers;
- final SHA/CI passes.

## Exit gate

Update lifecycle operational.

---

# P168 — THE WATCHFUL LANTERN

**Classification:** FOUNDATION  
**Player/creator payoff:** Problems can be diagnosed and supported without exposing unnecessary private data.

## Purpose

Create Release Diagnostics, Security & Support Tools.

## In scope

Diagnostics:

- build/version;
- hardware/render profile;
- subsystem health;
- save health;
- content manifests;
- performance summary;
- crash/error IDs;
- structured logs;
- network/server summary;
- migration/update state.

Support bundle:

- content preview;
- redaction;
- explicit user action/consent before sharing/upload;
- local export;
- reproducible issue ID.

Security:

- trust boundaries;
- input/package validation;
- path/file safety;
- network command validation;
- permissions;
- secret handling;
- release debug stripping;
- dependency review;
- malformed save/package resilience;
- bounded abuse/DoS controls where appropriate.

Recovery UX:

- safe mode;
- disable community content;
- restore backup;
- rebuild cache;
- validate world;
- collect diagnostics.

## Core law

Diagnostics collect what support needs, not everything available.

## Child slices

- P168-A structured diagnostics;
- P168-B support bundle/redaction;
- P168-C security boundary audit;
- P168-D safe mode/content disable;
- P168-E crash/recovery/support UX;
- P168-F fuzz/fault/security testing.

## Acceptance

- support bundle inspectable before sharing;
- no unnecessary free-form/private-path data by default;
- malformed package/save fails safely;
- invalid network actions rejected;
- shipping build lacks unrestricted dev powers;
- safe mode can disable community content;
- final SHA/CI passes.

## Exit gate

Diagnostics/security/support certified.

---

# P169 — THE SHIPPING FORGE

**Classification:** FOUNDATION / INTEGRATION  
**Player/creator payoff:** Leyforge and The Forge can be built, packaged and distributed as real production products.

## Purpose

Create Platform, Distribution & Production Release pipeline.

## In scope

- development/test/shipping build separation;
- content/package assembly;
- symbol/debug separation;
- signing/notarisation where required;
- storefront metadata hooks;
- achievements/platform-service adapters;
- invite/friend adapters where used;
- cloud-save integration only if accepted;
- dedicated-server distribution;
- version/build identity;
- installer/update package;
- licences/notices;
- crash-symbol pipeline;
- release branch/tag;
- release-candidate promotion;
- reproducible metadata;
- rollback/hotfix path.

## Platform scope

Windows PC remains the intended first production priority unless later authority changes.

Other platforms require evidence and explicit release scope.

## Core law

Store/platform services wrap project-owned saves/content/authority.

## Child slices

- P169-A build matrix;
- P169-B packaging/signing;
- P169-C storefront/platform adapters;
- P169-D dedicated server distribution;
- P169-E licences/support metadata;
- P169-F release-candidate automation.

## Acceptance

- clean shipping build produced;
- build identity traceable;
- unsafe dev tooling excluded;
- server build distributable;
- required licences/notices included;
- install/update/uninstall tested;
- platform adapter failure cannot corrupt saves;
- release candidate auditable/reproducible enough for support;
- final SHA/CI passes.

## Exit gate

Shipping pipeline operational.

---

# P170 — TEMPERED LEY

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** The complete non-AI game and Forge pass whole-product certification as a coherent shippable foundation.

## Purpose

Certify ARC XVIII and the complete non-AI product before optional AI is introduced.

## Certification matrix

### Core world

- voxel edit;
- survival;
- inventory;
- crafting;
- construction;
- persistence.

### The Forge

- create/edit/validate/test/package/install representative content;
- AI disabled.

### Civilisation

- NPC identity;
- household;
- settlement;
- profession;
- warehouse;
- autonomous project;
- economy/trade;
- faction/government.

### Automation and magic

- machines;
- logistics;
- signals;
- Flux;
- magical infrastructure;
- representative ritual/alchemy chain.

### Exploration

- worldgen;
- biomes;
- caves;
- sites/dungeons;
- maps/knowledge;
- routes.

### Maritime

- water;
- port;
- vessel;
- crew;
- voyage;
- underwater exploration;
- naval encounter.

### Realms

- portal;
- representative realm crossing;
- multi-world save;
- cross-realm resource/trade.

### Knowledge/history

- quest/event;
- memory;
- rumour;
- archive;
- Chronicle.

### Multiplayer/community

- join/reconnect;
- co-op build;
- settlement collaboration;
- content matching;
- dedicated server.

### Release hardening

- low-end profile;
- accessibility;
- localisation;
- world creation;
- player character setup;
- Gatehouse;
- migration/recovery;
- update;
- diagnostics;
- shipping build.

## Mandatory non-AI law

The certification run must prove:

> **Leyforge works without AI.**  
> **The Forge works without AI.**

No test may require generative dialogue, generative planning, natural-language Forge, cloud models or AI world mode.

## Mature-world requirement

Use representative mature saves with substantial edits, NPC history, settlements, machines, realms, packages, multiplayer records, migrations and Chronicle history.

Fresh tutorial-scale saves are insufficient as the sole certification evidence.

## Fault matrix

Include controlled tests for:

- forced close/crash;
- damaged save;
- missing package;
- incompatible package;
- failed update;
- network loss;
- reconnect;
- server restart;
- failed write/low disk where safely testable;
- low-end profile;
- reduced-motion/accessibility;
- missing localisation key;
- unavailable realm package;
- stale Forge bake/cache;
- invalid community package.

## Child slices

- P170-A certification matrix/environment;
- P170-B whole-game functional run;
- P170-C Forge/package run;
- P170-D multiplayer/server/community run;
- P170-E save/update/recovery/fault run;
- P170-F performance/accessibility/localisation;
- P170-G human usability/comprehension;
- P170-H PG-18 reconciliation.

## Acceptance

1. representative game loops pass shipping-like build;
2. mature saves load/migrate/recover;
3. low-end profile preserves semantic truth;
4. accessibility/localisation pass whole-product review;
5. multiplayer/server flows pass;
6. community packages remain safe/explainable;
7. Forge works without AI;
8. seven-world persistence remains intact;
9. diagnostics/support work;
10. update/recovery paths pass;
11. shipping pipeline produces governed build;
12. no blocker-level data-loss, authority, security or accessibility defect remains open;
13. human review confirms product coherence;
14. AI is disabled/unavailable throughout certification;
15. final SHA/CI/release-candidate evidence passes.

## Rule-of-cool target

> **Leyforge has been tempered.**

## Exit gate — PG-18 NON-AI RELEASE-CANDIDATE FOUNDATION

PG-18 passes only when P159–P170 are COMPLETE and the product stands on its own before ARC XIX.

## Downstream unlock

ARC XIX — THE MIND IN THE MACHINE.

---

# 04. PG-17 — Multiplayer, Community & Server Foundation Summary

| Capability | Parent |
| --- | --- |
| Multiplayer Authority Runtime | P149 |
| Join / Leave / Reconnect | P150 |
| Cooperative World Interaction | P151 |
| Cooperative Settlement Play | P152 |
| Multiplayer Living Simulation | P153 |
| Collaborative Forge | P154 |
| Safe Mod / Content-Pack Runtime | P155 |
| Community Content / Sharing | P156 |
| Dedicated Servers / Realm Operations | P157 |
| Multiplayer Integration | P158 |

Minimum end-to-end:

```text
start authoritative world
→ players join
→ co-edit voxels
→ share inventories/projects
→ build settlement
→ world simulates across multiple locations
→ collaborate in permitted Forge/package scope
→ server enforces content manifests
→ disconnect/reconnect
→ save/restart server
→ rejoin same world
```

---

# 05. PG-18 — Non-AI Release-Candidate Foundation Summary

| Capability | Parent |
| --- | --- |
| Performance Observatory | P159 |
| Low-End / Scalability Hardening | P160 |
| Create Realm / World Creation | P161 |
| Main Menu / World Management / Character Setup | P162 |
| Whole-Product Accessibility | P163 |
| Localisation | P164 |
| Final UI / Player Trust | P165 |
| Save Migration / Backup / Recovery | P166 |
| Update / Patch / Version Lifecycle | P167 |
| Diagnostics / Security / Support | P168 |
| Platform / Distribution | P169 |
| Tempered Ley Certification | P170 |

Minimum end-to-end:

```text
shipping-like build
→ create configured world
→ create/select player character
→ play representative full systems
→ use Forge without AI
→ multiplayer/dedicated server
→ install governed content package
→ low-end/accessibility/localisation
→ long save
→ migrate/update/recover
→ diagnostics
→ produce release candidate
```

---

# 06. Recommended Production Concurrency

## P149/P150

Authority runtime and connection/reconnect architecture should develop together.

Do not broadly network gameplay before stable identity/command/reconnect contracts exist.

## P151/P152/P153

Co-op interactions, settlements and multi-focus simulation may overlap after authority semantics stabilise.

P153 must consume the existing simulation-LOD architecture.

## P154–P157

Collaborative Forge, community content and server operations can overlap around stable package/version/permission contracts.

P157 should understand content manifests before its operations model freezes.

## P159/P160

Observability precedes final optimisation claims.

## P161/P162

Create Realm and The Gatehouse should co-design world cards, configuration and player entry flows.

## P163/P164/P165

Accessibility, localisation and final UX are parallel certification tracks.

## P166/P167/P168

Save recovery, update lifecycle and diagnostics must integrate because failed updates are a major recovery scenario.

## P169

Distribution plumbing may start early; release certification waits for the prior gates.

---

# 07. Explicit Anti-Scope

## Multiplayer

Reject:

- client-owned persistent inventories;
- client-owned final voxel edits;
- duplicate multiplayer gameplay systems;
- automatically global quest/dialogue state;
- replication distance treated as simulation existence;
- unproven host-migration promises.

## Community content

Reject:

- unrestricted executable mods by default;
- unknown code execution;
- silent package substitution;
- deleting save-required versions;
- provider lock-in as format authority.

## Release

Reject:

- editor FPS as shipping evidence;
- low-end mode casually changing outcomes;
- accessibility/localisation postponed post-launch;
- migration without backup;
- update overwriting sole compatible package;
- hidden support uploads;
- unsafe developer powers in shipping;
- storefront/cloud provider as sole save owner.

---

# 08. Cross-Arc Architectural Locks

## 08.1 Multiplayer is an authority/transport layer over normal game rules

This prevents solo/network divergence.

## 08.2 Multi-focus simulation reuses LOD

Several player activity centres do not justify a second simulation architecture.

## 08.3 Collaborative Forge shares revision governance

Collaboration adds identity, permissions and conflict handling around the same Forge source.

## 08.4 Content packs are powerful because Leyforge is data-driven

Stable schemas, IDs, validators and composition reduce the need for unrestricted code.

## 08.5 Dedicated servers certify simulation independence from presentation

If world truth cannot run headless, presentation leaked into authority.

## 08.6 Performance truth becomes a release artifact

Benchmarks and mature reference saves become evidence.

## 08.7 Low-end profiles preserve semantic truth

A weaker machine may see less, but does not inhabit a fake economy.

## 08.8 Create Realm separates independent choice categories

Worldgen, gameplay difficulty, simulation intensity, performance and accessibility remain separate.

## 08.9 Player character customisation now has a production owner

P162 closes this roadmap gap without renumbering P IDs.

## 08.10 Save/update/support form one lifecycle

```text
save
→ update
→ migrate
→ diagnose
→ recover
```

## 08.11 P170 protects optional AI

ARC XIX cannot become mandatory infrastructure.

---

# 09. Persistent Regression Fixtures

Retain:

- P149 authority/two-client fixture;
- P150 reconnect fixture;
- P151 voxel/inventory race suite;
- P152 co-op settlement world;
- P153 multi-focus LOD world;
- P154 collaborative Forge conflict fixture;
- P155 malformed/unsafe package corpus;
- P156 import/export/version-pin set;
- P157 dedicated long-run server;
- P158 Great Build multiplayer world;
- P159 performance reference saves;
- P160 profile equivalence suite;
- P161 deterministic world-config matrix;
- P162 Gatehouse/world-library/character setup fixture;
- P163 accessibility certification suite;
- P164 pseudo-localisation/layout suite;
- P165 trust/reason UX suite;
- P166 migration/corruption/backup corpus;
- P167 update/rollback matrix;
- P168 diagnostics/security/fault fixtures;
- P169 shipping/install/update set;
- P170 mature non-AI release-candidate suite.

P158, P166 and P170 are top-tier long-term regressions.

---

# 10. ProductionRegistry Seed Entries

```text
P149 — The Shared Truth
P150 — Another Footstep
P151 — Two Pickaxes
P152 — Many Hands Build Faster
P153 — The World Doesn't Pause
P154 — Forge Together
P155 — The Sealed Grimoire
P156 — The Workshop Gates
P157 — A Realm for Everyone
P158 — The Great Build
P159 — The Measure of the World
P160 — A World for Every Machine
P161 — Rules Before Birth
P162 — The Gatehouse
P163 — Every Hand, Every Eye
P164 — A Thousand Tongues
P165 — The Clear Glass
P166 — Nothing Lost
P167 — The Living Version
P168 — The Watchful Lantern
P169 — The Shipping Forge
P170 — Tempered Ley
```

No ProductionRegistry status becomes READY merely because PROD-15 exists.

---

# 11. Open Decisions Deliberately Deferred to Evidence

PROD-15 does not silently decide:

- exact network transport/provider;
- exact online account/provider;
- NAT/invite stack;
- final certified online player count;
- host migration;
- replication protocol;
- server tick rate;
- dedicated hosting business model;
- community workshop/provider;
- whether constrained public scripting is ever added;
- minimum/recommended hardware;
- final profile names;
- exact world-creation values/defaults;
- release locale roster;
- cloud-save provider;
- crash-report provider;
- storefront list;
- console/Linux/Steam Deck commitments;
- patch/delta technology.

These remain evidence, provider, platform or business decisions.

---

# 12. PROD-15 Acceptance Gate

PROD-15 is ready for owner lock when the owner agrees that:

- [ ] P149–P170 retain PROD-02 names/order;
- [ ] multiplayer uses one authoritative world simulation;
- [ ] clients request validated mutation instead of owning persistent truth;
- [ ] join/reconnect preserve player/character identity;
- [ ] relevance is separate from simulation existence;
- [ ] voxel/inventory/trade races conserve resources;
- [ ] co-op settlements use normal Project/Permission/Transaction systems;
- [ ] multiplayer knowledge/quest/dialogue scope is explicit;
- [ ] multi-focus simulation reuses normal LOD;
- [ ] collaborative Forge prevents silent overwrite;
- [ ] developer and community Forge authority remain separate;
- [ ] default community packages are data-first/script-free;
- [ ] manifests/dependencies/version safety are mandatory;
- [ ] dedicated server runs headless;
- [ ] admin actions are explicit/audited;
- [ ] release performance uses packaged builds;
- [ ] low-end scalability preserves semantic truth;
- [ ] Create Realm separates worldgen, difficulty, simulation, performance and accessibility;
- [ ] P162 owns player character setup/customisation;
- [ ] appearance does not define culture/faction/morality;
- [ ] world library exposes save/content compatibility/recovery;
- [ ] accessibility certifies whole game and Forge;
- [ ] localisation uses stable keys/reflow;
- [ ] final UI reports authoritative reasons;
- [ ] saves are treated as long-term player assets;
- [ ] migration never destroys the only known-good copy;
- [ ] updates reconcile runtime/save/content/Forge/server versions;
- [ ] world-required content is retained/migrated safely;
- [ ] diagnostics are privacy-conscious and inspectable;
- [ ] shipping builds remove unsafe developer authority;
- [ ] platform services remain adapters;
- [ ] P170 certifies the complete game and Forge with AI unavailable.

---

# 13. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-15 — LEYFORGE ARCS XVII–XVIII PRODUCTION CONTRACTS — v0.1**
>
> ARC XVII extends Leyforge into multiplayer without creating duplicate gameplay truth. Solo, listen-server and dedicated-server play use one authoritative simulation and the same validated gameplay commands. Join-in-progress and reconnect preserve persistent identities; voxel edits, inventory, settlement projects, combat and trade remain authoritative and resource-conserving; multi-focus simulation extends existing LOD rather than replacing it; and collaborative Forge adds governed source collaboration around the same production platform. Player/community content remains manifest-driven, dependency-aware and script-free by default, while dedicated servers run the domain simulation headlessly with explicit administration, content and recovery controls. ARC XVIII hardens the complete non-AI product for shipping. Performance becomes continuously observable in packaged builds; scalability reduces cost without casually changing semantic outcomes; Create Realm separates worldgen, difficulty, simulation, performance and accessibility; The Gatehouse owns final front-end/world management and closes the player-character customisation gap; accessibility, localisation and UI trust are certified across the whole game and Forge; saves, migrations, backups, updates and recovery form one long-lived world lifecycle; diagnostics and community content respect security/privacy boundaries; and the shipping pipeline produces governed release builds. P170 — Tempered Ley — must certify the complete game and The Forge with AI disabled or unavailable before ARC XIX may begin.

---

# 14. Principal Source Basis

PROD-15 is derived primarily from the current Leyforge corpus covering:

- authoritative multiplayer/world technical architecture;
- UI/UX and multiplayer extension requirements;
- player blueprint/content-pack safety and versioning;
- ART-08 product-shell, world-library, accessibility and localisation rules;
- post-30 roadmap intent for multiplayer, settings, front end, modding, servers, updates, diagnostics, final UX and distribution;
- POC/manual regression evidence for save recovery, performance profiles, controller/accessibility state and multi-world save behaviour;
- current PROD-00 through PROD-14 authority.

Historical engine-specific recommendations remain evidence only where superseded by current production authority.

---

# 15. Next Document

After PROD-15 acceptance/reconciliation, continue to:

> **PROD-16 — Arcs XIX–XX Production Contracts: P171–P192**

That final roadmap volume will cover:

### ARC XIX — THE MIND IN THE MACHINE

- AI Constitution & Authority Boundary;
- natural-language Forge intent;
- AI-assisted Forge creation;
- Forge AI assistant/troubleshooter;
- optional player companion intelligence;
- bounded NPC/settlement intelligence;
- optional World Mind;
- experimental AI world/simulation mode;
- AI certification and AI-off fallback.

### ARC XX — THE FIRST FLAME

- Tutorial World Contract;
- final handcrafted Tutorial World built through the complete Forge;
- survival/building journey;
- settlement journey;
- automation journey;
- magic journey;
- exploration/combat/discovery;
- maritime showcase;
- realm showcase;
- hidden secrets/easter eggs;
- multiplayer tutorial certification;
- graduation into continued sandbox play;
- P192 — **THE FIRST FLAME** — final production milestone.

---

**End of PROD-15 v0.1 — Arcs XVII–XVIII Production Contracts Candidate**
