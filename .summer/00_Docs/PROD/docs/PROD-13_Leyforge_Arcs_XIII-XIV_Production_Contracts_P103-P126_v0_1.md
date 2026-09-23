
# LEYFORGE PRODUCTION PROGRAMME

## PROD-13 — Arcs XIII–XIV Production Contracts: P103–P126

**Document ID:** PROD-13  
**Title:** Leyforge Arcs XIII–XIV Production Contracts — Call of the Deep Blue / Beyond the Veil  
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
**Previous executable volumes:** PROD-07 through PROD-12  
**Arc scope:** ARC XIII — CALL OF THE DEEP BLUE / ARC XIV — BEYOND THE VEIL  
**Parent slices:** P103–P126  
**Programme gates:** PG-13 Maritime & Naval Foundation, PG-14 Seven-World Realm Foundation  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge implementation, PROD-14 onward

---

# 00. Executive Arc Statement

PROD-13 expands Leyforge beyond ordinary land in two major directions.

ARC XIII turns oceans from scenery into a first-class civilisation, logistics, exploration and combat space.

ARC XIV turns the seven-world cosmology from lore into traversable persistent world systems.

The central promise of ARC XIII is:

> **Water, coasts, ports, vessels, crews and sea routes are authoritative systems that interact with the same resources, structures, professions, economy, weather, combat and history as the rest of Leyforge.**

The central promise of ARC XIV is:

> **A realm is not a reskinned biome. It is a persistent world with its own physical-law profile, hazards, ecology, materials, civilisations, portal rules and progression, while still reusing Leyforge's common runtime and Forge foundations wherever those foundations remain valid.**

The combined progression is:

```text
WATER / LIQUID RUNTIME
→ HYDROLOGY & WATER FORGE
→ WAVES / TIDES / CURRENTS / STORMS
→ PORTS / DOCKS / SHIPYARDS
→ VESSEL CONTRACT
→ VESSEL FORGE
→ MOVING VESSEL RUNTIME
→ CREWS / MARITIME PROFESSIONS
→ SEA ROUTES / TRADE
→ MARINE ECOLOGY / UNDERWATER
→ NAVAL COMBAT / PIRACY / NAVIES
→ STORMBOUND MARITIME CERTIFICATION
→ REALM / PORTAL CONTRACT
→ PORTAL FORGE
→ REALM FORGE
→ FIRST CROSSING
→ VERDANT COVENANT
→ ANCESTRAL VEIL
→ SOMNOLENT EXPANSE
→ ASCENDANT REACH
→ IMPOSSIBLE DEEP
→ ASHEN LOWER REALMS
→ CROSS-REALM LOGISTICS
→ SEVEN WORLDS, ONE LEY
```

---

# 01. Governing Production Rules for P103–P126

## 01.1 Water truth and water presentation remain separate

The authoritative liquid/water layer owns state such as occupancy/volume or another bounded production representation, type, depth/surface query, flow where simulated, source/sink, flooding, immersion and buoyancy inputs.

Presentation owns surface mesh, foam, spray, refraction, caustics, particles, audio and visual wave displacement.

A convincing ocean shader cannot substitute for gameplay water state.

## 01.2 Water is not required to be a naive voxel cellular automaton

Production implementation may use different representations for:

- inland bounded liquids;
- rivers;
- oceans;
- vessel flooding;
- utility fluids.

They must expose coherent shared queries/contracts where systems interact.

Do not force one simulation method onto every scale merely for conceptual purity.

## 01.3 Fluids use typed connections where infrastructure requires them

P57's universal Connection/Port foundation applies to water input/output, drainage, bilge, ballast and later industrial fluids.

World-ocean simulation does not therefore become a machine-pipe graph.

## 01.4 Consequential water state survives chunk/LOD/save transitions

Unloading, streaming, save, retry or simulation LOD must not silently create or delete persistent consequential water state.

## 01.5 Oceans are first-class world regions

Oceans/coasts/islands may own biome/ecology, resources, weather exposure, currents, routes, settlements, structures, hazards, territory, trade and military state.

They are not empty gaps between continents.

## 01.6 Waves, tides and currents remain distinct

- waves communicate local/sea-state motion;
- tides communicate periodic water-level/current influence;
- currents communicate persistent or weather-modified transport fields.

They may interact. They are not one animated normal map.

## 01.7 Vessels are voxel-built functional structures that move

A vessel is composed from canonical blocks, materials and components plus semantic structural roles, service modules, crew/cargo spaces and propulsion/control systems.

A plank used on a ship remains the canonical plank unless upstream canon defines otherwise.

## 01.8 Vessel lifecycle records remain distinct

```text
editable vessel source
→ validated/baked vessel definition
→ construction project
→ commissioned vessel instance
→ mutable runtime vessel state
```

Damage to a vessel instance does not mutate Forge source.

## 01.9 Moving vessel implementation is evidence-driven

Moving voxel vessels remain a known high-risk technical area.

PROD-13 specifies behaviours and evidence, not an unproven implementation.

A production ADR/proof may select transformed vessel-local voxel space, hybrid rigid structures, compiled products or another bounded architecture if it satisfies the contracts.

## 01.10 Occupants and cargo remain persistent identities

When a vessel moves, NPCs, players, cargo, machines, inventories, mounted systems, damage and permissions must remain consistently associated with the vessel/world frames.

## 01.11 Buoyancy is authority; bobbing animation is presentation

Flotation/trim/stability depend on production buoyancy state.

Animation may reflect it but may not fabricate it.

## 01.12 Vessel damage is structural/local where supported

Damage can affect hull integrity, flooding, propulsion, steering, sails/rigging, power, weapons, cargo and crew access.

A summary condition/health value may assist UI but must not erase meaningful component state required by Set 26.

## 01.13 Ports are functioning logistics infrastructure

Port capability depends on water/depth/approach, berth, routes, cargo handling, warehouses, staff, customs/permission, repair/shipyard capability and weather/safety.

## 01.14 Maritime routes reuse Route

Sea routes share origin, destination, capacity, time, risk, ownership/access, cargo commitments and history with land routes while adding maritime-specific draught, current, weather, sea state, hazards and berth requirements.

## 01.15 Marine ecology uses normal ecology principles

Marine life/resources respect water body/biome, depth, temperature/salinity hooks, current, season, habitat, disturbance and harvesting where applicable.

## 01.16 Naval combat consumes real vessels, crews and supply

Navies are not abstract combat modifiers. They depend on ships, crews, ammunition, repairs, provisions, ports, routes and government/faction authority.

## 01.17 Piracy is faction/economic/legal behaviour

No ancestry is inherently pirate or hostile.

## 01.18 Port capture does not automatically transfer private cargo

Occupation/seizure uses normal ownership, jurisdiction and history contracts.

## 01.19 Exactly seven current persistent worlds

1. Overworld
2. Verdant Covenant
3. Ancestral Veil
4. Somnolent Expanse
5. Ascendant Reach
6. Impossible Deep
7. Ashen Lower Realms

No additional persistent realm is activated by PROD-13.

## 01.20 Exactly six current non-Overworld portal families

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

Common runtime infrastructure may exist, but canonical portal families remain distinct.

## 01.21 Deferred realm concepts remain deferred

PROD-13 does not activate World-Engine, Elemental Confluences, playable Void Between progression or Pocket Realm Construction as current persistent worlds.

## 01.22 A realm is not a biome pack

Realm definition can alter physical laws, traversal, worldgen, sky/lighting, time hooks, hazards, fluids, materials, ecology, magic, civilisation, routes and portal behaviour.

Biomes operate inside those realm laws.

## 01.23 Realm-specific laws extend shared systems by default

Realm rules may alter how a system behaves without duplicating Identity, Inventory, Transaction, Route, Permission, Knowledge, History or Composition unless explicit evidence requires a new primitive.

## 01.24 Portal travel is an authoritative transition

A portal transition owns source/destination world/location, actor/party, cargo, permissions, destination availability, save safety, arrival state and failure/recovery.

Presentation cannot move an actor between worlds by itself.

## 01.25 Portals are not unrestricted fast travel

Access may depend on discovery, construction, activation, key/resource, ritual, faction/permission, stabilisation or destination state.

## 01.26 Realm Forge is an orchestrator

Realm Forge composes World, Biome, Structure, Creature, Material, Weather, Audio, VFX, Faction and Portal services.

It does not privately duplicate them.

## 01.27 First Crossing precedes mass realm production

P118 proves one realm end to end before P119–P124 scale all realm production.

## 01.28 Cross-realm imports adapt to local law

Imported structures/machines may require environmental, material, route, pressure, heat, air, anchor or power adaptation.

## 01.29 Realm knowledge remains knowledge-bounded

Engine truth never automatically becomes player/map truth.

---

# 02. ARC XIII — CALL OF THE DEEP BLUE

---

# P103 — WATER THAT REMEMBERS

**Classification:** FOUNDATION  
**Player/creator payoff:** Water becomes persistent gameplay state capable of supporting rivers, floods, swimming, ports and vessels.

## Purpose

Create the production water/liquid runtime foundation.

## Source packet

Set 26 water/liquid authority; P02/P03/P05; P73 worldgen; P77 weather; PROD-03; PROD-05; historical water proofs as evidence only.

## Entry gate

PG-12 COMPLETE and current water technical proof status reviewed.

## In scope

- fluid identity;
- world-space water-body identity;
- surface/depth query;
- immersion;
- bounded source/sink and propagation where applicable;
- containment/flood state;
- swimming/breath hooks;
- block/material interaction hooks;
- chunk continuity;
- generated-base vs persistent-dynamic separation;
- utility fluid-port compatibility;
- save/load and LOD.

## Explicit non-scope

Final waves/tides/currents, vessel buoyancy, full hydrology authoring, arbitrary chemistry.

## Production requirements

Different water scales may use different internal models behind coherent semantic queries.

Large oceans must not require every ocean cell to run active local fluid simulation.

## Recommended child slices

- P103-A — water semantic/query contract;
- P103-B — water bodies/surface/depth;
- P103-C — bounded dynamic water;
- P103-D — immersion/swimming;
- P103-E — persistence/chunk/LOD;
- P103-F — proof/performance/reconciliation.

## Acceptance

1. Water truth is independent of rendering.
2. Stable immersion/depth queries exist.
3. Consequential flow survives boundaries/save.
4. Large water bodies remain bounded.
5. Fluid ports use compatible IDs without sharing the ocean solver.
6. Water edit/chunk stress passes provisional budgets.
7. Final SHA/CI passes.

## Negative tests

Chunk unload during flow; containment edit; repeated surface crossing; save mid-flood; invalid fluid transfer.

## Manual scenario

Enter lake/ocean, swim/dive, modify controlled containment, leave/reload and confirm state.

## Exit gate

Production water foundation proven.

---

# P104 — THE WATERWRIGHT

**Classification:** FORGE-FIRST  
**Player/creator payoff:** Hydrology, shorelines and water bodies can be authored/validated in The Forge.

## Purpose

Create Hydrology & Water Forge v1.

## Source packet

Set 26 hydrology; P73/P74/P75; P103; ART-03/06/07 water authorities.

## In scope

- water-body profile;
- coast/ocean/river/lake/wetland hooks;
- basin/source/sink;
- shoreline/depth;
- flow/current seeds;
- tide exposure;
- seasonal/floodplain hooks;
- biome/ecology references;
- port suitability;
- hazards/navigation;
- deterministic seed preview;
- bounded tanks/channels/drains/flood Test Lab.

## Production rule

Hydrology Forge authors semantic/generative state, not final shader/audio.

## Recommended child slices

- P104-A — hydrology schema;
- P104-B — shoreline/depth/flow tools;
- P104-C — World/Biome integration;
- P104-D — hazard/navigation overlays;
- P104-E — Test Lab/seed preview;
- P104-F — reconciliation.

## Acceptance

Profile authoring works; generation hooks deterministic; port/depth/ecology hooks explicit; invalid configurations fail; preview bounded; final SHA/CI passes.

## Exit gate

Hydrology authoring works.

---

# P105 — TIDEBOUND

**Classification:** COOL-PULL / FOUNDATION  
**Player/creator payoff:** Seas respond mechanically and visibly to waves, tides, currents and storms.

## Purpose

Create Sea-State, Waves, Tides & Currents v1.

## In scope

- wave state: height/period/direction abstraction;
- tides: periodic state and local water-level/current influence;
- currents: direction/speed fields and modifiers;
- storm seas;
- coastal exposure;
- harbour depth influence;
- vessel/route/ecology query inputs;
- presentation/accessibility.

## Explicit non-scope

CFD, perfect wave-body physics, final vessel buoyancy.

## Acceptance

Waves/tides/currents remain distinct; tide can affect configured harbour depth; current affects routes/vessels; weather affects sea state; reduced-effects mode preserves risk; performance remains bounded.

## Manual scenario

Observe tide, travel a current corridor, trigger storm state and inspect navigation changes.

## Exit gate

Production sea-state works.

---

# P106 — HARBOUR LIGHTS

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** Settlements gain functioning docks, harbours and shipyards linking land logistics to the sea.

## Purpose

Create Ports, Docks & Shipyards foundation.

## In scope

- harbour approach/depth;
- berth/mooring;
- cargo staging/loading;
- warehouse link;
- customs/permission;
- repair berth;
- shipyard/slip/dry berth;
- vessel material intake;
- commissioning/launch;
- weather closure;
- beacon/navigation;
- emergency refuge.

## Production rule

A decorative dock with no valid water approach, berth and logistics provides no port service.

## Acceptance

Berth depth/approach validates; cargo uses transactions; customs uses Permission/Jurisdiction; storms can close unsafe operation; shipyard exposes vessel project/launch hooks; state persists.

## Exit gate

Ports and shipyards operational.

---

# P107 — LAW OF THE HULL

**Classification:** FOUNDATION  
**Player/creator payoff:** Leyforge gains one authoritative definition of a functional vessel.

## Purpose

Create the Vessel Contract.

## In scope

- vessel identity/class;
- vessel-local coordinates;
- canonical block/component composition;
- hull/shell;
- keel/frame/support;
- deck/bulkhead;
- superstructure;
- mast/rig foundation;
- propulsion/steering foundations;
- armour/reinforcement;
- service areas;
- compartments;
- flood zones;
- crew stations;
- cargo;
- propulsion/steering;
- anchor/mooring;
- power/Flux hooks;
- weapon mount hooks;
- damage sections;
- mass/draught/buoyancy inputs;
- construction stages;
- repair/refit;
- commissioning;
- runtime bake/instance.

## Core law

Source, bake, construction project, commissioned vessel and mutable runtime state are distinct.

## Acceptance

Canonical registered content only; structural roles/compartments explicit; shared socket contracts; stable commissioned identity; invalid hull/configuration blocks validation; final SHA/CI passes.

## Exit gate

Vessel semantic contract stable.

---

# P108 — SHIPWRIGHT

**Classification:** FORGE-FIRST  
**Player/creator payoff:** A functional voxel vessel can be designed in a guided 3D Vessel Forge.

## Purpose

Create Vessel Forge v1.

## Guided journey

```text
Identity / class
→ hull
→ canonical materials/blocks
→ structural roles
→ compartments
→ deck/access
→ crew stations
→ cargo
→ propulsion
→ steering
→ rigging/moving parts
→ anchor/mooring
→ power/Flux
→ mounts
→ buoyancy/stability preview
→ construction stages
→ damage/flood states
→ presentation
→ validation
→ water Test Lab
→ bake
```

## Tooling

- vessel-local voxel workspace;
- sections/decks;
- waterline/draught;
- mass/centre-of-mass;
- compartment/flood overlays;
- crew routes;
- structural roles;
- ports/sockets;
- rigging topology;
- sail/control groups;
- diagnostics.

## Acceptance

Registered content only; semantic overlays editable; preview uses runtime semantic inputs; exact construction costs compile; invalid vessel cannot be production-ready; water Test Lab launches; golden vessel passes ART review.

## Exit gate

Vessel Forge source pipeline works.


---

# P109 — LAUNCH DAY

**Classification:** COOL-PULL / HIGH-RISK INTEGRATION  
**Player/creator payoff:** A voxel-built vessel can be constructed, launched, boarded, sailed and persisted as a moving part of the world.

## Purpose

Create Moving Vessel Runtime v1 and settle the production movement architecture through evidence.

## Source packet

Set 26 vessel runtime; P103–P108; accepted PRD proof/ADR evidence; PROD-03 persistence/world constraints; ART vessel presentation.

## Entry gate

P108 COMPLETE and moving-vessel architecture evidence sufficient for production.

If proof is inadequate, P109 remains BLOCKED. The roadmap does not grant permission to pretend the architecture is solved.

## In scope

- launch;
- persistent vessel transform;
- propulsion/steering/speed;
- mass/buoyancy/trim/stability;
- grounding/collision;
- anchor/mooring;
- vessel-local occupants;
- boarding/disembarking;
- cargo;
- attached machines/components;
- world↔vessel coordinates;
- chunk interaction;
- damage;
- flooding;
- sinking/disabled states;
- repair;
- save/load;
- active↔regional LOD;
- recovery.

## Explicit non-scope

Full naval combat, fleets, full multiplayer, unsupported arbitrary structural editing while moving.

## Critical production law

The vessel is the same commissioned persistent instance before and after:

- launch;
- movement;
- docking;
- chunk transitions;
- save/reload;
- simulation LOD.

## Recommended child slices

- P109-A — movement architecture ADR;
- P109-B — transform/buoyancy/propulsion;
- P109-C — collision/grounding/mooring;
- P109-D — occupants/cargo/local coordinates;
- P109-E — damage/flood/sink/repair;
- P109-F — persistence/LOD/performance;
- P109-G — reconciliation.

## Acceptance

1. Accepted proof/ADR exists.
2. Vessel identity persists through launch/movement/docking.
3. Occupants/cargo do not duplicate or disappear.
4. Buoyancy/stability use authoritative mass/water inputs.
5. Grounding/collision/mooring behave predictably.
6. Flooding/damage can impair/sink the vessel.
7. Save/reload at sea restores coherent state.
8. Active↔regional transition preserves state.
9. Representative benchmarks pass.
10. Final SHA/CI passes.

## Negative tests

Save during turn; chunk transition; passenger boarding; cargo transfer while moving; hull breach; sinking; occupied berth; LOD mid-voyage.

## Manual scenario

Construct vessel → launch → board with cargo → sail → dock → damage/flood → repair → save/reload at sea → return.

## Rule-of-cool target

> **The voxel ship actually fucking moves.** 😂🔥

## Exit gate

Moving vessel production architecture proven.

---

# P110 — ALL HANDS

**Classification:** FOUNDATION / INTEGRATION  
**Player/creator payoff:** Vessels can be operated by real crews with maritime jobs, shifts, supplies and stations.

## Purpose

Create Maritime Professions & Crew Runtime.

## In scope

Maritime role families:

- captain/master;
- helmsperson;
- navigator;
- deck crew/sail handling;
- engineer/mechanic where applicable;
- shipwright/repair;
- cargo handler;
- lookout;
- cook/provision hook;
- marine/guard hook.

Crew state:

- vessel assignment;
- role;
- watch/shift;
- station;
- cabin/berth;
- food/water/provisions;
- morale/needs hooks;
- command authority;
- emergency station;
- repair/damage work;
- leave/replacement;
- regional voyage summary.

## Core law

Crew are normal persistent NPCs using the same Profession/Work/Task systems as land settlements.

No permanent `ShipCrewAI`.

## Acceptance

Crew identities persist; maritime roles use P49/P50; stations reserve work positions; missing critical roles affect vessel capability; provisions are real resources; active↔regional state reconciles; final SHA/CI passes.

## Exit gate

Crew simulation works.

---

# P111 — BLUE ROADS

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** Maritime routes connect ports into the same real trade and travel economy as roads and caravans.

## Purpose

Create Maritime Trade & Travel Runtime.

## In scope

- origin/destination ports;
- maritime Route record;
- vessel/draught compatibility;
- current;
- sea state;
- weather;
- navigation hazards;
- travel time;
- capacity;
- danger;
- customs;
- freight manifest;
- passenger hook;
- convoy hook;
- charts/knowledge;
- regional voyage summary;
- arrival/berth.

## Core law

Maritime freight remains normal P90 freight.

There is no separate `SeaCargo` ownership universe.

## Acceptance

Maritime route derives from Route; draught/port compatibility enforced; cargo uses normal freight; sea state affects voyage; vessel/crew/cargo persist in regional travel; unknown hazards aren't leaked to charts; final SHA/CI passes.

## Manual scenario

Load port cargo → depart → current/weather change → arrive/unload → inspect stock/economy.

## Exit gate

Maritime travel/trade works.

---

# P112 — BENEATH THE SURFACE

**Classification:** COOL-PULL / EXPANSION  
**Player/creator payoff:** Oceans gain marine life, underwater resources, diving and meaningful submerged exploration.

## Purpose

Create Marine Ecology & Underwater Exploration v1.

## In scope

### Marine ecology

- habitat/water biome;
- depth;
- temperature/salinity hooks;
- currents;
- reefs/kelp/seabed;
- creature suitability;
- harvest/regeneration;
- disturbance.

### Underwater exploration

- swimming/diving;
- breath;
- pressure/depth hook;
- visibility;
- underwater movement;
- equipment requirements;
- resource gathering;
- submerged ruins/wrecks;
- map/chart discovery;
- underwater presentation;
- rescue/recovery hook.

## Explicit non-scope

Impossible Deep realm, full submarine technology, all marine content.

## Core law

Underwater content uses normal Ecology, Creature, Structure, Resource and Knowledge systems under water-specific environmental conditions.

## Acceptance

Habitat rules matter; diving/breath/depth state authoritative; harvest/loot conserved; wreck discovery follows Knowledge; marine ecology/LOD bounded; underwater accessibility passes; final SHA/CI passes.

## Manual scenario

Sail to reef → dive → gather → discover wreck → map → return.

## Exit gate

Marine/underwater exploration works.

---

# P113 — BROADSIDE

**Classification:** COOL-PULL / INTEGRATION  
**Player/creator payoff:** Ships can fight, flee, board, capture and sink through persistent vessel, crew, faction and logistics systems.

## Purpose

Create Naval Combat, Piracy & Navy Runtime v1.

## In scope

### Naval combat

- vessel combat state;
- weapon mounts;
- ammunition;
- firing arcs/range/reload;
- hull/component damage;
- propulsion/steering/rigging damage;
- fire/flooding;
- crew casualties/tasks;
- surrender;
- boarding;
- capture;
- salvage;
- sinking;
- rescue;
- battle history.

### Piracy

- faction/legal classification;
- unlawful raiding under jurisdiction;
- cargo theft through transactions;
- reputation/law consequences;
- surrender/payment hooks.

### Navy

- government/faction fleet membership;
- patrol/escort/blockade hooks;
- port supply;
- repair/provision;
- military orders;
- route protection.

## Core law

Naval combat changes the same persistent vessel instance.

No combat-copy ship.

Piracy is faction/legal/economic behaviour, never ancestry.

## Acceptance

Weapons consume real ammunition where applicable; damage affects persistent vessel state; component damage changes capability; boarding uses normal people/combat; capture changes ownership without duplicating cargo; piracy classification is social/legal; distant encounters leave explicit outcomes; performance passes.

## Manual scenario

Escort cargo vessel → encounter pirate → fight/disable → alternate surrender/boarding/capture → return damaged ship → repair.

## Exit gate

Naval combat/piracy/navy foundation works.

---

# P114 — STORMBOUND

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** A full maritime expedition can trade, survive storms, dive, fight at sea and return with persistent consequences.

## Purpose

Certify ARC XIII.

## Golden scenario

- functioning port;
- vessel built in shipyard;
- crew assigned;
- cargo loaded;
- chart/sea route;
- tide/current;
- departure;
- regional voyage;
- storm;
- navigation response;
- distant port/trade;
- underwater/wreck exploration;
- piracy/naval encounter;
- damage/flooding;
- repair/resupply;
- return voyage;
- cargo/economy reconciliation;
- save/reload/LOD.

## Core law

No bespoke `StormboundScenarioController`.

## Acceptance

1. Vessel created through normal Vessel Forge/shipyard path.
2. Crew/cargo persist through voyage/LOD.
3. Tide/current/weather materially affect route.
4. Underwater exploration uses normal systems.
5. Naval encounter damages same vessel.
6. Cargo/port economy reconciles exactly.
7. Save/reload works across maritime phases.
8. Combined performance passes.
9. Human review confirms ocean feels systemic.
10. No bespoke integration controller.
11. Final SHA/CI passes.

## Manual scenario

Build/load → depart → tide/current → storm → trade → dive wreck → pirate encounter → damage → return → repair/unload.

## Rule-of-cool target

> **“We left harbour with a plan and came back with a fucking sea story.”** 😂🔥

## Exit gate — PG-13 MARITIME & NAVAL FOUNDATION

PG-13 passes only when P103–P114 are COMPLETE and water, vessels, crews, routes, trade, underwater exploration and naval combat compose without resource/identity corruption.

---

# 03. ARC XIV — BEYOND THE VEIL

ARC XIV asks whether Leyforge can change the laws of the world without discarding the systems already built.

The answer must be:

> **Yes — through explicit realm law, portal transitions and composed adaptations.**

---

# P115 — THE LAW OF THRESHOLDS

**Classification:** FOUNDATION  
**Player/creator payoff:** Realm travel gains one authoritative contract for worlds, portals, hazards and persistent cross-world identity.

## Purpose

Create Realm & Portal Contract.

## Source packet

Current realm/dimension canon; FCC realm authorities; ART-03 seven-world scope; P73/P81/P95/P64/P70; PROD-03 persistence/world identity.

## Realm definition

- realm identity;
- persistent-world ID;
- worldgen profile;
- physical-law profile;
- time hook;
- gravity/movement;
- atmosphere/environment;
- fluid profile;
- hazards;
- material/content scope;
- ecology;
- magic profile;
- civilisation/faction scope;
- route semantics;
- save/streaming identity;
- cartography/knowledge;
- import/export compatibility;
- portal family;
- arrival rules;
- recovery.

## Portal definition

- portal family/identity;
- source compatibility;
- destination realm;
- anchor/frame;
- activation;
- key/resource/ritual requirement;
- Flux/power;
- permission;
- stability;
- throughput;
- actor/cargo rules;
- arrival anchor;
- blocked/damaged/corrupted states;
- transition transaction;
- failure/recovery;
- history.

## Production law

Cross-world transition is an authoritative state transition.

The actor remains the same actor.

Cargo remains the same owned cargo.

## Acceptance

Exactly seven current worlds and six portal families represented; actor/cargo persists; requirements fail safely; unavailable destination has recovery; realm laws explicitly extend shared systems; deferred concepts remain inactive; final SHA/CI passes.

## Exit gate

Realm/portal semantic contract stable.

---

# P116 — KEYS BETWEEN WORLDS

**Classification:** FORGE-FIRST  
**Player/creator payoff:** Canonical realm portals can be built and validated through Portal Forge.

## Purpose

Create Portal Forge v1.

## Guided journey

```text
Portal family / destination
→ anchor/frame
→ canonical materials
→ stabilisation
→ Flux/power
→ rune/ritual hooks
→ permissions
→ arrival anchor
→ throughput
→ operational states
→ damage/block/corruption hooks
→ VFX/light/audio
→ validation
→ transition Test Lab
→ bake
```

## Supported families

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

## Core law

Portal families are not one generic frame with recoloured VFX.

## Acceptance

Forge authoring works; destination uses stable realm ID; six families stay distinguishable; requirements use normal systems; invalid destination fails safely; real transition Test Lab works; final SHA/CI passes.

## Exit gate

Portal authoring works.

---

# P117 — WORLDS WITH DIFFERENT LAWS

**Classification:** FORGE-FIRST / FOUNDATION  
**Player/creator payoff:** Entire realms can be authored through one orchestrating Realm Forge.

## Purpose

Create Realm Forge v1.

## Guided journey

```text
Identity / FCC authority
→ physical-law profile
→ world topology
→ worldgen
→ biome families
→ materials/resources
→ fluids/atmosphere
→ ecology
→ hazards
→ weather/environment
→ magic law
→ structures/dungeons
→ cultures/factions/governments
→ routes/travel
→ portal/arrival
→ imports/exports/adaptation
→ knowledge/cartography
→ validation
→ realm Test Lab
→ package
```

## Tooling

- realm dependency graph;
- physical-law matrix;
- compatibility/adaptation matrix;
- biome/hazard/resource rosters;
- ecology/creature roster;
- civilisation roster;
- structure/dungeon roster;
- portal binding;
- regression seeds;
- content-coverage matrix;
- cross-realm separation review.

## Core law

Realm Forge orchestrates specialist Forge services rather than duplicating their editors.

## Acceptance

Realm package authored/validated; specialist sources referenced; physical-law differences explicit; imports/adaptations validated; missing content exposed; deferred realm cannot accidentally activate; realm Test Lab works; final SHA/CI passes.

## Exit gate

Realm Forge works.

---

# P118 — THE FIRST CROSSING

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** The player opens a canonical portal and enters a persistent non-Overworld realm for the first time.

## Purpose

Prove one realm end to end before broad realm production.

## Required slice

- canonical portal;
- activation requirements;
- world transition;
- distinct realm worldgen;
- several realm regions/biomes;
- mechanically meaningful realm law/hazard;
- unique resource/material;
- ecology/creature;
- structure/site/dungeon;
- civilisation/faction interaction where required;
- realm-adapted survival/infrastructure;
- knowledge/map;
- cross-world inventory;
- return;
- persistent changes in both worlds;
- save/reload in destination realm.

The chosen first realm should validate the shared architecture at manageable production risk and must not contradict any already locked FCC rollout decision.

## Core law

No bespoke First Crossing controller.

## Acceptance

Canonical portal; destination persists separately; realm has meaningful law difference; imported identities remain stable; knowledge rules apply; both worlds preserve changes; no cross-world duplication/loss; transition performance passes; realm feels like another world rather than biome skin.

## Manual scenario

Prepare in Overworld → activate portal → cross → explore/survive/interact → acquire realm resource/knowledge → save/reload there → return.

## Rule-of-cool target

> **“Holy shit, we're not in the Overworld anymore.”**

## Exit gate

Shared realm architecture proven.


---

# P119 — THE SUNLIT CANOPY

**Classification:** EXPANSION / COOL-PULL  
**Realm:** Verdant Covenant  
**Player/creator payoff:** The living Verdant Covenant becomes a complete production realm with ecology, civilisation, resources, hazards and its Covenant Portal.

## Purpose

Productionise the Verdant Covenant according to locked FCC canon.

## Source packet

FCC-02 Verdant Covenant; ART-03 Verdant realm profiles; P115–P118; Realm Forge package authority.

## In scope

The realm package must cover the FCC-required Verdant production roster, including:

- Covenant Portal;
- realm environmental/physical-law profile;
- biome families;
- hazards;
- structures/dungeons;
- ecology;
- cultures/factions/authorities;
- resources;
- progression;
- routes;
- settlement adaptation;
- mapping/knowledge;
- realm-specific event/boss hooks where FCC requires.

Locked Verdant wood families remain:

- **Greatheart**, including **Living Heartwood**;
- **Dawnwood**;
- **Bloomwood**.

The realm must preserve distinct states for:

1. healthy living Verdant ecology;
2. healthy natural decay;
3. ecological/magical blight;
4. Void corruption;
5. restoration/recovery.

## Explicit non-scope

Generic enchanted-forest treatment, unlimited organic randomness, new FCC families invented by PROD.

## Production law

Living ecology may affect routes, structures and planning, but it remains authoritative world state rather than decorative animation.

## Recommended child slices

- P119-A — realm law/worldgen;
- P119-B — biome/ecology/material families;
- P119-C — civilisation/structures/routes;
- P119-D — hazards/events/dungeons;
- P119-E — Covenant Portal/progression/knowledge;
- P119-F — FCC coverage/performance/reconciliation.

## Acceptance

- FCC-02 roster coverage complete;
- Greatheart/Dawnwood/Bloomwood identities canonical;
- healthy decay/blight/Void/restoration distinguishable;
- Covenant Portal uses P116 contract;
- imported structures/infrastructure adapt to Verdant environment;
- realm save/return stable;
- dense ecology performance bounded;
- ART/FCC review passes;
- final SHA/CI passes.

## Negative tests

Blight vs Void; imported structure incompatibility; living ecology blocks route; portal damaged; harvested living resource regeneration.

## Manual scenario

Cross Covenant Portal → traverse multiple Verdant environments → interact with living ecology/civilisation → gather canonical resource → return and use it through valid Overworld systems.

## Rule-of-cool target

> **The world itself feels alive enough to negotiate with.**

## Exit gate

Verdant Covenant production realm complete to required scope.

---

# P120 — WHERE NAMES ENDURE

**Classification:** EXPANSION / COOL-PULL  
**Realm:** Ancestral Veil  
**Player/creator payoff:** The player enters an inhabited spirit realm where memory, identity and the dead are persistent systems rather than generic ghost ambience.

## Purpose

Productionise the Ancestral Veil according to locked FCC canon.

## Source packet

FCC-03 Ancestral Veil; ART-03 Veil profiles; P115–P118; Identity/Knowledge/History foundations.

## In scope

Required realm package coverage includes:

- Veilgate;
- memory/identity/spirit-active realm law;
- biome families;
- hazards;
- structures;
- **five dungeon families**;
- **twelve creature families/creatures** according to FCC roster;
- **three fixed authorities**;
- **Predatory Lineage Spirit** variable boss;
- **Grave-Sea Procession** titan;
- resources/materials;
- civilisations;
- processional/memory routes;
- realm-specific interactions;
- progression/knowledge.

The realm must preserve distinction between:

- spirit identity/history;
- memorial culture;
- material habitation;
- native instability / Predator Dark;
- Void corruption.

## Explicit non-scope

Every spirit as loot/resource; generic hostile-undead world; automatic-evil Necropolis; Veil reduced to dream logic.

## Production law

Named identity/memory anchors use persistent Identity/History records rather than presentation-only ghost state.

## Recommended child slices

- P120-A — realm law/worldgen;
- P120-B — memory/identity route mechanics;
- P120-C — creatures/authorities;
- P120-D — dungeons/boss/titan;
- P120-E — civilisation/resources/Veilgate;
- P120-F — FCC coverage/performance/reconciliation.

## Acceptance

- FCC-03 creature/dungeon/authority roster covered;
- boss/titan hooks implemented to FCC scope;
- native instability distinct from Void corruption;
- Veilgate uses canonical portal contract;
- spirit/memory systems preserve stable identity/history;
- realm remains materially inhabited, not grey-cemetery shorthand;
- save/return stable;
- final SHA/CI passes.

## Negative tests

Identity anchor removed; corporeal/spirit state transition; Predator Dark misclassified as Void; titan/large procession LOD; Veilgate failure.

## Manual scenario

Cross Veilgate → follow processional/memory route → interact with inhabitants/authority → explore realm site/dungeon → return carrying knowledge/resource.

## Rule-of-cool target

> **A world where your name, and what remembers it, matters.**

## Exit gate

Ancestral Veil production realm complete to required scope.

---

# P121 — THE DREAM THAT WATCHES

**Classification:** EXPANSION / COOL-PULL  
**Realm:** Somnolent Expanse  
**Player/creator payoff:** The dream realm becomes a persistent authored world with coherent dream law rather than random surreal generation.

## Purpose

Productionise Somnolent Expanse according to locked FCC canon.

## Source packet

FCC-04 Somnolent Expanse; ART-03 Somnolent profiles; P115–P118.

## Required canonical resources/materials

The realm package preserves:

- **Dream Soil**;
- **Dreamstone**;
- **Waking Stone**;
- **Reverie Wood**;
- **Lucid Glass**;
- **Nightmare Resin**;
- **Memory Thread**;
- **Sleepbloom**;
- **Prophecy Ink**;
- **Dream Motes**.

And critically:

> **Somnolent has no native metal.**

## In scope

- Dreamgate;
- persistent dream-law profile;
- biome families;
- hazards;
- creatures;
- structures/dungeons;
- cultures/authorities;
- stable/lucid/nightmare/deep-dream state distinctions;
- resources/progression;
- realm routes/knowledge;
- authored bounded dream mutability.

## Explicit non-scope

Random geometry merely to look dreamlike; nightmare = Void; invented native metal; arbitrary resets that erase persistent action without explicit realm law.

## Production law

Dream mutability must be:

- authored;
- bounded;
- reconstructable;
- persistent where consequential;
- understandable enough to play.

## Recommended child slices

- P121-A — dream-law runtime;
- P121-B — resource/material roster;
- P121-C — biomes/ecology/hazards;
- P121-D — structures/dungeons/civilisation;
- P121-E — Dreamgate/progression/knowledge;
- P121-F — FCC coverage/performance/reconciliation.

## Acceptance

- FCC-04 material/resource roster covered;
- no native metal generated as ordinary native resource;
- dream mutability bounded/reconstructable;
- nightmare/Deep Dream distinct from Void;
- Dreamgate uses canonical portal contract;
- save/reload preserves coherent state;
- realm identity review passes;
- final SHA/CI passes.

## Negative tests

Native-metal generation; mutable feature reload; lucid→nightmare transition; separate Void contamination; portal return.

## Manual scenario

Cross Dreamgate → explore stable/lucid/nightmare contexts → acquire dream material → observe bounded world change → reload → return.

## Rule-of-cool target

> **The dream has rules even when you don't fully understand them.**

## Exit gate

Somnolent Expanse production realm complete to required scope.

---

# P122 — ABOVE THE WORLD

**Classification:** EXPANSION / COOL-PULL  
**Realm:** Ascendant Reach  
**Player/creator payoff:** The player enters a true vertical sky realm governed by altitude, Windways, aetheric hazards and anchoring.

## Purpose

Productionise Ascendant Reach according to locked FCC canon.

## Source packet

FCC-05 Ascendant Reach; ART-03 Ascendant profiles; P115–P118; weather/travel foundations.

## In scope

FCC-required package including:

- Ascension Gate;
- vertical world topology;
- Windways;
- anchoring;
- aerial routes;
- biomes/ecology/civilisation;
- resources;
- structures/dungeons;
- progression;
- cartography/knowledge;
- FCC hazard roster including:
  - Lightning;
  - Static;
  - Buoyancy Instability;
  - High-Aether;
  - Sacred-Law;
  - Divine Presence;
  - Void Corruption;
  - remaining FCC-05 hazards.

## Explicit non-scope

Generic heaven; white-marble/gold/angel default; Overworld skylands treated as Ascendant; decorative levitation counted as structural support.

## Production law

Vertical route, buoyancy and anchoring state must be authoritative.

## Recommended child slices

- P122-A — realm law/vertical topology;
- P122-B — Windways/travel/anchoring;
- P122-C — biomes/ecology/resources;
- P122-D — hazards/civilisation/structures;
- P122-E — Ascension Gate/progression/knowledge;
- P122-F — FCC coverage/performance/reconciliation.

## Acceptance

FCC hazard roster covered; Windways materially affect travel; buoyancy/anchor rules authoritative; Ascension Gate works; realm distinct from Overworld skylands; vertical streaming bounded; save/return stable; final SHA/CI passes.

## Negative tests

Anchor loss; Static/Lightning; Buoyancy Instability; failed Windway; fall/recovery; portal return.

## Manual scenario

Cross Ascension Gate → navigate Windway/vertical route → survive hazard → reach settlement/site → return.

## Rule-of-cool target

> **The ground is no longer the organising principle of the world.**

## Exit gate

Ascendant Reach production realm complete to required scope.

---

# P123 — BELOW ALL DEPTHS

**Classification:** EXPANSION / COOL-PULL  
**Realm:** Impossible Deep  
**Player/creator payoff:** The player enters a true Deep Realm of world-cavern scale, pressure, Blackwater Vault-Seas and deep civilisation distinct from ordinary caves.

## Purpose

Productionise Impossible Deep according to locked FCC canon.

## Source packet

FCC-06 Impossible Deep; ART-03 Deep profiles; P78 Deep Overworld; P103–P112; P115–P118.

## In scope

FCC-required package including:

- Deepgate;
- Major Deep Realm status;
- **Blackwater Vault-Seas**;
- **eight biome families**;
- **five dungeon families**;
- **twelve hazards**;
- multiple cultures/civilisations;
- deep ecology;
- resources/materials;
- pressure/gravity/environment law;
- routes/traversal;
- settlements/infrastructure;
- progression/knowledge;
- authority/boss hooks where FCC requires.

## Explicit non-scope

Portal-free physical continuity from Deep Overworld; generic giant cave; single blue-black darkness palette; every area being underwater.

## Production law

Impossible Deep's pressure/scale/gravity are realm law, not atmosphere alone.

## Recommended child slices

- P123-A — realm law/world-cavern topology;
- P123-B — Blackwater/deep ecology;
- P123-C — eight biome families/twelve hazards;
- P123-D — dungeons/civilisations/routes;
- P123-E — Deepgate/progression/knowledge;
- P123-F — FCC coverage/performance/reconciliation.

## Acceptance

Eight-biome/five-dungeon/twelve-hazard coverage; Impossible Deep distinct from Deep Overworld; Blackwater uses authoritative fluid/deep rules; multiple civilisations covered; Deepgate canonical; save/return stable; cavern/fluid performance bounded; realm identity review passes; final SHA/CI passes.

## Negative tests

Pressure boundary; Blackwater transition; Deep Overworld confusion; huge cavern unload; portal failure.

## Manual scenario

Cross Deepgate → traverse world-cavern scale → reach Blackwater environment → encounter Deep civilisation/site → return.

## Rule-of-cool target

> **An ordinary cave should feel tiny after you've been here.**

## Exit gate

Impossible Deep production realm complete to required scope.

---

# P124 — NINE ROADS DOWN

**Classification:** EXPANSION / COOL-PULL  
**Realm:** Ashen Lower Realms  
**Player/creator payoff:** The player can descend through a civilisation-rich infernal realm of nine distinct strata, contracts, industry, hazards and politics.

## Purpose

Productionise Ashen Lower Realms according to locked FCC canon.

## Source packet

FCC-08 Ashen Lower Realms; ART-03 Ashen profiles; P63/P95–P102/P115–P118.

## Required FCC coverage

- Ashgate;
- **Nine Lower Strata I–IX**;
- **six resource anchors**;
- **Ember Iron** common;
- **Cinderwood** native;
- **twelve creature families**;
- **six signature structures**;
- **five dungeon families**;
- **twelve hazards**;
- **four fixed authorities**;
- bounded **Contract Engineering**;
- multiple civilisations/settlements;
- **eight recurring biome families**;
- stratum routes;
- industry;
- heat/ash/cooling;
- law/contract interactions;
- progression/knowledge.

## Realm identity law

Each stratum differs through combinations of:

- environmental intensity;
- geology;
- infrastructure;
- settlement form;
- political ownership;
- route type;
- history;
- industry;
- hazards.

**One stratum = one colour is prohibited.**

## Contract Engineering law

Contract Engineering remains bounded data/Permission/Transaction composition.

It cannot:

- run arbitrary code;
- bypass ownership;
- bypass jurisdiction;
- mint resources;
- rewrite unrelated systems.

## Explicit non-scope

Generic demon/hell world; universal evil alignment; unrestricted contract scripting; Ashen darkness treated as Void.

## Recommended child slices

- P124-A — nine-strata topology/routes;
- P124-B — biomes/resources/hazards;
- P124-C — creatures/signature structures/dungeons;
- P124-D — authorities/civilisations/government;
- P124-E — Contract Engineering;
- P124-F — Ashgate/progression/knowledge;
- P124-G — FCC coverage/performance/reconciliation.

## Acceptance

- nine strata and eight recurring biome families correct;
- six resource anchors including Ember Iron/Cinderwood rules covered;
- creature/signature/dungeon/hazard/authority rosters covered;
- Contract Engineering cannot bypass Permission/Transaction;
- strata differ systemically, not colour-only;
- Ashen darkness/heat distinct from Void;
- Ashgate canonical;
- save/return stable;
- representative performance bounded;
- final SHA/CI passes.

## Negative tests

Contract permission-bypass attempt; cross-stratum route failure; heat/ash protection loss; Void misclassification; authority change; portal failure.

## Manual scenario

Cross Ashgate → travel multiple strata → engage contract/civic/industrial systems → explore signature site/dungeon → return with Ashen resource/knowledge.

## Rule-of-cool target

> **A whole civilisation stack in impossible hostile depth — not “the lava level.”**

## Exit gate

Ashen Lower Realms production scope complete.


---

# P125 — TRADE BETWEEN WORLDS

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** Realm resources, people and technologies can move through portals into real cross-world civilisation and logistics networks.

## Purpose

Create Cross-Realm Logistics, Trade & Civilisation integration.

## Source packet

P83–P92 economy/trade; P93–P102 politics; P115–P124 realm systems; FCC compatibility rules; realm building/adaptation packs.

## In scope

Cross-realm Route and freight:

- portal Route segment;
- source/destination realm;
- portal capacity;
- actor/cargo compatibility;
- customs/permission;
- hazard/adaptation requirements;
- transition/travel state;
- freight manifest;
- realm-origin provenance;
- quarantine/contamination hook where authorised;
- destination storage;
- realm-specific supply/demand;
- import restrictions;
- settlement adaptation;
- diplomacy/treaty hooks;
- route knowledge.

Cross-realm civilisation effects:

- imported resource use;
- imported material/structure adaptation;
- merchant/settler/embassy hooks;
- realm trade shortages/surpluses;
- portal-hub logistics;
- faction/government control;
- historical consequences.

## Core law

Cross-realm freight remains normal freight.

The portal becomes a special Route segment with transition, compatibility and world-boundary rules.

No separate `RealmCargo` inventory is created.

## Explicit non-scope

Unlimited instant teleport economy; portal throughput without infrastructure; automatic universal material compatibility; instant cultural homogenisation.

## Recommended child slices

- P125-A — portal Route extension;
- P125-B — cross-world freight transaction;
- P125-C — compatibility/customs/quarantine;
- P125-D — economy/settlement adaptation;
- P125-E — diplomacy/knowledge/history;
- P125-F — persistence/security/performance;
- P125-G — reconciliation.

## Acceptance

1. Cross-realm route extends shared Route.
2. Freight remains one authoritative cargo record.
3. Portal capacity/permission/compatibility constrains trade.
4. Realm resources retain stable identity/provenance.
5. Imported structures/materials obey destination adaptations.
6. Cross-realm trade changes real settlement stock/economy.
7. Transition/reload cannot duplicate or lose cargo.
8. Multi-world updates remain bounded.
9. Final SHA/CI passes.

## Negative tests

Portal closes with committed cargo; incompatible cargo; customs denied; destination full; destination world unavailable; transition retry.

## Manual scenario

Reserve Overworld goods → deliver to portal → cross freight → deliver in realm → purchase/return realm resource → use it in valid Overworld production.

## Rule-of-cool target

> **A material from another world becomes part of an ordinary settlement supply chain.**

## Exit gate

Cross-realm civilisation/economy integration works.

---

# P126 — SEVEN WORLDS, ONE LEY

**Classification:** INTEGRATION / COOL-PULL  
**Player/creator payoff:** All seven current Leyforge worlds operate as one connected persistent sandbox while remaining mechanically, visually and semantically distinct.

## Purpose

Certify ARC XIV and the current seven-world base-game realm architecture.

## Required worlds

1. Overworld
2. Verdant Covenant
3. Ancestral Veil
4. Somnolent Expanse
5. Ascendant Reach
6. Impossible Deep
7. Ashen Lower Realms

## Required portal families

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

## Integration scope

P126 must prove:

- portal activation/return across all current realm families;
- stable player/NPC identity;
- inventory/cargo continuity;
- realm-law enter/exit;
- realm-specific resources;
- realm-specific hazards;
- maps/knowledge;
- realm settlement/civilisation state;
- cross-realm trade;
- cross-realm history/consequence;
- save/reload from every current realm;
- dormant/non-active world handling;
- unavailable realm/package recovery;
- deferred realm concepts remain inactive;
- visual/system separation.

## Realm separation checks

### Overworld
Materially grounded baseline.

### Verdant Covenant
Living ecological/law identity.

### Ancestral Veil
Memory/spirit/identity world.

### Somnolent Expanse
Persistent dream-law world.

### Ascendant Reach
Vertical/aetheric/Windway world.

### Impossible Deep
World-cavern/pressure/deep-civilisation world.

### Ashen Lower Realms
Nine-strata infernal civilisation/contract/industry world.

## Core law

The seven realms are one game, not seven unrelated games.

They share the common Leyforge grammar.

They do not collapse into one homogenised ruleset.

## Recommended child slices

- P126-A — seven-world package/portal matrix;
- P126-B — transition/save stress suite;
- P126-C — realm-law entry/exit tests;
- P126-D — cross-realm resource/trade/history;
- P126-E — visual/accessibility separation review;
- P126-F — performance/recovery/security;
- P126-G — PG-14 reconciliation.

## Acceptance

1. Exactly seven current persistent worlds active.
2. Exactly six canonical non-Overworld portal families.
3. Player identity/inventory crosses all required realms without duplication/loss.
4. Realm laws apply and revert correctly.
5. Each realm remains mechanically and visually distinguishable.
6. Cross-realm trade uses real portal capacity and transactions.
7. Maps/knowledge remain realm-bounded and provenance-aware.
8. Save/reload from every realm succeeds.
9. Deferred realm concepts remain inactive.
10. Repeated transitions remain within memory/performance targets.
11. Missing/corrupt destination package fails safely.
12. Human review confirms realms feel like different worlds without feeling like different games.
13. Final SHA/CI passes.

## Negative tests

Missing realm package; destination unavailable; portal closes during transition; cargo retry; copied maps; realm law fails to revert; save after visiting all worlds; deferred realm ID injection.

## Manual scenario

Start Overworld → visit each realm through canonical portal → perform one meaningful interaction in each → complete cross-realm freight → save/reload at multiple points → inspect all world states afterward.

## Rule-of-cool target

> **SEVEN WORLDS, ONE LEY.** 🔥

## Exit gate — PG-14 SEVEN-WORLD REALM FOUNDATION

PG-14 passes only when P115–P126 are COMPLETE and all current realms, portals, cross-world persistence and realm-law transitions are certified.

---

# 04. PG-13 — Maritime & Naval Foundation Summary

| Capability | Parent |
| --- | --- |
| Production water/liquid runtime | P103 |
| Hydrology & Water Forge | P104 |
| Waves / tides / currents / storm seas | P105 |
| Ports / docks / shipyards | P106 |
| Vessel Contract | P107 |
| Vessel Forge | P108 |
| Moving Vessel Runtime | P109 |
| Maritime professions / crew | P110 |
| Maritime travel / trade | P111 |
| Marine ecology / underwater exploration | P112 |
| Naval combat / piracy / navies | P113 |
| Stormbound integration | P114 |

Minimum end-to-end:

```text
author coast
→ build functioning harbour
→ author vessel
→ construct vessel
→ launch
→ assign crew
→ load freight
→ depart
→ tide/current/weather
→ dive/explore
→ naval encounter
→ damage/repair
→ return/unload
→ save/reload
```

---

# 05. PG-14 — Seven-World Realm Foundation Summary

| Capability | Parent |
| --- | --- |
| Realm & Portal Contract | P115 |
| Portal Forge | P116 |
| Realm Forge | P117 |
| First Crossing | P118 |
| Verdant Covenant | P119 |
| Ancestral Veil | P120 |
| Somnolent Expanse | P121 |
| Ascendant Reach | P122 |
| Impossible Deep | P123 |
| Ashen Lower Realms | P124 |
| Cross-Realm Trade / Logistics | P125 |
| Seven Worlds, One Ley | P126 |

Minimum end-to-end:

```text
Overworld
→ canonical portal
→ realm law transition
→ realm exploration/civilisation
→ realm resource/knowledge
→ return
→ persistent state
→ cross-realm freight
→ all six non-Overworld realms
→ seven-world save/recovery certification
```

---

# 06. Recommended Production Concurrency

The numeric roadmap remains the default authority.

## P103–P105

Water runtime stabilises before sea presentation becomes authority.

Hydrology Forge and sea-state work may overlap once the shared water-body/surface/depth contract is stable.

## P106–P108

Port/shipyard implementation can overlap with late Vessel Contract work.

P108 cannot freeze source semantics before P107 stabilises.

## P109

P109 is deliberately treated differently.

Moving vessels are too technically central to bury under broad parallel content production.

If the accepted vessel-motion ADR changes, dependent work revalidates.

## P110–P112

Crew, maritime routes and marine ecology may overlap after vessel-local coordinate/identity rules stabilise.

## P113

Do not scale naval content before persistent moving-vessel damage, crew and cargo are proven.

## P115–P117

Realm Contract first.

Portal Forge and Realm Forge may overlap only after stable shared schema/interfaces exist.

## P119–P124

After P118 passes, realm content may proceed in controlled parallel waves if shared realm contracts remain governed centrally.

---

# 07. Explicit Anti-Scope

## Maritime anti-scope

Reject:

- decorative oceans with no gameplay query layer;
- one mandatory fluid solver for all scales;
- duplicate ship-only blocks/items;
- vessel-as-prop architecture;
- arbitrary cargo loss from a danger percentage;
- large fleets before one-vessel correctness;
- ancestry-based piracy.

## Realm anti-scope

Reject:

- an eighth current persistent realm;
- playable Void Between progression;
- current Pocket Realm Construction;
- World-Engine as current playable world;
- generic portal recolours;
- realm-as-biome-skin;
- realm-specific duplicate inventory/economy/NPC frameworks;
- cross-realm teleport economy without portal infrastructure;
- imports that ignore destination realm law.

---

# 08. Cross-Arc Architectural Locks

## 08.1 Water can use multiple implementations behind one semantic contract

This avoids both:

- an impossible universal fluid solver;
- unrelated water systems that cannot answer common gameplay questions.

## 08.2 Vessel is a moving Structure-family composition

Vessels inherit:

- canonical content;
- structure semantics;
- construction;
- networks;
- inventory;
- professions;
- permissions;
- damage.

Movement is the dangerous extension, not an excuse for a second engine.

## 08.3 Ports bridge land Route to maritime Route

```text
warehouse
→ local freight
→ port
→ vessel
→ sea route
→ port
→ local freight
→ warehouse
```

P125 later applies the same pattern through portals.

## 08.4 High-risk proofs can still stop the roadmap

P109 embodies the rule:

> **A roadmap milestone is not evidence that a capability works.**

Failed proof means repair/block, not wishful implementation.

## 08.5 Realm Forge is the largest Forge orchestration test so far

If Realm Forge duplicates World/Biome/Creature/Structure/Portal editors, the Forge architecture is too fragmented.

## 08.6 Portal routes extend Route across world boundaries

Roads, sea lanes and portals share higher-level route/freight semantics while retaining different traversal laws.

## 08.7 Realm separation is semantic, not cosmetic

Forest, sky, depth, memory, darkness, volcanism and civilisation may recur across worlds.

The realm's rules/context determine what they mean.

## 08.8 Seven-world persistence is architecture certification

P126 certifies:

- stable identities;
- save ownership;
- multi-world packages;
- cross-world references;
- inventories;
- knowledge;
- realm-law application/reversion.

---

# 09. Persistent Regression Fixtures

Retain at minimum:

- P103 bounded water/chunk/save fixture;
- P104 hydrology/coast seed fixture;
- P105 tide/current/storm fixture;
- P106 working port/shipyard;
- P107 vessel semantic fixture;
- P108 golden workboat/cargo vessel;
- P109 moving-vessel proof world;
- P110 crew/station fixture;
- P111 two-port voyage;
- P112 reef/wreck dive;
- P113 naval encounter;
- P114 Stormbound maritime integration region;
- P115 portal transition fixture;
- P116 golden portal;
- P117 first realm package;
- P118 First Crossing world pair;
- P119 Verdant regression seed;
- P120 Veil regression seed;
- P121 Somnolent regression seed;
- P122 Ascendant regression seed;
- P123 Impossible Deep regression seed;
- P124 Ashen multi-strata set;
- P125 cross-realm freight fixture;
- P126 seven-world transition/save suite.

P109, P114, P118 and P126 are top-tier long-term integration fixtures.

---

# 10. ProductionRegistry Seed Entries

```text
P103 — Water That Remembers
P104 — The Waterwright
P105 — Tidebound
P106 — Harbour Lights
P107 — Law of the Hull
P108 — Shipwright
P109 — Launch Day
P110 — All Hands
P111 — Blue Roads
P112 — Beneath the Surface
P113 — Broadside
P114 — Stormbound
P115 — The Law of Thresholds
P116 — Keys Between Worlds
P117 — Worlds With Different Laws
P118 — The First Crossing
P119 — The Sunlit Canopy
P120 — Where Names Endure
P121 — The Dream That Watches
P122 — Above the World
P123 — Below All Depths
P124 — Nine Roads Down
P125 — Trade Between Worlds
P126 — Seven Worlds, One Ley
```

No ProductionRegistry status becomes READY merely because PROD-13 exists.

---

# 11. Open Decisions Deferred to Evidence

PROD-13 deliberately does not decide:

- exact dynamic-water data structure;
- exact ocean surface renderer;
- exact shoreline erosion method;
- exact wave equation;
- exact tide amplitude values;
- exact current field resolution;
- exact vessel buoyancy solver;
- exact moving-vessel architecture before accepted proof/ADR;
- exact rigid-body vs kinematic balance;
- exact onboard navigation implementation;
- exact sail simulation complexity;
- exact flooding granularity;
- exact naval projectile implementation;
- exact fleet abstraction threshold;
- exact realm-transition loading UX;
- exact dormant-realm update cadence;
- exact multi-world memory/cache strategy;
- exact cross-world transaction-recovery journal;
- exact realm content counts beyond FCC authority.

Those remain evidence, balance or upstream-canon decisions.

---

# 12. PROD-13 Acceptance Gate

PROD-13 is ready for owner lock when the owner agrees that:

- [ ] P103–P126 retain PROD-02 names/order;
- [ ] water gameplay truth remains distinct from water presentation;
- [ ] multiple liquid scales may use different implementations behind coherent contracts;
- [ ] consequential water survives chunk/save/LOD boundaries;
- [ ] waves, tides and currents remain distinct;
- [ ] ports require real berth/depth/routes/logistics/staff/permission;
- [ ] vessels use canonical registered blocks/materials/components;
- [ ] vessel source, bake, project, commissioned instance and runtime state remain distinct;
- [ ] moving voxel vessels remain evidence-gated high-risk architecture;
- [ ] vessel occupants/cargo preserve stable identity;
- [ ] buoyancy/damage/flooding are gameplay authority, not animation;
- [ ] maritime professions use normal Profession/Task systems;
- [ ] maritime routes extend Route;
- [ ] marine ecology extends Ecology/Knowledge;
- [ ] naval combat uses persistent vessels/crews/cargo;
- [ ] piracy is faction/legal/economic behaviour rather than ancestry;
- [ ] exactly seven current persistent worlds remain active scope;
- [ ] exactly six current non-Overworld portal families remain canonical;
- [ ] deferred realm concepts remain deferred;
- [ ] realm definitions are world-law compositions, not biome skins;
- [ ] Portal Forge preserves portal-family identity;
- [ ] Realm Forge orchestrates specialist Forge services;
- [ ] P118 proves one realm completely before mass realm production;
- [ ] each FCC realm package preserves its locked realm identity;
- [ ] Deep Overworld remains distinct from Impossible Deep;
- [ ] cross-realm freight extends normal Route/Freight/Transaction semantics;
- [ ] P126 certifies multi-world persistence and realm-law transitions;
- [ ] exact implementation/provider/balance choices remain evidence-driven.

---

# 13. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-13 — LEYFORGE ARCS XIII–XIV PRODUCTION CONTRACTS — v0.1**
>
> ARC XIII establishes water and oceans as authoritative gameplay systems rather than presentation effects. Hydrology & Water Forge authors water bodies and coastal rules; waves, tides and currents remain distinct sea-state concepts; ports validate real water approach, logistics and permissions; and vessels remain voxel-built functional structures composed from canonical registered content. Vessel source, construction, commissioned identity and mutable runtime state remain distinct. Moving voxel vessels are explicitly evidence-gated because movement, collision, occupants, cargo, persistence and future multiplayer are high-risk. Crews use normal professions/tasks; sea routes extend Route; marine ecology extends Ecology; and naval combat damages the same persistent ships and crews. ARC XIV establishes exactly seven current persistent worlds — Overworld, Verdant Covenant, Ancestral Veil, Somnolent Expanse, Ascendant Reach, Impossible Deep and Ashen Lower Realms — connected through exactly six canonical non-Overworld portal families. Realm Forge orchestrates existing specialist Forge services under explicit realm-law profiles. P118 proves one complete crossing before mass realm production; P119–P124 productionise the six non-Overworld realms under FCC authority; P125 extends normal freight/economy contracts through portals; and P126 certifies the seven-world persistent sandbox while preserving distinct realm laws, identity and presentation.

---

# 14. Next Document

After PROD-13 acceptance/reconciliation, continue to:

> **PROD-14 — Arcs XV–XVI Production Contracts: P127–P148**

That volume will cover:

- unified Forge workspace;
- Creation Journey Engine;
- universal dependency/composition graph;
- UI/Icon/2D Forge;
- Capture Studio;
- Universal Forge Validation;
- final Test Laboratory;
- live playtest/hot reload;
- revision/comparison/review;
- Package Forge;
- Forge-made mini expansion certification;
- Knowledge Contract;
- Knowledge & Codex Forge;
- Quest & Event Forge;
- World Event Runtime;
- NPC memory/relationships;
- families/generations/succession;
- rumours/information propagation;
- archives/records/historical sites;
- persistent historical layering;
- Chronicle;
- A World That Remembers integration.

---

**End of PROD-13 v0.1 — Arcs XIII–XIV Production Contracts Candidate**
