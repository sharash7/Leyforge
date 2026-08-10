# LEYFORGE

## 19 — Settlement Growth, District Planning and Player Voxel Blueprint System

### Player Blueprint Libraries, Settlement Plans, Parcels, Districts, Growth Readiness, Project Pools, Proposals, Construction Intake and Persistent Civilisation Expansion

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `19_Fantasy_Voxel_Civilisation_Sandbox_Settlement_Growth_and_Player_Voxel_Blueprint_System_v0_1` for active production direction  
**Settlement Operations Authority:** Document 07 v1.0  
**World / Site Context:** Document 11 v1.0  
**Structure Runtime Authority:** Document 12 v1.0  
**Civilisation / Law / Land Authority:** Document 13 v1.0  
**Quest / Event Integration:** Document 15 v1.0  
**UI / World Configuration:** Document 17 v1.0  
**Technical Implementation:** Document 18 v1.0  
**Functional Building / Construction-Project Authority:** Document 20 + 20A–20H  
**Official Developer Blueprint Authoring Authority:** Document 22I Blueprint Forge  
**Vessel Blueprint Specialist:** Document 26I Vessel Forge  
**Maritime Construction / Waterfront Integration:** Documents 26H–26J  
**Content-Pack / Validation Governance:** Set 25  
**Economic Contracts / Finance:** Set 27  
**Social Consent / Delegation:** Set 28  
**Biological Shelter / Health Inputs:** Set 29  
**Movement / Route Accessibility / Navigation:** Set 30, with Set 26 specialist aquatic/vessel movement  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale settlement-planning and player-blueprint system in which players can design reusable voxel buildings and town styles, settlements can evaluate real needs and opportunities, planners can allocate parcels and districts, and approved projects can be constructed by real people using real stock without turning creative tools into a second building-function, economy, social, movement or simulation engine.

> **Settlement Planning Statement**
>
> **A settlement grows by solving real capability gaps and pursuing real opportunities through people, land, routes, resources, buildings, services, politics, culture and history. Growth stages describe civilisation capability and planning complexity; they do not replace the seven settlement needs, dictate one mandatory city shape or grant abstract bonuses merely because a settlement crossed a population threshold.**

> **Player Blueprint Statement**
>
> **Players receive two first-class blueprint creation experiences — an in-world designer and a main-menu Player Blueprint Workshop — backed by the same restricted player-authoring schema. A player design may be saved while incomplete, but it enters survival construction, NPC public project pools or multiplayer worlds only after the required function, dependency, safety, performance and permission contracts validate.**

> **Blueprint / Function Separation Rule**
>
> **A blueprint describes spatial composition and semantic authoring intent. Document 20 decides whether the resulting structure satisfies a Housing, Provisions, Health, Work, Safety, Infrastructure or Morale function. A structure that looks like a house does not provide Housing unless its resolved runtime state passes the appropriate functional activation contract.**

> **Official / Player Authoring Separation Rule**
>
> **Document 22I Blueprint Forge is the unrestricted official developer-authoring authority. Document 19 owns the restricted player-facing blueprint experience, personal/world libraries, player style/town packs and settlement use of approved player products. Player tools reuse compatible contracts but do not gain unrestricted registry ownership, migration authority, world-generation authoring authority or developer-only override access.**

> **Project Ownership Rule**
>
> **Document 19 may identify a need, select a candidate blueprint, score a parcel, propose a project and request construction. Document 20 owns the authoritative Construction Project record and functional activation contract; Documents 05/07 and specialist systems own resource transactions and labour execution. Document 19 does not advance a building merely by increasing a planner progress bar.**

> **Movement Boundary Rule**
>
> **Document 19 may plan roads, paths, entrances, work faces, loading points and district connectivity. Physical road/bridge structures remain structure/building-owned, and Set 30 decides mover-specific accessibility, navigation, travel time and authoritative arrival. A line on a planning map is never proof that an NPC or cart can traverse it.**

> **POC Retirement Rule**
>
> **The Forest Hamlet cottage/watchtower sequence is Archived Validation only. The player-blueprint capability, staged construction, settlement proposals, autonomous growth, warehouses, roads, defence planning and NPC construction all survive; no normal production world requires the Forest Hamlet, its fixed watchtower site, fixed goblin raid or fixed growth path.**

---

# Document Purpose

Document 19 defines the **settlement orchestration and restricted player blueprint layer** of Leyforge.

It answers five production questions:

1. How can a player create reusable building, cluster, district and town-design products without gaining unrestricted developer Forge authority?
2. How does a settlement represent roads, parcels, districts, expansion sectors, project pools and growth readiness?
3. How are real needs, services, opportunities, laws, culture, terrain, routes, labour and resources turned into project proposals?
4. How can NPC settlements grow autonomously while still respecting physical construction, resources, movement, politics and persistent history?
5. How can player-founded settlements use the same civilisation systems while granting broader planning authority?

Document 19 **does not redefine** the building/service catalogue from Document 20 and does not become the official developer Blueprint Forge from 22I.

The original v0.1 already established the correct creative foundation:

- two player creation modes;
- one shared player blueprint foundation;
- semantic material tokens;
- staged construction;
- exact cost visibility;
- NPC-visible building;
- terrain adaptation;
- roads, parcels and districts;
- Camp → Magical Metropolis growth language;
- autonomous project selection;
- player proposals;
- player-founded settlements;
- style kits and town packs;
- damage, repair and upgrades;
- deterministic distant construction;
- script-free sharing.

Version 1.0 preserves those capabilities while reconciling them with:

- the canonical Block/Item identity rule;
- Document 20's seven-needs and functional-building authority;
- Blueprint Forge 22I;
- Vessel Forge 26I;
- Sets 27–30 final ownership;
- Set 25 production governance;
- the Godot + Summer Engine architecture in Document 18;
- the retirement of the fixed POC scenario.

---

# Production Source Reconciliation

| Source | Production Use in Document 19 |
|---|---|
| Documents 00–02 v1.0 | Sandbox-first civilisation, classless capability growth, long-term player agency. |
| Documents 03–06 v1.0 | Canonical Blocks/Items/Recipes/Resources, Block Inventory Projections, exact conserved materials and substitutions. |
| Document 07 v1.0 | Persistent people, households, jobs, labour availability, settlement operation and migration. |
| Document 08 v1.0 | Permissioned automation supply, machine/network truth and construction logistics support. |
| Document 09 v1.0 | Wards, mana infrastructure, ritual/portal requirements and magical construction context. |
| Document 10 v1.0 | Ecology, creature pressure and personhood-safe settlement interaction. |
| Document 11 v1.0 | Seed-derived terrain, hydrology, biome, generated settlement contexts and site suitability. |
| Document 12 v1.0 | Persistent Structure Instances, damage, ownership, restoration and world-state structure truth. |
| Document 13 v1.0 | Government, law, land claims, sovereignty, culture/faction identity and formal authority. |
| Documents 14–16 v1.0 | Realm adaptation, quest/event evidence and combat/defence outcomes. |
| Document 17 v1.0 | Player Blueprint Workshop shell, project UX, world settings, knowledge filtering and accessibility. |
| Document 18 v1.0 | Godot/Summer record/service architecture, persistence, LOD, validation and repository-honesty rules. |
| Document 20 v0.2 + 20A–H | Seven needs, universal building functions, functional activation and authoritative Construction Projects. |
| Document 22I | Official developer Blueprint Forge source, semantic layers, runtime bakes and unrestricted authoring governance. |
| Documents 26H–26J / 26I | Shipwright execution, Vessel Forge and port/shipyard/waterfront settlement integration. |
| Set 25 | Stable IDs, packs, source ownership, validation, lifecycle and POC archive separation. |
| Set 27 | Contracts, wages, procurement, finance, taxes and project economics. |
| Set 28 | Social permission, willingness, delegation, assignments and relationship consequences. |
| Set 29 | Shelter/exposure/health/care requirements and biological availability. |
| Set 30 | Physical movement, route accessibility, navigation, travel time and arrival evidence. |

---

# 1. Locked Settlement and Blueprint System Identity

Document 19 is the gameplay-side authority for **settlement planning state, growth orchestration and restricted player blueprint workflows**.

It owns:

- personal player blueprint drafts;
- player blueprint library records;
- restricted player blueprint schema/profile;
- in-world Player Blueprint Designer;
- main-menu Player Blueprint Workshop;
- player-created style kits and town-pack compositions within permitted schema;
- player blueprint submission/proposal records;
- settlement plan definitions/instances at the planning layer;
- settlement planning centre/sector/district graph;
- parcel planning records;
- expansion-sector planning;
- planned road/path/infrastructure graph;
- project-pool membership and planner weighting;
- planner candidate selection;
- growth-stage classification and readiness orchestration;
- settlement project proposals/intents;
- player-founded settlement planning policy;
- existing-town blueprint proposal integration;
- planner cooldown/redundancy/disruption policies;
- construction-intake/read-model orchestration;
- settlement-planning LOD;
- planner history and reason codes.

Document 19 does **not** own:

- the seven need formulas — Document 20;
- universal building functions — Document 20;
- authoritative Construction Project records — Document 20;
- official developer Blueprint Forge source — 22I;
- Vessel Forge source — 26I;
- persistent Structure Instances — Document 12;
- NPC person/job/household truth — Document 07;
- resource transformation — Document 05;
- market price, wages, tax, contract or finance — Set 27;
- Trust, social willingness or delegated assignments — Set 28;
- Health/shelter biological consequence — Set 29;
- physical movement/path execution — Set 30/26;
- political sovereignty and law — Document 13.

## 1.1 Design Promise

A player should be able to:

- create a cottage or workshop in the Player Blueprint Workshop;
- save it in a personal library;
- define player-editable material roles, stages and permitted semantic markers;
- validate it against one or more Document-20 functional profiles;
- place/propose it in a live settlement;
- see terrain, ownership, route, stock and permission blockers;
- have a settlement approve or reject it for understandable reasons;
- supply it personally, economically or through automation;
- watch persistent NPC workers construct it through the authoritative project system;
- see it become functional only when its Document-20 activation contract passes;
- later see it occupied, damaged, repaired, renovated, upgraded or culturally adopted.

The same planning architecture must scale from a cottage to:

- farmstead;
- market cluster;
- road network;
- waterfront;
- district;
- fortress;
- capital plan;
- realm outpost;
- civilisation megaproject.

## 1.2 What This System Is Not

- It is not the unrestricted developer Blueprint Forge.
- It is not the universal building-function catalogue.
- It is not unrestricted voxel paste that bypasses stock, land, routes or permissions.
- It is not a population-number city-level bar.
- It is not a colony manager that erases freeform block building.
- It is not a second contract, economy, social, health or movement simulation.
- It is not a fixed settlement template pasted over every seed.
- It is not a hidden POC story sequence.

---

# 2. Locked Decision Summary

| Area | Production Decision |
|---|---|
| Core Model | Player blueprints, settlement plans and planner records consume official functional/semantic contracts without becoming their owner. |
| Player Creation Modes | In-world Player Blueprint Designer and main-menu Player Blueprint Workshop are first-class. |
| Player Tool Parity | Both use one restricted player schema, edit-command core, validation vocabulary and serialisation path. |
| Official Authoring | 22I Blueprint Forge owns unrestricted official developer source. |
| Vessel Authoring | 26I Vessel Forge owns vessel-specialist source. |
| Draft Cost | Drafting is free; survival placement/construction consumes real resources through owners. |
| Canonical Blocks | Player blueprints reference canonical Blocks directly; recoverable Blocks do not require duplicate Item entries. |
| Functional Meaning | Document 20 owns universal building/service meaning and activation. |
| Construction Project | Document 20 owns authoritative build/repair/upgrade/demolition project state. |
| Settlement Form | Settlements grow through centres, roads, parcels, districts, project pools, utilities, defences and expansion sectors. |
| Growth Language | Camp → Hamlet → Village → Fortified Village → Town → City → Capital → Magical Metropolis remains the shared capability classification. |
| Growth Gate | Readiness consumes real system evidence; no population threshold alone promotes a settlement. |
| Autonomous Growth | Settlements can propose/build without the player when labour, authority, resources, land, route and service contracts permit. |
| Player Acceleration | Supply, trade, automation, expertise, defence, diplomacy, research and submitted designs can accelerate growth. |
| Existing Towns | Player products enter public/NPC pools only after local permission and functional validation. |
| Player-Founded Settlements | Broader planning control does not grant direct control over NPC relationships, biology, contracts or physics. |
| Materials | Semantic roles resolve to canonical Blocks or distinct Items/components. |
| Culture | 13/20G own cultural identity/official pack semantics; players may create restricted personal styles/town packs. |
| Terrain | Site plans can level, step, stilt, retain, carve, bridge, float or reject according to approved rules. |
| Roads | 19 plans networks; physical infrastructure is structure/building-owned; Set 30 owns mover-specific accessibility. |
| Economy | 19 may request procurement/funding; Set 27 owns price, payment, contract, wage, tax and finance. |
| Social | 19 may request consent/assignment; Set 28 owns willingness and relationship change. |
| Biology | 19 consumes shelter/health/care demand; Set 29 owns biological truth. |
| Maritime | Waterfront planning integrates ports/docks/shipyards; vessel authoring stays 26I and shipwright execution stays 26H. |
| LOD | Planning can abstract; resources, people, projects, structures and history never reroll on promotion. |
| POC | Forest Hamlet cottage/watchtower remains archive/regression only. |

---

# 3. Production Architecture and State Ownership

The production architecture separates **authoring**, **planning**, **functional meaning**, **world execution** and **persistent structure state**.

| Layer | Primary Owner | Meaning |
|---|---|---|
| Official Blueprint Source | 22I / 26I specialist | Unrestricted developer-authored voxel/semantic source and runtime bake products. |
| Player Blueprint Source | Document 19 | Restricted player-authored personal/world blueprint product. |
| Universal Building Function | Document 20 | What capability the building provides and its activation contract. |
| Settlement Planning | Document 19 | Parcels, districts, growth readiness, candidate projects and project pools. |
| Construction Project | Document 20 | Site, stage, resources, labour, blockers, activation and project history. |
| Structure Instance | Document 12 | Persistent placed structure identity, condition, ownership and physical history. |
| Settlement Operation | Document 07 | People, households, jobs, schedules, labour availability and operational settlement state. |
| Political Authority | Document 13 | Land, law, government, public authority and sovereignty. |
| Economy | Set 27 | Contracts, procurement, wages, payment, finance and tax. |
| Social | Set 28 | Consent, willingness, assignments, Trust/Loyalty and negotiation. |
| Biology | Set 29 | Shelter/health consequences and worker biological availability. |
| Movement | Set 30 / Set 26 | Physical route accessibility, journey/path execution and arrival. |

## 3.1 Core Planner Records

Document 19 owns records such as:

- `PlayerBlueprintDraft`
- `PlayerBlueprintLibraryEntry`
- `PlayerStyleKit`
- `PlayerTownPack`
- `SettlementPlanInstance`
- `SettlementPlanningGraph`
- `ParcelPlan`
- `DistrictPlan`
- `ExpansionSectorPlan`
- `PlannedRouteEdge`
- `ProjectPoolEntry`
- `ProjectCandidate`
- `SettlementProjectProposal`
- `GrowthReadinessSnapshot`
- `PlanningDecisionRecord`

These are not substitutes for external owner records.

## 3.2 Shared Player Editor Core

The in-world designer and main-menu Player Blueprint Workshop must use the same restricted:

- edit-command system;
- player schema;
- token resolver;
- validation profiles;
- stage authoring subset;
- marker subset;
- serialisation;
- library/versioning;
- import/export safety.

Two unrelated player editors are prohibited.

## 3.3 Developer Forge Compatibility

22I may expose a richer schema containing:

- worldgen placement;
- unrestricted semantic layers;
- migration authoring;
- internal runtime bake controls;
- developer-only validation;
- source override authority.

Player products remain a safe subset.

A player blueprint may later be promoted into official content through a deliberate Forge review/import path; promotion is not automatic.

---

# 4. Definition and Runtime Data Model

| Definition / Record | Owner | Core Contents |
|---|---|---|
| `OfficialBlueprintDefinition` | 22I / 26I | Canonical developer source/bake reference. |
| `PlayerBlueprintDefinition` | 19 | Restricted cells/tokens/stages/markers/dependencies and player metadata. |
| `PlayerBlueprintCellVolume` | 19 | Compact local Block/token placements, shape/rotation/stage flags. |
| `PlayerStyleKit` | 19 | Player-owned material/style mappings within allowed schema. |
| `SettlementPlanDefinition` | 19 | Planning rules for centre, roads, districts, pools, expansion and style. |
| `SettlementPlanInstance` | 19 | One world's current planning layout and history. |
| `ParcelPlan` | 19 | Plot bounds/frontage/use/owner refs/constraints/reservations. |
| `DistrictPlan` | 19 | Role, density, project pools, service targets, boundaries and history. |
| `GrowthReadinessSnapshot` | 19 | Evidence-based current readiness/blocked reasons for stage classification. |
| `SettlementProjectProposal` | 19 | Candidate intent submitted to authority/Document 20. |
| `ConstructionProject` | 20 | Authoritative build/repair/upgrade/demolition execution record. |
| `StructureInstance` | 12 | Persistent placed structure. |
| `SettlementOperation` | 07 | Persistent living community operation. |

## 4.1 Definition Versus Save State

A placed structure does not copy an entire official blueprint into the save.

Save/runtime records reference:

- stable blueprint ID/revision;
- source pack;
- resolved palette/material substitutions;
- StructureInstance;
- ConstructionProject;
- local deltas;
- ownership;
- damage;
- history.

Player-created definitions needed by a save are retained/version-locked or safely packaged with that world.

## 4.2 Planning Metadata

Planning/library lifecycle states may include:

- Draft;
- Validated Private;
- World-Approved;
- Settlement-Approved;
- Server-Allowed;
- Quarantined;
- Deprecated;
- Archived;
- Promoted-to-Forge.

These are not building functions.

## 4.3 Stable Identity

Player products use qualified creator namespaces under Set-25 governance.

Example conceptual IDs:

```text
leyforge.player.<creator_scope>.blueprint.<identity>
leyforge.player.<creator_scope>.style.<identity>
leyforge.player.<creator_scope>.town_pack.<identity>
```

Exact namespace/account strategy is an implementation/product decision.

---

# 5. Blueprint Taxonomy and Composition

| **Type**                     | **Typical Scale**                   | **Examples**                                                   | **Composition Rule**                         |
|------------------------------|-------------------------------------|----------------------------------------------------------------|----------------------------------------------|
| **Micro Blueprint**          | 1-5 m footprint                     | Furniture groups, stalls, lamps, wells, machines, decorations. | Placed directly or nested.                   |
| **Room Module**              | Small interior volume               | Bedroom, forge bay, shopfront, storage room, stair core.       | Nested, rotated, mirrored, palette-resolved. |
| **Building Blueprint**       | One functional structure            | Cottage, workshop, barn, inn, tower, warehouse.                | Primary construction project unit.           |
| **Building Family**          | Related upgrade/variant set         | Small/medium/large cottage; wooden/stone tower.                | Shared markers and upgrade links.            |
| **Cluster Blueprint**        | Several buildings and shared space  | Farmstead, market square, guard compound.                      | Creates parcels, paths, and project order.   |
| **Infrastructure Blueprint** | Linear or networked construction    | Road, bridge, wall, aqueduct, sewer, rail, conduit.            | Segment and socket rules.                    |
| **District Template**        | Neighbourhood-scale rules           | Residential, agricultural, market, military, magical.          | Project pools, density, roads, services.     |
| **Settlement Plan**          | Whole-settlement planning logic     | Custom town, forest village, dwarven hold, river city.         | Dynamic framework, not rigid paste.          |
| **Fortification Plan**       | Perimeter and defence system        | Palisade, wall, gates, towers, trenches, wards.                | Fits terrain and threat approaches.          |
| **Megaproject**              | Multi-site or multi-stage project   | Castle, cathedral, portal complex, floating district.          | Dependencies, districts, supply, politics.   |
| **Wonder**                   | Unique civilisation-scale structure | World tree city, celestial engine, sky citadel.                | Endgame world-state project.                 |

## 5.1 Nested Composition

A large blueprint can reference smaller blueprints rather than flattening everything immediately. A town hall may contain a stair-core module, council chamber, archive room, banner set, and roof family. Validation resolves these references deterministically and rejects circular dependencies.

## 5.2 Optional and Weighted Parts

Blueprints can contain optional modules or weighted choices such as chimney side, roof dormer, garden, culture banner, rear storage lean-to, or defensive shutters. Variation must never block required doors, paths, jobs, rooms, utilities, or upgrade space.

# 6. Dual Player Blueprint Creation Modes

Players receive two ways to create and design blueprints. They are different entry points into the same system rather than separate file formats.

| **Mode**                         | **Access**                                           | **Context Strengths**                                                                                                                | **Primary Uses**                                                                                            |
|----------------------------------|------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| **In-World Blueprint Designer**  | While a world is loaded.                             | Reads live terrain, buildings, parcels, ownership, roads, utilities, warehouses, stock, laws, and NPC needs.                         | Place a project, scan a structure, redesign a plot, propose a village build, repair or upgrade a live site. |
| **Main-Menu Player Blueprint Workshop** | From the main menu without loading a survival world. | Clean test plots, terrain presets, lighting, palette and stage simulation, libraries, variants, import/export, linked-world filters. | Create libraries, style packs, districts, settlement plans, or shareable packages.                          |

## 6.1 In-World Blueprint Designer

- Enter Draft Mode from the build menu, drafting table, settlement planner, or authorised project board.

- Choose an empty site, parcel, selected structure, or scanned block volume.

- Design with ghost blocks and markers without consuming materials.

- Preview levelling, foundations, roads, utilities, obstruction, ownership, stock, and village approval.

- Show known and available materials first; locked references remain visible with warnings.

- Save as a personal draft, place a project, submit to a village, attach to a district, or export.

- Convert a player-built structure into a blueprint after selecting bounds, pivot, stages, tokens, and markers.

## 6.2 Main-Menu Player Blueprint Workshop

- Open from Main Menu -\> Player Blueprint Workshop without selecting a world.

- Create or load a blueprint, room, cluster, district, style kit, or settlement-plan project.

- Use flat, hillside, riverbank, swamp, cave, cliff, floating, underwater, and custom test plots.

- Preview day/night, weather, seasons, biome lighting, culture palettes, damage states, and construction stages.

- Run support, entrance, path, room, job, bed, utility, upgrade, and dependency checks.

- Link a world profile to filter discovered content or use design-all mode with spoiler controls.

- Create collections and custom town packs, then choose which designs NPC planners may use.

## 6.3 Mode Parity and Differences

| **Capability**                                                  | **In-World**   | **Main-Menu Workshop**  |
|-----------------------------------------------------------------|----------------|-------------------------|
| **Voxel placement, shapes, rotation, fill, mirror, copy, undo** | Yes            | Yes                     |
| **Stage painting and resource calculation**                     | Yes            | Yes                     |
| **Markers, sockets, rooms, path tests**                         | Yes            | Yes                     |
| **Palette and culture preview**                                 | Yes            | Yes                     |
| **Live terrain and settlement laws**                            | Yes            | Test profiles only      |
| **Actual warehouse availability**                               | Yes            | Simulated               |
| **Immediate project placement**                                 | Yes            | No                      |
| **Batch variants and library administration**                   | Limited        | Full                    |
| **Package import/export and dependency repair**                 | Library access | Primary workflow        |
| **Large settlement-plan editing**                               | Planning map   | Full overhead workspace |

# 7. Blueprint Editing Tools and Interaction Grammar

| **Tool**                   | **Purpose**                                                                                          |
|----------------------------|------------------------------------------------------------------------------------------------------|
| **Place / Paint**          | Place one voxel, shape, marker, or token; use line, plane, and volume brushes.                       |
| **Erase**                  | Remove draft cells without touching the world unless an authorised live renovation is active.        |
| **Select**                 | Box, lasso, connected-material, room, stage, layer, or token selection.                              |
| **Move / Rotate / Mirror** | Transform selected cells while preserving stage and marker relationships.                            |
| **Copy / Paste**           | Duplicate regions or modules with dependency and overlap validation.                                 |
| **Fill / Replace**         | Fill volumes and replace by block, token, material family, stage, or condition.                      |
| **Shape Cycle**            | Cube, slab, stair, slope, beam, post, pillar, wall, arch, window, roof, furniture-sized piece.       |
| **Layer Slice**            | Hide above/below, isolate floors, cut away walls, show structure, decoration, or utilities.          |
| **Stage Paint**            | Assign cells and components to construction, repair, upgrade, or demolition stages.                  |
| **Token Paint**            | Convert exact materials into semantic palette roles.                                                 |
| **Marker Tool**            | Place doors, beds, workstations, rooms, storage, roads, guards, utilities, spawns, and interactions. |
| **Scaffold Preview**       | Show worker positions, ladders, platforms, supply crates, and stage access.                          |
| **Cost Preview**           | Show exact and tagged requirements by stage, substitutions, stock, and locked materials.             |
| **Path Test**              | Simulate entrances, workstations, beds, storage, patrol, evacuation, and deliveries.                 |
| **Terrain Test**           | Apply the design to slopes, rivers, caves, stilts, retaining walls, carving, and foundations.        |
| **Variant Generator**      | Create mirrored, rotated, roof, palette, culture, damage, and size variants from approved rules.     |
| **Simulation Play**        | Fast-forward stages, occupancy, schedules, utility flow, raid approach, and damage.                  |
| **Validation**             | Run errors, warnings, recommendations, compatibility, and package readiness.                         |

## 7.1 Undo, History, and Safety

Every edit is a reversible command. The Workshop keeps named versions and autosave recovery. In-world renovation requires confirmation for occupied beds, active workstations, owned storage, utility disconnection, structural traps, or irreversible terrain removal. Multiplayer projects show author, approver, contributors, and history.

## 7.2 Creative Freedom Versus Validity

A draft may be saved while incomplete or invalid. It cannot be approved for NPC use, settlement project pools, or public server sharing until blocking errors are resolved. Decorative blueprints use a lighter validation profile than housing, workshops, roads, or defences.

# 8. Voxel Blueprint Storage, Bounds, Layers, and Compression

Blueprint data must remain compact enough for thousands of definitions and player libraries. The canonical data stores local coordinates, a local palette of block or token references, shape and rotation, stage assignment, and sparse metadata. Empty space is not stored.

| **Data Element**        | **Rule**                                                                                                |
|-------------------------|---------------------------------------------------------------------------------------------------------|
| **Bounds**              | Integer min/max coordinates, pivot, orientation rules, optional expansion envelope.                     |
| **Cell Palette**        | Local indexes to exact block IDs, material tokens, modules, or state templates.                         |
| **Cell Data**           | Coordinate/index, shape, rotation, state, stage, optional/variant flags.                                |
| **Layer Groups**        | Foundation, structure, shell, roof, interior, function, decoration, utilities, terrain, scaffolding.    |
| **Compression**         | Sparse chunk sections, run-length encoding, palette compression, repeated modules, procedural segments. |
| **Stage Masks**         | Cells grouped by stage index or compact ranges.                                                         |
| **Marker Volumes**      | Points, lines, boxes, room volumes, route edges, and socket transforms stored separately.               |
| **Thumbnail / Preview** | Generated image and optional preview mesh; never source of truth.                                       |
| **Delta Variants**      | Variants store changes against a parent when smaller than a full duplicate.                             |
| **Limits**              | Configurable cell, dimension, marker, nesting, dependency, and package limits.                          |

## 8.1 Blueprint Coordinate Rules

- Use integer local voxel coordinates with a one-metre default grid.

- Every blueprint has a pivot for rotation, placement, parcel alignment, and upgrades.

- Doors and road sockets declare outward-facing directions.

- Blueprints declare allowed 90-degree rotations, mirroring, or fixed orientation.

- Nested modules resolve transforms deterministically and cannot form circular references.

## 8.2 Player Edits After Completion

Completed buildings remain editable block by block. Their record tracks Blueprint-Exact, Blueprint-Compatible, Player-Modified, Functionally Broken, or Detached. Decoration and compatible material changes need not invalidate function; removing beds, blocking the only entrance, or destroying a workstation can.

# 9. Material Tokens, Palettes, Style Kits, and Cultural Identity

Semantic material tokens separate structure logic from appearance. A building can retain layout, stages, entrances, jobs, and utility logic while changing materials and cultural details. Exact materials remain available for iconic or mechanically required parts.

| **Token**              | **Meaning**                | **Example Resolutions**                                   |
|------------------------|----------------------------|-----------------------------------------------------------|
| **foundation_primary** | Load-bearing foundation    | Fieldstone brick, granite, clay foundation, living roots. |
| **wall_primary**       | Main external wall         | Oak plank, limestone, adobe, livingwood, darkstone.       |
| **wall_secondary**     | Internal or accent wall    | Plaster, wattle, carved stone, coloured clay.             |
| **beam_structural**    | Visible frame/support      | Oak beam, ironwood, steel frame, crystal rib.             |
| **floor_primary**      | Main floor                 | Plank, stone tile, packed earth, polished crystal.        |
| **roof_primary**       | Weatherproof roof          | Thatch, shingle, slate, tile, leaf canopy, metal plate.   |
| **roof_trim**          | Ridge/eave/gutter/ornament | Wood, copper, carved stone, fae vine.                     |
| **opening_window**     | Window family              | Glass pane, shutter, lattice, crystal window.             |
| **opening_door**       | Door family                | Timber door, iron gate, rune door, curtain.               |
| **trim_culture**       | Culture decoration         | Banner, carving, mosaic, rune strip, bone charm.          |
| **utility_mechanical** | Mechanical components      | Gearbox, shaft, pipe, cable, chute.                       |
| **utility_mana**       | Magical infrastructure     | Conduit, rune plate, mana socket.                         |

## 9.1 Palette Resolution Order

1.  Resolve exact non-substitutable requirements.

2.  Apply blueprint overrides.

3.  Apply culture style kit.

4.  Apply allowed biome and climate adaptation.

5.  Apply settlement tier and prosperity variants.

6.  Apply player custom overrides.

7.  Check unlocks, availability, law, server rules, and substitutions.

8.  Freeze resolved materials when construction begins unless a revision is approved.

## 9.2 Custom Town Style Packs

A player-created style pack can contain palettes, roof families, road materials, doors/windows, trims, banners, vegetation, furniture groups, density, district themes, signature buildings, and approval rules. A settlement can use it as a full identity, blend it with a local culture, or accept selected designs. Cultural blending may affect morale, tourism, trade, identity, faction response, and story.

# 10. Construction Stages, Resource Requirements and Project Intake

Blueprint construction is represented by ordered stages. Stage count is flexible, but shared vocabulary improves UI, NPC logic, forecasting, and production. Small structures may merge stages; megaprojects split them into independent subprojects.

| **Shared Stage**                 | **Visible Work**                                                         | **Typical Requirements**                                       |
|----------------------------------|--------------------------------------------------------------------------|----------------------------------------------------------------|
| **0. Planning**                  | Project anchor, footprint, approvals, survey markers, ghost preview.     | Usually no permanent blocks; optional survey or permit costs.  |
| **1. Site Preparation**          | Clear vegetation, debris, level or carve, temporary access.              | Labour, tools, fill, hauling, demolition, excavation.          |
| **2. Foundations**               | Footings, stilts, retaining walls, drainage, basement shell.             | Stone, timber piles, mortar, fittings, waterproofing.          |
| **3. Structural Frame**          | Beams, pillars, floors, primary stairs, supports.                        | Beams, nails, rods, brackets, scaffolding.                     |
| **4. Main Shell**                | Walls, floors, partitions, arches, stairs, openings.                     | Wall materials, plaster, masonry, framing.                     |
| **5. Weatherproofing**           | Roof, doors, windows, shutters, gutters, exterior finish.                | Roof materials, glass, hinges, sealants, trim.                 |
| **6. Functional Installation**   | Beds, workstations, storage, machines, utilities, mana, water, lighting. | Furniture, station components, pipes, conduits, cores.         |
| **7. Furnishing and Culture**    | Furniture, signs, banners, plants, decoration, art.                      | Culture goods, cloth, paint, carvings, luxury goods.           |
| **8. Inspection and Activation** | Path, safety, room, worker, utility, ownership, and job validation.      | Labour or specialist approval.                                 |
| **9. Prestige Finish**           | Optional landscaping, ornament, warding, ceremonial upgrade.             | Rare materials, specialists, culture goods, mana, story items. |

## 10.1 Automatic Cost Calculation

The editor counts exact cells and components in each stage. Tokens resolve through the selected palette. The project service adds non-block components, scaffolding, tools, labour, waste, quality, terrain work, difficulty, specialists, and substitutions. Costs remain transparent down to source cells.

| **Cost Source**           | **Calculation Role**                                                                  |
|---------------------------|---------------------------------------------------------------------------------------|
| **Voxel cells**           | Resolved canonical Block references or genuinely distinct Item requirements by stage.                                            |
| **Functional components** | Doors, beds, workstations, machines, chests, lamps, runes, banners.                   |
| **Terrain work**          | Excavation, fill, retaining walls, stilts, bridge supports, drainage.                 |
| **Temporary works**       | Scaffolds, ladders, braces, supply crates; some are returned.                         |
| **Waste / efficiency**    | Builder skill, tools, station/material quality, settings, damage, and rework.         |
| **Substitution**          | Allowed tags, culture alternatives, quality equivalents, approvals.                   |
| **Labour and time**       | Complexity, height, travel, hauling, weather, skill, hazards, power/magic assistance. |

## 10.2 Resource Reservation

Projects reserve stock by stage and priority. Early stages can begin while later finish materials are missing. Emergency food, medicine, defence, and repair policies may override reservations according to settlement law. Player-founded settlements can choose full-project, stage-by-stage, or manual reservation.

## 10.3 Activation Gates

A structure may become partially functional before cosmetic completion. A watchtower activates when the platform, access, railing, and guard marker pass inspection. A house activates when weatherproof, reachable, and fitted with valid beds. Decoration can continue afterward.## 10.4 Production Ownership of Costs and Stages

The player editor may calculate a **preview** by resolving blueprint cells, tokens and declared components.

The authoritative survival-world project is created and committed by Document 20 using Document 05 and the appropriate inventory/resource owners.

Therefore:

- a preview is not a reservation;
- a reservation is not consumption;
- a visual stage completion is not a committed ConstructionProject stage;
- a palette change after reservation requires revalidation;
- a Block output/reference uses the canonical Block ID and its inventory projection rather than a fake Item definition;
- labour cost is not converted into wages by Document 19 — Set 27 owns wages/contracts;
- worker availability is not invented by the planner — Document 07 supplies it.

# 11. Functional Markers, Rooms, Jobs, Sockets, and Utilities

| **Marker / Socket**   | **Examples**                                                           | **System Use**                              |
|-----------------------|------------------------------------------------------------------------|---------------------------------------------|
| **Entrance / Exit**   | Doorway, gate, hatch, ladder, stair portal, emergency exit.            | Navigation and occupancy.                   |
| **Room Volume**       | Bedroom, kitchen, workshop, storage, hall, shop, shrine, classroom.    | Need, job, safety, ownership, ambience, UI. |
| **Bed / Household**   | Adult, child, guest, barracks bed, household anchor.                   | Housing and population capacity.            |
| **Workstation**       | Forge, saw, loom, desk, altar, rune table, stall, guard post.          | Jobs, production, services, schedules.      |
| **Storage**           | Chest, warehouse input, pantry, armory, silo, fuel store, magic vault. | Inventory permissions and logistics.        |
| **Road Socket**       | Primary, secondary, path, service, cart, rail, bridge, gate.           | Settlement graph and access.                |
| **Delivery Socket**   | Builder supply, warehouse delivery, machine input, market unloading.   | Hauling and automation.                     |
| **Power Socket**      | Mechanical shaft, wire, pipe, steam, water, wind, fuel.                | Automation and machine activation.          |
| **Mana Socket**       | Conduit, battery, ward, ritual link, leyline anchor.                   | Magic infrastructure.                       |
| **Water / Waste**     | Well, intake, drain, irrigation, sewer, bath, fire-water point.        | Services and health.                        |
| **Guard / Defence**   | Patrol node, lookout, firing point, gate control, rally, shelter.      | Raid AI and safety.                         |
| **Interaction**       | Dialogue point, board, counter, bell, lever, portal control.           | Player and NPC interaction.                 |
| **Spawn / Occupancy** | Resident, worker, customer, livestock, visitor, defender.              | Safe population and events.                 |
| **Upgrade Socket**    | Reserved connection/volume for annex, floor, tower, or utility.        | Non-destructive progression.                |

## 11.1 Validation Profiles

| **Profile**        | **Blocking Requirements**                                                                  |
|--------------------|--------------------------------------------------------------------------------------------|
| **Decorative**     | Bounds, dependencies, placement legality, and no impossible states.                        |
| **Housing**        | Reachable entrance, valid room, beds, weatherproofing, light/safety, household capacity.   |
| **Workshop**       | Workstation, worker route, input/output storage, safety clearance, power/fuel if required. |
| **Public Service** | Public route, service point, queue/capacity, accessibility, ownership, operating hours.    |
| **Defence**        | Guard access, safe platform, cover/railings, approach visibility, evacuation, and supply.  |
| **Infrastructure** | Socket continuity, slope/turn limits, support, clearance, and network compatibility.       |
| **Megaproject**    | Subproject graph, district access, workforce, logistics, utilities, political/story gates. |## 11.3 Semantic and Functional Ownership

Player tools may place only the marker/socket classes exposed to the restricted schema.

22I remains official semantic-source authority and Document 20 remains functional interpretation authority.

A player cannot create a new gameplay service by inventing a marker name.

For example:

- placing `marker.bed` can contribute to a Housing contract only if the resolved structure, access, ownership, shelter and runtime state pass Document 20;
- placing `marker.market` cannot create a market — Set 27 and Document 20 must recognise the service;
- placing a `road_socket` cannot prove accessibility — Set 30 evaluates the actual mover and path;
- placing a `mana_input` cannot create mana — Document 09 supplies network truth.

# 12. Terrain Adaptation, Site Validation, and Foundations

| **Foundation Policy**   | **Behaviour**                                                     | **Typical Uses**                               |
|-------------------------|-------------------------------------------------------------------|------------------------------------------------|
| **Require Flat**        | Reject if slope exceeds tolerance.                                | Markets, plazas, large workshops, civic halls. |
| **Minor Levelling**     | Cut/fill small height differences and clear obstacles.            | Homes, barns, small shops.                     |
| **Stepped Foundation**  | Terraced floors or stepped foundation bands.                      | Hillside and mountain settlements.             |
| **Stilted**             | Support columns to stable ground or waterbed.                     | Swamp, river, coast, floodplain.               |
| **Retaining Wall**      | Build walls and fill terraces around the footprint.               | Dense towns, roads, fortifications.            |
| **Carve Terrain**       | Excavate declared volumes and support ceilings.                   | Dwarven halls, caves, cellars, mines.          |
| **Bridge / Span**       | Find banks/supports and generate deck/support segments.           | Rivers, ravines, raised roads.                 |
| **Floating / Anchored** | Require magic/technology anchors and clear air.                   | Sky districts, floating towers.                |
| **Underwater / Sealed** | Require seal, access lock, and water displacement.                | Aquatic structures and domes.                  |
| **Conform Surface**     | Repeat eligible path/wall/fence segments along terrain.           | Roads, walls, farms, canals.                   |
| **Reject Site**         | Fail clearly when cost, damage, law, or constraints are exceeded. | All blueprints.                                |

## 12.1 Site Validation Order

9.  Check settlement, faction, parcel, ownership, law, and player permissions.

10. Check bounds, rotation, world height, chunk availability, and protected objects.

11. Check slope, support, water, caves, vegetation, hazards, roads, utilities, and upgrade space.

12. Check overlaps with structures, projects, claims, paths, spawns, resources, and story anchors.

13. Calculate adaptation plan and added cost.

14. Check entrances, delivery access, builder reachability, NPC navigation, evacuation, and service routes.

15. Check district suitability, culture rules, stage requirements, and expected settlement effects.

16. Present valid placement or exact blocking reasons with suggested fixes.

## 12.2 Player Override

Player-founded settlements and creative settings can override non-critical warnings. Out-of-world bounds, unresolved dependencies, protected terrain, absent authority, or impossible navigation for required functions cannot be silently ignored in normal survival play.## 12.3 Movement and Waterfront Site Validation

Site validation distinguishes:

- **planned connectivity** — Document 19;
- **physical structure** — Document 12 / 20;
- **mover-specific accessibility** — Set 30;
- **aquatic/vessel feasibility** — Set 26.

Waterfront parcels may additionally consume:

- shoreline/bathymetry context;
- berth approach;
- launch/dry-dock/slipway requirements;
- flood/tide/current exposure;
- vessel clearance;
- cargo/loading connections.

Document 19 may reserve a waterfront planning envelope. It does not certify a ship, berth or navigable channel.

# 13. Roads, Parcels, Building Clusters, Districts, and Settlement Plans

A settlement is a graph and collection of projects, not a single model. The planner represents centres, roads, parcels, districts, services, utilities, defences, terrain constraints, expansion sectors, and landmark anchors. Buildings occupy parcels and connect through sockets.

| **Planning Element**  | **Role**                                                                          | **Examples**                                           |
|-----------------------|-----------------------------------------------------------------------------------|--------------------------------------------------------|
| **Settlement Centre** | Primary civic/social anchor and local coordinate reference.                       | Campfire, elder hall, market square, keep, world tree. |
| **Road Graph**        | Primary, secondary, path, service, cart, rail, bridge, gate, tunnel.              | Access, trade, patrol, expansion, district boundaries. |
| **Parcel**            | Buildable plot with frontage, depth, height, owner, uses, and expansion envelope. | House lot, workshop, farm plot, tower site.            |
| **Building Cluster**  | Several structures sharing courtyard, service, or project sequence.               | Farmstead, artisan yard, guard compound.               |
| **District**          | Zone with role, density, services, project pool, style, risk, and population.     | Residential, market, military, magical.                |
| **Perimeter**         | Wall, palisade, wards, trenches, gates, patrol route, safe zone.                  | Fortified Village and above.                           |
| **Utility Graph**     | Water, waste, power, mana, logistics, lighting, fire response.                    | Town and city infrastructure.                          |
| **Expansion Sector**  | Reserved direction or region for future growth.                                   | Riverfront, hill district, outer farms, industry.      |
| **Landmark Anchor**   | Unique or story-critical project site.                                            | Town hall, temple, mage tower, castle, portal.         |

## 13.1 District Types

| **District**                | **Typical Content**                                      | **Planning Concerns**                            |
|-----------------------------|----------------------------------------------------------|--------------------------------------------------|
| **Residential**             | Housing, wells, small shops, gardens, social spaces.     | Quality, safety, services, distance to work.     |
| **Agricultural**            | Fields, barns, mills, irrigation, livestock, storage.    | Soil, water, hauling, raids, seasons.            |
| **Artisan**                 | Smiths, carpenters, weavers, potters, repair yards.      | Fuel, noise, fire, storage, delivery.            |
| **Market / Civic**          | Market, inn, guild, town hall, square, court.            | Road centrality, visitors, law, prestige, trade. |
| **Military**                | Barracks, armory, towers, walls, training, command.      | Threat approaches, supply, patrol, civilians.    |
| **Magical**                 | Mage towers, rune halls, mana stores, wards, rituals.    | Mana, risk, laws, conduits, specialists.         |
| **Industrial / Automation** | Machines, furnaces, warehouses, power, rails, logistics. | Noise, pollution/risk, throughput, transport.    |
| **Religious / Cultural**    | Shrines, temples, festivals, archives, monuments.        | Culture, story, morale, law, pilgrimage.         |
| **Noble / Administrative**  | Palaces, estates, embassies, administration, gardens.    | Politics, security, prestige, inequality.        |
| **Harbour / River**         | Docks, fishery, shipyard, warehouses, floodworks.        | Depth, trade routes, flood risk.                 |
| **Underground / Vertical**  | Mines, tunnels, terraces, towers, cliff homes.           | Support, lifts, ventilation, navigation, light.  |

## 13.2 Settlement Plan Is a Rule Set

A custom town plan defines road hierarchy, district proportions, centre type, wall timing, expansion directions, density, building pools, landmark rules, style pack, and approval logic. It does not pre-place every house, so the same plan can adapt to different seeds and terrain while retaining identity.## 13.3 Planned Roads Versus Physical Routes

A `PlannedRouteEdge` is a settlement-planning relationship.

It may declare:

- desired endpoints;
- intended mode classes;
- frontage;
- target width;
- bridge/tunnel expectation;
- loading/service points;
- protected corridor;
- expansion dependency.

It is not automatically traversable.

After construction or world change:

- Document 12/20 owns the physical road/bridge/gate;
- Set 30 owns mover-specific accessibility and route/travel evidence;
- Set 27 may consume the resulting route for trade economics;
- Set 28 may hold actor knowledge about it.

## 13.4 Waterfront and Port Districts

The original Harbour/River district expands into a general waterfront planning family that can include:

- fishing shore;
- ferry landing;
- cargo quay;
- harbour basin;
- shipyard;
- dry dock;
- rescue station;
- customs;
- lighthouse/beacon;
- marine market;
- warehouse;
- waterfront housing;
- floodworks.

Document 20/26J owns the corresponding functional services; Document 19 owns how an approved settlement plan reserves and connects the spaces.

# 14. Settlement Growth Ladder and Stage Gates

| **Stage**              | **Identity**                        | **Core Gates**                                                                               | **Typical Projects**                                               |
|------------------------|-------------------------------------|----------------------------------------------------------------------------------------------|--------------------------------------------------------------------|
| **Camp**               | Temporary survival foothold.        | Shelter, fire, food access, basic storage, safe sleep.                                       | Tents, lean-tos, campfire, cache, temporary fence.                 |
| **Hamlet**             | Small permanent community.          | Permanent homes, food, water, shared storage, basic jobs and path.                           | Cottages, farm, well, warehouse, resource site, guard post.        |
| **Village**            | Self-sustaining local settlement.   | Housing reserve, job diversity, workshops, trade, defence, services.                         | Blacksmith, market, shrine, inn, healer/school, roads, tower.      |
| **Fortified Village**  | Prepared for sustained threat.      | Perimeter, gates, patrols, armory, food reserve, repairs, threat intelligence.               | Walls, towers, barracks, ward stones, refuge.                      |
| **Town**               | Regional service and trade centre.  | Multiple districts, specialists, administration, caravans, utilities, roads.                 | Town hall, guilds, market, schools, temples, industry.             |
| **City**               | Large complex civilisation centre.  | District governance, logistics, public services, layered defence, advanced magic/automation. | City walls, hospitals, universities, mana grid, sewers, port/rail. |
| **Capital**            | Culture/faction seat of power.      | Government, diplomacy, command, archives, signature projects, major trade.                   | Palace/council, grand temple, fortress, embassy, monuments.        |
| **Magical Metropolis** | World-shaping endgame civilisation. | High-tier mana, portals, golems, realm logistics, wonders, floating/vertical districts.      | Portal nexus, leyline engine, sky district, wonder, realm embassy. |

## 14.1 Growth Gate Categories

- Population and household stability.

- Housing capacity, quality, privacy, and spare beds.

- Food, water, fuel, medicine, and seasonal resilience.

- Safety, guards, walls, lighting, wards, evacuation, repairs, and threat pressure.

- Job diversity, tools, workstations, specialists, education, and succession.

- Storage, roads, trade, logistics, power, mana, sanitation, and services.

- Culture, morale, festivals, identity, monuments, laws, and conflict.

- Required projects, story chapters, faction status, discoveries, and world events.

## 14.2 Stage Does Not Force Uniform Appearance

Two Town-stage settlements can be physically different: a dense walled river town, a spread-out forest trade town, or an underground hold. Stage describes capability and complexity; style, terrain, culture, project history, player choices, and threats determine form.## 14.3 Growth Stage Is a Classification, Not a Reward Trigger

The stage ladder remains useful because it describes the **kind of civilisation complexity the planner is expected to handle**.

A stage does not directly grant:

- production;
- housing;
- trade;
- defence;
- mana;
- tax income;
- NPC population.

Those exist only through their owning systems.

## 14.4 Seven-Need Integration

Every growth-readiness evaluation consumes Document 20's seven main needs:

1. Housing
2. Provisions
3. Health
4. Work
5. Safety
6. Infrastructure
7. Morale

Other values such as:

- hunger;
- water access;
- medicine;
- employment;
- road quality;
- warding;
- market access;
- education;
- defence;
- culture

remain causes/capacities beneath those seven needs or specialist progression systems.

## 14.5 Growth Readiness Snapshot

```yaml
growth_readiness:
  settlement_ref: <id>
  current_stage: <stage>
  candidate_stage: <stage>?
  need_snapshot_refs: []
  population_operation_ref: <doc07_snapshot>
  infrastructure_refs: []
  political_refs: []
  route_refs: []
  economy_refs: []
  specialist_refs: []
  required_project_refs: []
  blocking_reason_codes: []
  opportunity_tags: []
  evaluated_world_time: <time>
  planning_revision: <rev>
```

# 15. Autonomous Project Selection and Growth Planning

Semi-autonomous settlements periodically evaluate needs and opportunities. They build only from eligible project pools: developer blueprints, culture packs, generated variants, faction content, approved player submissions, and settlement-specific designs.

| **Scoring Factor**        | **Meaning**                                                             |
|---------------------------|-------------------------------------------------------------------------|
| **Stage Requirement**     | Projects required to reach or stabilise the next stage.                 |
| **Critical Need**         | Food, housing, water, medicine, fuel, storage, safety, repairs.         |
| **Population Pressure**   | Overcrowding, migration, families, refugees, specialist arrival.        |
| **Job and Economy**       | Missing production, bottleneck, trade opportunity, unemployment.        |
| **Defence and Threat**    | Raid routes, damage, wall gaps, guards, corruption, creature pressure.  |
| **Culture and Story**     | Traditions, festivals, faith, leadership, archives, faction arcs.       |
| **Infrastructure**        | Roads, bridge, warehouse, power, mana, sanitation, logistics, services. |
| **Player Proposal**       | Reputation, contribution, authority, contract, law, or vote.            |
| **Cost and Feasibility**  | Resources, workers, terrain, sites, dependencies, travel, risk.         |
| **Strategic Opportunity** | Trade route, rare resource, border, alliance, tourism, military goal.   |
| **Redundancy Penalty**    | Existing capacity, duplicate services, maintenance, empty buildings.    |
| **Disruption Penalty**    | Demolition, relocation, cultural conflict, law, ecological damage.      |

## 15.1 Project Selection Flow

17. Simulation creates needs, opportunities, stage targets, and emergencies.

18. Filter the project pool by culture, stage, unlocks, law, dependencies, specialists, terrain, and permissions.

19. Score eligible projects and expected settlement effects.

20. Evaluate parcels, roads, utilities, hazards, expansion space, and cost.

21. Use automatic, proposal, vote, contract, leader, or player approval according to governance.

22. Reserve resources and labour by priority.

23. Begin when the first stage is supplied and safe.

24. Completion updates jobs, housing, services, culture, defence, story, maintenance, and future eligibility.

## 15.2 Avoiding Village Spam

Settlements should not fill every empty space or build endlessly without purpose. Structures have capacity, maintenance, staffing, and redundancy values. Growth is limited by population, demand, services, land, culture, risk, and cooldowns. Empty buildings can be repurposed, rented, mothballed, dismantled, ruined, or offered to new residents.## 15.3 Planner Inputs Are External Evidence

The planner may score a project candidate, but it must consume authoritative facts.

Examples:

- Housing shortage — Document 20 / Document 07 inputs;
- medical pressure — Set 29 + Document 20;
- unemployment/work capacity — Document 07 + Document 20, with wages/businesses from Set 27;
- market opportunity — Set 27;
- faction conflict — Document 13;
- social opposition — Set 28;
- blocked road — Set 30 / structure owner;
- missing materials — inventory/resource systems;
- builder shortage — Document 07;
- storm/flood exposure — world/maritime owners.

## 15.4 Planner Output

A selected candidate produces a `SettlementProjectProposal`.

The proposal can contain:

- target function;
- candidate blueprint;
- site/parcel;
- expected capacity;
- dependencies;
- reason;
- priority;
- planning estimate;
- required approvals.

Document 20 then decides whether a ConstructionProject can actually be created.

## 15.5 Emergency Planning

Emergency modes may temporarily prioritise:

- shelter;
- water/provisions;
- health;
- evacuation;
- defence;
- route repair;
- fire/flood response.

They do not bypass ownership or create free stock.

# 16. NPC Construction, Labour, Logistics, and Activation

Nearby construction is physically visible. Builders collect tools and reserved resources, travel to the site, work from valid positions, place coherent block batches, and react to interruptions. The system should feel physical without requiring one pathfind and inventory transaction per voxel.

| **Construction Role**    | **Primary Tasks**                                                    |
|--------------------------|----------------------------------------------------------------------|
| **Surveyor / Planner**   | Confirms site, footprint, levels, roads, markers, and stage plan.    |
| **Labourer**             | Clearing, hauling, excavation, fill, scaffolding, simple placement.  |
| **Builder / Carpenter**  | Wood frame, floors, walls, roofs, doors, furniture.                  |
| **Mason**                | Stone foundations, walls, arches, roads, retaining walls.            |
| **Smith / Mechanic**     | Fasteners, metal parts, gates, machines, power connections.          |
| **Mage / Rune Worker**   | Conduits, wards, runes, ritual alignment, magical stabilisation.     |
| **Engineer / Architect** | Large spans, utilities, districts, and megaproject coordination.     |
| **Hauler / Courier**     | Moves supplies from warehouses, carts, chutes, roads, or automation. |
| **Inspector / Leader**   | Checks activation, safety, law, function, and handover.              |

## 16.1 Block Placement Batching

A work action can consume and place a small coherent batch such as a beam section, wall course, roof strip, furniture set, or stage subregion. Sounds, carried bundles, scaffolds, dust, and partial geometry preserve the construction fantasy.

## 16.2 Builder Task Ordering

25. Prepare work zones and temporary storage.

26. Build lowest and load-bearing cells first.

27. Complete access, ladders, floors, and scaffolds needed for later work.

28. Place shell and weatherproofing before vulnerable furniture and machinery.

29. Install utilities and functional markers in dependency order.

30. Run path, room, safety, ownership, power, mana, and job validation.

31. Activate when the functional stage passes.

32. Complete decoration and prestige work if supplied.

## 16.3 Interruptions and Failure

Weather, raids, injury, tool breakage, missing resources, blocked routes, ownership change, terrain collapse, corruption, utility failure, or leadership decisions can pause or alter a project. The project screen states the exact blocker and preserves placed work. Cancellation uses transparent refund, salvage, demolition, or abandoned-site rules.## 16.4 Construction Execution Ownership

The visible fantasy remains exactly as intended, but the production execution chain is:

**Document 19 planning proposal**  
→ **Document 13 / Set 28 approval where required**  
→ **Document 20 ConstructionProject**  
→ **Document 05 / inventory/resource reservations and transactions**  
→ **Document 07 labour/task intent**  
→ **Set 30 movement and arrival**  
→ **Document 20 / Document 12 authoritative stage/world commit**  
→ **Document 20 functional activation**  
→ **Document 19 planner/growth re-evaluation**

Document 19 never teleports builders, spends stock or declares completion by itself.

## 16.5 Labour and Wages

A project may require:

- builder-hours;
- role classes;
- specialists;
- shifts;
- work access.

Document 07 supplies worker availability.

Set 27 owns:

- wage;
- employment contract;
- contractor payment;
- financing.

Document 19 may display estimates supplied by those systems.

# 17. Player Influence, Permissions, and Existing-Town Integration

Players can contribute custom architecture to existing NPC settlements, but the settlement remains a social and political entity. Authority depends on formal land/government rights from Document 13, social willingness from Set 28, economic contracts from Set 27, settlement policy and project type. Document 19 consumes those decisions rather than owning reputation, Trust, law or payment.

| **Integration Route**     | **Player Action**                                                           | **Rules**                                                                     |
|---------------------------|-----------------------------------------------------------------------------|-------------------------------------------------------------------------------|
| **Public Suggestion**     | Submit a blueprint proposal to a request board.                             | Settlement evaluates need, style, cost, plot, dependencies, and law.          |
| **Contracted Project**    | Village requests a function; player selects or supplies an eligible design. | Must satisfy required markers/capacity; rewards and reputation apply.         |
| **Granted Plot**          | Player receives permission to build on a defined parcel.                    | Design freedom within height, use, road, safety, and culture rules.           |
| **Project-Pool Addition** | Approved design becomes eligible for future autonomous construction.        | Settlement-only, culture pack, faction pack, or player-founded pack.          |
| **Template Replacement**  | Replace a default building family.                                          | Requires compatibility, upgrades, resident/job relocation, and approval.      |
| **Direct Governance**     | Founder, ruler, mayor, conqueror, or authorised architect.                  | Broad control; morale, law, faction response, and rebellion still matter.     |
| **Unauthorised Build**    | Build without permission in protected land.                                 | Crime, removal, fines, hostility, confiscation, or tolerated informal growth. |

## 17.1 Cultural Fit

Existing towns can use Strict, Guided, Blended, Open, Occupied, or Player-Ruled architecture policies. A strict settlement may require local palettes and roof forms; a blended settlement accepts foreign designs with local materials; an open trade city celebrates mixed styles. Conquered settlements may comply while accumulating fear, resistance, identity loss, or rebellion pressure.

## 17.2 Adding Designs to Existing Town Blueprints

The player can add a design to a district project pool, assign it to specific parcels, create a new building family, replace an optional project, or define an upgrade path from an existing building. Core story landmarks, protected graves, unique culture structures, and critical roads require stronger authority or cannot be replaced.## 17.3 Consent, Politics and Contracts

A proposal may require several independent approvals.

Examples:

- **Political/legal permission:** Document 13.
- **Resident/owner/social willingness:** Set 28.
- **Commissioned construction contract:** Set 27.
- **Physical site feasibility:** Document 19 + Document 12/20.
- **Movement/work access:** Set 30.
- **Functional suitability:** Document 20.

One approval cannot impersonate another.

A mayor approving a project does not prove the land is physically buildable.

A resident liking a design does not sign a funding contract.

A paid contractor does not gain political authority to demolish protected heritage.

# 18. Player-Founded Settlements and Custom Town Styles

Player-founded settlements reuse the same residents, jobs, storage, projects, growth, law, economy, threat, and simulation systems as NPC villages. Their difference is broader planning authority and control over libraries, styles, districts, and approvals.

| **Control Area**       | **Player-Founded Settlement Options**                                                           |
|------------------------|-------------------------------------------------------------------------------------------------|
| **Blueprint Library**  | Choose allowed, preferred, banned, emergency, and signature designs.                            |
| **Town Style**         | Select or create palettes, roofs, roads, trims, banners, furniture, density, and landmarks.     |
| **Settlement Plan**    | Set centre, roads, districts, perimeter, expansion sectors, landmarks, utilities.               |
| **Project Governance** | Automatic, advisory, vote-based, leader approval, player approval, emergency override.          |
| **Resource Policy**    | Donation, taxation, trade purchase, reserves, budgets, rationing, automation input.             |
| **Land Policy**        | Public, household, guild, player, faction, leased, protected, sacred, industrial, agricultural. |
| **Style Policy**       | Strict custom style, culture blend, free build, district rules, preservation.                   |
| **NPC Freedom**        | Residents can request, propose, decorate, repair, improve, or resist under law/settings.        |

## 18.1 Custom Town Creation Flow

33. Create or select a style pack in the main-menu Workshop.

34. Create a settlement plan with centre, roads, districts, project pools, and growth preferences.

35. Found a camp in-world and claim or negotiate land.

36. Place the centre, storage, shelters, and access route.

37. Recruit residents and assign governance rules.

38. Allow the planner to propose projects from the custom library.

39. Approve, prioritise, supply, automate, or directly build projects.

40. Revise the plan as terrain, population, stories, threats, and technology change.## 18.2 Founding Is Not Instant Sovereignty

Creating a camp or placing a settlement centre does not automatically grant legal sovereignty.

Depending on world context, founding may require:

- unclaimed land;
- recognised claim;
- purchase/lease;
- treaty;
- grant;
- conquest/occupation result;
- informal settlement tolerated by local authority.

Document 13 owns the formal political outcome.

## 18.3 Living Population Remains Autonomous

The founder may configure planning policies and priorities where their authority allows, but residents remain persistent people.

They can:

- request;
- disagree;
- migrate;
- accept/refuse assignments;
- form factions;
- respond socially.

Set 28 and Document 07 remain authoritative.

# 19. Blueprint Libraries, Packs, Dependencies, and Versioning

| **Library / Pack**          | **Purpose**                                                                                     |
|-----------------------------|-------------------------------------------------------------------------------------------------|
| **Personal Drafts**         | Private works in progress; may be invalid or unresolved.                                        |
| **World Library**           | Blueprints available to one save, settlement, server, or campaign.                              |
| **Approved Player Library** | Validated designs allowed for survival placement and NPC use.                                   |
| **Culture Pack**            | Buildings, palettes, decorations, districts, roads, landmarks, and preferences for one culture. |
| **Town Pack**               | Settlement plan plus compatible families, districts, roads, utilities, and style.               |
| **Server Pack**             | Curated allowlisted blueprints and versions distributed by a host.                              |
| **Mod / Content Pack**      | Versioned registry content installed with dependencies and compatibility.                       |
| **Legacy / Archived**       | Older versions retained for existing saves and migration.                                       |

## 19.1 Dependency Rules

- A blueprint declares required blocks, items, markers, nested blueprints, style kits, and minimum versions.

- Normal blueprint packages prohibit scripts.

- Optional dependencies can add variants without blocking the base.

- Circular references are invalid.

- Missing exact blocks need a declared fallback or migration.

- Imported content never silently substitutes mechanically different blocks.

## 19.2 Versioning and Migration

Editing a library design creates a new version rather than mutating every placed structure. Existing structures can stay on the old version, migrate automatically when safe, request approval, or receive a renovation project. Save data preserves the version actually used.## 19.3 Set-25 Pack Governance

Player blueprint/town packs use Set-25 principles:

- stable namespace;
- schema version;
- source provenance;
- dependency manifest;
- semantic hash;
- lifecycle state;
- validation evidence;
- migration policy;
- quarantine on unresolved required dependency.

A player package does not enter the canonical official registry merely because it is valid.

## 19.4 Official Blueprint Relationship

An approved player product may be:

- private player content;
- world-local content;
- server-approved public content;
- settlement-approved project-pool content;
- submitted for official Forge promotion.

Only the final route transfers it into an official developer-managed 22I source package.

# 20. Import, Export, Sharing, Mods, and Safety

Player creativity benefits from sharing, but blueprint packages must remain safe, inspectable, and compatible with persistent worlds. The default format contains data and preview media only and executes no arbitrary code.

| **Safety Area**         | **Rule**                                                                                                   |
|-------------------------|------------------------------------------------------------------------------------------------------------|
| **Script-Free Default** | No executable scripts, shaders, native libraries, or arbitrary file access in normal packages.             |
| **Manifest**            | Package ID, author label, version, game/schema version, dependencies, hashes, dimensions, cells, flags.    |
| **Validation Sandbox**  | Imported data is parsed with limits before entering registries or world state.                             |
| **Size Limits**         | Maximum package bytes, cells, dimensions, nesting, markers, images, and variants.                          |
| **Content Review**      | Show thumbnail, description, tags, dependencies, unknown content, warnings, and validation before install. |
| **Server Authority**    | Host controls allowed packages, versions, upload rights, placement, and NPC project-pool use.              |
| **Ownership**           | Metadata may credit creators, but game logic does not trust unverifiable ownership claims.                 |
| **Updates**             | Never overwrite a world-required version without keeping compatibility or migration.                       |
| **Reporting / Hiding**  | Future services can moderate; local files remain removable, hideable, and quarantinable.                   |

## 20.1 Sharing Scope

Initial versions support local export/import and server pack distribution. Online browsing, ratings, cloud sync, creator profiles, or Steam Workshop can be added later. The file format and validation must not depend on a specific service.## 20.2 Canonical Block / Item Safety

Imported blueprints reference canonical definition IDs.

They cannot ship a duplicate Item merely to represent a recoverable Block.

If a player package depends on a placeable Block:

- it references the canonical Block ID;
- inventory/build systems use the Block Inventory Projection;
- separate Items are permitted only for genuinely distinct carried components/resources.

## 20.3 Executable Content

The normal player-blueprint format is data-only.

Arbitrary code, native libraries, scripts and unsafe shader/file access are outside the player package trust boundary unless a future mod architecture explicitly admits them.

# 21. Damage, Repair, Renovation, Upgrades, and Replacement

| **State / Project**              | **Meaning**                                                                          |
|----------------------------------|--------------------------------------------------------------------------------------|
| **Planned**                      | Approved footprint and stages; no permanent construction.                            |
| **Under Construction**           | Partial stages, scaffolds, supplies, workers, blockers.                              |
| **Functional Incomplete**        | Core use active; finish or prestige work remains.                                    |
| **Complete**                     | All required stages complete and validated.                                          |
| **Damaged**                      | Function reduced by missing blocks, utilities, markers, or access.                   |
| **Burned / Flooded / Corrupted** | Special damage with hazards, cleansing, contamination, or material loss.             |
| **Ruined**                       | Major failure; may be occupied, salvaged, restored, memorialised, or replaced.       |
| **Repair Project**               | Compares current state with a compatible target and requests missing work.           |
| **Renovation**                   | Changes rooms, materials, function, style, or capacity while preserving history.     |
| **Upgrade**                      | Moves through a declared family link, annex, extra floor, expansion, or replacement. |
| **Repurposed**                   | Changes functional markers and identity while retaining much of the structure.       |
| **Demolition / Salvage**         | Controlled removal with ownership, relocation, waste, heritage, and safety rules.    |

## 21.1 Repair Masks

Repair should not blindly overwrite player modifications. Comparison categorises cells as required missing, required damaged, acceptable substitution, player-added, blocked, obsolete, or protected. Repair plans target function and declared preservation policy, then allow exact restoration or compatible repair.

## 21.2 Upgrade Safety

Upgrade definitions declare preserved, removed, and new cells, relocation needs, occupancy impact, closure time, expansion envelope, and fallback when space is unavailable. A cottage must not erase a neighbour or road when becoming a townhouse.## 21.3 Runtime Ownership of Damage and Function

Document 19 may plan:

- repair;
- renovation;
- upgrade;
- demolition.

But:

- Document 12 owns StructureInstance condition/history;
- Document 20 owns functional service state;
- Document 16 and environment systems supply damage evidence;
- Set 29 supplies occupant biological consequence;
- Set 27 supplies economic cost;
- Document 13/28 supply permission/social consequence.

# 22. Automation, Magic, Defence, and Megaproject Integration

| **Connected System**        | **Blueprint Requirements**                                                                          |
|-----------------------------|-----------------------------------------------------------------------------------------------------|
| **Automation**              | Input/output ports, storage, power, filters, maintenance, logistics, clearance, throughput.         |
| **Village Warehouse**       | Delivery socket, reservation categories, priorities, contribution ledger, overflow, ownership.      |
| **Power**                   | Mechanical, fuel, water, wind, steam, wires, pressure, and realm-specific networks.                 |
| **Mana**                    | Conduits, batteries, runes, wards, rituals, purity, stability, overload, leyline anchors.           |
| **Defence**                 | Walls, gates, towers, patrols, firing points, cover, traps, wards, refuge, repair access.           |
| **Roads and Trade**         | Cart width, bridge load, caravan turns, unloading, gate control, tolls, safe routes.                |
| **Golems / Special Labour** | Golem access, charging, job zones, inventories, repair bays, culture/law.                           |
| **Portals / Dimensions**    | Footprint, stabilisers, exclusion zone, destination, logistics, quarantine, return route.           |
| **Megaprojects**            | Subproject graph, districts, workforce, politics, specialists, contracts, power/mana, risks, story. |

## 22.1 Megaproject Construction

Megaprojects are graphs of sites and stages, not one giant cell list and progress bar. They can require quarry and road upgrades, worker housing, foundations, utilities, main wings, defences, ceremonial finish, and activation. Each subproject can provide partial benefits or fail independently.## 22.2 Specialist Ownership

The blueprint/planning layer may expose spatial connectors and requirements, but it does not own the connected runtime.

- Automation execution — Document 08.
- Mana/ward/portal magic — Document 09.
- Defence combat — Document 16.
- Physical route access — Set 30.
- Trade value/tolls/contracts — Set 27.
- Portal destination/realm route — Document 14.
- Port/shipyard/vessel services — Set 26 / Document 20.

## 22.3 Megaproject Planner

A megaproject is represented as a graph of ordinary authorised subprojects.

Document 19 may orchestrate:

- dependency order;
- district/site reservations;
- planning milestones;
- candidate phase selection.

Document 20 owns each authoritative ConstructionProject and service activation.

# 23. Persistence, Simulation LOD, Determinism and Multiplayer Authority

Planning state is persistent when it matters.

A settlement plan may survive:

- player departure;
- chunk unload;
- realm travel;
- server restart;
- NPC migration;
- project interruption;
- content update.

## 23.1 What Document 19 Persists

Persist as required:

- settlement plan identity/revision;
- planning centre;
- district boundaries;
- parcel records;
- expansion sectors;
- planned-route intents;
- project-pool configuration;
- planner policies;
- approved player blueprint/version references;
- proposal history;
- growth-stage classification;
- important planner decisions;
- unresolved conflicts;
- player-founded style/town-pack references.

It does not duplicate:

- ConstructionProject state from Document 20;
- StructureInstance state from Document 12;
- resident state from Document 07;
- economy/social/biology/movement state from Sets 27–30.

## 23.2 Planning LOD

### P0 — Active Planning
- detailed parcel/site scoring;
- nearby proposal evaluation;
- visible player planner overlays.

### P1 — Settlement Reduced
- district/project-pool evaluation;
- event-driven candidate refresh.

### P2 — Regional Planning Summary
- stage readiness;
- major shortages/opportunities;
- approved major project intents.

### P3 — Dormant Scheduled
- wake on major need, completion, disaster, migration or policy change.

## 23.3 LOD Invariants

LOD cannot change:

- approved parcel ownership;
- player blueprint revision;
- public/private eligibility;
- project approval history;
- current growth stage;
- protected expansion corridor;
- historical planner decision.

## 23.4 Distant Construction

Distant construction remains Document-20/07/05 execution.

Document 19 consumes its progress.

When an area loads, Document 19 may re-evaluate:

- surrounding parcels;
- district capacity;
- route connections;
- future candidates.

It never “fills in” a building that the ConstructionProject did not actually complete.

## 23.5 Multiplayer

Host/server authority validates:

- public blueprint admission;
- project-pool changes;
- parcel reservations;
- district edits;
- settlement plan changes;
- public proposals;
- player-founded planning policy.

Private drafts can remain local until submitted.

## 23.6 Conflict-Safe Collaboration

Collaborative planning records:

- author;
- revision;
- approver;
- proposed change;
- accepted/rejected state;
- reason;
- affected parcel/project refs.

Stale edits require refresh/rebase rather than last-write-wins destruction.

# 24. Godot + Summer Engine Technical Architecture

Document 18 v1.0 is the active technical authority.

Document 19 defines logical records and interfaces but does not invent exact repository paths or claim implementation completion.

## 24.1 Logical Runtime Components

Illustrative responsibilities include:

- Player Blueprint Library service;
- restricted player Blueprint Editor core;
- Player Blueprint validation adapter;
- Settlement Planning service;
- Parcel/District planning store;
- Project Pool resolver;
- Growth Readiness evaluator;
- Proposal service;
- Blueprint Package intake;
- Planning LOD adapter;
- planning view-model adapter.

Exact symbols and paths require the Document-18 repository audit.

## 24.2 Definition / Runtime Separation

Player blueprint **definitions** are immutable/versioned inputs.

Settlement **plan instances** and planning records are mutable save state.

Construction projects and structures are external owner records.

## 24.3 Godot Scene Boundary

Godot Nodes may provide:

- viewport/editor presentation;
- gizmos;
- in-world ghost previews;
- map overlays;
- UI screens.

Persistent planning truth must not depend on those Nodes remaining loaded.

## 24.4 Summer Engine

Summer Engine may assist with:

- editor implementation;
- validators;
- migration;
- package tooling;
- test generation;
- planner diagnostics.

Tasks remain bounded by Set-25/Document-18 task contracts.

## 24.5 No Duplicate Blueprint Forge

The player editor may reuse shared lower-level services, but Document 19 does not fork or replace the official Blueprint Forge source architecture.

# 25. UI/UX Screens, Flows, Feedback, and Accessibility

| **Screen**                        | **Primary Information**                                                                                     |
|-----------------------------------|-------------------------------------------------------------------------------------------------------------|
| **Blueprint Library**             | Search, filters, collections, versions, compatibility, dependencies, validation, world/server availability. |
| **Player Blueprint Workshop**            | 3D editing, layers, palette, stages, markers, inspector, cost, validation, preview, save/export.            |
| **Style Kit Editor**              | Tokens, mappings, roofs, trims, roads, furniture, density, culture rules, preview set.                      |
| **District / Settlement Planner** | Road graph, parcels, districts, pools, growth gates, utilities, perimeter, expansion.                       |
| **In-World Draft Overlay**        | Ghosts, live terrain, conflicts, ownership, roads/utilities, stock, build/submit actions.                   |
| **Project Screen**                | Stage progress, costs, reserved/available/missing stock, workers, blockers, effects, history.               |
| **Village Proposal Screen**       | Need, options, cultural fit, plot, cost, benefit, law, vote/approval, reputation.                           |
| **Import Review**                 | Manifest, preview, dimensions, dependencies, unknown content, warnings, validation, permissions.            |
| **Blueprint Compare / Migration** | Old/new versions, cell and marker changes, affected structures, migration choice.                           |

## 25.1 Feedback Priority

- Blocking error: colour plus icon, shape, and text; states why approval or placement fails.

- Warning: permits draft/save but highlights risk, cost, culture, path, or upgrade concern.

- Recommendation: offers improvement without implying failure.

- Valid: gives a reasoned success state, not only green colour.

- Unknown: unresolved dependency, hidden content, unloaded terrain, stale server state, or estimate is labelled honestly.

## 25.2 Input and Accessibility

Keyboard/mouse is the primary dense editing input, but controller support uses radial tools, snapping, focusable inspectors, layer cycling, camera controls, and history. Support scalable text, non-colour conflict cues, reduced motion, configurable ghost contrast, narration labels, hold/toggle options, remapping, camera comfort, and simplified editor presets.## 25.3 Player-Trust Requirements

The UI must clearly distinguish:

- draft estimate;
- authoritative stock;
- reserved stock;
- approved proposal;
- active ConstructionProject;
- completed StructureInstance;
- functional/disabled service;
- unknown route/access;
- stale planning data.

A green ghost is not an authoritative completion.

# 26. Content Production Strategy and Scale Targets

Settlement diversity should come from reusable functions, blueprint source pools, style packs, modules, district rules and player products rather than one unique hard-coded building for every culture/material/state combination.

Document 20H remains the production catalogue/backlog authority for universal building definitions.

22I remains official blueprint-source production authority.

Document 19 focuses on the planning/player-authoring products required to use those systems.

## 26.1 Planning Content Families

Production needs reusable planning families for:

- settlement centres;
- housing parcels;
- agriculture;
- extraction;
- artisan/work;
- storage/logistics;
- civic/market;
- health;
- defence;
- culture/religion;
- education;
- automation/industry;
- magic;
- waterfront/ports;
- transport;
- realm adaptation;
- megaprojects.

## 26.2 Player Blueprint Capability Progression

Player tools can expose complexity progressively:

### Beginner
- building bounds;
- canonical Blocks;
- door/bed/work markers;
- simple stages;
- palette roles;
- cost preview.

### Intermediate
- nested modules;
- functional profiles;
- terrain adaptation;
- road/loading sockets;
- upgrade paths;
- style kits.

### Advanced
- clusters;
- district rules;
- town packs;
- project-pool weighting;
- utility/network semantics;
- realm/waterfront adaptation.

Developer-only worldgen/migration/internal semantic authority remains in 22I/25.

## 26.3 Official Production Workflow

1. Define the universal function in Document-20 authority.
2. Author official source in Blueprint Forge 22I.
3. Validate physical/semantic/function contracts.
4. Bake runtime products.
5. Add the source to eligible project pools through governed content packs.
6. Test placement, construction, activation, damage, LOD and save.
7. Expose a restricted player-compatible family if appropriate.

## 26.4 AI-Assisted Production

AI-assisted tooling may propose:

- palettes;
- player-template variants;
- validation fixes;
- test cases;
- district alternatives.

AI does not receive authority to publish canonical content without validation/review.

# 27. Production Scope and Archived Validation

The old v0.1 POC scope is no longer the production delivery model.

The capabilities it proved are retained as generic production requirements.

## 27.1 Production Capability Proof

A production validation world should demonstrate:

- player creates a valid personal blueprint;
- the same definition opens in both player creation modes;
- canonical Blocks/Items resolve correctly;
- a valid functional profile is selected;
- a generated settlement provides a real candidate need;
- a live site/parcel is evaluated;
- formal/social/economic permissions are consumed where relevant;
- Document 20 creates the ConstructionProject;
- stock is reserved/consumed through authoritative systems;
- Document 07 workers physically travel/work through Set 30;
- completion creates/updates a persistent StructureInstance;
- Document 20 activates the real service;
- Document 19 re-evaluates settlement growth;
- save/load and LOD preserve the result.

## 27.2 No Fixed Production Fixture

The proof must not require:

- Forest Hamlet;
- one cottage ID;
- one watchtower ID;
- a fixed goblin raid;
- fixed terrain;
- fixed road;
- fixed villagers.

Golden regression seeds may be used, but the system itself remains general.

# 28. Staged Implementation Plan

Implementation follows Document 18's production gates.

## 28.1 Settlement / Player Blueprint Implementation Sequence

### I0 — Repository Mapping
- inspect existing player-builder/Forge/planner code;
- map exact files;
- no speculative path creation.

### I1 — Restricted Player Blueprint Schema
- canonical Block refs;
- tokens;
- stages;
- permitted markers;
- versioning;
- personal library.

### I2 — Shared Player Editor
- placement;
- transform;
- layer/slice;
- undo;
- validation;
- cost preview;
- main-menu/in-world parity.

### I3 — Settlement Planning Graph
- centre;
- parcels;
- districts;
- expansion sectors;
- planned-route edges;
- project pools.

### I4 — Functional Validation
- Document-20 function adapter;
- site validation;
- movement/route queries;
- culture/law/permission adapters.

### I5 — Construction Intake
- proposal;
- Document-20 project creation;
- resource/labour/movement evidence;
- progress read models.

### I6 — Growth Readiness
- seven-needs integration;
- stage classification;
- planner candidates;
- redundancy/disruption scoring.

### I7 — Player-Founded Settlements
- town packs;
- planning policy;
- broader permissions;
- autonomous planner.

### I8 — Sharing / Multiplayer
- safe packages;
- server approval;
- collaborative planning;
- migration.

### I9 — Waterfront / Realm / Advanced Planning
- port/shipyard spaces;
- vessel design handoff;
- realm adaptation;
- megaproject orchestration.

## 28.2 Redesign Triggers

Redesign if:

- player editor and 22I source diverge into incompatible formats;
- planner must duplicate Document-20 function formulas;
- cost preview regularly disagrees with authoritative projects;
- road planning assumes accessibility without Set-30 evidence;
- distant planning creates buildings/resources;
- player packages can mutate canonical registries;
- player-founded settlement authority bypasses social/political systems;
- district logic becomes one rigid city-layout generator.

# 29. Player Blueprint and Settlement Planning Registry Families

Document 19 does not maintain the canonical official building catalogue.

Its registries are planning/player-product registries.

| Registry Family | Meaning |
|---|---|
| Player Blueprint Definition | Restricted reusable player design. |
| Player Blueprint Version | Immutable submitted revision. |
| Player Style Kit | Player-authored material/style choices. |
| Player Town Pack | Player blueprint/style/project-pool composition. |
| Settlement Plan Definition | Reusable planning rule set. |
| Settlement Plan Instance | One world's active plan. |
| Parcel Plan | Planned buildable plot and constraints. |
| District Plan | District boundary/role/pools/targets. |
| Expansion Sector | Reserved future-growth area. |
| Planned Route Edge | Intended connectivity, not movement truth. |
| Project Pool | Eligible function/source candidates. |
| Project Candidate | Planner-scored potential action. |
| Settlement Project Proposal | Request for authority/Document-20 construction intake. |
| Growth Readiness Profile | Rules for stage classification from owned evidence. |
| Planning Policy | Automatic/advisory/approval/vote/emergency behaviour. |
| Player Package Manifest | Script-free sharing/dependency metadata. |
| Planning Reason Code | Explainable validation/planner result. |

## 29.1 Official Building Catalogue Boundary

The old v0.1 list of cottages, wells, watchtowers, warehouses, districts and megaprojects is preserved as **historical planning intake**, not the canonical production building registry.

Production identities come from:

- Document 20H universal catalogue;
- approved 22I Blueprint Forge source;
- approved 20G cultural/biome/realm packs;
- player products under Document-19 restricted namespaces.

Generic concepts such as cottage, watchtower, warehouse, road, bridge, market and portal complex remain valid capabilities; their old POC planning IDs do not automatically become production canonical IDs.

# 30. Sample Player Blueprint and Planning Entries

These examples demonstrate the Document-19 restricted layer. They are **not** declarations of official canonical Blueprint Forge IDs.

## 30.1 Player Small Cottage

| Field | Example |
|---|---|
| Player Blueprint ID | `leyforge.player.local.blueprint.cottage.small_a` |
| Intended Function | Candidate Housing function from Document 20A. |
| Bounds | Example 7 × 5 × 6 m plus entry/service clearance. |
| Material Roles | `foundation_primary`, `wall_primary`, `beam_structural`, `roof_primary`, `opening_door`. |
| Markers | Entrance, two bed candidates, household/storage candidates, hearth-safe zone, road/path socket. |
| Stages | Site → foundation → frame → shell → weatherproof → function → finish. |
| Validation | Function, access, shelter, bed clearance, movement, terrain, dependencies. |
| Runtime | Submitted to Document 20 as a candidate ConstructionProject; completed structure is Document-12-owned. |

## 30.2 Player Watchtower

| Field | Example |
|---|---|
| Player Blueprint ID | `leyforge.player.local.blueprint.watchtower.wood_a` |
| Intended Function | Candidate Safety/defence service. |
| Required Semantics | Safe access, guard position, platform, railing/cover where required, sight/alarm links. |
| Movement | Set 30 validates stairs/ladders/access. |
| Combat | Document 16 consumes valid guard/firing positions. |
| Service | Document 20 decides whether defence/warning capability activates. |
| Event Effect | Document 15 may consume service/combat evidence during a threat event. |

## 30.3 Small Market Cluster

| Field | Example |
|---|---|
| Type | Cluster / public-space planning product |
| Intended Functions | Work / Infrastructure / Morale candidates depending on Document-20 definitions. |
| Components | Stalls, storage, public circulation, loading edge, civic/social space. |
| Economy | Set 27 owns actual market/merchant/prices. |
| Social | Set 28 owns interaction/negotiation. |
| Route | Set 30 owns access. |

## 30.4 Player Custom Town Pack

| Field | Example |
|---|---|
| Contents | Settlement plan, style kit, player blueprint families, district preferences and project-pool weights. |
| Growth Coverage | Declares which stage/capability contexts it can support; missing contexts fall back only through valid approved packs. |
| Style | Palette roles, roofs, roads, trims, banners, density and landmarks. |
| Public Use | Requires world/server approval and functional validation. |
| Existing Town | May be proposed as blended/limited style according to law/social approval. |
| Player-Founded | Can be selected as a primary planning style where authority allows. |

# 31. Sample Settlement Stage Definitions

## 31.1 Camp to Hamlet Gate

| **Gate**           | **Requirement**                                                                               |
|--------------------|-----------------------------------------------------------------------------------------------|
| **Population**     | A persistent resident/household base sufficient for permanent settlement under the active world profile; no universal hard-coded population count is required.                                   |
| **Housing**        | Permanent weatherproof beds for current residents plus a small reserve.                       |
| **Food**           | Stable local or traded food flow and minimum reserve days.                                    |
| **Water**          | Valid water access or well service.                                                           |
| **Storage**        | Shared construction/food storage with project reservation.                                    |
| **Jobs**           | Food production plus one resource/production role and one builder-capable worker.             |
| **Safety**         | Basic lighting, safe sleep, threat response, no critical damage.                              |
| **Infrastructure** | Settlement centre and basic path/road between core sites.                                     |
| **Projects**       | Permanent housing, food site, shared storage, and water access.                               |
| **Player Role**    | Not mandatory; deliveries, custom cottage, automation, defence, or trade accelerate the gate. |

## 31.2 Village to Fortified Village Gate

| **Gate**                   | **Requirement**                                                                |
|----------------------------|--------------------------------------------------------------------------------|
| **Population and Housing** | Stable population without severe overcrowding and with guard/builder capacity. |
| **Threat**                 | Sustained raids, strategic border need, player choice, or faction requirement. |
| **Defence Projects**       | Perimeter, gates, towers/posts, patrol, armory/supply, refuge/evacuation.      |
| **Supply**                 | Food reserve, repair materials, guard equipment, fuel/mana if used.            |
| **Specialists**            | Guard leadership and builders; mage if magical defence is selected.            |
| **Road and Access**        | Defensible entries without blocking trade, farms, water, or escape.            |
| **Maintenance**            | Capacity to repair walls/towers and replace defence supplies.                  |

## 31.3 City to Capital Gate

| **Gate**               | **Requirement**                                                                                  |
|------------------------|--------------------------------------------------------------------------------------------------|
| **Governance**         | Recognised authority, laws, administration, succession or leadership stability.                  |
| **Regional Influence** | Trade routes, allied/subject settlements, diplomacy, military or cultural recognition.           |
| **Districts**          | Multiple functioning districts with services, logistics, utilities, housing, safety, governance. |
| **Signature Projects** | Capital hall/palace/council, archive, major culture site, defence command, monument.             |
| **Economy**            | Regional surplus, strategic resources, resilient logistics, skilled specialists.                 |
| **Story and Faction**  | Required culture/faction arc or sandbox political conditions.                                    |
| **Player Paths**       | Peaceful leadership, alliance, restoration, election, conquest, or alternative outcomes.         |## 31.4 Gate Ownership

These sample gates are planning examples.

The actual evidence is owned by:

- population/households — Document 07;
- seven needs/services — Document 20;
- economy/trade — Set 27;
- government/diplomacy — Document 13;
- social cohesion/willingness — Set 28;
- biological health/shelter pressure — Set 29;
- physical routes — Set 30/26;
- project completion — Document 20.

Document 19 classifies readiness after consuming those results.

# 32. Archived Validation Scenario — Player Cottage and Watchtower Loop

The former Forest Hamlet scenario remains a useful regression fixture.

It is not a production generation requirement.

## 32.1 Archived Flow

1. Open the Player Blueprint Workshop.
2. Create a small cottage from canonical Blocks/tokens.
3. Add an entrance, bed candidates, household/storage markers and a road socket.
4. Run validation.
5. Save a personal blueprint revision.
6. Load an Archived Validation world containing the old Forest Hamlet context.
7. Submit the design through the in-world planner.
8. Resolve site, palette, permissions and authoritative project costs.
9. Reserve/consume real stock through owner systems.
10. Have persistent workers travel and construct through Document 07 / Set 30 / Document 20.
11. Activate Housing only after Document-20 functional validation.
12. Build/repair the generic watchtower fixture and allow it to affect the generic defence/threat systems.
13. Save, unload, reload and reconcile.
14. Verify no stock, project state, structure state or growth evidence duplicated.

## 32.2 What Is Archived

Archive as mandatory production content:

- Forest Hamlet;
- fixed named residents;
- fixed watchtower site;
- fixed goblin raid;
- fixed Day timing;
- fixed cottage;
- fixed resource locations;
- fixed first growth path.

## 32.3 What Survives

Preserve:

- two player blueprint modes;
- proposal/permission;
- cost preview;
- real reservations;
- NPC construction;
- staged activation;
- Housing effect;
- defence structure effect;
- settlement growth re-evaluation;
- save/LOD;
- player-created content validation.

# 33. Balancing and Player-Freedom Rules

| **Rule**                            | **Meaning**                                                                                                       |
|-------------------------------------|-------------------------------------------------------------------------------------------------------------------|
| **Creative Drafting Is Free**       | Designing and saving blueprints costs no resources; survival construction does.                                   |
| **Large Costs Need Scaling Paths**  | Village, district, and megaproject costs require automation, NPC production, trade, contracts, or batch crafting. |
| **Old Materials Remain Useful**     | Wood, stone, clay, glass, fibre, copper, iron, and culture materials remain important.                            |
| **Function Before Decoration**      | Core services can activate before optional prestige finish.                                                       |
| **No Instant City Paste**           | Normal survival requires land, stages, resources, labour, permissions, utilities, and growth gates.               |
| **Player Freedom With Consequence** | Foreign, ugly, inefficient, exploitative, or militarised designs are possible, but people and factions react.     |
| **No Mandatory Perfect Efficiency** | Charming irregular designs are valid if required function and safety pass.                                        |
| **Cultural Rules Are Contextual**   | Architecture preference creates identity and response, not a universal style ranking.                             |
| **Autonomy Is Configurable**        | Independent growth, approvals, private NPC building, style enforcement, and governance are world settings.        |
| **Readable Complexity**             | Early projects use simple stages; districts, utilities, politics, and dependencies appear gradually.              |
| **Performance and Simulation Are Separate**      | Player-content and planner budgets are transparent. Device Performance Profiles may change presentation/work scheduling, while Simulation Depth changes world granularity only through explicit world rules.                               |
| **Failure Leaves Evidence**         | Cancelled, damaged, abandoned, or ruined projects leave salvage, history, needs, and repair opportunities.        |## 33.1 No Stage Rush

A player may supply enough resources to accelerate construction, but cannot legitimately skip:

- authority;
- site feasibility;
- labour where required;
- physical access;
- functional activation;
- specialist requirements.

## 33.2 No Cosmetic Service Exploit

A tiny decorative structure cannot claim:

- hundreds of beds;
- infinite warehouse capacity;
- instant hospital service;
- market function

through marker spam.

Document 20 validates capacity and function.

# 34. Open Questions and Deferred Production Decisions

The following remain legitimate production questions rather than unowned assumptions:

- final player blueprint package extension and binary/human-readable split;
- player blueprint maximum dimensions/cell counts by hardware/server policy;
- how much undiscovered content a design-all mode may expose;
- scanning/copy restrictions for protected structures and other players;
- final collaborative edit/merge UX;
- final procedural road authoring approach for player town plans;
- whether selected room modules may stretch parametrically;
- online sharing/moderation/creator discovery service;
- creator licensing/credit policy;
- maximum active district/planner counts at each Simulation Depth;
- migration policy for removed third-party player dependencies;
- precise promotion path from player blueprint to official Blueprint Forge content;
- final world-setting controls for autonomous settlement planning;
- how hybrid cultural building styles are negotiated socially over long periods;
- final player-founded settlement charter/land-claim UX.

These questions do not reopen established ownership boundaries.

---

# 35. Validation and Reason Codes

Document 19 uses explainable validation rather than opaque pass/fail states.

| Code | Meaning |
|---|---|
| `PLN-BP-001` | Player blueprint definition invalid. |
| `PLN-BP-002` | Player blueprint exceeds allowed schema/authority. |
| `PLN-BLOCK-001` | Blueprint references missing/invalid canonical Block. |
| `PLN-BLOCKITEM-001` | Duplicate fake Item used for recoverable Block. |
| `PLN-DEP-001` | Required dependency unresolved. |
| `PLN-FUNC-001` | Document-20 function validation failed. |
| `PLN-SITE-001` | Site/parcel unsuitable. |
| `PLN-ROUTE-001` | Required physical movement access unavailable/unknown. |
| `PLN-LAND-001` | Land/claim/legal authority unavailable. |
| `PLN-SOC-001` | Required social consent/assignment unavailable. |
| `PLN-ECON-001` | Required contract/funding/procurement unresolved. |
| `PLN-BIO-001` | Biological/shelter/health requirement incompatible. |
| `PLN-LAB-001` | Required labour/specialist unavailable. |
| `PLN-PROJ-001` | Document-20 project intake rejected. |
| `PLN-POOL-001` | Candidate not eligible for project pool. |
| `PLN-DIST-001` | District rule conflict. |
| `PLN-GROW-001` | Growth stage blocked by current evidence. |
| `PLN-LOD-001` | Planning LOD reconciliation mismatch. |
| `PLN-PACK-001` | Player package invalid/quarantined. |
| `PLN-MIG-001` | Blueprint/planning migration unresolved. |
| `PLN-AUTH-001` | Player/host lacks planning authority. |
| `PLN-POC-001` | Retired POC dependency detected in production. |

---

# 36. Required Test Laboratories

## 36.1 Player Editor Parity Test

Create one design in the main-menu Player Blueprint Workshop.

Open the same revision in-world.

Verify:

- cells;
- tokens;
- stages;
- markers;
- dependencies;
- version;
- validation state.

## 36.2 Canonical Block Test

Use a recoverable placeable Block.

Verify:

- blueprint references Block ID;
- project requests Block through inventory projection;
- no duplicate Item ID appears.

## 36.3 Functional House Test

Create a house-shaped shell without valid beds/access.

Verify Document 20 refuses Housing activation.

Then repair semantics/access and verify activation.

## 36.4 Generated Settlement Proposal Test

Use a seed-generated settlement.

Submit a player design.

Verify:

- need;
- culture;
- land;
- social;
- economics;
- site;
- function;
- route

are resolved through their owners.

## 36.5 NPC Construction Test

Verify:

- real workers;
- real resources;
- Set-30 movement;
- Document-20 stages;
- persistent StructureInstance.

## 36.6 Distant Construction Test

Leave region during construction.

Advance time.

Return.

Verify no:

- duplicate blocks;
- duplicate stock;
- skipped permission;
- lost project history.

## 36.7 Growth Stage Test

Create two settlements with similar population but different services.

Verify only the one with sufficient capability evidence reaches the higher stage.

## 36.8 District Test

Create:

- residential;
- artisan;
- waterfront

districts.

Verify planner preferences alter project pools without fabricating function.

## 36.9 Road Test

Draw planned road.

Verify it is not treated as physically accessible before construction/Set-30 validation.

## 36.10 Waterfront Test

Reserve a shipyard parcel.

Verify 26J/20 service requirement and 26H/26I handoffs remain separate.

## 36.11 Player-Founded Settlement Test

Give founder broad planning control.

Verify NPC social/political/economic/biological truth remains externally owned.

## 36.12 Package Removal Test

Remove a player blueprint dependency.

Verify affected world content is preserved/quarantined with migration reason rather than deleted.

## 36.13 Multiplayer Test

Two players edit/propose overlapping parcels.

Verify authority, stale revision and conflict handling.

## 36.14 POC Leakage Test

Production profiles must not require:

- Forest Hamlet;
- fixed watchtower;
- fixed raid;
- old `archive.poc.settlement.forest_hamlet` ID.

---

# 37. Supersession and Preservation Notes

Version 1.0 preserves the major design intent of v0.1 while changing authority and production status.

## 37.1 Preserved

- two player blueprint creation modes;
- shared player editor core;
- voxel blueprint composition;
- nested modules;
- semantic material tokens;
- style kits;
- stage authoring;
- exact cost preview;
- terrain adaptation;
- roads/parcels/districts;
- settlement plan as rule set;
- Camp → Magical Metropolis growth language;
- autonomous planner;
- project pools;
- NPC-visible construction;
- player proposals;
- player-founded settlements;
- sharing/packages;
- damage/repair/upgrades;
- LOD/persistence;
- creative freedom.

## 37.2 Reconciled

- official blueprint authority moved/confirmed under 22I Blueprint Forge;
- vessel blueprint authority confirmed under 26I;
- building function/ConstructionProject authority confirmed under Document 20;
- structure instance authority confirmed under Document 12;
- labour identity/tasks under Document 07;
- economy under Set 27;
- social consent/assignments under Set 28;
- biology under Set 29;
- movement/access under Set 30/26;
- canonical Block/Item identity applied;
- Godot technical implementation delegated to Document 18.

## 37.3 Archived

- Forest Hamlet production dependency;
- fixed player cottage production requirement;
- fixed watchtower growth requirement;
- fixed goblin raid relation;
- Archived Validation/Alpha/Beta/Later Production status column as gameplay authority;
- old POC blueprint IDs as automatic canonical production IDs;
- old direct Document-19 ownership of official developer construction-stage source.

---

# Appendix A — Player Blueprint Definition Template

```yaml
player_blueprint:
  blueprint_id: <qualified_player_id>
  schema_version: <version>
  owner_profile_ref: <player_or_local_scope>
  revision: <rev>

  geometry:
    bounds: <bounds>
    pivot: <coord>
    allowed_rotations: []
    mirror_rules: []
    cell_volume_ref: <id>

  authoring:
    token_bindings: {}
    stages: []
    permitted_marker_refs: []
    nested_player_blueprint_refs: []
    intended_function_refs: []
    terrain_profile_ref: <id>
    expansion_envelope_ref: <id>?

  dependencies:
    required_definition_refs: []
    optional_definition_refs: []
    pack_refs: []

  lifecycle:
    state: draft
    validation_report_ref: <id>?
    public_eligibility: private
    source_hash: <hash>
```

---

# Appendix B — Settlement Plan Instance Template

```yaml
settlement_plan_instance:
  plan_instance_id: settlement_plan:<ulid>
  settlement_ref: <id>
  definition_ref: <id>?
  centre_ref: <id>
  district_refs: []
  parcel_refs: []
  planned_route_refs: []
  expansion_sector_refs: []
  project_pool_refs: []
  planning_policy_ref: <id>
  active_player_style_refs: []
  current_growth_stage: <stage>
  growth_readiness_ref: <id>
  history_refs: []
  planning_revision: <rev>
```

---

# Appendix C — Parcel Template

```yaml
parcel_plan:
  parcel_id: parcel:<ulid>
  settlement_ref: <id>
  bounds_ref: <id>
  frontage_refs: []
  intended_use_tags: []
  owner_or_claim_ref: <doc13_ref>?
  permitted_function_refs: []
  height_or_volume_constraints: {}
  route_connection_targets: []
  utility_connection_targets: []
  expansion_envelope_ref: <id>?
  current_project_ref: <doc20_project_ref>?
  current_structure_refs: []
  protected_state: false
  revision: <rev>
```

---

# Appendix D — Settlement Project Proposal

```yaml
settlement_project_proposal:
  proposal_id: planning_proposal:<ulid>
  settlement_ref: <id>
  proposer_ref: <player|npc|institution|planner>
  target_function_ref: <doc20_function>
  candidate_blueprint_ref: <official_or_player_blueprint>
  parcel_ref: <id>
  reason_tags: []
  priority_band: <band>
  expected_capacity_snapshot_ref: <id>
  site_validation_ref: <id>
  required_approval_refs: []
  economic_request_refs: []
  social_request_refs: []
  movement_requirement_refs: []
  status: proposed
  planning_revision: <rev>
```

---

# Appendix E — Planned Route Edge

```yaml
planned_route_edge:
  planned_route_id: planned_route:<ulid>
  settlement_ref: <id>
  origin_anchor_ref: <id>
  destination_anchor_ref: <id>
  intended_mode_tags: []
  desired_clearance_class: <class>
  desired_surface_or_structure_ref: <id>?
  protected_corridor_ref: <id>
  physical_structure_ref: <id>?
  movement_route_ref: <set30_ref>?
  status: planned
  revision: <rev>
```

---

# Appendix F — Cross-System Responsibility Matrix

| Question | Owner |
|---|---|
| Can the player design this restricted personal blueprint? | Document 19 |
| What is the official developer blueprint source? | 22I / 26I specialist |
| What function should this building provide? | Document 20 |
| Is the building currently functional? | Document 20 |
| What project is physically being built? | Document 20 |
| What structure exists in the world? | Document 12 |
| Which Blocks/Items are required? | Documents 03–05 |
| Are materials actually available? | Inventory/Resource owners |
| Who can work on it? | Document 07 |
| Can the worker reach it? | Set 30 / 26 |
| What are the wages/contracts? | Set 27 |
| Does the resident agree? | Set 28 |
| Is the building adequate shelter biologically? | Set 29 consuming Document-20/structure facts |
| Who owns the land / has authority? | Document 13 |
| Which district/parcel/project pool should use it? | Document 19 |
| What growth stage is the settlement classified as? | Document 19 consuming owner evidence |
| What vessel blueprint is this? | 26I |
| Can the shipyard build it? | 26H/26J + Document 20 |
| How is this shown to the player? | Document 17 |
| How is it implemented/saved/LOD'd? | Document 18 |

---

# Appendix G — Archived POC Preservation Matrix

| Old Element | Production Treatment |
|---|---|
| Player cottage | Preserve generic player housing blueprint capability |
| Wooden watchtower | Preserve generic defence blueprint capability |
| Forest Hamlet | Archive scenario identity |
| Fixed warehouse | Preserve generic storage/project supply capability |
| Fixed dirt road | Preserve road/infrastructure planning capability |
| Fixed goblin raid | Archive wrapper; preserve generic threat/event |
| Housing increase | Preserve Document-20 Housing activation |
| Watchtower defence effect | Preserve generic Safety/defence service |
| Main-menu blueprint creator | Preserve |
| In-world blueprint creator | Preserve |
| NPC builder | Preserve through Document 07/20/30 |
| POC stage costs | Archive balance values; preserve exact-cost architecture |
| `Archived Validation` status | Replace with Set-25 lifecycle/scope governance |

---

# Appendix H — Production Acceptance Criteria

Document 19 v1.0 is accepted when:

- [x] two player blueprint creation modes remain first-class;
- [x] player and developer blueprint authority are separated;
- [x] 22I remains official Blueprint Forge authority;
- [x] 26I remains Vessel Forge authority;
- [x] Document 20 owns universal function and ConstructionProject truth;
- [x] Document 12 owns StructureInstance truth;
- [x] Document 19 owns settlement planning/growth orchestration;
- [x] canonical Block/Item rule is enforced;
- [x] player blueprints cannot create new gameplay services through arbitrary markers;
- [x] player-created drafts may remain invalid privately;
- [x] public/NPC project-pool admission requires validation;
- [x] settlement plans use roads/parcels/districts/expansion rather than rigid town paste;
- [x] Camp → Magical Metropolis remains capability language rather than fixed numeric level;
- [x] seven-needs integration is explicit;
- [x] planner consumes external economy/social/biology/movement evidence;
- [x] NPC construction remains physical/resource-conserving;
- [x] distant construction does not fabricate completion;
- [x] existing-town proposals respect politics/social/economic permission;
- [x] player-founded settlements retain autonomous persistent people;
- [x] waterfront/port/shipyard planning is integrated without duplicating maritime ownership;
- [x] packages are script-free by default and Set-25-governed;
- [x] LOD preserves plan/project/structure history;
- [x] multiplayer planning is authoritative and revision-safe;
- [x] Forest Hamlet POC wrapper is archive-only;
- [x] Godot + Summer Engine implementation consumes Document 18.

---

# Completion Statement

**Document 19 v1.0 reconciles Leyforge's settlement-growth and player-blueprint vision with the production building, Forge, maritime, economy, social, biological, movement and technical ownership contracts.**

The creative promise remains:

**Players can design buildings and town identities.**

The civilisation promise remains:

**Settlements can grow without waiting for the player.**

But the architecture is now clean:

**Document 19 plans.**  
**22I/26I authors official specialist source.**  
**Document 20 defines function and executes construction projects.**  
**Document 12 persists the placed structure.**  
**Document 07 supplies the people.**  
**Document 13 supplies political authority.**  
**Set 27 supplies economic truth.**  
**Set 28 supplies social consent.**  
**Set 29 supplies biological consequence.**  
**Set 30/26 supplies physical access and movement.**

A settlement can want a hospital without Document 19 inventing medicine.

A player can design a house without a bed marker becoming magical Housing capacity.

A road can exist on a plan without an NPC being able to walk through a cliff.

A founder can choose a town style without owning every resident's loyalty.

And a player-created building can become part of a living civilisation without becoming a second, incompatible building language.

**Next Foundation reconciliation dependency: Document 20 — Buildings, Facilities, Construction and Settlement Project System v1.0.**
