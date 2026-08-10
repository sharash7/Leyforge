# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 26

# 26O - Maritime UI/UX, Multiplayer, Godot/Summer Engine Technical Plan, Performance, QA and Main-Document Integration

*Version 0.1 - Maritime Technical Consolidation, Player-Trust, Release Evidence and Integration Closure Draft*

A production-oriented capstone that converts the complete Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion into one coherent player-facing, authoritative, persistent, scalable and testable Godot/Summer Engine implementation contract, while defining the exact downstream amendments required across the main Leyforge document suite and the final Set 25 integration-closure obligations.

Working design document - maritime UI/UX, multiplayer authority, runtime architecture, persistence, performance, QA, migration, release readiness and main-document integration foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Final Set 26 integration authority for UI/UX requirements, multiplayer authority, Godot/Summer Engine technical architecture, persistence, simulation LOD, performance budgets, QA, migration execution, release evidence and downstream amendment mapping. |
| Gameplay Authority | 26O implements and consolidates Documents 26A-26N; it does not silently redesign their gameplay contracts. Specialist documents remain authoritative for their owned mechanics. |
| Player-Trust Rule | UI may simplify presentation but may never invent state, hide authoritative loss, imply capability without a provider, or conceal a blocking ownership, safety, resource, environmental or permission reason. |
| Multiplayer Rule | One authoritative world simulation validates persistent changes in solo, LAN, co-op and future dedicated-server play. Clients predict presentation and ordinary movement only where reconciliation is bounded and safe. |
| Moving-Vessel Rule | Commissioned vessels use stable vessel-local coordinates. Characters, components, projectiles and temporary interactions may bind to a moving frame without converting vessel blocks into individual physics or network objects. |
| Persistence Rule | Stable definitions are separate from runtime instances. Saves store seed-plus-delta world state, vessel-local deltas, persistent identities, ownership, cargo, crew, projects, ecology summaries, events and required recovery metadata. |
| Engine Direction | Godot is the runtime/editor host. GDScript is the default implementation language; performance-native code is introduced only after profiling proves a bounded hotspot. Summer Engine assists development but is not a shipped runtime dependency. |
| Performance Direction | Near simulation is detailed, medium simulation is reduced and distant simulation is summary-based. Work is budgeted, incremental and deferrable; no ambient system may require one Node, physics body, network object or save record per voxel, fish, wave crest or distant crew member. |
| QA Direction | Automated validation and deterministic fixtures support, but never replace, packaged-build profiling, multiplayer soak, accessibility testing and manual feel/visual acceptance. |
| Set 25 Direction | Set 25 remains the governance, registry, packaging, migration, validation and release spine. 26O provides the sufficient-lock evidence and downstream amendment map needed for final Set 25 closure. |
| Production Slice | Recommend a bounded Maritime Foundation Vertical Slice before broad naval-content production. Full fleet war, realm arks, massive vessels and exhaustive ecology remain later tiers unless evidence supports advancement. |
| Final Authority | Ash retains final authority over namespace freeze, release scope, budgets, multiplayer breadth, accessibility defaults, production classification and acceptance of downstream amendments. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION

# Document Purpose

Documents 26A through 26N define the maritime expansion from water and world generation through vessels, shipbuilding, ports, fleets, combat, ecology and cross-system progression. Document 26O closes the remaining implementation and integration questions. It determines how those systems are presented to players, which runtime services own their mutable state, how multiplayer authority is divided, how moving interiors remain stable, how saves and migrations survive change, how detailed and distant simulation reconcile, how performance is measured, how release evidence is collected, and exactly which existing Leyforge documents must be amended or replaced.

This document is deliberately technical without becoming an engine-code dump. The project must remain editable and understandable by design documents, registries, Forge sources and Summer Engine task contracts. Exact file paths, repository modules and build commands are discovered during the required read-only repository audit before implementation. The architecture therefore specifies service responsibilities, record boundaries, commands, events, data flow and acceptance conditions rather than pretending that source files already exist at guessed locations.

The capstone also preserves the most important promises from the earlier maritime documents. An ocean is not a decorative plane. A vessel is not one rigid mesh with a health bar. A port is not a menu. A fleet is not an abstract number when nearby. A fishery is not an infinite loot table. A storm is not a screen effect. A naval battle is not valid because a damage number appeared. Each capability must resolve through authoritative world, resource, identity, ownership and environmental state, and every critical player-facing result must explain why it occurred.

The intended result is a maritime layer that can scale from standing in surf, rowing a tiny boat and repairing a leaking hull to commanding crews, running ports, crossing storm seas, exploring drowned sites, operating fleets and resolving regional conflict, without requiring a separate game architecture for each scale.

# Design Sources, Authority and Supersession

| Source | Authority Consumed | 26O Responsibility |
| --- | --- | --- |
| 00-02 | Master fantasy, sandbox loop, progression, skills, player freedom and difficulty philosophy. | Preserve cross-pillar play and expose maritime capability without creating a separate class game. |
| 03-06 | Blocks, items, recipes and resources as separate stable domains with physical conservation. | Define runtime lookup, facets, transaction boundaries, UI views, migrations and performance treatment. |
| 07-09 | NPC identity, settlement simulation, automation, mana and practical magic. | Integrate crews, ports, shipyards, service networks and distant summaries without duplicate truth. |
| 10-17 | Creatures, worldgen, structures, cultures, dimensions, quests, combat and UI/UX. | Consolidate maritime extension behaviour and player-facing information. |
| 18 legacy | Stable IDs, seed-plus-delta persistence, LOD, authority and testing principles; Unreal implementation is obsolete. | Replace Unreal assumptions with the Godot/Summer Engine architecture defined here and in the future rewritten Document 18. |
| 19-20 | Player blueprint planning, project construction, seven needs and functional settlement contracts. | Integrate Vessel Forge, shipyards, ports and coastal projects into shared project/runtime concepts. |
| 21-23 | Forge, Entity/Blueprint authoring, presentation manifests, sockets, events, audio and VFX. | Define runtime consumption, validation, maritime workspace integration and release evidence. |
| 24A-24L | Atlas topology, marine world content, cultures, ecology, sites, bosses, history and roadmap. | Preserve canon and require every selected package to bind to executable systems. |
| 25A-25L | Governance, IDs, schemas, packs, migration, validation, classification, catalogues, manifests, tasks and integrity audit. | Satisfy Set 25 sufficient-lock and closure requirements without creating a competing governance layer. |
| 26A | Expansion vision, document map, source boundaries and hybrid architecture. | Close remaining technical decisions and record final handoff. |
| 26B | Fluid identity, Water Bodies, bounded local fluid, containment, flooding and queries. | Implement Water Simulation Service boundaries, persistence, networking and budgets. |
| 26C | Oceans, coasts, islands, bathymetry, access classes and underwater world generation. | Define streaming, seed validation and player-map integration. |
| 26D | Wind, waves, tides, currents, weather and storms. | Define Marine Field runtime, cadence, presentation and network summarisation. |
| 26E | Swimming, diving, breath, hazards, rescue and underwater interaction. | Finalise control/presentation/accessibility and character-water technical boundaries. |
| 26F | Vessel-local voxel architecture, compartments, roles and commissioning. | Implement vessel records, moving frames, graph updates, save deltas and technical caps. |
| 26G | Buoyancy, stability, propulsion, steering and navigation. | Implement movement authority, prediction, force sampling, route simulation and performance profiles. |
| 26H | Shipwright construction, repair, refit and salvage. | Integrate work packages, transaction locks, project recovery and distant progress. |
| 26I | Vessel Forge, blueprint authoring and procedural variants. | Define editor/runtime separation, bake products, validation and migration boundaries. |
| 26J | Ports, harbours, shipyards, crews and maritime civilisation. | Implement service resolution, crew representation, port LOD and operational UI. |
| 26K | Trade, fleets, piracy, navies and regional power. | Implement route/fleet summaries, cargo custody, strategic events and authoritative transitions. |
| 26L | Naval combat, boarding, damage, flooding, fire and siege. | Implement tactical authority, moving-frame combat, network scope and persistence. |
| 26M | Ecology, fishing, sea creatures, dungeons and bosses. | Implement cohort ecology, representative actors, encounter promotion and bounded save/network state. |
| 26N | Progression, registries, magic, automation, economy, quests and events. | Consume final view-model, persistence, validation and package requirements and close release evidence. |

> **Supersession Rule**
>
> Where this document conflicts with the Unreal-specific implementation sections of Document 18, this document is authoritative for Set 26 and becomes mandatory input to the complete Godot/Summer Engine rewrite of Document 18. Gameplay rules owned by 26A-26N are not superseded merely because 26O chooses a technical implementation technique.

# Static Table of Contents

1\. Locked Maritime Technical and Player-Trust Identity

2\. Decision Status, Recommendation Boundary and Final Authority

3\. Scope, Non-Goals and Technical Ownership

4\. Cross-System Runtime Architecture

5\. Maritime UI/UX Architecture

6\. Information Hierarchy, View Models and Reason Codes

7\. Surface, Swimming, Diving and Underwater HUD

8\. Helm, Sailing, Propulsion and Navigation HUD

9\. Vessel Inspection, Compartments and Damage Readability

10\. Shipwright, Commissioning, Construction and Refit UX

11\. Ports, Harbours, Shipyards and Crew Management UX

12\. Trade, Cargo, Contracts, Fleets and Regional Power UX

13\. Naval Combat, Boarding, Rescue and Damage-Control UX

14\. Fishing, Ecology, Dungeons and Boss UX

15\. Charts, Maps, Route Planning, Weather and Knowledge Confidence

16\. Notifications, Alarms, History and Quiet Modes

17\. Controls, Camera, Comfort and Accessibility

18\. Split-Screen and Shared-Screen UX

19\. Multiplayer Identity and Authority Model

20\. Command Validation, Permissions and Ownership

21\. Replication, Relevance and Network Interest Management

22\. Vessel-Local Coordinates and Moving Interior Architecture

23\. Character, Projectile and Boarding Reconciliation

24\. Helm, Stations, Orders, Locks and Handover

25\. Multiplayer Cargo, Construction, Combat and Economy Transactions

26\. Reconnect, Host Migration Boundaries and Failure Recovery

27\. Persistence and Save Architecture

28\. Maritime Save Records and World Manifest Extensions

29\. Save Journaling, Atomic Transactions and Recovery

30\. Migration, Optional Packs, Quarantine and Removal Behaviour

31\. Simulation LOD and Promotion/Demotion

32\. Distant Vessels, Fleets, Ports, Markets and Voyages

33\. Distant Ecology, Fisheries, Quests and Events

34\. Godot/Summer Engine Architecture

35\. Core Services, Records, Commands and Events

36\. Water, Marine Field and World-Generation Runtime

37\. Vessel, Movement, Compartment and Shipwright Runtime

38\. Port, Crew, Fleet, Economy and Combat Runtime

39\. Ecology, Site, Boss, Quest and Event Runtime

40\. UI View-Model and Presentation Adapter Architecture

41\. Forge, Baking, Import and Runtime Product Boundaries

42\. Threading, Scheduling, Determinism and Work Queues

43\. Performance Philosophy and Measurement Method

44\. Provisional Vessel and Simulation Budgets

45\. Rendering, Ocean, Underwater and Streaming Budgets

46\. Network, Save, Memory and UI Budgets

47\. Diagnostics, Profiling and Maritime Readiness Dashboard

48\. QA Architecture and Evidence Bundles

49\. Automated Validation and Deterministic Fixtures

50\. Manual, Feel, Accessibility and Visual Acceptance

51\. Multiplayer, Soak, Recovery and Migration Testing

52\. Prototype Laboratories and Technical Spikes

53\. Foundation Vertical Slice and Production Classification Recommendation

54\. Main-Document Amendment Matrix - Documents 00-09

55\. Main-Document Amendment Matrix - Documents 10-18

56\. Main-Document Amendment Matrix - Documents 19-25

57\. Set 25 Integration Closure and Namespace Admission

58\. Production Rollout and Summer Engine Work Lanes

59\. Release Gates, Redesign Triggers and Definition of Done

60\. Final Decision Register

61\. Document Set 26 Completion and Handoff

Appendix A. Maritime Runtime Service Map

Appendix B. Multiplayer Authority Matrix

Appendix C. Provisional Performance Budget Register

Appendix D. QA and Prototype Matrix

Appendix E. Main-Document Amendment Register

Appendix F. Maritime Diagnostic Reason Codes

Appendix G. Summer Engine Task Contract Examples

Appendix H. Final Set 26 Completion Checklist

# 1. Locked Maritime Technical and Player-Trust Identity

Document 26O is the reliability and interpretation layer of the maritime expansion. It exists so the player can trust that what the game shows corresponds to the same authoritative state used by water, vessels, inventories, NPCs, markets, quests and saves. It also exists so implementation can scale without replacing physical gameplay with hidden abstractions or attempting to simulate every detail at full fidelity everywhere.

> **Locked Rule**
>
> Maritime systems may change representation with distance, platform budget and network relevance, but they may not change ownership, conserved quantities, persistent identity, validated capability or historical consequence merely because the representation became cheaper.

| Identity Layer | Meaning | Player-Facing Result |
| --- | --- | --- |
| World First | Water, vessels, ports, crews, weather and creatures communicate through the world before panels where practical. | Maritime play remains physical and atmospheric. |
| Explainable State | Critical state exposes cause, owner, severity and recovery action. | Players understand why a vessel will not sail, a pump stopped or a berth is denied. |
| Authoritative Transactions | Persistent changes are validated by one authority path. | No duplication, phantom cargo, split ownership or divergent ship state. |
| Stable Moving Frames | Vessels own local coordinates and local voxel state. | Walking inside a moving ship remains coherent without per-block physics. |
| Layered Simulation | Detail is promoted near players and summarised at distance. | Large oceans can contain active civilisation and ecology without frame collapse. |
| Recoverable Persistence | Saves, migrations and pack removal have explicit recovery rules. | Long-lived worlds survive expansion changes. |
| Accessible Control | Complex maritime actions have remapping, assistance and non-colour explanations. | Depth is preserved without making dexterity or perception a mandatory barrier. |
| Evidence-Gated Production | A feature is not production-ready because its prose exists. | Release status reflects measured behaviour. |

## 1.1 Player-Trust Contract

The UI must distinguish four kinds of information: authoritative known state, estimated state, predicted state and unknown state. A compass heading can be authoritative. A forecast can be probabilistic. A collision warning can be predicted. A distant reef may be unknown. These categories must not share the same visual language by accident.

Consequential failures require a reason code plus readable text. `Cannot depart` is insufficient. The player should be able to discover whether departure is blocked by draft, missing crew, ownership, damaged steering, weather restriction, unpaid port hold, insufficient provisions or an active construction lock.

## 1.2 Representation Is Not Authority

A distant fleet may be represented as one summary record. When promoted near a player, that summary may create individual Vessel Instances and representative crews. The promotion process must preserve vessel IDs, cargo, damage, crew obligations, route state and event history. Visual spawn placement may vary within allowed deterministic bounds; the owned resources and outcomes may not.

# 2. Decision Status, Recommendation Boundary and Final Authority

26O closes technical boundaries but deliberately distinguishes a production lock from a prototype recommendation. Exact performance values, economy cadence, accessibility defaults and release roster need packaged evidence. Where measurements do not yet exist, this document establishes provisional targets and the test that can replace them.

| Decision Type | Meaning | Treatment in 26O |
| --- | --- | --- |
| Locked Architecture | Source-of-truth or system boundary already approved by prior documents. | Must be implemented or explicitly redesigned through governance. |
| Working Production Lock | Strong direction required to unblock implementation. | Use unless evidence or Ash changes it. |
| Provisional Budget | Numeric target required for profiling. | Measured and revised before release admission. |
| Recommended Scope | Proposed first production slice. | Requires classification/sign-off, not automatic Core status. |
| Deferred | Feature intentionally outside first maritime foundation. | Preserve extension boundary only. |

The proposed expansion namespace is **`leyforge.expansion.maritime`** for definitions that exist only when the expansion is installed. Existing Core definitions retain their Core IDs and receive maritime facets or relationships. This is a recommended namespace freeze pending final approval and Set 25 manifest registration; it is not permission to rename already approved Core IDs.

# 3. Scope, Non-Goals and Technical Ownership

26O owns implementation contracts for the maritime expansion but not every game-wide technical concern. The future rewritten Document 18 remains the project-wide engineering authority; 26O supplies the complete maritime requirements that rewrite must incorporate.

## 3.1 In Scope

- Final maritime UI/UX information, controls and accessibility requirements.
- Solo, LAN, co-op, split-screen and dedicated-server-ready authority boundaries.
- Vessel-local coordinate, moving-interior and boarding technical architecture.
- Maritime persistence, journaling, migration, optional-pack quarantine and LOD reconciliation.
- Godot service boundaries, data records, commands, events and scheduling rules.
- Performance measurement method and provisional budgets.
- Automated/manual QA, multiplayer soak, accessibility and migration evidence.
- Foundation Vertical Slice recommendation and redesign triggers.
- Exact downstream amendment matrix for Documents 00-25.
- Set 25 sufficient-lock and final integration-closure obligations.

## 3.2 Explicit Non-Goals

- Full computational fluid dynamics.
- One physics body or Node per vessel voxel.
- One network entity per ambient fish, wave crest, rope segment, distant sailor or cargo unit.
- Real-world naval architecture, finite-element stress analysis or exact hydrostatics.
- Unbounded procedural code generation inside the shipped game.
- Shipped dependence on Summer Engine or any development AI service.
- Mandatory always-online simulation.
- MMO-scale authority architecture in the first release.
- Silent regeneration of existing oceans, ports, islands, vessels or player structures during migration.
- Automatic adoption of every Set 26 feature into Core Production.

# 4. Cross-System Runtime Architecture

The runtime is organised around authoritative services and compact persistent records rather than a hierarchy where every gameplay object owns its own truth. Nodes represent currently loaded presentation/interaction. Services and records own durable state.

| Runtime Layer | Primary Responsibility | Examples |
| --- | --- | --- |
| Definition Layer | Immutable validated content. | Blocks, items, vessel components, species, port services, recipes. |
| World Record Layer | Persistent mutable state independent of loaded scene Nodes. | Vessel Instance, Port Instance, Fleet Record, Water Body delta, ecology cohort. |
| Authority Services | Validate commands and mutate records. | VesselService, FluidService, CargoService, PortService. |
| Simulation Services | Advance bounded state over time. | MarineFieldService, VoyageSimulationService, EcologySimulationService. |
| Scene/Actor Layer | Nearby interaction and presentation. | Vessel scene root, NPC actor, creature representative, water surface renderer. |
| View-Model Layer | Read-only player-facing interpretation. | VesselStatusVM, PortCallVM, FloodingVM, RoutePlanVM. |
| Presentation Layer | HUD, menus, audio, VFX, animation and overlays. | Helm HUD, alarm tones, compartment overlay, map layers. |
| Evidence Layer | Diagnostics, test traces, profiles and release bundles. | Command logs, semantic hashes, migration report, performance capture. |

Commands are intent, events are results. `RequestSetHelmInput`, `RequestTransferCargo`, `RequestPatchBreach` and `RequestAcceptContract` do not mutate state directly. The owning service validates identity, permission, current state and resources, commits atomically, then emits result events consumed by UI, audio/VFX, quests and replication.

# 5. Maritime UI/UX Architecture

Maritime UI extends Document 17's world-first, progressive-disclosure model. Normal movement should not become a permanent cockpit dashboard. Information expands according to role, risk and interaction context.

| UI Context | Always Available | Contextual Expansion | Deep Inspection |
| --- | --- | --- | --- |
| Shore / Water | Health, relevant breath/exposure, interaction prompt. | Current/wave warning, depth cue, rescue prompt. | Environment inspection, accessibility aids. |
| Helm | Heading, speed, control state, immediate hazards. | Wind/current, propulsion, draft/depth, station faults. | Route, sail/engine configuration, stability and certification. |
| Engineering | Critical power/pump/propulsion state. | Compartments, fuel/mana, heat, faults. | Network graphs, maintenance and repair queue. |
| Port | Location, berth/permission, active service. | Cargo, crew, fees, weather hold. | Port service directory, market, contracts, shipyard. |
| Combat | Threat, own vessel critical state, objective. | Weapon readiness, boarding, flooding/fire alarms. | Tactical status, damage-control assignments, fleet orders. |
| Ecology | Known species/habitat cues. | Catch legality, season, population confidence. | Codex, research, fishery state, conservation history. |

Maritime panels must use the same interaction grammar as the wider game: inspect, compare, pin, assign, transfer, configure, confirm, cancel, undo where safe, open history and jump to cause. A port warehouse transfer should not invent a new control language unrelated to ordinary storage.

# 6. Information Hierarchy, View Models and Reason Codes

UI reads authoritative state through view models, not by interrogating arbitrary scene Nodes. A view model may aggregate multiple systems but records provenance for each field.

| View Model | Source Inputs | Critical Outputs |
| --- | --- | --- |
| AquaticStatusVM | 26B/26D environment + 26E character state. | Contact state, breath, exposure, current, safe-surface direction. |
| HelmStatusVM | Vessel movement + environment + controls. | Heading, speed, turn response, propulsion, anchor, immediate hazard. |
| VesselIntegrityVM | Structural graph + compartments + damage. | Breaches, fire, flooding, critical supports, inaccessible areas. |
| CommissioningVM | 26F validator + 26H project + 26I blueprint. | Errors, warnings, capability summary, issue locations, next action. |
| PortCallVM | Port service + vessel + law + cargo + crew. | Berth, service availability, holds, fees, queue and departure blockers. |
| VoyagePlanVM | Charts + route + weather + vessel certification. | Route confidence, ETA band, hazards, supplies, alternatives. |
| FleetVM | 26K fleet records. | Readiness, mission, formation, route, losses and command scope. |
| CombatVM | 26L combat state. | Objective, threats, weapon readiness, alarms, surrender/capture state. |
| EcologyVM | 26M habitat/cohort/knowledge. | Known abundance, season, legal status, disturbance and research confidence. |

Critical reason codes are stable IDs. Localised text can change without breaking tests, logs, quests or support tools. UI must display friendly explanations, while diagnostics may expose the stable code.

# 7. Surface, Swimming, Diving and Underwater HUD

Aquatic movement remains readable without a permanent underwater instrument panel. Breath appears when relevant. Pressure/depth warnings appear before they become damaging where character knowledge or equipment permits. Current, surf and undertow are primarily world cues but have optional assist indicators.

Default aquatic HUD elements:

- Breath/air capacity while submerged or using a finite breathing source.
- Clear low-air escalation using icon, text/caption, audio and optional vibration.
- Depth band or pressure-risk indicator when depth materially changes survival.
- Temperature/exposure warning when environmental bands matter.
- Current-force cue when the character is being displaced beyond ordinary swim input.
- Safe-surface/nearest-air assist when enabled.
- Rescue prompt when an incapacitated character is targetable.
- Equipment failure or depleted-air source warning with explicit reason.

Accessibility may provide unlimited breath, extended breath, reduced current force, auto-surface assistance and simplified vertical controls. These assists do not reduce progression rewards by default.

# 8. Helm, Sailing, Propulsion and Navigation HUD

The helm interface prioritises the next navigational decision rather than every available measurement. Its baseline is heading, approximate speed, propulsion state and immediate danger. Advanced instrumentation appears only when the vessel or player actually owns the relevant capability.

| Information | Baseline Source | Knowledge Rule |
| --- | --- | --- |
| Heading | Vessel frame + compass capability where required by rules. | Exact numeric heading may require instrument or UI setting; cardinal direction can remain basic. |
| Speed | Vessel movement. | Exact units optional; qualitative speed always readable. |
| Wind | 26D field + sensing. | Exact direction/strength requires appropriate observation/instrument. |
| Current | 26D field + vessel response. | Can be inferred from drift; detailed vector requires knowledge/instrument. |
| Water Depth | 26C/26B + sounding provider. | Unknown or approximate without chart/sounding. |
| Draft / Clearance | 26G vessel + bathymetry. | Warning confidence depends on known chart/depth. |
| Route ETA | Route simulation + weather confidence. | Display a band when forecast uncertainty is material. |

The helm should support direct control, assisted heading hold and delegated NPC operation where unlocked. Assistance never creates thrust, steering authority or route knowledge that the vessel lacks.

# 9. Vessel Inspection, Compartments and Damage Readability

A commissioned vessel requires multiple readable layers without forcing the player to memorise internal graphs. The primary world interaction is inspection of the targeted block/component or nearby compartment. Overlays provide system-wide understanding on demand.

Required overlays include structural role, compartment boundaries, watertight openings, access routes, flooding, fire/smoke, propulsion/control providers, power/mana/service networks, cargo loading and repair priority. Every overlay uses non-colour cues such as patterns, line styles, icons and text labels.

Structural warnings must distinguish fatal commissioning blockers, operational restrictions, maintenance warnings and advisory optimisation. A ship that is valid but poorly trimmed should not be presented as structurally invalid. A ship with an open below-waterline breach should not be presented as seaworthy because the hull graph still connects.

# 10. Shipwright, Commissioning, Construction and Refit UX

Shipwright workflows combine 26F structural validation, 26G movement certification, 26H work packages and 26I authoring. The UI must preserve their separate authorities while presenting one coherent workflow.

The recommended flow is:

1. Select or scan a candidate structure/blueprint.
2. Resolve connected structure and vessel-local bounds.
3. Validate ownership and protected edits.
4. Evaluate structural roles, compartments, access and service mounts.
5. Calculate mass/displacement/stability inputs and operational certification.
6. Show errors, warnings, accepted risks and exact locations.
7. Resolve construction/repair/refit work packages and required resources.
8. Commission or recommission through one authoritative transaction.
9. Record Vessel ID, name, ownership, blueprint provenance and history.

Issue lists support filter by severity/system/deck, focus camera on issue, highlight affected cells and open the underlying reason. A simplified assistant may suggest common fixes but may not automatically modify a player's vessel without explicit approval.

# 11. Ports, Harbours, Shipyards and Crew Management UX

Port UI is a service directory over physical settlement state. A service appears available only when its buildings, workers, stock, access, networks, weather conditions and permissions currently satisfy the service contract.

The Port Call interface groups berth/anchorage, customs, cargo, provisions, crew, repairs, shipyard, rescue/medical, market/contracts and departure readiness. It does not teleport stock between arbitrary inventories. Transfers remain authoritative logistics transactions.

Crew management is role-led rather than daily micromanagement. Named officers/specialists and persistent notable crew may be inspected individually. Ordinary crew may be represented as bounded cohorts at distance. The player assigns stations, watches, priorities and standing orders; NPC schedule logic performs routine labour.

# 12. Trade, Cargo, Contracts, Fleets and Regional Power UX

Cargo UI distinguishes ownership, custody, quantity, condition, provenance, destination, contract reservation and legal status. A manifest is not the inventory itself; it references authoritative storage/cargo records.

Market screens show known price, confidence, age of information and meaningful causes where discovered. The system must avoid presenting stale remote prices as guaranteed truth. Contract interfaces expose issuer, obligations, custody, time conditions, penalties, legal permissions, failure consequences and accepted contributors.

Fleet UI focuses on mission, composition, readiness, supply, route, command and current risk. It avoids turning regional power into one opaque score. Detailed power profiles remain inspectable by contributing capability such as logistics, shipbuilding, intelligence, diplomacy and force.

# 13. Naval Combat, Boarding, Rescue and Damage-Control UX

Combat HUD expands around the encounter objective. A merchant escaping pirates needs different emphasis from a warship attacking a fort. The objective line therefore remains explicit: escape, escort, protect, disable, board, capture, rescue, hold passage, break blockade or defeat.

Critical alarms use priority and suppression rules. Hull breach, uncontrolled flooding, fire near volatile cargo, steering loss, propulsion loss, man overboard and imminent capsize may interrupt ordinary notifications. Repeated minor impacts are grouped.

Boarding UI exposes valid boarding links, control zones, surrender/capture state and crew orders without replacing ordinary character combat UI. Rescue actions remain available during combat where physically possible. Damage-control assignment can be manual, delegated or automated within configured crew authority.

# 14. Fishing, Ecology, Dungeons and Boss UX

Fishing interfaces show method, gear, bait, known habitat cues, legal restrictions and catch handling. They do not expose exact hidden population counts by default. Knowledge unlocks may improve confidence bands.

Ecology views distinguish direct observation from inferred regional state. Research, migration reports, fishery records and port knowledge may reveal trends. Protected species or closures use clear text and icons; no law or conservation rule is communicated by colour alone.

Underwater-site interfaces prioritise breathable refuge, route memory, hazard preparation and extraction path. Boss interfaces preserve 26M's multiple-resolution philosophy: combat, rescue, cleansing, communication, restoration, containment or retreat may be valid depending on the encounter.

# 15. Charts, Maps, Route Planning, Weather and Knowledge Confidence

Maritime maps layer geography, bathymetry, hazards, known currents, tide references, weather, ports, routes, wrecks, ecological knowledge and political claims according to player knowledge. Unknown is a valid state.

Route planning produces a proposed path, not a guarantee. It evaluates vessel capability, draft, environment, route permissions, supplies, current forecast and known hazards. The player may select safe, balanced, fast or custom priorities. NPC navigators may suggest alternatives based on their knowledge and role.

Confidence is first-class. A recently surveyed channel may be high confidence. A centuries-old chart may be low confidence. A predicted storm path may show a probability region rather than a precise future line.

# 16. Notifications, Alarms, History and Quiet Modes

Maritime systems can generate enormous event volume. The notification layer therefore groups routine production and escalates only decisions, risks and meaningful consequences.

| Priority | Examples | Behaviour |
| --- | --- | --- |
| Critical | Drowning, capsize risk, major breach, uncontrollable fire, collision imminent. | Immediate multimodal alert, configurable pause/slow where allowed. |
| High | Steering failure, berth revoked, crew emergency, severe storm warning. | Prominent alert and persistent task until acknowledged/resolved. |
| Medium | Cargo blocked, repair material missing, route changed, fishery closure. | Grouped notification with direct cause link. |
| Low | Routine catch, ordinary sale, crew shift completion. | History log or quiet summary by default. |

Players can reduce notification density without losing critical alarms. Histories remain searchable for vessel, port, cargo, contract, fleet, ecology and event records.

# 17. Controls, Camera, Comfort and Accessibility

All maritime controls inherit the remapping, hold/toggle, controller and accessibility architecture of Document 17. New modes must not assume mouse-only precision.

Required options include:

- Hold or toggle for helm focus, sprint/swim, interaction and aim where meaningful.
- Adjustable steering sensitivity, dead zones and response curves.
- Simplified sail/propulsion controls that preserve capability but reduce simultaneous inputs.
- Assisted heading hold and station handover where unlocked.
- Auto-surface and simplified depth controls.
- Reduced camera bob, roll and horizon movement.
- Reduced wave/underwater distortion and reduced flash effects.
- High-contrast and non-colour structural/flood/fire overlays.
- Captioning for bells, horns, shouted orders, creature calls and critical environmental cues.
- Timing assistance for parry/boarding/repair interactions where applicable.
- Aim assistance and optional lock-on compatible with naval/boarding weapons.
- Extended/unlimited breath and reduced current force options.
- One-hand/low-input profiles for common vessel and aquatic actions.

Accessibility settings do not falsify authoritative world state. For example, reduced visual wave motion can change presentation while the physical vessel still responds to the real wave field.

# 18. Split-Screen and Shared-Screen UX

Split-screen is a foundation requirement, not a later UI reskin. Each local player owns a separate HUD root, focus stack, map/menus and control context while sharing one authoritative world connection.

The UI must prevent one local player's full-screen port or inventory panel from stealing another player's gameplay input. Pausing behaviour is a world setting: local menu open does not necessarily pause shared play. Critical world alerts route to every affected local player but may be summarised differently according to role.

On one vessel, local players may operate different stations. Helm, weapons and engineering panels display the local player's authority and current station ownership. Shared tactical maps must support per-player cursors/selection without mixing command ownership.

# 19. Multiplayer Identity and Authority Model

The same command validation rules apply in solo and multiplayer. Solo uses a local authority host. LAN and online use a host/listen or dedicated authoritative server. Clients do not own persistent vessel, cargo, port, quest or world state simply because they render it.

| State | Authority | Client Prediction Allowed? |
| --- | --- | --- |
| Character ordinary movement | Server/host authoritative | Yes, bounded reconciliation. |
| Swimming/diving movement | Server/host authoritative | Yes, with environment sampling reconciliation. |
| Vessel helm input | Server validates station authority; vessel sim authoritative. | Input/visual prediction, not persistent transform ownership. |
| Vessel voxel edits | Server/host only after validated edit transaction. | Preview only. |
| Commissioning/refit | Server/host transaction. | No speculative commit. |
| Cargo/inventory | Server/host transaction. | UI optimistic animation only after reservation token where supported. |
| Combat damage | Server/host. | Cosmetic prediction; result reconciles. |
| Flooding/fire | Server/host. | Local presentation interpolation. |
| Port/market/contract | Server/host. | Read caching; no client-owned mutation. |
| Quest/event resolution | Server/host/world authority. | Client objectives can preview but not complete independently. |

# 20. Command Validation, Permissions and Ownership

Every consequential command validates actor identity, target identity, authority scope, ownership/permission, current lifecycle state, required resource reservation, environmental condition and concurrency lock.

Examples:

- A player may steer only if they hold the helm authority or possess an authorised override.
- A shipwright may edit a commissioned vessel only in an allowed work state and within their build permission.
- A cargo transfer must reconcile source, destination, quantity, custody and reservation.
- A boarding capture cannot change vessel ownership until surrender/capture conditions and persistence postconditions succeed.
- A port service cannot spend a settlement's resources without an authorised service transaction.

Permissions should be inspectable before the player attempts a long workflow. The UI can warn that a berth is customs-restricted or a fleet order requires command rank rather than waiting for an unexplained failure at the final click.

# 21. Replication, Relevance and Network Interest Management

Networking is interest-managed. A player near one vessel does not need per-tick replication for every distant fleet, market or fish cohort.

Replication scopes include player-local, vessel-local, encounter-local, port-local, regional-summary and world-event. Stable IDs allow clients to retain summary knowledge without retaining every actor.

High-frequency channels are reserved for movement/control/combat state that affects current interaction. Medium-frequency channels include nearby compartment flooding, fire, machinery and crew station state. Low-frequency channels include cargo summaries, market updates, ecology trends and distant voyages.

A definition hash/content-manifest handshake occurs before joining a multiplayer world. Incompatible required packs block join. Missing optional packs follow 25D quarantine/compatibility rules rather than allowing unknown active definitions to be silently discarded.

# 22. Vessel-Local Coordinates and Moving Interior Architecture

A commissioned vessel owns a stable local frame. Voxel coordinates, compartments, stations, cargo anchors and internal navigation are stored in vessel-local space. The vessel root maps local space into world space for rendering, collision and interaction.

Characters standing on or inside a vessel track a current movement frame. Their local motion is resolved relative to that frame while the frame itself moves through world space. This avoids applying the ship's full translation to every child as an independent authoritative object.

The system distinguishes:

- **Attached:** character/object intentionally bound to the vessel frame for movement reference.
- **Supported:** physically on a moving surface but free to detach/jump/fall.
- **Constrained:** rope, seat, station or boarding-link constraint.
- **World Free:** projectile/debris/person no longer following vessel frame.

Transitions are explicit so network reconciliation does not randomly teleport players during boarding or man-overboard events.

# 23. Character, Projectile and Boarding Reconciliation

Character prediction on moving vessels uses frame-relative input and authoritative frame transforms. Reconciliation compares local position/orientation where possible, preventing tiny ship-world transform differences from appearing as large character corrections.

Projectiles are normally world-space after launch, but muzzle calculation uses vessel-local launch state at the authoritative fire time. Short-lived effects may interpolate from predicted muzzle location while damage uses authoritative trajectory/result.

Boarding links create temporary cross-vessel constraints or traversable connectors. They do not merge the two vessel grids. Each vessel keeps its own frame, identity and structural simulation. Crossing characters switch movement frame at a validated threshold.

# 24. Helm, Stations, Orders, Locks and Handover

Interactive stations use explicit leases/locks to avoid two actors issuing contradictory continuous controls. A lease records station, holder, authority scope, start time and disconnect timeout.

Helm handover should be smooth: the current holder can release, an authorised actor can accept, and emergency override can apply under configured command rules. Weapon and engineering stations use the same concept where simultaneous operation would be contradictory.

Crew orders are durable intents, not per-frame network commands. `Maintain pumps`, `prepare sails`, `repair priority compartment A`, `hold fire` and `evacuate deck` are recorded as bounded orders that NPC systems execute according to capability and access.

# 25. Multiplayer Cargo, Construction, Combat and Economy Transactions

High-value maritime actions use reservations and atomic commits. A transaction has a unique ID, initiator, sources, destinations, expected preconditions, reserved quantities, outcome and audit result.

Construction/refit reserves materials and work state before committing voxel changes. Cargo transfer reserves exact stacks/lots. Market sale transfers goods and payment in one transaction. Prize capture transfers ownership only after cargo/crew/vessel custody postconditions are satisfied. Repair spends materials only when the repair action actually commits.

This architecture is mandatory for both multiplayer correctness and save recovery.

# 26. Reconnect, Host Migration Boundaries and Failure Recovery

Reconnect restores players from authoritative records rather than trusting client snapshots. Station leases expire or transfer according to timeout and safety policy. An unattended helm may fall back to neutral control, NPC delegation or safe-assist behaviour defined by vessel/crew state.

Listen-server host migration is not assumed for the first production slice. The architecture preserves stable IDs and serialisable state so it can be evaluated later, but first-release reliability should prioritise clean save-and-rehost recovery over an under-tested live authority transfer.

Dedicated-server support is an architectural target; shipping it is a production classification decision. Solo, LAN and listen-server co-op must not require a separate gameplay code path.

# 27. Persistence and Save Architecture

Maritime persistence extends seed-plus-delta worlds. Generated oceans, bathymetry, base climate fields, ordinary structure candidates and unvisited ecology are derivable from seed/version. Player edits, commissioned vessels, port changes, cargo, named crews, damage, catches, contracts, quests and world history are saved as deltas/instances.

Definitions remain external validated content. Save records reference stable qualified IDs and store only mutable state needed to reconstruct the instance. When a referenced definition is missing, migration or quarantine decides recovery; the game does not silently replace it with an unrelated item or component.

# 28. Maritime Save Records and World Manifest Extensions

Recommended persistent record families:

| Record | Persistent Core Fields |
| --- | --- |
| WaterBodyDelta | Water Body ID, local edits, contamination, constructed boundaries, version. |
| VesselInstance | Vessel ID, blueprint provenance, local voxel deltas, component states, transform, ownership, history. |
| CompartmentState | Stable compartment lineage, flooding summary, air state, temperature/hazard state. |
| VesselCargo | Storage references, cargo lots, reservations, custody and condition. |
| CrewAssignment | Character/cohort ID, vessel/port assignment, role, watch/order, condition and obligations. |
| PortInstance | Settlement/port ID, service state, berth state, works, damage, queues and permissions. |
| FleetRecord | Fleet ID, vessel members, mission, route, command, readiness and history. |
| VoyageRecord | Route, departure, progress summary, environment exposure, events and expected arrival band. |
| EcologyRegion | Habitat/cohort summaries, disturbance, harvest, migrations and research state. |
| MaritimeSiteState | Site ID, discovery, occupation, loot/salvage, damage, restoration and event state. |
| MaritimeQuestEvent | Stable quest/event state, bound subjects, contributions, consequences and history. |

World manifest extensions record Set 26 schema versions, enabled packs, generator versions, migration chain, semantic hashes and quarantined records.

# 29. Save Journaling, Atomic Transactions and Recovery

Consequential maritime transactions write intent/reservation before commit when interruption could duplicate or destroy resources. Save snapshots are atomic with final/previous/backup candidates according to the broader save architecture.

Recovery priorities:

1. Prefer a valid final save with matching integrity metadata.
2. Fall back to previous/backup in deterministic order.
3. Replay or roll back incomplete journalled transactions according to postconditions.
4. Quarantine records that cannot be safely migrated.
5. Preserve a human-readable recovery report.

A crash during vessel commissioning must never leave the same voxels both in the terrain structure and the new Vessel Instance. A crash during cargo transfer must never leave both inventories credited.

# 30. Migration, Optional Packs, Quarantine and Removal Behaviour

Set 26 is the first major expansion case for Set 25's pack architecture. Removing or disabling the maritime pack is safe only when no active world state requires expansion-owned definitions, or when an approved downgrade/quarantine path exists.

Migration rules:

- Never regenerate existing visited terrain merely because worldgen gained maritime detail.
- Preserve legacy water/shore state unless a migration explicitly targets it and has rollback evidence.
- Existing player structures near water remain protected from automatic port/coast placement.
- Vessel blueprints may evolve; existing Vessel Instances retain instance state and provenance rather than silently rebaking to a new blueprint revision.
- Definition renames use aliases/tombstones, not string replacement across saves.
- Missing optional definitions quarantine dependent instances with explanatory state rather than deleting them.
- Every migration is backup-first, versioned, deterministic and dry-run capable.

# 31. Simulation LOD and Promotion/Demotion

The simulation uses explicit detail bands:

| Band | Typical Context | Representation |
| --- | --- | --- |
| LOD 0 - Interactive | Players aboard/near vessel, active combat, diving site. | Full collision, detailed actors, local fluid/compartments, immediate controls. |
| LOD 1 - Local Reduced | Nearby visible vessels/port areas not directly interacted with. | Reduced actor ticks, sampled movement, bounded machinery/crew. |
| LOD 2 - Regional | Known vessels/fleets/ports within active region. | Route, service, cargo, crew and condition summaries. |
| LOD 3 - Distant | Remote regions. | Scheduled summary ticks/events only. |
| Dormant | No meaningful active state. | Derivable definitions plus persistent deltas; no routine tick. |

Promotion/demotion is transactional. Before demotion, detailed state is reduced into a summary with invariants. Before promotion, the summary is expanded deterministically, then validators confirm resource, crew and condition consistency.

# 32. Distant Vessels, Fleets, Ports, Markets and Voyages

Distant voyage simulation advances on coarse scheduled ticks based on route segments, vessel capability, weather summary, crew readiness, provisions and event risk. It does not integrate rigid-body motion frame by frame.

Distant ports process bounded service queues and economic updates from actual stock/capacity summaries. Markets are not globally recalculated every frame. Fleet missions advance through route/mission states with encounters promoted to detailed simulation only when a player enters relevance or when a major authored outcome requires it.

Ordinary background voyages may resolve with probabilistic but deterministic-from-record risk evaluation. Named or player-owned vessels preserve stronger evidence and event logs.

# 33. Distant Ecology, Fisheries, Quests and Events

Marine ecology uses cohort and habitat records. Ordinary organisms are not persistent individual actors until promoted by proximity, taming, quest relevance, injury, exceptional age/quality or other notable state.

Fisheries reserve harvest against authoritative cohorts. Distant fishing fleets create catch lots through the same conservation rule rather than spawning arbitrary inventory.

Quests/events may continue at distance where their contract allows. Critical player commitments, boss encounters or irreversible outcomes can require promotion or explicit consent/warning instead of resolving invisibly.

# 34. Godot/Summer Engine Architecture

Godot owns runtime and editor execution. Recommended architecture is data-oriented and service-led. Scene trees host currently loaded presentation and interaction; they do not become the database.

GDScript is the default. Native extensions are considered only for measured hotspots such as voxel meshing, large graph rebuilds or specialised numeric kernels after profiling shows a meaningful benefit. Premature native code is not a production goal.

Summer Engine is used to inspect, plan, implement, test and document bounded tasks under Set 25 task contracts. Generated or AI-assisted changes require human review, deterministic tests and source-of-truth references. No Summer Engine agent or remote model is required by the shipped game.

# 35. Core Services, Records, Commands and Events

Recommended service boundaries:

| Service | Owns | Does Not Own |
| --- | --- | --- |
| MaritimeRegistryService | Validated Set 26 definitions/facets and dependency lookup. | Runtime mutable state. |
| FluidSimulationService | Bounded local fluid cells, containment queries, transfers. | Ocean geography or vessel movement. |
| MarineFieldService | Wind/current/tide/wave/storm regional fields. | Local fluid conservation. |
| AquaticInteractionService | Character-water state queries/actions. | Character core stats or global combat. |
| VesselService | Vessel Instance lifecycle, local grid, structural graph and identity. | Movement integration details. |
| VesselMovementService | Buoyancy/stability/propulsion/steering integration. | Hull definition truth. |
| ShipwrightService | Construction/refit/repair/salvage project operations. | Blueprint source authoring. |
| VesselForgeService | Editor/authoring data, bake/validation workflow. | Persistent world instances. |
| PortService | Port capability/service resolution and berth state. | Settlement-wide non-maritime ownership. |
| CrewService | Maritime assignments, stations, watches, orders. | Core NPC identity. |
| CargoContractService | Cargo lots, custody, contracts and transactional transfer. | General item definition ownership. |
| VoyageFleetService | Routes, fleets, distant voyage/mission summaries. | Tactical combat. |
| NavalEncounterService | Encounter state, ship combat/boarding coordination. | Core character combat rules. |
| MarineEcologyService | Habitat/cohort/fishery state and promotion. | Creature definition registry. |
| MaritimeQuestEventAdapter | Bind maritime subjects into shared quest/event system. | Quest engine ownership. |
| MaritimeSaveAdapter | Serialise/restore maritime records and migrations. | Global save orchestration. |

# 36. Water, Marine Field and World-Generation Runtime

The large ocean is not an active voxel-water simulation. 26C produces Water Bodies, bathymetry and terrain. 26D produces regional environmental fields. 26B activates bounded local fluid where edits, containment, pumps, flooding or local interactions require it.

A loaded area queries the Water Body for reference level and properties, the Marine Field for wind/current/tide/wave conditions and any local Fluid Island for conserved deviations. Presentation samples these authoritative layers to render waves, foam, transparency, particles and audio.

Worldgen jobs remain deterministic and chunk/region bounded. Port, island and underwater-site placement uses relational constraints and protection masks. It never depends on a fixed POC coastline.

# 37. Vessel, Movement, Compartment and Shipwright Runtime

A Vessel Instance uses one scene root plus compact voxel/chunk data, merged rendering/collision products, component instances only where behaviour requires them, and derived structural/compartment graphs.

Edits mark dirty regions. Mesh, collision, graph, mass and compartment summaries rebuild incrementally. No full vessel rescan occurs for every placed voxel unless a development validator explicitly requests it.

Movement samples a bounded set of buoyancy/water interaction points or hull patches derived from vessel geometry. It does not apply force to every block. Compartment flooding uses 26B's detailed/summary hybrid according to relevance.

Shipwright projects modify vessels through validated work packages. Moving-state restrictions are enforced by VesselService/ShipwrightService rather than UI-only convention.

# 38. Port, Crew, Fleet, Economy and Combat Runtime

Ports resolve service capabilities from existing settlement structures, jobs, stock, access, networks and environment. CrewService maps persistent NPC identities/cohorts onto vessel/port roles. VoyageFleetService owns distant strategic movement. NavalEncounterService is created when an encounter requires tactical resolution.

Economy transactions operate on cargo lots and inventories using shared item/resource systems. Market updates consume real supply/demand records and known-route effects. Regional power is a derived profile; it is not an independent resource that can drift away from fleets, ports and relationships.

# 39. Ecology, Site, Boss, Quest and Event Runtime

Ecology records are spatially keyed to habitat/region identities. Representative creature Nodes spawn only for relevant populations. Notable creatures receive persistent IDs. Boss territories use encounter/event state and may own more detailed persistent records.

Submerged sites remain ordinary structure/site instances with maritime hazard/capability extensions. Quest/event bindings reference site IDs, vessel IDs, cohorts, ports, contracts or NPCs through stable relationships.

# 40. UI View-Model and Presentation Adapter Architecture

UI is read-only with respect to authoritative state. It requests commands and receives view-model updates/events. This keeps split-screen, multiplayer and testing sane.

Presentation adapters convert events into animation, audio, VFX, haptics, captions and camera response. They may be suppressed or simplified by accessibility/performance settings without suppressing the underlying event.

Examples:

- `VesselBreachCreated` -> hull hit VFX, alarm, compartment overlay update, caption.
- `PortServiceBlocked` -> port panel reason, world marker, optional notification.
- `StormWarningUpdated` -> map cone, sky/audio escalation, route planner confidence change.
- `CrewOrderFailed` -> station status, reason code, optional task suggestion.

# 41. Forge, Baking, Import and Runtime Product Boundaries

Forge sources remain editable authoring truth. Runtime products are derived and can be rebuilt. Vessel Forge adds maritime semantic layers, but runtime does not load editor-only graph/UI data that it does not need.

Bake products may include compressed voxel volumes, merged mesh descriptors, collision products, semantic marker tables, compartment seeds, attachment maps, thumbnail/icon products and validation hashes. Each product records source revision and toolchain version.

Imported player packages are data-only within a restricted schema. They cannot contain arbitrary scripts, executables or unvalidated runtime code.

# 42. Threading, Scheduling, Determinism and Work Queues

Heavy work is scheduled and bounded. Candidate asynchronous work includes voxel meshing, navigation baking, procedural vessel variants, distant route batches, ecology summaries and some validation. Authoritative commits return to the main simulation boundary in deterministic order.

Fluid updates, graph rebuilds and regional simulations use explicit work budgets and backlogs. A frame spike is not accepted as the price of correctness when the work can be split across frames without changing authoritative order.

Randomness affecting persistence uses named deterministic streams derived from world seed plus stable subject/event IDs and version. Presentation-only randomness may be non-authoritative.

# 43. Performance Philosophy and Measurement Method

Performance budgets are evidence gates, not aspirational prose. Every budget must be measured in packaged builds on representative hardware classes and scenarios.

The first target remains Windows PC, while controller, memory, split-screen and future handheld/console constraints are considered. A production baseline profile should include a lower-bound supported machine, representative target machine and development high-end machine.

Measurements include frame time percentiles, hitch duration, memory, GPU timing, physics step, simulation backlog, network bandwidth, save duration/size and load/promotion latency. Average FPS alone is insufficient.

# 44. Provisional Vessel and Simulation Budgets

These values are **prototype targets**, not final gameplay limits. They create measurable spikes and redesign triggers.

| Budget | Foundation Target | Notes |
| --- | ---: | --- |
| Small vessel local voxels | <= 2,500 | Rafts, boats, small work craft. |
| Medium vessel local voxels | <= 12,000 | Typical player sailing/trade vessel. |
| Large vessel local voxels | <= 35,000 | Multi-deck ship; requires reduced rebuild scope. |
| Exceptional prototype vessel | <= 60,000 | Stress test only; not guaranteed first-release support. |
| Full-detail moving vessels near one player group | 4 target / 8 stress | Detail depends on combat and interiors. |
| Reduced nearby vessels | 16 target / 32 stress | Lower actor/graph/presentation cadence. |
| Distant fleet/voyage records | Thousands world-wide | Scheduled summaries, not Nodes. |
| Detailed compartments per active vessel | 64 target / 128 stress | Merge trivial spaces where safe. |
| Incremental vessel edit commit | < 50 ms main-thread target | Larger rebuild work split/async. |
| Helm input-to-visible response | < 100 ms local target | Network authority may add latency; prediction smooths. |

Technical vessel bands do not become mandatory gameplay classes. A vessel may exceed a band only if measured behaviour and classification permit it.

# 45. Rendering, Ocean, Underwater and Streaming Budgets

Ocean presentation must decouple visual richness from simulation truth. Large surfaces use scalable shaders/meshes; local foam, spray and interaction effects are bounded around cameras and important vessels.

Underwater rendering budgets focus on visibility range, volumetrics, caustics, particles, creature density and shadowed lights. Accessibility can reduce distortion independently of gameplay.

Streaming rules prioritise collision/navigation/world state required for imminent player interaction before distant decorative presentation. A vessel entering a port must not collide with an unloaded authoritative quay while the decorative lighthouse loads first.

Provisional targets:

- No unbounded per-wave object spawning.
- VFX emitter counts scale with distance/performance profile.
- Vessel interiors use occlusion/visibility grouping where practical.
- Distant ports use proxy structures and service summaries.
- Underwater creature crowds use instancing/cohorts rather than full AI actors.
- Chunk/region streaming must preserve vessel-local grids independent of terrain chunk unload.

# 46. Network, Save, Memory and UI Budgets

Provisional first-pass targets:

| Area | Target / Rule |
| --- | --- |
| Network replication | Interest-managed; no world-wide high-frequency vessel updates. |
| Local co-op vessel transform | 10-20 Hz authoritative snapshots with interpolation/prediction, prototype range. |
| High-frequency combat channels | Only encounter-relevant actors/components. |
| Distant summaries | Event/state updates, not tick replication. |
| Save operation | Incremental/atomic; avoid serialising derivable ocean cells. |
| Save size | Vessel grids compressed/palette-based; ecology/fleet summary records compact. |
| Memory | Loaded vessel/port products bounded by streaming tier; derived caches evictable. |
| UI | View models update on state changes/cadence, not every frame for unchanged lists. |
| Split-screen | Performance profile may reduce decorative density, never authoritative simulation outcome. |

Exact bandwidth and memory MB targets require repository and hardware profiling before release freeze.

# 47. Diagnostics, Profiling and Maritime Readiness Dashboard

The Maritime Readiness Dashboard is an internal development tool that aggregates production evidence without becoming runtime authority. It reads validators, manifests, test results, package state and profiling reports.

Recommended dashboard groups:

- Registry completeness and unresolved references.
- Set 25 pack/dependency/migration status.
- Vessel blueprint/commissioning validation coverage.
- Water/field/worldgen seed QA.
- Port service and crew capability coverage.
- Route/fleet/market/economy conservation checks.
- Ecology habitat/harvest/creature completeness.
- Quest/event bound-subject validity.
- Multiplayer authority conflicts and station-lock failures.
- Save/migration/quarantine fixture results.
- Performance budget pass/fail by scenario/hardware class.
- Accessibility/manual QA status.
- Main-document amendment completion and source-of-truth audit.

The dashboard must link to evidence rather than display a manually entered green tick with no supporting artifact.

# 48. QA Architecture and Evidence Bundles

QA uses layered evidence:

| Layer | Purpose | Examples |
| --- | --- | --- |
| Schema/Static | Reject invalid data early. | ID/reference/schema/fallback-cycle validators. |
| Unit | Verify deterministic services. | Cargo conservation, route cost, compartment lineage. |
| Integration | Verify cross-system contracts. | Pump drains flooded vessel while inventory/power reconcile. |
| Scenario | Prove player-facing flows. | Build boat -> launch -> sail -> dock -> save/load. |
| Seed Corpus | Verify procedural reachability and variety. | Coast/port/site/fishery coverage across seeds. |
| Migration | Verify old worlds and pack changes. | vN -> vN+1 dry-run, backup, rollback. |
| Multiplayer | Verify authority and reconnect. | Two players helm/transfer/board under latency. |
| Performance | Verify packaged budgets. | Fleet battle, storm port, underwater site, large vessel. |
| Accessibility | Verify critical actions with assists. | One-hand helm, captions, high contrast, reduced motion. |
| Manual Feel | Verify clarity, pacing and physical feel. | Steering, waves, swimming, combat, alarms. |

Evidence bundles include build/content identity, scenario, hardware/profile, seed, commands, result, logs, captures and known deviations.

# 49. Automated Validation and Deterministic Fixtures

Required automated suites include:

- Registry qualified-ID uniqueness, reverse references and schema compatibility.
- Pack dependency/load/remove/quarantine fixtures.
- Seed reachability for water, coasts, ports and progression providers.
- Fluid conservation around pumps, containers, flooding and breaches.
- Vessel commissioning graph/compartment/access fixtures.
- Mass/displacement/stability invariant fixtures.
- Construction/refit/salvage transaction conservation.
- Cargo transfer, market and contract custody invariants.
- Fleet/voyage distant-to-near reconciliation.
- Ecology cohort harvest/recruitment and promotion reconciliation.
- Naval damage -> breach -> flooding -> repair persistence.
- Quest/event subject survival, replacement and failure handling.
- Save interruption and transaction-journal replay/rollback.
- Multiplayer command ownership and station lease tests.
- Presentation reason-code coverage for critical failures.

# 50. Manual, Feel, Accessibility and Visual Acceptance

Automated tests cannot determine whether sailing feels responsive, whether wave motion causes nausea, whether a flooding overlay is understandable or whether boarding camera behaviour is disorienting.

Manual acceptance must cover:

- Entering/exiting water from varied shores and vessels.
- Swimming and surf readability at different assistance settings.
- Helm feel for small, medium and heavy vessels.
- Visual connection between wind/sails/propulsion and vessel response.
- Docking, mooring, boarding and man-overboard recovery.
- Compartment damage/flooding/fire comprehension under stress.
- Port service discovery and blocker explanations.
- Fishing/catch handling and ecological feedback.
- Underwater navigation and low-visibility comfort.
- Combat telegraphs, alarms, surrender and capture flow.
- Text scaling, captions, non-colour overlays, reduced motion and simplified controls.
- Split-screen menu/focus behaviour and critical alert routing.

# 51. Multiplayer, Soak, Recovery and Migration Testing

Multiplayer tests run under simulated latency, jitter, packet loss and reconnect. Important cases include two clients attempting the same cargo transfer, competing helm claims, simultaneous vessel edits, boarding between moving frames, player disconnect while holding a station, and server interruption during capture or commissioning.

Long-session soak should include multiple ports, active routes, changing weather, background ecology and repeated save/load cycles. Memory/cache growth is monitored. A world should not accumulate one persistent object for every ordinary fish or transient wave interaction.

Migration testing uses archived fixtures from earlier save versions and representative Set 25 Core worlds. Set 26 installation into an existing world must not rewrite visited terrain or overwrite protected structures.

# 52. Prototype Laboratories and Technical Spikes

Before full content production, implement bounded laboratories:

| Lab | Purpose | Acceptance Evidence |
| --- | --- | --- |
| LAB-26O-01 Fluid/Flood | Breach, compartment fill, pump, seal, save/load. | Conservation, frame budget, recovery. |
| LAB-26O-02 Moving Interior | Walk/jump/swim on moving vessel under waves. | Stable local frame, no major jitter/teleport. |
| LAB-26O-03 Commissioned Boat | Freeform vessel scan -> commission -> sail. | IDs, local grid, incremental rebuild, save. |
| LAB-26O-04 Dock/Port | Approach, berth, cargo, service, depart. | Authority, UI blockers, transactions. |
| LAB-26O-05 Two-Player Vessel | Helm + engineering under network latency. | Station locks, prediction, reconnect. |
| LAB-26O-06 Boarding | Two moving vessels linked and crossed. | Frame handoff, combat authority, detach safety. |
| LAB-26O-07 Distant Voyage | Simulate remote voyage then promote nearby. | Cargo/crew/condition/history reconcile. |
| LAB-26O-08 Ecology/Fishery | Cohort -> fishing -> cargo -> market. | No duplication, population impact, promotion. |
| LAB-26O-09 Storm Port | Multiple vessels, waves, services, alarms. | CPU/GPU/network budgets and readable UI. |
| LAB-26O-10 Migration | Add/remove/update maritime pack on fixture worlds. | Backup, quarantine, rollback, no silent loss. |
| LAB-26O-11 Large Vessel Stress | 35k-60k voxel prototype with edits/damage. | Rebuild and render redesign evidence. |
| LAB-26O-12 Split-Screen | Two local players aboard/dive/port. | Focus, HUD, performance, accessibility. |

# 53. Foundation Vertical Slice and Production Classification Recommendation

Set 26 should not attempt fleets, navies, dozens of vessel families and every marine biome before proving the shared architecture. The recommended first production slice is a **Maritime Foundation Vertical Slice**, classified through Set 25 rather than automatically treated as Core.

Recommended slice:

- One seed-generated coastal region with normal worldgen variety, not a fixed tutorial coast.
- Surface water, bounded local fluid and basic flooding.
- Swimming/diving baseline with accessibility assists.
- One freeform small sailing/rowing vessel workflow from build to commissioning.
- Buoyancy, steering, sail or simple mechanical propulsion and anchoring/mooring.
- One functional port/harbour service cluster with berth, cargo/provision and repair.
- Small crew role/delegation proof.
- One cargo contract/voyage and one basic fishing/ecology loop.
- One storm/weather route decision.
- One rescue/man-overboard scenario.
- One limited naval threat or creature-vessel encounter sufficient to prove damage/flooding/repair, not full war simulation.
- Save/load, distant voyage summary, multiplayer two-player vessel and accessibility acceptance.

Full strategic fleet warfare, large capital ships, realm vessels, extensive piracy/navy rosters and multiple boss chains remain later production packages until the foundation passes evidence gates.

# 54. Main-Document Amendment Matrix - Documents 00-09

| Document | Required Amendment | Severity / Outcome |
| --- | --- | --- |
| 00 - Master Game Design Bible | Add oceans as navigable living regions; vessel-building fantasy; maritime civilisation, trade, ecology, underwater exploration and naval conflict as connected expressions of existing pillars. Remove any implication that water is primarily boundary/decoration. | Revision pack. |
| 01 - Core Gameplay Loop | Add sail/dive/fish/trade/rescue/repair/voyage loops and maritime expansion of explore-gather-build-interact-automate-defend-expand. Maintain seed-adaptive starts. | Revision pack. |
| 02 - Player Progression | Add aquatic survival, diving, shipwright, sailing/navigation, fishing/ecology, maritime trade, crew leadership and naval/damage-control capability paths. Preserve classless mastery. | Major revision pack consuming 26E/26N. |
| 03 - Blocks Registry | Add maritime material/suitability facets, vessel structural roles, hull/closure components, docks/port/shipyard pieces, pumps, navigation and marine infrastructure. Core blocks retain IDs. | Complete replacement already required by Set 25; include Set 26 extensions. |
| 04 - Items Registry | Add shipwright tools, navigation instruments, diving gear, vessel components/items, cargo/catch/salvage forms, fishing gear, naval supplies and maritime knowledge items. | Complete replacement under Set 25 plus maritime families. |
| 05 - Crafting/Recipe Registry | Add vessel construction/refit/repair, shipyard projects, fishing/processing, preservation, maritime magic/automation and naval supply chains. | Complete replacement under Set 25 plus maritime chains. |
| 06 - Resource Progression | Add marine biological resources, salvage/provenance, maritime fuels/material roles, coastal resources and long-term shipbuilding/repair demand. | Revision/replacement input to Set 25 resource matrix. |
| 07 - NPC Village System | Add maritime professions, crews, port assignments, rescue, shipbuilding labour, vessel travel and coastal settlement interactions. Named identity remains separate from cohort representation. | Major revision pack. |
| 08 - Automation System | Add pumps, winches, cranes, vessel networks, port logistics, cargo handling, preservation and bounded maritime automation. Preserve physical transactions and manual fallback. | Major revision pack. |
| 09 - Magic System | Add maritime applications for breathing, pressure, navigation, weather sensing, propulsion, pumps, wards, preservation, rescue and realm travel. No separate maritime magic school required by default. | Revision pack. |

# 55. Main-Document Amendment Matrix - Documents 10-18

| Document | Required Amendment | Severity / Outcome |
| --- | --- | --- |
| 10 - Creatures and Monsters | Add aquatic locomotion, marine habitats, schooling/cohorts, fishing pressure, vessel interaction, migrations, marine bosses and non-lethal resolutions. | Major revision consuming 24/26M. |
| 11 - Biomes and World Generation | Replace bounded/simple water assumptions with Water Bodies, oceans, coasts, islands, bathymetry, marine regions, currents/tides/weather relationships and maritime site placement. | Complete replacement/major rewrite. |
| 12 - Structures | Add ports, harbours, wrecks, marine dungeons, lighthouses, docks, shipyards, coastal defence and persistent submerged structures. Vessel Instances remain separate mobile structures. | Major revision. |
| 13 - Races, Peoples, Cultures and Factions | Add maritime cultural practices, fleets, law, trade, ports, shipbuilding traditions and navigation without tying morality/profession to ancestry. | Revision pack. |
| 14 - Dimensions | Add water/pressure/hazard adaptations, realm maritime routes, portals, realm vessels where approved and cross-realm maritime logistics. | Revision pack; advanced vessels can remain later tier. |
| 15 - Quest and Event System | Add voyages, rescue, shipbuilding, port crises, fishing/ecology, storms, piracy/naval, trade, wreck and marine boss objective/event modules. | Major revision. |
| 16 - Combat, Gear and Defence | Add underwater modifiers, vessel weapons, boarding, ship damage, flooding/fire, damage control, coastal siege and capture/surrender integration. | Major revision consuming 26E/26L. |
| 17 - UI/UX System | Add aquatic, helm, vessel, port, cargo, fleet, combat, ecology and maritime accessibility patterns defined by 26O. | Complete maritime revision pack. |
| 18 - Technical Implementation Plan | Replace Unreal/POC architecture with project-wide Godot/Summer Engine production architecture. Incorporate Set 25 registry/packs/validation plus 26O services, moving frames, water, vessel grids, LOD, networking, saves, profiling and QA. | **Complete replacement required.** |

The rewritten Document 18 must be based on a read-only audit of the actual Godot/Summer Engine repository. 26O defines required architecture; it does not invent exact project paths before inspection.

# 56. Main-Document Amendment Matrix - Documents 19-25

| Document / Set | Required Amendment | Severity / Outcome |
| --- | --- | --- |
| 19 - Settlement Growth / Player Blueprints | Add vessel blueprint/player workshop links, waterfront planning, docks/ports, shipyard projects and water-site validation. Keep 26I as vessel authoring specialist. | Major revision pack. |
| 20 - Buildings/Facilities/Projects | Add universal port, harbour, shipyard, lighthouse, fishery, rescue, customs and maritime service functions while preserving seven needs and real activation contracts. | Major revision pack / companion maritime catalogue. |
| Set 21 - Voxel Asset Forge | Add maritime block/component material-role, preview and vessel-asset requirements where not already generic. Avoid a second Forge kernel. | Targeted revision. |
| Set 22 - Unified Forge | Integrate Vessel Forge workspace, maritime semantic markers, validators and procedural vessel family tools from 26I. | Major extension. |
| Set 23 - Presentation Forge | Add vessel/water/marine event sockets, audio/VFX manifests, wave/weather/underwater presentation and accessibility cues. | Major extension. |
| Set 24 - World Content Atlas | Preserve 24C/24F-24H canon; add only approved integration cross-references or future content revisions. Set 26 must not silently rewrite Atlas lore. | Controlled cross-reference revision. |
| 25A | Final closure revision noting Set 26 sufficient lock, admitted/deferred packages and remaining debt. | Required for Set 25 closure. |
| 25B | Register approved namespace/aliases and extension-facet ownership if not already represented generically. | Controlled amendment. |
| 25C | Admit maritime schemas, relationships, capabilities, suitability/fallback rules. | Controlled amendment. |
| 25D | Register maritime content pack manifests, dependencies, removal/quarantine and migrations. | Controlled amendment. |
| 25E | Add maritime seed QA, LOD, network, save, performance and release-gate suites. | Controlled amendment. |
| 25F | Classify Maritime Foundation Vertical Slice and later packages by evidence; do not mark entire Set 26 Core. | Controlled amendment. |
| 25G | Add maritime package dependency/progression matrix. | Controlled amendment. |
| 25H-25J | Extend block/item/resource/recipe catalogues with admitted maritime families/chains. | Controlled catalogue revision. |
| 25K | Add maritime vessel/water/port/creature/presentation asset budgets and manifest requirements. | Controlled amendment. |
| 25L | Add bounded Summer Engine maritime work packages and final source-of-truth audit; clear Set 26 integration blocker when evidence is sufficient. | Required final closure revision. |

# 57. Set 25 Integration Closure and Namespace Admission

Set 25 can close its Set 26 integration blocker when the following are true:

1. Set 26A-26O are approved as the specialist source set.
2. Expansion-only namespace strategy is approved and registered.
3. Maritime schema extensions and relationships are admitted through 25C.
4. Pack manifests and optional/removal behaviour are recorded through 25D.
5. Seed, progression, conservation, migration, LOD, multiplayer and performance validators are represented in 25E.
6. The Foundation Vertical Slice and later maritime packages have explicit production classification through 25F/25G.
7. Selected block/item/resource/recipe families are linked to 25H-25J rather than living only in prose.
8. Asset/presentation requirements are represented in 25K.
9. 25L contains bounded implementation tasks and no unresolved source-of-truth conflict.
10. Main-document amendments from Sections 54-56 are tracked as completed, planned or explicitly deferred.

Recommended namespace freeze:

- Existing reusable system concepts: existing `leyforge.core` / `leyforge.system` owners.
- Expansion-only content definitions: `leyforge.expansion.maritime`.
- Save instance IDs: runtime ULID/UUID-style identities independent of content namespace.

Ash approval remains required before declaring the namespace final.

# 58. Production Rollout and Summer Engine Work Lanes

Implementation proceeds by dependency lane rather than by trying to code all 15 Set 26 documents at once.

| Lane | First Work | Later Work |
| --- | --- | --- |
| DOC | Read-only repository audit; rewrite Document 18; amendment trackers. | Close 00-25 revisions and source-of-truth audit. |
| REG | Maritime schemas/facets, qualified IDs, pack fixture. | Full selected catalogues and migration aliases. |
| WTR | Water Bodies, local fluid, environment queries. | Advanced reactions/engineering only after proof. |
| WLD | Ocean/coast/bathymetry/streaming. | Full marine region breadth. |
| CHR | Swimming/diving/rescue. | Advanced equipment/realm adaptations. |
| VSL | Vessel local grid, commissioning, movement. | Large vessel optimisation and advanced propulsion. |
| SHP | Shipwright projects and Vessel Forge. | Procedural families/refit tooling breadth. |
| CIV | Port services, crews, cargo, voyage. | Fleet economy/navies/regional power. |
| CBT | Damage/flood/fire/boarding. | Fleet/siege breadth. |
| ECO | Habitat/cohort/fishing/site proof. | Broad ecology/boss roster. |
| UI | Core maritime view models/HUD/accessibility. | Advanced fleet/market/editor views. |
| NET | Two-player moving vessel and transactions. | Dedicated-server hardening/PvP breadth. |
| SAVE | Maritime records/journal/migration. | Pack removal and long-world soak. |
| VAL | Fixtures, seed corpus, a11y, packaged profiles. | Release evidence and regression matrix. |

Each Summer Engine task must cite source documents/sections, exact repository files after audit, acceptance commands, data/migration effect, rollback and evidence output.

# 59. Release Gates, Redesign Triggers and Definition of Done

## 59.1 Release Gates

| Gate | Required Evidence |
| --- | --- |
| G-MAR-0 Source Ready | 26A-26O approved; Set 25 contracts linked; no duplicate authority. |
| G-MAR-1 Data Ready | Schemas/IDs/packs validate; fixture definitions load; no unresolved required reference. |
| G-MAR-2 Water Ready | Ocean/local fluid/aquatic interactions pass conservation, seed and performance labs. |
| G-MAR-3 Vessel Ready | Commission/build/sail/dock/save loop passes with stable moving interior. |
| G-MAR-4 Civilisation Ready | Port/crew/cargo/voyage loop passes authoritative transactions and LOD. |
| G-MAR-5 Conflict/Ecology Ready | Damage/flood/repair and ecology/fishing loops pass persistence/reconciliation. |
| G-MAR-6 Multiplayer Ready | Two-player vessel/boarding/port transactions pass latency/reconnect/authority tests. |
| G-MAR-7 Production Ready | Packaged performance, accessibility, migration, manual acceptance and source audit pass. |
| G-MAR-8 Release Admission | Set 25 classification/evidence sign-off and Ash approval. |

## 59.2 Redesign Triggers

Redesign is mandatory when:

- Ocean simulation scales with total ocean cells rather than active local deviations.
- Vessel cost scales linearly with every voxel every frame.
- Moving interiors require parenting every actor in a way that breaks physics/network authority.
- Distant fleets/ports/ecology require full actor simulation.
- Save growth is dominated by derivable ambient water or ordinary fish identities.
- A client can duplicate cargo or commit vessel edits without authority.
- A major migration requires destructive regeneration of visited worlds.
- A critical maritime failure cannot explain its cause through a stable reason.
- Accessibility requires changing gameplay truth because presentation/control layers were not separated.
- A feature consistently exceeds frame/network/memory budgets and cannot be bounded through LOD/caching/incremental work.

## 59.3 Definition of Done

A maritime feature is done only when definition, runtime ownership, persistence, multiplayer scope, UI explanation, accessibility, migration impact, performance evidence, tests, diagnostics and documentation are all complete for its production tier.

# 60. Final Decision Register

| Decision ID | Decision | Status / Owner |
| --- | --- | --- |
| DEC-26O-001 | Godot is the runtime/editor host; Summer Engine is development tooling only. | Locked. |
| DEC-26O-002 | GDScript-first; native optimisation only after profiling a bounded hotspot. | Working Lock. |
| DEC-26O-003 | Maritime UI consumes read-only view models and issues validated commands. | Locked. |
| DEC-26O-004 | Solo and multiplayer share one authoritative state-change path. | Locked. |
| DEC-26O-005 | Moving vessels use stable vessel-local frames and frame-relative character reconciliation. | Working Lock pending prototype. |
| DEC-26O-006 | Boarding links do not merge vessel local grids. | Locked. |
| DEC-26O-007 | Listen-server host migration is not required for the Foundation Vertical Slice; clean save/rehost recovery is required. | Working Lock. |
| DEC-26O-008 | Dedicated-server compatibility is architectural; shipping dedicated server is classification-dependent. | Working Lock. |
| DEC-26O-009 | Ordinary crew and ecology use summary/cohort representation at distance; notable identities promote to persistent individuals. | Locked from 26J/26M. |
| DEC-26O-010 | Existing visited terrain is not silently regenerated to add maritime content. | Locked. |
| DEC-26O-011 | Maritime pack removal uses dependency checks/quarantine; active required definitions are never silently deleted. | Locked. |
| DEC-26O-012 | Expansion-only definitions should use `leyforge.expansion.maritime` subject to Ash/Set 25 final namespace approval. | Recommended Freeze. |
| DEC-26O-013 | First implementation target is a Maritime Foundation Vertical Slice, not the entire expansion roster. | Recommended Production Lock. |
| DEC-26O-014 | Small/medium/large vessel numeric budgets in Section 44 are prototype targets, not gameplay class rules. | Provisional. |
| DEC-26O-015 | Full-detail nearby vessel target is 4 with 8-vessel stress case before broader fleet combat. | Provisional. |
| DEC-26O-016 | First-release multiplayer should prove two-player same-vessel operation and moving-frame boarding; broad competitive PvP can remain later tier. | Recommended Scope. |
| DEC-26O-017 | Crew control defaults to stations, watches, priorities and delegation rather than per-sailor micromanagement. | Working Lock. |
| DEC-26O-018 | Distant markets/fleets/ecology use bounded scheduled ticks whose exact cadence is profiled, not hardcoded by design prose. | Locked Architecture / Pending Numbers. |
| DEC-26O-019 | Accessibility assists do not reduce rewards by default and may alter controls/presentation without falsifying authoritative state. | Locked. |
| DEC-26O-020 | Vessel loss defaults toward recoverable rescue/wreck/claim windows; harshness is world-setting controlled. | Working Lock. |
| DEC-26O-021 | Full submarines, skyships and dimensional arks remain outside the first maritime foundation. | Deferred per 26A. |
| DEC-26O-022 | Rewritten Document 18 must begin with an actual repository audit and must consume this document as maritime technical authority. | Locked. |
| DEC-26O-023 | Set 25 closure requires explicit admission/deferment of maritime packages and completion of the downstream amendment map. | Locked. |
| DEC-26O-024 | Maritime Readiness Dashboard is a development evidence aggregator, never a gameplay source of truth. | Working Lock. |

# 61. Document Set 26 Completion and Handoff

With 26O, the specialist design programme for **Document Set 26 - Oceans, Maritime Civilisation, Vessels and Naval Systems Expansion** is complete at design-bible v0.1 level.

Set 26 now provides:

- water/liquid architecture;
- oceans, coasts, islands and underwater generation;
- marine climate, wind, waves, tides, currents and storms;
- swimming, diving and underwater interaction;
- arbitrary-block commissioned vessels;
- movement, buoyancy, propulsion, steering and navigation;
- shipwright construction, repair, refit and salvage;
- Vessel Forge and procedural vessel authoring;
- ports, harbours, shipyards, crews and maritime civilisation;
- trade, fleets, piracy, navies and regional power;
- naval combat, boarding, damage, flooding, fire and siege;
- marine ecology, fishing, dungeons and bosses;
- progression, registries, magic, automation, economy, quests and events;
- UI/UX, multiplayer, Godot/Summer architecture, persistence, LOD, performance, QA and downstream integration.

The next production action is not another Set 26 design document. It is controlled integration:

1. Review/approve Set 26A-26O as a coherent source set.
2. Apply Set 25 closure amendments and classify the Maritime Foundation Vertical Slice.
3. Perform the read-only Godot/Summer Engine repository audit.
4. Rewrite Document 18 as the current project-wide Godot/Summer Engine Technical Implementation Plan.
5. Amend the main documents according to Sections 54-56 in governed batches.
6. Convert the approved vertical slice into bounded Summer Engine implementation tasks.
7. Build the prototype laboratories and collect evidence before expanding content breadth.

> **Final Set 26 Rule**
>
> The maritime expansion is complete as a design programme only when its systems remain connected to the same physical resources, living civilisations, magic, automation, player freedom, persistent consequences and production governance that define Leyforge. Ships and oceans are an expansion of the world, not a second game bolted onto it.

# Appendix A. Maritime Runtime Service Map

| Service | Key Records | Main Commands | Main Events |
| --- | --- | --- | --- |
| MaritimeRegistryService | Qualified definitions, facets, pack manifest. | Load/validate pack; resolve reference. | RegistryReady; DefinitionQuarantined. |
| FluidSimulationService | Fluid islands, local cells, transfer state. | RequestTransferFluid; RequestSealBoundary. | FluidChanged; FloodBoundaryChanged. |
| MarineFieldService | Regional wind/current/tide/storm state. | AdvanceFieldSchedule; QueryConditions. | MarineFieldUpdated; StormWarningChanged. |
| AquaticInteractionService | Character aquatic state adapter. | RequestDive; RequestRescue; RequestUseAirSource. | AquaticStateChanged; DrowningStageChanged. |
| VesselService | VesselInstance, local grid, graphs. | Commission; Edit; Decommission. | VesselCommissioned; VesselStructureChanged. |
| VesselMovementService | Motion/capability summary. | SetHelmInput; SetPropulsion; Anchor. | VesselMotionUpdated; Grounded; CapsizeRiskChanged. |
| ShipwrightService | Work projects, reservations, repair/refit. | StartProject; CommitWork; Salvage. | WorkPackageChanged; RefitCommitted. |
| PortService | PortCall, berth/service state. | RequestBerth; RequestService; Depart. | BerthAssigned; PortServiceChanged. |
| CrewService | Assignments, stations, orders. | AssignRole; TakeStation; IssueOrder. | StationLeaseChanged; CrewOrderResult. |
| CargoContractService | Cargo lots, custody, contracts. | TransferCargo; AcceptContract; SettleContract. | CargoTransferred; ContractStateChanged. |
| VoyageFleetService | Voyage/fleet summaries. | PlanVoyage; Depart; IssueFleetOrder. | VoyageAdvanced; FleetStateChanged. |
| NavalEncounterService | Encounter/boarding/damage coordination. | FireWeapon; Board; Surrender; Capture. | DamageApplied; BoardingStateChanged; EncounterResolved. |
| MarineEcologyService | Cohorts, habitat, fishery state. | Harvest; Survey; PromoteRepresentative. | CohortChanged; CatchCreated; MigrationStarted. |
| MaritimeSaveAdapter | Maritime save sections/journals. | Save; Load; Migrate; Quarantine. | MaritimeSaveRecovered; MigrationReportReady. |

# Appendix B. Multiplayer Authority Matrix

| Action | Authoritative Owner | Conflict Rule | Client Feedback |
| --- | --- | --- | --- |
| Helm control | Vessel/Server + station lease | One continuous control owner unless design permits paired roles. | Immediate predicted wheel/rudder response; reconcile transform. |
| Sail/engine control | Server + station/order authority | Validate role and component availability. | Local control animation, authoritative output. |
| Vessel voxel edit | Server VesselService | Work-state + edit lock + resource transaction. | Ghost preview before commit. |
| Cargo move | Server CargoContractService | Reservation prevents double spend. | Pending/reserved state then commit/fail. |
| Repair | Server Shipwright/Combat service | Material + reach + hazard + work lock. | Progress prediction only within safe bounds. |
| Weapon fire | Server combat authority | Station, ammo/power, arc, cooldown. | Cosmetic muzzle prediction; authoritative hit. |
| Boarding link | Server encounter authority | Relative position, equipment, permission/rules. | Connector preview; commit on validation. |
| Port service | Server PortService | Queue, berth, law, stock, capability. | Clear blocker and queue state. |
| Contract acceptance | Server contract authority | Issuer, scope, duplicate/exclusive rule. | Confirmation after authoritative bind. |
| Fish harvest | Server ecology authority | Cohort reservation, gear, law, location. | Catch animation then authoritative lot. |

# Appendix C. Provisional Performance Budget Register

| Budget ID | Measure | Prototype Target | Evidence |
| --- | --- | --- | --- |
| BUD-26O-001 | Small vessel voxels | <= 2,500 | LAB-26O-03. |
| BUD-26O-002 | Medium vessel voxels | <= 12,000 | Player vessel packaged profile. |
| BUD-26O-003 | Large vessel voxels | <= 35,000 | LAB-26O-11. |
| BUD-26O-004 | Exceptional stress vessel | <= 60,000 | Stress only; redesign if unusable. |
| BUD-26O-005 | Full-detail vessels | 4 target, 8 stress | Storm/encounter profile. |
| BUD-26O-006 | Reduced nearby vessels | 16 target, 32 stress | Port/fleet profile. |
| BUD-26O-007 | Detailed compartments | 64 target, 128 stress per vessel | Flood lab. |
| BUD-26O-008 | Incremental edit main-thread work | < 50 ms target | Refit/damage profile. |
| BUD-26O-009 | Local visible helm response | < 100 ms target | Input/network lab. |
| BUD-26O-010 | Ambient marine actors | Budgeted by camera/profile, no per-cohort actor guarantee | Underwater ecology profile. |
| BUD-26O-011 | Distant fleet/ecology | Summary records only | Soak test. |
| BUD-26O-012 | Save/migration | No silent loss; bounded duration measured per world size | Migration suite. |

# Appendix D. QA and Prototype Matrix

| Scenario | Systems | Automated | Manual | Multiplayer | Performance |
| --- | --- | --- | --- | --- | --- |
| Swim coastal surf | 26B-E | State/conservation | Feel/comfort | Optional | Yes |
| Build/commission boat | 26F/H/I | Graph/transaction | Workflow/readability | Yes | Yes |
| Sail/dock | 26D/G/J | Route/capability | Helm/docking feel | Yes | Yes |
| Cargo contract | 26J/K/N | Custody/conservation | UI clarity | Yes | Moderate |
| Breach/flood/repair | 26B/F/H/L | Conservation/save | Alarm/damage readability | Yes | Yes |
| Boarding | 26E/G/L | Authority/frame transfer | Camera/combat feel | Required | Yes |
| Fishery loop | 26M/N | Cohort/catch | Feedback/ethics clarity | Optional | Moderate |
| Distant voyage promote | 26K/O | Reconciliation | World believability | Optional | Yes |
| Pack migration | 25D/E + 26O | Required | Recovery report | Server fixture | Yes |
| Split-screen vessel | 17/26O | Input focus | Required | Local multiplayer | Required |

# Appendix E. Main-Document Amendment Register

| Group | Documents | Required Action |
| --- | --- | --- |
| Vision / Loop / Progression | 00-02 | Revision packs after Set 26 approval. |
| Registries / Resources | 03-06 | Set 25-governed replacements/extensions with maritime families. |
| NPC / Automation / Magic | 07-09 | Major maritime revision packs. |
| World / Content | 10-14 | Marine ecology/worldgen/structures/culture/realm amendments. |
| Quest / Combat / UI | 15-17 | Major maritime revisions. |
| Technical | 18 | Complete Godot/Summer Engine replacement after repository audit. |
| Player Creation / Settlements | 19-20 | Vessel/port/shipyard and waterfront integration. |
| Forge / Presentation | 21-23 | Vessel Forge and maritime presentation extensions. |
| Atlas | 24 | Controlled cross-references; canon remains owner. |
| Governance | 25A-25L | Final Set 26 admission/classification/closure revision. |

# Appendix F. Maritime Diagnostic Reason Codes

| Code | Meaning |
| --- | --- |
| MARITIME_UI_SOURCE_MISSING | View model cannot trace displayed critical state to authoritative source. |
| MARITIME_AUTHORITY_DENIED | Initiator lacks authority for requested command. |
| MARITIME_STATION_LEASE_CONFLICT | Requested station is held by incompatible active lease. |
| MARITIME_VESSEL_FRAME_UNRESOLVED | Actor/object cannot resolve valid vessel-local/world frame transition. |
| MARITIME_REPLICATION_SCHEMA_MISMATCH | Client/server maritime replicated schema or pack hash is incompatible. |
| MARITIME_TRANSACTION_RESERVATION_FAILED | Required inventory/cargo/resource reservation could not be acquired. |
| MARITIME_SAVE_JOURNAL_INCOMPLETE | Interrupted transaction requires rollback/replay. |
| MARITIME_MIGRATION_QUARANTINED | Record cannot safely migrate and is preserved in quarantine. |
| MARITIME_PACK_ACTIVE_DEPENDENCY | Pack cannot be disabled because active state depends on it. |
| MARITIME_LOD_PROMOTION_FAILED | Summary cannot safely expand into detailed representation. |
| MARITIME_LOD_DEMOTION_FAILED | Detailed state cannot reconcile into valid summary. |
| MARITIME_PERFORMANCE_BUDGET_EXCEEDED | Measured scenario exceeds approved production budget. |
| MARITIME_NETWORK_BUDGET_EXCEEDED | Replication/traffic exceeds approved scenario budget. |
| MARITIME_REASON_CODE_UNMAPPED | Critical failure lacks player-facing explanation. |
| MARITIME_ACCESSIBILITY_CONTRACT_MISSING | Critical control/cue lacks required accessible alternative. |
| MARITIME_SEED_REACHABILITY_FAILED | Required maritime progression provider is not reachable for tested seed contract. |
| MARITIME_RELEASE_EVIDENCE_INCOMPLETE | Required gate evidence is absent or stale. |
| MARITIME_SOURCE_OF_TRUTH_CONFLICT | Two documents/registries/services claim incompatible ownership. |

# Appendix G. Summer Engine Task Contract Examples

A maritime implementation task should remain bounded and reviewable.

## Example: Vessel Local Frame Prototype

| Field | Requirement |
| --- | --- |
| Source Authority | 26F local-grid rules; 26G movement; 26O Sections 22-24. |
| Deliverable | Minimal VesselFrame service/component plus one test vessel and moving-character fixture. |
| Before State | Static voxel structures only or current moving prototype documented by repository audit. |
| Changed Files | Exact paths discovered and listed before implementation. |
| Data Effect | No permanent migration for spike unless explicitly approved. |
| Acceptance | Walk/jump aboard moving vessel; detach/re-board; deterministic test; packaged profile. |
| Failure Codes | Frame unresolved, invalid handoff, authority conflict. |
| Rollback | Remove spike service/fixture and generated cache; restore pre-task project state. |
| Evidence | Test report, frame capture, profiler trace, known limitations. |

## Example: Maritime Pack Fixture

| Field | Requirement |
| --- | --- |
| Source Authority | 25B-25E, 26N namespace/facets, 26O Section 57. |
| Deliverable | One optional maritime fixture pack with manifest, dependencies, one block facet, one item, one vessel component and migration/removal test. |
| Acceptance | Load, validate, save, disable with safe state, quarantine active dependency, restore. |
| Evidence | Manifest hash, validator report, migration dry-run and rollback output. |

# Appendix H. Final Set 26 Completion Checklist

| Area | Completion Requirement |
| --- | --- |
| Vision | Oceans and vessels remain connected to Leyforge's four pillars and player freedom. |
| Water | Large bodies, local fluid, flooding and queries have explicit ownership and bounded simulation. |
| Worldgen | Oceans/coasts/islands/underwater content are seed-generated and migration-safe. |
| Climate | Wind/waves/tides/currents/storms are regional fields with readable presentation. |
| Player | Swimming/diving/rescue controls and accessibility are defined. |
| Vessels | Local voxel grids, commissioning, movement, damage, persistence and edit rules are complete. |
| Shipwright / Forge | Construction/refit/salvage and Vessel Forge source/runtime boundaries are complete. |
| Civilisation | Ports, crews, shipyards, services and settlement integration are defined. |
| Economy / Fleets | Cargo, voyages, trade, piracy, navies and regional power have authoritative records/LOD. |
| Combat | Naval damage, boarding, flooding, fire, surrender/capture and siege integrate with shared combat. |
| Ecology | Cohorts, fishing, creatures, sites and bosses use scalable persistent rules. |
| Progression | Skills, knowledge, magic, automation, economy, quests/events and registry admission are connected. |
| UI/UX | Critical maritime state has view-model, reason, control and accessible presentation requirements. |
| Multiplayer | Authority, moving frames, station locks, replication and reconnect boundaries are declared. |
| Persistence | Save records, journaling, migration, pack removal/quarantine and LOD reconciliation are declared. |
| Godot/Summer | Service-led GDScript-first architecture and bounded work queues are defined. |
| Performance | Prototype budgets, measurement method and redesign triggers are explicit. |
| QA | Automated, seed, migration, multiplayer, performance, accessibility and manual evidence is required. |
| Main Documents | 00-25 amendment map is explicit. |
| Set 25 | Closure conditions and namespace/package admission path are explicit. |
| Production | Foundation Vertical Slice recommendation and staged work lanes are defined. |
| Final Authority | Ash approval remains required for final namespace, production scope, budgets and release admission. |
