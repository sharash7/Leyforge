# FCC-01 STEP 2B — CROSS-REALM COLLISION AND SOURCE-RECONCILIATION PASS

**Project:** Leyforge  
**Collection:** Final Content Canon (FCC)  
**Target:** FCC-01 — Overworld Final Content Canon  
**Step:** 2B — Cross-Realm Collision and Source-Reconciliation Pass  
**Version:** 0.1  
**Date:** 22 August 2026  
**Status:** COMPLETE — input to Step 2C Ownership Classification  
**Consumes:** `FCC-01_Step_2A_Realm-by-Realm_Overworld_Reconciliation_Extraction_v0_1.md`

---

# 1. Purpose

Step 2A extracted every important Overworld-facing obligation and explicit downstream deferral from the six completed realm FCC sets.

Step 2B now compares those locked realm sets against:

- one another;
- the reconciled Foundation documents;
- World Content Atlas Set 24;
- production-governance and registry Set 25;
- maritime Set 26;
- reconciled Sets 27–30;
- the current runtime/prototype `VoxelRegistry.json`;
- legacy dimension, material and portal concepts that predate the FCC locks.

The purpose of this pass is to determine **what is actually conflicting and what merely looks similar**.

This document does **not** choose final Overworld content, final portal recipes, final stable IDs, final balance values or final art. Those choices are assigned in Step 2C and later FCC/global work.

---

# 2. Source Authority Rule

The comparison uses the following working hierarchy.

1. **Locked realm FCC A–J sets** are authoritative for the realm-local content they explicitly own.
2. **Reconciled production Foundation / Sets 20–30** remain authoritative for universal systems within their declared ownership boundaries.
3. **Atlas Set 24 and earlier realm material** remain source foundations where they do not conflict with later FCC decisions.
4. **Prototype/runtime registries and POC content** are migration evidence, not automatic final canon.
5. A later FCC lock does not erase a useful legacy identifier; where appropriate it converts it into an alias/migration target rather than preserving obsolete meaning.

The important principle is:

> A collision is not resolved by silently deleting an older source. It is resolved by identifying which definition is authoritative and recording the required migration, alias, reclassification or downstream decision.

---

# 3. Classification Vocabulary

Every issue in this document is classified using one of the following outcomes.

## 3.1 TRUE COLLISION

Two definitions cannot both remain authoritative with their current meaning.

Requires:
- merge;
- rename;
- reclassification;
- supersession;
- or an explicit later decision.

## 3.2 RESOLVED SUPERSESSION

A genuine historical contradiction exists, but a later locked FCC decision has already resolved the design question.

Remaining work is migration/document/runtime cleanup rather than a new FCC-01 design decision.

## 3.3 LEGACY MIGRATION

An old ID, Block, Item, topology class, placeholder or label still exists in sources/runtime and must map to current canon.

## 3.4 FALSE COLLISION — DISTINCT BY PROVENANCE/FUNCTION

Two concepts share a word, shape, visual family or broad function but are canonically different because their:
- provenance;
- physical identity;
- magical behaviour;
- ecology;
- processing;
- or use
is different.

They must not be merged merely because their names resemble one another.

## 3.5 SHARED UNIVERSAL MATERIAL / SYSTEM

The same physical material or universal system legitimately appears in more than one realm.

The correct solution is one shared definition plus realm-specific availability/state/suitability, not duplicate realm-owned definitions.

## 3.6 COMPATIBLE SHARED-SYSTEM BOUNDARY

The realm FCC and a universal system already agree about ownership.

No new conflict exists, but the boundary must be preserved in FCC-01.

## 3.7 FCC-01 QUESTION REQUIRED

The collision cannot be finalised until the Overworld content canon answers something concrete.

This becomes direct input to the FCC-01 interview.

## 3.8 FCC-01 ACCOUNTING REQUIREMENT

FCC-01 does not need to decide the universal rule, but its content must provide compatible hooks/data/provenance.

## 3.9 GLOBAL-ONLY

The issue belongs to FCC-12, FCC-13, FCC-14, a universal system owner, migration/implementation work or later art governance.

It should not bloat the FCC-01 content questionnaire.

---

# 4. Executive Result

## 4.1 Overall Finding

**No blocking realm-to-realm content contradiction remains inside the six completed FCC realm sets.**

The realm-local FCC process already resolved most of the major historical conflicts before Step 2B began.

The remaining issues fall primarily into four categories:

1. **legacy source/runtime definitions that now need migration;**
2. **final Overworld choices required for first-access portal inputs and contact hooks;**
3. **shared universal materials/systems that must not be duplicated by realm;**
4. **global registry/recipe/schema work deliberately deferred to FCC-12/FCC-13/FCC-14 or universal owners.**

This means FCC-01 can proceed after Steps 2C–2D without reopening the completed realm designs.

## 4.2 Highest-Priority Collision Classes

The most important surviving reconciliation issues are:

- old multi-route realm-access language versus the newer one-canonical-portal-per-realm rule;
- old realm topology/IDs for Aetheric Reach + Divine Concords, Ashen Lower Realms and Necropolis Domains;
- exact portal-order / external-prerequisite choices;
- ordinary/shared materials such as basalt versus realm appearances;
- legacy generic dimension Blocks such as Dream Glass, Celestial Stone, Infernal Brick and Deep Forge Stone;
- prototype Block/Item duplication that conflicts with the single-definition rule;
- legacy Set-24 material “primary role” metadata that no longer matches FCC physical identities;
- cross-realm naming pairs that must remain distinct rather than be accidentally merged.

---

# 5. REALM TOPOLOGY AND IDENTITY COLLISION REGISTER

## B-COL-001 — Old Multiple Normal Realm Access Routes

**Classification:** RESOLVED SUPERSESSION + GLOBAL RUNTIME/DOCUMENT MIGRATION  
**Severity:** High historical conflict; no new realm-design question.

### Earlier source

Reconciled Foundation Document 14 retains an older route model containing:

- Natural Crossing;
- Ancient Gate;
- Ritual Route;
- Engineered Portal;
- Faction Route;
- accidental/breach paths;
- interstitial paths;
- realm-specific routes.

It also states that a route might use a:

- portal frame;
- dream boundary;
- spirit road;
- storm opening;
- Void passage;
- ritual threshold.

### Current FCC rule

The later FCC canon establishes:

> Every major realm has one specific canonical portal family for normal physical interdimensional entry/exit.

Other concepts may still provide:
- discovery;
- knowledge;
- ritual context;
- permissions;
- portal ingredients;
- destabilisation;
- breaches/events;
- internal realm travel;
- lore.

They do not become unrelated second normal access methods.

### Resolution

The **FCC portal rule supersedes the older normal-access interpretation**.

The older generic `realm_route` concept can survive as a broader relationship/path record if useful, but a route that physically transfers a player between current-scope major realms must resolve through that realm's canonical portal contract unless explicitly classified as a non-normal breach/event owned by global systems.

### FCC-01 effect

FCC-01 must not author:
- a Dream Boundary that replaces Dreamgate;
- a Spirit Road that replaces Veilgate;
- a Worldroot that replaces Covenant Portal;
- a mine shaft that physically enters Impossible Deep;
- a natural hole into Ashen Lower Realms;
- a storm opening that replaces Ascension Gate.

### Source anchors

- Foundation Document 14 — §33 Access Routes; §35 Route Versus Portal.
- All completed realm FCC A/J portal-boundary sections.

---

## B-COL-002 — “No Fixed Dimension Ladder” Versus Cross-Realm Portal Dependencies

**Classification:** FALSE COLLISION — COMPATIBLE WHEN MODELLED AS A PARTIAL DEPENDENCY GRAPH  
**Severity:** Important architectural clarification.

### Earlier source

Foundation Document 14 explicitly says the realm network is not:

`Overworld -> Realm A -> Realm B -> Realm C`

for every seed.

Worlds may expose different:
- clues;
- repaired gates;
- faction routes;
- ritual knowledge;
- breach events;
- route problems.

### FCC realm sets

Several realm gates deliberately allow the final global progression to require:
- Overworld materials only;
- universal components;
- or resources/knowledge from earlier-accessible realms.

### Finding

These rules do **not** require a rigid total ladder.

The compatible model is:

> **A branching capability/dependency graph with some directed prerequisite edges, not one mandatory total realm sequence.**

Example structure:

- Covenant Portal may be reachable entirely from Overworld foundations.
- Another gate may require a component from any one of several earlier capability providers.
- Some worlds may expose one gate's knowledge before another's.
- Exact recipe/order constraints can still prevent circularity.

### Resolution

Preserve:
- branching discovery;
- seed/world-history variation;
- alternate legitimate capability sources;
- non-linear player agency.

Later portal reconciliation must ensure:
- no circular mandatory dependency;
- every required realm remains reachable under progression guarantees;
- a prerequisite is expressed through real capability/material/knowledge, not an arbitrary quest flag.

### Ownership

**Step 2C must classify the exact gate dependency decisions.**

---

## B-COL-003 — Aetheric Reach + Divine Concords Legacy Split

**Classification:** RESOLVED SUPERSESSION + LEGACY MIGRATION

### Earlier Atlas identities

- `realm.major.aetheric_reach`
- `realm.network.divine_concords`

### Current FCC-05

Canonical realm:

`realm.major.ascendant_reach`

Legacy aliases:

- `realm.major.aetheric_reach`
- `realm.network.divine_concords`

The old sky-realm and divine-domain content now lives inside one persistent vertically structured Ascendant Reach.

### Resolution

No FCC-01 question is required about whether they are separate realms.

They are **not** separate current-scope realm destinations.

Global migration must:
- preserve old IDs as aliases where compatibility is required;
- prevent old portals/world records from spawning two conflicting realms;
- remap old resource/site references into Ascendant lineages.

---

## B-COL-004 — Ashen “Realm Cluster” Versus One Nine-Stratum Realm

**Classification:** RESOLVED SUPERSESSION + LEGACY MIGRATION

### Earlier Atlas identity

`realm.cluster.ashen_lower`

classified Ashen Lower Realms as a realm cluster.

### Current FCC-08

Canonical:

`realm.major.ashen_lower_realms`

with legacy alias:

`realm.cluster.ashen_lower`

Ashen is one enormous persistent realm containing exactly nine world-scale Lower Strata.

### Resolution

No separate subrealm network survives as ordinary current canon.

Old:
- furnace gates;
- contract roads;
- siege corridors;
- separate lower-world assumptions

may be reinterpreted as internal infrastructure/history where compatible.

They do not become external interdimensional portals between nine separate worlds.

---

## B-COL-005 — Necropolis Domains as Separate Realm Family

**Classification:** RESOLVED SUPERSESSION

### Earlier Atlas

Necropolis Domains existed as a separate realm cluster.

### Current FCC-03

Necropolis identity is absorbed into the Ancestral Veil as:
- cross-biome necropolis domain/state/polity content;
- dungeon/structure/civilisation expressions;
- not a separate current-scope realm;
- not the automatic destination of the dead.

### Resolution

FCC-01 must not create a separate Necropolis portal/progression chain during current rebuild scope.

Legacy names may survive only where they describe:
- Ancestral necropolis regions;
- structures;
- political domains;
- source migration.

---

## B-COL-006 — Somnolent “Network Realm” Versus One Authoritative Persistent World

**Classification:** COMPATIBLE WITH TERMINOLOGY CLARIFICATION

The stable ID `realm.network.somnolent_expanse` may remain.

However, FCC-04 establishes one authoritative persistent Dream Network realm with:
- the same player identity;
- one inventory;
- no sleeping-body duplicate;
- no parallel avatar created by ordinary sleep.

### Resolution

“Network” describes realm topology/coherence structure, not multiple independent player worlds or a body-copy architecture.

No ID change is required merely because the realm is persistent.

---

# 6. PORTAL COLLISION AND CIRCULARITY AUDIT

## 6.1 Canonical Portal Families

| Realm | Canonical normal portal |
|---|---|
| Verdant Covenant | Covenant Portal |
| Ancestral Veil | Veilgate |
| Somnolent Expanse | Dreamgate |
| Ascendant Reach | Ascension Gate |
| Impossible Deep | Deepgate |
| Ashen Lower Realms | Ashgate |

No current-scope realm has a second unrelated normal physical entry family.

---

## B-COL-007 — Covenant Portal First-Access Inputs

**Classification:** FCC-01 QUESTION REQUIRED

Verdant explicitly requires final Overworld bindings for:

- structural cut stone;
- hardwood;
- plant fibre/vine;
- low-tier mana-conductive/magical-attunement component;
- Attunement Vessel material;
- Growth Catalyst botanical/fertility ingredients.

### Collision audit against existing Overworld source catalogue

Set 24J already contains plausible material categories, including:

- Oak Heartwood;
- Ironbark Timber;
- Whitepine;
- Blackwood;
- Willowreed;
- Sunflax Fibre;
- Mirehemp Fibre;
- River Clay;
- White Kaolin;
- Silica Sand;
- Limestone;
- Granite;
- Basalt;
- Obsidian;
- Copper;
- Iron;
- Silver;
- Gold;
- Clear Quartz;
- Raw Mana Crystal;
- Ley Crystal;
- Thunder Glass.

### Finding

There is **no missing-category blocker**.

FCC-01 should decide the canonical Overworld material roster and suitability first; portal reconciliation can then bind existing valid providers.

**Do not invent “Portal Hardwood” or “Verdant Gate Fibre” purely to fill a recipe slot.**

---

## B-COL-008 — Veilgate External Dependency

**Classification:** GLOBAL PORTAL-PROGRESSION QUESTION; FCC-01 ACCOUNTING REQUIREMENT

Realm-local roles are already fixed:

- Memory Stone;
- Memory Glass;
- Soul Silver;
- Echo Pearl;
- Grave Salt;
- recognition/inscription layer.

Open globally:
- whether an Overworld/external component is mandatory;
- progression position;
- exact subcomponents/quantities.

### Finding

No current collision exists.

FCC-01 needs enough:
- historical;
- ritual;
- material;
- discovery
content to support Veilgate progression if later selected.

It does not need to invent Veil-specific material replacements.

---

## B-COL-009 — Dreamgate External Prerequisite

**Classification:** GLOBAL PORTAL-PROGRESSION QUESTION + FCC-01 ACCOUNTING REQUIREMENT

Somnolent's component pool is realm-local and non-final:

- Lucid Glass;
- Dream Mote;
- Coherence Core;
- Waking Stone;
- Memory Thread;
- possible universal/imported components.

Open:
- mandatory earlier-realm dependency;
- exact first-access graph;
- activation catalyst;
- progression tier.

### Finding

FCC-01 must establish Overworld:
- sleep/dream resonance;
- Dreamgate discovery clues;
- candidate universal materials/components.

Exact recipe belongs later unless Step 2C deliberately assigns a content prerequisite to FCC-01.

---

## B-COL-010 — Ascension Gate External Prerequisite

**Classification:** GLOBAL PORTAL-PROGRESSION QUESTION + FCC-01 ACCOUNTING REQUIREMENT

The first gate may use:
- Overworld materials;
- universal magical components;
- earlier-realm materials if globally selected;
- knowledge/discovery.

It may not circularly require Ascendant-exclusive resources without a valid pre-entry source.

### Finding

No source contradiction.

Final dependency must be chosen in the global portal graph after FCC-01 defines the Overworld candidate material/capability set.

---

## B-COL-011 — Deepgate External Prerequisite

**Classification:** GLOBAL PORTAL-PROGRESSION QUESTION + FCC-01 ACCOUNTING REQUIREMENT

Impossible Deep allows:
- Overworld inputs;
- prior-realm materials;
- global components;
- knowledge/keys.

But the first gate cannot require inaccessible Deep-native resources.

### Overworld requirement

FCC-01 must provide legitimate Deep discovery context, such as:
- seismic anomalies;
- deep-strata resonance;
- ancient Deep-linked ruins;
- archaeological evidence;
- selected provenance-valid fragments/materials;
- old stabilisation infrastructure.

These are clues/interfaces, **not alternate physical access**.

---

## B-COL-012 — Ashgate External Prerequisite

**Classification:** GLOBAL PORTAL-PROGRESSION QUESTION + FCC-01 ACCOUNTING REQUIREMENT

First Ashgate cannot circularly require Ashen-only resources such as:

- Infernal Ash;
- Ember Iron;
- Contract Iron;
- Ember Salt;
- Cinderhide;
- Hellglass;
- Furnace Heart.

### Overworld requirement

FCC-01 may provide:
- Ashgate discovery context;
- volcanic resonance;
- infernal diaspora/history;
- trade or archaeological evidence;
- pre-Ashen material/component providers.

Exact portal recipe remains later global work.

---

## 6.2 Portal Dependency Conclusion

At Step 2B there is **no proven mandatory circular dependency** because the exact cross-realm prerequisite edges have not yet been selected.

The safe architecture for Step 2C/D is:

- Overworld provides a foundational pool of structural, botanical, metallic, ceramic/glass/crystal and low-tier magical materials.
- At least one major-realm portal must be reachable without another realm.
- Later gates may consume earlier-realm capability/materials where it adds meaningful progression.
- Alternative equivalent providers remain valid when system rules allow.
- The graph must remain acyclic for mandatory first access.
- Discovery order may vary even where dependency order is constrained.

---

# 7. MATERIAL AND NAMING COLLISION MATRIX

## B-COL-013 — “Memory” Across Verdant, Ancestral and Somnolent

**Classification:** FALSE COLLISION — DISTINCT BY PROVENANCE/FUNCTION

### Examples

**Memory Seed — Verdant Covenant**
- biological/living provenance;
- botanical growth/memory role.

**Memory Glass — Ancestral Veil**
- Ancestral translucent recording/optical mineral;
- spirit/memory context.

**Memory Thread — Somnolent Expanse**
- Somnolent dream/memory fibre/medium.

### Finding

The shared word **Memory** is thematic, not evidence of one material.

Do not merge them.

Step 2B requires only:
- clear provenance tags;
- final naming collision check in FCC-12/13;
- cross-realm recipes to state which exact material they mean.

---

## B-COL-014 — Ordinary Silver Versus Soul Silver

**Classification:** FALSE COLLISION — DISTINCT MATERIAL

FCC-03 explicitly states:

- ordinary Silver remains a universal/Overworld material where canon supports it;
- Soul Silver is a distinct specialist spirit-active metal.

### Resolution

FCC-01 may freely define ordinary Overworld Silver.

It must not rename ordinary Silver merely to protect Soul Silver's uniqueness.

---

## B-COL-015 — Ordinary Glass Versus Memory Glass

**Classification:** FALSE COLLISION

FCC-03 explicitly distinguishes ordinary glass from Memory Glass.

The same principle applies globally:

> A realm-specific specialist glass does not replace ordinary silica glass.

---

## B-COL-016 — Dream Glass Prototype Versus Lucid Glass

**Classification:** RESOLVED SUPERSESSION + LEGACY MIGRATION

Current `VoxelRegistry.json` contains:

- `VXL_BLK_Dimension_DreamGlass`
- `realm.dream_glass.basic`
- Dream Glass Shard item.

FCC-04 explicitly states:

> Dream Glass is a migration/reconciliation target, not a second canonical material.

Canonical Somnolent material:
- **Lucid Glass**

Related old terms:
- Abyssal Dream Glass -> low-coherence/Deep-Dream Lucid Glass state;
- Fate Glass -> Lucid Glass state/product unless later global material reconciliation proves otherwise.

### Resolution

Do not create a second Dream Glass base family in FCC-01 or FCC-12.

---

## B-COL-017 — Celestial Stone Prototype

**Classification:** RESOLVED SUPERSESSION + LEGACY MIGRATION

Current `VoxelRegistry.json` contains:

- `VXL_BLK_Dimension_CelestialStone`
- `realm.celestial_stone.basic`

FCC-05 explicitly says no extra generic **Celestial Stone** or **Ascendant Ore** is required.

### Resolution

The old prototype must migrate according to its actual use/context into canonical Ascendant material families, principally:
- Cloudstone;
- Hymnstone;
- or an explicit treated/state form where justified.

It is not a standalone new Overworld material.

---

## B-COL-018 — Strange Realm Ore Prototype

**Classification:** LEGACY PLACEHOLDER — DO NOT CANONISE

Current registry contains:

- `VXL_BLK_Dimension_StrangeRealmOre`
- `ore.dimension.unknown`

This is an old teaser/unknown-dimension placeholder.

### Resolution

It must not survive as a canonical generic ore merely because multiple realms exist.

Where old content references it:
- migrate to an identified canonical material if provenance is now known;
- retain only as an explicitly unidentified/teaser state if a story asset genuinely needs an unknown specimen;
- never use it as a universal “dimension ore” family.

**Ownership:** FCC-12/13 + migration.

---

## B-COL-019 — Deep Forge Stone Prototype

**Classification:** RESOLVED SUPERSESSION + LEGACY MIGRATION

Current registry contains:

- `VXL_BLK_Dimension_DeepForgeStone`
- `realm.deep_forge_stone.basic`

FCC-06 retired Deep Forge Stone as a standalone natural material family.

Its historical uses should resolve into legitimate materials/forms such as:
- Pressure Stone;
- Emberbone;
- treated/constructed forge masonry;
- or another explicit canonical composition depending on the old asset's role.

### Resolution

Do not add Deep Forge Stone to FCC-01.

---

## B-COL-020 — Infernal Brick Prototype

**Classification:** RESOLVED SUPERSESSION + LEGACY MIGRATION

Current registry contains:

- `VXL_BLK_Dimension_InfernalBrick`
- `realm.infernal_brick.basic`

FCC-08 reconciles old Infernal Brick into the canonical **Ash Brick** lineage.

### Resolution

Retain old ID as migration/compatibility alias if required.

Do not preserve two unrelated brick materials.

---

## B-COL-021 — Fae Grass Prototype

**Classification:** LEGACY PLACEHOLDER / UNRESOLVED MIGRATION  
**Not an FCC-01 design requirement.**

Current registry contains:

- `VXL_BLK_Dimension_FaeGrass`
- `realm.fae_grass.basic`

The completed Verdant FCC does not establish **Fae Grass** as a required canonical base material.

### Finding

Step 2B cannot source-support an automatic mapping to a specific Verdant material.

Therefore:

- do not silently promote Fae Grass into Verdant canon;
- do not use it as an Overworld portal ingredient;
- preserve it as a migration audit item for FCC-12/13;
- later inspect actual historical asset use before mapping/removal.

This is an example where the sources do **not** support choosing a final answer yet.

---

## B-COL-022 — Black Ember Versus Deepfire Ember

**Classification:** FALSE COLLISION — EXPLICITLY DISTINCT

FCC-08 explicitly states:

- Black Ember is distinct from Impossible Deep Deepfire Ember;
- old Ashen “Deep Ember” is retired/reconciled into Black Ember, Furnace Heart or another explicit Ashen thermal role.

### Resolution

Never merge:
- Black Ember;
- Deepfire Ember.

A future cross-realm recipe may deliberately combine them, but shared heat/fire semantics do not make them the same resource.

---

## B-COL-023 — Overworld Thunder Glass Versus Ascendant Stormglass

**Classification:** LIKELY FALSE COLLISION — DISTINCT BY PROVENANCE  
**Requires final FCC-12 confirmation, not immediate merge.**

Set 24J defines Overworld:

**Thunder Glass**
- storm-struck silica;
- storm-craft role.

FCC-05 defines:

**Stormglass**
- canonical Ascendant storm-formed glass/crystal lineage;
- native/specialist Ascendant provenance.

### Finding

Current source evidence supports treating them as **distinct materials or distinct provenance classes**, not silently merging them.

The final global material pass should decide whether they:
- remain fully distinct;
- share a broader glass material family;
- or have a transformation/analogue relationship.

FCC-01 should preserve Overworld Thunder Glass only if the Overworld material audit confirms it as canonical.

---

## B-COL-024 — Basalt in Overworld and Ashen Lower Realms

**Classification:** SHARED UNIVERSAL MATERIAL / TRUE OWNERSHIP-DUPLICATION RISK

Set 24J and prototype registry support Overworld Basalt.

FCC-08 makes ordinary **Basalt** the principal common stone across much of Ashen Lower Realms.

FCC-08 deliberately avoids inventing “Hellstone” for ordinary basaltic geology.

### Finding

This should be one physical basalt material family, not:
- Overworld Basalt;
- Ashen Basalt
as unrelated definitions.

Realm context may change:
- formation;
- temperature;
- inclusions;
- depth facies;
- weathering;
- presentation;
- availability.

But ordinary basalt remains basalt.

### Ownership

- FCC-01 must define/retain Overworld basalt where appropriate.
- FCC-12 owns final shared-material identity.
- FCC-13 owns definitive Block/Item rows.

---

## B-COL-025 — Ordinary Water, Lava, Stone, Clay, Sand and Similar Materials

**Classification:** SHARED UNIVERSAL MATERIALS/SYSTEMS

Realm FCCs repeatedly reuse ordinary physical materials where appropriate.

Examples:
- Ashen lava/magma remains universal lava unless chemistry genuinely differs;
- imported/ordinary water remains water;
- ordinary glass remains distinct from specialist glass;
- ordinary bone remains distinct from Oathbone.

### Rule

Do not create realm-prefixed duplicates simply because the material exists in a realm.

Use:
- common material definition;
- provenance;
- state;
- treatment;
- suitability;
- environment
to express differences.

---

## B-COL-026 — Ascendant Aetheric + Divine Material Merge

**Classification:** RESOLVED SUPERSESSION + GLOBAL MATERIAL MIGRATION

Earlier Atlas material lists separated Aetheric Reach and Divine Concords.

FCC-05 reconciles them into Ascendant Reach and establishes transformed lineages such as:

- Celestial Metal <- Skyiron transformation;
- Halo Glass <- Stormglass transformation;
- Grace Thread <- Windspun Fibre transformation;
- Hymnstone retained as a specialist sacred stone;
- Blessing Salt retained as specialist material/product;
- Covenant Wax retained as specialist material/product.

### Resolution

Do not keep old Divine materials as a second unrelated realm's base-resource ladder.

FCC-12/13 should encode the transformation/derived-form relationships and aliases.

---

## B-COL-027 — Set 24J “Primary Role” Metadata Versus FCC Material Meaning

**Classification:** RESOLVED SOURCE-METADATA SUPERSESSION

The old Set 24J table assigns generic planning roles that sometimes conflict semantically with later FCC definitions.

Examples include old rows where:
- Contract Iron is labelled under a generic energy/catalyst role;
- Cinderhide is labelled under optical/inscription.

FCC-08 now gives both concrete physical provenance and actual functional identity.

### Resolution

Treat the old Set 24J role column as historical planning metadata.

Do **not** use it to override later FCC physical definitions.

FCC-12/13 migration must preserve:
- material identity;
- provenance;
- actual allowed uses;
- derived-form rules.

---

# 8. PROTOTYPE BLOCK / ITEM IDENTITY COLLISIONS

## B-COL-028 — Duplicate Placeable Blocks and Authored Items

**Classification:** GLOBAL-ONLY REGISTRY COLLISION

Current `VoxelRegistry.json` contains examples such as:

- Oak Log Block + Oak Log Item;
- Oak Planks Block + Oak Plank Item;
- Cobblestone Block + Cobblestone Item;
- Stone Brick Block + Stone Brick Item.

The FCC/global single-definition rule now says:

> If a placeable Block remains the same physical object when recovered/carried, use one canonical Block definition plus inventory projection rather than a separately-authored duplicate Item.

### Finding

The runtime registry is useful migration evidence but is not final authority.

### Resolution

FCC-01 should decide whether the **physical Overworld materials/forms exist**, not reproduce prototype duplicate rows.

Final cleanup belongs to:
- FCC-12 material/form reconciliation;
- FCC-13 definitive Blocks/Items/Recipes;
- registry/save migration.

---

## B-COL-029 — Generic Broken Portal / Unstable Rift Runtime Blocks

**Classification:** LEGACY GENERIC INFRASTRUCTURE / TEASER CONTENT

Current registry includes:

- Broken Portal Block;
- Unstable Rift Block.

These may remain useful as:
- ruined generic portal infrastructure;
- teaser/evidence;
- destabilised state;
- historical remnants.

They cannot silently substitute for:
- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

### Resolution

Their exact final ownership/mapping is global portal/registry work.

FCC-01 may use ruined portal evidence only with explicit provenance and without creating an alternate normal portal family.

---

# 9. SHARED-SYSTEM OWNERSHIP COLLISION AUDIT

## B-COL-030 — Ancestral Veil Versus Universal Death/Respawn

**Classification:** COMPATIBLE SHARED-SYSTEM BOUNDARY

No remaining collision.

Locked rule:
- universal death/respawn owns player death;
- Ancestral Veil owns spirit/memory/ancestor realm content;
- dead people do not automatically migrate into the Veil;
- souls are not generic loot commodities.

### FCC-01 requirement

Overworld graves, memorials, histories and ancestor traditions may exist.

They must not imply automatic literal Veil transfer unless a specific authored system says so.

---

## B-COL-031 — Somnolent Dream Resonance Versus Universal Sleep

**Classification:** COMPATIBLE SHARED-SYSTEM BOUNDARY

Set 29D owns:
- biological sleep pressure;
- sleep quality;
- environmental rest context.

FCC-04 owns:
- Somnolent dream/coherence content;
- bounded resonance.

Ordinary Overworld sleep may provide:
- visions;
- prophecy;
- hints;
- symbolic story information.

It may not physically move the player/items into Somnolent.

### FCC-01 requirement

Overworld sleep content must expose a clean interface for dream resonance without duplicating the sleep-survival system.

---

## B-COL-032 — Ashen Hunger Pits Versus Universal Hunger/Nutrition

**Classification:** COMPATIBLE SHARED-SYSTEM BOUNDARY

Set 29C owns:
- hunger;
- satiety;
- nutrition;
- consumption.

Ashen Hunger ecology may alter:
- food supply;
- appetite phenomena;
- creature behaviour;
- scarcity;
- ration systems;
- authored magical pressure.

It does not create “Infernal Hunger” as a second player meter.

### FCC-01 requirement

Any Overworld Hunger-related cross-realm event must enter through universal nutrition/food/economy/ecology interfaces.

---

## B-COL-033 — Ashen Contracts Versus Universal Contract/Law Systems

**Classification:** COMPATIBLE SHARED-SYSTEM BOUNDARY

Set 27E owns persistent contract truth:
- explicit agreement;
- signer authority;
- acceptance;
- amendment;
- fulfilment;
- breach;
- economic remedies;
- audit records.

Legal systems own:
- courts;
- arrest;
- seizure;
- imprisonment;
- territorial enforcement.

FCC-08 already aligns:

- **Contract** = accepted obligation.
- **Law** = authority attempting to enforce local rules.

### Resolution

Ashen Contract Iron and culture extend the shared contract system; they do not own a second hidden contract engine.

FCC-01 should reuse the same distinction for Overworld law/contracts.

---

## B-COL-034 — Sacred Law Versus Contract Law

**Classification:** DISTINCT SYSTEM CONCEPTS WITH SHARED GOVERNANCE INTERFACE

Ascendant sacred laws are authored domain rules tied to divine/domain authority.

Ashen contracts require explicit acceptance, while Ashen territorial laws are political enforcement.

These are not automatically the same mechanic.

### Global requirement

Later shared law/condition schemas may reuse:
- readable rule declarations;
- priority;
- compatibility;
- jurisdiction;
- consequences.

But:
- sacred-law exposure does not imply contract acceptance;
- contract acceptance does not grant divine-domain sovereignty.

### Ownership

Universal law/faction/contracts + realm-specific state systems.

Not a primary FCC-01 content decision.

---

## B-COL-035 — Impossible Deep Pressure/Gravity/Seismic Systems Versus Ascendant/Ashen Engineering

**Classification:** FALSE COLLISION — CROSS-REALM CAPABILITY INTERFACE

Impossible Deep owns:
- Deep pressure profiles;
- Deep gravity/orientation phenomena;
- seismic/Stoneflow conditions.

Ascendant owns:
- its own bounded altitude/gravity/aetheric conditions.

Ashen owns:
- heat/industrial/excavation conditions.

Engineering developed in one realm may help solve compatible problems in another, but no realm automatically owns another realm's physical laws.

### FCC-01 requirement

Overworld technologies/materials may provide capability where physically valid.

Do not add realm-origin restrictions.

---

## B-COL-036 — Maritime Systems Versus Realm Seas

**Classification:** COMPATIBLE SHARED-SYSTEM BOUNDARY

Set 26 establishes:
- shared vessel/maritime definitions;
- capability-based progression;
- core material identity;
- realm adaptations through declared facets.

Its explicit example says an Oak Plank remains the same Block in a cottage, dock or hull.

### Realm consequences

- Impossible Deep Blackwater navigation should reuse universal vessel/maritime capabilities where applicable.
- Ashen Cinder-Sea systems should reuse them with environment-specific adaptations.
- Realm-specific vessels/modules exist only when genuinely distinct.

### FCC-01 requirement

Overworld maritime content remains the baseline maritime ecosystem, not a duplicate of realm vessel systems.

---

## B-COL-037 — Presentation/Forge Systems Versus Gameplay Canon

**Classification:** COMPATIBLE SHARED-SYSTEM BOUNDARY

Set 23 Presentation Forge consumes authoritative gameplay state.

It does not own:
- material truth;
- realm truth;
- portal truth;
- damage;
- resources;
- corruption;
- world-state consequences.

Material/culture/biome/magic differences should normally be expressed through reusable presentation families/overlays rather than duplicate gameplay identities.

### Resolution

Step 2B must not use visual placeholder differences as evidence that two materials are canonically distinct.

Final art follows material/content canon later.

---

# 10. CROSS-REALM ECOLOGY AND EXPORT COLLISION AUDIT

## B-COL-038 — Exported Materials

**Classification:** COMPATIBLE GLOBAL PATTERN; FINAL SCHEMA GLOBAL-ONLY

Across completed FCC sets the repeated rule is:

> Physical matter normally remains physical matter outside its native realm.

Specialist realm-dependent behaviours may:
- weaken;
- become dormant;
- require stabilisation;
- require compatible systems/environment.

### Finding

No realm currently demands contradictory “material vanishes on export” logic.

### FCC-01 requirement

Overworld must be able to:
- receive imported realm materials;
- store/transport them;
- apply compatible environment/state rules;
- use physical properties that genuinely persist.

Final compatibility schema belongs to later global reconciliation.

---

## B-COL-039 — Cross-Realm Crops and Organisms

**Classification:** COMPATIBLE GLOBAL PATTERN + FCC-01 ACCOUNTING REQUIREMENT

Completed realm sets repeatedly allow export/import according to environmental suitability.

Useful states include concepts such as:
- compatible;
- managed habitat required;
- stressed;
- dormant;
- specialist ability suppressed;
- invasive;
- unable to survive.

### Finding

No automatic “wrong realm = dead” rule is required.

No automatic “all imported species thrive” rule is supported either.

### FCC-01 requirement

The Overworld ecology questionnaire must account for:
- imported crops;
- husbandry;
- aquaculture;
- quarantine;
- managed habitats;
- invasive species;
- environmental compatibility.

Exact universal suitability schema remains downstream.

---

## B-COL-040 — Cross-Realm Event Propagation

**Classification:** COMPATIBLE SHARED RULE

All realm sets increasingly converge on:

> Cross-realm consequences require an actual supported pathway/provenance.

Examples:
- portal transit;
- trade;
- migration;
- transported contamination;
- diplomacy;
- physical breach/event;
- information/resonance where only information is transferred.

Therefore:
- Ashen Great Ashfall does not automatically become Overworld weather;
- Somnolent prophecy does not physically create corruption;
- Deep seismic events do not physically rewrite the Overworld without an authored interface;
- Verdant seasonal states do not automatically overwrite Overworld seasons.

### FCC-01 requirement

Every imported realm event/effect must identify:
- transfer vector;
- provenance;
- receiving Overworld system;
- persistence/consequence scope.

---

# 11. OVERWORLD HISTORY, CULTURE AND CONTACT COLLISION AUDIT

## B-COL-041 — Overworld as “Default Owner” of Every Realm Concept

**Classification:** DESIGN RISK — FCC-01 ACCOUNTING REQUIREMENT

The Overworld is the primary civilisation heart, but it must not become a passive dumping ground where every realm automatically manifests.

FCC-01 should distinguish:

- globally common content;
- genuine Overworld-native content;
- imported/diaspora content;
- historical contact;
- portal-adjacent content;
- rare anomaly;
- deliberate cross-realm influence.

This is especially important for:
- religions;
- dream traditions;
- infernal communities;
- Deep archaeology;
- Verdant ecology;
- Ascendant pilgrimage;
- Ancestral memory sites.

---

## B-COL-042 — Ancestral Historical Reflection Versus Overworld History

**Classification:** COMPATIBLE BUT REQUIRES PROVENANCE

Ancestral Veil may reflect:
- archived events;
- historical places;
- cultures;
- ruins;
- remembered relationships.

It does not automatically mirror every:
- settlement;
- grave;
- death;
- family;
- event.

### FCC-01 question input

The Overworld will eventually need a bounded historical/provenance architecture rich enough for selected events/sites/cultures to have Veil reflections.

It does not need one-to-one Veil copies of the world.

---

## B-COL-043 — Somnolent Prophecy Versus Overworld Event Authority

**Classification:** COMPATIBLE INFORMATION INTERFACE

Somnolent may expose:
- warnings;
- clues;
- possible futures;
- prophecy fragments;
- emotional/cultural dreams.

These do not automatically authoritatively determine future Overworld state.

### FCC-01 requirement

Overworld events/quests may consume prophecy as:
- information;
- uncertainty;
- clue;
- condition.

Actual event truth remains with the relevant event/world systems.

---

## B-COL-044 — Ascendant Religion Versus Overworld Religion

**Classification:** DISTINCT CULTURAL CONTENT WITH CROSS-REALM INTERFACE

Ascendant Reach may interact with Overworld through:
- religion;
- pilgrimage;
- divine institutions;
- diplomacy;
- relics.

But Ascendant does not own all Overworld religion or prove one religion objectively correct.

### FCC-01 requirement

Overworld religion/culture must support:
- local traditions;
- imported Ascendant traditions;
- pilgrimage;
- scepticism;
- syncretism;
- political/religious conflict
without making the Overworld a subordinate divine province.

---

## B-COL-045 — Ashen Infernal Diaspora / Mortal Enclaves

**Classification:** COMPATIBLE CROSS-REALM SOCIAL INTERFACE

Ashen FCC permits:
- infernal diasporas in Overworld;
- Mortal Enclaves in Ashen;
- trade;
- migration;
- refugees;
- diplomacy.

### FCC-01 requirement

The Overworld ancestry/culture/settlement pass should allow:
- realm-origin communities;
- mixed populations;
- migration history;
- imported cultural institutions
without converting ancestry into faction/alignment.

---

## B-COL-046 — Impossible Deep Archaeological Evidence in Overworld

**Classification:** COMPATIBLE PROVENANCE-BOUND INTERFACE

Deep-linked Overworld evidence may include:
- resonance;
- seismic anomalies;
- ruins;
- fragments;
- stabilisation infrastructure;
- histories.

### Hard boundary

These must not imply:
- the Impossible Deep is literally below the Overworld;
- a sufficiently deep mine reaches it;
- a Worldroot/shaft/lift bypasses Deepgate.

### FCC-01 requirement

The deep-geology/cave/ruin questionnaire must reserve this interface explicitly.

---

# 12. CURRENT OVERWORLD RESOURCE READINESS FOR PORTAL ROLES

This section does not lock the final FCC-01 resource roster.

It answers only whether the existing source corpus already contains plausible **categories/providers** for the roles handed forward by Step 2A.

## 12.1 Structural Stone

Existing source candidates include:
- Limestone;
- Granite;
- Basalt;
- Obsidian;
- ordinary stone families.

**Status:** CATEGORY AVAILABLE.

## 12.2 Hardwood / Timber

Existing source candidates include:
- Oak Heartwood;
- Ironbark Timber;
- Whitepine;
- Blackwood;
- other Overworld timber families.

**Status:** CATEGORY AVAILABLE.

## 12.3 Fibre / Vine / Botanical Binding

Existing candidates include:
- Willowreed;
- Sunflax Fibre;
- Mirehemp Fibre;
- other plant fibres.

**Status:** CATEGORY AVAILABLE.

## 12.4 Vessel / Glass / Crystal / Ceramic

Existing candidates include:
- Silica Sand -> ordinary glass;
- River Clay;
- White Kaolin;
- Clear Quartz;
- other crystal/ceramic families.

**Status:** CATEGORY AVAILABLE.

## 12.5 Low-Tier Magical / Conductive / Attunement Input

Existing candidates include:
- Raw Mana Crystal;
- Ley Crystal;
- ordinary conductive metals/materials where a portal contract allows them.

**Status:** CATEGORY AVAILABLE.

## 12.6 Fertility / Botanical Catalyst Inputs

The Overworld source corpus already contains:
- crops;
- botanical resources;
- soils;
- water;
- mana materials;
- agricultural systems.

**Status:** CATEGORY AVAILABLE, exact provider unresolved.

## 12.7 Conclusion

There is currently **no evidence that FCC-01 must invent a special new Overworld resource solely to make the first realm portals constructible**.

The correct approach is:

1. finalise the Overworld's genuine material/ecology roster;
2. assign capability/suitability;
3. bind portal roles to valid existing providers;
4. create a new material only if a real independent world/material concept justifies it.

---

# 13. LEGACY MIGRATION MATRIX

| Legacy/source identity | Current treatment | Classification | Final owner |
|---|---|---|---|
| `realm.major.aetheric_reach` | alias -> `realm.major.ascendant_reach` | Resolved supersession | FCC-12/13 / registry migration |
| `realm.network.divine_concords` | alias -> `realm.major.ascendant_reach` | Resolved supersession | FCC-12/13 / registry migration |
| `realm.cluster.ashen_lower` | alias -> `realm.major.ashen_lower_realms` | Resolved supersession | FCC-12/13 / save migration |
| Necropolis Domains as separate current realm | absorbed/reclassified into Ancestral content | Resolved supersession | global registry/source migration |
| Dream Glass | -> Lucid Glass | Resolved supersession | FCC-12/13 |
| Abyssal Dream Glass | -> Lucid Glass state | Resolved supersession | FCC-12/13 |
| Fate Glass | -> Lucid Glass state/product | Resolved supersession | FCC-12/13 |
| Celestial Stone | map by actual use to canonical Ascendant material/state | Legacy migration | FCC-12/13 |
| Strange Realm Ore | remove/map/retain only as genuinely unidentified specimen | Legacy placeholder | FCC-12/13 |
| Deep Forge Stone | -> canonical Deep material/treated masonry according to role | Resolved supersession | FCC-12/13 |
| Infernal Brick | -> Ash Brick lineage | Resolved supersession | FCC-12/13 |
| Ashen Deep Ember | retired -> Black Ember/Furnace Heart/explicit thermal role | Resolved supersession | FCC-12/13 |
| Fae Grass | unresolved prototype; do not auto-promote | Legacy migration | FCC-12/13 after provenance audit |
| Broken Portal Block | generic ruin/teaser/state only | Legacy migration | universal portal registry |
| Unstable Rift Block | generic breach/teaser/state only | Legacy migration | universal portal/event registry |
| duplicate Oak Log Block + Item | one physical definition if same object | Registry duplication | FCC-13 |
| duplicate Oak Plank Block + Item | one physical definition if same object | Registry duplication | FCC-13 |
| duplicate Cobblestone Block + Item | one physical definition if same object | Registry duplication | FCC-13 |
| duplicate Stone Brick Block + Item | one physical definition if same object | Registry duplication | FCC-13 |
| old Set-24 realm material “Primary Role” | historical planning metadata; FCC physical meaning wins | Metadata supersession | FCC-12/13 |

---

# 14. CROSS-REALM FALSE-COLLISION REGISTER

The following pairs/families must **not** be merged simply because they look semantically similar.

| Concepts | Step-2B finding |
|---|---|
| Memory Seed / Memory Glass / Memory Thread | Distinct by biological, Ancestral and Somnolent provenance |
| ordinary Silver / Soul Silver | Distinct |
| ordinary Glass / Memory Glass | Distinct |
| ordinary Glass / Lucid Glass | Distinct unless a recipe deliberately transforms one into another |
| Thunder Glass / Stormglass | Likely distinct provenance; final FCC-12 relationship check |
| Black Ember / Deepfire Ember | Explicitly distinct |
| Hunger Crystal / universal Hunger | Material/phenomenon versus biological player system |
| Contract Iron / universal contracts | Material extension versus contract runtime authority |
| Sacred Law / accepted contract | Domain rule versus explicit obligation |
| Somnolent dream resonance / physical realm travel | Information interface versus portal travel |
| Veil memory/reflection / universal death | Spirit-memory content versus death/respawn authority |
| Deep gravity / Ascendant gravity | Separate realm-local physical profiles |
| Cinder Sea / ordinary Overworld ocean | Realm environment adaptation, not recoloured base water |
| Blackwater Vault-Sea / Overworld ocean | Deep environment adaptation, not ordinary ocean copy |

---

# 15. SHARED-UNIVERSAL REGISTER

The following should generally converge on shared definitions/interfaces rather than realm duplicates where the physical identity is genuinely the same.

- Basalt.
- Ordinary stone families.
- Water.
- Lava/magma.
- Ordinary glass.
- Ordinary silver/iron/copper/gold where present.
- Ordinary bone.
- Common construction shapes.
- Basic tools where materials/capability permit.
- Boats/vessel physics and general maritime systems.
- Hunger/nutrition.
- Sleep.
- Death/respawn.
- Contracts.
- Law/faction enforcement.
- Movement.
- settlement ownership/route-right interfaces.
- generic presentation/audio/VFX systems.
- Void provenance/corruption framework.

Realm documents may add:
- materials;
- treatments;
- states;
- environmental adaptations;
- specialist components;
- cultural forms;
- capability requirements.

They should not clone the universal owner.

---

# 16. PORTAL / REALM PROGRESSION QUESTIONS THAT SURVIVE STEP 2B

The following remain genuinely unresolved.

## 16.1 Must-answer eventually

1. Which portal or portals are **first-realm accessible from purely Overworld/universal capability**?
2. What candidate Overworld material families fill Covenant Portal first-access roles?
3. Does Veilgate require an external/earlier-realm component?
4. Does Dreamgate require an external/earlier-realm component?
5. Does Ascension Gate require an earlier-realm component?
6. Does Deepgate require an earlier-realm component?
7. Does Ashgate require an earlier-realm component?
8. What is the resulting mandatory dependency graph?
9. What alternative provider/substitution rules are valid?
10. How are discovery order and dependency order allowed to differ?
11. What recovery/failsafe behaviour is universal to all gates?
12. Which portal upgrades use native realm materials after first access?

## 16.2 Step-2B recommendation

Do **not** answer these in isolation before FCC-01 finalises:
- Overworld materials;
- progression capability families;
- world-history/discovery hooks;
- magic foundations;
- ruins/portal archaeology.

FCC-01 should provide the raw canonical inputs.

The global portal pass then binds them into a non-circular graph.

---

# 17. ISSUES FCC-01 MUST DIRECTLY ANSWER

These are Step-2B outputs that should become explicit Overworld questionnaire topics.

## 17.1 Overworld Material Foundations

FCC-01 must settle the **content roster and identity** for:

- stone/geology families;
- timber/wood families;
- fibre/vine families;
- clays/ceramics;
- sands/glass foundations;
- ordinary metals;
- crystals/mana-conductive materials;
- fertility/botanical resources;
- deep-strata materials;
- volcanic/geothermal materials.

This is needed before first-access portal providers can be finalised.

## 17.2 Deep Overworld / Impossible Deep Interface

FCC-01 must decide the actual Overworld content used for:

- Deep resonance;
- seismic anomalies;
- Deepgate discovery;
- ancient Deep-contact ruins/evidence;
- valid fragments/material clues;
- deep-cave distinction.

Hard boundary: no portal-free Deep entry.

## 17.3 Sleep / Somnolent Interface

FCC-01 must define how Overworld:
- beds/sleep;
- dreams;
- cultures;
- quests;
- prophecy;
- world events
can expose bounded Somnolent resonance.

Hard boundary: no physical travel through ordinary sleep.

## 17.4 Overworld History / Ancestral Interface

FCC-01 must provide enough authored history/provenance structure for selected:

- events;
- cultures;
- ruins;
- settlements;
- relics;
- memorials
to have legitimate Veil reflections.

No automatic mirror of every death/grave/site.

## 17.5 Ascendant Contact

FCC-01 must account for:

- pilgrimage;
- religions;
- relic contact;
- aerial technology;
- weather research;
- migration;
- sky-vessel knowledge;
- Ascension Gate clues.

Ascendant does not own Overworld weather/religion.

## 17.6 Ashen Contact

FCC-01 must account for:

- infernal diaspora;
- Ashgate discovery;
- volcanic resonance;
- Mortal/Ashen contact history;
- trade;
- refugees;
- hazardous imports;
- agriculture exchange;
- quarantine/invasive events.

## 17.7 Cross-Realm Ecology in the Overworld

FCC-01 must decide how its biome/ecology/civilisation content can host:

- imported crops;
- realm fauna;
- managed habitats;
- aquaculture;
- husbandry;
- invasive species;
- quarantine;
- realm-origin settlements/diasporas.

## 17.8 Portal Archaeology and Discovery Content

FCC-01 must determine what Overworld-facing:
- ruins;
- records;
- ritual sites;
- portal remnants;
- research institutions;
- factions;
- clues
support discovering the six canonical portal families.

It must not create new normal portal families while doing so.

---

# 18. ISSUES FCC-01 MUST ACCOUNT FOR BUT DOES NOT OWN

These should appear as interface requirements in FCC-01, not be redesigned there.

- universal death/respawn;
- hunger/nutrition runtime;
- biological sleep runtime;
- contract acceptance/amendment/breach;
- legal enforcement;
- maritime/vessel runtime;
- movement/navigation runtime;
- universal corruption/Void provenance;
- Block/Item identity rules;
- global registry namespace;
- save migration;
- presentation/VFX/audio ownership;
- exact cross-realm export-stabilisation schema.

---

# 19. ISSUES THAT SHOULD NOT BECOME FCC-01 QUESTIONS

To keep the Overworld interview large but controlled, do **not** spend FCC-01 content questions on:

- exact stable IDs;
- exact recipe quantities;
- exact processing times;
- machine throughput;
- energy/fuel numbers;
- weapon damage values;
- armour numbers;
- crop growth days/yields;
- exact NPC population numbers;
- event frequency percentages;
- final biome spawn-density tables;
- final portal numerical costs;
- final global state/event enum names;
- final universal corruption schema;
- final save-file migration;
- Block/Item duplicate row cleanup;
- final material RGB/palette/texture/shader values;
- final realm K/L art documents;
- migration implementation for prototype IDs already conceptually resolved.

These remain later/global/implementation/art tasks.

---

# 20. STEP-2B QUESTION-SEED REGISTER FOR FCC-01

The following is not the final FCC-01 questionnaire.

It is the set of **question families** Step 2B proves FCC-01 will need.

1. What is the canonical Overworld geological hierarchy?
2. Which ordinary stone families are universal/shared?
3. Which Overworld wood/tree families are canonical?
4. Which fibre/vine crops/resources are canonical?
5. Which clay/ceramic/glass/crystal foundations are canonical?
6. Which ordinary and magical metals/minerals are genuinely Overworld-native?
7. Which existing Set-24 Overworld material candidates survive?
8. How deep does normal Overworld geology/cave ecology go?
9. What content marks the boundary between deep Overworld and Impossible Deep resonance?
10. What Overworld cultures/history have prior realm-contact evidence?
11. How are portal ruins/discovery clues distributed?
12. How does ordinary sleep expose Somnolent resonance?
13. Which Overworld histories may have Ancestral reflections?
14. How do Ascendant religions/pilgrims interface with Overworld cultures?
15. How do infernal diasporas/refugees integrate into Overworld settlements?
16. How are imported realm organisms classified and managed?
17. Which cross-realm materials can appear through trade/salvage/history before direct player access, if any?
18. What counts as legitimate provenance for such early appearances?
19. Which Overworld structures/institutions research realms/portals?
20. Which Overworld events can be triggered by actual cross-realm pathways?
21. How do Overworld worldgen/history seeds vary discovery order without breaking reachability?
22. Which Overworld capabilities should remain useful in every realm?
23. What Overworld content can serve as candidate Covenant Portal first-access providers?
24. What Overworld magic foundations provide low-tier portal attunement/conduction?
25. What Overworld content is explicitly **not** a realm leak/corruption phenomenon?

Step 2D will expand/reorder these into the actual interview architecture after Step 2C assigns ownership.

---

# 21. STEP-2C OWNERSHIP-CLASSIFICATION PAYLOAD

Step 2C should take every unresolved item in this file and assign one of these owners:

- **FCC-01 MUST ANSWER**
- **FCC-01 MUST ACCOUNT FOR**
- **FCC-12 — Universal Materials, Processing & Derived Forms**
- **FCC-13 — Definitive Blocks, Items & Recipes**
- **FCC-14 — Canon Certification & Art Handoff**
- **UNIVERSAL SYSTEM OWNER**
- **MIGRATION / IMPLEMENTATION ONLY**
- **ALREADY RESOLVED / NO ACTION**

The following issues are the most important Step-2C inputs.

### Portal/progression
- Covenant Portal Overworld providers.
- Veilgate external dependency.
- Dreamgate external dependency.
- Ascension Gate external dependency.
- Deepgate external dependency.
- Ashgate external dependency.
- partial dependency graph.
- discovery-order versus dependency-order rule.
- universal portal recovery/failsafe ownership.

### Materials
- Basalt shared-material ownership.
- Thunder Glass versus Stormglass relationship.
- final disposition of Fae Grass prototype.
- final migrated rows for Dream Glass/Celestial Stone/Deep Forge Stone/Infernal Brick.
- old Set-24 material-role metadata.
- Block/Item duplicates.

### Interfaces
- Deep-overworld evidence.
- sleep/dream resonance.
- Overworld history/Veil reflection.
- Ascendant religion/pilgrimage.
- Ashen diaspora/refugees.
- cross-realm ecology/quarantine.
- cross-realm event transfer vectors.

### Universal boundaries
- death;
- hunger;
- sleep;
- contracts;
- law;
- movement;
- maritime;
- corruption;
- presentation.

---

# 22. CONFIRMED NON-CONFLICTS

The following major relationships have passed Step 2B without requiring redesign.

- Verdant realm-local content versus universal ecology/material ownership.
- Ancestral Veil versus universal death/respawn.
- Somnolent Expanse versus universal sleep.
- Ascendant sacred-law content versus universal political/legal ownership, provided jurisdiction remains explicit.
- Impossible Deep versus Overworld geology, provided Deepgate remains required.
- Ashen Hunger ecology versus universal Hunger/Nutrition.
- Ashen contracts versus universal contract truth.
- realm-specific maritime environments versus Set-26 vessel/maritime runtime.
- realm engineering capabilities versus Set-25 capability-based progression.
- realm presentation differences versus Set-23 presentation ownership.
- physical export rule across all completed realms.
- explicit-pathway rule for cross-realm event propagation.
- non-linear/branching progression philosophy versus a portal dependency graph.
- tool/material capability working across realms regardless of origin.

---

# 23. BLOCKERS

## 23.1 Blocking contradiction before FCC-01 interview

**None identified.**

## 23.2 Required preparatory work before FCC-01 Question 1

Still required:

1. Step 2C — classify ownership of every unresolved item.
2. Step 2D — turn Step 2A + Step 2B + Step 2C into the FCC-01 interview architecture.

The Overworld questionnaire should begin only after those two references exist.

---

# 24. SOURCE REFERENCE MAP

Primary comparison sources used in this pass include:

## Completed realm FCC
- FCC-02A–J — Verdant Covenant
- FCC-03A–J — Ancestral Veil
- FCC-04A–J — Somnolent Expanse
- FCC-05A–J — Ascendant Reach
- FCC-06A–J — Impossible Deep
- FCC-08A–J — Ashen Lower Realms

## Pre-FCC/global source corpus
- Foundation Document 14 — Dimensions, Realms, Realm Travel and Interdimensional World System v1.0
  - §10.1 No Fixed Dimension Ladder
  - §33 Access Routes
  - §35 Route Versus Portal
- World Content Atlas 24D — Dimensions, Realm Structure and Realm Biome Atlas
  - realm classification
  - access graph
  - Appendix E legacy realm IDs
- World Content Atlas 24J — Resources, Loot, Relics, Trade and Material Ecology Atlas
  - Overworld resource foundations
  - legacy realm resource anchors
- Set 25C — capabilities/suitability/fallback schema
- Set 25E — progression reachability through valid capabilities/providers
- Set 25J — resource/provenance/progression chain matrix
- Set 26N — maritime progression and shared material identity
- Set 27E — contracts, acceptance, amendment, breach and enforcement handoff
- Set 29C — Hunger, Thirst, Nutrition and Consumption
- Set 29D — Temperature, Wetness, Shelter, Sleep and Environmental Exposure
- Set 23A/J — Presentation Forge authority and deferred final material/dimension presentation
- current `VoxelRegistry.json` — prototype/runtime migration evidence

---

# 25. STEP 2B COMPLETION GATE

Step 2B is complete when:

- [x] all six locked realm FCCs have been compared against one another;
- [x] legacy realm topology and IDs have been compared with current FCC topology;
- [x] portal access rules have been checked against older route models;
- [x] portal first-access circularity risk has been assessed;
- [x] existing Overworld source materials have been checked for portal-role category coverage;
- [x] major cross-realm naming/material overlaps have been classified;
- [x] shared universal materials have been separated from realm-specific materials;
- [x] prototype dimension Blocks have been checked against FCC migrations;
- [x] Block/Item duplication risk has been recorded;
- [x] universal death, hunger, sleep, contract, law, maritime, movement and presentation boundaries have been checked;
- [x] cross-realm ecology/export/event-propagation rules have been compared;
- [x] FCC-01-required question families have been extracted;
- [x] global-only work has been kept out of the Overworld content-design scope;
- [x] no locked realm-local canon has been silently reopened.

---

# 26. FINAL STEP-2B FINDING

> **The six completed realm FCC sets are mutually compatible enough to proceed toward FCC-01. The remaining contradictions are predominantly legacy migration and global-registry issues rather than unresolved realm design failures.**

The most important consequence for FCC-01 is:

> **The Overworld must now be designed as the central physical, historical and progression foundation that can support all six realm interfaces without becoming the owner of their systems or requiring duplicated materials/content.**

FCC-01 should therefore establish genuine Overworld canon first.

Portal recipes, cross-realm material normalisation and final registry rows should then consume that canon rather than forcing the Overworld to invent arbitrary content to satisfy old placeholders.

---

# 27. NEXT STEP

## STEP 2C — OWNERSHIP CLASSIFICATION AND DECISION-ROUTING REGISTER

Step 2C should convert every surviving issue from Steps 2A and 2B into a definitive routing table.

Each row must receive exactly one primary disposition:

- FCC-01 MUST ANSWER
- FCC-01 MUST ACCOUNT FOR
- FCC-12
- FCC-13
- FCC-14
- UNIVERSAL SYSTEM OWNER
- MIGRATION / IMPLEMENTATION ONLY
- ALREADY RESOLVED / NO ACTION

Step 2C should also identify:

- which issues become direct FCC-01 multiple-choice interview questions;
- which issues become FCC-01 acceptance constraints only;
- which issues must be withheld until the post-Overworld global reconciliation;
- which legacy items can be closed without further design discussion.

---

# 28. STEP STATUS

**STEP 2B — CROSS-REALM COLLISION AND SOURCE-RECONCILIATION PASS: COMPLETE**

**Next:** Step 2C — Ownership Classification and Decision-Routing Register.

