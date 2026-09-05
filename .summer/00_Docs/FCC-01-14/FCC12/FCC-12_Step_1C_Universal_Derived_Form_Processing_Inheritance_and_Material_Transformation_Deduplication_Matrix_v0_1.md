# Leyforge Final Content Canon Collection

## FCC-12 — Universal Materials, Processing & Derived Forms
### Step 1C — Universal Derived-Form, Processing-Inheritance & Material-Transformation Deduplication Matrix

**Version:** 0.1  
**Status:** Source-Reconciliation Working Document — Universal Form/Process Architecture Proposed for Interview, Not Yet Final-Locked  
**Date:** 27 August 2026  
**Consumes:** FCC-12 Steps 1A–1B; FCC-01C/J; FCC-02/03/04/05/06/08 material/processing handoffs; universal single-definition and capability rules; legacy POC registry as migration evidence only.  
**Next Step:** FCC-12 Step 1D — Interview Architecture & Completeness Map.

---

# 1. Purpose

Step 1A established the complete current material corpus.

Step 1B established the cross-realm identity/lineage/state/alias relationships.

Step 1C now addresses the combinatorial problem:

> **How do hundreds of materials become useful Blocks, Items, construction parts, machine inputs and processed products without multiplying into thousands of redundant definitions?**

The core goals are:

- define universal **derived-form families**;
- define universal **processing families**;
- define which material classes may inherit which forms/processes;
- distinguish **form** from **material identity**;
- distinguish **process state** from **new material identity**;
- identify when a realm process is truly special versus merely a special condition/mode;
- prevent `material × every possible form × every possible state` registry explosion;
- preserve meaningful physical/gameplay differences;
- prepare a clean FCC-13 registry handoff.

This document is structural.

It does not yet finalise exact recipe quantities, station times, energy costs or definitive Block/Item rows.

---

# 2. Core Rule — Material Identity and Physical Form Are Separate Axes

A material answers:

> **What is this made of?**

A form answers:

> **What physical shape/product form is it currently in?**

Examples:

- Granite → rough block / cut block / brick / slab / stair / rubble.
- Oak Heartwood → log / board / beam / post / shingle.
- Iron → ore/concentrate / ingot / plate / rod / wire.
- Thornsilver Fibre → raw fibre / cord / lattice.
- Lucid Glass → raw chunk / pane / lens / shard.

The system must not invent a new “material” every time shape changes.

---

# 3. Core Rule — Not Every Material Inherits Every Form

A universal form family does **not** imply universal eligibility.

Examples:

- stone can support slab/stair/wall/brick;
- metals can support wire/plate/rod if ductile/forgeable enough;
- brittle crystals may support shard/lens/plate but not wire;
- soft biological tissues may not support structural beams;
- gases cannot become solid bricks merely because every other material has a Block form.

Eligibility must come from:

- material class;
- mechanical properties;
- processing capability;
- actual gameplay role.

---

# 4. Universal Derived-Form Classes

The following are the major universal form families FCC-12 should consider.

| Form Family | Typical Material Classes | Meaning |
| --- | --- | --- |
| **Raw Natural Form** | stone, ore, wood, crystal, biological | World/native harvested form. |
| **Chunk / Lump** | mineral, crystal, ore, resin, biological hard material | Portable rough fragment. |
| **Powder / Dust** | mineral, crystal, reagent, plant, metal | Ground particulate form. |
| **Granule / Salt / Meal** | salts, grains, processed plant, mineral | Coarse particulate product. |
| **Shard** | crystal, glass, brittle mineral | Broken/cut fragment. |
| **Block / Brick** | stone, ceramic, glass, compacted material | Construction-scale solid unit. |
| **Slab / Stair / Wall** | masonry/timber/compatible solid | Construction geometry variant. |
| **Tile / Shingle** | ceramic, stone, wood, metal | Thin construction/weatherproof form. |
| **Board / Plank** | wood/timber | Sawn flat structural form. |
| **Beam / Post** | wood, metal, stone where justified | Structural linear form. |
| **Rod / Bar** | metal, wood, crystal where justified | Narrow structural/crafting form. |
| **Wire** | ductile metal/fibre | Conductive or fastening line form. |
| **Sheet / Plate** | metal, glass, some organic materials | Thin flat structural form. |
| **Foil / Leaf** | highly ductile metals | Very thin sheet. |
| **Cord / Rope** | fibre, hide strip, magical fibre | Flexible load-bearing line. |
| **Thread / Yarn** | fibre/silk | Fine textile precursor. |
| **Cloth / Fabric** | fibre/thread | Woven textile. |
| **Felt / Mat** | fibre | Compressed textile form. |
| **Lattice / Mesh** | fibre, wire, magical strand | Open network material form. |
| **Pane** | glass | Window/optical construction form. |
| **Lens** | glass/crystal/amber | Optical/sensing form. |
| **Inlay / Gem Cut** | gems/crystals | Decorative/functional fitted form. |
| **Billet / Bloom** | metal | Intermediate metallurgical form where process warrants it. |
| **Ingot** | metal/alloy | Cast/refined portable metal form. |
| **Gear / Mechanical Blank** | metal, hard wood, specialist material | Functional manufactured part. |
| **Fastener** | metal/wood | Nail, peg, bolt, rivet class. |
| **Containerised Fluid** | liquid | Bottle, flask, can, barrel, tank content state. |
| **Compressed Gas Container** | gas | Cylinder/canister/tank content state. |
| **Paste / Slurry** | clay, pigment, reagent, food, chemical | Semi-fluid processed form. |
| **Resin / Pitch / Wax Product** | sap/resin/wax | Processed binding/sealing material. |
| **Core / Cartridge / Cell** | energetic/magical material | Manufactured functional package. |

These are **candidate universal form classes** for interview.

---

# 5. Stone / Masonry Form Inheritance

Compatible stone families may inherit:

- raw natural block;
- rough rubble;
- cut block;
- brick;
- slab;
- stair;
- wall;
- pillar/column segment;
- arch/trim where construction supports authored geometry;
- crushed aggregate;
- powder where materially justified.

Not every stone needs every decorative piece as a wholly unrelated stable material definition.

Where the Forge/building system can safely parameterise geometry by material, prefer:

> **shape definition + material identity**

over one disconnected Block family per material/shape pair.

---

# 6. Soil / Clay / Ceramic Form Inheritance

Soils remain world substrates first.

Likely universal relationships:

- soil terrain/block form;
- loose soil/earth Item only where gameplay needs it;
- clay-bearing source;
- raw clay lump;
- ceramic feedstock;
- fired brick;
- roof tile;
- vessel/pot;
- refractory ceramic where composition permits.

A soil family is not automatically a clay family.

Examples:

- Sandy Soil does not become ceramic feedstock merely because it is soil.
- White Kaolin is a specialised clay/mineral source.
- River Clay is a source/deposit relationship rather than a ninth soil family.

---

# 7. Wood / Timber Form Inheritance

Candidate universal wood forms:

- log;
- stripped log;
- split timber;
- board/plank;
- beam;
- post;
- pole;
- rod/dowel;
- shingle;
- panel;
- veneer;
- peg;
- charcoal where chemistry permits;
- sawdust/wood chips where gameplay warrants.

Ordinary conditions such as wet, dry, seasoned, weathered, charred or rot-affected should usually be state/property rather than new base wood materials.

Specialist woods may inherit ordinary forms only where processing preserves defining behaviour:

- Living Heartwood may require living-compatible processing.
- Soulwood may require spirit-active handling.
- Reverie Wood may require coherence-safe treatment.
- Resonance Wood may preserve seismic/acoustic properties only in some forms/orientations.

---

# 8. Metal Form Inheritance

Applicable metals/alloys may support:

- ore;
- concentrate;
- bloom/billet;
- ingot;
- bar/rod;
- plate/sheet;
- wire;
- foil;
- fastener;
- gear blank;
- chain link;
- tool blank;
- armour plate;
- pipe/tube;
- powder where justified.

Eligibility depends on:

- castability;
- forgeability;
- ductility;
- conductivity;
- corrosion resistance;
- hardness;
- heat resistance;
- magical compatibility.

Universal form family does not mean universal physical eligibility.

---

# 9. Alloy / Formulation Architecture

Alloys remain distinct from native ore identities.

Examples:

- Bronze;
- Steel;
- Saint Steel;
- Chain Metal;
- Infernal Alloy;
- Concord Metal where formulation applies;
- Fossil Alloys as archaeological manufactured category.

Each alloy should identify:

- source material classes;
- process family;
- output material identity;
- whether composition variations are grades/states or separate alloys.

No `Steel Ore`, `Saint Steel Ore` or `Infernal Alloy Ore`.

---

# 10. Glass / Crystal Form Inheritance

Applicable glass/crystal materials may support:

- raw chunk;
- shard;
- powder;
- pane;
- plate;
- lens;
- rod;
- inlay;
- polished gem;
- optical component;
- core/component where manufactured.

Brittle materials do not inherit metal forms just because both are hard solids.

---

# 11. Pearl / Biomineral Form Inheritance

Pearl-like biominerals may share:

- raw pearl;
- polished pearl;
- drilled/fitted pearl;
- powder;
- inlay;
- lens/core only where properties justify.

A pearl superclass must not imply absurd products like `Pressure Pearl Wire`.

---

# 12. Fibre / Thread / Textile Form Inheritance

Candidate chain:

> raw fibre → cleaned fibre → cord/thread/yarn → rope/lattice/cloth/felt

Different fibres may skip stages.

Examples:

- Thornsilver Fibre may directly support specialist cord/lattice.
- Veil Silk may naturally begin closer to thread.
- Windspun Fibre may produce Grace Thread after attunement.
- Willowreed may produce coarse strip/fibre rather than fine yarn.

---

# 13. Hide / Chitin / Biological Hard-Material Forms

Potential shared forms:

- hide;
- cured hide;
- leather;
- strip;
- plate;
- scale panel;
- chitin plate;
- shell fragment;
- bone;
- carved bone;
- horn/tusk;
- powder/meal where justified.

Creature anatomy remains the source owner.

---

# 14. Sap / Resin / Wax / Oil Architecture

Important distinctions:

- sap = fluid/semi-fluid biological exudate;
- resin = naturally thickened or processed product;
- amber-like material = hardened/fossilised resinous solid;
- wax = distinct pliable solid;
- oil = fluid lipid/hydrocarbon product.

Universal processing can include:

- tapping;
- filtering;
- heating;
- pressing;
- curing;
- distillation;
- hardening;
- blending.

One source does not inherit every product automatically.

---

# 15. Fluid Representation

A fluid may exist as:

- world volume;
- machine/tank amount;
- container content;
- bottle/flask;
- barrel;
- canister;
- pipeline flow.

These should not become separate material identities merely because containment changes.

Examples:

- ordinary Water;
- Dreamwater;
- oil;
- brine;
- sap;
- alchemical liquids.

---

# 16. Gas / Aerosol Representation

A gas/aerosol may exist as:

- ambient volume;
- pressurised tank;
- canister;
- machine buffer;
- released cloud;
- dissolved component.

Examples:

- Aether Gas;
- Heat Gas;
- Sunmist where containment is supported.

A gas container Item is not the gas material itself.

---

# 17. Powder / Dust / Granule Representation

Candidate particulate forms:

- dust;
- powder;
- granule;
- meal;
- salt;
- ash;
- crushed mineral;
- pigment.

The particulate may be:

- the same material in smaller physical form;
- a processed compound;
- a mixture;
- a distinct chemical product.

Examples:

- Mana Dust can be a derived Raw Mana Crystal form.
- Prophecy Ink is a formulation, not Omen Dust liquid-state.
- Sea Kelp Meal is a processed product.

---

# 18. Energetic Resource Representation

Energetic resources require a different architecture from ordinary solids.

Possible classes:

- energy-bearing physical material;
- charge state;
- captured phenomenon;
- stored-energy component;
- fuel;
- magical reagent;
- environmental field.

Examples:

- Black Ember;
- Deepfire Ember;
- Cold Fire;
- Lightning Core;
- Lightning Essence;
- Raw Mana Crystal;
- mana charge;
- Furnace Heart;
- Dream Mote.

Do not force all of these into one generic `Fuel Item` or `Crystal Item`.

---

# 19. Manufactured Component Boundary

A component is a designed functional object produced from materials.

Examples:

- Covenant Heart;
- Coherence Core;
- Furnace Core;
- stabiliser core;
- lens;
- gear;
- rune plate;
- battery;
- cartridge.

Material identity and component identity remain separate.

A component may carry:

- primary/secondary material;
- energy;
- attunement;
- configuration;
- condition.

---

# 20. Universal Processing Families

Broad process families to test as universal:

## Mechanical separation
- cutting;
- sawing;
- splitting;
- crushing;
- grinding;
- milling;
- pulverising;
- drilling;
- carving;
- polishing.

## Sorting / cleaning
- washing;
- screening;
- sieving;
- sorting;
- grading;
- decontaminating;
- separating.

## Thermal
- drying;
- firing;
- baking;
- roasting;
- calcining;
- smelting;
- melting;
- casting;
- annealing;
- tempering;
- heat treatment.

## Mechanical forming
- forging;
- hammering;
- rolling;
- pressing;
- drawing;
- extrusion;
- bending;
- spinning;
- weaving;
- felting.

## Chemical / biological
- fermentation;
- curing;
- tanning;
- extraction;
- leaching;
- distillation;
- precipitation;
- crystallisation;
- oxidation/reduction;
- alchemical reaction.

## Assembly / fabrication
- joining;
- riveting;
- bolting;
- pegging;
- stitching;
- brazing/soldering where applicable;
- welding where technology supports;
- runic assembly;
- component assembly.

---

# 21. Processing Capability Model

A station should provide capabilities rather than exclusively own material-specific recipes.

Example furnace capabilities:

- controlled heat;
- smelting;
- firing;
- calcining.

Forge capabilities:

- high-temperature work;
- hammering;
- shaping;
- tempering.

Other examples:

- loom → weaving;
- pressure chamber → high-pressure treatment;
- spirit-active workshop → spirit-safe handling.

This allows multiple compatible stations to satisfy one process.

---

# 22. Universal Process + Realm-Special Mode

Many realm-special processes may actually be:

> **universal process + specialist capability/environment**

Examples:

- Verdant: ordinary cutting/pressing + living-material preservation
- Ancestral: ordinary shaping/firing + spirit-active handling
- Somnolent: ordinary glass/textile/chemical work + coherence stabilisation
- Ascendant: ordinary forging/glass/textile work + High-Aether/law/divine attunement
- Impossible Deep: ordinary forging/cutting/crystal work + extreme pressure/gravity control
- Ashen: ordinary metallurgy/glasswork + infernal heat/contract-binding conditions

This is preferable to creating one totally separate industry per realm unless the process really is unique.

---

# 23. Candidate Realm-Special Processing Capabilities

Provisional capability/mode candidates:

- living-material preservation
- seasonal attunement
- spirit-active handling
- memory preservation
- coherence stabilisation
- dream attunement
- High-Aether processing
- Sacred-Law attunement
- extreme-pressure processing
- gravity/orientation processing
- Blackwater-safe processing
- infernal-heat processing
- contract binding
- hazardous-ember containment

Final tag names are downstream; semantics matter here.

---

# 24. Material Transformation Threshold

FCC-12 needs a universal test for when processing creates **new material identity**.

Recommended factors:

1. composition changes materially;
2. structure/microstructure changes permanently;
3. ordinary reversal is impossible or nontrivial;
4. properties change substantially;
5. process/capability behaviour changes;
6. product becomes reusable feedstock in its own right;
7. provenance alone is not the only difference.

---

# 25. Examples — New Material Identity Justified

Likely already-locked examples:

- Bone Stone → Emberbone
- Skyiron → Celestial Metal
- Skyiron → Storm Metal
- Celestial Metal → Concord Metal
- Steel + Ascendant inputs → Saint Steel
- Ember Iron → Contract Iron
- compatible Ashen inputs → Chain Metal
- compatible Ashen inputs → Infernal Alloy
- sap → hardened resin where chemistry/properties truly change
- ore → refined metal
- base metals → alloy

---

# 26. Examples — State / Form Instead of New Material

Already locked:

- Pressure Stone → Inverted/Floating facies
- Cloudstone → Underside facies
- Seismic Crystal → Orientation/Compressed/Coreward forms
- Pressure Pearl → Blackwater state/provenance
- Bloomstone → Seasonal Crystal charged state
- Season Sap → Moon/Dream Sap state/source
- wood → Rotwood condition
- metal → charged metal state
- Lucid Glass → Abyssal Dream Glass state

---

# 27. Recipe Explosion Prevention

Without inheritance, implementation can explode into:

> every stone × every masonry shape  
> every timber × every wood shape  
> every metal × plate/rod/wire/gear  
> every glass × pane/lens/plate  
> every state × all of the above

FCC-12 should instead support controlled inheritance:

> **Material Definition + Allowed Form Set + Form Definition = resolved product**

The resolved product can still receive a stable registry identity where runtime/save/network requirements demand it.

---

# 28. Generated vs Authored Derived Forms

## Generated / inherited candidates

- standard stone slab/stair/wall;
- standard board/plank;
- standard metal plate/rod/wire;
- standard glass pane;
- generic rope/cloth;
- common powder.

## Authored specialist products

Required where:

- geometry is unique;
- behaviour is unique;
- multiple materials are combined;
- magical function is unique;
- component semantics matter;
- cultural form matters;
- animation/mechanics differ.

Examples:

- Covenant Heart;
- Contract-binding plate;
- specialised lens;
- machine housing;
- rune component.

---

# 29. Block / Item Representation

FCC-12 must give FCC-13 enough information to apply the single-definition rule.

### Same physical object
Placed Stone Brick recovered intact:
- one canonical Block identity;
- inventory projection.

### Different product
Stone rubble vs cut brick:
- distinct physical forms;
- separate definitions justified.

### Container
Dreamwater bottle:
- container Item + contained Dreamwater;
- not necessarily a new material identity named `Bottled Dreamwater`.

---

# 30. State Explosion Prevention

Do not create separate definitions for every combination:

> wet + damaged + charged + corrupted + polished + exported + owned

Instead use:

> **base identity + form + state metadata + provenance + ownership + condition**

Only genuinely identity-changing combinations deserve new material definitions.

---

# 31. Quality / Grade / Purity Handling

Avoid separate materials like:

- Poor Iron
- Fine Iron
- Exceptional Iron

unless composition truly differs.

Likely dimensions:

- base material;
- grade/concentration;
- purity;
- structural quality;
- condition;
- charge;
- affinity/attunement;
- contamination;
- provenance.

Examples:

- ore → richness/concentration;
- Raw Mana Crystal → purity/stability/affinity;
- timber → structural quality/moisture/condition;
- steel → formulation/heat-treatment/quality.

These should not collapse into one rarity colour.

---

# 32. Processing Provenance

Processing preserves provenance where relevant.

Examples:

- Verdant-origin Living Heartwood processed into a beam remains Living Heartwood with Verdant provenance.
- Ashen Contract Iron forged into plate remains Contract Iron.
- imported materials do not lose origin because the workshop is Overworld.

---

# 33. Cross-Realm Station Reuse

A material can be processed outside its origin realm if:

- required station capabilities exist;
- environmental support exists;
- specialist magical/legal context exists where required;
- operator knowledge exists.

No “wrong realm station” rejection.

---

# 34. Station Identity and Capability Substitution

A named station may bundle capabilities, but generic processes should query capability where appropriate.

Example requirement:

- high-temperature forge
- controlled atmosphere
- contract binding

rather than:

> must be exactly one named Ashen station instance

Named realm stations can still be canonical/efficient providers.

---

# 35. Hazards Remain Real

Universal process reuse does not erase hazards.

Special containment may be required for:

- Black Ember;
- Cold Fire;
- Furnace Heart;
- pressure oils;
- toxic gases;
- volatile resins;
- unstable mana matter;
- corrupted materials.

Safety remains gameplay/system truth.

---

# 36. Waste / By-Product Architecture

Processes may produce:

- slag;
- ash;
- offcuts;
- sawdust;
- wastewater;
- tailings;
- spent reagent;
- fumes;
- contaminated material.

Not every process requires a by-product.

But industrial processing should not silently become 100% lossless unless intentionally justified.

---

# 37. Reprocessing / Recycling

Support recovery where physically valid:

- remelting metal;
- recutting stone;
- reusing timber;
- crushing ceramic;
- salvaging glass;
- reclaiming machine parts;
- recycling alloys where composition permits.

Recycling may preserve:

- contamination;
- alloy composition;
- wear;
- material loss.

Exact ratios remain downstream.

---

# 38. Irreversible and Dangerous Transformations

Some transformations may be difficult/impossible to reverse:

- alloying;
- vitrification;
- charring;
- calcination;
- irreversible magical attunement;
- permanent corruption/transmutation;
- biological curing.

These can justify distinct product/material identity.

---

# 39. Biological Processing

Biological materials may use:

- drying;
- curing;
- tanning;
- fermenting;
- smoking;
- salting;
- pressing;
- distilling;
- enzymatic/alchemical treatment.

The same broad process system should support food, medicine, hide, fibre, resin and oils.

---

# 40. Magical Processing

Magical processing must not become one generic “magic craft” bucket.

Possible requirements include:

- mana input;
- rune pattern;
- ritual step;
- attunement;
- environmental field;
- law/domain condition;
- spirit interaction;
- coherence;
- pressure/gravity;
- living-material preservation.

---

# 41. Known Locked Lineages and Processing Families

## Verdant
- Season Sap → Refined Season Sap → Seasonal Resin
- Thornsilver Fibre → Cord/Lattice → Oath-thread
- Bloomstone → season-charged state
- Greatheart biological source → Greatheart Wood / Living Heartwood under valid preservation

## Somnolent
- Nightmare Sap → Nightmare Resin
- Lucid Glass → Fate/Abyssal-Dream states
- Dream Mote configured states
- fibre source → Memory Thread → textile
- Omen Dust + binder → Prophecy Ink

## Ascendant
- Skyiron → Celestial Metal
- Skyiron → Storm Metal
- Celestial Metal → Concord Metal
- Steel + Ascendant components → Saint Steel
- Stormglass → Halo Glass → Judgement Crystal state/product
- Windspun Fibre → Grace Thread

## Impossible Deep
- Bone Stone → Emberbone
- Abyssal Iron gravity-conditioned state
- Seismic Crystal specialist forms/states
- Pressure Pearl → Blackwater state/provenance

## Ashen
- Ember Iron → Contract Iron
- metallurgy inputs → Chain Metal / Infernal Alloy
- Hellglass → Ash Glass / Sootglass

---

# 42. POC Processing Evidence

Legacy POC implementation tested:

- Raw Mana Crystal → Mana Shard → Mana Dust;
- furnace processing;
- automation/chute transfer;
- machine input/output;
- resource reservation;
- persistent storage and conserved stock.

FCC-12 should preserve the systemic principle:

> **source → process → conserved output**

without treating old exact POC recipes as final canon.

---

# 43. Derived-Form Relationship Fields for FCC-13

FCC-12 should eventually hand FCC-13 semantic fields such as:

- base material
- form
- parent material
- process
- input materials
- state preservation
- provenance preservation
- eligibility properties
- required capabilities
- hazards
- recyclability
- Block/Item projection rule

Final schema names remain downstream.

---

# 44. Major Open Decisions Exposed by Step 1C

The FCC-12 interview must decide:

1. whether standard geometric forms are generated/inherited or all explicitly authored;
2. how broad universal form families should be;
3. whether generic Plant Fibre survives as a real mixed/common material;
4. soil/clay/ceramic relationships;
5. universal wood-form inheritance;
6. preservation of specialist wood behaviour through ordinary processing;
7. metal grade/purity/quality representation;
8. alloy-variant representation;
9. fluid/gas container architecture;
10. energetic phenomena versus physical materials;
11. station capability queries;
12. realm-special processing modes versus separate process families;
13. transformation threshold;
14. recycling/salvage concept;
15. state/provenance preservation through processing;
16. dangerous-material containment;
17. FCC-13 instantiation of inherited forms without registry explosion.

---

# 45. Emerging Architecture

The strongest current structure is:

> **Material Identity**  
> + **Physical Form**  
> + **Condition / State**  
> + **Provenance**  
> + **Quality / Purity / Grade dimensions**  
> + **Processing Capability Requirements**  
> = resolved material/product behaviour.

This is preferable to:

> one definition for every adjective + material + shape combination.

---

# 46. Recommended Form-Inheritance Architecture

Each material declares an **allowed-form profile**.

Example:

### Granite
Allowed:
- rough block;
- cut block;
- brick;
- slab;
- stair;
- wall;
- pillar;
- rubble;
- aggregate.

### Copper
Allowed:
- ore/concentrate;
- ingot;
- plate;
- rod;
- wire;
- sheet;
- pipe;
- fastener;
- gear blank.

### Willowreed
Allowed:
- raw reed;
- strip/fibre;
- cord;
- woven mat;
- thatch.

This preserves physical logic.

---

# 47. Recommended Process-Inheritance Architecture

Processes should usually declare:

- input material class or exact material;
- input form;
- output form/material;
- required process capability;
- optional specialist capability;
- conservation rule;
- hazards.

Example:

> `ductile metal / ingot` + `wire-drawing capability`  
> → `same material / wire form`

rather than one handcrafted wire recipe for every ductile metal.

---

# 48. Special-Case Authored Transformations

Unique transformed materials remain explicitly authored.

Examples:

- Contract Iron;
- Celestial Metal;
- Saint Steel;
- Emberbone;
- Halo Glass;
- Grace Thread.

They are not generic form-inheritance outputs.

---

# 49. Forge / Asset Implications

This architecture supports the redesigned Forge.

The Forge can author:

- reusable shape/form templates;
- material inheritance;
- unique specialist forms;
- station capabilities;
- state visuals;
- sockets/ports;
- generated material variants where safe.

A stone stair need not be separately remodelled for every ordinary stone if material/geometry parameterisation supports it.

Unique machine parts and magical components still receive authored geometry.

---

# 50. Art-Governance Implications

Later style governance can inherit from:

> material identity + form + state + provenance

Example:

**Oak Heartwood Beam**
- Oak Heartwood material identity;
- beam geometry;
- wet/charred state overlays if present.

**Contract Iron Plate**
- Contract Iron identity;
- plate form;
- contract-bound visual language;
- Ashen provenance where relevant.

FCC-12 does not select final colours.

---

# 51. Step 1C Acceptance Gate

- [x] material identity separated from physical form;
- [x] universal form-family candidates identified;
- [x] form eligibility distinguished from form existence;
- [x] stone/masonry inheritance covered;
- [x] soil/clay/ceramic boundary covered;
- [x] wood/timber inheritance covered;
- [x] metal inheritance covered;
- [x] alloy architecture covered;
- [x] glass/crystal inheritance covered;
- [x] pearl/biomineral forms constrained;
- [x] fibre/textile chain covered;
- [x] biological hard-material forms covered;
- [x] fluid/gas/particulate representation separated from identity;
- [x] energetic-resource representation treated as special case;
- [x] manufactured component boundary preserved;
- [x] universal process families identified;
- [x] capability-based station architecture identified;
- [x] realm-special processing treated as candidate capability/mode;
- [x] transformation threshold factors identified;
- [x] locked transformed-material examples recorded;
- [x] locked state/form examples recorded;
- [x] recipe/form explosion prevention architecture identified;
- [x] quality/grade/purity separated;
- [x] provenance-through-processing preserved;
- [x] cross-realm station reuse preserved;
- [x] hazards/waste/recycling included;
- [x] POC conservation evidence incorporated without granting it canon authority;
- [x] open interview decisions isolated.

---

# 52. Recommended Next Step

Proceed to:

> **FCC-12 Step 1D — Interview Architecture, Question Map & Completeness Gate**

Step 1D should convert Steps 1A–1C into a finite decision interview covering:

- universal material identity;
- shared/common matter;
- states/provenance;
- forms;
- quality;
- processing;
- transformations;
- export/stabilisation;
- substitution;
- legacy migration;
- FCC-13 handoff.

After Step 1D, the source-reconciliation phase is complete and the actual FCC-12 decision interview can begin.

---

**End of FCC-12 Step 1C v0.1**
