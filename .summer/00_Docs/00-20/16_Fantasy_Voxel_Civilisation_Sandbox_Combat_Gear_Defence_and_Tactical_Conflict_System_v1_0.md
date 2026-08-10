# LEYFORGE

## 16 — Combat, Gear, Defence and Tactical Conflict System

### Action Combat, Weapons, Armour, Shields, Defence Resolution, Tactical Conditions, Downing, Death, Fortifications, Siege, Major Threat Integration and Persistent Combat Evidence

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `16_Fantasy_Voxel_Civilisation_Sandbox_Combat_Gear_and_Defence_System_v0_1` for active production direction  
**Primary Vision Authority:** Documents 00–02 v1.0  
**Physical Identity:** Documents 03–06 v1.0  
**Persistent People:** Document 07 v1.0  
**Automation:** Document 08 v1.0  
**Magic:** Document 09 v1.0  
**Creatures / Ecology:** Document 10 v1.0 + Atlas 24F  
**World / Terrain:** Document 11 v1.0  
**Structures / Fortifications:** Document 12 v1.0 + Atlas 24I  
**Civilisation / Law / War State:** Document 13 v1.0 + Atlas 24E  
**Realms / Physical-Law Context:** Document 14 v1.0 + Atlas 24D  
**Quest / Event / Contribution:** Document 15 v1.0 + Atlas 24K  
**Major Threat Content Authority:** Atlas 24H  
**Dungeon / Site Context:** Atlas 24G  
**Equipment Item Authority:** Document 04 v1.0  
**Progression Authority:** Document 02 v1.0  
**Settlement Defence Function:** Documents 19–20  
**Maritime Tactical Combat Authority:** Set 26L, with 26K strategic context and 26M marine ecology  
**Economy Boundary:** Set 27  
**Dialogue / Social / Surrender Negotiation Boundary:** Set 28  
**Biological State Boundary:** Set 29  
**Movement / Physical Displacement Boundary:** Set 30, with Set 26E aquatic movement and Set 26 vessel movement  
**Production Governance:** Set 25  
**Engine Direction:** Godot + Summer Engine  
**Project Lead and Final Authority:** Ash

A production-scale action-combat and tactical-defence system for Leyforge in which fighting is readable, physical, preparation-sensitive and connected to the living world. Combat determines actions, hits, defences and immediate tactical outcomes; the systems that own bodies, movement, equipment, structures, politics, ecology and economy commit their own resulting state.

> **Combat System Statement**
>
> **Combat is a contextual action-survival layer inside the sandbox, not a detached minigame and not the universal owner of danger. The player may fight, block, parry, dodge, shoot, cast, command, fortify, surrender, capture, retreat, rescue, prepare, negotiate or avoid. Combat determines what happened tactically; the living world determines what that result means afterward.**

> **Damage / Biology Rule**
>
> **Document 16 owns attack resolution, defence resolution and the authoritative final combat damage packet. Set 29 owns biological Health, Injury, Bleeding, Blood Loss, Disease, Poison and biological recovery. Combat tells Biology what resolved trauma/exposure reached the actor; Biology owns what happened to the body.**

> **Combat / Movement Rule**
>
> **Combat may declare action movement envelopes, dodge states, knockback, launches, recoil, hit reactions and movement locks, but Set 30 or the appropriate specialist movement owner performs physical displacement. Combat never teleports, directly sets velocity or writes transforms outside the movement interface.**

> **Gear Identity Rule**
>
> **A sword, bow, shield, helmet or armour piece is one canonical Item defined by Document 04. Document 16 contributes combat-facing facets and emits wear/damage requests. It does not create a second Combat Gear Registry entry that duplicates the Item's identity, material, ownership, durability or inventory state.**

> **Major Threat Rule**
>
> **Atlas 24H owns authored boss, titan, siege-threat and realm-guardian identity, world role, territory, encounter package, alternate outcomes, aftermath and recurrence. Document 16 owns the exact action-combat execution those packages consume. A boss is never defined here merely as an enlarged Health bar.**

> **Victory Is Objective-Driven Rule**
>
> **Combat victory may mean escape, rescue, escort completion, defence, surrender, capture, retreat, disabling, objective denial, protection, containment or negotiated cessation. Killing every opponent is not the universal success condition.**

---

# Document Purpose

Document 16 defines Leyforge's authoritative **character-scale combat action, defence and tactical resolution layer**.

The original v0.1 established a broad and valuable design:

- first-person and third-person support;
- free aim and optional lock-on;
- light/heavy attacks;
- blocking and parrying;
- dodging;
- melee/ranged/magic integration;
- physical ammunition;
- armour, shields and equipment load;
- damage types;
- penetration;
- weak points;
- critical openings;
- status buildup;
- equipment condition and repair;
- stealth-facing combat readiness;
- NPC tactical roles;
- guards and militia;
- fortifications;
- raids;
- siege;
- bosses;
- surrender/capture;
- PvP;
- accessibility;
- persistent aftermath.

Those capabilities remain.

The reconciliation changes **ownership**, especially after Sets 26–30.

The old combat document contained broad ownership over:

- Health;
- Stamina;
- injuries;
- bleeding;
- poison/disease;
- healing;
- exhaustion;
- movement penalties;
- morale;
- raid lifecycle;
- gear state;
- boss identity.

Those areas now have clearer specialist authorities.

Version 1.0 therefore preserves combat depth while removing duplicate mutable truth.

---

# 1. Locked Combat Identity

Document 16 owns:

- Combat Action definitions;
- action-phase runtime;
- attack definitions;
- hit generation;
- hit validation;
- attack timing;
- attack reach/arc/shape;
- weapon-combat facet interpretation;
- projectile-combat definitions and projectile attack resolution;
- defence definitions;
- block;
- parry;
- active guard;
- tactical evasion result;
- armour combat-mitigation interpretation;
- shield combat behaviour;
- penetration;
- protection sequencing;
- final combat Damage Packets;
- combat attack source/attribution;
- tactical Guard/Stability;
- stagger/guard-break;
- combat interruption;
- tactical openings;
- weak-point combat resolution;
- combat-owned short tactical conditions;
- combat action locks;
- combat-facing equipment wear requests;
- downed state;
- combat death decision;
- combat defeat state;
- surrender-combat cessation state;
- combat capture handoff;
- combat encounter runtime once engagement exists;
- tactical NPC combat-role execution;
- local formation combat behaviour;
- fortification combat-facing capability;
- structure Damage Packet generation;
- siege character/structure-combat primitives outside specialist naval ownership;
- combat contribution evidence;
- combat logs/evidence;
- combat LOD and abstract tactical resolution;
- multiplayer combat authority;
- combat diagnostics and validation.

---

# 2. What Document 16 Does Not Own

Document 16 does not own:

- biological Health storage — Set 29;
- Stamina pool/regeneration/Fatigue — Set 29;
- Injury/Wound/Bleeding/Blood Loss/Pain — Set 29E;
- Disease/Poison/Toxin state — Set 29F;
- healing/treatment action validity — Set 29G;
- ordinary movement/locomotion — Set 30;
- actual dodge displacement — Set 30;
- actual knockback/launch displacement — Set 30;
- fall physics — Set 30D;
- aquatic movement — Set 26E;
- vessel movement — Set 26;
- canonical Item identity/durability storage — Document 04;
- recipe/repair transformation — Document 05;
- material identity — Document 06;
- spell casting/mana/magical status truth — Document 09;
- creature/ecology identity — Document 10/24F;
- person identity/faction — Documents 07/13;
- Trust/Fear/Loyalty/persuasion — Set 28;
- political war/treaty state — Document 13;
- quest/event lifecycle — Document 15;
- structure identity/condition aggregation — Document 12;
- settlement service function — Document 20;
- boss/threat authored identity and world role — 24H;
- vessel-scale naval combat, flooding/fire/boarding encounter ownership — 26L;
- price/value/loot economics — Set 27;
- final UI — Document 17.

---

# 3. Core Combat Promise

Leyforge combat should reward:

- player timing;
- positioning;
- preparation;
- equipment;
- terrain;
- knowledge;
- allies;
- supplies;
- scouting;
- fortifications;
- magic;
- automation;
- social/political context;
- progression.

No single:

- level;
- armour number;
- weapon tier;
- boss HP value

should decide every encounter.

---

# 4. Combat Is Optional but Deep

Combat is a major playstyle.

It is not mandatory for every player.

World systems support:

- avoidance;
- deterrence;
- diplomacy;
- stealth;
- surrender;
- capture;
- rescue;
- relocation;
- sealing;
- cleansing;
- construction;
- defence;
- economic solutions;
- political solutions.

Peaceful settings preserve the rest of Leyforge.

---

# 5. Perspective

Support:

- first-person;
- third-person.

The combat model must remain mechanically consistent across both.

Perspective changes:

- camera;
- presentation;
- reticle;
- targeting assistance.

It does not change the underlying hit truth.

---

# 6. Input Vocabulary

Core actions may include:

- primary/light attack;
- secondary/heavy attack;
- alternate weapon action;
- block/guard;
- parry/counter;
- dodge;
- aim;
- ranged draw/release;
- reload;
- weapon ability;
- use quick item;
- cast;
- contextual interaction;
- surrender;
- command;
- target lock;
- target cycle.

All bindings remain configurable.

---

# 7. Combat State

Recommended high-level states:

- `unengaged`
- `ready`
- `aiming`
- `attacking`
- `guarding`
- `parrying`
- `dodging`
- `recovering`
- `staggered`
- `guard_broken`
- `downed`
- `surrendered`
- `captured`
- `dead`

These are tactical states.

They do not replace biological state.

---

# 8. Combat Action Architecture

A Combat Action has:

- definition;
- actor;
- equipment/provider;
- input or AI intent;
- target/aim;
- phases;
- resource requests;
- movement request;
- hit generation;
- defence interactions;
- effect requests;
- cancellation rules;
- authority.

---

# 9. Combat Action Definition

```yaml
combat_action_definition:
  action_id: leyforge.core.combat_action.<path>
  schema_version: 1
  action_family: <family>
  equipment_requirement_refs: []
  capability_requirement_refs: []
  stance_requirements: []
  target_profile_ref: <id>
  phases: []
  stamina_cost_profile_ref: <set29_ref>?
  mana_cost_profile_ref: <document09_ref>?
  ammo_requirement_ref: <inventory_ref>?
  movement_envelope_ref: <set30_provider_ref>?
  attack_profile_refs: []
  defence_profile_refs: []
  tactical_condition_requests: []
  animation_presentation_ref: <forge_ref>
  interrupt_profile_ref: <id>
  production_status: <state>
```

---

# 10. Action Phases

Typical phases:

1. Start / Intent
2. Wind-up
3. Commit
4. Active
5. Recovery
6. End

Optional:

- charge;
- channel;
- reload;
- hold;
- follow-through;
- cancel branch.

---

# 11. Action Commitment

Actions must have readable commitment.

Players should understand:

- when action can cancel;
- when stamina/ammo commits;
- when hit becomes active;
- when recovery begins.

---

# 12. Input Buffering

Short configurable input buffering is supported.

It must not:

- auto-chain indefinitely;
- queue hidden actions;
- override stun/downed state.

---

# 13. Animation Authority

Animation presents authorised action.

Animation may expose:

- hit-window marker;
- foot-contact marker;
- release marker;
- reload marker.

Animation cannot authoritatively:

- deal damage;
- spend ammo;
- move the actor outside bounded movement ownership;
- complete parry.

---

# 14. Root Motion

Bounded root motion may be used for presentation/action shape only through Set 30's authorised action-movement interface.

Combat supplies:

- requested displacement envelope;
- direction;
- timing;
- cancel state.

Set 30 validates actual displacement.

---

# 15. Combat / Set 29 Stamina Boundary

Document 16 defines **base combat exertion requirements**.

Set 29 owns:

- current Stamina;
- Stamina regeneration;
- Fatigue;
- biological modifiers;
- cost transaction.

Flow:

**Combat requests action cost**  
→ **Set 29 validates/commits Stamina**  
→ **Combat begins action if approved**

---

# 16. No Combat Stamina Pool

Document 16 must not maintain a second Stamina value.

---

# 17. Guard / Stability

Combat retains a tactical **Guard/Stability** channel distinct from Stamina.

It represents:

- posture;
- weapon/shield control;
- guard integrity;
- resistance to stagger/guard break.

It is short-term tactical state.

---

# 18. Guard/Stability Sources

May depend on:

- shield;
- weapon;
- stance;
- armour combat facet;
- bracing;
- formation;
- terrain/support;
- action;
- perk;
- magic.

Set 29's biological impairment may modify effective capability.

---

# 19. Guard Break

When guard capacity is exceeded:

- block fails or becomes partial;
- guard-broken state begins;
- action may interrupt;
- tactical opening may occur.

No automatic permanent injury is implied.

---

# 20. Mana Boundary

Document 09 owns:

- mana;
- spell definitions;
- cast validity;
- magical statuses;
- wards.

Document 16 consumes magical attack/defence effect requests where they enter combat.

---

# 21. Combat Casting

Combat may enforce:

- interruption;
- target lock;
- action commitment;
- line/aim;
- combat movement cap.

Document 09 remains spell owner.

---

# 22. Damage Types

The original broad damage vocabulary remains supported:

- slash;
- pierce;
- blunt;
- impact;
- siege;
- fire;
- frost/cold;
- shock/lightning;
- arcane;
- light;
- shadow;
- spirit;
- corruption;
- void;
- other registered specialist tags.

Damage types are tags/components.

They are not separate Health pools.

---

# 23. Damage Packet Principle

Combat produces one authoritative final packet per resolved hit/effect segment.

---

# 24. Damage Packet

```yaml
combat_damage_packet:
  packet_id: combat_damage:<ulid>
  source_actor_ref: <id>?
  source_item_ref: <id>?
  source_action_ref: <id>
  source_magic_ref: <id>?
  source_projectile_ref: <id>?
  owner_faction_ref: <id>?
  target_ref: <id>

  hit:
    hit_region_ref: <id>?
    contact_position: <vector>
    contact_normal: <vector>
    weak_point_ref: <id>?

  resolved:
    damage_components: []
    penetration_values: []
    blocked_components: []
    mitigated_components: []
    final_damage_amount: <value>
    trauma_tags: []
    exposure_requests: []
    tactical_condition_requests: []
    movement_impulse_request_ref: <id>?

  authority:
    friendly_fire_class: <class>
    permission_result_ref: <id>
    world_time: <time>
    combat_revision: <rev>
```

---

# 25. Damage Resolution Order

Recommended:

**Action Valid**  
→ **Hit Generated**  
→ **Target Contact**  
→ **Defence Window**  
→ **Shield/Active Defence**  
→ **Armour / Protection**  
→ **Ward / Specialist Protection**  
→ **Penetration / Resistance**  
→ **Final Damage Packet**  
→ **Owning Target System Applies Consequence**  
→ **Tactical Conditions / Impulse Requests**  
→ **Evidence**

Exact ordering for magic/armour interactions is definition-driven but deterministic.

---

# 26. Biological Damage Application

For biological actors:

Document 16 sends final resolved damage to Set 29.

Set 29:

- applies Health change;
- resolves trauma/injury eligibility;
- resolves wound/bleeding;
- resolves biological exposure requests.

Document 16 receives a biological result snapshot.

---

# 27. Health Boundary

Set 29 owns:

- current Health;
- maximum Health;
- Health recovery.

Combat may query Health.

Combat cannot directly mutate Health.

---

# 28. Combat / Biology Contract

Document 16 sends:

- final damage;
- damage tags;
- trauma;
- hit region;
- exposure;
- source;
- event ID.

Set 29 returns:

- Health state;
- injury impairment;
- bleeding;
- poison/disease state;
- Stamina modifier;
- CriticalCondition;
- Stabilised;
- RecoveryPossible.

---

# 29. Injury Boundary

Persistent injury belongs to Set 29E.

Combat does not create:

- fracture status;
- deep wound status;
- bleed DOT status

as separate authoritative combat conditions.

---

# 30. Ordinary Hits and Injury

Most ordinary hits can reduce Health without creating a lasting Injury.

Set 29E decides injury threshold.

---

# 31. Bleeding

Legacy `status.bleeding` migrates to:

- injury-linked bleeding under 29E;
- or an explicit temporary compatibility effect routed into 29E.

Combat does not own Blood Loss.

---

# 32. Poison and Venom

Combat attack may submit:

- toxin definition;
- dose;
- route;
- event ID.

Set 29F owns:

- Toxin Load;
- poison progression;
- biological symptoms.

---

# 33. Disease

Combat can produce disease exposure only if a valid source exists.

Disease state remains Set 29F.

---

# 34. Burns and Frost Injury

Combat/environment/magic can submit physical/thermal trauma.

Set 29E decides whether persistent burn/frost Injury forms.

---

# 35. Healing Boundary

Combat may provide an action context for:

- use bandage;
- use medicine;
- drink potion;
- battlefield treatment.

Set 29G owns treatment validation/outcome.

---

# 36. Magical Healing

Document 09 owns cast/mana.

Set 29G validates treatment capability.

Combat only provides action interruption and downed-state permission.

---

# 37. Emergency Care / Downed Interface

Document 16 exposes:

- whether actor is downed;
- whether treatment/revive action is allowed;
- rescue window;
- combat interruption risk.

29G may heal/stabilise within that permission.

It does not decide death/revival.

---

# 38. Downed State

Downed is a Combat-owned defeat state.

Possible modes:

- disabled;
- enabled for players;
- enabled for party;
- enabled for NPCs;
- world-setting controlled.

---

# 39. Downed Does Not Mean Dead

A downed actor can be:

- unconscious/incapacitated;
- surrender-capable;
- stabilisable;
- revivable;
- capturable.

---

# 40. Downed Entry

Downed entry may depend on:

- Health threshold/result;
- CriticalCondition;
- world settings;
- actor category;
- protective capability;
- current encounter.

---

# 41. Death Ownership

Document 16 owns the final combat downing/death rule.

Set 29 does not own death.

---

# 42. Combat Death Decision

Inputs:

- biological Health/CriticalCondition;
- downed state;
- rescue window;
- combat execution event;
- world settings;
- actor protection;
- special boss/quest rules.

Output:

- alive;
- downed;
- dead;
- defeated-nonlethal.

---

# 43. Person Persistence After Death

Persistent person identity remains Document 07-owned.

Combat returns death evidence.

Document 07/13/15/28 consume it.

---

# 44. Creature Death

Document 10 consumes death evidence to update:

- population;
- carcass;
- ecology.

---

# 45. Player Death

Player death/recovery may include:

- respawn;
- tombstone;
- inventory recovery;
- safe checkpoint;
- world setting;
- permadeath option.

Combat owns trigger/defeat state.

Technical/UI/inventory owners execute their respective pieces.

---

# 46. Revival

Revival is not assumed universal.

If available, it may require:

- downed state;
- valid treatment;
- magic;
- item;
- ally;
- structure;
- time.

True resurrection after death requires explicit high-level design.

---

# 47. Tactical Conditions

Combat may own short-lived tactical conditions such as:

- staggered;
- guard broken;
- exposed;
- vulnerable opening;
- interrupted;
- suppressed;
- disarmed;
- counter-ready;
- off-balance;
- pinned-by-guard;
- brace broken.

---

# 48. Tactical Conditions Are Not Biology

Combat conditions should normally:

- resolve quickly;
- affect action rules;
- not persist as long-term bodily truth.

---

# 49. External Status Ownership

Examples:

| Condition | Owner |
|---|---|
| Bleeding | Set 29E |
| Fracture | Set 29E |
| Poisoned | Set 29F |
| Disease | Set 29F |
| Exhausted / Fatigue | Set 29B |
| Magical curse | Document 09 |
| Corruption magical state | Document 09 |
| Trust / fear relationship | Set 28 |
| Slowed movement consequence | Set 30 consumes source modifier |
| Guard Broken | Document 16 |
| Staggered | Document 16 |

---

# 50. Status Buildup

Combat may support **attack-side buildup** as a delivery method.

Example:

Repeated frost attacks produce a frost exposure request.

The persistent resulting state belongs to the relevant owner.

---

# 51. Hard Control

Repeated hard-control effects need diminishing resistance or immunity windows.

Examples:

- stun;
- stagger;
- knockdown;
- disarm.

Exact rules are Combat-owned when tactical.

---

# 52. Movement Control Boundary

Combat can request:

- movement lock;
- movement cap;
- root-like movement restriction;
- launch;
- knockback;
- recoil.

Set 30 applies physical movement/state.

---

# 53. Root / Entangle

If an effect physically prevents locomotion:

- source owner defines effect;
- Combat may treat action implications;
- Set 30 enforces movement restriction.

---

# 54. Knockback

Combat owns:

- cause;
- magnitude request;
- direction intent;
- source;
- tags.

Set 30 owns:

- actual velocity/displacement;
- collision;
- fall transition;
- landing.

---

# 55. Launch

Explosion/large creature attacks may request launch.

Set 30D owns airborne physical response.

---

# 56. Fall Damage Boundary

Set 30D produces impact facts.

Combat/hazard system may provide source context.

Set 29 owns resulting Health/Injury consequences through the agreed damage/trauma path.

---

# 57. Dodge

Combat owns:

- dodge action;
- eligibility;
- timing;
- defence window;
- invulnerability/evasion semantics where used;
- stamina request;
- action lock.

Set 30 owns:

- physical dodge displacement.

---

# 58. Dodge Defence

A dodge may defend by:

- moving outside hit volume;
- brief explicit evasion window;
- both.

Rules must be readable.

---

# 59. No Infinite I-Frame Chain

Repeated dodges consume real Stamina and respect:

- recovery;
- action state;
- Set 29 limits.

---

# 60. Block

Block uses:

- coverage;
- angle;
- active guard;
- shield/weapon;
- Guard/Stability;
- Stamina request;
- attack type.

---

# 61. Block Outcomes

- full;
- partial;
- penetrated;
- guard break;
- unblockable;
- deflected.

---

# 62. Parry

Parry is a timing-based active defence.

It may create:

- deflection;
- attacker stagger;
- critical opening;
- projectile deflect where eligible.

---

# 63. Parry Accessibility

Timing windows can be widened by:

- accessibility;
- difficulty;
- progression;
- equipment.

Server remains authoritative.

---

# 64. Shield Families

Preserve the original broad shield identities:

- buckler;
- light shield;
- heater/medium shield;
- tower/heavy shield;
- rune/ward shield;
- improvised shield.

Actual shields remain Document-04 Items.

---

# 65. Shield Combat Facet

May expose:

- coverage;
- angle;
- guard support;
- stability;
- parry class;
- bash action;
- projectile capability;
- item wear multiplier;
- movement-handling tags.

---

# 66. Armour

Armour protects through combat-facing facets.

Document 04 owns the Item.

Document 16 owns combat mitigation interpretation.

---

# 67. Armour Classes

Preserve broad classes:

- Light
- Medium
- Heavy
- Robe/Ritual
- Workwear
- Environmental
- Hybrid/Cultural

These are descriptive combat/equipment roles, not rigid classes.

---

# 68. Armour Coverage

Coverage may be:

- region;
- angle;
- layer;
- equipment slot.

Set 29's biological body-region profile supplies valid target regions.

---

# 69. Armour Mitigation

Armour can contribute:

- flat/curve mitigation;
- penetration resistance;
- type resistance;
- Guard/Stability;
- weak-point coverage;
- exposure protection.

---

# 70. Protection Bundle

Set 29 uses a **Protection Bundle** for biological exposure mitigation.

Document 16 may supply resolved combat armour defence facts to that bundle where appropriate.

Combat does not own biological resistance state.

---

# 71. Penetration

Penetration compares attack penetration to:

- shield;
- armour;
- material;
- ward;
- structure.

Rules should avoid simple “higher tier always ignores lower tier.”

---

# 72. Weak Points

Weak points may be:

- anatomy;
- equipment gap;
- exposed mechanism;
- magical focus;
- boss component;
- structure point.

---

# 73. Weak Point Ownership

Content owner defines the weak-point relationship.

Combat resolves hit/use.

Example:

24H defines a boss component as an encounter vulnerability.

Document 16 resolves damage against it.

---

# 74. Critical Openings

Criticals should be earned through:

- weak point;
- parry;
- guard break;
- rear/flank;
- stun;
- preparation;
- status interaction;
- mechanic resolution.

Avoid universal random critical chance as the only system.

---

# 75. Critical Damage

Exact critical multipliers are balance data.

---

# 76. Resistances

Resistance definitions may come from:

- Item armour;
- creature profile;
- magic;
- realm state;
- structure material.

Combat resolves only the combat-facing mitigation.

---

# 77. Diminishing Resistance

Stacked resistance should use bounded/diminishing rules.

Avoid trivial 100% immunity from ordinary stacking.

---

# 78. Conditional Immunity

Immunity may be valid for:

- anatomy;
- construct;
- spirit;
- boss phase;
- ward;
- realm law;
- specialised gear.

It must have an explicit source.

---

# 79. Melee Weapon Families

Examples retained from v0.1 direction:

- sword;
- axe;
- mace/hammer;
- spear;
- polearm;
- dagger;
- staff;
- club;
- improvised;
- tool-weapon;
- magical hybrid.

Content roster belongs to Document 04.

---

# 80. Weapon Combat Facet

```yaml
combat_weapon_facet:
  item_ref: <document04_item>
  weapon_family_ref: <id>
  grip_modes: []
  moveset_refs: []
  attack_profile_refs: []
  reach_profile_ref: <id>
  handling_profile_ref: <id>
  guard_profile_ref: <id>?
  structure_attack_tags: []
  ammo_or_charge_ref: <id>?
  wear_profile_ref: <id>
```

---

# 81. Weapon Identity

A weapon's Item record owns:

- name;
- material;
- quality;
- rarity;
- durability;
- ownership;
- enchantments;
- inventory.

Combat owns how that weapon behaves during fighting.

---

# 82. Light Attack

Generally:

- quick;
- lower commitment;
- lower Stamina request;
- combo-compatible.

Exact values remain moveset data.

---

# 83. Heavy Attack

Generally:

- longer commitment;
- higher Stamina request;
- higher Guard damage/penetration;
- stronger opening risk.

---

# 84. Thrust

Thrusts favour:

- linear reach;
- precision;
- pierce;
- narrow hit shape.

---

# 85. Sweep

Sweeps favour:

- arc coverage;
- multi-target;
- space control.

Friendly fire may matter.

---

# 86. Overhead

Overhead actions may favour:

- armour/Guard pressure;
- vertical weak points;
- structure/tool crossover.

---

# 87. Bash

Shield/weapon bash may:

- stagger;
- interrupt;
- reposition request;
- create opening.

---

# 88. Sprint Attack

Combat defines attack timing.

Set 30 supplies sprint/movement state.

Set 29 supplies Stamina.

---

# 89. Jump / Airborne Attack

Combat can permit attack while airborne.

Set 30 retains movement.

---

# 90. Dual Wielding

Dual wielding is limited by:

- compatible items;
- moveset;
- load;
- skill;
- off-hand action conflicts.

Not every one-handed item can dual wield.

---

# 91. Two-Handing

Two-hand stance may alter:

- damage;
- Guard;
- reach;
- handling;
- off-hand availability.

---

# 92. Weapon Mastery

Document 02 owns skill progression.

Document 16 consumes:

- proficiency;
- unlocked moveset branches;
- efficiency modifiers.

---

# 93. Skill Cannot Bypass Physics

Mastery does not:

- increase sword reach through walls;
- ignore missing ammo;
- bypass armour automatically.

---

# 94. Ranged Weapon Families

Support:

- bows;
- crossbows;
- slings;
- thrown weapons;
- cultural launchers;
- rare magitech;
- specialist siege weapons.

---

# 95. Physical Ammunition

Ammunition is real inventory.

Combat requests an authoritative item consumption/reservation.

---

# 96. No Free NPC Ammunition

NPCs should use real ammunition where the simulation requires it.

Distant abstraction must conserve stock.

---

# 97. Quivers

Quiver/container identity belongs to Document 04.

Combat can consume its access/handling facet.

---

# 98. Bow Draw

Bow actions may use:

- draw duration;
- movement/aim stability;
- release timing;
- stamina request;
- ammo reservation.

---

# 99. Crossbow Reload

Reload is an explicit action.

It may be interrupted.

---

# 100. Projectile Definition

Combat projectile may contain:

- launch velocity;
- gravity;
- drag;
- collision;
- penetration;
- embed;
- lifetime;
- recoverability;
- payload.

---

# 101. Projectile Ownership

Combat owns attack projectile simulation unless another specialist system explicitly owns the projectile.

Player movement Set 30 does not need to own ordinary arrows.

---

# 102. Projectile Recovery

Arrows/bolts may:

- break;
- embed;
- recover;
- be lost.

Document 04 owns resulting Item state.

---

# 103. Special Ammunition

Examples:

- fire;
- rope;
- ward;
- blunt;
- armour-piercing;
- alchemical;
- magical.

Effects route through owning systems.

---

# 104. Aim Assistance

Options may include:

- reticle magnetism;
- lead assistance;
- lock-on;
- target cycling;
- weak-point assist.

Authoritative hit remains validated.

---

# 105. Stealth Boundary

Document 16 does not own the entire world's perception.

Actor systems provide:

- senses;
- detection evidence;
- knowledge.

Combat owns transition into tactical alert/engagement.

---

# 106. Detection Inputs

May include:

- sight;
- sound;
- movement;
- lighting;
- cover;
- scent/track;
- magic;
- disguise;
- faction/context.

Owning systems determine perception.

---

# 107. Combat Alert States

Examples:

- unaware;
- suspicious;
- investigating;
- alerted;
- engaged;
- searching;
- disengaging.

---

# 108. Drawing Weapons

Weapon-ready state may generate:

- social evidence;
- law evidence;
- threat response.

Set 28/13 decides social/legal meaning.

---

# 109. Surprise

Surprise may affect:

- reaction window;
- Guard readiness;
- initiative/action availability.

It should not guarantee instant kill.

---

# 110. Ambush

Ambush must still use:

- actual positions;
- perception;
- attack rules.

---

# 111. Crime Boundary

Combat emits evidence such as:

- assault;
- damage;
- kill;
- friendly fire;
- trespass attack;
- surrendered target harmed.

Document 13 owns legal classification.

---

# 112. Witnesses

Set 28 owns who knows/believes the event.

Combat provides observable evidence.

---

# 113. Surrender

Combat owns tactical surrender state:

- actor ceases hostile actions;
- weapons may lower/drop;
- target becomes non-hostile unless violated.

Set 28 resolves social negotiation.

Document 13 resolves legal/political terms.

---

# 114. Surrender Is Not Mind Control

An opponent may refuse surrender based on:

- AI/social context;
- orders;
- escape route;
- goals.

Combat does not force social agreement.

---

# 115. Capture

Combat may establish:

- incapacitated;
- restrained-ready;
- tactical custody handoff.

Document 13/28/07 owns longer-term prisoner/legal/social state.

---

# 116. Non-Lethal Combat

Actions may be tagged:

- nonlethal;
- restraining;
- stun/control;
- disabling.

Non-lethal attack still can be dangerous under circumstances.

---

# 117. Friendly Fire

World/session settings control:

- players;
- NPCs;
- pets;
- structures;
- traps;
- spells;
- siege.

Combat validates target permission before committing damage where applicable.

---

# 118. PvP

PvP disabled by default in cooperative worlds unless enabled.

Duels can be separate consented mode.

---

# 119. PvP Authority

Server validates:

- action;
- position;
- timing;
- permission;
- target;
- hit;
- Damage Packet.

---

# 120. Gear Slots

Preserve the broad equipment-slot model:

- Head
- Chest
- Hands
- Legs
- Feet
- Main Hand
- Off-Hand
- Back
- Belt/Utility
- Cloak
- Accessories
- Specialised equipment contexts

Document 04 owns the actual equipment records/slot inventory.

---

# 121. Combat Equipment Load

Document 04 supplies declared load bands.

Set 29 applies physiological Stamina/Fatigue consequences.

Set 30 applies movement consequences.

Document 16 may apply combat-handling consequences.

---

# 122. Load Bands

Set 29 uses:

- Unburdened
- Light
- Standard
- Heavy
- Overloaded

Combat should consume the same source rather than invent another weight scale.

---

# 123. Heavy Armour

Potential combat strengths:

- mitigation;
- Guard/Stability;
- stagger resistance;
- formation defence.

Potential external trade-offs are resolved by Set 29/30.

---

# 124. Robes / Ritual Gear

Potential:

- focus;
- mana;
- ward;
- ritual compatibility.

Document 09 owns magic.

---

# 125. Environmental Gear

Potential:

- heat;
- cold;
- poison;
- pressure;
- underwater;
- realm protection.

Set 29/26/14 owns environmental consequence.

---

# 126. Quality

Quality belongs to Item state/definition.

Combat consumes quality-derived handling/defence facets.

---

# 127. Rarity

Rarity communicates unusual origin/effects.

It is not a universal damage multiplier.

---

# 128. Cultural Gear

Culture may influence:

- form;
- moveset teaching;
- crafting;
- social recognition.

No ancestry stat lock.

---

# 129. Durability Ownership

Document 04 owns persistent item condition/durability.

Document 16 emits combat wear events.

---

# 130. Combat Wear Sources

Potential:

- successful impacts;
- heavy blocked hits;
- armour absorption;
- projectile firing mechanism use;
- shield Guard pressure.

---

# 131. Wear Fairness

Misses should not normally consume full combat durability.

Trivial contacts should not create maintenance spam.

---

# 132. Zero Condition

Default:

- item becomes broken/impaired;
- remains recoverable/repairable.

Harsh settings may allow stronger loss policies.

---

# 133. Repair

Document 05 owns repair transformation/transaction.

Document 04 owns resulting Item condition.

Combat does not run repair formula.

---

# 134. Field Repair

Combat can permit a field-repair action state.

Actual repair capability uses Document 05/Item systems.

---

# 135. Upgrades

Weapon/armour upgrades may involve:

- rebuild;
- quality;
- physical modification;
- rune/enchantment;
- magitech module;
- culture technique;
- relic awakening;
- cleansing/binding.

Ownership remains with relevant source systems.

---

# 136. Enchantment

Document 09 owns enchantment.

Combat consumes combat-facing effect.

---

# 137. Coatings

Temporary coatings may be Items/Recipes/Alchemy effects.

Combat consumes their attack-side payload.

Set 29 handles poison biology.

---

# 138. Curses

Magic owns curse state.

Combat only consumes relevant tactical effects.

---

# 139. Armour Appearance

Transmog/cosmetics cannot misrepresent mechanically critical PvP class when server rules require readability.

Document 17 owns presentation.

---

# 140. NPC Combat Actors

Document 07 owns persistent NPC identity.

Document 16 owns combat action execution after an NPC has chosen/been assigned to fight.

---

# 141. Creature Combat Actors

Document 10 owns creature identity/behaviour/ecology.

Document 16 owns attack/defence execution.

---

# 142. AI Tactical Role

Combat role definitions may include:

- skirmisher;
- shield bearer;
- archer;
- support;
- caster;
- sapper;
- commander;
- healer;
- siege operator.

These are tactical roles, not personhood categories.

---

# 143. Tactical Role Inputs

AI action selection may consider:

- combat role;
- weapon;
- target;
- cover;
- ally state;
- Guard;
- Health snapshot;
- ammunition;
- orders;
- objective;
- retreat state.

---

# 144. Combat AI Does Not Move Itself

AI chooses:

- attack target;
- desired range;
- cover destination;
- retreat destination.

Set 30 executes movement/path.

---

# 145. Personhood

A recognised person remains a person.

Combat role cannot classify them as “monster.”

---

# 146. Tactical Morale

Document 16 may maintain a short-lived **Combat Cohesion / Break State** for encounter behaviour.

It must not duplicate Set 28's persistent:

- Fear;
- Loyalty;
- relationship;
- social memory.

---

# 147. Combat Cohesion Inputs

May consume:

- casualties;
- leader state;
- objective;
- escape route;
- orders;
- Set 28 social modifier;
- faction doctrine.

---

# 148. Break / Retreat

Tactical break may cause:

- retreat;
- surrender request;
- regroup;
- defensive state.

Movement executes retreat.

---

# 149. Commanders

Commanders may improve:

- tactical cohesion;
- formation;
- target priority;
- withdrawal.

24H/13/07 defines who commander is.

---

# 150. Guards and Militia

Document 07 owns guard jobs.

Document 20 owns defence facilities.

Document 16 owns their combat actions.

---

# 151. Guard Equipment

Guards require:

- actual weapon;
- actual armour;
- actual ammo;
- actual condition.

No hidden infinite garrison equipment.

---

# 152. Guard Supply

Inventory/automation/settlement systems supply:

- ammo;
- medicine;
- repair parts;
- food;
- mana.

Combat consumes availability.

---

# 153. Formations

Combat owns formation combat rules such as:

- shield line;
- spear brace;
- firing team;
- fallback line.

Set 30 executes physical spacing/movement.

Set 28 may provide group/companion formation intent.

---

# 154. Formation Validation

Requires:

- correct weapons;
- enough participants;
- space;
- movement access;
- command/intent;
- cohesion.

---

# 155. Player Orders

Player may issue contextual orders if authorised:

- hold;
- defend;
- fall back;
- focus target;
- protect civilians;
- man tower;
- cease fire.

Document 07/28/13 owns authority/willingness.

Combat consumes valid order.

---

# 156. Civilians

Civilian status does not automatically give combat AI.

During danger, persons may:

- evacuate;
- shelter;
- defend;
- assist;
- heal;
- fight

based on role/authority/social state.

---

# 157. Encounter

Document 16 owns local tactical combat encounter state once engagement is active.

Document 15/24K may own the event containing it.

---

# 158. Encounter Context

May come from:

- patrol contact;
- dungeon;
- raid;
- war;
- creature defence;
- boss;
- duel;
- crime;
- rescue;
- convoy;
- siege.

---

# 159. Encounter Objectives

Examples:

- escape;
- survive;
- protect;
- disable;
- capture;
- hold;
- breach;
- withdraw;
- rescue;
- destroy;
- escort;
- interrupt.

---

# 160. Encounter Start

Requires valid:

- actors;
- positions;
- hostility/engagement;
- environment;
- permissions;
- objective context.

---

# 161. Encounter End

Can result from:

- objective complete;
- retreat;
- surrender;
- capture;
- disengagement;
- death;
- ceasefire;
- separation.

---

# 162. Engagement Is Not War

A fight between two actors does not automatically create formal war.

Document 13 owns war state.

---

# 163. Raid Boundary

The old Document 16 owned full raid lifecycle.

Production ownership is now split.

Document 15/24K owns:

- raid event lifecycle;
- warning;
- quest/event phases;
- aftermath orchestration.

Document 13 owns:

- political/faction context.

Document 16 owns:

- physical combat resolution.

---

# 164. Raid Preparation

Combat consumes preparation facts:

- fortifications;
- guards;
- ammo;
- medicine;
- wards;
- traps;
- scouting;
- repaired routes.

It does not compute one hidden “Defence Score.”

---

# 165. Siege

Document 16 owns generic character/structure siege combat primitives.

Examples:

- siege projectile;
- breaching attack;
- wall assault;
- gate attack;
- defensive fire.

---

# 166. Structure Damage

Combat creates Damage Packets for damage-capable Blocks/structures.

Document 03 applies Block state.

Document 12 aggregates structure condition.

---

# 167. No Universal Voxel Destruction

Only compatible Blocks/structures accept relevant damage.

---

# 168. Structural Collapse

Document 12 owns structure-condition/collapse interpretation.

Combat supplies damage.

---

# 169. Fortifications

Physical state:

- Document 12.

Settlement defence function:

- Document 20.

Combat use:

- Document 16.

---

# 170. Towers

A tower may provide:

- elevation;
- cover;
- firing position;
- warning service.

Combat only consumes valid physical/service state.

---

# 171. Walls

Walls may:

- block line;
- provide cover;
- shape routes;
- absorb damage.

---

# 172. Gates

Combat may:

- attack;
- defend;
- operate if permitted.

Document 12 owns gate state.

---

# 173. Traps

Trap physical definition may belong to Blocks/Items/structures.

Combat resolves attack/damage when triggered.

---

# 174. Automated Defences

Document 08 owns:

- targeting/control;
- power;
- machine operation.

Combat resolves authorised weapon attack/damage.

---

# 175. Magical Defences

Document 09 owns:

- ward;
- barrier;
- mana.

Combat consumes protection snapshot.

---

# 176. Siege Weapons

Generic land siege may use Combat weapon/projectile contracts.

Specialist naval/coastal interaction may route through 26L.

---

# 177. Fire

Combat may create an ignition request.

World/Block/environment owners handle persistent fire.

Set 29 handles biological exposure.

---

# 178. Smoke

Environment/structure/fluid owners provide smoke exposure.

Set 29 handles biological effect.

Combat may use visibility implications from environment.

---

# 179. Explosions

Combat may resolve:

- damage;
- structure Damage Packets;
- impulse requests.

Set 30 owns physical actor displacement.

---

# 180. Boss / Major Threat Boundary

24H owns major-threat authored truth.

Document 16 owns exact combat execution.

---

# 181. 24H Foundation Scope

24H v0.1 defines:

- **36 Overworld boss foundations**
- **24 dungeon boss foundations**
- **18 siege threats**
- **12 titan/world-scale entities**
- **36 realm guardian/sovereign foundations**

Total: **126 major-threat foundations**.

Document 16 does not duplicate them.

---

# 182. Boss World Role

A major threat must control/protect/disrupt/reveal/transform something.

Combat does not define that world role.

---

# 183. Boss Encounter Package

24H may define:

- mechanics;
- phases;
- weak points;
- counters;
- objectives;
- alternatives;
- aftermath;
- recurrence.

Document 16 implements combat actions/results requested by that package.

---

# 184. Boss Phases

Phases may arise from:

- goals;
- injuries;
- territory;
- allies;
- weather;
- machinery;
- ritual;
- retreat.

Not just arbitrary Health percentages.

---

# 185. Health-Threshold Phases

Allowed when fiction/mechanics justify them.

Not mandatory.

---

# 186. Boss Arenas

A boss can:

- roam;
- migrate;
- siege;
- occupy dungeon;
- command settlement;
- exist as landscape.

Circular arena is not assumed.

---

# 187. Boss Preparation

Preparation may include:

- gear;
- research;
- supplies;
- NPCs;
- wards;
- traps;
- routes;
- diplomacy;
- automation;
- engineering.

---

# 188. Boss Alternative Outcomes

Where fiction allows:

- kill;
- cleanse;
- seal;
- relocate;
- bargain;
- tame;
- bind;
- recognise;
- restore;
- coexist;
- depose;
- imprison;
- withdraw.

Combat contributes only where actual fighting occurs.

---

# 189. Boss Failure

Failure can produce:

- retreat;
- capture;
- settlement damage;
- route loss;
- migration;
- escalation;
- recovery quest.

No automatic world deletion.

---

# 190. Boss Recurrence

24H declares recurrence category.

Combat cannot respawn unique boss just because arena reloads.

---

# 191. Dungeon Boss

24G owns site.

24H owns boss package.

Combat executes encounter.

---

# 192. Siege Threat

24H/15 owns threat/event context.

Combat resolves tactical effects.

---

# 193. Titan

Titan may require:

- traversal;
- internal structures;
- siege;
- repair;
- negotiation.

Combat is one component.

---

# 194. Realm Guardian

Document 14 owns realm law.

Document 13 owns sovereignty/personhood.

24H owns guardian package.

Combat only resolves combat branch.

---

# 195. Major Threat Personhood

A ruler, champion, sovereign, construct intelligence or intelligent undead may be a person.

Combat does not classify them as monster.

---

# 196. Maritime Combat Boundary

Set 26L owns physical resolution of vessel-scale maritime combat.

---

# 197. 26L Owns

- vessel weapons;
- mounts;
- firing solutions;
- ramming;
- vessel structural damage;
- compartments;
- breaches;
- flooding;
- vessel fire/smoke;
- damage control;
- boarding encounter context;
- surrender/capture of vessel;
- sinking;
- coastal battery integration;
- fleet tactical resolution.

---

# 198. Document 16 Supplies to 26L

- character Combat Actions;
- melee;
- ranged;
- personal magic combat adapter;
- personal armour/shields;
- character Damage Packets;
- downing/death;
- local tactical combat conditions.

---

# 199. Boarding

26L owns the transition and vessel-local boarding encounter context.

Once characters fight directly, Document 16 executes character attacks/defences.

---

# 200. Vessel Ownership

Capturing one deck or control point does not automatically transfer vessel ownership.

26L/26K/13 owns tactical/legal transition.

---

# 201. Naval Damage

Document 16 does not replace 26L's structure-aware vessel Damage Groups, flooding or sinking.

---

# 202. Coastal Siege

Use 26L when vessel-scale/coastal-battery naval context is primary.

Use Document 16 for ordinary land/character combat primitives.

---

# 203. Marine Creature Combat

26M/10 owns marine ecology/creature.

26L handles vessel-facing encounter.

Document 16 handles character combat where appropriate.

---

# 204. Mounted Combat

Set 30E owns mounted movement.

Combat owns:

- attack;
- block;
- aim;
- timing;
- rider/weapon action.

---

# 205. Mount Damage

Creature biology/Set 29 applies to mount as appropriate.

Combat produces damage.

---

# 206. Vehicle Combat

Set 30F or specialist vehicle owner controls movement.

Combat may resolve weapon actions.

---

# 207. Airborne Combat

Set 30D owns falling/gliding movement.

Combat may permit:

- attack;
- aim;
- cast;
- block

according to action definitions.

---

# 208. Combat Impulse While Airborne

Combat submits impulse.

30D executes movement.

---

# 209. Realm Combat

Document 14 provides:

- gravity;
- environment;
- realm law.

Combat consumes them.

---

# 210. No Realm Name Branches

Avoid:

`if realm == ... then combat damage`

Use realm-law/provider contracts.

---

# 211. Environmental Hazards

Combat may receive hazard Damage Packets from:

- traps;
- fire;
- crushing;
- siege;
- magic.

Persistent environment belongs to owner.

---

# 212. Equipment Environmental Protection

Equipment provides facets.

Set 29 applies biological exposure reduction.

Combat applies combat damage mitigation.

---

# 213. Magic / Combat Boundary

Document 09 owns:

- spell;
- mana;
- magic status;
- casting.

Combat owns:

- attack timing;
- hit;
- combat defence response;
- interruption.

---

# 214. Barrier

Magic owns barrier capacity/state if magical.

Combat queries it during defence.

---

# 215. Anti-Magic

Magic owns suppression.

Combat consumes whether spell action is available.

---

# 216. Counterspell

Magic owns spell counter capability.

Combat may provide action timing/target interaction.

---

# 217. Support Magic

Buffs may affect:

- Guard;
- attack capability;
- defence;
- movement;
- biology.

Each domain applies its own effect.

---

# 218. Combat Status Registry Cleanup

Remove duplicate persistent statuses that now belong elsewhere.

Legacy migrations:

- bleeding → Set 29E;
- fracture → Set 29E;
- burn/frost Injury → Set 29E;
- poisoned/diseased → Set 29F;
- exhausted → Set 29B;
- morale wound → Set 28/social;
- magical curse/corruption → Document 09.

---

# 219. Combat-Owned Status Registry

Keep only tactical/action truth such as:

- stagger;
- guard break;
- exposed;
- disarmed;
- interrupted;
- suppression;
- counter opening;
- combat-ready;
- downed;
- surrendered.

---

# 220. Damage-Over-Time

Persistent DOT must have a real owner.

Examples:

- poison → Set 29F;
- bleeding → Set 29E;
- magical curse → 09;
- environmental fire → environment/29.

Combat should not run duplicate DOT timers.

---

# 221. Stealth Kill

A stealth attack uses ordinary:

- hit;
- damage;
- defence;
- Health.

It is not guaranteed instant death unless definition explicitly supports it and balance/settings allow.

---

# 222. Assassination / Execution

Execution is high-consequence.

Requires:

- target state;
- permissions;
- animation/action;
- law evidence;
- server authority.

---

# 223. Capture Instead of Kill

Combat should support:

- nonlethal takedown;
- surrender;
- restraint handoff.

---

# 224. Loot Boundary

Combat does not invent loot.

After defeat:

- inventory is real;
- carcass/creature harvest is real;
- reward packages use 24J/04/06.

---

# 225. Dropped Equipment

If a weapon is disarmed/dropped:

- same Item instance moves to world/inventory container state.

No duplicate weapon spawn.

---

# 226. Ammunition on Death

Remaining ammo remains actual inventory.

---

# 227. Armour on NPC Death

Loot rules may permit/restrict recovery.

Item state remains authoritative.

---

# 228. Relics / Boss Rewards

24H/24J defines reward context.

Combat supplies outcome evidence.

---

# 229. Progression

Document 02 owns:

- Melee Combat;
- Ranged Combat;
- Defence;
- relevant perks/mastery.

Combat consumes progression modifiers.

---

# 230. Progression Improvements

May improve:

- handling;
- recovery window;
- stamina efficiency request;
- aim;
- parry tolerance;
- special action eligibility;
- Guard use.

---

# 231. No Level Scaling World Rewrite

Combat difficulty should not universally scale every enemy's stats to player level.

Content/world state remains meaningful.

---

# 232. Gear Material Progression

Document 06 owns material capability roles.

Combat consumes material facets.

Older materials retain specialised uses.

---

# 233. Equipment Sets

Set bonuses may exist but mixed equipment remains viable.

---

# 234. Sockets

Sockets/item modification remain Document 04/09.

Combat consumes active effects.

---

# 235. NPC Healers

Document 07/28 supplies healer availability/willingness.

29G owns treatment.

Combat supplies downed/emergency context.

---

# 236. Combat Medics

Combat role may prioritise:

- rescue;
- cover;
- drag/carry request;
- treatment opportunity.

Actual treatment remains 29G.

---

# 237. Carrying Downed Actors

Set 30 owns physical carry/transport.

Set 29 supplies transport safety/biological constraints.

Combat supplies downed state.

---

# 238. Rescue Window

Combat may expose a rescue window class.

Set 29 supplies biological CriticalCondition/RecoveryPossible.

---

# 239. Dragging Under Fire

Combat may impose action restrictions.

Set 30 moves actors.

---

# 240. Combat Contribution

Document 16 emits evidence for meaningful tactical contribution.

---

# 241. Contribution Types

- offence;
- defence;
- support;
- preparation;
- objective;
- command;
- rescue;
- recovery.

Document 15 owns quest/event contribution aggregation.

---

# 242. Damage Is Not the Only Contribution

A player can contribute by:

- blocking;
- healing;
- repairing;
- scouting;
- commanding;
- saving civilians;
- operating gate;
- supplying ammo.

---

# 243. Combat Historical Evidence

Combat emits:

- attack result;
- downed;
- death;
- surrender;
- capture;
- structure damage;
- friendly fire;
- major objective outcome.

Document 15/28/13 consume.

---

# 244. Combat Evidence Record

```yaml
combat_evidence:
  evidence_id: combat_evidence:<ulid>
  encounter_ref: <id>
  source_actor_ref: <id>?
  target_ref: <id>?
  event_type: <type>
  action_ref: <id>?
  damage_packet_ref: <id>?
  outcome_tags: []
  location_ref: <id>
  world_time: <time>
  combat_revision: <rev>
```

---

# 245. Tactical Encounter Record

```yaml
combat_encounter:
  encounter_id: combat_encounter:<ulid>
  context_ref: <quest|event|boss|war|crime|ecology>
  participant_refs: []
  objective_refs: []
  environment_snapshot_refs: []
  rules_of_engagement_refs: []
  started_world_time: <time>
  state: active
  outcome_refs: []
  evidence_refs: []
  lod_state: C0
  revision: <rev>
```

---

# 246. Encounter Context Owner

The system that created the conflict remains owner of:

- why it exists;
- strategic objective;
- politics;
- ecology;
- event.

Combat owns local resolution.

---

# 247. Quests / Events

Document 15 consumes Combat evidence.

Quest cannot force Combat result.

---

# 248. Defeat Objective

Document 15 may accept:

- killed;
- retreated;
- captured;
- surrendered;
- disabled.

Combat returns evidence.

---

# 249. Political War

Document 13 owns war.

Combat resolves battles.

---

# 250. Economic Consequence

Set 27 decides:

- repair cost;
- market shortage;
- ransom;
- bounty;
- wages;
- insurance.

Combat emits physical outcomes.

---

# 251. Social Consequence

Set 28 decides:

- fear;
- trust;
- grievance;
- gratitude;
- witness memory.

Combat emits evidence.

---

# 252. NPC Memory

An NPC can remember:

- player saved them;
- player attacked;
- ally died.

Set 28 owns memory/belief.

---

# 253. Combat Law

Document 13 supplies:

- legal status;
- rules of engagement;
- protected person;
- war state.

Combat applies permissions/targeting constraints where required.

---

# 254. Illegal Attack

Combat may allow attack if world rules permit crime.

It emits offence evidence.

---

# 255. Protected Zones

World/server rules may block:

- PvP;
- structure damage;
- traps;
- fire.

Combat validates before commit.

---

# 256. Settlement Defence

Documents 19/20 own:

- settlement planning;
- defence facilities;
- service capacity.

Combat consumes actual defenders/structures.

---

# 257. Defence Readiness

Do not use one universal hidden score.

Readiness may include:

- guards;
- ammo;
- armour;
- walls;
- gates;
- towers;
- wards;
- medicine;
- escape routes;
- repair stock.

---

# 258. Defence Failure

Failure may produce:

- casualties;
- damage;
- theft;
- occupation;
- retreat;
- refugees.

Owner systems commit aftermath.

---

# 259. Camp Disruption

Attacking an enemy camp may affect later event state through Document 15/13/24H.

Combat only supplies camp damage/casualty evidence.

---

# 260. Fire and Repair After Battle

Document 12/05/20 owns rebuilding.

Combat ends when fighting ends.

---

# 261. Corpse / Remains

Person/Creature/Biology systems own corpse/remains state.

Combat emits death.

---

# 262. Combat LOD

### C0 — Fully Active Tactical
- exact actors;
- actions;
- projectiles;
- hit/defence;
- Set 30 movement;
- Set 29 biology.

### C1 — Reduced Local
- fewer tactical updates;
- important projectiles/actions exact.

### C2 — Group Tactical Summary
- groups;
- ammo;
- capability;
- casualties/damage transactions;
- named actors protected.

### C3 — Encounter Abstract
- deterministic tactical outcome;
- real resource consumption;
- injuries/casualties;
- structure damage bands.

### C4 — Dormant / Scheduled
- no active combat unless event/strategic owner advances it.

---

# 263. LOD Invariants

Abstract combat must not:

- create free ammo;
- heal participants;
- duplicate casualties;
- reset gear;
- reroll boss identity;
- ignore structure damage;
- ignore named actors.

---

# 264. Promotion to Detailed Combat

Promotion preserves:

- current Health;
- Injury;
- ammo;
- gear condition;
- position context;
- objective state;
- casualties;
- structure damage;
- boss phase.

---

# 265. No Reroll on Promotion

A losing distant battle cannot become fresh because player approaches.

---

# 266. Abstract Combat Inputs

May include:

- participant capability;
- equipment;
- ammo;
- leadership;
- terrain;
- fortification;
- objective;
- supply;
- injuries;
- environment.

---

# 267. Abstract Combat Outputs

Must include:

- casualties;
- Health/injury requests/results;
- ammo consumed;
- equipment wear;
- structure damage;
- retreat/capture;
- objective result;
- time.

---

# 268. Named Actors

Players, companions, important NPCs and unique bosses remain individually traceable.

---

# 269. Multiplayer Authority

Server/host owns:

- action validation;
- hit;
- defence;
- Damage Packet;
- downed/death;
- ammo commit;
- wear requests;
- combat evidence.

---

# 270. Client Prediction

Clients may predict:

- animation;
- aim;
- trails;
- local responsiveness;
- safe action startup.

They do not author final damage.

---

# 271. Lag Compensation

Where used, it must:

- be bounded;
- preserve fairness;
- not rewind world state arbitrarily.

---

# 272. Repeated Hit Protection

Network retry cannot apply one hit twice.

Use attack/hit sequence IDs.

---

# 273. Projectile Replication

Server owns projectile hit.

Client may predict visual trajectory.

---

# 274. PvP Readability

Servers may require:

- armour class indicator;
- faction indicator;
- nameplate;
- loadout silhouette.

---

# 275. Split-Screen

Each player needs independent:

- camera;
- lock-on;
- HUD;
- feedback;
- aim settings.

---

# 276. Friendly-Fire Settings

Separate settings may control:

- direct;
- area;
- trap;
- structure;
- fire;
- NPC.

---

# 277. Difficulty

Difficulty is modular.

It can alter:

- enemy coordination;
- attack timing;
- damage;
- Guard;
- injuries through Set 29 profiles;
- death/downed;
- raid/event pressure;
- structure damage;
- friendly fire;
- aim assist.

---

# 278. Named Presets

Preserve:

- Peaceful Builder
- Cosy Adventure
- Standard
- Harsh Frontier
- Civilisation Crisis
- Custom

Final world-settings owner may rename/present these.

---

# 279. Peaceful Builder

Hostile attacks/raids may be:

- off;
- opt-in;
- transformed into nonlethal/story versions.

Combat training remains.

---

# 280. Cosy Adventure

Lower:

- pressure;
- lethality;
- harsh injury.

Stronger warnings.

---

# 281. Standard

Balanced tactical combat and persistent consequence.

---

# 282. Harsh Frontier

Higher:

- damage;
- pressure;
- injury;
- scarcity;
- structural consequence.

Still readable.

---

# 283. Civilisation Crisis

Emphasises:

- siege;
- defence;
- faction war;
- supply;
- settlement consequence.

---

# 284. Accessibility

Required options include:

- aim assist;
- lock-on;
- timing-window support;
- simplified input;
- stamina assistance through approved world/mechanical settings;
- damage scaling;
- telegraph strength;
- camera comfort;
- reduced flashes;
- optional shake;
- optional hit-stop;
- optional damage numbers;
- colour-independent status cues.

---

# 285. Critical Telegraphs

Use at least two channels where practical:

- animation;
- sound;
- icon;
- text;
- haptic;
- environment.

---

# 286. One-Shot Fairness

Ordinary settings should avoid:

- untelegraphed;
- unavoidable;
- instant-kill attacks.

---

# 287. Boss Readability

24H requires:

- signs;
- counterplay;
- retreat;
- accessibility.

Combat implements readable attack timing.

---

# 288. Damage Numbers

Optional.

Combat truth does not depend on showing numbers.

---

# 289. Health Bar

Set 29 supplies Health view model.

Document 17 presents it.

---

# 290. Guard Bar

Combat supplies Guard/Stability view model.

UI can hide/simplify.

---

# 291. Injury UI

Set 29 supplies injury state.

Combat HUD may surface relevant impairment reason.

---

# 292. Combat Failure Reasons

Examples:

- no stamina;
- invalid stance;
- item broken;
- target out of range;
- blocked by geometry;
- attack interrupted;
- permission blocked;
- ammo unavailable;
- movement owner rejected dodge;
- magic owner rejected cast.

---

# 293. Combat Diagnostics

Recommended codes:

| Code | Meaning |
|---|---|
| `CBT-ACT-001` | Combat action definition invalid. |
| `CBT-ACT-002` | Action state/phase invalid. |
| `CBT-COST-001` | Set 29 rejected Stamina cost. |
| `CBT-AMMO-001` | Ammunition unavailable/commit failed. |
| `CBT-HIT-001` | Hit validation failed. |
| `CBT-HIT-002` | Duplicate hit blocked. |
| `CBT-DEF-001` | Defence profile invalid. |
| `CBT-BLOCK-001` | Block angle/coverage invalid. |
| `CBT-PARRY-001` | Parry timing invalid. |
| `CBT-GUARD-001` | Guard/Stability state invalid. |
| `CBT-DMG-001` | Damage Packet invalid. |
| `CBT-BIO-001` | Set 29 damage/biology handoff failed. |
| `CBT-MOVE-001` | Set 30 displacement/action-movement handoff failed. |
| `CBT-ITEM-001` | Combat Item facet missing/incompatible. |
| `CBT-WEAR-001` | Item condition/wear transaction failed. |
| `CBT-MAG-001` | Magic effect/ward contract failed. |
| `CBT-STRUCT-001` | Structure damage handoff failed. |
| `CBT-AI-001` | Tactical role/action invalid. |
| `CBT-PERS-001` | Personhood/target classification conflict. |
| `CBT-BOSS-001` | 24H encounter package/Combat binding invalid. |
| `CBT-NAVAL-001` | 26L handoff conflict. |
| `CBT-DOWN-001` | Downed/death state invalid. |
| `CBT-PVP-001` | PvP/permission denied. |
| `CBT-LOD-001` | Combat LOD reconciliation failed. |
| `CBT-SAVE-001` | Combat persistence/transaction recovery failed. |
| `CBT-AUTH-001` | Unauthorised combat mutation. |
| `CBT-POC-001` | Retired POC combat dependency detected. |

---

# 294. Validation — Combat Action

Check:

- Item/capability;
- stance;
- biological permission;
- movement state;
- ammo;
- magic;
- cooldown;
- authority.

---

# 295. Validation — Damage

Check:

- one packet;
- target;
- source;
- defence;
- final amount;
- no duplicate biological mutation.

---

# 296. Validation — Biology

Fail if Document 16 stores:

- persistent Health;
- Injury;
- Bleeding;
- Poison;
- Disease;
- Fatigue.

---

# 297. Validation — Movement

Fail if Combat directly writes:

- transform;
- velocity;
- dodge displacement;
- knockback position.

---

# 298. Validation — Gear

Fail if Combat duplicates canonical Item definition.

---

# 299. Validation — Bosses

Fail if Combat hardcodes:

- boss identity;
- guaranteed coordinate;
- POC raid captain;
- recurrence

outside 24H.

---

# 300. Validation — Personhood

Fail if a sapient hostile actor becomes:

- monster loot category;
- animal capture category

because Combat sees hostility.

---

# 301. Validation — Naval

Fail if Document 16 reimplements:

- flooding;
- vessel Damage Groups;
- sinking;
- vessel capture.

---

# 302. Validation — Event

Combat may return physical outcome.

It does not complete Event lifecycle itself.

---

# 303. Test Lab — Melee

Test:

- light;
- heavy;
- thrust;
- sweep;
- parry;
- block;
- guard break;
- Stamina rejection;
- hit duplication.

---

# 304. Test Lab — Ranged

Test:

- ammo reservation;
- draw;
- release;
- projectile;
- recovery;
- shield block;
- missing ammo.

---

# 305. Test Lab — Armour

Test:

- coverage;
- penetration;
- condition;
- biological packet;
- Item wear.

---

# 306. Test Lab — Injury Handoff

Severe hit.

Verify:

- Combat calculates final Damage Packet;
- Set 29 reduces Health;
- 29E decides Injury;
- Combat does not create duplicate wound.

---

# 307. Test Lab — Poison

Creature bite.

Verify:

- Combat damage;
- puncture trauma to 29E;
- toxin exposure to 29F;
- no duplicate `status.poisoned`.

---

# 308. Test Lab — Healing

Use battlefield bandage.

Verify:

- Combat action can be interrupted;
- 29G treatment owns effect;
- 29E bleeding changes.

---

# 309. Test Lab — Dodge

Attack during dodge.

Verify:

- Combat owns defence window;
- Set 30 owns displacement;
- Set 29 owns Stamina.

---

# 310. Test Lab — Knockback

Large hit near cliff.

Verify:

- Combat request;
- Set 30D launch/fall;
- Set 29 impact injury;
- no direct Combat teleport.

---

# 311. Test Lab — Downed

Reach critical state.

Verify:

- Set 29 reports biological state;
- Combat enters downed;
- 29G can stabilise if allowed;
- death/revive ownership correct.

---

# 312. Test Lab — Structure Siege

Attack gate.

Verify:

- Combat packet;
- Document 03 Block state;
- Document 12 structure condition;
- Set 30 route invalidation.

---

# 313. Test Lab — Boss

Bind 24H boss.

Verify:

- phase package remains 24H;
- Combat runs exact attacks;
- alternate non-combat outcome remains possible;
- no respawn on reload.

---

# 314. Test Lab — Personhood

Fight hostile Goblin person.

Verify:

- Combat functions;
- surrender/capture;
- no creature harvest path.

---

# 315. Test Lab — Naval Boarding

Board vessel.

Verify:

- 26L owns vessel context;
- Document 16 owns character attacks;
- vessel ownership not auto-transferred.

---

# 316. Test Lab — PvP

Latency/packet loss.

Verify:

- no duplicate hits;
- permission;
- server authority;
- correction.

---

# 317. Test Lab — Abstract Combat

Resolve distant skirmish.

Verify:

- ammo conserved;
- injuries retained;
- named actors retained;
- promotion reproduces same result.

---

# 318. POC Retirement

The old Forest Hamlet Watchtower Defence Loop is **Archived Validation** only.

---

# 319. Archived POC Content

Archive as production dependencies:

- Forest Hamlet;
- Briarhook fixed raid;
- fixed Goblin Captain;
- fixed raid timing;
- fixed watchtower dependency;
- fixed guard roster;
- fixed defence route;
- fixed POC balance values.

---

# 320. Preserved POC Capabilities

Preserve:

- sword/spear;
- bow;
- shield;
- leather armour;
- apprentice combat magic;
- block;
- parry;
- dodge;
- Stamina interaction;
- Guard/Stability;
- guard AI;
- watchtower combat use;
- ward defence;
- raid warning;
- repairs;
- casualties;
- structure damage;
- persistent aftermath.

---

# 321. POC Regression

The archived scenario may continue to verify the integration chain.

It cannot appear in normal worldgen by default.

---

# 322. Legacy Combat Status Migration

| Legacy v0.1 State | v1.0 Authority |
|---|---|
| Health | Set 29B |
| Stamina | Set 29B |
| Exhausted | Set 29B Fatigue |
| Injury | Set 29E |
| Bleeding | Set 29E |
| Fracture | Set 29E |
| Burn/Frost injury | Set 29E |
| Poison/Disease | Set 29F |
| Healing | Set 29G |
| Morale wound | Set 28 |
| Magical curse | Document 09 |
| Guard break | Document 16 |
| Stagger | Document 16 |
| Downed/Death | Document 16 |

---

# 323. Legacy Gear Migration

Old Combat gear records become Document-04 Items with Combat Facets.

Do not keep:

- Item record + Combat Gear record

as separate canonical identities.

---

# 324. Legacy Durability Migration

Persistent condition moves to Item state.

Combat keeps wear rules.

---

# 325. Legacy Raid Migration

Raid lifecycle moves to:

- Document 15/24K;
- political context 13/24E;
- Combat physical resolution 16.

---

# 326. Legacy Boss Migration

Boss identity/encounter package moves to 24H.

Combat keeps exact combat actions.

---

# 327. Legacy Movement Migration

Combat dodge/knockback direct transform code migrates to Set 30 interfaces.

---

# 328. Legacy Healing Migration

Direct `Heal(amount)` from Combat actions migrates through 29G/29B.

---

# 329. Legacy Poison Migration

Combat `status.poisoned` migrates to 29F Poison Instance.

---

# 330. Legacy Injury Migration

Combat fracture/bleed statuses migrate to 29E.

---

# 331. Save State

Persist combat state only when required.

Examples:

- active action phase if saving mid-combat;
- Guard/Stability;
- downed state;
- active tactical conditions;
- encounter ID;
- projectile where needed;
- contribution;
- hit sequence IDs;
- boss combat binding.

---

# 332. Do Not Duplicate Persistent Biology

Combat save does not duplicate Set 29 data.

---

# 333. Save Mid-Action

Save policy must safely resume or cancel action deterministically.

---

# 334. Save Mid-Projectile

Important projectiles may persist or resolve through safe policy.

---

# 335. Save Mid-Downed

Restore:

- downed state;
- rescue window;
- biological snapshot references.

---

# 336. Save During Abstract Battle

Encounter resolution must be transaction-safe.

---

# 337. Equipment Save

Document 04 saves Item condition/ownership.

Combat saves only transient combat use state where necessary.

---

# 338. Godot / Summer Engine Direction

Replacement Document 18 owns exact implementation.

Document 16 requires eventual capabilities such as:

- CombatActionRegistry;
- CombatActionService;
- HitResolutionService;
- DefenceResolutionService;
- DamagePacketService;
- CombatConditionService;
- GuardStabilityService;
- ProjectileCombatService;
- CombatItemFacetResolver;
- CombatMovementAdapter;
- CombatBiologyAdapter;
- CombatStructureDamageAdapter;
- CombatEncounterService;
- CombatLODService;
- CombatEvidenceService;
- CombatMigrationService;
- CombatValidationService;
- CombatDebugInspector.

Names are illustrative.

---

# 339. Data-Driven Rule

Actions/gear/defences/boss bindings use stable data.

Avoid large hardcoded switch trees.

---

# 340. Immutable Definition / Runtime Separation

Definitions describe:

- capability.

Runtime records describe:

- current encounter state.

---

# 341. Registry Families

Document 16 may own:

- Combat Action;
- Attack Profile;
- Defence Profile;
- Moveset;
- Guard/Stability Profile;
- Combat Projectile;
- Tactical Condition;
- Combat Role;
- Combat Encounter Runtime Profile;
- Combat LOD Profile;
- reason code.

Gear Items remain Document 04.

---

# 342. Stable IDs

Examples:

```text
leyforge.core.combat_action.melee.light
leyforge.core.combat_action.defence.block
leyforge.core.combat_action.defence.parry
leyforge.core.combat_condition.staggered
leyforge.core.combat_condition.guard_broken
leyforge.core.combat_projectile.arrow.standard
```

Exact registry naming follows Set 25.

---

# 343. Combat Item Facet

Do not create:

`combat.weapon.iron_sword`

as a second item identity.

Instead:

`item.weapon.iron_sword`
→ references Combat Weapon Facet.

---

# 344. Combat Protection Facet

Armour Item may expose:

- coverage;
- combat mitigation;
- penetration resistance;
- Guard contribution.

The Item remains canonical.

---

# 345. Movement Facet

Equipment may expose movement-facing facets to Set 30.

Combat does not calculate movement speed from armour.

---

# 346. Biological Protection Facet

Equipment may expose protection to Set 29.

Combat does not calculate poison/disease prevention.

---

# 347. Cross-System Interface — Set 29

Combat supplies:

- final Damage Packet;
- trauma;
- region;
- biological exposure request.

Set 29 supplies:

- Health;
- Injury impairment;
- Bleeding;
- Poison/Disease state;
- Stamina;
- CriticalCondition;
- Stabilised.

---

# 348. Cross-System Interface — Set 30

Combat supplies:

- action movement request;
- dodge;
- impulse;
- movement lock/cap.

Set 30 supplies:

- movement state;
- executed displacement;
- collision/landing.

---

# 349. Cross-System Interface — Document 04

Combat supplies:

- wear event;
- disarm/drop request.

Item system supplies:

- weapon/armour/shield identity;
- condition;
- ownership;
- equipped state.

---

# 350. Cross-System Interface — Document 09

Combat supplies:

- hit/interrupt context.

Magic supplies:

- spell/ward/effect.

---

# 351. Cross-System Interface — Document 10

Combat supplies:

- attack/death evidence.

Creature system supplies:

- attack capability;
- body;
- ecology context.

---

# 352. Cross-System Interface — Document 12

Combat supplies:

- structure Damage Packet.

Structure supplies:

- geometry;
- condition;
- cover;
- damageable groups.

---

# 353. Cross-System Interface — Document 13

Combat supplies:

- violence/surrender/capture evidence.

Civilisation supplies:

- war;
- law;
- rules of engagement;
- faction.

---

# 354. Cross-System Interface — Document 15

Combat supplies:

- objective/combat evidence;
- contribution.

Quest/Event supplies:

- encounter context;
- objective.

---

# 355. Cross-System Interface — 24H

24H supplies:

- threat identity;
- encounter package;
- phases;
- alternatives;
- aftermath hooks.

Combat supplies:

- exact tactical result.

---

# 356. Cross-System Interface — 26L

26L supplies:

- vessel encounter context;
- boarding state;
- ship geometry/compartment context.

Combat supplies:

- character fighting.

---

# 357. Cross-System Interface — Set 27

Combat supplies:

- physical loss/damage/capture evidence.

Economy supplies:

- prices;
- bounties;
- repair cost;
- insurance;
- economic consequence.

---

# 358. Cross-System Interface — Set 28

Combat supplies:

- observed violence;
- surrender;
- rescue;
- contribution evidence.

Social supplies:

- willingness;
- relationship;
- social fear/trust;
- negotiation.

---

# 359. Main-Document Reconciliation Requirements

| Document | Required Follow-On |
|---|---|
| 17 — UI/UX | Consume Combat, Set 29 and Set 30 view models without merging their ownership. |
| 18 — Technical | Implement Godot/Summer combat actions, authoritative damage, adapters, networking, LOD and migration. |
| 19–20 | Settlement defence/projects consume Combat evidence and real fortification state; no hidden defence score. |

---

# 360. Production Acceptance Criteria

Document 16 v1.0 is accepted when:

- [x] original deep-but-readable action-combat identity is preserved;
- [x] first- and third-person support remains;
- [x] light/heavy/block/parry/dodge/ranged combat remains;
- [x] Guard/Stability remains a tactical Combat channel;
- [x] Set 29 owns Health and Stamina;
- [x] Set 29E owns Injury/Bleeding/Blood Loss/Pain;
- [x] Set 29F owns Disease/Poison;
- [x] Set 29G owns Treatment;
- [x] Combat owns final Damage Packet and downed/death combat rules;
- [x] Set 30 owns dodge/knockback/launch physical movement;
- [x] Item identity/durability state remains Document 04-owned;
- [x] Combat contributes facets rather than duplicate gear definitions;
- [x] physical ammunition is conserved;
- [x] armour/penetration/weak-point systems remain;
- [x] tactical statuses are separated from biological/magical/social statuses;
- [x] personhood is not overridden by hostility;
- [x] 24H remains major-threat authored authority;
- [x] 126 24H major-threat foundations are not duplicated;
- [x] 26L remains vessel-scale naval-combat authority;
- [x] generic land/character siege remains supported;
- [x] raids are event/political context with Combat physical resolution;
- [x] settlement defence uses real structures, people and supplies;
- [x] surrender/capture/non-lethal outcomes remain;
- [x] PvP remains world-setting controlled;
- [x] accessibility remains modular;
- [x] LOD conserves ammo, injuries, casualties, damage and boss state;
- [x] multiplayer damage is server authoritative and idempotent;
- [x] POC fixed Forest Hamlet/Briarhook combat wrapper is archive-only;
- [x] Godot/Summer direction is current.

---

# Appendix A — Final Combat / Biology Ownership Matrix

| Concern | Document 16 | Set 29 |
|---|---:|---:|
| Attack action | **Owns** | No |
| Hit validation | **Owns** | No |
| Block/parry | **Owns** | No |
| Armour combat mitigation | **Owns** | Consumes protection where biological |
| Final Damage Packet | **Owns** | Consumes |
| Current Health | No | **Owns** |
| Current Stamina | No | **Owns** |
| Fatigue | No | **Owns** |
| Injury | No | **Owns** |
| Bleeding/Blood Loss | No | **Owns** |
| Poison/Disease | No | **Owns** |
| Treatment | No | **Owns** |
| Guard/Stability | **Owns** | No |
| Stagger/Guard Break | **Owns** | No |
| CriticalCondition | Consumes | **Owns** |
| Downed/Death rule | **Owns** | Provides biological inputs |

---

# Appendix B — Combat / Movement Ownership Matrix

| Concern | Combat | Set 30 / Specialist |
|---|---:|---:|
| Dodge action/timing | **Owns** | Executes displacement |
| Attack lunge request | **Owns action envelope** | Executes displacement |
| Knockback source/magnitude request | **Owns** | Executes physical impulse |
| Explosion launch request | **Owns** | 30D executes airborne movement |
| Fall physics | No | **Set 30D** |
| Mounted movement | No | **Set 30E** |
| Vehicle movement | No | **Set 30F** |
| Aquatic movement | No | **Set 26E / movement facade** |
| Vessel movement | No | **Set 26** |
| Combat action movement lock | Defines requested lock | Set 30 enforces |

---

# Appendix C — Gear Ownership Matrix

| Concern | Owner |
|---|---|
| Sword Item ID | Document 04 |
| Material | Documents 04/06 |
| Quality/Rarity | Document 04 |
| Durability/Condition | Document 04 |
| Repair Transformation | Document 05 |
| Enchantment | Document 09 |
| Combat Moveset | Document 16 |
| Damage Profile | Document 16 |
| Shield Block Profile | Document 16 |
| Armour Combat Mitigation | Document 16 Combat Facet |
| Movement Penalty | Set 30 consuming equipment/Set29 |
| Physiological Stamina/Fatigue cost | Set 29 |
| Market Value | Set 27 |

---

# Appendix D — Damage Packet Example

```yaml
combat_damage_packet:
  packet_id: combat_damage:01K...
  source_actor_ref: person:...
  source_item_ref: item_instance:...
  source_action_ref: leyforge.core.combat_action.melee.heavy_slash
  target_ref: person:...

  hit:
    hit_region_ref: biological_region.right_arm
    weak_point_ref: null

  resolved:
    damage_components:
      - type: damage.slash
        pre_mitigation: 24
    penetration_values:
      - type: penetration.edge
        value: 8
    blocked_components: []
    mitigated_components:
      - source: armour
        amount: 9
    final_damage_amount: 15
    trauma_tags:
      - trauma.slash
    exposure_requests: []
    tactical_condition_requests:
      - combat_condition.staggered
    movement_impulse_request_ref: movement_impulse:...

  authority:
    friendly_fire_class: hostile
    world_time: ...
    combat_revision: ...
```

Set 29 applies biological consequences once.

---

# Appendix E — Defence Resolution Example

```yaml
combat_defence_result:
  defence_result_id: defence_result:<ulid>
  attack_packet_ref: <id>
  defender_ref: <id>
  defence_action_ref: combat_action.defence.block
  defence_provider_item_ref: <shield_item_instance>
  result: partial_block
  guard_cost: <value>
  stamina_transaction_ref: <set29_id>
  redirected_damage_ref: <id>
  item_wear_request_ref: <id>
  tactical_condition_refs: []
  reason_codes: []
  combat_revision: <rev>
```

---

# Appendix F — Downed / Death Result

```yaml
combat_defeat_state:
  actor_ref: <id>
  biological_snapshot_ref: <set29_snapshot>
  state: downed
  entered_world_time: <time>
  rescue_window_class: standard
  treatment_allowed: true
  surrender_allowed: true
  capture_allowed: true
  death_trigger_refs: []
  combat_revision: <rev>
```

---

# Appendix G — Combat Item Facet Example

```yaml
combat_weapon_facet:
  facet_id: combat_weapon_facet:<id>
  canonical_item_ref: leyforge.core.item.weapon.sword.iron_arming
  weapon_family_ref: weapon_family.sword.arming
  grip_modes:
    - one_hand
    - two_hand
  moveset_refs:
    - moveset.sword.arming.standard
  attack_profile_refs:
    - attack.slash.light
    - attack.slash.heavy
    - attack.pierce.thrust
  guard_profile_ref: guard.weapon.sword
  wear_profile_ref: combat_wear.blade.standard
```

The facet is not a second Item.

---

# Appendix H — 24H / Combat Responsibility

| Major Threat Question | Owner |
|---|---|
| Who/what is the boss? | 24H |
| Why does it exist here? | 24H / world Atlas |
| What does it protect/control? | 24H |
| What phases/mechanic package exist? | 24H |
| What exact attack happens now? | Document 16 |
| Did the attack hit? | Document 16 |
| What final combat damage reached actor? | Document 16 |
| What Injury results? | Set 29 |
| What movement impulse happens? | Set 30 |
| Can player negotiate instead? | 24H + Set 28/13 |
| What world aftermath occurs? | 24H + specialist owners + Document 15 |

---

# Appendix I — 26L / Document 16 Responsibility

| Concern | Owner |
|---|---|
| Naval encounter context | 26K/26L |
| Vessel manoeuvre | 26G |
| Ship-mounted weapon | 26L |
| Hull/compartment damage | 26L |
| Flooding | 26L + 26B |
| Ship fire/damage control | 26L |
| Boarding link | 26L |
| Character sword attack on deck | Document 16 |
| Character armour | Document 04 + Document 16 facet |
| Character Injury | Set 29 |
| Capture vessel ownership | 26L/26K/13 |
| Prize/economic consequence | 26K/Set 27 |

---

# Appendix J — POC Conversion Matrix

| v0.1 POC Element | Production Treatment |
|---|---|
| Iron sword / spear | Preserve generic weapon families |
| Hunter Bow | Preserve ranged capability |
| Wooden Shield | Preserve shield family |
| Leather Armour | Preserve equipment class |
| Block / Dodge | Preserve |
| Parry | Preserve |
| Apprentice combat spell | Preserve through Document 09 |
| Guard AI | Preserve through Document 07 + Combat |
| Watchtower | Preserve generic structure/combat use |
| Ward defence | Preserve through Document 09 |
| Briarhook Raider | Archive named POC faction; generic hostile-person/faction combat remains |
| Raid Captain | Archive fixed POC identity; 24H major-threat system replaces |
| Day-4 raid | Archive |
| Injuries inside Combat | Migrate to Set 29E |
| Healing inside Combat | Migrate to Set 29G |
| Poison inside Combat | Migrate to Set 29F |
| Fixed village aftermath | Replace with Document 15 + persistent specialist state |

---

# Appendix K — Definition of Done for Implemented Combat Foundation

The implementation is not complete because a sword can reduce a Health bar.

Production proof requires:

- actions use stable definitions;
- Stamina is Set 29-owned;
- Combat cannot directly edit Health;
- final Damage Packets are deterministic;
- Set 29 applies biological result exactly once;
- injuries never duplicate Combat statuses;
- poison never duplicates 29F;
- treatment never bypasses 29G;
- Guard/Stability works independently of Stamina;
- dodge timing and physical displacement use separate owners;
- knockback launches through Set 30;
- gear is one canonical Item;
- combat wear changes the Item state through its owner;
- physical ammunition is conserved;
- shields and armour have readable coverage/penetration;
- parry/critical openings are readable;
- structure damage reaches real Blocks/Structure Instances;
- NPC defenders use real gear/ammo;
- sapient enemies retain personhood;
- surrender and capture work;
- bosses bind 24H packages without duplicate identity;
- boss reload does not reset state;
- naval vessel combat remains 26L-owned;
- boarding character combat works through Document 16;
- abstract combat conserves ammo/damage/injuries/casualties;
- promotion to detailed combat never rerolls;
- PvP permissions and server authority work;
- accessibility modifies presentation/tolerances without corrupting state;
- POC Forest Hamlet/Briarhook scenario remains only Archived Validation.

---

# Completion Statement

**Document 16 v1.0 reconciles Leyforge's original Combat, Gear and Defence vision with the canonical Item architecture, the post-Atlas major-threat system and the final Survival/Health and Movement ownership contracts.**

The original combat identity remains intact:

- deep but readable action combat;
- first/third person;
- melee;
- ranged;
- magic integration;
- shields;
- armour;
- blocking;
- parrying;
- dodging;
- weak points;
- fortifications;
- guards;
- siege;
- bosses;
- surrender;
- persistent aftermath.

But the ownership is now clean.

**Document 16 owns actions, hits, defence, Guard/Stability, final Combat Damage Packets, tactical conditions and downed/death combat rules.**

**Set 29 owns the body.**

**Set 30 owns physical movement.**

**Document 04 owns the gear Item.**

**24H owns the major threat.**

**26L owns vessel-scale naval combat.**

**Document 15 owns the event/story wrapper.**

**Document 13 owns political war and law.**

This means a sword can hit a person without Combat secretly owning their biology.

A shield can block a blow without becoming a duplicate Item.

A boss can fight without becoming a hardcoded oversized enemy.

A raid can happen without Combat owning the entire living-world event.

A ship can board another ship without character combat taking ownership of flooding and sinking.

And a Goblin can fight the player while remaining a person.

**Next foundation reconciliation dependency: Document 17 — UI, UX, Accessibility, Menus, HUD and Player-Trust System v1.0.**
