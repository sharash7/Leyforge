
# LEYFORGE PRODUCTION PROGRAMME

## PROD-05 — Universal Simulation Primitives & Cross-System Contracts

**Document ID:** PROD-05  
**Title:** Leyforge Universal Simulation Primitives & Cross-System Contracts  
**Version:** v0.1  
**Date:** 21 September 2026  
**Status:** **DRAFT FOR OWNER REVIEW — CROSS-SYSTEM CONTRACT CANDIDATE**  
**Project:** Leyforge  
**Product context:** Ley Realms / The Forge  
**Programme:** PROD — Detailed Production Plan & Implementation Handoff  
**Constitutional parent:** PROD-00 — Production Constitution, Authority & Scope  
**Source-routing parent:** PROD-01 — Legacy Canon & Source Crosswalk  
**Roadmap parent:** PROD-02 — Master Production Roadmap & Dependency Atlas  
**Runtime parent:** PROD-03 — Leyforge Runtime Engineering Architecture  
**Forge parent:** PROD-04 — The Forge Engineering & Creation Journey Architecture  
**Primary inherited baselines:** Document 18 engine-agnostic data/transaction/network concepts; Documents 17, 19, 20A–H; Sets 21/22; applicable FCC stable-identity/integration law; Sets 27–30 and their cross-system ownership concepts where current authority supports them  
**Primary downstream consumers:** PROD-06 through PROD-17, runtime services, Forge services, P01–P192 child slices, tests, UI reason systems, save/network schemas and ProductionRegistry

---

# 00. Executive Contract Statement

Leyforge contains many systems.

Those systems must not each invent their own private version of:

- identity;
- ownership;
- permission;
- state;
- connection;
- signal;
- movement;
- transaction;
- knowledge;
- history;
- composition;
- failure.

The purpose of PROD-05 is to define the **shared semantic language** used across the whole production game and The Forge.

The central promise is:

> **Shared concepts receive shared contracts; domain-specific behaviour extends those contracts instead of reimplementing them from scratch.**

This does not mean one giant “God Object” owns the game.

It means systems agree on what foundational words mean.

For example:

A warehouse, vessel, portal, ritual site and multiplayer settlement may all need a permission check.

They should not use five incompatible concepts for “permission.”

They may have different rules, but those rules should evaluate through one common permission/jurisdiction contract.

Likewise:

A machine belt, road, sea lane and portal connection all move something from one place to another.

They are not the same implementation.

But they can still share the higher-level language:

> **origin → destination → capacity → cost → risk → ownership → state**

The production primitives established here are:

1. **Identity** — what is this?
2. **State** — what condition is it currently in?
3. **Ownership** — who currently owns or controls it?
4. **Permission / Jurisdiction** — who may do what, where and under whose authority?
5. **Capability** — what can this thing legally do?
6. **Connection / Port / Socket** — how can it connect to something else?
7. **Signal** — what semantic information/event is being communicated?
8. **Transaction** — what authoritative change actually committed?
9. **Route** — how can an actor/resource/information move between places?
10. **Knowledge** — who knows what, from what source, with what confidence?
11. **History** — what important committed facts happened before?
12. **Composition** — how do understood things form a larger understood thing?
13. **Reason / Result** — why did an operation succeed, fail, block or degrade?
14. **Provenance** — where did this definition/source/result come from?

These contracts are deliberately reusable across:

- voxels;
- items;
- inventories;
- structures;
- settlements;
- machines;
- automation;
- magic;
- NPC work;
- economy;
- factions;
- vessels;
- realms;
- knowledge;
- quests/events;
- multiplayer;
- The Forge;
- content packs;
- optional AI.

---

# 01. Scope

PROD-05 owns:

- shared semantic primitive definitions;
- cross-system minimum fields;
- extension rules;
- stable result/reason architecture;
- typed connections;
- common ownership concepts;
- common permission evaluation shape;
- common transaction lifecycle;
- common route vocabulary;
- common knowledge vocabulary;
- common historical event identity;
- composition rules;
- cross-system interaction patterns;
- invariants that downstream systems must preserve.

PROD-05 does not own:

- exact gameplay balance;
- exact content IDs;
- final domain-specific schemas;
- implementation language;
- database layout;
- engine provider details;
- exact UI layout;
- exact faction/government law;
- exact machine power equations;
- exact water algorithm;
- exact AI behaviour.

Those belong to specialist systems.

---

# 02. Shared Contract Design Law

A universal primitive should exist only when the concept genuinely recurs across domains.

The contract should define:

- the common meaning;
- stable identity;
- common lifecycle;
- common failure semantics;
- common observability;
- extension points.

It should **not** flatten meaningful domain differences.

Example:

Mechanical power and Flux can both use a typed `ConnectionPort`.

They do not therefore share identical propagation physics.

The port contract defines:

- port identity;
- type/domain;
- direction;
- compatibility;
- capacity;
- connection state;
- owner/permission.

Mechanical power then extends with:

- torque;
- speed;
- rotation direction.

Flux extends with:

- amount;
- purity;
- instability;
- magical compatibility.

Shared infrastructure; distinct domain truth.

---

# 03. Contract Layering

Every shared primitive can have up to four layers:

```text
UNIVERSAL CONTRACT
common language
    ↓
DOMAIN EXTENSION
machine / route / magic / faction / knowledge specifics
    ↓
INSTANCE STATE
actual runtime object
    ↓
PRESENTATION
UI / visual / audio interpretation
```

Presentation never changes universal meaning.

A red warning icon may show `PERMISSION_DENIED`.

The icon colour is not the permission state.

---

# 04. Identity

## 04.1 Identity answers

> **What is this thing?**

Leyforge uses distinct identity classes.

At minimum:

- Definition identity;
- Persistent instance identity;
- World identity;
- Realm identity;
- Historical event identity;
- Transaction/operation identity;
- Source/Forge identity;
- Package identity;
- Session/runtime identity;
- Provider-local handle.

These must not be silently substituted for one another.

## 04.2 Definition identity

A definition ID identifies a reusable semantic type.

Examples:

```text
block.stone.granite
item.tool.pickaxe.iron
creature.goblin.raider
structure.house.cottage_basic
spell.arcane.light
```

Definition IDs survive:

- save/load;
- runtime reload;
- packaging;
- network transmission;
- migration where supported.

## 04.3 Persistent instance identity

Unique runtime-world instances use persistent identities where continuity matters.

Examples:

- named NPC;
- settlement;
- unique vessel;
- placed machine;
- important structure;
- portal anchor;
- unique item;
- faction;
- quest/event instance.

## 04.4 Runtime handles

Runtime handles may optimise lookup.

They are not canonical.

Examples:

- compact integer index;
- Node instance ID;
- Zylann type index;
- database row ID;
- peer ID.

## 04.5 Identity invariant

> **If two systems refer to the same durable world thing, they must be able to reconcile to the same canonical identity.**

---

# 05. Definition vs Instance

Definitions answer:

> What kind of thing is this?

Instances answer:

> What happened to this particular thing?

Example:

### Iron Pickaxe definition

- category;
- material;
- maximum durability;
- tool capability;
- repair rule;
- presentation family.

### Iron Pickaxe instance

- current durability;
- quality;
- owner;
- enchantments;
- unique history if tracked.

Do not mutate a definition because one instance became damaged.

---

# 06. Identity and The Forge

Forge source identities and gameplay identities are related but not always identical.

Example:

```text
material source
animation source
capture profile
rig template
```

may be reusable production-source identities rather than gameplay objects.

The Forge must declare binding between source and canonical definition where relevant.

---

# 07. State

## 07.1 State answers

> **What condition is this thing currently in?**

State can be:

- closed technical state;
- extensible gameplay state;
- quantitative state;
- composed state.

## 07.2 Closed technical states

Use closed enums where the complete set is small and implementation-owned.

Examples:

- save write phase;
- connection lifecycle;
- session lifecycle;
- chunk readiness.

## 07.3 Extensible gameplay state

Use stable IDs/tags when content or mods may extend categories.

Examples:

- status effects;
- machine faults;
- magical conditions;
- cultural affiliations;
- hazard classes.

## 07.4 Orthogonal state axes

Avoid giant mutually-exclusive enums where multiple truths may coexist.

A structure may simultaneously be:

- occupied;
- damaged;
- wet;
- powered;
- under construction.

Do not encode this as:

`OCCUPIED_DAMAGED_WET_POWERED_BUILDING`.

Use composable state dimensions.

---

# 08. State Transition Contract

Important state changes should define:

- previous state;
- requested transition;
- cause;
- authority;
- preconditions;
- resulting state;
- event/history implications.

A stale command may include the expected previous revision/state.

If the actual state has changed, the operation fails safely rather than overwriting newer truth.

---

# 09. State Ownership

Every authoritative state field has an owning system.

Examples:

- inventory quantity → InventoryService;
- machine process progress → Automation/Machine service;
- settlement membership → SettlementService;
- faction diplomacy → FactionService;
- known map location → Knowledge/Cartography service.

Other systems may observe or request change.

They do not each maintain private authoritative copies.

---

# 10. Ownership

## 10.1 Ownership answers

> **Who has the recognised claim/control relationship to this thing?**

Ownership is distinct from:

- physical possession;
- access permission;
- jurisdiction;
- authorship;
- faction membership.

Examples:

A merchant may own goods in a warehouse they do not own.

A settlement may own a road that passes through regional jurisdiction.

A player may be permitted to use a machine without owning it.

## 10.2 Ownership record shape

Conceptually:

```text
owner_subject
owned_object
ownership_type
scope
effective_time
source/authority
transferability
revision
```

Domain extensions define exact rights.

---

# 11. Ownership Types

Possible ownership classes include:

- personal;
- household;
- settlement;
- faction;
- public/common;
- organisation/guild;
- server/world;
- unowned;
- contested;
- custodial/temporary.

Exact content classes are downstream.

The universal primitive needs to represent more than “player yes/no.”

---

# 12. Possession vs Ownership

Physical possession does not necessarily transfer ownership.

Examples:

- caravan carries settlement-owned cargo;
- NPC worker holds employer-owned tool;
- warehouse stores trader-owned stock;
- player transports quest item owned by faction.

This distinction matters for:

- theft;
- trade;
- logistics;
- permissions;
- reputation;
- multiplayer.

---

# 13. Permission & Jurisdiction

## 13.1 Permission answers

> **May this subject perform this action on this target under these conditions?**

## 13.2 Jurisdiction answers

> **Which authority's rules apply here or to this relationship?**

These concepts form one shared evaluation framework.

## 13.3 Permission request

A permission evaluation conceptually receives:

```text
subject
action
target
location / realm / frame
time
context
claimed authority/role
world/server rules
```

It returns:

```text
ALLOW
DENY
ALLOW_WITH_CONDITION
DEFER_TO_HIGHER_AUTHORITY
```

plus a stable reason.

---

# 14. Permission Layers

A permission decision may evaluate layers such as:

1. world/server rule;
2. realm law;
3. faction/government law;
4. territory/jurisdiction;
5. ownership;
6. household/organisation role;
7. object-local ACL/policy;
8. temporary contract;
9. emergency state;
10. creator/server moderation rule.

Not every action needs all layers.

---

# 15. Permission Examples

The same contract can support:

- open chest;
- withdraw warehouse stock;
- place block;
- modify road;
- enter restricted district;
- use portal;
- operate vessel;
- change settlement policy;
- connect machine;
- cast prohibited ritual;
- edit shared Forge source;
- install server package.

Domain-specific permission rules remain separate.

---

# 16. Permission Reason Codes

Examples:

```text
PERMISSION_DENIED_NOT_OWNER
PERMISSION_DENIED_PRIVATE_PROPERTY
PERMISSION_DENIED_FACTION_RESTRICTED
PERMISSION_DENIED_SERVER_POLICY
PERMISSION_DENIED_MISSING_ROLE
PERMISSION_DENIED_PROTECTED_STRUCTURE
PERMISSION_DENIED_PORTAL_LOCKED
PERMISSION_DENIED_CONTENT_AUTHORITY
```

UI maps these to localised explanation.

---

# 17. Permission Cache Rule

Permission evaluation may be cached for performance only where invalidation is safe.

Changes that may invalidate permission include:

- ownership change;
- role change;
- faction membership;
- law change;
- territory control;
- server policy;
- object state;
- event/emergency state.

Never permanently cache “allowed” without considering authority changes.

---

# 18. Capability

## 18.1 Capability answers

> **What kinds of action or semantic role can this thing support?**

Examples:

- `can_mine`;
- `can_store_items`;
- `accepts_flux`;
- `provides_bed`;
- `supports_humanoid_rig`;
- `can_serve_as_portal_anchor`.

Capabilities should use stable semantic identifiers where extensibility matters.

## 18.2 Capability is not permission

A pickaxe may have capability to mine stone.

The player may still lack permission to mine a protected monument.

Capability:

> can it?

Permission:

> may it, here, now?

---

# 19. Requirement Contract

A system may declare requirements rather than hard-code specific IDs.

Example:

```text
requires capability: construction.material.wall
requires tag: weather_resistant
minimum hardness: X
```

The Forge can validate compatible content.

This allows composition without exploding bespoke code.

---

# 20. Connection

## 20.1 Connection answers

> **How can two understood things legally attach, exchange, reference or communicate?**

Connections have two broad classes:

- physical/spatial connection;
- semantic/logical connection.

## 20.2 Shared connection fields

Conceptually:

```text
connection_id
domain
endpoint_a
endpoint_b
direction
compatibility
capacity
state
owner
permission
geometry/socket data
revision
```

Domain extension owns additional semantics.

---

# 21. Typed Port Contract

A port is an exposed semantic endpoint.

Shared fields:

```text
port_id
port_type
direction
accepted/provided capability
capacity/rate
connection_limit
geometry/socket
enabled state
owner
permission rule
fault state
```

Possible port domains:

- item input/output;
- mechanical power;
- Flux;
- electrical/industrial;
- fluid;
- signal/control;
- navigation;
- audio/event;
- interaction;
- attachment.

---

# 22. Port Compatibility

Compatibility must be semantic.

Do not connect merely because two sockets are physically adjacent.

Compatibility may depend on:

- type;
- direction;
- size/class;
- material;
- pressure/voltage/power tier;
- Flux school/profile;
- ownership;
- filter;
- adapter;
- world/server restrictions.

---

# 23. Adapters

Adapters allow intentionally compatible bridging.

Examples:

- small-to-large pipe adapter;
- mechanical gearbox;
- Flux converter;
- road-to-dock transfer point;
- portal freight interface.

An adapter is explicit content/system capability.

The engine must not silently coerce incompatible domains.

---

# 24. Connection State

Possible common states:

- disconnected;
- pending;
- connected;
- blocked;
- faulted;
- disabled;
- incompatible;
- permission-denied.

Domain-specific state extends this.

---

# 25. Socket vs Port

A **socket** primarily answers:

> where/how does something attach?

A **port** primarily answers:

> what semantic flow/connection can occur?

A port may be spatially anchored to a socket.

Not every socket is a flow port.

Example:

- sword hand grip = attachment socket;
- furnace fuel input = item port + spatial socket.

---

# 26. Signal

## 26.1 Signal answers

> **What semantic state/event/message is being communicated through an approved channel?**

Player-constructible signals are not unrestricted engine messaging.

## 26.2 Signal shape

Conceptually:

```text
signal_type
source
target/channel
payload schema
timestamp/world time
authority
correlation_id
ttl / persistence class
```

Payload is typed/validated.

---

# 27. Signal Classes

Possible classes:

- boolean;
- pulse;
- numeric;
- bounded enum;
- semantic event;
- state change;
- alarm;
- request;
- acknowledgement.

Signal Forge exposes approved classes, not arbitrary script objects.

---

# 28. Signal vs Domain Event

A domain event is an authoritative fact emitted after commit.

A player signal may represent control intent/logic state.

Example:

```text
lever ON
→ signal network
→ machine receives ENABLE request
→ machine validates permission/state
→ machine state commits ACTIVE
→ MachineActivated domain event
```

The signal itself did not make the machine active.

---

# 29. Signal Boundaries

Player logic may read approved state such as:

- storage full;
- machine blocked;
- time/night;
- pressure plate activated;
- Flux low;
- door open;
- crop ready.

Player logic may trigger approved actions such as:

- enable machine;
- toggle light;
- ring bell;
- open authorised gate;
- change allowed routing priority.

It may not invoke arbitrary internal service methods.

---

# 30. Event Correlation

Signals, commands and domain events should carry correlation identifiers where useful.

This allows diagnostics to show:

```text
lever activation
→ signal 38
→ command 892
→ machine transition
→ sound/VFX
```

without guessing from timestamps.

---

# 31. Transaction

## 31.1 Transaction answers

> **What authoritative state/resource change actually committed?**

Transactions protect conservation and consistency.

## 31.2 Transaction lifecycle

The shared lifecycle is:

1. Identify;
2. Validate;
3. Reserve if needed;
4. Commit;
5. Record;
6. Release/rollback if failure.

Not all transactions require a separate reservation phase.

---

# 32. Transaction Identity

Every consequential retryable transaction should have a stable operation/correlation identity.

This supports:

- deduplication;
- network retries;
- save recovery;
- diagnostics;
- contribution tracking.

---

# 33. Transaction Conservation Law

Items, fluids, fuel, Flux/mana units, project supplies and currency may move only through:

- successful validated transaction;
- explicit transformation recipe/process;
- explicit world loss/destruction event;
- explicit creation source authorised by the owning system.

No resource may appear/disappear because:

- chunk unloads;
- client retries;
- machine changes LOD;
- entity despawns visually;
- save occurs;
- route representation changes.

---

# 34. Reservation

Reservation is a claim on existing capacity/resource.

Reservation is not duplication.

Example:

Warehouse has 100 stone.

Project reserves 60.

Warehouse still contains 100 physical stock but only 40 is available for unrelated allocation.

When 20 is delivered:

- warehouse physical stock reduces to 80;
- project delivered stock increases to 20;
- remaining reservation updates accordingly.

Exact accounting is owned by inventory/project systems.

---

# 35. Transaction Result

A transaction result includes:

```text
transaction_id
success/failure
committed changes
reason_code
source revision
destination revision
world time
authority
history/event references if generated
```

---

# 36. Composite Transaction

Some operations span multiple owners.

Example trade:

- money/currency;
- item stock;
- ownership;
- reputation/history;
- contract state.

Composite transaction coordination must define which parts are atomic and how partial failure recovers.

The system should not rely on “we probably won't crash between subtracting coins and adding item.”

---

# 37. Route

## 37.1 Route answers

> **How can something travel or be transferred between places?**

Route is a higher-level semantic concept.

Possible route domains:

- walking path;
- road;
- caravan route;
- rail;
- sea lane;
- vessel voyage;
- underground route;
- portal route;
- magical route.

## 37.2 Shared route shape

Conceptually:

```text
route_id
origin
destination
route_type
path/edge references
capacity
travel_cost
estimated_time
risk
ownership
permissions
condition
status
cargo/actor compatibility
history
```

---

# 38. Route vs Local Navigation

A route does not require every local nav cell to remain loaded.

Regional route:

> Forest Hamlet → Riverhold

Local navigation:

> walk around this cart and enter the warehouse door.

These are related but different layers.

---

# 39. Route Segment

Large routes may contain segments.

Segment state may include:

- terrain class;
- bridge;
- road condition;
- weather;
- danger;
- toll;
- owner;
- blockage.

A damaged segment may invalidate/recalculate the route.

---

# 40. Route Cost

Route cost may combine:

- time;
- distance;
- terrain;
- weather;
- safety;
- fees;
- capacity;
- vehicle compatibility;
- political access;
- maintenance state.

Systems should query route service rather than each inventing unrelated long-distance travel estimates.

---

# 41. Route Capacity

Capacity is domain specific.

Examples:

- road freight per period;
- dock berth throughput;
- portal transfer limit;
- bridge weight class;
- trail pack-animal limit.

The shared contract allows capacity to exist without requiring one universal unit.

---

# 42. Route Ownership and Access

Route ownership and route permission use the shared ownership/permission primitives.

Examples:

- public road;
- private mine road;
- faction checkpoint;
- toll road;
- military-only portal;
- blockaded sea lane.

---

# 43. Route History

Route history may record:

- construction;
- repair;
- abandonment;
- raids;
- closures;
- trade volume;
- discovery;
- change of control.

This links Route to History.

---

# 44. Knowledge

## 44.1 Knowledge answers

> **Who knows what, how do they know it, and how certain/current is that knowledge?**

World truth and knowledge are separate.

The engine may know:

> Dungeon exists at coordinate X.

Player knowledge may be:

> Rumours say ruins lie beyond the northern ridge.

---

# 45. Knowledge Record

Conceptually:

```text
knowledge_id
subject/topic
holder
knowledge_type
claim/content reference
source
confidence
precision
observed_time
validity/staleness
visibility/permission
supporting evidence
contradictions
```

Exact domain representation varies.

---

# 46. Knowledge Types

Possible types:

- direct observation;
- verified fact;
- report;
- rumour;
- cultural belief;
- inference;
- hypothesis;
- map observation;
- learned recipe;
- research conclusion;
- historical record;
- secret/restricted information;
- outdated fact.

The UI may present these differently.

---

# 47. Knowledge Holder

Knowledge may belong to:

- player character;
- party;
- household;
- settlement;
- faction;
- institution;
- NPC;
- server/world public knowledge.

Sharing is explicit.

---

# 48. Knowledge Source

Source matters.

Examples:

- witnessed directly;
- told by named NPC;
- read in book;
- surveyed;
- map purchased;
- faction intelligence;
- research experiment;
- magical divination;
- inherited archive.

A source may itself have credibility/confidence.

---

# 49. Knowledge Precision

Knowledge can be:

- exact;
- approximate;
- regional;
- directional;
- qualitative.

Example:

```text
exact coordinates
vs
somewhere east of the river
```

Map UI should preserve this distinction.

---

# 50. Knowledge Staleness

Knowledge can be true when learned and false later.

Example:

> Bridge is open.

Three days later:

> Bridge washed out.

The player's old knowledge is not a “lie.”

It is stale information.

This supports believable world uncertainty without arbitrary misinformation.

---

# 51. Knowledge Propagation

Information can move through routes and actors.

Possible carriers:

- traveller;
- caravan;
- messenger;
- faction report;
- library;
- map;
- magical communication;
- trade network.

Propagation has:

- origin;
- latency;
- scope;
- distortion rules where allowed;
- delivery event.

---

# 52. Knowledge and Permissions

Some facts are restricted.

Examples:

- military route;
- hidden recipe;
- faction plan;
- private household information;
- server moderation data.

Knowledge visibility uses Permission.

Knowing the engine fact does not imply UI may reveal it.

---

# 53. Knowledge and AI

Later AI companions/NPC intelligence may only access the knowledge authorised for that subject/system.

AI does not receive omniscient internal truth by default.

This is a hard future boundary.

---

# 54. History

## 54.1 History answers

> **What meaningful committed facts happened before?**

History is not a log of every frame.

It records durable events that matter to:

- NPC memory;
- settlement history;
- faction relations;
- world chronicle;
- quests;
- ruins;
- player consequences.

---

# 55. Historical Event Record

Conceptually:

```text
event_id
event_type
world_time
location
participants
causes
committed outcomes
related transactions
related state changes
knowledge visibility
importance
retention policy
```

---

# 56. History vs Event Bus

A runtime event may be transient.

A historical event is retained because later systems need it.

Example:

`DoorOpened` may be transient.

`VillageFounded` is historical.

---

# 57. Historical Importance

Retention can be tiered.

Possible tiers:

- transient;
- short-term;
- personal memory;
- settlement history;
- regional history;
- world history.

This prevents endless storage of trivial facts.

---

# 58. Historical Causality

Where useful, historical events reference causes/parents.

Example:

```text
bridge_destroyed
    caused by storm_event
        contributes to caravan_delay
            contributes to food_shortage
```

This allows future Chronicle/UI explanations to show understandable consequence chains.

---

# 59. History and Physical Evidence

History may manifest physically.

Examples:

- rebuilt wall;
- memorial;
- abandoned mine;
- renamed road;
- ruin;
- altered settlement boundary.

Physical evidence remains normal world state linked to history.

---

# 60. Memory

NPC memory is a view/subset of History plus personal significance.

NPCs do not need a separate truth universe.

Memory records may add:

- emotional salience;
- relationship effect;
- decay;
- personal interpretation.

History:

> Player rescued NPC.

Memory:

> NPC trusts player more because of rescue.

---

# 61. Composition

## 61.1 Composition answers

> **What larger understood thing exists because these understood things are connected/configured together?**

Composition is central to Leyforge.

Examples:

- house;
- machine;
- factory;
- ritual;
- vessel;
- dungeon;
- settlement district;
- ecology;
- trade network;
- realm;
- pipe organ.

---

# 62. Composition Record

Conceptually:

```text
composition_id
composition_type
members
roles
connections
constraints
owner
state
dependencies
validation profile
runtime interpretation
```

Members remain canonical identities/instances.

---

# 63. Composition Does Not Duplicate Members

A structure references blocks.

It does not create hidden copies of block definitions.

A vessel references components.

A ritual references runes/components/participants.

This is the composition law.

---

# 64. Member Role

Composition gives members context-specific roles.

Example structure:

- this chest = public storage;
- this door = primary entrance;
- this bed = household sleeping slot;
- this block region = wall.

The chest remains canonical chest content.

The role belongs to the composition.

---

# 65. Composition Validation

Validation can check:

- required member roles;
- valid connections;
- spatial constraints;
- route/access;
- capability coverage;
- power/Flux;
- permissions;
- safety;
- production cost;
- performance.

---

# 66. Dynamic Composition

Some compositions change at runtime.

Examples:

- machine network connection;
- convoy;
- faction alliance;
- ritual participants;
- settlement district.

The composition contract should support revisioned membership.

---

# 67. Nested Composition

Compositions may contain compositions.

Example:

```text
City
 ├── Residential District
 │    ├── House
 │    └── Well
 ├── Industrial District
 │    └── Factory
 └── Harbour
      ├── Dock
      └── Vessel
```

Avoid double-counting nested functions/resources.

---

# 68. Composition and The Forge

Forge composition editors author:

- members;
- roles;
- constraints;
- connections;
- validation.

Runtime services interpret the resulting composition.

Forge does not need bespoke runtime code for every novel arrangement.

---

# 69. Result / Reason

## 69.1 Result answers

> **Did the requested operation succeed, and what changed?**

## 69.2 Reason answers

> **Why did it succeed, fail, block, degrade or require intervention?**

Every consequential command should produce a machine-readable result.

---

# 70. Shared Result Shape

Conceptually:

```text
status
reason_code
operation_id
authority
affected_ids
revision_before
revision_after
details
player_safe_message_key
diagnostic_context
```

Sensitive diagnostic data may be omitted from player-safe results.

---

# 71. Result Status

Recommended universal statuses:

- `SUCCESS`;
- `PARTIAL`;
- `REJECTED`;
- `BLOCKED`;
- `CONFLICT`;
- `STALE`;
- `RETRYABLE_FAILURE`;
- `FATAL_FAILURE`.

Domain systems may extend.

---

# 72. Reason-Code Namespace

Reason codes should be namespaced or categorised.

Examples:

```text
inventory.insufficient_quantity
permission.not_owner
route.blocked
machine.output_full
portal.destination_unavailable
forge.validation.missing_dependency
save.integrity_failure
network.stale_revision
```

Exact syntax may be refined.

---

# 73. UI Trust Rule

UI must not invent generic explanations if the authoritative system supplied a reason.

If a machine says:

`machine.output_full`

UI should not display:

> “Machine unavailable.”

It should explain the real cause.

---

# 74. Provenance

## 74.1 Provenance answers

> **Where did this definition, source, generated result or decision come from?**

Provenance is especially important for:

- Forge production;
- migrations;
- AI-assisted output;
- external assets;
- generated content;
- package content;
- worldgen feature derivation.

---

# 75. Provenance Record

Conceptually:

```text
provenance_id
subject
source_type
source_reference
creator/tool
task/work_record
authority_basis
generation_seed/settings
licence
timestamp
revision
```

Not every runtime object requires full provenance.

Production sources do.

---

# 76. Provenance vs History

History describes what happened to/in the world.

Provenance describes how a definition/source/product was produced.

A sword may have:

- production provenance: created from Forge source revision X;
- world history: forged by NPC Y and used in Battle Z.

Separate concepts.

---

# 77. Relationship Primitive

Relationships recur across:

- NPCs;
- factions;
- settlements;
- trade partners;
- diplomacy;
- knowledge sources.

A universal relationship base may include:

```text
subject_a
subject_b
relationship_type
directionality
strength/state
history refs
effective time
```

Domain extensions own exact values.

Do not force interpersonal affection and diplomatic alliance into the same scoring model.

They may share identity/history infrastructure while remaining domain-specific.

---

# 78. Membership Primitive

Membership expresses belonging to a group.

Examples:

- household;
- settlement;
- faction;
- crew;
- guild;
- party.

Conceptually:

```text
subject
group
role
status
joined_time
left_time
permissions
history refs
```

This supports role-based permissions.

---

# 79. Role Primitive

Roles describe context-specific responsibility/capability.

Examples:

- builder;
- captain;
- warehouse manager;
- mayor;
- faction officer;
- Forge reviewer.

Role does not necessarily imply ownership.

Role may grant permissions.

---

# 80. Reservation Primitive

Reservation appears across:

- inventory;
- construction;
- machine output;
- cargo;
- housing;
- workplaces;
- routes;
- appointments.

Shared reservation shape may include:

```text
reservation_id
subject/resource
holder
purpose
quantity/capacity
start
expiry
priority
state
```

Domain-specific extensions apply.

---

# 81. Claim Primitive

Claims differ from ownership.

Examples:

- territorial claim;
- construction claim;
- resource claim;
- temporary berth claim.

A claim may be contested and may mature into ownership/recognition later.

This becomes useful in P97 territory/jurisdiction.

---

# 82. Scope Primitive

Many systems need explicit scope.

Common scopes:

- personal;
- household;
- settlement;
- regional;
- faction;
- realm;
- world;
- server;
- package;
- source.

Scope should be explicit rather than inferred from ID format where consequences matter.

---

# 83. Temporal Scope

Some records are:

- instantaneous;
- scheduled;
- active during interval;
- permanent until changed;
- expiring;
- historical.

Permissions, reservations, effects and knowledge may depend on time.

---

# 84. Spatial Scope

Rules may apply to:

- object;
- voxel bounds;
- structure;
- parcel;
- settlement;
- territory;
- route;
- realm.

Use canonical spatial identities/bounds from PROD-03.

---

# 85. Authority

Every consequential record/change should be attributable to an authority.

Possible authority sources:

- world rule;
- server;
- settlement law;
- faction law;
- object owner;
- player;
- NPC role;
- system;
- Forge developer;
- package.

Authority is not synonymous with author.

---

# 86. Command Contract

Commands represent requested intent.

Shared fields may include:

```text
command_id
subject
action
target
context
expected_revision
authority_claim
timestamp
```

Commands enter through owning services.

---

# 87. Domain Event Contract

Committed domain events may include:

```text
event_id
event_type
world_time
source
affected subjects
authority
correlation_id
history_retention
```

Events are emitted after commit.

---

# 88. Query Contract

Queries are read-only.

A query may include:

- requester;
- knowledge context;
- permission context;
- requested projection/detail;
- current revision.

UI/AI/Forge tooling should query rather than bypass domain state.

---

# 89. View Model Contract

View models are presentation-safe projections.

They may filter by:

- player knowledge;
- permissions;
- accessibility;
- localisation;
- detail level.

View model is not the authoritative domain record.

---

# 90. Cross-System Example — Warehouse Withdrawal

```text
player requests withdrawal
    ↓
Identity resolves player + warehouse + item
    ↓
Permission checks role/ownership/jurisdiction
    ↓
Capability confirms warehouse can store/dispense item
    ↓
Transaction validates quantity
    ↓
Reservation/commit
    ↓
Ownership/possession updates
    ↓
Domain event emitted
    ↓
History recorded if consequential
    ↓
UI receives result/reason
```

No independent “warehouse permission system” is required.

---

# 91. Cross-System Example — Build a House

```text
Structure composition source
    ↓
valid canonical blocks/material roles
    ↓
construction project instance
    ↓
permission to build at parcel
    ↓
resource reservations
    ↓
routes deliver materials
    ↓
NPC Builder role/capability
    ↓
transactions consume stock
    ↓
SpatialChangeSets place blocks
    ↓
structure state progresses
    ↓
history records completion
```

The structure is a composition.

The materials remain canonical resources.

---

# 92. Cross-System Example — Automated Furnace

```text
item input port
mechanical/Flux power port
signal port
output port
    ↓
connections validated
    ↓
inventory transaction reserves ore/fuel
    ↓
machine state ACTIVE
    ↓
processing transaction transforms inputs
    ↓
output inventory commits ingots
    ↓
signal emits OUTPUT_FULL if blocked
    ↓
presentation observes state
```

The moving ore mesh is never authoritative quantity.

---

# 93. Cross-System Example — Ward Alarm

```text
Ward state changes DAMAGED
    ↓
authoritative domain event
    ↓
approved signal output: WARD_DAMAGED
    ↓
signal network
    ↓
alarm device receives
    ↓
permission/capability checks
    ↓
bell/light activates
    ↓
settlement planner may create repair task
```

This composes magic, signals and settlement work without bespoke ward-alarm code.

---

# 94. Cross-System Example — Caravan

```text
trade contract
    ↓
warehouse reservation
    ↓
cargo transaction
    ↓
Route selected
    ↓
crew/vehicle capability
    ↓
ownership/permission along route
    ↓
near/far travel
    ↓
events/history
    ↓
destination transaction
    ↓
market/economy reacts
```

Route representation can change without changing cargo identity.

---

# 95. Cross-System Example — Restricted Portal

```text
actor requests portal use
    ↓
capability: portal active
    ↓
permission:
  server rule
  realm law
  faction access
  key/ritual condition
    ↓
route: source realm → destination realm
    ↓
transfer transaction
    ↓
history
    ↓
knowledge may update destination discovery
```

One permission contract handles multiple rule sources.

---

# 96. Cross-System Example — Rumour

```text
historical event occurs
    ↓
Knowledge record created for witness
    ↓
NPC travels route
    ↓
information propagation
    ↓
another settlement receives report
    ↓
confidence/source retained
    ↓
player later hears rumour
```

The world event and player knowledge remain distinct.

---

# 97. Cross-System Example — War

```text
territorial claim
+ relationship/grievance history
+ resource/economic pressure
+ government authority
    ↓
diplomatic state changes
    ↓
mobilisation
    ↓
route/capacity/logistics
    ↓
military actions
    ↓
transactions consume supplies
    ↓
state/territory changes
    ↓
history
    ↓
knowledge propagates
```

War does not require one giant political script.

It composes existing primitives.

---

# 98. Cross-System Example — Vessel

```text
Vessel composition
    ↓
canonical components/materials
    ↓
vessel-local spatial frame
    ↓
crew memberships/roles
    ↓
cargo transactions
    ↓
ports/signals/power
    ↓
Route at sea
    ↓
ownership/permission
    ↓
damage state
    ↓
history
```

The same primitives work in a moving frame.

---

# 99. Cross-System Example — Flux Pipe Organ

```text
Structure composition
    ↓
key inputs
    ↓
Signal ports
    ↓
approved logic/sequencer
    ↓
Flux power
    ↓
machine/valve state
    ↓
Animation
    ↓
Sound/Music event
    ↓
Lighting/VFX
```

No `PipeOrganSystem` is required.

This is the canonical composition thought experiment.

---

# 100. Cross-System Example — Forge Collaboration

```text
source identity
    ↓
membership/role
    ↓
permission to edit
    ↓
semantic Forge operations
    ↓
revision
    ↓
dependency invalidation
    ↓
validation
    ↓
history/provenance
    ↓
package/bake
```

Forge uses the same primitive language where appropriate.

---

# 101. Cross-System Example — Optional AI Proposal

```text
AI identity / authority context
    ↓
query authorised Knowledge / Forge source
    ↓
propose command or Forge operation
    ↓
permission/capability validation
    ↓
human approval where required
    ↓
normal authoritative commit
    ↓
history/provenance
```

AI does not bypass the contract layer.

---

# 102. Serialization Law

Persistent shared primitives must serialize stable semantic fields.

Do not persist:

- raw Node reference;
- pointer;
- transient peer ID;
- provider-local integer without semantic mapping.

Persist:

- stable IDs;
- revisions;
- relationship endpoints;
- explicit state;
- version.

---

# 103. Network Law

Network protocols transmit:

- stable identity;
- command/result semantics;
- revisions;
- transaction IDs;
- required domain data.

Clients may receive compact handles after negotiated mapping, but durable protocol meaning remains independent.

---

# 104. Forge Law

Forge sources should expose shared primitives directly.

Examples:

- ports visualised in 3D;
- permission profile selector;
- route connector;
- state matrix;
- capability list;
- knowledge visibility;
- history hooks.

Creators should not type arbitrary internal strings where structured choices exist.

---

# 105. UI Law

UI must use shared reason/state/knowledge semantics.

Examples:

- show blocked route cause;
- show who owns stock;
- show why action denied;
- show whether map fact is rumour/exact;
- show machine state from authoritative state.

UI may simplify detail.

It may not contradict truth.

---

# 106. Accessibility Law

Critical semantics need accessible alternatives.

Examples:

- state not colour-only;
- permission denied not sound-only;
- route blockage represented textually;
- signal state inspectable;
- knowledge confidence not only hue.

---

# 107. Localisation Law

Shared reason codes map to localisation keys.

Stable machine-readable semantics remain language-neutral.

---

# 108. Performance Law

Shared primitives should support compact runtime projection.

Universal contracts do not mean giant heavyweight objects for every voxel.

Examples:

- immutable definition IDs resolve to compact handles;
- transactions batch where safe;
- route summaries aggregate distant travel;
- history retention is tiered;
- knowledge propagation is event-based/bounded;
- permission may use safe caches.

Semantic clarity and runtime efficiency are compatible.

---

# 109. Simulation LOD Law

Promotion/demotion must preserve shared primitive meaning.

Examples:

- owner remains owner;
- reservation remains reserved;
- cargo quantity remains exact;
- route destination remains same;
- historical events remain;
- knowledge holder remains;
- network connection topology remains.

Representation can simplify.

Truth cannot silently change.

---

# 110. Versioning

Every shared primitive schema is versioned.

A change that alters durable meaning requires:

- schema migration;
- compatibility handling;
- or explicit break/rejection.

Do not change the meaning of an existing field while keeping the same version.

---

# 111. Extensibility Rule

Domain extensions may add fields and rules.

They may not contradict the universal contract.

Example:

`MechanicalPowerPort` may extend `ConnectionPort`.

It may not redefine `direction = INPUT` to mean “sends output.”

---

# 112. Namespaces

Extensible semantic types use stable namespaces where needed.

Examples:

```text
signal.machine.output_full
capability.storage.item
permission.structure.modify
route.sea.trade
knowledge.map.location
state.machine.blocked
```

Exact naming convention will be standardised in implementation/registry docs.

---

# 113. Primitive Ownership Table

| Primitive | Primary contract owner | Typical domain owners |
| --- | --- | --- |
| Identity | Registry/Core | all |
| State | Core contract | each domain |
| Ownership | Core/Social | inventory, structures, settlements, factions |
| Permission/Jurisdiction | Core/Social | server, factions, settlement, objects |
| Capability | Registry/Core | items, entities, structures, machines, Forge |
| Connection/Port | Core/Automation | machine, magic, fluid, route, structure |
| Signal | Signal/Automation | machines, magic, structures, UI alarms |
| Transaction | Core/Inventory | inventory, trade, construction, portals |
| Route | Route/Movement | roads, sea, portal, underground |
| Knowledge | Knowledge | player, NPC, settlement, faction, Codex |
| History | Event/History | NPC, settlement, faction, world |
| Composition | Forge/Core | structure, vessel, ritual, realm, networks |
| Result/Reason | Core | all consequential systems |
| Provenance | Forge/Production | source, package, generation, AI |

PROD-06 will assign implementation/evidence governance, not redefine semantics.

---

# 114. Anti-Duplication Rules

The following are prohibited unless a specialist ADR proves a real semantic difference:

- separate warehouse permission model unrelated to shared permission;
- separate vessel ownership concept unrelated to shared ownership;
- separate portal route vocabulary unrelated to Route;
- separate magic transaction system that ignores conservation;
- separate machine event bus exposed as player signals;
- separate NPC memory truth independent from History;
- structure-private canonical block definitions;
- player Forge source format incompatible with developer source solely because authority differs.

---

# 115. Anti-God-System Rule

Shared primitives are not one giant central runtime service.

Do not create:

```text
UniversalEverythingManager
```

that owns all state.

Instead:

- common contract definitions;
- common IDs/reason/event conventions;
- specialist domain owners;
- shared infrastructure where useful.

---

# 116. Contract Test Requirements

Every universal primitive needs reusable tests.

Examples:

## Identity

- stable across save/reload;
- provider handle remap doesn't alter identity.

## Permission

- correct precedence;
- law/ownership changes invalidate decisions.

## Transaction

- retry does not duplicate;
- rollback restores reservations.

## Route

- blockage invalidates/recalculates;
- unloaded simulation preserves destination/cargo.

## Knowledge

- undiscovered truth is not leaked;
- stale knowledge remains distinguishable.

## History

- retained event IDs survive save/load.

## Composition

- dependency removal invalidates composition correctly.

---

# 117. Cross-System Contract Fixtures

PROD-06 should preserve a small suite of reusable integration fixtures including:

1. shared warehouse withdrawal;
2. NPC construction delivery;
3. automated furnace;
4. ward alarm;
5. caravan delivery;
6. restricted portal;
7. vessel cargo transfer;
8. rumour propagation;
9. Forge dependency invalidation;
10. multiplayer simultaneous transaction;
11. Flux pipe organ.

These fixtures test primitive reuse across otherwise different systems.

---

# 118. P57 Dependency Correction

The roadmap currently places:

- P56 — Turn the Wheel;
- P57 — Ports of Purpose.

Conceptually, the shared connection/port language must exist **before any system relies upon it as architecture**.

Therefore this document locks the following interpretation:

> **The universal Connection/Port Contract defined by PROD-05 is available as an architectural prerequisite before P56 implementation details are finalised. P57 is the production milestone that completes/proves the machine/network-facing implementation of that contract.**

This avoids renumbering P01–P192 while correcting the conceptual dependency.

The same rule applies to future Flux/fluid/signal domains.

---

# 119. Progression Forge Gap Routing

The roadmap references progression/unlock data in several systems but does not currently contain a dedicated early Progression Forge P-slice.

PROD-05 does not invent a new P-number.

It records the following requirement for PROD-06 and detailed Arc documents:

- progression/unlock references use stable Identity;
- unlock conditions use Capability/Knowledge/State/History where appropriate;
- authoring ownership must be assigned explicitly before large-scale progression content is produced;
- if a dedicated Progression Forge child slice is required, it should be allocated beneath the appropriate parent milestone without renumbering the roadmap unless owner governance later chooses otherwise.

---

# 120. Agriculture / Service-System Gap Routing

Several earlier documents and P-slices imply farming, provisions, health, education and settlement services.

PROD-05 records that these systems should reuse:

- work roles;
- capability;
- transaction;
- route;
- ownership;
- state;
- knowledge/history.

Their exact production placement is owned by PROD-06 and relevant Arc documents.

No new universal primitive is required solely because farming exists.

---

# 121. Player Customisation Gap Routing

Player character customisation should use:

- persistent identity;
- canonical body/appearance definitions;
- equipment composition;
- permissions for multiplayer/server restrictions;
- Forge source where creator tools apply.

Detailed placement remains in specialist Arc documentation.

---

# 122. Localisation/Text Contract Routing

All consequential user-visible text should derive from:

- stable reason/state IDs;
- localisation keys;
- knowledge/permission-filtered view models.

PROD-04 owns Forge localisation workflows.

PROD-06/detailed Arcs will assign implementation milestones.

---

# 123. Universal Primitive Adoption Rule

When a new system is designed, its task contract must explicitly answer:

1. Which existing primitives does it consume?
2. Which domain extensions does it add?
3. Does it introduce a genuinely new primitive?
4. If yes, why can existing primitives not express it?
5. Which systems would reuse the new primitive?

“No one thought about it” is not enough reason to create another private framework.

---

# 124. Migration Rule

When historical code/data contains duplicate private concepts, migration should converge them.

Examples:

- old storage ACL → shared Permission;
- old item movement log → Transaction;
- old road graph → Route;
- old machine sockets → ConnectionPort.

Migration must preserve semantic meaning.

Do not forcibly merge concepts that are truly different merely to achieve architectural neatness.

---

# 125. Debugging Rule

Debug tools should allow tracing primitives across systems.

Example transaction trace:

```text
Transaction T-8892
source: warehouse A
destination: caravan C
resource: item.iron_ingot
quantity: 40
permission: ALLOWED by settlement_trade_contract
reservation: R-338
commit: SUCCESS
route: RTE-90
history event: EVT-550
```

This is far more useful than reading unrelated subsystem logs.

---

# 126. ProductionRegistry Integration

Each P-slice may declare primitive dependencies.

Example:

```yaml
production_slice_id: P088
name: Caravan Bells

primitives:
  - Identity
  - Ownership
  - Permission
  - Capability
  - Transaction
  - Route
  - State
  - History
```

This lets future audits detect bespoke duplication.

---

# 127. PROD-05 Acceptance Gate

PROD-05 is ready for owner lock when the owner agrees that:

- [ ] Identity is canonical and separate from runtime/provider handles;
- [ ] definition and instance state are distinct;
- [ ] State supports composable dimensions rather than giant combined enums;
- [ ] Ownership, possession, permission and jurisdiction are distinct concepts;
- [ ] Permission uses one shared evaluation shape with domain-specific rules;
- [ ] Capability answers “can,” permission answers “may”;
- [ ] Connection/Port contracts are typed and domain-extensible;
- [ ] Socket and Port remain distinct but composable;
- [ ] Signals are bounded semantic communication rather than unrestricted engine messaging;
- [ ] committed domain events remain separate from player logic signals;
- [ ] Transactions enforce conservation and retry safety;
- [ ] Reservations never duplicate stock;
- [ ] Routes are higher-level than local navigation and support road/sea/portal domains;
- [ ] Knowledge remains separate from world truth;
- [ ] knowledge records preserve source/confidence/precision/staleness where relevant;
- [ ] History stores selected durable events rather than every transient runtime message;
- [ ] NPC memory can derive from History plus personal interpretation;
- [ ] Composition connects existing understood things without duplicating their definitions;
- [ ] nested compositions avoid double-counting;
- [ ] Result/Reason contracts are stable and machine-readable;
- [ ] Provenance remains separate from world History;
- [ ] shared Membership/Role/Reservation/Scope concepts may be reused where applicable;
- [ ] simulation LOD preserves primitive meaning while changing representation;
- [ ] schemas are versioned and domain extensions cannot contradict base contracts;
- [ ] shared primitives do not become a giant central God system;
- [ ] historical private concepts should converge on shared primitives where semantics truly match;
- [ ] universal Connection/Port architecture is conceptually available before P56 despite P57 retaining its roadmap number;
- [ ] unresolved specialist gaps are routed without inventing extra roadmap parent numbers here;
- [ ] the Flux pipe organ remains the representative proof that Composition + Ports + Signals can produce emergent functionality.

---

# 128. Proposed Lock Statement

If owner-approved, lock the following:

> **PROD-05 — LEYFORGE UNIVERSAL SIMULATION PRIMITIVES & CROSS-SYSTEM CONTRACTS — v0.1**
>
> Leyforge systems share a common semantic language for Identity, State, Ownership, Permission/Jurisdiction, Capability, Connection/Port/Socket, Signal, Transaction, Route, Knowledge, History, Composition, Result/Reason and Provenance. These contracts establish shared meaning and interoperability while allowing domain-specific extensions. Runtime/provider handles never replace canonical identity; capability and permission remain distinct; resource movement is transactionally conserved; player logic signals remain bounded and separate from committed domain events; regional routes remain distinct from local navigation; knowledge remains distinct from omniscient world truth; history retains selected meaningful committed facts; and compositions reference existing understood content rather than duplicating hidden definitions. Shared primitives are contracts and reusable infrastructure, not one giant state-owning manager. All later runtime, Forge, multiplayer, content-pack and optional-AI work must reuse these contracts unless a governed ADR demonstrates a genuine semantic requirement for a new primitive.

---

# 129. Next Document

After PROD-05 acceptance/reconciliation, continue to:

> **PROD-06 — Production Governance, Task Contracts & Evidence Standard**

PROD-06 will define exactly how P01–P192 becomes executable work:

- parent → child decomposition;
- task contract format;
- readiness/admission;
- authority lookup;
- repository/branch/Brain checks;
- implementation permissions;
- evidence classes;
- automated/manual tests;
- performance proof;
- human review;
- fail-closed handling;
- commit/push authority;
- regression obligations;
- completion/reconciliation;
- ProductionRegistry status transitions;
- handoff to the next P-slice.

Once PROD-06 exists, the remaining PROD-07 through PROD-16 documents can describe each Arc's implementation contracts using one governed template.

---

**End of PROD-05 v0.1 — Universal Simulation Primitives & Cross-System Contracts Candidate**
