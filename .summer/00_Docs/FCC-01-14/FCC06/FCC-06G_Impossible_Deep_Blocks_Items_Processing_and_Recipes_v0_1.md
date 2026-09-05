# Leyforge Final Content Canon Collection

## FCC-06G — Impossible Deep Blocks, Items, Processing & Recipes

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock  
**Realm:** Impossible Deep  
**Stable Realm ID:** `realm.major.impossible_deep`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Depends On:** FCC-06A — Realm Identity, Laws, Progression & Canon Boundaries; FCC-06B — Biomes, Terrain, Environmental Hazards & Regional States; FCC-06C — Geology, Materials, Native Resources & Derived Material Canon; FCC-06D — Flora, Fungi, Agriculture, Crops & Food Ecology; FCC-06E — Creatures, Fauna & Ecology; FCC-06F — Civilisations, Settlements, Structures & Infrastructure  
**Supersession Role:** Converts locked FCC-06 realm content into authoritative realm-local Block, Item, processing, recipe-family and functional-component contracts while reconciling older registry duplication, obsolete material names and realm-specific workstation bloat.  
**Final Global Status:** **CONTENT CANON LOCKED — pending final cross-realm reconciliation.**

---

# 1. Purpose

FCC-06G defines the implementation-facing content contract for Impossible Deep Blocks, Items, processing relationships and recipe families.

It exists to answer:

- which realm materials require canonical Block representation;
- which harvested or processed outputs require canonical Item representation;
- which material states are states rather than new items;
- which derived forms are justified;
- which existing universal stations remain authoritative;
- which Impossible Deep structures provide genuinely distinctive processing;
- how crops and creature resources enter the item system;
- how Deepgate components relate to realm materials;
- how pressure, seismic, gravity, thermal and Blackwater technologies are expressed through recipes;
- which old names are migrated, aliased or retired;
- which recipe details must remain deferred to global reconciliation.

FCC-06G does **not** lock:

- exact ingredient counts;
- exact crafting times;
- exact fuel values;
- exact durability;
- exact attack/armour statistics;
- exact harvest-power numbers;
- exact progression-tier numbers;
- exact rarity percentages;
- exact machine throughput;
- final UI icons;
- final textures;
- final stable IDs for newly introduced content unless already established.

---

# 2. Core Registry Principle

Impossible Deep follows the universal Leyforge single-definition rule.

> If something is fundamentally a placeable Block and remains/recoverably returns as that same Block when mined, it remains **one canonical Block definition**.

Inventory representation uses the Block's inventory projection/reference.

A duplicate separately-authored Item must **not** be created merely because the Block can be carried.

Distinct Items are created only when matter is meaningfully transformed into forms such as:

- raw fragments;
- ore;
- concentrate;
- ingots;
- plates;
- rods;
- wires;
- powders;
- salts;
- oils;
- resins;
- pearls;
- foods;
- reagents;
- machine components;
- tools;
- weapons;
- armour;
- portable devices.

This rule applies to all FCC-06 content.

---

# 3. Realm-Local Registry Layers

Impossible Deep content is organised into six registry-facing layers:

1. **Natural Blocks**
2. **Constructed / Derived Blocks**
3. **Raw Resource Items**
4. **Processed Material Items**
5. **Functional Components**
6. **Food / Biological Items**

These layers describe content role, not separate progression tiers.

---

# 4. Natural Block Families

The following require or justify canonical natural Block representation where world generation uses them directly.

## 4.1 Pressure Stone

Natural principal structural geology.

Potential world states/facies may include:

- baseline Pressure Stone;
- Inverted Pressure Stone;
- Floating Pressure Stone;
- heat-altered Pressure Stone;
- Blackwater-mineralised Pressure Stone;
- Coreward Pressure Stone.

These should prefer state data, tags, generation metadata or variant data over duplicate top-level material identities where the matter remains Pressure Stone.

## 4.2 Bone Stone

Natural mineralised fossil matrix.

May appear as fossil walls, fossil beds, colossal fossil structures or archaeological structural geology.

## 4.3 Emberbone

Naturally occurring heat-transformed Bone Stone.

May appear in forge-wall deposits, thermal fossil formations or magma-adjacent fossil strata.

## 4.4 Seismic Crystal Formation

Natural Seismic Crystal clusters or embedded crystal deposits.

Orientation, Compressed and Coreward crystal states do not automatically require separate Block families.

## 4.5 Ventglass Formation

Natural vent-formed deposits.

## 4.6 Black Brine Salt Deposit

Where world generation justifies large mineral salt formations.

Loose/refined salt remains Item content.

## 4.7 Deepfire Ember Deposit / Formation

Where realm generation uses embedded energetic formations.

Portable harvested Deepfire Ember remains Item content.

## 4.8 Resonance Tree Structural Blocks

Living/harvestable organism blocks or structural growths are owned biologically by FCC-06D but may require Block representation for trunk/column growth, branches, rooted growth and harvestable Resonance Wood.

## 4.9 Producer Blocks

Living producer content may use Block representations where appropriate:

- Pressure Bulb crop;
- Dense Reed / Brine Reed;
- Quakevine;
- Quakefruit Growth;
- Ceiling Fern;
- Blackwater Mat;
- Lantern Fungus;
- Forgecap;
- Fossil Spore Colony;
- Vent Bloom;
- Chasm Lichen.

Final block-state implementation belongs to global registry reconciliation.

---

# 5. Constructed Pressure Stone Forms

Justified Pressure Stone construction forms include:

- cut block;
- brick;
- slab;
- stair;
- wall;
- pillar;
- pressure arch.

Additional structural forms may exist where universal building systems generate them procedurally or through a shape system.

The content registry must avoid hand-authoring every possible material × shape permutation unless technically required.

---

# 6. Bone Stone Constructed Forms

Justified forms include:

- cut Bone Stone;
- structural fossil block;
- carved fossil block;
- selected slab;
- selected pillar.

Decorative fossil forms should be added only where architectural/cultural use justifies them.

---

# 7. Emberbone Constructed Forms

Justified forms include:

- Emberbone block;
- Emberbone brick;
- refractory plate/block;
- forge-lining block.

Emberbone should not inherit every Pressure Stone decorative form automatically.

---

# 8. Ventglass Constructed Forms

Justified forms include:

- Ventglass block;
- Ventglass pane;
- pressure-rated window;
- specialist viewport.

Functional lens and instrument components remain Items.

---

# 9. Resonance Wood Constructed Forms

Justified Block forms include:

- Resonance Wood/log;
- plank;
- beam;
- panel;
- selected slab;
- selected stair;
- selected furniture/building forms where universal systems support them.

Resonance Wood must not automatically create a full decorative wood library solely because ordinary Overworld woods possess one.

---

# 10. Natural Resource Items

The following are canonical portable raw-resource Item families where they are not represented directly as carried Blocks.

## 10.1 Abyssal Iron Ore / Concentrate

Abyssal Iron extraction may yield ore chunk, crushed ore or concentrate depending on final universal mining/processing design.

The final number of intermediate forms should be minimised.

## 10.2 Seismic Crystal Shard

Portable crystal material harvested from natural formations.

## 10.3 Pressure Pearl

Canonical biomineral Item.

## 10.4 Pressure Resin

Raw resin Item.

## 10.5 Black Brine Salt

Loose raw salt Item.

## 10.6 Gravity Nodule

Portable anomaly resource Item.

## 10.7 Deepfire Ember

Portable contained/raw energetic Item.

## 10.8 Pressure Oils

Raw biological oil Item or fluid-container content under final liquid-item rules.

## 10.9 Creature Materials

Examples include Pressure Shell, mollusc shell, heat-resistant Emberback plates, hides, meats and other justified anatomy-derived materials.

Exact creature-drop definitions remain bounded by FCC-06E provenance.

---

# 11. Processed Abyssal Iron Items

The canonical processed Abyssal Iron family may include:

- ingot;
- plate;
- rod;
- wire;
- fittings;
- reinforcement;
- machine components.

Tools, armour and weapons made from Abyssal Iron belong to universal equipment systems and final equipment registries.

Not every processed form requires its own crafting station.

---

# 12. Processed Seismic Crystal Items

Possible processed forms include:

- cut crystal;
- calibrated crystal;
- resonator;
- sensor component;
- orientation-calibrated component;
- compressed crystal component;
- Coreward-grade crystal component.

The underlying crystal lineage remains Seismic Crystal.

---

# 13. Processed Ventglass Items

Possible portable processed forms include:

- cut Ventglass;
- lens;
- instrument viewport;
- pressure-apparatus component;
- thermal-apparatus component.

Large panes/blocks remain Block content where placeable.

---

# 14. Processed Pressure Pearl Items

Possible processed forms include:

- polished Pressure Pearl;
- calibrated Pressure Pearl component.

Pressure Pearl should remain a specialist resource rather than becoming a universal gemstone substitute.

---

# 15. Processed Pressure Resin Items

Possible processed forms include:

- refined sealant;
- adhesive;
- flexible pressure compound;
- waterproofing compound;
- medical compound where recipe canon supports it.

---

# 16. Processed Black Brine Salt Items

Possible forms include:

- refined salt;
- preservation mixture;
- chemical mixture;
- industrial mixture;
- ritual mixture where cultural content requires it.

A new Item should exist only where the mixture has a distinct gameplay role.

---

# 17. Gravity Nodule Components

Possible processed forms include:

- stabilised Gravity Nodule;
- calibrated Gravity Nodule;
- gravity-control component.

The nodule remains a specialist anomaly resource rather than a conventional ore.

---

# 18. Deepfire Ember Components

Possible processed forms include:

- contained Deepfire Ember;
- stabilised Deepfire component;
- spent/depleted ember state where final energy rules require it.

Deepfire Ember is not converted into generic coal or ordinary fuel.

---

# 19. Fossil Alloy Items

Fossil Alloys are archaeological manufactured materials.

Possible registry forms include:

- recovered alloy plate;
- recovered alloy component;
- recovered machine part;
- identified alloy ingot/component where reconstruction becomes possible.

“Fossil Alloy” is a provenance/manufacture category until individual alloy identities are justified.

---

# 20. Crop & Harvest Items

The five formal native crops require harvested Item representation where appropriate:

1. **Quake Fruit**
2. **Pressure Bulb**
3. **Deepcap**
4. **Brine Reed**
5. **Ember Bean**

Possible secondary products include Brine Reed fibre, crop seeds/spores/propagules, preserved produce, fermented produce and feed.

Exact forms must remain useful and non-redundant.

---

# 21. Propagation Items

Different producer families may use different propagation methods.

Possible Item forms include:

- Quakefruit seed/propagule;
- Pressure Bulb cutting/bulblet;
- Deepcap spores/culture;
- Brine Reed cutting/seed;
- Ember Bean seed;
- Resonance Tree propagule;
- fungal culture;
- Blackwater Mat culture.

Not every producer requires a conventional seed item.

---

# 22. Food Item Philosophy

FCC-06G locks **ingredient provenance and recipe families**, not a complete final cuisine.

Potential recipe families include:

- Quake Fruit foods;
- Pressure Bulb staples;
- Deepcap meals;
- Brine Reed dishes;
- Ember Bean dishes;
- Blackwater seafood;
- mollusc dishes;
- Pressure Crab dishes;
- Brineback products;
- preserved Deep rations;
- fermented Deep foods.

Universal cooking systems should be reused.

---

# 23. Example Food Product Families

These are permitted recipe-family directions, not exact final recipes.

## Pressure Bulb
- roasted/baked bulb;
- stew;
- mash;
- flour/starch product;
- preserved bulb.

## Quake Fruit
- fresh fruit;
- dried fruit;
- preserve;
- fermented drink;
- medicinal preparation.

## Deepcap
- cooked fungus;
- dried ration;
- stew;
- fermented product.

## Brine Reed
- edible shoots;
- brined/preserved food;
- fibre by-product.

## Ember Bean
- cooked beans;
- paste;
- protein ration;
- fermented food.

Final naming and exact nutrition remain deferred.

---

# 24. Creature-Derived Food & Resource Items

Possible creature-derived item categories include:

- Pressure Crab meat;
- Pressure Shell;
- Vault Mollusc meat;
- mollusc shell;
- Pressure Pearl;
- Brineback meat;
- Brineback oil;
- Brineback hide;
- Emberback meat;
- Emberback heat-resistant hide/plate;
- Fossil Grazer meat/hide/bone where culturally used.

Not every creature requires a loot table containing every anatomical component.

---

# 25. Universal Processing Reuse

Impossible Deep reuses universal Leyforge processing where possible.

Examples include:

- crafting/workbench;
- stone cutting;
- basic furnace/smelting;
- cooking;
- drying;
- brewing/fermentation;
- weaving/fibre work;
- basic metalworking;
- woodworking;
- storage;
- fluid handling.

No new realm-specific station should be introduced when an existing universal station already expresses the process adequately.

---

# 26. Realm-Specific Processing Structures

Distinctive Impossible Deep infrastructure is justified only where the process itself depends on Deep conditions.

Primary examples:

- **Deep Forge**
- **Seismic Choir**
- pressure chambers / Pressure Sanctuary infrastructure
- gravity calibration systems
- specialist Blackwater handling
- Deepgate assembly/attunement systems

These are not all conventional crafting tables.

Some are world structures providing process context, capability or validation.

---

# 27. Deep Forge Recipe Domain

The **Deep Forge** is the principal specialist industrial structure.

Its recipe domain may include:

- advanced Abyssal Iron processing;
- Emberbone refractory treatment;
- Ventglass shaping under extreme conditions;
- Deepfire Ember containment;
- Fossil Alloy reconstruction;
- pressure-assisted metallurgy;
- advanced structural components.

The Deep Forge must not own ordinary planks, simple stone bricks, common cooking or routine crafting.

---

# 28. Seismic Choir Process Domain

The Seismic Choir may enable or validate:

- Seismic Crystal calibration;
- resonator tuning;
- seismic sensor components;
- route-mapping calibration;
- controlled resonance processes.

The Choir is better understood as **networked processing/instrument infrastructure** than as a one-block workstation.

---

# 29. Gravity Calibration Domain

Gravity-related recipes may require:

- Gravity Nodule;
- Orientation Crystal;
- Abyssal Iron components;
- calibrated supports;
- suitable machinery.

Possible output families include:

- orientation instrument;
- gravity anchor component;
- Abyss Lift component;
- stabilised gravity assembly;
- Spatial Catalyst.

---

# 30. Spatial Catalyst

**Spatial Catalyst** is a crafted/research component category.

It may combine:

- Gravity Nodules;
- Orientation Seismic Crystal;
- compatible metal/structural components;
- other globally reconciled reagents.

Possible uses include:

- folded-route stabilisation;
- advanced Abyss Lift systems;
- deep navigation;
- spatial research.

It is not a naturally mined resource.

---

# 31. Pressure Technology Recipe Domain

Pressure technology may use combinations of:

- Pressure Stone;
- Abyssal Iron;
- Ventglass;
- Pressure Pearl;
- Pressure Resin;
- pressure-compatible textiles/materials;
- universal mechanical components.

Possible outputs include:

- seals;
- pressure fittings;
- pressure window assemblies;
- bulkhead components;
- habitat components;
- pressure suit parts;
- pressure-lock components.

Exact recipes remain deferred.

---

# 32. Seismic Technology Recipe Domain

Seismic technology may use combinations of:

- Seismic Crystal;
- Resonance Wood;
- Abyssal Iron;
- universal mechanical/electrical/magical components.

Possible outputs include:

- tremor sensor;
- resonator;
- seismic beacon;
- structural monitor;
- communication-through-stone component;
- Seismic Choir module.

---

# 33. Structural Engineering Recipe Domain

Deep structural recipes may use:

- Pressure Stone;
- Abyssal Iron reinforcement;
- Pressure Resin;
- Resonance Wood;
- Emberbone where heat resistance is needed;
- Ventglass for specialist windows.

Outputs may include:

- pressure arch;
- reinforced bulkhead;
- support frame;
- seismic brace;
- pressure-rated hatch;
- refuge component.

---

# 34. Blackwater Technology Recipe Domain

Blackwater technology may use:

- Ventglass;
- Abyssal Iron;
- Pressure Resin;
- Pressure Pearl;
- Black Brine Salt;
- universal fluid-control components.

Possible outputs include:

- submersible viewport;
- pressure-safe pipe/valve;
- brine-processing component;
- aquatic habitat component;
- deep-water navigation equipment.

---

# 35. Thermal Technology Recipe Domain

Thermal/forge recipes may use:

- Emberbone;
- Ventglass;
- Abyssal Iron;
- Deepfire Ember;
- heat-resistant creature materials;
- universal forge components.

Possible outputs include:

- refractory lining;
- thermal chamber;
- heat-resistant tool component;
- Deepfire containment unit;
- advanced furnace component.

---

# 36. Fossil Archaeotechnology Recipe Domain

Recovered knowledge may permit:

- repair of relic machinery;
- salvage of Fossil Alloy;
- identification of ancient components;
- reconstruction of selected ancient assemblies;
- replication of specific alloys where knowledge is recovered.

Archaeotechnology recipes should be provenance-gated by recovered knowledge, relic study, archive access, faction/authority outcomes and compatible infrastructure.

They must not become generic drops from unrelated enemies.

---

# 37. Folded-Route Navigation Components

Possible recipe families include:

- route beacon;
- fold-map instrument;
- stabilisation marker;
- gravity/orientation compass;
- seismic route sensor;
- Spatial Catalyst module.

These systems must respect FCC-06A/B bounded fold topology.

No Item may function as a generic unrestricted teleportation token.

---

# 38. Abyss Lift Component Families

Abyss Lift construction may require:

- structural frame components;
- pressure-rated lift segments;
- cable/counterweight components;
- Gravity Nodule assemblies where used;
- Orientation Crystal modules;
- Abyssal Iron machinery.

Different Lift technologies may use different subsets.

No universal one-recipe implementation is locked here.

---

# 39. Pressure Sanctuary Component Families

Possible construction/maintenance components include:

- pressure-sealed wall system;
- pressure hatch/bulkhead;
- Ventglass viewport;
- Pressure Resin seal;
- atmosphere-control component;
- emergency reservoir;
- refuge storage;
- pressure-monitoring module.

The Sanctuary is a structure system rather than a single magic block.

---

# 40. Luminous Market Content Boundary

The Luminous Market is primarily a civic structure.

Its unique content may include route boards, trade displays, safe-light infrastructure, specialist stalls and navigation markers.

It does not require a unique crafting-resource tier merely to be visually distinctive.

---

# 41. Worldroot Bastion Content Boundary

Worldroot Bastions may use:

- actual Worldroot/Verdant material;
- Pressure Stone;
- Resonance Wood;
- universal fortification components;
- Deepgate infrastructure.

Impossible Deep does not invent a fake native “Worldroot Wood” substitute.

---

# 42. Deepgate Core Component Contract

FCC-06G recognises the canonical **Deep Keystone** concept.

A Deepgate assembly may require:

1. structural frame;
2. anchoring/stabilisation layer;
3. **Deep Keystone**;
4. pressure/depth attunement;
5. activation interface;
6. destination binding.

The exact material recipe for the first Deep Keystone remains deferred.

---

# 43. First-Deepgate Recipe Boundary

The first accessible Deepgate must **not** require Impossible Deep-native resources that the player cannot yet obtain.

Therefore first-access recipes must use:

- Overworld materials;
- previously accessible realm materials;
- globally available progression components;
- knowledge/key requirements

as determined during final portal progression reconciliation.

FCC-06G must not hard-code an impossible self-locking recipe.

---

# 44. Deepgate Upgrade Recipes

After entering Impossible Deep, later Deepgate upgrades may use:

- Pressure Stone;
- Abyssal Iron;
- Seismic Crystal;
- Pressure Pearl;
- Ventglass;
- Gravity Nodule technology;
- Deepfire Ember.

Possible upgrades include:

- improved stability;
- cargo throughput;
- safer pressure arrival;
- improved destination binding;
- better emergency recovery.

These remain one Deepgate family.

---

# 45. Deepgate Destination Components

Advanced target-binding may require:

- mapped destination data;
- Seismic Crystal calibration;
- gravity/orientation data;
- route attunement;
- authority/settlement knowledge;
- other globally defined portal components.

No exact formula is locked here.

---

# 46. Equipment Hooks

Impossible Deep materials may participate in universal:

- tools;
- armour;
- weapons;
- survival gear;
- exploration equipment.

Potential examples include:

- Abyssal Iron structural/tool components;
- Ventglass optics;
- Pressure Pearl pressure equipment;
- Pressure Resin seals;
- Seismic Crystal sensors;
- Gravity Nodule navigation devices;
- Emberbone heat-resistant components.

FCC-06G does not create a separate Deep-only equipment progression tree.

---

# 47. Harvest Capability Rule

Material extraction uses universal harvest capability.

Rules:

- no arbitrary realm-specific pickaxe name is required;
- any cross-realm tool meeting the capability requirement can harvest the material;
- environmental survival requirements remain separate from harvest power;
- specialist extraction may require stabilisation/safety systems.

This preserves universal progression coherence.

---

# 48. Material Capability Relationship

Deeper/extreme materials may generally demand stronger extraction capability, but FCC-06G does not lock exact numbers.

Likely relative difficulty may distinguish:

- ordinary Pressure Stone;
- reinforced/altered Deep geology;
- Abyssal Iron;
- extreme crystal deposits;
- Coreward formations.

Final capability mapping belongs to FCC-12/FCC-13.

---

# 49. Processing Chain Discipline

Recipe chains should remain as short as design meaning allows.

Avoid chains such as:

> ore → dust → powder → grit → concentrate → enriched concentrate → pellet → billet → bloom → ingot

unless the intermediate steps each have real gameplay purpose.

A realm with complex geology does not require tedious processing bloat.

---

# 50. Material-State Discipline

The following should usually remain state/variant data rather than duplicate items:

- Inverted Pressure Stone;
- Floating Pressure Stone;
- gravity-conditioned Abyssal Iron;
- Blackwater Pressure Pearl;
- Orientation Seismic Crystal;
- Compressed Seismic Crystal;
- Coreward Seismic Crystal.

A separate Item is justified only when players meaningfully handle/process that state as a distinct portable object.

---

# 51. Provenance-Based Rewards

Dungeon and authority rewards must use actual provenance.

Examples:

- Pressure Vault → stored Pressure Pearl, Seismic Crystal, archive components, pressure technology;
- Inverted Mine → Abyssal Iron, Orientation Crystal, Gravity Nodules;
- Fossil City → Fossil Alloys, scripts, relic machinery;
- Seismic Forge → advanced forged components, Seismic Crystal technology;
- Blackwater Citadel → Blackwater trade goods, Pressure Pearls, aquatic technology.

Generic random “Deep Loot” should not override provenance.

---

# 52. Authority Reward Boundary

Pressure Titan, Blackwater Matriarch and Fossil Crown need not be killed to grant progression-relevant rewards.

Possible recipe/knowledge unlocks may come from:

- alliance;
- negotiation;
- study;
- restoration;
- charter;
- successful non-lethal resolution.

Reward type may include:

- recipe knowledge;
- route access;
- legal resource access;
- specialist component;
- ancient blueprint;
- material provenance rights.

---

# 53. Knowledge as Recipe Gate

Some recipes should be unlocked by **knowledge**, not merely by finding a material.

Examples:

- Fossil Alloy reconstruction;
- advanced Seismic Choir components;
- Deepgate destination calibration;
- ancient pressure machinery;
- Fold stabilisation.

Knowledge may come from archives, NPCs, authorities, research, relics or quests.

Knowledge is not necessarily an inventory item.

---

# 54. Cultural / Legal Recipe Access

Some cultures may restrict:

- pearl cultivation methods;
- Fossil Alloy reconstruction;
- sacred-material carving;
- Blackwater nursery technology;
- Deepfire extraction.

Restriction may be legal, factional, cultural or knowledge-based.

Physical possession of ingredients does not always imply lawful access.

---

# 55. Repair Recipes

Deep structures may require repair recipes for:

- seals;
- pressure doors;
- lift systems;
- Seismic Choir modules;
- Ventglass windows;
- thermal linings;
- route anchors.

Repair should generally use component replacement rather than complete structure recrafting.

---

# 56. Maintenance Consumables

Possible maintenance consumables include:

- Pressure Resin sealant;
- lubricants/Pressure Oils;
- replacement crystal components;
- refined salts/chemicals;
- structural fittings.

Maintenance must remain bounded and purposeful, not constant busywork.

---

# 57. Automation Compatibility

Impossible Deep processing may integrate with universal automation.

Automatable operations may include:

- ore movement;
- smelting;
- component assembly;
- pressure regulation;
- brine processing;
- farming;
- aquaculture feeding;
- crop harvesting;
- storage;
- logistics.

Realm content must not require manual repetition when universal automation is intended to support that process.

---

# 58. Industrial Safety States

Industrial structures may expose machine states such as:

- operational;
- under-pressure;
- overheating;
- unstable;
- damaged;
- sealed;
- emergency shutdown.

These are machine/system states rather than new Block families.

---

# 59. Recipe Categories

FCC-06G recognises the following realm-local recipe families:

1. structural masonry;
2. Resonance Wood construction;
3. Abyssal Iron metallurgy;
4. Seismic Crystal calibration;
5. Ventglass shaping;
6. Pressure Pearl processing;
7. Pressure Resin chemistry;
8. Black Brine Salt chemistry;
9. Gravity Nodule calibration;
10. Deepfire containment;
11. Emberbone refractory processing;
12. Fossil Alloy archaeology/reconstruction;
13. pressure technology;
14. seismic technology;
15. gravity/orientation technology;
16. Blackwater technology;
17. Fold navigation technology;
18. agriculture;
19. food;
20. Deepgate components.

This is a recipe-family inventory, not a requirement for exactly twenty crafting menus.

---

# 60. Crop Processing Families

## Quake Fruit
- fresh;
- preserved;
- fermented;
- medicinal.

## Pressure Bulb
- cooked;
- mashed;
- preserved;
- flour/starch where justified.

## Deepcap
- cooked;
- dried;
- fermented.

## Brine Reed
- food;
- fibre;
- preserved product.

## Ember Bean
- cooked;
- paste;
- ration;
- fermented.

Exact recipe names and nutrition remain deferred.

---

# 61. Aquaculture Processing Families

Possible systems include:

- Vault Mollusc husbandry;
- Pressure Pearl recovery;
- shell processing;
- Brineback products;
- Blackwater Mat feed;
- aquatic food preparation.

Aquaculture should link ecology, settlement and processing rather than act as a generic loot machine.

---

# 62. Resonance Wood Processing

Resonance Wood may use universal sawmill/woodworking, with specialist calibration only where resonance function matters.

Potential specialist outputs include:

- resonant rod;
- instrument frame;
- sensor housing;
- Seismic Choir component.

Normal planks do not require a Seismic Choir.

---

# 63. Pressure Stone Processing

Pressure Stone may use universal stone cutting for:

- cut stone;
- brick;
- slab;
- stair;
- wall;
- pillar.

Pressure-specific components such as arches, bulkheads and reinforced structural elements may combine Pressure Stone with metal/seal components.

---

# 64. Bone Stone Processing

Bone Stone may be:

- cut;
- carved;
- used structurally;
- analysed archaeologically.

Processing does not convert it to fresh biological bone.

---

# 65. Emberbone Processing

Emberbone may require heat, cutting or Deep Forge treatment for specialist refractory outputs.

The exact chain remains deferred.

---

# 66. Ventglass Processing

Ventglass may require controlled heat, pressure, cooling and cutting.

Advanced forms may therefore justify Deep Forge or specialist pressure infrastructure.

---

# 67. Seismic Crystal Calibration

Seismic Crystal's special forms may depend on:

- source state;
- pressure;
- gravity;
- resonance;
- calibration.

Processing should preserve the distinction between natural provenance and calibrated function.

Not every state should be craftable from every other state.

---

# 68. Gravity Nodule Calibration

Gravity Nodules may require stabilisation before integration into machinery.

Possible conceptual sequence:

> raw nodule → stabilised nodule → calibrated component

This is not a fixed exact recipe.

---

# 69. Deepfire Containment

Raw Deepfire Ember may require:

- containment vessel;
- thermal insulation;
- pressure-tolerant housing;
- stabilisation.

Handling systems must preserve the difference between raw resource and safely usable component.

---

# 70. Black Brine Salt Processing

Salt processing may use universal chemical/food systems where available.

Distinct recipes may exist for:

- preservation;
- metallurgy;
- medicine;
- industrial chemistry;
- cultural ritual.

No separate “Deep Alchemy Table” is required by default.

---

# 71. Pressure Resin Processing

Pressure Resin may be:

- refined;
- mixed;
- cured;
- applied.

Recipe outputs should map to actual uses such as:

- sealant;
- adhesive;
- flexible gasket material;
- medical compound.

---

# 72. Fossil Alloy Reconstruction

Recovered Fossil Alloy may initially be:

- non-reproducible;
- partially understood;
- repair-only;
- salvage-only.

Later knowledge may enable composition analysis, alloy recreation and component manufacture.

Progression can therefore be knowledge-driven rather than simply tier-driven.

---

# 73. Recipe Provenance Metadata

Where useful, recipes may track provenance such as:

- discovered from archive;
- learned from Pressure Community;
- learned from Forge City;
- recovered from Fossil Metropolis;
- granted by authority;
- researched.

Provenance should not clutter ordinary universal recipes.

---

# 74. Capability Tags

Final global registry may use machine-readable tags describing properties such as:

- pressure resistant;
- heat resistant;
- seismic resonant;
- gravity sensitive;
- gravity stable;
- Blackwater compatible;
- fossil material;
- Impossible Deep native;
- sealant;
- resonator;
- pressure component;
- gravity component;
- thermal component;
- portal component;
- archaeological;
- food;
- reagent.

FCC-06G does not lock exact tag names.

It locks the need for machine-readable material and component capability metadata.

---

# 75. Resource Anchor Preservation

The six established Impossible Deep specialist resource anchors remain preserved:

- `res.realm.impossible_deep.01` — Pressure Pearl
- `res.realm.impossible_deep.02` — Abyssal Iron
- `res.realm.impossible_deep.03` — Seismic Crystal
- `res.realm.impossible_deep.04` — Black Brine Salt
- `res.realm.impossible_deep.05` — Ventglass
- `res.realm.impossible_deep.06` — Deepfire Ember

Global reconciliation may update metadata or namespace representation, but stable provenance must not be casually destroyed.

---

# 76. New Registry Candidates

New canonical realm-local registry candidates include:

## Materials / Blocks
- Pressure Stone;
- Bone Stone;
- Emberbone;
- Resonance Wood;
- Pressure Resin;
- Gravity Nodule;
- Pressure Oils category/product definitions;
- Fossil Alloy category/identified alloys where justified.

## Crops / Foods
- Quake Fruit;
- Pressure Bulb;
- Deepcap;
- Brine Reed;
- Ember Bean.

## Components
- resonator;
- seismic sensor component;
- gravity/orientation component;
- Deepfire containment component;
- pressure-seal component;
- Deep Keystone;
- Spatial Catalyst.

Final IDs remain deferred.

---

# 77. Legacy Registry Reconciliation

| Legacy / Broad Entry | FCC-06G Implementation Resolution |
|---|---|
| Deepstone used as Impossible Deep signature stone | Do not use as signature; Pressure Stone owns realm-native structural geology |
| Deep Forge Stone | Retire/migrate as separate natural resource |
| Inverted Stone | Pressure Stone state/facies |
| Floating Stone | Pressure Stone state/facies |
| Deep Metal | Alias/local wording; resolve to Abyssal Iron where context matches |
| Gravity Ore | Gravity-conditioned Abyssal Iron deposit/state |
| Orientation Crystal | Seismic Crystal state/form |
| Compressed Crystal | Seismic Crystal state/form |
| Core Crystal | Coreward Seismic Crystal state/form |
| Blackwater Pearl | Pressure Pearl provenance/state |
| Deep Ember | Legacy shorthand for Deepfire Ember |
| Spatial Catalyst as raw ore | Reject; crafted/research component |
| Worldroot Support as native wood | Reject; actual imported/cross-realm Worldroot material |
| Relic Material tier | Reject; relic is provenance/status |
| Duplicate Item for placeable Block | Remove/reconcile under single-definition rule |

---

# 78. Migration Compatibility

Where old saves or registry data use superseded names, migration may preserve:

- alias;
- old ID mapping;
- conversion rule;
- deprecation metadata.

Migration must avoid deleting player-owned resources without conversion, silently changing unrelated materials or producing duplicate active definitions.

---

# 79. Recipe-Save Compatibility

Recipe changes during global reconciliation should preserve, where practical:

- learned recipes;
- unlocked knowledge;
- owned crafted items;
- structure states.

If exact recipes change, migration should update definitions rather than invalidating saves needlessly.

---

# 80. Cross-Realm Material Use

Impossible Deep materials may appear in recipes outside the realm.

Examples:

- Pressure Resin in pressure/waterproofing;
- Ventglass in advanced engineering;
- Seismic Crystal in structural monitoring;
- Gravity Nodules in cross-realm gravity research;
- Abyssal Iron in tools/machinery.

Cross-realm use does not erase native provenance.

---

# 81. Cross-Realm Equipment Compatibility

A tool or machine made elsewhere can use Impossible Deep components if:

- recipe systems permit it;
- capability requirements are met;
- specialised behaviour is compatible.

Impossible Deep does not require all gear to be manufactured entirely from native materials.

---

# 82. Export Stabilisation

Some exported components may require stabilisation.

Examples:

- Gravity Nodule machinery;
- Deepfire Ember containment;
- specialised Seismic Crystal behaviour.

Stabilisation is an authored recipe/process where physically justified, not a generic export tax on all resources.

---

# 83. No Realm-Exclusive Workstation Bloat

FCC-06G explicitly rejects automatic creation of:

- Pressure Crafting Table;
- Blackwater Crafting Table;
- Gravity Crafting Table;
- Fossil Crafting Table;
- Coreward Crafting Table

unless a future process genuinely requires one.

Distinctive structures should exist because their process is distinct.

---

# 84. No Material × Equipment Explosion

Not every material must create:

- sword;
- axe;
- pickaxe;
- shovel;
- hoe;
- full armour set;
- shield;
- bow;
- every machine tier.

Equipment recipes require meaningful design role.

This preserves readable progression and asset scope.

---

# 85. No Material × Block-Shape Explosion

Not every material must create:

- slab;
- stair;
- wall;
- fence;
- gate;
- button;
- pressure plate;
- pillar;
- tile;
- chiseled form;
- mosaic.

Only justified forms are canonical.

Universal procedural shape systems may provide broader flexibility without multiplying canonical authored definitions.

---

# 86. No Consumable Explosion

Not every biological resource needs:

- potion;
- tonic;
- elixir;
- tea;
- soup;
- stew;
- salve;
- powder

unless distinct gameplay uses justify them.

Food and medicine remain readable categories.

---

# 87. Recipe Validation Rules

A final FCC-06 recipe must satisfy:

- ingredients exist canonically;
- provenance makes sense;
- required station exists;
- output has clear use;
- no self-locking progression;
- no duplicate material family;
- no duplicate universal station;
- no unnecessary intermediate;
- cross-realm dependencies are intentional;
- save migration is possible where replacing legacy content.

---

# 88. Portal Recipe Validation Rules

A Deepgate recipe must additionally satisfy:

- first portal is constructible before entering Impossible Deep;
- portal remains one canonical family;
- later native upgrades do not become separate unrelated portal types;
- exact progression fits global realm order;
- destination binding cannot bypass realm progression;
- portal component names remain consistent.

---

# 89. Structure Recipe Validation Rules

A signature structure recipe must:

- express the structure's actual function;
- reuse universal building components;
- use native specialist materials only where justified;
- scale reasonably for construction gameplay;
- not require rare authority loot for basic settlement survival unless explicitly intended.

---

# 90. Agricultural Recipe Validation

Farm/food recipes must:

- use actual canonical crops/creature products;
- respect habitat requirements;
- avoid invented crop families;
- distinguish living crop Block from harvested food Item;
- integrate with universal farming/cooking systems.

---

# 91. Creature Resource Validation

Creature-derived Items must:

- have explicit anatomical/ecological provenance;
- avoid contradicting FCC-06E;
- avoid turning rare ecological materials into generic drops;
- support non-lethal alternatives where canon provides them.

Pressure Pearl is the strongest example of this rule.

---

# 92. Archaeological Recipe Validation

Relic/Fossil Alloy recipes must:

- preserve provenance;
- require knowledge where appropriate;
- respect cultural/ownership consequences;
- avoid making ancient technology trivial generic crafting.

---

# 93. Relationship to FCC-06H

FCC-06H owns:

- dungeon families;
- guardians;
- authorities;
- major encounter rewards.

FCC-06G defines the allowable Block/Item/recipe content those adventure systems may grant.

FCC-06H may not invent unsupported “boss materials” merely because a boss exists.

---

# 94. Relationship to FCC-06I

FCC-06I owns:

- corruption states;
- regional-event consequences;
- cross-realm state transitions.

FCC-06G must support those systems through:

- repair components;
- stabilisation;
- corrupted state handling;
- persistent machine/structure states.

---

# 95. Relationship to FCC-06J

FCC-06J will provide the final realm-local registry/art handoff.

FCC-06G supplies:

- content families;
- implementation categories;
- legacy migration;
- recipe constraints;
- stable anchor preservation.

---

# 96. Relationship to FCC-12 / FCC-13

Global reconciliation owns final:

- stable IDs;
- exact Block/Item registry rows;
- harvest tiers;
- recipes;
- quantities;
- station assignments;
- material tags;
- duplicate removal;
- progression integration.

FCC-06G is the authoritative realm-local constraint set.

---

# 97. No Final Art Lock

FCC-06G does not lock:

- icons;
- texture colours;
- material palettes;
- emissive values;
- model shape;
- particles;
- UI colours.

Art documents must inherit canonical material identity without treating old placeholder registry colours as final.

---

# 98. Effectively Vast / Infinite-Realm Compatibility

Impossible Deep may generate effectively unbounded:

- resource deposits;
- mines;
- archaeological salvage;
- settlements;
- regional material states.

The registry remains finite and reusable.

The realm's scale must **not** cause infinite registry growth.

World generation should instantiate known material families, states, provenance, local quality/condition and ownership/history rather than inventing a new canonical material for every distant region.

---

# 99. Acceptance Gate

FCC-06G is accepted only if all of the following remain true:

- [x] the universal Block/Item single-definition rule remains authoritative;
- [x] Pressure Stone, Bone Stone, Emberbone, Ventglass and Resonance Wood receive justified Block representation;
- [x] material-state facies do not automatically become duplicate material families;
- [x] Abyssal Iron uses a compact ore-to-processed-metal chain;
- [x] Seismic Crystal states remain one lineage;
- [x] Pressure Pearl remains a specialist biomineral Item;
- [x] Pressure Resin remains a specialist organic processing resource;
- [x] Black Brine Salt remains a mineral/chemical resource;
- [x] Gravity Nodule remains anomaly-component content rather than ore;
- [x] Deepfire Ember remains a contained energetic resource rather than generic fuel;
- [x] Fossil Alloys remain archaeological manufactured materials;
- [x] all five formal crops have harvested content representation;
- [x] creature-derived items follow explicit FCC-06E provenance;
- [x] universal processing stations are reused wherever possible;
- [x] Deep Forge owns only genuinely distinctive industrial processing;
- [x] Seismic Choir supports calibration/instrument functions rather than becoming a generic crafting table;
- [x] Spatial Catalyst remains crafted/research content;
- [x] pressure, seismic, gravity, Blackwater, thermal and Fold technology have coherent recipe families;
- [x] Deepgate uses the Deep Keystone contract without finalising exact first-access recipe;
- [x] first Deepgate cannot require inaccessible Deep-native resources;
- [x] later Deepgate upgrades may use native materials without creating new portal families;
- [x] harvest capability remains universal and cross-realm compatible;
- [x] recipe chains avoid unnecessary intermediate bloat;
- [x] provenance-based dungeon/authority rewards remain enforced;
- [x] knowledge may gate archaeological/advanced recipes;
- [x] the six established resource anchors remain preserved;
- [x] legacy names have explicit migration/reclassification paths;
- [x] no realm-exclusive workstation explosion is introduced;
- [x] no material × equipment explosion is introduced;
- [x] no material × shape explosion is introduced;
- [x] cross-realm export and stabilisation remain supported;
- [x] final IDs, quantities, tiers, exact recipes and art values remain deferred appropriately;
- [x] the registry remains finite even though the realm may be effectively vast/infinite.

---

# 100. Final Realm-Local Lock

**FCC-06G — Impossible Deep Blocks, Items, Processing & Recipes v0.1** is hereby marked:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**

It is authoritative for the Impossible Deep's:

- Block/Item ownership rules;
- realm-local content inventory;
- processing boundaries;
- recipe-family architecture;
- functional-component families;
- Deepgate component contract;
- legacy registry migration;
- provenance-based reward constraints;
- global-registry handoff.

Later FCC-06 documents and final global reconciliation must remain compatible with this implementation-facing content canon.
