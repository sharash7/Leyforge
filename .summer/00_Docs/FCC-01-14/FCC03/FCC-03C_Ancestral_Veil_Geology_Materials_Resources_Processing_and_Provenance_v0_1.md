# Leyforge Final Content Canon Collection

## FCC-03C — Ancestral Veil Geology, Materials, Resources, Processing & Provenance

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ancestral Veil  
**Stable Realm ID:** `realm.major.ancestral_veil`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-03A — Realm Identity, Laws, Progression & Canon Boundaries; FCC-03B — Biomes, Terrain, Memory States & Environmental Hazards  
**Primary Scope:** Geology, terrain-material foundations, canonical resources, provenance, physical/spirit-active material behaviour, processing foundations, export/stabilisation, derived-form eligibility, block/item identity boundaries and resource-economy exclusions.  
**Final Global Status:** Pending final cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-03C defines the authoritative **material and resource foundation** of the Ancestral Veil.

It owns the realm-local canon for:

- the Veil's ordinary geological substrate;
- its eleven major physical material foundations;
- the relationship between common terrain matter and specialist realm resources;
- legitimate sources and provenance;
- broad extraction and processing pathways;
- physical versus spirit-active behaviour;
- export and stabilisation expectations;
- sensible derived-form eligibility;
- material-state versus separate-material decisions;
- the treatment of corruption, contamination and irreversible transformation;
- resource ethics and non-extractive alternatives;
- block-versus-item identity boundaries;
- source-ID preservation for the six Atlas realm resources;
- removal of generic soul and essence economies.

FCC-03C does **not** own:

- exact biome geometry or hazard simulation, which belongs to FCC-03B;
- the biological life cycle of Soulwood/Ossuary flora, which belongs to FCC-03D;
- creature behaviour and harvest ecology, which belongs to FCC-03E;
- civilisation-specific production chains and trade institutions, which belong to FCC-03F and universal economy systems;
- exact placeable block catalogues, portable item catalogues and recipes, which belong to FCC-03G and later FCC-13 reconciliation;
- final Void-corrupted material registry admission, which is reconciled through FCC-03I and FCC-03J;
- final material colour, texture and art-profile values, which are deliberately deferred to the later Material, Colour & Texture Style Governance collection.

The goal is to make the realm **materially complete without manufacturing a material × shape explosion**.

---

# 2. Material Canon Statement

The Ancestral Veil is not made entirely from ghosts, souls, bones or metaphysical energy.

It is a physically inhabitable realm containing:

- stone;
- soil;
- clay;
- mineral salts;
- metallic deposits;
- glass-like mineral formations;
- timber;
- biological fibres;
- aquatic biominerals;
- ash-like mineral and ritual compounds;
- imported ordinary materials;
- specialist matter that interacts with incorporeal or memory-active phenomena.

The governing principle is:

> **Every canonical Veil material requires a legitimate source, a distinct physical or gameplay role, and a bounded state model. Spirit theming alone does not justify a new material family.**

The Ancestral Veil therefore contains exactly **eleven major physical material foundations** at realm-local FCC level:

### Geological / terrain / construction foundations

1. **Memory Stone**
2. **Veil Soil**
3. **Spirit Clay**

### Principal Atlas resource foundations

4. **Ancestor Ash**
5. **Memory Glass**
6. **Oathbone**
7. **Veil Silk**
8. **Grave Salt**
9. **Echo Pearl**

### Specialist material foundations

10. **Soul Silver**
11. **Soulwood**

`Ancestral Essence` is **not** a physical inventory material.

There is no generic `Soul`, `Soul Fragment`, `Soul Fuel`, `Spirit Essence`, `Dead NPC Essence` or equivalent universal resource produced by ordinary death.

---

# 3. Resource-Layer Architecture

An Ancestral Veil material may participate in several distinct data layers. These layers must not be collapsed into one registry definition.

| Layer | Meaning | Example |
|---|---|---|
| **Source foundation** | Why and where a resource exists in the world | Memory Glass mineral formation |
| **World source** | The actual terrain node, organism, deposit, crop, structure or authorised process | Memory Glass seam; Memory Moth cocoon |
| **Material identity** | The canonical substance being processed or built with | Memory Glass; Veil Silk |
| **Processed material** | A materially changed portable form | Soul Silver Ingot; Veil Silk Cloth |
| **Component** | A crafted portable part used in assemblies | calibrated Echo Pearl core; Soul Silver fitting |
| **Placeable block** | Canonical placed world object or building material | Memory Stone Brick |
| **Block inventory projection** | Inventory reference to that same canonical Block | generated Memory Stone Brick projection |
| **Installed assembly** | Functional placed object using one or more materials | Memory Glass archive panel |
| **Runtime state** | Condition attached to an instance, batch, site or block | contamination, calibration, memory charge, provenance |
| **Loot/reward context** | Rule that transfers an existing material/item to the player | archive salvage; authority gift |
| **Economy context** | Supply, demand, legality, cultural value and trade | Soul Silver restricted market |

A resource foundation does not automatically create an Item.  
A material does not automatically create every possible Block shape.  
A source node does not automatically drop itself.  
A placeable block does not automatically require a duplicate Item definition.

---

# 4. Set 24 Realm Resource Reconciliation

The World Content Atlas established six Ancestral Veil resource anchors:

| Atlas Source Anchor | Canonical Name |
|---|---|
| `res.realm.ancestral_veil.01` | **Ancestor Ash** |
| `res.realm.ancestral_veil.02` | **Memory Glass** |
| `res.realm.ancestral_veil.03` | **Oathbone** |
| `res.realm.ancestral_veil.04` | **Veil Silk** |
| `res.realm.ancestral_veil.05` | **Grave Salt** |
| `res.realm.ancestral_veil.06` | **Echo Pearl** |

These **names and source anchors remain canonical**.

The Atlas intentionally distributed each realm's six resources across generic role slots so that a realm would not become a single-ore excursion. Those Atlas role labels are **planning roles, not final physical taxonomy**.

FCC-03C therefore supersedes the older generic role assignment where it conflicts with the final material definition.

For example:

- Oathbone is **not** a flexible fibre simply because its Atlas slot was labelled “fibre / flexible material.”
- Veil Silk is a genuine biological fibre, even though its Atlas slot carried an “optical / inscription” planning label.
- Grave Salt is a mineral salt and stabilisation/preservation reagent, not a biological growth medium merely because of its generic Atlas slot.
- Memory Glass is an optical/recording mineral with catalyst/interface uses, not a generic energy commodity.

This reconciliation preserves stable content history while making the physical canon coherent.

---

# 5. Canonical Material Classification Matrix

| Material | Primary Class | Commonness | Spirit-Active? | Major Construction? | Portable Processing? | Primary Provenance |
|---|---|---:|---:|---:|---:|---|
| **Memory Stone** | Geological stone | Common | Mild/contextual | Yes | Yes, where transformation is useful | Native geology |
| **Veil Soil** | Terrain substrate | Common | Contextual | Terrain/fill only | Limited | Native substrate |
| **Spirit Clay** | Clay/ceramic | Common–regional | Yes after suitable processing | Yes | Yes | Native clay deposits |
| **Ancestor Ash** | Powder/additive | Regional | Ritual/contextual | Additive only | Yes | Natural ash-like deposits + authorised processes |
| **Memory Glass** | Translucent mineral | Uncommon | Yes | Selected | Yes | Native mineral formations |
| **Oathbone** | Binding-law mineral | Uncommon | Yes | Specialist only | Yes | Mineral growth around valid binding contexts |
| **Veil Silk** | Biological fibre | Uncommon | Yes | Membranes/screens only | Yes | Memory Moth ecology |
| **Grave Salt** | Mineral salt | Regional | Yes | No universal solid-block family | Yes | Evaporite/boundary deposits |
| **Echo Pearl** | Aquatic biomineral | Uncommon–rare | Yes | No general masonry | Yes | Memory Sea organisms |
| **Soul Silver** | Specialist metal | Rare | Strongly | Selected fittings/structures | Yes | Veil-native metallic deposits |
| **Soulwood** | Specialist timber | Regional/restricted | Yes | Selected only | Yes | Ossuary/Soulwood tree ecology |

**Commonness is a content-category direction, not a fixed spawn percentage.** Exact numerical rarity and node density remain balancing/worldgen data.

---

# 6. Memory Stone

## 6.1 Identity

**Memory Stone** is the Ancestral Veil's ordinary native structural stone family.

It is the realm's default masonry-grade geological foundation and must remain clearly distinct from **Memory Glass**.

Memory Stone may carry subtle realm-specific features such as:

- pale or dark inclusions;
- layered sediment-like banding;
- echo staining;
- faint inscription-like natural fractures;
- fossil-like memory impressions;
- culturally applied name marks;
- local polish, weathering or spirit-active treatments.

These do not create separate materials unless they alter physical behaviour or gameplay identity enough to justify a new definition.

## 6.2 Occurrence

Memory Stone can occur throughout the realm, with regional variation controlled by FCC-03B biome profiles.

It is especially suitable for:

- Echoing Hearthland foundations;
- Processional Road causeways;
- archive foundations;
- Crownland civic construction;
- Memory Sea cliffs and islands;
- Necropolis masonry;
- underground or submerged historical structures.

## 6.3 Uses

Canonical use families include:

- foundations;
- roads;
- bridges;
- retaining walls;
- civic masonry;
- archive shells;
- dungeon construction;
- pillars;
- portals and portal foundations;
- settlement infrastructure;
- decorative carved stone.

## 6.4 Derived-Form Eligibility

Permitted where supported by the final block registry:

- natural Memory Stone;
- cut Memory Stone;
- Memory Stone brick;
- slab;
- stair;
- wall;
- pillar;
- arch or trim form where the construction system supports it.

A shape exists only when the game has a meaningful construction or visual use for it.

---

# 7. Veil Soil

## 7.1 Identity

**Veil Soil** is the canonical broad native soil/substrate family.

It prevents the realm from requiring a separate canonical material ID for every local soil colour, moisture level, ash mixture, orchard condition or memory state.

## 7.2 State and Regional Variation

Veil Soil may carry state/profile differences such as:

- dry;
- damp;
- saturated;
- fertile;
- saline;
- ash-enriched;
- orchard-conditioned;
- mist-saturated;
- route-compacted;
- disturbed;
- restored;
- Necropolis-treated;
- Void-contaminated.

These are normally **states or terrain profiles**, not independent material families.

## 7.3 Uses

Veil Soil supports:

- native flora;
- agriculture where appropriate;
- path/fill systems;
- orchard ecology;
- restoration;
- excavation;
- clay-forming environments;
- settlement terrain adaptation.

If a harvested soil component becomes a chemically or functionally different portable material, FCC-03G may define that item separately.

---

# 8. Spirit Clay

## 8.1 Identity

**Spirit Clay** is a native malleable clay family capable of supporting both ordinary ceramic production and specialist spirit-active ceramic states.

It is a genuine physical clay. It is not condensed soul matter.

## 8.2 Occurrence

Spirit Clay is most plausibly associated with:

- river and canal margins;
- Memory Sea basins;
- damp lowlands;
- old settlement strata;
- depositional basins;
- selected Necropolis worksites.

Exact node placement remains worldgen-owned.

## 8.3 Processing Foundations

The broad processing pathway is:

> **Spirit Clay deposit / clay body → harvested clay → shaped clay → dried or fired ceramic → optional specialist treatment**

Supported product families may include:

- brick;
- tile;
- pottery;
- sealed vessels;
- inscription tablets;
- archive ceramics;
- spirit-compatible screens;
- ritual or technical ceramic components.

Firing, inscription, treatment and spirit activation are **processing states**, not excuses to create duplicate material families unless composition materially changes.

---

# 9. Ancestor Ash

## 9.1 Identity

**Ancestor Ash** is a fine Veil-native ash/mineral/ritual additive used in construction, inscription, stabilisation and cultural processes.

Despite its name, it is **not defined as the cremated remains of ordinary dead NPCs** and does not require corpse processing.

The term may carry different cultural interpretations across Veil societies, but its canonical gameplay identity is a legitimate material resource.

## 9.2 Provenance

Valid source classes include:

- natural ash-like mineral strata or deposits;
- residue from specific Veil-native ecological or geological processes;
- authorised ceremonial production;
- controlled settlement processing;
- salvage from suitable old ritual or architectural deposits;
- specifically authored cultural sources.

A culture may use literal funerary ash in a specific ceremony, but that does not redefine the universal material family or create a corpse-farming loop.

## 9.3 Uses

Canonical roles include:

- memorial mortar additive;
- specialist plaster;
- ritual and archival inks;
- inscription compounds;
- cleansing or stabilisation mixtures;
- cultural construction recipes;
- selected warding mixtures.

Ancestor Ash is **not** a general load-bearing block family.

---

# 10. Memory Glass

## 10.1 Identity

**Memory Glass** is a naturally occurring translucent Veil mineral with bounded recording, optical and spirit-interface properties.

It is separate from:

- ordinary manufactured glass;
- Memory Stone;
- Somnolent dream-glass families;
- generic mana crystal;
- arbitrary “magic crystal” categories.

## 10.2 Occurrence

Memory Glass forms under suitable Veil geological conditions, especially where long-term memory-active environments interact with compatible mineral strata.

Possible source forms include:

- seams;
- crystalline plates;
- translucent nodules;
- vein-like deposits;
- exposed cliff or cavern faces;
- reclaimed historic construction.

The exact world-block form is owned by FCC-03G/J.

## 10.3 Bounded Memory Interaction

Memory Glass may:

- hold authored or system-approved impressions;
- display recorded state;
- support archive interfaces;
- improve perception of selected spirit-active phenomena;
- act as a calibrated lens or recording surface;
- participate in Veilgate interfaces.

Memory Glass does **not**:

- automatically record every nearby event;
- preserve unlimited raw dialogue;
- duplicate NPC memory;
- reconstruct arbitrary persons without authored/system support;
- bypass permissions or knowledge systems.

## 10.4 Derived-Form Eligibility

Potential forms include:

- pane;
- lens;
- calibrated plate;
- archive surface;
- inlay;
- viewing panel;
- recording component.

It does not need a full stair/slab/wall family merely because it is rigid.

---

# 11. Oathbone

## 11.1 Identity

**Oathbone** is a bone-like Veil mineral growth associated with established binding contexts, recognised obligations and selected law-active sites.

It is not ordinary bone and is not harvested from generic corpses.

## 11.2 Formation

Oathbone may form where:

- durable agreements are formally recorded;
- route or court obligations remain active;
- specialist binding structures maintain long-lived legal states;
- ritual or civic systems deliberately cultivate it;
- old binding infrastructure mineralises over time.

The exact formation system must use **explicit game-state references**. Oathbone does not interpret unrestricted natural language.

## 11.3 Physical Behaviour

Oathbone is:

- rigid in stable mature form;
- suitable for carved seals and structural fittings;
- temporarily shapeable under valid formation/binding conditions where supported;
- capable of preserving a bounded link to a recognised agreement or binding context.

## 11.4 Uses

- seals;
- archive locks;
- rigid components;
- ritual fittings;
- route markers;
- court infrastructure;
- specialist architectural joinery;
- selected tools or devices.

Oathbone is **not a fibre** in final FCC taxonomy.

---

# 12. Veil Silk

## 12.1 Identity and Source

**Veil Silk** is a biological spirit-interactive fibre produced primarily by the canonical **Memory Moth** ecology.

FCC-03E owns detailed creature behaviour; FCC-03C owns the material identity and processing boundary.

## 12.2 Legitimate Acquisition

Supported acquisition may include:

- abandoned cocoons;
- naturally shed material;
- collected webbing;
- managed cultivation;
- cooperative/symbiotic production;
- trade;
- authorised ecological harvesting.

Creature slaughter is not required as the normal source.

## 12.3 Processing Foundations

The broad chain is:

> **raw Veil Silk → cleaned fibre → thread → woven cloth / screen / binding**

Possible products include:

- cloth;
- garments;
- screens;
- filters;
- bindings;
- lightweight membranes;
- spirit-interactive barriers;
- archive covers;
- specialist ritual textiles.

Veil Silk may also carry provenance or quality where needed, but origin and quality should remain runtime/batch state rather than generating unnecessary definition variants.

---

# 13. Grave Salt

## 13.1 Identity

**Grave Salt** is a naturally occurring Veil mineral salt associated with:

- boundary stability;
- preservation;
- spirit-active containment;
- cleansing;
- route and portal stabilisation.

It is not produced from corpses.

## 13.2 Occurrence

Grave Salt may occur as:

- evaporite deposits;
- shoreline or basin crusts;
- boundary-active mineral veins;
- cave deposits;
- processed settlement salts.

Biome suitability is consumed from FCC-03B.

## 13.3 Uses

- ward boundaries;
- preservation;
- cleansing mixtures;
- archive protection;
- Veilgate stabilisation;
- route anchors;
- alchemy;
- controlled containment;
- ritual marking.

It normally exists as:

- loose mineral;
- crystal/salt deposit;
- processed salt;
- reagent;
- installed mixture.

A full masonry family such as Grave Salt stairs, walls and pillars is **not** canonical by default.

---

# 14. Echo Pearl

## 14.1 Identity

**Echo Pearl** is an aquatic biomineral produced by Memory Sea ecology.

It accumulates bounded environmental echo patterns rather than souls.

## 14.2 Source

The canonical large **Echo Ray** is a major source organism, while compatible smaller Memory Sea organisms may also produce related pearls if FCC-03E explicitly admits them.

Harvesting should support ecological and non-lethal acquisition routes where practical.

## 14.3 Uses

- route stabilisation;
- navigation instruments;
- archive calibration;
- memory-sensitive devices;
- jewellery;
- cultural offerings;
- Veilgate core/keystone functions;
- specialist boundary devices.

## 14.4 Forms

Echo Pearl can support:

- natural pearl;
- cleaned/polished pearl;
- calibrated core;
- cut/inlaid component;
- jewellery setting.

It is not a general construction-stone family.

---

# 15. Soul Silver

## 15.1 Identity

**Soul Silver** is a distinct Veil-native specialist metal with unusually strong interaction with incorporeal, spirit-active and identity-sensitive systems.

Despite the name, it does **not contain harvested souls**.

It is materially distinct from ordinary silver in:

- geological provenance;
- processing behaviour;
- spirit interaction;
- visual identity;
- recipe role.

## 15.2 Geological Source

Soul Silver occurs as **Veil-native metallic mineralisation** in suitable geological zones.

The canonical source model is:

> **Soul Silver-bearing deposit / vein → extracted raw Soul Silver ore or concentrate → refined Soul Silver metal**

Exact ore-block geometry, tool tier, smelting temperature and recipe quantities are implementation/balance details owned later.

## 15.3 Processing Foundations

Supported refined forms may include:

- ingot;
- plate;
- wire;
- rod or fitting where mechanically justified;
- fastener;
- calibrated component;
- specialist equipment component.

## 15.4 Uses

- spirit-interactive tools;
- selected weapons;
- archive mechanisms;
- Veilgate fittings;
- boundary devices;
- route infrastructure;
- precision components;
- jewellery;
- mixed physical/spiritual construction.

Soul Silver is **specialist metal**, not the realm's everyday structural iron replacement.

---

# 16. Soulwood

## 16.1 Identity

**Soulwood** is the specialist timber family obtained from canonical Ossuary/Soulwood tree ecology.

Its biological source, growth conditions and harvesting ethics are owned by FCC-03D.

Soulwood is not:

- generic “wood containing souls”;
- an unlimited ordinary timber replacement;
- proof that every Ossuary structure is made of literal bone;
- a required material for all Veil construction.

## 16.2 Role

Soulwood is reserved for uses that benefit from its spirit-active or memorial properties:

- memorial objects;
- archive furniture;
- ritual doors;
- screens;
- fine joinery;
- spirit-compatible fittings;
- selected sacred/civic architecture;
- specialist devices.

## 16.3 Derived-Form Eligibility

Where the source biology supports it:

- log/source wood;
- timber stock;
- selected planks;
- beams;
- panels;
- carved joinery;
- specialist furniture/components.

Mass-construction eligibility is intentionally narrower than ordinary timber.

---

# 17. Imported and Universal Materials

The Ancestral Veil is not materially isolated.

Settlements, visitors and industries may use imported or universally defined materials such as:

- ordinary metals;
- ordinary glass;
- conventional timber;
- stone;
- cloth;
- ceramics;
- machine parts;
- food containers;
- tools;
- fuels;
- mana components;
- cross-realm specialist resources.

The presence of imported iron, copper, steel or ordinary timber does **not** create Ancestral-specific copies of those material definitions.

Realm construction packs may select or visually combine universal materials without owning duplicate material registries.

---

# 18. Provenance Model

Provenance matters more in the Ancestral Veil than in many ordinary commodity contexts, but it must remain bounded.

## 18.1 Canonical Provenance Fields

A resource batch or important item may preserve only relevant provenance such as:

- source realm;
- source biome/region;
- source site;
- source creature or plant family;
- settlement or workshop;
- maker;
- cultural origin;
- legal owner/claim;
- harvest method;
- authority outcome;
- restoration/recovery context;
- contamination/corruption history where required.

## 18.2 What Provenance Must Not Become

Provenance must not:

- copy the entire world-history database into every stack;
- store every prior owner of common stone;
- make ordinary stacking impossible without gameplay benefit;
- expose hidden worldgen information;
- simulate unlimited genealogies;
- duplicate quest or faction authority.

Common bulk resources may use coarse provenance or none at all. Specialist, cultural, disputed or relic materials may retain more.

---

# 19. Resource Ethics and Personhood Boundary

The Veil's material economy must never imply that persons are ordinary harvest nodes.

The following are prohibited as default resource mechanics:

- killing spirits for generic Soul items;
- farming sentient memory beings for essence;
- converting ordinary dead NPCs into crafting currency;
- making corpse harvesting the required route to Ancestor Ash;
- treating undead citizens as material deposits;
- harvesting identity records as fuel.

Legitimate acquisition methods include:

- mining;
- excavation;
- ecological gathering;
- cultivation;
- shedding;
- moulting/cocoons;
- managed aquaculture;
- trade;
- salvage;
- crafting;
- settlement industry;
- consensual contribution;
- cultural exchange;
- dungeon caches;
- authority gifts;
- lawful recovery from abandoned infrastructure.

A specifically authored culture may have morally difficult practices, but those are **world conflicts**, not the default universal resource loop.

---

# 20. Material-State Model

A material may hold bounded state without becoming a separate canonical material.

Possible state dimensions include:

- quality;
- purity;
- moisture;
- charge;
- calibration;
- memory imprint;
- spirit interaction level;
- contamination;
- corruption exposure;
- structural condition;
- provenance;
- cultural treatment;
- legal/ritual binding.

Examples:

- calibrated Memory Glass remains Memory Glass;
- damp Veil Soil remains Veil Soil;
- charged Echo Pearl remains Echo Pearl;
- treated Soulwood remains Soulwood;
- bound Oathbone remains Oathbone.

A separate material definition is required only when transformation changes composition, behaviour, processing, save meaning or visual identity enough that state alone is insufficient.

---

# 21. Processing Architecture

FCC-03C locks broad processing relationships but deliberately does not hard-code exact recipe counts.

## 21.1 Mechanical / Manual Processing

Examples:

- stone cutting;
- clay shaping;
- fibre cleaning;
- spinning;
- weaving;
- metal forming;
- carving;
- polishing;
- grinding;
- mixing;
- pressing.

## 21.2 Thermal Processing

Examples:

- ceramic firing;
- Soul Silver refining;
- drying;
- heat treatment;
- selected glass/mineral preparation.

## 21.3 Spirit-Active Processing

Examples:

- Memory Glass calibration;
- Oathbone shaping during valid binding states;
- Grave Salt stabilisation mixtures;
- Echo Pearl calibration;
- Soul Silver spirit-interface tuning;
- Spirit Clay activation;
- Soulwood treatment.

Spirit-active processing must use explicit stations, recipes, state changes or permissions. It may not rely on unbounded free-form interpretation.

## 21.4 Cultural Processing

Some final recipes may depend on:

- a recognised maker;
- settlement permission;
- archive knowledge;
- court law;
- cultural technique;
- route authority;
- authorised ritual context.

Those conditions are unlock/context requirements, not justification for duplicating the underlying material.

---

# 22. Derived-Form Eligibility Matrix

Derived forms exist only where physically and functionally sensible.

| Material | Canonical / Expected Derived Families | Explicitly Not Automatic |
|---|---|---|
| **Memory Stone** | natural block, cut stone, brick, slab, stair, wall, pillar, trim/arch where supported | every decorative shape |
| **Veil Soil** | terrain states, fill, cultivated/treated state where needed | stairs, pillars, polished blocks |
| **Spirit Clay** | raw clay, brick, tile, pottery, tablet, ceramic component | full metal-like component family |
| **Ancestor Ash** | powder, mortar additive, ink compound, reagent mixture | load-bearing ash block family |
| **Memory Glass** | pane, lens, plate, inlay, archive/recording surface | universal stair/slab/wall set |
| **Oathbone** | carved seal, rigid component, fitting, specialist structural piece | corpse-bone drops; fibre/cloth |
| **Veil Silk** | fibre, thread, cloth, screen, binding, membrane | masonry forms |
| **Grave Salt** | loose salt, crystal deposit, reagent, boundary mixture | universal construction block family |
| **Echo Pearl** | pearl, polished pearl, calibrated core, jewellery/device component | masonry block family |
| **Soul Silver** | ore/concentrate, ingot, plate, wire, fitting, specialist equipment parts | automatic copy of every ordinary metal recipe |
| **Soulwood** | source log/wood, selected plank, beam, panel, carving/joinery | unrestricted mass-construction permutations |

Final concrete definitions are admitted in FCC-03G/FCC-13 only when there is a real gameplay, construction, crafting or presentation need.

---

# 23. Block / Item Single-Definition Rule

FCC-03C adopts the global Leyforge **single canonical Block/Item identity rule**.

If something is fundamentally a placeable Block and, when recovered, is intended to remain that same Block, then:

- the Block owns the canonical identity;
- inventory/storage/trade expose a generated **Block Inventory Projection**;
- there is no separately authored duplicate Item record.

Examples:

### Correct

**Memory Stone Brick Block**  
→ recovered as the same canonical Memory Stone Brick Block  
→ inventory uses generated block projection.

**Soul Silver Ore Block**  
→ mining transforms it into **Raw Soul Silver Ore Item**  
→ Block and Item are distinct because the lifecycle transformed.

**Spirit Clay deposit Block**  
→ harvesting yields **Spirit Clay Item / Clay Lump**  
→ distinct definitions are valid because the world source and carried resource are different.

**Installed Memory Glass Archive Panel Block**  
→ may require a portable calibrated Memory Glass component when dismantled if the portable component has a genuinely distinct lifecycle.

### Incorrect

- separate canonical Memory Stone Brick Block + identical Memory Stone Brick Item;
- separate Soulwood Plank Block + identical placeable Soulwood Plank Item;
- duplicate “block item forms” that independently copy block hardness, collision, visual or placement data.

Any FCC-03 definition violating this rule is blocking until reconciled.

---

# 24. Export and Off-Realm Stabilisation

Veil materials may leave the Ancestral Veil.

The default rule is:

> **Export is possible; specialist spirit-active functions may need stabilisation outside native Veil conditions.**

Possible stabilisation interfaces include:

- Grave Salt;
- Echo Pearl;
- Soul Silver;
- compatible wards;
- maintenance;
- environmental anchors;
- portal-safe packing;
- later cross-realm components.

Exact recipes and progression dependencies are deferred until the full realm network is known.

Off-realm behaviour should distinguish:

1. **Physical persistence** — does the material physically remain usable?
2. **Spirit-active capability** — does its special function remain active?
3. **Memory/identity function** — does a recording or recognition effect remain valid?
4. **Maintenance** — does it require periodic support?
5. **Safety** — can instability damage the object or simply disable the special function?

Where practical, loss of native conditions should degrade **special capability before basic physical usability**. A Soulwood chair should not simply vanish because it is taken to the Overworld.

---

# 25. Veilgate Material Interface

FCC-03A locks **Veilgate** as the Ancestral Veil's one canonical normal portal type.

FCC-03C confirms the following native material relationships:

- **Memory Stone** — suitable frame/foundation material;
- **Memory Glass** — portal interface/threshold element;
- **Soul Silver** — specialist conductive/spirit-active fittings;
- **Echo Pearl** — keystone/core/stabilisation candidate;
- **Grave Salt** — stabilisation/activation boundary reagent.

The exact final construction recipe, quantities, external dependency and activation progression remain deliberately deferred to the **global portal progression reconciliation**.

This is not incompleteness: the material roles are locked; the cross-realm recipe dependency cannot be finalised until all realm portals are designed.

---

# 26. Corruption, Contamination and Irreversible Transformation

Void corruption is distinct from native Ancestral Veil phenomena.

## 26.1 Early / Reversible Exposure

Early corruption should normally be represented as:

- contamination state;
- surface overlay;
- charge/state alteration;
- reduced stability;
- hazardous processing condition.

This does not automatically create a new material definition.

## 26.2 Irreversible Transformation

A distinct material may be admitted only when severe transformation produces meaningfully different:

- composition;
- physical behaviour;
- spirit interaction;
- processing pathway;
- hazard profile;
- recipe role;
- visual identity;
- save/runtime meaning.

Potential candidates already accepted in principle include:

- **Corrupted Memory Glass**;
- **Corrupted Soulwood**;
- **Warped / Corrupted Soul Silver**.

These remain **conditional candidates**, not an automatic three-item promise. FCC-03I and FCC-03J determine whether each final transformed definition is actually needed.

No rule may generate a `Corrupted X` version of every Veil material.

---

# 27. Biome–Material Suitability Interface

FCC-03C does not redefine biome worldgen, but it supplies the material suitability model consumed by FCC-03B/worldgen.

| Biome Family | Typical Material Relationships |
|---|---|
| **Echoing Hearthlands** | Memory Stone, Veil Soil, Spirit Clay, common imported settlement materials, selected Memory Glass |
| **Processional Roads** | Memory Stone, Grave Salt, Oathbone, Soul Silver fittings, Memory Glass markers |
| **Memory Sea** | Memory Stone cliffs/islands, Spirit Clay sediments, Grave Salt, Echo Pearl, Memory Glass coastal deposits |
| **Ossuary Orchards** | Veil Soil, Soulwood, Oathbone, Spirit Clay, Grave Salt in selected sites |
| **Mourning Mists** | Veil Soil, Memory Stone, Grave Salt, Memory Glass, restoration reagents |
| **Forgotten City Reflections** | reclaimed Memory Stone, Memory Glass, Soul Silver, Spirit Clay ceramics, culturally inherited materials |
| **Predator Dark** | sparse accessible deposits, Memory Stone, Grave Salt anchors, specialist stabilising materials |
| **Crownlands of the Remembered** | high-quality Memory Stone, Memory Glass, Soul Silver, Oathbone, Spirit Clay, culturally significant Soulwood |

This table expresses **suitability and thematic association**, not guaranteed abundance.

---

# 28. Resource Economy Boundaries

FCC-03C defines resource existence and broad processing. It does not own market price.

Trade value may depend on:

- scarcity;
- source region;
- provenance;
- legal status;
- cultural importance;
- processing quality;
- purity;
- current political demand;
- route accessibility;
- settlement production;
- contamination;
- authority restrictions.

The economy system owns pricing and transactions.

A material's rarity label must not automatically determine:

- combat power;
- sale value;
- moral status;
- progression tier;
- artistic glow.

These are separate systems.

---

# 29. Salvage, Dungeon and Authority Resource Rules

Dungeons, ruins, archives, Necropolis sites and authority outcomes may grant Veil materials through:

- salvage;
- recovered stock;
- lawful claims;
- gifts;
- political settlement;
- trade;
- restoration rewards;
- treasure caches;
- abandoned workshops;
- crafted components;
- combat trophies where context genuinely supports them.

Major progression must **not require killing a realm authority solely to obtain a mandatory material**.

Authority outcomes may instead grant:

- permission;
- knowledge;
- access;
- specialist crafting service;
- legal claim;
- material allotment;
- route rights;
- stabilised components;
- unique cultural goods.

Exact reward tables belong to FCC-03H/G.

---

# 30. Material Naming Rule

Ancestral Veil follows the global Leyforge naming principle:

- ordinary real-world-equivalent materials use simple descriptive names;
- genuinely unique realm materials may use distinctive fantasy names;
- derived forms should remain predictable.

Examples:

- `Memory Stone` → `Cut Memory Stone` → `Memory Stone Brick`
- `Soul Silver` → `Soul Silver Ingot` → `Soul Silver Plate`
- `Veil Silk` → `Veil Silk Thread` → `Veil Silk Cloth`
- `Spirit Clay` → `Spirit Clay Brick` / `Spirit Clay Tile`

Avoid unnecessary names such as inventing a unique fantasy term for every intermediate powder, plate or cut block.

---

# 31. Art-Handoff Material Identity Boundary

FCC-03C establishes **what each material is**, but does not finalise its colour palette or texture recipe.

Later art governance must inherit:

- physical class;
- source;
- processing state;
- whether translucent;
- whether metallic;
- whether biological;
- whether spirit-active;
- whether ordinary or specialist construction material;
- valid derived forms;
- state variants;
- corruption eligibility.

The future Material Visual Profile may define:

- palette;
- value range;
- pattern scale;
- directionality;
- transparency;
- reflectivity;
- inclusions;
- wear;
- fracture;
- age;
- spirit-active emission;
- corruption transformation.

Visual design may not turn two materially distinct substances into one indistinguishable family simply because they share “ghostly” theming.

---

# 32. Working Realm-Local Material Registry

The following display names are realm-locally locked.

| Working Canonical ID | Legacy/Source Anchor | Display Name | Classification |
|---|---|---|---|
| `material.ancestral.memory_stone` | Building-pack / FCC | **Memory Stone** | Common geological stone |
| `terrain.ancestral.veil_soil` | FCC | **Veil Soil** | Terrain substrate |
| `material.ancestral.spirit_clay` | Building-pack / FCC | **Spirit Clay** | Clay / ceramic |
| `leyforge.core.res.realm.ancestral_veil.ancestor_ash` | `res.realm.ancestral_veil.01` | **Ancestor Ash** | Powder / construction-ritual additive |
| `leyforge.core.res.realm.ancestral_veil.memory_glass` | `res.realm.ancestral_veil.02` | **Memory Glass** | Translucent recording / optical mineral |
| `leyforge.core.res.realm.ancestral_veil.oathbone` | `res.realm.ancestral_veil.03` | **Oathbone** | Binding-law mineral |
| `leyforge.core.res.realm.ancestral_veil.veil_silk` | `res.realm.ancestral_veil.04` | **Veil Silk** | Biological spirit-interactive fibre |
| `leyforge.core.res.realm.ancestral_veil.grave_salt` | `res.realm.ancestral_veil.05` | **Grave Salt** | Boundary / preservation mineral salt |
| `leyforge.core.res.realm.ancestral_veil.echo_pearl` | `res.realm.ancestral_veil.06` | **Echo Pearl** | Memory Sea biomineral / stabilisation resource |
| `material.ancestral.soul_silver` | Building-pack / FCC | **Soul Silver** | Specialist spirit-active metal |
| `material.ancestral.soulwood` | FCC | **Soulwood** | Specialist Ossuary timber |

The exact namespace of the five FCC-added foundations may be normalised during FCC-12/FCC-13.

**Display names, physical identities and realm-local classifications are locked unless final cross-realm reconciliation finds a direct collision.**

---

# 33. Removed, Reclassified and Non-Material Terms

## 33.1 Ancestral Essence

`Ancestral Essence` may survive as:

- folklore;
- ritual language;
- scholarship;
- religion;
- poetic terminology;
- dialogue;
- a description of a phenomenon.

It may **not** exist as:

- generic creature drop;
- universal fuel;
- ore;
- liquid resource;
- currency;
- mandatory crafting commodity;
- automatic product of death.

## 33.2 Soul

`Soul` is not a generic inventory resource.

The existence of spiritual beings does not create a soul commodity.

## 33.3 Ordinary Bone

Ordinary bone may still exist wherever biology supports it, under universal creature/resource rules.

It is distinct from **Oathbone**.

## 33.4 Ordinary Silver

Ordinary Silver remains a universal/Overworld material where canon supports it.

It is distinct from **Soul Silver**.

## 33.5 Ordinary Glass

Ordinary glass remains distinct from **Memory Glass**.

## 33.6 Memorial Materials

Culture-specific memorial materials may exist as:

- recipes;
- composites;
- decorated forms;
- imported materials;
- cultural variants.

They do not automatically become new base-material families.

---

# 34. Source Reconciliation Register

| Source-era Direction | FCC-03C Resolution |
|---|---|
| Six Set 24 resource names | Retained |
| Six Set 24 source anchors | Retained |
| Generic Atlas role-slot labels | Superseded where physically inconsistent |
| Memory Stone visual/material direction | Retained and promoted to common native stone |
| Spirit Clay | Retained |
| Soul Silver | Retained as distinct specialist metal |
| Memory Glass | Retained and narrowed to bounded recording/optical mineral |
| Ancestral Essence as material family | Removed as physical resource |
| “Spirits are not generic resources” | Strengthened into explicit no-soul-economy rule |
| Death-recovery / soul-recovery material implications | Superseded by FCC-03A universal ownership boundary |
| Grave Salt corpse association | Rejected; mineral provenance |
| Oathbone ordinary corpse-bone interpretation | Rejected; Veil mineral growth |
| Echo Pearl soul-storage interpretation | Rejected; environmental-echo biomineral |
| Veil Silk kill-drop dependency | Rejected; ecological/non-lethal sources supported |
| Duplicate block-item forms | Replaced by canonical Block + generated Block Inventory Projection rule |
| Automatic material × shape generation | Prohibited |
| Automatic `Corrupted X` for every material | Prohibited |

---

# 35. Cross-Document Interfaces

## FCC-03A

Supplies:

- realm identity;
- no-afterlife-simulation boundary;
- Veilgate identity;
- global system ownership;
- progression boundaries.

FCC-03C may not create materials that contradict those rules.

## FCC-03B

Supplies:

- eight biome families;
- environmental states;
- hazard states;
- worldgen suitability.

FCC-03C supplies material occurrence/suitability back to B/worldgen.

## FCC-03D

Owns:

- Soulwood tree biology;
- Veil flora;
- botanical harvest methods;
- plant-derived foods/resources.

FCC-03C owns Soulwood as a material after valid harvesting/processing.

## FCC-03E

Owns:

- Memory Moth;
- Echo Ray;
- creature ecology;
- creature-welfare consequences;
- exact biological sourcing.

FCC-03C owns Veil Silk and Echo Pearl after legitimate transfer into the material/resource layer.

## FCC-03F

Owns:

- civilisation-specific industry;
- cultural restrictions;
- settlement production;
- ownership and cultural context.

## FCC-03G

Consumes FCC-03C to define:

- exact blocks;
- exact items;
- exact processing stations;
- exact recipes;
- Veilgate construction definitions.

FCC-03G may not invent a new major Veil material without reconciliation.

## FCC-03H

Consumes materials for:

- dungeon rewards;
- authority outcomes;
- site salvage.

## FCC-03I

Owns:

- Void corruption consequences;
- restoration;
- identity/memory interaction.

It may propose distinct corrupted material definitions only under Section 26.

## FCC-03J

Certifies:

- no orphan materials;
- no duplicate identities;
- no missing source;
- no unexplained derived forms;
- no forbidden soul economy;
- final art-handoff registry.

---

# 36. Implementation and Scaling Rule

Material canon must remain stable across performance profiles.

Lower-end simulation modes may reduce:

- visual particles;
- live spirit-reactive shader complexity;
- update frequency;
- off-screen material-state processing;
- distant provenance detail;
- environmental animation;
- real-time calibration visuals.

They may not change:

- which material exists;
- legal ownership;
- resource quantity;
- crafting conservation;
- provenance required for authoritative gameplay;
- whether a substance is physical or spirit-active;
- the result of a committed transaction.

Visual simplification must not become economic duplication or deletion.

---

# 37. FCC-03C Acceptance Gate

FCC-03C is ready for realm-local acceptance only when all of the following are true:

- exactly **eleven major physical material foundations** are identified;
- the six Set 24 resource names and source anchors are preserved;
- inconsistent Atlas role-slot labels are explicitly superseded;
- Memory Stone and Memory Glass are separate materials;
- Veil Soil is one broad substrate family with bounded states;
- Spirit Clay has a legitimate geological and ceramic pathway;
- Ancestor Ash does not require corpse farming;
- Oathbone is a binding-law mineral rather than ordinary harvested bone;
- Veil Silk has ecological/non-lethal sourcing;
- Grave Salt is a natural mineral resource;
- Echo Pearl is a Memory Sea biomineral rather than a soul container;
- Soul Silver is a distinct Veil-native specialist metal with a coherent ore/refinement foundation;
- Soulwood remains a restricted specialist timber whose biology is owned by FCC-03D;
- `Ancestral Essence` is excluded as a physical resource;
- no generic `Soul` item or soul-fuel economy exists;
- broad processing routes are defined without premature numeric recipes;
- derived forms are purpose-driven rather than combinatorial;
- placeable Blocks use generated Block Inventory Projections rather than duplicate same-identity Items;
- export is allowed with bounded off-realm stabilisation needs;
- Veilgate material roles are defined while its final cross-realm recipe remains correctly deferred;
- Void exposure does not automatically create a duplicate corrupted material roster;
- provenance is bounded and does not become a full world-history copy;
- persons, spirits and undead citizens cannot become ordinary resource nodes;
- material identities are sufficient for FCC-03G and later art governance.

**FCC-03C Status:** **REALM-LOCAL LOCK CANDIDATE — pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**
