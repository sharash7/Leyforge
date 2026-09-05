# Leyforge Final Content Canon Collection

## FCC-05B — Ascendant Reach Biomes, Terrain, Altitude Bands, Regional States & Environmental Hazards

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ascendant Reach  
**Stable Realm ID:** `realm.major.ascendant_reach`  
**Legacy Realm Aliases:** `realm.major.aetheric_reach`; `realm.network.divine_concords`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-05A — Ascendant Reach Realm Identity, Laws, Progression & Canon Boundaries  
**Primary Source Reconciliation:** Foundation Documents 00–20; Document 11 — Biomes & World Generation; Document 14 — Dimensions; World Content Atlas Set 24, especially the former Aetheric Reach and Divine Concords environment/biome definitions; post-Atlas governance and registry rules; accepted FCC-05 decisions Q391–Q583.  
**Primary Scope:** Macro-altitude bands, realm topology, the twelve canonical biome families, Windway route-environment infrastructure, biome transitions, environmental state families, environmental hazards, arrival-region suitability, deterministic generation, persistence, simulation scaling, accessibility and downstream suitability interfaces.  
**Final Global Status:** Pending final cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-05B defines the authoritative environmental and world-generation canon for the **Ascendant Reach**.

It owns the realm-local definition of:

- the five macro-altitude bands;
- the twelve canonical major biome families;
- the continuous vertical relationship between the former Aetheric Reach and Divine Concords;
- floating-continent, cloud-sea, storm-layer, underside, High-Aether and divine-territory environmental topology;
- Windways as realm-spanning route/environment infrastructure;
- biome transition logic;
- terrain and altitude suitability interfaces;
- the eight canonical regional environmental-state families;
- the twelve canonical hazard families;
- environmental readability and warning requirements;
- first-arrival environmental safety constraints for the Ascension Gate;
- persistent aftermath and deterministic environmental state change;
- low-end/off-screen simulation scaling;
- environmental accessibility requirements;
- suitability interfaces consumed by materials, flora, creatures, civilisations, settlements, structures, dungeons, authorities, events and corruption systems.

FCC-05B does **not** own:

- exact material identities, provenance or derived-form chains, which belong to FCC-05C;
- exact flora, tree, crop, food and agriculture definitions, which belong to FCC-05D;
- creature definitions and creature-material provenance, which belong to FCC-05E;
- civilisation, settlement and social-system definitions, which belong to FCC-05F;
- exact Blocks, Items, processing chains, structure blueprints, recipes and Ascension Gate construction details, which belong to FCC-05G;
- dungeon internal encounter logic, guardian behaviour, authority execution, event resolution and reward tables, which belong to FCC-05H;
- detailed divine-law state transitions, Void corruption, restoration and cross-realm state interaction, which belong to FCC-05I;
- final registry certification and art handoff, which belong to FCC-05J;
- universal movement, fall damage, survival, weather simulation, vehicle physics, AI, save/load, multiplayer authority or accessibility frameworks.

This document supplies the environmental contracts those systems and later FCC-05 documents consume.

---

# 2. Environmental Canon Statement

The Ascendant Reach must read as one **continuous, inhabitable vertical world** rather than two former realms stacked together as disconnected content layers.

Its environment is shaped by:

- floating landmass geology;
- bounded buoyancy and gravity profiles;
- atmospheric density and temperature;
- Windways and ordinary regional currents;
- storm systems;
- Thunderhead cloud-sea systems;
- Aerial Kelp and other vertical ecology;
- volcanic/industrial Skyforge regions;
- the dark undersides of floating continents;
- thin-atmosphere High-Aether conditions;
- increasing divine overlap at extreme altitude;
- declared Divine Domain law;
- settlement and route infrastructure;
- authority influence;
- persistent regional events;
- Void corruption where genuinely present.

The environmental progression should communicate ascent through physical experience:

> **The player rises from broad habitable skylands into storm-dominated air, crosses environments where ordinary survival becomes difficult, reaches the strange thin High Aether, and finally enters upper territories where sacred law becomes an environmental property alongside wind, gravity and weather.**

Higher altitude is generally more demanding, but altitude is **not** a universal numerical difficulty value. A peaceful upper sanctuary may be safer than a lower stormfront, while a corrupted or collapsing lower region may be exceptionally dangerous.

---

# 3. Macro-Altitude Bands

Ascendant Reach contains five canonical macro-altitude bands.

1. **Lower Reach**
2. **Aetheric Reach**
3. **Storm Heights**
4. **High Aether**
5. **Divine Concords**

These are environmental/progression bands, **not five extra biomes** and not five separately loaded dimensions.

A biome family may span more than one altitude band where its ecology and terrain logic support that distribution.

## 3.1 Lower Reach

The Lower Reach is the most forgiving large-scale altitude band.

Typical characteristics include:

- broadly breathable atmosphere;
- normal-to-light regional gravity profiles;
- large floating continents and island chains;
- widespread agriculture;
- relatively stable settlement suitability;
- common Windway access;
- ordinary cloudwater collection;
- lower storm intensity on average;
- common Skyback herd ecology;
- established ports, farms and freeholds.

The Lower Reach is a common first-arrival band for Ascension Gates, but no single biome or settlement is mandatory for every seed.

## 3.2 Aetheric Reach

The Aetheric Reach is the central inhabited sky-world band and retains the name of the former realm as an internal geographic/cultural term.

Typical characteristics include:

- broad floating island systems;
- stronger regional currents;
- denser vessel traffic;
- Stormglass formation zones;
- Aerial Kelp forests;
- increasing storm exposure;
- Skyforge Calderas;
- widespread Windway infrastructure;
- more pronounced local gravity variation;
- large sky cities and industrial settlements.

This band contains much of the realm's practical aerial civilisation and resource economy.

## 3.3 Storm Heights

The Storm Heights are dominated by severe weather systems and high-energy atmospheric ecology.

Typical characteristics include:

- powerful lightning;
- Thunderhead Seas;
- strong turbulence;
- violent Windway branches;
- intense Stormglass formation;
- Lightning Core conditions;
- major Storm Roc territory;
- cloud-vessel hazard;
- shifting visibility;
- harsh temperature and pressure variation.

Storm Heights are not uniformly uninhabitable. Fortresses, monasteries, storm-harvesting settlements and cloud harbours may thrive there through specialist infrastructure.

## 3.4 High Aether

High Aether represents the transition from difficult physical sky to strong divine overlap.

Typical characteristics include:

- thin atmosphere;
- severe cold/exposure;
- weakened sound propagation;
- intense high-altitude light and magical radiation;
- Sunmist concentration;
- altered gravity profiles;
- sealed or protected settlements;
- rare Starlichen ecology;
- Starveil Ray migration;
- ancient high-altitude infrastructure;
- increasingly common sacred phenomena.

High Aether does **not** physically connect to the Void Between merely because it is remote, sparse or strange.

## 3.5 Divine Concords

The Divine Concords are the highest normal Ascendant territories.

They are not a separate dimension.

Typical characteristics include:

- strong divine/physical overlap;
- declared Divine Domain boundaries;
- Law Gardens;
- pilgrimage infrastructure;
- Radiant Tribunal Cities;
- War-Saint territories;
- celestial assembly regions;
- Hymnstone and other upper-realm materials;
- sacred-law environmental consequences;
- divine institutions and authorities;
- domain conflict and negotiated boundaries.

The term **Divine Concords** does not imply that all gods agree, share one government or recognise one theology.

---

# 4. Vertical Realm Topology

## 4.1 One Continuous Realm

Ascendant Reach uses one persistent spatial realm identity.

Internal movement between altitude bands may occur through:

- climbing;
- lifts;
- bridges;
- anchor chains;
- gliders;
- flying mounts;
- airships and cloud vessels;
- Windways;
- pilgrimage routes;
- celestial bridges;
- specialised vertical transport infrastructure.

No macro-altitude band requires an additional interdimensional portal.

## 4.2 Floating Landmass Structure

The generator may create:

- continent-scale floating plateaus;
- island archipelagos;
- isolated rock columns;
- suspended volcanic masses;
- fractured continent chains;
- hanging underside cave systems;
- enormous root/kelp structures bridging altitude bands;
- cloud-sea basins;
- high-altitude sacred territories;
- settlement-linked artificial platforms;
- drifting but bounded regional landmass states.

Floating terrain must remain deterministic and save-persistent.

## 4.3 Falling Through the Realm

Falling is a real vertical traversal emergency, not an automatic teleport rule.

A fall may lead through:

- lower island chains;
- cloud layers;
- Thunderhead systems;
- Windways;
- rescue infrastructure;
- lower altitude bands;
- ordinary fall-damage/death outcomes.

Falling low enough does **not** automatically return the player to the Overworld.

The universal death/respawn system remains authoritative where a fall becomes fatal.

## 4.4 Lower Boundary

The realm does not require a literal bottomless Void beneath its terrain.

Lower environmental depth may include:

- dense cloud layers;
- remote lower islands;
- deep atmospheric basins;
- difficult retrieval zones;
- rare bounded edge regions.

None of these are automatically the Void Between.

## 4.5 Upper Boundary

The normal explorable vertical climax is the **Concordant Firmament** and related upper Divine Concord territory.

Any future content above that normal ceiling must be explicitly authored and cannot silently create:

- a second realm;
- the Void Between;
- unrestricted cosmic travel;
- a bypass around Ascension Gate ownership.

---

# 5. Canonical Biome Roster

Ascendant Reach contains exactly **twelve major canonical biome families** at FCC-05B level:

1. **Cloudgrass Plateaus**
2. **Stormglass Archipelagos**
3. **Thunderhead Seas**
4. **Aerial Kelp Fields**
5. **Skyforge Calderas**
6. **Fallen Continent Undersides**
7. **High Silence Expanse**
8. **Pilgrim Thresholds**
9. **Law Gardens**
10. **Radiant Tribunal Cities**
11. **War-Saint Fields**
12. **Concordant Firmament**

These are biome **families**, not one fixed visual preset each.

Each family may contain:

- seed-derived local variants;
- altitude-band variants;
- climate/weather variants;
- settlement-influenced states;
- restored, damaged, fortified, abandoned or contested states;
- authority territories;
- event overlays;
- dungeon sites;
- regional-state overlays;
- Void-corrupted states where genuine Void provenance exists;
- authored landmarks and restricted subregions.

A local environmental variation does not become a thirteenth biome merely because its palette, weather, dominant settlement culture, domain law or material distribution differs.

---

# 6. Reclassified Former Biome Concepts

Four inherited source concepts remain canon but are not top-level biome families.

## 6.1 Windway Corridors

**Windway Corridors** are reclassified as local expressions of the realm-spanning **Windway route/environment system**.

A Windway Corridor may pass through multiple biomes and altitude bands.

It may create local sub-biome presentation, route infrastructure and hazard patterns without becoming a thirteenth major biome.

## 6.2 Mercy Wells

**Mercy Wells** are a sacred-domain/sub-biome family within compatible **Law Gardens** and related sanctuary territories.

They preserve:

- healing valleys;
- sanctuary springs;
- Mercy Water states;
- refuge ecology;
- protected settlement roles;
- restoration content.

## 6.3 Archive of Oaths

**Archive of Oaths** is reclassified as a major district/site/structure family, especially common within Radiant Tribunal Cities and other upper sacred territories.

It is not a separate geographic biome.

## 6.4 Abandoned Sanctums

**Abandoned Sanctum** is a domain/site/dungeon state that can affect multiple Divine Concord environments.

Possible expressions include:

- abandoned Law Garden;
- failed Mercy sanctuary;
- dead pilgrimage territory;
- ruined Tribunal district;
- abandoned War-Saint fortress;
- isolated Concordant Firmament precinct.

Abandonment does not automatically imply Void corruption.

---

# 7. Windway Environmental Infrastructure

## 7.1 Canonical Identity

**Windways** are persistent large-scale current routes used by wildlife, travellers, vessels, trade and migration.

They are the Ascendant Reach equivalent of major route geography.

They may be:

- naturally stable;
- reinforced by Current Beacons;
- partially engineered;
- seasonally or event-state variable;
- contested;
- restricted;
- damaged;
- temporarily hazardous.

## 7.2 Windway States

A Windway may have route states such as:

- **Open**;
- **Favourable**;
- **Restricted**;
- **Turbulent**;
- **Storm-Blocked**;
- **Drifting**;
- **Contested**;
- **Damaged**;
- **Restoring**;
- **Closed**.

These are route states, not additional biomes.

## 7.3 Sovereignty Boundary

Environmental route control does not automatically establish ownership of adjacent islands or settlements.

FCC-05F owns the civic/legal interpretation of Wind Rights.

FCC-05B only defines the environmental route state and the physical current geography.

## 7.4 Wildlife Relationship

Windways may influence:

- Cloudwhale migration;
- Windlace Swarm density;
- Cloudfin movement;
- Storm Roc hunting territories;
- Starveil Ray high-altitude routes;
- Skyback crossing routes where suitable;
- aerial seed/spore dispersal.

Exact creature behaviour belongs to FCC-05E.

---

# 8. Gravity and Buoyancy Environmental Model

## 8.1 Bounded Gravity Profiles

Ascendant Reach uses bounded regional gravity profiles rather than arbitrary per-block gravity.

Canonical environmental profiles may include:

- **Conventional Island Gravity**;
- **Light Gravity**;
- **Strong Local-Mass Gravity**;
- **Drift Gravity**;
- **Storm-Turbulent Gravity**;
- **High-Aether Weak Gravity**;
- **Divine Domain Gravity Override**.

Not every biome uses every profile.

## 8.2 Gravity Transitions

Gravity-profile transitions must be:

- deterministic;
- saved where persistent;
- readable through environmental cues;
- bounded by region/site state;
- compatible with universal movement and physics systems.

Possible cues include:

- suspended debris;
- waterfall direction;
- vegetation orientation;
- Windlace behaviour;
- particle movement;
- structures designed around local gravity;
- UI/instrument indication where the player has suitable knowledge/equipment.

## 8.3 Buoyancy

Cloudstone and specialised infrastructure may contribute to floating terrain/structures, but FCC-05B does not define exact structural formulas.

Environmental buoyancy may influence:

- landmass stability;
- island drift states;
- settlement suitability;
- dungeon access;
- route geometry;
- fall risk;
- authority aftermath.

FCC-05C/G own exact material and construction interfaces.

---

# 9. Atmosphere and Exposure Model

Atmospheric conditions vary by altitude and region.

## 9.1 Broad Atmospheric Gradient

Typical progression:

- **Lower Reach:** broadly breathable;
- **Aetheric Reach:** breathable with stronger weather/exposure variation;
- **Storm Heights:** dangerous local pressure, wind and storm conditions;
- **High Aether:** thin atmosphere and severe exposure in many regions;
- **Divine Concords:** upper physical conditions remain relevant, but compatible Divine Domains may sustain life through bounded local laws or infrastructure.

## 9.2 No Duplicate Survival Meters

FCC-05B does not create separate realm-only meters for:

- oxygen;
- pressure;
- cold;
- radiation;
- exhaustion.

Instead, the environment supplies authoritative conditions consumed by universal survival/status systems.

## 9.3 Divine Protection

A Divine Domain may alter or mitigate local atmospheric conditions where explicitly authored.

Such protection:

- is local and declared;
- does not grant universal immunity;
- may depend on recognised status, infrastructure or sacred law;
- cannot overwrite protected universal system authority.

Detailed divine-law state behaviour belongs to FCC-05I.

---

# 10. Canonical Regional Environmental-State Families

Ascendant Reach uses eight principal regional environmental-state families.

These are overlays/states, **not additional biome families**.

1. **Clear Current**
2. **Stormfront**
3. **Gravity Drift**
4. **Migration Tide**
5. **High-Aether Surge**
6. **Pilgrimage Convergence**
7. **Concord Tension**
8. **Void-Corrupted State**

## 10.1 Clear Current

A region of comparatively stable wind, predictable routes and ordinary local environmental conditions.

May improve:

- Windway reliability;
- vessel safety;
- migration visibility;
- settlement confidence;
- long-distance travel windows.

Clear Current does not mean hazard-free.

## 10.2 Stormfront

A regional intensification of wind, lightning, cloud density and storm instability.

May affect:

- Windways;
- Stormglass formation;
- Lightning Core activity;
- vessel access;
- Cloudfin/Cloudwhale movement;
- Storm Roc pressure;
- settlement storm-refuge requirements.

A Stormfront may be natural, authority-influenced or event-driven.

It is not automatically Void corruption.

## 10.3 Gravity Drift

A bounded regional change in gravity or landmass relationship.

May affect:

- island altitude;
- bridge alignment;
- route access;
- falling risk;
- settlement engineering;
- dungeon accessibility;
- waterfall direction;
- cargo handling.

Gravity Drift must use validated state transitions rather than unconstrained continuous terrain movement.

## 10.4 Migration Tide

A major concentration or movement of aerial fauna.

May involve:

- Cloudwhales;
- Cloudfin;
- Windlace Swarms;
- Starveil Rays;
- predators following prey;
- seed/spore dispersal;
- settlement festivals, fishing or conservation responses.

The exact event execution belongs to FCC-05H.

## 10.5 High-Aether Surge

A period/region of increased High-Aether intensity.

May increase:

- Sunmist concentration;
- magical/radiant exposure;
- high-altitude visibility phenomena;
- Starlichen activity;
- Starveil Ray migration;
- celestial-processing suitability;
- dangerous exposure for unprotected travellers.

High-Aether Surge is not a Void event by default.

## 10.6 Pilgrimage Convergence

A large-scale concentration of pilgrims, sacred activity, vessels and recognised route use in upper territories.

Environmental consequences may include:

- crowded routes;
- temporary camps;
- active sanctuary conditions;
- stronger ritual environmental expression;
- increased Petition Dove activity;
- route restrictions;
- Law Garden pressure;
- temporary infrastructure expansion.

Political/social execution belongs to FCC-05F/H.

## 10.7 Concord Tension

Multiple Divine Domains, institutions or sacred-law systems approach an unstable relationship.

May affect:

- boundary clarity;
- sacred-law compatibility;
- Tribunal access;
- Law Engine state;
- pilgrimage routing;
- guardian behaviour;
- domain infrastructure.

Concord Tension is not automatically a theological war and not automatically Void corruption.

## 10.8 Void-Corrupted State

A region is affected by genuine Void-origin contamination.

This state is explicitly distinct from:

- ordinary storm damage;
- hostile or tyrannical divinity;
- abandoned sacred territory;
- High-Aether exposure;
- Concord Tension;
- sacred-law violation;
- Gravity Drift.

Detailed contamination, propagation, cleansing and irreversible transformation belong to FCC-05I.

---

# 11. Canonical Environmental Hazard Registry

Ascendant Reach has twelve principal hazard families.

| # | Hazard Family | Canonical Environmental Function | Ownership Boundary |
|---|---|---|---|
| 1 | **Altitude Exposure** | Thin atmosphere, pressure variation, severe cold and altitude-linked survival stress | Universal survival/status systems execute effects |
| 2 | **Fall Exposure** | Open vertical terrain, long descents, failed landings and route failure | Universal movement/fall damage executes consequences |
| 3 | **Turbulence & Wind Shear** | Gusts, downdrafts, unstable currents, Windway disruption and dangerous approaches | Movement/vessel systems consume environmental forces |
| 4 | **Lightning Exposure** | Direct strikes, charged storms, conductive terrain and high-energy weather | Universal damage/weather systems execute effects |
| 5 | **Static Overload** | Accumulated electrical charge affecting compatible equipment, structures and organisms | Equipment/structure systems consume charge state |
| 6 | **Buoyancy / Gravity Instability** | Unstable local gravity, island support failure or altered floating-landmass relationships | Physics/structure systems consume bounded profile/state |
| 7 | **Thunderhead Hazard** | Dense cloud-fluid navigation, low visibility, internal currents, water masses and storm pressure | Fluid/weather/vessel systems execute local effects |
| 8 | **High-Aether Exposure** | Thin atmosphere, extreme cold, intense light/magical radiation and sparse habitat conditions | Universal survival/status systems execute effects |
| 9 | **Sacred-Law Violation** | Declared local Divine Domain rules produce authored environmental/legal consequences | FCC-05A/I own sacred-law semantics; universal systems execute outputs |
| 10 | **Divine Radiance / Presence Exposure** | Dangerous concentration of divine energy, sacred phenomena or overwhelming presence | Status/magic systems execute bounded effects |
| 11 | **Domain Conflict** | Overlapping/incompatible sacred-law territories destabilise routes, boundaries or infrastructure | FCC-05I owns detailed law-state resolution |
| 12 | **Void Corruption** | Genuine external corruption ultimately tied to the Void Between | FCC-05I owns detailed corruption behaviour |

Hazard intensity must be driven by biome suitability, altitude, regional state, event state, authority influence, infrastructure and authoritative saved world conditions rather than arbitrary random punishment.

---

# 12. Hazard Interaction Rules

## 12.1 No Single Ascendant Exposure Meter

Ascendant hazards feed appropriate universal systems.

The realm must not collapse:

- cold;
- thin air;
- lightning;
- fall risk;
- gravity;
- sacred law;
- corruption

into one generic realm-specific value.

## 12.2 Readability and Counterplay

Severe hazards should normally provide meaningful telegraphing through combinations of:

- cloud formation;
- wind/audio cues;
- current direction;
- lightning frequency;
- wildlife behaviour;
- beacon warnings;
- map knowledge;
- settlement alerts;
- instruments;
- material/environment state;
- explicit sacred-law declarations.

Surprise may exist in authored encounters, but ordinary traversal must not rely on untelegraphed arbitrary lethal gusts or invisible domain rules.

## 12.3 Sacred-Law Consequences Are Authored

Sacred-Law Violation does not automatically deal generic holy damage.

Consequences may instead include:

- loss of guest status;
- route closure;
- guardian hostility;
- suspended blessing;
- trial initiation;
- property-access restriction;
- environmental change;
- civic or political consequence.

The applicable law and consequence must be declared/readable to the extent required for fair gameplay.

## 12.4 Access Restriction Cannot Strand Saves

A Domain may revoke or restrict access, but required realm progression must preserve a valid recovery/return route.

No environmental-law state may silently trap a valid save with no supported exit path.

## 12.5 Hostile Divinity Is Not Corruption

The following can exist without Void involvement:

- tyrannical god;
- hostile guardian;
- broken saint;
- oppressive sacred law;
- abandoned sanctuary;
- doctrinal conflict;
- divine civil war;
- failed Law Engine;
- extreme War-Saint ideology.

Void corruption requires explicit Void provenance.

---

# 13. Cloudgrass Plateaus

## 13.1 Canonical Identity

**Cloudgrass Plateaus** are broad habitable floating grasslands, agricultural continents and island chains that form much of the lower/middle realm's stable civilisation base.

They establish that Ascendant Reach is a world where ordinary life can flourish despite its vertical geography.

## 13.2 Typical Altitude

Primary:

- Lower Reach;
- lower/middle Aetheric Reach.

Rare higher variants may exist where supported by altitude conditions.

## 13.3 Terrain Character

Common forms include:

- large grassy floating plateaus;
- rolling hills;
- cloud-fed streams;
- waterfall edges;
- shallow valleys;
- orchard terraces;
- exposed Cloudstone cliffs;
- agricultural islands;
- Windway-facing ridges;
- settlement anchor zones.

## 13.4 Ecology and Agriculture Interface

Especially suitable for:

- Cloudgrass;
- Cloudgrain;
- Skywood;
- Cloudfruit orchards;
- Windherb;
- Windbean/Skyroot agriculture;
- Skyback Grazers;
- Windlace Swarms;
- common settlement livestock/agriculture.

Exact definitions belong to FCC-05D/E.

## 13.5 Settlement Suitability

Cloudgrass is one of the realm's best regions for conventional settlement planning.

It supports:

- Agricultural Sky Freeholds;
- Ranching/Orchard Towns;
- Ascension Gate arrival settlements;
- Sky Orchards;
- Current Beacon infrastructure;
- ordinary universal settlement buildings adapted for wind/fall safety.

## 13.6 Principal Hazards

- Fall Exposure;
- Turbulence & Wind Shear;
- occasional Stormfront;
- Gravity Drift near unstable landmasses;
- rare lightning events;
- rare Void corruption.

Cloudgrass is comparatively safe, not universally safe.

---

# 14. Stormglass Archipelagos

## 14.1 Canonical Identity

**Stormglass Archipelagos** are jagged floating island systems repeatedly struck and physically transformed by intense electrical storms.

They are the realm's principal natural Stormglass landscapes.

## 14.2 Typical Altitude

Primary:

- Aetheric Reach;
- Storm Heights.

## 14.3 Terrain Character

Common forms include:

- fractured Cloudstone islands;
- glassy lightning scars;
- raw Stormglass fields;
- conductive ridges;
- storm-cut ravines;
- charged crystal outcrops;
- exposed natural lightning towers;
- unstable bridges;
- small storm refuges;
- power-harvesting sites.

## 14.4 Environmental Dynamics

Repeated lightning may:

- create or expose Stormglass;
- charge terrain;
- alter route safety;
- trigger Lightning Core formation conditions;
- damage infrastructure;
- attract Static Serpents;
- change harvest windows.

Detailed material rules belong to FCC-05C.

## 14.5 Principal Hazards

- Lightning Exposure;
- Static Overload;
- Turbulence & Wind Shear;
- Fall Exposure;
- Stormfront;
- local Gravity Drift;
- rare Void corruption.

## 14.6 Suitable Content

Especially suitable for:

- storm-harvesting settlements;
- crystal/power outposts;
- Storm Temples;
- Storm Keepers;
- Static Serpents;
- Storm Rocs;
- Stormreed ecology;
- Lightning Core infrastructure.

---

# 15. Thunderhead Seas

## 15.1 Canonical Identity

**Thunderhead Seas** are dense cloud-fluid ocean systems containing immense storm masses, suspended water, internal currents, hidden islands and specialised aerial/aquatic ecology.

They are not ordinary Overworld oceans suspended unchanged in the sky.

## 15.2 Typical Altitude

Primary:

- upper Aetheric Reach;
- Storm Heights.

Shallower cloud-sea systems may occur below.

## 15.3 Environmental Composition

Thunderhead Seas may contain:

- dense cloud-fluid layers;
- true-water pockets and suspended lakes;
- rainfall columns;
- internal lightning zones;
- cloud currents;
- islands concealed inside cloud mass;
- safe harbours;
- migration channels;
- storm reefs or mineral formations;
- wreck fields.

## 15.4 Water Boundary

**Cloudwater** is water provenance/state, not a separate universal fluid family.

The broader Thunderhead medium may require realm-specific atmospheric/fluid handling while still consuming universal water and vessel interfaces where appropriate.

## 15.5 Ecology

Especially suitable for:

- Cloudfin;
- Cloudwhales;
- Storm Rocs;
- Thunder Pearls where biologically justified;
- cloud-sea fisheries;
- atmospheric plankton/bloom ecology.

## 15.6 Principal Hazards

- Thunderhead Hazard;
- Lightning Exposure;
- Turbulence & Wind Shear;
- Static Overload;
- Fall Exposure;
- low visibility;
- local Altitude Exposure;
- rare Void corruption.

## 15.7 Settlement and Dungeon Interface

Especially suitable for:

- Cloud Harbours;
- Storm-Fishing Settlements;
- Thunderhead Citadels;
- wreck recovery;
- cloud-vessel infrastructure;
- Tempest Leviathan event/territory interaction.

---

# 16. Aerial Kelp Fields

## 16.1 Canonical Identity

**Aerial Kelp Fields** are enormous three-dimensional living forests formed by buoyant Aerial Kelp strands, bladders, hanging fronds and associated ecology spanning multiple altitude layers.

They provide vertical biological structure to the realm.

## 16.2 Typical Altitude

Common across:

- Lower Reach;
- Aetheric Reach;
- selected Storm Heights.

## 16.3 Terrain/Ecology Character

Aerial Kelp Fields may include:

- kilometre-scale hanging strands;
- buoyancy bladder clusters;
- sheltered interior air pockets;
- dense spore zones;
- nesting layers;
- natural rope-like routes;
- hanging water collectors;
- cultivated terraces;
- fibre-harvesting platforms;
- semi-mobile vegetation masses.

## 16.4 Environmental Function

Aerial Kelp may:

- buffer local wind;
- create sheltered microclimates;
- support Cloudfin and small fauna;
- provide food, fibre, oil and biological lift components;
- create natural climbing routes;
- become a navigation hazard when overgrown.

Exact biology belongs to FCC-05D/E.

## 16.5 Principal Hazards

- Turbulence at field edges;
- entanglement/navigation obstruction;
- Fall Exposure;
- spore/visibility pressure where authored;
- storm damage;
- local Gravity Drift;
- fire/electrical hazard in damaged regions;
- rare Void corruption.

## 16.6 Settlement Suitability

Especially suitable for:

- Hanging Kelp Communes;
- Vertical Farm Settlements;
- fibre industries;
- biological lift research;
- suspended bridge networks.

---

# 17. Skyforge Calderas

## 17.1 Canonical Identity

**Skyforge Calderas** are volcanic floating-island regions whose heat, mineral strata and gas vents create the principal native metallurgical landscapes of Ascendant Reach.

## 17.2 Typical Altitude

Primary:

- Aetheric Reach;
- Storm Heights.

## 17.3 Terrain Character

Common forms include:

- volcanic floating mountains;
- open calderas;
- basaltic/Cloudstone transitions;
- metal-rich strata;
- gas vents;
- high-temperature caves;
- suspended lava/magma where physically supported;
- forge terraces;
- mine shafts;
- thermal updrafts;
- industrial settlement platforms.

## 17.4 Resource Interface

Especially associated with:

- Skyiron;
- Storm Metal processing conditions;
- Aether Gas pockets;
- heat-intensive processing;
- Cloudstone Foundries;
- imported alloy production.

Exact material definitions belong to FCC-05C/G.

## 17.5 Principal Hazards

- heat/exposure;
- gas/vent hazards through universal systems;
- Turbulence & Wind Shear from thermal updrafts;
- Fall Exposure;
- local lightning/storm interaction;
- Buoyancy/Gravity Instability;
- industrial damage states;
- rare Void corruption.

## 17.6 Settlement Suitability

Especially suitable for:

- Forge Cities;
- Mining/Foundry Colonies;
- Skyforge & Atmospheric Guilds;
- Cloudstone Foundries;
- industrial Skyports.

---

# 18. Fallen Continent Undersides

## 18.1 Canonical Identity

**Fallen Continent Undersides** are the dark, inverted lower faces of large floating continents and island masses, containing hanging cave systems, root networks, waterfalls, mines, ruins and permanent communities.

They are full ecological regions, not merely the untextured bottom of floating islands.

## 18.2 Altitude Distribution

Undersides may occur beneath major landmasses across multiple altitude bands.

The biome is defined by **position and ecological conditions**, not one fixed absolute height.

## 18.3 Terrain Character

Common forms include:

- inverted cliff faces;
- hanging caverns;
- downward-growing Hangroot;
- waterfalls falling into open sky;
- underside lakes/cisterns;
- dark mineral seams;
- inverted ruins;
- ancient anchor machinery;
- suspension bridges;
- isolated ledges;
- gravity-transition pockets.

## 18.4 Underside Stone

`Underside Stone` is environmental language for a Cloudstone facies/state, not a separate guaranteed base-material family.

Material detail belongs to FCC-05C.

## 18.5 Principal Hazards

- Fall Exposure;
- Buoyancy / Gravity Instability;
- route isolation;
- low light/visibility;
- falling-water/current hazards;
- structural collapse;
- local Altitude Exposure;
- rare Void corruption.

## 18.6 Settlement/Dungeon Suitability

Especially suitable for:

- Hanging Underside Towns;
- Root-Cave Enclaves;
- Underside Vaults;
- ancient anchor sites;
- salvage/mining cultures;
- Hangroot ecology.

---

# 19. High Silence Expanse

## 19.1 Canonical Identity

**High Silence Expanse** is the principal High-Aether biome: a sparse, cold, thin-atmosphere environment where sound weakens, gravity changes and ordinary life requires specialist adaptation.

It marks the strongest physical transition toward the Divine Concords.

## 19.2 Typical Altitude

Primary:

- High Aether.

Rare low fringes may touch upper Storm Heights; rare upper fringes transition into Pilgrim Thresholds.

## 19.3 Environmental Character

Common features include:

- thin atmosphere;
- low ambient sound propagation;
- intense celestial light;
- magical-radiation exposure;
- sparse floating rock;
- ancient sealed structures;
- Sunmist-rich currents;
- weak-gravity regions;
- long distances between safe habitats;
- Starlichen fields;
- rare high-altitude ruins;
- Starveil Ray migration routes.

## 19.4 Not the Void

High Silence may contain Void breaches where explicitly authored, but its emptiness, darkness, thin atmosphere or remoteness do **not** make it part of the Void Between.

## 19.5 Principal Hazards

- High-Aether Exposure;
- Altitude Exposure;
- Fall Exposure;
- Buoyancy / Gravity Instability;
- High-Aether Surge;
- rare storm remnants;
- isolation/route scarcity;
- Void corruption only where genuine contamination exists.

## 19.6 Settlement Suitability

Especially suitable for:

- Sealed High-Aether Stations;
- Observatory/Research Settlements;
- ancient infrastructure;
- high-tier celestial-processing support sites.

---

# 20. Pilgrim Thresholds

## 20.1 Canonical Identity

**Pilgrim Thresholds** are the transitional territories where High Aether becomes recognisably dominated by divine civilisation and declared sacred law.

They replace the former concept of Divine Concords as a separately entered realm.

## 20.2 Typical Altitude

Primary:

- upper High Aether;
- lower Divine Concords.

## 20.3 Environmental Character

Common features include:

- pilgrimage roads;
- protected ascension paths;
- neutral sanctuaries;
- shrines;
- hostels;
- interpretation halls;
- customs/permission sites;
- Petition Dove routes;
- neutral law corridors;
- first strong Hymnstone presence;
- competing sacred boundary markers;
- embassies and visitor infrastructure.

## 20.4 Sacred-Law Introduction

Pilgrim Thresholds should teach upper-realm law through readable, bounded examples.

Typical laws may govern:

- hospitality;
- weapons;
- declared challenges;
- property;
- access;
- ritual conduct;
- truth in formal proceedings.

No threshold may rely on unknowable hidden morality parsing.

## 20.5 Principal Hazards

- High-Aether Exposure;
- Sacred-Law Violation;
- Divine Radiance / Presence Exposure;
- Domain Conflict at disputed boundaries;
- pilgrimage congestion/event pressure;
- rare Void corruption.

## 20.6 Settlement/Dungeon Suitability

Especially suitable for:

- Pilgrimage Republic Towns;
- Multifaith Threshold Settlements;
- Pilgrim Halls;
- Pilgrimage Labyrinths;
- Neutral Custodian infrastructure.

---

# 21. Law Gardens

## 21.1 Canonical Identity

**Law Gardens** are cultivated sacred landscapes whose ecology, architecture and local environmental behaviour are shaped by one or more explicitly declared divine principles.

They are not generic peaceful holy gardens.

## 21.2 Environmental Law

A Law Garden may support authored principles involving:

- truth;
- hospitality;
- mercy;
- protection;
- craft;
- ownership;
- sacrifice;
- peace;
- challenge;
- memory;
- stewardship.

The environment may react through supported states, flora, guardians, route conditions and settlement rules.

## 21.3 Mercy Wells

Mercy Wells are a canonical Law Garden sub-biome/domain family.

They may include:

- healing springs;
- refuge valleys;
- Mercy Water;
- sanctuary architecture;
- Mercy Bloom;
- Shelter Reed;
- protected fauna;
- conditional sanctuary law.

Mercy-aligned territory is not automatically politically benevolent or immune to conflict.

## 21.4 Terrain Character

Law Gardens may contain:

- terraced sacred landscapes;
- Hymnstone paths;
- water gardens;
- ceremonial orchards;
- Law Seed cultivation;
- halo-lit groves;
- boundary hedges;
- ritual plazas;
- living legal markers;
- sanctuary districts.

## 21.5 Principal Hazards

- Sacred-Law Violation;
- Divine Radiance / Presence Exposure;
- Domain Conflict;
- access restriction;
- failed/contested law state;
- Void corruption where genuine contamination exists.

## 21.6 Settlement/Dungeon Suitability

Especially suitable for:

- Monastic Law Settlements;
- Sacred Garden Communities;
- Mercy Sanctuaries;
- Law Engines;
- Trial Domain overlays;
- Law Lions;
- Halo Moths;
- Mercy Harts.

---

# 22. Radiant Tribunal Cities

## 22.1 Canonical Identity

**Radiant Tribunal Cities** are urban divine landscapes where courts, archives, petitions, legal precedent, relic custody and sacred administration become part of the environmental identity.

They are full cities/urban biome families, not one courthouse structure.

## 22.2 Environmental Character

Common features include:

- monumental streets;
- Hymnstone civic architecture;
- radiant plazas;
- Tribunal chambers;
- Archive of Oaths districts;
- Celestial Archives;
- petition halls;
- public law markers;
- embassy quarters;
- relic vault precincts;
- neutral arbitration zones;
- vertical civic terraces;
- sacred transport routes.

## 22.3 Law and Urban State

Different districts may have distinct declared civic/sacred rules.

Where overlapping rules exist, they require explicit compatibility/priority handling.

FCC-05I owns detailed law-state resolution.

## 22.4 Principal Hazards

- Sacred-Law Violation;
- Domain Conflict;
- Divine Radiance / Presence Exposure;
- access revocation;
- Tribunal Crisis state;
- abandoned/failed district states;
- Void corruption where genuine contamination exists.

## 22.5 Settlement/Dungeon Suitability

Especially suitable for:

- Tribunal Districts/Cities;
- Celestial Administrative Cities;
- Covenant Courts;
- Radiant Tribunals;
- Archives of Oaths;
- Celestial Archives;
- Concord Judge activity;
- celestial bureaucracy.

---

# 23. War-Saint Fields

## 23.1 Canonical Identity

**War-Saint Fields** are landscapes shaped by divine/mortal traditions of defence, sacrifice, conquest, honour, duty, resistance, martial discipline and the political memory of conflict.

They are not automatically celebratory representations of war.

## 23.2 Environmental Character

Common forms include:

- memorial plains;
- fortress monasteries;
- sacred battlefields;
- ruined campaigns;
- training terraces;
- pilgrimage memorials;
- challenge arenas;
- abandoned war shrines;
- veteran settlements;
- contested saintly monuments;
- old defensive lines.

## 23.3 Ideological Variation

Different War-Saint regions may:

- glorify war;
- mourn it;
- teach restraint;
- value defence over conquest;
- reject old doctrine;
- preserve evidence of atrocities;
- support reformist or heretical movements.

No single martial theology defines the entire biome family.

## 23.4 Principal Hazards

- Sacred-Law Violation;
- Divine Radiance / Presence Exposure;
- Domain Conflict;
- active military occupation;
- dangerous trial states;
- abandoned sanctuary states;
- Void corruption where genuine contamination exists.

## 23.5 Settlement/Dungeon Suitability

Especially suitable for:

- Fortress Monasteries;
- Veteran/Memorial Settlements;
- Fallen Saint content;
- Skyfort/Trial Domain hybrids at high altitude;
- Law-Bound Herald or Domain Sovereign territories.

---

# 24. Concordant Firmament

## 24.1 Canonical Identity

**Concordant Firmament** is the highest normal major biome family of Ascendant Reach.

It is a celestial overlap-zone where multiple divine territories, routes, institutions, laws and powers meet.

It is the environmental culmination of the realm's vertical progression.

## 24.2 Environmental Character

Common features include:

- enormous sacred platforms;
- celestial bridges;
- multiple Divine Domain boundaries;
- law-neutral corridors;
- assembly precincts;
- divine embassy districts;
- high courts;
- domain-border monuments;
- radiant open spaces;
- ancient Hymnstone structures;
- Pilgrim Star routes;
- rare upper sacred ecosystems;
- strong but bounded divine overlap.

## 24.3 No Single Supreme Sovereign

The existence of the Concordant Firmament does not establish one supreme god, one universal church or one mandatory realm government.

The biome may contain:

- alliances;
- councils;
- rival domains;
- neutral institutions;
- disputed territory;
- independent divine rulers;
- unclaimed spaces;
- abandoned precincts.

## 24.4 Principal Hazards

- Sacred-Law Violation;
- Domain Conflict;
- Divine Radiance / Presence Exposure;
- High-Aether Exposure in unsheltered areas;
- Concord Tension;
- authority-scale environmental events;
- Void corruption where genuine contamination exists.

## 24.5 Settlement/Dungeon Suitability

Especially suitable for:

- Divine Embassy Cities;
- Concord Assembly Settlements;
- Concord Spires;
- high Covenant Courts;
- Law Engines;
- Celestial Archives;
- Concord Judge encounters;
- Pilgrim Star passages;
- Law Lion Ascendant territories.

---

# 25. Biome Transition Rules

Biome transitions should generally be **legible through terrain, weather, ecology, infrastructure, sound and route state**.

Representative transitions include:

- **Cloudgrass Plateaus → Stormglass Archipelagos:** increasing storm frequency, charged vegetation, Cloudstone fracture, raw glass scars and lightning shelters;
- **Cloudgrass Plateaus → Aerial Kelp Fields:** increasing suspended vegetation, buoyancy bladders, hanging platforms, dense airborne ecology and vertical farm infrastructure;
- **Aetheric Reach → Thunderhead Seas:** thicker cloud layers, reduced visibility, cloud-fluid currents, cloud-vessel infrastructure and internal lightning;
- **Cloudgrass/Skyforge landmass → Fallen Continent Undersides:** terrain drops below the main surface, vegetation orientation changes, hanging roots/caves appear and route geometry becomes inverted;
- **Storm Heights → High Silence Expanse:** storm density falls while atmosphere thins, sound weakens, temperature drops and Sunmist/high-altitude phenomena increase;
- **High Silence Expanse → Pilgrim Thresholds:** sealed outposts and ancient routes become formal pilgrimage roads, law markers, sanctuaries and divine infrastructure;
- **Pilgrim Thresholds → Law Gardens:** neutral transit infrastructure gives way to declared sacred-law landscapes and law-responsive ecology;
- **Pilgrim Thresholds/Law Gardens → Radiant Tribunal Cities:** sacred landscape becomes monumental civic/administrative urban terrain;
- **Law Gardens → War-Saint Fields:** law-responsive cultivation gives way to memorial, martial, fortress or challenge landscapes;
- **upper Divine Concord territories → Concordant Firmament:** multiple domain boundaries, embassy infrastructure and celestial route convergence become dominant.

Abrupt transitions are allowed where justified by:

- Divine Domain boundary;
- major storm wall;
- landmass fracture;
- Law Engine boundary;
- authority territory;
- major event state;
- severe Void corruption.

Abrupt transitions must still be readable unless surprise is an intentional authored encounter feature.

---

# 26. Domain Environmental Boundary Rules

## 26.1 Declared Boundary

A Divine Domain should provide readable evidence when its local environmental law differs materially from surrounding territory.

Possible boundary cues include:

- architecture;
- banners or legal inscriptions;
- Hymnstone markers;
- flora changes;
- guardian presence;
- Petition Doves;
- ambient sound;
- UI/Codex notification where the player has relevant knowledge;
- ritual thresholds;
- physical route gates.

## 26.2 Overlapping Domains

Where multiple domains overlap, environmental state must use a declared compatibility/priority relationship.

Possible states include:

- compatible overlap;
- neutral corridor;
- negotiated boundary;
- primary/secondary law ordering;
- temporary suppression;
- Tribunal arbitration;
- unstable Domain Conflict.

The realm does not use hidden arbitrary rule precedence.

## 26.3 Domain Loss or Abandonment

A Divine Domain may become:

- weakened;
- abandoned;
- disputed;
- restored;
- occupied;
- corrupted;
- politically reassigned.

These states may change environmental expression without creating a new biome family.

---

# 27. Ascension Gate Arrival-Environment Contract

## 27.1 Normal First Arrival

A newly established first-access Ascension Gate must resolve to a **validated safe lower/middle Ascendant destination**.

Typical eligible environments include:

- stable Cloudgrass Plateaus;
- protected lower Aetheric settlements;
- other explicitly validated lower-realm arrival sites.

First entry must not normally place an unprepared traveller directly into:

- active Thunderhead interior;
- severe Stormfront;
- exposed High Silence;
- hostile Divine Domain;
- Concordant Firmament;
- active Void corruption;
- lethal fall state.

## 27.2 Arrival Safety

Destination validation should consider at minimum:

- stable ground/platform;
- sufficient atmosphere for intended progression stage;
- non-lethal local gravity profile;
- valid return-gate space;
- no immediate forced fall;
- no unresolved hard access violation;
- bounded nearby hazard exposure;
- save-safe spawn placement.

## 27.3 Advanced Destinations

Later Ascension Gate destination binding may target discovered/authorised higher-altitude destinations under universal portal rules.

This does not create a second portal type.

Detailed construction/activation belongs to FCC-05G.

---

# 28. Environmental Event Interfaces

FCC-05H owns event execution and reward/outcome logic.

FCC-05B supplies environmental interfaces for the twelve event families:

1. **Windway Shift** — route/current state changes;
2. **Cloudwhale Migration** — Migration Tide/ecology pressure;
3. **Stormglass Bloom** — increased storm/lightning/material opportunity;
4. **Thunderhead Surge** — cloud-sea expansion/intensification;
5. **Island Drift** — Gravity Drift and route geometry change;
6. **Sky Convoy Crisis** — route congestion/blockage/environmental danger;
7. **Pilgrimage Season** — Pilgrimage Convergence;
8. **Domain Law Revision** — sacred-law/environmental boundary update;
9. **Tribunal Crisis** — Concord Tension/urban domain conflict;
10. **Fallen-Saint Revelation** — War-Saint/Domain environmental aftermath;
11. **Pilgrim Star Passage** — moving high-divine environmental influence;
12. **Void Breach** — genuine Void-Corrupted State.

Events must select from bounded environmental outcomes rather than continuously randomising the entire realm.

---

# 29. Persistent Environmental Aftermath

Major events, authority outcomes and infrastructure changes may alter:

- Windway route state;
- island altitude/state;
- bridge alignment;
- storm exposure;
- migration routes;
- settlement suitability;
- sacred-law boundaries;
- sanctuary availability;
- dungeon occupation;
- resource access;
- pilgrimage routes;
- Domain ownership/state;
- corruption state.

Persistent changes must:

- be recorded authoritatively;
- reproduce on reload;
- preserve stable region/site identity;
- expose enough state for downstream systems to diagnose consequences;
- remain compatible with multiplayer authority.

Environmental aftermath must not exist only as temporary VFX when the gameplay outcome is intended to be durable.

---

# 30. Deterministic World-Generation Rules

Ascendant world generation must remain deterministic from seed + content version + authoritative saved state.

## 30.1 Generation Inputs

Generation may consume:

- world seed;
- realm content version;
- altitude band;
- biome suitability;
- floating-landmass rules;
- gravity profile;
- route/Windway graph;
- atmospheric profile;
- storm-climate profile;
- settlement-site suitability;
- resource suitability;
- flora/creature suitability;
- Divine Domain placement rules;
- authority territory rules;
- validated portal-arrival rules.

## 30.2 Unvisited Regions

Unvisited regions remain derivable rather than requiring permanent full simulation.

## 30.3 Visited/Changed Regions

Once authoritative state changes occur, save data records the delta/state required to reproduce:

- construction;
- terrain edits;
- regional state;
- route state;
- authority aftermath;
- settlement state;
- environmental event aftermath;
- corruption/restoration state.

## 30.4 No Runtime Spatial Randomisation

The realm may be fantastical and vertically dynamic without randomly relocating terrain every load.

Apparent movement must map to explicit saved states or deterministic simulation.

---

# 31. Biome Suitability Interface

Later FCC-05 documents consume biome/environment suitability rather than redefining environmental identity.

Each content definition may specify:

- allowed biome families;
- preferred biome families;
- excluded biome families;
- altitude-band requirements;
- gravity-profile requirements;
- atmospheric requirements;
- Windway compatibility;
- Thunderhead compatibility;
- High-Aether compatibility;
- Divine Domain compatibility;
- Law Garden/Mercy compatibility;
- settlement suitability;
- dungeon suitability;
- hazard tolerance;
- regional-state response;
- Void-corruption eligibility;
- restoration-state eligibility.

This becomes the deterministic placement interface for materials, flora, creatures, settlements, structures and adventure content.

---

# 32. Settlement Environmental Requirements

FCC-05F/G own settlement and structure definitions, but environmental suitability must support the following realm-specific engineering constraints where relevant:

- supported mass and buoyancy safety;
- anchor stability;
- route redundancy;
- fall-rescue access;
- storm refuge;
- cargo/tie-down safety;
- landing/berth approach;
- evacuation routes;
- safe water/food access;
- sealed/breathable space in High Aether;
- local Divine Domain law compatibility;
- safe return/transport infrastructure.

Imported universal settlement blueprints may be adapted to these conditions but cannot ignore them.

---

# 33. Environmental Simulation Scaling

The Ascendant Reach must support low-end systems without changing authoritative outcomes.

## 33.1 Near Simulation

Loaded/near regions may simulate detailed:

- wind particles;
- cloud movement;
- lightning presentation;
- local gravity cues;
- wildlife movement;
- vessel visual motion;
- suspended water/cloud-fluid effects;
- divine-domain VFX;
- migration visuals.

## 33.2 Far Simulation

Far/off-screen regions may collapse to coarse state such as:

- current route state;
- storm state;
- gravity state;
- migration state;
- settlement safety state;
- authority influence;
- event state;
- domain-law state;
- corruption state.

## 33.3 Authority Preservation

Lower visual/simulation quality may reduce:

- particle count;
- cloud volumetrics;
- distant fauna density;
- lightning visual complexity;
- visible debris;
- decorative aerial traffic;
- transition animation complexity;
- divine-radiance intensity.

It may **not** change:

- authoritative route availability;
- damage outcome;
- gravity profile;
- survival requirement;
- settlement viability;
- resource transaction;
- domain-law consequence;
- event outcome;
- saved environmental state.

---

# 34. Multiplayer Environmental Authority

In multiplayer:

- authoritative realm state owns biome/region state;
- one shared storm/current/gravity/domain state applies to the authoritative world;
- clients may reduce presentation complexity independently;
- local accessibility options may change presentation but not shared mechanics;
- Windway, event, authority and corruption changes require authoritative commit;
- no client may independently select a different physical island state or Divine Domain law outcome.

The universal multiplayer architecture owns networking details.

---

# 35. Accessibility and Environmental Readability

Ascendant environmental design intentionally includes height, storms, low visibility, radiance and altered gravity. These must remain playable.

Accessibility options may reduce, replace or supplement:

- intense cloud volumetrics;
- lightning flashes;
- repeated screen shake;
- strong wind camera movement;
- rapid gravity-transition camera effects;
- heavy bloom/radiance;
- strong high-altitude glare;
- dense particles;
- severe audio suppression in High Silence;
- visual distortion at Divine Domain boundaries;
- motion from drifting islands/debris;
- vertigo-inducing peripheral effects.

Critical gameplay state must use redundant cues such as:

- text;
- icons;
- route markers;
- silhouette;
- environmental props;
- sound;
- haptics where supported;
- map/Codex;
- warning instruments;
- NPC/settlement alerts;
- material state.

The following distinctions must never rely on colour alone:

- safe versus unsafe Windway;
- ordinary storm versus Void-corrupted storm;
- High-Aether exposure versus divine-radiance exposure;
- neutral Domain boundary versus hostile/restricted boundary;
- Gravity Drift versus ordinary local low gravity;
- sanctuary state versus revoked sanctuary;
- first-arrival safe zone versus hazardous route.

Accessibility settings may reduce presentation intensity without changing authoritative environmental outcomes unless a separate explicit gameplay-assist option says otherwise.

---

# 36. Environmental Art-Handoff Requirements

Later FCC-05K/L or global realm-art documents must visually distinguish at minimum:

- the five macro-altitude bands;
- all twelve major biome families;
- ordinary Cloudstone geology versus Stormglass formation;
- Thunderhead cloud-sea environment versus normal cloud cover;
- Aerial Kelp Field vertical ecology;
- Skyforge volcanic/industrial terrain;
- Fallen Continent Underside orientation;
- High Silence thin-atmosphere conditions;
- Pilgrim Threshold transition into divine territory;
- Law Garden declared-law environment;
- Radiant Tribunal urban sacred environment;
- War-Saint ideological/memorial environment;
- Concordant Firmament multi-domain environment;
- Clear Current versus Stormfront;
- Gravity Drift;
- High-Aether Surge;
- Concord Tension;
- natural/hostile divine territory versus genuine Void corruption.

Final palettes, RGB values, texture rules and material inheritance remain deferred to global/future art governance.

---

# 37. Cross-Document Ownership Matrix

| Content | Owning FCC Document | FCC-05B Responsibility |
|---|---|---|
| Realm identity, five macro-altitude bands, Ascension Gate access principle, sacred-law boundaries, death exclusion | FCC-05A | Expresses their environmental consequences |
| Geology, materials, resources, export and processing foundations | FCC-05C | Supplies biome/altitude occurrence and environmental suitability |
| Flora, Skywood, Aerial Kelp, crops and food ecology | FCC-05D | Supplies habitats, altitude suitability and environmental-state interfaces |
| Creatures and creature ecology | FCC-05E | Supplies habitat, migration, hazard and environmental-state interfaces |
| Civilisations, settlements and Wind Rights | FCC-05F | Supplies settlement suitability, route geography and environmental constraints |
| Structures, Ascension Gate construction, Blocks, Items, processing and recipes | FCC-05G | Supplies terrain/site suitability and hazard/environment hooks |
| Dungeons, guardians, authorities, events and rewards | FCC-05H | Supplies biome, altitude, territory, hazard and environmental-event interfaces |
| Sacred-law state transitions, corruption, restoration and cross-realm state interaction | FCC-05I | Supplies baseline environmental-state taxonomy and distinction rules |
| Final registry, validation and art handoff | FCC-05J | Supplies exact biome/hazard/state registries and source reconciliation |

No FCC-05B rule may seize ownership from another FCC document or universal Leyforge system.

---

# 38. Cross-Realm Environmental Boundaries

## 38.1 Overworld

Ascendant Reach is a separate realm.

Floating islands visible within Ascendant are not simply Overworld landmasses at greater altitude.

Overworld weather and Ascendant weather may have authored interfaces, but they are not continuously one simulation.

## 38.2 Verdant Covenant

Verdant materials, crops and ecology may be imported or researched through explicit interfaces.

This does not merge Verdant seasonal law with Ascendant altitude/divine-law environment.

## 38.3 Somnolent Expanse

Dreams, prophecy and divine visions may interact narratively/systemically through explicit interfaces.

Ascendant terrain is not part of the Dream Network, and no dream route becomes an Ascendant travel bypass.

## 38.4 Ancestral Veil

Historical, saintly or religious records may have Veil interfaces, but Ascendant terrain does not become an afterlife layer and the Divine Concords do not own universal death.

## 38.5 Void Between

Void corruption may affect Ascendant terrain, gravity infrastructure, Windways, Divine Domains and Ascension Gates.

FCC-05B owns local environmental consequences; FCC-10 owns the deeper Void cosmology.

## 38.6 Pocket Realms

Future Pocket Realms may consume Ascendant-derived modules relating to:

- gravity;
- atmosphere;
- buoyancy;
- Windways;
- storm climate;
- High-Aether conditions;
- bounded sacred-law territories.

FCC-11 owns Pocket Realm construction, stability and capacity.

---

# 39. Source Reconciliation and Supersession Register

| Source-Era Direction | FCC-05B Resolution |
|---|---|
| Aetheric Reach and Divine Concords are separate realms | Superseded; one continuous Ascendant Reach |
| former Aetheric eight-biome pool and Divine eight-biome pool remain sixteen equal biomes | Reconciled to twelve major biome families |
| Windway Corridors are a top-level biome | Reclassified to realm-spanning route/environment infrastructure with local corridor sub-biomes |
| Mercy Wells are a separate major biome | Reclassified to Law Garden sacred-domain/sub-biome family |
| Archive of Oaths is a separate biome | Reclassified to major district/site/structure family |
| Abandoned Sanctums are one biome | Reclassified to domain/site/dungeon state applicable across upper biomes |
| Divine Concords require separate portal entry | Superseded; internal physical ascent from lower realm |
| first Divine arrival occurs directly in upper sacred territory | Superseded; first Ascension Gate arrival targets validated lower/middle region |
| climbing high enough can enter the Void | Prohibited |
| falling low enough returns to Overworld | Prohibited |
| higher altitude always means every encounter is harder | Superseded; general progression trend only |
| gravity is arbitrary/unbounded | Reconciled to bounded regional profiles |
| every Cloudstone block floats identically | Prohibited; exact buoyancy belongs to material/structure systems |
| Thunderhead Sea is ordinary water ocean in sky | Superseded; dense cloud-fluid system with true-water regions |
| High Silence is secretly Void | Prohibited |
| all divine territory is benevolent/heavenly | Prohibited |
| all hostile/abandoned divine territory is corrupted | Prohibited; Void provenance required |
| domain violations always deal holy damage | Prohibited; consequences are declared and authored |
| environment may strand player after access revocation | Prohibited; valid recovery/return route required |
| dynamic islands/storms may rerandomise on load | Prohibited; persistent/deterministic state required |

Older useful environmental concepts remain retained where compatible with the FCC lock.

---

# 40. Validation Invariants

Any valid implementation of FCC-05B must preserve all of the following:

1. Ascendant Reach is one realm, not two active dimensions.
2. Exactly five macro-altitude bands are recognised.
3. Exactly twelve major biome families are recognised at FCC-05B level.
4. Windways are route/environment infrastructure, not a thirteenth biome.
5. Mercy Wells remain Law Garden sub-biome/domain content.
6. Archive of Oaths remains a district/site/structure family.
7. Abandoned Sanctum remains a state/variant family.
8. Higher altitude generally increases environmental complexity but is not a universal numeric difficulty rule.
9. Falling remains physical intra-realm movement unless universal death resolves it.
10. Falling never becomes ordinary interdimensional exit.
11. High Aether is not the Void Between.
12. Divine Concord territories remain part of Ascendant Reach.
13. Gravity uses bounded deterministic profiles.
14. Atmosphere uses universal survival interfaces.
15. Thunderhead Seas are cloud-fluid systems, not ordinary ocean copies.
16. All eight regional environmental-state families are preserved.
17. All twelve hazard families are preserved.
18. Natural storm/high-altitude/divine danger is not automatically Void corruption.
19. Sacred-law consequences are declared/authored rather than arbitrary morality parsing.
20. Domain access restriction cannot permanently strand a valid player save.
21. Persistent environmental changes survive save/load.
22. Performance scaling may simplify visuals, not authoritative outcomes.
23. Accessibility may change presentation, not hidden world truth.
24. Ascension Gate first arrival must resolve to a validated safe lower/middle destination.
25. No environmental mechanic creates a second canonical Ascendant portal type.

---

# 41. FCC-05B Acceptance Gate

FCC-05B is ready for realm-local acceptance only if all of the following remain true:

- the five macro-altitude bands are fully defined;
- the realm remains one continuous vertical environment;
- all twelve major biome families are defined and environmentally distinct;
- the four inherited non-biome concepts are correctly reclassified;
- Windways function as persistent route geography;
- bounded gravity and atmospheric models are defined;
- the eight regional environmental-state families are defined;
- all twelve canonical hazard families are defined;
- falling and lower/upper realm boundaries cannot bypass interdimensional portal ownership;
- Cloudgrass supports safe large-scale habitation and potential first-arrival regions;
- Stormglass Archipelagos own storm-shaped glass landscapes without owning material processing;
- Thunderhead Seas preserve cloud-fluid identity;
- Aerial Kelp Fields preserve vertical living-forest identity;
- Skyforge Calderas preserve volcanic/industrial sky geology;
- Fallen Continent Undersides preserve full ecology/settlement value;
- High Silence remains High Aether rather than Void;
- Pilgrim Thresholds function as the transition into divine reality;
- Law Gardens preserve bounded declared sacred law;
- Radiant Tribunal Cities preserve urban divine/civic identity;
- War-Saint Fields preserve ideological plurality;
- Concordant Firmament preserves multi-domain upper-realm identity without establishing one supreme god;
- domain boundaries and conflicting laws remain readable and bounded;
- Ascension Gate arrival safety is explicit;
- persistent event/authority aftermath is supported;
- deterministic generation/save rules are explicit;
- simulation scaling preserves gameplay truth;
- accessibility/readability requirements are explicit;
- downstream document ownership remains intact.

**FCC-05B status:** **CONTENT CANON — REALM-LOCAL LOCK CANDIDATE** pending owner review.

---

# 42. Source and Decision Provenance

FCC-05B reconciles the following principal source families:

- FCC-05A — Ascendant Reach Realm Identity, Laws, Progression & Canon Boundaries;
- Foundation Documents 00–20;
- Document 11 — Biomes & World Generation;
- Document 14 — Dimensions;
- World Content Atlas Set 24, especially former Aetheric Reach and Divine Concords environment/biome definitions;
- post-Atlas governance, registry and integration rules;
- movement/vertical traversal interfaces;
- accepted FCC-05 interview decisions Q391–Q583.

Where earlier source wording conflicts with accepted FCC-05 decisions, the accepted FCC decisions and current cross-set ownership rules take precedence for realm-local canon.

Legacy source IDs and names remain preserved for migration/audit purposes where required; they do not re-create superseded active realm or biome structures.

---

# 43. Final Realm-Local Lock Summary

At FCC-05B v0.1:

**Macro-altitude bands:** defined; owner lock pending.  
**Twelve-biome roster:** defined; owner lock pending.  
**Windway environmental infrastructure:** defined; owner lock pending.  
**Gravity/buoyancy environmental model:** defined; owner lock pending.  
**Atmospheric gradient:** defined; owner lock pending.  
**Eight regional state families:** defined; owner lock pending.  
**Twelve hazard families:** defined; owner lock pending.  
**Cloudgrass Plateaus:** defined; owner lock pending.  
**Stormglass Archipelagos:** defined; owner lock pending.  
**Thunderhead Seas:** defined; owner lock pending.  
**Aerial Kelp Fields:** defined; owner lock pending.  
**Skyforge Calderas:** defined; owner lock pending.  
**Fallen Continent Undersides:** defined; owner lock pending.  
**High Silence Expanse:** defined; owner lock pending.  
**Pilgrim Thresholds:** defined; owner lock pending.  
**Law Gardens:** defined; owner lock pending.  
**Radiant Tribunal Cities:** defined; owner lock pending.  
**War-Saint Fields:** defined; owner lock pending.  
**Concordant Firmament:** defined; owner lock pending.  
**Ascension Gate arrival-environment contract:** defined; owner lock pending.  
**Determinism/save-safety:** defined; owner lock pending.  
**Simulation scaling:** defined; owner lock pending.  
**Accessibility/readability:** defined; owner lock pending.  
**Detailed materials/flora/creatures/civilisations/structures/dungeons/corruption:** deferred to their owning FCC-05 documents.

No future Ascendant environmental content should:

- restore Aetheric Reach and Divine Concords as separate active realms;
- create a thirteenth major biome without reopening realm canon;
- turn Windways into interdimensional portals;
- treat Mercy Wells as a separate realm/biome family;
- treat High Silence as the Void Between;
- turn falling into an Overworld exit;
- make gravity arbitrary or per-voxel by default;
- create hidden sacred laws with unavoidable permanent consequences;
- treat hostile divinity as proof of Void corruption;
- rerandomise persistent landmass or Domain state on reload;
- strand the player through domain-access revocation;
- bypass the Ascension Gate as the one canonical normal interdimensional access family.

> **FCC-05 ASCENDANT REACH — CONTENT CANON LOCKED — pending final cross-realm reconciliation.**
