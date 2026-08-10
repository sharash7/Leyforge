# LEYFORGE

## 14 — Dimensions, Realms, Realm Travel and Interdimensional World System

### Persistent Realm Instances, Realm Laws, Seeded Realm Networks, Portals, Anchors, Access Graphs, Safe Return, Cross-Realm Infrastructure and Lasting World Consequence

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `14_Fantasy_Voxel_Civilisation_Sandbox_Dimensions_v0_1` for active production direction  
**Primary Authored Realm Authority:** `24D — World Content Atlas: Dimensions, Realm Structure and Realm Biome Atlas v0.1`  
**Worldgen Authority:** Document 11 v1.0 + Atlas 24A–24C  
**Magic / Portal Activation Authority:** Document 09 v1.0  
**Creature / Realm Ecology Authority:** Document 10 v1.0 + Atlas 24F  
**Structure / Gate / Site Runtime:** Document 12 v1.0 + Atlas 24G / 24I  
**Civilisation / Sovereignty:** Document 13 v1.0 + Atlas 24E  
**Quest / Event Runtime:** Document 15  
**Combat / Boss Runtime:** Document 16 + Atlas 24H  
**UI / Realm Atlas Presentation:** Document 17  
**Technical Implementation:** Replacement Document 18  
**Settlement / Realm Adaptation:** Documents 19–20, especially 20E and 20G  
**Production Governance:** Set 25  
**Maritime Realm Integration:** Set 26  
**Economy / Cross-Realm Trade:** Set 27  
**Social Knowledge / Rumours:** Set 28  
**Biology / Survival Consequences:** Set 29  
**Movement / Physical Travel:** Set 30, with Set 26 specialist aquatic/vessel execution  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale dimensional-world runtime in which realms are persistent world systems with their own topology, physical and magical laws, regions, societies, ecology, resources, infrastructure, access routes and mutable history. Realm travel is part of civilisation-scale play rather than a consequence-free teleport menu.

> **Dimension System Statement**
>
> **A major realm is a complete world system, not a recoloured biome, loot room, boss corridor or resource tier. It must change how the player understands at least several of survival, navigation, building, ecology, magic, industry, civilisation, politics, exploration and long-term consequence.**

> **Atlas / Runtime Separation Rule**
>
> **Document 24D defines the authored realm families, realm laws, biome foundations, completeness contracts and realm-facing content relationships. Document 14 owns the runtime instances, seeded realm-network graph, active law stacks, route/anchor state, safe-return state, realm transitions, persistence and cross-realm consequence orchestration.**

> **No Fixed First Realm Rule**
>
> **Normal production worlds do not contain a guaranteed Forest Hamlet portal, mandatory tutorial gate, predetermined first realm or fixed dimension ladder. Realm clues, access routes, arrival regions, politics, dungeon ownership, boss state and route stability are seed-derived and simulation-responsive.**

> **Safe-Return Rule**
>
> **Normal progression may be dangerous, conditional or temporarily one-way, but it must not silently strand a save. Every intended realm-access path exposes a valid return, recoverable return, negotiated return, constructible return, emergency rescue or clearly signposted deliberate no-return challenge state.**

> **Realm Law / Movement Boundary**
>
> **Document 14 defines the authoritative realm-environment and physical-law fields. Set 30 and Set 26 execute actual movement under those laws. A realm can alter gravity, wind, buoyancy or spatial behaviour without Document 14 writing actor transforms.**

> **No Biological Realm Ownership Rule**
>
> **No ancestry is the biological owner of a realm. Realms may have native, ancient, adapted, migrant, diasporic, colonising, visiting or politically dominant societies, but ancestry, culture, citizenship, faction and realm connection remain separate identities.**

---

# Document Purpose

Document 14 defines the production runtime architecture for dimensions and realms.

The original v0.1 already established the correct central direction:

- dimensions are complete gameplay ecosystems;
- the Overworld remains the civilisation heart;
- major realms can support permanent settlement, industry and political power;
- realm access should branch through knowledge, restoration, ritual, infrastructure, factions, bosses and exploration;
- portals are physical infrastructure;
- realms may change gravity, time, matter, survival, magic and navigation;
- realm resources must remain useful outside the realm;
- cross-realm civilisation, trade, migration and politics matter;
- realm state persists;
- distant realms use simulation LOD;
- the POC should only foreshadow realm travel.

Those principles remain.

The later World Content Atlas 24D expands the system into a full production realm framework containing:

- **12 realm families**;
- **8 realm-biome foundations per family**;
- **96 realm-biome foundations total** before sub-biomes and local variants;
- seeded realm-network topology;
- realm relationship types;
- realm-law scopes;
- survival and safe-return contracts;
- portal/anchor route classes;
- civilisation and ecology hooks;
- dungeons and bosses;
- resource and infrastructure requirements;
- dynamic realm outcomes;
- persistence and production validation.

Document 14 v1.0 therefore does **not** duplicate the 96 biome definitions or rewrite the twelve realms' full authored Atlas entries.

Instead, Document 14 owns the shared runtime required to make those definitions become persistent playable worlds.

---

# 1. Locked Dimension Runtime Identity

Document 14 is the runtime authority for:

- realm instances;
- realm topology instances;
- realm-network topology;
- realm-law stacks;
- cross-realm relationship runtime;
- route records;
- anchor state;
- realm-access state;
- arrival state;
- safe-return state;
- realm discovery state at the objective world layer;
- realm-instance persistence;
- cross-realm transition orchestration;
- realm-local simulation boundaries;
- realm lifecycle;
- realm collapse/isolation/sealing runtime;
- cross-realm consequence routing;
- realm LOD;
- realm migration/versioning.

It does not own every gameplay system inside each realm.

---

# 2. What Document 14 Owns

Document 14 owns:

- runtime `RealmInstance` identity;
- realm-definition-to-instance resolution;
- realm-derived seed;
- realm instance generation version;
- realm-network instance;
- active realm relationship edges;
- realm topology graph;
- realm region graph reference;
- realm-law stack and law precedence;
- realm-global environmental-law snapshot;
- region/site realm-law overrides;
- temporary realm-law overlays;
- cross-realm access graph;
- route-instance identity;
- portal/anchor route binding;
- destination-address resolution;
- arrival-envelope selection;
- return-route state;
- emergency return eligibility;
- deliberate no-return challenge classification;
- realm route discovery state at the objective world layer;
- route stability state;
- route containment/quarantine state;
- route collapse/sealing state;
- realm instance active/inactive/suspended/collapsed state;
- realm-to-realm leakage relationship state;
- realm cross-world consequence record;
- realm-local world-time mapping;
- cross-realm save reconciliation;
- realm LOD;
- streamed realm activation/deactivation;
- generated realm-state provenance;
- runtime realm validation;
- realm migration;
- diagnostics and reason codes.

---

# 3. What Document 14 Does Not Own

Document 14 does not own:

- authored realm family identity and full realm content — 24D;
- individual realm biome definitions — 24D;
- Overworld/realm region terrain generation algorithms — Document 11 / 24D;
- Block identity — Document 03;
- Item identity — Document 04;
- recipes — Document 05;
- resource identity/progression — Document 06;
- NPC identity/jobs — Document 07;
- automation machine runtime — Document 08;
- spell, ritual, mana, portal activation magic — Document 09;
- creature population/ecology — Document 10;
- structure instance state — Document 12;
- political sovereignty, citizenship or route-control law — Document 13;
- quest/event lifecycle — Document 15;
- combat/damage/boss phases — Document 16;
- final UI/map knowledge — Document 17 / Set 28;
- settlement planning/building function — Documents 19–20;
- vessel movement — Set 26;
- prices/contracts/trade economics — Set 27;
- beliefs/rumours/known destination confidence — Set 28;
- biological survival result — Set 29;
- physical actor/vehicle/mount movement — Set 30.

---

# 4. 24D and Document 14 Relationship

24D is the authored realm-content Atlas.

Document 14 is the runtime realm/world-transition system.

## 4.1 24D Owns

24D owns:

- stable realm-family IDs;
- realm class;
- realm fantasy/purpose;
- cosmological relationships;
- default law profiles;
- authored realm biome families;
- infrastructure requirements;
- native ecology slots;
- civilisation slots;
- resource roles;
- route categories;
- dungeon/boss hooks;
- dynamic-state possibilities;
- completeness targets;
- content production status.

## 4.2 Document 14 Owns

Document 14 resolves those authored definitions into:

- actual realm instances;
- actual generated region graph;
- actual seeded route graph;
- current law stack;
- current route stability;
- current return path;
- current realm political/structural/ecological references;
- current dynamic realm state;
- cross-realm consequences;
- save persistence.

## 4.3 No Duplicate Realm Atlas

Document 14 does not maintain another independently editable copy of:

- Verdant Covenant biome list;
- Ancestral Veil biome list;
- Aetheric Reach biome list;
- or any other 24D content portfolio.

---

# 5. Realm Roster

The production realm-family roster remains the twelve 24D families:

1. **Verdant Covenant**
2. **Ancestral Veil**
3. **Somnolent Expanse**
4. **Aetheric Reach**
5. **Impossible Deep**
6. **World-Engine**
7. **Ashen Lower Realms**
8. **Void Between**
9. **Divine Concords**
10. **Necropolis Domains**
11. **Elemental Confluences**
12. **Created Pockets**

Each family has eight v0.1 realm-biome foundations in 24D, yielding **96 foundational realm biomes** before later variants.

---

# 6. Realm Classification

24D supports several runtime classes.

| Realm Class | Runtime Meaning | Typical Examples |
|---|---|---|
| Major Persistent Realm | Large streamed world with multiple regions, societies, ecology, dungeons and permanent state. | Verdant Covenant, Aetheric Reach, Impossible Deep |
| Layer / Reflection | Overlapping world addressed through memory, spirits, death, perception or relationship. | Ancestral Veil |
| Network Realm | Connected domains/coherence zones rather than one continuous geography. | Somnolent Expanse, Divine Concords |
| Realm Cluster | Multiple related but distinct worlds under one family. | Ashen Lower Realms, Necropolis Domains, Elemental Confluences |
| Artificial Realm | Constructed world-scale environment. | World-Engine |
| Interstitial Realm | Space between destinations or realities. | Void Between |
| Pocket Family | Finite created/bounded instance with explicit rules and capacity. | Created Pockets |

## 6.1 Runtime Class Is Not Content Tier

A pocket realm may be late-game.

A major realm may be discoverable early.

Realm class describes spatial/cosmological structure, not progression rank.

---

# 7. Cosmology

Leyforge does not require one universally accepted in-world cosmology.

Developer/runtime truth may know:

- which worlds are separate;
- which are layered;
- which are artificial;
- which are reflections;
- which are interstitial;
- which are clusters;
- which are pockets.

Cultures may believe different explanations.

Set 28 owns belief.

Document 13 owns cultural/faith institutions.

Document 14 owns actual runtime topology.

---

# 8. Realm Relationship Types

24D establishes:

- **Stable Adjacency**
- **Affinity**
- **Conflict**
- **Leakage**
- **Dependency**
- **Containment**
- **Claim**
- **Unknown**

Document 14 stores active relationship edges.

## 8.1 Stable Adjacency

Two realm instances share a durable route/boundary relationship.

## 8.2 Affinity

Transfer of:

- magic;
- matter;
- ecology;
- culture;
- infrastructure

may be easier or more stable.

## 8.3 Conflict

Realm laws may react destructively without stabilisation.

## 8.4 Leakage

A realm can leak:

- weather;
- ecology;
- dreams;
- spirits;
- mana;
- corruption;
- matter;
- terrain behaviour.

## 8.5 Dependency

A route, settlement or biome may require state from another realm.

## 8.6 Containment

A realm/pocket may imprison content.

## 8.7 Claim

Cultures/factions may claim a route or destination.

Document 13 owns political/legal claim.

## 8.8 Unknown

Runtime may preserve deliberately unresolved developer/gameplay mystery where design explicitly allows it.

---

# 9. Realm Network Seed

A normal world derives a realm-network seed from:

- world root seed;
- content manifest;
- worldgen version;
- realm-generation version;
- world profile.

The same valid inputs reproduce the same undiscovered realm-network base.

---

# 10. Realm Network Generation

Generation may determine:

- which realm families are enabled;
- realm-instance seeds;
- discoverability;
- route graph;
- arrival regions;
- hidden layers;
- active factions;
- historical relationships;
- dungeon ownership;
- boss state;
- route stability;
- realm leaks;
- initial political condition.

## 10.1 No Fixed Dimension Ladder

The network is not:

`Overworld → Realm A → Realm B → Realm C`

for every seed.

Different worlds may expose:

- different early clues;
- different repaired gates;
- different faction routes;
- different ritual knowledge;
- different breach events;
- different route problems.

---

# 11. Realm Network Record

```yaml
realm_network:
  realm_network_id: realm_network:<world_id>
  world_ref: world:<id>
  root_seed_ref: <seed>
  generation_version: <version>
  enabled_realm_definition_refs: []
  realm_instance_refs: []
  route_instance_refs: []
  relationship_edge_refs: []
  hidden_edge_refs: []
  global_cross_realm_state_refs: []
  validation_revision: <rev>
  runtime_revision: <rev>
```

---

# 12. Realm Instance

Each major realm/pocket instance receives a stable persistent runtime identity.

```yaml
realm_instance:
  realm_instance_id: realm_instance:<ulid>
  realm_definition_ref: realm:<24D_id>
  realm_class: <class>
  derived_seed: <value>
  generation_version: <version>

  topology:
    topology_profile_ref: <id>
    region_graph_ref: <id>
    hidden_layer_refs: []
    arrival_region_refs: []

  laws:
    cosmological_law_refs: []
    global_law_refs: []
    active_overlay_refs: []

  state:
    lifecycle_state: active
    dynamic_state_refs: []
    sovereignty_refs: []
    ecology_refs: []
    settlement_refs: []
    dungeon_refs: []
    boss_refs: []

  routes:
    inbound_route_refs: []
    outbound_route_refs: []
    emergency_return_refs: []

  persistence:
    discovered_state_ref: <id>
    frozen_generated_revision: <rev>
    local_delta_refs: []
    lod_state: R0
    runtime_revision: <rev>
```

---

# 13. Definition Versus Instance

`realm.verdant_covenant` is a reusable definition.

One world's generated Verdant Covenant is an instance.

Its:

- ruler;
- settlements;
- dungeon state;
- route damage;
- ecology;
- player buildings;
- restored regions

must not modify the Atlas definition.

---

# 14. Realm Region Graph

A major realm resolves into a region graph containing:

- realm-biome mosaics;
- transition zones;
- settlements;
- wilderness;
- resources;
- structures;
- dungeons;
- bosses;
- route anchors;
- hidden layers;
- local law modifiers.

Document 11/24D owns generation/content.

Document 14 maintains the instance binding and persistence.

---

# 15. Realm Biome Boundary

24D defines biome identity.

Document 14 stores:

- selected biome instance refs;
- parent realm;
- law stack refs;
- region relationships;
- discovered state;
- cross-realm consequence state.

Document 11/runtime worldgen materialises terrain.

---

# 16. Realm Completeness

24D's major-realm completeness target includes:

- at least six biome families, with eight defined per realm in v0.1;
- multiple societies or a deliberate wilderness explanation;
- twelve-to-twenty-five creature-family target over production;
- three-to-six dungeon families;
- regional/climax boss paths;
- common and strategic resources;
- building/power/transport/storage/farming/portal rules;
- multiple long-term outcomes.

Document 14 validates that a content package claiming “major playable realm” meets required runtime contracts.

---

# 17. Realm Law Architecture

Realm laws apply at scopes:

1. cosmological;
2. realm-global;
3. regional;
4. biome;
5. site/dungeon;
6. temporary overlay.

## 17.1 Precedence

Recommended resolution:

**Cosmological constraints**  
→ **Realm-global default**  
→ **Regional override**  
→ **Biome modifier**  
→ **Site modifier**  
→ **Temporary authorised overlay**

An override must declare which fields it can change.

---

# 18. Realm Law Categories

Potential realm-facing law fields include:

- gravity;
- local-up;
- atmospheric composition;
- pressure;
- temperature model;
- buoyancy;
- time rate;
- season/cycle;
- mana density;
- magical school modifiers;
- material stability;
- foreign-material reaction;
- fluid behaviour;
- navigation behaviour;
- visibility/perception;
- death/recovery;
- corpse/remains rules;
- sleep/rest behaviour;
- food compatibility;
- biological exposure;
- building constraints;
- portal stability;
- identity/soul interactions;
- memory/dream behaviour.

Specialist systems own consequences.

---

# 19. Realm Environment Snapshot

Document 14 should expose a movement/environment-facing snapshot.

```yaml
realm_environment_snapshot:
  snapshot_id: realm_environment:<ulid>
  realm_instance_ref: <id>
  region_ref: <id>
  site_ref: <id>?
  active_law_refs: []
  revision: <rev>
  world_time: <time>

  gravity_vector: <vector>
  local_up_vector: <vector>
  atmosphere_density_band: <band>
  atmospheric_hazard_tags: []
  buoyancy_modifier: <value_or_band>
  drag_modifier: <value_or_band>
  time_rate_modifier: <value>
  mana_density_band: <band>
  visibility_modifier: <band>
  navigation_anomaly_tags: []
  matter_stability_tags: []
```

Set 30/26/29/09 consume relevant fields.

---

# 20. Gravity

A realm may modify:

- direction;
- magnitude;
- regional variation;
- local gravity sources;
- buoyancy relationship;
- fall behaviour.

Document 14 defines the field.

Set 30 performs physical movement.

Set 29 resolves biological impact.

---

# 21. Aetheric Reach and Movement

Aetheric Reach may use:

- varying gravity;
- buoyant matter;
- windways;
- altitude-sensitive environment;
- floating routes.

Document 14 publishes law/environment fields.

Set 30 handles:

- falling;
- gliding;
- mounts;
- traversal.

No hard-coded `if realm == AethericReach` movement branch should be necessary.

---

# 22. Time

Realm time may differ through:

- rate;
- cycles;
- season;
- dream divergence;
- memory ordering;
- local pause/acceleration where explicitly defined.

## 22.1 Authoritative Time

Each realm instance maps local perceived/calendar time onto the authoritative world simulation timeline.

Persistent systems must not each invent their own dimensional clocks.

---

# 23. Time and Production

If a realm time rate differs, the owning systems determine whether:

- crops;
- automation;
- biology;
- NPC schedules;
- mana;
- ecology

respond to realm-local time, world time or another declared basis.

Document 14 supplies mapping.

---

# 24. Time Exploit Prevention

Realm time cannot be used to create:

- infinite crop production;
- free machine output;
- contract duplication;
- instant biological recovery;
- repeated loot

without the owning systems applying valid elapsed-time rules.

---

# 25. Matter Laws

Realm laws may affect:

- Block stability;
- material decay;
- growth;
- phase;
- heat;
- pressure;
- corrosion;
- magic;
- living matter;
- foreign matter.

Document 03 owns Block identity/state capabilities.

Document 14 supplies realm context.

---

# 26. Foreign Material

Imported Overworld Blocks may be:

- stable;
- degraded;
- altered;
- magically unstable;
- prohibited by law;
- locally transformed

according to the realm definition.

They do not silently become new canonical Blocks.

---

# 27. Building in Realms

Voxel building remains a major gameplay pillar unless a realm explicitly restricts it.

Possible restrictions:

- protected sacred material;
- living substrate;
- unstable reality;
- gravity constraints;
- pressure;
- corrosive environment;
- dream persistence;
- permissions.

## 27.1 Realm-Adapted Building

Document 20G may provide:

- realm foundation modules;
- local material roles;
- shelter rules;
- portal facilities;
- adaptation modules;
- imported-supply requirements.

---

# 28. Survival Boundary

Document 14 defines realm survival facts.

Set 29 owns biological consequence.

Realm survival fields may include:

- breathability;
- temperature;
- pressure;
- mana exposure;
- radiation-like exposure;
- food compatibility;
- rest compatibility;
- sleep anomaly;
- identity/soul hazard;
- disease vector;
- special protection.

---

# 29. No Duplicate Hunger / Health System

Document 14 must never maintain:

- Realm Health;
- Realm Hunger;
- Realm Stamina.

It provides context to Set 29.

---

# 30. Death and Recovery

Realm definitions may modify:

- corpse persistence;
- spirit separation;
- realm ejection;
- tombstone compatibility;
- rescue access;
- revival constraints;
- inventory recovery.

Document 16/29 own death/biological state.

Document 14 owns realm transition/recovery context.

---

# 31. Safe Return

Normal intended routes require one or more:

- reciprocal gate;
- return anchor;
- ritual;
- repaired route;
- negotiated route;
- emergency beacon;
- emergency consumable;
- rescue route;
- realm-ejection rule.

## 31.1 Deliberate One-Way Content

One-way challenge content is permitted only if:

- clearly signposted;
- explicitly authored;
- recovery/failure rules known;
- save cannot become irrecoverably corrupted.

---

# 32. Return-State Classification

Recommended:

- `stable_reciprocal`
- `stable_conditional`
- `consumable_return`
- `constructible_return`
- `negotiated_return`
- `emergency_rescue`
- `temporary_one_way`
- `deliberate_no_return_challenge`
- `return_unknown`
- `return_broken`

---

# 33. Access Routes

24D route classes include:

- Natural Crossing
- Ancient Gate
- Ritual Route
- Engineered Portal
- Faction Route
- accidental/breach paths where authored
- interstitial paths
- realm-specific routes

Document 14 instantiates their route state.

---

# 34. Route Instance

```yaml
realm_route_instance:
  realm_route_id: realm_route:<ulid>
  route_definition_ref: <24D_route_family>
  origin_realm_ref: <id>
  origin_anchor_ref: <id>
  destination_realm_ref: <id>?
  destination_anchor_ref: <id>?
  route_class: <class>

  access:
    discovery_state: <state>
    attunement_ref: <id>?
    requirement_refs: []
    political_permission_refs: []
    movement_requirement_refs: []
    magic_requirement_refs: []

  runtime:
    stability_band: <band>
    capacity_band: <band>
    active_state: closed
    return_state: <classification>
    hazard_refs: []
    quarantine_state: none

  history:
    owner_refs: []
    repair_refs: []
    route_event_refs: []

  revision: <rev>
```

---

# 35. Route Versus Portal

A route is a persistent origin-to-destination relationship.

A portal is one possible physical/magical mechanism providing that route.

One route might use:

- portal frame;
- dream boundary;
- spirit road;
- storm opening;
- Void passage;
- ritual threshold.

---

# 36. Portal Physical Structure

Document 12 owns portal-frame Structure Instance.

Document 09 owns:

- activation;
- mana;
- ritual;
- magical stabilisation.

Document 14 owns:

- destination route;
- realm/anchor binding;
- route state;
- transition orchestration.

---

# 37. Anchors

An anchor identifies a stable or conditionally stable destination address.

Anchor properties may include:

- realm;
- region;
- site;
- local arrival envelope;
- ownership;
- discovery;
- attunement;
- condition;
- capacity;
- safety classification;
- protection;
- return capability;
- local law snapshot requirement.

---

# 38. Anchor Instance

```yaml
realm_anchor:
  anchor_id: realm_anchor:<ulid>
  realm_instance_ref: <id>
  region_ref: <id>
  site_or_structure_ref: <id>?
  local_arrival_area_ref: <id>
  anchor_definition_ref: <id>
  attunement_keys: []
  owner_ref: <id>?
  condition_state: intact
  security_state_ref: <id>?
  discovery_state: unknown
  return_capability_ref: <id>?
  revision: <rev>
```

---

# 39. Destination Addressing

Destination selection may use:

- anchor ID;
- runic attunement;
- coordinates;
- name;
- memory;
- relic;
- faction route;
- ritual;
- dream relationship.

Document 09 validates magical method.

Document 14 resolves destination.

---

# 40. Portal Progression

Useful conceptual stages from v0.1 remain:

- Dormant Gate
- Unstable Breach
- Restored Ancient Gate
- Engineered Portal
- Networked Realm Infrastructure

These are capability stages, not mandatory chronological IDs.

---

# 41. Dormant Gates

Dormant gates can appear early as:

- exploration clue;
- ruin;
- unknown machine;
- sealed arch;
- dead anchor.

They need not be usable.

---

# 42. Unstable Breaches

Breaches may support:

- temporary expedition;
- creature leak;
- resource opportunity;
- emergency;
- event.

They must have bounded duration/failure.

---

# 43. Stable Gates

Stable gates support:

- repeat travel;
- settlement contact;
- trade;
- migration;
- infrastructure.

They require maintenance and authority where defined.

---

# 44. Engineered Portals

Player/faction-built portals may require:

- frame;
- materials;
- anchor;
- mana;
- stabiliser;
- control;
- ward;
- knowledge;
- permissions;
- maintenance;
- safe arrival.

Document 05/20 construction owners commit physical creation.

---

# 45. Portal Security

Security may include:

- owner permission;
- faction gate;
- ward;
- filter;
- customs;
- quarantine;
- aperture restrictions;
- cargo class;
- traveller identity.

Document 13 owns legal/political permission.

Set 28 may own social consent.

---

# 46. Portal Throughput

Portal capacity is physical/magical infrastructure.

Potential constraints:

- aperture;
- mana;
- stability;
- cooldown;
- mass/volume;
- cargo class;
- traveller count;
- destination capacity;
- quarantine.

Set 27 uses actual capacity for economics.

---

# 47. Portal Failure

Failure may cause:

- refusal;
- shutdown;
- incomplete activation;
- route drift;
- temporary instability;
- safe ejection;
- emergency return;
- route collapse;
- leak;
- severe authored anomaly.

Normal failure should be readable.

---

# 48. Portal Drift

Route drift must not randomly delete players/items.

A drift outcome can use:

- alternate safe anchor;
- interstitial detour;
- known instability;
- emergency rescue.

Destructive outcomes must be explicitly high-risk content.

---

# 49. Realm Transition Transaction

Cross-realm transition is authoritative.

Suggested flow:

**Request Route Use**  
→ **Validate Route/Anchor**  
→ **Validate Magic/Power**  
→ **Validate Permission**  
→ **Validate Traveller/Cargo**  
→ **Validate Destination Arrival Envelope**  
→ **Reserve Throughput**  
→ **Begin Transition**  
→ **Commit Origin Release**  
→ **Commit Destination Presence**  
→ **Emit Arrival Evidence**  
→ **Release Reservation**

---

# 50. Atomic Realm Transition

A traveller must not exist authoritatively in both realms.

If transition fails after origin release, recovery uses:

- transaction log;
- safe origin;
- destination reservation;
- emergency route.

---

# 51. Inventory During Transition

Inventory remains attached to the authoritative entity/container.

Portal travel does not copy items into a destination inventory.

---

# 52. Vehicles and Mounts

Portal definitions declare compatibility for:

- player;
- NPC;
- creature;
- mount;
- cart;
- guided vehicle;
- cargo;
- vessel where applicable.

Set 30/26 owns physical movement before/after transition.

---

# 53. Vessel Realm Travel

Set 26 owns vessel identity/movement.

Document 14 may provide:

- realm route;
- destination;
- portal aperture;
- dimensional sea crossing;
- realm-storm route.

Set 26 validates whether vessel can use it.

---

# 54. Maritime Realm Integration

Potential maritime realm systems include:

- dimensional currents;
- underwater portals;
- realm seas;
- pressure changes;
- abyssal routes;
- marine realm ecology;
- portal harbours.

Set 26 remains maritime specialist.

---

# 55. Movement Interface

Set 30 consumes:

- gravity;
- local-up;
- air/wind;
- buoyancy;
- drag;
- route anchors;
- clearance;
- movement capability requirements;
- arrival transition links.

Document 14 does not calculate locomotion speed.

---

# 56. Environmental Movement Fields

Realm law profiles enter Set 30 through generic fields rather than realm-name checks.

Examples:

- reversed gravity;
- low gravity;
- strong windway;
- external force;
- buoyancy;
- high drag;
- dream displacement constraint.

---

# 57. Arrival

Arrival should communicate the realm quickly through:

- safe/unsafe terrain;
- environmental state;
- skyline;
- sound;
- route marker;
- local law cues;
- civilisation/ecology evidence.

---

# 58. Arrival Envelope

An arrival envelope specifies:

- valid local area;
- clearance;
- support;
- hazard class;
- maximum party size;
- vehicle compatibility;
- emergency fallback;
- safe positions.

Set 30/26 finalises physical placement.

---

# 59. Arrival Safety

Normal routes cannot place travellers:

- inside solid Blocks;
- under lethal terrain;
- outside world bounds;
- at impossible pressure/atmosphere without warning;
- in unloaded invalid state.

---

# 60. Dangerous Arrival

Dangerous routes are valid if:

- danger is authored;
- warning exists;
- preparation exists;
- intended progression allows it.

---

# 61. Realm Navigation

Different realms may use:

- maps;
- stars;
- roots;
- roads;
- currents;
- memories;
- sound;
- machine signals;
- spirit paths;
- anchor networks.

Document 14 exposes navigation law/context.

Set 30 owns physical route execution.

Set 28 owns knowledge.

---

# 62. Map Reliability

A realm may alter:

- compass reliability;
- map persistence;
- memory;
- coordinate stability;
- landmark reliability.

Set 28/17 owns what the player believes/sees.

Document 14 exposes objective navigation anomaly.

---

# 63. Somnolent / Memory Navigation

A network/reflection realm can use:

- remembered place;
- dream relationship;
- emotional association;
- promise;
- symbolic anchor

as route-selection inputs.

This remains bounded by stable route/instance records.

---

# 64. Interstitial Travel

Void Between or similar spaces may act as:

- route;
- shortcut;
- failure state;
- dangerous destination.

Interstitial content still has:

- identity;
- laws;
- persistence;
- safe-return rules.

---

# 65. Building Infrastructure Across Realms

Realm infrastructure may include:

- arrival sanctuary;
- portal station;
- stabiliser;
- local shelter;
- warehouse;
- customs;
- mana/power;
- quarantine;
- embassy;
- road;
- beacon.

Document 20 owns facility function.

---

# 66. Realm Settlements

Selected realms may support permanent settlements.

Document 14 supplies:

- realm law;
- region;
- route access;
- survival requirements;
- realm-state context.

Document 07/19/20 operate the settlement.

---

# 67. Realm Settlement Needs

The same seven needs remain:

- Housing
- Provisions
- Health
- Work
- Safety
- Infrastructure
- Morale

Realm law changes valid solutions, not the top-level needs.

---

# 68. Settlement Adaptation

A realm settlement may need:

- pressure protection;
- realm-compatible foundations;
- local food;
- mana shielding;
- reality stabilisation;
- unusual transport;
- quarantine.

Document 20G resolves adaptation packs.

---

# 69. Cross-Realm Migration

People can move between realms through valid routes.

Document 07 owns person/household operation.

Document 13 owns migration/citizenship/political status.

Set 30/26/14 execute journey/transition layers.

---

# 70. No Realm Ancestry Lock

Native or ancient societies may have strong realm connections.

But a realm can contain:

- native peoples;
- migrants;
- colonists;
- refugees;
- traders;
- embassies;
- mixed settlements;
- visitors.

---

# 71. Sovereignty

Document 13 owns sovereignty and political control.

Document 14 stores route/realm references.

Owning a gate does not mean owning the realm.

---

# 72. Realm Route Control

Political route control may affect:

- permission;
- toll;
- customs;
- quarantine;
- closure.

Document 13/27 owns those policies/economics.

Document 14 owns route physical/dimensional availability.

---

# 73. Colonisation

Cross-realm colonisation requires:

- viable route;
- local survival;
- settlement supply;
- existing society/claims;
- ecology;
- law;
- infrastructure.

Empty-looking terrain is not automatically politically empty.

---

# 74. Realm Ecology

24F/Document 10 own creature/ecology.

Document 14 supplies:

- realm law;
- biome;
- route leakage;
- migration transition;
- dynamic realm state.

---

# 75. Cross-Realm Ecology

Realm contact may cause:

- invasive species;
- beneficial pollinator introduction;
- disease vector;
- predator movement;
- magical ecology transfer;
- domesticated-species spread.

Document 10 persists ecology consequence.

---

# 76. Quarantine

Realm routes may use quarantine state.

Document 14 owns route quarantine state reference.

Document 13 owns legal authority.

Set 29 owns biological disease/exposure.

Set 27 handles economic impact.

---

# 77. Realm Resources

24J/06 own resource identity.

24D defines realm resource roles.

Document 14 provides realm provenance/context.

Resources should support:

- survival;
- construction;
- magic;
- automation;
- settlement;
- trade;
- restoration.

---

# 78. No Disposable Realm Ore Tier

A realm resource should not exist only because:

`Tier 8 ore > Tier 7 ore`.

It should have a distinctive capability or strategic role.

---

# 79. Cross-Realm Resource Provenance

Items/resources may retain:

- source realm;
- region;
- extraction site;
- stability requirements;
- contamination/corruption;
- legal status.

Set 27 can value provenance.

---

# 80. Crafting

Document 05 owns transformations.

Realm law may alter:

- valid workstation;
- environment;
- catalyst;
- stability.

Document 14 supplies context.

---

# 81. Automation

Document 08 owns machine runtime.

Realm context may change:

- power;
- heat;
- pressure;
- corrosion;
- mana;
- gravity;
- interference;
- fluid behaviour.

Automation consumes realm environment/provider snapshots.

---

# 82. Machines in Realms

Machines should normally remain usable through adaptation where practical.

Realms should not invalidate the entire automation pillar unless their identity specifically requires it and provides alternate play.

---

# 83. Magic

Document 09 owns:

- portal magic;
- realm spells;
- mana;
- rituals;
- stabilisation.

Document 14 owns:

- realm identity;
- destination;
- laws;
- route state.

---

# 84. Magic Affinity

A realm may modify:

- mana density;
- school affinity;
- instability;
- anti-magic;
- forbidden effects.

Document 09 resolves magical outcome.

---

# 85. Realm Leakage

A realm can influence another world through:

- weather;
- ecology;
- magic;
- dreams;
- spirits;
- terrain;
- resources;
- corruption.

Leakage requires:

- source;
- path;
- scope;
- state;
- reversibility/containment policy.

---

# 86. Leakage Record

```yaml
realm_leakage:
  leakage_id: realm_leakage:<ulid>
  source_realm_ref: <id>
  destination_realm_ref: <id>
  route_or_breach_ref: <id>
  leakage_tags: []
  intensity_band: <band>
  affected_area_refs: []
  start_world_time: <time>
  containment_ref: <id>?
  current_state: active
  revision: <rev>
```

---

# 87. Realm Dynamic States

Examples:

- stabilised;
- restored;
- corrupted;
- occupied;
- isolated;
- quarantined;
- breached;
- collapsing;
- industrialised;
- contested;
- sealed;
- recovering.

These are instance state, not new realm definitions.

---

# 88. Realm Restoration

A realm may be restored through:

- cleansing;
- infrastructure;
- political reform;
- ecology;
- boss resolution;
- ritual;
- structure repair.

Restoration does not necessarily mean “return to original.”

---

# 89. Realm Collapse

Collapse may affect:

- routes;
- region existence/access;
- material stability;
- settlements;
- ecology;
- portals.

Collapse requires explicit high-consequence rules and save recovery.

---

# 90. Realm Sealing

A realm/route may be sealed:

- temporarily;
- politically;
- magically;
- structurally;
- permanently through authored climax.

Existing entities inside require defined consequences.

---

# 91. Isolation

A realm can become isolated while remaining persistent.

Its distant simulation continues according to LOD if intended.

---

# 92. Reopening

Reopening should preserve:

- elapsed history;
- settlement state;
- ecology;
- political change;
- damage.

It should not reset the realm.

---

# 93. Dungeons

24G owns realm dungeon families.

Document 14 supplies:

- realm law;
- region;
- access;
- route;
- dynamic realm state.

Document 12 persists site.

---

# 94. Realm Dungeon Identity

A realm dungeon should use realm rules meaningfully.

Examples:

- gravity maze;
- dream-memory topology;
- contract gate;
- pressure abyss;
- machine sector;
- spirit court.

A recoloured Overworld dungeon is insufficient.

---

# 95. Bosses

24H owns boss content.

Document 14 supplies:

- realm role;
- territory;
- route relationship;
- realm state;
- aftermath hook.

---

# 96. Realm Guardians

A guardian may:

- protect route;
- regulate ecology;
- embody law;
- control infrastructure;
- represent polity.

Defeating it may create problems.

---

# 97. Realm Boss Alternatives

Where authored:

- diplomacy;
- repair;
- ritual;
- alliance;
- restoration;
- containment;
- replacement;
- reform

may resolve a realm-climax path.

---

# 98. Cross-Realm Politics

Document 13 owns:

- treaties;
- sovereignty;
- route claims;
- embassies;
- citizenship.

Document 14 exposes actual route/realm state.

---

# 99. Embassies

An embassy can exist in:

- Overworld;
- realm settlement;
- portal sanctuary.

Document 12/20 owns structure/service.

Document 13 owns political status.

---

# 100. Economy

Set 27 owns:

- prices;
- markets;
- trade contracts;
- tariffs;
- finance.

Document 14 supplies:

- route availability;
- capacity;
- realm provenance;
- hazard;
- closure.

---

# 101. Interdimensional Trade

Trade requires:

- actual goods;
- route;
- throughput;
- ownership;
- customs;
- destination;
- physical/dimensional transit.

No ledger-only teleport trade.

---

# 102. Freight Portals

Freight portals may support:

- pallets/lots;
- carts;
- containers;
- machinery;
- specialised vessel interfaces.

Document 08 handles loading.

Document 14 handles route transition.

---

# 103. Portal Tolls

Document 13 supplies political authority.

Set 27 determines amount/collection.

Document 14 only blocks route if payment/permission owner says it is blocked.

---

# 104. Smuggling

Smuggling may exploit:

- hidden route;
- corrupted official;
- unstable breach;
- concealed cargo.

Set 27/13/28 handle economic/legal/social state.

Document 14 handles route feasibility.

---

# 105. Military Use

Realm routes may support:

- troop movement;
- evacuation;
- blockade;
- invasion;
- supply.

Document 14 provides route capacity/state.

Document 16/13/30 execute war/movement.

---

# 106. No Instant Army Teleport

Military portal throughput is limited by:

- capacity;
- power;
- permissions;
- arrival space;
- route stability.

---

# 107. Portal Blockade

A route can be blocked by:

- physical gate destruction;
- magic;
- political closure;
- enemy control;
- destination failure;
- capacity saturation.

Document 14 records route state.

---

# 108. World-State Consequences

Realm interaction can affect the Overworld through:

- new resources;
- migration;
- trade;
- magic;
- weather;
- ecology;
- politics;
- structures;
- technology;
- corruption;
- refugees;
- knowledge.

---

# 109. Consequence Routing

A cross-realm event emits typed evidence to:

- worldgen/environment;
- ecology;
- civilisation;
- economy;
- social;
- quests;
- structures;
- magic.

Document 14 does not directly mutate every domain.

---

# 110. Discovery

Objective discovery can include:

- realm known to exist;
- route known to exist;
- anchor discovered;
- destination confirmed.

Set 28 owns who knows/believes it.

---

# 111. Realm Knowledge

Possible player/NPC knowledge states:

- unknown;
- rumoured;
- partially mapped;
- confirmed;
- visited;
- surveyed;
- infrastructure-integrated.

Set 28/17 owns actor-facing knowledge state/UI.

---

# 112. Realm Atlas UI

Document 17 may show:

- realm nodes;
- routes;
- anchors;
- hazards;
- return state;
- settlements;
- logistics;
- confidence.

It must not reveal hidden server truth.

---

# 113. Preparation UI

Portal/realm preparation may display:

- route;
- destination confidence;
- atmosphere;
- gravity;
- protection;
- return;
- equipment;
- cargo restrictions;
- party permission;
- known threats.

---

# 114. Unknown Hazards

Spoiler-sensitive realm content can remain unknown while still giving sufficient safety warnings.

Example:

“Atmosphere requires sealed breathing protection” does not need to reveal the realm's entire ecology.

---

# 115. Accessibility

Realm effects should support alternatives for:

- colour shifts;
- distortion;
- screen warping;
- flashing;
- unusual gravity camera;
- dream effects;
- audio-only navigation.

Gameplay truth must remain understandable.

---

# 116. Realm Camera Comfort

Set 30/17 handles camera.

Realm law exposes:

- local-up;
- gravity changes;
- visual transition cues.

Settings may reduce camera rotation while preserving movement truth.

---

# 117. Multiplayer Authority

Server/host owns:

- realm instance state;
- route state;
- anchor state;
- transition transactions;
- realm law revision;
- dynamic realm state;
- route discovery objective truth.

Clients request travel.

---

# 118. Multiplayer Transition

A party may:

- transition together;
- split across realms;
- use capacity-limited route;
- wait for cooldown.

Each entity remains authoritative.

---

# 119. Party Cohesion

Set 28 can request group/formation intent.

Document 14/30 validates whether members actually pass.

A party is not automatically teleported because leader crossed.

---

# 120. Join-in-Progress

A joining player may reconnect:

- in their current realm;
- at safe party-compatible anchor;
- through explicit recovery.

Never spawn in invalid unloaded void.

---

# 121. Save During Transition

A save records enough transaction state to recover:

- origin;
- destination;
- traveller;
- cargo;
- reservation;
- commit phase;
- fallback.

---

# 122. Persistent Realm Worlds

Realm chunks and instances persist like Overworld world state.

Player construction, settlements, damage and ecology changes remain.

---

# 123. Realm LOD

### R0 — Active Local Realm
- loaded terrain;
- actors;
- structures;
- machines;
- local environment.

### R1 — Active Regional
- nearby region summaries;
- settlements;
- ecology;
- routes.

### R2 — Realm Summary
- political/ecological/economic summaries;
- major structures;
- active bosses/events;
- route state.

### R3 — Network Summary
- cross-realm routes;
- migration;
- trade;
- major events.

### R4 — Dormant Realm
- stable instance;
- scheduled milestones;
- wake triggers.

---

# 124. LOD Invariants

Distance/unloading cannot change:

- realm identity;
- portal ownership;
- route stability;
- settlements;
- major damage;
- boss outcome;
- realm law;
- persistent construction;
- migration history.

---

# 125. Distant Realm Simulation

Distant realms may process:

- settlement change;
- ecology;
- trade;
- politics;
- boss/events;
- route maintenance;
- resource extraction

through bounded specialist summaries.

Document 14 coordinates realm wake/state.

---

# 126. No Inactive-Realm Reset

Leaving a realm does not restore:

- bosses;
- loot;
- buildings;
- routes;
- politics.

---

# 127. Realm Streaming

Each realm can maintain independent:

- chunk coordinate space;
- streamed regions;
- local world state;
- environment fields.

The technical implementation must not require all realms loaded simultaneously.

---

# 128. Realm Coordinate Space

Use realm-local coordinates plus RealmInstance ID.

Do not rely on placing every realm millions of metres apart in one global scene.

---

# 129. World Address

Conceptually:

```text
WorldAddress
  world_id
  realm_instance_id
  chunk_or_region
  local_position
  optional moving_frame
```

---

# 130. Pocket Realms

Created Pockets are bounded dimension instances.

Each needs:

- creator/source;
- owner;
- size/capacity;
- laws;
- entry;
- exit;
- persistence;
- collapse behaviour;
- storage rules;
- access permissions.

---

# 131. Pocket Creation

If player/faction-created pockets exist:

- cost;
- stability;
- maximum capacity;
- persistence;
- ownership;
- server limits;
- safe collapse

must be explicit.

---

# 132. Pocket Storage Exploit

Pocket realms cannot create infinite free storage.

Capacity and persistence are authoritative.

---

# 133. Pocket Collapse

Collapse must specify:

- entities;
- inventory;
- structures;
- return/ejection;
- irrecoverable loss rules.

Default should favour safe deterministic recovery.

---

# 134. Realm Clusters

Cluster families may have multiple generated subrealm instances.

Example:

`Ashen Lower Realms`
→ several domains.

Each subrealm can have:

- ID;
- route;
- law;
- political state.

---

# 135. Network Realms

Network realms do not need one continuous terrain.

They may consist of connected nodes/domains.

Routes between nodes remain explicit.

---

# 136. Reflection / Layer Realms

Layered realms may align with Overworld places.

A coordinate relationship might depend on:

- physical location;
- memory;
- death;
- ritual;
- person.

Document 14 resolves stable correspondence.

---

# 137. Artificial Realms

World-Engine or other artificial realms can contain:

- sectors;
- systems;
- machinery;
- access permissions;
- repair state;
- artificial environmental law.

Document 08 owns machine behaviour.

Document 14 owns world topology/law.

---

# 138. Interstitial Realms

Interstitial spaces are real runtime environments where authored.

They can have:

- routes;
- hazards;
- creatures;
- resources;
- failure states.

They must not be undefined loading screens used as gameplay worlds accidentally.

---

# 139. Realm-Specific Survival

Each realm chooses a limited readable set of meaningful differences.

Avoid stacking every possible survival rule in every realm.

---

# 140. Realm-Specific Technology

Realm law can create:

- machine adaptation;
- local power source;
- special material.

It should not make all existing technology useless unless the realm's identity requires deliberate alternate infrastructure.

---

# 141. Realm-Specific Magic

Magic schools remain shared.

Realm laws modify:

- affinity;
- cost;
- availability;
- stability.

No isolated “Verdant Magic System” duplicate is needed.

---

# 142. Realm-Specific Building

Universal building functions remain.

Realm packs modify:

- materials;
- foundation;
- atmosphere;
- access;
- style;
- utilities.

---

# 143. Realm-Specific Civilisation

Document 13 remains political owner.

A realm can contain:

- many cultures;
- governments;
- factions;
- settlements.

---

# 144. Realm-Specific Ecology

Document 10 remains ecology owner.

Realm families supply native content and law.

---

# 145. Realm-Specific Economy

Set 27 remains economy owner.

Realm scarcity and routes become economic inputs.

---

# 146. Realm-Specific Movement

Set 30/26 remains movement owner.

Realm law supplies environment.

---

# 147. Realm-Specific Biology

Set 29 remains biology owner.

Realm law supplies exposure.

---

# 148. First Full-Realm Production Target

Set 25F identifies **Verdant Covenant** as the proposed/current Core Production first fully playable realm target and **Ancestral Veil** as a bounded teaser-route target.

Document 14 treats these as scope classifications governed by Set 25 rather than hardcoding them as universal first-access order.

## 148.1 Important Distinction

“First fully implemented production realm” does **not** mean:

“Every world must enter this realm first.”

Content maturity and procedural access order are separate.

---

# 149. Verdant Covenant Runtime Role

Document 14 consumes 24D's full Verdant Covenant definition.

Runtime responsibilities include:

- realm instance;
- route graph;
- law stack;
- arrival anchors;
- return safety;
- region persistence;
- settlements;
- ecology refs;
- restoration/outcome state;
- cross-realm effects.

---

# 150. Ancestral Veil Teaser Role

A teaser may expose:

- evidence;
- dreams;
- spirit route clue;
- limited anchor;
- partial interaction.

It need not ship as a complete realm.

---

# 151. Other Realm Families

The runtime architecture supports all twelve families even if not all content is release-ready.

Content availability follows Set 25 classification.

---

# 152. Verdant Covenant Is Not “The Elf Realm”

No realm is biologically equivalent to one ancestry.

24E/13 governs society.

---

# 153. Ancestral Veil Is Not “The Dead People Realm”

Realm relationship to memory/death/spirit does not mean every dead person becomes a resident or every undead identity belongs there.

---

# 154. Divine Concords

A divine-domain family does not prove one religion universally correct.

Developer/runtime world structure can coexist with conflicting cultural beliefs.

---

# 155. Necropolis Domains

Undead/personhood remains separate.

Document 10/13 determines personhood.

---

# 156. Elemental Confluences

Elemental laws modify:

- matter;
- movement;
- ecology;
- magic.

They are not simple ore dimensions.

---

# 157. World-Engine

Artificial realm identity can integrate:

- automation;
- repair;
- machine civilisation;
- constructs.

It does not make Document 14 own machines.

---

# 158. Impossible Deep

Pressure, depth and unusual fluid/space rules may require Set 26/29/30 integration.

---

# 159. Void Between

Interstitial instability requires strong:

- safe return;
- navigation;
- transaction recovery.

---

# 160. Somnolent Expanse

Dream-state rules require:

- stable identity;
- save safety;
- Set 28 knowledge/memory separation;
- Set 29 biological boundary.

---

# 161. Ashen Lower Realms

A cluster can contain multiple political/ecological domains.

It is not a single hell biome.

---

# 162. Created Pockets

Pockets can be:

- laboratory;
- farm;
- prison;
- vault;
- trial;
- sanctuary;
- storage

only when their capacity and safety rules permit.

---

# 163. Realm Outcome Types

Examples:

- alliance;
- restoration;
- reform;
- conquest;
- isolation;
- cleansing;
- containment;
- negotiated balance;
- collapse;
- sealing;
- industrialisation;
- protected wilderness.

---

# 164. Outcomes Are Instance State

A “Restored Verdant Covenant” does not need a new realm definition.

It is state on the same RealmInstance.

---

# 165. Realm History

Each realm instance can accumulate:

- settlement;
- migration;
- treaty;
- boss outcome;
- portal repair;
- collapse;
- restoration;
- exploitation;
- player construction.

---

# 166. Cross-Realm Historical Evidence

History may leave:

- ruins;
- imports;
- diaspora;
- relics;
- invasive ecology;
- architecture;
- treaties.

---

# 167. Quests and Events

Document 15 can bind to:

- realm instance;
- route;
- anchor;
- law state;
- dynamic outcome;
- boss state.

Document 14 supplies evidence.

---

# 168. Realm Event Examples

- portal storm;
- route closure;
- realm leak;
- diplomatic opening;
- migration;
- collapse;
- boss awakening;
- law shift;
- artificial-system failure.

---

# 169. Combat

Document 16 owns combat.

Realm law may affect:

- projectile physics context;
- gravity;
- environment;
- magical affinity.

---

# 170. Fall / Impact

Set 30 produces movement impact.

Set 29 owns biological injury.

Document 14 supplies gravity.

---

# 171. Realm Equipment

Document 04 owns equipment.

Realm profiles may require:

- breathing gear;
- pressure gear;
- stabiliser;
- realm footwear;
- navigation focus.

---

# 172. Preparation Does Not Mean One Key Item

Realm access may require combinations of:

- knowledge;
- structure;
- catalyst;
- power;
- ritual;
- specialist;
- permission;
- boss outcome;
- settlement support;
- anchor.

---

# 173. Capability-Based Access

Access should query capabilities rather than exact item names where possible.

Example:

`realm.pressure_protection.tier2`

could come from:

- equipment;
- magic;
- vessel;
- settlement service.

---

# 174. Progression

Realm progression is a branching constellation.

Paths can include:

- research;
- diplomacy;
- restoration;
- combat;
- settlement;
- engineering;
- magic;
- exploration.

---

# 175. Realm Access Is Not Level-Gated Alone

Overall level can support capability.

It cannot replace:

- route;
- knowledge;
- preparation;
- permission;
- infrastructure.

---

# 176. Resource Progression

Realm resources expand capability.

They do not replace all Overworld materials.

---

# 177. Automation Progression

Dimensional logistics arrive only when physical/magical infrastructure supports them.

---

# 178. Settlement Progression

Realm outposts may become permanent settlements if survival/logistics/civilisation permit.

---

# 179. Player-Founded Realm Settlement

Document 19 handles planning.

Document 13 handles political state.

Document 14 supplies realm law.

---

# 180. Realm Infrastructure Dependencies

Realm facilities may depend on:

- local source;
- imported supply;
- portal throughput;
- power;
- mana;
- route.

---

# 181. Realm Logistics

Logistics may use:

- player carry;
- pack animals;
- carts;
- vessels;
- portals;
- magical transport.

Each movement owner remains authoritative.

---

# 182. Portal Freight

A portal can become a civilisation logistics route.

It remains:

- limited;
- powered;
- secured;
- maintained.

---

# 183. Cross-Realm Markets

Set 27 uses:

- supply;
- scarcity;
- route risk;
- throughput.

Document 14 exposes route facts.

---

# 184. Portal Customs

Document 13 owns jurisdiction.

Set 27 owns tariffs.

Document 14 owns route availability.

---

# 185. Realm Route Knowledge

Set 28 owns whether a trader knows a route.

Document 14 owns whether the route actually exists.

---

# 186. Realm Politics and Native Societies

Document 13 owns political identity.

Document 14 avoids treating native culture as a realm property.

---

# 187. Realm Civilisation Slots

24D may define suitable civilisation slots.

24E/13 fills them with actual people/polities.

---

# 188. Realm Settlement Sovereignty

A settlement in another realm can have:

- local sovereignty;
- colonial authority;
- enclave status;
- shared government;
- occupation.

---

# 189. Cross-Realm War

War can extend across realm routes.

Physical invasion requires:

- route;
- capacity;
- supply.

---

# 190. Realm Route Military Security

Portal sites can be:

- fortified;
- blockaded;
- sabotaged;
- quarantined.

Document 12/16/13 own physical/political parts.

---

# 191. Realm Ecology Leakage

Document 10 can create invasive/ecological consequences from route events.

---

# 192. Resource Leakage

Matter can leak only through a defined process.

No realm portal randomly spawns resources without provenance.

---

# 193. Magic Leakage

Document 09 resolves magical consequences.

Document 14 provides source route/realm.

---

# 194. Weather Leakage

World/environment systems resolve weather.

Document 14 provides relationship/route source.

---

# 195. Cross-Realm Disease

Set 29 owns infection.

Document 14/10 provide route/vector.

---

# 196. Cross-Realm Knowledge

Set 28 owns spread.

Document 14 provides route/discovery events.

---

# 197. Realm Collapse Save Safety

Catastrophic realm change must preserve recoverability for:

- players;
- named NPCs;
- settlements;
- inventories

according to authored rules.

---

# 198. No Silent World Deletion

Realm collapse cannot simply delete a save-directory without explicit irreversible design.

---

# 199. Realm Instance Lifecycle

Suggested states:

- `generated_hidden`
- `discoverable`
- `active`
- `isolated`
- `quarantined`
- `sealed`
- `unstable`
- `collapsing`
- `collapsed_recoverable`
- `destroyed_irreversible` only if explicitly supported
- `archived`

---

# 200. Created Realm Instances

Pocket realms may be created dynamically.

Major Atlas realms are normally derived from the world network.

---

# 201. New Content Packs

A content pack may add new realm families.

Existing RealmInstance IDs must not be rewritten.

---

# 202. Existing Worlds

New realm family additions may appear through:

- unexplored realm-network slot;
- new route;
- world event;
- explicit migration.

Do not silently replace existing realm nodes.

---

# 203. Definition Updates

Existing explored realms preserve:

- generated region graph;
- structures;
- routes;
- local state.

New source may apply only through migration rules.

---

# 204. Realm-Local Generated Freeze

Once:

- explored;
- settled;
- modified;
- quest-bound;
- route-bound,

realm regions freeze against silent regeneration.

---

# 205. Stable IDs

Examples:

```text
leyforge.core.realm.verdant_covenant
leyforge.core.realm.ancestral_veil
leyforge.core.realm.somnolent_expanse
leyforge.core.realm.aetheric_reach
leyforge.core.realm.impossible_deep
leyforge.core.realm.world_engine
leyforge.core.realm.ashen_lower_realms
leyforge.core.realm.void_between
leyforge.core.realm.divine_concords
leyforge.core.realm.necropolis_domains
leyforge.core.realm.elemental_confluences
leyforge.core.realm.created_pockets
```

Final ID spelling follows the authoritative 24D/25 registry.

---

# 206. Migration from Legacy Dimension IDs

Legacy IDs can alias to canonical 24D IDs.

Do not keep two editable realm definitions.

---

# 207. POC Retirement

The v0.1 POC explicitly scoped:

- dormant portal;
- damaged components;
- unknown destination;
- limited stabilisation;
- environmental evidence;
- no functional realm travel.

Production no longer uses that POC as generation law.

---

# 208. Archived POC Wrapper

Archive:

- fixed Forest Hamlet portal;
- old rune clearing;
- fixed dormant gate position;
- fixed first realm implication;
- POC-only portal item requirements.

---

# 209. Preserved POC Capabilities

Preserve:

- inspectable dormant gate;
- damaged portal infrastructure;
- repair/stabilisation;
- unknown destination;
- realm clues;
- mana response;
- portal ownership;
- safe failure;
- preparation;
- future access foreshadowing.

---

# 210. POC Regression Use

The old fixture may still test:

- inspect portal;
- read state;
- missing component;
- stabilise;
- save/load;
- UI warnings;
- no accidental teleport;
- migration.

---

# 211. UI Read Models

Document 14 exposes read models for:

- realm instance;
- route;
- anchor;
- destination;
- stability;
- capacity;
- return state;
- law/environment summary;
- route closure;
- transition state.

Set 28/17 filters by knowledge.

---

# 212. Diagnostics

Recommended codes:

| Code | Meaning |
|---|---|
| `RLM-ID-001` | Realm definition/instance missing. |
| `RLM-SEED-001` | Realm seed/provenance invalid. |
| `RLM-TOPO-001` | Realm topology invalid/disconnected. |
| `RLM-LAW-001` | Realm law stack conflict. |
| `RLM-ENV-001` | Environment snapshot invalid. |
| `RLM-ROUTE-001` | Realm route invalid. |
| `RLM-ANCHOR-001` | Destination anchor invalid. |
| `RLM-RETURN-001` | Required safe return unavailable. |
| `RLM-ACCESS-001` | Access requirements unmet. |
| `RLM-PORTAL-001` | Portal/route binding invalid. |
| `RLM-ARRIVE-001` | Safe arrival cannot resolve. |
| `RLM-TRANS-001` | Cross-realm transition failed. |
| `RLM-CARGO-001` | Traveller/cargo incompatible. |
| `RLM-MOVE-001` | Set 30/26 movement handoff failed. |
| `RLM-BIO-001` | Set 29 survival compatibility failed. |
| `RLM-MAG-001` | Document 09 activation/stability failed. |
| `RLM-POL-001` | Document 13 permission/political state blocks route. |
| `RLM-ECON-001` | Set 27 economic obligation blocks authorised use. |
| `RLM-LEAK-001` | Realm leakage state invalid. |
| `RLM-COLL-001` | Realm collapse/recovery invalid. |
| `RLM-LOD-001` | LOD transition inconsistency. |
| `RLM-SAVE-001` | Save/migration inconsistency. |
| `RLM-AUTH-001` | Unauthorised realm-state mutation. |
| `RLM-POC-001` | Retired POC dependency detected. |

---

# 213. Validation

## 213.1 Realm Definition Validation

Validate:

- stable ID;
- class;
- law profile;
- topology;
- required content packages;
- route categories;
- safe-return policy;
- production status.

## 213.2 Realm Instance Validation

Validate:

- seed/provenance;
- region graph;
- law stack;
- route graph;
- dynamic state.

## 213.3 Route Validation

Validate:

- origin;
- destination;
- anchor;
- access;
- return;
- capacity;
- compatibility.

---

# 214. Major Realm Completeness Validator

A major playable realm must provide:

- multiple biome/region families;
- survival solution;
- navigation;
- building rules;
- ecology;
- resources;
- civilisation/wilderness explanation;
- dungeons;
- boss/climax path;
- infrastructure;
- return;
- long-term outcomes.

---

# 215. Safe-Return Validator

Fail Core progression generation if:

- required route strands player;
- emergency recovery cannot resolve;
- destination anchor is lethal with no warning;
- return depends on impossible unavailable content.

---

# 216. Movement-Law Validator

Realm law must expose fields through generic contracts.

Fail hard-coded realm-name movement exceptions unless approved.

---

# 217. Biology Boundary Validator

Fail if Document 14 stores duplicate:

- Health;
- Hunger;
- Stamina;
- injury.

---

# 218. Economy Boundary Validator

Fail if Document 14 stores:

- portal price;
- tariff;
- market value

as authoritative economy.

---

# 219. Social Boundary Validator

Fail if Document 14 stores actor:

- belief;
- rumour confidence;
- Trust.

---

# 220. Civilisation Boundary Validator

Fail if realm definition:

- assigns one ancestry as biological owner;
- hardcodes morality from realm origin.

---

# 221. Seed Testing

Test many seeds for:

- at least one reachable realm path when required;
- safe return;
- route variety;
- arrival variety;
- realm politics;
- dungeon accessibility;
- boss accessibility;
- progression;
- no POC fixed sequence.

---

# 222. Transition Test

Test:

- solo player;
- party;
- mount;
- cart;
- cargo;
- NPC;
- creature;
- vessel-compatible route.

---

# 223. Failure Test

Test:

- portal loses power;
- anchor destroyed;
- route closes;
- destination full;
- permission revoked;
- save during transit;
- server disconnect.

---

# 224. LOD Test

Leave realm for long time.

Verify:

- no reset;
- correct distant simulation;
- correct route state;
- persistent player construction.

---

# 225. Cross-Realm Ecology Test

Open route.

Verify controlled migration/leakage.

---

# 226. Realm Settlement Test

Found outpost.

Verify:

- seven needs;
- realm adaptations;
- supply route;
- politics;
- persistence.

---

# 227. Content Update Test

Update 24D source.

Verify modified explored realm does not silently regenerate.

---

# 228. Multiplayer Test

Two players cross route during capacity pressure.

Verify:

- authoritative ordering;
- no duplication;
- safe placement.

---

# 229. Pocket Realm Test

Create/destroy pocket.

Verify capacity and ejection.

---

# 230. Performance

Realm systems scale through:

- independent streaming;
- regional summaries;
- distant LOD;
- route graph rather than loaded worlds;
- scheduled events;
- bounded cross-realm simulation.

---

# 231. Low-End Profiles

Low-end settings may reduce:

- realm visual distance;
- particle density;
- distant update cadence;
- ambient actors;
- biome presentation;
- cross-realm visual effects.

They cannot delete:

- realm routes;
- settlements;
- realm state;
- boss outcome;
- player structures.

---

# 232. Godot / Summer Engine Direction

Replacement Document 18 owns exact implementation.

Document 14 requires eventual services such as:

- RealmDefinitionRegistry;
- RealmInstanceService;
- RealmNetworkService;
- RealmLawService;
- RealmEnvironmentSnapshotService;
- RealmRouteService;
- RealmAnchorService;
- RealmTransitionService;
- SafeReturnService;
- RealmStreamingService;
- RealmLODService;
- RealmMigrationService;
- RealmValidationService;
- RealmDebugInspector.

Names are illustrative.

---

# 233. Technical World Separation

Godot scenes/resources should not require one SceneTree branch permanently containing every realm.

Realms can load/unload independently.

---

# 234. Server Authority

A server may host one world containing multiple RealmInstances.

Players in different realms share:

- economy;
- politics;
- quests;
- events

through persistent systems where relevant.

---

# 235. Content Handshake

Multiplayer requires compatible:

- realm definitions;
- biome packs;
- route definitions;
- law schemas;
- content hashes.

Gameplay-critical mismatch blocks joining/migrates explicitly.

---

# 236. Forge Integration

Forge assets may define:

- realm blocks;
- structures;
- portals;
- anchors;
- sky;
- VFX;
- audio;
- creatures;
- culture packs.

Runtime realm law remains Document 14/24D.

---

# 237. Portal Presentation

Portal visuals should communicate:

- inactive;
- charging;
- stable;
- unstable;
- blocked;
- destination known/unknown;
- quarantine;
- overload.

Visuals do not decide route state.

---

# 238. Realm Presentation

Each realm needs distinctive:

- silhouettes;
- materials;
- sky;
- ambient sound;
- navigation language;
- environmental cues.

It must remain readable.

---

# 239. Accessibility / Realm Law

Unusual laws must be communicated through more than visual distortion.

Use:

- UI;
- audio;
- haptics;
- signage;
- NPC guidance;
- environmental cues.

---

# 240. Cross-System Interface Summary

## Document 09 → Document 14

Supplies:

- portal activation;
- mana;
- ritual;
- stabilisation.

Document 14 supplies:

- destination;
- route;
- realm law;
- anchor.

## Document 11 → Document 14

Supplies:

- generated region/topology/biome instances.

Document 14 supplies:

- RealmInstance parent and law context.

## Document 12 → Document 14

Supplies:

- portal/gate/anchor structure state.

Document 14 supplies:

- route binding and destination.

## Document 13 → Document 14

Supplies:

- sovereignty;
- route permission;
- political owner;
- treaty.

Document 14 supplies:

- actual route/realm state.

## Set 29 → Document 14

Supplies:

- survival compatibility/result.

Document 14 supplies:

- realm exposure context.

## Set 30 → Document 14

Supplies:

- movement/arrival result.

Document 14 supplies:

- environment fields;
- transition links.

---

# 241. Main-Document Reconciliation Requirements

| Document | Required Follow-On |
|---|---|
| 15 — Quests/Events | Bind dimensional objectives/events to RealmInstance/Route/Anchor IDs rather than fixed POC gate. |
| 16 — Combat | Consume realm environment and boss/realm state without duplicating realm law. |
| 17 — UI/UX | Realm Atlas, portals, preparation and safe-return display consume knowledge-filtered Document-14 read models. |
| 18 — Technical | Implement RealmInstances, realm streaming, law snapshots, transition transactions and save safety in Godot/Summer. |
| 19–20 | Realm-adapted settlements/buildings consume realm-law context and route infrastructure. |

---

# 242. Production Acceptance Criteria

Document 14 v1.0 is accepted when:

- [x] dimensions remain complete gameplay ecosystems;
- [x] 24D remains authored realm authority;
- [x] twelve realm families are retained;
- [x] 96 realm-biome foundations are not duplicated into Document 14;
- [x] major realms are persistent instances;
- [x] realm-network generation is seed-derived;
- [x] no fixed first realm exists in normal generation;
- [x] realm laws use layered scopes;
- [x] Set 30/26 executes physical movement;
- [x] Set 29 owns biology;
- [x] Set 27 owns economy;
- [x] Set 28 owns beliefs/rumours;
- [x] Document 13 owns sovereignty/citizenship;
- [x] Document 09 owns portal magic;
- [x] Document 12 owns physical portal structures;
- [x] realm travel is transactional and save-safe;
- [x] safe return is validated;
- [x] dangerous one-way content is explicit;
- [x] route ownership differs from realm sovereignty;
- [x] ancestry does not biologically own realms;
- [x] cross-realm settlement/migration/trade are supported;
- [x] realm leakage is typed and source-driven;
- [x] realm state persists across unload;
- [x] explored realms do not silently regenerate;
- [x] Created Pockets have capacity/exit/collapse contracts;
- [x] POC fixed gate/first-realm assumptions are archive-only;
- [x] Godot/Summer direction is current.

---

# Appendix A — Realm Family Quick Reference

| Realm Family | Class Direction |
|---|---|
| Verdant Covenant | Major persistent realm |
| Ancestral Veil | Layer / reflection |
| Somnolent Expanse | Network realm |
| Aetheric Reach | Major persistent realm |
| Impossible Deep | Major persistent realm |
| World-Engine | Artificial realm |
| Ashen Lower Realms | Realm cluster |
| Void Between | Interstitial realm |
| Divine Concords | Network realm |
| Necropolis Domains | Realm cluster |
| Elemental Confluences | Realm cluster |
| Created Pockets | Pocket family |

Exact laws, biomes and content remain 24D-owned.

---

# Appendix B — Realm Law Stack Example

```yaml
resolved_realm_law_stack:
  realm_instance_ref: <id>
  location_ref: <id>

  layers:
    - scope: cosmological
      law_ref: <id>
    - scope: realm_global
      law_ref: <id>
    - scope: region
      law_ref: <id>
    - scope: biome
      law_ref: <id>
    - scope: site
      law_ref: <id>
    - scope: temporary_overlay
      law_ref: <id>

  resolved_snapshot_ref: <id>
  revision: <rev>
```

---

# Appendix C — Safe Return Record

```yaml
safe_return_state:
  realm_route_ref: <id>
  traveller_ref: <id>?
  return_class: stable_conditional
  return_anchor_ref: <id>
  requirement_refs: []
  emergency_option_refs: []
  failure_reason_codes: []
  last_validated_world_time: <time>
  realm_revision: <rev>
```

---

# Appendix D — Realm Transition State

```yaml
realm_transition_transaction:
  transaction_id: realm_transition:<ulid>
  traveller_refs: []
  cargo_refs: []
  origin_realm_ref: <id>
  origin_anchor_ref: <id>
  destination_realm_ref: <id>
  destination_anchor_ref: <id>

  reservations:
    route_capacity_ref: <id>
    destination_arrival_ref: <id>
    power_magic_transaction_refs: []

  phase: validating
  origin_release_committed: false
  destination_presence_committed: false
  fallback_ref: <id>
  reason_codes: []
  revision: <rev>
```

---

# Appendix E — Realm Leakage Record

```yaml
realm_leakage:
  leakage_id: realm_leakage:<ulid>
  source_realm_ref: <id>
  destination_realm_ref: <id>
  source_route_ref: <id>
  leakage_classes:
    - ecology
    - mana
  intensity_band: low
  affected_area_refs: []
  containment_state: monitored
  owner_domain_refs: []
  history_refs: []
  revision: <rev>
```

---

# Appendix F — Realm Scope / Content Maturity Rule

Realm-family existence and runtime support do not mean full shipping content is finished.

Production classification can be:

- Core Production;
- Early Access;
- Full Release;
- Later Expansion;
- Tooling Research;
- Archived Validation.

Document 14 runtime supports the full architecture while Set 25 controls which realm packages are active at each milestone.

---

# Appendix G — POC Preservation Matrix

| POC Concept | Production Treatment |
|---|---|
| Dormant portal | Preserve generic dormant-gate capability |
| Damaged components | Preserve repair/stabilisation capability |
| Unknown destination | Preserve discovery/knowledge state |
| Mana reaction | Preserve magic/portal integration |
| Limited stabilisation | Preserve safe maintenance/repair interaction |
| Environmental evidence | Preserve realm clue system |
| Fixed Forest Hamlet portal | Archive |
| Fixed rune clearing | Archive |
| Fixed first dimension | Archive |
| POC-only destination | Archive |
| No realm travel | POC-only implementation limitation; production supports full travel |

---

# Appendix H — Cross-System Responsibility Quick Reference

| Question | Owner |
|---|---|
| What realm family is this? | 24D |
| What specific realm instance exists in this world? | Document 14 |
| What are its current realm-law fields? | Document 14 + 24D definition |
| What terrain/biome generated here? | Document 11 / 24D |
| What Block exists here? | Document 03 |
| What resource is this? | Document 06 |
| What spell opens the portal? | Document 09 |
| What physical structure is the portal frame? | Document 12 |
| Who politically owns the gate? | Document 13 |
| Can the player physically traverse? | Set 30 / 26 |
| Will the atmosphere harm them? | Set 29 |
| What is the portal toll? | Set 27 |
| Does the player know destination? | Set 28 / Document 17 |
| What creatures live here? | 24F / Document 10 |
| How does the boss fight work? | 24H / Document 16 |
| Is the outpost functional? | Documents 07/19/20 |
| How is this technically streamed/saved? | Document 18 v1.0 |

---

# Appendix I — Definition of Done for Implemented Realm Runtime

The implementation is not complete because the player can load another scene.

Production proof requires:

- the realm network is deterministic;
- realm instances have stable IDs;
- different seeds can expose different route graphs;
- no fixed first gate is required;
- realm-law snapshots resolve;
- Set 30 consumes gravity/environment rather than hard-coded realm movement;
- Set 29 consumes survival context;
- portals reference real structures and magic;
- route destination anchors are persistent;
- portal transition is atomic;
- player/cargo cannot duplicate;
- save during transition recovers safely;
- normal routes provide safe return;
- realm settlements persist;
- player building persists;
- realm ecology persists;
- realm politics persists;
- boss outcomes persist;
- closing/reopening a realm does not reset it;
- Created Pockets respect capacity and collapse safety;
- cross-realm trade uses real throughput;
- route control does not imply realm sovereignty;
- realm ancestry exclusivity is impossible by default;
- LOD can unload an entire realm without deleting history;
- multiplayer can host players in different realms;
- content-pack updates do not rewrite explored realm state;
- POC fixed portal sequence remains archive-only.

---

# Completion Statement

**Document 14 v1.0 reconciles Leyforge's original dimensional-system vision with the production World Content Atlas, post-POC realm network, final civilisation separation and Sets 27–30 ownership contracts.**

The original promise remains:

**Dimensions are complete worlds.**

But the runtime model is now cleaner.

**24D defines the realms.**  
**Document 14 instantiates and persists them.**  
**Document 11 generates their world space.**  
**Document 09 opens magical routes.**  
**Document 12 provides physical gates and anchors.**  
**Document 13 governs political ownership and sovereignty.**  
**Document 10 fills them with ecology.**  
**Set 29 resolves survival.**  
**Set 30 / Set 26 resolves physical travel.**  
**Set 27 turns actual routes into economic relationships.**  
**Set 28 controls what people know and believe about them.**

No realm is a coloured mining dimension.

No realm belongs biologically to one ancestry.

No fixed tutorial portal dictates every seed.

No normal progression route silently strands the save.

And when a player builds, settles, trades, fights, restores, contaminates, liberates, industrialises or closes a realm, that history remains part of the same persistent world.

**Next foundation reconciliation dependency: Document 15 — Quest and Event System v1.0.**
