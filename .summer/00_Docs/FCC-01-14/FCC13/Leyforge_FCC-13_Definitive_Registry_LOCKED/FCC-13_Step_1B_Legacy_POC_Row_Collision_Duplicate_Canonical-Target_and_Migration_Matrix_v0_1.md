# Leyforge Final Content Canon Collection

## FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding
### Step 1B — Legacy POC Row Collision, Duplicate, Canonical-Target & Migration Matrix

**Version:** 0.1  
**Date:** 28 August 2026  
**Status:** Source-Reconciliation Working Document — No Final FCC-13 Registry IDs/Recipes Locked Here  
**Input Corpus:** `VoxelRegistry.json` — 312 legacy POC rows  
**Authority:** FCC-12 locked canon; FCC-13 Step 1A authority hierarchy; current locked project/realm canon where explicitly available.

---

# 1. Purpose

Step 1B performs the row-by-row forensic reconciliation of the old POC `VoxelRegistry.json`.

The old registry is evidence, not canon.

Every one of its 312 rows is classified so that later FCC-13 work can distinguish:

- a concept that has a current canonical target;
- a legacy Block/Item projection that should collapse under the single-definition rule;
- a physical form rather than a new material;
- a state/facies/overlay rather than a new material;
- a manufactured component rather than a material;
- a legacy term with a locked migration;
- an explicitly rejected placeholder;
- a POC-only concept that must remain deferred until another source actually supports it.

This step intentionally **does not invent missing canon**.

Where the current source set does not prove a POC object survives, its disposition is DEFER/REVIEW rather than silent acceptance or silent rejection.

---

# 2. Registry Corpus

The inspected legacy registry contains:

- **312 total rows**
- **143 Blocks**
- **169 Items**
- **6 exact duplicate display-name pairs**
- **0 duplicate `original_id` values**

The six exact duplicate display-name pairs are:

1. Oak Log — Block 9 / Item 142
2. Stone Brick — Block 31 / Item 170
3. Cobblestone — Block 32 / Item 169
4. Oak Beam — Block 33 / Item 168
5. Cave Mushroom — Block 59 / Item 218
6. Clay Roof Tile — Block 61 / Item 224

Additional semantic clusters exist despite non-identical display text, including Oak Planks/Oak Plank and Clay Brick Block/Clay Brick.

---

# 3. Disposition Vocabulary

This matrix uses the following meanings.

- **REBIND CANONICAL** — current locked canon already supplies the semantic target.
- **FORM / PRODUCT / WORLD PROJECTION** — legacy noun represents a physical form or representation of an underlying material.
- **MERGE / SINGLE-DEFINITION** — duplicate legacy Block/Item rows must be reconciled into one underlying physical object/content identity where appropriate.
- **STATE / OVERLAY / FACIES** — legacy row must resolve as condition/state rather than independent base material.
- **SOURCE / DEPOSIT** — world source/feedstock relationship, not refined material identity.
- **COMPONENT** — manufactured object/component, not material family.
- **MIGRATE / ALIAS / CONTEXTUAL** — legacy term has a canonical migration rule but may require source context.
- **RETIRE / REJECT** — current canon explicitly disallows the old identity.
- **DEFER / REVIEW** — POC evidence alone is insufficient to make the exact object canonical.
- **HOLD** — a specific cross-system concern must be resolved before binding.

---

# 4. Locked High-Impact Findings

## 4.1 Deepstone Is Removed From the Active Material Registry

Legacy Row 48 cannot survive as a canonical exact material.

`Deepstone` may only remain as:

- migration alias;
- geological/descriptive category;
- local/cultural terminology;
- old-save metadata.

It must not become the principal Impossible Deep stone or a generic deep-tier material.

## 4.2 Plant Fibre Is Not a Universal Exact Material

Legacy Row 144 must resolve to:

- a known exact botanical fibre;
- `Mixed Plant Fibre` if a real mixed product is intended;
- fibre provider/category semantics.

It must not silently become the material identity behind every rope, cloth and plant-derived product.

## 4.3 Mana Crystal Ore Is a Source Relationship

Legacy Row 20 must resolve through canonical **Raw Mana Crystal** source/deposit/block semantics.

The ore/block representation does not create a second Mana Crystal material identity.

## 4.4 Generic Dimension Placeholders Are Contained

The following cannot silently re-enter the registry as active current canon:

- Voidstone
- Celestial Stone
- Fae Grass
- Dream Glass
- Deep Forge Stone
- Strange Realm Ore
- Broken Portal Block as generic Realm Access
- Unstable Rift Block as generic Realm Access

Each has the specific migration/defer/reject disposition established by FCC-12.

## 4.5 Generic Stone Construction Must Preserve Actual Stone

POC rows such as:

- Stone Block
- Stone Chunk
- Stone Brick
- Cobblestone
- Stone Pillar
- Stone Wall
- Stone Arch

cannot use “Stone” as a hidden monolithic material identity.

The actual source stone/material must remain resolvable.

## 4.6 Named Stations Are Not Exclusive Ontology Gates

Rows such as:

- Stone Furnace
- Mana Furnace
- Forge and Anvil
- Loom
- Crusher
- Grinder
- Arcane Furnace

may survive later as named content objects, but their existence in the POC does not make them the exclusive owners of their processes.

FCC-12 processing remains capability-driven.

---

# 5. Single-Definition / Relationship Clusters

## Cluster A — Oak Log

Rows 9 and 142 are the same named physical concept represented once as Block and once as Item.

**Step 1B disposition:** merge/rebind through one canonical physical content identity with world and inventory projections unless later lifecycle evidence proves otherwise.

## Cluster B — Stone Brick

Rows 31 and 170 duplicate the same named construction form.

**Disposition:** one material-aware masonry object/form with world and inventory projections.

## Cluster C — Cobblestone

Rows 32 and 169 duplicate the same named construction form.

**Disposition:** one source-stone-aware cobble form/object.

## Cluster D — Oak Beam

Rows 33 and 168 duplicate the same named construction form.

**Disposition:** one timber/material-aware beam object with world/inventory projections.

## Cluster E — Clay Roof Tile

Rows 61 and 224 duplicate the same named construction product.

**Disposition:** one fired-ceramic/clay roof-tile object with world/inventory projections.

## Cluster F — Cave Mushroom

Rows 59 and 218 have the same display name but are **not automatically merged**.

The world row can represent a living fungus/growth while the Item row represents a harvested edible/product.

**Disposition:** lifecycle split candidate. The relationship must be explicit rather than inferred from identical display text.

## Cluster G — Oak Planks / Oak Plank

Rows 11 and 167 differ only by singular/plural naming and old Block/Item modelling.

**Disposition:** strong single-definition/projection candidate; final binding belongs FCC-13B.

## Cluster H — Clay Brick Block / Clay Brick

Rows 60 and 223 describe the placed and carried expressions of a fired ceramic construction form.

**Disposition:** strong single-definition/projection candidate.

---

# 6. Machine / Component Relationship Clusters

These are not duplicate materials and must remain object/component relationships:

- Stone Furnace ↔ Stone Furnace Core
- Mana Furnace ↔ Mana Furnace Core
- Ward Lantern ↔ Ward Lantern Core
- Mana Battery ↔ Mana Battery Core
- Rune Engine ↔ Rune Engine Core
- Basic Item Chute ↔ Item Chute Segment
- Item Pipe ↔ Item Pipe Section
- Fluid Pipe ↔ Fluid Pipe Section
- Water Wheel ↔ Water Wheel Axle
- Windmill ↔ Windmill Sail

Step 1B does not prove that every exact POC component survives. It prevents later binding from confusing machine components with underlying materials.

---

# 7. Personhood / Category Collision

Legacy rows:

- Goblin Scrap
- Crude Goblin Blade

are categorised under `Monster Drop`.

Current Overworld canon treats **Goblin as a sapient ancestry**.

Therefore the legacy category cannot be carried forward uncritically.

A Goblin-made blade, salvage object or faction loot can exist, but FCC-13 must not encode “Goblin” as a generic monster-drop ontology merely because the POC did.

This is a cross-system binding hold, not a reason to delete every Goblin-associated object.

---

# 8. Currency Collision

Legacy rows include:

- Copper Trade Coin
- Silver Trade Coin
- Village Supply Token

Current Overworld economy canon explicitly does **not** define one universal currency.

Therefore these rows are POC/economy evidence only until FCC-13/Set 27 binding establishes:

- issuing polity;
- monetary system;
- denomination;
- acceptance;
- material composition;
- ledger/token semantics.

They must not become universal money by inheritance.

---

# 9. Test/POC Content Principle

Rows with no current locked canonical support are preserved as migration/test evidence rather than discarded.

They may later become:

- valid gameplay content;
- test fixtures;
- renamed/reworked content;
- owner-system content;
- rejected content.

Step 1B intentionally avoids inventing a decision merely to give every old row a new target.

---

# 10. Disposition Summary


- **SYSTEM/OBJECT CANDIDATE — DEFER EXACT: 54 rows**
- **DEFER / CONTENT REVIEW: 36 rows**
- **DEFER / EQUIPMENT REVIEW: 22 rows**
- **COMPONENT / DEFER EXACT: 14 rows**
- **DEFER / TOOL REVIEW: 14 rows**
- **SYSTEM CANDIDATE / REBIND: 14 rows**
- **FORM / REBIND CANONICAL: 11 rows**
- **COMPONENT REBIND: 10 rows**
- **MERGE / SINGLE-DEFINITION: 10 rows**
- **OBJECT/PROVIDER REBIND: 8 rows**
- **RELATIONSHIP CLUSTER / REBIND: 8 rows**
- **COMPONENT REBIND CANDIDATE: 6 rows**
- **LIVING/NATURAL OBJECT — DEFER EXACT: 6 rows**
- **MATERIAL/FORM REVIEW: 6 rows**
- **DEFER / LOOT REVIEW: 5 rows**
- **DEFER / UNCONFIRMED: 5 rows**
- **MIGRATE CONTEXTUALLY: 5 rows**
- **REBIND CANONICAL: 5 rows**
- **FORM/PRODUCT REBIND: 4 rows**
- **PROVIDER/FORM REBIND: 4 rows**
- **REBIND CANDIDATE: 4 rows**
- **SOURCE / WORLD DEPOSIT: 4 rows**
- **CLASS / WORLD PROJECTION: 3 rows**
- **CONTEXTUAL TERRAIN REBIND: 3 rows**
- **DEFER / ECONOMY BINDING: 3 rows**
- **PHASE/FORM REVIEW: 3 rows**
- **CATEGORY / FORM: 2 rows**
- **DEFER / MIGRATION-ONLY: 2 rows**
- **DEFER / PROVENANCE OBJECT REVIEW: 2 rows**
- **FORM / PRODUCT: 2 rows**
- **FORM REBIND: 2 rows**
- **HOLD / PERSONHOOD-CATEGORY REVIEW: 2 rows**
- **SOURCE / FEEDSTOCK: 2 rows**
- **ANOMALY / INTERFACE: 1 rows**
- **CATEGORY / LEGACY: 1 rows**
- **CATEGORY / PROVIDER: 1 rows**
- **CLASS / FORM: 1 rows**
- **CLASS / WORLD REPRESENTATION: 1 rows**
- **DEFER / UNCONFIRMED FLUID: 1 rows**
- **FLUID MIXTURE — UNCONFIRMED: 1 rows**
- **FORM / CONTEXTUAL: 1 rows**
- **FORM / PROVIDER: 1 rows**
- **FORM / REBIND: 1 rows**
- **GENERIC CLASS / CONTEXTUAL: 1 rows**
- **GENERIC FORM / CONTEXTUAL: 1 rows**
- **MIGRATE: 1 rows**
- **MIGRATE CONTEXTUALLY / RETIRE: 1 rows**
- **NATURAL OBJECT / FORM: 1 rows**
- **PROCESSED MATERIAL / REBIND: 1 rows**
- **REJECT: 1 rows**
- **RETIRE / ALIAS: 1 rows**
- **RETIRE / CONTEXTUAL MIGRATION: 1 rows**
- **SOURCE / FORM: 1 rows**
- **SOURCE RELATIONSHIP: 1 rows**
- **STATE / OVERLAY: 1 rows**
- **STATE / QUALITY: 1 rows**
- **STATE / STRUCTURE PIECE: 1 rows**
- **STATE / WORLD PROJECTION: 1 rows**
- **STATE/OVERLAY CONTEXTUAL: 1 rows**
- **STATE/OVERLAY — UNCONFIRMED: 1 rows**
- **STRUCTURE / MIGRATION: 1 rows**
- **TERRAIN STATE/MIXTURE REVIEW: 1 rows**
- **WORLD FEATURE / PHASE RELATION: 1 rows**
- **WORLD PROJECTION: 1 rows**

**Total classified:** 312/312 rows.


---

# 11. Full 312-Row Migration Matrix

The `Canonical Target / Role` column is semantic, not a final stable ID.

`DEFER / REVIEW` means the old row is preserved as evidence but is **not** accepted into final canon by this step.

| ID | Legacy Row | Type | Disposition | Canonical Target / Role | Authority | Binding Note |
|---:|---|---|---|---|---|---|

| 1 | Grass Block (`VXL_BLK_Terrain_GrassBlock`) | block | **CONTEXTUAL TERRAIN REBIND** | actual soil + vegetated surface/terrain state | FCC-12 | POC generic terrain noun must resolve through current soil/material architecture. |
| 2 | Dirt Block (`VXL_BLK_Terrain_DirtBlock`) | block | **CONTEXTUAL TERRAIN REBIND** | actual canonical soil/profile + terrain form | FCC-12 | POC generic terrain noun must resolve through current soil/material architecture. |
| 3 | Stone Block (`VXL_BLK_Terrain_StoneBlock`) | block | **GENERIC CLASS / CONTEXTUAL** | actual stone material + block/natural form | LOCKED FCC-12 | Stone is a superclass, not a single universal exact material. |
| 4 | Sand Block (`VXL_BLK_Terrain_SandBlock`) | block | **CLASS / WORLD PROJECTION** | composition-bearing Sand class + placed/world form | LOCKED FCC-12 | Sand is a physical/composition class, not one universal exact material. |
| 5 | Gravel Block (`VXL_BLK_Terrain_GravelBlock`) | block | **CLASS / WORLD PROJECTION** | composition-bearing Gravel class + placed/world form | LOCKED FCC-12 | Gravel is a physical/composition class. |
| 6 | Clay Block (`VXL_BLK_Terrain_ClayBlock`) | block | **CLASS / WORLD PROJECTION** | specific clay material/profile + placed form | LOCKED FCC-12 | Clay is a mineral/feedstock superclass; composition must be known. |
| 7 | Water Block (`VXL_BLK_Fluid_WaterBlock`) | block | **WORLD PROJECTION** | ordinary Water + world-fluid representation | LOCKED FCC-12 | Water is one shared canonical material; Block is representation, not another Water identity. |
| 8 | Mud Block (`VXL_BLK_Terrain_MudBlock`) | block | **CONTEXTUAL TERRAIN REBIND** | actual soil/sediment + wet/mud condition or mixture | FCC-12 | POC generic terrain noun must resolve through current soil/material architecture. |
| 9 | Oak Log (`VXL_BLK_Natural_OakLog`) | block | **MERGE / SINGLE-DEFINITION** | Oak timber/log object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Item 142. Final Block/inventory projections must not create duplicate underlying objects. |
| 10 | Oak Leaves (`VXL_BLK_Natural_OakLeaves`) | block | **LIVING/NATURAL OBJECT — DEFER EXACT** | species/plant object and harvested products as later bound | POC + ECOLOGY SYSTEM | Do not infer a new material identity from the world object. |
| 11 | Oak Planks (`VXL_BLK_Construction_OakPlanks`) | block | **RELATIONSHIP CLUSTER / REBIND** | Oak timber + plank form | FCC-12 + POC EVIDENCE | Related to Item 167; likely one physical plank object with world/inventory projections, final binding in FCC-13B. |
| 12 | Branch / Stick Block (`VXL_BLK_Natural_BranchStickBlock`) | block | **NATURAL OBJECT / FORM** | wood/plant source + branch/stick form | FCC-12 PRINCIPLE + POC | Underlying botanical material should remain known. |
| 13 | Tall Grass (`VXL_BLK_Natural_TallGrass`) | block | **LIVING/NATURAL OBJECT — DEFER EXACT** | species/plant object and harvested products as later bound | POC + ECOLOGY SYSTEM | Do not infer a new material identity from the world object. |
| 14 | Bush Block (`VXL_BLK_Natural_BushBlock`) | block | **LIVING/NATURAL OBJECT — DEFER EXACT** | species/plant object and harvested products as later bound | POC + ECOLOGY SYSTEM | Do not infer a new material identity from the world object. |
| 15 | Basic Crop Block (`VXL_BLK_Natural_BasicCropBlock`) | block | **LIVING/NATURAL OBJECT — DEFER EXACT** | species/plant object and harvested products as later bound | POC + ECOLOGY SYSTEM | Do not infer a new material identity from the world object. |
| 16 | Wildflower Block (`VXL_BLK_Natural_WildflowerBlock`) | block | **LIVING/NATURAL OBJECT — DEFER EXACT** | species/plant object and harvested products as later bound | POC + ECOLOGY SYSTEM | Do not infer a new material identity from the world object. |
| 17 | Coal Ore (`VXL_BLK_Resource_CoalOre`) | block | **SOURCE / WORLD DEPOSIT** | Coal-bearing source/deposit | CURRENT CANON + FCC-12 | World source representation of canonical Coal. |
| 18 | Copper Ore (`VXL_BLK_Resource_CopperOre`) | block | **SOURCE / WORLD DEPOSIT** | Copper-bearing ore/deposit | LOCKED FCC-12 | Source/deposit relation rather than duplicate Copper material. |
| 19 | Iron Ore (`VXL_BLK_Resource_IronOre`) | block | **SOURCE / WORLD DEPOSIT** | Iron-bearing ore/deposit | LOCKED FCC-12 | Source/deposit relation rather than duplicate Iron material. |
| 20 | Mana Crystal Ore (`VXL_BLK_Resource_ManaCrystalOre`) | block | **SOURCE RELATIONSHIP** | Raw Mana Crystal source/deposit/block relationship | LOCKED FCC-12 | Ore/source representation must not create a duplicate Mana Crystal material. |
| 21 | Clay Deposit (`VXL_BLK_Resource_ClayDeposit`) | block | **SOURCE / WORLD DEPOSIT** | specific clay deposit/feedstock | LOCKED FCC-12 | Clay composition/profile must be preserved. |
| 22 | Surface Stone Boulder (`VXL_BLK_Resource_SurfaceStoneBoulder`) | block | **SOURCE / FORM** | actual stone material + boulder form | LOCKED FCC-12 | Generic 'stone' must resolve to real source stone. |
| 23 | Workbench (`VXL_MCH_Functional_Workbench`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Workbench | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 24 | Stone Furnace (`VXL_MCH_Functional_StoneFurnace`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Stone Furnace | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 25 | Mana Furnace (`VXL_BLK_Magic_ManaFurnace`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Mana Furnace | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 26 | Wooden Chest (`VXL_BLK_Storage_WoodenChest`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Wooden Chest | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 27 | Village Warehouse (`VXL_BLK_Village_VillageWarehouse`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Village Warehouse | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 28 | Basic Mana Miner (`VXL_MCH_Automation_BasicManaMiner`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Basic Mana Miner | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 29 | Basic Item Chute (`VXL_MCH_Automation_BasicItemChute`) | block | **SYSTEM CANDIDATE / REBIND** | Basic Item Chute | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 30 | Rune Table (`VXL_BLK_Magic_RuneTable`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Rune Table | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 31 | Stone Brick (`VXL_BLK_Construction_StoneBrick`) | block | **MERGE / SINGLE-DEFINITION** | stone-material masonry brick object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Item 170. Final Block/inventory projections must not create duplicate underlying objects. |
| 32 | Cobblestone (`VXL_BLK_Construction_Cobblestone`) | block | **MERGE / SINGLE-DEFINITION** | stone-material cobble object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Item 169. Final Block/inventory projections must not create duplicate underlying objects. |
| 33 | Oak Beam (`VXL_BLK_Construction_OakBeam`) | block | **MERGE / SINGLE-DEFINITION** | Oak timber beam object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Item 168. Final Block/inventory projections must not create duplicate underlying objects. |
| 34 | Oak Stair (`VXL_BLK_Construction_OakStair`) | block | **FORM REBIND** | Oak timber + standard construction form | LOCKED FCC-12 | Standard derived-form candidate; final Oak material binding must respect current timber canon. |
| 35 | Oak Slab (`VXL_BLK_Construction_OakSlab`) | block | **FORM REBIND** | Oak timber + standard construction form | LOCKED FCC-12 | Standard derived-form candidate; final Oak material binding must respect current timber canon. |
| 36 | Thatch Roof Block (`VXL_BLK_Construction_ThatchRoofBlock`) | block | **FORM/PRODUCT REBIND** | valid fibre/plant provider + authored form/product | LOCKED FCC-12 | Underlying fibre/material must remain explicit; do not use generic Plant Fibre as universal identity. |
| 37 | Oak Door (`VXL_BLK_Construction_OakDoor`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 38 | Oak Fence (`VXL_BLK_Construction_OakFence`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 39 | Glass Window (`VXL_BLK_Construction_GlassWindow`) | block | **DEFER / UNCONFIRMED** | Glass Window | POC EVIDENCE | No automatic canonical carry-forward. Requires a later FCC-13 source/canon decision. |
| 40 | Watchtower Core (`VXL_BLK_Defence_WatchtowerCore`) | block | **COMPONENT / DEFER EXACT** | Watchtower Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 41 | Wooden Palisade (`VXL_BLK_Defence_WoodenPalisade`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 42 | Wooden Gate (`VXL_BLK_Defence_WoodenGate`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 43 | Torch (`VXL_BLK_Lighting_Torch`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Torch | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 44 | Basic Spike Trap (`VXL_BLK_Defence_BasicSpikeTrap`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Basic Spike Trap | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 45 | Guard Post Marker (`VXL_BLK_Village_GuardPostMarker`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Guard Post Marker | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 46 | Ward Lantern (`VXL_BLK_Magic_WardLantern`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Ward Lantern | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 47 | Basic Mana Conduit (`VXL_BLK_Magic_BasicManaConduit`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Basic Mana Conduit | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 48 | Deepstone (`VXL_BLK_Terrain_Deepstone`) | block | **RETIRE / ALIAS** | legacy geological/category term only | LOCKED FCC-12 | Must not survive as an active exact material. |
| 49 | Limestone (`VXL_BLK_Terrain_Limestone`) | block | **REBIND CANONICAL** | Limestone | LOCKED FCC-12 | Canonical Overworld stone. |
| 50 | Basalt (`VXL_BLK_Terrain_Basalt`) | block | **REBIND CANONICAL** | Basalt | LOCKED FCC-12 | Shared universal Basalt identity. |
| 51 | Granite (`VXL_BLK_Terrain_Granite`) | block | **REBIND CANONICAL** | Granite | LOCKED FCC-12 | Canonical Overworld stone. |
| 52 | Mossy Cave Stone (`VXL_BLK_Terrain_MossyCaveStone`) | block | **STATE/OVERLAY CONTEXTUAL** | actual cave stone + moss/biological surface state | FCC-12 | Do not create a generic independent Mossy Cave Stone material. |
| 53 | Crystal Stone (`VXL_BLK_Terrain_CrystalStone`) | block | **MIGRATE CONTEXTUALLY / RETIRE** | actual canonical material if source evidence identifies one | LOCKED FCC-12 | Generic POC magical-stone placeholder. |
| 54 | Snow Block (`VXL_BLK_Terrain_SnowBlock`) | block | **PHASE/FORM REVIEW** | Water-derived frozen/snow world representation | FCC-12 PRINCIPLE + POC | Phase/form semantics are expected, but exact world-object binding remains FCC-13B. |
| 55 | Ice Block (`VXL_BLK_Terrain_IceBlock`) | block | **PHASE/FORM REVIEW** | Water-derived frozen/snow world representation | FCC-12 PRINCIPLE + POC | Phase/form semantics are expected, but exact world-object binding remains FCC-13B. |
| 56 | Fertile Soil (`VXL_BLK_Terrain_FertileSoil`) | block | **STATE / QUALITY** | actual soil + fertility state/profile | LOCKED FCC-12 | Fertility does not create a new universal soil material. |
| 57 | Tilled Farmland (`VXL_BLK_Farming_TilledFarmland`) | block | **STATE / WORLD PROJECTION** | actual soil + tilled/cultivated state | LOCKED FCC-12 | Cultivation is state/land use, not new material identity. |
| 58 | Reed Block (`VXL_BLK_Natural_ReedBlock`) | block | **RELATIONSHIP CLUSTER / REBIND** | living/world reed object | FCC-12 + POC EVIDENCE | Related to Item 219; exact botanical identity is not established by POC alone. |
| 59 | Cave Mushroom (`VXL_BLK_Natural_CaveMushroom`) | block | **RELATIONSHIP CLUSTER / REBIND** | living Cave Mushroom world object | FCC-12 + POC EVIDENCE | Related to Item 218; living growth vs harvested food may legitimately use distinct content identities. |
| 60 | Clay Brick Block (`VXL_BLK_Construction_ClayBrickBlock`) | block | **RELATIONSHIP CLUSTER / REBIND** | fired ceramic/clay + brick form | FCC-12 + POC EVIDENCE | Related to Item 223; likely world/inventory projections of the same physical brick construction form. |
| 61 | Clay Roof Tile (`VXL_BLK_Construction_ClayRoofTile`) | block | **MERGE / SINGLE-DEFINITION** | ceramic/clay roof-tile object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Item 224. Final Block/inventory projections must not create duplicate underlying objects. |
| 62 | Stone Pillar (`VXL_BLK_Construction_StonePillar`) | block | **PROVIDER/FORM REBIND** | actual stone/provider + authored construction form | LOCKED FCC-12 | Generic stone must resolve through actual material/provider semantics. |
| 63 | Stone Wall (`VXL_BLK_Construction_StoneWall`) | block | **PROVIDER/FORM REBIND** | actual stone/provider + authored construction form | LOCKED FCC-12 | Generic stone must resolve through actual material/provider semantics. |
| 64 | Stone Arch (`VXL_BLK_Construction_StoneArch`) | block | **PROVIDER/FORM REBIND** | actual stone/provider + authored construction form | LOCKED FCC-12 | Generic stone must resolve through actual material/provider semantics. |
| 65 | Wooden Shutter (`VXL_BLK_Construction_WoodenShutter`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 66 | Wooden Ladder (`VXL_BLK_Utility_WoodenLadder`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 67 | Wooden Trapdoor (`VXL_BLK_Construction_WoodenTrapdoor`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 68 | Simple Bed (`VXL_BLK_Furniture_SimpleBed`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Simple Bed | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 69 | Wooden Table (`VXL_BLK_Furniture_WoodenTable`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Wooden Table | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 70 | Wooden Chair (`VXL_BLK_Furniture_WoodenChair`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Wooden Chair | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 71 | Bookshelf (`VXL_BLK_Furniture_Bookshelf`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Bookshelf | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 72 | Dirt Path (`VXL_BLK_Road_DirtPath`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Dirt Path | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 73 | Sawmill (`VXL_MCH_Functional_Sawmill`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Sawmill | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 74 | Forge and Anvil (`VXL_MCH_Functional_ForgeAndAnvil`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Forge and Anvil | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 75 | Loom (`VXL_MCH_Functional_Loom`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Loom | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 76 | Alchemy Table (`VXL_MCH_Functional_AlchemyTable`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Alchemy Table | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 77 | Enchanting Station (`VXL_BLK_Magic_EnchantingStation`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Enchanting Station | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 78 | Machine Assembler (`VXL_MCH_Automation_MachineAssembler`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Machine Assembler | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 79 | Research Desk (`VXL_MCH_Functional_ResearchDesk`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Research Desk | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 80 | Wooden Crate (`VXL_BLK_Storage_WoodenCrate`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Wooden Crate | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 81 | Wooden Barrel (`VXL_BLK_Storage_WoodenBarrel`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Wooden Barrel | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 82 | Grain Silo (`VXL_BLK_Storage_GrainSilo`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Grain Silo | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 83 | Linked Warehouse (`VXL_BLK_Storage_LinkedWarehouse`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Linked Warehouse | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 84 | Cart Depot (`VXL_MCH_Automation_CartDepot`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Cart Depot | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 85 | Conveyor Belt (`VXL_MCH_Automation_ConveyorBelt`) | block | **SYSTEM CANDIDATE / REBIND** | Conveyor Belt | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 86 | Item Pipe (`VXL_MCH_Automation_ItemPipe`) | block | **SYSTEM CANDIDATE / REBIND** | Item Pipe | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 87 | Splitter (`VXL_MCH_Automation_Splitter`) | block | **SYSTEM CANDIDATE / REBIND** | Splitter | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 88 | Sorter / Filter (`VXL_MCH_Automation_SorterFilter`) | block | **SYSTEM CANDIDATE / REBIND** | Sorter / Filter | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 89 | Merger (`VXL_MCH_Automation_Merger`) | block | **SYSTEM CANDIDATE / REBIND** | Merger | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 90 | Crusher (`VXL_MCH_Automation_Crusher`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Crusher | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 91 | Grinder (`VXL_MCH_Automation_Grinder`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Grinder | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 92 | Pump (`VXL_MCH_Automation_Pump`) | block | **SYSTEM CANDIDATE / REBIND** | Pump | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 93 | Fluid Pipe (`VXL_MCH_Automation_FluidPipe`) | block | **SYSTEM CANDIDATE / REBIND** | Fluid Pipe | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 94 | Water Wheel (`VXL_BLK_Automation_WaterWheel`) | block | **SYSTEM CANDIDATE / REBIND** | Water Wheel | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 95 | Windmill (`VXL_BLK_Automation_Windmill`) | block | **SYSTEM CANDIDATE / REBIND** | Windmill | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 96 | Manual Crank (`VXL_BLK_Automation_ManualCrank`) | block | **SYSTEM CANDIDATE / REBIND** | Manual Crank | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 97 | Fuel Engine (`VXL_BLK_Automation_FuelEngine`) | block | **SYSTEM CANDIDATE / REBIND** | Fuel Engine | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 98 | Mana Battery (`VXL_BLK_Magic_ManaBattery`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Mana Battery | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 99 | Rune Engine (`VXL_BLK_Magic_RuneEngine`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Rune Engine | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 100 | Arcane Furnace (`VXL_MCH_Automation_ArcaneFurnace`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Arcane Furnace | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 101 | Rune Miner (`VXL_MCH_Automation_RuneMiner`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Rune Miner | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 102 | Golem Workstation (`VXL_MCH_Automation_GolemWorkstation`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Golem Workstation | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 103 | Farm Processor (`VXL_MCH_Automation_FarmProcessor`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Farm Processor | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 104 | Plank Maker (`VXL_MCH_Automation_PlankMaker`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Plank Maker | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 105 | Arcane Assembler (`VXL_MCH_Automation_ArcaneAssembler`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Arcane Assembler | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 106 | Mana Crystal Block (`VXL_BLK_Magic_ManaCrystalBlock`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Mana Crystal Block | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 107 | Ritual Anchor (`VXL_BLK_Magic_RitualAnchor`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Ritual Anchor | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 108 | Ancient Portal Frame (`VXL_BLK_Magic_AncientPortalFrame`) | block | **STRUCTURE / MIGRATION** | archaeological or canonical portal-structure content | LOCKED FCC-12 | Not a generic seventh portal material/family. |
| 109 | Corrupted Ground (`VXL_BLK_Magic_CorruptedGround`) | block | **STATE / OVERLAY** | actual ground material + corruption state/overlay | LOCKED FCC-12 | Corruption is state-first. |
| 110 | Rune Trap (`VXL_BLK_Defence_RuneTrap`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Rune Trap | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 111 | Spell Turret (`VXL_BLK_Defence_SpellTurret`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Spell Turret | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 112 | Enchantment Pillar (`VXL_BLK_Magic_EnchantmentPillar`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Enchantment Pillar | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 113 | Ward Obelisk (`VXL_BLK_Magic_WardObelisk`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Ward Obelisk | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 114 | Blueprint Marker (`VXL_BLK_Village_BlueprintMarker`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Blueprint Marker | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 115 | Scaffold Block (`VXL_BLK_Village_ScaffoldBlock`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Scaffold Block | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 116 | Construction Supply Crate (`VXL_BLK_Village_ConstructionSupplyCrate`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Construction Supply Crate | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 117 | Job-Site Marker (`VXL_BLK_Village_JobsiteMarker`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Job-Site Marker | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 118 | Repair Marker (`VXL_BLK_Village_RepairMarker`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Repair Marker | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 119 | Market Stall (`VXL_BLK_Village_MarketStall`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Market Stall | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 120 | Village Alarm Bell (`VXL_BLK_Defence_VillageAlarmBell`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Village Alarm Bell | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 121 | Village Shrine (`VXL_BLK_Village_VillageShrine`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Village Shrine | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 122 | Stone Defensive Wall (`VXL_BLK_Defence_StoneDefensiveWall`) | block | **PROVIDER/FORM REBIND** | actual stone/provider + authored construction form | LOCKED FCC-12 | Generic stone must resolve through actual material/provider semantics. |
| 123 | Iron Gate (`VXL_BLK_Defence_IronGate`) | block | **SYSTEM/OBJECT CANDIDATE — DEFER EXACT** | Iron Gate | POC EVIDENCE | Concept may remain useful, but current source set does not prove this exact POC Block/ID is canonical. Re-evaluate in FCC-13B/C. |
| 124 | Wooden Barricade (`VXL_BLK_Defence_WoodenBarricade`) | block | **OBJECT/PROVIDER REBIND** | timber material/provider + construction archetype | FCC-12 + PROJECT SYSTEM | Retain actual timber composition; exact object/archetype remains FCC-13B work. |
| 125 | Lava / Magma (`VXL_BLK_Fluid_LavaMagma`) | block | **CLASS / WORLD REPRESENTATION** | composition-aware molten-rock family/form | LOCKED FCC-12 | Lava/Magma is not one realm-specific monolithic material. |
| 126 | Poison Sludge (`VXL_BLK_Fluid_PoisonSludge`) | block | **FLUID MIXTURE — UNCONFIRMED** | authored fluid mixture if later retained | POC ONLY | No current locked FCC-12 exact material target established. |
| 127 | Thorn Vine (`VXL_BLK_Hazard_ThornVine`) | block | **LIVING/NATURAL OBJECT — DEFER EXACT** | species/plant object and harvested products as later bound | POC + ECOLOGY SYSTEM | Do not infer a new material identity from the world object. |
| 128 | Cursed Ground (`VXL_BLK_Hazard_CursedGround`) | block | **STATE/OVERLAY — UNCONFIRMED** | actual ground + authored curse state/overlay if retained | POC ONLY + FCC-12 STATE RULE | Current locked material canon does not prove this exact hazard survives; must not become a new base ground material. |
| 129 | Quicksand (`VXL_BLK_Terrain_Quicksand`) | block | **TERRAIN STATE/MIXTURE REVIEW** | sand/sediment + saturation/mechanical state | FCC-12 PRINCIPLE + POC | Likely state/mixture rather than new universal base material; exact simulation binding remains open. |
| 130 | Snow Layer (`VXL_BLK_Weather_SnowLayer`) | block | **PHASE/FORM REVIEW** | Water-derived frozen/snow world representation | FCC-12 PRINCIPLE + POC | Phase/form semantics are expected, but exact world-object binding remains FCC-13B. |
| 131 | Arcane Mana Fluid (`VXL_BLK_Fluid_ArcaneManaFluid`) | block | **DEFER / UNCONFIRMED FLUID** | none yet | POC ONLY | No current locked FCC-12 material identity supports automatic carry-forward. |
| 132 | Steam Vent (`VXL_BLK_Hazard_SteamVent`) | block | **WORLD FEATURE / PHASE RELATION** | vent feature emitting Water vapour/steam or authored gas | FCC-12 PRINCIPLE + POC | Vent is a world feature, not itself a material. |
| 133 | Voidstone (`VXL_BLK_Dimension_Voidstone`) | block | **DEFER / MIGRATION-ONLY** | future/deferred Void content | LOCKED FCC-12 | Do not activate current playable Void material progression. |
| 134 | Celestial Stone (`VXL_BLK_Dimension_CelestialStone`) | block | **MIGRATE CONTEXTUALLY** | Cloudstone / Hymnstone / valid Ascendant state according to source context | LOCKED FCC-12 | Obsolete generic Ascendant placeholder. |
| 135 | Fae Grass (`VXL_BLK_Dimension_FaeGrass`) | block | **MIGRATE CONTEXTUALLY** | actual Verdant flora/terrain definition | LOCKED FCC-12 | Legacy flora/terrain label, not an exact material. |
| 136 | Dream Glass (`VXL_BLK_Dimension_DreamGlass`) | block | **MIGRATE CONTEXTUALLY** | Lucid Glass or documented Lucid Glass state/product | LOCKED FCC-12 | Do not retain generic Dream Glass as a separate base material. |
| 137 | Infernal Brick (`VXL_BLK_Dimension_InfernalBrick`) | block | **MIGRATE** | Ash Brick lineage | LOCKED FCC-12 | Legacy Ashen construction term. |
| 138 | Deep Forge Stone (`VXL_BLK_Dimension_DeepForgeStone`) | block | **RETIRE / CONTEXTUAL MIGRATION** | canonical Impossible Deep stone/form determined by source context | LOCKED FCC-12 | Independent natural material family retired. |
| 139 | Broken Portal Block (`VXL_BLK_Dimension_BrokenPortalBlock`) | block | **STATE / STRUCTURE PIECE** | damaged/ruined state or piece of a canonical portal structure | LOCKED FCC-12 | Not a standalone generic realm-access Block. |
| 140 | Unstable Rift Block (`VXL_BLK_Dimension_UnstableRiftBlock`) | block | **ANOMALY / INTERFACE** | rift/anomaly/event content | LOCKED FCC-12 | Not a normal material or generic portal Block. |
| 141 | Strange Realm Ore (`VXL_BLK_Dimension_StrangeRealmOre`) | block | **REJECT** | none | LOCKED FCC-12 | Generic dimensional filler material rejected. |
| 142 | Oak Log (`VXL_ITM_RawResource_OakLog`) | item | **MERGE / SINGLE-DEFINITION** | Oak timber/log object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Block 9. Final Block/inventory projections must not create duplicate underlying objects. |
| 143 | Stick (`VXL_ITM_RawResource_Stick`) | item | **FORM / PROVIDER** | compatible wood/plant material + stick form | FCC-12 | Generic physical form; actual material should be preserved. |
| 144 | Plant Fibre (`VXL_ITM_RawResource_PlantFibre`) | item | **CATEGORY / PROVIDER** | exact botanical fibre, Mixed Plant Fibre, or fibre provider semantics | LOCKED FCC-12 | Plant Fibre is not the universal identity of all botanical fibres. |
| 145 | Thatch Bundle (`VXL_ITM_ProcessedMaterial_ThatchBundle`) | item | **FORM/PRODUCT REBIND** | valid fibre/plant provider + authored form/product | LOCKED FCC-12 | Underlying fibre/material must remain explicit; do not use generic Plant Fibre as universal identity. |
| 146 | Stone Chunk (`VXL_ITM_RawResource_StoneChunk`) | item | **GENERIC FORM / CONTEXTUAL** | actual stone material + chunk form | LOCKED FCC-12 | Must retain the source stone rather than become generic Stone matter. |
| 147 | Flint (`VXL_ITM_RawResource_Flint`) | item | **MATERIAL/FORM REVIEW** | Flint | POC EVIDENCE + FCC-12 | Resolve underlying canonical material, form and transformation explicitly before rebinding. |
| 148 | Clay Lump (`VXL_ITM_RawResource_ClayLump`) | item | **CLASS / FORM** | specific clay material/profile + lump form | LOCKED FCC-12 | Do not collapse all clay into one exact material. |
| 149 | Sand (`VXL_ITM_RawResource_Sand`) | item | **CATEGORY / FORM** | composition-bearing Sand class | LOCKED FCC-12 | Exact underlying material follows composition. |
| 150 | Coal Chunk (`VXL_ITM_RawResource_CoalChunk`) | item | **FORM / REBIND** | Coal + chunk form | CURRENT CANON | Coal is canonical fuel; chunk is form. |
| 151 | Raw Copper Ore (`VXL_ITM_RawResource_RawCopperOre`) | item | **SOURCE / FEEDSTOCK** | Copper-bearing ore/feedstock | LOCKED FCC-12 | Ore is not refined Copper; grade/composition remain separate. |
| 152 | Copper Ingot (`VXL_ITM_RefinedMaterial_CopperIngot`) | item | **FORM / REBIND CANONICAL** | Copper + ingot form | LOCKED FCC-12 | Copper is canonical/shared where equivalent; ingot is a physical/product form. |
| 153 | Copper Wire (`VXL_ITM_MachineMaterial_CopperWire`) | item | **FORM / REBIND CANONICAL** | Copper + wire form | LOCKED FCC-12 | Copper is canonical/shared where equivalent; wire is a physical/product form. |
| 154 | Copper Plate (`VXL_ITM_MachineMaterial_CopperPlate`) | item | **FORM / REBIND CANONICAL** | Copper + plate form | LOCKED FCC-12 | Copper is canonical/shared where equivalent; plate is a physical/product form. |
| 155 | Copper Gear (`VXL_MCH_MachineComponent_CopperGear`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 156 | Raw Iron Ore (`VXL_ITM_RawResource_RawIronOre`) | item | **SOURCE / FEEDSTOCK** | Iron-bearing ore/feedstock | LOCKED FCC-12 | Ore is not refined Iron; grade/composition remain separate. |
| 157 | Iron Ingot (`VXL_ITM_RefinedMaterial_IronIngot`) | item | **FORM / REBIND CANONICAL** | Iron + ingot form | LOCKED FCC-12 | Iron is canonical/shared where equivalent; ingot is a physical/product form. |
| 158 | Iron Plate (`VXL_ITM_MachineMaterial_IronPlate`) | item | **FORM / REBIND CANONICAL** | Iron + plate form | LOCKED FCC-12 | Iron is canonical/shared where equivalent; plate is a physical/product form. |
| 159 | Iron Rod (`VXL_ITM_MachineMaterial_IronRod`) | item | **FORM / REBIND CANONICAL** | Iron + rod form | LOCKED FCC-12 | Iron is canonical/shared where equivalent; rod is a physical/product form. |
| 160 | Iron Nails (`VXL_ITM_ConstructionMaterial_IronNails`) | item | **FORM / REBIND CANONICAL** | Iron + fastener/nails form | LOCKED FCC-12 | Iron is canonical/shared where equivalent; fastener/nails is a physical/product form. |
| 161 | Raw Mana Crystal (`VXL_ITM_RawResource_RawManaCrystal`) | item | **REBIND CANONICAL** | Raw Mana Crystal | LOCKED FCC-12 | Canonical material. |
| 162 | Mana Shard (`VXL_ITM_MagicComponent_ManaShard`) | item | **FORM / PRODUCT** | Raw Mana Crystal / canonical mana-crystal lineage + shard form | LOCKED FCC-12 | Derived form/product, not unrelated material. |
| 163 | Mana Dust (`VXL_ITM_MagicComponent_ManaDust`) | item | **FORM / PRODUCT** | Raw Mana Crystal / canonical mana-crystal lineage + dust form | LOCKED FCC-12 | Derived form/product, not unrelated material. |
| 164 | Blank Rune Stone (`VXL_ITM_MagicComponent_BlankRuneStone`) | item | **DEFER / UNCONFIRMED** | Blank Rune Stone | POC EVIDENCE | No automatic canonical carry-forward. Requires a later FCC-13 source/canon decision. |
| 165 | Basic Rune (`VXL_ITM_MagicComponent_BasicRune`) | item | **DEFER / UNCONFIRMED** | Basic Rune | POC EVIDENCE | No automatic canonical carry-forward. Requires a later FCC-13 source/canon decision. |
| 166 | Basic Ward Core (`VXL_ITM_MagicComponent_BasicWardCore`) | item | **COMPONENT / DEFER EXACT** | Basic Ward Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 167 | Oak Plank (`VXL_ITM_ProcessedMaterial_OakPlank`) | item | **RELATIONSHIP CLUSTER / REBIND** | Oak timber + plank form | FCC-12 + POC EVIDENCE | Related to Block 11; singular/plural legacy naming must not force duplicate semantics. |
| 168 | Oak Beam (`VXL_ITM_ConstructionMaterial_OakBeam`) | item | **MERGE / SINGLE-DEFINITION** | Oak timber beam object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Block 33. Final Block/inventory projections must not create duplicate underlying objects. |
| 169 | Cobblestone (`VXL_ITM_ConstructionMaterial_Cobblestone`) | item | **MERGE / SINGLE-DEFINITION** | stone-material cobble object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Block 32. Final Block/inventory projections must not create duplicate underlying objects. |
| 170 | Stone Brick (`VXL_ITM_ConstructionMaterial_StoneBrick`) | item | **MERGE / SINGLE-DEFINITION** | stone-material masonry brick object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Block 31. Final Block/inventory projections must not create duplicate underlying objects. |
| 171 | Glass Piece (`VXL_ITM_ProcessedMaterial_GlassPiece`) | item | **FORM / CONTEXTUAL** | actual glass material + piece/shard form | LOCKED FCC-12 | Ordinary or specialist glass identity must be retained. |
| 172 | Wild Berries (`VXL_ITM_Food_WildBerries`) | item | **DEFER / CONTENT REVIEW** | Wild Berries | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 173 | Wheat Seed (`VXL_ITM_Seed_WheatSeed`) | item | **DEFER / UNCONFIRMED** | Wheat Seed | POC EVIDENCE | No automatic canonical carry-forward. Requires a later FCC-13 source/canon decision. |
| 174 | Wheat (`VXL_ITM_Food_Wheat`) | item | **DEFER / CONTENT REVIEW** | Wheat | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 175 | Bread (`VXL_ITM_Food_Bread`) | item | **DEFER / CONTENT REVIEW** | Bread | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 176 | Raw Meat (`VXL_ITM_Food_RawMeat`) | item | **DEFER / CONTENT REVIEW** | Raw Meat | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 177 | Cooked Meat (`VXL_ITM_Food_CookedMeat`) | item | **DEFER / CONTENT REVIEW** | Cooked Meat | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 178 | Simple Stew (`VXL_ITM_Food_SimpleStew`) | item | **DEFER / CONTENT REVIEW** | Simple Stew | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 179 | Water Flask (`VXL_ITM_Drink_WaterFlask`) | item | **DEFER / CONTENT REVIEW** | Water Flask | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 180 | Crude Pickaxe (`VXL_ITM_Tool_CrudePickaxe`) | item | **DEFER / TOOL REVIEW** | Crude Pickaxe | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 181 | Crude Axe (`VXL_ITM_Tool_CrudeAxe`) | item | **DEFER / TOOL REVIEW** | Crude Axe | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 182 | Stone Pickaxe (`VXL_ITM_Tool_StonePickaxe`) | item | **DEFER / TOOL REVIEW** | Stone Pickaxe | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 183 | Stone Axe (`VXL_ITM_Tool_StoneAxe`) | item | **DEFER / TOOL REVIEW** | Stone Axe | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 184 | Iron Pickaxe (`VXL_ITM_Tool_IronPickaxe`) | item | **DEFER / TOOL REVIEW** | Iron Pickaxe | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 185 | Iron Axe (`VXL_ITM_Tool_IronAxe`) | item | **DEFER / TOOL REVIEW** | Iron Axe | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 186 | Basic Hammer (`VXL_ITM_Tool_BasicHammer`) | item | **REBIND CANDIDATE** | Hammer | PROJECT SYSTEM + POC | Hammer tool family is an established Leyforge special tool concept; exact 'Basic' row remains binding-stage work. |
| 187 | Basic Wrench (`VXL_ITM_Tool_BasicWrench`) | item | **REBIND CANDIDATE** | Wrench | PROJECT SYSTEM + POC | Wrench tool family is an established Leyforge special tool concept. |
| 188 | Basic Rune Tuner (`VXL_ITM_Tool_BasicRuneTuner`) | item | **REBIND CANDIDATE** | Rune Tuner | PROJECT SYSTEM + POC | Rune Tuner is an established Leyforge special tool concept. |
| 189 | Rune Chisel (`VXL_ITM_Tool_RuneChisel`) | item | **REBIND CANDIDATE** | Rune Chisel | PROJECT SYSTEM + POC | Rune Chisel is an established Leyforge special tool concept. |
| 190 | Blueprint Tool (`VXL_ITM_Tool_BlueprintTool`) | item | **DEFER / TOOL REVIEW** | Blueprint Tool | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 191 | Iron Sword (`VXL_ITM_Weapon_IronSword`) | item | **DEFER / EQUIPMENT REVIEW** | Iron Sword | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 192 | Wooden Bow (`VXL_ITM_Weapon_WoodenBow`) | item | **DEFER / EQUIPMENT REVIEW** | Wooden Bow | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 193 | Arrow Bundle (`VXL_ITM_Ammo_ArrowBundle`) | item | **DEFER / EQUIPMENT REVIEW** | Arrow Bundle | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 194 | Apprentice Staff (`VXL_ITM_Weapon_ApprenticeStaff`) | item | **DEFER / EQUIPMENT REVIEW** | Apprentice Staff | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 195 | Wooden Shield (`VXL_ITM_Equipment_WoodenShield`) | item | **DEFER / EQUIPMENT REVIEW** | Wooden Shield | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 196 | Leather Tunic (`VXL_ITM_Armour_LeatherTunic`) | item | **DEFER / EQUIPMENT REVIEW** | Leather Tunic | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 197 | Small Backpack (`VXL_ITM_Equipment_SmallBackpack`) | item | **DEFER / EQUIPMENT REVIEW** | Small Backpack | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 198 | Wooden Machine Frame (`VXL_MCH_MachineComponent_WoodenMachineFrame`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 199 | Copper Machine Frame (`VXL_MCH_MachineComponent_CopperMachineFrame`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 200 | Basic Machine Core (`VXL_MCH_MachineComponent_BasicMachineCore`) | item | **COMPONENT / DEFER EXACT** | Basic Machine Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 201 | Item Chute Segment (`VXL_MCH_MachineComponent_ItemChuteSegment`) | item | **COMPONENT REBIND CANDIDATE** | Item Chute Segment | PROJECT SYSTEM + POC | Component relationship is plausible for established logistics systems; exact canonical identity remains FCC-13C. |
| 202 | Iron Miner Head (`VXL_MCH_MachineComponent_IronMinerHead`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 203 | Stone Furnace Core (`VXL_MCH_MachineComponent_StoneFurnaceCore`) | item | **COMPONENT / DEFER EXACT** | Stone Furnace Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 204 | Mana Furnace Core (`VXL_MCH_MachineComponent_ManaFurnaceCore`) | item | **COMPONENT / DEFER EXACT** | Mana Furnace Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 205 | Ward Lantern Core (`VXL_MCH_MagicComponent_WardLanternCore`) | item | **COMPONENT / DEFER EXACT** | Ward Lantern Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 206 | Copper Trade Coin (`VXL_ITM_Currency_CopperTradeCoin`) | item | **DEFER / ECONOMY BINDING** | Copper Trade Coin | FCC-01 ECONOMY + POC | Currency is not universally fixed; this POC row must not become universal money by inheritance. |
| 207 | Village Supply Token (`VXL_ITM_Economy_VillageSupplyToken`) | item | **DEFER / ECONOMY BINDING** | Village Supply Token | FCC-01 ECONOMY + POC | Currency is not universally fixed; this POC row must not become universal money by inheritance. |
| 208 | Builder Request Slip (`VXL_ITM_QuestItem_BuilderRequestSlip`) | item | **DEFER / CONTENT REVIEW** | Builder Request Slip | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 209 | Warehouse Crate Manifest (`VXL_ITM_QuestItem_WarehouseCrateManifest`) | item | **DEFER / CONTENT REVIEW** | Warehouse Crate Manifest | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 210 | Goblin Scrap (`VXL_ITM_MonsterDrop_GoblinScrap`) | item | **HOLD / PERSONHOOD-CATEGORY REVIEW** | Goblin Scrap | FCC-01 PERSONHOOD + POC | Goblin is a sapient ancestry; legacy 'Monster Drop' categorisation must not imply generic monster/dehumanised loot semantics. |
| 211 | Crude Goblin Blade (`VXL_ITM_MonsterDrop_CrudeGoblinBlade`) | item | **HOLD / PERSONHOOD-CATEGORY REVIEW** | Crude Goblin Blade | FCC-01 PERSONHOOD + POC | Goblin is a sapient ancestry; legacy 'Monster Drop' categorisation must not imply generic monster/dehumanised loot semantics. |
| 212 | Weak Monster Essence (`VXL_ITM_MonsterDrop_WeakMonsterEssence`) | item | **DEFER / LOOT REVIEW** | Weak Monster Essence | POC EVIDENCE | Exact drop/creature provenance is not established by FCC-12. |
| 213 | Torn Research Page (`VXL_ITM_Knowledge_TornResearchPage`) | item | **DEFER / CONTENT REVIEW** | Torn Research Page | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 214 | Basic Rune Note (`VXL_ITM_Knowledge_BasicRuneNote`) | item | **DEFER / CONTENT REVIEW** | Basic Rune Note | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 215 | Local Map Fragment (`VXL_ITM_Knowledge_LocalMapFragment`) | item | **DEFER / CONTENT REVIEW** | Local Map Fragment | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 216 | Gravel (`VXL_ITM_RawResource_Gravel`) | item | **CATEGORY / FORM** | composition-bearing Gravel class | LOCKED FCC-12 | Exact underlying material follows composition. |
| 217 | Common Herb (`VXL_ITM_RawResource_CommonHerb`) | item | **MATERIAL/FORM REVIEW** | Common Herb | POC EVIDENCE + FCC-12 | Resolve underlying canonical material, form and transformation explicitly before rebinding. |
| 218 | Cave Mushroom (`VXL_ITM_Food_CaveMushroom`) | item | **RELATIONSHIP CLUSTER / REBIND** | harvested Cave Mushroom product | FCC-12 + POC EVIDENCE | Related to Block 59; lifecycle split candidate, not automatic merge. |
| 219 | Reed (`VXL_ITM_RawResource_Reed`) | item | **RELATIONSHIP CLUSTER / REBIND** | harvested reed material/product | FCC-12 + POC EVIDENCE | Related to Block 58; harvested product may be distinct lifecycle representation. |
| 220 | Paper (`VXL_ITM_ProcessedMaterial_Paper`) | item | **MATERIAL/FORM REVIEW** | Paper | POC EVIDENCE + FCC-12 | Resolve underlying canonical material, form and transformation explicitly before rebinding. |
| 221 | Basic Ink (`VXL_ITM_ProcessedMaterial_BasicInk`) | item | **MATERIAL/FORM REVIEW** | Basic Ink | POC EVIDENCE + FCC-12 | Resolve underlying canonical material, form and transformation explicitly before rebinding. |
| 222 | Charcoal (`VXL_ITM_ProcessedMaterial_Charcoal`) | item | **PROCESSED MATERIAL / REBIND** | Charcoal | CURRENT CANON | Canonical Overworld fuel; exact process binding belongs later FCC-13. |
| 223 | Clay Brick (`VXL_ITM_ConstructionMaterial_ClayBrick`) | item | **RELATIONSHIP CLUSTER / REBIND** | fired ceramic/clay + brick form | FCC-12 + POC EVIDENCE | Related to Block 60. |
| 224 | Clay Roof Tile (`VXL_ITM_ConstructionMaterial_ClayRoofTile`) | item | **MERGE / SINGLE-DEFINITION** | ceramic/clay roof-tile object | FCC-12 SINGLE-DEFINITION | Pairs with legacy Block 61. Final Block/inventory projections must not create duplicate underlying objects. |
| 225 | Rope (`VXL_ITM_ProcessedMaterial_Rope`) | item | **FORM/PRODUCT REBIND** | valid fibre/plant provider + authored form/product | LOCKED FCC-12 | Underlying fibre/material must remain explicit; do not use generic Plant Fibre as universal identity. |
| 226 | Basic Cloth (`VXL_ITM_ProcessedMaterial_BasicCloth`) | item | **FORM/PRODUCT REBIND** | valid fibre/plant provider + authored form/product | LOCKED FCC-12 | Underlying fibre/material must remain explicit; do not use generic Plant Fibre as universal identity. |
| 227 | Leather (`VXL_ITM_ProcessedMaterial_Leather`) | item | **MATERIAL/FORM REVIEW** | Leather | POC EVIDENCE + FCC-12 | Resolve underlying canonical material, form and transformation explicitly before rebinding. |
| 228 | Steel Ingot (`VXL_ITM_RefinedMaterial_SteelIngot`) | item | **FORM / REBIND CANONICAL** | Steel + ingot form | LOCKED FCC-12 | Steel is canonical/shared where equivalent; ingot is a physical/product form. |
| 229 | Steel Plate (`VXL_ITM_MachineMaterial_SteelPlate`) | item | **FORM / REBIND CANONICAL** | Steel + plate form | LOCKED FCC-12 | Steel is canonical/shared where equivalent; plate is a physical/product form. |
| 230 | Iron Gear (`VXL_MCH_MachineComponent_IronGear`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 231 | Wooden Gear (`VXL_MCH_MachineComponent_WoodenGear`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 232 | Wooden Shaft (`VXL_MCH_MachineComponent_WoodenShaft`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 233 | Iron Shaft (`VXL_MCH_MachineComponent_IronShaft`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 234 | Belt Roll (`VXL_MCH_MachineComponent_BeltRoll`) | item | **COMPONENT REBIND CANDIDATE** | Belt Roll | PROJECT SYSTEM + POC | Component relationship is plausible for established logistics systems; exact canonical identity remains FCC-13C. |
| 235 | Item Pipe Section (`VXL_MCH_MachineComponent_ItemPipeSection`) | item | **COMPONENT REBIND CANDIDATE** | Item Pipe Section | PROJECT SYSTEM + POC | Component relationship is plausible for established logistics systems; exact canonical identity remains FCC-13C. |
| 236 | Fluid Pipe Section (`VXL_MCH_MachineComponent_FluidPipeSection`) | item | **COMPONENT REBIND CANDIDATE** | Fluid Pipe Section | PROJECT SYSTEM + POC | Component relationship is plausible for established logistics systems; exact canonical identity remains FCC-13C. |
| 237 | Filter Screen (`VXL_MCH_MachineComponent_FilterScreen`) | item | **COMPONENT REBIND CANDIDATE** | Filter Screen | PROJECT SYSTEM + POC | Component relationship is plausible for established logistics systems; exact canonical identity remains FCC-13C. |
| 238 | Sorter Core (`VXL_MCH_MachineComponent_SorterCore`) | item | **COMPONENT REBIND CANDIDATE** | Sorter Core | PROJECT SYSTEM + POC | Component relationship is plausible for established logistics systems; exact canonical identity remains FCC-13C. |
| 239 | Water Wheel Axle (`VXL_MCH_MachineComponent_WaterWheelAxle`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 240 | Windmill Sail (`VXL_MCH_MachineComponent_WindmillSail`) | item | **COMPONENT REBIND** | component object retaining actual source material | LOCKED FCC-12 + POC | Component is not a material family; exact component identity/recipe remains FCC-13C. |
| 241 | Mana Coil (`VXL_MCH_MagicMachineComponent_ManaCoil`) | item | **COMPONENT / DEFER EXACT** | Mana Coil | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 242 | Mana Battery Core (`VXL_ITM_MagicMachineComponent_ManaBatteryCore`) | item | **COMPONENT / DEFER EXACT** | Mana Battery Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 243 | Iron Shovel (`VXL_ITM_Tool_IronShovel`) | item | **DEFER / TOOL REVIEW** | Iron Shovel | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 244 | Basic Hoe (`VXL_ITM_Tool_BasicHoe`) | item | **DEFER / TOOL REVIEW** | Basic Hoe | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 245 | Basic Sickle (`VXL_ITM_Tool_BasicSickle`) | item | **DEFER / TOOL REVIEW** | Basic Sickle | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 246 | Basic Saw (`VXL_ITM_Tool_BasicSaw`) | item | **DEFER / TOOL REVIEW** | Basic Saw | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 247 | Measuring Rope (`VXL_ITM_Tool_MeasuringRope`) | item | **DEFER / TOOL REVIEW** | Measuring Rope | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 248 | Stone Spear (`VXL_ITM_Weapon_StoneSpear`) | item | **DEFER / EQUIPMENT REVIEW** | Stone Spear | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 249 | Iron Spear (`VXL_ITM_Weapon_IronSpear`) | item | **DEFER / EQUIPMENT REVIEW** | Iron Spear | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 250 | Basic Crossbow (`VXL_ITM_Weapon_BasicCrossbow`) | item | **DEFER / EQUIPMENT REVIEW** | Basic Crossbow | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 251 | Bolt Bundle (`VXL_ITM_Ammo_BoltBundle`) | item | **DEFER / EQUIPMENT REVIEW** | Bolt Bundle | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 252 | Spark Wand (`VXL_ITM_Weapon_SparkWand`) | item | **DEFER / EQUIPMENT REVIEW** | Spark Wand | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 253 | Blank Spellbook (`VXL_ITM_MagicEquipment_BlankSpellbook`) | item | **DEFER / EQUIPMENT REVIEW** | Blank Spellbook | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 254 | Iron Helmet (`VXL_ITM_Armour_IronHelmet`) | item | **DEFER / EQUIPMENT REVIEW** | Iron Helmet | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 255 | Iron Chestplate (`VXL_ITM_Armour_IronChestplate`) | item | **DEFER / EQUIPMENT REVIEW** | Iron Chestplate | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 256 | Apprentice Mage Robe (`VXL_ITM_Armour_ApprenticeMageRobe`) | item | **DEFER / EQUIPMENT REVIEW** | Apprentice Mage Robe | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 257 | Iron Shield (`VXL_ITM_Equipment_IronShield`) | item | **DEFER / EQUIPMENT REVIEW** | Iron Shield | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 258 | Tool Belt (`VXL_ITM_Equipment_ToolBelt`) | item | **DEFER / EQUIPMENT REVIEW** | Tool Belt | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 259 | Roasted Mushroom (`VXL_ITM_Food_RoastedMushroom`) | item | **DEFER / CONTENT REVIEW** | Roasted Mushroom | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 260 | Village Meal Pack (`VXL_ITM_Food_VillageMealPack`) | item | **DEFER / CONTENT REVIEW** | Village Meal Pack | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 261 | Herbal Tea (`VXL_ITM_Drink_HerbalTea`) | item | **DEFER / CONTENT REVIEW** | Herbal Tea | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 262 | Healing Poultice (`VXL_ITM_Consumable_HealingPoultice`) | item | **DEFER / CONTENT REVIEW** | Healing Poultice | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 263 | Basic Healing Potion (`VXL_ITM_Consumable_BasicHealingPotion`) | item | **DEFER / CONTENT REVIEW** | Basic Healing Potion | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 264 | Minor Recall Scroll (`VXL_ITM_Consumable_MinorRecallScroll`) | item | **DEFER / CONTENT REVIEW** | Minor Recall Scroll | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 265 | Silver Trade Coin (`VXL_ITM_Currency_SilverTradeCoin`) | item | **DEFER / ECONOMY BINDING** | Silver Trade Coin | FCC-01 ECONOMY + POC | Currency is not universally fixed; this POC row must not become universal money by inheritance. |
| 266 | Grain Sack (`VXL_ITM_TradeGood_GrainSack`) | item | **DEFER / CONTENT REVIEW** | Grain Sack | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 267 | Tool Bundle (`VXL_ITM_TradeGood_ToolBundle`) | item | **DEFER / CONTENT REVIEW** | Tool Bundle | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 268 | Guard Weapon Bundle (`VXL_ITM_TradeGood_GuardWeaponBundle`) | item | **DEFER / CONTENT REVIEW** | Guard Weapon Bundle | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 269 | Medical Bundle (`VXL_ITM_TradeGood_MedicalBundle`) | item | **DEFER / CONTENT REVIEW** | Medical Bundle | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 270 | Festival Goods (`VXL_ITM_TradeGood_FestivalGoods`) | item | **DEFER / CONTENT REVIEW** | Festival Goods | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 271 | Wolf Pelt (`VXL_ITM_Loot_WolfPelt`) | item | **DEFER / LOOT REVIEW** | Wolf Pelt | POC EVIDENCE | Exact drop/creature provenance is not established by FCC-12. |
| 272 | Beast Fang (`VXL_ITM_Loot_BeastFang`) | item | **DEFER / LOOT REVIEW** | Beast Fang | POC EVIDENCE | Exact drop/creature provenance is not established by FCC-12. |
| 273 | Weak Wisp Core (`VXL_ITM_MagicLoot_WeakWispCore`) | item | **COMPONENT / DEFER EXACT** | Weak Wisp Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 274 | Bandit Badge (`VXL_ITM_Loot_BanditBadge`) | item | **DEFER / LOOT REVIEW** | Bandit Badge | POC EVIDENCE | Exact drop/creature provenance is not established by FCC-12. |
| 275 | Ancient Coin (`VXL_ITM_Treasure_AncientCoin`) | item | **DEFER / CONTENT REVIEW** | Ancient Coin | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 276 | Blank Recipe Scroll (`VXL_ITM_Knowledge_BlankRecipeScroll`) | item | **DEFER / CONTENT REVIEW** | Blank Recipe Scroll | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 277 | Village Construction Plan (`VXL_ITM_Knowledge_VillageConstructionPlan`) | item | **DEFER / CONTENT REVIEW** | Village Construction Plan | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 278 | Culture Customs Book (`VXL_ITM_Knowledge_CultureCustomsBook`) | item | **DEFER / CONTENT REVIEW** | Culture Customs Book | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 279 | Rusted Old Key (`VXL_ITM_Key_RustedOldKey`) | item | **DEFER / CONTENT REVIEW** | Rusted Old Key | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 280 | Broken Seal Fragment (`VXL_ITM_Key_BrokenSealFragment`) | item | **DEFER / CONTENT REVIEW** | Broken Seal Fragment | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 281 | Arcane Alloy Ingot (`VXL_ITM_RefinedMaterial_ArcaneAlloyIngot`) | item | **MATERIAL/FORM REVIEW** | Arcane Alloy Ingot | POC EVIDENCE + FCC-12 | Resolve underlying canonical material, form and transformation explicitly before rebinding. |
| 282 | Mythril Ingot (`VXL_ITM_RefinedMaterial_MythrilIngot`) | item | **FORM / REBIND CANONICAL** | Mythril + ingot form | LOCKED FCC-12 | Mythril is canonical; ingot is a form. |
| 283 | Fae Seed (`VXL_ITM_DimensionItem_FaeSeed`) | item | **CATEGORY / LEGACY** | specific authored seed/plant where known | LOCKED FCC-12 | Fae Seed is category/flavour/legacy terminology, not a major exact material. |
| 284 | Infernal Ash (`VXL_ITM_DimensionItem_InfernalAsh`) | item | **REBIND CANONICAL** | Infernal Ash | LOCKED FCC-12 | Canonical Ashen material. |
| 285 | Deep Forge Ember (`VXL_ITM_DimensionItem_DeepForgeEmber`) | item | **MIGRATE CONTEXTUALLY** | Deepfire Ember only if source/context confirms equivalence | LOCKED FCC-12 BOUNDARY | Do not create a new Deep Forge Ember material without evidence. |
| 286 | Shadow Essence (`VXL_ITM_ForbiddenMagicComponent_ShadowEssence`) | item | **DEFER / UNCONFIRMED** | Shadow Essence | POC EVIDENCE | No current FCC-12 exact material/component target established. |
| 287 | Clay Golem Heart (`VXL_ITM_GolemancyComponent_ClayGolemHeart`) | item | **COMPONENT / DEFER EXACT** | Clay Golem Heart | POC EVIDENCE | Manufactured component semantics are valid, but exact POC component survival/recipe remains unbound. |
| 288 | Rune Engine Core (`VXL_MCH_MagicMachineComponent_RuneEngineCore`) | item | **COMPONENT / DEFER EXACT** | Rune Engine Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 289 | Portal Stabiliser (`VXL_MCH_MagicMachineComponent_PortalStabiliser`) | item | **COMPONENT / DEFER EXACT** | Portal Stabiliser | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 290 | Golem Command Glyph (`VXL_MCH_GolemancyComponent_GolemCommandGlyph`) | item | **COMPONENT / DEFER EXACT** | Golem Command Glyph | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 291 | Ancient Machine Core (`VXL_MCH_Relic_AncientMachineCore`) | item | **COMPONENT / DEFER EXACT** | Ancient Machine Core | POC EVIDENCE | Treat as a manufactured component, not material. Current sources do not by themselves prove the exact component survives unchanged. |
| 292 | Living Crown Seed (`VXL_ITM_Relic_LivingCrownSeed`) | item | **DEFER / PROVENANCE OBJECT REVIEW** | Living Crown Seed | POC EVIDENCE | Relic status is provenance/content, not a material tier. Exact object requires later canonical support. |
| 293 | Void Compass (`VXL_ITM_Relic_VoidCompass`) | item | **DEFER / PROVENANCE OBJECT REVIEW** | Void Compass | POC EVIDENCE | Relic status is provenance/content, not a material tier. Exact object requires later canonical support. |
| 294 | Mythril Spellblade (`VXL_ITM_Weapon_MythrilSpellblade`) | item | **DEFER / EQUIPMENT REVIEW** | Mythril Spellblade | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 295 | Master Rune Staff (`VXL_ITM_Weapon_MasterRuneStaff`) | item | **DEFER / EQUIPMENT REVIEW** | Master Rune Staff | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 296 | Arcane Engineer Coat (`VXL_ITM_Armour_ArcaneEngineerCoat`) | item | **DEFER / EQUIPMENT REVIEW** | Arcane Engineer Coat | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 297 | Linked Satchel (`VXL_ITM_Equipment_LinkedSatchel`) | item | **DEFER / EQUIPMENT REVIEW** | Linked Satchel | POC EVIDENCE | Equipment concept may fit Leyforge, but exact POC object is not proven by FCC-12 and must not be auto-promoted. |
| 298 | Dwarven Gearwork (`VXL_ITM_CultureTradeGood_DwarvenGearwork`) | item | **DEFER / CONTENT REVIEW** | Dwarven Gearwork | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 299 | Elven Living Thread (`VXL_ITM_CultureTradeGood_ElvenLivingThread`) | item | **DEFER / CONTENT REVIEW** | Elven Living Thread | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 300 | Goblin Clockwork Junk (`VXL_ITM_CultureTradeGood_GoblinClockworkJunk`) | item | **DEFER / CONTENT REVIEW** | Goblin Clockwork Junk | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 301 | Ancient Portal Rubbing (`VXL_ITM_Knowledge_AncientPortalRubbing`) | item | **DEFER / CONTENT REVIEW** | Ancient Portal Rubbing | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 302 | Boss Weakness Codex (`VXL_ITM_Knowledge_BossWeaknessCodex`) | item | **DEFER / CONTENT REVIEW** | Boss Weakness Codex | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 303 | Captured Raider Banner (`VXL_ITM_Trophy_CapturedRaiderBanner`) | item | **DEFER / CONTENT REVIEW** | Captured Raider Banner | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 304 | Drake Scale (`VXL_ITM_MonsterDrop_DrakeScale`) | item | **DEFER / LOOT REVIEW** | Drake Scale | POC EVIDENCE | Exact drop/creature provenance is not established by FCC-12. |
| 305 | Faction Seal (`VXL_ITM_QuestItem_FactionSeal`) | item | **DEFER / CONTENT REVIEW** | Faction Seal | POC EVIDENCE | No FCC-12 material decision makes this exact gameplay object canonical. Preserve as migration/content evidence for later FCC-13 binding. |
| 306 | Voidstone Shard (`VXL_ITM_DimensionMaterial_VoidstoneShard`) | item | **DEFER / MIGRATION-ONLY** | future/deferred Voidstone-derived content only if later canon restores it | LOCKED FCC-12 | No active current Voidstone material progression. |
| 307 | Celestial Metal Fragment (`VXL_ITM_DimensionMaterial_CelestialMetalFragment`) | item | **FORM / REBIND CANONICAL** | Celestial Metal + fragment form | LOCKED FCC-12 | Celestial Metal is canonical; fragment is a physical form/product. |
| 308 | Dream Glass Shard (`VXL_ITM_DimensionItem_DreamGlassShard`) | item | **MIGRATE CONTEXTUALLY** | Lucid Glass + shard form, or documented Lucid Glass state/product | LOCKED FCC-12 | Legacy Dream Glass name must resolve through Lucid Glass semantics. |
| 309 | Basic Mechanical Miner (`VXL_MCH_Automation_BasicMechanicalMiner`) | block | **SYSTEM CANDIDATE / REBIND** | Basic Mechanical Miner | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 310 | Village Warehouse Input Hatch (`VXL_BLK_Village_WarehouseInputHatch`) | block | **SYSTEM CANDIDATE / REBIND** | Village Warehouse Input Hatch | PROJECT ARCHITECTURE + POC | Concept aligns with established logistics/power/automation direction; exact ID, object model and progression status remain unbound. |
| 311 | Crude Shovel (`VXL_ITM_Tool_CrudeShovel`) | item | **DEFER / TOOL REVIEW** | Crude Shovel | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |
| 312 | Stone Shovel (`VXL_ITM_Tool_StoneShovel`) | item | **DEFER / TOOL REVIEW** | Stone Shovel | POC EVIDENCE | Tool family may be valid; exact POC tool identity/progression remains FCC-13/other content work unless separately locked. |

---

# 12. Row-Level Audit Result

All **312/312** legacy POC rows now have a Step 1B reconciliation disposition.

This does **not** mean all 312 survive.

The key result is that no old row is now allowed to flow automatically into the definitive registry.

Each row is one of:

- directly rebound to locked canon;
- represented as a form/state/source/component;
- merged under single-definition semantics;
- migrated through a locked alias/context rule;
- rejected/retired;
- or explicitly deferred because current sources do not prove survival.

---

# 13. FCC-13 Step 1B Holds Passed Down

The following questions remain intentionally downstream rather than unresolved by accident:

1. final stable IDs;
2. exact Block versus object class;
3. exact inventory projection architecture;
4. exact generated-form identity strategy;
5. exact named-station survival and capability bundles;
6. exact equipment/food/loot content survival where POC is the only source;
7. exact currency issuers and denominations;
8. exact ecological mapping of generic legacy plants/animals;
9. exact migration behaviour for unsupported old save rows;
10. exact portal components and recipes.

These are not failures of Step 1B. They are the decisions Step 1C–1E and FCC-13A–E are designed to resolve.

---

# 14. Next Step

> **FCC-13 Step 1C — Canonical Content Binding Matrix**

Step 1C should invert the direction of analysis.

Step 1B asked:

> “What does each old POC row become?”

Step 1C will ask:

> “What canonical current content must exist in the definitive registry, whether or not the old POC ever had a row for it?”

That pass is essential because the 312-row POC registry is far smaller and older than the now-locked Overworld, six realm FCCs and FCC-12 material architecture.

Step 1C must therefore extract the **new authoritative registry demand** from current canon rather than allowing the old POC list to define Leyforge's scope.

---

> **FCC-13 STEP 1B — LEGACY POC ROW COLLISION, DUPLICATE, CANONICAL-TARGET & MIGRATION MATRIX — COMPLETE v0.1**

**End of FCC-13 Step 1B v0.1**
