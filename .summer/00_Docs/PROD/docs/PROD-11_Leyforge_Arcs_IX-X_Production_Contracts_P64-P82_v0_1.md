# LEYFORGE PRODUCTION PROGRAMME

## PROD-11 — Arcs IX–X Production Contracts: P64–P82

**Document ID:** PROD-11  
**Title:** Leyforge Arcs IX–X Production Contracts — When the Ley Awakens / Beyond the Horizon  
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
**Previous executable volumes:** PROD-07, PROD-08, PROD-09, PROD-10  
**Arc scope:** ARC IX — WHEN THE LEY AWAKENS / ARC X — BEYOND THE HORIZON  
**Parent slices:** P64–P82  
**Programme gates:** PG-09 Magic & Magitech Foundation, PG-10 World & Exploration Foundation  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge implementation, PROD-12 onward

---

# 00. Executive Arc Statement

PROD-11 expands Leyforge in two directions.

ARC IX makes the fantasy layer systemic.

ARC X makes the world large, varied and discoverable enough to support the adventure layer.

The central promise of ARC IX is:

> **Magic is not a detached spell menu. It is a world-facing resource, language, infrastructure and production system that can interact with players, settlements, machines, rituals and later realms.**

The central promise of ARC X is:

> **The Overworld is not one terrain generator with decorations. It is a deterministic authored world system made from regions, biomes, ecology, weather, caves, structures, dungeons and knowledge-driven exploration.**

The combined production progression is:

```text
FLUXION FOUNDATION
→ RUNES
→ SPELLS
→ PLAYER CASTING
→ MAGICAL INFRASTRUCTURE
→ ALCHEMY
→ RITUALS
→ MAGIC + AUTOMATION
→ IMPOSSIBLE MUSICAL MACHINE
→ REGIONAL WORLDGEN
→ WORLD FORGE
→ BIOME FORGE
→ FLORA / ECOLOGY
→ WEATHER / SEASONS
→ CAVE PROVINCES / DEEP OVERWORLD
→ RUINS / WORLD STRUCTURES
→ DUNGEON FORGE
→ CARTOGRAPHY / DISCOVERY
→ FIRST EXPEDITION
```

By the end of P72, Leyforge must support the fantasy of the **mage-engineer**.

By the end of P82, Leyforge must support the fantasy of the **explorer**.

---

# 01. Governing Production Rules for P64–P82

## 01.1 Production terminology: Fluxion / Flux

The production magic-energy term is **Fluxion**, normally shortened to **Flux**.

Legacy material may use:

- mana;
- mana crystal;
- mana network;
- mana furnace;
- mana conduit.

Those legacy terms remain source/migration evidence where historically authoritative, but new production implementation should resolve them against current canonical Flux/Fluxion naming rather than creating duplicate parallel energy systems.

A current canon source may deliberately retain a historical display name where required.

Stable identity migration must be explicit.

## 01.2 Physical magical resources remain real resources

Flux-bearing materials, catalysts, runes and ritual inputs remain:

- registered content;
- inventory/warehouse stock;
- transactional;
- persistent;
- tradable/ownable where allowed.

Placing a glowing prop does not create Flux capacity.

## 01.3 Magic does not replace industry at scale

Magic can:

- specialise;
- accelerate;
- protect;
- transform;
- automate;
- enable impossible functions.

Ordinary machines remain meaningful for bulk production.

The intended progression remains:

```text
manual
→ mechanical
→ industrial
→ magical support
→ hybrid magitech
```

rather than:

```text
discover magic
→ all previous systems obsolete
```

## 01.4 No core universal corruption meter

Forbidden/unstable magic may cause:

- local hazards;
- world-state changes;
- faction reaction;
- fear;
- reputation;
- contamination;
- damage;
- ritual failure;
- creature/event attraction.

PROD-11 does not introduce a mandatory universal player corruption bar unless current canon explicitly changes that rule.

## 01.5 Rune logic is bounded

Runes can encode/modify approved magical semantics.

They are not arbitrary scripts.

A rune may define:

- element/domain;
- target modifier;
- trigger;
- shaping;
- efficiency;
- condition;
- conduit/network role.

It may not execute unrestricted code.

## 01.6 Spell authoring orchestrates shared services

Spell Forge should compose:

- targeting;
- cost;
- cast phases;
- animation;
- VFX;
- lighting;
- audio;
- gameplay effect modules;
- knowledge/unlock;
- status/world interaction.

It does not duplicate Animation/VFX/Lighting/Sound Forge.

## 01.7 Progression/knowledge is a shared service

Magic unlocks may depend on:

- discovery;
- NPC teaching;
- book/knowledge;
- research;
- progression;
- faction/realm access.

P65/P66 must consume a shared unlock/knowledge contract.

If a dedicated Progression Forge surface is required, it is introduced as governed shared Forge child scope rather than a new parent P-number.

## 01.8 Player casting never trusts presentation

The animation reaching a frame does not itself create a fireball.

The authoritative cast state owns:

- request;
- cost;
- validity;
- target;
- effect;
- result.

Presentation reflects the cast.

## 01.9 Magical infrastructure uses typed networks

Flux networks use the universal Connection/Port contract from PROD-05/P57.

They can share graph infrastructure with other networks.

They retain Flux-specific:

- source;
- storage;
- capacity;
- purity/stability where canon requires;
- consumption;
- loss;
- overload/failure.

## 01.10 Rituals are physical compositions

Rituals require real:

- geometry;
- anchors;
- participants;
- catalysts;
- world conditions;
- permissions;
- Flux;
- timing.

A ritual menu button may not bypass the physical setup.

## 01.11 Golemancy is routed through existing systems

The magic canon includes golemancy.

PROD-11 does not create a separate `GolemSimulation`.

Where a bounded golem proof is introduced under P71, it composes:

- entity;
- body/rig;
- task/profession;
- ownership/permission;
- Flux infrastructure;
- command/signal interfaces.

Full golem family expansion can occur later through content/Forge expansion.

## 01.12 Worldgen is seed-deterministic where required

The world master seed produces named sub-seeds for independent domains such as:

- terrain;
- climate;
- caves;
- resources;
- structures;
- ecology;
- weather;
- magical features;
- civilisation;
- names.

Changing one domain should not silently reroll every unrelated domain.

The seed-derivation algorithm/version is persistent world identity.

## 01.13 Generation order must not become hidden content authority

Where deterministic generation is required, equivalent world results should not depend on:

- chunk request order;
- worker scheduling;
- camera direction;
- frame timing.

Local presentation order may differ.

Canonical generated outcomes may not.

## 01.14 World Forge authors generation systems, not one-off final worlds

World Forge creates:

- regional rules;
- generation profiles;
- distributions;
- constraints;
- palettes;
- feature graphs;
- validation;
- seed previews.

The production Overworld remains seed-generated.

## 01.15 Biome is an ecological/world contract

A biome is not merely:

> terrain colour + tree type.

It may define:

- climate;
- terrain family;
- geology;
- materials;
- flora;
- fauna suitability;
- hazards;
- weather bias;
- resources;
- structures;
- culture suitability;
- magical conditions;
- transitions.

## 01.16 Ecology is not decoration density

Flora/fauna placement must respect:

- environment;
- lifecycle;
- carrying capacity/suitability;
- disturbance;
- harvest;
- regeneration;
- player/NPC pressure where simulated.

P76 also provides the first bounded **agriculture/husbandry foundation** so domesticated ecology does not remain an architectural hole.

## 01.17 Weather gameplay and weather presentation are separate

Weather truth owns:

- precipitation;
- wind;
- temperature/exposure modifiers;
- visibility;
- hazards;
- season state.

VFX/audio/lighting communicate it.

Turning effects down may not remove the gameplay fact.

## 01.18 The Deep Overworld is finite and authored

P78 follows current FCC direction:

- cave provinces;
- Deep Routes;
- finite Deep Overworld.

It is not an infinite second dimension hidden under the terrain.

## 01.19 World structures use normal Structure source

P79 places/restores/ages authored Structure Forge products.

It does not introduce a parallel structure-format just because a ruin is world-generated.

## 01.20 Dungeons compose systems

Dungeon Forge composes:

- structure modules;
- topology;
- encounters;
- locks/keys;
- traps/signals;
- loot;
- boss/authority hooks;
- history;
- hazards;
- validation.

It does not become unrestricted scripting.

## 01.21 Engine knowledge is not player knowledge

P81 is governed by the Knowledge primitive and MAP-00.

The engine may know:

> ruin exists at X.

The player/map does not know that until authorised knowledge is obtained through:

- observation;
- exploration;
- surveying;
- map copying;
- dialogue;
- records;
- magical evidence;
- quest evidence;
- signage;
- cultural knowledge.

## 01.22 Unknown space remains unknown

No production map should silently become a fully revealed omniscient satellite map.

---

# 02. Common Evidence Rules for This Volume

ARC IX requires strong evidence around:

- Flux conservation;
- cost/casting authority;
- rune validation;
- infrastructure topology;
- ritual physicality;
- magic/automation interoperability;
- optional/forbidden-risk failure;
- accessibility of magical presentation;
- progression/knowledge gates.

ARC X requires strong evidence around:

- seed determinism;
- generation-order independence where required;
- worldgen validation;
- biome transitions;
- ecology lifecycle;
- weather truth vs presentation;
- cave connectivity;
- structure/dungeon placement;
- map knowledge provenance;
- first-expedition end-to-end continuity.

---

# 03. ARC IX — WHEN THE LEY AWAKENS

---

# P64 — THE LEY REVEALED

**Classification:** FOUNDATION  
**Arc:** ARC IX — WHEN THE LEY AWAKENS  
**Player/creator payoff:** Flux stops being a mysterious glowing crystal and becomes a real magical resource the world can store, spend, route and reason about.

## P64.1 Purpose

Establish the authoritative Fluxion foundation.

P64 answers:

> **What is magical energy in Leyforge, where does it come from, who owns it, and how is it conserved?**

## P64.2 Authoritative source packet

Primary:

- current Magic System canon;
- Resource Progression;
- Player Progression magic direction;
- 20E magic/infrastructure integration;
- P11 Flux crystal teaser;
- PROD-05 Transaction/Connection/Capability;
- P57 typed ports;
- current registry identity authority.

## P64.3 Entry gate

- PG-08 COMPLETE;
- P11 Flux crystal identity reconciled with current canonical naming;
- transactional resource/infrastructure services stable.

## P64.4 Dependencies

### Hard

P11, P53, P57, P63.

### Forge

Material/Item/Machine shared services.

### Runtime

Inventory, Transaction, Network foundations.

## P64.5 Universal primitives used

- Identity;
- State;
- Capability;
- Ownership;
- Transaction;
- Connection/Port;
- Result/Reason;
- Knowledge hook.

## P64.6 In scope

Flux foundation:

- Flux resource identity;
- Flux-bearing material/resource chain;
- personal Flux pool/capacity hook for P67;
- external Flux source;
- Flux storage/buffer;
- Flux transaction;
- Flux consumption;
- charge state;
- Flux port/domain type;
- network source/load semantics;
- stability/purity/quality hooks where canon requires;
- overload/depletion result;
- diagnostics;
- save/reload;
- legacy mana-name/ID migration resolution.

## P64.7 Explicit non-scope

- spells;
- runes;
- wards;
- full conduits;
- rituals;
- portals;
- leylines;
- corruption system;
- realm magic.

## P64.8 Implementation capability requirements

Flux must not be stored as:

- visual glow intensity;
- animation time;
- arbitrary local script variable owned by presentation.

It is authoritative resource/state.

## P64.9 Forge requirements

Shared content source can declare:

- Flux-bearing;
- capacity;
- compatible domain/port;
- magical material presentation hooks.

## P64.10 Runtime requirements

Flux transfers use Transaction/Connection infrastructure.

## P64.11 Canonical content subset

Minimum:

- raw Flux-bearing crystal;
- refined shard/dust or current canonical refined form;
- simple Flux buffer/battery fixture.

## P64.12 Persistence implications

Flux quantities/capacity/network storage persist exactly.

## P64.13 Multiplayer / authority implications

Flux spend/transfer future server-authoritative.

## P64.14 Simulation-LOD implications

Stored Flux remains authoritative at all LOD.

## P64.15 Accessibility / localisation implications

Charge/state cannot rely on colour/glow alone.

## P64.16 Performance implications

Flux graph update must be bounded.

## P64.17 Security / trust implications

Retry/spend cannot duplicate Flux.

## P64.18 Recommended child decomposition

- P64-A — canonical Flux identity/migration;
- P64-B — Flux resource/storage contract;
- P64-C — Flux transaction;
- P64-D — Flux connection domain;
- P64-E — diagnostics/persistence;
- P64-F — reconciliation.

## P64.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P64-AC01 | Current Flux/Fluxion identities are explicit and legacy mana references are governed | EV-A | Required |
| P64-AC02 | Flux transfer conserves exact quantity | EV-B | Required |
| P64-AC03 | Flux buffer survives save/reload | EV-D | Required |
| P64-AC04 | Flux port uses universal Connection/Port contract | EV-B | Required |
| P64-AC05 | Presentation charge indicator does not own stored Flux | EV-B / review | Required |
| P64-AC06 | Duplicate/replayed spend cannot duplicate resource | EV-B negative | Required |
| P64-AC07 | Flux network update remains bounded | EV-E | Required |
| P64-AC08 | Final SHA/CI passes | EV-H | Required |

## P64.20 Negative tests

- insufficient Flux;
- over-capacity transfer;
- wrong-domain connection;
- stale transaction;
- buffer destroyed/disconnected;
- save during transfer.

## P64.21 Manual acceptance scenario

Refine/obtain Flux-bearing resource.

Charge a test buffer.

Inspect exact quantity.

Disconnect/use some charge.

Save/reload.

Confirm exact state.

## P64.22 Rule-of-cool target

The magical crystal discovered at P11 finally becomes:

> **power you can actually do something with.**

## P64.23 Exit gate

Flux exists as authoritative resource/network domain.

## P64.24 Downstream unlock

P65–P71.

## P64.25 Known risks / ADR triggers

- personal-vs-network Flux identity;
- purity/stability semantics;
- energy-unit representation.

---

# P65 — SIGNS OF POWER

**Classification:** FORGE-FIRST  
**Arc:** ARC IX  
**Player/creator payoff:** Runes become authorable magical building blocks that can modify spells, machines and infrastructure.

## P65.1 Purpose

Create Rune Forge v1 and the bounded rune semantic model.

## P65.2 Authoritative source packet

- current Magic System rune canon;
- Resource/Recipe registries;
- P61 bounded logic philosophy;
- P64 Flux;
- PROD-04 specialist Forge architecture;
- ART-02/06 magical presentation.

## P65.3 Entry gate

- P64 COMPLETE;
- stable magical resource identity.

## P65.4 Dependencies

P64 plus shared Forge services.

## P65.5 Universal primitives used

- Identity;
- Capability;
- State;
- Signal hook;
- Connection/Port;
- Composition;
- Provenance;
- Result/Reason.

## P65.6 In scope

Rune definition/source:

- rune identity;
- magic school/domain;
- compatible hosts;
- effect/modifier role;
- trigger role;
- target-shaping role;
- Flux cost/modifier hook;
- condition;
- stability/risk hook;
- network/machine role;
- inscription form;
- material requirements;
- slot/socket compatibility;
- visual/audio references;
- unlock/knowledge reference;
- validation.

Rune Forge workflow:

```text
Identity
→ school/function
→ host compatibility
→ semantic effect/modifier
→ cost/condition
→ inscription/material
→ presentation
→ unlock/knowledge
→ validate
→ Test Lab
→ bake/register
```

## P65.7 Explicit non-scope

- arbitrary scripts;
- complete rune catalogue;
- full spell authoring;
- final enchantment system;
- portals.

## P65.8 Implementation capability requirements

Runes are approved semantic components.

They are data-driven components, not arbitrary code containers.

## P65.9 Forge requirements

Rune Forge orchestrates shared Material/VFX/Lighting/Sound services.

## P65.10 Runtime requirements

Rune effect adapters invoke approved magic/effect contracts.

## P65.11 Canonical content subset

Small early rune set:

- one element/domain;
- one shaping rune;
- one utility/infrastructure rune.

## P65.12 Persistence implications

Rune item/inscription/host bindings persist.

## P65.13 Multiplayer / authority implications

Rune installation/use authoritative.

## P65.14 Simulation-LOD implications

Static rune configuration persists even when presentation unloads.

## P65.15 Accessibility / localisation implications

Rune function should remain readable via icon/shape/text, not colour alone.

## P65.16 Performance implications

Effect evaluation bounded.

## P65.17 Security / trust implications

No arbitrary code/expression escape.

## P65.18 Recommended child decomposition

- P65-A — rune schema;
- P65-B — Rune Forge;
- P65-C — host/socket compatibility;
- P65-D — effect adapter;
- P65-E — unlock/Test Lab/presentation;
- P65-F — reconciliation.

## P65.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P65-AC01 | Rune can be authored/validated in Rune Forge | EV-B / EV-C | Required |
| P65-AC02 | Rune function is semantic/whitelisted rather than arbitrary code | EV-B / security review | Required |
| P65-AC03 | Host compatibility/slots enforced | EV-B negative | Required |
| P65-AC04 | Rune references real Flux cost/domain where applicable | EV-B | Required |
| P65-AC05 | Rune unlock/knowledge can be gated | EV-B | Required |
| P65-AC06 | Inscription/item state survives reload | EV-D | Required |
| P65-AC07 | Representative rune remains accessible without colour/glow-only reading | EV-F | Required |
| P65-AC08 | Final SHA/CI passes | EV-H | Required |

## P65.20 Negative tests

- incompatible host;
- missing Flux domain;
- invalid semantic effect;
- unauthorised rune;
- circular modifier dependency;
- stale source/bake.

## P65.21 Manual acceptance scenario

Create an early rune.

Craft/debug-grant it.

Install/apply to approved host.

Observe validation and effect hook.

Save/reload.

## P65.22 Rule-of-cool target

The first moment carved symbols actually **mean something to the game**.

## P65.23 Exit gate

Reusable bounded rune system exists.

## P65.24 Downstream unlock

P66/P68/P71.

## P65.25 Known risks / ADR triggers

- rune composition ordering;
- effect-modifier stacking.

---

# P66 — WORDS THAT CHANGE THE WORLD

**Classification:** FORGE-FIRST  
**Arc:** ARC IX  
**Player/creator payoff:** Spells can be built in The Forge from real targeting, costs, effects and presentation rather than hard-coded one-off abilities.

## P66.1 Purpose

Create Spell Forge v1 and the canonical spell definition/composition model.

## P66.2 Authoritative source packet

- current Magic System;
- Player Progression magic model;
- P64/P65;
- P18–P24 presentation Forge;
- P31 combat actions;
- P37 knowledge/history;
- PROD-04 Creation Journey principles.

## P66.3 Entry gate

- P64 Flux;
- P65 Runes;
- combat/action and presentation services available.

## P66.4 Dependencies

P64–P65 plus P18–P24/P31.

## P66.5 Universal primitives used

- Identity;
- State;
- Capability;
- Transaction;
- Knowledge;
- Composition;
- Result/Reason;
- Provenance.

## P66.6 In scope

Spell source/definition:

- identity;
- school/category;
- cast type;
- target mode;
- range/shape;
- cast phases;
- Flux cost;
- component/rune/focus requirement;
- cooldown;
- status/world-effect module;
- damage/heal/utility hook;
- block/world interaction hook;
- interrupt/cancel;
- failure reasons;
- knowledge/unlock;
- progression/mastery hook;
- animation;
- VFX;
- lighting;
- audio;
- accessibility profile;
- validation.

Spell Forge journey:

```text
Identity / fantasy
→ school
→ targeting
→ authoritative effect
→ cost/resources
→ cast phases
→ runes/components/focus
→ unlock/mastery
→ animation
→ VFX/light/audio
→ accessibility
→ validate
→ combat/world Test Lab
→ bake/register
```

## P66.7 Explicit non-scope

- every magic school;
- final progression/mastery tree;
- ritual magic;
- portals;
- arbitrary scripting;
- model-generated spells.

## P66.8 Implementation capability requirements

Spell Forge orchestrates shared services.

No duplicate VFX editor inside Spell Forge.

## P66.9 Forge requirements

A dedicated progression/unlock surface may be introduced as shared child scope if the existing Knowledge/Progression authoring surface proves insufficient.

## P66.10 Runtime requirements

P67 consumes spell definition.

## P66.11 Canonical content subset

At least:

- one direct/elemental combat spell;
- one utility world-interaction spell;
- one defensive/support spell if scope permits.

## P66.12 Persistence implications

Known spell/loadout/mastery references persist later through P67.

## P66.13 Multiplayer / authority implications

Definitions are authority-compatible.

## P66.14 Simulation-LOD implications

No distant casting required.

## P66.15 Accessibility / localisation implications

Critical spell telegraphs/effects have reduced-flash/motion alternatives and textual reason codes.

## P66.16 Performance implications

VFX and area queries budgeted.

## P66.17 Security / trust implications

Effects are approved modules only.

## P66.18 Recommended child decomposition

- P66-A — spell schema/action phases;
- P66-B — targeting/effect modules;
- P66-C — Spell Forge;
- P66-D — unlock/progression integration;
- P66-E — presentation/Test Lab;
- P66-F — reconciliation.

## P66.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P66-AC01 | Spell source authored/validated in Forge | EV-B / EV-C | Required |
| P66-AC02 | Authoritative effect/cost is separate from presentation | EV-B | Required |
| P66-AC03 | Targeting/range/shape uses approved modules | EV-B | Required |
| P66-AC04 | Unknown/unlearned spell cannot be cast via normal path | EV-B negative | Required |
| P66-AC05 | Flux cost references P64 resource contract | EV-B | Required |
| P66-AC06 | Spell source reuses Animation/VFX/Light/Sound services | EV-A / review | Required |
| P66-AC07 | Reduced-effects presentation retains gameplay readability | EV-F | Required |
| P66-AC08 | Final SHA/CI passes | EV-H | Required |

## P66.20 Negative tests

- insufficient Flux;
- invalid target;
- incompatible focus/rune;
- cast interrupted;
- stale definition;
- forbidden effect module.

## P66.21 Manual acceptance scenario

Author three test spells.

Validate.

Launch Test Lab.

Preview casting phases and failure cases.

## P66.22 Rule-of-cool target

The first spell created through The Forge that feels like:

> **a real system, not a scripted trick.**

## P66.23 Exit gate

Spell source pipeline exists.

## P66.24 Downstream unlock

P67.

## P66.25 Known risks / ADR triggers

- effect module architecture;
- progression/mastery ownership.

---

# P67 — FIRE IN THE PALM

**Classification:** COOL-PULL / INTEGRATION  
**Arc:** ARC IX  
**Player/creator payoff:** The player can learn, equip and cast real magic in the production world.

## P67.1 Purpose

Create Player Magic Runtime v1.

## P67.2 Authoritative source packet

- P64–P66;
- Player Progression;
- Combat;
- Magic System;
- UI/UX magic/progression.

## P67.3 Entry gate

- P66 COMPLETE;
- player action/targeting/combat runtime stable.

## P67.4 Dependencies

P64–P66, P31.

## P67.5 Universal primitives used

- Identity;
- State;
- Capability;
- Transaction;
- Knowledge;
- Result/Reason;
- History hook.

## P67.6 In scope

- personal Flux pool/capacity;
- known spell set;
- spell loadout;
- focus/rune/component checks;
- cast request;
- target validation;
- wind-up/channel/release/recovery;
- cost reservation/commit;
- interruption;
- cooldown;
- effect application;
- spell UI;
- knowledge/unlock integration;
- persistence;
- accessibility.

## P67.7 Explicit non-scope

- huge magic catalogue;
- final mastery trees;
- ritual casting;
- mounted magic;
- realm-specific schools;
- PvP balance.

## P67.8 Implementation capability requirements

Flux cost should commit according to explicit cast contract.

Interrupted casts define whether resources are:

- not spent;
- partially spent;
- fully spent;

rather than relying on animation timing.

## P67.9 Forge requirements

Consumes P66 definitions.

## P67.10 Runtime requirements

Spell actions use normal combat/world command authority.

## P67.11 Canonical content subset

Small early spell set from P66.

## P67.12 Persistence implications

Known spells/loadout/personal Flux state persist.

## P67.13 Multiplayer / authority implications

Casting future server-authoritative; target/effect cannot trust client later.

## P67.14 Simulation-LOD implications

Player active only.

## P67.15 Accessibility / localisation implications

- clear target invalid/cost/cooldown;
- reduced flash/motion;
- non-audio confirmation;
- configurable aim/hold/toggle hooks later.

## P67.16 Performance implications

Area/particle cost measured.

## P67.17 Security / trust implications

Replay/stale cast cannot duplicate effect/spend.

## P67.18 Recommended child decomposition

- P67-A — personal Flux/known spells;
- P67-B — spell loadout/UI;
- P67-C — cast state machine;
- P67-D — effect/target authority;
- P67-E — persistence/accessibility;
- P67-F — reconciliation.

## P67.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P67-AC01 | Player can learn/equip valid spell | EV-C | Required |
| P67-AC02 | Cast consumes correct Flux once | EV-B | Required |
| P67-AC03 | Invalid target/insufficient resource fails without unintended effect | EV-B negative | Required |
| P67-AC04 | Interrupt follows explicit cost/effect policy | EV-B | Required |
| P67-AC05 | Spell effect uses authoritative combat/world command path | EV-B | Required |
| P67-AC06 | Known spells/loadout survive reload | EV-D | Required |
| P67-AC07 | Presentation accessibility profile passes | EV-F / EV-G | Required |
| P67-AC08 | Final SHA/CI passes | EV-H | Required |

## P67.20 Negative tests

- spam cast;
- insufficient Flux;
- invalid target;
- unload target;
- interrupted channel;
- replay same cast ID.

## P67.21 Manual acceptance scenario

Discover/learn spell.

Equip.

Cast on valid/invalid targets.

Drain Flux.

Recharge through approved test source.

Save/reload.

## P67.22 Rule-of-cool target

This is the first real:

> **“I am a mage now.”**

moment. 🔥

## P67.23 Exit gate

Player casting works.

## P67.24 Downstream unlock

P68–P72.

## P67.25 Known risks / ADR triggers

- cast-target authority model;
- personal Flux regeneration/source rules.

---

# P68 — LANTERNS AGAINST THE DARK

**Classification:** FORGE-FIRST / FOUNDATION  
**Arc:** ARC IX  
**Player/creator payoff:** Magic becomes settlement infrastructure: storage, conduits, wards, lamps and protected facilities.

## P68.1 Purpose

Create Magical Infrastructure Forge v1 and runtime infrastructure foundation.

## P68.2 Authoritative source packet

- Magic System;
- 20E magical infrastructure;
- P39–P41 Structure Forge;
- P56/P57 networks;
- P64 Flux;
- P65 runes;
- ART-06 magical readability.

## P68.3 Entry gate

- P64–P67;
- structure/network contracts stable.

## P68.4 Dependencies

P39–P41, P57, P64–P67.

## P68.5 Universal primitives used

- Identity;
- State;
- Connection/Port;
- Capability;
- Permission;
- Composition;
- Transaction;
- Result/Reason.

## P68.6 In scope

Infrastructure source/runtime:

- Flux source/storage;
- conduit;
- relay;
- rune socket;
- ward anchor;
- ward coverage;
- magical lamp/utility;
- machine/structure Flux input;
- capacity;
- priority;
- on/off;
- fault;
- overload;
- purity/stability hook;
- maintenance/repair hook;
- safety/containment hook;
- structure/settlement integration.

Magical Infrastructure Forge journey:

```text
Purpose
→ physical source/structure
→ Flux ports/network
→ runes
→ coverage/function
→ capacity/cost
→ safety/failure
→ presentation
→ permission
→ validate
→ Test Lab
```

## P68.7 Explicit non-scope

- portals;
- leylines;
- realm networks;
- city-scale magical grid;
- full golems;
- ritual geometry.

## P68.8 Implementation capability requirements

A decorative rune lamp gives no light/ward service unless its Flux/connectivity/function/state validate.

## P68.9 Forge requirements

Orchestrates Structure/Machine/Rune/Presentation services.

## P68.10 Runtime requirements

Magical network uses typed graph contracts.

## P68.11 Canonical content subset

- Flux buffer;
- conduit;
- ward lamp/anchor;
- magical utility fixture.

## P68.12 Persistence implications

Network/ward state persists.

## P68.13 Multiplayer / authority implications

Permissions/ownership future-safe.

## P68.14 Simulation-LOD implications

Distant ward/infrastructure summary preserves coverage/cost/state.

## P68.15 Accessibility / localisation implications

Ward/charge/fault readable beyond glow colour.

## P68.16 Performance implications

Coverage/network updates incremental.

## P68.17 Security / trust implications

Ward permission/action scope bounded.

## P68.18 Recommended child decomposition

- P68-A — Flux conduit/network runtime;
- P68-B — storage/priority;
- P68-C — ward/coverage service;
- P68-D — Infrastructure Forge;
- P68-E — structure/settlement/Test Lab;
- P68-F — reconciliation.

## P68.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P68-AC01 | Infrastructure uses Flux network/ports | EV-B | Required |
| P68-AC02 | Ward/utility service requires real Flux/function | EV-B | Required |
| P68-AC03 | Disconnect/depletion changes service authoritatively | EV-B / EV-C | Required |
| P68-AC04 | Coverage/fault is diagnosable | EV-C | Required |
| P68-AC05 | Save/reload preserves network/ward state | EV-D | Required |
| P68-AC06 | Distant representation preserves service truth | EV-B | Required |
| P68-AC07 | Accessibility profile remains readable | EV-F | Required |
| P68-AC08 | Final SHA/CI passes | EV-H | Required |

## P68.20 Negative tests

- no Flux;
- disconnected conduit;
- incompatible rune;
- overload;
- protected target outside coverage;
- permission denied.

## P68.21 Manual acceptance scenario

Power ward lamp/anchor.

Observe coverage.

Disconnect.

Drain.

Reconnect.

Save/reload.

## P68.22 Rule-of-cool target

The first settlement at night protected by **actual working magic infrastructure**.

## P68.23 Exit gate

Magical infrastructure is real.

## P68.24 Downstream unlock

P69–P72.

## P68.25 Known risks / ADR triggers

- coverage spatial-query strategy;
- Flux network priority model.

---

# P69 — BOTTLED WONDERS

**Classification:** FORGE-FIRST  
**Arc:** ARC IX  
**Player/creator payoff:** Alchemy turns world resources into potions, catalysts, fuels and dangerous transformations through controlled recipes.

## P69.1 Purpose

Create Alchemy Forge v1 and alchemical processing runtime.

## P69.2 Authoritative source packet

- Magic System alchemy;
- Recipe/Resource registries;
- P16 recipe/process;
- P52 workstations;
- P64 Flux where magical cost used;
- ART-02/06.

## P69.3 Entry gate

- P64;
- Recipe Forge/process runtime stable.

## P69.4 Dependencies

P16/P52, P64.

## P69.5 Universal primitives used

- Identity;
- Transaction;
- State;
- Capability;
- Knowledge;
- Result/Reason;
- Provenance.

## P69.6 In scope

Alchemy source/process:

- recipe identity;
- ingredients;
- catalyst;
- vessel/station;
- process phases;
- temperature/time/Flux hooks;
- purity/quality hook;
- outputs/by-products;
- failure outcome;
- hazard;
- unlock/knowledge;
- presentation;
- validation.

## P69.7 Explicit non-scope

- every potion;
- unrestricted transmutation;
- economy balance;
- universal corruption meter;
- chemistry simulator.

## P69.8 Implementation capability requirements

Alchemy uses real Recipe/Transaction services.

Failure can create waste, dangerous by-product, explosion or contamination only where authored.

## P69.9 Forge requirements

Specialist authoring over Recipe/Material/VFX/Sound.

## P69.10 Runtime requirements

Process authoritative.

## P69.11 Canonical content subset

- healing/recovery potion;
- utility catalyst/fuel;
- one risky/failure-prone recipe.

## P69.12 Persistence implications

Active process/output persists.

## P69.13 Multiplayer / authority implications

Authoritative.

## P69.14 Simulation-LOD implications

Workstation summary later.

## P69.15 Accessibility / localisation implications

Failure risk/state explicit beyond colour.

## P69.16 Performance implications

No major issue.

## P69.17 Security / trust implications

Recipe cannot call arbitrary effects.

## P69.18 Recommended child decomposition

- P69-A — alchemy schema;
- P69-B — Alchemy Forge;
- P69-C — process runtime;
- P69-D — failure/hazard;
- P69-E — fixtures/Test Lab;
- P69-F — reconciliation.

## P69.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P69-AC01 | Alchemy source authored/validated in Forge | EV-B / EV-C | Required |
| P69-AC02 | Inputs/outputs conserved transactionally | EV-B | Required |
| P69-AC03 | Failure outcome authored and bounded | EV-B / EV-C | Required |
| P69-AC04 | Knowledge/station conditions enforced | EV-B | Required |
| P69-AC05 | Active process survives reload where required | EV-D | Required |
| P69-AC06 | Hazard presentation remains accessible/readable | EV-F | Required |
| P69-AC07 | Final SHA/CI passes | EV-H | Required |

## P69.20 Negative tests

- wrong ingredient;
- no catalyst;
- process interrupted;
- output full;
- risky failure;
- insufficient Flux if required.

## P69.21 Manual acceptance scenario

Author/process safe and risky recipes.

Observe exact inputs, result and failure.

## P69.22 Rule-of-cool target

A little workbench corner where the player can make something **wonderful or mildly catastrophic**. 😂

## P69.23 Exit gate

Alchemy is a real production path.

## P69.24 Downstream unlock

P70/P71.

## P69.25 Known risks / ADR triggers

- quality/purity progression model.

---

# P70 — CIRCLES OF POWER

**Classification:** FORGE-FIRST / COOL-PULL  
**Arc:** ARC IX  
**Player/creator payoff:** Large magic becomes something the player physically constructs, supplies and performs in the world.

## P70.1 Purpose

Create Ritual Forge v1 and physical ritual runtime.

## P70.2 Authoritative source packet

- Magic System ritual rules;
- Recipe/Resource;
- Structure Forge;
- Rune Forge;
- Flux infrastructure;
- Signal/Logic where trigger/control applies;
- ART-06 ritual presentation.

## P70.3 Entry gate

- P64/P65/P68/P69;
- Structure/Composition contracts stable.

## P70.4 Dependencies

P40/P41, P61, P64/P65/P68/P69.

## P70.5 Universal primitives used

- Identity;
- Composition;
- Transaction;
- Connection;
- Capability;
- Permission;
- State;
- Knowledge;
- Result/Reason.

## P70.6 In scope

Ritual definition/source:

- identity;
- geometry/layout;
- anchor types;
- runes;
- participant positions;
- catalysts;
- Flux source/capacity;
- environment/world conditions;
- time/phase;
- trigger;
- permissions;
- valid/unstable/failed states;
- consequence/effect;
- interruption;
- recovery/cleanup;
- history/event hook;
- presentation.

## P70.7 Explicit non-scope

- realm portals;
- world-ending rituals;
- every forbidden school;
- arbitrary script graph.

## P70.8 Implementation capability requirements

Ritual success requires physical world state.

UI cannot bypass missing anchor/catalyst.

## P70.9 Forge requirements

Composes Structure/Rune/VFX/Lighting/Sound.

## P70.10 Runtime requirements

Ritual progresses through authoritative phase state.

## P70.11 Canonical content subset

At least:

- one protective/utility ritual;
- one environmental/world interaction ritual;
- one failure scenario.

## P70.12 Persistence implications

Active ritual state may persist if interruption policy allows.

Completed consequential ritual writes history/event state.

## P70.13 Multiplayer / authority implications

Participants/contribution future-authoritative.

## P70.14 Simulation-LOD implications

Active ritual should normally remain relevant/authoritative; distant summaries later.

## P70.15 Accessibility / localisation implications

Geometry/phase/failure readable without VFX alone.

## P70.16 Performance implications

Area/effect checks bounded.

## P70.17 Security / trust implications

Effect whitelist; permissions; no arbitrary code.

## P70.18 Recommended child decomposition

- P70-A — ritual schema;
- P70-B — geometry/anchor validation;
- P70-C — Ritual Forge;
- P70-D — runtime phases/contribution;
- P70-E — failure/history/Test Lab;
- P70-F — reconciliation.

## P70.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P70-AC01 | Ritual source authored/validated through Forge | EV-B / EV-C | Required |
| P70-AC02 | Geometry/anchors/catalysts/Flux physically required | EV-B | Required |
| P70-AC03 | Missing/invalid prerequisite blocks ritual with reason | EV-B negative | Required |
| P70-AC04 | Phase progression authoritative and presentation-only effects cannot force success | EV-B | Required |
| P70-AC05 | Failure/interruption produces governed bounded outcome | EV-C | Required |
| P70-AC06 | Consequential completion writes appropriate history/event | EV-B / EV-D | Required |
| P70-AC07 | Reduced-effects mode retains phase/risk readability | EV-F | Required |
| P70-AC08 | Final SHA/CI passes | EV-H | Required |

## P70.20 Negative tests

- missing anchor;
- participant leaves;
- Flux loss;
- wrong catalyst;
- interrupted phase;
- permission denied.

## P70.21 Manual acceptance scenario

Construct ritual.

Supply Flux/catalysts.

Begin.

Interrupt one test.

Complete another.

Inspect world/history consequence.

## P70.22 Rule-of-cool target

The first magic that feels **too large to fit in the player's hand**.

## P70.23 Exit gate

Physical ritual system exists.

## P70.24 Downstream unlock

P71/P72 and later realm portals.

## P70.25 Known risks / ADR triggers

- ritual phase/contribution scheduler;
- world-condition query API.

---

# P71 — THE ARCANE ENGINE

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC IX  
**Player/creator payoff:** Magic and machinery become one coherent magitech system instead of two disconnected progression trees.

## P71.1 Purpose

Integrate Flux/runes with automation, machines, settlement infrastructure and bounded magical workers.

## P71.2 Authoritative source packet

- P56–P63 automation;
- P64–P70 magic;
- 20E magitech progression;
- Player Progression mage-engineer path;
- golemancy canon.

## P71.3 Entry gate

- P56–P70 relevant foundations COMPLETE.

## P71.4 Dependencies

P58/P59/P61/P63, P64–P70.

## P71.5 Universal primitives used

Broad integration set.

## P71.6 In scope

Magitech integration:

- Flux-powered machine input;
- rune-modified machine behaviour;
- Flux buffer;
- hybrid mechanical+Flux process;
- magical sensor/control hook;
- warded infrastructure interaction;
- Flux furnace conversion branch where current canon requires;
- Arcane Alloy or equivalent first magitech material/process;
- bounded golem/construct integration proof;
- fault/overload;
- warehouse/settlement demand;
- diagnostics.

### Golemancy foundation

A single utility construct/golem proof may be included as a child slice:

- entity identity;
- construct body;
- ownership;
- Flux charge;
- limited approved work capability;
- task planner;
- shutdown;
- safe no-Flux state.

This is not full golem content production.

## P71.7 Explicit non-scope

- huge golem army;
- leylines;
- portals;
- realm infrastructure;
- fully magical factory replacement;
- arbitrary rune scripting.

## P71.8 Implementation capability requirements

Hybrid systems use normal machine/Flux/rune contracts.

No private `ArcaneMachine` stack.

## P71.9 Forge requirements

Machine Forge composes Flux/rune modules.

Creature/Entity Forge may compose bounded golem fixture.

## P71.10 Runtime requirements

Power domains remain distinct.

A hybrid machine may require both mechanical power and Flux without coercing them into one numeric resource.

## P71.11 Canonical content subset

- Flux-assisted processor;
- Flux furnace branch;
- first Arcane Alloy process;
- utility golem fixture if included.

## P71.12 Persistence implications

Hybrid process/network/construct state persists.

## P71.13 Multiplayer / authority implications

Authoritative.

## P71.14 Simulation-LOD implications

Hybrid infrastructure summaries preserve both energy/resource constraints.

## P71.15 Accessibility / localisation implications

Power-vs-Flux fault reasons distinct/readable.

## P71.16 Performance implications

Cross-network interactions bounded.

## P71.17 Security / trust implications

Rune/signal cannot bypass machine/construct permission.

## P71.18 Recommended child decomposition

- P71-A — Flux-machine port/process integration;
- P71-B — rune machine modifiers;
- P71-C — hybrid process/material fixture;
- P71-D — settlement/warehouse integration;
- P71-E — golem/construct v1 proof;
- P71-F — faults/LOD/persistence;
- P71-G — reconciliation.

## P71.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P71-AC01 | Hybrid machine uses existing machine + Flux contracts | EV-A / EV-B | Required |
| P71-AC02 | Mechanical and Flux resources remain distinct | EV-B | Required |
| P71-AC03 | Rune modification is bounded/validated | EV-B | Required |
| P71-AC04 | Magitech output consumes exact real inputs/energy | EV-B | Required |
| P71-AC05 | Fault in one domain produces explicit state rather than silent cheating | EV-C / EV-B | Required |
| P71-AC06 | Golem proof, if included, composes entity/task/Flux systems rather than new simulation | EV-A / EV-C | Required |
| P71-AC07 | Save/away-return reconciles hybrid state | EV-D | Required |
| P71-AC08 | Cross-network fixture stays bounded | EV-E | Required |
| P71-AC09 | Final SHA/CI passes | EV-H | Required |

## P71.20 Negative tests

- mechanical power only when Flux also required;
- Flux only when mechanical also required;
- invalid rune;
- no Flux;
- golem charge depleted;
- signal permission denied.

## P71.21 Manual acceptance scenario

Build hybrid processor.

Connect mechanical power and Flux.

Install rune modifier.

Run process.

Remove each dependency independently.

Inspect clear failure state.

## P71.22 Rule-of-cool target

This is the true birth of the **mage-engineer** fantasy.

## P71.23 Exit gate

Magic and automation compose.

## P71.24 Downstream unlock

P72.

## P71.25 Known risks / ADR triggers

- multi-domain scheduling/order;
- golem work-authority scope.

---

# P72 — THE IMPOSSIBLE INSTRUMENT

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC IX  
**Player/creator payoff:** A ridiculous Flux-powered voxel pipe organ proves Leyforge's systems are composable enough to create something nobody wrote a bespoke gameplay system for.

## P72.1 Purpose

Certify ARC IX through an emergent, deliberately weird system composition.

## P72.2 Authoritative source packet

- P23 Music Lab;
- P39/P40 Structure Forge;
- P56/P57 networks;
- P61 Signal & Logic;
- P64 Flux;
- P65 runes;
- P68 infrastructure;
- P71 magitech;
- P18–P24 presentation.

## P72.3 Entry gate

- P23;
- P61;
- P64–P71;
- relevant structure/machine services COMPLETE.

## P72.4 Dependencies

Cross-programme integration.

## P72.5 Universal primitives used

- Identity;
- State;
- Signal;
- Connection/Port;
- Composition;
- Transaction;
- Capability;
- Result/Reason.

## P72.6 In scope

Build one functional instrument composed from existing systems:

- voxel/Structure Forge body;
- registered blocks/materials;
- keys/pedals/controls;
- signal endpoints;
- Signal & Logic routing;
- Music Lab notes/instrument definition;
- mechanical movement;
- optional airflow/mechanical metaphor without requiring full fluid simulation;
- Flux source/buffer;
- rune or magitech modifier;
- animation;
- VFX/lighting;
- sound;
- save/load;
- future-safe note/control authority model;
- Test Lab/performance/accessibility.

The system should support at least:

- multiple notes;
- simple chord;
- short sequence;
- Flux-powered magical register/effect;
- low/no-Flux failure mode.

## P72.7 Explicit non-scope

- dedicated `PipeOrganSystem`;
- full acoustic simulation;
- MIDI workstation;
- unrestricted user scripting;
- full instrument catalogue.

## P72.8 Implementation capability requirements

The certification question is:

> **Can normal registered things connect through normal ports/signals/services and become a functioning new composite experience?**

If bespoke organ-only gameplay code is required for core behaviour, architecture review is triggered.

## P72.9 Forge requirements

The organ is authored by composition.

## P72.10 Runtime requirements

Normal services only.

## P72.11 Canonical content subset

One golden impossible instrument.

## P72.12 Persistence implications

Configuration, sequence/logic state and Flux state persist as applicable.

## P72.13 Multiplayer / authority implications

Note/control events future-authoritative; audio remains presentation.

## P72.14 Simulation-LOD implications

Distant audio/presentation virtualises; configuration remains.

## P72.15 Accessibility / localisation implications

Keys/notes/state have visual feedback.

Reduced flash/motion supported.

## P72.16 Performance implications

Polyphony, signal graph, VFX/light/audio combined benchmark.

## P72.17 Security / trust implications

No arbitrary script escape.

## P72.18 Recommended child decomposition

- P72-A — Structure Forge instrument body;
- P72-B — controls/signals;
- P72-C — Music Lab integration;
- P72-D — Flux/rune/magitech register;
- P72-E — presentation/accessibility/performance;
- P72-F — save/integration review;
- P72-G — PG-09 reconciliation.

## P72.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P72-AC01 | Instrument body uses registered Structure Forge content | EV-B / EV-C | Required |
| P72-AC02 | Key/control actions use P61 signals | EV-B | Required |
| P72-AC03 | Notes use P23 Music Lab | EV-B / EV-C | Required |
| P72-AC04 | Flux-powered feature uses P64/P68/P71 contracts | EV-B | Required |
| P72-AC05 | No dedicated organ gameplay system is required for core function | EV-A / review | Required |
| P72-AC06 | Multiple notes/chord/sequence work | EV-C | Required |
| P72-AC07 | No-Flux/fault state is understandable | EV-C / EV-F | Required |
| P72-AC08 | Save/reload preserves authored composition/config | EV-D | Required |
| P72-AC09 | Combined load remains bounded | EV-E | Required |
| P72-AC10 | Human Rule-of-Cool review passes | EV-G | Required |
| P72-AC11 | Final SHA/CI passes | EV-H | Required |

## P72.20 Negative tests

- Flux disconnected;
- signal path broken;
- note mapping invalid;
- output/polyphony cap;
- source part removed;
- save mid-sequence.

## P72.21 Manual acceptance scenario

Walk up to organ.

Play individual notes.

Play chord.

Trigger sequence.

Enable Flux register.

Disconnect Flux.

Repair.

Save/reload.

## P72.22 Rule-of-cool target

No subtlety here:

> **A FUCKING FLUX-POWERED VOXEL PIPE ORGAN.** 😂🔥

If this works without bespoke systems, The Forge/runtime composition architecture has earned some confidence.

## P72.23 Exit gate — PG-09 MAGIC & MAGITECH FOUNDATION

PG-09 passes when:

- P64–P72 COMPLETE;
- magic is resource-conserving and infrastructure-capable;
- player casting works;
- Forge can author runes/spells/alchemy/rituals;
- magic and automation compose;
- the impossible instrument proves emergent composition.

## P72.24 Downstream unlock

ARC X world/exploration and later realm magic.

## P72.25 Known risks / ADR triggers

- unexpected coupling exposed by composition test.

---

# 04. ARC X — BEYOND THE HORIZON

ARC X makes exploration production-real.

The target is not every Overworld biome/content family.

The target is the **world generation and exploration platform** capable of hosting the FCC Overworld Atlas safely.

---

# P73 — THE SHAPE OF CONTINENTS

**Classification:** FOUNDATION  
**Arc:** ARC X — BEYOND THE HORIZON  
**Player/creator payoff:** New seeds produce coherent regions/continents with deterministic terrain relationships rather than endless local noise.

## P73.1 Purpose

Create Regional Worldgen Contract.

## P73.2 Authoritative source packet

- PROD-03 worldgen/streaming architecture;
- World Content Atlas / FCC Overworld;
- current Biomes & World Generation canon;
- historical technical seed derivation principles;
- P02 voxel substrate;
- P46 routes;
- P55 simulation LOD;
- current PRD worldgen/cave risk evidence.

## P73.3 Entry gate

- PG-09 COMPLETE;
- P02/P05 stable;
- deterministic-seed requirements reconciled.

## P73.4 Dependencies

P02/P05 plus settled regional content authority.

## P73.5 Universal primitives used

- Identity;
- State;
- Route;
- Composition;
- Knowledge hook;
- Provenance;
- Result/Reason.

## P73.6 In scope

Regional Worldgen contract:

- world master seed;
- generator version;
- named sub-seeds;
- region identity;
- continental/regional macro plan;
- elevation/terrain field;
- climate field;
- moisture;
- temperature;
- altitude/depth;
- coast/river-basin hooks;
- biome suitability input;
- cave-region input;
- resource distribution input;
- structure/settlement site input;
- route corridor hook;
- magical-feature field;
- danger/safety hook;
- deterministic validation;
- generation manifest;
- migration/version strategy.

## P73.7 Explicit non-scope

- final all-biome content;
- final oceans/water runtime;
- every structure;
- final roads;
- realm generation;
- complete climate simulation.

## P73.8 Implementation capability requirements

Named sub-seeds avoid accidental global rerolls.

Conceptual namespaces may include:

```text
seed.world
seed.terrain
seed.climate
seed.caves
seed.resources
seed.structures
seed.ecology
seed.magic
seed.civilisation
```

Exact scheme is implementation authority.

## P73.9 Forge requirements

P74 consumes contract.

## P73.10 Runtime requirements

Worldgen remains provider-independent at semantic planning level; Zylann consumes generated voxel data.

## P73.11 Canonical content subset

Representative regional world profile only.

## P73.12 Persistence implications

Seed/generator version/sub-seed scheme stored in world manifest.

Generated base vs player edits remain distinct.

## P73.13 Multiplayer / authority implications

Server/world seed authoritative.

## P73.14 Simulation-LOD implications

Region identity supports future summary simulation.

## P73.15 Accessibility / localisation implications

No major UI.

## P73.16 Performance implications

Regional planning/generation budgets measured.

## P73.17 Security / trust implications

User-entered seed is data only.

## P73.18 Recommended child decomposition

- P73-A — seed/sub-seed/version contract;
- P73-B — regional macro-plan;
- P73-C — terrain/climate fields;
- P73-D — downstream feature interfaces;
- P73-E — determinism/order-independence proof;
- P73-F — reconciliation.

## P73.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P73-AC01 | Same seed/version produces same required regional semantics | EV-B | Required |
| P73-AC02 | Generation order/worker scheduling does not change required semantic result | EV-B / EV-E | Required |
| P73-AC03 | Named sub-seed change can isolate one domain in controlled fixture | EV-B | Required |
| P73-AC04 | World manifest records generator identity/version | EV-D | Required |
| P73-AC05 | Base generation remains separable from player edits | EV-D | Required |
| P73-AC06 | Representative regional generation stays within provisional budget | EV-E | Required |
| P73-AC07 | Final SHA/CI passes | EV-H | Required |

## P73.20 Negative tests

- unsupported generator version;
- order-changed requests;
- worker-count change;
- missing sub-seed;
- old save generator version.

## P73.21 Manual acceptance scenario

Generate same seed twice under changed request/traversal order.

Compare semantic regional result.

Generate different seed.

Confirm meaningful regional variation.

## P73.22 Rule-of-cool target

The first time a seed produces a world that looks like:

> **a place with geography**, not procedural soup.

## P73.23 Exit gate

Regional deterministic worldgen contract stable.

## P73.24 Downstream unlock

P74–P82.

## P73.25 Known risks / ADR triggers

- large-coordinate/regional partition strategy;
- generator-version migration.

---

# P74 — WORLDWRIGHT

**Classification:** FORGE-FIRST  
**Arc:** ARC X  
**Player/creator payoff:** Developers can author, preview and validate world-generation rules through The Forge rather than editing opaque generator code for every content change.

## P74.1 Purpose

Create World Forge v1.

## P74.2 Authoritative source packet

- PROD-04 World Forge architecture;
- P73;
- FCC World Content Atlas;
- historical worldgen pipeline;
- ART-03 world/realm visual architecture.

## P74.3 Entry gate

- P73 COMPLETE.

## P74.4 Dependencies

P73, Forge Core/Test Lab.

## P74.5 Universal primitives used

- Identity;
- Composition;
- State;
- Provenance;
- Result/Reason.

## P74.6 In scope

World Forge v1:

- generation profile identity;
- world/region rule graph or controlled authored representation;
- seed input;
- macro-region preview;
- terrain profile;
- climate field controls;
- downstream biome hooks;
- cave/resource/structure/ecology hooks;
- constraints;
- feature spacing;
- required-anchor rules;
- seed explorer;
- compare seeds;
- deterministic preview;
- diagnostic overlays;
- validation;
- bake/export generator data;
- regression seed set.

## P74.7 Explicit non-scope

- freehand painting final world;
- every biome editor detail;
- full ocean authoring;
- Realm Forge;
- arbitrary code scripting.

## P74.8 Implementation capability requirements

World Forge authors generation parameters/data.

Low-level performance-critical algorithms may remain code/providers under engineering authority.

## P74.9 Forge requirements

Specialist tool orchestrating Biome/Ecology/Structure later.

## P74.10 Runtime requirements

Runtime consumes baked generator definitions.

## P74.11 Canonical content subset

One Overworld regional profile.

## P74.12 Persistence implications

Worlds retain generator revision/version used.

## P74.13 Multiplayer / authority implications

Developer authoring only.

## P74.14 Simulation-LOD implications

Region plan supports later summaries.

## P74.15 Accessibility / localisation implications

Editor overlays use labels/patterns beyond colour.

## P74.16 Performance implications

Preview generation bounded/cancellable.

## P74.17 Security / trust implications

No unrestricted generator scripts in player content.

## P74.18 Recommended child decomposition

- P74-A — generation profile/source;
- P74-B — region/terrain/climate editor;
- P74-C — feature-hook editor;
- P74-D — seed explorer/compare;
- P74-E — validation/regression;
- P74-F — reconciliation.

## P74.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P74-AC01 | Generation profile authored/versioned through Forge | EV-B / EV-C | Required |
| P74-AC02 | Same profile/seed preview is deterministic | EV-B | Required |
| P74-AC03 | Seed explorer can compare multiple seeds without mutating source | EV-C | Required |
| P74-AC04 | Invalid regional constraints fail with reason | EV-B negative | Required |
| P74-AC05 | Runtime consumes baked profile | EV-C | Required |
| P74-AC06 | Preview is cancellable/bounded | EV-E | Required |
| P74-AC07 | Final SHA/CI passes | EV-H | Required |

## P74.20 Negative tests

- impossible constraint;
- missing downstream profile;
- stale bake;
- cancelled preview;
- old generator schema.

## P74.21 Manual acceptance scenario

Open generation profile.

Preview seed.

Adjust one controlled terrain/climate rule.

Preview again.

Validate.

Bake and create test world.

## P74.22 Rule-of-cool target

The Forge can now **make worlds**, not just things inside worlds.

## P74.23 Exit gate

World Forge v1 exists.

## P74.24 Downstream unlock

P75–P80.

## P74.25 Known risks / ADR triggers

- editor representation for procedural graphs/layers.

---

# P75 — WHERE EARTH BECOMES PLACE

**Classification:** FORGE-FIRST  
**Arc:** ARC X  
**Player/creator payoff:** Regions gain distinct ecological/material identities through authored biome rules.

## P75.1 Purpose

Create Biome Forge v1 and biome runtime contract.

## P75.2 Authoritative source packet

- current Biomes & World Generation;
- FCC Overworld biome families;
- World Content Atlas;
- ART-03 biome visual architecture;
- ART-02 materials;
- P73/P74.

## P75.3 Entry gate

- P74 World Forge;
- biome identity/content authority available.

## P75.4 Dependencies

P73–P74, Material Forge.

## P75.5 Universal primitives used

- Identity;
- State;
- Composition;
- Capability;
- Provenance;
- Result/Reason.

## P75.6 In scope

Biome definition:

- stable identity;
- biome family;
- climate ranges;
- elevation/depth;
- terrain shaping modifiers;
- geology/material palette;
- soil/surface;
- flora profile;
- fauna suitability;
- resource profile;
- weather bias;
- hazard profile;
- magical conditions;
- structure/ruin compatibility;
- settlement/culture suitability hooks;
- transitions/ecotones;
- visual/audio ambience references;
- spawn/buildability constraints;
- validation.

## P75.7 Explicit non-scope

- all ~77 Overworld base biomes immediately;
- final ecology runtime;
- full weather;
- ocean biomes;
- realm biomes.

## P75.8 Implementation capability requirements

Biome placement comes from world fields/constraints.

Not hand-painted per seed.

## P75.9 Forge requirements

Reuses Material/World/Structure services.

## P75.10 Runtime requirements

Biome identity query available at canonical world location.

## P75.11 Canonical content subset

Representative small family set:

- temperate forest;
- plains/grassland;
- rocky/highland;
- dry/cold contrast biome.

Exact examples follow FCC.

## P75.12 Persistence implications

Generated biome base deterministic by world seed/version.

Dynamic biome state overlays persist separately.

## P75.13 Multiplayer / authority implications

World/server authority.

## P75.14 Simulation-LOD implications

Biome identity available cheaply at regional scale.

## P75.15 Accessibility / localisation implications

Biome identity not colour-only; terrain/flora/material/audio silhouettes differ.

## P75.16 Performance implications

Biome field query/generation bounded.

## P75.17 Security / trust implications

None.

## P75.18 Recommended child decomposition

- P75-A — biome schema;
- P75-B — Biome Forge;
- P75-C — transitions/ecotones;
- P75-D — runtime query/generation;
- P75-E — representative families/ART review;
- P75-F — reconciliation.

## P75.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P75-AC01 | Biome definition authored/validated in Forge | EV-B / EV-C | Required |
| P75-AC02 | Biome placement follows climate/world constraints | EV-B | Required |
| P75-AC03 | Transitions avoid invalid hard discontinuities where not intentional | EV-C / EV-F | Required |
| P75-AC04 | Biome identity query deterministic | EV-B | Required |
| P75-AC05 | Material/geology/flora hooks remain stable IDs | EV-B | Required |
| P75-AC06 | Representative biomes are visually/materially distinct beyond palette swap | EV-F / EV-G | Required |
| P75-AC07 | Final SHA/CI passes | EV-H | Required |

## P75.20 Negative tests

- impossible climate range;
- missing material;
- overlapping exclusive constraints;
- invalid transition;
- missing ecology profile.

## P75.21 Manual acceptance scenario

Generate representative region crossing multiple biomes.

Travel through transition.

Inspect terrain/material/identity differences.

## P75.22 Rule-of-cool target

The player crosses a hill and genuinely feels:

> **“I'm somewhere else now.”**

## P75.23 Exit gate

Biome system supports production expansion.

## P75.24 Downstream unlock

P76/P77/P79.

## P75.25 Known risks / ADR triggers

- biome blend/priority model.

---

# P76 — THE GREEN BETWEEN STONES

**Classification:** FORGE-FIRST / FOUNDATION  
**Arc:** ARC X  
**Player/creator payoff:** The world gains living flora/ecology, and domesticated farming/animals begin using the same environmental rules instead of being separate minigames.

## P76.1 Purpose

Create Flora & Ecology Forge / Ecology Composer v1 and bounded agriculture/husbandry foundation.

## P76.2 Authoritative source packet

- Biomes/Worldgen;
- creature/ecology canon;
- 20A provisions/farming/livestock;
- P29 creature behaviour;
- P51 gathering;
- P75 biome;
- ART-03/05;
- Resource Progression.

## P76.3 Entry gate

- P75 biome;
- P25–P29 entity ecology hooks.

## P76.4 Dependencies

P29, P51, P75.

## P76.5 Universal primitives used

- Identity;
- State;
- Capability;
- Composition;
- Transaction;
- History hook;
- Result/Reason.

## P76.6 In scope

### Flora source/profile

- plant identity;
- biome/environment suitability;
- substrate/soil;
- moisture/light/temperature ranges;
- growth/lifecycle stages;
- harvest;
- regeneration/reproduction hook;
- seasonal response;
- disturbance response;
- clustering/distribution;
- material/resource outputs;
- presentation states.

### Ecology Composer

- biome flora communities;
- creature suitability/carrying hook;
- food/resource relationships;
- habitat/cover;
- disturbance;
- density;
- regeneration;
- authored ecosystem profile.

### Agriculture foundation

- crop lifecycle;
- planting;
- soil/plot capability;
- growth;
- harvest;
- replanting;
- basic moisture/weather hook;
- actual seed/crop resource transaction.

### Husbandry foundation

- domesticated animal identity/ownership hook;
- enclosure/service requirements;
- food/water hook;
- basic product/harvest relationship;
- reproduction hook may remain deferred if too large.

## P76.7 Explicit non-scope

- full advanced farming catalogue;
- genetics;
- ecosystem predator/prey simulation at continental scale;
- full breeding;
- irrigation networks;
- animal disease;
- complete forestry management.

## P76.8 Implementation capability requirements

Wild and domesticated ecology share environmental rules where appropriate.

A crop does not grow solely because a UI timer expires if required environment is invalid.

## P76.9 Forge requirements

Flora/Ecology Forge orchestrates Material/Voxel/Biome/Creature services.

## P76.10 Runtime requirements

Growth/lifecycle uses bounded scheduler, not per-plant per-frame ticks.

## P76.11 Canonical content subset

- tree/wood family;
- undergrowth/grass;
- harvestable wild plant;
- one crop;
- one domesticated animal or husbandry test if feasible.

## P76.12 Persistence implications

Growth stage, planted crop, disturbed ecology, owned animal state persist.

## P76.13 Multiplayer / authority implications

Harvest/growth authoritative.

## P76.14 Simulation-LOD implications

Critical.

Distant ecology uses bounded lifecycle summaries.

## P76.15 Accessibility / localisation implications

Growth/readiness not colour-only.

## P76.16 Performance implications

Large plant population must not tick individually every frame.

## P76.17 Security / trust implications

Harvest/reload cannot duplicate yield.

## P76.18 Recommended child decomposition

- P76-A — flora/lifecycle source;
- P76-B — Ecology Composer;
- P76-C — world placement/regeneration;
- P76-D — agriculture foundation;
- P76-E — husbandry foundation;
- P76-F — LOD/persistence/performance;
- P76-G — reconciliation.

## P76.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P76-AC01 | Flora source authored/validated through Forge | EV-B / EV-C | Required |
| P76-AC02 | Placement/growth respects biome/environment | EV-B | Required |
| P76-AC03 | Harvest transfers real resources exactly once | EV-B negative | Required |
| P76-AC04 | Growth/lifecycle survives save/away-return | EV-D | Required |
| P76-AC05 | Crop foundation uses real planting/growth/harvest state | EV-C | Required |
| P76-AC06 | Husbandry foundation, if included, uses real animal/service/resource state | EV-C | Required |
| P76-AC07 | Ecology update remains bounded at representative density | EV-E | Required |
| P76-AC08 | Biome flora reads as coherent family rather than random scatter | EV-F / EV-G | Required |
| P76-AC09 | Final SHA/CI passes | EV-H | Required |

## P76.20 Negative tests

- invalid soil;
- wrong climate;
- harvest twice;
- unload mid-growth;
- over-density;
- animal service missing.

## P76.21 Manual acceptance scenario

Explore wild flora.

Harvest.

Plant crop.

Leave/return.

Observe growth under valid/invalid conditions.

Interact with husbandry fixture if included.

## P76.22 Rule-of-cool target

The world starts feeling like it **grows back and changes without waiting for the player**.

## P76.23 Exit gate

Ecology/Flora Forge and domesticated-ecology foundation exist.

## P76.24 Downstream unlock

P77/P82 and later settlement agriculture expansion.

## P76.25 Known risks / ADR triggers

- lifecycle scheduler;
- ecosystem summary model.

---

# P77 — SKY WITH TEETH

**Classification:** COOL-PULL / FOUNDATION  
**Arc:** ARC X  
**Player/creator payoff:** Weather and seasons stop being skybox dressing and begin changing visibility, exposure, travel, ecology and atmosphere.

## P77.1 Purpose

Create Weather & Seasons v1.

## P77.2 Authoritative source packet

- Biomes/Worldgen;
- survival P15;
- ART-06 environment/VFX/lighting;
- ART-07 ambience;
- P75/P76;
- current weather/season design.

## P77.3 Entry gate

- biome/climate fields;
- presentation stack.

## P77.4 Dependencies

P15, P24, P75/P76.

## P77.5 Universal primitives used

- State;
- Identity;
- Capability;
- Result/Reason;
- History hook.

## P77.6 In scope

- weather state/profile;
- regional weather cell/event;
- precipitation;
- wind;
- temperature modifier;
- visibility;
- storm intensity;
- thunder/lightning hook;
- snow/wetness/frost state hooks;
- seasonal state;
- biome weather bias;
- ecology/growth hook;
- player exposure hook;
- travel/hazard hook;
- presentation;
- forecast/knowledge hook;
- persistence/world clock.

## P77.7 Explicit non-scope

- ocean storm hydrodynamics;
- full river flooding;
- climate-change simulation;
- realm-specific weather;
- tornado physics unless canon later prioritises.

## P77.8 Implementation capability requirements

Gameplay weather remains even if particles reduced, sound muted or clouds simplified.

## P77.9 Forge requirements

Weather profiles may be authored in World/Biome Forge shared services rather than requiring a separate full parent Forge.

## P77.10 Runtime requirements

Regional state updates bounded.

## P77.11 Canonical content subset

- clear;
- rain;
- storm;
- cold/snow condition where representative.

## P77.12 Persistence implications

Current season/weather front/state survives/reconstructs according to world time.

## P77.13 Multiplayer / authority implications

World/server weather authoritative.

## P77.14 Simulation-LOD implications

Weather regional, presentation local.

## P77.15 Accessibility / localisation implications

Reduced lightning flash; storm danger has multiple cues.

## P77.16 Performance implications

VFX/audio/light scaling.

## P77.17 Security / trust implications

None.

## P77.18 Recommended child decomposition

- P77-A — weather/season state;
- P77-B — regional weather scheduler;
- P77-C — gameplay hooks;
- P77-D — presentation profiles;
- P77-E — persistence/accessibility/performance;
- P77-F — reconciliation.

## P77.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P77-AC01 | Weather truth is separate from VFX/audio | EV-B | Required |
| P77-AC02 | Biome/climate biases valid weather | EV-B | Required |
| P77-AC03 | Survival/ecology hooks receive authoritative weather state | EV-B | Required |
| P77-AC04 | Reduced effects preserve gameplay weather consequence/readability | EV-F | Required |
| P77-AC05 | Save/reload reconstructs season/weather state correctly | EV-D | Required |
| P77-AC06 | Regional weather/presentation stays within budget | EV-E | Required |
| P77-AC07 | Final SHA/CI passes | EV-H | Required |

## P77.20 Negative tests

- VFX disabled;
- sound disabled;
- incompatible biome event;
- reload during storm;
- accelerated time/season transition.

## P77.21 Manual acceptance scenario

Travel through clear→rain/storm.

Observe visibility/exposure/environment.

Enable reduced-flash/effects.

Leave/reload during weather.

## P77.22 Rule-of-cool target

The sky should sometimes make the player think:

> **“Maybe I should not be out here.”**

## P77.23 Exit gate

Weather/seasons function as world state.

## P77.24 Downstream unlock

P78–P82.

## P77.25 Known risks / ADR triggers

- weather-region/front model.

---

# P78 — BENEATH THE ROOTS

**Classification:** COOL-PULL / FOUNDATION  
**Arc:** ARC X  
**Player/creator payoff:** The Overworld gains real cave provinces, deep routes and a finite dangerous Deep Overworld below the surface.

## P78.1 Purpose

Create production cave/deep-geology generation.

## P78.2 Authoritative source packet

- FCC Overworld cave provinces/Deep Routes/finite Deep Overworld;
- P73/P74;
- current cave/worldgen canon;
- PRD cave proof evidence;
- Resource Progression;
- ART-03 underground identity.

## P78.3 Entry gate

- P73 worldgen;
- cave risk/proof sufficiently resolved for production.

## P78.4 Dependencies

P73–P77 as relevant.

## P78.5 Universal primitives used

- Identity;
- State;
- Route;
- Composition;
- Result/Reason;
- Knowledge hook.

## P78.6 In scope

- cave-province identity;
- underground depth bands;
- entrances;
- chambers;
- tunnels;
- vertical shafts where valid;
- Deep Routes;
- finite Deep Overworld boundary/model;
- geology/material profiles;
- ore/resource integration;
- underground biome hook;
- water/hazard hook without final water runtime;
- structure/dungeon sockets;
- navigation/traversal validation;
- determinism;
- accessibility of required content.

## P78.7 Explicit non-scope

- Infinite Deep;
- Impossible Deep realm;
- full underground cities;
- final groundwater simulation;
- every cave biome;
- all megadungeons.

## P78.8 Implementation capability requirements

Required progression content may not be permanently sealed by generation without fallback/validation.

## P78.9 Forge requirements

World Forge/Cave authoring may exist as a specialist surface within World Forge.

No need for a separate parent Cave Forge if shared service suffices.

## P78.10 Runtime requirements

Zylann/provider receives deterministic cave voxel field.

## P78.11 Canonical content subset

Representative:

- ordinary cave;
- ore-bearing chamber;
- deep-route feature;
- one Deep Overworld province.

## P78.12 Persistence implications

Generated base deterministic; edits persistent.

## P78.13 Multiplayer / authority implications

Server worldgen.

## P78.14 Simulation-LOD implications

Underground region identity available when unloaded.

## P78.15 Accessibility / localisation implications

Navigation/readability through shape/material/light cues.

## P78.16 Performance implications

Generation/meshing/traversal benchmark.

## P78.17 Security / trust implications

None.

## P78.18 Recommended child decomposition

- P78-A — cave province schema;
- P78-B — cave/tunnel/chamber generator;
- P78-C — Deep Routes;
- P78-D — finite Deep Overworld;
- P78-E — connectivity/determinism/performance;
- P78-F — reconciliation.

## P78.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P78-AC01 | Cave generation deterministic under required order changes | EV-B | Required |
| P78-AC02 | Entrances/routes produce traversable representative network | EV-C | Required |
| P78-AC03 | Required content-access validation/fallback works | EV-B negative | Required |
| P78-AC04 | Deep Overworld is finite/bounded according to current FCC | EV-A / EV-B | Required |
| P78-AC05 | Resource/geology integration respects region/depth rules | EV-B | Required |
| P78-AC06 | Player edits persist | EV-D | Required |
| P78-AC07 | Cave generation/traversal stays within provisional budget | EV-E | Required |
| P78-AC08 | Final SHA/CI passes | EV-H | Required |

## P78.20 Negative tests

- sealed required route;
- cave crosses invalid world boundary;
- generator-order change;
- chunk unload during generation;
- deep-route dead end where anchor requires connection.

## P78.21 Manual acceptance scenario

Find natural entrance.

Descend through cave province.

Follow Deep Route.

Mine/resource/explore.

Return to surface.

Save/reload.

## P78.22 Rule-of-cool target

The underground should feel like:

> **a place beneath the world, not just holes in terrain.**

## P78.23 Exit gate

Production cave/Deep Overworld foundation exists.

## P78.24 Downstream unlock

P79/P80/P82.

## P78.25 Known risks / ADR triggers

- cave algorithm/provider architecture;
- deep-boundary world-coordinate model.

---

# P79 — ECHOES OF THOSE BEFORE

**Classification:** EXPANSION / COOL-PULL  
**Arc:** ARC X  
**Player/creator payoff:** Ruins, shrines, camps and forgotten sites give the generated world visible history and discovery.

## P79.1 Purpose

Create world-structure/ruin placement and persistent site-state foundation.

## P79.2 Authoritative source packet

- Structures canon;
- World Content Atlas;
- P39–P41 Structure Forge;
- P73–P78 worldgen;
- Quest/Event history hooks;
- ART-03 culture/architecture.

## P79.3 Entry gate

- Structure Forge;
- regional worldgen;
- biome/cave compatibility.

## P79.4 Dependencies

P40/P41, P73–P78.

## P79.5 Universal primitives used

- Identity;
- State;
- Composition;
- History;
- Knowledge;
- Ownership;
- Result/Reason.

## P79.6 In scope

World-site definition/placement:

- stable site identity;
- structure source;
- placement constraints;
- biome/terrain compatibility;
- spacing;
- culture/history tag;
- state variant:
  - intact;
  - ruined;
  - damaged;
  - occupied;
  - abandoned;
  - corrupted/blessed hook;
- loot/interaction anchors;
- discovery knowledge;
- restoration/claim hooks;
- persistence;
- deterministic placement.

## P79.7 Explicit non-scope

- full dungeon runtime;
- settlements/cities;
- giant megadungeons;
- every ruin family;
- quest system overhaul.

## P79.8 Implementation capability requirements

Ruins are normal structure instances with state/history.

No separate static-world-prop identity for consequential sites.

## P79.9 Forge requirements

Structure Forge source with world-placement profile.

## P79.10 Runtime requirements

Worldgen produces site placement; persistent state overlays future changes.

## P79.11 Canonical content subset

- small ruin;
- shrine;
- camp/abandoned worksite;
- cave/deep landmark.

## P79.12 Persistence implications

Cleared/restored/damaged state persists.

## P79.13 Multiplayer / authority implications

Shared world site state authoritative.

## P79.14 Simulation-LOD implications

Site summary persists unloaded.

## P79.15 Accessibility / localisation implications

Discoverability via multiple cues.

## P79.16 Performance implications

Placement index/streaming bounded.

## P79.17 Security / trust implications

Loot/interaction generated transactionally.

## P79.18 Recommended child decomposition

- P79-A — world-site profile;
- P79-B — placement/spacing;
- P79-C — state/history variants;
- P79-D — discovery/knowledge;
- P79-E — persistence/content fixtures;
- P79-F — reconciliation.

## P79.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P79-AC01 | Site placement deterministic for seed/version | EV-B | Required |
| P79-AC02 | Placement respects biome/terrain/spacing constraints | EV-B | Required |
| P79-AC03 | Site uses normal Structure Forge source | EV-A / EV-B | Required |
| P79-AC04 | Cleared/damaged/restored state survives reload | EV-D | Required |
| P79-AC05 | Player knowledge only updates on valid discovery/source | EV-B | Required |
| P79-AC06 | Placement/streaming remains bounded | EV-E | Required |
| P79-AC07 | Representative sites pass ART/world-read review | EV-F / EV-G | Required |
| P79-AC08 | Final SHA/CI passes | EV-H | Required |

## P79.20 Negative tests

- invalid terrain;
- overlapping critical site;
- duplicate stable site;
- site removed after discovery;
- restore/damage cycle.

## P79.21 Manual acceptance scenario

Generate world.

Find ruin naturally.

Discover/map it.

Modify/clear/restoration state.

Leave/reload.

## P79.22 Rule-of-cool target

The world begins implying:

> **other people were here long before you.**

## P79.23 Exit gate

Persistent generated world sites work.

## P79.24 Downstream unlock

P80/P81/P82.

## P79.25 Known risks / ADR triggers

- deterministic site-ID derivation.

---

# P80 — DOORS INTO DARKNESS

**Classification:** FORGE-FIRST / COOL-PULL  
**Arc:** ARC X  
**Player/creator payoff:** Developers can build reusable voxel dungeons with topology, encounters, locks, traps, rewards and state through The Forge.

## P80.1 Purpose

Create Dungeon Forge v1 and dungeon runtime composition model.

## P80.2 Authoritative source packet

- Structures/Dungeons canon;
- FCC dungeon families;
- P39/P40 Structure Forge;
- P61 Signal & Logic;
- P70 ritual/hazard composition where relevant;
- combat/creatures;
- loot/resource;
- Quest/Event hooks.

## P80.3 Entry gate

- P79 world-site;
- Structure Forge;
- combat/creatures;
- Signal Forge.

## P80.4 Dependencies

P31, P40/P41, P61, P79.

## P80.5 Universal primitives used

- Identity;
- State;
- Composition;
- Connection;
- Permission;
- Knowledge;
- History;
- Result/Reason.

## P80.6 In scope

Dungeon source:

- identity/family;
- entrance;
- topology graph;
- room/module library;
- route/door connection;
- locks/keys;
- encounter zones;
- creature/spawn profiles;
- trap/puzzle signals;
- hazard zones;
- rest/safe hook;
- loot/reward anchors;
- boss/authority hook;
- progression gates;
- state:
  - undiscovered;
  - active;
  - cleared;
  - resettable/non-resettable rules;
  - occupied/reclaimed;
- deterministic assembly/variation if used;
- validation;
- Test Lab.

## P80.7 Explicit non-scope

- every FCC dungeon;
- final boss catalogue;
- unrestricted scripting;
- MMO reset loops;
- every procedural-generation strategy.

## P80.8 Implementation capability requirements

Dungeon is a composition of normal systems.

Trap uses Signal/Logic + hazard/combat.

Door uses permission/lock.

Encounter uses creatures.

Reward uses inventory/transaction.

## P80.9 Forge requirements

Specialist orchestrates Structure/Creature/Signal/VFX/Sound.

## P80.10 Runtime requirements

Persistent site/dungeon state.

## P80.11 Canonical content subset

One compact dungeon family for First Expedition.

## P80.12 Persistence implications

Discovery/clearing/locks/loot/state persist according to profile.

## P80.13 Multiplayer / authority implications

Shared dungeon state future-authoritative.

## P80.14 Simulation-LOD implications

Inactive dungeon summary; active encounters local.

## P80.15 Accessibility / localisation implications

Traps/puzzles/telegraphs have multi-channel cues.

## P80.16 Performance implications

Module assembly/nav/collision/effects bounded.

## P80.17 Security / trust implications

No arbitrary scripts; loot one-time semantics.

## P80.18 Recommended child decomposition

- P80-A — dungeon/topology schema;
- P80-B — Dungeon Forge;
- P80-C — encounter/lock/trap composition;
- P80-D — procedural/module assembly if used;
- P80-E — persistence/Test Lab;
- P80-F — golden dungeon/reconciliation.

## P80.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P80-AC01 | Dungeon source authored/validated through Forge | EV-B / EV-C | Required |
| P80-AC02 | Topology/module connections validate | EV-B | Required |
| P80-AC03 | Trap/puzzle uses bounded Signal/normal systems | EV-B / EV-C | Required |
| P80-AC04 | Encounter uses normal creature/combat systems | EV-C | Required |
| P80-AC05 | Loot/reward cannot duplicate on reload/re-entry | EV-B negative / EV-D | Required |
| P80-AC06 | Cleared/discovered state persists | EV-D | Required |
| P80-AC07 | Critical path/required progression validates reachable | EV-B | Required |
| P80-AC08 | Accessible telegraph/puzzle review passes | EV-F / EV-G | Required |
| P80-AC09 | Final SHA/CI passes | EV-H | Required |

## P80.20 Negative tests

- disconnected critical path;
- missing key;
- trap loop;
- boss room unreachable;
- loot reload;
- module dependency missing.

## P80.21 Manual acceptance scenario

Author compact dungeon.

Validate.

Generate/place.

Enter.

Solve trap/lock.

Fight encounter.

Claim reward.

Leave/reload/re-enter.

## P80.22 Rule-of-cool target

The first real:

> **“There's a door in that ruin... where the hell does it go?”**

moment.

## P80.23 Exit gate

Dungeon Forge/runtime exists.

## P80.24 Downstream unlock

P81/P82.

## P80.25 Known risks / ADR triggers

- topology/procedural assembly representation;
- dungeon state/reset policy.

---

# P81 — MAP WHAT YOU KNOW

**Classification:** FORGE-FIRST / FOUNDATION  
**Arc:** ARC X  
**Player/creator payoff:** The player can physically map explored regions, record discoveries and carry knowledge through the world without receiving omniscient map information.

## P81.1 Purpose

Implement MAP-00 cartography/discovery foundation.

## P81.2 Authoritative source packet

- MAP-00 locked cartography system;
- PROD-05 Knowledge;
- P73–P80 worldgen/discovery;
- ART-08 map/UI presentation;
- Item/Inventory systems.

## P81.3 Entry gate

- regional world identity/coordinates;
- world sites/biomes available;
- Knowledge contract stable.

## P81.4 Dependencies

P13, P73–P80.

## P81.5 Universal primitives used

- Knowledge;
- Identity;
- State;
- Provenance;
- History;
- Route;
- Ownership;
- Result/Reason.

## P81.6 In scope

Field Map object:

- map identity;
- owner/holder;
- region/coverage;
- scale;
- source;
- explored coverage;
- unknown coverage;
- terrain/biome abstraction;
- player-position indicator where legitimately available;
- discovered landmarks;
- route marks;
- annotations;
- confidence/provenance;
- copy lineage;
- map copying;
- map trading/sharing hook;
- cartography table/survey upgrade hook;
- physical held/inspect interaction;
- save/load.

Discovery system:

- direct observation;
- physical exploration;
- surveyed feature;
- copied information;
- dialogue/report;
- record;
- magical evidence;
- quest evidence.

Cartography Forge/editor support may author:

- map styles;
- symbol sets;
- survey profiles;
- map-product rules.

## P81.7 Explicit non-scope

- universal GPS;
- fully revealed world atlas;
- instant menu fast-travel;
- omniscient quest pins;
- satellite photography;
- final magical relief map feature set if MAP-00 stages it later.

## P81.8 Implementation capability requirements

A field map forgotten in storage does not remotely update from player travel.

Map knowledge must have source/provenance.

## P81.9 Forge requirements

UI/Icon/2D final Forge arrives later P130, but P81 may use current ART-08-compliant authoring hooks.

## P81.10 Runtime requirements

Map queries Knowledge service, not raw world truth.

## P81.11 Canonical content subset

- one Field Map;
- cartography table/survey tool fixture;
- standard landmark symbols.

## P81.12 Persistence implications

Coverage/annotations/provenance/copy state persist.

## P81.13 Multiplayer / authority implications

Maps can later be shared/copied/traded as objects with bounded knowledge snapshots.

## P81.14 Simulation-LOD implications

Map data independent of current chunk loading.

## P81.15 Accessibility / localisation implications

Map symbols/text/high contrast; unknown/known not colour-only.

## P81.16 Performance implications

Map update/caching bounded.

## P81.17 Security / trust implications

Map object cannot query undiscovered authoritative sites directly.

## P81.18 Recommended child decomposition

- P81-A — map item/knowledge record;
- P81-B — exploration recording;
- P81-C — landmark/provenance/annotations;
- P81-D — physical map interaction/rendering;
- P81-E — copy/share/survey hooks;
- P81-F — persistence/accessibility/reconciliation.

## P81.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P81-AC01 | Unexplored map area remains unknown | EV-B / EV-C | Required |
| P81-AC02 | Map updates only through authorised mapping/exploration rules | EV-B | Required |
| P81-AC03 | Engine-known undiscovered ruin is absent until knowledge acquired | EV-B negative | Required |
| P81-AC04 | Landmark records provenance/source | EV-B | Required |
| P81-AC05 | Player annotations persist on map object | EV-D | Required |
| P81-AC06 | Copied map preserves snapshot/lineage without unintended live sync | EV-B / EV-D | Required |
| P81-AC07 | Map in storage does not remotely reveal travels | EV-B negative | Required |
| P81-AC08 | Map presentation passes ART-08/accessibility review | EV-F / EV-G | Required |
| P81-AC09 | Final SHA/CI passes | EV-H | Required |

## P81.20 Negative tests

- map not carried/equipped under mapping policy;
- undiscovered ruin;
- copy then source updated;
- annotation deletion/reload;
- realm/orientation interference hook.

## P81.21 Manual acceptance scenario

Carry blank/partial map.

Explore region.

Discover ruin.

Annotate.

Return to settlement.

Copy map.

Travel without map.

Compare source/copy/unused map knowledge.

## P81.22 Rule-of-cool target

The map should feel like:

> **something the player made by being there.**

## P81.23 Exit gate

Knowledge-grounded cartography works.

## P81.24 Downstream unlock

P82 and later travel/economy/maritime maps.

## P81.25 Known risks / ADR triggers

- map raster/vector/voxel-relief representation;
- precision/location policy.

---

# P82 — THE FIRST EXPEDITION

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC X  
**Player/creator payoff:** The player leaves civilisation, crosses a living generated region, survives the weather, maps discoveries, descends underground, explores a ruin/dungeon and returns home with real knowledge and resources.

## P82.1 Purpose

Certify ARC X and the first complete exploration/adventure loop.

## P82.2 Authoritative source packet

- P73–P81;
- P12–P31 survival/combat;
- P63 town;
- P64–P72 magic;
- current exploration/progression/world canon.

## P82.3 Entry gate

- P73–P81 COMPLETE;
- stable settlement starting point;
- representative combat/magic content available.

## P82.4 Dependencies

P73–P81 plus earlier survival/combat/magic systems.

## P82.5 Universal primitives used

Broad integration set, especially Knowledge/History/Route/State.

## P82.6 In scope

A production expedition scenario:

- depart working settlement;
- carry map/supplies;
- traverse multiple biomes;
- experience weather;
- discover natural/resource landmark;
- harvest/gather ecology resource;
- locate cave entrance;
- descend cave/deep route;
- discover world structure/ruin;
- enter compact dungeon;
- encounter creature/hazard;
- use tool/combat/magic;
- obtain meaningful resource/knowledge/reward;
- update map legitimately;
- return to settlement;
- retain world/site/map/history state;
- save/reload/continue.

## P82.7 Explicit non-scope

- realms;
- oceans;
- regional trade;
- full quest campaign;
- every biome/dungeon;
- final Tutorial World.

## P82.8 Implementation capability requirements

No bespoke expedition controller.

The scenario emerges from normal systems.

## P82.9 Forge requirements

All content authored through normal World/Biome/Flora/Structure/Dungeon/Magic services.

## P82.10 Runtime requirements

Worldgen/streaming/persistence/knowledge all compose.

## P82.11 Canonical content subset

One golden expedition region/seed family.

It may use a locked regression seed plus random-seed validation set.

## P82.12 Persistence implications

Critical:

- discovered map;
- harvested/edited world;
- cleared site;
- dungeon reward;
- player inventory/knowledge;
- weather/world time;
- return state.

## P82.13 Multiplayer / authority implications

Future-safe shared world state.

## P82.14 Simulation-LOD implications

Settlement may continue P55/P63 bounded production while player explores.

## P82.15 Accessibility / localisation implications

Exploration, hazards, map and dungeon critical cues support accessibility profiles.

## P82.16 Performance implications

End-to-end streaming/worldgen/caves/weather/ecology/structures/dungeon combined benchmark.

## P82.17 Security / trust implications

Reward/loot/site state no duplication.

## P82.18 Recommended child decomposition

- P82-A — expedition regression seed/content;
- P82-B — region/biome/weather traversal;
- P82-C — ecology/cave/ruin integration;
- P82-D — dungeon/combat/magic;
- P82-E — map/knowledge/return/persistence;
- P82-F — performance/human review;
- P82-G — PG-10 reconciliation.

## P82.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P82-AC01 | Expedition world generated through P73–P80 normal systems | EV-A / EV-C | Required |
| P82-AC02 | Player crosses multiple coherent biomes/weather states | EV-C / EV-F | Required |
| P82-AC03 | Ecology/resource interaction uses real persistent state | EV-B / EV-C | Required |
| P82-AC04 | Cave/Deep Route traversal functions | EV-C | Required |
| P82-AC05 | Ruin/dungeon discovery updates knowledge/map only when legitimately discovered | EV-B / EV-C | Required |
| P82-AC06 | Dungeon reward/site state cannot duplicate after reload | EV-D / EV-B | Required |
| P82-AC07 | Settlement can continue bounded away work while expedition runs | EV-D | Required |
| P82-AC08 | Return preserves map, knowledge, loot/resources and world changes | EV-D | Required |
| P82-AC09 | End-to-end performance remains within provisional expedition target | EV-E | Required |
| P82-AC10 | Accessibility profile preserves major hazards/discovery cues | EV-F | Required |
| P82-AC11 | Human review confirms exploration feels coherent, surprising and earned | EV-G | Required |
| P82-AC12 | No bespoke expedition-only gameplay controller exists | EV-A / review | Required |
| P82-AC13 | Final SHA/CI passes | EV-H | Required |

## P82.20 Negative tests

- map left at home;
- weather effects reduced;
- cave route obstruction edge case;
- dungeon reward reload;
- settlement output full while away;
- world save during dungeon;
- source site discovered by engine but not player.

## P82.21 Manual acceptance scenario

Prepare at town.

Take supplies/map.

Travel.

Survive changing region/weather.

Discover and map landmark.

Harvest.

Descend cave.

Find ruin.

Complete dungeon.

Return to town.

Compare settlement changes while away.

Save/reload.

Review map/history/inventory/world state.

## P82.22 Rule-of-cool target

The desired feeling is:

> **“I left home with a blank piece of map and came back with a story.”**

## P82.23 Exit gate — PG-10 WORLD & EXPLORATION FOUNDATION

PG-10 passes when:

- P73–P82 COMPLETE;
- regional deterministic worldgen works;
- World/Biome/Ecology/Dungeon Forge services work;
- weather/caves/structures are real world systems;
- maps reflect player knowledge rather than engine omniscience;
- the First Expedition works end to end.

## P82.24 Downstream unlock

ARC XI — ROADS OF GOLD & DUST:

- economy/exchange;
- merchants/markets;
- land transport;
- regional routes;
- caravans;
- route events;
- freight;
- living regional economy.

## P82.25 Known risks / ADR triggers

- integrated streaming/worldgen performance;
- knowledge/world-state reconciliation edge cases.

---

# 05. Arc IX Integration Gate — PG-09 Summary

PG-09 requires:

| Capability | Parent |
| --- | --- |
| Fluxion foundation | P64 |
| Rune Forge | P65 |
| Spell Forge | P66 |
| Player magic | P67 |
| Magical infrastructure | P68 |
| Alchemy Forge | P69 |
| Ritual Forge | P70 |
| Magitech / Golem hook | P71 |
| Impossible Instrument | P72 |

Minimum end-to-end scenario:

```text
discover/refine Flux
→ author/craft rune
→ learn/equip spell
→ cast
→ power magical infrastructure
→ process alchemy
→ perform ritual
→ connect Flux to machine
→ play Flux-powered instrument
→ save/reload
```

Every step must use normal authoritative resource/state systems.

---

# 06. Arc X Integration Gate — PG-10 Summary

PG-10 requires:

| Capability | Parent |
| --- | --- |
| Regional Worldgen Contract | P73 |
| World Forge | P74 |
| Biome Forge | P75 |
| Flora/Ecology/Agriculture foundation | P76 |
| Weather & Seasons | P77 |
| Cave Provinces / Deep Overworld | P78 |
| World Structures / Ruins | P79 |
| Dungeon Forge | P80 |
| Cartography / Discovery | P81 |
| First Expedition | P82 |

Minimum end-to-end:

```text
seed world
→ generate region
→ traverse biomes
→ experience weather/ecology
→ discover cave
→ enter deep route
→ find ruin/dungeon
→ survive encounter
→ obtain resource/knowledge
→ map discovery
→ return home
→ save/reload
```

---

# 07. Recommended Production Concurrency

The roadmap order remains default.

## P64/P65/P66

Rune schema and Spell Forge planning may overlap after Flux cost/identity contracts stabilise.

P66 must not invent its own Flux or rune semantics.

## P68/P69/P70

These specialist Forge workflows may overlap because they use separate source domains.

They must share Flux, knowledge, presentation, structure and transaction services rather than duplicate them.

## P73/P74/P75

World Forge UI/source work can begin during late P73 once deterministic contracts are stable.

Biome Forge can begin against controlled region fields before all World Forge UX is final.

## P76/P77

Ecology and weather should coordinate environmental contracts.

Neither should own the other's authoritative state.

## P78/P79/P80

Caves, world structures and dungeon work may overlap using controlled test regions after regional placement interfaces stabilise.

---

# 08. What Must NOT Sneak Into Arcs IX–X

## Magic

- realm portals;
- leylines at civilisation scale;
- complete golem catalogue;
- every school;
- full forbidden-magic world simulation;
- model-based magic generation.

## World

- oceans/naval runtime;
- all Overworld biome content immediately;
- all structures;
- every FCC dungeon;
- realms;
- regional economy;
- final world-creation UI.

## Mapping

- omniscient minimap;
- global automatic pins;
- universal GPS precision;
- free fast travel.

---

# 09. Cross-Arc Architectural Discoveries Locked Here

## 09.1 Flux is both player magic and civilisation infrastructure

P64 explicitly prevents two incompatible systems such as `PlayerMana` and `MachineMana` from becoming separate truths.

They may have different storage/capacity rules, but both belong to one Flux resource/domain family.

## 09.2 Progression Forge remains shared rather than multiplying specialist unlock editors

Rune/Spell/Alchemy/Ritual sources all need discovery, knowledge, research, teaching and progression.

If tooling is required, one shared Progression/Unlock authoring service should be created as governed child work rather than four private versions.

## 09.3 Golemancy inherits civilisation systems

A golem is:

> **entity + body + ownership + Flux + bounded work capability**

not a separate magical NPC engine.

## 09.4 The pipe organ is now a formal composability certification

P72 exists precisely because architecture can appear correct while remaining impossible to combine creatively.

The impossible instrument forces structure, signals, music, mechanical movement, Flux, runes and presentation to coexist.

## 09.5 Worldgen semantic determinism outranks execution order

Multithreading may change completion timing, chunk-ready order and transient logs.

It may not silently alter canonical generated content where deterministic outcome is required.

## 09.6 World Forge is an authored generator, not a terrain painter

This preserves seed-driven production worlds while still giving designers powerful control.

## 09.7 Agriculture is now routed into ecology rather than left orphaned

P76 provides the base contracts for crop lifecycle, planting/harvest and domesticated-animal service hooks.

Later settlement production can expand content/depth without creating a second environment model.

## 09.8 The finite Deep Overworld is distinct from Impossible Deep

P78 owns deep Overworld geology/caves.

The **Impossible Deep** remains a separate persistent realm to be implemented in ARC XIV.

## 09.9 MAP-00 makes knowledge physical

A map is not just UI.

It is:

- an owned object;
- a knowledge record;
- provenance;
- history;
- discovery;
- potentially tradeable/copyable information.

This becomes important for later economy, caravans, maritime charts and factions.

---

# 10. Recommended Persistent Regression Fixtures

Retain:

- P64 Flux buffer/transfer fixture;
- P65 rune-host fixture;
- P66 three-spell source set;
- P67 player casting arena;
- P68 ward/conduit fixture;
- P69 safe/risky alchemy fixtures;
- P70 ritual circle fixture;
- P71 hybrid magitech machine;
- P71 bounded utility-golem fixture if included;
- P72 Impossible Instrument;
- P73 deterministic regional seed set;
- P74 World Forge seed-comparison fixture;
- P75 representative biome transition region;
- P76 ecology/crop lifecycle fixture;
- P77 weather accessibility fixture;
- P78 cave province/Deep Route seed;
- P79 persistent ruin;
- P80 compact golden dungeon;
- P81 physical Field Map fixture;
- P82 First Expedition regression world/seed.

P72 and P82 should become long-lived integration fixtures.

---

# 11. ProductionRegistry Seed Entries

```text
P064 — The Ley Revealed
P065 — Signs of Power
P066 — Words That Change the World
P067 — Fire in the Palm
P068 — Lanterns Against the Dark
P069 — Bottled Wonders
P070 — Circles of Power
P071 — The Arcane Engine
P072 — The Impossible Instrument
P073 — The Shape of Continents
P074 — Worldwright
P075 — Where Earth Becomes Place
P076 — The Green Between Stones
P077 — Sky With Teeth
P078 — Beneath the Roots
P079 — Echoes of Those Before
P080 — Doors Into Darkness
P081 — Map What You Know
P082 — The First Expedition
```

No status becomes READY because this document exists.

---

# 12. Open Decisions Deliberately Deferred to Execution Evidence

PROD-11 does not silently decide:

- exact Flux numeric units;
- exact personal Flux regeneration model;
- exact rune stacking order;
- exact spell balance/cooldowns;
- exact spell targeting implementation;
- exact alchemy quality formula;
- exact ritual participant limits;
- exact ward coverage formula;
- exact golem content breadth;
- exact world region size;
- exact continental algorithm;
- exact biome count implemented in first batch;
- exact ecological carrying-capacity model;
- exact crop growth timings;
- exact weather-front algorithm;
- exact cave algorithm;
- exact Deep Overworld depth/boundary coordinates;
- exact dungeon procedural assembly strategy;
- exact map rendering representation.

Each becomes a bounded production decision/proof when required.

---

# 13. PROD-11 Acceptance Gate

PROD-11 is ready for owner lock when the owner agrees that:

- [ ] P64–P82 retain PROD-02 names/order;
- [ ] Fluxion/Flux is the production magic-energy family and legacy mana terminology is treated through explicit canon/migration rather than duplicate systems;
- [ ] Flux/materials/catalysts remain real conserved resources;
- [ ] magic supports industry rather than invalidating it;
- [ ] no universal player corruption meter is introduced by default;
- [ ] runes and spells are bounded semantic compositions, not arbitrary scripts;
- [ ] Spell Forge reuses shared Animation/VFX/Lighting/Sound services;
- [ ] player casting owns authoritative cost/target/effect independently of presentation;
- [ ] magical infrastructure uses universal typed network contracts;
- [ ] Alchemy reuses Recipe/Transaction infrastructure;
- [ ] rituals are physical world compositions with real geometry/resources/participants/conditions;
- [ ] golemancy is routed through Entity/Task/Flux systems rather than a separate AI engine;
- [ ] P72 requires no bespoke Pipe Organ gameplay system;
- [ ] regional worldgen stores master seed/generator version and uses named sub-seeds;
- [ ] required deterministic worldgen is independent of request/worker order;
- [ ] World Forge authors generator rules rather than replacing seed-generated worlds with handcrafted terrain;
- [ ] biomes are ecological/world contracts rather than palette swaps;
- [ ] P76 includes bounded agriculture/husbandry foundations so domesticated ecology is not orphaned;
- [ ] weather gameplay remains authoritative when effects are reduced;
- [ ] P78 Deep Overworld is finite and separate from the Impossible Deep realm;
- [ ] generated ruins use normal Structure Forge source/state;
- [ ] Dungeon Forge composes existing systems rather than unrestricted scripts;
- [ ] MAP-00 knowledge rules govern P81;
- [ ] engine truth never automatically becomes map/player knowledge;
- [ ] P82 First Expedition uses normal systems rather than a bespoke scenario controller;
- [ ] exact balance/algorithm/provider decisions remain evidence-driven.

---

# 14. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-11 — LEYFORGE ARCS IX–X PRODUCTION CONTRACTS — v0.1**
>
> ARC IX establishes Fluxion as an authoritative, conserved magical resource and network domain; Rune Forge, Spell Forge, player casting, magical infrastructure, Alchemy Forge and Ritual Forge build upon that shared truth. Magic remains physical and economic: crystals, catalysts, runes, Flux storage, infrastructure and ritual inputs are real world resources and conditions rather than visual shortcuts. Magic supports and hybridises with automation instead of replacing industry. Bounded golemancy composes the existing entity/task/Flux systems. The Arc culminates in the Impossible Instrument, a Flux-powered voxel pipe organ that must operate through normal Structure, Signal, Music, network and presentation systems without a bespoke organ gameplay engine. ARC X then establishes the deterministic regional Overworld platform: seed/versioned regional generation, World Forge, Biome Forge, Flora/Ecology Forge with agriculture/husbandry foundations, Weather & Seasons, finite cave provinces and Deep Overworld, persistent world structures, Dungeon Forge and MAP-00 knowledge-driven cartography. The First Expedition certifies these systems by letting the player leave a functioning settlement with a partially unknown map, traverse a living generated region, discover caves/ruins/dungeons, gain real resources and knowledge, and return with persistent world and map consequences.

---

# 15. Next Document

After PROD-11 acceptance/reconciliation, continue to:

> **PROD-12 — Arcs XI–XII Production Contracts: P83–P102**

That volume will cover:

- Economy & Exchange Contract;
- Commerce Forge;
- merchants/markets;
- land transport;
- route/travel runtime;
- caravans;
- route events/maintenance;
- regional freight;
- living regional economy;
- Roads of Gold & Dust integration;
- Society/Culture/Faction contract;
- Faction Forge;
- Government & Law Forge;
- governance runtime;
- territory/jurisdiction;
- diplomacy;
- military/war logistics;
- raids/sieges/war;
- occupation/reconstruction/memory;
- Crowns & Consequences integration.

---

**End of PROD-11 v0.1 — Arcs IX–X Production Contracts Candidate**
