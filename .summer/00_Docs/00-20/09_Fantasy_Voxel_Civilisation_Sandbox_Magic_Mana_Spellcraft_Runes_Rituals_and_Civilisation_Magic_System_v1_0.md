# LEYFORGE

## 09 — Magic, Mana, Spellcraft, Runes, Rituals and Civilisation Magic System

### Personal Spellcasting, External Mana Infrastructure, Enchanting, Alchemy, Wards, Summoning, Portals, Maritime Magic and Persistent Magical Consequence

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `09_Fantasy_Voxel_Civilisation_Sandbox_Magic_System_v0_2` for active production direction  
**System Ownership:** Mana concepts and external mana truth; magic schools/domains; personal spellcasting; spell definitions; magical costs and validation; runes; enchantments; alchemy principles; rituals; summoning/binding magic; ward logic; magical status definitions; magical movement providers; magical treatment capabilities; magical information/divination capabilities; magical infrastructure semantics; portal/space-magic activation rules; corruption/forbidden-practice magic state; magic-facing settlement and automation contracts.  
**Consumes Interfaces From:** Documents 02–08, 10–20; Forge Sets 21–23; Atlas Set 24; Governance Set 25; Maritime Set 26; Economy Set 27; Social Set 28; Biology Set 29; Movement Set 30.  
**Does Not Own:** Physical Block/Item identity; recipe transaction truth; persistent NPC identity; prices/wages/contracts; social belief/Trust/Loyalty; biological Health/Stamina/injury/disease/treatment outcome; physical movement/path execution; vessel physics; combat damage ownership; settlement-project selection; building-service capacity; final realm topology; UI presentation.  
**POC Treatment:** Raw Mana Crystal → Mana Shard/Dust → Basic Rune → Rune Table → Small Mana Buffer → Basic Ward Anchor, Stone Sense, Spark Bolt, a magical ruin, mage teaching and settlement defence remain Archived Validation and reusable production capabilities. The fixed Forest Hamlet ward loop, fixed mana pocket and fixed magical ruin are not production generation requirements.  
**Engine Direction:** Godot + Summer Engine development direction. Summer Engine may assist implementation and validation under source-controlled review.  
**Project Lead and Final Authority:** Ash

A production-scale magical system in which magic is physical, discoverable, culturally interpreted, resource-aware and capable of changing the world without becoming an excuse to bypass every other system.

> **Magic System Statement**
>
> **Magic in Leyforge is both personal power and civilisation infrastructure. A spell, rune, ward, ritual, enchantment, alchemical process, summon, portal or magical machine must reveal what enables it, what it consumes, what it changes, what can interrupt or counter it, who has authority to use it and what persistent consequences remain.**

> **Magic Does Not Bypass Ownership Rule**
>
> **Magic may request or provide an effect in another gameplay domain, but the owning domain commits the actual consequence. A healing spell does not directly rewrite Health, a flight spell does not directly write transforms, a divination spell does not directly rewrite beliefs, and a magically accelerated shipment does not directly set economic value.**

> **Personal Mana / External Mana Rule**
>
> **Personal mana supports direct casting. External mana is conserved infrastructure energy stored or transmitted through valid magical resources, buffers, conduits, wards, ritual sites, machines, structures and later leyline interfaces. Personal mana cannot silently substitute for civilisation-scale external mana requirements.**

> **Canonical Physical Identity Rule**
>
> **A magical structure or device that is fundamentally a placeable Block and recovers as that same Block has one canonical Block identity. The Magic System references it; it does not create a duplicate Item definition.**

---

# Document Purpose

Document 09 defines what magic **means and does** across Leyforge.

It governs:

- personal mana and casting;
- magical knowledge and schools;
- spells;
- focuses and loadouts;
- runes and inscription;
- enchanting;
- alchemy and magical transmutation;
- wards;
- ritual logic;
- magical infrastructure;
- mana networks;
- summons and bound entities;
- portal and space-magic activation;
- magical movement providers;
- magical treatment capabilities;
- divination and extraordinary communication capability;
- corruption and forbidden practices;
- cultural interpretations of magic;
- magical settlement services;
- magic/automation integration;
- maritime magic;
- magic LOD, persistence and multiplayer authority.

Version 0.2 already established a strong production architecture. Version 1.0 preserves that design and reconciles it with the post-Atlas systems built afterward.

The key production corrections are:

1. **Documents 03–06 v1.0 now provide the canonical physical registry foundation.** Magical Blocks, carried Items, Resources and transformations are not duplicated in Document 09.
2. **Document 08 v1.0 now explicitly returns external mana truth to Document 09.** Automation consumes mana-provider state rather than creating a second mana network.
3. **Set 26 extends existing schools into maritime gameplay.** It does not create a separate independent “Maritime Magic System.”
4. **Set 27 owns prices and economic consequences.** Magic may create scarce capability, services or resources; Set 27 decides their economic value.
5. **Set 28 owns belief, rumour, language/social interpretation and consent.** Magic owns telepathy/divination capability and cost; Set 28 owns the informational/social result where applicable.
6. **Set 29 owns biological state and treatment outcomes.** Magic defines healing/protection capabilities but submits treatment/biological requests.
7. **Set 30 owns physical movement.** Magic provides authorised movement providers, portal transitions or environmental/gravity fields; Set 30 executes the physical displacement where Set 30 is the movement owner.
8. **The fixed Forest Hamlet ward POC is archived, while all reusable magical capabilities remain available to production.**

---

# 1. Locked Magic Identity

Magic is not a class and is not only combat.

It is a set of learnable, usable and infrastructure-capable forces that connect:

- survival;
- exploration;
- construction;
- agriculture;
- medicine;
- combat;
- defence;
- automation;
- settlements;
- information;
- navigation;
- transport;
- maritime play;
- ecology;
- realms;
- politics;
- culture;
- story;
- restoration; and
- world transformation.

## 1.1 Player Promise

A player should be able to:

- discover magic rather than receive it automatically;
- learn through several routes;
- specialise without permanent class lock;
- remain a non-mage and still use magical civilisation services;
- combine magic with tools, machines and settlement systems;
- understand the cost and risk of a magical action;
- build visible magical infrastructure;
- use magic for non-combat purposes;
- explore dangerous/forbidden practices when world/culture rules permit;
- see civilisations interpret the same magical principles differently; and
- create long-term magical consequences that persist in the world.

## 1.2 What Magic Is Not

Magic is not:

- a spell list detached from the voxel world;
- a replacement for crafting;
- a replacement for automation;
- a replacement for NPC labour;
- a replacement for roads, ships or ordinary transport;
- a universal cure-all;
- an automatic truth detector;
- an automatic teleport authority;
- a resource-free build mode;
- a universal “good/evil” morality system;
- ancestry-locked;
- a second economy;
- a second biological simulator;
- a second movement controller; or
- a decorative VFX layer.

---

# 2. Source Authority and Reconciliation

| Source | Production Direction Consumed |
|---|---|
| Document 09 v0.2 | Core magic architecture, schools, personal/external mana, casting pipeline, runes, enchanting, alchemy, rituals, summons, wards, portals, cultural/law boundary, Godot/Summer. |
| Documents 03–06 v1.0 | Canonical Blocks/Items/Recipes/Resources and no-duplicate physical identity rule. |
| Document 07 v1.0 | Persistent people, jobs, mage/ritual labour, ordinary schedules and settlement operation. |
| Document 08 v1.0 | Automation runtime, fixed logistics and machine control; consumes mana from Document 09. |
| Document 11 v1.0 | Leylines, magical environments, worldgen contexts, realm anchors and sourced anomalies. |
| Documents 12–20 | Structures, cultures, realms, quests, combat, UI, settlement growth and magical building/service integration. |
| Forge Sets 21–23 | Physical/presentation source for magical Blocks, Items, entities, ritual layouts, VFX/audio and semantic markers. |
| Atlas Set 24 | Canonical world context, cultures, magical landscapes, realm identities, creatures, sites, bosses and history. |
| Set 25 | Qualified IDs, schemas, packages, migrations, validation and POC retirement. |
| Set 26N | Maritime magic extends existing schools into navigation, weather reading, breathing, pressure protection, propulsion, pumping, wards, preservation, rescue and realm travel. |
| Set 27 | Price/value/market/contract truth for magical goods/services. |
| Set 28C | Magic provides divination/telepathy/translation information capability; Set 28 owns information/belief/provenance/social interpretation. |
| Set 29G/H/J | Healing magic submits treatment/biological capability requests; Set 29 owns Health/injury/disease/treatment outcomes. |
| Set 30D/J | Magic exposes movement providers and fields; Set 30 executes terrestrial/aerial movement and portal-transition physical handoff. |
| Cross-Set Register v1.1 | One owner per gameplay truth, typed snapshots, revisions, idempotent commands/evidence, intent separate from execution. |

---

# 3. Supersession from v0.2

## 3.1 Preserved

The following v0.2 locks remain:

- magic as practical infrastructure;
- major school list;
- no universal Divine school;
- necromancy as compound practice rather than universal school;
- golemancy as compound practice;
- personal mana;
- external mana;
- mana purity and stability;
- resource-aware spellcasting;
- deterministic casting pipeline;
- spell loadouts;
- focuses;
- utility magic;
- combat magic;
- runes;
- enchanting;
- alchemy;
- rituals;
- summoning;
- wards;
- mana networks;
- magitech;
- portals;
- cultural interpretation;
- law-facing tags;
- forbidden practices;
- readable risk;
- Forge source separation;
- LOD/persistence/multiplayer;
- Godot/Summer direction.

## 3.2 Reconciled Ownership

| v0.2 Area | v1.0 Final Boundary |
|---|---|
| Healing spell writes Health/injury | Magic defines capability/cost; Set 29 validates/commits biological outcome. |
| Movement spell changes actor transform | Magic provides movement capability/field/transition request; Set 30 executes physical movement. |
| Telepathy/divination creates knowledge | Magic produces extraordinary information result/provenance; Set 28 owns belief/knowledge transfer. |
| Magical goods have inherent price | Set 27 owns current economic value. |
| Mana automation runtime partly duplicated in 08 | Document 09 owns mana truth; 08 consumes provider snapshots. |
| Maritime magic as expansion detail | 26N extends existing schools; Document 09 remains the main magic authority. |
| Vessel movement magic | Magic owns provider/cost; Set 26/Set 30 specialist movement owner executes vessel/aquatic physical result. |
| Magical disease/injury cure | Set 29 owns cure/treatment outcome. |
| Magic reputation/trust | Set 28/13 own social/political interpretation; Magic exposes observed practice/evidence. |

---

# 4. Canonical Magic Architecture

Leyforge magic separates:

1. **Definition**
2. **Knowledge/Unlock**
3. **Capability Provider**
4. **Cost**
5. **Intent**
6. **Validation**
7. **Commit**
8. **Effect Request**
9. **Owning-Domain Resolution**
10. **World Evidence**
11. **Recovery/Cooldown**
12. **Persistent Consequence**

## 4.1 Core Definition Families

Production magic uses definition families such as:

- `MagicSchoolDefinition`;
- `MagicDomainTag`;
- `SpellDefinition`;
- `CastingProfile`;
- `ManaProfile`;
- `ExternalManaProviderDefinition`;
- `ManaStorageDefinition`;
- `ManaConduitProfile`;
- `RuneDefinition`;
- `RuneCompatibilityProfile`;
- `EnchantmentDefinition`;
- `AlchemyProcessDefinition`;
- `RitualDefinition`;
- `RitualRoleDefinition`;
- `WardDefinition`;
- `WardCoverageProfile`;
- `SummonDefinition`;
- `BindingProfile`;
- `MagicalStatusDefinition`;
- `MagicalMovementProviderDefinition`;
- `MagicalTreatmentCapabilityDefinition`;
- `DivinationCapabilityDefinition`;
- `PortalMagicDefinition`;
- `CorruptionPracticeDefinition`;
- `MagicLawFacet`;
- `MagicPresentationContract`;
- `MagicLODProfile`;
- `MagicReasonCode`.

Set 25 governs registry admission and schema versioning.

---

# 5. Schools, Domains and Tags

The major schools remain:

1. Elemental
2. Nature
3. Arcane
4. Light
5. Shadow
6. Blood
7. Time
8. Space
9. Rune
10. Alchemy
11. Enchanting
12. Summoning
13. Ritual

## 5.1 No Universal Divine School

“Divine” is not a universal physics school.

Faith, sacred, ancestor, spirit and deity-related traditions may use:

- Light;
- Nature;
- Shadow;
- Summoning;
- Ritual;
- Rune;
- cultural tags;
- role tags;
- source/tradition tags.

This allows cultures to interpret magic differently without duplicating the underlying system.

## 5.2 Compound Practices

Examples:

**Necromancy**
- Shadow
- Summoning
- Ritual
- possible Blood/Alchemy components
- law/culture risk tags

**Golemancy**
- Rune
- Summoning
- Automation
- Enchanting/Alchemy where relevant

**Stormcalling**
- Elemental
- Ritual
- environmental field interfaces

**Portal Engineering**
- Space
- Rune
- Ritual
- Automation/structure integration

## 5.3 Behaviour Uses Tags

Schools organise learning/tradition.

Tags drive exact behaviour such as:

- damage type;
- healing capability;
- movement provider;
- ward interaction;
- translation;
- summoning;
- environmental effect;
- construction;
- farming;
- corruption;
- forbidden;
- target class;
- dispellable;
- infrastructure-compatible;
- underwater-compatible;
- maritime-compatible;
- realm-specific.

---

# 6. Personal Mana

Personal mana is the direct-casting resource for a person/entity with a compatible magical profile.

Document 09 owns:

- maximum personal mana;
- current personal mana;
- regeneration rules;
- casting reserve;
- overchannel allowance;
- personal magical strain;
- magical exhaustion state **only where it is distinct from Set 29 biological Fatigue**;
- source modifiers;
- focus efficiency;
- school affinity where used.

## 6.1 Personal Mana Is Not Stamina

Set 29 owns Stamina and Fatigue.

Casting may:

- spend mana;
- request biological exertion consequences where defined;
- create magical strain;
- request Set 29 exposure/treatment consequence;
- temporarily affect movement through a Set-30 modifier/provider.

Document 09 must not store a duplicate Stamina bar.

## 6.2 Regeneration

Personal mana regeneration may depend on:

- natural baseline;
- rest;
- skill/perks;
- focus;
- environment;
- leyline proximity;
- shrine/service;
- potion/item effect;
- realm;
- curse/corruption;
- world settings.

Where a biological condition should affect regeneration, Document 09 consumes Set 29 modifiers rather than recalculating Health/Fatigue.

---

# 7. External Mana

External mana is conserved magical infrastructure energy.

Potential providers include:

- mana crystals;
- refined mana materials;
- mana buffers/batteries;
- conduits;
- generators/converters where approved;
- leyline taps;
- ritual sources;
- realm sources;
- settlement facilities;
- magical creatures/entities where explicit;
- portable magical storage.

## 7.1 External Mana Record

A provider may expose:

- provider ID;
- source type;
- stored amount/capacity;
- input/output rate;
- purity;
- stability;
- school/domain compatibility;
- ownership;
- permissions;
- connection graph;
- environmental context;
- damage;
- corruption;
- maintenance;
- revision.

## 7.2 Conservation

External mana cannot appear because a machine or ward is off-screen.

A transfer requires:

- source;
- destination;
- amount;
- capacity;
- compatibility;
- connection;
- permission;
- loss/efficiency rule where applicable;
- transaction ID;
- commit evidence.

## 7.3 Personal Mana Cannot Pay Infrastructure by Default

A person standing near a city ward does not automatically become its battery.

Explicit rituals or emergency actions may permit personal contribution if defined.

---

# 8. Mana Purity and Stability

Purity and stability remain readable quality concepts rather than a hidden chemistry simulator.

## 8.1 Purity

Purity may affect:

- efficiency;
- ritual eligibility;
- ward compatibility;
- enchanting quality;
- alchemy;
- corruption risk;
- machine tolerance;
- portal stability.

## 8.2 Stability

Stability may affect:

- safe transfer;
- overload;
- storage;
- ritual interruption tolerance;
- portal behaviour;
- explosive/unsafe discharge;
- magical machine faults.

## 8.3 Readable Bands

Use named bands where practical:

- Impure
- Common
- Refined
- High
- Exceptional
- Unstable/Corrupted as orthogonal states where needed

Exact numbers remain balance data.

---

# 9. Magical Resources and Physical Registry Boundary

Document 06 owns resource identity.

Document 04 owns true carried Items.

Document 03 owns magical Blocks.

Document 05 owns transformations.

Document 09 owns magical meaning/use.

Examples:

- Mana Crystal Ore — Block / Resource source
- Raw Mana Crystal — Item / Resource form
- Mana Shard — Item
- Mana Dust — Item
- Rune Blank — Item
- Placed Rune Substrate — Block
- Mana Conduit — Block
- Mana Buffer/Battery — Block if recoverable as itself
- Spellbook — Item
- Focus — Item/equipment
- Ritual Anchor — Block/Structure element

## 9.1 No Duplicate Magical Block Item

If `Mana Conduit` is one canonical placeable Block that returns as itself, there is no separately authored `Mana Conduit Item`.

Inventory uses the Block Inventory Projection.

---

# 10. Progression, Discovery and Learning

Magic is learned through the world.

Possible discovery routes:

- mentors;
- books;
- ruins;
- magical sites;
- research;
- experimentation;
- culture/faction institutions;
- settlement services;
- creatures;
- bosses;
- relics;
- realm exposure;
- rituals;
- quests/events;
- environmental evidence.

Overall player level cannot replace:

- knowledge;
- resource;
- teacher;
- tool/focus;
- ritual site;
- physical provider;
- social permission;
- progression prerequisite.

## 10.1 Multiple Paths

A basic ward principle might be learned through:

- village mage;
- ruin inscription;
- research;
- purchased text;
- faction training;
- salvaged ward;
- experimentation;
- realm tradition.

No fixed Forest Hamlet teacher is required.

## 10.2 Non-Mage Viability

Non-mages may:

- commission enchantments;
- use wards;
- use public portals;
- operate mana-compatible infrastructure;
- buy alchemical goods;
- hire specialists;
- use magical tools;
- rely on mundane equivalents.

---

# 11. Spell Definition

A Spell Definition should contain:

```yaml
spell_definition:
  spell_id: leyforge.core.magic.spell.<path>
  schema_version: 1
  schools: []
  domain_tags: []
  knowledge_requirements: []
  casting_profile_ref: <id>
  mana_cost_profile_ref: <id>
  focus_requirements: []
  component_requirements: []
  target_profile_ref: <id>
  range_profile_ref: <id>
  cast_time_profile_ref: <id>
  interruption_profile_ref: <id>
  cooldown_profile_ref: <id>
  effect_requests: []
  counter_tags: []
  law_risk_tags: []
  world_state_requirements: []
  presentation_ref: <id>
  accessibility_cues: []
  production_status: <state>
```

A spell does not directly contain another system's mutable state.

---

# 12. Casting Pipeline

The production casting pipeline is:

**Prepare**  
→ **Validate Caster**  
→ **Validate Knowledge**  
→ **Validate Target**  
→ **Validate Environment**  
→ **Validate Cost**  
→ **Reserve/Commit Cost**  
→ **Begin Cast**  
→ **Check Interruption**  
→ **Commit Magic Effect Request**  
→ **Owning Domain Resolves Consequence**  
→ **Apply Magical Persistent State**  
→ **Emit Evidence**  
→ **Recover/Cooldown**

## 12.1 Determinism

Given the same:

- caster state;
- spell definition;
- target;
- world state;
- random seed/event seed where randomness is allowed;
- committed cost;

the authoritative outcome should be deterministic within the defined rules.

## 12.2 Failure

Failure reasons may include:

- unknown spell;
- no mana;
- wrong focus;
- invalid target;
- blocked line;
- range;
- anti-magic;
- ward interference;
- missing component;
- wrong ritual state;
- movement state incompatible;
- biological restriction;
- permission/law restriction where hard-enforced;
- environment incompatible;
- portal destination unstable.

---

# 13. Focuses and Loadouts

Focuses may include:

- wand;
- staff;
- crystal;
- rune tool;
- spellbook;
- charm;
- weapon focus;
- holy/sacred object as cultural presentation;
- gauntlet;
- instrument;
- vessel/navigation focus;
- ritual tool.

Focuses may affect:

- compatibility;
- precision;
- mana efficiency;
- cast speed;
- stability;
- range;
- school access;
- loadout slots;
- target control.

A focus does not automatically grant knowledge unless explicitly defined.

---

# 14. Targeting

Magic targeting may support:

- self;
- actor;
- voxel/block;
- area;
- structure;
- machine;
- vessel;
- water body;
- route;
- portal;
- ward zone;
- item;
- corpse/remains where permitted;
- summon;
- environmental field;
- abstract proposition/information target for divination.

Target validation occurs before effect commit.

---

# 15. Utility Magic

Utility magic may support:

- light;
- detection;
- mining assistance;
- terrain sensing;
- construction assistance;
- repair assistance;
- crop support;
- water finding;
- environmental reading;
- purification;
- preservation;
- communication;
- translation;
- navigation;
- route sensing;
- rescue;
- breathing assistance;
- pressure protection;
- warmth/cooling;
- shelter support;
- carrying/handling assistance;
- movement providers;
- remote activation where permitted.

Utility magic should complement physical systems.

## 15.1 Stone Sense

Stone Sense remains a valid archived-test/producible utility concept.

Its production implementation should expose information such as:

- geology;
- cavity;
- ore/resonance clue;
- structural anomaly

according to knowledge and balance rules.

It does not reveal every hidden resource with perfect omniscience by default.

---

# 16. Combat Magic Boundary

Document 16 owns combat resolution.

Document 09 owns:

- spell capability;
- magical damage type declaration;
- cast cost;
- projectile/area magical behaviour specification;
- magical status request;
- ward interaction;
- magical counter/interrupt conditions.

Document 16 commits:

- hit;
- damage;
- defence;
- block/parry interactions;
- downed/death state;
- combat authority.

## 16.1 Spark Bolt

Spark Bolt remains a valid early combat-spell fixture.

Its exact damage/balance is not locked here.

## 16.2 Friendly Fire

World/server/combat settings control friendly-fire application.

Magic exposes target/effect tags.

---

# 17. Magical Status Effects

Document 09 owns magical statuses such as:

- magically slowed;
- silenced;
- dispelled;
- warded;
- cursed;
- magically empowered;
- mana-burned;
- marked;
- phase-shifted;
- summoned/bound;
- anti-magic suppression.

Where a status creates a biological effect, submit the appropriate request to Set 29.

Where it changes movement, Set 30 applies the movement modifier/provider.

Where it affects social knowledge, Set 28 handles perception/belief.

---

# 18. Healing, Protection and Set 29 Boundary

Magic may define treatment capabilities such as:

- immediate Health restoration request;
- generic recovery support;
- wound stabilisation;
- bleeding control;
- toxin suppression;
- disease treatment;
- burn/frost injury support;
- pain suppression;
- fracture support;
- rehabilitation support;
- protective warding/prophylaxis;
- cleansing.

Set 29 owns the biological truth.

## 18.1 Magical Treatment Request

A magic treatment request should contain:

- transaction ID;
- caster/provider;
- target;
- spell/ritual;
- treatment capability tags;
- magnitude/band;
- duration;
- mana/material costs;
- diagnosis/knowledge requirement;
- protection context;
- saturation/repeat category;
- side effects;
- corruption/forbidden tags;
- world time;
- magic revision.

Set 29 validates and returns:

- accepted/rejected;
- biological outcome;
- partial outcome;
- reason codes;
- new biological revision.

## 18.2 No “Delete Injury” Script

A magic spell cannot simply remove:

- fracture;
- disease;
- poison;
- bleeding;
- fatigue;
- Health damage

by directly editing Set 29 records.

## 18.3 Resurrection

If resurrection/revival ever exists, it requires explicit ownership with Document 16/29/quest/lore systems and is not implied by ordinary healing magic.

---

# 19. Wards

Wards are persistent magical protection systems.

Ward types may include:

- creature deterrence;
- hostile-magic resistance;
- intrusion detection;
- environmental protection;
- corruption containment;
- settlement defence;
- structure protection;
- portal stabilisation;
- maritime/vessel protection;
- preservation;
- anti-scrying/privacy where approved.

## 19.1 Ward Requirements

A ward may require:

- anchor;
- rune pattern;
- mana provider;
- valid topology;
- coverage;
- ownership;
- permission;
- maintenance;
- purity/stability;
- line/zone constraints;
- specialist commissioning;
- environmental compatibility.

## 19.2 Ward Coverage

Ward coverage is authoritative magical state, not a visual radius.

It may expose:

- ward ID;
- source anchors;
- protected area;
- strength band;
- active tags;
- mana demand;
- stability;
- breach state;
- excluded/allowed identities;
- revision.

---

# 20. Runes

Runes are declarative magical logic and persistent inscription.

Rune families may include:

- binding;
- warding;
- locking;
- stability;
- transfer;
- detection;
- elemental;
- growth;
- preservation;
- machine control;
- portal;
- sealing;
- navigation;
- maritime;
- communication.

## 20.1 Rune Principle

A rune modifies or enables a compatible magical behaviour.

It does not become unrestricted scripting.

## 20.2 Rune Validation

A rune requires:

- substrate;
- compatible target;
- known rune;
- inscription tool/skill;
- material;
- mana;
- orientation/layout if relevant;
- permission;
- space/marker compatibility.

## 20.3 Automation Integration

Document 08 may consume rune-defined control capability.

Document 09 owns the magical effect of the rune.

---

# 21. Enchanting

Enchanting attaches persistent magical properties to valid equipment/objects.

An enchantment requires:

- valid target;
- enchantment definition;
- compatible materials;
- mana;
- station/service;
- skill/knowledge;
- socket/capacity where used;
- conflict rules;
- cost;
- commit.

## 21.1 Enchantment State

Store:

- enchantment ID;
- source;
- tier/quality;
- charge if applicable;
- durability interaction;
- curse state;
- owner binding if any;
- maintenance;
- revision.

## 21.2 Physical Item Ownership

Document 04 owns the Item.

Document 09 owns the enchantment record/effect.

---

# 22. Alchemy

Alchemy is a magical transformation discipline.

Document 09 owns:

- magical alchemy principles;
- reagent compatibility;
- catalyst categories;
- magical potency;
- magical stability;
- transmutation permissions;
- magical side effects.

Document 05 owns the actual authoritative recipe/process transformation.

Set 29 owns biological effects of consumed medicines/poisons.

## 22.1 No Free Transmutation

Alchemy must preserve explicit transformation rules and cannot turn arbitrary low-value inputs into unlimited high-value outputs.

Set 27 determines market consequences.

---

# 23. Rituals

Rituals are multi-step magical operations capable of significant persistent outcomes.

Rituals can require:

- physical layout;
- ritual anchors;
- runes;
- catalysts;
- offerings/items;
- mana;
- participants;
- roles;
- timing;
- location;
- weather/environment;
- celestial/world event;
- culture/knowledge;
- law/permission;
- defence;
- uninterrupted stages;
- realm state.

## 23.1 Ritual Pipeline

**Plan**  
→ **Validate Site**  
→ **Reserve Components**  
→ **Assign Participants**  
→ **Establish Mana**  
→ **Begin Phase**  
→ **Commit Stage Costs**  
→ **Monitor Stability**  
→ **Handle Interruption**  
→ **Resolve Effect Requests**  
→ **Commit World Change**  
→ **Record Aftermath**

## 23.2 Failure

Normal rituals should fail readably.

Severe consequences require:

- explicitly dangerous ritual;
- unstable source;
- corrupted component;
- hostile interference;
- ignored warning;
- forbidden practice;
- catastrophic world state;
- harsher settings.

---

# 24. Summoning

Summoning creates, calls, manifests or binds an entity/presence according to an approved definition.

Potential categories:

- temporary summon;
- spirit manifestation;
- elemental;
- familiar;
- bound guardian;
- construct/golem;
- remote call;
- realm entity.

## 24.1 Entity Ownership

Document 09 owns:

- summoning capability;
- binding rules;
- magical cost;
- contract/binding state;
- summon lifespan;
- dismissal;
- magical command capability.

Document 10/entity owner owns creature/entity physiology/behaviour where applicable.

Document 07 owns persistent-person semantics only when the entity qualifies as a person under its contracts.

Set 28 owns companion/social agreement where a summon becomes a social companion.

Set 30 executes physical movement.

## 24.2 No Inventory Duplication

A summoned/constructed entity has one authoritative inventory/cargo identity.

---

# 25. Golemancy

Golemancy remains a compound practice:

**Rune + Summoning + Automation**

It is not a separate universal school.

Document 09 owns:

- magical animating/binding principle;
- rune compatibility;
- mana;
- summon/construct control capability.

Document 08 owns:

- machine/work-task integration;
- automation task queues;
- charging/service interfaces.

Entity/creature systems own physical entity identity where applicable.

Set 30 owns movement.

---

# 26. Mana Networks

Document 09 owns magical-energy network truth.

Network components may include:

- source;
- buffer;
- battery;
- conduit;
- transformer/converter where approved;
- junction;
- ward;
- ritual sink;
- machine consumer;
- portal consumer;
- settlement service consumer;
- monitoring/control endpoint.

## 26.1 Network Invariants

A mana network must preserve:

- connectivity;
- amount;
- capacity;
- purity;
- stability;
- ownership;
- permissions;
- demand;
- loss where defined;
- overload;
- fault;
- source revision.

## 26.2 Automation Boundary

Document 08 asks:

> “Is compatible mana available for this machine, at this draw?”

Document 09 answers.

Document 08 does not own a hidden mana counter.

---

# 27. Magitech

Magitech combines magic and ordinary technology.

Potential applications:

- mana furnace;
- enhanced processing;
- precision control;
- magical sensing;
- preservation;
- pumps;
- navigation;
- portal logistics;
- warded machinery;
- levitation-assisted handling;
- realm-compatible devices;
- vessel systems.

Magitech should not make mundane machinery obsolete.

Mundane systems may remain:

- cheaper;
- safer;
- easier to repair;
- usable under anti-magic;
- culturally acceptable;
- locally producible;
- low-maintenance.

---

# 28. Magical Movement Provider Boundary

Document 09 owns magical movement capability.

Set 30 owns terrestrial/aerial physical movement execution.

Set 26 owns specialist aquatic/vessel movement where designated.

Examples:

- speed enhancement;
- jump enhancement;
- levitation;
- controlled fall;
- glide assist;
- gravity alteration;
- windway;
- blink;
- short teleport;
- portal transition;
- magical mount capability;
- water walking;
- underwater propulsion;
- vessel magical propulsion.

## 28.1 Movement Provider Contract

A magical provider may expose:

```yaml
magic_movement_provider:
  provider_id: magic_movement_provider:<id>
  source_spell_or_effect_ref: <id>
  entity_ref: <id>
  movement_capability_tags: []
  start_world_time: <time>
  duration: <value>
  speed_modifier: <value_or_band>?
  acceleration_modifier: <value_or_band>?
  jump_modifier: <value_or_band>?
  gravity_field_ref: <id>?
  environmental_force_ref: <id>?
  displacement_request_profile_ref: <id>?
  permitted_movement_modes: []
  hard_restrictions: []
  mana_commit_ref: <id>
  reason_codes: []
  magic_revision: <rev>
```

Set 30 validates physical feasibility.

## 28.2 No Wall-Breaking Speed Buff

Magic cannot grant clearance through solid Blocks unless the spell explicitly provides a different capability such as phasing and that capability is validated by its owner.

## 28.3 Portal Transition

Space magic/portal system validates:

- origin;
- destination;
- activation;
- cost;
- portal stability;
- permission;
- realm compatibility.

Movement/realm systems perform the actual transition/presence handoff.

---

# 29. Environmental and Gravity Fields

Magic may create:

- wind;
- updraft;
- gravity modifier;
- sideways gravity;
- low-gravity zone;
- levitation field;
- repulsion;
- attraction;
- movement-slow field.

Document 09 owns the magical source and field definition.

Set 30 consumes the movement-facing field.

Document 11/realm owner provides non-magical environmental field truth.

---

# 30. Space Magic and Portals

Space magic supports:

- short-range displacement;
- storage-space concepts where approved;
- anchor linking;
- portals;
- gates;
- realm access;
- return anchors;
- portal logistics.

Document 14 owns final realm topology/destination reality.

Document 09 owns magical activation and stabilisation.

## 30.1 Portal Requirements

A portal may require:

- frame/anchor;
- destination knowledge;
- attunement;
- mana;
- ritual;
- rare material;
- permission;
- valid destination;
- stability;
- cooldown;
- world state.

## 30.2 No Fixed POC Destination

The old broken portal teaser does not imply one fixed production destination.

---

# 31. Time Magic

Time magic may support bounded effects such as:

- local action acceleration/slow;
- preservation;
- timing windows;
- perception effects;
- cooldown manipulation where allowed;
- ritual synchronisation.

Time magic must not casually:

- rewind authoritative world history;
- duplicate items;
- revert committed economy;
- undo multiplayer actions;
- erase death;
- duplicate characters.

Any world-history rollback concept requires a separate high-risk system decision.

---

# 32. Divination, Telepathy and Extraordinary Information

Document 09 owns magical information capability and cost.

Potential capabilities:

- translation;
- telepathy;
- dream communication;
- memory projection;
- remote viewing;
- truth-seeking;
- scrying;
- spirit testimony;
- route sensing;
- danger sensing;
- resource sensing.

Set 28C owns:

- information transfer;
- belief;
- provenance;
- confidence;
- rumour;
- interpretation;
- disclosure.

## 32.1 Magic Is Not Automatic Truth

A divination definition must state whether output is:

- guaranteed fact;
- high-confidence observation;
- symbolic;
- partial;
- probabilistic;
- interferable;
- spoofable;
- vulnerable to counter-magic.

Set 28 should never infer “magic = true” automatically.

## 32.2 Telepathy and Consent

Magic defines:

- channel;
- range;
- cost;
- detection;
- technical ability.

Set 28/social/law rules may determine:

- consent;
- privacy;
- social consequence;
- willingness;
- disclosure.

---

# 33. Culture and Magical Tradition

Document 13 owns cultures, factions, law, belief systems and political identity.

Document 09 owns underlying magical capability.

Cultures may differ in:

- preferred schools;
- symbols;
- names;
- teaching;
- ritual forms;
- taboos;
- sacred interpretation;
- legal status;
- common focuses;
- magical architecture;
- social roles;
- public infrastructure;
- views on forbidden practice.

## 33.1 No Ancestry Determinism

Ancestry does not automatically determine:

- school;
- magical morality;
- magical competence;
- religion;
- profession.

Biological magical compatibility, if any, must be explicitly defined through the appropriate profile system and must not become culture destiny.

---

# 34. Settlements and Magic

Document 20E and Document 20 own magical building/service functionality.

Document 19 owns project selection/growth.

Document 07 supplies people/jobs.

Document 09 supplies magical capability.

Settlement magic may include:

- mage services;
- wards;
- ritual circles;
- libraries/research;
- enchanting;
- alchemy;
- mana storage;
- mana distribution;
- magical crop support;
- cleansing;
- portal services;
- magical defence;
- magical healthcare capability;
- magical industry.

## 34.1 No Separate “Mana Need”

Power, Mana, Magic, Research, Portals and Corruption are not new top-level settlement needs.

They contribute to the seven-needs/service model through Document 20.

---

# 35. NPC Mages and Specialists

Document 07 owns the persistent person/job.

Document 09 defines specialist magical capability such as:

- spell knowledge;
- school mastery;
- teaching;
- ritual role;
- enchanting;
- alchemy;
- ward maintenance;
- mana-network operation;
- portal operation.

Set 28 owns social willingness/relationship.

Set 27 owns wages/service prices.

Set 29 owns biological availability.

Set 30 moves the person.

---

# 36. Law, Crime and Magical Practice

Document 13/justice systems own law.

Magic exposes law-facing facts:

- practice tag;
- school;
- target;
- consent class;
- damage/risk class;
- forbidden/corruption tag;
- summon class;
- corpse interaction;
- blood sacrifice;
- privacy intrusion;
- portal restriction;
- environmental transformation.

Law/political/social systems decide consequence.

Magic itself does not label every Shadow or Blood spell evil.

---

# 37. Forbidden Magic

Forbidden practices may include combinations such as:

- blood sacrifice;
- necromantic binding;
- unwilling possession;
- soul/memory alteration;
- corruption;
- dangerous realm invocation;
- uncontrolled summoning;
- mass coercion;
- catastrophic temporal/space practices;
- prohibited biological manipulation.

The forbidden state can vary by:

- culture;
- law;
- faction;
- world setting;
- context.

## 37.1 Risk Is Readable

Dangerous practice should expose:

- known risk;
- unknown/uncertain risk;
- stability;
- required safeguards;
- consequence family;
- law/social status.

---

# 38. Corruption

Corruption is magical persistent state, not simply “evil points.”

Corruption may apply to:

- actor;
- item;
- Block;
- structure;
- mana source;
- region;
- ritual site;
- portal;
- creature.

Document 09 owns magical corruption state and magical consequences.

Set 29 owns biological symptoms where corruption affects biology.

Document 11/world state owns terrain/environment transformation records where applicable.

Set 28/13 own social/political interpretation.

---

# 39. Cleansing

Cleansing may:

- remove magical corruption;
- stabilise mana;
- repair ward state;
- close breach;
- purify item/site;
- reduce environmental magical hazard.

Cleansing does not automatically cure biological disease/injury unless a treatment capability is also defined and Set 29 accepts it.

---

# 40. Maritime Magic

Set 26N explicitly extends existing magic into maritime play.

Document 09 remains magic authority.

Maritime applications may include:

- navigation;
- weather reading;
- wind sensing;
- current sensing;
- breathing;
- pressure protection;
- cold protection;
- underwater light;
- rescue;
- preservation;
- pumping assistance;
- hull/compartment wards;
- anti-corrosion or sealing support where defined;
- propulsion assistance;
- sail/wind assistance;
- fog/visibility support;
- marine creature detection;
- realm navigation;
- underwater portal/ritual support.

## 40.1 Mundane Seamanship Remains Valid

Maritime magic must not invalidate:

- charts;
- navigation skill;
- hull design;
- pumping;
- repair;
- crew;
- weather reading;
- rigging;
- engines;
- ordinary diving equipment.

## 40.2 Movement Ownership

For magically assisted vessel movement:

- Document 09 owns provider/cost;
- Set 26 owns vessel physics/execution;
- Set 30 facade/cross-medium coordination applies where specified.

For swimming/diving:
- 26E detailed aquatic locomotion remains owner;
- magic provides capability/biological protection as appropriate.

---

# 41. Magic and Weather

Magic may:

- sense weather;
- forecast through magical capability;
- create local bounded weather effects;
- participate in large rituals.

Document 11/environment owner owns baseline terrestrial weather context.

Set 26D owns live marine wind/waves/tides/currents/storms.

A magic spell does not overwrite a weather owner's fields directly without a typed effect request.

---

# 42. Magic and Biology

Set 29 owns:

- Health;
- Stamina;
- Fatigue;
- Hunger;
- Hydration;
- temperature/wetness/sleep effects;
- injury;
- disease;
- poison;
- treatment.

Magic may provide:

- healing capability;
- protection;
- warmth;
- cooling;
- breathing;
- toxin resistance;
- disease resistance;
- rest support;
- mobility support;
- pain suppression;
- preservation of body state;
- biological transformation requests if explicitly allowed.

All biological outcomes return through Set 29.

---

# 43. Magic and Economy

Set 27 owns:

- price;
- value;
- wage;
- service cost;
- contract;
- taxation;
- market supply/demand.

Document 09 supplies economic facts such as:

- mana input consumed;
- spell/ritual service capability;
- enchantment created;
- catalyst scarcity refs;
- magical facility capacity;
- portal availability;
- magical good identity;
- risk/cost evidence.

A rare spell may be valuable.

Document 09 does not decide its market price.

---

# 44. Magic and Social Systems

Set 28 owns:

- Trust;
- Loyalty;
- relationship;
- conversation;
- belief;
- rumours;
- consent/social willingness;
- companion agreement.

Magic supplies:

- observed magical act;
- divination result;
- telepathy capability;
- magical intimidation/charm capability request;
- ritual participation requirement;
- forbidden-practice evidence.

If mind-influence magic exists, the exact boundary between magical state and social autonomy must remain explicit.

A spell cannot simply assign `Trust = 100`.

---

# 45. Magical Influence and Consent

Potential effects such as:

- charm;
- fear;
- compulsion;
- truth pressure;
- memory alteration;
- dream influence

must be treated as explicit magical status/effect families.

Set 28 consumes the status and determines social interpretation/behaviour according to its contract where appropriate.

Law/faction systems determine legal consequence.

Accessibility/world settings may restrict coercive mechanics.

---

# 46. Magic and Movement

Set 30 explicitly requires Document 09 to expose movement providers.

Examples:

- levitation;
- glide assist;
- speed enhancement;
- gravity field;
- wind field;
- portal transition.

Set 30 applies physical movement.

## 46.1 Modifier Precedence

Magic is a beneficial/external modifier after:

- geometry;
- capability;
- permission/safety;
- biological restriction;
- terrain/environment;
- equipment/load

unless a specialist movement mode explicitly states otherwise.

No spell speed bonus overrides a wall.

---

# 47. Magic and Automation

Document 08 owns machine runtime.

Document 09 owns:

- mana;
- rune magical behaviour;
- magical machine compatibility;
- magical stabilisation;
- magical transformation capability;
- magical fault/exposure;
- ward/portal magical state.

Automation requests a magic provider.

Magic returns:

- compatible/incompatible;
- available amount;
- purity;
- stability;
- allowed draw;
- magical reason codes.

Automation decides whether its machine can run.

---

# 48. Magic and Structures

Document 12 owns persistent structure identity.

Document 20 owns functional building/service contracts.

Blueprint Forge owns physical authored layouts.

Magic defines semantic magical elements such as:

- mana source marker;
- conduit socket;
- ward anchor;
- ritual zone;
- summoning zone;
- portal anchor;
- anti-magic zone;
- magical hazard marker;
- enchantment service marker.

A glowing room does not become a ritual facility without validated semantic elements.

---

# 49. Magic and World Generation

Document 11/Atlas own generated context.

Magic consumes:

- leylines;
- mana density;
- magical environments;
- ruins;
- anomalies;
- corruption zones;
- realm leaks;
- portal anchors;
- magical resources.

Document 09 may create persistent magical state after gameplay, but it does not own seed placement of every magical site.

---

# 50. Realms and Dimensions

Document 14/Atlas 24D own realm topology, destination identity, realm ecology and world rules.

Document 09 owns:

- magical access method;
- portal activation;
- stabilisation;
- ritual;
- spell compatibility;
- realm magic interaction.

Realm-specific magic may extend schools through tags rather than inventing entirely disconnected systems.

---

# 51. Quest and Event Integration

Document 15 owns quest/event lifecycle.

Magic exposes facts such as:

- discovered spell;
- ritual ready;
- ward failed;
- mana shortage;
- corruption;
- breach;
- portal active;
- forbidden practice witnessed;
- summon escaped;
- magical site restored;
- magical item created;
- teacher available.

Document 15 may create objectives/events from those facts.

Magic does not auto-complete quests.

---

# 52. Information and Discovery Integration

Set 28C owns what actors know/believe.

Document 09 can emit:

- divination evidence;
- magical translation;
- remote observation;
- spirit testimony;
- ritual revelation.

Set 28C handles:

- confidence;
- source;
- comprehension;
- propagation;
- rumours;
- belief.

---

# 53. Forge Integration

## 53.1 Voxel Asset Forge

Owns source for:

- runes;
- magical Blocks;
- crystals;
- focuses;
- ritual props;
- ward components;
- portal components;
- magical item visuals.

## 53.2 Entity Forge

Owns:

- caster rig presentation;
- summon/golem body;
- cast anchors;
- effect anchors;
- equipment attachments.

## 53.3 Blueprint Forge

Owns:

- ritual layouts;
- mage buildings;
- wards;
- portal sites;
- mana networks;
- magical infrastructure semantic markers.

## 53.4 Presentation Forge

Owns:

- particles;
- spell VFX;
- rune glow;
- ward boundary presentation;
- portal effects;
- magic audio.

Presentation reflects authoritative state.

---

# 54. UI and Accessibility

Document 17 owns final UI.

Document 09 exposes:

- personal mana;
- spell loadout;
- cast blockers;
- target validity;
- ward state;
- mana-network state;
- ritual stage;
- instability;
- portal state;
- corruption warning;
- magical treatment request result;
- movement-provider state;
- divination confidence metadata where allowed.

## 54.1 Progressive Disclosure

Magic UI should appear as magic is discovered.

Unknown schools and hidden spells should not be dumped onto the player at world start.

## 54.2 Accessibility

Critical magical state should not rely on:

- colour alone;
- flashing;
- screen distortion;
- camera shake;
- high-frequency particles;
- audio-only warning.

Support:

- text;
- icons;
- shape/pattern;
- captions;
- reduced effects;
- simplified targeting;
- hold/toggle alternatives;
- stronger warning modes.

---

# 55. Multiplayer Authority

Server/host owns:

- mana spend;
- spell cast commit;
- target resolution;
- rune state;
- enchantment commit;
- alchemy commit;
- ritual progress;
- summon creation;
- ward state;
- mana network;
- portal activation;
- magical persistent state.

Clients may:

- predict safe cast presentation;
- show aim;
- show local charge animation;
- request cast;
- receive authoritative result.

Clients may not:

- create mana;
- create spell output;
- teleport themselves;
- heal themselves;
- alter ward state;
- create summons;
- complete rituals.

---

# 56. LOD

Magic supports scalable simulation.

### M0 — Active Detailed
- casts;
- particles;
- local mana transfers;
- summons;
- wards;
- rituals;
- precise targeting.

### M1 — Local Reduced
- full authoritative state;
- reduced VFX;
- batched conduit updates.

### M2 — Settlement/Area Summary
- mana network summaries;
- ward coverage;
- service capacity;
- ritual milestones;
- protected magical entities remain explicit.

### M3 — Regional Summary
- major magical infrastructure;
- portal status;
- corruption;
- major rituals/events;
- bounded network flow.

### M4 — Dormant/Scheduled
- persistent state;
- next milestones;
- no frame simulation.

## 56.1 LOD Invariants

Distance cannot change:

- mana quantity;
- ward active/inactive truth;
- ritual cost;
- portal destination;
- summon existence;
- corruption;
- enchantment;
- committed treatment request;
- committed movement provider;
- historical magical event.

---

# 57. Persistence

Persist as required:

- known spells;
- magic progression;
- personal mana state;
- magical strain;
- external mana network;
- providers;
- buffers;
- purity/stability;
- runes;
- enchantments;
- ritual progress;
- wards;
- summons/bindings;
- portals;
- corruption;
- magical statuses;
- outstanding cross-domain effect requests;
- LOD state;
- transaction/evidence IDs;
- schema revisions.

Scene-node existence is not magic truth.

---

# 58. Migration

Migration must handle:

- v0.1/v0.2 magic IDs;
- old POC-only magical IDs;
- duplicate magical Block Items;
- mana network fields previously stored by Automation;
- healing scripts that directly edited Health;
- movement spells that directly wrote transforms;
- old trust/reputation magic fields;
- portal destination changes;
- old Divine-school entries;
- old necromancy/golemancy school identities;
- legacy Unreal paths;
- Forge source migration.

## 58.1 Divine Migration

Legacy “Divine” content should migrate to:

- one or more actual schools;
- cultural/sacred tags;
- ritual/tradition metadata.

## 58.2 Golemancy Migration

Legacy Golemancy school entries migrate to:

- Rune;
- Summoning;
- Automation integration tags.

## 58.3 Necromancy Migration

Legacy Necromancy school entries migrate to:

- Shadow;
- Summoning;
- Ritual;
- optional Blood/Alchemy tags;
- cultural/law risk tags.

---

# 59. Diagnostics

Recommended reason-code families:

| Code | Meaning |
|---|---|
| `MAG-DEF-001` | Missing/invalid magic definition. |
| `MAG-KNOW-001` | Knowledge/unlock missing. |
| `MAG-MANA-001` | Personal mana insufficient. |
| `MAG-MANA-002` | External mana unavailable. |
| `MAG-MANA-003` | Purity incompatible. |
| `MAG-MANA-004` | Stability unsafe. |
| `MAG-FOCUS-001` | Focus missing/incompatible. |
| `MAG-TGT-001` | Invalid target. |
| `MAG-RANGE-001` | Target out of range. |
| `MAG-LOS-001` | Required line/visibility blocked. |
| `MAG-COMP-001` | Material/component missing. |
| `MAG-ENV-001` | Environment incompatible. |
| `MAG-RUNE-001` | Rune/substrate/layout invalid. |
| `MAG-ENCH-001` | Enchantment compatibility failure. |
| `MAG-ALCH-001` | Alchemy process invalid. |
| `MAG-RIT-001` | Ritual site/stage invalid. |
| `MAG-RIT-002` | Participant requirement unmet. |
| `MAG-WARD-001` | Ward inactive/breached. |
| `MAG-SUM-001` | Summon/binding failed. |
| `MAG-PORT-001` | Portal destination/anchor invalid. |
| `MAG-MOVE-001` | Set 30/26 rejected movement effect. |
| `MAG-BIO-001` | Set 29 rejected treatment/biology request. |
| `MAG-SOC-001` | Social/consent/knowledge boundary blocked effect. |
| `MAG-AUTO-001` | Automation consumer unavailable/incompatible. |
| `MAG-LAW-001` | Hard legal/permission gate prevents action. |
| `MAG-CORR-001` | Corruption/forbidden risk threshold. |
| `MAG-LOD-001` | LOD reconciliation failed. |
| `MAG-SAVE-001` | Persistence/migration inconsistency. |
| `MAG-AUTH-001` | Unauthorised mutation. |
| `MAG-DUP-001` | Duplicate physical Block/Item identity. |
| `MAG-POC-001` | Retired POC dependency in production. |

---

# 60. Validation

## 60.1 Definition Validation

Check:

- qualified ID;
- owner;
- schema;
- schools;
- tags;
- costs;
- target;
- effect requests;
- physical refs;
- progression;
- production status;
- migration;
- presentation refs.

## 60.2 Cross-Domain Validation

A build fails if magic:

- writes Health directly;
- writes Trust directly;
- sets market price;
- writes a movement transform;
- moves a vessel;
- invents Block/Item identity;
- invents recipe output;
- creates settlement service from appearance;
- changes realm topology;
- bypasses authority.

## 60.3 Conservation Validation

Validate:

- personal mana;
- external mana;
- catalysts;
- ritual items;
- alchemy inputs/outputs;
- enchantment inputs;
- portal costs;
- mana network transfers.

---

# 61. Required Test Laboratories

## 61.1 Personal Casting Lab

Cast utility and combat spells.

Verify:

- mana spend;
- focus;
- targeting;
- interruption;
- cooldown;
- multiplayer authority.

## 61.2 External Mana Lab

Source → buffer → conduit → ward/machine.

Verify exact external mana conservation.

## 61.3 Block/Item Identity Lab

Pack/place:

- Mana Conduit;
- Mana Buffer;
- Ward Anchor.

Verify one canonical Block identity where recoverable.

## 61.4 Rune Lab

Inscription + compatibility + control.

Verify invalid target cannot accept rune.

## 61.5 Enchantment Lab

Apply/remove/migrate enchantment.

Verify Item identity remains Document 04-owned.

## 61.6 Alchemy Lab

Run magical recipe.

Verify Document 05 owns transformation transaction.

## 61.7 Ritual Lab

Interrupt, resume, fail and complete a multi-stage ritual.

Verify cost/evidence/persistent state.

## 61.8 Summoning Lab

Create/dismiss/bind summon.

Verify no duplicate entity/inventory.

## 61.9 Ward Lab

Damage conduit, drain mana, breach ward.

Verify coverage is authoritative, not visual.

## 61.10 Set 29 Healing Lab

Cast healing spell on:

- Health loss;
- bleeding;
- disease;
- toxin;
- fracture.

Verify Set 29 decides biological outcome.

## 61.11 Set 30 Movement Lab

Use:

- speed spell;
- levitation;
- glide assist;
- gravity field;
- portal.

Verify magic pays cost/provides capability; Set 30 executes physical displacement.

## 61.12 Set 28 Divination Lab

Use:

- remote viewing;
- truth ritual;
- translation;
- telepathy.

Verify Magic produces result/provenance; Set 28 controls knowledge/belief transfer.

## 61.13 Set 27 Economy Lab

Enchant an item and sell it.

Verify Document 09 creates enchantment, Set 27 decides price.

## 61.14 Automation Lab

Power a mana machine.

Verify 08 consumes Document-09 mana snapshot and no duplicate ledger.

## 61.15 Maritime Magic Lab

Use navigation, breathing, pump assist and vessel ward.

Verify Set 26 remains maritime physical owner.

## 61.16 POC Archive Lab

Run the old ward loop as regression.

Verify production does not require Forest Hamlet.

---

# 62. Performance

Magic performance controls may scale:

- VFX;
- particles;
- light count;
- conduit visualization;
- ward visualization;
- ritual effects;
- summon visual LOD;
- UI refresh;
- distant mana graph cadence.

They may not change:

- mana;
- spell outcome;
- ward truth;
- portal state;
- summon identity;
- treatment commit;
- movement capability;
- corruption;
- ritual result.

---

# 63. Godot / Summer Engine Direction

The replacement Document 18 owns exact implementation.

Document 09 requires:

- versioned Resources/data;
- MagicRegistry;
- SpellCastService;
- ManaService;
- ExternalManaGraphService;
- RuneService;
- EnchantmentService;
- AlchemyAdapter;
- RitualService;
- WardService;
- SummoningService;
- PortalMagicService;
- MagicMovementProviderAdapter;
- BiologicalTreatmentAdapter;
- SocialInformationAdapter;
- AutomationManaAdapter;
- deterministic transactions;
- multiplayer authority;
- save/migration;
- LOD;
- diagnostics;
- validation.

Summer Engine may assist code generation/testing under review.

---

# 64. Production Registry Families

Production registry families should include:

- school;
- domain tag;
- spell;
- cast profile;
- focus profile;
- mana provider;
- mana storage;
- mana conduit;
- rune;
- enchantment;
- alchemy magic profile;
- ritual;
- ritual role;
- ward;
- summon;
- binding;
- magical status;
- magical movement provider;
- treatment capability;
- divination capability;
- portal capability;
- corruption practice;
- law-facing magic facet;
- LOD profile;
- reason code;
- migration alias.

---

# 65. Cross-System Contract Summary

## 65.1 Documents 03–06

Magic consumes:

- Blocks;
- Items;
- Resources;
- transformations.

Magic supplies:

- magical capability;
- compatibility;
- cost;
- magical state.

## 65.2 Document 07

Magic consumes:

- mage identity/job;
- specialist availability;
- labour.

Magic supplies:

- specialist capability;
- teaching;
- ritual participation requirements.

## 65.3 Document 08

Magic supplies:

- mana provider state;
- rune/magic compatibility;
- magical fault state.

Automation supplies:

- machine demand;
- control intent;
- physical machine state.

## 65.4 Set 26

Magic supplies:

- maritime spells;
- wards;
- navigation/survival/rescue providers;
- vessel magic provider.

Set 26 supplies:

- vessel/water/environment context;
- physical maritime execution.

## 65.5 Set 27

Magic supplies:
- magical goods/services capability and committed outputs.

Set 27 supplies:
- price/value/contracts.

## 65.6 Set 28

Magic supplies:
- extraordinary information capability/result/provenance;
- magical communication channel;
- influence-status facts.

Set 28 supplies:
- belief/knowledge transfer;
- social consent/willingness;
- relationship consequence.

## 65.7 Set 29

Magic supplies:
- treatment/protection/exposure request.

Set 29 supplies:
- biological result.

## 65.8 Set 30

Magic supplies:
- movement provider;
- gravity/environment field;
- portal transition intent.

Set 30 supplies:
- physical movement/arrival/state.

---

# 66. Main-Document Reconciliation Requirements

| Document | Required Integration |
|---|---|
| 10 — Creatures | Magical creatures/summons/corruption consume Document-09 magic without duplicating mana/spell truth. |
| 12 — Structures | Magical sites expose semantic anchors and state, not independent magic logic. |
| 13 — Peoples/Cultures/Factions | Cultures/laws interpret magic; no ancestry determinism. |
| 14 — Dimensions | Portal/realm magic consumes realm topology and laws. |
| 15 — Quests/Events | Consume magic evidence; do not invent magic state. |
| 16 — Combat | Resolve magical attacks/counters through combat authority. |
| 17 — UI/UX | Consume magic view models. |
| 18 — Technical | Implement services/adapters in Godot/Summer. |
| 19 — Settlement | Planner consumes magical service/capability. |
| 20E | Facility activation consumes mana/ward/portal service from Document 09. |

---

# 67. POC Preservation and Archive

## 67.1 Archived Wrapper

Archived:

- fixed Forest Hamlet magical ruin;
- fixed mana pocket;
- fixed village mage;
- fixed watchtower ward target;
- fixed POC raid dependency;
- fixed broken portal teaser;
- POC-specific world coordinates.

## 67.2 Preserved Capability

Preserved:

- Raw Mana Crystal;
- Mana Shard;
- Mana Dust;
- Basic Rune;
- Rune Table;
- Small Mana Buffer;
- Mana Conduit;
- Basic Ward Anchor;
- Stone Sense;
- Spark Bolt;
- magical mentor;
- magical ruin/discovery;
- mana-powered infrastructure;
- magical settlement defence;
- rune automation;
- portal discovery;
- persistent magical consequence.

These survive where they pass the modern registry/admission process.

---

# 68. Production Acceptance Criteria

Document 09 v1.0 is accepted when:

- [x] the v0.2 magic school structure is preserved;
- [x] Divine is not a universal school;
- [x] necromancy/golemancy remain compound practices;
- [x] personal and external mana remain separate;
- [x] external mana is conserved;
- [x] magical Blocks/Items obey the canonical identity rule;
- [x] spellcasting uses deterministic validation/commit;
- [x] runes, enchantments, alchemy, rituals and summoning remain explicit systems;
- [x] Document 09 owns mana truth instead of Automation;
- [x] Set 29 owns biological healing/treatment outcome;
- [x] Set 30 owns physical movement execution;
- [x] Set 28 owns belief/rumour/social interpretation;
- [x] Set 27 owns economic value;
- [x] Set 26 extends magic into maritime play without creating duplicate schools;
- [x] portals preserve Document 14 realm ownership;
- [x] magic does not create settlement service from visuals;
- [x] Forge owns presentation/source assets;
- [x] POC fixed geography is archive-only;
- [x] reusable POC magic survives;
- [x] multiplayer authority is explicit;
- [x] LOD cannot change magical truth;
- [x] migration addresses old direct Health/transform/reputation writes;
- [x] Godot/Summer direction is current; and
- [x] Document 10 can reconcile against a stable magic/creature boundary.

---

# Appendix A — Spell Runtime Request

```yaml
spell_cast_request:
  cast_id: cast:<ulid>
  caster_ref: <entity>
  spell_ref: magic_spell:<id>
  target_refs: []
  origin_ref: <transform_or_anchor>
  focus_ref: <id>?
  component_reservation_refs: []
  personal_mana_revision: <rev>
  external_mana_provider_ref: <id>?
  world_time: <time>
  authority_revision: <rev>
```

---

# Appendix B — Spell Commit Result

```yaml
spell_cast_result:
  cast_id: cast:<id>
  commit_status: committed
  mana_spend_result: <record>
  component_commit_refs: []
  effect_request_refs: []
  magical_status_refs: []
  movement_provider_ref: <id>?
  biological_request_ref: <id>?
  information_result_ref: <id>?
  world_state_effect_ref: <id>?
  reason_codes: []
  magic_revision: <rev>
```

---

# Appendix C — External Mana Provider Snapshot

```yaml
external_mana_snapshot:
  provider_ref: mana_provider:<id>
  available_amount: <value>
  capacity: <value>
  throughput_available: <value>
  purity_band: <band>
  stability_band: <band>
  school_domain_tags: []
  owner_ref: <id>
  permission_state: allowed
  damage_state: <state>
  corruption_state: <state>
  source_revision: <rev>
  world_time: <time>
```

---

# Appendix D — Magical Treatment Capability

```yaml
magical_treatment_request:
  transaction_id: magic_treatment:<ulid>
  caster_ref: <id>
  target_ref: <id>
  spell_or_ritual_ref: <id>
  capability_tags:
    - treatment.stabilise
  potency_band: <band>
  duration: <value>
  committed_mana_ref: <id>
  committed_component_refs: []
  side_effect_tags: []
  corruption_tags: []
  source_magic_revision: <rev>
  world_time: <time>
```

Set 29 owns the resulting biological mutation.

---

# Appendix E — Divination Result

```yaml
divination_result:
  result_id: divination:<ulid>
  source_magic_ref: <id>
  caster_ref: <id>
  proposition_or_target_refs: []
  result_mode: symbolic
  guaranteed_truth: false
  confidence_ceiling: moderate
  interference_tags: []
  deception_vulnerability_tags: []
  observed_fact_refs: []
  symbolic_claim_payload_refs: []
  provenance_refs: []
  world_time: <time>
  magic_revision: <rev>
```

Set 28C determines how that information becomes knowledge/belief.

---

# Appendix F — Movement Provider Example

```yaml
magic_movement_provider:
  provider_id: movement_provider:<ulid>
  entity_ref: <id>
  magic_source_ref: spell:<id>
  capability_tags:
    - movement.levitation
  duration: 12s
  gravity_modifier_band: reduced
  allowed_modes:
    - airborne_magic
  mana_commit_ref: <id>
  source_revision: <rev>
```

Set 30 owns collision, velocity, path and authoritative transform.

---

# Appendix G — Ward Runtime Record

```yaml
ward_instance:
  ward_id: ward:<ulid>
  definition_ref: ward_definition:<id>
  anchor_refs: []
  coverage_ref: <spatial_definition>
  owner_ref: <id>
  mana_network_ref: <id>
  demand_band: <value>
  active_tags: []
  exclusions: []
  strength_band: <band>
  stability_band: <band>
  state: active
  breach_refs: []
  damage_refs: []
  revision: <rev>
```

---

# Appendix H — Rune Record

```yaml
rune_instance:
  rune_instance_id: rune:<ulid>
  rune_definition_ref: <id>
  substrate_ref: <block|item|structure>
  orientation_or_slot: <value>
  inscriber_ref: <id>
  quality_band: <band>
  charge_state: <state>
  mana_network_ref: <id>?
  owner_ref: <id>
  permission_ref: <id>
  active_state: <state>
  revision: <rev>
```

---

# Appendix I — POC Migration Map

| Legacy Element | Production Treatment |
|---|---|
| Raw Mana Crystal | Preserve subject to canonical Resource/Item registry. |
| Mana Shard | Preserve. |
| Mana Dust | Preserve. |
| Basic Rune | Preserve as generic early Rune. |
| Rune Table | Preserve as canonical Block/service. |
| Mana Furnace | Preserve as magitech machine consuming Document-09 mana + Document-08 automation. |
| Mana Battery | Magic-owned external mana storage; canonical Block if recoverable as itself. |
| Mana Conduit | Magic-owned mana network Block. |
| Ward Lantern / Ward Stone | Consolidate into ward-anchor family where production registry requires. |
| Stone Sense | Preserve early utility spell/capability. |
| Spark Bolt | Preserve early combat spell fixture. |
| Village Mage | Replace fixed person with generated/authorised magical specialist. |
| Magical Ruin | Replace fixed ruin with Atlas/worldgen magical-site family. |
| Broken Portal | Replace fixed teaser with generic realm/portal discovery content. |
| Forest Hamlet Ward Outcome | Archive as regression scenario; generic settlement defence capability remains. |

---

# Appendix J — Cross-System Responsibility Quick Reference

| Question | Owner |
|---|---|
| How much personal mana does this caster have? | Document 09 |
| How much mana is in this conduit/buffer? | Document 09 |
| Is this rune valid? | Document 09 |
| What item is the rune inscribed on? | Document 04 |
| What Block is this ward anchor? | Document 03 |
| Did the alchemy recipe consume/create Items? | Document 05 |
| Did a healing spell restore Health? | Set 29 |
| Did a levitation spell physically move the player? | Set 30 |
| Did a vessel magic effect move the ship? | Set 26 specialist vessel movement |
| Does the NPC believe the divination? | Set 28 |
| What is the spell service worth? | Set 27 |
| Did magical damage hit and kill the target? | Document 16 |
| Is the mage a persistent person? | Document 07 |
| Is the magic building functional? | Document 20 |
| Which magical project is built next? | Document 19 |
| Where did the leyline/ruin generate? | Document 11 / Atlas |
| Which realm is beyond the portal? | Document 14 / Atlas 24D |
| What does the player UI show? | Document 17 |
| How is the effect authored visually? | Forge |
| How is the runtime implemented? | Document 18 v1.0 |

---

# Appendix K — Definition of Done for Implemented Magic Foundation

The implementation is not complete because spells can cast.

A production milestone requires proof that:

- the same definition resolves consistently through stable IDs;
- personal mana persists correctly;
- external mana conserves across networks;
- automation cannot create duplicate mana;
- magical Blocks do not duplicate Item identities;
- spells cannot bypass target validation;
- spells cannot directly write another owner's state;
- healing routes through Set 29;
- movement routes through Set 30/26;
- divination routes through Set 28 information;
- economy uses Set 27 prices;
- runes persist;
- enchantments persist through Item migration;
- alchemy uses Document-05 transactions;
- rituals survive save/load and interruption;
- summons preserve entity identity;
- wards preserve real coverage and mana demand;
- portals preserve destination/authority;
- maritime magic preserves Set-26 ownership;
- LOD preserves exact important magical state;
- multiplayer prevents duplicate casts/resources;
- corruption and cleansing leave persistent evidence;
- low-end presentation settings do not alter magic truth;
- POC fixtures remain available for regression but absent from shipping worldgen;
- diagnostics explain every blocked spell/network/ritual; and
- no legacy direct Health/Trust/transform mutations remain in production code.

---

# Completion Statement

**Document 09 v1.0 reconciles Leyforge's practical-magic vision with the production registry architecture, maritime expansion and final economy/social/biology/movement ownership model.**

The original magic identity remains intact:

- physical;
- discoverable;
- useful;
- dangerous when appropriate;
- culturally interpreted;
- infrastructure-capable;
- deeply connected to civilisation.

The production system is now explicit about what magic owns and what it does not.

**Document 09 owns magical capability, mana, spells, runes, enchantments, rituals, wards, summoning, portals and magical persistent state.**

When magic reaches into another system:

- Set 27 decides economic value;
- Set 28 decides social knowledge/belief/willingness;
- Set 29 decides biological outcome;
- Set 30/Set 26 decide physical movement;
- Document 16 decides combat outcome;
- Document 20 decides settlement service capability;
- Document 14 decides realm truth.

That keeps magic extraordinarily powerful without allowing it to become a hidden duplicate implementation of the rest of Leyforge.

**Next foundation reconciliation dependency: Document 10 — Creatures and Monsters v1.0.**
