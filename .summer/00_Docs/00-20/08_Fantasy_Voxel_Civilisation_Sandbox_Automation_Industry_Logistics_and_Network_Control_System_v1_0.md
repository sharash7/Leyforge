# LEYFORGE

## 08 — Automation, Industry, Logistics and Network Control System

### Conserved Production, Fixed Logistics Networks, Machine Control, Power Allocation, Settlement Supply, Maritime Industry and Scalable Simulation

**Version 1.0 — Reconciled Production Foundation Draft**  
**Date:** 8 August 2026  
**Production Status:** Active Foundation Reconciliation — Production Authority Draft  
**Supersedes:** `08_Fantasy_Voxel_Civilisation_Sandbox_Automation_System_v0_2` for active production direction  
**System Ownership:** Automation machines; machine runtime; stationary/fixed logistics graphs; non-magical automation power allocation; production scheduling; filtering/control; resource reservations; automation maintenance/fault state; automation LOD; automation dispatch/control interfaces.  
**Consumes Interfaces From:** Documents 03–07, 09, 11, 12, 15–20; Forge Sets 21–23; Atlas Set 24; Governance Set 25; Maritime Set 26; Economy Set 27; Social Set 28; Biology Set 29; Movement Set 30.  
**Does Not Own:** Canonical Blocks/Items/Recipes/Resources; persistent NPC identity; social willingness; prices/wages/contracts; biological consequences; mobile land transport movement; aquatic/vessel movement; mana truth; portal/dimension truth; building/service functionality; settlement project selection; UI presentation.  
**POC Treatment:** Fixed miner → chute → furnace → Forest Hamlet warehouse → watchtower chain is Archived Validation. Basic extraction, chutes, buffering, furnace automation, permissioned warehouse delivery, project reservations, mana-facing machine integration and raid/defence supply are preserved as generic production capabilities.  
**Production Sources:** Document 08 v0.2; Foundation Reconciliation Register v0.2; Document Set 20; Sets 21–23; Atlas/Set 24; Set 25; Set 26A–26O; Set 27A–27J; final Sets 27–30 Cross-Set Interface Register v1.1; Set 30A–30J.  
**Engine Direction:** Godot + Summer Engine development direction. Summer Engine may assist development but is not a shipped runtime dependency.  
**Migration / Compatibility:** Legacy automation IDs, POC endpoints, old machine item mirrors, rail/minecart movement logic, mana-network ownership and mobile-transport state require explicit migration/adapters rather than silent duplication.  
**Project Lead and Final Authority:** Ash

A production-scale automation foundation for Leyforge in which machines, fixed logistics, industrial processing, resource routing, control systems and civilisation infrastructure move and transform real physical stock through authoritative transactions. Automation exists to extend player and NPC capability, not to replace the living world with hidden spreadsheet production.

> **Automation System Statement**
>
> **Automation is civilisation infrastructure, not an isolated factory minigame. Every machine, buffer, fixed transfer line, power source, controller and settlement endpoint must connect to real definitions, real inputs, real outputs, valid ownership, permissions, maintenance, capacity, environmental context and persistent consequences.**

> **Conservation Rule**
>
> **A machine animation, belt visual, progress bar, distant summary or AI planner can never create stock. Inputs are reserved and committed through authoritative transformations; outputs become real only when the owning transaction succeeds.**

> **Stationary Automation / Mobile Movement Boundary**
>
> **Document 08 may decide what should be loaded, routed, dispatched, powered or controlled. Set 30 owns the physical movement of land vehicles, minecarts, lifts, elevators and other guided/mobile transport. Set 26 owns vessel and specialist maritime movement. Automation consumes their movement evidence instead of moving them itself.**

> **Canonical Physical Identity Rule**
>
> **A machine or logistics component that is fundamentally a placeable Block and recovers as that same Block has one canonical Block identity. Document 08 references that Block; it does not create a duplicate automation Item.**

---

# Document Purpose

Document 08 defines Leyforge's automation and industrial runtime.

Its role is to make large-scale production trustworthy, inspectable and useful to the world.

The system scales from:

- player/NPC carrying and manual stations;
- gravity chutes and simple gates;
- copper mechanisms;
- pumps and powered work;
- fixed conveyors and item pipes;
- automated machine processing;
- warehouse endpoints;
- project supply;
- workshop and industrial facilities;
- non-magical power networks;
- control logic and sensors;
- port/shipyard machinery;
- fixed loading/unloading systems;
- high-capacity regional industry;
- magical-machine integration through Document 09;
- guided transport dispatch through Set 30;
- vessel machinery through Set 26; and
- bounded distant industrial simulation.

The original v0.2 already established the core production philosophy: physical resource flow, exact transactions, typed networks, buffers, permissions, machine faults, NPC-supported labour, settlement supply, LOD and Godot/Summer direction.

Version 1.0 preserves those strengths while reconciling later production documents.

The largest changes are:

1. **Document 03–06 v1.0 now own clean canonical physical identities and transformations.** Automation references them rather than maintaining parallel machine/block/item/recipe truth.
2. **Set 27 owns economy.** Automation creates physical supply and executes authorised fulfilment; it does not price output or invent contracts.
3. **Set 28 owns social willingness and assignment intent.** Automation may require operator permission/authorisation but does not calculate Trust or Loyalty.
4. **Set 29 owns biology.** Automation emits heat, contamination, hazard or workload evidence; Set 29 determines biological consequences.
5. **Set 30 owns mobile terrestrial movement and guided transport.** Minecarts, powered carts, rail vehicles, elevators and transport instances are not physically moved by Document 08.
6. **Set 26 owns vessels, ports' specialist maritime execution and maritime movement.** Document 08 owns compatible pumps, winches, cranes, loaders, vessel machinery, fixed cargo networks and machine control.
7. **Document 09 owns mana as magic truth.** Automation consumes mana-network availability through typed interfaces instead of maintaining a second mana-energy system.
8. **The retired Forest Hamlet chain becomes an archive/test fixture, not the canonical factory architecture.**

---

# 1. Locked Automation Identity

Automation in Leyforge serves four connected purposes:

1. reduce repetitive labour;
2. increase reliable production;
3. make civilisation-scale projects possible; and
4. create new engineering, maintenance and infrastructure gameplay.

Automation must not erase:

- resource scarcity;
- physical distance;
- settlement demand;
- worker identity;
- transportation;
- maintenance;
- power requirements;
- ownership;
- trade;
- risk;
- terrain; or
- world consequences.

## 1.1 What Document 08 Owns

Document 08 owns:

- automation definition families;
- machine definitions at the automation-behaviour layer;
- machine runtime instances/state;
- machine operating modes;
- machine task/recipe scheduling;
- fixed item-transfer graphs;
- fixed bulk-transfer endpoints and loading/unloading control;
- fixed process-fluid automation graph semantics, subject to fluid-owner boundaries;
- non-magical automation power demand and allocation;
- mechanical/industrial power-network control where not owned by another specialist;
- control signal networks;
- sensors;
- filters;
- priorities;
- routing policies;
- automation reservations;
- input/output buffers;
- backpressure;
- machine fault state;
- maintenance state;
- emergency stop/shutdown;
- safety interlocks;
- automation permissions/configuration;
- automated warehouse delivery execution;
- automation-facing project supply;
- automation production order execution;
- automation runtime topology;
- automation simulation LOD;
- automation catch-up;
- automation diagnostics;
- automation audit evidence;
- automation-to-movement dispatch/control;
- automation-to-economy fulfilment evidence;
- automation-to-settlement supply evidence; and
- fixed industrial/maritime machinery integration.

## 1.2 What Document 08 Does Not Own

Document 08 does not own:

- Block identity — Document 03;
- Item identity — Document 04;
- recipes/transformation truth — Document 05;
- resource identity/progression — Document 06;
- persistent people/jobs — Document 07;
- mana identity, purity, magical storage/transmission and magic law — Document 09;
- world resource placement — Document 11;
- physical structure identity — Document 12/20;
- quest/event lifecycle — Document 15;
- combat resolution — Document 16;
- UI presentation — Document 17;
- settlement project selection — Document 19;
- universal building/service capacity — Document 20;
- vessel physics/movement — Set 26;
- market prices/wages/contracts/economic route value — Set 27;
- social persuasion/willingness/Trust/Loyalty — Set 28;
- Health/Fatigue/toxin/injury consequences — Set 29;
- mobile land vehicle/minecart/elevator movement — Set 30; or
- visual authoring — Forge Sets 21–23.

---

# 2. Source Authority and Reconciliation

| Source | Direction Consumed by Document 08 v1.0 |
|---|---|
| Document 08 v0.2 | Conserved automation, typed graph model, buffers, power, filters, maintenance, village endpoints, LOD, Godot/Summer. |
| Document 03 v1.0 | Canonical placeable machine/logistics Blocks, no duplicate Item identities. |
| Document 04 v1.0 | Genuine carried Items/components only. |
| Document 05 v1.0 | Authoritative transformations and transaction model. |
| Document 06 v1.0 | Resource providers, capability progression, material ecology. |
| Document 07 v1.0 | Persistent people/jobs/schedules/labour; automation does not duplicate worker identity. |
| Document 09 v0.2 → v1.0 pending | Mana, runes, magical networks/effects, wards and magical machine integration. |
| Document 11 v1.0 | Generated resource/topology/environment context. |
| Documents 19–20 | Settlement projects, facilities, services, storage, public infrastructure and activation contracts. |
| Sets 21–23 | Forge asset/blueprint/presentation source; gameplay truth remains Document 08. |
| Set 25 | Stable IDs, schemas, packs, migration, validation, release gates. |
| Set 26 | Pumps, winches, cranes, vessel machinery, port logistics, cargo handling, preservation and maritime automation; vessel motion remains Set 26. |
| Set 27 | Economy values physical automation output but does not invent throughput. |
| Set 28 | Social willingness/permission remains social truth. |
| Set 29 | Biological effects of industrial hazards remain biology truth. |
| Set 30 | Mobile terrestrial/guided transport movement; automation supplies readiness/control interface. |
| Cross-Set Register v1.1 | One owner per gameplay truth, typed/versioned interfaces, evidence. |

---

# 3. Supersession from v0.2

## 3.1 Preserved

The following v0.2 concepts remain production-authoritative:

- automation as civilisation infrastructure;
- real physical stock;
- exact resource conservation;
- typed network graphs;
- ports with direction/capacity/ownership;
- buffers;
- backpressure;
- fixed item movement;
- machine processing;
- power requirement;
- filtering;
- priority;
- control signals;
- settlement endpoints;
- permissioned warehouse delivery;
- project reservations;
- machine faults;
- maintenance;
- readable shutdown;
- NPC-supported industry;
- near/far simulation;
- deterministic catch-up;
- multiplayer authority;
- structured diagnostics;
- Forge separation; and
- Godot/Summer Engine direction.

## 3.2 Reassigned / Corrected

| v0.2 Area | v1.0 Treatment |
|---|---|
| Rail track / minecart movement as automation transport | Track remains Block/infrastructure; Set 30 owns minecart/rail movement. Document 08 owns loaders, dispatch requests, signals/control readiness and cargo transfer. |
| Elevator/lift movement in automation | Set 30 owns physical movement; 08 supplies power/control readiness where automation-driven. |
| Wagons/carts/freight movement | Set 30 movement; 08 may load/unload and request dispatch. |
| Ships as bulk logistics network | Set 26 owns vessel movement; 08 may load, pump, process, power onboard machinery and manage fixed port logistics. |
| Mana batteries/conduits as automation-owned magic network | Document 09 owns mana truth; 08 consumes mana availability and machine compatibility. |
| Ward connection as automation-owned defence network | Document 09 owns ward/mana behaviour; 08 can control authorised machine-facing enable/priority endpoints. |
| Portal route as automation network | Document 09/14 own portal/dimension truth; 08 can request authorised cargo transfer/dispatch. |
| Golem movement/task execution | Golem/entity owner + Document 07/09/10 as appropriate; Set 30 executes physical movement. |
| Trade/export pricing | Set 27. |
| Worker health effects | Set 29. |

## 3.3 Archived POC Wrapper

The fixed:

`Basic Mechanical Miner → Wooden Chute → Basic Furnace → Output Buffer → Forest Hamlet Warehouse → Watchtower reserve → POC raid outcome`

becomes an Archived Validation scenario.

The production capabilities remain:

- automated extraction;
- fixed item transfer;
- furnace automation;
- output buffering;
- warehouse delivery;
- project reservation;
- construction supply;
- defence supply;
- magical-machine integration; and
- visible cause/effect.

---

# 4. Automation Progression Philosophy

Automation progression should be capability-based rather than a rigid single material ladder.

A familiar path remains useful:

| Band | Typical Identity | Representative Capability |
|---|---|---|
| Manual | Player/NPC work | Carrying, carts by external movement, simple stations. |
| Gravity / Primitive | Passive fixtures | Chutes, hoppers, gates, drop channels. |
| Copper Mechanisms | Configurable machines | Cranks, simple extractors, auto ports, filters. |
| Iron Industry | Durable fixed logistics | Belts, pipes, pumps, machine interfaces, loaders. |
| Heavy Industry | High throughput | Crushers, foundries, machine tools, industrial power. |
| Mana-Assisted | Magic-machine hybrid | Mana-fed processing, runic control, magical stabilisation. |
| Advanced Magitech | Integrated hybrid | High-control machines, specialist conversion, advanced automation. |
| Regional / Realm | Strategic infrastructure | Large networks, portal-compatible logistics, civilisation projects. |

These are design bands, not mandatory exact material gates.

Document 06 capability progression may allow:

- alternate materials;
- cultural technology;
- salvage;
- imported machinery;
- magic substitutes;
- realm resources; or
- specialist knowledge.

Earlier automation remains useful because it can be:

- cheap;
- repairable;
- low-power;
- locally manufacturable;
- anti-magic compatible;
- portable;
- robust;
- culturally preferred; or
- suitable for remote settlements.

---

# 5. Canonical Automation Definition Model

An Automation Definition should reference existing physical definitions.

It should not re-author:

- Block properties;
- Item stack rules;
- Recipe outputs;
- resource identity;
- visual models; or
- building functions.

## 5.1 Automation Definition Fields

```yaml
automation_definition:
  automation_id: leyforge.core.automation.<path>
  schema_version: 1
  owner: document08

  physical_refs:
    canonical_block_ref: block:<id>?
    canonical_item_component_refs: []
    structure_service_refs: []
    forge_presentation_refs: []

  class:
    machine_class: <processing|transfer|storage_control|power|sensor|controller|loader|pump|crane|...>
    capability_tags: []
    progression_tags: []

  interfaces:
    input_ports: []
    output_ports: []
    power_ports: []
    control_ports: []
    mana_consumer_ports: []
    movement_dispatch_ports: []
    settlement_endpoint_ports: []

  operation:
    supported_recipe_classes: []
    supported_task_classes: []
    batch_profile_ref: <id>
    buffer_profile_ref: <id>
    maintenance_profile_ref: <id>
    safety_profile_ref: <id>
    lod_profile_ref: <id>

  permissions:
    owner_policy_ref: <id>
    configuration_permission_ref: <id>
    transfer_permission_ref: <id>

  diagnostics:
    reason_code_family: <id>
    audit_level: <class>
```

---

# 6. Machine Runtime Instance

A placed machine instance references:

- Automation Definition;
- canonical Block/Structure instance;
- owner;
- permission state;
- orientation;
- port bindings;
- current network refs;
- current power state;
- current task/recipe;
- reservations;
- work progress;
- input buffers;
- output buffers;
- maintenance;
- damage;
- temperature/process state where owned;
- external mana snapshot refs if used;
- external movement-control refs if used;
- fault state;
- last committed transaction;
- runtime LOD;
- save revision.

A visual animation is not machine state.

---

# 7. Block / Item Identity Boundary

Document 08 follows the Foundation single-identity rule.

## 7.1 Same Machine Recovered as Same Machine

If a placed machine:

- is a Block;
- is broken/packed;
- and returns as the same placeable machine,

then there is **one canonical Block identity**.

Inventory uses the Block Inventory Projection from Document 03.

No `item.machine.<same_machine>` is created.

## 7.2 Genuine Separate Machine Components

Separate Items remain valid for:

- gears;
- fasteners;
- bearings;
- coils;
- filters;
- motors/cores;
- sealants;
- control modules;
- replacement parts;
- fuel;
- catalysts;
- maintenance kits; and
- other genuine carried components.

## 7.3 Packed Stateful Machine

A machine that preserves approved state when packed may use:

- canonical Block identity;
- packed-state payload;
- safe inventory serialization;
- conservation validation.

It does not require duplicate Item identity.

---

# 8. Recipe / Processing Boundary

Document 05 owns transformations.

Document 08 owns the machine's ability to execute an authorised transformation.

A machine cycle is:

**Select Task**  
→ **Validate Recipe/Capability**  
→ **Reserve Inputs**  
→ **Validate Power / Machine / Permission / Output**  
→ **Begin Work Record**  
→ **Consume/Commit According to Recipe Contract**  
→ **Advance Work**  
→ **Revalidate at Commit Point**  
→ **Commit Output**  
→ **Deposit Output / Apply Backpressure**  
→ **Record Evidence**

## 8.1 No Hidden Machine Recipe

A machine cannot contain an undocumented transformation that creates stock merely because its code says so.

Special transformations must still exist in the appropriate recipe/process registry.

## 8.2 Work-in-Progress

Persistent work may contain:

- recipe ref;
- machine ref;
- reserved inputs;
- committed inputs;
- fuel/power cost state;
- elapsed progress;
- temperature/process state;
- output destination;
- by-product state;
- interruption reason;
- save version.

---

# 9. Resource Extraction

Document 06 owns resource-provider identity.

Document 11 owns generated world placement.

Document 08 may operate an extractor only against an authoritative provider/source.

Extraction requires:

- source ID;
- resource capability;
- access;
- tool/machine compatibility;
- ownership/claim permission;
- remaining quantity or renewable capacity;
- extraction rate/capability;
- power;
- output capacity;
- maintenance;
- hazard state;
- world/structure access; and
- authoritative transaction.

## 9.1 No Infinite Mining Node Unless Explicit

A deposit is not infinite because an extractor is off-screen.

Renewable sources must expose their regeneration contract through the proper owner.

## 9.2 Terrain Editing

If extraction changes voxel terrain, the actual Block removal/world delta is committed through the authoritative voxel/world system.

Automation does not decrement an abstract ore counter while leaving an untouched contradictory ore Block unless the provider definition explicitly uses non-voxel extraction.

---

# 10. Fixed Item Logistics

Document 08 owns **fixed logistics networks** such as:

- chutes;
- hoppers;
- fixed conveyors;
- item pipes;
- sorters;
- junctions;
- fixed loaders/unloaders;
- warehouse hatches;
- machine ports;
- buffers; and
- industrial transfer stations.

## 10.1 Transfer Record

Every meaningful transfer uses:

- source inventory;
- destination inventory;
- quantity;
- canonical identity;
- ownership/custody;
- reservation;
- transfer path;
- capacity;
- status;
- transaction/evidence ID.

## 10.2 Visible Item Flow

Nearby systems may render:

- individual items;
- grouped stacks;
- moving containers;
- belt packages;
- pipe indicators;
- chute batches.

Those visuals are projections of authoritative transfer state.

Destroying or failing to render a visual does not destroy stock.

## 10.3 Backpressure

When destination capacity is unavailable:

- source retains stock;
- transfer buffers stock;
- machine pauses;
- route reroutes if policy permits; or
- safe overflow handling applies.

Stock does not vanish.

---

# 11. Mobile Freight Boundary

Mobile freight includes:

- handcarts;
- wagons;
- carriages;
- caravans;
- minecarts;
- trains/consists;
- elevators/lifts carrying cargo;
- powered guided vehicles;
- mounts carrying freight; and
- other Set-30 movers.

Document 08 may:

- prepare cargo;
- create load request;
- validate loader readiness;
- reserve goods;
- assign destination intent;
- request dispatch;
- control fixed signals/switch requests through approved interface;
- receive arrival evidence;
- unload;
- commit delivery.

Set 30 owns:

- physical mover state;
- route accessibility;
- movement;
- travel time;
- speed;
- braking;
- route reservations;
- vehicle/consist location;
- arrival alignment;
- movement faults.

## 11.1 XSET / XSI Transport Readiness

Document 08 provides a readiness/control snapshot such as:

```text
transport_power_snapshot_id
source_network_ids[]
source_revision
propulsion_allowed_to_begin
propulsion_allowed_to_continue
available_traction_band
max_speed_modifier
acceleration_modifier
braking_assist_band
control_authority_state
requested_destination_or_route_ref?
switch_signal_authority_refs[]
emergency_stop_requested
shutdown_requested
power_fault_codes[]
control_fault_codes[]
energy_state_band
```

Set 30 returns movement evidence such as:

```text
transport_instance_id
movement_state
actual_speed_band
actual_traction_use_band
current_route_segment
current_reservation_refs[]
arrival_alignment_state
blocked_state
emergency_brake_state
vehicle_condition_band
movement_reason_codes[]
```

Document 08 does not deduct movement fuel or physically move the vehicle if those responsibilities belong elsewhere.

---

# 12. Freight Loading and Unloading

Fixed loading systems may include:

- conveyor loaders;
- pipe transfer;
- hopper loaders;
- minecart loaders;
- wagon loaders;
- crane loading;
- pallet/cargo-lot staging;
- ship loading arms;
- pump transfer;
- warehouse dock interfaces;
- automated gates.

A load operation requires:

- valid vehicle/vessel/container;
- aligned loading point;
- compatible cargo;
- capacity;
- ownership/custody;
- permissions;
- reservation;
- route/dispatch readiness;
- transfer machinery;
- output confirmation.

---

# 13. Fluid Automation Boundary

Document 08 may own automation control for:

- pumps;
- valves;
- fixed process-fluid lines;
- tanks;
- industrial coolant;
- steam/process flows;
- irrigation machinery where assigned;
- drainage machinery;
- vessel/port pumps.

However:

- Document 26B owns water/liquid mechanics where defined;
- Document 26D owns maritime dynamic environment;
- Document 09 owns magical fluid transformations if magical;
- Document 05 owns process transformations.

## 13.1 Fluid Transfer Contract

Automation consumes authoritative fluid data:

- fluid identity;
- source volume;
- destination capacity;
- pressure/flow capability where provided;
- contamination;
- temperature where relevant;
- ownership;
- containment;
- pump compatibility.

Document 08 controls machine/pump operation and transaction scheduling.

It does not invent water volume.

## 13.2 Flood Pumps

A flood pump on a vessel or building:

- receives authoritative water volume from fluid owner;
- requests extraction/transfer;
- consumes real power;
- respects pump capacity;
- outputs to valid destination;
- records result.

It cannot reduce “flood percentage” by animation alone.

---

# 14. Power Architecture

Automation requires power when a definition says so.

Power classes may include:

- manual/mechanical;
- gravity;
- waterwheel;
- wind;
- rotational;
- fuel/thermal;
- steam;
- pressure;
- stored mechanical;
- electrical-like fantasy industrial power where later approved;
- mana-provided power through Document 09; and
- realm/specialist providers.

## 14.1 Non-Magical Power Ownership

Document 08 owns automation-facing:

- source/load graph;
- capacity allocation;
- priority;
- distribution;
- overload;
- buffer state;
- machine power demand;
- shutdown;
- fault isolation;
- network topology;
- power audit.

## 14.2 Power Conservation

Power networks may abstract continuous physical energy, but they cannot:

- power unlimited load from zero source;
- ignore fuel where required;
- teleport source state;
- create impossible output across disconnected networks.

## 14.3 Mechanical Power

Mechanical systems may use:

- shafts;
- belts;
- gearboxes;
- clutches;
- flywheels;
- crank sources;
- waterwheels;
- windmills;
- mechanical governors.

Exact rotational physics can remain bounded/abstract where performance requires.

---

# 15. Mana Integration Boundary

Document 09 owns:

- mana identity;
- mana generation/acquisition;
- type;
- purity;
- stability;
- magical storage rules;
- conduit/mana transmission rules;
- ward mana behaviour;
- ritual mana behaviour;
- magical consequences.

Document 08 owns the machine's use of a valid mana provider.

## 15.1 Machine Mana Consumer

A mana-capable machine may request:

- required mana class;
- minimum purity;
- demand band;
- maximum draw;
- stability tolerance;
- allowed providers;
- emergency shutdown threshold.

Document 09 returns a mana availability/provider snapshot.

Document 08 decides whether the machine can run.

## 15.2 No Duplicate Mana Battery

If a Mana Battery is canonically a magical Block/system owned by Document 09, Document 08 references it.

Document 08 does not create a second battery ledger.

---

# 16. Control Networks

Control is separate from item/power flow.

Control signals may include:

- enable/disable;
- recipe/task selection;
- filter condition;
- priority;
- threshold;
- sensor event;
- emergency stop;
- routing request;
- valve command;
- switch request;
- alarm;
- maintenance lock;
- safety interlock.

## 16.1 Declarative First

Routine automation control should favour bounded declarative logic rather than unrestricted scripting.

Examples:

- `if buffer < 25% -> enable machine`;
- `if item tag == ore.iron -> route A`;
- `if warehouse reserve >= target -> pause delivery`;
- `if pump fault -> close intake`;
- `if transport arrived -> unload`;
- `if storm alert -> secure crane`.

## 16.2 No Unbounded Logic Loops

Control graphs require:

- cycle detection;
- update budgets;
- event coalescing;
- debounce/hysteresis;
- deterministic ordering;
- diagnostics.

---

# 17. Sensors

Sensors may observe authorised facts such as:

- inventory quantity;
- buffer fullness;
- machine state;
- power availability;
- fluid level;
- temperature/process state;
- route/transport arrival;
- vessel docking;
- door/gate state;
- project reserve state;
- environmental condition;
- settlement demand signal;
- contract fulfilment request;
- damage/fault;
- mana provider state.

A sensor observes truth from its owner.

It does not become the owner of that state.

---

# 18. Filtering and Routing

Routing decisions may use:

- canonical IDs;
- tags;
- categories;
- quality;
- condition;
- ownership;
- reservation;
- destination policy;
- project requirement;
- contract requirement;
- capacity;
- freshness/spoilage class;
- hazard class;
- legal/restriction class where exposed;
- player priority.

## 18.1 Typed Substitution

Document 05/06 substitution groups remain authoritative.

Automation cannot treat `any_ingot` or `any_food` as universally equivalent unless the owning recipe/demand contract permits it.

## 18.2 Protected Stock

Routing must respect:

- project reservations;
- household/private ownership;
- emergency reserve;
- merchant stock;
- military stock;
- contract reserve;
- cultural/legal restrictions; and
- player-protected stock.

---

# 19. Buffers and Storage Control

Buffers exist to decouple rates and prevent resource loss.

Types include:

- input buffer;
- output buffer;
- process buffer;
- fuel buffer;
- fluid tank;
- staging inventory;
- cargo staging;
- project reserve;
- overflow buffer;
- quarantine storage.

## 19.1 Buffer Is Real Storage

A buffer quantity is backed by authoritative stock or fluid state.

It is not a UI-only number.

## 19.2 Overflow

Overflow policy may:

- stop source;
- reroute;
- return to source;
- move to overflow storage;
- spill physically where safe/defined;
- reject transfer.

---

# 20. Production Scheduling

Automation may schedule production based on:

- player configuration;
- settlement demand;
- project order;
- contract order;
- minimum stock;
- maximum stock;
- emergency reserve;
- recurring work order;
- warehouse demand;
- shipyard project;
- military supply;
- research request;
- maintenance need.

Scheduling creates **intent**.

The machine still requires valid input/power/output/recipe.

## 20.1 No Demand-to-Stock Teleport

A settlement saying “need 100 planks” does not create planks.

It creates/updates production or procurement demand.

---

# 21. Settlement Integration

Document 07 owns people/labour.

Document 19 owns project planning.

Document 20 owns facilities/services/public logistics.

Document 08 owns automation inside those valid contexts.

Automation can support:

- warehouses;
- workshops;
- farms;
- mills;
- mines;
- smithies;
- public works;
- project supply;
- defence supply;
- hospitals/care supply;
- food distribution;
- ports;
- shipyards;
- markets;
- utilities;
- waste/process systems where approved.

## 21.1 Warehouse Delivery

A warehouse delivery requires:

- valid endpoint;
- permission;
- accepted stock;
- capacity;
- transfer;
- ownership/custody change;
- reservation handling;
- evidence.

## 21.2 Public Distribution

Public distribution may use settlement policy and Set 27/28/29 inputs.

Document 08 executes stock routing.

It does not decide who deserves food, what it costs or whether a person is biologically fed.

---

# 22. NPC Labour Integration

Document 07 owns ordinary workers/jobs.

Automation may require:

- operator;
- loader;
- engineer;
- maintainer;
- inspector;
- fuel handler;
- control-room worker;
- crane operator;
- pump operator;
- shipyard machine worker.

Document 08 requests labour capability.

Document 07 supplies the worker/task context.

Set 29 may restrict biological availability.

Set 28 may restrict willingness/permission where social assignment applies.

Set 30 moves the worker.

## 22.1 Automation Does Not Delete Work

Automation changes labour from:

- carrying every stack;
- hand-processing every unit

toward:

- setup;
- routing;
- repair;
- inspection;
- engineering;
- operation;
- tuning;
- logistics supervision;
- safety;
- specialised production.

---

# 23. Golems, Constructs and Automated Labour

Golems/constructs may be automation-compatible workers.

Their identity may belong to:

- Document 09 magical construct system;
- Document 10 creature/entity system;
- another approved specialist;
- Entity Forge presentation.

Document 08 may provide:

- task queue;
- zone;
- machine interaction;
- charging station interface;
- tool requirements;
- shutdown request;
- work evidence.

Set 30 executes physical movement.

## 23.1 No Hidden Worker Duplication

A golem cannot simultaneously exist as:

- automation counter;
- creature instance;
- persistent entity;

with three independent inventories.

One entity identity must own physical stock.

---

# 24. Economy Integration

Set 27 owns economy.

Automation exposes physical facts such as:

- current stock;
- committed production;
- production capacity;
- actual output;
- expected completion;
- machine downtime;
- shipment ready;
- contract lot ready;
- delivery evidence;
- loss/damage refs;
- operating inputs consumed.

Set 27 owns:

- price;
- value;
- market pressure;
- wage;
- operating cost interpretation;
- profit;
- contract;
- payment;
- finance;
- tax;
- public budget;
- trade-route economics.

## 24.1 Committed Production Only

Set 27 may count **committed output** as supply.

Uncommitted theoretical machine capacity is not stock.

## 24.2 Contract Fulfilment

An automated system can fulfil a Set-27 contract only after:

- correct goods exist;
- reservation is valid;
- custody/ownership is valid;
- delivery condition is met;
- evidence is committed.

A contract deadline does not allow teleport delivery.

---

# 25. Social Integration

Set 28 owns:

- willingness;
- persuasion;
- relationship;
- social permission;
- companion assignment;
- protest/compliance;
- belief;
- rumours.

Automation may consume:

- permission token;
- assignment approval;
- operator willingness;
- restricted access result;
- disclosed knowledge.

It must not calculate Trust.

## 25.1 Player Commands

A player can configure their own machinery.

Configuring a settlement/faction/private machine requires authority/permission from the relevant owners.

---

# 26. Biological and Environmental Consequence Boundary

Automation may create environmental evidence such as:

- heat;
- smoke;
- dust;
- noise;
- contaminated fluid;
- toxic material release;
- pressure failure;
- fire;
- magical leak;
- sewage/waste if later implemented;
- dangerous workplace state.

Document 08 owns the machine fault/source event.

Set 29 owns biological consequences to people.

Document 10 may own creature effects.

Document 11/environment owner may own persistent environmental transformation.

Document 16 may own damage/combat consequence if event becomes destructive.

## 26.1 No Direct Health Damage from Automation Ledger

Document 08 does not decrement NPC Health.

It emits an exposure/damage event with:

- source;
- type;
- intensity;
- duration;
- protection context;
- location;
- evidence.

---

# 27. Maintenance

Machines require maintenance when their definition says so.

Maintenance may include:

- cleaning;
- lubrication;
- calibration;
- replacing parts;
- clearing jams;
- repairing damage;
- replacing filters;
- descaling;
- rune recalibration through Document 09;
- pump inspection;
- belt/shaft tension;
- seal replacement;
- corrosion treatment;
- safety inspection.

## 27.1 Maintenance Uses Real Inputs

Maintenance may consume:

- parts;
- oil;
- tools;
- sealant;
- filters;
- time;
- labour;
- power shutdown.

## 27.2 Maintenance Access

A machine needs safe maintenance access.

Blueprint Forge / structures expose:

- access zone;
- clearance;
- isolation point;
- operator marker;
- repair socket.

---

# 28. Failure and Safety

Routine automation should fail safely where practical.

Common states:

- idle;
- starved;
- output blocked;
- unpowered;
- partially powered;
- disconnected;
- jammed;
- overheated;
- damaged;
- maintenance due;
- permission blocked;
- incompatible input;
- invalid recipe;
- no operator;
- unsafe clearance;
- control conflict;
- emergency stopped.

Severe outcomes require:

- ignored warnings;
- hostile sabotage;
- unsafe material;
- explicit high-risk machine;
- difficult world setting;
- magical instability;
- pressure/thermal hazard;
- catastrophic damage.

## 28.1 Readable Cause

Every failure should answer:

- what failed;
- why;
- what is affected;
- whether stock is safe;
- whether the machine is safe;
- how to recover;
- which system owns the blocker.

---

# 29. Fire, Damage and Sabotage

Document 16 owns combat/damage resolution.

Document 08 responds to authoritative damage by:

- reducing capability;
- disconnecting ports;
- leaking process state where appropriate;
- shutting down;
- isolating network section;
- requesting repair;
- preserving stock;
- recording fault.

Sabotage may target:

- power;
- belts;
- pumps;
- loaders;
- controls;
- storage;
- bridges/transport interfaces;
- shipyard machinery.

Document 08 does not choose hostile targets unless an authorised AI/event owner requests it.

---

# 30. Maritime Automation

Set 26 explicitly requires Document 08 to support:

- pumps;
- winches;
- cranes;
- vessel networks;
- port logistics;
- cargo handling;
- preservation;
- fuel/mana logistics;
- bounded maritime automation.

## 30.1 Port Automation

Examples:

- dockside loaders;
- cranes;
- warehouse conveyors;
- cargo staging;
- fuel transfer;
- freshwater supply;
- bilge/waste transfer;
- fish processing;
- cold storage;
- shipyard machine tools;
- slipway/launch machinery;
- repair material handling;
- rescue equipment staging.

## 30.2 Vessel Automation

Document 08 may own onboard machine behavior such as:

- pumps;
- winches;
- powered capstans;
- cargo lifts;
- processing equipment;
- refrigeration/preservation;
- automated valves;
- monitoring;
- machine control;
- mana-compatible machinery through Document 09.

Set 26 owns:

- vessel identity;
- hull;
- propulsion;
- steering;
- buoyancy/stability;
- compartments;
- voyage;
- marine damage;
- vessel movement.

## 30.3 Crane Boundary

A fixed cargo crane used as industrial machinery is Document-08 automation at the machine envelope.

If a crane becomes an actor/passenger transportation system or otherwise crosses Set-30 movement ownership, the physical movement portion uses Set 30.

---

# 31. Shipbuilding and Shipyard Integration

Document 26H owns vessel construction/repair/refit/salvage workflow.

Document 08 supplies compatible:

- cranes;
- pumps;
- machine tools;
- sawmills;
- lifts/hoists;
- logistics;
- reservations;
- material delivery;
- fixed yard machinery.

Document 07 supplies labour.

Document 05 owns transformations.

Document 20 owns shipyard facility function.

Automation cannot commission a vessel merely because a production counter reaches 100%.

---

# 32. Fishing and Aquaculture Automation

Set 26M owns marine ecology and fishing population truth.

Document 08 may provide:

- feeders;
- pumps;
- sorting;
- cold storage;
- processing;
- monitoring;
- fixed logistics;
- preservation machinery.

It cannot create fish abundance.

Aquaculture production requires actual:

- stock;
- feed;
- water;
- labour;
- environment;
- time;
- health/ecology state.

---

# 33. Guided Transport Integration

Set 30G owns:

- rail vehicles;
- minecarts;
- consists;
- elevator/lift movement;
- guided powered land transport.

Document 08 owns:

- fixed loader/unloader machinery;
- dispatch intent;
- power readiness;
- automation schedule;
- switch/signal request where interface permits;
- cargo transfer;
- arrival-triggered control.

## 33.1 Rail Track Identity

Rail Track is a canonical Block/infrastructure definition.

Document 08 does not own rail physics.

## 33.2 Station Dwell

Automation may request hold/depart conditions based on:

- cargo load;
- power;
- schedule;
- output capacity;
- downstream congestion.

Set 30 owns actual stopped/moving vehicle state.

---

# 34. Roads, Wagons and Caravans

Set 30 owns physical wagon/caravan movement.

Set 27 owns economic mission/route economics.

Document 08 may:

- stage cargo;
- reserve goods;
- load/unload;
- dispatch request;
- receive delivery evidence;
- integrate warehouse automation.

It does not steer the wagon or price freight.

---

# 35. Portal and Realm Logistics

Document 09 / Document 14 own:

- portal activation;
- magical destination compatibility;
- realm access;
- portal risk;
- dimensional rules.

Document 08 may:

- stage cargo;
- control loading;
- queue authorised transfers;
- manage buffers;
- apply filters;
- request portal service;
- receive transfer evidence.

A portal line is not an automation-owned teleport pipe.

---

# 36. Defence and Emergency Supply

Automation may support:

- ammunition supply;
- food reserve;
- medicine delivery;
- repair material;
- gate power;
- alarms;
- ward-support requests;
- pumps;
- firefighting systems;
- evacuation supplies.

Document 16 owns defence/combat result.

Document 09 owns wards.

Set 29 owns medical/biological result.

Automation owns the physical supply/control system.

---

# 37. Settlement Projects

Document 19 chooses projects.

Document 20 defines project/building capability.

Document 05 commits project transformations.

Document 07 supplies labour.

Document 08 supplies:

- automated stock delivery;
- staging;
- material reservation support;
- construction machine operation;
- project supply endpoint;
- milestone delivery evidence.

## 37.1 Project Reserve

Project-reserved stock cannot be consumed by ordinary automation unless:

- project owner releases it;
- emergency policy authorises reallocation;
- transaction evidence records the change.

---

# 38. Structure and Blueprint Integration

Blueprint Forge owns editable machine/structure layout source.

Document 08 consumes semantic elements such as:

- machine anchor;
- input port;
- output port;
- power port;
- control port;
- fluid port;
- maintenance zone;
- operator position;
- moving-part clearance;
- safety zone;
- loading zone;
- cargo socket;
- external connector;
- network channel.

Appearance alone does not create an automation port.

---

# 39. Forge Asset Boundary

Voxel Asset Forge owns:

- machine model;
- compound parts;
- texture/material;
- state layers;
- pivots;
- sockets;
- animation source.

Presentation Forge owns:

- sparks;
- smoke;
- sound;
- flow VFX;
- alarms;
- state feedback.

Document 08 owns authoritative state.

A glowing belt is not powered unless the power system says so.

---

# 40. Machine Families

Representative production automation families include:

## 40.1 Extraction
- mechanical miner;
- quarry machine;
- drill/extractor where approved;
- pump/extractor;
- forestry machine later where approved.

## 40.2 Processing
- automated furnace interface;
- crusher;
- sawmill;
- mill;
- forge/foundry machinery;
- food processor;
- preservation machine;
- specialist realm processor.

## 40.3 Fixed Logistics
- chute;
- hopper;
- conveyor;
- item pipe;
- splitter;
- filter;
- junction;
- loader;
- unloader;
- buffer;
- warehouse hatch.

## 40.4 Power
- crank;
- waterwheel interface;
- wind-power interface;
- shaft;
- gearbox;
- steam/thermal source;
- power buffer;
- distribution node.

## 40.5 Control
- lever/controller;
- sensor;
- timer;
- threshold sensor;
- filter controller;
- priority controller;
- emergency stop;
- alarm.

## 40.6 Fluid / Maritime
- pump;
- valve;
- tank;
- bilge pump;
- dock pump;
- cargo pump;
- crane;
- winch;
- capstan;
- preservation/cold storage;
- shipyard machine tools.

## 40.7 Magical Consumer
- mana-compatible furnace;
- runic machine controller;
- mana-assisted processor;
- ward/portal integration endpoint.

Magical truth remains Document 09.

---

# 41. Power and Throughput Balance

Automation should not turn the game into unlimited exponential production too early.

Balance dimensions include:

- capital cost;
- maintenance;
- power;
- throughput;
- buffer size;
- setup complexity;
- labour;
- footprint;
- noise/hazard;
- material quality;
- unlock knowledge;
- route distance;
- repair;
- environmental compatibility;
- settlement permission.

## 41.1 Earlier Tier Value

A hand-cranked mill can remain useful in:

- anti-magic region;
- remote camp;
- emergency;
- small village;
- low-resource start;
- ship backup;
- maintenance shutdown.

---

# 42. Control Complexity and Anti-Micromanagement

Players should configure meaningful engineering decisions without needing to program every stack.

Default automation should support:

- simple attach-and-run;
- understandable ports;
- automatic valid routing;
- safe default filters;
- buffer-aware operation;
- warehouse target stock;
- production order templates;
- project delivery;
- emergency stop.

Advanced players can use:

- priority;
- filters;
- thresholds;
- conditional routing;
- load balancing;
- redundant power;
- staged production;
- transport dispatch;
- maintenance windows.

---

# 43. Ownership and Permission

Every automation-relevant object may expose:

- owner;
- operator authority;
- configuration permission;
- transfer permission;
- maintenance permission;
- emergency authority;
- public/private/settlement use;
- contract access;
- faction/legal restrictions.

Automation does not invent ownership.

## 43.1 Theft

If a machine routes unauthorised stock from another owner, the transfer must be:

- blocked; or
- committed as theft/seizure through the relevant legal/social systems.

It cannot silently relabel ownership.

---

# 44. Simulation LOD

Automation uses bounded representation levels.

### A0 — Active Detailed
- visible item movement;
- active machine state;
- local power/control updates;
- animation;
- precise interactions.

### A1 — Local Reduced
- authoritative transfers;
- grouped visuals;
- reduced graph cadence;
- full machine state.

### A2 — Settlement Summary
- batched compatible machine cycles;
- exact inventory boundaries;
- network capacity summaries;
- important faults exact.

### A3 — Regional Industrial Summary
- aggregate validated production orders;
- exact conserved stock;
- route/movement handoff to external owners;
- important machines/projects protected.

### A4 — Dormant Scheduled
- persisted work/reservations;
- scheduled wake;
- bounded catch-up.

## 44.1 LOD Invariants

LOD may reduce:

- visual items;
- tick frequency;
- animation;
- sensor cadence;
- per-segment simulation.

LOD may not change:

- quantities;
- ownership;
- recipe outcome;
- project reserve;
- contract fulfilment;
- power impossibility;
- machine damage;
- arrival evidence;
- historical fault;
- committed production.

---

# 45. Distant Catch-Up

Catch-up processes elapsed time using:

- machine definitions;
- power availability history or bounded assumptions;
- source inventory;
- destination inventory;
- recipes;
- work-in-progress;
- maintenance;
- faults;
- external transport evidence;
- settlement demand;
- shutdown periods;
- environmental events.

## 45.1 Stop at First Invalid Dependency

A distant factory cannot continue through:

- empty ore storage;
- no fuel;
- broken machine;
- full output;
- lost power;
- invalid recipe;
- destroyed bridge requiring mobile freight;
- missing vessel;
- blocked contract custody;
- missing operator where required.

---

# 46. Promotion / Demotion

Automation LOD transition preserves:

- machine IDs;
- network IDs;
- inventory refs;
- in-transit fixed-network transfers;
- reservations;
- power state;
- control state;
- work-in-progress;
- maintenance;
- faults;
- external movement request refs;
- external mana snapshot refs;
- audit revision.

A belt visual may disappear.

The goods do not.

---

# 47. Multiplayer Authority

Server/host authority owns:

- machine placement/config mutation;
- network topology;
- transfer;
- recipe start/commit;
- power;
- reservations;
- maintenance;
- automation dispatch;
- warehouse transfer.

Clients may:

- inspect;
- configure if authorised;
- request changes;
- predict safe presentation;
- display flow.

Clients cannot create outputs.

## 47.1 Idempotency

Commands such as:

- start production;
- transfer;
- dispatch;
- unload;
- claim contract fulfilment

must use stable IDs/revisions so duplicate messages do not duplicate goods.

---

# 48. Persistence

Persist:

- Automation Definitions by stable ref;
- machine instances;
- network topology;
- port bindings;
- configuration;
- inventories;
- transfers needing persistence;
- reservations;
- work-in-progress;
- power/control state needed for reconstruction;
- maintenance;
- faults;
- dispatch refs;
- transaction evidence;
- LOD state;
- schema revisions.

Do not use scene-node existence as save truth.

---

# 49. Migration

Migration must handle:

- old POC IDs;
- old machine registry IDs;
- duplicate machine Item mirrors;
- old rail/minecart automation ownership;
- old elevator automation movement fields;
- old mana battery/conduit ownership;
- old portal-route automation state;
- old Forest Hamlet warehouse endpoint;
- old project-supply fixture;
- old network port schema;
- old power schema;
- old save work records.

## 49.1 Duplicate Machine Item Migration

If an old save contains:

- machine Block identity; and
- duplicate machine Item definition

for the same physical object, migrate the inventory form to the canonical Block Inventory Projection.

Never keep both as valid production identities.

---

# 50. Diagnostics

Recommended stable automation reason families:

| Code | Meaning |
|---|---|
| `AUTO-DEF-001` | Missing/invalid automation definition. |
| `AUTO-PHYS-001` | Canonical Block/physical reference invalid. |
| `AUTO-PORT-001` | Port type/direction incompatibility. |
| `AUTO-NET-001` | Required network disconnected. |
| `AUTO-CAP-001` | Network/machine capacity unavailable. |
| `AUTO-PWR-001` | Power unavailable/insufficient. |
| `AUTO-PWR-002` | Power overload/fault. |
| `AUTO-IN-001` | Input missing. |
| `AUTO-OUT-001` | Output blocked. |
| `AUTO-RCP-001` | Recipe/process incompatible. |
| `AUTO-WIP-001` | Work record conflict/migration required. |
| `AUTO-RES-001` | Reservation failure. |
| `AUTO-XFER-001` | Destination rejected transfer. |
| `AUTO-PERM-001` | Permission denied. |
| `AUTO-RESERVE-001` | Protected project/contract reserve. |
| `AUTO-CLEAR-001` | Machine/operator/maintenance clearance invalid. |
| `AUTO-FLUID-001` | Fluid type/source/destination invalid. |
| `AUTO-MANA-001` | Mana provider rejected/unavailable. |
| `AUTO-CTRL-001` | Control loop/budget/conflict. |
| `AUTO-MOVE-001` | External Set-30 transport unavailable/blocked. |
| `AUTO-MAR-001` | External Set-26 vessel/port execution unavailable. |
| `AUTO-ECON-001` | Set-27 economic obligation/contract state blocks dispatch. |
| `AUTO-BIO-001` | Set-29 biological availability blocks operator/task. |
| `AUTO-SOC-001` | Set-28 permission/willingness blocks action. |
| `AUTO-LOD-001` | Promotion/demotion reconciliation failed. |
| `AUTO-SAVE-001` | Save/migration inconsistency. |
| `AUTO-AUTH-001` | Unauthorised mutation. |
| `AUTO-POC-001` | Retired POC dependency detected. |
| `AUTO-DUP-001` | Duplicate Block/Item automation identity detected. |

---

# 51. Validation Rules

## 51.1 Definition Validation

Every automation definition must have:

- qualified ID;
- owner;
- schema version;
- physical reference;
- port profile;
- capability;
- supported recipe/task classes;
- power profile;
- safety;
- maintenance;
- LOD;
- migration state.

## 51.2 Network Validation

Check:

- compatible port types;
- direction;
- capacity;
- cycles where invalid;
- disconnected segments;
- owner/permission;
- duplicate network identity;
- stale topology;
- unsupported cross-chunk connection;
- movement handoff.

## 51.3 Conservation Validation

Across all LOD:

`initial stock + legitimate produced inputs/outputs - legitimate consumption/loss = final stock`

within the exact state model.

No unexplained creation/disappearance.

## 51.4 Cross-Owner Validation

A production build fails if Document 08:

- calculates price;
- writes Trust;
- writes Health;
- moves a minecart;
- moves a vessel;
- owns mana purity;
- activates a building by appearance;
- invents a recipe;
- invents a resource;
- duplicates a Block as Item.

---

# 52. Required Test Laboratories

## 52.1 Fixed Logistics Lab

Source crate → chute → splitter → furnace → output buffer.

Verify:

- conservation;
- backpressure;
- save/load;
- direction;
- filtering;
- no duplicate visual stock.

## 52.2 Block / Item Identity Lab

Place/pack/break machine Blocks.

Verify same-machine recovery uses canonical Block projection.

## 52.3 Recipe Lab

Run machine transformation.

Verify Document 05 commits output and machine does not invent result.

## 52.4 Power Lab

Disconnect/reconnect source, overload, priority shed.

Verify exact machine state and no free production.

## 52.5 Warehouse Lab

Deliver into settlement storage with:

- permission success;
- permission failure;
- reserve protection;
- full destination.

## 52.6 Project Supply Lab

Automate a generic construction project.

Verify reserved stock remains protected.

## 52.7 Set 30 Minecart Lab

Automation loads minecart and requests dispatch.

Verify Set 30 moves vehicle and 08 waits for arrival evidence.

## 52.8 Set 30 Elevator Lab

Automation supplies power/control.

Verify Set 30 owns physical lift movement.

## 52.9 Set 26 Port Lab

Crane + warehouse + vessel cargo load.

Verify Set 26 owns vessel/docking truth while 08 owns transfer machinery.

## 52.10 Pump Lab

Pump authoritative water/fluid.

Verify no invented volume and correct power/capacity.

## 52.11 Mana Consumer Lab

Machine consumes Document-09 mana provider.

Verify no duplicate mana ledger.

## 52.12 Economy Lab

Set 27 contract requests 100 units.

Verify automation creates physical output/delivery but never sets price/payment.

## 52.13 Biology Lab

Industrial exposure event occurs.

Verify Set 29 resolves biological effect.

## 52.14 LOD Equivalence Lab

Run same factory:

- active;
- reduced;
- settlement summary;
- regional summary.

Verify conserved totals and important faults.

## 52.15 Multiplayer Race Lab

Two clients attempt to claim/send same stock.

Verify one authoritative transaction.

## 52.16 POC Leakage Lab

Shipping automation pack contains no Forest Hamlet/watchtower-only endpoint dependency.

---

# 53. Performance and Scalability

Automation can become one of Leyforge's highest-density simulation systems.

Performance strategy should prioritise:

- graph locality;
- event-driven updates;
- dirty-network rebuilds;
- batch transfer;
- aggregate distant simulation;
- pooled visuals;
- bounded sensor cadence;
- no node per item at distance;
- compact runtime records;
- chunk/region graph summaries;
- deterministic catch-up.

## 53.1 Visual Versus Authoritative Cost

Low-end settings may reduce:

- visible belt items;
- machine animation rate;
- particle density;
- sound emitters;
- network overlay detail;
- sensor UI refresh;
- distant update frequency.

They may not reduce:

- stock;
- production truth;
- machine existence;
- project delivery;
- fault history;
- ownership;
- contract fulfilment.

---

# 54. Accessibility

Automation must be understandable with:

- non-colour port indicators;
- text reasons;
- symbols/patterns;
- audible/captioned alarms;
- reduced motion;
- reduced flashes;
- simplified overlays;
- controller navigation;
- readable machine status;
- plain-language fault causes.

Players should not need to count moving belt sprites to know output rate.

---

# 55. UI / View-Model Requirements

Document 17 owns screens.

Document 08 exposes view models for:

- machine status;
- current task;
- input/output;
- power;
- maintenance;
- fault;
- network path;
- filter;
- priority;
- reservation;
- protected stock;
- external movement dispatch;
- contract/project fulfilment;
- LOD state;
- audit history.

Normal play should show concise reasons:

- “No Iron Ore”
- “Output Full”
- “No Power”
- “Minecart Route Blocked”
- “Vessel Not Berthed”
- “Project Stock Protected”
- “Mana Provider Unstable”
- “Maintenance Required”

rather than raw graph errors.

---

# 56. Godot / Summer Engine Direction

Exact implementation belongs to Document 18 v1.0.

Document 08 requires:

- data-driven Resources;
- world-scoped automation service;
- graph service;
- transaction/reservation service;
- machine runtime records;
- power service;
- control service;
- external movement adapter;
- external mana adapter;
- external economy adapter;
- external settlement adapter;
- external maritime adapter;
- deterministic LOD;
- background-safe catch-up;
- persistence/migration;
- debug graph inspector;
- validation suite;
- multiplayer authority.

Summer Engine may assist generation, implementation, diagnostics and tests under source-controlled review.

---

# 57. Production Registry Families

Document 08 should register production definitions for:

- machine class;
- fixed transport component;
- port type;
- buffer profile;
- power source/load;
- power network component;
- control component;
- sensor;
- routing policy;
- filter profile;
- production order;
- machine task capability;
- maintenance profile;
- fault profile;
- safety interlock;
- transfer policy;
- settlement endpoint;
- project endpoint;
- loader/unloader;
- pump;
- crane/winch;
- maritime machinery profile;
- movement dispatch adapter;
- mana consumer adapter;
- LOD profile;
- reason code;
- migration alias.

Set 25 governs admission.

---

# 58. Cross-System Contract Summary

## 58.1 Documents 03–06

Automation consumes:

- canonical Blocks;
- real Items;
- authoritative recipes;
- resource-provider facts.

Automation returns:

- usage;
- transformations;
- extraction evidence;
- maintenance demand.

## 58.2 Document 07

Automation requests:

- operator;
- maintainer;
- labour task.

Document 07 returns:

- worker availability;
- assigned worker;
- task evidence.

## 58.3 Document 09

Automation requests:

- mana provider;
- magical capability;
- rune control effect.

Document 09 returns:

- mana/magic state.

## 58.4 Documents 19–20

Automation consumes:

- building/service activation;
- storage endpoints;
- project demand;
- public-network permissions.

Automation returns:

- supply;
- infrastructure status;
- machine service state.

## 58.5 Set 26

Automation supplies:

- pump/crane/winch machinery state;
- cargo transfer;
- port/shipyard machine operation.

Set 26 supplies:

- vessel/berth state;
- maritime movement;
- compartment/fluid context;
- cargo/voyage evidence.

## 58.6 Set 27

Automation supplies:

- committed production;
- shipment readiness;
- physical delivery evidence.

Set 27 supplies:

- economic order;
- contract obligation;
- market/enterprise decision.

## 58.7 Set 28

Automation supplies:

- requested operation/access context.

Set 28 supplies:

- social permission/willingness when relevant.

## 58.8 Set 29

Automation supplies:

- industrial exposure/hazard context.

Set 29 supplies:

- worker biological availability/consequence.

## 58.9 Set 30

Automation supplies:

- dispatch intent;
- power/control readiness;
- cargo load status.

Set 30 supplies:

- movement state;
- route/travel evidence;
- arrival/failure.

---

# 59. Main-Document Reconciliation Requirements

| Document | Required Integration |
|---|---|
| 09 — Magic | Explicitly own mana/magic networks and expose automation consumer/provider interfaces. |
| 10 — Creatures | Automation threats, constructs and creature-operated machinery use external identity/movement. |
| 12 — Structures | Expose machine ports, maintenance areas, loading points and fixed infrastructure. |
| 13 — Peoples/Cultures/Factions | Cultural tech/law may affect automation access without ancestry determinism. |
| 14 — Dimensions | Realm infrastructure/portal interfaces remain specialist-owned. |
| 15 — Quests/Events | Consume machine faults, production/delivery evidence and sabotage outcomes. |
| 16 — Combat | Damage/sabotage affects automation state through authoritative events. |
| 17 — UI/UX | Consume automation view models/reason codes. |
| 18 — Technical | Implement graph/transaction/LOD/adapters in Godot/Summer. |
| 19 — Settlement | Planner consumes machine capability/supply without owning machine runtime. |
| 20 — Buildings | Facilities expose valid automation endpoints and service activation. |

---

# 60. Supersession and Preservation Notes

## 60.1 Preserved Mechanics

The following were originally proven or planned through the POC and remain valid production capabilities:

- mechanical extraction;
- chutes;
- buffers;
- automated furnace input/output;
- storage routing;
- warehouse delivery;
- project supply;
- maintenance;
- faults;
- cross-chunk networks;
- near/far simulation;
- mana-facing automation;
- ward/defence support;
- settlement supply;
- construction logistics;
- NPC-supported industry.

## 60.2 Archived Scenario Wrappers

Archived:

- Forest Hamlet warehouse requirement;
- watchtower-specific project crate;
- one fixed iron-production route;
- fixed raid-outcome linkage;
- POC-specific named endpoints;
- POC-only machine IDs where not promoted.

## 60.3 Production Ownership Corrections

Corrected:

- minecart/rail movement → Set 30;
- elevator/guided transport movement → Set 30;
- wagons/caravans → Set 30;
- vessel movement → Set 26;
- mana truth → Document 09;
- prices/contracts → Set 27;
- social willingness → Set 28;
- biological consequences → Set 29;
- building capability → Document 20;
- project selection → Document 19.

## 60.4 Block / Item Cleanup

Legacy separate machine Item copies are invalid when the physical machine is a recoverable Block.

The new model is:

**canonical Block**  
→ generated Block Inventory Projection  
→ Automation Definition references Block  
→ runtime Machine Instance references Automation Definition + Block instance.

---

# 61. Production Acceptance Criteria

Document 08 v1.0 is accepted when:

- [x] conserved resource flow remains core;
- [x] fixed logistics networks remain Document-08-owned;
- [x] mobile transport execution is removed from Document 08;
- [x] Set 30 dispatch/control boundary is explicit;
- [x] Set 26 maritime boundary is explicit;
- [x] Set 27 economy boundary is explicit;
- [x] Set 28 social boundary is explicit;
- [x] Set 29 biological boundary is explicit;
- [x] Document 09 mana boundary is explicit;
- [x] machines reference canonical Blocks/Items/Recipes/Resources;
- [x] duplicate machine Item identities are prohibited;
- [x] processing calls Document 05 transformations;
- [x] extraction uses real providers;
- [x] buffers/backpressure preserve stock;
- [x] warehouse/project reserves preserve ownership;
- [x] NPC labour remains meaningful;
- [x] maintenance/faults are readable;
- [x] maritime pumps/cranes/loaders are integrated;
- [x] rail/minecart/elevator physical movement is not duplicated;
- [x] distant simulation remains conserved;
- [x] multiplayer authority is explicit;
- [x] POC scenario wrapper is archive-only;
- [x] Godot/Summer direction is current; and
- [x] Document 09 can now reconcile against a clean automation/mana boundary.

---

# Appendix A — Automation Machine Instance Template

```yaml
machine_instance:
  machine_instance_id: machine:<ulid>
  automation_definition_ref: automation:<id>
  physical_block_or_structure_ref: <id>
  owner_ref: <id>
  permission_revision: <rev>

  topology:
    network_refs: []
    port_bindings: []

  operation:
    state: idle
    task_ref: null
    recipe_ref: null
    work_record_ref: null

  storage:
    input_inventory_refs: []
    output_inventory_refs: []
    buffer_refs: []

  power:
    power_network_ref: null
    demand_band: none
    allocation_band: none

  magical:
    mana_provider_snapshot_ref: null

  maintenance:
    condition_band: good
    maintenance_due: false
    maintenance_record_ref: null

  faults:
    active_reason_codes: []

  external:
    movement_dispatch_ref: null
    maritime_context_ref: null
    economic_order_ref: null

  runtime:
    lod_state: A0
    revision: 1
```

---

# Appendix B — Fixed Transfer Record

```yaml
automation_transfer:
  transfer_id: transfer:<ulid>
  source_inventory_ref: inventory:<id>
  destination_inventory_ref: inventory:<id>
  canonical_content_ref: <block_projection_or_item>
  quantity: <integer_or_valid_measure>
  ownership_from: <id>
  ownership_to: <id>
  reservation_refs: []
  network_path_ref: network_path:<id>
  state: reserved
  created_world_time: <time>
  committed_world_time: null
  reason_codes: []
  revision: 1
```

---

# Appendix C — Production Order Template

```yaml
production_order:
  production_order_id: production_order:<ulid>
  requester_ref: <player|settlement|contract|project|enterprise>
  recipe_or_process_ref: recipe:<id>
  desired_quantity: <q>
  destination_ref: <inventory|project|contract>
  stock_target_min: <q>?
  stock_target_max: <q>?
  priority: normal
  reservation_policy_ref: <id>
  economic_context_ref: <id>?
  project_context_ref: <id>?
  state: proposed
  reason_codes: []
  revision: 1
```

The order is intent, not output.

---

# Appendix D — Automation Network Types

| Network | Document 08 Role | External Boundary |
|---|---|---|
| Fixed Item | Own fixed movement/routing. | Canonical Item/Block stock from 03/04. |
| Fixed Bulk Endpoint | Own loading/staging/control. | Mobile mover by Set 30/26. |
| Process Fluid | Own pump/control/industrial routing. | Fluid truth by 26B/environment owner. |
| Mechanical Power | Own automation source/load allocation. | Environment provides source conditions. |
| Thermal/Industrial Power | Own machine power runtime. | Fuel transformations use 05/06. |
| Mana Consumer | Consume provider state. | Document 09 owns mana. |
| Control | Own declarative automation signals. | Sensors read external truth. |
| Portal Dispatch | Stage/queue cargo. | 09/14 own portal/realm travel. |

---

# Appendix E — POC to Production Migration Map

| Legacy POC Element | Production Treatment |
|---|---|
| Basic Mechanical Miner | Generic extractor family, subject to resource provider. |
| Wooden Chute | Fixed gravity logistics. |
| Chute Inlet/Outlet | Port profiles on canonical Blocks. |
| Basic Furnace Auto Port | Machine-interface capability, not duplicate furnace identity. |
| Output Buffer | Generic automation buffer. |
| Village Warehouse Input Hatch | Settlement storage endpoint family. |
| Delivery Ledger | Audit/read model; Set 27 handles economic meaning. |
| Project Supply Crate | Project reserve endpoint; physical crate identity from Document 03. |
| Mana Battery | Document 09 magical energy/storage authority; 08 consumer integration. |
| Mana Conduit | Document 09 magical transmission authority. |
| Ward Lantern Link | 09 ward truth, 08 control integration only. |
| Minecart Loader | Fixed loader remains 08; minecart movement Set 30. |
| Rail Track | Canonical Block/infrastructure; movement Set 30. |
| Portal Relay | 09/14 traversal; 08 staging/control interface. |

---

# Appendix F — Cross-Owner Failure Examples

### Example 1 — Contract Wants Grain
Set 27 says a contract requires 100 Grain.

Automation has only 60.

Correct outcome:
- reserve 60 if policy permits;
- schedule/await remaining production;
- contract stays incomplete.

Incorrect:
- automation creates 40 because order target is 100.

### Example 2 — Minecart Is Loaded
Automation loads the minecart.

Bridge route becomes inaccessible.

Correct:
- Set 30 returns route failure;
- automation keeps cargo in vehicle;
- dispatch blocks/replans.

Incorrect:
- automation changes cart location to destination because schedule elapsed.

### Example 3 — Mana Furnace
Machine has ore and output space.

Document 09 reports no compatible mana.

Correct:
- machine pauses with `AUTO-MANA-001`.

Incorrect:
- Document 08 creates “automation mana” separately.

### Example 4 — Worker Exposed to Toxin
Machine leaks toxic process fluid.

Correct:
- 08 emits leak/exposure evidence;
- 29 resolves biological effect.

Incorrect:
- 08 writes `Health -= 10`.

### Example 5 — Machine Pickup
Placed crusher Block is packed.

Correct:
- same Block identity enters inventory projection with approved state.

Incorrect:
- spawn a separate `item.crusher` while Block remains canonical.

---

# Appendix G — Definition of Done for Implemented Automation Foundation

The implemented automation system is not complete because a belt moves.

A production milestone requires evidence that:

- machine definitions resolve stable IDs;
- canonical Block identity is respected;
- fixed logistics conserve stock;
- recipes are committed by Document 05;
- resource extraction uses valid source providers;
- buffers/backpressure work;
- power is required and conserved under the chosen abstraction;
- control loops are bounded;
- permissions work;
- project reserves cannot be stolen accidentally;
- warehouse deliveries preserve ownership;
- NPC operators use persistent people;
- Set 30 transport handoff works;
- Set 26 port/vessel machinery handoff works;
- Document 09 mana handoff works;
- Set 27 contract fulfilment consumes physical evidence;
- Set 29 hazard consequence handoff works;
- LOD produces equivalent conserved totals;
- save/load preserves work-in-progress;
- multiplayer prevents duplicate output;
- migration handles legacy POC/movement/mana ownership;
- low-end presentation does not change stock;
- every core fault has a readable reason; and
- no Forest Hamlet/watchtower-specific endpoint is required by normal production.

---

# Completion Statement

**Document 08 v1.0 reconciles Leyforge automation with the production registry architecture and the final post-Atlas ownership model.**

Automation remains a major pillar of the game:

- physical;
- visible;
- resource-conserving;
- scalable;
- settlement-connected;
- NPC-supported;
- magic-compatible;
- maritime-compatible;
- multiplayer-safe;
- understandable when it fails.

The system is now narrower where later documents have stronger ownership:

- mobile movement belongs to Set 30;
- vessel movement belongs to Set 26;
- mana truth belongs to Document 09;
- economic truth belongs to Set 27;
- social truth belongs to Set 28;
- biological truth belongs to Set 29.

That narrowing makes automation stronger rather than weaker. Document 08 can focus on what it uniquely owns: **machines, fixed logistics, power allocation, production execution, routing, control, buffers, maintenance, faults, dispatch intent and conserved industrial state.**

**Next foundation reconciliation dependency: Document 09 — Magic System v1.0.**
