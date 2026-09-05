# Leyforge Final Content Canon Collection

## FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding
### Step 1C — Canonical Content Binding Matrix

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** Source-Reconciliation Working Document — Minimum Authoritative Registry Demand Extracted; Final IDs/Recipes Not Yet Locked  
**Predecessors:** FCC-13 Step 1A; FCC-13 Step 1B  
**Primary Sources:** Locked FCC-01; locked FCC-02/03/04/05/06/08 realm FCCs; locked FCC-12A–D; established universal Leyforge tool/logistics direction.

---

# 1. Purpose

Step 1B asked:

> **What does each old POC registry row become?**

Step 1C deliberately reverses the direction:

> **What does the current locked Leyforge canon require the definitive registry to represent, whether or not the old POC ever contained it?**

This prevents the old 312-row prototype from becoming a hidden scope limit.

Step 1C extracts a **minimum authoritative binding demand**.

It identifies content that the FCC-13 architecture must be able to bind as:

- exact material/resource identities;
- standard generated/inherited forms;
- placeable/world projections;
- true portable Items;
- manufactured components;
- biological/crop content;
- functional assemblies;
- portal families;
- portal keystone/core components;
- provider roles;
- states/facies rather than duplicate content rows.

This is not yet the final registry.

It does not assign final:

- stable IDs;
- numeric IDs;
- namespaces;
- exact Block/Object classes;
- exact inventory representation;
- recipe quantities except where inherited source contracts already state them;
- final portal recipes;
- final provider tags;
- balance values.

---

# 2. Critical Binding Principle

A requirement can be canonical without requiring a separately authored row.

Examples:

- `Basalt Slab` may be a deterministic generated material+form binding;
- `charged Bloomstone` should normally be Bloomstone + state rather than a second material;
- `Cave Mushroom` growing in the world versus harvested food may require two lifecycle objects despite shared biological identity;
- a portal stabilisation layer may be a structure capability rather than one magic inventory Item.

Therefore Step 1C classifies **what must be representable**, not simply what must become one JSON record.

---

# 3. Demand Classes

## 3.1 Exact Material / Resource

Requires stable semantic material/resource identity.

## 3.2 Standard Form Family

Requires reusable form semantics and deterministic binding where the material is eligible.

## 3.3 Source / World Projection

Requires a world representation of material/resource without duplicating the underlying material.

## 3.4 True Item / Product

Requires a portable identity because it is physically/functionally distinct.

## 3.5 Component

Requires a manufactured object/component identity, preserving source materials.

## 3.6 Biological / Crop Identity

Requires stable species/crop identity, with seeds/harvest/products bound separately where needed.

## 3.7 Functional Placeable / Assembly

Requires installed physical content but may use object/multiblock/structure representation rather than voxel Block.

## 3.8 Portal Family

Requires one stable canonical Realm Access identity.

## 3.9 Portal Role

Requires exact material/provider/component semantics in the eventual recipe even where exact recipe composition remains deferred.

## 3.10 State / Facies

Must be representable without becoming an unnecessary base-material duplicate.

---

# 4. Minimum Demand Snapshot

- **Extracted binding-demand entries:** 407
- **Exact-name matches already present in the 312-row POC registry:** 17
- **Demand entries with no exact-name match in the old POC:** 390

The exact-name comparison is intentionally conservative. A POC row with the same words is still subject to Step 1B migration/rebinding; a missing exact name does not imply the concept is technically difficult, only that the old registry never directly represented it.

## Demand by Scope
- **Ancestral Veil: 36 entries**
- **Ascendant Reach: 51 entries**
- **Ashen Lower Realms: 45 entries**
- **Impossible Deep: 38 entries**
- **Overworld: 86 entries**
- **Somnolent Expanse: 57 entries**
- **Universal: 24 entries**
- **Universal Systems: 19 entries**
- **Verdant Covenant: 51 entries**

---

# 5. Registry Architecture Demand

FCC-13 must be capable of expressing all of the following without semantic collapse:

- underlying material;
- physical form;
- world/placeable projection;
- inventory projection;
- state;
- facies;
- provenance;
- quality/grade/purity;
- charge/attunement;
- exact component identity;
- material composition of a component;
- provider/capability roles;
- recipe input mode: exact vs provider;
- process capability;
- environment/support requirement;
- portal family;
- portal component/role;
- stable migration aliases;
- runtime instance state.

A single technical database may store several of these, but the semantic distinctions are mandatory.

---

# 6. Universal Generated-Form Demand

FCC-12 means the final registry must not manually author every material × shape combination as unrelated content.

The common form system must support eligible materials through reusable templates such as:

- chunk/lump;
- powder/dust;
- shard;
- slab;
- stair;
- wall;
- pillar;
- brick/masonry;
- plank/board;
- beam/post/pole;
- rod/bar;
- plate/sheet/foil;
- wire;
- ingot/billet/bloom;
- cord/rope/thread/yarn/cloth;
- pane/lens/inlay.

A stable runtime/content reference may still be emitted for save/network/placement purposes.

The binding architecture should therefore answer:

> **Can material M support form F, and if so what deterministic content identity represents M+F?**

rather than forcing authors to duplicate the entire material definition.

---

# 7. Overworld Minimum Binding Demand

The Overworld remains the largest general-purpose material/content source.

## 7.1 Material/Resource Definitions

FCC-13 must be able to bind the final Overworld material/resource portfolio already reconciled by FCC-12, including:

### Soils
- Loam
- Clay Soil
- Sandy Soil
- Silt Soil
- Peat Soil
- Chalk Soil
- Volcanic Ash Soil
- Saline Soil

### Principal Stones
- Granite
- Limestone
- Sandstone
- Slate
- Shale
- Basalt
- Marble
- Gneiss
- Quartzite

### Specialist Mineral / Glass / Crystal
- White Kaolin
- Clear Quartz
- Obsidian
- Raw Mana Crystal
- Ley Crystal
- Thunder Glass
- Frost Pearl
- Sunstone

### Timber / Botanical Materials
- Oak Heartwood
- Ironbark
- Whitepine
- Blackwood
- Beech
- Redbark
- Maple
- Spruce
- Larch
- Birch
- Acacia
- Cypress
- Willowreed
- Sunflax Fibre
- Mirehemp Fibre
- Resin Amber
- Pitch Sap
- Corkbark
- Dye Lichen
- Alchemical Moss

### Metals / Alloys
- Copper
- Tin
- Bronze
- Iron
- Steel
- Lead
- Nickel
- Cobalt
- Silver
- Gold
- Star Iron
- Mythril

### Ordinary Gems
- Garnet
- Sapphire
- Ruby
- Emerald
- Opal
- Diamond

### Fuels / Reagents / Provenance-Bound Resources
- Firewood
- Charcoal
- Coal
- Peat Fuel
- Oil Shale
- Lamp Oil
- Sulphur
- Saltpetre
- Ancient Machine Scrap
- Titan Bone

## 7.2 Principal Food Crops

The seven locked principal Overworld food crops require stable biological identities:

1. Hearthgrain
2. Frostbarley
3. Sunmaize
4. Marsh Rice
5. Stonebean
6. Deepcap Mushroom
7. Sweetroot

The final-pass FCC-01D amendments also retain named specialist botanical content including:

- Redleaf Herb
- Silvermint
- Bitterbloom
- Sunflax
- Mirehemp
- Willowreed
- Lamp-Oil Seed

FCC-13 owns exact seed, harvest, processed-food and recipe bindings.

## 7.3 Important Boundary

The old POC's generic `Basic Crop`, `Wheat`, `Cave Mushroom`, generic `Stone`, generic `Plant Fibre` and similar placeholders may not override this locked current portfolio.

---

# 8. Verdant Covenant Binding Demand

Realm sources explicitly require the following material/resource identities:

- Living Heartwood
- Season Sap
- Thornsilver Fibre
- Pollen Amber
- Memory Seed
- Bloomstone
- Greatheart Wood
- Dawnwood
- Bloomwood
- Rootstone
- Verdant Living Soil
- River Pearl
- Root Amber
- Seasonal Resin

The realm-local processing catalogue additionally requires representability for forms/products such as:

- Greatheart/Dawnwood/Bloomwood logs, planks, beams and panels;
- Living Heartwood Billet/Joinery;
- Refined Season Sap;
- Thornsilver Thread/Cord/Cloth/Lattice;
- Clarified Pollen Amber;
- Pollen Amber Lens/Pane;
- Memory Seed Capsule;
- Tuned Bloomstone;
- Bloomstone Stabiliser Core;
- Bloomstone Anchor;
- Cut Rootstone;
- Rootstone Bricks and eligible masonry forms.

These are not permission to create duplicate material definitions.

---

# 9. Ancestral Veil Binding Demand

Required exact material/resource identities:

- Memory Stone
- Veil Soil
- Spirit Clay
- Ancestor Ash
- Memory Glass
- Oathbone
- Veil Silk
- Grave Salt
- Echo Pearl
- Soul Silver
- Soulwood

Realm-local output eligibility includes:

- Cut Memory Stone;
- Memory Stone Brick;
- Spirit Clay Brick/Tile;
- Memory Glass Pane/Lens/Plate;
- Oathbone seals/fittings;
- Veil Silk Thread/Cloth;
- Grave Salt mixtures;
- Echo Pearl calibrated/polished components;
- Soul Silver Ingot/Plate/Wire;
- Soulwood planks/beams/panels/joinery;
- Ancestor Ash mortar/ink/cleansing mixtures.

The source explicitly states that this is an eligibility/transformation registry, **not** a requirement that every phrase become a standalone Item.

---

# 10. Somnolent Expanse Binding Demand

Required canonical matter/content includes:

- Dreamstone
- Dream Sand
- Dream Soil
- Dreamwater
- Reverie Wood
- Waking Stone
- Dream Mote
- Nightmare Resin
- Lucid Glass
- Sleepbloom
- Memory Thread
- Prophecy Ink
- Nightmare Sap
- Omen Dust
- Time-Seed
- Inspiration Resin
- Fear Chitin
- Road Chalk

The block-family snapshot requires representability for:

- Dreamstone masonry/shape forms;
- Reverie timber construction forms;
- Waking Stone foundation/machinery forms;
- Lucid Glass panes/plates/inlays;
- Memory Thread screen/membrane forms;
- Lucid Beacon assemblies;
- Memory Loom;
- Nightmare Ward;
- Coherence Core Housing / Coherence Anchor;
- Dreamgate assemblies after global binding.

True portable item families include:

- Hardened Nightmare Resin;
- Nightmare Resin Coating/Sealant;
- Lucid Glass optical components;
- Memory Thread Spool/Cloth/Binding;
- Encoded Memory Textile;
- Coherence Core;
- calibrated Dream Mote container/charge representations;
- calibrated Lucid Glass components.

Legacy Dream Glass must resolve through Lucid Glass.

---

# 11. Ascendant Reach Binding Demand

Required canonical materials/resources include:

- Cloudstone
- Skyiron
- Stormglass
- Windspun Fibre
- Lightning Core
- Sunmist
- Aether Gas
- Hymnstone
- Celestial Metal
- Storm Metal
- Concord Metal
- Halo Glass
- Judgement Crystal
- Grace Thread
- Blessing Salt
- Covenant Wax
- Lightning Essence
- Thunder Pearl
- Saint Steel

Realm-local forms/components include:

- Cloudstone masonry/structural forms;
- Skywood construction content where admitted by the realm;
- Stormglass block/pane/lens/plate forms;
- Hymnstone panel/pillar/resonator/inscribed plate;
- Skyiron ingot/plate/rod/wire/fittings;
- Celestial Metal processed forms;
- Windspun thread/rope/cloth/sailcloth;
- Grace Thread products.

**Skywood note:** FCC-05G explicitly requires Skywood content forms while also rejecting a generic `Divine Wood` material family. Final material binding must preserve that source distinction rather than inventing a new divine-tier wood merely for convenience.

---

# 12. Impossible Deep Binding Demand

Required canonical material/resource identities:

- Pressure Stone
- Bone Stone
- Emberbone
- Abyssal Iron
- Seismic Crystal
- Pressure Pearl
- Black Brine Salt
- Ventglass
- Deepfire Ember
- Pressure Resin
- Gravity Nodule
- Pressure Oils
- Resonance Wood
- Fossil Alloys

Required component/product families include:

- Abyssal Iron ore/concentrate;
- Seismic Crystal Shard;
- Ventglass component forms;
- Pressure Pearl components;
- Pressure Resin seals;
- Black Brine Salt reagents;
- Gravity Nodule components;
- Deepfire containment components;
- resonators;
- seismic sensor components;
- gravity/orientation components;
- pressure-seal components;
- Spatial Catalyst.

Canonical crops/food producers include:

- Quake Fruit
- Pressure Bulb
- Deepcap
- Brine Reed
- Ember Bean

`Deepstone` must not reappear as the realm's principal geology.

---

# 13. Ashen Lower Realms Binding Demand

Required canonical material/resource identities:

- Basalt — shared universal identity
- Infernal Ash
- Ember Iron
- Contract Iron
- Chain Metal
- Infernal Alloy
- Ember Salt
- Cooling Crystal
- Hunger Crystal
- Hellglass
- Ash Glass
- Sootglass
- Cinderhide
- Cinder Pearl
- Cinderwood
- Heat Gas
- Black Ember
- Cold Fire
- Furnace Heart
- Ash Brick

Required forms/components include:

- Basalt masonry forms;
- compacted Infernal Ash;
- Ember Iron ore/ingot forms;
- Contract Iron products;
- Chain Metal billets/ingots;
- Hellglass forms;
- Cooling/Hunger Crystal components;
- processed Cinderhide;
- Cinder Pearl components;
- Black Ember containment;
- Cold Fire containment;
- Cinderwood planks/beams.

Legacy `Infernal Brick` migrates into Ash Brick.

---

# 14. Universal Tool and Automation Demand

Separate from POC inheritance, Leyforge's established systems require registry/content architecture capable of representing tool families including:

- Wrench
- Hammer
- Rune Chisel
- Rune Tuner
- Prospecting Tool
- Survey Lens

and logistics/power/automation archetypes including:

- Item Chute
- Conveyor Belt
- Item Pipe
- Fluid Pipe
- Pump
- Splitter
- Sorter/Filter
- Merger
- Water Wheel
- Windmill
- Manual Crank
- Fuel Engine
- Mechanical Miner

Step 1B showed old POC rows for several of these, but Step 1C records them because modern project architecture requires the concepts—not because the prototype happened to contain them.

Exact machine variants and recipes remain downstream.

---

# 15. Portal Binding Demand — Six Families

Exactly six portal families require definitive FCC-13D binding.

## 15.1 Covenant Portal

Realm-local source already specifies unusually detailed component architecture:

- Covenant Portal Frame;
- Covenant Keystone Socket;
- Covenant Heart;
- Carved Heart Core;
- Botanical Binding;
- Mana-Conductive Insert;
- Attunement Vessel;
- Verdant Growth Catalyst.

FCC-02G also states a standard build and local recipe contracts.

Those details are source constraints that FCC-13 must reconcile globally rather than casually discard.

## 15.2 Veilgate

Locked realm-local ingredient roles:

- Memory Stone frame/foundation;
- Memory Glass threshold/interface;
- Soul Silver fittings;
- Echo Pearl keystone/core role;
- Grave Salt stabilisation;
- recognition/inscription activation layer.

Whether Echo Pearl is used directly or becomes a crafted core remains explicitly deferred.

## 15.3 Dreamgate

Locked component-role pool:

- Lucid Glass;
- Dream Mote;
- Coherence Core/coherence technology;
- Waking Stone;
- Memory Thread;
- imported universal components as required.

The source intentionally does **not** require every pool member in the final recipe.

## 15.4 Ascension Gate

Locked architecture:

- structural frame/foundation;
- conductive/stabilising fittings;
- Ascension Keystone;
- vertical/aetheric attunement layer;
- activation interface;
- validated destination link.

Ascension Keystone is a canonical crafted component.

## 15.5 Deepgate

Locked architecture:

- structural frame;
- anchoring/stabilisation layer;
- Deep Keystone;
- pressure/depth attunement;
- activation interface;
- destination binding.

Deep Keystone is canonical.

## 15.6 Ashgate

Locked architecture:

- reinforced structural frame;
- thermal stabilisation;
- Ash Keystone;
- realm/depth attunement;
- activation interface;
- destination binding.

Ash Keystone is canonical.

---

# 16. Portal Asymmetry Finding

The six source FCCs are semantically compatible but not equally specific.

The **Covenant Portal** already has:

- a standard construction silhouette/assembly count;
- frame-family quantity guidance;
- explicit frame recipe-role quantities;
- explicit Covenant Heart subcomponents;
- a realm-local recipe registry.

The other five generally lock:

- portal identity;
- architecture roles;
- native material/component pools;
- keystone concepts where applicable;
- first-access exclusions;

while intentionally deferring exact quantities and final recipes.

This is **not a contradiction**.

It becomes a Step 1D reconciliation requirement:

> FCC-13 must decide which Covenant details remain authoritative exact bindings and which details are normalised through the final six-portal recipe framework without violating FCC-02's locked realm-local intent.

---

# 17. First-Access Portal Reachability Demand

All six portals must satisfy one common global rule:

> **The first constructible portal cannot require a material obtainable only after first entering that same realm unless another legitimate pre-entry source is explicitly authored.**

The realm sources state this directly for Covenant Portal, Ascension Gate, Deepgate and Ashgate and preserve global deferral for Veilgate/Dreamgate.

Therefore Step 1D must construct a dependency graph before final recipes are locked.

---

# 18. What Does NOT Belong in the Block/Item Registry as a Simple Row

Current FCCs also define enormous portfolios of:

- biomes;
- settlements;
- cultures;
- governments;
- dungeons;
- sites;
- bosses;
- authorities;
- events;
- regional states;
- hazards.

Those require stable content identities in their owning systems but are **not automatically Block/Item rows**.

FCC-13 only binds their physical content when needed, such as:

- a blueprint;
- structure component;
- loot/resource;
- machine;
- portal;
- placeable apparatus;
- harvested product.

This prevents the definitive Block/Item registry from becoming a duplicate of every content registry in the game.

---

# 19. Structure Archetype Versus Physical Component

Examples such as:

- Namebridge Sanctuary;
- Hall of Remembered Doors;
- Quiet Market;
- Luminous Market;
- Worldroot Bastion;
- Furnace-Crown Works

are structure/blueprint/service identities.

FCC-13 may need to bind their:

- construction components;
- functional apparatus;
- materials;
- machine blocks;
- blueprint references.

It does not need to make each entire structure one inventory Item or one magic Block.

---

# 20. Biological Identity Versus Harvested Product

Step 1C preserves the distinction between:

- living plant/organism content;
- harvested material;
- seed/propagation object;
- food product;
- processed reagent.

This is important for examples such as:

- Cave Mushroom / Deepcap;
- Willowreed;
- Greatheart trees;
- Reverie trees;
- Ashen producers;
- realm crops.

The registry architecture must be able to relate these without assuming one row does everything.

---

# 21. State Rows That Must NOT Become Duplicate Base Materials

The definitive registry must represent, without unnecessary material duplication:

- Seasonal Crystal → Bloomstone state;
- Rotwood → wood condition;
- Fate Glass → Lucid Glass state/product;
- Abyssal Dream Glass → Lucid Glass state;
- Threshold/Sanctuary/Silent/Underside Stone → Ascendant facies/state where applicable;
- Inverted/Floating Stone → Pressure Stone facies;
- Orientation/Compressed/Coreward Crystal → Seismic Crystal state/form;
- Gravity Ore → Abyssal Iron deposit/state;
- Blackwater Pearl → Pressure Pearl provenance/state;
- Oath Metal → Contract Iron terminology/state/use context;
- charged metals/crystals;
- corruption;
- wet/dry/hot/cold;
- damage/wear.

This is a direct FCC-12 binding requirement.

---

# 22. POC Coverage Finding

The old 312-row registry has exact-name coverage for only a small fraction of the minimum current demand extracted here.

That comparison is intentionally strict, but the conclusion is robust:

> **The old POC registry cannot be expanded incrementally and treated as the authoritative master list.**

The modern registry must be generated from current canon and then supplied with migration mappings from the POC.

This reverses the dependency correctly:

> current canon → definitive registry → legacy migration

not:

> old registry → patched until it resembles current canon.

---

# 23. Minimum Canonical Binding Matrix

The table below records the extracted demand.

`POC exact name` is only a quick coverage signal. It does not mean a legacy row is automatically accepted.

| Scope | Required Name / Role | Demand Class | Required Binding | Source | POC exact name | Notes |
|---|---|---|---|---|---|---|

| Universal | Material Definition | REGISTRY SCHEMA | EXACT SCHEMA CAPABILITY | FCC-12A–D | NO | Must represent underlying material independently of form/state/provenance. |
| Universal | Physical Form Definition | REGISTRY SCHEMA | EXACT SCHEMA CAPABILITY | FCC-12A–D | NO | Reusable generated/authored form identity. |
| Universal | State / Condition | REGISTRY SCHEMA | INSTANCE/DEFINITION CAPABILITY | FCC-12A–D | NO | Must not require duplicate material identity. |
| Universal | Facies | REGISTRY SCHEMA | STATE/FACIES CAPABILITY | FCC-12A–D | NO | Geological/environmental expression of parent material. |
| Universal | Provenance | REGISTRY SCHEMA | METADATA CAPABILITY | FCC-12A–D | NO | Origin/history independent from identity. |
| Universal | Quality / Grade / Purity | REGISTRY SCHEMA | METADATA CAPABILITY | FCC-12A–D | NO | Multidimensional, not rarity tier. |
| Universal | Provider / Capability Role | REGISTRY SCHEMA | QUERY/TAG CAPABILITY | FCC-12A–D | NO | Exact material versus provider requirements must be distinguishable. |
| Universal | Manufactured Component | REGISTRY SCHEMA | CONTENT OBJECT CAPABILITY | FCC-12A–D | NO | Component identity distinct from natural material. |
| Overworld | Loam | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Clay Soil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Sandy Soil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Silt Soil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Peat Soil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Chalk Soil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Volcanic Ash Soil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Saline Soil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Granite | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | YES | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Limestone | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | YES | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Sandstone | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Slate | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Shale | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Basalt | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | YES | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Marble | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Gneiss | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Quartzite | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | White Kaolin | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Clear Quartz | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Obsidian | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Raw Mana Crystal | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | YES | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Ley Crystal | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Thunder Glass | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Frost Pearl | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Sunstone | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Oak Heartwood | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Ironbark | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Whitepine | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Blackwood | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Beech | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Redbark | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Maple | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Spruce | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Larch | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Birch | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Acacia | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Cypress | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Willowreed | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Sunflax Fibre | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Mirehemp Fibre | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Resin Amber | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Pitch Sap | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Corkbark | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Dye Lichen | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Alchemical Moss | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Copper | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Tin | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Bronze | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Iron | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Steel | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Lead | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Nickel | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Cobalt | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Silver | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Gold | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Star Iron | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Mythril | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Garnet | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Sapphire | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Ruby | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Emerald | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Opal | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Diamond | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Firewood | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Charcoal | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | YES | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Coal | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Peat Fuel | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Oil Shale | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Lamp Oil | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Sulphur | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Saltpetre | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Ancient Machine Scrap | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Titan Bone | MATERIAL / RESOURCE | EXACT MATERIAL OR CANONICAL RESOURCE | FCC-12D §§7–8 / FCC-01C | NO | Exact world/source/form rows are bound later; material/resource identity must be representable. |
| Overworld | Hearthgrain | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Frostbarley | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Sunmaize | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Marsh Rice | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Stonebean | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Deepcap Mushroom | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Sweetroot | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Redleaf Herb | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Silvermint | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Bitterbloom | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Sunflax | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Mirehemp | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Overworld | Lamp-Oil Seed | BIOLOGICAL / CROP | EXACT BIOLOGICAL CONTENT | FCC-01D final-pass crop canon | NO | Biology identity is distinct from harvested material/product rows; FCC-13 binds seeds/harvest/forms/recipes as required. |
| Universal | chunk/lump | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | powder/dust | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | shard | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | slab | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | stair | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | wall | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | pillar | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | brick/masonry | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | plank/board | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | beam/post/pole | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | rod/bar | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | plate/sheet/foil | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | wire | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | ingot/billet/bloom | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | cord/rope/thread/yarn/cloth | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Universal | pane/lens/inlay | STANDARD FORM FAMILY | GENERATED/INHERITED WHERE ELIGIBLE | FCC-12B / FCC-12D | NO | Does not create a new underlying material. |
| Verdant Covenant | Living Heartwood | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Season Sap | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Thornsilver Fibre | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Pollen Amber | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Memory Seed | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Bloomstone | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Greatheart Wood | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Dawnwood | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Bloomwood | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Rootstone | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Verdant Living Soil | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | River Pearl | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Root Amber | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Seasonal Resin | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §9 / FCC-02C,G | NO | Final form and source representation follows material eligibility and realm-local chains. |
| Verdant Covenant | Greatheart Log | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Greatheart Planks | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Greatheart Beam | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Greatheart Panel | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Dawnwood Log | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Dawnwood Planks | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Dawnwood Beam | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Dawnwood Panel | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Bloomwood Log | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Bloomwood Planks | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Bloomwood Beam | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Bloomwood Panel | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Living Heartwood Billet | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Living Heartwood Joinery | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Refined Season Sap | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Thornsilver Thread | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Thornsilver Cord | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Thornsilver Cloth | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Thornsilver Lattice | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Clarified Pollen Amber | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Pollen Amber Lens | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Pollen Amber Pane | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Memory Seed Capsule | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Tuned Bloomstone | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Bloomstone Stabiliser Core | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Bloomstone Anchor | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Cut Rootstone | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Rootstone Bricks | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-02G §§23–26 | NO | Exact row strategy belongs FCC-13B/C; underlying material relationship is already locked. |
| Verdant Covenant | Covenant Portal | PORTAL FAMILY | EXACT PORTAL IDENTITY | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Covenant Portal Frame | PORTAL BLOCK FAMILY | EXACT CONTENT FAMILY | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Covenant Keystone Socket | PORTAL BLOCK/COMPONENT | EXACT CONTENT IDENTITY | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Covenant Heart | PORTAL KEYSTONE COMPONENT | EXACT COMPONENT IDENTITY | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Carved Heart Core | PORTAL SUBCOMPONENT | EXACT/BOUND COMPONENT | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Botanical Binding | PORTAL PROVIDER SUBCOMPONENT | PROVIDER-BASED BINDING | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Mana-Conductive Insert | PORTAL PROVIDER SUBCOMPONENT | PROVIDER-BASED BINDING | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Attunement Vessel | PORTAL SUBCOMPONENT | PROVIDER/COMPONENT BINDING | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Verdant Covenant | Verdant Growth Catalyst | PORTAL/UPGRADE COMPONENT | EXACT CONTENT IDENTITY | FCC-02G §§26–29 | NO | Covenant portal source is unusually detailed; final global binding must preserve first-access reachability. |
| Ancestral Veil | Memory Stone | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Veil Soil | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Spirit Clay | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Ancestor Ash | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Memory Glass | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Oathbone | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Veil Silk | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Grave Salt | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Echo Pearl | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Soul Silver | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Soulwood | MATERIAL / RESOURCE | EXACT MATERIAL/RESOURCE | FCC-12D §10 / FCC-03C,G | NO | Must remain distinct according to FCC-12 hard non-merges. |
| Ancestral Veil | Cut Memory Stone | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Memory Stone Brick | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Spirit Clay Brick | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Spirit Clay Tile | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Memory Glass Pane | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Memory Glass Lens/Plate | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Oathbone Seal/Fitting | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Veil Silk Thread | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Veil Silk Cloth | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Grave Salt Mixture | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Echo Pearl Component | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Soul Silver Ingot | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Soul Silver Plate | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Soul Silver Wire | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Soulwood Planks | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Soulwood Beam | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Soulwood Panel | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Ancestor Ash Mortar/Ink/Cleansing Mixture | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-03G §§17,34 | NO | Eligibility/relationship is canonical; not every phrase must become a separate Item row. |
| Ancestral Veil | Veilgate | PORTAL FAMILY | EXACT PORTAL IDENTITY | FCC-03G §21 | NO | Exact quantities/core construction remain FCC-13D work. |
| Ancestral Veil | Veilgate Memory Stone Frame/Foundation | PORTAL MATERIAL ROLE | EXACT MATERIAL ROLE | FCC-03G §21 | NO | Exact quantities/core construction remain FCC-13D work. |
| Ancestral Veil | Veilgate Memory Glass Threshold/Interface | PORTAL MATERIAL ROLE | EXACT MATERIAL ROLE | FCC-03G §21 | NO | Exact quantities/core construction remain FCC-13D work. |
| Ancestral Veil | Veilgate Soul Silver Fittings | PORTAL MATERIAL/FORM ROLE | EXACT MATERIAL + FORM | FCC-03G §21 | NO | Exact quantities/core construction remain FCC-13D work. |
| Ancestral Veil | Veilgate Echo Pearl Keystone/Core | PORTAL CORE ROLE | EXACT MATERIAL OR CRAFTED CORE DECISION | FCC-03G §21 | NO | Exact quantities/core construction remain FCC-13D work. |
| Ancestral Veil | Veilgate Grave Salt Stabilisation | PORTAL MATERIAL ROLE | EXACT MATERIAL ROLE | FCC-03G §21 | NO | Exact quantities/core construction remain FCC-13D work. |
| Ancestral Veil | Veilgate Recognition/Inscription Layer | PORTAL ACTIVATION ROLE | SYSTEM/COMPONENT DECISION | FCC-03G §21 | NO | Exact quantities/core construction remain FCC-13D work. |
| Somnolent Expanse | Dreamstone | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Dream Sand | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Dream Soil | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Dreamwater | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Reverie Wood | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Waking Stone | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Dream Mote | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Nightmare Resin | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Lucid Glass | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Sleepbloom | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Memory Thread | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Prophecy Ink | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Nightmare Sap | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Omen Dust | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Time-Seed | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Inspiration Resin | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Fear Chitin | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Road Chalk | MATERIAL / RESOURCE / PRODUCT | EXACT CANONICAL BINDING | FCC-12D §11 / FCC-04C,G | NO | State relationships such as Fate Glass/Abyssal Dream Glass must not become parallel base materials. |
| Somnolent Expanse | Cut Dreamstone | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Dreamstone Brick | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Dreamstone Slab | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Dreamstone Stair | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Dreamstone Wall | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Dreamstone Pillar | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Reverie Planks | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Reverie Beam | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Reverie Post | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Reverie Slab | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Reverie Stair | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Reverie Door | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Reverie Panel | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Cut Waking Stone | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Waking Stone Foundation | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Waking Stone Machinery Base | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Lucid Glass Pane | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Lucid Glass Plate/Inlay | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Memory Thread Screen/Membrane | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Lucid Beacon | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Memory Loom | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Nightmare Ward | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Coherence Anchor | FORM / PLACEABLE / FUNCTIONAL | GENERATED OR AUTHORED BINDING | FCC-04G §§40–41 | NO | Functional assemblies may be multiblocks/objects rather than 1×1×1 voxel Blocks. |
| Somnolent Expanse | Hardened Nightmare Resin | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Nightmare Resin Coating/Sealant | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Lucid Glass Lens | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Memory Thread Spool | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Memory Thread Cloth | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Memory Thread Binding | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Encoded Memory Textile | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Coherence Core | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Calibrated Dream Mote Container | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Calibrated Lucid Glass Component | TRUE ITEM / COMPONENT | AUTHORED BINDING | FCC-04G §41 | NO | Must retain source material/state relationship. |
| Somnolent Expanse | Dreamgate | PORTAL FAMILY | EXACT PORTAL IDENTITY | FCC-04G §13 | NO | Component-role pool is canonical; exact mandatory subset and quantities are intentionally deferred. |
| Somnolent Expanse | Dreamgate Lucid Glass Role | PORTAL MATERIAL ROLE | ROLE POOL | FCC-04G §13 | NO | Component-role pool is canonical; exact mandatory subset and quantities are intentionally deferred. |
| Somnolent Expanse | Dreamgate Dream Mote Role | PORTAL MATERIAL ROLE | ROLE POOL | FCC-04G §13 | NO | Component-role pool is canonical; exact mandatory subset and quantities are intentionally deferred. |
| Somnolent Expanse | Dreamgate Coherence Core Role | PORTAL COMPONENT ROLE | ROLE POOL | FCC-04G §13 | NO | Component-role pool is canonical; exact mandatory subset and quantities are intentionally deferred. |
| Somnolent Expanse | Dreamgate Waking Stone Role | PORTAL MATERIAL ROLE | ROLE POOL | FCC-04G §13 | NO | Component-role pool is canonical; exact mandatory subset and quantities are intentionally deferred. |
| Somnolent Expanse | Dreamgate Memory Thread Role | PORTAL MATERIAL ROLE | ROLE POOL | FCC-04G §13 | NO | Component-role pool is canonical; exact mandatory subset and quantities are intentionally deferred. |
| Ascendant Reach | Cloudstone | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Skyiron | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Stormglass | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Windspun Fibre | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Lightning Core | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Sunmist | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Aether Gas | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Hymnstone | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Celestial Metal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Storm Metal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Concord Metal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Halo Glass | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Judgement Crystal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Grace Thread | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Blessing Salt | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Covenant Wax | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Lightning Essence | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Thunder Pearl | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Saint Steel | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §12 / FCC-05C,G | NO | Transformed lineages must preserve FCC-12 semantics. |
| Ascendant Reach | Cut Cloudstone | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Cloudstone Bricks | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Cloudstone Slab | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Cloudstone Stair | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Cloudstone Wall | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Cloudstone Pillar | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skywood Log/Wood | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skywood Planks | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skywood Beam | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Stormglass Block | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Stormglass Pane | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Stormglass Lens/Plate | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Hymnstone Panel/Pillar | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Hymnstone Resonator | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Hymnstone Inscribed Plate | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skyiron Ingot | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skyiron Plate | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skyiron Rod | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skyiron Wire | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Skyiron Fittings/Fasteners | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Celestial Metal Ingot | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Grace Thread Product | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Windspun Thread | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Windspun Rope | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Windspun Cloth | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Sailcloth | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-05G §§19–30,58–59 | NO | Skywood is realm-local content family; no generic Divine Wood material is created. |
| Ascendant Reach | Ascension Gate | PORTAL FAMILY | EXACT PORTAL IDENTITY | FCC-05G §§42–46 | NO | First access cannot require Ascendant-only material unless a legitimate pre-entry source exists. |
| Ascendant Reach | Ascension Keystone | PORTAL KEYSTONE COMPONENT | EXACT COMPONENT IDENTITY | FCC-05G §§42–46 | NO | First access cannot require Ascendant-only material unless a legitimate pre-entry source exists. |
| Ascendant Reach | Ascension Gate Structural Frame/Foundation | PORTAL PROVIDER ROLE | PROVIDER/OBJECT BINDING | FCC-05G §§42–46 | NO | First access cannot require Ascendant-only material unless a legitimate pre-entry source exists. |
| Ascendant Reach | Ascension Gate Conductive/Stabilising Fittings | PORTAL PROVIDER ROLE | PROVIDER/COMPONENT BINDING | FCC-05G §§42–46 | NO | First access cannot require Ascendant-only material unless a legitimate pre-entry source exists. |
| Ascendant Reach | Ascension Gate Vertical/Aetheric Attunement Layer | PORTAL ATTUNEMENT ROLE | SYSTEM/COMPONENT BINDING | FCC-05G §§42–46 | NO | First access cannot require Ascendant-only material unless a legitimate pre-entry source exists. |
| Ascendant Reach | Ascension Gate Activation Interface | PORTAL INTERFACE | AUTHORED COMPONENT/ASSEMBLY | FCC-05G §§42–46 | NO | First access cannot require Ascendant-only material unless a legitimate pre-entry source exists. |
| Impossible Deep | Pressure Stone | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Bone Stone | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Emberbone | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Abyssal Iron | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Seismic Crystal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Pressure Pearl | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Black Brine Salt | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Ventglass | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Deepfire Ember | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Pressure Resin | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Gravity Nodule | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Pressure Oils | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Resonance Wood | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Fossil Alloys | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §13 / FCC-06C,G | NO | Deepstone is retired and must not own this geology. |
| Impossible Deep | Abyssal Iron Ore/Concentrate | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Seismic Crystal Shard | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Ventglass Component | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Pressure Pearl Component | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Pressure Resin Seal | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Black Brine Salt Reagent | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Gravity Nodule Component | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Deepfire Containment Component | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Resonator | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Seismic Sensor Component | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Gravity/Orientation Component | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Pressure-Seal Component | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Spatial Catalyst | FORM / COMPONENT / PRODUCT | AUTHORED OR GENERATED BINDING | FCC-06G §§10–18,76 | NO | Component identity must remain distinct from underlying material. |
| Impossible Deep | Quake Fruit | BIOLOGICAL / CROP | EXACT REALM CONTENT | FCC-06G §§20,23,60 | NO | Seed/harvest/food product rows remain to be bound. |
| Impossible Deep | Pressure Bulb | BIOLOGICAL / CROP | EXACT REALM CONTENT | FCC-06G §§20,23,60 | NO | Seed/harvest/food product rows remain to be bound. |
| Impossible Deep | Deepcap | BIOLOGICAL / CROP | EXACT REALM CONTENT | FCC-06G §§20,23,60 | NO | Seed/harvest/food product rows remain to be bound. |
| Impossible Deep | Brine Reed | BIOLOGICAL / CROP | EXACT REALM CONTENT | FCC-06G §§20,23,60 | NO | Seed/harvest/food product rows remain to be bound. |
| Impossible Deep | Ember Bean | BIOLOGICAL / CROP | EXACT REALM CONTENT | FCC-06G §§20,23,60 | NO | Seed/harvest/food product rows remain to be bound. |
| Impossible Deep | Deepgate | PORTAL FAMILY | EXACT PORTAL IDENTITY | FCC-06G §§42–45 | NO | First Deepgate cannot self-lock behind Impossible Deep-only materials. |
| Impossible Deep | Deep Keystone | PORTAL KEYSTONE COMPONENT | EXACT COMPONENT IDENTITY | FCC-06G §§42–45 | NO | First Deepgate cannot self-lock behind Impossible Deep-only materials. |
| Impossible Deep | Deepgate Structural Frame | PORTAL PROVIDER ROLE | PROVIDER/OBJECT BINDING | FCC-06G §§42–45 | NO | First Deepgate cannot self-lock behind Impossible Deep-only materials. |
| Impossible Deep | Deepgate Anchoring/Stabilisation Layer | PORTAL STABILISATION ROLE | SYSTEM/COMPONENT BINDING | FCC-06G §§42–45 | NO | First Deepgate cannot self-lock behind Impossible Deep-only materials. |
| Impossible Deep | Deepgate Pressure/Depth Attunement | PORTAL ATTUNEMENT ROLE | SYSTEM/STATE BINDING | FCC-06G §§42–45 | NO | First Deepgate cannot self-lock behind Impossible Deep-only materials. |
| Impossible Deep | Deepgate Activation Interface | PORTAL INTERFACE | AUTHORED COMPONENT/ASSEMBLY | FCC-06G §§42–45 | NO | First Deepgate cannot self-lock behind Impossible Deep-only materials. |
| Ashen Lower Realms | Infernal Ash | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | YES | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Ember Iron | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Contract Iron | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Chain Metal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Infernal Alloy | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Ember Salt | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Cooling Crystal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Hunger Crystal | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Hellglass | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Ash Glass | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Sootglass | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Cinderhide | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Cinder Pearl | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Cinderwood | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Heat Gas | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Black Ember | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Cold Fire | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Furnace Heart | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Ash Brick | MATERIAL / RESOURCE | EXACT CANONICAL BINDING | FCC-12D §14 / FCC-08C,G | NO | Basalt reuses universal Basalt; Infernal Brick migrates to Ash Brick. |
| Ashen Lower Realms | Natural Basalt | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Cut Basalt | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Basalt Masonry/Brick | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Basalt Slab | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Basalt Stair | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Basalt Wall | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Basalt Pillar | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Compacted Infernal Ash | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Ember Iron Ore | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Ember Iron Ingot | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Contract Iron Product | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Chain Metal Billet/Ingot | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Hellglass Form | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Cooling Crystal Shard/Component | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Hunger Crystal Component | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Processed Cinderhide | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Cinder Pearl Component | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Black Ember Containment | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Cold Fire Containment | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Cinderwood Planks/Beams | FORM / PRODUCT / COMPONENT | GENERATED OR AUTHORED BINDING | FCC-08G §§5–8,58–73 | NO | Underlying material and hazardous-state semantics must be preserved. |
| Ashen Lower Realms | Ashgate | PORTAL FAMILY | EXACT PORTAL IDENTITY | FCC-08G §§43–50 | NO | First access cannot require Ashen-only resources unless another legitimate source is explicitly authored. |
| Ashen Lower Realms | Ash Keystone | PORTAL KEYSTONE COMPONENT | EXACT COMPONENT IDENTITY | FCC-08G §§43–50 | NO | First access cannot require Ashen-only resources unless another legitimate source is explicitly authored. |
| Ashen Lower Realms | Ashgate Reinforced Structural Frame | PORTAL PROVIDER ROLE | PROVIDER/OBJECT BINDING | FCC-08G §§43–50 | NO | First access cannot require Ashen-only resources unless another legitimate source is explicitly authored. |
| Ashen Lower Realms | Ashgate Thermal Stabilisation | PORTAL STABILISATION ROLE | SYSTEM/COMPONENT BINDING | FCC-08G §§43–50 | NO | First access cannot require Ashen-only resources unless another legitimate source is explicitly authored. |
| Ashen Lower Realms | Ashgate Realm/Depth Attunement | PORTAL ATTUNEMENT ROLE | SYSTEM/STATE BINDING | FCC-08G §§43–50 | NO | First access cannot require Ashen-only resources unless another legitimate source is explicitly authored. |
| Ashen Lower Realms | Ashgate Activation Interface | PORTAL INTERFACE | AUTHORED COMPONENT/ASSEMBLY | FCC-08G §§43–50 | NO | First access cannot require Ashen-only resources unless another legitimate source is explicitly authored. |
| Universal Systems | Wrench | TOOL FAMILY | EXACT TOOL ARCHETYPE REQUIRED | Established Leyforge tool-system canon | NO | Exact material variants/recipes/progression remain FCC-13/technical binding work. |
| Universal Systems | Hammer | TOOL FAMILY | EXACT TOOL ARCHETYPE REQUIRED | Established Leyforge tool-system canon | NO | Exact material variants/recipes/progression remain FCC-13/technical binding work. |
| Universal Systems | Rune Chisel | TOOL FAMILY | EXACT TOOL ARCHETYPE REQUIRED | Established Leyforge tool-system canon | YES | Exact material variants/recipes/progression remain FCC-13/technical binding work. |
| Universal Systems | Rune Tuner | TOOL FAMILY | EXACT TOOL ARCHETYPE REQUIRED | Established Leyforge tool-system canon | NO | Exact material variants/recipes/progression remain FCC-13/technical binding work. |
| Universal Systems | Prospecting Tool | TOOL FAMILY | EXACT TOOL ARCHETYPE REQUIRED | Established Leyforge tool-system canon | NO | Exact material variants/recipes/progression remain FCC-13/technical binding work. |
| Universal Systems | Survey Lens | TOOL FAMILY | EXACT TOOL ARCHETYPE REQUIRED | Established Leyforge tool-system canon | NO | Exact material variants/recipes/progression remain FCC-13/technical binding work. |
| Universal Systems | Item Chute | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | NO | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Conveyor Belt | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Item Pipe | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Fluid Pipe | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Pump | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Splitter | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Sorter/Filter | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | NO | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Merger | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Water Wheel | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Windmill | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Manual Crank | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Fuel Engine | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | YES | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |
| Universal Systems | Mechanical Miner | AUTOMATION / LOGISTICS ARCHETYPE | SYSTEM CONTENT ARCHETYPE | Established Leyforge automation direction | NO | Step 1C records system demand; exact POC rows/IDs are not automatically retained. |

---

# 24. Step 1C Audit

- [x] universal material/form/state/provider architecture demand extracted;
- [x] Overworld locked material/resource demand extracted;
- [x] Overworld principal crop identities extracted;
- [x] Verdant material/form/component demand extracted;
- [x] Ancestral material/form/component demand extracted;
- [x] Somnolent material/form/component demand extracted;
- [x] Ascendant material/form/component demand extracted;
- [x] Impossible Deep material/form/component demand extracted;
- [x] Ashen material/form/component demand extracted;
- [x] universal tool/logistics archetype demand recorded;
- [x] exactly six portal families extracted;
- [x] portal component-role pools extracted;
- [x] portal first-access reachability rule extracted;
- [x] state/facies anti-duplication requirements carried forward;
- [x] structure-vs-object boundary recorded;
- [x] biological-vs-harvested-product boundary recorded;
- [x] old POC prevented from defining current scope.

---

# 25. New Decisions Still Required

Step 1C exposes the binding decisions FCC-13 must still make.

Most important:

1. final stable-ID and namespace architecture;
2. deterministic generated-form IDs;
3. Block/Object/Inventory projection architecture;
4. exact provider-tag schema;
5. exact material→form eligibility data representation;
6. exact recipe quantity normalisation;
7. exact process/station capability binding;
8. exact six-portal first-access dependency graph;
9. exact six portal recipes;
10. exact portal component rows and recovery behaviour;
11. exact migration handling for unsupported old rows;
12. exact POC-content survival for equipment/food/loot/machines where POC evidence is the only source.

These are now explicit rather than hidden.

---

# 26. Next Step

> **FCC-13 Step 1D — Recipe, Provider, Portal Dependency & Exact-Binding Matrix**

Step 1D should combine:

- FCC-12 process/provider rules;
- realm-local recipe contracts;
- Covenant Portal's unusually detailed existing contract;
- the other five portal component-role contracts;
- Overworld pre-realm provider availability;
- cross-realm accessibility;
- conservation;
- first-access non-circularity.

It must identify every remaining exact binding fork before the FCC-13 interview is generated.

After Step 1D:

> **Step 1E — FCC-13 Interview Architecture & Completeness Gate**

will be able to ask only the decisions that genuinely remain.

---

> **FCC-13 STEP 1C — CANONICAL CONTENT BINDING MATRIX — COMPLETE v0.1**

**End of FCC-13 Step 1C v0.1**
