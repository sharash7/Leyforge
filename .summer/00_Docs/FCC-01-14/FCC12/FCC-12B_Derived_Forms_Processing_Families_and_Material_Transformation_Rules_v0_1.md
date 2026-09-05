# Leyforge Final Content Canon Collection

## FCC-12B — Derived Forms, Processing Families & Material Transformation Rules

**Version:** 0.1  
**Status:** Canon Writing Draft — based on locked FCC-12 autonomous interview Q1–Q352  
**Date:** 28 August 2026  
**Parent:** FCC-12 — Universal Materials, Processing & Derived Forms  
**Primary Interview Coverage:** U06–U12, especially Q103–288  
**Consumes:** FCC-12A; FCC-12 Steps 1A–1D; locked FCC-12 autonomous interview Q1–Q352; locked realm and Overworld material lineages.  
**Downstream Owners:** FCC-12C (export/stabilisation/substitution), FCC-12D (final relationship/eligibility registry and audit), FCC-13 (definitive Blocks/Items/recipes/IDs/stations), FCC-14 (final cross-realm certification).

---

# 1. Purpose

FCC-12B defines how Leyforge turns canonical materials into:

- construction forms;
- intermediate feedstocks;
- refined materials;
- textiles;
- masonry;
- metal stock;
- optical components;
- fluid/gas contents;
- machine parts;
- specialist transformed materials.

It also defines the universal processing system by which those forms and transformations occur.

The governing objective is:

> **Preserve physical and magical meaning while avoiding `material × form × state × realm × machine` registry explosion.**

FCC-12B therefore establishes:

1. universal derived-form architecture;
2. form eligibility;
3. generated/inherited versus authored forms;
4. process families;
5. capability-driven processing;
6. named-station ownership boundaries;
7. specialist realm processing modes;
8. conservation, waste and recycling;
9. transformation thresholds;
10. locked transformed-material lineages;
11. material-specific form/process constraints;
12. FCC-13 implementation handoff.

FCC-12B does **not** decide:

- exact recipe quantities;
- exact times;
- exact temperatures;
- final stable IDs;
- final machine throughput;
- final tool statistics;
- exact portal recipes;
- final UI;
- final art.

---

# 2. Material, Form and Process Are Separate Concepts

FCC-12B operates on three distinct concepts:

## Material

> What is this made of?

Examples:

- Granite
- Copper
- Oak Heartwood
- Stormglass
- Contract Iron
- Memory Thread

## Form

> What physical shape or product form is the material currently in?

Examples:

- block
- rubble
- plank
- beam
- ingot
- wire
- plate
- shard
- pane
- lens
- thread
- cloth

## Process

> What operation turns one material/form/state into another material/form/state?

Examples:

- sawing
- crushing
- firing
- smelting
- casting
- forging
- weaving
- distilling
- spirit-active treatment
- contract binding

These concepts must remain separately addressable.

---

# 3. Universal Form-Inheritance Doctrine

The universal rule is:

> **Use reusable form templates + material eligibility + authored specialist exceptions. Generate semantic combinations where safe, instantiate stable runtime entries downstream, and never assume every material supports every form.**

This means Leyforge should not manually create a completely unrelated content definition for every possible combination.

Instead, a material can declare an allowed-form profile.

Example:

### Granite

Possible forms:
- raw rock;
- rough block;
- cut masonry;
- rubble;
- brick;
- slab;
- stair;
- wall;
- pillar;
- aggregate.

Invalid forms:
- wire;
- cloth;
- rope.

### Copper

Possible forms:
- refined metal;
- ingot;
- billet;
- plate;
- sheet;
- bar;
- rod;
- wire;
- pipe/tube where technology supports;
- fastener;
- mechanical blank.

Invalid forms:
- timber plank;
- textile cloth.

---

# 4. Form Eligibility

A universal form existing in the system does not mean every material may use it.

Eligibility depends on:

- geometry;
- grain;
- hardness;
- brittleness;
- ductility;
- tensile strength;
- compressive strength;
- flexibility;
- thermal stability;
- chemical stability;
- size of naturally available material;
- specialist magical/biological structure;
- technological capability;
- actual gameplay purpose.

A material can therefore declare:

- allowed forms;
- conditional forms;
- prohibited forms;
- specialist authored forms.

---

# 5. Generated / Inherited Standard Forms

Regular, repeated forms should be generated or inherited from shared templates where technically safe.

High-value candidates include:

- slab;
- stair;
- wall;
- simple pillar;
- standard masonry block;
- standard plank/board;
- standard beam;
- standard metal plate;
- standard metal rod;
- standard metal wire;
- standard pane;
- standard rope;
- standard cloth;
- simple powder/dust forms.

The runtime may still require each resolved product to possess a stable registry identity.

That does not require each product to own a duplicated material ontology.

The semantic structure should remain:

> **material definition + form definition + eligibility + resolved registry identity**

---

# 6. Authored Specialist Forms

A derived product must remain explicitly authored when its defining identity depends on more than regular form inheritance.

Authoring is justified when the product has:

- unique geometry;
- unique animation;
- moving parts;
- sockets or pivots;
- directional ports;
- multiple materials;
- unique gameplay behaviour;
- unique magical behaviour;
- culturally specific construction;
- structural topology;
- bespoke collision;
- specialised VFX;
- integrated storage/processing;
- unique ritual function.

Examples:

- Covenant Heart;
- Coherence Core;
- Furnace Core;
- specialised magical lenses;
- machine housings;
- rune assemblies;
- portal components;
- contract-binding hardware.

---

# 7. Raw Natural Form

`Raw Natural Form` is a universal source concept.

It may represent:

- naturally exposed stone;
- ore-bearing rock;
- crystal growth;
- log/tree material;
- plant matter;
- shell;
- bone;
- natural resin;
- pearl;
- naturally formed glass;
- native metal where appropriate.

It does not imply a portable Item automatically.

The source may exist as:

- terrain;
- Block;
- node;
- deposit;
- entity part;
- harvested object.

FCC-13 determines exact runtime representation.

---

# 8. Chunk / Lump

A `chunk/lump` form is appropriate where harvesting or breaking produces a rough portable portion.

Examples:

- stone chunk;
- ore-bearing chunk;
- clay lump;
- resin lump;
- crystal chunk.

Not every placed Block requires a chunk form.

If the intact placed object is recovered unchanged, the single-definition rule should be used instead.

---

# 9. Dust / Powder

`Dust/powder` is a derived particulate form created by:

- crushing;
- grinding;
- milling;
- pulverising;
- precipitation;
- other relevant processing.

A powder normally preserves the parent material identity where only particle size changes.

Examples:

- crushed mineral powder;
- crystal dust;
- pigment powder.

However, a chemically new powder may be a different material.

---

# 10. Granule / Meal

`Granule/meal` covers coarser processed particulate products.

Examples:

- salt granules;
- grain meal;
- Sea Kelp Meal;
- crushed biological feed;
- granular reagent.

A granular product may be:

- a size form of one material;
- a processed biological product;
- a mixture/formulation.

The name alone does not determine which.

---

# 11. Shard

`Shard` is a brittle fragment form.

Typical eligible materials:

- glass;
- crystal;
- brittle magical mineral;
- obsidian.

Shard form does not automatically create a new material.

Example:

> Raw Mana Crystal → Mana Shard

can remain a material/form relationship unless another explicit transformation changes composition or structure.

---

# 12. Stone and Masonry Forms

Compatible stones may support:

- raw stone;
- rough block;
- rubble;
- cut block;
- brick;
- slab;
- stair;
- wall;
- pillar/column;
- arch;
- trim;
- aggregate;
- powder.

`Stone` is a superclass.

Exact material remains:

- Granite;
- Limestone;
- Basalt;
- Rootstone;
- Memory Stone;
- Dreamstone;
- Cloudstone;
- Pressure Stone;
- etc.

Masonry forms do not merge specialist stones.

---

# 13. Stone Brick Versus Fired Brick

The word `brick` describes form/geometry, but material lineage matters.

Examples:

### Cut Stone Brick
- parent material: Granite;
- process: cutting/shaping;
- output material: still Granite;
- form: masonry brick.

### Fired Clay Brick
- parent feedstock: clay/ceramic mixture;
- process: forming + drying + firing;
- output material: fired ceramic;
- form: brick.

The same shape can therefore host different material transformations.

---

# 14. Rubble and Aggregate

Rubble/aggregate are size/form classes.

Exact composition may remain important.

Examples:

- Granite rubble;
- Basalt aggregate;
- mixed gravel;
- demolition rubble.

Mixed aggregate may become a deliberate mixture/product if multiple materials are physically combined.

Do not treat all aggregate as one universal substance.

---

# 15. Sand

Sand is primarily a particle-size/material-form class.

Its exact identity follows composition.

Examples:

- quartz-rich sand;
- volcanic sand;
- calcareous sand;
- Dream Sand.

A process requiring silica-rich glassmaking feedstock must ask for suitable composition/capability rather than merely `sand`.

---

# 16. Gravel

Gravel is a coarse aggregate class.

It may retain:

- source rock;
- mixed composition;
- rounding/weathering;
- contamination.

The system may support a common mixed-gravel product where useful, but no realm receives a unique gravel merely because of provenance.

---

# 17. Soil Forms and Profiles

The eight principal Overworld soils remain:

1. Loam
2. Clay Soil
3. Sandy Soil
4. Silt Soil
5. Peat Soil
6. Chalk Soil
7. Volcanic Ash Soil
8. Saline Soil

Soils can carry states/profiles such as:

- wet;
- dry;
- tilled;
- compacted;
- fertilised;
- depleted;
- frozen;
- burned;
- mana-enriched.

Those remain states/profiles unless true transformation occurs.

---

# 18. Clay Architecture

Clay is a mineral/feedstock superclass.

Composition matters.

Relevant current material relationships include:

- River Clay — source/deposit terminology;
- White Kaolin — specialised kaolin feedstock;
- Brick Loam — clay-rich soil profile;
- Clay Soil — soil family.

Not every soil qualifies as ceramic feedstock.

---

# 19. Ceramic Feedstock

A ceramic feedstock may combine:

- suitable clay;
- mineral additives;
- temper;
- grog;
- pigments;
- fluxes;
- specialist magical additives.

The feedstock is not automatically a permanent new material unless the mixture itself needs to exist as a meaningful reusable formulation.

FCC-13 will decide exact product rows.

---

# 20. Fired Ceramic Transformation

Firing can irreversibly:

- dehydrate;
- sinter;
- vitrify;
- restructure;

a clay/mineral body.

Where this produces materially different reusable matter, the result is a ceramic material/formulation distinct from raw clay.

This is an explicit example of the FCC-12A transformation threshold.

---

# 21. Ceramic Forms

Compatible ceramic formulations may support:

- brick;
- roof tile;
- floor tile;
- vessel;
- pipe;
- refractory lining;
- crucible;
- insulator;
- decorative tile.

Not every ceramic needs every form.

---

# 22. Refractory Ceramic

A refractory ceramic can be a distinct material/formulation when:

- composition is materially different;
- temperature tolerance is meaningfully higher;
- structural/chemical behaviour differs;
- it functions as reusable feedstock/material.

It is not simply `high-quality brick`.

---

# 23. Wood / Timber Forms

Compatible wood/timber materials may support:

- log;
- stripped log;
- timber;
- split timber;
- board;
- plank;
- beam;
- post;
- pole;
- rod;
- dowel;
- panel;
- veneer;
- shingle;
- peg;
- chip;
- sawdust;
- charcoal where chemistry permits.

Eligibility depends on physical properties.

---

# 24. Timber Processing Does Not Guarantee Specialist Property Preservation

A specialist wood may be physically processable using ordinary woodworking while losing its specialist behaviour.

Therefore two questions must remain separate:

1. Can the material be cut/shaped?
2. Can its defining specialist property survive the process?

This distinction is critical for:

- Living Heartwood;
- Soulwood;
- Reverie Wood;
- Resonance Wood.

---

# 25. Greatheart Wood and Living Heartwood

Greatheart biology produces related but distinct material outputs.

### Greatheart Wood

- structural wood;
- can participate in ordinary woodworking;
- remains Verdant-specific biological material.

### Living Heartwood

- specialist living material;
- requires valid harvest/preservation;
- retains living behaviour only when processing preserves that structure.

Destructive processing may create:

- inert wood;
- degraded wood;
- another ordinary derived product;

rather than magically preserving living properties.

---

# 26. Soulwood

Soulwood can inherit ordinary wood forms where physically valid.

Specialist spirit/memory properties may require:

- spirit-safe handling;
- appropriate tools;
- ritual context;
- controlled processing.

Ordinary woodworking may produce usable Soulwood products while degrading or losing specialist effects where source canon allows.

---

# 27. Reverie Wood

Reverie Wood can inherit timber forms.

Dream/coherence properties may require:

- coherence-safe processing;
- stabilisation;
- appropriate storage;
- controlled extraction.

Its material identity remains Reverie Wood.

---

# 28. Resonance Wood

Resonance Wood may depend on:

- grain;
- orientation;
- cut direction;
- tension;
- internal structure.

Processing can therefore preserve or degrade its:

- seismic response;
- acoustic behaviour;
- resonant capability.

The system should support orientation-sensitive processing where gameplay needs it.

---

# 29. Cinderwood

Cinderwood inherits ordinary wood/timber forms where mechanically valid.

Its intrinsic Ashen thermal/ash-related properties remain with the material when those properties are truly intrinsic.

Realm export does not automatically convert it into ordinary wood.

---

# 30. Rotwood

Rotwood remains:

> compatible wood + rot/blight state

unless irreversible transformation produces genuinely distinct matter.

Do not maintain `Rotwood` as one universal base wood family across all species.

---

# 31. Plant Fibre

`Plant Fibre` is primarily a universal provider/category class.

It does **not** replace exact fibres such as:

- Sunflax Fibre;
- Mirehemp Fibre;
- Thornsilver Fibre.

Where gameplay needs a real generic mixed product, the system may define:

> **Mixed Plant Fibre**

as a deliberate physical bundle/mixture.

Legacy POC `Plant Fibre` should migrate to:

- a specific known fibre where source is known;
- Mixed Plant Fibre where physically mixed/generic;
- category/provider use where no exact Item is required.

---

# 32. Willowreed

Willowreed can provide:

- raw reed;
- strip;
- coarse fibre;
- cordage;
- woven mat;
- thatch;
- binding material.

It does not need to become a generic Plant Fibre clone.

---

# 33. Sunflax Fibre

Sunflax Fibre remains a distinct botanical fibre material.

It can inherit universal processing such as:

- cleaning;
- retting where appropriate;
- spinning;
- weaving;
- cordage;
- cloth.

---

# 34. Mirehemp Fibre

Mirehemp Fibre remains distinct.

Its form/process profile may support:

- coarse fibre;
- cord;
- rope;
- filter material;
- textile.

Shared processing does not merge it with Sunflax.

---

# 35. Thornsilver Fibre

Thornsilver Fibre remains a specialist Verdant fibre.

Locked lineage:

> Thornsilver Fibre  
> → Thornsilver Cord  
> → Thornsilver Lattice  
> → Oath-thread where ritual processing applies.

These are processed forms/products, not independent native resources.

---

# 36. Veil Silk

Veil Silk remains a distinct Ancestral fibre/silk material.

It shares textile superclasses but may require:

- spirit-active handling;
- memory-safe processing;
- cultural/ritual conditions;

for specialist outputs.

---

# 37. Memory Thread

Memory Thread remains a Somnolent material/product identity.

`Dream Thread` does not create a duplicate raw material.

Memory Thread may support:

- spool;
- thread;
- cloth;
- encoded textile;
- ritual textile.

Encoding can be configuration/state/product data rather than another base fibre.

---

# 38. Windspun Fibre and Grace Thread

Locked lineage:

> Windspun Fibre  
> → Grace Thread

Grace Thread is a transformed/attuned derived material, not merely another physical form.

The transformation is persistent enough to justify separate material identity.

---

# 39. Hide and Leather

Hide is biological raw material.

Processes may include:

- cleaning;
- scraping;
- curing;
- tanning;
- drying;
- oiling;
- finishing.

Leather may become a processed material/product lineage where tanning creates persistent materially significant behaviour.

Species provenance can remain without requiring one duplicate generic leather identity per creature unless actual properties justify it.

---

# 40. Chitin, Shell and Biological Hard Material

Universal biological-hard-material classes can support:

- raw shell;
- chitin plate;
- scale;
- carved piece;
- powder;
- inlay;
- structural panel.

Exact material identity remains source/property-specific where relevant.

---

# 41. Bone and Oathbone

Ordinary Bone and Oathbone remain distinct sibling materials.

They may share:

- cutting;
- carving;
- polishing;
- powdering;
- structural/craft forms.

Oathbone is not ordinary Bone plus Ancestral provenance.

---

# 42. Cinderhide and Titan Bone

Cinderhide remains distinct Ashen biological material.

Titan Bone remains provenance-sensitive special material.

Titan Bone:

- comes only from legitimate Titan remains/shed history;
- is not generic boss currency;
- may share bone-processing capabilities where physically valid.

---

# 43. Universal Metal Forms

Compatible metals/alloys may support:

- ore-bearing source;
- concentrate;
- bloom;
- billet;
- ingot;
- bar;
- rod;
- plate;
- sheet;
- foil;
- wire;
- pipe/tube;
- chain link;
- fastener;
- gear blank;
- tool blank;
- armour plate;
- powder.

Physical eligibility matters.

---

# 44. Ore Versus Refined Metal

Ore is a mineral-bearing source material.

It is not the refined metal.

Example:

> Iron-bearing ore  
> → beneficiation/concentration  
> → smelting/refining  
> → Iron metal.

The extracted Iron receives Iron material identity.

The ore source remains geological/mineral feedstock.

---

# 45. Concentrate

A concentrate is a processed feedstock.

It may retain:

- parent deposit provenance;
- ore composition;
- grade;
- contaminants.

Concentrate is not automatically a new metal.

---

# 46. Bloom and Billet

Bloom/billet are intermediate metallurgical forms where the technology/process warrants them.

They retain the parent metal/alloy identity unless composition changes.

Example:

> Iron / bloom form

is still Iron.

---

# 47. Ingot

Ingot is a portable refined/cast form.

It does not define metal identity.

Examples:

- Copper Ingot;
- Iron Ingot;
- Soul Silver Ingot;
- Skyiron Ingot;

may exist if those materials are cast/formable in that way.

---

# 48. Metal Plate, Sheet and Foil

Plate/sheet/foil are thin-flat forms.

Eligibility depends on:

- ductility;
- brittleness;
- manufacturing technology;
- intended thickness;
- specialist structure.

Foil should not be inherited by a brittle metal simply because the form template exists.

---

# 49. Metal Rod, Bar and Wire

Rod/bar/wire are linear forms.

Wire specifically requires:

- sufficient ductility;
- wire-drawing or equivalent capability.

A material that cannot physically be drawn into wire should not receive wire form.

---

# 50. Mechanical Blanks and Fasteners

Reusable form families may include:

- gear blank;
- nail;
- rivet;
- bolt;
- pin;
- peg;
- chain link.

A final machine component may still be authored where:

- geometry;
- tolerances;
- magical structure;
- multi-material assembly;

matter.

---

# 51. Alloy Identity

An alloy becomes a canonical material identity when its stable manufactured composition produces materially meaningful properties.

Alloy identity is separate from:

- ore;
- form;
- heat-treatment;
- workmanship.

No alloy should receive fictional native ore unless source canon explicitly defines a naturally occurring equivalent.

---

# 52. Bronze

Bronze is an alloy/formulation lineage.

It is not:

- Bronze Ore;
- a mandatory universal progression tier;
- a realm-specific metal.

Different bronze formulations can be represented through composition/profile or distinct named alloy where materially justified.

---

# 53. Steel

Steel is an iron-based alloy/formulation family.

Variation may include:

- carbon content;
- alloying elements;
- heat treatment;
- purity;
- quality.

Not every variation requires a separate base material.

Materially significant formulations can receive explicit alloy identities where needed.

---

# 54. Mythril

Mythril remains a distinct material.

It is not simply:

> higher-tier Steel.

Its forms/processes must derive from its own physical/magical capability profile.

---

# 55. Star Iron

Star Iron remains distinct Overworld/cosmic metal.

Its cosmic origin does not imply:

- Ascendant ownership;
- automatic Celestial Metal identity;
- universal superiority.

---

# 56. Soul Silver

Soul Silver remains distinct from ordinary Silver.

It can share broad metal-processing capabilities where physically valid while retaining:

- Ancestral identity;
- spirit/memory properties;
- specialist processing requirements.

---

# 57. Abyssal Iron

Abyssal Iron remains distinct Impossible Deep native metal.

It is not:

- ordinary Iron grade;
- generic Deep Metal tier.

Locked state relationship:

> Gravity Ore = gravity-conditioned/deposit state of Abyssal Iron.

---

# 58. Ember Iron

Ember Iron remains the principal Ashen native metal foundation.

It is not ordinary Iron plus Ashen provenance.

It can feed specialist Ashen transformations.

---

# 59. Contract Iron

Locked lineage:

> Ember Iron  
> + valid contract-binding process  
> → Contract Iron.

Contract Iron is a genuine transformed material.

It is not:

- any metal referenced by a contract;
- a temporary legal state;
- ordinary Ember Iron with display text.

Its binding behaviour follows the universal contract framework.

---

# 60. Skyiron

Skyiron remains Ascendant native metal.

It can feed multiple transformed lineages without becoming a universal tier.

---

# 61. Celestial Metal

Locked transformation:

> Skyiron  
> + validated High-Aether/divine processing  
> → Celestial Metal.

Celestial Metal is manufactured/transformed.

There is no Celestial Metal Ore.

---

# 62. Storm Metal

Locked transformation:

> Skyiron  
> + persistent storm attunement/transformation  
> → Storm Metal.

Storm Metal remains distinct from:

> temporarily storm-charged Skyiron.

Persistent transformation is the differentiator.

---

# 63. Concord Metal

Locked relationship:

> Celestial Metal  
> → specialised civic/divine Concord formulation.

Concord Metal is:

- processed;
- formulated;
- not native ore.

---

# 64. Saint Steel

Locked relationship:

> ordinary Steel  
> + approved Ascendant/Celestial inputs/process  
> → Saint Steel.

Saint Steel is a crafted alloy/formulation.

There is no Saint Steel Ore.

---

# 65. Chain Metal and Infernal Alloy

Both are manufactured Ashen metal/alloy families.

They:

- derive from compatible metallurgy inputs;
- require appropriate processes;
- are not native ore families.

Exact composition belongs in later detailed registries/recipes.

---

# 66. Fossil Alloys

`Fossil Alloys` remains an archaeological/provenance category for ancient manufactured alloys.

It may cover multiple exact historical compositions.

Where composition becomes known and materially relevant, the recovered material can be represented using:

- exact alloy;
- composition profile;
- archaeological provenance.

The category itself is not a single ore.

---

# 67. Charged Metal

`Charged metal` is state.

Charge can affect:

- conductivity;
- hazard;
- magical use;
- machine input.

It does not automatically create a new metal.

Persistent authored transformations such as Storm Metal remain separate.

---

# 68. Glass Forms

Compatible glasses may support:

- raw mass;
- shard;
- powder;
- pane;
- plate;
- lens;
- rod;
- tile;
- inlay;
- optical component.

Brittleness and thermal behaviour determine eligibility.

---

# 69. Crystal and Gem Forms

Compatible crystals/gems may support:

- raw growth;
- chunk;
- shard;
- powder;
- cut gem;
- polished gem;
- lens;
- inlay;
- rod;
- component core.

Not every crystal supports every form.

---

# 70. Raw Mana Crystal Forms

Locked direction:

> Raw Mana Crystal  
> → Mana Shard  
> → Mana Dust

can be represented through derived forms/products while preserving material lineage.

Exact recipes and whether each requires distinct stable Item rows belong to FCC-13.

Mana charge remains separate from the physical crystal.

---

# 71. Lucid Glass Forms and States

Lucid Glass may support:

- pane;
- plate;
- shard;
- lens;
- optical component.

Locked states/products:

- Fate Glass — prophecy-attuned Lucid Glass product/state;
- Abyssal Dream Glass — low-coherence Lucid Glass state.

These are not new geological base glasses.

---

# 72. Stormglass and Halo Glass

Stormglass remains Ascendant specialist material.

Locked transformation:

> Stormglass  
> + validated High-Aether/divine processing  
> → Halo Glass.

Halo Glass is a transformed material.

`Judgement Crystal` remains a law-attuned product/state in the Stormglass/Halo lineage rather than another geological base family.

---

# 73. Hellglass Family

Hellglass remains the Ashen specialist glass family.

Locked lineage:

- Ash Glass — lower/common Hellglass lineage;
- Sootglass — specialist Hellglass variant;
- Heat Glass — role descriptor, not separate material.

Processing/form eligibility is inherited from the Hellglass family where physically valid.

---

# 74. Seismic Crystal Forms

Seismic Crystal remains one material identity.

Locked forms/states include:

- Orientation Crystal;
- Compressed Crystal;
- Coreward/Core Crystal.

Those expressions can affect:

- processing;
- orientation;
- sensing;
- gravity response.

They do not create independent geological materials.

---

# 75. Pearl / Biomineral Forms

Pearl-like biominerals can share:

- raw pearl;
- polished pearl;
- drilled pearl;
- fitted pearl;
- inlay;
- powder;
- specialist lens/core where actual properties justify.

Distinct identities remain:

- Frost Pearl;
- River Pearl;
- Echo Pearl;
- Thunder Pearl;
- Pressure Pearl;
- Cinder Pearl.

Blackwater Pearl remains Pressure Pearl provenance/state.

---

# 76. Fluid Representation

A fluid may exist as:

- world volume;
- machine amount;
- pipe flow;
- tank content;
- barrel content;
- bottle/flask content.

Those are representations/containments of one fluid identity where composition matches.

---

# 77. Fluid Containers

Default architecture:

> **container object + contained fluid**

rather than:

> one new material for every container.

Examples:

- Flask + Water;
- Barrel + Pressure Oil;
- Tank + Dreamwater.

A composite product may receive a stable object identity while keeping contained material data explicit.

---

# 78. Gas Representation

A gas may exist as:

- ambient atmospheric volume;
- local cloud;
- pipe flow;
- machine buffer;
- tank;
- pressure cylinder/canister.

Pressurisation is state unless chemistry/phase changes materially.

---

# 79. Aether Gas, Heat Gas and Sunmist

These remain distinct materials/resources.

- Aether Gas — Ascendant atmospheric/strategic gas.
- Heat Gas — Ashen gas/energetic material.
- Sunmist — Ascendant aerosol/condensate.

They are not variants of one generic magical gas.

---

# 80. Sap, Resin, Wax and Oil

These are related but distinct physical categories.

## Sap
raw biological fluid/exudate.

## Resin
thickened/hardened organic product.

## Amber-like material
solidified/fossilised/hardened resinous material.

## Wax
pliable solid organic material.

## Oil
fluid lipid/hydrocarbon-like material.

Shared processing does not merge identity.

---

# 81. Season Sap Lineage

Locked relationship:

> Season Sap  
> → Refined Season Sap  
> → Seasonal Resin.

Moon Sap and Dream Sap remain Season Sap state/source variants.

The lineage uses processing rather than duplicate native sap families.

---

# 82. Nightmare Sap and Nightmare Resin

Locked lineage:

> Nightmare Sap  
> → Nightmare Resin.

Inspiration Resin remains separately canonical.

Nightmare Resin is not generic dream corruption.

---

# 83. Pressure Resin

Pressure Resin remains a distinct Impossible Deep specialist organic/resin material.

It can inherit relevant resin processing while retaining Deep provenance and pressure-related properties.

---

# 84. Oils

Botanical Lamp Oil and Pressure Oils remain distinct oils.

They can share:

- storage;
- pumping;
- filtration;
- refining;
- combustion/chemical interfaces where valid.

Composition and hazard determine exact capability.

---

# 85. Energetic Resource Processing

Energetic resources must declare whether they are:

- physical fuel;
- physical reagent;
- captured phenomenon;
- stored charge;
- energetic material;
- field.

This prevents the processing system from treating all energy as interchangeable Item fuel.

---

# 86. Lightning Core and Lightning Essence

Locked relationship:

- Lightning Core — physical strategic resource;
- Lightning Essence — extracted/captured energetic product.

Lightning Essence must not receive a fake ore deposit.

---

# 87. Black Ember, Deepfire Ember and Cold Fire

These remain distinct.

Their processing/handling may share:

- hazardous containment;
- transfer;
- energy extraction;
- controlled release;

without merging material identity.

---

# 88. Furnace Heart

Furnace Heart is:

- Ashen strategic resource;
- physical/transportable;
- hazardous;
- distinct from Furnace Core.

Processing may involve:

- containment;
- stabilisation;
- controlled energy extraction;
- machine integration.

It is not merely `fuel`.

---

# 89. Dream Mote

Dream Mote remains a Somnolent particulate/energy-like resource.

It can have:

- configured state;
- source state;
- contained form;
- ritual/process use.

Origin/Courier Motes remain states/classes rather than new base resources.

---

# 90. Universal Processing Doctrine

The global process rule is:

> **Recipes/processes declare inputs, forms, required capabilities/conditions, output material/form/state, conservation, hazards and optional specialist modes. Named stations are providers, not arbitrary exclusive gates.**

This is the core processing contract for Leyforge.

---

# 91. Universal Process Families

Processes are organised into reusable semantic families.

The primary families are:

1. mechanical separation;
2. cleaning/separation;
3. thermal processing;
4. mechanical forming;
5. chemical/biological processing;
6. assembly/fabrication;
7. magical/specialist processing modes.

---

# 92. Mechanical Separation

Universal processes include:

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

These processes may change:

- form;
- particle size;
- surface finish;
- quality;
- state.

They create new material identity only if the transformation threshold is crossed.

---

# 93. Cleaning and Separation

Universal processes include:

- washing;
- screening;
- sieving;
- sorting;
- grading;
- separating;
- decontaminating.

These may affect:

- purity;
- grade;
- contamination;
- composition of a mixture.

They do not automatically create new matter.

---

# 94. Thermal Processing

Universal thermal processes include:

- drying;
- heating;
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

Processes declare:

- temperature capability;
- atmosphere/environment where relevant;
- containment;
- hazard;
- material eligibility.

---

# 95. Mechanical Forming

Universal forming processes include:

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

Eligibility depends on material mechanics.

---

# 96. Chemical / Biological Processing

Universal families include:

- curing;
- tanning;
- fermentation;
- extraction;
- leaching;
- distillation;
- precipitation;
- crystallisation;
- oxidation/reduction;
- alchemical reaction.

These processes may:

- refine;
- preserve;
- transform;
- create formulation;
- separate constituents.

---

# 97. Assembly / Fabrication

Universal fabrication processes include:

- joining;
- riveting;
- bolting;
- pegging;
- stitching;
- soldering;
- brazing;
- welding where technology supports;
- rune assembly;
- component assembly.

Assembly creates objects/components.

It does not necessarily create a new material.

---

# 98. Station Capability Model

A station or tool provides one or more capabilities.

Examples:

### Furnace
- controlled heat;
- firing;
- smelting;
- calcining.

### Forge
- high-temperature work;
- hammering;
- forming;
- tempering.

### Loom
- weaving.

### Crusher
- crushing.

### Pressure chamber
- high-pressure treatment.

### Spirit-active station
- spirit-safe handling.

The recipe should ask for required capability where possible.

---

# 99. Named Stations

Named stations remain meaningful.

They can own:

- appearance;
- culture;
- efficiency;
- safety;
- interaction UI;
- bundled capabilities;
- upgrade paths;
- environmental integration;
- historical importance.

They do **not** automatically own exclusive rights to every process they can perform.

---

# 100. Alternative Providers

A process may be completed by any provider satisfying all required capabilities and conditions unless the content explicitly requires a unique context.

Potential providers include:

- hand tool;
- workstation;
- machine;
- automated line;
- ritual structure;
- environmental site;
- creature-assisted process;
- realm-special infrastructure.

This is an implementation of capability freedom.

---

# 101. Exact Station Requirements

An exact named station may still be required where its identity is genuinely part of the mechanic.

Examples may include:

- unique ancient machinery;
- realm authority device;
- one-off ritual site;
- special structure whose geometry/law is the process.

This must be explicit.

It is not the default recipe architecture.

---

# 102. Operator Knowledge

Processing can require knowledge separately from station capability.

A station may physically support a process while the operator lacks:

- recipe;
- technique;
- certification;
- ritual knowledge;
- contract authority;
- research.

This preserves progression without fake material tiers.

---

# 103. Automation Compatibility

A process can be automated when automation can provide:

- required inputs;
- handling;
- process capability;
- control;
- output routing;
- specialist environment;
- safety;
- knowledge/configuration.

A process remains manual/ritual where canon intentionally requires direct agency or interaction.

---

# 104. Living-Material Preservation

`Living-material preservation` is a specialist processing capability/mode.

It can modify ordinary processes such as:

- harvesting;
- cutting;
- joining;
- shaping;
- grafting.

It is required when the output must retain living behaviour.

This is primarily relevant to Verdant specialist matter.

---

# 105. Seasonal Attunement

Seasonal attunement is a specialist magical processing mode.

It can modify:

- Bloomstone;
- Season Sap;
- specialist Verdant materials.

It does not automatically create a new base material.

---

# 106. Spirit-Active Handling

Spirit-active handling is a specialist Ancestral process capability.

It may be needed to:

- preserve memory;
- avoid spiritual damage;
- work Soulwood;
- process Veil Silk;
- handle Oathbone;
- create specialist ritual products.

It layers onto universal processes.

---

# 107. Memory Preservation

Memory preservation is a specialist condition/capability where a material's memory-bearing property must remain intact through processing.

It is not a second complete crafting industry.

---

# 108. Coherence Stabilisation

Coherence stabilisation is a Somnolent specialist capability.

It may layer onto:

- cutting;
- glasswork;
- textile processing;
- resin processing;
- storage;
- transport.

Its purpose is to prevent unwanted coherence loss/instability.

---

# 109. Dream Attunement

Dream attunement may configure or transform specialist Somnolent material when explicit canon permits.

It should be represented as:

- state;
- processing mode;
- authored transformation;

depending on the output.

---

# 110. High-Aether Processing

High-Aether processing is an Ascendant specialist capability/environment.

It may be required for:

- Skyiron transformations;
- Stormglass transformation;
- Windspun Fibre transformations;
- other specialist Ascendant processes.

It layers onto universal metallurgy/glass/textile processing.

---

# 111. Sacred-Law Attunement

Sacred-Law attunement is a specialist context/capability.

It can create:

- law-attuned states;
- authored products;
- specialist transformations.

It does not create one new material per law.

---

# 112. Extreme-Pressure Processing

Extreme-pressure processing is an Impossible Deep specialist capability/environment.

It can layer onto:

- metallurgy;
- crystal work;
- resin processing;
- structural fabrication.

It is not a separate universal crafting tree.

---

# 113. Gravity / Orientation Processing

Gravity/orientation processing supports materials whose behaviour depends on:

- orientation;
- gravity vector;
- pressure history.

Examples include:

- Seismic Crystal;
- gravity-conditioned Abyssal Iron;
- Deep navigation/engineering materials.

---

# 114. Blackwater-Safe Processing

Blackwater-safe processing is a handling/environment capability.

It may require:

- corrosion protection;
- pressure support;
- containment;
- sealing;
- specialised machinery.

It does not create duplicate material identities.

---

# 115. Infernal-Heat Processing

Infernal-heat processing is a specialist thermal capability.

It may require:

- very high heat;
- heat-resistant machinery;
- cooling;
- containment;
- Ashen specialist energy.

It layers onto universal thermal/metallurgical processes.

---

# 116. Contract Binding

Contract binding is a specialist process mode connected to the universal contract framework.

It must require:

- valid contract context;
- appropriate authority/consent rules;
- material/process capability;
- required energy/environment.

It can create persistent transformed materials such as Contract Iron.

It must not be reduced to:

> insert Iron, receive magic Iron.

---

# 117. Hazardous-Ember Containment

Hazardous-ember containment covers dangerous matter such as:

- Black Ember;
- Cold Fire;
- Furnace Heart;
- similar volatile energetic material.

It may require:

- shielding;
- cooling;
- controlled atmosphere;
- specialised vessel;
- monitoring.

Safety is part of the process requirement.

---

# 118. Process Transformation Test

At the end of processing, the system must ask:

### Did material identity change?

If no:
- retain material;
- update form/state/quality/provenance.

If yes:
- create/resolve transformed material identity;
- preserve relevant source provenance.

The FCC-12A transformation threshold remains authoritative.

---

# 119. Conservation

Physical processing conserves matter.

Processing may produce:

- finished output;
- by-products;
- waste;
- emissions;
- losses.

It must not duplicate input resources merely because multiple systems consume or reserve them.

This is consistent with prior POC automation/conservation principles.

---

# 120. Waste and By-Products

Possible by-products include:

- slag;
- ash;
- sawdust;
- chips;
- offcuts;
- tailings;
- wastewater;
- fumes;
- spent reagent;
- contaminated waste.

Not every process needs a by-product.

Only meaningful waste should be represented.

---

# 121. Offcuts and Scrap

Reusable offcuts/scrap remain real conserved matter.

Examples:

- metal scrap;
- timber offcut;
- broken glass;
- stone rubble.

They can re-enter processing where:

- composition is known;
- contamination is acceptable;
- form can be recovered.

---

# 122. Recycling

Recycling is permitted where physically valid.

Examples:

- remelting metal;
- recutting stone;
- reusing timber;
- crushing ceramic;
- remelting or salvaging glass;
- recovering machine material;
- reprocessing textile.

Recycling can incur:

- loss;
- contamination;
- downgraded quality;
- separation cost.

---

# 123. Alloy Recycling

Alloy recycling must preserve composition truth.

A mixed metal scrap stream cannot magically resolve into pure input metals without a valid separation/refining process.

Recovered alloy can:

- remain the same alloy;
- be remelted;
- be refined;
- become contaminated mixture.

---

# 124. Processing Provenance

Processing can add provenance.

Relevant provenance may include:

- workshop;
- realm;
- forge;
- ritual;
- contract;
- sacred institution;
- ancient machine;
- named craftsperson;
- industrial line.

Important provenance survives into the output.

It does not replace material identity.

---

# 125. Form Naming

Default display naming should generally resolve:

> **Material + meaningful form**

Examples:

- Granite Slab;
- Copper Wire;
- Oak Heartwood Beam;
- Lucid Glass Lens;
- Contract Iron Plate.

Cultural aliases may replace the displayed phrase while semantic identity remains unchanged.

---

# 126. State / Provenance on Derived Forms

Derived forms can carry:

- state;
- quality;
- purity;
- provenance;
- charge;
- contamination.

Processing determines which properties survive.

Do not blindly copy all metadata.

---

# 127. When Does a Form Need a Stable Registry Identity?

A resolved form/object requires a stable runtime identity where it is:

- saveable;
- networked;
- placeable;
- stackable;
- craftable;
- tradable;
- independently referenced.

The stable ID should resolve:

> material + form + authored behaviour

without creating duplicate material ontology.

FCC-13 owns exact IDs.

---

# 128. Single-Definition Block Rule

Where the placed and recovered object are physically the same object:

> one canonical Block/object identity owns inventory projection.

Do not maintain a separate duplicate Item solely because the object is in inventory.

Examples to clean in FCC-13 include old POC duplicates such as:

- Oak Log;
- Cobblestone;
- Stone Brick;
- Oak Beam;
- similar placed/recovered forms.

---

# 129. Different Form Justifies Different Product

The single-definition rule does **not** forbid distinct products.

Examples:

- Granite Block vs Granite Rubble;
- Oak Log vs Oak Plank;
- Iron Ingot vs Iron Wire;
- Raw Mana Crystal vs Mana Dust.

Those are physically different forms/products.

---

# 130. Multi-Material Products

An object made from multiple materials is normally a component/product rather than a new homogeneous material.

Example:

A machine gear assembly may contain:

- metal gear;
- axle;
- lubricant;
- rune insert.

The machine component can have its own object identity while retaining material composition.

---

# 131. Mixtures and Formulations

A deliberate mixture may become a material/formulation when:

- composition is stable/defined;
- it is reusable;
- it behaves as a meaningful feedstock.

Examples:

- alloy;
- ceramic body;
- mortar;
- concrete-like mixture;
- ink;
- alchemical formulation.

Exact mixture roster remains content/registry-owned.

---

# 132. Prophecy Ink

Prophecy Ink is an example of formulation logic.

It is not:

> Omen Dust in liquid form.

It is a crafted material/product derived from:

- Omen Dust;
- compatible binder/catalyst;
- appropriate process.

The resulting formulation has its own material/product behaviour.

---

# 133. Seasonal Resin

Seasonal Resin is a processed Season Sap derivative.

It demonstrates:

> raw biological fluid  
> → processed persistent material.

This is a transformed/processed lineage rather than a form-only rename.

---

# 134. Emberbone

Locked transformation:

> Bone Stone  
> + appropriate extreme heat/Deep conditions  
> → Emberbone.

Emberbone is distinct transformed material.

It is not simply:

> hot Bone Stone.

---

# 135. Celestial Metal

Locked transformation:

> Skyiron  
> + appropriate High-Aether/divine processing  
> → Celestial Metal.

The output is a distinct reusable material.

---

# 136. Storm Metal

Locked transformation:

> Skyiron  
> + persistent storm processing  
> → Storm Metal.

Temporary charge remains state.

Storm Metal is deliberately persistent.

---

# 137. Concord Metal

Locked transformation/formulation:

> Celestial Metal  
> + specialised civic/divine process  
> → Concord Metal.

It is not a realm ore.

---

# 138. Saint Steel

Locked alloy transformation:

> Steel  
> + approved Ascendant/Celestial inputs  
> + appropriate process  
> → Saint Steel.

It is a distinct alloy/formulation.

---

# 139. Contract Iron

Locked transformation:

> Ember Iron  
> + valid contract-binding process  
> → Contract Iron.

This remains one of the clearest examples of persistent magical material transformation.

---

# 140. Chain Metal

Chain Metal is a manufactured Ashen alloy/formulation.

It is not:

- a native ore;
- a universal metal tier.

Its precise recipe belongs to FCC-13.

---

# 141. Infernal Alloy

Infernal Alloy is an advanced Ashen alloy family/formulation.

It follows the same rule:

- manufactured;
- composition/process defined;
- no native ore.

---

# 142. Halo Glass

Locked transformation:

> Stormglass  
> + validated High-Aether/divine processing  
> → Halo Glass.

It is distinct transformed glass.

---

# 143. Grace Thread

Locked transformation:

> Windspun Fibre  
> + specialist Ascendant processing/attunement  
> → Grace Thread.

It is more than a simple thread form.

---

# 144. Transformation Does Not Imply Tier

A transformed material is not automatically:

- stronger;
- later;
- superior;
- universal replacement.

It may instead gain:

- specialist function;
- different trade-offs;
- environmental behaviour;
- magical compatibility.

Progression remains capability-based.

---

# 145. Exact-Material Versus Provider Requirement

Processes/recipes must distinguish:

## Exact Material Requirement

Used where the defining mechanic depends on:

- unique composition;
- unique magical structure;
- unique provenance;
- exact contract;
- exact biological source.

## Provider Requirement

Used where any material satisfying capabilities is acceptable.

Examples:

- structural timber;
- conductive metal;
- optical glass;
- heat-resistant lining;
- binding fibre.

This distinction is expanded in FCC-12C.

---

# 146. Processing Capability Versus Material Capability

Material capability answers:

> Can this material perform the role?

Processing capability answers:

> Can this station/tool/environment perform the operation?

Example:

Copper may be:
- conductive;
- ductile.

A wire-drawing station may provide:
- drawing capability.

A wire recipe requires both.

---

# 147. No Named-Station Lockout by Default

A recipe should not say:

> must use Station X

when the actual requirement is:

- heat;
- pressure;
- weaving;
- spirit-safe handling;
- contract binding.

Exact station requirement must be content-significant.

---

# 148. No Wrong-Realm Processing Lockout

A station is not invalid simply because it exists outside a material's home realm.

A foreign station may process the material if it supplies:

- required capabilities;
- environment;
- knowledge;
- safety;
- legal/magical conditions.

This principle is carried into FCC-12C.

---

# 149. Process Chains Can Cross Technologies

A material can move through:

- manual processing;
- mechanical processing;
- powered machinery;
- magical processing;
- automated lines;
- ritual processing.

The semantic process remains coherent.

Example:

Grinding can be performed by:
- hand mortar;
- mill;
- powered grinder;
- magical grinder;

if the required output quality/capability is satisfied.

---

# 150. Process Upgrade Does Not Necessarily Create New Recipe Identity

A more advanced machine may:

- increase throughput;
- reduce waste;
- improve precision;
- automate labour;
- improve quality;
- handle higher hazard.

It does not require a new material transformation if the output is physically the same.

---

# 151. Process Failure

Processes may fail or produce degraded outputs when:

- capability is insufficient;
- temperature is wrong;
- contamination is high;
- specialist environment is missing;
- material eligibility is violated.

Failure should not silently transform matter into arbitrary filler.

Possible outputs may include:

- damaged feedstock;
- scrap;
- slag;
- inert/degraded product;
- partial transformation.

Exact behaviour remains downstream.

---

# 152. Process Safety

Safety requirements may include:

- ventilation;
- shielding;
- heat protection;
- pressure containment;
- magical warding;
- cooling;
- toxic handling;
- legal authority;
- contract consent.

These are real process conditions.

---

# 153. Environmental Process Providers

An environment can provide process capability.

Examples:

- geothermal heat;
- natural high pressure;
- High-Aether field;
- sacred-law domain;
- dream coherence;
- storm field;
- seasonal influence.

This permits meaningful geography without hardcoding realm coordinates.

---

# 154. Player-Built Environmental Support

Players may reproduce specialist conditions where the relevant system permits.

Examples:

- pressure chamber;
- mana field;
- controlled atmosphere;
- cooling system;
- coherence stabiliser;
- warded ritual space.

This supports cross-realm engineering.

Exact devices belong to technical/content systems.

---

# 155. Process Ownership

FCC-12 owns the **semantic process family**.

Content documents may own:

- which products exist;
- which materials use them;
- cultural names;
- specialist stations.

Technical systems own:

- simulation;
- machine UI;
- timings;
- automation;
- networking.

This boundary prevents duplicate process definitions.

---

# 156. Recipe Ownership

FCC-12B does not lock exact recipes.

It locks:

- material lineage;
- form lineage;
- process family;
- capability requirement type.

FCC-13 later binds:

- exact ingredients;
- quantities;
- station rows;
- timings;
- aliases;
- IDs.

---

# 157. Portal Component Boundary

Portal components can use FCC-12 material/form/process rules.

FCC-12 may define:

- component identity;
- underlying material;
- provider role;
- transformation lineage.

FCC-13 owns:

- exact recipe;
- quantity;
- definitive Block/Item row;
- portal-component stable ID.

Realm Access owns runtime linking/activation.

---

# 158. Forge Authoring Implications

The redesigned Forge should eventually be able to author:

- material definitions;
- allowed-form profiles;
- reusable shape templates;
- specialist forms;
- process capabilities;
- station capabilities;
- transformed-material lineages;
- state visuals;
- form/material inheritance.

FCC-12B establishes requirements, not implementation.

---

# 159. Art Inheritance Implications

Derived forms should inherit coherent material identity.

Example:

Oak Heartwood:
- plank;
- beam;
- stair;
- door;

should visibly remain Oak Heartwood.

Contract Iron:
- ingot;
- plate;
- rod;
- component;

should visibly remain Contract Iron.

Final material art governance remains downstream.

---

# 160. Form Explosion Prohibition

Do not create a different semantic material for every:

> material × shape

combination.

Do not create:

- Granite-Slab-Material;
- Granite-Stair-Material;
- Granite-Wall-Material;

as separate substances.

These are:

> Granite + form.

---

# 161. State Explosion Prohibition

Do not create separate stable material definitions for every combination of:

- wet;
- damaged;
- charged;
- polluted;
- polished;
- realm-exported;
- owned by faction;
- blessed.

Use state/provenance/ownership data.

Only transformation creates new matter.

---

# 162. Process Explosion Prohibition

Do not create:

- Verdant Sawing;
- Ancestral Sawing;
- Somnolent Sawing;
- Deep Sawing;

as unrelated universal processes merely because the materials come from different realms.

Use:

> sawing + specialist handling/environment where required.

---

# 163. Station Explosion Prohibition

Do not create one mandatory station per material family merely to gate progression.

Stations should exist because they provide:

- capability;
- culture;
- efficiency;
- hazard handling;
- automation;
- unique gameplay.

Not because every new material requires a cosmetically renamed furnace.

---

# 164. Material Tier Explosion Prohibition

Do not use transformed materials as a hidden realm-tier ladder.

Capability must remain the deciding factor.

A common material may outperform a rare magical material in a role where its properties are better suited.

---

# 165. Legacy POC Form Cleanup

The old POC registry contains many one-off rows that predate the universal form model.

FCC-13 must reconcile those rows using:

- material identity;
- form;
- Block/inventory projection;
- migration aliases.

Old implementation structure does not override FCC-12B.

---

# 166. Legacy POC Processing Cleanup

Old POC machine-specific recipes may be retained as evidence that a process existed.

They must be re-bound to:

- universal process family;
- required capability;
- canonical material/form input;
- canonical output.

The old exact machine cannot automatically become the sole permanent owner.

---

# 167. Process Compatibility with Automation

Automation systems may route:

- inputs;
- reserved stock;
- outputs;
- by-products;
- waste.

Material-processing reservations must prevent:

- duplication;
- disappearance;
- incompatible consumption.

This aligns with prior chute/furnace reservation tests.

---

# 168. Reservation and Conservation

When multiple machines/processes compete for stock:

- inputs must be reserved;
- only valid consumption occurs;
- rejected material continues through logistics where appropriate;
- no duplicate claims on one physical item/lot.

Exact logistics architecture is downstream.

---

# 169. Process Quality Effects

A process may change:

- purity;
- structural quality;
- contamination;
- workmanship;
- stability.

Those outcomes remain multidimensional.

A better station can improve process outcome without creating a new base material.

---

# 170. Process Knowledge and Research

Research can unlock:

- transformation knowledge;
- alloy formulations;
- specialist handling;
- safer methods;
- alternate providers.

Knowledge progression does not need artificial material tiers.

---

# 171. Cross-Realm Knowledge

Knowledge can cross realms independently of matter.

A civilisation may learn:

- how to work Soulwood;
- how to stabilise Dream materials;
- how to forge Abyssal Iron;

before it possesses all required infrastructure.

Capability + knowledge + environment determine whether the process can actually occur.

---

# 172. Material Transformations Are Explicit

Every genuine transformed material should have an explicit lineage.

The lineage should record:

- parent material(s);
- process class;
- specialist conditions;
- output material;
- state/provenance effects.

Do not create unexplained transformed materials.

---

# 173. Locked Transformation Lineage Register

Current significant lineages include:

### Verdant
- Season Sap → Refined Season Sap → Seasonal Resin
- Thornsilver Fibre → Cord/Lattice → Oath-thread
- Bloomstone → season-charged state
- Greatheart biology → Greatheart Wood / Living Heartwood under valid preservation

### Somnolent
- Nightmare Sap → Nightmare Resin
- Lucid Glass → Fate / Abyssal-Dream states
- Dream Mote → configured states
- fibre source → Memory Thread → textile
- Omen Dust + binder/catalyst → Prophecy Ink

### Ascendant
- Skyiron → Celestial Metal
- Skyiron → Storm Metal
- Celestial Metal → Concord Metal
- Steel + Ascendant inputs → Saint Steel
- Stormglass → Halo Glass
- Windspun Fibre → Grace Thread

### Impossible Deep
- Bone Stone → Emberbone
- Abyssal Iron → gravity-conditioned state
- Seismic Crystal → specialist forms/states
- Pressure Pearl → Blackwater provenance/state

### Ashen
- Ember Iron → Contract Iron
- compatible inputs → Chain Metal
- compatible inputs → Infernal Alloy
- Hellglass → Ash Glass / Sootglass lineage

---

# 174. State Lineage Is Not Material Lineage

The register must distinguish:

### Material Transformation
- Ember Iron → Contract Iron

from:

### State/Form Change
- Pressure Stone → Inverted Stone facies
- Seismic Crystal → Orientation Crystal
- Pressure Pearl → Blackwater Pearl
- Bloomstone → Seasonal Crystal state

This distinction is mandatory in FCC-13.

---

# 175. Manufactured Component Lineage

Components may have a construction lineage without becoming material.

Example:

> materials + fabrication + configuration  
> → Coherence Core

The component can be:

- built;
- repaired;
- dismantled;
- recycled.

Its material composition remains independently addressable.

---

# 176. Reversibility

Processes may be:

- reversible;
- partially reversible;
- practically irreversible;
- chemically irreversible;
- magically irreversible.

Reversibility is one factor in transformation classification, not the only factor.

---

# 177. Destructive Processing

A process may intentionally destroy specialist structure.

Examples:

- killing Living Heartwood's living state;
- melting a carefully oriented crystal;
- burning a fibre;
- calcining a mineral.

The output can remain useful while losing specialist behaviour.

That is valid gameplay.

---

# 178. Preservation Processing

Specialist processes may preserve:

- living structure;
- memory;
- coherence;
- orientation;
- magical alignment;
- contract binding.

Preservation is a real capability requirement.

---

# 179. Material Loss

No process is assumed to be exactly 100% efficient.

Exact loss rates remain downstream.

FCC-12B only requires the architecture to support:

- recoverable output;
- waste;
- by-product;
- emission;
- loss.

---

# 180. No Gratuitous Micromanagement

Physical conservation does not require every sawdust particle or gas molecule to become an individually simulated item.

Systems may aggregate matter where appropriate.

The semantic rule is:

> do not create or destroy meaningful resource value without an authored process reason.

---

# 181. Processing Scale

The same process family may operate at:

- hand scale;
- workshop scale;
- machine scale;
- industrial scale;
- magical infrastructure scale.

Scale can change:

- throughput;
- efficiency;
- precision;
- automation;
- hazard.

The process semantics remain shared.

---

# 182. Culture and Process Naming

Cultures may name a process differently.

Those names may appear in:

- UI;
- lore;
- profession;
- recipes.

Canonical process identity can remain shared underneath.

---

# 183. Cultural Forms

A culture may author unique geometry or traditional form.

Example:

Two cultures may both make:

> timber beam

but one may have an ornate engineered joint with distinct structural behaviour.

That authored product can coexist with universal beam form.

---

# 184. Specialist Form Admission

A specialist form should be admitted when:

- it changes gameplay;
- it has unique geometry;
- it has unique material behaviour;
- it supports culture/worldbuilding meaning;
- it is needed for a system.

Do not author specialist forms merely to inflate content count.

---

# 185. Material/Form Compatibility Data

Each material should eventually expose an eligibility profile containing concepts such as:

- cuttable;
- sawable;
- forgeable;
- castable;
- drawable;
- rollable;
- weaveable;
- polishable;
- transparent;
- brittle;
- refractory;
- living;
- spirit-active;
- coherence-sensitive;
- pressure-dependent.

Exact schema remains technical/FCC-13 work.

---

# 186. Process Capability Data

A process/station should eventually expose concepts such as:

- max heat;
- pressure capability;
- atmosphere control;
- cutting capability;
- forging capability;
- weaving capability;
- alchemical capability;
- magical-field support;
- specialist handling;
- automation interface.

FCC-12B requires this semantic model but not final code schema.

---

# 187. Product Resolution

A final product may resolve from:

> material + form + process result + state + quality + provenance.

Example:

> Contract Iron + Plate + forged + cooled + Ashen provenance

remains:

- material: Contract Iron;
- form: plate;
- relevant state/quality/provenance.

It is not a separate material named `Ashen Contract Iron Plate Material`.

---

# 188. Definition Versus Instance

A material/form product definition is separate from runtime instance state.

Runtime instance can contain:

- damage;
- owner;
- provenance;
- charge;
- contamination;
- current quantity.

This follows the broader Leyforge definition/instance separation.

---

# 189. Processing and Save Stability

Stable IDs must survive:

- renamed display labels;
- moved files;
- changed UI;
- improved models;
- inherited form generation.

FCC-13 owns final ID/migration implementation.

---

# 190. Processing and Modding

The architecture should permit mods/content additions to:

- add material;
- assign allowed forms;
- add process capability;
- add transformation;
- add station provider;

without copying every universal recipe.

This is a strong reason for capability/form inheritance.

---

# 191. Processing and the Forge

The Forge should ultimately allow a creator to define:

1. material identity;
2. material properties;
3. allowed forms;
4. specialist forms;
5. process eligibility;
6. transformation outputs;
7. station capabilities;
8. state visuals;
9. component composition.

This requirement is handed to PRD/technical work rather than implemented here.

---

# 192. FCC-12B Ownership Boundary

FCC-12B is authoritative for:

- form semantics;
- form eligibility doctrine;
- process-family doctrine;
- capability-driven processing;
- transformation semantics;
- conservation doctrine;
- specialist processing-mode relationships;
- transformed-material lineages.

It is not authoritative for exact recipes or IDs.

---

# 193. FCC-12B Completeness Gate

- [x] material/form/process separation established;
- [x] universal form-inheritance doctrine established;
- [x] form eligibility established;
- [x] generated/inherited form policy established;
- [x] authored specialist-form policy established;
- [x] stone/masonry forms covered;
- [x] sand/gravel/soil/clay/ceramic covered;
- [x] wood/timber forms covered;
- [x] specialist timber preservation covered;
- [x] Plant Fibre disposition integrated;
- [x] fibre/textile forms covered;
- [x] hide/leather/chitin/bone covered;
- [x] metal forms covered;
- [x] alloy architecture covered;
- [x] all major locked metal transformations covered;
- [x] glass/crystal/gem/pearl forms covered;
- [x] fluid/gas containment architecture covered;
- [x] resin/sap/oil architecture covered;
- [x] energetic-resource processing covered;
- [x] universal process families established;
- [x] station capability model established;
- [x] named-station boundary established;
- [x] alternative-provider rule established;
- [x] operator knowledge separated from capability;
- [x] automation compatibility covered;
- [x] specialist realm processing modes covered;
- [x] transformation test incorporated;
- [x] conservation/waste/recycling covered;
- [x] processing provenance covered;
- [x] Block/inventory single-definition rule preserved;
- [x] form/state/process explosion prevention explicit;
- [x] POC migration handoff preserved;
- [x] FCC-13 ownership boundary preserved;
- [x] Forge/technical handoff preserved.

---

# 194. FCC-12B Result

> **FCC-12B — DERIVED FORMS, PROCESSING FAMILIES & MATERIAL TRANSFORMATION RULES — CANON WRITING COMPLETE v0.1**

FCC-12B now provides the universal structure for:

- material form inheritance;
- material eligibility;
- transformation;
- universal processing;
- specialist processing;
- conservation;
- recycling;
- machine/station capability resolution.

The next document is:

> **FCC-12C — Cross-Realm Export, Stabilisation, Substitution & Capability Equivalence**

Final FCC-12 lock still requires:

1. FCC-12C;
2. FCC-12D;
3. document-to-interview fidelity audit;
4. zero unresolved holds.

---

**End of FCC-12B v0.1**
