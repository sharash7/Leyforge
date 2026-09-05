# Leyforge Final Content Canon Collection

## FCC-04C - Somnolent Expanse Geology, Materials, Resources, Processing Foundations & Material Provenance

**Version:** 0.1  
**Status:** Content Canon - Realm-Local Lock Candidate  
**Realm:** Somnolent Expanse  
**Stable Realm ID:** `realm.network.somnolent_expanse`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-04A - Realm Identity, Laws, Progression & Canon Boundaries; FCC-04B - Biomes, Terrain, Coherence States & Environmental Hazards  
**Primary Upstream Sources Reconciled:** Foundation Documents 00-20, especially canonical resource progression; World Content Atlas Set 24; Post-Atlas Governance Set 25; accepted Somnolent Final Content Canon decisions Q246-Q390.  
**Primary Scope:** Geology, common terrain matter, canonical material/resource identities, source provenance, extraction, processing foundations, material-state architecture, export/stabilisation, derived-form eligibility, block/item identity boundaries, resource-economy exclusions and downstream interfaces.  
**Final Global Status:** Pending final cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-04C defines the authoritative **material and resource foundation** of the Somnolent Expanse.

It owns the realm-local canon for:

- common geological and terrain-material foundations;
- the twelve canonical realm-local physical/material foundations;
- preservation and reconciliation of the six Set 24 Somnolent resource anchors;
- ordinary versus specialist resource classification;
- raw-resource provenance and legitimate source classes;
- material states tied to coherence, prophecy, nightmare ecology and mixed-reality conditions;
- broad extraction, cultivation, gathering, salvage and processing pathways;
- export and off-realm stabilisation requirements;
- derived-form eligibility for Blocks, Items, components, construction and machinery;
- duplicate-material prevention;
- distinction between raw materials, processed products, runtime states and crafted components;
- resource-economy boundaries;
- provenance requirements for trade, quests, restoration and validation;
- block-versus-item single-definition enforcement;
- interaction boundaries with flora, creatures, settlements, dungeons, authorities, Dreamgates and Void corruption.

FCC-04C does **not** own:

- exact flora biology, crop growth or Reverie Tree lifecycle - FCC-04D;
- exact creature biology or creature-material sourcing - FCC-04E;
- civilisation-specific industries, market institutions or ownership law - FCC-04F and universal economy systems;
- exact placeable Block catalogue, portable Item catalogue, processing-station catalogue, recipes or Dreamgate recipe quantities - FCC-04G;
- exact dungeon/authority reward tables - FCC-04H;
- detailed Void-corruption transformations, nightmare-state propagation or cross-realm state interactions - FCC-04I;
- final stable-ID normalisation and art/material inheritance profiles - FCC-04J, FCC-12, FCC-13 and FCC-14.

The goal is to make Somnolent materially complete **without manufacturing a dream-themed material for every biome noun, symbolic effect or processing step**.

---

# 2. Material Canon Statement

The Somnolent Expanse is not made from one generic substance called “dream energy.”

It is a physically inhabitable realm containing:

- stone;
- sand;
- soil;
- water-compatible fluid;
- timber;
- natural glass-like mineral matter;
- botanical products;
- flexible thread/fibre products;
- prophecy reagents and inks;
- nightmare-derived resins;
- mixed-reality stabilisation stone;
- imported ordinary metals and technologies;
- crafted stabilisation components;
- runtime states that alter how existing materials behave without multiplying the registry.

The governing principle is:

> **A Somnolent material exists because its physical, ecological, magical, cultural or gameplay role is distinct - not because every dream concept deserves its own resource family.**

The Somnolent Expanse therefore contains exactly **twelve realm-local physical/material foundations** at FCC-04C level.

### Common terrain and construction foundations

1. **Dreamstone**
2. **Dream Sand**
3. **Dream Soil**
4. **Dreamwater**
5. **Reverie Wood**

### Specialist hybrid foundation

6. **Waking Stone**

### Principal Set 24 realm-resource foundations

7. **Dream Mote**
8. **Nightmare Resin**
9. **Lucid Glass**
10. **Sleepbloom**
11. **Memory Thread**
12. **Prophecy Ink**

The realm has **no required native metal family**.

Imported iron, copper, steel, silver and other globally canonical metals may be used by Somnolent civilisations and machines where progression, trade and local stability permit.

---

# 3. Resource-Layer Architecture

Somnolent resource content may participate in several data layers. These layers must remain distinct.

| Layer | Meaning | Somnolent Example |
|---|---|---|
| **Source foundation** | Why and where a resource exists | Lucid Glass mineral formation; Nightmare Thorn sap ecology |
| **World source** | Actual deposit, plant, organism, structure, site or environmental phenomenon | Lucid Glass seam; Sleepbloom plant; Dream Mote bloom |
| **Material identity** | Canonical substance | Lucid Glass; Waking Stone; Nightmare Resin |
| **Raw portable resource** | Harvested non-block object | Omen Dust; Nightmare Sap; Dream Mote |
| **Processed material** | Materially changed portable form | Memory Thread Cloth; hardened Nightmare Resin |
| **Component** | Crafted part used by a system | Coherence Core; calibrated Lucid Glass lens |
| **Placeable Block** | Canonical world object / construction material | Dreamstone Brick |
| **Block Inventory Projection** | Inventory representation of that same Block | generated Dreamstone Brick projection |
| **Runtime state** | Condition on a batch, instance, region, route or block | prophecy-attuned; low-coherence; unstable; contaminated |
| **Loot/reward context** | Transfer mechanism for existing resources/products | recovered Oracle stock; authority grant |
| **Economy context** | Supply, demand, legality, cultural value, provenance | restricted Omen Dust market; Waking Stone export demand |

A source does not automatically drop itself.  
A material does not automatically receive every Block shape.  
A named state does not automatically become another material family.  
A crafted component does not become a natural ore merely because it is strategically important.

---

# 4. Set 24 Realm Resource Reconciliation

World Content Atlas Set 24 established six Somnolent Expanse resource anchors.

| Atlas Source Anchor | Canonical Name | FCC-04C Final Physical Classification |
|---|---|---|
| `res.realm.somnolent_expanse.01` | **Dream Mote** | Energy-like / particulate dream resource |
| `res.realm.somnolent_expanse.02` | **Nightmare Resin** | Processed biological resin / catalyst |
| `res.realm.somnolent_expanse.03` | **Lucid Glass** | Natural glass-like mineral / optical construction material |
| `res.realm.somnolent_expanse.04` | **Sleepbloom** | Botanical resource / medicine-food-alchemy input |
| `res.realm.somnolent_expanse.05` | **Memory Thread** | Flexible memory-active fibre/thread material |
| `res.realm.somnolent_expanse.06` | **Prophecy Ink** | Processed inscription / prophecy reagent |

These six **names and conceptual source anchors remain canonical** until global registry normalisation.

The Atlas assigned each realm resource to generic planning-role slots. Those labels were useful for ensuring material diversity, but they are **not binding physical taxonomy**.

FCC-04C therefore supersedes physically inconsistent slot labels.

Examples:

- Dream Mote is not a load-bearing structural material merely because its planning slot said “structural / construction.”
- Lucid Glass is not a fibre merely because its planning slot said “fibre / flexible material.”
- Sleepbloom is not an optical mineral; it is a botanical resource.
- Memory Thread is genuinely flexible and memory-active even though its source slot emphasised biological/growth/memory.
- Prophecy Ink is a processed inscription medium, not the realm’s generic stabilisation mineral.

The stable resource history is preserved while the final material definitions are made physically coherent.

---

# 5. Canonical Material Classification Matrix

| Material | Primary Class | Typical Availability | Major Construction? | Portable Processing? | Off-Realm Stability Concern? | Primary Provenance |
|---|---|---:|---:|---:|---:|---|
| **Dreamstone** | Common geological stone | Common | Yes | Yes | Low-moderate | Native geology |
| **Dream Sand** | Loose terrain/mineral substrate | Common-regional | Limited | Yes | Low-moderate | Shores, dunes, sedimentary zones |
| **Dream Soil** | Organic/mineral terrain substrate | Common | Terrain/fill | Limited | Moderate for active properties | Native biological/mineral substrate |
| **Dreamwater** | Water-compatible realm fluid | Common-regional | No | Containment only | State-dependent | Dream seas, shores, basins |
| **Reverie Wood** | Native timber | Regional | Yes | Yes | Moderate | Reverie Tree biology - FCC-04D |
| **Waking Stone** | Mixed-reality stabilisation stone | Regional-uncommon | Specialist | Yes | Generally high stability | Shattered Waking Isles / mixed-law zones |
| **Dream Mote** | Particulate/energy-like dream resource | Regional | No generic masonry | Yes | State-dependent | Dream phenomena / approved sources |
| **Nightmare Resin** | Processed biological resin | Regional | Coatings/components only | Yes | Moderate | Nightmare Sap ecology |
| **Lucid Glass** | Natural glass-like mineral | Uncommon | Selected | Yes | State-dependent | Native mineral formations |
| **Sleepbloom** | Botanical resource | Regional | Living plant only | Yes | Botanical viability dependent | Sleepbloom plant - FCC-04D |
| **Memory Thread** | Flexible memory-active fibre/thread | Uncommon | Textile/membrane only | Yes | Moderate | Approved biological/cultivation sources - FCC-04D/E |
| **Prophecy Ink** | Processed inscription reagent | Uncommon | Inscribed surfaces only | Yes | Moderate | Omen Dust + approved processing inputs |

Availability categories are content directions, not fixed spawn percentages.

---

# 6. Geology of the Somnolent Expanse

## 6.1 Geological Identity

Somnolent geology is shaped by the interaction of:

- persistent dream matter;
- regional coherence;
- long-lived settlement reinforcement;
- Dreamwater movement;
- accumulated symbolic pressure;
- natural mineral formation;
- prophecy exposure;
- nightmare ecology;
- waking-law intrusion;
- ancient stabilisation infrastructure;
- authority influence;
- rare Void disturbance.

The realm must not imply that every geological surface is infinitely mutable.

Stable and Anchored regions contain persistent physical strata suitable for mining, foundations, roads, structures and long-term settlement.

Mutable or lower-coherence regions may change between **bounded supported states**, but those changes remain deterministic and save-safe under FCC-04A/B.

## 6.2 Material Persistence

A material may retain one identity across several coherence states.

For example:

- Stable Dreamstone and Fragmenting Dreamstone are ordinarily the same material with different runtime conditions.
- Fate Glass and Abyssal Dream Glass are Lucid Glass states/processed conditions, not separate base minerals.
- Origin Motes and Courier Motes remain Dream Mote states/usages.

Coherence changes material behaviour before it changes material identity.

---

# 7. Dreamstone

## 7.1 Identity

**Dreamstone** is the Somnolent Expanse’s canonical common structural stone.

It is persistent dream-geology capable of behaving as ordinary masonry in coherent regions while remaining compatible with the realm’s coherence systems.

Dreamstone may show bounded local traits such as:

- subtle impossible banding;
- symbolic inclusions;
- soft colour shifts;
- coherence fractures;
- memory or prophecy staining;
- polished surfaces that appear slightly different from different viewpoints.

These are visual/state characteristics, not automatic new materials.

## 7.2 Occurrence

Dreamstone may occur across most coherent Somnolent regions, including:

- Lucid Shores islands and cliffs;
- Reverie Garden foundations;
- Memory City strata;
- Sleepwalker Road foundations;
- selected Prophecy Dune outcrops;
- stabilised Nightmare territories;
- Deep Dream shelves where sufficient coherence remains.

Shattered Waking Isles may contain Dreamstone alongside Waking Stone.

## 7.3 Uses

Dreamstone supports:

- foundations;
- walls;
- roads;
- bridges;
- retaining structures;
- civic buildings;
- dungeon shells;
- Dreamgate Sanctuary foundations;
- settlement infrastructure;
- ordinary stone tools/components where progression permits.

It is not automatically a prophecy medium, memory recorder or high-tier stabiliser.

## 7.4 Derived-Form Eligibility

Supported family, subject to FCC-04G final catalogue:

- natural Dreamstone;
- Cut Dreamstone;
- Dreamstone Brick;
- slab;
- stair;
- wall;
- pillar;
- selected arch/trim/foundation forms where construction systems support them.

Shape generation remains purpose-driven rather than combinatorial.

---

# 8. Dream Sand

## 8.1 Identity

**Dream Sand** is the canonical common loose mineral/substrate family of Somnolent shores, dunes and selected low-coherence sedimentary regions.

It is a genuine terrain material, not powdered Dream Motes.

## 8.2 Principal Occurrence

Dream Sand is strongly associated with:

- Lucid Shores;
- Prophecy Dunes;
- Dreamwater beaches and bars;
- eroded Memory City margins;
- selected Deep Dream deposits;
- route-edge sediment accumulations.

## 8.3 Uses

Dream Sand may support:

- terrain and landscaping;
- fill;
- selected construction mixtures;
- specialist alchemical/mineral processing;
- ordinary glass-compatible precursor roles where FCC-04G validates a recipe.

Dream Sand does **not automatically refine into Lucid Glass**.

Lucid Glass is its own canonical specialist mineral family unless a specific recipe or formation rule explicitly links a particular Dream Sand state to a processed glass product.

---

# 9. Dream Soil

## 9.1 Identity

**Dream Soil** is the canonical broad organic/mineral soil family for the Somnolent Expanse.

It prevents every garden colour, emotional state, coherence level or nightmare condition from becoming a separate terrain material.

## 9.2 State/Profile Model

Dream Soil may carry profiles such as:

- fertile;
- dry;
- damp;
- saturated;
- cultivated;
- Reverie-enriched;
- prophecy-exposed;
- nightmare-affected;
- route-compacted;
- waking-stabilised;
- fragmented;
- restored;
- Void-contaminated.

These are normally states or biome profiles, not independent base materials.

## 9.3 Uses

Dream Soil supports:

- native flora and fungi;
- agriculture;
- Reverie Garden cultivation;
- settlement landscaping;
- restoration;
- excavation;
- fill and embankment work;
- symbolic planting systems;
- ecological state recovery.

Detailed crop fertility and botanical reactions belong to FCC-04D.

---

# 10. Dreamwater

## 10.1 Identity

**Dreamwater** is the Somnolent Expanse’s canonical water-compatible native fluid family.

It must reuse the universal fluid/swimming/container infrastructure wherever practical rather than requiring a second bespoke fluid-physics engine.

Dreamwater remains physically meaningful enough to support:

- swimming;
- aquatic ecology;
- shoreline erosion/deposition;
- pumping where adapted machinery supports it;
- storage and transport;
- settlement water systems;
- fisheries/aquaculture;
- Dreamwater hazards and currents.

## 10.2 Coherence States

Dreamwater may change presentation and bounded behaviour according to:

- regional coherence;
- Lucid Calm;
- Nightmare Fronts;
- Memory Convergence;
- Prophecy Convergence;
- Waking Fractures;
- Deep-Dream Surges;
- Void contamination.

State changes may affect:

- clarity;
- current strength;
- navigation reliability;
- Lucidity pressure;
- route visibility;
- contained-fluid stability.

They do not create a separate named fluid for every condition.

## 10.3 Export

Stable Dreamwater may be exported.

Highly dream-dependent states may require:

- sealed containers;
- Waking Stone stabilisation;
- Coherence Core support;
- limited-duration transport;
- specialist treatment.

Export requirements are state-dependent rather than a rule that all Dreamwater vanishes outside the realm.

---

# 11. Reverie Wood

## 11.1 Source Boundary

**Reverie Wood** is the canonical native timber family produced by the **Reverie Tree**.

FCC-04D owns Reverie Tree biology, growth, ecology, harvest and propagation.

FCC-04C owns the material identity once legitimately harvested or processed.

## 11.2 Material Role

Reverie Wood is a light-to-medium structural timber suited to:

- housing;
- furniture;
- fine joinery;
- garden architecture;
- panels;
- beams;
- route infrastructure;
- symbolic art structures;
- selected dream-active devices.

It is easy to shape in coherent Somnolent regions but should not become freeform reality-edit material.

## 11.3 Derived-Form Eligibility

Potential forms include:

- log/wood source block where FCC-04D supports it;
- planks;
- beams;
- posts;
- slabs/stairs;
- doors/panels;
- furniture;
- selected decorative or functional joinery.

The final catalogue belongs to FCC-04G.

## 11.4 Export

Reverie Wood can persist outside the realm.

Highly dream-responsive properties may weaken or require stabilisation through:

- Waking Stone;
- Coherence Cores;
- compatible enchantment;
- maintenance;
- environmental conditions.

Its ordinary structural identity remains usable even if some dream-active behaviour becomes dormant.

---

# 12. Waking Stone

## 12.1 Identity

**Waking Stone** is a specialist hybrid material formed where highly coherent dream matter and waking-like physical law have fused for long periods.

It is strongly associated with **Shattered Waking Isles** and mixed-reality boundaries.

It is not the Somnolent Expanse’s common stone.

## 12.2 Formation

Waking Stone may form where:

- stable waking-law intrusion persists;
- long-lived mixed-reality fractures mineralise;
- ancient stabilisation infrastructure changes local geology;
- highly coherent dream matter repeatedly reconciles against conventional physical rules.

The exact world-generation node is owned by FCC-04B/G.

## 12.3 Material Role

Waking Stone is particularly useful for:

- coherence anchors;
- mixed-reality foundations;
- imported-machine bases;
- Dreamgate infrastructure;
- stabilised storage;
- off-realm transport packaging;
- conventional-physics work zones;
- Coherence Core construction;
- cross-realm construction interfaces.

## 12.4 Derived-Form Eligibility

Supported specialist forms may include:

- natural Waking Stone;
- cut Waking Stone;
- Waking Stone Brick or Plate;
- foundation component;
- anchor fitting;
- machinery base;
- Dreamgate stabilisation component.

It does not require the full decorative shape catalogue of Dreamstone.

---

# 13. Dream Mote

## 13.1 Identity

**Dream Mote** is the principal particulate/energy-like Somnolent resource family.

It represents stable enough condensations of native dream phenomena to be collected, contained, traded and used by approved systems.

It is not generic mana and does not replace universal mana resources.

## 13.2 Source Classes

Dream Motes may arise from approved Somnolent contexts such as:

- naturally occurring mote blooms;
- coherence transitions;
- route phenomena;
- selected flora or ecological interactions;
- settlement or dungeon processes;
- carefully stabilised dream phenomena;
- salvage from old Somnolent devices or structures.

FCC-04D/E/G may bind specific production to already-canonical flora, creatures or machines.

The material must not require recording or extracting arbitrary private thoughts from players/NPCs.

## 13.3 Uses

Dream Motes may support:

- Coherence Core construction;
- Dreamgate components;
- route signalling;
- magical devices;
- stabilisation processes;
- prophecy equipment;
- dream-active crafting;
- selected fuel/catalyst roles where exact recipes justify them.

## 13.4 Forms and States

Dream Motes are primarily portable resources.

Possible forms include:

- loose/contained mote item;
- vial/capsule/container state;
- calibrated charge state;
- installed core input.

They are **not** automatically eligible for generic Dream Mote masonry blocks.

### Reconciled named states

- **Origin Motes** = ancient/Deep-Dream Dream Motes with origin/low-coherence state data.
- **Courier Motes** = route-attuned Dream Motes configured for courier/signalling use.

Neither is a separate raw-material family by default.

---

# 14. Nightmare Sap and Nightmare Resin

## 14.1 Raw-to-Processed Relationship

The canonical relationship is:

> **Nightmare-producing organism/plant -> Nightmare Sap -> processed or hardened Nightmare Resin**

**Nightmare Sap** is a raw biological secretion/product.

**Nightmare Resin** is the principal Set 24 specialist material produced through natural hardening or deliberate processing.

## 14.2 Source Boundary

The canonical **Nightmare Thorn** is a principal botanical source of Nightmare Sap.

FCC-04D owns plant biology and harvesting.

Other compatible organism sources may exist only if FCC-04D/E explicitly supports them without creating duplicate resin families.

Natural Nightmare Sap/Resin is **not Void corruption**.

## 14.3 Uses

Nightmare Resin may support:

- coatings;
- sealants;
- defensive materials;
- fear-reactive devices;
- nightmare-ecology containment;
- specialist alchemy;
- armour or equipment components where appropriate;
- Nightmare Ward infrastructure;
- controlled catalysts.

## 14.4 Derived Forms

Valid families may include:

- raw Nightmare Sap;
- refined resin;
- hardened resin;
- resin coating;
- sealant;
- treated plate/component where recipes justify it;
- bottled/alchemical reagent.

Nightmare Resin is not default heavy masonry.

---

# 15. Lucid Glass

## 15.1 Canonical Identity

**Lucid Glass** is the Somnolent Expanse’s canonical natural glass-like mineral family.

It supersedes **Dream Glass** as a separate realm material identity.

The existing prototype/runtime name `Dream Glass` is a reconciliation target, not a second canonical material family.

## 15.2 Occurrence

Lucid Glass may form as:

- mineral seams;
- translucent plates;
- crystalline lenses;
- nodules;
- cliff/cavern formations;
- prophecy-exposed deposits;
- low-coherence Deep Dream formations;
- reclaimed ancient construction.

Exact spawn nodes and block forms belong to FCC-04G/J.

## 15.3 Material Behaviour

Lucid Glass may support:

- optical interfaces;
- lenses;
- windows/panes;
- inscribed plates;
- observatory instruments;
- prophecy interfaces;
- Dreamgate elements;
- Coherence Core components;
- symbolic viewing devices;
- selected construction/inlay uses.

It does not automatically read minds, show objective truth, or predict the future perfectly.

## 15.4 Derived-Form Eligibility

Potential forms include:

- natural Lucid Glass;
- block/panel where structural use is justified;
- pane;
- lens;
- plate;
- inlay;
- optical component;
- calibrated interface surface.

A full stair/wall/pillar family is not required by default.

## 15.5 Fate Glass

**Fate Glass** is a prophecy-attuned Lucid Glass state or processed form.

It may arise through:

- Prophecy Dunes exposure;
- Oracle processing;
- Prophecy Ink/Omen Dust treatment;
- suitable prophecy events.

Its parent material remains **Lucid Glass** unless final cross-realm reconciliation proves a distinct composition is required.

## 15.6 Abyssal Dream Glass

**Abyssal Dream Glass** is a low-coherence / Deep Dream Lucid Glass state.

It may have unusual:

- fracture;
- optical behaviour;
- concept interaction;
- stabilisation requirements;
- hazard profile.

It remains a Lucid Glass state unless irreversible transformation satisfies the distinct-material threshold.

---

# 16. Sleepbloom

## 16.1 Identity

**Sleepbloom** is one of the six principal Somnolent specialist resources and simultaneously a canonical plant family.

FCC-04D owns:

- plant biology;
- lifecycle;
- cultivation;
- habitats;
- propagation;
- harvest consequences.

FCC-04C owns the harvested material/resource identity and processing boundary.

## 16.2 Uses

Sleepbloom may support:

- food/ingredient roles;
- medicine;
- sleep and Lucidity preparations;
- alchemy;
- calming treatments;
- dream-state research;
- settlement goods;
- ritual or cultural preparations.

The plant does not provide physical interdimensional travel by causing sleep.

## 16.3 Forms

Potential material/product forms include:

- living plant block/state;
- harvested bloom;
- dried bloom;
- powder;
- infusion/extract;
- food/medicine ingredient.

Exact Items and recipes belong to FCC-04G.

---

# 17. Memory Thread

## 17.1 Identity

**Memory Thread** is the principal flexible memory-active thread/fibre material of the Somnolent Expanse.

It remains distinct from Ancestral Veil memory materials and does not become a generic “memory data cable” across all realms.

## 17.2 Source Boundary

FCC-04C locks the material identity but does **not invent a new source species**.

FCC-04D/E must bind Memory Thread production to one or more already-canonical Somnolent botanical, cultivation or ecological sources if direct biological production is required.

A future downstream document may also support crafted production from canonical source fibres/materials.

No thirteenth plant or thirteenth creature may be introduced solely to explain Memory Thread without reopening the realm roster.

## 17.3 Uses

Memory Thread may support:

- thread;
- cloth;
- woven screens;
- bindings;
- Memory Loom products;
- encoded memory textiles;
- route records;
- archive artefacts;
- specialist components;
- stabilisation assemblies where justified.

Memory Thread may encode **system-approved bounded information**.

It does not automatically extract private memories from nearby persons.

## 17.4 Historical Name Reconciliation

**Dream Thread** is merged into **Memory Thread**.

Dream Thread may survive as cultural terminology or a specific product name only where it does not create a duplicate raw-material definition.

---

# 18. Prophecy Ink and Omen Dust

## 18.1 Prophecy Ink Identity

**Prophecy Ink** is the principal Somnolent prophecy-inscription resource.

It is a processed specialist reagent rather than a naturally mined liquid lake.

## 18.2 Omen Dust

**Omen Dust** is a canonical minor Prophecy Dunes reagent and a common precursor/component in Prophecy Ink production.

Possible sources may include:

- prophecy-exposed mineral/sediment deposits;
- exposed dune events;
- approved Omen Grass / prophecy-flora interactions;
- Oracle salvage;
- prophecy-site residues.

FCC-04D owns exact botanical participation.

## 18.3 Broad Processing Foundation

The broad chain is:

> **Omen Dust + compatible binder/solvent/catalyst inputs -> Prophecy Ink**

Exact ingredients, quantities and stations are deliberately deferred to FCC-04G.

## 18.4 Uses

Prophecy Ink may support:

- Oracle records;
- conditional-future diagrams;
- prophecy maps;
- inscribed Lucid Glass;
- research documents;
- route forecasts;
- Prophecy Engine interfaces;
- specialist ritual or machine inscriptions.

Prophecy Ink cannot convert uncertain prophecy into guaranteed objective truth.

---

# 19. Time-Seed

## 19.1 Identity

**Time-Seed** is a rare prophecy-aligned botanical product.

It is **not** a seventh principal realm material and does not provide unrestricted time travel.

## 19.2 Behaviour

Time-Seeds may respond to approved future-condition states such as:

- event probability;
- forecast weather;
- prophecy windows;
- known world-state conditions;
- Oracle experiments.

Possible behaviour includes:

- germination only under predicted conditions;
- growth-form changes based on likely future states;
- use as a prophecy-research input.

The seed reacts to system-owned conditional future data. It does not calculate arbitrary future histories itself.

FCC-04D owns botanical source and growth rules.

---

# 20. Inspiration Resin

**Inspiration Resin** is a canonical minor botanical product associated primarily with Reverie Garden ecology.

It is distinct from Nightmare Resin because its source, behaviour and use are different.

Potential roles include:

- art materials;
- inks and dyes;
- enchantment components;
- cultural goods;
- morale goods;
- fine craft;
- dream-architecture treatment.

FCC-04D owns exact botanical source.

Inspiration Resin is a **minor product**, not another principal resource family.

---

# 21. Fear Chitin

**Fear Chitin** is a canonical minor creature-derived material associated with nightmare organisms whose anatomy genuinely produces chitinous armour.

The canonical **Nightmare Stalker** is an approved principal source.

FCC-04E owns:

- anatomy;
- shedding;
- moulting;
- nests;
- hunting consequences;
- population effects;
- welfare/ecology.

Valid acquisition may include:

- naturally shed plates;
- abandoned moults;
- nest salvage;
- predator remains;
- hunting;
- trade.

Creature killing is not the only legitimate source.

Fear Chitin is not a generic drop from every nightmare being.

---

# 22. Road Chalk

**Road Chalk** is a crafted navigation consumable used primarily on Sleepwalker Roads.

It is not a natural ore or principal material family.

Possible functions include:

- stable-route marking;
- hazard warning;
- caravan signalling;
- temporary route reinforcement cues;
- traveller rescue marks;
- path provenance.

FCC-04G owns the exact recipe and Item definition.

Road Chalk must be craftable from already-canonical materials/reagents rather than requiring a dedicated Road Chalk mineral deposit.

---

# 23. Coherence Core

## 23.1 Classification

**Coherence Core** is a crafted Somnolent technology component.

It is not a naturally occurring crystal/ore family.

## 23.2 Canonical Input Roles

Its recipe should draw from several compatible families such as:

- Waking Stone;
- Lucid Glass;
- Dream Motes;
- Memory Thread;
- imported mechanical or magical components.

Exact ingredients and quantities belong to FCC-04G.

## 23.3 Uses

Coherence Cores may support:

- settlement anchors;
- Dreamgate infrastructure;
- protected storage;
- imported machinery;
- stabilised construction;
- dungeon restoration;
- research systems;
- mixed-reality infrastructure;
- off-realm stabilisation.

The component does not grant unrestricted reality editing.

---

# 24. Material-State Architecture

Somnolent material behaviour may depend on bounded runtime state.

Common state dimensions may include:

- coherence state: Anchored / Stable / Mutable / Unstable / Fragmenting / Dissolving;
- prophecy attunement;
- nightmare exposure;
- Waking Fracture exposure;
- Deep Dream exposure;
- Lucid calibration;
- contamination;
- Void corruption;
- stabilised/off-realm treatment;
- source provenance;
- quality/purity where meaningful.

State values should be stored on instances/batches/sites where practical.

They must **not** automatically expand into separate registry definitions.

---

# 25. Distinct-Material Admission Threshold

A material state becomes a genuinely separate material definition only when transformation is sufficiently irreversible and produces meaningfully different:

- composition;
- physical behaviour;
- processing pathway;
- recipe role;
- equipment/construction role;
- hazard profile;
- export behaviour;
- save/runtime meaning;
- art/material inheritance.

A different colour, glow, emotional association or coherence reading alone is insufficient.

This threshold applies especially to:

- Fate Glass;
- Abyssal Dream Glass;
- Void-corrupted materials;
- nightmare-exposed timber/stone;
- prophecy-charged materials.

FCC-04I/J decide whether any transformed candidate ultimately crosses this threshold.

---

# 26. Native Metal Exclusion

The Somnolent Expanse has **no required native metal ore or metal progression family**.

Do not add:

- Dream Iron;
- Lucid Steel;
- Nightmare Metal;
- Prophecy Silver;
- Waking Alloy;
- equivalent realm-themed metals

merely to fill an expected crafting tier.

Somnolent civilisations may instead use:

- imported metals;
- Dreamstone;
- Reverie Wood;
- Waking Stone;
- Lucid Glass;
- Nightmare Resin;
- Memory Thread;
- creature materials;
- globally canonical machine components.

If a future major metal is ever proposed, it requires explicit canon reopening and distinct provenance/gameplay justification.

---

# 27. Processing Philosophy

The Somnolent Expanse does **not** require a unique crafting station for every specialist resource.

The default rule is:

> **Reuse universal crafting, smelting, alchemy, enchanting, inscription, weaving and machine-processing interfaces wherever those systems can execute the material contract without losing Somnolent identity.**

Realm-distinct specialist infrastructure is justified only where the process itself is unique.

Already accepted distinctive infrastructure includes:

- **Memory Loom** - Memory Thread encoding/weaving/stabilisation;
- **Oracle Hall** - prophecy research, interpretation and inscription workflows;
- coherence/anchor infrastructure;
- Dreamgate-related assemblies.

Lucid Glass does not automatically require a “Dream Furnace.”  
Nightmare Resin does not automatically require a “Nightmare Press.”  
Dream Motes do not automatically require a unique machine solely to become usable.

Exact station mappings belong to FCC-04G.

---

# 28. Broad Processing Chains

The following broad chains are canonically supported without locking numeric recipes.

## 28.1 Dreamstone

> natural Dreamstone -> cut stone / masonry preparation -> approved construction forms

## 28.2 Reverie Wood

> Reverie Tree source -> harvested wood/log -> planks/beams/panels/joinery

## 28.3 Waking Stone

> source Waking Stone -> cut/plate preparation -> anchor/foundation/machine/stabilisation component

## 28.4 Nightmare Resin

> Nightmare Sap -> cleaned/concentrated/hardened resin -> coatings/sealants/components/reagents

## 28.5 Lucid Glass

> natural Lucid Glass source -> cut/polished/calibrated form -> pane/lens/plate/interface component

Possible state treatment:

> Lucid Glass -> prophecy attunement -> Fate Glass state/product

> Lucid Glass -> Deep Dream low-coherence transformation -> Abyssal Dream Glass state

## 28.6 Sleepbloom

> harvested Sleepbloom -> fresh/dried/powdered/extracted preparation -> food/medicine/alchemy product

## 28.7 Memory Thread

> approved source fibre/thread -> cleaned/formed Memory Thread -> spool/weave/cloth/binding/encoded textile

## 28.8 Prophecy Ink

> Omen Dust + approved binder/catalyst inputs -> Prophecy Ink -> inscribed record/interface

## 28.9 Coherence Core

> canonical stabilisation/material inputs -> crafted Coherence Core -> installed stabilisation component

---

# 29. Derived-Form Eligibility Matrix

| Material / Resource | Eligible Families | Explicitly Not Automatic |
|---|---|---|
| **Dreamstone** | natural block, cut block, brick, slab, stair, wall, pillar, selected arch/trim | arbitrary optical/magical forms |
| **Dream Sand** | terrain, fill, portable sand where needed, selected mixtures/glass-compatible processing | sand stairs/walls as full family |
| **Dream Soil** | terrain states, fill/portable soil only where needed | decorative masonry family |
| **Dreamwater** | fluid, container/reservoir states, machine-fluid input | solid Dreamwater block family |
| **Reverie Wood** | logs/wood, planks, beams, posts, slabs/stairs, doors/panels, furniture | every fine decorative object as unique material |
| **Waking Stone** | natural/cut stone, selected brick/plate, foundation, anchor fitting, machinery base | full decorative shape explosion |
| **Dream Mote** | loose/contained item, charge/core input | generic building blocks |
| **Nightmare Resin** | sap, resin, hardened resin, coating, sealant, reagent, selected components | heavy masonry |
| **Lucid Glass** | source block, pane, lens, plate, inlay, calibrated optical/interface component | full stair/wall/pillar family |
| **Sleepbloom** | living plant, harvested bloom, dried/powder/extract/ingredient | construction family |
| **Memory Thread** | thread, spool, cloth/weave, bindings, encoded textile, specialist component | rigid masonry |
| **Prophecy Ink** | bottled/contained ink, inscription state, records/interfaces | terrain fluid lakes or structural blocks |
| **Omen Dust** | portable reagent/powder | base construction family |
| **Time-Seed** | seed/item, planted state | generic resource block |
| **Inspiration Resin** | resin/reagent/art product | principal construction family |
| **Fear Chitin** | plate/chitin item, selected armour/tool/components | universal nightmare drop |
| **Road Chalk** | crafted consumable/item, applied marking state | natural mineral family |
| **Coherence Core** | crafted component, installed assembly | natural ore/deposit |

FCC-04G determines the final concrete Block and Item catalogue.

---

# 30. Block / Item Single-Definition Contract

FCC-04C inherits the universal Leyforge rule:

> **If something is fundamentally a placeable Block and, when broken, is meant to remain/recover as that same Block, it has one canonical Block definition and must not also exist as a separately authored duplicate Item definition.**

Inventory/carrying uses the generated/reference-only Block Inventory Projection derived from the Block.

Distinct Items are appropriate when:

- mining transforms a source Block into a different portable resource;
- a substance is naturally non-placeable;
- processing changes the object materially;
- the object is a component, consumable, tool, food, seed, reagent or equipment part.

Examples:

- Dreamstone Brick -> one canonical Block; inventory uses generated block-form projection.
- Lucid Glass Lens -> distinct Item if it is a portable component rather than a placeable pane/block.
- Dream Mote -> distinct Item/resource.
- Nightmare Resin Vial -> distinct Item/container product.
- Waking Stone foundation block -> one canonical Block if carried and placed as the same object.
- Coherence Core -> distinct crafted component Item or installed functional assembly depending final implementation.

FCC-04G owns final application.

---

# 31. Extraction, Renewal and Provenance Categories

Somnolent resources may be:

- finite geological deposits;
- slowly regenerative geological/environmental formations;
- renewable botanical harvests;
- renewable creature/ecological products;
- cultivated resources;
- processed settlement goods;
- event-generated resources;
- salvage;
- authority/faction grants;
- dungeon stock;
- trade imports;
- crafted components.

Each canonical resource must declare enough provenance to support:

- legality;
- ownership;
- ecology;
- trade;
- quest conditions;
- restoration;
- contamination tracking;
- validation;
- anti-duplication auditing.

Provenance must remain bounded. It does not require storing an unlimited narrative history for every grain of Dream Sand.

---

# 32. Source Ethics and Non-Extractive Acquisition

Somnolent material progression should not force ecological or personhood violations where the material has legitimate alternatives.

Examples:

- Nightmare Resin may come from managed Nightmare Thorn or collected sap rather than requiring destruction of intelligent nightmare communities.
- Fear Chitin may come from sheds, moults, nests or remains as well as hunting.
- Dream Motes may come from natural phenomena, stabilisation or salvage rather than harvesting minds.
- Memory Thread must not require stealing private memories.
- Prophecy Ink must not require harming the Sleeping Oracle.
- authority-linked materials can be granted through diplomacy, access, service or restoration rather than kill-only progression.

Persons, sapient thoughtforms and intelligent nightmare citizens are never generic resource nodes merely because they are made from dream matter.

---

# 33. Biome-Material Suitability Interface

FCC-04C does not redefine biome worldgen. It supplies the material suitability model consumed by FCC-04B/worldgen.

| Biome Family | Typical Material Relationships |
|---|---|
| **Lucid Shores** | Dream Sand, Dreamwater, Dreamstone, Lucid Glass, Dream Motes, Dream Reeds/shore flora interfaces |
| **Reverie Gardens** | Dream Soil, Reverie Wood, Sleepbloom, Inspiration Resin, Memory Thread cultivation interfaces, Dream Motes |
| **Memory Cities** | Dreamstone, Reverie Wood, Lucid Glass, Memory Thread products, imported materials, reclaimed specialist stock |
| **Prophecy Dunes** | Dream Sand, Omen Dust, Time-Seeds, Fate Glass states, Prophecy Ink production contexts, Dreamstone outcrops |
| **Nightmare Thickets** | Dream Soil, Reverie/Dreamstone foundations where coherent, Nightmare Sap/Resin, Fear Chitin interfaces, Dream Motes |
| **Sleepwalker Roads** | Dreamstone roadwork, Waking Stone anchors where needed, Road Chalk, Courier Mote states, Memory Thread route goods |
| **Shattered Waking Isles** | Waking Stone, Dreamstone, Dream Soil, Dreamwater, imported metals/materials, Coherence Core infrastructure |
| **Deep Dream Abyss** | Dreamstone in coherent shelves, Abyssal Lucid Glass states, Origin Mote states, rare specialist salvage, unstable Dreamwater |

This table indicates suitability and thematic association, not guaranteed abundance.

Required progression resources must not be generated exclusively in permanently unreachable seed states.

---

# 34. Export and Off-Realm Stabilisation

Somnolent resources may leave the realm.

Export does **not** follow a universal rule that dream matter disappears on waking or outside Somnolent.

Instead, off-realm behaviour depends on the material and its current state.

## 34.1 Generally Stable Exports

Materials such as:

- Waking Stone;
- sufficiently stabilised Dreamstone;
- ordinary processed Reverie Wood;
- stable Lucid Glass;
- dried/processed botanical goods;
- Fear Chitin;
- contained Prophecy Ink

can remain useful outside the realm under normal storage conditions unless a specific state says otherwise.

## 34.2 Active / State-Dependent Exports

Highly dream-active forms may require:

- Waking Stone packaging;
- Coherence Cores;
- sealed containers;
- stabilising enchantments;
- periodic maintenance;
- limited-duration transport;
- compatible local mana/realm conditions.

Examples may include:

- unstable Dreamwater;
- highly active Dream Motes;
- Fate Glass;
- Abyssal Dream Glass;
- encoded Memory Thread;
- living Sleepbloom;
- active Time-Seeds.

## 34.3 No Automatic Collapse

Failure to stabilise an active export may cause bounded outcomes such as:

- dormancy;
- loss of special effect;
- reduced charge;
- reversion toward ordinary state;
- leakage/instability;
- recipe incompatibility;
- hazard state.

It must not silently delete inventory or corrupt save data.

---

# 35. Dreamgate Material Boundary

FCC-04C supplies material roles to the Dreamgate system but does **not** lock the final cross-realm portal recipe.

Accepted material-direction interfaces include:

- Lucid Glass as portal surface/interface material;
- Dream Motes as dream-active input;
- Waking Stone and/or Coherence Core technology as stabilisation candidates;
- Memory Thread as a possible route/identity-stabilisation component where FCC-04G validates it;
- imported components where final portal progression requires them.

The exact Dreamgate recipe, cross-realm dependency and activation quantities remain deferred to the **global portal-progression reconciliation** and FCC-04G/FCC-13.

No material interaction may create a second normal access method into Somnolent Expanse.

---

# 36. Resource Economy Boundaries

FCC-04C defines resource existence, physical identity, provenance and broad processing. It does not own market prices.

Trade value may depend on:

- scarcity;
- coherence state;
- source biome;
- provenance;
- stability;
- purity/quality;
- legal status;
- Oracle restrictions;
- nightmare-community law;
- route safety;
- current settlement demand;
- export treatment;
- event state;
- authority outcomes.

A material’s rarity must not automatically determine:

- combat strength;
- sale price;
- moral status;
- progression tier;
- visual glow;
- prophecy accuracy.

Universal economy systems own pricing and transactions.

---

# 37. Salvage, Dungeon and Authority Resource Rules

Somnolent dungeons, ruins, observatories, Memory Cities, Prophecy Engines, Nightmare Nests and authority outcomes may grant existing materials/products through:

- salvage;
- recovered stock;
- abandoned workshops;
- trade;
- lawful claims;
- faction grants;
- research rewards;
- restoration outcomes;
- authority gifts;
- protected resource allotments;
- treasure caches;
- combat trophies where context genuinely supports them.

Major realm progression must **not require killing a major authority solely to obtain a mandatory material**.

Authority outcomes may instead grant:

- material access;
- route rights;
- stable source locations;
- specialist processing knowledge;
- Coherence Core techniques;
- Dreamgate knowledge;
- legal harvesting permission;
- prophecy interpretation;
- unique cultural products.

Exact reward tables belong to FCC-04H/G.

---

# 38. Void Corruption and Material Duplication

Natural nightmare state, low coherence and Void corruption are separate conditions.

A frightening material appearance is not evidence of Void provenance.

## 38.1 Early / Reversible Corruption

Void exposure should normally begin as:

- contamination state;
- surface overlay;
- altered charge;
- reduced stability;
- hazardous processing condition;
- propagation risk;
- visual/material-profile state.

This does not automatically create a new material definition.

## 38.2 Irreversible Transformation

A distinct corrupted material may be admitted only when the transformation crosses the Section 25 threshold.

Potential candidates may later be proposed for:

- Lucid Glass;
- Reverie Wood;
- Waking Stone;
- Nightmare Resin;
- other materially justified families.

These are **not promises of separate definitions**.

FCC-04I/J determine final admission.

No system may generate `Corrupted X` variants for all twelve foundations by default.

---

# 39. Minor-Resource Reconciliation Register

Older Somnolent source material contains many evocative resource terms. They are reconciled as follows.

| Older / Candidate Term | FCC-04C Canonical Treatment |
|---|---|
| Dream Glass | Superseded as separate material; reconcile to **Lucid Glass** |
| Fate Glass | Prophecy-attuned **Lucid Glass** state/processed form |
| Abyssal Dream Glass | Deep Dream / low-coherence **Lucid Glass** state |
| Sleep Motes | Fold into **Dream Mote** terminology |
| Origin Motes | Deep Dream state/source of **Dream Mote** |
| Courier Motes | Route-attuned/configured **Dream Mote** state |
| Dream Thread | Fold into **Memory Thread**; may survive as cultural/product terminology |
| Nightmare Sap | Raw biological precursor to **Nightmare Resin** |
| Omen Dust | Canonical minor prophecy reagent; Prophecy Ink precursor |
| Time-Seeds | Canonical rare prophecy-aligned botanical product; not time-travel resource |
| Coherence Cores | Crafted technology component; not natural mineral |
| Road Chalk | Crafted route-navigation consumable; not natural ore |
| Inspiration Resin | Canonical minor Reverie botanical product; distinct from Nightmare Resin |
| Fear Chitin | Canonical minor creature-derived material from anatomically valid sources |
| Dream Fruit / Dreamfruit | Food/crop output owned by FCC-04D; not a major material |
| Emotion Blossoms | Reconciled to **Emotion Bloom** plant family/state system; not a material family |
| Lucid Water | Reconciled to **Dreamwater** under coherent/Lucid state |
| Waking Stone | Retained as distinct specialist hybrid foundation |
| Dream Sand | Retained as common terrain foundation |
| Probability Catalysts | Product/category using canonical prophecy materials; not a new base material by default |
| Communication Reagents | Product/category using canonical materials; not a new raw-material family |
| Rare Psychic Catalysts | Product/category to be built from approved canonical inputs; not automatic new resource |

This register supersedes any older implication that every evocative biome resource term requires its own base-material registry entry.

---

# 40. Material Naming Rule

Somnolent Expanse follows the global Leyforge naming principle:

- ordinary material forms use simple predictable names;
- unique realm substances may use distinctive fantasy names;
- derived forms inherit the parent material name where possible;
- state names should communicate the state rather than masquerade as unrelated substances.

Examples:

- `Dreamstone` -> `Cut Dreamstone` -> `Dreamstone Brick`
- `Reverie Wood` -> `Reverie Planks` -> `Reverie Beam`
- `Lucid Glass` -> `Lucid Glass Pane` / `Lucid Glass Lens`
- `Nightmare Sap` -> `Nightmare Resin` -> `Hardened Nightmare Resin`
- `Memory Thread` -> `Memory Thread Cloth`
- `Waking Stone` -> `Cut Waking Stone` / `Waking Stone Plate`

Avoid unnecessary fantasy names for every plate, powder, coating, thread count or quality tier.

---

# 41. Art-Handoff Material Identity Boundary

FCC-04C defines **what the materials are**, not their final palette or texture recipe.

Later material/style governance must inherit at minimum:

- physical class;
- source/provenance;
- whether geological, botanical, creature-derived, fluid, fibre, resin, glass-like or hybrid;
- translucency eligibility;
- structural role;
- flexibility/rigidity;
- coherence response;
- prophecy/nightmare/Waking compatibility;
- valid derived forms;
- off-realm stabilisation requirements;
- corruption-state eligibility;
- ordinary versus specialist construction role.

Future art profiles may define:

- palette;
- value range;
- pattern scale;
- directionality;
- translucency;
- reflectivity;
- inclusions;
- fracture;
- wear;
- emission;
- coherence-state visual treatment;
- prophecy state;
- nightmare state;
- corruption transformation.

Art must not collapse physically distinct materials into one generic “dream-glow” appearance.

---

# 42. Working Realm-Local Material Registry

The following display names and realm-local classifications are locked unless final cross-realm reconciliation finds a direct collision.

| Working Canonical ID | Source Anchor / Status | Display Name | Classification |
|---|---|---|---|
| `material.somnolent.dreamstone` | FCC | **Dreamstone** | Common geological stone |
| `terrain.somnolent.dream_sand` | FCC / Atlas biome term | **Dream Sand** | Common loose mineral terrain |
| `terrain.somnolent.dream_soil` | FCC | **Dream Soil** | Common organic/mineral soil |
| `fluid.somnolent.dreamwater` | FCC | **Dreamwater** | Water-compatible realm fluid |
| `material.somnolent.reverie_wood` | FCC / flora interface | **Reverie Wood** | Native timber |
| `material.somnolent.waking_stone` | Atlas biome term / FCC | **Waking Stone** | Specialist mixed-reality stabilisation stone |
| `material.somnolent.dream_mote` | `res.realm.somnolent_expanse.01` | **Dream Mote** | Particulate/energy-like specialist resource |
| `material.somnolent.nightmare_resin` | `res.realm.somnolent_expanse.02` | **Nightmare Resin** | Processed biological resin/catalyst |
| `material.somnolent.lucid_glass` | `res.realm.somnolent_expanse.03` | **Lucid Glass** | Natural glass-like optical mineral |
| `material.somnolent.sleepbloom` | `res.realm.somnolent_expanse.04` | **Sleepbloom** | Botanical specialist resource |
| `material.somnolent.memory_thread` | `res.realm.somnolent_expanse.05` | **Memory Thread** | Flexible memory-active thread/fibre |
| `material.somnolent.prophecy_ink` | `res.realm.somnolent_expanse.06` | **Prophecy Ink** | Processed prophecy-inscription reagent |
| `resource.somnolent.nightmare_sap` | FCC | **Nightmare Sap** | Raw biological precursor |
| `resource.somnolent.omen_dust` | FCC / Atlas biome term | **Omen Dust** | Minor prophecy reagent |
| `resource.somnolent.time_seed` | FCC / Atlas biome term | **Time-Seed** | Rare prophecy-aligned botanical product |
| `resource.somnolent.inspiration_resin` | FCC / Atlas biome term | **Inspiration Resin** | Minor Reverie botanical resin |
| `resource.somnolent.fear_chitin` | FCC | **Fear Chitin** | Minor creature-derived chitin |
| `product.somnolent.road_chalk` | FCC / Atlas biome term | **Road Chalk** | Crafted navigation consumable |
| `component.somnolent.coherence_core` | FCC / Atlas biome term | **Coherence Core** | Crafted stabilisation component |

The exact namespace may be normalised during FCC-12/FCC-13.

`Fate Glass`, `Abyssal Dream Glass`, `Origin Motes`, `Courier Motes` and `Dream Thread` are **not separate base-material entries** in this registry.

---

# 43. Source Reconciliation Register

| Source-Era Direction | FCC-04C Resolution |
|---|---|
| Six Set 24 Somnolent resource names | Retained |
| Six Set 24 source anchors | Retained |
| Generic Atlas role-slot labels | Superseded where physically inconsistent |
| Dream Sand | Retained as common loose terrain material |
| Lucid Water | Reclassified under Dreamwater state/presentation |
| Sleep Motes | Folded into Dream Mote |
| Emotion Blossoms | Reconciled to Emotion Bloom plant family/state, FCC-04D |
| Inspiration Resin | Retained as minor botanical product |
| Dream Fruit | Reconciled to Dreamfruit crop/food, FCC-04D |
| Fate Glass | Lucid Glass prophecy-attuned state/product |
| Omen Dust | Retained as minor prophecy reagent |
| Time-Seeds | Retained as prophecy-aligned botanical product, no time travel |
| Nightmare Sap | Raw precursor to Nightmare Resin |
| Fear Chitin | Retained as anatomy-dependent creature material |
| Road Chalk | Crafted navigation consumable |
| Dream Thread | Merged into Memory Thread |
| Courier Motes | Dream Mote route-attuned state |
| Waking Stone | Retained as specialist mixed-reality stone |
| Coherence Cores | Crafted component, not natural resource |
| Abyssal Dream Glass | Lucid Glass Deep-Dream/low-coherence state |
| Origin Motes | Dream Mote Deep-Dream state/source |
| Prototype `Dream Glass` registry name | Reconcile to canonical Lucid Glass |
| Native dream metal assumptions | Rejected; no required native metal |
| Unique crafting station per material | Rejected; reuse universal stations unless process is genuinely distinct |
| Duplicate block-item forms | Replaced by canonical Block + generated Block Inventory Projection |
| Automatic material × shape generation | Prohibited |
| Automatic `Corrupted X` for every material | Prohibited |
| Dream matter vanishes outside realm | Rejected; state-dependent stabilisation/export rules apply |

---

# 44. Cross-Document Interfaces

## 44.1 FCC-04A

Supplies:

- Dream Network identity;
- bounded Lucidity, Expectation, Coherence and Dream-Time laws;
- Dreamgate-only access;
- one authoritative player identity;
- no sleep-entry/waking-exit rule;
- no native metal direction;
- cross-realm ownership boundaries.

FCC-04C may not create a material that bypasses these rules.

## 44.2 FCC-04B

Supplies:

- eight biome families;
- six coherence states;
- regional environmental states;
- hazards;
- worldgen suitability.

FCC-04C supplies material occurrence/suitability back to FCC-04B/worldgen.

## 44.3 FCC-04D

Owns:

- Reverie Tree biology;
- Sleepbloom biology;
- Nightmare Thorn biology;
- Omen Grass and Time-Seed botanical sourcing;
- Inspiration Resin botanical source;
- Memory Thread botanical/cultivation source assignment where required;
- crop/food biology;
- cultivation and harvest consequences.

FCC-04C owns the material/resource identity after valid harvest or transfer.

## 44.4 FCC-04E

Owns:

- Nightmare Stalker anatomy;
- Fear Chitin source mechanics;
- creature ecology;
- creature-material welfare and harvest consequences;
- any approved biological Dream Mote/Memory Thread source interface.

## 44.5 FCC-04F

Owns:

- civilisation industries;
- ownership law;
- consent law;
- settlement production;
- cultural restrictions;
- trade institutions.

FCC-04C defines material inputs/outputs, not market organisation.

## 44.6 FCC-04G

Consumes FCC-04C to define:

- exact Blocks;
- exact Items;
- exact processing stations;
- exact recipes;
- Coherence Core construction;
- Dreamgate construction package;
- portal components and activation items.

FCC-04G may not invent a new major Somnolent material without reconciliation.

## 44.7 FCC-04H

Consumes materials for:

- dungeon rewards;
- authority outcomes;
- site salvage;
- Prophecy Engine/Lucid Observatory/Nightmare Nest resources.

## 44.8 FCC-04I

Owns:

- nightmare-state propagation;
- Void corruption;
- restoration;
- irreversible-transformation admission proposals;
- cross-realm material/state interactions.

## 44.9 FCC-04J

Certifies:

- no orphan materials;
- no duplicate identities;
- no missing provenance;
- no unexplained derived forms;
- no forbidden sleep-body resource assumptions;
- no accidental second Dreamgate access path;
- final art-handoff registry.

---

# 45. Cross-Realm Material Interfaces

## 45.1 Verdant Covenant

Dreaming Root resonance may support Somnolent-related recipes/research through explicit interfaces.

Verdant `Dream Sap` terminology remains a Verdant Season Sap resonance/source state and does **not** merge into Somnolent Dream Motes, Dreamwater or Nightmare Resin.

No material interaction creates a second portal path.

## 45.2 Ancestral Veil

Somnolent memory materials and Ancestral memory materials remain distinct.

In particular:

- Memory Thread ≠ Memory Glass;
- Lucid Glass ≠ Memory Glass;
- Dreamstone ≠ Memory Stone;
- Somnolent prophecy/memory encoding does not prove historical truth or reconstruct actual dead persons by default.

Cross-realm recipes may combine these materials only where later documents explicitly justify them.

## 45.3 Overworld

Somnolent materials may appear in Overworld trade, research, dream-resonance quests and Dreamgate construction.

Ordinary Overworld sleep does not create physical Somnolent materials from nothing.

## 45.4 Pocket Realms

Future Pocket Realm construction may consume Somnolent-derived components for bounded coherence, symbolic mutability, prophecy-style simulation or nightmare ecology.

Pocket Realm construction remains owned by FCC-11.

## 45.5 Void Between

Void contamination may alter Somnolent materials, but the Void Between owns the deeper corruption source.

Deep Dream materials are not automatically Void materials.

---

# 46. Implementation and Scaling Rule

Material canon must remain invariant across performance profiles.

Lower-end simulation may reduce:

- live material-state animation;
- transparency/refraction complexity;
- particle density;
- off-screen provenance detail;
- Dreamwater visual complexity;
- real-time coherence update frequency;
- distant material-state VFX;
- prophecy/glass shader complexity.

It may not change:

- which material exists;
- legal ownership;
- resource quantity;
- crafting conservation;
- provenance required for authoritative transactions;
- material identity;
- state transition truth;
- recipe inputs/outputs;
- whether a Block is duplicated as an Item;
- export/stabilisation outcome;
- corruption classification.

Visual simplification must not become economic duplication or deletion.

---

# 47. Technical / Data Requirements

A production material/resource schema must be able to represent, where relevant:

- stable material/resource ID;
- display name;
- source realm;
- primary physical class;
- source-anchor/legacy ID;
- allowed world-source families;
- biome suitability;
- coherence-state compatibility;
- prophecy/nightmare/Waking compatibility;
- renewable/finite/regenerative classification;
- harvest/extraction method class;
- required permission/ownership state;
- provenance reference;
- contamination/corruption state;
- off-realm stability requirements;
- processing inputs/outputs;
- valid derived-form profile;
- Block eligibility;
- Item eligibility;
- fluid eligibility;
- component eligibility;
- equipment eligibility;
- construction eligibility;
- portal/stabilisation eligibility;
- economy/trade tags;
- accessibility-sensitive visual state data;
- art/material inheritance class.

The schema must also distinguish:

- base material;
- processed product;
- runtime state;
- crafted component;
- placeable Block;
- Block Inventory Projection;
- installed assembly.

---

# 48. Validation Invariants

Any valid implementation of FCC-04C must preserve all of the following:

1. Somnolent Expanse has exactly **twelve realm-local physical/material foundations** at this layer.
2. The six Set 24 resource names and conceptual source anchors are retained.
3. Generic Atlas role-slot labels do not override physically coherent final taxonomy.
4. Dreamstone is the common native structural stone.
5. Dream Sand is a common loose substrate and is not powdered Dream Motes.
6. Dream Soil is one broad terrain family with bounded profiles/states.
7. Dreamwater uses the universal water/fluid infrastructure where practical.
8. Reverie Wood is the realm’s principal native timber; source biology belongs to FCC-04D.
9. Waking Stone is a distinct specialist mixed-reality material, not the common stone.
10. The realm has no required native metal family.
11. Dream Motes are portable dream resources, not generic masonry.
12. Nightmare Sap is the raw precursor to Nightmare Resin.
13. Natural Nightmare Resin is not automatically Void-corrupted.
14. Lucid Glass is canonical; Dream Glass does not survive as a separate material.
15. Fate Glass remains a prophecy-attuned Lucid Glass state/product by default.
16. Abyssal Dream Glass remains a Deep-Dream/low-coherence Lucid Glass state by default.
17. Sleepbloom is both a canonical plant and a principal harvested resource; biology belongs to FCC-04D.
18. Dream Thread is merged into Memory Thread.
19. Memory Thread sourcing must use already-canonical ecology/cultivation and may not create a new species solely for provenance.
20. Prophecy Ink is a processed specialist inscription reagent, with Omen Dust as a common precursor.
21. Time-Seed is a prophecy-aligned botanical product and does not grant unrestricted time travel.
22. Inspiration Resin is a minor botanical product distinct from Nightmare Resin.
23. Fear Chitin is anatomy-dependent and not a generic nightmare drop.
24. Road Chalk is crafted and is not a natural mineral family.
25. Coherence Core is crafted and is not a natural ore.
26. Derived forms are purpose-driven rather than combinatorial.
27. Placeable Blocks use generated Block Inventory Projections rather than duplicate authored Items.
28. Export is allowed with bounded state-dependent stabilisation where needed.
29. Materials may not create a second physical access method into Somnolent Expanse.
30. Major authority progression does not require kill-only material acquisition.
31. Natural nightmare, low coherence and Void corruption remain distinct.
32. Corruption begins as state/overlay and only creates new material definitions after irreversible-transformation validation.
33. Material identity and resource quantity are invariant across performance profiles.
34. Final art governance inherits physical/material identity but does not redefine it.

---

# 49. FCC-04C Canonical Snapshot

## 49.1 Common / Supporting Foundations

1. Dreamstone
2. Dream Sand
3. Dream Soil
4. Dreamwater
5. Reverie Wood
6. Waking Stone

## 49.2 Principal Specialist Set 24 Resources

1. Dream Mote
2. Nightmare Resin
3. Lucid Glass
4. Sleepbloom
5. Memory Thread
6. Prophecy Ink

## 49.3 Canonical Minor Raw / Ecological Resources

- Nightmare Sap
- Omen Dust
- Time-Seed
- Inspiration Resin
- Fear Chitin

## 49.4 Canonical Crafted / Functional Products

- Road Chalk
- Coherence Core
- Memory Thread Cloth / encoded weave families
- hardened Nightmare Resin / coatings / sealants
- calibrated Lucid Glass optical/interface forms
- Prophecy Ink records/inscriptions

## 49.5 Reconciled State / Variant Terms

- Fate Glass -> Lucid Glass state/product
- Abyssal Dream Glass -> Lucid Glass state
- Origin Motes -> Dream Mote state/source
- Courier Motes -> Dream Mote configured state
- Dream Thread -> Memory Thread terminology/product usage only
- Lucid Water -> Dreamwater coherent/Lucid presentation

## 49.6 Explicit Exclusions

- no required Somnolent native metal;
- no generic Dream Energy material replacing all resources;
- no separate Dream Glass material;
- no generic nightmare loot material;
- no unrestricted time resource;
- no material that bypasses Dreamgate access;
- no automatic corrupted copy of every material;
- no duplicate same-identity block-items.

---

# 50. FCC-04C Acceptance Gate

FCC-04C is ready for realm-local acceptance only when all of the following are true:

- exactly twelve realm-local physical/material foundations are identified;
- the six Set 24 resource names and source anchors are preserved;
- inconsistent Atlas role-slot labels are explicitly superseded;
- Dreamstone, Dream Sand, Dream Soil and Dreamwater form a coherent ordinary terrain backbone;
- Reverie Wood is admitted as the principal native timber without redefining its plant biology;
- Waking Stone remains a specialist mixed-reality stabilisation material;
- no unnecessary native metal family is introduced;
- Dream Mote, Nightmare Resin, Lucid Glass, Sleepbloom, Memory Thread and Prophecy Ink each have a distinct role;
- Dream Glass is reconciled into Lucid Glass;
- Fate Glass and Abyssal Dream Glass are states/products rather than duplicate base materials by default;
- Origin Motes and Courier Motes remain Dream Mote states/usages;
- Nightmare Sap -> Nightmare Resin is explicit;
- Omen Dust -> Prophecy Ink broad provenance is explicit;
- Time-Seed is bounded to prophecy conditions rather than time travel;
- Inspiration Resin and Fear Chitin are accounted for as minor resources;
- Road Chalk and Coherence Core are correctly treated as crafted products/components;
- Memory Thread sourcing is constrained to existing canonical ecology/cultivation rather than new roster inflation;
- broad processing routes are defined without premature numeric recipes;
- universal processing systems are reused unless a Somnolent process is genuinely distinctive;
- derived-form eligibility is bounded and physically justified;
- placeable Blocks use generated Block Inventory Projections rather than duplicate same-identity Items;
- export is allowed with state-dependent stabilisation instead of automatic disappearance;
- Dreamgate material roles are defined while the exact global progression recipe remains correctly deferred;
- resource provenance supports trade, ecology, quests, restoration and validation without unlimited history storage;
- authority/dungeon rewards do not create kill-only mandatory resource gates;
- natural nightmare, low coherence and Void corruption remain distinct;
- no automatic `Corrupted X` material roster is generated;
- cross-document ownership boundaries are explicit;
- material identities are sufficient for FCC-04D through FCC-04J and later global material/art reconciliation.

**FCC-04C Status:** **REALM-LOCAL LOCK CANDIDATE - pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE - pending final cross-realm reconciliation.**

