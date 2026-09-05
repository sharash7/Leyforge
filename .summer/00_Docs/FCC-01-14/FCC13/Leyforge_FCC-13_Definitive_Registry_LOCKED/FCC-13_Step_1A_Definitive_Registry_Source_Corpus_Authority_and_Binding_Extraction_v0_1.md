# Leyforge Final Content Canon Collection

## FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding
### Step 1A — Definitive Registry Source Corpus, Authority & Binding Extraction

**Version:** 0.1  
**Date:** 28 August 2026  
**Status:** Source-Reconciliation / Registry-Binding Preparation — No New Registry Canon Locked Here  
**Predecessor:** FCC-12 — Universal Materials, Processing & Derived Forms — CONTENT CANON LOCKED  
**Purpose:** Establish exactly what FCC-13 is allowed to bind, what source wins when records disagree, what the legacy POC registry may contribute, and what must be deferred to later FCC-13 steps.

---

# 1. FCC-13 Role

FCC-13 is the phase where Leyforge's locked theoretical material/content semantics become the definitive implementation-facing content registry.

FCC-13 does **not** decide what materials fundamentally are.

FCC-12 already settled:

- material identity;
- shared versus distinct matter;
- state/facies relationships;
- transformation thresholds;
- provenance;
- quality/grade/purity architecture;
- allowed-form doctrine;
- capability-based processing;
- cross-realm export;
- stabilisation;
- provider substitution;
- rejected generic filler material;
- legacy semantic disposition.

FCC-13 must consume those decisions and bind them into:

- stable IDs;
- definitive Block rows;
- definitive Item rows;
- inventory projections;
- form bindings;
- recipe rows;
- exact quantities;
- process/station bindings;
- provider bindings;
- portal components;
- exact portal recipes;
- aliases;
- migration redirects;
- placement/recovery semantics.

The phase therefore changes the question from:

> **What is this thing?**

to:

> **How is this already-defined thing represented, referenced, crafted, placed, recovered, migrated and persisted?**

---

# 2. FCC-13 Primary Authority Chain

When sources disagree, FCC-13 uses the following precedence.

## Authority Tier 1 — Locked Universal Canon

Highest authority:

1. **FCC-12 Final Fidelity Audit & Canon Lock**
2. **FCC-12D — Final Material Relationship Registry, Completeness Audit & FCC-13 Handoff**
3. **FCC-12A–C**
4. **Locked FCC-12 Autonomous Interview Q1–Q352**
5. **FCC-12 Step 1A–1D source reconciliation**

These sources determine semantic material truth.

FCC-13 may not silently contradict them.

---

# 3. Authority Tier 2 — Locked Realm / Overworld Content Canon

The current realm FCCs and Overworld FCC define realm-specific content that FCC-13 must bind.

Current active scope:

- FCC-01 Overworld
- FCC-02 Verdant Covenant
- FCC-03 Ancestral Veil
- FCC-04 Somnolent Expanse
- FCC-05 Ascendant Reach
- FCC-06 Impossible Deep
- FCC-08 Ashen Lower Realms

These define:

- canonical material names;
- realm-specific resources;
- portal families;
- specialist components;
- realm-specific structures/resources where registry representation is required;
- provenance relationships;
- realm access assumptions.

If a realm document predates FCC-12 and uses an old material relationship later reconciled by FCC-12, the **FCC-12 reconciliation wins**.

---

# 4. Authority Tier 3 — Universal Gameplay Governance

Other locked universal systems may constrain representation without redefining FCC-12 semantics.

Important inherited principles include:

- Block/Item single-definition rule;
- physical conservation;
- capability-based progression;
- provenance-aware rewards;
- universal death/respawn ownership;
- one normal external portal family per realm;
- no generic universal Dimension Gate;
- no hidden wrong-realm material lockout.

FCC-13 must honour these when binding rows.

---

# 5. Authority Tier 4 — Existing POC Registry

Legacy source:

> `VoxelRegistry.json`

Current inspected POC statistics:

- **312 total entries**
- **143 Block entries**
- **169 Item entries**

The registry contains useful evidence for:

- old IDs;
- old original IDs;
- categories;
- old content coverage;
- asset naming;
- save/migration aliases;
- known duplicate representation;
- old POC recipe/process dependencies.

It is **not final canon**.

POC rows may be:

- retained conceptually;
- rebound to new canonical identity;
- merged;
- split;
- redirected;
- deprecated;
- rejected;
- deferred.

No POC row survives automatically merely because it exists.

---

# 6. POC Registry Fields Observed

The existing `VoxelRegistry.json` rows currently use fields including:

- `numeric_id`
- `unique_id`
- `original_id`
- `display_name`
- `category`
- `type`
- `asset_path`
- `schematic_tags`
- `texture_index`
- `color_rgb`
- `color_hex`

These are historical implementation fields.

FCC-13 must determine which concepts remain useful.

This step does **not** freeze:

- numeric-ID strategy;
- unique-ID syntax;
- asset paths;
- colour values;
- texture indices;
- category names;
- tag syntax.

Those are implementation bindings to be decided later.

---

# 7. Existing POC Duplicate Block/Item Evidence

The POC registry currently contains at least the following duplicate display-name pairs:

1. **Oak Log**
   - Block: `VXL_BLK_Natural_OakLog`
   - Item: `VXL_ITM_RawResource_OakLog`

2. **Stone Brick**
   - Block: `VXL_BLK_Construction_StoneBrick`
   - Item: `VXL_ITM_ConstructionMaterial_StoneBrick`

3. **Cobblestone**
   - Block: `VXL_BLK_Construction_Cobblestone`
   - Item: `VXL_ITM_ConstructionMaterial_Cobblestone`

4. **Oak Beam**
   - Block: `VXL_BLK_Construction_OakBeam`
   - Item: `VXL_ITM_ConstructionMaterial_OakBeam`

5. **Cave Mushroom**
   - Block: `VXL_BLK_Natural_CaveMushroom`
   - Item: `VXL_ITM_Food_CaveMushroom`

6. **Clay Roof Tile**
   - Block: `VXL_BLK_Construction_ClayRoofTile`
   - Item: `VXL_ITM_ConstructionMaterial_ClayRoofTile`

FCC-12 already requires these to be tested against the single-definition rule.

The presence of two legacy rows is not evidence that two canonical identities should survive.

---

# 8. Single-Definition Binding Rule

FCC-13 must distinguish:

## Case A — Same physical object, different projection

Example concept:

> one Oak Log exists physically, may be placed in world, carried in inventory and recovered again.

Preferred semantic structure:

> **one canonical object/content identity**

with:

- world/block representation;
- inventory representation;
- placement capability;
- recovery behaviour.

Separate underlying material/object definitions are not justified.

## Case B — Placement creates another physical form

A separate row may be justified if:

- processing transforms the material;
- placement creates a distinct construction assembly;
- breaking returns another product;
- orientation/state changes require a distinct persistent content identity.

## Case C — Living/world entity versus harvested product

Example:

> Cave Mushroom growing in-world versus harvested edible mushroom.

These may require distinct object/lifecycle representations even if the harvested material is biologically related.

FCC-13 must determine the correct representation from physical/system meaning rather than legacy row count.

---

# 9. FCC-12 Material Identity Must Not Become One Registry Row Per Form

FCC-13 must preserve the FCC-12 formula:

> **Material Identity + Physical Form + State + Provenance + Quality + Process/Capability Context**

A material can therefore support many content/runtime representations without creating duplicate material semantics.

Example:

Iron may appear as:

- ore-bearing source;
- concentrate;
- bloom;
- billet;
- ingot;
- rod;
- wire;
- plate;
- fastener;
- placed machine component.

Those are not automatically eight unrelated Iron materials.

---

# 10. Stable Identity Layers Required

FCC-13 should distinguish at least the following identity layers conceptually.

## Layer 1 — Material ID

Represents underlying material truth.

Examples:

- Iron
- Basalt
- Dreamwater
- Contract Iron

## Layer 2 — Form / Product Archetype ID

Represents reusable form or product.

Examples:

- ingot
- wire
- beam
- pane
- lens
- plank

## Layer 3 — Canonical Content Object ID

Represents a persistent game content object where one is needed.

Examples:

- a specific machine;
- portal keystone;
- crafted tool;
- placed construction piece;
- resource object.

## Layer 4 — Runtime Instance State

Represents:

- durability;
- charge;
- provenance;
- quality;
- owner;
- contents;
- position;
- orientation;
- damage;
- custom player configuration.

These layers must not be flattened into one gigantic unrelated ID namespace semantically, even if implementation uses one technical registry.

---

# 11. Stable-ID Requirements

Final IDs must eventually satisfy:

- persistence across saves;
- persistence across display-name changes;
- explicit migration;
- deterministic lookup;
- no semantic dependence on translated display text;
- no accidental collision between Block/Item/material/form/component identities;
- compatibility with Forge authoring;
- compatibility with automation;
- compatibility with networking;
- compatibility with world saves;
- compatibility with generated standard forms.

FCC-13 must decide exact syntax later.

---

# 12. Numeric IDs

The POC uses numeric IDs.

FCC-13 must not assume numeric IDs are globally canonical identity.

Numeric IDs may remain useful for:

- runtime compactness;
- voxel storage;
- lookup tables;
- network optimisation.

But durable save/content identity should not depend solely on an order-sensitive numeric position if content evolution can reorder the registry.

The exact architecture is a technical binding question.

---

# 13. Original IDs / Alias Evidence

The POC `original_id` field is valuable migration evidence.

Examples include forms such as:

- `terrain.grass.basic`
- `terrain.dirt.basic`
- `terrain.stone.basic`
- `terrain.sand.basic`
- `fluid.water.flowing`
- `natural.log.oak`
- `construction.planks.oak`

FCC-13 should preserve obsolete identifiers as migration aliases only where they resolve safely to current canon.

An old identifier is not automatically suitable as the final canonical identifier.

---

# 14. Display Names

Display names are presentation.

They may change because of:

- naming cleanup;
- localisation;
- cultural display mode;
- material qualifier;
- provenance;
- form.

Stable IDs must not rely on display text.

---

# 15. Category Fields

POC categories such as:

- Terrain / Soil
- Terrain / Stone
- Fluid
- Natural / Wood
- Construction / Wood
- Resource / Ore
- Automation / Logistics
- Automation / Machine

are useful evidence for old content grouping.

They are not authoritative ontology.

FCC-13 may replace them with:

- multiple tags;
- functional classes;
- registry namespaces;
- authoring folders;
- UI categories.

One content object may belong to several useful classes.

---

# 16. Asset Paths

POC paths point at the old implementation structure.

Example:

> `/Game/Voxel/Blocks/...`

These came from the previous engine/content architecture.

Leyforge's rebuild is now Godot + Zylann Voxel core with a Leyforge attachment layer.

Therefore old asset paths are **migration/reference evidence only**.

FCC-13 should not freeze Unreal-era paths into the new registry.

---

# 17. Texture and Colour Fields

The old registry carries:

- texture index;
- RGBA;
- hex colour.

These values are POC visual placeholders/evidence.

They are not FCC-13 material canon.

Final art/material palette work remains governed downstream by the material/style/art handoff.

FCC-13 may bind art references, but it must not prematurely treat POC colour values as final.

---

# 18. Exact FCC-13 Ownership From FCC-12

FCC-12 explicitly delegates these decisions to FCC-13:

1. final stable IDs;
2. final Block definitions;
3. final Item definitions;
4. inventory projections;
5. material/form registry bindings;
6. exact recipes;
7. exact quantities;
8. exact station/process bindings;
9. provider-tag implementation;
10. exact portal component rows;
11. exact six portal recipes;
12. exact aliases and migrations;
13. legacy redirects;
14. final generated-form registry instances;
15. placement/recovery semantics;
16. Broken Portal / Rift content rows;
17. definitive Overworld registry binding;
18. implementation-required derived products consistent with FCC-12.

This is the FCC-13 work envelope.

---

# 19. FCC-13 Explicit Non-Authority

FCC-13 may **not** silently redefine:

- material identity;
- shared/common material relationships;
- hard non-merges;
- Deepstone retirement;
- Plant Fibre provider/category disposition;
- state/facies relationships;
- transformed-material lineages;
- provenance-versus-identity;
- form-versus-material;
- no-wrong-realm doctrine;
- capability-based processing;
- exact-material versus provider logic;
- six-portal boundary;
- rejected generic filler materials.

Any genuine contradiction discovered during binding must be raised as an explicit upstream reconciliation issue.

---

# 20. Definitive Registry Scope

FCC-13 will need to bind more than simple voxel Blocks.

The definitive content registry must account for at least:

- terrain/voxel Blocks;
- construction pieces;
- natural harvestables;
- materials;
- Items;
- food/resources;
- tools;
- weapons;
- armour where current canon requires;
- machine components;
- machines;
- automation/logistics pieces;
- fluids;
- gases where persistent representation exists;
- containers;
- portal components;
- portal structures;
- standard derived forms;
- specialist authored forms;
- aliases/migrations.

This does not require all things to use one identical runtime class.

It requires one coherent identity and binding system.

---

# 21. Registry Versus Material Database

FCC-13 should not turn the material database and object/content registry into the same semantic concept.

A useful logical separation is:

### Material Definition

Answers:

- what substance is this?
- what properties does it have?
- what forms may it support?
- what provider roles may it satisfy?

### Content/Object Definition

Answers:

- what game object is this?
- can it be placed?
- how is it rendered?
- what interaction does it expose?
- what material/form composition does it use?

### Recipe Definition

Answers:

- what inputs are consumed?
- are inputs exact or provider-based?
- what capability is required?
- what output is created?

### Instance State

Answers:

- what is true about this particular object right now?

This separation is required to avoid registry explosion.

---

# 22. Generated Standard Forms

FCC-12 locked:

> regular standard forms default to reusable generated/inherited form templates where technically safe.

FCC-13 must therefore define how a standard form becomes a stable content reference.

Possible implementation questions FCC-13 must settle include:

- generated on build versus authored row;
- deterministic ID scheme;
- material eligibility;
- art inheritance;
- placement mapping;
- inventory mapping;
- migration stability.

The semantic decision is already locked; only binding remains.

---

# 23. Specialist Authored Forms

A form should remain explicitly authored where it has:

- unique geometry;
- unique sockets;
- moving parts;
- multi-material composition;
- magical behaviour;
- machine logic;
- unusual collision;
- bespoke placement semantics.

Examples may include:

- portal keystones;
- machines;
- specialist lenses;
- rune assemblies;
- Forge-authored non-cubic pieces.

---

# 24. Recipe Binding Requirements

Every final recipe/process row should distinguish:

- exact material requirement;
- provider requirement;
- exact component;
- required form;
- required state;
- quality threshold;
- provenance requirement;
- process capability;
- environmental capability;
- specialist processing mode;
- output identity/form/state;
- quantity;
- by-products/waste where meaningful.

This prevents “recipe item list” data from destroying FCC-12 semantics.

---

# 25. Provider Binding Requirements

FCC-13 owns exact provider-tag implementation.

Potential provider semantics inherited from FCC-12 include:

- structural stone;
- structural timber;
- conductive metal;
- heat-resistant material;
- optical glass;
- transparent crystal;
- binding fibre;
- sealing material;
- pressure-vessel material;
- magical conductor;
- spirit-compatible material;
- coherence-compatible material.

Exact tag names are not yet locked.

---

# 26. Provider Tags Must Not Become Material Tiers

Provider bindings express:

> this material can perform this role.

They do not express:

> this material is globally Tier 4.

A material may be excellent for one provider role and poor for another.

FCC-13 must preserve that multidimensional model.

---

# 27. Recipe Quantities

FCC-12 deliberately did not freeze quantities.

FCC-13 must assign quantities using:

- physical plausibility;
- conservation;
- intended game scale;
- crafting ergonomics;
- automation throughput;
- world resource abundance;
- progression;
- building scale.

Quantity design must not invent matter.

---

# 28. Portal Registry Scope

FCC-13 must bind exactly six current external portal families:

1. Covenant Portal
2. Veilgate
3. Dreamgate
4. Ascension Gate
5. Deepgate
6. Ashgate

For each, FCC-13 eventually needs:

- frame/object identity;
- keystone/core/component identities;
- exact ingredients;
- provider-role ingredients where allowed;
- quantities;
- construction/activation flow;
- placement rules;
- recovery/destruction rules;
- broken/ruined states;
- migration aliases;
- reachability assumptions.

No seventh normal portal family may be introduced.

---

# 29. Portal Dependency Constraint

Exact recipes must not create a mandatory first-access circular dependency.

Example of invalid structure:

> Deepgate requires an Impossible Deep-exclusive material that can only be obtained after first entering Impossible Deep, with no alternate legitimate source.

FCC-13 must design the exact recipe graph so each first-access portal is legitimately reachable.

FCC-14 will later certify the complete graph.

---

# 30. Portal Provider Constraint

Portal recipes may combine:

- exact materials;
- provider materials;
- crafted components;
- provenance;
- state.

Provider substitution is permitted only where the portal design intentionally defines a provider requirement.

There is no rule that “any magical crystal” satisfies a realm keystone.

---

# 31. Legacy Portal POC Rows

Legacy concepts such as:

- Ancient Portal Frame;
- Broken Portal Block;
- Unstable Rift Block;

must not become a generic seventh portal system.

FCC-12 already routes them as:

- archaeology/structure migration;
- damaged/ruined canonical portal state/piece;
- anomaly/interface content.

FCC-13 must bind them accordingly.

---

# 32. Definitive Migration Classes

Every legacy row should ultimately receive one FCC-13 migration disposition.

Recommended classes:

1. **KEEP / REBIND**
2. **MERGE**
3. **SPLIT**
4. **ALIAS**
5. **STATE**
6. **FORM**
7. **COMPONENT**
8. **PROVENANCE**
9. **REJECT**
10. **DEFER**
11. **MIGRATE CONTEXTUALLY**

The full row-level matrix belongs to later FCC-13 reconciliation steps.

---

# 33. Known Mandatory Legacy Dispositions

FCC-13 inherits these closed semantic dispositions:

- Deepstone → retire exact material;
- Deep Forge Stone → retire;
- Plant Fibre → provider/category;
- Dream Glass → Lucid Glass/contextual state;
- Celestial Stone → contextual canonical mapping;
- Fae Grass → flora/terrain legacy;
- Voidstone → deferred/future/migration-only;
- Strange Realm Ore → reject;
- Crystal Stone → contextual mapping/retire;
- Mana Crystal Ore → Raw Mana Crystal source relationship;
- generic Corrupted Shard → reject;
- Relic Material → provenance/status;
- Deep Metal → terminology;
- Heat Glass → descriptor;
- Dream Thread → Memory Thread;
- Seasonal Crystal → Bloomstone state;
- Blackwater Pearl → Pressure Pearl provenance/state;
- Oath Metal → Contract Iron terminology;
- Barrier Ore → reject;
- Boss Essence → reject generic;
- Portalium → reject;
- Dimension Ore → reject.

FCC-13 may bind aliases; it may not reverse these decisions.

---

# 34. Existing POC Content Must Be Audited Row-by-Row

The 312 POC rows should eventually be classified against:

- locked canon;
- single-definition rule;
- current engine architecture;
- migration need;
- actual gameplay ownership.

A row may represent:

- a valid concept under obsolete ID;
- obsolete implementation of a valid concept;
- duplicate projection;
- placeholder;
- rejected content;
- useful test-only content;
- content now owned elsewhere.

The old registry is therefore a migration corpus, not the new master list.

---

# 35. Test-Only Content

POC/testing content may be retained outside canonical gameplay registries if it is useful for:

- automated tests;
- voxel stress tests;
- crafting tests;
- logistics tests;
- save migration tests;
- debugging.

Test fixtures must be explicitly marked so they cannot accidentally become world canon.

---

# 36. Engine Rebuild Implication

The previous POC registry contains Unreal-style asset paths.

The current rebuild direction is:

> **Godot + Zylann Voxel plugin core + Leyforge attachment/plugin systems**

FCC-13 should therefore define semantic registry data independently enough that:

- voxel terrain can bind to Zylann;
- inventory can bind to object/material data;
- Forge authoring can generate content;
- machine systems can query provider/capability data;
- save migration remains possible.

Old engine-specific path structure must not become the ontology.

---

# 37. Forge Integration Requirement

The Forge must eventually be capable of creating or binding:

- material definitions;
- standard material/form projections;
- non-cubic Blocks;
- construction pieces;
- Items;
- machines;
- sockets;
- ports;
- pivots;
- moving parts;
- state visuals;
- recipes;
- provider constraints;
- snapshot icons.

FCC-13 must produce registry semantics the Forge can author safely.

---

# 38. Art Integration Requirement

FCC-13 must preserve enough material identity for derived forms to inherit correct appearance.

Examples:

- timber-derived construction should retain source wood;
- metal gears should reflect actual metal;
- stone furnaces should visually derive from actual stone where appropriate;
- Copper and Iron provider substitutes must remain visually distinguishable.

Final colours/textures are not locked here.

---

# 39. Save Compatibility Requirement

Final registry binding must support:

- stable references;
- explicit old-ID redirects;
- missing-content handling;
- deprecated-content migration;
- safe loaded-world reconstruction;
- generated-form stability.

Silent reinterpretation of an old ID as unrelated new content is prohibited.

---

# 40. Missing-Content Policy

If a saved legacy row has no valid current canonical equivalent, FCC-13 must choose an explicit migration outcome such as:

- convert to validated replacement;
- convert to salvage/material refund;
- preserve deprecated compatibility object;
- remove with explicit migration accounting;
- quarantine as unsupported legacy object.

Do not silently map unrelated objects merely to avoid an error.

Exact policy is a later FCC-13 decision.

---

# 41. FCC-13 Expected Document Architecture

Recommended final FCC-13 set:

## FCC-13A — Stable Identity, Registry Architecture & Namespace Rules

Will lock:

- semantic identity layers;
- stable ID policy;
- namespace policy;
- generated-form ID behaviour;
- aliases/migrations;
- save compatibility principles.

## FCC-13B — Definitive Block, Item, Form & Inventory Projection Registry

Will lock:

- Block/Object versus Item projection;
- single-definition resolutions;
- standard form bindings;
- placement/recovery;
- inventory projections;
- main content registry.

## FCC-13C — Definitive Recipe, Process, Provider & Quantity Registry

Will lock:

- recipe rows;
- quantities;
- exact vs provider inputs;
- process/station bindings;
- conservation/by-products;
- major universal derived products.

## FCC-13D — Realm Portal Components, Recipes & Access Binding

Will lock:

- exact six portal recipes;
- exact components;
- quantities;
- frame/keystone semantics;
- placement/recovery;
- first-access viability.

## FCC-13E — Legacy Migration Matrix, Completeness Audit & FCC-14 Handoff

Will lock:

- all POC row migration dispositions;
- redirects;
- rejected/deferred rows;
- registry completeness;
- FCC-14 handoff.

This split keeps registry architecture, ordinary content, recipes and Realm Access independently auditable.

---

# 42. FCC-13 Pre-Interview / Reconciliation Steps

Before final FCC-13A–E writing:

### Step 1A — Source authority and binding extraction
**This document.**

### Step 1B — Legacy POC row collision / duplicate / canonical-target matrix

Audit all existing POC rows against current canon.

### Step 1C — Canonical content binding matrix

Extract current canonical Blocks/Items/forms/components implied by FCC-01/realm FCCs/FCC-12.

### Step 1D — Recipe / provider / portal dependency matrix

Build exact design space and identify unresolved binding decisions.

### Step 1E — FCC-13 interview/decision architecture

Generate complete question map only after the source matrices are complete.

This mirrors the successful source-first FCC-12 process.

---

# 43. Step 1A Completeness Gate

- [x] FCC-13 role defined.
- [x] source authority chain defined.
- [x] FCC-12 ownership boundary inherited.
- [x] POC registry identified as migration evidence.
- [x] current POC registry size recorded.
- [x] current Block/Item counts recorded.
- [x] known duplicate Block/Item pairs extracted.
- [x] single-definition binding rule preserved.
- [x] material/form/content/instance layers separated.
- [x] stable-ID requirements identified.
- [x] legacy ID role identified.
- [x] old engine paths demoted to migration evidence.
- [x] POC colour/texture values prevented from premature canon lock.
- [x] generated-form requirement inherited.
- [x] capability/provider recipe semantics inherited.
- [x] exact six-portal boundary inherited.
- [x] portal first-access non-circularity requirement inherited.
- [x] legacy migration classes established.
- [x] test-only content separation identified.
- [x] Forge integration requirement identified.
- [x] save compatibility requirement identified.
- [x] recommended FCC-13A–E architecture defined.
- [x] remaining reconciliation steps defined.

---

# 44. Step 1A Result

> **FCC-13 STEP 1A — DEFINITIVE REGISTRY SOURCE CORPUS, AUTHORITY & BINDING EXTRACTION — COMPLETE v0.1**

No definitive stable ID, Block, Item, recipe, quantity or portal recipe is locked by Step 1A.

The next operation is:

> **FCC-13 Step 1B — Legacy POC Row Collision, Duplicate, Canonical-Target & Migration Matrix**

That step should systematically reconcile the existing **312-row POC VoxelRegistry** against locked current canon before any final master registry is authored.

This prevents obsolete POC structure from silently becoming the new Leyforge registry.

---

**End of FCC-13 Step 1A v0.1**
