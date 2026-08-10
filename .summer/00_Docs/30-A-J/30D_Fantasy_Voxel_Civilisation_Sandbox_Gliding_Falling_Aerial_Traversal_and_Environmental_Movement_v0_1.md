# FANTASY VOXEL CIVILISATION SANDBOX

## DOCUMENT SET 30

# 30D - Gliding, Falling, Aerial Traversal and Environmental Movement

Version 0.1 - Detailed Airborne Motion, Controlled Descent, Gliding and Environmental Force Design Draft

A production-oriented specification for player-body airborne movement in Leyforge, covering falling, gravity and air resistance, landing classification, controlled descent, gliding, wind and vertical air currents, realm-specific gravity, turbulence, launch forces, environmental displacement, aerial assistance providers, camera/readability, accessibility, multiplayer authority, persistence, Godot/Summer Engine implementation and cross-system consequence handoffs.

Project Lead and Final Authority: Ash

Architecture, systems planning, documentation and integration support: GPT-5.6 Sol

> **Airborne Movement Statement**
>
> Falling should create readable risk rather than arbitrary punishment, and gliding should turn height, wind and terrain knowledge into useful exploration without making roads, bridges, mounts or flying vessels irrelevant. Leyforge therefore treats gravity, wind, lift and landing as authoritative movement facts, while survival damage, equipment costs, weather generation and magical spell rules remain owned by their dedicated systems.

# Document Purpose

Document 30D is the airborne and environmental-force specialist document within Leyforge Document Set 30. It receives ordinary jump and airborne state from Document 30B and releases from traversal actions such as ledges, ropes and grapples from Document 30C. It defines what happens as the mover falls, how environmental vectors change that movement, how the player enters controlled descent or gliding, how landing is classified physically, and how those physical facts are handed to Set 29 for biological consequences.

30D also establishes the movement-facing interface for windways, updrafts, downdrafts, strong gusts, altered gravity, magical or dimensional force fields and other environmental movement sources. It does not generate weather. Document 11 and the post-Atlas environmental/world systems own terrestrial climate and environment state. Document 26D owns its previously approved marine atmospheric fields. Document 14 and the Atlas own realm laws and realm content. Document 09 owns magic spell and magical-effect meaning. 30D samples those authoritative fields and converts them into movement response.

The document deliberately distinguishes **gliding** from **powered flight**. Gliding is an unpowered or externally lifted aerial mode in which the mover exchanges altitude, airspeed and environmental lift for travel. A player, spell or device may later provide hover, thrust or other aerial assistance through a declared provider, but the spell, item, fuel, mana and progression rules remain external. Flying mounts are owned by 30E and are not redefined here.

# Governing Source and Dependency Register

| Source | Existing Direction Relevant to 30D | 30D Treatment |
| --- | --- | --- |
| Leyforge Document Sets 27-30 Cross-Set Interface Register v1.0 | Set 30 owns movement/traversal; Set 29 owns health, injury, fatigue, stamina and biological conditions. | Binding ownership contract. 30D emits physical movement/impact facts and consumes Set 29 responses. |
| 00 - Master Game Design Bible | Exploration, voxel building, magic, survival and player freedom must remain interconnected and readable. | Airborne systems create traversal choices without replacing ground infrastructure or survival preparation. |
| 01 - Core Gameplay Loop | Exploration and movement through a seed-generated voxel world must remain intuitive and flexible. | Falling/gliding are integrated into ordinary exploration, not a detached minigame. |
| 02 - Player Progression | Exploration magic may affect movement; stamina supports strenuous actions; progression may unlock utility. | Progression may grant aerial capabilities but 30D does not own progression trees or costs. |
| 03 - Blocks Registry | One-metre voxel geometry, hazards, collision and functional blocks establish landing/clearance surfaces. | Landing and aerial collision use actual voxel geometry and tagged surface context. |
| 04 - Items Registry | Back/cloak equipment includes glider-capable slots; items may affect movement, fall protection and utility. | Item identity/durability remain Item-owned; 30D defines movement-facing aerial equipment facets. |
| 05 - Crafting and Recipe Registry | Traversal equipment and infrastructure are created through physical recipes where approved. | 30D never sets material recipes or crafting costs. |
| 09 - Magic System v0.2 | Magic supports movement, exploration and infrastructure; costs, mana, school rules and failure remain Magic-owned. | 30D may execute a declared magical movement provider without redefining the spell. |
| 11 - Biomes and World Generation | Climate, weather, altitude, cliffs, wind power, disasters and magical weather affect travel. | 30D consumes local movement-relevant environment snapshots rather than calculating climate. |
| 14 / 24D - Dimensions and Realm Atlas | Realms may alter gravity, wind, buoyancy, falling rules and navigation; Aetheric Reach uses wind routes and varying gravity. | Realm laws enter through a generic movement-field contract; 30D avoids hard-coded realm exceptions. |
| 16 - Combat, Gear and Defence | Falls may cause injuries; boots/armour affect fall response; combat may launch/knock back movers. | Combat supplies impulses and equipment facets; Set 29 owns biological injury/health consequences. |
| 17 - UI/UX System | First/third person, camera comfort, motion reduction, accessibility, warnings and contextual HUD are required. | 30D publishes movement facts and camera signals; 17 owns final UI/settings presentation. |
| 20G / 24C | Sky/realm building packs and skylands require wind/current routes, emergency descent and weather-aware vertical logistics. | 30D exposes movement-facing route/environment compatibility for player-body aerial traversal. |
| 22F - Entity Animation | Authorised movement drives locomotion animation; flight/landing transitions and bounded root motion are presentation. | 30D publishes fall/glide/landing snapshots; animation never owns displacement. |
| 22H - Entity Gameplay Integration | Movement profiles/capabilities remain separate from presentation and must support non-humanoid bodies. | 30D consumes mover geometry/capability profiles and supports future non-player gliding bodies. |
| 25 - Production Governance and Capability Contracts | Movement capabilities and qualified IDs must remain registry-driven, validated and migratable. | 30D uses capability/provider definitions and validation rather than item-name checks. |
| 26D - Marine Climate, Wind, Waves, Tides, Currents and Storms | Atmospheric regions, weather cells, wind fields, gusts, extraordinary fields and forecasting are authoritative environment truth. | 30D consumes approved atmospheric field snapshots where available; it does not create a second weather simulation. |
| 26E - Swimming and Diving | Water-specific movement and water-current response remain maritime/aquatic authority pending XSI-30-001. | 30D handles air-to-water entry handoff only and does not calculate underwater/current movement. |
| 30A - Movement Architecture | Airborne and Glide modes, modifier precedence, one movement truth, safe recovery and API boundaries. | Binding parent architecture. |
| 30B - Core Player Locomotion | Jump launch, basic rising/air control, movement profiles, camera basis and handoff to 30D. | Direct airborne entry source. |
| 30C - Climbing and Grappling | Ledge/rope/grapple releases provide position, velocity, fall context and safe-position references. | Direct traversal release source. |

# Governing Ownership Contract

Document 30D owns:

- airborne fall integration after jump/traversal release;
- gravity-vector application to player-body airborne movement;
- simplified air resistance / terminal-speed behaviour;
- movement-facing wind and environmental force response;
- fall-state classification;
- landing-contact classification;
- physical impact exposure facts;
- controlled-descent movement modes;
- player gliding movement and glider handling;
- aerial current, updraft, downdraft and windway movement response;
- local turbulence/gust response to authoritative environment input;
- movement response to altered gravity and authored movement fields;
- aerial collision, landing approach and emergency fallback;
- movement execution for approved external aerial-assist providers;
- movement-facing aerial capability and equipment facets;
- airborne/glide networking, prediction and persistence.

Document 30D does **not** own:

- health damage, fractures, bleeding or injury severity;
- stamina values, fatigue, temperature or physiological carrying penalties;
- weather generation, storm lifecycle or climate simulation;
- spell definitions, mana costs, cooldowns or magical progression;
- glider item recipe, price, rarity or durability formula;
- flying mounts;
- airships or vessels;
- combat damage/attack definitions;
- realm lore or gravity-law content identity;
- UI layout/settings ownership;
- animation authoring.

# Static Table of Contents

1. Locked Airborne and Environmental Movement Identity  
2. Scope, Ownership and Explicit Non-Goals  
3. Airborne Design Principles  
4. Runtime Architecture and State Ownership  
5. Canonical Terminology  
6. Airborne State Machine  
7. Entry Sources into Airborne Movement  
8. Gravity and Realm Gravity Fields  
9. Air Resistance and Terminal Behaviour  
10. Basic Air Steering and Momentum Preservation  
11. Falling State and Descent Tracking  
12. Fall Risk Knowledge and Readability  
13. Landing Contact Detection  
14. Physical Landing Severity Classification  
15. Fall Consequence Handoff to Set 29  
16. Landing Recovery and Movement Continuity  
17. Special Landing Surfaces and Moving Supports  
18. Controlled Descent Architecture  
19. Controlled Descent Provider Families  
20. Glide Mode Identity and Entry Rules  
21. Glider Aerodynamic Model  
22. Glider Pitch, Bank, Turn and Speed Control  
23. Stall, Dive, Overspeed and Recovery  
24. Launching, Deployment and Retraction  
25. Landing a Glider  
26. Glider Equipment and Item-System Handoff  
27. Wind and Atmospheric Movement Fields  
28. Updrafts, Thermals, Downdrafts and Windways  
29. Gusts, Turbulence and Severe-Weather Movement  
30. Gravity Anomalies, Buoyancy and Extraordinary Fields  
31. Aerial Assist Provider Interface  
32. Magic, Equipment and Infrastructure Aerial Integration  
33. Combat Launches, Knockback and Mid-Air Interruption  
34. Structures, Skylands and Blueprint Integration  
35. Route Accessibility and Aerial Travel Interfaces  
36. First-Person Camera and Body Presentation  
37. Third-Person Camera and Aerial Framing  
38. UI, Warnings, Knowledge and Feedback  
39. Accessibility and Motion Comfort  
40. Multiplayer Authority, Prediction and Reconciliation  
41. Persistence, Save/Load and Recovery  
42. Registry and Data Definitions  
43. Balance-Draft Baseline Values  
44. Godot/Summer Engine Implementation Direction  
45. Prototype Laboratories and Acceptance Tests  
46. Handoff to 30E, 30H, 30I and 30J  
47. Main-Document Integration Register  
48. Cross-Set Interface Amendments  
49. Open Decisions and Deferred Questions  
Appendix A. Airborne State Transition Matrix  
Appendix B. Environmental Movement Field Snapshot  
Appendix C. Fall Impact Exposure Template  
Appendix D. Controlled Descent Provider Template  
Appendix E. Glider Profile Template  
Appendix F. Aerial Assist Provider Template  
Appendix G. Airborne/Glide Runtime Record  
Appendix H. Reason-Code Catalogue  
Appendix I. Multiplayer Airborne Contract  
Appendix J. Acceptance and Regression Matrix  

# 1. Locked Airborne and Environmental Movement Identity

Airborne movement is a physical continuation of the same authoritative player body used on the ground. The camera, animation, glider mesh and weather presentation may change dramatically, but there is still one world position, one velocity and one collision truth.

> **Locked Rule**
>
> 30D calculates the physical movement result, not the biological punishment. A fall produces authoritative velocity, impact direction, surface and landing-quality facts. Set 29 decides what those facts do to health, injuries, fatigue and recovery.

## 1.1 Player-Facing Promise

The player should be able to understand:

- when they are falling normally;
- when a drop is becoming dangerous;
- whether a glider can be deployed;
- what wind is doing to the glide;
- why a landing was safe, hard or severe;
- why a glider stalled;
- whether an updraft is lifting them;
- whether a realm has altered gravity;
- whether a strong wind is displacing them;
- which system caused an aerial movement restriction.

## 1.2 Aerial Freedom Without Infrastructure Erasure

Gliding should reward:

- height;
- route knowledge;
- towers;
- cliffs;
- skylands;
- wind;
- exploration gear;
- weather planning.

It should not make these systems obsolete:

- roads;
- stairs;
- bridges;
- ladders;
- ground mounts;
- caravans;
- portals;
- flying mounts;
- airships;
- settlement gates and walls.

Gliding therefore has altitude, approach, wind and landing requirements. It is not unrestricted free flight.

# 2. Scope, Ownership and Explicit Non-Goals

## 2.1 30D Owns Detailed Rules For

- falling after ordinary jump apex or external release;
- gravity and air-environment force accumulation;
- fall velocity and terminal behaviour;
- fall state start/end tracking;
- landing geometry and physical severity;
- controlled descent;
- glider deploy, handling and landing;
- environmental aerial forces;
- strong-wind displacement while airborne;
- authored non-water environmental movement fields;
- altered-gravity movement response;
- emergency safe recovery for invalid airborne states.

## 2.2 Explicit Non-Goals

30D is not:

- a realistic aerospace simulator;
- a second weather simulation;
- a health/damage system;
- a magical spell list;
- a flying-mount system;
- an airship system;
- a universal player free-flight promise;
- an excuse to make every biome constantly push the player around;
- a system where visual wind particles create gameplay force;
- a system where reduced-motion settings remove authoritative physics.

# 3. Airborne Design Principles

## 3.1 Height Is Opportunity and Risk

High terrain creates:

- better sightlines;
- glide range;
- jump/traversal options;
- exposure;
- fall risk;
- wind access;
- aerial threat visibility.

## 3.2 Momentum Is Conserved Readably

A player released from:

- sprint jump;
- grapple swing;
- knockback;
- moving platform;
- glider;

retains the physically relevant velocity rather than snapping to a generic fall.

## 3.3 Environment Must Have a Source

Every force applied to the player must resolve to an authoritative source:

- gravity law;
- wind field;
- updraft volume;
- storm gust;
- moving support;
- spell/effect provider;
- explosion/knockback;
- launch structure;
- realm law.

VFX alone cannot push the player.

## 3.4 Dangerous Falls Must Be Telegraphable

The player may choose a risky drop, but ordinary settings should not hide the difference between:

- safe;
- hard;
- severe;
- extreme.

Exact injury remains uncertain where equipment, terrain and Set 29 state matter.

## 3.5 Aerial Systems Must Be Recoverable

Aerial bugs must fail toward:

- valid fall;
- safe grounded state;
- aquatic handoff;
- recent safe position in exceptional invalid-collision cases.

They must not freeze the player in mid-air.

# 4. Runtime Architecture and State Ownership

```text
30B Jump / 30C Release / Combat Impulse / Environment Launch
                           |
                           v
                 Airborne Entry Resolver
                           |
                           v
               Environmental Field Sampler
                           |
             +-------------+-------------+
             |                           |
             v                           v
       Gravity / Air Force         Aerial Provider
             |                    (Glide / Descent /
             |                     Assist if active)
             +-------------+-------------+
                           |
                           v
                  Airborne Motion Solver
                           |
                Collision / Contact Sweep
                           |
          +----------------+----------------+
          |                                 |
          v                                 v
   Continue Airborne                  Landing Resolver
          |                                 |
          v                                 v
  Movement Snapshot          Physical Impact Exposure
                                            |
                                            v
                                     Set 29 Consequence
                                            |
                                            v
                                     30B Ground Return
```

## 4.1 One Airborne Record

A single authoritative record stores:

- world transform;
- velocity;
- movement mode/state;
- gravity source;
- environment snapshot ID;
- active glide/descent/provider;
- fall-start facts;
- recent maximum descent speed;
- landing-candidate state;
- external force contributors;
- safe-position reference.

# 5. Canonical Terminology

| Term | Meaning |
| --- | --- |
| Airborne | No valid grounded support; movement is governed by gravity, momentum, input and environmental forces. |
| Falling | Airborne state with descent relative to current gravity direction. |
| Gravity Vector | Authoritative acceleration direction and magnitude for the current location/realm. |
| Local Up | Direction opposite the active gravity vector; may differ by realm/site. |
| Air Velocity | Authoritative local atmospheric movement vector supplied by the environment owner. |
| Air-Relative Velocity | Mover world velocity minus local air velocity. |
| Ground-Relative Velocity | Mover velocity relative to the world/moving support. |
| Environmental Force Field | Authoritative movement-facing field supplying wind, vertical lift, gravity override or other sourced force. |
| Impact Velocity | Relative velocity between mover and contacted support along the impact normal. |
| Landing Quality | Movement-side classification of posture, approach, surface and impact geometry before Set 29 consequences. |
| Controlled Descent | Aerial state that limits descent through an approved provider without full glider handling. |
| Glide | Unpowered aerial movement that converts altitude and airspeed into horizontal travel and may use environmental lift. |
| Stall | Glider state in which air-relative speed/angle cannot support expected glide lift. |
| Sink Rate | Descent rate relative to Local Up. |
| Updraft | Environmental air motion with a significant component toward Local Up. |
| Downdraft | Air motion significantly aligned with gravity. |
| Windway | Persistent or forecastable aerial current corridor intended to influence navigation. |
| Turbulence | Short-scale variability affecting control/readability without requiring full fluid simulation. |
| Aerial Assist Provider | External capability that supplies bounded lift/thrust/hover parameters to Set 30 while another system owns cost/meaning. |

# 6. Airborne State Machine

## 6.1 Top-Level States

Within `Airborne`:

```text
Airborne
├── Rising
├── Apex
├── Falling
├── ForcedAirborne
└── LandingPending
```

Within the separate top-level `Glide` mode:

```text
Glide
├── Deploying
├── Stable
├── Turning
├── Diving
├── Stall
├── Recovering
└── LandingApproach
```

Controlled descent may be implemented as:

- an Airborne substate for simple slow-fall;
- or a lightweight provider state that does not require full Glide mode.

## 6.2 State Direction Uses Local Gravity

"Rising" and "Falling" are measured along the active gravity/local-up axis rather than global world Y alone. This supports realm/site gravity changes.

# 7. Entry Sources into Airborne Movement

30D may receive airborne entry from:

- 30B jump;
- 30C ledge drop;
- 30C rope detach;
- 30C grapple release;
- vault/mantle interruption;
- ground support loss;
- combat knockback/launch;
- explosion/impact impulse;
- moving platform leaving support;
- collapsing structure;
- environmental launch vent/updraft;
- magical movement provider;
- realm gravity transition;
- glider detachment/failure.

Each entry records source type and initial velocity.

# 8. Gravity and Realm Gravity Fields

## 8.1 Default Gravity

The Overworld uses a stable default gravity profile supplied by the world/physics profile.

30D does not hard-code gravity per realm. It queries the active environment/realm law.

## 8.2 Gravity Field Inputs

A gravity snapshot may provide:

```text
gravity_vector
gravity_magnitude
field_source_id
field_priority
blend_distance
local_up_vector
transition_policy
stability_class
knowledge_visibility
```

## 8.3 Gravity Transitions

Sudden gravity reversal can be disorienting and dangerous. A field definition declares whether transition is:

- hard boundary;
- blended;
- ramped over time;
- protected by an anchor/portal;
- event-driven.

30D executes the movement transition. Realm/Magic owns why it exists.

## 8.4 Near-Zero Gravity

In extremely low gravity:

- ordinary grounded contact may become weak;
- jumping can create long airborne periods;
- gliders may become ineffective if the atmosphere/lift model lacks adequate relative air;
- aerial assist providers may dominate;
- movement requires explicit realm adaptation.

30D does not invent universal "space swimming" locomotion unless a provider/capability exists.

# 9. Air Resistance and Terminal Behaviour

Leyforge uses a simplified, tunable airborne drag model.

## 9.1 Purpose

Air resistance should:

- cap extreme descent speed;
- support readable glider behaviour;
- allow wind to matter;
- prevent unbounded velocity in long realm drops;
- remain deterministic enough for multiplayer.

## 9.2 Simplified Model

The authoritative solver uses:

- air-relative velocity;
- mover aerial drag profile;
- current posture/provider;
- local atmosphere class;
- optional realm modifier.

The exact implementation may use a quadratic-like approximation or tuned speed-band damping.

## 9.3 Terminal Speed

Terminal speed is a **profile property**, not a universal law.

Examples:

- humanoid free fall;
- spread-body controlled fall;
- parachute/slow-fall provider;
- glider dive;
- tiny creature;
- low-density realm.

No fall-damage consequence is embedded in terminal-speed code.

# 10. Basic Air Steering and Momentum Preservation

30B provides the ordinary air-control envelope for jumps. 30D extends it for falling and environmental effects.

## 10.1 Rules

- player input can modify horizontal/tangential velocity within the current profile;
- air control is weaker than grounded control;
- environmental wind may shift world-relative movement;
- player input primarily affects air-relative orientation/desired motion;
- a strong external impulse is not instantly cancelled;
- full mid-air reversal from maximum speed is intentionally limited.

## 10.2 Gravity-Relative Basis

When gravity is non-standard, movement input is projected onto the plane perpendicular to Local Up.

# 11. Falling State and Descent Tracking

30D begins a `FallExposureRecord` when:

- grounded support is lost and the grace/ground-snap rules are exhausted;
- a traversal release enters descent;
- forced airborne motion begins to descend;
- Glide/Controlled Descent fails and returns to free fall.

The record tracks:

- fall start transform;
- start velocity;
- gravity profile;
- maximum descent component;
- accumulated air time;
- environmental fields crossed;
- provider use;
- last stable support;
- known safe-position reference.

The system does not use raw fall height alone as the final impact truth.

# 12. Fall Risk Knowledge and Readability

## 12.1 Why Height Alone Is Not Enough

A three-metre fall under normal gravity differs from:

- low gravity;
- strong updraft;
- downward gust;
- glider deployment;
- moving platform catch;
- deep snow;
- water entry;
- magical slow-fall.

Therefore 30D uses predicted impact class where possible.

## 12.2 Player Cues

When the player has enough information, cues may include:

- increasing wind/audio intensity;
- subtle fall-speed presentation;
- optional risk icon;
- glider-deploy availability;
- predicted landing marker for accessibility;
- "dangerous drop" contextual warning near deliberate jump points.

The UI must not reveal hidden realm/weather truth the player has not learned if knowledge rules forbid it.

# 13. Landing Contact Detection

A landing occurs when:

- a valid support surface is contacted;
- the contact normal is acceptable for support or special landing processing;
- relative approach velocity is toward the surface;
- collision is not merely a lateral scrape;
- the movement mode is allowed to transition.

## 13.1 Contact Inputs

- impact normal;
- impact relative velocity;
- surface velocity;
- support stability;
- surface tags/material;
- slope;
- mover posture/orientation;
- active provider;
- landing assist/capability;
- environment state.

# 14. Physical Landing Severity Classification

30D classifies physical impact **before** Set 29 applies injury/health consequences.

## 14.1 Default Severity Bands

Suggested baseline:

- `landing.soft`
- `landing.normal`
- `landing.hard`
- `landing.severe`
- `landing.extreme`
- `landing.invalid/support_lost`

Classification depends on impact speed along the contact normal plus modifiers such as:

- glider flare/landing state;
- controlled-descent provider;
- surface movement;
- surface response class;
- landing posture/capability;
- realm gravity context.

## 14.2 No Damage Number in 30D

30D may say:

> Severe impact, 14.2 m/s normal-relative approach, stone support, feet-first, no descent provider.

It may **not** say:

> Deal 42 health and fracture left leg.

That belongs to Set 29 (and connected combat/health interfaces).

# 15. Fall Consequence Handoff to Set 29

30D emits a `FallImpactExposure`.

Proposed fields are formalised under XSI-30-005.

Set 29 returns:

- accepted biological consequence result;
- movement restrictions/modifiers;
- incapacitation/death state if applicable;
- reason codes/events.

30D then applies only the locomotion result, such as:

- remain standing;
- enter crouched recovery;
- movement temporarily locked by external injury state;
- transition to incapacitated owner;
- bounce/continue Airborne if support was lost.

# 16. Landing Recovery and Movement Continuity

## 16.1 Soft/Normal Landing

Typically returns immediately to 30B:

- Idle;
- Walk;
- Run;
- Sprint if still valid and Set 29 permits;
- Crouch if landing profile/clearance requires it.

## 16.2 Hard Landing

May use a short movement-side recovery envelope even when Set 29 applies no injury.

Purpose:

- preserve weight/readability;
- prevent immediate zero-frame direction reversal after large impact;
- give camera/animation a landing event.

The recovery duration is a movement balance value, not biological injury.

## 16.3 Severe/Extreme Landing

30D publishes physical severity and awaits authoritative consequence. It does not force a cinematic ragdoll unless the downstream state/action owner requests it.

# 17. Special Landing Surfaces and Moving Supports

Surface owners may expose landing-response facets.

Examples:

- deep snow;
- soft foliage;
- hay/soft packing;
- elastic magical pad;
- trampoline-like plant;
- moving lift;
- sloped roof;
- vessel deck;
- loose rubble.

30D consumes:

```text
support_velocity
impact_response_class
surface_compliance_band
rebound_profile?
support_stability
landing_permission
special_transition_provider?
```

Any health/injury mitigation remains Set 29-owned.

## 17.1 Water Entry

Air-to-water contact hands off to Document 26E once aquatic-entry conditions are met.

30D provides:

- entry velocity;
- entry angle;
- fall context;
- current movement state;
- equipment/provider state.

26E/Set 29 own water-entry survival consequences and aquatic movement.

# 18. Controlled Descent Architecture

Controlled descent reduces fall rate without providing full glider steering.

Possible uses:

- parachute-like deployment;
- drag cloak;
- magical feather-fall;
- umbrella/fungal canopy;
- safety harness on a vertical route;
- realm-specific buoyancy aid.

## 18.1 Controlled Descent Rule

The provider declares:

- max descent rate;
- deployment conditions;
- horizontal control allowance;
- turn allowance;
- wind response;
- transition time;
- failure conditions.

The Item/Magic owner declares:

- availability;
- costs;
- charges;
- durability;
- cooldown;
- progression.

# 19. Controlled Descent Provider Families

| Family | Movement Identity |
| --- | --- |
| Drag Device | High drag, modest horizontal steering, strong wind response. |
| Slow-Fall Magic | Provider caps/reshapes descent; Magic owns mana/cost and status duration. |
| Emergency Canopy | Rapid deployment, limited manoeuvrability, strong safety role. |
| Buoyancy Field | Realm/magic device offsets gravity by a bounded amount. |
| Assisted Rope/Descender | 30C path-based descent, not free-air controlled descent; referenced for boundaries. |

Controlled descent cannot be activated if its provider reports:

- no charge;
- broken item;
- forbidden realm;
- deployment obstruction;
- action lock;
- incompatible equipment state.

30D consumes those reasons.

# 20. Glide Mode Identity and Entry Rules

Glide is a distinct top-level movement mode.

## 20.1 Glide Entry Requirements

Typical requirements:

- airborne;
- approved glider capability/provider active;
- minimum deployment clearance;
- provider not broken/forbidden;
- sufficient relative airflow or provider-specific minimum state;
- no hard external movement restriction;
- body/equipment profile compatible.

## 20.2 No Ground Take-Off by Default

A basic glider cannot lift from flat ground under still air.

The player typically needs:

- height;
- launch ramp/cliff;
- strong approved updraft;
- powered assist;
- magical launch;
- flying mount/vessel alternative.

This preserves terrain and infrastructure.

# 21. Glider Aerodynamic Model

Leyforge uses a **gameplay aerodynamic model**, not full computational fluid dynamics.

## 21.1 Core Variables

- air-relative forward speed;
- sink/descent rate;
- pitch input/state;
- bank/turn input;
- glider lift/drag profile;
- wind vector;
- vertical air movement;
- gravity magnitude/direction;
- equipment/load modifier;
- damage/state modifier;
- realm atmosphere modifier.

## 21.2 Glide Ratio

Each profile has an efficient glide band.

A typical basic glider may travel several horizontal metres per metre of altitude in still air when flown near its efficient speed.

The ratio is profile-driven and intentionally lower than high-performance real-world gliders so ground travel remains relevant.

## 21.3 Energy Rule

Without external lift or powered assistance:

- gliding loses altitude over time;
- gaining airspeed generally costs altitude;
- climbing above the current energy state is limited;
- the glider cannot hover indefinitely.

# 22. Glider Pitch, Bank, Turn and Speed Control

## 22.1 Pitch

Pitch input shifts the balance between:

- airspeed;
- sink rate;
- glide distance;
- stall risk.

Pulling up too much reduces speed and may stall.

Pushing down increases speed and descent.

## 22.2 Bank / Turn

Horizontal input banks/turns the glider.

Turning:

- increases path curvature;
- may increase sink/drag;
- consumes altitude;
- is slower than ground camera turning.

## 22.3 Yaw Assistance

The gameplay model may provide mild coordinated-turn assistance so players do not need aircraft rudder simulation.

This is a fantasy survival sandbox, not a flight simulator.

# 23. Stall, Dive, Overspeed and Recovery

## 23.1 Stall

A stall occurs when the glider profile no longer has adequate air-relative speed/lift for the commanded state.

Results:

- lift drops;
- sink increases;
- control authority reduces;
- nose/downward recovery tendency may apply;
- warning cues escalate.

Recovery requires:

- reducing excessive pitch;
- gaining airspeed;
- using an updraft/assist if available;
- abandoning glide to free fall if necessary.

## 23.2 Dive

A dive trades altitude for speed.

The glider has a profile-defined safe operating band.

## 23.3 Overspeed

If speed exceeds the glider's movement-safe band:

- handling becomes less effective or more unstable;
- provider/item owner may receive stress/wear facts;
- UI warns;
- 30D may cap presentation-safe bank rates.

30D does not directly subtract item durability unless Item/Combat contracts authorise the transaction.

# 24. Launching, Deployment and Retraction

## 24.1 Deployment

Deployment uses:

1. capability check;
2. clearance check;
3. provider state check;
4. authoritative transition to `Glide/Deploying`;
5. bounded transition time;
6. glider collision/presentation profile activation;
7. movement solver switches to glide model.

## 24.2 Failed Deployment

Reasons include:

- insufficient clearance;
- provider unavailable;
- too close to surface;
- invalid body state;
- incompatible carried object;
- equipment damaged;
- action lock.

The player remains Airborne and continues falling; a failed deploy never pauses gravity.

## 24.3 Retraction

The player may retract/detach the glider where the provider permits.

Result:

- preserve current world velocity;
- transition to Airborne;
- 30D free-fall solver resumes.

# 25. Landing a Glider

## 25.1 Landing Approach

A valid landing requires:

- reachable support;
- acceptable slope;
- enough clearance for glider/body;
- acceptable ground-relative approach;
- no obstructing voxel/structure;
- provider landing state.

## 25.2 Flare

A simple flare input/state may temporarily trade speed for lower descent rate near landing.

It is not a guaranteed safe-land button.

## 25.3 Rough Landing

High lateral speed or poor slope may produce:

- hard/severe impact exposure;
- stumble/recovery;
- collision with obstacle;
- glide collapse;
- continued slide/fall.

Set 29 owns resulting injuries.

## 25.4 Emergency Drop

The player can release the glider and transition to free fall if a landing approach becomes impossible.

# 26. Glider Equipment and Item-System Handoff

30D defines an `AerialEquipmentFacet`.

Suggested fields:

```text
item_definition_id
aerial_capability_ids[]
glider_profile_id?
controlled_descent_profile_id?
deployment_clearance_profile
compatible_body_profiles[]
equipment_conflicts[]
movement_load_class
provider_state_ref
presentation_socket_role
```

Items owns:

- item ID/name;
- rarity;
- materials;
- recipe;
- durability;
- repair;
- price;
- enchantments;
- inventory/equipment rules.

30D consumes an already-resolved provider state.

# 27. Wind and Atmospheric Movement Fields

30D does not simulate weather. It samples authoritative environment truth.

## 27.1 Required Wind Inputs

A movement field may expose:

- mean air velocity;
- gust contribution;
- vertical air component;
- turbulence band;
- density/atmosphere class;
- extraordinary-force modifiers;
- field source and revision;
- knowledge/forecast confidence where presentation needs it.

## 27.2 Height Sampling

Where the environment owner supports wind by height, 30D samples at the mover's current altitude/position.

A glider above a cliff may experience different air velocity from the same player standing in shelter below.

## 27.3 Grounded Strong Wind

30D may apply authoritative external displacement to a grounded mover only when the environment field exceeds the ground-movement force threshold.

30B remains responsible for ground collision and locomotion response.

Set 29 owns cold/exposure consequences.

# 28. Updrafts, Thermals, Downdrafts and Windways

## 28.1 Updraft

Updrafts add air motion toward Local Up.

For gliders they may:

- reduce sink;
- maintain altitude;
- create gradual climb if field strength exceeds sink.

For free-falling players they may:

- reduce descent;
- alter trajectory;
- improve controlled descent;
- rarely reverse descent if the authoritative field is very strong.

## 28.2 Thermals

Thermals are a content/environment source category, not a separate physics engine.

They should be:

- spatially bounded;
- readable through world cues where discoverable;
- affected by environment rules;
- route-plannable at suitable knowledge levels.

## 28.3 Downdrafts

Downdrafts increase effective descent and may make an otherwise safe glide dangerous.

## 28.4 Windways

Windways are persistent/semi-persistent aerial corridors such as those expected in sky-realm content.

They can expose:

- direction;
- speed band;
- vertical profile;
- stability;
- entry/exit zones;
- hazard/turbulence class;
- forecast/knowledge confidence.

30H uses these for route accessibility/time. 30D executes local movement through them.

# 29. Gusts, Turbulence and Severe-Weather Movement

## 29.1 Gusts

Gusts are short-lived environmental vector changes.

30D applies the authoritative gust vector with mover/profile response.

## 29.2 Turbulence

Turbulence should create:

- control variation;
- small trajectory disturbance;
- increased landing difficulty;
- presentation feedback.

It should not become random input cancellation.

## 29.3 Severe Weather

Storms may create:

- high wind;
- turbulence;
- downdrafts/updrafts;
- low visibility;
- lightning/other hazards owned elsewhere.

30D owns only physical movement response.

## 29.4 Fairness Rule

Ordinary settings prohibit untelegraphed, unavoidable aerial insta-kill movement events.

Harsh settings may reduce warning/confidence, not remove all counterplay.

# 30. Gravity Anomalies, Buoyancy and Extraordinary Fields

Realm/magic/environment owners may expose extraordinary fields such as:

- low gravity;
- inverted gravity;
- radial gravity;
- buoyancy;
- storm lift;
- void drag;
- arcane repulsion;
- floating-island local fields.

30D consumes the field snapshot and resolves movement.

## 30.1 Field Priority

Overlapping fields use the Set 30 / environment priority contract.

A local dungeon gravity volume may override realm default.

A temporary spell field may modify rather than replace gravity if the spell definition says so.

## 30.2 No Decorative Levitation

A floating visual effect, particle volume or animated island does not alter player movement unless an authoritative field provider exists.

# 31. Aerial Assist Provider Interface

30D supports future non-mount player aerial assistance without owning the spell/item.

## 31.1 Provider Capabilities

Possible provider outputs:

- lift acceleration;
- vertical speed cap;
- thrust vector limit;
- hover target support;
- turn/steering multiplier;
- deployment/activation state;
- maximum duration/charge state exposed by owner;
- environment compatibility;
- failure reason.

## 31.2 Powered Free Flight

Powered free flight is **not baseline Core locomotion**.

If later approved, a provider can grant:

`aerial.flight.self_powered`

30D executes the physical movement envelope; Magic/Item/Progression owns access and cost.

Flying mounts remain 30E.

# 32. Magic, Equipment and Infrastructure Aerial Integration

## 32.1 Magic

Magic may provide:

- slow fall;
- wind push;
- lift;
- hover;
- air dash;
- gravity modification;
- temporary glider enhancement.

Magic owns:

- school;
- spell;
- mana;
- cooldown;
- cast validity;
- research;
- faction/legal consequences.

30D owns only authorised movement response.

## 32.2 Infrastructure

Structures may provide:

- launch towers;
- wind tunnels;
- updraft vents;
- glider docks;
- safety nets;
- gravity anchors;
- landing platforms.

The structure system owns construction/operation. 30D consumes movement-provider markers and active state.

# 33. Combat Launches, Knockback and Mid-Air Interruption

Combat/creatures/magic may submit an external impulse or launch command.

30D receives:

- impulse/velocity change;
- source;
- authority;
- action tags;
- special constraints;
- movement-lock state.

It does not calculate attack damage.

## 33.1 Airborne Combat

Combat may allow attacks while:

- falling;
- gliding;
- controlled descent.

30D may receive action-specific movement caps/locks.

## 33.2 Glide Interruption

A hit/status may:

- preserve glide;
- force stall;
- detach glider;
- restrict steering;
- force free fall;

only if the owning combat/equipment/status result explicitly requests it.

# 34. Structures, Skylands and Blueprint Integration

## 34.1 Aerial Structure Markers

Blueprints/structures may expose:

- glider launch point;
- landing platform;
- wind sock / observation point;
- aerial route entry;
- updraft provider;
- emergency descent zone;
- safety net;
- grapple/rope connection;
- flying-mount dock (30E);
- airship berth (maritime/future aerial vessel owner).

## 34.2 Validation

A launch/landing structure should validate:

- clearance;
- approach corridor;
- obstacle height;
- safe exit;
- expected movement profile;
- prevailing/environment source binding where required;
- emergency fallback.

## 34.3 Skylands

Skyland content may use layered fall routes.

A fall may lead to:

- lower island;
- cloud sea;
- glider route;
- portal/field;
- water;
- true lethal abyss.

World/realm content owns the topology. 30D executes each movement transition.

# 35. Route Accessibility and Aerial Travel Interfaces

30H owns route accessibility and travel-time planning.

30D exposes local aerial segment data:

- required capability;
- minimum launch height;
- landing requirement;
- windway profile;
- expected glide ratio band;
- gravity field;
- hazard class;
- current route-open state;
- emergency exits.

## 35.1 Glide Route Reachability

A route planner estimates whether a glider can cross a segment from:

- available altitude;
- expected air/wind field;
- glider profile;
- landing altitude;
- known uncertainty;
- current provider state.

The estimate must surface uncertainty when forecast/knowledge is limited.

# 36. First-Person Camera and Body Presentation

First-person uses the same connected body/head-anchor direction established in 30B.

## 36.1 Falling

Default camera:

- remains player-controlled;
- preserves horizon/local-up readability;
- does not force tumbling;
- may use subtle speed cues.

## 36.2 Gliding

The camera may:

- lean slightly with bank;
- shift FOV modestly with airspeed;
- use velocity look-ahead;
- show glider edges/body depending on equipment design.

All effects are independently reducible.

## 36.3 Altered Gravity

Camera orientation should not instantly snap to new Local Up unless the field definition demands a hard transition.

A comfort blend is preferred where gameplay allows.

# 37. Third-Person Camera and Aerial Framing

Third-person should show:

- player/glider silhouette;
- landing approach;
- terrain below/ahead;
- turn direction;
- major hazards.

## 37.1 Glide Camera

Default:

- modest trailing look-ahead;
- camera distance expands slightly with speed where space allows;
- obstruction/collision still works;
- bank does not spin the horizon excessively.

## 37.2 Fall Camera

The camera follows the authoritative player, not a cinematic fall spline.

Players retain aim/look control unless another action owns it.

# 38. UI, Warnings, Knowledge and Feedback

Normal airborne play should remain world-first.

## 38.1 Contextual Elements

Possible HUD cues:

- glide active;
- approximate airspeed band;
- stall warning;
- dangerous sink/landing warning;
- wind direction/strength assist;
- updraft indicator;
- controlled-descent state;
- provider failure;
- altered-gravity notice when known.

Exact numeric instrumentation may require player settings/equipment/knowledge.

## 38.2 Reason Codes

Examples:

- `Glider cannot deploy - blocked`;
- `Glider unavailable`;
- `Too close to ground`;
- `Stall`;
- `Severe downdraft`;
- `Landing area blocked`;
- `Aerial movement restricted`;
- `Gravity field unstable`;
- Set 29-owned impact/injury reasons after landing.

# 39. Accessibility and Motion Comfort

## 39.1 Supported Assists

- reduced/zero camera bank;
- reduced/zero airspeed FOV change;
- reduced glide camera lag;
- stable horizon;
- stronger stall warning;
- predicted landing marker;
- stronger updraft/wind indicators;
- simplified glider steering;
- auto-level assist;
- optional flare assist;
- slower glide-response sensitivity;
- controller target/route assist where applicable;
- extended controlled-descent deployment window;
- optional reduced environmental displacement as a world/accessibility setting when environment owner permits;
- fall-risk warnings;
- camera shake reduction.

## 39.2 Physics Boundary

Presentation assists do not remove wind or gravity.

A gameplay accessibility option that changes actual force must be an explicit authoritative world/player rule exposed by the environment/movement systems so multiplayer remains consistent.

# 40. Multiplayer Authority, Prediction and Reconciliation

## 40.1 Authority

Server/host owns:

- position/velocity;
- gravity field selection;
- environment field snapshot revision;
- Glide/Controlled Descent state;
- provider activation validation;
- glider handling result;
- landing contact;
- physical impact exposure;
- air-to-water handoff;
- external impulses.

## 40.2 Client Prediction

Clients may predict:

- ordinary free fall;
- air steering;
- glider steering;
- deployment transition;
- local wind using replicated field snapshot.

Server validates provider/environment revisions.

## 40.3 Environment Snapshot Replication

Do not replicate every weather sample every frame.

Replicate/derive:

- field IDs/revisions;
- region/cell state;
- local deterministic sample inputs;
- exceptional corrections.

This preserves deterministic local sampling where practical.

## 40.4 Anti-Cheat

Server rejects:

- impossible upward acceleration without provider/field;
- invalid glide state;
- glide ratio beyond profile/environment tolerance;
- client-only wind cancellation;
- teleport landing;
- falsified safe impact speed;
- flight capability not granted by an authoritative provider.

# 41. Persistence, Save/Load and Recovery

## 41.1 Persist

When saving while airborne/gliding, persist enough to reconstruct:

- transform;
- velocity;
- movement mode/state;
- gravity/environment provider references;
- glide/descent provider ID/state reference;
- fall exposure start facts;
- safe-position reference;
- moving-frame attachment if relevant.

## 41.2 Load Revalidation

On load:

1. resolve mover profile;
2. resolve world/realm gravity;
3. resolve environment field;
4. resolve active provider;
5. validate collision/clearance;
6. validate current mode;
7. resume fall/glide if safe;
8. otherwise detach invalid provider and continue Airborne;
9. use safe-position recovery only when reconstruction would place the player inside invalid geometry or an unrecoverable state.

Saving in the air is not converted into a free safe landing.

# 42. Registry and Data Definitions

## 42.1 Airborne Movement Profile

Suggested ID:

`movement.airborne.player.humanoid_standard`

Fields:

- gravity response class;
- base drag profile;
- terminal speed profile;
- air-control profile;
- landing classification profile;
- supported controlled-descent classes;
- supported glide classes;
- environment force response;
- camera profile;
- prediction profile.

## 42.2 Environment Response Profile

Fields:

- wind response multiplier;
- gust filtering;
- turbulence response;
- gravity-transition response;
- external force cap policy;
- grounded strong-wind threshold;
- air density modifier hooks;
- realm compatibility.

## 42.3 Landing Profile

Fields:

- impact severity bands;
- posture/approach quality bands;
- special surface response hooks;
- hard-landing recovery duration;
- Set 29 handoff profile ID;
- animation/camera event references.

# 43. Balance-Draft Baseline Values

These values are **starting targets for prototype feel**, not final balance.

## 43.1 Default Overworld Airborne

| Parameter | Balance-Draft Starting Target |
| --- | ---: |
| Gravity magnitude | ~18 m/s² |
| Humanoid terminal descent speed | ~52-58 m/s |
| Ordinary falling air control | approximately 45-55% of ground steering response |
| Strong-wind grounded displacement threshold | profile/environment test value, not active in ordinary breeze |
| Landing soft/normal upper impact band | ~7.5 m/s normal-relative impact |
| Hard landing band | ~7.5-11.5 m/s |
| Severe landing band | ~11.5-17.5 m/s |
| Extreme landing band | > ~17.5 m/s |
| Hard-landing movement recovery | ~0.20-0.45 s before Set 29 modifiers |

Impact bands are physical classification only.

## 43.2 Basic Glider

| Parameter | Balance-Draft Starting Target |
| --- | ---: |
| Efficient airspeed | ~9-11 m/s |
| Normal forward glide band | ~7-13 m/s |
| Still-air sink rate near efficient speed | ~2.1-2.8 m/s |
| Efficient glide ratio | roughly 4:1 to 5:1 |
| Stall airspeed | ~5.5-6.5 m/s |
| Safe normal dive band | up to ~16-18 m/s |
| Minimum deployment clearance/time | tuned to permit emergency use but not zero-height abuse; initial target ~1.0 s before expected impact |
| Normal bank limit | ~35-45 degrees gameplay target |
| Turn response | moderate; not instant camera-yaw steering |
| Flare window | final ~0.5-1.2 s of landing approach depending on profile |

## 43.3 Controlled Descent

| Provider | Starting Movement Target |
| --- | --- |
| Basic slow-fall | cap descent around ~4-6 m/s |
| Emergency canopy | cap around ~5-7 m/s with low horizontal control |
| Strong magic/buoyancy | provider-defined; may reduce descent below ordinary landing band |
| Updraft interaction | additive environment-relative; may maintain/climb only when field exceeds sink/lift requirement |

# 44. Godot/Summer Engine Implementation Direction

## 44.1 Recommended Runtime Services

```text
AirborneMovementController
GravityFieldResolver
EnvironmentalMovementFieldSampler
AerialForceResolver
FallExposureTracker
LandingResolver
ControlledDescentController
GlideController
AerialProviderAdapter
AirborneNetworkAdapter
AirborneDebugService
```

## 44.2 Physics Loop

Authoritative movement runs in fixed physics steps.

Recommended flow:

1. sample authoritative gravity/environment snapshot;
2. consume player input/provider state;
3. calculate air-relative velocity;
4. apply gravity;
5. apply drag;
6. apply environment force;
7. apply approved steering/provider lift/thrust;
8. sweep movement/collision;
9. update mode/state;
10. detect landing/aquatic transition;
11. publish snapshots/events.

## 44.3 Godot Direction

Use project-owned movement wrappers around `CharacterBody3D` / collision queries.

Avoid relying on:

- frame-rate dependent `_process` displacement;
- animation transforms;
- visual particle velocities;
- RigidBody-only player authority;
- per-frame networked weather vectors.

## 44.4 Glider Solver

A deterministic reduced-order glider model is preferred:

- target lift/drag from airspeed and pitch state;
- bounded bank/turn response;
- explicit stall curve;
- field-relative wind;
- collision sweeps.

This is easier to test/network than unrestricted rigid-body aerodynamics.

## 44.5 Debug Views

Developer-only overlays should show:

- gravity vector;
- local-up;
- air vector;
- air-relative velocity;
- sink rate;
- glide state;
- stall margin;
- active environment field;
- landing contact/impact speed;
- predicted physical severity;
- provider source/revision.

# 45. Prototype Laboratories and Acceptance Tests

## 45.1 Fall Tower Lab

Build a controlled voxel tower with:

- 1 m;
- 2 m;
- 3 m;
- 5 m;
- 8 m;
- 12 m;
- long-fall platforms.

Verify:

- velocity progression;
- terminal behaviour;
- impact classification;
- no damage calculated in 30D;
- Set 29 request emitted once per landing.

## 45.2 Moving-Surface Landing Lab

Land on:

- static stone;
- descending lift;
- rising lift;
- moving cart platform where supported;
- sloped roof.

Verify relative impact, not world speed alone.

## 45.3 Controlled Descent Lab

Use synthetic providers:

- slow fall;
- canopy;
- buoyancy.

Verify:

- provider owns availability;
- 30D owns motion;
- failure returns to free fall;
- deployment cannot freeze gravity.

## 45.4 Basic Glider Lab

Test:

- cliff deploy;
- sprint jump deploy;
- stall;
- dive;
- bank;
- flare;
- rough landing;
- release to free fall;
- insufficient deployment clearance.

## 45.5 Wind Lab

Test:

- still air;
- crosswind;
- headwind;
- tailwind;
- updraft;
- downdraft;
- gust;
- turbulence.

Verify world movement changes while air-relative glider logic remains coherent.

## 45.6 Aetheric/Realm Gravity Lab

Synthetic fields:

- 0.5g;
- 1.5g;
- sideways gravity;
- blended gravity shift;
- inverted local volume;
- windway.

Verify all movement uses Local Up and field revision.

## 45.7 Dynamic Environment Lab

Change environment field during glide:

- calm -> gust;
- updraft -> downdraft;
- gravity normal -> low;
- extraordinary field enabled/disabled.

No stale field should persist past revision.

## 45.8 Combat Impulse Lab

Test:

- knockback off ledge;
- explosion launch;
- hit while gliding;
- glider detach;
- landing while combat action active.

Combat owns the cause; 30D owns physical movement.

## 45.9 Water Entry Lab

Fall/glide into water at varied speeds/angles.

Verify:

- 30D sends entry facts;
- 26E assumes aquatic movement;
- no duplicate current/swim rules.

## 45.10 Multiplayer Lab

Under latency/packet loss:

- free fall;
- glider deploy;
- crosswind turn;
- stall recovery;
- landing;
- environment field boundary.

No client may generate unsupported lift.

# 46. Handoff to 30E, 30H, 30I and 30J

## 46.1 30E - Mounts

30E receives:

- gravity/environment field interface;
- airborne/glide vocabulary where flying mounts need shared environmental context;
- wind/updraft movement-field samples;
- landing/ground-contact concepts where appropriate.

30E owns flying-mount control and creature-body flight movement. It does not reuse the player glider profile as the mount flight model.

## 46.2 30H - Routes

30H consumes:

- glider capability bands;
- launch/landing requirements;
- windway segments;
- environmental route state;
- expected aerial traversal cost/time;
- uncertainty.

## 46.3 30I - AI / Multiplayer

30I consumes:

- environmental movement fields;
- airborne transition links;
- safe landing nodes;
- glide/aerial capability routes where NPCs support them.

## 46.4 30J - Final Registries

30J freezes:

- airborne profiles;
- landing profiles;
- environment-field interfaces;
- glider definitions;
- provider contracts;
- validation schemas;
- reason codes.

# 47. Main-Document Integration Register

| Existing Document | Required Integration |
| --- | --- |
| 02 | Progression may grant glider/aerial capabilities but must not duplicate airborne physics. |
| 03 | Blocks/surfaces expose landing and movement-field facets where relevant. |
| 04 | Add approved glider/controlled-descent item facets and final item roster. |
| 05 | Add recipes for approved glider/descent equipment/infrastructure only. |
| 09 | Magic exposes movement providers; Set 30 executes physical displacement. |
| 11 | World/environment exposes movement-facing wind/gravity/field snapshots. |
| 14 / 24D | Realm laws provide gravity, wind, buoyancy and movement modifiers through the shared field contract. |
| 16 | Combat submits impulses and consumes airborne state; Set 29 owns injuries. |
| 17 | UI/settings consume airborne/glide state, warnings and camera signals. |
| 19 / 20 / 24C | Structures/skylands expose launch, landing, windway and emergency descent markers. |
| 22F/H | Animation/body profiles consume/publish through Set 30 authority. |
| 25 | Capability/registry/migration validation includes aerial providers and movement fields. |
| 26D | 30D consumes atmospheric fields and does not duplicate weather. |
| 26E | Air-to-water handoff remains explicit; aquatic movement remains protected pending XSI-30-001. |
| 30A/B/C | Parent architecture and entry/release contracts remain binding. |

# 48. Cross-Set Interface Amendments

## XSI-30-001 - Water Locomotion Ownership Reconciliation

**Status:** Carried forward; pending explicit approval.

30D owns airborne movement until aquatic-entry handoff. It does not assume ownership of swimming/diving. At water contact it sends entry velocity/angle/fall context to 26E and yields aquatic movement according to the existing integration boundary.

## XSI-30-002 - Set 29 Movement Exertion Decision Contract

**Status:** Carried forward.

30D uses XSI-30-002 only for aerial actions that require physiological exertion, such as:

- strenuous controlled descent;
- manual glider handling under load if the provider declares it;
- sustained body-controlled aerial assistance.

Pure free fall does not create a stamina request merely because the player is airborne.

## XSI-30-003 - Set 28 Formation Intent Contract

**Status:** Carried forward from 30A; not used directly by 30D.

No change.

## XSI-30-004 - Environmental Movement Field Contract

**Status:** New interface requirement for final integration; no ownership transfer.

30D requires a universal read-only movement-facing environment snapshot so terrestrial world/weather systems, 26D atmospheric systems, realm laws and authorised magical fields can supply movement truth without Set 30 re-simulating their domains.

Recommended fields:

```text
field_snapshot_id
source_owner_id
source_definition_ids[]
revision
timestamp

gravity_vector
local_up_vector
air_velocity
gust_vector
vertical_air_component
turbulence_band
atmosphere_density_band

external_force_vectors[]
buoyancy_modifier
drag_modifier
movement_visibility/knowledge_band

spatial_bounds_or_sample_key
priority
blend_policy
reason/source_tags[]
```

Ownership remains:

- weather/climate generation: environment owner;
- realm-law identity: Documents 14/24D;
- marine atmospheric generation: 26D;
- magical effect/cost: Document 09;
- movement response: Set 30.

## XSI-30-005 - Set 29 Fall Impact Consequence Contract

**Status:** New interface requirement for Set 29 review; no ownership transfer.

30D requires a physical-impact request that lets Set 29 calculate health/injury consequences without Set 30 owning those systems.

30D sends:

```text
impact_event_id
entity_id
impact_velocity_world
impact_speed_normal
impact_speed_tangential
impact_normal
gravity_profile_id
fall_duration
maximum_descent_speed
landing_quality
landing_posture
surface_response_class
surface_tags[]
active_descent_provider_id?
equipment_movement_protection_tags[]
realm/environment_tags[]
source_context
```

Set 29 returns:

```text
biological_result_id
health_consequence_ref
injury_state_changes[]
incapacitation_state?
movement_restrictions[]
movement_modifiers[]
recovery_state_ref?
reason_codes[]
source_state_revision
```

30D never calculates the returned biological result.

No new Set 27 or Set 28 interface is required by 30D.

# 49. Open Decisions and Deferred Questions

1. Final Overworld gravity after packaged controller/glider testing.
2. Final fall severity thresholds after Set 29 injury design is complete.
3. Whether landing-quality/posture meaningfully modifies Set 29 outcomes or is primarily presentation.
4. Final default terminal descent speed.
5. Final player-air-control percentage after combat/traversal testing.
6. Which glider item families are Core, Alpha or later.
7. Whether the first glider is a rigid frame, cloth wing, enchanted cloak or culture-neutral base family.
8. Final efficient glide ratio and sink rate after world-scale testing.
9. Whether basic gliders support mid-air redeploy after manual retraction.
10. Whether very low-altitude emergency glider deployment is allowed.
11. Whether auto-flare is default accessibility-only or available as a general assist.
12. Whether basic glider item damage can result from overspeed/rough landing; Item/Combat own durability consequence.
13. Whether player controlled-descent equipment beyond gliders is needed for Core Production.
14. Whether self-powered personal flight is ever a normal player capability or remains rare Magic/endgame content.
15. Whether persistent Overworld thermals/windways are common enough for route planning or mostly special-region content.
16. Final interface between terrestrial weather replacement work and 26D atmospheric-region contracts.
17. Final rules for strong wind displacing grounded players in harsh storms.
18. Whether sky-realm falls can cross unloaded altitude layers without loading the full vertical column; technical prototype required.
19. Whether high-altitude oxygen/temperature remains exclusively Set 29 environment exposure.
20. Final first-person horizon behaviour in sideways/inverted gravity.
21. Final prediction model for gliding in dynamic wind.
22. Whether NPC humanoids can use player-style gliders in Core or later.
23. Resolution of XSI-30-001.
24. Final XSI-30-002 schema.
25. Approval/finalisation of XSI-30-004.
26. Approval/finalisation of XSI-30-005.

# Appendix A. Airborne State Transition Matrix

| From | Trigger | To | Primary Owner Check | Failure / Alternative |
| --- | --- | --- | --- | --- |
| Ground | jump launch | Airborne/Rising | 30B | Remain Ground |
| Traverse | drop/detach | Airborne | 30C -> 30D | Safe fallback |
| Airborne/Rising | apex | Airborne/Falling | 30D | N/A |
| Airborne | glide deploy | Glide/Deploying | 30D + provider | Continue Airborne |
| Glide/Deploying | deployment valid | Glide/Stable | 30D | Airborne |
| Glide | stall condition | Glide/Stall | 30D | Recover / Airborne |
| Glide | retract/failure | Airborne | provider + 30D | Continue Glide if denied |
| Airborne/Glide | controlled descent provider | Airborne/ControlledDescent | 30D + provider | Current state |
| Airborne/Glide | support contact | LandingPending | 30D | Continue state |
| LandingPending | support valid | Ground | 30D -> Set29 -> 30B | Bounce/fall/other owner |
| Airborne/Glide | water entry | Aquatic | 26E handoff | Remain Airborne if invalid |
| Any Airborne | invalid field/provider | Airborne default | 30D | Safe recovery if collision invalid |

# Appendix B. Environmental Movement Field Snapshot

```text
EnvironmentalMovementFieldSnapshot
snapshot_id
sample_tick
sample_position
source_owner_id
source_definition_ids[]
revision

gravity_vector
local_up_vector

mean_air_velocity
gust_velocity
vertical_air_velocity
turbulence_band
atmosphere_density_band

external_force_vectors[]
buoyancy_modifier
drag_modifier

priority
blend_policy
spatial_key
knowledge_band
source_tags[]
```

# Appendix C. Fall Impact Exposure Template

```text
FallImpactExposure
impact_event_id
entity_id
tick

fall_start_transform
fall_duration
gravity_profile_id
environment_snapshot_id

impact_velocity_world
impact_speed_normal
impact_speed_tangential
impact_normal

maximum_descent_speed
landing_quality
landing_posture

surface_definition_id
surface_response_class
surface_tags[]
support_velocity

active_descent_provider_id?
aerial_equipment_profile_ids[]
movement_protection_tags[]
source_context

set29_request_revision
```

# Appendix D. Controlled Descent Provider Template

```text
controlled_descent_profile_id
provider_family
required_capabilities[]

deployment_modes[]
minimum_deployment_clearance
deployment_time
max_descent_speed
horizontal_control_profile
turn_control_profile
wind_response_profile
gravity_response_profile

cancel_policy
failure_policy
environment_compatibility[]
camera_profile_id
animation_family_id
prediction_class
external_owner_ref
version
```

# Appendix E. Glider Profile Template

```text
glider_profile_id
supported_body_profiles[]
required_capabilities[]

efficient_airspeed
stall_airspeed
normal_speed_band
safe_dive_speed
overspeed_band

base_sink_rate
efficient_glide_ratio
lift_curve_profile
drag_curve_profile
pitch_response
bank_response
turn_response

deployment_profile_id
landing_profile_id
flare_profile_id
wind_response_profile
turbulence_response_profile

equipment_state_binding
camera_profile_id
animation_profile_id
network_prediction_profile_id

version
```

# Appendix F. Aerial Assist Provider Template

```text
aerial_assist_provider_id
external_owner_type
external_owner_ref
capability_ids[]

lift_acceleration_limit
thrust_vector_limit
vertical_speed_limit
horizontal_speed_limit
hover_policy
turn_response_modifier
gravity_compensation_limit

activation_state
remaining_duration_or_charge_band
environment_compatibility[]
failure_reason_codes[]
cost_state_ref

movement_authority = set30
gameplay_cost_authority = external_owner
revision
```

# Appendix G. Airborne/Glide Runtime Record

```text
entity_id
movement_mode
movement_state

position
rotation
velocity_world
velocity_air_relative

gravity_snapshot_id
environment_snapshot_id
local_up

fall_exposure_id?
max_descent_speed

active_controlled_descent_provider_id?
active_glider_profile_id?
active_aerial_assist_provider_id?

glide_airspeed?
glide_sink_rate?
stall_margin?
tether_or_release_context?

landing_candidate?
safe_position_ref

prediction_sequence
authoritative_tick
```

# Appendix H. Reason-Code Catalogue

| Code | Meaning | Owner |
| --- | --- | --- |
| airborne.gravity.invalid | No valid gravity resolution; fallback profile used. | Set 30 / environment integration |
| airborne.field.changed | Active environment field revision changed. | Set 30 |
| airborne.landing.no_support | Contact did not produce valid support. | Set 30 |
| airborne.landing.hard | Physical hard landing classification. | Set 30 |
| airborne.landing.severe | Physical severe landing classification. | Set 30 |
| airborne.impact.consequence | Biological result applied after impact. | Set 29 |
| descent.provider.unavailable | Controlled-descent provider unavailable. | External provider |
| descent.deploy.blocked | Deployment clearance invalid. | Set 30 |
| glide.deploy.blocked | Glider deployment corridor blocked. | Set 30 |
| glide.provider.invalid | Glider provider missing/damaged/incompatible. | External provider |
| glide.stall | Air-relative state below supported lift band. | Set 30 |
| glide.overspeed | Glider exceeds safe movement band. | Set 30 |
| glide.landing.blocked | Intended landing support/clearance invalid. | Set 30 |
| environment.wind.strong | Field is producing significant displacement. | Environment owner + Set 30 |
| environment.downdraft.severe | Strong authoritative downward air field. | Environment owner |
| environment.gravity.changed | Local gravity field/law changed. | Environment/realm owner |
| aerial.assist.denied | External aerial provider did not authorise use. | External owner |
| airborne.recovery.safe_position | Invalid state required safe-position recovery. | Set 30 |

# Appendix I. Multiplayer Airborne Contract

## Client -> Authority

```text
player_id
input_sequence
client_tick

movement_mode
move_intent
look_basis

glide_deploy_requested
glide_retract_requested
glide_pitch_input
glide_turn_input
flare_requested

controlled_descent_requested
aerial_provider_request_id?

local_environment_snapshot_id
local_environment_revision
local_provider_revision
predicted_state_hash
```

## Authority -> Client

```text
server_tick
ack_input_sequence

position
rotation
velocity_world
movement_mode
movement_state

gravity_snapshot_id
environment_snapshot_id
environment_revision

active_glider_profile_id?
active_descent_provider_id?
active_aerial_assist_provider_id?

glide_airspeed?
sink_rate?
stall_state?

landing_state?
impact_event_id?
reason_codes[]
```

# Appendix J. Acceptance and Regression Matrix

| Area | Acceptance Evidence |
| --- | --- |
| Free Fall | Gravity/drag deterministic; momentum preserved; no frame-rate dependence. |
| Landing | Contact uses relative impact; physical severity emitted without health calculation. |
| Set 29 Boundary | XSI-30-005 receives physical impact facts; injury/health remain external. |
| Controlled Descent | Provider reduces descent only when authorised; failure resumes fall. |
| Glide | Height converts to travel; still-air glide loses altitude; no flat-ground free takeoff. |
| Stall | Low airspeed/excess pitch causes readable stall and recoverable response. |
| Wind | Head/cross/tail wind affects world travel from authoritative environment field. |
| Updraft | Can reduce sink/enable climb only when field physically supports it. |
| Realm Gravity | Local Up/gravity variations affect all airborne calculations consistently. |
| Weather Boundary | 30D samples environment; it never creates weather/storm truth. |
| Magic Boundary | Spell/provider grants movement capability/cost; Set 30 executes movement. |
| Water Boundary | Air-to-water entry hands off to 26E without duplicate aquatic physics. |
| Camera | First/third person remain readable with motion-reduction options. |
| Multiplayer | Server rejects unsupported lift/glide/flight; environment revisions reconcile. |
| Persistence | Airborne/glide saves resume safely without free landing exploit. |
| 30B Regression | Jump launch/basic air steering continue to work. |
| 30C Regression | Grapple/ledge/rope release velocity transfers correctly into 30D. |
| Skyland Use | Layered falls, windways and variable gravity can be expressed without realm-specific Set 30 code. |

# END OF DOCUMENT 30D
