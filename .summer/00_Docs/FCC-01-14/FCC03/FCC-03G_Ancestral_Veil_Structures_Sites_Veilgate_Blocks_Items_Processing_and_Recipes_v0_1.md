# Leyforge Final Content Canon Collection

## FCC-03G — Ancestral Veil Structures, Sites, Veilgate, Blocks, Items, Processing & Recipes

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ancestral Veil  
**Stable Realm ID:** `realm.major.ancestral_veil`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-03A through FCC-03F  
**Primary Scope:** Signature structures, supporting structure/site families, Veilgate physical content contract, realm infrastructure, placeable Block eligibility, true Item eligibility, processing pathways, recipe-family relationships, construction/project interfaces, legacy portal/content migration and block/item duplicate prevention.  
**Final Global Status:** Pending final cross-realm reconciliation and FCC-12/FCC-13 certification.

---

# 1. Purpose

FCC-03G is the Ancestral Veil's **physical-content integration document**.

It translates the realm identity, biomes, materials, flora, creatures and civilisations established in FCC-03A–F into buildable, harvestable, craftable and placeable content.

It owns realm-local canon for:

- the six canonical signature structures;
- supporting civic, settlement and infrastructure structure families;
- the Veilgate's realm-specific physical content;
- structure-function boundaries;
- realm-specific Block families and shape eligibility;
- true portable Item families;
- installed components;
- processing relationships;
- recipe-family relationships;
- construction/project handoff;
- material-to-form eligibility;
- legacy Ancestral building-pack reconciliation;
- legacy generic portal migration;
- Block Inventory Projection compliance.

It does **not** own:

- universal Block runtime rules;
- universal Item runtime rules;
- universal crafting transaction mechanics;
- economy pricing;
- settlement simulation;
- dungeon/boss definitions;
- final numerical recipe quantities;
- global portal progression order;
- final cross-realm recipe deduplication;
- final material art profiles.

Those remain owned by their universal systems and FCC-12/FCC-13.

---

# 2. Physical Content Canon Rule

Ancestral content must obey this rule:

> **A realm-specific object exists only when its structure, material, lifecycle or function is genuinely realm-specific. Universal content is reused rather than renamed.**

Therefore FCC-03G must not create an Ancestral Furnace, Ancestral Chest, Ancestral Workbench, Ancestral Loom, Ancestral Boat or Ancestral Door merely because ordinary universal objects are used inside the Veil.

Realm-specific versions are justified only when the object has a materially different contract.

Likewise:

> **A placeable object that recovers as itself is one canonical Block plus a Block Inventory Projection, not a duplicate Item.**

---

# 3. Structure Classification

Ancestral physical content is divided into six layers.

## 3.1 Signature Structures

The six exact named realm-signature structures are:

1. **Namebridge Sanctuary**
2. **Hall of Remembered Doors**
3. **Ancestral Embassy**
4. **Memory Well**
5. **Quiet Market**
6. **Veil-Lantern Network**

These names are locked.

## 3.2 Canonical Portal

7. **Veilgate**

Veilgate is realm-access infrastructure, not counted as one of the six signature civic structures.

## 3.3 Supporting Functional Structures

Supporting families include:

- civic archive buildings;
- cleansing houses;
- route stations;
- ferries and bridge infrastructure;
- identity-stabilisation shelters;
- orchard infrastructure;
- Memory Sea docks;
- workshops;
- cultivation/aquaculture infrastructure;
- Necropolis civic/maintenance infrastructure;
- courts and record halls;
- refuge and investigation facilities.

## 3.4 Settlement Archetype Construction

The 24 settlement archetypes from FCC-03F are settlement/planning foundations, not 24 monolithic unique buildings.

## 3.5 Dungeons

Dungeon structures are owned by FCC-03H and remain separate from ordinary civic structures even when terminology overlaps.

## 3.6 Technical / Hidden Infrastructure

Hidden anchors, blueprint markers, worldgen controllers and route graph records are technical system content and must not masquerade as player-facing lore Blocks.

---

# 4. Signature Structure Registry

| Working ID | Display Name | Primary Function |
|---|---|---|
| `structure.ancestral.namebridge_sanctuary` | **Namebridge Sanctuary** | safe threshold arrival, recognition, stabilisation and traveller orientation |
| `structure.ancestral.hall_remembered_doors` | **Hall of Remembered Doors** | civic identity/history/route archive and controlled recognised access |
| `structure.ancestral.ancestral_embassy` | **Ancestral Embassy** | diplomacy, visitors, cross-realm representation |
| `structure.ancestral.memory_well` | **Memory Well** | controlled civic access to bounded stored/ambient memory records |
| `structure.ancestral.quiet_market` | **Quiet Market** | mixed-state trade and respectful commerce |
| `infrastructure.ancestral.veil_lantern_network` | **Veil-Lantern Network** | distributed route, safety and stability infrastructure |

Final namespaces may be normalised during FCC-12/FCC-13.

---

# 5. Namebridge Sanctuary

The **Namebridge Sanctuary** is the canonical safe-threshold civic structure for Ancestral arrival, orientation and stabilisation.

It may occur near a realm-side Veilgate, at major route junctions, at embassy/visitor sites, in major settlements or as a reconstructed ancient sanctuary.

Supported functions include:

- safe arrival envelope;
- recognised-name registration or confirmation;
- route-map orientation;
- temporary identity stabilisation;
- refuge;
- Veilgate guidance;
- local travel information;
- cleansing/rescue services;
- visitor support.

It does **not** respawn dead players, receive every dead NPC, create souls, resurrect characters or act as the realm's universal afterlife intake.

Suitable material language includes Memory Stone masonry, Memory Glass signs/panels, Soul Silver fittings, Grave Salt boundary channels, Soulwood or imported timber for interiors, and Veil-Lantern nodes.

The Sanctuary may incorporate a Veilgate, but **the Sanctuary and the Veilgate remain different definitions**.

---

# 6. Hall of Remembered Doors

The **Hall of Remembered Doors** is a civic archive, route and recognised-access institution.

Its doors may reference explicit data such as:

- a discovered route;
- a recognised settlement;
- valid court permission;
- a recorded identity;
- an archived destination;
- a completed investigation;
- an authorised district.

It may not read arbitrary player thoughts, generate destinations from free-form text, create universal fast travel, bypass the one-portal-per-realm rule or automatically reveal undiscovered world content.

Doors may lead to rooms within the structure, attached archive wings, local route interfaces, bounded authored transitions or recognised physical exits.

Any true long-distance movement must consume universal route/travel systems.

Expected materials include Memory Stone, Memory Glass, Oathbone seals, Soul Silver fittings, Grave Salt protection and culture-specific imported materials.

---

# 7. Ancestral Embassy

The **Ancestral Embassy** is the canonical high-level diplomatic structure family for cross-realm and inter-polity representation.

Supported functions include:

- diplomatic audiences;
- faction/polity representation;
- visitor registration;
- dispute mediation;
- trade negotiation;
- archive exchange;
- refugee/migrant coordination;
- cross-realm research agreements;
- protected meeting space.

An Embassy may contain physical, spirit-active and mixed occupancy areas.

It consumes universal faction, diplomacy, ownership and economy systems.

It is not automatically neutral territory unless its specific polity/settlement record grants that status.

---

# 8. Memory Well

The **Memory Well** is a controlled civic installation for interacting with bounded memory records, environmental echoes and authorised historical material.

It is **not a soul well**.

Possible valid inputs include:

- Memory Glass records;
- authorised archive records;
- environmental echo state;
- recovered historical artefacts;
- explicitly contributed testimony;
- approved site memories.

Possible outputs include visualised scenes, historical clues, archive comparisons, evidence, route information, research progress and bounded reconstruction.

It does not copy whole persons, expose private NPC thoughts automatically, resurrect dead characters, produce Ancestral Essence or generate unlimited lore.

Memory Well content must trace to authored or system-valid source records.

---

# 9. Quiet Market

The **Quiet Market** is the canonical mixed-state commerce structure.

It supports trade between physical residents, spirit-active residents, visitors, multiple cultures, multiple ancestries and different polity/faction representatives.

Its realm-specific value is **accessibility and safe mixed-state commerce**, not a separate economy engine.

Possible infrastructure includes:

- physical stalls;
- low-collision or spirit-accessible aisles;
- secure goods displays;
- record/contract desks;
- customs points;
- storage;
- Veil-Lantern coverage;
- translation/signage;
- identity-safe trade interfaces.

The following are prohibited as normal market commodities:

- generic Souls;
- persons;
- undead citizens;
- copied identities;
- unrestricted private memories.

---

# 10. Veil-Lantern Network

The **Veil-Lantern Network** is a distributed public infrastructure system composed of installed lantern nodes, route markers and supporting power/stability connections.

It is both a signature realm structure and a network rather than one single building.

A valid network may support:

- route readability;
- safe-zone indication;
- local stability feedback;
- refuge guidance;
- hazard signalling;
- navigation in mist/darkness;
- interaction with Lantern Wisps;
- settlement coverage.

It does not make a settlement safe merely through decorative lantern placement. Coverage must be derived from installed functional nodes.

A **Veil Lantern** may be admitted as a realm-specific functional Block because its spirit/route/stability contract differs from an ordinary Torch or Ward Lantern.

If it recovers as itself, it is Block-owned and uses a Block Inventory Projection.

---

# 11. Legacy Functional Structure Reconciliation

The old Ancestral building pack listed arrival shrine, ancestor embassy, memory archive, spirit dwelling, cleansing house, oath guardians and death-recovery infrastructure.

FCC-03G resolves them as follows.

## 11.1 Arrival Shrine

The independent generic **Arrival Shrine** is not promoted as a seventh signature structure.

Its functions are absorbed by Namebridge Sanctuary, Veilgate threshold sites and minor route/arrival waystations.

## 11.2 Ancestor Embassy

Reconciled into the exact canonical **Ancestral Embassy** name.

## 11.3 Memory Archive

`memory archive` survives as a **generic civic archive function/building family**.

Because **Memory Archive** is also the exact locked name of an FCC-03H dungeon family, implementation IDs must distinguish civic archive structures from the dungeon family.

The generic civic building should use a technical/display qualifier such as **Civic Archive** or a local cultural name rather than creating an ambiguous second stable `Memory Archive` structure ID.

## 11.4 Spirit Dwelling

`Spirit Dwelling` is primarily an **occupancy adaptation/profile**, not one mandatory architectural structure family.

Housing Blocks and blueprints may support physical, spirit-active or mixed occupants.

## 11.5 Cleansing House

**Cleansing House** remains a supporting functional structure family for treatment, contamination removal, identity stabilisation, mist exposure, possession/influence treatment and restoration support.

It is not a resurrection clinic.

## 11.6 Oath Guardians

`oath guardians` are retained as a broad **security/recognition infrastructure role**, not a new creature species by default.

A site may use Oathbone seals, recognised-access devices, guards, constructs, ward systems or court/security NPCs.

No generic `Oath Guardian` creature is added by FCC-03G.

## 11.7 Death-Recovery Infrastructure

The source-era label is superseded by:

> **identity stabilisation, memory recovery, cleansing, route rescue and safe-return infrastructure**

Universal death/respawn remains outside FCC-03.

---

# 12. Veilgate Canonical Physical Contract

The **Veilgate** is the Ancestral Veil's one canonical normal portal type.

It should read as a quiet recognised threshold rather than a violent generic rift.

The realm-local physical contract contains six assembly roles:

1. **Frame / Foundation** — primarily Memory Stone.
2. **Threshold Interface** — Memory Glass or approved Memory Glass assembly.
3. **Spirit-Conductive Fittings** — Soul Silver.
4. **Keystone / Core** — Echo Pearl-based core/keystone role.
5. **Stabilisation Channel** — Grave Salt.
6. **Recognition / Inscription Layer** — explicit bounded record/activation interface.

The exact recipe quantities, final crafted subcomponents and cross-realm dependency are deferred to global portal reconciliation.

The Veilgate must have recognisable Ancestral architecture and must not be forced into the same generic rectangular frame as every other realm.

Its final geometry may use an arch, paired threshold stones, stepped bridge-like framing, a reflective portal plane or asymmetric memorial architecture.

Final model geometry remains an art/Forge decision, but the **assembly-role contract is canonical**.

Activation must consume the universal Realm Access runtime.

Realm-local activation may require explicit frame validation, core installation, Grave Salt stabilisation, recognition/inscription state, progression knowledge and permission where the final progression graph requires it.

No near-death event, funerary rite or arbitrary remembered object may bypass a valid Veilgate.

A valid realm-side linked Veilgate or universal safe-return portal instance is required under the global portal contract.

---

# 13. Legacy Portal Registry Reconciliation

Legacy runtime/testing registries contain generic content such as:

- **Ancient Portal Frame**;
- **Broken Portal Block**;
- **Unstable Rift Block**;
- **Ancient Portal Rubbing**.

These remain useful for teaser content, old ruins, research clues, migration aliases, generic broken-portal content and historical portal evidence.

They are **not automatically the final Veilgate definitions**.

FCC-03G requires a realm-specific Veilgate structure/assembly identity.

Migration may allow an old teaser structure to point toward Veilgate research without silently transforming every Ancient Portal Frame into a completed Veilgate.

---

# 14. Material-to-Block Eligibility

FCC-03G consumes FCC-03C material identities.

## Memory Stone

Expected placeable families:

- natural stone;
- cut stone;
- brick;
- slab;
- stair;
- wall;
- pillar;
- arch/trim where universal shape systems support it.

## Veil Soil

Expected terrain/state families:

- native soil;
- cultivated/treated state where gameplay requires it;
- route-compacted or regional states.

No ornamental stair/pillar set.

## Spirit Clay

Expected:

- clay source/deposit;
- fired brick;
- tile;
- ceramic tablet/panel where functionally distinct;
- pottery/vessel through the correct Item/Block lifecycle.

## Memory Glass

Expected:

- natural deposit/node where worldgen requires it;
- pane;
- calibrated plate;
- archive panel;
- specialist inlay/interface.

No automatic glass stair/wall catalogue.

## Soulwood

Expected where justified:

- source log/wood;
- selected plank;
- beam;
- panel;
- carved joinery;
- selected furniture/doors.

## Oathbone

Expected:

- seal;
- fitting;
- specialist rigid component;
- selected architectural insert.

Not generic masonry.

## Grave Salt

Expected:

- deposit/crust;
- loose portable salt;
- installed boundary line/channel or mixture where supported.

Not a full masonry family.

## Soul Silver

Expected as placed content only where needed:

- ore/deposit;
- selected fittings;
- installed conductive components;
- decorative/technical inlays.

Refined ingots, plates and wire are Items.

## Veil Silk

Expected placeable uses:

- screen;
- membrane;
- banner/textile;
- specialist partition.

Fibre, thread and cloth are Items.

## Echo Pearl

Normally an Item/component, not masonry.

## Ancestor Ash

Normally Item/reagent/additive, not load-bearing Block.

---

# 15. True Item Eligibility

A true Ancestral Item is justified when its primary lifecycle is portable or when harvesting/refining transforms a world source into a distinct object.

Expected true Item families include, where concrete recipes require them:

- raw/refined **Ancestor Ash**;
- harvested **Spirit Clay**;
- raw or refined **Soul Silver ore/concentrate**;
- **Soul Silver Ingot**;
- **Soul Silver Plate**;
- **Soul Silver Wire**;
- **Veil Silk Fibre**;
- **Veil Silk Thread**;
- **Veil Silk Cloth**;
- loose/refined **Grave Salt**;
- natural/polished **Echo Pearl**;
- calibrated Echo Pearl component where lifecycle differs from the natural pearl;
- carved **Oathbone Seal/Fitting** where portable and installed later;
- Memory Glass lens/record component where portable lifecycle differs from a placeable pane;
- botanical harvest products;
- food ingredients and meals;
- medicine/reagent products;
- seeds or propagules;
- knowledge records, rubbings and maps where universal knowledge systems require portable Items.

A placeable Memory Stone Brick, Soulwood Panel, Memory Glass Pane or Veil Lantern that recovers as itself is **not** separately authored as an Item.

---

# 16. Processing-Station Reuse Rule

The Ancestral Veil should reuse universal processing capabilities wherever they already exist.

Expected universal capabilities include:

- masonry / stone cutting;
- sawing / woodworking;
- kiln / ceramic firing;
- furnace / smelting;
- forge and anvil / metal forming;
- loom / weaving;
- alchemy / reagent mixing;
- inscription / rune work;
- enchanting / spirit-active calibration;
- research / archive analysis;
- cooking;
- drying / preservation;
- ordinary crafting/assembly.

Realm-specific stations are created only when a process cannot be represented by a universal station plus a realm-specific recipe/capability.

Examples:

- Veil Silk does **not** require a unique Ancestral Loom if the universal Loom supports its fibre profile.
- Soul Silver does **not** require a unique Ancestral Forge if the universal forge supports specialist metal recipes.
- Spirit Clay does **not** require a unique spirit kiln if universal ceramic firing supports it.
- Memory Glass calibration may use an approved rune/enchanting/research capability or a specialist installed archive apparatus if later implementation proves it genuinely needs one.

This prevents workstation proliferation.

---

# 17. Canonical Material Processing Relationships

FCC-03G locks the **direction of transformation**, not final numeric ingredient quantities.

## 17.1 Memory Stone

Canonical pathways may include:

> Memory Stone → Cut Memory Stone → Memory Stone Brick / eligible construction shapes

Construction shapes reference the material/shape system and do not require separate hand-authored recipes for every form if the universal construction transformation system can generate them safely.

## 17.2 Spirit Clay

> Spirit Clay deposit/source → harvested Spirit Clay → shaped clay → fired ceramic

Supported outputs may include:

- Spirit Clay Brick;
- Spirit Clay Tile;
- ceramic tablet;
- pottery/vessel;
- specialist ceramic component.

## 17.3 Ancestor Ash

Ancestor Ash is primarily an additive/reagent.

Supported recipe families may include:

- memorial mortar/plaster additive;
- inscription ink compound;
- cleansing mixture;
- stabilisation mixture;
- cultural ritual compound.

It does not become a universal fuel or soul reagent.

## 17.4 Memory Glass

> natural Memory Glass → cut/polished glass → pane/lens/plate → optional calibrated state/component

Calibration must reference bounded records or system-valid functions.

## 17.5 Oathbone

> Oathbone source → selected harvested/shaped stock → seal/fitting/rigid component

Some shaping may be easiest while the material is in an explicit binding-compatible state.

Oathbone is not processed into fibre or cloth.

## 17.6 Veil Silk

> raw/shed Veil Silk → cleaned fibre → thread → cloth/screen/binding

The source provenance remains Memory Moth ecology.

## 17.7 Grave Salt

> Grave Salt deposit → harvested salt → cleaned/refined salt → boundary/preservation/stabilisation mixtures

No corpse input is required.

## 17.8 Echo Pearl

> natural Echo Pearl → cleaned/polished pearl → optional calibrated core/component

Calibration does not convert the pearl into a soul container.

## 17.9 Soul Silver

> Soul Silver-bearing deposit → raw ore/concentrate → refined Soul Silver → ingot → plate/wire/fitting/component

Exact smelting conditions and ratios remain balance/recipe data.

## 17.10 Soulwood

> Ossuary Tree harvest → Soulwood stock/log → selected plank/beam/panel/joinery

Harvest provenance from FCC-03D may influence legality, quality or cultural response without creating duplicate material definitions.

---

# 18. Botanical Processing Relationships

FCC-03G consumes FCC-03D without inventing additional major species.

Supported relationships include:

- Memory Reed → harvested reed → fibre / woven mat / sheet-like substrate;
- Mourning Lily → petals/extract → medicine or ritual preparation where approved;
- Gravebell → harvested botanical reagent → ward/alchemy/medicine mixture;
- Mist Fern → processed medicinal preparation where safe;
- Echo Lotus → botanical reagent / culturally defined preparation;
- Lantern Moss → cultivated surface growth or harvested reagent only where functionally justified;
- edible fungi → ingredient or prepared food;
- cultivated root/wetland crop → ingredient / cooked food.

A plant does not automatically generate one seed Item, one crop Item, one medicine Item and one food Item unless those are distinct useful lifecycle objects.

---

# 19. Food and Cooking Boundary

FCC-03G confirms that Ancestral cuisine can use the five food-resource classes established in FCC-03D:

1. cultivated wetland/root food;
2. edible reed/shoot resource;
3. edible fungal resource;
4. Memory Sea biological food resource;
5. medicinal/culinary herb and flower resource.

It may also use imported universal staples.

This document does **not invent a mandatory list of fantasy dish names**.

Final concrete foods should be introduced only when they have a reason to exist as:

- harvestable ingredient;
- cooked meal;
- preserved food;
- medicine;
- trade good;
- cultural recipe;
- settlement provision.

Nutrition values and ingredient counts remain FCC-13/balance data.

---

# 20. Creature Resource Processing

FCC-03G admits only creature-resource relationships already justified by FCC-03E.

## Memory Moth

Primary material:

- Veil Silk through cocoon/shedding/managed-production pathways.

## Echo Ray

Primary material:

- Echo Pearl through natural/non-lethal biological release preferred by the canon.

## Memory Koi and Mourning Eel

May support biological food Items where specific cultures/recipes admit them.

## Other Species

No unique material is automatically created.

Ordinary hide, meat, feather, egg, chitin or similar products require a concrete recipe/anatomical reason and later registry admission.

No creature processing chain may output generic Soul, Spirit Essence, Memory Fragment, Identity Shard or Ancestral Essence.

---

# 21. Veilgate Components and Recipe Boundary

The Veilgate is theoretically complete at realm-local level even though its final global recipe is deferred.

Locked ingredient **roles** are:

- Memory Stone frame/foundation;
- Memory Glass threshold/interface;
- Soul Silver fittings;
- Echo Pearl keystone/core role;
- Grave Salt stabilisation;
- recognition/inscription activation layer.

FCC-13/global portal reconciliation will decide:

- exact quantities;
- whether the Echo Pearl is used directly or becomes a crafted core;
- exact Soul Silver component form;
- whether an external realm material is mandatory;
- exact activation consumables;
- progression tier;
- repair recipe;
- whether specific portal pieces recover as Blocks or dismantle into Items.

No later recipe may remove the identity of these realm-local roles without explicit reconciliation.

---

# 22. Recipe Definition Standard

Every final Ancestral recipe must identify:

- recipe ID;
- output identity;
- exact input identities or accepted material profiles;
- station/capability;
- quantity;
- reversible/non-reversible status;
- energy/mana/heat requirements where relevant;
- knowledge/unlock requirement;
- permission/culture requirement where relevant;
- provenance restrictions where relevant;
- by-products;
- transaction conservation rule.

FCC-03G locks **recipe families and semantic transformations**.

FCC-13 owns final exact concrete recipe records after all realms have been compared.

This distinction prevents the same universal process from being authored differently in every realm.

---

# 23. Construction and Project Handoff

Large structures should use the universal blueprint/project/construction systems rather than one-click crafting.

Applicable content includes:

- Namebridge Sanctuary;
- Hall of Remembered Doors;
- Ancestral Embassy;
- Quiet Market;
- large Cleansing Houses;
- route stations;
- ports;
- archive complexes;
- Necropolis civic works;
- Veilgate assemblies;
- settlement projects.

Project construction may require:

- survey;
- terrain validation;
- route access;
- exact material reservations;
- worker/tool capability;
- permissions;
- hazard safety;
- staged assembly;
- final validation.

No project receives service capability merely because a decorative shell was placed.

---

# 24. Player Blueprint and Forge Compatibility

Player-created Ancestral plans are allowed where ownership and progression permit.

The blueprint validator should be able to test:

- material eligibility;
- mixed physical/spirit occupancy;
- route accessibility;
- hazard exposure;
- identity/stability coverage;
- Veil-Lantern coverage;
- archive/security requirements;
- portal clearance;
- Memory Sea water interface;
- structural support;
- protected/cultural-site conflicts.

The Forge should expose realm-specific content as reusable components and profiles rather than forcing all player builds to copy pre-authored structures.

A player-created structure receives the service of a Namebridge Sanctuary, Embassy or Quiet Market only when it satisfies that structure/service contract.

---

# 25. Realm-Specific Functional Block Candidates

The following functional content is justified at realm-local level. Exact IDs and whether each is one Block, multi-block assembly or structure component are finalised during implementation/FCC-13.

## Locked by Signature/Portal Function

- **Veil Lantern** — node of the Veil-Lantern Network.
- **Veilgate assembly components** — frame/interface/core/stabilisation roles.

## Supported Functional Families

- recognised-name plaque/sign interface;
- identity/stability anchor;
- Memory Glass archive/record panel;
- Oathbone access seal;
- Grave Salt boundary channel/marker;
- route marker/beacon;
- cleansing installation;
- archive-reading/calibration installation;
- Memory Well functional core;
- spirit-compatible housing partition/screen.

These are **functional families**, not a promise that every phrase becomes a unique standalone Block.

Implementation should first attempt to realise them using existing universal families plus material/state profiles.

---

# 26. Block / Item Lifecycle Examples

## Memory Stone Brick

If placed and recovered as itself:

- canonical owner = Block;
- inventory = Block Inventory Projection;
- duplicate Item = prohibited.

## Soul Silver Ore

If mining transforms ore into portable raw ore:

- world deposit = Block;
- Raw Soul Silver Ore = distinct Item;
- relationship = harvested/refined-from source.

## Veil Lantern

If dismantled/recovered as the same lantern:

- canonical owner = Block;
- carried representation = projection/packed Block state.

If a specialist dismantle transaction intentionally returns separate Soul Silver, Memory Glass and other components instead, that is a different authorised recovery policy and must conserve materials.

## Echo Pearl Core

If a natural Echo Pearl is crafted into a different calibrated portable core:

- Echo Pearl = Item;
- calibrated core = distinct Item only if its lifecycle/state/function materially differs.

## Memory Glass Pane

If the pane is one placeable object recovered as itself:

- Block only + projection.

A portable lens is a distinct Item because it has a different lifecycle/function.

---

# 27. Safety and Hazard Infrastructure

Ancestral structures may request realm-specific safety facets for:

- Memory Erosion;
- Identity Instability;
- Route Loss;
- Mourning Mist;
- Devouring Silence;
- Predator Dark exposure;
- possession/influence;
- Memory Sea Storm;
- false reconstruction risk;
- Necropolis instability;
- Veil boundary instability;
- Void corruption.

Safety capability must be functional and measurable.

Examples:

- a Veil Lantern provides valid coverage only while functional;
- a Grave Salt boundary must exist as installed authoritative state;
- an archive panel must reference actual records;
- a refuge must have a safe route/occupancy envelope.

Decorative props do not grant hidden protection.

---

# 28. Storage, Logistics and Automation

Ancestral materials use universal inventory, storage and automation systems.

Automation may move:

- Block Inventory Projections;
- material Items;
- food;
- reagents;
- components;
- cargo lots.

It must respect:

- provenance where authoritative;
- ownership;
- protected cultural goods;
- contamination;
- container compatibility;
- exact quantities;
- settlement reservations;
- portal restrictions.

No automation process may duplicate Memory Glass records, Echo Pearls, Veil Silk or other goods merely because the source/destination is unloaded.

Spirit-active residents are not machine cargo.

---

# 29. Damage, Dismantling, Repair and Salvage

Structures and functional Blocks consume universal damage/repair systems.

Repair should use actual material identities appropriate to the damaged component.

Examples:

- damaged Memory Stone masonry uses compatible masonry material;
- broken Memory Glass interface uses Memory Glass components;
- failed Soul Silver fitting requires Soul Silver repair/replacement;
- depleted Grave Salt boundary requires replenishment;
- Veil-Lantern repair targets its real components.

Dismantling must choose an explicit policy:

- self-recovery;
- packed state;
- component salvage;
- structure-owned deconstruction;
- no recovery for protected/technical content.

Destroyed structures do not emit generic realm loot.

---

# 30. Ownership, Permission and Cultural Restriction

Some Ancestral content may be physically craftable but socially restricted.

Possible restrictions include:

- archive access;
- Oathbone binding authority;
- culturally protected Soulwood;
- sovereign Memory Glass records;
- Echo Pearl stewardship rights;
- Soul Silver mining claims;
- Veilgate construction knowledge;
- court or route permissions.

The content registry defines the physical object. Faction/economy/ownership systems define whether a particular actor may legally create, possess, install, trade or use it.

A recipe unlock is not automatically a property right.

---

# 31. Corruption and Transformed Content

Void corruption normally uses state/overlay/variant systems.

A separate Block or Item is admitted only when irreversible transformation creates a genuinely new physical identity.

Potential conditional cases from FCC-03C/I include:

- Corrupted Memory Glass;
- Corrupted Soulwood;
- warped/corrupted Soul Silver.

These are **not automatically admitted by FCC-03G**.

FCC-03I/J must prove that each requires distinct composition, behaviour, processing, hazard or save identity.

No automatic `Corrupted` copy of every Ancestral Block, Item or recipe is permitted.

---

# 32. Art-Handoff Boundary

FCC-03G defines material composition and functional identity but not final visual styling.

Later art governance must be able to infer:

- which material owns each visible surface;
- which parts are Memory Stone, Soul Silver, Memory Glass, Soulwood, Spirit Clay, Oathbone or textile;
- which surfaces are functional interfaces;
- which parts may glow/translucently react;
- state transitions;
- damage/repair states;
- cultural decorative overlays.

Composite objects must visually inherit their component materials rather than receiving one arbitrary realm-wide colour.

For example, a Veil Lantern with Soul Silver fittings, Memory Glass panes and another structural material should preserve those component identities.

---

# 33. Performance and Simulation Scaling

Physical-content canon remains identical across performance profiles.

Lower-end modes may reduce:

- Memory Glass shader complexity;
- lantern particles;
- animated inscriptions;
- distant network visualisation;
- portal surface complexity;
- decorative route effects;
- civic crowd props.

They may not change:

- actual Blocks/Items;
- structure service state;
- material quantities;
- recipe conservation;
- portal validity;
- Veil-Lantern coverage;
- ownership;
- structure damage;
- resource provenance where gameplay-relevant.

---

# 34. Working Realm-Local Physical Registry

## 34.1 Exact Named Structures

- **Namebridge Sanctuary**
- **Hall of Remembered Doors**
- **Ancestral Embassy**
- **Memory Well**
- **Quiet Market**
- **Veil-Lantern Network**

## 34.2 Exact Portal

- **Veilgate**

## 34.3 Supporting Structure Families

- Civic Archive
- Cleansing House
- Route Station / Waystation
- Bridge/Ferry Infrastructure
- Identity-Stabilisation Shelter
- Orchard Infrastructure
- Memory Sea Port/Dock Infrastructure
- Workshop Infrastructure
- Cultivation/Aquaculture Infrastructure
- Necropolis Civic/Maintenance Infrastructure
- Court / Record Hall
- Refuge / Investigation Facility

These are family labels and may receive culture-specific display names.

## 34.4 Major Material Processing Outputs

Realm-local processing supports, where concrete registry admission justifies them:

- Cut Memory Stone;
- Memory Stone Brick and eligible shapes;
- Spirit Clay Brick;
- Spirit Clay Tile;
- Memory Glass Pane;
- Memory Glass Lens/Plate;
- calibrated Memory Glass components;
- Oathbone seals/fittings;
- Veil Silk Thread;
- Veil Silk Cloth;
- Grave Salt mixtures;
- polished/calibrated Echo Pearl components;
- Soul Silver Ingot;
- Soul Silver Plate;
- Soul Silver Wire;
- selected Soulwood planks/beams/panels/joinery;
- Ancestor Ash mortar/ink/cleansing mixtures;
- botanical/food/medical outputs approved through later exact registry work.

This list is an **eligibility and transformation registry**, not a declaration that every entry must be implemented as an independent Item.

---

# 35. Source Reconciliation Register

| Earlier Direction | FCC-03G Resolution |
|---|---|
| Namebridge Sanctuary | Retained exactly |
| Hall of Remembered Doors | Retained exactly |
| Ancestral Embassy | Retained exactly; supersedes generic “ancestor embassy” wording |
| Memory Well | Retained exactly; explicitly not a soul well |
| Quiet Market | Retained exactly; no soul/person commerce |
| Veil-Lantern Network | Retained exactly as distributed functional infrastructure |
| Arrival shrine | Absorbed into Namebridge/Veilgate threshold and minor arrival-waystation functions |
| Memory archive civic structure | Retained as generic Civic Archive family; distinguished from the exact dungeon `Memory Archive` |
| Spirit dwelling | Reclassified primarily as housing occupancy adaptation/profile |
| Cleansing house | Retained as supporting structure family; no resurrection ownership |
| Oath guardians | Reclassified as security/recognition infrastructure role, not automatic creature species |
| Death-recovery infrastructure | Superseded by identity stabilisation, memory recovery, cleansing, route rescue and safe return |
| Hospital soul recovery | Superseded by physical care + identity/stability/cleansing services |
| Ancestral Essence material/recipe role | Removed as physical commodity |
| Generic Ancient Portal Frame | Remains legacy/generic teaser; not canonical Veilgate identity |
| Broken Portal Block | Remains teaser/migration content |
| Unstable Rift Block | Remains teaser/generic rift content; not normal Ancestral access |
| Ancient Portal Rubbing | May remain knowledge/research clue |
| Duplicate block-form Items | Prohibited; use Block Inventory Projection |
| Separate Ancestral versions of universal workstations | Rejected unless functionally necessary |
| Exact portal recipe now | Deferred to global portal progression reconciliation |
| Exact numeric realm recipes now | Deferred to FCC-13 after cross-realm deduplication |

---

# 36. Cross-Document Interfaces

## FCC-03A

Supplies realm identity, Veilgate ownership, progression and death-system exclusions.

## FCC-03B

Supplies biome/hazard placement requirements and environmental states.

## FCC-03C

Supplies all material identities, provenance and derived-form eligibility.

## FCC-03D

Supplies plants, agriculture, botanical harvest and food-resource foundations.

## FCC-03E

Supplies creature-derived resource provenance and husbandry/aquatic hooks.

## FCC-03F

Supplies civilisation infrastructure, settlement archetypes, professions and signature-structure roles.

## FCC-03H

Owns dungeons, guardians, authorities, major encounter rewards and special sites.

## FCC-03I

Owns corruption/restoration and cross-realm state interactions.

## FCC-03J

Certifies the final structure, Block, Item, recipe-family and art-handoff registry.

## FCC-12 / FCC-13

Own final global material/process deduplication, exact concrete Blocks/Items and exact recipe records.

---

# 37. FCC-03G Acceptance Gate

FCC-03G is ready for realm-local acceptance only when:

- all six exact signature structure names are preserved;
- Veilgate is separate from the six civic signature structures;
- Namebridge Sanctuary does not own death/respawn;
- Hall of Remembered Doors uses bounded recognised access and does not create universal fast travel;
- Ancestral Embassy consumes universal diplomacy systems;
- Memory Well cannot copy/resurrect persons or generate generic essence;
- Quiet Market prohibits ordinary commerce in persons/souls/private identities;
- Veil-Lantern Network is functional distributed infrastructure rather than decorative props;
- source-era arrival shrine, memory archive, spirit dwelling, cleansing house, oath guardian and death-recovery concepts are explicitly reconciled;
- the exact dungeon `Memory Archive` cannot collide with ordinary civic archive structure IDs;
- Veilgate uses Memory Stone, Memory Glass, Soul Silver, Echo Pearl, Grave Salt and a recognition layer in locked assembly roles;
- exact Veilgate quantities/cross-realm dependencies remain correctly deferred;
- legacy Ancient Portal Frame/Broken Portal/Unstable Rift content cannot silently replace the Veilgate;
- all eleven Ancestral materials have sensible Block/Item eligibility;
- no material receives an automatic full shape catalogue;
- universal stations are reused before adding realm-specific workstations;
- major material processing chains are defined;
- botanical and creature processing respects FCC-03D/E provenance;
- no generic Soul/Ancestral Essence processing chain exists;
- exact numerical recipes remain reserved for FCC-13;
- large structures use authoritative construction/project systems;
- player blueprints can validate Ancestral service/hazard requirements;
- placeable content follows the one-physical-identity / Block Inventory Projection rule;
- automation/storage conserves exact goods;
- damage/repair/salvage use real material identities;
- corruption does not generate automatic duplicate registries;
- composite-art handoff preserves component-material identity;
- low-end scaling cannot change authoritative content or transactions.

**FCC-03G Status:** **REALM-LOCAL LOCK CANDIDATE — pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**
