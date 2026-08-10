# LEYFORGE

## 20 — Buildings, Facilities, Functional Services, Construction and Settlement Project System

### Seven Settlement Needs, Universal Building Functions, Construction Projects, Service Activation, Culture/Realm Packs, Maritime Facilities and Persistent Civilisation Infrastructure

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Governing Master Contract for Document Set 20 v1.0 Reconciliation  
**Supersedes:** `20_Fantasy_Voxel_Civilisation_Sandbox_Buildings_Facilities_Construction_and_Settlement_Project_System_v0_2` for active production direction  
**Companion Status:** `20A–20H v0.2` remain detailed source inputs and must receive a focused v1.0 reconciliation after this master document  
**Settlement Planning Authority:** Document 19 v1.0  
**Persistent Structure Authority:** Document 12 v1.0  
**Official Blueprint Source Authority:** Document 22I Blueprint Forge  
**Forge Technical / Bake Authority:** Documents 22K + Document 18 v1.0 technical contracts  
**Canonical Blocks / Items / Recipes / Resources:** Documents 03–06 v1.0  
**Persistent People / Labour:** Document 07 v1.0  
**Automation:** Document 08 v1.0  
**Magic / Mana / Wards / Ritual Infrastructure:** Document 09 v1.0  
**Creatures / Ecology:** Document 10 v1.0  
**World Generation / Placement Context:** Document 11 v1.0  
**Civilisation / Government / Law / Land:** Document 13 v1.0  
**Realms / Realm Routes:** Document 14 v1.0  
**Quest / Event / Chronicle:** Document 15 v1.0  
**Combat / Defence Resolution:** Document 16 v1.0  
**UI / View Models / Settings:** Document 17 v1.0  
**Production Governance / Registries / Packs / Validation:** Document Set 25  
**Maritime Facility and Port-Service Specialist:** Set 26, especially 26J and 26O  
**Economy / Markets / Contracts / Wages / Finance / Taxes:** Set 27  
**Dialogue / Relationships / Social Consent / Assignments:** Set 28  
**Health / Stamina / Survival / Treatment / Biological Demand:** Set 29  
**Movement / Route Accessibility / Travel / Navigation:** Set 30, with Set 26 specialist aquatic/vessel movement  
**Presentation Events / Anchors / Accessibility Equivalents:** Set 23  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale functional-building and settlement-project framework for Leyforge in which houses, farms, clinics, roads, warehouses, markets, fortifications, utilities, industrial facilities, magical infrastructure, ports, shipyards, districts and civilisation-scale projects exist as real physical systems with explicit dependencies, capacities, permissions, staffing, resources, routes, networks, condition and persistent history.

> **Master Building Rule**
>
> **A building provides no settlement service because of appearance, name, marker spam or planner expectation. A function becomes active only when a recognised functional definition is resolved through valid physical structure and the current instance passes its required access, people, stock, equipment, permission, network, condition, environment and specialist-system contracts.**

> **Seven-Needs Rule**
>
> **Housing, Provisions, Health, Work, Safety, Infrastructure and Morale are the only seven top-level settlement needs. Water, medicine, sanitation, defence, employment, culture, trade, transport, education, power and similar concepts are causes, capacities, services, dependencies, pressures or specialist systems beneath those seven needs — never additional competing top-level bars.**

> **Construction Truth Rule**
>
> **Document 20 owns the authoritative ConstructionProject lifecycle and building-function activation. It does not own the canonical Blocks/Items consumed, the people performing the work, their physical movement, the market price of labour or materials, social willingness, biological state, or the persistent StructureInstance after placement. Those truths remain with their owners.**

> **Planning / Construction Separation Rule**
>
> **Document 19 may detect need, plan districts, choose candidates, reserve parcels and propose projects. Document 20 decides whether the requested functional project is valid and owns its construction execution record. A planner score never spends resources, teleports workers or completes a structure.**

> **Canonical Block / Item Rule**
>
> **Construction references canonical Blocks directly when the placed and recovered identity is the same Block. Inventory and project logistics use the generated Block Inventory Projection. A duplicate `item.block.*` definition or equivalent fake construction Item is forbidden. Distinct Items exist only for genuinely separate components, materials, tools, consumables or portable states.**

> **Movement Boundary Rule**
>
> **Document 20 owns physical road, bridge, stair, door, gate, dock, loading-space and building infrastructure. Set 30 decides whether a particular mover can traverse it, the route cost, local path execution, travel time and authoritative arrival. Set 26 supplies specialist aquatic and vessel movement.**

> **Economy / Social / Biology Boundary Rule**
>
> **A market building does not own prices. A guild hall does not own relationships. A clinic does not own Health. A road does not own travel time. Buildings expose valid capacities, spaces, stock endpoints, permissions and service opportunities; Sets 27–30 commit their respective truths.**

> **Maritime Integration Rule**
>
> **Ports, harbours, shipyards, navigation aids, fisheries, maritime rescue, customs and supporting waterfront services use the same functional-building, project, activation and persistence architecture. Set 26J owns specialist port/shipyard/service execution; Document 20 owns their settlement-function integration where a universal or governed specialist function is required.**

> **POC Retirement Rule**
>
> **Forest Hamlet, the fixed cottage/watchtower sequence, the scripted raid and the former POC delivery tiers are Archived Validation only. Generic cottages, warehouses, roads, wells, watchtowers, guard infrastructure, farms and construction workflows remain valid production capabilities.**

---

# Document Purpose

Document 20 is the master gameplay/data-contract framework for functional civilisation infrastructure.

It answers five different questions without collapsing their owners:

1. **What settlement function exists?**  
   Document 20 and the owning 20A–20F companion define the universal or governed specialist function, its need contributions, dependencies, capacity model and activation contract.

2. **What editable structure represents it?**  
   Official developer source is authored in Blueprint Forge 22I. Player-authored structures use the restricted Document-19 schema. Vessel blueprints remain 26I-owned.

3. **What is being built, repaired, converted, upgraded or demolished?**  
   Document 20 owns the authoritative `ConstructionProject`.

4. **What physical structure exists afterward?**  
   Document 12 owns the persistent `StructureInstance`, physical condition, world history and local deltas.

5. **What does the functioning structure contribute right now?**  
   Document 20 owns the current `ServiceRecord`/functional activation result while consuming authoritative external evidence such as staffing, stock, movement accessibility, biological demand, economic operation, law and networks.

This separation allows:

- many official/cultural/player blueprints to satisfy one function;
- one mixed-use structure to expose several independently traceable services;
- one project to create or modify a persistent structure;
- damaged structures to lose only the services actually invalidated;
- settlement planning to remain flexible without granting abstract capacity;
- distant simulation to preserve the same resources and service truth as nearby simulation.

---

# Production Reconciliation Sources

| Source | Production Intake |
|---|---|
| **00–02 v1.0** | Sandbox-first civilisation, capability growth, multiple valid playstyles and persistent consequences. |
| **03–06 v1.0** | Canonical Block/Item identity, Block Inventory Projections, authoritative transformations, resources and capability progression. |
| **07 v1.0** | Persistent people, households, jobs, labour availability, settlement operation and migration. |
| **08 v1.0** | Fixed automation/logistics networks, warehouses, machine/service endpoints and resource-conserving industrial support. |
| **09 v1.0** | Mana, wards, rituals, portal activation and magical infrastructure without duplicating automation. |
| **10 v1.0** | Creature/livestock/ecology interaction and personhood-safe facility use. |
| **11 v1.0** | Seed-derived terrain, environment, site suitability and world-placement context. |
| **12 v1.0** | Persistent StructureInstance, damage, restoration, route structures and world-state evidence. |
| **13 v1.0** | Land, claims, ownership, government, law, jurisdiction and political authority. |
| **14 v1.0** | Realm environment/law context, portal routes and cross-realm infrastructure relationships. |
| **15 v1.0** | Quest/event evidence, construction objectives, disasters and aftermath. |
| **16 v1.0** | Combat and structure-damage evidence without owning structure persistence. |
| **17 v1.0** | Project/service/settlement view models, reason-first diagnostics and world configuration. |
| **18 v1.0** | Godot/Summer record/service architecture, save/LOD/authority/validation and repository-honesty rule. |
| **19 v1.0** | Settlement plans, parcels, districts, player blueprint workflows, growth readiness and project proposals. |
| **20A–20H v0.2** | Detailed family definitions, packs and the current 120-definition pre-maritime catalogue baseline pending v1.0 companion reconciliation. |
| **22I / 22K** | Official Blueprint Forge source, semantic authoring, bake products and technical tooling. |
| **23** | Presentation event/anchor contracts and accessible equivalents; presentation does not own function. |
| **24** | Authored cultures, biomes, realms, structures and world-content context. |
| **25** | Qualified IDs, schemas, capabilities, packs, lifecycle, validation, evidence and Archived Validation governance. |
| **26J / 26O** | Ports, harbours, shipyards, maritime services and mandatory Document-20 maritime amendment. |
| **27** | Prices, currency, markets, wages, contracts, finance, taxes and trade economics. |
| **28** | Dialogue, knowledge, Trust/Loyalty, willingness, social permissions and assignments. |
| **29** | Population health, individual biology, treatment demand/capacity and biological outcomes. |
| **30** | Physical route accessibility, travel, navigation, movers and transport execution. |

---

# Companion-Set Status

Document Set 20 remains structurally valid and **should be reconciled rather than discarded**.

The v1.0 companion pass will:

- preserve the detailed universal definitions that remain valid;
- replace POC/Alpha/Beta/Final production-scope language with Set-25 production lifecycle/classification;
- integrate Sets 26–30 ownership;
- apply FR-00-20-006 canonical Block/Item handling;
- update Godot/Summer references to Document 18 v1.0;
- remove invented/obsolete repository-path assumptions;
- reconcile maritime facility/service coverage;
- retain stable IDs or provide explicit migration aliases;
- determine whether the current 120-function cap remains sufficient after maritime functional-distinction review.

Until 20H v1.0 is complete:

> **The existing 120 IDs are protected and must not be renumbered, reused or casually deleted. The number 120 is a reconciled baseline, not an irreversible production ceiling.**

# 5. Universal Taxonomy and Registry Units

## 5.1 Registry Unit Types

| **Unit** | **Purpose** | **Namespace Example** |
|---|---|---|
| **Building Definition** | Occupied, service, production, storage, civic, magical or utility structure. | `building.crafting.village_blacksmith` |
| **Project Definition** | Modular construction that may not be an occupied building. | `project.defence.palisade_segment` |
| **Plan Definition** | Cluster, district, campus, complex, nexus or settlement arrangement. | `plan.district.residential` |
| **Module Definition** | Reusable declared functional subassembly. | `module.storage.secure_armoury` |
| **Blueprint Asset** | Approved voxel source satisfying one or more contracts. | `blueprint.leyforge.riverward.blacksmith_a` |
| **Pack Definition** | Culture, faction, biome, realm, government, faith or dynamic-state layer. | `pack.culture.riverward_frontier` |
| **Project Record** | Saved active construction/repair/upgrade task. | `construction_project:<ULID>` |
| **Structure Instance** | Saved placed structure. | `structure_instance:<ULID>` |

## 5.2 Universal Category Families

- Temporary and residential.
- Farming, food and livestock.
- Health, welfare, culture and hospitality.
- Extraction and raw processing.
- Crafting and artisan production.
- Trade, education and professional services.
- Governance, justice and administration.
- Safety, defence and emergency services.
- Storage, roads, transport, water and sanitation.
- Magic, ritual and dimensional infrastructure.
- Automation, power and advanced industry.
- Districts, complexes, megaprojects and wonders.

## 5.3 Function-Distinction Test

A new universal definition is justified only when it introduces at least one of the following that cannot be represented by a profile, module, upgrade or variant:

- A distinct service or production contract.
- A new planner behaviour or settlement-stage expectation.
- A new network role or required source binding.
- A distinct staffing, ownership or public-access model.
- A materially different risk, law or emergency model.
- A unique construction or maintenance consequence.
- A bounded civilisation or world-state effect.

A new roof, facade, colour, cultural motif, ordinary capacity increase, mirrored layout, biome material substitution or damage appearance does not pass this test by itself.

# 6. Stable IDs, Namespaces and Versioning

## 6.1 Canonical Namespaces

```text
building.<domain>.<name>
project.<domain>.<name>
plan.<kind>.<name>
module.<domain>.<name>
blueprint.<namespace>.<family>.<variant>
pack.<type>.<name>
marker.<domain>.<name>
zone.<domain>.<name>
socket.<network_or_role>.<name>
material_role.<domain>.<name>
construction_project:<ULID>
structure_instance:<ULID>
```

## 6.2 ID Rules

- IDs are lowercase ASCII with underscores inside segments.
- IDs describe stable function, not temporary visual appearance.
- Display names and localisation keys may change without changing stable IDs.
- Renames use migration aliases; old IDs are never silently reused for different content.
- Internal Blueprint Forge elements use stable local IDs so deltas survive reordering.
- Runtime instance IDs are globally unique and never derived only from position.
- Content-pack namespaces prevent collisions between official, player and mod content.

## 6.3 Version Fields

Each definition and blueprint package should record:

- `schema_version`
- `content_version`
- `contract_version`
- `source_revision`
- `minimum_game_version`
- `maximum_tested_game_version`
- `dependency_lock_hash`
- `migration_aliases`

A cosmetic source revision that leaves gameplay contracts unchanged may remain save-compatible. A contract revision that changes capacity, required markers or network semantics requires explicit migration or compatibility handling.

# 7. Seven Main Settlement Needs

Leyforge uses exactly seven top-level settlement needs:

1. **Housing**
2. **Provisions**
3. **Health**
4. **Work**
5. **Safety**
6. **Infrastructure**
7. **Morale**

This list is closed at the Foundation level.

## 7.1 Why the Need Model Is Closed

The seven needs provide a readable civilisation summary without turning every subsystem into another meter.

Examples of concepts that remain beneath the seven:

| Concept | Production Treatment |
|---|---|
| Water / Hydration | Provisions and Health dependency; Set 29 owns biological hydration. |
| Medicine | Health service input; Set 29 owns treatment outcome. |
| Sanitation | Health/Infrastructure capacity and exposure prevention. |
| Employment | Work demand/capacity; Set 27 owns wages/contracts and Document 07 owns jobs/people. |
| Defence | Safety capability; Document 16 owns combat resolution. |
| Roads / Transport | Infrastructure; Set 30 owns mover-specific traversal/travel. |
| Trade / Markets | Work/Infrastructure opportunity; Set 27 owns economic truth. |
| Education | Work/Morale/Infrastructure depending on definition; progression/knowledge owners commit outcomes. |
| Religion / Culture | Morale/social opportunity; Set 28/13 own social/cultural interpretation. |
| Power | Infrastructure/Work dependency; Document 08/09 own actual network truth. |
| Shelter Adequacy | Housing service; Set 29 consumes shelter/environment for biological consequence. |

## 7.2 Need Contribution Is Service Evidence

A structure contributes to a need only through an active `ServiceRecord`.

For example:

- a Cottage may provide Housing capacity;
- a Granary may improve Provisions reserve coverage;
- a Clinic may provide treatment capacity relevant to Health;
- a Workshop may provide Work capacity;
- a Watchtower may provide detection/response capacity relevant to Safety;
- a Road/Bridge may provide Infrastructure connectivity;
- a Community Hall may provide opportunities relevant to Morale.

A name or appearance never adds need points directly.

## 7.3 Need Demand Sources

Demand comes from authoritative simulation.

Examples:

- population/households — Document 07;
- biological health/treatment demand — Set 29;
- stock and consumption pressure — inventory/Set 29/settlement systems;
- economic jobs/services — Document 07 + Set 27;
- threat pressure — Document 15/16/13/10;
- movement/logistics pressure — Set 30/26 + Document 08;
- social/community opportunity — Set 28 + Document 13.

Document 20 aggregates settlement-facing capacity/status without recreating those systems' internal formulas.

# 8. Demand, Capacity, Coverage and Status Calculation

The need UI and planner consume **demand**, **effective capacity**, **coverage** and **blockers**.

## 8.1 Generic Model

Conceptually:

```text
Declared Function Capacity
    × Physical Validity
    × Staffing / Operator Availability
    × Input / Stock Availability
    × Network / Utility Availability
    × Permission / Ownership Validity
    × Access / Route Validity
    × Condition / Safety
    × Specialist-System Modifiers
= Effective Service Capacity
```

Not every service uses every term.

## 8.2 No Duplicate Specialist Formula

Document 20 does not calculate:

- market prices;
- Trust;
- biological Health;
- Stamina/Fatigue;
- mover traversal;
- vessel draft/berth compatibility;
- combat outcome.

It consumes their snapshots/decisions.

## 8.3 Coverage

A settlement-facing coverage model may express:

- demand band;
- capacity band;
- current effective coverage;
- reserve;
- trend;
- blocker;
- confidence/freshness.

Exact numerical balance belongs to the relevant function and owning companion.

## 8.4 Status Bands

Recommended player-facing bands:

- Surplus / Resilient
- Adequate
- Strained
- Critical
- Offline / Unavailable
- Unknown / Stale

Status should explain cause.

## 8.5 Planner Pressure

Document 20 may expose function-side pressure such as:

- Housing deficit;
- clinic overloaded;
- road service disconnected;
- warehouse inaccessible.

Document 19 owns how those pressures are turned into project candidates and priorities.

# 9. Shared Semantic Layer, Marker, Zone and Socket Contracts

Blueprint Forge may display many editable layers, but all gameplay-facing semantics resolve through shared registries.

## 9.1 Common Marker Families

```text
marker.entrance.*
marker.delivery.*
marker.household.*
marker.job.*
marker.guard.*
marker.social.*
marker.interaction.*
marker.storage.*
marker.repair.*
marker.construction.*
marker.worldgen.*
marker.creature.*
marker.quest.*
```

## 9.2 Common Zone Families

```text
zone.room.*
zone.work.*
zone.public.*
zone.private.*
zone.storage.*
zone.hazard.*
zone.guard.*
zone.refuge.*
zone.construction.*
zone.worldgen.*
zone.navigation.*
```

## 9.3 Common Socket Families

```text
socket.route.*
socket.storage.*
socket.item_logistics.*
socket.fluid.*
socket.mechanical_power.*
socket.thermal_power.*
socket.electrical_power.*
socket.mana.*
socket.ward.*
socket.portal.*
socket.module.*
socket.upgrade.*
```

## 9.4 Semantic Contract Rules

- Markers are typed, versioned and assigned stable internal IDs.
- Markers do not create capacity without the functional definition that interprets them.
- Zones may overlap only when declared compatible.
- Network sockets declare type, direction, capacity, ownership and connection rules.
- Entrance and navigation markers must be compatible with expected entity envelopes.
- A mixed-use structure must separate incompatible public, private and hazard routes.
- Missing optional semantics produce warnings; missing required semantics block approval or activation.
- Companion documents define family-specific profiles by referencing this common catalogue rather than inventing unrelated names.## 9.6 Presentation-Anchor Boundary

Set 23 may consume semantic markers/zones/sockets as stable presentation anchors for:

- audio;
- VFX;
- animation;
- UI highlights;
- accessible cues.

Presentation assets may not create the gameplay marker or functional service by existing visually.

# 10. Material Roles, Packs and Visual Resolution

## 10.1 Semantic Material Roles

Blueprints should reference roles where materials may vary:

```text
material_role.foundation.primary
material_role.foundation.wet
material_role.wall.primary
material_role.wall.secondary
material_role.structure.beam
material_role.floor.public
material_role.floor.private
material_role.roof.primary
material_role.roof.heavy
material_role.opening.public
material_role.trim.civic
material_role.defence.wall
material_role.road.local
material_role.storage.secure
material_role.magic.conduit
material_role.damage.patch
```

Exact role catalogues are maintained through Blueprint Forge and pack registries.

## 10.2 Resolution Order

1. Universal definition requirements.
2. Blueprint-authored defaults.
3. Primary culture pack.
4. Regional or subculture pack.
5. Biome and climate adaptation.
6. Faction, government, faith or economy overlay.
7. Realm adaptation.
8. History, occupation, corruption, repair or restoration state.
9. Approved settlement/player style override.
10. Deterministic age, weathering and decorative seed.

## 10.3 Functional Safety

A material substitution cannot violate declared support, fire, heat, pressure, water, corruption, containment, portal or accessibility requirements. When no valid material can resolve a required role, construction remains blocked with an exact diagnostic.

## 10.4 Pack Authority

The canonical namespaces are:

- `pack.foundation.*`
- `pack.culture.*`
- `pack.region.*`
- `pack.faction.*`
- `pack.government.*`
- `pack.faith.*`
- `pack.economy.*`
- `pack.biome.*`
- `pack.realm.*`
- `pack.overlay.*`
- `pack.hybrid.*`

Legacy `culture_kit.*` and `style_kit.*` references migrate into these families.## 10.6 Canonical Block / Item Resolution

Material roles resolve to canonical construction identities.

If the placed/recovered result is a canonical Block:

- project requirements reference the Block;
- inventories expose its generated Block Inventory Projection;
- no duplicate canonical Item is created.

A genuinely distinct Item may still be required for:

- fastener;
- rope;
- mechanism;
- tool;
- sealant;
- medicine;
- catalyst;
- portable component;
- fuel;
- furnishing whose canonical identity is an Item.

# 11. Blueprint Forge Source and Runtime Bake Boundaries

## 11.1 Official Editable Source

An approved Blueprint Forge source package may contain:

- Voxel block and shape placements.
- Forge-authored props, machines and functional assets.
- Nested modules and reusable sub-blueprints.
- Material roles and default palettes.
- Semantic markers, zones, sockets and network graphs.
- Construction stage membership and builder access.
- Upgrade inheritance and deltas.
- Damage, occupation, corruption and restoration deltas.
- Terrain and world-placement profiles.
- Icon and preview capture profiles.
- Dependencies, revision history, lifecycle and validation records.

## 11.2 Derived Runtime Products

Godot runtime products may include:

- Compressed voxel placement data.
- Chunk insertion manifests.
- Merged or batched meshes for non-editing views.
- Collision and interaction proxies.
- Navigation geometry and connectivity caches.
- Marker and socket lookup tables.
- Stage and state delta manifests.
- Material-resolution tables.
- World-placement acceleration data.
- Distant LOD meshes and summary profiles.
- Thumbnails, map icons and project-board images.

## 11.3 Boundary Rules

- Derived products may be deleted and regenerated without losing source.
- Gameplay systems resolve stable registry IDs rather than raw file paths.
- A bake failure never overwrites the last approved working package.
- Blueprint Forge lifecycle approval is separate from universal definition approval.
- Visual source edits cannot change gameplay contract fields without a recorded contract revision.
- The voxel world remains authoritative for placed block state where full voxel instances are loaded.## 11.6 Current Technical Authority

Document 18 v1.0 replaces old Unreal-era implementation assumptions.

22K remains the Forge-specific technical authority, but exact live repository paths/class names require the Document-18 read-only repository audit before implementation tasks become Ready.

# 12. Construction Projects, Stage Graphs and Resource Conservation

## 12.1 Shared Construction Stage Vocabulary

The canonical stage vocabulary is:

1. Planning and approval.
2. Survey, site preparation and access.
3. Foundations, supports or anchors.
4. Primary structure or frame.
5. Enclosure, roof and weatherproofing.
6. Functional installation and networks.
7. Furnishing, equipment and finishing.
8. Inspection, commissioning and handover.
9. Complete and operational.

Small projects may merge stages. Specialist projects may insert stages such as **Excavation**, **Span Placement**, **Pressure Test**, **Attunement**, **Containment**, **Ward Tuning** or **Public Opening**.

## 12.2 Stage Graph Rules

- Stages may be linear or a directed acyclic graph.
- Each stage contains exact additions, removals, substitutions and semantic changes.
- Each stage references authoritative Project Recipes or generated resource requirements.
- Stage prerequisites may include earlier stages, permits, roads, utilities, specialist presence or world-state gates.
- Stages may activate limited explicit functions before full completion.
- Builder access and delivery markers must remain reachable for the work being performed.
- Cancellation releases unconsumed reservations and preserves already placed work.

## 12.3 Resource Trust

Construction uses authoritative transactions:

```text
Available Stock
→ Reserved to Project and Stage
→ Claimed by Delivery or Builder Task
→ Consumed by Successful Voxel/Asset Placement
→ Recorded in Contribution and History Ledger
```

No stage may duplicate stock through save/load, distance transitions, cancellation, blueprint rebase or multiplayer retries.

## 12.4 Project Types

- New construction.
- Network extension.
- Upgrade or expansion.
- Repair.
- Restoration.
- Conversion or adaptive reuse.
- Relocation where supported.
- Demolition and salvage.
- Emergency temporary works.
- Megaproject subproject.## 12.6 Production Construction Ownership

The authoritative construction chain is:

```text
Project Proposal / Direct Build Request
        ↓
Site + Authority + Function Validation
        ↓
ConstructionProject Created
        ↓
Inputs Reserved
        ↓
Workers / Machines / Player Work Execute
        ↓
Authoritative Stage Commit
        ↓
Voxel / Structure Delta Commit
        ↓
Commissioning / Activation Validation
        ↓
StructureInstance + ServiceRecord Update
```

Ownership within that chain:

- Document 19 — proposal/planning;
- Document 20 — ConstructionProject and service activation;
- Documents 03–05 — canonical construction identities and transformations;
- Document 07 — worker identity/labour availability;
- Document 08 — machine/logistics execution;
- Set 27 — wages/contracts/procurement/finance;
- Set 28 — voluntary/social assignment/consent;
- Set 29 — biological worker capability;
- Set 30/26 — movement/worksite arrival;
- Document 12 — resulting persistent StructureInstance.

## 12.7 Reservations Are Not Consumption

Project UI distinguishes:

- required;
- reserved;
- delivered;
- consumed/committed;
- recovered/refunded;
- missing.

No stage may create stock because a progress timer elapsed.

## 12.8 Player Direct Building

Freeform/manual player building may use more immediate placement transactions than an NPC settlement project.

It still obeys:

- canonical Block/Item identity;
- inventory/resource conservation;
- permissions/claims;
- physical placement rules;
- service activation.

A hand-built house can become valid Housing without being constructed by an NPC project, but only after its functional contract validates.

# 13. Shared Runtime Lifecycle and Operational State Model

## 13.1 Primary Lifecycle

| **State** | **Meaning** |
|---|---|
| **Proposed** | Candidate exists but lacks approval or site. |
| **Planned** | Approved definition, blueprint and site are selected. |
| **Reserved** | Site and required stock for the next stage are reserved. |
| **Under Construction** | Physical work is active. |
| **Commissioning** | Structure is complete enough to validate function, staff, access and networks. |
| **Operational** | Minimum activation contract passes. |
| **Strained** | Operational but near a limit or with non-critical degradation. |
| **Paused** | Safe temporary stop due to staff, input, output, permission or schedule. |
| **Damaged** | Some physical or semantic function is reduced. |
| **Unsafe** | Hazard exceeds allowed operation or occupancy. |
| **Disabled** | Critical requirement is absent. |
| **Contested** | Ownership, authority or access is disputed. |
| **Abandoned** | No valid maintained use remains. |
| **Ruined** | Critical structure/function is destroyed. |
| **Under Repair** | Repair project is active. |
| **Under Conversion** | Function or ownership is being changed. |
| **Restored** | A previous damaged/ruined state has returned to a valid use. |

## 13.2 Secondary Operational States

Companion systems may add overlays such as:

- Waiting Input.
- Output Blocked.
- Understaffed.
- Overloaded.
- Contaminated.
- Corrupted.
- Breached.
- Alert.
- Engaged.
- Quarantined.
- Emergency Shutdown.
- Captured.
- Dormant.

Primary lifecycle and secondary operational state are stored separately where practical. A structure may be **Operational + Alert**, **Damaged + Output Blocked**, or **Contested + Under Repair**.

## 13.3 State Precedence

Safety-critical states override ordinary production. Ownership disputes override public access. Ruined state prevents normal activation. Emergency and quest logic may temporarily override ordinary schedules but must record authority and duration.

# 14. Activation Contracts and Partial Functionality

## 14.1 Activation Profile

Every universal function declares:

- Required semantic markers/zones/sockets.
- Minimum valid physical envelope or component profile.
- Required access and navigation.
- Minimum and target staffing.
- Required tools, equipment or inventories.
- Required inputs, fuel, water, power or mana.
- Output capacity and destination requirements.
- Ownership and permission conditions.
- Safety, hazard and containment limits.
- Required linked services or world bindings.
- Partial-function rules.

## 14.2 Partial Functionality

A structure can retain safe independent functions when another function fails. Examples:

- A blacksmith residence remains housing while the forge is out of fuel, if mixed-use safety remains valid.
- A warehouse retains undamaged storage zones after one roof section collapses.
- A town gate still creates a physical barrier if no guards are assigned, but it provides no staffed inspection service.
- A clinic can provide basic treatment while a specialist wing is unfinished.
- A ward tower can remain a lookout after mana depletion while magical protection is inactive.

Partial functionality must be explicit; systems do not infer arbitrary bonuses from remaining geometry.

## 14.3 Commissioning

Commissioning validates the resolved built result rather than trusting source metadata. It checks placed blocks/assets, reachable markers, networks, current ownership and required supplies. Commissioning may create an exact punch list instead of treating the whole structure as mysteriously invalid.## 14.6 External Activation Inputs

Examples:

| Function | External Evidence |
|---|---|
| Clinic | Valid facility + staff/stock/access; Set 29 owns treatment and patient biology. |
| Market | Valid trading space + merchant/stock/access; Set 27 owns prices/transactions. |
| Guild Hall | Valid meeting/work space; Set 28/13/27 own membership/social/economic effects. |
| Road | Physical route infrastructure; Set 30 owns mover-specific accessibility/travel. |
| Port | Valid waterfront/PortNode/facilities; Set 26J owns berth/service resolution. |
| Watchtower | Valid guard/detection positions; Document 16/15/07 own tactical/event/person outcomes. |
| Portal Station | Valid structure; Document 09/14 own activation/route truth. |

# 15. Upgrade Inheritance, Conversion and Replacement

## 15.1 Upgrade Models

- In-place child blueprint using deltas.
- Attached expansion module.
- Vertical extension.
- Parcel replacement.
- Capacity module installation.
- Network or utility upgrade.
- Cultural renovation.
- Functional conversion.
- Settlement-stage branch.

## 15.2 Delta Types

An upgrade may store:

- Added voxel cells/assets.
- Removed cells/assets.
- Material-role substitutions.
- Moved or replaced markers.
- Added network nodes or sockets.
- Changed zones and capacities.
- New construction stages.
- Changed damage groups.
- Migration of occupants, inventories and jobs.

## 15.3 Upgrade Safety

Before approval, the system verifies:

- Existing instance compatibility with expected parent revision.
- Temporary housing/service continuity.
- Inventory relocation and ownership.
- Builder access and staged stability.
- Route, utility and network capacity.
- Heritage or legal restrictions.
- Multiplayer authority and conflict state.

## 15.4 Replacement Versus New Definition

A visually larger or more ornate structure remains the same universal definition when it only raises capacity or quality. It becomes a separate universal definition only when it introduces a distinct functional model, planner role, network role or stage expectation.

# 16. Damage, Repair, Occupation, Corruption and Restoration

## 16.1 Damage Groups

Blueprint source may define semantic damage groups such as:

- Foundation/support.
- Structure/frame.
- Roof/weatherproofing.
- Entrance/access.
- Public room.
- Private/household room.
- Workstation/production.
- Storage.
- Network/control.
- Defence/perimeter.
- Magical/containment.
- Landmark/heritage.

Damage affects only capacities linked to the damaged group where possible.

## 16.2 State Deltas

Dynamic states should use deterministic deltas rather than complete duplicate blueprints:

- Destroyed or replaced cells.
- Rubble and debris placements.
- Disabled markers and sockets.
- Blocked routes.
- Changed ownership/access.
- Fire, contamination or corruption zones.
- Temporary repair scaffolds.
- Occupation banners and command markers.
- Restoration additions.

## 16.3 Repair

Repair projects:

- Identify damaged groups and lost capacities.
- Resolve exact materials from the current blueprint and substitutions.
- Reserve stock and assign labour.
- Preserve compatible repairs already completed.
- Recommission only affected functions where possible.
- Record contributor and event history.

## 16.4 Occupation and Conquest

Occupation may change:

- Owner and governing authority.
- Public/private/restricted access.
- Guards, banners and patrol markers.
- Storage permissions and tribute flows.
- Available services and laws.
- Resistance, sabotage and restoration projects.

Occupation does not silently transfer every private inventory or erase origin culture and build history.

## 16.5 Corruption and Restoration

Corruption may modify material roles, hazards, creature attraction, mana networks, access and service validity. Cleansing or restoration should reveal and preserve historical layers instead of replacing the structure with an unrelated pristine copy.## 16.6 Structure-State Authority

Document 12 owns the persistent StructureInstance and physical condition/history.

Document 20 owns how that condition changes functional service.

Example:

- Document 12: roof section destroyed;
- Set 30: route through stairwell blocked;
- Set 29: exposed occupants receive cold/wetness effects;
- Document 20: affected Housing capacity disabled;
- Document 19: settlement planning sees a repair pressure;
- Document 15: disaster/recovery event may expose objectives.

No system duplicates the damaged-roof state.

# 17. Parcels, Terrain, Foundations, Access and Placement

Document 20 owns **functional placement requirements** for a building or project.

Document 19 owns parcel/district planning.

Document 11 owns generated terrain/environment context.

Document 12 owns the placed physical structure.

Set 30 owns mover-specific accessibility.

Set 26 owns specialist harbour/vessel/water feasibility.

## 17.1 Placement Checks

A project may require:

- legal/ownership authority;
- valid parcel/site;
- build envelope;
- foundation/support;
- terrain compatibility;
- entrance/service clearances;
- work access;
- delivery access;
- utility/network access;
- emergency access;
- water/shoreline relationship;
- protected-site constraints;
- realm/environment protection.

## 17.2 Terrain Adaptation

Approved source/project profiles may use:

- levelling;
- stepping;
- stilts;
- retaining;
- foundations;
- excavation;
- bridging;
- floating/specialist support;
- rejection.

Terrain adaptation consumes real work/resources when performed at runtime.

## 17.3 Access Is Mover-Specific

A door marker proves an intended access point.

It does not prove:

- a tall creature fits;
- a cart can turn;
- a wheelchair/mobility profile can use the path;
- a loaded wagon can climb the slope.

Set 30 evaluates the mover.

## 17.4 Waterfront Validation

Waterfront facilities may require:

- HarbourCandidate/PortNode relationship;
- bathymetry/depth;
- tide/current/wave/storm exposure;
- berth/launch/haul-out envelope;
- cargo/crew access;
- flood protection;
- rescue access.

26C/26D/26J/26H supply specialist evidence.

# 18. Roads, Utilities, Storage, Logistics, Power and Mana Networks

Buildings expose **physical infrastructure and typed network endpoints**.

They do not own every network that connects to them.

## 18.1 Route Infrastructure

Document 20/20D owns physical:

- paths;
- roads;
- bridges;
- stairs;
- gates;
- loading aprons;
- rail/guided infrastructure where defined as construction.

Set 30 owns:

- traversal eligibility;
- route cost;
- local navigation;
- travel time;
- movement execution.

## 18.2 Storage and Fixed Logistics

Document 20 defines required/available storage spaces and building-level logistics endpoints.

Document 08 owns:

- fixed automation routing;
- conveyors;
- chutes;
- machine ports;
- automated transfer.

Inventory/resource systems own actual stock.

## 18.3 Mobile Logistics

Carts, wagons, minecarts, lifts and land transport movement are Set-30-owned.

Document 20 may own their stations/infrastructure.

## 18.4 Power

Document 08 owns non-magical automation power-network runtime where defined.

Buildings expose:

- source/provider mounts;
- consumer endpoints;
- capacity/connection requirements;
- safety/maintenance spaces.

## 18.5 Mana

Document 09 owns mana source/storage/transmission and magical network truth.

Document 20 exposes compatible building endpoints.

## 18.6 Water / Fluids

Document 20 owns wells/cisterns/pumps/drainage facilities as functional infrastructure.

Water/fluid identity and specialist marine/local-fluid simulation remain Set-26-owned where applicable.

## 18.7 Port Logistics

Port structures can expose:

- berth;
- cargo transfer;
- passenger access;
- provisioning;
- pump;
- crane;
- repair;
- customs;
- rescue;
- navigation-aid

endpoints.

26J resolves specialist port services and vessel compatibility.

# 19. Residents, Households, Jobs, Staffing and Entity Compatibility

A functional building may require people, but Document 20 does not own the people.

## 19.1 Document 07 Supplies

- persistent NPC identity;
- household membership;
- residence;
- job;
- schedule;
- labour availability;
- settlement roster;
- migration.

## 19.2 Set 28 Supplies

- willingness;
- consent;
- relationship;
- assignment agreement;
- social authority.

A marker cannot force an unwilling person to work or live somewhere.

## 19.3 Set 29 Supplies

- biological capability;
- Health;
- Stamina/Fatigue;
- injury;
- disease;
- treatment need;
- exposure sensitivity.

A staffing slot cannot make an injured worker healthy.

## 19.4 Set 30 Supplies

- whether the person can reach the marker/zone;
- journey/path;
- arrival/failure.

## 19.5 Entity Compatibility

Functional source may declare:

- body envelope;
- bed size;
- station reach;
- entrance/door clearance;
- mount/creature access;
- service accessibility.

Compatibility uses Entity/Movement/Biology facts rather than ancestry-based hard locks.

## 19.6 Occupancy

Housing and public services may expose capacity.

Actual occupants remain people with:

- household;
- preferences;
- permissions;
- social context.

Document 20 does not assign permanent social relationships.

# 20. Production, Services, Inputs, Outputs and Maintenance

Buildings become civilisation systems by connecting physical spaces to real processes.

## 20.1 Production Building

A production facility may require:

- active workstations;
- valid recipes;
- staff/operator or approved automation;
- inputs;
- tools;
- power/mana;
- output capacity;
- safety/environment;
- maintenance.

Document 05 owns transformations.

Document 08 owns automated machine execution.

## 20.2 Market / Trade Building

A market/trading facility may provide:

- vendor positions;
- storage;
- public access;
- inspection;
- secure payment/record space;
- loading/unloading.

Set 27 owns:

- price;
- market state;
- transaction;
- contract;
- taxes/tariffs;
- finance.

## 20.3 Health Building

A clinic/hospital may provide:

- treatment stations;
- beds;
- medicine storage;
- sanitation;
- staff positions;
- quarantine;
- emergency access.

Set 29 owns:

- patient biology;
- diagnosis/treatment outcome;
- injury/disease recovery.

## 20.4 Social/Cultural Building

A hall/shrine/theatre may provide opportunities for:

- assembly;
- ritual;
- performance;
- meetings;
- memory;
- education.

Set 28/13/09 own the social/political/magical meaning where applicable.

## 20.5 Maintenance

Maintenance may consume:

- labour;
- parts/materials;
- cleaning;
- fuel;
- power;
- mana;
- specialist inspection.

Condition/maintenance state belongs to the relevant structure/item/network owner.

Document 20 turns verified maintenance failure into service degradation only where the function contract requires it.

# 21. Settlement Stage Ladder and Capability Expectations

The shared planning language remains:

**Camp → Hamlet → Village → Fortified Village → Town → City → Capital → Magical Metropolis**

These are capability classifications, not automatic upgrade levels.

## 21.1 Stage Does Not Grant Service

A settlement does not gain:

- Housing;
- food;
- defence;
- trade;
- power;
- mana;
- government

because it crossed a stage threshold.

It reaches a stage because its actual systems demonstrate the relevant civilisation capability.

## 21.2 Ownership

Document 19 owns growth-stage readiness/classification.

Document 20 supplies:

- function-stage expectations;
- service capability evidence;
- required specialist functional relationships.

## 21.3 Non-Linear Development

A coastal Hamlet may have sophisticated fishing/harbour capability.

A realm outpost may have advanced portal infrastructure but weak agriculture.

A mining town may have heavy industry and poor Morale.

Stage classification must not force every settlement into the same building list.

# 22. Required, Optional, Conditional and Strategic Function Metadata

Universal definitions may expose planning metadata such as:

- Required;
- Optional;
- Conditional;
- Strategic;
- Upgrade;
- Repair;
- Recovery;
- Megaproject.

This metadata describes **eligibility/importance characteristics** of the function.

Document 19 owns the actual settlement project pool and candidate selection.

## 22.1 Required Does Not Mean Every Settlement

“Required” means the capability is normally needed for the relevant settlement context/stage unless an approved equivalent satisfies the requirement.

Examples:

- a subterranean society may not use a surface Well;
- a nomadic settlement may satisfy Housing differently;
- a coastal settlement may use fisheries;
- a magical settlement may solve some infrastructure through approved magical systems.

## 22.2 Conditional

Conditions may include:

- geography;
- culture;
- resource;
- threat;
- law;
- realm;
- technology;
- magic;
- maritime context;
- player choice.

## 22.3 Equivalents

Equivalents are capability-valid substitutes.

They are not arbitrary visual substitutions.

# 23. Settlement Planner Handoff to Document 19

The autonomous planner is now **Document-19-owned**.

Document 20 provides function-side inputs.

## 23.1 Inputs Supplied by Document 20

- active capacity;
- demand coverage;
- service blockers;
- function eligibility;
- upgrade/repair relationships;
- site requirements;
- dependency requirements;
- service redundancy;
- functional risk.

## 23.2 Document 19 Owns

- project pools;
- candidate generation;
- planner scoring;
- parcel/district fit;
- expansion sectors;
- project proposal;
- growth readiness;
- player proposal integration.

## 23.3 Proposal Intake

Document 20 receives a proposal and validates:

- function definition;
- blueprint/function compatibility;
- site;
- authority;
- dependencies;
- resource/labour path;
- access;
- construction profile.

It then creates the authoritative ConstructionProject if valid.

## 23.4 Emergency Projects

Document 15/19 may increase planning urgency during:

- disaster;
- siege;
- outbreak;
- refugee influx;
- route failure;
- flood;
- fire.

Urgency does not bypass validation.

# 24. Player Blueprints, Permissions and Existing-Town Integration

Document 19 owns restricted player blueprint authoring and settlement proposal UX.

Document 20 owns functional validation of the resulting structure.

## 24.1 Player Blueprint Acceptance

A player blueprint may privately remain:

- incomplete;
- experimental;
- decorative;
- non-functional.

To enter public/survival construction as a functional building it must pass:

- canonical definition references;
- semantic markers/zones/sockets;
- function contract;
- site/access;
- safety;
- dependency;
- pack/security;
- server/world permission.

## 24.2 No Marker-Created Function

A player cannot invent:

`marker.hospital_infinite`

and create a new service.

Markers must come from approved registries.

## 24.3 Existing Town Permission

Possible approvals:

- land/legal — Document 13;
- settlement planning — Document 19;
- resident/owner/social — Set 28;
- commissioned work/payment — Set 27;
- service/function — Document 20.

## 24.4 Player-Founded Settlements

Founders may receive broader planning/project authority.

They do not receive authority over:

- NPC loyalty;
- biological state;
- market truth;
- physical movement.

# 25. Districts, Complexes, Megaprojects and Wonders

20F may define universal functional complexes and civilisation-scale project families.

Document 19 owns where/how they fit into settlement planning.

## 25.1 Complex

A complex combines several services through:

- shared site;
- circulation;
- utility;
- logistics;
- staff;
- governance;
- staged construction.

Each service remains traceable.

## 25.2 Megaproject

A megaproject is a graph of authoritative subprojects.

It may require:

- districts;
- specialist facilities;
- resources;
- labour;
- contracts;
- politics;
- routes;
- magic;
- automation;
- realm/maritime infrastructure.

No single “megaproject progress” counter may fabricate completed subprojects.

## 25.3 Wonders

A wonder may have:

- cultural;
- magical;
- political;
- logistical;
- economic;
- historical

effects.

Those effects are committed by their owners.

The building definition coordinates the physical service contract.

# 26. World Generation, Ruins and Non-Settlement Structure Use

The same Blueprint Forge format can author world structures, but the universal settlement registry only applies where a structure provides or can provide a recognised civilisation function.

## 26.1 Worldgen Placement Profiles

May include:

- Biome, region and realm tags.
- Terrain and foundation limits.
- Rotation/mirroring.
- Rarity and spacing.
- Road, river, coast, resource or leyline relationships.
- Settlement/faction ownership.
- Guaranteed progression relationships.
- Loot, encounter and restoration profiles.
- Fallback placement rules.

## 26.2 Ruins and Restoration

A world-generated ruin may:

- Remain a landmark or dungeon only.
- Contain dormant universal functions.
- Be claimed and restored into a settlement service.
- Become a project prerequisite or culture heritage site.
- Preserve origin, occupation and damage history.

The restoration project must validate current site, ownership, source compatibility and required resources rather than simply toggling a ruin flag.## 26.5 Maritime Worldgen / Structure Intake

Coastal generation may create:

- harbour candidates;
- lighthouse/beacon ruins;
- wreck-related facilities;
- abandoned shipyards;
- docks;
- fortified ports.

26C/Atlas owns generated context.

Document 20/26J owns operational functional interpretation.

# 27. Persistence, Simulation LOD and Multiplayer Authority

Document 20 persists **ConstructionProjects and functional ServiceRecords**.

Document 12 persists the physical StructureInstance.

## 27.1 Persistent Construction State

Persist as required:

- project ID;
- target function;
- blueprint revision;
- site;
- sponsor/authority refs;
- stage;
- completed work;
- reservations;
- delivered stock;
- worker/task refs;
- blockers;
- contributors;
- history;
- recovery journal refs.

## 27.2 Service Record

A service record stores or reconstructs:

- structure ref;
- function ref;
- declared capacity;
- effective capacity;
- active/offline state;
- external evidence refs;
- blockers;
- last evaluation time;
- source revisions.

Do not copy entire mutable states from external owners.

## 27.3 LOD

Nearby:
- physical work;
- visible workers;
- exact local access;
- detailed service interaction.

Distant:
- scheduled work packages;
- authoritative resource/labour summaries;
- service snapshots;
- event-driven invalidation.

## 27.4 LOD Invariants

LOD cannot:

- create materials;
- finish an unworked project;
- heal a building;
- restore permission;
- create workers;
- make an inaccessible facility accessible;
- change ownership;
- activate a service whose dependencies are missing.

## 27.5 Multiplayer

Host/server owns:

- project creation;
- reservations;
- stage commits;
- building placement/changes;
- service activation;
- public blueprint admission;
- demolition;
- authoritative project cancellation.

Clients may preview/predict presentation but cannot commit world construction.

# 28. Validation, Diagnostics and Forge Test Laboratory

## 28.1 Validation Layers

1. Schema and identity.
2. Dependency and version.
3. Voxel/source integrity.
4. Semantic marker/zone/socket contracts.
5. Navigation and entity compatibility.
6. Construction stages and resource calculation.
7. Upgrade and state deltas.
8. Terrain and world placement.
9. Network connectivity and capacity.
10. Performance and bake limits.
11. Gameplay activation and settlement integration.
12. Package, save and multiplayer compatibility.

## 28.2 Severity

| **Severity** | **Result** |
|---|---|
| **Error** | Blocks approval, construction or runtime use. |
| **Warning** | May be accepted with recorded justification where policy allows. |
| **Advisory** | Suggests quality, accessibility, readability or performance improvement. |
| **Information** | Reports resolved state, capacity or dependency detail. |

## 28.3 Diagnostic Standard

Every diagnostic should include:

- Stable code.
- Severity.
- Affected element ID.
- Plain-language explanation.
- Why it matters.
- Suggested correction or valid exception path.
- Related definition/contract.

## 28.4 Test Laboratory Scenarios

Blueprint Forge should test structures under controlled scenarios such as:

- NPC entry, sleep, work and evacuation.
- Builder delivery and stage access.
- Warehouse loading and routing.
- Guard patrol, sight and alarm.
- Machine input/output and network loss.
- Fire, damage, breach and repair.
- Biome and material-pack preview matrix.
- Terrain slope, water, road and foundation placement.
- Distant LOD promotion/demotion.
- Save/load and migration.## 28.5 New Cross-System Diagnostics

Recommended additions:

- `BLD-BLOCKITEM-001` — construction references duplicate fake block Item.
- `BLD-MOVE-001` — required movement access unavailable/stale.
- `BLD-ECON-001` — required economic contract/payment/procurement unresolved.
- `BLD-SOC-001` — required consent/assignment unresolved.
- `BLD-BIO-001` — biological capacity/treatment/shelter evidence invalid.
- `BLD-MAR-001` — maritime facility/PortNode/service relationship invalid.
- `BLD-STRUCT-001` — StructureInstance evidence/revision inconsistent.
- `BLD-PLAN-001` — planner/project ownership boundary violated.
- `BLD-POC-001` — retired POC dependency appears in production profile.

# 29. Content Production Lifecycle and Revision Governance

Set 25 is the production-governance authority.

Document 20 uses compatible lifecycle states.

## 29.1 Functional Definition Lifecycle

Conceptually:

```text
Proposed
→ Draft
→ Reviewed
→ Approved
→ Production Admitted
→ Deprecated
→ Tombstoned / Archived
```

Exact Set-25 machine-readable lifecycle values prevail.

## 29.2 Blueprint Production Lifecycle

Official source may pass:

```text
Source Draft
→ Semantic Pass
→ Material Resolution
→ Construction Staging
→ Dynamic-State Coverage
→ Forge Validation
→ Runtime Bake
→ Gameplay Integration
→ Regression / Lab Validation
→ Pack Coverage
→ Release Candidate
```

## 29.3 Scope Classification

Do not use old `Archived Validation / Alpha / Beta / Final` values as current production authority.

Set-25 classifications such as:

- Core Required;
- Core Conditional;
- Teaser Only;
- Later Expansion;
- Tooling Research;
- Archived Validation

or their current approved equivalents govern production scope.

## 29.4 Stable IDs

Approved IDs:

- are not reused;
- are not casually renamed;
- use alias/migration/tombstone rules when superseded.

## 29.5 Companion Revision

20A–20H v1.0 must record:

- preserved definitions;
- changed ownership;
- maritime additions/mappings;
- deprecated POC scope fields;
- migration aliases;
- new cross-system interfaces.

# 30. Universal Category Index and Companion Ownership

The **current v0.2 120-definition baseline** is organised as:

| Catalogue Range | Category | Current Detailed Owner |
|---|---|---|
| 1–30 | Temporary, residential, food, health, welfare, culture and hospitality | 20A, with Hospital Complex in 20F |
| 31–60 | Extraction, processing, crafting, trade, education and professional services | 20B, with advanced industry/magic entries in 20E |
| 61–80 | Governance, justice, administration, defence and emergency services | 20C, with major complexes in 20F |
| 81–90 | Storage, roads, transport, water, sanitation and public utilities | 20D |
| 91–110 | Magic, ritual, portals, automation, power and advanced industry | 20E |
| 111–120 | Districts, complexes, megaprojects and wonders | 20F |
| All | Culture/faction/biome/realm/history composition | 20G |
| All numbered baseline definitions | Identity/stage/production register | 20H |

## 30.1 Baseline Protection

Until 20H v1.0:

- IDs 1–120 remain protected;
- no number is reused;
- no valid generic building is deleted because it appeared in the POC;
- later specialist systems may require additions or governed profiles.

## 30.2 Maritime Reconciliation Requirement

Set 26 requires settlement integration for:

- port/harbour;
- shipyard;
- lighthouse/navigation aid;
- fishery;
- maritime rescue;
- customs/port authority;
- cargo/provision/repair services;
- coastal defence/support where approved.

The current baseline already contains partial coverage:

- Fishery or Fishing Dock — #20;
- Tax or Customs Office — #66;
- Fire and Rescue Station — #79;
- Dock or Harbour — #87;
- Regional Logistics and Transit Nexus — #117.

But **shipyard and dedicated navigation-aid/lighthouse capability are not cleanly represented as distinct universal functions in the current 120 baseline**.

Therefore 20H v1.0 must perform a formal functional-distinction audit.

It may:

1. map a maritime service to an existing universal function/profile when the existing contract genuinely covers it;
2. add a specialist capability/profile under 26J when no separate settlement function is required;
3. **expand the universal catalogue beyond 120** when a distinct building/project function is genuinely necessary.

The old number `120` is not allowed to block an approved gameplay capability.

## 30.3 No Casual Catalogue Inflation

Maritime reconciliation does **not** justify separate universal entries for every:

- quay;
- pier;
- berth size;
- dock shape;
- cultural harbour;
- vessel class;
- lighthouse style.

Use modules/profiles/capabilities where functional distinction does not require a new universal definition.

# 31. Archived Validation and Production Scope

The former Forest Hamlet building roster is retained only as **Archived Validation** provenance.

## 31.1 Preserve the Mechanics

Retain generic:

- Campfire;
- Tent;
- Builder Supply Yard;
- Cottage;
- Farm;
- Communal Kitchen;
- Lumber Camp;
- Carpenter;
- Warehouse;
- Road;
- Well;
- Watchtower;
- Village Hall;
- Guard Post;
- Palisade;
- Gate.

These are useful universal capabilities.

## 31.2 Archive the Wrapper

Normal production does not require:

- Forest Hamlet;
- its exact 30-building roster;
- fixed cottage;
- fixed watchtower site;
- fixed raid extension;
- fixed Goblin faction;
- fixed timing;
- fixed resource locations.

## 31.3 Regression Fixture

The archived scenario may still test:

```text
need
→ project proposal
→ resource reservation
→ delivery
→ NPC construction
→ commissioning
→ active service
→ threat
→ damage
→ repair
→ save/LOD
```

## 31.4 Production Slice

Production validation must also test generated settlements that do not resemble the old POC.

# 32. Godot + Summer Engine Implementation Direction

Document 18 v1.0 is the active technical authority.

Document 20 specifies logical records/interfaces.

It does not claim exact current repository paths, class names, Autoloads or build commands.

## 32.1 Logical Runtime Responsibilities

Implementation needs equivalents of:

- functional definition registry;
- semantic marker/zone/socket registry;
- Blueprint Forge package resolver;
- ConstructionProject service;
- reservation/transaction adapter;
- structure/service adapter;
- commissioning/activation evaluator;
- maintenance/repair project adapter;
- settlement-service summary;
- project save/LOD adapter;
- building validation/debug inspector.

## 32.2 Node Boundary

A building Node/scene is presentation/interaction.

Persistent truth lives in:

- StructureInstance — Document 12 owner;
- ConstructionProject — Document 20;
- external domain records;
- ServiceRecord — Document 20.

## 32.3 Repository Paths

Use Document-18 logical path classes until the read-only repository audit maps them to real project paths.

Do not invent `res://game/...` paths as architecture truth.

## 32.4 Summer Engine Tasks

AI-assisted implementation follows Set-25/Document-18 bounded task contracts:

- exact source authority;
- inspected files;
- tests;
- evidence;
- rollback;
- human review.

# 33. Balancing Principles and Scope Controls

## 33.1 Player-Facing Balance

- Show causes rather than opaque penalties.
- Allow strain before cascading failure where appropriate.
- Provide multiple valid solutions through construction, trade, automation, magic, policy, diplomacy or relocation.
- Keep early buildings useful.
- Avoid mandatory optimal grids.
- Preserve aesthetic freedom while validating functional safety.
- Make maintenance/readiness visible.
- Allow partial functionality when physical/service separation supports it.

## 33.2 Catalogue Scope

- Keep current stable IDs protected.
- Prefer modules/profiles/packs over near-duplicate functions.
- Add a new universal function only after functional-distinction review.
- Do not let the old 120 cap block Set-26 or later approved capabilities.
- Do not expand merely for visual or size variants.

## 33.3 Performance

- No Node per decorative block.
- Recalculate only affected services.
- Use event/revision invalidation.
- Use LOD summaries without changing state.
- Separate Simulation Depth from device Performance Profile.

## 33.4 Economy Balance

Building construction cost is not market value.

Set 27 determines:

- price;
- wage;
- finance;
- contract;
- tax.

Document 20 declares physical requirements/capacity.

# 34. Staged v1.0 Reconciliation and Implementation Plan

## Stage 0 — Master Contract

- Approve Document 20 v1.0.
- Freeze ownership boundaries with Documents 12/19, Sets 26–30 and Forge.
- Retire active POC scope terminology.
- Protect current stable catalogue IDs.

## Stage 1 — 20H Catalogue Audit

Audit all current 120 definitions for:

- stable ID;
- owner;
- function distinction;
- seven-needs mapping;
- Set-25 lifecycle classification;
- POC provenance;
- maritime coverage;
- specialist-system boundary.

Resolve the 120-cap question through evidence.

## Stage 2 — 20A–20F Functional Reconciliation

Update family documents against:

- Documents 00–19 v1.0;
- Sets 26–30;
- FR-00-20-006;
- final Structure/Project ownership.

## Stage 3 — 20G Pack Reconciliation

Update:

- Atlas 24 cultures/realms;
- Set-25 packs;
- Set-26 maritime packs;
- player-town packs;
- dynamic occupation/restoration states.

## Stage 4 — Machine-Readable Contracts

After repository audit:

- schema mapping;
- validators;
- migration aliases;
- registry compiler integration;
- representative runtime fixture.

## Stage 5 — Generated Settlement Functional Slice

Test multiple seeds:

- housing;
- provisions;
- health;
- work;
- safety;
- infrastructure;
- morale;
- project planning;
- construction;
- damage/repair;
- LOD/save.

## Stage 6 — Maritime Functional Slice

Test:

- harbour;
- fishery;
- customs;
- rescue;
- shipyard;
- navigation aid;
- cargo/provision/repair services.

## Stage 7 — Multiplayer / Scale / Recovery

Test:

- simultaneous project edits;
- reservations;
- stale authority;
- content-pack removal;
- migration;
- low-end Simulation Depth;
- save/reload.

# 35. Open Questions and Deferred Decisions

The following remain open pending companion reconciliation, implementation evidence or product decisions:

- whether the universal catalogue remains 120 or expands;
- exact universal treatment of Shipyard;
- exact universal treatment of Lighthouse/Navigation Aid;
- whether maritime Rescue specialises #79 or needs a distinct function;
- whether Port Authority/Harbourmaster is a profile of #66 or separate function;
- exact mixed-use capacity sharing;
- exact maintenance rates;
- exact service capacities;
- exact route-congestion model;
- structural simulation depth beyond support/condition contracts;
- final number of official blueprint variants per function;
- final player blueprint sharing/moderation;
- final scripted-mod boundary;
- final realm-specialist facility catalogue;
- final high-density city service aggregation;
- final construction work-rate balance;
- final material/cost balance after representative Blueprint Forge sources exist.

These questions do not reopen:

- seven needs;
- one-owner rule;
- canonical Block/Item identity;
- Document-19 planner ownership;
- Document-20 ConstructionProject/function ownership;
- Document-12 StructureInstance ownership;
- Sets-27–30 specialist ownership.

# Appendix A — Universal Functional Definition Template

```yaml
building_function_definition:
  definition_id: <qualified_id>
  schema_version: <version>
  owner_document_ref: <20A-20H_or_specialist>
  lifecycle_status: <set25_status>

  classification:
    definition_kind: building|project|plan|specialist_extension
    earliest_stage_ref: <stage>?
    planning_metadata:
      requiredness_class: <class>
      conditional_tags: []
      strategic_tags: []

  needs:
    primary_need: <one_of_seven>
    secondary_needs: []
    demand_inputs: []
    capacity_profile_ref: <id>

  physical_contract:
    semantic_profile_ref: <id>
    placement_profile_ref: <id>
    access_requirement_refs: []
    environment_requirement_refs: []

  operation:
    staffing_requirement_refs: []
    stock_requirement_refs: []
    equipment_requirement_refs: []
    network_requirement_refs: []
    permission_requirement_refs: []
    maintenance_profile_ref: <id>

  external_interfaces:
    economy_refs: []
    social_refs: []
    biology_refs: []
    movement_refs: []
    maritime_refs: []
    magic_refs: []
    automation_refs: []

  activation_profile_ref: <id>
  upgrade_relationship_refs: []
  pack_compatibility_refs: []
  source_blueprint_profile_ref: <id>
  reason_code_namespace: <id>
```

---

# Appendix B — Blueprint Function Contract

```yaml
blueprint_function_binding:
  blueprint_ref: <22I_or_document19_ref>
  blueprint_revision: <rev>
  satisfied_function_refs: []
  semantic_marker_refs: []
  semantic_zone_refs: []
  socket_refs: []
  material_role_bindings: {}
  stage_profile_ref: <id>
  placement_profile_ref: <id>
  dependency_refs: []
  validation_report_ref: <id>
  source_hash: <hash>
```

The blueprint does not own the functional definition.

---

# Appendix C — ConstructionProject Template

```yaml
construction_project:
  project_instance_id: construction_project:<ulid>
  project_kind: new|repair|upgrade|conversion|demolition|restoration|network_extension

  intent:
    proposal_ref: <document19_ref>?
    target_function_refs: []
    blueprint_ref: <id>
    blueprint_revision: <rev>
    site_ref: <id>
    structure_ref: <document12_ref>?

  authority:
    sponsor_ref: <id>
    land_authority_ref: <document13_ref>?
    social_consent_refs: []
    economic_contract_refs: []

  execution:
    current_stage_ref: <id>
    completed_stage_refs: []
    reservation_refs: []
    delivered_stock_refs: []
    work_package_refs: []
    worker_refs: []
    machine_refs: []
    movement_arrival_refs: []
    blocker_reason_codes: []

  resolution:
    status: proposed|approved|active|blocked|paused|commissioning|complete|cancelled|failed
    commissioning_ref: <id>?
    resulting_structure_ref: <document12_ref>?
    service_record_refs: []
    history_refs: []

  revision: <rev>
```

---

# Appendix D — ServiceRecord Template

```yaml
building_service_record:
  service_record_id: building_service:<ulid>
  structure_ref: <document12_structure_instance>
  function_ref: <id>

  declared_capacity_ref: <id>
  effective_capacity: <value_or_band>
  status: active|strained|partial|offline|unsafe|unknown

  evidence_refs:
    staffing: []
    stock: []
    access: []
    permission: []
    network: []
    condition: []
    specialist: []

  blocker_reason_codes: []
  evaluated_world_time: <time>
  source_revisions: {}
  revision: <rev>
```

---

# Appendix E — Shared Semantic Families

## Markers

- entrances;
- household;
- jobs;
- delivery/loading;
- guard;
- social/public;
- construction;
- worldgen;
- medical;
- maritime/berth;
- navigation aid;
- rescue.

## Zones

- habitable;
- treatment;
- classroom;
- storage;
- work;
- public/private;
- hazard;
- defence;
- construction;
- quarantine;
- waterfront/berth/work basin.

## Sockets

- foot/service/cart/freight route;
- storage/logistics;
- power;
- mana;
- water/fluid;
- portal;
- modular structure;
- berth/cargo/passenger;
- pump/crane/repair.

Specialist ownership governs the runtime behind the socket.

---

# Appendix F — Cross-System Ownership Matrix

| Question | Owner |
|---|---|
| What universal/function contract exists? | Document 20 / owning 20A–20H companion or governed specialist |
| Which project should settlement consider? | Document 19 |
| What player blueprint exists? | Document 19 |
| What official blueprint source exists? | 22I |
| What is being constructed? | Document 20 ConstructionProject |
| What physical structure exists? | Document 12 |
| Which Blocks/Items/Resources are consumed? | Documents 03–06 |
| Who works there? | Document 07 |
| What is the wage/price/contract? | Set 27 |
| Does the person consent/accept assignment? | Set 28 |
| Is the worker/patient biologically capable/treated? | Set 29 |
| Can the actor reach the site? | Set 30 / Set 26 |
| What does the machine/network do? | Document 08 |
| What does mana/ward/portal do? | Document 09/14 |
| What is the combat outcome? | Document 16 |
| What is the quest/event outcome? | Document 15 |
| How does a port/shipyard service a vessel? | Set 26J/26H |
| How is this displayed? | Document 17 |

---

# Appendix G — Maritime Functional Intake Matrix

| Maritime Capability | Existing v0.2 Baseline | v1.0 Treatment |
|---|---|---|
| Fishery / Fishing Dock | #20 | Preserve; reconcile 26M/26J ecology/port interfaces. |
| Customs | #66 Tax or Customs Office | Preserve; Set 27 owns tariff/economic truth and 26J owns port-call service. |
| General Rescue | #79 Fire and Rescue Station | Preserve generic rescue; audit whether maritime-specialist rescue needs a distinct function/profile. |
| Dock / Harbour | #87 | Preserve physical settlement function; 26J owns PortNode/berth/service execution. |
| Regional Logistics | #117 | Preserve; may include port/rail/road/portal integration. |
| Shipyard | Not cleanly represented | **Mandatory 20H v1.0 functional-distinction decision.** |
| Lighthouse / Navigation Aid | Not cleanly represented | **Mandatory 20H v1.0 functional-distinction decision.** |
| Dry Dock / Haul-Out | Not cleanly represented | Likely shipyard/service profile unless evidence justifies separate function. |
| Harbourmaster / Port Authority | Partly overlaps #66/#61–64 | Audit as profile/service versus separate function. |
| Cargo Crane / Loading Service | Infrastructure/module/network | Usually module/service under 26J/08; no automatic universal entry. |
| Provisioning / Repair | Existing warehouses/workshops + port service | Compose existing functions with 26J service contracts. |
| Coastal Defence | Existing defence functions + naval specialist | Use 20C/16/26L rather than duplicate universal catalogue by default. |

---

# Appendix H — Lifecycle Precedence

A physical/safety state can constrain service:

```text
Ruined
> Unsafe / Breached
> Contested / Restricted
> Emergency Shutdown
> Under Construction / Conversion
> Damaged / Strained
> Input / Staff / Network Blocked
> Operational
```

This is a service-resolution precedence, not a replacement for Document-12 physical state.

---

# Appendix I — Archived Validation Regression Matrix

| Area | Regression Proof |
|---|---|
| Registry | Generic former POC functions resolve through stable production IDs or explicit aliases. |
| Player Blueprint | Cottage-like player design can satisfy Housing after validation. |
| Construction | Real materials/workers/stages; no duplication. |
| Warehouse | Project reservations/deliveries remain conserved. |
| Road | Physical infrastructure exists; Set 30 determines accessibility. |
| Well | Water service activates only against valid source/network. |
| Watchtower | Safety service affects warning/response but does not guarantee combat outcome. |
| Damage | Structure damage invalidates linked services. |
| Repair | Exact repair project restores function. |
| Save / LOD | Project, structure and service truth survive. |
| POC Isolation | Forest Hamlet/fixed raid cannot enter normal generation without Archive profile. |

---

# Appendix J — Logical Technical Source Classes

Exact repository paths are not defined here.

Document 18 maps logical classes such as:

- Authoring Source;
- Canonical Interchange;
- Generated Runtime Data;
- Engine Runtime Code;
- Editor Tool Code;
- Presentation Assets;
- Save Data;
- Migration Source;
- Test Source;
- Archived POC.

This supersedes illustrative hard-coded `res://...` path conventions from v0.2 as architectural authority.

---

# Supersession and Preservation Notes

## Preserved from v0.2

- seven main settlement needs;
- function / blueprint / project / instance separation;
- functional activation contracts;
- semantic markers/zones/sockets;
- semantic material roles;
- official Blueprint Forge source;
- player blueprint compatibility;
- staged construction;
- reservations;
- real labour/resources;
- partial functionality;
- upgrade inheritance;
- damage/repair/restoration;
- roads/utilities/storage/network integration;
- NPC staffing;
- settlement stage language;
- districts/complexes/megaprojects;
- culture/biome/realm packs;
- worldgen structure use;
- LOD/persistence/multiplayer;
- 120 current stable baseline IDs.

## Reconciled

- Document 19 now owns planner/project-pool selection and growth readiness;
- Document 20 owns ConstructionProject/function activation;
- Document 12 owns StructureInstance;
- FR-00-20-006 removes duplicate Block Items from construction;
- Set 27 owns economy;
- Set 28 owns social consent/relationships;
- Set 29 owns biology/treatment;
- Set 30 owns movement/travel/accessibility;
- Set 26 owns port/shipyard/vessel specialist execution;
- Set 23 owns presentation bindings;
- Document 18 v1.0 owns technical architecture.

## Archived

- active `Archived Validation`, `Archived Validation extended fixture`, `Alpha`, `Beta`, `Final` milestone classification as production authority;
- Forest Hamlet as mandatory settlement;
- fixed cottage/watchtower/raid sequence;
- invented Unreal-era/path assumptions;
- the idea that the number 120 may block later approved functional capability.

---

# Production Acceptance Criteria

Document 20 v1.0 is accepted when:

- [x] seven-needs model remains exactly seven;
- [x] universal function remains separate from blueprint/project/instance;
- [x] Document 19 planning ownership is explicit;
- [x] Document 20 ConstructionProject/function ownership is explicit;
- [x] Document 12 StructureInstance ownership is explicit;
- [x] 22I official Blueprint Forge ownership is explicit;
- [x] canonical Block/Item identity is enforced;
- [x] construction uses real reservations/resources/labour;
- [x] Set 27 economic ownership is respected;
- [x] Set 28 social ownership is respected;
- [x] Set 29 biological ownership is respected;
- [x] Set 30 movement ownership is respected;
- [x] Set 26 maritime facilities/services are integrated;
- [x] presentation assets cannot create function;
- [x] POC scope language is archive-only;
- [x] current 120 IDs are protected;
- [x] 120 is treated as a baseline pending 20H v1.0 functional-distinction audit;
- [x] shipyard and lighthouse/navigation-aid gaps are explicitly identified;
- [x] LOD cannot fabricate resources/services/projects;
- [x] multiplayer project commits are authoritative;
- [x] Godot/Summer implementation consumes Document 18 and does not invent repository paths;
- [x] 20A–20H targeted v1.0 reconciliation is formally required.

---

# Completion Statement

**Document 20 v1.0 reconciles Leyforge's Buildings, Facilities, Functional Services and Settlement Project foundation with Documents 00–19 v1.0, the Forge architecture and specialist Sets 24–30.**

The system's central promise remains unchanged:

**Civilisation capability must exist physically and operationally in the world.**

But the ownership is now complete.

**Document 19 plans.**  
**Document 20 defines function and owns ConstructionProjects.**  
**Document 12 owns the persistent structure.**  
**22I owns official Blueprint Forge source.**  
**Documents 03–06 own physical identities and transformations.**  
**Document 07 owns the people.**  
**Set 27 owns economic truth.**  
**Set 28 owns social truth.**  
**Set 29 owns biological truth.**  
**Set 30/26 owns movement.**  
**Set 26J owns specialist port/shipyard service execution.**

A hospital cannot heal because its sign says “Hospital.”

A market cannot change prices because it has stalls.

A road cannot guarantee a cart can traverse it.

A shipyard cannot spawn a vessel because a timer completed.

A beautiful player house cannot create Housing through marker spam.

And a distant settlement cannot gain services because its buildings are unloaded.

The physical world, the people, the resources and the specialist systems all have to agree.

**The next step is the focused Document Set 20 v1.0 reconciliation of 20A–20H, beginning with 20A — Housing, Provisions, Health and Community.**
