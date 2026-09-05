# Leyforge Final Content Canon Collection

## FCC-05E — Ascendant Reach Creatures, Vertical Ecology, Creature Materials, Husbandry, Variants & Personhood Boundaries

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ascendant Reach  
**Stable Realm ID:** `realm.major.ascendant_reach`  
**Legacy Realm Aliases:** `realm.major.aetheric_reach`; `realm.network.divine_concords`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-05A — Realm Identity, Laws, Progression & Canon Boundaries; FCC-05B — Biomes, Terrain, Altitude Bands, Regional States & Environmental Hazards; FCC-05C — Geology, Materials, Resources, Processing Foundations & Material Provenance; FCC-05D — Flora, Trees, Woods, Agriculture, Food & Botanical Ecology  
**Primary Source Reconciliation:** World Content Atlas Set 24 former Aetheric Reach and Divine Concords creature foundations; Boss/Authority Atlas authority relationships; accepted FCC-05 decisions Q473–Q492, with related ecology, material, civilisation, corruption and authority decisions through Q583.  
**Primary Scope:** exact twelve-creature roster, vertical food-web architecture, habitat suitability, migration, husbandry and settlement relationships, creature-material provenance, sustainable acquisition, biological food interfaces, divine/construct creature personhood, variants, authority relationships, corruption boundaries, off-realm viability, simulation scaling and creature-art handoff.  
**Final Global Status:** Pending final cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-05E defines the authoritative **creature and wildlife canon** of the Ascendant Reach.

It owns realm-local canon for:

- exactly twelve principal named creature families;
- preservation and reconciliation of the former Aetheric Reach and Divine Concords creature foundations;
- two FCC-expanded species required to close Thunderhead and High-Aether ecological gaps;
- creature habitat and altitude suitability;
- vertical food-web relationships;
- grazing, filter feeding, predation, decomposition, pollination, schooling, migration and route-indicator roles;
- Cloudwhale and other large-migration ecology;
- Skyback husbandry, work-animal and limited mount interfaces;
- fisheries and aquaculture relationships;
- creature-derived resource provenance;
- non-lethal and renewable acquisition where justified;
- the boundary between wildlife, divine fauna, constructs and persons;
- Edict Sentinel awakening/personhood review;
- Law Lion versus Law Lion Ascendant identity separation;
- Storm Roc versus exceptional Thunder Roc authority/boss variants;
- natural hostility and sacred-law behaviour versus Void corruption;
- variant architecture and irreversible-transformation admission;
- off-realm habitat requirements;
- low-end simulation scaling;
- creature silhouette, animation and VFX handoff constraints.

FCC-05E does **not** own:

- civilisation, citizenship, faction or settlement policy definitions — FCC-05F;
- exact placeable Blocks, portable Items, recipes, food values, harness items, cages, pens, feed quantities or processing stations — FCC-05G;
- dungeon guardian families, fixed realm authorities, variable authority foundations, Pilgrim Star, event resolution or boss reward tables — FCC-05H;
- detailed sacred-law state machines, Void corruption propagation, cleansing or restoration execution — FCC-05I;
- final stable-ID normalisation, final global creature registry, colours, textures, final rigs or art material inheritance — FCC-05J, FCC-12, FCC-13 and FCC-14;
- universal combat, taming, breeding, hunger, AI scheduling, mount physics, pathfinding, save/load, multiplayer authority or animal-welfare systems.

The governing goal is:

> **Ascendant Reach fauna must make the realm feel like a vertically connected living world whose ecology changes with altitude, storms and divine law without turning every creature into a mount, enemy, holy symbol or loot container.**

---

# 2. Creature Canon Statement

Ascendant Reach contains one connected **vertical ecology**.

The lower and middle realm supports recognisably biological sky fauna:

- grazers;
- filter feeders;
- aerial predators;
- schools and swarms;
- electrical specialists;
- cloud-sea organisms;
- migratory megafauna.

High Aether introduces organisms adapted to thin atmosphere, intense light, magical radiation and Sunmist-associated micro-ecology.

The upper Divine Concords adds wildlife and constructed life whose behaviour can interact with declared sacred law, sanctuary conditions, divine institutions and recognised ritual states.

The realm does **not** assume:

- higher altitude means all life is divine;
- divine fauna is automatically benevolent;
- sacred animals are automatically persons;
- constructs are automatically property;
- predators are automatically evil;
- dangerous wildlife is automatically Void-corrupted;
- every creature needs a unique fantasy material drop;
- every large creature is a boss;
- every boss-scale individual requires a separate species.

The core rule is:

> **Creature identity remains ecological first; divine, storm, sacred-law and authority interactions are layered onto a bounded species or construct identity rather than replacing ecology with symbolism.**

---

# 3. Exact Canonical Creature Roster

Ascendant Reach has exactly **twelve principal named creature families**:

1. **Cloudwhale**
2. **Storm Roc**
3. **Windlace Swarm**
4. **Skyback Grazer**
5. **Static Serpent**
6. **Cloudfin**
7. **Starveil Ray**
8. **Petition Dove**
9. **Mercy Hart**
10. **Halo Moth**
11. **Law Lion**
12. **Edict Sentinel**

The first five preserve former Aetheric Reach Atlas foundations.

The last five preserve former Divine Concords Atlas foundations.

**Cloudfin** and **Starveil Ray** are the two FCC-expanded species added to close missing Thunderhead-Sea and High-Aether ecological roles.

The realm may also contain:

- ambient cloud plankton;
- microscopic airborne organisms;
- small insects;
- worms;
- incidental invertebrates;
- unnamed small fish/cloud fauna;
- nest parasites;
- ordinary scavengers;
- microorganisms.

These ambient organisms do not require principal-species stable IDs unless later gameplay makes a named identity necessary.

---

# 4. Stable-ID and Legacy Reconciliation

## 4.1 Preserved Aetheric Atlas IDs

| Creature | Legacy Stable ID | FCC Status |
|---|---|---|
| Cloudwhale | `creature.realm.aetheric.cloudwhale` | preserved source/migration identity |
| Storm Roc | `creature.realm.aetheric.storm_roc` | preserved source/migration identity |
| Windlace Swarm | `creature.realm.aetheric.windlace_swarm` | preserved source/migration identity |
| Skyback Grazer | `creature.realm.aetheric.skyback_grazer` | preserved source/migration identity |
| Static Serpent | `creature.realm.aetheric.static_serpent` | preserved source/migration identity |

## 4.2 Preserved Divine Atlas IDs

| Creature | Legacy Stable ID | FCC Status |
|---|---|---|
| Petition Dove | `creature.realm.divine.petition_dove` | preserved source/migration identity |
| Mercy Hart | `creature.realm.divine.mercy_hart` | preserved source/migration identity |
| Law Lion | `creature.realm.divine.law_lion` | preserved source/migration identity |
| Halo Moth | `creature.realm.divine.halo_moth` | preserved source/migration identity |
| Edict Sentinel | `creature.realm.divine.edict_sentinel` | preserved source/migration identity |

## 4.3 FCC-Expanded Working IDs

| Creature | Working Realm-Local ID |
|---|---|
| Cloudfin | `creature.realm.ascendant.cloudfin` |
| Starveil Ray | `creature.realm.ascendant.starveil_ray` |

## 4.4 Namespace Rule

FCC-05E does not force immediate destructive renaming of the ten Atlas IDs.

During final namespace reconciliation, the project may either:

1. retain the legacy Aetheric/Divine creature IDs as canonical technical IDs with Ascendant realm membership metadata; or
2. migrate them to a unified `creature.realm.ascendant.*` namespace while preserving the old IDs as aliases.

Final global namespace normalisation belongs to FCC-05J/FCC-12/FCC-13.

No implementation may silently delete or reuse a legacy ID for a different creature.

---

# 5. Creature Classification Architecture

Creature definitions may use bounded classification fields including:

- biological animal;
- swarm/colony organism;
- aerial animal;
- cloud-sea animal;
- High-Aether specialist;
- divine/sacred fauna;
- constructed life;
- authority-linked variant;
- managed/domestication-compatible;
- protected;
- personhood-reviewed.

These fields are **not** mutually exclusive.

Physicality, sapience, personhood, ownership, sacred status and hostility are separate axes.

Examples:

- a Mercy Hart may be sacred and protected while remaining wildlife;
- a Law Lion may be divine fauna without being a god;
- an Edict Sentinel may begin as a bounded construct and later qualify as a person;
- an exceptional Storm Roc may become a named boss without changing the base species;
- a Cloudwhale may be culturally revered without gaining personhood automatically.

---

# 6. Ecological Role Matrix

| Creature | Principal Ecological Role | Major Realm Hook |
|---|---|---|
| **Cloudwhale** | colossal atmospheric filter feeder / migrator | cloud plankton, Windways, settlement-scale migration |
| **Storm Roc** | aerial apex predator | Thunderheads, Stormglass regions, large-prey pressure |
| **Windlace Swarm** | pollinator / decomposer / pressure indicator | flowering ecology, airship residue, safe-band signalling |
| **Skyback Grazer** | floating-island herd grazer | Cloudgrass, husbandry, hauling, limited riding |
| **Static Serpent** | electrical-current predator | conductive Windways, Stormreed, exposed power networks |
| **Cloudfin** | schooling Thunderhead fauna / fishery prey | dense cloud layers, fisheries, Cloudwhale food web |
| **Starveil Ray** | High-Aether filter feeder / route indicator | Sunmist-associated micro-life, survivable High-Aether currents |
| **Petition Dove** | message/sanctuary-associated fauna | threshold courts, petitions, recognised ritual infrastructure |
| **Mercy Hart** | sanctuary-linked grazer | Mercy-aligned Law Gardens, refuge ecology |
| **Halo Moth** | radiant divine pollinator | Mercy Bloom, Law Garden flowering, restorative residue |
| **Law Lion** | territorial sacred-law guardian | declared law, Domain territory, warning/test/exclusion |
| **Edict Sentinel** | constructed law guardian | threshold tests, narrow enforcement, infrastructure maintenance |

---

# 7. Cloudwhale

The **Cloudwhale** is a colossal migratory atmospheric filter feeder.

It moves through:

- cloud plankton blooms;
- humid sky currents;
- Thunderhead margins;
- broad Windway-adjacent migration paths;
- cloud micro-life concentrations.

Cloudwhales shape the realm through movement rather than through ordinary predation.

Migration may affect:

- current predictability;
- cloud ecology;
- fisheries;
- airship routing;
- settlement festivals;
- seasonal trade;
- observation/research;
- predator movement;
- storm forecasting.

Cloudwhales are not generic world bosses.

Most encounters are ecological, navigational or observational.

Cultures may:

- protect them;
- study them;
- follow migration;
- build festivals around them;
- harvest naturally shed/dead material;
- permit tightly regulated hunting;
- prohibit hunting;
- treat specific individuals as culturally important.

No one cultural policy is universal.

FCC-05E does not lock a unique mandatory Cloudwhale material.

Any hide, oil, baleen-like structure, meat or other biological output requires later concrete anatomical and recipe justification.

---

# 8. Storm Roc

The **Storm Roc** is Ascendant Reach's principal large aerial apex predator.

It is especially associated with:

- Thunderhead Seas;
- Stormglass Archipelagos;
- Storm Heights;
- exposed floating-island cliffs;
- large-prey migration routes.

It may hunt:

- Skyback Grazers;
- Cloudfin near exposed cloud layers;
- smaller aerial fauna;
- vulnerable managed livestock;
- other suitable prey.

Storm Rocs may nest on:

- storm-sheltered cliffs;
- high Cloudstone spires;
- Thunderhead structures;
- abandoned towers;
- remote islands.

Their presence can alter settlement behaviour, convoy planning, livestock protection and route safety.

Storm Rocs are not automatically evil and need not attack every visible player.

Territoriality, hunger, nesting, injury, prey pressure and event state should drive behaviour.

## 8.1 Thunder Roc Reconciliation

The old **Thunder Roc** boss hook is not a second species.

It is an exceptional:

- ancient Storm Roc;
- storm-saturated Storm Roc;
- named regional apex;
- authority-scale individual;
- title used by a culture.

Such an individual may receive a unique boss/encounter identity in FCC-05H while remaining biologically a Storm Roc unless irreversible transformation establishes otherwise.

---

# 9. Windlace Swarm

The **Windlace Swarm** is a colony-scale airborne organism identity.

It performs several low-cost but important ecological functions:

- pollination;
- decomposition of small airborne organic debris;
- consumption of cloud blooms;
- breakdown of minor airship biological waste;
- atmospheric-band indication.

The canonical gameplay entity is the **swarm/colony**, not every individual organism.

Visual presentation may imply hundreds or thousands of individuals while simulation tracks:

- swarm position;
- density;
- health;
- migration;
- pollination activity;
- pressure-band response;
- event state.

Windlace behaviour can provide environmental information.

For example, sudden absence, compression or unusual flight patterns may warn of:

- unsafe pressure bands;
- approaching turbulence;
- storm change;
- pollution;
- habitat collapse.

Critical player safety information must not rely only on Windlace behaviour; it remains an ecological cue alongside normal accessibility-safe warning systems.

No unique mandatory material is locked from Windlace Swarms.

---

# 10. Skyback Grazer

The **Skyback Grazer** is a sturdy floating-island herd animal adapted to:

- Cloudgrass Plateaus;
- broad habitable islands;
- orchard/farm edges;
- managed pasture;
- Aerial Kelp margins.

Primary diet may include:

- Cloudgrass;
- cultivated fodder;
- young Aerial Kelp;
- suitable native herbs;
- settlement feed crops where compatible.

Skybacks can use controlled descent and updraft-assisted movement to cross modest vertical or horizontal gaps.

This ability does **not** equal unrestricted flight.

## 10.1 Husbandry

Some cultures may breed and manage Skybacks as:

- livestock;
- pack animals;
- hauling animals;
- farm animals;
- limited traversal mounts;
- convoy animals.

Exact:

- taming;
- breeding;
- feed quantities;
- carrying capacity;
- riding controls;
- saddle/harness Items;
- stamina;
- movement statistics

remain universal/FCC-05G implementation data.

## 10.2 Ecological Limits

Overgrazing may damage:

- Cloudgrass;
- young Kelp;
- orchard margins;
- erosion-sensitive island edges.

Managed populations therefore interact with farming and settlement ecology rather than functioning as infinite passive resource generators.

No unique mandatory major material is locked from Skybacks.

Ordinary meat, hide, milk or similar products require later culture/anatomy/recipe admission.

---

# 11. Static Serpent

The **Static Serpent** is an electrical predator specialised for charged environments.

It may move through or follow:

- conductive Windways;
- Stormglass regions;
- Stormreed corridors;
- charged cloud fronts;
- exposed Lightning Core systems;
- electrical infrastructure.

Its ecology is tied to electrical gradients rather than arbitrary hatred of machines.

Static Serpents may:

- hunt electrically active prey;
- feed on or discharge stored charge;
- investigate exposed power networks;
- create route hazards;
- gather near storm-harvesting sites;
- be deliberately attracted for controlled research or harvesting activities.

## 11.1 Legitimate Creature Materials

Where anatomy supports them, possible ordinary/specialist outputs include:

- conductive scales;
- shed skin;
- charged gland/organ material;
- electrical venom/reagent.

These are **creature-derived materials**, not substitutes for geological **Lightning Cores**.

A Static Serpent does not normally drop a Lightning Core.

Exact Item admission belongs to FCC-05G/J.

---

# 12. Cloudfin

The **Cloudfin** is a schooling ray/fish-like animal adapted to Thunderhead Seas and dense cloud-fluid environments.

It "swims" through:

- dense cloud layers;
- suspended water masses;
- cloud-fluid currents;
- humid storm pockets.

Cloudfin fill an important middle food-web role.

They may serve as:

- prey for Storm Rocs;
- prey/food-web input for larger cloud fauna;
- fishery resource;
- aquaculture species;
- environmental storm indicators.

Cloudfin cannot live indefinitely in ordinary thin open air.

Outside compatible dense/moist atmosphere they become stressed and eventually require:

- contained humid habitat;
- artificial cloud chamber;
- suspended water environment;
- other validated managed habitat.

Different cultures may:

- fish them;
- farm them;
- protect breeding grounds;
- treat them as common food;
- use schooling behaviour for weather prediction.

No unique fantasy material is locked.

Their primary resource role is biological food/fishery production where culture and recipes permit.

---

# 13. Starveil Ray

The **Starveil Ray** is a broad-winged, slow-moving High-Aether filter feeder.

It is adapted to:

- thin atmosphere;
- severe cold;
- intense high-altitude light;
- magical/radiant exposure;
- Sunmist-rich currents.

Its diet may include:

- airborne micro-life;
- Sunmist-associated microorganisms;
- fine organic particles;
- high-altitude plankton analogues.

Starveil Rays migrate between survivable High-Aether routes and rare habitat islands.

Their presence may indicate:

- persistent survivable current bands;
- Sunmist-rich zones;
- lower local turbulence;
- suitable micro-ecological conditions.

They are not a perfect safety oracle.

High-Aether survival still requires normal equipment, route knowledge and hazard checks.

Starveil Rays are not automatically divine.

No unique mandatory material is locked.

---

# 14. Petition Dove

The **Petition Dove** is sacred/message-associated fauna common around:

- Pilgrim Thresholds;
- Covenant Courts;
- Tribunal precincts;
- sanctuaries;
- formal petition routes;
- recognised ritual infrastructure.

It may participate in authored systems involving:

- carrying physical messages;
- delivering petitions;
- witnessing a recognised ritual action;
- nesting near lawful threshold sites;
- marking functional court infrastructure.

A Petition Dove does **not**:

- know every legal truth;
- detect every lie;
- prove divine approval by mere presence;
- replace written records or authoritative law state.

Feathers, eggs or ordinary biological products are not mandatory specialist materials.

Cultural treatment may range from protected sacred fauna to ordinary managed messenger animal depending on society.

---

# 15. Mercy Hart

The **Mercy Hart** is a sanctuary-linked grazer associated especially with:

- Mercy Wells;
- Mercy-aligned Law Gardens;
- refuge valleys;
- protected sacred meadows;
- sanctuary settlements.

It feeds on compatible:

- grasses;
- Mercy-aligned flora;
- herbs;
- cultivated sanctuary vegetation.

The old "calming aggression" concept is bounded.

A Mercy Hart may participate in a **recognised Mercy-domain environmental state** that reduces aggression or reinforces sanctuary cues.

It does not emit universal mind control.

If refuge law is broken, the Hart may:

- flee;
- become distressed;
- stop providing a sanctuary cue;
- move away from the affected site;
- react to changed Domain state.

Mercy Harts may be:

- protected;
- culturally sacred;
- selectively managed;
- relocated for restoration projects.

No unique mandatory major material is locked.

Antlers, hide, meat or other ordinary products require explicit cultural/anatomical justification before registry admission.

---

# 16. Halo Moth

The **Halo Moth** is a radiant pollinator associated with upper Divine Concord ecology.

It commonly interacts with:

- Mercy Bloom;
- compatible Law Garden flowering;
- Sunmist Bloom where conditions overlap;
- sacred horticulture;
- blessing-rich flora.

Halo Moths may distribute **minor restorative residue** through normal biological/ecological activity.

This residue is:

- bounded;
- local;
- not a universal healing potion;
- not a generic divine resource family by default.

If a later recipe requires a collectible Halo Moth residue, FCC-05G/J must assign:

- exact provenance;
- acquisition method;
- ecological cost;
- storage behaviour;
- Item identity.

Normal progression should favour non-lethal collection where a renewable output is used.

---

# 17. Law Lion

The **Law Lion** is a territorial divine guardian fauna family aligned to one declared sacred law or principle.

A Law Lion is not universally hostile.

Depending on domain and law, it may:

- warn;
- observe;
- escort;
- challenge;
- test;
- exclude;
- defend;
- hunt deliberate violators;
- accept recognised exceptions.

Its behaviour must consume explicit domain-law state.

It may not infer arbitrary morality from uncontrolled player intent.

Examples of possible law relationships include:

- hospitality;
- declared challenge;
- sanctuary;
- property;
- testimony;
- oath;
- boundary access.

The exact law is part of its territory/instance context, not a different lion species.

## 17.1 Law Lion Ascendant Separation

**Law Lion** is the creature family.

**Law Lion Ascendant** is a fixed realm authority defined in FCC-05H with legacy stable ID:

`boss.realm.divine.law_lion_ascendant`

The authority is an exceptional manifestation/individual of the broader Law Lion identity.

It is not a thirteenth creature species.

Normal Law Lions and the Law Lion Ascendant must not share one stable entity definition.

---

# 18. Edict Sentinel

The **Edict Sentinel** is a constructed-life family used by divine institutions and domain-law infrastructure.

Possible functions include:

- guarding thresholds;
- administering tests;
- validating narrow permissions;
- challenging trespass;
- maintaining Law Engines;
- protecting civic/sacred infrastructure;
- issuing bounded warnings.

An Edict Sentinel must operate against explicit authored rules.

It may not improvise unlimited sacred law.

## 18.1 Construct Origin

Most Edict Sentinels may begin as bounded constructs with:

- assigned function;
- persistent maintenance state;
- access rules;
- limited decision scope.

This does not permanently settle personhood.

## 18.2 Awakening and Personhood Review

If an Edict Sentinel develops:

- persistent selfhood;
- durable autobiographical memory;
- independent goals;
- moral agency;
- relationships;
- self-directed behaviour;
- capacity to refuse or reinterpret its role,

it requires universal personhood review.

If personhood is recognised, it may not be treated as owned equipment merely because it was constructed.

Recognised persons may potentially:

- resign;
- change allegiance;
- hold citizenship;
- own property;
- form relationships;
- refuse unsafe orders;
- challenge creators or institutions.

FCC-05F owns the resulting civic/social status.

---

# 19. Habitat and Altitude Suitability Matrix

| Creature | Primary Habitat / Biomes | Secondary / Conditional Habitat |
|---|---|---|
| Cloudwhale | Thunderhead Seas, broad cloud-current regions | Aetheric Reach migration corridors, Storm Heights |
| Storm Roc | Thunderhead Seas, Stormglass Archipelagos | Skyforge cliffs, exposed Cloudgrass margins |
| Windlace Swarm | Cloudgrass Plateaus, Aerial Kelp Fields | Windways, orchard regions, settlement airspace |
| Skyback Grazer | Cloudgrass Plateaus | Aerial Kelp margins, orchard/farm regions |
| Static Serpent | Stormglass Archipelagos, Storm Heights | conductive Windways, storm infrastructure |
| Cloudfin | Thunderhead Seas | contained cloud/water habitats |
| Starveil Ray | High Silence Expanse | upper Pilgrim Threshold routes, rare High-Aether corridors |
| Petition Dove | Pilgrim Thresholds, Radiant Tribunal Cities | Law Gardens, Concordant Firmament |
| Mercy Hart | Law Gardens / Mercy Wells | sanctuary settlements, protected upper meadows |
| Halo Moth | Law Gardens | Pilgrim Threshold gardens, sacred horticulture |
| Law Lion | Law Gardens, Concordant Firmament | War-Saint Fields, Tribunal/domain territory |
| Edict Sentinel | Law Engines, Tribunal/Threshold infrastructure | Concordant Firmament, sacred civic sites |

This is suitability rather than absolute spawn exclusivity.

Events, migration, settlement management, authority state and corruption may produce valid out-of-biome occurrences.

---

# 20. Vertical Food-Web Architecture

Ascendant Reach must preserve a functioning food web across altitude.

## 20.1 Producers / Primary Ecological Inputs

- Cloudgrass;
- Aerial Kelp;
- Cloudgrain and managed fodder;
- Skywood/Cloudfruit ecosystems;
- Windherb;
- Stormreed;
- Starlichen;
- Sunmist Bloom;
- Law-grown flora;
- Mercy Bloom;
- ambient cloud plankton;
- microorganisms.

## 20.2 Grazers / Herbivores

- Skyback Grazer;
- Mercy Hart.

## 20.3 Pollinators / Decomposers / Small Consumers

- Windlace Swarm;
- Halo Moth;
- ambient insects and microorganisms.

## 20.4 Schooling / Fishery Fauna

- Cloudfin.

## 20.5 Large Filter Feeders

- Cloudwhale;
- Starveil Ray.

## 20.6 Apex / Specialist Predators

- Storm Roc;
- Static Serpent.

## 20.7 Sacred-Law Guardians

- Law Lion;
- Edict Sentinel.

Law Lions and Edict Sentinels are not required to fit ordinary predator-prey energy flow in the same way as biological wildlife, but their territories still interact with living ecology and settlement pressure.

---

# 21. Migration Architecture

Migration is a major Ascendant ecological system.

Supported migration forms include:

- Cloudwhale long-range movement;
- Cloudfin schooling shifts;
- Skyback herd movement;
- Storm Roc prey-following and nesting movement;
- Windlace swarm drift;
- Starveil Ray High-Aether migration;
- Petition Dove route movement;
- Mercy Hart sanctuary relocation.

Migration may respond to:

- Windway change;
- cloud bloom;
- storm state;
- food availability;
- breeding/nesting state;
- habitat loss;
- High-Aether Surge;
- Migration Tide;
- Pilgrimage Convergence;
- settlement disturbance;
- authority outcomes;
- Void corruption.

Not all migration requires individual simulation.

Distant migration may be represented as aggregate population/route records and instantiated when relevant.

---

# 22. Cloudwhale Migration as World-Scale Ecology

Cloudwhale movement may have persistent regional effects including:

- altered cloud-plankton density;
- changed airship route planning;
- temporary Windway congestion;
- predator movement;
- settlement tourism/festival activity;
- fishery changes;
- research opportunities.

Cloudwhale migration events must not randomly destroy settlements without telegraphing and counterplay.

Major migration is an ecological event first, not a scripted boss attack.

---

# 23. Husbandry, Domestication and Management Classes

Creature families may expose settlement-facing relationship classes including:

- wild;
- tolerated;
- protected;
- managed;
- husbandry-compatible;
- aquaculture-compatible;
- work animal;
- limited mount;
- messenger animal;
- sacred/protected fauna;
- dangerous/regulatory concern;
- constructed service entity;
- personhood-protected.

These classes are not universal moral labels.

Examples:

- Skyback Grazer may be husbandry-compatible, work-animal and limited-mount capable.
- Cloudfin may be fishery/aquaculture compatible.
- Petition Dove may be messenger-managed.
- Mercy Hart may be protected or sanctuary-managed.
- Halo Moth may be protected pollinator ecology.
- Cloudwhale may be protected, hunted under law, or culturally revered.
- Edict Sentinel may be an institutional construct or recognised person depending on state.

FCC-05F owns culture-specific law and policy.

---

# 24. Skyback Work and Mount Boundary

Skybacks are the principal canonical domestication/work-animal relationship of Ascendant Reach.

Supported broad capabilities may include:

- cargo hauling;
- farm work;
- caravan support;
- controlled descent;
- short gap crossings using updrafts;
- route assistance.

Skyback riding must not obsolete:

- gliders;
- airships;
- flying creatures;
- Windways;
- vertical lifts;
- high-tier aerial traversal.

A Skyback is a grounded/limited aerial traversal partner, not unlimited free flight.

---

# 25. Fisheries and Aquaculture

Thunderhead and dense-cloud settlements may support:

- Cloudfin fisheries;
- Cloudfin aquaculture;
- other unnamed incidental cloud-sea food organisms;
- imported water-food species where habitat permits.

Fisheries should interact with:

- breeding areas;
- storm state;
- water/cloud quality;
- Cloudwhale migration;
- Storm Roc predation;
- settlement demand;
- overharvest.

Creature-derived food remains ordinary food under universal nutrition systems.

Ascendant Reach does not require a separate "sky hunger" system.

---

# 26. Creature-Derived Resource Matrix

Only relationships justified by canon are admitted as major hooks.

| Creature | Canonical / Potential Resource Relationship | Boundary |
|---|---|---|
| Cloudwhale | ordinary biological products only if later admitted | no mandatory unique material |
| Storm Roc | ordinary feather/talon/etc. only if later justified | no mandatory unique material |
| Windlace Swarm | no mandatory major material | ecological service primary |
| Skyback Grazer | food/hide/milk/etc. only where culture/recipe admits | no mandatory unique material |
| Static Serpent | conductive scales, shed skin, charged gland/venom-type reagent may be admitted | never source of geological Lightning Core |
| Cloudfin | biological food/fishery output | no unique fantasy material required |
| Starveil Ray | no mandatory major material | ecological indicator/filter feeder |
| Petition Dove | ordinary biological products only if justified | message/sanctuary role primary |
| Mercy Hart | ordinary biological products only if justified | protection/sanctuary role primary |
| Halo Moth | minor restorative residue may be admitted as renewable product | not generic divine essence |
| Law Lion | no mandatory material | sacred-law role primary |
| Edict Sentinel | constructed components only where ownership/personhood and salvage law permit | persons cannot be treated as loot |

No creature automatically drops:

- Lightning Core;
- Stormglass;
- Celestial Metal;
- Halo Glass;
- Hymnstone;
- Blessing Salt;
- generic Divine Essence;
- generic Sacred Essence;
- generic Ascendant Essence.

---

# 27. Thunder Pearl Provenance Closure

**Thunder Pearl** remains a canonical minor/specialist Thunderhead biomineral product under FCC-05C.

FCC-05E does **not** force Thunder Pearl onto one of the twelve principal species merely to create a loot hook.

Its normal provenance may come from:

- unnamed small Thunderhead filter fauna;
- mollusc-like cloud-sea organisms;
- sessile biomineralising organisms;
- other incidental Thunderhead ecology.

This does not require a thirteenth principal creature family.

If a later named species becomes gameplay-bearing enough to own Thunder Pearl production, that requires explicit FCC amendment rather than silent roster inflation.

---

# 28. Sustainable Acquisition

Legitimate creature-resource acquisition may include:

- shedding;
- moulting;
- naturally discarded material;
- naturally deceased specimens;
- managed husbandry;
- aquaculture;
- renewable biological output;
- trade;
- salvage;
- controlled hunting;
- population management.

The game does not require one universal moral stance toward hunting.

However, resource systems should permit ecological consequences where gameplay exposes them.

Overharvest may affect:

- pollination;
- prey availability;
- predator movement;
- migration;
- fisheries;
- sanctuary ecology;
- settlement food supply;
- cultural relations;
- conservation law.

---

# 29. Protected and Sacred Species Boundary

Sacred or protected status is a cultural/legal state.

It does not imply:

- immortality;
- sapience;
- personhood;
- invulnerability;
- automatic divine punishment.

Possible protected species include:

- Cloudwhales;
- Mercy Harts;
- Halo Moths;
- Petition Doves;
- selected Law Lions;
- culturally significant Storm Rocs.

Specific policies belong to FCC-05F.

A protected animal can still be injured by ecology, corruption, accident or illegal action.

---

# 30. Creature Personhood Boundary

Creature family and personhood are separate concepts.

Most FCC-05E species are wildlife.

Personhood is not automatically granted by:

- divine appearance;
- large size;
- sacred symbolism;
- magical ability;
- construct origin;
- long lifespan.

Personhood is also not automatically denied by:

- animal body;
- constructed origin;
- assigned service role.

Where an individual meets the universal personhood threshold, resource, ownership, combat and civilisation systems must respect that status.

This is especially important for **Edict Sentinels**.

---

# 31. Law-Responsive Behaviour

Law Lions and Edict Sentinels can respond to sacred law only through bounded authored state.

The system should represent at least:

- applicable Domain;
- declared law identity;
- territorial boundary;
- recognised exceptions;
- permission state;
- warning/test state;
- violation state;
- current authority;
- law suspension/conflict state where relevant.

Creature AI must not use uncontrolled natural-language moral reasoning to invent consequences.

---

# 32. Natural Threats vs Sacred-Law Threats vs Void Threats

These are distinct.

## 32.1 Natural Threats

Examples:

- Storm Roc predation;
- Static Serpent infrastructure attraction;
- Skyback defensive behaviour;
- Cloudfin habitat stress;
- Cloudwhale migration collision risk;
- natural disease;
- hunger;
- territoriality.

## 32.2 Sacred-Law Threats

Examples:

- Law Lion challenge;
- Edict Sentinel denial;
- Mercy sanctuary response;
- Domain-specific exclusion.

These require recognised sacred-law provenance.

## 32.3 Void Threats

Void corruption requires actual Void provenance.

A hostile Law Lion is not automatically corrupted.

A broken Edict Sentinel is not automatically corrupted.

A starving Storm Roc is not automatically corrupted.

---

# 33. Void Corruption

Void corruption uses state/variant treatment first.

It may alter:

- aggression;
- movement;
- anatomy presentation;
- migration;
- habitat tolerance;
- law responsiveness;
- electrical behaviour;
- feeding;
- abilities;
- contamination output.

A distinct transformed creature definition is justified only when irreversible change creates genuinely new:

- anatomy;
- lifecycle;
- ecological role;
- behaviour;
- combat model;
- material outputs;
- persistent identity.

No automatic `Corrupted Cloudwhale`, `Corrupted Mercy Hart` or equivalent registry family is generated for all twelve species.

---

# 34. Cleansing and Restoration

Cleansing corruption does not automatically restore:

- population size;
- habitat;
- migration routes;
- trust;
- sanctuary law;
- construct memory;
- prior behaviour.

Restoration may require:

- habitat repair;
- food-web recovery;
- reintroduction;
- settlement policy change;
- infrastructure repair;
- law repair;
- authority resolution.

A cleansed Edict Sentinel may still reject its former role.

A cleansed Law Lion may still enforce a law the player opposes.

---

# 35. Injury, Disease and Ecological Stress

Creature states may include:

- injury;
- hunger;
- dehydration where biological;
- respiratory/pressure stress;
- cold stress;
- electrical overload;
- disease;
- parasite load;
- habitat loss;
- breeding-site loss;
- food shortage;
- migration disruption;
- captivity stress;
- sacred-domain disturbance;
- pollution;
- overpopulation.

These states are not automatically Void corruption.

---

# 36. Reproduction and Population

Ascendant creatures should reuse shared lifecycle systems where practical.

Possible reproductive patterns include:

- egg laying;
- live birth;
- spawning;
- larval/cocoon;
- colony reproduction;
- constructed assembly/activation.

Exact breeding mechanics do not need full simulation for every wild species.

Gameplay-relevant population outcomes should persist when exposed, including:

- local extinction;
- overpopulation;
- herd size;
- fishery collapse;
- pollinator decline;
- migration change;
- protected-species recovery;
- managed stock.

Edict Sentinel construction/activation is not biological reproduction and belongs partly to institutional/structure systems.

---

# 37. Nest, Den and Breeding-Site Architecture

Species may use reusable habitat modules including:

- Storm Roc cliff nests;
- Windlace nesting/bloom clouds;
- Skyback herd resting grounds;
- Static Serpent charged dens;
- Cloudfin spawning pockets;
- Starveil Ray migratory resting zones;
- Petition Dove rookeries;
- Mercy Hart refuge meadows;
- Halo Moth cocoon gardens;
- Law Lion territorial sanctums;
- Edict Sentinel maintenance/activation stations.

These are ecology/site modules, not automatically dungeons.

Worldgen should respect terrain/hazard suitability rather than placing nests arbitrarily.

---

# 38. AI and Behaviour Architecture

Creature behaviour should reuse shared modules such as:

- fly;
- glide;
- swim/cloud-swim;
- walk;
- herd;
- school;
- swarm;
- filter feed;
- graze;
- forage;
- pollinate;
- scavenge;
- patrol;
- guard;
- migrate;
- nest;
- flee;
- defend;
- hunt;
- investigate;
- rest;
- follow route/current;
- respond to storm;
- respond to sacred law;
- respond to corruption.

Species identity comes from parameterisation plus bounded specialist modules rather than twelve unrelated AI systems.

Examples:

- Cloudwhale adds megafauna migration/current-following.
- Windlace uses swarm/colony simulation.
- Static Serpent responds to electrical gradients.
- Starveil Ray responds to High-Aether/Sunmist suitability.
- Law Lion consumes declared-law state.
- Edict Sentinel consumes authored institutional rule state.

---

# 39. Variant Architecture

Variants may depend on:

- altitude;
- biome;
- age;
- sex where useful;
- wild/managed state;
- health;
- diet;
- storm exposure;
- charge level;
- breeding line;
- sacred-law alignment;
- institution;
- equipment/harness;
- event;
- corruption.

Variants normally remain one species/construct family where anatomy and core gameplay remain fundamentally the same.

Examples:

- managed and wild Skybacks remain Skyback Grazers;
- different Law Lion law alignments remain Law Lions;
- Storm Roc regional colour/size variants remain Storm Rocs;
- Cloudfin schools may vary by storm region without new species;
- Edict Sentinels with different assigned edicts remain one family unless construction/anatomy and gameplay fundamentally diverge.

---

# 40. Fixed and Variable Authority Interfaces

FCC-05H owns authority identities.

FCC-05E provides biological/creature relationships only.

Important boundaries:

- **Storm Roc** → exceptional Thunder Roc may become a regional/boss individual.
- **Law Lion** → **Law Lion Ascendant** is a fixed authority manifestation/individual, not another species.
- **Tempest Leviathan** is not automatically a Cloudwhale.
- **Gravity Choir Sovereign** is not ordinary wildlife.
- **Fallen Saint** is not a creature-family variant.
- **Concord Judge** is not a Law Lion.
- **Pilgrim Star** is a roaming variable authority/event foundation, not ordinary fauna.
- **Sky-King Automaton** is a boss/authority construct, not an Edict Sentinel by default.

Shared themes do not merge definitions.

---

# 41. Creature–Flora Interfaces

FCC-05E consumes FCC-05D botanical canon.

Important relationships include:

- **Skyback Grazer ↔ Cloudgrass / cultivated fodder / young Aerial Kelp**;
- **Windlace Swarm ↔ flowering plants / decomposition / cloud blooms**;
- **Cloudwhale ↔ cloud micro-life and atmospheric blooms**;
- **Cloudfin ↔ cloud micro-life / Thunderhead ecology**;
- **Storm Roc ↔ prey populations supported by plant ecology**;
- **Static Serpent ↔ Stormreed / conductive vegetation corridors**;
- **Starveil Ray ↔ Starlichen / Sunmist-associated micro-ecology**;
- **Mercy Hart ↔ sanctuary grasses / Mercy-aligned flora**;
- **Halo Moth ↔ Mercy Bloom / Law Garden flowering / compatible Sunmist Bloom**;
- **Law Lion / Edict Sentinel ↔ law-grown flora as territory/context cues**, not default food.

Creature systems should reinforce the plant ecology rather than function as disconnected spawn tables.

---

# 42. Creature–Material Interfaces

FCC-05E consumes FCC-05C material truth.

Relevant interactions include:

- Stormglass terrain influencing electrical fauna;
- Lightning Core infrastructure attracting/reacting with Static Serpents;
- Skyiron/Celestial infrastructure affecting habitat and settlement conflict;
- Sunmist supporting High-Aether micro-ecology;
- Aether Gas systems creating containment/habitat risks;
- Hymnstone and sacred-law materials interacting with Law Lions and Edict Sentinels;
- Blessing Salt or sacred infrastructure affecting sanctuary/guardian behaviour where later systems explicitly support it.

Creature AI may react to a material without becoming its source.

---

# 43. Creature–Civilisation Interfaces

FCC-05F may use creatures for:

- husbandry;
- freight;
- riding;
- fisheries;
- aquaculture;
- messenger systems;
- protected wildlife;
- sacred symbolism;
- hunting;
- conservation;
- pest/predator management;
- ecological tourism;
- research;
- route forecasting;
- constructed civic service;
- personhood politics.

FCC-05F may not redefine core creature biology merely to fit a culture.

Cultural variants should normally use:

- equipment;
- harness;
- markings;
- ownership;
- training;
- diet;
- selective breeding;
- legal status;
- habitat

rather than duplicate species IDs.

---

# 44. Creature–Dungeon Interfaces

FCC-05H may use the twelve creature families as:

- ambient fauna;
- non-hostile objectives;
- navigation indicators;
- ecological complications;
- protected creatures;
- corrupted variants;
- elite regional individuals;
- territory constraints.

Dungeon guardians remain separate encounter-role definitions.

A Storm Temple does not automatically spawn a Storm Roc.

A Law Engine does not automatically contain an Edict Sentinel unless its authored site definition supports that relationship.

---

# 45. Cross-Realm Export and Habitat Suitability

Living Ascendant creatures use compatibility categories such as:

- fully compatible;
- requires managed habitat;
- stressed;
- loses specialist capability;
- dormant/inactive;
- invasive risk;
- cannot survive long-term.

Examples:

- Skybacks may live off-realm where gravity, food and climate are suitable.
- Petition Doves may survive physically outside Ascendant Reach but lose some sacred-infrastructure behaviour.
- Cloudfin require dense moist/cloud habitat.
- Starveil Rays require specialist High-Aether-like habitat.
- Static Serpents may survive but lose access to strong electrical-current ecology.
- Mercy Harts may remain normal grazers while Mercy-domain behaviour becomes inactive.
- Halo Moths may require compatible sacred flora to retain full ecological role.
- Law Lions may lose or alter law-responsive behaviour outside a compatible recognised Domain.
- Edict Sentinels can function off-realm only where their power, maintenance and legal-state requirements are satisfied.

Moving a creature off-realm never creates a second Ascension Gate or alternate realm-access method.

---

# 46. Invasive and Escaped-Population Boundary

Cross-realm creatures may become invasive where:

- climate is compatible;
- predators are absent;
- food is abundant;
- reproduction succeeds;
- settlement release is uncontrolled.

This is a bounded ecological interface.

The game does not need to simulate every possible species × realm combination.

FCC-05I/global reconciliation may define compatibility profiles rather than bespoke pairwise rules.

---

# 47. Creature Death Boundary

Creature death uses universal creature/death systems.

FCC-05E does not create:

- a divine afterlife record for every dead animal;
- automatic ascension;
- automatic spirit conversion;
- generic Divine Essence;
- generic Ascendant Essence.

Specific supernatural exceptions may exist only when authored by a dungeon, authority, event or culture definition.

---

# 48. Combat and Non-Combat Outcomes

Not every creature encounter is combat-first.

Supported outcomes may include:

- observe;
- avoid;
- feed;
- guide;
- rescue;
- heal;
- relocate;
- protect;
- manage;
- tame where supported;
- harvest renewable output;
- fish;
- hunt;
- defend;
- negotiate where personhood/intelligence supports it;
- cleanse corruption;
- restore habitat;
- repair/reprogram where an Edict Sentinel is a non-person construct;
- respect/refuse/test sacred-law interaction.

Universal combat owns damage and core combat execution.

FCC-05E owns ecological meaning and species identity.

---

# 49. Loot Philosophy

There is no generic "Ascendant creature loot table" that produces unrelated realm resources.

Creature rewards must come from:

- actual anatomy;
- legitimate biological production;
- constructed components where ownership/personhood permits;
- carried/attached objects where justified;
- context-specific contamination;
- ecological outcome;
- trade or institutional reward.

A creature cannot drop Cloudstone, Skyiron, Stormglass, Hymnstone or Celestial Metal simply because those materials belong to the same realm unless the creature actually incorporates or carries them for a defined reason.

---

# 50. Accessibility and Readability

Creature behaviour used as environmental warning must have accessibility-safe support.

Examples:

- Windlace pressure signalling cannot rely only on subtle swarm colour.
- Cloudfin storm movement cannot be the only warning of Thunderhead hazard.
- Starveil Ray presence cannot be the only cue for survivable High-Aether routes.
- Law Lion warnings require readable declared-law feedback.
- Edict Sentinel tests require explicit rules and failure conditions.
- electrical charge on Static Serpents requires non-colour cues where relevant.

Reduced-flash settings must apply to:

- lightning interactions;
- electrical attacks;
- radiant Halo Moth effects;
- Law Lion/Edict Sentinel divine effects.

Reduced motion settings may simplify swarm, cloud-swim and large-migration presentation without altering authoritative state.

---

# 51. Performance and Simulation Scaling

Creature canon remains identical across performance profiles.

Lower-end modes may reduce:

- active wild-creature density;
- distant flock/school member count;
- Windlace visual particle count;
- Cloudfin rendered school size;
- migration actor detail;
- animation complexity;
- VFX density;
- off-screen individual AI;
- update frequency.

Distant ecology may use aggregate records for:

- population;
- migration route;
- protected status;
- breeding/fishery state;
- husbandry stock;
- corruption state;
- event participation.

Scaling may not change authoritative:

- species presence;
- gameplay-relevant population outcomes;
- managed-animal ownership;
- resource conservation;
- migration outcome;
- protected/endangered status where used;
- personhood state;
- corruption;
- authority identity.

No performance mode may silently generate extra creature resources.

---

# 52. Art, Animation, Audio and VFX Handoff

Later art governance must preserve distinct silhouette and ecological readability.

## Cloudwhale
- colossal buoyant whale-like profile;
- slow migratory movement;
- must read as fauna rather than airship or island;
- filtering/feeding animation hooks.

## Storm Roc
- very large aerial predator;
- powerful wing silhouette;
- storm-adapted without defaulting to a generic dragon;
- nesting and dive-attack readability.

## Windlace Swarm
- swarm/colony identity;
- readable collective motion;
- scalable particle/mesh representation;
- pollinator/decomposer rather than hostile magic-cloud language.

## Skyback Grazer
- broad stable herd-animal silhouette;
- strong legs/body for hauling;
- limited glide/descent anatomy;
- harness and cargo sockets.

## Static Serpent
- long electrical aerial/current-travelling silhouette;
- strong non-colour charge cues;
- distinct from Void serpents.

## Cloudfin
- schooling cloud-swimmer silhouette;
- must read as cloud-sea fauna rather than ordinary fish floating arbitrarily in air.

## Starveil Ray
- broad slow High-Aether ray profile;
- sparse elegant motion;
- must remain non-divine wildlife by default.

## Petition Dove
- recognisable bird/message silhouette;
- ritual bands/containers may be equipment rather than anatomy;
- not a glowing humanoid spirit.

## Mercy Hart
- elegant but grounded grazer;
- sanctuary cues distinct from generic "holy deer";
- readable distress/flee behaviour.

## Halo Moth
- radiant moth/pollinator silhouette;
- reduced-flash compatible;
- restorative residue visual must remain subtle and bounded.

## Law Lion
- powerful territorial feline/guardian silhouette;
- law alignment expressed through environment/insignia/state rather than twelve species skins;
- warnings must be readable before aggression.

## Edict Sentinel
- construct-like law guardian;
- clear maintenance/assembly language;
- personhood-capable facial/body language if awakened;
- must not visually imply that all constructs are mindless robots.

Exact palettes, texture families, rig specifications and final material inheritance remain deferred.

---

# 53. Working Final Creature Registry

| # | Stable / Working ID | Display Name | Core Role | Major Resource Hook |
|---:|---|---|---|---|
| 1 | `creature.realm.aetheric.cloudwhale` | **Cloudwhale** | colossal migratory filter feeder | none mandatory |
| 2 | `creature.realm.aetheric.storm_roc` | **Storm Roc** | aerial apex predator | none mandatory |
| 3 | `creature.realm.aetheric.windlace_swarm` | **Windlace Swarm** | pollinator/decomposer swarm | none mandatory |
| 4 | `creature.realm.aetheric.skyback_grazer` | **Skyback Grazer** | herd/work animal | ordinary husbandry products only if admitted |
| 5 | `creature.realm.aetheric.static_serpent` | **Static Serpent** | electrical predator | conductive biological components may be admitted |
| 6 | `creature.realm.ascendant.cloudfin` | **Cloudfin** | Thunderhead schooling fauna | fishery/food interface |
| 7 | `creature.realm.ascendant.starveil_ray` | **Starveil Ray** | High-Aether filter feeder | none mandatory |
| 8 | `creature.realm.divine.petition_dove` | **Petition Dove** | messenger/sanctuary fauna | none mandatory |
| 9 | `creature.realm.divine.mercy_hart` | **Mercy Hart** | sanctuary grazer | none mandatory |
| 10 | `creature.realm.divine.halo_moth` | **Halo Moth** | radiant pollinator | renewable minor restorative residue may be admitted |
| 11 | `creature.realm.divine.law_lion` | **Law Lion** | territorial sacred-law guardian | none mandatory |
| 12 | `creature.realm.divine.edict_sentinel` | **Edict Sentinel** | constructed law guardian | component salvage only where legally/personhood-valid |

---

# 54. Source Reconciliation Register

| Earlier Direction | FCC-05E Resolution |
|---|---|
| Aetheric Reach has five foundation creature families | all five preserved |
| Divine Concords has five foundation creature families | all five preserved |
| merged realm needs fuller production ecology | expanded to exactly twelve principal families |
| Thunderhead ecology lacks a schooling/fishery species | **Cloudfin** added |
| High Aether lacks a dedicated non-divine specialist species | **Starveil Ray** added |
| Cloudwhale as world-scale migrator | retained as ecology/migration foundation, not ordinary boss |
| Cloudwhale hunting/protection question | cultural variation allowed; no universal mandatory hunting stance |
| Skyback Grazer as controlled-fall herd animal | retained and promoted to principal husbandry/work-animal relationship |
| Windlace Swarm would imply thousands of AI actors | swarm/colony is canonical gameplay entity |
| Storm Roc and Thunder Roc both appear | Thunder Roc becomes exceptional Storm Roc boss/title/individual, not duplicate species |
| Static Serpent tied to storm infrastructure | retained; creature materials may be conductive biological products, never geological Lightning Core |
| Divine Petition Dove carries/witnesses petitions | retained but bounded; not truth oracle |
| Mercy Hart calms aggression | bounded to recognised Mercy-domain sanctuary conditions |
| Halo Moth distributes restorative residue | retained as bounded ecological output, not generic divine essence |
| Law Lion enforces one law | retained with explicit authored law-state dependency |
| Law Lion Ascendant | fixed authority manifestation/individual of broader Law Lion identity, not separate species |
| Edict Sentinel is construct-like | retained as constructed-life family |
| awakened Edict Sentinel requires personhood review | locked; construct origin does not negate personhood |
| every creature needs a unique material drop | rejected |
| Thunder Pearl needs a named species source | rejected; ambient Thunderhead biomineral fauna may provide it without roster inflation |
| natural hostility equals corruption | rejected |
| sacred-law hostility equals corruption | rejected |
| every corrupted creature becomes separate species | rejected; state-first rule applies |
| legacy Aetheric/Divine creature IDs should vanish after merger | rejected; preserve as source/migration identities pending global namespace normalisation |

---

# 55. Cross-Document Interfaces

## FCC-05A

Supplies:

- merged-realm identity;
- five macro-altitude bands;
- progression stages;
- sacred-law boundaries;
- one-portal rule;
- universal death/respawn exclusion;
- fixed and variable authority snapshot.

## FCC-05B

Supplies:

- twelve biomes;
- Windways;
- altitude/atmosphere/gravity profiles;
- regional states;
- hazards;
- migration and environmental suitability inputs.

## FCC-05C

Supplies:

- material identities;
- Thunder Pearl;
- Lightning Core provenance;
- Sunmist/Aether Gas interfaces;
- Hymnstone/divine-material boundaries;
- export/stabilisation rules.

## FCC-05D

Supplies:

- twelve flora foundations;
- six crop families;
- Cloudgrass;
- Aerial Kelp;
- Stormreed;
- Starlichen/Sunmist ecology;
- Mercy/Law Garden flora;
- plant-side food-web inputs.

## FCC-05F

Consumes:

- husbandry;
- livestock/work relationships;
- fisheries;
- messenger fauna;
- protected/sacred wildlife;
- hunting/conservation policies;
- Edict Sentinel personhood/citizenship interfaces.

## FCC-05G

Consumes:

- exact creature-derived Item admission;
- food/fishery products;
- harness/saddle/cage/pen equipment where justified;
- husbandry and aquaculture structures;
- renewable biological resource processing.

## FCC-05H

Consumes:

- Storm Roc/Thunder Roc relationship;
- Law Lion/Law Lion Ascendant relationship;
- creature variants in dungeons/events;
- Cloudwhale migration and other ecology for authority/event outcomes.

## FCC-05I

Owns:

- detailed corruption propagation;
- cleansing/restoration;
- sacred-law state transitions;
- cross-realm ecological-state consequences;
- irreversible-transformation admission where later required.

## FCC-05J

Must certify:

- exactly twelve principal creature families;
- legacy-ID preservation;
- two FCC-expanded families;
- food-web completeness;
- husbandry/fishery/protected-species coverage;
- creature-resource provenance;
- no orphan Thunder Pearl requirement;
- no duplicate Storm Roc/Thunder Roc species;
- no duplicate Law Lion/Law Lion Ascendant species;
- Edict Sentinel personhood boundary;
- corruption separation;
- art-handoff completeness.

---

# 56. FCC-05E Acceptance Gate

FCC-05E is ready for realm-local acceptance only when all of the following remain true:

1. the final principal roster contains exactly **twelve named creature families**;
2. all five former Aetheric Atlas families are preserved;
3. all five former Divine Concords Atlas families are preserved;
4. Cloudfin and Starveil Ray are the only two FCC-expanded principal families in this pass;
5. old creature IDs remain preserved as source/migration identities pending final namespace normalisation;
6. Cloudwhale remains a migration/ecosystem-scale creature rather than a mandatory loot boss;
7. Cloudwhale hunting/protection remains culture-dependent rather than universally prescribed;
8. Storm Roc is the base species and Thunder Roc is an exceptional boss/title/individual relationship;
9. Windlace Swarm is simulated at colony/swarm gameplay scale rather than individual-insect scale;
10. Skyback Grazer is the principal husbandry/work-animal relationship and does not grant unrestricted flight;
11. Static Serpent creature outputs never replace geological Lightning Cores;
12. Cloudfin closes the Thunderhead schooling/fishery role and requires dense moist/cloud habitat;
13. Starveil Ray closes the High-Aether non-divine filter-feeder/route-indicator role;
14. Petition Dove remains bounded message/sanctuary fauna rather than a truth oracle;
15. Mercy Hart sanctuary effects are bounded to recognised Mercy-domain conditions;
16. Halo Moth restorative residue is bounded and does not become generic divine essence;
17. Law Lion behaviour consumes explicit declared sacred-law state;
18. Law Lion Ascendant remains a fixed authority manifestation/individual rather than a thirteenth creature species;
19. Edict Sentinel remains a constructed-life family with personhood review when durable selfhood/agency emerges;
20. construct origin does not permanently deny personhood;
21. the food web contains producers, grazers, pollinators/decomposers, school fauna, large filter feeders and predators;
22. Thunder Pearl provenance can be satisfied by ambient Thunderhead biomineral fauna without inflating the principal roster;
23. no creature automatically drops unrelated Ascendant geology/material resources;
24. creature-derived materials require anatomical and gameplay justification;
25. natural hostility, sacred-law enforcement and Void corruption remain distinct;
26. corruption uses state/variant treatment first;
27. irreversible transformed creatures require explicit admission rather than automatic duplicate definitions;
28. off-realm animals use compatibility/habitat categories rather than unrestricted survival;
29. creature death does not automatically create divine spirits, afterlife records or generic essence;
30. AI can be implemented through shared bounded behaviour modules;
31. low-end scaling preserves authoritative population, migration, resource, ownership, personhood and corruption truth;
32. accessibility requirements cover swarm, electrical, radiant, law-warning and migration cues;
33. art-handoff distinctions are explicit for all twelve families.

**FCC-05E Status:** **REALM-LOCAL LOCK CANDIDATE — pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**
