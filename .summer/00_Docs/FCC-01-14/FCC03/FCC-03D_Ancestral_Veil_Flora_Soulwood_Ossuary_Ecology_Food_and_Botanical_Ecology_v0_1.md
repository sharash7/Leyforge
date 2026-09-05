# Leyforge Final Content Canon Collection

## FCC-03D — Ancestral Veil Flora, Soulwood, Ossuary Ecology, Food & Botanical Ecology

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ancestral Veil  
**Stable Realm ID:** `realm.major.ancestral_veil`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-03A — Realm Identity, Laws, Progression & Canon Boundaries; FCC-03B — Biomes, Terrain, Memory States & Environmental Hazards; FCC-03C — Geology, Materials, Resources, Processing & Provenance  
**Primary Scope:** Native flora, Soulwood/Ossuary tree biology, six named botanical foundations, ambient/procedural plant and fungal ecology, cultivation, botanical resource provenance, food-resource foundations, ecological harvesting, off-realm growth and botanical corruption/restoration boundaries.  
**Final Global Status:** Pending final cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-03D defines the authoritative **botanical and plant-resource ecology** of the Ancestral Veil.

It owns the realm-local canon for:

- the Soulwood/Ossuary tree family;
- the six named core native plant foundations;
- the role of ambient and procedural flora;
- fungi as ecological and resource-supporting life;
- cultivation and propagation;
- botanical food-resource foundations;
- plant-derived fibres, medicines, reagents and ritual ingredients;
- ethical and sustainable harvesting;
- botanical provenance;
- botanical relationships to Veil Soil, Spirit Clay, Grave Salt and other realm materials;
- growth outside the Ancestral Veil;
- restoration, disease and ecological collapse;
- native botanical states versus Void corruption;
- interfaces consumed by creature, settlement, structure, recipe and art-handoff documents.

FCC-03D does **not** own:

- creature behaviour or creature-derived resources, which belong to FCC-03E;
- settlement agriculture, cultural food traditions or trade institutions, which belong to FCC-03F and universal economy systems;
- exact placeable crop blocks, harvest items or food recipes, which belong to FCC-03G and FCC-13;
- exact biome geometry and terrain distribution, which belong to FCC-03B;
- the canonical physical material identity of harvested Soulwood, which belongs to FCC-03C;
- final colour palettes or texture rules, which belong to later material/art governance;
- universal player hunger, nutrition or survival mechanics.

The goal is to make the Ancestral Veil feel like a **living ecosystem with agriculture and botanical economies**, not a barren spectral landscape decorated by a few ghost flowers.

---

# 2. Botanical Canon Statement

The Ancestral Veil contains genuine biological and spirit-active plant life.

Its flora may be:

- fully physical;
- partially spirit-reactive;
- memory-sensitive;
- adapted to mist, salt, reflective water or low-light environments;
- cultivated by resident civilisations;
- used for food, medicine, textiles, construction, wards, records or ceremony;
- capable of ordinary disease and ecological failure;
- capable of Void corruption as a separate external state.

The realm's plant life is **not automatically made from the dead**.

The governing rule is:

> **Veil flora is native ecology first. Memory, remembrance and spirit interaction may modify growth and function, but ordinary botanical existence does not require corpse, soul or afterlife inputs.**

No canonical plant requires routine player or NPC death as its normal growth substrate.

No plant automatically stores a literal person, soul or complete memory.

---

# 3. Canonical Botanical Roster

FCC-03D recognises the following named botanical foundations.

## 3.1 Specialist Tree Family

1. **Ossuary Tree** — living source organism for the specialist timber material **Soulwood**.

## 3.2 Six Core Named Plant Foundations

2. **Mourning Lily**
3. **Memory Reed**
4. **Lantern Moss**
5. **Gravebell**
6. **Mist Fern**
7. **Echo Lotus**

These seven named foundations are the explicit realm-local botanical registry currently locked for Ancestral Veil.

The realm additionally contains unnamed/procedural:

- grasses;
- sedges;
- small mosses;
- groundcover;
- common reeds;
- algae-like growth;
- water plants;
- shrubs;
- minor flowers;
- lichens;
- moulds;
- mushrooms;
- decomposer fungi;
- orchard symbionts.

Ambient/procedural vegetation does **not** require a separately named canonical species for every decorative mesh or worldgen variant.

If a later gameplay dependency requires an additional named botanical species, it must be added through FCC reconciliation rather than silently invented inside an implementation registry.

---

# 4. Botanical Identity Layers

A botanical foundation must distinguish these layers:

| Layer | Meaning |
|---|---|
| Species/family identity | Canonical plant or tree family |
| Biome suitability | Where it can naturally occur |
| Growth state | Seedling, juvenile, mature, flowering, fruiting, dormant, damaged |
| Spirit-active state | Whether specialist Veil interaction is active |
| Environmental state | Wet, dry, saline, mist-saturated, memory-stable, etc. |
| Cultivation state | Wild, tended, orchard-grown, protected, transplanted |
| Harvest state | Ready, harvested, regenerating, exhausted |
| Disease/collapse state | Natural disease, ecological stress, neglect |
| Corruption state | Void exposure, distinct from natural illness |
| Provenance | Source biome/site/settlement where gameplay requires it |

Visual or growth-state change does not automatically create a new species definition.

---

# 5. Ossuary Tree and Soulwood Ecology

## 5.1 Identity

The **Ossuary Tree** is the Ancestral Veil's canonical specialist timber-producing tree family.

`Soulwood` is the harvested/processed material identity governed by FCC-03C.  
`Ossuary Tree` is the living botanical source identity governed here.

The tree may exhibit:

- pale or mineral-influenced bark;
- bone-like branching silhouettes;
- deep root systems;
- spirit-active tissues;
- slow growth;
- high cultural importance;
- restricted environmental suitability.

The term “Ossuary” describes appearance, ecology and cultural association. It does **not** mean the tree must be grown from corpses.

## 5.2 Corpse-Harvesting Supersession

Any older implication that Ossuary Trees require routine dead bodies, imported corpses or player-death remains is superseded.

Canonical growth depends on ecological inputs such as:

- Veil Soil;
- water;
- mineral nutrients;
- Spirit Clay influence where suitable;
- Grave Salt concentrations within safe bounds;
- compatible fungi and microorganisms;
- propagation;
- cultivation;
- long-term orchard stewardship;
- bounded memory/spirit-active environmental states.

A culture may perform memorial rites around an orchard, but those rites are **not the biological fuel requirement** of the tree.

## 5.3 Growth Form

Ossuary Trees may develop:

- pale trunks;
- branching crowns;
- exposed roots;
- mineralised root flares;
- natural hollows;
- branch arches;
- slow-growing heart sections;
- alcoves incorporated into orchard architecture.

Exact voxel geometry, growth generator rules and final visual profile are deferred to worldgen/Forge/art governance.

## 5.4 Growth Requirements

Natural occurrence is strongest in **Ossuary Orchards** but may extend to suitable Crownlands, Hearthlands and cultivated settlements.

Growth variables include:

- compatible Veil Soil profile;
- moisture;
- salinity;
- mineral availability;
- local boundary stability;
- orchard health;
- competition;
- disease;
- tending;
- propagation stock.

Memory/spirit-active state may influence specialist timber quality or flowering/propagation without continuously simulating nearby people's memories.

## 5.5 Propagation

Supported propagation may include:

- seed;
- cutting;
- root division;
- grafting;
- nursery cultivation;
- transplantation.

Implementation may use a bounded subset.

## 5.6 Harvest

Preferred sustainable acquisition includes:

- naturally fallen limbs;
- pruning;
- managed branch harvest;
- deadwood recovery;
- removal of diseased sections;
- planned felling in managed orchards;
- trade;
- salvage from abandoned structures.

Felling mature trees may remain possible, but the game should distinguish renewable stewardship from destructive clear-cutting.

## 5.7 Material Handoff

Once harvested and processed, the material identity becomes **Soulwood** and FCC-03C governs its properties.

FCC-03D supplies:

- valid source;
- source age/health where relevant;
- harvest method;
- biome/site;
- sustainable/destructive provenance;
- spirit-active condition where needed.

---

# 6. Ossuary Orchard Ecology

Healthy Ossuary Orchards are not monocultures by default.

They may contain:

- Ossuary Trees;
- Gravebell;
- Lantern Moss;
- specialist ground fungi;
- decomposer fungi;
- small herbs;
- pollinating/seed-moving wildlife;
- Ossuary Grazers;
- Grave Beetles;
- soil microorganisms;
- irrigation or natural water;
- mineral-rich terraces.

A bounded **orchard-health state** may track:

- mature-tree coverage;
- juvenile recruitment;
- soil condition;
- water;
- disease;
- fungal balance;
- overharvest;
- browsing pressure;
- Grave Salt imbalance;
- boundary instability;
- Void contamination.

Orchard health may influence Soulwood yield, seed availability, plant abundance, wildlife behaviour, settlement production and restoration requirements.

It must not simulate every root, fungal filament or soil organism individually.

Restoration may involve replanting, soil repair, disease removal, hydrology repair, fungal reintroduction, protection from overbrowsing, boundary stabilisation and cleansing.

---

# 7. Mourning Lily

**Mourning Lily** is a Veil-native flowering plant associated with Mourning Mists, memorial gardens and culturally significant sites.

Canonical roles:

- ritual;
- decorative;
- medicinal.

It is **not** a plant that requires grief as fuel.

Suitable habitats include:

- damp Veil Soil;
- misted environments;
- pond margins;
- memorial gardens;
- protected Hearthland cultivation.

Local Mourning Mist conditions may influence flowering or appearance, but grief never becomes a farmable harvest commodity.

Potential product classes include petals, extracts, ritual flowers and pigments where later recipes justify them.

---

# 8. Memory Reed

**Memory Reed** is a wetland and Memory Sea-margin plant used as a renewable fibre and inscription-support resource.

Suitable habitats:

- Memory Sea shallows;
- canals;
- Hearthland ponds;
- Mourning Mist wetlands;
- Processional drainage channels;
- cultivated reed beds.

Canonical use families:

- fibre;
- woven mats;
- baskets;
- screens;
- paper-like/inscription substrates;
- light construction;
- small watercraft components where culturally appropriate;
- selected edible shoots/rhizomes only where FCC-03G explicitly approves them.

Memory Reed is not a magical recording database. Any memory-active inscription behaviour belongs to the crafted substrate/system, not every wild reed instance.

---

# 9. Lantern Moss

**Lantern Moss** is a low-growing Veil-native moss with dim natural luminescence.

It provides:

- low-intensity environmental light;
- route readability;
- decorative cultivation;
- ecological indicator behaviour.

It may grow on:

- damp Memory Stone;
- shaded roots;
- route walls;
- orchard stones;
- cavern surfaces;
- settlement masonry;
- shrine surfaces.

Luminescence may vary with bounded health, moisture, boundary stability or spirit-active state.

Lantern Moss is not a replacement for all artificial lighting.

Potential uses include living route markers, decorative surfaces and minor technical/alchemical reagents where later recipes justify them.

---

# 10. Gravebell

**Gravebell** is a flowering herb associated with stable boundaries, wards, orchard edges and selected alchemical practice.

Canonical roles:

- ward-supporting botanical reagent;
- alchemical ingredient;
- medicinal ingredient;
- ecological boundary indicator.

It does not require graves or corpses despite its name.

Suitable habitats include:

- Ossuary Orchards;
- boundary-managed gardens;
- Processional Road verges;
- Crownland estates;
- selected Hearthland shrine plots.

It may visibly respond to boundary instability using bounded environment states.

---

# 11. Mist Fern

**Mist Fern** is a moisture-loving fern adapted to the Mourning Mists and other fog-heavy regions.

Primary roles:

- medicine;
- environmental indicator;
- groundcover;
- restoration planting.

Suitable habitats include:

- saturated Veil Soil;
- shaded banks;
- fog-heavy plains;
- ruined garden terraces;
- wetland settlements.

Raw Mist Fern is not automatically edible. Food use requires an explicit safe recipe.

---

# 12. Echo Lotus

**Echo Lotus** is a Memory Sea and still-water flowering plant that interacts with bounded environmental echoes.

It does not contain souls or complete person-records.

Suitable habitats:

- Memory Sea coves;
- sheltered archive pools;
- Hearthland ponds;
- Drowned Remembrance sites;
- cultivated water gardens.

Echo Lotus may:

- change flowering state around strong environmental echoes;
- hold simple temporary impression states;
- support calibrated ritual/technical preparations;
- indicate stable memory-active water.

It may not record unlimited dialogue, identity or world history.

Canonical use families include botanical reagent, decoration, memory-sensitive indicator and cultural flower. Food/beverage use requires explicit later recipe approval.

---

# 13. Ambient and Procedural Flora

The six named plants are not the entirety of Ancestral vegetation.

Worldgen may populate biomes with procedural families such as:

- short grasses;
- pale sedges;
- common reeds;
- shoreline algae;
- small mosses;
- non-luminous mosses;
- low shrubs;
- minor flowers;
- floating water plants;
- vine-like growth;
- lichen-like crusts;
- fungal shelves;
- mushrooms;
- mould mats;
- decomposer patches.

These may vary by biome, moisture, terrain, seed, age, disturbance, settlement and ecological state.

They do not require individually named species unless they gain distinct gameplay significance.

---

# 14. Fungal Ecology

The FCC interview established that the Veil supports multiple fungal roles, but **no additional named major fungal species was individually locked**.

FCC-03D therefore does not invent one.

Fungi exist as bounded ecological/resource classes:

1. **Orchard Symbionts** — support Ossuary Tree/root health.
2. **Decomposer Fungi** — recycle biological matter.
3. **Wetland Fungi** — occupy damp Hearthland/Mourning environments.
4. **Archive/Stone Fungi** — grow on compatible old structures/mineral surfaces.
5. **Food-Capable Fungi** — selected safe edible mushrooms.
6. **Medicinal/Toxic Fungi** — selected groups used by medicine/alchemy.

A future named fungal species may be admitted only when a concrete gameplay, recipe, creature or art dependency requires it.

Decomposer fungi may consume dead biomass normally. They do **not** produce generic soul essence.

---

# 15. Botanical Biome Suitability

| Botanical Foundation | Primary Suitability | Secondary Suitability |
|---|---|---|
| Ossuary Tree | Ossuary Orchards | Crownlands, cultivated Hearthlands |
| Mourning Lily | Mourning Mists | memorial Hearthlands, Crownland gardens |
| Memory Reed | Memory Sea margins | Hearthland wetlands, Mourning Mists |
| Lantern Moss | Processional Roads, shaded structures | Ossuary Orchards, Hearthlands, Crownlands |
| Gravebell | Ossuary Orchards | Processional Roads, Crownlands, shrine gardens |
| Mist Fern | Mourning Mists | wet Hearthlands, shaded orchards |
| Echo Lotus | Memory Sea | still-water Hearthlands, archive pools |

This is suitability, not guaranteed spawn density.

Predator Dark and Forgotten City Reflections may contain sparse, damaged, reclaimed or site-specific populations rather than broad botanical abundance.

---

# 16. Food-System Boundary

Physical/native biological inhabitants may require and consume food.

Incorporeal or semi-corporeal inhabitants do not automatically use the same hunger model.

Universal player hunger, nutrition and survival systems remain outside FCC-03D ownership.

The realm nevertheless requires a believable food economy for biological populations.

---

# 17. Canonical Food-Resource Foundation Classes

The FCC interview locked a **modest 4–6 food-resource foundation**, not a giant unique crop catalogue.

FCC-03D locks five food-resource classes without inventing unapproved recipe-level fantasy names:

1. **Cultivated wetland/root food**
2. **Edible reed/shoot resource**
3. **Edible fungal resource**
4. **Memory Sea biological food resource**
5. **Medicinal/culinary herb and flower resource**

These classes may be fulfilled through:

- Memory Reed edible parts where safe;
- cultivated root/bulb crops adapted to Veil Soil;
- selected edible fungi;
- Memory Sea fish/aquatic life;
- safe cultivated herbs;
- imported ordinary staples.

Exact crop names, dish names, nutrition values and cooking recipes belong to FCC-03G/FCC-13.

This preserves the approved modest food scope without manufacturing a large unapproved cuisine.

---

# 18. Cultivation and Agriculture

Veil societies may cultivate:

- Ossuary Trees;
- Memory Reed;
- Mourning Lily;
- Lantern Moss;
- Gravebell;
- Mist Fern;
- Echo Lotus;
- edible fungi;
- root/bulb food crops;
- imported compatible crops.

Cultivation may depend on:

- Veil Soil quality;
- moisture;
- water;
- salinity;
- boundary stability;
- light;
- hazard state;
- settlement maintenance.

FCC-03D consumes universal farming mechanics wherever practical:

- tilling;
- irrigation;
- planting;
- growth stages;
- harvest;
- replanting;
- fertility;
- storage;
- protected cultivation.

Realm-specific conditions layer on top rather than replacing agriculture.

---

# 19. Off-Realm Cultivation

Some Ancestral plants may grow outside the Veil.

Default rule:

> **Physical survival may remain possible off-realm, while specialist spirit-active properties may require Veil-like conditions or stabilisation.**

Possible support requirements:

- suitable soil;
- controlled humidity;
- Grave Salt;
- spirit-active substrate;
- Memory Glass/Echo Pearl environmental equipment;
- warding;
- greenhouse cultivation;
- periodic maintenance.

Examples:

- Memory Reed may survive but lose specialist inscription behaviour.
- Lantern Moss may glow less strongly.
- Gravebell may lose reliable boundary-indicator behaviour.
- Ossuary Tree cultivation may remain especially demanding.

Exact cross-realm recipes and progression gates are deferred until the realm network is complete.

---

# 20. Harvesting and Regeneration

Each botanical source should define:

- harvested part;
- whether harvest kills the plant;
- regrowth;
- tools if relevant;
- renewable/non-renewable yield;
- propagule return;
- overharvest impact;
- wild versus cultivated difference.

The preferred rule is:

> **Renewable plant resources should normally support renewable harvesting unless scarcity is central to their identity.**

Examples:

- Memory Reed regrows after cutting.
- Moss can be harvested in patches.
- Flowers return through flowering cycles.
- Orchards provide renewable prunings/propagation stock.
- Soulwood whole-tree harvest remains slow and consequential.

---

# 21. Botanical Provenance

Botanical products may retain bounded provenance where useful:

- species/family;
- realm;
- biome;
- wild/cultivated;
- orchard/settlement;
- harvest method;
- health/quality;
- spirit-active state;
- corruption status.

Common bulk food should not carry so much provenance that normal stacking becomes impractical.

Rare Soulwood, ritual botanicals and contested orchard products may preserve richer provenance.

---

# 22. Botanical Resource Roles

## Construction / Fibre
- Memory Reed
- Soulwood

## Medicine
- Mourning Lily
- Mist Fern
- Gravebell
- selected fungi

## Wards / Alchemy
- Gravebell
- Echo Lotus
- selected fungi

## Lighting / Navigation
- Lantern Moss

## Food
- cultivated roots/bulbs
- edible Memory Reed parts where safe
- edible fungi
- culinary herbs/flowers
- Memory Sea biological food via FCC-03E

## Ceremony / Culture
- Mourning Lily
- Gravebell
- Echo Lotus
- Soulwood
- memorial gardens

One plant may serve several roles without creating separate species definitions.

---

# 23. Disease, Ecological Stress and Natural Decay

The Veil supports ordinary plant disease and ecological failure.

Possible bounded states include:

- wilt;
- fungal imbalance;
- root disease;
- salinity stress;
- waterlogging;
- drought;
- orchard exhaustion;
- pest pressure;
- overbrowsing;
- overharvest;
- soil depletion;
- boundary-instability effects.

Natural disease is **not Void corruption**.

Natural decay may be harmful, neutral or necessary for nutrient cycling.

---

# 24. Void Corruption

Void corruption is an external influence, not the natural dark side of Veil ecology.

Early botanical corruption should normally use:

- growth-state changes;
- contamination;
- abnormal spread;
- reduced yield;
- altered spirit-active behaviour;
- hazard overlays;
- distorted morphology.

Only severe permanent transformation with distinct gameplay identity may become a separate canonical flora/material definition.

FCC-03C identifies **Corrupted Soulwood** as a possible transformed material where justified.

FCC-03D does not automatically create separate Corrupted versions of the six named plants.

---

# 25. Restoration Ecology

Botanical restoration may follow:

- disease;
- overharvest;
- settlement abandonment;
- Mourning Mist crisis;
- Necropolis instability;
- water-route failure;
- invasive growth;
- Void exposure.

Restoration may involve:

- seed collection;
- replanting;
- soil amendment;
- hydrology repair;
- fungal balancing;
- contamination removal;
- boundary stabilisation;
- protected regrowth;
- wildlife reintroduction;
- culturally appropriate stewardship.

Successful restoration should alter actual ecological state rather than only toggle a quest flag.

---

# 26. Creature Interfaces

FCC-03D provides habitat/resource hooks for FCC-03E.

Examples:

- **Memory Moth** ↔ flowering plants, cocoon surfaces, Veil Silk ecology.
- **Ossuary Grazer** ↔ orchard browsing, pruning pressure, seed propagation.
- **Grave Beetle** ↔ decomposition and soil cycling.
- **Memory Koi / Mourning Eel / Echo Ray** ↔ Memory Sea vegetation and food web.
- **Mist Strider** ↔ Mourning Mist ground flora and wetlands.

FCC-03E owns exact diets, AI and spawn rules.

---

# 27. Settlement and Civilisation Interfaces

FCC-03F may consume the botanical layer for:

- orchards;
- gardens;
- reed beds;
- food plots;
- herb cultivation;
- medicinal gardens;
- Lantern Moss routes;
- shrine gardens;
- restoration gardens;
- aquaculture interfaces;
- Soulwood stewardship;
- culturally restricted harvest areas.

Cultural differences do not create duplicate biological species.

---

# 28. Structure and Recipe Interfaces

FCC-03G may define concrete content such as:

- Soulwood building forms;
- reed screens;
- woven reed panels;
- drying racks;
- cultivation beds;
- orchard infrastructure;
- moss route markers;
- botanical reagents;
- prepared medicines;
- cooked foods;
- planting items;
- seeds/propagules;
- greenhouse/stabilisation equipment.

FCC-03G must not invent new major Veil flora without reconciliation.

---

# 29. Block and Plant Identity Rule

Plant content follows the global single-definition rule.

Valid examples:

- Memory Reed Plant Block harvested into a distinct portable reed/fibre Item if harvesting transforms it.
- Echo Lotus Plant Block harvested into a blossom Item if blossom and planted organism are different lifecycle objects.
- Lantern Moss Surface Growth recovered as the same placement using a generated Block Inventory Projection where appropriate.

Invalid examples:

- separately authored identical Lantern Moss Block + Lantern Moss Block Item;
- duplicate species for cosmetic colour states;
- duplicate crop species solely for growth stages.

Growth stages should be runtime/block states where supported.

---

# 30. Botanical Visual Identity Handoff

Later art governance must distinguish:

- Ossuary bark and Soulwood timber;
- wetland reeds;
- luminous moss;
- memorial flowers;
- boundary flowers;
- mist-adapted ferns;
- Memory Sea aquatic flora;
- fungi;
- healthy/diseased states;
- native decay;
- Void corruption.

The realm should not become uniformly grey, white or transparent simply because it is spirit-themed.

Exact palettes remain deferred.

---

# 31. Working Botanical Registry

| Working Canonical ID | Display Name | Type | Primary Role |
|---|---|---|---|
| `flora.ancestral.ossuary_tree` | **Ossuary Tree** | Specialist tree | Source of Soulwood; orchard ecology |
| `flora.ancestral.mourning_lily` | **Mourning Lily** | Flower | Ritual, decorative, medicinal |
| `flora.ancestral.memory_reed` | **Memory Reed** | Wetland plant | Fibre, inscription substrate, selected food |
| `flora.ancestral.lantern_moss` | **Lantern Moss** | Moss | Low light, route/environment indicator |
| `flora.ancestral.gravebell` | **Gravebell** | Flower/herb | Ward support, alchemy, medicine |
| `flora.ancestral.mist_fern` | **Mist Fern** | Fern | Medicine, restoration, mist ecology |
| `flora.ancestral.echo_lotus` | **Echo Lotus** | Aquatic flower | Echo interaction, reagent, cultural use |

Exact namespaces may be normalised in FCC-12/FCC-13.

**Display names and biological identities are realm-locally locked.**

---

# 32. Source Reconciliation Register

| Earlier Direction | FCC-03D Resolution |
|---|---|
| Ossuary Orchards as bone-white tree region | Retained and expanded as living orchard ecology |
| Soulwood as specialist material | Retained; source clarified as Ossuary Tree |
| Routine corpse-fed tree implications | Superseded |
| Veil as death-only ecology | Superseded; full biological plant ecology required |
| Mourning Mists linked to grief | Retained environmentally; grief cannot be farmed |
| Six core named plants | Retained exactly |
| Earlier broad 8–12 plant/fungal expectation | Satisfied through seven named botanical foundations plus ambient/procedural fungal/ecological classes; no unapproved extra named species invented |
| Modest 4–6 food-resource foundation | Implemented as five food-resource classes |
| Physical inhabitants may eat | Retained |
| Incorporeal beings use ordinary hunger | Not assumed |
| Generic Ancestral Essence | Not a botanical resource |
| Natural decay equals Void corruption | Rejected |
| Automatic Corrupted version of every plant | Rejected |
| Every ambient flower/mushroom needs stable species ID | Rejected |

---

# 33. Cross-Document Interfaces

## FCC-03A
Supplies realm identity, death/personhood boundaries and completeness contract.

## FCC-03B
Supplies eight biomes, environmental states and hazard suitability.

## FCC-03C
Supplies Veil Soil, Spirit Clay, Grave Salt and Soulwood material identity.

## FCC-03E
Consumes habitats, orchard ecology and food-web resources.

## FCC-03F
Consumes agriculture, botanical economy and stewardship.

## FCC-03G
Consumes harvestable resources, planting content, food-resource classes and processed botanical materials.

## FCC-03H
May consume rare plants, restoration objectives and botanical dungeon content.

## FCC-03I
Owns full corruption/restoration cross-system logic and irreversible-transformation admission.

## FCC-03J
Certifies no orphan flora, missing provenance, corpse economy or unapproved species proliferation.

---

# 34. Performance and Simulation Scaling

Botanical canon remains identical across performance profiles.

Lower-end modes may reduce:

- visible plant density;
- distant animation;
- particle effects;
- update frequency;
- individual ambient fungus instances;
- off-screen ecology tick frequency.

They may not change:

- named species existence;
- authoritative harvest quantities;
- orchard-health results;
- crop completion;
- ownership;
- resource conservation;
- corruption/restoration outcomes;
- relevant sustainable/destructive provenance.

Ambient flora may be aggressively instanced, clustered or culled without changing ecological truth.

---

# 35. FCC-03D Acceptance Gate

FCC-03D is ready for realm-local acceptance only when:

- Ossuary Tree is defined as a genuine native plant, not corpse-fed afterlife infrastructure;
- Soulwood material ownership correctly hands off to FCC-03C;
- the six named core plants are preserved exactly:
  - Mourning Lily;
  - Memory Reed;
  - Lantern Moss;
  - Gravebell;
  - Mist Fern;
  - Echo Lotus;
- ambient flora is supported without registry explosion;
- fungal ecology exists without inventing unapproved named major fungal species;
- Ossuary Orchard ecology and health are bounded and implementable;
- no grief-farming or soul-farming botanical economy exists;
- biological inhabitants have a plausible food base;
- five food-resource classes satisfy the accepted modest 4–6 range;
- recipe-level dish/crop names remain correctly deferred;
- cultivation consumes universal farming systems where practical;
- off-realm growth supports bounded specialist-property constraints;
- harvesting/regeneration supports renewable stewardship;
- natural disease/decay remain distinct from Void corruption;
- corruption does not automatically duplicate every plant definition;
- creature, settlement and recipe interfaces are explicit;
- plant Block/Item identity follows the global single-definition rule;
- botanical art-handoff needs are clear.

**FCC-03D Status:** **REALM-LOCAL LOCK CANDIDATE — pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**
