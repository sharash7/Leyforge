# FANTASY VOXEL CIVILISATION SANDBOX
## DOCUMENT SET 26
# 26G - Vessel Movement, Buoyancy, Propulsion, Steering and Navigation
*Version 0.1 - Detailed Design Bible and Technical Foundation Draft*

A data-driven movement and navigation architecture for player-built voxel vessels, covering displacement, buoyancy, stability, draft, trim, list, capsizing, grounding, environmental forces, propulsion, steering, anchors, towing, docking, navigation, route simulation, multiplayer authority, performance and operational certification.

Working design document - commissioned-vessel movement, water support and navigation foundation

| Field | Locked Direction |
| --- | --- |
| Document Role | Document 26G is the movement, support-force, propulsion, steering and navigation authority for commissioned Vessel Instances created under Document 26F. |
| Core Philosophy | Vessels should move because their actual shape, material mass, contained load, water environment and working components produce readable capability. The model is simplified for playability and scalability, but it must conserve state and explain failure. |
| Structural Boundary | 26G consumes 26F local-grid, mass, surface, compartment, role and component outputs. It may certify, warn, immobilise or restrict operation, but it may not silently change vessel cells, role assignments, ownership, blueprint source or structural truth. |
| Environmental Boundary | 26G consumes Water Body, depth, current and fluid interfaces from 26B-26C and wind, wave, tide, surge, ice and storm state from 26D. It does not regenerate oceans or own atmospheric truth. |
| Movement Model | Use a hybrid deterministic rigid-vessel model: one authoritative vessel body, sampled hull support and drag, aggregate force application, bounded local interactions and far-route summaries. Do not create a rigid body or fluid solver per voxel. |
| Propulsion Direction | Support sails, oars, paddles, paddle wheels, propellers, mechanical engines, fuel engines, mana drives, creature-assisted methods and hybrid combinations through reusable component/provider contracts. |
| Navigation Direction | Navigation combines player steering, charts and learned knowledge, local depth and hazard queries, route graphs, weather windows, NPC competence and optional assisted control without replacing sandbox choice. |
| Certification Direction | A commissioned vessel begins immobilised. It becomes operational only after support, stability, control, propulsion, clearance and environment checks pass the applicable certification profile. |
| Technical Direction | Godot/Summer Engine implementation uses compact data, batched physics queries, deterministic services, one authoritative motion owner and explicit near/far promotion. Exact constants and scale caps remain prototype-driven. |
| Scope Boundary | This document does not design shipbuilding workflows, Vessel Forge authoring, crews and ports, fleet economy, naval combat or final maritime progression. Those belong to 26H-26O. |

# DOCUMENT SET 26 - OCEANS, MARITIME CIVILISATION, VESSELS AND NAVAL SYSTEMS EXPANSION
# Document Purpose
Document 26G defines how a structurally commissioned voxel vessel becomes a controllable moving object inside Leyforge. It translates the local-grid architecture, material aggregation, exterior surfaces, compartments, component foundations and lifecycle rules of Document 26F into displacement, buoyancy, stability, drag, propulsion, steering, anchoring, towing, docking and navigation behaviour.

The document must preserve the project promise that players may build unusual vessels from ordinary blocks without requiring professional naval-engineering knowledge. A broad, stable craft should be easy to understand. A top-heavy stone tower on a narrow hull may still commission structurally, but its movement inspection should clearly show excessive draft, poor reserve buoyancy, dangerous stability or inadequate propulsion. Creative freedom is preserved by explainable consequences rather than arbitrary shape templates.

The system is deliberately not a full computational-fluid-dynamics or naval-architecture simulator. It uses actual block-derived mass and shape evidence, but converts those inputs into bounded samples, aggregate forces, capability bands and readable reason codes. Detailed simulation is reserved for nearby active vessels. Distant ships and fleets travel through route-state summaries that consume the same vessel capabilities and environmental conditions without integrating every wave.

Document 26G also establishes the operational-certification boundary. Structural commissioning in 26F proves that a selected assembly can safely exist as a persistent Vessel Instance. Operational certification proves that the current vessel configuration can float, remain acceptably stable, produce or receive control, and travel in its intended environment. A vessel may remain commissioned but immobilised while being loaded, repaired, awaiting tide, lacking crew, grounded, frozen in, missing propulsion or carrying an unsafe configuration.

# Design Sources, Authority and Supersession
| Source | Authority Consumed by 26G | 26G Boundary |
| --- | --- | --- |
| 26A - Maritime Expansion Foundation | Hybrid arbitrary-block vessels, physical consequence, scalable simulation, progression compatibility and dedicated Set 26 ownership. | 26G implements movement without broadening deferred skyship, unrestricted submersible or mobile-city scope. |
| 26B - Water, Liquid and Fluid Overhaul | Water Body identity, local fluid islands, liquid volume, density, displacement, pressure, flooding, pumps and fluid queries. | 26G queries water support and fluid state; it does not own cell flow, flooding transactions or liquid reactions. |
| 26C - Oceans and Marine World Generation | Bathymetry, coast geometry, harbour suitability, route graphs, channels, shoals, reefs, ice-prone water and stable marine regions. | 26G consumes generated geography and saved deltas; it does not regenerate terrain. |
| 26D - Marine Climate and Weather | Wind, current, tide, wave trains, sea state, surge, storms, visibility, ice and extraordinary marine fields. | 26G converts environmental inputs into vessel motion and control; survival/damage outcomes remain with owning systems. |
| 26E - Swimming and Diving | Player water movement, rescue, reboarding, man-overboard, currents and accessibility. | 26G supplies vessel-relative motion, ladders, wake and frame transfer; character physiology remains 26E-owned. |
| 26F - Vessel Architecture | Vessel Instance, local grid, mass inputs, surfaces, waterline reference, compartments, structural groups, roles, components, lifecycle and commissioning. | 26G may never mutate 26F structure silently. It returns certification evidence and movement state only. |
| 25A-25L - Production Governance | Qualified IDs, domain admission, facets, field ownership, relationships, capabilities, packs, migrations, validation, evidence and release gates. | 26G definitions and runtime records extend the canonical kernel rather than creating a parallel vessel database. |
| 08 - Automation System | Mechanical, fuel, wind, water, mana and hybrid power; ports; networks; transactions; visible machinery. | 26G consumes delivered power and component output; it does not duplicate the power-network truth. |
| 09 - Magic System | Mana, conduits, batteries, runes, wards, stability, overload and magical infrastructure. | Mana drives and control runes use existing magical infrastructure contracts. |
| 16 - Combat, Gear and Defence | Damage packets, status, structure effects, equipment, raids and authority. | 26G exposes motion/load events; 26L owns naval damage, sinking, weapons and combat aftermath. |
| 17 - UI/UX System | World-first interface, progressive disclosure, accessibility, controller support and trustworthy reasons. | 26G inspection and helm UI follow shared interaction and accessibility contracts. |
| 18 replacement programme | Immutable definitions, authoritative runtime state, deterministic saves, LOD, Godot services and validation. | Unreal-specific assumptions are superseded by Godot/Summer Engine direction. |

> **Supersession Rule**
>
> Where earlier documents imply cosmetic boats, static water, universal block physics, Unreal-specific vehicle classes or a single generic movement statistic, this document supersedes those implications for commissioned maritime vessels. It does not supersede the canonical owners of blocks, materials, water, weather, inventories, power, magic, damage, world generation or presentation assets.

# Static Table of Contents
- 1. Locked Vessel Movement Identity
- 2. Design Principles and Experience Targets
- 3. Explicit Non-Goals
- 4. Source-of-Truth and System Ownership
- 5. Canonical Terminology
- 6. Movement Architecture and Record Separation
- 7. Vessel Movement Lifecycle and State Model
- 8. Fidelity Bands and Simulation Modes
- 9. Mass, Load and Centre-of-Mass Resolution
- 10. Displaced Volume and Immersed Geometry
- 11. Buoyancy Sampling Architecture
- 12. Equilibrium Waterline, Draft, Trim and List
- 13. Centre of Buoyancy, Metacentric Proxy and Stability
- 14. Reserve Buoyancy, Freeboard and Downflooding Risk
- 15. Dynamic Stability, Heel, Roll, Pitch and Heave
- 16. Capsizing, Swamping, Recovery and Righting
- 17. Wave, Current, Tide and Wind Force Integration
- 18. Hydrodynamic Resistance and Drag
- 19. Shallow Water, Grounding, Beaching and Collision
- 20. Floodwater, Cargo, Ballast and Moving-Mass Coupling
- 21. Propulsion Provider Architecture
- 22. Sail and Rig Propulsion
- 23. Oars, Paddles and Manual Propulsion
- 24. Paddle Wheels, Propellers and Waterjets
- 25. Mechanical, Fuel and Industrial Engines
- 26. Mana Drives, Rune Propulsion and Magical Movement
- 27. Hybrid Propulsion, Power Arbitration and Failure
- 28. Fuel, Mana, Maintenance and Heat Interfaces
- 29. Steering and Control Architecture
- 30. Rudders, Fins and Hydrofoils
- 31. Differential Thrust, Oar Steering and Auxiliary Control
- 32. Helm, Control Response and Assisted Handling
- 33. Anchors and Holding Ground
- 34. Mooring, Lines, Bollards and Harbour Restraint
- 35. Towing, Pushing and Connected-Vessel Movement
- 36. Docking, Undocking, Launching and Hauling States
- 37. Navigation Knowledge, Charts and Instruments
- 38. Route Graphs, Clearance and Local Path Planning
- 39. Player Navigation, Assisted Control and Autopilot
- 40. NPC Navigation Capability Interface
- 41. Sea-Worthiness, Environment Bands and Operational Limits
- 42. Operational Certification and Re-Certification
- 43. Movement Commands, Authority and Event Flow
- 44. Occupants, Moving Interiors and Frame Transfer
- 45. Multiplayer Replication, Reconnection and Prediction
- 46. Simulation LOD and Distant Route Travel
- 47. Persistence, Save Migration and Recovery
- 48. Godot/Summer Engine Technical Architecture
- 49. Performance Budgets and Scalability Levers
- 50. Helm UI, Inspection, Feedback and Accessibility
- 51. Registry Facets, Relationships and Capabilities
- 52. Validation, Reason Codes and Evidence
- 53. Prototype Laboratories and Acceptance Tests
- 54. Production Classification and Set 25 Integration
- 55. Main-Document, Forge and Content Integration Matrix
- 56. Decision Register
- 57. Handoff to Document 26H
- 58. Open Decisions for Later Documents
- Appendix A. Canonical Glossary
- Appendix B. Movement and Certification Record Templates
- Appendix C. Propulsion and Steering Provider Templates
- Appendix D. Sea-Worthiness and Environment Matrix
- Appendix E. Movement State Transition Matrix
- Appendix F. Validation and Reason-Code Catalogue
- Appendix G. Prototype and Performance Test Matrix
- Appendix H. Completion Checklist

# 1. Locked Vessel Movement Identity
The Vessel Movement System is the physical travel and controllability layer for commissioned voxel vessels. It determines whether the current assembled vessel can displace enough liquid to support its total load, where it settles, whether it returns toward upright after disturbance, how environmental fields move it, how propulsion changes velocity, how steering changes heading, and which routes are safe or possible.

> **Locked Rule**
>
> A vessel must not float, turn or travel merely because it has been labelled a ship. Operational behaviour is resolved from the commissioned local grid, material and load truth, working components, current water state and current environment. The result may be simplified, but it must be deterministic, inspectable and attributable.

| Identity Layer | Design Meaning | Player-Facing Result |
| --- | --- | --- |
| Physical Support | Shape, immersed volume and liquid density determine available buoyant support. | Wide sealed hulls, pontoons and displacement chambers matter visibly. |
| Mass and Balance | Blocks, cargo, fluid, machinery, occupants and secured ballast contribute to total mass and distribution. | Loading ore high on one side can create list and poor handling. |
| Environmental Motion | Wind, waves, currents, tides, depth, ice and storms change movement and risk. | Routes and weather windows matter rather than the sea being a flat road. |
| Propulsion Choice | Sails, oars, engines, mana drives and hybrids provide different force, cost, skill and infrastructure profiles. | Cultures and player builds can solve travel differently. |
| Control and Navigation | Steering surfaces, helm stations, visibility, charts, depth and route knowledge shape safe control. | A fast vessel can still be difficult to turn, dock or navigate. |
| Operational Certification | Support, stability, control and clearance are validated against intended use. | The Shipwright inspection explains why a vessel is ready, restricted or unsafe. |
| Scalable Truth | Local force simulation and distant route summaries consume the same capabilities. | Ships remain persistent and consistent across loaded and unloaded regions. |

## 1.1 Vessel Experience Promise
A player should be able to change a vessel and predict the broad result. Adding low secured ballast may reduce list and improve righting but increase draft and propulsion demand. Raising a large sail may improve speed in favourable wind but increase heel and rig load. Adding heavy armour above the waterline may reduce stability. Pumping out a flooded compartment should restore freeboard and reduce list. The interface must explain these effects in player language before exposing advanced numeric views.

## 1.2 Creative Freedom Promise
The system must accept rafts, barges, monohulls, multi-hulls, boxy workboats, fantasy silhouettes and unusual materials when the calculated capabilities support them. It must not demand a real-world hull outline, named vessel class or hidden template match. Intended class and environment select validation expectations; they do not overwrite the actual result.

# 2. Design Principles and Experience Targets
| Principle | Required Behaviour |
| --- | --- |
| Explainable before realistic | Every major restriction has visible evidence, highlighted location or capability shortfall. |
| Actual inputs, bounded computation | Use real local-grid mass and shape, then reduce them into samples and cached aggregates. |
| Stable at ordinary play scales | Minor frame-rate differences must not cause different certification, sinking or route outcomes. |
| Graceful degradation | A failing sail, rudder, engine or pump reduces capability through defined states instead of producing arbitrary total failure. |
| Multiple valid technologies | Manual, mechanical, fuel, magical and hybrid movement remain viable at appropriate scales. |
| No hidden free energy | Propulsion consumes wind opportunity, labour, fuel, power, mana, stored charge or approved extraordinary sources. |
| World-first readability | Wake, heel, trim, sail fill, engine output, anchor strain, depth soundings and warnings communicate state. |
| Simulation LOD equivalence | Far travel uses the same certified speed, draft, endurance, weather tolerance and route constraints. |
| Accessibility without altered truth | Reduced motion, stabilised cameras and assisted steering may change presentation/control support without falsifying authoritative vessel state. |
| Evidence-driven constants | Exact coefficients, sample counts, caps and tick rates remain Balance Draft until prototype evidence approves them. |

# 3. Explicit Non-Goals
- Full computational fluid dynamics around arbitrary voxel hulls.
- One buoyancy point, collision body, rigid body or wave object per voxel.
- Professional naval-architecture terminology as a prerequisite for normal play.
- Universal structural stress or fatigue simulation; 26F and 26L own simplified structure and damage.
- Automatic correction of unsafe player designs by moving blocks, cargo or ballast without explicit permission.
- Cosmetic speed classes that ignore mass, propulsion, environment and damage.
- Perfectly accurate sailing aerodynamics, cavitation, propeller design or engine thermodynamics.
- Unrestricted aircraft, skyships, spaceships, mobile cities or full submarines in the initial maritime expansion.
- Naval weapons, boarding, ramming damage, breaches, sinking and wreck creation; these belong to 26L.
- Crew schedules, wages, morale, port services, fleet economy or naval command; these belong to 26J-26K.
- Refit, repair, dry-dock and salvage workflows; these belong to 26H.
- A navigation system that reveals undiscovered geography, exact hidden hazards or perfect forecasts.

# 4. Source-of-Truth and System Ownership
| Truth | Canonical Owner | 26G Use |
| --- | --- | --- |
| Vessel cells, shapes, roles and structure | 26F Vessel Instance and structural records | Read-only input except through approved 26H refit transaction. |
| Base block/material properties | Documents 03/06 replacements and Set 25 registry facets | Resolve mass, seal, friction, durability and compatibility by qualified ID. |
| Cargo, inventories and occupants | Inventory/NPC/creature owning systems | Read authoritative current mass and secured-location bindings. |
| Water density, level and local liquid state | 26B Water Body/local fluid services | Query support medium and local flooding; never mirror editable liquid truth. |
| Bathymetry, coast and route geography | 26C world generation and saved deltas | Query depth, seabed, obstacles, channels and route nodes. |
| Wind, waves, currents, tide, storm and ice | 26D marine field services | Sample current environmental inputs. |
| Power and fuel networks | 08 and owning machine/power services | Consume delivered output through provider interface. |
| Mana and magical state | 09 and owning mana services | Consume charge/output and expose overload/stability demand. |
| Vessel motion state | 26G Movement Record | Sole mutable authority for transform, velocity, angular state, restraint and movement mode. |
| Damage and flooding consequences | 26L with 26B/26F inputs | 26G supplies loads and motion events; it does not apply combat damage independently. |
| Route ownership and trade schedule | 26J-26K | 26G executes local or abstract movement against approved route intent. |

> **One Mutable Motion Truth**
>
> Every active Vessel Instance has one authoritative Movement Record. Render transforms, client prediction, route forecasts, helm gauges, AI plans and replay traces are derived views. No presentation node, physics-body transform, animation graph or distant-route summary becomes a competing editable motion truth.

# 5. Canonical Terminology
| Term | Canonical Use |
| --- | --- |
| Actual Waterline | Solved intersection between the current vessel and support-medium surface at equilibrium or current dynamic state. |
| Displacement | Mass of liquid displaced by the immersed vessel volume; used as buoyant support evidence. |
| Draft | Vertical distance from actual waterline to the lowest relevant immersed point or declared reference. |
| Trim | Fore-aft inclination relative to the vessel frame. |
| List | Persistent side inclination caused by load or flooding asymmetry. |
| Heel | Temporary or operational inclination caused by wind, turning, waves or manoeuvre. |
| Freeboard | Distance from actual waterline to the lowest downflooding edge or selected deck reference. |
| Reserve Buoyancy | Additional sealed volume available above the current waterline before critical downflooding. |
| Centre of Mass | Aggregate position of vessel cells, contained loads, fluids, machinery and occupants. |
| Centre of Buoyancy | Centroid of currently displaced support-medium volume. |
| Righting Capacity | Simplified ability to generate restoring response after heel/list. |
| Propulsion Provider | Component or provider group that converts an approved source into vessel-local thrust/force. |
| Steering Provider | Component or provider group that creates yaw/heading control or lateral manoeuvre. |
| Restraint State | Anchor, mooring, towing, docking, beaching, hauling or other condition limiting free movement. |
| Sea-Worthiness Band | Certified operational envelope for environment, load and use; not a guarantee against all events. |
| Movement Snapshot | Compact authoritative state used for save, replication, LOD and debugging. |

# 6. Movement Architecture and Record Separation
| Record/Definition | Purpose | Persistence |
| --- | --- | --- |
| Movement Profile Definition | Selects fidelity, expected providers, environment limits, thresholds and validation rules. | Immutable registry definition. |
| Propulsion/Steering Provider Definition | Describes force model, inputs, operating limits, sockets and capability output. | Immutable registry definition. |
| Operational Certification Profile | Defines mandatory checks for class, environment and intended use. | Immutable registry definition. |
| Movement Record | Owns current transform, linear/angular state, waterline solution, restraint and active mode. | Persistent per Vessel Instance. |
| Load Distribution Record | Caches current mass providers and local positions with change revision. | Persistent or reconstructable with revision hash. |
| Hydrostatic Cache | Stores immersed samples, equilibrium solution and stability summary for a structural/load revision. | Derived, invalidated by relevant changes. |
| Provider Runtime State | Stores active sail area, oar cadence, engine output, damage state, delivered power and faults. | Persistent where state matters. |
| Navigation Plan | Stores route intent, waypoints, clearance requirements, confidence and active leg. | Persistent while active. |
| Distant Transit Record | Stores abstract route progress, environment summary, ETA band and interruptions. | Persistent while demoted. |
| Certification Report | Stores pass/fail/warning evidence bound to exact vessel, load and registry revisions. | Persistent evidence/history. |

# 7. Vessel Movement Lifecycle and State Model
| State | Meaning | Allowed Actions |
| --- | --- | --- |
| Commissioned Immobilised | 26F transfer complete; no movement certification yet. | Inspect, load within rules, configure, certify, decommission. |
| Certification Review | Hydrostatic/control/environment checks running against a locked snapshot. | Cancel safely; no conflicting edits. |
| Operational Moored | Certified and constrained by approved mooring/dock. | Board, load, configure providers, plan route, undock. |
| Operational Anchored | Certified and held by anchor model. | Wait, fish, transfer, raise anchor, respond to drag. |
| Operational Underway | Free or controlled movement active. | Helm, propel, navigate, tow, respond to weather. |
| Adrift | No effective propulsion/control or no active helm intent. | Repair, anchor, tow, emergency response. |
| Grounded/Beached | Hull contacts seabed/shore and cannot move freely. | Refloat, unload, tow, haul, inspect damage interface. |
| Capsized/Swamped | Orientation or downflooding exceeds operational envelope. | Rescue, pump, right, tow, abandon; 26L may transition to sinking/wreck. |
| Docked Edit Lock | Vessel supported for 26H work and movement disabled. | Repair/refit under controlled workflow. |
| Quarantined | Missing schema, pack, migration or corrupt motion record. | Recover, migrate, static-convert; never free-simulate. |

# 8. Fidelity Bands and Simulation Modes
| Band | Typical Use | Movement Treatment |
| --- | --- | --- |
| Hydrostatic Preview | Forge/Shipwright inspection and certification. | Solve equilibrium and capability without world movement. |
| Active Local | Player-near vessel, docking, combat or severe weather. | Authoritative rigid-vessel integration with sampled support, drag and environmental forces. |
| Reduced Local | Visible but not interaction-critical vessel. | Lower sample/tick rate, simplified angular response, preserved constraints. |
| Route Transit | Distant vessel on known route. | Progress along route using certified performance, current weather summary, endurance and hazards. |
| Regional Summary | Fleet or inactive harbour population. | Aggregate schedule and state transitions; no individual local transform integration. |
| Static Restraint | Docked, hauled, dry-docked or intentionally immobilised. | World transform held by restraint; hydrostatic state may still be inspected. |

Promotion and demotion are state conversions, not respawns. Vessel identity, cargo, damage, provider state, route intent, occupants and history remain continuous. A vessel cannot demote during unresolved close collision, unsafe frame transfer, active boarding, high-severity grounding, capsizing or other state marked non-demotable by the owning system.

# 9. Mass, Load and Centre-of-Mass Resolution
26F provides dry cell mass and component foundations. 26G resolves the current operational load by combining all authoritative mass providers located in the Vessel Frame.

| Mass Provider | Position Source | Update Trigger |
| --- | --- | --- |
| Voxel cells and shapes | 26F local-grid cell/shape centroid and material facet. | Structural revision. |
| Block entities and machinery | Component instance mount/frame. | Install/remove, internal inventory or moving assembly state. |
| Item containers and cargo | Secured container/socket or loose-cargo region. | Transaction, transfer, spoilage/conversion or movement. |
| Contained liquids | 26B compartment/fluid record mapped to local volume. | Flow, pumping, breach, consumption or phase change. |
| Fuel and mana stores | Owning resource container/component. | Consumption, transfer or charge conversion when mass-relevant. |
| NPCs, creatures and players | Current Vessel Frame local position. | Board, disembark or significant local movement. |
| Towed/attached load | Tow/attachment relationship and line geometry. | Connection or force-state change; generally external rather than merged mass. |
| Ice, debris or exceptional accumulation | Owning status/effect record. | Exposure, clearing or damage event. |

## 9.1 Load Revision and Cache Invalidation
Every mass-affecting transaction increments a Load Revision or updates a bounded moving-load channel. Large cargo transfers, flooding and ballast changes invalidate equilibrium and certification caches. Ordinary walking occupants may update dynamic centre-of-mass contribution at a reduced rate without forcing a full structural scan.

## 9.2 Secured, Contained and Loose Loads
| Load State | Movement Behaviour |
| --- | --- |
| Secured | Fixed to declared local location until an explicit transfer or damage event. |
| Contained | May move within a bounded tank, hold or inventory model according to its owner. |
| Loose | May shift under heel, impact or flooding through 26L/26B rules; 26G consumes the resulting position/state. |
| Suspended | Crane, davit or rigging load applies force through attachment point and may change stability. |
| External Tow | Not merged into hull hydrostatics; coupled through tow force and route constraints. |

# 10. Displaced Volume and Immersed Geometry
Displaced volume is derived from the portion of vessel solid/sealed geometry below the current support-medium surface. 26G must distinguish material occupancy, sealed hull volume, open frames, decorative cells, porous shapes and flooded compartments. A hollow sealed box can displace liquid through its exterior boundary; an open lattice displaces only its solid material volume unless another approved buoyancy provider exists.

| Geometry Source | Default Contribution |
| --- | --- |
| Solid watertight exterior cell/shape | Shape-aware solid displacement and possible enclosed-volume boundary. |
| Sealed enclosed hull volume | Air/approved gas volume contributes until downflooded or flooded. |
| Open framework | Only material solid volume; no assumed enclosed buoyancy. |
| Porous/absorbing material | Reduced/evolving effective displacement according to 26B material facet and saturation state. |
| Flooded compartment | Internal liquid removes effective enclosed buoyancy and adds contained mass. |
| Dedicated float/bladder component | Uses registered volume/pressure provider and operating state. |
| Extraordinary magical support | Uses explicit provider capability, cost and failure rules; never inferred from appearance. |

## 10.1 Shape-Aware Occupancy
Slabs, stairs, slopes, beams and authored component volumes use their registered occupancy masks or approved simplified volume proxies. The solver may aggregate neighbouring faces into patches, but it must not treat every non-cube piece as a full cube merely for convenience when that would materially change support or clearance.

# 11. Buoyancy Sampling Architecture
Nearby movement uses a bounded set of buoyancy samples generated from hull surfaces, sealed volumes and approved support providers. Samples are stable for a structural revision and may be redistributed when load, waterline or damage changes. The solver applies aggregate upward support from displaced liquid density and local gravity, then applies damping and environmental modifiers through approved models.

> **No Per-Voxel Force Rule**
>
> The system may analyse voxel-derived geometry, but it must not create a continuous force node for every cell. Samples represent regions or volume elements and are budgeted by scale band, complexity and current interaction need.

| Sample Family | Purpose |
| --- | --- |
| Volume samples | Estimate submerged volume and centre of buoyancy. |
| Surface patches | Apply drag, wave impact and planing/flow response where supported. |
| Downflooding edges | Track freeboard and water-entry risk. |
| Ground-contact probes | Detect seabed, shore, dock and launch support. |
| Provider-specific points | Apply sail, oar, propeller, thruster, anchor and tow forces at declared mounts. |
| Stability probe set | Evaluate righting response across bounded heel/trim offsets during certification. |

## 11.1 Determinism
Sample generation is derived from qualified definition IDs, local-cell addresses, structural revision and declared profile seeds. The same vessel/load/environment snapshot must produce the same certification result across supported platforms within approved tolerance. Presentation interpolation may vary without changing authoritative outcomes.

# 12. Equilibrium Waterline, Draft, Trim and List
Certification searches for an equilibrium pose where displaced support-medium mass approximately balances current vessel mass and restoring moments fall within tolerance. The search is bounded and starts from 26F reference waterline, prior solved state or a profile default.

| Output | Meaning | Player Presentation |
| --- | --- | --- |
| Actual waterline plane/surface approximation | Current equilibrium intersection for the chosen support state. | Hull overlay and waterline marker. |
| Forward/aft draft | Depth at declared forward and aft references. | Draft readout and shallow-water warning. |
| Port/starboard draft | Side immersion difference. | List indicator and load-balance hint. |
| Trim angle | Fore-aft equilibrium rotation. | Bow-down/stern-down label. |
| List angle | Persistent side equilibrium rotation. | Port/starboard list label. |
| Displacement margin | Difference between available sealed support and current load. | Buoyancy capacity band. |
| Lowest downflooding margin | Distance to critical opening/edge. | Freeboard/downflooding warning. |

## 12.1 Failure to Find Equilibrium
The solver returns an explainable blocker when no valid support pose exists within the approved search region. Common causes include insufficient displaced volume, fully flooded buoyancy spaces, invalid support medium, extreme load, unresolved geometry, physically impossible profile assumptions or a vessel already intersecting terrain in a prohibited way.

# 13. Centre of Buoyancy, Metacentric Proxy and Stability
26G does not require a full naval-architecture calculation for every creative hull. It uses centre-of-mass, centre-of-buoyancy movement under bounded heel/trim samples and a profile-specific righting proxy to classify stability.

| Stability Band | Interpretation | Default Consequence |
| --- | --- | --- |
| Strong | Restoring response remains clear across expected operating heel. | Comfortable ordinary operation. |
| Adequate | Positive restoring response within intended environment, with limited margin. | Certified with normal operating guidance. |
| Tender | Positive but weak/slow response or high sensitivity to load and sail. | Warning, reduced sail/turn limits or restricted environment. |
| Unstable | Disturbance increases heel or righting range is too small. | Operational blocker for affected profile. |
| Conditionally Stable | Stable only with declared ballast, load, provider state or active magic. | Certification binds to those conditions. |
| Unknown | Required geometry/provider evidence missing or solver budget exceeded. | No silent approval; escalate to scan/profile review. |

## 13.1 Stability Is Configuration-Specific
Certification is bound to a load envelope, not only a hull. A vessel may be certified empty, for standard cargo distribution, for a declared maximum deck load or for a specific ballast plan. Loading outside the certified envelope triggers warnings or re-certification requirements according to severity.

# 14. Reserve Buoyancy, Freeboard and Downflooding Risk
Reserve buoyancy measures sealed support remaining above the actual waterline. Freeboard and downflooding risk determine how easily waves, heel, cargo or damage can allow water into spaces that were assumed dry.

| Risk Source | Evaluation |
| --- | --- |
| Low deck edge | Compare dynamic water surface and heel envelope to declared deck/downflooding edge. |
| Open door/hatch/port | Use closure state and opening role from 26F/26B. |
| Vent or propulsion penetration | Use registered sealing and operating state. |
| Wave wash | Consume 26D wave train, local phase/impact class and vessel response. |
| Turning heel or sail heel | Evaluate dynamic orientation against critical openings. |
| Cargo overloading | Reduced freeboard and reserve capacity. |
| Ice/debris accumulation | Added high mass and possible drainage blockage. |

The system must distinguish cosmetic spray or deck wetness from authoritative downflooding. Water enters only through a valid 26B fluid interface or event. Presentation effects cannot create hidden flooding.

# 15. Dynamic Stability, Heel, Roll, Pitch and Heave
Underway vessels respond to environmental and control forces through bounded rigid-body motion. The model should communicate weight and sea state without making ordinary play nauseating or uncontrollable.

| Motion | Primary Inputs | Important Outputs |
| --- | --- | --- |
| Heave | Wave surface, buoyancy change, vessel mass and damping. | Vertical motion, deck wash risk, propeller/oar immersion. |
| Roll | Wave direction, righting capacity, sail/turn force, cargo distribution. | Heel, capsize risk, comfort and weapon/crew effects. |
| Pitch | Wave direction/period, hull length, trim and speed. | Bow/stern immersion, slamming and propulsion efficiency. |
| Yaw | Steering providers, differential thrust, wind/current and hull response. | Heading change and turning circle. |
| Sway | Current, windage, side force, rudder and docking contact. | Lateral drift and harbour control. |
| Surge | Propulsion, drag, waves/current and towing. | Forward/reverse ground speed. |

## 15.1 Motion Comfort
Authoritative vessel orientation and motion remain unchanged by accessibility settings. Player camera stabilisation, horizon lock, reduced bob, reduced roll presentation, cockpit-relative smoothing, alternative warning cues and lower visual wave amplitude may be offered. Interaction and collision use authoritative state.

# 16. Capsizing, Swamping, Recovery and Righting
Capsizing is a movement-state failure, not automatically a destroyed vessel. A vessel enters capsized or swamped state when orientation, righting capacity, downflooding, flooding or support conditions cross the active profile threshold.

| Condition | Movement Result | Owning Follow-up |
| --- | --- | --- |
| Temporary extreme heel with recovery capacity | May recover through righting response, reduced sail, load shift or wave passage. | 26G movement; crew response later. |
| Stable inverted/side state | Capsized; propulsion/control restricted according to provider orientation. | 26G state; 26L damage/flooding may escalate. |
| Large flooded mass but still supported | Swamped; low freeboard and reduced control. | 26B flooding, pumps; 26G movement. |
| Insufficient remaining support | Cannot maintain surface equilibrium. | 26L sinking/wreck transition after approved rules. |
| Ground-assisted capsize | Resting on seabed/shore with collision support. | 26H salvage/righting and 26L damage. |

## 16.1 Righting Methods
- Natural restoring response after force removal.
- Reducing sail or propulsion-induced heel.
- Pumping/dewatering compartments.
- Moving or jettisoning load through explicit transactions.
- Flooding/emptying designed ballast tanks.
- Tow, crane, capstan or shore-haul operations under 26H/26J.
- Approved magical righting provider with declared mana and risk.

# 17. Wave, Current, Tide and Wind Force Integration
26D supplies authoritative environmental fields. 26G samples them at bounded vessel positions and heights, then converts them into forces and operating constraints.

| 26D Input | 26G Use |
| --- | --- |
| Surface current vector | Drift, water-relative velocity, docking, anchor load and route ground speed. |
| Deep/current profile | Draft-dependent or specialised-provider effects where approved. |
| Wind vector by height | Sail force, windage, drift and rig operating limit. |
| Wave trains and sea state | Surface support variation, roll/pitch/heave, slamming proxy and deck wash. |
| Tide and surge | Water level, clearance, grounding/refloating, harbour windows and current changes. |
| Storm/gust class | Provider operating limit, control difficulty, forecast restriction and event input. |
| Ice concentration/motion | Route closure, drag, contact and frozen restraint. |
| Extraordinary field | Explicit magical/current force or modifier through registered interface. |

> **Environmental Truth Rule**
>
> A visually dramatic wave, gust, current or storm cannot apply gameplay force unless it resolves to an authoritative 26D state. Conversely, reduced-motion presentation cannot remove authoritative environmental force.

# 18. Hydrodynamic Resistance and Drag
Resistance is simplified into components derived from immersed geometry, water-relative velocity, orientation and provider state. Exact coefficients remain profile and material Balance Draft values.

| Resistance Component | Approximation Basis |
| --- | --- |
| Skin/friction drag | Immersed surface area proxy, roughness facet and speed. |
| Form drag | Frontal/side projected area and hull-profile factor. |
| Wave-making resistance | Displacement, waterline length proxy, speed band and depth. |
| Appendage drag | Rudders, keels, fins, damaged parts, anchors and deployed equipment. |
| Shallow-water resistance | Depth-to-draft ratio and channel constraints. |
| Damage/fouling drag | 26L damage, marine growth or debris status. |
| Air/windage drag | Above-water projected area, wind and orientation. |

The model should make broad engineering choices legible: long streamlined craft usually require less power at travel speed than blunt barges; rough stone hulls may be heavy and draggy; a raised anchor or retracted oar should reduce appendage drag; an overloaded vessel sits deeper and faces greater resistance.

# 19. Shallow Water, Grounding, Beaching and Collision
26G queries 26C terrain/bathymetry and local collision. Draft, tide, surge, heel and wave troughs determine clearance. The system must warn before unavoidable contact when the player has sufficient knowledge or instruments, but undiscovered hazards may remain uncertain.

| Contact State | Meaning |
| --- | --- |
| Clear | Approved under-keel margin for current conditions. |
| Restricted | Low margin; speed/turn/wave action may cause contact. |
| Touching | Intermittent or low-load contact; movement impaired. |
| Grounded | Meaningful support transferred to terrain; free movement unavailable. |
| Beached | Intentional/accepted shore support state suitable for some craft. |
| Stranded by tide | Grounded because water level fell; may refloat later. |
| Wedged | Contact geometry prevents ordinary refloat without tow, excavation or unloading. |

## 19.1 Collision and Damage Boundary
26G owns collision detection, impulse and movement response. 26L owns damage application, structural breach, occupant injury, cargo breakage and combat consequence. 26G emits collision evidence with relative speed, contact region, impulse band, environment and involved identities.

# 20. Floodwater, Cargo, Ballast and Moving-Mass Coupling
Movement consumes the latest authoritative distribution of contained fluid and cargo. It does not independently move inventory items through holds or solve flooding. 26B and 26L update those owners; 26G recalculates mass, list, trim, stability and movement consequences.

| Change | Movement Effect |
| --- | --- |
| Flooding low central compartment | Added mass/draft; may retain reasonable stability until reserve buoyancy falls. |
| Flooding one side compartment | List and reduced freeboard on affected side. |
| Flooding high/open space | Added mass and possible free-surface instability proxy. |
| Cargo shift to one side | List and steering/turning asymmetry. |
| Cargo moved fore/aft | Trim change and propulsion/steering immersion changes. |
| Ballast added low | Higher draft and power demand; usually better righting. |
| Ballast removed | Lower draft and greater payload margin; may reduce stability. |
| Suspended heavy load | Centre of mass acts near suspension point and may swing through owning-system state. |

# 21. Propulsion Provider Architecture
All propulsion enters through registered providers attached to valid 26F component foundations and service paths. Providers expose demand, available output, force direction, application point, operating environment, response, efficiency, faults and capability contributions.

| Provider Family | Source | Typical Strength |
| --- | --- | --- |
| Sail/Rig | Wind field and configured sail area. | Renewable travel; weather- and skill-dependent. |
| Oar/Paddle | NPC/player/golem labour or actuator cycle. | Low-tech manoeuvre and small-craft travel. |
| Paddle Wheel | Mechanical rotation and immersed wheel. | Readable river/coastal propulsion. |
| Propeller/Waterjet | Engine/mechanical/magical shaft power. | Compact controllable thrust. |
| Fuel Engine | Combustion/steam/alchemical fuel and machine system. | Reliable power with logistics, heat and maintenance. |
| Mana Drive | Mana network, rune logic or magical field. | Fantasy propulsion with charge, stability and cultural rules. |
| Creature Assist | Harnessed creature provider. | Ecological/cultural method owned with creature systems. |
| Tow/Current Assist | External vessel, animal, shore mechanism or environmental corridor. | Route-specific movement, not free propulsion. |

> **Provider Truth Rule**
>
> A decorative mast, wheel, propeller, crystal or engine housing provides no movement unless it resolves to a valid provider definition, working component instance, required attachments, operating medium and supplied source.

# 22. Sail and Rig Propulsion
Sail propulsion converts 26D wind at sail height into force based on deployed sail area, orientation, rig profile, condition and control quality. The model supports broad sailing behaviour without requiring exact aerodynamic simulation.

| Sail Input | Effect |
| --- | --- |
| True/apparent wind vector | Primary direction and available energy. |
| Sail area and deployment | Potential force and rig load. |
| Sail orientation/trim | Force direction, efficiency and heel. |
| Rig height/application point | Turning moment and stability demand. |
| Hull lateral resistance | Ability to convert side force into forward travel rather than drift. |
| Sail/rig condition | Reduced safe area, efficiency and gust tolerance. |
| Crew/control capability | Trim response and ability to reef/furl under changing conditions. |
| Ice/wetness/status | Mass and efficiency modifiers from owning systems. |

## 22.1 Points of Sail as Readable Bands
| Band | Behaviour |
| --- | --- |
| Favourable/reaching | Strong useful force with manageable side load. |
| Running/downwind | Useful force; different control and accidental-gybe risk later. |
| Close-hauled | Reduced efficiency, greater side force and skill/rig demand. |
| No-go/poor angle | Insufficient forward drive for profile; tack or use auxiliary propulsion. |
| Calm | No meaningful sail output except extraordinary providers. |
| Overpowered | Wind exceeds safe deployed-area or rig-load envelope; reef/furl or accept risk. |

## 22.2 Flexible Sail Representation Boundary
26I and presentation systems own authored sail meshes, deformation and animation. 26G owns deployed area, trim state, aerodynamic profile, force and operating limits. The runtime does not need cloth simulation to determine authoritative sail force.

# 23. Oars, Paddles and Manual Propulsion
Manual propulsion is resolved through stroke providers grouped by side, station and labour source. Visible animation events may align with authoritative cycles, but animation does not create resource-free thrust.

| Factor | Effect |
| --- | --- |
| Number of valid stations | Maximum simultaneous stroke providers. |
| Immersion/clearance | Whether blade reaches usable water without collision. |
| Labour capability and fatigue | Available cadence and duration; detailed crew model belongs to 26J. |
| Coordination | Efficiency and yaw stability. |
| Damage/blocked station | Reduced provider count or asymmetry. |
| Wave/current state | Stroke effectiveness and control. |
| Vessel mass/drag | Resulting acceleration and sustainable speed. |

Players may directly operate small-craft paddles or designated oar stations. Larger banks should use crew/task providers rather than requiring repeated player input. Accessibility options may replace timed repeated presses with hold/toggle cadence while preserving output limits.

# 24. Paddle Wheels, Propellers and Waterjets
| Provider | Required Evidence | Key Constraints |
| --- | --- | --- |
| Paddle wheel | Rotational power, valid axle, wheel geometry/area and water immersion. | Too deep, too shallow, damaged, blocked or airborne reduces output. |
| Propeller | Shaft/thrust provider, submerged clearance, rotation and direction. | Ground/debris contact, ventilation, damage and power limit. |
| Waterjet | Intake, pump/drive, water supply and nozzle path. | Blocked intake, shallow water and damage. |
| Magical impeller | Mana/field provider and declared medium interface. | Stability, charge, ward interaction and pack rules. |

Exact blade geometry may be represented by provider classes and bounded authored parameters rather than dynamically solving arbitrary voxel propellers. Player-created components must pass 26I validation or resolve to permitted modular provider definitions.

# 25. Mechanical, Fuel and Industrial Engines
Engines convert delivered mechanical, thermal, fuel or industrial power into shaft/thrust output through 08-compatible machine and network interfaces.

| Engine State | Movement Consequence |
| --- | --- |
| Offline | No output; may still add mass/drag. |
| Starting/Warming | Delayed or limited output; fuel/power transaction active. |
| Running Efficient | Output within preferred load/temperature band. |
| Overloaded | Demand exceeds approved output; shutdown/fault before destructive failure by default. |
| Fuel Starved | Output reduces or stops; no negative inventory. |
| Cooling/Exhaust Blocked | Reduced output or fault through owning machine system. |
| Damaged/Misaligned | Reduced maximum output, efficiency or vibration/load event. |
| Emergency Output | Temporary higher band with explicit risk, cost and later maintenance. |

26G reads approved provider output and applies force. It does not directly burn fuel, consume items or modify machine inventories; those transactions remain authoritative in automation/machine services.

# 26. Mana Drives, Rune Propulsion and Magical Movement
Magical propulsion extends, rather than bypasses, the same provider architecture. A mana drive declares source, field type, application point, force envelope, environmental compatibility, stabilisation needs, overload behaviour and fallback.

| Magical Provider | Example Function | Boundary |
| --- | --- | --- |
| Mana Impeller | Converts mana into water-relative thrust. | Requires medium interface and mana supply. |
| Current Binder | Reduces drift or aligns vessel with registered current corridor. | Cannot create perfect station-keeping without cost/capability. |
| Wind Rune Rig | Improves sail trim or captures limited wind opportunity. | Does not invent wind unless provider explicitly creates it at cost. |
| Buoyancy Rune | Provides additional support capacity. | Must declare force, mana demand, failure and certification condition. |
| Stability Ward | Adds active righting/damping response. | Certification becomes conditional on active supply. |
| Phase/Slip Drive | Extraordinary late provider for approved environments. | Does not imply unrestricted teleportation, skyship or submarine scope. |

> **No Unpriced Magic Rule**
>
> Magic may violate ordinary material expectations only through an explicit capability provider with source, cost, limits, presentation, failure and save behaviour. A glowing block or high-rarity material does not automatically float or propel a vessel.

# 27. Hybrid Propulsion, Power Arbitration and Failure
A vessel may combine multiple providers. The movement controller resolves their forces, available power, user intent and operating constraints without collapsing them into one cosmetic speed stat.

| Hybrid Case | Resolution |
| --- | --- |
| Sail plus engine | Player may prioritise fuel saving, maximum speed, manoeuvre or emergency output. |
| Oars plus sail | Oars support low-speed turning, harbour operation and calm conditions. |
| Twin engines | Differential thrust may steer; one-engine failure creates asymmetry. |
| Mana assist plus mechanical drive | Mana boosts output or stabilises provider within declared limits. |
| Tow plus own propulsion | Tow controller coordinates tension and prevents conflicting maximum thrust. |
| Multiple power consumers | Existing network arbitration allocates power; 26G reads delivered provider output. |

## 27.1 Provider Priority Modes
- Manual player allocation.
- Profile default: economy, balanced, manoeuvre or maximum output.
- NPC/AI plan request bounded by permissions and capability.
- Emergency override with explicit warning and owning-system risk.
- Automatic shutdown when output would violate non-waivable safety or provider operating conditions.

# 28. Fuel, Mana, Maintenance and Heat Interfaces
| Concern | Owner | 26G Input/Output |
| --- | --- | --- |
| Fuel items and consumption | Items/automation/recipe transaction services | Receives delivered engine output/endurance; emits demand. |
| Mana storage and flow | Magic/mana network | Receives available charge/output and stability; emits demand/overload context. |
| Mechanical power | Automation network | Receives shaft/rotational power. |
| Heat/cooling | Machine/environment owner | Receives provider operating band; emits movement airflow/water-cooling context if needed. |
| Maintenance/condition | Component/damage owner | Receives efficiency/output cap; emits usage cycles and overload evidence. |
| Noise/signature/emissions | Presentation/ecology/faction systems | Emits provider activity events and signature bands. |

# 29. Steering and Control Architecture
Steering is generated by one or more providers and interpreted through a Control Profile. The profile maps helm intent to permitted provider actions, response rates and assistance.

| Control Input | Possible Provider Response |
| --- | --- |
| Yaw/turn command | Rudder angle, differential thrust, oar asymmetry, thruster or sail trim. |
| Throttle/drive command | Provider output request within network and operating limits. |
| Reverse/brake command | Reverse thrust, paddle/oar braking, anchor emergency request or sail reduction. |
| Lateral/strafe command | Bow/stern thruster, side oar, tow or extraordinary provider if available. |
| Hold heading | Closed-loop provider adjustment using compass/gyro/rune and capability. |
| Hold position | Combined propulsion/anchor/current compensation only when certified. |
| Reef/furl/deploy | Sail-state command through rig provider and crew/task availability. |

# 30. Rudders, Fins and Hydrofoils
Rudders and related surfaces require valid foundation, orientation, water immersion and water-relative flow. At very low speed they may provide little control unless propwash, tow flow or special design applies.

| Factor | Control Effect |
| --- | --- |
| Surface area/profile | Available side force. |
| Distance from centre of mass | Turning moment. |
| Water-relative speed | Control authority. |
| Angle and limit | Turn response and drag. |
| Immersion | Reduced or lost authority if lifted clear by waves/trim. |
| Damage/jam | Reduced range, fixed angle or no response. |
| Multiple rudders | Combined or independent provider group. |
| Hydrofoil profile | Advanced lift/drag behaviour only through approved provider definition and prototype evidence. |

# 31. Differential Thrust, Oar Steering and Auxiliary Control
| Method | Strength | Typical Limitation |
| --- | --- | --- |
| Twin/split propulsion | Strong low-speed yaw and redundancy. | Requires independent providers and power. |
| Oar/paddle asymmetry | Accessible small-craft turning. | Labour and scale limited. |
| Sail balance | Can alter heading and reduce rudder demand. | Wind-dependent and less direct. |
| Bow/stern thruster | Precise harbour control. | Power intensive; not primary cruising propulsion. |
| Drag device/sea anchor | Reduces drift or aligns bow to sea. | Limited movement and high line/load demand. |
| Magical directional ward | Precise or extraordinary control. | Mana/stability/culture progression requirements. |

# 32. Helm, Control Response and Assisted Handling
A Helm Station or approved control interface binds an authorised controller to vessel movement commands. Control response depends on provider state, vessel inertia, water flow, speed, steering authority, delay and assistance profile.

| Assistance | Effect | Truth Boundary |
| --- | --- | --- |
| Heading hold | Maintains selected heading using available providers. | Cannot exceed provider authority or ignore damage. |
| Speed hold | Requests output to maintain water/ground-speed target. | Consumes real fuel/power and yields to limits. |
| Docking assist | Displays vectors and may blend low-speed providers. | Does not teleport or suppress collision. |
| Sail trim assist | Chooses safe/effective trim within known rig capability. | Requires knowledge/crew/provider capability. |
| Shallow-water warning | Uses charts, soundings and current depth query. | Confidence reflects knowledge and sensor limits. |
| Stability governor | Limits turns/sail/output when current envelope is exceeded. | May be disabled only where profile/permission permits; warnings persist. |
| Simplified control mode | Maps fewer inputs to combined provider intent. | Same authoritative vessel limits. |

# 33. Anchors and Holding Ground
Anchors are restraint providers, not binary freeze buttons. Holding depends on anchor type, deployed state, line/chain scope, seabed suitability, depth, vessel load, current, wind, waves and damage.

| Anchor Input | Use |
| --- | --- |
| Anchor provider class and mass/shape | Base holding capability. |
| Seabed substrate/slope | Holding suitability from 26C/blocks. |
| Scope and deployment depth | Line geometry and effective holding. |
| Vessel environmental load | Wind, current, waves and yaw. |
| Multiple anchors | Combined restraint and orientation. |
| Damage/fouling | Reduced retrieval or holding. |
| Windlass/capstan/crew | Deployment/retrieval time and capability. |
| Drag state | Anchor moves across seabed; vessel drifts and event is visible. |

A simplified mode may treat suitable anchoring as a stable restraint band, but severe weather and inadequate ground can still produce drag according to world settings and profile. Peaceful settings may reduce or disable anchor drag without changing ordinary navigation logic.

# 34. Mooring, Lines, Bollards and Harbour Restraint
Mooring binds vessel attachment sockets to world or other-vessel sockets through line providers. Lines expose length, elasticity band, strength, connection permissions and current tension.

| Mooring Mode | Purpose |
| --- | --- |
| Single line | Temporary restraint with rotation/drift. |
| Bow/stern lines | Control longitudinal position. |
| Spring lines | Limit fore-aft surge. |
| Breast lines | Limit lateral movement. |
| Buoy mooring | Hold in open water through mooring infrastructure. |
| Dry-dock/haul restraint | Movement fully disabled under 26H work state. |
| Magical tether | Explicit mana/ward restraint provider. |

## 34.1 Line Simulation Boundary
Lines may use simplified constraints and visual curves rather than full rope physics. Authoritative state tracks endpoints, permitted length, tension/load band and failure status. Presentation cannot show a slack line while gameplay treats it as critically taut without an accessibility-safe cue.

# 35. Towing, Pushing and Connected-Vessel Movement
Towing creates a temporary movement relationship between independently identified Vessel Instances or between a vessel and world mechanism. Identity, cargo and local grids remain separate.

| Tow Role | Responsibilities |
| --- | --- |
| Tow Provider | Supplies force, route intent and maximum tension. |
| Towed Vessel | Contributes mass, drag, steering response and safety constraints. |
| Tow Connection | Defines sockets, line length, elasticity, strength and permissions. |
| Controller | Coordinates speed, turns, stopping distance and obstacle clearance. |
| Distant Route Model | Uses combined tow performance and route restrictions. |
| Failure Event | Line parting, collision or loss of control forwarded to owning systems. |

> **No Identity Merge Rule**
>
> Towing, lashing or pushing does not merge two commissioned vessels into one Vessel Instance. Permanent modular joining requires a separate 26H/26F recommissioning or future nested-vessel contract.

# 36. Docking, Undocking, Launching and Hauling States
| Operation | Required Conditions |
| --- | --- |
| Launch | Commissioned vessel, cleared support/seam, adequate water/clearance and 26H release transaction. |
| Undock | Mooring released or transferred, route clear, controller authorised and movement certified. |
| Dock approach | Low-speed control, clearance, berth permission and contact profile. |
| Docked | Approved contact/restraint and movement mode transitioned atomically. |
| Beach | Permitted hull/profile, shore geometry, speed and tide window. |
| Refloat | Adequate water level/support, cleared contacts and propulsion/tow capability. |
| Haul out | Slipway/dry-dock/shore mechanism with supported path and 26H workflow. |
| Lock/canal transit | Clearance, gate state, water-level procedure and route permission. |

Docking assistance may provide ghost vectors, distance bands, predicted drift and suggested throttle/turn. It must not suppress collision or automatically claim berth ownership.

# 37. Navigation Knowledge, Charts and Instruments
Navigation information is knowledge-aware. The world contains exact geography and environmental truth, but the player sees only what has been observed, charted, reported, instrumented or shared.

| Knowledge Source | Possible Output |
| --- | --- |
| Direct observation | Visible coast, landmarks, immediate depth, weather and hazards. |
| Sounding line/pole | Local depth and substrate confidence. |
| Compass/rune compass | Heading/reference direction. |
| Log/speed instrument | Water-relative or ground-relative speed according to instrument. |
| Tide table/port signal | Expected water-level windows with confidence. |
| Weather forecast | Wind/storm/visibility envelope from 26D knowledge services. |
| Chart/map | Known coast, depth bands, channels, routes, hazards and ports. |
| NPC navigator/pilot | Capability-based route advice and local knowledge. |
| Magic survey | Explicitly revealed fields according to spell/device limits. |

## 37.1 Uncertainty
Charts and forecasts store confidence, age, source and coverage. World changes, storms, new wrecks, dredging, ice and magical events may reduce accuracy. Navigation UI must distinguish known safe clearance, predicted clearance, rumoured hazard and unknown water.

# 38. Route Graphs, Clearance and Local Path Planning
26C supplies maritime route candidates and geographic constraints. 26G evaluates whether the current certified vessel/load can use them.

| Route Constraint | Evaluation |
| --- | --- |
| Minimum depth | Current draft plus safety margin, tide/surge and wave trough allowance. |
| Width/turning room | Vessel dimensions, tow geometry and steering performance. |
| Vertical clearance | Mast/superstructure height, bridge/gate state and tide. |
| Current/wind exposure | Provider capability, endurance and environment limits. |
| Ice/reef/shoal hazard | Capability, knowledge confidence and route state. |
| Port/lock permission | Faction, berth, schedule and infrastructure owner. |
| Fuel/mana/endurance | Expected demand, reserve and alternate refuge. |
| Storm/sea-state window | Certified band and forecast risk. |

## 38.1 Local Avoidance
Near-field navigation uses bounded obstacle, depth and collision queries. It may suggest or execute avoidance only within the active control/autopilot permission. It must not excavate terrain, move other vessels or ignore ownership to preserve a route.

# 39. Player Navigation, Assisted Control and Autopilot
| Mode | Player Role | System Role |
| --- | --- | --- |
| Direct Helm | Continuous throttle/steering/sail commands. | Applies commands within provider limits. |
| Command Helm | Set heading, speed, waypoint or sail mode. | Closed-loop controller executes with warnings. |
| Route Assist | Select known destination/route. | Plans compatible legs and shows blockers/uncertainty. |
| Autopilot | Authorised controller follows active plan. | Responds to known hazards and certified limits; requests intervention when uncertain. |
| Emergency Assist | Stabilise, stop, reduce sail, avoid immediate collision or hold heading. | Only when capability and settings permit; logs action. |
| Spectator/Passenger | No control authority. | Receives route, hazard and arrival information. |

Autopilot is a convenience and accessibility system, not omniscience. It cannot route through undiscovered exact hazards unless an approved sensor detects them, cannot guarantee survival in exceptional events and cannot exceed current propulsion, steering, clearance or permission.

# 40. NPC Navigation Capability Interface
26G defines the capability request; 26J defines actual crew jobs, skill, staffing and schedules.

| Capability | 26G Requirement |
| --- | --- |
| Helm operation | Authorised agent can submit bounded control commands. |
| Sail handling | Provider state can change at permitted rate/complexity. |
| Engine operation | Required station/task and machine permissions available. |
| Pilotage | Local route/port knowledge and clearance confidence. |
| Open-water navigation | Chart/instrument/skill capability for route plan. |
| Storm response | Ability to reef, alter course, anchor or seek shelter within warning time. |
| Docking | Low-speed control and berth/mooring task capability. |
| Damage response | 26L/26J capability to pump, repair or abandon; 26G exposes urgency. |

# 41. Sea-Worthiness, Environment Bands and Operational Limits
Sea-worthiness is a capability envelope, not a single quality score. Certification records the environments and configurations in which the vessel has acceptable support, stability, control, endurance and clearance.

| Environment Band | Example Expectations |
| --- | --- |
| Sheltered Water | Low waves/current, nearby refuge, limited fetch. |
| River/Canal | Current, bends, shallow draft, locks/bridges and bank clearance. |
| Coastal | Tide, surf, moderate sea state, harbour approach and short refuge interval. |
| Open Sea | Sustained waves/swell, navigation endurance, reserve buoyancy and redundancy. |
| Storm-Restricted | May operate only below defined storm/sea-state classes or with conditions. |
| Ice-Prone | Hull/contact, propulsion, steering and route capability for declared ice band. |
| Magically Disturbed | Ward/stability or material requirements for extraordinary fields. |
| Underwater/Submersible | Deferred dedicated profile; surface-vessel certification does not imply pressure-hull capability. |

## 41.1 Operational Limits
- Maximum certified mass/load envelope.
- Permitted centre-of-mass/load-distribution envelope.
- Minimum reserve buoyancy/freeboard band.
- Maximum sail area or propulsion output by conditions.
- Maximum sea state/wind/current/ice band.
- Minimum under-keel and overhead clearance margins.
- Required active providers, ballast, pumps, wards or crew capabilities.
- Restricted cargo, open closures or external loads.

# 42. Operational Certification and Re-Certification
Certification binds a report to Vessel Instance ID, structural revision, load revision/envelope, provider revisions, registry snapshot, environment profile and validation profile.

| Certification Layer | Checks |
| --- | --- |
| Support Certification | Adequate displacement/equilibrium in intended support medium. |
| Stability Certification | Righting, list/trim, reserve buoyancy and downflooding envelope. |
| Control Certification | At least one permitted helm path and sufficient steering/braking for profile. |
| Propulsion Certification | Required movement/endurance provider or approved tow-only classification. |
| Clearance Certification | Draft, dimensions and route/environment constraints declared. |
| Operational Systems Certification | Required closures, pumps, anchors, navigation and conditional providers. |
| Environment Certification | Approved sea-worthiness bands and restrictions. |
| Evidence Certification | All required tests, reason codes, accepted warnings and provenance retained. |

## 42.1 Re-Certification Triggers
- Structural revision or hull opening change.
- Material substitution affecting mass, sealing or provider foundation.
- Major load outside certified envelope.
- Ballast-plan change.
- Provider installation/removal or control-path change.
- Flooding, persistent list/trim or major damage.
- Registry/schema migration affecting relevant calculations.
- Intended environment/use change.
- Accepted warning promoted to blocker by updated validation profile.

## 42.2 Warning Acceptance
Waivable warnings require authorised acceptance, explanatory text, affected capabilities and vessel-history record. Non-waivable blockers include conservation mismatch, unresolved motion authority, missing critical schema, no equilibrium, severe instability or an invalid world/vessel-frame state.

# 43. Movement Commands, Authority and Event Flow
| Command | Validation | Result Event |
| --- | --- | --- |
| RequestCertification | Permission, immutable snapshot and compatible state. | CertificationStarted/Completed/Failed. |
| SetHelmIntent | Control permission, active helm and operational state. | HelmIntentChanged or reason code. |
| SetProviderMode | Provider permission, supply and state. | ProviderModeChanged/Fault. |
| DeployAnchor | Depth, provider, line and seabed query. | AnchorDeployed/Holding/Dragging. |
| ConnectMooring | Socket, line, permission and distance. | MooringConnected/Rejected. |
| CreateTow | Both identities, sockets, permissions and compatibility. | TowConnected/Failed. |
| SetNavigationPlan | Knowledge, route compatibility and authority. | PlanAccepted/Blocked/Updated. |
| Undock/Launch | Restraint release, clearance and certification. | VesselUnderway or reason code. |
| EmergencyStop | Available providers/restraints and authority. | EmergencyResponseStarted. |

> **Command Rule**
>
> Clients, UI, AI and scripts submit commands. They do not write vessel transforms, velocities, certification, anchor state or provider output directly. Every accepted state change emits a traceable event with owning identity and revision.

# 44. Occupants, Moving Interiors and Frame Transfer
26F owns the Vessel Frame and membership. 26G updates the world transform and exposes motion. Character, item and entity systems maintain local positions and transfer at controlled boundaries.

| Case | Rule |
| --- | --- |
| Standing/walking aboard | Character remains in Vessel Frame local coordinates; movement composes with vessel transform. |
| Jumping/falling aboard | Relative velocity includes vessel motion and local character action. |
| Boarding/disembarking | Atomic spatial-frame transfer at valid contact/portal/ladder boundary. |
| Man overboard | Transfer to world/water frame with inherited velocity; 26E owns swimming/rescue. |
| Loose physical object | Owning physics/item system uses vessel-relative state and transfer rules. |
| Nested small craft/davit load | Remains attached cargo/component unless separately commissioned and launched. |
| Teleport/portal | Owning system must resolve spatial frame and velocity policy explicitly. |

## 44.1 Moving-Interior Safety
No occupant may simultaneously belong to world and Vessel Frame authorities. Reconnection, promotion, collision recovery and emergency relocation use stable safe-local-position records. Visual smoothing cannot conceal an unresolved membership conflict.

# 45. Multiplayer Replication, Reconnection and Prediction
| Authority Concern | Requirement |
| --- | --- |
| Motion owner | Server/authoritative host owns vessel movement and constraints. |
| Helm input | Client sends timestamped intent; server validates permission and state. |
| Prediction | Optional bounded client prediction for control feel; never persistent truth. |
| Moving interiors | Replicate Vessel Frame transform plus local entity state. |
| Provider UI | Replicate authoritative output/fault summary and local presentation events. |
| Certification | Server-run or server-verified deterministic report bound to revisions. |
| Reconnection | Restore vessel identity, frame membership, route, restraint and safe local pose. |
| Late join | Receive compact current snapshot plus relevant history/revision hashes. |
| Conflict | Commands rejected with reason code; no last-write-wins transform edits. |

# 46. Simulation LOD and Distant Route Travel
Distant movement uses certified capabilities and route/environment summaries. It must not produce outcomes impossible for the locally simulated vessel configuration.

| Local Truth | Distant Representation |
| --- | --- |
| Maximum/sustainable speed | Leg travel-rate band modified by wind/current/sea state. |
| Draft/clearance | Route compatibility and tide-window requirement. |
| Endurance/fuel/mana | Consumption per leg and reserve checks. |
| Sea-worthiness | Allowed environmental state and diversion/hold logic. |
| Control/navigation capability | Route reliability, docking/arrival and uncertainty. |
| Damage/flooding | Performance penalty and escalation/event risk through owning systems. |
| Tow state | Combined route capability and tension/turn restrictions. |
| Cargo/occupants | Persistent manifests and load envelope. |

## 46.1 Promotion
Before promotion, the system resolves route position to a valid local world transform, samples current 26D conditions, reconstructs motion/provider state, loads relevant chunks and verifies no conflicting occupancy. Promotion cannot place the vessel inside terrain, another vessel or a closed structure. Failure produces a hold/quarantine/diversion state rather than destructive relocation.

## 46.2 Demotion
Demotion stores route leg, progress, water-relative/ground-relative motion summary, active provider mode, endurance, environment snapshot, restraint/tow state and non-demotable blockers. The local transform remains recoverable for rollback and debugging.

# 47. Persistence, Save Migration and Recovery
| Persistent Field Group | Examples |
| --- | --- |
| Identity/revisions | Vessel ID, Movement Record ID, structural/load/provider/certification revisions. |
| Motion | World transform, linear/angular velocity, movement mode and prior safe state. |
| Hydrostatic summary | Actual waterline, draft, trim, list, displacement and stability band. |
| Providers | Active modes, requested output, deployment, faults and source bindings. |
| Restraints | Anchor, mooring, tow, dock, beach or haul relationship IDs. |
| Navigation | Plan, route leg, waypoints, confidence, destination and controller. |
| LOD | Current fidelity mode, distant progress and promotion data. |
| Evidence | Certification report IDs, accepted warnings, reason trace and registry hash. |
| Recovery | Last safe transform/state, journal transaction and quarantine payloads. |

## 47.1 Interrupted Save/Transition
Movement-state, frame-membership, restraint and route transitions use journaling or atomic save groups. Recovery must restore one coherent state: for example, a vessel is either moored or underway, attached or detached, local or route-demoted, never half of both.

## 47.2 Missing Expansion/Pack
If a required provider, material facet, schema or validation profile is unavailable, the vessel is quarantined or immobilised with payload preserved. Missing optional presentation assets may use approved fallback; missing gameplay capability may not be silently substituted unless 25C fallback contracts explicitly permit it.

# 48. Godot/Summer Engine Technical Architecture
The implementation should remain engine-native but data-authoritative. Suggested service boundaries are architectural guidance, not immutable class names.

| Service | Responsibility |
| --- | --- |
| VesselMovementService | Own active Movement Records, commands, state transitions and authoritative integration. |
| HydrostaticAnalysisService | Build samples/caches and solve equilibrium/stability for locked snapshots. |
| VesselForceService | Aggregate buoyancy, drag, environment, propulsion, steering and restraint forces. |
| PropulsionProviderService | Resolve provider definitions, supplied output, force and faults. |
| NavigationService | Route compatibility, local plan, knowledge confidence and distant transit. |
| VesselConstraintService | Anchor, mooring, towing, docking and ground-contact constraints. |
| VesselCertificationService | Run profiles, reason codes, evidence and recertification checks. |
| VesselLODService | Promote/demote and reconcile local/route state. |
| SpatialFrameService | Compose Vessel Frame/world transforms and membership handoffs. |
| Registry/Schema Services | Resolve qualified definitions, facets, relationships and migrations. |

## 48.1 Godot Node Boundary
- One active vessel may use one primary physics body/transform owner plus bounded collision/interaction representations.
- Voxel cells remain compact data and generated collision/mesh products; they are not individual Nodes or RigidBody3D instances.
- Provider and sample records are data objects/resources, not mandatory scene-tree nodes.
- Physics callbacks enqueue authoritative commands/events; gameplay registries and saves are not mutated from uncontrolled callbacks.
- Background jobs may prepare geometry, samples, routes and reports, then commit on the authoritative thread with revision checks.

## 48.2 Summer Engine Rule
Summer Engine may generate scaffolding, tests, importers, editor panels and bounded implementation tasks. Every change must name source documents, owned files, validation commands, expected evidence, rollback path and prohibited source-of-truth duplication according to 25L.

# 49. Performance Budgets and Scalability Levers
| Budget | Primary Lever |
| --- | --- |
| Hydrostatic solve time | Sample count, cached patches, bounded iterations and asynchronous preview. |
| Active vessel physics | Tick rate by proximity/importance, aggregate forces and sleep/restraint states. |
| Collision complexity | Generated compound/convex proxies and interaction-detail bands. |
| Environmental queries | Shared regional samples, batched wave/current/wind queries and temporal caching. |
| Provider count | Provider grouping, inactive-provider sleep and network summaries. |
| Moving interiors | Interest management by vessel frame and local area. |
| Networking | Snapshot compression, local-frame replication and event-driven provider state. |
| Distant traffic | Route transit and regional summaries rather than hidden physics. |
| Certification | Locked snapshot jobs and reuse until relevant revision changes. |

## 49.1 Redesign Triggers
- Certification result changes across repeated identical snapshots outside tolerance.
- One Band 1 vessel cannot meet packaged-build frame budget on target hardware.
- Moving-interior replication requires per-cell network state.
- Common creative hulls need excessive manual sample correction.
- Route promotion frequently intersects terrain or loses occupants/cargo.
- Docking becomes unusable without disabling real collision.
- Environmental queries dominate frame time despite batching.
- Far-route outcomes regularly contradict local capabilities.

# 50. Helm UI, Inspection, Feedback and Accessibility
## 50.1 Normal Helm View
- Heading and selected course.
- Water-relative and ground-relative speed where known.
- Throttle/provider mode and available output.
- Wind/current relation when relevant and known.
- Depth/under-keel confidence when instrumented.
- Trim/list/stability warning only when decision-relevant.
- Anchor/mooring/tow/docking state.
- Route waypoint, ETA band and hazard warning.

## 50.2 Shipwright Movement Inspection
| Panel | Information |
| --- | --- |
| Floatation | Mass, displaced support, waterline, draft and reserve buoyancy bands. |
| Balance | Centre-of-mass overlay, list/trim cause groups and ballast suggestions. |
| Stability | Righting band, safe heel envelope and conditional providers. |
| Propulsion | Providers, source, output, force direction, endurance and faults. |
| Steering | Providers, low/high-speed authority and estimated turning response. |
| Clearance | Draft, height, width and selected route restrictions. |
| Environment | Certified water/sea/wind/current/ice bands. |
| Certification | Blockers, warnings, accepted risks, exact revisions and evidence. |

## 50.3 Accessibility
- Controller-complete helm, inspection, route planning, anchor and docking flows.
- Simplified steering/throttle mode and hold/toggle options.
- Non-colour indicators for port/starboard, wind direction, severity and provider faults.
- Reduced motion, horizon stabilisation, lower camera roll, reduced shake and alternative sea-state cues.
- Audio captions and directional text for collision, surf, anchor strain, engine fault and warnings.
- Timing assistance for sail/oar/manual actions without changing output ceilings.
- Configurable numeric detail: plain-language bands by default, advanced values on demand.
- Autopilot and docking assistance that respect actual capability and knowledge.

# 51. Registry Facets, Relationships and Capabilities
## 51.1 Required Definition Families
| Definition Family | Example Qualified-ID Pattern |
| --- | --- |
| Movement Profile | leyforge.core.vehicle.movement_profile.<path> |
| Operational Certification Profile | leyforge.core.vehicle.certification_profile.<path> |
| Propulsion Provider | leyforge.core.vehicle.propulsion_provider.<path> |
| Steering Provider | leyforge.core.vehicle.steering_provider.<path> |
| Restraint Provider | leyforge.core.vehicle.restraint_provider.<path> |
| Navigation Instrument | leyforge.core.item.navigation.<path> |
| Route/Environment Capability | leyforge.system.capability.maritime.<path> |
| Validation Profile | leyforge.system.validation_profile.vessel_movement.<path> |
| Reason Code | leyforge.system.reason.vessel_movement.<path> |
| Technical Interface | leyforge.system.interface.runtime.vessel_movement.<path> |

## 51.2 Extension Facets
| Facet | Canonical Fields |
| --- | --- |
| vessel_movement | movement profile, scale band, fidelity, damping, supported media and limits. |
| vessel_hydrostatic | support-volume source, sample policy, stability profile and downflooding references. |
| vessel_propulsion | provider family, source, force model, application, demand, limits and fallback. |
| vessel_steering | control axis, authority curve, operating flow/speed, response and failure. |
| vessel_restraint | anchor/mooring/tow class, socket, load, environment and state. |
| vessel_navigation | instrument outputs, confidence, route constraints and knowledge requirements. |
| vessel_certification | required capabilities, thresholds, waivers, evidence and recertification triggers. |

## 51.3 Important Relationships
- Vessel Class REQUIRES Movement Profile.
- Movement Profile REQUIRES or ACCEPTS Propulsion/Steering/Restraint capability providers.
- Provider ATTACHES_TO Component Role/Foundation.
- Provider CONSUMES Power, Fuel, Mana, Labour or Environment opportunity.
- Provider PRODUCES thrust, control, restraint or support capability.
- Certification Profile TESTS capabilities and suitability against environment/use.
- Route REQUIRES clearance, knowledge, endurance and environment capabilities.
- Movement Record INSTANCE_OF Movement Profile and BELONGS_TO Vessel Instance.
- Certification Report VALIDATES exact structural/load/provider/registry revisions.
- Distant Transit Record DERIVED_FROM Movement Record and Navigation Plan.

## 51.4 Capability Candidates
| Capability | Meaning |
| --- | --- |
| maritime.support.surface | Can maintain approved surface equilibrium. |
| maritime.stability.sheltered/coastal/open_sea | Meets righting/freeboard envelope for band. |
| maritime.propulsion.manual/sail/mechanical/mana | Has working provider family. |
| maritime.control.low_speed/cruise/reverse | Has required manoeuvre authority. |
| maritime.restraint.anchor/moor/tow | Can perform restraint relationship. |
| maritime.clearance.shallow/low_bridge/narrow_channel | Meets declared dimensional envelope. |
| maritime.navigation.local/coastal/open_water | Has instruments/knowledge/control support. |
| maritime.environment.ice/storm/magic | Meets specialised operating condition. |
| maritime.lod.route_transit | Can demote safely to route simulation. |

# 52. Validation, Reason Codes and Evidence
| Validation Layer | Examples |
| --- | --- |
| Schema/reference | Missing provider definition, invalid facet, unknown capability or bad relationship. |
| Hydrostatic | No equilibrium, insufficient displacement, unstable, low freeboard or unresolved volume. |
| Load | Mass provider missing, load outside envelope, unsecured critical cargo or inconsistent revision. |
| Provider | No propulsion, no control, invalid mount, no power source or operating-medium mismatch. |
| Clearance | Draft/depth conflict, bridge/mast conflict, berth width or route turn conflict. |
| Restraint | Anchor unsuitable, mooring socket invalid, tow incompatibility or dock permission. |
| Authority | No helm, route, provider, anchor, tow or certification permission. |
| Persistence/LOD | Frame conflict, promotion collision, unsupported schema or recovery mismatch. |
| Performance | Scale/sample/provider budget exceeded. |
| Accessibility/presentation | Critical state lacks non-colour/text/caption or controller path. |

## 52.1 Evidence Bundle
- Exact Vessel Instance, structure/load/provider revisions and registry snapshot.
- Hydrostatic sample/cache hash and solver profile.
- Mass/displacement/centre summaries and stability probes.
- Provider availability, supply and control graph.
- Environment/route profile used for certification.
- Reason codes with affected local regions/components.
- Accepted warnings and authority identity.
- Packaged-build prototype/test IDs and performance trace where required.

# 53. Prototype Laboratories and Acceptance Tests
| Lab | Purpose | Minimum Evidence |
| --- | --- | --- |
| Floatation Lab | Test sealed/open/porous/multi-hull shapes and waterline solve. | Repeatable equilibrium, highlighted failure and volume conservation. |
| Load and Ballast Lab | Move cargo, fluid and ballast through known positions. | Predictable draft/list/trim/stability changes. |
| Wave Basin Lab | Apply 26D wave trains and currents to standard hulls. | Stable motion, readable response and bounded cost. |
| Sailing Lab | Test wind angles, reefing, rig height and hull lateral response. | Useful point-of-sail bands and no free thrust. |
| Propulsion Bench | Compare oar, paddle wheel, propeller, engine and mana provider. | Demand/output/force/fault trace. |
| Steering Basin | Measure low/high-speed turning, reverse and differential control. | Repeatable authority bands. |
| Harbour Lab | Dock, moor, anchor, tow and launch in constrained geometry. | Controller-complete flow and safe atomic states. |
| Shallow/Channel Lab | Vary draft, tide, bridge and route width. | Correct route clearance and grounding/refloat. |
| Moving Interior Lab | Players/NPCs/items aboard under motion and reconnection. | No frame duplication, ejection or state loss. |
| LOD Route Lab | Demote, transit, interrupt and promote across weather/route changes. | Equivalent capabilities and valid local placement. |
| Multiplayer Helm Lab | Latency, handoff, permission and conflicting command tests. | One authoritative motion truth and readable rejection. |
| Recovery Lab | Interrupt certification, docking, tow, promotion and save. | One coherent recovered state. |

## 53.1 Minimum Acceptance Rules
- A sealed simple raft/barge floats and responds without manual physics authoring.
- An open lattice does not receive fake enclosed buoyancy.
- Adding known mass produces monotonic expected draft/displacement response.
- Asymmetric load produces correct list direction and clear reason.
- A top-heavy narrow vessel fails or restricts stability certification predictably.
- Sails produce no thrust in calm and directionally sensible thrust in wind.
- Engines cannot produce output without authoritative source delivery.
- Rudders lose authority at unsuitable flow unless another provider supplies it.
- Grounding responds to actual draft, depth and tide.
- Anchor/mooring/tow states never duplicate or delete vessel identity.
- Distant transit cannot traverse an uncertified route/clearance silently.
- All critical workflows function with controller and non-colour cues.

# 54. Production Classification and Set 25 Integration
| Set 25 Contract | 26G Deliverable |
| --- | --- |
| 25B identity/ownership | Qualified movement/provider/profile IDs; separate definitions, Movement Records and generated bindings. |
| 25C schemas/relationships/capabilities | Movement, hydrostatic, propulsion, steering, restraint, navigation and certification facets with provider graph. |
| 25D packs/migration | Expansion dependencies, schema versions, missing-provider quarantine, migration and rollback. |
| 25E validation/evidence | Deterministic certification, seed/route QA, packaged performance, save, multiplayer and accessibility gates. |
| 25F-25G classification/dependency | Classify movement features by production capability and dependency order. |
| 25H-25J physical catalogues/chains | Declare maritime block/item/provider/resource/recipe extensions without editing those owners here. |
| 25K asset/event manifests | Declare sails, wake, controls, instruments, sockets and movement events as presentation requirements. |
| 25L task contract/audit | Create bounded Godot/Summer tasks with source, files, validation, evidence and rollback. |

## 54.1 Admission Dependencies
- Movement/provider domain or vehicle extension decision recorded under 25B-25C governance.
- All critical block/material mass and sealing facets admitted.
- 26B/26D runtime query interfaces specified.
- 26F Vessel Instance and local-grid schema admitted.
- Operational certification schemas and reason codes registered.
- Missing-pack and save-removal behaviour approved.
- Prototype constants remain marked Balance Draft until evidence gate.

# 55. Main-Document, Forge and Content Integration Matrix
| Owner | Required Future Amendment |
| --- | --- |
| 00 Master Bible | Add constructed maritime travel and water-world civilisation as approved expansion pillar expression. |
| 01 Core Loop | Add build/commission/load/navigate/trade/respond/repair maritime loops. |
| 02 Progression | Add seamanship, navigation, ship handling, engineering and certification knowledge without class lock. |
| 03 Blocks | Add vessel material facets, propulsion/control/restraint components and maritime instruments. |
| 04 Items | Add charts, instruments, rigging, anchors, fuel parts, repair and navigation equipment. |
| 05 Recipes | Add provider assembly, rigging, engine, anchor, instrument and certification-support chains. |
| 06 Resources | Add sailcloth, rope, timber, pitch/sealant, marine alloys, fuel and mana-drive materials. |
| 07 NPC/Village | Add later crew/pilot/shipwright use through 26J; no duplication in 26G. |
| 08 Automation | Expose delivered power, shafts, fuel, controls, maintenance and vessel network ports. |
| 09 Magic | Expose mana drives, buoyancy/stability wards and navigation magic as priced providers. |
| 11 Worldgen | Consume depth, route, harbour and environmental field interfaces. |
| 12 Structures | Support docks, locks, bridges, canals and mooring structures. |
| 15 Quests/Events | Expose voyages, groundings, storms, rescue, route discovery and delivery objectives. |
| 16 Combat | Consume movement/collision/load events; naval combat remains 26L. |
| 17 UI/UX | Add helm, movement inspection, charts, route planning and accessibility. |
| 18 Replacement | Implement services, physics, LOD, persistence, networking and QA in Godot. |
| 21-23 Forge/Presentation | Author provider assets, sail/rig states, sockets, events, wake/audio/VFX and inspection tools. |
| 26H | Use movement/restraint states for launch, dry dock, refit, repair and salvage. |
| 26I | Author movement profiles/providers and preview certification. |
| 26J-26K | Consume certified vessels for crews, ports, trade, fleets and naval power. |
| 26L | Consume collision, motion, heel, grounding and load events for damage/sinking. |
| 26N | Place capabilities, recipes, progression, magic and economy into final registry packages. |
| 26O | Finalise constants, service names, budgets, multiplayer and release gates. |

# 56. Decision Register
| Decision ID | Decision | Status | Owner |
| --- | --- | --- | --- |
| DEC-26G-001 | Movement uses one authoritative rigid-vessel body with sampled/aggregate forces, not per-voxel rigid bodies. | Locked Baseline | 26G/26O |
| DEC-26G-002 | Actual block-derived mass, contained load and shape evidence drive hydrostatic outputs. | Locked | 26F-26G |
| DEC-26G-003 | Sealed enclosed volume and solid material volume are distinct displacement sources. | Locked | 26B/26F/26G |
| DEC-26G-004 | Operational certification is configuration- and environment-specific. | Locked | 26G |
| DEC-26G-005 | Stability uses bounded righting proxies rather than full continuous naval analysis. | Approved Baseline | 26G/26O |
| DEC-26G-006 | 26G may restrict/immobilise but may not silently edit vessel structure or cargo. | Non-Waivable | 26F-26G |
| DEC-26G-007 | All propulsion/control enters through registered providers with explicit sources and limits. | Locked | 26G/25C |
| DEC-26G-008 | Magic propulsion requires priced capability providers; appearance alone grants nothing. | Locked | 09/26G |
| DEC-26G-009 | Anchors and moorings are physical restraint providers, not unconditional freeze toggles. | Approved Baseline | 26G |
| DEC-26G-010 | Towed vessels retain separate identity and local grids. | Locked | 26F-26G |
| DEC-26G-011 | Distant route simulation consumes the same certified capabilities and route constraints. | Non-Waivable | 26G/26O |
| DEC-26G-012 | Autopilot respects knowledge, capability, permission and environmental uncertainty. | Locked | 26G/17 |
| DEC-26G-013 | Reduced-motion presentation does not alter authoritative vessel forces. | Locked Accessibility Boundary | 17/26G |
| DEC-26G-014 | Exact coefficients, sample counts and caps remain prototype-driven Balance Draft. | Pending Evidence | 26O/Ash |
| DEC-26G-015 | Surface vessels are current scope; pressure-hull/submersible certification remains future dedicated scope. | Locked Scope Control | Ash/26A |
| DEC-26G-016 | Provider/control domain remains vehicle extension versus dedicated vessel-domain admission decision. | Pending | 25B-25C/26O |
| DEC-26G-017 | Ordinary capsizing is a recoverable movement state; sinking/wreck ownership belongs to 26L. | Locked Boundary | 26G/26L |

# 57. Handoff to Document 26H
Document 26H must consume 26F structural identity and 26G movement/restraint/certification state to define safe construction, launching, repair, refit, righting and salvage workflows.

26H receives:

- Vessel Movement lifecycle and restraint states.
- Operational Certification reports and recertification triggers.
- Actual waterline, draft, trim, list, stability and load-envelope outputs.
- Grounded, beached, capsized, swamped, docked, moored, anchored and towed state contracts.
- Provider installation/removal dependencies and movement-safe edit locks.
- Launch, undock, haul-out and refloat prerequisites.
- Anchor, mooring, tow and dock socket/relationship interfaces.
- Mass/load changes that invalidate hydrostatic caches or certification.
- Reason codes and highlighted local regions/components.
- Recovery and atomic-transition requirements.

26H owns:

- Shipwright tool workflow for construction, launch, repair, refit, dry dock and salvage.
- Resource-conserving installation/removal and replacement transactions.
- Scaffolds, slipways, cradles, dry docks, pumps, cranes, capstans and hauling infrastructure.
- Safe support verification before structural edits.
- Repair priorities and temporary seaworthiness patches.
- Righting, refloating, towing preparation and wreck-recovery workflows.
- Recommissioning after structural or provider changes.
- NPC shipwright labour and staged construction handoff later consumed by 26J.

> **26G Completion Statement**
>
> Document 26G establishes how a commissioned voxel vessel floats, balances, moves, turns, anchors, tows, docks and navigates without becoming a cosmetic vehicle or an unbounded physics simulation. It consumes 26B-26F truth, preserves Set 25 identity and field ownership, separates definitions from Movement Records, derives mass and displacement from actual vessel state, uses bounded hydrostatic and force samples, evaluates draft, trim, list, stability, freeboard and capsizing, integrates wind/waves/currents/tides, supports multiple priced propulsion and steering providers, defines restraint and route systems, binds operational certification to exact configurations, preserves moving interiors, multiplayer authority, saves and LOD, and hands safe movement-state contracts to 26H.

# 58. Open Decisions for Later Documents
| Open Decision | Owner | Required Evidence |
| --- | --- | --- |
| Exact buoyancy sample budgets and equilibrium tolerances by scale band. | 26O/Ash | Packaged hydrostatic and active-physics profiling. |
| Final drag/righting coefficient representation and authoring exposure. | 26G/26I/26O | Diverse hull corpus and playtest readability. |
| Minimum certification rules for canoes, log rafts and extremely small craft. | 26G/26N | Early progression and false-rejection tests. |
| How arbitrary player-authored sails resolve to provider area/profile. | 26I/26G | Forge validation and animation prototype. |
| Flexible rigging storage, damage and network representation. | 26I/26L/26O | Socket, physics and replication tests. |
| Whether planing/hydrofoils enter initial production or later specialist scope. | 26G/26N/Ash | Performance and gameplay-value prototype. |
| Anchor dragging fidelity and peaceful-mode defaults. | 26G/26O/Ash | Storm/harbour playtests. |
| NPC navigation skill/error model and crew staffing thresholds. | 26J | Crew simulation and route playtests. |
| Autopilot availability, progression and multiplayer permissions. | 26N/26O/Ash | Accessibility, progression and griefing review. |
| Exact far-route incident model and promotion frequency. | 26K/26O | Fleet-scale simulation tests. |
| Damage-to-performance coupling and sink threshold. | 26L | Naval damage and flooding prototypes. |
| Dedicated pressure-hull/submersible profile. | Future expansion | 26B pressure, 26E life support and specialised motion evidence. |
| Moving settlement/floating fortress movement architecture. | Future dedicated scope | Scale, NPC, save, combat and networking evidence. |

# Appendix A. Canonical Glossary
| Term | Definition |
| --- | --- |
| Apparent Wind | Wind relative to the moving vessel, derived from authoritative wind and vessel velocity. |
| Certified Load Envelope | Approved mass and distribution range bound to a certification report. |
| Downflooding Edge | Opening or boundary where water can enter a space assumed dry. |
| Ground Speed | Velocity relative to world terrain. |
| Water-Relative Speed | Velocity relative to the local current/support medium. |
| Hydrostatic Cache | Derived displacement/equilibrium/stability data for exact revisions. |
| Provider Group | One or more components resolved as a coordinated propulsion, steering or restraint source. |
| Righting Proxy | Bounded calculated measure of restoring response used for stability classification. |
| Route Leg | One compatible segment of a Navigation Plan. |
| Safe State | Last coherent movement/restraint/frame state usable for recovery. |
| Sea-Worthiness Band | Certified environment/use envelope. |
| Support Medium | Liquid or explicit extraordinary field in which the profile can produce support. |
| Trim | Fore-aft equilibrium inclination. |
| List | Persistent side inclination from configuration. |
| Heel | Temporary side inclination from external/operational force. |

# Appendix B. Movement and Certification Record Templates
```yaml
vessel_movement_record:
  movement_record_id: vessel_movement:<ulid>
  vessel_instance_id: vessel:<ulid>
  movement_profile_id: leyforge.core.vehicle.movement_profile.example
  world_frame_id: world_instance:<id>
  vessel_frame_id: spatial_frame:<ulid>
  world_transform: authoritative_transform
  linear_velocity_world: [x, y, z]
  angular_velocity_local: [roll, pitch, yaw]
  movement_state: operational_moored
  restraint_relationship_ids: []
  structural_revision: 1
  load_revision: 1
  provider_revision: 1
  hydrostatic_cache_hash: sha256:...
  actual_waterline: {normal_local: [0,1,0], offset_local: 0.0}
  draft_summary: {forward: 0.0, aft: 0.0, port: 0.0, starboard: 0.0}
  trim_band: level
  list_band: level
  stability_band: adequate
  reserve_buoyancy_band: standard
  current_navigation_plan_id: null
  active_controller_id: null
  lod_mode: active_local
  last_safe_state_ref: movement_snapshot:<ulid>
  schema_version: 1

operational_certification_report:
  report_id: vessel_certification:<ulid>
  vessel_instance_id: vessel:<ulid>
  certification_profile_id: leyforge.core.vehicle.certification_profile.coastal_standard
  registry_snapshot_hash: sha256:...
  structural_revision: 1
  load_revision_or_envelope_id: vessel_load_envelope:<id>
  provider_revision: 1
  environment_profile_ids: [leyforge.core.environment.maritime.coastal]
  capability_results: []
  blockers: []
  warnings: []
  accepted_warning_records: []
  hydrostatic_evidence_ref: hydrostatic_evidence:<ulid>
  performance_evidence_refs: []
  certified_bands: []
  restrictions: []
  recertification_triggers: []
  status: passed_with_warnings
  issued_by: authority:<id>
  issued_at_world_time: 0
  schema_version: 1
```

# Appendix C. Propulsion and Steering Provider Templates
```yaml
propulsion_provider:
  definition_id: leyforge.core.vehicle.propulsion_provider.example
  schema_id: leyforge.system.schema.vehicle.propulsion_provider.v1
  provider_family: propeller
  required_component_role_ids:
    - leyforge.system.component_role.vessel.propulsion.primary
  source_interface_ids:
    - leyforge.system.interface.power.rotational
  operating_medium_ids:
    - leyforge.core.fluid.water
  force_model_id: leyforge.system.force_model.vessel.propeller_standard
  local_force_axis: [0, 0, 1]
  application_socket_role: propulsion_mount
  demand_profile_id: leyforge.core.power_demand.example
  output_bands: [idle, low, cruise, high, emergency]
  reverse_supported: true
  low_speed_control_capability: medium
  environment_limits: []
  fault_state_ids: []
  presentation_event_ids: []
  validation_profile_ids: []

steering_provider:
  definition_id: leyforge.core.vehicle.steering_provider.example
  provider_family: rudder
  required_component_role_ids:
    - leyforge.system.component_role.vessel.steering.primary
  control_axis: yaw
  flow_source: water_relative
  minimum_effective_flow_band: low
  maximum_angle_band: standard
  response_profile_id: leyforge.core.vehicle.control_response.rudder_standard
  local_application_socket_role: steering_mount
  failure_modes: [jammed, reduced_range, detached]
  capability_outputs:
    - leyforge.system.capability.maritime.control.cruise
```

# Appendix D. Sea-Worthiness and Environment Matrix
| Capability Area | Sheltered | River/Canal | Coastal | Open Sea | Storm/Ice Special |
| --- | --- | --- | --- | --- | --- |
| Support | Basic equilibrium | Equilibrium plus shallow margin | Reserve buoyancy | Higher reserve/redundancy | Profile-specific |
| Stability | Basic positive | Turn/current tolerance | Wave/heel envelope | Sustained-wave envelope | Severe-event limits |
| Propulsion | Any valid method | Current/bend control | Harbour plus travel | Endurance/redundancy | Special source/protection |
| Steering | Low-speed basic | Reverse/turning room | Docking and sea control | Failure tolerance | Special control band |
| Navigation | Visual/local | Depth/bridge/lock | Charts/tides/weather | Open-water instruments | Forecast/ice/magic knowledge |
| Restraint | Simple mooring | Bank/lock/anchor | Anchor/mooring | Heavy-weather strategy | Special ground/ice rules |
| Clearance | Local visual | Draft/height/width | Tide/surf/harbour | Route/depth/refuge | Dynamic closure |
| Certification | Light profile | Route-specific | Coastal standard | Open-sea standard | Conditional specialist |

# Appendix E. Movement State Transition Matrix
| From | Trigger | To | Failure Behaviour |
| --- | --- | --- | --- |
| Commissioned Immobilised | Start certification | Certification Review | Preserve vessel and prior report. |
| Certification Review | Pass required layers | Operational Moored/Anchored/Docked | Bind report to exact revisions. |
| Certification Review | Blocker | Commissioned Immobilised | Return reasons; no cell edits. |
| Operational Moored | Release mooring/undock | Operational Underway | Atomic restraint removal and motion activation. |
| Operational Underway | Deploy holding anchor | Operational Anchored | If holding fails, remain underway/adrift with drag event. |
| Operational Underway | Loss of control/propulsion | Adrift | Preserve velocity/environment response. |
| Operational Underway | Terrain support contact | Grounded/Beached | Emit collision/contact evidence. |
| Operational Underway | Stability/downflooding threshold | Capsized/Swamped | Restrict providers; handoff damage/flooding. |
| Grounded/Beached | Refloat conditions met | Operational Underway/Adrift | Do not teleport; resolve support/contact. |
| Any operational | Enter approved work support | Docked Edit Lock | Movement disabled after constraint confirmation. |
| Local movement | Demote on valid route | Route Transit | Store snapshot and route state. |
| Route Transit | Promote near player/event | Active Local state | Validate placement and reconcile environment. |
| Any | Schema/authority conflict | Quarantined | Immobilise and preserve payload. |

# Appendix F. Validation and Reason-Code Catalogue
| Code | Default Severity | Meaning |
| --- | --- | --- |
| VSL_MOT_NO_EQUILIBRIUM | Blocker | No valid supported equilibrium found for current configuration. |
| VSL_MOT_INSUFFICIENT_DISPLACEMENT | Blocker | Available displaced support cannot balance current mass. |
| VSL_MOT_STABILITY_UNSTABLE | Blocker | Righting response is unacceptable for selected profile. |
| VSL_MOT_STABILITY_TENDER | Warning | Low stability margin or high load sensitivity. |
| VSL_MOT_FREEBOARD_LOW | Warning/Blocker | Critical downflooding edge is too close to water. |
| VSL_MOT_LOAD_OUTSIDE_ENVELOPE | Warning/Blocker | Current mass/distribution exceeds certified load envelope. |
| VSL_MOT_MASS_PROVIDER_UNRESOLVED | Blocker | Authoritative mass or local position cannot be resolved. |
| VSL_MOT_PROPULSION_MISSING | Blocker/Restriction | Required propulsion capability unavailable. |
| VSL_MOT_STEERING_INADEQUATE | Blocker/Restriction | Control authority insufficient for selected profile. |
| VSL_MOT_PROVIDER_SOURCE_UNAVAILABLE | Warning/Error | Fuel, power, mana, labour or wind opportunity unavailable. |
| VSL_MOT_PROVIDER_MEDIUM_INVALID | Error | Provider cannot operate in current medium/immersion. |
| VSL_MOT_CLEARANCE_DRAFT | Blocker/Warning | Route or berth depth conflicts with current draft. |
| VSL_MOT_CLEARANCE_OVERHEAD | Blocker/Warning | Mast/superstructure conflicts with overhead clearance. |
| VSL_MOT_GROUNDED | State | Vessel supported by terrain and cannot move freely. |
| VSL_MOT_ANCHOR_DRAGGING | Warning | Environmental load exceeds current holding band. |
| VSL_MOT_MOORING_OVERLOAD | Warning/Error | Mooring tension exceeds approved band. |
| VSL_MOT_TOW_INCOMPATIBLE | Error | Tow identities/sockets/performance are incompatible. |
| VSL_MOT_ROUTE_UNKNOWN_HAZARD | Information/Warning | Route confidence is insufficient for guaranteed clearance. |
| VSL_MOT_CERTIFICATION_STALE | Error | Relevant structural/load/provider/registry revision changed. |
| VSL_MOT_FRAME_AUTHORITY_CONFLICT | Non-Waivable Blocker | Vessel or occupant has conflicting spatial/motion ownership. |
| VSL_MOT_PROMOTION_PLACEMENT_INVALID | Error/Quarantine | Distant vessel cannot be safely promoted at resolved position. |
| VSL_MOT_PERF_BUDGET_EXCEEDED | Blocker | Movement/sample/provider workload exceeds approved scale band. |
| VSL_MOT_SCHEMA_UNSUPPORTED | Quarantine | Required movement schema or provider definition unavailable. |

# Appendix G. Prototype and Performance Test Matrix
| Test ID | Scenario | Pass Condition |
| --- | --- | --- |
| 26G-T01 | Sealed empty box hull. | Correct waterline and mass/displacement balance. |
| 26G-T02 | Open lattice with same outer bounds. | No fake enclosed-volume buoyancy. |
| 26G-T03 | Add known central cargo increments. | Monotonic draft increase and stable centre. |
| 26G-T04 | Move same cargo to port side/high deck. | Correct list/stability warning. |
| 26G-T05 | Twin-hull craft. | Stable multi-volume support and correct centre of buoyancy. |
| 26G-T06 | Sail craft through point-of-sail bands. | Directional force, heel and no calm thrust. |
| 26G-T07 | Twin engines with one disabled. | Asymmetric thrust/control and readable fault. |
| 26G-T08 | Rudder at zero and cruise speed. | Low/high-speed authority behaves by profile. |
| 26G-T09 | Anchor on sand, rock and unsuitable deep water. | Holding/drag/deployment reasons are correct. |
| 26G-T10 | Tow heavy disabled vessel. | Separate identity, combined performance and tension limits. |
| 26G-T11 | Tide falls under shallow-draft vessel. | Grounding and later refloat without teleport. |
| 26G-T12 | Flood one side compartment. | List, draft and freeboard update from 26B state. |
| 26G-T13 | Capsize then pump/right under controlled conditions. | Recoverable state without automatic destruction. |
| 26G-T14 | Demote, traverse route and promote. | Cargo/state/capability preserved and placement valid. |
| 26G-T15 | Two clients submit conflicting helm commands. | Authority rejects conflict; one motion truth. |
| 26G-T16 | Reconnect player walking below deck. | Correct local frame and safe pose. |
| 26G-T17 | Disable optional provider pack. | Vessel immobilised/quarantined with payload preserved. |
| 26G-T18 | Controller-only launch, route, helm, anchor and dock. | Complete flow without pointer. |
| 26G-T19 | Reduced-motion camera during high sea state. | Comfort presentation changes; authoritative forces unchanged. |
| 26G-T20 | Maximum provisional scale-band vessel. | Packaged performance within approved budget. |

# Appendix H. Completion Checklist
- [x] 26F movement handoff and Set 25 contracts consumed.
- [x] Movement identity, non-goals and source-of-truth boundaries defined.
- [x] Movement, load, hydrostatic, provider, navigation and certification records separated.
- [x] Lifecycle, fidelity bands and one authoritative motion owner defined.
- [x] Mass providers, load revisions and centre-of-mass resolution defined.
- [x] Displaced volume, sealed/open geometry and shape-aware occupancy defined.
- [x] Bounded buoyancy sampling and deterministic equilibrium solve defined.
- [x] Draft, trim, list, centre of buoyancy, stability and reserve buoyancy defined.
- [x] Dynamic vessel motion, capsizing, swamping and righting boundaries defined.
- [x] 26D wind, wave, current, tide, surge, ice and storm interfaces consumed.
- [x] Drag, shallow water, grounding, beaching and collision boundaries defined.
- [x] Floodwater, cargo and ballast coupling defined without stealing owner truth.
- [x] Propulsion provider architecture and all approved provider families defined.
- [x] Sail, oar, paddle, propeller, engine, mana and hybrid rules defined.
- [x] Power, fuel, mana, maintenance and heat interfaces defined.
- [x] Steering, rudder, differential thrust, helm and assistance defined.
- [x] Anchor, mooring, towing, docking, launching and hauling states defined.
- [x] Navigation knowledge, charts, route graphs, autopilot and NPC interface defined.
- [x] Sea-worthiness bands, operational limits and certification defined.
- [x] Commands, authority, events, moving interiors and multiplayer defined.
- [x] LOD route transit, promotion/demotion, persistence and recovery defined.
- [x] Godot/Summer Engine services and no-per-voxel-node boundary defined.
- [x] Performance, UI, accessibility, registry facets and capabilities defined.
- [x] Validation, reason codes, evidence and prototype laboratories defined.
- [x] Set 25 and main-document integration matrices defined.
- [x] Decision register, open decisions and 26H handoff completed.

