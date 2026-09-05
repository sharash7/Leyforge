# Leyforge Final Content Canon Collection

## FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding
### Complete Autonomous Binding Interview Decision Register — Q1–Q268

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** **FULL AUTONOMOUS INTERVIEW PASS COMPLETE — PROJECT-LEAD APPROVAL GATE**  
**Authority Consumed:** Locked FCC-12; FCC-13 Steps 1A–1E; locked FCC-01/02/03/04/05/06/08 source constraints.  
**Rule:** Routine binding decisions are resolved autonomously. Consequential game-shaping forks are explicitly identified and resolved by recommendation, pending project-lead acceptance.

---

# 1. Executive Result

All **268 FCC-13 interview questions** now have a recommended binding decision.

The autonomous pass closes:

- stable content identity architecture;
- namespacing;
- runtime numeric ID policy;
- Block/Object/Item projection;
- the old duplicate-Block/Item problem;
- generated standard forms;
- recipe schema;
- provider schema;
- capability-driven station binding;
- quantity/conservation architecture;
- repair/project architecture;
- the six-portal dependency graph;
- exact first-access portal component architecture;
- portal repair/recovery;
- legacy ID/recipe migration;
- final FCC-14 handoff conditions.

Four consequential forks were resolved by recommendation:

1. **Generated forms:** HYBRID deterministic-generated standard forms + explicit specialist forms.
2. **Portal progression:** HYBRID realm dependency graph.
3. **Veilgate first access:** restore a guaranteed historical Overworld Veilgate Remnant.
4. **Dreamgate core:** Coherence Core is the mandatory Dreamgate core; first access uses a guaranteed dormant core from an Overworld Dream-Leak site.

These choices preserve sandbox freedom in the early game while making later Realm Access increasingly interconnected.

---

# 2. Consequential Portal Graph Recommendation

The recommended first-access graph is:

> **Overworld**
>
> → Covenant Portal / Verdant Covenant  
> → Veilgate / Ancestral Veil  
> → Dreamgate / Somnolent Expanse  
>
> **Ascension Gate** requires at least **one** authentic stabilisation/attunement component from Verdant, Ancestral or Somnolent.
>
> **Deepgate** requires stabilisation signatures from **two distinct previously accessed realms** chosen from Verdant, Ancestral, Somnolent and Ascendant.
>
> **Ashgate** requires one exact Impossible Deep-origin extreme-environment component, making Impossible Deep a prerequisite for first Ashen access.

This is a **hybrid** model:

- the first three realm families remain broadly player-order-flexible;
- Ascendant introduces cross-realm integration;
- Impossible Deep requires broader preparation;
- Ashen becomes a deliberately late extreme-realm access problem.

No portal dependency is random or circular.

---

# 3. Stable ID Syntax Recommendation

Canonical human-readable stable IDs use:

> `<namespace>:<domain>/<path>`

Examples:

- `leyforge:material/iron`
- `leyforge:material/contract_iron`
- `leyforge:form/ingot`
- `leyforge:object/portal/covenant/heart`
- `leyforge:object/portal/ascension/keystone`
- `leyforge:recipe/metallurgy/iron_ingot`
- `leyforge:recipe/portal/covenant/frame`
- `leyforge:blueprint/portal/deepgate`

Runtime systems may assign compact numeric handles, but the semantic stable ID remains authoritative for persistence and migration.

Generated standard forms use a **deterministic composite key**:

> `(material_id, form_id)`

rather than requiring a permanently hand-authored unrelated row.

Where a single text key is required internally, it is derived deterministically from that pair and is not independently authored.

---

# R01 — Registry Identity, Namespace & Stability
## Q1–Q20

### Q1 — Canonical Stable-ID Layers
**Decision:** LOCK distinct logical identity layers for material, form, content object, recipe, blueprint/structure reference and migration alias.

A single technical database may index several layers, but they do not become one semantic identity type.

### Q2 — Namespace Architecture
**Decision:** HYBRID namespaced architecture.

Use one stable string syntax with explicit domain paths:

`<namespace>:<domain>/<path>`

This provides one lookup convention without erasing domain ownership.

### Q3 — Human Readability
**Decision:** Human-readable semantic stable string + compact runtime numeric handle.

Opaque UUIDs are not the primary author-facing identity.

### Q4 — Durable Save Identity
**Decision:** Stable semantic IDs are authoritative in saves.

Runtime numeric handles may be cached for performance but cannot be the sole durable reference.

### Q5 — Numeric ID Role
**Decision:** Numeric IDs are runtime/build-local compact handles.

They may be persisted as cache hints only when accompanied by stable semantic identity/version mapping.

### Q6 — Numeric Reordering Protection
**Decision:** Runtime handle tables are regenerated from canonical IDs; saves resolve through stable IDs/legacy maps.

Removed/reordered numeric positions never silently reinterpret content.

### Q7 — Display Name Independence
**Decision:** LOCK.

Display/localised/cultural names never become durable content identity.

### Q8 — Multiple Migration Aliases
**Decision:** YES.

A canonical target may own zero-to-many legacy redirects.

### Q9 — Alias Classes
**Decision:** Distinguish:
- migration alias;
- deprecated canonical rename;
- cultural/local display alias;
- compatibility alias.

Only migration/deprecated compatibility aliases participate in durable ID redirect resolution.

### Q10 — Stable ID Rename Policy
**Decision:** Stable IDs change only through explicit migration.

The old stable ID becomes a permanent redirect and may never be reassigned.

### Q11 — Domain Ownership
**Decision:** YES.

Domain appears after the namespace, e.g. `material/`, `form/`, `object/`, `recipe/`, `blueprint/`, `knowledge/`.

### Q12 — Realm Prefix Use
**Decision:** Realm qualification appears only when identity is genuinely realm-specific.

Do not create `ashen/iron` for ordinary Iron.

### Q13 — Generated Form Determinism
**Decision:** YES.

Generated standard-form identity is deterministically derived from canonical material ID + canonical form ID.

### Q14 — Multi-Material Archetypes
**Decision:** Object archetype ID remains material-neutral.

Actual selected materials are stored in named composition/material slots on the instance or authored variant.

### Q15 — Player-Created Variants
**Decision:** Dynamic variants are archetype + material-slot map + state.

They do not gain a new canonical registry ID unless deliberately published/authored through Forge/mod content.

### Q16 — Mod Namespace
**Decision:** Every mod/plugin content source requires an independent namespace.

Core `leyforge` IDs cannot be shadowed.

### Q17 — Forge IDs
**Decision:** Forge content receives a project/mod namespace and an immutable authoring ID at creation.

Display-name changes do not rename the stable ID automatically.

### Q18 — Reserved Namespaces
**Decision:** Reserve at least:
- `leyforge` — canonical core content;
- `leyforge_compat` — compatibility-only migration content;
- `leyforge_test` — test fixtures excluded from normal canon/worldgen.

Third-party namespaces cannot use these.

### Q19 — Deleted ID Reuse
**Decision:** NEVER.

A previously shipped canonical ID can never identify unrelated future content.

### Q20 — R01 Certification
**Decision:** PASS.

The architecture supports save stability, networking, Forge, modding, migration and generated forms.

---

# R02 — Block/Object/Item/Inventory Projection
## Q21–Q44

### Q21 — One Physical Object, Multiple Projections
**Decision:** YES.

One canonical physical object may expose world/placeable and inventory projections.

### Q22 — Meaning of Block
**Decision:** `Block` is primarily a world/voxel placement representation or implementation subtype, not automatically the semantic object identity.

### Q23 — Meaning of Item
**Decision:** `Item` is primarily the portable/inventory projection where physical identity is unchanged.

True non-placeable portable objects may still have their own object identity.

### Q24 — Single-Definition Implementation
**Decision:** Use one canonical `content_object_id` with projection adapters/state for world and inventory contexts.

Separate physical identities require an actual lifecycle/form transformation.

### Q25 — Oak Log
**Decision:** MERGE legacy Block 9 / Item 142 into one Oak-log physical content family with world and inventory projections.

The final underlying timber must bind to current Oak Heartwood/timber semantics rather than obsolete generic Oak material assumptions.

### Q26 — Stone Brick
**Decision:** MERGE.

One material-aware masonry-brick form/object; source stone remains known.

### Q27 — Cobblestone
**Decision:** MERGE.

One source-stone-aware cobble form/object.

### Q28 — Oak Beam
**Decision:** MERGE.

One timber-aware beam object with world/inventory projection.

### Q29 — Clay Roof Tile
**Decision:** MERGE.

One fired-ceramic roof-tile physical product with world/inventory projection.

### Q30 — Oak Plank(s)
**Decision:** MERGE singular/plural legacy rows into one plank form/object family.

### Q31 — Clay Brick
**Decision:** MERGE Clay Brick Block / Clay Brick as projections of one fired-ceramic brick product.

### Q32 — Cave Mushroom
**Decision:** SPLIT lifecycle identities.

- living Cave Mushroom = biological/world organism object;
- harvested Cave Mushroom = portable biological/food product.

They remain related to the same biological species/provenance.

### Q33 — Living Plant vs Harvested Product
**Decision:** General rule:

- species/organism identity;
- living world instance;
- propagation/seed object where applicable;
- harvested product/material;
- processed products.

Do not force all stages into one object ID.

### Q34 — Fluid World vs Stored Fluid
**Decision:** Same material identity.

World fluid, pipe/tank content and container content store:
- material ID;
- quantity;
- relevant state.

Container is a separate object.

### Q35 — Gas World vs Stored Gas
**Decision:** Same substance identity.

Stored gas additionally tracks amount plus pressure/temperature where simulation requires.

### Q36 — Installed Components
**Decision:** Removable installed components remain the same physical object instance.

Irreversibly assembled/consumed components become preserved composition/material records.

### Q37 — Machine Multiblocks
**Decision:** Use one functional assembly/root object with a multiblock footprint/component graph.

Occupied cells reference the assembly rather than becoming independent machine identities.

### Q38 — Structure vs Item
**Decision:** Structures are blueprint/project/structure instances.

They are not inventory Items by default.

A packaged kit may exist only when deliberately authored.

### Q39 — Furniture
**Decision:** One physical object with inventory and placed projections.

### Q40 — Natural Boulder / Source
**Decision:** Natural source node/object remains distinct from harvested chunks/forms.

The source's actual stone/material remains known.

### Q41 — Damage
**Decision:** Damage is state by default.

Terminal destruction may transform the object into real salvage/scrap products.

### Q42 — Portal Structure States
**Decision:** Valid, inactive, damaged and ruined instances remain states of the same portal-family structure unless a physically detached component exists.

### Q43 — Unsupported Legacy Object
**Decision:** Migration priority:

1. canonical redirect;
2. contextual conversion;
3. physically defensible salvage;
4. inert `leyforge_compat` compatibility object/quarantine record if deletion would lose owned content;
5. removal only with explicit migration accounting.

Never map to unrelated content merely to suppress an error.

### Q44 — R02 Certification
**Decision:** PASS.

Target architecture removes automatic Block/Item duplication.

---

# R03 — Material/Form Binding & Generated Forms
## Q45–Q64

### Q45 — Standard Form Families
**Decision:** LOCK the FCC-12 standard families:

- raw source;
- chunk/lump;
- rubble/aggregate;
- powder/dust;
- granule;
- shard;
- block/masonry;
- slab;
- stair;
- wall;
- pillar;
- tile/shingle;
- plank/board;
- beam/post/pole;
- rod/bar;
- sheet/plate/foil;
- wire;
- billet/bloom/ingot;
- fastener/blank;
- cord/rope/thread/yarn/cloth/felt/lattice;
- pane/lens/inlay/cut-gem.

### Q46 — Material Eligibility Storage
**Decision:** Material definitions reference reusable form profiles inherited from material classes, with per-material allow/deny/override rules.

### Q47 — Generated Forms
**Decision:** **HYBRID — consequential fork resolved.**

- regular standard forms = deterministic generated/virtual bindings;
- specialist authored forms = explicit registry objects;
- runtime may materialise/cache generated rows for performance.

### Q48 — Generated Form Stable Identity
**Decision:** Authoritative identity is the pair:

`(material_id, form_id)`

A deterministic textual/runtime key may be derived when required.

### Q49 — Form Recipe Generation
**Decision:** YES.

Ordinary form conversions derive from shared conversion profiles unless an explicit specialist recipe overrides them.

### Q50 — Art Inheritance
**Decision:** Generated form rendering combines:
- form geometry/template;
- material appearance definition;
- material shader/physical metadata;
- optional form/material override.

### Q51 — Geometry/Collision
**Decision:** Standard form owns default geometry/collision.

Material may alter physical parameters but not silently replace geometry unless an override is authored.

### Q52 — Specialist Override
**Decision:** A material/form pair may bind an authored specialist object that supersedes the standard template for that pair.

### Q53 — Forbidden Forms
**Decision:** Eligibility resolver rejects combinations not permitted by the material's form profile/physical rules.

### Q54 — Timber Profiles
**Decision:** Compatible timbers share default timber form profiles with per-material overrides.

Living Heartwood and unusual timbers may restrict ordinary processing.

### Q55 — Stone Profiles
**Decision:** Stones share standard masonry/cutting forms subject to structural/workability eligibility.

### Q56 — Metal Profiles
**Decision:** Metals/alloys share forming profiles subject to ductility, melting/forming and specialist-processing constraints.

### Q57 — Glass/Crystal Profiles
**Decision:** Glass/crystal profiles support panes, lenses, shards, plates/inlays where physically appropriate.

### Q58 — Fibre/Textile Profiles
**Decision:** Fibre profiles support cleaned fibre, thread/yarn, cord/rope, cloth/felt/lattice according to material eligibility.

### Q59 — Ceramic Boundary
**Decision:** Raw clay is feedstock; firing can produce a ceramic material/product lineage.

Brick/tile/etc. are forms of the relevant fired ceramic formulation, not forms of raw wet clay.

### Q60 — Filled Container
**Decision:** Composite object, not ordinary material form.

Identity = container archetype + contained material + quantity/state.

### Q61 — Multi-Material Composition
**Decision:** Instances retain named material/component slots.

Do not flatten substitute materials into a hidden default.

### Q62 — Visible Material
**Decision:** YES.

Rendering/Forge always has access to actual visible selected material.

### Q63 — Legacy Form Migration
**Decision:** Old explicit standard-form IDs redirect to their deterministic material+form pair where identity can be recovered.

### Q64 — R03 Certification
**Decision:** PASS.

Standard forms scale without material-ontology explosion.

---

# R04 — Recipe Record Architecture & Provider Semantics
## Q65–Q92

### Q65 — Recipe IDs
**Decision:** Stable semantic IDs:

`<namespace>:recipe/<process-domain>/<path>`

Example:
`leyforge:recipe/metallurgy/iron_ingot`

### Q66 — Recipe Namespace
**Decision:** Include process/domain and semantic output/action path.

Do not encode quantities or balance version into the stable ID.

### Q67 — Exact Material Input
**Decision:** Recipe slot references exact `material_id` plus quantity and optional form/state constraints.

### Q68 — Exact Component Input
**Decision:** Recipe slot references exact `content_object_id`.

### Q69 — Provider Input
**Decision:** Provider-expression object referencing one or more stable provider/property predicates.

### Q70 — Required Form
**Decision:** Separate `form_id` predicate.

### Q71 — State
**Decision:** Typed state predicate independent from material ID.

### Q72 — Quality / Grade / Purity
**Decision:** Typed threshold predicates.

No universal rarity-tier number substitutes for them.

### Q73 — Provenance
**Decision:** Provenance predicate against instance/lot metadata.

No duplicate material ID is created.

### Q74 — Knowledge
**Decision:** Recipe references external stable `knowledge_id`/unlock condition.

Knowledge is not an Item ingredient.

### Q75 — Permission / Contract / Law
**Decision:** External condition predicate.

May prevent execution without changing physical material eligibility.

### Q76 — Environment
**Decision:** Recipe declares required environmental capability predicates:
pressure, heat, coherence, High-Aether, sacred law, atmosphere, etc.

### Q77 — Process Capability
**Decision:** Recipe requires stable process capability IDs/levels rather than an arbitrary station ID.

### Q78 — Exact Station Exception
**Decision:** Exact station may be mandatory only where:
- station identity is intrinsic to the mechanic;
- unique authority/legal context matters;
- unique physical apparatus cannot be represented as ordinary capability;
- locked source explicitly requires it.

### Q79 — Station Bundles
**Decision:** Stations expose:
- capabilities/levels;
- supported environment;
- safety;
- efficiency;
- automation interface;
- cultural/visual identity.

### Q80 — Alternative Stations
**Decision:** Resolver finds any station/environment combination satisfying all required capabilities.

### Q81 — Operator Knowledge
**Decision:** Actor/operator knowledge is a separate execution predicate.

### Q82 — Automation
**Decision:** Automation uses the same recipe validator as manual execution.

No hidden simplified automation recipe rules.

### Q83 — Output Type
**Decision:** Each recipe declares one of:
- same material/new form;
- same material/new state;
- transformed material;
- component/object;
- composite object;
- project/structure operation.

### Q84 — By-Products
**Decision:** Explicit when materially/gameplay significant.

### Q85 — Waste/Loss
**Decision:** Explicit when meaningful.

Do not simulate trivial dust merely for bookkeeping.

### Q86 — Scrap/Offcut
**Decision:** Recoverable scraps are real outputs when they have practical reuse.

### Q87 — Recycling
**Decision:** Recovery/recycling uses independent recipe/process entries linked semantically to source products.

### Q88 — Provenance Carry
**Decision:** Recipe declares provenance transform policy:
- preserve;
- combine;
- summarise;
- create processing provenance;
- intentionally destroy irrelevant chain details.

Rule-relevant provenance persists.

### Q89 — Quality Carry
**Decision:** Output quality is a declared function of input quality, process capability and operator/station factors.

### Q90 — Provider Performance
**Decision:** YES.

Different valid providers may alter actual performance/material composition without changing archetype identity.

### Q91 — UI Validation
**Decision:** Recipe resolver returns structured failure/success reasons such as:
- wrong exact material;
- insufficient strength;
- wrong form;
- insufficient purity;
- missing environment;
- missing knowledge;
- illegal use.

### Q92 — R04 Certification
**Decision:** PASS.

FCC-12 exact/provider/capability semantics are preserved.

---

# R05 — Quantities, Conservation, Repair & Projects
## Q93–Q112

### Q93 — Timber Yield
**Decision:** Standard sawing profile:

- 1 standard Log stock object → 4 standard Plank objects.

Hand splitting may use a less-efficient alternate process:

- 1 Log → 3 Planks + recoverable Wood Offcuts equal to the remaining material amount.

Specialist timber may override only with explicit evidence.

### Q94 — Stone Cutting
**Decision:** 1 standard stone block/source stock → 1 cut-stone block-equivalent material amount.

Ordinary shaping is not allowed to multiply stone.

### Q95 — Slab/Stair/Wall Yield
**Decision:** Geometry-conserving default:

- 1 full block-equivalent → 2 slabs;
- 3 full block-equivalents → 4 stairs;
- 1 full block-equivalent → 2 standard wall segments;
- pillar uses 1 full block-equivalent per full-volume pillar segment unless specialist geometry says otherwise.

### Q96 — Metal Forming
**Decision:** Standard one-ingot material profile:

- 1 ingot → 1 plate;
- 1 ingot → 2 rods;
- 1 ingot → 8 standard wire lengths.

Processes preserve the same metal amount except explicitly meaningful forming loss.

### Q97 — Fibre/Textile
**Decision:** Standard material-amount profile:

- 1 cleaned fibre bundle → 4 thread spools;
- 2 thread spools → 1 cord length;
- 4 thread spools → 1 cloth panel.

Rope/lattice/felt use their own form fractions but preserve declared material amount.

### Q98 — Glass Forming
**Decision:** Standard glass-stock profile:

- 1 block-equivalent glass stock → 4 panes;
- 1 pane-equivalent amount → 1 standard lens blank;
- specialist precision lenses may consume additional polishing/abrasive resources without inventing glass mass.

### Q99 — Ceramic Yield
**Decision:** Standard clay-stock profile after valid firing:

- 1 standard clay stock → 4 ceramic bricks; or
- 1 standard clay stock → 8 roof tiles.

Firing transformation and physically meaningful loss remain explicit.

### Q100 — Specialist Yield Overrides
**Decision:** Override global yields only for:
- source-locked recipe;
- materially different geometry;
- meaningful composition loss/addition;
- specialist living/magical preservation;
- intentionally different process efficiency.

### Q101 — Unit Abstraction
**Decision:** Inventory uses discrete object counts, while material-bearing forms also carry an internal conserved **material amount** relative to their canonical stock profile.

Physical mass/volume remain material properties, not one universal fake mass unit.

### Q102 — Fractional Accounting
**Decision:** YES internally, using fixed-point/rational quantity rather than floating-point drift.

UI may continue to show discrete items where appropriate.

### Q103 — Fluid/Gas Quantity
**Decision:** Fluids use integer volume units with millilitre-scale semantics.

Gases track amount plus pressure/temperature where needed; implementation may use standard-volume-equivalent fixed-point quantity.

### Q104 — Filled Containers
**Decision:** Composite object:
container + contained material + quantity/state.

### Q105 — Installed Component Recovery
**Decision:** Removable components return the same object instance with retained state/provenance where physically valid.

### Q106 — Repair Architecture
**Decision:** Unified repair transaction with multiple execution surfaces:

- small objects: interaction/station repair;
- machines: component/service repair;
- structures/portals: staged repair project.

### Q107 — Repair Substitution
**Decision:** Provider substitution is allowed only where the damaged design slot is provider-based.

Exact identity-bearing components require exact replacement.

### Q108 — Portal Repair
**Decision:** YES.

Portal repair uses the same repair transaction architecture with portal-specific structure validation.

### Q109 — Staged Projects
**Decision:** Large construction uses staged project definitions with:
- bill of materials;
- phases;
- capability requirements;
- delivered stock;
- completion state.

### Q110 — Project Reservation
**Decision:** Planned stock uses soft reservation; delivered/committed stock becomes hard-reserved to the project.

### Q111 — Dismantling / Salvage
**Decision:** Return actual recoverable materials/components based on composition and damage.

Loss must be explicit and physically plausible.

### Q112 — R05 Certification
**Decision:** PASS.

No standard conversion requires resource duplication.

---

# P01 — Global Portal Dependency Graph
## Q113–Q132

### Q113 — First-Access Philosophy
**Decision:** **HYBRID — consequential fork resolved.**

Early realms retain meaningful order freedom; later portals deliberately require cross-realm integration.

### Q114 — Overworld Bootstrap
**Decision:** Three early Realm Access paths are independently reachable from the Overworld:

1. Covenant Portal — constructed from Overworld capability.
2. Veilgate — first access via guaranteed restoration of a historical Overworld Veilgate Remnant.
3. Dreamgate — constructed around a guaranteed dormant Somnolent core/interface recovered from an Overworld Dream-Leak site.

### Q115 — Verdant Position
**Decision:** Covenant Portal is **one of several possible early realm routes**, not a mandatory universal first realm.

### Q116 — Veilgate External Realm Dependency
**Decision:** NO.

First Veilgate does not require prior access to another realm.

### Q117 — Dreamgate External Realm Dependency
**Decision:** NO.

First Dreamgate does not require prior access to another realm.

### Q118 — Ascension Dependency
**Decision:** YES.

Ascension Gate requires **one authentic stabilisation/attunement component** from at least one already accessed early realm:
Verdant, Ancestral or Somnolent.

### Q119 — Deep Dependency
**Decision:** YES.

Deepgate requires stabilisation signatures/components from **two distinct previously accessed realms** selected from:
Verdant, Ancestral, Somnolent, Ascendant.

### Q120 — Ashen Dependency
**Decision:** YES.

First Ashgate requires one exact Impossible Deep-origin extreme-environment component.

Impossible Deep is therefore a prerequisite for first Ashen access.

### Q121 — Guaranteed Foreign Provenance
**Decision:** Mandatory pre-access foreign matter is valid only when guaranteed through authored provenance such as:

- guaranteed ruin/site;
- guaranteed historical portal remnant;
- guaranteed faction/diplomatic reward;
- deterministic research chain;
- guaranteed expedition/cache;
- guaranteed trade/quest contract;
- inherited canonical structure.

### Q122 — Guaranteed Source Channels
**Decision:** Multiple channels may exist, but every mandatory first-access ingredient must have at least one deterministic world/progression path.

### Q123 — RNG Safeguard
**Decision:** Worldgen/progression validation must certify at least one guaranteed source.

Random rare loot may be supplementary, never the sole mandatory path.

### Q124 — Sequence Breaking
**Decision:** YES.

If a player legitimately obtains the required foreign component early, the portal accepts it.

### Q125 — Portal Knowledge
**Decision:** YES.

Each first portal requires knowledge/recognition/attunement separate from physical materials.

### Q126 — Portal Knowledge Discovery
**Decision:** Multiple channels allowed:
- research;
- archaeology;
- NPC instruction;
- records/books;
- experimentation where safe;
- authority/faction knowledge.

At least one guaranteed discoverable path exists for every mandatory portal.

### Q127 — Portal Upgrade Pattern
**Decision:** HYBRID.

Use:
- replaceable upgrade/support modules for material hardware;
- persistent state for attunement/calibration;
- same portal-family identity throughout.

### Q128 — Destination Calibration
**Decision:** Persistent mapping/knowledge + portal calibration state.

Reusable calibration modules may improve stability/cargo/depth but are not disposable destination keys by default.

### Q129 — Activation Consumables
**Decision:** Portal-specific.

Do not force six symmetric consumable mechanics.

### Q130 — Portal Repair/Recovery Default
**Decision:** Structure-level repair project.

Intact frame/components recover as themselves; keystone/core is recoverable if physically intact; calibration/attunement persists with core/interface where appropriate.

### Q131 — Shared Runtime
**Decision:** YES.

All six portal families use one universal Realm Access runtime with family-specific:
- validator;
- frame/component contract;
- core;
- attunement;
- destination rules;
- visuals.

### Q132 — Dependency Certification
**Decision:** PASS.

Recommended graph is acyclic and contains deterministic first-access paths.

---

# P02 — Covenant Portal Binding
## Q133–Q148

### Q133 — Cut-Stone Provider
**Decision:** Provider-based.

Eligible material must be an approved cuttable structural stone meeting portal-frame durability/strength.

Canonical default candidates include:
Granite, Limestone, Sandstone, Slate, Basalt, Marble, Gneiss and Quartzite.

Shale is not a default provider because of its laminar weakness unless a qualifying processed grade later satisfies the threshold.

### Q134 — Hardwood / Structural Timber
**Decision:** Provider-based structural timber threshold.

Canonical eligible examples include Oak Heartwood, Ironbark, Blackwood, Beech, Redbark, Maple and other timbers that satisfy the required structural profile.

The recipe does not use botanical taxonomy alone as the test.

### Q135 — Plant Binding
**Decision:** Provider-based.

Pre-realm candidates include:
- Sunflax Fibre;
- Mirehemp Fibre;
- processed Willowreed binding;
- qualifying Mixed Plant Fibre.

### Q136 — Mana-Conductive Component
**Decision:** Provider-based low-tier magical conductor.

Default pre-realm providers:
- Mana Shard derived from Raw Mana Crystal;
- qualifying Ley Crystal component.

### Q137 — Precision Fitting
**Decision:** Provider-based precision metal fitting.

Default early providers:
Bronze, Copper, Iron or Steel fitting where workmanship/strength threshold passes.

### Q138 — Attunement Vessel
**Decision:** Exact component archetype `Attunement Vessel`, material-flexible.

Eligible vessel materials:
- ordinary Glass;
- Clear Quartz;
- qualifying fired ceramic.

Actual selected material remains recorded.

### Q139 — Carved Heart Core
**Decision:** Uses the same structural-timber provider as Q134, with carving capability.

### Q140 — Botanical Binding
**Decision:** Uses Q135 plant-binding provider.

Four units are required by the locked Covenant Heart contract.

### Q141 — Mana-Conductive Inserts
**Decision:** Exact subcomponent:

**1 Mana Shard + 1 Copper Wire → 1 Mana-Conductive Insert**

Covenant Heart requires **2 inserts**.

Ley Crystal may substitute for the Mana Shard only where the provider resolver confirms equivalent low-tier mana-conduction and the recipe variant is enabled.

### Q142 — Growth Catalyst Water
**Decision:** 250 mL ordinary Water per Verdant Growth Catalyst.

### Q143 — Growth Catalyst Botanical Inputs
**Decision:** 2 units of living botanical growth-provider material.

Valid inputs include healthy seeds, cuttings or living plant matter from approved Overworld botanical/crop families.

### Q144 — Fertility/Growth Reagent
**Decision:** Provider-based `fertility_reagent`.

It may accept suitable soil amendment/fertility products; FCC-13 does not invent a universal “Growth Essence”.

### Q145 — Mana Charge
**Decision:** Consumes one standard low-tier mana charge from an available mana source.

It is a charge/energy transfer, not a generic Mana Essence Item.

### Q146 — Subcomponent Capabilities
**Decision:** Required:
- carving;
- basic metal forming;
- fibre binding;
- vessel forming;
- low-tier magical attunement;
- assembly.

No realm-exclusive station is required.

### Q147 — Repair / Recovery
**Decision:** Intact frame pieces, Keystone Socket and Covenant Heart recover as themselves.

Verdant Growth Catalyst is consumed on first activation and does not recover.

Damaged frame uses valid provider material; damaged identity-bearing Heart components require corresponding replacement.

### Q148 — Covenant Certification
**Decision:** PASS.

FCC-02G quantitative contract remains intact.

---

# P03 — Veilgate Binding
## Q149–Q166

### Q149 — First-Access Model
**Decision:** **RESTORED HISTORICAL VEILGATE — consequential fork resolved.**

Every valid world/progression path guarantees access to at least one dormant/ruined historical Veilgate Remnant in the Overworld.

It is the same Veilgate family, not a seventh portal.

### Q150 — Mandatory Native Roles
**Decision:** All six FCC-03G roles remain mandatory in a complete Veilgate:

1. Memory Stone frame/foundation;
2. Memory Glass threshold/interface;
3. Soul Silver fittings;
4. Echo Pearl-based core;
5. Grave Salt stabilisation;
6. recognition/inscription layer.

The first Overworld remnant already contains authentic Ancestral components from historical provenance, preventing circularity.

### Q151 — Memory Stone
**Decision:** Full newly built Veilgate standard:
**12 Memory Stone frame-family pieces**.

### Q152 — Memory Glass
**Decision:** **2 Memory Glass threshold/interface panels**.

### Q153 — Soul Silver
**Decision:** **4 Soul Silver fittings**.

The standard fitting is a crafted Soul Silver precision fitting produced from plate/wire according to the fitting recipe.

### Q154 — Echo Pearl
**Decision:** Processed into a crafted core rather than installed raw.

### Q155 — Core Identity
**Decision:** Canonical component name:

> **Veil Keystone**

This is a manufactured Ancestral portal component, not a new material.

### Q156 — Echo Pearl Quantity
**Decision:** **1 Echo Pearl per Veil Keystone.**

### Q157 — Grave Salt
**Decision:** **2 Grave Salt stabilisation-channel units** per full Veilgate.

They are installed/replenishable material, not consumed every activation.

### Q158 — Recognition / Inscription
**Decision:** Exact installed component:

> **Veil Recognition Plate**

Crafted from:
- 1 fired Spirit Clay tablet;
- 1 Ancestor Ash inscription dose.

### Q159 — Recognition Knowledge
**Decision:** YES.

The plate is physical; recognition/inscription knowledge is a separate knowledge/permission condition.

### Q160 — Pre-Access Provenance
**Decision:** Guaranteed Overworld Veilgate Remnant.

The remnant contains/supplies the authentic native roles needed for restoration.

It is generated/placed through deterministic progression validation, not random loot chance.

### Q161 — External Realm Dependency
**Decision:** NONE for first access.

### Q162 — Universal Supporting Providers
**Decision:** Temporary scaffolding, ordinary repair structure, tools and non-identity support may use universal providers.

The validated completed Veilgate still preserves all six exact Ancestral roles.

### Q163 — Activation Consumable
**Decision:** NONE by default.

Grave Salt is installed stabilisation material and may need repair/replenishment, not one-use activation payment.

### Q164 — Repair
**Decision:** After Ancestral access:
- Memory Stone role repaired with Memory Stone;
- Memory Glass with Memory Glass;
- Soul Silver with Soul Silver;
- Veil Keystone with its exact component recipe;
- Grave Salt replenished;
- Recognition Plate repaired/reinscribed.

First-remnant restoration may use preserved site components plus universal support where identity-bearing pieces remain intact.

### Q165 — Recovery
**Decision:** Intact constructed gate may return:
- Memory Stone frame pieces;
- Memory Glass panels;
- Soul Silver fittings;
- Veil Keystone;
- Recognition Plate.

Remaining Grave Salt stock is recoverable according to installed amount/condition.

### Q166 — Veilgate Certification
**Decision:** PASS.

No first-entry circular Ancestral material dependency remains.

---

# P04 — Dreamgate Binding
## Q167–Q184

### Q167 — First-Access Model
**Decision:** Overworld bootstrap using a **guaranteed Somnolent artefact package** from an authenticated Dream-Leak site.

The locked Overworld Dream-Leak Manor site family provides a natural thematic/provenance route.

### Q168 — Mandatory Role Subset
**Decision:** First-access Dreamgate requires:

- structural frame provider;
- 1 Coherence Core;
- 2 Lucid Glass interface panels;
- universal precision fittings/binding;
- mana supply;
- coherence-attunement knowledge.

Dream Mote, Waking Stone and Memory Thread become normal native construction/upgrade options after first access rather than circular mandatory inputs.

### Q169 — Mandatory Core
**Decision:** YES.

Dreamgate has one mandatory core identity.

### Q170 — Coherence Core
**Decision:** **MANDATORY DREAMGATE CORE — consequential fork resolved.**

### Q171 — Alternate Core
**Decision:** No new competing base core is introduced.

Upgraded Coherence Cores remain the same component lineage.

### Q172 — Frame Provider
**Decision:** 12 standard portal structural-frame pieces using approved structural stone/timber composite provider.

First access can be produced entirely in the Overworld.

### Q173 — Lucid Glass
**Decision:** **2 Lucid Glass threshold/interface panels**.

For first access these are guaranteed together with the dormant Coherence Core at the Dream-Leak source.

### Q174 — Dream Mote
**Decision:** Post-access charge/catalyst and upgrade resource.

It is not mandatory for the first Dreamgate because the recovered dormant core retains enough authentic Somnolent resonance for first calibration.

### Q175 — Waking Stone
**Decision:** Optional native stabilisation/frame upgrade.

Not required for first access.

### Q176 — Memory Thread
**Decision:** Optional native binding/record/stabilisation upgrade.

Not required for first access.

### Q177 — Universal Imported Roles
**Decision:** Structural frame, metal fitting, binding and ordinary mana-supply roles may use valid universal providers.

### Q178 — Pre-Access Somnolent Provenance
**Decision:** Guaranteed Dream-Leak Manor or equivalent authenticated Dream-Leak site.

It provides:
- 1 Dormant Coherence Core;
- 2 recoverable Lucid Glass interface panels.

At least one such validated path is guaranteed.

### Q179 — Earlier-Realm Dependency
**Decision:** NONE.

### Q180 — Activation Consumable
**Decision:** No mandatory one-use material.

First activation uses:
- stored core resonance;
- supplied mana charge;
- knowledge/attunement.

### Q181 — Coherence Attunement
**Decision:** Persistent state stored on Coherence Core/interface plus knowledge validation.

### Q182 — Repair
**Decision:** Frame uses providers; Lucid Glass and Coherence Core remain exact identity-bearing repair requirements.

### Q183 — Recovery
**Decision:** Intact Coherence Core and Lucid Glass panels recover as themselves.

Core charge/calibration state persists unless destroyed/reset by the dismantling process.

### Q184 — Dreamgate Certification
**Decision:** PASS.

Dreamgate remains the only normal physical Somnolent portal.

---

# P05 — Ascension Gate Binding
## Q185–Q202

### Q185 — First-Access Dependency
**Decision:** Requires at least **one previously accessed early realm**:
Verdant, Ancestral or Somnolent.

### Q186 — Structural Frame
**Decision:** **12 structural frame pieces** from the universal portal structural provider.

Tall/upward geometry is family-specific.

### Q187 — Conductive/Stabilising Fittings
**Decision:** **4 precision conductive fittings**.

Provider accepts qualifying Silver, Copper, Bronze or Steel fittings.

### Q188 — Ascension Keystone Architecture
**Decision:** Exact manufactured component with five input roles:

1. Keystone Housing;
2. Sunstone;
3. Silver conduction;
4. Ley Crystal;
5. one authentic earlier-realm stabilisation component.

### Q189 — Structural Component
**Decision:** Keystone Housing crafted from **2 Steel Plates**.

### Q190 — Conductive Component
**Decision:** **2 Silver Wire**.

### Q191 — Magical/Aetheric Component
**Decision:** **1 Sunstone + 1 Ley Crystal**.

These are exact Overworld materials, avoiding Ascendant-first-entry circularity.

### Q192 — Keystone Attunement
**Decision:** High-altitude/open-sky attunement process with portal knowledge.

No Ascendant material is required.

### Q193 — Vertical/Aetheric Attunement Layer
**Decision:** Portal structure/geometry state validated from frame orientation and conductive layout rather than a disposable Item.

### Q194 — Activation Interface
**Decision:** Exact component:

> **Ascension Gate Interface**

Constructed from universal precision metal, Copper Wire and a Clear Quartz/Glass optical interface.

### Q195 — Earlier-Realm Ingredient
**Decision:** YES, exactly one stabilisation/attunement provider from:

- Verdant: Bloomstone Stabiliser Core;
- Ancestral: Calibrated Echo Pearl Component;
- Somnolent: Coherence Core.

The ingredient retains provenance and is consumed/installed in the Keystone.

### Q196 — First-Access Quantities
**Decision:** Standard gate:

- 12 frame pieces;
- 4 conductive fittings;
- 1 Ascension Keystone;
- 1 Ascension Gate Interface.

### Q197 — Activation Consumable
**Decision:** NONE.

Attunement and mana/power are operational requirements, not one-use filler.

### Q198 — Keystone Recovery
**Decision:** Intact Ascension Keystone is recoverable.

### Q199 — Repair
**Decision:** Frame/fittings may use valid providers; damaged Keystone requires exact subcomponent repair/rebuild.

### Q200 — Native Upgrades
**Decision:** Native upgrade eligibility includes:
- Cloudstone;
- Skyiron;
- Celestial Metal;
- Stormglass/Halo Glass;
- Lightning Core technology;
- Hymnstone;
- Sunmist support.

### Q201 — Keystone Upgrade
**Decision:** Preserve one Ascension Keystone identity.

Use replaceable native upgrade modules plus persistent attunement state rather than a second “Advanced Ascension Keystone” base family.

### Q202 — Ascension Certification
**Decision:** PASS.

No first-access Ascendant-only material dependency exists.

---

# P06 — Deepgate Binding
## Q203–Q220

### Q203 — First-Access Dependency
**Decision:** Requires authentic stabilisation components from **two distinct previously accessed realms** chosen from Verdant, Ancestral, Somnolent and Ascendant.

### Q204 — Structural Frame
**Decision:** **12 high-strength reinforced structural frame pieces**.

Provider may use Steel-reinforced stone or another material assembly satisfying structural/anchoring thresholds.

### Q205 — Anchoring/Stabilisation Layer
**Decision:** **4 Deep Anchor components**.

Each standard Deep Anchor uses:
- 1 Steel Plate;
- 1 high-density structural-stone amount;
- mechanical anchoring capability.

### Q206 — Deep Keystone Architecture
**Decision:** Exact component recipe:

- 1 Star Iron Ingot;
- 2 Ley Crystals;
- 2 Steel Plates;
- 2 qualifying realm-stabilisation components from **different realm provenances**.

Output:
- 1 Deep Keystone.

### Q207 — Structural Component
**Decision:** 2 Steel Plates provide Keystone housing/support.

### Q208 — Pressure/Depth Component
**Decision:** 1 Star Iron Ingot anchors the pre-entry depth/gravity calibration structure.

It is Overworld/cosmic, not Deep-native.

### Q209 — Magical/Spatial Component
**Decision:** 2 Ley Crystals + two distinct realm-stabilisation components.

Eligible canonical realm-stabilisation examples:

- Verdant — Bloomstone Stabiliser Core;
- Ancestral — Calibrated Echo Pearl Component;
- Somnolent — Coherence Core;
- Ascendant — Hymnstone Resonator.

### Q210 — Pressure/Depth Attunement
**Decision:** Persistent calibration state produced by a portal-attunement process using Survey Lens/Prospecting knowledge/tools.

Tool is not consumed.

### Q211 — Activation Interface
**Decision:** Exact component:

> **Deepgate Interface**

Uses universal structural/precision material plus optical/readout material.

### Q212 — Earlier-Realm Ingredient
**Decision:** YES.

Two stabilisation components from two distinct realm provenances are mandatory.

### Q213 — First-Access Quantities
**Decision:**
- 12 reinforced frame pieces;
- 4 Deep Anchors;
- 1 Deep Keystone;
- 1 Deepgate Interface.

### Q214 — Destination Calibration
**Decision:** Persistent map/route/depth calibration state.

Deeper/safe destinations require actual discovery/validation and can be improved by native modules.

### Q215 — Activation Consumable
**Decision:** NONE.

### Q216 — Keystone Recovery
**Decision:** Intact Deep Keystone is recoverable.

### Q217 — Repair
**Decision:** Provider-based frame/anchor repair; exact Keystone repair for identity-bearing core components.

### Q218 — Native Upgrades
**Decision:** Upgrade eligibility includes:
- Pressure Stone;
- Abyssal Iron;
- Seismic Crystal;
- Pressure Pearl;
- Ventglass;
- Gravity Nodule technology;
- Deepfire Ember technology.

### Q219 — Upgrade Representation
**Decision:** Replaceable native stabilisation/calibration modules + persistent destination state.

Same Deepgate family and Deep Keystone lineage.

### Q220 — Deepgate Certification
**Decision:** PASS.

No first Deepgate requires inaccessible Impossible Deep-native matter.

---

# P07 — Ashgate Binding
## Q221–Q238

### Q221 — First-Access Dependency
**Decision:** Impossible Deep is mandatory before first Ashen access.

### Q222 — Reinforced Frame
**Decision:** **12 heat-tolerant reinforced frame pieces**.

Default provider uses cut Basalt plus Steel reinforcement, but any pre-Ashen material assembly meeting structural and thermal thresholds may qualify.

### Q223 — Thermal Stabilisation
**Decision:** **4 Thermal Stabiliser Modules**.

First-access module recipe uses Impossible Deep technology:

- Ventglass;
- Pressure Resin sealing;
- Steel structural housing.

This is a real cross-realm physical solution, not “wrong-realm” magic.

### Q224 — Ash Keystone Architecture
**Decision:** Exact component recipe:

- 1 Deepfire Ember Containment Core;
- 2 Steel Plates;
- 1 Sunstone;
- 1 Ley Crystal.

Output:
- 1 Ash Keystone.

### Q225 — Structural Component
**Decision:** 2 Steel Plates form Keystone housing.

### Q226 — Heat-Stabilising Component
**Decision:** Exact **Deepfire Ember Containment Core**.

Its recipe is:

- 1 Deepfire Ember;
- 2 Ventglass components;
- 1 Pressure Resin Seal;
- 2 Abyssal Iron Plates.

Output:
- 1 contained Deepfire Ember core.

### Q227 — Magical/Realm Component
**Decision:** 1 Sunstone + 1 Ley Crystal.

Attunement determines Ashen destination; no pre-entry Ashen material is required.

### Q228 — Realm/Depth Attunement
**Decision:** Persistent knowledge/calibration state established through Ashgate attunement procedure.

No generic “Ashen Essence” Item is created.

### Q229 — Activation Interface
**Decision:** Exact component:

> **Ashgate Interface**

Uses refractory/heat-tolerant housing, Copper Wire and a readable Glass/Quartz interface.

### Q230 — Earlier-Realm Ingredient
**Decision:** YES.

Deepfire Ember Containment Core is mandatory and therefore Impossible Deep access is required.

### Q231 — First-Access Quantities
**Decision:**
- 12 reinforced frame pieces;
- 4 Thermal Stabiliser Modules;
- 1 Ash Keystone;
- 1 Ashgate Interface.

### Q232 — Activation Consumable
**Decision:** NONE.

### Q233 — Keystone Recovery
**Decision:** Intact Ash Keystone is recoverable.

The contained Deepfire Ember remains hazardous and retains containment state.

### Q234 — Repair
**Decision:** Frame uses qualifying provider repair; Thermal Stabiliser Modules are replaceable; damaged Keystone requires exact component repair.

### Q235 — Native Upgrades
**Decision:** Eligible post-entry upgrades include:
- Hellglass;
- Cooling Crystal;
- Contract Iron;
- Infernal Alloy;
- Furnace Heart technology;
- advanced heat shielding.

### Q236 — Deeper Destination Calibration
**Decision:** Persistent discovery/map/calibration state, optionally supported by replaceable Ashen modules.

First destination remains validated Stratum I.

### Q237 — Upgrade Representation
**Decision:** Replaceable support modules + portal calibration state.

No separate Deep Ashgate family.

### Q238 — Ashgate Certification
**Decision:** PASS.

No first Ashgate requires an Ashen-only resource; its mandatory cross-realm resource comes from already-accessed Impossible Deep.

---

# M01 — Legacy Migration, Completeness & FCC-14 Handoff
## Q239–Q268

### Q239 — Alias Storage
**Decision:** Central redirect index plus alias records attached to canonical target metadata.

### Q240 — Multiple Legacy IDs
**Decision:** YES.

Many legacy IDs may redirect to one canonical target.

### Q241 — Removed ID Reuse
**Decision:** PROHIBITED permanently.

### Q242 — Unsupported Legacy Object
**Decision:** Default hierarchy:

1. canonical migration;
2. contextual migration;
3. physically defensible salvage;
4. inert `leyforge_compat` object when required to preserve ownership/save load;
5. explicit removal with migration report only as last resort.

### Q243 — Salvage Conversion
**Decision:** Allowed only where old composition/quantity can be reconstructed with reasonable confidence.

No arbitrary compensation material.

### Q244 — Deprecated Compatibility Object
**Decision:** Use when:
- content cannot be safely mapped;
- deletion would destroy player-owned value/world integrity.

Compatibility objects:
- are noncraftable;
- excluded from normal worldgen/trade;
- visibly marked legacy;
- retain original ID metadata.

### Q245 — Migration Reporting
**Decision:** Migration creates:
- pre-migration backup;
- machine-readable migration log;
- player-readable summary of changed/unresolved content.

### Q246 — Learned Recipe Migration
**Decision:** Learned recipe aliases redirect to new recipe IDs where semantic replacement exists.

### Q247 — Removed Learned Recipe
**Decision:** Preserve deprecated knowledge history in migration metadata, remove from active craftability and report it.

Do not invent a new recipe to compensate.

### Q248 — Generic Material Recipe Migration
**Decision:** Contextual.

- old Stone recipes resolve to actual source stone where recoverable;
- old Plant Fibre resolves to exact known fibre or Mixed Plant Fibre;
- unknown semantic material remains compatibility content rather than guessed.

### Q249 — Duplicate Block/Item Recipe Migration
**Decision:** All duplicate legacy recipe references redirect to the one canonical physical content identity/projection.

### Q250 — Numeric-Only Save Recovery
**Decision:** Migrate through exact legacy-registry-version mapping.

If source version cannot be established reliably, quarantine unresolved rows rather than guessing numeric meaning.

### Q251 — Old Asset Paths
**Decision:** Migration/reference metadata only.

Unreal-era paths do not become Godot registry canon.

### Q252 — Old Texture/Colour
**Decision:** NOT CANON.

May be retained as POC visual reference only.

### Q253 — POC Named Stations
**Decision:** Retain/rebind only where supported by current process/system architecture.

A retained station becomes a capability bundle, not an arbitrary exclusive recipe owner.

Unsupported POC stations become deprecated/test content.

### Q254 — POC Equipment/Food/Loot Evidence Threshold
**Decision:** Exact POC object survives only when:
- current locked canon/owning system requires it; or
- FCC-13 explicitly accepts it after owner review.

POC existence alone is insufficient.

### Q255 — Test Fixtures
**Decision:** Move useful test-only objects into `leyforge_test` namespace.

They are excluded from normal worldgen, progression and canonical registries.

### Q256 — Goblin Monster-Drop Migration
**Decision:** Remove `Monster Drop` personhood implication.

Goblin-made objects may become:
- equipment;
- cultural/faction salvage;
- trade goods;
- provenance-bearing loot from actual circumstances.

Goblin ancestry is not encoded as a monster-resource class.

### Q257 — Legacy Currency
**Decision:** Old coins/tokens become issuer-bound local currency/trade objects only when issuer/context can be established.

Unknown POC currency remains compatibility/deprecated content.

Nothing becomes universal legal tender by inheritance.

### Q258 — Legacy Portal Rows
**Decision:**
- Ancient Portal Frame → archaeological/structure reference associated with canonical portal history;
- Broken Portal Block → damaged/ruined state or portal-family piece;
- Unstable Rift Block → anomaly/interface/event content.

None becomes a seventh portal family.

### Q259 — Deepstone Migration
**Decision:** Contextual.

- world Deepstone uses realm/location/geological context to map to Pressure Stone, Bone Stone, Emberbone or another actual local stone where evidence exists;
- unlocated legacy inventory Deepstone defaults to Pressure Stone only when legacy realm metadata confirms Impossible Deep origin and no more specific geology is available;
- otherwise preserve compatibility record rather than inventing a material.

Deepstone never survives as active exact material.

### Q260 — Plant Fibre Migration
**Decision:**
- known botanical provenance → exact fibre;
- true mixed/unknown ordinary plant-fibre bundle → Mixed Plant Fibre;
- provider-only references → fibre provider semantics.

### Q261 — Remaining FCC-12 Legacy Terms
**Decision:** Preserve locked dispositions exactly:

- Dream Glass → Lucid Glass/contextual state;
- Celestial Stone → contextual Ascendant mapping;
- Fae Grass → actual flora/terrain where known;
- Voidstone → deferred/migration-only;
- Strange Realm Ore → rejected;
- Crystal Stone → contextual/retired;
- Mana Crystal Ore → Raw Mana Crystal source relation;
- Corrupted Shard generic → rejected;
- Relic Material → provenance/status;
- Deep Metal → terminology;
- Heat Glass → descriptor;
- Dream Thread → Memory Thread;
- Seasonal Crystal → Bloomstone state;
- Blackwater Pearl → Pressure Pearl state/provenance;
- Oath Metal → Contract Iron terminology;
- Barrier Ore / Boss Essence / Portalium / Dimension Ore → rejected.

### Q262 — Current Canon Completeness
**Decision:** PASS CONDITION.

Every Step-1C current-canon binding demand must map to:
- exact row;
- generated form;
- state/facies;
- provider role;
- component;
- owning non-Block registry.

No demand may be silently dropped because the POC lacked it.

### Q263 — POC Completeness
**Decision:** PASS CONDITION.

All 312 legacy rows require final migration dispositions before FCC-13 lock.

### Q264 — Recipe Completeness
**Decision:** PASS CONDITION.

Every retained craft/process requires executable semantic binding or explicit owner/defer status.

### Q265 — Portal Completeness
**Decision:** PASS CONDITION.

All six portal families require:
- first-access path;
- exact construction/component contract;
- repair;
- recovery;
- upgrade path;
- validated destination semantics.

### Q266 — Ownership
**Decision:** FCC-14 authority remains untouched.

FCC-13 binds content; FCC-14 performs final project-wide cross-realm certification.

### Q267 — FCC-14 Handoff Package
**Decision:** Provide:

- final registry architecture;
- material/form/object binding registry;
- recipe/provider/quantity registry;
- six-portal dependency graph;
- exact six portal recipes/components;
- 312-row migration table;
- alias/redirect table;
- list of compatibility/test-only content;
- zero-hold FCC-13 fidelity audit.

### Q268 — FCC-13 Lock Gate
**Decision:** PASS only after:

- Q1–Q268 accepted;
- FCC-13A–E written;
- interview-to-document audit passes;
- 312/312 legacy rows accounted;
- all current-canon demands targeted;
- all six portals reachable;
- zero unresolved registry/recipe/migration holds.

---

# 4. Global Portal Dependency Graph — Final Recommended Shape

The autonomous recommendation produces this access structure:

```text
                             ┌───────────────────────┐
                             │       Overworld       │
                             └───────────┬───────────┘
                                         │
                    ┌────────────────────┼────────────────────┐
                    │                    │                    │
                    ▼                    ▼                    ▼
             Verdant Covenant      Ancestral Veil      Somnolent Expanse
             Covenant Portal       Veilgate Remnant     Dream-Leak Core
                    │                    │                    │
                    └──────────────┬─────┴──────────────┬─────┘
                                   │                    │
                         any one early-realm component  │
                                   ▼                    │
                            Ascendant Reach             │
                            Ascension Gate              │
                                   │                    │
                                   └──────────┬─────────┘
                                              │
                               any two distinct realm
                               stabilisation signatures
                                              ▼
                                      Impossible Deep
                                         Deepgate
                                              │
                                 exact Deep-origin
                              extreme-environment core
                                              ▼
                                   Ashen Lower Realms
                                         Ashgate
```

The diagram represents dependency, not mandatory narrative quest order.

A player may still discover, research or possess materials out of expected sequence where legitimate provenance exists.

---

# 5. Why the Hybrid Portal Model Is Recommended

The hybrid model best matches the combined Leyforge principles.

It preserves:

- sandbox choice;
- legitimate sequence breaking;
- realm sovereignty;
- cross-realm material usefulness;
- non-linear capability progression.

At the same time it prevents the six realms from behaving like six disconnected optional DLC doors.

The early trio offer distinct access fantasies:

- **Covenant Portal:** build a portal from Overworld engineering and living/magical attunement.
- **Veilgate:** restore a real historical threshold with authentic Ancestral provenance.
- **Dreamgate:** build around a recovered dream-coherence artefact from a real Dream-Leak.

Later realms increasingly ask the player to combine what civilisation has learned elsewhere.

That matches Leyforge's civilisation + exploration + engineering identity better than either a completely linear ladder or six entirely independent recipes.

---

# 6. Key New Component Identities Recommended by FCC-13

The following are **components**, not materials:

- Attunement Vessel
- Mana-Conductive Insert
- Covenant Heart
- Covenant Keystone Socket
- Veil Keystone
- Veil Recognition Plate
- Coherence Core
- Ascension Keystone
- Ascension Gate Interface
- Deep Anchor
- Deep Keystone
- Deepgate Interface
- Thermal Stabiliser Module
- Deepfire Ember Containment Core
- Ash Keystone
- Ashgate Interface

Their recipes and material composition remain distinct from underlying materials.

---

# 7. Important Anti-Filler Result

The interview deliberately avoids introducing generic fantasy currencies/resources such as:

- Realm Essence;
- Portalium;
- Dimension Ore;
- Generic Boss Essence;
- Universal Portal Crystal;
- generic Corrupted Shard.

Portal knowledge remains knowledge.

Attunement remains state/process where appropriate.

Cross-realm dependencies use real canonical materials/components with real provenance.

---

# 8. FCC-13 Interview Completion Status

- [x] R01 Q1–20 answered
- [x] R02 Q21–44 answered
- [x] R03 Q45–64 answered
- [x] R04 Q65–92 answered
- [x] R05 Q93–112 answered
- [x] P01 Q113–132 answered
- [x] P02 Q133–148 answered
- [x] P03 Q149–166 answered
- [x] P04 Q167–184 answered
- [x] P05 Q185–202 answered
- [x] P06 Q203–220 answered
- [x] P07 Q221–238 answered
- [x] M01 Q239–268 answered
- [x] consequential generated-form fork resolved by recommendation
- [x] consequential portal-dependency fork resolved by recommendation
- [x] consequential Veilgate fork resolved by recommendation
- [x] consequential Dreamgate-core fork resolved by recommendation

---

# 9. Approval Gate

This register currently represents:

> **FCC-13 AUTONOMOUS RECOMMENDED BINDING DECISIONS Q1–Q268 — COMPLETE**

It becomes locked theoretical FCC-13 binding canon only after project-lead acceptance.

If accepted without amendment, the next phase is:

1. lock Q1–Q268;
2. write **FCC-13A — Stable Identity, Registry Architecture & Namespace Rules**;
3. write FCC-13B;
4. write FCC-13C;
5. write FCC-13D;
6. write FCC-13E;
7. run final fidelity/certification audit.

---

**End of FCC-13 Complete Autonomous Binding Interview Decision Register Q1–Q268 v0.1**
