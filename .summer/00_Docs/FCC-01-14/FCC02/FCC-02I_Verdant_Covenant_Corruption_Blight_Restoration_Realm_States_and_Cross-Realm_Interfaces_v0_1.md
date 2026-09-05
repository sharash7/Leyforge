# Leyforge Final Content Canon Collection

## FCC-02I - Verdant Covenant Corruption, Blight, Restoration, Realm States & Cross-Realm Interfaces

**Version:** 0.1  
**Status:** Content Canon - Realm Local Lock  
**Realm:** Verdant Covenant  
**Parent Collection:** Leyforge Final Content Canon (FCC)  
**Depends On:** FCC-02A, FCC-02B, FCC-02C, FCC-02D, FCC-02E, FCC-02F, FCC-02G, FCC-02H  
**Primary Upstream Sources Reconciled:** Foundation Documents 00-20; World Content Atlas Set 24; Post-Atlas Governance Set 25; later FCC interview decisions; FCC-02A through FCC-02H  
**Final Global Status:** Pending FCC-01 Overworld canon, all remaining realm FCC sets, FCC-12 material reconciliation, FCC-13 definitive registries and FCC-14 certification.

---

# 1. Purpose

FCC-02I defines the authoritative realm-local state architecture for the Verdant Covenant.

It owns the Verdant Covenant definitions for:

- natural rot and decomposition;
- ecological and magical blight;
- genuine Void corruption as a consumed cross-realm contamination interface;
- restoration, containment, cleansing and recovery;
- persistent state overlays affecting Verdant content;
- state transitions for terrain, flora, creatures, materials, structures, settlements, dungeons and authorities;
- irreversible-transformation thresholds;
- state inheritance;
- state propagation;
- realm-event state effects;
- cross-realm resonance boundaries;
- cross-realm material and progression interfaces;
- Covenant Portal interactions with realm state;
- deterministic/off-screen state simulation;
- low-end world-simulation fallbacks;
- validation requirements;
- art-handoff requirements for state readability.

FCC-02I does **not** redefine:

- the origin, full ecology or endgame progression of the Void Between;
- universal status-effect code;
- universal disease code;
- universal combat;
- universal material registries;
- universal world-event runtime;
- universal weather simulation;
- universal portal runtime;
- universal faction/reputation mathematics;
- universal NPC AI;
- universal settlement simulation;
- universal save/load;
- universal multiplayer replication;
- universal accessibility settings;
- universal visual material profiles.

The governing rule is:

> **FCC-02I defines what Verdant states mean and how Verdant content responds to them; shared Leyforge systems execute those states.**

---

# 2. Canon Statement

The Verdant Covenant is a living realm.

Living systems naturally include:

- growth;
- age;
- shedding;
- decay;
- decomposition;
- predation;
- competition;
- disease;
- disturbance;
- recovery;
- succession.

Therefore:

> **Decay is not corruption.**

A forest floor rich in decomposing wood may be healthy.

A Rotwild ecosystem may be functioning correctly.

A Rotcap Colony may be beneficial.

A Rotgrazer may be performing an important ecological role.

A dying plant does not imply supernatural evil.

The Verdant Covenant also supports **blight**: a damaged or dysfunctional ecological/magical state that may require intervention.

And separately it may suffer **Void corruption**: contamination originating from the Void Between that rewrites or destabilises reality.

These three categories must remain mechanically, narratively and visually distinguishable:

1. **Natural Rot / Decay**
2. **Ecological or Magical Blight**
3. **Void Corruption**

Restoration is likewise not one universal "purify" action.

Valid responses may include:

- do nothing;
- permit decomposition;
- prune;
- replant;
- rebalance;
- quarantine;
- contain;
- relocate;
- repair;
- restore;
- cleanse;
- stabilise;
- seal;
- destroy irreversibly transformed matter where necessary.

The canon principle is:

> **A healthy Verdant Covenant is not a realm without death, rot or disturbance; it is a realm in which living processes remain capable of meaningful balance and recovery.**

---

# 3. State Ownership Model

FCC-02I uses state layers rather than proliferating duplicate definitions.

A canonical entity normally consists of:

`BaseDefinition + StateData`

Examples:

- `Greatheart Wood + rot_state`
- `Oathstag + seasonal_state`
- `Memory Seed + encoded_state`
- `Living Palace Roots + court_state`
- `Rotheart Keeper + blight_state`
- `Verdant Living Soil + corruption_state`

A separate canonical definition is created only when transformation becomes sufficiently irreversible and mechanically distinct.

This protects the registry from entries such as:

- Spring Oathstag;
- Summer Oathstag;
- Autumn Oathstag;
- Winter Oathstag;
- Blighted Oathstag;
- Corrupted Oathstag;
- Wet Oathstag;

unless one of those forms becomes a genuinely different creature by the global transformation threshold.

---

# 4. Realm-State Stack

A Verdant world region, entity or structure may consume a bounded subset of the following state domains.

## 4.1 Environmental State

Examples:

- season;
- temperature band;
- humidity;
- water level;
- pollen intensity;
- growth pressure;
- root activity;
- flood state;
- seasonal convergence;
- rot abundance.

## 4.2 Ecological Health State

Canonical top-level states:

- `THRIVING`;
- `STABLE`;
- `STRESSED`;
- `DAMAGED`;
- `COLLAPSED`;
- `RECOVERING`.

## 4.3 Natural Rot State

Canonical top-level states:

- `NONE`;
- `TRACE`;
- `BALANCED`;
- `ABUNDANT`;
- `DOMINANT`.

These describe decomposition pressure, not morality.

## 4.4 Blight State

Canonical top-level states:

- `NONE`;
- `LOCAL`;
- `SPREADING`;
- `SEVERE`;
- `CONTAINED`;
- `RECOVERING`.

## 4.5 Void Corruption State

Realm-local candidate states:

- `NONE`;
- `TRACE`;
- `ACTIVE`;
- `SEVERE`;
- `IRREVERSIBLE`.

Final global enum naming remains subject to Void/FCC-13 reconciliation.

## 4.6 Restoration State

Canonical realm-local categories:

- `UNTREATED`;
- `ASSESSED`;
- `STABILISING`;
- `RESTORING`;
- `RESTORED`;
- `REPURPOSED`;
- `CONTAINED`;
- `FAILED`.

## 4.7 Covenant / Political State

Consumed from FCC-02A/FCC-02F:

- recognised identity;
- Court relation;
- hospitality state;
- Covenant state;
- territorial state;
- settlement control.

## 4.8 Content-Specific State

Additional systems may add bounded content-local state such as:

- guardian stance;
- dungeon completion;
- crop maturity;
- Memory Seed encoding;
- Season Sap charge;
- Bloomstone deposit health;
- portal stability.

State domains must not be added casually when an existing state already carries the required meaning.

---

# 5. State Precedence

When multiple states coexist, they do not erase each other.

Example:

A Greatheart stand may be:

- Autumn;
- ecologically stressed;
- naturally rot-rich;
- locally blighted;
- trace Void-corrupted;
- under restoration.

The engine should not compress all of that into one generic `BAD_FOREST` flag.

However, systems must use bounded precedence rules.

## 5.1 Recommended Evaluation Order

For most realm-local evaluation:

1. base definition;
2. irreversible transformation identity;
3. severe reality-level contamination;
4. blight;
5. ecological health;
6. natural rot/decomposition;
7. seasonal/environmental state;
8. local cosmetic/age/damage state.

This order is a logical evaluation priority, not necessarily rendering order.

## 5.2 Void Does Not Erase Provenance

A corrupted Greatheart remains traceable to Greatheart provenance unless an irreversible transformation creates a new definition.

A corrupted Bloomstone deposit remains recognisable as Bloomstone-derived matter unless transformed beyond the global threshold.

---

# 6. Natural Rot and Decomposition

## 6.1 Definition

Natural rot is biological decomposition.

It may involve:

- fungi;
- bacteria-like world abstractions;
- insects/creatures;
- Rotcap Colony;
- Rotgrazer;
- moisture;
- fallen wood;
- leaf litter;
- dead roots;
- nutrient release.

Natural rot exists in every appropriate Verdant biome.

It is especially prominent in Rotwilds.

## 6.2 Healthy Roles

Natural rot may:

- return nutrients to soil;
- create habitat;
- feed decomposers;
- prepare seed beds;
- break down fallen structures;
- support fungi;
- improve fertility;
- release bound resources;
- maintain Rotwild ecology.

## 6.3 Natural Rot Hazards

Even healthy rot can create hazards:

- unstable ground;
- falling deadwood;
- toxic or irritating spores from specific fungi;
- oxygen-poor bog pockets where supported;
- collapsed root tunnels;
- aggressive scavengers.

A hazard is not evidence of supernatural corruption.

## 6.4 Rotwood

**Rotwood** remains a condition/state of compatible wood.

Compatible wood may include:

- Greatheart Wood;
- Dawnwood;
- Bloomwood;
- selected other wood after global reconciliation.

Rotwood state may alter:

- strength;
- moisture;
- mass;
- appearance;
- fuel value;
- fungal compatibility;
- salvage output.

It does not become a new tree species.

---

# 7. Ecological and Magical Blight

## 7.1 Definition

Blight is dysfunctional ecological or magical degradation that exceeds healthy disturbance.

Possible causes include:

- overharvest;
- habitat fragmentation;
- failed living infrastructure;
- invasive organisms;
- disease;
- damaged water routes;
- Court conflict;
- seasonal imbalance;
- mana disruption;
- failed cultivation;
- careless extraction;
- polluted inputs;
- prolonged neglect;
- inappropriate imported species/materials.

Blight may be entirely local to the Verdant Covenant.

It does **not** require Void involvement.

## 7.2 Local Blight

Local blight may affect:

- one crop field;
- one Greatheart;
- one settlement structure;
- one waterway;
- one Bloomstone deposit;
- one dungeon room.

Local blight should not automatically become a realm event.

## 7.3 Spreading Blight

Spreading blight may move through compatible connections such as:

- root networks;
- water routes;
- crop fields;
- living architecture;
- shared soil;
- creature movement;
- infrastructure.

Spread must use bounded deterministic rules.

## 7.4 Severe Blight

Severe blight may:

- collapse local productivity;
- kill plants;
- alter creature behaviour;
- shut living structures;
- contaminate materials;
- force evacuation;
- create Rot-Heart Grove conditions;
- cause Court/political responses.

## 7.5 Contained Blight

Containment may include:

- quarantine;
- physical barriers;
- controlled burn/pruning where culturally and mechanically appropriate;
- water isolation;
- seasonal suppression;
- removal of infected inputs;
- specialist living barriers;
- Bloomstone stabilisation;
- Wardthorn use;
- Verdant Anti-Blight Treatment.

## 7.6 Recovering Blight

Recovery is a state with its own gameplay.

A recovering site may require:

- replanting;
- decomposer return;
- pollinator return;
- infrastructure repair;
- soil rebuilding;
- water restoration;
- creature relocation;
- Court stewardship;
- time.

Recovery should not visually snap immediately from ruined to pristine.

---

# 8. Magical Imbalance Without Void Corruption

Not every supernatural problem is Void corruption.

Verdant magical imbalance may include:

- stuck seasonal state;
- uncontrolled growth;
- failed Covenant-linked architecture;
- malformed Memory Seed growth;
- unstable Bloomstone;
- Season Sap overload;
- damaged Resonance Law effects;
- local glamour failure;
- Living River route dysfunction.

These problems use:

- repair;
- retuning;
- rebalancing;
- ritual;
- ecological intervention;
- Court resolution

as appropriate.

They must not automatically use Void cleansing mechanics.

---

# 9. Void Corruption

## 9.1 Definition

Void corruption is contamination that ultimately originates from the Void Between.

Within Verdant Covenant, it may appear as:

- matter rewriting;
- impossible growth;
- broken spatial relationships;
- identity erosion;
- ecological rules behaving impossibly;
- corrupted living architecture;
- anatomy changing beyond biological plausibility;
- material states losing expected properties;
- local reality scars.

## 9.2 Origin Boundary

FCC-02I does not define:

- why the Void is corrupted;
- the older source behind that corruption;
- final Void bosses;
- Void ecology;
- Void travel.

Those belong to FCC-10 and final global reconciliation.

FCC-02I only defines how Verdant content **receives and reacts to** the corruption interface.

## 9.3 Entry Vectors

Possible Verdant corruption vectors may include:

- realm breach;
- damaged portal infrastructure;
- Void Scar;
- imported corrupted material;
- corrupted entity arrival;
- failed dimensional experiment;
- severe authored event.

A normal Covenant Portal is not automatically a corruption source.

## 9.4 Trace Corruption

Trace corruption may:

- create subtle material anomalies;
- alter growth patterns;
- affect sensitive Spirit Moss;
- produce unusual creature behaviour;
- generate detectable Void signatures.

Trace corruption is normally reversible.

## 9.5 Active Corruption

Active corruption may:

- spread locally;
- alter structures;
- create hostile environmental states;
- contaminate resources;
- affect creatures;
- interfere with Covenant-linked living systems.

## 9.6 Severe Corruption

Severe corruption may:

- rewrite anatomy;
- break routes;
- alter topology;
- create persistent scars;
- transform materials;
- disable normal restoration;
- require containment before cleansing.

## 9.7 Irreversible Corruption

Irreversible corruption is the threshold at which the original definition may no longer be sufficient.

A separate canonical definition may be justified only if:

- physical composition is permanently changed;
- behaviour or processing is materially different;
- restoration cannot return the original identity;
- the new form has meaningful gameplay use;
- the new form is needed across content rather than for one scripted prop;
- art identity is genuinely distinct.

---

# 10. Irreversible Transformation Threshold

The universal FCC process must distinguish:

**state variation** from **new definition**.

## 10.1 Remains a State

Examples:

- slightly corrupted Greatheart Wood;
- blighted Bloomwood leaves;
- contaminated Pollen Amber;
- Void-marked Thornshell;
- corrupted Rootstone surface;
- blighted Living Reed.

These remain their original definition plus state.

## 10.2 Candidate New Definition

Examples may include:

- **Corrupted Heartwood** where Living Heartwood has been permanently rewritten;
- permanently transmuted Bloomstone if later reconciliation proves the product has unique chemistry/gameplay;
- a creature whose anatomy and behaviour are irreversibly replaced.

## 10.3 No Automatic Counterpart Rule

There is no requirement for:

- Corrupted Rootstone;
- Corrupted Dawnwood;
- Corrupted Bloomwood;
- Corrupted River Pearl;
- Corrupted Every Creature.

New definitions are admitted only by need.

---

# 11. Living Heartwood Corruption

## 11.1 Minor Contamination

Minor or early contamination is:

`Living Heartwood + corruption_state`

It may cause:

- reduced living response;
- unstable regrowth;
- hostile growth;
- portal-component instability;
- colour/pattern changes;
- restoration requirements.

## 11.2 Irreversible Transformation

The currently accepted named candidate is:

# **Corrupted Heartwood**

Corrupted Heartwood exists only after irreversible transformation.

It is not the same as:

- dead Greatheart Wood;
- Rotwood;
- blighted Living Heartwood;
- burned Living Heartwood.

## 11.3 Uses

Any eventual uses must be:

- dangerous;
- provenance-aware;
- validated through FCC-12/FCC-13.

FCC-02I does not require a full corrupted crafting tree.

---

# 12. Bloomstone State Model

Bloomstone may be:

- healthy;
- dormant;
- overharvested;
- damaged;
- blighted;
- recovering;
- Void-contaminated;
- irreversibly transformed.

## 12.1 Deposit Health

Deposit health depends on:

- root-system health;
- extraction method;
- local ecology;
- time;
- magical stability.

## 12.2 Destructive Mining

Destructive extraction may:

- reduce regeneration;
- terminate regeneration;
- damage roots;
- create ecological stress;
- increase local blight risk.

## 12.3 Corruption

Void corruption may interfere with:

- stabilisation;
- growth geometry;
- resonance;
- route-support functions.

A distinct corrupted Bloomstone material is not canonically required at FCC-02I.

---

# 13. Season Sap State Model

Season Sap is one canonical material with state.

Possible dimensions include:

- season;
- source biome;
- purity;
- stability;
- resonance.

Void contamination is an additional state.

A sample may therefore be:

- Autumn-aligned;
- Moonroot-sourced;
- stable;
- trace-corrupted.

This does not create four seasonal Sap items by default.

## 13.1 Mixed Season Sap

Rare mixed/convergence states may occur in:

- Seasonal Nexus;
- Seasonal Vaults;
- specialised processing.

They remain Season Sap.

---

# 14. Thornsilver State Model

Thornsilver Fibre may be:

- raw;
- cleaned;
- spun;
- woven;
- hardened;
- living/flexible;
- damaged;
- blighted;
- contaminated.

Its hardening state is a controlled processing result, not a separate metal family.

Severe Void corruption may break its living flexibility or rewrite its material properties.

No automatic Corrupted Thornsilver definition is required.

---

# 15. Pollen Amber State Model

Pollen Amber retains one canonical material identity while allowing controlled tint/state from:

- botanical source;
- season;
- age;
- clarity;
- pollen composition.

Blight may reduce clarity or stability.

Void corruption may distort optical/magical behaviour.

Colour variation must remain within future art-governance rules.

---

# 16. Memory Seed State Model

Memory Seed may carry:

- unencoded/encoded state;
- content type;
- consent/provenance record where required;
- viability;
- growth stage;
- damage;
- blight;
- corruption.

## 16.1 Corruption Risk

Void corruption of a Memory Seed is particularly significant because it may:

- distort stored pattern;
- produce malformed growth;
- misapply stored structure;
- damage identity-bearing information.

The game must not silently treat corrupted stored memories as trustworthy.

## 16.2 Restoration

Possible responses:

- validate against trusted record;
- cleanse before germination;
- quarantine;
- destroy unsafe seed;
- recover unaffected information.

---

# 17. Rootstone and Terrain State

Rootstone is the ordinary native Verdant stone.

It may receive:

- moss coverage;
- root coverage;
- moisture;
- age;
- damage;
- blight staining;
- trace corruption.

These are usually surface/environment states.

A new geological definition requires true material transformation.

---

# 18. Verdant Living Soil State

Verdant Living Soil may be:

- fertile;
- dry;
- waterlogged;
- pollen-rich;
- rot-rich;
- depleted;
- blighted;
- recovering;
- corrupted.

## 18.1 Fertility

Fertility should be driven by bounded gameplay variables.

It should not require high-resolution microbiome simulation.

## 18.2 Soil Recovery

Recovery may use:

- compost/decomposition;
- Riverleaf;
- decomposer species;
- crop rotation abstractions;
- water restoration;
- anti-blight treatment;
- time.

---

# 19. Flora State Architecture

Every gameplay-bearing Verdant plant may consume:

- growth stage;
- season response;
- ecological health;
- harvest state;
- blight;
- corruption;
- cultivated/wild state where relevant.

Not every plant needs every state.

## 19.1 Tree States

Greatheart, Dawnwood and Bloomwood may support:

- sapling;
- juvenile;
- mature;
- ancient;
- damaged;
- recovering;
- dead;
- rot-affected;
- blighted;
- corrupted.

Ancient Greatheart state influences Living Heartwood probability/volume.

## 19.2 Supporting Flora

Supporting flora should use simplified state sets appropriate to gameplay.

Example:

Thornsilver Vine may need:

- immature;
- mature;
- Weaver-symbiotic;
- harvest-ready;
- damaged;
- blighted.

It does not need a full tree-age system.

---

# 20. Creature State Architecture

The 12 canonical Verdant creatures may consume:

- age/size where useful;
- season;
- health;
- hunger/need where universal systems require;
- ecological role;
- tame/bonded state where permitted;
- Court/faction context where applicable;
- blight;
- corruption.

## 20.1 Corruption as State

Ordinary corruption remains:

`CreatureDefinition + CorruptionState`

## 20.2 Irreversible Creature Transformation

A new creature definition requires:

- altered anatomy;
- altered ecological role;
- altered behaviour;
- persistent gameplay need;
- inability to restore original identity.

## 20.3 Blighted Creature

A blighted creature is not necessarily hostile.

Possible effects:

- reduced fertility;
- migration;
- lethargy;
- aggression;
- sickness;
- changed diet;
- avoidance of habitat.

## 20.4 Natural Rot Species

Rotcap Colony and Rotgrazer must never receive automatic "corrupted" classification merely because they participate in decay.

---

# 21. Settlement State Architecture

Verdant settlements may consume:

- prosperity;
- needs state through universal systems;
- Court alignment;
- Pact standing;
- ecological health;
- infrastructure health;
- blight;
- corruption;
- restoration;
- seasonal pressure;
- migration pressure.

FCC-02I does not redefine universal settlement-need mathematics.

## 21.1 Settlement Blight

Blight may cause:

- crop loss;
- water disruption;
- structure illness;
- evacuation;
- trade disruption;
- quarantine;
- restoration projects.

## 21.2 Settlement Void Corruption

Void corruption may cause:

- reality instability;
- unsafe structures;
- corrupted living architecture;
- evacuation;
- containment zones.

A settlement should not become an instant generic "evil town."

---

# 22. Structure State Architecture

Verdant structures may support:

- healthy;
- maintained;
- neglected;
- damaged;
- overgrown;
- rot-affected;
- blighted;
- restoring;
- Void-corrupted;
- repurposed.

## 22.1 Living Structures

Living structures should update state at meaningful intervals or events.

They do not need continuous per-voxel biological simulation.

## 22.2 Conventional Structures

Conventional stone/wood structures use universal damage/age systems plus Verdant-specific overlays where relevant.

---

# 23. Dungeon State Integration

FCC-02H defines dungeon families.

FCC-02I defines how state layers affect them.

A dungeon may carry:

- ecological health;
- natural rot;
- blight;
- Void corruption;
- restoration;
- Court control;
- season.

## 23.1 State Does Not Change Family

A Void-corrupted Seasonal Vault is still a Seasonal Vault unless irreversible transformation creates a separately approved content family.

## 23.2 Restoration

A dungeon may become:

- restored;
- repurposed;
- settlement-controlled;
- Court-controlled;
- neutral;
- sealed.

State persists after adventure completion.

---

# 24. Authority State Integration

Realm authorities may be:

- stable;
- disputed;
- injured;
- blighted;
- corrupted;
- contained;
- restored;
- removed;
- replaced where succession applies.

## 24.1 Seasonal Regent

Seasonal Regent state may affect:

- realm seasonal stability;
- Court legitimacy;
- Seasonal Vault behaviour;
- migration.

## 24.2 Rot-Crowned Hart

The Hart's decay state must remain distinct from:

- blight;
- Void corruption.

## 24.3 Oathbreaker Thorn

Its Covenant damage is not automatically blight or corruption.

It may additionally become blighted or Void-corrupted, but those are separate overlays.

---

# 25. Hazard-State Integration

The 12 canonical hazard families from FCC-02B remain:

1. Aggressive Overgrowth;
2. Glamour / Perception Distortion;
3. Territorial Flora;
4. Seasonal Exposure;
5. Pollen Bloom;
6. Living River Shift / Flood;
7. Thorn Territory;
8. Natural Rot / Decay;
9. Ecological Blight;
10. Void Corruption;
11. Covenant / Oath Consequences;
12. Root Orientation / Navigation Hazard.

FCC-02I governs hazards 8-10 in detail and provides state hooks for the others.

---

# 26. Restoration Philosophy

Restoration means returning a system to a viable, meaningful state.

It does not always mean returning it to its historical state.

Examples:

- a former garden may become a new meadow;
- an abandoned palace may become a neutral archive;
- a damaged river route may be redirected rather than rebuilt identically;
- a Rotwild site may remain rot-rich but regain balance;
- a corrupted structure may be removed and replaced.

The rule is:

> **Restoration restores viability, continuity or chosen purpose; it is not mandatory historical reconstruction.**

---

# 27. Restoration Actions

Canonical Verdant restoration-action families include:

- assess;
- identify cause;
- isolate;
- remove harmful input;
- repair infrastructure;
- restore water;
- restore soil;
- replant;
- return pollinators;
- return decomposers;
- tune season;
- stabilise Bloomstone;
- repair living architecture;
- rewrite/repair Covenant where relevant;
- cleanse corruption;
- seal irrecoverable contamination;
- monitor recovery.

Specific recipes/tools are owned by FCC-02G/FCC-13.

---

# 28. Restoration Progress

Large restoration projects may use staged progress.

Example stages:

1. crisis;
2. assessment;
3. containment;
4. intervention;
5. stabilisation;
6. recolonisation;
7. recovery;
8. restored/repurposed.

Not every small blighted plant needs this full sequence.

---

# 29. Restoration Failure

Restoration may fail.

Possible causes:

- wrong diagnosis;
- inadequate resources;
- recontamination;
- Court conflict;
- ignored water issue;
- missing species;
- severe corruption;
- destroyed root network.

Failure should produce an understandable state change rather than random reset.

---

# 30. Cleansing

**Cleansing** is reserved primarily for removable contamination or magical dysfunction.

It may be relevant to:

- early Void corruption;
- contaminated materials;
- selected blight;
- magical residue.

Cleansing does not replace:

- ecological repair;
- replanting;
- water management;
- political resolution.

A cleansed but ecologically destroyed forest is still destroyed.

---

# 31. Containment

Containment is a valid long-term outcome.

A site may be permanently:

- quarantined;
- sealed;
- fenced;
- isolated by root barrier;
- stabilised;
- monitored.

Containment is appropriate when:

- cleansing is impossible;
- cleansing is too dangerous;
- the player lacks progression;
- the affected matter is valuable for research;
- destruction would cause greater harm.

---

# 32. Destruction

Destruction may be valid when:

- corruption is irreversible;
- a structure threatens settlements;
- an invasive blight cannot be contained;
- an authority outcome permits it;
- the player chooses force.

Destruction must preserve provenance and consequence.

Destroying a corrupted Greatheart does not magically restore the surrounding ecosystem.

---

# 33. Realm-Scale State

Verdant Covenant may expose coarse realm-level summary states.

Candidate summary values:

- seasonal stability;
- ecological health;
- Court stability;
- blight pressure;
- corruption pressure;
- restoration progress;
- major route stability.

These values are aggregate indices.

They must not replace local state.

A realm can be broadly healthy while one biome contains a severe crisis.

---

# 34. Biome-Level State

Each biome region may expose:

- current season;
- ecological health;
- blight pressure;
- corruption pressure;
- dominant hazard;
- restoration state;
- settlement pressure.

Biome states support:

- map readability;
- event selection;
- NPC planning;
- world simulation.

---

# 35. Local Cell / Chunk State

High-resolution state should exist only where needed.

Possible local state:

- active blight patch;
- corrupted material cluster;
- flood area;
- restored plot;
- damaged rootway.

Off-screen areas should aggregate these details.

---

# 36. State Propagation

Propagation must be deterministic and bounded.

## 36.1 Allowed Propagation Networks

Blight may propagate through:

- contiguous vegetation;
- water;
- living infrastructure;
- root networks;
- creature vectors;
- trade/import where authored.

Void corruption may propagate through:

- corrupted adjacency;
- unstable dimensional scar;
- corrupted entity/material;
- authored reality failure.

## 36.2 Propagation Rate

Rate should be expressed through world-simulation settings.

It should not require per-frame simulation.

## 36.3 Propagation Barriers

Possible barriers:

- healthy ecological buffer;
- Wardthorn;
- quarantine;
- water isolation;
- Bloomstone stabilisation;
- repaired infrastructure;
- sealed Void scar.

---

# 37. Off-Screen State Simulation

Off-screen state should use aggregate updates.

Example:

A blighted grove can store:

- severity;
- area;
- moisture;
- root connection;
- intervention;
- elapsed simulation time.

When loaded, detailed flora is reconstructed from the aggregate state.

Do not simulate every fungus and leaf while the player is across the world.

---

# 38. Simulation Profiles

World creation may choose simpler or more advanced simulation.

## 38.1 Low

- coarse regional state;
- slow scheduled propagation;
- no detailed off-screen creature vectors;
- simple restoration timers;
- fewer simultaneous events.

## 38.2 Standard

- biome and local-site propagation;
- settlement response;
- creature/ecology interfaces;
- normal event chains.

## 38.3 Advanced

May include:

- richer root-network propagation;
- migration effects;
- Court response differences;
- more detailed ecological recovery;
- more persistent altered sites.

All profiles preserve the same content canon.

---

# 39. State Update Triggers

State may update on:

- world tick interval;
- season transition;
- event resolution;
- player intervention;
- settlement intervention;
- authority outcome;
- dungeon outcome;
- portal event;
- significant construction/destruction;
- biome load/unload;
- coarse simulation checkpoint.

Avoid unnecessary continuous updates.

---

# 40. Determinism

Given the same:

- seed;
- starting world state;
- player/system actions;
- simulation profile;
- elapsed authoritative simulation time

realm-state outcomes should be reproducible within defined system tolerances.

Random variation must derive from seeded randomness.

---

# 41. World-Creation Settings Interface

FCC-02I requires the universal world-creation system to expose appropriate knobs such as:

- ecological simulation depth;
- blight propagation complexity;
- off-screen simulation frequency;
- dynamic settlement response;
- event density;
- corruption spread difficulty;
- restoration assistance.

Exact UI and option names are owned elsewhere.

Low-end computers must be able to reduce simulation complexity without removing the realm's identity.

---

# 42. Event-State Integration

The canonical Verdant event families may interact with realm state.

## 42.1 Seasonal Migration

May alter:

- creature density;
- settlement demand;
- pollen;
- trade.

## 42.2 Court Succession / Challenge

May alter:

- Court control;
- Seasonal Regent state;
- seasonal stability.

## 42.3 Covenant Dispute

May alter:

- territorial state;
- living structure access;
- diplomacy.

## 42.4 Hospitality Crisis

May alter:

- settlement relationships;
- Court access;
- sanctuary use.

## 42.5 Living River Diversion

May alter:

- water;
- flood;
- ecology;
- settlement infrastructure.

## 42.6 Great Bloom

May alter:

- pollen;
- pollinator density;
- food/resource abundance.

## 42.7 Blight Outbreak

Directly modifies blight state.

## 42.8 Restoration Campaign

Directly modifies recovery.

## 42.9 Thorn Hunt

May alter predator/prey pressure and Court state.

## 42.10 Pollinator Migration

May alter crop and Pollen Amber ecology.

## 42.11 Rootway Awakening

May alter infrastructure/route state.

## 42.12 Realm Breach / Void Incursion

Directly introduces or escalates Void corruption.

---

# 43. State Event Selection

Events should be selected from current world state.

Example:

A thriving healthy river region should not constantly generate severe blight crises without cause.

Selection may consider:

- current state;
- history;
- season;
- Court conflict;
- settlement pressure;
- imported risks;
- difficulty settings.

---

# 44. Player Actions and State

Player activity may create:

- improvement;
- neutral change;
- harm;
- recovery;
- political consequence.

Examples:

- careful Bloomstone extraction preserves regeneration;
- destructive extraction damages deposit/root state;
- overharvest stresses plant population;
- pollinator support improves agriculture;
- damaged river infrastructure causes local blight;
- importing corrupted material risks contamination.

Consequences should be communicated clearly enough for meaningful choice.

---

# 45. NPC and Settlement Response

NPCs and settlements may respond to state through universal systems.

Responses may include:

- quarantine;
- evacuation;
- trade restriction;
- restoration project;
- Court petition;
- hunt;
- migration;
- resource rationing;
- construction;
- research.

FCC-02I supplies state signals.

It does not define full AI planning.

---

# 46. Civilisation Interpretation

Different Verdant cultures may interpret the same event differently.

Examples:

- one Court may value aggressive pruning;
- another may prefer natural succession;
- Rotwild cultures may accept decay that Sunlit cultures find alarming;
- a restoration group may oppose a Court's destructive policy.

Culture changes decisions, not physical definitions.

Natural rot remains natural rot regardless of political opinion.

---

# 47. State and Economy

State may alter resource availability.

Examples:

- blighted crops reduce harvest;
- restored Bloomstone deposits recover;
- Great Bloom increases nectar;
- polluted river reduces fish;
- severe corruption closes trade route.

FCC-02I supplies availability modifiers.

The economy system owns prices.

---

# 48. State and Production

Processing systems may reject or alter contaminated inputs.

Examples:

- corrupted Season Sap may destabilise a recipe;
- blighted fibre may reduce product quality;
- contaminated Memory Seeds may require validation;
- damaged Living Heartwood may fail advanced living construction.

Exact recipe consequences belong to FCC-02G/FCC-13.

---

# 49. State and Forge Authoring

The Forge must support state-aware content authoring.

Creators should be able to define:

- allowed state overlays;
- state-dependent visuals;
- state-dependent behaviour;
- restoration transitions;
- propagation hooks;
- corruption compatibility.

The Forge must warn if content:

- treats natural rot as Void corruption;
- invents alternate portal access;
- references undefined state;
- creates duplicate definitions where an overlay should be used.

---

# 50. State and AI Assistance

Future bounded Forge AI may propose:

- state variants;
- restoration layouts;
- visual damage patterns;
- event consequences.

It may not autonomously redefine:

- corruption origin;
- realm laws;
- material identities;
- portal rules;
- canonical creature roster.

All proposals require validation against FCC canon.

---

# 51. Covenant Portal State

The canonical Verdant portal is the **Covenant Portal**.

Portal-specific state may include:

- assembled;
- validated;
- active;
- linked;
- damaged;
- dormant;
- unstable;
- upgraded.

## 51.1 Blight

Ordinary ecological blight does not automatically disable a portal unless it damages required living components.

## 51.2 Void Corruption

Void corruption near a portal may:

- destabilise it;
- prevent activation;
- force containment;
- require repair;
- trigger a realm-breach event.

## 51.3 Portal Ownership Boundary

FCC-02I defines Verdant state interaction.

Universal Realm Access owns:

- linking;
- travel;
- destination transfer;
- multiplayer transition;
- portal persistence.

---

# 52. One-Portal Rule

No state or cross-realm interaction may bypass the rule:

> **Verdant Covenant has one canonical normal portal type: the Covenant Portal.**

The following remain non-portal phenomena:

- Dreaming Root resonance;
- Moonroot spirit resonance;
- Court invitations;
- seasonal signs;
- Fae clues;
- ancient gates not functioning as separate access systems.

Such content may contribute:

- recipe knowledge;
- keys;
- permission;
- portal components;
- clues;
- activation context.

---

# 53. Ancestral Veil Interface

Verdant Covenant may have limited Ancestral Veil resonance in:

- Moonroot Groves;
- Memory Grove sites;
- selected spirit-sensitive flora;
- selected Moonroot Warden interactions.

Allowed effects include:

- spirit-like phenomena;
- memory resonance;
- entity interaction;
- special environmental cues.

Prohibited inference:

- dead Verdant creatures automatically migrate to Ancestral Veil;
- Verdant deaths are tracked by Ancestral Veil;
- Moonroot provides normal Ancestral access;
- FCC-02 defines Veil laws.

The Ancestral Veil remains its own realm with its own canonical portal.

---

# 54. Somnolent Expanse Interface

Verdant Covenant may have rare dream resonance in:

- Dreaming Root Depths;
- Dream-Root Resonance Sites;
- Dreamroot flora;
- Dreamburrower behaviour.

Allowed effects include:

- dream-like environmental behaviour;
- sleep/waking resonance;
- symbolic flora/fauna reactions;
- authored anomalies.

Prohibited:

- normal travel into Somnolent Expanse;
- ownership of Dream Network laws;
- alternate portal bypass.

The Somnolent Expanse will define its own portal and mechanics in FCC-04.

---

# 55. Void Between Interface

Verdant Covenant consumes the global Void corruption interface.

FCC-02I may define:

- Verdant response;
- local spread;
- local cleansing;
- local transformation;
- local containment.

It may not define:

- Void source;
- Void final progression;
- Void realm architecture;
- Void travel;
- Leviathan canon beyond consumed interfaces.

---

# 56. Ascendant Reach Interface

No mandatory Verdant-Ascendant content is canonically required at FCC-02I.

Future global reconciliation may establish:

- portal component dependencies;
- trade;
- imported materials;
- divine/seasonal interactions.

FCC-02 may consume such interfaces later without redefining Ascendant Reach.

---

# 57. Impossible Deep Interface

No mandatory Verdant-Impossible Deep state interface is required at this stage.

Possible future material/ecological interactions must be reconciled after FCC-06.

---

# 58. World-Engine Interface

World-Engine technology may eventually interact with:

- living infrastructure;
- ecological stabilisation;
- dimensional systems.

FCC-02I does not define that integration before FCC-07.

---

# 59. Ashen Lower Realms Interface

No mandatory state interface is locked yet.

Future trade, portal progression or imported-material relationships are deferred to FCC-08/global reconciliation.

---

# 60. Elemental Confluences Interface

Elemental conditions may eventually affect:

- weather;
- plants;
- materials;
- portal components.

FCC-02I does not assign those interfaces until FCC-09.

---

# 61. Pocket Realm Interface

Verdant realm imprints/modules may later be used by Pocket Realm construction.

Potential export concepts:

- seasonal ecology;
- living growth;
- Verdant climate;
- selected Covenant-compatible environmental modules.

FCC-11 owns Pocket Realm rules.

FCC-02I supplies only Verdant state semantics.

A Pocket Realm module does not become a second Verdant Covenant.

---

# 62. Overworld Interface

FCC-01 is intentionally authored after the realm content sets.

Verdant Covenant may later interface with the Overworld through:

- first-access Covenant Portal ingredients;
- crops grown outside Verdant;
- imported/exported materials;
- settlements;
- trade;
- restoration technology;
- portal progression.

FCC-02I must not invent final Overworld material IDs.

---

# 63. Cross-Realm Material Contamination

Imported materials may carry state.

Examples:

- corrupted material entering Verdant;
- Verdant blight-contaminated plant exported elsewhere.

The universal material/provenance systems should track:

- source;
- contamination;
- treatment;
- transformation.

A cross-realm transfer does not erase state automatically.

---

# 64. Cross-Realm Creature State

Imported creatures may be:

- healthy;
- stressed;
- incompatible;
- contaminated.

FCC-02I does not require unrestricted ecology simulation for every creature in every realm.

Compatibility may be simplified into suitability categories.

---

# 65. Cross-Realm Portal Components

Later-realm portals may require Verdant materials or progression.

Candidate Verdant contribution families may include:

- Living Heartwood;
- Bloomstone;
- Season Sap;
- Memory Seed-derived components;
- Covenant Portal knowledge.

Exact dependencies are deferred until the receiving realm and FCC-13 are complete.

---

# 66. Realm-State Save Contract

At minimum, Verdant state persistence must be capable of storing or reconstructing:

- realm summary state;
- biome-region state;
- major event state;
- major blight sites;
- major corruption sites;
- restoration projects;
- settlement state references;
- dungeon state references;
- authority state references;
- portal state;
- irreversible transformations.

Avoid storing unnecessary per-voxel state when deterministic reconstruction is possible.

---

# 67. State Compression

State may be stored hierarchically.

Example:

**Realm**
- broad ecological health;
- corruption pressure.

**Biome Region**
- blight severity;
- seasonal state.

**Active Site**
- detailed affected cells/entities.

When the player leaves:

- detailed state may aggregate;
- irreversible changes remain explicit;
- important player modifications persist.

---

# 68. Multiplayer Authority

The authoritative world/server owns:

- propagation;
- contamination;
- restoration progress;
- authority state;
- portal state;
- irreversible transformation decisions.

Clients render and predict only where universal networking allows.

No player should see contradictory canonical state for the same shared region.

---

# 69. Split-Screen

Split-screen uses the same shared world state.

Visual/state simplification may occur per viewport, but gameplay state remains authoritative.

---

# 70. Accessibility

State identity must not rely on colour alone.

## 70.1 Natural Rot

Potential cues:

- soft collapse;
- fungi;
- leaf litter;
- decomposition sound;
- earthy texture;
- decomposer activity.

## 70.2 Blight

Potential cues:

- structural stress;
- patchy dieback;
- malformed growth;
- water/soil indicators;
- sick creature behaviour;
- specific iconography.

## 70.3 Void Corruption

Potential cues:

- impossible geometry;
- reality tears;
- anomalous motion;
- distinct pattern language;
- audio distortion;
- corruption iconography.

Final art/audio execution belongs to later governance.

---

# 71. Art-Handoff Requirement: Three-State Separation

The future global and realm art documents must guarantee that the player can distinguish:

**Healthy/Natural Decay**
from
**Blight**
from
**Void Corruption**

even in:

- grayscale;
- reduced particles;
- low graphics settings;
- colour-vision accessibility modes.

This is a mandatory readability requirement.

---

# 72. Art-Handoff Requirement: Restoration

Restoration should also have visual progression.

Sites should communicate:

- recently treated;
- stabilising;
- recovering;
- restored/repurposed.

Restoration is not merely "remove purple texture."

---

# 73. Material Art-State Handoff

For every state-capable material, later art governance should identify:

- canonical base material;
- permitted natural variation;
- age;
- damage;
- wetness where relevant;
- rot;
- blight;
- corruption;
- irreversible transformed profile where approved.

Materials must inherit state on top of canonical material identity.

---

# 74. Creature Art-State Handoff

Each creature requires only the state variants it supports.

Potential categories:

- season;
- age;
- blight;
- corruption;
- damage.

No universal requirement exists to create every combination.

Variant explosion must be controlled through:

- shaders/material masks;
- procedural overlays;
- limited model changes;
- full new model only for irreversible transformation.

---

# 75. Structure Art-State Handoff

Living structures may need:

- healthy;
- dormant;
- damaged;
- rot-rich;
- blighted;
- restoring;
- corrupted.

Conventional structures may use:

- universal age/damage;
- Verdant overgrowth;
- local blight/corruption overlays.

---

# 76. Low-End Rendering

Low-end profiles may reduce:

- particles;
- animated growth;
- deformation;
- dynamic foliage;
- corruption distortion;
- environmental density.

They must preserve:

- state silhouette;
- iconography;
- material pattern;
- gameplay telegraphs.

---

# 77. State Validation Rules

A Verdant content definition fails validation if it:

- labels natural decomposition as Void corruption by default;
- defines blight as necessarily Void-derived;
- creates a corrupted duplicate for every entity;
- allows cleansing to repair unrelated ecological destruction automatically;
- introduces alternate realm access;
- uses Ancestral Veil as universal death destination;
- uses Dreaming Root as normal Somnolent travel;
- creates unbounded off-screen propagation;
- loses provenance during transformation;
- makes irreversible transformation without distinct gameplay/art need.

---

# 78. Restoration Validation Rules

A restoration path should define:

- problem;
- cause;
- required action families;
- success condition;
- failure condition;
- persistent outcome.

For major sites, restoration should also define:

- settlement/Court consequence;
- ecology consequence;
- re-entry/revisit state.

---

# 79. Corruption Validation Rules

Void corruption content must define:

- entry vector;
- affected content;
- severity;
- spread rules;
- containment;
- cleansing where possible;
- irreversible threshold;
- visual distinction;
- provenance.

"Because corruption" is not sufficient design justification.

---

# 80. Blight Validation Rules

Blight content must define at least one plausible realm-local cause.

Examples:

- water failure;
- overharvest;
- seasonal failure;
- disease;
- invasive species;
- infrastructure damage.

This prevents blight from becoming a generic enemy-spawn switch.

---

# 81. Realm Event Validation

An event altering realm state must specify:

- scope;
- start condition;
- affected state domains;
- duration or resolution condition;
- persistence;
- rollback/restoration where applicable.

---

# 82. Deterministic Propagation Validation

Propagation networks must have:

- source;
- allowed edges;
- rate;
- barrier;
- maximum step/budget per simulation update;
- stop condition.

No infinite recursive spread in one tick.

---

# 83. Performance Budgets

The implementation should budget:

- active corruption sites;
- active blight simulations;
- detailed restoration sites;
- dynamic living structures;
- active off-screen propagation checks.

World settings may reduce budgets.

If budget is exceeded, systems should defer or aggregate updates rather than lose state.

---

# 84. Error Recovery

Invalid state combinations should resolve safely.

Examples:

**Restored + severe active corruption**
- flag inconsistency;
- select authoritative state;
- rebuild derived visuals.

**Dead tree + thriving foliage**
- rebuild from base lifecycle state.

**Portal active + missing required structural core**
- universal portal system resolves damaged/invalid state.

Validation should not silently invent replacement content.

---

# 85. Mod / Forge Extension Contract

User-created Verdant-compatible content may add:

- new blight causes;
- restoration recipes;
- local hazards;
- state-aware structures.

It must not silently change the canonical definitions of:

- natural rot;
- Void corruption;
- Covenant Portal;
- canonical materials;
- canonical realm laws.

Explicit overhaul mods may supersede canon within their own content namespace, but base-content certification remains separate.

---

# 86. Realm-State Registry

The following realm-local state families are canonically required.

| FCC State Family | Purpose |
|---|---|
| Environmental / Seasonal State | Season, local climate and environmental conditions |
| Ecological Health State | Thriving to collapsed/recovering ecosystem condition |
| Natural Rot State | Decomposition abundance without moral/corruption meaning |
| Blight State | Ecological/magical dysfunction |
| Void Corruption State | Cross-realm reality contamination |
| Restoration State | Assessment, stabilisation, recovery and repurposing |
| Court / Covenant State | Political/legal/threshold context consumed from FCC-02A/F |
| Content-Specific State | Bounded state such as crop maturity, guardian stance or portal stability |

Final executable enum/schema IDs are reconciled in technical implementation/FCC-13 where appropriate.

---

# 87. Irreversible Transformation Registry

At FCC-02I v0.1:

## Locked Named Verdant Irreversible Material

- **Corrupted Heartwood**

## Possible Future Candidates Requiring Global Review

- irreversibly rewritten Bloomstone;
- other permanently transformed materials;
- permanently transformed creatures.

No other irreversible Verdant transformation is automatically canonised.

---

# 88. Canonical Restoration Outcome Categories

Realm-local restoration outcomes include:

- restored;
- stabilised;
- contained;
- repurposed;
- abandoned safely;
- sealed;
- failed;
- destroyed;
- transformed.

These outcomes may feed universal quest/event state.

---

# 89. Canonical Cross-Realm Interface Registry

| External Realm/System | Verdant Interface |
|---|---|
| Ancestral Veil | Limited Moonroot/spirit-memory resonance only; no death routing or portal bypass |
| Somnolent Expanse | Rare Dreaming Root dream resonance only; no Dream Network ownership or portal bypass |
| Void Between | Consumed corruption/contamination interface; Verdant defines local response only |
| Ascendant Reach | Future progression/trade/material interface pending FCC-05 |
| Impossible Deep | Future interface pending FCC-06 |
| World-Engine | Future technology/stabilisation interface pending FCC-07 |
| Ashen Lower Realms | Future progression/trade interface pending FCC-08 |
| Elemental Confluences | Future environmental/material interface pending FCC-09 |
| Pocket Realm System | Verdant environmental/law imprint inputs consumed by FCC-11 |
| Overworld | Portal, cultivation, trade and material exchange; final IDs pending FCC-01 |
| Universal Realm Access | Covenant Portal runtime and all realm transfer |
| Universal World Simulation | State update cadence, profiles and persistence |
| Universal Events/Quests | Event execution, objective tracking and rewards |

---

# 90. Cross-Realm Non-Ownership Rule

A Verdant document may reference another realm only through an interface.

It may not:

- define that realm's creatures;
- define its materials;
- define its portal;
- define its bosses;
- transfer ownership of its mechanics.

If FCC-02 requires functionality from another realm that has not yet been authored, record an interface requirement for final reconciliation.

---

# 91. Portal-Corruption Interaction Summary

Normal first access:

- Covenant Portal built from the FCC-02G contract;
- portal validates;
- portal activates;
- player travels.

Corruption case:

- corruption may destabilise;
- portal may fail validation;
- portal may require cleansing/repair;
- portal may be quarantined.

Corruption does not create:

- random teleport;
- a second portal type;
- Void fast travel.

---

# 92. Realm-State Progression

The player may progress in understanding state through:

1. recognising natural ecology;
2. distinguishing healthy rot from damage;
3. diagnosing blight;
4. learning restoration;
5. detecting true Void contamination;
6. containing severe corruption;
7. handling irreversible transformations;
8. applying Verdant restoration knowledge cross-realm where systems permit.

This is knowledge progression, not a mandatory linear quest chain.

---

# 93. No Universal Purity Meter

Verdant Covenant must not reduce all ecology to one global purity score.

Reasons:

- rot can be healthy;
- blight can be local;
- corruption is distinct;
- different cultures value different landscapes;
- restoration may lead to a different stable ecology.

Aggregate indices may exist for simulation, but player-facing design should preserve meaningful categories.

---

# 94. No Moral Alignment Inference

A creature, region or culture associated with:

- rot;
- winter;
- thorns;
- predation;
- decay

is not automatically evil.

Void corruption is also not a moral alignment system.

A corrupted being may be:

- hostile;
- confused;
- suffering;
- still intelligent;
- recoverable;
- irreversible.

Story and behaviour determine morality.

---

# 95. Realm-State Debugging

Developer tools should be able to inspect:

- base definition;
- current states;
- state sources;
- timers;
- propagation graph;
- restoration actions;
- provenance;
- irreversible-transformation status.

Debug views should make it easy to identify accidental state multiplication or stale overlays.

---

# 96. Automated Tests

Minimum tests should include:

1. natural rot does not set Void corruption;
2. blight can exist with zero Void corruption;
3. Void corruption can coexist with blight;
4. cleansing corruption does not automatically restore ecology;
5. restoration does not create alternate portal access;
6. corrupted Living Heartwood remains a state until irreversible threshold;
7. Corrupted Heartwood only appears after valid transformation;
8. seasonal variants remain state, not duplicate items;
9. Rotcap Colony remains valid healthy ecology;
10. Rotgrazer remains valid healthy ecology;
11. Dreaming Root resonance does not transfer realm;
12. Moonroot resonance does not route deaths;
13. off-screen propagation respects simulation profile;
14. multiplayer receives authoritative state;
15. low-end mode preserves outcome state;
16. provenance survives contamination and cleansing;
17. settlement restoration persists;
18. dungeon restored/repurposed state persists;
19. authority outcome and corruption state do not overwrite each other incorrectly;
20. portal corruption can be repaired without creating new portal type.

---

# 97. FCC-02I Completeness Gate

FCC-02I is complete at realm-local level only if it defines:

- rot;
- blight;
- corruption;
- restoration;
- containment;
- cleansing;
- destruction;
- irreversible transformation;
- material-state handling;
- flora-state handling;
- creature-state handling;
- settlement/structure handling;
- dungeon/authority handling;
- event propagation;
- portal interaction;
- cross-realm boundaries;
- simulation profiles;
- determinism;
- performance;
- accessibility;
- art handoff;
- validation.

This document satisfies those requirements.

---

# 98. Handoff to FCC-02J

FCC-02J is the final **content-canon** document in the Verdant Covenant FCC set.

FCC-02I hands FCC-02J:

- canonical state-family registry;
- Corrupted Heartwood irreversible-transform candidate;
- cross-realm interface registry;
- portal-state boundaries;
- restoration outcome categories;
- validation requirements;
- unresolved global-reconciliation items.

FCC-02J must consolidate FCC-02A through FCC-02I into:

- final realm content registry;
- exact canon roster;
- content-completeness certification;
- supersession/reconciliation register;
- unresolved global dependency list;
- final art-handoff manifest;
- FCC-02 package index.

Later, after global Material, Colour & Texture Style Governance is complete, FCC-02 may be extended with:

- **FCC-02K - Verdant Covenant Realm Visual Identity & Environmental Art Direction**
- **FCC-02L - Verdant Covenant Realm Asset Art Manifest & Material Inheritance Handoff**

Those future art documents consume global art rules rather than redefining them.

---

# 99. Reconciliation Notes

## 99.1 Natural Rot

Earlier Verdant material frequently used "rot" alongside blight/corruption.

FCC canon resolves the distinction:

- rot = natural decomposition;
- blight = ecological/magical dysfunction;
- corruption = Void-derived contamination.

## 99.2 Rotwilds

Rotwilds are not automatically corrupted.

They may contain:

- healthy decay;
- blight;
- Void corruption

in separate combinations.

## 99.3 Rotwood

Rotwood remains a condition of compatible wood unless a future irreversible transformation is separately approved.

## 99.4 Dreaming Root Depths

Dreaming Root Depths retain dream resonance but are not an alternate Somnolent access system.

## 99.5 Moonroot Groves

Moonroot Groves retain spirit/memory resonance but do not become an afterlife intake system or Ancestral portal.

## 99.6 Void Corruption

All genuine corruption ultimately consumes the Void interface, while FCC-10 retains ownership of the Void's deeper canon.

---

# 100. Final Realm-Local Lock

At FCC-02I v0.1:

**Natural rot/decomposition model:** locked.  
**Ecological/magical blight model:** locked.  
**Void-corruption response model:** locked.  
**Restoration/containment model:** locked.  
**Irreversible-transformation rule:** locked.  
**Corrupted Heartwood status:** locked as the only named Verdant irreversible material currently required.  
**State propagation architecture:** locked at realm-local contract level.  
**Cross-realm interfaces:** locked as boundaries pending receiving-realm reconciliation.  
**Portal-state rule:** locked.  
**Simulation-scaling requirements:** locked.  
**Art-state handoff:** locked.

No future Verdant content should:

- merge rot, blight and corruption into one generic condition;
- create duplicate state-based registries without passing the irreversible-transformation threshold;
- bypass the Covenant Portal;
- redefine another realm through a Verdant document.

---

# 101. FCC-02I Canon Summary

The Verdant Covenant state system is designed around **living continuity rather than binary purity**.

The realm recognises:

- natural rot as necessary ecology;
- blight as dysfunction;
- Void corruption as external reality contamination;
- restoration as a family of meaningful interventions.

State is layered onto canonical definitions wherever possible.

Only irreversible, mechanically distinct transformations become new definitions.

The currently locked named irreversible Verdant material is:

- **Corrupted Heartwood**

Realm state scales from:

- local entity;
- site;
- settlement;
- biome region;
- realm summary.

Off-screen updates use aggregation and deterministic rehydration.

Low-end simulation reduces detail, not canon.

Cross-realm resonance with Ancestral Veil and Somnolent Expanse does not create alternate access.

All normal Verdant travel continues through the **Covenant Portal**.

Void corruption is consumed as an interface from the Void Between and never redefined here.

FCC-02I is therefore the authoritative realm-local state, corruption, blight, restoration and cross-realm integration contract for the Verdant Covenant until superseded by an explicit FCC amendment or final global reconciliation.
