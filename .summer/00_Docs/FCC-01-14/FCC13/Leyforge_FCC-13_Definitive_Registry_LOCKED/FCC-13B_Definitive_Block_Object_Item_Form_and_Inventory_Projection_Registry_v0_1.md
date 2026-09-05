# Leyforge Final Content Canon Collection

## FCC-13B — Definitive Block, Object, Item, Form & Inventory Projection Registry

**Version:** 0.1  
**Date:** 29 August 2026  
**Status:** **CANON WRITING COMPLETE v0.1 — based on locked FCC-13 interview Q1–Q268**  
**Parent:** FCC-13 — Definitive Blocks, Items, Forms, Recipes, IDs & Portal Binding  
**Primary Interview Coverage:** R02 Q21–Q44; R03 Q45–Q64  
**Consumes:** FCC-13A; locked FCC-13 interview Q1–Q268; FCC-13 Steps 1A–1E; locked FCC-12 form/material rules  
**Downstream:** FCC-13C; FCC-13D; FCC-13E; technical/Forge implementation

---

# 1. Purpose

FCC-13B defines how canonical physical content is represented in world space, voxel/block space, inventories, machines, structures, containers and generated forms.

Its core rule is:

> **physical content identity + projection + material/form composition + instance state**

This replaces the old prototype assumption that a Block row and an Item row must automatically be two different identities.

---

# 2. Projection Doctrine

> **A physical object may have multiple projections without multiple canonical identities.**

Common projections include:

- inventory;
- world/placeable;
- dropped-world object;
- installed component;
- machine-slot;
- structure-cell;
- contained-material.

Projection is representation, not identity.

---

# 3. Canonical Physical Layers

FCC-13B distinguishes:

1. underlying material;
2. physical form;
3. content object/archetype;
4. projection;
5. runtime instance state.

Example:

**Iron Plate**

- material: `leyforge:material/iron`
- form: `leyforge:form/plate`
- generated physical identity: `(iron, plate)`
- projection: inventory / dropped / installed
- state: quality, provenance, ownership, damage

There is no separate “Iron Plate material”.

---

# 4. Block Definition

`Block` is primarily a world/voxel representation.

A Block may represent:

- terrain material/form;
- a placed generated form;
- an authored object;
- one occupied cell of a multiblock;
- a portal-frame piece;
- a structure component.

A Block projection does not automatically create another material or another Item identity.

---

# 5. Item Definition

`Item` is primarily a portable/inventory projection.

An Item projection may represent:

- generated material/form;
- authored component;
- tool;
- harvested biological product;
- container;
- machine part;
- portal keystone;
- furniture object.

When the same physical thing is placed, the world representation points to the same canonical physical identity.

---

# 6. Authored Object Boundary

Use an explicit `object/` identity when content has meaningful object-level behaviour beyond ordinary material+form, including:

- unique geometry;
- interactions;
- sockets/ports;
- multiple materials;
- moving parts;
- machine logic;
- portal logic;
- custom collision;
- unique lifecycle.

Simple regular forms remain generated material+form identities.

---

# 7. Single-Definition Rule

> **If placement and pickup preserve the same physical thing, use one content identity with multiple projections.**

Separate identities are justified only when the lifecycle or physical object actually changes.

---

# 8. Legacy Duplicate Resolutions

## Oak Log
Legacy Block 9 + Item 142 → **MERGE**.

One Oak-log physical relationship with world and inventory projections.

## Stone Brick
Legacy Block 31 + Item 170 → **MERGE**.

One actual-stone + masonry/brick form relationship.

## Cobblestone
Legacy Block 32 + Item 169 → **MERGE**.

One source-stone-aware cobble form.

## Oak Beam
Legacy Block 33 + Item 168 → **MERGE**.

One timber-aware beam object/form.

## Clay Roof Tile
Legacy Block 61 + Item 224 → **MERGE**.

One fired-ceramic roof-tile product.

## Oak Planks / Oak Plank
Legacy Block 11 + Item 167 → **MERGE**.

Singular/plural naming does not create identity.

## Clay Brick Block / Clay Brick
Legacy Block 60 + Item 223 → **MERGE**.

One fired-ceramic brick product.

---

# 9. Cave Mushroom Lifecycle Split

Legacy Cave Mushroom Block and Item are **not** merged.

Final rule:

- living Cave Mushroom = biological/world organism object;
- harvested Cave Mushroom = portable biological/food product.

They remain related through species/provenance.

---

# 10. Universal Biological Lifecycle

Biological content may require distinct identities or projections for:

1. species/biological definition;
2. living world instance;
3. seed/spore/propagule;
4. harvested product;
5. processed food/material;
6. preserved specimen where applicable.

This pattern also governs crops, reeds, fungi and trees.

---

# 11. Natural Source Nodes

Natural sources may be distinct from harvested forms.

Examples:

- boulder;
- ore-bearing source;
- crystal outcrop;
- clay deposit;
- living tree;
- mushroom patch.

Harvesting produces the appropriate material/form/product.

---

# 12. Terrain Binding

Generic prototype terrain must resolve through current canonical materials.

Examples:

- Dirt Block → actual soil/profile;
- Stone Block → actual stone material;
- Sand Block → composition-bearing Sand source/class;
- Clay Block → actual clay profile/material;
- Mud Block → actual soil/sediment + wet/mud condition or mixture.

The world projection must not hide composition.

---

# 13. Soil State

World soil can carry:

- exact soil identity/profile;
- moisture;
- fertility;
- tillage;
- contamination;
- overlays.

Tilled farmland is normally soil + cultivated state, not a new material.

---

# 14. Surface Overlays

Examples such as:

- mossy stone;
- corrupted ground;
- cursed ground;

should normally bind as:

> actual parent material + overlay/state

unless a later owner explicitly defines a true transformed material.

---

# 15. Fluids

A fluid uses one material identity across:

- world simulation;
- tanks;
- pipes;
- containers.

Stored representation adds:

- quantity;
- temperature/state;
- provenance where relevant;
- container/parent reference.

---

# 16. Gases

Gases follow the same principle.

Stored gas may also track:

- pressure;
- temperature;
- amount.

The gas itself is not renamed because it entered a tank.

---

# 17. Filled Containers

A filled container is a **composite object**:

> container object + contained material + quantity/state

It is not a new material.

---

# 18. Installed Components

A removable installed component remains the same physical object instance.

Installation changes parent/location/projection, not identity.

If the component is irreversibly consumed, its composition/provenance transfers to the resulting object according to the process.

---

# 19. Machine Assemblies

Large machines use:

> one root functional assembly + footprint + component graph

Occupied cells reference the assembly.

This supports:

- multiblocks;
- moving parts;
- sockets;
- ports;
- maintenance;
- Forge-authored geometry.

---

# 20. Machine Material Slots

A machine archetype may expose material slots such as:

- frame;
- shaft;
- gear;
- seal;
- pipe;
- vessel.

Selected material remains persistent and affects visuals/simulation/repair/salvage.

---

# 21. Structures

Large structures are represented as:

- blueprint;
- project;
- structure instance.

They are not one inventory Item by default.

A deliberate packaged kit may be authored separately.

---

# 22. Furniture

Furniture uses one physical object identity with inventory and placed projections.

---

# 23. Damage

Damage is state by default.

Terminal destruction may transform an object into real salvage/debris.

Do not create a separate canonical ID for every damage level.

---

# 24. Portal Structure State

A portal family can have states such as:

- incomplete;
- inactive;
- active;
- damaged;
- ruined;
- calibrated;
- upgraded.

These remain states of the same portal-family structure unless a physical component detaches.

---

# 25. Standard Form Architecture

Regular material-derived forms use the hybrid generated-form architecture from FCC-13A.

Authoritative identity:

> `(material_id, form_id)`

The runtime may cache/materialise rows, but those rows are derived rather than independently authored.

---

# 26. Standard Form Families

Canonical reusable form identities include:

### Raw / Source
- raw_source
- chunk
- lump
- rubble
- aggregate
- granule
- powder
- dust
- shard

### Construction
- block
- brick
- slab
- stair
- wall
- pillar
- tile
- shingle

### Timber
- plank
- board
- beam
- post
- pole

### Metal / Structural
- rod
- bar
- sheet
- plate
- foil
- wire
- billet
- bloom
- ingot
- fastener
- blank

### Fibre / Textile
- cord
- rope
- thread
- yarn
- cloth
- felt
- lattice

### Glass / Crystal
- pane
- lens
- inlay
- cut_gem

---

# 27. Form IDs

Examples:

- `leyforge:form/chunk`
- `leyforge:form/slab`
- `leyforge:form/stair`
- `leyforge:form/beam`
- `leyforge:form/plate`
- `leyforge:form/wire`
- `leyforge:form/ingot`
- `leyforge:form/thread`
- `leyforge:form/cloth`
- `leyforge:form/pane`
- `leyforge:form/lens`

Equivalent forms must not proliferate under arbitrary synonyms.

---

# 28. Timber Form Profile

Compatible timber may support:

- log/raw wood;
- plank;
- board;
- beam;
- post;
- pole;
- slab;
- stair;
- wall/panel where physically appropriate.

Specialist timber may restrict ordinary forms.

Living Heartwood may require authored living-preservation overrides.

---

# 29. Stone Form Profile

Compatible stone may support:

- raw stone/source;
- chunk;
- rubble;
- cut block;
- brick/masonry;
- slab;
- stair;
- wall;
- pillar;
- tile where appropriate.

Actual stone identity remains known.

---

# 30. Metal Form Profile

Compatible metals/alloys may support:

- ore/source;
- concentrate;
- bloom;
- billet;
- ingot;
- plate;
- sheet;
- foil;
- rod;
- bar;
- wire;
- fastener;
- blank.

Ore/source and refined metal remain distinct feedstock/material relationships.

---

# 31. Glass / Crystal Form Profile

Eligible glass/crystal materials may support:

- block/stock;
- shard;
- pane;
- plate;
- lens;
- inlay;
- cut optical component.

Eligibility remains material-specific.

---

# 32. Fibre / Textile Form Profile

Eligible fibres may support:

- raw/cleaned fibre;
- thread;
- yarn;
- cord;
- rope;
- cloth;
- felt;
- lattice.

---

# 33. Ceramic Boundary

Raw clay does not inherit fired ceramic forms directly.

Canonical sequence is conceptually:

> clay/feedstock → shaped precursor where needed → firing/transformation → ceramic material/product → brick/tile/etc. forms

This preserves the FCC-12 transformation threshold.

---

# 34. Art Inheritance

Generated forms combine:

- form geometry/template;
- actual material appearance;
- shader/physical material data;
- optional explicit override.

The selected material remains visible.

---

# 35. Collision / Geometry

Default geometry/collision belongs to the form template.

A material may alter physical parameters without silently changing the form geometry.

---

# 36. Specialist Override

A material+form pair may bind a specialist authored object when unique geometry or behaviour requires it.

The override is explicit.

---

# 37. Forbidden Forms

The resolver rejects physically invalid combinations.

Examples:

- Water + beam;
- Sand + wire;
- brittle pearl + structural plate without a specialist composite process.

A global form ID does not imply universal material eligibility.

---

# 38. Multi-Material Archetypes

A multi-material object uses one material-neutral archetype ID.

Example:

`leyforge:object/machine/pump_basic`

Instance material slots store actual selected materials.

---

# 39. Universal Tool Archetypes

Current Leyforge requires canonical tool archetypes including:

- `leyforge:object/tool/wrench`
- `leyforge:object/tool/hammer`
- `leyforge:object/tool/rune_chisel`
- `leyforge:object/tool/rune_tuner`
- `leyforge:object/tool/prospecting_tool`
- `leyforge:object/tool/survey_lens`

Material variants do not create new tool archetypes unless design/behaviour genuinely changes.

---

# 40. Automation Archetypes

The registry must support canonical/system archetypes for:

- Item Chute;
- Conveyor Belt;
- Item Pipe;
- Fluid Pipe;
- Pump;
- Splitter;
- Sorter/Filter;
- Merger;
- Water Wheel;
- Windmill;
- Manual Crank;
- Fuel Engine;
- Mechanical Miner.

Exact old POC IDs migrate only where supported by current canon.

---

# 41. Components

Machine parts such as:

- gears;
- shafts;
- frames;
- seals;
- pipe sections;
- chute segments;

are components/forms retaining actual material.

They are not material families.

---

# 42. Gear Binding

A Gear is a component archetype with material selection.

Wooden, Copper and Iron gears remain the same component concept with different material composition where design permits.

---

# 43. Pipe Binding

A Pipe archetype retains:

- actual material;
- size;
- pressure rating;
- state.

`Fluid Pipe` is not one universal pipe material.

---

# 44. Containers

Container archetypes expose:

- capacity;
- compatibility;
- closure/seal properties;
- material composition.

Contained substance remains separate.

---

# 45. Six Portal Families

Exactly six normal external Realm Access families are bound:

- Covenant Portal;
- Veilgate;
- Dreamgate;
- Ascension Gate;
- Deepgate;
- Ashgate.

They share universal Realm Access runtime semantics but remain distinct physical families.

---

# 46. Portal Core Object IDs

Canonical core/keystone object patterns include:

- `leyforge:object/portal/covenant/heart`
- `leyforge:object/portal/veilgate/keystone`
- `leyforge:object/portal/dreamgate/coherence_core`
- `leyforge:object/portal/ascension/keystone`
- `leyforge:object/portal/deepgate/keystone`
- `leyforge:object/portal/ashgate/keystone`

There is no generic `realm_keystone`.

---

# 47. Covenant Portal Object Family

Authored physical content includes:

- Covenant Portal Frame family;
- Covenant Keystone Socket;
- Covenant Heart;
- Attunement Vessel;
- Mana-Conductive Insert;
- Verdant Growth Catalyst.

The rooted-foot condition remains frame state unless distinct geometry requires an authored projection.

---

# 48. Veilgate Object Family

Authored content includes:

- Veilgate threshold/frame family;
- Veil Keystone;
- Veil Recognition Plate;
- Memory Glass threshold panels;
- detachable Soul Silver fittings where required.

Memory Stone remains the exact frame material.

---

# 49. Dreamgate Object Family

Authored content includes:

- Dreamgate structure/frame;
- Coherence Core;
- Lucid Glass interface panels;
- calibration/interface assembly where physical interaction requires it.

Coherence Core is the mandatory exact core.

---

# 50. Ascension Gate Object Family

Authored content includes:

- Ascension Gate structure/blueprint;
- Ascension Keystone;
- Ascension Gate Interface;
- fitting components;
- native upgrade modules.

---

# 51. Deepgate Object Family

Authored content includes:

- Deepgate structure/blueprint;
- Deep Anchor;
- Deep Keystone;
- Deepgate Interface;
- native stabilisation/calibration modules.

---

# 52. Ashgate Object Family

Authored content includes:

- Ashgate structure/blueprint;
- Thermal Stabiliser Module;
- Deepfire Ember Containment Core;
- Ash Keystone;
- Ashgate Interface;
- native upgrade modules.

---

# 53. Broken Portal Legacy Content

`Broken Portal Block` maps to:

- damaged/ruined state of a canonical portal; or
- detached portal-family component where context proves it.

It is not a universal broken-portal material.

---

# 54. Ancient Portal Frame

`Ancient Portal Frame` becomes archaeological structure/component provenance tied to a canonical portal family where identifiable.

If family cannot be safely established, compatibility archaeology content is permitted.

---

# 55. Unstable Rift Block

`Unstable Rift Block` belongs to anomaly/interface/event content.

It is not a normal Realm Access Block.

---

# 56. Charge / Calibration

Charge and calibration are state.

Examples:

- charged Bloomstone;
- dormant Coherence Core;
- calibrated Deep Keystone;
- attuned portal.

These states do not create separate canonical object identities.

---

# 57. Quality / Provenance

Quality and provenance are instance/lot metadata.

A historical Veil Keystone and newly crafted Veil Keystone share object identity unless one is deliberately authored as a unique named artifact.

---

# 58. Stackability

Stackability depends on compatible instance data.

Differences in:

- quantity/state;
- quality;
- damage;
- provenance;
- contents;
- configuration;

may prevent stacking or require lot aggregation.

Stackability is not identity.

---

# 59. Dropped Objects

Dropping an inventory object changes projection, not semantic identity.

---

# 60. Salvage

Dismantling returns actual recoverable:

- components;
- material/forms;
- scrap.

It never substitutes generic local-equivalent material simply because salvage occurred.


# 61. Overworld Material Projection Portfolio

The definitive registry must support material/form binding for the locked Overworld portfolio.

## Soils
- Loam
- Clay Soil
- Sandy Soil
- Silt Soil
- Peat Soil
- Chalk Soil
- Volcanic Ash Soil
- Saline Soil

## Principal Stones
- Granite
- Limestone
- Sandstone
- Slate
- Shale
- Basalt
- Marble
- Gneiss
- Quartzite

## Specialist Mineral / Crystal / Glass
- White Kaolin
- Clear Quartz
- Obsidian
- Raw Mana Crystal
- Ley Crystal
- Thunder Glass
- Frost Pearl
- Sunstone

## Timber / Botanical
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

## Metals / Alloys
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

## Ordinary Gems
- Garnet
- Sapphire
- Ruby
- Emerald
- Opal
- Diamond

## Fuels / Reagents / Other
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

This portfolio is a binding requirement, not a mandate for one explicit authored object row per material.

---

# 62. Overworld Biological Identity Demand

Stable biological/lifecycle support includes:

- Hearthgrain
- Frostbarley
- Sunmaize
- Marsh Rice
- Stonebean
- Deepcap Mushroom
- Sweetroot
- Redleaf Herb
- Silvermint
- Bitterbloom
- Sunflax
- Mirehemp
- Willowreed
- Lamp-Oil Seed family

FCC-13B owns lifecycle/projection structure.

Growth, food and processing recipes belong FCC-13C/owning systems.

---

# 63. Verdant Material/Form Demand

Support:

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

Standard planks, beams, panels and masonry use generated forms where physically valid.

---

# 64. Verdant Authored Components

Authored specialist objects/components include:

- Living Heartwood Joinery where living behaviour matters
- Pollen Amber Lens where specialist optics require authored behaviour
- Bloomstone Stabiliser Core
- Bloomstone Anchor
- Memory Seed Capsule
- Covenant Heart
- Covenant Keystone Socket
- Mana-Conductive Insert
- Attunement Vessel
- Verdant Growth Catalyst

The underlying materials remain separately identifiable.

---

# 65. Ancestral Material/Form Demand

Support:

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

Standard forms such as Memory Glass Pane, Soul Silver Wire and Soulwood Beam use material/form architecture where possible.

---

# 66. Ancestral Authored Components

Authored objects include:

- Veil Keystone
- Veil Recognition Plate
- calibrated Echo Pearl components where a component identity is required
- specialised Oathbone seals/fittings where function exceeds a simple material/form

---

# 67. Somnolent Material/Form Demand

Support:

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

---

# 68. Somnolent Authored Objects

Support:

- Coherence Core
- Lucid Beacon
- Memory Loom
- Nightmare Ward
- Coherence Anchor
- calibrated Dream Mote containers where needed
- Encoded Memory Textile where it functions as an authored object rather than ordinary cloth

Standard Lucid Glass and Reverie timber forms remain generated where eligible.

---

# 69. Ascendant Material/Form Demand

Support:

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

---

# 70. Ascendant Authored Objects

Support:

- Ascension Keystone
- Ascension Gate Interface
- Hymnstone Resonator where function requires component identity
- native portal upgrade modules

Standard Skyiron, Cloudstone and Stormglass forms remain generated where eligible.

---

# 71. Impossible Deep Material/Form Demand

Support:

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

Deepstone is excluded from active exact material binding.

---

# 72. Impossible Deep Authored Components

Support:

- Deep Anchor
- Deep Keystone
- Deepgate Interface
- resonator
- seismic sensor components
- gravity/orientation components
- pressure-seal components
- Spatial Catalyst
- Deepfire containment components

---

# 73. Impossible Deep Biological Content

Stable biological/lifecycle support includes:

- Quake Fruit
- Pressure Bulb
- Deepcap
- Brine Reed
- Ember Bean

---

# 74. Ashen Material/Form Demand

Support:

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

---

# 75. Ashen Authored Components

Support:

- Thermal Stabiliser Module
- Deepfire Ember Containment Core
- Ash Keystone
- Ashgate Interface
- native Ashgate upgrade modules
- specialised Black Ember / Cold Fire / Furnace Heart containment assemblies where required

---

# 76. Hazardous Matter Projection

Hazardous matter may appear as:

- raw material instance;
- contained composite object;
- installed component;
- world hazard/source.

Containment must preserve the actual contained material and hazard state.

---

# 77. Furnace Heart Boundary

Furnace Heart remains a material/resource.

Furnace Core remains a manufactured component.

They must not merge.

A removable Furnace Heart installed in machinery remains the same physical resource instance.

---

# 78. State-Only Canonical Terms

The following do not become standalone base material/object rows merely because they have names:

- Seasonal Crystal → Bloomstone state
- Blackwater Pearl → Pressure Pearl provenance/state
- Gravity Ore → Abyssal Iron deposit/state
- Rotwood → wood condition
- Fate Glass → Lucid Glass state/product
- Abyssal Dream Glass → Lucid Glass state
- charged metal/crystal
- portal calibrated state

---

# 79. Provider-Only Concepts

The following are query semantics rather than physical objects:

- structural timber
- structural stone
- conductive metal
- optical material
- pressure-resistant transparent material
- sealing material
- Plant Fibre provider/category role
- spirit-compatible material
- coherence-compatible material

A provider role never becomes an inventory Item.

---

# 80. Category/Status Terms

Terms such as:

- Relic Material
- Deep Metal
- Heat Glass
- Sacred Fibre

remain status/category/descriptor language unless a real canonical physical target is identified.

---

# 81. Dream Glass Legacy Binding

Legacy Dream Glass resolves to:

- Lucid Glass; or
- a documented Lucid Glass state/product where source context proves it.

No active Dream Glass base material survives.

---

# 82. Oath Metal Legacy Binding

Oath Metal resolves to Contract Iron terminology/state/use context.

No second metal identity is created.

---

# 83. Deep Metal Legacy Binding

Deep Metal remains generic/local terminology.

The actual material must resolve contextually, normally Abyssal Iron in valid Impossible Deep context.

---

# 84. Heat Glass Legacy Binding

Heat Glass remains a functional descriptor.

Actual Hellglass or another qualifying material supplies physical identity.

---

# 85. Raw Mana Crystal Source

Legacy Mana Crystal Ore binds as:

> Raw Mana Crystal source/deposit/world relationship

The source does not create a second Mana Crystal material.

---

# 86. Gravity Ore Source

Gravity Ore binds as:

> Abyssal Iron deposit/state

No new material identity is created.

---

# 87. Blackwater Pearl Source

Blackwater Pearl binds as:

> Pressure Pearl + Blackwater provenance/state

No new pearl material ID is created.

---

# 88. Seasonal Crystal Source

Seasonal Crystal binds as:

> Bloomstone + seasonal charge/attunement state

No new crystal material ID is created.

---

# 89. Object Composition Record

A multi-material object should conceptually store:

- archetype ID
- material slots
- component slots
- state
- quality/damage
- provenance
- ownership/configuration

Exact technical schema remains downstream.

---

# 90. Stackability

Objects stack only when relevant instance data is compatible.

Differences in:

- damage
- quality
- charge
- provenance
- contents
- configuration

may prevent stacking or require lot-level handling.

Stackability is not canonical identity.

---

# 91. Containers and Stackability

Empty identical containers may stack where sensible.

Filled containers stack only when:

- same container archetype/material
- same contained material
- compatible quantity/state
- no meaningful unique provenance/configuration

---

# 92. Tools and Stackability

Durable tools generally do not stack when per-instance durability, quality, modifications or provenance differ.

---

# 93. Dropped World Objects

A dropped object is another projection of the same physical content.

Dropping an inventory object does not create a new semantic identity.

---

# 94. Installed Machine Parts

Installing a Gear, Core or Keystone changes parent/location/projection.

The component remains the same physical object if removal is physically valid.

---

# 95. Salvage and Recovery

Dismantling returns:

- actual recoverable components
- actual recoverable materials/forms
- explicit scrap/loss

It does not return generic local-equivalent material.

---

# 96. Repair Binding

Repair targets actual object/material slots.

Provider-based slots may accept valid substitutes.

Exact identity-bearing components require exact replacement.

Detailed repair recipes belong FCC-13C/D.

---

# 97. Historical Provenance Objects

Historical provenance can matter without creating new object identity.

Examples:

- historical Veilgate component
- Dream-Leak Coherence Core
- archaeological machine scrap

A unique named artifact receives its own object ID only when deliberately authored as a unique object.

---

# 98. First Veilgate Remnant

The guaranteed first-access Veilgate Remnant is a structure instance containing authentic Ancestral portal-family components.

The remnant is not a seventh portal family.

Its historical provenance is instance/structure history.

---

# 99. First Dream-Leak Package

The guaranteed first-access Somnolent package contains:

- Dormant Coherence Core
- Lucid Glass interface panels

Those are canonical object/material-form identities carrying authenticated Dream-Leak provenance.

The site itself remains owned by the site registry.

---

# 100. Portal Frame Representation

Portal frames use portal-family authored frame archetypes where family-specific geometry/validation requires them.

Provider-material slots may still supply the actual physical frame material where upstream canon permits.

---

# 101. Covenant Frame

Covenant Portal frame uses its authored rooted portal-family geometry.

Its frame pieces may carry valid provider-selected structural materials according to FCC-13D.

The rooted-foot condition is state/geometry, not a new material family.

---

# 102. Veilgate Frame

Veilgate completed structure requires Memory Stone frame/foundation identity.

Authored Veilgate geometry can use Memory Stone as actual material.

---

# 103. Dreamgate Frame

Dreamgate first-access frame is provider-based structural construction.

Dreamgate identity comes from the complete structure plus exact Coherence Core, Lucid Glass interface and coherence attunement.

Dreamstone is not added as a first-access requirement.

---

# 104. Ascension Frame

Ascension Gate uses provider-based family-specific tall/upward frame geometry.

Native Ascendant materials may later upgrade the same family.

---

# 105. Deepgate Frame

Deepgate uses provider-based high-strength/reinforced geometry.

Deep-native matter may later upgrade the same family.

---

# 106. Ashgate Frame

Ashgate uses heat-tolerant reinforced geometry and installed Thermal Stabiliser Modules.

Ashen-native materials may later upgrade the same family.

---

# 107. Portal Interfaces

Authored physical interaction components include:

- Covenant Keystone Socket
- Veil Recognition Plate
- Dreamgate interface/calibration assembly where physical interaction requires one
- Ascension Gate Interface
- Deepgate Interface
- Ashgate Interface

Knowledge/attunement itself remains separate from these objects.

---

# 108. Portal Calibration

Destination calibration and attunement are persistent state/knowledge unless a physical module is explicitly authored.

Do not invent generic Attunement Crystal Items.

---

# 109. Portal Upgrades

Use a hybrid model:

- physical upgrade hardware → authored component/module
- calibration/destination/attunement → state/knowledge

The portal remains the same family.

---

# 110. Portal World Projection

A portal structure instance owns:

- blueprint/family ID
- component references
- selected material slots
- structure state
- destination/calibration state
- location/orientation

Occupied cells project the structure into the world.

---

# 111. Portal Inventory Boundary

Whole portals are not one inventory Item.

Portable components may be Items.

Frame pieces may be portable when designed as pieces.

The completed portal remains a structure/project.

---

# 112. Blueprint Projection

A blueprint is planning/structure identity, not the finished physical structure and not automatically an Item.

A built instance records actual selected materials and components.

---

# 113. Construction Project Stock

Delivered project material remains real stock until incorporated.

Project reservation changes ownership/reservation state, not material identity.

---

# 114. Dismantling Projects

Dismantling returns real recoverable components/materials.

No abstract “project refund token” is introduced.

---

# 115. Worldgen Material Binding

Worldgen should instantiate canonical material/source identities rather than generic display-name placeholders.

Example:

a Granite outcrop must resolve to Granite, not just generic Stone with a granite texture.

---

# 116. Ore Source Binding

Ore/source representations may contain:

- host material
- contained ore/mineral
- grade/concentration
- provenance

Copper Ore is not Copper metal.

---

# 117. Generated Form Save Identity

Generated forms persist using:

- material stable ID
- form stable ID
- state/quality/provenance

A generated runtime row number is never sufficient.

---

# 118. Generated Form Networking

Network systems may use negotiated compact handles for material/form pairs.

A hand-authored row for every valid pair is unnecessary.

---

# 119. Generated Form Blueprint Binding

Provider slots may accept generated forms.

Example:

structural timber beam slot

can resolve to Oak Heartwood + Beam, Cinderwood + Beam, or another qualifying timber + Beam.

The built structure records the chosen material.

---

# 120. Generated Form Physical Behaviour

Simulation uses the actual material properties beneath a shared form.

A Basalt Wall and Marble Wall can share wall geometry while differing in mass, strength, weathering or heat behaviour.


# 121. Generated Form Recipe Binding

Ordinary form-conversion recipes derive from shared conversion profiles in FCC-13C.

The form system exposes:

- source form;
- target form;
- eligibility;
- conserved material amount.

---

# 122. Generated Form Repair

Repair targets the actual generated material/form identity.

A damaged Basalt Wall is repaired with material accepted by its blueprint/repair slot, preserving exact versus provider semantics.

---

# 123. Generated Form Salvage

Salvage returns actual source material/form amounts.

It never returns generic “Stone” where the original material was known.

---

# 124. Current Canon Demand Resolution

Every Step-1C canonical demand must terminate in one of these representation classes:

1. exact material;
2. generated material/form;
3. authored object/component;
4. biological/lifecycle identity;
5. state/facies;
6. provider role;
7. blueprint/structure;
8. knowledge/reference;
9. owning non-Block registry.

The old flat Block/Item registry is therefore not the target architecture.

---

# 125. Material-Only Content

Some canonical materials may exist without a loose portable Item representation in every state.

Example:

a gas may exist primarily as:

- environment material;
- pipe/tank content;
- sealed-container content.

The material remains canonical even when no “gas item” exists.

---

# 126. Structure-Only Content

Dungeons, settlements, sites and megastructures remain in their owning registries.

FCC-13B binds only their physical components where necessary.

An entire dungeon does not become one Item or Block.

---

# 127. Functional Assemblies

Objects such as:

- Memory Loom;
- Lucid Beacon;
- Rune Workshop;
- portal interfaces;
- large machines;

may be authored assemblies/multiblocks.

They need not be forced into a 1×1×1 voxel Block simply for registry convenience.

---

# 128. Object Categories

UI/authoring categories are many-to-many metadata.

Example Pump:

- machine;
- automation;
- fluid handling;
- placeable.

Category is not stable identity.

This replaces the brittle single-category assumptions present in the old POC.

---

# 129. Functional Tags

Tags may support:

- blueprint validation;
- provider searches;
- automation;
- UI;
- authoring.

Tags do not create object identity.

Exact provider/tag schema belongs FCC-13C/technical work.

---

# 130. Asset Binding

Objects/forms may reference:

- voxel appearance;
- model;
- texture;
- icon;
- animation;
- sound.

Asset path is implementation data.

Changing art does not require a stable-ID change.

---

# 131. Snapshot Icons

Forge-generated snapshot icons may be bound to objects/forms.

Icons are presentation only.

---

# 132. Non-Cubic Geometry

Authored objects may use non-cubic geometry where required.

The registry explicitly supports:

- custom collision;
- custom placement;
- voxel/model hybrid geometry;
- moving parts.

This is necessary for Forge-authored machines, tools, armour and environment pieces.

---

# 133. Sockets / Ports / Pivots

Authored objects may expose named:

- item sockets;
- item ports;
- fluid ports;
- power ports;
- mana ports;
- pivots;
- moving parts.

These are object-definition data.

They are not new materials or standalone object identities unless physically detachable components are authored.

---

# 134. State Visuals

Objects/forms may expose state-specific visuals such as:

- active/inactive;
- damaged;
- charged;
- open/closed;
- calibrated;
- overloaded.

State visuals do not create new canonical identity.

---

# 135. Projection Validation

Every physical content definition should declare permitted projections.

Examples:

- world source only;
- inventory only;
- inventory + placeable;
- installed only;
- structure component;
- biological organism;
- contained material.

This prevents nonsensical generic placement.

---

# 136. Placement Rules

Placement may depend on:

- geometry;
- support;
- orientation;
- multiblock footprint;
- material/state;
- environment.

Placement behaviour is not identity.

---

# 137. Recovery Rules

Recovery may produce:

- same object;
- transformed form;
- harvested product;
- salvage.

The result follows physical lifecycle.

---

# 138. Example — Oak Heartwood Beam

Material:
`leyforge:material/oak_heartwood`

Form:
`leyforge:form/beam`

World projection:
placed beam.

Inventory projection:
portable beam.

One physical generated identity.

---

# 139. Example — Memory Glass Pane

Material:
`leyforge:material/memory_glass`

Form:
`leyforge:form/pane`

It may be carried, installed in Veilgate or used in another compatible structure without changing material identity.

---

# 140. Example — Coherence Core

Object:
`leyforge:object/portal/dreamgate/coherence_core`

Projection:
inventory / installed.

State may include:

- dormant;
- charged;
- calibrated;
- damaged.

These are not separate core IDs.

---

# 141. Example — Deepfire Ember Containment Core

Object:
`leyforge:object/portal/ashgate/deepfire_ember_containment_core`

Composite physical content includes:

- Deepfire Ember;
- Ventglass;
- Pressure Resin Seal;
- Abyssal Iron.

The contained Deepfire Ember remains semantically identifiable.

---

# 142. Example — Filled Water Vessel

Container:
portable vessel object.

Contained material:
Water.

Quantity:
stored volume.

The filled vessel is composite instance data.

There is no `water_vessel_material`.

---

# 143. Example — Copper Gear

Archetype:
Gear component.

Material slot:
Copper.

Projection:
inventory / installed.

Performance and appearance derive from actual Copper.

---

# 144. Example — Cinderwood Beam

Material:
Cinderwood.

Form:
Beam.

It uses ordinary beam form semantics unless a specific Cinderwood override exists.

Export does not rename or duplicate it.

---

# 145. Example — Contract Iron Plate

Material:
Contract Iron.

Form:
Plate.

Contract-related semantics remain attached through the FCC-12 framework.

An ordinary Iron Plate cannot satisfy an exact Contract Iron requirement.

---

# 146. Example — Living Heartwood Joinery

Living Heartwood specialist joinery may use an authored form/object override when preserving living structure changes geometry or behaviour.

The underlying material remains Living Heartwood.

---

# 147. Object Definition Minimum Contract

A final authored object definition should conceptually support:

- stable object ID;
- namespace/domain;
- display/localisation reference;
- allowed projections;
- material slots;
- component slots;
- form relation;
- placement;
- collision/geometry;
- sockets/ports;
- state schema;
- stackability policy;
- recovery behaviour;
- asset references;
- categories/tags;
- compatibility/test status.

Exact schema remains technical.

---

# 148. Generated Form Minimum Contract

A generated form needs:

- material ID;
- form ID;
- material eligibility;
- form geometry;
- material appearance;
- material amount;
- projection modes;
- stackability;
- placement;
- supported states.

---

# 149. Biological Object Minimum Contract

Biological content should support:

- biological/species identity;
- lifecycle stage;
- world projection;
- harvested-product relationship;
- propagation relationship;
- provenance.

Detailed ecology remains outside FCC-13.

---

# 150. Structure Instance Minimum Contract

A structure/project should support:

- blueprint ID;
- component/material slots;
- owner;
- position/orientation;
- damage/state;
- construction phase;
- portal destination/calibration where applicable.

---

# 151. Machine Instance Minimum Contract

A machine should support:

- archetype ID;
- material slots;
- installed components;
- state;
- energy interfaces;
- ports/sockets;
- damage;
- configuration;
- ownership.

Detailed simulation remains implementation/system-owned.

---

# 152. Projection Data Separation

Implementation may store projection data separately from object data.

That file/schema choice is not canon.

Semantically, the projections belong to the same physical identity.

---

# 153. Generated-versus-Authored Test

Use generated material/form content when:

- the form is regular/reusable;
- the material is eligible;
- no unique interaction/geometry exists.

Use authored object/form when:

- geometry is unique;
- behaviour is unique;
- multi-material composition matters;
- sockets/ports/moving parts matter;
- locked source defines a unique component.

---

# 154. Block/Item Deduplication Test

For every potential Block/Item pair ask:

1. Is the physical object unchanged?
2. Does placement transform it?
3. Does harvest create another lifecycle object?
4. Does breaking produce another form?
5. Is one side merely a natural source?

Only a real physical distinction justifies separate content identity.

---

# 155. Legacy POC Scope Rule

The 312-row POC registry is migration evidence only.

POC content survives only when:

- current canon supports it;
- it maps to a valid form/state/component;
- or an owning content system explicitly retains it.

FCC-13B does not promote old rows merely because they existed.

---

# 156. POC Named Stations

Old named stations may be rebound only where supported by current systems.

When retained, they are object archetypes providing capabilities.

They do not become exclusive owners of a process merely because an old recipe used them.

---

# 157. POC Food / Equipment / Loot

POC-only exact food, equipment and loot remains unbound until its owning system/current canon supports it.

The target representation exists; the content itself is not auto-canonised here.

---

# 158. Goblin Legacy Category

Goblin-made objects may exist as:

- equipment;
- cultural/faction objects;
- salvage;
- trade goods.

They must not inherit the old generic `Monster Drop` classification.

Goblin is a sapient ancestry.

---

# 159. Currency Legacy Content

Coins/tokens require an issuer/economic context.

Their physical material and economic meaning remain separate.

Nothing in FCC-13B turns Copper/Silver coin rows into universal money.

---

# 160. Forge Authoring Handoff

Forge should expose:

- canonical archetype;
- material slots;
- generated form selection;
- projection modes;
- geometry/collision;
- sockets/ports;
- state fields;
- recipe references;
- visual inheritance.

Authors should not duplicate one physical thing into separate Block and Item definitions unless the lifecycle actually differs.

---

# 161. Forge Standard-Form Workflow

Recommended workflow:

1. define/select material;
2. assign form profile;
3. preview generated forms;
4. opt out or override only selected forms;
5. author specialist geometry/behaviour only where required.

---

# 162. Forge Specialist Object Workflow

Specialist objects may author:

- mesh/voxel shape;
- custom collision;
- animations;
- sockets;
- ports;
- pivots;
- state visuals;
- multiblock footprint;
- placement validation.

---

# 163. Save Handoff

Saves must preserve enough information for physical content to reconstruct:

- object/material identity;
- form;
- projection-relevant state;
- composition slots;
- quality/provenance where needed.

A display name or old row number is insufficient.

---

# 164. Network Handoff

Networking may compress IDs through runtime handles.

The semantic content remains:

- canonical object ID; or
- canonical material+form pair.

Peers must agree on the mapping.

---

# 165. Automation Handoff

Automation must manipulate real object/material identities.

Examples:

- a chute moves the same item object/stack;
- a machine reservation targets actual input identity;
- a pipe transfers actual fluid material and quantity.

Projection changes do not create duplicate stock.

---

# 166. Conservation Handoff

Inventory ↔ world placement is normally a projection change, not item destruction/recreation with unrelated identity.

This is important for:

- conservation;
- provenance;
- quality;
- ownership;
- save stability.

---

# 167. FCC-13B Ownership

FCC-13B owns:

- physical content representation;
- Block/Object/Item projection;
- single-definition resolutions;
- biological lifecycle split;
- fluid/gas/container projection;
- machine/structure projection;
- generated standard-form catalogue;
- material form profiles;
- authored specialist-object boundary;
- portal physical object families;
- current-canon projection targets.

It does not own final executable recipe quantities beyond already locked interview consequences.

---

# 168. FCC-13C Handoff

FCC-13C will define:

- exact recipe rows;
- global form-conversion profiles;
- quantities;
- provider inputs;
- process/station capabilities;
- component construction;
- repair;
- projects;
- salvage/recycling transactions.

---

# 169. FCC-13D Handoff

FCC-13D will bind exact six-portal construction and upgrade recipes using the portal-family object identities established here.

It may not create generic portal families or generic keystone material.

---

# 170. FCC-13E Handoff

FCC-13E will map all 312 old POC rows into:

- canonical objects;
- generated forms;
- states;
- components;
- compatibility content;
- test content;
- retired/rejected outcomes.

FCC-13B defines the target representation.

---

# 171. Decision Trace

FCC-13B directly carries accepted interview decisions:

- Q21–Q44 — Block/Object/Item/Inventory Projection;
- Q45–Q64 — Material/Form Binding & Generated Forms;
- Q25–Q31 — legacy duplicate resolutions;
- Q32–Q33 — biological lifecycle;
- Q34–Q36 — fluids/gases/installed components;
- Q37–Q42 — machine/structure/portal representation;
- Q47 — hybrid generated-form architecture;
- Q54–Q59 — material-family form profiles;
- Q60–Q63 — containers/composition/visible material/migration;
- relevant portal object identities from P02–P07;
- relevant migration-target constraints from M01.

No FCC-12 ontology decision is reopened.

---

# 172. FCC-13B Completeness Gate

- [x] Block defined as projection
- [x] Item defined as projection
- [x] physical content identity model locked
- [x] Oak Log duplicate resolved
- [x] Stone Brick duplicate resolved
- [x] Cobblestone duplicate resolved
- [x] Oak Beam duplicate resolved
- [x] Clay Roof Tile duplicate resolved
- [x] Oak Plank(s) duplicate resolved
- [x] Clay Brick duplicate resolved
- [x] Cave Mushroom lifecycle split locked
- [x] universal biological lifecycle rule locked
- [x] fluid representation locked
- [x] gas representation locked
- [x] filled-container composite rule locked
- [x] installed-component rule locked
- [x] machine multiblock/root-object model locked
- [x] structure-versus-item boundary locked
- [x] furniture projection locked
- [x] damage-as-state default locked
- [x] portal structure-state model locked
- [x] hybrid generated forms locked
- [x] standard form families bound
- [x] timber form profile locked
- [x] stone form profile locked
- [x] metal form profile locked
- [x] glass/crystal form profile locked
- [x] fibre/textile form profile locked
- [x] ceramic transformation/form boundary locked
- [x] multi-material object composition locked
- [x] visible material inheritance locked
- [x] tool archetype demand bound
- [x] automation archetype demand bound
- [x] six portal object families bound
- [x] portal keystone/core object identities bound
- [x] current realm material/form demand covered
- [x] state/provider/category-only terms prevented from becoming duplicate objects
- [x] old POC prevented from defining final scope
- [x] FCC-13C recipe ownership preserved
- [x] FCC-13D portal-recipe ownership preserved
- [x] FCC-13E migration ownership preserved

---

# 173. FCC-13B Result

> **FCC-13B — DEFINITIVE BLOCK, OBJECT, ITEM, FORM & INVENTORY PROJECTION REGISTRY — CANON WRITING COMPLETE v0.1**

FCC-13 now has:

- durable stable identity rules;
- one canonical physical projection model;
- deterministic standard forms;
- explicit specialist-object boundaries;
- resolved legacy Block/Item duplication;
- material-aware construction forms;
- lifecycle-safe biological representation;
- current-canon realm/object projection targets.

The next document is:

> **FCC-13C — Definitive Recipe, Process, Provider & Quantity Registry**

FCC-13C will turn these objects/forms into executable transformations while preserving exact/provider semantics, conservation, capability-driven processing and the locked global quantity profiles.

FCC-13 remains pending C–E and the final fidelity audit before formal lock.

---

**End of FCC-13B v0.1**
