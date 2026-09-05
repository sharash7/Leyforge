# Leyforge Final Content Canon Collection

## FCC-13C — Definitive Recipe, Process, Provider & Quantity Registry

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** **CANON WRITING COMPLETE v0.1 — based on locked FCC-13 interview Q1–Q268**  
**Parent:** FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding  
**Primary Interview Coverage:** R04 Q65–Q92; R05 Q93–Q112  
**Consumes:** FCC-13A; FCC-13B; locked FCC-13 autonomous binding interview Q1–Q268; FCC-13 Steps 1A–1E; locked FCC-12 processing/provider/conservation doctrine  
**Downstream:** FCC-13D portal recipes; FCC-13E migration; Forge/automation/technical implementation; FCC-14 certification

---

# 1. Purpose

FCC-13C defines the canonical recipe and process-binding architecture for Leyforge.

Its job is to answer:

> **What inputs are required, what may substitute, what capability performs the work, what environment is required, what amount of matter is consumed, and what exactly comes out?**

FCC-13C binds:

- stable recipe identity;
- exact-material inputs;
- exact-component inputs;
- provider inputs;
- form/state/quality/provenance conditions;
- process capabilities;
- named station capability bundles;
- specialist environment requirements;
- output categories;
- material conservation;
- global ordinary conversion yields;
- by-products, waste, scrap and recycling;
- repair;
- dismantling;
- staged construction projects;
- automation recipe validation.

FCC-13C does **not** redefine materials or forms.

It consumes FCC-12 and FCC-13A/B.

Exact portal construction recipes remain FCC-13D-owned.

---

# 2. Core Recipe Doctrine

> **A Leyforge recipe/process is a declarative physical transformation contract.**

A recipe must be able to state:

- what exact material or component is needed;
- what provider role may substitute;
- what form is required;
- what state is required;
- what quality/grade/purity threshold applies;
- whether provenance matters;
- what knowledge/permission is required;
- what process capability is needed;
- what environment/support is needed;
- what quantity is consumed;
- what output category is produced;
- what by-product/scrap/loss occurs;
- how provenance and quality propagate.

A recipe is not merely:

> Item A + Item B → Item C

---

# 3. Recipe Stable IDs

Canonical recipe IDs use:

> `<namespace>:recipe/<process-domain>/<path>`

Examples:

- `leyforge:recipe/metallurgy/iron_ingot`
- `leyforge:recipe/metal_forming/iron_wire`
- `leyforge:recipe/stone_cutting/basalt_slab`
- `leyforge:recipe/textile/sunflax_thread`
- `leyforge:recipe/ceramic/clay_brick`
- `leyforge:recipe/portal/covenant/frame`

The stable recipe ID:

- does not encode quantity;
- does not encode balance version;
- does not encode selected substitute material;
- does not change because one output count is tuned.

A new recipe ID is required only when the semantic process is genuinely a different recipe.

---

# 4. Recipe Domains

The final domain list may be extended, but the canonical architecture supports domains such as:

- `separation`
- `cleaning`
- `grinding`
- `stone_cutting`
- `woodworking`
- `metal_refining`
- `metallurgy`
- `metal_forming`
- `glassworking`
- `ceramic`
- `textile`
- `chemical`
- `biological`
- `assembly`
- `repair`
- `salvage`
- `portal`
- `specialist`

Domains organise process meaning.

They do not become station ownership.

---

# 5. Exact Material Input

An exact-material slot references:

- canonical `material_id`;
- quantity/material amount;
- optional required form;
- optional state/quality/provenance constraint.

Use exact material when the material itself is the mechanic.

Examples:

- Contract Iron;
- Soul Silver;
- Dreamwater;
- Living Heartwood;
- exact transformed realm material.

An exact slot cannot be satisfied by a merely stronger or “higher-tier” substitute.

---

# 6. Exact Component Input

An exact-component slot references a canonical authored object/component ID.

Examples include:

- Covenant Heart;
- Veil Keystone;
- Coherence Core;
- Ascension Keystone;
- Deep Keystone;
- Ash Keystone;
- machine-specific authored core.

Provider substitution is not allowed unless the recipe explicitly declares an alternate equivalent component set.

---

# 7. Provider Input

A provider slot asks for function rather than name.

Examples:

- structural timber;
- conductive metal;
- optical glass;
- sealing material;
- refractory lining;
- pressure-rated transparent material.

The provider resolver checks whether the candidate satisfies the declared physical/magical constraints.

---

# 8. Provider Expression

A provider expression may include:

- provider role;
- required material class;
- required form;
- minimum strength;
- minimum conductivity;
- minimum heat resistance;
- minimum pressure tolerance;
- minimum transparency;
- minimum purity;
- minimum magical affinity;
- required state;
- prohibited conditions.

Provider eligibility is therefore composable rather than one opaque global tier.

---

# 9. Exact Versus Provider Rule

Use **exact** when:

- composition matters;
- unique magical structure matters;
- unique legal/contract identity matters;
- provenance is core to the mechanic;
- a named authored component is required.

Use **provider** when:

- any genuinely compatible physical solution is acceptable.

This distinction is canonical and mandatory.

---

# 10. Form Requirement

Form is independent from material.

A recipe may require:

- ingot;
- plate;
- wire;
- beam;
- pane;
- powder;
- thread;
- cloth;
- shard.

Example:

> conductive metal + wire form

is different from:

> conductive metal + plate form

even if the underlying material is the same.

---

# 11. State Requirement

Recipes may require typed state.

Examples:

- charged;
- dry;
- annealed;
- tuned;
- stabilised;
- dormant;
- calibrated;
- uncontaminated.

State is not encoded into the material ID.

---

# 12. Quality / Grade / Purity Threshold

Recipes may require:

- minimum purity;
- minimum ore grade;
- minimum structural quality;
- maximum contamination;
- minimum optical clarity;
- minimum crystal stability.

There is no universal rarity number that replaces these dimensions.

---

# 13. Provenance Requirement

Provenance is checked only where it matters.

Examples:

- archaeological reconstruction;
- historical portal component;
- contract-bound material;
- authority-recognised artifact.

Ordinary recipes should not require provenance merely because metadata exists.

---

# 14. Knowledge Requirement

Recipe knowledge is referenced separately through stable knowledge/unlock identity.

Knowledge is not:

- an ingredient;
- a mined resource;
- a generic recipe token.

A player can possess capability/material but still lack knowledge.

---

# 15. Legal / Contract / Permission Requirement

A recipe may reference an external legal/contract/permission predicate.

This may determine whether an actor is authorised to perform the process.

It does not alter material identity.

---

# 16. Environmental Requirement

Recipes may declare environmental conditions such as:

- heat range;
- cold range;
- pressure;
- atmosphere;
- humidity;
- mana field;
- dream coherence;
- High-Aether;
- Sacred-Law context;
- gravity/orientation stability;
- Blackwater-safe environment;
- infernal-heat handling.

A compatible station may provide some or all of these conditions.

---

# 17. Process Capability

A recipe requests process capability rather than one arbitrary station name.

Canonical process capability families include:

- crushing;
- grinding;
- cutting;
- sawing;
- shaping;
- pressing;
- drawing;
- rolling;
- casting;
- smelting;
- refining;
- firing;
- glassforming;
- spinning;
- weaving;
- binding;
- mixing;
- distilling;
- assembly;
- inscription;
- calibration;
- containment;
- stabilisation.

The exact stable capability-ID list remains implementation/content-schema work, but the semantic model is locked.

---

# 18. Named Stations

Named stations remain real canonical objects where supported.

They may provide:

- capabilities;
- efficiency;
- environment;
- safety;
- automation;
- cultural identity;
- UI;
- physical work area.

The recipe does not become station-exclusive merely because one station is the default provider.

---

# 19. Exact Named Station Exception

An exact station may be mandatory only when:

1. the source explicitly requires it;
2. station identity itself is part of the mechanic;
3. unique authority/legal context matters;
4. unique physical apparatus cannot be represented by generic capabilities.

This prevents arbitrary recipe lock-in.

---

# 20. Alternative Station Resolution

Any station/environment combination satisfying all required capabilities may execute the recipe unless an exact-station exception exists.

This enables:

- imported machinery;
- advanced cross-realm stations;
- player-built alternatives;
- future Forge-authored providers.

---

# 21. Operator Knowledge

Operator knowledge/skill remains separate from station capability.

Possible states include:

- station capable, operator untrained;
- operator knows recipe, station incapable;
- both present;
- neither present.

The recipe validator handles these separately.

---

# 22. Automation Validation

Automation uses the same recipe contract as manual crafting.

Automation must satisfy:

- input identity;
- quantities;
- provider validity;
- form/state;
- capabilities;
- environment;
- reservation;
- output capacity.

There is no hidden “automation shortcut recipe”.

---

# 23. Recipe Output Categories

Every recipe/process declares its output category.

## Same Material, New Form
Example: Iron Ingot → Iron Wire.

## Same Material, New State
Example: Bloomstone → tuned Bloomstone.

## New Transformed Material
Example: Ember Iron → Contract Iron.

## Authored Component/Object
Example: materials → Deep Anchor.

## Composite Object
Example: container + Water → filled Water container.

## Project/Structure Operation
Example: delivered components → completed construction stage.

This category is part of canonical recipe meaning.

---

# 24. Transformation Threshold

FCC-13C inherits FCC-12 exactly:

> **A new material identity is created only where materially significant composition, persistent structure or intrinsic behaviour changes enough to constitute genuinely different matter.**

Recipe convenience cannot override this rule.

---

# 25. By-Products

By-products are explicit when they are:

- physically meaningful;
- reusable;
- hazardous;
- economically significant;
- important to simulation.

Do not generate trivial micro-waste merely to create bookkeeping noise.

---

# 26. Waste / Loss

Meaningful process loss may be represented.

Examples:

- slag;
- ash;
- fumes;
- unusable contamination;
- broken grit.

Loss must be physically/process justified.

---

# 27. Scrap and Offcuts

Recoverable offcuts/scrap are real outputs when practical reuse exists.

Examples:

- wood offcuts;
- metal scrap;
- glass cullet;
- cloth scraps.

They remain actual material-bearing content.

---

# 28. Recycling

Recycling uses explicit reverse/recovery processes.

A product is not automatically convertible back to pristine inputs.

Recovery depends on:

- material composition;
- contamination;
- damage;
- process capability.

---

# 29. Provenance Carry-Through

A recipe declares provenance policy.

Possible policies include:

- preserve;
- combine;
- summarise;
- append processing provenance;
- intentionally discard irrelevant detail.

Rule-relevant provenance must persist.

---

# 30. Quality Carry-Through

Output quality may depend on:

- input quality;
- purity;
- process capability;
- station condition;
- operator skill;
- contamination;
- environment.

The object archetype remains the same unless a true transformation changes identity.

---

# 31. Provider Performance Variation

Two valid provider materials may satisfy the same recipe while producing different actual performance.

Example:

a pump archetype built with Copper versus Steel components can remain the same archetype while differing in:

- durability;
- corrosion resistance;
- mass;
- cost;
- appearance.

Provider validity does not imply identical performance.

---

# 32. Recipe Validation Feedback

The recipe system should return structured reasons such as:

- missing exact material;
- invalid provider;
- wrong form;
- insufficient purity;
- insufficient strength;
- missing environment;
- missing capability;
- missing knowledge;
- legal restriction;
- output blocked/full.

This is required for understandable Forge/UI/automation behaviour.

---

# 33. Conservation Doctrine

> **Physical processing conserves meaningful material stock.**

The recipe system may transform, split, combine or lose matter where physically justified.

It may not duplicate stock.

This applies to manual crafting, machines, automation, repair, salvage and projects.

---

# 34. Internal Material Amount

Inventory uses discrete objects where appropriate, but material-bearing forms also carry an internal conserved material amount relative to canonical stock profiles.

This allows partial-volume forms to conserve matter without pretending every object equals one full block.

---

# 35. Fixed-Point / Rational Accounting

Fractional material amounts are allowed internally.

Use fixed-point/rational accounting rather than uncontrolled floating-point accumulation.

The exact storage scale is technical implementation work.

---

# 36. Material Amount Versus Mass

Material amount is an inventory/process abstraction.

Physical mass and density remain material properties.

A Lead stock unit and an Oak stock unit do not become physically equal merely because both use one recipe-unit abstraction.

---

# 37. Global Timber Yield

Canonical ordinary sawing profile:

> **1 standard Log stock object → 4 standard Plank objects**

Hand splitting may use a less-efficient alternate process:

> **1 Log → 3 Planks + recoverable Wood Offcuts equal to the remaining material amount**

Specialist timber may override only with explicit source/process justification.

---

# 38. Global Stone Cutting Yield

Canonical default:

> **1 standard stone block/source stock → 1 cut-stone block-equivalent material amount**

Stone cutting does not multiply matter.

---

# 39. Slab Yield

Canonical default:

> **1 full block-equivalent → 2 slabs**

Each slab carries one-half block-equivalent material amount.

---

# 40. Stair Yield

Canonical default:

> **3 full block-equivalents → 4 stairs**

Each standard stair represents three-quarters of one block-equivalent material amount.

---

# 41. Wall Yield

Canonical default:

> **1 full block-equivalent → 2 standard wall segments**

Each segment stores one-half block-equivalent material amount unless specialist geometry defines otherwise.

---

# 42. Pillar Yield

Canonical default:

> **1 full block-equivalent → 1 full-volume pillar segment**

Narrow/decorative specialist pillars may define another explicit amount.

---

# 43. Metal Forming — Plate

Canonical ordinary profile:

> **1 Ingot → 1 Plate**

---

# 44. Metal Forming — Rod

Canonical ordinary profile:

> **1 Ingot → 2 Rods**

Each Rod stores one-half ingot-equivalent material amount.

---

# 45. Metal Forming — Wire

Canonical ordinary profile:

> **1 Ingot → 8 standard Wire lengths**

Each standard wire length stores one-eighth ingot-equivalent material amount.

Specialist wire gauges may define another explicit amount.

---

# 46. Fibre to Thread

Canonical ordinary profile:

> **1 cleaned Fibre Bundle → 4 Thread Spools**

The Fibre Bundle resolves to an exact fibre or real Mixed Plant Fibre product.

---

# 47. Thread to Cord

Canonical ordinary profile:

> **2 Thread Spools → 1 Cord length**

---

# 48. Thread to Cloth

Canonical ordinary profile:

> **4 Thread Spools → 1 Cloth panel**

Rope, felt and lattice define their own conserved material amounts.

---

# 49. Glass to Pane

Canonical ordinary profile:

> **1 block-equivalent Glass stock → 4 Panes**

Each pane stores one-quarter block-equivalent glass material.

---

# 50. Lens Blank

Canonical ordinary optical baseline:

> **1 pane-equivalent Glass amount → 1 standard Lens Blank**

Polishing may consume abrasive/time/capability without inventing glass mass.

---

# 51. Ceramic Brick Yield

Canonical ordinary profile after valid firing/transformation:

> **1 standard Clay/Ceramic stock → 4 Ceramic Bricks**

Raw-clay-to-ceramic transformation may include meaningful water/mass loss.

---

# 52. Ceramic Roof Tile Yield

Canonical ordinary profile:

> **1 standard Clay/Ceramic stock → 8 Roof Tiles**

---

# 53. Specialist Yield Overrides

A recipe may override global ordinary yield only when justified by:

- locked source contract;
- materially different geometry;
- composition addition/removal;
- specialist living preservation;
- specialist magical transformation;
- process-efficiency difference;
- deliberate waste/by-product.

Arbitrary realm-tier yield differences are prohibited.

---

# 54. Fluid Quantity

Fluids use integer volume quantities with millilitre-scale semantics.

UI may display mL/L while internal storage remains deterministic.

---

# 55. Gas Quantity

Gases track amount plus pressure/temperature where relevant.

Implementation may use standard-volume-equivalent fixed-point quantity.

A pressurised tank is not represented merely as “gas items”.

---

# 56. Filled Container Process

Filling a container is a composite-state process:

> empty container + fluid/gas quantity → same container holding material

The container is not transformed into a new material.

---

# 57. Emptying Container

Emptying transfers stored content while preserving the container where physically valid.

Spillage/loss occurs only where the actual process/state justifies it.

---

# 58. Installed Component Recovery

A removable component returns the same object instance when removed intact.

Its damage, provenance, charge and calibration remain unless removal changes them.

---

# 59. Repair Architecture

Leyforge uses one repair transaction model with multiple execution surfaces.

## Small Objects
Interaction or repair station.

## Machines
Component/service repair.

## Structures / Portals
Staged repair project.

The semantic rules remain consistent.

---

# 60. Repair Inputs

A repair slot may be:

- exact material/component;
- provider-based.

Provider substitution is allowed only where the original design slot is provider-based.

Identity-bearing cores and unique materials require exact replacement.

---

# 61. Repair Material Accounting

Repair consumes actual replacement material/component amount.

Repair does not restore durability from nothing.

Damaged removed parts may produce scrap/by-product where appropriate.

---

# 62. Staged Projects

Large construction may use staged project definitions declaring:

- phases;
- bill of materials;
- provider slots;
- exact components;
- capability requirements;
- delivered stock;
- completion conditions.

This applies to portals, large machines, structures and infrastructure.

---

# 63. Project Reservations

Planned materials use soft reservation.

Delivered/committed materials become hard-reserved to the project.

This prevents double allocation while preserving planning flexibility.

---

# 64. Project Material Identity

Delivered stock remains real material/object stock.

A project does not convert real materials into abstract construction points.

Actual selected materials persist into the finished structure where relevant.

---

# 65. Project Phase Completion

Completing a phase may incorporate materials, install components, change structure state and unlock later phases.

The project transaction must conserve committed stock.

---

# 66. Dismantling

Dismantling returns real recoverable components/material/forms according to condition.

Damage/loss may reduce recovery.

No generic refund token is created.

---

# 67. Salvage Provenance

Recovered parts may retain relevant provenance.

A Soul Silver fitting salvaged from a historical Veilgate remains provenance-bearing Soul Silver/component content.

---

# 68. Recycling Mixed Scrap

Mixed scrap requires valid separation/refining.

The output purity depends on:

- contamination;
- process capability;
- recovery method.

Mixed scrap does not magically become pristine inputs.

---

# 69. Standard Provider Roles

FCC-13C requires semantic provider roles for at least:

- structural stone;
- cuttable structural stone;
- structural timber;
- plant-fibre binding;
- conductive metal;
- precision metal fitting;
- magical conductor;
- optical material;
- transparent crystal/glass;
- sealing material;
- refractory material;
- pressure-rated material;
- pressure-rated transparent material;
- corrosion-resistant material;
- spirit-compatible material;
- coherence-compatible material;
- containment material;
- vessel material.

Exact provider-ID syntax is implementation/schema work.

---

# 70. Provider Role Composition

Prefer composable meaningful predicates rather than opaque tier tags.

Example pressure-view-window requirement:

- transparent;
- pressure-rated;
- chemically compatible;
- pane/plate form.

This is preferable to a generic “Deep Tier 3 Window Material”.

---

# 71. Provider Preference

A recipe/blueprint may specify:

- mandatory provider constraints;
- preferred material;
- fallback materials;
- style/cultural preference.

Preference does not redefine eligibility.

---

# 72. Exact Component Versus Provider Component

An authored component archetype may allow provider-selected materials in internal material slots.

Example:

Precision Metal Fitting may accept several qualifying metals.

By contrast, Covenant Heart is an exact component identity.

---

# 73. Structural Timber Provider

Eligibility is based on actual physical properties.

Likely qualifying examples include strong workable timbers such as:

- Oak Heartwood;
- Ironbark;
- Blackwood;
- Beech;
- Redbark;
- Maple;
- other authored timbers meeting threshold.

Botanical naming alone does not qualify a timber.

---

# 74. Structural Stone Provider

Eligibility depends on strength, durability, workability and form support.

Typical candidates include:

- Granite;
- Limestone;
- Sandstone;
- Slate;
- Basalt;
- Marble;
- Gneiss;
- Quartzite.

Shale is not a default structural provider unless a processed grade/form passes the threshold.

---

# 75. Conductive Metal Provider

Eligibility depends on actual conductivity plus required form/workability.

Typical candidates include:

- Copper;
- Silver;
- qualifying Bronze;
- other canonical conductive metals.

Exact recipes may still require one material where chemistry/function matters.

---

# 76. Optical Material Provider

Eligibility may require:

- transparency;
- clarity;
- stable form;
- compatible optical/magical behaviour.

Potential candidates include ordinary Glass, Clear Quartz and specialist realm glasses where valid.

---

# 77. Fibre Binding Provider

General fibre/binding roles may resolve to exact content such as:

- Sunflax Fibre;
- Mirehemp Fibre;
- processed Willowreed binding;
- Mixed Plant Fibre where a real mixture exists.

`Plant Fibre` remains a provider/category concept rather than one universal exact material.

---

# 78. Vessel Provider

A vessel provider requires material/form suitable for containment.

Depending on recipe, candidates may include:

- ordinary Glass;
- Clear Quartz;
- fired ceramic;
- compatible metal container.

The vessel object remains an authored component/container where geometry/function requires it.

---

# 79. Pressure Provider

Pressure-service provider requirements may include:

- structural strength;
- sealing compatibility;
- fatigue resistance;
- temperature tolerance.

Impossible Deep materials may provide superior performance, but ordinary materials are not invalid solely because they are not Deep-native.

---

# 80. Refractory Provider

Heat-resistant/refractory requirements are capability/property checks.

They do not automatically require Ashen matter.

Ashen materials may later satisfy or outperform those thresholds.


---

# 81. Specialist Capability Layers

Specialist realm processing is represented as additional capability/environment predicates layered on ordinary process families.

It does not create a duplicate universe of realm-exclusive basic crafting.

Examples:

- Living Heartwood joinery still uses cutting/assembly, but additionally requires living-material preservation.
- Contract Iron still uses metallurgical/assembly concepts, but additionally requires valid contract-binding capability and framework.
- Deep pressure components still use forming/assembly, but additionally require pressure-safe or extreme-pressure conditions where relevant.

---

# 82. Living-Material Preservation

Canonical specialist capability:

> **living-material preservation**

Use where processing must retain living biological structure rather than merely shape dead timber/fibre.

Relevant examples include Living Heartwood and other later explicitly authored living materials.

A normal saw is not automatically invalid; it is invalid only when the required process would destroy the living structure the recipe intends to preserve.

---

# 83. Spirit-Active Handling

Canonical specialist capability:

> **spirit-active / memory-safe handling**

Relevant to Ancestral materials where ordinary processing could disrupt their active memory/spirit properties.

This supplements ordinary cutting, glassworking, metallurgy or inscription rather than replacing them.

---

# 84. Coherence Stabilisation

Canonical specialist capability:

> **coherence stabilisation**

Relevant to Somnolent materials/components whose function depends on stable dream coherence.

A process may require:

- coherence-compatible environment;
- Coherence Core or other authorised provider;
- specific operator knowledge.

---

# 85. High-Aether Processing

Canonical specialist capability:

> **High-Aether processing**

Relevant to transformed Ascendant lineages such as Celestial Metal or Halo Glass where source canon requires a persistent specialist transformation.

It must not become a generic “higher-tier furnace” gate for ordinary materials.

---

# 86. Sacred-Law Attunement

Canonical specialist capability:

> **Sacred-Law attunement**

Used where law/domain structure is actually part of the material/component process.

A recipe can additionally require legal/permission context without converting law into an Item ingredient.

---

# 87. Extreme-Pressure Processing

Canonical specialist capability:

> **extreme-pressure processing**

Used where actual pressure materially affects processing or final structure.

A managed off-realm pressure apparatus may satisfy the requirement if all conditions are reproduced.

---

# 88. Gravity / Orientation Processing

Canonical specialist capability:

> **gravity/orientation processing**

Used for Impossible Deep materials/components whose structure or calibration depends on gravity/orientation behaviour.

It is an environment/process requirement, not a new material tier.

---

# 89. Blackwater-Safe Processing

Canonical specialist capability:

> **Blackwater-safe processing**

Used only where the material/process genuinely requires Blackwater-safe handling or contamination resistance.

---

# 90. Infernal-Heat Processing

Canonical specialist capability:

> **infernal-heat processing**

Relevant to extreme Ashen metallurgy/industry where ordinary temperature capability is insufficient.

A foreign machine reproducing the required heat/control may satisfy the capability if no exact station is canonically required.

---

# 91. Contract Binding

Canonical specialist capability:

> **contract binding**

Contract Iron is not created simply by heating Ember Iron.

The process must satisfy the universal contract framework and the required binding conditions.

Contract validity follows the contract system rather than current realm coordinates.

---

# 92. Hazardous-Ember Containment

Canonical specialist capability:

> **hazardous-ember containment**

Used when processing, installing or transporting hazardous energetic matter such as Deepfire Ember or other explicitly hazardous ember resources.

Containment does not erase the material's identity or hazard.

---

# 93. Universal Timber Processing Family

Ordinary timber recipes may include:

- harvesting/log preparation;
- sawing;
- splitting;
- planing;
- shaping;
- joinery;
- assembly.

Generated form conversion uses the global timber yield profile.

Specialist timbers may add preservation, ritual or environmental requirements.

---

# 94. Universal Stone / Masonry Processing Family

Ordinary stone recipes may include:

- breaking/extraction;
- rough shaping;
- cutting;
- polishing;
- masonry forming;
- crushing/grinding.

Actual stone identity must be preserved through generated forms and salvage.

---

# 95. Universal Clay / Ceramic Processing Family

Canonical processing distinguishes:

1. clay/mineral feedstock;
2. cleaning/temper/formulation where needed;
3. shaping;
4. drying where relevant;
5. firing;
6. fired ceramic product/material;
7. ceramic form.

Raw clay cannot bypass the transformation boundary merely because a prototype recipe calls the output a Brick.

---

# 96. Universal Metallurgy Family

Canonical metallurgy supports:

- ore/source extraction;
- concentration/separation;
- smelting/refining;
- bloom/billet/ingot production;
- alloying;
- casting;
- rolling;
- drawing;
- forging/forming;
- remelting/recycling.

Ore is not the refined metal.

Alloy composition remains explicit.

---

# 97. Universal Glass / Crystal Family

Canonical processing may include:

- source preparation;
- melting/forming where applicable;
- annealing;
- cutting;
- polishing;
- lens forming;
- calibration/charging where applicable;
- specialist transformation.

Specialist glass identities such as Memory Glass, Lucid Glass, Stormglass, Ventglass and Hellglass are not interchangeable merely because they share a vitreous superclass.

---

# 98. Universal Fibre / Textile Family

Canonical textile processing may include:

- harvesting;
- cleaning/retting;
- combing;
- spinning;
- twisting;
- weaving;
- felting;
- binding;
- specialist transformation.

Actual exact fibre remains known through the chain.

---

# 99. Biological Material Processing

Biological processing may include:

- harvesting;
- butchery or non-lethal collection where applicable;
- curing;
- tanning;
- preservation;
- cooking;
- extraction;
- fermentation;
- biological formulation.

Personhood/creature ownership rules remain external constraints and may affect legality or source availability.

---

# 100. Fluid / Chemical Processing

Fluid processing may include:

- mixing;
- dissolving;
- filtering;
- distillation;
- concentration;
- heating/cooling;
- fermentation;
- reaction;
- containment transfer.

Composition-bearing solutions/brines retain actual composition rather than becoming generic “Potion Fluid” unless an authored transformed product genuinely exists.

---

# 101. Energetic Resource Processing

Physical energetic matter, stored charge and fields remain distinct.

A recipe may:

- consume physical energetic matter;
- transfer charge;
- require a field/environment;
- install an energetic component.

These are not interchangeable operations.

---

# 102. Overworld Recipe Foundation

Overworld recipes establish the broad ordinary process baseline used by all realms.

The definitive recipe system must support canonical Overworld chains for:

- timber;
- masonry;
- ceramics;
- ordinary metallurgy;
- ordinary glassworking;
- textiles;
- fuels;
- agriculture/food where owned by current content;
- ordinary machine components;
- magical-material handling where already authored.

FCC-13C does not invent every food/equipment recipe merely because an old POC row existed.

---

# 103. Verdant Recipe Binding

Verdant material relationships from locked canon must bind through the universal process system plus specialist requirements where necessary.

Examples include:

- Greatheart/Dawnwood/Bloomwood → eligible timber forms;
- Living Heartwood → preserved living joinery/components;
- Season Sap → Refined Season Sap → Seasonal Resin;
- Thornsilver Fibre → Thread/Cord/Cloth/Lattice;
- Pollen Amber → clarified/optical forms;
- Bloomstone → tuned/stabiliser components;
- Rootstone → cut/masonry forms.

The existing Verdant realm-local recipe catalogue remains a source contract, but final executable rows use FCC-13C's global recipe schema.

---

# 104. Ancestral Recipe Binding

Ancestral chains include:

- Memory Stone → masonry forms;
- Spirit Clay → ceramic products/forms;
- Memory Glass → pane/lens/plate;
- Oathbone → authorised fittings/seals/components;
- Veil Silk → thread/cloth;
- Soul Silver → ingot/plate/wire/fittings;
- Soulwood → timber forms;
- Ancestor Ash → mixtures/inks/mortar where authored.

Spirit-active/memory-safe handling may supplement ordinary physical processing.

---

# 105. Somnolent Recipe Binding

Somnolent chains include:

- Dreamstone → masonry forms;
- Reverie Wood → timber forms;
- Waking Stone → structural/machinery forms;
- Nightmare Sap → Nightmare Resin;
- Lucid Glass → optical/interface forms;
- Memory Thread → textile/binding forms;
- Omen Dust + valid formulation → Prophecy Ink;
- Coherence Core and other authored components → assembly recipes.

Fate Glass and Abyssal Dream Glass remain Lucid Glass state/product relationships rather than new base-material recipes.

---

# 106. Ascendant Recipe Binding

Ascendant chains include:

- Cloudstone → structural/masonry forms;
- Skyiron → normal metal forms where eligible;
- Skyiron → Celestial Metal through validated specialist transformation;
- Skyiron → Storm Metal through persistent storm transformation;
- Celestial Metal → Concord Metal formulation;
- Steel + approved Ascendant/Celestial inputs → Saint Steel;
- Stormglass → Halo Glass;
- Windspun Fibre → Grace Thread;
- Hymnstone → resonator/inscribed component forms.

High-Aether and Sacred-Law capabilities apply only where the actual process requires them.

---

# 107. Impossible Deep Recipe Binding

Impossible Deep chains include:

- Pressure Stone → masonry/structural forms;
- Bone Stone → Emberbone transformation where canonical conditions are met;
- Abyssal Iron → concentrate/ingot/plate/etc.;
- Seismic Crystal → shard/component/calibration forms;
- Pressure Pearl → component forms;
- Ventglass → structural/optical components;
- Pressure Resin → seals;
- Black Brine Salt → reagents;
- Gravity Nodule → gravity/orientation components;
- Deepfire Ember → contained energetic components;
- Resonance Wood → eligible timber forms;
- Fossil Alloys → archaeological recovered/reworked alloy content.

Extreme-pressure/gravity/Blackwater-safe capability applies only where required.

---

# 108. Ashen Recipe Binding

Ashen chains include:

- Basalt → universal Basalt masonry forms;
- Infernal Ash → compacted/chemical/construction products where authored;
- Ember Iron → ordinary eligible metal forms;
- Ember Iron → Contract Iron through contract binding;
- Chain Metal → manufactured alloy/formulation;
- Infernal Alloy → advanced manufactured alloy/formulation;
- Hellglass → forms and Ash Glass/Sootglass lineage where authored;
- Cinderhide → processed hide products;
- Cinderwood → timber forms;
- Black Ember / Cold Fire / Furnace Heart → containment/install operations.

Ash Brick remains the canonical construction lineage replacing legacy Infernal Brick terminology.

---

# 109. Transformation Lineage Protection

The following transformations must remain explicit rather than being flattened into generic form conversion:

- Season Sap → Refined Season Sap;
- Season Sap → Seasonal Resin;
- Nightmare Sap → Nightmare Resin;
- Bone Stone → Emberbone;
- Ember Iron → Contract Iron;
- Skyiron → Celestial Metal;
- Skyiron → Storm Metal;
- Celestial Metal → Concord Metal;
- Stormglass → Halo Glass;
- Windspun Fibre → Grace Thread;
- compatible Ashen inputs → Chain Metal;
- compatible Ashen inputs → Infernal Alloy;
- Steel + approved inputs → Saint Steel.

These are transformed-material/product relationships, not ordinary form recipes.

---

# 110. State-Change Recipe Protection

The following should not create duplicate base materials:

- Bloomstone → seasonal/tuned Bloomstone;
- Lucid Glass → Fate/Abyssal Dream states/products;
- Seismic Crystal → Orientation/Compressed/Coreward states/forms;
- Pressure Pearl → Blackwater provenance/state;
- Abyssal Iron source → Gravity Ore deposit/state;
- charge/attunement operations;
- corruption/cleansing where the material identity remains continuous.

Recipe output category must be `state` or appropriate authored product, not arbitrary new material.

---

# 111. Standard Machine Component Recipes

Machine components should generally be authored archetypes with provider/material slots.

Examples:

- Gear;
- Shaft;
- Machine Frame;
- Fastener;
- Pipe Section;
- Chute Segment;
- Seal;
- Vessel.

A Gear recipe should request:

- compatible material;
- valid form/process capability;
- output Gear archetype retaining chosen material.

Do not create unrelated Copper Gear/Iron Gear ontologies when one material-aware Gear archetype is sufficient.

---

# 112. Precision Metal Fitting

`Precision Metal Fitting` is a reusable component archetype/provider result.

Its recipe may accept qualifying workable metals and requires appropriate precision-forming capability.

The output stores actual selected metal.

Portal-specific quantities/uses remain FCC-13D.

---

# 113. Magical-Conductive Insert Pattern

Where an authored magical-conductive insert is required, its component recipe may combine:

- a conductive physical material;
- a magical conductor/charge-bearing material;
- assembly/forming capability.

Exact portal-specific Mana-Conductive Insert binding is finalised in FCC-13D.

FCC-13C forbids a generic “Magic Part” placeholder that erases the constituent materials.

---

# 114. Stabiliser Core Pattern

Stabiliser components are authored objects where the assembly itself has persistent function.

Examples include:

- Bloomstone Stabiliser Core;
- Coherence Core;
- Deep Anchor;
- Thermal Stabiliser Module.

They retain material/component composition and may carry state/calibration.

---

# 115. Recipe Learning

A recipe may be:

- known by default;
- learned through research;
- discovered archaeologically;
- taught by NPC/faction;
- unlocked through experimentation;
- granted by authority/outcome.

The recipe record references knowledge conditions rather than owning the entire discovery system.

---

# 116. Recipe Visibility

Unknown recipes need not reveal all details.

However, the system should be capable of differentiating:

- unknown recipe;
- known recipe lacking materials;
- known recipe lacking capabilities;
- known recipe blocked by permission/environment.

Exact UI design remains downstream.

---

# 117. Recipe Versioning

Normal balance changes retain the same recipe ID.

A semantic recipe replacement uses:

- new recipe ID where needed;
- old recipe migration alias/redirect;
- learned-recipe migration policy.

---

# 118. Recipe Removal

A removed recipe with no valid replacement is not silently redirected to unrelated content.

Learned-recipe history may be retained in migration metadata while active craftability is removed.

FCC-13E finalises legacy migration tables.

---

# 119. Generated Recipe Identity

Ordinary generated form conversion may derive its recipe identity deterministically from:

- source material/form;
- target form;
- process profile.

The implementation may materialise generated recipe rows for tooling/performance.

The semantic relationship remains deterministic.

---

# 120. Generated Recipe Migration

Old explicit standard-form recipes may redirect to generated conversion profiles where source material/form can be recovered.

This applies to old generic:

- planks;
- beams;
- wire;
- plates;
- panes;
- brick/masonry;
- slabs/stairs.

Migration must not lose actual source material.

---

# 121. Recipe and Forge Integration

Forge recipe authoring should expose distinct fields for:

- exact material;
- provider expression;
- form;
- state;
- quality/provenance threshold;
- process capability;
- environment;
- knowledge;
- output category;
- quantity;
- by-products;
- provenance/quality transformation.

Authors should not encode all of this into one opaque text recipe.

---

# 122. Provider Browser

Forge/authoring tooling should be able to answer:

> Which current materials satisfy this provider requirement?

The browser should display **why** candidates qualify or fail.

This makes provider-based blueprints and recipes auditable.

---

# 123. Station Capability Browser

Forge/authoring tooling should similarly answer:

> Which current stations/assemblies can execute this process contract?

The result should be derived from capabilities/environment rather than manually duplicated per recipe.

---

# 124. Recipe Simulation Validation

Before content is accepted, tooling should be able to verify:

- input identities exist;
- forms are eligible;
- providers have at least one current solution where intended;
- output identity exists;
- conservation balances;
- required capability can be provided somewhere in intended progression;
- no test-only content is mandatory to canon recipes;
- no compatibility-only object enters ordinary progression.

---

# 125. Automation Reservation Rule

Automation must reserve actual input stock before irreversible processing begins.

For multi-input machines:

- reservations are atomic/coherent;
- cancelled operations release reservation;
- completion consumes once;
- reload cannot duplicate reserved stock.

This carries forward the tested POC conservation principle.

---

# 126. Automation Output Rule

A process may not consume inputs if its output cannot be committed safely unless the machine explicitly supports buffered/held output.

This prevents silent loss from blocked inventories.

---

# 127. Automation Provider Selection

An automated system may select provider materials only when:

- the recipe is provider-based;
- policy/filter permits that material;
- all thresholds pass.

It must never substitute another material into an exact-material slot.

---

# 128. Automation Preference

Automation may use preference policies such as:

- cheapest valid;
- nearest stock;
- preserve rare material;
- prefer specified material;
- culture/quality preference.

Preference belongs automation/planning policy, not recipe eligibility.

---

# 129. Repair and Automation

Automated maintenance may use the same repair transaction if it can satisfy:

- diagnostics;
- access;
- materials/components;
- capability;
- permissions.

There is no automatic magical repair shortcut.

---

# 130. Project Automation

Construction automation may deliver and install project materials using the same reservation/commit model.

It must preserve actual material choice and component identity.

---

# 131. Recipe Safety

Hazardous recipes may require explicit safety capabilities such as:

- containment;
- shielding;
- cooling;
- ventilation;
- pressure control;
- remote handling.

A recipe being technically possible does not imply it is safe without the required environment.

---

# 132. Failure Outcomes

Where simulation supports failures, a failed process may produce:

- damaged input;
- waste;
- hazard;
- incomplete product;
- machine damage.

Failure outcomes must be authored/systemic and physically meaningful rather than arbitrary RNG deletion.

---

# 133. No Wrong-Realm Recipe Lockout

> **A valid material/tool/station is not rejected solely because it originated in another realm.**

If all exact/provider/capability/environment requirements are satisfied, the process may execute.

This is a locked FCC-12/FCC-13 principle.

---

# 134. Stronger Capability Substitution

A stronger legitimately acquired capability may satisfy an earlier lower capability requirement where the required process is actually supported.

This enables non-linear progression without turning all recipes into universal provider slots.

---

# 135. Exact Ritual / Contract Exceptions

Some processes remain exact because the identity/context is the mechanic.

Examples:

- Contract Iron binding;
- unique portal component construction;
- authority-recognised ritual processes.

Stronger generic equipment does not bypass an exact ritual/context requirement.

---

# 136. Recipe Quantity Ownership Boundary

FCC-13C locks the global ordinary conversion yields listed here.

It does not invent exact quantities for every current item/food/equipment recipe not already resolved by the FCC-13 interview/source canon.

Those require owning content evidence.

This prevents prototype recipes from becoming canon through absence of review.

---

# 137. Portal Quantity Boundary

Portal component and construction quantities are FCC-13D-owned.

FCC-13C supplies:

- recipe schema;
- provider semantics;
- global material accounting;
- repair/project architecture;
- reusable component/process rules.

Covenant source-locked quantities and accepted Q133–Q238 decisions are written definitively in FCC-13D.

---

# 138. Legacy POC Recipe Boundary

POC recipes are migration evidence only.

They may:

- redirect to canonical recipes;
- become generated form conversions;
- become compatibility recipes;
- be retired;
- be retained as test fixtures.

Their old station names, yields and generic materials do not override FCC-13C.

---

# 139. Generic Stone Recipe Migration

Old recipes requesting generic Stone must resolve to:

- actual known source stone; or
- a structural/stone provider slot where the recipe's mechanic is genuinely flexible.

They must not recreate a universal hidden Stone material.

---

# 140. Generic Plant Fibre Recipe Migration

Old recipes requesting Plant Fibre must resolve to:

- exact fibre when provenance/content is known;
- Mixed Plant Fibre where a real mixed bundle is intended;
- fibre provider requirement where the recipe is flexible.

---

# 141. Duplicate Block/Item Recipe Migration

Recipes targeting old duplicate Block/Item rows redirect to the one canonical physical object/material-form identity.

Example:

old Stone Brick Item and Block recipes both target the current actual-stone + brick form relationship.

---

# 142. Machine Recipe Migration

An old recipe bound to one POC station may migrate to:

- the same retained station as a default capability provider;
- a general capability process;
- a deprecated compatibility recipe.

Migration depends on whether the current process remains canonically supported.

---

# 143. Recipe Registry Minimum Contract

A final recipe record should conceptually support:

- stable recipe ID;
- input slots;
- input mode: exact/provider;
- material/component reference;
- form requirement;
- state predicates;
- quality/provenance predicates;
- quantities/material amounts;
- process capabilities;
- environment;
- knowledge/permission;
- outputs;
- output category;
- by-products/waste;
- provenance policy;
- quality policy;
- automation compatibility;
- project/repair mode where applicable;
- migration aliases/status.

Exact serialization is technical.

---

# 144. Process Capability Minimum Contract

A process capability definition should conceptually support:

- stable capability ID;
- capability level/strength where meaningful;
- compatible process families;
- environmental ranges;
- safety limitations;
- automation support;
- provider station list generated by query.

The final technical schema must remain data-driven.

---

# 145. Station Minimum Contract

A station/object capable of processing should expose:

- object ID;
- capabilities;
- supported environment;
- input/output interfaces;
- power/heat/mana requirements;
- efficiency modifiers;
- safety features;
- automation support;
- state/condition.

Named station identity remains separate from recipe identity.

---

# 146. Project Minimum Contract

A staged project definition should support:

- blueprint/project ID;
- phases;
- exact inputs;
- provider inputs;
- quantities;
- capability requirements;
- reservations;
- delivered stock;
- incorporation rules;
- salvage/recovery;
- completion state.

---

# 147. Repair Minimum Contract

A repair operation should support:

- target object/slot;
- damage state;
- exact/provider replacement material;
- quantity;
- capability;
- recovered damaged component/scrap;
- resulting state.

---

# 148. Recipe Validation Gates

Future build/CI validation should detect:

- missing exact input target;
- impossible material/form pair;
- provider with no legal candidate where one is required;
- invalid output domain;
- recipe output material violating FCC-12 transformation rules;
- negative or duplicating conservation balance;
- missing process capability;
- test/compat content in canonical mandatory recipe;
- alias loop;
- recipe with unavailable mandatory first-access dependency.

Portal reachability is additionally audited in FCC-13D/FCC-14.

---

# 149. Worked Example — Iron Wire

Recipe concept:

Input:
- Iron + Ingot form × 1.

Capability:
- metal drawing/forming.

Output:
- Iron + Wire form × 8 standard lengths.

Output category:
- same material / new form.

Conserved material:
- one ingot-equivalent.

---

# 150. Worked Example — Basalt Slabs

Input:
- Basalt + full block form × 1.

Capability:
- stone cutting.

Output:
- Basalt + Slab form × 2.

Output category:
- same material / new form.

No generic Stone material is introduced.

---

# 151. Worked Example — Timber Planks

Input:
- eligible exact timber + Log form × 1.

Capability:
- sawing.

Output:
- same timber + Plank form × 4.

A hand-splitting variant may instead yield:
- 3 Planks;
- recoverable Wood Offcuts.

---

# 152. Worked Example — Ceramic Brick

Input:
- valid clay/ceramic feedstock amount.

Capabilities:
- shaping;
- firing;
- appropriate heat control.

Output:
- fired ceramic + Brick form × 4 standard bricks.

Output category:
- transformation to ceramic where needed, then physical form.

---

# 153. Worked Example — Contract Iron

Input:
- exact Ember Iron material in valid process form;
- any additional exact/provider inputs defined by the universal contract framework.

Requirements:
- contract-binding capability;
- valid contract context;
- operator knowledge/authority where required.

Output:
- Contract Iron.

Output category:
- transformed material.

An ordinary stronger forge cannot bypass the contract requirement.

---

# 154. Worked Example — Filled Dreamwater Vessel

Inputs:
- valid empty vessel object;
- exact Dreamwater quantity.

Capability:
- safe fluid transfer/containment where required.

Output:
- same vessel containing Dreamwater.

Output category:
- composite object state.

Dreamwater remains Dreamwater.

---

# 155. Worked Example — Repairing a Provider-Based Machine Frame

Target:
- damaged machine frame slot.

Input:
- material satisfying the original frame provider threshold.

Capability:
- repair/assembly.

Output:
- same machine archetype with repaired frame state and recorded actual material.

A different valid provider may be used only where design permits substitution.

---

# 156. Worked Example — Repairing a Coherence Core

Target:
- damaged Coherence Core.

Input:
- exact identity-bearing component/material requirements from its authored recipe.

Provider substitute:
- not permitted unless explicitly authored.

Output:
- same Coherence Core identity with repaired state.

---

# 157. Worked Example — Construction Project

A large machine or portal phase may request:

- structural provider materials;
- exact core component;
- fittings;
- capability;
- delivered stock.

When the phase commits:

- delivered materials become incorporated;
- exact core becomes installed;
- project state advances;
- stock is consumed once.

---

# 158. FCC-13C Ownership Boundary

FCC-13C owns:

- recipe stable-ID semantics;
- exact/provider input model;
- form/state/quality/provenance recipe constraints;
- process capability architecture;
- named-station provider doctrine;
- output-category architecture;
- conservation;
- global ordinary conversion yields;
- fluids/gas quantity semantics;
- repair transaction model;
- project/reservation model;
- salvage/recycling principles;
- specialist process-capability layers;
- current realm transformation binding rules.

FCC-13C does **not** own the six final portal construction contracts.

---

# 159. FCC-13D Handoff

FCC-13D will consume this recipe model to write the final exact contracts for:

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

It will bind:

- exact component recipes;
- exact first-access quantities;
- provider slots;
- portal project phases;
- repair/recovery;
- upgrades;
- dependency graph.

---

# 160. FCC-13E Handoff

FCC-13E will use the final recipe IDs/process architecture to migrate:

- old POC recipes;
- learned-recipe saves;
- station-bound prototype recipes;
- generic-material recipes;
- duplicate Block/Item recipes.

It may not redefine the canonical recipe model.

---

# 161. Technical / Forge Handoff

The implementation must be capable of representing:

- exact and provider input slots;
- deterministic generated conversions;
- fixed-point material amounts;
- capability/environment validation;
- provenance/quality predicates;
- by-products/waste;
- reservations;
- repair/project transactions;
- automation through the same validator;
- stable migration aliases.

---

# 162. Decision Trace

FCC-13C directly carries locked interview decisions:

- Q65–Q92 — Recipe Record Architecture & Provider Semantics;
- Q93–Q112 — Quantities, Conservation, Repair & Projects;
- Q69 provider-expression architecture;
- Q77–Q82 capability/station/automation rules;
- Q83 output-category classification;
- Q84–Q90 by-product, waste, scrap, recycling, provenance, quality and provider-performance rules;
- Q93–Q100 global form-conversion yields;
- Q101–Q104 quantity/container architecture;
- Q105–Q111 recovery/repair/projects/salvage;
- realm-processing relationships inherited from FCC-12 and Steps 1C–1D.

Portal-specific Q133–Q238 bindings remain for FCC-13D.

---

# 163. FCC-13C Completeness Gate

- [x] recipe stable-ID architecture locked
- [x] recipe domains established
- [x] exact-material input locked
- [x] exact-component input locked
- [x] provider input locked
- [x] form requirement separated
- [x] state predicates separated
- [x] quality/grade/purity predicates separated
- [x] provenance predicates separated
- [x] knowledge condition separated
- [x] legal/contract condition separated
- [x] environmental requirements locked
- [x] process-capability architecture locked
- [x] exact named-station exception test locked
- [x] alternative station resolution locked
- [x] operator knowledge separation locked
- [x] automation uses same validator
- [x] output categories locked
- [x] by-product policy locked
- [x] waste/loss policy locked
- [x] scrap/offcut policy locked
- [x] recycling policy locked
- [x] provenance carry-through locked
- [x] quality carry-through locked
- [x] provider performance variation locked
- [x] recipe validation feedback locked
- [x] physical conservation locked
- [x] fixed-point material amount architecture locked
- [x] timber yield locked
- [x] stone/slab/stair/wall/pillar yields locked
- [x] metal plate/rod/wire yields locked
- [x] fibre/thread/cord/cloth yields locked
- [x] glass pane/lens baseline locked
- [x] ceramic brick/tile yields locked
- [x] specialist yield override rule locked
- [x] fluid quantity semantics locked
- [x] gas quantity semantics locked
- [x] filled-container process locked
- [x] installed component recovery locked
- [x] repair architecture locked
- [x] provider repair substitution locked
- [x] staged projects locked
- [x] project reservation locked
- [x] dismantling/salvage locked
- [x] mixed-scrap refining requirement locked
- [x] specialist process-capability families preserved
- [x] all current realm transformation families routed through universal process architecture
- [x] old POC recipe authority explicitly demoted
- [x] FCC-13D portal ownership preserved
- [x] FCC-13E migration ownership preserved

---

# 164. FCC-13C Result

> **FCC-13C — DEFINITIVE RECIPE, PROCESS, PROVIDER & QUANTITY REGISTRY — CANON WRITING COMPLETE v0.1**

FCC-13 now has:

- stable identity architecture;
- definitive physical projection/form architecture;
- executable recipe semantics;
- global material-conservation rules;
- provider/capability processing;
- global ordinary conversion yields;
- repair/salvage/project transaction rules;
- realm-processing relationships bound to one universal process framework.

The next document is:

> **FCC-13D — Realm Portal Components, Recipes & Access Binding**

FCC-13D will now write the six exact Realm Access construction contracts and the accepted hybrid portal dependency graph using the recipe/object architecture already locked by FCC-13A–C.

FCC-13 remains pending D–E and the final fidelity audit before formal lock.

---

**End of FCC-13C v0.1**
