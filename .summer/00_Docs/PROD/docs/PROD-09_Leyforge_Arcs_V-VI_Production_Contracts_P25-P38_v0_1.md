
# LEYFORGE PRODUCTION PROGRAMME

## PROD-09 — Arcs V–VI Production Contracts: P25–P38

**Document ID:** PROD-09  
**Title:** Leyforge Arcs V–VI Production Contracts — Blood, Bone & Steel / The First Hearth  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **LOCKED — OWNER-APPROVED PRODUCTION AUTHORITY**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Runtime parent:** PROD-03 — Leyforge Runtime Engineering Architecture  
**Forge parent:** PROD-04 — The Forge Engineering & Creation Journey Architecture  
**Cross-system parent:** PROD-05 — Universal Simulation Primitives & Cross-System Contracts  
**Governance parent:** PROD-06 — Production Governance, Task Contracts & Evidence Standard  
**Previous executable volumes:** PROD-07, PROD-08  
**Arc scope:** ARC V — BLOOD, BONE & STEEL / ARC VI — THE FIRST HEARTH  
**Parent slices:** P25–P38  
**Programme gates:** PG-05 Living Entity & Combat Foundation, PG-06 First Living Hearth  
**Primary downstream consumers:** ProductionRegistry, Project Brain, Task Contracts, Codex/coding agents, CI, runtime/Forge implementation, PROD-10 onward

---

# 00. Executive Arc Statement

PROD-09 introduces the first persistent living beings into Leyforge.

ARC V establishes the common entity, body, rig, movement, creature-behaviour, equipment and combat foundation.

ARC VI then proves that a humanoid NPC is more than a combat-capable creature with a name above its head.

A Leyforge NPC must be able to:

- exist persistently when not loaded;
- have a stable personal identity;
- inhabit a body without being defined by that body;
- possess needs;
- choose tasks from bounded priorities;
- move through the world;
- use work/social locations;
- speak through authored dialogue;
- react to the state of their home and small community;
- preserve meaningful state across save/load and simulation LOD.

The two Arc promises are therefore:

## ARC V — BLOOD, BONE & STEEL

> **A Leyforge body can exist, move, perceive, equip, fight and persist without the actor, animation or visual model becoming the authority for what it is.**

## ARC VI — THE FIRST HEARTH

> **A Leyforge person can live beside other people, need things, decide what to do, communicate and remain the same named individual even when the player walks away.**

The target combined result is:

```text
ENTITY DEFINITION
→ BODY / CREATURE SOURCE
→ RIG
→ ACTIVE ENTITY
→ MOVEMENT / SENSES
→ BEHAVIOUR
→ EQUIPMENT
→ COMBAT
→ NPC IDENTITY
→ HUMANOID CHARACTER SOURCE
→ VOICE
→ TASK PLANNER
→ NEEDS
→ DIALOGUE
→ THREE NAMED PEOPLE LIVING AROUND ONE FIRE
```

This is still deliberately smaller than a settlement.

P38 is not a village.

It is the moment the world first contains a tiny persistent social group that feels alive enough to care about.

---

# 01. Governing Production Rules for P25–P38

## 01.1 Persistent identity outranks actor lifetime

A creature/NPC may have an active Godot actor while nearby.

That actor is a projection.

Persistent entity state belongs to Leyforge domain records.

Destroying/unloading a Node may never silently:

- kill the person;
- erase its inventory;
- change its identity;
- reset its needs;
- reset its relationship/history.

## 01.2 Definition, body and person are separate layers

A persistent individual may reference:

- entity/creature definition;
- body source;
- rig family;
- presentation variant;
- identity/person record.

Those layers are related but not interchangeable.

P32 will make this distinction explicit for NPCs.

## 01.3 Presentation cannot invent mechanics

ART-05 remains a presentation authority.

A large creature model does not automatically gain more health.

A sword animation does not apply damage.

A glowing eye does not create magical vision.

Gameplay contracts own:

- movement capability;
- hit regions;
- attack timing windows;
- damage;
- health;
- senses;
- hostility;
- behaviour;
- state.

Presentation expresses them.

## 01.4 Ordinary NPC logic is not called AI

P29 and P35 implement deterministic behaviour/planning systems.

Use terminology such as:

- behaviour;
- utility selection;
- planner;
- task system;
- schedule;
- goal;
- decision;
- simulation.

Do not call ordinary bounded gameplay logic “AI” merely because an NPC selects an action.

Optional model-based AI belongs to ARC XIX.

## 01.5 Navigation is a provider hierarchy, not a creature brain

Behaviour decides:

> go to the campfire.

Navigation decides:

> how to physically get there.

Do not couple personality/task selection to one pathfinding implementation.

## 01.6 Combat consequence is authoritative

Animation, hit flash, sound and particles do not decide whether an attack hit.

Combat resolves from authoritative:

- attack/action;
- active window;
- target evidence;
- damage/resistance;
- result.

## 01.7 Equipment is composition

Character + equipment remains a composition of known identities.

Equipping armour does not create a new private “armoured version” creature definition.

## 01.8 Personhood-safe variation

Humanoid/people production must follow current FCC/personhood authority and ART-05.

Appearance does not silently imply:

- morality;
- intelligence;
- physical capability;
- occupation;
- personality;
- social class;
- magical ability.

Those are independent semantic layers unless canon explicitly binds them.

## 01.9 The seven settlement pillars remain locked

P36 introduces the first personal/settlement-need bridge.

The main settlement needs remain exactly:

1. Housing
2. Provisions
3. Health
4. Work
5. Safety
6. Infrastructure
7. Morale

Other concepts such as:

- privacy;
- sanitation;
- education;
- culture;
- governance;
- law;
- transport;
- water;
- reserve stock;
- recreation;

are contributors, systems or sub-calculations.

They do not automatically become new main meters.

## 01.10 Three people first

P38 deliberately uses a tiny population.

If the systems cannot make three named people understandable and persistent, adding three hundred NPCs will only hide the defects.

---

# 02. Common Evidence Rules for This Volume

ARC V requires strong evidence around:

- identity;
- body/rig source;
- movement;
- navigation;
- damage;
- combat timing;
- save/load;
- LOD/projection;
- equipment composition.

ARC VI requires strong evidence around:

- persistent NPC identity;
- planner determinism;
- task ownership;
- needs;
- social interaction;
- dialogue state;
- three-person simulation;
- save/load;
- unloaded/reloaded reconciliation.

No parent may close because an NPC “looked alive” in a short editor preview.

---

# 03. ARC V — BLOOD, BONE & STEEL

---

# P25 — THE SHAPE OF LIFE

**Classification:** FOUNDATION  
**Arc:** ARC V — BLOOD, BONE & STEEL  
**Player/creator payoff:** Leyforge gains one common language for bodies, creatures, players and future humanoids.

## P25.1 Purpose

Establish the authoritative Entity/Creature contract before mass-producing bodies or behaviour.

P25 answers:

> **What information must Leyforge know about a living/moving entity regardless of how it looks or which behaviour profile it uses?**

## P25.2 Authoritative source packet

Primary:

- PROD-03 entity/projection architecture;
- PROD-05 Identity, State, Capability, Ownership, Composition;
- current Creature/Monster design authority;
- current NPC/Village design authority for future compatibility;
- Set 22B entity taxonomy/anatomy/body architecture;
- Set 22H gameplay integration/hitbox/LOD concepts;
- ART-05 entity presentation ontology;
- ART-07 future creature audio constraints;
- combat authority for health/hit-region interfaces.

## P25.3 Entry gate

- PG-04 COMPLETE;
- stable registry/Forge/runtime presentation infrastructure exists;
- current creature/entity semantic authorities are reconciled.

## P25.4 Dependencies

### Hard

P24.

### Forge

P06–P10, P18–P24.

### Runtime

WorldSession, EntityService shell, MovementService, Presentation State.

### Content

Only test entity definitions.

## P25.5 Universal primitives used

- Identity;
- State;
- Capability;
- Ownership;
- Composition;
- Connection/Socket;
- Result/Reason;
- History hooks.

## P25.6 In scope

Entity definition/runtime contract covering at minimum:

- stable definition ID;
- persistent instance ID;
- body-plan reference;
- movement capabilities;
- collision/body profile;
- health/vital-state hook;
- senses/perception capability;
- faction/disposition hook;
- interaction capability;
- inventory/equipment hook;
- combat/hit-region hook;
- locomotion/animation profile reference;
- audio profile reference;
- behaviour profile reference;
- ecology/spawn hook;
- persistence class;
- simulation-LOD class;
- ownership/taming/relationship hooks;
- authoritative state vs presentation-state separation.

## P25.7 Explicit non-scope

- final Creature Forge UI;
- final humanoid creator;
- full combat;
- detailed ecology;
- boss framework;
- NPC personality;
- dialogue;
- settlement needs;
- multiplayer replication implementation.

## P25.8 Implementation capability requirements

A definition should support a range of entity classes without forcing every class to use irrelevant fields.

Examples:

- passive animal;
- hostile creature;
- humanoid NPC;
- construct;
- spirit;
- future boss.

Use capability/domain extensions rather than one monstrous flat schema full of fake defaults.

## P25.9 Forge requirements

P25 defines what P26 must author.

The Forge should eventually be able to inspect required entity capability coverage.

## P25.10 Runtime requirements

Persistent entity instance record is separate from active actor Node.

Minimum lifecycle:

```text
definition + persistent record
→ projection requested
→ active actor created
→ runtime interaction
→ authoritative state committed
→ actor projection released
→ persistent record remains
```

## P25.11 Canonical content subset

At least two test definitions with genuinely different capabilities, such as:

- simple passive creature;
- hostile creature.

## P25.12 Persistence implications

Persistent entity identity/state survives unload/save/reload.

Temporary cosmetic entities may be classified differently.

## P25.13 Multiplayer / authority implications

Entity IDs, state revisions and command boundaries must support future server authority.

## P25.14 Simulation-LOD implications

Define entity LOD capability contract now, even though regional/far simulation is minimal.

## P25.15 Accessibility / localisation implications

Entity inspection names/labels use localisation keys.

Critical combat/disposition state later requires accessible presentation.

## P25.16 Performance implications

Definition resolution should be shared/immutable.

Do not duplicate full definition data on every instance.

## P25.17 Security / trust implications

Invalid/missing behaviour/body references fail explicitly.

## P25.18 Recommended child decomposition

- P25-A — entity definition schema;
- P25-B — persistent instance record;
- P25-C — active projection lifecycle;
- P25-D — capability/domain-extension model;
- P25-E — LOD/persistence fixtures;
- P25-F — reconciliation.

## P25.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P25-AC01 | Entity definition and persistent instance identity are distinct | EV-B / EV-A | Required |
| P25-AC02 | Active Node destruction does not erase persistent entity | EV-B / EV-D | Required |
| P25-AC03 | Body/presentation source is referenced rather than being identity itself | EV-B | Required |
| P25-AC04 | Two different capability profiles can use shared base contract without fake universal fields | EV-B / review | Required |
| P25-AC05 | Save/reload preserves entity instance ID/state | EV-D | Required |
| P25-AC06 | Projection reactivation restores same entity identity | EV-D / EV-C | Required |
| P25-AC07 | Simulation-LOD class/state exists independently of render LOD | EV-B | Required |
| P25-AC08 | Missing definition/reference fails with stable reason | EV-B negative | Required |
| P25-AC09 | Final SHA/CI passes | EV-H | Required |

## P25.20 Negative tests

- missing body definition;
- missing behaviour profile;
- duplicate instance ID;
- active actor destroyed unexpectedly;
- load entity while definition unavailable;
- stale projection attempts commit after entity revision changed.

## P25.21 Manual acceptance scenario

Spawn two test entities.

Inspect stable IDs.

Move far/unload one or forcibly release projection.

Recreate it.

Verify it returns as the same persistent entity with same authoritative state.

## P25.22 Rule-of-cool target

No spectacle required.

The important milestone is:

> **Leyforge finally has a real concept of “a living thing.”**

## P25.23 Exit gate

Entity identity/runtime projection architecture is safe enough for authoring real creature bodies.

## P25.24 Downstream unlock

P26.

## P25.25 Known risks / ADR triggers

- entity-record storage strategy;
- active-projection pooling architecture;
- schema change affecting save/network identity.

---

# P26 — FLESH FROM VOXEL

**Classification:** FORGE-FIRST  
**Arc:** ARC V  
**Player/creator payoff:** Creatures can be built in The Forge as understood bodies instead of one-off models.

## P26.1 Purpose

Create Character/Creature Forge v1 focused on non-humanoid/general creature body authoring and semantic anatomy.

## P26.2 Authoritative source packet

- PROD-04 Forge architecture;
- P25 entity contract;
- Set 22B body-plan/anatomy architecture;
- Set 22D creature/mob/monster/boss creator;
- Set 22G visual inheritance/variants;
- ART-05 creature/body style;
- ART-02 materials;
- ART-04 modelling/attachments;
- ART-08 capture hooks;
- ART-09/10 production/certification.

## P26.3 Entry gate

- P25 COMPLETE;
- shared Voxel/Material/Animation Forge services available.

## P26.4 Dependencies

### Hard

P25.

### Forge

P08/P09, P18/P19/P20/P21.

### Runtime

entity definition/active projection.

### Content

Small representative creature subset.

## P26.5 Universal primitives used

- Identity;
- State;
- Capability;
- Composition;
- Connection/Socket;
- Provenance;
- Result/Reason.

## P26.6 In scope

Creature Forge v1 should support:

- canonical identity;
- body-plan family;
- body regions/semantic anatomy;
- voxel/compound body construction;
- materials/surface families;
- size/scale bounds;
- collision/body envelope reference;
- named joints/rig-role requirements;
- sockets/attachments;
- hit-region markers;
- senses anchors;
- interaction anchors;
- locomotion capabilities;
- animation-role requirements;
- VFX/audio anchors;
- presentation variants;
- damage/death presentation hooks;
- capture/icon source;
- validation;
- bake/runtime projection.

## P26.7 Explicit non-scope

- full humanoid appearance editor;
- final Rig Forge implementation;
- full behaviour authoring;
- boss phase system;
- equipment authoring;
- voice/dialogue;
- arbitrary procedural anatomy.

## P26.8 Implementation capability requirements

Creature Forge owns questions such as:

- what body plan?;
- which anatomical regions?;
- which movement modes?;
- which sockets?;
- which animation roles?.

It does not duplicate:

- Material Forge;
- Animation Forge;
- Sound Forge;
- VFX Forge.

## P26.9 Forge requirements

Guided flow:

```text
Identity
→ body plan
→ body form
→ materials
→ anatomy regions
→ joint/rig requirements
→ sockets/anchors
→ gameplay markers
→ animation requirements
→ VFX/audio references
→ variants
→ validate
→ Test Lab
→ bake
```

## P26.10 Runtime requirements

Baked body binds to P25 entity definition.

## P26.11 Canonical content subset

Recommended early golden bodies:

- simple quadruped or equivalent passive animal;
- hostile biped/quadruped creature with clearly different silhouette.

Exact species follows current creature canon.

## P26.12 Persistence implications

Body definition/variant references persist.

Damage/scar/injury state may be minimal until later.

## P26.13 Multiplayer / authority implications

Presentation variation can be reconstructed from stable identity/seed where required.

## P26.14 Simulation-LOD implications

Forge declares representation/animation LOD hooks without changing persistent identity.

## P26.15 Accessibility / localisation implications

Hostility or danger cannot depend solely on colour.

## P26.16 Performance implications

Body complexity/bones/sockets validated against provisional budgets.

## P26.17 Security / trust implications

Developer authority only.

## P26.18 Recommended child decomposition

- P26-A — creature source/body-plan schema;
- P26-B — anatomy/body-region tooling;
- P26-C — socket/gameplay-marker tooling;
- P26-D — presentation service integration;
- P26-E — bake/Test Lab;
- P26-F — ART review/reconciliation.

## P26.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P26-AC01 | Creature source can be created through Forge with stable identity | EV-B / EV-C | Required |
| P26-AC02 | Body regions/anatomy roles are semantic rather than visual-only labels | EV-B | Required |
| P26-AC03 | Rig requirements are explicit before P27 | EV-B | Required |
| P26-AC04 | Sockets/anchors survive bake/runtime projection | EV-B / EV-C | Required |
| P26-AC05 | Creature uses shared Material/Animation/VFX/Audio services | EV-A / review | Required |
| P26-AC06 | Generated products can be rebuilt from editable source | EV-D | Required |
| P26-AC07 | Representative silhouettes/body presentation pass ART-05 review | EV-F / EV-G | Required |
| P26-AC08 | Low-distance/LOD source strategy preserves creature identity | EV-F / EV-E | Required |
| P26-AC09 | Final SHA/CI passes | EV-H | Required |

## P26.20 Negative tests

- anatomy cycle/invalid region;
- socket bound to missing part;
- body references incompatible rig family;
- invalid scale/collision envelope;
- missing source dependency;
- stale bake.

## P26.21 Manual acceptance scenario

Create/edit a representative creature.

Inspect body regions and sockets.

Bake.

Spawn in Test Lab.

Verify silhouette, collision envelope, attachment anchors and state previews.

## P26.22 Rule-of-cool target

First creature produced entirely through The Forge that genuinely looks like it belongs in the same voxel world.

## P26.23 Exit gate

Creature bodies are understood production source rather than bespoke scenes.

## P26.24 Downstream unlock

P27.

## P26.25 Known risks / ADR triggers

- body-source geometry representation;
- anatomy graph schema;
- collision generation strategy if it affects gameplay authority.

---

# P27 — BONES BENEATH

**Classification:** FORGE-FIRST  
**Arc:** ARC V  
**Player/creator payoff:** Creature bodies gain reusable skeletons, joints and attachment logic so they can move coherently.

## P27.1 Purpose

Establish Rig Forge v1 and semantic rig-role contracts.

## P27.2 Authoritative source packet

- PROD-04 Rig Forge service;
- Set 22E skeletons/rigging/joints/IK/attachments;
- ART-05 rig and motion rules;
- P18 Animation Forge;
- P26 body/anatomy source;
- ART-04 equipment grips/sockets.

## P27.3 Entry gate

- P26 COMPLETE;
- representative body source exists.

## P27.4 Dependencies

### Hard

P26.

### Forge

Animation Forge, creature source.

### Runtime

entity projection skeleton/animation path.

## P27.5 Universal primitives used

- Identity;
- State;
- Connection/Socket;
- Composition;
- Capability;
- Provenance;
- Result/Reason.

## P27.6 In scope

Rig Forge v1:

- rig template identity;
- semantic joint roles;
- hierarchy;
- bind relation;
- rigid-part/constrained-skinning modes as required;
- socket/attachment roles;
- foot/contact markers;
- look/head/aim roles where relevant;
- IK/contact-assistance hooks;
- retarget compatibility profile;
- rig validation;
- animation compatibility;
- rig LOD hook;
- source→bake.

## P27.7 Explicit non-scope

- advanced procedural animation;
- final humanoid facial rig;
- cloth;
- muscle simulation;
- complex ragdoll;
- cinematic control rig.

## P27.8 Implementation capability requirements

Animations should bind to semantic roles where practical.

Example:

```text
leg.front_left
foot.front_left
head
jaw
weapon.hand_primary
```

rather than depending only on arbitrary node names.

## P27.9 Forge requirements

Rig Forge is a shared service.

Creature Forge references rig templates/profiles.

Later Character Forge v2 reuses it.

## P27.10 Runtime requirements

Rig/animation playback remains presentation.

Contact markers may feed queries/events but do not independently decide gameplay damage.

## P27.11 Canonical content subset

At least:

- one creature rig family;
- one humanoid-compatible rig template stub if useful for later P33 planning.

## P27.12 Persistence implications

Rig definition identity persists; transient bone transforms usually do not.

## P27.13 Multiplayer / authority implications

Bone transforms need not become authoritative gameplay state by default.

## P27.14 Simulation-LOD implications

Rig LOD may reduce:

- secondary bones;
- IK;
- update frequency.

Persistent gameplay hit/collision rules remain correct.

## P27.15 Accessibility / localisation implications

None major.

## P27.16 Performance implications

Measure rig/bone update cost across representative entity counts.

## P27.17 Security / trust implications

Invalid hierarchy/cycle blocked.

## P27.18 Recommended child decomposition

- P27-A — semantic rig template schema;
- P27-B — hierarchy/binding tooling;
- P27-C — sockets/contact/IK roles;
- P27-D — retarget/animation integration;
- P27-E — LOD/performance;
- P27-F — reconciliation.

## P27.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P27-AC01 | Rig authored as editable Forge source | EV-B / EV-C | Required |
| P27-AC02 | Semantic joint/socket roles resolve after bake | EV-B | Required |
| P27-AC03 | Representative P26 body binds correctly | EV-C | Required |
| P27-AC04 | P18 animation can drive rig without bespoke creature code | EV-C | Required |
| P27-AC05 | Invalid hierarchy/role conflicts fail validation | EV-B negative | Required |
| P27-AC06 | Rig LOD/reduced update preserves required gameplay contact semantics | EV-E / EV-F | Required |
| P27-AC07 | Representative motion passes ART-05 rig review | EV-F / EV-G | Required |
| P27-AC08 | Final SHA/CI passes | EV-H | Required |

## P27.20 Negative tests

- hierarchy cycle;
- duplicate semantic role;
- missing required joint;
- incompatible body/rig;
- invalid socket;
- retarget source mismatch.

## P27.21 Manual acceptance scenario

Bind representative creature.

Play idle/walk/turn clips.

Inspect foot contacts, head movement and sockets.

Attach a temporary prop to an approved socket.

## P27.22 Rule-of-cool target

The first creature that moves with an actual body architecture instead of a sliding model.

## P27.23 Exit gate

Reusable rigging system exists.

## P27.24 Downstream unlock

P28, P30, P33.

## P27.25 Known risks / ADR triggers

- rig implementation/provider choice;
- skinning strategy;
- IK provider if custom/native work required.

---

# P28 — GIVE IT LIFE

**Classification:** INTEGRATION / FOUNDATION  
**Arc:** ARC V  
**Player/creator payoff:** A Forge-created creature actually inhabits the world, moves through terrain and persists.

## P28.1 Purpose

Integrate entity definition, creature source, rig, movement, navigation and presentation into a living runtime actor.

## P28.2 Authoritative source packet

- PROD-03 Entity/Movement/Navigation architecture;
- P25–P27;
- P18–P24 presentation stack;
- current navigation risk/proof evidence;
- ART-05 locomotion rules;
- Set 22F/H runtime integration/LOD concepts.

## P28.3 Entry gate

- P25–P27 COMPLETE;
- local navigation provider selected enough for active creature proof.

## P28.4 Dependencies

### Hard

P25–P27.

### Runtime

EntityService, MovementService, NavigationService, Presentation State.

### Forge

Creature/Rig/Animation.

### Content

one passive and/or simple test creature.

## P28.5 Universal primitives used

- Identity;
- State;
- Capability;
- Route/navigation hook;
- Result/Reason;
- History hook.

## P28.6 In scope

- spawn/materialise entity;
- active actor;
- locomotion state;
- local navigation request;
- idle/wander/follow-target movement hooks;
- obstacle handling;
- terrain contact;
- turn/facing;
- animation-state binding;
- active→unloaded→active lifecycle;
- death/despawn distinction;
- entity diagnostics;
- simple sense/query hook for P29.

## P28.7 Explicit non-scope

- advanced behaviour;
- combat;
- flocking/herds;
- settlement tasks;
- long-distance path planning;
- full regional simulation;
- flying/swimming unless chosen test creature requires one.

## P28.8 Implementation capability requirements

Movement intent and navigation are separated:

```text
behaviour intent: go to point X
→ NavigationService proposal/path
→ MovementService execution
→ authoritative entity position/state
→ animation presentation
```

## P28.9 Forge requirements

Creature source declares compatible movement modes and animation roles.

## P28.10 Runtime requirements

Nearby active entity uses local physical movement.

When unloaded:

- persistent identity/state remains;
- no SceneTree Node required.

## P28.11 Canonical content subset

One golden creature sufficient to validate movement.

## P28.12 Persistence implications

Position/state survive save/reload.

## P28.13 Multiplayer / authority implications

Position/movement ownership remains server-compatible.

No prediction required now.

## P28.14 Simulation-LOD implications

Prove ACTIVE ↔ dormant/lightweight projection transition.

Full regional behaviour later.

## P28.15 Accessibility / localisation implications

Motion state should be readable without excessive animation noise.

## P28.16 Performance implications

Measure multiple active entities navigating over edited voxel terrain.

## P28.17 Security / trust implications

No navigation result directly mutates foreign state.

## P28.18 Recommended child decomposition

- P28-A — entity spawn/projection;
- P28-B — locomotion/movement executor;
- P28-C — navigation integration;
- P28-D — animation/state integration;
- P28-E — unload/reload/performance proof;
- P28-F — reconciliation.

## P28.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P28-AC01 | Forge-created entity spawns through P25 definition | EV-C | Required |
| P28-AC02 | Entity can locomote over voxel terrain using navigation/movement boundary | EV-C | Required |
| P28-AC03 | Terrain edit invalidation/repath fails safely in representative test | EV-B / EV-C | Required |
| P28-AC04 | Active projection can unload/reactivate as same entity | EV-D | Required |
| P28-AC05 | Save/reload preserves identity/position/state | EV-D | Required |
| P28-AC06 | Animation reflects locomotion state but does not own movement truth | EV-B / review | Required |
| P28-AC07 | Representative active-entity count remains within provisional budget | EV-E | Required |
| P28-AC08 | Invalid/unreachable navigation returns explicit result | EV-B negative | Required |
| P28-AC09 | Final SHA/CI passes | EV-H | Required |

## P28.20 Negative tests

- unreachable destination;
- navigation invalidated mid-route;
- entity unloaded during path request;
- stale worker path result;
- actor Node destroyed unexpectedly;
- invalid spawn/collision location.

## P28.21 Manual acceptance scenario

Spawn creature.

Watch it move across ordinary terrain.

Edit terrain to block path.

Observe safe repath/failure.

Leave area/unload.

Return.

Verify same creature identity/state.

## P28.22 Rule-of-cool target

The first moment something else **walks through the world on its own**.

## P28.23 Exit gate

Persistent living entity runtime works.

## P28.24 Downstream unlock

P29 and P31.

## P28.25 Known risks / ADR triggers

- navigation strategy if dynamic voxel edits prove current provider insufficient;
- active entity physics/body approach;
- movement worker concurrency.

---

# P29 — TOOTH & CLAW

**Classification:** COOL-PULL / FOUNDATION  
**Arc:** ARC V  
**Player/creator payoff:** Creatures stop wandering randomly and begin behaving according to senses, temperament and ecology.

## P29.1 Purpose

Create deterministic creature behaviour v1 and basic ecology interaction.

## P29.2 Authoritative source packet

- current Creatures & Monsters authority;
- PROD-05 State/Capability/Relationship/History hooks;
- P25/P28;
- world/ecology contracts for later P76 compatibility;
- ART-05 creature behaviour presentation;
- ART-07 creature sonic identity.

## P29.3 Entry gate

- P28 COMPLETE;
- creature senses/behaviour profile schema resolved.

## P29.4 Dependencies

### Hard

P28.

### Forge

Creature Forge; Animation/Sound/VFX.

### Runtime

senses, movement/navigation, entity state.

## P29.5 Universal primitives used

- Identity;
- State;
- Capability;
- Relationship/disposition;
- History hook;
- Result/Reason.

## P29.6 In scope

Reusable bounded behaviour profiles including:

- idle;
- wander;
- rest;
- investigate;
- avoid/flee;
- pursue;
- defend;
- attack intent hook;
- return-to-area;
- simple hunger/feeding/ecology hook where appropriate;
- senses:
  - sight;
  - hearing/event awareness;
  - proximity;
- temperament/disposition;
- territory/home-area hook;
- target evaluation;
- cooldown/memory of recent stimulus;
- deterministic decision/debug trace;
- behaviour LOD hook.

## P29.7 Explicit non-scope

- model-based AI;
- full ecosystem simulation;
- reproduction/population genetics;
- pack tactical planning;
- boss phases;
- NPC work planning;
- diplomacy.

## P29.8 Implementation capability requirements

Behaviour profile should be data-driven/reusable.

Example:

```text
perceive threat
→ evaluate disposition/distance/health/home
→ choose FLEE or DEFEND
→ request movement/combat intent
```

No arbitrary hidden script per creature species as the default authoring model.

## P29.9 Forge requirements

Creature Forge exposes approved behaviour-profile references/parameters.

A future Behaviour Composer may be justified, but P29 need not build a full public behaviour editor.

## P29.10 Runtime requirements

Decision outputs are authoritative intents.

Presentation communicates:

- alert;
- fear;
- aggression;
- rest;

without owning them.

## P29.11 Canonical content subset

At least:

- passive/fleeing creature;
- hostile/territorial creature.

## P29.12 Persistence implications

Persist only meaningful behaviour state/history, not every short-lived steering decision.

## P29.13 Multiplayer / authority implications

Behaviour runs under authority, not each client independently.

## P29.14 Simulation-LOD implications

Active behaviour detailed.

Distant creature summaries later preserve population/ecology outcomes rather than every decision.

## P29.15 Accessibility / localisation implications

Hostility/attack telegraph must be readable beyond colour/audio alone.

## P29.16 Performance implications

Measure sense queries/decision cadence across representative active entities.

Do not evaluate every expensive sense every frame.

## P29.17 Security / trust implications

None.

## P29.18 Recommended child decomposition

- P29-A — behaviour profile schema;
- P29-B — senses/perception;
- P29-C — deterministic selection/trace;
- P29-D — flee/pursue/territory actions;
- P29-E — ecology/LOD/performance fixture;
- P29-F — reconciliation.

## P29.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P29-AC01 | Two behaviour profiles produce meaningfully different decisions | EV-B / EV-C | Required |
| P29-AC02 | Decision trace explains why an action was chosen | EV-B / EV-C | Required |
| P29-AC03 | Senses are bounded/cadenced rather than unbounded per-frame scans | EV-E | Required |
| P29-AC04 | Flee/pursue requests use Movement/Navigation rather than direct teleport | EV-B | Required |
| P29-AC05 | Behaviour survives save/unload without inappropriate reset of meaningful state | EV-D | Required |
| P29-AC06 | No model-based AI dependency exists | EV-A / review | Required |
| P29-AC07 | Hostility/alert state is accessibly readable | EV-F | Required |
| P29-AC08 | Representative population stays within provisional behaviour budget | EV-E | Required |
| P29-AC09 | Final SHA/CI passes | EV-H | Required |

## P29.20 Negative tests

- target disappears;
- unreachable target;
- conflicting stimuli;
- creature unloads while pursuing;
- invalid behaviour profile;
- zero valid actions.

## P29.21 Manual acceptance scenario

Approach passive creature.

Observe avoidance/flee.

Approach territorial creature.

Observe warning/pursuit/return-to-area according to profile.

Break line of sight and inspect decision trace.

## P29.22 Rule-of-cool target

Creatures should feel like they **notice you**, not like moving decorations.

## P29.23 Exit gate

Creature behaviour is reusable, bounded and explainable.

## P29.24 Downstream unlock

P31 combat and later ecology expansion.

## P29.25 Known risks / ADR triggers

- perception spatial-query architecture;
- behaviour utility/planner representation if runtime scaling demands alternate model.

---

# P30 — STEEL IN HAND

**Classification:** FORGE-FIRST  
**Arc:** ARC V  
**Player/creator payoff:** Characters/creatures can visibly and mechanically carry weapons, armour and equipment through one reusable system.

## P30.1 Purpose

Expand Item/Tool Forge into Equipment Forge and establish entity equipment composition.

## P30.2 Authoritative source packet

- P14 Item & Tool Forge;
- current Combat/Gear authority;
- ART-04 equipment models/grips/sockets;
- ART-05 equipment fit/motion;
- Set 22G visual inheritance/equipment integration;
- PROD-05 Composition/Socket/Capability;
- P27 rig sockets.

## P30.3 Entry gate

- P14;
- P27;
- entity runtime stable.

## P30.4 Dependencies

### Hard

P14, P27.

### Forge

Item/Tool Forge, Creature/Rig/Animation.

### Runtime

Inventory + entity equipment slots/composition.

## P30.5 Universal primitives used

- Identity;
- State;
- Capability;
- Ownership;
- Composition;
- Socket;
- Transaction;
- Result/Reason.

## P30.6 In scope

Equipment Forge/runtime v1:

- equipment category;
- compatible body/rig profiles;
- equipment slots/attachment roles;
- one-handed/two-handed or equivalent grip profile;
- armour/body-region coverage hook;
- weapon action profile reference;
- stat/capability modifier hook;
- durability;
- equip/unequip transaction;
- held/world/inventory presentation;
- first/third-person fit hook;
- layer/visibility conflicts;
- equipment validation.

## P30.7 Explicit non-scope

- complete weapon catalogue;
- magical enchantment;
- transmog/cosmetic wardrobe;
- full armour simulation;
- procedural fitting for every body plan;
- shields/dodge depth beyond P31 needs.

## P30.8 Implementation capability requirements

Equipping an item composes it with an entity.

It does not create a cloned entity definition.

## P30.9 Forge requirements

Guided flow:

```text
Identity
→ equipment class
→ form/material
→ compatible rigs/body profiles
→ grip/attachment
→ coverage/action capability
→ durability
→ presentation
→ validate
→ Test Lab
→ bake
```

## P30.10 Runtime requirements

Inventory ownership and equipment occupancy remain authoritative.

Visual attachment follows equipment state.

## P30.11 Canonical content subset

Minimum:

- simple melee weapon;
- basic armour piece or shield/defensive item if required for P31;
- existing tools revalidated through equipment composition.

## P30.12 Persistence implications

Equipped items and durability persist.

## P30.13 Multiplayer / authority implications

Equip/unequip is authoritative transaction.

## P30.14 Simulation-LOD implications

Distant equipment may simplify visually while mechanical state remains.

## P30.15 Accessibility / localisation implications

Equipment state/durability accessible in UI.

## P30.16 Performance implications

Equipment attachment should not cause unnecessary duplicated rigs/materials.

## P30.17 Security / trust implications

Incompatible slot/body equip rejected.

## P30.18 Recommended child decomposition

- P30-A — equipment source/profile;
- P30-B — slot/socket compatibility;
- P30-C — equip/unequip transaction;
- P30-D — armour/weapon capability hooks;
- P30-E — fit/presentation validation;
- P30-F — reconciliation.

## P30.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P30-AC01 | Equipment source authored through shared Forge services | EV-B / EV-C | Required |
| P30-AC02 | Equip transaction preserves ownership/inventory conservation | EV-B | Required |
| P30-AC03 | Equipment attaches through semantic rig/socket roles | EV-B / EV-C | Required |
| P30-AC04 | Incompatible body/slot is rejected | EV-B negative | Required |
| P30-AC05 | Equipped state survives save/reload | EV-D | Required |
| P30-AC06 | Visual LOD does not remove mechanical equipment state | EV-B / EV-E | Required |
| P30-AC07 | Representative weapon/armour passes ART-04/05 fit review | EV-F / EV-G | Required |
| P30-AC08 | Final SHA/CI passes | EV-H | Required |

## P30.20 Negative tests

- item equipped twice;
- incompatible socket;
- body changes to incompatible rig;
- item breaks while equipped;
- inventory destination full on unequip;
- missing equipment source.

## P30.21 Manual acceptance scenario

Equip weapon.

Observe correct grip.

Switch/unequip.

Equip defensive piece.

Save/reload.

Verify same item instances remain equipped with state preserved.

## P30.22 Rule-of-cool target

The first time a creature/person properly **holds steel**, rather than having a weapon mesh glued on.

## P30.23 Exit gate

Equipment composition is ready for combat.

## P30.24 Downstream unlock

P31 and later humanoid NPCs.

## P30.25 Known risks / ADR triggers

- body/equipment fit strategy;
- first-person vs third-person equipment projection architecture.

---

# P31 — TRIAL BY BLOOD

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC V  
**Player/creator payoff:** Leyforge has its first real combat encounter with readable timing, consequences and recovery.

## P31.1 Purpose

Create the first bounded combat foundation and certify ARC V.

## P31.2 Authoritative source packet

- current Combat, Gear & Defence authority;
- P25–P30;
- P18–P24 Presentation State;
- ART-05 combat motion;
- ART-06 combat VFX/telegraphs;
- ART-07 weapon/impact audio;
- ART-08 HUD/status;
- PROD-05 State/Transaction/Result.

## P31.3 Entry gate

- P25–P30 COMPLETE;
- player/entity health/action basics available.

## P31.4 Dependencies

### Hard

P25–P30.

### Runtime

player/entity action, collision/query, health, movement.

### Forge

Equipment/Animation/VFX/Sound.

### Content

one player melee action and one hostile creature encounter.

## P31.5 Universal primitives used

- Identity;
- State;
- Capability;
- Transaction;
- Result/Reason;
- History hook;
- Relationship/disposition.

## P31.6 In scope

Combat v1:

- health/vital state;
- stamina/action-cost hook if current combat canon requires;
- attack/action definition;
- wind-up/active/recovery phases;
- target evidence;
- hit result;
- damage packet;
- armour/resistance hook;
- knockback/stagger hook where appropriate;
- block/dodge only to minimal required depth;
- death/incapacitation state;
- loot/drop hook;
- readable enemy telegraph;
- player damage feedback;
- simple healing/recovery;
- basic combat UI;
- combat diagnostics.

## P31.7 Explicit non-scope

- full weapon trees;
- advanced combos;
- PvP balance;
- boss framework;
- siege;
- ranged magic;
- extensive injury system;
- surrender/capture;
- final death/tombstone flow unless current test requires it.

## P31.8 Implementation capability requirements

Combat truth:

```text
action requested
→ validate capability/state/cost
→ authoritative action phases
→ target evidence during valid window
→ resolve damage/result
→ commit state
→ emit domain event
→ presentation responds
```

Animation event may identify timing marker only where the gameplay action owns the phase window.

The animation itself does not decide damage.

## P31.9 Forge requirements

Weapon/action presentation references P30/P18–P21 services.

Full Combat Forge is not required.

## P31.10 Runtime requirements

Health/death are authoritative domain state.

Entity Node removal after death is downstream of death commit.

## P31.11 Canonical content subset

- one melee weapon;
- one defensive action where required;
- one hostile creature;
- one basic recovery item/action.

## P31.12 Persistence implications

Death/health/entity removal persist as appropriate.

Do not respawn defeated persistent creature on reload unless spawn system owns replacement.

## P31.13 Multiplayer / authority implications

Combat architecture must be host/server-authoritative later.

No client-trust assumptions.

## P31.14 Simulation-LOD implications

Full combat only ACTIVE/nearby.

Distant conflict summary comes later.

## P31.15 Accessibility / localisation implications

- telegraph strength extensible;
- reduced flash;
- non-audio hit/alert cues;
- readable health/damage;
- aim/input assistance hooks for later settings.

## P31.16 Performance implications

Measure several simultaneous combatants and effects.

## P31.17 Security / trust implications

Invalid repeated attacks/hit replay must not duplicate damage.

## P31.18 Recommended child decomposition

- P31-A — combat action/damage contract;
- P31-B — health/vital state;
- P31-C — melee encounter runtime;
- P31-D — combat presentation/accessibility;
- P31-E — death/recovery/persistence;
- P31-F — PG-05 reconciliation.

## P31.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P31-AC01 | Attack action uses explicit wind-up/active/recovery semantics | EV-B / EV-C | Required |
| P31-AC02 | Damage resolves from authoritative action/target evidence | EV-B | Required |
| P31-AC03 | Animation/VFX/audio do not own damage result | EV-B negative/review | Required |
| P31-AC04 | Armour/resistance hook modifies damage through data/contract | EV-B | Required |
| P31-AC05 | Death commits before projection cleanup/drop outcome | EV-B | Required |
| P31-AC06 | Save/reload does not resurrect defeated persistent entity incorrectly | EV-D | Required |
| P31-AC07 | Telegraph/hit feedback passes reduced-flash/non-audio review | EV-F / EV-G | Required |
| P31-AC08 | Replayed/stale attack command cannot duplicate damage | EV-B negative | Required |
| P31-AC09 | Representative combat load stays within provisional budget | EV-E | Required |
| P31-AC10 | End-to-end player-vs-creature encounter passes | EV-C | Required |
| P31-AC11 | Final SHA/CI passes | EV-H | Required |

## P31.20 Negative tests

- attack while invalid state;
- target leaves active window;
- attack command replay;
- weapon breaks;
- entity dies mid-action;
- reload immediately after kill;
- reduced-effects mode.

## P31.21 Manual acceptance scenario

Equip weapon.

Encounter hostile creature.

Read its warning/attack behaviour.

Attack, defend/dodge as supported, take damage, recover, defeat creature.

Leave/save/reload.

Verify persistent consequences.

## P31.22 Rule-of-cool target

Combat should feel **weighty enough that a creature matters**, not like tapping a hitbox until a bar disappears.

## P31.23 Exit gate — PG-05 LIVING ENTITY & COMBAT FOUNDATION

PG-05 passes when:

- P25–P31 COMPLETE;
- a Forge-created rigged creature can live, navigate, behave, equip/use combat state and be fought;
- identity/persistence survive actor lifecycle;
- presentation remains subordinate to gameplay truth.

## P31.24 Downstream unlock

ARC VI humanoid/NPC work.

## P31.25 Known risks / ADR triggers

- combat target-evidence architecture;
- authoritative timing model;
- hit-region representation;
- death/despawn persistence contract.

---

# 04. ARC VI — THE FIRST HEARTH

ARC VI transforms the generic entity foundation into persistent people.

The Arc does not yet build a town.

It creates the smallest social simulation worth trusting.

---

# P32 — A NAME BESIDE THE FIRE

**Classification:** FOUNDATION  
**Arc:** ARC VI — THE FIRST HEARTH  
**Player/creator payoff:** NPCs become persistent named individuals instead of respawning “villager actors.”

## P32.1 Purpose

Establish NPC personal identity and separate personhood from body/presentation.

## P32.2 Authoritative source packet

- current NPC Village System authority;
- PROD-03 entity/domain separation;
- PROD-05 Identity, Membership, Relationship, History, Knowledge;
- P25 entity contract;
- current FCC people/personhood/ancestry authority;
- ART-05 personhood-safe presentation rules;
- settlement/history sources.

## P32.3 Entry gate

- PG-05 COMPLETE;
- persistent entity identity proven.

## P32.4 Dependencies

### Hard

P25/P31.

### Forge

none required yet beyond future humanoid body compatibility.

### Runtime

EntityService/persistence.

## P32.5 Universal primitives used

- Identity;
- State;
- Membership;
- Relationship;
- Knowledge;
- History;
- Ownership;
- Result/Reason.

## P32.6 In scope

Persistent NPC identity record including:

- stable person ID;
- name/display identity;
- body/entity definition reference;
- ancestry/people identity reference where current canon requires;
- age/life-stage hook;
- household hook;
- settlement membership hook;
- faction/culture hooks;
- occupation/profession hooks;
- personal inventory/ownership hook;
- relationship hooks;
- reputation/standing hook;
- memory/history references;
- knowledge hooks;
- schedule/task-state hook;
- needs-state hook;
- voice/personality presentation hooks;
- alive/dead/incapacitated state;
- provenance/creation source.

## P32.7 Explicit non-scope

- final genealogy;
- children/families/generations;
- romance;
- full relationships;
- procedural biography generator;
- culture/faction politics;
- dialogue content;
- AI.

## P32.8 Implementation capability requirements

Identity != body.

A person may:

- change clothing;
- age;
- gain injury/scar;
- change profession;
- change settlement;
- potentially change body-state/presentation;

without becoming a new person ID.

## P32.9 Forge requirements

Later Character Forge edits body/presentation.

It does not silently create/delete persistent person identity.

## P32.10 Runtime requirements

NPC person record persists without active actor.

## P32.11 Canonical content subset

At least three named test people prepared for P38.

## P32.12 Persistence implications

This slice is deeply persistence-sensitive.

Names, person IDs, membership/history must survive.

## P32.13 Multiplayer / authority implications

NPC identity globally authoritative in a shared world.

## P32.14 Simulation-LOD implications

Identity exists at all LODs.

## P32.15 Accessibility / localisation implications

Names/display text follow localisation/name rules where applicable.

## P32.16 Performance implications

NPC records compact enough for large populations later.

## P32.17 Security / trust implications

No duplicate persistent person IDs.

## P32.18 Recommended child decomposition

- P32-A — NPC person record;
- P32-B — membership/relationship/history hooks;
- P32-C — body/projection binding;
- P32-D — persistence/migration;
- P32-E — three-person fixture creation;
- P32-F — reconciliation.

## P32.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P32-AC01 | NPC person ID persists independently of active actor/body source | EV-B / EV-D | Required |
| P32-AC02 | Changing body/presentation reference does not create new person | EV-B | Required |
| P32-AC03 | Membership/occupation/relationship hooks are distinct from identity | EV-B | Required |
| P32-AC04 | Three named NPC identities survive save/reload | EV-D | Required |
| P32-AC05 | Dead/alive state belongs to person/entity record, not actor existence | EV-B | Required |
| P32-AC06 | Duplicate person ID rejected | EV-B negative | Required |
| P32-AC07 | Personhood fields do not infer traits from appearance | EV-A / review | Required |
| P32-AC08 | Final SHA/CI passes | EV-H | Required |

## P32.20 Negative tests

- duplicate ID;
- missing body;
- body swapped;
- active actor destroyed;
- settlement membership removed;
- reload with one person currently unloaded.

## P32.21 Manual acceptance scenario

Spawn three named people.

Note identities.

Change one presentation/body variant.

Unload/reload.

Confirm all three remain the same named people and only the intended appearance changed.

## P32.22 Rule-of-cool target

For the first time, you should be able to say:

> **“That's Mara.”**

not:

> “that's villager #4.”

## P32.23 Exit gate

Persistent person identity exists.

## P32.24 Downstream unlock

P33–P38.

## P32.25 Known risks / ADR triggers

- NPC record storage;
- name-generation/localisation ownership;
- ancestry/body/person identity relationship if current FCC requires clarification.

---

# P33 — FACES OF THE LIVING

**Classification:** FORGE-FIRST  
**Arc:** ARC VI  
**Player/creator payoff:** Humanoid people can be authored with coherent bodies, faces, clothing and variation while remaining compatible with rigs/equipment.

## P33.1 Purpose

Expand Character Forge v1 into Humanoid Character Forge v2 for player/NPC-compatible people.

## P33.2 Authoritative source packet

- P26/P27;
- Set 22C Humanoid Player Character & NPC Creator;
- Set 22G visual inheritance/customisation;
- ART-05 humanoid/person presentation;
- current FCC ancestry/people/body authority;
- ART-04 equipment;
- ART-08 portrait/capture;
- PROD-04 specialist shared-service law.

## P33.3 Entry gate

- P32 person identity;
- P27 rigging;
- P30 equipment composition.

## P33.4 Dependencies

### Hard

P27, P30, P32.

### Forge

Creature/Character, Rig, Material, Animation, Equipment, Capture hooks.

### Runtime

person→body projection.

## P33.5 Universal primitives used

- Identity;
- State;
- Composition;
- Socket;
- Capability;
- Provenance;
- Result/Reason.

## P33.6 In scope

Humanoid Character Forge v2:

- body-plan/ancestry-compatible templates;
- proportions;
- head/face voxel geometry;
- skin/surface/material family;
- hair/hair-equivalent;
- eye/feature presentation where canon allows;
- clothing layers;
- body variation;
- posture;
- age/life-stage presentation hook;
- equipment compatibility;
- humanoid rig binding;
- hand/foot/head/interaction sockets;
- first/third-person compatible body source;
- portrait/icon capture source;
- deterministic bounded variation;
- validation.

## P33.7 Explicit non-scope

- full player character creation UI;
- final cosmetic marketplace;
- unrestricted morphing;
- personality generation from appearance;
- facial-performance system;
- every ancestry content batch.

## P33.8 Implementation capability requirements

Appearance dimensions remain independent where canon requires.

Do not infer profession, capability or moral role from:

- build;
- scars;
- clothing style;
- ancestry;
- age presentation.

## P33.9 Forge requirements

Specialist journey orchestrates:

- Voxel/Model;
- Material;
- Rig;
- Animation;
- Equipment;
- Capture.

No duplicate mini-editors.

## P33.10 Runtime requirements

NPC person record references selected body source/variant.

## P33.11 Canonical content subset

At least the three P38 settlers plus one body-template family sufficient to prove variation.

## P33.12 Persistence implications

Body variant/customisation refs persist.

## P33.13 Multiplayer / authority implications

Player-compatible architecture considered, but multiplayer/player creator implementation deferred.

## P33.14 Simulation-LOD implications

Humanoid visual LOD should preserve identity cues.

## P33.15 Accessibility / localisation implications

Faces/people remain readable without relying on tiny facial detail.

## P33.16 Performance implications

Measure humanoid rigs/materials/equipment across small crowd.

## P33.17 Security / trust implications

Developer authority only.

## P33.18 Recommended child decomposition

- P33-A — humanoid source/profile;
- P33-B — head/body variation;
- P33-C — clothing/equipment compatibility;
- P33-D — rig/animation integration;
- P33-E — capture/LOD/ART review;
- P33-F — reconciliation.

## P33.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P33-AC01 | Three NPCs can use distinct humanoid appearances without separate runtime classes | EV-C | Required |
| P33-AC02 | Humanoid sources bind P27 semantic rig | EV-C | Required |
| P33-AC03 | P30 equipment attaches/validates correctly | EV-C | Required |
| P33-AC04 | Appearance changes preserve P32 person identity | EV-B / EV-D | Required |
| P33-AC05 | Bounded deterministic variation reproduces where configured | EV-B | Required |
| P33-AC06 | Body/appearance does not silently grant gameplay traits | EV-A / review | Required |
| P33-AC07 | Portrait/capture source preserves canonical appearance | EV-F | Required |
| P33-AC08 | Representative humanoids pass ART-05 review | EV-F / EV-G | Required |
| P33-AC09 | Final SHA/CI passes | EV-H | Required |

## P33.20 Negative tests

- incompatible rig;
- incompatible equipment;
- missing body material;
- invalid ancestry/body profile;
- appearance source removed;
- variant changes after save.

## P33.21 Manual acceptance scenario

Open three settler sources.

Change clothing/body/face variants.

Bake/spawn.

Equip a tool.

Animate walking/sitting/work pose.

Capture portraits.

Reload and verify identity/appearance.

## P33.22 Rule-of-cool target

The first little group of people should look like **individuals**, not cloned test mannequins.

## P33.23 Exit gate

Humanoid body authoring supports persistent NPCs.

## P33.24 Downstream unlock

P34/P35/P38.

## P33.25 Known risks / ADR triggers

- humanoid body representation;
- first-person player-body compatibility;
- runtime customisation material strategy.

---

# P34 — VOICES AROUND THE HEARTH

**Classification:** FORGE-FIRST  
**Arc:** ARC VI  
**Player/creator payoff:** NPCs gain restrained, identifiable voices and vocal reactions without constant chatter.

## P34.1 Purpose

Create Voice & Character Audio Forge v1 and bind vocal/non-verbal audio to person/entity state/events.

## P34.2 Authoritative source packet

- P21 Sound Forge;
- ART-07 humanoid/character sonic rules;
- ART-05 effort/contact/gesture timing;
- P32 person identity;
- P33 character sources;
- future P37 dialogue requirements.

## P34.3 Entry gate

- P21;
- P32–P33.

## P34.4 Dependencies

### Hard

P21, P32, P33.

### Forge

Sound Forge, Character Forge.

### Runtime

semantic character events.

## P34.5 Universal primitives used

- Identity;
- State;
- Signal/Event;
- Provenance;
- Result/Reason;
- Knowledge hook.

## P34.6 In scope

Voice/character audio source:

- voice profile identity;
- actor/source/provenance;
- effort sounds;
- greeting/acknowledgement non-dialogue cues;
- pain/hurt/death vocal hooks;
- exertion;
- social idle restraint rules;
- semantic event bindings;
- variation/cooldown;
- priority;
- spatial/LOD;
- subtitle/caption/equivalent metadata;
- future spoken-dialogue line hook;
- Test Lab preview.

## P34.7 Explicit non-scope

- full voiced dialogue catalogue;
- text-to-speech generation;
- AI conversation;
- lip-sync/facial animation;
- every NPC voice;
- culture/personality invention from voice.

## P34.8 Implementation capability requirements

Character audio must not invent information.

A frightened gasp can express authoritative fear state.

It cannot create fear state.

## P34.9 Forge requirements

Voice workflow reuses Sound Forge.

## P34.10 Runtime requirements

Voice events derive from entity/person state/events.

## P34.11 Canonical content subset

At least the three P38 settlers can share/differentiate a small production-ready profile set.

## P34.12 Persistence implications

Voice profile reference persists.

Transient playback does not.

## P34.13 Multiplayer / authority implications

Future voice presentation local.

## P34.14 Simulation-LOD implications

Distant voices virtualise/aggregate.

## P34.15 Accessibility / localisation implications

Information-bearing vocal/dialogue audio requires captions/text equivalent.

## P34.16 Performance implications

Voice cooldown/priority prevents chatter spam.

## P34.17 Security / trust implications

Rights/provenance mandatory.

## P34.18 Recommended child decomposition

- P34-A — voice profile schema;
- P34-B — semantic event binding;
- P34-C — variation/cooldown/LOD;
- P34-D — subtitle/equivalent hooks;
- P34-E — settler voice fixtures;
- P34-F — reconciliation.

## P34.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P34-AC01 | Voice profile is authored via shared Sound Forge | EV-B / EV-C | Required |
| P34-AC02 | Vocal cue triggers from semantic event/state | EV-B | Required |
| P34-AC03 | Voice cannot alter gameplay state | EV-B negative/review | Required |
| P34-AC04 | Repetition/cooldown avoids constant idle chatter | EV-C / EV-E | Required |
| P34-AC05 | Information-bearing audio has text/caption equivalent | EV-F | Required |
| P34-AC06 | Voice profile survives save/reload as identity reference | EV-D | Required |
| P34-AC07 | Rights/provenance recorded | EV-A | Required |
| P34-AC08 | Representative profile passes ART-07 review | EV-F / EV-G | Required |
| P34-AC09 | Final SHA/CI passes | EV-H | Required |

## P34.20 Negative tests

- audio muted;
- missing clip;
- event spam;
- entity unloads mid-cue;
- voice profile removed;
- state changes before cue.

## P34.21 Manual acceptance scenario

Observe three settlers:

- movement effort;
- greeting acknowledgement;
- hurt reaction in controlled test;
- quiet idle period.

Mute audio and verify essential information still available.

## P34.22 Rule-of-cool target

The hearth should sound inhabited without becoming:

> “villager grunt simulator.” 😂

## P34.23 Exit gate

Character audio is reusable and restrained.

## P34.24 Downstream unlock

P37 spoken-dialogue hooks and P38 ambience.

## P34.25 Known risks / ADR triggers

- spoken-dialogue recording/localisation pipeline;
- voice asset streaming strategy.

---

# P35 — THOUGHT BEFORE ACTION

**Classification:** FOUNDATION  
**Arc:** ARC VI  
**Player/creator payoff:** NPCs choose understandable tasks from their actual situation instead of running hard-coded daily scripts.

## P35.1 Purpose

Create the deterministic NPC planner/task system v1.

## P35.2 Authoritative source packet

- current NPC Village System;
- technical architecture for persistent NPC needs/schedules/tasks;
- PROD-05 State, Capability, Reservation, Membership, Result;
- P32 identity;
- P28 navigation/movement;
- P29 reusable behaviour principles;
- settlement/work docs for later job integration;
- PROD-03 worker/owner/LOD architecture.

## P35.3 Entry gate

- P32 person identity;
- P28 movement/navigation;
- P29 bounded deterministic behaviour principles.

## P35.4 Dependencies

### Hard

P28, P29, P32.

### Forge

No dedicated NPC Forge required yet.

### Runtime

NPC Simulation service/task planner.

## P35.5 Universal primitives used

- Identity;
- State;
- Capability;
- Reservation;
- Membership;
- Route/navigation;
- Result/Reason;
- History hook.

## P35.6 In scope

NPC planner v1:

- schedule/time context;
- available task sources;
- personal needs inputs;
- simple obligations/roles;
- priority/utility scoring or selected deterministic planning model;
- task preconditions;
- resource/location reservations;
- task claim/release;
- travel-to-task;
- perform task;
- interruption;
- failure reason;
- retry/backoff;
- idle/social/rest fallback;
- decision trace;
- active simulation cadence;
- save/reload task state.

Initial task families:

- sleep/rest;
- eat/use provisions;
- warm at fire;
- idle/social;
- move to assigned point;
- simple assigned work placeholder.

Full profession/work system is P49+.

## P35.7 Explicit non-scope

- model-based AI;
- natural-language decision;
- full professions;
- construction planner;
- economy;
- farming;
- combat tactics;
- faction strategy;
- autonomous settlement planning.

## P35.8 Implementation capability requirements

The planner selects from available authorised tasks.

It does not spawn resources to satisfy needs.

It must expose why a task was chosen or why none is possible.

Example:

```text
Need: hunger high
Available:
- Eat at hearth: food exists, route valid
- Sleep: need moderate
- Idle: always valid

Chosen: Eat
Reason: highest valid priority
```

## P35.9 Forge requirements

Task definitions may be data-driven.

Dedicated Work/Profession Forge arrives P50.

Do not build a duplicate temporary profession editor.

## P35.10 Runtime requirements

Task execution uses existing systems:

- movement/navigation;
- inventory/transaction;
- interaction;
- state.

Planner does not directly mutate them.

## P35.11 Canonical content subset

The three P38 settlers.

## P35.12 Persistence implications

Current task/intent may persist or safely re-evaluate after load.

Reservations must recover cleanly.

## P35.13 Multiplayer / authority implications

Planner runs on authority only.

## P35.14 Simulation-LOD implications

P35 focuses ACTIVE/local NPC planning.

Regional/far summaries are expanded later.

## P35.15 Accessibility / localisation implications

Developer/debug decision trace readable; player-facing explanations later use selected causes.

## P35.16 Performance implications

Decision cadence bounded.

No full planner every frame.

## P35.17 Security / trust implications

Planner only invokes approved task interfaces.

## P35.18 Recommended child decomposition

- P35-A — task definition/lifecycle;
- P35-B — deterministic selection/priority;
- P35-C — reservation/travel/execution;
- P35-D — interruption/failure/retry;
- P35-E — persistence/performance/trace;
- P35-F — reconciliation.

## P35.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P35-AC01 | NPC selects task deterministically from same state/input where contract requires | EV-B | Required |
| P35-AC02 | Decision trace exposes chosen/blocked reasons | EV-B / EV-C | Required |
| P35-AC03 | Planner uses reservations rather than duplicating contested resource/location | EV-B negative | Required |
| P35-AC04 | Task execution calls owning systems rather than mutating foreign state directly | EV-A / tests | Required |
| P35-AC05 | Interruption releases/updates reservation safely | EV-B | Required |
| P35-AC06 | Save/reload preserves or safely reconstructs active task | EV-D | Required |
| P35-AC07 | Planner cadence remains bounded for representative NPC count | EV-E | Required |
| P35-AC08 | No model-based AI dependency exists | EV-A / review | Required |
| P35-AC09 | Final SHA/CI passes | EV-H | Required |

## P35.20 Negative tests

- no valid food;
- destination unreachable;
- reservation stolen/invalidated;
- task source destroyed;
- save mid-task;
- two NPCs compete for one resource;
- zero valid non-fallback tasks.

## P35.21 Manual acceptance scenario

Create different needs/available resources for three settlers.

Observe each choose a different reasonable task.

Remove a resource/path.

Inspect replanning and reason trace.

## P35.22 Rule-of-cool target

You should be able to watch an NPC and think:

> **“Yeah, that makes sense.”**

without pretending it is sentient AI.

## P35.23 Exit gate

NPCs can choose and execute bounded real tasks.

## P35.24 Downstream unlock

P36/P38 and later Work/Profession runtime.

## P35.25 Known risks / ADR triggers

- utility vs planner architecture if scaling/expressiveness evidence demands change;
- task reservation model;
- active scheduling cadence.

---

# P36 — BREAD, BED & BELONGING

**Classification:** FOUNDATION / INTEGRATION  
**Arc:** ARC VI  
**Player/creator payoff:** NPCs need somewhere to sleep, something to eat, safety and meaningful daily life; the first settlement-needs logic becomes real.

## P36.1 Purpose

Establish personal needs v1 and the canonical seven settlement pillars as measurable service relationships.

## P36.2 Authoritative source packet

- current NPC Village System;
- Document 20/20A–20H need architecture;
- especially 20A Housing/Provisions/Health/Community;
- 20B Work;
- 20C Safety;
- 20D Infrastructure/logistics;
- Morale/community authorities;
- PROD-05 State/Capability/Route/Transaction;
- P15 survival state;
- P35 planner;
- P17 furnace/campfire resource systems.

## P36.3 Entry gate

- P35 COMPLETE;
- P32 NPC identity;
- enough registered content for campfire/sleep/food proof.

## P36.4 Dependencies

### Hard

P32, P35.

### Runtime

Needs/service evaluation.

### Forge

Existing block/item source; Structure Forge not yet available.

### Content

Temporary test markers/objects can provide services before buildings exist.

## P36.5 Universal primitives used

- Identity;
- State;
- Capability;
- Route;
- Transaction;
- Reservation;
- Membership;
- Result/Reason.

## P36.6 In scope

Personal need signals such as:

- rest/sleep;
- food/provisions;
- health/recovery;
- warmth/shelter where current model requires;
- safety comfort;
- social/morale hook;
- work/occupation satisfaction hook.

Canonical settlement pillar model:

1. Housing;
2. Provisions;
3. Health;
4. Work;
5. Safety;
6. Infrastructure;
7. Morale.

For each pillar, P36 defines:

- service input concept;
- per-person contribution/coverage;
- blocker/reason;
- aggregate small-group summary;
- planner influence;
- no-resource-invention rule.

Initial physical/service proofs can use:

- bed/sleep spot;
- campfire/shelter;
- food store;
- safe hearth area;
- simple work point;
- path/access;
- social hearth gathering.

## P36.7 Explicit non-scope

- full settlement buildings;
- village stage progression;
- farming;
- healer profession;
- governance;
- real road network;
- warehouse;
- utilities;
- full morale event system;
- population growth/migration.

## P36.8 Implementation capability requirements

A visual object provides no service merely because it looks appropriate.

Service requires valid semantic capability/state.

Example:

A bed prop only contributes Housing if:

- valid sleep capability;
- reachable;
- allowed;
- not broken/occupied;
- environmental prerequisites satisfied.

## P36.9 Forge requirements

Temporary service fixtures use registered semantics.

Structure Forge later composes services into buildings.

## P36.10 Runtime requirements

Needs feed planner.

Planner chooses action.

Action uses actual resource/service.

## P36.11 Canonical content subset

Enough for three-person hearth:

- sleep spots;
- food/provision source;
- campfire/heat;
- simple work point;
- shared social area.

## P36.12 Persistence implications

Personal need state and group service coverage persist/reconstruct correctly.

## P36.13 Multiplayer / authority implications

Needs authoritative world state.

## P36.14 Simulation-LOD implications

P36 begins defining summary-ready need values but only proves active/local.

## P36.15 Accessibility / localisation implications

Player/debug explanations must show causes:

- hungry because no food;
- tired because no free sleep spot;
- unsafe because threat/condition;

not unexplained red bars.

## P36.16 Performance implications

Need update cadence bounded.

Do not calculate all needs every frame.

## P36.17 Security / trust implications

No service may create hidden duplicate stock.

## P36.18 Recommended child decomposition

- P36-A — personal need state;
- P36-B — service capability/coverage;
- P36-C — seven-pillar aggregate model;
- P36-D — planner integration;
- P36-E — diagnostics/persistence;
- P36-F — reconciliation.

## P36.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P36-AC01 | Seven main settlement pillars are represented exactly and no extra main meter is invented | EV-A / review | Required |
| P36-AC02 | Personal food/rest needs influence planner | EV-B / EV-C | Required |
| P36-AC03 | Food consumption uses real inventory transaction | EV-B | Required |
| P36-AC04 | Service validity depends on semantic capability/state/access, not decoration | EV-B | Required |
| P36-AC05 | Three-person aggregate exposes clear coverage/blocker reasons | EV-C | Required |
| P36-AC06 | Missing resource/service produces understandable unmet need without spawning solution | EV-B negative | Required |
| P36-AC07 | Needs survive save/reload | EV-D | Required |
| P36-AC08 | Need/service updates remain bounded | EV-E | Required |
| P36-AC09 | Final SHA/CI passes | EV-H | Required |

## P36.20 Negative tests

- food store empty;
- all beds occupied;
- service unreachable;
- campfire extinguished;
- work point unavailable;
- save during high need;
- one NPC consumes resource another reserved.

## P36.21 Manual acceptance scenario

Give the three settlers:

- two beds;
- limited food;
- one campfire;
- one work point.

Observe planner/need effects.

Add missing bed/food.

Observe state recover for real reasons.

## P36.22 Rule-of-cool target

The hearth begins to matter because people **actually depend on it**, not because a settlement UI says +5 morale.

## P36.23 Exit gate

Personal needs and seven-pillar foundation exist.

## P36.24 Downstream unlock

P38 and later settlement Arcs.

## P36.25 Known risks / ADR triggers

- need decay/time model;
- aggregation algorithm if it risks becoming opaque;
- service-coverage architecture if later routes/structures need contract amendment.

---

# P37 — WORDS BETWEEN PEOPLE

**Classification:** FORGE-FIRST  
**Arc:** ARC VI  
**Player/creator payoff:** NPC conversations can react to who is speaking, what they know and what has happened.

## P37.1 Purpose

Create Dialogue Forge v1 and a persistent, condition-aware dialogue runtime.

## P37.2 Authoritative source packet

- current NPC Village/Quest/Event narrative authority;
- future quest system interfaces;
- PROD-05 Knowledge, History, Relationship, Permission, Result;
- P32 identity;
- P34 voice hooks;
- P36 needs;
- Document 17 UI/accessibility/localisation;
- ART-08 dialogue UI;
- ART-07 spoken audio/caption law.

## P37.3 Entry gate

- P32 identity;
- P34 voice profile hooks;
- stable Knowledge/History interfaces.

## P37.4 Dependencies

### Hard

P32, P34.

### Runtime

dialogue service/view model.

### Forge

Forge Core; Voice/Sound; UI hooks.

## P37.5 Universal primitives used

- Identity;
- State;
- Knowledge;
- History;
- Relationship;
- Permission;
- Result/Reason;
- Provenance.

## P37.6 In scope

Dialogue definition/runtime:

- dialogue identity;
- speaker/role constraints;
- nodes/lines;
- player response options;
- conditions;
- knowledge conditions;
- history/event conditions;
- relationship hooks;
- need/state hooks;
- simple state consequences through approved commands;
- knowledge grant;
- branch/exit;
- availability/cooldown;
- localisation keys;
- speaker/voice reference;
- subtitle/caption;
- UI view model;
- Dialogue Forge graph/list editor;
- validation;
- debug trace.

## P37.7 Explicit non-scope

- large quest system;
- procedural generative dialogue;
- model-based conversation;
- fully voiced game;
- romance system;
- diplomacy system;
- cutscene engine;
- personality simulation.

## P37.8 Implementation capability requirements

Dialogue reads authorised knowledge/history.

It does not access omniscient world truth by default.

Dialogue consequences use commands/events.

Example:

```text
player selects "Take this food."
→ dialogue action requests inventory transfer
→ transaction succeeds
→ history/knowledge/relationship update
→ dialogue advances
```

Do not subtract items inside UI graph code.

## P37.9 Forge requirements

Guided flow:

```text
Identity
→ speakers/context
→ nodes/lines
→ conditions
→ responses
→ authorised effects
→ knowledge/history links
→ voice/subtitle
→ validate
→ conversation test
```

## P37.10 Runtime requirements

Dialogue UI uses view models and command results.

## P37.11 Canonical content subset

A small conversation set for the three P38 settlers:

- greeting;
- need/status comment;
- simple request/help;
- reaction to completed help.

## P37.12 Persistence implications

Relevant conversation state/history persists.

Do not persist every viewed line unless required.

## P37.13 Multiplayer / authority implications

Conversation scope and state remain future-compatible.

No multiplayer implementation now.

## P37.14 Simulation-LOD implications

Dialogue requires active/local interaction.

Distant social effects may record history later.

## P37.15 Accessibility / localisation implications

Required:

- scalable text;
- localisation keys;
- keyboard/controller focus;
- captions for voice;
- no timed response requirement by default unless later configurable.

## P37.16 Performance implications

Dialogue graph evaluation event-driven, not per-frame.

## P37.17 Security / trust implications

Dialogue graph can invoke only approved actions/commands.

No arbitrary scripting.

## P37.18 Recommended child decomposition

- P37-A — dialogue schema/lifecycle;
- P37-B — Dialogue Forge;
- P37-C — conditions/knowledge/history;
- P37-D — authorised effects/commands;
- P37-E — UI/localisation/voice integration;
- P37-F — validation/reconciliation.

## P37.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P37-AC01 | Dialogue source can be authored/validated in Forge | EV-B / EV-C | Required |
| P37-AC02 | Availability can depend on real NPC/player state/knowledge/history | EV-B | Required |
| P37-AC03 | Dialogue cannot leak unknown world truth in test case | EV-B negative | Required |
| P37-AC04 | Inventory/resource consequence uses authoritative transaction | EV-B / EV-C | Required |
| P37-AC05 | Consequential conversation state persists | EV-D | Required |
| P37-AC06 | Voice/caption/text remain aligned | EV-F | Required |
| P37-AC07 | Localisation/scalable-text/focus path passes basic review | EV-F / EV-G | Required |
| P37-AC08 | Invalid effect/action is blocked by validator | EV-B negative | Required |
| P37-AC09 | Final SHA/CI passes | EV-H | Required |

## P37.20 Negative tests

- missing speaker;
- condition references missing knowledge;
- response effect denied;
- insufficient inventory;
- player exits conversation;
- save/reload after branch;
- voice file missing.

## P37.21 Manual acceptance scenario

Talk to settler before helping.

Observe one set of lines.

Provide required food/resource.

Talk again.

Observe changed knowledge/history-aware response.

Reload and confirm consequence remains.

## P37.22 Rule-of-cool target

The first conversation where an NPC actually **remembers something that mattered**.

## P37.23 Exit gate

Authorable persistent condition-aware dialogue exists.

## P37.24 Downstream unlock

P38 and later Quest/Event systems.

## P37.25 Known risks / ADR triggers

- dialogue graph representation;
- localisation/voice line identity;
- conversation concurrency scope in future multiplayer.

---

# P38 — THREE SOULS AND A FIRE

**Classification:** INTEGRATION / COOL-PULL  
**Arc:** ARC VI  
**Player/creator payoff:** Three named people live around a small hearth, meet basic needs, make decisions, talk and remain themselves when the player leaves.

## P38.1 Purpose

Certify the first genuinely living social simulation.

P38 integrates:

- NPC identity;
- humanoid bodies;
- voices;
- task planning;
- needs;
- dialogue;
- movement;
- inventory/resources;
- persistence;
- presentation.

## P38.2 Authoritative source packet

- P32–P37;
- P12–P24;
- current NPC Village System;
- seven-needs authority;
- ART-05/07/08;
- PROD-03 entity/persistence/LOD;
- PROD-05 primitives.

## P38.3 Entry gate

- P32–P37 COMPLETE;
- PG-05 already passed.

## P38.4 Dependencies

### Hard

P32–P37 plus supporting earlier systems.

### Forge

Character/Voice/Dialogue plus shared presentation.

### Runtime

entity movement, planner, needs, inventory, save.

### Content

three named settlers and one tiny hearth environment.

## P38.5 Universal primitives used

Nearly all relevant early primitives:

- Identity;
- State;
- Ownership;
- Permission hook;
- Capability;
- Transaction;
- Knowledge;
- History;
- Membership;
- Relationship;
- Reservation;
- Result/Reason.

## P38.6 In scope

Create a tiny persistent group:

### Three named settlers

Each has:

- distinct person ID;
- distinct appearance;
- voice profile;
- inventory/ownership;
- needs;
- task state;
- simple relationship/knowledge hooks;
- dialogue.

### Hearth environment

Contains enough real resources/services for:

- warmth/fire;
- sleep;
- food;
- simple work;
- social gathering;
- safe navigation.

### Required behaviours

Settlers can:

- wake/rest;
- eat;
- use fire/hearth;
- perform simple work placeholder;
- move between points;
- idle/socialise;
- speak with player;
- react to missing food/bed/fire;
- preserve identity/state across player absence/reload.

### Integration diagnostics

Player/developer can inspect:

- current task;
- task reason;
- current needs;
- service blockers;
- person ID;
- recent meaningful history.

## P38.7 Explicit non-scope

P38 is **not**:

- a village;
- settlement growth;
- builder construction;
- professions;
- farming;
- warehouse/logistics;
- migration;
- relationships simulation depth;
- families/generations;
- raids;
- politics.

Those belong later.

## P38.8 Implementation capability requirements

The scene must work because systems compose.

Do not write:

```text
ThreeSoulsAndFireDemo.gd
```

containing bespoke logic such as:

- if Mara hungry then walk to crate;
- if night then all sleep.

The fixture should instantiate normal production definitions/tasks/services.

## P38.9 Forge requirements

All three people use normal Forge source paths.

Dialogue and voice use shared specialist services.

## P38.10 Runtime requirements

The player should be able to leave the hearth, unload it where practical, return and see reconciled persistent state.

At this stage, distant time progression may be minimal/bounded.

The key proof is identity/state continuity, not full autonomous village production.

## P38.11 Canonical content subset

Only the tiny hearth slice.

Prefer named reusable fixtures that can later become regression content.

## P38.12 Persistence implications

Critical.

Persist:

- person identity;
- body/profile references;
- inventory;
- needs;
- hearth/fire state;
- meaningful dialogue/history;
- task state as required.

## P38.13 Multiplayer / authority implications

Architecture remains authority-safe.

No multiplayer required.

## P38.14 Simulation-LOD implications

At minimum prove:

- active;
- projection unloaded;
- reactivated.

If local time progression while away is included, it must be bounded/conserved.

## P38.15 Accessibility / localisation implications

Player must be able to understand why settlers are unhappy/blocked through:

- UI/text;
- world behaviour;
- optional sound;

not audio/colour alone.

Dialogue supports scalable text/focus/captions.

## P38.16 Performance implications

Three-person fixture is not a population-scale performance proof.

However, no obvious per-frame pathology should exist.

## P38.17 Security / trust implications

No system may invent food/resources to keep demo looking alive.

## P38.18 Recommended child decomposition

- P38-A — hearth fixture/source;
- P38-B — three settler production sources;
- P38-C — planner/needs/dialogue integration;
- P38-D — persistence/unload/reload;
- P38-E — human living-world/UX review;
- P38-F — PG-06 reconciliation.

## P38.19 Acceptance matrix

| ID | Requirement | Evidence | Gate |
| --- | --- | --- | --- |
| P38-AC01 | Three named settlers remain distinct persistent identities | EV-D / EV-C | Required |
| P38-AC02 | Each can autonomously choose/perform basic need/task actions | EV-C | Required |
| P38-AC03 | Food/service use consumes/uses real authoritative resources/state | EV-B / EV-C | Required |
| P38-AC04 | Removing food/bed/fire produces explainable changed behaviour | EV-C / EV-B | Required |
| P38-AC05 | Settlers can speak through P37 dialogue with state/history-aware variation | EV-C | Required |
| P38-AC06 | Voice/audio is supplementary and accessible text remains | EV-F | Required |
| P38-AC07 | Leaving/unloading/returning preserves identities and coherent state | EV-D | Required |
| P38-AC08 | Full save/close/reopen preserves hearth and people | EV-D | Required |
| P38-AC09 | Fixture contains no bespoke three-NPC control script that bypasses production systems | EV-A / review | Required |
| P38-AC10 | Human review confirms actions/reasons are understandable without debug-only knowledge | EV-G | Required |
| P38-AC11 | No resource duplication/loss found through repeated multi-NPC consumption/reservation test | EV-B negative | Required |
| P38-AC12 | Final SHA/CI passes | EV-H | Required |

## P38.20 Negative tests

- one bed removed;
- food exhausted;
- fire extinguished;
- route blocked;
- one settler unloaded mid-task;
- two settlers reserve same single resource;
- dialogue effect fails;
- save during task;
- NPC projection destroyed;
- one settler injured/dead in controlled test where current scope permits.

## P38.21 Manual acceptance scenario

Start at the hearth with three named settlers.

Observe each for several in-world hours or accelerated test period.

Interact through dialogue.

Remove or exhaust one service/resource.

Observe understandable planner/need response.

Restore service.

Leave the area.

Return.

Save/quit/reload.

Verify:

- same three people;
- same names/identities;
- plausible current states;
- no duplicated food/resources;
- prior consequential conversation/history remains where expected.

## P38.22 Rule-of-cool target

This is a major emotional milestone.

The desired reaction is:

> **“Holy shit, these three little voxel people actually live here.”**

Not because a cutscene says so.

Because the systems make it true.

## P38.23 Exit gate — PG-06 FIRST LIVING HEARTH

PG-06 passes when:

- P32–P38 COMPLETE;
- three persistent humanoid NPCs inhabit one tiny production environment;
- identity, body, voice, needs, tasks, resources, movement and dialogue compose correctly;
- save/unload/reload preserves continuity;
- no optional model-based AI is required.

## P38.24 Downstream unlock

ARC VII — FROM CAMPFIRE TO KINGDOM:

- Structure/Blueprint contract;
- Structure Forge;
- semantic buildings;
- construction;
- NPC Builder;
- households;
- settlement planning;
- roads/parcels;
- migration;
- Campfire → Hamlet integration.

## P38.25 Known risks / ADR triggers

- NPC planner/need interaction producing unstable loops;
- identity/body migration;
- dialogue/history storage;
- local simulation catch-up if added earlier than planned.

---

# 05. Arc V Integration Gate — PG-05 Summary

PG-05 requires:

| Capability | Parent |
| --- | --- |
| Entity/Creature contract | P25 |
| Character/Creature Forge v1 | P26 |
| Rig Forge | P27 |
| Living entity runtime | P28 |
| Creature behaviour | P29 |
| Equipment Forge | P30 |
| First combat | P31 |

Minimum end-to-end scenario:

```text
author creature
→ rig
→ bake
→ spawn persistent entity
→ navigate
→ perceive/react
→ equip/attack
→ fight player
→ resolve damage/death
→ save/reload persistent result
```

---

# 06. Arc VI Integration Gate — PG-06 Summary

PG-06 requires:

| Capability | Parent |
| --- | --- |
| NPC identity | P32 |
| Humanoid Character Forge | P33 |
| Voice / Character Audio | P34 |
| NPC Planner / Task System | P35 |
| Personal Needs / Seven Pillars | P36 |
| Dialogue Forge | P37 |
| Three Souls and a Fire | P38 |

Minimum end-to-end scenario:

```text
three persistent people
→ wake / move / eat / rest / work / socialise
→ use real resources/services
→ speak with player
→ react to changed conditions
→ unload
→ reload
→ remain the same people
```

---

# 07. Recommended Production Concurrency

The numeric order remains the governing default.

Limited overlap is acceptable.

## P25 / P26

P26 UI/source exploration may begin while late P25 contract tests finish, provided P25 identity/body boundaries are not redefined.

## P26 / P27

Rig template work may begin against one controlled body fixture once anatomy/joint requirements are stable.

P27 cannot close before P26 representative body source passes.

## P28 / P29

Behaviour-profile schema may be drafted during late P28.

Do not let behaviour invent its own movement/navigation system.

## P30 / P31

Combat-action data design can begin once equipment action profiles stabilize.

P31 cannot bypass P30 equip/ownership transactions.

## P32 / P33 / P34

Person identity, humanoid body production and voice source work can overlap if:

- P32 remains semantic authority for person identity;
- P33 owns appearance/body only;
- P34 owns audio only.

## P35 / P36 / P37

These can overlap carefully.

P35 owns task choice/execution.

P36 supplies need/service inputs.

P37 supplies conversation.

None may become a hidden second NPC brain.

---

# 08. What Must NOT Sneak Into Arcs V–VI

## Entity systems

- full boss framework;
- full flying/swimming navigation;
- breeding/generations;
- giant ecology simulation;
- complete injury/medical system.

## NPC systems

- professions/jobs at production depth;
- construction;
- settlement planning;
- autonomous extraction/crafting;
- migration;
- households at full depth;
- politics;
- economy;
- factions/diplomacy.

## “AI”

- LLM NPC dialogue;
- generative personality;
- model-based planning;
- World Mind;
- AI companion.

All of that remains later.

---

# 09. Cross-Arc Architectural Discoveries Locked Here

## 09.1 Person identity must remain above body source

This is now explicit.

The Forge creates bodies/presentation.

The world persists people.

That distinction is necessary for:

- equipment;
- ageing;
- injury;
- clothing;
- transformation;
- migration;
- multiplayer;
- save compatibility.

## 09.2 Creature behaviour and NPC planner are related but not identical

P29 owns reusable reactive creature behaviour.

P35 owns person/task planning.

They may reuse:

- perception;
- task lifecycle;
- movement requests;
- result reasons.

They should not be forcibly merged into one enormous behaviour system if their semantics differ.

## 09.3 Navigation remains downstream of intent

Creatures/NPCs choose destinations/tasks.

Navigation solves movement.

This protects us when later entities need:

- roads;
- swimming;
- flying;
- vessels;
- portals.

## 09.4 The seven settlement pillars become production contracts at P36

The pillars are not vague design words anymore.

P36 creates the service/coverage concepts later buildings, professions, logistics and settlement planners will use.

## 09.5 Dialogue is already a Knowledge/History client

P37 must never become an omniscient story database.

The speaker's authorised knowledge/history matters from the first version.

This prepares later:

- rumours;
- quests;
- factions;
- long-term memory.

## 09.6 P38 is the first civilisation seed

Three Souls and a Fire intentionally stops before settlement mechanics.

That means ARC VII can scale **proven people** into a settlement rather than building settlement abstractions first and hoping NPCs fit later.

---

# 10. Recommended Persistent Regression Fixtures

Retain:

- P25 persistent entity identity fixture;
- P26 creature source/golden body;
- P27 rig/retarget fixture;
- P28 dynamic voxel-navigation fixture;
- P29 passive-vs-hostile behaviour fixture;
- P30 equipment composition fixture;
- P31 first combat fixture;
- P32 three named person records;
- P33 humanoid appearance/equipment fixture;
- P34 character voice/caption fixture;
- P35 competing-resource task fixture;
- P36 two-beds-for-three-people need fixture;
- P37 state-aware conversation fixture;
- P38 Three Souls and a Fire integration world.

P38 should become a long-lived regression fixture for later NPC/settlement work.

---

# 11. ProductionRegistry Seed Entries

Add/maintain:

```text
P025 — The Shape of Life
P026 — Flesh from Voxel
P027 — Bones Beneath
P028 — Give It Life
P029 — Tooth & Claw
P030 — Steel in Hand
P031 — Trial by Blood
P032 — A Name Beside the Fire
P033 — Faces of the Living
P034 — Voices Around the Hearth
P035 — Thought Before Action
P036 — Bread, Bed & Belonging
P037 — Words Between People
P038 — Three Souls and a Fire
```

No status becomes READY merely because PROD-09 exists.

---

# 12. Open Decisions Deliberately Deferred to Execution Evidence

PROD-09 does not silently decide:

- exact active entity population budget;
- exact navigation tile/grid implementation;
- exact behaviour scoring model;
- exact sense-query cadence;
- exact creature spawn/population system;
- exact combat damage numbers;
- exact stamina values;
- exact armour formula;
- exact humanoid body parameter ranges;
- exact voice catalogue;
- exact planner utility weights;
- exact need decay rates;
- exact dialogue graph UI layout;
- exact relationship score model.

These remain measured/balanced/domain-owned decisions.

---

# 13. PROD-09 Acceptance Gate

PROD-09 is ready for owner lock when the owner agrees that:

- [ ] P25–P38 retain PROD-02 names/order;
- [ ] persistent entity identity is separate from active Godot actors;
- [ ] definition, body, rig, person and presentation layers are distinct;
- [ ] Creature Forge orchestrates shared services rather than duplicating them;
- [ ] Rig Forge uses semantic roles/sockets suitable for reuse/retargeting;
- [ ] P28 separates behaviour intent, navigation and movement execution;
- [ ] P29 ordinary creature logic is deterministic bounded behaviour, not model-based AI;
- [ ] P30 equipment composes with entities rather than cloning entity definitions;
- [ ] P31 combat outcome is authoritative and never owned by animation/VFX/audio;
- [ ] P32 person identity remains stable across body/presentation changes;
- [ ] P33 follows personhood-safe appearance rules;
- [ ] P34 character audio is restrained, state-bound and accessible;
- [ ] P35 is explicitly a deterministic NPC planner/task system, not generative AI;
- [ ] P35 uses real reservations/resources/locations and can explain task choices;
- [ ] P36 locks exactly seven main settlement pillars: Housing, Provisions, Health, Work, Safety, Infrastructure, Morale;
- [ ] service/need truth is semantic and cannot be granted by decorative appearance alone;
- [ ] P37 Dialogue Forge uses Knowledge/History and approved commands instead of omniscient/script mutation;
- [ ] P38 contains exactly a tiny social integration target rather than prematurely implementing a village;
- [ ] P38 contains no bespoke three-NPC demo brain;
- [ ] save/unload/reload continuity is a required part of both Arcs;
- [ ] no optional model-based AI is required anywhere in PROD-09;
- [ ] exact behavioural/balance/provider values remain evidence-driven.

---

# 14. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-09 — LEYFORGE ARCS V–VI PRODUCTION CONTRACTS — v0.1**
>
> ARC V establishes Leyforge's common living-entity foundation: stable entity definitions and persistent instances, Forge-authored creature bodies, reusable semantic rigs, active movement/navigation, bounded deterministic creature behaviour, composable equipment and authoritative combat. Entity identity, body source, rig, actor projection and presentation remain distinct; navigation executes movement intent rather than deciding behaviour; and animation, VFX and audio communicate combat without owning damage or life state. ARC VI then establishes persistent people: NPC identity independent of body presentation, humanoid Character Forge, restrained character voice, a deterministic task planner, personal needs connected to the seven canonical settlement pillars, state/knowledge/history-aware Dialogue Forge and the Three Souls and a Fire integration fixture. By P38, three named humanoid NPCs can live around one small hearth, use real resources and services, choose understandable tasks, speak with the player, react to changing conditions and remain the same people after unload/save/reload without any model-based AI dependency.

---

# 15. Next Document

After PROD-09 acceptance/reconciliation, continue to:

> **PROD-10 — Arcs VII–VIII Production Contracts: P39–P63**

That volume will cover:

- Structure / Blueprint contract;
- Structure Forge v1;
- semantic building validation;
- construction runtime;
- NPC Builder;
- households/residency;
- settlement planning;
- roads/parcels;
- migration/population;
- Campfire → Hamlet integration;
- Work / Profession contract;
- Work & Profession Forge;
- gathering/extraction;
- NPC crafting/processing;
- settlement inventory/warehousing;
- hauling/logistics;
- autonomous settlement production;
- mechanical power;
- universal machine/network implementation;
- Machine Forge;
- machine runtime;
- automated logistics;
- Signal & Logic Forge;
- first factory;
- A Town That Works.

This is where our three people around a fire start becoming a **civilisation**.

---

**End of PROD-09 v0.1 — Arcs V–VI Production Contracts Candidate**
