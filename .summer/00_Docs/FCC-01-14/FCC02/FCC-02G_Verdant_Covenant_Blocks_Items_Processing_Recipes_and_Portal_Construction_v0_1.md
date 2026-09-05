# Leyforge Final Content Canon Collection

## FCC-02G - Verdant Covenant Blocks, Items, Processing, Recipes & Portal Construction

**Version:** 0.1  
**Status:** Content Canon - Realm Local Lock  
**Realm:** Verdant Covenant  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Depends On:** FCC-02A, FCC-02B, FCC-02C, FCC-02D, FCC-02E, FCC-02F  
**Primary Upstream Sources Reconciled:** Foundation Documents 03, 05, 06 and related systems; World Content Atlas Set 24; Post-Atlas Governance Set 25, especially 25H, 25I and 25J; later FCC interview decisions  
**Final Global Status:** Pending cross-realm reconciliation through FCC-01, FCC-12, FCC-13 and FCC-14.

---

# 1. Purpose

FCC-02G converts the Verdant Covenant's locked realm materials, flora, creature resources, settlement needs and portal-access contract into an authoritative realm-local **practical content catalogue**.

It owns the Verdant Covenant definitions for:

- canonical realm-local block families and approved generated shape profiles;
- canonical Verdant item and component families;
- raw-to-processed material chains;
- realm-specific processing requirements;
- realm-native food and consumable foundations;
- culture and diplomacy goods where they require distinct physical items;
- Verdant restoration products;
- realm-specific recipe contracts;
- the **Covenant Heart**;
- the physical **Covenant Portal** construction package;
- Covenant Portal activation and upgrade requirements;
- provenance requirements for realm materials and crafted goods;
- block/item single-definition enforcement;
- derived-form eligibility enforcement;
- recipe reachability and circular-dependency prevention;
- interfaces handed to the later universal Block, Item and Recipe reconciliation.

FCC-02G does **not** redefine:

- the universal crafting framework;
- universal station execution;
- tool durability;
- item stacking architecture;
- generic food/hunger simulation;
- universal equipment slot rules;
- universal building placement;
- the portal runtime, loading, linking, multiplayer or save systems;
- NPC job execution;
- economy pricing;
- universal automation;
- universal magic casting;
- dungeon/boss reward logic;
- final global stable IDs;
- final art/material profiles.

Those systems are consumed through established interfaces.

The guiding rule is:

> **FCC-02G defines what Verdant physical content exists and how Verdant materials are transformed; universal systems define how crafting, inventory, placement, portals, food, equipment and machines execute those contracts.**

---

# 2. Canon Statement

The Verdant Covenant must not generate an uncontrolled material-by-shape explosion.

A resource receives a block or item form only when that form is justified by:

- physical behaviour;
- construction role;
- ecological role;
- cultural use;
- processing necessity;
- progression requirement;
- portal requirement;
- equipment use;
- food or medicine use;
- machine/automation interface;
- dungeon or authority interface.

The practical catalogue therefore uses **bounded canonical families plus generated eligible shape variants**.

The final global registry may emit multiple executable entries from one family contract, but those entries must remain traceable to the family that justified them.

The realm-local content package must remain comprehensible enough that a developer can answer:

1. what the object is;
2. whether it is a Block or Item;
3. what material owns its visual identity;
4. where it comes from;
5. what processing creates it;
6. what it can be used for;
7. whether it is renewable;
8. whether it carries season, health, memory, consent, provenance or corruption state;
9. whether its recipe is reachable before it is required;
10. whether another realm/system owns part of its execution.

---

# 3. Ownership and Registry Contract

## 3.1 Block Definition Rule

If a Verdant object is fundamentally a placeable block and breaking/recovering it returns that same physical object, it has **one canonical Block definition**.

Inventory representation uses the generated/reference block-form representation.

Examples:

- Rootstone Brick;
- Greatheart Planks;
- Dawnwood Beam;
- Bloomwood Door;
- Living Heartwood Arch;
- Thornsilver Lattice;
- Pollen Amber Pane;
- Covenant Portal Frame.

These do not receive separately authored duplicate Item definitions merely because they can be carried.

## 3.2 Distinct Item Rule

A distinct Item definition is permitted when processing or harvesting produces a genuinely different non-block object.

Examples:

- Living Heartwood Billet;
- Season Sap Vial;
- Thornsilver Fibre;
- Thornsilver Cord;
- Pollen Amber Lens;
- Memory Seed;
- Memory Seed Capsule;
- Bloomstone Chunk;
- Bloomstone Stabiliser Core;
- River Pearl;
- Root Amber;
- Anti-Blight Salve;
- Covenant Heart.

## 3.3 Transformation Rule

A Block may transform into an Item on harvest where the physical identity changes.

Examples:

- Bloomstone Deposit Block -> Bloomstone Chunk Item;
- Pollen Amber Deposit/Nodule Block -> Pollen Amber Chunk Item;
- plant/crop Block -> harvested produce Item;
- Season Sap Source/Tap Block state -> Season Sap in a container Item;
- Memory Seed Pod Block -> Memory Seed Item.

This is not duplication because the harvested object is physically and functionally different from the source block.

## 3.4 Generated Shape Rule

Eligible slabs, stairs, walls, beams, pillars, panels and similar forms may be generated from approved family profiles.

A generated entry must inherit:

- source material identity;
- canonical palette/material profile later defined by art governance;
- hardness/durability class;
- sound family;
- tool interaction;
- state compatibility;
- provenance requirements where applicable;
- recipe conversion profile;
- stable family ancestry.

No generator may emit every possible shape for every material.

---

# 4. Practical Content Tiers

Verdant physical content is organised into seven practical tiers.

| Tier | Content | Examples |
|---|---|---|
| V0 | Terrain / Natural Blocks | Verdant Living Soil, Rootstone, Worldroot Mass, resource deposits |
| V1 | Ordinary Construction | Greatheart, Dawnwood, Bloomwood, Rootstone construction families |
| V2 | Specialist Living / Flexible / Optical Construction | Living Heartwood, Thornsilver, Pollen Amber, Bloomstone |
| V3 | Raw Items | Memory Seeds, Bloomstone Chunks, fibres, pearls, amber chunks, crops |
| V4 | Processed Components | Billets, cord, cloth, lenses, stabiliser cores, resin, capsules |
| V5 | Functional Products | Growth Anchors, living conduit components, treatments, portal parts |
| V6 | High-Value Realm Products | Covenant Heart, authority outcome proofs, advanced portal upgrades |

Tier numbers are catalogue organisation aids, not universal player levels.

---

# 5. Terrain and Geological Block Catalogue

## 5.1 Verdant Living Soil

**Classification:** Block family.  
**Role:** Canonical realm soil/substrate.

Required executable forms:

- Verdant Living Soil;
- compacted/path state where universal path systems support it;
- cultivated state through universal farmland/planting interface where appropriate.

State overlays may include:

- healthy;
- season-aligned;
- exhausted;
- restored;
- blighted;
- Void-corrupted.

Season and health should normally be state data, not duplicate block families.

## 5.2 Rootstone

**Classification:** Block/material family.

Required construction forms:

- Rootstone;
- Cut Rootstone;
- Rootstone Bricks;
- Rootstone Slab;
- Rootstone Stair;
- Rootstone Wall;
- Rootstone Pillar.

Optional generated decorative profile, only if globally supported:

- Rootstone Trim;
- Carved Rootstone Panel.

Rootstone remains ordinary stone. It does not acquire memory storage, living growth or stabilisation simply because it is native to the realm.

## 5.3 Worldroot Mass

**Classification:** Natural terrain/organic Block family.

Required forms/states:

- Worldroot Mass;
- Worldroot Wall/Root Face where worldgen requires it;
- exposed root arch/tunnel lining generated through worldgen geometry;
- living;
- dormant;
- cut;
- damaged;
- blighted;
- restored;
- corrupted where FCC-02I permits.

Worldroot Mass is primarily terrain/ecological infrastructure. It is not a cheap general-purpose player timber family.

## 5.4 Riverbed and Silt

Living Riverlands require a realm-local riverbed/silt presentation profile.

This may be represented through:

- Verdant Silt as a terrain Block where distinct gameplay is justified; or
- a Verdant Living Soil wet/silt state if the final global terrain registry can represent it cleanly.

**FCC-02G preference:** use one `Verdant Silt` terrain family only if sediment behaviour, crop suitability, extraction or construction use differs enough from ordinary wet soil to justify it. FCC-12/FCC-13 performs the final duplicate check.

## 5.5 Bloomstone Deposit

**Classification:** Natural resource Block.

Required states:

- immature;
- harvestable;
- depleted;
- recovering;
- exhausted;
- damaged-root;
- season-charged;
- cleansed;
- blighted;
- corrupted.

Normal extraction transforms harvestable deposit material into **Bloomstone Chunk** Items rather than returning the deposit Block itself.

## 5.6 Pollen Amber Deposit / Nodule

**Classification:** Natural resource Block.

Required forms/states:

- resin-pollen nodule/deposit;
- immature;
- hardened;
- clear;
- clouded;
- harvested/depleted.

Harvest produces **Pollen Amber Chunk** Items.

## 5.7 Living Heartwood Source Node

Living Heartwood remains embedded in eligible mature Greatheart anatomy rather than existing as arbitrary ore.

The resource interface may mark:

- ordinary Greatheart interior;
- qualifying Living Heartwood core;
- offered/consented harvest zone;
- damaged core;
- recovering core;
- irreversibly corrupted core.

Normal player building does not place a generic `Living Heartwood Ore` block.

---

# 6. Greatheart Construction Catalogue

Greatheart is the Verdant Covenant's primary heavy structural wood.

## 6.1 Natural Forms

- Greatheart Log;
- Greatheart Wood / full-bark structural block where universal wood taxonomy supports both log and wood forms;
- Stripped Greatheart Log where stripping provides a real construction/art distinction.

## 6.2 Processed Construction Forms

Required:

- Greatheart Planks;
- Greatheart Beam;
- Greatheart Slab;
- Greatheart Stair;
- Greatheart Wall/Fence profile;
- Greatheart Door;
- Greatheart Trapdoor/Hatch;
- Greatheart Support/Post.

Eligible but generated only where universal architecture supports them:

- Greatheart Arch;
- Greatheart Panel;
- Greatheart Railing;
- Greatheart Roof/Shingle form.

## 6.3 Behaviour

Ordinary Greatheart construction is normally inert after conventional processing.

Living behaviour requires a separate preserved-living process or Living Heartwood component. The game must not silently treat every Greatheart plank as self-growing.

---

# 7. Dawnwood Construction Catalogue

Dawnwood is a medium-strength timber with stronger affinity for light, magical routing and upper-canopy architecture.

Required natural forms:

- Dawnwood Log;
- stripped form where supported.

Required construction forms:

- Dawnwood Planks;
- Dawnwood Beam;
- Dawnwood Slab;
- Dawnwood Stair;
- Dawnwood Wall/Fence profile;
- Dawnwood Door;
- Dawnwood Trapdoor/Hatch;
- Dawnwood Support/Post;
- Dawnwood Panel.

Specialist eligible forms:

- Dawnwood Light Frame;
- Dawnwood Conduit Housing;
- Dawnwood Lens Frame.

These specialist forms remain construction/components and do not make Dawnwood itself a light source or magical crystal.

---

# 8. Bloomwood Construction Catalogue

Bloomwood is lighter, flexible and decorative, with strong cultural use in furniture, panels and fine construction.

Required natural forms:

- Bloomwood Log;
- stripped form where supported.

Required construction forms:

- Bloomwood Planks;
- Bloomwood Beam;
- Bloomwood Slab;
- Bloomwood Stair;
- Bloomwood Wall/Fence profile;
- Bloomwood Door;
- Bloomwood Trapdoor/Hatch;
- Bloomwood Panel;
- Bloomwood Railing.

Optional generated forms:

- Bloomwood Lattice Frame;
- Bloomwood Decorative Screen;
- Bloomwood Shingle.

Bloomwood must not automatically inherit Pollen Amber optical properties.

---

# 9. Living Heartwood Construction Catalogue

Living Heartwood is a specialist living structural material rather than an ordinary timber skin.

## 9.1 Item-Side Processed Components

- Living Heartwood Billet;
- Living Heartwood Joinery;
- Living Heartwood Growth Joint;
- Living Heartwood Conduit Core where a living-machine recipe requires it.

## 9.2 Placeable Block Families

Required:

- Living Heartwood Beam;
- Living Heartwood Wall;
- Living Heartwood Arch;
- Living Heartwood Bridge Section;
- Living Heartwood Door;
- Living Heartwood Growth Anchor;
- Living Heartwood Structural Joint;
- Living Heartwood Conduit Housing.

Optional structure-module profile:

- grown-room shell/module;
- living balcony/platform;
- adaptive root footing.

Those large modules may be structure/project outputs rather than ordinary inventory blocks if universal building systems handle them that way.

## 9.3 Living State

Living Heartwood Blocks may carry bounded state such as:

- healthy;
- dormant;
- stressed;
- damaged;
- healing;
- season-attuned;
- blighted;
- corrupted.

They do not continuously simulate per-block biology at distance.

---

# 10. Thornsilver Practical Catalogue

## 10.1 Raw and Processed Items

- Thornsilver Fibre;
- Cleaned Thornsilver Fibre;
- Thornsilver Thread;
- Thornsilver Cord;
- Thornsilver Cloth;
- Tempered Thornsilver Binding;
- Thornsilver Conduit Strand.

Quality/provenance may store:

- source Vine/Weaver relationship;
- tensile grade;
- treatment;
- season;
- health/contamination;
- maker where relevant.

## 10.2 Placeable Families

- Thornsilver Lattice;
- Thornsilver Railing;
- Thornsilver Screen;
- Thornsilver Tension Bridge/Suspension Section;
- Thornsilver Flexible Conduit;
- Thornsilver Binding/Brace for specialist structure composition.

A craft Item such as Thornsilver Cord may transform into a distinct placed line/lattice Block when placed. This is a valid Item-to-Block transformation rather than a duplicate identity.

## 10.3 Equipment Interface

Thornsilver may be used by the universal equipment system for:

- flexible armour layers;
- reinforced clothing;
- bindings;
- bow/string or tension components where compatible;
- tool grips;
- specialised harnesses;
- magical conduit equipment.

FCC-02G does not create a redundant complete "Thornsilver armour set" unless the global equipment reconciliation establishes a unique gameplay role.

---

# 11. Pollen Amber Practical Catalogue

## 11.1 Items

- Pollen Amber Chunk;
- Clarified Pollen Amber;
- Polished Pollen Amber;
- Pollen Amber Lens;
- Pollen Amber Inlay;
- Pollen Amber Dust where a recipe requires a powdered reagent.

## 11.2 Blocks

- Pollen Amber Pane;
- Pollen Amber Signal Window;
- Pollen Amber Inlay Tile;
- Pollen Amber Plate/Panel where physically supported.

Pollen Amber is not a default structural wall material.

## 11.3 State

Relevant item/block state may include:

- source plant;
- season;
- clarity;
- charge;
- clouding;
- inscription/calibration;
- contamination.

---

# 12. Memory Seed Practical Catalogue

## 12.1 Items

- Memory Seed;
- Encoded Memory Seed;
- Memory Seed Capsule;
- Memory Seed Lineage Sample where research/provenance requires it.

The ordinary and encoded forms may be one Item definition with state rather than separate IDs if the final registry supports robust state inspection.

**Preferred implementation:** one `Memory Seed` Item with explicit viability/encoding state, plus one distinct `Memory Seed Capsule` container Item.

## 12.2 Placeable Interfaces

- Memory Seed Planter;
- Memory Growth Anchor;
- Memory Orchard Plot interface;
- Living Blueprint Growth Anchor where structure systems require it.

The seed is not itself a generic solid building block.

## 12.3 Consent / Ownership

Memory encoding that records a living being or protected memory must preserve consent/permission data where required by FCC-02A and FCC-02D.

---

# 13. Bloomstone Practical Catalogue

## 13.1 Items

- Bloomstone Chunk;
- Cleaned Bloomstone;
- Tuned Bloomstone;
- Bloomstone Dust where cleansing/ward recipes require it;
- Bloomstone Stabiliser Core;
- Bloomstone Anchor Component.

## 13.2 Placeable Blocks

- Bloomstone Masonry Block;
- Cut Bloomstone;
- Bloomstone Anchor;
- Bloomstone Ward Node;
- Bloomstone Route Anchor;
- Bloomstone Stabiliser Housing.

Generated slab/stair/wall variants are permitted only for the selected masonry profile.

## 13.3 Season-Charged Bloomstone

Seasonal Crystal references are represented as Bloomstone carrying seasonal charge/state unless FCC-12 later proves a distinct material is required.

No separate `Spring Crystal`, `Summer Crystal`, `Autumn Crystal` and `Winter Crystal` material families are created by default.

---

# 14. Season Sap Practical Catalogue

Season Sap is a fluid/catalyst material, not a generic solid building family.

Canonical item/container products:

- Season Sap Vial;
- Season Sap Flask/Jar where the universal container system supports multiple capacities;
- Refined Season Sap;
- Hardened Seasonal Resin;
- Stabilised Season Sap Dose;
- Mixed-Season Sap sample for rare Seasonal Nexus states.

Canonical functional block interfaces:

- Season Sap Tap;
- Season Sap Reservoir;
- Season Sap Infusion Vat or equivalent station interface;
- living-construction feed interface.

Container sizes should ideally use the universal fluid-container architecture rather than one unique Item ID per vessel size.

Season identity is state data:

- Spring;
- Summer;
- Autumn;
- Winter;
- Mixed/Convergence where valid.

Moon Sap and Dream Sap are not separate materials; they are Season Sap with source/resonance metadata.

---

# 15. River Pearl and Root Amber

## 15.1 River Pearl

Canonical Items:

- River Pearl;
- Selected River Pearl;
- Cut/Polished River Pearl only if jewellery/device systems require a distinct processed form.

Uses:

- jewellery;
- water/route devices;
- ritual components;
- high-value trade goods;
- inlays.

River Pearl is not promoted to a broad construction material.

## 15.2 Root Amber

Root Amber remains a **minor fossilised-root reagent**, not a principal material.

Canonical forms:

- Root Amber Piece;
- Refined Root Amber only where an alchemy/ward recipe needs it.

It does not become a full block family unless FCC-12 later identifies a distinct construction requirement.

---

# 16. Botanical Placeable Catalogue

FCC-02D owns the species biology. FCC-02G defines the practical block/item representations needed for gameplay.

## 16.1 Major Trees

Each major tree family may require worldgen/plant Blocks for:

- sapling/propagule;
- trunk/log;
- branch/wood where generated architecture needs it;
- leaves/canopy;
- fruit/flower node where gameplay-bearing;
- damaged/blighted/corrupted state overlays.

Major tree families:

1. Greatheart Tree;
2. Dawnwood Tree;
3. Bloomwood Tree.

The worldgen implementation may use procedural tree assemblies rather than one Block for every visible branch orientation.

## 16.2 Supporting Flora

Gameplay-bearing placeable plant families:

1. Thornsilver Vine;
2. Spirit Moss;
3. Living Reed;
4. Moonbell;
5. Sunpetal;
6. Nectar Bloom;
7. Seasonfern;
8. Rootcap Fungus;
9. Rotcap Fungus;
10. Wardthorn;
11. Dreamroot;
12. Riverleaf.

Each receives only the growth stages and harvest states required by FCC-02D.

## 16.3 Crops

Canonical cultivated crop plant Blocks and produce Items:

| Crop | Plant Block Family | Harvest Item |
|---|---|---|
| Sunberry | Sunberry Plant | Sunberry |
| Seasonroot | Seasonroot Crop | Seasonroot |
| Goldgrain | Goldgrain Crop | Goldgrain |
| Nectar Bean | Nectar Bean Vine/Plant | Nectar Bean |
| Moonleaf | Moonleaf Crop | Moonleaf |
| River Bulb | River Bulb Crop | River Bulb |

Seeds may be separate Items only where the species does not reasonably replant from the harvested produce itself.

The final agriculture reconciliation should avoid unnecessary `Crop + Seed` duplication when the produce logically serves as planting stock.

## 16.4 Wild Food Items

Canonical wild-food source families may output:

- Dawnfruit;
- seasonal fruit;
- Nectar;
- edible Rootcap produce;
- approved edible Rotcap produce/state;
- edible Living Reed shoots;
- river fish/river-food catch from ambient aquatic ecology;
- Riverleaf edible/culinary portions where valid.

"Wild food family" does not require a new major creature definition for every catch species.

---

# 17. Realm-Native Food and Drink Catalogue

The Verdant Covenant requires enough cuisine to support culture, survival and trade without creating a separate giant food registry.

The following are canonical **recipe/product families**. Final nutritional values and exact universal cooking-station bindings are deferred to FCC-13.

## 17.1 Simple Foods

- Dawnfruit;
- Sunberry;
- Seasonroot;
- Nectar Bean;
- River Bulb;
- edible Rootcap;
- Living Reed Shoot.

## 17.2 Prepared Staples

1. **Goldgrain Bread**  
   Goldgrain-based staple bread/flatbread family.

2. **Seasonroot Stew**  
   Root-based cooked meal whose optional ingredients may vary by settlement/season.

3. **River Bulb Soup**  
   Riverlands staple using River Bulb and compatible herbs.

4. **Rootcap Stew**  
   Fungal meal using safe edible Rootcap material.

5. **Verdant River Meal**  
   River fish/river-food preparation with Riverleaf or Living Reed ingredients.

## 17.3 Preserved / Travel Foods

6. **Sunberry Preserve**  
   Preserved fruit product.

7. **Dawnfruit Preserve**  
   Preserved Dawnfruit product.

8. **Goldgrain Travel Cake**  
   Durable grain/nectar travel food used by mobile settlements and expeditions.

## 17.4 Drinks and Infusions

9. **Moonleaf Tea**  
   Non-alcoholic herbal infusion.

10. **Nectar Infusion**  
    Nectar-based drink/tonic family.

11. **Seasonal Herbal Infusion**  
    Settlement/culture recipe facet combining Seasonfern, Moonbell, Riverleaf or other approved herbs.

These are normal foods/drinks unless a specific recipe intentionally adds a magical or medicinal effect. Merely being from Verdant does not make every meal a potion.

---

# 18. Medicine, Treatment and Restoration Products

FCC-02G locks the following specialist product families:

## 18.1 Verdant Anti-Blight Treatment

Canonical player-facing name:

**Anti-Blight Salve**

It is a crafted treatment family for compatible plants, living construction and biological targets.

Possible ingredients may include:

- Spirit Moss;
- Moonbell;
- Riverleaf;
- refined Season Sap;
- cleansing mineral input;
- other approved universal medicinal bases.

Exact universal base ingredients are resolved in FCC-13.

Anti-Blight Salve does not cure genuine irreversible Void corruption.

## 18.2 Root Restoration Paste

A heavy ecological/structural treatment used on damaged root systems and living construction.

It may consume:

- botanical pulp;
- Season Sap;
- Bloomstone dust/tuned mineral;
- water/fluid base;
- specialist grower labour.

## 18.3 Pollen Filter / Pollen Remedy

A simple protective/medical product family used against heavy-pollen environmental states.

This may be implemented through a universal filter/mask system where available rather than as a redundant Verdant-only equipment architecture.

## 18.4 Cleansing Mixture

Realm-compatible cleansing product using Bloomstone and botanical reagents for **blight** and some early contamination states.

Void corruption rules remain owned by FCC-02I.

---

# 19. Culture and Diplomacy Items

## 19.1 Oath Offering

Canonical family:

**Verdant Oath Offering**

This is not one fixed material object. It is a provenance-aware cultural Item family representing a deliberately prepared gift/offering accepted by Covenant-law interactions.

A valid offering may be created from approved materials such as:

- carved Greatheart/Dawnwood/Bloomwood object;
- Pollen Amber inlay;
- Thornsilver weave;
- cultivated food;
- River Pearl;
- Memory Seed where consent and context permit;
- other culturally valid goods.

The item carries:

- maker/giver provenance;
- intended recipient/party where bound;
- declared purpose where relevant;
- Covenant/oath context if formally registered.

It is not a universal bribe item.

## 19.2 Pact Gift

`Verdant Pact Gift` is a cultural/facet classification applied to valid physical goods rather than a mandatory separate generic Item whenever possible.

## 19.3 Living-Weave Goods

Thornsilver-based clothing, ceremonial textiles, straps, bindings and cultural goods may share universal textile/equipment definitions with a Verdant Living-Weave material/culture facet.

---

# 20. Tools and Equipment Interface

The Verdant Covenant does not require an entirely separate tool progression.

Realm content consumes universal tool families and adds material/interaction specialisations.

Canonical realm-relevant tool families include:

- Pruning and Grafting Tool;
- Sap Tap / Tapping Tool;
- Fibre Harvesting Tool;
- Pollen Filter/Collector;
- Amber Cutting/Polishing Tool interface;
- Bloomstone Extraction/Cleansing Tool interface;
- living-structure Grower/Joinery Tool interface;
- Memory Seed planting/encoding interface.

Where existing universal tools can perform these functions through capability tags, no new duplicate tool Item should be created.

A distinct Verdant tool exists only if its interaction cannot be represented cleanly by the universal tool model.

---

# 21. Creature-Derived Item Policy

FCC-02E owns creature ecology and lawful harvesting.

FCC-02G permits creature-derived Items only where a concrete use exists.

Potential canonical product families include:

- naturally shed Oathstag antler material where ecology permits;
- Thornsilver Weaver fibre/silk contribution where distinct from Vine fibre;
- Riverback-maintained biological materials only if later recipes require them;
- Thornshell shed plate/scute material if sustainable collection is supported;
- Rotgrazer ecological by-product only if a real farming/restoration use exists.

No generic `Monster Claw`, `Monster Essence`, `Verdant Soul`, or mandatory corpse-part catalogue is created.

If no concrete recipe consumes a candidate creature product, the product remains ecological flavour rather than an Item definition.

---

# 22. Processing Station Interfaces

Verdant recipes consume existing universal station classes wherever possible.

## 22.1 Hand / Field Processing

Suitable for:

- plant preparation;
- basic cordage;
- simple food preparation;
- seed handling;
- basic harvesting closure/aftercare.

## 22.2 Workbench / Joinery

Suitable for:

- ordinary wood forms;
- Living Heartwood billets/joinery;
- Covenant Portal frame components;
- tool handles;
- furniture components;
- structural joints.

## 22.3 Sawmill / Wood Processor

Optional higher-throughput path for:

- logs -> planks;
- planks -> beams/panels;
- construction conversions.

It must not be mandatory for the first valid portal unless the Overworld progression already guarantees it.

## 22.4 Fibre / Textile Station

Suitable for:

- Thornsilver Fibre -> Thread;
- Thread -> Cord;
- Thread -> Cloth;
- Cord/Thread -> Lattice/Binding components.

## 22.5 Amber / Fine Craft Station

Suitable for:

- Pollen Amber clarification;
- polishing;
- lenses;
- inlays;
- calibrated optical components.

May consume universal cutting/polishing equipment rather than a unique station Block.

## 22.6 Alchemy / Infusion Station

Suitable for:

- Season Sap refinement;
- anti-blight treatments;
- cleansing mixtures;
- botanical medicine;
- hardened resin processing;
- specialised portal catalyst preparation.

## 22.7 Bloomstone Tuning Interface

Suitable for:

- cleansing;
- grading;
- tuning;
- Stabiliser Core creation;
- route/ward components.

This can be a recipe capability on an existing magic/rune/crafting station rather than a dedicated `Bloomstone Machine` unless the universal station reconciliation proves one is needed.

## 22.8 Living Construction Project Recipe

Large living structures use staged project recipes rather than a one-click craft where appropriate.

Inputs can include:

- Living Heartwood;
- ordinary Verdant timber;
- Thornsilver bindings;
- Season Sap;
- Memory Seed/growth catalyst;
- Bloomstone anchors;
- labour/grower capability;
- blueprint;
- permissions/land status.

---

# 23. Canonical Raw-to-Processed Chains

## 23.1 Greatheart

> Greatheart Tree -> Greatheart Log -> Greatheart Planks / Beam / Panel -> eligible construction Blocks

Special path:

> Qualifying Greatheart Core -> managed/consented harvest -> Living Heartwood -> Billet / Joinery -> Living Heartwood Blocks / advanced components

## 23.2 Dawnwood

> Dawnwood Tree -> Dawnwood Log -> Dawnwood Planks / Beam / Panel -> eligible construction Blocks

## 23.3 Bloomwood

> Bloomwood Tree -> Bloomwood Log -> Bloomwood Planks / Beam / Panel -> eligible construction Blocks

Ecological side path:

> Bloomwood resin + compatible pollen ecology -> Pollen Amber Deposit -> Pollen Amber Chunk -> Clarified/Polished Amber -> Lens/Inlay/Pane

## 23.4 Season Sap

> Approved vegetation/source -> collection/tapping -> Season Sap container -> Refined Season Sap / Hardened Seasonal Resin / recipe catalyst

## 23.5 Thornsilver

> Thornsilver Vine + Weaver symbiosis -> harvest -> Thornsilver Fibre -> cleaning -> Thread -> Cord / Cloth / Binding / Conduit -> eligible equipment or placeable lattice families

## 23.6 Memory Seed

> Eligible plant formation -> Memory Seed -> optional authorised encoding -> Capsule / planting -> growth or living-blueprint use

## 23.7 Bloomstone

> Bloomstone Deposit -> controlled extraction -> Bloomstone Chunk -> cleansing/grading -> Tuned Bloomstone -> Stabiliser Core / Anchor / Ward / selected masonry

## 23.8 Rootstone

> Rootstone -> Cut Rootstone -> Rootstone Bricks -> eligible generated masonry forms

## 23.9 River Pearl

> Aquatic source -> River Pearl -> cleaning/selection -> jewellery / inlay / water-route device component

## 23.10 Root Amber

> fossilised root deposit/source -> Root Amber Piece -> optional refinement -> reagent/component

---

# 24. Recipe Contract Philosophy

Realm-local recipes are divided into:

1. **exact realm recipes** - output identity and required Verdant ingredients are locked here;
2. **universal ingredient-slot recipes** - an Overworld/universal material role is locked here but the final concrete ingredient ID is bound during FCC-01/FCC-13 reconciliation;
3. **generated conversion recipes** - shape conversions emitted from approved material profiles;
4. **project recipes** - staged structures/living construction;
5. **state transformations** - tuning, cleansing, encoding, seasonal charging, restoration.

FCC-02G may not invent a new Overworld material merely to make a Verdant recipe appear exact before FCC-01 exists.

Where an Overworld ingredient is unresolved, the recipe must specify:

- required material class;
- quantity;
- required capability;
- exclusions;
- progression tier;
- whether substitutions are allowed.

FCC-13 later binds that slot to the final canonical Item/Block ID without changing the realm design intent.

---

# 25. Generated Construction Recipe Profiles

## 25.1 Ordinary Wood Profile

Applies to Greatheart, Dawnwood and Bloomwood where eligible.

Typical generated transformations may include:

- Log -> Planks;
- Planks -> Slabs;
- Planks -> Stairs;
- Planks/Logs -> Beams;
- Planks -> Door;
- Planks -> Hatch/Trapdoor;
- Planks/Beams -> Fence/Wall/Railing where eligible;
- Planks -> Panels.

Exact numeric yields are normalised globally in FCC-13 so realm woods do not accidentally use inconsistent ratios.

## 25.2 Rootstone Profile

- Rootstone -> Cut Rootstone;
- Cut Rootstone -> Rootstone Bricks;
- Cut/Brick -> Slab;
- Cut/Brick -> Stair;
- Cut/Brick -> Wall;
- Cut -> Pillar.

## 25.3 Specialist Material Profiles

Living Heartwood, Thornsilver, Pollen Amber and Bloomstone use authored specialist recipes rather than inheriting every ordinary conversion.

---

# 26. Verdant Realm Recipe Registry

The following recipe contracts are canonical for realm-local completeness.

| Code | Recipe / Transformation | Canonical Output |
|---|---|---|
| VRD-R01 | Greatheart Wood Processing | Greatheart construction forms |
| VRD-R02 | Dawnwood Processing | Dawnwood construction forms |
| VRD-R03 | Bloomwood Processing | Bloomwood construction forms |
| VRD-R04 | Living Heartwood Managed Harvest | Living Heartwood |
| VRD-R05 | Living Heartwood Joinery | Living Heartwood Billet / Joinery |
| VRD-R06 | Season Sap Collection | Season Sap container |
| VRD-R07 | Season Sap Refinement | Refined Season Sap |
| VRD-R08 | Seasonal Resin Hardening | Hardened Seasonal Resin |
| VRD-R09 | Thornsilver Fibre Cleaning | Cleaned Thornsilver Fibre |
| VRD-R10 | Thornsilver Spinning | Thornsilver Thread |
| VRD-R11 | Thornsilver Cordage | Thornsilver Cord |
| VRD-R12 | Thornsilver Weaving | Thornsilver Cloth |
| VRD-R13 | Thornsilver Structural Lattice | Thornsilver Lattice Block |
| VRD-R14 | Pollen Amber Clarification | Clarified Pollen Amber |
| VRD-R15 | Pollen Amber Lens | Pollen Amber Lens |
| VRD-R16 | Pollen Amber Glazing | Pollen Amber Pane / Signal Window |
| VRD-R17 | Memory Seed Capsule | Memory Seed Capsule |
| VRD-R18 | Memory Seed Encoding | Encoded state on Memory Seed |
| VRD-R19 | Bloomstone Cleansing | Cleaned Bloomstone |
| VRD-R20 | Bloomstone Tuning | Tuned Bloomstone |
| VRD-R21 | Bloomstone Stabiliser Core | Bloomstone Stabiliser Core |
| VRD-R22 | Bloomstone Anchor | Bloomstone Anchor |
| VRD-R23 | Rootstone Cutting | Cut Rootstone |
| VRD-R24 | Rootstone Masonry | Rootstone Bricks / generated forms |
| VRD-R25 | Anti-Blight Salve | Anti-Blight Salve |
| VRD-R26 | Root Restoration Paste | Root Restoration Paste |
| VRD-R27 | Goldgrain Bread | Goldgrain Bread |
| VRD-R28 | Seasonroot Stew | Seasonroot Stew |
| VRD-R29 | River Bulb Soup | River Bulb Soup |
| VRD-R30 | Rootcap Stew | Rootcap Stew |
| VRD-R31 | Verdant River Meal | Verdant River Meal |
| VRD-R32 | Sunberry Preserve | Sunberry Preserve |
| VRD-R33 | Dawnfruit Preserve | Dawnfruit Preserve |
| VRD-R34 | Goldgrain Travel Cake | Goldgrain Travel Cake |
| VRD-R35 | Moonleaf Tea | Moonleaf Tea |
| VRD-R36 | Nectar Infusion | Nectar Infusion |
| VRD-R37 | Seasonal Herbal Infusion | Seasonal Herbal Infusion |
| VRD-R38 | Covenant Portal Frame | Covenant Portal Frame Block |
| VRD-R39 | Covenant Keystone Socket | Covenant Keystone Socket Block |
| VRD-R40 | Covenant Heart | Covenant Heart Item |
| VRD-R41 | Verdant Growth Catalyst | Verdant Growth Catalyst Item |
| VRD-R42 | Covenant Portal Assembly | Valid Covenant Portal structure state |
| VRD-R43 | Covenant Portal Activation | Active Covenant Portal |
| VRD-R44 | Native Covenant Portal Upgrade | Improved Covenant Portal state |
| VRD-R45 | Living Construction Commission | approved living structure/project output |

This table is a realm-local contract list, not the final global executable recipe database.

---

# 27. Covenant Portal Canon

## 27.1 One Portal Rule

The **Covenant Portal** is the single canonical normal portal type for entry into the Verdant Covenant.

No Dreamroot path, Fae invitation, seasonal gate, Rootway, Court route or hidden crossing may serve as a second ordinary interdimensional entry method.

Those concepts may provide:

- discovery knowledge;
- recipe knowledge;
- a required permission state;
- a keystone ingredient or activation clue;
- a portal location clue;
- portal stabilisation;
- intra-realm transport;
- exceptional authored story behaviour.

## 27.2 Portal Architecture

The Covenant Portal uses a **rooted arch/ring architecture** rather than requiring the universal rectangular silhouette.

Canonical physical components:

1. **Covenant Portal Frame Blocks**;
2. **Covenant Keystone Socket**;
3. **Covenant Heart** installed into the socket;
4. valid enclosed portal aperture recognised by the universal Realm Access system.

The default construction silhouette should read as a broad living arch or oval/ring supported by rooted feet.

The universal portal validator may support rotated/mirrored placement but must not allow arbitrary malformed frames to activate.

## 27.3 Minimum Standard Build

The standard canonical portal blueprint uses:

- **10 Covenant Portal Frame Blocks**;
- **2 Rooted Portal Foot Blocks** or equivalent frame-foot state generated from the same frame family;
- **1 Covenant Keystone Socket** positioned at the crown or designated keystone location;
- **1 Covenant Heart** installed into the socket;
- one valid portal aperture.

Where the universal building implementation can express rooted feet as orientation/state on the frame family, no extra separate Rooted Foot Block definition is required.

**Preferred registry interpretation:** 12 total frame-family pieces, of which two use rooted-foot state, plus one Keystone Socket.

## 27.4 First-Access Requirement

The first Covenant Portal must be reachable **without any material that can only be obtained inside the Verdant Covenant**.

Therefore first-access recipes use:

- final Overworld construction material slots;
- Overworld botanical/fibre slots;
- an Overworld magical-conduction/attunement slot;
- discovered Verdant realm knowledge;
- no Living Heartwood;
- no Season Sap;
- no Bloomstone;
- no Thornsilver;
- no Pollen Amber;
- no Memory Seed;
- no River Pearl.

The exact Overworld Item/Block IDs filling these slots are resolved in FCC-01 and FCC-13.

## 27.5 Covenant Portal Frame Recipe Contract

**Output:** 2 Covenant Portal Frame Blocks per craft.

Required input-role quantities per craft:

- 2 units **approved cut-stone structural material**;
- 1 unit **approved hardwood structural material**;
- 1 unit **approved plant-fibre/vine binding**;
- 1 low-tier **mana-conductive or magical-attunement component**.

Rules:

- all inputs must be obtainable in the Overworld before first realm access;
- material substitutions may be allowed only through explicit compatible tags;
- no input may be a dimension-exclusive material;
- the output is a canonical Block, not a duplicate Item;
- recipe knowledge is locked until the player discovers sufficient Verdant/Covenant portal knowledge.

To build the standard portal, the player needs six crafts for 12 frame-family pieces.

## 27.6 Covenant Keystone Socket Recipe Contract

**Output:** 1 Covenant Keystone Socket Block.

Inputs:

- 2 Covenant Portal Frame Blocks or equivalent component value;
- 1 approved universal precision/metal fitting component;
- 1 approved magical-attunement component.

This is a placeable Block with a component socket/block-entity interface owned by the universal portal system.

It must accept only a valid Covenant Heart or an explicitly migrated successor item.

## 27.7 Covenant Heart Recipe Contract - First Access

**Output:** 1 Covenant Heart Item.

The first-access Covenant Heart is a crafted functional keystone.

Required inputs:

- 1 **Carved Heart Core** component made from approved Overworld hardwood;
- 4 **Botanical Binding** units made from approved Overworld fibre/vine material;
- 2 **Mana-Conductive Inserts** made from approved pre-realm magical material;
- 1 **Attunement Vessel** made from an approved glass/crystal/ceramic universal material;
- 1 **Verdant Resonance Attunement** recipe condition unlocked through realm discovery/knowledge.

`Verdant Resonance Attunement` is a knowledge/ritual condition, not a mined material and not a farmable essence item.

The first-access heart must not require another realm.

## 27.8 First-Access Component Subrecipes

### Carved Heart Core

A simple joinery component made from a valid Overworld hardwood material.

### Botanical Binding

A simple processed binding made from valid Overworld plant fibre/vine material.

### Mana-Conductive Insert

Uses an already-canonical pre-realm magical/conductive material selected during FCC-01/FCC-13 reconciliation.

### Attunement Vessel

Uses an already-canonical heat-stable or magic-compatible vessel material.

No new Overworld material family may be invented solely to fill these slots.

## 27.9 Verdant Growth Catalyst

The first activation consumes one **Verdant Growth Catalyst**.

This is a crafted Item available before first Verdant entry.

Recipe contract:

- 1 universal water/fluid dose;
- 2 approved living botanical ingredients;
- 1 approved fertility/growth reagent;
- 1 small universal mana charge or magical catalyst.

The exact Overworld ingredients are finalised in FCC-01/FCC-13.

The catalyst represents growth activation, not a separate permanent material family.

## 27.10 Portal Assembly Sequence

Canonical first build sequence:

1. learn Covenant Portal construction knowledge;
2. craft the required Covenant Portal Frame Blocks;
3. construct the valid rooted arch/ring blueprint;
4. place the Covenant Keystone Socket in the required keystone location;
5. craft the Covenant Heart;
6. install the Covenant Heart;
7. apply one Verdant Growth Catalyst to the assembled inactive portal;
8. the portal validates the structure and progression conditions;
9. root/leaf/flower growth visually spreads across the frame;
10. the universal Realm Access system opens the portal surface;
11. a valid destination-side Covenant Portal is linked/created/resolved according to universal portal rules.

## 27.11 Failure Behaviour

Invalid assembly must fail safely.

Failure conditions may include:

- incomplete frame;
- invalid keystone position;
- missing Covenant Heart;
- wrong portal core;
- insufficient attunement knowledge;
- obstructed aperture;
- invalid world/location condition where the universal system requires one;
- damaged frame;
- corrupted portal component.

Failure must not silently consume the Covenant Heart.

The Growth Catalyst may remain unconsumed when activation fails validation before the activation transaction commits.

## 27.12 Reuse

Once validly activated, the portal is normally reusable without paying the activation cost per journey.

A portal may require reactivation after:

- dismantling;
- major structural damage;
- deliberate deactivation;
- severe corruption;
- keystone removal;
- save-safe recovery/migration event.

## 27.13 Destination-Side Portal

Return travel still uses Covenant Portal infrastructure.

The universal Realm Access system owns whether first arrival:

- generates a linked destination portal;
- resolves to a protected arrival portal site;
- activates an existing valid portal anchor;
- creates an emergency minimum-return structure.

FCC-02 requires only that the player cannot be trapped by ordinary valid first entry due to absence of a return path.

---

# 28. Native Covenant Portal Upgrade

After the player has access to Verdant materials, the same Covenant Portal may be upgraded without becoming a second portal type.

## 28.1 Upgrade Inputs

Canonical native upgrade package:

- Living Heartwood Joinery;
- Bloomstone Stabiliser Core;
- Refined Season Sap;
- optional Thornsilver Binding;
- existing Covenant Heart and frame.

## 28.2 Upgrade Benefits

Allowed benefits include:

- faster stabilisation/startup;
- better resistance to damage/blight;
- improved destination precision within universal limits;
- improved visual seasonal response;
- lower maintenance;
- improved compatibility with settlement infrastructure;
- safer recovery after partial damage;
- better support for permitted portal configuration options.

It must **not**:

- bypass progression into other realms;
- create free arbitrary teleportation;
- create a second Verdant entry method;
- bypass universal portal linking rules;
- allow arbitrary coordinate targeting unless the universal Realm Access system explicitly supports it.

---

# 29. Portal Knowledge and Discovery

The player must discover enough evidence to unlock the Covenant Portal recipe.

Valid discovery sources may include:

- Overworld ruins with Verdant motifs;
- research/Codex progression;
- NPC testimony;
- recovered portal fragments;
- magical study;
- Seed-deterministic world events;
- an authored Verdant-related site;
- Fae or realm-aware contact;
- legacy Covenant-gate remains.

No single fixed POC location is canon.

The generation/quest system must guarantee at least one reachable knowledge path in every valid world configuration where Verdant access is enabled.

Knowledge acquisition does not itself teleport the player.

---

# 30. Portal Material Inheritance and Art Handoff

The portal must visually read as one coherent multi-material object.

The later art governance system should derive its appearance from its components:

- stone/structural base from the selected frame substrate;
- wood from the selected hardwood or later Living Heartwood upgrade;
- botanical bindings/growth from plant material;
- keystone hardware from its actual fitting material;
- Covenant Heart from its own composite profile;
- portal growth overlay from Verdant botanical identity;
- portal surface/VFX from universal portal + realm-specific Verdant presentation.

The portal must not be painted one arbitrary green colour regardless of its component materials.

---

# 31. Covenant Heart Material Composition and Visual Identity

The Covenant Heart is a **composite Item**.

First-access form should visibly communicate:

- carved structural heart/core;
- botanical bindings;
- magical conductive inserts;
- central attunement vessel;
- dormant-to-active growth response.

Native-upgraded form may incorporate:

- Living Heartwood;
- Bloomstone;
- Season Sap;
- Thornsilver.

The upgrade is a state/variant of the same functional portal-keystone lineage unless a genuinely distinct gameplay identity later requires a separate Item.

---

# 32. Living Construction Recipe Contract

Large living structures defined in FCC-02F must use project recipes rather than arbitrary instant placement when scale or growth state justifies it.

A living-construction recipe may reserve:

- ordinary structural timber;
- Living Heartwood joinery;
- Thornsilver bindings;
- Bloomstone anchors;
- Season Sap catalyst;
- Memory Seed or growth anchor where the structure stores a pattern/blueprint;
- labour/grower capability;
- water/environmental suitability;
- land/threshold permission;
- blueprint.

Project stages may be:

1. foundation/anchor;
2. structural growth;
3. binding/strengthening;
4. utility integration;
5. maturation;
6. commissioning.

Distant simulation may collapse growth to scheduled state transitions rather than per-block growth.

---

# 33. Signature Structure Recipe Interfaces

FCC-02F owns the structures. FCC-02G defines the material recipe direction.

## Arrival Covenant Sanctuary

Expected material families:

- Rootstone;
- ordinary Verdant timber;
- Pollen Amber glazing/inlay;
- Bloomstone stabilisation;
- optional living components.

## Neutral Embassy Grove

Expected material families:

- Greatheart/Dawnwood/Bloomwood according to culture;
- Thornsilver screens/bindings;
- Pollen Amber;
- Rootstone;
- living planting/growth components.

## Oathbough Hall

Expected material families:

- Greatheart structural timber;
- Living Heartwood specialist joints;
- Thornsilver;
- Pollen Amber inscription/recording interfaces;
- Rootstone foundation.

## Seasonal Court

Uses Court/culture-dependent material composition rather than a single universal recipe skin.

## Living Conduit Garden

Expected:

- Living Heartwood conduit components;
- Thornsilver conduit strands;
- Bloomstone anchors;
- Season Sap feed;
- compatible flora.

## Promise Archive

Expected:

- Greatheart/Dawnwood/Bloomwood structure according to culture;
- Pollen Amber optics/inscription;
- Memory Seed storage/growth interface where authorised;
- Thornsilver bindings;
- Bloomstone stabilisation.

## Crowned World-Tree Project

A realm-scale project consuming substantial ecological, political and material resources. It must never be reduced to a single hand-crafting recipe.

---

# 34. Authority and Dungeon Item Boundaries

FCC-02H owns dungeons, guardians and authorities.

FCC-02G reserves item interfaces for:

- outcome proof;
- authority-granted key/permission;
- unique crafted component;
- dungeon-specific functional key where required;
- non-lethal reward packages;
- knowledge unlocks.

The three realm authorities do not need mandatory severed-body-part drops.

Existing resolution-token family concepts are retained as **outcome-proof interfaces**, not necessarily literal glowing tokens in all presentations.

A proof may be:

- document/seal;
- living mark;
- crafted token;
- recognised title/permission state;
- physical relic;
- authority-granted component.

FCC-02H selects the appropriate presentation.

---

# 35. Loot and Provenance Contract

Verdant does not use a generic detached loot table for major materials.

Material acquisition must trace to valid provenance such as:

- natural source;
- cultivated source;
- managed harvest;
- shed/moulted creature product;
- settlement production;
- trade;
- gift;
- salvage;
- dungeon/site container with believable custody;
- authority outcome;
- restoration reward;
- crafted transformation.

Random container generation may award Verdant goods only where the container/site/faction history reasonably explains them.

---

# 36. Renewable and Finite Recipe Economics

Recipes must respect FCC-02C renewal classes.

## Renewable / Cultivable

Examples:

- crops;
- many herbs;
- ordinary managed wood;
- fibre;
- some sap;
- fungi;
- food.

## Conditionally Regenerative

Examples:

- Living Heartwood;
- Bloomstone;
- protected Pollen Amber source ecologies;
- high-value biological resources.

## Limited / Rare

Examples:

- certain Root Amber deposits;
- special River Pearls;
- irreversible corrupted materials;
- unique authority/site items.

Crafting demand must not require destructive volumes of a supposedly stewardship-focused rare resource for basic building.

---

# 37. Season-State Recipe Behaviour

Recipes may inspect Season Sap season-state or environmental season only when it creates meaningful gameplay.

Permitted examples:

- a Spring-charged treatment emphasises growth/restoration;
- Summer charge supports light/energy-intensive Verdant devices;
- Autumn charge supports preservation/harvest-oriented processes;
- Winter charge supports dormancy/stability/preservation;
- mixed Seasonal Nexus charge enables rare cross-season recipes.

This is a design interface, not a requirement that every recipe have four separate versions.

Default construction recipes must remain usable without season micromanagement unless their identity specifically depends on it.

---

# 38. Rot, Blight and Corruption Recipe Boundaries

## 38.1 Natural Rot

Natural Rotwood remains a state/condition of compatible wood unless irreversible material transformation is proven.

Recipes may use naturally weathered/rotted wood where appropriate without creating a new universal material family.

## 38.2 Ecological Blight

Blight may:

- reduce quality;
- block living recipes;
- require cleansing;
- create treatment demand;
- alter salvage yield.

Blight is not automatically Void corruption.

## 38.3 Void Corruption

Severe irreversible corruption may create distinct materials such as **Corrupted Heartwood** only when FCC-02I proves a stable new identity.

FCC-02G must not pre-generate corrupted variants for every Block and Item.

---

# 39. Export and Overworld Recipe Use

Verdant materials are intended to retain utility outside the realm.

Allowed exported uses include:

- ordinary timber construction;
- specialist living construction;
- restoration projects;
- Thornsilver textiles/conduits;
- Pollen Amber optics/inscription;
- Bloomstone stabilisation;
- Season Sap catalysts/medicine;
- Memory Seed living-blueprint/restoration content;
- foods/crops where cultivation conditions are met;
- Covenant Portal infrastructure.

Living or charged materials may require stabilisation/maintenance outside their native environment.

FCC-01 and FCC-13 later bind these uses into the global recipe graph.

---

# 40. Automation and Machine Interfaces

Verdant production may use automation, but automation does not override ecology or provenance.

Permitted automation examples:

- sawmill processing of ordinary logs;
- fibre spinning/weaving;
- controlled sap collection;
- food processing;
- Amber cutting/polishing;
- Bloomstone grading/tuning where machine-compatible;
- storage/sorting;
- living-construction supply logistics.

Automation must not:

- clear-cut Living Heartwood sources without required consent/state;
- bypass protected resource rules;
- turn Memory Seed encoding into unrestricted personal-memory scraping;
- ignore blight/corruption safety;
- create output from unloaded ecosystems without bounded transaction rules.

---

# 41. Forge Integration

The Forge may author Verdant-compatible objects using the locked material catalogue.

Forge validation must know:

- eligible material forms;
- whether a material is living;
- whether it can be structural;
- whether it is transparent/optical;
- whether it is flexible;
- whether it carries season/memory/provenance state;
- whether it can be placed;
- whether a separate Item is allowed;
- whether a recipe is required;
- whether the recipe uses existing registered inputs;
- whether a proposed object duplicates an existing canonical definition.

AI-assisted Forge creation must not invent an unregistered Verdant material merely to satisfy a visual request.

---

# 42. Block Family Snapshot

The following realm-local block families are explicitly accounted for in FCC-02G.

## Terrain / Natural

- Verdant Living Soil;
- Verdant Silt if globally justified;
- Rootstone;
- Worldroot Mass;
- Bloomstone Deposit;
- Pollen Amber Deposit;
- Greatheart natural-tree family;
- Dawnwood natural-tree family;
- Bloomwood natural-tree family;
- supporting flora/fungi plant families;
- six crop plant families.

## Ordinary Construction

- Rootstone construction profile;
- Greatheart construction profile;
- Dawnwood construction profile;
- Bloomwood construction profile.

## Specialist Construction

- Living Heartwood construction profile;
- Thornsilver Lattice/Screen/Railing/Conduit profile;
- Pollen Amber Pane/Signal Window/Inlay profile;
- Bloomstone Masonry/Anchor/Ward/Route profile;
- Memory Growth Anchor/Planter profile;
- Season Sap Tap/Reservoir profile.

## Portal

- Covenant Portal Frame;
- Covenant Keystone Socket;
- active portal surface/state owned by universal Realm Access runtime.

No unlisted material gains a full construction family by implication.

---

# 43. Item Family Snapshot

The following realm-local Item families are explicitly accounted for.

## Principal Resources / Processed Materials

- Living Heartwood;
- Living Heartwood Billet;
- Living Heartwood Joinery;
- Season Sap container state;
- Refined Season Sap;
- Hardened Seasonal Resin;
- Thornsilver Fibre;
- Thornsilver Thread;
- Thornsilver Cord;
- Thornsilver Cloth;
- Thornsilver Binding/Conduit Strand;
- Pollen Amber Chunk;
- Clarified/Polished Pollen Amber;
- Pollen Amber Lens;
- Pollen Amber Inlay;
- Memory Seed;
- Memory Seed Capsule;
- Bloomstone Chunk;
- Cleaned/Tuned Bloomstone;
- Bloomstone Stabiliser Core;
- Bloomstone Anchor Component;
- River Pearl;
- Root Amber Piece.

## Botanical / Food

- six crop produce items;
- Dawnfruit;
- Nectar;
- approved edible fungi/reed products;
- realm food/meal families listed in Section 17.

## Treatment / Culture

- Anti-Blight Salve;
- Root Restoration Paste;
- Pollen protection/remedy product where needed;
- Cleansing Mixture;
- Verdant Oath Offering / Pact Gift facet;
- Living-Weave cultural goods where distinct.

## Portal

- Covenant Heart;
- Verdant Growth Catalyst.

## Outcome Interfaces

- authority/dungeon outcome proof families as handed to FCC-02H.

---

# 44. Retired / Reclassified Practical Content

The following older or possible names must not silently return as duplicate physical content:

| Legacy / Candidate Term | FCC-02G Treatment |
|---|---|
| Fae Seed | generic/category term; use actual species seeds or Memory Seed where appropriate |
| Moon Sap | Season Sap state/source profile |
| Dream Sap | Season Sap state/source profile |
| Seasonal Resin | Hardened Seasonal Resin processed from Season Sap |
| Seasonal Crystal | season-charged Bloomstone by default |
| Glamour Crystal | retired as Verdant major material; use Pollen Amber or later globally justified crystal |
| Oath-thread | crafted ritual product/facet using Thornsilver, not raw material |
| Rotwood | wood condition/state, not automatic new base material |
| Covenant Heart Ore | prohibited concept |
| Generic Verdant Essence | prohibited unless a future explicit system proves need |
| Living Heartwood Item + duplicate Living Heartwood Block Item | prohibited duplication |

---

# 45. Cross-Document Ownership Matrix

| Content | Primary Owner | FCC-02G Role |
|---|---|---|
| Realm laws/progression | FCC-02A | consume |
| Biomes/hazards | FCC-02B | consume source/suitability |
| Material identity/provenance | FCC-02C | implement practical forms |
| Flora/crops/foods ecology | FCC-02D | implement Blocks/Items/recipes |
| Creatures/material sources | FCC-02E | implement justified item outputs |
| Civilisations/structures | FCC-02F | provide construction recipe interfaces |
| Blocks/items/processing/portal | FCC-02G | **owns realm-local practical catalogue** |
| Dungeons/guardians/authorities | FCC-02H | receives item/reward interfaces |
| Corruption/restoration | FCC-02I | receives transformation interfaces |
| Final registry/art handoff | FCC-02J | normalises/exports |
| Global material reconciliation | FCC-12 | reconciles across realms |
| Final Block/Item/Recipe canon | FCC-13 | binds global IDs/quantities/recipe execution |
| Art certification | FCC-14 + art governance | consumes material/composition data |

---

# 46. Data Requirements

Every final Verdant Block or Item record should be capable of carrying the following where relevant:

- canonical ID;
- display name;
- family ID;
- domain type;
- source material/profile IDs;
- provenance class;
- biome/source tags;
- renewable/regenerative class;
- shape eligibility;
- placement profile;
- state schema;
- season state;
- health/living state;
- consent/permission state where necessary;
- memory/encoding state where necessary;
- corruption/blight state;
- recipe references;
- drop/transform references;
- salvage profile;
- station capability;
- culture facet;
- export compatibility;
- art material composition;
- migration aliases;
- performance/LOD behaviour.

State should be stored only where gameplay requires it. Do not attach expensive dynamic fields to ordinary inert planks merely because other Verdant objects are living.

---

# 47. Performance and Scalability Rules

FCC-02G must remain feasible on low-end systems.

## 47.1 No Per-Block Living Simulation Everywhere

Living block health/growth is simulated:

- locally when active;
- through scheduled regional transactions when distant;
- through settlement/project summaries where appropriate.

## 47.2 Recipe Automation LOD

Unloaded production may resolve through bounded batch transactions instead of simulating every item transfer.

## 47.3 Portal Cost

Portal activation uses discrete validation and transition events rather than constant high-frequency simulation of every frame block.

## 47.4 Variant Data

Season, quality and provenance variants should reuse shared assets/material profiles where possible instead of creating a unique mesh/texture for every state combination.

---

# 48. Validation Requirements

## 48.1 Block/Item Validation

- no duplicated canonical Block + Item identities;
- every placeable family has valid placement/collision inheritance;
- every distinct Item has a reason not to be represented as a Block form;
- harvest transformations are explicit.

## 48.2 Material Validation

- every product resolves to FCC-02C material identity;
- no retired material returns under a new label;
- no material receives impossible forms.

## 48.3 Ecology Validation

- resource harvest does not contradict FCC-02D/FCC-02E ecology;
- Living Heartwood obeys managed harvest conditions;
- Bloomstone regeneration is not bypassed by recipe logic;
- Thornsilver source respects the Vine/Weaver relationship.

## 48.4 Recipe Reachability

- first Covenant Portal is constructible before Verdant entry;
- no recipe requires its own output as an unmet prerequisite;
- no first-access path requires another dimension;
- universal stations required before first access are reachable in Overworld progression;
- substitutions cannot accidentally bypass intended progression.

## 48.5 Portal Validation

- one canonical normal Verdant portal type;
- invalid portals fail safely;
- valid first entry guarantees a recoverable return path;
- Covenant Heart is not consumed on pre-commit validation failure;
- portal state survives save/load/migration through universal Realm Access ownership;
- portal upgrades remain Covenant Portal upgrades, not separate access types.

## 48.6 Art-Handoff Validation

- composite objects list constituent material families;
- generated forms inherit source-material appearance;
- no arbitrary placeholder colour becomes canon;
- living state, season, wear, blight and corruption are overlays/state modifiers rather than random recolours.

---

# 49. Realm-Local Completeness Check

FCC-02G accounts for the Verdant Covenant's practical content obligations in the following areas:

| Area | Status |
|---|---|
| Terrain blocks | Accounted for |
| Ordinary native stone forms | Accounted for |
| Three timber construction families | Accounted for |
| Living Heartwood specialist forms | Accounted for |
| Thornsilver item + placeable families | Accounted for |
| Pollen Amber item + glazing families | Accounted for |
| Memory Seed practical forms | Accounted for |
| Bloomstone practical forms | Accounted for |
| Season Sap container/processing forms | Accounted for |
| River Pearl / Root Amber | Accounted for |
| 12 supporting flora practical forms | Accounted for |
| 6 crop block/item families | Accounted for |
| Wild food families | Accounted for |
| Named realm food/meal foundations | Accounted for |
| Medicines/restoration products | Accounted for |
| Culture/diplomacy goods | Accounted for |
| Realm-relevant tool interfaces | Accounted for |
| Creature-product policy | Accounted for |
| Processing station interfaces | Accounted for |
| Major raw-to-processed chains | Accounted for |
| Realm recipe contracts | Accounted for |
| Covenant Portal architecture | Accounted for |
| First-access Covenant Heart | Accounted for |
| First activation catalyst | Accounted for |
| Native portal upgrade | Accounted for |
| Living construction recipe interface | Accounted for |
| Signature structure material interfaces | Accounted for |
| Dungeon/authority item handoff | Accounted for |
| Provenance/loot rules | Accounted for |
| Export/automation/Forge interfaces | Accounted for |
| Performance and validation | Accounted for |

---

# 50. Known Global-Reconciliation Bindings

The following details are intentionally deferred because their owners have not yet been globally finalised:

1. the exact Overworld material IDs filling the first-access Covenant Portal frame recipe slots;
2. the exact Overworld material IDs filling Covenant Heart subcomponent slots;
3. the exact Overworld ingredients of Verdant Growth Catalyst;
4. final universal numeric ratios for generated slab/stair/wall conversions;
5. final universal food nutrition values;
6. final universal station IDs where several existing stations can satisfy the same capability;
7. final stable IDs and migration aliases;
8. final exact recipe times, fuel/power costs and labour quantities;
9. cross-realm substitutions unlocked after later realms;
10. final art/material profile IDs.

These are **bindings**, not unresolved Verdant concepts.

FCC-02G already defines what each slot must do, how many of each role the portal requires, and what progression constraints apply.

FCC-01/FCC-12/FCC-13 may bind those slots but must not silently redesign the Covenant Portal without an explicit canon amendment.

---

# 51. Source Supersession and Clarification Notes

FCC-02G supersedes or narrows older Verdant practical-content assumptions where they conflict with the later FCC decisions.

Key clarifications:

- six original Atlas Verdant resource families remain principal specialist resources, but they are no longer the complete practical material catalogue;
- Greatheart, Dawnwood, Bloomwood and Rootstone provide ordinary construction foundations;
- no native Verdant metal is added;
- old multiple realm-access methods are not separate normal access routes;
- the Covenant Portal is the one normal interdimensional entry portal;
- the Covenant Heart is a crafted portal keystone, not a natural resource;
- first Verdant access cannot require Verdant-native materials;
- later native materials can upgrade the existing Covenant Portal;
- block-form inventory projections replace duplicate block Items;
- generated shape eligibility replaces universal material x shape multiplication;
- generic loot is replaced by provenance-aware acquisition;
- Living Heartwood, Bloomstone and other regenerative resources retain ecological constraints even when automated;
- food and cultural products are bounded and mechanically justified rather than exhaustive cuisine simulation.

---

# 52. Forward Interfaces

## To FCC-02H - Dungeons, Guardians, Authorities & Adventure Content

Provide:

- material availability;
- dungeon block/component eligibility;
- guardian/authority outcome-proof item interfaces;
- portal progression interfaces;
- treatment/cleansing items;
- expedition food/supply items;
- provenance rules.

## To FCC-02I - Corruption, Blight, Restoration, Events & Cross-Realm States

Provide:

- clean material/item baselines;
- treatment products;
- block/item state schemas;
- irreversible transformation thresholds requiring new definitions;
- portal corruption/damage interfaces.

## To FCC-02J - Final Realm Registry & Art Handoff

Provide:

- canonical practical Block families;
- canonical Item families;
- recipe-contract list;
- composite-object material composition;
- portal component registry;
- retired-term register;
- unresolved global binding list.

## To FCC-01 / FCC-12 / FCC-13

Require:

- Overworld first-access ingredient bindings;
- universal material duplicate reconciliation;
- final global Block/Item identity check;
- final executable recipe quantities/IDs/station bindings;
- cross-realm substitution and progression checks.

## To Material, Colour & Texture Style Governance

Provide:

- source material family for every derived object;
- composite material lists for portal/components;
- living/season/blight/corruption state requirements;
- optical/flexible/structural behaviour classifications;
- generated-shape inheritance requirements.

---

# 53. Canonical Snapshot

## Canonical Portal

**Covenant Portal**

Components:

- Covenant Portal Frame;
- Covenant Keystone Socket;
- Covenant Heart;
- Verdant Growth Catalyst for first activation;
- universal portal surface/runtime.

First access uses Overworld-only material slots.

Native upgrade uses:

- Living Heartwood Joinery;
- Bloomstone Stabiliser Core;
- Refined Season Sap;
- optional Thornsilver Binding.

## Canonical Ordinary Construction Materials

- Rootstone;
- Greatheart Wood;
- Dawnwood;
- Bloomwood.

## Canonical Principal Specialist Resources

- Living Heartwood;
- Season Sap;
- Thornsilver Fibre;
- Pollen Amber;
- Memory Seed;
- Bloomstone.

## Canonical Minor Materials

- River Pearl;
- Root Amber.

## Canonical Key Processed Components

- Living Heartwood Billet;
- Living Heartwood Joinery;
- Thornsilver Thread;
- Thornsilver Cord;
- Thornsilver Cloth;
- Thornsilver Binding;
- Pollen Amber Lens;
- Memory Seed Capsule;
- Tuned Bloomstone;
- Bloomstone Stabiliser Core;
- Hardened Seasonal Resin;
- Anti-Blight Salve;
- Root Restoration Paste;
- Covenant Heart.

## Canonical Cultivated Crops

- Sunberry;
- Seasonroot;
- Goldgrain;
- Nectar Bean;
- Moonleaf;
- River Bulb.

## Canonical Prepared Food Foundations

- Goldgrain Bread;
- Seasonroot Stew;
- River Bulb Soup;
- Rootcap Stew;
- Verdant River Meal;
- Sunberry Preserve;
- Dawnfruit Preserve;
- Goldgrain Travel Cake;
- Moonleaf Tea;
- Nectar Infusion;
- Seasonal Herbal Infusion.

---

# 54. Acceptance Gate for FCC-02G

FCC-02G is realm-locally accepted when all of the following remain true:

- no duplicate Block/Item identity exists;
- every major Verdant material has a practical use chain;
- ordinary construction does not depend on rare living resources;
- specialist materials receive only physically justified forms;
- all six crops have a plant and harvest representation;
- the realm has a bounded food/medicine catalogue;
- creature-derived items are purpose-driven rather than generic drops;
- the six principal Atlas resource chains remain represented;
- Covenant Heart is a crafted functional component;
- the Covenant Portal is the sole normal Verdant entry portal;
- first access is achievable using only pre-Verdant/Overworld ingredients plus knowledge;
- portal construction has a defined frame, socket, heart, activation catalyst and build sequence;
- native Verdant materials improve the same portal rather than creating another portal type;
- no unresolved Overworld ingredient slot is mistaken for permission to invent a new material;
- later FCC-13 can bind exact global IDs without redesigning the realm;
- all practical content exposes sufficient provenance and material inheritance data for final art governance.

**FCC-02G Status:** **CONTENT CANON - REALM LOCAL LOCK**  
**Global Status:** Pending FCC-01/FCC-12/FCC-13/FCC-14 reconciliation.

---

# 55. Next Document

The next FCC-02 document is:

## **FCC-02H - Verdant Covenant Dungeons, Guardians, Authorities, Adventure Sites & Resolution Content**

FCC-02H will consume the practical material/item/recipe package defined here and finalise the five locked dungeon families, five guardian families, three realm authorities, adventure-site content, encounter outcomes, reward provenance, dungeon-state variation, regional threats, and non-combat resolution paths.
