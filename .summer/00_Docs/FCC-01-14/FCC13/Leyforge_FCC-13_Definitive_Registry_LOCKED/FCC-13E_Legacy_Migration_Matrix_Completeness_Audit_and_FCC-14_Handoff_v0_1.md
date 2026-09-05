# Leyforge Final Content Canon Collection

## FCC-13E — Legacy Migration Matrix, Completeness Audit & FCC-14 Handoff

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** **CANON WRITING COMPLETE v0.1 — based on locked FCC-13 interview Q1–Q268**  
**Parent:** FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding  
**Primary Interview Coverage:** M01 Q239–Q268, with final completeness checks against FCC-13A–D, Step 1B's 312-row legacy corpus and Step 1C's 407-entry current-canon binding-demand corpus  
**Consumes:** FCC-13A–D; locked FCC-13 autonomous binding interview Q1–Q268; FCC-13 Steps 1A–1E; FCC-12 locked legacy dispositions  
**Downstream:** FCC-13 final document-to-interview fidelity audit; FCC-14 cross-realm reconciliation/certification

---

# 1. Purpose

FCC-13E closes the definitive registry-binding workstream before final fidelity audit.

Its job is to prove that:

- every one of the **312 legacy POC registry rows** has a final migration disposition;
- no POC-only row is silently promoted into current canon merely because it existed;
- all **407 current-canon binding demands** extracted in Step 1C have a valid target representation through FCC-13A–D;
- stable IDs and learned recipes migrate safely;
- rejected FCC-12 placeholder materials remain rejected;
- legacy portal rows cannot create a seventh Realm Access family;
- compatibility/test content is isolated from normal gameplay;
- FCC-14 receives a precise handoff without FCC-13 consuming its final certification authority.

The central migration rule is:

> **Completeness means every legacy row has an explicit outcome — not that every legacy row survives as canonical content.**

---

# 2. Final Migration Outcome Classes

FCC-13E closes all old POC rows into one of the following outcomes.

## Canonical Rebind / Generated Form / State
The old row maps to current canon through a material, generated form, source relation, state, projection, component or modern archetype.

## Canonical Contextual Migration
The old term is obsolete but a context-sensitive current target is already locked.

## Retired / Alias
The old identity does not survive independently; its ID remains migration/history metadata.

## Migration-Only / Future-Deferred
The content is not active current progression but old-save/future compatibility metadata may remain.

## POC-Only / Not Promoted
The exact POC object has no sufficient locked current owner support. It is excluded from normal canonical worldgen/crafting. Useful fixtures may live under `leyforge_test`; old-save instances may live under `leyforge_compat`.

## Category / Ownership Migration
The physical concept may survive later, but its old classification is invalid and must be corrected before any owner canonises it.

## Reject / Remove from Normal Canon
The legacy concept is explicitly rejected by current canon.

No row remains in an unresolved `TBD` state.

---

# 3. 312-Row Closure Result

**Legacy rows audited:** 312/312  
**Unresolved legacy rows:** 0  

Final outcome counts:

- **POC-ONLY / NOT PROMOTED: 168 rows**
- **CANONICAL REBIND / GENERATED FORM / STATE: 107 rows**
- **CANONICAL SYSTEM ARCHETYPE REBIND: 13 rows**
- **CANONICAL CONTEXTUAL MIGRATION: 7 rows**
- **CANONICAL TOOL ARCHETYPE REBIND: 4 rows**
- **CANONICAL NON-MATERIAL REBIND: 3 rows**
- **LEGACY ECONOMY OBJECT — NOT UNIVERSAL CURRENCY: 3 rows**
- **CATEGORY MIGRATION + OWNER REVIEW: 2 rows**
- **MIGRATION-ONLY / FUTURE-DEFERRED: 2 rows**
- **RETIRED / ALIAS OR CONTEXTUAL MIGRATION: 2 rows**
- **REJECT / REMOVE FROM NORMAL CANON: 1 rows**


This outcome distribution intentionally contains a substantial **POC-only / not promoted** population. That is correct: FCC-13 migration governance forbids prototype existence from becoming canon authority.

---

# 4. Stable Alias and Redirect Policy

Canonical targets support zero-to-many migration aliases.

Redirect resolution order is:

1. current canonical ID;
2. deprecated canonical redirect;
3. migration alias;
4. compatibility mapping;
5. authorised contextual migration;
6. compatibility/quarantine if unresolved.

Old IDs are never reused for unrelated content.

Many-to-one redirects are explicitly supported so duplicate old Block/Item rows can converge on one modern physical identity.

---

# 5. Unsupported Legacy Object Policy

If an old save contains an object with no active current canonical target, use this order:

1. direct canonical migration where exact;
2. contextual migration where evidence permits;
3. physically defensible salvage when composition/quantity is reconstructible;
4. `leyforge_compat` inert compatibility object when deletion would lose player-owned/world value;
5. explicit removal with migration report only as a last resort.

The loader must never guess an unrelated replacement merely to avoid an error.

---

# 6. Compatibility Objects

Compatibility objects:

- are noncraftable by default;
- do not appear in normal worldgen;
- do not enter ordinary progression/trade;
- retain original ID/version metadata;
- exist only to preserve old-save integrity until explicit migration is possible.

Compatibility status is not current gameplay canon.

---

# 7. Test Fixtures

Useful POC-only content may be retained under:

> `leyforge_test`

Test fixtures may support:

- voxel stress tests;
- automation tests;
- crafting tests;
- migration tests;
- regression tests.

Canonical content must not depend on test-only fixtures.

---

# 8. Learned Recipe Migration

Learned old recipe IDs migrate through stable recipe aliases where a semantic replacement exists.

If an old recipe has no valid current replacement:

- its knowledge history may remain in migration metadata;
- it is removed from active craftability;
- the migration report records the removal;
- no unrelated recipe is granted as compensation.

Normal balance changes do not require a new recipe identity.

---

# 9. Duplicate Block / Item Recipe Migration

Old recipes referencing duplicate Block and Item IDs converge on the same modern physical target where the single-definition rule applies.

This covers the locked legacy clusters:

- Oak Log;
- Stone Brick;
- Cobblestone;
- Oak Beam;
- Clay Roof Tile;
- Oak Plank(s);
- Clay Brick.

Their old Block/Item identity split does not survive.

---

# 10. Contextual Generic-Material Recipe Migration

Old recipes using broad generic material rows are migrated only where the actual physical target can be recovered.

Examples:

## Stone
Resolve to actual source stone when known.

## Plant Fibre
Resolve to exact botanical fibre, Mixed Plant Fibre, or provider semantics according to evidence.

## Deepstone
Resolve contextually to actual Impossible Deep geology where evidence exists; otherwise compatibility handling.

Unknown composition is not guessed.

---

# 11. Legacy Numeric IDs

Numeric-only save references are recoverable only with an exact known legacy registry/version map.

If the legacy version cannot be determined safely:

> quarantine rather than reinterpret the number under the current registry.

Modern durable persistence uses stable semantic IDs.

---

# 12. Old Asset / Texture / Colour Data

Legacy Unreal asset paths, texture indices and colour/hex values are migration/reference evidence only.

They are not canonical registry identity and do not constrain the Godot/Zylann rebuild.

---

# 13. Named Station Migration

POC station rows survive only where current systems retain the object/archetype.

A retained station is bound as a **capability/environment provider** under FCC-13C.

It does not become the exclusive ontology owner of a process merely because the prototype recipe used it.

Unsupported exact POC stations remain test/compatibility/deprecated content unless an owning system later canonises them.

---

# 14. POC Equipment, Food, Loot and Relic Threshold

Exact POC gameplay objects in these categories survive only when:

- current locked canon requires them; or
- their owning content system explicitly accepts them later through normal governance.

POC existence alone is insufficient.

This closes the review state without inventing hundreds of unsupported weapons, potions, foods or relics.

---

# 15. Goblin Category Migration

Legacy Goblin-associated rows categorised as `Monster Drop` lose that classification.

Goblin is a sapient ancestry.

If an owning system later retains such an object, valid categories may include:

- cultural/faction equipment;
- salvage;
- trade goods;
- circumstance-specific loot;
- provenance-bearing crafted object.

The old dehumanising category does not survive migration.

---

# 16. Legacy Currency

Old Copper/Silver trade coin and token rows do not become universal legal tender.

A coin/token survives as active economic content only with a defined issuer/context.

Otherwise it remains compatibility/deprecated content.

Underlying Copper/Silver material identity remains ordinary material identity.

---

# 17. Legacy Portal Rows

## Ancient Portal Frame
Maps to canonical portal-family archaeology/structure/component where family can be established; otherwise compatibility archaeology content.

## Broken Portal Block
Maps to damaged/ruined state or detached physical piece of a canonical portal family.

## Unstable Rift Block
Maps to anomaly/interface/event content.

None creates a seventh normal Realm Access family.

---

# 18. FCC-12 Legacy Dispositions Reconfirmed

FCC-13E preserves the FCC-12 lock exactly:

- Deepstone → retired exact material; contextual migration/category only;
- Deep Forge Stone → retired;
- Infernal Brick → Ash Brick lineage;
- Dream Glass → Lucid Glass/contextual state/product;
- Celestial Stone → contextual Cloudstone/Hymnstone/Ascendant state mapping;
- Fae Grass → actual Verdant flora/terrain where known;
- Voidstone → future/deferred/migration-only;
- Strange Realm Ore → rejected;
- Crystal Stone → contextual migration or retire;
- Mana Crystal Ore → Raw Mana Crystal source/deposit relationship;
- generic Corrupted Shard → rejected;
- Relic Material → provenance/status only;
- Deep Metal → terminology/alias;
- Heat Glass → descriptor;
- Sacred Fibre → category/cultural term;
- Dream Thread → Memory Thread;
- Seasonal Crystal → Bloomstone state;
- Blackwater Pearl → Pressure Pearl provenance/state;
- Oath Metal → Contract Iron terminology;
- Barrier Ore → rejected;
- Boss Essence → rejected generic currency/material;
- Portalium → rejected;
- Dimension Ore → rejected;
- Ashen Deep Ember → retired;
- Deep Ember → Deepfire Ember shorthand only when unambiguous.

No FCC-13 migration rule reverses these dispositions.

---

# 19. Current-Canon Binding-Demand Audit

FCC-13 Step 1C extracted **407 minimum current-canon binding demands**.

FCC-13A–D now provide target representation for all 407 through the following semantic classes:

- **MATERIAL / RESOURCE: 150 demands**
- **FORM / PRODUCT / COMPONENT: 92 demands**
- **FORM / PLACEABLE / FUNCTIONAL: 23 demands**
- **BIOLOGICAL / CROP: 18 demands**
- **MATERIAL / RESOURCE / PRODUCT: 18 demands**
- **STANDARD FORM FAMILY: 16 demands**
- **AUTOMATION / LOGISTICS ARCHETYPE: 13 demands**
- **FORM / COMPONENT / PRODUCT: 13 demands**
- **TRUE ITEM / COMPONENT: 10 demands**
- **REGISTRY SCHEMA: 8 demands**
- **PORTAL MATERIAL ROLE: 7 demands**
- **PORTAL FAMILY: 6 demands**
- **TOOL FAMILY: 6 demands**
- **PORTAL KEYSTONE COMPONENT: 4 demands**
- **PORTAL PROVIDER ROLE: 4 demands**
- **PORTAL ATTUNEMENT ROLE: 3 demands**
- **PORTAL INTERFACE: 3 demands**
- **PORTAL PROVIDER SUBCOMPONENT: 2 demands**
- **PORTAL STABILISATION ROLE: 2 demands**
- **PORTAL SUBCOMPONENT: 2 demands**
- **PORTAL ACTIVATION ROLE: 1 demands**
- **PORTAL BLOCK FAMILY: 1 demands**
- **PORTAL BLOCK/COMPONENT: 1 demands**
- **PORTAL COMPONENT ROLE: 1 demands**
- **PORTAL CORE ROLE: 1 demands**
- **PORTAL MATERIAL/FORM ROLE: 1 demands**
- **PORTAL/UPGRADE COMPONENT: 1 demands**


The audit result is:

> **407/407 current-canon binding demands have a valid representation path.**

A valid representation path does not mean 407 authored Item rows. Depending on the demand, the target may be:

- exact material;
- deterministic generated material/form;
- authored object/component;
- biological/lifecycle identity;
- state/facies;
- provider role;
- blueprint/structure;
- portal role/interface;
- owning non-Block registry.

This is the intended modern architecture.

---

# 20. FCC-13A Completeness Check

FCC-13A provides:

- stable semantic ID syntax;
- namespace/domain separation;
- runtime numeric-handle policy;
- alias/redirect rules;
- no ID reuse;
- generated-form identity;
- mod/Forge/test/compat namespaces;
- save/migration identity doctrine.

**Status: PASS**

---

# 21. FCC-13B Completeness Check

FCC-13B provides:

- Block/Object/Item projection architecture;
- single-definition legacy merges;
- lifecycle splits;
- fluid/gas/container projections;
- multiblock/structure representation;
- standard generated forms;
- material form profiles;
- portal object-family identities;
- current realm material/form/object targets.

**Status: PASS**

---

# 22. FCC-13C Completeness Check

FCC-13C provides:

- stable recipe identity;
- exact/provider/form/state/provenance inputs;
- capability-driven processing;
- station-provider semantics;
- conservation and fixed-point accounting;
- global ordinary conversion profiles;
- repair/salvage/recycling;
- staged project semantics;
- automation validation.

**Status: PASS**

---

# 23. FCC-13D Completeness Check

FCC-13D provides:

- exactly six portal families;
- acyclic hybrid dependency graph;
- deterministic first-access routes;
- portal cores/keystones;
- accepted assembly quantities;
- accepted exact major component recipes;
- repair/recovery;
- upgrade architecture;
- destination calibration;
- no seventh portal/filler portal material.

**Status: PASS**

---

# 24. Portal Reachability Audit

## Covenant Portal
Overworld-only first-access material/provider route — **PASS**

## Veilgate
Guaranteed historical Veilgate Remnant route — **PASS**

## Dreamgate
Guaranteed Dream-Leak Coherence Core/Lucid Glass route — **PASS**

## Ascension Gate
Requires one already-accessible early-realm stabilisation component — **PASS**

## Deepgate
Requires two distinct already-accessible realm stabilisation components — **PASS**

## Ashgate
Requires Impossible Deep-origin Deepfire Ember Containment Core after Deep access — **PASS**

**Circular portal dependencies: 0**

---

# 25. Six-Portal Boundary Audit

- [x] Covenant Portal
- [x] Veilgate
- [x] Dreamgate
- [x] Ascension Gate
- [x] Deepgate
- [x] Ashgate
- [x] no generic seventh portal
- [x] no universal Realm Keystone
- [x] no Portalium
- [x] no Dimension Ore
- [x] no generic Realm Essence

**Status: PASS**

---

# 26. Normal-Registry Leakage Audit

The following are explicitly prevented from leaking into normal canon without owner approval:

- POC-only weapons/armour;
- POC-only food/potions;
- unsupported stations;
- unsupported relics;
- unsupported monster drops;
- generic old dimension materials;
- test fixtures;
- compatibility objects.

**Status: PASS**

---

# 27. Save/Migration Safety Audit

- [x] canonical IDs authoritative
- [x] numeric-only migration version-aware
- [x] aliases may converge many-to-one
- [x] removed IDs never reused
- [x] unsupported content quarantined rather than guessed
- [x] migration log required
- [x] pre-migration backup required
- [x] compatibility namespace isolated
- [x] test namespace isolated

**Status: PASS**

---

# 28. Required Migration Reporting

A migration run should generate:

1. pre-migration backup;
2. machine-readable migration log;
3. player/developer-readable summary;
4. count of direct redirects;
5. count of contextual migrations;
6. count of compatibility objects;
7. count of test-only removals/segregations;
8. count of rejected/removed objects;
9. unresolved count.

For FCC-13 lock, the design-time unresolved count is:

> **0**

Runtime old saves may still produce compatibility objects when their specific context is insufficient; that is a defined migration outcome, not an unresolved design hold.

---

# 29. FCC-14 Handoff Package

FCC-14 receives the following authoritative FCC-13 outputs:

1. **FCC-13A — Stable Identity, Registry Architecture & Namespace Rules**
2. **FCC-13B — Definitive Block, Object, Item, Form & Inventory Projection Registry**
3. **FCC-13C — Definitive Recipe, Process, Provider & Quantity Registry**
4. **FCC-13D — Realm Portal Components, Recipes & Access Binding**
5. **FCC-13E — this migration/completeness/handoff document**
6. complete FCC-13 autonomous interview Q1–Q268
7. Step-1B final 312-row migration matrix
8. Step-1C 407-entry binding-demand matrix
9. six-portal dependency graph
10. final alias/redirect policy
11. compatibility/test-content segregation rules
12. final FCC-13 fidelity audit once complete

---

# 30. FCC-14 Must Certify

FCC-14 retains authority to certify:

- cross-realm consistency;
- portal graph reachability/non-circularity at project level;
- one normal portal family per active realm;
- no duplicate registry ownership across FCC sets;
- no legacy term collisions;
- no forbidden material duplication;
- no premature art/palette lock;
- final cross-realm interface consistency;
- handoff into implementation/production.

FCC-13E does not pre-empt these final project-wide checks.

---

# 31. FCC-14 Must Not Reopen Without Contradiction

FCC-14 should treat FCC-13 as authoritative for:

- stable ID architecture;
- Block/Object/Item projection;
- generated forms;
- exact/provider recipe semantics;
- global conversion profiles;
- portal component identities;
- six first-access portal contracts;
- legacy migration rules.

A genuine contradiction must be raised explicitly rather than silently rewriting FCC-13.

---

# 32. FCC-13E Completeness Gate

- [x] all 312 POC rows have final migration status
- [x] no POC review/defer remains an unresolved design hold
- [x] POC-only content is explicitly non-promoted
- [x] compatibility objects defined
- [x] test fixtures segregated
- [x] learned recipe migration defined
- [x] numeric-only migration defined
- [x] duplicate Block/Item redirects defined
- [x] generic material migration defined
- [x] station migration defined
- [x] Goblin category migration resolved
- [x] legacy currency boundary resolved
- [x] legacy portal rows resolved
- [x] FCC-12 legacy dispositions preserved
- [x] 407/407 current-canon binding demands have target representation
- [x] FCC-13A completeness pass
- [x] FCC-13B completeness pass
- [x] FCC-13C completeness pass
- [x] FCC-13D completeness pass
- [x] six-portal reachability pass
- [x] six-portal boundary pass
- [x] save/migration safety pass
- [x] FCC-14 handoff package defined
- [x] FCC-14 authority preserved
- [x] zero unresolved FCC-13E holds

---

# 33. Final 312-Row Migration Matrix

The table below is the final FCC-13E disposition for every legacy POC row.

`Old Step-1B disposition` records the forensic classification used before the interview.

`Final FCC-13E outcome` is the closure result after accepted Q1–Q268.

| # | Legacy Display Name | Type | Old Step-1B Disposition | Final FCC-13E Outcome | Final Target / Action |
|---:|---|---|---|---|---|

| 1 | Grass Block | block | CONTEXTUAL TERRAIN REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | actual soil + vegetated surface/terrain state. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 2 | Dirt Block | block | CONTEXTUAL TERRAIN REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | actual canonical soil/profile + terrain form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 3 | Stone Block | block | GENERIC CLASS / CONTEXTUAL | **CANONICAL REBIND / GENERATED FORM / STATE** | actual stone material + block/natural form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 4 | Sand Block | block | CLASS / WORLD PROJECTION | **CANONICAL REBIND / GENERATED FORM / STATE** | composition-bearing Sand class + placed/world form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 5 | Gravel Block | block | CLASS / WORLD PROJECTION | **CANONICAL REBIND / GENERATED FORM / STATE** | composition-bearing Gravel class + placed/world form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 6 | Clay Block | block | CLASS / WORLD PROJECTION | **CANONICAL REBIND / GENERATED FORM / STATE** | specific clay material/profile + placed form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 7 | Water Block | block | WORLD PROJECTION | **CANONICAL REBIND / GENERATED FORM / STATE** | ordinary Water + world-fluid representation. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 8 | Mud Block | block | CONTEXTUAL TERRAIN REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | actual soil/sediment + wet/mud condition or mixture. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 9 | Oak Log | block | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber/log object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 10 | Oak Leaves | block | LIVING/NATURAL OBJECT — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 11 | Oak Planks | block | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber + plank form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 12 | Branch / Stick Block | block | NATURAL OBJECT / FORM | **CANONICAL REBIND / GENERATED FORM / STATE** | wood/plant source + branch/stick form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 13 | Tall Grass | block | LIVING/NATURAL OBJECT — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 14 | Bush Block | block | LIVING/NATURAL OBJECT — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 15 | Basic Crop Block | block | LIVING/NATURAL OBJECT — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 16 | Wildflower Block | block | LIVING/NATURAL OBJECT — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 17 | Coal Ore | block | SOURCE / WORLD DEPOSIT | **CANONICAL REBIND / GENERATED FORM / STATE** | Coal-bearing source/deposit. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 18 | Copper Ore | block | SOURCE / WORLD DEPOSIT | **CANONICAL REBIND / GENERATED FORM / STATE** | Copper-bearing ore/deposit. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 19 | Iron Ore | block | SOURCE / WORLD DEPOSIT | **CANONICAL REBIND / GENERATED FORM / STATE** | Iron-bearing ore/deposit. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 20 | Mana Crystal Ore | block | SOURCE RELATIONSHIP | **CANONICAL REBIND / GENERATED FORM / STATE** | Raw Mana Crystal source/deposit/block relationship. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 21 | Clay Deposit | block | SOURCE / WORLD DEPOSIT | **CANONICAL REBIND / GENERATED FORM / STATE** | specific clay deposit/feedstock. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 22 | Surface Stone Boulder | block | SOURCE / FORM | **CANONICAL REBIND / GENERATED FORM / STATE** | actual stone material + boulder form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 23 | Workbench | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 24 | Stone Furnace | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 25 | Mana Furnace | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 26 | Wooden Chest | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 27 | Village Warehouse | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 28 | Basic Mana Miner | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 29 | Basic Item Chute | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Item Chute archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 30 | Rune Table | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 31 | Stone Brick | block | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | stone-material masonry brick object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 32 | Cobblestone | block | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | stone-material cobble object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 33 | Oak Beam | block | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber beam object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 34 | Oak Stair | block | FORM REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber + standard construction form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 35 | Oak Slab | block | FORM REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber + standard construction form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 36 | Thatch Roof Block | block | FORM/PRODUCT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | valid fibre/plant provider + authored form/product. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 37 | Oak Door | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 38 | Oak Fence | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 39 | Glass Window | block | DEFER / UNCONFIRMED | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 40 | Watchtower Core | block | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 41 | Wooden Palisade | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 42 | Wooden Gate | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 43 | Torch | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 44 | Basic Spike Trap | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 45 | Guard Post Marker | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 46 | Ward Lantern | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 47 | Basic Mana Conduit | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 48 | Deepstone | block | RETIRE / ALIAS | **RETIRED / ALIAS OR CONTEXTUAL MIGRATION** | legacy geological/category term only. No active independent identity survives. |
| 49 | Limestone | block | REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Limestone. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 50 | Basalt | block | REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Basalt. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 51 | Granite | block | REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Granite. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 52 | Mossy Cave Stone | block | STATE/OVERLAY CONTEXTUAL | **CANONICAL REBIND / GENERATED FORM / STATE** | actual cave stone + moss/biological surface state. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 53 | Crystal Stone | block | MIGRATE CONTEXTUALLY / RETIRE | **CANONICAL CONTEXTUAL MIGRATION** | actual canonical material if source evidence identifies one. Resolve by locked context; do not preserve the obsolete identity as active canon. |
| 54 | Snow Block | block | PHASE/FORM REVIEW | **CANONICAL REBIND / GENERATED FORM / STATE** | Water-derived frozen/snow world representation. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 55 | Ice Block | block | PHASE/FORM REVIEW | **CANONICAL REBIND / GENERATED FORM / STATE** | Water-derived frozen/snow world representation. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 56 | Fertile Soil | block | STATE / QUALITY | **CANONICAL REBIND / GENERATED FORM / STATE** | actual soil + fertility state/profile. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 57 | Tilled Farmland | block | STATE / WORLD PROJECTION | **CANONICAL REBIND / GENERATED FORM / STATE** | actual soil + tilled/cultivated state. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 58 | Reed Block | block | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | living/world reed object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 59 | Cave Mushroom | block | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | living Cave Mushroom world object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 60 | Clay Brick Block | block | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | fired ceramic/clay + brick form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 61 | Clay Roof Tile | block | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | ceramic/clay roof-tile object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 62 | Stone Pillar | block | PROVIDER/FORM REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | actual stone/provider + authored construction form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 63 | Stone Wall | block | PROVIDER/FORM REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | actual stone/provider + authored construction form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 64 | Stone Arch | block | PROVIDER/FORM REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | actual stone/provider + authored construction form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 65 | Wooden Shutter | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 66 | Wooden Ladder | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 67 | Wooden Trapdoor | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 68 | Simple Bed | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 69 | Wooden Table | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 70 | Wooden Chair | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 71 | Bookshelf | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 72 | Dirt Path | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 73 | Sawmill | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 74 | Forge and Anvil | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 75 | Loom | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 76 | Alchemy Table | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 77 | Enchanting Station | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 78 | Machine Assembler | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 79 | Research Desk | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 80 | Wooden Crate | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 81 | Wooden Barrel | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 82 | Grain Silo | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 83 | Linked Warehouse | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 84 | Cart Depot | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 85 | Conveyor Belt | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Conveyor Belt archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 86 | Item Pipe | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Item Pipe archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 87 | Splitter | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Splitter archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 88 | Sorter / Filter | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Sorter/Filter archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 89 | Merger | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Merger archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 90 | Crusher | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 91 | Grinder | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 92 | Pump | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Pump archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 93 | Fluid Pipe | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Fluid Pipe archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 94 | Water Wheel | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Water Wheel archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 95 | Windmill | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Windmill archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 96 | Manual Crank | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Manual Crank archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 97 | Fuel Engine | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Fuel Engine archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 98 | Mana Battery | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 99 | Rune Engine | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 100 | Arcane Furnace | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 101 | Rune Miner | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 102 | Golem Workstation | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 103 | Farm Processor | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 104 | Plank Maker | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 105 | Arcane Assembler | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 106 | Mana Crystal Block | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 107 | Ritual Anchor | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 108 | Ancient Portal Frame | block | STRUCTURE / MIGRATION | **CANONICAL NON-MATERIAL REBIND** | archaeological or canonical portal-structure content. Bind to structure/state/anomaly owner, not a generic material or seventh portal. |
| 109 | Corrupted Ground | block | STATE / OVERLAY | **CANONICAL REBIND / GENERATED FORM / STATE** | actual ground material + corruption state/overlay. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 110 | Rune Trap | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 111 | Spell Turret | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 112 | Enchantment Pillar | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 113 | Ward Obelisk | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 114 | Blueprint Marker | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 115 | Scaffold Block | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 116 | Construction Supply Crate | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 117 | Job-Site Marker | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 118 | Repair Marker | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 119 | Market Stall | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 120 | Village Alarm Bell | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 121 | Village Shrine | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 122 | Stone Defensive Wall | block | PROVIDER/FORM REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | actual stone/provider + authored construction form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 123 | Iron Gate | block | SYSTEM/OBJECT CANDIDATE — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 124 | Wooden Barricade | block | OBJECT/PROVIDER REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | timber material/provider + construction archetype. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 125 | Lava / Magma | block | CLASS / WORLD REPRESENTATION | **CANONICAL REBIND / GENERATED FORM / STATE** | composition-aware molten-rock family/form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 126 | Poison Sludge | block | FLUID MIXTURE — UNCONFIRMED | **POC-ONLY / NOT PROMOTED** | No locked exact current target. Exclude from normal canon/worldgen; preserve as leyforge_test if useful or leyforge_compat when old saves require it. |
| 127 | Thorn Vine | block | LIVING/NATURAL OBJECT — DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 128 | Cursed Ground | block | STATE/OVERLAY — UNCONFIRMED | **POC-ONLY / NOT PROMOTED** | No locked exact current target. Exclude from normal canon/worldgen; preserve as leyforge_test if useful or leyforge_compat when old saves require it. |
| 129 | Quicksand | block | TERRAIN STATE/MIXTURE REVIEW | **CANONICAL REBIND / GENERATED FORM / STATE** | sand/sediment + saturation/mechanical state. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 130 | Snow Layer | block | PHASE/FORM REVIEW | **CANONICAL REBIND / GENERATED FORM / STATE** | Water-derived frozen/snow world representation. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 131 | Arcane Mana Fluid | block | DEFER / UNCONFIRMED FLUID | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 132 | Steam Vent | block | WORLD FEATURE / PHASE RELATION | **CANONICAL REBIND / GENERATED FORM / STATE** | vent feature emitting Water vapour/steam or authored gas. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 133 | Voidstone | block | DEFER / MIGRATION-ONLY | **MIGRATION-ONLY / FUTURE-DEFERRED** | future/deferred Void content. Not active current progression; old save references remain migration/compatibility data. |
| 134 | Celestial Stone | block | MIGRATE CONTEXTUALLY | **CANONICAL CONTEXTUAL MIGRATION** | Cloudstone / Hymnstone / valid Ascendant state according to source context. Resolve by locked context; do not preserve the obsolete identity as active canon. |
| 135 | Fae Grass | block | MIGRATE CONTEXTUALLY | **CANONICAL CONTEXTUAL MIGRATION** | actual Verdant flora/terrain definition. Resolve by locked context; do not preserve the obsolete identity as active canon. |
| 136 | Dream Glass | block | MIGRATE CONTEXTUALLY | **CANONICAL CONTEXTUAL MIGRATION** | Lucid Glass or documented Lucid Glass state/product. Resolve by locked context; do not preserve the obsolete identity as active canon. |
| 137 | Infernal Brick | block | MIGRATE | **CANONICAL CONTEXTUAL MIGRATION** | Ash Brick lineage. Resolve by locked context; do not preserve the obsolete identity as active canon. |
| 138 | Deep Forge Stone | block | RETIRE / CONTEXTUAL MIGRATION | **RETIRED / ALIAS OR CONTEXTUAL MIGRATION** | canonical Impossible Deep stone/form determined by source context. No active independent identity survives. |
| 139 | Broken Portal Block | block | STATE / STRUCTURE PIECE | **CANONICAL NON-MATERIAL REBIND** | damaged/ruined state or piece of a canonical portal structure. Bind to structure/state/anomaly owner, not a generic material or seventh portal. |
| 140 | Unstable Rift Block | block | ANOMALY / INTERFACE | **CANONICAL NON-MATERIAL REBIND** | rift/anomaly/event content. Bind to structure/state/anomaly owner, not a generic material or seventh portal. |
| 141 | Strange Realm Ore | block | REJECT | **REJECT / REMOVE FROM NORMAL CANON** | No active canonical target. Preserve old ID only in migration history; compatibility salvage only if an old save requires value preservation. |
| 142 | Oak Log | item | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber/log object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 143 | Stick | item | FORM / PROVIDER | **CANONICAL REBIND / GENERATED FORM / STATE** | compatible wood/plant material + stick form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 144 | Plant Fibre | item | CATEGORY / PROVIDER | **CANONICAL REBIND / GENERATED FORM / STATE** | exact botanical fibre, Mixed Plant Fibre, or fibre provider semantics. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 145 | Thatch Bundle | item | FORM/PRODUCT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | valid fibre/plant provider + authored form/product. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 146 | Stone Chunk | item | GENERIC FORM / CONTEXTUAL | **CANONICAL REBIND / GENERATED FORM / STATE** | actual stone material + chunk form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 147 | Flint | item | MATERIAL/FORM REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 148 | Clay Lump | item | CLASS / FORM | **CANONICAL REBIND / GENERATED FORM / STATE** | specific clay material/profile + lump form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 149 | Sand | item | CATEGORY / FORM | **CANONICAL REBIND / GENERATED FORM / STATE** | composition-bearing Sand class. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 150 | Coal Chunk | item | FORM / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | Coal + chunk form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 151 | Raw Copper Ore | item | SOURCE / FEEDSTOCK | **CANONICAL REBIND / GENERATED FORM / STATE** | Copper-bearing ore/feedstock. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 152 | Copper Ingot | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Copper + ingot form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 153 | Copper Wire | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Copper + wire form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 154 | Copper Plate | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Copper + plate form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 155 | Copper Gear | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 156 | Raw Iron Ore | item | SOURCE / FEEDSTOCK | **CANONICAL REBIND / GENERATED FORM / STATE** | Iron-bearing ore/feedstock. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 157 | Iron Ingot | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Iron + ingot form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 158 | Iron Plate | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Iron + plate form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 159 | Iron Rod | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Iron + rod form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 160 | Iron Nails | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Iron + fastener/nails form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 161 | Raw Mana Crystal | item | REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Raw Mana Crystal. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 162 | Mana Shard | item | FORM / PRODUCT | **CANONICAL REBIND / GENERATED FORM / STATE** | Raw Mana Crystal / canonical mana-crystal lineage + shard form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 163 | Mana Dust | item | FORM / PRODUCT | **CANONICAL REBIND / GENERATED FORM / STATE** | Raw Mana Crystal / canonical mana-crystal lineage + dust form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 164 | Blank Rune Stone | item | DEFER / UNCONFIRMED | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 165 | Basic Rune | item | DEFER / UNCONFIRMED | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 166 | Basic Ward Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 167 | Oak Plank | item | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber + plank form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 168 | Oak Beam | item | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | Oak timber beam object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 169 | Cobblestone | item | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | stone-material cobble object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 170 | Stone Brick | item | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | stone-material masonry brick object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 171 | Glass Piece | item | FORM / CONTEXTUAL | **CANONICAL REBIND / GENERATED FORM / STATE** | actual glass material + piece/shard form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 172 | Wild Berries | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 173 | Wheat Seed | item | DEFER / UNCONFIRMED | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 174 | Wheat | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 175 | Bread | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 176 | Raw Meat | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 177 | Cooked Meat | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 178 | Simple Stew | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 179 | Water Flask | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 180 | Crude Pickaxe | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 181 | Crude Axe | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 182 | Stone Pickaxe | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 183 | Stone Axe | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 184 | Iron Pickaxe | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 185 | Iron Axe | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 186 | Basic Hammer | item | REBIND CANDIDATE | **CANONICAL TOOL ARCHETYPE REBIND** | Rebind to modern Hammer tool archetype; legacy Basic qualifier becomes migration/display history unless an owning progression system later authors a distinct variant. |
| 187 | Basic Wrench | item | REBIND CANDIDATE | **CANONICAL TOOL ARCHETYPE REBIND** | Rebind to modern Wrench tool archetype; legacy Basic qualifier becomes migration/display history unless an owning progression system later authors a distinct variant. |
| 188 | Basic Rune Tuner | item | REBIND CANDIDATE | **CANONICAL TOOL ARCHETYPE REBIND** | Rebind to modern Rune Tuner tool archetype; legacy Basic qualifier becomes migration/display history unless an owning progression system later authors a distinct variant. |
| 189 | Rune Chisel | item | REBIND CANDIDATE | **CANONICAL TOOL ARCHETYPE REBIND** | Rebind to modern Rune Chisel tool archetype; legacy Basic qualifier becomes migration/display history unless an owning progression system later authors a distinct variant. |
| 190 | Blueprint Tool | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 191 | Iron Sword | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 192 | Wooden Bow | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 193 | Arrow Bundle | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 194 | Apprentice Staff | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 195 | Wooden Shield | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 196 | Leather Tunic | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 197 | Small Backpack | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 198 | Wooden Machine Frame | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 199 | Copper Machine Frame | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 200 | Basic Machine Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 201 | Item Chute Segment | item | COMPONENT REBIND CANDIDATE | **CANONICAL REBIND / GENERATED FORM / STATE** | Item Chute Segment. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 202 | Iron Miner Head | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 203 | Stone Furnace Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 204 | Mana Furnace Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 205 | Ward Lantern Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 206 | Copper Trade Coin | item | DEFER / ECONOMY BINDING | **LEGACY ECONOMY OBJECT — NOT UNIVERSAL CURRENCY** | Retain only with a defined issuer/economic context. Otherwise use compatibility/deprecated handling; never promote to universal legal tender by inheritance. |
| 207 | Village Supply Token | item | DEFER / ECONOMY BINDING | **LEGACY ECONOMY OBJECT — NOT UNIVERSAL CURRENCY** | Retain only with a defined issuer/economic context. Otherwise use compatibility/deprecated handling; never promote to universal legal tender by inheritance. |
| 208 | Builder Request Slip | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 209 | Warehouse Crate Manifest | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 210 | Goblin Scrap | item | HOLD / PERSONHOOD-CATEGORY REVIEW | **CATEGORY MIGRATION + OWNER REVIEW** | Remove legacy Monster Drop ontology. Exact POC object is not auto-canonised; if retained by an owning content set, classify as cultural/faction equipment, salvage, trade good or circumstance-specific loot. |
| 211 | Crude Goblin Blade | item | HOLD / PERSONHOOD-CATEGORY REVIEW | **CATEGORY MIGRATION + OWNER REVIEW** | Remove legacy Monster Drop ontology. Exact POC object is not auto-canonised; if retained by an owning content set, classify as cultural/faction equipment, salvage, trade good or circumstance-specific loot. |
| 212 | Weak Monster Essence | item | DEFER / LOOT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 213 | Torn Research Page | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 214 | Basic Rune Note | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 215 | Local Map Fragment | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 216 | Gravel | item | CATEGORY / FORM | **CANONICAL REBIND / GENERATED FORM / STATE** | composition-bearing Gravel class. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 217 | Common Herb | item | MATERIAL/FORM REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 218 | Cave Mushroom | item | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | harvested Cave Mushroom product. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 219 | Reed | item | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | harvested reed material/product. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 220 | Paper | item | MATERIAL/FORM REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 221 | Basic Ink | item | MATERIAL/FORM REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 222 | Charcoal | item | PROCESSED MATERIAL / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | Charcoal. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 223 | Clay Brick | item | RELATIONSHIP CLUSTER / REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | fired ceramic/clay + brick form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 224 | Clay Roof Tile | item | MERGE / SINGLE-DEFINITION | **CANONICAL REBIND / GENERATED FORM / STATE** | ceramic/clay roof-tile object. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 225 | Rope | item | FORM/PRODUCT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | valid fibre/plant provider + authored form/product. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 226 | Basic Cloth | item | FORM/PRODUCT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | valid fibre/plant provider + authored form/product. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 227 | Leather | item | MATERIAL/FORM REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 228 | Steel Ingot | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Steel + ingot form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 229 | Steel Plate | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Steel + plate form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 230 | Iron Gear | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 231 | Wooden Gear | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 232 | Wooden Shaft | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 233 | Iron Shaft | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 234 | Belt Roll | item | COMPONENT REBIND CANDIDATE | **CANONICAL REBIND / GENERATED FORM / STATE** | Belt Roll. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 235 | Item Pipe Section | item | COMPONENT REBIND CANDIDATE | **CANONICAL REBIND / GENERATED FORM / STATE** | Item Pipe Section. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 236 | Fluid Pipe Section | item | COMPONENT REBIND CANDIDATE | **CANONICAL REBIND / GENERATED FORM / STATE** | Fluid Pipe Section. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 237 | Filter Screen | item | COMPONENT REBIND CANDIDATE | **CANONICAL REBIND / GENERATED FORM / STATE** | Filter Screen. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 238 | Sorter Core | item | COMPONENT REBIND CANDIDATE | **CANONICAL REBIND / GENERATED FORM / STATE** | Sorter Core. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 239 | Water Wheel Axle | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 240 | Windmill Sail | item | COMPONENT REBIND | **CANONICAL REBIND / GENERATED FORM / STATE** | component object retaining actual source material. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 241 | Mana Coil | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 242 | Mana Battery Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 243 | Iron Shovel | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 244 | Basic Hoe | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 245 | Basic Sickle | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 246 | Basic Saw | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 247 | Measuring Rope | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 248 | Stone Spear | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 249 | Iron Spear | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 250 | Basic Crossbow | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 251 | Bolt Bundle | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 252 | Spark Wand | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 253 | Blank Spellbook | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 254 | Iron Helmet | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 255 | Iron Chestplate | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 256 | Apprentice Mage Robe | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 257 | Iron Shield | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 258 | Tool Belt | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 259 | Roasted Mushroom | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 260 | Village Meal Pack | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 261 | Herbal Tea | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 262 | Healing Poultice | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 263 | Basic Healing Potion | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 264 | Minor Recall Scroll | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 265 | Silver Trade Coin | item | DEFER / ECONOMY BINDING | **LEGACY ECONOMY OBJECT — NOT UNIVERSAL CURRENCY** | Retain only with a defined issuer/economic context. Otherwise use compatibility/deprecated handling; never promote to universal legal tender by inheritance. |
| 266 | Grain Sack | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 267 | Tool Bundle | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 268 | Guard Weapon Bundle | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 269 | Medical Bundle | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 270 | Festival Goods | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 271 | Wolf Pelt | item | DEFER / LOOT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 272 | Beast Fang | item | DEFER / LOOT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 273 | Weak Wisp Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 274 | Bandit Badge | item | DEFER / LOOT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 275 | Ancient Coin | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 276 | Blank Recipe Scroll | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 277 | Village Construction Plan | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 278 | Culture Customs Book | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 279 | Rusted Old Key | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 280 | Broken Seal Fragment | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 281 | Arcane Alloy Ingot | item | MATERIAL/FORM REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 282 | Mythril Ingot | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Mythril + ingot form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 283 | Fae Seed | item | CATEGORY / LEGACY | **CANONICAL REBIND / GENERATED FORM / STATE** | specific authored seed/plant where known. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 284 | Infernal Ash | item | REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Infernal Ash. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 285 | Deep Forge Ember | item | MIGRATE CONTEXTUALLY | **CANONICAL CONTEXTUAL MIGRATION** | Deepfire Ember only if source/context confirms equivalence. Resolve by locked context; do not preserve the obsolete identity as active canon. |
| 286 | Shadow Essence | item | DEFER / UNCONFIRMED | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 287 | Clay Golem Heart | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 288 | Rune Engine Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 289 | Portal Stabiliser | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 290 | Golem Command Glyph | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 291 | Ancient Machine Core | item | COMPONENT / DEFER EXACT | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 292 | Living Crown Seed | item | DEFER / PROVENANCE OBJECT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 293 | Void Compass | item | DEFER / PROVENANCE OBJECT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 294 | Mythril Spellblade | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 295 | Master Rune Staff | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 296 | Arcane Engineer Coat | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 297 | Linked Satchel | item | DEFER / EQUIPMENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 298 | Dwarven Gearwork | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 299 | Elven Living Thread | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 300 | Goblin Clockwork Junk | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 301 | Ancient Portal Rubbing | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 302 | Boss Weakness Codex | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 303 | Captured Raider Banner | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 304 | Drake Scale | item | DEFER / LOOT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 305 | Faction Seal | item | DEFER / CONTENT REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 306 | Voidstone Shard | item | DEFER / MIGRATION-ONLY | **MIGRATION-ONLY / FUTURE-DEFERRED** | future/deferred Voidstone-derived content only if later canon restores it. Not active current progression; old save references remain migration/compatibility data. |
| 307 | Celestial Metal Fragment | item | FORM / REBIND CANONICAL | **CANONICAL REBIND / GENERATED FORM / STATE** | Celestial Metal + fragment form. Use FCC-13A/B identity/projection rules; old POC ID becomes migration alias where safe. |
| 308 | Dream Glass Shard | item | MIGRATE CONTEXTUALLY | **CANONICAL CONTEXTUAL MIGRATION** | Lucid Glass + shard form, or documented Lucid Glass state/product. Resolve by locked context; do not preserve the obsolete identity as active canon. |
| 309 | Basic Mechanical Miner | block | SYSTEM CANDIDATE / REBIND | **CANONICAL SYSTEM ARCHETYPE REBIND** | Redirect/rebind legacy row to the modern Mechanical Miner archetype under FCC-13B/C. Preserve old ID as migration alias where semantically exact. |
| 310 | Village Warehouse Input Hatch | block | SYSTEM CANDIDATE / REBIND | **POC-ONLY / NOT PROMOTED** | No independent active canonical target is locked by FCC-13. Preserve only as test/compatibility/migration evidence unless a later owning system explicitly canonises it. |
| 311 | Crude Shovel | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |
| 312 | Stone Shovel | item | DEFER / TOOL REVIEW | **POC-ONLY / NOT PROMOTED** | FCC-13 does not have sufficient locked owner support for this exact POC object. Exclude from normal canonical worldgen/crafting. Preserve as leyforge_test when useful; use leyforge_compat for old-save instances; an owning system may later author a new canonical object through normal governance. |


---

# 34. Final Row-Count Certification

The matrix above contains:

> **312 / 312 legacy POC rows**

with a final FCC-13E outcome.

No row remains dependent on an unstated assumption.

A `POC-ONLY / NOT PROMOTED` outcome is final and intentional: it means the old row remains outside current gameplay canon until an owning system explicitly authorises a new canonical definition.

---

# 35. FCC-13E Result

> **FCC-13E — LEGACY MIGRATION MATRIX, COMPLETENESS AUDIT & FCC-14 HANDOFF — CANON WRITING COMPLETE v0.1**

FCC-13A–E are now all written.

Design-time completion status:

- **FCC-13A — COMPLETE**
- **FCC-13B — COMPLETE**
- **FCC-13C — COMPLETE**
- **FCC-13D — COMPLETE**
- **FCC-13E — COMPLETE**
- **312/312 legacy rows accounted for**
- **407/407 current-canon binding demands represented**
- **six portal families bound**
- **portal dependency graph acyclic**
- **unresolved FCC-13E holds: 0**

The next and final FCC-13 operation is:

> **FCC-13 FINAL DOCUMENT-TO-INTERVIEW FIDELITY AUDIT — Q1–Q268 versus FCC-13A–E**

FCC-13 is not formally content-canon locked until that fidelity audit confirms that all accepted interview decisions were carried into A–E without contradiction or omission.

---

**End of FCC-13E v0.1**
