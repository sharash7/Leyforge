# Leyforge Final Content Canon Collection

## FCC-03E — Ancestral Veil Creatures, Wildlife, Spirit Ecology, Creature Materials & Variants

**Version:** 0.1  
**Status:** Content Canon — Realm-Local Lock Candidate  
**Realm:** Ancestral Veil  
**Stable Realm ID:** `realm.major.ancestral_veil`  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Consumes:** FCC-03A — Realm Identity, Laws, Progression & Canon Boundaries; FCC-03B — Biomes, Terrain, Memory States & Environmental Hazards; FCC-03C — Geology, Materials, Resources, Processing & Provenance; FCC-03D — Flora, Soulwood, Ossuary Ecology, Food & Botanical Ecology  
**Primary Scope:** Final twelve-creature roster, creature ecology, physical/semi-corporeal/spirit-active creature classes, habitat suitability, food-web roles, creature-resource provenance, renewable/non-lethal acquisition, bounded identity/memory interactions, settlement interfaces, variants, natural disease, corruption and art-handoff constraints.  
**Final Global Status:** Pending final cross-realm reconciliation after all realm FCC sets and the Overworld FCC are complete.

---

# 1. Purpose

FCC-03E defines the authoritative **creature and wildlife canon** of the Ancestral Veil.

It owns:

- the final twelve named creature families;
- reconciliation of the five original World Content Atlas foundations with seven FCC-expanded families;
- physical, semi-corporeal and spirit-active wildlife ecology;
- habitat and biome suitability;
- predator, grazer, pollinator, decomposer, scavenger, route and aquatic roles;
- creature interactions with memory, identity and route systems;
- legitimate creature-derived resource provenance;
- renewable and non-lethal acquisition where appropriate;
- biological food interfaces;
- settlement, transport, stewardship and cultural hooks;
- variants and runtime states;
- natural injury/disease versus Void corruption;
- the gate for when a transformed creature becomes a separate canonical definition;
- low-end simulation constraints;
- creature art-handoff boundaries.

FCC-03E does **not** own:

- civilised NPC population definitions, which belong to FCC-03F and universal personhood/NPC systems;
- dungeon guardians or realm authorities, which belong to FCC-03H;
- exact loot probabilities or recipes, which belong to FCC-03G/FCC-13;
- biome generation rates, which belong to FCC-03B/worldgen;
- final material identities of Veil Silk or Echo Pearl, which belong to FCC-03C;
- plant biology, which belongs to FCC-03D;
- universal combat, taming, hunger, breeding or AI framework rules;
- final colours, textures or animation specifications.

The goal is a **complete ecosystem**, not a realm populated only by ghosts, enemies and quest actors.

---

# 2. Creature Canon Statement

The Ancestral Veil contains a mixture of:

- fully physical animals;
- semi-corporeal animals;
- spirit-active native life;
- memory-sensitive wildlife;
- aquatic organisms;
- decomposers;
- pollinators;
- grazers;
- scavengers;
- predators;
- route-associated fauna;
- domestication-compatible or settlement-compatible species where later mechanics support them.

> **A creature in the Ancestral Veil is a native creature first. Spirit, memory and identity interactions may shape its ecology, but being spirit-like does not make it a dead NPC record or a generic resource container.**

A creature resembling an ancestor, spirit or memorial animal is not automatically the persisted soul of something that died elsewhere.

Normal creature death does not create generic Souls, Ancestral Essence, Spirit Essence, dead-NPC records or universal afterlife cargo.

---

# 3. Final Canonical Creature Roster

The Ancestral Veil has exactly **twelve principal named creature families**:

1. **Namekeeper Crane**
2. **Memory Moth**
3. **Procession Hound**
4. **Mourning Eel**
5. **Remnant Eater**
6. **Ossuary Grazer**
7. **Echo Ray**
8. **Grave Beetle**
9. **Lantern Wisp**
10. **Memory Koi**
11. **Mist Strider**
12. **Memoryback**

The first five preserve the original World Content Atlas foundations. The final seven complete the FCC ecological roster.

The realm may additionally contain ambient insects, tiny aquatic organisms, worms, plankton-like life, microorganisms, unnamed small fish and incidental invertebrates without assigning each a stable named family.

---

# 4. Stable-ID Reconciliation

The five original Atlas IDs remain canonical:

| Creature | Stable ID |
|---|---|
| **Namekeeper Crane** | `creature.realm.ancestral.namekeeper_crane` |
| **Memory Moth** | `creature.realm.ancestral.memory_moth` |
| **Procession Hound** | `creature.realm.ancestral.procession_hound` |
| **Mourning Eel** | `creature.realm.ancestral.mourning_eel` |
| **Remnant Eater** | `creature.realm.ancestral.remnant_eater` |

The seven FCC-expanded families receive working realm-local IDs:

| Creature | Working Canonical ID |
|---|---|
| **Ossuary Grazer** | `creature.realm.ancestral.ossuary_grazer` |
| **Echo Ray** | `creature.realm.ancestral.echo_ray` |
| **Grave Beetle** | `creature.realm.ancestral.grave_beetle` |
| **Lantern Wisp** | `creature.realm.ancestral.lantern_wisp` |
| **Memory Koi** | `creature.realm.ancestral.memory_koi` |
| **Mist Strider** | `creature.realm.ancestral.mist_strider` |
| **Memoryback** | `creature.realm.ancestral.memoryback` |

The final namespace may be normalised during FCC-12/FCC-13. Display names and creature identities are realm-locally locked.

---

# 5. Creature Physicality

Creature definitions may use these physicality classes:

1. **Physical**
2. **Semi-Corporeal**
3. **Spirit-Active Physical**
4. **Primarily Incorporeal**

This may control collision, locomotion, damage channels, ordinary feeding, ward interaction, Veil Silk/Soul Silver interaction and visual presentation.

Physicality does **not** determine personhood.

A spirit-like creature is not automatically intelligent or a person. A physical creature is not automatically non-sapient. Personhood remains owned by the universal personhood/NPC framework.

---

# 6. Ecological Role Matrix

| Creature | Principal Ecological Role | Typical Realm Hook |
|---|---|---|
| **Namekeeper Crane** | Route/wetland name-and-memory guide | recognised names, waterways, route anchors |
| **Memory Moth** | Pollinator/weaver | flowers, ambient recollection traces, Veil Silk |
| **Procession Hound** | Route guardian | Processional Roads, sanctioned passage |
| **Mourning Eel** | Aquatic scavenger | grief-resonance residue, decaying echo matter |
| **Remnant Eater** | Identity predator | weak anchors, Predator Dark, unstable archives |
| **Ossuary Grazer** | Orchard browser/seed disperser | Ossuary Tree ecology |
| **Echo Ray** | Large Memory Sea feeder | ambient echoes, Echo Pearl formation |
| **Grave Beetle** | Decomposer/soil recycler | orchard litter, dead biomass, Spirit Clay soils |
| **Lantern Wisp** | Navigation-associated native entity | stable routes, Grave Salt wards, Veil-Lanterns |
| **Memory Koi** | Small aquatic indicator/fauna | local echo-state patterning |
| **Mist Strider** | Neutral mistland wanderer | Mourning Mists, disturbance response |
| **Memoryback** | Pack/herd transport animal | stable routes, physical cargo, settlements |

---

# 7. Namekeeper Crane

The **Namekeeper Crane** is a tall Veil-native bird associated with waterways, route stations, Processional crossings, Hearthland wetlands and Memory Sea margins.

It has bounded sensitivity to **recognised, registered or remembered names**.

It may:

- repeat or call recognised names;
- react to name markers;
- favour stable route anchors;
- indicate a nearby recognised path;
- help a disoriented traveller identify the correct route.

It may not reveal secret names from nowhere, bypass knowledge permissions, identify every disguised character or act as a universal truth detector.

The creature has no locked unique mandatory harvest material. Feathers or other ordinary biological outputs may be admitted later only if a concrete recipe dependency justifies them.

---

# 8. Memory Moth

The **Memory Moth** is the canonical Veil-silk-producing pollinator/weaver.

This merges the original Atlas Memory Moth with the later FCC “Veil Weaver” concept rather than adding a redundant second moth species.

Memory Moths:

- visit flowering Veil plants;
- feed on nectar and bounded ambient discarded-recollection traces;
- contribute to pollination;
- form cocoons;
- produce **Veil Silk**;
- favour archive gardens, orchards, Hearthlands and sheltered sites.

“Discarded recollection traces” means bounded environmental echo state, not extraction of stored NPC memories.

Legitimate Veil Silk acquisition includes abandoned cocoons, shed fibre, natural webbing, managed cultivation, cooperative production and trade.

Normal Veil Silk progression must **not require slaughtering Memory Moths**.

---

# 9. Procession Hound

The **Procession Hound** is a route-guardian spirit-active animal associated with Processional Roads and stable transit infrastructure.

The old funeral-road framing is superseded.

Procession Hounds may:

- patrol route segments;
- follow recognised convoys;
- protect route stations;
- respond to valid passage states;
- warn against damaged paths;
- challenge active route violators.

Hostility may arise from route desecration, trespass state, attacks on protected travellers, corruption or local authority directives.

It does **not** become hostile merely because a traveller lacks ancestry or because the traveller is alive.

Later systems may support route security, convoy protection, sanctuary patrol or companionship. Exact training/taming mechanics remain outside FCC-03E.

---

# 10. Mourning Eel

The **Mourning Eel** is a canal, wetland and Memory Sea-margin scavenger.

It consumes:

- decaying biological material;
- decaying environmental echo matter;
- excess grief-resonance represented as bounded environmental state.

It does **not consume souls**.

At healthy population levels it can reduce harmful accumulation. Overabundance may over-strip echo-rich environments, make areas feel emotionally flattened, destabilise aquatic ecology or outcompete other scavengers.

The species may participate in biological food webs, but whether particular cultures harvest or eat it belongs to FCC-03F/G.

No unique mandatory grief-resource drop is canonical.

---

# 11. Remnant Eater

The **Remnant Eater** is the principal native **identity predator**.

It is associated especially with Predator Dark, unstable archives, damaged route regions, forgotten sites and poorly anchored identity environments.

Its attacks may temporarily disrupt:

- map labels;
- navigation markers;
- recognised route access;
- displayed names;
- NPC recognition states;
- selected ability/permission references;
- interface certainty.

The system must preserve authoritative saved data.

A Remnant Eater may never permanently delete the player's identity, save records, NPC definitions, world history, inventory ownership or account/profile data.

Recovery may use time, retreat, name/identity anchors, cleansing or later specialist stabilisation systems.

**Remnant Eater** and **Memory Eater** are separate canonical entities:

- Remnant Eater = creature family.
- Memory Eater = major realm authority defined in FCC-03H.

They must not share one stable ID or be treated as lifecycle stages.

No generic Memory Fragment, Soul or Identity Shard is guaranteed as a kill drop.

---

# 12. Ossuary Grazer

The **Ossuary Grazer** is a pale browsing herbivore associated primarily with Ossuary Orchards.

It helps demonstrate that the Orchards are functioning ecosystems rather than decorative tomb forests.

Ecological functions may include:

- browsing lower Ossuary Tree growth;
- pruning competing vegetation;
- consuming compatible herbs;
- dispersing seeds and propagules;
- influencing orchard regeneration;
- creating trails and resting sites.

Too many grazers may suppress young-tree recruitment. Too few may permit unhealthy overgrowth.

Orchard custodians may protect, manage, redirect, breed, relocate or exclude them through shared husbandry/wildlife systems where supported.

No unique new major material is locked from the species.

---

# 13. Echo Ray

The **Echo Ray** is a large peaceful Memory Sea animal with a broad ray/whale-like silhouette.

It feeds on:

- ambient echo-rich particulates;
- microscopic aquatic life;
- realm-native suspended biological matter.

It does **not feed on souls**.

Echo Rays are the principal canonical biological source of **Echo Pearls**.

Pearl formation is a natural biomineralisation process influenced by the Memory Sea environment.

Supported acquisition should favour:

- naturally released pearls;
- managed non-lethal collection;
- discovery at resting/feeding grounds;
- trade;
- ecological stewardship.

Lethal harvest may exist as an exploitative action if universal wildlife systems support it, but it must not be the only normal progression route.

Echo Rays also help circulate Memory Sea nutrients and redistribute ambient echo matter. Population loss may therefore have ecological consequences.

---

# 14. Grave Beetle

The **Grave Beetle** is a physical or semi-spirit-active decomposer associated with Ossuary Orchards, Spirit Clay-rich soils, Hearthlands, old structures and biological debris.

Its name is cultural/ecological, not proof that it requires human corpses.

Grave Beetles may consume:

- dead leaves;
- fallen bark;
- fungi;
- decaying plant matter;
- ordinary carrion where ecologically appropriate;
- organic settlement waste.

They contribute to soil cycling, orchard health, decomposition and fungal dispersal.

No mandatory unique beetle material is locked.

Chitin, pigment or ordinary creature products may be admitted later only if a concrete gameplay dependency requires them.

---

# 15. Lantern Wisp

The **Lantern Wisp** is a small luminous native Veil entity associated with:

- stable routes;
- Grave Salt boundaries;
- Veil-Lantern infrastructure;
- safe Hearthland paths;
- shrine/sanctuary environments.

It is **not a dead person's soul**.

Lantern Wisps may:

- cluster near stable paths;
- avoid severe identity instability;
- react to ward failure;
- drift toward active Veil-Lantern networks;
- provide environmental navigation feedback.

They may disappear or behave erratically before some hazard states.

Lantern Wisps are **not fuel**.

No canonical normal resource loop may bottle, kill or grind them into generic spirit energy.

---

# 16. Memory Koi

The **Memory Koi** is a smaller Memory Sea/still-water fish analogue.

It accumulates **visible environmental pattern and colour changes** according to bounded local echo conditions.

It does not individually store complete memories.

Memory Koi may inhabit:

- sheltered Memory Sea coves;
- Hearthland ponds;
- archive pools;
- cultivated water gardens;
- slow canals.

They participate in aquatic food webs and may support settlement aquaculture where later systems permit it.

Different cultures may treat Memory Koi as food, ornamental life, protected/sacred animals, environmental indicators or trade animals.

No one use is universal.

---

# 17. Mist Strider

The **Mist Strider** is a long-limbed neutral creature adapted to low visibility and distorted sound in the Mourning Mists.

Mist Striders may:

- traverse terrain other creatures avoid;
- follow persistent environmental disturbances;
- pause near unstable areas;
- react before severe mist shifts;
- migrate as local conditions change.

Their presence can act as ecological warning rather than an explicit UI alarm.

Mist Striders are not inherently hostile.

Hostility may result from injury, cornering, defence of young, corruption or specific event states.

---

# 18. Memoryback

The **Memoryback** is a large, slow route-adapted herd/pack animal associated with Hearthlands and Processional infrastructure.

It provides a plausible non-machine transport animal for physical cargo.

Memorybacks:

- move along stable routes;
- graze or browse suitable flora;
- rest at route stations;
- tolerate long convoy journeys;
- form herds or managed working groups.

Later systems may support Memorybacks as pack animals, caravan animals, freight transport, settlement livestock or route-service animals.

Exact riding, harness, breeding, capacity and taming rules remain outside FCC-03E.

No unique mandatory material is locked from the species.

---

# 19. Habitat Suitability Matrix

| Creature | Primary Biomes | Secondary Biomes |
|---|---|---|
| Namekeeper Crane | Processional Roads, Memory Sea | Echoing Hearthlands |
| Memory Moth | Echoing Hearthlands, Ossuary Orchards | Crownlands, Forgotten City gardens |
| Procession Hound | Processional Roads | Crownlands, Hearthlands |
| Mourning Eel | Memory Sea | Mourning Mists wetlands, canals |
| Remnant Eater | Predator Dark | Forgotten City Reflections, unstable routes |
| Ossuary Grazer | Ossuary Orchards | Crownlands, Hearthland orchard edges |
| Echo Ray | Memory Sea | major connected/submerged water sites |
| Grave Beetle | Ossuary Orchards | Hearthlands, old structures |
| Lantern Wisp | Processional Roads, Hearthlands | Crownlands, stable shrine sites |
| Memory Koi | Memory Sea, Hearthlands water | archive ponds, cultivated pools |
| Mist Strider | Mourning Mists | Predator-Dark margins, wet Hearthlands |
| Memoryback | Processional Roads, Hearthlands | Crownlands |

This expresses suitability, not hard-exclusive spawning.

Events, migration, settlement management and world state may create rare out-of-biome occurrences.

---

# 20. Food-Web Architecture

The Veil ecosystem should use real ecological relationships.

## Producers

- Ossuary Tree;
- Memory Reed;
- named/ambient flora;
- algae and aquatic plants;
- fungi and microorganisms.

## Herbivores / Browsers

- Ossuary Grazer;
- Memoryback;
- selected Memory Koi feeding behaviour.

## Pollinators / Small Consumers

- Memory Moth;
- ambient insects.

## Decomposers / Scavengers

- Grave Beetle;
- Mourning Eel;
- fungi and microorganisms.

## Large Aquatic Feeders

- Echo Ray.

## Predators / Hazard Fauna

- Remnant Eater;
- situationally hostile Procession Hounds;
- corrupted wildlife where applicable.

## Route / Indicator Fauna

- Namekeeper Crane;
- Lantern Wisp;
- Mist Strider.

This prevents the realm from reducing every creature to a combat role.

---

# 21. Creature-Derived Resource Matrix

Only creature-resource relationships justified by locked canon are admitted as major hooks.

| Creature | Canonical Resource Relationship | Normal Acquisition Direction |
|---|---|---|
| **Memory Moth** | **Veil Silk** | cocoons, shedding, managed production |
| **Echo Ray** | **Echo Pearl** | natural/non-lethal biological release preferred |
| **Memory Koi** | biological food interface where culture permits | fishing/aquaculture under culture/economy rules |
| **Mourning Eel** | biological food interface may exist where culture permits | later culture/recipe decision |
| Other roster creatures | no unique major material currently locked | ordinary products only if later justified |

No creature automatically drops:

- Soul;
- Ancestral Essence;
- Memory Fragment;
- Spirit Essence;
- Identity Shard.

If a later recipe needs an ordinary creature product such as hide, meat, feather, egg, chitin or bone, that product must:

1. fit the species anatomy;
2. have a real gameplay purpose;
3. use universal material categories where possible;
4. avoid duplicating a major realm resource;
5. be admitted through FCC-03G/J or later reconciliation.

---

# 22. Sustainable Acquisition and Stewardship

Possible legitimate acquisition methods include:

- shedding;
- moulting;
- abandoned cocoons;
- naturally released biominerals;
- husbandry;
- aquaculture;
- managed breeding;
- trade;
- salvage;
- population management;
- ordinary hunting where ecologically/culturally supported.

The system need not moralise every hunt identically, but overharvest may affect population, pollination, orchard health, Memory Sea health, route indicators and settlement production.

A sustainable-provenance flag is required only where gameplay uses it.

---

# 23. Creature Personhood Boundary

Creature status and personhood are separate axes.

Most FCC-03E fauna are wildlife, animals or native spirit fauna.

If an individual or population later satisfies universal personhood rules, the game must respect that status.

The creature-resource system may not assume:

- all spirits are harvestable;
- all animals are non-persons;
- all undead are monsters;
- all memory-beings are NPCs;
- all incorporeal entities are loot containers.

Civilised species, citizens, courts and Necropolis populations belong to FCC-03F rather than wildlife.

---

# 24. Settlement Interaction Classes

Creature families may expose bounded settlement interaction classes such as:

- wildlife tolerated;
- protected;
- pest;
- managed;
- domestication-compatible;
- working animal;
- sacred/cultural;
- dangerous;
- route guardian;
- aquaculture-compatible.

These are cultural/settlement policies, not universal moral labels.

Examples:

- Memoryback may be a working animal.
- Memory Koi may be aquaculture or protected.
- Procession Hound may be a route guardian.
- Grave Beetle may be beneficial decomposer or pest.
- Memory Moth may be managed for Veil Silk.
- Echo Ray may be protected by Memory Sea communities.

FCC-03F owns specific cultural choices.

---

# 25. Reproduction and Population

Creature populations should reuse shared lifecycle systems where practical.

Possible lifecycle categories include:

- egg-laying;
- larval/cocoon;
- live-bearing;
- spawning;
- spirit-active manifestation.

Exact reproduction mechanics need not be simulated for every species unless visible to gameplay.

Distant ecology may use aggregate population state instead of individual actors.

Gameplay-relevant outcomes such as local extinction, overpopulation, managed herd size, pollinator collapse or Echo Ray population decline must remain authoritative if exposed.

---

# 26. AI and Behaviour Architecture

Creature behaviour should be composed from shared modules such as:

- locomotion;
- forage;
- flee;
- patrol;
- guard;
- herd;
- school;
- pollinate;
- scavenge;
- migrate;
- rest;
- investigate;
- defend;
- follow route;
- react to memory/identity state;
- react to hazards/corruption.

Species identity should come from parameterisation plus bounded specialist modules rather than twelve unrelated AI frameworks.

Examples:

- Procession Hound adds route-guardian logic.
- Namekeeper Crane adds recognised-name/route response.
- Remnant Eater adds bounded identity-disruption attacks.
- Mist Strider adds mist-state investigation.
- Memoryback adds route-following/herd/cargo hooks.

---

# 27. Variant Architecture

A creature family may support variants based on:

- biome;
- age;
- sex where useful;
- domesticated/wild state;
- health;
- diet/ecology;
- culture/ownership;
- event;
- memory/environment state;
- Necropolis exposure;
- corruption.

Variants reuse one creature definition whenever anatomy and core gameplay remain fundamentally the same.

Examples:

- Hearthland and Processional Memorybacks remain one species;
- stable and unstable Lantern Wisps remain states;
- Memory Koi pattern changes are states, not dozens of species;
- corrupted Procession Hounds remain variants unless transformation destroys the original creature identity.

---

# 28. Natural Disease, Injury and Ecological Stress

Creatures may suffer:

- injury;
- hunger where biological;
- disease;
- parasite load;
- habitat loss;
- population pressure;
- water-quality problems;
- food shortage;
- orchard collapse;
- route instability;
- mist stress.

These are natural/ecological states.

They are not automatically Void corruption.

---

# 29. Void Corruption

Void corruption is external to normal Ancestral ecology.

Default handling is a runtime/state variant that may alter:

- aggression;
- movement;
- anatomy presentation;
- abilities;
- hazard output;
- loot contamination;
- habitat tolerance.

A distinct corrupted creature definition is justified only where irreversible transformation produces fundamentally different anatomy, behaviour, lifecycle, ecological role, combat model, material outputs or save identity.

No automatic `Corrupted X` registry is generated for all twelve species.

---

# 30. Native Threats vs Void Threats

The following are native Veil phenomena and remain distinct from Void corruption:

- Remnant Eater predation;
- Procession Hound territorial/route aggression;
- Mourning Eel overabundance;
- Predator Dark identity instability;
- natural disease;
- hunger;
- scavenging;
- defensive animal behaviour;
- Mourning Mist stress.

Void corruption must retain a recognisably separate presentation/mechanical signature.

---

# 31. Death and Respawn Boundary

Creature death inside the Ancestral Veil uses universal creature/death/drop systems.

FCC-03E does not create an automated soul record when a creature dies.

A dead creature does not automatically:

- respawn as a Veil spirit;
- generate an ancestor;
- become a Lantern Wisp;
- create a Memory Moth;
- enter a realm database;
- produce a Soul item.

Specifically authored supernatural transformations may exist in dungeons/events, but they are exceptions owned by those definitions.

---

# 32. Combat and Non-Combat Outcomes

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
- tame/manage where supported;
- harvest renewable output;
- hunt;
- defend against;
- cleanse corruption;
- restore habitat.

Universal combat owns damage. FCC-03E owns ecological meaning.

---

# 33. Loot Philosophy

There is no generic “Ancestral creature loot table” producing unrelated fantasy items.

Creature rewards must come from:

- actual anatomy;
- legitimate biological production;
- carried/attached objects if justified;
- separately defined contamination/corruption residues;
- encounter/context rewards;
- ecological outcomes.

A creature cannot drop Memory Glass, Soul Silver or Grave Salt merely because those are Ancestral materials unless it actually incorporates or carries them for a defined reason.

---

# 34. Creature–Material Interfaces

FCC-03E consumes material identities from FCC-03C.

Important interfaces include:

- **Memory Moth → Veil Silk**
- **Echo Ray → Echo Pearl**
- **Soul Silver → specialist interaction with incorporeal/spirit-active creatures**
- **Grave Salt → ward/stability interactions**
- **Memory Glass → perception/recording interfaces**
- **Veil Soil / Spirit Clay → decomposer and habitat ecology**

Creature AI may react to these materials without owning their crafting definitions.

---

# 35. Creature–Flora Interfaces

FCC-03E consumes botanical ecology from FCC-03D.

Important interfaces include:

- Memory Moth ↔ flowering plants and sheltered cocoon sites.
- Ossuary Grazer ↔ Ossuary Tree and orchard ground flora.
- Grave Beetle ↔ dead botanical matter and fungal ecology.
- Memory Koi ↔ aquatic plants/algae.
- Memoryback ↔ suitable grasses, reeds and forage.
- Mist Strider ↔ Mourning Mist wetlands.

Creature ecology should reinforce plant ecology rather than function as disconnected spawn tables.

---

# 36. Creature–Biome Interfaces

FCC-03B owns biome environmental truth.

Creature systems consume:

- route stability;
- memory state;
- identity state;
- mist severity;
- water condition;
- orchard health;
- Predator Dark exposure;
- Necropolis overlays;
- Void corruption.

Examples:

- Remnant Eater density may rise in weak-anchor regions.
- Lantern Wisp behaviour may indicate route stability.
- Echo Ray migration may respond to Memory Sea state.
- Mist Strider movement may respond to mist disturbance.
- Ossuary Grazer populations may respond to orchard health.

These are bounded simulation hooks, not free-form metaphysical AI.

---

# 37. Creature–Civilisation Interfaces

FCC-03F may consume creature content for:

- husbandry;
- route guardianship;
- aquaculture;
- silk cultivation;
- protected wildlife;
- food;
- transport;
- ritual symbolism;
- trade;
- hunting restrictions;
- conservation;
- pest management.

FCC-03F may not redefine core biology simply to suit a culture.

Cultural variants should normally use equipment, markings, ownership, training, diet, habitat or selective-breeding state rather than duplicate species IDs.

---

# 38. Creature–Dungeon Interfaces

FCC-03H may use the twelve creature families as:

- ambient dungeon fauna;
- encounter complications;
- ecological guardians;
- corrupted variants;
- navigation aids;
- non-hostile objectives.

Dungeon guardian families remain separate definitions.

A dungeon-specific elite Remnant Eater may remain a variant unless it becomes a uniquely named boss/authority with its own stable identity.

---

# 39. Accessibility and Identity-Disruption Safety

Creature mechanics that interfere with names, labels, sound, visibility or navigation require accessibility-safe alternatives.

For Remnant Eater effects:

- permanent data deletion is prohibited;
- disruption must be recoverable;
- critical quest/access information must have fallback representation;
- high-contrast/non-colour indicators must remain available;
- reduced-distortion settings may reduce presentation scrambling without changing authoritative hazard state.

For Lantern Wisps and Mist Striders as environmental indicators:

- critical safety information may not rely solely on colour, subtle glow or audio.

---

# 40. Performance and Simulation Scaling

Creature canon remains identical across performance profiles.

Lower-end modes may reduce:

- active creature density;
- distant individual AI;
- animation complexity;
- flock/herd member count;
- water-creature visual count;
- particle/spirit effects;
- update frequency;
- off-screen individual simulation.

Distant populations may be represented by aggregate ecological records.

Scaling may not change authoritative:

- species presence;
- gameplay-relevant population outcomes;
- resource conservation;
- domesticated ownership;
- breeding/harvest commitments;
- corruption state;
- ecological restoration;
- protected/endangered status where used.

No performance profile may secretly generate extra Veil Silk or Echo Pearls.

---

# 41. Art and Animation Handoff

Later art governance must preserve distinct silhouettes and ecological readability.

- **Namekeeper Crane:** tall-legged bird; name/route cues without becoming a transparent humanoid ghost.
- **Memory Moth:** moth/weaver silhouette; cocoon/silk relationship; pollinator rather than combat-dragon language.
- **Procession Hound:** canine guardian silhouette; route/ward cues; not skeletal by default.
- **Mourning Eel:** long aquatic scavenger; native fauna, not soul-serpent.
- **Remnant Eater:** unsettling identity predator; distortion cues distinct from Void corruption.
- **Ossuary Grazer:** pale browser; orchard-compatible silhouette; not literally a moving skeleton.
- **Echo Ray:** large ray/whale-like aquatic silhouette; peaceful scale; Echo Pearl biology cues.
- **Grave Beetle:** compact decomposer; readable shell/chitin anatomy.
- **Lantern Wisp:** small luminous native entity; not a miniature human soul.
- **Memory Koi:** fish silhouette with state-responsive patterning.
- **Mist Strider:** long-limbed walker; mist-adapted neutral posture.
- **Memoryback:** broad stable pack/herd silhouette with cargo/harness compatibility.

Exact palettes, texture families and final animation language remain deferred.

---

# 42. Working Final Creature Registry

| # | Stable / Working ID | Display Name | Core Role | Major Resource Hook |
|---:|---|---|---|---|
| 1 | `creature.realm.ancestral.namekeeper_crane` | **Namekeeper Crane** | route/name guide | none locked |
| 2 | `creature.realm.ancestral.memory_moth` | **Memory Moth** | pollinator/weaver | **Veil Silk** |
| 3 | `creature.realm.ancestral.procession_hound` | **Procession Hound** | route guardian | none locked |
| 4 | `creature.realm.ancestral.mourning_eel` | **Mourning Eel** | aquatic scavenger | food interface optional |
| 5 | `creature.realm.ancestral.remnant_eater` | **Remnant Eater** | identity predator | none locked |
| 6 | `creature.realm.ancestral.ossuary_grazer` | **Ossuary Grazer** | orchard browser | none locked |
| 7 | `creature.realm.ancestral.echo_ray` | **Echo Ray** | large echo feeder | **Echo Pearl** |
| 8 | `creature.realm.ancestral.grave_beetle` | **Grave Beetle** | decomposer | none locked |
| 9 | `creature.realm.ancestral.lantern_wisp` | **Lantern Wisp** | navigation/stability indicator | none; not fuel |
| 10 | `creature.realm.ancestral.memory_koi` | **Memory Koi** | aquatic indicator/fauna | food interface optional |
| 11 | `creature.realm.ancestral.mist_strider` | **Mist Strider** | mistland neutral indicator | none locked |
| 12 | `creature.realm.ancestral.memoryback` | **Memoryback** | pack/herd transport fauna | none locked |

---

# 43. Source Reconciliation Register

| Earlier Direction | FCC-03E Resolution |
|---|---|
| Set 24 contains five Ancestral creature foundations | Preserved as first five of final twelve |
| Five Atlas creatures are not final ecological ceiling | Expanded to twelve through FCC-approved roster |
| Namekeeper Crane repeats “true names” | Bounded to recognised/registered/remembered names; no secret-name oracle |
| Memory Moth as ambient memory pollinator | Retained and merged with later Veil Weaver role |
| Procession Hound guards funeral roads | Reframed as Processional Road/route guardian under final no-afterlife-simulation rule |
| Mourning Eel consumes grief residue | Retained as environmental residue/echo ecology; not souls |
| Remnant Eater consumes unanchored memories | Retained as bounded identity predator; cannot delete authoritative save data |
| Veil Silk requires creature death | Rejected; cocoons/shedding/managed production supported |
| Echo Pearl source | Locked to Memory Sea biomineral ecology with Echo Ray as principal source |
| Spirit creatures are generic resources | Rejected |
| Generic Soul/Ancestral Essence drops | Rejected |
| Every creature needs a unique material drop | Rejected |
| Natural hostility/disease equals Void corruption | Rejected |
| Every corrupted animal becomes separate creature | Rejected |
| Dead creatures automatically become Veil spirits | Rejected |
| Archive Mite added to Veil fauna | Rejected; remains construct-catalogue content |
| Remnant Eater and Memory Eater are same entity | Rejected; species and authority are explicitly separate |

---

# 44. Cross-Document Interfaces

## FCC-03A
Supplies no-afterlife-simulation boundary, identity/memory laws, personhood ownership and universal death/respawn exclusions.

## FCC-03B
Supplies eight biomes, environmental states, hazards and route/mist/Memory Sea/Predator Dark state.

## FCC-03C
Supplies Veil Silk, Echo Pearl, Soul Silver, Grave Salt, Memory Glass and resource provenance rules.

## FCC-03D
Supplies Ossuary Tree, six core plants, food-resource foundations, fungal ecology and orchard health.

## FCC-03F
Consumes husbandry, aquaculture, transport animals, protected species and cultural wildlife relationships.

## FCC-03G
Consumes exact creature-derived items if justified, food interfaces, husbandry equipment and processing recipes.

## FCC-03H
Consumes creature variants, dungeon fauna and encounter ecology.

## FCC-03I
Owns corruption/restoration cross-system interactions and irreversible transformed-creature admission.

## FCC-03J
Certifies the twelve-creature roster, stable-ID preservation, no generic soul economy, no duplicate species/authority identity, resource provenance and art-handoff completeness.

---

# 45. FCC-03E Acceptance Gate

FCC-03E is ready for realm-local acceptance only when:

- the final roster contains exactly **twelve principal named creature families**;
- all five original Atlas names and stable IDs are preserved;
- seven FCC-expanded families are added with working IDs;
- Namekeeper Crane uses bounded recognised-name mechanics rather than unlimited secret-name detection;
- Memory Moth and Veil Weaver are reconciled into one species;
- Memory Moth is the canonical ecological source of Veil Silk;
- Procession Hound is a route guardian rather than universal death/funeral infrastructure;
- Mourning Eel consumes environmental grief/echo residue, not souls;
- Remnant Eater disruption is temporary, bounded and save-safe;
- Remnant Eater is explicitly separate from the Memory Eater authority;
- Ossuary Grazer supports orchard ecology;
- Echo Ray is the principal Echo Pearl source and supports non-lethal acquisition;
- Grave Beetle provides decomposition/soil ecology;
- Lantern Wisp is native fauna/entity and not a dead soul or fuel;
- Memory Koi uses bounded environmental-pattern behaviour rather than full memory storage;
- Mist Strider is neutral-native wildlife by default;
- Memoryback provides a transport/pack-animal ecological role without premature exact taming mechanics;
- the food web includes producers, grazers, decomposers, aquatic feeders, predators and indicator fauna;
- only canon-supported creature materials are locked;
- no generic Soul, Ancestral Essence, Memory Fragment or Spirit Essence drops exist;
- creature personhood remains separate from resource classification;
- natural injury/disease/hostility remain distinct from Void corruption;
- corruption uses variants unless irreversible transformation warrants a separate definition;
- creature death does not automatically create Veil spirits or afterlife records;
- creature AI can be implemented through shared bounded modules;
- low-end scaling preserves authoritative ecological/resource truth;
- creature art-handoff distinctions are explicit.

**FCC-03E Status:** **REALM-LOCAL LOCK CANDIDATE — pending owner review.**

Upon owner approval, change status to:

> **LOCKED FOR REALM-LOCAL FCC USE — pending final cross-realm reconciliation.**
