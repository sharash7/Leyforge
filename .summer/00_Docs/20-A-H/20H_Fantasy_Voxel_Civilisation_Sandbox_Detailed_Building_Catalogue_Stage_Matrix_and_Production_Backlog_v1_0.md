# LEYFORGE

## 20H — Detailed Building Catalogue, Stage Matrix and Production Backlog

### Final Set-20 Catalogue Authority, Lifecycle Reconciliation, Stage/Need Matrix and Production Handoff

**Version 1.0 — Final Reconciled Production Draft**  
**Date:** 8 August 2026  
**Production Status:** Active / Set 20 Reconciliation Complete  
**Supersedes:** `20H_Fantasy_Voxel_Civilisation_Sandbox_Detailed_Building_Catalogue_Stage_Matrix_and_Production_Backlog_v0_2`  
**Governing Master:** Document 20 v1.0  
**Detailed Function Owners:** Documents 20A–20F v1.0  
**Composition Packs:** Document 20G v1.0  
**Settlement Planning / Growth:** Document 19 v1.0  
**Official Blueprint Source:** Document 22I Blueprint Forge  
**Production Registry / Lifecycle / Migration Governance:** Set 25  
**Canonical Blocks / Items / Recipes / Resources:** Documents 03–06 v1.0  
**Persistent Structures:** Document 12 v1.0  
**Godot + Summer Engine Technical Authority:** Document 18 v1.0  
**Cross-System Owners:** Sets 26–30 and their reconciled interfaces  
**Project Lead and Final Authority:** Ash

20H is the **closing authority for Document Set 20's universal catalogue, stage availability, seven-needs coverage, lifecycle classification and production backlog**.

It does not redefine the detailed gameplay rules in 20A–20G. It indexes and governs them.

> **Final Catalogue Rule**
>
> **The universal catalogue remains capped at 120 numbered definitions in v1.0. Existing numbers are stable identities. No entry is deleted merely because its original delivery milestone was POC, Extended Slice, Alpha or Beta.**

> **POC Retirement Rule**
>
> **Technical POC, Raid Extension, Extended Forest Hamlet, Extended Slice, Alpha and Beta are no longer active production lifecycle classes. They survive only as legacy provenance and regression-test groupings. Production lifecycle is governed by Set 25 and current game prerequisites.**

> **No Gameplay Deletion Rule**
>
> **Retiring the POC must never delete a generic game function that remains valid. Watchtowers, guard posts, roads, wells, warehouses, farms, workshops, walls, gates and other former POC content remain normal game content where their universal definitions survive. Only fixed scenario dependencies are archived.**

> **Block / Item Deduplication Rule**
>
> **The final catalogue must not reintroduce duplicate Item identities for recoverable Blocks. Construction, storage and project logistics use canonical Blocks and generated Block Inventory Projections under FR-00-20-006.**

> **Ownership Rule**
>
> **20H catalogues functions; it does not steal their gameplay truth. Later owner systems remain authoritative for economy, social state, biology, movement, maritime systems, politics, dimensions, combat, events, automation, magic and all other specialist domains.**

---

# Revision 1.0 Summary

This final reconciliation:

- preserves the **120-entry universal catalogue cap and stable numbering** from v0.2;
- preserves the detailed category tables, stage matrix, needs matrix, upgrade families and Forge coverage fields;
- converts old milestone/delivery scope into **legacy provenance** rather than active production status;
- removes the old Forest-Hamlet roster as a production requirement while preserving it as an Archived Validation regression fixture;
- protects generic functions formerly used by the POC from accidental deletion;
- aligns all catalogue entries with Documents 20A–20G v1.0;
- aligns lifecycle/publication/migration with Set 25;
- aligns maritime specialist content with Set 26;
- aligns economy/public finance with Set 27;
- aligns social/knowledge/dialogue with Set 28;
- aligns biology/survival/Health/Fatigue with Set 29;
- aligns movement/path/travel with Set 30;
- enforces canonical Block/Item separation;
- makes Blueprint Forge coverage a source-production concern rather than a gameplay lifecycle;
- leaves balancing values tunable without renumbering catalogue identity.

---

# 0. Final Set-20 Reconciliation Contract

## 0.1 Authority Stack

```text
20H
    catalogue number / stable catalogue identity
    stage / need / lifecycle / production index
        ↓
20A–20F
    detailed universal function contracts
        ↓
20G
    culture / faction / biome / realm composition
        ↓
22I / Set 22
    editable Blueprint Forge source
        ↓
Document 19
    settlement planner / proposal
        ↓
Document 20
    ConstructionProject / commissioning / function activation
        ↓
Document 12
    persistent physical StructureInstance
        ↓
specialist owner systems
    actual economy / social / biology / movement / magic / automation / politics / etc.
```

## 0.2 Stable Identity

Catalogue numbers 1–120 are **identity**, not delivery order.

A definition may change:

- lifecycle classification;
- source blueprint;
- prerequisite;
- tuning;
- culture pack coverage;
- stage availability;
- production readiness

without changing its catalogue number.

Renumbering requires an explicit Set-25 migration.

## 0.3 Production Lifecycle

The active lifecycle vocabulary comes from Set 25.

Old labels such as:

- Technical POC;
- Raid Extension;
- Extended Forest Hamlet;
- Extended Slice;
- Alpha;
- Beta;
- Final Game

must be interpreted only as **legacy scope provenance** in retained v0.2 tables.

They do not decide whether a definition exists in the production game.

## 0.4 Archived Validation

The former Forest Hamlet stack remains useful for regression testing because it exercises:

- construction;
- storage;
- roads;
- water;
- food;
- housing;
- crafting;
- governance;
- defence;
- raids;
- damage;
- repair;
- save/load;
- LOD.

It is not a required world, faction, settlement, raid or progression path.

## 0.5 Cross-System Ownership

20H indexes; owners execute.

| Domain | Owner |
|---|---|
| Player progression | Document 02 |
| Blocks / Items / Recipes / Resources | Documents 03–06 |
| NPCs / workers / households | Document 07 |
| Automation | Document 08 |
| Magic | Document 09 |
| World / biome / environment | Documents 10–11 |
| Structures | Document 12 |
| Government / law / factions / territory | Document 13 |
| Dimensions / realms | Document 14 |
| Quests / events | Document 15 |
| Combat | Document 16 |
| Settlement planning | Document 19 |
| ConstructionProjects / function activation | Document 20 |
| Maritime | Set 26 |
| Economy / markets / contracts / public finance | Set 27 |
| Dialogue / social / knowledge / companions | Set 28 |
| Survival / Health / biology | Set 29 |
| Movement / travel | Set 30 |
| Lifecycle / registries / migration | Set 25 |

## 0.6 Final Block/Item Integrity Lock

A recoverable placed Block is not duplicated as a standalone Item merely to make inventory/crafting/construction work.

Use:

```text
BlockDefinition
→ Block Inventory Projection
→ inventory / reservation / hauling / construction
→ placed Block
```

Distinct Items remain valid where the object is genuinely not the same placed Block identity.

---

# Retained v0.2 Catalogue and Matrix Baseline

The complete v0.2 20H specification follows because it contains the authoritative numbered catalogue, matrices, upgrade families, Forge coverage fields and production backlog detail that this reconciliation must preserve.

Where retained wording uses an old milestone as if it were active production scope, the v1.0 contract above supersedes that interpretation.

# Fantasy Voxel Civilisation Sandbox

## 20H - Detailed Building Catalogue, Settlement Stage Matrix and Production Backlog

### Numbered Universal Catalogue, Forge Production Register and Scope-Control Authority

**Version 0.2 - Blueprint Forge-Aligned Catalogue and Production Governance Draft**

*A controlled master register of 120 universal building, project and plan definitions, mapped from Camp to Magical Metropolis and connected to the seven-needs settlement model, Blueprint Forge source assets, construction projects, Godot/Summer Engine runtime records and staged content production.*

| **Document Role** | **Locked Direction** |
|---|---|
| **Catalogue Authority** | 20H is the authoritative numbered register for universal definition identity, stable IDs, companion ownership, earliest stage, planner class, delivery scope and production status. |
| **Universal Catalogue Cap** | Version 0.2 preserves exactly 120 universal functional definitions. Culture palettes, ordinary size variants, inheritance children, damage states, construction stages and decorative alternatives do not create new universal entries. |
| **Main Needs** | Housing, Provisions, Health, Work, Safety, Infrastructure and Morale remain the only top-level settlement needs. |
| **Protected Forest Hamlet Roster** | The original 30-entry roster remains locked, but delivery is split into 12 Core Infrastructure definitions, 4 Raid Extension definitions and 14 Extended Forest Hamlet definitions. |
| **Forge Direction** | Each definition may be satisfied by multiple Blueprint Forge source assets. Source assets pass semantic, stage, state, placement and performance validation before runtime baking. |
| **Data Direction** | Stable definitions, source blueprints, packs, projects and structure instances remain separate versioned records that can round-trip through Godot Resources, JSON/CSV and future production tooling. |
| **Change-Control Direction** | Stable IDs are never casually renamed or reused. Catalogue expansion beyond 120 requires an explicit function-distinction review and replacement/expansion decision. |

> **Locked Catalogue Rule**
>
> A new universal entry is justified only when it creates a distinct function, capacity, planner behaviour, progression gate, network role, risk model or settlement consequence that cannot safely be represented by an existing definition, profile, module, inheritance child, upgrade delta or pack variation.

## Revision 0.2 Summary

Version 0.2 preserves the complete 120-definition catalogue and all approved companion ownership while aligning the production register with Documents 20, 20A-20H and the Unified Forge.

Key changes are:

- Split the protected 30-entry roster into **Technical POC** and **Extended Slice** delivery scopes.
- Correct the Builder Supply Yard canonical ID to `building.construction.builder_supply_yard` while retaining the former ID as a migration alias.
- Standardise official source IDs under `blueprint.*` and cultural/environmental composition under `pack.*`.
- Separate definition, Blueprint Forge source, approved package, construction project and persistent structure instance statuses.
- Expand production tracking to cover semantic passes, construction staging, state variants, runtime baking, gameplay integration and automated validation.
- Replace the obsolete assumption that the player Blueprint Workshop owns official developer source authoring.
- Add explicit Godot/Summer Engine, dependency, migration, test and CI backlog fields.

# Document Purpose

Document 20H is the stable bridge between design-bible prose and production data. It tells designers, Summer Engine agents, Blueprint Forge tools, Godot runtime systems and content producers exactly which universal capabilities exist, who owns their detailed rules, when they enter progression, which milestone they belong to and how far each definition has moved through production.

20H does not define the complete mechanics of every building and does not contain the voxel source itself. Documents 20A-20F own functional-family rules, 20G owns layered cultural and environmental composition, Blueprint Forge owns official editable voxel source, and runtime structure instances own placed-world state. 20H coordinates those layers without collapsing them into one record.

# Design Sources and Dependencies

| **Source** | **20H Dependency** |
|---|---|
| **07 - NPC Village System** | Named residents, jobs, households, warehouses, autonomous projects, growth, near/far simulation and persistent consequences. |
| **12 - Structures** | Structure volumes, dynamic states, world placement, damage, repair, restoration and structure-instance identity. |
| **19 - Settlement Growth and Player Voxel Blueprint System** | Settlement planning, parcels, player proposals, player-founded settlements and restricted player-facing creation flows. |
| **20 v0.2 - Buildings, Facilities, Construction and Settlement Project System** | Shared record separation, namespaces, seven needs, semantic contracts, construction stages, runtime states, planner rules and POC split. |
| **20A-20F** | Detailed universal building, service, production, infrastructure and civilisation-project family rules. |
| **20G** | Culture, faction, biome, realm, government, faith, history and player-style pack composition. |
| **21A-21G** | Voxel Asset Forge source conventions, material systems, overrides, lifecycle, UI/UX and asset migration. |
| **22I - Blueprint Forge** | Official building, structure and world-blueprint authoring, semantic layers, nested modules, inheritance, stages, states and world placement. |
| **22J - Unified Forge UI/UX** | Shared dashboard, manifest, dependency graph, validation, test laboratory, revision comparison and packaging workflow. |
| **22K - Forge Technical Implementation Plan** | Godot Resources, registries, editor services, baking, caches, migrations, CI, deterministic validation and runtime assembly. |
| **22L - Visual Production and Migration Plan** | Blueprint migration, production priorities, state coverage, review gates and release packaging. |

# Static Table of Contents

- 1. Locked Catalogue Identity
- 2. Scope Control and Universal Catalogue Cap
- 3. Registry Units, Namespaces, Ownership and Source-of-Truth Rules
- 4. Production Status and Forge Lifecycle Model
- 5. Catalogue Summary and Counts
- 6. Temporary and Residential
- 7. Farming, Food and Livestock
- 8. Health, Welfare, Culture and Hospitality
- 9. Extraction and Raw Processing
- 10. Crafting and Artisan Production
- 11. Trade, Education and Professional Services
- 12. Governance, Justice and Administration
- 13. Safety, Defence and Emergency
- 14. Storage, Roads, Transport and Utilities
- 15. Magic, Ritual and Dimensional Systems
- 16. Automation, Power and Advanced Industry
- 17. Districts, Complexes, Megaprojects and Wonders
- 18. Settlement Stage Matrix
- 19. Seven-Needs Coverage Matrix
- 20. Upgrade Families and Branching Rules
- 21. Required, Optional and Conditional Project Pools
- 22. Revised Forest Hamlet Production Roster
- 23. Production Waves and Milestones
- 24. Blueprint Forge Coverage and Asset Targets
- 25. Data, Validation and Implementation Backlog
- 26. Change Control and Catalogue Governance
- 27. Suite Revision Relationship and Next Document
- Appendix A. Catalogue and Production Field Template
- Appendix B. Stage, Need and Scope Counts
- Appendix C. Canonical Namespace and Migration Alias Register
- Appendix D. Consolidated and Deferred Ideas
- Appendix E. Deferred Content Review Triggers
- Appendix F. Protected Forest Hamlet Scope Register

# 1. Locked Catalogue Identity

20H is the living master index of universal settlement content. It assigns human catalogue numbers, stable machine-facing IDs, companion ownership, earliest stage, primary and secondary need contributions, planner classes, delivery scope and production state. It does not replace the detailed entry documents, Forge source packages or persistent placed-world records.

> **Identity Test**
>
> Every catalogue row must answer: what distinct capability does this definition provide, what need or system does it influence, when can it appear, how does the autonomous planner use it, which document owns its detailed rules, and why can it not be represented as a variant or module of an existing definition?

| **Identity Principle** | **Meaning** |
|---|---|
| Functional before visual | IDs describe settlement capability rather than culture, roof shape, material or decorative style. |
| Stable before convenient | Once implemented or referenced by content, a stable ID is migrated rather than casually renamed. |
| One function, many sources | Multiple official, culture-specific and player-authored blueprints may satisfy one definition. |
| Source is not instance | Blueprint source remains revisioned authoring data; placed structures store instance IDs and local state. |
| Catalogue is not a bonus list | A definition only contributes when its runtime activation contract passes. |
| Production is observable | Every definition exposes separate design, data, Forge, bake, gameplay, test, balance and pack-coverage states. |

# 2. Scope Control and Universal Catalogue Cap

- Version 0.2 contains exactly **120 universal definitions**.
- The protected Forest Hamlet roster contains 30 of those definitions; it is not an additional catalogue.
- Culture, faction, biome and realm architecture belongs to 20G and `pack.*` unless it introduces a genuinely distinct universal function.
- Small, medium and large forms remain one definition when they differ only by capacity, layout or footprint.
- Damage, ruin, corruption, occupation, construction, repair and restoration are state or delta assets, not new universal definitions.
- Player-created blueprints satisfy approved definitions after validation and do not expand the universal catalogue.
- Mixed-use blueprints may satisfy several compatible definitions, but each service retains its own identity and cannot be double-counted.
- Nested Blueprint Forge modules remain reusable source components unless they expose a separately planned universal service.
- Adding entry 121 requires a written merge check, companion ownership, stage placement, need contribution, planner behaviour and an explicit decision to expand or replace the cap.

> **Do Not Inflate the Catalogue**
>
> A new roof, material, culture, room layout, decorative machine, damage appearance, size tier or biome foundation does not justify a new universal definition. Use blueprint inheritance, modules, material roles, packs and runtime states first.

# 3. Registry Units, Namespaces, Ownership and Source-of-Truth Rules

## 3.1 Registry Units

| **Registry Unit** | **Purpose** | **Canonical Example** |
|---|---|---|
| Building definition | Functional occupied, service, production, storage, civic, magical or utility structure. | `building.crafting.village_blacksmith` |
| Project definition | Modular construction that may not be an occupied building. | `project.defence.palisade_segment` |
| Plan definition | Cluster, district, campus, complex, nexus or settlement arrangement. | `plan.district.residential` |
| Module definition | Reusable declared functional subassembly inside one or more source blueprints. | `module.storage.secure_armoury` |
| Blueprint Forge source | Editable voxel-first authoring asset satisfying one or more definition contracts. | `blueprint.leyforge.riverward.blacksmith_a` |
| Approved blueprint package | Validated, versioned and packageable source revision available to runtime selection. | `blueprint_package:<GUID>` |
| Pack definition | Culture, faction, biome, realm, government, faith or dynamic-state layer. | `pack.culture.riverward_frontier` |
| Construction project record | Saved active construction, repair, conversion, restoration or demolition task. | `construction_project:<ULID>` |
| Structure instance | Saved placed-world structure with ownership, condition, staffing and local deltas. | `structure_instance:<ULID>` |

## 3.2 Namespace Rules

- `building.*`, `project.*` and `plan.*` are universal functional identities owned by 20H.
- `module.*` is reserved for reusable declared functional subassemblies.
- `blueprint.<namespace>.<family>.<variant>` identifies editable and approved structure source.
- `pack.culture.*`, `pack.faction.*`, `pack.biome.*`, `pack.realm.*`, `pack.government.*`, `pack.faith.*` and `pack.state.*` identify composition layers.
- Runtime records use generated ULIDs/GUIDs and always reference stable definition and source IDs.
- Legacy `bp.*`, `culture_kit.*`, `style_kit.*`, `cluster.*` and mismatched building IDs remain migration inputs, not new canonical output.

## 3.3 Ownership and Precedence

| **Question** | **Authority** |
|---|---|
| What universal capability exists and what is its stable ID? | 20H. |
| What shared rules apply to all buildings and projects? | Document 20. |
| What detailed requirements make this family function? | Owning companion 20A-20F. |
| How does culture, faction, biome or realm alter presentation and preference? | 20G and the resolved pack stack. |
| What exact voxel source, semantic layers, stages and state deltas exist? | Approved Blueprint Forge source. |
| What resources and labour are currently committed? | Authoritative construction-project record. |
| What is placed, owned, damaged, staffed and operational now? | Authoritative structure-instance and voxel-world records. |

A Blueprint Forge source asset cannot silently invent a universal service. If a mixed-use source contains a second service, it must reference a second approved definition or module contract. A catalogue row likewise cannot claim that a specific source contains a door, bed or workstation unless the approved source validates it.

# 4. Production Status and Forge Lifecycle Model

## 4.1 Independent Status Tracks

| **Field** | **Allowed Values** | **Meaning** |
|---|---|---|
| Delivery scope | Technical POC, Extended Slice, Alpha, Beta, Final, Deferred | Earliest committed delivery milestone. |
| Design status | Idea, Draft, Reviewed, Approved, Locked | Human design maturity of the universal definition. |
| Definition-data status | None, Schema Ready, Authored, Validated, Imported | Machine-readable registry maturity. |
| Forge source status | None, Voxel Blockout, Semantic Pass, Material Roles Resolved, Construction Staged, State Variants Complete, Forge Validated | Editable official source maturity. |
| Runtime-bake status | None, Bake Pending, Baked, Cache Verified, Package Integrated | Derived Godot runtime-product maturity. |
| Gameplay status | Not Started, Runtime Stub, Functional, Integrated, Shippable | Settlement, NPC, construction and world-system maturity. |
| Test status | None, Validator Tests, Forge Lab Passed, Scenario Passed, Regression Locked | Automated and playable verification maturity. |
| Balance status | Uncosted, Draft Values, Playtested, Tuned | Resources, capacity, labour, maintenance and pacing maturity. |
| Pack coverage | Universal Only, Foundation Pack, Culture Ready, Signature Variants, Coverage Complete | Visual and planning coverage without duplicating the function ID. |
| Migration status | Not Applicable, Alias Required, Migration Authored, Migration Tested | Compatibility state for renamed or structurally changed content. |

## 4.2 Blueprint Source Lifecycle

```text
Definition Approved
    -> Source Reserved
    -> Voxel Blockout
    -> Semantic Pass
    -> Material Roles Resolved
    -> Construction Staged
    -> Operational State Deltas
    -> Damage/Repair Coverage
    -> Placement and Performance Validation
    -> Forge Validated
    -> Runtime Baked
    -> Gameplay Integrated
    -> Scenario Tested
    -> Shippable
```

A definition may have several source blueprints at different maturity levels. The catalogue stores definition-level coverage and links to per-source records rather than pretending one status describes every variant.

## 4.3 Production Gate Rules

- A definition cannot become **Functional** without validated definition data and at least one usable runtime product.
- A source cannot become **Forge Validated** without passing semantic, stage, placement, reference and performance checks.
- A package cannot become **Shippable** without save/load, migration, damage/repair and simulation-LOD verification where those systems apply.
- Pack coverage cannot become **Complete** merely because material colours exist; silhouettes, substitutions, markers, stages and required state variants must remain valid.
- Summer Engine or other AI-authored changes must produce reviewable diffs and cannot silently change stable IDs or catalogue scope.

# 5. Catalogue Summary and Counts

| **Measure** | **Count** |
|---|---:|
| Universal definitions | 120 |
| Technical POC | 16 |
| Extended Slice | 14 |
| Alpha | 35 |
| Beta | 49 |
| Final | 6 |
| Building definitions | 103 |
| Project definitions | 10 |
| Plan definitions | 7 |

> **Interpretation**
>
> The catalogue is a functional ceiling, not an asset ceiling. The final game may contain hundreds or thousands of source blueprints, modules, pack-resolved variants, construction stages, damage deltas and player-created alternatives while still using the same 120 universal definitions.


# 6. Temporary and Residential

Temporary structures establish the first settlement centre and transition into permanent housing. Residential visual styles, room arrangements and climate adaptations remain blueprint variations unless their function changes.

| **\#** | **Stable ID**                               | **Definition**            | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------------|---------------------------|---------------|----------------|------------------------|-------------|--------------|-----------|
| 1      | building.temporary.campfire_site            | Campfire Site             | Camp          | Morale         | Provisions, Safety     | Required    | Technical POC | 20A       |
| 2      | building.residential.small_tent             | Small Tent                | Camp          | Housing        | Safety                 | Required    | Technical POC | 20A       |
| 3      | building.construction.builder_supply_yard | Builder Supply Yard       | Camp          | Infrastructure | Work                   | Required    | Technical POC | 20D       |
| 4      | building.residential.worker_refugee_shelter | Worker or Refugee Shelter | Camp          | Housing        | Health, Morale         | Conditional | Alpha        | 20A       |
| 5      | building.residential.primitive_hut          | Primitive Hut             | Hamlet        | Housing        | Safety                 | Required    | Extended Slice | 20A       |
| 6      | building.residential.small_cottage          | Small Cottage             | Hamlet        | Housing        | Morale                 | Required    | Technical POC | 20A       |
| 7      | building.residential.farmhouse              | Farmhouse                 | Hamlet        | Housing        | Work, Provisions       | Optional    | Extended Slice | 20A       |
| 8      | building.residential.communal_longhouse     | Communal Longhouse        | Hamlet        | Housing        | Morale, Provisions     | Optional    | Alpha        | 20A       |
| 9      | building.residential.townhouse_shop_house   | Townhouse or Shop-House   | Town          | Housing        | Work, Infrastructure   | Optional    | Beta         | 20A       |
| 10     | building.residential.apartment_house        | Apartment House           | City          | Housing        | Infrastructure, Morale | Optional    | Beta         | 20A       |

| **\#** | **Definition**            | **Functional Distinction**                                                |
|--------|---------------------------|---------------------------------------------------------------------------|
| 1      | Campfire Site             | Temporary gathering, warmth, basic cooking and settlement-centre marker.  |
| 2      | Small Tent                | Temporary shelter for one small household or worker group.                |
| 3      | Builder Supply Yard       | Construction stock, scaffolding, tool access and project staging.         |
| 4      | Worker or Refugee Shelter | Rapid shared housing for labour surges, disasters, refugees or migration. |
| 5      | Primitive Hut             | First permanent low-cost household shelter.                               |
| 6      | Small Cottage             | Validated household home and primary player-blueprint test family.        |
| 7      | Farmhouse                 | Household residence with farming storage and job access.                  |
| 8      | Communal Longhouse        | High-efficiency shared housing suited to early growth or some cultures.   |
| 9      | Townhouse or Shop-House   | Dense street housing with compatible ground-floor work or trade use.      |
| 10     | Apartment House           | High-density urban housing requiring mature services and road access.     |

# 7. Farming, Food and Livestock

This category covers settlement-scale food production, processing, reserve stability and animal support without creating a separate need bar for every food type.

| **\#** | **Stable ID**                         | **Definition**             | **Min Stage** | **Primary** | **Secondary**              | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------|----------------------------|---------------|-------------|----------------------------|-------------|--------------|-----------|
| 11     | building.food.basic_farm_plot         | Basic Farm Plot            | Hamlet        | Provisions  | Work                       | Required    | Technical POC | 20A       |
| 12     | building.food.irrigated_terraced_farm | Irrigated or Terraced Farm | Village       | Provisions  | Infrastructure, Work       | Optional    | Alpha        | 20A       |
| 13     | building.food.barn                    | Barn                       | Hamlet        | Provisions  | Infrastructure, Work       | Optional    | Extended Slice | 20A       |
| 14     | building.food.granary                 | Granary                    | Village       | Provisions  | Infrastructure, Safety     | Required    | Extended Slice | 20A       |
| 15     | building.food.communal_kitchen        | Communal Kitchen           | Hamlet        | Provisions  | Morale, Health             | Required    | Technical POC | 20A       |
| 16     | building.food.grain_millhouse         | Grain Millhouse            | Village       | Provisions  | Work, Infrastructure       | Optional    | Alpha        | 20A       |
| 17     | building.food.bakery_food_workshop    | Bakery or Food Workshop    | Village       | Provisions  | Work, Morale               | Optional    | Alpha        | 20A       |
| 18     | building.food.preserving_house        | Preserving House           | Town          | Provisions  | Health, Work               | Optional    | Beta         | 20A       |
| 19     | building.livestock.stable_paddock     | Stable and Paddock         | Hamlet        | Work        | Provisions, Infrastructure | Optional    | Alpha        | 20A       |
| 20     | building.food.fishery_fishing_dock    | Fishery or Fishing Dock    | Hamlet        | Provisions  | Work, Infrastructure       | Conditional | Alpha        | 20A       |

| **\#** | **Definition**             | **Functional Distinction**                                                |
|--------|----------------------------|---------------------------------------------------------------------------|
| 11     | Basic Farm Plot            | Core crop production parcel with seasonal and soil rules.                 |
| 12     | Irrigated or Terraced Farm | Higher-yield farm form for water systems, slopes or dense land use.       |
| 13     | Barn                       | Animal feed, harvest storage, tools and farm support.                     |
| 14     | Granary                    | Protected staple-food reserve with spoilage and emergency-stock benefits. |
| 15     | Communal Kitchen           | Batch cooking, shared meals and early preservation support.               |
| 16     | Grain Millhouse            | Processes grain through wind, water, animal or mechanical power variants. |
| 17     | Bakery or Food Workshop    | Converts staples into durable and valuable prepared foods.                |
| 18     | Preserving House           | Smoking, salting, drying, fermenting and cold-storage preparation.        |
| 19     | Stable and Paddock         | Houses mounts, draft animals or livestock with feed and job markers.      |
| 20     | Fishery or Fishing Dock    | Water-dependent food job, boat access and local trade support.            |

# 8. Health, Welfare, Culture and Hospitality

Health and morale services are intentionally consolidated. Culture-specific worship, recreation and hospitality use universal functional slots with 20G style and belief rules.

| **\#** | **Stable ID**                                 | **Definition**                  | **Min Stage** | **Primary** | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|-----------------------------------------------|---------------------------------|---------------|-------------|------------------------|-------------|--------------|-----------|
| 21     | building.health.healer_hut                    | Healer Hut                      | Village       | Health      | Morale                 | Required    | Extended Slice | 20A       |
| 22     | building.health.clinic_infirmary              | Clinic or Infirmary             | Town          | Health      | Infrastructure, Safety | Optional    | Beta         | 20A       |
| 23     | building.health.hospital_complex              | Hospital Complex                | City          | Health      | Infrastructure, Work   | Optional    | Beta         | 20F       |
| 24     | building.welfare.quarantine_emergency_shelter | Quarantine or Emergency Shelter | Village       | Health      | Safety, Housing        | Conditional | Alpha        | 20A       |
| 25     | building.community.small_shrine_hall          | Small Shrine or Community Hall  | Village       | Morale      | Health, Safety         | Optional    | Extended Slice | 20A       |
| 26     | building.hospitality.tavern_inn               | Tavern or Inn                   | Village       | Morale      | Provisions, Work       | Optional    | Alpha        | 20A       |
| 27     | building.community.bathhouse_laundry          | Bathhouse and Laundry           | Town          | Health      | Infrastructure, Morale | Optional    | Beta         | 20A       |
| 28     | building.community.festival_grounds           | Festival or Community Grounds   | Village       | Morale      | Work                   | Optional    | Alpha        | 20A       |
| 29     | building.community.memorial_cemetery          | Memorial and Cemetery           | Village       | Morale      | Health, Infrastructure | Conditional | Alpha        | 20A       |
| 30     | building.community.cultural_hall_theatre      | Cultural Hall or Theatre        | Town          | Morale      | Work, Infrastructure   | Optional    | Beta         | 20A       |

| **\#** | **Definition**                  | **Functional Distinction**                                               |
|--------|---------------------------------|--------------------------------------------------------------------------|
| 21     | Healer Hut                      | Basic treatment, medicine storage and recovery service.                  |
| 22     | Clinic or Infirmary             | Expanded treatment capacity, beds, staff and emergency response.         |
| 23     | Hospital Complex                | City-scale care, surgery, wards, specialist staff and disaster capacity. |
| 24     | Quarantine or Emergency Shelter | Temporary isolation, disaster shelter and crisis accommodation.          |
| 25     | Small Shrine or Community Hall  | Culture-neutral slot for worship, assembly, ritual or shared identity.   |
| 26     | Tavern or Inn                   | Meals, lodging, social gathering, rumours and visitor support.           |
| 27     | Bathhouse and Laundry           | Sanitation, recovery and social service where culturally appropriate.    |
| 28     | Festival or Community Grounds   | Flexible site for gatherings, markets, ceremonies and events.            |
| 29     | Memorial and Cemetery           | Burial, remembrance, mourning, history and culture-specific rites.       |
| 30     | Cultural Hall or Theatre        | Performance, arts, public events and cultural progression.               |

# 9. Extraction and Raw Processing

Extraction definitions represent job sites and resource interfaces. Ore type, tree species, stone family and biome material remain data or palette variations.

| **\#** | **Stable ID**                             | **Definition**                  | **Min Stage** | **Primary** | **Secondary**              | **Planner** | **Scope**    | **Owner** |
|--------|-------------------------------------------|---------------------------------|---------------|-------------|----------------------------|-------------|--------------|-----------|
| 31     | building.extraction.lumber_camp           | Lumber Camp                     | Hamlet        | Work        | Provisions, Infrastructure | Optional    | Technical POC | 20B       |
| 32     | building.extraction.sawmill               | Sawmill                         | Village       | Work        | Infrastructure             | Optional    | Alpha        | 20B       |
| 33     | building.extraction.quarry_stone_yard     | Quarry and Stone Yard           | Village       | Work        | Infrastructure             | Conditional | Alpha        | 20B       |
| 34     | building.extraction.clay_sand_works       | Clay or Sand Works              | Hamlet        | Work        | Infrastructure             | Conditional | Alpha        | 20B       |
| 35     | building.extraction.mine_entrance         | Mine Entrance                   | Hamlet        | Work        | Safety, Infrastructure     | Conditional | Extended Slice | 20B       |
| 36     | building.extraction.deep_mine_complex     | Mine Shaft or Deep Mine Complex | Town          | Work        | Safety, Infrastructure     | Conditional | Beta         | 20B       |
| 37     | building.extraction.ore_sorting_yard      | Ore Sorting Yard                | Village       | Work        | Infrastructure             | Optional    | Alpha        | 20B       |
| 38     | building.extraction.charcoal_fuel_yard    | Charcoal Burner and Fuel Yard   | Hamlet        | Provisions  | Work, Infrastructure       | Optional    | Alpha        | 20B       |
| 39     | building.extraction.mana_crystal_site     | Mana Crystal Mine or Extractor  | Village       | Work        | Safety, Infrastructure     | Conditional | Alpha        | 20E       |
| 40     | building.extraction.automated_mine_quarry | Automated Mine or Quarry Site   | Town          | Work        | Infrastructure, Safety     | Conditional | Beta         | 20E       |

| **\#** | **Definition**                  | **Functional Distinction**                                          |
|--------|---------------------------------|---------------------------------------------------------------------|
| 31     | Lumber Camp                     | Forestry job site, timber staging and sustainable-cutting rules.    |
| 32     | Sawmill                         | Processes logs into planks, beams, sawdust and construction parts.  |
| 33     | Quarry and Stone Yard           | Stone extraction, sorting and construction-material supply.         |
| 34     | Clay or Sand Works              | Local clay, sand, gravel or salt extraction family.                 |
| 35     | Mine Entrance                   | Controlled access to mine jobs, storage and underground routes.     |
| 36     | Mine Shaft or Deep Mine Complex | Deeper extraction, lifts, ventilation, rails and higher risk.       |
| 37     | Ore Sorting Yard                | Grades raw ore, stores output and prepares furnace batches.         |
| 38     | Charcoal Burner and Fuel Yard   | Renewable early fuel and controlled stockpiling.                    |
| 39     | Mana Crystal Mine or Extractor  | Magical resource extraction with purity and instability controls.   |
| 40     | Automated Mine or Quarry Site   | Bulk extraction through machines, logistics and environmental risk. |

# 10. Crafting and Artisan Production

Crafting entries are separated only where production logic, risk, staffing or outputs are meaningfully distinct. Individual trades may later appear as branches or specialist workstation modules.

| **\#** | **Stable ID**                           | **Definition**                 | **Min Stage** | **Primary** | **Secondary**              | **Planner** | **Scope**    | **Owner** |
|--------|-----------------------------------------|--------------------------------|---------------|-------------|----------------------------|-------------|--------------|-----------|
| 41     | building.crafting.carpenter_workshop    | Carpenter Workshop             | Village       | Work        | Infrastructure             | Required    | Technical POC | 20B       |
| 42     | building.crafting.mason_yard            | Mason Yard                     | Village       | Work        | Infrastructure             | Required    | Extended Slice | 20B       |
| 43     | building.crafting.village_blacksmith    | Village Blacksmith             | Village       | Work        | Safety, Infrastructure     | Required    | Extended Slice | 20B       |
| 44     | building.crafting.pottery_kiln          | Pottery and Kiln               | Village       | Work        | Provisions, Infrastructure | Optional    | Alpha        | 20B       |
| 45     | building.crafting.weaver_tailor         | Weaver and Tailor Workshop     | Village       | Work        | Morale, Provisions         | Optional    | Alpha        | 20B       |
| 46     | building.crafting.tannery_leatherworker | Tannery and Leatherworker      | Village       | Work        | Health, Infrastructure     | Optional    | Alpha        | 20B       |
| 47     | building.crafting.glass_brick_works     | Glassworks or Brickworks       | Town          | Work        | Infrastructure             | Optional    | Beta         | 20B       |
| 48     | building.industry.foundry_steelworks    | Foundry or Steelworks          | Town          | Work        | Infrastructure, Safety     | Optional    | Beta         | 20E       |
| 49     | building.industry.machine_workshop      | Machine Workshop               | Town          | Work        | Infrastructure             | Optional    | Beta         | 20E       |
| 50     | building.magic.rune_forge               | Rune Forge or Enchanted Smithy | Town          | Work        | Safety, Infrastructure     | Conditional | Beta         | 20E       |

| **\#** | **Definition**                 | **Functional Distinction**                                         |
|--------|--------------------------------|--------------------------------------------------------------------|
| 41     | Carpenter Workshop             | Wood components, furniture, repairs and blueprint parts.           |
| 42     | Mason Yard                     | Stone shaping, blocks, roads, walls and repair materials.          |
| 43     | Village Blacksmith             | Tools, fittings, repairs and guard equipment.                      |
| 44     | Pottery and Kiln               | Ceramics, vessels, bricks and heat-treated materials.              |
| 45     | Weaver and Tailor Workshop     | Cloth, clothing, sacks, banners and culture goods.                 |
| 46     | Tannery and Leatherworker      | Leather, armour components, belts and hides with sanitation needs. |
| 47     | Glassworks or Brickworks       | Glass, bricks, tiles and advanced construction materials.          |
| 48     | Foundry or Steelworks          | Bulk metal refinement, alloys and heavy project components.        |
| 49     | Machine Workshop               | Automation parts, repairs, upgrades and machine assembly.          |
| 50     | Rune Forge or Enchanted Smithy | Magical metalwork, runes, conduits and enchanted equipment.        |

# 11. Trade, Education and Professional Services

Trade, education and professional services connect population growth to knowledge, specialisation, commerce, visitors and regional relationships.

| **\#** | **Stable ID**                         | **Definition**                   | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------|----------------------------------|---------------|----------------|------------------------|-------------|--------------|-----------|
| 51     | building.trade.market_stalls          | Market Stalls                    | Village       | Work           | Morale, Provisions     | Optional    | Extended Slice | 20B       |
| 52     | building.trade.trading_post           | Trading Post                     | Village       | Infrastructure | Work, Provisions       | Optional    | Extended Slice | 20B       |
| 53     | building.trade.covered_market_hall    | Covered Market or Market Hall    | Town          | Work           | Infrastructure, Morale | Optional    | Beta         | 20B       |
| 54     | building.trade.caravanserai_coach_inn | Caravanserai or Coach Inn        | Town          | Infrastructure | Morale, Work           | Conditional | Beta         | 20B       |
| 55     | building.trade.merchant_exchange      | Merchant Guild or Trade Exchange | City          | Work           | Infrastructure, Morale | Optional    | Beta         | 20B       |
| 56     | building.education.small_school       | Small School                     | Village       | Work           | Morale                 | Optional    | Extended Slice | 20B       |
| 57     | building.education.trade_school       | Apprentice or Trade School       | Village       | Work           | Morale                 | Optional    | Alpha        | 20B       |
| 58     | building.education.library_archive    | Library or Archive               | Town          | Morale         | Work, Infrastructure   | Optional    | Beta         | 20B       |
| 59     | building.education.academy_university | Academy or University            | City          | Work           | Morale, Infrastructure | Optional    | Beta         | 20F       |
| 60     | building.professional.guild_hall      | Guild Hall or Professional Lodge | Town          | Work           | Infrastructure, Morale | Optional    | Beta         | 20B       |

| **\#** | **Definition**                   | **Functional Distinction**                                             |
|--------|----------------------------------|------------------------------------------------------------------------|
| 51     | Market Stalls                    | Early local exchange, vendors and rotating market use.                 |
| 52     | Trading Post                     | Imports, exports, contracts, caravans and reputation access.           |
| 53     | Covered Market or Market Hall    | Dense permanent trade, specialist vendors and public commerce.         |
| 54     | Caravanserai or Coach Inn        | Secure caravan lodging, animals, storage and route support.            |
| 55     | Merchant Guild or Trade Exchange | Regional contracts, finance, trade coordination and merchant politics. |
| 56     | Small School                     | Basic learning, children, literacy and apprenticeship support.         |
| 57     | Apprentice or Trade School       | Vocational training and specialist pipeline.                           |
| 58     | Library or Archive               | Books, research, records, recipe knowledge and settlement history.     |
| 59     | Academy or University            | Advanced teaching, research, specialists and cultural prestige.        |
| 60     | Guild Hall or Professional Lodge | Professional organisation, contracts, training and faction identity.   |

# 12. Governance, Justice and Administration

Governance content scales from village permissions to capital authority. It should support multiple political systems without forcing one universal government style.

| **\#** | **Stable ID**                                     | **Definition**                    | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|---------------------------------------------------|-----------------------------------|---------------|----------------|------------------------|-------------|--------------|-----------|
| 61     | building.governance.village_hall                  | Village Hall                      | Village       | Infrastructure | Morale, Work           | Required    | Technical POC | 20C       |
| 62     | building.governance.town_hall                     | Town Hall or Council House        | Town          | Infrastructure | Infrastructure, Morale | Upgrade     | Beta         | 20C       |
| 63     | building.governance.city_hall                     | City Hall or Civic Complex        | City          | Infrastructure | Morale, Work           | Upgrade     | Beta         | 20F       |
| 64     | building.governance.records_planning_office       | Records and Planning Office       | Town          | Infrastructure | Work                   | Optional    | Beta         | 20C       |
| 65     | building.justice.courthouse_magistrate            | Courthouse or Magistrate House    | Town          | Safety         | Morale, Infrastructure | Conditional | Beta         | 20C       |
| 66     | building.governance.tax_customs_office            | Tax or Customs Office             | Town          | Infrastructure | Work, Safety           | Conditional | Beta         | 20C       |
| 67     | building.governance.embassy_diplomatic_hall       | Embassy or Diplomatic Hall        | City          | Morale         | Safety, Work           | Conditional | Beta         | 20C       |
| 68     | building.governance.leader_residence              | Governor or Leader Residence      | City          | Morale         | Safety, Infrastructure | Optional    | Beta         | 20C       |
| 69     | building.governance.palace_high_council           | Palace or High Council Complex    | Capital       | Morale         | Safety, Infrastructure | Megaproject | Final        | 20F       |
| 70     | building.governance.blueprint_construction_office | Blueprint and Construction Office | Village       | Infrastructure | Work                   | Optional    | Alpha        | 20C       |

| **\#** | **Definition**                    | **Functional Distinction**                                                      |
|--------|-----------------------------------|---------------------------------------------------------------------------------|
| 61     | Village Hall                      | Requests, permissions, leadership, records and stage administration.            |
| 62     | Town Hall or Council House        | Town planning, services, laws, taxation and district coordination.              |
| 63     | City Hall or Civic Complex        | City administration, districts, major services and regional authority.          |
| 64     | Records and Planning Office       | Maps, census, parcels, blueprint approvals and project scheduling.              |
| 65     | Courthouse or Magistrate House    | Disputes, law, fines, hearings and limited holding capacity.                    |
| 66     | Tax or Customs Office             | Trade controls, tolls, tariffs, tribute and customs inspection.                 |
| 67     | Embassy or Diplomatic Hall        | Faction relations, visitors, treaties and political events.                     |
| 68     | Governor or Leader Residence      | Leadership residence, receptions and authority symbol.                          |
| 69     | Palace or High Council Complex    | Capital leadership, diplomacy, archives and ceremonial authority.               |
| 70     | Blueprint and Construction Office | Player blueprint submission, validation, parcel assignment and project records. |

# 13. Safety, Defence and Emergency

Safety combines detection, patrols, fortification, emergency response and refuge. Defence networks remain modular projects, while occupied military sites remain buildings or complexes.

| **\#** | **Stable ID**                          | **Definition**                     | **Min Stage**     | **Primary** | **Secondary**          | **Planner** | **Scope**    | **Owner** |
|--------|----------------------------------------|------------------------------------|-------------------|-------------|------------------------|-------------|--------------|-----------|
| 71     | building.safety.guard_post             | Guard Post                         | Village           | Safety      | Work                   | Required    | Technical POC | 20C       |
| 72     | building.safety.wooden_watchtower      | Wooden Watchtower                  | Village           | Safety      | Infrastructure         | Required    | Technical POC | 20C       |
| 73     | project.defence.palisade_segment       | Palisade Segment                   | Village           | Safety      | Infrastructure         | Required    | Technical POC | 20C       |
| 74     | building.safety.village_gate           | Village Gate                       | Village           | Safety      | Infrastructure         | Required    | Technical POC | 20C       |
| 75     | building.safety.barracks_training_yard | Barracks and Training Yard         | Fortified Village | Safety      | Work, Morale           | Optional    | Alpha        | 20C       |
| 76     | project.defence.stone_wall_gatehouse   | Stone Wall and Gatehouse System    | Town              | Safety      | Infrastructure         | Upgrade     | Beta         | 20C       |
| 77     | building.safety.armoury                | Armoury                            | Fortified Village | Safety      | Infrastructure, Work   | Optional    | Alpha        | 20C       |
| 78     | building.safety.fort_keep              | Fort or Keep                       | Town              | Safety      | Infrastructure, Morale | Conditional | Beta         | 20F       |
| 79     | building.emergency.fire_rescue_station | Fire and Rescue Station            | Town              | Safety      | Health, Infrastructure | Optional    | Beta         | 20C       |
| 80     | building.emergency.refuge_bunker       | Emergency Shelter or Refuge Bunker | Town              | Safety      | Housing, Health        | Conditional | Beta         | 20C       |

| **\#** | **Definition**                     | **Functional Distinction**                                            |
|--------|------------------------------------|-----------------------------------------------------------------------|
| 71     | Guard Post                         | Local patrol, guard assignment and nearby response coverage.          |
| 72     | Wooden Watchtower                  | Detection, warning, guard effectiveness and raid preparation.         |
| 73     | Palisade Segment                   | Modular early perimeter defence with gates and damage states.         |
| 74     | Village Gate                       | Controlled access, patrol point and perimeter connection.             |
| 75     | Barracks and Training Yard         | Guard housing, training, readiness and reserve force.                 |
| 76     | Stone Wall and Gatehouse System    | Durable perimeter, towers, controlled routes and siege resistance.    |
| 77     | Armoury                            | Guard equipment, ammunition, repair reserves and secure issue points. |
| 78     | Fort or Keep                       | Regional command, refuge, military storage and strongpoint.           |
| 79     | Fire and Rescue Station            | Fire response, rescue tools, disaster planning and rapid deployment.  |
| 80     | Emergency Shelter or Refuge Bunker | Protected civilian shelter during raids, storms or magical disasters. |

# 14. Storage, Roads, Transport and Utilities

This category owns the physical movement and service backbone: storage, paths, roads, water, sanitation and transport interfaces. Advanced network machinery can link to 20E.

| **\#** | **Stable ID**                                  | **Definition**                   | **Min Stage** | **Primary**    | **Secondary**            | **Planner** | **Scope**    | **Owner** |
|--------|------------------------------------------------|----------------------------------|---------------|----------------|--------------------------|-------------|--------------|-----------|
| 81     | building.storage.small_storehouse              | Small Storehouse                 | Hamlet        | Infrastructure | Provisions               | Required    | Extended Slice | 20D       |
| 82     | building.storage.village_warehouse             | Village Warehouse                | Village       | Infrastructure | Provisions, Work, Safety | Required    | Technical POC | 20D       |
| 83     | building.storage.specialised_depot             | Specialised Depot or Silo        | Village       | Infrastructure | Provisions, Work         | Optional    | Alpha        | 20D       |
| 84     | building.storage.automated_distribution_centre | Automated Distribution Centre    | City          | Infrastructure | Work, Provisions         | Optional    | Beta         | 20D       |
| 85     | project.transport.dirt_path_junction_set       | Dirt Path and Road Junction Set  | Camp          | Infrastructure | Work, Safety             | Required    | Technical POC | 20D       |
| 86     | project.transport.stone_road_bridge_set        | Stone Road and Bridge Set        | Village       | Infrastructure | Safety, Work             | Upgrade     | Alpha        | 20D       |
| 87     | building.transport.dock_harbour                | Dock or Harbour                  | Town          | Infrastructure | Work, Provisions         | Conditional | Beta         | 20D       |
| 88     | building.utility.village_well                  | Village Well or Water Point      | Hamlet        | Provisions     | Health, Infrastructure   | Required    | Technical POC | 20D       |
| 89     | project.utility.cistern_aqueduct_pump          | Cistern, Aqueduct or Pump System | Town          | Infrastructure | Provisions, Health       | Conditional | Beta         | 20D       |
| 90     | project.utility.sanitation_waste_system        | Sanitation and Waste Utility     | Town          | Infrastructure | Health, Morale           | Optional    | Beta         | 20D       |

| **\#** | **Definition**                   | **Functional Distinction**                                                 |
|--------|----------------------------------|----------------------------------------------------------------------------|
| 81     | Small Storehouse                 | Basic shared storage, construction stock and household overflow.           |
| 82     | Village Warehouse                | Category storage, project reserves, deliveries and automation permissions. |
| 83     | Specialised Depot or Silo        | Food, fuel, timber, stone, ore, tools or guard-supply specialisation.      |
| 84     | Automated Distribution Centre    | Sorting, network buffers, district supply and automated routing.           |
| 85     | Dirt Path and Road Junction Set  | Basic access, parcel edges, hauling routes and settlement layout.          |
| 86     | Stone Road and Bridge Set        | Durable roads, crossings, drainage and heavier transport.                  |
| 87     | Dock or Harbour                  | Water transport, trade, fishing and regional routes.                       |
| 88     | Village Well or Water Point      | Settlement water access, capacity and reliability.                         |
| 89     | Cistern, Aqueduct or Pump System | Expanded water storage, movement, irrigation and resilience.               |
| 90     | Sanitation and Waste Utility     | Waste, drainage, composting and sanitation service coverage.               |

# 15. Magic, Ritual and Dimensional Systems

Magic buildings treat mana, runes, wards, healing, rituals, leylines, portals and realm hazards as physical settlement infrastructure.

| **\#** | **Stable ID**                                   | **Definition**                                | **Min Stage** | **Primary**    | **Secondary**                  | **Planner** | **Scope**    | **Owner** |
|--------|-------------------------------------------------|-----------------------------------------------|---------------|----------------|--------------------------------|-------------|--------------|-----------|
| 91     | building.magic.mage_hut_rune_workshop           | Mage Hut or Rune Workshop                     | Village       | Work           | Safety, Infrastructure, Morale | Conditional | Extended Slice | 20E       |
| 92     | building.magic.alchemy_laboratory               | Alchemy Laboratory                            | Village       | Work           | Health, Safety                 | Conditional | Alpha        | 20E       |
| 93     | project.magic.ward_stone_relay                  | Ward Stone or Defence Relay                   | Village       | Safety         | Infrastructure                 | Conditional | Alpha        | 20E       |
| 94     | building.magic.mana_store_battery               | Mana Store or Battery House                   | Village       | Infrastructure | Safety, Work                   | Conditional | Alpha        | 20E       |
| 95     | building.magic.ritual_circle_hall               | Ritual Circle or Hall                         | Town          | Morale         | Safety, Work                   | Conditional | Beta         | 20E       |
| 96     | building.magic.magic_academy_tower              | Magic Academy or Research Tower               | City          | Work           | Morale, Infrastructure         | Conditional | Beta         | 20E       |
| 97     | building.magic.healing_cleansing_shrine         | Healing or Cleansing Shrine                   | Town          | Health         | Morale, Safety                 | Conditional | Beta         | 20E       |
| 98     | building.magic.leyline_observatory_relay        | Leyline Observatory or Relay                  | City          | Infrastructure | Work, Safety                   | Conditional | Beta         | 20E       |
| 99     | building.magic.portal_station_sanctum           | Portal Station or Sanctum                     | City          | Infrastructure | Safety, Work                   | Conditional | Beta         | 20E       |
| 100    | building.magic.dimensional_research_containment | Dimensional Research and Containment Facility | Capital       | Safety         | Work, Infrastructure           | Conditional | Final        | 20E       |

| **\#** | **Definition**                                | **Functional Distinction**                                               |
|--------|-----------------------------------------------|--------------------------------------------------------------------------|
| 91     | Mage Hut or Rune Workshop                     | Teaching, basic runes, mana services and ward support.                   |
| 92     | Alchemy Laboratory                            | Potions, catalysts, medicines, reagents and controlled risks.            |
| 93     | Ward Stone or Defence Relay                   | Local ward coverage, warning and protective infrastructure.              |
| 94     | Mana Store or Battery House                   | Safe mana storage, distribution and emergency reserve.                   |
| 95     | Ritual Circle or Hall                         | Community rituals, major spells, events and culture-specific ceremonies. |
| 96     | Magic Academy or Research Tower               | Advanced teaching, spell research and magical specialists.               |
| 97     | Healing or Cleansing Shrine                   | Healing support, corruption cleansing and magical recovery.              |
| 98     | Leyline Observatory or Relay                  | Maps mana flows, stabilises networks and unlocks regional systems.       |
| 99     | Portal Station or Sanctum                     | Controlled portal travel, permissions, power and route anchoring.        |
| 100    | Dimensional Research and Containment Facility | Realm studies, hazardous materials, containment and portal safety.       |

# 16. Automation, Power and Advanced Industry

Automation and power entries scale manual mechanisms into regional industry while supporting rather than deleting NPC labour and visible resource flow.

| **\#** | **Stable ID**                                    | **Definition**                      | **Min Stage** | **Primary**    | **Secondary**          | **Planner** | **Scope** | **Owner** |
|--------|--------------------------------------------------|-------------------------------------|---------------|----------------|------------------------|-------------|-----------|-----------|
| 101    | building.automation.hand_crank_workshop          | Hand-Crank or Mechanical Workshop   | Village       | Work           | Infrastructure         | Optional    | Alpha     | 20E       |
| 102    | building.power.waterwind_power_house             | Waterwheel or Wind Power House      | Village       | Infrastructure | Work                   | Conditional | Alpha     | 20E       |
| 103    | building.industry.furnace_mana_furnace           | Furnace or Mana Furnace Facility    | Village       | Work           | Infrastructure, Safety | Conditional | Alpha     | 20E       |
| 104    | building.automation.mechanical_processing_mill   | Mechanical Processing Mill          | Village       | Work           | Infrastructure         | Optional    | Alpha     | 20E       |
| 105    | building.logistics.conveyor_cart_hub             | Conveyor or Cart Logistics Hub      | Town          | Infrastructure | Work                   | Optional    | Beta      | 20E       |
| 106    | building.power.steam_generator_plant             | Steam or Generator Plant            | Town          | Infrastructure | Safety, Work           | Optional    | Beta      | 20E       |
| 107    | building.automation.automated_farm_greenhouse    | Automated Farm or Greenhouse        | Town          | Provisions     | Infrastructure, Work   | Optional    | Beta      | 20E       |
| 108    | building.industry.automated_factory_assembly     | Automated Factory or Assembly Hall  | City          | Work           | Infrastructure, Safety | Optional    | Beta      | 20E       |
| 109    | building.automation.golem_workshop_labour_centre | Golem Workshop or Labour Centre     | City          | Work           | Infrastructure, Safety | Conditional | Beta      | 20E       |
| 110    | building.power.regional_grid_control             | Regional Power or Mana Grid Control | Capital       | Infrastructure | Safety, Work           | Megaproject | Final     | 20E       |

| **\#** | **Definition**                      | **Functional Distinction**                                            |
|--------|-------------------------------------|-----------------------------------------------------------------------|
| 101    | Hand-Crank or Mechanical Workshop   | Entry-level mechanisms, manual power and machine maintenance.         |
| 102    | Waterwheel or Wind Power House      | Renewable mechanical power based on terrain and climate.              |
| 103    | Furnace or Mana Furnace Facility    | Ore processing and first mechanical or magical production chain.      |
| 104    | Mechanical Processing Mill          | Powered crushing, sawing, milling or simple production modules.       |
| 105    | Conveyor or Cart Logistics Hub      | Network sorting, carts, belts, chutes and transfer points.            |
| 106    | Steam or Generator Plant            | Higher-output power, fuel systems and maintenance burden.             |
| 107    | Automated Farm or Greenhouse        | Scaled crop production using machines, water or magic support.        |
| 108    | Automated Factory or Assembly Hall  | Bulk components, machines, logistics and advanced production.         |
| 109    | Golem Workshop or Labour Centre     | Constructed workers, charging, task profiles and governance risks.    |
| 110    | Regional Power or Mana Grid Control | Coordinates high-capacity energy, priorities and regional resilience. |

# 17. Districts, Complexes, Megaprojects and Wonders

Plans and megaprojects coordinate several building definitions. They do not replace individual entries; they define placement, sequencing, shared networks and civilisation-scale outcomes.

| **\#** | **Stable ID**                                        | **Definition**                          | **Min Stage**      | **Primary**    | **Secondary**                 | **Planner** | **Scope** | **Owner** |
|--------|------------------------------------------------------|-----------------------------------------|--------------------|----------------|-------------------------------|-------------|-----------|-----------|
| 111    | plan.cluster.farmstead                               | Farmstead Cluster                       | Village            | Provisions     | Housing, Work, Infrastructure | District    | Alpha     | 20F       |
| 112    | plan.cluster.market_civic_centre                     | Market Square and Civic Centre          | Village            | Morale         | Work, Infrastructure          | District    | Alpha     | 20F       |
| 113    | plan.district.artisan_industrial                     | Artisan or Industrial District Template | Town               | Work           | Infrastructure, Safety        | District    | Beta      | 20F       |
| 114    | plan.district.residential                            | Residential District Template           | Town               | Housing        | Infrastructure, Morale        | District    | Beta      | 20F       |
| 115    | plan.complex.citadel_fortified_perimeter             | Citadel and Fortified Perimeter Complex | City               | Safety         | Infrastructure, Morale        | District    | Beta      | 20F       |
| 116    | plan.campus.hospital_university                      | Hospital or University Campus           | City               | Health         | Work, Infrastructure, Morale  | District    | Beta      | 20F       |
| 117    | plan.nexus.regional_logistics_transit                | Regional Logistics and Transit Nexus    | City               | Infrastructure | Work, Provisions              | District    | Beta      | 20F       |
| 118    | project.megaproject.city_ward_portal_nexus           | City-Wide Ward Core or Portal Nexus     | Capital            | Safety         | Infrastructure, Work          | Megaproject | Final     | 20F       |
| 119    | project.megaproject.floating_district_anchor_skyport | Floating District Anchor or Skyport     | Magical Metropolis | Infrastructure | Safety, Work, Housing         | Megaproject | Final     | 20F       |
| 120    | project.wonder.culture_wonder_leyline_crown          | Culture Wonder or Leyline Crown         | Capital            | Morale         | Infrastructure, Safety, Work  | Megaproject | Final     | 20F       |

| **\#** | **Definition**                          | **Functional Distinction**                                                     |
|--------|-----------------------------------------|--------------------------------------------------------------------------------|
| 111    | Farmstead Cluster                       | Farmhouse, fields, barn, storage and access arranged as one validated cluster. |
| 112    | Market Square and Civic Centre          | Market, hall, notice board, roads and public-space layout.                     |
| 113    | Artisan or Industrial District Template | Production parcels, logistics, buffers, roads and worker access.               |
| 114    | Residential District Template           | Mixed housing, services, paths, public space and expansion parcels.            |
| 115    | Citadel and Fortified Perimeter Complex | Layered walls, gates, command, refuge and strategic storage.                   |
| 116    | Hospital or University Campus           | Multi-building specialist service with shared grounds and utilities.           |
| 117    | Regional Logistics and Transit Nexus    | Road, rail, harbour, portal or freight systems connected by one hub.           |
| 118    | City-Wide Ward Core or Portal Nexus     | City-scale protection or travel network requiring staged subprojects.          |
| 119    | Floating District Anchor or Skyport     | Supports elevated districts, air routes and magical structural systems.        |
| 120    | Culture Wonder or Leyline Crown         | Culture-defining civilisation project with regional or world-state effects.    |

# 18. Settlement Stage Matrix

Settlement stages are capability expectations rather than mandatory visual templates. A culture may satisfy a capability through a different structure, shared facility, mixed-use blueprint, district service or magical equivalent. Advancement checks the required capacities and world conditions, not a single fixed list of building names.

| **Stage**          | **Capability Expectation**                                                                          | **Typical Required Proof**                                                          | **Optional / Conditional Pool**                                                       | **Scope Guard**                                                                    |
|--------------------|-----------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| Camp               | Temporary shelter, gathering point, build supply and basic access.                                  | Campfire Site; Small Tent; Builder Supply Yard; Dirt Path set.                      | Worker/refugee shelter.                                                               | No penalty for missing permanent civic or utility services.                        |
| Hamlet             | Permanent homes, basic food, water, storage and first local jobs.                                   | Primitive Hut or Cottage; Farm Plot; Small Storehouse; Village Well.                | Farmhouse, Longhouse, Barn, Communal Kitchen, Lumber Camp, Mine Entrance.             | Can remain compact and informal.                                                   |
| Village            | Shared reserves, governance, specialist work, trade, health, learning and basic defence.            | Warehouse; Granary; Village Hall; core work sites; guard coverage.                  | Market, Trading Post, Healer, School, Shrine/Hall, Mage Hut, Palisade, Watchtower.    | This is the main Extended Forest Hamlet completion stage; the Technical POC proves its core systems earlier.                                             |
| Fortified Village  | Defence redundancy, emergency capacity, guard supply and reliable reserves.                         | At least one functioning perimeter strategy and guard readiness.                    | Barracks, Armoury, Quarantine Shelter, Ward relay, specialised depots.                | Fortification can be walls, terrain, wards or culture-specific equivalents.        |
| Town               | Specialised production, civic administration, utilities, formal trade and early districts.          | Town governance, durable routes, health service and service coverage.               | Foundry, clinic, market hall, guilds, sanitation, aqueduct, power and district plans. | Town status should not require every optional industry.                            |
| City               | Dense districts, regional services, advanced logistics, major education/health and layered defence. | City administration plus multiple connected districts and resilient infrastructure. | Hospital, University, transit nexus, factory, magic academy, citadel, portal station. | Large population creates demand and maintenance, not only bonuses.                 |
| Capital            | Regional authority, grand civic systems, high-capacity networks and megaproject governance.         | Capital leadership and at least one regional-scale infrastructure system.           | Palace, dimensional facility, ward/portal nexus, regional grid control, wonder.       | Political role may come from faction recognition rather than raw population alone. |
| Magical Metropolis | World-shaping infrastructure, vertical/floating growth, realm logistics and culture wonders.        | Stable endgame networks and a completed civilisation-scale project.                 | Floating district, skyport, Leyline Crown, portal networks and unique wonders.        | This is an endgame sandbox state, not a mandatory ending.                          |

## 18.1 Catalogue Availability by Earliest Stage

| **Earliest Stage** | **Definitions Introduced** | **Cumulative Definitions** | **Design Meaning**                                    |
|--------------------|----------------------------|----------------------------|-------------------------------------------------------|
| Camp               | 5                          | 5                          | First survival settlement and construction setup.     |
| Hamlet             | 15                         | 20                         | Permanent homes, food, water and basic work.          |
| Village            | 43                         | 63                         | Full connected civilisation loop.                     |
| Fortified Village  | 2                          | 65                         | Defence resilience and emergency preparation.         |
| Town               | 33                         | 98                         | Specialised production, administration and utilities. |
| City               | 16                         | 114                        | District-scale urban services and advanced networks.  |
| Capital            | 5                          | 119                        | Regional authority and megaproject systems.           |
| Magical Metropolis | 1                          | 120                        | World-shaping endgame civilisation.                   |

# 19. Seven-Needs Coverage Matrix

The primary need identifies the building’s direct capacity or core service. Secondary needs are meaningful supporting effects, not extra bars. Buildings may also create demand: housing increases provisions and infrastructure demand; industry increases safety and utility demand; prestige buildings increase maintenance and staffing demand.

| **Need**       | **Primary Definitions** | **Direct Calculation**                                                            | **Representative Contributors**                                                    | **Common Demand Created**          |
|----------------|-------------------------|-----------------------------------------------------------------------------------|------------------------------------------------------------------------------------|------------------------------------|
| Housing        | 9                       | Suitable beds, household assignment, climate protection and spare capacity.       | Homes, shelters, longhouses, townhouses, apartments and mixed-use residences.      | Provisions, Infrastructure, Safety |
| Provisions     | 13                      | Food, water, fuel, clothing basics and reserve resilience.                        | Farms, granaries, kitchens, wells, fisheries, mills and preserving houses.         | Work, Storage, Transport           |
| Health         | 7                       | Treatment, recovery, sanitation, outbreak response and cleansing.                 | Healer huts, clinics, hospitals, quarantine, water and sanitation projects.        | Medicine, Staff, Utilities         |
| Work           | 36                      | Jobs, tools, work sites, specialists, training and production access.             | Extraction, workshops, trade, schools, industry, magic and automation.             | Tools, Inputs, Power, Safety       |
| Safety         | 15                      | Threat detection, guards, equipment, fortification, emergency response and wards. | Guard sites, towers, walls, gates, armouries, refuges, wards and citadels.         | Staff, Equipment, Maintenance      |
| Infrastructure | 27                      | Storage, roads, logistics, utilities, governance, networks and maintenance.       | Warehouses, roads, halls, water systems, transport, power and distribution.        | Labour, Repairs, Energy            |
| Morale         | 13                      | Community, culture, identity, social life, remembrance and confidence.            | Shrines/halls, inns, festival grounds, cultural buildings, governance and wonders. | Space, Staff, Culture Goods        |

# 20. Upgrade Families and Branching Rules

Upgrade families communicate progression without forcing every settlement to demolish its previous buildings. A project may expand, renovate, convert, attach a module, replace a site, or add a parallel specialist branch. Existing lower-tier structures remain useful where their capacity and maintenance suit local demand.

| **Family**          | **Core Progression**                                                                         | **Branch Rule**                                                                                                  |
|---------------------|----------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| Housing             | Tent -> Hut -> Cottage -> Townhouse -> Apartment                                         | Longhouse, shop-house, climate-adapted, noble or culture-specific branches.                                      |
| Food production     | Farm Plot -> Irrigated/Terraced Farm -> Automated Farm                                     | Orchard, greenhouse, fishery and livestock specialisations.                                                      |
| Food reserves       | Small Storehouse -> Granary/Specialised Depot -> Warehouse -> Distribution Centre         | Food, fuel, construction, trade, guard and magical storage branches.                                             |
| Metalwork           | Village Blacksmith -> Foundry/Steelworks -> Machine Workshop or Rune Forge                 | Weaponsmith, armourer and toolsmith are modules or specialist branches unless mechanics demand separate entries. |
| Health              | Healer Hut -> Clinic/Infirmary -> Hospital Complex                                         | Quarantine, cleansing, hospice and field-care branches.                                                          |
| Education           | Small School -> Trade School/Library -> Academy/University                                 | Magic, engineering, military and culture-specific specialisations.                                               |
| Governance          | Village Hall -> Town Hall -> City Hall -> Palace/High Council                             | Council, ruler, communal, guild or faction government styles.                                                    |
| Defence             | Guard Post/Watchtower -> Palisade/Gate -> Barracks/Armoury -> Stone Wall/Keep -> Citadel | Ward, terrain, naval, underground and magical perimeter equivalents.                                             |
| Transport           | Dirt Path -> Stone Road/Bridge -> Logistics Hub -> Regional Transit Nexus                 | Dock, rail, lift, airship and portal branches.                                                                   |
| Magic               | Mage Hut -> Ritual/Healing/Mana sites -> Academy/Leyline/Portal facilities -> City Nexus  | School, culture, faction and forbidden branches.                                                                 |
| Power               | Hand-Crank -> Water/Wind -> Steam/Generator -> Regional Grid Control                      | Mechanical, fuel, mana, leyline and hybrid magitech branches.                                                    |
| Settlement planning | Building cluster -> District template -> Civic/Defence campus -> Megaproject              | Player-made plans can replace default layouts after validation.                                                  |

# 21. Required, Optional and Conditional Project Pools

| **Planner Class** | **Use**                                                                             | **Selection Rule**                                                                                                | **Examples**                                                         |
|-------------------|-------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
| Required          | Minimum capability proof for a stage or crisis.                                     | Selected when the settlement lacks a stage-critical capacity; equivalent definitions may satisfy the requirement. | Housing, food, water, storage, access, governance, core safety.      |
| Optional          | Normal identity, efficiency, comfort or specialisation.                             | Scored by shortages, population, culture, resources, terrain, trade and player priorities.                        | Inn, mill, market, guild, festival grounds, specialist workshop.     |
| Conditional       | Requires geography, danger, story, faction, magic, research or resource conditions. | Only enters the pool when all explicit conditions are true.                                                       | Fishery, quarry, mana mine, ward, portal, embassy, quarantine.       |
| Upgrade           | Improves or converts an existing capability.                                        | Selected when demand, capacity, condition and resources justify the change.                                       | Stone roads, town hall, wall/gatehouse, clinic, distribution centre. |
| District          | Coordinates parcels, roads, utilities and several definitions.                      | Selected after density or scale requires a planned service area.                                                  | Residential district, industrial district, campus, transit nexus.    |
| Megaproject       | Civilisation-scale staged work with regional consequences.                          | Requires governance, specialists, supply chains, subprojects and major progression gates.                         | City ward core, floating district, Leyline Crown.                    |

# 22. Revised Forest Hamlet Production Roster

The original 30-definition roster remains protected. Version 0.2 separates architectural proof from broader content completion so the team can validate data separation, Blueprint Forge authoring, staged NPC construction, services, raid consequences and save persistence before producing the entire village library.

| **#** | **Definition** | **Delivery Group** | **Size** | **Stages** | **Minimum Validation Focus** | **Playable Proof** | **Owner** |
|---:|---|---|---|---:|---|---|---|
| 1 | Campfire Site | Technical POC - Core | Micro | 2 | Gathering, heat/cook, settlement centre | Camp hub | 20A |
| 2 | Small Tent | Technical POC - Core | Small | 3 | Entrance, sleep spots, weather cover | Temporary housing | 20A |
| 3 | Builder Supply Yard | Technical POC - Core | Small | 3 | Supply crate, scaffold, tools, project marker | Construction staging | 20D |
| 5 | Primitive Hut | Extended Slice | Small | 4 | Door, bed, light, protected interior | First permanent home | 20A |
| 6 | Small Cottage | Technical POC - Core | Small | 5 | Household beds, storage, heat/light | Player blueprint validation | 20A |
| 7 | Farmhouse | Extended Slice | Medium | 6 | Home, farm storage, work point | Mixed-use test | 20A |
| 11 | Basic Farm Plot | Technical POC - Core | Parcel | 3 | Crop rows, access, tool point | Food production | 20A |
| 13 | Barn | Extended Slice | Medium | 5 | Feed/storage, animal access | Farm support | 20A |
| 14 | Granary | Extended Slice | Small | 5 | Protected food storage, ledger | Reserve stability | 20A |
| 15 | Communal Kitchen | Technical POC - Core | Small | 5 | Cook station, food input/output, tables | Batch meals | 20A |
| 21 | Healer Hut | Extended Slice | Small | 5 | Treatment, medicine, recovery bed | Health service | 20A |
| 25 | Small Shrine or Community Hall | Extended Slice | Small | 5 | Assembly/ritual point, seating, culture slot | Morale and culture | 20A |
| 31 | Lumber Camp | Technical POC - Core | Parcel | 4 | Job marker, log staging, tool store | Wood supply | 20B |
| 35 | Mine Entrance | Extended Slice | Medium | 6 | Safe entrance, job marker, storage | Mining access | 20B |
| 41 | Carpenter Workshop | Technical POC - Core | Medium | 6 | Bench, tools, inputs/outputs | Building components | 20B |
| 42 | Mason Yard | Extended Slice | Parcel | 5 | Stone staging, work marker, outputs | Stone components | 20B |
| 43 | Village Blacksmith | Extended Slice | Medium | 7 | Forge, anvil, heat safety, stores | Tools and guard supply | 20B |
| 51 | Market Stalls | Extended Slice | Cluster | 3 | Vendor slots, access, public space | Basic trade | 20B |
| 52 | Trading Post | Extended Slice | Medium | 6 | Counter, contract board, storage, loading | Regional trade | 20B |
| 56 | Small School | Extended Slice | Small | 5 | Teaching point, seating, storage | Education | 20B |
| 61 | Village Hall | Technical POC - Raid | Medium | 6 | Council, request board, records | Governance | 20C |
| 71 | Guard Post | Technical POC - Raid | Small | 5 | Guard station, equipment, patrol link | Local safety | 20C |
| 72 | Wooden Watchtower | Technical POC - Core | Medium | 7 | Lookout, safe access, signal, coverage | Raid scenario | 20C |
| 73 | Palisade Segment | Technical POC - Raid | Network | 4 | Segment sockets, collision, repair points | Perimeter | 20C |
| 74 | Village Gate | Technical POC - Raid | Medium | 6 | Gate, guard point, road sockets | Controlled access | 20C |
| 81 | Small Storehouse | Extended Slice | Small | 5 | Storage markers, access, categories | Basic shared storage | 20D |
| 82 | Village Warehouse | Technical POC - Core | Large | 7 | Categories, ledger, reserves, loading | Village economy | 20D |
| 85 | Dirt Path and Road Junction Set | Technical POC - Core | Network | 2 | Path nodes, junctions, parcel sockets | Access and planning | 20D |
| 88 | Village Well or Water Point | Technical POC - Core | Micro | 4 | Water point, capacity, safe access | Water access | 20D |
| 91 | Mage Hut or Rune Workshop | Extended Slice | Small | 6 | Rune table, mana store, safe zone, teaching | Practical magic | 20E |

## 22.1 Delivery Group Rules

| **Group** | **Count** | **Purpose** | **Completion Meaning** |
|---|---:|---|---|
| Core Infrastructure Proof | 12 | Prove source/definition separation, construction, housing, food, work, storage, roads, water and watchtower damage. | The building stack works end to end. |
| Raid Extension | 4 | Add governance, guard response, modular perimeter and controlled access. | **Technical POC Complete** - the raid outcome responds to built infrastructure. |
| Extended Forest Hamlet | 14 | Broaden production, health, trade, education, reserves, culture and practical magic. | **Extended Slice Complete** - the original 30-entry village library is playable. |

## 22.2 Technical POC Acceptance Lock

- All 16 Technical POC definitions resolve through stable IDs and correct companion ownership.
- Every definition has validated data and at least one approved source blueprint or network-piece source.
- Official source assets pass semantic marker, stage graph, reference, placement and performance validation.
- Construction projects reserve and consume exact resources across visible stages.
- NPC builders claim tasks, collect stock, reach valid work positions and commission completed structures.
- The cottage proves restricted player creation without exposing unrestricted developer Forge authority.
- Warehouse, Supply Yard, paths and well preserve ownership, routes and resource conservation.
- Watchtower, Guard Post, Palisade and Gate alter detection, warning, response, access and raid aftermath.
- Damage creates local functional loss and repair projects instead of replacing the whole structure with a generic destroyed model.
- Save/load, simulation LOD and multiplayer-authority boundaries preserve project and instance state.

## 22.3 Extended Slice Acceptance Lock

- The remaining 14 protected definitions reach at least Functional gameplay status.
- The settlement can progress from Camp to a populated Forest Hamlet/Village through several valid blueprint layouts.
- Food reserve, health, mining, stonework, smithing, trade, schooling, culture and magic contribute understandable causes to the seven needs.
- At least one Riverward/forest pack resolution validates across the complete 30-entry roster.
- The complete slice survives save migration and regression tests after source blueprint revisions.

# 23. Production Waves and Milestones

| **Wave** | **Catalogue Target** | **Primary Deliverables** | **Exit Gate** |
|---|---|---|---|
| Wave 0 - Registry and Forge Foundation | Before content | Schemas, IDs, semantic registries, validator profiles, dependency graph, stage compiler, bake pipeline and status tracker. | Data round-trip, deterministic bake and validation tests pass. |
| Wave 1 - Core Infrastructure Proof | 12 definitions | Camp -> Hamlet construction loop, cottage player test, food/work/storage/road/water contracts and watchtower damage. | End-to-end source-to-instance pipeline works. |
| Wave 2 - Raid Extension | +4 / 16 cumulative | Village Hall, Guard Post, Palisade and Gate connected to raid detection, response, access, damage and repair. | **Technical POC Complete.** |
| Wave 3 - Extended Forest Hamlet | +14 / 30 cumulative | Full protected village library, foundation culture pack and wider service integration. | **Extended Slice Complete.** |
| Wave 4 - Early Alpha | +20 / 50 cumulative | Broader Hamlet/Village services, terrain industries, reserves and early magic/automation branches. | Multiple autonomous village growth paths work. |
| Wave 5 - Fortified Village and Town | +25 / 75 cumulative | Defence redundancy, utilities, specialists, town administration, power and district foundations. | Town planning scales without hard-coded layouts. |
| Wave 6 - Town and City Beta | +25 / 100 cumulative | Dense housing, hospitals, universities, factories, transit, city governance and advanced magic. | District services and simulation LOD remain performant. |
| Wave 7 - Capital and Endgame | +20 / 120 cumulative | Regional networks, megaprojects, realm systems, floating districts and wonders. | All 120 universal definitions have approved implementation plans; megaproject graphs function. |
| Wave 8 - Pack Expansion | No cap increase by default | Culture, faction, biome, realm and dynamic-state source coverage. | Civilisations feel distinct without duplicating universal function data. |

# 24. Blueprint Forge Coverage and Asset Targets

Blueprint counts are planning estimates rather than promises. Parametric generation, nested modules and inheritance may reduce manual work, but shipped settlements still require curated defaults, validator fixtures and regression sources.

| **Milestone** | **Functional Coverage** | **Minimum Official Source Coverage** | **State and Variant Expectation** |
|---|---:|---|---|
| Core Infrastructure Proof | 12 definitions | 12 validated sources plus reusable road and construction modules. | Construction stages for all; damage/repair for cottage and watchtower; operational states for service sites. |
| Technical POC Complete | 16 definitions | 16 validated sources plus modular palisade/gate pieces. | Raid-relevant damage, breach, repair, access and alert states. |
| Extended Forest Hamlet | 30 definitions | 30 base sources or equivalent nested/parametric coverage. | One forest-neutral/Riverward pack; critical damage states; player-compatible cottage and public/work source. |
| Early Alpha | 50 definitions | Approximately 65-80 curated source blueprints. | Two or three layouts for high-frequency homes, work sites and routes. |
| Fortified/Town Alpha | 75 definitions | Approximately 110-140 curated sources and modules. | Defence, utilities, mixed use, terrain adaptation and upgrade inheritance. |
| City Beta | 100 definitions | Approximately 170-220 curated sources and plan assets. | Dense forms, campuses, transit, factories, state variants and simulation-LOD tests. |
| Universal Complete | 120 definitions | Approximately 220-300 curated sources/sub-blueprints. | Capital, realm, megaproject and wonder subproject graphs. |
| Per major culture pack | Reuses universal definitions | Material-role coverage plus 12-20 high-value sources and 3-8 signatures. | Silhouette, layout, pack substitution and critical-state validation; do not remake all 120 by default. |

## 24.1 Per-Definition Coverage Record

Each definition should link to:

- Official source blueprint IDs.
- Supported size/footprint profiles.
- Required semantic validator profile.
- Construction-stage coverage.
- Operational and damage-state coverage.
- Terrain and world-placement coverage.
- Pack compatibility matrix.
- Player-authoring permission class.
- Runtime-bake compatibility and tool version.
- Test fixtures and known blockers.

# 25. Data, Validation and Implementation Backlog

| **Backlog Item** | **Definition of Work** | **Target** |
|---|---|---|
| Universal registry schema | Versioned building/project/plan definitions, aliases, ownership, stage, need and scope fields. | Wave 0 |
| Canonical namespace validator | Enforce `building.*`, `project.*`, `plan.*`, `module.*`, `blueprint.*` and `pack.*` rules. | Wave 0 |
| Semantic registry | Marker, zone, socket, network endpoint, material-role and validator-profile registries. | Wave 0 |
| Blueprint Forge manifest | Source identity, revision, dependencies, authoring lifecycle, package status and content hashes. | Wave 0 |
| Definition validator | Confirm every 20H row has an owner, stage, need, planner class and valid referenced profile. | Wave 0 |
| Source blueprint validator | Check bounds, semantic layers, navigation, access, modules, stages, states, utilities, worldgen and performance. | Wave 0 |
| Pack resolver | Resolve culture, faction, biome, realm and dynamic-state layers deterministically. | Wave 0-1 |
| Material-role resolver | Convert semantic roles into valid blocks, items and components without breaking safety requirements. | Wave 0-1 |
| Construction-stage compiler | Produce stage deltas, exact voxel/component costs, labour batches and commissioning checks. | Wave 0-1 |
| Damage/repair delta compiler | Produce damage groups, repair deltas and state-local functional loss. | Wave 1 |
| Deterministic runtime baker | Convert approved source into meshes, collision, navigation, marker tables, LOD and runtime caches. | Wave 0-1 |
| Dependency invalidation | Rebuild only affected packages when blocks, items, modules, packs or validator profiles change. | Wave 0-1 |
| Construction task generator | Create reachable placement/removal batches, scaffolding, claims and progress records. | Wave 1 |
| Structure-instance runtime | Ownership, staffing, inputs, outputs, condition, networks, activation and history. | Wave 1 |
| Seven-needs aggregator | Convert active capacities and demand into readable needs and drill-down causes. | Wave 1 |
| Autonomous project planner | Score required, optional, conditional, upgrade, district and megaproject candidates. | Wave 1-2 |
| Parcel and terrain solver | Select sites, adapt foundations, preserve routes and expose exact rejection reasons. | Wave 1-2 |
| Restricted player library | In-world/main-menu authoring, testing, permissions, submission and safe reuse of shared contracts. | Wave 1-3 |
| Upgrade/inheritance runtime | Expand, attach, convert or replace structures through approved source and delta relationships. | Wave 2-3 |
| Simulation LOD | Promote/demote projects and structures while preserving resources, people, state and history. | Wave 1-6 |
| Revision migration service | Stable-ID aliases, source revision compatibility, instance migration and rollback diagnostics. | Wave 0-Beta |
| Forge Test Laboratory | Automated source fixtures plus playable construction, raid, damage, repair and world-placement scenarios. | Wave 0-3 |
| CI and AI-review gates | Schema lint, dependency checks, deterministic bake hashes, diff summaries and protected-ID review. | Wave 0 onward |

# 26. Change Control and Catalogue Governance

1. Search the catalogue for an existing functional equivalent, profile, module or upgrade branch.
2. Determine whether the idea is only a style, material, size, room, construction stage, damage state, culture or biome variant.
3. Identify the distinct need capacity, service, production chain, planner behaviour, network role, risk model or progression gate.
4. Assign companion ownership and confirm that another registry does not already own the concept.
5. Provide a stable ID, earliest stage, needs, planner class, delivery scope and validation profile.
6. Decide whether the idea replaces, merges with or expands the 120-entry catalogue.
7. Update 20H first, then the owning companion, machine-readable registry and source backlog.
8. Add migration aliases and tests whenever a shipped ID, schema or source contract changes.
9. Require a human-reviewable diff for Summer Engine or other AI-authored catalogue changes.
10. Re-run registry, Forge, bake, save and scenario regression gates before release.

> **Do Not Renumber or Reuse**
>
> Catalogue numbers are human navigation aids; stable IDs are save- and data-facing identity. Once an entry is implemented or referenced externally, its ID is migrated rather than reused for a different concept. Retired IDs remain aliases or tombstones.

## 26.1 Change Classes

| **Change Class** | **Example** | **Required Response** |
|---|---|---|
| Editorial | Description clarity or typo. | Review and publish; no migration. |
| Additive compatible | New optional tag or source blueprint. | Validate references and package. |
| Behavioural compatible | Balance or planner-weight change. | Scenario and balance regression. |
| Source revision | Voxel/stage/state change with same contract. | Re-bake affected packages; instance compatibility check. |
| Contract migration | Marker, capacity or schema requirement changes. | Versioned migration, aliases and save tests. |
| Stable-ID change | Canonical rename or merge. | Alias/tombstone, migration and protected-ID approval. |
| Catalogue expansion/removal | Entry 121, merge or retirement. | Formal function-distinction review and suite-wide approval. |

# 27. Suite Revision Relationship and Next Document

20H v0.2 is the catalogue counterpart to Document 20 v1.0. Together they establish the shared architecture and authoritative production register required before revising the detailed companion documents.

The next revision is **20A v0.2 - Housing, Provisions, Health and Community**. Its gameplay content remains largely approved; the revision should update source-of-truth references, semantic marker profiles, construction stages, Blueprint Forge validation, POC delivery labels and Godot/Summer Engine implementation notes.

Recommended revision sequence:

```text
20A -> 20B -> 20C -> 20D -> 20E -> 20F -> 20G
```

# Appendix A. Catalogue and Production Field Template

| **Field Group** | **Required Content** |
|---|---|
| Identity | `definition_id`; catalogue number; family ID; display/localisation keys; aliases; kind; category; tags; schema version. |
| Ownership | Companion owner; shared contract profile; pack authority; responsible implementation module. |
| Stage and planning | Earliest stage; expected stage; planner class; eligibility; maximum/recommended count; replacement rules. |
| Needs and services | Primary need; secondary needs; direct capacity; coverage; resilience; demand created; activation profile. |
| Population and work | Residents; beds; jobs; specialists; visitors; schedules; tools; accessibility/entity profiles. |
| Resources | Construction stage profile; material roles; components; labour; inputs; outputs; storage; maintenance. |
| Placement and access | Footprint/height profiles; terrain; foundation; route class; loading; emergency access; parcel and district tags. |
| Networks | Storage/logistics; water/drainage; fuel; mechanical/power; mana/wards; portal/worldgen sockets. |
| Blueprint source | Official source IDs; inheritance parent; modules; semantic profile; supported packs; player permission class. |
| Runtime | Activation; lifecycle; secondary states; damage groups; repair; occupation; corruption; restoration; simulation LOD. |
| Production tracking | Delivery, design, data, Forge source, bake, gameplay, test, balance, pack coverage and migration statuses. |
| Diagnostics | Blocking errors; warnings; review notes; test fixtures; known risks; last validated tool/schema version. |

# Appendix B. Stage, Need and Scope Counts

| **Earliest Stage** | **Count** | **Primary Need** | **Count** | **Delivery Scope** | **Count** |
|---|---:|---|---:|---|---:|
| Camp | 5 | Housing | 9 | Technical POC | 16 |
| Hamlet | 15 | Provisions | 13 | Extended Slice | 14 |
| Village | 43 | Health | 7 | Alpha | 35 |
| Fortified Village | 2 | Work | 36 | Beta | 49 |
| Town | 33 | Safety | 15 | Final | 6 |
| City | 16 | Infrastructure | 27 | **Total** | **120** |
| Capital | 5 | Morale | 13 |  |  |
| Magical Metropolis | 1 | **Total** | **120** |  |  |

# Appendix C. Canonical Namespace and Migration Alias Register

| **Legacy or Transitional Form** | **Canonical Direction** | **Migration Rule** |
|---|---|---|
| `building.infrastructure.builder_supply_yard` | `building.construction.builder_supply_yard` | Preserve former ID as an alias; migrate definitions, blueprints, projects and instances. |
| `culture_kit.*` | `pack.culture.*` or a more specific `pack.*` family | Resolve legacy kit type from manifest metadata and retain source provenance. |
| `style_kit.*` | `pack.culture.*`, `pack.biome.*`, `pack.faction.*` or `pack.state.*` | Split mixed style data by actual responsibility during migration. |
| `bp.*` | `blueprint.<namespace>.<family>.<variant>` | Preserve original author/namespace and map old revision IDs. |
| `cluster.*` | `plan.cluster.*` or a blueprint module, depending on function | Use a plan only when it coordinates parcels/projects; use a module when it is nested source. |
| `district.*` | `plan.district.*` | Migrate runtime district instances separately from plan identity. |
| `settlement_plan.*` | `plan.settlement.*` | Preserve placed settlement-plan instance IDs. |
| Visual material names embedded in definitions | Semantic material roles plus resolved pack palettes | Do not migrate appearance into universal function identity. |

# Appendix D. Consolidated and Deferred Ideas

The earlier brainstorm contains many valid ideas that do not require independent universal definitions. They remain available as modules, source variants, pack signatures, specialist profiles or later conditional content.

| **Consolidated Idea Group** | **Registry Treatment** |
|---|---|
| Residential variations | Cabins, miner homes, fisher cottages, villas, noble houses, tower homes, houseboats, underground homes and assisted living use residential definitions plus culture, climate, household and service profiles. |
| Individual specialist shops | Butcher, cobbler, fletcher, bowyer, jeweller, engraver and similar trades use workshop, market or guild modules until their mechanics prove distinct. |
| Food-site variations | Orchards, vineyards, herb gardens, mushroom farms, apiaries, dairies and breweries use farm, food-workshop, preserving or pack variants. |
| Storage variations | Timber yards, ore yards, fuel depots, tool stores, armouries, cold stores and magical vaults use specialised-depot or warehouse branches/modules. |
| Road and bridge variations | Causeways, stairs, tunnels, suspension bridges, drawbridges and aqueduct bridges are network-piece families inside transport projects. |
| Faith and culture architecture | Chapels, temples, monasteries, ancestor halls and spirit houses use community, ritual and pack definitions rather than one universal religion tree. |
| Crime and conquest sites | Thieves' dens, smuggler stores, cult houses, occupation offices and resistance safehouses are faction/world-state variants unless they gain distinct universal mechanics. |
| Late transport | Rail, mountain lifts, airships, skyports and portal freight are branches under logistics, transit nexus, floating district and portal systems. |
| Forbidden facilities | Necromantic yards, blood engines, corruption laboratories and forced-labour sites remain conditional 20E/20G branches with explicit consequences. |
| Wonders | World trees, colossal golem foundries, grand archives, royal mints and culture monuments are signature forms of existing megaproject/wonder definitions. |

# Appendix E. Deferred Content Review Triggers

| **Idea Type** | **Review Trigger** |
|---|---|
| Specialist production branch | Promote only when it has a distinct input/output chain, staffing model, risk, planner demand or progression role. |
| Culture signature | Keep in 20G unless the same function is required across several cultures and cannot use an existing definition. |
| Transport or utility branch | Promote only when it requires its own network simulation, service capacity or stage expectation. |
| Crime or forbidden facility | Promote only when it drives a persistent economy, law, morality, faction or production system. |
| Megaproject or wonder | Use an existing megaproject definition unless it creates a new project graph, regional rule or world-state consequence. |
| Player-requested blueprint type | Validate against the closest definition first; expand only when the intended function cannot be expressed safely. |
| Repeated module use | Promote a module only when settlements plan, staff, maintain and balance it independently across multiple families. |

# Appendix F. Protected Forest Hamlet Scope Register

## F.1 Core Infrastructure Proof - 12

1. Campfire Site.
2. Small Tent.
3. Builder Supply Yard.
4. Small Cottage.
5. Basic Farm Plot.
6. Communal Kitchen.
7. Lumber Camp.
8. Carpenter Workshop.
9. Village Warehouse.
10. Dirt Path and Road Junction Set.
11. Village Well or Water Point.
12. Wooden Watchtower.

## F.2 Raid Extension - 4

1. Village Hall.
2. Guard Post.
3. Palisade Segment.
4. Village Gate.

## F.3 Extended Forest Hamlet - 14

1. Primitive Hut.
2. Farmhouse.
3. Barn.
4. Granary.
5. Healer Hut.
6. Small Shrine or Community Hall.
7. Mine Entrance.
8. Mason Yard.
9. Village Blacksmith.
10. Market Stalls.
11. Trading Post.
12. Small School.
13. Small Storehouse.
14. Mage Hut or Rune Workshop.

> **Version 0.2 Lock Summary**
>
> 120 universal definitions; 16 Technical POC entries; 14 Extended Slice entries; seven main settlement needs; Blueprint Forge source compatibility; stable migration-aware namespaces; and a staged production path from Camp to Magical Metropolis.

# v1.0 Final Catalogue Amendments

## A. Catalogue Count and Numbering

The v0.2 catalogue remains the **120-entry universal catalogue**.

No number is reused.

No valid generic function is removed because its old delivery group was retired.

Definitions may be deprecated only through Set-25 governance with:

- replacement/alias where required;
- save migration;
- blueprint/source migration;
- project/structure compatibility;
- multiplayer compatibility;
- explicit evidence that the gameplay function itself is obsolete.

## B. Stage Matrix Interpretation

Settlement stage means **earliest normal availability/readiness context**, not a hard prohibition on every unusual world.

Stage availability may be affected by:

- culture/faction/realm pack;
- world conditions;
- progression;
- resources;
- law/authority;
- technology/magic;
- player blueprint;
- scenario/world settings.

A low-tech culture may reach a universal need through a registered functional replacement.

A highly advanced generated civilisation may already possess later-stage infrastructure.

The stage matrix remains a planner/progression default, not a lore straitjacket.

## C. Seven-Needs Matrix Interpretation

The seven needs remain exactly:

1. Housing
2. Provisions
3. Health
4. Work
5. Safety
6. Infrastructure
7. Morale

20H may classify a definition's primary/secondary contributions.

Actual need contribution is calculated from functioning services, not catalogue presence.

A ruined hospital does not satisfy Health.

An empty barracks does not satisfy Safety.

A decorative market does not create Work or wealth.

A road that no mover can use does not provide effective accessibility.

## D. Required / Optional / Conditional Pools

The old fixed POC roster is no longer a global Required pool.

Production project pools should be classified by:

- universal settlement requirement;
- settlement-stage requirement;
- culture/realm substitution;
- site/environment condition;
- faction/government policy;
- economy/resource feasibility;
- threat profile;
- player choice;
- scenario/world-generation rule.

This preserves variety and prevents every settlement from becoming the same checklist.

## E. Forge Coverage

Every catalogue definition should eventually have sufficient approved source coverage for:

- functional validation;
- culture/biome/realm variation where needed;
- construction stages;
- damage states;
- dynamic states;
- accessibility;
- multiplayer/LOD;
- thumbnails/previews.

20G pack composition should reduce unnecessary duplicate source assets through material roles/modules.

## F. Production Backlog Priority

The backlog should prioritise:

1. missing universal functional coverage;
2. missing canonical registry dependencies;
3. missing Blueprint Forge source;
4. missing construction/damage states;
5. missing planner/commissioning validation;
6. missing culture/biome/realm coverage;
7. missing LOD/multiplayer evidence;
8. polish/variation.

A beautiful source with no valid function contract is not production-complete.

## G. Cross-Set Release Gates

A catalogue entry cannot be considered fully production-ready when it depends on an unresolved specialist interface.

Examples:

- port/vessel functions require Set-26 compatibility;
- market/tax/trade functions require Set-27 compatibility;
- dialogue/social/education/knowledge-facing functions require Set-28 compatibility;
- food/water/health/work-hazard functions require Set-29 compatibility;
- road/patrol/evacuation/transport functions require Set-30 compatibility.

The building can exist while the dependent service is unavailable or degraded.

## H. Archived Forest Hamlet Register

Appendix F's former “Protected Forest Hamlet Scope Register” is retained only as:

**Archived Forest Hamlet Regression Register.**

Its entries remain protected as generic catalogue content where otherwise valid.

The following are **not** protected production requirements:

- Forest Hamlet as mandatory settlement;
- Riverward as mandatory culture;
- Briarhook as mandatory enemy;
- fixed Day-4 raid;
- fixed resource placements;
- fixed NPC roster;
- fixed building coordinates;
- fixed progression chain.

## I. POC-to-Production Migration Rule

Any save/content/tooling field that still stores old milestone labels should migrate them to:

- current Set-25 lifecycle status; plus
- optional `legacy_provenance` metadata.

No gameplay query should ask “is this POC/Alpha/Beta?” to decide whether the content exists.

## J. Final Set-20 Diagnostics

| Code | Severity | Meaning |
|---|---|---|
| `20H-CATALOGUE-RENUMBER` | Fatal | Existing catalogue identity was renumbered without migration. |
| `20H-POC-DELETION` | Fatal | Valid generic function was removed solely because POC scope was retired. |
| `20H-LEGACY-SCOPE-ACTIVE` | Fatal | Old POC/Alpha/Beta scope is being used as current lifecycle authority. |
| `20H-NEED-HIDDEN-CAPACITY` | Fatal | Catalogue presence generated need contribution without functioning service. |
| `20H-OWNER-VIOLATION` | Fatal | Catalogue/backlog attempted to own specialist gameplay state. |
| `20H-BLOCKITEM-DUPLICATE` | Fatal | Duplicate Item identity exists for a recoverable Block. |
| `20H-SOURCE-MISSING` | Error | Production-required definition lacks required approved source coverage. |
| `20H-MIGRATION-MISSING` | Fatal | Deprecated/changed identity lacks required migration. |
| `20H-SPECIALIST-INTERFACE-MISSING` | Error | Entry is marked ready despite unresolved required specialist interface. |
| `20H-PACK-HIDDEN-FUNCTION` | Fatal | 20G pack introduced unregistered universal gameplay capacity. |

---

# v1.0 Final Set-20 Acceptance Checklist

- [x] Document 20 master reconciled.
- [x] 20A reconciled.
- [x] 20B reconciled.
- [x] 20C reconciled.
- [x] 20D reconciled.
- [x] 20E reconciled.
- [x] 20F reconciled.
- [x] 20G reconciled.
- [x] 20H reconciled.
- [x] 120-entry universal catalogue preserved.
- [x] stable catalogue numbering preserved.
- [x] seven-needs model preserved exactly.
- [x] old POC/Alpha/Beta milestone classes retired from active production authority.
- [x] generic former-POC functions protected from accidental deletion.
- [x] Forest Hamlet retained only as Archived Validation/regression context.
- [x] canonical Block/Item deduplication rule propagated.
- [x] 20A–20F detailed ownership retained.
- [x] 20G composition cannot create hidden gameplay functions.
- [x] Set-25 lifecycle/migration authority adopted.
- [x] Sets 26–30 specialist ownership adopted.
- [x] Blueprint Forge remains official editable source.
- [x] Document 19 remains settlement planner.
- [x] Document 20 remains ConstructionProject/function activation authority.
- [x] Document 12 remains persistent physical structure authority.
- [x] Godot + Summer Engine remains technical implementation authority.

---

# Document Set 20 v1.0 Completion Statement

**Document Set 20 v1.0 is reconciled.**

The system now has a clean production chain:

```text
120 stable universal catalogue definitions
→ detailed 20A–20F function contracts
→ 20G cultural/faction/biome/realm composition
→ Blueprint Forge source
→ settlement planning
→ authoritative ConstructionProjects
→ persistent physical structures
→ real staffed/supplied/connected services
→ seven-needs contribution
→ specialist-system consequences
```

The retired POC no longer controls production architecture.

Nothing valid was supposed to disappear merely because it once participated in the POC.

Former POC buildings survive as normal generic game content when their universal function remains valid.

The old Forest Hamlet scenario survives only where useful as a regression fixture.

The catalogue does not create hidden resources, jobs, people, movement, Health, wealth, combat strength, power, magic or political authority.

And the Block/Item registry boundary remains explicit:

**if a placed recoverable Block remains that Block when recovered, it is not duplicated as a separate Item definition.**

With 20H v1.0 complete, **Document Set 20 is ready to be packaged as the reconciled v1.0 production set.**
