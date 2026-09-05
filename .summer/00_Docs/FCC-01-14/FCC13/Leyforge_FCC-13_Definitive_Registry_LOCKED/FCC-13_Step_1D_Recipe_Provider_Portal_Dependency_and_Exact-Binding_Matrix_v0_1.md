# Leyforge Final Content Canon Collection

## FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding
### Step 1D — Recipe, Provider, Portal Dependency & Exact-Binding Matrix

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** Source-Reconciliation Working Document — Dependency/Binding Questions Extracted; No New Exact Global Recipe Canon Locked Here  
**Predecessors:** FCC-13 Steps 1A–1C  
**Primary Authority:** FCC-12A–D and Final Lock; FCC-01G Part 2; FCC-02G; FCC-03G; FCC-04G; FCC-05G; FCC-06G; FCC-08G.

---

# 1. Purpose

FCC-13 Step 1D converts the current source corpus into a **dependency-safe exact-binding problem**.

The previous steps established:

- what FCC-13 is allowed to decide;
- what every legacy POC row currently means;
- what modern locked Leyforge requires the definitive registry to represent.

Step 1D now asks:

> **How can those canonical materials, forms, components, providers and portals be bound into executable recipes without contradicting FCC-12, creating inaccessible first-access loops, duplicating universal processes or silently changing realm-local design intent?**

This document therefore extracts:

1. the final recipe data requirements;
2. exact-material versus provider requirements;
3. universal processing capability requirements;
4. quantity-normalisation constraints;
5. generated-form recipe rules;
6. hazardous/stabilised processing rules;
7. portal first-access dependency constraints;
8. the six portal-family binding matrices;
9. portal-component asymmetries;
10. all remaining exact-binding forks that Step 1E must decide.

Step 1D is intentionally **not** the final executable recipe database.

---

# 2. Source-Locked Versus Recommended Versus Open

Every conclusion in this document belongs to one of three statuses.

## SOURCE-LOCKED

Already required by locked FCC documents.

FCC-13 must implement it.

## RECOMMENDED DEFAULT

A proposed normalisation that appears most consistent with locked architecture but has not yet been accepted as FCC-13 canon.

Step 1E may lock, amend or reject it.

## OPEN BINDING

The sources deliberately defer the decision.

FCC-13 must decide it explicitly.

This separation is mandatory because Step 1D must not fill source gaps silently.

---

# 3. Universal Recipe Record Requirements

## SOURCE-LOCKED

FCC-12B/C and realm-local G documents collectively require final recipe/process definitions to be capable of representing:

- recipe identity;
- output identity;
- output quantity;
- exact input identity;
- provider-class input;
- required input form;
- required input state;
- minimum quality/grade/purity where relevant;
- provenance requirement where relevant;
- station/tool/process capability;
- environmental requirement;
- specialist process mode;
- heat/energy/mana/power where relevant;
- knowledge/unlock requirement;
- permission/legal/cultural requirement where relevant;
- reversible versus irreversible processing;
- by-products;
- waste/loss where meaningful;
- conservation/transaction rule.

This is the minimum semantic recipe contract.

A future technical implementation may store the information differently, but it may not erase these distinctions.

---

# 4. Canonical Recipe Input Modes

## SOURCE-LOCKED

A final input slot must be able to use at least the following semantic modes.

### 4.1 Exact Material

Used where the material itself matters.

Examples:

- Contract Iron;
- Soul Silver;
- Dreamwater;
- exact portal-specific material where later locked.

### 4.2 Exact Component

Used where a manufactured object is required.

Examples:

- Covenant Heart;
- Ascension Keystone;
- Deep Keystone;
- Ash Keystone.

### 4.3 Provider / Capability Material

Used where any compatible material may fulfil the physical role.

Examples:

- structural hardwood;
- conductive metal;
- optical material;
- heat-resistant lining;
- plant-fibre binding.

### 4.4 Exact Form

Used where geometry/form matters.

Examples:

- plate;
- wire;
- pane;
- beam;
- ingot.

### 4.5 State Requirement

Examples:

- charged;
- tuned;
- stabilised;
- dry;
- calibrated.

### 4.6 Quality Threshold

Examples:

- minimum purity;
- sufficient structural strength;
- minimum optical clarity;
- pressure rating.

### 4.7 Provenance Requirement

Used only when source/history is genuinely part of the mechanic.

### 4.8 Knowledge / Ritual / Permission Condition

A requirement that is **not an inventory ingredient**.

This distinction is particularly important for portal attunement and political/access systems.

---

# 5. Provider Resolution Rule

## SOURCE-LOCKED

A provider requirement must validate the required physical/magical function rather than secretly naming one default material.

Conceptually:

> **provider eligibility = compatible class + correct form + required state + threshold properties + environment + any explicit provenance restriction**

Provider substitution:

- does not merge material identities;
- does not guarantee identical performance;
- does not waive conservation;
- does not teleport stock;
- does not bypass legal/knowledge requirements;
- cannot satisfy an exact-material slot.

---

# 6. Provider Role Families Required by Current Canon

## SOURCE-LOCKED AT SEMANTIC LEVEL

Current documents require provider semantics capable of expressing roles including:

- structural stone;
- cut-stone structural material;
- structural hardwood/timber;
- plant-fibre/vine binding;
- conductive metal;
- precision metal fitting;
- magical conductor;
- magical-attunement component/material;
- heat-resistant material;
- refractory material;
- optical glass/material;
- transparent pressure-resistant material;
- sealing material;
- pressure-compatible material;
- spirit-compatible material;
- coherence-compatible material;
- containment material;
- vessel material;
- corrosion-resistant material.

The **exact provider tag names remain OPEN BINDING**.

---

# 7. Recommended Provider Architecture

## RECOMMENDED DEFAULT — NOT YET LOCKED

Avoid creating one opaque provider tag for every recipe.

Prefer composable properties/roles where possible.

Example:

Instead of a unique:

> `pressure_window_material`

the final validation might conceptually require:

- transparent;
- pressure-rated;
- chemically compatible;
- valid pane/plate form.

A named convenience provider can still exist for authoring/UI if it resolves to explicit underlying requirements.

This follows FCC-12's anti-tier and anti-duplication architecture.

---

# 8. Processing Capability Doctrine

## SOURCE-LOCKED

Named stations are providers of capabilities, not arbitrary exclusive ontology gates.

A process should conceptually ask:

> **Can this tool/station/environment perform this transformation safely and correctly?**

rather than:

> **Is the recipe inside the one station whose name the designer happened to choose?**

Named stations remain meaningful because they can bundle:

- capability;
- efficiency;
- safety;
- automation;
- environmental support;
- UI;
- culture;
- progression;
- specialist geometry.

---

# 9. Universal Process Families

## SOURCE-LOCKED

FCC-12 requires broad reusable process families including:

- mechanical separation;
- cleaning/separation;
- thermal processing;
- mechanical forming;
- chemical/biological processing;
- assembly/fabrication.

Specialist modes layer onto those universal processes where required.

Examples include:

- living-material preservation;
- spirit-active handling;
- coherence stabilisation;
- High-Aether processing;
- Sacred-Law attunement;
- extreme-pressure processing;
- gravity/orientation processing;
- Blackwater-safe processing;
- infernal-heat processing;
- contract binding;
- hazardous-ember containment.

The existence of specialist handling does not justify duplicating every basic station for every realm.

---

# 10. Recipe Knowledge Versus Physical Capability

## SOURCE-LOCKED

Knowledge and execution capability remain separate.

A player may:

- know a recipe but lack the station/material/environment;
- possess the physical capability but not know the recipe;
- discover/experiment where another owning system permits;
- possess an imported station capable of processing foreign matter.

FCC-13 recipes must therefore not use `known recipe` as a substitute for material/station capability.

---

# 11. Conservation Rule

## SOURCE-LOCKED

Recipes must preserve physical resource truth.

A process may:

- consume input;
- transform input;
- create by-product;
- produce waste;
- create scrap/offcut;
- release emissions;
- lose a physically plausible amount.

It must not duplicate meaningful matter.

Automated systems must not double-claim reserved stock.

---

# 12. Generated Form Recipe Rule

## SOURCE-LOCKED

Ordinary shape conversion should use reusable generated/inherited profiles where technically safe.

Examples:

- log → planks;
- plank → slab/stair;
- stone → cut stone;
- cut stone → masonry;
- compatible metal → wire/plate/rod;
- glass → pane;
- fibre → thread/cord/cloth.

## OPEN BINDING

FCC-13 must still decide:

- exact global conversion yields;
- whether all generated conversions appear as explicit executable recipe records or deterministic form rules;
- how generated recipe IDs remain save-stable;
- which specialist materials opt out of ordinary conversions.

---

# 13. Quantity Normalisation Rule

## SOURCE-LOCKED

Realm documents repeatedly defer ordinary conversion yields to global reconciliation so equivalent processes do not produce inconsistent ratios across realms.

Example:

FCC-02G explicitly says ordinary wood profile numeric yields are normalised globally in FCC-13.

Therefore FCC-13 must establish global quantity standards for common form conversions.

## RECOMMENDED DEFAULT — NOT YET LOCKED

Define one global yield/conservation standard per physical conversion family, then override only when:

- composition changes;
- specialist material loses significant stock;
- a canonical realm recipe explicitly locks a different yield;
- physical geometry justifies a different conversion.

---

# 14. Existing Exact Recipe Numbers Must Not Be Erased

## SOURCE-LOCKED

Where a realm FCC already locks exact quantitative structure, FCC-13 must preserve it unless explicit reconciliation proves a contradiction.

The strongest current example is the Covenant Portal.

Its source explicitly locks:

- frame output quantity;
- per-craft role quantities;
- standard build frame-family count;
- Covenant Heart component counts;
- first-activation catalyst count.

These are not merely suggestions.

---

# 15. Hazardous Resource Recipe Binding

## SOURCE-LOCKED

Hazardous matter such as:

- Black Ember;
- Cold Fire;
- Furnace Heart;
- Heat Gas;
- pressure-sensitive matter;

may require:

- containment;
- stabilisation;
- cooling;
- pressure support;
- shielding;
- specialist handling.

A filled/contained resource may be represented as:

- container + stored-content data;
- a dedicated filled-container object;
- installed machine state.

The exact technical representation remains OPEN BINDING.

---

# 16. Installed Component Recovery

## SOURCE-LOCKED PRINCIPLE

Installed resources/components should recover the actual physical item/state when removal is physically valid.

A machine containing:

- Furnace Heart;
- Cooling Crystal;
- pressure component;
- portal keystone;

should not automatically return unrelated generic scrap.

This affects:

- dismantling recipes;
- salvage;
- repair;
- portal recovery;
- machine migration.

---

# 17. Portal Global Authority

## SOURCE-LOCKED

Exactly six normal external portal families exist:

1. Covenant Portal
2. Veilgate
3. Dreamgate
4. Ascension Gate
5. Deepgate
6. Ashgate

No portal recipe or migration rule may create:

- a generic seventh portal;
- generic Dimension Gate;
- normal realm bypass;
- separate “advanced portal family” for deeper destinations.

Upgrades remain within the same portal family.

---

# 18. Global First-Access Rule

## SOURCE-LOCKED

FCC-01G Part 2 establishes:

> **First access to a realm cannot require materials obtainable only after entering that realm unless a legitimate guaranteed pre-entry source is deliberately authored into the final graph.**

Pre-access foreign material is permitted only through legitimate physical provenance such as:

- historical portal trade;
- ancient expedition;
- diaspora/migration;
- diplomacy;
- inherited collection;
- old conflict;
- archaeological recovery;
- wrecked shipment;
- abandoned canonical portal facility;
- realm-contact enclave;
- authenticated relic;
- current third-party trade.

Random rarity or thematic biome resemblance is insufficient.

---

# 19. Mandatory Ingredient Cannot Depend on Random Pre-Access Loot

## SOURCE-LOCKED

FCC-01G explicitly prevents a random imported rarity from becoming a mandatory first-access ingredient merely because one world seed happened to contain it.

Therefore any portal recipe using destination-realm material before first access must have a **guaranteed authored provenance route**.

This is stricter than merely saying:

> “the item technically can exist in the Overworld.”

---

# 20. Portal Sequence Breaking

## SOURCE-LOCKED

A player legitimately possessing:

- required knowledge;
- accepted material/component;
- required capability;
- physical access;
- valid activation conditions;

may construct/use a portal earlier than the expected narrative sequence where the final graph permits.

The game must not reject a valid physical solution solely because the player skipped an expected quest order.

---

# 21. Global Realm Order Is Not Yet Locked by FCC-13 Sources

## SOURCE FINDING

The source corpus does **not** establish one mandatory linear order such as:

> Verdant → Ancestral → Somnolent → Ascendant → Deep → Ashen.

Several realm documents explicitly permit:

- Overworld materials;
- previously accessible realm materials;
- globally available components;

depending on final reconciliation.

Therefore Step 1D must not invent a fixed realm order.

The exact dependency graph is **OPEN BINDING**.

---

# 22. Portal Dependency Matrix — Summary

| Portal | Realm-Local Physical Contract | Native Material Requirement Before First Access? | Exact First Recipe Status | First-Access Constraint |
|---|---|---|---|---|
| Covenant Portal | Frame + Keystone Socket + Covenant Heart + aperture | Explicitly **NO** | unusually detailed and partially exact | Overworld-only first-access ingredients |
| Veilgate | Memory Stone + Memory Glass + Soul Silver + Echo Pearl core role + Grave Salt + recognition layer | unresolved globally | deferred | no circular destination-realm dependency unless guaranteed pre-entry route |
| Dreamgate | Somnolent component-role pool + universal imported components | no final mandatory subset locked | deferred | final graph deferred; no physical Dreamgate bypass through sleep/dream |
| Ascension Gate | frame + fittings + Ascension Keystone + attunement + interface + destination | Explicitly **NO**, absent guaranteed alternate source | deferred | Overworld/universal/earlier-accessible materials |
| Deepgate | frame + anchoring + Deep Keystone + pressure/depth attunement + interface + destination | Explicitly **NO**, absent guaranteed alternate source | deferred | Overworld/earlier/global components |
| Ashgate | reinforced frame + thermal stabilisation + Ash Keystone + attunement + interface + destination | Explicitly **NO**, absent guaranteed alternate source | deferred | pre-Ashen accessible materials |

---

# 23. Covenant Portal — Source-Locked Binding Matrix

The Covenant Portal is the most numerically specific current portal contract.

## 23.1 Physical Assembly

### SOURCE-LOCKED

Canonical components:

- Covenant Portal Frame Blocks;
- Covenant Keystone Socket;
- Covenant Heart;
- valid enclosed aperture.

Standard blueprint:

- 10 ordinary Covenant Portal Frame Blocks;
- 2 rooted-foot pieces/state from the same frame family;
- 1 Covenant Keystone Socket;
- 1 Covenant Heart.

Preferred registry interpretation in FCC-02G:

> 12 total frame-family pieces, with two in rooted-foot state, plus one Keystone Socket.

This avoids creating an unnecessary separate Rooted Portal Foot material/object family.

## 23.2 First-Access Frame Recipe

### SOURCE-LOCKED

Output per craft:

- **2 Covenant Portal Frame Blocks**

Inputs per craft:

- 2 units approved cut-stone structural material;
- 1 unit approved hardwood structural material;
- 1 unit approved plant-fibre/vine binding;
- 1 low-tier mana-conductive or magical-attunement component.

Six crafts produce the 12 frame-family pieces required by the standard portal.

All inputs must be obtainable in the Overworld before first realm access.

## 23.3 Keystone Socket Recipe

### SOURCE-LOCKED

Output:

- 1 Covenant Keystone Socket Block

Inputs:

- 2 Covenant Portal Frame Blocks or equivalent component value;
- 1 approved universal precision/metal fitting component;
- 1 approved magical-attunement component.

The socket accepts a valid Covenant Heart or explicitly migrated successor.

## 23.4 Covenant Heart

### SOURCE-LOCKED

Output:

- 1 Covenant Heart

Required:

- 1 Carved Heart Core made from approved Overworld hardwood;
- 4 Botanical Binding units from approved Overworld fibre/vine;
- 2 Mana-Conductive Inserts from approved pre-realm magical material;
- 1 Attunement Vessel from approved glass/crystal/ceramic universal material;
- Verdant Resonance Attunement condition.

Verdant Resonance Attunement is a knowledge/ritual condition, **not an Item**.

## 23.5 Verdant Growth Catalyst

### SOURCE-LOCKED

First activation consumes:

- 1 Verdant Growth Catalyst.

Recipe-role contract:

- 1 universal water/fluid dose;
- 2 approved living botanical ingredients;
- 1 approved fertility/growth reagent;
- 1 small universal mana charge or magical catalyst.

Exact Overworld identities remain OPEN BINDING.

## 23.6 Covenant Unresolved Exact Bindings

### OPEN BINDING

FCC-13 still must select:

- exact Overworld cut-stone provider rule;
- exact hardwood provider rule;
- exact fibre/vine provider rule;
- exact mana-conductive material/provider;
- exact precision fitting provider;
- exact Attunement Vessel material/provider;
- exact Growth Catalyst botanical/fertility/mana inputs;
- process capabilities/stations used for subcomponents;
- recipe IDs.

---

# 24. Veilgate — Source-Locked Binding Matrix

## 24.1 Physical Roles

### SOURCE-LOCKED

Veilgate contains six canonical roles:

1. Frame/Foundation — primarily Memory Stone.
2. Threshold Interface — Memory Glass or approved Memory Glass assembly.
3. Spirit-Conductive Fittings — Soul Silver.
4. Keystone/Core — Echo Pearl-based core/keystone role.
5. Stabilisation Channel — Grave Salt.
6. Recognition/Inscription Layer — bounded record/activation interface.

The final portal must preserve the identity of these realm-local roles unless explicit reconciliation amends them.

## 24.2 Exact Recipe Status

### SOURCE-LOCKED DEFERRAL

FCC-03G explicitly defers:

- exact quantities;
- final crafted subcomponents;
- cross-realm dependency;
- whether Echo Pearl is direct or becomes a crafted core;
- exact Soul Silver component form;
- whether an external realm material is mandatory;
- activation consumables;
- progression tier;
- repair recipe;
- Block-versus-Item recovery behaviour.

## 24.3 First-Access Dependency Problem

### SOURCE FINDING — OPEN BINDING

The six realm-local roles are largely Ancestral-native materials.

The sources do **not** state that all six must be directly consumed as destination-native matter in the player's first Veilgate.

The sources also do not give a guaranteed first-access acquisition path for all six.

Therefore FCC-13 must explicitly decide one of the globally valid patterns rather than assuming one.

Potential canon-consistent patterns include:

### Pattern V-A — Guaranteed Pre-Access Ancestral Components

A deliberately authored Overworld provenance chain guarantees sufficient genuine Ancestral portal material before first personal entry.

This is allowed by FCC-01G, but the guarantee must be deliberate rather than RNG.

### Pattern V-B — First-Access Universal Construction + Ancestral Identity Core

The first Veilgate uses universal/provider construction while preserving one or more authentic Ancestral recognition/core roles obtainable pre-entry.

This requires explicit reconciliation because FCC-03G says the realm-local six-role identity may not be removed casually.

### Pattern V-C — Restored Historical Veilgate

First access centres on restoring/reconstructing an existing historically legitimate Veilgate with surviving transferred components.

This is compatible with FCC-01G archaeological/provenance channels, but would be a major progression design choice.

Step 1D does **not** choose among these.

---

# 25. Veilgate Core Fork

## OPEN BINDING

FCC-03G explicitly asks FCC-13 to decide:

> Does the Echo Pearl enter the Veilgate directly, or is it processed into a crafted keystone/core?

This is a genuine registry/recipe decision.

It affects:

- core Item identity;
- recipe complexity;
- recovery;
- repair;
- migration;
- whether a raw biological material becomes a directly installed portal component.

This question must appear in Step 1E.

---

# 26. Dreamgate — Source-Locked Binding Matrix

## 26.1 Portal Identity

### SOURCE-LOCKED

Dreamgate is the one normal Somnolent portal.

Sleep, waking, Dreamwater, prophecy, personal dream zones and dream routes do not replace it as physical entry/exit.

## 26.2 Component Role Pool

### SOURCE-LOCKED

Compatible Dreamgate ingredient/component roles include:

- Lucid Glass — interface/lens/threshold/calibration;
- Dream Mote — charge/catalyst;
- Coherence Core/coherence technology — stabilisation;
- Waking Stone — physical-law stabilisation;
- Memory Thread — binding/record/stabilisation;
- imported universal mechanical/magical components.

This is explicitly a **role pool**, not a mandatory full ingredient list.

## 26.3 Exact Recipe Status

### SOURCE-LOCKED DEFERRAL

FCC-04G defers:

- frame ingredients;
- quantities;
- crafted subcomponents;
- mandatory earlier-realm material dependency;
- activation item/catalyst;
- progression tier;
- repair cost;
- upgrade path;
- first-access recipe graph.

## 26.4 First-Access Binding Problem

### OPEN BINDING

The source does not say which Somnolent-native roles, if any, are mandatory for the player's first Dreamgate.

Therefore FCC-13 must choose:

- which role(s) are identity-essential;
- which can be provider/universal roles on first access;
- whether any native ingredient is obtained through guaranteed pre-access provenance;
- whether Coherence Core is mandatory;
- what the actual keystone/core identity is, if any.

Step 1D does not invent a Dream Keystone.

---

# 27. Dreamgate Coherence-Core Fork

## OPEN BINDING

Coherence Core is a canonical manufactured Somnolent component, but FCC-04G calls it part of a **compatible role pool** rather than an explicitly mandatory portal keystone.

Therefore FCC-13 must decide whether:

1. Coherence Core is the mandatory Dreamgate core;
2. it is one permitted stabiliser among several;
3. Dreamgate uses another authored core/interface identity;
4. first-access and upgraded Dreamgates use different states of the same core architecture.

No answer is currently source-locked.

---

# 28. Ascension Gate — Source-Locked Binding Matrix

## 28.1 Physical Roles

### SOURCE-LOCKED

The Ascension Gate requires:

1. structural frame/foundation;
2. conductive/stabilising fittings;
3. crafted Ascension Keystone;
4. vertical/aetheric attunement layer;
5. activation interface;
6. validated destination link.

## 28.2 Keystone

### SOURCE-LOCKED

Ascension Keystone:

- is canonical;
- is crafted;
- is an Item/installed component;
- is not a naturally mined complete core;
- remains part of the one Ascension Gate family.

Its first-access recipe is deferred.

## 28.3 First-Access Rule

### SOURCE-LOCKED

First construction cannot mandatorily require Ascendant-only material unless a legitimate alternate source exists globally.

It may use:

- Overworld materials;
- universal magical components;
- earlier-accessible realm materials if final graph chooses them;
- knowledge/discovery.

## 28.4 Open Exact Bindings

### OPEN BINDING

FCC-13 must decide:

- first-access frame material/provider;
- conductive/stabilising fittings;
- exact Ascension Keystone recipe;
- exact attunement mechanism/component;
- activation interface;
- whether any earlier-realm material is mandatory;
- quantities;
- repair recipe;
- base versus upgraded Keystone representation.

---

# 29. Deepgate — Source-Locked Binding Matrix

## 29.1 Physical Roles

### SOURCE-LOCKED

Deepgate may require:

1. structural frame;
2. anchoring/stabilisation layer;
3. Deep Keystone;
4. pressure/depth attunement;
5. activation interface;
6. destination binding.

## 29.2 Keystone

### SOURCE-LOCKED

Deep Keystone is canonical.

Its exact first-access material recipe is deferred.

## 29.3 First-Access Rule

### SOURCE-LOCKED

The first Deepgate must not require inaccessible Impossible Deep-native resources.

Allowed source classes include:

- Overworld materials;
- previously accessible realm materials;
- globally available progression components;
- knowledge/key requirements.

## 29.4 Open Exact Bindings

### OPEN BINDING

FCC-13 must decide:

- frame material/provider;
- anchoring/stabilisation component;
- exact Deep Keystone recipe;
- pressure/depth attunement representation;
- activation interface;
- cross-realm dependencies;
- quantities;
- repair;
- destination calibration component rules.

---

# 30. Ashgate — Source-Locked Binding Matrix

## 30.1 Physical Roles

### SOURCE-LOCKED

Ashgate requires:

1. reinforced structural frame;
2. thermal/heat stabilisation;
3. Ash Keystone;
4. realm/depth attunement;
5. activation interface;
6. validated destination binding.

## 30.2 Keystone

### SOURCE-LOCKED

Ash Keystone:

- is canonical;
- is crafted;
- is part of Ashgate construction.

Exact recipe and ingredient counts are deferred.

## 30.3 First-Access Rule

### SOURCE-LOCKED

The first Ashgate cannot require:

- Infernal Ash;
- Ember Iron;
- Contract Iron;
- Ember Salt;
- Cinderhide;
- Hellglass;
- Furnace Heart;
- or another Ashen-only resource

unless legitimate pre-entry provenance is deliberately authored.

The safe realm-local default is pre-Ashen accessible materials.

## 30.4 Open Exact Bindings

### OPEN BINDING

FCC-13 must decide:

- reinforced frame provider;
- thermal stabilisation system;
- exact Ash Keystone recipe;
- realm/depth attunement representation;
- activation interface;
- cross-realm dependencies;
- quantities;
- repair;
- later native upgrade recipe structure.

---

# 31. Cross-Portal Core/Keystone Asymmetry

## SOURCE FINDING

Current portal core identities are intentionally non-uniform.

| Portal | Core/Keystone State |
|---|---|
| Covenant Portal | **Covenant Heart** — explicit crafted functional keystone |
| Veilgate | **Echo Pearl-based core/keystone role** — direct vs crafted remains open |
| Dreamgate | **No mandatory named keystone locked**; Coherence Core is a compatible role |
| Ascension Gate | **Ascension Keystone** — explicit crafted component |
| Deepgate | **Deep Keystone** — explicit canonical component |
| Ashgate | **Ash Keystone** — explicit canonical component |

FCC-13 must not force all six into one identical `Realm Keystone` Item simply for implementation convenience.

A shared portal runtime/interface is compatible with six distinct physical core contracts.

---

# 32. Cross-Portal Frame Asymmetry

## SOURCE FINDING

The realms also deliberately do not share one universal visual frame.

- Covenant Portal — rooted arch/ring.
- Veilgate — quiet recognised memorial threshold; shape may be arch/paired threshold/stepped/asymmetric.
- Dreamgate — shape open but must remain recognisably Somnolent.
- Ascension Gate — tall upward-oriented structure.
- Deepgate — frame architecture is functionally defined, detailed visual geometry remains downstream.
- Ashgate — reinforced thermally tolerant portal architecture.

Therefore final portal registry architecture should reuse **runtime validation concepts**, not necessarily one generic frame Block texture/model.

---

# 33. Recommended Portal Runtime Separation

## RECOMMENDED DEFAULT — NOT YET LOCKED

Use a shared universal Realm Access runtime with portal-family-specific:

- structure validator;
- frame-family identity;
- keystone/core contract;
- attunement contract;
- activation interface;
- destination rules.

This preserves source diversity while avoiding six unrelated portal codebases.

This is consistent with realm documents that repeatedly defer portal runtime implementation to the universal system.

---

# 34. First-Access Dependency Graph — What Is Already Known

## SOURCE-LOCKED

### Covenant Portal
Must be constructible from pre-realm Overworld capability.

### Ascension Gate
May use Overworld, universal magical or earlier-accessible realm material; cannot self-lock behind Ascendant matter.

### Deepgate
May use Overworld, earlier-accessible realm material or global components; cannot self-lock behind Deep matter.

### Ashgate
Uses pre-Ashen accessible material by safe default; cannot self-lock behind Ashen matter.

### Veilgate
Exact global dependency remains deferred.

### Dreamgate
Exact global dependency remains deferred.

---

# 35. First-Access Dependency Graph — What Is NOT Known

## OPEN BINDING

Current sources do not lock:

- which portal the player normally constructs first;
- whether Verdant must be first;
- whether any portal besides Covenant Portal can be built from Overworld-only material;
- whether Veilgate requires guaranteed pre-access Ancestral material;
- whether Dreamgate requires guaranteed pre-access Somnolent material;
- whether Ascension/Deep/Ash require materials from earlier realms;
- whether all six can theoretically be independently bootstrapped from Overworld capability plus knowledge;
- whether some realms are intentionally interdependent.

FCC-13 must decide this before exact recipes can be written.

---

# 36. Major Progression Fork: Independent Bootstrap Versus Cross-Realm Dependency

## OPEN BINDING — CONSEQUENTIONAL

Two broad canon-consistent models remain possible.

## Model P-A — Mostly Independent Portal Bootstrap

Each realm's first portal can ultimately be built using:

- Overworld-accessible material/provider roles;
- portal-specific knowledge/attunement;
- possibly guaranteed historical realm artefacts where identity requires them.

Advantages:

- strong sandbox freedom;
- fewer circularity risks;
- players can pursue realms in more varied order.

Trade-off:

- cross-realm dependencies are less structurally central to first access.

## Model P-B — Deliberate Cross-Realm Portal Graph

Some first-access portals intentionally require:

- material/component from another already-accessible realm;
- while the full graph remains non-circular.

Advantages:

- realms become mechanically interconnected;
- stronger long-form progression graph.

Trade-off:

- constrains realm order;
- must be rigorously validated;
- imported/pre-access materials must not create RNG progression.

The current sources explicitly permit cross-realm components but do not lock the final graph.

This is a genuine Step 1E design decision.

---

# 37. Portal Native Upgrade Rule

## SOURCE-LOCKED

After access, native materials may improve the **same portal family**.

Examples:

### Covenant Portal
Verdant-native upgrade contract exists.

### Ascension Gate
May later use Cloudstone, Skyiron, Celestial Metal, Stormglass, Lightning Core technology, Sunmist, Hymnstone.

### Deepgate
May later use Pressure Stone, Abyssal Iron, Seismic Crystal, Pressure Pearl, Ventglass, Gravity Nodule technology, Deepfire Ember.

### Ashgate
May later use Hellglass, Cooling Crystal, Contract Iron, Infernal Alloy, Furnace Heart technology and advanced heat shielding.

These upgrades must not become additional normal portal families.

---

# 38. Portal Upgrade Representation

## OPEN BINDING

FCC-13 must decide the standard representation for portal upgrades.

Possible patterns:

- upgrade state on base components;
- replaceable upgraded components;
- added support modules;
- rebuilt frame pieces within same portal identity;
- mixed approach.

The sources allow stateful/replaced Keystone approaches in Ascendant and similar upgrade semantics elsewhere.

A global consistency policy would improve save/migration behaviour, but uniform physical components are not required.

---

# 39. Portal Repair and Recovery

## SOURCE-LOCKED REQUIREMENT / OPEN EXACT BINDING

Realm documents explicitly defer exact repair/recovery details.

Final FCC-13 recipes must decide:

- what breaks first;
- whether frame pieces drop intact;
- whether keystones survive;
- whether attunement is lost;
- whether a damaged portal is structure state;
- what repair consumes;
- whether provenance/state persists.

Legacy `Broken Portal Block` must not become a generic universal portal material.

---

# 40. Portal Activation Consumables

## SOURCE FINDING

Covenant Portal explicitly has first activation consume one Verdant Growth Catalyst.

Other portals do not currently have equally specific source-locked activation consumables.

Therefore FCC-13 must **not** assume every portal consumes a one-use catalyst simply for symmetry.

Whether other portal activations consume material is OPEN BINDING.

---

# 41. Portal Knowledge Is Not a Material

## SOURCE-LOCKED

Portal discovery/attunement concepts may be:

- knowledge;
- inscription;
- recognition;
- ritual condition;
- calibration data;
- mapped destination data.

They must not automatically become generic inventory currencies such as:

- Realm Essence;
- Portal Energy Crystal;
- Boss Essence;
- Dimension Ore.

FCC-12 explicitly rejected that filler pattern.

---

# 42. Portal Destination Data

## SOURCE-LOCKED PRINCIPLE

Later destination targeting can require:

- mapping;
- validation;
- route attunement;
- calibration;
- knowledge.

Examples:

- deeper Ashgate destinations;
- safer Deepgate destinations;
- Ascendant destination upgrades.

These remain functions/upgrades of the same portal family.

---

# 43. Portal Provider Substitution

## SOURCE-LOCKED

Provider substitution can operate only where the recipe slot is deliberately provider-based.

It must not allow:

- arbitrary magical crystal in an exact keystone slot;
- generic structural material to replace a unique material if identity is canonical;
- substitution solely because another material is “higher tier”.

The exact provider schema remains OPEN BINDING.

---

# 44. Portal Recipe Validation Checklist

Every final first-access portal recipe must pass all of the following.

## SOURCE-LOCKED OR DIRECTLY IMPLIED BY LOCKED RULES

- [ ] belongs to exactly one canonical portal family;
- [ ] has no circular inaccessible material dependency;
- [ ] any pre-access destination-realm material has guaranteed legitimate provenance;
- [ ] any provider slot resolves through explicit compatibility;
- [ ] exact-material slots are genuinely identity-sensitive;
- [ ] knowledge/ritual conditions are not turned into filler inventory Items;
- [ ] construction obeys conservation;
- [ ] output is physically represented correctly;
- [ ] repair/recovery is defined;
- [ ] portal runtime does not create alternate normal Realm Access;
- [ ] upgrades remain within same family;
- [ ] destination rules preserve realm progression;
- [ ] migration from legacy portal content is explicit.

FCC-14 will later perform the project-wide certification.

---

# 45. Universal Recipe Domains Requiring Exact FCC-13 Binding

Step 1C and realm G documents expose the following major exact-binding domains.

## 45.1 Timber

Need global rules for:

- log → plank;
- plank → construction forms;
- beams/posts;
- specialist timber preservation;
- living wood exclusions.

## 45.2 Stone / Masonry

Need global rules for:

- natural stone → cut stone;
- cut stone → brick/masonry;
- slabs/stairs/walls/pillars;
- source-stone preservation.

## 45.3 Clay / Ceramic

Need distinction between:

- raw clay/feedstock;
- shaping;
- drying where relevant;
- fired ceramic transformation/product;
- brick/tile forms.

## 45.4 Metallurgy

Need global rules for:

- ore/feedstock;
- concentrate;
- bloom/billet/ingot;
- plate/rod/wire;
- alloying;
- remelting;
- scrap;
- specialist transformed metals.

## 45.5 Glass / Crystal

Need rules for:

- raw/source;
- refinement where applicable;
- pane;
- lens;
- shard;
- specialist glass transformation;
- charge/calibration state.

## 45.6 Fibre / Textile

Need rules for:

- raw botanical fibre;
- cleaning;
- spinning;
- thread/yarn;
- cord/rope;
- cloth;
- specialist transformed thread.

## 45.7 Fluids / Gases

Need:

- container compatibility;
- filled container representation;
- pipe/tank representation;
- pressure;
- hazard;
- transfer.

## 45.8 Biological Processing

Need:

- harvest versus living object;
- food product;
- hide/chitin/bone;
- preservation;
- provenance.

## 45.9 Machines / Components

Need:

- component recipes;
- actual selected material retention;
- provider requirements;
- salvage;
- installed component recovery.

## 45.10 Portal Construction

Needs six complete first-access and upgrade recipe families.

---

# 46. Realm Recipe Catalogue Status

## Verdant Covenant

### SOURCE-LOCKED
FCC-02G already enumerates a realm-local recipe registry VRD-R01 through VRD-R45.

The table locks:

- recipe/product families;
- output identity;
- realm-local transformations;
- Covenant Portal contracts.

The table is explicitly **not** the final executable global recipe database.

## Ancestral Veil

### SOURCE-LOCKED
FCC-03G locks recipe families and semantic transformations.

Final concrete recipe records are FCC-13-owned.

## Somnolent Expanse

### SOURCE-LOCKED
FCC-04G locks block/item eligibility, realm-local transformation families and Dreamgate role pool.

Exact global recipes remain FCC-13-owned.

## Ascendant Reach

### SOURCE-LOCKED
FCC-05G locks material/output families, Ascension Gate roles and specialist station/capability boundaries.

Exact recipe IDs/quantities remain globally deferred.

## Impossible Deep

### SOURCE-LOCKED
FCC-06G locks recipe domains, capability roles, component categories and Deepgate structure.

Many exact formulas are intentionally deferred.

## Ashen Lower Realms

### SOURCE-LOCKED
FCC-08G locks processing foundations, recipe-role compatibility, Ashgate structure and specialist capability domains.

Exact recipe counts/quantities remain downstream.

---

# 47. Station Duplication Risk Register

The old POC and realm sources contain many named stations.

FCC-13 must test each against the capability model.

Examples include:

- furnace;
- forge/anvil;
- crusher;
- grinder;
- loom;
- saw;
- alchemy/chemical station;
- specialist stabilisation apparatus;
- High-Aether station;
- pressure-safe station;
- contract-binding station;
- Furnace-Crown infrastructure.

## RECOMMENDED DEFAULT — NOT YET LOCKED

For every named station ask:

1. Does it perform a genuinely distinct process?
2. Does it merely bundle existing capabilities?
3. Does realm environment provide the specialist condition naturally?
4. Can another capable station perform the same recipe?
5. Is the named station culturally/visually meaningful without being an exclusive gate?

This should become part of Step 1E.

---

# 48. Exact Station Requirement Rule

## SOURCE-LOCKED

An exact named station should be mandatory only when station identity is genuinely part of the mechanic.

Examples could include:

- unique contract-authorised infrastructure;
- living process requiring an actual preserved-living apparatus;
- a historically unique structure-owned process.

A named station must not become an arbitrary recipe gate merely because it existed in the POC.

---

# 49. Recipe Provenance

## SOURCE-LOCKED

Some recipes may preserve or require provenance.

Examples:

- Contract Iron processing;
- archaeological alloy reconstruction;
- relic repair;
- realm-contact portal material;
- authority-specific ritual product.

Ordinary recipes should not be cluttered with provenance when source history is irrelevant.

---

# 50. Exact Material Versus Provider Matrix

The following is the current source-derived default classification.

| Recipe Situation | Input Mode |
|---|---|
| ordinary structural frame | provider |
| ordinary hardwood requirement | provider |
| ordinary fibre binding | provider |
| generic conductive fitting | provider |
| generic optical pane | provider |
| unique transformed metal | exact material |
| named portal keystone/core | exact component |
| Covenant Heart | exact component |
| Contract Iron binding input/output | exact material relationship |
| Living Heartwood specialist process | exact material |
| Soul Silver Veilgate fitting role | exact realm-local material role unless explicitly reconciled |
| Memory Glass Veilgate interface role | exact realm-local material role unless explicitly reconciled |
| arbitrary “magic crystal” for portal core | prohibited unless recipe explicitly defines provider role |
| knowledge/attunement | condition, not Item |
| historical provenance requirement | provenance condition |

This matrix should guide Step 1E, not replace it.

---

# 51. Recipe Output Identity Rule

## SOURCE-LOCKED

Recipe outputs must distinguish:

- same material, new form;
- same material, new state;
- genuinely transformed material;
- component;
- composite object;
- structure/project state.

Examples:

### Same material + form
Iron → Iron Wire.

### State
Bloomstone → tuned/season-attuned Bloomstone.

### New material
Ember Iron → Contract Iron.

### Component
materials → Ascension Keystone.

### Structure state
portal parts assembled → valid portal structure.

FCC-13 recipes must encode the correct category.

---

# 52. Project Recipes

## SOURCE-LOCKED

Large structures may use staged/project recipes instead of one-click crafting.

This is explicitly allowed in Verdant and is consistent with broader structure systems.

Examples may include:

- living construction;
- portal assembly;
- large machine/structure commissioning.

FCC-13 must not assume every output is produced directly into inventory.

---

# 53. Recipe IDs Versus Product IDs

## OPEN BINDING

FCC-13 must choose stable identity rules for:

- recipe IDs;
- generated conversion recipe IDs;
- portal recipe IDs;
- upgrade recipe IDs;
- repair recipe IDs.

Recipe IDs must remain stable enough for:

- learned recipe saves;
- migration;
- automation references;
- modding;
- Forge authoring.

---

# 54. Repair Recipe Architecture

## OPEN BINDING

Realm documents repeatedly defer repair costs.

FCC-13 must decide whether repair is represented as:

- explicit recipe;
- object interaction consuming providers;
- staged project;
- station operation;
- combination depending on object.

Semantic conservation and exact/provider rules still apply.

---

# 55. Recipe Discovery Architecture

## OPEN BINDING

Sources support knowledge/discovery gates but do not force one global acquisition mechanism.

Potential owners include:

- research;
- archaeology;
- NPC instruction;
- experimentation;
- quest/authority outcome;
- books/records;
- Forge/dev authoring.

FCC-13 should bind recipe knowledge requirements without deciding the entire progression UI unless required.

---

# 56. Major Step 1E Decision Register

Step 1D identifies the following **genuine unresolved binding decisions**.

## Registry / Recipe Architecture

D01. Stable recipe-ID syntax/namespace.  
D02. Generated-form recipe identity strategy.  
D03. Global ordinary conversion yields.  
D04. Representation of filled containers.  
D05. Representation of installed removable components.  
D06. Repair recipe architecture.  
D07. Recipe knowledge reference architecture.  
D08. Provider-tag/property schema.  
D09. Provider threshold representation.  
D10. Exact station requirement test.  
D11. Named-station capability bundle representation.  
D12. Recipe provenance schema.  
D13. Permission/legal requirement schema.  
D14. By-product/waste representation granularity.  
D15. Project/staged recipe representation.

## Portal Global Progression

D16. Global first-access realm dependency model.  
D17. Whether most/all portals can bootstrap independently from Overworld capability.  
D18. Whether deliberate cross-realm first-access dependencies are required.  
D19. How guaranteed pre-access foreign portal material is authored.  
D20. Portal upgrade representation standard.  
D21. Portal repair/recovery standard.  
D22. Whether activation consumables are portal-specific rather than universal.

## Covenant Portal

D23. Exact cut-stone provider binding.  
D24. Exact hardwood provider binding.  
D25. Exact botanical binding provider.  
D26. Exact mana-conductive insert material/provider.  
D27. Exact precision fitting provider.  
D28. Exact Attunement Vessel provider.  
D29. Exact Verdant Growth Catalyst inputs.  
D30. Exact stations/capabilities for Covenant subcomponents.

## Veilgate

D31. First-access provenance/dependency model.  
D32. Direct Echo Pearl versus crafted Veilgate core.  
D33. Exact Memory Stone quantities/forms.  
D34. Exact Memory Glass quantities/forms.  
D35. Exact Soul Silver fitting form/quantity.  
D36. Exact Grave Salt stabilisation quantity/representation.  
D37. Recognition/inscription representation.  
D38. External realm/universal dependency, if any.  
D39. Activation consumable, if any.

## Dreamgate

D40. Mandatory first-access subset of component-role pool.  
D41. First-access provenance/dependency model.  
D42. Whether Coherence Core is mandatory portal core.  
D43. Exact frame material/provider.  
D44. Exact Lucid Glass role.  
D45. Exact Dream Mote role.  
D46. Exact Waking Stone role.  
D47. Exact Memory Thread role.  
D48. Activation consumable/catalyst, if any.

## Ascension Gate

D49. Exact first-access frame/provider.  
D50. Exact fitting provider.  
D51. Ascension Keystone recipe.  
D52. Vertical/aetheric attunement representation.  
D53. Activation interface.  
D54. Mandatory earlier-realm dependency, if any.  
D55. First-access quantities.  
D56. Keystone upgrade representation.

## Deepgate

D57. Exact first-access frame/provider.  
D58. Anchoring/stabilisation representation.  
D59. Deep Keystone recipe.  
D60. Pressure/depth attunement representation.  
D61. Activation interface.  
D62. Mandatory earlier-realm dependency, if any.  
D63. First-access quantities.  
D64. Destination calibration representation.

## Ashgate

D65. Reinforced frame provider.  
D66. Thermal stabilisation representation.  
D67. Ash Keystone recipe.  
D68. Realm/depth attunement representation.  
D69. Activation interface.  
D70. Mandatory earlier-realm dependency, if any.  
D71. First-access quantities.  
D72. Native upgrade binding.

## Legacy / Migration

D73. Learned-recipe migration policy.  
D74. Unsupported legacy recipe handling.  
D75. POC named-station migration.  
D76. Generic portal recipe migration.  
D77. Duplicate Block/Item recipe migration.  
D78. Old generic material recipe migration.

These 78 binding decisions are sufficient to structure the next interview architecture without re-asking FCC-12 ontology questions.

---

# 57. Decisions That Must NOT Be Re-Asked in Step 1E

The following are already locked upstream:

- whether material identity is separate from form;
- whether provenance is separate from identity;
- whether provider substitution exists;
- whether exact-material slots exist;
- whether processing is capability-driven;
- whether wrong-realm processing lockout is rejected;
- whether stronger compatible capability may satisfy an earlier requirement;
- whether Deepstone is an active material;
- whether Plant Fibre is one universal exact material;
- whether regular forms can be inherited/generated;
- whether the six portal families exist;
- whether a seventh generic normal portal exists;
- whether first-access circular dependencies are permitted;
- whether random foreign loot can be a mandatory first-access solution;
- whether knowledge/attunement must become a mined essence Item.

Step 1E must bind implementation, not reopen these questions.

---

# 58. Step 1D Completeness Gate

- [x] universal recipe record requirements extracted;
- [x] exact/provider/state/provenance input modes extracted;
- [x] provider role demand extracted;
- [x] capability-driven station doctrine preserved;
- [x] conservation preserved;
- [x] generated-form recipe rule preserved;
- [x] global quantity-normalisation need extracted;
- [x] source-locked Covenant quantities preserved;
- [x] hazardous containment recipe boundary extracted;
- [x] installed-component recovery requirement extracted;
- [x] six portal-family physical contracts compared;
- [x] first-access provenance rule integrated from FCC-01G;
- [x] random pre-access loot rejected as mandatory dependency;
- [x] portal sequence-breaking rule preserved;
- [x] no false global realm order invented;
- [x] Covenant exact bindings separated from still-open provider choices;
- [x] Veilgate first-access dependency fork exposed;
- [x] Dreamgate mandatory-role/core fork exposed;
- [x] Ascension Keystone open recipe exposed;
- [x] Deep Keystone open recipe exposed;
- [x] Ash Keystone open recipe exposed;
- [x] portal upgrade asymmetry preserved;
- [x] activation-consumable asymmetry preserved;
- [x] station duplication risks exposed;
- [x] repair/migration questions exposed;
- [x] 78 remaining FCC-13 binding decisions identified;
- [x] FCC-12 ontology questions excluded from re-interview.

---

# 59. Step 1D Result

> **FCC-13 STEP 1D — RECIPE, PROVIDER, PORTAL DEPENDENCY & EXACT-BINDING MATRIX — COMPLETE v0.1**

The source corpus is now sufficiently reconciled to build the final FCC-13 interview architecture.

The most consequential unresolved questions are no longer hidden:

1. whether first-access portals are mostly independently bootstrappable or deliberately cross-realm dependent;
2. how Veilgate avoids circular dependence while preserving its strongly Ancestral material identity;
3. which Dreamgate component roles are actually mandatory;
4. exact recipes for Ascension Keystone, Deep Keystone and Ash Keystone;
5. exact Covenant provider bindings while preserving its already-locked quantitative contract;
6. global recipe/provider/station schema;
7. exact repair, recovery and migration rules.

The next document is:

> **FCC-13 Step 1E — Interview Architecture, Decision Map & Completeness Gate**

Step 1E should convert D01–D78 into a complete structured question set, grouped so the registry architecture is decided before the six portal recipes are finalised.

No final portal recipe should be written before those binding questions are answered.

---

**End of FCC-13 Step 1D v0.1**
