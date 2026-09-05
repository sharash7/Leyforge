# Leyforge Final Content Canon Collection

## FCC-04G — Somnolent Expanse Structures, Sites, Dreamgate, Blocks, Items, Processing & Recipes

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Somnolent Expanse  
**Stable Realm ID:** `realm.network.somnolent_expanse`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-04A through FCC-04F  
**Primary Upstream Sources Reconciled:** Foundation Documents 00–20; World Content Atlas Set 24; Post-Atlas production governance; accepted FCC-04 interview decisions Q246–Q390; FCC-04A through FCC-04F.  
**Primary Scope:** signature structures, supporting structure/site families, Dreamgate physical-content contract, realm-local Block eligibility, true Item eligibility, processing pathways, recipe-family relationships, food/product interfaces, coherence technology, construction/project handoff, legacy portal/content migration and Block/Item duplicate prevention.  
**Final Global Status:** Pending final cross-realm reconciliation and FCC-12/FCC-13/FCC-14 certification.

---

# 1. Purpose

FCC-04G is the Somnolent Expanse's **physical-content integration document**.

It translates the realm identity, biomes, materials, flora, creatures and civilisations established in FCC-04A–F into buildable, harvestable, craftable, placeable and processable content.

It owns realm-local canon for:

- the seven canonical signature structures;
- supporting civic, route, settlement and stabilisation structure families;
- the Dreamgate's realm-specific physical-content contract;
- realm-specific Block families and shape eligibility;
- true portable Item families;
- installed functional assemblies;
- processing relationships;
- recipe-family relationships;
- Coherence Core and Road Chalk physical-content treatment;
- Somnolent food/product interfaces;
- construction/project handoff;
- material-to-form eligibility;
- legacy Dream Glass and generic portal reconciliation;
- Block Inventory Projection compliance;
- recipe reachability and circular-dependency prevention at realm-local level.

FCC-04G does **not** own:

- universal Block runtime rules;
- universal Item runtime rules;
- universal crafting transaction mechanics;
- universal fluid simulation;
- universal food/hunger execution;
- economy pricing;
- settlement simulation;
- dungeon/guardian/authority definitions;
- final numerical recipe quantities;
- final global stable IDs;
- the global portal progression order;
- the final Dreamgate cross-realm dependency;
- final cross-realm recipe deduplication;
- final material art profiles.

Those remain owned by universal systems and FCC-12/FCC-13/FCC-14.

The governing rule is:

> **FCC-04G defines what Somnolent physical content exists and how Somnolent materials are transformed; shared Leyforge systems define how inventory, crafting, placement, machines, food, portals and construction execute those contracts.**

---

# 2. Physical Content Canon Rule

Somnolent content must obey two linked rules.

First:

> **A realm-specific object exists only when its material, structure, lifecycle or function is genuinely Somnolent-specific. Universal content is reused rather than renamed.**

FCC-04G therefore must not create a Dream Furnace, Dream Chest, Dream Workbench, Dream Loom, Dream Boat, Dream Door, Dream Pickaxe or Dream Barrel merely because ordinary universal objects are used inside the realm.

Realm-specific versions are justified only when the object has a materially different contract.

Second:

> **A placeable object that recovers as itself is one canonical Block plus a Block Inventory Projection, not a duplicate Item.**

A carried Dreamstone Brick is the inventory projection of the Dreamstone Brick Block.  
A carried Reverie Wood Door is the projection of the door Block.  
A carried Lucid Glass Pane is the projection of the placeable pane Block.

Separate Items are created only where the portable object is physically or functionally different from the world Block.

---

# 3. Structure Classification

Somnolent physical content is divided into six layers.

## 3.1 Signature Structures

The seven exact named realm-signature structures are:

1. **Dreamgate Sanctuary**
2. **Lucid Beacon**
3. **Reverie Conservatory**
4. **Memory Loom**
5. **Oracle Hall**
6. **Nightmare Ward**
7. **Sleepwalker Caravanserai**

These names are locked.

## 3.2 Canonical Portal

8. **Dreamgate**

Dreamgate is realm-access infrastructure and is not counted as an eighth signature civic structure.

## 3.3 Supporting Functional Structures

Supporting families include:

- coherence anchors;
- stabilisation workshops;
- emergency coherence shelters;
- route markers and Road Chalk stations;
- Dreamwater docks and storage;
- farms and gardens;
- fungal cultivation;
- aquaculture;
- Roadback stables;
- markets and warehouses;
- courier offices;
- export-stabilisation facilities;
- archives and schools;
- galleries and theatres;
- guard and Warden facilities;
- ordinary walls, shelters and civic infrastructure.

## 3.4 Settlement Archetype Construction

The 24 settlement archetypes defined in FCC-04F are settlement/planning grammars, not 24 monolithic unique building definitions.

## 3.5 Dungeons

Dungeon structures are owned by FCC-04H and remain separate from ordinary civic structures even where names or functions overlap.

In particular:

- **Oracle Hall** is ordinary civilisation infrastructure;
- **Lucid Observatory** is a dungeon family.

## 3.6 Technical / Hidden Infrastructure

Hidden anchors, generation controllers, route graphs, blueprint markers, coherence-state records and technical portal validators are system data.

They must not masquerade as player-facing lore Blocks unless a visible physical object has separately justified gameplay identity.

---

# 4. Signature Structure Registry

The following working IDs are realm-local FCC identifiers pending FCC-12/FCC-13 namespace normalisation.

| Working ID | Display Name | Primary Function |
|---|---|---|
| `structure.somnolent.dreamgate_sanctuary` | **Dreamgate Sanctuary** | protected arrival, return, orientation and portal-support complex |
| `structure.somnolent.lucid_beacon` | **Lucid Beacon** | stable symbolic reference, route navigation and coherence signalling |
| `structure.somnolent.reverie_conservatory` | **Reverie Conservatory** | botanical, artistic, therapeutic and pollinator cultivation complex |
| `structure.somnolent.memory_loom` | **Memory Loom** | Memory Thread weaving, stabilisation and authorised encoding workshop |
| `structure.somnolent.oracle_hall` | **Oracle Hall** | prophecy research, interpretation, teaching and inscription institution |
| `structure.somnolent.nightmare_ward` | **Nightmare Ward** | nightmare safety, treatment, research, containment or diplomacy facility |
| `structure.somnolent.sleepwalker_caravanserai` | **Sleepwalker Caravanserai** | route support, lodging, Roadback services, trade and coherence refuge |

These IDs are working content IDs, not claims of already-final global registry namespaces.

---

# 5. Dreamgate Sanctuary

The **Dreamgate Sanctuary** is the canonical civilisation-scale support structure built around or adjacent to a Dreamgate where settlement scale justifies it.

Supported physical/service interfaces include:

- safe arrival envelope;
- orientation and local route information;
- Lucidity recovery;
- Dreamgate maintenance workspace;
- customs or permits where politically controlled;
- visitor support;
- diplomatic reception;
- trade and storage;
- quarantine where a real ecological or corruption threat exists;
- emergency refuge;
- coherence stabilisation;
- route connection.

A Dreamgate Sanctuary is optional surrounding infrastructure.

The **Dreamgate and Dreamgate Sanctuary remain separate physical definitions**.

A Sanctuary cannot create an alternate portal, teleport people between arbitrary destinations or replace the universal Realm Access system.

Likely material language may draw from:

- Dreamstone foundations;
- Reverie Wood interiors;
- Waking Stone stabilisation;
- Lucid Glass interfaces;
- Coherence Core installations;
- imported metal fittings where appropriate.

Exact architectural composition belongs to structure/blueprint content and later art governance.

---

# 6. Lucid Beacon

The **Lucid Beacon** is a realm-specific functional structure or installed network node that provides a stable symbolic reference through compatible Somnolent regions.

A valid Lucid Beacon may support:

- route navigation;
- rescue;
- settlement orientation;
- Dream Walker operations;
- caravan support;
- map reliability;
- warning states;
- coherence monitoring;
- public-reference anchoring.

Its functional content may consume:

- Dreamstone or Waking Stone structural support;
- Lucid Glass optical/interface elements;
- a Coherence Core or equivalent approved stabilisation assembly;
- Dream Mote charge where the final functional recipe requires it;
- imported metal/mechanical fittings where needed.

These are **compatible component roles**, not a final numeric recipe.

A Lucid Beacon does not teleport travellers and does not make all local routes permanently fixed.

If a Beacon is represented by a recoverable placeable functional Block or multiblock assembly, those physical pieces remain Block-owned.

---

# 7. Reverie Conservatory

The **Reverie Conservatory** is a cultivated garden/workshop structure supporting:

- Emotion Blooms;
- Muse Moths;
- Dreamfruit;
- Sleepbloom;
- specialist flora;
- Inspiration Resin;
- dream cultivation;
- horticultural research;
- art;
- therapeutic or cultural activity.

The structure consumes the flora/crop ecology defined by FCC-04D.

It may contain:

- Dream Soil cultivation plots;
- Dreamwater irrigation;
- Reverie Wood construction;
- Lucid Glass windows/panels;
- pollinator habitat;
- ordinary storage;
- universal farming and food-processing stations.

A Conservatory does not create emotion-manipulation authority over nearby persons.

Emotion-responsive flora use the bounded state systems defined by FCC-04A/B/D.

---

# 8. Memory Loom

The **Memory Loom** is the primary Somnolent-specific processing/workshop structure for Memory Thread.

It may support:

- fibre/thread preparation;
- spooling;
- weaving;
- Memory Thread Cloth;
- woven screens and bindings;
- authorised record encoding;
- archive textiles;
- stabilisation;
- authentication;
- cultural products;
- specialist assembly components.

The Loom consumes explicit authorised/system-valid data when a product contains encoded memory or records.

It does **not**:

- read nearby minds;
- copy private memories automatically;
- create persons;
- duplicate NPC identity;
- generate unlimited lore.

Where universal loom mechanics can perform ordinary weaving, the Memory Loom should extend those capabilities rather than implement a wholly unrelated crafting system.

The physical Memory Loom is justified as a realm-specific station because its authorised encoding/stabilisation contract is distinct from an ordinary textile Loom.

---

# 9. Oracle Hall

The **Oracle Hall** is Somnolent civilisation's specialist prophecy-research and inscription institution.

It may provide facilities for:

- Omen Dust analysis;
- Prophecy Ink preparation;
- Lucid Glass calibration;
- Fate Glass attunement;
- Time-Seed research;
- probability maps;
- prophecy records;
- teaching;
- public forecasting;
- controlled prediction services.

An Oracle Hall does not guarantee the future.

Its physical stations consume the bounded prophecy systems defined in FCC-04A/B.

Where a universal alchemy, inscription, research or enchanting station already performs a required step, it should be reused or embedded rather than duplicated as another Somnolent-only workstation.

The Oracle Hall is distinct from the **Lucid Observatory** dungeon family.

---

# 10. Nightmare Ward

The **Nightmare Ward** is a structure family for managing dangerous nightmare phenomena.

Depending on local culture and purpose it may include:

- a Warden headquarters;
- treatment rooms;
- research laboratories;
- protected nightmare habitat;
- containment space;
- negotiation rooms;
- refuge;
- quarantine;
- defensive infrastructure.

Possible realm-specific physical content may use:

- Dreamstone;
- Waking Stone;
- hardened Nightmare Resin;
- Fear Chitin components where ethically/provenance-valid;
- Lucid Glass observation panels;
- Coherence Core installations;
- ordinary universal wards and defences where compatible.

A Nightmare Ward is not automatically a prison or extermination centre.

Natural nightmare material is not treated as Void-corrupted material merely because it is frightening.

---

# 11. Sleepwalker Caravanserai

The **Sleepwalker Caravanserai** is a major route-support structure or compact civic complex along Sleepwalker Roads.

It may include:

- traveller lodging;
- food and Dreamwater;
- Roadback stables;
- cargo storage;
- market space;
- courier services;
- route maps;
- Road Chalk;
- repair facilities;
- Dream Walker support;
- coherence anchoring;
- emergency refuge.

The signature structure may form the centre of the broader **Caravanserai settlement archetype**, but the two remain different content layers:

- settlement archetype = populated-place generation/planning grammar;
- signature structure = iconic functional building/complex.

Road Chalk markings and route data use the universal route/navigation systems rather than storing free-form path logic inside every chalk decal.

---

# 12. Supporting Structure and Site Families

FCC-04G recognises the following supporting physical families without promoting each to a signature structure.

## 12.1 Coherence / Stability

- Coherence Anchor;
- Coherence Core Housing;
- Waking Stone Foundation;
- Stabilised Storage;
- Emergency Coherence Shelter;
- Stabilisation Workbench/installation where functionally justified.

## 12.2 Routes / Navigation

- Sleepwalker Road markers;
- Road Chalk station;
- route rescue post;
- bridge;
- rest shelter;
- Lucid Beacon support node;
- expedition marker.

## 12.3 Dreamwater / Aquatic

- dock;
- pump adaptation;
- reservoir/cistern;
- Dreamwater containment;
- fishery;
- aquaculture pen;
- Mirrorfish habitat infrastructure.

## 12.4 Agriculture / Ecology

- Dream Soil field;
- Reverie Garden plot;
- Dreamfruit trellis;
- Sleepgrain plot;
- Lucid Root plot;
- Reverie Bean plot;
- Calmleaf plot;
- fungal bed;
- Muse Moth habitat;
- Nightmare Thorn managed plot.

## 12.5 Logistics

- warehouse;
- Roadback stable;
- caravan yard;
- market;
- courier office;
- export-stabilisation workshop;
- customs/quarantine facility.

## 12.6 Knowledge / Culture

- archive;
- library;
- school;
- gallery;
- theatre;
- prophecy record room;
- authorised memory-product repository.

Universal structure systems should provide ordinary versions wherever a realm-specific physical contract is unnecessary.

---

# 13. Dreamgate Canonical Physical Contract

The **Dreamgate** is the Somnolent Expanse's one canonical normal portal type.

Its presentation contract is locked at realm level:

- the portal initially reflects or echoes the traveller's current surroundings;
- the reflected view distorts into impossible dream imagery as the portal stabilises;
- the player's actual authoritative character crosses the portal;
- the Dreamgate remains the normal physical entry and exit method.

The exact frame shape is not locked by content canon.

It may be expressed as an arch, ring, threshold, standing frame, paired structure or other coherent portal architecture during later art/Forge work, provided its identity remains recognisably Somnolent and it is not reduced to a generic reused portal frame.

## 13.1 Realm-Local Component Pool

Accepted FCC canon reserves the following Somnolent families as **compatible Dreamgate ingredient/component roles**:

- **Lucid Glass** for interface, lens, threshold or calibration roles;
- **Dream Mote** for dream-active charge/catalyst roles;
- **Coherence Core / coherence technology** for stabilisation roles;
- **Waking Stone** where physical-law stabilisation is required;
- **Memory Thread** where binding, record or stabilisation interfaces are required;
- imported universal mechanical/magical components where final progression requires them.

This is deliberately a **component-role pool**, not a locked final recipe.

FCC-04 does not claim that every listed family must appear in every final Dreamgate recipe.

## 13.2 Exact Recipe Deferral

The following remain intentionally deferred to the global portal-progression reconciliation and FCC-13:

- exact frame ingredients;
- exact quantities;
- exact crafted subcomponents;
- mandatory earlier-realm material dependency;
- exact activation item/catalyst;
- progression tier;
- repair cost;
- upgrade path;
- final first-access recipe graph.

This deferral is canonical, not a content gap.

## 13.3 Portal Reuse

A properly established Dreamgate is normally reusable.

Normal travel must not require rebuilding the entire structure or repaying its entire construction cost per trip unless a damaged, unstable or special-event state explicitly changes that behaviour.

## 13.4 No Alternate Exit

Sleep, waking, Dreamwater, Sleepwalker Roads, prophecy, Memory Theatre, Waking Labyrinth and personal dream zones do not replace the Dreamgate as normal physical exit.

---

# 14. Legacy Portal and Dream-Access Reconciliation

Older source/runtime concepts may contain:

- generic Ancient Portal Frames;
- Broken Portal Blocks;
- Unstable Rifts;
- dream beds;
- sleep rituals;
- rare fungi;
- oracle-site entry;
- psychic-creature access;
- collective ceremonies;
- memory-object access;
- waking exits.

FCC-04G resolves them as follows.

## 14.1 Generic Portal Content

Generic portal frames, broken portals and rifts may remain as:

- teaser ruins;
- research clues;
- migration content;
- world-history evidence;
- quest structures;
- damaged generic portal technology.

They are **not automatically Dreamgates**.

## 14.2 Sleep / Ritual / Fungi / Oracle Access

These concepts may survive as:

- Dreamgate discovery clues;
- portal knowledge;
- activation context;
- visions;
- prophecy;
- quest gates;
- permission or research steps.

They do not physically move the player into Somnolent without a Dreamgate.

## 14.3 Waking Exit

Simply waking is not an exit method.

Normal physical exit uses valid Dreamgate infrastructure.

---

# 15. Practical Content Tiers

Somnolent physical content is organised into practical catalogue tiers.

| Tier | Content Layer | Examples |
|---|---|---|
| S0 | Terrain / Natural Blocks | Dreamstone, Dream Sand, Dream Soil, Dreamwater, natural Lucid Glass, Waking Stone |
| S1 | Ordinary Construction | Dreamstone masonry, Reverie Wood construction |
| S2 | Specialist Construction | Waking Stone, Lucid Glass interfaces, Memory Thread screens, hardened Nightmare Resin components |
| S3 | Raw Portable Resources | Dream Mote, Nightmare Sap, Omen Dust, Sleepbloom harvest, Time-Seed, Fear Chitin |
| S4 | Processed Materials | Nightmare Resin, Memory Thread products, Prophecy Ink, calibrated Lucid Glass, Inspiration Resin products |
| S5 | Functional Components | Coherence Core, Road Chalk, Lucid optical components, stabilisation fittings |
| S6 | Realm Infrastructure | Lucid Beacon, Memory Loom, Oracle Hall apparatus, Dreamgate assemblies |
| S7 | High-Value Outputs | advanced stabilisation products, authority/faction grants, future portal upgrade components |

Tier numbers are catalogue organisation aids, not universal player levels.

---

# 16. Terrain and Geological Block Catalogue

## 16.1 Dreamstone

**Classification:** Block/material family.

Required placeable families:

- Dreamstone;
- Cut Dreamstone;
- Dreamstone Brick;
- Dreamstone Slab;
- Dreamstone Stair;
- Dreamstone Wall;
- Dreamstone Pillar.

Eligible generated forms where universal shape systems justify them:

- Dreamstone Arch;
- Dreamstone Trim;
- Dreamstone Foundation.

Dreamstone does not gain prophecy, memory-reading or high-tier stabilisation simply because it is native to a dream realm.

## 16.2 Dream Sand

**Classification:** terrain Block family.

Required:

- Dream Sand terrain Block.

Possible state/profile handling:

- beach;
- dune;
- compacted;
- prophecy-exposed;
- low-coherence;
- disturbed.

These are preferably state/terrain-profile data.

A portable loose-sand Item is created only if universal terrain extraction transforms the Block into a genuinely different loose resource.

Dream Sand does not automatically refine into Lucid Glass.

## 16.3 Dream Soil

**Classification:** terrain Block family.

Required:

- Dream Soil.

Likely state/profile data includes:

- fertile;
- cultivated;
- damp;
- saturated;
- Reverie-enriched;
- prophecy-exposed;
- nightmare-affected;
- route-compacted;
- waking-stabilised;
- fragmented;
- restored;
- Void-contaminated.

Cultivated farmland should normally be a state/profile of compatible Dream Soil rather than a duplicate base-soil material unless the universal farmland system requires a separate executable Block.

## 16.4 Dreamwater

**Classification:** fluid Block/system family.

Required:

- Dreamwater fluid identity.

Dreamwater reuses universal fluid systems for:

- swimming;
- pumping;
- containers;
- storage;
- aquatic ecology;
- transport.

Different coherence or event conditions are fluid states, not separate named fluid materials.

## 16.5 Waking Stone

**Classification:** specialist stone Block/material family.

Required:

- Waking Stone;
- Cut Waking Stone;
- Waking Stone Brick or Plate profile where the physical form is justified;
- Waking Stone Foundation;
- Waking Stone Machinery Base;
- Waking Stone Anchor/Fitting where represented as a recoverable placeable object.

A complete decorative slab/stair/wall/pillar catalogue is not automatically required.

## 16.6 Natural Lucid Glass Source

**Classification:** natural resource/mineral Block.

Worldgen may require one or more physical source presentations such as:

- Lucid Glass seam;
- plate;
- nodule;
- crystalline formation.

Harvesting may return the same Block only if the source is intended to remain a construction-grade piece.

Where mining materially breaks/refines the source, extraction should produce a true Lucid Glass portable resource/component rather than duplicating the natural-source Block.

Exact executable representation is finalised in FCC-04J/FCC-13.

---

# 17. Reverie Wood Construction Catalogue

FCC-04D owns Reverie Tree biology.

FCC-04G owns practical building forms after legitimate harvest.

## 17.1 Natural Forms

Required where tree/worldgen systems need them:

- Reverie Log / Reverie Wood source Block;
- Reverie Leaves/canopy Block or procedural foliage representation.

A stripped form is optional only if universal wood processing and art differentiation justify it.

## 17.2 Processed Construction Forms

Required:

- Reverie Planks;
- Reverie Beam;
- Reverie Post;
- Reverie Slab;
- Reverie Stair;
- Reverie Door;
- Reverie Panel.

Eligible where universal architecture supports them:

- Reverie Fence/Railing;
- Reverie Trapdoor/Hatch;
- Reverie Arch;
- Reverie Fine Joinery;
- Reverie Furniture family.

A Reverie furniture object that is fundamentally placeable and recoverable as itself remains Block-owned.

## 17.3 Dream-Responsive Behaviour

Ordinary Reverie Wood remains useful outside the realm.

Dream-responsive behaviour may weaken or require stabilisation off-realm.

This is state data, not a reason to create separate `Awake Reverie Wood`, `Sleeping Reverie Wood` and similar material families.

---

# 18. Lucid Glass Practical Catalogue

## 18.1 Canonical Parent

**Lucid Glass** is the only base Somnolent glass-like material family.

The prototype/runtime name **Dream Glass** is a migration/reconciliation target, not a second canonical material.

## 18.2 Placeable Families

Eligible:

- Lucid Glass Block/Panel where structurally justified;
- Lucid Glass Pane;
- Lucid Glass Plate;
- Lucid Glass Inlay;
- calibrated interface surface.

Not automatic:

- stairs;
- walls;
- pillars;
- full masonry catalogue.

## 18.3 True Portable Components

Distinct portable Items may include:

- Lucid Glass Shard/Blank where extraction produces a portable raw component;
- Lucid Glass Lens;
- Calibrated Lucid Glass Lens;
- Lucid Glass Optical Component;
- inscribed Lucid Glass component where lifecycle differs from a placed plate.

## 18.4 Fate Glass

**Fate Glass** remains prophecy-attuned Lucid Glass.

It should preferably be represented as:

- a state on eligible Lucid Glass items/blocks; or
- a distinct processed product record derived from Lucid Glass while retaining Lucid Glass parent ancestry.

It is not a separate raw-mineral family.

## 18.5 Abyssal Dream Glass

**Abyssal Dream Glass** remains Deep-Dream / low-coherence Lucid Glass.

It is not a separate base-material family unless FCC-04I/J later proves irreversible transformation sufficient for distinct material admission.

---

# 19. Dream Mote Practical Catalogue

Dream Motes are primarily true portable resources.

Permitted physical representations include:

- loose/contained Dream Mote Item;
- vial/capsule state using universal containers;
- calibrated charge state;
- installed device charge/input;
- contained core input.

No generic Dream Mote masonry Block family is permitted.

## 19.1 Origin Motes

`Origin Motes` are Deep-Dream/ancient Dream Mote state or provenance.

## 19.2 Courier Motes

`Courier Motes` are route-attuned/configured Dream Motes used in signalling/courier systems.

Neither receives an independent raw-material family by default.

---

# 20. Nightmare Sap, Nightmare Resin and Fear Chitin

## 20.1 Nightmare Sap

**Nightmare Sap** is a true portable raw biological resource.

Principal botanical provenance comes from **Nightmare Thorn**.

Possible representations:

- sap container;
- raw batch;
- contaminated batch state where relevant.

## 20.2 Nightmare Resin

Canonical transformation:

> **Nightmare Sap -> cleaned / concentrated / hardened Nightmare Resin**

Approved practical products may include:

- Nightmare Resin;
- Hardened Nightmare Resin;
- Nightmare Resin Coating;
- Nightmare Resin Sealant;
- Nightmare Resin Reagent;
- selected defensive or containment component.

Nightmare Resin is not default heavy masonry.

## 20.3 Fear Chitin

**Fear Chitin** is a true creature-derived portable material whose principal canonical source is the **Nightmare Stalker**.

Valid acquisition includes:

- shed plates;
- abandoned moults;
- nest salvage;
- remains;
- hunting;
- trade.

Possible processed products may include:

- cleaned Fear Chitin plate;
- shaped Fear Chitin component;
- selected armour/tool/containment component.

No full `Fear Chitin building set` is created by default.

Natural nightmare provenance is not Void corruption.

---

# 21. Sleepbloom Practical Catalogue

FCC-04D owns the living plant.

FCC-04G admits the following physical/product forms where required:

- living Sleepbloom plant Block;
- harvested Sleepbloom;
- dried Sleepbloom;
- Sleepbloom Powder;
- Sleepbloom Extract/Infusion;
- food ingredient;
- medicine/alchemy ingredient.

Exact food and medicine recipes are deferred to FCC-13/balance where not realm-specific.

Sleepbloom products may support Lucidity/rest-related preparation but cannot physically transport the player between realms.

---

# 22. Memory Thread Practical Catalogue

**Memory Thread** remains the principal flexible memory-active fibre/thread material.

## 22.1 Source Boundary

FCC-04D explicitly leaves the exclusive biological source unresolved.

Therefore FCC-04G must **not invent a new plant, creature or extraction chain** solely to explain Memory Thread.

The allowed source contract is:

> **Memory Thread production must consume one or more already-canonical Somnolent ecological/cultivation sources or a validated crafted-fibre process without increasing the flora/creature roster.**

FCC-04J must reject an orphan Memory Thread definition that has no validated source.

## 22.2 Portable Forms

Potential true Items:

- Memory Thread;
- Memory Thread Spool;
- Memory Thread Cloth;
- Memory Thread Binding;
- authorised Encoded Memory Textile;
- specialist Memory Thread component.

## 22.3 Placeable Forms

Where physically justified:

- Memory Thread Screen;
- Memory Thread Membrane;
- woven banner/textile;
- installed binding/record surface.

Placeable textile forms that recover as themselves are Block-owned.

## 22.4 Privacy Boundary

Encoded Memory Thread may store only:

- explicitly contributed information;
- authored records;
- system-valid bounded memory data;
- authorised archive content.

It does not read arbitrary nearby thoughts.

---

# 23. Prophecy Ink, Omen Dust and Time-Seed

## 23.1 Omen Dust

**Omen Dust** is a true portable prophecy reagent.

Valid provenance may include:

- prophecy-exposed sediment;
- Prophecy Dune events;
- Omen Grass interactions;
- Oracle salvage;
- prophecy-site residue.

## 23.2 Prophecy Ink

Canonical recipe family:

> **Omen Dust + approved binder / solvent / catalyst inputs -> Prophecy Ink**

The binder/solvent/catalyst must use already-canonical global or Somnolent materials.

FCC-04G does not create a new `Prophecy Solvent` or `Fate Binder` base material merely to fill recipe slots.

Prophecy Ink may be used for:

- Oracle records;
- probability diagrams;
- prophecy maps;
- inscribed Lucid Glass;
- Prophecy Engine interfaces;
- specialist research inscriptions.

## 23.3 Time-Seed

**Time-Seed** is a rare botanical Item/state input.

It may be:

- planted;
- researched;
- traded;
- used in approved prophecy experiments.

It does not provide unrestricted time travel or guaranteed future knowledge.

---

# 24. Inspiration Resin Practical Catalogue

**Inspiration Resin** is a minor Reverie botanical product.

Possible true Items/products include:

- raw Inspiration Resin;
- refined art resin;
- dye/ink additive;
- enchantment component;
- fine-craft treatment;
- dream-architecture finish.

It remains distinct from Nightmare Resin.

It is not promoted into another principal construction-material family.

---

# 25. Road Chalk

**Road Chalk** is a crafted true Item / navigation consumable.

It is not a natural mineral resource.

Its recipe family must use already-canonical common Somnolent or universal inputs.

The final concrete input identities and quantities remain a global recipe-binding task.

Valid uses include:

- stable-route marking;
- hazard warning;
- caravan signalling;
- temporary route reinforcement cues;
- traveller rescue marks;
- route provenance.

Applied Road Chalk is preferably represented as a decal/marking/state or lightweight placed route marker rather than a full cubic construction Block.

Road Chalk never creates a portal or interdimensional shortcut.

---

# 26. Coherence Core

**Coherence Core** is a crafted Somnolent technology component.

It is not a natural ore, crystal deposit or creature product.

## 26.1 Canonical Ingredient-Role Pool

The accepted FCC ingredient pool consists of:

- **Waking Stone**;
- **Lucid Glass**;
- **Dream Motes**;
- **Memory Thread**;
- compatible imported mechanical or magical components.

A final concrete Coherence Core recipe must be assembled from this approved pool without inventing a new foundational stabilisation material.

The exact selected subset, quantities, component grades and station requirements remain subject to FCC-13/global recipe reconciliation.

## 26.2 Uses

Coherence Cores may support:

- settlement anchors;
- Lucid Beacons;
- Dreamgate infrastructure;
- protected storage;
- imported machinery;
- stabilised construction;
- dungeon restoration;
- research systems;
- mixed-reality infrastructure;
- off-realm stabilisation.

## 26.3 Block / Item Ownership

A portable Coherence Core is a true crafted Item/component.

An **installed Coherence Core Housing**, Anchor or Beacon assembly may be a functional Block that consumes the core as an installed component.

The installed structure and the removable core must not be represented as duplicate physical identities.

---

# 27. Botanical Placeable Catalogue

FCC-04D owns species biology.

FCC-04G defines practical Block/Item representations.

Canonical named flora/fungal foundations:

1. Sleepbloom
2. Emotion Bloom
3. Reverie Tree
4. Nightmare Thorn
5. Dream Reed
6. Omen Grass
7. Waking Ivy
8. Drowsecap Fungus
9. Mirrorleaf
10. Hush Moss
11. Deepbell
12. Dreamfruit Vine

World implementation may require placeable/natural representations for:

- growth stages;
- harvested state;
- damaged state;
- cultivated state;
- biome/coherence variation;
- Void-corrupted state where FCC-04I permits.

Those states should not multiply each species into multiple base Block definitions unless universal plant runtime requires discrete executable growth-stage Blocks.

Ambient flora remains visually broad without every background plant becoming a new registry identity.

---

# 28. Crop and Food Practical Catalogue

The five canonical cultivated crop identities are:

1. **Dreamfruit**
2. **Sleepgrain**
3. **Lucid Root**
4. **Reverie Bean**
5. **Calmleaf**

## 28.1 Crop Source Relationships

- Dreamfruit Vine -> Dreamfruit
- Sleepgrain crop -> Sleepgrain harvest
- Lucid Root crop -> Lucid Root harvest
- Reverie Bean crop -> Reverie Bean harvest
- Calmleaf crop -> Calmleaf harvest

Seeds/propagules may use universal crop propagation rules where possible.

## 28.2 Processing Families

Supported broad food transformations include:

- Dreamfruit -> fresh food / preserves / drinks / specialist dream-food recipes;
- Sleepgrain -> flour / porridge / bread-like foods / fermentation where universal systems permit;
- Lucid Root -> cooked food / preserved food / Lucidity-support preparation;
- Reverie Bean -> stews / pastes / preserved protein food;
- Calmleaf -> fresh greens / tea / culinary herb / restorative preparation;
- Drowsecap Fungus -> edible/medicinal preparation where FCC-04D allows;
- Mirrorfish -> food product where cultural and ecological rules permit.

This document does not invent a mandatory list of fantasy meal names.

Concrete meals should be added only when they serve:

- food progression;
- culture;
- trade;
- medicine;
- settlement provisions;
- quests;
- distinctive resource use.

Nutrition values and exact ingredient counts remain FCC-13/balance data.

## 28.3 Imported Food

Imported food remains authoritative inventory and works normally unless a specific supported Somnolent state modifies presentation or effect.

## 28.4 Exported Food

Stable Somnolent foods can export normally.

Highly dream-dependent special effects may require stabilisation to persist outside the realm.

---

# 29. Creature Product Interfaces

FCC-04G admits only creature-resource relationships already justified by FCC-04E.

## 29.1 Nightmare Stalker

Principal named material:

- **Fear Chitin** through shedding, moulting, nests, remains, hunting or trade.

## 29.2 Mirrorfish

May support:

- food;
- aquaculture;
- minor scales/pigment where concrete recipes justify them.

No major new material family is created.

## 29.3 Muse Moth

May support minor:

- fibre/dust/pigment;
- pollination-linked cultural/art products.

These remain minor products unless a later concrete recipe justifies an Item.

## 29.4 Waking Shellback

May provide minor shed/recovered biological-mineral shell material.

This is **not Waking Stone**.

## 29.5 Lucid Manta

May provide naturally shed minor material if a future concrete recipe justifies it.

No progression-critical material requires killing Lucid Mantas.

## 29.6 Roadback / Dream Grazer / Pillow Moss Beast

May support ordinary husbandry-derived products only when anatomically and culturally justified.

No generic dream-hide/meat/fibre family is automatically created.

---

# 30. Processing-Station Reuse Rule

The Somnolent Expanse reuses universal processing capabilities wherever they can represent the transformation faithfully.

Expected reusable capabilities include:

- stone cutting / masonry;
- sawmill / woodworking;
- ordinary crafting;
- alchemy / reagent mixing;
- inscription / rune work;
- enchanting / calibration;
- loom / weaving;
- research / archive analysis;
- cooking;
- drying / preservation;
- fermentation;
- fluid handling;
- machine assembly;
- ordinary forge/metalworking for imported metals.

Realm-specific stations are justified only where the process itself is distinct.

Canonical Somnolent-specific or Somnolent-distinct infrastructure includes:

- **Memory Loom**;
- **Oracle Hall** specialised apparatus;
- coherence-anchor / Coherence Core installations;
- Dreamgate assemblies.

Lucid Glass does not automatically require a Dream Furnace.  
Nightmare Resin does not automatically require a Nightmare Press.  
Dream Motes do not automatically require a dedicated Mote Machine.

---

# 31. Canonical Processing Relationships

FCC-04G locks the direction and semantic meaning of transformations.

It does not lock final numbers.

## 31.1 Dreamstone

> Dreamstone -> Cut Dreamstone -> Dreamstone Brick / approved shape transformations

## 31.2 Reverie Wood

> Reverie Tree source -> Reverie Wood / Log -> Planks / Beam / Post / Panel / approved construction forms

## 31.3 Waking Stone

> Waking Stone source -> cut / plate preparation -> foundation / anchor / machine / stabilisation component

## 31.4 Lucid Glass

> natural Lucid Glass -> cut / polished / calibrated Lucid Glass -> pane / lens / plate / inlay / interface component

State treatment:

> Lucid Glass -> prophecy attunement -> Fate Glass state/product

> Lucid Glass -> Deep Dream low-coherence transformation -> Abyssal Dream Glass state

## 31.5 Nightmare Resin

> Nightmare Thorn / approved source -> Nightmare Sap -> cleaned / concentrated / hardened Nightmare Resin -> coating / sealant / reagent / component

## 31.6 Sleepbloom

> living Sleepbloom -> harvested bloom -> dried / powdered / extracted preparation -> food / medicine / alchemy use

## 31.7 Memory Thread

> validated existing canonical source/crafted-fibre input -> Memory Thread -> spool / cloth / binding / authorised encoded textile

The first arrow remains subject to FCC-04J provenance validation without roster inflation.

## 31.8 Prophecy Ink

> Omen Dust + approved existing binder / solvent / catalyst -> Prophecy Ink -> inscription / record / interface

## 31.9 Coherence Core

> approved Coherence Core ingredient-role pool -> assembled Coherence Core -> installed stabilisation component

## 31.10 Road Chalk

> approved common existing ingredients -> Road Chalk -> applied navigation mark / route cue

## 31.11 Foods

> crop / edible biological source -> preparation / cooking / preservation -> food / drink / medicine where recipe-appropriate

---

# 32. Material-State Recipe Behaviour

Recipes may inspect bounded Somnolent state only where state creates meaningful gameplay.

Permitted examples:

- Fate Glass recipes require prophecy-attuned Lucid Glass;
- an Abyss-compatible instrument requires Deep-Dream/low-coherence Lucid Glass state;
- off-realm stabilisation uses Waking Stone or Coherence Core support;
- Nightmare Resin quality may depend on source/processing state;
- Dream Mote device recipes may require calibrated or route-attuned Mote state;
- a prophecy experiment may require a valid Time-Seed condition;
- exported dream-active food may require stabilised state.

Default construction recipes should not require constant Lucidity or coherence micromanagement unless the object's identity specifically depends on it.

---

# 33. Corruption and Material-State Recipe Boundaries

## 33.1 Natural Nightmare

Natural nightmare state is not Void corruption.

Nightmare Resin, Nightmare Thorn and Fear Chitin remain legitimate natural materials.

## 33.2 Low Coherence

Fragmented or low-coherence materials may:

- require stabilisation;
- be unsuitable for precision recipes;
- produce altered salvage;
- require specialist handling.

Low coherence is not automatically corruption.

## 33.3 Void Corruption

Early/reversible Void exposure should normally be a contamination/state overlay.

No automatic `Corrupted Dreamstone`, `Corrupted Reverie Wood`, `Corrupted Lucid Glass` or equivalent material family is generated.

Only FCC-04I/J may admit a distinct irreversible corrupted material after the defined transformation threshold is met.

---

# 34. Export and Off-Realm Processing

Somnolent resources are intended to retain useful roles outside the realm.

Potential exported uses include:

- Dreamstone construction;
- Reverie Wood construction/furniture;
- Waking Stone stabilisation;
- Lucid Glass optical/interface components;
- Dream Mote catalysts;
- Nightmare Resin coatings;
- Sleepbloom food/medicine;
- Memory Thread textiles/records;
- Prophecy Ink research/inscription;
- Fear Chitin components;
- Road Chalk/route research;
- Coherence Core technology.

Highly dream-responsive states may require:

- Waking Stone packaging;
- Coherence Core support;
- sealed containers;
- compatible enchantment;
- specialist treatment;
- limited-duration transport.

Ordinary material identity does not vanish merely because the item leaves Somnolent.

---

# 35. Automation and Machine Interfaces

Somnolent production may use automation.

Automation may support:

- Dreamstone cutting;
- Reverie Wood processing;
- Dreamwater pumping;
- Lucid Glass cutting/polishing where machine-compatible;
- controlled Nightmare Resin processing;
- ordinary crop processing;
- food preparation;
- storage/sorting;
- approved Coherence Core assembly;
- route-goods logistics;
- export-stabilisation logistics.

Automation must not:

- harvest private memories;
- treat persons as material sources;
- bypass ecological provenance;
- convert prophecy into guaranteed truth;
- create Dream Motes from nothing;
- turn unloaded nightmare societies into resource generators;
- bypass Dreamgate progression;
- ignore Void contamination;
- duplicate outputs through near/far simulation.

Universal transaction conservation remains authoritative.

---

# 36. Recipe Definition Standard

Every final concrete Somnolent recipe should identify:

- recipe ID;
- output identity;
- exact input identities or accepted material profiles;
- station/capability;
- quantity;
- reversible/non-reversible status;
- heat/mana/energy requirements where relevant;
- knowledge/unlock requirement;
- permission/cultural requirement where relevant;
- provenance restrictions where relevant;
- required material state where relevant;
- by-products;
- transaction conservation rule.

FCC-04G locks **recipe families and semantic transformations**.

FCC-13 owns the final exact concrete recipe records after all realms and the Overworld have been compared.

This distinction prevents the same universal process from being authored differently in every realm.

---

# 37. Recipe Reachability and Circular-Dependency Rule

A valid final recipe graph must be reachable.

No Somnolent recipe may require its own output, directly or indirectly, before the player can obtain a first instance.

Particular care is required for:

- Coherence Core;
- Dreamgate components;
- Lucid Glass calibration;
- Memory Loom construction;
- Oracle Hall specialist apparatus;
- off-realm stabilisation technology.

The final Dreamgate recipe must not require an item that can only be obtained after entering Somnolent unless the progression path explicitly provides a pre-portal acquisition source through an earlier realm, Overworld clue/reward, restored existing portal or other globally validated route.

This is a portal-progression validation rule, not authority for FCC-04G to invent the missing cross-realm component.

---

# 38. Construction and Project Handoff

Large Somnolent structures should use universal blueprint/project/construction systems rather than one-click crafting.

Applicable content includes:

- Dreamgate Sanctuary;
- large Lucid Beacon networks;
- Reverie Conservatories;
- Memory Loom workshops where building-scale;
- Oracle Halls;
- Nightmare Wards;
- Sleepwalker Caravanserais;
- Coherence Anchor networks;
- Dreamgate assemblies;
- settlement infrastructure;
- research colonies;
- route stations.

Construction may require:

- survey;
- terrain validation;
- route access;
- coherence/stability validation;
- exact material reservations;
- workers/tools;
- permissions;
- hazard safety;
- staged assembly;
- final service validation.

A structure receives service capability only when its functional components are correctly installed and validated.

Decorative placement alone does not create a working Oracle Hall, Memory Loom, Lucid Beacon or Dreamgate.

---

# 39. Player Blueprint and Forge Compatibility

Player-created Somnolent plans are allowed where ownership and progression permit.

Blueprint validation should be able to test:

- allowed material families;
- structural support;
- Dreamwater/fluid conflicts;
- coherence requirements;
- Waking Stone foundation requirements where relevant;
- Lucid Glass interface roles;
- Coherence Core installation;
- route access;
- Roadback access where needed;
- farm/crop suitability;
- Muse Moth habitat where designed;
- nightmare safety;
- Dreamgate clearance;
- portal-support infrastructure.

The Forge may author Somnolent-compatible objects using the locked material catalogue.

Forge validation must know:

- whether a material is structural;
- whether it is flexible;
- whether it is fluid;
- whether it is glass-like/transparent;
- whether it carries coherence/prophecy/nightmare state;
- whether it can be placed;
- whether it is Block-owned or Item-owned;
- whether a recipe is required;
- whether a proposed object duplicates existing canonical content.

AI-assisted Forge creation must not invent a new Somnolent material merely to satisfy a visual prompt.

---

# 40. Block Family Snapshot

The following realm-local Block families are explicitly accounted for.

## Terrain / Natural

- Dreamstone
- Dream Sand
- Dream Soil
- Dreamwater
- natural Waking Stone
- natural Lucid Glass source
- Reverie Tree / Reverie Wood natural forms
- the twelve canonical flora/fungal natural forms

## Construction

- Cut Dreamstone
- Dreamstone Brick
- Dreamstone Slab
- Dreamstone Stair
- Dreamstone Wall
- Dreamstone Pillar
- selected Dreamstone arch/trim/foundation profiles
- Reverie Planks
- Reverie Beam
- Reverie Post
- Reverie Slab
- Reverie Stair
- Reverie Door
- Reverie Panel
- selected Reverie railing/hatch/arch/furniture profiles
- Cut Waking Stone
- Waking Stone Brick/Plate where justified
- Waking Stone Foundation
- Waking Stone Machinery Base
- Lucid Glass Block/Panel where justified
- Lucid Glass Pane
- Lucid Glass Plate/Inlay
- Memory Thread screen/membrane/textile forms where placeable

## Functional / Installed

- Lucid Beacon functional assemblies
- Memory Loom
- Oracle Hall specialist apparatus where represented as installed Blocks
- Nightmare Ward functional assemblies
- Coherence Core Housing / Coherence Anchor
- Road Chalk applied marker representation
- Dreamwater adapted reservoirs/ports where realm-specific
- Dreamgate component/assembly Blocks once final global recipe binds them

This snapshot is a **family accounting list**, not a promise that every family becomes one single 1×1×1 voxel Block.

Multiblocks, furniture, structures and installed assemblies may use the appropriate universal object model.

---

# 41. True Item Family Snapshot

Expected realm-local true Items include, where final recipes require them:

## Raw / Harvested

- Dream Mote
- Nightmare Sap
- harvested Sleepbloom
- Omen Dust
- Time-Seed
- Inspiration Resin
- Fear Chitin
- Dreamfruit
- Sleepgrain
- Lucid Root
- Reverie Bean
- Calmleaf
- Drowsecap food/medicine product where required
- Mirrorfish food product where permitted

## Processed Materials

- Nightmare Resin
- Hardened Nightmare Resin
- Nightmare Resin Coating/Sealant
- Lucid Glass Lens / optical component
- Memory Thread
- Memory Thread Spool
- Memory Thread Cloth
- Memory Thread Binding
- authorised Encoded Memory Textile
- Prophecy Ink
- dried/powdered/extracted Sleepbloom
- processed Inspiration Resin products
- shaped Fear Chitin component

## Functional Components / Consumables

- Road Chalk
- Coherence Core
- calibrated Dream Mote container/charge state
- calibrated Lucid Glass component
- prophecy research records/components where universal knowledge systems require Items
- stabilisation packaging components where final recipes justify them

A placeable Dreamstone Brick, Reverie Door, Waking Stone Foundation, Lucid Glass Pane, Memory Thread Screen or functional machine Block does not also receive a separately authored duplicate Item.

---

# 42. Legacy Material and Runtime Registry Reconciliation

Legacy/runtime content may include **Dream Glass**.

FCC-04G requires:

> **Dream Glass is reconciled into canonical Lucid Glass rather than surviving as a parallel Somnolent material family.**

Possible migration treatment includes:

- alias old ID to Lucid Glass;
- migrate old saves to the canonical Lucid Glass family;
- retain legacy name only as a migration label;
- preserve old visual assets only as temporary implementation references.

The following older names are likewise reconciled:

| Older / Candidate Term | FCC-04G Treatment |
|---|---|
| Dream Glass | merge to **Lucid Glass** |
| Fate Glass | prophecy-attuned Lucid Glass state/product |
| Abyssal Dream Glass | Deep-Dream/low-coherence Lucid Glass state |
| Sleep Motes | Dream Mote terminology |
| Origin Motes | Dream Mote provenance/state |
| Courier Motes | route-attuned Dream Mote state |
| Dream Thread | Memory Thread parent material |
| Nightmare Sap | raw precursor to Nightmare Resin |
| Coherence Core | crafted component, never ore |
| Road Chalk | crafted consumable, never ore |
| Dream Fruit | Dreamfruit crop/food |
| Lucid Water | coherent/Lucid Dreamwater state |
| probability catalysts | products/recipe category using canonical inputs, not new base material |
| communication reagents | products/recipe category using canonical inputs, not new base material |

---

# 43. Universal Content Reuse

Somnolent civilisation may use universal:

- chests;
- crates;
- barrels;
- warehouses;
- workbenches;
- furnaces;
- anvils;
- ordinary looms;
- alchemy stations;
- enchanting stations;
- research desks;
- cooking stations;
- pumps;
- pipes;
- roads;
- ladders;
- ordinary doors;
- fences;
- beds;
- furniture;
- bridges;
- boats;
- imported metal components;
- ordinary weapons and tools.

FCC-04G must not create realm-prefixed duplicates unless a different functional contract is proven.

A Reverie Wood chest may be a material variant/profile of a universal chest design rather than a new gameplay system.

---

# 44. Cross-Document Interfaces

## FCC-04A

Supplies:

- realm identity;
- Dreamgate ownership;
- progression;
- portal-only physical travel;
- Lucidity/coherence/expectation/prophecy boundaries;
- death/respawn exclusion.

## FCC-04B

Supplies:

- biome placement;
- coherence states;
- environmental hazards;
- Dreamwater/environment state;
- worldgen suitability;
- destination safety.

## FCC-04C

Supplies:

- all material identities;
- provenance;
- derived-form eligibility;
- state architecture;
- export/stabilisation rules.

## FCC-04D

Supplies:

- flora;
- Reverie Tree biology;
- crop and food sources;
- Nightmare Thorn sap provenance;
- Omen Grass/Time-Seed interfaces;
- unresolved-but-bounded Memory Thread ecological source requirement.

## FCC-04E

Supplies:

- creature-derived material provenance;
- Fear Chitin;
- fisheries/husbandry;
- personhood and non-extractive acquisition boundaries.

## FCC-04F

Supplies:

- civilisation infrastructure;
- settlement archetypes;
- professions;
- seven signature-structure identities and social functions.

## FCC-04H

Owns:

- dungeons;
- guardians;
- fixed authorities;
- Collective Fear Sovereign family;
- dungeon/authority reward provenance;
- major encounter structures and outcomes.

## FCC-04I

Owns:

- Void corruption;
- restoration;
- realm-state transitions;
- cross-realm dynamic-state interaction;
- irreversible-transformation admission.

## FCC-04J

Certifies:

- final realm-local structure registry;
- Block/Item family completeness;
- recipe-family completeness;
- provenance validation;
- local duplicate/orphan audit;
- art-handoff readiness.

## FCC-12 / FCC-13

Own:

- final global material/process normalisation;
- final Block IDs;
- final Item IDs;
- final recipe records;
- final tags;
- exact quantities;
- final component binding;
- global portal recipe binding.

---

# 45. Source Reconciliation Register

| Source-Era Direction | FCC-04G Resolution |
|---|---|
| Somnolent as dream network | retained |
| Dreamgate-only normal physical access | retained and physically enforced |
| sleep/ritual/fungi/oracle entry | reclassified as clue/knowledge/context, not travel |
| waking exit | prohibited as normal exit |
| Sleepwalker Road cross-realm shortcuts | prohibited as normal travel |
| eight canonical biome families | consumed from FCC-04B |
| six Set 24 specialist resources | retained under physically coherent roles |
| Dream Glass prototype/runtime family | reconcile to Lucid Glass |
| Dream Sand | retained as terrain |
| Dream Soil | retained as terrain/agriculture substrate |
| Dreamwater | retained as water-compatible fluid |
| Waking Stone | retained as specialist stabilisation stone |
| no native Somnolent metal | retained |
| Fate Glass | Lucid Glass state/product |
| Abyssal Dream Glass | Lucid Glass state |
| Origin/Courier Motes | Dream Mote states/provenance |
| Dream Thread | Memory Thread |
| Nightmare Sap | precursor to Nightmare Resin |
| Omen Dust | Prophecy Ink precursor/reagent |
| Time-Seed | rare prophecy botanical item |
| Coherence Core | crafted component |
| Road Chalk | crafted navigation consumable |
| Inspiration Resin | minor Reverie botanical product |
| Fear Chitin | Nightmare Stalker-derived minor material |
| one station per dream resource | rejected |
| exact final Dreamgate recipe inside FCC-04 | deliberately deferred |
| exact numeric recipes inside FCC-04G | deferred to FCC-13 |
| duplicate Block and Item records | prohibited |
| automatic material × every shape | prohibited |
| automatic Corrupted-X families | prohibited |

---

# 46. Acceptance Gate

FCC-04G is ready for realm-local acceptance only when all of the following are true.

## 46.1 Structures

- all seven exact signature structure names are preserved;
- Dreamgate remains separate from the seven civic signature structures;
- Dreamgate Sanctuary cannot create an alternative portal;
- Lucid Beacon cannot teleport;
- Reverie Conservatory consumes real botanical/ecological systems;
- Memory Loom cannot automatically extract private memories;
- Oracle Hall remains distinct from Lucid Observatory;
- Nightmare Ward is not automatically an extermination/prison facility;
- Sleepwalker Caravanserai uses real route/logistics systems;
- supporting infrastructure reuses universal structures where possible.

## 46.2 Portal

- Dreamgate is the one canonical normal Somnolent portal;
- the actual authoritative player crosses physically;
- normal exit requires Dreamgate infrastructure;
- sleep, waking, rituals, fungi, psychic creatures and prophecy cannot bypass it;
- accepted compatible component roles are preserved;
- exact frame recipe, quantities and cross-realm dependency remain deferred;
- no generic Ancient Portal Frame is silently promoted into the canonical Dreamgate;
- no circular first-access recipe is allowed.

## 46.3 Block / Item Ownership

- placeable recoverable objects use one Block identity plus Block Inventory Projection;
- Dreamstone receives only justified construction forms;
- Dream Sand and Dream Soil do not receive decorative masonry catalogues;
- Dreamwater remains a fluid family;
- Reverie Wood receives a bounded construction family;
- Waking Stone remains specialist rather than universal decorative stone;
- Lucid Glass does not receive a full arbitrary masonry catalogue;
- Dream Motes do not become generic building blocks;
- plant/crop source Blocks transform into harvested Items where physical identity changes;
- no duplicate Dream Glass material survives beside Lucid Glass.

## 46.4 Processing

- Nightmare Sap processes into Nightmare Resin;
- Omen Dust participates in Prophecy Ink processing;
- Lucid Glass can be cut/polished/calibrated;
- Fate Glass remains a Lucid Glass state/product;
- Abyssal Dream Glass remains a Lucid Glass state unless FCC-04I/J proves distinct transformation;
- Sleepbloom has fresh/dried/powder/extract processing;
- Memory Thread supports thread/spool/cloth/binding/encoded textile pathways;
- Memory Thread provenance is not fabricated by adding a thirteenth plant or creature;
- Coherence Core is crafted from the approved ingredient-role pool;
- Road Chalk is crafted from existing materials and is not a natural ore;
- universal stations are reused wherever practical.

## 46.5 Food / Creature Products

- all five crop identities are physically accounted for;
- native food supports universal hunger/provisions rather than a parallel dream-hunger system;
- stable foods can export;
- creature products follow FCC-04E provenance;
- Fear Chitin does not become a generic nightmare drop;
- personhood cannot be bypassed for resource extraction.

## 46.6 Governance / Deferred Work

- exact numerical recipes remain reserved for FCC-13;
- exact Dreamgate progression dependency remains reserved for global portal reconciliation;
- final stable IDs remain subject to FCC-12/FCC-13;
- corruption does not auto-generate duplicate material families;
- universal death/respawn remains outside FCC-04;
- final art/material profiles remain deferred to later art governance.

---

# 47. FCC-04G Canonical Snapshot

## Signature Structures

1. Dreamgate Sanctuary
2. Lucid Beacon
3. Reverie Conservatory
4. Memory Loom
5. Oracle Hall
6. Nightmare Ward
7. Sleepwalker Caravanserai

## Canonical Portal

- **Dreamgate**

## Common / Supporting Material Foundations

- Dreamstone
- Dream Sand
- Dream Soil
- Dreamwater
- Reverie Wood
- Waking Stone

## Principal Specialist Resources

- Dream Mote
- Nightmare Resin
- Lucid Glass
- Sleepbloom
- Memory Thread
- Prophecy Ink

## Minor / Derived Resources and Products

- Nightmare Sap
- Omen Dust
- Time-Seed
- Inspiration Resin
- Fear Chitin
- Road Chalk
- Coherence Core
- Fate Glass state/product
- Abyssal Dream Glass state
- Origin Mote state/provenance
- Courier Mote state/provenance

## Crops

1. Dreamfruit
2. Sleepgrain
3. Lucid Root
4. Reverie Bean
5. Calmleaf

## Core Processing Families

- stone cutting / masonry;
- Reverie woodworking;
- Waking Stone shaping/stabilisation;
- Lucid Glass cutting/calibration;
- Nightmare Sap -> Nightmare Resin;
- Sleepbloom preparation;
- Memory Thread weaving/authorised encoding;
- Omen Dust -> Prophecy Ink;
- Coherence Core assembly;
- Road Chalk crafting;
- crop/food processing;
- export stabilisation.

---

# 48. Realm-Local Status

FCC-04G accounts for Somnolent physical-content identity without prematurely freezing balance data or the global realm-progression graph.

The document intentionally leaves the following for later ownership:

- exact numerical recipes;
- exact recipe quantities;
- exact final station tiers;
- exact Dreamgate frame recipe;
- exact Dreamgate activation cost;
- exact mandatory earlier-realm portal dependency;
- final global Block IDs;
- final global Item IDs;
- final final recipe IDs;
- final material art profiles.

Those are deliberate downstream interfaces rather than theoretical-content gaps.

**FCC-04G realm-local physical-content canon is ready for review.**
