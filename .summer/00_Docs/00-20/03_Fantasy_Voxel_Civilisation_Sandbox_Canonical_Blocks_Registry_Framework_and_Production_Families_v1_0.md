# LEYFORGE

## 03 - Canonical Blocks Registry Framework and Production Families

### Physical Voxel Identity, Block Families, Shapes, States, Inventory Projections and Cross-System Facets

**Version 1.0 - Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Supersedes:** `03_Fantasy_Voxel_Civilisation_Sandbox_Blocks_Registry_v0_1.md` for active production direction  
**Project Lead and Final Authority:** Ash

A production-scale, data-driven block authority for Leyforge defining what counts as a block, how stable block identities and families are structured, how shapes and mutable states are represented, how blocks enter inventories without creating duplicate Item definitions, how drops and transformations conserve resources, and how worldgen, structures, automation, magic, movement, biology, vessels, Forge presentation and save systems consume block truth without owning it twice.

> **Canonical Block Identity Rule**
>
> **A placeable thing whose authoritative identity is the placed voxel/block is defined once, as a Block. If breaking, dismantling, picking up or otherwise recovering it is intended to return that same placeable block, the inventory representation is a generated Block Inventory Projection referencing the same Block ID. It is not a second canonical Item definition.**

> **Physical-World Rule**
>
> A block definition owns placed-world physical and interaction truth. It may expose typed facets to other systems, but it does not own market price, biological consequence, movement execution, world distribution, structure meaning, recipe transformation, vessel motion or presentation art when another system owns those truths.

---

# Document Purpose

Document 03 is the production design authority for Leyforge's block domain. It replaces the original POC-era 80-120-entry planning registry with a family-first, stable-ID, pack-aware and migration-safe model aligned with the post-Atlas production architecture.

Version 1.0 preserves the strongest original decisions:

- voxel-first physical readability;
- one-metre-style default world cell as the primary grid reference while supporting authored shapes and sub-cell geometry where approved;
- mineable/placeable terrain and construction;
- data-driven parent definitions and material families;
- slabs, stairs, beams, posts, walls, rails, arches, windows, roof pieces and other approved shapes;
- block states, damage, repair, hazards and functional block entities;
- physical automation, power, storage and magic infrastructure;
- NPC construction, repairs and world-state evidence;
- realm-specific physical families;
- older materials remaining useful through distinct functions rather than pure stat obsolescence.

It removes or supersedes the original registry's POC-sized scope, Unreal asset paths, fixed POC planning flags, short-ID assumptions and duplicated block/item authoring model.

The most important new reconciliation is the **Block/Item identity boundary**. Older documents used a separately authored "block item form" for every placeable block. That model is now tightened by Foundation Decision **FR-00-20-006**: a recoverable block has one canonical Block identity, and inventory/storage/crafting systems reference a generated projection of that identity. A distinct Item definition exists only when the carried output is genuinely a different object or has an independently meaningful item lifecycle.

Document 03 therefore owns:

- canonical Block and Block Family identity;
- block-domain qualified IDs and legacy aliases;
- placed-world collision, support, gravity, replacement, placement and connection rules;
- block-eligible shapes and shape generation contracts;
- mutable block state and transformation boundaries;
- mining/harvest interaction contracts and drop references;
- Block Inventory Projection generation rules;
- block-entity eligibility and state-schema references;
- physical material facet references used by blocks;
- typed movement-surface, environmental, vessel, automation, mana and structure-facing facets where the block is the physical evidence provider;
- production family coverage inherited from Document 25H;
- migration and missing-definition behaviour for legacy block IDs;
- validation requirements for conservation, save safety, worldgen coverage, package removal and presentation readability.

It does **not** own:

- Item identities or item-instance behaviour that are genuinely distinct from blocks - Document 04;
- crafting/transformation formulas - Document 05;
- resource/material provenance, scarcity and progression ecology - Document 06;
- automation network simulation - Document 08;
- magic execution and mana-system formulas - Document 09;
- world distribution and procedural placement - Document 11 plus Atlas/Set 25 package rules;
- structure/blueprint spatial meaning - Documents 12, 19, 20 and Blueprint Forge;
- market values or prices - Set 27;
- biological effects - Set 29;
- movement and route execution - Set 30;
- water simulation, vessel physics or naval behaviour - Set 26;
- visual models, textures, materials, animation, audio or VFX - Forge/Presentation systems;
- engine storage implementation and runtime budgets - Document 18.

---

# Production Status and Authority

| Field | Reconciled Direction |
| --- | --- |
| Registry Model | Family-first canonical Block definitions with generated concrete entries and typed facets. |
| Identity | Stable qualified IDs; display names and file paths are never identity. |
| Primary Namespace | `leyforge.core.block.*` for Core definitions; approved expansion namespaces or extension facets for optional packages. |
| Block/Item Boundary | Recoverable same-block objects use Block Inventory Projections, not duplicate Item definitions. |
| Family Baseline | Document 25H's 217 family contracts are adopted as the Core Production family baseline: 188 Core Required, 26 Core Conditional, 3 Teaser Only. |
| Concrete Entry Direction | Concrete entries are canonical machine-readable registry records generated/admitted under family, material and shape contracts. This prose document governs them; it is not a second hand-maintained executable mirror. |
| Worldgen Boundary | Blocks expose eligibility and suitability references; Document 11/Atlas/worldgen own actual generation and distribution. |
| Resource Boundary | Deposits and block materials reference resource/material truth; Document 06 owns provenance, grade, purity and progression ecology. |
| Recipe Boundary | Blocks reference recipe/project IDs where needed; Document 05 owns transformations, costs and by-products. |
| Economy Boundary | Blocks may expose tradeability/ownership categories but never own dynamic prices or market valuation. |
| Biology Boundary | Blocks expose environment/hazard evidence only; Set 29 resolves biological consequence. |
| Movement Boundary | Blocks expose surface/support/climb/grapple/landing evidence; Set 30 resolves terrestrial movement. |
| Maritime Boundary | Blocks/materials expose vessel suitability and physical facets; Set 26 owns fluid/vessel simulation. |
| Forge Boundary | Gameplay definitions remain stable while Forge presentation may change independently through validated references. |
| POC Status | Forest Hamlet, fixed valley, named POC placements and POC Required/Alpha fields are Archived Validation only. Generic blocks and mechanics demonstrated there survive. |
| Engine Direction | Canonical authoring data compiles to validated Godot Resources/runtime data. Unreal asset paths are legacy migration evidence only. |

---

# Source and Supersession Hierarchy

For block-domain interpretation, use this order:

1. explicit approved project direction and later approved amendments;
2. Foundation Reconciliation Register v0.2, including FR-00-20-006;
3. Documents 00-02 v1.0 for production vision, loop and progression boundaries;
4. Document 25B for qualified IDs, namespaces, facets, source-of-truth ownership, migration and no-editable-mirror rules;
5. Document 25H for the approved production block-family intake and family coverage;
6. Documents 25C-25G and 25J-25L for schema, packages, capabilities, provenance, validation and implementation handoff;
7. Document Set 24 for Atlas world context and procedural relationships;
8. Document Sets 21-23 for Asset/Entity/Blueprint/Presentation Forge authoring and visual/runtime-product separation;
9. Documents 19-20 and companions for building functions, semantic markers, construction projects and settlement use;
10. Document Set 26 for maritime/water/vessel extension requirements;
11. Sets 27-30 for economy, social, biology and movement interfaces;
12. original Document 03 v0.1 and `VoxelRegistry.json` as legacy intent/migration evidence only;
13. Document 99 and fixed POC content as historical/regression evidence only.

> **Reconciliation Amendment to 25H/25I terminology**
>
> Where Set 25 says a block must have a "block item form", Document 03 v1.0 interprets that requirement as a **Block Inventory Projection** unless the portable result qualifies as a genuinely distinct Item under Document 04. This is a narrow terminology/ownership amendment required to satisfy FR-00-20-006 and Document 25B's one-owner/no-editable-mirror rule.

---

# Static Table of Contents

1. Locked Block Registry Identity  
2. Canonical Terminology  
3. Registry Architecture and Source of Truth  
4. Qualified IDs, Namespaces and Legacy Aliases  
5. Block Family, Concrete Entry and Runtime Cell Separation  
6. Block/Item Identity Boundary  
7. Block Inventory Projection System  
8. Breaking, Recovery, Drops and Transformation Modes  
9. Packed Stateful Blocks and Container Safety  
10. Parent Definitions, Composition and Facets  
11. Universal Block Definition Schema  
12. Material and Physical Property References  
13. Shapes and Shape Eligibility  
14. Placement, Rotation, Connection and Replacement  
15. Collision, Selection and Interaction Volumes  
16. Gravity, Support and Structural Rules  
17. Mining, Harvesting, Hardness and Tool Interfaces  
18. Damage, Repair and Condition States  
19. State, Overlay and Transformation Policy  
20. Block Entities and Persistent Stateful Blocks  
21. Ownership, Permissions, Reservations and Multiplayer Authority  
22. Terrain and Natural Blocks  
23. Geology and Deep-Layer Blocks  
24. Vegetation and Agriculture Blocks  
25. Fluids and Environmental Surface Blocks  
26. Resource Deposits and Nodes  
27. Construction and Decorative Families  
28. Functional, Crafting and Storage Blocks  
29. Automation, Logistics and Power Blocks  
30. Practical Magic and Realm Infrastructure  
31. Settlement, Route and Public Infrastructure  
32. Adventure, Defence and Hazard Blocks  
33. Culture, Biome, Realm and Historical Variation  
34. Atlas and World-Generation Handoff  
35. Structure, Blueprint and Construction Handoff  
36. Recipe, Resource and Item Handoff  
37. Economy, Ownership and Trade Handoff  
38. Biological/Environmental Handoff  
39. Movement Surface and Route Handoff  
40. Maritime and Vessel Material Handoff  
41. Forge, Materials, Audio/VFX and Presentation Handoff  
42. Save, Migration, Missing Definitions and Optional Packs  
43. LOD, Distant Simulation and Runtime Authority  
44. Performance and Entry-Multiplication Controls  
45. Production Family Catalogue Baseline  
46. Concrete Entry Admission and Generated Registry Contract  
47. Legacy VoxelRegistry Migration  
48. Archived POC Conversion Rules  
49. Validation and Release Gates  
50. Cross-Registry Duplicate Audit  
51. Change-Control Record  
52. Open Balance/Data Decisions  
53. Definition of Done  
Appendix A. Core Production Block-Family Register  
Appendix B. Shape Eligibility and State Profiles  
Appendix C. Block Definition Template  
Appendix D. Block Inventory Projection Template  
Appendix E. Break/Drop Contract Template  
Appendix F. Movement Surface Facet  
Appendix G. Vessel Material Extension Facet  
Appendix H. Duplicate-Audit Rules  
Appendix I. Legacy Migration Examples


# 1. Locked Block Registry Identity

The Blocks Registry is the authoritative physical-voxel definition layer for Leyforge. A Block definition answers what a placed cell or placed multi-cell block **is**: how it occupies space, how it can be placed or replaced, which shapes it supports, how it is mined or harvested, what persistent state it may hold, which physical facets it exposes and what happens when it is damaged, repaired, transformed or recovered.

It is not an item catalogue, a biome distribution table, a recipe book, a structure blueprint, a market catalogue or a visual asset database.

> **Locked Rule - One Physical Identity**
>
> If the player can place a thing as a block and later recover that same thing as the same placeable object, there is one canonical Block definition. Inventory systems carry a reference to that Block; they do not create another canonical Item whose only purpose is to point back at it.

This makes the common player experience simpler while making the data architecture safer. The player may still see "Oak Planks x64" in a hotbar. Internally, that stack can be a block-reference stack. There is no requirement for a second editable `item.oak_planks_block` record that duplicates name, material, icon, stack behaviour, placement target and other fields.

## 1.1 Identity layers

| Layer | Meaning | Example |
| --- | --- | --- |
| Block Family | Shared executable contract for related physical blocks. | `leyforge.core.block.family.construction.timber` |
| Concrete Block Entry | Canonical placeable/minable definition beneath a family. | `leyforge.core.block.construction.timber.oak.plank.full` |
| Block Inventory Projection | Generated inventory/storage/crafting representation of that same Block ID. | `definition_kind=block`, reference to the oak-plank block ID |
| Runtime Block Cell/Placement | Saved placed instance/state in a world or mobile voxel frame. | cell + block ID + compact state |
| Block Entity | Persistent record for state too complex for compact cell state. | chest inventory, furnace process, mana battery |
| Material Profile | Reusable physical/material properties referenced by blocks. | oak timber, limestone, glass, iron |
| Shape Profile | Approved geometric form and collision/placement policy. | full, slab, stair, beam, wall |
| State Profile | Allowed mutable state fields and transitions. | facing, wet, open, powered, damaged |
| Presentation Profile | Visual/audio/VFX references resolved through Forge. | model/material/sound set |

## 1.2 What makes a new Block definition justified

Create a distinct Block definition when at least one of these changes materially:

- placed collision or occupied-cell topology;
- placement rules or connection behaviour;
- harvest/mining interaction class;
- drops or transformation identity;
- gameplay capability;
- block-entity class;
- save compatibility or authoritative state schema;
- permission/service meaning that cannot be represented safely as state;
- a shape is authored rather than deterministically generated and behaves differently enough to require its own entry.

Do **not** create a new Block definition merely because of:

- texture colour;
- minor moss, frost, dust, soot or weathering;
- biome palette;
- culture trim or symbol;
- cosmetic age;
- seasonal presentation;
- rarity label used elsewhere;
- a Forge model/material replacement that preserves gameplay contract.

# 2. Canonical Terminology

| Term | Production Meaning |
| --- | --- |
| **Block** | Canonical placed-world voxel/placeable definition. |
| **Block Family** | Stable qualified definition owning shared defaults for related Blocks. |
| **Concrete Block Entry** | An executable Block definition admitted beneath a family. |
| **Block Inventory Projection** | Generated carried/inventory view of a Block; not an Item Registry definition. |
| **Distinct Item** | Canonical non-block carried object/resource/equipment record owned by Document 04. |
| **Self-Recovery** | Breaking/recovering a Block produces a Block Inventory Projection referencing itself. |
| **Non-Self Drop** | Breaking/harvesting produces one or more distinct Item/resource outputs or another Block. |
| **Packed Block State** | Approved portable state payload attached to a Block Inventory Projection without creating another Item identity. |
| **State** | Mutable instance data preserving definition identity. |
| **Overlay** | Compatible surface/state layer that does not own the underlying Block identity. |
| **Transformation** | Validated transition into a different Block or output identity. |
| **Block Entity** | Persistent runtime record referenced by a Block placement for complex state. |
| **Facet** | Typed field group exposed by the Block to another owning system. |
| **Structure Module** | Blueprint/grammar arrangement referencing Blocks; not a Block itself. |
| **Component Role** | Semantic role such as support, port, socket, door, route edge, ward anchor or vessel role. |
| **Generated Entry** | Deterministically produced concrete Block from family/material/shape profiles. |
| **Authored Entry** | Concrete Block requiring bespoke executable behaviour or geometry contract. |

# 3. Registry Architecture and Source of Truth

The production registry uses one-way derivation:

```text
Authoritative Block Family / Concrete Definition
        + referenced material/shape/state/facet profiles
        + enabled content-pack context
        -> validation and deterministic compilation
        -> generated Godot Resource/runtime record
        -> presentation resolution through Forge
        -> runtime block placement/state
```

No generated runtime Resource, Forge visual override, spreadsheet export, inventory projection, thumbnail database or save cache may become an editable competing source of block truth.

## 3.1 Required authoring layers

| Layer | Authority |
| --- | --- |
| Canonical block authoring data | Document 03 domain / approved registry tooling |
| Material/resource truth | Document 06 / material registries |
| Recipes and transformations | Document 05 |
| Worldgen distribution | Document 11 / Atlas / world manifests |
| Blueprint spatial composition | Documents 12/19/20 and Blueprint Forge |
| Gameplay presentation | Forge/Presentation registries |
| Generated Godot Resources | Build product; replaceable |
| Runtime cell state | Authoritative world save/runtime owner |

## 3.2 No editable mirrors

The following are prohibited as independent editable mirrors:

- duplicate Item entries for ordinary recoverable blocks;
- a second block list inside worldgen;
- hard-coded block properties inside a blueprint file;
- machine scripts that redefine block hardness/material truth;
- Forge visual files that silently change gameplay properties;
- save files storing mutable copies of immutable definition fields;
- old `VoxelRegistry.json` becoming the active source after v1.0 migration.

# 4. Qualified IDs, Namespaces and Legacy Aliases

Core family IDs follow:

`leyforge.core.block.family.<category>.<path>`

Concrete entries follow the registered block domain without the family marker where practical:

`leyforge.core.block.<category>.<path>.<material_or_variant>.<shape>`

Examples are illustrative until emitted by the canonical concrete-entry dataset:

- `leyforge.core.block.terrain.stone.limestone.natural`
- `leyforge.core.block.construction.masonry.limestone.stair`
- `leyforge.core.block.infrastructure.road.stone.full`
- `leyforge.core.block.magic.mana.conduit.standard`

IDs are never derived from display names. Once referenced by a save, migration fixture, blueprint, recipe, package or compatibility test, an ID is frozen. Renames use aliases; removals use tombstones; splits/merges use explicit migration mappings; IDs are never recycled.

## 4.1 Legacy aliases

The original `VXL_BLK_*` and dotted POC IDs may remain as migration aliases only where a valid production Block replacement exists. Unreal `/Game/...` asset paths are not carried into canonical identity. The migration layer records the legacy ID, target qualified ID, migration revision and any state conversion required.

# 5. Block Family, Concrete Entry and Runtime Cell Separation

A family is not a placed block. A concrete entry is not a runtime instance. Runtime state is not a definition.

| Concern | Family | Concrete Entry | Runtime Placement |
| --- | --- | --- | --- |
| Stable category/role | Owns defaults | Inherits/refines | References |
| Material | Allowed/default profiles | Exact reference | Never copies immutable profile |
| Shape | Eligible profile | Exact shape | Orientation/state only |
| Hardness/tool class | Default band | Exact override if needed | Damage progress only |
| Ownership | Capability fields | Permission profile link | Current owner/claim state |
| Damage | Allowed states | State schema | Current damage state |
| Inventory | Projection policy | Projection descriptor | Not applicable while placed |
| Save ID | Family referenced indirectly | Stable definition ID | Cell references exact Block ID |

# 6. Block/Item Identity Boundary

The boundary is determined by **canonical identity**, not by whether an object can appear in an inventory.

## 6.1 Block-only with generated projection

Use only a Block definition when:

- the object is fundamentally a placeable voxel/placeable;
- recovery is intended to yield that same object;
- carried use is primarily selecting, storing, transporting, trading or placing the same Block;
- any portable state can safely be represented by an approved packed-state payload.

Examples: ordinary planks, bricks, roof pieces, glass, doors, workstations that pack as themselves, rails, pipes, conduits, road pieces, ladders and many placeable machines.

## 6.2 Block plus distinct Item

Both identities are correct when they are genuinely different things:

- ore/deposit Block -> Raw Ore Item;
- crop Block -> harvested food/seed Items;
- leaves -> sticks/saplings/plant Items;
- crystal node -> Crystal/Shard Item;
- rubble Block -> salvage fragments Item;
- filled vessel/container Block -> extracted fluid/resource Item where the fluid is inventory-carried separately;
- a placement kit Item that has independent use/state and constructs a different placed Block/structure by an authoritative recipe or project transaction.

## 6.3 Item that can place a Block does not automatically become a Block

Some Items may have a placement action yet remain Items if their primary lifecycle is item-like. A ritual token, portable trap kit, seed, construction kit or deployable device may be an Item that creates/places another definition. Document 04 owns that Item; Document 05 owns the transformation/placement cost; Document 03 owns the resulting Block.

# 7. Block Inventory Projection System

A Block Inventory Projection is a generated view, not a new content definition.

Minimum projection fields:

```text
definition_kind: block
block_definition_id
quantity
stack_profile_id
inventory_icon_reference
inventory_display_reference
placement_action_profile_id
carried_state_schema_id?
instance_payload?
source_definition_revision
projection_schema_version
```

The display name, description, material, placement target, base tags and presentation are resolved from the Block definition and its referenced profiles. They are never manually retyped into a duplicate Item record.

## 7.1 Projection generation

Projection generation occurs only for Blocks marked `inventory_projection_policy != none`. Technical air, world boundaries, blueprint ghost cells and protected hidden anchors normally have no player projection.

## 7.2 Projection stacking

Exact stack limits remain balance data. A projection references a stack profile rather than assuming all Blocks stack to one universal number. Stateful packed Blocks may be non-stackable or stack only when their portable payloads are identical and the policy explicitly permits it.

## 7.3 Trading and contracts

Set 27 may value, buy, sell, tax, reserve or contract for a Block Inventory Projection using the canonical Block ID. No separate Item identity is required to participate in commerce.

# 8. Breaking, Recovery, Drops and Transformation Modes

Every breakable/harvestable Block declares one authoritative output mode.

| Mode | Result |
| --- | --- |
| `SELF_BLOCK` | Returns a projection of the same Block ID. |
| `SELF_BLOCK_PACKED` | Returns same Block ID plus approved portable state payload. |
| `OTHER_BLOCK` | Returns projection(s) of another Block ID. |
| `ITEM_OUTPUT` | Returns one or more distinct Item/resource identities. |
| `MIXED_OUTPUT` | Combination of Block projections and distinct Items. |
| `TRANSFORM_IN_WORLD` | Replaces itself with another Block/state instead of inventory output. |
| `NO_RECOVERY` | No recoverable output, with explicit reason. |
| `SYSTEM_TRANSACTION` | Output owned by a specialised dismantle/project/salvage transaction. |

Drop quantity, tool qualification, fortune/yield modifiers and by-products are referenced to the owning harvest/recipe/resource systems; Document 03 defines the output identity contract and conservation boundary.

## 8.1 No hidden duplicate outputs

A Block using `SELF_BLOCK` may not also point at a separate `item.block.<same thing>` record. Validation treats that as a duplicate-identity defect.

# 9. Packed Stateful Blocks and Container Safety

Complex Blocks require explicit pickup behaviour.

A chest, machine, mana device or similar Block may use one of these policies:

- **Empty Before Pickup:** contents/active process must be removed or resolved before self-recovery;
- **Packed State:** approved compact state travels with the same Block projection;
- **Dismantle Transaction:** specialist system converts the Block into safe outputs/components;
- **Immovable/Protected:** normal pickup is prohibited;
- **Structure-Owned:** removal is handled by construction/structure systems rather than ordinary mining.

Packed state must never duplicate contained resources. If a chest is packed with inventory inside, the transaction atomically removes the placed chest and transfers exactly one chest Block projection plus the authoritative contained inventory payload. A failure rolls back or quarantines; it never leaves both placed and carried copies.

# 10. Parent Definitions, Composition and Facets

Use shallow inheritance plus composition. Deep inheritance chains are prohibited where final behaviour becomes difficult to inspect.

A concrete Block normally composes:

- one abstract parent behaviour;
- one material/physical profile;
- one shape profile;
- zero or one compact state profile plus declared extension states;
- drop/recovery contract;
- inventory projection policy;
- presentation contract;
- optional block-entity schema;
- optional automation/power/mana ports;
- optional movement-surface facet;
- optional environmental hazard facet;
- optional vessel-material facet;
- optional structure/blueprint semantic roles;
- ownership/permission hooks where required.

# 11. Universal Block Definition Schema

Every admitted concrete Block requires, directly or by inheritance:

| Field Group | Required Data |
| --- | --- |
| Identity | `block_id`, family ID, schema/version, namespace owner, localisation keys, aliases/tombstones. |
| Classification | category, parent, tags, package membership, production classification. |
| Material | material profile reference, physical classes, resource/material handoff. |
| Shape | exact shape profile, occupied volume, orientation, collision generation. |
| Placement | placement surfaces, replaceability, support, connection, snapping, water/air coexistence policy. |
| Interaction | selection, use/interact profile, tool/harvest class, hardness band, mining feedback. |
| Recovery | break/drop mode, output refs, packed-state policy, conservation profile. |
| Inventory | projection policy and stack profile when applicable. |
| State | compact state schema, allowed transitions, damage/repair, overlays, block-entity reference. |
| Services | storage/machine/mana/power/route/structure roles as typed references, not duplicated simulation. |
| World | natural-generation eligibility and suitability references; no copied distribution tables. |
| Authority | owner/permission hooks, reservation/project fields, multiplayer mutation class. |
| Presentation | presentation contract/profile refs, sound/VFX event hooks, accessibility cue obligations. |
| Validation | schema profile, drop-conservation tests, migration fixtures, performance class, package tests. |

# 12. Material and Physical Property References

Document 03 requires physical properties needed to interact with a Block, but resource provenance and progression remain Document 06-owned.

Typical block/material properties include:

- tool interaction class;
- hardness band;
- impact/resistance class;
- density/mass band where needed by physics;
- flammability/fire profile reference;
- transparency/opacity;
- light transmission/emission;
- permeability/sealing class;
- corrosion/weathering compatibility;
- friction/traction surface category;
- sound/footstep material profile reference;
- attachment/joint profile;
- magic conductivity/stability references where relevant.

Use named bands and validated profiles rather than invented fake precision until prototypes justify numeric curves.

# 13. Shapes and Shape Eligibility

The default voxel grid remains one metre-style in world design terms, but Blocks may use approved shapes and authored collision.

Core shape vocabulary includes:

- full cube;
- slab/half-height forms;
- stair;
- slope/wedge;
- beam;
- post/pillar;
- wall;
- fence/railing;
- arch;
- panel/window;
- roof forms;
- hatch/door/gate forms;
- pipe/conduit/chute/rail forms;
- furniture-sized or machine-specific authored forms;
- blueprint-only technical markers that do not become player inventory Blocks.

No family automatically receives every shape. Shape generation must be explicitly allowed by the family profile.

## 13.1 Shape identity

A shape may be a generated concrete Block entry when it changes collision/placement enough to require an executable definition. Cosmetic mesh variation under the same collision and gameplay behaviour remains presentation variation.

# 14. Placement, Rotation, Connection and Replacement

Each Block declares:

- valid placement support classes;
- face/edge/cell snapping policy;
- rotation axes and canonical orientation;
- multi-cell occupancy if applicable;
- connection masks for fences, pipes, conduits, rails, roads or machines;
- replaceable target categories such as air, snow layer or vegetation;
- fluid coexistence/waterlogging policy where supported;
- collision-safe preview requirements;
- permission checks;
- project/reservation restrictions;
- atomic placement transaction requirements.

Player placement, NPC construction, blueprint placement and worldgen use the same canonical Block definition, even when their authority and validation pipelines differ.

# 15. Collision, Selection and Interaction Volumes

Collision truth belongs to the Block/shape contract or a validated generated product derived from it. Presentation meshes may not silently change gameplay collision.

Separate profiles may exist for:

- world physics collision;
- actor navigation collision;
- selection/target outline;
- interaction/use ray target;
- projectile/attack hit response;
- fluid boundary/sealing;
- vessel structural scan occupancy.

Where a Forge visual changes geometry, contract validation must confirm that required collision/anchors remain compatible.

# 16. Gravity, Support and Structural Rules

Leyforge retains the original readable voxel rule: **ordinary land construction does not use universal structural collapse**.

Gravity applies only to families/profiles that explicitly opt in, such as loose sand/gravel-like materials, falling debris or specialist hazards.

Support contracts may still matter for:

- ladders and climbables;
- attached torches/signs/fixtures;
- bridges or project validation;
- hanging ropes/cables;
- rails and powered transport;
- vessel structural analysis;
- explicitly simulated collapsible structures/hazards;
- Blueprint Forge validation.

The absence of global collapse does not prevent specialised systems from validating support where their gameplay requires it.

# 17. Mining, Harvesting, Hardness and Tool Interfaces

Blocks expose physical interaction evidence:

```text
harvest_action_class
required_capability_refs[]
preferred_tool_tags[]
hardness_band
harvest_time_profile
recoverability_mode
drop_contract_id
damage_feedback_profile
special_interaction_tags[]
```

Document 02 may own progression modifiers, Document 06 material capability, Document 04 tools, and Document 05 transformations. Document 03 does not duplicate those systems.

Low-capability interaction should normally fail clearly, produce reduced yield only where explicitly designed, or take longer; it must not silently delete rare resources because an undocumented tool rule was missed.

# 18. Damage, Repair and Condition States

Blocks may support damage states such as:

- intact;
- scratched/worn;
- cracked;
- damaged;
- burnt/charred;
- corroded;
- saturated;
- broken;
- ruined;
- repaired;
- corrupted/blighted/cleansed where the owning system allows.

Whether these are states, overlays or transformations depends on whether identity and core behaviour remain the same.

Repair consumes real resources through Document 05/project transactions. A visual repair animation cannot restore authoritative condition by itself.

# 19. State, Overlay and Transformation Policy

Prefer state/overlay when material and gameplay identity remain the same. Create another definition/transformation when collision, drops, capability, simulation class or save contract changes materially.

Examples:

| Same Identity - State/Overlay | Different Identity - Transformation |
| --- | --- |
| wet stone | stone broken into rubble |
| snow-dusted roof | roof burnt into charred debris if the debris has different drops/collision |
| powered conduit | conduit melted into scrap Block/Items |
| owned chest | chest transformed into wreckage |
| reversible moss | permanent living-root conversion with new capability |
| light damage | structural breach state that becomes a different vessel boundary class if required by schema |

# 20. Block Entities and Persistent Stateful Blocks

A Block Entity is used when compact cell state is insufficient.

Typical Block Entities:

- inventories/storage;
- crafting stations with queues;
- active machines;
- batteries/tanks;
- mana devices;
- portals/anchors;
- project/construction markers;
- signs/books/displays with bounded content references;
- logic/control nodes;
- special adventure mechanisms;
- route/transport nodes where the infrastructure owner requires persistent local state.

The Block definition owns which schema may attach. The owning gameplay system owns the detailed runtime behaviour of that schema.

# 21. Ownership, Permissions, Reservations and Multiplayer Authority

A Block may expose hooks for:

- owner/claim reference;
- permission profile;
- settlement/faction authority;
- construction-project reservation;
- inventory access policy;
- machine configuration authority;
- repair/dismantle permission;
- protected/system anchor status;
- multiplayer mutation class.

Document 03 does not decide legal consequences, social reactions or market restitution. It supplies the physical target and authority evidence consumed by the relevant owners.

# 22. Terrain and Natural Blocks

Terrain families must support procedural generation without embedding procedural coordinates or fixed maps.

Required concerns include:

- topsoil/turf/soil/substrate differentiation;
- fertility/moisture/environment references;
- loose versus compact ground;
- cave/deep-layer compatibility;
- transitions between surface and subsurface materials;
- mining/terraforming;
- path/road conversion where allowed;
- movement surface facets;
- hazard/environment evidence.

Forest Hamlet terrain is not a production family. Meadow turf, forest loam, marsh mud, limestone and similar generic families are.

# 23. Geology and Deep-Layer Blocks

Geology blocks provide physical rock, aggregate and deep-layer families. Worldgen owns where they occur; Document 06 owns material/resource progression and provenance.

Geology families must expose:

- rock/material profile;
- tool/hardness class;
- shape eligibility for construction where allowed;
- ore/deposit hosting compatibility;
- cave/weathering variants as state/presentation where possible;
- realm or deep-layer suitability references;
- collapse/falling behaviour only when explicitly enabled.

# 24. Vegetation and Agriculture Blocks

Vegetation uses blocks where the world-facing identity is voxel/placeable/growable terrain content. Harvested produce normally becomes distinct Items/resources.

Examples:

- logs/trunks may self-recover as Blocks or output log Items only if Document 04 deliberately defines a distinct carried resource identity; the chosen model must be one canonical path, not both;
- leaves usually use Item outputs such as sticks, saplings or reagents rather than duplicate leaf Items;
- crops are growth-state Blocks whose harvest outputs are Items/resources;
- trellises/supports are usually recoverable Blocks with projections;
- living realm materials may use growth/season state profiles rather than multiplying entries.

# 25. Fluids and Environmental Surface Blocks

Document 03 owns the block/cell identity and physical interfaces required by the voxel world. Detailed fluid simulation is owned by Set 26B for water/liquid systems and other specialist systems where applicable.

A fluid/environment Block may expose:

- fluid/material identity reference;
- occupancy/replaceability;
- collision/interaction class;
- flow/simulation provider reference;
- transparency/presentation contract;
- environmental hazard tags;
- movement surface/contact facet;
- freezing/boiling/transformation refs where designed.

Base water/coast compatibility remains available without requiring the full maritime expansion package; detailed tides, currents, waves, vessel response and flooding are not reimplemented here.

# 26. Resource Deposits and Nodes

Deposit Blocks are physical world sources, not the same identity as their extracted resource Items.

A deposit family references:

- resource/material definition;
- grade/purity provider fields where the resource system owns them;
- extraction capability requirements;
- depletion/regeneration model reference;
- worldgen suitability;
- surface clue role;
- automation extraction compatibility;
- drop/harvest contract;
- aftermath or depleted-state transformation.

This is one of the clearest Block+Item cases: `Iron Ore Deposit Block` and `Raw Iron Ore Item` are legitimately distinct.

# 27. Construction and Decorative Families

Construction families are family-first and shape-governed. A material does not automatically create every possible shape.

Material/culture/biome variation should preferentially use:

- material substitution;
- palette tokens;
- presentation variants;
- trim/overlay kits;
- compatible shape generation;
- Blueprint Forge composition.

A new executable Block is justified only where behaviour/geometry contract actually differs.

# 28. Functional, Crafting and Storage Blocks

Functional Blocks include physical stations and service endpoints such as:

- work surfaces/workbenches;
- furnaces/forges/kilns;
- rune/alchemy/enchanting stations;
- chests/crates/barrels/warehouses;
- crafting/project markers;
- repair/maintenance stations;
- agriculture/processing stations;
- public-service interfaces where they have a true placed Block identity.

Document 03 owns their placed Block and block-entity schema reference. Documents 05, 08, 09, 20 and other owners define what the service actually does.

# 29. Automation, Logistics and Power Blocks

Automation Blocks may expose:

- item/fluid/energy/mana ports;
- facing and connection rules;
- capacity interface references;
- control/signal roles;
- machine block-entity schema;
- maintenance/damage states;
- ownership/permissions;
- visible flow presentation hooks.

Document 08 owns logistics/power simulation. Document 03 must not calculate throughput, fuel burn, network scheduling or machine recipes.

# 30. Practical Magic and Realm Infrastructure

Magic Blocks include physical rune substrates, inscribed rune blocks, wardstones, ward lanterns, mana conduits/storage, leyline anchors, cleansing anchors, portal frames/anchors and approved realm infrastructure.

They expose:

- physical placement/collision;
- mana/magic interface facets;
- state/charge presentation hooks;
- block-entity schema reference where needed;
- corruption/cleansing compatibility;
- ownership/project links.

Document 09 owns magical execution, mana rules, rituals, ward calculations and portal behaviour.

# 31. Settlement, Route and Public Infrastructure

Blocks may physically realise:

- paths and roads;
- bridge decks/supports;
- tunnels/linings;
- fences, gates and palisades;
- beacons, lanterns, signs and milestones;
- wells/cisterns/irrigation;
- market fixtures;
- raised walkways, levees and agricultural supports.

Document 20 and related infrastructure documents own service meaning. Set 30 consumes movement-facing route/surface facets. A road Block does not decide long-distance travel time by itself.

# 32. Adventure, Defence and Hazard Blocks

Families include:

- locks and sockets;
- levers/sensors;
- puzzle/rune sockets;
- hidden passages;
- trap launchers/spikes;
- hazard emitters;
- loot containers;
- altars/shrines;
- tomb/memorial markers;
- ancient mechanisms;
- corruption/blight/rot growth;
- fire/heat sources;
- ward barriers and refuge shutters.

Threat, combat, loot, quest and biological consequences remain externally owned. The Block supplies physical evidence and interaction hooks.

# 33. Culture, Biome, Realm and Historical Variation

Culture and context should enrich presentation and composition without exploding executable IDs.

Prefer:

```text
Block definition
  + material profile
  + culture presentation kit
  + biome/realm state or presentation profile
  + runtime condition overlay
```

rather than four copied Block definitions with the same behaviour.

A culture-specific Block becomes distinct only if the physical/gameplay contract is meaningfully different, not because its trim is dwarven, elven, frontier, Verdant or another visual identity.

# 34. Atlas and World-Generation Handoff

Document 03 exposes:

- generation eligibility;
- suitability tags/references;
- transition compatibility;
- surface/deep-layer role;
- deposit-host role;
- ecology/vegetation substrate roles;
- protected/technical exclusions.

Document 11/Atlas/world manifests decide:

- which biome/region uses which palette;
- frequency and distribution;
- depth bands;
- climate/geology relationships;
- seed-generated adjacency;
- structure/site placement;
- realm-specific generation.

No Block definition contains fixed Forest Hamlet coordinates or guaranteed POC placements.

# 35. Structure, Blueprint and Construction Handoff

Structures and blueprints reference canonical Block IDs or approved semantic material/shape tokens that resolve to them.

Document 03 supplies:

- block identity;
- shapes/collision;
- material and state capability;
- markers/sockets/roles permitted on the block;
- repair/damage interfaces;
- inventory projection for construction stock.

Blueprint/structure systems own spatial arrangement, rooms, modules, culture layouts, construction stages, semantic building function and persistent structure identity.

# 36. Recipe, Resource and Item Handoff

The three boundaries are strict:

**Document 03 -> Document 04**
- exposes distinct Item obligations only for non-self drops, harvested outputs, components and genuinely item-like portable objects;
- does not request duplicate Items for ordinary Blocks.

**Document 03 -> Document 05**
- exposes Block inputs/outputs directly by Block ID;
- recipes may output a Block Inventory Projection simply by outputting the canonical Block definition kind/reference;
- no fake intermediate block-item ID is required.

**Document 03 -> Document 06**
- references material/resource provenance and physical profiles;
- does not own scarcity, ore ecology, grade/purity progression or resource-chain balance.

# 37. Economy, Ownership and Trade Handoff

A Block or Block projection may expose economic descriptors such as:

- tradeable/not tradeable;
- stolen/claimed ownership reference;
- commodity family tags;
- legal/restricted category references;
- provenance/custody data where needed;
- bulk/cargo classification.

Set 27 owns actual value, price formation, tax, contract settlement, market demand and finance.

# 38. Biological/Environmental Handoff

Blocks expose environmental facts, not body outcomes.

Possible facts include:

- hazard tags;
- heat/cold source class;
- wetness/contact class;
- toxin/poison/environment substance tags;
- sharp/burning/corrosive contact tags;
- air/water/realm context references;
- shelter/environment coverage evidence where owned by structures/world systems.

Set 29 converts those facts into authoritative biological results.

# 39. Movement Surface and Route Handoff

Set 30 owns terrestrial/aerial movement execution and route accessibility. Document 03 is the physical evidence provider for block surfaces.

Blocks may expose the Set 30 movement-facing Surface Facet:

```text
surface_type
support_validity
slope
speed_modifier
traction_modifier
braking_modifier
slip_band
step_override?
noise_tags[]
hazard_tags[]
climb_surface_category?
grapple_surface_category?
landing_response_class?
reason/source_ref
revision
```

Document 03 owns or references the physical surface facts. Set 30 decides how a particular mover responds to them.

Road/route infrastructure additionally exposes its physical condition to the infrastructure/route owner, which then supplies Set 30's Route Facet. A Block is not itself the whole route graph.

# 40. Maritime and Vessel Material Handoff

Set 26 does not require special ship-only Blocks. Ordinary approved Blocks may participate in vessel construction when their material and attachment facets support the intended structural role.

Blocks/materials eligible for vessel analysis may expose the Set 26 vessel extension facet:

```text
dry_mass_per_solid_volume
solid_volume_fraction_by_shape
longitudinal_strength_band
transverse_strength_band
shear_and_joint_band
rigidity_band
flexibility_band
impact_toughness_band
sealing_profile
absorption_profile
corrosion_profile
fire_profile
attachment_face_profile
ballast_suitability
vessel_role_suitability
magic_conductivity_and_stability
damage_multipliers_by_state
repair_and_salvage_tags
```

Document 03/06 own or reference the base physical truth. Set 26F consumes it for vessel structural analysis. Set 26G owns buoyancy, stability, propulsion and motion. Set 26B owns detailed water/fluid behaviour.

# 41. Forge, Materials, Audio/VFX and Presentation Handoff

Gameplay definition IDs remain stable while presentation can change independently.

A Block may require:

- model/profile reference;
- material/texture profile;
- icon generation source;
- placement preview;
- state presentation mappings;
- damage visual layers;
- animation event hooks;
- audio/VFX event hooks;
- accessibility-equivalent cue requirements;
- socket/anchor contracts.

Forge may override or vary these within validated contracts. It may not silently change recipes, inventory identity, hardness, ports, ownership, collision requirements or authoritative block state.

# 42. Save, Migration, Missing Definitions and Optional Packs

Saves store stable Block IDs and runtime state, not fragile asset paths.

Required behaviour:

- missing optional definitions resolve to a visible/inspectable recovery Block with the original qualified ID and payload preserved;
- unknown extension facets are preserved/quarantined where safe rather than discarded;
- aliases migrate deterministically;
- tombstoned definitions never silently map to unrelated new content;
- optional expansion removal does not corrupt base blocks;
- reinstall may restore quarantined definitions when hashes/schema are compatible;
- state schema migrations are explicit and testable.

# 43. LOD, Distant Simulation and Runtime Authority

Most ordinary Blocks need no per-tick distant simulation. Stateful Blocks participate through their owning systems' LOD contracts.

Examples:

- storage preserves authoritative inventory;
- machines preserve transaction/process state;
- mana infrastructure preserves required network summary;
- projects preserve reserved stock/stage state;
- hazards preserve meaningful spread/aftermath state;
- vessel Blocks preserve mobile-frame membership and structural evidence;
- ordinary terrain remains compact voxel data.

Demotion may reduce representation, never identity or conserved state.

# 44. Performance and Entry-Multiplication Controls

The registry must avoid combinatorial explosion.

Controls:

- family-first authoring;
- only eligible shapes generated;
- visual/culture/weather variants prefer profiles/overlays;
- states remain runtime fields when identity is unchanged;
- connected shapes use deterministic generation where possible;
- block entities are reserved for real stateful needs;
- content packs load only admitted definitions;
- runtime palettes use compact IDs after registry compilation;
- presentation variants resolve separately from gameplay identity.

A family count is not an instruction to create every family x material x shape x culture x state combination.

# 45. Production Family Catalogue Baseline

Document 25H established 217 approved family contracts as the production intake:

- 188 Core Required;
- 26 Core Conditional;
- 3 Teaser Only.

Document 03 v1.0 adopts those family IDs and categories as its baseline. The family register appears in Appendix A so the Foundation no longer relies on the short POC list.

Set 26 detailed maritime content remains an extension/admission domain. Its physical requirements are consumed through facets and approved expansion definitions without making the base game depend on one maritime package.

# 46. Concrete Entry Admission and Generated Registry Contract

The executable concrete registry is machine-readable canonical data governed by this document, not a manually duplicated prose list.

Each admitted entry must:

1. resolve to one approved family;
2. use one stable qualified Block ID;
3. reference exact material and shape profiles;
4. declare state/drop/projection policies;
5. pass duplicate Block/Item validation;
6. pass package/dependency validation;
7. compile deterministically into Godot/runtime records;
8. expose a semantic hash/revision;
9. have migration behaviour if replacing a legacy ID;
10. have representative placement/break/save tests.

This arrangement satisfies the Set 25 requirement for exact concrete records without creating another hand-maintained list inside design prose that could drift from the actual registry.

# 47. Legacy VoxelRegistry Migration

`VoxelRegistry.json` and the POC-era `VXL_BLK_*` identities are implementation evidence, not production authority.

Migration procedure:

1. inventory every legacy block ID;
2. classify as production-equivalent, test-only, duplicate, obsolete or unresolved;
3. map production-equivalent IDs to qualified v1.0 Block IDs using aliases/migration records;
4. preserve save state through explicit state converters;
5. drop Unreal asset paths from gameplay identity;
6. route visuals through Forge presentation references;
7. quarantine unresolved definitions rather than guessing;
8. validate no block is converted into a duplicate Item during migration.

# 48. Archived POC Conversion Rules

The fixed POC arrangement is retired, not the generic physical content it used.

Examples:

| POC-era reference | Production treatment |
| --- | --- |
| Forest Hamlet grass/stone/wood | Generic terrain/construction families survive. |
| Fixed watchtower site | Fixed site archived; watchtower structure and its Blocks survive. |
| Village warehouse | Generic storage/warehouse blocks and structure functions survive. |
| Goblin camp placement | Fixed placement archived; camp/defence/adventure Blocks survive where admitted. |
| Mana ruin | Fixed ruin archived; rune/mana/portal Blocks survive. |
| POC "Required" flag | Removed from shipped gameplay data; historical test metadata may retain it in archive. |
| Unreal `/Game/...` paths | Legacy presentation evidence only. |

No production Block family may be named solely after a fixed POC place, named POC villager or scripted POC quest unless that name is deliberately retained as lore elsewhere by an owning system.

# 49. Validation and Release Gates

Required validation suites include:

- schema and reference validation;
- stable-ID collision tests;
- block-family/entry generation determinism;
- duplicate Block/Item identity audit;
- placement/rotation/connection tests;
- collision and selection tests;
- mining/harvest capability tests;
- drop/resource conservation tests;
- self-recovery projection tests;
- state/overlay/transformation tests;
- block-entity save/load and rollback tests;
- worldgen palette coverage without fixed POC identities;
- structure/blueprint reference validation;
- movement-surface facet tests;
- vessel-material facet presence for participating blocks;
- optional pack removal/reinstall/quarantine tests;
- Forge visual override contract tests;
- accessibility/non-colour hazard cue tests;
- meshing/palette/state-density/block-entity performance tests.

A release-blocking defect exists if a Block can duplicate resources, silently lose state, alias to the wrong identity, bypass ownership, produce a duplicate canonical Item, or load with an incompatible definition without quarantine.

# 50. Cross-Registry Duplicate Audit

This audit is mandatory before Document 04 v1.0 is accepted.

## 50.1 Duplicate signatures

Flag a likely duplicate when an Item definition:

- exists solely to represent an inventory stack of one Block;
- has the same display identity/material and only places that Block;
- duplicates block tags, stack policy, icon, place action or description;
- has no independent use, durability, quality, charge, provenance or transformation lifecycle beyond the Block;
- is named `block_item`, `item.block.*`, `*_BlockItem` or equivalent and points one-to-one at a recoverable Block.

## 50.2 Resolution

- Convert ordinary duplicates to generated Block Inventory Projections.
- Preserve aliases so old saves/recipes can migrate.
- Update recipes to output/reference `definition_kind=block` + Block ID.
- Update trade/storage systems to accept mixed definition references.
- Keep true non-self outputs as Items.
- Keep genuine portable-device Items only when Document 04 proves independent item behaviour.

## 50.3 Non-duplication invariant

For any canonical physical identity `X`:

```text
same placeable identity + same recoverable identity
=> one Block definition
=> zero duplicate Item definitions
=> zero duplicated editable field mirrors
```

# 51. Change-Control Record

| Change ID | Change | Source/Reason | Result |
| --- | --- | --- | --- |
| D03-REC-001 | Replace POC-sized registry model with family-first production registry. | Set 25H and Foundation Reconciliation. | Adopted. |
| D03-REC-002 | Replace short IDs/Unreal paths with qualified IDs + presentation refs. | Set 25B, Godot/Forge direction. | Adopted. |
| D03-REC-003 | Adopt 217 family contracts as Core family baseline. | 25H. | Adopted. |
| D03-REC-004 | Remove POC Required/Alpha/Beta from shipped block data. | Set 25 governance. | Adopted. |
| D03-REC-005 | Introduce Block Inventory Projection; prohibit duplicate block Items. | FR-00-20-006. | Adopted; narrow Set 25 terminology amendment required. |
| D03-REC-006 | Expose movement Surface Facet without owning movement response. | Set 30. | Adopted. |
| D03-REC-007 | Expose vessel material extension facets without owning vessel motion. | Set 26F. | Adopted. |
| D03-REC-008 | Preserve POC mechanics while archiving fixed scenario identity. | Set 25A/Foundation doctrine. | Adopted. |
| D03-REC-009 | Make executable concrete registry machine-readable rather than duplicate prose. | 25B/25D source-of-truth integrity. | Adopted. |

# 52. Open Balance/Data Decisions

The following remain explicit data/balance work rather than hidden assumptions:

- exact stack limits by Block projection profile;
- exact hardness/mining-time values;
- exact blast/fire/corrosion numeric curves;
- exact light levels and attenuation;
- exact friction/traction numeric curves behind named surface bands;
- which families receive which generated shapes in the first shipping manifest;
- exact concrete Block entry count per production milestone;
- final legacy `VXL_BLK_*` mapping table after full registry audit;
- which stateful Blocks permit packed pickup versus forced empty/dismantle;
- which optional maritime definitions belong in Core namespace versus approved expansion namespaces;
- runtime compact-ID/palette bit widths and chunk-storage budgets, owned by Document 18/testing.

# 53. Definition of Done

Document 03 v1.0 is design-complete when:

- one canonical Block/Item identity rule is enforced;
- 25H family baseline is adopted;
- qualified-ID and migration rules are defined;
- family, concrete entry, runtime state and presentation are separated;
- block projection, break/drop and packed-state rules are defined;
- all major physical families have ownership boundaries;
- movement, biology and vessel facets expose evidence without duplicating specialist formulas;
- fixed POC identities are absent from production registry requirements;
- the duplicate-audit gate is ready for Document 04;
- runtime concrete registry generation can be implemented without inventing another source of truth.

---

# Appendix A. Core Production Block-Family Register

The following family baseline is adopted from Document 25H. Status is production classification, **not** a gameplay property. The original 25H "item-form" expectation is interpreted under Document 03 v1.0 as a Block Inventory Projection for self-recovering Blocks.


### Technical and Recovery

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.technical.air | Air / Empty Cell | Core Required | Runtime / Voxel Kernel |
| leyforge.core.block.family.technical.world_boundary | Finite-World Boundary | Core Conditional | World Profile / Runtime |
| leyforge.core.block.family.technical.missing_definition | Missing-Definition Recovery Block | Core Required | 25D-25E / Runtime |
| leyforge.core.block.family.technical.blueprint_ghost | Blueprint Ghost Cell | Core Required | Blueprint / UI / Forge |
| leyforge.core.block.family.technical.protected_anchor | Protected System Anchor | Core Conditional | Structure / Realm / Runtime |

### Terrain, Soil and Organic Substrate

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.terrain.turf.meadow | Meadow Turf | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.turf.pasture | Pasture Turf | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.turf.prairie | Prairie Sod | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.turf.heather_moor | Heather-Moor Turf | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.soil.forest_loam | Forest Loam | Core Required | Temperate Heartland |
| leyforge.core.block.family.terrain.soil.ancient_root | Ancient Rootsoil | Core Required | Temperate Heartland / Ancient States |
| leyforge.core.block.family.terrain.soil.pine_duff | Pine Duff | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.soil.spruce_duff | Spruce Duff | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.turf.cold_meadow | Cold-Meadow Turf | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.terrain.wetland.marsh_mud | Marsh Mud | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.peat | Peat | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.flood_silt | Flood Silt | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.wetland.quaking_mat | Quaking-Mire Mat | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.turf.alpine | Alpine Turf | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.cave.fungal_substrate | Fungal Substrate | Core Required | Underground/Deepstone |
| leyforge.core.block.family.terrain.realm.verdant_living_soil | Verdant Living Soil | Core Conditional | Verdant Covenant |

### Geology, Aggregates and Deep Layers

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.terrain.stone.common | Common Stone | Core Required | All Overworld Packages |
| leyforge.core.block.family.terrain.stone.upland_hardstone | Upland Hardstone | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.limestone | Limestone | Core Required | Highland/Karst/Rift / Underground |
| leyforge.core.block.family.terrain.stone.deepstone | Deepstone | Core Required | Underground/Deepstone |
| leyforge.core.block.family.terrain.stone.riftstone | Riftstone | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.travertine | Travertine | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.stone.crystal_matrix | Crystal Matrix | Core Required | Underground/Deepstone / Practical Magic |
| leyforge.core.block.family.terrain.stone.machine_strata | Machine-Strata Composite | Core Required | Underground/Deepstone / Adventure |
| leyforge.core.block.family.terrain.aggregate.river_gravel | River Gravel | Core Required | Temperate / Wetland / Underground Water |
| leyforge.core.block.family.terrain.aggregate.shingle | Shingle | Core Conditional | Coastal Edge / Set 26 Compatibility |
| leyforge.core.block.family.terrain.aggregate.sand | Sand | Core Required | Temperate / Wetland / Coastal Edge |
| leyforge.core.block.family.terrain.earth.clay | Clay Earth | Core Required | Temperate / Wetland / Economy |
| leyforge.core.block.family.terrain.mineral.sulfur_crust | Sulfur and Mineral Crust | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.terrain.fossil.colossal_bone | Colossal Remains | Core Required | Adventure / Underground |
| leyforge.core.block.family.terrain.rootmass.worldroot | Worldroot Mass | Core Required | Ancient States / Underground / Verdant |

### Vegetation and Agriculture

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.vegetation.grass.short | Short Grass | Core Required | Surface Biomes |
| leyforge.core.block.family.vegetation.grass.tall | Tall Grass | Core Required | Temperate / Wetland |
| leyforge.core.block.family.vegetation.heath.heather | Heather | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.flower.wild | Wildflower Family | Core Required | Surface Biomes / Ecology |
| leyforge.core.block.family.vegetation.reed.marsh | Marsh Reeds | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.vegetation.moss.common | Common Moss | Core Required | Forest / Underground / Adventure |
| leyforge.core.block.family.vegetation.moss.bog | Bog Moss | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.vegetation.tree.mixed_broadleaf | Mixed Broadleaf Tree Family | Core Required | Temperate Heartland |
| leyforge.core.block.family.vegetation.tree.ancient_oak | Ancient Oak Family | Core Required | Temperate Heartland / Ancient States |
| leyforge.core.block.family.vegetation.tree.evergreen_pine | Evergreen Pine Family | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.tree.boreal_spruce | Boreal Spruce Family | Core Required | Moorland/Boreal Frontier |
| leyforge.core.block.family.vegetation.tree.mistwood | Mistwood Wet-Timber Family | Core Required | Temperate Heartland / Ancient States |
| leyforge.core.block.family.vegetation.shrub.berry | Berry and Forage Shrub Family | Core Required | Surface Biomes / Provisions |
| leyforge.core.block.family.vegetation.herb.medicinal | Medicinal Herb Family | Core Required | Wetland / Highland / Health |
| leyforge.core.block.family.vegetation.fungus.cave | Cave Fungus Family | Core Required | Underground/Deepstone |
| leyforge.core.block.family.agriculture.crop.field | Field Crop Template Family | Core Required | Provisions/Health/Agriculture |
| leyforge.core.block.family.agriculture.tree.orchard | Orchard Tree Template Family | Core Required | Provisions/Health/Agriculture |
| leyforge.core.block.family.agriculture.pasture.feed | Pasture Feed and Hay Family | Core Required | Herd/Domestic / Agriculture |
| leyforge.core.block.family.vegetation.root.living_vine | Living Root and Vine Family | Core Conditional | Verdant Covenant / Realm Leak |
| leyforge.core.block.family.vegetation.realm.verdant_seasonal | Verdant Seasonal Flora Family | Core Conditional | Verdant Covenant |

### Base Fluids and Environmental Surfaces

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.fluid.water.fresh | Fresh Water Volume | Core Required | World / Survival / Set 26 Compatibility |
| leyforge.core.block.family.fluid.water.marsh_shallow | Shallow Marsh Water | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.fluid.water.estuary_brackish | Brackish Estuary Water | Core Conditional | Coastal Edge / Set 26 |
| leyforge.core.block.family.fluid.water.underground | Underground Water | Core Required | Underground/Deepstone |
| leyforge.core.block.family.fluid.water.geothermal | Geothermal Mineral Water | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.fluid.mud.slurry | Mud Slurry | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.environment.vent.steam | Steam Vent Block Family | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.environment.vent.peat_gas | Peat-Gas Vent Family | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.terrain.snow.surface | Snow Cover Family | Core Required | Boreal / Highland |
| leyforge.core.block.family.terrain.ice.freshwater | Freshwater Ice Family | Core Required | Boreal / Highland / Underground Water |

### Resource Deposit and Node Families

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.resource.deposit.coal | Coal Deposit Family | Core Required | Extraction/Refinement/Automation |
| leyforge.core.block.family.resource.ore.copper | Copper Ore Family | Core Required | CAP-03 / Automation |
| leyforge.core.block.family.resource.ore.iron | Iron Ore Family | Core Required | CAP-04 / Industry |
| leyforge.core.block.family.resource.ore.bog_iron | Bog-Iron Node Family | Core Required | Wetland / CAP-04 Fallback |
| leyforge.core.block.family.resource.deposit.clay | Clay Deposit Family | Core Required | Clayworks / Construction |
| leyforge.core.block.family.resource.deposit.peat | Harvestable Peat Deposit | Core Required | Wetland / Moorland |
| leyforge.core.block.family.resource.deposit.mana_crystal | Mana-Crystal Deposit Family | Core Required | Practical Magic / CAP-05 |
| leyforge.core.block.family.resource.deposit.geothermal_mineral | Geothermal Mineral Deposit | Core Required | Highland/Karst/Rift |
| leyforge.core.block.family.resource.deposit.resonant_crystal | Resonant Crystal Deposit | Core Required | Underground / Magic / Adventure |
| leyforge.core.block.family.resource.realm.living_heartwood | Living Heartwood Source | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.season_sap | Season-Sap Source | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.thornsilver_fibre | Thornsilver Fibre Source | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.pollen_amber | Pollen-Amber Deposit | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.memory_seed | Memory-Seed Node | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.resource.realm.bloomstone | Bloomstone Deposit | Core Conditional | Verdant Covenant |

### Construction Material Families

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.construction.timber.log | Structural Log Family | Core Required | Construction / Culture Kits |
| leyforge.core.block.family.construction.timber.plank | Timber Plank Family | Core Required | Construction / Culture Kits |
| leyforge.core.block.family.construction.timber.beam | Timber Beam and Joinery Family | Core Required | Construction / Routes |
| leyforge.core.block.family.construction.timber.shingle | Timber Shingle Roof Family | Core Required | Hearthland / Marchroad |
| leyforge.core.block.family.construction.plant.thatch | Thatch Family | Core Required | Hearthland / Wetland |
| leyforge.core.block.family.construction.plant.woven_reed | Woven-Reed Family | Core Required | Mirelight / Wetland |
| leyforge.core.block.family.construction.masonry.rubble | Rubble Masonry Family | Core Required | Construction / Adventure |
| leyforge.core.block.family.construction.masonry.cobble | Cobble Family | Core Required | Construction / Routes |
| leyforge.core.block.family.construction.masonry.cut_stone | Cut-Stone Family | Core Required | Civic / Defence / Culture Kits |
| leyforge.core.block.family.construction.masonry.stone_brick | Stone-Brick Family | Core Required | Settlement / Adventure |
| leyforge.core.block.family.construction.masonry.limestone | Limestone Masonry Family | Core Required | Highland/Karst / Deepstone |
| leyforge.core.block.family.construction.masonry.deepstone | Deepstone Masonry Family | Core Required | Deepstone Compacts |
| leyforge.core.block.family.construction.ceramic.clay_brick | Clay-Brick Family | Core Required | Clayworks / Settlement |
| leyforge.core.block.family.construction.ceramic.roof_tile | Ceramic Roof-Tile Family | Core Required | Civic / Industry |
| leyforge.core.block.family.construction.glass.clear | Clear Glass Family | Core Required | Construction / Industry / Magic |
| leyforge.core.block.family.construction.metal.plate_grate | Metal Plate and Grate Family | Core Required | Brassroot / Industry |
| leyforge.core.block.family.construction.realm.living_heartwood | Living-Heartwood Construction Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.construction.realm.thornsilver_lattice | Thornsilver Lattice Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.construction.realm.pollen_amber | Pollen-Amber Glazing Family | Core Conditional | Verdant Covenant |

### Functional, Crafting and Storage

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.functional.crafting.hand_surface | Hand-Crafting Surface | Core Required | Seed Start / CAP-01 |
| leyforge.core.block.family.functional.crafting.workbench | Workbench Family | Core Required | Crafting / Settlement |
| leyforge.core.block.family.functional.processing.furnace | Furnace Family | Core Required | Extraction/Refinement |
| leyforge.core.block.family.functional.processing.forge_anvil | Forge and Anvil Family | Core Required | Extraction/Refinement |
| leyforge.core.block.family.functional.processing.sawbench | Sawbench Family | Core Required | Logging / Sawmill |
| leyforge.core.block.family.functional.processing.kiln | Kiln Family | Core Required | Clayworks |
| leyforge.core.block.family.functional.processing.mill | Mill and Grindstone Family | Core Required | Agriculture / Routes |
| leyforge.core.block.family.functional.cooking.hearth | Cooking Hearth Family | Core Required | Survival / Provisions / Morale |
| leyforge.core.block.family.functional.health.medicine_station | Medicine Station Family | Core Required | Health / Settlement |
| leyforge.core.block.family.functional.alchemy.table | Alchemy Table Family | Core Required | Health / Magic |
| leyforge.core.block.family.functional.magic.rune_workbench | Rune Workbench Family | Core Required | Practical Magic |
| leyforge.core.block.family.functional.magic.mana_refinery | Mana Refinery Family | Core Required | Practical Magic / Automation |
| leyforge.core.block.family.functional.storage.chest | Chest Family | Core Required | Survival / Settlement |
| leyforge.core.block.family.functional.storage.crate | Crate Family | Core Required | Automation / Trade |
| leyforge.core.block.family.functional.storage.barrel | Barrel Family | Core Required | Provisions / Trade |
| leyforge.core.block.family.functional.storage.granary | Granary and Silo Family | Core Required | Settlement Services / Agriculture |
| leyforge.core.block.family.functional.storage.warehouse | Warehouse Interface Family | Core Required | Civilisation / Automation |
| leyforge.core.block.family.functional.storage.seed_vault | Seed-Vault Family | Core Required | Agriculture / Restoration |
| leyforge.core.block.family.functional.storage.armory | Armory Rack and Guard-Supply Family | Core Required | Settlement Safety / Defence |
| leyforge.core.block.family.functional.project.supply_crate | Project Supply Crate | Core Required | Settlement Projects / Structures |
| leyforge.core.block.family.functional.project.anchor | Construction Project Anchor | Core Required | Projects / NPC Construction |
| leyforge.core.block.family.functional.project.scaffold | Construction Scaffold Family | Core Required | Projects / Repair |
| leyforge.core.block.family.functional.npc.jobsite_anchor | Job-Site Anchor Family | Core Required | NPC / Settlement |
| leyforge.core.block.family.functional.housing.bed | Bed and Sleeping Place Family | Core Required | Housing / NPC |
| leyforge.core.block.family.functional.housing.hearth | Household Hearth Family | Core Required | Housing / Morale |
| leyforge.core.block.family.functional.civic.notice_board | Notice and Request Board Family | Core Required | Civilisation / UI |

### Automation, Logistics and Power

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.automation.component.machine_frame_copper | Copper Machine-Frame Family | Core Required | CAP-03 / Automation |
| leyforge.core.block.family.automation.component.machine_frame_iron | Iron Structural Machine-Frame Family | Core Required | CAP-04 / Automation |
| leyforge.core.block.family.automation.power.shaft | Mechanical Shaft Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.power.gearbox | Gearbox Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.power.hand_crank | Hand-Crank Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.power.waterwheel | Waterwheel Anchor Family | Core Required | Automation / Water Edge |
| leyforge.core.block.family.automation.power.wind_rotor | Wind Rotor and Mill Anchor | Core Required | Automation / Highland |
| leyforge.core.block.family.automation.logistics.chute | Item Chute Family | Core Required | Early Automation |
| leyforge.core.block.family.automation.logistics.hopper | Hopper and Intake Family | Core Required | Automation / Storage |
| leyforge.core.block.family.automation.logistics.belt | Basic Conveyor Family | Core Required | Automation |
| leyforge.core.block.family.automation.logistics.filter | Simple Filter and Router Family | Core Required | Automation |
| leyforge.core.block.family.automation.logistics.loader | Loader and Unloader Family | Core Required | Automation / Routes |
| leyforge.core.block.family.automation.logistics.buffer | Automation Buffer Family | Core Required | Automation |
| leyforge.core.block.family.automation.fluid.pipe_basic | Basic Utility Pipe Family | Core Conditional | Automation / Set 26 Compatibility |
| leyforge.core.block.family.automation.fluid.pump_basic | Basic Pump Family | Core Conditional | Automation / Set 26 Compatibility |
| leyforge.core.block.family.automation.rail.minecart | Minecart Rail Family | Core Required | Routes / Industry |
| leyforge.core.block.family.automation.rail.cart_station | Cart Station Family | Core Required | Routes / Automation |
| leyforge.core.block.family.automation.control.copper_signal | Copper Signal and Switch Family | Core Required | Automation / Defence |
| leyforge.core.block.family.automation.safety.shutdown | Machine Safety and Shutdown Family | Core Required | Automation / Player Trust |
| leyforge.core.block.family.automation.realm.regenerative_interface | Regenerative Machine Interface | Core Conditional | Verdant Covenant |

### Practical Magic and Realm Infrastructure

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.magic.rune.substrate | Rune Substrate Family | Core Required | Practical Magic |
| leyforge.core.block.family.magic.rune.inscription | Inscribed Rune Block Family | Core Required | Practical Magic / Automation |
| leyforge.core.block.family.magic.ward.stone | Wardstone Family | Core Required | Practical Magic / Safety |
| leyforge.core.block.family.magic.ward.lantern | Ward Lantern Family | Core Required | Practical Magic / Settlement |
| leyforge.core.block.family.magic.mana.conduit | Mana Conduit Family | Core Required | Practical Magic / Automation |
| leyforge.core.block.family.magic.mana.storage | Mana Storage Family | Core Required | Practical Magic |
| leyforge.core.block.family.magic.mana.well | Mana-Well Family | Core Required | Practical Magic / Structures |
| leyforge.core.block.family.magic.leyline.anchor | Leyline Anchor Family | Core Required | Leyline States / Magic |
| leyforge.core.block.family.magic.cleansing.anchor | Cleansing Anchor Family | Core Required | Magic / Aftermath |
| leyforge.core.block.family.magic.spirit.memory_anchor | Spirit and Memory Anchor Family | Core Required | Spirit Grove / Narrative |
| leyforge.core.block.family.magic.portal.frame | Portal-Frame Family | Core Required | Realm Access |
| leyforge.core.block.family.magic.portal.anchor | Portal Anchor Family | Core Required | Realm Access / Runtime |
| leyforge.core.block.family.magic.route.stabilizer | Realm Route Stabiliser Family | Core Required | Realm Access |
| leyforge.core.block.family.magic.realm.bloomstone_stabilizer | Bloomstone Stabiliser Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.season_sap_reservoir | Season-Sap Reservoir Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.pollen_amber_lens | Pollen-Amber Lens Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.memory_seed_anchor | Memory-Seed Growth Anchor | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.thornsilver_binding | Thornsilver Binding Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.anti_blight_ward | Anti-Blight Ward Family | Core Conditional | Verdant Covenant |
| leyforge.core.block.family.magic.realm.return_anchor | Emergency Realm Return Anchor | Core Required | Realm Access / Ancestral Teaser |

### Settlement, Route and Infrastructure

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.infrastructure.path.dirt | Dirt Path Family | Core Required | Routes / Settlement |
| leyforge.core.block.family.infrastructure.road.compacted | Compacted Road Family | Core Required | Routes / Trade |
| leyforge.core.block.family.infrastructure.road.stone | Stone Road Family | Core Required | Routes / Civilisation |
| leyforge.core.block.family.infrastructure.road.ancient | Ancient Road Family | Core Required | Ancient Roadland / Narrative |
| leyforge.core.block.family.infrastructure.bridge.timber_deck | Timber Bridge-Deck Family | Core Required | Routes / Wetland |
| leyforge.core.block.family.infrastructure.bridge.stone_arch | Stone-Arch Bridge Family | Core Required | Routes / Marchroad |
| leyforge.core.block.family.infrastructure.bridge.rope_suspension | Rope Suspension Bridge Family | Core Required | Highland / Routes |
| leyforge.core.block.family.infrastructure.crossing.ford_marker | Seasonal Ford Marker Family | Core Required | Routes / Water Edge |
| leyforge.core.block.family.infrastructure.pass.switchback_support | Switchback Support Family | Core Required | Highland / Routes |
| leyforge.core.block.family.infrastructure.tunnel.lining | Road-Tunnel Lining Family | Core Required | Routes / Underground |
| leyforge.core.block.family.infrastructure.route.river_marker | River Route and Barge-Lane Marker | Core Conditional | Water Edge / Set 26 |
| leyforge.core.block.family.infrastructure.defence.palisade | Palisade Family | Core Required | Settlement Safety |
| leyforge.core.block.family.infrastructure.defence.gate | Gate and Gatehouse Interface Family | Core Required | Settlement Safety |
| leyforge.core.block.family.infrastructure.defence.barricade | Barricade Family | Core Required | Defence / Events |
| leyforge.core.block.family.infrastructure.signal.beacon | Beacon Family | Core Required | Defence / Routes |
| leyforge.core.block.family.infrastructure.signal.lantern | Settlement and Route Lantern Family | Core Required | Settlement / Routes |
| leyforge.core.block.family.infrastructure.navigation.milestone | Milestone and Sign Family | Core Required | Routes / UI |
| leyforge.core.block.family.infrastructure.commerce.market_stall | Market Stall Family | Core Required | Trade / Settlement |
| leyforge.core.block.family.infrastructure.water.well | Well Family | Core Required | Provisions / Health |
| leyforge.core.block.family.infrastructure.water.cistern | Cistern Family | Core Required | Provisions / Health |
| leyforge.core.block.family.infrastructure.agriculture.irrigation_channel | Irrigation Channel Family | Core Required | Agriculture / Wetland |
| leyforge.core.block.family.infrastructure.water.levee | Levee and Floodbank Family | Core Required | Wetland/Flood Basin |
| leyforge.core.block.family.infrastructure.wetland.raised_walkway | Raised Walkway Family | Core Required | Mirelight / Wetland |
| leyforge.core.block.family.infrastructure.agriculture.pasture_fence | Pasture Fence Family | Core Required | Agriculture / Herd Ecology |
| leyforge.core.block.family.infrastructure.agriculture.crop_support | Crop Support and Trellis Family | Core Required | Agriculture / Verdant |

### Adventure, Defence and Hazard

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.adventure.lock.mechanical | Mechanical Lock Family | Core Required | Adventure / Civilisation |
| leyforge.core.block.family.adventure.socket.key | Key and Token Socket Family | Core Required | Adventure / Narrative |
| leyforge.core.block.family.adventure.seal.ritual | Ritual and Magical Seal Family | Core Required | Magic / Adventure |
| leyforge.core.block.family.adventure.control.lever | Lever and Manual Control Family | Core Required | Adventure / Automation |
| leyforge.core.block.family.adventure.control.pressure_plate | Pressure Plate and Sensor Family | Core Required | Adventure |
| leyforge.core.block.family.adventure.puzzle.rune_socket | Rune Puzzle Socket Family | Core Required | Adventure / Magic |
| leyforge.core.block.family.adventure.passage.hidden | Hidden-Passage Family | Core Required | Adventure |
| leyforge.core.block.family.adventure.trap.launcher | Trap Launcher Family | Core Required | Adventure / Combat |
| leyforge.core.block.family.adventure.trap.spike | Spike and Pit-Trap Family | Core Required | Adventure / Defence |
| leyforge.core.block.family.adventure.hazard.emitter | Hazard Emitter Family | Core Required | Adventure / Environment |
| leyforge.core.block.family.adventure.loot.container | Contextual Loot-Container Family | Core Required | Adventure / Loot |
| leyforge.core.block.family.adventure.sacred.altar | Shrine and Altar Family | Core Required | Sacred Sites / Culture |
| leyforge.core.block.family.adventure.tomb.marker | Tomb and Memorial Marker Family | Core Required | Tombs / History |
| leyforge.core.block.family.adventure.mechanism.ancient | Ancient Mechanism Family | Core Required | Ruins / Machine Strata |
| leyforge.core.block.family.adventure.root.gate | Living Root-Gate Family | Core Required | Root Sites / Verdant |
| leyforge.core.block.family.adventure.fossil.wall | Colossal-Remains Wall Family | Core Required | Natural Cave Grammars |
| leyforge.core.block.family.adventure.aftermath.boss_evidence | Boss-Aftermath Evidence Family | Core Required | Regional Threats / Aftermath |
| leyforge.core.block.family.hazard.growth.corruption | Corruption Growth Family | Core Required | Magic/Undead/Corruption Ecology |
| leyforge.core.block.family.hazard.growth.blight | Blight Growth Family | Core Required | Ecology / Verdant |
| leyforge.core.block.family.hazard.growth.rot | Rot and Decay Family | Core Required | Adventure / Verdant |
| leyforge.core.block.family.hazard.fire.source | Fire and Heat Source Family | Core Required | Survival / Industry / Combat |
| leyforge.core.block.family.defence.ward.barrier | Ward Barrier Family | Core Required | Magic / Defence |
| leyforge.core.block.family.defence.refuge.shutter | Refuge Shutter and Reinforced Door Family | Core Required | Safety / Structures |

### Ancestral Veil Teaser

| Family ID | Name | Status | Primary Package |
| --- | --- | --- | --- |
| leyforge.core.block.family.realm.ancestral.threshold_surface | Ancestral Threshold Surface | Teaser Only | Ancestral Veil Threshold |
| leyforge.core.block.family.realm.ancestral.echo_anchor | Ancestral Echo Anchor | Teaser Only | Ancestral Veil Threshold |
| leyforge.core.block.family.realm.ancestral.safety_boundary | Ancestral Safety Boundary | Teaser Only | Ancestral Veil Threshold |

# Appendix B. Shape Eligibility and State Profiles

| Profile | Name | Primary Use | Required Forms / Boundary |
| --- | --- | --- | --- |
| SHP-00 | No inventory projection | Air, boundary, hidden anchors and generated preview only. | No shape variants; interaction through owning service. |
| SHP-01 | Natural full voxel | Soils, stone, deposits and organic substrate. | Full block; optional surface/overlay variant; no automatic construction shapes. |
| SHP-02 | Loose/gravity aggregate | Sand, gravel, shingle and selected rubble. | Full voxel with gravity/settling; compacted route variant explicit. |
| SHP-03 | Basic masonry set | Common construction materials. | Full, slab, stair and wall; pillar/arch only when family permits. |
| SHP-04 | Extended civic masonry set | Cut stone, limestone, deepstone and selected bricks. | Full, slab, stair, wall, pillar, arch, lintel, trim and railing. |
| SHP-05 | Timber framing set | Logs, planks, beams and living wood. | Full, slab, stair/panel, beam, post, brace, railing, door/hatch hooks. |
| SHP-06 | Roof system | Shingle, thatch and ceramic roof families. | Slope/tile, ridge, valley, eave and cap modules. |
| SHP-07 | Thin panel/lattice | Glass, reed, metal plate, thornsilver and rune substrates. | Pane, panel, grate, lattice, screen and inlay forms. |
| SHP-08 | Plant/growth set | Grass, crops, shrubs, fungi, vines and roots. | Replaceable plant, surface growth, climbing and multi-cell modules. |
| SHP-09 | Functional block entity | Stations, storage, machines, magic and project anchors. | One or more assembled forms with ports, sockets and authoritative state. |
| SHP-10 | Route/infrastructure modules | Roads, bridges, rails, channels and palisades. | Surface, edge, junction, slope, support, corner and endpoint modules. |
| SHP-11 | Adventure grammar modules | Locks, traps, altars, hidden passages and mechanisms. | Floor/wall/ceiling/socket variants selected by site grammar. |

## Appendix B.2 State and Overlay Register

| Class | State Set | Contract |
| --- | --- | --- |
| Physical condition | intact, cracked, damaged, ruined, rubble/collapsed, repaired, reinforced | State where identity/material remains the same; separate block only when collision, drop or behaviour requires it. |
| Moisture and water | dry, damp, wet, waterlogged, flooded, submerged | Full fluid behaviour remains owned by runtime/Set 26; block state records local material response. |
| Temperature and season | hot, cooled, frosted, frozen, snow-covered, thawing; spring/summer/autumn/winter profiles | Seasonal presentation must not multiply IDs unless gameplay identity changes. |
| Fire | flammable-ready, burning, extinguished, scorched, charred | Burning is authoritative runtime state; charred result may be a variant or transformed family. |
| Growth and occupation | bare, mossy, overgrown, rootbound, fungal-colonised, occupied | Applied through validated variant/state profiles; reverse links preserve source identity. |
| Magic and power | uncharged, charged, active, overloaded, depleted, tuned, severed | Used by mana, rune, ward, conduit, portal and realm infrastructure. |
| Corruption and restoration | corrupted, blighted, rotted, contained, cleansed, scarred, restored | Transitions must name cause, spread, cure, output and persistent aftermath. |
| Ownership and access | unclaimed, owned, public, restricted, locked, sealed, conquered | Ownership is an instance/service record, not copied into immutable block definition. |
| Project and construction | planned, scaffolded, supplied, building, paused, complete, repair-priority | Project truth belongs to the project instance; blocks present the current stage. |
| Resource state | poor/normal/rich, pure/impure, exposed, harvested, depleted, regenerating | Grades/purity belong to resource/deposit state and must map to conserved drops. |

# Appendix C. Block Definition Template

```yaml
block_definition:
  block_id: leyforge.core.block.<category>.<path>
  schema_id: leyforge.system.schema.block_definition
  schema_version: 1
  family_id: leyforge.core.block.family.<category>.<path>
  namespace_owner: leyforge.core
  localisation_key: block.<path>.name
  production_classification: core_required
  parent_definition_id: null
  material_profile_id: leyforge.core.material.<id>
  shape_profile_id: leyforge.system.block_shape.<id>
  tags: []
  capabilities: []
  placement_profile_id: leyforge.system.block_placement.<id>
  collision_profile_id: leyforge.system.block_collision.<id>
  harvest_profile_id: leyforge.system.harvest.<id>
  recovery_contract_id: leyforge.system.block_recovery.<id>
  inventory_projection_policy: generated | none | packed_state
  stack_profile_id: leyforge.system.stack_profile.<id> | null
  state_profile_id: leyforge.system.block_state.<id> | null
  block_entity_schema_id: null
  ownership_profile_id: null
  automation_port_profile_id: null
  mana_port_profile_id: null
  movement_surface_facet_id: null
  environment_facet_id: null
  vessel_material_facet_id: null
  presentation_contract_id: leyforge.presentation.block.<id>
  worldgen_suitability_refs: []
  aliases: []
  tombstone_replacement_id: null
  validation_profile_ids: []
```

# Appendix D. Block Inventory Projection Template

```yaml
block_inventory_projection:
  definition_kind: block
  block_definition_id: leyforge.core.block.<category>.<path>
  quantity: 1
  stack_profile_id: leyforge.system.stack_profile.<id>
  display_reference: inherit:block_definition
  icon_reference: inherit:presentation_contract
  placement_action_profile_id: inherit:block_definition
  carried_state_schema_id: null
  carried_state_payload: null
  source_definition_revision: 1
  projection_schema_version: 1
```

**Important:** this record has no independent content ID and is not registered in the Item domain.

# Appendix E. Break/Drop Contract Template

```yaml
block_recovery_contract:
  contract_id: leyforge.system.block_recovery.<id>
  source_block_id: leyforge.core.block.<id>
  mode: SELF_BLOCK | SELF_BLOCK_PACKED | OTHER_BLOCK | ITEM_OUTPUT | MIXED_OUTPUT | TRANSFORM_IN_WORLD | NO_RECOVERY | SYSTEM_TRANSACTION
  capability_requirements: []
  block_outputs: []
  item_outputs: []
  byproduct_refs: []
  packed_state_policy_id: null
  transformation_target_block_id: null
  conservation_profile_id: leyforge.system.conservation.standard
  transaction_owner_id: leyforge.system.interface.harvest_or_project
```

# Appendix F. Movement Surface Facet

The following field contract is consumed by Set 30 and is reproduced here as the block-facing provider contract:

```yaml
movement_surface_facet:
  surface_type: <id>
  support_validity: <band_or_rule>
  slope: <derived_or_authored>
  speed_modifier: <profile_ref>
  traction_modifier: <profile_ref>
  braking_modifier: <profile_ref>
  slip_band: <band>
  step_override: null
  noise_tags: []
  hazard_tags: []
  climb_surface_category: null
  grapple_surface_category: null
  landing_response_class: null
  reason_or_source_ref: <block/material ref>
  revision: 1
```

Set 30 resolves mover-specific outcomes. Document 03 must not embed movement-state formulas here.

# Appendix G. Vessel Material Extension Facet

```yaml
vessel_material_facet:
  dry_mass_per_solid_volume: <band_or_profile>
  solid_volume_fraction_by_shape: <profile_ref>
  longitudinal_strength_band: <band>
  transverse_strength_band: <band>
  shear_and_joint_band: <band>
  rigidity_band: <band>
  flexibility_band: <band>
  impact_toughness_band: <band>
  sealing_profile: <profile_ref>
  absorption_profile: <profile_ref>
  corrosion_profile: <profile_ref>
  fire_profile: <profile_ref>
  attachment_face_profile: <profile_ref>
  ballast_suitability: <band_or_flags>
  vessel_role_suitability: <profile_ref>
  magic_conductivity_and_stability: <profile_ref>
  damage_multipliers_by_state: <profile_ref>
  repair_and_salvage_tags: []
```

These fields are base physical evidence. Set 26F/26G remain the vessel structural/movement owners.

# Appendix H. Duplicate-Audit Rules

| Audit Rule | Failure Condition | Required Fix |
| --- | --- | --- |
| `BLK_ITEM_DUP_001` | Recoverable Block has one-to-one duplicate Item whose only role is inventory/place. | Delete/deprecate Item; generate Block projection; migrate refs. |
| `BLK_ITEM_DUP_002` | Recipe outputs fake block-item ID instead of Block ref. | Output canonical Block ref. |
| `BLK_ITEM_DUP_003` | Item copies material/hardness/placement fields from Block. | Remove copied fields; reference Block or keep distinct Item-only fields. |
| `BLK_PROJ_001` | Block is tradeable/storable but has no projection policy. | Add projection policy/stack profile. |
| `BLK_PROJ_002` | Technical/non-player Block accidentally generates an inventory projection. | Set projection policy `none`. |
| `BLK_STATE_001` | Stateful Block pickup can duplicate or lose contained resources. | Use empty/packed/dismantle transaction policy. |
| `BLK_ID_001` | Legacy and production IDs both remain editable. | Freeze legacy as alias/tombstone only. |
| `BLK_VIS_001` | Forge asset path is used as gameplay identity. | Replace with stable presentation reference. |

# Appendix I. Legacy Migration Examples

| Legacy Pattern | Production Treatment |
| --- | --- |
| `VXL_BLK_Terrain_GrassBlock` / `terrain.grass.basic` | Map to appropriate production turf family/concrete entry selected by migration context; do not retain Unreal asset path as identity. |
| `VXL_BLK_Construction_OakPlanks` + duplicate Oak Planks Item | Map Block to qualified Block ID; Item alias migrates to Block Inventory Projection reference. |
| Ore Block + Raw Ore Item | Keep both when block is deposit/world source and Item is extracted material. |
| Furnace Block + Furnace Item that only places Furnace | Keep Furnace Block; migrate Item to Block projection unless independent portable behaviour is proven. |
| Chest Block with contents | Keep Block identity; use approved packed-state or empty-before-pickup transaction. |
| Fixed POC project marker | Archive/test namespace or replace with generic project-marker family if still required by production construction systems. |

---

# Final Production Lock

> **Document 03 v1.0 replaces the POC-era Blocks Registry as the foundation authority for block identity. Leyforge now treats recoverable placeable blocks as one canonical physical definition that can be represented directly in inventories, recipes, storage and trade without a duplicate Item identity. Production content grows through governed families, material/shape/state composition, typed facets and stable IDs rather than copied block-item pairs or POC-sized hard-coded lists.**
